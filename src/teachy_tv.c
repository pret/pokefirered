#include "task.h"
#include "menu.h"
#include "palette.h"
#include "sprite.h"
#include "menu_helpers.h"
#include "new_menu_helpers.h"
#include "sound.h"
#include "malloc.h"
#include "scanline_effect.h"
#include "bg.h"
#include "gpu_regs.h"
#include "decompress.h"
#include "window.h"
#include "list_menu.h"
#include "item_menu.h"
#include "item.h"
#include "menu_indicators.h"
#include "field_map_obj.h"
#include "random.h"
#include "text.h"
#include "constants/songs.h"
#include "constants/items.h"
#include "event_data.h"
#include "load_save.h"
#include "battle_transition.h"
#include "battle_2.h"
#include "battle.h"
#include "global.fieldmap.h"
#include "teachy_tv.h"
#include "help_system.h"
#include "overworld.h"
#include "unk_8159F40.h"
#include "graphics.h"
#include "fieldmap.h"
#include "strings.h"

struct TeachyTvCtrlBlk
{
    MainCallback callback;
    u8 mode;
    u8 optionChosen;
    u16 scrollOffset;
    u16 selectedRow;
    u16 filler;
};

struct TeachyTvBuf
{
    MainCallback savedCallback;
    u16 buffer1[0x800];
    u16 buffer2[0x800];
    u16 buffer3[0x800];
    u16 buffer4[0x800];
    u8 var_4004;
    u8 var_4005;
    u8 var_4006;
    u8 var_4007;
};

EWRAM_DATA struct TeachyTvCtrlBlk gTeachyTV_StaticResources = {0};
EWRAM_DATA struct TeachyTvBuf * gUnknown_203F450 = NULL;

void TeachyTvClusFuncTransitionRenderBg2TeachyTvGraphicInitNpcPos(u8 taskId);
void TeachyTvClusFuncClearBg2TeachyTvGraphic(u8 taskId);
void TeachyTvClusFuncNpcMoveAndSetupTextPrinter(u8 taskId);
void TeachyTvClusFuncIdleIfTextPrinterIsActive(u8 taskId);
void TeachyTvClusFuncTextPrinterSwitchStringByOptionChosen(u8 taskId);
void TeachyTvClusFuncTextPrinterSwitchStringByOptionChosen2(u8 taskId);
void TeachyTvClusFuncIdleIfTextPrinterIsActive2(u8 taskId);
void TeachyTvClusFuncEraseTextWindowIfKeyPressed(u8 taskId);
void TeachyTvClusFuncStartAnimNpcWalkIntoGrass(u8 taskId);
void TeachyTvClusFuncDudeMoveUp(u8 taskId);
void TeachyTvClusFuncDudeMoveRight(u8 taskId);
void TeachyTvClusFuncDudeTurnLeft(u8 taskId);
void TeachyTvClusFuncDudeMoveLeft(u8 taskId);
void TeachyTvClusFuncRenderAndRemoveBg1EndGraphic(u8 taskId);
void TeachyTvClusFuncTaskBattleOrFadeByOptionChosen(u8 taskId);
void TeachyTvCallback(void);
void TeachyTvMainCallback(void);
void TeachyTvVblankHandler(void);
void TeachyTvCreateAndRenderRbox(void);
void TeachyTvInitIo(void);
u8 TeachyTvSetupObjEventAndOam(void);
void TeachyTvSetupPostBattleWindowAndObj(u8);
u8 TeachyTvSetupWindow(void);
void TeachyTvSetupScrollIndicatorArrowPair(void);
void TeachyTvSetWindowRegs(void);
void TeachyTvSetupBg(void);
void TeachyTvLoadGraphic(void);
void TeachyTvPostBattleFadeControl(u8);
void TeachyTvOptionListController(u8);
void TeachyTvAudioByInput(s32, bool8, struct ListMenu *);
void TeachyTvQuitFadeControlAndTaskDel(u8 taskId);
void TeachyTvRenderMsgAndSwitchClusterFuncs(u8 taskId);
void TeachyTvClearBg1EndGraphicText(void);
void TeachyTvBackToOptionList(u8 taskId);
void TeachyTvSetupBagItemsByOptionChosen(void);
void TeachyTvPrepBattle(u8 taskId);
void TeachyTvGrassAnimationMain(u8 taskId, s16 x, s16 y, u8 subpriority, bool8 mode);
void TeachyTvLoadBg3Map(u16 *);
u8 TeachyTvGrassAnimationCheckIfNeedsToGenerateGrassObj(s16 x, s16 y);
void TeachyTvGrassAnimationObjCallback(struct Sprite *sprite);
void TeachyTvRestorePlayerPartyCallback(void);
void TeachyTvPreBattleAnimAndSetBattleCallback(u8 taskId);
void TeachyTvLoadMapTilesetToBuffer(struct Tileset *ts, u8 *dstBuffer, u16 size);
void TeachyTvPushBackNewMapPalIndexArrayEntry(const struct MapData *mStruct, u16 *buf1, u8 *palIndexArray, u16 mapEntry, u16 offset);
void TeachyTvComputeMapTilesFromTilesetAndMetaTiles(u16 *metaTilesArray, u8 *blockBuf, u8 *tileset);
void TeachyTvComputeSingleMapTileBlockFromTilesetAndMetaTiles(u8 *blockBuf, u8 *tileset, u8 metaTile);
u16 TeachyTvComputePalIndexArrayEntryByMetaTile(u8 *palIndexArrayBuf, u16 metaTile);
void TeachyTvLoadMapPalette(const struct MapData * mStruct, const u8 *palIndexArray);

const struct BgTemplate gTeachyTvBgTemplateArray[] = 
{
    {
        .bg = 0x0,
        .charBaseIndex = 0x0,
        .mapBaseIndex = 0x1F,
        .screenSize = 0x0,
        .paletteMode = 0x0,
        .priority = 0x1,
        .baseTile = 0x0,
    },
    {
        .bg = 0x1,
        .charBaseIndex = 0x0,
        .mapBaseIndex = 0x1E,
        .screenSize = 0x0,
        .paletteMode = 0x0,
        .priority = 0x0,
        .baseTile = 0x0,
    },
    {
        .bg = 0x2,
        .charBaseIndex = 0x0,
        .mapBaseIndex = 0x1D,
        .screenSize = 0x0,
        .paletteMode = 0x0,
        .priority = 0x2,
        .baseTile = 0x0,
    },
    {
        .bg = 0x3,
        .charBaseIndex = 0x2,
        .mapBaseIndex = 0x1C,
        .screenSize = 0x0,
        .paletteMode = 0x0,
        .priority = 0x3,
        .baseTile = 0x0,
    },
};

const struct WindowTemplate gTeachyTvWindowTemplateArray[] = 
{
    {
        .bg = 0x1,
        .tilemapLeft = 0x2,
        .tilemapTop = 0xF,
        .width = 0x1A,
        .height = 0x4,
        .paletteNum = 0x3,
        .baseBlock = 0xEA,
    },
    {
        .bg = 0x0,
        .tilemapLeft = 0x4,
        .tilemapTop = 0x1,
        .width = 0x16,
        .height = 0xC,
        .paletteNum = 0x3,
        .baseBlock = 0x152,
    },
    DUMMY_WIN_TEMPLATE,
};

const struct ListMenuItem gTeachyTvListMenuItemArray[] = 
{
    {
        .label = gUnknown_841B7A4,
        .index = 0,
    },
    {
        .label = gUnknown_841B7BC,
        .index = 1,
    },
    {
        .label = gUnknown_841B7D6,
        .index = 2,
    },
    {
        .label = gUnknown_841B7EE,
        .index = 3,
    },
    {
        .label = gUnknown_841B807,
        .index = 4,
    },
    {
        .label = gUnknown_841B81B,
        .index = 5,
    },

    {
        .label = gUnknown_841B836,
        .index = -2,
    },
};

const struct ListMenuItem gTeachyTvListMenuItemArray2[] = 
{
    {
        .label = gUnknown_841B7A4,
        .index = 0,
    },
    {
        .label = gUnknown_841B7BC,
        .index = 1,
    },
    {
        .label = gUnknown_841B7D6,
        .index = 2,
    },
    {
        .label = gUnknown_841B7EE,
        .index = 3,
    },
    {
        .label = gUnknown_841B836,
        .index = -2,
    },
};

const struct ListMenuTemplate gTeachyTvListMenuTemplateArray = 
{
    .items = gTeachyTvListMenuItemArray,
    .moveCursorFunc = NULL,
    .itemPrintFunc = NULL,
    .totalItems = 0x7,
    .maxShowed = 0x6,
    .windowId = 0x0,
    .header_X = 0x0,
    .item_X = 0x8,
    .cursor_X = 0x0,
    .upText_Y = 0x6,
    .cursorPal = 0x1,
    .fillValue = 0x0,
    .cursorShadowPal = 0x2,
    .lettersSpacing = 0x0,
    .itemVerticalPadding = 0x0,
    .scrollMultiple = 0x1,
    .fontId = 0x2,
    .cursorKind = 0x0,
};

const struct ScrollArrowsTemplate gTeachyTvScrollIndicatorArrowPairTemplateArray = 
{
    .firstArrowType = 0x2,
    .firstX = 0x78,
    .firstY = 0xC,
    .secondArrowType = 0x3,
    .secondX = 0x78,
    .secondY = 0x64,
    .fullyUpThreshold = 0x0,
    .fullyDownThreshold = 0x1,
    .tileTag = 0x800,
    .palTag = 0x800,
    .palNum = 0x0,
};

const u8 gTeachyTvSwitchFuncArray[] = 
{
    0xC, 0xC, 0xC, 0xC, 0x9, 0x9, 0x0, 0x0, 
};

void (* const gTeachyTvFuncCluster0[])(u8) = 
{
    TeachyTvClusFuncTransitionRenderBg2TeachyTvGraphicInitNpcPos,
    TeachyTvClusFuncClearBg2TeachyTvGraphic,
    TeachyTvClusFuncNpcMoveAndSetupTextPrinter,
    TeachyTvClusFuncIdleIfTextPrinterIsActive,
    TeachyTvClusFuncIdleIfTextPrinterIsActive2,
    TeachyTvClusFuncTextPrinterSwitchStringByOptionChosen,
    TeachyTvClusFuncIdleIfTextPrinterIsActive2,
    TeachyTvClusFuncEraseTextWindowIfKeyPressed,
    TeachyTvClusFuncStartAnimNpcWalkIntoGrass,
    TeachyTvClusFuncDudeMoveUp,
    TeachyTvClusFuncDudeMoveRight,
    TeachyTvClusFuncTaskBattleOrFadeByOptionChosen,
    TeachyTvClusFuncTextPrinterSwitchStringByOptionChosen2,
    TeachyTvClusFuncIdleIfTextPrinterIsActive2,
    TeachyTvClusFuncEraseTextWindowIfKeyPressed,
    TeachyTvClusFuncDudeTurnLeft,
    TeachyTvClusFuncDudeMoveLeft,
    TeachyTvClusFuncRenderAndRemoveBg1EndGraphic,
    TeachyTvBackToOptionList,
};

void (* const gTeachyTvFuncCluster1[])(u8) = 
{
    TeachyTvClusFuncTransitionRenderBg2TeachyTvGraphicInitNpcPos,
    TeachyTvClusFuncClearBg2TeachyTvGraphic,
    TeachyTvClusFuncNpcMoveAndSetupTextPrinter,
    TeachyTvClusFuncIdleIfTextPrinterIsActive,
    TeachyTvClusFuncIdleIfTextPrinterIsActive2,
    TeachyTvClusFuncTextPrinterSwitchStringByOptionChosen,
    TeachyTvClusFuncIdleIfTextPrinterIsActive2,
    TeachyTvClusFuncEraseTextWindowIfKeyPressed,
    TeachyTvClusFuncStartAnimNpcWalkIntoGrass,
    TeachyTvClusFuncDudeMoveUp,
    TeachyTvClusFuncDudeMoveRight,
    TeachyTvClusFuncTaskBattleOrFadeByOptionChosen,
    TeachyTvClusFuncTextPrinterSwitchStringByOptionChosen2,
    TeachyTvClusFuncIdleIfTextPrinterIsActive2,
    TeachyTvClusFuncEraseTextWindowIfKeyPressed,
    TeachyTvClusFuncDudeTurnLeft,
    TeachyTvClusFuncDudeMoveLeft,
    TeachyTvClusFuncRenderAndRemoveBg1EndGraphic,
    TeachyTvBackToOptionList,
};

void (* const gTeachyTvFuncCluster2[])(u8) = 
{
    TeachyTvClusFuncTransitionRenderBg2TeachyTvGraphicInitNpcPos,
    TeachyTvClusFuncClearBg2TeachyTvGraphic,
    TeachyTvClusFuncNpcMoveAndSetupTextPrinter,
    TeachyTvClusFuncIdleIfTextPrinterIsActive,
    TeachyTvClusFuncIdleIfTextPrinterIsActive2,
    TeachyTvClusFuncTextPrinterSwitchStringByOptionChosen,
    TeachyTvClusFuncIdleIfTextPrinterIsActive2,
    TeachyTvClusFuncEraseTextWindowIfKeyPressed,
    TeachyTvClusFuncStartAnimNpcWalkIntoGrass,
    TeachyTvClusFuncDudeMoveUp,
    TeachyTvClusFuncDudeMoveRight,
    TeachyTvClusFuncTaskBattleOrFadeByOptionChosen,
    TeachyTvClusFuncTextPrinterSwitchStringByOptionChosen2,
    TeachyTvClusFuncIdleIfTextPrinterIsActive2,
    TeachyTvClusFuncEraseTextWindowIfKeyPressed,
    TeachyTvClusFuncDudeTurnLeft,
    TeachyTvClusFuncDudeMoveLeft,
    TeachyTvClusFuncRenderAndRemoveBg1EndGraphic,
    TeachyTvBackToOptionList,
};

void (* const gTeachyTvFuncCluster3[])(u8) = 
{
    TeachyTvClusFuncTransitionRenderBg2TeachyTvGraphicInitNpcPos,
    TeachyTvClusFuncClearBg2TeachyTvGraphic,
    TeachyTvClusFuncNpcMoveAndSetupTextPrinter,
    TeachyTvClusFuncIdleIfTextPrinterIsActive,
    TeachyTvClusFuncIdleIfTextPrinterIsActive2,
    TeachyTvClusFuncTextPrinterSwitchStringByOptionChosen,
    TeachyTvClusFuncIdleIfTextPrinterIsActive2,
    TeachyTvClusFuncEraseTextWindowIfKeyPressed,
    TeachyTvClusFuncStartAnimNpcWalkIntoGrass,
    TeachyTvClusFuncDudeMoveUp,
    TeachyTvClusFuncDudeMoveRight,
    TeachyTvClusFuncTaskBattleOrFadeByOptionChosen,
    TeachyTvClusFuncTextPrinterSwitchStringByOptionChosen2,
    TeachyTvClusFuncIdleIfTextPrinterIsActive2,
    TeachyTvClusFuncEraseTextWindowIfKeyPressed,
    TeachyTvClusFuncDudeTurnLeft,
    TeachyTvClusFuncDudeMoveLeft,
    TeachyTvClusFuncRenderAndRemoveBg1EndGraphic,
    TeachyTvBackToOptionList,
};

void (* const gTeachyTvFuncCluster4[])(u8) = 
{
    TeachyTvClusFuncTransitionRenderBg2TeachyTvGraphicInitNpcPos,
    TeachyTvClusFuncClearBg2TeachyTvGraphic,
    TeachyTvClusFuncNpcMoveAndSetupTextPrinter,
    TeachyTvClusFuncIdleIfTextPrinterIsActive,
    TeachyTvClusFuncIdleIfTextPrinterIsActive2,
    TeachyTvClusFuncTextPrinterSwitchStringByOptionChosen,
    TeachyTvClusFuncIdleIfTextPrinterIsActive2,
    TeachyTvClusFuncEraseTextWindowIfKeyPressed,
    TeachyTvClusFuncTaskBattleOrFadeByOptionChosen,
    TeachyTvClusFuncTextPrinterSwitchStringByOptionChosen2,
    TeachyTvClusFuncIdleIfTextPrinterIsActive2,
    TeachyTvClusFuncEraseTextWindowIfKeyPressed,
    TeachyTvClusFuncDudeTurnLeft,
    TeachyTvClusFuncDudeMoveLeft,
    TeachyTvClusFuncRenderAndRemoveBg1EndGraphic,
    TeachyTvBackToOptionList,
};

void (* const gTeachyTvFuncCluster5[])(u8) = 
{
    TeachyTvClusFuncTransitionRenderBg2TeachyTvGraphicInitNpcPos,
    TeachyTvClusFuncClearBg2TeachyTvGraphic,
    TeachyTvClusFuncNpcMoveAndSetupTextPrinter,
    TeachyTvClusFuncIdleIfTextPrinterIsActive,
    TeachyTvClusFuncIdleIfTextPrinterIsActive2,
    TeachyTvClusFuncTextPrinterSwitchStringByOptionChosen,
    TeachyTvClusFuncIdleIfTextPrinterIsActive2,
    TeachyTvClusFuncEraseTextWindowIfKeyPressed,
    TeachyTvClusFuncTaskBattleOrFadeByOptionChosen,
    TeachyTvClusFuncTextPrinterSwitchStringByOptionChosen2,
    TeachyTvClusFuncIdleIfTextPrinterIsActive2,
    TeachyTvClusFuncEraseTextWindowIfKeyPressed,
    TeachyTvClusFuncDudeTurnLeft,
    TeachyTvClusFuncDudeMoveLeft,
    TeachyTvClusFuncRenderAndRemoveBg1EndGraphic,
    TeachyTvBackToOptionList,
};

void TeachyTvCallback(void)
{
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    do_scheduled_bg_tilemap_copies_to_vram();
    UpdatePaletteFade();
}

void TeachyTvVblankHandler(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}

void sub_815ABC4(u8 mode, void (*cb)())
{
    gTeachyTV_StaticResources.mode = mode;
    gTeachyTV_StaticResources.callback = cb;
    if (mode == 0)
    {
        gTeachyTV_StaticResources.scrollOffset = 0;
        gTeachyTV_StaticResources.selectedRow = 0;
        gTeachyTV_StaticResources.optionChosen = 0;
    }
    if (mode == 1)
    {
        gTeachyTV_StaticResources.mode = 0;
    }
    SetMainCallback2(TeachyTvMainCallback);
}

void CB2_ReturnToTeachyTV(void)
{
    if (gTeachyTV_StaticResources.mode == 1)
        sub_815ABC4(1, gTeachyTV_StaticResources.callback);
    else
        sub_815ABC4(2, gTeachyTV_StaticResources.callback);
}

void sub_815AC20(void)
{
    gTeachyTV_StaticResources.mode = 1;
}

void TeachyTvMainCallback(void)
{
    u8 taskId;
    struct Task *taskAddr;

    switch (gMain.state)
    {
    case 0:
        gUnknown_203F450 = AllocZeroed(sizeof(struct TeachyTvBuf));
        gUnknown_203F450->savedCallback = NULL;
        gUnknown_203F450->var_4006 = 0;
        gUnknown_203F450->var_4007 = 0xFF;
        VblankHblankHandlerSetZero();
        clear_scheduled_bg_copies_to_vram();
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
        if (free_temp_tile_data_buffers_if_possible() == TRUE)
            return;
        TeachyTvCreateAndRenderRbox();
        TeachyTvInitIo();
        if (gTeachyTV_StaticResources.mode == 2)
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
            PlayNewMapMusic(BGM_FRLG_TEACHY_TV);
            TeachyTvSetWindowRegs();
        }
        schedule_bg_copy_tilemap_to_vram(0);
        schedule_bg_copy_tilemap_to_vram(1);
        schedule_bg_copy_tilemap_to_vram(2);
        schedule_bg_copy_tilemap_to_vram(3);
        sub_812B1E0(9); // help system something
        BlendPalettes(0xFFFFFFFF, 0x10, 0);
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 0x10, 0, 0);
        SetVBlankCallback(TeachyTvVblankHandler);
        SetMainCallback2(TeachyTvCallback);
        break;
    }
}

void TeachyTvSetupBg(void)
{
    InitBgReg();
    ResetBgsAndClearDma3BusyFlags(0);
    InitBgsFromTemplates(0, gTeachyTvBgTemplateArray, 4);
    SetBgTilemapBuffer(1, gUnknown_203F450->buffer1);
    SetBgTilemapBuffer(2, gUnknown_203F450->buffer2);
    SetBgTilemapBuffer(3, gUnknown_203F450->buffer3);
    SetGpuReg(REG_OFFSET_DISPCNT, 0x3040);
    ShowBg(0);
    ShowBg(1);
    ShowBg(2);
    ShowBg(3);
    ChangeBgX(3, 0x1000, 2);
    ChangeBgY(3, 0x2800, 1);
    gUnknown_203F450->var_4004 = 0;
    gUnknown_203F450->var_4005 = 3;
    SetGpuReg(REG_OFFSET_BLDCNT, 0);
}

void TeachyTvLoadGraphic(void)
{
    u16 src = RGB_BLACK;
    reset_temp_tile_data_buffers();
    decompress_and_copy_tile_data_to_vram(1, gUnknown_8E86240, 0, 0, 0);
    LZDecompressWram(gUnknown_8E86BE8, gUnknown_203F450->buffer1);
    LZDecompressWram(gUnknown_8E86D6C, gUnknown_203F450->buffer4);
    LoadCompressedPalette(gUnknown_8E86F98, 0, 0x80);
    LoadPalette(&src, 0, sizeof(src));
    LoadSpritePalette(&gUnknown_83A5348);
    TeachyTvLoadBg3Map(gUnknown_203F450->buffer3);
}

void TeachyTvCreateAndRenderRbox(void)
{
    InitWindows(gTeachyTvWindowTemplateArray);
    DeactivateAllTextPrinters();
    FillWindowPixelBuffer(0, 0xCC);
    PutWindowTilemap(0);
    PutWindowTilemap(1);
    CopyWindowToVram(0, 2);
}

u8 TeachyTvSetupWindow(void)
{
    gMultiuseListMenuTemplate = gTeachyTvListMenuTemplateArray;
    gMultiuseListMenuTemplate.windowId = 1;
    gMultiuseListMenuTemplate.moveCursorFunc = TeachyTvAudioByInput;
    if (!CheckBagHasItem(ITEM_TM_CASE, 1))
    {
        gMultiuseListMenuTemplate.items = gTeachyTvListMenuItemArray2;
        gMultiuseListMenuTemplate.totalItems = 5;
        gMultiuseListMenuTemplate.maxShowed = 5;
        gMultiuseListMenuTemplate.upText_Y = (gMultiuseListMenuTemplate.upText_Y + 8) & 0xF;
    }
    return ListMenuInit(
               &gMultiuseListMenuTemplate,
               gTeachyTV_StaticResources.scrollOffset,
               gTeachyTV_StaticResources.selectedRow
    );
}

void TeachyTvSetupScrollIndicatorArrowPair(void)
{
    if (!CheckBagHasItem(ITEM_TM_CASE, 1))
    {
        struct TeachyTvBuf * temp = gUnknown_203F450;
        temp->var_4007 = 0xFF;
    }
    else
    {
        gUnknown_203F450->var_4007 = AddScrollIndicatorArrowPair(&gTeachyTvScrollIndicatorArrowPairTemplateArray, &(gTeachyTV_StaticResources.scrollOffset));
    }
}

void TeachyTvRemoveScrollIndicatorArrowPair(void)
{
    if (gUnknown_203F450->var_4007 != 0xFF)
    {
        RemoveScrollIndicatorArrowPair(gUnknown_203F450->var_4007);
        gUnknown_203F450->var_4007 = 0xFF;
    }
}

void TeachyTvAudioByInput(s32 notUsed, bool8 play, struct ListMenu *notUsedAlt)
{
    if (play != TRUE)
        PlaySE(SE_SELECT);
}

void TeachyTvInitIo(void)
{
    SetGpuReg(REG_OFFSET_WININ, 0x3F);
    SetGpuReg(REG_OFFSET_WINOUT, 0x1F);
    SetGpuReg(REG_OFFSET_BLDCNT, 0xCC);
    SetGpuReg(REG_OFFSET_BLDY, 0x5);
}

u8 TeachyTvSetupObjEventAndOam(void)
{
    u8 objId = AddPseudoEventObject(90, SpriteCallbackDummy, 0, 0, 8);
    gSprites[objId].oam.priority = 2;
    gSprites[objId].invisible = 1;
    return objId;
}

void TeachyTvSetSpriteCoordsAndSwitchFrame(u8 objId, u16 x, u16 y, u8 frame)
{
    gSprites[objId].pos2.x = x;
    gSprites[objId].pos2.y = y;
    gSprites[objId].invisible = 0;
    StartSpriteAnim(&gSprites[objId], frame);
}

void TeachyTvSetWindowRegs(void)
{
    SetGpuReg(REG_OFFSET_WIN0V, 0xC64);
    SetGpuReg(REG_OFFSET_WIN0H, 0x1CD4);
}

void TeachyTvClearWindowRegs(void)
{
    SetGpuReg(REG_OFFSET_WIN0V, 0x0);
    SetGpuReg(REG_OFFSET_WIN0H, 0x0);
}

void TeachyTvBg2AnimController(void)
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
    schedule_bg_copy_tilemap_to_vram(2);
}

void TeachyTvSetupPostBattleWindowAndObj(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    struct Sprite *objAddr = &gSprites[data[1]];
    int op;

    ClearWindowTilemap(1);
    TeachyTvClearWindowRegs();
    op = gTeachyTV_StaticResources.optionChosen;
    if (op >= 0)
    {
        if (op <= 3)
        {
            TeachyTvSetSpriteCoordsAndSwitchFrame(data[1], 0x78, 0x38, 0);
            ChangeBgX(3, 0x3000, 1);
            ChangeBgY(3, 0x3000, 2);
            gUnknown_203F450->var_4004 += 3;
            gUnknown_203F450->var_4005 -= 3;
        }
        else if (op <= 5)
            TeachyTvSetSpriteCoordsAndSwitchFrame(data[1], 0x78, 0x38, 0);
    }

    data[4] = 0;
    data[5] = 0;
    TeachyTvGrassAnimationMain(taskId, objAddr->pos2.x, objAddr->pos2.y, 0, 1);
}

void TeachyTvInitTextPrinter(const u8 *text)
{
    gTextFlags.autoScroll = 0;
    AddTextPrinterParameterized2(0, 4, text, GetTextSpeedSetting(), 0, 1, 0xC, 3);
}

void TeachyTvFree(void)
{
    Free(gUnknown_203F450);
    gUnknown_203F450 = NULL;
    FreeAllWindowBuffers();
}

void TeachyTvQuitBeginFade(u8 taskId)
{
    BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 0x10, 0);
    gTasks[taskId].func = TeachyTvQuitFadeControlAndTaskDel;
}

void TeachyTvQuitFadeControlAndTaskDel(u8 taskId)
{
    if (!(gPaletteFade.active))
    {
        if (gUnknown_203F450->savedCallback != NULL)
        {
            SetMainCallback2(gUnknown_203F450->savedCallback);
        }
        else
        {
            sub_8055DC4();
            SetMainCallback2(gTeachyTV_StaticResources.callback);
        }
        TeachyTvFree();
        DestroyTask(taskId);
    }
}

void TeachyTvOptionListController(u8 taskId)
{
    s16 * data = gTasks[taskId].data;
    s32 input;

    TeachyTvBg2AnimController();
    if (!gPaletteFade.active)
    {
        input = ListMenuHandleInput(data[0]);
        ListMenuGetScrollAndRow(data[0], &gTeachyTV_StaticResources.scrollOffset, &gTeachyTV_StaticResources.selectedRow);
        if ((JOY_NEW(SELECT_BUTTON) && gTeachyTV_StaticResources.callback != UseFameCheckerFromMenu))
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
                gTeachyTV_StaticResources.optionChosen = input;
                DestroyListMenu(data[0], &gTeachyTV_StaticResources.scrollOffset, &gTeachyTV_StaticResources.selectedRow);
                TeachyTvClearWindowRegs();
                ClearWindowTilemap(1);
                schedule_bg_copy_tilemap_to_vram(0);
                TeachyTvRemoveScrollIndicatorArrowPair();
                data[3] = 0;
                data[2] = 0;
                gTasks[taskId].func = TeachyTvRenderMsgAndSwitchClusterFuncs;
                break;
            }
        }
    }
}

void TeachyTvClusFuncTransitionRenderBg2TeachyTvGraphicInitNpcPos(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    TeachyTvBg2AnimController();
    if (++data[2] > 63)
    {
        CopyToBgTilemapBufferRect_ChangePalette(2, gUnknown_203F450->buffer4, 0, 0, 0x20, 0x20, 0x11);
        TeachyTvSetSpriteCoordsAndSwitchFrame(((u8 *)data)[2], 8, 0x38, 7);
        schedule_bg_copy_tilemap_to_vram(2);
        data[2] = 0;
        ++data[3];
        PlayNewMapMusic(BGM_FRLG_FOLLOW_ME);
    }
}

void TeachyTvClusFuncClearBg2TeachyTvGraphic(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    if (++data[2] == 134)
    {
        FillBgTilemapBufferRect_Palette0(2, 0, 2, 1, 0x1A, 0xC);
        schedule_bg_copy_tilemap_to_vram(2);
        data[2] = 0;
        ++data[3];
    }
}

void TeachyTvClusFuncNpcMoveAndSetupTextPrinter(u8 taskId)
{
    s16 * data = gTasks[taskId].data;
    struct Sprite * spriteAddr = &gSprites[data[1]];
    if (data[2] != 35)
        ++data[2];
    else {
        if (spriteAddr->pos2.x == 0x78)
        {
            StartSpriteAnim(&gSprites[data[1]], 0);
            TeachyTvInitTextPrinter(gUnknown_841B83D);
            data[2] = 0;
            ++data[3];
        }
        else
            ++spriteAddr->pos2.x;
    }   
}

void TeachyTvClusFuncIdleIfTextPrinterIsActive(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    if (!sub_80BF518(0))
        ++data[3];
}

void TeachyTvRenderMsgAndSwitchClusterFuncs(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    if (JOY_NEW(B_BUTTON))
    {
        u8 *offset = &(gUnknown_203F450->var_4006);
        u32 zero = 0;
        offset[0] = 1;
        TeachyTvSetSpriteCoordsAndSwitchFrame(*((char *)data + 2), 0, 0, 0);
        FillWindowPixelBuffer(0, 0xCC);
        CopyWindowToVram(0, 2);
        TeachyTvClearBg1EndGraphicText();
        data[2] = zero;
        data[3] = zero;
        gTasks[taskId].func = TeachyTvBackToOptionList;
    }
    else
    {
        static void (* const * const array[])(u8) =
        {
            gTeachyTvFuncCluster0,
            gTeachyTvFuncCluster1,
            gTeachyTvFuncCluster2,
            gTeachyTvFuncCluster3,
            gTeachyTvFuncCluster4,
            gTeachyTvFuncCluster5,
        };
        void (*const *cluster)(u8) = array[gTeachyTV_StaticResources.optionChosen];
        cluster[data[3]](taskId);
    }
}

void TeachyTvClusFuncTextPrinterSwitchStringByOptionChosen(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    static const u8 *const texts[] = {
        gUnknown_841B8BF,
        gUnknown_841BB40,
        gUnknown_841BE76,
        gUnknown_841C23B,
        gUnknown_841C459,
        gUnknown_841C82A,
    };
    TeachyTvInitTextPrinter(texts[gTeachyTV_StaticResources.optionChosen]);
    ++data[3];
}

void TeachyTvClusFuncTextPrinterSwitchStringByOptionChosen2(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    static const u8 *const texts[] =
    {
        gUnknown_841BA41,
        gUnknown_841BD10,
        gUnknown_841C0AF,
        gUnknown_841C384,
        gUnknown_841C7B4,
        gUnknown_841C994,
    };
    TeachyTvInitTextPrinter(texts[gTeachyTV_StaticResources.optionChosen]);
    ++data[3];
}

const u16 gUnknown_8479590[] = 
{
    0xD1, 0xD2, 0xD3, 0xD4, 0xD5, 0xD6, 0xD7, 0xD8,
    0xE1, 0xE2, 0xE3, 0xE4, 0xE5, 0xE6, 0xE7, 0xE8,
};

const struct Subsprite gTeachyTvSubspriteArray[] = 
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

const struct SubspriteTable gTeachyTvSubspriteTableArray[] = 
{
    {
        .subspriteCount = 0,
        .subsprites = NULL,
    },
    {
        .subspriteCount = 2,
        .subsprites = gTeachyTvSubspriteArray,
    },
};

const u8 gTeachyTvGrassAnimArray[] = 
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

void TeachyTvClusFuncIdleIfTextPrinterIsActive2(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    if (!sub_80BF518(0))
        ++data[3];
}

void TeachyTvClusFuncEraseTextWindowIfKeyPressed(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    if (JOY_NEW(A_BUTTON | B_BUTTON))
    {
        FillWindowPixelBuffer(0, 0xCC);
        CopyWindowToVram(0, 2);
        ++data[3];
    }
}

void TeachyTvClusFuncStartAnimNpcWalkIntoGrass(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    StartSpriteAnim(&gSprites[data[1]], 5);
    data[2] = 0;
    data[4] = 0;
    data[5] = 1;
    ++data[3];
}

void TeachyTvClusFuncDudeMoveUp(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    struct Sprite *obj = &gSprites[data[1]];
    ChangeBgY(3, 0x100, 2);
    if (!(++data[2] & 0xF))
    {
        --gUnknown_203F450->var_4005;
        TeachyTvGrassAnimationMain(taskId, obj->pos2.x, obj->pos2.y, 0, 0);
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

void TeachyTvClusFuncDudeMoveRight(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    struct Sprite *obj = &gSprites[data[1]];
    ChangeBgX(3, 0x100, 1);
    if (!(++data[2] & 0xF))
        ++gUnknown_203F450->var_4004;
    if (!((data[2] + 8) & 0xF))
        TeachyTvGrassAnimationMain(taskId, obj->pos2.x + 8, obj->pos2.y, 0, 0);
    if (data[2] == 0x30)
    {
        data[2] = 0;
        data[4] = 0;
        data[5] = 0;
        StartSpriteAnim(obj, 3);
        ++data[3];
    }
}

void TeachyTvClusFuncDudeTurnLeft(u8 taskId)
{

    s16 *data = gTasks[taskId].data;
    struct Sprite *objAddr = &gSprites[data[1]];
    StartSpriteAnim(objAddr, 6);
    ++data[3];
    data[4] = 0;
    data[5] = 0;
    TeachyTvGrassAnimationMain(taskId, objAddr->pos2.x, objAddr->pos2.y, 0, 0);
}

void TeachyTvClusFuncDudeMoveLeft(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    struct Sprite *objAddr = &gSprites[data[1]];

    if (!(objAddr->pos2.x & 0xF))
        TeachyTvGrassAnimationMain(taskId, objAddr->pos2.x - 8, objAddr->pos2.y, 0, 0);
    if (objAddr->pos2.x == 8)
        ++data[3];
    else
        --objAddr->pos2.x;
}

void TeachyTvClusFuncRenderAndRemoveBg1EndGraphic(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    if (!data[2])
    {
        CopyToBgTilemapBufferRect_ChangePalette(1, gUnknown_8479590, 0x14, 0xA, 8, 2, 0x11);
        schedule_bg_copy_tilemap_to_vram(1);
    }
    if (++data[2] > 126)
    {
        TeachyTvClearBg1EndGraphicText();
        data[2] = 0;
        ++data[3];
    }
}

void TeachyTvClearBg1EndGraphicText(void)
{
    FillBgTilemapBufferRect_Palette0(1, 0, 0x14, 0xA, 8, 2);
    schedule_bg_copy_tilemap_to_vram(1);
}

void TeachyTvBackToOptionList(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    if (data[2] == 0)
        PlayNewMapMusic(BGM_FRLG_TEACHY_TV);
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
        schedule_bg_copy_tilemap_to_vram(0);
        ChangeBgX(3, 0x0, 0);
        ChangeBgY(3, 0x0, 0);
        ChangeBgX(3, 0x1000, 2);
        ChangeBgY(3, 0x2800, 1);
        gUnknown_203F450->var_4004 = 0;
        gUnknown_203F450->var_4005 = 3;
        gUnknown_203F450->var_4006 = 0;
    }
}

void TeachyTvClusFuncTaskBattleOrFadeByOptionChosen(u8 taskId)
{
    int op = gTeachyTV_StaticResources.optionChosen;
    if (op >= 0)
    {
        if (op <= 3)
        {
            TeachyTvPrepBattle(taskId);
        }
        else if (op <= 5)
        {
            gUnknown_203F450->savedCallback = TeachyTvSetupBagItemsByOptionChosen;
            TeachyTvQuitBeginFade(taskId);
        }
    }
}

void TeachyTvSetupBagItemsByOptionChosen(void)
{
    if (gTeachyTV_StaticResources.optionChosen == 4)
        sub_810B108(10);
    else
        sub_810B108(9);
}

void TeachyTvPostBattleFadeControl(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    if (!(gPaletteFade.active))
    {
        data[3] = gTeachyTvSwitchFuncArray[gTeachyTV_StaticResources.optionChosen];
        gTasks[taskId].func = TeachyTvRenderMsgAndSwitchClusterFuncs;
    }
}

void TeachyTvGrassAnimationMain(u8 taskId, s16 x, s16 y, u8 subpriority, bool8 mode)
{
    struct Sprite *obj;
    u8 spriteId;

    if (gUnknown_203F450->var_4006 != 1 && TeachyTvGrassAnimationCheckIfNeedsToGenerateGrassObj(x - 0x10, y))
    {
        spriteId = CreateSprite(gUnknown_83A0010[4], 0, 0, subpriority);
        obj = &gSprites[spriteId];
        obj->pos2.x = x;
        obj->pos2.y = y + 8;
        obj->callback = TeachyTvGrassAnimationObjCallback;
        obj->data[0] = taskId;
        if (mode == 1)
        {
            SeekSpriteAnim(obj, 4);
            obj->oam.priority = 2;
        }
        else
        {
            SetSubspriteTables(obj, gTeachyTvSubspriteTableArray);
            obj->subspriteTableNum = 0;
            obj->subspriteMode = 1;
        }
    }
}

void TeachyTvGrassAnimationObjCallback(struct Sprite *sprite)
{
    s16 diff1, diff2;
    s16 *data = gTasks[sprite->data[0]].data;
    struct Sprite *objAddr = &gSprites[data[1]];

    if (gUnknown_203F450->var_4006 == 1)
        DestroySprite(sprite);
    else
    {
        if (sprite->animCmdIndex == 0)
            sprite->subspriteTableNum = 1;
        else
            sprite->subspriteTableNum = 0;
        sprite->pos2.x += (u16)data[4];
        sprite->pos2.y += (u16)data[5];
        if (sprite->animEnded)
        {
            sprite->subpriority = 0;
            diff1 = sprite->pos2.x - objAddr->pos2.x;
            diff2 = sprite->pos2.y - objAddr->pos2.y;
            if (diff1 <= -16 || diff1 >= 16 || diff2 <= -16 || diff2 >= 24)
                DestroySprite(sprite);
        }
    }
}

u8 TeachyTvGrassAnimationCheckIfNeedsToGenerateGrassObj(s16 x, s16 y)
{
    const u8 * arr;
    struct TeachyTvBuf *ptr;
    int high, low;
    if ((x < 0) || (y < 0))
        return 0;
    arr = gTeachyTvGrassAnimArray;
    high = ((y >> 4) + gUnknown_203F450->var_4005) << 4;
    low = ((x >> 4) + gUnknown_203F450->var_4004);
    return arr[high+low];
}

void TeachyTvPrepBattle(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    TeachyTvFree();
    gSpecialVar_0x8004 = gTeachyTV_StaticResources.optionChosen;
    gMain.savedCallback = TeachyTvRestorePlayerPartyCallback;
    SavePlayerParty();
    sub_8159F40();
    PlayMapChosenOrBattleBGM(MUS_DUMMY);
    if (!gTeachyTV_StaticResources.optionChosen)
        data[6] = 9;
    else
        data[6] = 8;
    data[7] = 0;
    gTasks[taskId].func = TeachyTvPreBattleAnimAndSetBattleCallback;
}

void TeachyTvPreBattleAnimAndSetBattleCallback(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    switch (data[7])
    {
    case 0:
        sub_80D08B8(data[6]);
        ++data[7];
        break;
    case 1:
        if (sub_80D08F8())
        {
            SetMainCallback2(sub_800FD9C);
            DestroyTask(taskId);
        }
        break;
    }
}

void TeachyTvRestorePlayerPartyCallback(void)
{
    LoadPlayerParty();
    if (gUnknown_2023E8A == 3)
        sub_815AC20();
    else
        PlayNewMapMusic(BGM_FRLG_FOLLOW_ME);
    CB2_ReturnToTeachyTV();
}

void TeachyTvLoadBg3Map(u16 *buffer)
{
    u16 * bgTilesBuffer;
    u8 * mapTilesRowBuffer;
    u16 i, j, k;
    u16 currentBlockIdx;
    void * tilesetsBuffer;
    void * palIndicesBuffer;
    u16 numMapTilesRows = 0;
    const struct MapData *layout = &Route1_Layout;
    u16 * blockIndicesBuffer = AllocZeroed(0x800);
    tilesetsBuffer = AllocZeroed(0x8000);
    palIndicesBuffer = Alloc(16);
    memset(palIndicesBuffer, 0xFF, 16);

    TeachyTvLoadMapTilesetToBuffer(layout->primaryTileset, tilesetsBuffer, 0x280);
    TeachyTvLoadMapTilesetToBuffer(layout->secondaryTileset, tilesetsBuffer + 0x5000, 0x180);

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
        if (blockIndicesBuffer[i] < 0x280)
        {
            TeachyTvComputeMapTilesFromTilesetAndMetaTiles(layout->primaryTileset->metatiles + blockIndicesBuffer[i] * 16, mapTilesRowBuffer, tilesetsBuffer);
        }
        else
        {
            TeachyTvComputeMapTilesFromTilesetAndMetaTiles(layout->secondaryTileset->metatiles + (blockIndicesBuffer[i] - 0x280) * 16, mapTilesRowBuffer, tilesetsBuffer);
        }
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

void TeachyTvLoadMapTilesetToBuffer(struct Tileset *ts, u8 *dstBuffer, u16 size)
{
    if (ts)
    {
        if (!ts->isCompressed)
            CpuFastSet(ts->tiles, dstBuffer, 8 * size);
        else
            LZDecompressWram(ts->tiles, dstBuffer);
    }
}

void TeachyTvPushBackNewMapPalIndexArrayEntry(const struct MapData *mStruct, u16 *buf1, u8 *palIndexArray, u16 mapEntry, u16 offset)
{
    u16 * metaTileEntryAddr = mapEntry <= 0x27F ? &((u16*)(mStruct->primaryTileset->metatiles))[8 * mapEntry] : &((u16*)(mStruct->secondaryTileset->metatiles))[8 * (mapEntry - 0x280)];
    buf1[0] = (TeachyTvComputePalIndexArrayEntryByMetaTile(palIndexArray, metaTileEntryAddr[0]) << 12) + 4 * offset;
    buf1[1] = (TeachyTvComputePalIndexArrayEntryByMetaTile(palIndexArray, metaTileEntryAddr[1]) << 12) + 4 * offset + 1;
    buf1[32] = (TeachyTvComputePalIndexArrayEntryByMetaTile(palIndexArray, metaTileEntryAddr[2]) << 12) + 4 * offset + 2;
    buf1[33] = (TeachyTvComputePalIndexArrayEntryByMetaTile(palIndexArray, metaTileEntryAddr[3]) << 12) + 4 * offset + 3;
}

void TeachyTvComputeMapTilesFromTilesetAndMetaTiles(u16 *metaTilesArray, u8 *blockBuf, u8 *tileset)
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

void TeachyTvComputeSingleMapTileBlockFromTilesetAndMetaTiles(u8 *blockBuf, u8 *tileset, u8 metaTile)
{
    u8 i, j;
    u8 * buffer = AllocZeroed(0x20);
    u8 * src = AllocZeroed(0x20);
    CpuFastSet(tileset, buffer, 8);
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
        CpuFastSet(src, buffer, 8);
    }
    if (metaTile & 2)
    {
        for (i = 0; i < 8; ++i)
            memcpy(&src[4 * i], &buffer[4 * (7 - i)], 4);
        CpuFastSet(src, buffer, 8);
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

u16 TeachyTvComputePalIndexArrayEntryByMetaTile(u8 *palIndexArrayBuf, u16 metaTile)
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

void TeachyTvLoadMapPalette(const struct MapData * mStruct, const u8 * palIndexArray)
{
    u8 i;
    const struct Tileset * ts;
    u16 * dest;

    for (i = 0; i < 16; i++)
    {
        if (palIndexArray[i] == 0xFF)
            break;
        if (palIndexArray[i] > 6)
            dest = (u16 *)mStruct->secondaryTileset->palettes + 0x10 * palIndexArray[i];
        else
            dest = (u16 *)mStruct->primaryTileset->palettes + 0x10 * palIndexArray[i];
        LoadPalette(dest, 0x10 * (15 - i), 0x20);
    }
}
