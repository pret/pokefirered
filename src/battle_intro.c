#include "global.h"
#include "gflib.h"
#include "battle.h"
#include "battle_anim.h"
#include "battle_setup.h"
#include "scanline_effect.h"
#include "task.h"
#include "trig.h"

static EWRAM_DATA u16 sBgCnt = 0;

extern const u8 gBattleAnimRegOffsBgCnt[];
extern const u8 gBattleIntroRegOffsBgCnt[];

static void BattleIntroSlide1(u8 taskId);
static void BattleIntroSlide2(u8 taskId);
static void BattleIntroSlide3(u8 taskId);
static void BattleIntroSlideLink(u8 taskId);

static const TaskFunc sBattleIntroSlideFuncs[] =
{
    BattleIntroSlide1, // BATTLE_TERRAIN_GRASS
    BattleIntroSlide1, // BATTLE_TERRAIN_LONG_GRASS
    BattleIntroSlide2, // BATTLE_TERRAIN_SAND
    BattleIntroSlide2, // BATTLE_TERRAIN_UNDERWATER
    BattleIntroSlide2, // BATTLE_TERRAIN_WATER
    BattleIntroSlide1, // BATTLE_TERRAIN_POND
    BattleIntroSlide1, // BATTLE_TERRAIN_MOUNTAIN
    BattleIntroSlide1, // BATTLE_TERRAIN_CAVE
    BattleIntroSlide3, // BATTLE_TERRAIN_BUILDING
    BattleIntroSlide3, // BATTLE_TERRAIN_PLAIN
};

void SetAnimBgAttribute(u8 bgId, u8 attributeId, u8 value)
{
    if (bgId < 4)
    {
        sBgCnt = GetGpuReg(gBattleAnimRegOffsBgCnt[bgId]);
        switch (attributeId)
        {
        case BG_ANIM_SCREEN_SIZE:
            ((struct BgCnt *)&sBgCnt)->screenSize = value;
            break;
        case BG_ANIM_AREA_OVERFLOW_MODE:
            ((struct BgCnt *)&sBgCnt)->areaOverflowMode = value;
            break;
        case BG_ANIM_MOSAIC:
            ((struct BgCnt *)&sBgCnt)->mosaic = value;
            break;
        case BG_ANIM_CHAR_BASE_BLOCK:
            ((struct BgCnt *)&sBgCnt)->charBaseBlock = value;
            break;
        case BG_ANIM_PRIORITY:
            ((struct BgCnt *)&sBgCnt)->priority = value;
            break;
        case BG_ANIM_PALETTES_MODE:
            ((struct BgCnt *)&sBgCnt)->palettes = value;
            break;
        case BG_ANIM_SCREEN_BASE_BLOCK:
            ((struct BgCnt *)&sBgCnt)->screenBaseBlock = value;
            break;
        }
        SetGpuReg(gBattleAnimRegOffsBgCnt[bgId], sBgCnt);
    }
}

s32 GetAnimBgAttribute(u8 bgId, u8 attributeId)
{
    u16 bgCnt;

    if (bgId < 4)
    {
        bgCnt = GetGpuReg(gBattleIntroRegOffsBgCnt[bgId]);
        switch (attributeId)
        {
        case BG_ANIM_SCREEN_SIZE:
            return ((struct BgCnt *)&bgCnt)->screenSize;
        case BG_ANIM_AREA_OVERFLOW_MODE:
            return ((struct BgCnt *)&bgCnt)->areaOverflowMode;
        case BG_ANIM_MOSAIC:
            return ((struct BgCnt *)&bgCnt)->mosaic;
        case BG_ANIM_CHAR_BASE_BLOCK:
            return ((struct BgCnt *)&bgCnt)->charBaseBlock;
        case BG_ANIM_PRIORITY:
            return ((struct BgCnt *)&bgCnt)->priority;
        case BG_ANIM_PALETTES_MODE:
            return ((struct BgCnt *)&bgCnt)->palettes;
        case BG_ANIM_SCREEN_BASE_BLOCK:
            return ((struct BgCnt *)&bgCnt)->screenBaseBlock;
        }
    }
    return 0;
}

void HandleIntroSlide(u8 terrain)
{
    u8 taskId;

    if (gBattleTypeFlags & BATTLE_TYPE_LINK)
    {
        taskId = CreateTask(BattleIntroSlideLink, 0);
    }
    else if ((gBattleTypeFlags & BATTLE_TYPE_KYOGRE_GROUDON) && gGameVersion != VERSION_RUBY)
    {
        terrain = BATTLE_TERRAIN_UNDERWATER;
        taskId = CreateTask(BattleIntroSlide2, 0);
    }
    else
    {
        taskId = CreateTask(sBattleIntroSlideFuncs[terrain], 0);
    }
    gTasks[taskId].data[0] = 0;
    gTasks[taskId].data[1] = terrain;
    gTasks[taskId].data[2] = 0;
    gTasks[taskId].data[3] = 0;
    gTasks[taskId].data[4] = 0;
    gTasks[taskId].data[5] = 0;
    gTasks[taskId].data[6] = 0;
}

void BattleIntroSlideEnd(u8 taskId)
{
    DestroyTask(taskId);
    gBattle_BG1_X = 0;
    gBattle_BG1_Y = 0;
    gBattle_BG2_X = 0;
    gBattle_BG2_Y = 0;
    SetGpuReg(REG_OFFSET_BLDCNT, 0);
    SetGpuReg(REG_OFFSET_BLDALPHA, 0);
    SetGpuReg(REG_OFFSET_BLDY, 0);
    SetGpuReg(REG_OFFSET_WININ, WININ_WIN0_BG_ALL | WININ_WIN0_OBJ | WININ_WIN0_CLR | WININ_WIN1_BG_ALL | WININ_WIN1_OBJ | WININ_WIN1_CLR);
    SetGpuReg(REG_OFFSET_WINOUT, WINOUT_WIN01_BG_ALL | WINOUT_WIN01_OBJ | WINOUT_WIN01_CLR | WINOUT_WINOBJ_BG_ALL | WINOUT_WINOBJ_OBJ | WINOUT_WINOBJ_CLR);
}

static void BattleIntroSlide1(u8 taskId)
{
    s32 i;

    gBattle_BG1_X += 6;
    switch (gTasks[taskId].data[0])
    {
    case 0:
        if (gBattleTypeFlags & BATTLE_TYPE_LINK)
        {
            gTasks[taskId].data[2] = 16;
            ++gTasks[taskId].data[0];
        }
        else
        {
            gTasks[taskId].data[2] = 1;
            ++gTasks[taskId].data[0];
        }
        break;
    case 1:
        if (--gTasks[taskId].data[2] == 0)
        {
            ++gTasks[taskId].data[0];
            SetGpuReg(REG_OFFSET_WININ, WININ_WIN0_BG_ALL | WININ_WIN0_OBJ | WININ_WIN0_CLR);
        }
        break;
    case 2:
        gBattle_WIN0V -= 0xFF;
        if ((gBattle_WIN0V & 0xFF00) == 0x3000)
        {
            ++gTasks[taskId].data[0];
            gTasks[taskId].data[2] = 240;
            gTasks[taskId].data[3] = 32;
            gIntroSlideFlags &= ~1;
        }
        break;
    case 3:
        if (gTasks[taskId].data[3])
        {
            --gTasks[taskId].data[3];
        }
        else
        {
            if (gTasks[taskId].data[1] == 1)
            {
                if (gBattle_BG1_Y != 0xFFB0)
                    gBattle_BG1_Y -= 2;
            }
            else if (gBattle_BG1_Y != 0xFFC8)
            {
                    gBattle_BG1_Y -= 1;
            }
        }
        if (gBattle_WIN0V & 0xFF00)
            gBattle_WIN0V -= 0x3FC;
        if (gTasks[taskId].data[2])
            gTasks[taskId].data[2] -= 2;
        // Scanline settings have already been set in CB2_InitBattleInternal
        for (i = 0; i < 80; ++i)
            gScanlineEffectRegBuffers[gScanlineEffect.srcBuffer][i] = gTasks[taskId].data[2];
        while (i < 160)
            gScanlineEffectRegBuffers[gScanlineEffect.srcBuffer][i++] = -gTasks[taskId].data[2];
        if (!gTasks[taskId].data[2])
        {
            gScanlineEffect.state = 3;
            ++gTasks[taskId].data[0];
            CpuFill32(0, (void *)BG_SCREEN_ADDR(28), BG_SCREEN_SIZE);
            SetBgAttribute(1, BG_ATTR_CHARBASEINDEX, 0);
            SetBgAttribute(2, BG_ATTR_CHARBASEINDEX, 0);
            SetGpuReg(REG_OFFSET_BG1CNT, BGCNT_PRIORITY(0) | BGCNT_CHARBASE(0) | BGCNT_16COLOR | BGCNT_SCREENBASE(28) | BGCNT_TXT256x512);
            SetGpuReg(REG_OFFSET_BG2CNT, BGCNT_PRIORITY(0) | BGCNT_CHARBASE(0) | BGCNT_16COLOR | BGCNT_SCREENBASE(30) | BGCNT_TXT512x256);
        }
        break;
    case 4:
        BattleIntroSlideEnd(taskId);
        break;
    }
}

static void BattleIntroSlide2(u8 taskId)
{
    s32 i;

    switch (gTasks[taskId].data[1])
    {
    case 2:
    case 4:
        gBattle_BG1_X += 8;
        break;
    case 3:
        gBattle_BG1_X += 6;
        break;
    }
    if (gTasks[taskId].data[1] == 4)
    {
        gBattle_BG1_Y = Cos2(gTasks[taskId].data[6]) / 512 - 8;
        if (gTasks[taskId].data[6] < 180)
            gTasks[taskId].data[6] += 4;
        else
            gTasks[taskId].data[6] += 6;
        if (gTasks[taskId].data[6] == 360)
            gTasks[taskId].data[6] = 0;
    }
    switch (gTasks[taskId].data[0])
    {
    case 0:
        gTasks[taskId].data[4] = 16;
        if (gBattleTypeFlags & BATTLE_TYPE_LINK)
        {
            gTasks[taskId].data[2] = 16;
            ++gTasks[taskId].data[0];
        }
        else
        {
            gTasks[taskId].data[2] = 1;
            ++gTasks[taskId].data[0];
        }
        break;
    case 1:
        if (--gTasks[taskId].data[2] == 0)
        {
            ++gTasks[taskId].data[0];
            SetGpuReg(REG_OFFSET_WININ, WININ_WIN0_BG_ALL | WININ_WIN0_OBJ | WININ_WIN0_CLR);
        }
        break;
    case 2:
        gBattle_WIN0V -= 0xFF;
        if ((gBattle_WIN0V & 0xFF00) == 0x3000)
        {
            ++gTasks[taskId].data[0];
            gTasks[taskId].data[2] = 240;
            gTasks[taskId].data[3] = 32;
            gTasks[taskId].data[5] = 1;
            gIntroSlideFlags &= ~1;
        }
        break;
    case 3:
        if (gTasks[taskId].data[3])
        {
            if (--gTasks[taskId].data[3] == 0)
            {
                SetGpuReg(REG_OFFSET_BLDCNT, BLDCNT_TGT1_BG1 | BLDCNT_EFFECT_BLEND | BLDCNT_TGT2_BG3 | BLDCNT_TGT2_OBJ);
                SetGpuReg(REG_OFFSET_BLDALPHA, BLDALPHA_BLEND(15, 0));
                SetGpuReg(REG_OFFSET_BLDY, 0);
            }
        }
        else if ((gTasks[taskId].data[4] & 0x1F) && --gTasks[taskId].data[5] == 0)
        {
                gTasks[taskId].data[4] += 0xFF;
                gTasks[taskId].data[5] = 4;
        }
        if (gBattle_WIN0V & 0xFF00)
            gBattle_WIN0V -= 0x3FC;

        if (gTasks[taskId].data[2])
            gTasks[taskId].data[2] -= 2;
        // Scanline settings have already been set in CB2_InitBattleInternal()
        for (i = 0; i < 80; ++i)
            gScanlineEffectRegBuffers[gScanlineEffect.srcBuffer][i] = gTasks[taskId].data[2];
        while (i < 160)
            gScanlineEffectRegBuffers[gScanlineEffect.srcBuffer][i++] = -gTasks[taskId].data[2];
        if (!gTasks[taskId].data[2])
        {
            gScanlineEffect.state = 3;
            ++gTasks[taskId].data[0];
            CpuFill32(0, (void *)BG_SCREEN_ADDR(28), BG_SCREEN_SIZE);
            SetBgAttribute(1, BG_ATTR_CHARBASEINDEX, 0);
            SetBgAttribute(2, BG_ATTR_CHARBASEINDEX, 0);
            SetGpuReg(REG_OFFSET_BG1CNT, BGCNT_PRIORITY(0) | BGCNT_CHARBASE(0) | BGCNT_16COLOR | BGCNT_SCREENBASE(28) | BGCNT_TXT256x512);
            SetGpuReg(REG_OFFSET_BG2CNT, BGCNT_PRIORITY(0) | BGCNT_CHARBASE(0) | BGCNT_16COLOR | BGCNT_SCREENBASE(30) | BGCNT_TXT512x256);
        }
        break;
    case 4:
        BattleIntroSlideEnd(taskId);
        break;
    }
    if (gTasks[taskId].data[0] != 4)
        SetGpuReg(REG_OFFSET_BLDALPHA, BLDALPHA_BLEND(gTasks[taskId].data[4], 0));
}

static void BattleIntroSlide3(u8 taskId)
{
    s32 i;

    gBattle_BG1_X += 8;
    switch (gTasks[taskId].data[0])
    {
    case 0:
        SetGpuReg(REG_OFFSET_BLDCNT, BLDCNT_TGT1_BG1 | BLDCNT_EFFECT_BLEND | BLDCNT_TGT2_BG3 | BLDCNT_TGT2_OBJ);
        SetGpuReg(REG_OFFSET_BLDALPHA, BLDALPHA_BLEND(8, 8));
        SetGpuReg(REG_OFFSET_BLDY, 0);
        gTasks[taskId].data[4] = BLDALPHA_BLEND(8, 8);
        if (gBattleTypeFlags & BATTLE_TYPE_LINK)
        {
            gTasks[taskId].data[2] = 16;
            ++gTasks[taskId].data[0];
        }
        else
        {
            gTasks[taskId].data[2] = 1;
            ++gTasks[taskId].data[0];
        }
        break;
    case 1:
        if (--gTasks[taskId].data[2] == 0)
        {
            ++gTasks[taskId].data[0];
            SetGpuReg(REG_OFFSET_WININ, WININ_WIN0_BG_ALL | WININ_WIN0_OBJ | WININ_WIN0_CLR);
        }
        break;
    case 2:
        gBattle_WIN0V -= 0xFF;
        if ((gBattle_WIN0V & 0xFF00) == 0x3000)
        {
            ++gTasks[taskId].data[0];
            gTasks[taskId].data[2] = 240;
            gTasks[taskId].data[3] = 32;
            gTasks[taskId].data[5] = 1;
            gIntroSlideFlags &= ~1;
        }
        break;
    case 3:
        if (gTasks[taskId].data[3])
        {
            --gTasks[taskId].data[3];
        }
        else if ((gTasks[taskId].data[4] & 0xF) && --gTasks[taskId].data[5] == 0)
        {
            gTasks[taskId].data[4] += 0xFF;
            gTasks[taskId].data[5] = 6;
        }
        if (gBattle_WIN0V & 0xFF00)
            gBattle_WIN0V -= 0x3FC;
        if (gTasks[taskId].data[2])
            gTasks[taskId].data[2] -= 2;
        // Scanline settings have already been set in CB2_InitBattleInternal()
        for (i = 0; i < 80; ++i)
            gScanlineEffectRegBuffers[gScanlineEffect.srcBuffer][i] = gTasks[taskId].data[2];
        while (i < 160)
            gScanlineEffectRegBuffers[gScanlineEffect.srcBuffer][i++] = -gTasks[taskId].data[2];
        if (!gTasks[taskId].data[2])
        {
            gScanlineEffect.state = 3;
            ++gTasks[taskId].data[0];
            CpuFill32(0, (void *)BG_SCREEN_ADDR(28), BG_SCREEN_SIZE);
            SetBgAttribute(1, BG_ATTR_CHARBASEINDEX, 0);
            SetBgAttribute(2, BG_ATTR_CHARBASEINDEX, 0);
            SetGpuReg(REG_OFFSET_BG1CNT, BGCNT_PRIORITY(0) | BGCNT_CHARBASE(0) | BGCNT_16COLOR | BGCNT_SCREENBASE(28) | BGCNT_TXT256x512);
            SetGpuReg(REG_OFFSET_BG2CNT, BGCNT_PRIORITY(0) | BGCNT_CHARBASE(0) | BGCNT_16COLOR | BGCNT_SCREENBASE(30) | BGCNT_TXT512x256);
        }
        break;
    case 4:
        BattleIntroSlideEnd(taskId);
        break;
    }
    if (gTasks[taskId].data[0] != 4)
        SetGpuReg(REG_OFFSET_BLDALPHA, BLDALPHA_BLEND(gTasks[taskId].data[4], 0));
}

static void BattleIntroSlideLink(u8 taskId)
{
    s32 i;

    if (gTasks[taskId].data[0] > 1 && !gTasks[taskId].data[4])
    {
        u16 var0 = gBattle_BG1_X & 0x8000;

        if (var0 || gBattle_BG1_X < 80)
        {
            gBattle_BG1_X += 3;
            gBattle_BG2_X -= 3;
        }
        else
        {
            CpuFill32(0, (void *)BG_SCREEN_ADDR(28), BG_SCREEN_SIZE);
            CpuFill32(0, (void *)BG_SCREEN_ADDR(30), BG_SCREEN_SIZE);
            gTasks[taskId].data[4] = 1;
        }
    }
    switch (gTasks[taskId].data[0])
    {
    case 0:
        gTasks[taskId].data[2] = 32;
        ++gTasks[taskId].data[0];
        break;
    case 1:
        if (--gTasks[taskId].data[2] == 0)
        {
            ++gTasks[taskId].data[0];
            gSprites[gBattleStruct->linkBattleVsSpriteId_V].oam.objMode = ST_OAM_OBJ_WINDOW;
            gSprites[gBattleStruct->linkBattleVsSpriteId_V].callback = SpriteCB_VsLetterInit;
            gSprites[gBattleStruct->linkBattleVsSpriteId_S].oam.objMode = ST_OAM_OBJ_WINDOW;
            gSprites[gBattleStruct->linkBattleVsSpriteId_S].callback = SpriteCB_VsLetterInit;
            SetGpuReg(REG_OFFSET_WININ, WININ_WIN0_BG_ALL | WININ_WIN0_OBJ | WININ_WIN0_CLR);
            SetGpuReg(REG_OFFSET_WINOUT, WINOUT_WINOBJ_BG_ALL | WINOUT_WINOBJ_OBJ | WINOUT_WINOBJ_CLR | WINOUT_WIN01_BG1 | WINOUT_WIN01_BG2);
        }
        break;
    case 2:
        gBattle_WIN0V -= 0xFF;
        if ((gBattle_WIN0V & 0xFF00) == 0x3000)
        {
            ++gTasks[taskId].data[0];
            gTasks[taskId].data[2] = 240;
            gTasks[taskId].data[3] = 32;
            gIntroSlideFlags &= ~1;
        }
        break;
    case 3:
        if (gBattle_WIN0V & 0xFF00)
            gBattle_WIN0V -= 0x3FC;
        if (gTasks[taskId].data[2])
            gTasks[taskId].data[2] -= 2;
        // Scanline settings have already been set in CB2_InitBattleInternal()
        for (i = 0; i < 80; ++i)
            gScanlineEffectRegBuffers[gScanlineEffect.srcBuffer][i] = gTasks[taskId].data[2];
        while (i < 160)
            gScanlineEffectRegBuffers[gScanlineEffect.srcBuffer][i++] = -gTasks[taskId].data[2];
        if (!gTasks[taskId].data[2])
        {
            gScanlineEffect.state = 3;
            ++gTasks[taskId].data[0];
            SetBgAttribute(1, BG_ATTR_CHARBASEINDEX, 0);
            SetBgAttribute(2, BG_ATTR_CHARBASEINDEX, 0);
            SetGpuReg(REG_OFFSET_BG1CNT, BGCNT_PRIORITY(0) | BGCNT_CHARBASE(0) | BGCNT_16COLOR | BGCNT_SCREENBASE(28) | BGCNT_TXT256x512);
            SetGpuReg(REG_OFFSET_BG2CNT, BGCNT_PRIORITY(0) | BGCNT_CHARBASE(0) | BGCNT_16COLOR | BGCNT_SCREENBASE(30) | BGCNT_TXT512x256);
        }
        break;
    case 4:
        BattleIntroSlideEnd(taskId);
        break;
    }
}

void CopyBattlerSpriteToBg(s32 bgId, u8 x, u8 y, u8 battlerPosition, u8 palno, u8 *tilesDest, u16 *tilemapDest, u16 tilesOffset)
{
    s32 i, j;
    u8 battler = GetBattlerAtPosition(battlerPosition);
    s32 offset = tilesOffset;

    CpuCopy16(gMonSpritesGfxPtr->sprites[battlerPosition] + BG_SCREEN_SIZE * gBattleMonForms[battler], tilesDest, BG_SCREEN_SIZE);
    LoadBgTiles(bgId, tilesDest, 0x1000, tilesOffset);
    for (i = y; i < y + 8; ++i)
        for (j = x; j < x + 8; ++j)
            tilemapDest[i * 32 + j] = offset++ | (palno << 12);
    LoadBgTilemap(bgId, tilemapDest, BG_SCREEN_SIZE, 0);
}

// Unused
static void DrawBattlerOnBgDMA(u8 arg0, u8 arg1, u8 battlerPosition, u8 arg3, u8 arg4, u16 arg5, u8 arg6, u8 arg7)
{
    s32 i, j, offset;

    DmaCopy16(3, gMonSpritesGfxPtr->sprites[battlerPosition] + BG_SCREEN_SIZE * arg3, (void *)BG_SCREEN_ADDR(0) + arg5, BG_SCREEN_SIZE);
    offset = (arg5 >> 5) - (arg7 << 9);
    for (i = arg1; i < arg1 + 8; ++i)
        for (j = arg0; j < arg0 + 8; ++j)
            *((u16 *)(BG_VRAM) + (i * 32) + (j + (arg6 << 10))) = offset++ | (arg4 << 12);
}
