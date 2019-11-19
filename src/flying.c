#include "global.h"
#include "battle_anim.h"
#include "palette.h"
#include "trig.h"
#include "constants/battle_anim.h"
#include "random.h"

static void sub_80B18E4(struct Sprite *sprite);
static void sub_80B1A1C(struct Sprite *sprite);
static void sub_80B1AB8(struct Sprite *sprite);
static void sub_80B1BB0(struct Sprite *sprite);
static void sub_80B1C3C(struct Sprite *sprite);
static void sub_80B1D88(struct Sprite *sprite);
static void sub_80B24C0(struct Sprite *sprite);
static void sub_80B2514(struct Sprite *sprite);
static void sub_80B2780(struct Sprite *sprite);
static void sub_80B2914(struct Sprite *sprite);
static void sub_80B2974(struct Sprite *sprite);
static void sub_80B2A08(struct Sprite *sprite);
static void sub_80B2AF4(struct Sprite *sprite);
static void sub_80B2BD8(struct Sprite *sprite);
static void sub_80B2CE4(struct Sprite *sprite);
static void sub_80B2D64(struct Sprite *sprite);
static void sub_80B190C(struct Sprite *sprite);
static void sub_80B198C(u8 taskId);
static void sub_80B1A9C(struct Sprite *sprite);
static void sub_80B1BF8(struct Sprite *sprite);
static void sub_80B1CC0(struct Sprite *sprite);
static void sub_80B1F94(struct Sprite *sprite);
static void sub_80B268C(struct Sprite *sprite);
static void sub_80B2820(struct Sprite *sprite);
static void sub_80B2A50(struct Sprite *sprite);
static void sub_80B2AB0(struct Sprite *sprite);
static void sub_80B2C88(struct Sprite *sprite);
static void sub_80B2CF8(struct Sprite *sprite);
static void sub_80B2E20(struct Sprite *sprite);

const struct SpriteTemplate gUnknown_83E6AE8 =
{
    .tileTag = ANIM_TAG_GUST,
    .paletteTag = ANIM_TAG_GUST,
    .oam = &gOamData_83ACA20,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80B18E4,
};

static const union AffineAnimCmd gUnknown_83E6B00[] =
{
    AFFINEANIMCMD_FRAME(0x10, 0x100, 0, 0),
    AFFINEANIMCMD_FRAME(0xA, 0x0, 0, 24),
    AFFINEANIMCMD_END,
};

static const union AffineAnimCmd *const gUnknown_83E6B18[] =
{
    gUnknown_83E6B00,
};

const struct SpriteTemplate gUnknown_83E6B1C =
{
    .tileTag = ANIM_TAG_GUST,
    .paletteTag = ANIM_TAG_GUST,
    .oam = &gOamData_83ACA80,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gUnknown_83E6B18,
    .callback = sub_80B1A1C,
};

static const union AnimCmd gUnknown_83E6B34[] =
{
    ANIMCMD_FRAME(0, 3),
    ANIMCMD_FRAME(0, 3, .hFlip = TRUE),
    ANIMCMD_FRAME(0, 3, .vFlip = TRUE),
    ANIMCMD_FRAME(0, 3, .vFlip = TRUE, .hFlip = TRUE),
    ANIMCMD_JUMP(0),
};

static const union AnimCmd *const gUnknown_83E6B48[] =
{
    gUnknown_83E6B34,
};

const struct SpriteTemplate gUnknown_83E6B4C =
{
    .tileTag = ANIM_TAG_AIR_WAVE_2,
    .paletteTag = ANIM_TAG_AIR_WAVE_2,
    .oam = &gOamData_83AC9F8,
    .anims = gUnknown_83E6B48,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80B1AB8,
};

static const union AffineAnimCmd gUnknown_83E6B64[] =
{
    AFFINEANIMCMD_FRAME(0x10, 0x100, 0, 0),
    AFFINEANIMCMD_FRAME(0x28, 0x0, 0, 6),
    AFFINEANIMCMD_FRAME(0x0, -0x20, 0, 5),
    AFFINEANIMCMD_FRAME(-0x10, 0x20, 0, 10),
    AFFINEANIMCMD_END,
};

static const union AffineAnimCmd *const gUnknown_83E6B8C[] =
{
    gUnknown_83E6B64,
};

static const union AffineAnimCmd gUnknown_83E6B90[] =
{
    AFFINEANIMCMD_FRAME(0x0, 0x0, 50, 1),
    AFFINEANIMCMD_END,
};

static const union AffineAnimCmd gUnknown_83E6B9C[] =
{
    AFFINEANIMCMD_FRAME(0x0, 0x0, -40, 1),
    AFFINEANIMCMD_END,
};

static const union AffineAnimCmd *const gUnknown_83E6BB0[] =
{
    gUnknown_83E6B90,
    gUnknown_83E6B9C,
};

const struct SpriteTemplate gUnknown_83E6BB8 =
{
    .tileTag = ANIM_TAG_ROUND_SHADOW,
    .paletteTag = ANIM_TAG_ROUND_SHADOW,
    .oam = &gOamData_83ACAA0,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gUnknown_83E6B8C,
    .callback = sub_80B1BB0,
};

const struct SpriteTemplate gUnknown_83E6BD0 =
{
    .tileTag = ANIM_TAG_ROUND_SHADOW,
    .paletteTag = ANIM_TAG_ROUND_SHADOW,
    .oam = &gOamData_83ACA40,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gUnknown_83E6BB0,
    .callback = sub_80B1C3C,
};

static const union AnimCmd gUnknown_83E6BE8[] =
{
    ANIMCMD_FRAME(0, 0),
    ANIMCMD_END,
};

static const union AnimCmd gUnknown_83E6BF0[] =
{
    ANIMCMD_FRAME(16, 0, .hFlip = TRUE),
    ANIMCMD_END,
};

static const union AnimCmd *const gUnknown_83E6BF8[] =
{
    gUnknown_83E6BE8,
    gUnknown_83E6BF0,
};

const struct SpriteTemplate gUnknown_83E6C00 =
{
    .tileTag = ANIM_TAG_WHITE_FEATHER,
    .paletteTag = ANIM_TAG_WHITE_FEATHER,
    .oam = &gOamData_83ACA38,
    .anims = gUnknown_83E6BF8,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80B1D88,
};

// not used
static const u16 gUnknown_83E6C18[] = INCBIN_U16("graphics/battle_anims/sprites/unk_83E6C18.gbapal");

const struct SpriteTemplate gUnknown_83E6C38 =
{
    .tileTag = ANIM_TAG_SMALL_BUBBLES,
    .paletteTag = ANIM_TAG_SMALL_BUBBLES,
    .oam = &gOamData_83AC9D0,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80B24C0,
};

const struct SpriteTemplate gUnknown_83E6C50 =
{
    .tileTag = ANIM_TAG_WHITE_FEATHER,
    .paletteTag = ANIM_TAG_WHITE_FEATHER,
    .oam = &gOamData_83ACA38,
    .anims = gUnknown_83E6BF8,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80B2514,
};

static const union AnimCmd gUnknown_83E6C68[] =
{
    ANIMCMD_FRAME(0, 1),
    ANIMCMD_FRAME(8, 1),
    ANIMCMD_FRAME(16, 1),
    ANIMCMD_FRAME(8, 1, .hFlip = TRUE),
    ANIMCMD_FRAME(0, 1, .hFlip = TRUE),
    ANIMCMD_END,
};

static const union AnimCmd *const gUnknown_83E6C80[] =
{
    gUnknown_83E6C68,
};

const struct SpriteTemplate gUnknown_83E6C84 =
{
    .tileTag = ANIM_TAG_WHIRLWIND_LINES,
    .paletteTag = ANIM_TAG_WHIRLWIND_LINES,
    .oam = &gOamData_83AC9F8,
    .anims = gUnknown_83E6C80,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80B2780,
};

static const union AffineAnimCmd gUnknown_83E6C9C[] =
{
    AFFINEANIMCMD_FRAME(0x10, 0x100, 0, 0),
    AFFINEANIMCMD_FRAME(0x28, 0x0, 0, 6),
    AFFINEANIMCMD_FRAME(0x0, -0x20, 0, 5),
    AFFINEANIMCMD_FRAME(-0x14, 0x0, 0, 7),
    AFFINEANIMCMD_FRAME(-0x14, -0x14, 0, 5),
    AFFINEANIMCMD_END,
};

static const union AffineAnimCmd *const gUnknown_83E6CCC[] =
{
    gUnknown_83E6C9C,
};

const struct SpriteTemplate gUnknown_83E6CD0 =
{
    .tileTag = ANIM_TAG_ROUND_SHADOW,
    .paletteTag = ANIM_TAG_ROUND_SHADOW,
    .oam = &gOamData_83ACAA0,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gUnknown_83E6CCC,
    .callback = sub_80B2914,
};

static const union AffineAnimCmd gUnknown_83E6CE8[] =
{
    AFFINEANIMCMD_FRAME(0xA0, 0x100, 0, 0),
    AFFINEANIMCMD_END,
};

static const union AffineAnimCmd *const gUnknown_83E6CF8[] =
{
    gUnknown_83E6CE8,
};

const struct SpriteTemplate gUnknown_83E6CFC =
{
    .tileTag = ANIM_TAG_ROUND_SHADOW,
    .paletteTag = ANIM_TAG_ROUND_SHADOW,
    .oam = &gOamData_83ACAA0,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gUnknown_83E6CF8,
    .callback = sub_80B2974,
};

static const union AffineAnimCmd gUnknown_83E6D14[] =
{
    AFFINEANIMCMD_FRAME(0x10, 0x100, 0, 0),
    AFFINEANIMCMD_FRAME(0x28, 0x0, 0, 6),
    AFFINEANIMCMD_FRAME(0x0, -0x20, 0, 5),
    AFFINEANIMCMD_FRAME(-0x10, 0x20, 0, 10),
    AFFINEANIMCMD_END,
};

static const union AffineAnimCmd *const gUnknown_83E6D3C[] =
{
    gUnknown_83E6D14,
};

const struct SpriteTemplate gUnknown_83E6D40 =
{
    .tileTag = ANIM_TAG_ROUND_SHADOW,
    .paletteTag = ANIM_TAG_ROUND_SHADOW,
    .oam = &gOamData_83ACAA0,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gUnknown_83E6D3C,
    .callback = sub_80B2A08,
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

const struct SpriteTemplate gUnknown_83E6D7C =
{
    .tileTag = ANIM_TAG_SPLASH,
    .paletteTag = ANIM_TAG_SPLASH,
    .oam = &gOamData_83ACAA0,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80B2AF4,
};

const struct SpriteTemplate gUnknown_83E6D94 =
{
    .tileTag = ANIM_TAG_SWEAT_BEAD,
    .paletteTag = ANIM_TAG_SWEAT_BEAD,
    .oam = &gOamData_83AC9C8,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80B2BD8,
};

const struct SpriteTemplate gUnknown_83E6DAC =
{
    .tileTag = ANIM_TAG_CIRCLE_OF_LIGHT,
    .paletteTag = ANIM_TAG_CIRCLE_OF_LIGHT,
    .oam = &gOamData_83ACB00,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80B2CE4,
};

const struct SpriteTemplate gUnknown_83E6DB4 =
{
    .tileTag = ANIM_TAG_BIRD,
    .paletteTag = ANIM_TAG_BIRD,
    .oam = &gOamData_83ACAA0,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80B2D64,
};

static void sub_80B18E4(struct Sprite *sprite)
{
    InitSpritePosToAnimTarget(sprite, FALSE);
    sprite->pos1.y += 20;
    sprite->data[1] = 191;
    sprite->callback = sub_80B190C;
    sprite->callback(sprite);
}

static void sub_80B190C(struct Sprite *sprite)
{
    sprite->pos2.x = Sin(sprite->data[1], 32);
    sprite->pos2.y = Cos(sprite->data[1], 8);
    sprite->data[1] += 5;
    sprite->data[1] &= 0xFF;
    if (++sprite->data[0] == 71)
        DestroyAnimSprite(sprite);
}

void sub_80B194C(u8 taskId)
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

static void sub_80B1A1C(struct Sprite *sprite)
{
    InitSpritePosToAnimAttacker(sprite, TRUE);
    if (GetBattlerSide(gBattleAnimAttacker) != B_SIDE_PLAYER)
        gBattleAnimArgs[2] = -gBattleAnimArgs[2];
    sprite->data[0] = gBattleAnimArgs[4];
    sprite->data[1] = sprite->pos1.x;
    sprite->data[2] = GetBattlerSpriteCoord(gBattleAnimTarget, BATTLER_COORD_X_2) + gBattleAnimArgs[2];
    sprite->data[3] = sprite->pos1.y;
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

static void sub_80B1AB8(struct Sprite *sprite)
{
    if (GetBattlerSide(gBattleAnimAttacker) != B_SIDE_PLAYER)
    {
        gBattleAnimArgs[0] = -gBattleAnimArgs[0];
        gBattleAnimArgs[1] = -gBattleAnimArgs[1];
        gBattleAnimArgs[2] = -gBattleAnimArgs[2];
        gBattleAnimArgs[3] = -gBattleAnimArgs[3];
    }
    if (IsContest())
    {
        gBattleAnimArgs[1] = -gBattleAnimArgs[1];
        gBattleAnimArgs[3] = -gBattleAnimArgs[3];
    }
    sprite->pos1.x = GetBattlerSpriteCoord(gBattleAnimAttacker, BATTLER_COORD_X_2);
    sprite->pos1.y = GetBattlerSpriteCoord(gBattleAnimAttacker, BATTLER_COORD_Y_PIC_OFFSET);
    sprite->pos1.x += gBattleAnimArgs[0];
    sprite->pos1.y += gBattleAnimArgs[1];
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

static void sub_80B1BB0(struct Sprite *sprite)
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
        sprite->pos2.y -= (sprite->data[2] >> 8);
    }
    if (sprite->pos1.y + sprite->pos2.y < -32)
        DestroyAnimSprite(sprite);
}

static void sub_80B1C3C(struct Sprite *sprite)
{
    if (GetBattlerSide(gBattleAnimAttacker) != B_SIDE_PLAYER)
    {
        sprite->pos1.x = 272;
        sprite->pos1.y = -32;
        StartSpriteAffineAnim(sprite, 1);
    }
    else
    {
        sprite->pos1.x = -32;
        sprite->pos1.y = -32;
    }
    sprite->data[0] = gBattleAnimArgs[0];
    sprite->data[1] = sprite->pos1.x;
    sprite->data[2] = GetBattlerSpriteCoord(gBattleAnimTarget, BATTLER_COORD_X_2);
    sprite->data[3] = sprite->pos1.y;
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
        sprite->pos1.x += sprite->pos2.x;
        sprite->pos2.x = 0;
        sprite->data[3] &= 0xFF;
    }
    if (sprite->pos1.x + sprite->pos2.x < -32
     || sprite->pos1.x + sprite->pos2.x > 272
     || sprite->pos1.y + sprite->pos2.y > 160)
    {
        gSprites[GetAnimBattlerSpriteId(ANIM_ATTACKER)].invisible = FALSE;
        DestroyAnimSprite(sprite);
    }
}

void sub_80B1D3C(struct Sprite *sprite)
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

static void sub_80B1D88(struct Sprite *sprite)
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
    sprite->pos1.x = GetBattlerSpriteCoord(battler, BATTLER_COORD_ATTR_HEIGHT) + gBattleAnimArgs[0];
    spriteCoord = GetBattlerSpriteCoord(battler, BATTLER_COORD_ATTR_WIDTH);
    sprite->pos1.y = spriteCoord + gBattleAnimArgs[1];
    data->unk8 = sprite->pos1.y << 8;
    data->unkE_1 = spriteCoord + gBattleAnimArgs[6];
    data->unk0_0c = 1;
    data->unk2 = gBattleAnimArgs[2] & 0xFF;
    data->unkA = (gBattleAnimArgs[2] >> 8) & 0xFF;
    data->unk4 = gBattleAnimArgs[3];
    data->unk6 = gBattleAnimArgs[4];
    *(u16 *)(data->unkC) = gBattleAnimArgs[5];
    if (data->unk2 >= 64 && data->unk2 <= 191)
    {
        if (!IsContest())
            sprite->oam.priority = GetBattlerSpriteBGPriority(battler) + 1;
        else
            sprite->oam.priority = GetBattlerSpriteBGPriority(battler);
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
    sprite->pos2.x = (gSineTable[data->unk2] * data->unkC[0]) >> 8;
    matrixNum = sprite->oam.matrixNum;
    sinIndex = (-sprite->pos2.x >> 1) + data->unkA;
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
    sprite->callback = sub_80B1F94;
}

static void sub_80B1F94(struct Sprite *sprite)
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
            if (data->unk0_1 << 24 >> 24 == 1) // the shifts have to be here
            {
                data->unk0_0d = 1;
                data->unk0_0a = 1;
                data->unk1 = 0;
            }
            else if (data->unk0_1 << 24 >> 24 == 3)
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
                    if (!IsContest())
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
                    else
                    {
                        if (!data->unkE_0)
                        {
                            sprite->subpriority -= 12;
                            data->unkE_0 ^= 1;
                        }
                        else
                        {
                            sprite->subpriority += 12;
                            data->unkE_0 ^= 1;
                        }
                    }
                }
                data->unk0_0d = 0;
                data->unk2;
            }
            data->unk0_1 = 0;
            break;
        case 1:
            if (data->unk0_1 << 24 >> 24 == 0)
            {
                data->unk0_0d = 1;
                data->unk0_0a = 1;
                data->unk1 = 0;
            }
            else if (data->unk0_1 << 24 >> 24 == 2)
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
                    if (!IsContest())
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
                    else
                    {
                        if (!data->unkE_0)
                        {
                            sprite->subpriority -= 12;
                            data->unkE_0 ^= 1;
                        }
                        else
                        {
                            sprite->subpriority += 12;
                            data->unkE_0 ^= 1;
                        }
                    }
                }
                data->unk0_0d = 0;
            }
            data->unk0_1 = 1;
            break;
        case 2:
            if (data->unk0_1 << 24 >> 24 == 3)
            {
                data->unk0_0d = 1;
                data->unk0_0a = 1;
                data->unk1 = 0;
            }
            else if (data->unk0_1 << 24 >> 24 == 1)
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
                    if (!IsContest())
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
                    else
                    {
                        if (!data->unkE_0)
                        {
                            sprite->subpriority -= 12;
                            data->unkE_0 ^= 1;
                        }
                        else
                        {
                            sprite->subpriority += 12;
                            data->unkE_0 ^= 1;
                        }
                    }
                }
                data->unk0_0d = 0;
            }
            data->unk0_1 = 2;
            break;
        case 3:
            if (data->unk0_1 << 24 >> 24 == 2)
            {
                data->unk0_0d = 1;
            }
            else if (data->unk0_1 << 24 >> 24 == 0)
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
                    if (!IsContest())
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
                    else
                    {
                        if (!data->unkE_0)
                        {
                            sprite->subpriority -= 12;
                            data->unkE_0 ^= 1;
                        }
                        else
                        {
                            sprite->subpriority += 12;
                            data->unkE_0 ^= 1;
                        }
                    }
                }
                data->unk0_0d = 0;
            }
            data->unk0_1 = 3;
            break;
        }
        #ifndef NONMATCHING
            asm("":::"r8");
        #endif
        sprite->pos2.x = (data->unkC[data->unk0_0b] * gSineTable[data->unk2]) >> 8;
        matrixNum = sprite->oam.matrixNum;
        sinIndex = (-sprite->pos2.x >> 1) + data->unkA;
        sinVal = gSineTable[sinIndex];
        gOamMatrices[matrixNum].a = gOamMatrices[matrixNum].d = gSineTable[sinIndex + 64];
        gOamMatrices[matrixNum].b = sinVal;
        gOamMatrices[matrixNum].c = -sinVal;
        data->unk8 += data->unk6;
        sprite->pos1.y = data->unk8 >> 8;
        if (data->unk4 & 0x8000)
            data->unk2 = (data->unk2 - (data->unk4 & 0x7FFF)) & 0xFF;
        else
            data->unk2 = (data->unk2 + (data->unk4 & 0x7FFF)) & 0xFF;
        if (sprite->pos1.y + sprite->pos2.y >= data->unkE_1)
        {
            sprite->data[0] = 0;
            sprite->callback = sub_80B1D3C;
        }
    }
}

static void sub_80B24C0(struct Sprite *sprite)
{
    sprite->oam.priority = GetBattlerSpriteBGPriority(gBattleAnimTarget);
    sprite->pos1.x = GetBattlerSpriteCoord(gBattleAnimAttacker, 2);
    sprite->pos1.y = GetBattlerSpriteCoord(gBattleAnimAttacker, 3);
    sprite->callback = TranslateAnimSpriteToTargetMonLocation;
}

static void sub_80B2514(struct Sprite *sprite)
{
    u8 matrixNum;
    s16 rn, sinVal;

    sprite->data[1] = gBattleAnimArgs[0];
    sprite->data[2] = gBattleAnimArgs[1];
    sprite->data[3] = gBattleAnimArgs[2];
    if (!IsContest())
    {
        if (gBattlerPositions[gBattleAnimTarget] & B_POSITION_OPPONENT_LEFT)
            sprite->data[7] = GetBattlerSpriteCoord(gBattleAnimTarget, BATTLER_COORD_ATTR_WIDTH) + gBattleAnimArgs[3];
        else
            sprite->data[7] = GetBattlerSpriteCoord(gBattleAnimTarget, BATTLER_COORD_ATTR_WIDTH) + 40;
        if (gBattleAnimArgs[4])
            sprite->oam.priority = GetBattlerSpriteBGPriority(gBattleAnimTarget) + 1;
        else
            sprite->oam.priority = GetBattlerSpriteBGPriority(gBattleAnimTarget);
    }
    else
    {
        sprite->data[7] = GetBattlerSpriteCoord(gBattleAnimTarget, BATTLER_COORD_ATTR_WIDTH) + gBattleAnimArgs[3];
    }
    sprite->data[4] = gSineTable[sprite->data[1] & 0xFF];
    sprite->data[5] = -gSineTable[(sprite->data[1] & 0xFF) + 64];
    sprite->data[6] = 0;
    sprite->pos2.y = 0;
    sprite->pos2.x = 0;
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
    sprite->pos2.x = (sprite->data[4] * sprite->data[6]) >> 8;
    sprite->pos2.y = (sprite->data[5] * sprite->data[6]) >> 8;
    sprite->data[6] += sprite->data[3] & 0xFF;
    if (sprite->data[6] < (sprite->data[2] & 0xFF))
        return;
    sprite->pos1.x += sprite->pos2.x;
    sprite->pos1.y += sprite->pos2.y;
    sprite->pos2.x = 0;
    sprite->pos2.y = 0;
    memcpy(&fData, tData, sizeof(struct FeatherDanceData));
    memset(tData, 0, sizeof(struct FeatherDanceData));
    tData->unk8 = sprite->pos1.y << 8;
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
    sprite->callback = sub_80B1F94;
}

static void sub_80B2780(struct Sprite *sprite)
{
    u16 arg;
    u8 mult;

    if (!gBattleAnimArgs[2])
        InitSpritePosToAnimAttacker(sprite, 0);
    else
        InitSpritePosToAnimTarget(sprite, FALSE);
    if ((!gBattleAnimArgs[2] && GetBattlerSide(gBattleAnimAttacker) == B_SIDE_PLAYER)
     || (gBattleAnimArgs[2] == 1 && GetBattlerSide(gBattleAnimTarget) == B_SIDE_PLAYER))
        sprite->pos1.x += 8;
    SeekSpriteAnim(sprite, gBattleAnimArgs[4]);
    sprite->pos1.x -= 32;
    sprite->data[1] = 0x0ccc;
    arg = gBattleAnimArgs[4];
    mult = 12;
    sprite->pos2.x += mult * arg;
    sprite->data[0] = arg;
    sprite->data[7] = gBattleAnimArgs[3];
    sprite->callback = sub_80B2820;
}

static void sub_80B2820(struct Sprite *sprite)
{
    sprite->pos2.x += sprite->data[1] >> 8;
    if (++sprite->data[0] == 6)
    {
        sprite->data[0] = 0;
        sprite->pos2.x = 0;
        StartSpriteAnim(sprite, 0);
    }

    if (--sprite->data[7] == -1)
        DestroyAnimSprite(sprite);
}

void sub_80B2868(u8 taskId)
{
    if (!(gTasks[taskId].data[0] % 32))
    {
        ++gAnimVisualTaskCount;
        gBattleAnimArgs[0] = Sin(gTasks[taskId].data[0], -13);
        gBattleAnimArgs[1] = Cos(gTasks[taskId].data[0], -13);
        gBattleAnimArgs[2] = 1;
        gBattleAnimArgs[3] = 3;
        CreateSpriteAndAnimate(&gUnknown_83E7C98,
                               GetBattlerSpriteCoord(gBattleAnimTarget, 2),
                               GetBattlerSpriteCoord(gBattleAnimTarget, 3),
                               3);
    }
    gTasks[taskId].data[0] += 8;
    if (gTasks[taskId].data[0] > 255)
        DestroyAnimVisualTask(taskId);
}

static void sub_80B2914(struct Sprite *sprite)
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

static void sub_80B2974(struct Sprite *sprite)
{
    switch (sprite->data[0])
    {
    case 0:
        sprite->pos1.y = GetBattlerSpriteCoord(gBattleAnimTarget, 1);
        sprite->pos2.y = -sprite->pos1.y - 32;
        ++sprite->data[0];
        break;
    case 1:
        sprite->pos2.y += 10;
        if (sprite->pos2.y >= 0)
            ++sprite->data[0];
        break;
    case 2:
        sprite->pos2.y -= 10;
        if (sprite->pos1.y + sprite->pos2.y < -32)
        {
            gSprites[GetAnimBattlerSpriteId(ANIM_ATTACKER)].invisible = FALSE;
            DestroyAnimSprite(sprite);
        }
        break;
    }
}

static void sub_80B2A08(struct Sprite *sprite)
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
    else if (sprite->pos1.y + sprite->pos2.y > -32)
    {
        sprite->data[2] += sprite->data[1];
        sprite->pos2.y -= (sprite->data[2] >> 8);
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
    sprite->pos2.y += sprite->data[2] >> 8;
    if (sprite->pos1.y + sprite->pos2.y > -32)
        sprite->invisible = FALSE;
    if (sprite->pos2.y > 0)
        DestroyAnimSprite(sprite);
}

static void sub_80B2AF4(struct Sprite *sprite)
{
    u32 matrixNum;
    s32 t1, t2;

    switch (sprite->data[0])
    {
    case 0:
        if (!gBattleAnimArgs[0])
        {
            sprite->pos1.x = GetBattlerSpriteCoord(gBattleAnimAttacker, 0);
            sprite->pos1.y = GetBattlerSpriteCoord(gBattleAnimAttacker, 1);
        }
        else
        {
            sprite->pos1.x = GetBattlerSpriteCoord(gBattleAnimTarget, 0);
            sprite->pos1.y = GetBattlerSpriteCoord(gBattleAnimTarget, 1);
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
        sprite->pos2.y = t2;
        if (sprite->data[2] == 24)
        {
            sub_8075AD8(sprite);
            DestroyAnimSprite(sprite);
        }
        break;
    }
}

static void sub_80B2BD8(struct Sprite *sprite)
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
        sprite->pos1.x = GetBattlerSpriteCoord(gBattleAnimAttacker, 0);
        sprite->pos1.y = GetBattlerSpriteCoord(gBattleAnimAttacker, 1) + 32;
    }
    else
    {
        sprite->pos1.x = GetBattlerSpriteCoord(gBattleAnimTarget, 0);
        sprite->pos1.y = GetBattlerSpriteCoord(gBattleAnimTarget, 1) + 32;
    }
    sprite->callback = sub_80B2C88;
}

static void sub_80B2C88(struct Sprite *sprite)
{
    if (sprite->data[2] == 0)
    {
        sprite->pos2.x += sprite->data[0] >> 8;
        sprite->pos2.y -= sprite->data[1] >> 8;
    }
    else
    {
        sprite->pos2.x -= sprite->data[0] >> 8;
        sprite->pos2.y -= sprite->data[1] >> 8;
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

static void sub_80B2D64(struct Sprite *sprite)
{
    u16 rotation;
    s16 posx = sprite->pos1.x;
    s16 posy = sprite->pos1.y;

    sprite->pos1.x = GetBattlerSpriteCoord(gBattleAnimAttacker, 2);
    sprite->pos1.y = GetBattlerSpriteCoord(gBattleAnimAttacker, 3);
    sprite->data[4] = sprite->pos1.x << 4;
    sprite->data[5] = sprite->pos1.y << 4;
    sprite->data[6] = ((posx - sprite->pos1.x) << 4) / 12;
    sprite->data[7] = ((posy - sprite->pos1.y) << 4) / 12;
    rotation = ArcTan2Neg(posx - sprite->pos1.x, posy - sprite->pos1.y);
    rotation += 49152;
    TrySetSpriteRotScale(sprite, 1, 0x100, 0x100, rotation);
    sprite->callback = sub_80B2E20;
}

static void sub_80B2E20(struct Sprite *sprite)
{
    sprite->data[4] += sprite->data[6];
    sprite->data[5] += sprite->data[7];
    sprite->pos1.x = sprite->data[4] >> 4;
    sprite->pos1.y = sprite->data[5] >> 4;
    if (sprite->pos1.x > 285 || sprite->pos1.x < -45
     || sprite->pos1.y > 157 || sprite->pos1.y < -45)
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
