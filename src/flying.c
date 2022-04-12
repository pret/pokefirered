#include "global.h"
#include "battle_anim.h"
#include "gflib.h"
#include "trig.h"
#include "constants/battle_anim.h"
#include "random.h"

static void AnimEllipticalGust(struct Sprite *sprite);
static void AnimGustToTarget(struct Sprite *sprite);
static void AnimAirWaveCrescent(struct Sprite *sprite);
static void AnimFlyBallUp(struct Sprite *sprite);
static void AnimFlyBallAttack(struct Sprite *sprite);
static void AnimFallingFeather(struct Sprite *sprite);
static void sub_80B24C0(struct Sprite *sprite);
static void sub_80B2514(struct Sprite *sprite);
static void AnimWhirlwindLine(struct Sprite *sprite);
static void AnimBounceBallShrink(struct Sprite *sprite);
static void AnimBounceBallLand(struct Sprite *sprite);
static void AnimDiveBall(struct Sprite *sprite);
static void AnimDiveWaterSplash(struct Sprite *sprite);
static void AnimSprayWaterDroplet(struct Sprite *sprite);
static void sub_80B2CE4(struct Sprite *sprite);
static void AnimSkyAttackBird(struct Sprite *sprite);
static void sub_80B190C(struct Sprite *sprite);
static void sub_80B198C(u8 taskId);
static void sub_80B1A9C(struct Sprite *sprite);
static void sub_80B1BF8(struct Sprite *sprite);
static void sub_80B1CC0(struct Sprite *sprite);
static void AnimFallingFeather_Step(struct Sprite *sprite);
static void sub_80B268C(struct Sprite *sprite);
static void sub_80B2820(struct Sprite *sprite);
static void sub_80B2A50(struct Sprite *sprite);
static void sub_80B2AB0(struct Sprite *sprite);
static void sub_80B2C88(struct Sprite *sprite);
static void sub_80B2CF8(struct Sprite *sprite);
static void sub_80B2E20(struct Sprite *sprite);

const struct SpriteTemplate gEllipticalGustSpriteTemplate =
{
    .tileTag = ANIM_TAG_GUST,
    .paletteTag = ANIM_TAG_GUST,
    .oam = &gOamData_AffineOff_ObjNormal_32x64,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimEllipticalGust,
};

static const union AffineAnimCmd sAffineAnim_GustToTarget[] =
{
    AFFINEANIMCMD_FRAME(0x10, 0x100, 0, 0),
    AFFINEANIMCMD_FRAME(0xA, 0x0, 0, 24),
    AFFINEANIMCMD_END,
};

static const union AffineAnimCmd *const sAffineAnims_GustToTarget[] =
{
    sAffineAnim_GustToTarget,
};

const struct SpriteTemplate gGustToTargetSpriteTemplate =
{
    .tileTag = ANIM_TAG_GUST,
    .paletteTag = ANIM_TAG_GUST,
    .oam = &gOamData_AffineNormal_ObjNormal_32x64,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = sAffineAnims_GustToTarget,
    .callback = AnimGustToTarget,
};

static const union AnimCmd sAffineAnim_AirWaveCrescent[] =
{
    ANIMCMD_FRAME(0, 3),
    ANIMCMD_FRAME(0, 3, .hFlip = TRUE),
    ANIMCMD_FRAME(0, 3, .vFlip = TRUE),
    ANIMCMD_FRAME(0, 3, .vFlip = TRUE, .hFlip = TRUE),
    ANIMCMD_JUMP(0),
};

static const union AnimCmd *const sAffineAnims_AirWaveCrescent[] =
{
    sAffineAnim_AirWaveCrescent,
};

const struct SpriteTemplate gAirWaveCrescentSpriteTemplate =
{
    .tileTag = ANIM_TAG_AIR_WAVE_2,
    .paletteTag = ANIM_TAG_AIR_WAVE_2,
    .oam = &gOamData_AffineOff_ObjNormal_32x16,
    .anims = sAffineAnims_AirWaveCrescent,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimAirWaveCrescent,
};

static const union AffineAnimCmd sAffineAnim_FlyBallUp[] =
{
    AFFINEANIMCMD_FRAME(0x10, 0x100, 0, 0),
    AFFINEANIMCMD_FRAME(0x28, 0x0, 0, 6),
    AFFINEANIMCMD_FRAME(0x0, -0x20, 0, 5),
    AFFINEANIMCMD_FRAME(-0x10, 0x20, 0, 10),
    AFFINEANIMCMD_END,
};

static const union AffineAnimCmd *const sAffineAnims_FlyBallUp[] =
{
    sAffineAnim_FlyBallUp,
};

static const union AffineAnimCmd sAffineAnim_FlyBallAttack_0[] =
{
    AFFINEANIMCMD_FRAME(0x0, 0x0, 50, 1),
    AFFINEANIMCMD_END,
};

static const union AffineAnimCmd sAffineAnim_FlyBallAttack_1[] =
{
    AFFINEANIMCMD_FRAME(0x0, 0x0, -40, 1),
    AFFINEANIMCMD_END,
};

static const union AffineAnimCmd *const sAffineAnims_FlyBallAttack[] =
{
    sAffineAnim_FlyBallAttack_0,
    sAffineAnim_FlyBallAttack_1,
};

const struct SpriteTemplate gFlyBallUpSpriteTemplate =
{
    .tileTag = ANIM_TAG_ROUND_SHADOW,
    .paletteTag = ANIM_TAG_ROUND_SHADOW,
    .oam = &gOamData_AffineDouble_ObjNormal_64x64,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = sAffineAnims_FlyBallUp,
    .callback = AnimFlyBallUp,
};

const struct SpriteTemplate gFlyBallAttackSpriteTemplate =
{
    .tileTag = ANIM_TAG_ROUND_SHADOW,
    .paletteTag = ANIM_TAG_ROUND_SHADOW,
    .oam = &gOamData_AffineNormal_ObjNormal_64x64,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = sAffineAnims_FlyBallAttack,
    .callback = AnimFlyBallAttack,
};

static const union AnimCmd sAnim_FallingFeather_0[] =
{
    ANIMCMD_FRAME(0, 0),
    ANIMCMD_END,
};

static const union AnimCmd sAnim_FallingFeather_1[] =
{
    ANIMCMD_FRAME(16, 0, .hFlip = TRUE),
    ANIMCMD_END,
};

static const union AnimCmd *const sAnims_FallingFeather[] =
{
    sAnim_FallingFeather_0,
    sAnim_FallingFeather_1,
};

const struct SpriteTemplate gFallingFeatherSpriteTemplate =
{
    .tileTag = ANIM_TAG_WHITE_FEATHER,
    .paletteTag = ANIM_TAG_WHITE_FEATHER,
    .oam = &gOamData_AffineNormal_ObjNormal_32x32,
    .anims = sAnims_FallingFeather,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimFallingFeather,
};

// not used
static const u16 gUnknown_83E6C18[] = INCBIN_U16("graphics/battle_anims/unk_83E6C18.gbapal");

const struct SpriteTemplate gUnknown_83E6C38 =
{
    .tileTag = ANIM_TAG_SMALL_BUBBLES,
    .paletteTag = ANIM_TAG_SMALL_BUBBLES,
    .oam = &gOamData_AffineOff_ObjNormal_16x16,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80B24C0,
};

const struct SpriteTemplate gUnknown_83E6C50 =
{
    .tileTag = ANIM_TAG_WHITE_FEATHER,
    .paletteTag = ANIM_TAG_WHITE_FEATHER,
    .oam = &gOamData_AffineNormal_ObjNormal_32x32,
    .anims = sAnims_FallingFeather,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80B2514,
};

static const union AnimCmd sAnim_WhirlwindLines[] =
{
    ANIMCMD_FRAME(0, 1),
    ANIMCMD_FRAME(8, 1),
    ANIMCMD_FRAME(16, 1),
    ANIMCMD_FRAME(8, 1, .hFlip = TRUE),
    ANIMCMD_FRAME(0, 1, .hFlip = TRUE),
    ANIMCMD_END,
};

static const union AnimCmd *const sAnims_WhirlwindLines[] =
{
    sAnim_WhirlwindLines,
};

const struct SpriteTemplate gWhirlwindLineSpriteTemplate =
{
    .tileTag = ANIM_TAG_WHIRLWIND_LINES,
    .paletteTag = ANIM_TAG_WHIRLWIND_LINES,
    .oam = &gOamData_AffineOff_ObjNormal_32x16,
    .anims = sAnims_WhirlwindLines,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimWhirlwindLine,
};

static const union AffineAnimCmd sAffineAnim_BounceBallShrink[] =
{
    AFFINEANIMCMD_FRAME(0x10, 0x100, 0, 0),
    AFFINEANIMCMD_FRAME(0x28, 0x0, 0, 6),
    AFFINEANIMCMD_FRAME(0x0, -0x20, 0, 5),
    AFFINEANIMCMD_FRAME(-0x14, 0x0, 0, 7),
    AFFINEANIMCMD_FRAME(-0x14, -0x14, 0, 5),
    AFFINEANIMCMD_END,
};

static const union AffineAnimCmd *const sAffineAnims_BounceBallShrink[] =
{
    sAffineAnim_BounceBallShrink,
};

const struct SpriteTemplate gBounceBallShrinkSpriteTemplate =
{
    .tileTag = ANIM_TAG_ROUND_SHADOW,
    .paletteTag = ANIM_TAG_ROUND_SHADOW,
    .oam = &gOamData_AffineDouble_ObjNormal_64x64,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = sAffineAnims_BounceBallShrink,
    .callback = AnimBounceBallShrink,
};

static const union AffineAnimCmd sAffineAnim_BounceBallLand[] =
{
    AFFINEANIMCMD_FRAME(0xA0, 0x100, 0, 0),
    AFFINEANIMCMD_END,
};

static const union AffineAnimCmd *const sAffineAnims_BounceBallLand[] =
{
    sAffineAnim_BounceBallLand,
};

const struct SpriteTemplate gBounceBallLandSpriteTemplate =
{
    .tileTag = ANIM_TAG_ROUND_SHADOW,
    .paletteTag = ANIM_TAG_ROUND_SHADOW,
    .oam = &gOamData_AffineDouble_ObjNormal_64x64,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = sAffineAnims_BounceBallLand,
    .callback = AnimBounceBallLand,
};

static const union AffineAnimCmd sAffineAnim_DiveBall[] =
{
    AFFINEANIMCMD_FRAME(0x10, 0x100, 0, 0),
    AFFINEANIMCMD_FRAME(0x28, 0x0, 0, 6),
    AFFINEANIMCMD_FRAME(0x0, -0x20, 0, 5),
    AFFINEANIMCMD_FRAME(-0x10, 0x20, 0, 10),
    AFFINEANIMCMD_END,
};

static const union AffineAnimCmd *const sAffineAnims_DiveBall[] =
{
    sAffineAnim_DiveBall,
};

const struct SpriteTemplate gDiveBallSpriteTemplate =
{
    .tileTag = ANIM_TAG_ROUND_SHADOW,
    .paletteTag = ANIM_TAG_ROUND_SHADOW,
    .oam = &gOamData_AffineDouble_ObjNormal_64x64,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = sAffineAnims_DiveBall,
    .callback = AnimDiveBall,
};

// not used
static const union AffineAnimCmd gUnknown_83E6D58[] =
{
    AFFINEANIMCMD_FRAME(0x100, 0x0, 0, 0),
    AFFINEANIMCMD_FRAME(0x0, 0x20, 0, 12),
    AFFINEANIMCMD_FRAME(0x0, -0x20, 0, 11),
    AFFINEANIMCMD_END,
};

// not used
static const union AffineAnimCmd *const gUnknown_83E6D80[] =
{
    gUnknown_83E6D58,
};

const struct SpriteTemplate gDiveWaterSplashSpriteTemplate =
{
    .tileTag = ANIM_TAG_SPLASH,
    .paletteTag = ANIM_TAG_SPLASH,
    .oam = &gOamData_AffineDouble_ObjNormal_64x64,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimDiveWaterSplash,
};

const struct SpriteTemplate gSprayWaterDropletSpriteTemplate =
{
    .tileTag = ANIM_TAG_SWEAT_BEAD,
    .paletteTag = ANIM_TAG_SWEAT_BEAD,
    .oam = &gOamData_AffineOff_ObjNormal_8x8,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSprayWaterDroplet,
};

const struct SpriteTemplate gUnknown_83E6DAC =
{
    .tileTag = ANIM_TAG_CIRCLE_OF_LIGHT,
    .paletteTag = ANIM_TAG_CIRCLE_OF_LIGHT,
    .oam = &gOamData_AffineOff_ObjBlend_64x64,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80B2CE4,
};

const struct SpriteTemplate gSkyAttackBirdSpriteTemplate =
{
    .tileTag = ANIM_TAG_BIRD,
    .paletteTag = ANIM_TAG_BIRD,
    .oam = &gOamData_AffineDouble_ObjNormal_64x64,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSkyAttackBird,
};

static void AnimEllipticalGust(struct Sprite *sprite)
{
    InitSpritePosToAnimTarget(sprite, FALSE);
    sprite->y += 20;
    sprite->data[1] = 191;
    sprite->callback = sub_80B190C;
    sprite->callback(sprite);
}

static void sub_80B190C(struct Sprite *sprite)
{
    sprite->x2 = Sin(sprite->data[1], 32);
    sprite->y2 = Cos(sprite->data[1], 8);
    sprite->data[1] += 5;
    sprite->data[1] &= 0xFF;
    if (++sprite->data[0] == 71)
        DestroyAnimSprite(sprite);
}

void AnimTask_AnimateGustTornadoPalette(u8 taskId)
{
    gTasks[taskId].data[0] = gBattleAnimArgs[1];
    gTasks[taskId].data[1] = gBattleAnimArgs[0];
    gTasks[taskId].data[2] = IndexOfSpritePaletteTag(ANIM_TAG_GUST);
    gTasks[taskId].func = sub_80B198C;
}

static void sub_80B198C(u8 taskId)
{
    u8 data2;
    u16 temp;
    s32 i, base;

    if (gTasks[taskId].data[10]++ == gTasks[taskId].data[1])
    {
        gTasks[taskId].data[10] = 0;
        data2 = gTasks[taskId].data[2];
        temp = gPlttBufferFaded[16 * data2 + 0x108];
        i = 7;
        base = data2 * 16;
        do
        {
            gPlttBufferFaded[base + 0x101 + i] = gPlttBufferFaded[base + 0x100 + i];
        } while (--i > 0);

        gPlttBufferFaded[base + 0x101] = temp;
    }
    if (--gTasks[taskId].data[0] == 0)
        DestroyAnimVisualTask(taskId);
}

static void AnimGustToTarget(struct Sprite *sprite)
{
    InitSpritePosToAnimAttacker(sprite, TRUE);
    if (GetBattlerSide(gBattleAnimAttacker) != B_SIDE_PLAYER)
        gBattleAnimArgs[2] = -gBattleAnimArgs[2];
    sprite->data[0] = gBattleAnimArgs[4];
    sprite->data[1] = sprite->x;
    sprite->data[2] = GetBattlerSpriteCoord(gBattleAnimTarget, BATTLER_COORD_X_2) + gBattleAnimArgs[2];
    sprite->data[3] = sprite->y;
    sprite->data[4] = GetBattlerSpriteCoord(gBattleAnimTarget, BATTLER_COORD_Y_PIC_OFFSET) + gBattleAnimArgs[3];
    InitAnimLinearTranslation(sprite);
    sprite->callback = RunStoredCallbackWhenAffineAnimEnds;
    StoreSpriteCallbackInData6(sprite, sub_80B1A9C);
}

static void sub_80B1A9C(struct Sprite *sprite)
{
    if (AnimTranslateLinear(sprite))
        DestroyAnimSprite(sprite);
}

static void AnimAirWaveCrescent(struct Sprite *sprite)
{
    if (GetBattlerSide(gBattleAnimAttacker) != B_SIDE_PLAYER)
    {
        gBattleAnimArgs[0] = -gBattleAnimArgs[0];
        gBattleAnimArgs[1] = -gBattleAnimArgs[1];
        gBattleAnimArgs[2] = -gBattleAnimArgs[2];
        gBattleAnimArgs[3] = -gBattleAnimArgs[3];
    }
    sprite->x = GetBattlerSpriteCoord(gBattleAnimAttacker, BATTLER_COORD_X_2);
    sprite->y = GetBattlerSpriteCoord(gBattleAnimAttacker, BATTLER_COORD_Y_PIC_OFFSET);
    sprite->x += gBattleAnimArgs[0];
    sprite->y += gBattleAnimArgs[1];
    sprite->data[0] = gBattleAnimArgs[4];
    if (gBattleAnimArgs[6] == 0)
    {
        sprite->data[2] = GetBattlerSpriteCoord(gBattleAnimTarget, BATTLER_COORD_X_2);
        sprite->data[4] = GetBattlerSpriteCoord(gBattleAnimTarget, BATTLER_COORD_Y_PIC_OFFSET);
    }
    else
    {
        SetAverageBattlerPositions(gBattleAnimTarget, 1, &sprite->data[2], &sprite->data[4]);
    }
    sprite->data[2] = sprite->data[2] + gBattleAnimArgs[2];
    sprite->data[4] = sprite->data[4] + gBattleAnimArgs[3];
    sprite->callback = StartAnimLinearTranslation;
    StoreSpriteCallbackInData6(sprite, DestroyAnimSprite);
    SeekSpriteAnim(sprite, gBattleAnimArgs[5]);
}

static void AnimFlyBallUp(struct Sprite *sprite)
{
    InitSpritePosToAnimAttacker(sprite, TRUE);
    sprite->data[0] = gBattleAnimArgs[2];
    sprite->data[1] = gBattleAnimArgs[3];
    sprite->callback = sub_80B1BF8;
    gSprites[GetAnimBattlerSpriteId(ANIM_ATTACKER)].invisible = TRUE;
}

static void sub_80B1BF8(struct Sprite *sprite)
{
    if (sprite->data[0] > 0)
    {
        --sprite->data[0];
    }
    else
    {
        sprite->data[2] += sprite->data[1];
        sprite->y2 -= (sprite->data[2] >> 8);
    }
    if (sprite->y + sprite->y2 < -32)
        DestroyAnimSprite(sprite);
}

static void AnimFlyBallAttack(struct Sprite *sprite)
{
    if (GetBattlerSide(gBattleAnimAttacker) != B_SIDE_PLAYER)
    {
        sprite->x = 272;
        sprite->y = -32;
        StartSpriteAffineAnim(sprite, 1);
    }
    else
    {
        sprite->x = -32;
        sprite->y = -32;
    }
    sprite->data[0] = gBattleAnimArgs[0];
    sprite->data[1] = sprite->x;
    sprite->data[2] = GetBattlerSpriteCoord(gBattleAnimTarget, BATTLER_COORD_X_2);
    sprite->data[3] = sprite->y;
    sprite->data[4] = GetBattlerSpriteCoord(gBattleAnimTarget, BATTLER_COORD_Y_PIC_OFFSET);
    InitAnimLinearTranslation(sprite);
    sprite->callback = sub_80B1CC0;
}

static void sub_80B1CC0(struct Sprite *sprite)
{
    sprite->data[0] = 1;
    AnimTranslateLinear(sprite);
    if (((u16)sprite->data[3] >> 8) > 200)
    {
        sprite->x += sprite->x2;
        sprite->x2 = 0;
        sprite->data[3] &= 0xFF;
    }
    if (sprite->x + sprite->x2 < -32
     || sprite->x + sprite->x2 > 272
     || sprite->y + sprite->y2 > 160)
    {
        gSprites[GetAnimBattlerSpriteId(ANIM_ATTACKER)].invisible = FALSE;
        DestroyAnimSprite(sprite);
    }
}

void DestroyAnimSpriteAfterTimer(struct Sprite *sprite)
{
    if (sprite->data[0]-- <= 0)
    {
        if (sprite->oam.affineMode & ST_OAM_AFFINE_ON_MASK)
        {
            FreeOamMatrix(sprite->oam.matrixNum);
            sprite->oam.affineMode = 0;
        }
        DestroySprite(sprite);
        --gAnimVisualTaskCount;
    }
}

struct FeatherDanceData
{
    u16 unk0_0a:1;
    u16 unk0_0b:1;
    u16 unk0_0c:1;
    u16 unk0_0d:1;
    u16 unk0_1:4;
    u16 unk1:8;
    u16 unk2;
    s16 unk4;
    u16 unk6;
    u16 unk8;
    u16 unkA;
    u8 unkC[2];
    u16 unkE_0:1;
    u16 unkE_1:15;
};

static void AnimFallingFeather(struct Sprite *sprite)
{
    u8 battler, matrixNum, sinIndex;
    s16 spriteCoord, sinVal;
    struct FeatherDanceData *data = (struct FeatherDanceData *)sprite->data;

    if (gBattleAnimArgs[7] & 0x100)
        battler = gBattleAnimAttacker;
    else
        battler = gBattleAnimTarget;
    if (GetBattlerSide(battler) == B_SIDE_PLAYER)
        gBattleAnimArgs[0] = -gBattleAnimArgs[0];
    sprite->x = GetBattlerSpriteCoord(battler, BATTLER_COORD_ATTR_HEIGHT) + gBattleAnimArgs[0];
    spriteCoord = GetBattlerSpriteCoord(battler, BATTLER_COORD_ATTR_WIDTH);
    sprite->y = spriteCoord + gBattleAnimArgs[1];
    data->unk8 = sprite->y << 8;
    data->unkE_1 = spriteCoord + gBattleAnimArgs[6];
    data->unk0_0c = 1;
    data->unk2 = gBattleAnimArgs[2] & 0xFF;
    data->unkA = (gBattleAnimArgs[2] >> 8) & 0xFF;
    data->unk4 = gBattleAnimArgs[3];
    data->unk6 = gBattleAnimArgs[4];
    *(u16 *)(data->unkC) = gBattleAnimArgs[5];
    if (data->unk2 >= 64 && data->unk2 <= 191)
    {
        sprite->oam.priority = GetBattlerSpriteBGPriority(battler) + 1;
        data->unkE_0 = 0;
        if (!(data->unk4 & 0x8000))
        {
            sprite->hFlip ^= 1;
            sprite->animNum = sprite->hFlip;
            sprite->animBeginning = TRUE;
            sprite->animEnded = FALSE;
        }
    }
    else
    {
        sprite->oam.priority = GetBattlerSpriteBGPriority(battler);
        data->unkE_0 = 1;
        if (data->unk4 & 0x8000)
        {
            sprite->hFlip ^= 1;
            sprite->animNum = sprite->hFlip;

            sprite->animBeginning = TRUE;
            sprite->animEnded = FALSE;
        }
    }
    data->unk0_1 = data->unk2 >> 6;
    sprite->x2 = (gSineTable[data->unk2] * data->unkC[0]) >> 8;
    matrixNum = sprite->oam.matrixNum;
    sinIndex = (-sprite->x2 >> 1) + data->unkA;
    sinVal = gSineTable[sinIndex];
    gOamMatrices[matrixNum].a = gOamMatrices[matrixNum].d = gSineTable[sinIndex + 64];
    if (sprite)
    {
        gOamMatrices[matrixNum].b = sinVal;
        gOamMatrices[matrixNum].c = -sinVal;
    }
    else // pointless, exactly the same
    {
        gOamMatrices[matrixNum].b = sinVal;
        gOamMatrices[matrixNum].c = -sinVal;
    }
    sprite->callback = AnimFallingFeather_Step;
}

static void AnimFallingFeather_Step(struct Sprite *sprite)
{
    u8 matrixNum, sinIndex;
    s16 sinVal = 0;
    struct FeatherDanceData *data = (struct FeatherDanceData *)sprite->data;
    if (data->unk0_0a)
    {
        if (data->unk1-- % 256 == 0)
        {
            data->unk0_0a = 0;
            data->unk1 = 0;
        }
    }
    else
    {
        switch (data->unk2 / 64)
        {
        case 0: 
            if ((u8)data->unk0_1 == 1) //casts to u8 here are necessary for matching
            {
                data->unk0_0d = 1;
                data->unk0_0a = 1;
                data->unk1 = 0;
            }
            else if ((u8)data->unk0_1 == 3)
            {
                data->unk0_0b ^= 1;
                data->unk0_0a = 1;
                data->unk1 = 0;
            }
            else if (data->unk0_0d)
            {
                sprite->hFlip ^= 1;
                sprite->animNum = sprite->hFlip;
                sprite->animBeginning = TRUE;
                sprite->animEnded = FALSE;
                if (data->unk0_0c)
                {
                    if (!data->unkE_0)
                    {
                        --sprite->oam.priority;
                        data->unkE_0 ^= 1;
                    }
                    else
                    {
                        ++sprite->oam.priority;
                        data->unkE_0 ^= 1;
                    }
                }
                data->unk0_0d = 0;
                data->unk2;
            }
            data->unk0_1 = 0;
            break;
        case 1:
            if ((u8)data->unk0_1 == 0)
            {
                data->unk0_0d = 1;
                data->unk0_0a = 1;
                data->unk1 = 0;
            }
            else if ((u8)data->unk0_1 == 2)
            {
                data->unk0_0a = 1;
                data->unk1 = 0;
            }
            else if (data->unk0_0d)
            {
                sprite->hFlip ^= 1;
                sprite->animNum = sprite->hFlip;
                sprite->animBeginning = TRUE;
                sprite->animEnded = FALSE;
                if (data->unk0_0c)
                {
                    if (!data->unkE_0)
                    {
                        --sprite->oam.priority;
                        data->unkE_0 ^= 1;
                    }
                    else
                    {
                        ++sprite->oam.priority;
                        data->unkE_0 ^= 1;
                    }
                }
                data->unk0_0d = 0;
            }
            data->unk0_1 = 1;
            break;
        case 2:
            if ((u8)data->unk0_1 == 3)
            {
                data->unk0_0d = 1;
                data->unk0_0a = 1;
                data->unk1 = 0;
            }
            else if ((u8)data->unk0_1 == 1)
            {
                data->unk0_0a = 1;
                data->unk1 = 0;
            }
            else if (data->unk0_0d)
            {
                sprite->hFlip ^= 1;
                sprite->animNum = sprite->hFlip;
                sprite->animBeginning = TRUE;
                sprite->animEnded = FALSE;
                if (data->unk0_0c)
                {
                    if (!data->unkE_0)
                    {
                        --sprite->oam.priority;
                        data->unkE_0 ^= 1;
                    }
                    else
                    {
                        ++sprite->oam.priority;
                        data->unkE_0 ^= 1;
                    }
                }
                data->unk0_0d = 0;
            }
            data->unk0_1 = 2;
            break;
        case 3:
            if ((u8)data->unk0_1 == 2)
            {
                data->unk0_0d = 1;
            }
            else if ((u8)data->unk0_1 == 0)
            {
                data->unk0_0b ^= 1;
                data->unk0_0a = 1;
                data->unk1 = 0;
            }
            else if (data->unk0_0d)
            {
                sprite->hFlip ^= 1;
                sprite->animNum = sprite->hFlip;
                sprite->animBeginning = TRUE;
                sprite->animEnded = FALSE;
                if (data->unk0_0c)
                {
                    if (!data->unkE_0)
                    {
                        --sprite->oam.priority;
                        data->unkE_0 ^= 1;
                    }
                    else
                    {
                        ++sprite->oam.priority;
                        data->unkE_0 ^= 1;
                    }
                }
                data->unk0_0d = 0;
            }
            data->unk0_1 = 3;
            break;
        }

        sprite->x2 = ((s32)data->unkC[data->unk0_0b] * gSineTable[data->unk2]) >> 8;
        matrixNum = sprite->oam.matrixNum;

        sinIndex = (-sprite->x2 >> 1) + data->unkA;
        sinVal = gSineTable[sinIndex];

        gOamMatrices[matrixNum].a = gOamMatrices[matrixNum].d = gSineTable[sinIndex + 64];
        gOamMatrices[matrixNum].b = sinVal;
        gOamMatrices[matrixNum].c = -sinVal;

        data->unk8 += data->unk6;
        sprite->y = data->unk8 >> 8;
        if (data->unk4 & 0x8000)
            data->unk2 = (data->unk2 - (data->unk4 & 0x7FFF)) & 0xFF;
        else
            data->unk2 = (data->unk2 + (data->unk4 & 0x7FFF)) & 0xFF;

        if (sprite->y + sprite->y2 >= data->unkE_1)
        {
            sprite->data[0] = 0;
            sprite->callback = DestroyAnimSpriteAfterTimer;
        }
    }
}

static void sub_80B24C0(struct Sprite *sprite)
{
    sprite->oam.priority = GetBattlerSpriteBGPriority(gBattleAnimTarget);
    sprite->x = GetBattlerSpriteCoord(gBattleAnimAttacker, 2);
    sprite->y = GetBattlerSpriteCoord(gBattleAnimAttacker, 3);
    sprite->callback = TranslateAnimSpriteToTargetMonLocation;
}

static void sub_80B2514(struct Sprite *sprite)
{
    u8 matrixNum;
    s16 rn, sinVal;

    sprite->data[1] = gBattleAnimArgs[0];
    sprite->data[2] = gBattleAnimArgs[1];
    sprite->data[3] = gBattleAnimArgs[2];
    
    if (gBattlerPositions[gBattleAnimTarget] & B_POSITION_OPPONENT_LEFT)
        sprite->data[7] = GetBattlerSpriteCoord(gBattleAnimTarget, BATTLER_COORD_ATTR_WIDTH) + gBattleAnimArgs[3];
    else
        sprite->data[7] = GetBattlerSpriteCoord(gBattleAnimTarget, BATTLER_COORD_ATTR_WIDTH) + 40;
    if (gBattleAnimArgs[4])
        sprite->oam.priority = GetBattlerSpriteBGPriority(gBattleAnimTarget) + 1;
    else
        sprite->oam.priority = GetBattlerSpriteBGPriority(gBattleAnimTarget);

    sprite->data[4] = gSineTable[sprite->data[1] & 0xFF];
    sprite->data[5] = -gSineTable[(sprite->data[1] & 0xFF) + 64];
    sprite->data[6] = 0;
    sprite->y2 = 0;
    sprite->x2 = 0;
    matrixNum = sprite->oam.matrixNum;
    sprite->data[1] = (u16)sprite->data[1] >> 8;
    rn = Random();
    if (rn & 0x8000)
        sprite->data[1] = 0xFF - sprite->data[1];
    sinVal = gSineTable[sprite->data[1]];
    gOamMatrices[matrixNum].a = gOamMatrices[matrixNum].d = gSineTable[sprite->data[1] + 64];
    gOamMatrices[matrixNum].b = sinVal;
    gOamMatrices[matrixNum].c = -sinVal;
    sprite->animBeginning = TRUE;
    sprite->animEnded = FALSE;
    if (rn & 1)
    {
        sprite->animNum = 1;
        sprite->hFlip = TRUE;
    }
    sprite->callback = sub_80B268C;
}

static void sub_80B268C(struct Sprite *sprite)
{
    struct FeatherDanceData fData;
    struct FeatherDanceData *tData = (struct FeatherDanceData *)sprite->data;
    u8 item;
    u32 x, y;

    ++sprite->data[0];
    if (sprite->data[0] <= 4)
        return;
    sprite->x2 = (sprite->data[4] * sprite->data[6]) >> 8;
    sprite->y2 = (sprite->data[5] * sprite->data[6]) >> 8;
    sprite->data[6] += sprite->data[3] & 0xFF;
    if (sprite->data[6] < (sprite->data[2] & 0xFF))
        return;
    sprite->x += sprite->x2;
    sprite->y += sprite->y2;
    sprite->x2 = 0;
    sprite->y2 = 0;
    memcpy(&fData, tData, sizeof(struct FeatherDanceData));
    memset(tData, 0, sizeof(struct FeatherDanceData));
    tData->unk8 = sprite->y << 8;
    tData->unk6 = fData.unk6 >> 8;
    tData->unk2 = 0;
    tData->unkA = fData.unk2;
    if (sprite->animNum != 0)
    {
        if (tData->unk6 & 8)
            tData->unk4 = 0x8001;
        else
            tData->unk4 = 0x8002;
    }
    else if (tData->unk6 & 8)
    {
        tData->unk4 = 1;
    }
    else
    {
        tData->unk4 = 2;
    }
    item = fData.unk4 >> 8;
    tData->unkC[0] = item;
    tData->unkC[1] = item - 2;
    x = (((u16 *)&fData)[7] << 1);
    y = (((u16 *)tData)[7] & 1);
    ((u16 *)tData)[7] = y | x;
    sprite->callback = AnimFallingFeather_Step;
}

static void AnimWhirlwindLine(struct Sprite *sprite)
{
    u16 arg;
    u8 mult;

    if (!gBattleAnimArgs[2])
        InitSpritePosToAnimAttacker(sprite, 0);
    else
        InitSpritePosToAnimTarget(sprite, FALSE);
    if ((!gBattleAnimArgs[2] && GetBattlerSide(gBattleAnimAttacker) == B_SIDE_PLAYER)
     || (gBattleAnimArgs[2] == 1 && GetBattlerSide(gBattleAnimTarget) == B_SIDE_PLAYER))
        sprite->x += 8;
    SeekSpriteAnim(sprite, gBattleAnimArgs[4]);
    sprite->x -= 32;
    sprite->data[1] = 0x0ccc;
    arg = gBattleAnimArgs[4];
    mult = 12;
    sprite->x2 += mult * arg;
    sprite->data[0] = arg;
    sprite->data[7] = gBattleAnimArgs[3];
    sprite->callback = sub_80B2820;
}

static void sub_80B2820(struct Sprite *sprite)
{
    sprite->x2 += sprite->data[1] >> 8;
    if (++sprite->data[0] == 6)
    {
        sprite->data[0] = 0;
        sprite->x2 = 0;
        StartSpriteAnim(sprite, 0);
    }

    if (--sprite->data[7] == -1)
        DestroyAnimSprite(sprite);
}

void AnimTask_DrillPeckHitSplats(u8 taskId)
{
    if (!(gTasks[taskId].data[0] % 32))
    {
        ++gAnimVisualTaskCount;
        gBattleAnimArgs[0] = Sin(gTasks[taskId].data[0], -13);
        gBattleAnimArgs[1] = Cos(gTasks[taskId].data[0], -13);
        gBattleAnimArgs[2] = 1;
        gBattleAnimArgs[3] = 3;
        CreateSpriteAndAnimate(&gFlashingHitSplatSpriteTemplate,
                               GetBattlerSpriteCoord(gBattleAnimTarget, 2),
                               GetBattlerSpriteCoord(gBattleAnimTarget, 3),
                               3);
    }
    gTasks[taskId].data[0] += 8;
    if (gTasks[taskId].data[0] > 255)
        DestroyAnimVisualTask(taskId);
}

static void AnimBounceBallShrink(struct Sprite *sprite)
{
    switch (sprite->data[0])
    {
    case 0:
        InitSpritePosToAnimAttacker(sprite, 1);
        gSprites[GetAnimBattlerSpriteId(ANIM_ATTACKER)].invisible = TRUE;
        ++sprite->data[0];
        break;
    case 1:
        if (sprite->affineAnimEnded)
            DestroyAnimSprite(sprite);
        break;
    }
}

static void AnimBounceBallLand(struct Sprite *sprite)
{
    switch (sprite->data[0])
    {
    case 0:
        sprite->y = GetBattlerSpriteCoord(gBattleAnimTarget, 1);
        sprite->y2 = -sprite->y - 32;
        ++sprite->data[0];
        break;
    case 1:
        sprite->y2 += 10;
        if (sprite->y2 >= 0)
            ++sprite->data[0];
        break;
    case 2:
        sprite->y2 -= 10;
        if (sprite->y + sprite->y2 < -32)
        {
            gSprites[GetAnimBattlerSpriteId(ANIM_ATTACKER)].invisible = FALSE;
            DestroyAnimSprite(sprite);
        }
        break;
    }
}

static void AnimDiveBall(struct Sprite *sprite)
{
    InitSpritePosToAnimAttacker(sprite, 1);
    sprite->data[0] = gBattleAnimArgs[2];
    sprite->data[1] = gBattleAnimArgs[3];
    sprite->callback = sub_80B2A50;
    gSprites[GetAnimBattlerSpriteId(ANIM_ATTACKER)].invisible = TRUE;
}

static void sub_80B2A50(struct Sprite *sprite)
{
    if (sprite->data[0] > 0)
    {
        --sprite->data[0];
    }
    else if (sprite->y + sprite->y2 > -32)
    {
        sprite->data[2] += sprite->data[1];
        sprite->y2 -= (sprite->data[2] >> 8);
    }
    else
    {
        sprite->invisible = TRUE;
        if (sprite->data[3]++ > 20)
            sprite->callback = sub_80B2AB0;
    }
}

static void sub_80B2AB0(struct Sprite *sprite)
{
    sprite->y2 += sprite->data[2] >> 8;
    if (sprite->y + sprite->y2 > -32)
        sprite->invisible = FALSE;
    if (sprite->y2 > 0)
        DestroyAnimSprite(sprite);
}

static void AnimDiveWaterSplash(struct Sprite *sprite)
{
    u32 matrixNum;
    s32 t1, t2;

    switch (sprite->data[0])
    {
    case 0:
        if (!gBattleAnimArgs[0])
        {
            sprite->x = GetBattlerSpriteCoord(gBattleAnimAttacker, 0);
            sprite->y = GetBattlerSpriteCoord(gBattleAnimAttacker, 1);
        }
        else
        {
            sprite->x = GetBattlerSpriteCoord(gBattleAnimTarget, 0);
            sprite->y = GetBattlerSpriteCoord(gBattleAnimTarget, 1);
        }
        sprite->data[1] = 512;
        TrySetSpriteRotScale(sprite, 0, 256, sprite->data[1], 0);
        ++sprite->data[0];
        break;
    case 1:
        if (sprite->data[2] <= 11)
            sprite->data[1] -= 40;
        else
            sprite->data[1] += 40;
        ++sprite->data[2];
        TrySetSpriteRotScale(sprite, 0, 256, sprite->data[1], 0);
        matrixNum = sprite->oam.matrixNum;
        t1 = 15616;
        t2 = t1 / gOamMatrices[matrixNum].d + 1;
        if (t2 > 128)
            t2 = 128;
        t2 = (64 - t2) / 2;
        sprite->y2 = t2;
        if (sprite->data[2] == 24)
        {
            TryResetSpriteAffineState(sprite);
            DestroyAnimSprite(sprite);
        }
        break;
    }
}

static void AnimSprayWaterDroplet(struct Sprite *sprite)
{
    s32 v1 = 0x1FF & Random();
    s32 v2 = 0x7F & Random();

    if (v1 % 2)
        sprite->data[0] = 736 + v1;
    else
        sprite->data[0] = 736 - v1;

    if (v2 % 2)
        sprite->data[1] = 896 + v2;
    else
        sprite->data[1] = 896 - v2;
    sprite->data[2] = gBattleAnimArgs[0];
    if (sprite->data[2])
        sprite->oam.matrixNum = ST_OAM_HFLIP;
    if (gBattleAnimArgs[1] == 0)
    {
        sprite->x = GetBattlerSpriteCoord(gBattleAnimAttacker, 0);
        sprite->y = GetBattlerSpriteCoord(gBattleAnimAttacker, 1) + 32;
    }
    else
    {
        sprite->x = GetBattlerSpriteCoord(gBattleAnimTarget, 0);
        sprite->y = GetBattlerSpriteCoord(gBattleAnimTarget, 1) + 32;
    }
    sprite->callback = sub_80B2C88;
}

static void sub_80B2C88(struct Sprite *sprite)
{
    if (sprite->data[2] == 0)
    {
        sprite->x2 += sprite->data[0] >> 8;
        sprite->y2 -= sprite->data[1] >> 8;
    }
    else
    {
        sprite->x2 -= sprite->data[0] >> 8;
        sprite->y2 -= sprite->data[1] >> 8;
    }
    sprite->data[0] = sprite->data[0];
    sprite->data[1] -= 32;
    if (sprite->data[0] < 0)
        sprite->data[0] = 0;
    if (++sprite->data[3] == 31)
        DestroyAnimSprite(sprite);
}

static void sub_80B2CE4(struct Sprite *sprite)
{
    sprite->data[6] = 0;
    sprite->data[7] = 64;
    sprite->callback = sub_80B2CF8;
}

static void sub_80B2CF8(struct Sprite *sprite)
{
    switch (sprite->data[0])
    {
    case 0:
        if (++sprite->data[1] > 8)
        {
            sprite->data[1] = 0;
            sprite->invisible ^= 1;
            if (++sprite->data[2] > 5 && sprite->invisible != FALSE)
                ++sprite->data[0];
        }
        break;
    case 1:
        DestroyAnimSprite(sprite);
        break;
    }
}

static void AnimSkyAttackBird(struct Sprite *sprite)
{
    u16 rotation;
    s16 posx = sprite->x;
    s16 posy = sprite->y;

    sprite->x = GetBattlerSpriteCoord(gBattleAnimAttacker, 2);
    sprite->y = GetBattlerSpriteCoord(gBattleAnimAttacker, 3);
    sprite->data[4] = sprite->x << 4;
    sprite->data[5] = sprite->y << 4;
    sprite->data[6] = ((posx - sprite->x) << 4) / 12;
    sprite->data[7] = ((posy - sprite->y) << 4) / 12;
    rotation = ArcTan2Neg(posx - sprite->x, posy - sprite->y);
    rotation += 49152;
    TrySetSpriteRotScale(sprite, 1, 0x100, 0x100, rotation);
    sprite->callback = sub_80B2E20;
}

static void sub_80B2E20(struct Sprite *sprite)
{
    sprite->data[4] += sprite->data[6];
    sprite->data[5] += sprite->data[7];
    sprite->x = sprite->data[4] >> 4;
    sprite->y = sprite->data[5] >> 4;
    if (sprite->x > 285 || sprite->x < -45
     || sprite->y > 157 || sprite->y < -45)
        DestroySpriteAndMatrix(sprite);
}

// not used
static void sub_80B2E64(u8 taskId)
{
    if (gBattleAnimArgs[0] == 0)
    {
        u8 spriteId = GetAnimBattlerSpriteId(ANIM_ATTACKER);

        gSprites[spriteId].invisible = TRUE;
    }
    else
    {
        u8 spriteId = GetAnimBattlerSpriteId(ANIM_ATTACKER);

        gSprites[spriteId].invisible = FALSE;
    }
    DestroyAnimVisualTask(taskId);
}
