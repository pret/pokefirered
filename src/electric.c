#include "global.h"
#include "battle_anim.h"
#include "trig.h"
#include "sound.h"
#include "constants/songs.h"

static void sub_80ADBEC(struct Sprite *sprite);
static void sub_80ADC58(struct Sprite *sprite);
static void sub_80ADCB8(struct Sprite *sprite);
static void sub_80ADD4C(struct Sprite *sprite);
static void sub_80ADEB0(struct Sprite *sprite);
static void sub_80AE000(struct Sprite *sprite);
static void sub_80AE06C(struct Sprite *sprite);
static void sub_80AE1A0(struct Sprite *sprite);
static void sub_80AE420(struct Sprite *sprite);
static void sub_80AE470(struct Sprite *sprite);
static void sub_80AE71C(struct Sprite *sprite);
static void sub_80AE774(struct Sprite *sprite);
static void sub_80AE7DC(struct Sprite *sprite);
static void sub_80AEC34(struct Sprite *sprite);
static void sub_80AEC80(struct Sprite *sprite);
static void sub_80AEF60(struct Sprite *sprite);
static void sub_80ADC3C(struct Sprite *sprite);
static void sub_80ADC9C(struct Sprite *sprite);
static void sub_80ADF38(struct Sprite *sprite);
static void sub_80AE130(struct Sprite *sprite);
static void sub_80AE278(u8 taskId);
static void sub_80AE4F4(struct Sprite *sprite);
static void sub_80AE5BC(u8 taskId);
static void sub_80AE704(struct Sprite *sprite);
static void sub_80AE83C(struct Sprite *sprite);
static bool8 sub_80AEB98(struct Task *task, u8 taskId);
static bool8 sub_80AEE74(struct Task *task, u8 taskId);
static bool8 sub_80AF058(struct Task *task, u8 taskId);
static void sub_80AF0C8(struct Sprite *sprite);

static const union AnimCmd gUnknown_83E5F1C[] =
{
    ANIMCMD_FRAME(0, 5),
    ANIMCMD_FRAME(16, 5),
    ANIMCMD_FRAME(32, 8),
    ANIMCMD_FRAME(48, 5),
    ANIMCMD_FRAME(64, 5),
    ANIMCMD_END,
};

static const union AnimCmd *const gUnknown_83E5F34[] =
{
    gUnknown_83E5F1C,
};

const struct SpriteTemplate gUnknown_83E5F38 =
{
    .tileTag = ANIM_TAG_LIGHTNING,
    .paletteTag = ANIM_TAG_LIGHTNING,
    .oam = &gOamData_83AC9D8,
    .anims = gUnknown_83E5F34,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80ADBEC,
};

static const union AffineAnimCmd gUnknown_83E5F50[] =
{
    AFFINEANIMCMD_FRAME(0x100, 0x100, 0, 0),
    AFFINEANIMCMD_FRAME(0x0, 0x0, 0, 20),
    AFFINEANIMCMD_FRAME(0x0, 0x0, -16, 60),
    AFFINEANIMCMD_END,
};

static const union AffineAnimCmd *const gUnknown_83E5F70[] =
{
    gUnknown_83E5F50,
};

const struct SpriteTemplate gUnknown_83E5F74 =
{
    .tileTag = ANIM_TAG_HANDS_AND_FEET,
    .paletteTag = ANIM_TAG_HANDS_AND_FEET,
    .oam = &gOamData_83ACA38,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gUnknown_83E5F70,
    .callback = sub_80ADC58,
};

static const union AnimCmd gUnknown_83E5F8C[] =
{
    ANIMCMD_FRAME(0, 5),
    ANIMCMD_FRAME(16, 5),
    ANIMCMD_FRAME(32, 5),
    ANIMCMD_FRAME(48, 5),
    ANIMCMD_FRAME(64, 5),
    ANIMCMD_FRAME(80, 5),
    ANIMCMD_JUMP(0),
};

static const union AnimCmd *const gUnknown_83E5FA8[] =
{
    gUnknown_83E5F8C,
};

const struct SpriteTemplate gUnknown_83E5FAC =
{
    .tileTag = ANIM_TAG_SHOCK,
    .paletteTag = ANIM_TAG_SHOCK,
    .oam = &gOamData_83AC9D8,
    .anims = gUnknown_83E5FA8,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80ADCB8,
};

const struct SpriteTemplate gUnknown_83E5FC4 =
{
    .tileTag = ANIM_TAG_SPARK_2,
    .paletteTag = ANIM_TAG_SPARK_2,
    .oam = &gOamData_83ACA30,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80ADD4C,
};

const struct SpriteTemplate gUnknown_83E5FDC =
{
    .tileTag = ANIM_TAG_BLACK_BALL_2,
    .paletteTag = ANIM_TAG_BLACK_BALL_2,
    .oam = &gOamData_83AC9D0,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = TranslateAnimSpriteToTargetMonLocation,
};

static const union AffineAnimCmd gUnknown_83E5FF4[] =
{
    AFFINEANIMCMD_FRAME(0x0, 0x0, 20, 1),
    AFFINEANIMCMD_JUMP(0),
};

static const union AffineAnimCmd *const gUnknown_83E6004[] =
{
    gUnknown_83E5FF4,
};

const struct SpriteTemplate gUnknown_83E6008 =
{
    .tileTag = ANIM_TAG_SPARK_2,
    .paletteTag = ANIM_TAG_SPARK_2,
    .oam = &gOamData_83ACA30,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gUnknown_83E6004,
    .callback = sub_80ADEB0,
};

static const union AnimCmd gUnknown_83E6020[] =
{
    ANIMCMD_FRAME(0, 6),
    ANIMCMD_FRAME(16, 6),
    ANIMCMD_FRAME(32, 6),
    ANIMCMD_JUMP(0),
};

static const union AnimCmd *const gUnknown_83E6030[] =
{
    gUnknown_83E6020,
};

static const union AffineAnimCmd gUnknown_83E6034[] =
{
    AFFINEANIMCMD_FRAME(0xE8, 0xE8, 0, 0),
    AFFINEANIMCMD_FRAME(-0x8, -0x8, 0, 10),
    AFFINEANIMCMD_FRAME(0x8, 0x8, 0, 10),
    AFFINEANIMCMD_JUMP(1),
};

static const union AffineAnimCmd *const gUnknown_83E6054[] =
{
    gUnknown_83E6034,
};

const struct SpriteTemplate gUnknown_83E6058 =
{
    .tileTag = ANIM_TAG_SHOCK_3,
    .paletteTag = ANIM_TAG_SHOCK_3,
    .oam = &gOamData_83ACA38,
    .anims = gUnknown_83E6030,
    .images = NULL,
    .affineAnims = gUnknown_83E6054,
    .callback = sub_80AE000,
};

const struct SpriteTemplate gUnknown_83E6070 =
{
    .tileTag = ANIM_TAG_SPARK_2,
    .paletteTag = ANIM_TAG_SPARK_2,
    .oam = &gOamData_83ACA30,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gUnknown_83E6004,
    .callback = sub_80AE06C,
};

const struct SpriteTemplate gElectricitySpriteTemplate =
{
    .tileTag = ANIM_TAG_SPARK_2,
    .paletteTag = ANIM_TAG_SPARK_2,
    .oam = &gOamData_83AC9D0,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80AE1A0,
};

static const struct SpriteTemplate gUnknown_83E60A0 =
{
    .tileTag = ANIM_TAG_SPARK,
    .paletteTag = ANIM_TAG_SPARK,
    .oam = &gOamData_83AC9C8,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80AE420,
};

const struct SpriteTemplate gUnknown_83E60B8 =
{
    .tileTag = ANIM_TAG_SPARK_H,
    .paletteTag = ANIM_TAG_SPARK_H,
    .oam = &gOamData_83AC9F8,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80AE470,
};

static const s8 gUnknown_83E60D0[][2] =
{
    { 58, -60},
    {-56, -36},
    {  8, -56},
    {-16,  56},
    { 58, -10},
    {-58,  10},
    { 48, -18},
    {-8,   56},
    { 16, -56},
    {-58, -42},
    { 58,  30},
    {-48,  40},
    { 12, -48},
    { 48, -12},
    {-56,  18},
    { 48,  48},
};

static const union AnimCmd gUnknown_83E60F0[] =
{
    ANIMCMD_FRAME(3, 1),
    ANIMCMD_FRAME(2, 1),
    ANIMCMD_FRAME(1, 1),
    ANIMCMD_FRAME(0, 1),
    ANIMCMD_END,
};

static const union AnimCmd gUnknown_83E6104[] =
{
    ANIMCMD_FRAME(0, 5),
    ANIMCMD_FRAME(1, 5),
    ANIMCMD_FRAME(2, 5),
    ANIMCMD_FRAME(3, 5),
    ANIMCMD_END,
};

static const union AnimCmd *const gUnknown_83E6118[] =
{
    gUnknown_83E60F0,
    gUnknown_83E6104,
};

static const struct SpriteTemplate gUnknown_83E6120 =
{
    .tileTag = ANIM_TAG_ELECTRIC_ORBS,
    .paletteTag = ANIM_TAG_ELECTRIC_ORBS,
    .oam = &gOamData_83AC9C8,
    .anims = gUnknown_83E6118,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy,
};

static const union AffineAnimCmd gUnknown_83E6138[] =
{
    AFFINEANIMCMD_FRAME(0x10, 0x10, 0, 0),
    AFFINEANIMCMD_FRAME(0x4, 0x4, 0, 60),
    AFFINEANIMCMD_FRAME(0x100, 0x100, 0, 0),
    AFFINEANIMCMD_LOOP(0),
    AFFINEANIMCMD_FRAME(-0x4, -0x4, 0, 5),
    AFFINEANIMCMD_FRAME(0x4, 0x4, 0, 5),
    AFFINEANIMCMD_LOOP(10),
    AFFINEANIMCMD_END,
};

static const union AffineAnimCmd gUnknown_83E6178[] =
{
    AFFINEANIMCMD_FRAME(0x10, 0x10, 0, 0),
    AFFINEANIMCMD_FRAME(0x8, 0x8, 0, 30),
    AFFINEANIMCMD_FRAME(0x100, 0x100, 0, 0),
    AFFINEANIMCMD_FRAME(-0x4, -0x4, 0, 5),
    AFFINEANIMCMD_FRAME(0x4, 0x4, 0, 5),
    AFFINEANIMCMD_JUMP(3),
};

static const union AffineAnimCmd gUnknown_83E61A8[] =
{
    AFFINEANIMCMD_FRAME(0x10, 0x10, 0, 0),
    AFFINEANIMCMD_FRAME(0x8, 0x8, 0, 30),
    AFFINEANIMCMD_FRAME(-0x8, -0x8, 0, 30),
    AFFINEANIMCMD_END,
};

static const union AffineAnimCmd *const gUnknown_83E61C8[] =
{
    gUnknown_83E6138,
    gUnknown_83E6178,
    gUnknown_83E61A8,
};

const struct SpriteTemplate gUnknown_83E61D4 =
{
    .tileTag = ANIM_TAG_CIRCLE_OF_LIGHT,
    .paletteTag = ANIM_TAG_CIRCLE_OF_LIGHT,
    .oam = &gOamData_83ACB60,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gUnknown_83E61C8,
    .callback = sub_80AE71C,
};

static const union AnimCmd gUnknown_83E61EC[] =
{
    ANIMCMD_FRAME(0, 3),
    ANIMCMD_FRAME(16, 3),
    ANIMCMD_FRAME(32, 3),
    ANIMCMD_FRAME(48, 3),
    ANIMCMD_END,
};

static const union AnimCmd *const gUnknown_83E6200[] =
{
    gUnknown_83E61EC,
};

const struct SpriteTemplate gUnknown_83E6204 =
{
    .tileTag = ANIM_TAG_ELECTRICITY,
    .paletteTag = ANIM_TAG_ELECTRICITY,
    .oam = &gOamData_83AC9D8,
    .anims = gUnknown_83E6200,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80AE774,
};

const struct SpriteTemplate gUnknown_83E621C =
{
    .tileTag = ANIM_TAG_CIRCLE_OF_LIGHT,
    .paletteTag = ANIM_TAG_CIRCLE_OF_LIGHT,
    .oam = &gOamData_83ACB60,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gUnknown_83E61C8,
    .callback = sub_80AE7DC,
};

static const union AnimCmd gUnknown_83E6234[] =
{
    ANIMCMD_FRAME(0, 3),
    ANIMCMD_END,
};

static const union AnimCmd gUnknown_83E623C[] =
{
    ANIMCMD_FRAME(2, 3),
    ANIMCMD_END,
};

static const union AnimCmd gUnknown_83E6244[] =
{
    ANIMCMD_FRAME(4, 3),
    ANIMCMD_END,
};

static const union AnimCmd gUnknown_83E624C[] =
{
    ANIMCMD_FRAME(6, 3),
    ANIMCMD_END,
};

static const union AnimCmd *const gUnknown_83E6254[] =
{
    gUnknown_83E6234,
    gUnknown_83E623C,
    gUnknown_83E6244,
    gUnknown_83E624C,
};

static const union AffineAnimCmd gUnknown_83E6264[] =
{
    AFFINEANIMCMD_FRAME(0x100, 0x100, 64, 0),
    AFFINEANIMCMD_END,
};

static const union AffineAnimCmd *const gUnknown_83E6274[] =
{
    gUnknown_83E6264,
};

static const struct SpriteTemplate gUnknown_83E6278 =
{
    .tileTag = ANIM_TAG_SPARK,
    .paletteTag = ANIM_TAG_SPARK,
    .oam = &gOamData_83ACAC8,
    .anims = gUnknown_83E6254,
    .images = NULL,
    .affineAnims = gUnknown_83E6274,
    .callback = sub_80AEC34,
};

const struct SpriteTemplate gUnknown_83E6290 =
{
    .tileTag = ANIM_TAG_CIRCLE_OF_LIGHT,
    .paletteTag = ANIM_TAG_CIRCLE_OF_LIGHT,
    .oam = &gOamData_83ACB60,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gUnknown_83E61C8,
    .callback = sub_80AEC80,
};

static const struct SpriteTemplate gUnknown_83E62A8 =
{
    .tileTag = ANIM_TAG_SPARK,
    .paletteTag = ANIM_TAG_SPARK,
    .oam = &gOamData_83AC9C8,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80AEF60,
};

static void sub_80ADBEC(struct Sprite *sprite)
{
    if (GetBattlerSide(gBattleAnimAttacker) != B_SIDE_PLAYER)
        sprite->pos1.x -= gBattleAnimArgs[0];
    else
        sprite->pos1.x += gBattleAnimArgs[0];
    sprite->pos1.y += gBattleAnimArgs[1];
    sprite->callback = sub_80ADC3C;
}

static void sub_80ADC3C(struct Sprite *sprite)
{
    if (sprite->animEnded)
        DestroyAnimSprite(sprite);
}

static void sub_80ADC58(struct Sprite *sprite)
{
    if (GetBattlerSide(gBattleAnimAttacker) != B_SIDE_PLAYER)
        sprite->pos1.x -= gBattleAnimArgs[0];
    else
        sprite->pos1.x += gBattleAnimArgs[0];
    sprite->callback = sub_80ADC9C;
}

static void sub_80ADC9C(struct Sprite *sprite)
{
    if (sprite->affineAnimEnded)
        DestroySpriteAndMatrix(sprite);
}

static void sub_80ADCB8(struct Sprite *sprite)
{
    sprite->pos1.x = GetBattlerSpriteCoord(gBattleAnimTarget, BATTLER_COORD_X_2);
    sprite->pos1.y = GetBattlerSpriteCoord(gBattleAnimTarget, BATTLER_COORD_Y_PIC_OFFSET);
    if (GetBattlerSide(gBattleAnimAttacker) != B_SIDE_PLAYER)
    {
        sprite->pos1.x -= gBattleAnimArgs[0];
        sprite->pos1.y -= gBattleAnimArgs[1];
    }
    else
    {
        sprite->pos1.x += gBattleAnimArgs[0];
        sprite->pos1.y += gBattleAnimArgs[1];
    }
    sprite->data[0] = 0;
    sprite->data[1] = gBattleAnimArgs[2];
    sprite->data[2] = gBattleAnimArgs[3];
    sprite->data[3] = gBattleAnimArgs[4];
    StoreSpriteCallbackInData6(sprite, DestroySpriteAndMatrix);
    sprite->callback = TranslateSpriteInCircleOverDuration;
}

static void sub_80ADD4C(struct Sprite *sprite)
{
    u8 battler;
    u32 matrixNum;
    s16 sineVal;

    switch (gBattleAnimArgs[4])
    {
    case 0:
        battler = gBattleAnimAttacker;
        break;
    case 1:
    default:
        battler = gBattleAnimTarget;
        break;
    case 2:
        if (!IsBattlerSpriteVisible(BATTLE_PARTNER(gBattleAnimAttacker)))
            battler = gBattleAnimAttacker;
        else
            battler = BATTLE_PARTNER(gBattleAnimAttacker);
        break;
    case 3:
        if (IsBattlerSpriteVisible(BATTLE_PARTNER(gBattleAnimAttacker)))
            battler = BATTLE_PARTNER(gBattleAnimTarget);
        else
            battler = gBattleAnimTarget;
        break;
    }
    if (gBattleAnimArgs[5] == 0)
    {
        sprite->pos1.x = GetBattlerSpriteCoord(battler, BATTLER_COORD_X);
        sprite->pos1.y = GetBattlerSpriteCoord(battler, BATTLER_COORD_Y);
    }
    else
    {
        sprite->pos1.x = GetBattlerSpriteCoord(battler, BATTLER_COORD_X_2);
        sprite->pos1.y = GetBattlerSpriteCoord(battler, BATTLER_COORD_Y_PIC_OFFSET);
    }
    sprite->pos2.x = (gSineTable[gBattleAnimArgs[0]] * gBattleAnimArgs[1]) >> 8;
    sprite->pos2.y = (gSineTable[gBattleAnimArgs[0] + 64] * gBattleAnimArgs[1]) >> 8;
    if (gBattleAnimArgs[6] & 1)
        sprite->oam.priority = GetBattlerSpriteBGPriority(battler) + 1;
    matrixNum = sprite->oam.matrixNum;
    sineVal = gSineTable[gBattleAnimArgs[2]];
    gOamMatrices[matrixNum].a = gOamMatrices[matrixNum].d = gSineTable[gBattleAnimArgs[2] + 64];
    gOamMatrices[matrixNum].b = sineVal;
    gOamMatrices[matrixNum].c = -sineVal;
    sprite->data[0] = gBattleAnimArgs[3];
    sprite->callback = sub_80B1D3C;
}

static void sub_80ADEB0(struct Sprite *sprite)
{
    InitSpritePosToAnimAttacker(sprite, 1);
    sprite->data[0] = gBattleAnimArgs[3];
    sprite->data[1] = sprite->pos1.x;
    sprite->data[2] = GetBattlerSpriteCoord(gBattleAnimTarget, BATTLER_COORD_X_2);
    sprite->data[3] = sprite->pos1.y;
    sprite->data[4] = GetBattlerSpriteCoord(gBattleAnimTarget, BATTLER_COORD_Y_PIC_OFFSET);
    InitAnimLinearTranslation(sprite);
    sprite->data[5] = gBattleAnimArgs[2];
    sprite->data[6] = gBattleAnimArgs[5];
    sprite->data[7] = gBattleAnimArgs[4];
    sprite->oam.tileNum += gBattleAnimArgs[6] * 4;
    sprite->callback = sub_80ADF38;
    sprite->callback(sprite);
}

static void sub_80ADF38(struct Sprite *sprite)
{
    if (!AnimTranslateLinear(sprite))
    {
        sprite->pos2.x += Sin(sprite->data[7], sprite->data[5]);
        sprite->pos2.y += Cos(sprite->data[7], sprite->data[5]);
        sprite->data[7] = (sprite->data[7] + sprite->data[6]) & 0xFF;
        if(!(sprite->data[7] % 3))
            sprite->invisible ^= 1;
    }
    else
    {
        DestroyAnimSprite(sprite);
    }
}

static void sub_80ADFB0(struct Sprite *sprite)
{
    if (--sprite->data[5] == -1)
    {
        sprite->invisible ^= 1;
        sprite->data[5] = sprite->data[4];
    }
    if (sprite->data[3]-- <= 0)
        DestroyAnimSprite(sprite);
}

static void sub_80AE000(struct Sprite *sprite)
{
    if (IsContest() || GetBattlerSide(gBattleAnimTarget) == B_SIDE_PLAYER)
        gBattleAnimArgs[1] = -gBattleAnimArgs[1];
    sprite->pos1.x = GetBattlerSpriteCoord(gBattleAnimTarget, BATTLER_COORD_X_2) + gBattleAnimArgs[1];
    sprite->pos1.y = GetBattlerSpriteCoord(gBattleAnimTarget, BATTLER_COORD_Y_PIC_OFFSET) + gBattleAnimArgs[2];
    sprite->data[3] = gBattleAnimArgs[0];
    sprite->data[4] = gBattleAnimArgs[3];
    sprite->data[5] = gBattleAnimArgs[3];
    sprite->callback = sub_80ADFB0;
}

static void sub_80AE06C(struct Sprite *sprite)
{
    u8 battler;

    sprite->data[0] = gBattleAnimArgs[3];
    if (gBattleAnimArgs[7] & 0x8000)
        battler = gBattleAnimTarget;
    else
        battler = gBattleAnimAttacker;
    if (IsContest() || GetBattlerSide(battler) == B_SIDE_PLAYER)
        gBattleAnimArgs[0] = -gBattleAnimArgs[0];
    sprite->pos1.x = GetBattlerSpriteCoord(battler, BATTLER_COORD_X_2) + gBattleAnimArgs[0];
    sprite->pos1.y = GetBattlerSpriteCoord(battler, BATTLER_COORD_Y_PIC_OFFSET) + gBattleAnimArgs[1];
    sprite->data[4] = gBattleAnimArgs[7] & 0x7FFF;
    sprite->data[5] = gBattleAnimArgs[2];
    sprite->data[6] = gBattleAnimArgs[5];
    sprite->data[7] = gBattleAnimArgs[4];
    sprite->oam.tileNum += gBattleAnimArgs[6] * 4;
    sprite->callback = sub_80AE130;
    sprite->callback(sprite);
}

static void sub_80AE130(struct Sprite *sprite)
{
    sprite->pos2.x = Sin(sprite->data[7], sprite->data[5]);
    sprite->pos2.y = Cos(sprite->data[7], sprite->data[5]);
    sprite->data[7] = (sprite->data[7] + sprite->data[6]) & 0xFF;
    if (sprite->data[7] % sprite->data[4] == 0)
        sprite->invisible ^= 1;
    if (sprite->data[0]-- <= 0)
        DestroyAnimSprite(sprite);
}

static void sub_80AE1A0(struct Sprite *sprite)
{
    InitSpritePosToAnimTarget(sprite, FALSE);
    sprite->oam.tileNum += gBattleAnimArgs[3] * 4;
    if (gBattleAnimArgs[3] == 1)
        sprite->oam.matrixNum = ST_OAM_HFLIP;
    else if (gBattleAnimArgs[3] == 2)
        sprite->oam.matrixNum = ST_OAM_VFLIP;
    sprite->data[0] = gBattleAnimArgs[2];
    sprite->callback = WaitAnimForDuration;
    StoreSpriteCallbackInData6(sprite, DestroyAnimSprite);
}

void sub_80AE220(u8 taskId)
{
    gTasks[taskId].data[0] = GetBattlerSpriteCoord(gBattleAnimTarget, 0) + gBattleAnimArgs[0];
    gTasks[taskId].data[1] = GetBattlerSpriteCoord(gBattleAnimTarget, 1) + gBattleAnimArgs[1];
    gTasks[taskId].data[2] = gBattleAnimArgs[2];
    gTasks[taskId].func = sub_80AE278;
}

static void sub_80AE278(u8 taskId)
{
    u16 r8;
    u16 r2;
    s16 r12;
    u8 spriteId = 0;
    u8 r7 = 0;
    u8 sp = gTasks[taskId].data[2];
    s16 x = gTasks[taskId].data[0];
    s16 y = gTasks[taskId].data[1];

    if (!gTasks[taskId].data[2])
    {
        r8 = 0;
        r2 = 1;
        r12 = 16;
    }
    else
    {
        r12 = 16;
        r8 = 8;
        r2 = 4;
    }
    switch (gTasks[taskId].data[10])
    {
    case 0:
        r12 *= 1;
        spriteId = CreateSprite(&gUnknown_83E60A0, x, y + r12, 2);
        ++r7;
        break;
    case 2:
        r12 *= 2;
        r8 += r2;
        spriteId = CreateSprite(&gUnknown_83E60A0, x, y + r12, 2);
        ++r7;
        break;
    case 4:
        r12 *= 3;
        r8 += r2 * 2;
        spriteId = CreateSprite(&gUnknown_83E60A0, x, y + r12, 2);
        ++r7;
        break;
    case 6:
        r12 *= 4;
        r8 += r2 * 3;
        spriteId = CreateSprite(&gUnknown_83E60A0, x, y + r12, 2);
        ++r7;
        break;
    case 8:
        r12 *= 5;
        spriteId = CreateSprite(&gUnknown_83E60A0, x, y + r12, 2);
        ++r7;
        break;
    case 10:
        DestroyAnimVisualTask(taskId);
        return;
    }
    if (r7)
    {
        gSprites[spriteId].oam.tileNum += r8;
        gSprites[spriteId].data[0] = sp;
        gSprites[spriteId].callback(&gSprites[spriteId]);
    }
    ++gTasks[taskId].data[10];
}

static void sub_80AE420(struct Sprite *sprite)
{
    if (!sprite->data[0])
    {
        sprite->oam.shape = ST_OAM_V_RECTANGLE;
        sprite->oam.size = ST_OAM_SIZE_0;
    }
    else
    {
        sprite->oam.shape = ST_OAM_SQUARE;
        sprite->oam.size = ST_OAM_SIZE_1;
    }
    if (++sprite->data[1] == 15)
        DestroySprite(sprite);
}

static void sub_80AE470(struct Sprite *sprite)
{
    u8 spriteId;

    sprite->pos1.x += gBattleAnimArgs[0];
    sprite->pos1.y += gBattleAnimArgs[1];
    spriteId = CreateSprite(&gUnknown_83E60B8, sprite->pos1.x + 32, sprite->pos1.y, sprite->subpriority);
    gSprites[spriteId].oam.tileNum += 8;
    ++gAnimVisualTaskCount;
    gSprites[spriteId].callback = sub_80AE4F4;
    sprite->callback = sub_80AE4F4;
}

static void sub_80AE4F4(struct Sprite *sprite)
{
    if (++sprite->data[0] == 3)
    {
        sprite->data[0] = 0;
        sprite->invisible ^= 1;
    }
    if (++sprite->data[1] == 51)
        DestroyAnimSprite(sprite);
}

void sub_80AE540(u8 taskId)
{
    struct Task *task = &gTasks[taskId];

    if (!gBattleAnimArgs[0])
    {
        task->data[14] = GetBattlerSpriteCoord(gBattleAnimAttacker, BATTLER_COORD_X_2);
        task->data[15] = GetBattlerSpriteCoord(gBattleAnimAttacker, BATTLER_COORD_Y_PIC_OFFSET);
    }
    else
    {
        task->data[14] = GetBattlerSpriteCoord(gBattleAnimTarget, BATTLER_COORD_X_2);
        task->data[15] = GetBattlerSpriteCoord(gBattleAnimTarget, BATTLER_COORD_Y_PIC_OFFSET);
    }
    task->data[6] = gBattleAnimArgs[1];
    task->data[7] = 0;
    task->data[8] = 0;
    task->data[9] = 0;
    task->data[10] = 0;
    task->data[11] = gBattleAnimArgs[3];
    task->data[12] = 0;
    task->data[13] = gBattleAnimArgs[2];
    task->func = sub_80AE5BC;
}

static void sub_80AE5BC(u8 taskId)
{
    struct Task *task = &gTasks[taskId];

    if (task->data[6])
    {
        if (++task->data[12] > task->data[13])
        {
            u8 spriteId;

            task->data[12] = 0;
            spriteId = CreateSprite(&gUnknown_83E6120, task->data[14], task->data[15], 2);
            if (spriteId != MAX_SPRITES)
            {
                struct Sprite *sprite = &gSprites[spriteId];

                sprite->pos1.x += gUnknown_83E60D0[task->data[9]][0];
                sprite->pos1.y += gUnknown_83E60D0[task->data[9]][1];
                sprite->data[0] = 40 - task->data[8] * 5;
                sprite->data[1] = sprite->pos1.x;
                sprite->data[2] = task->data[14];
                sprite->data[3] = sprite->pos1.y;
                sprite->data[4] = task->data[15];
                sprite->data[5] = taskId;
                InitAnimLinearTranslation(sprite);
                StoreSpriteCallbackInData6(sprite, sub_80AE704);
                sprite->callback = RunStoredCallbackWhenAnimEnds;
                if (++task->data[9] > 15)
                    task->data[9] = 0;
                if (++task->data[10] >= task->data[11])
                {
                    task->data[10] = 0;
                    if (task->data[8] <= 5)
                        ++task->data[8];
                }
                ++task->data[7];
                --task->data[6];
            }
        }
    }
    else if(task->data[7] == 0)
    {
        DestroyAnimVisualTask(taskId);
    }
}

static void sub_80AE6D0(struct Sprite *sprite)
{
    if (AnimTranslateLinear(sprite))
    {
        --gTasks[sprite->data[5]].data[7];
        DestroySprite(sprite);
    }
}

static void sub_80AE704(struct Sprite *sprite)
{
    StartSpriteAnim(sprite, 1);
    sprite->callback = sub_80AE6D0;
}

static void sub_80AE71C(struct Sprite *sprite)
{
    if (!gBattleAnimArgs[0])
    {
        sprite->pos1.x = GetBattlerSpriteCoord(gBattleAnimAttacker, BATTLER_COORD_X_2);
        sprite->pos1.y = GetBattlerSpriteCoord(gBattleAnimAttacker, BATTLER_COORD_Y_PIC_OFFSET);
    }
    else
    {
        sprite->pos1.x = GetBattlerSpriteCoord(gBattleAnimTarget, BATTLER_COORD_X_2);
        sprite->pos1.y = GetBattlerSpriteCoord(gBattleAnimTarget, BATTLER_COORD_Y_PIC_OFFSET);
    }
    StoreSpriteCallbackInData6(sprite, DestroySpriteAndMatrix);
    sprite->callback = RunStoredCallbackWhenAffineAnimEnds;
}

static void sub_80AE774(struct Sprite *sprite)
{
    if (!gBattleAnimArgs[0])
    {
        sprite->pos1.x = GetBattlerSpriteCoord(gBattleAnimAttacker, BATTLER_COORD_X_2);
        sprite->pos1.y = GetBattlerSpriteCoord(gBattleAnimAttacker, BATTLER_COORD_Y_PIC_OFFSET);
    }
    else
    {
        sprite->pos1.x = GetBattlerSpriteCoord(gBattleAnimTarget, BATTLER_COORD_X_2);
        sprite->pos1.y = GetBattlerSpriteCoord(gBattleAnimTarget, BATTLER_COORD_Y_PIC_OFFSET);
    }
    sprite->pos2.x = gBattleAnimArgs[1];
    sprite->pos2.y = gBattleAnimArgs[2];
    StoreSpriteCallbackInData6(sprite, DestroyAnimSprite);
    sprite->callback = RunStoredCallbackWhenAnimEnds;
}

static void sub_80AE7DC(struct Sprite *sprite)
{
    StartSpriteAffineAnim(sprite, 1);
    sprite->pos1.x = GetBattlerSpriteCoord(gBattleAnimAttacker, BATTLER_COORD_X_2);
    sprite->pos1.y = GetBattlerSpriteCoord(gBattleAnimAttacker, BATTLER_COORD_Y_PIC_OFFSET);
    sprite->data[6] = GetAnimBattlerSpriteId(ANIM_ATTACKER);
    sprite->data[7] = 16;
    if (GetBattlerSide(gBattleAnimAttacker) == B_SIDE_OPPONENT)
        sprite->data[7] *= -1;
    sprite->callback = sub_80AE83C;
}

static void sub_80AE83C(struct Sprite *sprite)
{
    switch (sprite->data[0])
    {
    case 0:
        if (++sprite->data[1] > 40)
            ++sprite->data[0];
        break;
    case 1:
        sprite->pos1.x += sprite->data[7];
        gSprites[sprite->data[6]].pos2.x += sprite->data[7];
        if ((u16)(sprite->pos1.x + 80) > 400)
            DestroySpriteAndMatrix(sprite);
        break;
    }
}

void sub_80AE8A0(u8 taskId)
{
    struct Task *task = &gTasks[taskId];

    switch (task->data[0])
    {
    case 0:
        task->data[15] = GetAnimBattlerSpriteId(ANIM_ATTACKER);
        task->data[14] = GetBattlerSpriteCoord(gBattleAnimAttacker, BATTLER_COORD_X_2);
        if (GetBattlerSide(gBattleAnimAttacker) == B_SIDE_PLAYER)
        {
            task->data[14] = -32;
            task->data[13] = 2;
        }
        else
        {
            task->data[14] = 32;
            task->data[13] = -2;
        }
        gSprites[task->data[15]].pos2.x = task->data[14];
        ++task->data[0];
        break;
    case 1:
        if (++task->data[1] > 1)
        {
            task->data[1] = 0;
            gSprites[task->data[15]].invisible ^= 1;

            if (task->data[14])
            {
                task->data[14] += task->data[13];
                gSprites[task->data[15]].pos2.x = task->data[14];
            }
            else
            {
                ++task->data[0];
            }
        }
        break;
    case 2:
        if (++task->data[1] > 1)
        {
            task->data[1] = 0;
            gSprites[task->data[15]].invisible ^= 1;
            if (++task->data[2] == 8)
                ++task->data[0];
        }
        break;
    case 3:
        gSprites[task->data[15]].invisible = FALSE;
        DestroyAnimVisualTask(taskId);
        break;
    }
}

void sub_80AEA10(u8 taskId)
{
    struct Task *task = &gTasks[taskId];

    switch(task->data[0])
    {
    case 0:
        task->data[1] = GetBattlerSide(gBattleAnimAttacker) == B_SIDE_PLAYER ? 1 : -1;
        switch (gBattleAnimArgs[0])
        {
        case 0:
            task->data[3] = GetBattlerSpriteCoord(gBattleAnimAttacker, BATTLER_COORD_X_2);
            task->data[5] = GetBattlerSpriteCoord(gBattleAnimAttacker, BATTLER_COORD_Y_PIC_OFFSET);
            task->data[4] = (task->data[1] * 128) + 120;
            break;
        case 4:
            task->data[3] = 120 - (task->data[1] * 128);
            task->data[5] = GetBattlerSpriteCoord(gBattleAnimTarget, BATTLER_COORD_Y_PIC_OFFSET);
            task->data[4] = GetBattlerSpriteCoord(gBattleAnimTarget, BATTLER_COORD_X_2) - (task->data[1] * 32);
            break;
        default:
            if ((gBattleAnimArgs[0] & 1) != 0)
            {
                task->data[3] = 256;
                task->data[4] = -16;
            }
            else
            {
                task->data[3] = -16;
                task->data[4] = 256;
            }
            if (task->data[1] == 1)
            {
                task->data[5] = 80 - gBattleAnimArgs[0] * 10;
            }
            else
            {
                u16 temp;

                task->data[5] = gBattleAnimArgs[0] * 10 + 40;
                temp = task->data[3];
                task->data[3] = task->data[4];
                task->data[4] = temp;
            }
        }
        if (task->data[3] < task->data[4])
        {
            task->data[1] = 1;
            task->data[6] = 0;
        }
        else
        {
            task->data[1] = -1;
            task->data[6] = 3;
        }
        ++task->data[0];
        break;
    case 1:
        if (++task->data[2] > 0)
        {
            task->data[2] = 0;
            if (sub_80AEB98(task, taskId) || sub_80AEB98(task, taskId))
                ++task->data[0];
        }
        break;
    case 2:
        if (task->data[7] == 0)
            DestroyAnimVisualTask(taskId);
        break;
    }
}

static bool8 sub_80AEB98(struct Task *task, u8 taskId)
{
    u8 spriteId = CreateSprite(&gUnknown_83E6278, task->data[3], task->data[5], 35);
    
    if (spriteId != MAX_SPRITES)
    {
        gSprites[spriteId].data[6] = taskId;
        gSprites[spriteId].data[7] = 7;
        ++task->data[7];
    }
    task->data[6] += task->data[1];
    if (task->data[6] < 0)
        task->data[6] = 3;
    if (task->data[6] > 3)
        task->data[6] = 0;
    task->data[3] += task->data[1] * 16;
    if ((task->data[1] == 1 && task->data[3] >= task->data[4])
     || (task->data[1] == -1 && task->data[3] <= task->data[4]))
        return TRUE;
    else
        return FALSE;
}

static void sub_80AEC34(struct Sprite *sprite)
{
    if (++sprite->data[0] > 12)
    {
        --gTasks[sprite->data[6]].data[sprite->data[7]];
        FreeOamMatrix(sprite->oam.matrixNum);
        DestroySprite(sprite);
    }
}

static void sub_80AEC80(struct Sprite *sprite)
{
    switch (sprite->data[0])
    {
    case 0:
        sprite->pos1.x = GetBattlerSpriteCoord(gBattleAnimAttacker, BATTLER_COORD_X_2);
        sprite->pos1.y = GetBattlerSpriteCoord(gBattleAnimAttacker, BATTLER_COORD_Y_PIC_OFFSET);
        StartSpriteAffineAnim(sprite, 2);
        ++sprite->data[0];
        break;
    case 1:
        if (sprite->affineAnimEnded)
            DestroySpriteAndMatrix(sprite);
        break;
    }
}

void sub_80AECE0(u8 taskId)
{
    struct Task *task = &gTasks[taskId];

    switch (task->data[0])
    {
    case 0:
        task->data[6] = GetBattlerSpriteCoord(gBattleAnimAttacker, BATTLER_COORD_X_2);
        task->data[7] = GetBattlerSpriteCoord(gBattleAnimAttacker, BATTLER_COORD_Y_PIC_OFFSET);
        task->data[8] = 4;
        task->data[10] = GetBattlerSpriteCoord(gBattleAnimTarget, BATTLER_COORD_X_2);
        task->data[9] = (task->data[10] - task->data[6]) / 5;
        task->data[4] = 7;
        task->data[5] = -1;
        task->data[11] = 12;
        task->data[12] = BattleAnimAdjustPanning(task->data[11] - 76);
        task->data[13] = BattleAnimAdjustPanning(SOUND_PAN_TARGET);
        task->data[14] = task->data[12];
        task->data[15] = (task->data[13] - task->data[12]) / 3;
        ++task->data[0];
        break;
    case 1:
        if (++task->data[1] > 0)
        {
            task->data[1] = 0;
            if (sub_80AEE74(task, taskId))
            {
                if (task->data[2] == 5)
                    task->data[0] = 3;
                else
                    ++task->data[0];
            }
        }
        if (task->data[11])
            --task->data[11];
        break;
    case 2:
        if (task->data[11])
            --task->data[11];
        if (++task->data[1] > 4)
        {
            task->data[1] = 0;
            if (task->data[2] & 1)
            {
                task->data[7] = 4;
                task->data[8] = 68;
                task->data[4] = 0;
                task->data[5] = 1;
            }
            else
            {
                task->data[7] = 68;
                task->data[8] = 4;
                task->data[4] = 7;
                task->data[5] = -1;
            }
            if (task->data[11])
                task->data[0] = 4;
            else
                task->data[0] = 1;
        }
        break;
    case 3:
        if (task->data[3] == 0)
            DestroyAnimVisualTask(taskId);
        break;
    case 4:
        if (task->data[11])
            --task->data[11];
        else
            task->data[0] = 1;
        break;
    }
}

static bool8 sub_80AEE74(struct Task *task, u8 taskId)
{
    u8 spriteId = CreateSprite(&gUnknown_83E62A8, task->data[6], task->data[7], 35);
    if (spriteId != MAX_SPRITES)
    {
        gSprites[spriteId].oam.tileNum += task->data[4];
        task->data[4] += task->data[5];
        if (task->data[4] < 0)
            task->data[4] = 7;
        if (task->data[4] > 7)
            task->data[4] = 0;
        gSprites[spriteId].data[6] = taskId;
        gSprites[spriteId].data[7] = 3;
        ++task->data[3];
    }
    if (task->data[4] == 0 && task->data[5] > 0)
    {
        task->data[14] += task->data[15];
        PlaySE12WithPanning(SE_W085, task->data[14]);
    }
    if ((task->data[5] < 0 && task->data[7] <= task->data[8])
     || (task->data[5] > 0 && task->data[7] >= task->data[8]))
    {
        ++task->data[2];
        task->data[6] += task->data[9];
        return TRUE;
    }
    else
    {
        task->data[7] += task->data[5] * 8;
        return FALSE;
    }
}

static void sub_80AEF60(struct Sprite *sprite)
{
    if (++sprite->data[0] > 12)
    {
        --gTasks[sprite->data[6]].data[sprite->data[7]];
        DestroySprite(sprite);
    }
}

void sub_80AEFA0(u8 taskId)
{
    struct Task *task = &gTasks[taskId];

    switch (task->data[0])
    {
    case 0:
        task->data[15] = GetBattlerSpriteCoord(gBattleAnimTarget, BATTLER_COORD_Y) + 32;
        task->data[14] = task->data[15];
        while (task->data[14] > 16)
            task->data[14] -= 32;
        task->data[13] = GetBattlerSpriteCoord(gBattleAnimTarget, BATTLER_COORD_X_2);
        task->data[12] = GetBattlerSpriteSubpriority(gBattleAnimTarget) - 2;
        ++task->data[0];
        break;
    case 1:
        if (++task->data[1] > 1)
        {
            task->data[1] = 0;
            if (sub_80AF058(task, taskId))
                ++task->data[0];
        }
        break;
    case 2:
        if (task->data[10] == 0)
            DestroyAnimVisualTask(taskId);
        break;
    }
}

static bool8 sub_80AF058(struct Task *task, u8 taskId)
{
    u8 spriteId = CreateSprite(&gUnknown_83E5F38, task->data[13], task->data[14], task->data[12]);
    
    if (spriteId != MAX_SPRITES)
    {
        gSprites[spriteId].callback = sub_80AF0C8;
        gSprites[spriteId].data[6] = taskId;
        gSprites[spriteId].data[7] = 10;
        ++task->data[10];
    }
    if (task->data[14] >= task->data[15])
        return TRUE;
    task->data[14] += 32;
    return FALSE;
}

static void sub_80AF0C8(struct Sprite *sprite)
{
    if (sprite->animEnded)
    {
        --gTasks[sprite->data[6]].data[sprite->data[7]];
        DestroySprite(sprite);
    }
}
