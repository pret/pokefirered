#include "global.h"
#include "battle_anim.h"
#include "random.h"
#include "scanline_effect.h"
#include "task.h"
#include "trig.h"

static void AnimBonemerangProjectile(struct Sprite *sprite);
static void AnimBoneHitProjectile(struct Sprite *sprite);
static void AnimDirtScatter(struct Sprite *sprite);
static void AnimMudSportDirt(struct Sprite *sprite);
static void AnimFissureDirtPlumeParticle(struct Sprite *sprite);
static void AnimDigDirtMound(struct Sprite *sprite);
static void AnimBonemerangProjectileStep(struct Sprite *sprite);
static void AnimBonemerangProjectileEnd(struct Sprite *sprite);
static void AnimMudSportDirtRising(struct Sprite *sprite);
static void AnimMudSportDirtFalling(struct Sprite *sprite);
static void sub_80B8ED4(u8 taskId);
static void sub_80B908C(u8 taskId);
static void sub_80B92B8(u8 useBg1, s16 y, s16 endY);
static void sub_80B912C(u8 taskId);
static void sub_80B91B0(u8 taskId);
static void AnimFissureDirtPlumeParticleStep(struct Sprite *sprite);
static void sub_80B9584(u8 taskId);
static void sub_80B967C(u8 taskId);
static void sub_80B9760(struct Task *task);
static void sub_80B98A8(u8 taskId);

static const union AffineAnimCmd sAffineAnim_Bonemerang[] =
{
    AFFINEANIMCMD_FRAME(0x0, 0x0, 15, 1),
    AFFINEANIMCMD_JUMP(0),
};

static const union AffineAnimCmd sAffineAnim_SpinningBone[] =
{
    AFFINEANIMCMD_FRAME(0x0, 0x0, 20, 1),
    AFFINEANIMCMD_JUMP(0),
};

static const union AffineAnimCmd *const sAffineAnims_Bonemerang[] =
{
    sAffineAnim_Bonemerang,
};

static const union AffineAnimCmd *const sAffineAnims_SpinningBone[] =
{
    sAffineAnim_SpinningBone,
};

const struct SpriteTemplate gBonemerangSpriteTemplate =
{
    .tileTag = ANIM_TAG_BONE,
    .paletteTag = ANIM_TAG_BONE,
    .oam = &gOamData_AffineNormal_ObjNormal_32x32,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = sAffineAnims_Bonemerang,
    .callback = AnimBonemerangProjectile,
};

const struct SpriteTemplate gSpinningBoneSpriteTemplate =
{
    .tileTag = ANIM_TAG_BONE,
    .paletteTag = ANIM_TAG_BONE,
    .oam = &gOamData_AffineNormal_ObjNormal_32x32,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = sAffineAnims_SpinningBone,
    .callback = AnimBoneHitProjectile,
};

const struct SpriteTemplate gSandAttackDirtSpriteTemplate =
{
    .tileTag = ANIM_TAG_MUD_SAND,
    .paletteTag = ANIM_TAG_MUD_SAND,
    .oam = &gOamData_AffineOff_ObjNormal_8x8,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimDirtScatter,
};

static const union AnimCmd sAnim_MudSlapMud[] =
{
    ANIMCMD_FRAME(1, 1),
    ANIMCMD_END,
};

static const union AnimCmd *const sAnims_MudSlapMud[] =
{
    sAnim_MudSlapMud,
};

const struct SpriteTemplate gMudSlapMudSpriteTemplate =
{
    .tileTag = ANIM_TAG_MUD_SAND,
    .paletteTag = ANIM_TAG_MUD_SAND,
    .oam = &gOamData_AffineOff_ObjNormal_16x16,
    .anims = sAnims_MudSlapMud,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimDirtScatter,
};

const struct SpriteTemplate gMudsportMudSpriteTemplate =
{
    .tileTag = ANIM_TAG_MUD_SAND,
    .paletteTag = ANIM_TAG_MUD_SAND,
    .oam = &gOamData_AffineOff_ObjNormal_16x16,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimMudSportDirt,
};

const struct SpriteTemplate gDirtPlumeSpriteTemplate =
{
    .tileTag = ANIM_TAG_MUD_SAND,
    .paletteTag = ANIM_TAG_MUD_SAND,
    .oam = &gOamData_AffineOff_ObjNormal_8x8,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimFissureDirtPlumeParticle,
};

const struct SpriteTemplate gDirtMoundSpriteTemplate =
{
    .tileTag = ANIM_TAG_DIRT_MOUND,
    .paletteTag = ANIM_TAG_DIRT_MOUND,
    .oam = &gOamData_AffineOff_ObjNormal_32x16,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimDigDirtMound,
};

// Moves a bone projectile towards the target mon, which moves like
// a boomerang. After hitting the target mon, it comes back to the user.
static void AnimBonemerangProjectile(struct Sprite *sprite)
{
    sprite->x = GetBattlerSpriteCoord(gBattleAnimAttacker, 2);
    sprite->y = GetBattlerSpriteCoord(gBattleAnimAttacker, 3);
    sprite->data[0] = 20;
    sprite->data[2] = GetBattlerSpriteCoord(gBattleAnimTarget, 2);
    sprite->data[4] = GetBattlerSpriteCoord(gBattleAnimTarget, 3);
    sprite->data[5] = -40;
    InitAnimArcTranslation(sprite);
    sprite->callback = AnimBonemerangProjectileStep;
}

static void AnimBonemerangProjectileStep(struct Sprite *sprite)
{
    if (TranslateAnimHorizontalArc(sprite))
    {
        sprite->x += sprite->x2;
        sprite->y += sprite->y2;
        sprite->y2 = 0;
        sprite->x2 = 0;
        sprite->data[0] = 20;
        sprite->data[2] = GetBattlerSpriteCoord(gBattleAnimAttacker, 2);
        sprite->data[4] = GetBattlerSpriteCoord(gBattleAnimAttacker, 3);
        sprite->data[5] = 40;
        InitAnimArcTranslation(sprite);
        sprite->callback = AnimBonemerangProjectileEnd;
    }
}

static void AnimBonemerangProjectileEnd(struct Sprite *sprite)
{
    if (TranslateAnimHorizontalArc(sprite))
        DestroyAnimSprite(sprite);
}

// Moves a bone projectile towards the target mon, starting right next to
// the target mon.
// arg 0: initial x pixel offset
// arg 1: initial y pixel offset
// arg 2: target x pixel offset
// arg 3: target y pixel offset
// arg 4: duration
static void AnimBoneHitProjectile(struct Sprite *sprite)
{
    InitSpritePosToAnimTarget(sprite, TRUE);
    if (GetBattlerSide(gBattleAnimAttacker) != B_SIDE_PLAYER)
        gBattleAnimArgs[2] = -gBattleAnimArgs[2];
    sprite->data[0] = gBattleAnimArgs[4];
    sprite->data[2] = GetBattlerSpriteCoord(gBattleAnimTarget, 2) + gBattleAnimArgs[2];
    sprite->data[4] = GetBattlerSpriteCoord(gBattleAnimTarget, 3) + gBattleAnimArgs[3];
    sprite->callback = StartAnimLinearTranslation;
    StoreSpriteCallbackInData6(sprite, DestroyAnimSprite);
}

// Moves a small dirt projectile towards the target mon.
// arg 0: initial x pixel offset
// arg 1: initial y pixel offset
// arg 2: duration
// arg 3: target x pixel offset
// arg 4: target y pixel offset
static void AnimDirtScatter(struct Sprite *sprite)
{
    u8 targetXPos, targetYPos;
    s16 xOffset, yOffset;

    InitSpritePosToAnimAttacker(sprite, 1);
    targetXPos = GetBattlerSpriteCoord2(gBattleAnimTarget, 2);
    targetYPos = GetBattlerSpriteCoord2(gBattleAnimTarget, 3);
    xOffset = Random() & 0x1F;
    yOffset = Random() & 0x1F;
    if (xOffset > 16)
        xOffset = 16 - xOffset;
    if (yOffset > 16)
        yOffset = 16 - yOffset;
    sprite->data[0] = gBattleAnimArgs[2];
    sprite->data[2] = targetXPos + xOffset;
    sprite->data[4] = targetYPos + yOffset;
    sprite->callback = StartAnimLinearTranslation;
    StoreSpriteCallbackInData6(sprite, DestroySpriteAndMatrix);
}

// Moves a particle of dirt in the Mud Sport animation.
// The dirt can either be rising upward, or falling down.
// arg 0: 0 = dirt is rising into the air, 1 = dirt is falling down
// arg 1: initial x pixel offset
// arg 2: initial y pixel offset
static void AnimMudSportDirt(struct Sprite *sprite)
{
    ++sprite->oam.tileNum;
    if (gBattleAnimArgs[0] == 0)
    {
        sprite->x = GetBattlerSpriteCoord(gBattleAnimAttacker, 2) + gBattleAnimArgs[1];
        sprite->y = GetBattlerSpriteCoord(gBattleAnimAttacker, 3) + gBattleAnimArgs[2];
        sprite->data[0] = gBattleAnimArgs[1] > 0 ? 1 : -1;
        sprite->callback = AnimMudSportDirtRising;
    }
    else
    {
        sprite->x = gBattleAnimArgs[1];
        sprite->y = gBattleAnimArgs[2];
        sprite->y2 = -gBattleAnimArgs[2];
        sprite->callback = AnimMudSportDirtFalling;
    }
}

static void AnimMudSportDirtRising(struct Sprite *sprite)
{
    if (++sprite->data[1] > 1)
    {
        sprite->data[1] = 0;
        sprite->x += sprite->data[0];
    }
    sprite->y -= 4;
    if (sprite->y < -4)
        DestroyAnimSprite(sprite);
}

static void AnimMudSportDirtFalling(struct Sprite *sprite)
{
    switch (sprite->data[0])
    {
    case 0:
        sprite->y2 += 4;
        if (sprite->y2 >= 0)
        {
            sprite->y2 = 0;
            ++sprite->data[0];
        }
        break;
    case 1:
        if (++sprite->data[1] > 0)
        {
            sprite->data[1] = 0;
            sprite->invisible ^= 1;
            if (++sprite->data[2] == 10)
                DestroyAnimSprite(sprite);
        }
        break;
    }
}

void AnimTask_DigDownMovement(u8 taskId)
{
    struct Task *task = &gTasks[taskId];

    if (gBattleAnimArgs[0] == 0)
        task->func = sub_80B8ED4;
    else
        task->func = sub_80B908C;
    task->func(taskId);
}

static void sub_80B8ED4(u8 taskId)
{
    u8 var0;
    struct Task *task = &gTasks[taskId];

    switch (task->data[0])
    {
    case 0:
        task->data[10] = GetAnimBattlerSpriteId(ANIM_ATTACKER);
        task->data[11] = GetBattlerSpriteBGPriorityRank(gBattleAnimAttacker);
        if (task->data[11] == 1)
        {
            task->data[12] = gBattle_BG1_X;
            task->data[13] = gBattle_BG1_Y;
        }
        else
        {
            task->data[12] = gBattle_BG2_X;
            task->data[13] = gBattle_BG2_Y;
        }
        var0 = GetBattlerYCoordWithElevation(gBattleAnimAttacker);
        task->data[14] = var0 - 32;
        task->data[15] = var0 + 32;
        if (task->data[14] < 0)
            task->data[14] = 0;
        gSprites[task->data[10]].invisible = TRUE;
        ++task->data[0];
        break;
    case 1:
        sub_80B92B8(task->data[11], task->data[14], task->data[15]);
        ++task->data[0];
        break;
    case 2:
        task->data[2] = (task->data[2] + 6) & 0x7F;
        if (++task->data[4] > 2)
        {
            task->data[4] = 0;
            ++task->data[3];
        }
        task->data[5] = task->data[3] + (gSineTable[task->data[2]] >> 4);
        if (task->data[11] == 1)
            gBattle_BG1_Y = task->data[13] - task->data[5];
        else
            gBattle_BG2_Y = task->data[13] - task->data[5];

        if (task->data[5] > 63)
        {
            task->data[5] = 120 - task->data[14];
            if (task->data[11] == 1)
                gBattle_BG1_Y = task->data[13] - task->data[5];
            else
                gBattle_BG2_Y = task->data[13] - task->data[5];

            gSprites[task->data[10]].x2 = 272 - gSprites[task->data[10]].x;
            ++task->data[0];
        }
        break;
    case 3:
        gScanlineEffect.state = 3;
        ++task->data[0];
        break;
    case 4:
        DestroyAnimVisualTask(taskId);
        gSprites[task->data[10]].invisible = TRUE;
        break;
    }
}

static void sub_80B908C(u8 taskId)
{
    u8 spriteId = GetAnimBattlerSpriteId(ANIM_ATTACKER);

    gSprites[spriteId].invisible = TRUE;
    gSprites[spriteId].x2 = 0;
    gSprites[spriteId].y2 = 0;
    if (GetBattlerSpriteBGPriorityRank(gBattleAnimAttacker) == 1)
        gBattle_BG1_Y = 0;
    else
        gBattle_BG2_Y = 0;
    DestroyAnimVisualTask(taskId);
}

void AnimTask_DigUpMovement(u8 taskId)
{
    struct Task *task = &gTasks[taskId];

    if (gBattleAnimArgs[0] == 0)
        task->func = sub_80B912C;
    else
        task->func = sub_80B91B0;

    task->func(taskId);
}

static void sub_80B912C(u8 taskId)
{
    struct Task *task = &gTasks[taskId];

    switch (task->data[0])
    {
    case 0:
        task->data[10] = GetAnimBattlerSpriteId(ANIM_ATTACKER);
        gSprites[task->data[10]].invisible = FALSE;
        gSprites[task->data[10]].x2 = 0;
        gSprites[task->data[10]].y2 = 160 - gSprites[task->data[10]].y;
        ++task->data[0];
        break;
    case 1:
        DestroyAnimVisualTask(taskId);
    }
}

static void sub_80B91B0(u8 taskId)
{
    u8 var0;
    struct Task *task = &gTasks[taskId];

    switch (task->data[0])
    {
    case 0:
        task->data[10] = GetAnimBattlerSpriteId(ANIM_ATTACKER);
        task->data[11] = GetBattlerSpriteBGPriorityRank(gBattleAnimAttacker);
        if (task->data[11] == 1)
            task->data[12] = gBattle_BG1_X;
        else
            task->data[12] = gBattle_BG2_X;
        var0 = GetBattlerYCoordWithElevation(gBattleAnimAttacker);
        task->data[14] = var0 - 32;
        task->data[15] = var0 + 32;
        ++task->data[0];
        break;
    case 1:
        sub_80B92B8(task->data[11], 0, task->data[15]);
        ++task->data[0];
        break;
    case 2:
        gSprites[task->data[10]].y2 = 96;
        ++task->data[0];
        break;
    case 3:
        gSprites[task->data[10]].y2 -= 8;
        if (gSprites[task->data[10]].y2 == 0)
        {
            gScanlineEffect.state = 3;
            ++task->data[0];
        }
        break;
    case 4:
        DestroyAnimVisualTask(taskId);
        break;
    }
}

static void sub_80B92B8(u8 useBG1, s16 y, s16 endY)
{
    s16 bgX;
    struct ScanlineEffectParams scanlineParams;

    if (useBG1 == 1)
    {
        bgX = gBattle_BG1_X;
        scanlineParams.dmaDest = &REG_BG1HOFS;
    }
    else
    {
        bgX = gBattle_BG2_X;
        scanlineParams.dmaDest = &REG_BG2HOFS;
    }
    if (y < 0)
        y = 0;
    while (y < endY)
    {
        gScanlineEffectRegBuffers[0][y] = bgX;
        gScanlineEffectRegBuffers[1][y] = bgX;
        ++y;
    }
    while (y < 160)
    {
        gScanlineEffectRegBuffers[0][y] = bgX + 240;
        gScanlineEffectRegBuffers[1][y] = bgX + 240;
        ++y;
    }
    scanlineParams.dmaControl = SCANLINE_EFFECT_DMACNT_16BIT;
    scanlineParams.initState = 1;
    scanlineParams.unused9 = 0;
    ScanlineEffect_SetParams(scanlineParams);
}

// Moves a particle of dirt in a plume of dirt. Used in Fissure and Dig.
// arg 0: which mon (0 = attacker, 1 = target)
// arg 1: which side of mon (0 = left, 1 = right)
// arg 2: target x offset
// arg 3: target y offset
// arg 4: wave amplitude
// arg 5: duration
static void AnimFissureDirtPlumeParticle(struct Sprite *sprite)
{
    s8 battler;
    s16 xOffset;

    if (gBattleAnimArgs[0] == 0)
        battler = gBattleAnimAttacker;
    else
        battler = gBattleAnimTarget;
    xOffset = 24;
    if (gBattleAnimArgs[1] == 1)
    {
        xOffset *= -1;
        gBattleAnimArgs[2] *= -1;
    }
    sprite->x = GetBattlerSpriteCoord(battler, 2) + xOffset;
    sprite->y = GetBattlerYCoordWithElevation(battler) + 30;
    sprite->data[0] = gBattleAnimArgs[5];
    sprite->data[2] = sprite->x + gBattleAnimArgs[2];
    sprite->data[4] = sprite->y + gBattleAnimArgs[3];
    sprite->data[5] = gBattleAnimArgs[4];
    InitAnimArcTranslation(sprite);
    sprite->callback = AnimFissureDirtPlumeParticleStep;
}

static void AnimFissureDirtPlumeParticleStep(struct Sprite *sprite)
{
    if (TranslateAnimHorizontalArc(sprite))
        DestroyAnimSprite(sprite);
}

// Displays the dirt mound seen in the move Dig for set duration.
// The dirt mound image is too large for a single sprite, so two
// sprites are lined up next to each other.
// arg 0: which mon (0 = attacker, 1 = target)
// arg 1: oam tile num (0 = left half of image, 1 = right half of image)
// arg 2: duration
static void AnimDigDirtMound(struct Sprite *sprite)
{
    s8 battler;

    if (gBattleAnimArgs[0] == 0)
        battler = gBattleAnimAttacker;
    else
        battler = gBattleAnimTarget;
    sprite->x = GetBattlerSpriteCoord(battler, 0) - 16 + (gBattleAnimArgs[1] * 32);
    sprite->y = GetBattlerYCoordWithElevation(battler) + 32;
    sprite->oam.tileNum += gBattleAnimArgs[1] * 8;
    StoreSpriteCallbackInData6(sprite, DestroyAnimSprite);
    sprite->data[0] = gBattleAnimArgs[2];
    sprite->callback = WaitAnimForDuration;
}

void AnimTask_HorizontalShake(u8 taskId)
{
    u16 i;
    struct Task *task = &gTasks[taskId];

    if (gBattleAnimArgs[1])
        task->data[14] = task->data[15] = gBattleAnimArgs[1] + 3;
    else
        task->data[14] = task->data[15] = (gAnimMovePower / 10) + 3;

    task->data[3] = gBattleAnimArgs[2];
    switch (gBattleAnimArgs[0])
    {
    case 5:
        task->data[13] = gBattle_BG3_X;
        task->func = sub_80B9584;
        break;
    case 4:
        task->data[13] = 0;
        for (i = 0; i < MAX_BATTLERS_COUNT; i++)
        {
            if (IsBattlerSpriteVisible(i))
            {
                task->data[task->data[13] + 9] = gBattlerSpriteIds[i];
                ++task->data[13];
            }
        }
        task->func = sub_80B967C;
        break;
    default:
        task->data[9] = GetAnimBattlerSpriteId(gBattleAnimArgs[0]);
        if (task->data[9] == 0xFF)
        {
            DestroyAnimVisualTask(taskId);
        }
        else
        {
            task->data[13] = 1;
            task->func = sub_80B967C;
        }

        break;
    }
}

static void sub_80B9584(u8 taskId)
{
    struct Task *task = &gTasks[taskId];

    switch (task->data[0])
    {
    case 0:
        if (++task->data[1] > 1)
        {
            task->data[1] = 0;
            if ((task->data[2] & 1) == 0)
                gBattle_BG3_X = task->data[13] + task->data[15];
            else
                gBattle_BG3_X = task->data[13] - task->data[15];

            if (++task->data[2] == task->data[3])
            {
                task->data[2] = 0;
                --task->data[14];
                ++task->data[0];
            }
        }
        break;
    case 1:
        if (++task->data[1] > 1)
        {
            task->data[1] = 0;
            if ((task->data[2] & 1) == 0)
                gBattle_BG3_X = task->data[13] + task->data[14];
            else
                gBattle_BG3_X = task->data[13] - task->data[14];

            if (++task->data[2] == 4)
            {
                task->data[2] = 0;
                if (--task->data[14] == 0)
                    ++task->data[0];
            }
        }
        break;
    case 2:
        gBattle_BG3_X = task->data[13];
        DestroyAnimVisualTask(taskId);
        break;
    }
}

static void sub_80B967C(u8 taskId)
{
    u16 i;
    struct Task *task = &gTasks[taskId];

    switch (task->data[0])
    {
    case 0:
        if (++task->data[1] > 1)
        {
            task->data[1] = 0;
            sub_80B9760(task);
            if (++task->data[2] == task->data[3])
            {
                task->data[2] = 0;
                --task->data[14];
                ++task->data[0];
            }
        }
        break;
    case 1:
        if (++task->data[1] > 1)
        {
            task->data[1] = 0;
            sub_80B9760(task);
            if (++task->data[2] == 4)
            {
                task->data[2] = 0;
                if (--task->data[14] == 0)
                    ++task->data[0];
            }
        }
        break;
    case 2:
        for (i = 0; i < task->data[13]; i++)
            gSprites[task->data[9 + i]].x2 = 0;
        DestroyAnimVisualTask(taskId);
        break;
    }
}

static void sub_80B9760(struct Task *task)
{
    u16 i, xOffset;

    if ((task->data[2] & 1) == 0)
        xOffset = (task->data[14] / 2) + (task->data[14] & 1);
    else
        xOffset = -(task->data[14] / 2);
    for (i = 0; i < task->data[13]; i++)
        gSprites[task->data[9 + i]].x2 = xOffset;
}

void AnimTask_IsPowerOver99(u8 taskId)
{
    gBattleAnimArgs[15] = gAnimMovePower > 99;
    DestroyAnimVisualTask(taskId);
}

void AnimTask_PositionFissureBgOnBattler(u8 taskId)
{
    struct Task *newTask;
    u8 battler = (gBattleAnimArgs[0] & 1) ? gBattleAnimTarget : gBattleAnimAttacker;

    if (gBattleAnimArgs[0] > 1)
        battler ^= BIT_FLANK;
    newTask = &gTasks[CreateTask(sub_80B98A8, gBattleAnimArgs[1])];
    newTask->data[1] = (32 - GetBattlerSpriteCoord(battler, 2)) & 0x1FF;
    newTask->data[2] = (64 - GetBattlerSpriteCoord(battler, 3)) & 0xFF;
    gBattle_BG3_X = newTask->data[1];
    gBattle_BG3_Y = newTask->data[2];
    newTask->data[3] = gBattleAnimArgs[2];
    DestroyAnimVisualTask(taskId);
}

static void sub_80B98A8(u8 taskId)
{
    struct Task *task = &gTasks[taskId];

    if (gBattleAnimArgs[7] == task->data[3])
    {
        gBattle_BG3_X = 0;
        gBattle_BG3_Y = 0;
        DestroyTask(taskId);
    }
    else
    {
        gBattle_BG3_X = task->data[1];
        gBattle_BG3_Y = task->data[2];
    }
}
