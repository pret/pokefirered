#include "global.h"
#include "battle_anim.h"
#include "trig.h"

static void sub_80B1620(struct Sprite *sprite);
static void sub_80B16A0(struct Sprite *sprite);
static void sub_80B1744(struct Sprite *sprite);
static void sub_80B17C4(struct Sprite *sprite);
static void AnimBubbleEffect(struct Sprite *sprite);
static void sub_80B1684(struct Sprite *sprite);
static void sub_80B1728(struct Sprite *sprite);
static void sub_80B1798(struct Sprite *sprite);
static void AnimBubbleEffectStep(struct Sprite *sprite);

static const union AnimCmd gUnknown_83E6994[] =
{
    ANIMCMD_FRAME(0, 5),
    ANIMCMD_FRAME(8, 5),
    ANIMCMD_FRAME(16, 5),
    ANIMCMD_FRAME(24, 5),
    ANIMCMD_END,
};

static const union AnimCmd *const gUnknown_83E69A8[] =
{
    gUnknown_83E6994,
};

const struct SpriteTemplate gUnknown_83E69AC =
{
    .tileTag = ANIM_TAG_TOXIC_BUBBLE,
    .paletteTag = ANIM_TAG_TOXIC_BUBBLE,
    .oam = &gOamData_AffineOff_ObjNormal_16x32,
    .anims = gUnknown_83E69A8,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSpriteOnMonPos,
};

static const union AnimCmd gUnknown_83E69C4[] =
{
    ANIMCMD_FRAME(0, 1),
    ANIMCMD_END,
};

static const union AnimCmd gUnknown_83E69CC[] =
{
    ANIMCMD_FRAME(4, 1),
    ANIMCMD_END,
};

static const union AnimCmd gUnknown_83E69D4[] =
{
    ANIMCMD_FRAME(8, 1),
    ANIMCMD_END,
};

static const union AnimCmd *const gUnknown_83E69DC[] =
{
    gUnknown_83E69C4,
};

static const union AnimCmd *const gUnknown_83E69E0[] =
{
    gUnknown_83E69CC,
};

static const union AnimCmd *const gUnknown_83E69E4[] =
{
    gUnknown_83E69D4,
};

static const union AffineAnimCmd gUnknown_83E69E8[] =
{
    AFFINEANIMCMD_FRAME(0x160, 0x160, 0, 0),
    AFFINEANIMCMD_FRAME(-0xA, -0xA, 0, 10),
    AFFINEANIMCMD_FRAME(0xA, 0xA, 0, 10),
    AFFINEANIMCMD_JUMP(0),
};

static const union AffineAnimCmd gUnknown_83E6A08[] =
{
    AFFINEANIMCMD_FRAME(0xEC, 0xEC, 0, 0),
    AFFINEANIMCMD_END,
};

static const union AffineAnimCmd *const gUnknown_83E6A18[] =
{
    gUnknown_83E69E8,
};

static const union AffineAnimCmd *const gUnknown_83E6A1C[] =
{
    gUnknown_83E6A08,
};

const struct SpriteTemplate gUnknown_83E6A20 =
{
    .tileTag = ANIM_TAG_POISON_BUBBLE,
    .paletteTag = ANIM_TAG_POISON_BUBBLE,
    .oam = &gOamData_AffineDouble_ObjNormal_16x16,
    .anims = gUnknown_83E69DC,
    .images = NULL,
    .affineAnims = gUnknown_83E6A18,
    .callback = sub_80B1620,
};

const struct SpriteTemplate gUnknown_83E6A38 =
{
    .tileTag = ANIM_TAG_POISON_BUBBLE,
    .paletteTag = ANIM_TAG_POISON_BUBBLE,
    .oam = &gOamData_AffineDouble_ObjNormal_16x16,
    .anims = gUnknown_83E69DC,
    .images = NULL,
    .affineAnims = gUnknown_83E6A18,
    .callback = sub_80B16A0,
};

const struct SpriteTemplate gUnknown_83E6A50 =
{
    .tileTag = ANIM_TAG_POISON_BUBBLE,
    .paletteTag = ANIM_TAG_POISON_BUBBLE,
    .oam = &gOamData_AffineNormal_ObjNormal_16x16,
    .anims = gUnknown_83E69E4,
    .images = NULL,
    .affineAnims = gUnknown_83E6A1C,
    .callback = sub_80B1744,
};

static const union AffineAnimCmd gUnknown_83E6A68[] =
{
    AFFINEANIMCMD_FRAME(-0x10, 0x10, 0, 6),
    AFFINEANIMCMD_FRAME(0x10, -0x10, 0, 6),
    AFFINEANIMCMD_JUMP(0),
};

const union AffineAnimCmd *const gAffineAnims_Droplet[] =
{
    gUnknown_83E6A68,
};

const struct SpriteTemplate gUnknown_83E6A84 =
{
    .tileTag = ANIM_TAG_POISON_BUBBLE,
    .paletteTag = ANIM_TAG_POISON_BUBBLE,
    .oam = &gOamData_AffineDouble_ObjNormal_16x16,
    .anims = gUnknown_83E69E0,
    .images = NULL,
    .affineAnims = gAffineAnims_Droplet,
    .callback = sub_80B17C4,
};

static const union AffineAnimCmd gUnknown_83E6A9C[] =
{
    AFFINEANIMCMD_FRAME(0x9C, 0x9C, 0, 0),
    AFFINEANIMCMD_FRAME(0x5, 0x5, 0, 20),
    AFFINEANIMCMD_END,
};

static const union AffineAnimCmd *const gUnknown_83E6AB4[] =
{
    gUnknown_83E6A9C,
};

const struct SpriteTemplate gPoisonBubbleSpriteTemplate =
{
    .tileTag = ANIM_TAG_POISON_BUBBLE,
    .paletteTag = ANIM_TAG_POISON_BUBBLE,
    .oam = &gOamData_AffineNormal_ObjNormal_16x16,
    .anims = gUnknown_83E69DC,
    .images = NULL,
    .affineAnims = gUnknown_83E6AB4,
    .callback = AnimBubbleEffect,
};

const struct SpriteTemplate gWaterBubbleSpriteTemplate =
{
    .tileTag = ANIM_TAG_SMALL_BUBBLES,
    .paletteTag = ANIM_TAG_SMALL_BUBBLES,
    .oam = &gOamData_AffineNormal_ObjBlend_16x16,
    .anims = gAnims_WaterBubble,
    .images = NULL,
    .affineAnims = gUnknown_83E6AB4,
    .callback = AnimBubbleEffect,
};

static void sub_80B1620(struct Sprite *sprite)
{
    if (!gBattleAnimArgs[3])
        StartSpriteAnim(sprite, 2);
    InitSpritePosToAnimAttacker(sprite, 1);
    sprite->data[0] = gBattleAnimArgs[2];
    sprite->data[2] = GetBattlerSpriteCoord(gBattleAnimTarget, 2);
    sprite->data[4] = GetBattlerSpriteCoord(gBattleAnimTarget, 3);
    sprite->data[5] = -30;
    InitAnimArcTranslation(sprite);
    sprite->callback = sub_80B1684;
}

static void sub_80B1684(struct Sprite *sprite)
{
    if (TranslateAnimHorizontalArc(sprite))
        DestroyAnimSprite(sprite);
}

static void sub_80B16A0(struct Sprite *sprite)
{
    s16 l1, l2;

    if (!gBattleAnimArgs[3])
        StartSpriteAnim(sprite, 2);
    InitSpritePosToAnimAttacker(sprite, 1);
    SetAverageBattlerPositions(gBattleAnimTarget, 1, &l1, &l2);
    if (GetBattlerSide(gBattleAnimAttacker))
        gBattleAnimArgs[4] = -gBattleAnimArgs[4];
    sprite->data[0] = gBattleAnimArgs[2];
    sprite->data[2] = l1 + gBattleAnimArgs[4];
    sprite->data[4] = l2 + gBattleAnimArgs[5];
    sprite->data[5] = -30;
    InitAnimArcTranslation(sprite);
    sprite->callback = sub_80B1728;
}

static void sub_80B1728(struct Sprite *sprite)
{
    if (TranslateAnimHorizontalArc(sprite))
        DestroyAnimSprite(sprite);
}

static void sub_80B1744(struct Sprite *sprite)
{
    sprite->data[0] = gBattleAnimArgs[2];
    sprite->data[1] = sprite->pos1.x;
    sprite->data[2] = sprite->pos1.x + gBattleAnimArgs[0];
    sprite->data[3] = sprite->pos1.y;
    sprite->data[4] = sprite->pos1.y + gBattleAnimArgs[1];
    InitSpriteDataForLinearTranslation(sprite);
    sprite->data[5] = sprite->data[1] / gBattleAnimArgs[2];
    sprite->data[6] = sprite->data[2] / gBattleAnimArgs[2];
    sprite->callback = sub_80B1798;
}

static void sub_80B1798(struct Sprite *sprite)
{
    TranslateSpriteLinearFixedPoint(sprite);
    sprite->data[1] -= sprite->data[5];
    sprite->data[2] -= sprite->data[6];
    if (!sprite->data[0])
        DestroyAnimSprite(sprite);
}

static void sub_80B17C4(struct Sprite *sprite)
{
    SetAverageBattlerPositions(gBattleAnimTarget, TRUE, &sprite->pos1.x, &sprite->pos1.y);
    if (GetBattlerSide(gBattleAnimAttacker) != B_SIDE_PLAYER)
        gBattleAnimArgs[0] = -gBattleAnimArgs[0];
    sprite->pos1.x += gBattleAnimArgs[0];
    sprite->pos1.y += gBattleAnimArgs[1];
    sprite->data[0] = gBattleAnimArgs[4];
    sprite->data[2] = sprite->pos1.x + gBattleAnimArgs[2];
    sprite->data[4] = sprite->pos1.y + sprite->data[0];
    sprite->callback = StartAnimLinearTranslation;
    StoreSpriteCallbackInData6(sprite, DestroyAnimSprite);
}

// Animates a bubble by rising upward, swaying side to side, and
// enlarging the sprite. This is used as an after-effect by poison-type
// moves, along with MOVE_BUBBLE, and MOVE_BUBBLEBEAM.
// arg 0: initial x pixel offset
// arg 1: initial y pixel offset
// arg 2: 0 = single-target, 1 = multi-target
static void AnimBubbleEffect(struct Sprite *sprite)
{
    if (!gBattleAnimArgs[2])
    {
        InitSpritePosToAnimTarget(sprite, TRUE);
    }
    else
    {
        SetAverageBattlerPositions(gBattleAnimTarget, TRUE, &sprite->pos1.x, &sprite->pos1.y);

        if (GetBattlerSide(gBattleAnimAttacker) != B_SIDE_PLAYER)
            gBattleAnimArgs[0] = -gBattleAnimArgs[0];
        sprite->pos1.x += gBattleAnimArgs[0];
        sprite->pos1.y += gBattleAnimArgs[1];
    }
    sprite->callback = AnimBubbleEffectStep;
}

static void AnimBubbleEffectStep(struct Sprite *sprite)
{
    sprite->data[0] = (sprite->data[0] + 0xB) & 0xFF;
    sprite->pos2.x = Sin(sprite->data[0], 4);
    sprite->data[1] += 0x30;
    sprite->pos2.y = -(sprite->data[1] >> 8);
    if (sprite->affineAnimEnded)
        DestroyAnimSprite(sprite);
}
