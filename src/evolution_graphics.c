#include "global.h"
#include "gflib.h"
#include "trig.h"
#include "random.h"
#include "decompress.h"
#include "task.h"
#include "evolution_scene.h"
#include "evolution_graphics.h"
#include "constants/songs.h"

static void SpriteCallbackDummy_EvoSparkles(struct Sprite *sprite);
static void EvoTask_PreEvoSparkleSet1Init(u8 taskId);
static void EvoTask_CreatePreEvoSparkleSet1(u8 taskId);
static void EvoTask_WaitForPre1SparklesToGoUp(u8 taskId);
static void EvoTask_PreEvoSparkleSet2Init(u8 taskId);
static void EvoTask_CreatePreEvoSparklesSet2(u8 taskId);
static void EvoTask_PreEvoSparkleSet2Teardown(u8 taskId);
static void EvoTask_PostEvoSparklesSet1Init(u8 taskId);
static void EvoTask_CreatePostEvoSparklesSet1(u8 taskId);
static void EvoTask_PostEvoSparklesSet1Teardown(u8 taskId);
static void EvoTask_PostEvoSparklesSet2Init(u8 taskId);
static void EvoTask_CreatePostEvoSparklesSet2(u8 taskId);
static void EvoTask_PostEvoSparklesSet2Teardown(u8 taskId);
static void EvoTask_PostEvoSparklesSet2TradeInit(u8 taskId);
static void EvoTask_CreatePostEvoSparklesSet2Trade(u8 taskId);
static void EvoTask_PrePostEvoMonSpritesInit(u8 taskId);
static void EvoTask_ChooseNextEvoSpriteAnim(u8 taskId);
static void EvoTask_ShrinkOrExpandEvoSprites(u8 taskId);
static void PreEvoInvisible_PostEvoVisible_KillTask(u8 taskId);
static void PreEvoVisible_PostEvoInvisible_KillTask(u8 taskId);

static const u16 sEvolutionSparklesPalData[] = INCBIN_U16("graphics/evolution_scene/sparkle.gbapal");
static const u32 sEvolutionSparklesTileData[] = INCBIN_U32("graphics/evolution_scene/sparkle.4bpp.lz");

static const struct CompressedSpriteSheet sSpriteSheet_EvolutionSparkles[] = {
    { sEvolutionSparklesTileData, 0x20, 1001 },
    {}
};
static const struct SpritePalette sSpritePalette_EvolutionSparkles[] = {
    { sEvolutionSparklesPalData, 1001 },
    {}
};

static const struct OamData sOamData_EvolutionSparkles = {
    .y = 160,
    .priority = 1
};

static const union AnimCmd sSpriteAnim_EvolutionSparkles_0[] = {
    ANIMCMD_FRAME(0, 8),
    ANIMCMD_END
};

static const union AnimCmd *const sSpriteAnimTable_EvolutionSparkles[] = {
    sSpriteAnim_EvolutionSparkles_0
};

static const struct SpriteTemplate sSpriteTemplate_EvolutionSparkles = {
    .tileTag = 1001,
    .paletteTag = 1001,
    .oam = &sOamData_EvolutionSparkles,
    .anims = sSpriteAnimTable_EvolutionSparkles,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy_EvoSparkles
};

static const u16 sEvolutionSparkleMatrixScales[12] = {
    0x3C0,
    0x380,
    0x340,
    0x300,
    0x2C0,
    0x280,
    0x240,
    0x200,
    0x1C0,
    0x180,
    0x140,
    0x100
};

static const s16 sUnused[][2] = {
    {-4, 0x10},
    {-3, 0x30},
    {-2, 0x50},
    {-1, 0x70},
    { 1, 0x70},
    { 2, 0x50},
    { 3, 0x30},
    { 4, 0x10}
};

static void SpriteCallbackDummy_EvoSparkles(struct Sprite *sprite)
{

}

static void SetEvoSparklesMatrices(void)
{
    u16 i;
    for (i = 0; i < NELEMS(sEvolutionSparkleMatrixScales); i++)
        SetOamMatrix(i + 20, sEvolutionSparkleMatrixScales[i], 0, 0, sEvolutionSparkleMatrixScales[i]);
}

static void SpriteCB_PreEvoSparkleSet1(struct Sprite *sprite)
{
    u8 mnum;
    if (sprite->y > 8)
    {
        sprite->y = 88 - sprite->data[7] * sprite->data[7] / 80;
        sprite->y2 = Sin((u8)sprite->data[6], sprite->data[5]) / 4;
        sprite->x2 = Cos((u8) sprite->data[6], sprite->data[5]);
        sprite->data[6] += 4;
        if (sprite->data[7] & 1)
            sprite->data[5]--;
        sprite->data[7]++;
        if (sprite->y2 > 0)
            sprite->subpriority = 1;
        else
            sprite->subpriority = 20;
        mnum = sprite->data[5] / 4 + 20;
        if (mnum > 31)
            mnum = 31;
        sprite->oam.matrixNum = mnum;
    }
    else
    {
        DestroySprite(sprite);
    }
}

static void CreatePreEvoSparkleSet1(u8 a0)
{
    u8 spriteId = CreateSprite(&sSpriteTemplate_EvolutionSparkles, 120, 88, 0);
    if (spriteId != MAX_SPRITES)
    {
        gSprites[spriteId].data[5] = 48;
        gSprites[spriteId].data[6] = a0;
        gSprites[spriteId].data[7] = 0;
        gSprites[spriteId].oam.affineMode = ST_OAM_AFFINE_NORMAL;
        gSprites[spriteId].oam.matrixNum = 31;
        gSprites[spriteId].callback = SpriteCB_PreEvoSparkleSet1;
    }
}

static void SpriteCB_PreEvoSparkleSet2(struct Sprite *sprite)
{
    if (sprite->y < 88)
    {
        sprite->y = 8 + sprite->data[7] * sprite->data[7] / 5;
        sprite->y2 = Sin((u8)sprite->data[6], sprite->data[5]) / 4;
        sprite->x2 = Cos((u8)sprite->data[6], sprite->data[5]);
        sprite->data[5] = Sin((u8)(sprite->data[7] * 4), 40) + 8;
        sprite->data[7]++;
    }
    else
    {
        DestroySprite(sprite);
    }
}

static void CreatePreEvoSparkleSet2(u8 a0)
{
    u8 spriteId = CreateSprite(&sSpriteTemplate_EvolutionSparkles, 120, 8, 0);
    if (spriteId != MAX_SPRITES)
    {
        gSprites[spriteId].data[5] = 8;
        gSprites[spriteId].data[6] = a0;
        gSprites[spriteId].data[7] = 0;
        gSprites[spriteId].oam.affineMode = ST_OAM_AFFINE_NORMAL;
        gSprites[spriteId].oam.matrixNum = 25;
        gSprites[spriteId].subpriority = 1;
        gSprites[spriteId].callback = SpriteCB_PreEvoSparkleSet2;
    }
}

static void SpriteCB_PostEvoSparkleSet1(struct Sprite *sprite)
{
    if (sprite->data[5] > 8)
    {
        sprite->y2 = Sin((u8)sprite->data[6], sprite->data[5]);
        sprite->x2 = Cos((u8)sprite->data[6], sprite->data[5]);
        sprite->data[5] -= sprite->data[3];
        sprite->data[6] += 4;
    }
    else
    {
        DestroySprite(sprite);
    }
}

static void CreatePostEvoSparkleSet1(u8 a0, u8 a1)
{
    u8 spriteId = CreateSprite(&sSpriteTemplate_EvolutionSparkles, 120, 56, 0);
    if (spriteId != MAX_SPRITES)
    {
        gSprites[spriteId].data[3] = a1;
        gSprites[spriteId].data[5] = 120;
        gSprites[spriteId].data[6] = a0;
        gSprites[spriteId].data[7] = 0;
        gSprites[spriteId].oam.affineMode = ST_OAM_AFFINE_NORMAL;
        gSprites[spriteId].oam.matrixNum = 31;
        gSprites[spriteId].subpriority = 1;
        gSprites[spriteId].callback = SpriteCB_PostEvoSparkleSet1;
    }
}

static void SpriteCB_PostEvoSparkleSet2(struct Sprite *sprite)
{
    u8 mnum;
    if ((sprite->data[7] & 3) == 0)
        sprite->y++;
    if (sprite->data[6] < 128)
    {
        sprite->y2 = -Sin((u8)sprite->data[6], sprite->data[5]);
        sprite->x = 120 + sprite->data[3] * sprite->data[7] / 3;
        sprite->data[6]++;
        mnum = 31 - sprite->data[6] * 12 / 128;
        if (sprite->data[6] > 64)
        {
            sprite->subpriority = 1;
        }
        else
        {
            sprite->invisible = FALSE;
            sprite->subpriority = 20;
            if (sprite->data[6] > 112 && (sprite->data[6] & 1))
                sprite->invisible = TRUE;
        }
        if (mnum < 20)
            mnum = 20;
        sprite->oam.matrixNum = mnum;
        sprite->data[7]++;
    }
    else
    {
        DestroySprite(sprite);
    }
}

static void CreatePostEvoSparkleSet2(u8 unused)
{
    u8 spriteId = CreateSprite(&sSpriteTemplate_EvolutionSparkles, 120, 56, 0);
    if (spriteId != MAX_SPRITES)
    {
        gSprites[spriteId].data[3] = 3 - (Random() % 7);
        gSprites[spriteId].data[5] = 48 + (Random() & 63);
        gSprites[spriteId].data[7] = 0;
        gSprites[spriteId].oam.affineMode = ST_OAM_AFFINE_NORMAL;
        gSprites[spriteId].oam.matrixNum = 31;
        gSprites[spriteId].subpriority = 20;
        gSprites[spriteId].callback = SpriteCB_PostEvoSparkleSet2;
    }
}

void LoadEvoSparkleSpriteAndPal(void)
{
    LoadCompressedSpriteSheetUsingHeap(sSpriteSheet_EvolutionSparkles);
    LoadSpritePalettes(sSpritePalette_EvolutionSparkles);
}

u8 EvolutionSparkles_SpiralUpward(u16 a0)
{
    u8 taskId = CreateTask(EvoTask_PreEvoSparkleSet1Init, 0);
    gTasks[taskId].data[1] = a0;
    return taskId;
}

static void EvoTask_PreEvoSparkleSet1Init(u8 taskId)
{
    SetEvoSparklesMatrices();
    gTasks[taskId].data[15] = 0;
    BeginNormalPaletteFade(3 << gTasks[taskId].data[1], 10, 0, 16, RGB_WHITE);
    gTasks[taskId].func = EvoTask_CreatePreEvoSparkleSet1;
    PlaySE(SE_M_MEGA_KICK);
}

static void EvoTask_CreatePreEvoSparkleSet1(u8 taskId)
{
    u8 i;
    if (gTasks[taskId].data[15] < 64)
    {
        if ((gTasks[taskId].data[15] & 7) == 0)
        {
            for (i = 0; i < 4; i++)
                CreatePreEvoSparkleSet1(2 * (gTasks[taskId].data[15] & 0x78) + 64 * i);
        }
        gTasks[taskId].data[15]++;
    }
    else
    {
        gTasks[taskId].data[15] = 96;
        gTasks[taskId].func = EvoTask_WaitForPre1SparklesToGoUp;
    }
}

static void EvoTask_WaitForPre1SparklesToGoUp(u8 taskId)
{
    if (gTasks[taskId].data[15] != 0)
        gTasks[taskId].data[15]--;
    else
        DestroyTask(taskId);
}

u8 EvolutionSparkles_ArcDown(void)
{
    u8 taskId = CreateTask(EvoTask_PreEvoSparkleSet2Init, 0);
    return taskId;
}

static void EvoTask_PreEvoSparkleSet2Init(u8 taskId)
{
    SetEvoSparklesMatrices();
    gTasks[taskId].data[15] = 0;
    gTasks[taskId].func = EvoTask_CreatePreEvoSparklesSet2;
    PlaySE(SE_M_BUBBLE_BEAM2);
}

static void EvoTask_CreatePreEvoSparklesSet2(u8 taskId)
{
    u8 i;
    if (gTasks[taskId].data[15] < 96)
    {
        if (gTasks[taskId].data[15] < 6)
        {
            for (i = 0; i < 9; i++)
                CreatePreEvoSparkleSet2(16 * i);
        }
        gTasks[taskId].data[15]++;
    }
    else
    {
        gTasks[taskId].func = EvoTask_PreEvoSparkleSet2Teardown;
    }
}

static void EvoTask_PreEvoSparkleSet2Teardown(u8 taskId)
{
    DestroyTask(taskId);
}

u8 EvolutionSparkles_CircleInward(void)
{
    u8 taskId = CreateTask(EvoTask_PostEvoSparklesSet1Init, 0);
    return taskId;
}

static void EvoTask_PostEvoSparklesSet1Init(u8 taskId)
{
    SetEvoSparklesMatrices();
    gTasks[taskId].data[15] = 0;
    gTasks[taskId].func = EvoTask_CreatePostEvoSparklesSet1;
    PlaySE(SE_SHINY);
}

static void EvoTask_CreatePostEvoSparklesSet1(u8 taskId)
{
    u8 i;
    if (gTasks[taskId].data[15] < 48)
    {
        if (gTasks[taskId].data[15] == 0)
        {
            for (i = 0; i < 16; i++)
            {
                CreatePostEvoSparkleSet1(i * 16, 4);
            }
        }
        if (gTasks[taskId].data[15] == 32)
        {
            for (i = 0; i < 16; i++)
            {
                CreatePostEvoSparkleSet1(i * 16, 8);
            }
        }
        gTasks[taskId].data[15]++;
    }
    else
    {
        gTasks[taskId].func = EvoTask_PostEvoSparklesSet1Teardown;
    }
}

static void EvoTask_PostEvoSparklesSet1Teardown(u8 taskId)
{
    DestroyTask(taskId);
}

u8 EvolutionSparkles_SprayAndFlash(u16 species)
{
    u8 taskId = CreateTask(EvoTask_PostEvoSparklesSet2Init, 0);
    gTasks[taskId].data[2] = species;
    return taskId;
}

static void EvoTask_PostEvoSparklesSet2Init(u8 taskId)
{
    SetEvoSparklesMatrices();
    gTasks[taskId].data[15] = 0;
    IsMovingBackgroundTaskRunning();
    CpuCopy16(&gPlttBufferFaded[BG_PLTT_ID(2)], &gPlttBufferUnfaded[BG_PLTT_ID(2)], 3 * PLTT_SIZE_4BPP);
    BeginNormalPaletteFade(0xFFF90F1C, 0, 0, 16, RGB_WHITE);
    gTasks[taskId].func = EvoTask_CreatePostEvoSparklesSet2;
    PlaySE(SE_M_PETAL_DANCE);
}

static void EvoTask_CreatePostEvoSparklesSet2(u8 taskId)
{
    u8 i;
    if (gTasks[taskId].data[15] < 128)
    {
        switch (gTasks[taskId].data[15])
        {
        default:
            if (gTasks[taskId].data[15] < 50)
                CreatePostEvoSparkleSet2(Random() & 7);
            break;
        case 0:
            for (i = 0; i < 8; i++)
                CreatePostEvoSparkleSet2(i);
            break;
        case 32:
            BeginNormalPaletteFade(0xFFFF0F1C, 16, 16, 0, RGB_WHITE);
            break;
        }
        gTasks[taskId].data[15]++;
    }
    else
    {
        gTasks[taskId].func = EvoTask_PostEvoSparklesSet2Teardown;
    }
}

static void EvoTask_PostEvoSparklesSet2Teardown(u8 taskId)
{
    if (!gPaletteFade.active)
        DestroyTask(taskId);
}

u8 EvolutionSparkles_SprayAndFlash_Trade(u16 species)
{
    u8 taskId = CreateTask(EvoTask_PostEvoSparklesSet2TradeInit, 0);
    gTasks[taskId].data[2] = species;
    return taskId;
}

static void EvoTask_PostEvoSparklesSet2TradeInit(u8 taskId)
{
    SetEvoSparklesMatrices();
    gTasks[taskId].data[15] = 0;
    IsMovingBackgroundTaskRunning();
    CpuCopy16(&gPlttBufferFaded[BG_PLTT_ID(2)], &gPlttBufferUnfaded[BG_PLTT_ID(2)], 3 * PLTT_SIZE_4BPP);
    BeginNormalPaletteFade(0xFFF90F00, 0, 0, 16, RGB_WHITE);
    gTasks[taskId].func = EvoTask_CreatePostEvoSparklesSet2Trade;
    PlaySE(SE_M_PETAL_DANCE);
}

static void EvoTask_CreatePostEvoSparklesSet2Trade(u8 taskId)
{
    u8 i;
    if (gTasks[taskId].data[15] < 128)
    {
        switch (gTasks[taskId].data[15])
        {
        default:
            if (gTasks[taskId].data[15] < 50)
                CreatePostEvoSparkleSet2(Random() & 7);
            break;
        case 0:
            for (i = 0; i < 8; i++)
                CreatePostEvoSparkleSet2(i);
            break;
        case 32:
            BeginNormalPaletteFade(0xFFFF0F00, 16, 16, 0, RGB_WHITE);
            break;
        }
        gTasks[taskId].data[15]++;
    }
    else
    {
        gTasks[taskId].func = EvoTask_PostEvoSparklesSet2Teardown;
    }
}

static void SpriteCallbackDummy_MonSprites(struct Sprite *sprite)
{

}

#define tPreEvoSpriteId  data[1]
#define tPostEvoSpriteId data[2]
#define tPreEvoScale     data[3]
#define tPostEvoScale    data[4]
#define tDirection       data[5]
#define tSpeed           data[6]

u8 CycleEvolutionMonSprite(u8 preEvoSpriteId, u8 postEvoSpriteId)
{
    u16 i;
    u8 taskId;
    u16 palette[16];
    for (i = 0; i < 16; i++)
        palette[i] = RGB_WHITE;
    taskId = CreateTask(EvoTask_PrePostEvoMonSpritesInit, 0);
    gTasks[taskId].tPreEvoSpriteId = preEvoSpriteId;
    gTasks[taskId].tPostEvoSpriteId = postEvoSpriteId;
    gTasks[taskId].tPreEvoScale = 256;
    gTasks[taskId].tPostEvoScale = 16;
    SetOamMatrix(30, 0x10000 / gTasks[taskId].tPreEvoScale, 0, 0, 0x10000 / gTasks[taskId].tPreEvoScale);
    SetOamMatrix(31, 0x10000 / gTasks[taskId].tPostEvoScale, 0, 0, 0x10000 / gTasks[taskId].tPostEvoScale);
    gSprites[preEvoSpriteId].callback = SpriteCallbackDummy_MonSprites;
    gSprites[preEvoSpriteId].oam.affineMode = ST_OAM_AFFINE_NORMAL;
    gSprites[preEvoSpriteId].oam.matrixNum = 30;
    gSprites[preEvoSpriteId].invisible = FALSE;
    CpuCopy16(palette, &gPlttBufferFaded[OBJ_PLTT_ID(gSprites[preEvoSpriteId].oam.paletteNum)], PLTT_SIZE_4BPP);
    gSprites[postEvoSpriteId].callback = SpriteCallbackDummy_MonSprites;
    gSprites[postEvoSpriteId].oam.affineMode = ST_OAM_AFFINE_NORMAL;
    gSprites[postEvoSpriteId].oam.matrixNum = 31;
    gSprites[postEvoSpriteId].invisible = FALSE;
    CpuCopy16(palette, &gPlttBufferFaded[OBJ_PLTT_ID(gSprites[postEvoSpriteId].oam.paletteNum)], PLTT_SIZE_4BPP);
    gTasks[taskId].EvoGraphicsTaskEvoStop = FALSE;
    return taskId;
}

static void EvoTask_PrePostEvoMonSpritesInit(u8 taskId)
{
    gTasks[taskId].tDirection = FALSE;
    gTasks[taskId].tSpeed = 8;
    gTasks[taskId].func = EvoTask_ChooseNextEvoSpriteAnim;
}

static void EvoTask_ChooseNextEvoSpriteAnim(u8 taskId)
{
    if (gTasks[taskId].EvoGraphicsTaskEvoStop)
    {
        PreEvoVisible_PostEvoInvisible_KillTask(taskId);
    }
    else if (gTasks[taskId].tSpeed == 128)
    {
        PreEvoInvisible_PostEvoVisible_KillTask(taskId);
    }
    else
    {
        gTasks[taskId].tSpeed += 2;
        gTasks[taskId].tDirection ^= TRUE;
        gTasks[taskId].func = EvoTask_ShrinkOrExpandEvoSprites;
    }
}

static void EvoTask_ShrinkOrExpandEvoSprites(u8 taskId)
{
    u8 r6;
    if (gTasks[taskId].EvoGraphicsTaskEvoStop)
    {
        gTasks[taskId].func = PreEvoVisible_PostEvoInvisible_KillTask;
    }
    else
    {
        r6 = 0;
        if (!gTasks[taskId].tDirection)
        {
            if (gTasks[taskId].tPreEvoScale < 0x100 - gTasks[taskId].tSpeed)
            {
                gTasks[taskId].tPreEvoScale += gTasks[taskId].tSpeed;
            }
            else
            {
                gTasks[taskId].tPreEvoScale = 0x100;
                r6 = 1;
            }
            if (gTasks[taskId].tPostEvoScale > 0x10 + gTasks[taskId].tSpeed)
            {
                gTasks[taskId].tPostEvoScale -= gTasks[taskId].tSpeed;
            }
            else
            {
                gTasks[taskId].tPostEvoScale = 0x10;
                r6++;
            }
        }
        else
        {
            if (gTasks[taskId].tPostEvoScale < 0x100 - gTasks[taskId].tSpeed)
            {
                gTasks[taskId].tPostEvoScale += gTasks[taskId].tSpeed;
            }
            else
            {
                gTasks[taskId].tPostEvoScale = 0x100;
                r6 = 1;
            }
            if (gTasks[taskId].tPreEvoScale > 0x10 + gTasks[taskId].tSpeed)
            {
                gTasks[taskId].tPreEvoScale -= gTasks[taskId].tSpeed;
            }
            else
            {
                gTasks[taskId].tPreEvoScale = 0x10;
                r6++;
            }
        }
        SetOamMatrix(30, 0x10000 / gTasks[taskId].tPreEvoScale, 0, 0, 0x10000 / gTasks[taskId].tPreEvoScale);
        SetOamMatrix(31, 0x10000 / gTasks[taskId].tPostEvoScale, 0, 0, 0x10000 / gTasks[taskId].tPostEvoScale);
        if (r6 == 2)
        {
            gTasks[taskId].func = EvoTask_ChooseNextEvoSpriteAnim;
        }
    }
}

static void PreEvoInvisible_PostEvoVisible_KillTask(u8 taskId)
{
    gSprites[gTasks[taskId].tPreEvoSpriteId].oam.affineMode = ST_OAM_AFFINE_OFF;
    gSprites[gTasks[taskId].tPreEvoSpriteId].oam.matrixNum = 0;
    gSprites[gTasks[taskId].tPreEvoSpriteId].invisible = TRUE;
    gSprites[gTasks[taskId].tPostEvoSpriteId].oam.affineMode = ST_OAM_AFFINE_OFF;
    gSprites[gTasks[taskId].tPostEvoSpriteId].oam.matrixNum = 0;
    gSprites[gTasks[taskId].tPostEvoSpriteId].invisible = FALSE;
    DestroyTask(taskId);
}

static void PreEvoVisible_PostEvoInvisible_KillTask(u8 taskId)
{
    gSprites[gTasks[taskId].tPreEvoSpriteId].oam.affineMode = ST_OAM_AFFINE_OFF;
    gSprites[gTasks[taskId].tPreEvoSpriteId].oam.matrixNum = 0;
    gSprites[gTasks[taskId].tPreEvoSpriteId].invisible = FALSE;
    gSprites[gTasks[taskId].tPostEvoSpriteId].oam.affineMode = ST_OAM_AFFINE_OFF;
    gSprites[gTasks[taskId].tPostEvoSpriteId].oam.matrixNum = 0;
    gSprites[gTasks[taskId].tPostEvoSpriteId].invisible = TRUE;
    DestroyTask(taskId);
}

#undef tPreEvoSpriteId
#undef tPostEvoSpriteId
#undef tPreEvoScale
#undef tPostEvoScale
#undef tDirection
#undef tSpeed
