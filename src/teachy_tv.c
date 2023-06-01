#include "task.h"
#include "gflib.h"
#include "menu_helpers.h"
#include "new_menu_helpers.h"
#include "scanline_effect.h"
#include "decompress.h"
#include "list_menu.h"
#include "item_menu.h"
#include "item.h"
#include "menu_indicators.h"
#include "event_object_movement.h"
#include "random.h"
#include "constants/songs.h"
#include "constants/items.h"
#include "event_data.h"
#include "load_save.h"
#include "battle_transition.h"
#include "battle_main.h"
#include "battle.h"
#include "battle_controllers.h"
#include "global.fieldmap.h"
#include "teachy_tv.h"
#include "help_system.h"
#include "overworld.h"
#include "graphics.h"
#include "fieldmap.h"
#include "strings.h"
#include "constants/field_effects.h"
#include "constants/event_objects.h"

struct TeachyTvCtrlBlk
{
    MainCallback callback;
    u8 mode;
    u8 whichScript;
    u16 scrollOffset;
    u16 selectedRow;
};

struct TeachyTvBuf
{
    MainCallback savedCallback;
    u16 screenTilemap[BG_SCREEN_SIZE];
    u16 buffer2[BG_SCREEN_SIZE];
    u16 buffer3[BG_SCREEN_SIZE];
    u16 titleTilemap[BG_SCREEN_SIZE];
    u8 grassAnimCounterLo;
    u8 grassAnimCounterHi;
    u8 grassAnimDisabled;
    u8 scrollIndicatorArrowPairId;
};

static EWRAM_DATA struct TeachyTvCtrlBlk sStaticResources = {0};
static EWRAM_DATA struct TeachyTvBuf * sResources = NULL;

static void TTVcmd_TransitionRenderBg2TeachyTvGraphicInitNpcPos(u8 taskId);
static void TTVcmd_ClearBg2TeachyTvGraphic(u8 taskId);
static void TTVcmd_NpcMoveAndSetupTextPrinter(u8 taskId);
static void TTVcmd_IdleIfTextPrinterIsActive(u8 taskId);
static void TTVcmd_TextPrinterSwitchStringByOptionChosen(u8 taskId);
static void TTVcmd_TextPrinterSwitchStringByOptionChosen2(u8 taskId);
static void TTVcmd_IdleIfTextPrinterIsActive2(u8 taskId);
static void TTVcmd_EraseTextWindowIfKeyPressed(u8 taskId);
static void TTVcmd_StartAnimNpcWalkIntoGrass(u8 taskId);
static void TTVcmd_DudeMoveUp(u8 taskId);
static void TTVcmd_DudeMoveRight(u8 taskId);
static void TTVcmd_DudeTurnLeft(u8 taskId);
static void TTVcmd_DudeMoveLeft(u8 taskId);
static void TTVcmd_RenderAndRemoveBg1EndGraphic(u8 taskId);
static void TTVcmd_TaskBattleOrFadeByOptionChosen(u8 taskId);
static void TeachyTvCallback(void);
static void TeachyTvMainCallback(void);
static void TeachyTvVblankHandler(void);
static void TeachyTvCreateAndRenderRbox(void);
static void TeachyTvInitIo(void);
static u8 TeachyTvSetupObjEventAndOam(void);
static void TeachyTvSetupPostBattleWindowAndObj(u8);
static u8 TeachyTvSetupWindow(void);
static void TeachyTvSetupScrollIndicatorArrowPair(void);
static void TeachyTvSetWindowRegs(void);
static void TeachyTvSetupBg(void);
static void TeachyTvLoadGraphic(void);
static void TeachyTvPostBattleFadeControl(u8);
static void TeachyTvOptionListController(u8);
static void TeachyTvAudioByInput(s32, bool8, struct ListMenu *);
static void TeachyTvQuitFadeControlAndTaskDel(u8 taskId);
static void TeachyTvRenderMsgAndSwitchClusterFuncs(u8 taskId);
static void TeachyTvClearBg1EndGraphicText(void);
static void TTVcmd_End(u8 taskId);
static void TeachyTvSetupBagItemsByOptionChosen(void);
static void TeachyTvPrepBattle(u8 taskId);
static void TeachyTvGrassAnimationMain(u8 taskId, s16 x, s16 y, u8 subpriority, bool8 mode);
static void TeachyTvLoadBg3Map(u16 *);
static u8 TeachyTvGrassAnimationCheckIfNeedsToGenerateGrassObj(s16 x, s16 y);
static void TeachyTvGrassAnimationObjCallback(struct Sprite *sprite);
static void TeachyTvRestorePlayerPartyCallback(void);
static void TeachyTvPreBattleAnimAndSetBattleCallback(u8 taskId);
static void TeachyTvLoadMapTilesetToBuffer(const struct Tileset *ts, u8 *dstBuffer, u16 size);
static void TeachyTvPushBackNewMapPalIndexArrayEntry(const struct MapLayout *mStruct, u16 *buf1, u8 *palIndexArray, u16 mapEntry, u16 offset);
static void TeachyTvComputeMapTilesFromTilesetAndMetaTiles(const u16 *metaTilesArray, u8 *blockBuf, u8 *tileset);
static void TeachyTvComputeSingleMapTileBlockFromTilesetAndMetaTiles(u8 *blockBuf, u8 *tileset, u8 metaTile);
static u16 TeachyTvComputePalIndexArrayEntryByMetaTile(u8 *palIndexArrayBuf, u16 metaTile);
static void TeachyTvLoadMapPalette(const struct MapLayout * mStruct, const u8 *palIndexArray);

static const struct BgTemplate sBgTemplates[] = 
{
    {
        .bg = 0,
        .charBaseIndex = 0,
        .mapBaseIndex = 31,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 1,
        .baseTile = 0x000,
    },
    {
        .bg = 1,
        .charBaseIndex = 0,
        .mapBaseIndex = 30,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 0,
        .baseTile = 0x000,
    },
    {
        .bg = 2,
        .charBaseIndex = 0,
        .mapBaseIndex = 29,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 2,
        .baseTile = 0x000,
    },
    {
        .bg = 3,
        .charBaseIndex = 2,
        .mapBaseIndex = 28,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 3,
        .baseTile = 0x000,
    },
};

static const struct WindowTemplate sWindowTemplates[] = 
{
    {
        .bg = 1,
        .tilemapLeft = 2,
        .tilemapTop = 15,
        .width = 26,
        .height = 4,
        .paletteNum = 3,
        .baseBlock = 0x0EA,
    },
    {
        .bg = 0,
        .tilemapLeft = 4,
        .tilemapTop = 1,
        .width = 22,
        .height = 12,
        .paletteNum = 3,
        .baseBlock = 0x152,
    },
    DUMMY_WIN_TEMPLATE,
};

static const struct ListMenuItem sListMenuItems[] = 
{
    {
        .label = gTeachyTvString_TeachBattle,
        .index = TTVSCR_BATTLE
    },
    {
        .label = gTeachyTvString_StatusProblems,
        .index = TTVSCR_STATUS
    },
    {
        .label = gTeachyTvString_TypeMatchups,
        .index = TTVSCR_MATCHUPS
    },
    {
        .label = gTeachyTvString_CatchPkmn,
        .index = TTVSCR_CATCHING
    },
    {
        .label = gTeachyTvString_AboutTMs,
        .index = TTVSCR_TMS
    },
    {
        .label = gTeachyTvString_RegisterItem,
        .index = TTVSCR_REGISTER
    },

    {
        .label = gTeachyTvString_Cancel,
        .index = -2
    },
};

static const struct ListMenuItem sListMenuItems_NoTMCase[] = 
{
    {
        .label = gTeachyTvString_TeachBattle,
        .index = TTVSCR_BATTLE
    },
    {
        .label = gTeachyTvString_StatusProblems,
        .index = TTVSCR_STATUS
    },
    {
        .label = gTeachyTvString_TypeMatchups,
        .index = TTVSCR_MATCHUPS
    },
    {
        .label = gTeachyTvString_CatchPkmn,
        .index = TTVSCR_CATCHING
    },
    {
        .label = gTeachyTvString_Cancel,
        .index = -2
    },
};

static const struct ListMenuTemplate sListMenuTemplate = 
{
    .items = sListMenuItems,
    .moveCursorFunc = NULL,
    .itemPrintFunc = NULL,
    .totalItems = 7,
    .maxShowed = 6,
    .windowId = 0,
    .header_X = 0,
    .item_X = 8,
    .cursor_X = 0,
    .upText_Y = 6,
    .cursorPal = 0x1,
    .fillValue = 0x0,
    .cursorShadowPal = 0x2,
    .lettersSpacing = 0x0,
    .itemVerticalPadding = 0x0,
    .scrollMultiple = 0x1,
    .fontId = FONT_NORMAL,
    .cursorKind = 0x0,
};

static const struct ScrollArrowsTemplate sScrollIndicatorArrowPair = 
{
    .firstArrowType = 0x2,
    .firstX = 0x78,
    .firstY = 0xC,
    .secondArrowType = 0x3,
    .secondX = 0x78,
    .secondY = 0x64,
    .fullyUpThreshold = 0,
    .fullyDownThreshold = 1,
    .tileTag = 0x800,
    .palTag = 0x800,
    .palNum = 0x0,
};

static const u8 sWhereToReturnToFromBattle[] = 
{
    12,
    12,
    12,
    12,
     9,
     9
};

static void (* const sBattleScript[])(u8) = 
{
    TTVcmd_TransitionRenderBg2TeachyTvGraphicInitNpcPos,
    TTVcmd_ClearBg2TeachyTvGraphic,
    TTVcmd_NpcMoveAndSetupTextPrinter,
    TTVcmd_IdleIfTextPrinterIsActive,
    TTVcmd_IdleIfTextPrinterIsActive2,
    TTVcmd_TextPrinterSwitchStringByOptionChosen,
    TTVcmd_IdleIfTextPrinterIsActive2,
    TTVcmd_EraseTextWindowIfKeyPressed,
    TTVcmd_StartAnimNpcWalkIntoGrass,
    TTVcmd_DudeMoveUp,
    TTVcmd_DudeMoveRight,
    TTVcmd_TaskBattleOrFadeByOptionChosen,
    TTVcmd_TextPrinterSwitchStringByOptionChosen2,
    TTVcmd_IdleIfTextPrinterIsActive2,
    TTVcmd_EraseTextWindowIfKeyPressed,
    TTVcmd_DudeTurnLeft,
    TTVcmd_DudeMoveLeft,
    TTVcmd_RenderAndRemoveBg1EndGraphic,
    TTVcmd_End,
};

static void (* const sStatusScript[])(u8) = 
{
    TTVcmd_TransitionRenderBg2TeachyTvGraphicInitNpcPos,
    TTVcmd_ClearBg2TeachyTvGraphic,
    TTVcmd_NpcMoveAndSetupTextPrinter,
    TTVcmd_IdleIfTextPrinterIsActive,
    TTVcmd_IdleIfTextPrinterIsActive2,
    TTVcmd_TextPrinterSwitchStringByOptionChosen,
    TTVcmd_IdleIfTextPrinterIsActive2,
    TTVcmd_EraseTextWindowIfKeyPressed,
    TTVcmd_StartAnimNpcWalkIntoGrass,
    TTVcmd_DudeMoveUp,
    TTVcmd_DudeMoveRight,
    TTVcmd_TaskBattleOrFadeByOptionChosen,
    TTVcmd_TextPrinterSwitchStringByOptionChosen2,
    TTVcmd_IdleIfTextPrinterIsActive2,
    TTVcmd_EraseTextWindowIfKeyPressed,
    TTVcmd_DudeTurnLeft,
    TTVcmd_DudeMoveLeft,
    TTVcmd_RenderAndRemoveBg1EndGraphic,
    TTVcmd_End,
};

static void (* const sMatchupsScript[])(u8) = 
{
    TTVcmd_TransitionRenderBg2TeachyTvGraphicInitNpcPos,
    TTVcmd_ClearBg2TeachyTvGraphic,
    TTVcmd_NpcMoveAndSetupTextPrinter,
    TTVcmd_IdleIfTextPrinterIsActive,
    TTVcmd_IdleIfTextPrinterIsActive2,
    TTVcmd_TextPrinterSwitchStringByOptionChosen,
    TTVcmd_IdleIfTextPrinterIsActive2,
    TTVcmd_EraseTextWindowIfKeyPressed,
    TTVcmd_StartAnimNpcWalkIntoGrass,
    TTVcmd_DudeMoveUp,
    TTVcmd_DudeMoveRight,
    TTVcmd_TaskBattleOrFadeByOptionChosen,
    TTVcmd_TextPrinterSwitchStringByOptionChosen2,
    TTVcmd_IdleIfTextPrinterIsActive2,
    TTVcmd_EraseTextWindowIfKeyPressed,
    TTVcmd_DudeTurnLeft,
    TTVcmd_DudeMoveLeft,
    TTVcmd_RenderAndRemoveBg1EndGraphic,
    TTVcmd_End,
};

static void (* const sCatchingScript[])(u8) = 
{
    TTVcmd_TransitionRenderBg2TeachyTvGraphicInitNpcPos,
    TTVcmd_ClearBg2TeachyTvGraphic,
    TTVcmd_NpcMoveAndSetupTextPrinter,
    TTVcmd_IdleIfTextPrinterIsActive,
    TTVcmd_IdleIfTextPrinterIsActive2,
    TTVcmd_TextPrinterSwitchStringByOptionChosen,
    TTVcmd_IdleIfTextPrinterIsActive2,
    TTVcmd_EraseTextWindowIfKeyPressed,
    TTVcmd_StartAnimNpcWalkIntoGrass,
    TTVcmd_DudeMoveUp,
    TTVcmd_DudeMoveRight,
    TTVcmd_TaskBattleOrFadeByOptionChosen,
    TTVcmd_TextPrinterSwitchStringByOptionChosen2,
    TTVcmd_IdleIfTextPrinterIsActive2,
    TTVcmd_EraseTextWindowIfKeyPressed,
    TTVcmd_DudeTurnLeft,
    TTVcmd_DudeMoveLeft,
    TTVcmd_RenderAndRemoveBg1EndGraphic,
    TTVcmd_End,
};

static void (* const sTMsScript[])(u8) = 
{
    TTVcmd_TransitionRenderBg2TeachyTvGraphicInitNpcPos,
    TTVcmd_ClearBg2TeachyTvGraphic,
    TTVcmd_NpcMoveAndSetupTextPrinter,
    TTVcmd_IdleIfTextPrinterIsActive,
    TTVcmd_IdleIfTextPrinterIsActive2,
    TTVcmd_TextPrinterSwitchStringByOptionChosen,
    TTVcmd_IdleIfTextPrinterIsActive2,
    TTVcmd_EraseTextWindowIfKeyPressed,
    TTVcmd_TaskBattleOrFadeByOptionChosen,
    TTVcmd_TextPrinterSwitchStringByOptionChosen2,
    TTVcmd_IdleIfTextPrinterIsActive2,
    TTVcmd_EraseTextWindowIfKeyPressed,
    TTVcmd_DudeTurnLeft,
    TTVcmd_DudeMoveLeft,
    TTVcmd_RenderAndRemoveBg1EndGraphic,
    TTVcmd_End,
};

static void (* const sRegisterKeyItemScript[])(u8) = 
{
    TTVcmd_TransitionRenderBg2TeachyTvGraphicInitNpcPos,
    TTVcmd_ClearBg2TeachyTvGraphic,
    TTVcmd_NpcMoveAndSetupTextPrinter,
    TTVcmd_IdleIfTextPrinterIsActive,
    TTVcmd_IdleIfTextPrinterIsActive2,
    TTVcmd_TextPrinterSwitchStringByOptionChosen,
    TTVcmd_IdleIfTextPrinterIsActive2,
    TTVcmd_EraseTextWindowIfKeyPressed,
    TTVcmd_TaskBattleOrFadeByOptionChosen,
    TTVcmd_TextPrinterSwitchStringByOptionChosen2,
    TTVcmd_IdleIfTextPrinterIsActive2,
    TTVcmd_EraseTextWindowIfKeyPressed,
    TTVcmd_DudeTurnLeft,
    TTVcmd_DudeMoveLeft,
    TTVcmd_RenderAndRemoveBg1EndGraphic,
    TTVcmd_End,
};

static void TeachyTvCallback(void)
{
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    DoScheduledBgTilemapCopiesToVram();
    UpdatePaletteFade();
}

static void TeachyTvVblankHandler(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}

void InitTeachyTvController(u8 mode, MainCallback cb)
{
    sStaticResources.mode = mode;
    sStaticResources.callback = cb;
    if (mode == 0)
    {
        sStaticResources.scrollOffset = 0;
        sStaticResources.selectedRow = 0;
        sStaticResources.whichScript = TTVSCR_BATTLE;
    }
    if (mode == 1)
    {
        sStaticResources.mode = 0;
    }
    SetMainCallback2(TeachyTvMainCallback);
}

void CB2_ReturnToTeachyTV(void)
{
    if (sStaticResources.mode == 1)
        InitTeachyTvController(1, sStaticResources.callback);
    else
        InitTeachyTvController(2, sStaticResources.callback);
}

void SetTeachyTvControllerModeToResume(void)
{
    sStaticResources.mode = 1;
}

static void TeachyTvMainCallback(void)
{
    u8 taskId;
    struct Task *taskAddr;

    switch (gMain.state)
    {
    case 0:
        sResources = AllocZeroed(sizeof(struct TeachyTvBuf));
        sResources->savedCallback = NULL;
        sResources->grassAnimDisabled = 0;
        sResources->scrollIndicatorArrowPairId = 0xFF;
        SetVBlankHBlankCallbacksToNull();
        ClearScheduledBgCopiesToVram();
        ScanlineEffect_Stop();
        FreeAllSpritePalettes();
        ResetPaletteFade();
        ResetSpriteData();
        ResetTasks();
        TeachyTvSetupBg();
        TeachyTvLoadGraphic();
        ++gMain.state;
        break;
    case 1:
        if (FreeTempTileDataBuffersIfPossible() == TRUE)
            return;
        TeachyTvCreateAndRenderRbox();
        TeachyTvInitIo();
        if (sStaticResources.mode == 2)
        {
            taskId = CreateTask(TeachyTvPostBattleFadeControl, 0);
            gTasks[taskId].data[1] = TeachyTvSetupObjEventAndOam();
            TeachyTvSetupPostBattleWindowAndObj(taskId);
        }
        else
        {
            taskId = CreateTask(TeachyTvOptionListController, 0);
            gTasks[taskId].data[0] = TeachyTvSetupWindow();
            gTasks[taskId].data[1] = TeachyTvSetupObjEventAndOam();
            TeachyTvSetupScrollIndicatorArrowPair();
            PlayNewMapMusic(MUS_TEACHY_TV_MENU);
            TeachyTvSetWindowRegs();
        }
        ScheduleBgCopyTilemapToVram(0);
        ScheduleBgCopyTilemapToVram(1);
        ScheduleBgCopyTilemapToVram(2);
        ScheduleBgCopyTilemapToVram(3);
        SetHelpContextDontCheckBattle(HELPCONTEXT_BAG);
        BlendPalettes(PALETTES_ALL, 0x10, 0);
        BeginNormalPaletteFade(PALETTES_ALL, 0, 0x10, 0, 0);
        SetVBlankCallback(TeachyTvVblankHandler);
        SetMainCallback2(TeachyTvCallback);
        break;
    }
}

static void TeachyTvSetupBg(void)
{
    ResetAllBgsCoordinatesAndBgCntRegs();
    ResetBgsAndClearDma3BusyFlags(0);
    InitBgsFromTemplates(0, sBgTemplates, 4);
    SetBgTilemapBuffer(1, sResources->screenTilemap);
    SetBgTilemapBuffer(2, sResources->buffer2);
    SetBgTilemapBuffer(3, sResources->buffer3);
    SetGpuReg(REG_OFFSET_DISPCNT, 0x3040);
    ShowBg(0);
    ShowBg(1);
    ShowBg(2);
    ShowBg(3);
    ChangeBgX(3, 0x1000, 2);
    ChangeBgY(3, 0x2800, 1);
    sResources->grassAnimCounterLo = 0;
    sResources->grassAnimCounterHi = 3;
    SetGpuReg(REG_OFFSET_BLDCNT, 0);
}

static void TeachyTvLoadGraphic(void)
{
    u16 src = RGB_BLACK;
    ResetTempTileDataBuffers();
    DecompressAndCopyTileDataToVram(1, gTeachyTv_Gfx, 0, 0, 0);
    LZDecompressWram(gTeachyTvScreen_Tilemap, sResources->screenTilemap);
    LZDecompressWram(gTeachyTvTitle_Tilemap, sResources->titleTilemap);
    LoadCompressedPalette(gTeachyTv_Pal, BG_PLTT_ID(0), 4 * PLTT_SIZE_4BPP);
    LoadPalette(&src, BG_PLTT_ID(0), sizeof(src));
    LoadSpritePalette(&gSpritePalette_GeneralFieldEffect1);
    TeachyTvLoadBg3Map(sResources->buffer3);
}

static void TeachyTvCreateAndRenderRbox(void)
{
    InitWindows(sWindowTemplates);
    DeactivateAllTextPrinters();
    FillWindowPixelBuffer(0, 0xCC);
    PutWindowTilemap(0);
    PutWindowTilemap(1);
    CopyWindowToVram(0, COPYWIN_GFX);
}

static u8 TeachyTvSetupWindow(void)
{
    gMultiuseListMenuTemplate = sListMenuTemplate;
    gMultiuseListMenuTemplate.windowId = 1;
    gMultiuseListMenuTemplate.moveCursorFunc = TeachyTvAudioByInput;
    if (!CheckBagHasItem(ITEM_TM_CASE, 1))
    {
        gMultiuseListMenuTemplate.items = sListMenuItems_NoTMCase;
        gMultiuseListMenuTemplate.totalItems = 5;
        gMultiuseListMenuTemplate.maxShowed = 5;
        gMultiuseListMenuTemplate.upText_Y = (gMultiuseListMenuTemplate.upText_Y + 8) & 0xF;
    }
    return ListMenuInit(
               &gMultiuseListMenuTemplate,
               sStaticResources.scrollOffset,
               sStaticResources.selectedRow
    );
}

static void TeachyTvSetupScrollIndicatorArrowPair(void)
{
    if (!CheckBagHasItem(ITEM_TM_CASE, 1))
    {
        struct TeachyTvBuf * temp = sResources;
        temp->scrollIndicatorArrowPairId = 0xFF;
    }
    else
    {
        sResources->scrollIndicatorArrowPairId = AddScrollIndicatorArrowPair(&sScrollIndicatorArrowPair, &(sStaticResources.scrollOffset));
    }
}

static void TeachyTvRemoveScrollIndicatorArrowPair(void)
{
    if (sResources->scrollIndicatorArrowPairId != 0xFF)
    {
        RemoveScrollIndicatorArrowPair(sResources->scrollIndicatorArrowPairId);
        sResources->scrollIndicatorArrowPairId = 0xFF;
    }
}

static void TeachyTvAudioByInput(s32 notUsed, bool8 play, struct ListMenu *notUsedAlt)
{
    if (play != TRUE)
        PlaySE(SE_SELECT);
}

static void TeachyTvInitIo(void)
{
    SetGpuReg(REG_OFFSET_WININ, 0x3F);
    SetGpuReg(REG_OFFSET_WINOUT, 0x1F);
    SetGpuReg(REG_OFFSET_BLDCNT, 0xCC);
    SetGpuReg(REG_OFFSET_BLDY, 0x5);
}

static u8 TeachyTvSetupObjEventAndOam(void)
{
    u8 objId = CreateObjectGraphicsSprite(OBJ_EVENT_GFX_TEACHY_TV_HOST, SpriteCallbackDummy, 0, 0, 8);
    gSprites[objId].oam.priority = 2;
    gSprites[objId].invisible = 1;
    return objId;
}

static void TeachyTvSetSpriteCoordsAndSwitchFrame(u8 objId, u16 x, u16 y, u8 frame)
{
    gSprites[objId].x2 = x;
    gSprites[objId].y2 = y;
    gSprites[objId].invisible = 0;
    StartSpriteAnim(&gSprites[objId], frame);
}

static void TeachyTvSetWindowRegs(void)
{
    SetGpuReg(REG_OFFSET_WIN0V, 0xC64);
    SetGpuReg(REG_OFFSET_WIN0H, 0x1CD4);
}

static void TeachyTvClearWindowRegs(void)
{
    SetGpuReg(REG_OFFSET_WIN0V, 0x0);
    SetGpuReg(REG_OFFSET_WIN0H, 0x0);
}

static void TeachyTvBg2AnimController(void)
{
    u16 * tilemapBuffer = GetBgTilemapBuffer(2);
    u8 i, j;
    for (i = 1; i < 13; i++)
    {
        for (j = 2; j < 28; j++)
        {
            tilemapBuffer[32 * i + j] = ((Random() & 3) << 10) + 0x301F;
        }
    }
    ScheduleBgCopyTilemapToVram(2);
}

static void TeachyTvSetupPostBattleWindowAndObj(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    struct Sprite *objAddr = &gSprites[data[1]];

    ClearWindowTilemap(1);
    TeachyTvClearWindowRegs();
    switch (sStaticResources.whichScript)
    {
    case TTVSCR_BATTLE:
    case TTVSCR_STATUS:
    case TTVSCR_MATCHUPS:
    case TTVSCR_CATCHING:
        TeachyTvSetSpriteCoordsAndSwitchFrame(data[1], 0x78, 0x38, 0);
        ChangeBgX(3, 0x3000, 1);
        ChangeBgY(3, 0x3000, 2);
        sResources->grassAnimCounterLo += 3;
        sResources->grassAnimCounterHi -= 3;
        break;
    case TTVSCR_TMS:
    case TTVSCR_REGISTER:
        TeachyTvSetSpriteCoordsAndSwitchFrame(data[1], 0x78, 0x38, 0);
        break;
    }

    data[4] = 0;
    data[5] = 0;
    TeachyTvGrassAnimationMain(taskId, objAddr->x2, objAddr->y2, 0, 1);
}

static void TeachyTvInitTextPrinter(const u8 *text)
{
    gTextFlags.autoScroll = 0;
    AddTextPrinterParameterized2(0, FONT_MALE, text, GetTextSpeedSetting(), 0, 1, 0xC, 3);
}

static void TeachyTvFree(void)
{
    Free(sResources);
    sResources = NULL;
    FreeAllWindowBuffers();
}

static void TeachyTvQuitBeginFade(u8 taskId)
{
    BeginNormalPaletteFade(PALETTES_ALL, 0, 0, 0x10, 0);
    gTasks[taskId].func = TeachyTvQuitFadeControlAndTaskDel;
}

static void TeachyTvQuitFadeControlAndTaskDel(u8 taskId)
{
    if (!(gPaletteFade.active))
    {
        if (sResources->savedCallback != NULL)
        {
            SetMainCallback2(sResources->savedCallback);
        }
        else
        {
            Overworld_PlaySpecialMapMusic();
            SetMainCallback2(sStaticResources.callback);
        }
        TeachyTvFree();
        DestroyTask(taskId);
    }
}

static void TeachyTvOptionListController(u8 taskId)
{
    s16 * data = gTasks[taskId].data;
    s32 input;

    TeachyTvBg2AnimController();
    if (!gPaletteFade.active)
    {
        input = ListMenu_ProcessInput(data[0]);
        ListMenuGetScrollAndRow(data[0], &sStaticResources.scrollOffset, &sStaticResources.selectedRow);
        if ((JOY_NEW(SELECT_BUTTON) && sStaticResources.callback != CB2_BagMenuFromStartMenu))
        {
            PlaySE(SE_SELECT);
            TeachyTvQuitBeginFade(taskId);
        }
        else
        {
            switch (input)
            {
            case -1:
                break;
            case -2:
                PlaySE(SE_SELECT);
                TeachyTvQuitBeginFade(taskId);
                break;
            default:
                PlaySE(SE_SELECT);
                sStaticResources.whichScript = input;
                DestroyListMenuTask(data[0], &sStaticResources.scrollOffset, &sStaticResources.selectedRow);
                TeachyTvClearWindowRegs();
                ClearWindowTilemap(1);
                ScheduleBgCopyTilemapToVram(0);
                TeachyTvRemoveScrollIndicatorArrowPair();
                data[3] = 0;
                data[2] = 0;
                gTasks[taskId].func = TeachyTvRenderMsgAndSwitchClusterFuncs;
                break;
            }
        }
    }
}

static void TTVcmd_TransitionRenderBg2TeachyTvGraphicInitNpcPos(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    TeachyTvBg2AnimController();
    if (++data[2] > 63)
    {
        CopyToBgTilemapBufferRect_ChangePalette(2, sResources->titleTilemap, 0, 0, 0x20, 0x20, 0x11);
        TeachyTvSetSpriteCoordsAndSwitchFrame(data[1], 8, 0x38, 7);
        ScheduleBgCopyTilemapToVram(2);
        data[2] = 0;
        ++data[3];
        PlayNewMapMusic(MUS_FOLLOW_ME);
    }
}

static void TTVcmd_ClearBg2TeachyTvGraphic(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    if (++data[2] == 134)
    {
        FillBgTilemapBufferRect_Palette0(2, 0, 2, 1, 0x1A, 0xC);
        ScheduleBgCopyTilemapToVram(2);
        data[2] = 0;
        ++data[3];
    }
}

static void TTVcmd_NpcMoveAndSetupTextPrinter(u8 taskId)
{
    s16 * data = gTasks[taskId].data;
    struct Sprite *spriteAddr = &gSprites[data[1]];
    if (data[2] != 35)
        ++data[2];
    else {
        if (spriteAddr->x2 == 0x78)
        {
            StartSpriteAnim(&gSprites[data[1]], 0);
            TeachyTvInitTextPrinter(gTeachyTvText_PokedudeSaysHello);
            data[2] = 0;
            ++data[3];
        }
        else
            ++spriteAddr->x2;
    }   
}

static void TTVcmd_IdleIfTextPrinterIsActive(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    if (!RunTextPrinters_CheckActive(0))
        ++data[3];
}

static void TeachyTvRenderMsgAndSwitchClusterFuncs(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    if (JOY_NEW(B_BUTTON))
    {
        sResources->grassAnimDisabled = 1;
        TeachyTvSetSpriteCoordsAndSwitchFrame(data[1], 0, 0, 0);
        FillWindowPixelBuffer(0, 0xCC);
        CopyWindowToVram(0, COPYWIN_GFX);
        TeachyTvClearBg1EndGraphicText();
        data[2] = 0;
        data[3] = 0;
        gTasks[taskId].func = TTVcmd_End;
    }
    else
    {
        static void (* const * const array[])(u8) =
        {
            sBattleScript,
            sStatusScript,
            sMatchupsScript,
            sCatchingScript,
            sTMsScript,
            sRegisterKeyItemScript,
        };
        void (*const *cluster)(u8) = array[sStaticResources.whichScript];
        cluster[data[3]](taskId);
    }
}

static void TTVcmd_TextPrinterSwitchStringByOptionChosen(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    static const u8 *const texts[] = {
        gTeachyTvText_BattleScript1,
        gTeachyTvText_StatusScript1,
        gTeachyTvText_MatchupsScript1,
        gTeachyTvText_CatchingScript1,
        gTeachyTvText_TMsScript1,
        gTeachyTvText_RegisterScript1,
    };
    TeachyTvInitTextPrinter(texts[sStaticResources.whichScript]);
    ++data[3];
}

static void TTVcmd_TextPrinterSwitchStringByOptionChosen2(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    static const u8 *const texts[] =
    {
        gTeachyTvText_BattleScript2,
        gTeachyTvText_StatusScript2,
        gTeachyTvText_MatchupsScript2,
        gTeachyTvText_CatchingScript2,
        gTeachyTvText_TMsScript2,
        gTeachyTvText_RegisterScript2,
    };
    TeachyTvInitTextPrinter(texts[sStaticResources.whichScript]);
    ++data[3];
}

static const u16 sBg1EndGraphic[] = 
{
    0xD1, 0xD2, 0xD3, 0xD4, 0xD5, 0xD6, 0xD7, 0xD8,
    0xE1, 0xE2, 0xE3, 0xE4, 0xE5, 0xE6, 0xE7, 0xE8,
};

static const struct Subsprite sSubspriteArray[] = 
{
    {
        .x = -0x8,
        .y = -0x8,
        .shape = 0x1,
        .size = 0x0,
        .tileOffset = 0x0,
        .priority = 0x3,
    },
    {
        .x = -0x8,
        .y = 0x0,
        .shape = 0x1,
        .size = 0x0,
        .tileOffset = 0x2,
        .priority = 0x2,
    },
};

static const struct SubspriteTable sSubspriteTableArray[] = 
{
    {
        .subspriteCount = 0,
        .subsprites = NULL,
    },
    {
        .subspriteCount = 2,
        .subsprites = sSubspriteArray,
    },
};

static const u8 sGrassAnimArray[] = 
{
    0, 0, 1, 1, 1, 1, 1, 1,
    1, 1, 1, 1, 1, 1, 0, 0,
    0, 0, 1, 1, 1, 1, 1, 1,
    1, 1, 1, 1, 1, 1, 0, 0,
    0, 0, 1, 1, 1, 1, 1, 1,
    1, 1, 1, 1, 1, 1, 0, 0,
    0, 0, 1, 1, 1, 1, 1, 1,
    1, 1, 1, 1, 1, 1, 0, 0,
    0, 0, 1, 1, 1, 1, 1, 1,
    1, 1, 1, 1, 1, 1, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    1, 1, 1, 1, 1, 1, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    1, 1, 1, 1, 1, 1, 0, 0,
};

static void TTVcmd_IdleIfTextPrinterIsActive2(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    if (!RunTextPrinters_CheckActive(0))
        ++data[3];
}

static void TTVcmd_EraseTextWindowIfKeyPressed(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    if (JOY_NEW(A_BUTTON | B_BUTTON))
    {
        FillWindowPixelBuffer(0, 0xCC);
        CopyWindowToVram(0, COPYWIN_GFX);
        ++data[3];
    }
}

static void TTVcmd_StartAnimNpcWalkIntoGrass(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    StartSpriteAnim(&gSprites[data[1]], 5);
    data[2] = 0;
    data[4] = 0;
    data[5] = 1;
    ++data[3];
}

static void TTVcmd_DudeMoveUp(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    struct Sprite *obj = &gSprites[data[1]];
    ChangeBgY(3, 0x100, 2);
    if (!(++data[2] & 0xF))
    {
        --sResources->grassAnimCounterHi;
        TeachyTvGrassAnimationMain(taskId, obj->x2, obj->y2, 0, 0);
    }
    if (data[2] == 48)
    {
        data[2] = 0;
        data[4] = -1;
        data[5] = 0;
        StartSpriteAnim(obj, 7);
        ++data[3];
    }
}

static void TTVcmd_DudeMoveRight(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    struct Sprite *obj = &gSprites[data[1]];
    ChangeBgX(3, 0x100, 1);
    if (!(++data[2] & 0xF))
        ++sResources->grassAnimCounterLo;
    if (!((data[2] + 8) & 0xF))
        TeachyTvGrassAnimationMain(taskId, obj->x2 + 8, obj->y2, 0, 0);
    if (data[2] == 0x30)
    {
        data[2] = 0;
        data[4] = 0;
        data[5] = 0;
        StartSpriteAnim(obj, 3);
        ++data[3];
    }
}

static void TTVcmd_DudeTurnLeft(u8 taskId)
{

    s16 *data = gTasks[taskId].data;
    struct Sprite *objAddr = &gSprites[data[1]];
    StartSpriteAnim(objAddr, 6);
    ++data[3];
    data[4] = 0;
    data[5] = 0;
    TeachyTvGrassAnimationMain(taskId, objAddr->x2, objAddr->y2, 0, 0);
}

static void TTVcmd_DudeMoveLeft(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    struct Sprite *objAddr = &gSprites[data[1]];

    if (!(objAddr->x2 & 0xF))
        TeachyTvGrassAnimationMain(taskId, objAddr->x2 - 8, objAddr->y2, 0, 0);
    if (objAddr->x2 == 8)
        ++data[3];
    else
        --objAddr->x2;
}

static void TTVcmd_RenderAndRemoveBg1EndGraphic(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    if (!data[2])
    {
        CopyToBgTilemapBufferRect_ChangePalette(1, sBg1EndGraphic, 20, 10, 8, 2, 0x11);
        ScheduleBgCopyTilemapToVram(1);
    }
    if (++data[2] > 126)
    {
        TeachyTvClearBg1EndGraphicText();
        data[2] = 0;
        ++data[3];
    }
}

static void TeachyTvClearBg1EndGraphicText(void)
{
    FillBgTilemapBufferRect_Palette0(1, 0, 20, 10, 8, 2);
    ScheduleBgCopyTilemapToVram(1);
}

static void TTVcmd_End(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    if (data[2] == 0)
        PlayNewMapMusic(MUS_TEACHY_TV_MENU);
    TeachyTvBg2AnimController();
    if (++data[2] > 63)
    {
        data[2] = 0;
        data[3] = 0;
        data[0] = TeachyTvSetupWindow();
        gTasks[taskId].func = TeachyTvOptionListController;
        PutWindowTilemap(0);
        TeachyTvSetupScrollIndicatorArrowPair();
        TeachyTvSetWindowRegs();
        ScheduleBgCopyTilemapToVram(0);
        ChangeBgX(3, 0x0, 0);
        ChangeBgY(3, 0x0, 0);
        ChangeBgX(3, 0x1000, 2);
        ChangeBgY(3, 0x2800, 1);
        sResources->grassAnimCounterLo = 0;
        sResources->grassAnimCounterHi = 3;
        sResources->grassAnimDisabled = 0;
    }
}

static void TTVcmd_TaskBattleOrFadeByOptionChosen(u8 taskId)
{
    switch (sStaticResources.whichScript)
    {
    case TTVSCR_BATTLE:
    case TTVSCR_STATUS:
    case TTVSCR_MATCHUPS:
    case TTVSCR_CATCHING:
        TeachyTvPrepBattle(taskId);
        break;
    case TTVSCR_TMS:
    case TTVSCR_REGISTER:
        sResources->savedCallback = TeachyTvSetupBagItemsByOptionChosen;
        TeachyTvQuitBeginFade(taskId);
        break;
    }
}

static void TeachyTvSetupBagItemsByOptionChosen(void)
{
    if (sStaticResources.whichScript == TTVSCR_TMS)
        InitPokedudeBag(ITEMMENULOCATION_TTVSCR_TMS);
    else
        InitPokedudeBag(ITEMMENULOCATION_TTVSCR_REGISTER);
}

static void TeachyTvPostBattleFadeControl(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    if (!(gPaletteFade.active))
    {
        data[3] = sWhereToReturnToFromBattle[sStaticResources.whichScript];
        gTasks[taskId].func = TeachyTvRenderMsgAndSwitchClusterFuncs;
    }
}

static void TeachyTvGrassAnimationMain(u8 taskId, s16 x, s16 y, u8 subpriority, bool8 mode)
{
    struct Sprite *obj;
    u8 spriteId;

    if (sResources->grassAnimDisabled != 1 && TeachyTvGrassAnimationCheckIfNeedsToGenerateGrassObj(x - 0x10, y))
    {
        spriteId = CreateSprite(gFieldEffectObjectTemplatePointers[FLDEFFOBJ_TALL_GRASS], 0, 0, subpriority);
        obj = &gSprites[spriteId];
        obj->x2 = x;
        obj->y2 = y + 8;
        obj->callback = TeachyTvGrassAnimationObjCallback;
        obj->data[0] = taskId;
        if (mode == 1)
        {
            SeekSpriteAnim(obj, 4);
            obj->oam.priority = 2;
        }
        else
        {
            SetSubspriteTables(obj, sSubspriteTableArray);
            obj->subspriteTableNum = 0;
            obj->subspriteMode = 1;
        }
    }
}

static void TeachyTvGrassAnimationObjCallback(struct Sprite *sprite)
{
    s16 diff1, diff2;
    s16 *data = gTasks[sprite->data[0]].data;
    struct Sprite *objAddr = &gSprites[data[1]];

    if (sResources->grassAnimDisabled == 1)
        DestroySprite(sprite);
    else
    {
        if (sprite->animCmdIndex == 0)
            sprite->subspriteTableNum = 1;
        else
            sprite->subspriteTableNum = 0;
        sprite->x2 += data[4];
        sprite->y2 += data[5];
        if (sprite->animEnded)
        {
            sprite->subpriority = 0;
            diff1 = sprite->x2 - objAddr->x2;
            diff2 = sprite->y2 - objAddr->y2;
            if (diff1 <= -16 || diff1 >= 16 || diff2 <= -16 || diff2 >= 24)
                DestroySprite(sprite);
        }
    }
}

static u8 TeachyTvGrassAnimationCheckIfNeedsToGenerateGrassObj(s16 x, s16 y)
{
    const u8 * arr;
    struct TeachyTvBuf *ptr;
    int high, low;
    if ((x < 0) || (y < 0))
        return 0;
    arr = sGrassAnimArray;
    high = ((y >> 4) + sResources->grassAnimCounterHi) << 4;
    low = ((x >> 4) + sResources->grassAnimCounterLo);
    return arr[high+low];
}

static void TeachyTvPrepBattle(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    TeachyTvFree();
    gSpecialVar_0x8004 = sStaticResources.whichScript;
    gMain.savedCallback = TeachyTvRestorePlayerPartyCallback;
    SavePlayerParty();
    InitPokedudePartyAndOpponent();
    PlayMapChosenOrBattleBGM(MUS_DUMMY);
    if (sStaticResources.whichScript == TTVSCR_BATTLE)
        data[6] = B_TRANSITION_WHITE_BARS_FADE;
    else
        data[6] = B_TRANSITION_SLICE;
    data[7] = 0;
    gTasks[taskId].func = TeachyTvPreBattleAnimAndSetBattleCallback;
}

static void TeachyTvPreBattleAnimAndSetBattleCallback(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    switch (data[7])
    {
    case 0:
        BattleTransition_StartOnField(data[6]);
        ++data[7];
        break;
    case 1:
        if (IsBattleTransitionDone())
        {
            SetMainCallback2(CB2_InitBattle);
            DestroyTask(taskId);
        }
        break;
    }
}

static void TeachyTvRestorePlayerPartyCallback(void)
{
    LoadPlayerParty();
    if (gBattleOutcome == B_OUTCOME_DREW)
        SetTeachyTvControllerModeToResume();
    else
        PlayNewMapMusic(MUS_FOLLOW_ME);
    CB2_ReturnToTeachyTV();
}

static void TeachyTvLoadBg3Map(u16 *buffer)
{
    u16 * bgTilesBuffer;
    u8 * mapTilesRowBuffer;
    u16 i, j, k;
    u16 currentBlockIdx;
    void *tilesetsBuffer;
    void *palIndicesBuffer;
    u16 numMapTilesRows = 0;
    const struct MapLayout *layout = &Route1_Layout;
    u16 * blockIndicesBuffer = AllocZeroed(0x800);
    tilesetsBuffer = AllocZeroed(NUM_TILES_TOTAL * TILE_SIZE_4BPP);
    palIndicesBuffer = Alloc(16);
    memset(palIndicesBuffer, 0xFF, 16);

    TeachyTvLoadMapTilesetToBuffer(layout->primaryTileset, tilesetsBuffer, NUM_TILES_IN_PRIMARY);
    TeachyTvLoadMapTilesetToBuffer(layout->secondaryTileset, tilesetsBuffer + NUM_TILES_IN_PRIMARY * TILE_SIZE_4BPP, NUM_TILES_TOTAL - NUM_TILES_IN_PRIMARY);

    for (i = 0; i < 9; i++)
    {
        for (j = 0; j < 16; j++)
        {
            currentBlockIdx = layout->map[8 + (i + 6) * layout->width + j] & 0x3FF;
            for (k = 0; k < (i << 4) + j; k++)
            {
                if (blockIndicesBuffer[k] == 0)
                    break;
                if (blockIndicesBuffer[k] == currentBlockIdx)
                    break;
            }
            if (blockIndicesBuffer[k] == 0)
            {
                blockIndicesBuffer[k] = currentBlockIdx;
                numMapTilesRows++;
            }
            TeachyTvPushBackNewMapPalIndexArrayEntry(layout, &buffer[64 * i + 2 * j], palIndicesBuffer, currentBlockIdx, k);
        }
    }

    bgTilesBuffer = Alloc(numMapTilesRows * 0x80);
    mapTilesRowBuffer = Alloc(0x80);
    for (i = 0; i < numMapTilesRows; i++)
    {
        memset(mapTilesRowBuffer, 0, 0x80);
        if (blockIndicesBuffer[i] < NUM_METATILES_IN_PRIMARY)
            TeachyTvComputeMapTilesFromTilesetAndMetaTiles((const void *)layout->primaryTileset->metatiles + blockIndicesBuffer[i] * 16, mapTilesRowBuffer, tilesetsBuffer);
        else
            TeachyTvComputeMapTilesFromTilesetAndMetaTiles((const void *)layout->secondaryTileset->metatiles + (blockIndicesBuffer[i] - NUM_METATILES_IN_PRIMARY) * 16, mapTilesRowBuffer, tilesetsBuffer);
        CpuFastCopy(mapTilesRowBuffer, bgTilesBuffer + i * 0x40, 0x80);
    }

    LoadBgTiles(3, bgTilesBuffer, numMapTilesRows * 0x80, 0);
    TeachyTvLoadMapPalette(layout, palIndicesBuffer);

    Free(mapTilesRowBuffer);
    Free(bgTilesBuffer);
    Free(palIndicesBuffer);
    Free(tilesetsBuffer);
    Free(blockIndicesBuffer);
}

static void TeachyTvLoadMapTilesetToBuffer(const struct Tileset *ts, u8 *dstBuffer, u16 size)
{
    if (ts)
    {
        if (!ts->isCompressed)
            CpuFastCopy(ts->tiles, dstBuffer, 0x20 * size);
        else
            LZDecompressWram(ts->tiles, dstBuffer);
    }
}

static void TeachyTvPushBackNewMapPalIndexArrayEntry(const struct MapLayout *mStruct, u16 *buf1, u8 *palIndexArray, u16 mapEntry, u16 offset)
{
    const u16 * metaTileEntryAddr;
    if (mapEntry < NUM_METATILES_IN_PRIMARY)
        metaTileEntryAddr = &mStruct->primaryTileset->metatiles[8 * mapEntry];
    else
        metaTileEntryAddr = &mStruct->secondaryTileset->metatiles[8 * (mapEntry - NUM_METATILES_IN_PRIMARY)];
    buf1[0] = (TeachyTvComputePalIndexArrayEntryByMetaTile(palIndexArray, metaTileEntryAddr[0]) << 12) + 4 * offset;
    buf1[1] = (TeachyTvComputePalIndexArrayEntryByMetaTile(palIndexArray, metaTileEntryAddr[1]) << 12) + 4 * offset + 1;
    buf1[32] = (TeachyTvComputePalIndexArrayEntryByMetaTile(palIndexArray, metaTileEntryAddr[2]) << 12) + 4 * offset + 2;
    buf1[33] = (TeachyTvComputePalIndexArrayEntryByMetaTile(palIndexArray, metaTileEntryAddr[3]) << 12) + 4 * offset + 3;
}

static void TeachyTvComputeMapTilesFromTilesetAndMetaTiles(const u16 *metaTilesArray, u8 *blockBuf, u8 *tileset)
{
    TeachyTvComputeSingleMapTileBlockFromTilesetAndMetaTiles(blockBuf, &tileset[0x20 * (*metaTilesArray & 0x3FF)], (*metaTilesArray >> 10) & 3);
    TeachyTvComputeSingleMapTileBlockFromTilesetAndMetaTiles(blockBuf, &tileset[0x20 * (metaTilesArray[4] & 0x3FF)], (metaTilesArray[4] >> 10) & 3);
    TeachyTvComputeSingleMapTileBlockFromTilesetAndMetaTiles(blockBuf + 0x20, &tileset[0x20 * (metaTilesArray[1] & 0x3FF)], (metaTilesArray[1] >> 10) & 3);
    TeachyTvComputeSingleMapTileBlockFromTilesetAndMetaTiles(blockBuf + 0x20, &tileset[0x20 * (metaTilesArray[5] & 0x3FF)], (metaTilesArray[5] >> 10) & 3);
    TeachyTvComputeSingleMapTileBlockFromTilesetAndMetaTiles(blockBuf + 0x40, &tileset[0x20 * (metaTilesArray[2] & 0x3FF)], (metaTilesArray[2] >> 10) & 3);
    TeachyTvComputeSingleMapTileBlockFromTilesetAndMetaTiles(blockBuf + 0x40, &tileset[0x20 * (metaTilesArray[6] & 0x3FF)], (metaTilesArray[6] >> 10) & 3);
    blockBuf += 0x60;
    TeachyTvComputeSingleMapTileBlockFromTilesetAndMetaTiles(blockBuf, &tileset[0x20 * (metaTilesArray[3] & 0x3FF)], (metaTilesArray[3] >> 10) & 3);
    TeachyTvComputeSingleMapTileBlockFromTilesetAndMetaTiles(blockBuf, &tileset[0x20 * (metaTilesArray[7] & 0x3FF)], (metaTilesArray[7] >> 10) & 3);
}

static void TeachyTvComputeSingleMapTileBlockFromTilesetAndMetaTiles(u8 *blockBuf, u8 *tileset, u8 metaTile)
{
    u8 i, j;
    u8 * buffer = AllocZeroed(0x20);
    u8 * src = AllocZeroed(0x20);
    CpuFastCopy(tileset, buffer, 0x20);
    if (metaTile & 1)
    {
        for (i = 0; i < 8; ++i)
        {
            for (j = 0; j < 4; ++j)
            {
                u32 offset = j - 3;
                u8 value = buffer[(i << 2) - offset];
                src[(i << 2) + j] = ((value & 0xF) << 4) + ((value & 0xF0) >> 4);
            }
        }
        CpuFastCopy(src, buffer, 0x20);
    }
    if (metaTile & 2)
    {
        for (i = 0; i < 8; ++i)
            memcpy(&src[4 * i], &buffer[4 * (7 - i)], 4);
        CpuFastCopy(src, buffer, 0x20);
    }
    for (i = 0; i < 32; ++i)
    {
        if (buffer[i] & 0xF0)
            blockBuf[i] = (blockBuf[i] & 0xF) + (buffer[i] & 0xF0);
        if (buffer[i] & 0xF)
            blockBuf[i] = (blockBuf[i] & 0xF0) + (buffer[i] & 0xF);
    }
    Free(src);
    Free(buffer);
}

static u16 TeachyTvComputePalIndexArrayEntryByMetaTile(u8 *palIndexArrayBuf, u16 metaTile)
{
    u16 i;
    int firstEntry;
    int temp;
    u32 pal = metaTile >> 12;
    i = 0;
    firstEntry = *palIndexArrayBuf;
    if (firstEntry != pal)
    {
        if (firstEntry == 0xFF)
        {
            *palIndexArrayBuf = pal;
        }
        else
        {
            while (++i < 16)
            {
                temp = palIndexArrayBuf[i];
                if (temp == pal)
                    break;
                if (temp == 0xFF)
                {
                    palIndexArrayBuf[i] = pal;
                    break;
                }
            }
        }
    }
    return (0xF - i);
}

static void TeachyTvLoadMapPalette(const struct MapLayout * mStruct, const u8 * palIndexArray)
{
    u8 i;
    const struct Tileset * ts;
    const u16 * dest;

    for (i = 0; i < 16; i++)
    {
        if (palIndexArray[i] == 0xFF)
            break;
        if (palIndexArray[i] >= NUM_PALS_IN_PRIMARY)
            dest = mStruct->secondaryTileset->palettes[palIndexArray[i]];
        else
            dest = mStruct->primaryTileset->palettes[palIndexArray[i]];
        LoadPalette(dest, BG_PLTT_ID(15 - i), PLTT_SIZE_4BPP);
    }
}
