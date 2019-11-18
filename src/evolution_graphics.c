#include "global.h"
#include "trig.h"
#include "random.h"
#include "decompress.h"
#include "palette.h"
#include "sound.h"
#include "task.h"
#include "evolution_scene.h"
#include "evolution_graphics.h"
#include "constants/songs.h"

void nullsub_85(struct Sprite * sprite);
void sub_80F5DD0(u8 taskId);
void EvoTask_CreatePreEvoSparkleSet1(u8 taskId);
void EvoTask_WaitForPre1SparklesToGoUp(u8 taskId);
void sub_80F5ED8(u8 taskId);
void EvoTask_CreatePreEvoSparklesSet2(u8 taskId);
void sub_80F5F64(u8 taskId);
void sub_80F5F8C(u8 taskId);
void EvoTask_CreatePostEvoSparklesSet1(u8 taskId);
void sub_80F6040(u8 taskId);
void sub_80F6080(u8 taskId);
void sub_80F60E4(u8 taskId);
void sub_80F6170(u8 taskId);
void sub_80F61C0(u8 taskId);
void sub_80F6224(u8 taskId);
void sub_80F6400(u8 taskId);
void sub_80F6424(u8 taskId);
void sub_80F6474(u8 taskId);
void PreEvoInvisible_PostEvoVisible_KillTask(u8 taskId);
void PreEvoVisible_PostEvoInvisible_KillTask(u8 taskId);

static const u16 gUnknown_841EE84[] = INCBIN_U16("graphics/misc/evolution_sprite_841EEA4.gbapal");
static const u32 gUnknown_841EEA4[] = INCBIN_U32("graphics/misc/evolution_sprite_841EEA4.4bpp.lz");

static const struct CompressedSpriteSheet gUnknown_841EEC4[] = {
    { gUnknown_841EEA4, 0x20, 1001 },
    {}
};
static const struct SpritePalette gUnknown_841EED4[] = {
    { gUnknown_841EE84, 1001 },
    {}
};

static const struct OamData gOamData_841EEE4 = {
    .y = 160,
    .priority = 1
};

static const union AnimCmd gUnknown_841EEEC[] = {
    ANIMCMD_FRAME(0, 8),
    ANIMCMD_END
};

static const union AnimCmd *const gUnknown_841EEF4[] = {
    gUnknown_841EEEC
};

static const struct SpriteTemplate gUnknown_841EEF8 = {
    .tileTag = 1001,
    .paletteTag = 1001,
    .oam = &gOamData_841EEE4,
    .anims = gUnknown_841EEF4,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = nullsub_85
};

static const u16 gUnknown_841EF10[12] = {
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

static const s16 gUnknown_841EF28[][2] = {
    {-4, 0x10},
    {-3, 0x30},
    {-2, 0x50},
    {-1, 0x70},
    { 1, 0x70},
    { 2, 0x50},
    { 3, 0x30},
    { 4, 0x10}
};

void nullsub_85(struct Sprite * sprite)
{

}

void SetEvoSparklesMatrices(void)
{
    u16 i;
    for (i = 0; i < NELEMS(gUnknown_841EF10); i++)
        SetOamMatrix(i + 20, gUnknown_841EF10[i], 0, 0, gUnknown_841EF10[i]);
}

void SpriteCB_PreEvoSparkleSet1(struct Sprite * sprite)
{
    u8 mnum;
    if (sprite->pos1.y > 8)
    {
        sprite->pos1.y = 88 - sprite->data[7] * sprite->data[7] / 80;
        sprite->pos2.y = Sin((u8)sprite->data[6], sprite->data[5]) / 4;
        sprite->pos2.x = Cos((u8) sprite->data[6], sprite->data[5]);
        sprite->data[6] += 4;
        if (sprite->data[7] & 1)
            sprite->data[5]--;
        sprite->data[7]++;
        if (sprite->pos2.y > 0)
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

void CreatePreEvoSparkleSet1(u8 a0)
{
    u8 spriteId = CreateSprite(&gUnknown_841EEF8, 120, 88, 0);
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

void SpriteCB_PreEvoSparkleSet2(struct Sprite * sprite)
{
    if (sprite->pos1.y < 88)
    {
        sprite->pos1.y = 8 + sprite->data[7] * sprite->data[7] / 5;
        sprite->pos2.y = Sin((u8)sprite->data[6], sprite->data[5]) / 4;
        sprite->pos2.x = Cos((u8)sprite->data[6], sprite->data[5]);
        sprite->data[5] = Sin((u8)(sprite->data[7] * 4), 40) + 8;
        sprite->data[7]++;
    }
    else
    {
        DestroySprite(sprite);
    }
}

void CreatePreEvoSparkleSet2(u8 a0)
{
    u8 spriteId = CreateSprite(&gUnknown_841EEF8, 120, 8, 0);
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

void SpriteCB_PostEvoSparkleSet1(struct Sprite * sprite)
{
    if (sprite->data[5] > 8)
    {
        sprite->pos2.y = Sin((u8)sprite->data[6], sprite->data[5]);
        sprite->pos2.x = Cos((u8)sprite->data[6], sprite->data[5]);
        sprite->data[5] -= sprite->data[3];
        sprite->data[6] += 4;
    }
    else
    {
        DestroySprite(sprite);
    }
}

void CreatePostEvoSparkleSet1(u8 a0, u8 a1)
{
    u8 spriteId = CreateSprite(&gUnknown_841EEF8, 120, 56, 0);
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

void SpriteCB_PostEvoSparkleSet2(struct Sprite * sprite)
{
    u8 mnum;
    if ((sprite->data[7] & 3) == 0)
        sprite->pos1.y++;
    if (sprite->data[6] < 128)
    {
        sprite->pos2.y = -Sin((u8)sprite->data[6], sprite->data[5]);
        sprite->pos1.x = 120 + sprite->data[3] * sprite->data[7] / 3;
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

void CreatePostEvoSparkleSet2(u8 unused)
{
    u8 spriteId = CreateSprite(&gUnknown_841EEF8, 120, 56, 0);
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
    LoadCompressedSpriteSheetUsingHeap(gUnknown_841EEC4);
    LoadSpritePalettes(gUnknown_841EED4);
}

u8 LaunchTask_PreEvoSparklesSet1(u16 a0)
{
    u8 taskId = CreateTask(sub_80F5DD0, 0);
    gTasks[taskId].data[1] = a0;
    return taskId;
}

void sub_80F5DD0(u8 taskId)
{
    SetEvoSparklesMatrices();
    gTasks[taskId].data[15] = 0;
    BeginNormalPaletteFade(3 << gTasks[taskId].data[1], 10, 0, 16, RGB_WHITE);
    gTasks[taskId].func = EvoTask_CreatePreEvoSparkleSet1;
    PlaySE(SE_W025);
}

void EvoTask_CreatePreEvoSparkleSet1(u8 taskId)
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

void EvoTask_WaitForPre1SparklesToGoUp(u8 taskId)
{
    if (gTasks[taskId].data[15] != 0)
        gTasks[taskId].data[15]--;
    else
        DestroyTask(taskId);
}

u8 sub_80F5EC0(void)
{
    u8 taskId = CreateTask(sub_80F5ED8, 0);
    return taskId;
}

void sub_80F5ED8(u8 taskId)
{
    SetEvoSparklesMatrices();
    gTasks[taskId].data[15] = 0;
    gTasks[taskId].func = EvoTask_CreatePreEvoSparklesSet2;
    PlaySE(SE_W062B);
}

void EvoTask_CreatePreEvoSparklesSet2(u8 taskId)
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
        gTasks[taskId].func = sub_80F5F64;
    }
}

void sub_80F5F64(u8 taskId)
{
    DestroyTask(taskId);
}

u8 sub_80F5F74(void)
{
    u8 taskId = CreateTask(sub_80F5F8C, 0);
    return taskId;
}

void sub_80F5F8C(u8 taskId)
{
    SetEvoSparklesMatrices();
    gTasks[taskId].data[15] = 0;
    gTasks[taskId].func = EvoTask_CreatePostEvoSparklesSet1;
    PlaySE(SE_REAPOKE);
}

void EvoTask_CreatePostEvoSparklesSet1(u8 taskId)
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
        gTasks[taskId].func = sub_80F6040;
    }
}

void sub_80F6040(u8 taskId)
{
    DestroyTask(taskId);
}

u8 LaunchTask_PostEvoSparklesSet2AndFlash(u16 a0)
{
    u8 taskId = CreateTask(sub_80F6080, 0);
    gTasks[taskId].data[2] = a0;
    return taskId;
}

void sub_80F6080(u8 taskId)
{
    SetEvoSparklesMatrices();
    gTasks[taskId].data[15] = 0;
    sub_80D0474();
    CpuCopy16(&gPlttBufferFaded[32], &gPlttBufferUnfaded[32], 96);
    BeginNormalPaletteFade(0xFFF90F1C, 0, 0, 16, RGB_WHITE);
    gTasks[taskId].func = sub_80F60E4;
    PlaySE(SE_W080);
}

void sub_80F60E4(u8 taskId)
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
        gTasks[taskId].func = sub_80F6170;
    }
}

void sub_80F6170(u8 taskId)
{
    if (!gPaletteFade.active)
        DestroyTask(taskId);
}

u8 sub_80F6190(u16 a0)
{
    u8 taskId = CreateTask(sub_80F61C0, 0);
    gTasks[taskId].data[2] = a0;
    return taskId;
}

void sub_80F61C0(u8 taskId)
{
    SetEvoSparklesMatrices();
    gTasks[taskId].data[15] = 0;
    sub_80D0474();
    CpuCopy16(&gPlttBufferFaded[32], &gPlttBufferUnfaded[32], 96);
    BeginNormalPaletteFade(0xFFF90F00, 0, 0, 16, RGB_WHITE);
    gTasks[taskId].func = sub_80F6224;
    PlaySE(SE_W080);
}

void sub_80F6224(u8 taskId)
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
        gTasks[taskId].func = sub_80F6170;
    }
}

void nullsub_86(struct Sprite * sprite)
{

}

u8 sub_80F62B4(u8 a0, u8 a1)
{
    u16 i;
    u8 taskId;
    u16 palette[16];
    for (i = 0; i < 16; i++)
        palette[i] = RGB_WHITE;
    taskId = CreateTask(sub_80F6400, 0);
    gTasks[taskId].data[1] = a0;
    gTasks[taskId].data[2] = a1;
    gTasks[taskId].data[3] = 256;
    gTasks[taskId].data[4] = 16;
    SetOamMatrix(30, 0x10000 / gTasks[taskId].data[3], 0, 0, 0x10000 / gTasks[taskId].data[3]);
    SetOamMatrix(31, 0x10000 / gTasks[taskId].data[4], 0, 0, 0x10000 / gTasks[taskId].data[4]);
    gSprites[a0].callback = nullsub_86;
    gSprites[a0].oam.affineMode = ST_OAM_AFFINE_NORMAL;
    gSprites[a0].oam.matrixNum = 30;
    gSprites[a0].invisible = FALSE;
    CpuCopy16(palette, &gPlttBufferFaded[256 + 16 * gSprites[a0].oam.paletteNum], 32);
    gSprites[a1].callback = nullsub_86;
    gSprites[a1].oam.affineMode = ST_OAM_AFFINE_NORMAL;
    gSprites[a1].oam.matrixNum = 31;
    gSprites[a1].invisible = FALSE;
    CpuCopy16(palette, &gPlttBufferFaded[256 + 16 * gSprites[a1].oam.paletteNum], 32);
    gTasks[taskId].data[8] = 0;
    return taskId;
}

void sub_80F6400(u8 taskId)
{
    gTasks[taskId].data[5] = FALSE;
    gTasks[taskId].data[6] = 8;
    gTasks[taskId].func = sub_80F6424;
}

void sub_80F6424(u8 taskId)
{
    if (gTasks[taskId].data[8] != 0)
    {
        PreEvoVisible_PostEvoInvisible_KillTask(taskId);
    }
    else if (gTasks[taskId].data[6] == 128)
    {
        PreEvoInvisible_PostEvoVisible_KillTask(taskId);
    }
    else
    {
        gTasks[taskId].data[6] += 2;
        gTasks[taskId].data[5] ^= TRUE;
        gTasks[taskId].func = sub_80F6474;
    }
}

void sub_80F6474(u8 taskId)
{
    u8 r6;
    if (gTasks[taskId].data[8] != 0)
    {
        gTasks[taskId].func = PreEvoVisible_PostEvoInvisible_KillTask;
    }
    else
    {
        r6 = 0;
        if (gTasks[taskId].data[5] == 0)
        {
            if (gTasks[taskId].data[3] < 0x100 - gTasks[taskId].data[6])
            {
                gTasks[taskId].data[3] += gTasks[taskId].data[6];
            }
            else
            {
                gTasks[taskId].data[3] = 0x100;
                r6 = 1;
            }
            if (gTasks[taskId].data[4] > 0x10 + gTasks[taskId].data[6])
            {
                gTasks[taskId].data[4] -= gTasks[taskId].data[6];
            }
            else
            {
                gTasks[taskId].data[4] = 0x10;
                r6++;
            }
        }
        else
        {
            if (gTasks[taskId].data[4] < 0x100 - gTasks[taskId].data[6])
            {
                gTasks[taskId].data[4] += gTasks[taskId].data[6];
            }
            else
            {
                gTasks[taskId].data[4] = 0x100;
                r6 = 1;
            }
            if (gTasks[taskId].data[3] > 0x10 + gTasks[taskId].data[6])
            {
                gTasks[taskId].data[3] -= gTasks[taskId].data[6];
            }
            else
            {
                gTasks[taskId].data[3] = 0x10;
                r6++;
            }
        }
        SetOamMatrix(30, 0x10000 / gTasks[taskId].data[3], 0, 0, 0x10000 / gTasks[taskId].data[3]);
        SetOamMatrix(31, 0x10000 / gTasks[taskId].data[4], 0, 0, 0x10000 / gTasks[taskId].data[4]);
        if (r6 == 2)
        {
            gTasks[taskId].func = sub_80F6424;
        }
    }
}

void PreEvoInvisible_PostEvoVisible_KillTask(u8 taskId)
{
    gSprites[gTasks[taskId].data[1]].oam.affineMode = ST_OAM_AFFINE_OFF;
    gSprites[gTasks[taskId].data[1]].oam.matrixNum = 0;
    gSprites[gTasks[taskId].data[1]].invisible = TRUE;
    gSprites[gTasks[taskId].data[2]].oam.affineMode = ST_OAM_AFFINE_OFF;
    gSprites[gTasks[taskId].data[2]].oam.matrixNum = 0;
    gSprites[gTasks[taskId].data[2]].invisible = FALSE;
    DestroyTask(taskId);
}

void PreEvoVisible_PostEvoInvisible_KillTask(u8 taskId)
{
    gSprites[gTasks[taskId].data[1]].oam.affineMode = ST_OAM_AFFINE_OFF;
    gSprites[gTasks[taskId].data[1]].oam.matrixNum = 0;
    gSprites[gTasks[taskId].data[1]].invisible = FALSE;
    gSprites[gTasks[taskId].data[2]].oam.affineMode = ST_OAM_AFFINE_OFF;
    gSprites[gTasks[taskId].data[2]].oam.matrixNum = 0;
    gSprites[gTasks[taskId].data[2]].invisible = TRUE;
    DestroyTask(taskId);
}
