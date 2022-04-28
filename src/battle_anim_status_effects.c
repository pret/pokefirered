#include "global.h"
#include "gflib.h"
#include "battle.h"
#include "battle_anim.h"
#include "decompress.h"
#include "task.h"
#include "trig.h"
#include "util.h"
#include "constants/battle_anim.h"
#include "constants/pokemon.h"

// Function Declarations
static u8 sub_8078178(u8 battlerId, bool8 b);
static void sub_80782BC(u8 taskId);
static void sub_80784D8(u8 taskId);
static void sub_8078528(u8 taskId);
static void sub_80785D8(u8 taskId);
static void sub_807862C(u8 taskId);
static void Task_DoStatusAnimation(u8 taskId);
static void sub_807834C(struct Sprite *sprite);
static void sub_8078380(struct Sprite *sprite);

// Data
static const union AnimCmd sUnknown_83BF3E0[] =
{
    ANIMCMD_FRAME(0, 3),
    ANIMCMD_FRAME(4, 3),
    ANIMCMD_FRAME(8, 3),
    ANIMCMD_FRAME(12, 3),
    ANIMCMD_JUMP(0)
};

static const union AnimCmd *const sSpriteAnimTable_83BF3F4[] =
{
    sUnknown_83BF3E0
};

const struct SpriteTemplate gSpriteTemplate_83BF3F8 =
{
    .tileTag = ANIM_TAG_ORB,
    .paletteTag = ANIM_TAG_ORB,
    .oam = &gOamData_AffineOff_ObjNormal_16x16,
    .anims = sSpriteAnimTable_83BF3F4,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCB_AnimTranslateSpriteLinearAndFlicker2,
};

const struct SpriteTemplate gSpriteTemplate_83BF410 =
{
    .tileTag = ANIM_TAG_ORB,
    .paletteTag = ANIM_TAG_ORB,
    .oam = &gOamData_AffineOff_ObjNormal_16x16,
    .anims = sSpriteAnimTable_83BF3F4,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCB_AnimTranslateSpriteLinearAndFlicker,
};

static const union AnimCmd sUnknown_83BF428[] =
{
    ANIMCMD_FRAME(0, 3),
    ANIMCMD_JUMP(0)
};

static const union AnimCmd *const sSpriteAnimTable_83BF430[] =
{
    sUnknown_83BF428
};

const struct SpriteTemplate gWeatherBallUpSpriteTemplate =
{
    .tileTag = ANIM_TAG_WEATHER_BALL,
    .paletteTag = ANIM_TAG_WEATHER_BALL,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = sSpriteAnimTable_83BF430,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCB_WeatherBallUp,
};

const struct SpriteTemplate gWeatherBallNormalDownSpriteTemplate =
{
    .tileTag = ANIM_TAG_WEATHER_BALL,
    .paletteTag = ANIM_TAG_WEATHER_BALL,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = sSpriteAnimTable_83BF430,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimWeatherBallDown,
};

static const union AnimCmd sUnknown_83BF464[] =
{
    ANIMCMD_FRAME(0, 3),
    ANIMCMD_FRAME(16, 3),
    ANIMCMD_FRAME(32, 3),
    ANIMCMD_FRAME(48, 3),
    ANIMCMD_FRAME(64, 3),
    ANIMCMD_END
};

static const union AnimCmd *const sSpriteAnimTable_83BF47C[] =
{
    sUnknown_83BF464
};

const struct SpriteTemplate gSpinningSparkleSpriteTemplate =
{
    .tileTag = ANIM_TAG_SPARKLE_4,
    .paletteTag = ANIM_TAG_SPARKLE_4,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = sSpriteAnimTable_83BF47C,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCB_TrackOffsetFromAttackerAndWaitAnim,
};

const struct SpriteTemplate gSpriteTemplate_83BF498 =
{
    .tileTag = ANIM_TAG_MONSTER_FOOT,
    .paletteTag = ANIM_TAG_MONSTER_FOOT,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCB_AnimTranslateSpriteLinearAndFlicker2,
};

static const union AnimCmd sUnknown_83BF4B0[] =
{
    ANIMCMD_FRAME(0, 5),
    ANIMCMD_JUMP(0)
};

static const union AnimCmd sUnknown_83BF4B8[] =
{
    ANIMCMD_FRAME(0, 5),
    ANIMCMD_JUMP(0)
};

static const union AnimCmd sUnknown_83BF4C0[] =
{
    ANIMCMD_FRAME(0, 5),
    ANIMCMD_JUMP(0)
};

static const union AnimCmd *const sSpriteAniimTable_83BF4C8[] =
{
    sUnknown_83BF4B0,
    sUnknown_83BF4B8,
    sUnknown_83BF4C0
};

const struct SpriteTemplate gSpriteTemplate_83BF4D4 =
{
    .tileTag = ANIM_TAG_IMPACT,
    .paletteTag = ANIM_TAG_IMPACT,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = sSpriteAniimTable_83BF4C8,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCB_AnimTranslateSpriteLinearAndFlicker2,
};

static const union AnimCmd sUnknown_83BF4EC[] =
{
    ANIMCMD_FRAME(0, 15),
    ANIMCMD_JUMP(0)
};

static const union AnimCmd *const sSpriteAnimTable_83BF4F4[] =
{
    sUnknown_83BF4EC
};

static const union AffineAnimCmd sUnknown_83BF4F8[] =
{
    AFFINEANIMCMD_FRAME(96, 96, 0, 0),
    AFFINEANIMCMD_FRAME(2, 2, 0, 1),
    AFFINEANIMCMD_JUMP(1)
};

static const union AffineAnimCmd *const sSpriteAffineAnimTable_83BF510[] =
{
    sUnknown_83BF4F8
};

const struct SpriteTemplate gSpriteTemplate_83BF514 =
{
    .tileTag = ANIM_TAG_ORB,
    .paletteTag = ANIM_TAG_ORB,
    .oam = &gOamData_AffineDouble_ObjNormal_16x16,
    .anims = sSpriteAnimTable_83BF4F4,
    .images = NULL,
    .affineAnims = sSpriteAffineAnimTable_83BF510,
    .callback = SpriteCB_AnimTranslateSpriteLinearAndFlicker,
};

static const u8 sUnknown_83BF52C[] = _("TASK OVER\nタスクがオ-バ-しました");

static const struct Subsprite sSubsprites_83BF544[] =
{
    {.x = -16, .y = -16, .shape = SPRITE_SHAPE(8x8),  .size = 3, .tileOffset =   0, .priority = 2},
    {.x = -16, .y =  48, .shape = SPRITE_SHAPE(16x8), .size = 3, .tileOffset =  64, .priority = 2},
    {.x =  48, .y = -16, .shape = SPRITE_SHAPE(8x16), .size = 3, .tileOffset =  96, .priority = 2},
    {.x =  48, .y =  48, .shape = SPRITE_SHAPE(8x8),  .size = 2, .tileOffset = 128, .priority = 2},
};

static const struct SubspriteTable sUnknown_83BF554[] =
{
    {NELEMS(sSubsprites_83BF544), sSubsprites_83BF544},
};

static const struct SpriteTemplate sUnknown_83BF55C =
{
    .tileTag = ANIM_TAG_ICE_CUBE,
    .paletteTag = ANIM_TAG_ICE_CUBE,
    .oam = &gOamData_AffineOff_ObjBlend_64x64,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy,
};

static const struct SpriteTemplate sUnknown_83BF574 =
{
    .tileTag = ANIM_TAG_CIRCLE_IMPACT,
    .paletteTag = ANIM_TAG_CIRCLE_IMPACT,
    .oam = &gOamData_AffineOff_ObjNormal_8x8,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_807834C,
};

// Functions
static u8 sub_8078178(u8 battlerId, bool8 b)
{
    u8 battlerSpriteId = gBattlerSpriteIds[battlerId];
    u8 taskId = CreateTask(sub_80782BC, 10);
    u8 spriteId2;
    u8 i;

    LoadCompressedSpriteSheetUsingHeap(&gBattleAnimPicTable[GET_TRUE_SPRITE_INDEX(ANIM_TAG_CIRCLE_IMPACT)]);
    LoadCompressedSpritePaletteUsingHeap(&gBattleAnimPaletteTable[GET_TRUE_SPRITE_INDEX(ANIM_TAG_CIRCLE_IMPACT)]);
    gTasks[taskId].data[0] = battlerId;
    if (b)
    {
        gTasks[taskId].data[1] = RGB_RED;
        for (i = 0; i < 10; i++)
        {
            spriteId2 = CreateSprite(&sUnknown_83BF574, gSprites[battlerSpriteId].x, gSprites[battlerSpriteId].y + 32, 0);
            gSprites[spriteId2].data[0] = i * 51;
            gSprites[spriteId2].data[1] = -256;
            gSprites[spriteId2].invisible = TRUE;
            if (i > 4)
                gSprites[spriteId2].data[6] = 21;
        }
    }
    else
    {
        gTasks[taskId].data[1] = RGB_BLUE;
        for (i = 0; i < 10; i++)
        {
            spriteId2 = CreateSprite(&sUnknown_83BF574, gSprites[battlerSpriteId].x, gSprites[battlerSpriteId].y - 32, 0);
            gSprites[spriteId2].data[0] = i * 51;
            gSprites[spriteId2].data[1] = 256;
            gSprites[spriteId2].invisible = TRUE;
            if (i > 4)
                gSprites[spriteId2].data[6] = 21;
        }
    }
    gSprites[spriteId2].data[7] = 1;
    return taskId;
}

static void sub_80782BC(u8 taskId)
{
    if (gTasks[taskId].data[2] == 2)
    {
        gTasks[taskId].data[2] = 0;
        BlendPalette(0x100 + gTasks[taskId].data[0] * 16, 16, gTasks[taskId].data[4], gTasks[taskId].data[1]);
        if (gTasks[taskId].data[5] == 0)
        {
            gTasks[taskId].data[4]++;
            if (gTasks[taskId].data[4] > 8)
                gTasks[taskId].data[5] ^= 1;
        }
        else
        {
            u16 var = gTasks[taskId].data[4];

            gTasks[taskId].data[4]--;
            if (gTasks[taskId].data[4] < 0)
            {
                gTasks[taskId].data[4] = var;
                gTasks[taskId].data[5] ^= 1;
                gTasks[taskId].data[3]++;
                if (gTasks[taskId].data[3] == 2)
                    DestroyTask(taskId);
            }
        }
    }
    else
    {
        gTasks[taskId].data[2]++;
    }
}

static void sub_807834C(struct Sprite *sprite)
{
    if (sprite->data[6] == 0)
    {
        sprite->invisible = FALSE;
        sprite->callback = sub_8078380;
        sub_8078380(sprite);
    }
    else
    {
        sprite->data[6]--;
    }
}

static void sub_8078380(struct Sprite *sprite)
{
    sprite->x2 = Cos(sprite->data[0], 32);
    sprite->y2 = Sin(sprite->data[0], 8);
    if (sprite->data[0] < 128)
        sprite->subpriority = 29;
    else
        sprite->subpriority = 31;
    sprite->data[0] = (sprite->data[0] + 8) & 0xFF;
    sprite->data[5] += sprite->data[1];
    sprite->y2 += sprite->data[5] >> 8;
    sprite->data[2]++;
    if (sprite->data[2] == 52)
    {
        if (sprite->data[7])
            DestroySpriteAndFreeResources(sprite);
        else
            DestroySprite(sprite);
    }
}

void AnimTask_FrozenIceCube(u8 taskId)
{
    s16 x = GetBattlerSpriteCoord(gBattleAnimTarget, BATTLER_COORD_X_2) - 32;
    s16 y = GetBattlerSpriteCoord(gBattleAnimTarget, BATTLER_COORD_Y_PIC_OFFSET) - 36;
    u8 spriteId;

    if (IsContest())
        x -= 6;
    
    SetGpuReg(REG_OFFSET_BLDCNT, BLDCNT_EFFECT_BLEND | BLDCNT_TGT2_ALL);
    SetGpuReg(REG_OFFSET_BLDALPHA, BLDALPHA_BLEND(0, 16));
    spriteId = CreateSprite(&sUnknown_83BF55C, x, y, 4);
    if (GetSpriteTileStartByTag(ANIM_TAG_ICE_CUBE) == SPRITE_INVALID_TAG)
        gSprites[spriteId].invisible = TRUE;
    
    SetSubspriteTables(&gSprites[spriteId], sUnknown_83BF554);
    gTasks[taskId].data[15] = spriteId;
    gTasks[taskId].func = sub_80784D8;
}

static void sub_80784D8(u8 taskId)
{
    gTasks[taskId].data[1]++;
    if (gTasks[taskId].data[1] == 10)
    {
        gTasks[taskId].func = sub_8078528;
        gTasks[taskId].data[1] = 0;
    }
    else
    {
        u8 var = gTasks[taskId].data[1];

        SetGpuReg(REG_OFFSET_BLDALPHA, BLDALPHA_BLEND(var, 16 - var));
    }
}

static void sub_8078528(u8 taskId)
{
    u8 palIndex = IndexOfSpritePaletteTag(ANIM_TAG_ICE_CUBE);

    if (gTasks[taskId].data[1]++ > 13)
    {
        gTasks[taskId].data[2]++;
        if (gTasks[taskId].data[2] == 3)
        {
            u16 temp;

            temp = gPlttBufferFaded[0x100 + palIndex * 16 + 13];
            gPlttBufferFaded[0x100 + palIndex * 16 + 13] = gPlttBufferFaded[0x100 + palIndex * 16 + 14];
            gPlttBufferFaded[0x100 + palIndex * 16 + 14] = gPlttBufferFaded[0x100 + palIndex * 16 + 15];
            gPlttBufferFaded[0x100 + palIndex * 16 + 15] = temp;

            gTasks[taskId].data[2] = 0;
            gTasks[taskId].data[3]++;
            if (gTasks[taskId].data[3] == 3)
            {
                gTasks[taskId].data[3] = 0;
                gTasks[taskId].data[1] = 0;
                gTasks[taskId].data[4]++;
                if (gTasks[taskId].data[4] == 2)
                {
                    gTasks[taskId].data[1] = 9;
                    gTasks[taskId].func = sub_80785D8;
                }
            }
        }
    }
}

static void sub_80785D8(u8 taskId)
{
    gTasks[taskId].data[1]--;
    if (gTasks[taskId].data[1] == -1)
    {
        gTasks[taskId].func = sub_807862C;
        gTasks[taskId].data[1] = 0;
    }
    else
    {
        u8 var = gTasks[taskId].data[1];

        SetGpuReg(REG_OFFSET_BLDALPHA, BLDALPHA_BLEND(var, 16 - var));
    }
}

static void sub_807862C(u8 taskId)
{
    gTasks[taskId].data[1]++;
    if (gTasks[taskId].data[1] == 37)
    {
        u8 spriteId = gTasks[taskId].data[15];

        FreeSpriteOamMatrix(&gSprites[spriteId]);
        DestroySprite(&gSprites[spriteId]);
    }
    else if (gTasks[taskId].data[1] == 39)
    {
        SetGpuReg(REG_OFFSET_BLDCNT, 0);
        SetGpuReg(REG_OFFSET_BLDALPHA, 0);
        DestroyAnimVisualTask(taskId);
    }
}

#define CASE(by, stat) case (STAT_ANIM_##by + stat - 1)

void AnimTask_StatsChange(u8 taskId)
{
    bool16 goesDown = FALSE;
    s16 animStatId = 0;
    bool16 sharply = FALSE;

    switch (gBattleSpritesDataPtr->animationData->animArg)
    {
    CASE(PLUS1,  STAT_ATK):     goesDown = FALSE;  animStatId = 0;  break;
    CASE(PLUS1,  STAT_DEF):     goesDown = FALSE;  animStatId = 1;  break;
    CASE(PLUS1,  STAT_SPEED):   goesDown = FALSE;  animStatId = 3;  break;
    CASE(PLUS1,  STAT_SPATK):   goesDown = FALSE;  animStatId = 5;  break;
    CASE(PLUS1,  STAT_SPDEF):   goesDown = FALSE;  animStatId = 6;  break;
    CASE(PLUS1,  STAT_ACC):     goesDown = FALSE;  animStatId = 2;  break;
    CASE(PLUS1,  STAT_EVASION): goesDown = FALSE;  animStatId = 4;  break;

    CASE(MINUS1, STAT_ATK):     goesDown = TRUE;   animStatId = 0;  break;
    CASE(MINUS1, STAT_DEF):     goesDown = TRUE;   animStatId = 1;  break;
    CASE(MINUS1, STAT_SPEED):   goesDown = TRUE;   animStatId = 3;  break;
    CASE(MINUS1, STAT_SPATK):   goesDown = TRUE;   animStatId = 5;  break;
    CASE(MINUS1, STAT_SPDEF):   goesDown = TRUE;   animStatId = 6;  break;
    CASE(MINUS1, STAT_ACC):     goesDown = TRUE;   animStatId = 2;  break;
    CASE(MINUS1, STAT_EVASION): goesDown = TRUE;   animStatId = 4;  break;

    CASE(PLUS2,  STAT_ATK):     goesDown = FALSE;  animStatId = 0;     sharply = TRUE;   break;
    CASE(PLUS2,  STAT_DEF):     goesDown = FALSE;  animStatId = 1;     sharply = TRUE;   break;
    CASE(PLUS2,  STAT_SPEED):   goesDown = FALSE;  animStatId = 3;     sharply = TRUE;   break;
    CASE(PLUS2,  STAT_SPATK):   goesDown = FALSE;  animStatId = 5;     sharply = TRUE;   break;
    CASE(PLUS2,  STAT_SPDEF):   goesDown = FALSE;  animStatId = 6;     sharply = TRUE;   break;
    CASE(PLUS2,  STAT_ACC):     goesDown = FALSE;  animStatId = 2;     sharply = TRUE;   break;
    CASE(PLUS2,  STAT_EVASION): goesDown = FALSE;  animStatId = 4;     sharply = TRUE;   break;

    CASE(MINUS2, STAT_ATK):     goesDown = TRUE;   animStatId = 0;     sharply = TRUE;   break;
    CASE(MINUS2, STAT_DEF):     goesDown = TRUE;   animStatId = 1;     sharply = TRUE;   break;
    CASE(MINUS2, STAT_SPEED):   goesDown = TRUE;   animStatId = 3;     sharply = TRUE;   break;
    CASE(MINUS2, STAT_SPATK):   goesDown = TRUE;   animStatId = 5;     sharply = TRUE;   break;
    CASE(MINUS2, STAT_SPDEF):   goesDown = TRUE;   animStatId = 6;     sharply = TRUE;   break;
    CASE(MINUS2, STAT_ACC):     goesDown = TRUE;   animStatId = 2;     sharply = TRUE;   break;
    CASE(MINUS2, STAT_EVASION): goesDown = TRUE;   animStatId = 4;     sharply = TRUE;   break;

    case STAT_ANIM_MULTIPLE_PLUS1:  goesDown = FALSE;  animStatId = 0xFF;  sharply = FALSE;  break;
    case STAT_ANIM_MULTIPLE_PLUS2:  goesDown = FALSE;  animStatId = 0xFF;  sharply = TRUE;   break;
    case STAT_ANIM_MULTIPLE_MINUS1: goesDown = TRUE;   animStatId = 0xFF;  sharply = FALSE;  break;
    case STAT_ANIM_MULTIPLE_MINUS2: goesDown = TRUE;   animStatId = 0xFF;  sharply = TRUE;   break;

    default:
        DestroyAnimVisualTask(taskId);
        return;
    }

    gBattleAnimArgs[0] = goesDown;
    gBattleAnimArgs[1] = animStatId;
    gBattleAnimArgs[2] = 0;
    gBattleAnimArgs[3] = 0;
    gBattleAnimArgs[4] = sharply;
    gTasks[taskId].func = InitStatsChangeAnimation;
    InitStatsChangeAnimation(taskId);
}

#undef CASE

void LaunchStatusAnimation(u8 battlerId, u8 statusAnimId)
{
    u8 taskId;

    gBattleAnimAttacker = battlerId;
    gBattleAnimTarget = battlerId;
    LaunchBattleAnimation(gBattleAnims_StatusConditions, statusAnimId, 0);
    taskId = CreateTask(Task_DoStatusAnimation, 10);
    gTasks[taskId].data[0] = battlerId;
}

static void Task_DoStatusAnimation(u8 taskId)
{
    gAnimScriptCallback();
    if (!gAnimScriptActive)
    {
        gBattleSpritesDataPtr->healthBoxesData[gTasks[taskId].data[0]].statusAnimActive = FALSE;
        DestroyTask(taskId);
    }
}
