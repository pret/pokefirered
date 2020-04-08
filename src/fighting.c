#include "global.h"
#include "gflib.h"
#include "battle_anim.h"
#include "random.h"
#include "task.h"
#include "trig.h"

static void unc_080B08A0(struct Sprite *sprite);
static void sub_80B08DC(struct Sprite *sprite);
static void sub_80B0928(struct Sprite *sprite);
static void AnimBasicFistOrFoot(struct Sprite *sprite);
static void sub_80B09A4(struct Sprite *sprite);
static void sub_80B0B80(struct Sprite *sprite);
static void sub_80B0C28(struct Sprite *sprite);
static void AnimSpinningKickOrPunch(struct Sprite *sprite);
static void AnimStompFoot(struct Sprite *sprite);
static void sub_80B0DF0(struct Sprite *sprite);
static void sub_80B0E80(struct Sprite *sprite);
static void sub_80B0F68(struct Sprite *sprite);
static void sub_80B107C(struct Sprite *sprite);
static void sub_80B1188(struct Sprite *sprite);
static void sub_80B12E8(struct Sprite *sprite);
static void sub_80B13F8(struct Sprite *sprite);
static void sub_80B1484(struct Sprite *sprite);
static void sub_80B14F0(struct Sprite *sprite);
static void sub_80B0B2C(struct Sprite *sprite);
static void sub_80B0BD8(struct Sprite *sprite);
static void sub_80B0CB4(struct Sprite *sprite);
static void AnimSpinningKickOrPunchFinish(struct Sprite *sprite);
static void AnimStompFootStep(struct Sprite *sprite);
static void AnimStompFootEnd(struct Sprite *sprite);
static void sub_80B0EF0(struct Sprite *sprite);
static void sub_80B1050(struct Sprite *sprite);
static void sub_80B111C(struct Sprite *sprite);
static void sub_80B11E4(struct Sprite *sprite);
static void sub_80B12A4(struct Sprite *sprite);

const struct SpriteTemplate gUnknown_83E668C =
{
    .tileTag = ANIM_TAG_HUMANOID_FOOT,
    .paletteTag = ANIM_TAG_HUMANOID_FOOT,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = unc_080B08A0,
};

static const union AnimCmd gUnknown_83E66A4[] =
{
    ANIMCMD_FRAME(0, 1),
    ANIMCMD_END,
};

static const union AnimCmd gUnknown_83E66AC[] =
{
    ANIMCMD_FRAME(16, 1),
    ANIMCMD_END,
};

static const union AnimCmd gUnknown_83E66B4[] =
{
    ANIMCMD_FRAME(32, 1),
    ANIMCMD_END,
};

static const union AnimCmd gUnknown_83E66BC[] =
{
    ANIMCMD_FRAME(48, 1),
    ANIMCMD_END,
};

static const union AnimCmd gUnknown_83E66C4[] =
{
    ANIMCMD_FRAME(48, 1, .hFlip = TRUE),
    ANIMCMD_END,
};

static const union AnimCmd *const gUnknown_83E66CC[] =
{
    gUnknown_83E66A4,
};

static const union AnimCmd *const gUnknown_83E66D0[] =
{
    gUnknown_83E66AC,
    gUnknown_83E66B4,
};

static const union AnimCmd *const gUnknown_83E66D8[] =
{
    gUnknown_83E66BC,
    gUnknown_83E66C4,
};

const struct SpriteTemplate gUnknown_83E66E0 =
{
    .tileTag = ANIM_TAG_HANDS_AND_FEET,
    .paletteTag = ANIM_TAG_HANDS_AND_FEET,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = gUnknown_83E66CC,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80B08DC,
};

const struct SpriteTemplate gUnknown_83E66F8 =
{
    .tileTag = ANIM_TAG_HANDS_AND_FEET,
    .paletteTag = ANIM_TAG_HANDS_AND_FEET,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = gUnknown_83E66CC,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80B0928,
};

const struct SpriteTemplate gFistFootSpriteTemplate =
{
    .tileTag = ANIM_TAG_HANDS_AND_FEET,
    .paletteTag = ANIM_TAG_HANDS_AND_FEET,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = gUnknown_83E66CC,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimBasicFistOrFoot,
};

const struct SpriteTemplate gUnknown_83E6728 =
{
    .tileTag = ANIM_TAG_HANDS_AND_FEET,
    .paletteTag = ANIM_TAG_HANDS_AND_FEET,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = gUnknown_83E66CC,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80B09A4,
};

const struct SpriteTemplate gUnknown_83E6740 =
{
    .tileTag = ANIM_TAG_HANDS_AND_FEET,
    .paletteTag = ANIM_TAG_HANDS_AND_FEET,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = gUnknown_83E66D8,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80B0B80,
};

const struct SpriteTemplate gUnknown_83E6758 =
{
    .tileTag = ANIM_TAG_HANDS_AND_FEET,
    .paletteTag = ANIM_TAG_HANDS_AND_FEET,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = gUnknown_83E66D0,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80B0C28,
};

static const union AffineAnimCmd gUnknown_83E6770[] =
{
    AFFINEANIMCMD_FRAME(0x100, 0x100, 0, 0),
    AFFINEANIMCMD_FRAME(-0x8, -0x8, 20, 1),
    AFFINEANIMCMD_JUMP(1),
};

static const union AffineAnimCmd *const gUnknown_83E6788[] =
{
    gUnknown_83E6770,
};

const struct SpriteTemplate gUnknown_83E678C =
{
    .tileTag = ANIM_TAG_HANDS_AND_FEET,
    .paletteTag = ANIM_TAG_HANDS_AND_FEET,
    .oam = &gOamData_AffineDouble_ObjNormal_32x32,
    .anims = gUnknown_83E66CC,
    .images = NULL,
    .affineAnims = gUnknown_83E6788,
    .callback = AnimSpinningKickOrPunch,
};

static const union AffineAnimCmd gUnknown_83E67A4[] =
{
    AFFINEANIMCMD_FRAME(0x100, 0x100, 0, 0),
    AFFINEANIMCMD_FRAME(-0x4, -0x4, 20, 1),
    AFFINEANIMCMD_JUMP(1),
};

static const union AffineAnimCmd *const gUnknown_83E67BC[] =
{
    gUnknown_83E67A4,
};

const struct SpriteTemplate gMegaPunchKickSpriteTemplate =
{
    .tileTag = ANIM_TAG_HANDS_AND_FEET,
    .paletteTag = ANIM_TAG_HANDS_AND_FEET,
    .oam = &gOamData_AffineDouble_ObjNormal_32x32,
    .anims = gUnknown_83E66CC,
    .images = NULL,
    .affineAnims = gUnknown_83E67BC,
    .callback = AnimSpinningKickOrPunch,
};

const struct SpriteTemplate gUnknown_83E67D8 =
{
    .tileTag = ANIM_TAG_HANDS_AND_FEET,
    .paletteTag = ANIM_TAG_HANDS_AND_FEET,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = gUnknown_83E66D0,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimStompFoot,
};

const struct SpriteTemplate gUnknown_83E67F0 =
{
    .tileTag = ANIM_TAG_DUCK,
    .paletteTag = ANIM_TAG_DUCK,
    .oam = &gOamData_AffineOff_ObjNormal_16x16,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80B0DF0,
};

const struct SpriteTemplate gUnknown_83E6808 =
{
    .tileTag = ANIM_TAG_BLUE_LIGHT_WALL,
    .paletteTag = ANIM_TAG_BLUE_LIGHT_WALL,
    .oam = &gOamData_AffineOff_ObjBlend_64x64,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80B0E80,
};

const struct SpriteTemplate gUnknown_83E6820 =
{
    .tileTag = ANIM_TAG_TORN_METAL,
    .paletteTag = ANIM_TAG_TORN_METAL,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80B0F68,
};

static const union AffineAnimCmd gUnknown_83E6838[] =
{
    AFFINEANIMCMD_FRAME(0x20, 0x20, 0, 0),
    AFFINEANIMCMD_FRAME(0x4, 0x4, 0, 64),
    AFFINEANIMCMD_FRAME(-0x6, -0x6, 0, 8),
    AFFINEANIMCMD_FRAME(0x6, 0x6, 0, 8),
    AFFINEANIMCMD_JUMP(2),
};

static const union AffineAnimCmd *const gUnknown_83E6860[] =
{
    gUnknown_83E6838,
};

const struct SpriteTemplate gUnknown_83E6864 =
{
    .tileTag = ANIM_TAG_CIRCLE_OF_LIGHT,
    .paletteTag = ANIM_TAG_CIRCLE_OF_LIGHT,
    .oam = &gOamData_AffineDouble_ObjBlend_64x64,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gUnknown_83E6860,
    .callback = sub_80B107C,
};

const struct SpriteTemplate gUnknown_83E687C =
{
    .tileTag = ANIM_TAG_FLAT_ROCK,
    .paletteTag = ANIM_TAG_FLAT_ROCK,
    .oam = &gOamData_AffineOff_ObjNormal_16x16,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80B1188,
};

const struct SpriteTemplate gUnknown_83E6894 =
{
    .tileTag = ANIM_TAG_METEOR,
    .paletteTag = ANIM_TAG_METEOR,
    .oam = &gOamData_AffineOff_ObjNormal_64x64,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80B12E8,
};

const struct SpriteTemplate gUnknown_83E68AC =
{
    .tileTag = ANIM_TAG_HANDS_AND_FEET,
    .paletteTag = ANIM_TAG_HANDS_AND_FEET,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = gUnknown_83E66CC,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80B13F8,
};

static const union AnimCmd gUnknown_83E68C4[] =
{
    ANIMCMD_FRAME(0, 4),
    ANIMCMD_FRAME(16, 4),
    ANIMCMD_FRAME(32, 4),
    ANIMCMD_END,
};

static const union AnimCmd gUnknown_83E68D4[] =
{
    ANIMCMD_FRAME(0, 4, .vFlip = TRUE),
    ANIMCMD_FRAME(16, 4, .vFlip = TRUE),
    ANIMCMD_FRAME(32, 4, .vFlip = TRUE),
    ANIMCMD_END,
};

static const union AnimCmd gUnknown_83E68E4[] =
{
    ANIMCMD_FRAME(0, 4, .hFlip = TRUE),
    ANIMCMD_FRAME(16, 4, .hFlip = TRUE),
    ANIMCMD_FRAME(32, 4, .hFlip = TRUE),
    ANIMCMD_END,
};

static const union AnimCmd *const gUnknown_83E68F4[] =
{
    gUnknown_83E68C4,
    gUnknown_83E68D4,
    gUnknown_83E68E4,
};

const struct SpriteTemplate gUnknown_83E6900 =
{
    .tileTag = ANIM_TAG_PURPLE_SCRATCH,
    .paletteTag = ANIM_TAG_PURPLE_SCRATCH,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = gUnknown_83E68F4,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80B1484,
};

static const union AnimCmd gUnknown_83E6918[] =
{
    ANIMCMD_FRAME(0, 6),
    ANIMCMD_FRAME(64, 6),
    ANIMCMD_END,
};

static const union AnimCmd gUnknown_83E6924[] =
{
    ANIMCMD_FRAME(0, 6, .vFlip = TRUE, .hFlip = TRUE),
    ANIMCMD_FRAME(64, 6, .vFlip = TRUE, .hFlip = TRUE),
    ANIMCMD_END,
};

static const union AnimCmd gUnknown_83E6930[] =
{
    ANIMCMD_FRAME(0, 6, .hFlip = TRUE),
    ANIMCMD_FRAME(64, 6, .hFlip = TRUE),
    ANIMCMD_END,
};

static const union AnimCmd *const gUnknown_83E693C[] =
{
    gUnknown_83E6918,
    gUnknown_83E6924,
    gUnknown_83E6930,
};

const struct SpriteTemplate gUnknown_83E6948 =
{
    .tileTag = ANIM_TAG_PURPLE_SWIPE,
    .paletteTag = ANIM_TAG_PURPLE_SWIPE,
    .oam = &gOamData_AffineOff_ObjNormal_64x64,
    .anims = gUnknown_83E693C,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80B1484,
};

static const union AffineAnimCmd gUnknown_83E6960[] =
{
    AFFINEANIMCMD_FRAME(0x200, 0x200, 0, 0),
    AFFINEANIMCMD_FRAME(-0x20, -0x20, 0, 8),
    AFFINEANIMCMD_END,
};

static const union AffineAnimCmd *const gUnknown_83E6978[] =
{
    gUnknown_83E6960,
};

const struct SpriteTemplate gUnknown_83E697C =
{
    .tileTag = ANIM_TAG_HANDS_AND_FEET,
    .paletteTag = ANIM_TAG_HANDS_AND_FEET,
    .oam = &gOamData_AffineDouble_ObjNormal_32x32,
    .anims = gUnknown_83E66CC,
    .images = NULL,
    .affineAnims = gUnknown_83E6978,
    .callback = sub_80B14F0,
};

static void unc_080B08A0(struct Sprite *sprite)
{
    SetAnimSpriteInitialXOffset(sprite, gBattleAnimArgs[0]);
    sprite->pos1.y += gBattleAnimArgs[1];
    sprite->data[0] = 15;
    sprite->callback = WaitAnimForDuration;
    StoreSpriteCallbackInData6(sprite, DestroyAnimSprite);
}

static void sub_80B08DC(struct Sprite *sprite)
{
    if (gBattleAnimArgs[7] == 1 && GetBattlerSide(gBattleAnimAttacker) != B_SIDE_PLAYER)
    {
        gBattleAnimArgs[1] = -gBattleAnimArgs[1];
        gBattleAnimArgs[3] = -gBattleAnimArgs[3];
    }
    StartSpriteAnim(sprite, gBattleAnimArgs[6]);
    gBattleAnimArgs[6] = 0;
    AnimSnoreZ(sprite);
}

static void sub_80B0928(struct Sprite *sprite)
{
    if (IsContest())
    {
        gBattleAnimArgs[1] = -gBattleAnimArgs[1];
        gBattleAnimArgs[3] = -gBattleAnimArgs[3];
    }
    sub_80B08DC(sprite);
}

// Displays a basic fist or foot sprite for a given duration.
// Used by many fighting moves (and elemental "punch" moves).
// arg 0: initial x pixel offset
// arg 1: initial y pixel offset
// arg 2: duration
// arg 3: ? (todo: related to initial pixel offsets)
// arg 4: anim num
static void AnimBasicFistOrFoot(struct Sprite *sprite)
{
    StartSpriteAnim(sprite, gBattleAnimArgs[4]);
    if (gBattleAnimArgs[3] == 0)
        InitSpritePosToAnimAttacker(sprite, 1);
    else
        InitSpritePosToAnimTarget(sprite, TRUE);
    sprite->data[0] = gBattleAnimArgs[2];
    sprite->callback = WaitAnimForDuration;
    StoreSpriteCallbackInData6(sprite, DestroyAnimSprite);
}

static void sub_80B09A4(struct Sprite *sprite)
{
    u8 battler;
    s16 xMod, yMod;
    s16 x, y;

    if (gBattleAnimArgs[0] == 0)
        battler = gBattleAnimAttacker;
    else
        battler = gBattleAnimTarget;

    if (gBattleAnimArgs[2] < 0)
        gBattleAnimArgs[2] = Random() % 5;
    StartSpriteAnim(sprite, gBattleAnimArgs[2]);
    sprite->pos1.x = GetBattlerSpriteCoord(battler, 2);
    sprite->pos1.y = GetBattlerSpriteCoord(battler, 3);
    xMod = GetBattlerSpriteCoordAttr(battler, BATTLER_COORD_ATTR_WIDTH) / 2;
    yMod = GetBattlerSpriteCoordAttr(battler, BATTLER_COORD_ATTR_HEIGHT) / 4;
    x = Random() % xMod;
    y = Random() % yMod;
    if (Random() & 1)
        x *= -1;
    if (Random() & 1)
        y *= -1;
    if ((gBattlerPositions[battler] & BIT_SIDE) == B_SIDE_PLAYER)
        y += 0xFFF0;
    sprite->pos1.x += x;
    sprite->pos1.y += y;
    sprite->data[0] = gBattleAnimArgs[1];
    sprite->data[7] = CreateSprite(&gBasicHitSplatSpriteTemplate, sprite->pos1.x, sprite->pos1.y, sprite->subpriority + 1);
    if (sprite->data[7] != 64)
    {
        StartSpriteAffineAnim(&gSprites[sprite->data[7]], 0);
        gSprites[sprite->data[7]].callback = SpriteCallbackDummy;
    }
    sprite->callback = sub_80B0B2C;
}

static void sub_80B0B2C(struct Sprite *sprite)
{
    if (sprite->data[0] == 0)
    {
        if (sprite->data[7] != 64)
        {
            FreeOamMatrix(gSprites[sprite->data[7]].oam.matrixNum);
            DestroySprite(&gSprites[sprite->data[7]]);
        }
        DestroyAnimSprite(sprite);
    }
    else
    {
        --sprite->data[0];
    }
}

static void sub_80B0B80(struct Sprite *sprite)
{
    InitSpritePosToAnimTarget(sprite, TRUE);
    sprite->data[0] = 30;
    if (gBattleAnimArgs[2] == 0)
    {
        sprite->data[2] = sprite->pos1.x - 20;
    }
    else
    {
        sprite->data[2] = sprite->pos1.x + 20;
        sprite->hFlip = 1;
    }
    sprite->data[4] = sprite->pos1.y - 20;
    sprite->callback = StartAnimLinearTranslation;
    StoreSpriteCallbackInData6(sprite, sub_80B0BD8);
}

static void sub_80B0BD8(struct Sprite *sprite)
{
    if (++sprite->data[5] == 11)
    {
        sprite->data[2] = sprite->pos1.x - sprite->pos2.x;
        sprite->data[4] = sprite->pos1.y - sprite->pos2.y;
        sprite->data[0] = 8;
        sprite->pos1.x += sprite->pos2.x;
        sprite->pos1.y += sprite->pos2.y;
        sprite->pos2.y = 0;
        sprite->pos2.x = 0;
        sprite->callback = StartAnimLinearTranslation;
        StoreSpriteCallbackInData6(sprite, DestroyAnimSprite);
    }
}

static void sub_80B0C28(struct Sprite *sprite)
{
    if (BATTLE_PARTNER(gBattleAnimAttacker) == gBattleAnimTarget && GetBattlerPosition(gBattleAnimTarget) < B_POSITION_PLAYER_RIGHT)
        gBattleAnimArgs[0] *= -1;
    InitSpritePosToAnimTarget(sprite, TRUE);
    if (GetBattlerSide(gBattleAnimAttacker) != B_SIDE_PLAYER)
        gBattleAnimArgs[2] = -gBattleAnimArgs[2];
    sprite->data[0] = gBattleAnimArgs[3];
    sprite->data[1] = sprite->pos1.x;
    sprite->data[2] = sprite->pos1.x + gBattleAnimArgs[2];
    sprite->data[3] = sprite->pos1.y;
    sprite->data[4] = sprite->pos1.y;
    InitAnimLinearTranslation(sprite);
    sprite->data[5] = gBattleAnimArgs[5];
    sprite->data[6] = gBattleAnimArgs[4];
    sprite->data[7] = 0;
    sprite->callback = sub_80B0CB4;
}

static void sub_80B0CB4(struct Sprite *sprite)
{
    if (!AnimTranslateLinear(sprite))
    {
        sprite->pos2.y += Sin(sprite->data[7] >> 8, sprite->data[5]);
        sprite->data[7] += sprite->data[6];
    }
    else
    {
        DestroyAnimSprite(sprite);
    }
}

// Animates the spinning, shrinking kick or punch, which then
// reappears at full size. Used by moves such as MOVE_MEGA_PUNCH and MOVE_MEGA_KICK.
// arg 0: initial x pixel offset
// arg 1: initial y pixel offset
// arg 2: anim num
// arg 3: spin duration
static void AnimSpinningKickOrPunch(struct Sprite *sprite)
{
    InitSpritePosToAnimTarget(sprite, TRUE);
    StartSpriteAnim(sprite, gBattleAnimArgs[2]);
    sprite->data[0] = gBattleAnimArgs[3];
    sprite->callback = WaitAnimForDuration;
    StoreSpriteCallbackInData6(sprite, AnimSpinningKickOrPunchFinish);
}

static void AnimSpinningKickOrPunchFinish(struct Sprite *sprite)
{
    StartSpriteAffineAnim(sprite, 0);
    sprite->affineAnimPaused = 1;
    sprite->data[0] = 20;
    sprite->callback = WaitAnimForDuration;
    StoreSpriteCallbackInData6(sprite, DestroyAnimSprite);
}

// Animates MOVE_STOMP's foot that slides downward.
// arg 0: initial x pixel offset
// arg 1: initial y pixel offset
// arg 2: initial wait duration
static void AnimStompFoot(struct Sprite *sprite)
{
    InitSpritePosToAnimTarget(sprite, TRUE);
    sprite->data[0] = gBattleAnimArgs[2];
    sprite->callback = AnimStompFootStep;
}

static void AnimStompFootStep(struct Sprite *sprite)
{
    if (--sprite->data[0] == -1)
    {
        sprite->data[0] = 6;
        sprite->data[2] = GetBattlerSpriteCoord(gBattleAnimTarget, 2);
        sprite->data[4] = GetBattlerSpriteCoord(gBattleAnimTarget, 3);
        sprite->callback = StartAnimLinearTranslation;
        StoreSpriteCallbackInData6(sprite, AnimStompFootEnd);
    }
}

static void AnimStompFootEnd(struct Sprite *sprite)
{
    sprite->data[0] = 15;
    sprite->callback = WaitAnimForDuration;
    StoreSpriteCallbackInData6(sprite, DestroyAnimSprite);
}

static void sub_80B0DF0(struct Sprite *sprite)
{
    if (sprite->data[0] == 0)
    {
        InitSpritePosToAnimTarget(sprite, TRUE);
        sprite->data[1] = gBattleAnimArgs[2];
        sprite->data[2] = gBattleAnimArgs[3];
        ++sprite->data[0];
    }
    else
    {
        sprite->data[4] += sprite->data[1];
        sprite->pos2.x = sprite->data[4] >> 8;
        sprite->pos2.y = Sin(sprite->data[3], sprite->data[2]);
        sprite->data[3] = (sprite->data[3] + 3) & 0xFF;
        if (sprite->data[3] > 100)
            sprite->invisible = sprite->data[3] % 2;
        if (sprite->data[3] > 120)
            DestroyAnimSprite(sprite);
    }
}

static void sub_80B0E80(struct Sprite *sprite)
{
    if (gBattleAnimArgs[0] == 0)
    {
        sprite->pos1.x = GetBattlerSpriteCoord(gBattleAnimAttacker, 0);
        sprite->pos1.y = GetBattlerSpriteCoord(gBattleAnimAttacker, 1);
    }
    else
    {
        sprite->pos1.x = GetBattlerSpriteCoord(gBattleAnimTarget, 0);
        sprite->pos1.y = GetBattlerSpriteCoord(gBattleAnimTarget, 1);
    }
    sprite->pos1.x += gBattleAnimArgs[1];
    sprite->pos1.y += gBattleAnimArgs[2];
    sprite->data[0] = 0;
    sprite->data[1] = gBattleAnimArgs[3];
    sprite->data[2] = gBattleAnimArgs[4];
    sprite->data[3] = 0;
    sprite->callback = sub_80B0EF0;
}

static void sub_80B0EF0(struct Sprite *sprite)
{
    switch (sprite->data[0])
    {
    case 0:
        if (--sprite->data[1] == 0)
        {
            if (sprite->data[2] == 0)
                DestroyAnimSprite(sprite);
            else
                ++sprite->data[0];
        }
        break;
    case 1:
        if (++sprite->data[1] > 1)
        {
            sprite->data[1] = 0;
            ++sprite->data[3];
            if (sprite->data[3] & 1)
                sprite->pos2.x = 2;
            else
                sprite->pos2.x = -2;
        }

        if (--sprite->data[2] == 0)
            DestroyAnimSprite(sprite);
        break;
    }
}

static void sub_80B0F68(struct Sprite *sprite)
{
    if (gBattleAnimArgs[0] == 0)
    {
        sprite->pos1.x = GetBattlerSpriteCoord(gBattleAnimAttacker, 0) + gBattleAnimArgs[2];
        sprite->pos1.y = GetBattlerSpriteCoord(gBattleAnimAttacker, 1) + gBattleAnimArgs[3];
    }
    else
    {
        sprite->pos1.x = GetBattlerSpriteCoord(gBattleAnimTarget, 0) + gBattleAnimArgs[2];
        sprite->pos1.y = GetBattlerSpriteCoord(gBattleAnimTarget, 1) + gBattleAnimArgs[3];
    }
    sprite->oam.tileNum += gBattleAnimArgs[1] * 16;
    sprite->data[0] = 0;
    switch (gBattleAnimArgs[1])
    {
    case 0:
        sprite->data[6] = -3;
        sprite->data[7] = -3;
        break;
    case 1:
        sprite->data[6] = 3;
        sprite->data[7] = -3;
        break;
    case 2:
        sprite->data[6] = -3;
        sprite->data[7] = 3;
        break;
    case 3:
        sprite->data[6] = 3;
        sprite->data[7] = 3;
        break;
    default:
        DestroyAnimSprite(sprite);
        return;
    }
    sprite->callback = sub_80B1050;
}

static void sub_80B1050(struct Sprite *sprite)
{
    sprite->pos1.x += sprite->data[6];
    sprite->pos1.y += sprite->data[7];
    if (++sprite->data[0] > 40)
        DestroyAnimSprite(sprite);
}

static void sub_80B107C(struct Sprite *sprite)
{
    if (gBattleAnimArgs[0] == 0)
    {
        sprite->pos1.x = GetBattlerSpriteCoord(gBattlerAttacker, 2);
        sprite->pos1.y = GetBattlerSpriteCoord(gBattlerAttacker, 3);
        sprite->oam.priority = GetBattlerSpriteBGPriority(gBattleAnimAttacker);
        sprite->data[7] = gBattleAnimTarget;
    }
    else
    {
        sprite->oam.priority = GetBattlerSpriteBGPriority(gBattleAnimTarget);
        sprite->data[7] = gBattleAnimAttacker;
    }
    sprite->data[0] = 0;
    sprite->data[1] = 12;
    sprite->data[2] = 8;
    sprite->callback = sub_80B111C;
}

static void sub_80B111C(struct Sprite *sprite)
{
    if (++sprite->data[0] == 180)
    {
        SetGpuReg(REG_OFFSET_BLDCNT, 0);
        sprite->data[0] = 16;
        sprite->data[1] = sprite->pos1.x;
        sprite->data[2] = GetBattlerSpriteCoord(sprite->data[7], 2);
        sprite->data[3] = sprite->pos1.y;
        sprite->data[4] = GetBattlerSpriteCoord(sprite->data[7], 3);
        InitAnimLinearTranslation(sprite);
        StoreSpriteCallbackInData6(sprite, DestroySpriteAndMatrix);
        sprite->callback = sub_807563C;
    }
}

static void sub_80B1188(struct Sprite *sprite)
{
    sprite->pos1.x = gBattleAnimArgs[0];
    sprite->pos1.y = 120;
    sprite->data[0] = gBattleAnimArgs[3];
    StorePointerInVars(&sprite->data[4], &sprite->data[5], (void *)(sprite->pos1.y << 8));
    sprite->data[6] = gBattleAnimArgs[1];
    sprite->oam.tileNum += gBattleAnimArgs[2] * 4;
    sprite->callback = sub_80B11E4;
}

static void sub_80B11E4(struct Sprite *sprite)
{
    void *var0;

    if (sprite->data[0] != 0)
    {
        var0 = LoadPointerFromVars(sprite->data[4], sprite->data[5]);
        var0 -= sprite->data[6];
        StorePointerInVars(&sprite->data[4], &sprite->data[5], var0);
        var0 = (void *)(((intptr_t)var0) >> 8);
        sprite->pos1.y = (intptr_t)var0;
        if (sprite->pos1.y < -8)
            DestroyAnimSprite(sprite);
        else
            --sprite->data[0];
    }
    else
    {
        s16 pos0 = GetBattlerSpriteCoord(gBattleAnimAttacker, 2);
        s16 pos1 = GetBattlerSpriteCoord(gBattleAnimAttacker, 3);
        s16 pos2 = GetBattlerSpriteCoord(gBattleAnimTarget, 2);
        s16 pos3 = GetBattlerSpriteCoord(gBattleAnimTarget, 3);

        sprite->data[0] = pos2 - pos0;
        sprite->data[1] = pos3 - pos1;
        sprite->data[2] = sprite->pos1.x << 4;
        sprite->data[3] = sprite->pos1.y << 4;
        sprite->callback = sub_80B12A4;
    }
}

static void sub_80B12A4(struct Sprite *sprite)
{
    u16 edgeX;

    sprite->data[2] += sprite->data[0];
    sprite->data[3] += sprite->data[1];
    sprite->pos1.x = sprite->data[2] >> 4;
    sprite->pos1.y = sprite->data[3] >> 4;
    edgeX = sprite->pos1.x + 8;
    if (edgeX > 256 || sprite->pos1.y < -8 || sprite->pos1.y > 120)
        DestroyAnimSprite(sprite);
}

static void sub_80B12E8(struct Sprite *sprite)
{
    u8 battler;

    if (gBattleAnimArgs[0] == 0)
    {
        sprite->pos1.x = GetBattlerSpriteCoord(gBattlerAttacker, 2);
        sprite->pos1.y = GetBattlerSpriteCoord(gBattlerAttacker, 3);
        battler = gBattleAnimTarget;
        sprite->oam.priority = GetBattlerSpriteBGPriority(gBattleAnimAttacker);
    }
    else
    {
        battler = gBattleAnimAttacker;
        sprite->oam.priority = GetBattlerSpriteBGPriority(gBattleAnimTarget);
    }
    if (IsContest())
        sprite->oam.matrixNum |= ST_OAM_HFLIP;
    else if (GetBattlerSide(battler) == B_SIDE_PLAYER)
        sprite->oam.matrixNum |= (ST_OAM_HFLIP | ST_OAM_VFLIP);
    sprite->data[0] = 16;
    sprite->data[1] = sprite->pos1.x;
    sprite->data[2] = GetBattlerSpriteCoord(battler, 2);
    sprite->data[3] = sprite->pos1.y;
    sprite->data[4] = GetBattlerSpriteCoord(battler, 3);
    InitAnimLinearTranslation(sprite);
    StoreSpriteCallbackInData6(sprite, DestroyAnimSprite);
    sprite->callback = sub_807563C;
}

static void sub_80B13D4(struct Sprite *sprite)
{
    if (sprite->data[0] == sprite->data[4])
        DestroyAnimSprite(sprite);
    ++sprite->data[0];
}

static void sub_80B13F8(struct Sprite *sprite)
{
    u8 turn;

    sprite->pos1.x = GetBattlerSpriteCoord(gBattleAnimTarget, 2);
    sprite->pos1.y = GetBattlerSpriteCoord(gBattleAnimTarget, 3);
    sprite->data[1] = gBattleAnimArgs[3];
    sprite->data[2] = gBattleAnimArgs[0];
    sprite->data[3] = gBattleAnimArgs[1];
    sprite->data[4] = gBattleAnimArgs[2];
    turn = gAnimMoveTurn;
    if (GetBattlerSide(gBattleAnimTarget) == B_SIDE_PLAYER)
        ++turn;
    if (turn & 1)
    {
        sprite->data[2] = -sprite->data[2];
        ++sprite->data[1];
    }
    StartSpriteAnim(sprite, sprite->data[1]);
    sprite->pos2.x = sprite->data[2];
    sprite->pos2.y = sprite->data[3];
    sprite->callback = sub_80B13D4;
}

static void sub_80B1484(struct Sprite *sprite)
{
    if (gBattleAnimArgs[2] == 0)
        InitSpritePosToAnimAttacker(sprite, 0);
    else
        InitSpritePosToAnimTarget(sprite, FALSE);
    if (IsContest())
        StartSpriteAnim(sprite, 2);
    else if (GetBattlerSide(gBattleAnimAttacker) != B_SIDE_PLAYER)
        StartSpriteAnim(sprite, 1);
    sprite->callback = RunStoredCallbackWhenAnimEnds;
    StoreSpriteCallbackInData6(sprite, DestroyAnimSprite);
}

static void sub_80B14F0(struct Sprite *sprite)
{
    if (sprite->affineAnimEnded)
    {
        sprite->data[1] = (sprite->data[1] + 40) & 0xFF;
        sprite->pos2.x = Sin(sprite->data[1], 2);
        if (++sprite->data[0] > 40)
            DestroyAnimSprite(sprite);
    }
}

void sub_80B1530(u8 taskId)
{
    struct Task *task = &gTasks[taskId];

    switch (task->data[0])
    {
    case 0:
        sub_8075458(0);
        task->data[8] = gBattleAnimArgs[0];
        ++task->data[0];
        break;
    case 1:
        if (--task->data[8] == -1)
            ++task->data[0];
        break;
    case 2:
    default:
        task->data[9] += 1280;
        break;
    }
    task->data[10] += 2816;
    if (GetBattlerSide(gBattleAnimTarget) == B_SIDE_PLAYER)
        gBattle_BG3_X += task->data[9] >> 8;
    else
        gBattle_BG3_X -= task->data[9] >> 8;
    gBattle_BG3_Y += task->data[10] >> 8;
    task->data[9] &= 0xFF;
    task->data[10] &= 0xFF;
    if (gBattleAnimArgs[7] == -1)
    {
        gBattle_BG3_X = 0;
        gBattle_BG3_Y = 0;
        sub_8075458(1);
        DestroyAnimVisualTask(taskId);
    }
}
