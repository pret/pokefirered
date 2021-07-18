#include "global.h"
#include "gflib.h"
#include "box_party_pokemon_dropdown.h"
#include "data.h"
#include "decompress.h"
#include "dynamic_placeholder_text_util.h"
#include "event_data.h"
#include "graphics.h"
#include "help_system.h"
#include "item.h"
#include "item_menu.h"
#include "mail_data.h"
#include "menu.h"
#include "naming_screen.h"
#include "new_menu_helpers.h"
#include "pc_screen_effect.h"
#include "pokemon_storage_system_internal.h"
#include "pokemon_summary_screen.h"
#include "quest_log.h"
#include "strings.h"
#include "task.h"
#include "text_window.h"
#include "constants/items.h"
#include "constants/songs.h"

EWRAM_DATA struct PokemonStorageSystemData *sStorage = NULL;
static EWRAM_DATA bool8 sInPartyMenu = 0;
static EWRAM_DATA u8 sCurrentBoxOption = 0;
static EWRAM_DATA u8 sDepositingBoxId = 0;
static EWRAM_DATA u8 sWhichToReshow = SCREEN_CHANGE_SUMMARY_SCREEN - 1;
static EWRAM_DATA u8 sLastUsedBox = 0;
static EWRAM_DATA u16 sMovingItemId = ITEM_NONE;

static void Task_InitPokeStorage(u8 taskId);
static void Task_ShowPokeStorage(u8 taskId);
static void Task_ReshowPokeStorage(u8 taskId);
static void Task_PokeStorageMain(u8 taskId);
static void Task_ShowPartyPokemon(u8 taskId);
static void Task_HidePartyPokemon(u8 taskId);
static void Task_OnSelectedMon(u8 taskId);
static void Task_MoveMon(u8 taskId);
static void Task_PlaceMon(u8 taskId);
static void Task_ShiftMon(u8 taskId);
static void Task_WithdrawMon(u8 taskId);
static void Task_DepositMenu(u8 taskId);
static void Task_ReleaseMon(u8 taskId);
static void Task_ShowMarkMenu(u8 taskId);
static void Task_TakeItemForMoving(u8 taskId);
static void Task_GiveMovingItemToMon(u8 taskId);
static void Task_ItemToBag(u8 taskId);
static void Task_SwitchSelectedItem(u8 taskId);
static void Task_ShowItemInfo(u8 taskId);
static void Task_HandleMovingMonFromParty(u8 taskId);
static void Task_PrintCantStoreMail(u8 taskId);
static void Task_HandleBoxOptions(u8 taskId);
static void Task_HandleWallpapers(u8 taskId);
static void Task_JumpBox(u8 taskId);
static void Task_NameBox(u8 taskId);
static void Task_ShowMonSummary(u8 taskId);
static void Task_GiveItemFromBag(u8 taskId);
static void Task_OnCloseBoxPressed(u8 taskId);
static void Task_OnBPressed(u8 taskId);
static void Task_ChangeScreen(u8 taskId);
static void GiveChosenBagItem(void);
static void FreePokeStorageData(void);
static void SetScrollingBackground(void);
static void ScrollBackground(void);
static void LoadPSSMenuGfx(void);
static bool8 InitPSSWindows(void);
static void LoadWaveformSpritePalette(void);
static void InitPalettesAndSprites(void);
static void CreateMarkingComboSprite(void);
static void CreateWaveformSprites(void);
static void RefreshDisplayMonData(void);
static void StartDisplayMonMosaicEffect(void);
static void SpriteCB_DisplayMonMosaic(struct Sprite * sprite);
static bool8 IsDisplayMosaicActive(void);
static void CreateDisplayMonSprite(void);
static void LoadDisplayMonGfx(u16 species, u32 pid);
static void PrintDisplayMonInfo(void);
static void UpdateWaveformAnimation(void);
static void InitSupplementalTilemaps(void);
static void SetUpHidePartyMenu(void);
static bool8 HidePartyMenu(void);
static void UpdateCloseBoxButtonTilemap(bool8 normal);
static void StartFlashingCloseBoxButton(void);
static void StopFlashingCloseBoxButton(void);
static void UpdateCloseBoxButtonFlash(void);
static void SetPartySlotTilemaps(void);
static void SetPartySlotTilemap(u8 pos, bool8 isPartyMon);
static void UpdatePartySlotColors(void);
static void SetUpDoShowPartyMenu(void);
static bool8 DoShowPartyMenu(void);
static void InitPokeStorageBg0(void);
static void PrintMessage(u8 id);
static void ShowYesNoWindow(s8 species);
static void ClearBottomWindow(void);
static void AddWallpaperSetsMenu(void);
static void AddWallpapersMenu(u8 wallpaperSet);
static void InitCursorItemIcon(void);
static void PokeStorage_AppendActionToQuestLogBuffer(u8 action);
static void UpdateBoxToSendMons(void);

static const u32 sScrollingBg_Gfx[] = INCBIN_U32("graphics/pokemon_storage/scrolling_bg.4bpp.lz");
static const u32 sScrollingBg_Tilemap[] = INCBIN_U32("graphics/pokemon_storage/scrolling_bg.bin.lz");
static const u16 sDisplayMenu_Pal[] = INCBIN_U16("graphics/pokemon_storage/display_menu.gbapal");
static const u32 sDisplayMenu_Tilemap[] = INCBIN_U32("graphics/pokemon_storage/display_menu.bin.lz");

enum {
    TILEMAPID_PKMN_DATA,
    TILEMAPID_PARTY_MENU,
    TILEMAPID_CLOSE_BUTTON,
};

static const u16 sPkmnData_Tilemap[] = {
    // On
    0x0101, 0x0102, 0x0103, 0x0104, 0x0105, 0x0106, 0x0107, 0x0108,
    0x0111, 0x0112, 0x0113, 0x0114, 0x0115, 0x0116, 0x0117, 0x0118,
    // Off
    0x2101, 0x2102, 0x2103, 0x2104, 0x2105, 0x2106, 0x2107, 0x2108,
    0x2111, 0x2112, 0x2113, 0x2114, 0x2115, 0x2116, 0x2117, 0x2118,
};

static const u16 sBg_Pal[] = INCBIN_U16("graphics/pokemon_storage/bg.gbapal");
static const u16 sBgMoveItems_Pal[] = INCBIN_U16("graphics/pokemon_storage/bg_move_items.gbapal");

static const u16 sCloseBoxButton_Tilemap[] = {
    // Blink 1
    0x014c, 0x014d, 0x014e, 0x014f, 0x0170, 0x0171, 0x0172, 0x0173, 0x0174,
    0x015c, 0x015d, 0x015e, 0x015f, 0x0180, 0x0181, 0x0182, 0x0183, 0x0184,
    // Blink 2
    0x0175, 0x0176, 0x0177, 0x0178, 0x0179, 0x017a, 0x017b, 0x017c, 0x017d,
    0x0185, 0x0186, 0x0187, 0x0188, 0x0189, 0x018a, 0x018b, 0x018c, 0x018d,
};

static const u16 sPartySlotFilled_Tilemap[] = {
    0x1140, 0x1141, 0x1141, 0x1142,
    0x1150, 0x1151, 0x1151, 0x1152,
    0x1160, 0x1161, 0x1161, 0x1162,
};

static const u16 sPartySlotEmpty_Tilemap[] = {
    0x1143, 0x1144, 0x1144, 0x1145,
    0x1153, 0x1154, 0x1154, 0x1155,
    0x1163, 0x1164, 0x1164, 0x1165,
};

static const u16 sWaveform_Pal[] = INCBIN_U16("graphics/pokemon_storage/waveform.gbapal");
static const u16 sWaveform_Gfx[] = INCBIN_U16("graphics/pokemon_storage/waveform.4bpp");
static const u16 sUnused_Pal[] = INCBIN_U16("graphics/pokemon_storage/unused.gbapal");
static const u16 sUnknown_Pal[] = INCBIN_U16("graphics/pokemon_storage/unknown.gbapal");

static const struct WindowTemplate sWindowTemplates[] = {
    [PSS_WIN_DISPLAY_MON_INFO] = {
        .bg = 1,
        .tilemapLeft = 0,
        .tilemapTop = 11,
        .width = 9,
        .height = 7,
        .paletteNum = 3,
        .baseBlock = 0x0c0
    }, 
    [PSS_WIN_MESSAGE_BOX] = {
        .bg = 0,
        .tilemapLeft = 11,
        .tilemapTop = 17,
        .width = 18,
        .height = 2,
        .paletteNum = 13,
        .baseBlock = 0x014
    }, 
    [PSS_WIN_ITEM_DESC] = {
        .bg = 0,
        .tilemapLeft = 0,
        .tilemapTop = 12,
        .width = 25,
        .height = 8,
        .paletteNum = 15,
        .baseBlock = 0x014
    }, DUMMY_WIN_TEMPLATE
};

static const struct BgTemplate sBgTemplates[] = {
    {
        .bg = 0,
        .charBaseIndex = 0,
        .mapBaseIndex = 29,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 0,
        .baseTile = 0x000
    }, {
        .bg = 1,
        .charBaseIndex = 1,
        .mapBaseIndex = 30,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 1,
        .baseTile = 0x100
    }, {
        .bg = 2,
        .charBaseIndex = 2,
        .mapBaseIndex = 27,
        .screenSize = 1,
        .paletteMode = 0,
        .priority = 2,
        .baseTile = 0x000
    }, {
        .bg = 3,
        .charBaseIndex = 3,
        .mapBaseIndex = 31,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 3,
        .baseTile = 0x000
    }
};

static const struct SpritePalette sWaveformSpritePalette = {
    sWaveform_Pal, TAG_PAL_WAVEFORM
};

static const struct SpriteSheet sWaveformSpriteSheet = {
    sWaveform_Gfx, 0x01c0, TAG_TILE_WAVEFORM
};

static const struct OamData sOamData_CursorMon;

static const struct SpriteTemplate sSpriteTemplate_CursorMon = {
    .tileTag = TAG_TILE_2,
    .paletteTag = TAG_PAL_DAC6,
    .oam = &sOamData_CursorMon,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy
};

static const struct StorageAction sPCStorageActionTexts[] = {
    [PC_TEXT_EXIT_BOX] = {gText_ExitFromBox, PC_TEXT_FMT_NORMAL},
    [PC_TEXT_WHAT_YOU_DO] = {gText_WhatDoYouWantToDo, PC_TEXT_FMT_NORMAL},
    [PC_TEXT_PICK_A_THEME] = {gText_PleasePickATheme, PC_TEXT_FMT_NORMAL},
    [PC_TEXT_PICK_A_WALLPAPER] = {gText_PickTheWallpaper, PC_TEXT_FMT_NORMAL},
    [PC_TEXT_IS_SELECTED] = {gText_PkmnIsSelected, PC_TEXT_FMT_MON_NAME_1},
    [PC_TEXT_JUMP_TO_WHICH_BOX] = {gText_JumpToWhichBox, PC_TEXT_FMT_NORMAL},
    [PC_TEXT_DEPOSIT_IN_WHICH_BOX] = {gText_DepositInWhichBox, PC_TEXT_FMT_NORMAL},
    [PC_TEXT_WAS_DEPOSITED] = {gText_PkmnWasDeposited, PC_TEXT_FMT_MON_NAME_1},
    [PC_TEXT_BOX_IS_FULL] = {gText_BoxIsFull2, PC_TEXT_FMT_NORMAL},
    [PC_TEXT_RELEASE_POKE] = {gText_ReleaseThisPokemon, PC_TEXT_FMT_NORMAL},
    [PC_TEXT_WAS_RELEASED] = {gText_PkmnWasReleased, PC_TEXT_FMT_MON_NAME_4},
    [PC_TEXT_BYE_BYE] = {gText_ByeByePkmn, PC_TEXT_FMT_MON_NAME_6},
    [PC_TEXT_MARK_POKE] = {gText_MarkYourPkmn, PC_TEXT_FMT_NORMAL},
    [PC_TEXT_LAST_POKE] = {gText_ThatsYourLastPkmn, PC_TEXT_FMT_NORMAL},
    [PC_TEXT_PARTY_FULL] = {gText_YourPartysFull, PC_TEXT_FMT_NORMAL},
    [PC_TEXT_HOLDING_POKE] = {gText_YoureHoldingAPkmn, PC_TEXT_FMT_NORMAL},
    [PC_TEXT_WHICH_ONE_WILL_TAKE] = {gText_WhichOneWillYouTake, PC_TEXT_FMT_NORMAL},
    [PC_TEXT_CANT_RELEASE_EGG] = {gText_YouCantReleaseAnEgg, PC_TEXT_FMT_NORMAL},
    [PC_TEXT_CONTINUE_BOX] = {gText_ContinueBoxOperations, PC_TEXT_FMT_NORMAL},
    [PC_TEXT_CAME_BACK] = {gText_PkmnCameBack, PC_TEXT_FMT_MON_NAME_1},
    [PC_TEXT_WORRIED] = {gText_WasItWorriedAboutYou, PC_TEXT_FMT_NORMAL},
    [PC_TEXT_SURPRISE] = {gText_FourEllipsesExclamation, PC_TEXT_FMT_NORMAL},
    [PC_TEXT_PLEASE_REMOVE_MAIL] = {gText_PleaseRemoveTheMail, PC_TEXT_FMT_NORMAL},
    [PC_TEXT_IS_SELECTED2] = {gText_PkmnIsSelected, PC_TEXT_FMT_ITEM_NAME},
    [PC_TEXT_GIVE_TO_MON] = {gText_GiveToAPkmn, PC_TEXT_FMT_NORMAL},
    [PC_TEXT_PLACED_IN_BAG] = {gText_PlacedItemInBag, PC_TEXT_FMT_ITEM_NAME},
    [PC_TEXT_BAG_FULL] = {gText_BagIsFull2, PC_TEXT_FMT_NORMAL},
    [PC_TEXT_PUT_IN_BAG] = {gText_PutItemInBag, PC_TEXT_FMT_NORMAL},
    [PC_TEXT_ITEM_IS_HELD] = {gText_ItemIsNowHeld, PC_TEXT_FMT_ITEM_NAME},
    [PC_TEXT_CHANGED_TO_ITEM] = {gText_ChangedToNewItem, PC_TEXT_FMT_ITEM_NAME},
    [PC_TEXT_CANT_STORE_MAIL] = {gText_MailCantBeStored, PC_TEXT_FMT_NORMAL},
};

// Yes/No menu
static const struct WindowTemplate sYesNoWindowTemplate = {
    .bg = 0,
    .tilemapLeft = 24,
    .tilemapTop = 11,
    .width = 5,
    .height = 4,
    .paletteNum = 15,
    .baseBlock = 0x05c
};

static const struct OamData sOamData_CursorMon = {
    .y = 0,
    .affineMode = ST_OAM_AFFINE_OFF,
    .objMode = ST_OAM_OBJ_NORMAL,
    .mosaic = FALSE,
    .bpp = ST_OAM_4BPP,
    .shape = SPRITE_SHAPE(64x64),
    .x = 0,
    .matrixNum = 0,
    .size = SPRITE_SIZE(64x64),
    .tileNum = 0x000,
    .priority = 0,
    .paletteNum = 0
};

// Waveform

static const struct OamData sWaveformSpriteOamData = {
    .y = 0,
    .affineMode = ST_OAM_AFFINE_OFF,
    .objMode = ST_OAM_OBJ_NORMAL,
    .mosaic = FALSE,
    .bpp = ST_OAM_4BPP,
    .shape = SPRITE_SHAPE(16x8),
    .x = 0,
    .matrixNum = 0,
    .size = SPRITE_SIZE(16x8),
    .tileNum = 0x000,
    .priority = 0,
    .paletteNum = 0
};

static const union AnimCmd sWaveformSpriteAnim0[] = {
    ANIMCMD_FRAME(0, 5),
    ANIMCMD_END
};

static const union AnimCmd sWaveformSpriteAnim1[] = {
    ANIMCMD_FRAME(2, 8),
    ANIMCMD_FRAME(4, 8),
    ANIMCMD_FRAME(6, 8),
    ANIMCMD_JUMP(0)
};

static const union AnimCmd sWaveformSpriteAnim2[] = {
    ANIMCMD_FRAME(8, 5),
    ANIMCMD_END
};

static const union AnimCmd sWaveformSpriteAnim3[] = {
    ANIMCMD_FRAME(10, 8),
    ANIMCMD_FRAME(4, 8),
    ANIMCMD_FRAME(12, 8),
    ANIMCMD_JUMP(0)
};

static const union AnimCmd *const sWaveformSpriteAnimTable[] = {
    sWaveformSpriteAnim0,
    sWaveformSpriteAnim1,
    sWaveformSpriteAnim2,
    sWaveformSpriteAnim3
};

static const struct SpriteTemplate sSpriteTemplate_Waveform = {
    .tileTag = TAG_TILE_WAVEFORM,
    .paletteTag = TAG_PAL_WAVEFORM,
    .oam = &sWaveformSpriteOamData,
    .anims = sWaveformSpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy,
};

enum {
    PSS_QL_SHIFT_MON,
    PSS_QL_PLACE_MON,
    PSS_QL_DEPOSIT,
    PSS_QL_MULTIMOVE,
};

//------------------------------------------------------------------------------
//  SECTION: Main tasks
//
//  Below are the main task callbacks that handle the primary actions the
//  player can take in the PC. The most 'important' of these tasks is the
//  primary one, Task_PokeStorageMain. Also included are some basic
//  initialization functions.
//------------------------------------------------------------------------------

static void VBlankCB_PokeStorage(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    UnkUtil_Run();
    TransferPlttBuffer();
    SetGpuReg(REG_OFFSET_BG2HOFS, sStorage->bg2_X);
}

static void CB2_PokeStorage(void)
{
    RunTasks();
    DoScheduledBgTilemapCopiesToVram();
    ScrollBackground();
    UpdateCloseBoxButtonFlash();
    AnimateSprites();
    BuildOamBuffer();
}

void CB2_EnterPokeStorage(u8 boxOption)
{
    ResetTasks();
    sCurrentBoxOption = boxOption;
    sStorage = Alloc(sizeof(struct PokemonStorageSystemData));
    if (sStorage == NULL)
        SetMainCallback2(CB2_ExitPokeStorage);
    else
    {
        sStorage->boxOption = boxOption;
        sStorage->isReopening = FALSE;
        sMovingItemId = 0;
        sStorage->state = 0;
        sStorage->taskId = CreateTask(Task_InitPokeStorage, 3);
        SetHelpContext(HELPCONTEXT_BILLS_PC);
        sLastUsedBox = StorageGetCurrentBox();
        SetMainCallback2(CB2_PokeStorage);
    }
}

void CB2_ReturnToPokeStorage(void)
{
    ResetTasks();
    sStorage = Alloc(sizeof(struct PokemonStorageSystemData));
    if (sStorage == NULL)
        SetMainCallback2(CB2_ExitPokeStorage);
    else
    {
        sStorage->boxOption = sCurrentBoxOption;
        sStorage->isReopening = TRUE;
        sStorage->state = 0;
        sStorage->taskId = CreateTask(Task_InitPokeStorage, 3);
        SetHelpContext(HELPCONTEXT_BILLS_PC);
        SetMainCallback2(CB2_PokeStorage);
    }
}

static void ResetAllBgCoords(void)
{
    SetGpuReg(REG_OFFSET_BG0HOFS, 0);
    SetGpuReg(REG_OFFSET_BG0VOFS, 0);
    SetGpuReg(REG_OFFSET_BG1HOFS, 0);
    SetGpuReg(REG_OFFSET_BG1VOFS, 0);
    SetGpuReg(REG_OFFSET_BG2HOFS, 0);
    SetGpuReg(REG_OFFSET_BG2VOFS, 0);
    SetGpuReg(REG_OFFSET_BG3HOFS, 0);
    SetGpuReg(REG_OFFSET_BG3VOFS, 0);
}

static void ResetForPokeStorage(void)
{
    ResetPaletteFade();
    ResetSpriteData();
    FreeSpriteTileRanges();
    FreeAllSpritePalettes();
    ClearDma3Requests();
    gReservedSpriteTileCount = 0x280;
    PSS_InitCopyAndFillManager(&sStorage->unkUtil, sStorage->unkUtilData, NELEMS(sStorage->unkUtilData));
    gKeyRepeatStartDelay = 20;
    ClearScheduledBgCopiesToVram();
    TilemapUtil_Init(3);
    TilemapUtil_SetMap(TILEMAPID_PKMN_DATA, 1, sPkmnData_Tilemap, 8, 4);
    TilemapUtil_SetPos(TILEMAPID_PKMN_DATA, 1, 0);
    sStorage->closeBoxFlashing = FALSE;
}

static void InitStartingPosData(void)
{
    ClearSavedCursorPos();
    sInPartyMenu = sStorage->boxOption == BOX_OPTION_DEPOSIT;
    sDepositingBoxId = 0;
}

static void SetMonIconTransparency(void)
{
    if (sStorage->boxOption == BOX_OPTION_MOVE_ITEMS)
    {
        SetGpuReg(REG_OFFSET_BLDCNT, BLDCNT_TGT2_ALL);
        SetGpuReg(REG_OFFSET_BLDALPHA, BLDALPHA_BLEND(7, 11));
    }
    SetGpuReg(REG_OFFSET_DISPCNT, DISPCNT_OBJ_ON | DISPCNT_BG_ALL_ON | DISPCNT_OBJ_1D_MAP);
}

static void SetPokeStorageTask(TaskFunc newFunc)
{
    gTasks[sStorage->taskId].func = newFunc;
    sStorage->state = 0;
}

static void Task_InitPokeStorage(u8 taskId)
{
    switch (sStorage->state)
    {
    case 0:
        SetVBlankCallback(NULL);
        SetGpuReg(REG_OFFSET_DISPCNT, 0);
        ResetForPokeStorage();
        if (sStorage->isReopening)
        {
            switch (sWhichToReshow)
            {
            case SCREEN_CHANGE_NAME_BOX - 1:
                LoadSavedMovingMon();
                break;
            case SCREEN_CHANGE_SUMMARY_SCREEN - 1:
                SetSelectionAfterSummaryScreen();
                break;
            case SCREEN_CHANGE_ITEM_FROM_BAG - 1:
                GiveChosenBagItem();
                break;
            }
        }
        LoadPSSMenuGfx();
        LoadWaveformSpritePalette();
        break;
    case 1:
        if (!InitPSSWindows())
        {
            SetPokeStorageTask(Task_ChangeScreen);
            return;
        }
        break;
    case 2:
        PutWindowTilemap(PSS_WIN_DISPLAY_MON_INFO);
        ClearWindowTilemap(PSS_WIN_MESSAGE_BOX);
        CpuFill32(0, (void *)VRAM, 0x200);
        TextWindow_SetUserSelectedFrame(PSS_WIN_MESSAGE_BOX, 0xB, 0xE0);
        break;
    case 3:
        ResetAllBgCoords();
        if (!sStorage->isReopening)
            InitStartingPosData();
        break;
    case 4:
        InitMonIconFields();
        if (!sStorage->isReopening)
            InitCursor();
        else
            InitCursorOnReopen();
        break;
    case 5:
        if (!MultiMove_Init())
        {
            SetPokeStorageTask(Task_ChangeScreen);
            return;
        }
        else
        {
            SetScrollingBackground();
            InitPokeStorageBg0();
        }
        break;
    case 6:
        InitPalettesAndSprites();
        break;
    case 7:
        InitSupplementalTilemaps();
        break;
    case 8:
        CreateInitBoxTask(StorageGetCurrentBox());
        break;
    case 9:
        if (IsInitBoxActive())
            return;

        if (sStorage->boxOption != BOX_OPTION_MOVE_ITEMS)
        {
            sStorage->markMenu.baseTileTag = TAG_TILE_D;
            sStorage->markMenu.basePaletteTag = TAG_PAL_DACE;
            SetMonMarkingsMenuPointer(&sStorage->markMenu);
            LoadMonMarkingsFrameGfx();
        }
        else
        {
            CreateItemIconSprites();
            InitCursorItemIcon();
        }
        break;
    case 10:
        SetMonIconTransparency();
        if (!sStorage->isReopening)
        {
            BlendPalettes(0xFFFFFFFF, 0x10, RGB_BLACK);
            SetPokeStorageTask(Task_ShowPokeStorage);
        }
        else
        {
            BlendPalettes(0xFFFFFFFF, 0x10, RGB_BLACK);
            SetPokeStorageTask(Task_ReshowPokeStorage);
        }
        SetVBlankCallback(VBlankCB_PokeStorage);
        return;
    default:
        return;
    }

    sStorage->state++;
}

static void Task_ShowPokeStorage(u8 taskId)
{
    switch (sStorage->state)
    {
    case 0:
        PlaySE(SE_PC_LOGIN);
        BeginPCScreenEffect_TurnOn(20, 0, 1);
        sStorage->state++;
        break;
    case 1:
        if (!IsPCScreenEffectRunning_TurnOn())
            SetPokeStorageTask(Task_PokeStorageMain);
        break;
    }
}

static void Task_ReshowPokeStorage(u8 taskId)
{
    switch (sStorage->state)
    {
    case 0:
        BeginNormalPaletteFade(0xFFFFFFFF, -1, 0x10, 0, RGB_BLACK);
        sStorage->state++;
        break;
    case 1:
        if (!UpdatePaletteFade())
        {
            SetPokeStorageTask(Task_PokeStorageMain);
        }
        break;
    }
}

// States for the outer switch in Task_PokeStorageMain
enum {
    MSTATE_HANDLE_INPUT,
    MSTATE_MOVE_CURSOR,
    MSTATE_SCROLL_BOX,
    MSTATE_WAIT_MSG,
    MSTATE_ERROR_LAST_PARTY_MON,
    MSTATE_ERROR_HAS_MAIL,
    MSTATE_WAIT_ERROR_MSG,
    MSTATE_MULTIMOVE_RUN,
    MSTATE_MULTIMOVE_RUN_CANCEL,
    MSTATE_MULTIMOVE_RUN_MOVED,
    MSTATE_SCROLL_BOX_ITEM,
    MSTATE_WAIT_ITEM_ANIM,
};

static void Task_PokeStorageMain(u8 taskId)
{
    switch (sStorage->state)
    {
    case MSTATE_HANDLE_INPUT:
        switch (HandleInput())
        {
        case INPUT_MOVE_CURSOR:
            PlaySE(SE_SELECT);
            sStorage->state = MSTATE_MOVE_CURSOR;
            break;
        case INPUT_SHOW_PARTY:
            if (sStorage->boxOption != BOX_OPTION_MOVE_MONS && sStorage->boxOption != BOX_OPTION_MOVE_ITEMS)
            {
                PrintMessage(PC_TEXT_WHICH_ONE_WILL_TAKE);
                sStorage->state = MSTATE_WAIT_MSG;
            }
            else
            {
                ClearSavedCursorPos();
                SetPokeStorageTask(Task_ShowPartyPokemon);
            }
            break;
        case INPUT_HIDE_PARTY:
            if (sStorage->boxOption == BOX_OPTION_MOVE_MONS)
            {
                if (IsMonBeingMoved() && ItemIsMail(sStorage->displayMonItemId))
                    sStorage->state = MSTATE_ERROR_HAS_MAIL;
                else
                    SetPokeStorageTask(Task_HidePartyPokemon);
            }
            else if (sStorage->boxOption == BOX_OPTION_MOVE_ITEMS)
            {
                SetPokeStorageTask(Task_HidePartyPokemon);
            }
            break;
        case INPUT_CLOSE_BOX:
            SetPokeStorageTask(Task_OnCloseBoxPressed);
            break;
        case INPUT_PRESSED_B:
            SetPokeStorageTask(Task_OnBPressed);
            break;
        case INPUT_BOX_OPTIONS:
            PlaySE(SE_SELECT);
            SetPokeStorageTask(Task_HandleBoxOptions);
            break;
        case INPUT_IN_MENU:
            SetPokeStorageTask(Task_OnSelectedMon);
            break;
        case INPUT_SCROLL_RIGHT:
            PlaySE(SE_SELECT);
            sStorage->newCurrBoxId = StorageGetCurrentBox() + 1;
            if (sStorage->newCurrBoxId >= TOTAL_BOXES_COUNT)
                sStorage->newCurrBoxId = 0;
            if (sStorage->boxOption != BOX_OPTION_MOVE_ITEMS)
            {
                SetUpScrollToBox(sStorage->newCurrBoxId);
                sStorage->state = MSTATE_SCROLL_BOX;
            }
            else
            {
                TryHideItemAtCursor();
                sStorage->state = MSTATE_SCROLL_BOX_ITEM;
            }
            break;
        case INPUT_SCROLL_LEFT:
            PlaySE(SE_SELECT);
            sStorage->newCurrBoxId = StorageGetCurrentBox() - 1;
            if (sStorage->newCurrBoxId < 0)
                sStorage->newCurrBoxId = TOTAL_BOXES_COUNT - 1;
            if (sStorage->boxOption != BOX_OPTION_MOVE_ITEMS)
            {
                SetUpScrollToBox(sStorage->newCurrBoxId);
                sStorage->state = MSTATE_SCROLL_BOX;
            }
            else
            {
                TryHideItemAtCursor();
                sStorage->state = MSTATE_SCROLL_BOX_ITEM;
            }
            break;
        case INPUT_DEPOSIT:
            if (!CanMovePartyMon())
            {
                if (ItemIsMail(sStorage->displayMonItemId))
                {
                    sStorage->state = MSTATE_ERROR_HAS_MAIL;
                }
                else
                {
                    PlaySE(SE_SELECT);
                    SetPokeStorageTask(Task_DepositMenu);
                }
            }
            else
            {
                sStorage->state = MSTATE_ERROR_LAST_PARTY_MON;
            }
            break;
        case INPUT_MOVE_MON:
            if (CanMovePartyMon())
            {
                sStorage->state = MSTATE_ERROR_LAST_PARTY_MON;
            }
            else
            {
                PlaySE(SE_SELECT);
                SetPokeStorageTask(Task_MoveMon);
            }
            break;
        case INPUT_SHIFT_MON:
            if (!CanShiftMon())
            {
                sStorage->state = MSTATE_ERROR_LAST_PARTY_MON;
            }
            else
            {
                PlaySE(SE_SELECT);
                SetPokeStorageTask(Task_ShiftMon);
            }
            break;
        case INPUT_WITHDRAW:
            PlaySE(SE_SELECT);
            SetPokeStorageTask(Task_WithdrawMon);
            break;
        case INPUT_PLACE_MON:
            PlaySE(SE_SELECT);
            SetPokeStorageTask(Task_PlaceMon);
            break;
        case INPUT_TAKE_ITEM:
            PlaySE(SE_SELECT);
            SetPokeStorageTask(Task_TakeItemForMoving);
            break;
        case INPUT_GIVE_ITEM:
            PlaySE(SE_SELECT);
            SetPokeStorageTask(Task_GiveMovingItemToMon);
            break;
        case INPUT_SWITCH_ITEMS:
            PlaySE(SE_SELECT);
            SetPokeStorageTask(Task_SwitchSelectedItem);
            break;
        case INPUT_MULTIMOVE_START:
            PlaySE(SE_SELECT);
            MultiMove_SetFunction(MULTIMOVE_START);
            sStorage->state = MSTATE_MULTIMOVE_RUN;
            break;
        case INPUT_MULTIMOVE_SINGLE:
            MultiMove_SetFunction(MULTIMOVE_CANCEL);
            sStorage->state = MSTATE_MULTIMOVE_RUN_CANCEL;
            break;
        case INPUT_MULTIMOVE_CHANGE_SELECTION:
            PlaySE(SE_SELECT);
            MultiMove_SetFunction(MULTIMOVE_CHANGE_SELECTION);
            sStorage->state = MSTATE_MULTIMOVE_RUN_MOVED;
            break;
        case INPUT_MULTIMOVE_GRAB_SELECTION:
            MultiMove_SetFunction(MULTIMOVE_GRAB_SELECTION);
            sStorage->state = MSTATE_MULTIMOVE_RUN;
            break;
        case INPUT_MULTIMOVE_MOVE_MONS:
            PlaySE(SE_SELECT);
            MultiMove_SetFunction(MULTIMOVE_MOVE_MONS);
            sStorage->state = MSTATE_MULTIMOVE_RUN_MOVED;
            break;
        case INPUT_MULTIMOVE_PLACE_MONS:
            PlaySE(SE_SELECT);
            PokeStorage_AppendActionToQuestLogBuffer(PSS_QL_MULTIMOVE);
            MultiMove_SetFunction(MULTIMOVE_PLACE_MONS);
            sStorage->state = MSTATE_MULTIMOVE_RUN;
            break;
        case INPUT_MULTIMOVE_UNABLE:
            // When selecting/moving multiple Pokémon the
            // cursor may not wrap around the edges.
            PlaySE(SE_FAILURE);
            break;
        }
        break;
    case MSTATE_MOVE_CURSOR:
        if (!UpdateCursorPos())
        {
            if (IsCursorOnCloseBox())
                StartFlashingCloseBoxButton();
            else
                StopFlashingCloseBoxButton();

            if (sStorage->setMosaic)
                StartDisplayMonMosaicEffect();
            sStorage->state = MSTATE_HANDLE_INPUT;
        }
        break;
    case MSTATE_SCROLL_BOX:
        if (!ScrollToBox())
        {
            SetCurrentBox(sStorage->newCurrBoxId);
            if (!sInPartyMenu && !IsMonBeingMoved())
            {
                RefreshDisplayMon();
                StartDisplayMonMosaicEffect();
            }

            if (sStorage->boxOption == BOX_OPTION_MOVE_ITEMS)
            {
                TryShowItemAtCursor();
                sStorage->state = MSTATE_WAIT_ITEM_ANIM;
            }
            else
            {
                sStorage->state = MSTATE_HANDLE_INPUT;
            }
        }
        break;
    case MSTATE_WAIT_MSG:
        if (JOY_NEW(A_BUTTON | B_BUTTON | DPAD_ANY))
        {
            ClearBottomWindow();
            sStorage->state = MSTATE_HANDLE_INPUT;
        }
        break;
    case MSTATE_ERROR_LAST_PARTY_MON:
        PlaySE(SE_FAILURE);
        PrintMessage(PC_TEXT_LAST_POKE);
        sStorage->state = MSTATE_WAIT_ERROR_MSG;
        break;
    case MSTATE_ERROR_HAS_MAIL:
        PlaySE(SE_FAILURE);
        PrintMessage(PC_TEXT_PLEASE_REMOVE_MAIL);
        sStorage->state = MSTATE_WAIT_ERROR_MSG;
        break;
    case MSTATE_WAIT_ERROR_MSG:
        if (JOY_NEW(A_BUTTON | B_BUTTON | DPAD_ANY))
        {
            ClearBottomWindow();
            SetPokeStorageTask(Task_PokeStorageMain);
        }
        break;
    case MSTATE_MULTIMOVE_RUN:
        if (!MultiMove_RunFunction())
            sStorage->state = MSTATE_HANDLE_INPUT;
        break;
    case MSTATE_MULTIMOVE_RUN_CANCEL:
        // Began a multiple Pokémon selection but
        // ended up selecting a single Pokémon.
        // Wait for multi move to cancel, then
        // do a normal move.
        if (!MultiMove_RunFunction())
            SetPokeStorageTask(Task_MoveMon);
        break;
    case MSTATE_MULTIMOVE_RUN_MOVED:
        if (!MultiMove_RunFunction())
        {
            if (sStorage->setMosaic)
                StartDisplayMonMosaicEffect();
            sStorage->state = MSTATE_HANDLE_INPUT;
        }
        break;
    case MSTATE_SCROLL_BOX_ITEM:
        if (!IsItemIconAnimActive())
        {
            SetUpScrollToBox(sStorage->newCurrBoxId);
            sStorage->state = MSTATE_SCROLL_BOX;
        }
        break;
    case MSTATE_WAIT_ITEM_ANIM:
        if (!IsItemIconAnimActive())
            sStorage->state = MSTATE_HANDLE_INPUT;
        break;
    }
}

static void Task_ShowPartyPokemon(u8 taskId)
{
    switch (sStorage->state)
    {
    case 0:
        SetUpDoShowPartyMenu();
        sStorage->state++;
        break;
    case 1:
        if (!DoShowPartyMenu())
            SetPokeStorageTask(Task_PokeStorageMain);
        break;
    }
}

static void Task_HidePartyPokemon(u8 taskId)
{
    switch (sStorage->state)
    {
    case 0:
        PlaySE(SE_SELECT);
        SetUpHidePartyMenu();
        sStorage->state++;
        break;
    case 1:
        if (!HidePartyMenu())
        {
            SetCursorBoxPosition(GetSavedCursorPos());
            sStorage->state++;
        }
        break;
    case 2:
        if (!UpdateCursorPos())
        {
            if (sStorage->setMosaic)
                StartDisplayMonMosaicEffect();
            SetPokeStorageTask(Task_PokeStorageMain);
        }
        break;
    }
}

static void Task_OnSelectedMon(u8 taskId)
{
    switch (sStorage->state)
    {
    case 0:
        if (!IsDisplayMosaicActive())
        {
            PlaySE(SE_SELECT);
            if (sStorage->boxOption != BOX_OPTION_MOVE_ITEMS)
                PrintMessage(PC_TEXT_IS_SELECTED);
            else if (IsActiveItemMoving() || sStorage->displayMonItemId != 0)
                PrintMessage(PC_TEXT_IS_SELECTED2);
            else
                PrintMessage(PC_TEXT_GIVE_TO_MON);

            AddMenu();
            sStorage->state = 1;
        }
        break;
    case 1: // debug?
        if (!IsMenuLoading())
            sStorage->state = 2;
        break;
    case 2:
        switch (PokeStorage_HandleMenuInput())
        {
        case MENU_B_PRESSED:
        case MENU_CANCEL:
            ClearBottomWindow();
            SetPokeStorageTask(Task_PokeStorageMain);
            break;
        case MENU_MOVE:
            if (CanMovePartyMon())
            {
                sStorage->state = 3;
            }
            else
            {
                PlaySE(SE_SELECT);
                ClearBottomWindow();
                SetPokeStorageTask(Task_MoveMon);
            }
            break;
        case MENU_PLACE:
            PlaySE(SE_SELECT);
            ClearBottomWindow();
            SetPokeStorageTask(Task_PlaceMon);
            break;
        case MENU_SHIFT:
            if (!CanShiftMon())
            {
                sStorage->state = 3;
            }
            else
            {
                PlaySE(SE_SELECT);
                ClearBottomWindow();
                SetPokeStorageTask(Task_ShiftMon);
            }
            break;
        case MENU_WITHDRAW:
            PlaySE(SE_SELECT);
            ClearBottomWindow();
            SetPokeStorageTask(Task_WithdrawMon);
            break;
        case MENU_STORE:
            if (CanMovePartyMon())
            {
                sStorage->state = 3;
            }
            else if (ItemIsMail(sStorage->displayMonItemId))
            {
                sStorage->state = 4;
            }
            else
            {
                PlaySE(SE_SELECT);
                ClearBottomWindow();
                SetPokeStorageTask(Task_DepositMenu);
            }
            break;
        case MENU_RELEASE:
            if (CanMovePartyMon())
            {
                sStorage->state = 3;
            }
            else if (sStorage->cursorMonIsEgg)
            {
                sStorage->state = 5; // Cannot release an Egg.
            }
            else if (ItemIsMail(sStorage->displayMonItemId))
            {
                sStorage->state = 4;
            }
            else
            {
                PlaySE(SE_SELECT);
                SetPokeStorageTask(Task_ReleaseMon);
            }
            break;
        case MENU_SUMMARY:
            PlaySE(SE_SELECT);
            SetPokeStorageTask(Task_ShowMonSummary);
            break;
        case MENU_MARK:
            PlaySE(SE_SELECT);
            SetPokeStorageTask(Task_ShowMarkMenu);
            break;
        case MENU_TAKE:
            PlaySE(SE_SELECT);
            SetPokeStorageTask(Task_TakeItemForMoving);
            break;
        case MENU_GIVE:
            PlaySE(SE_SELECT);
            SetPokeStorageTask(Task_GiveMovingItemToMon);
            break;
        case MENU_BAG:
            SetPokeStorageTask(Task_ItemToBag);
            break;
        case MENU_SWITCH:
            SetPokeStorageTask(Task_SwitchSelectedItem);
            break;
        case MENU_GIVE_2:
            SetPokeStorageTask(Task_GiveItemFromBag);
            break;
        case MENU_INFO:
            SetPokeStorageTask(Task_ShowItemInfo);
            break;
        }
        break;
    case 3:
        PlaySE(SE_FAILURE);
        PrintMessage(PC_TEXT_LAST_POKE);
        sStorage->state = 6;
        break;
    case 5:
        PlaySE(SE_FAILURE);
        PrintMessage(PC_TEXT_CANT_RELEASE_EGG);
        sStorage->state = 6;
        break;
    case 4:
        PlaySE(SE_FAILURE);
        PrintMessage(PC_TEXT_PLEASE_REMOVE_MAIL);
        sStorage->state = 6;
        break;
    case 6:
        if (JOY_NEW(A_BUTTON | B_BUTTON | DPAD_ANY))
        {
            ClearBottomWindow();
            SetPokeStorageTask(Task_PokeStorageMain);
        }
        break;
    }
}

static void Task_MoveMon(u8 taskId)
{
    switch (sStorage->state)
    {
    case 0:
        InitMonPlaceChange(CHANGE_GRAB);
        sStorage->state++;
        break;
    case 1:
        if (!DoMonPlaceChange())
        {
            if (sInPartyMenu)
                SetPokeStorageTask(Task_HandleMovingMonFromParty);
            else
                SetPokeStorageTask(Task_PokeStorageMain);
        }
        break;
    }
}

static void Task_PlaceMon(u8 taskId)
{
    switch (sStorage->state)
    {
    case 0:
        PokeStorage_AppendActionToQuestLogBuffer(PSS_QL_PLACE_MON);
        InitMonPlaceChange(CHANGE_PLACE);
        sStorage->state++;
        break;
    case 1:
        if (!DoMonPlaceChange())
        {
            if (sInPartyMenu)
                SetPokeStorageTask(Task_HandleMovingMonFromParty);
            else
                SetPokeStorageTask(Task_PokeStorageMain);
        }
        break;
    }
}

static void Task_ShiftMon(u8 taskId)
{
    switch (sStorage->state)
    {
    case 0:
        PokeStorage_AppendActionToQuestLogBuffer(PSS_QL_SHIFT_MON);
        InitMonPlaceChange(CHANGE_SHIFT);
        sStorage->state++;
        break;
    case 1:
        if (!DoMonPlaceChange())
        {
            StartDisplayMonMosaicEffect();
            SetPokeStorageTask(Task_PokeStorageMain);
        }
        break;
    }
}

static void Task_WithdrawMon(u8 taskId)
{
    switch (sStorage->state)
    {
    case 0:
        if (CalculatePlayerPartyCount() == PARTY_SIZE)
        {
            PrintMessage(PC_TEXT_PARTY_FULL);
            sStorage->state = 1;
        }
        else
        {
            SaveCursorPos();
            InitMonPlaceChange(CHANGE_GRAB);
            sStorage->state = 2;
        }
        break;
    case 1:
        if (JOY_NEW(A_BUTTON | B_BUTTON | DPAD_ANY))
        {
            ClearBottomWindow();
            SetPokeStorageTask(Task_PokeStorageMain);
        }
        break;
    case 2:
        if (!DoMonPlaceChange())
        {
            SetMovingMonPriority(1);
            SetUpDoShowPartyMenu();
            sStorage->state++;
        }
        break;
    case 3:
        if (!DoShowPartyMenu())
        {
            PokeStorage_AppendActionToQuestLogBuffer(PSS_QL_PLACE_MON);
            InitMonPlaceChange(CHANGE_PLACE);
            sStorage->state++;
        }
        break;
    case 4:
        if (!DoMonPlaceChange())
        {
            UpdatePartySlotColors();
            sStorage->state++;
        }
        break;
    case 5:
        SetPokeStorageTask(Task_HidePartyPokemon);
        break;
    }
}

static void Task_DepositMenu(u8 taskId)
{
    u8 boxId;

    switch (sStorage->state)
    {
    case 0:
        PrintMessage(PC_TEXT_DEPOSIT_IN_WHICH_BOX);
        LoadChooseBoxMenuGfx(&sStorage->chooseBoxMenu, TAG_TILE_A, TAG_PAL_HAND_CURSOR, 3, FALSE);
        CreateChooseBoxMenuSprites(sDepositingBoxId);
        sStorage->state++;
        break;
    case 1:
        boxId = HandleBoxChooseSelectionInput();
        if (boxId == BOXID_NONE_CHOSEN)
        {
            // no box chosen yet
        }
        else if (boxId == BOXID_CANCELED)
        {
            ClearBottomWindow();
            DestroyChooseBoxMenuSprites();
            FreeBoxSelectionPopupSpriteGfx();
            SetPokeStorageTask(Task_PokeStorageMain);
        }
        else
        {
            if (TryStorePartyMonInBox(boxId))
            {
                sDepositingBoxId = boxId;
                PokeStorage_AppendActionToQuestLogBuffer(PSS_QL_DEPOSIT);
                ClearBottomWindow();
                DestroyChooseBoxMenuSprites();
                FreeBoxSelectionPopupSpriteGfx();
                sStorage->state = 2;
            }
            else
            {
                PrintMessage(PC_TEXT_BOX_IS_FULL);
                sStorage->state = 4;
            }
        }
        break;
    case 2:
        CompactPartySlots();
        CompactPartySprites();
        sStorage->state++;
        break;
    case 3:
        if (!GetNumPartySpritesCompacting())
        {
            ResetSelectionAfterDeposit();
            StartDisplayMonMosaicEffect();
            UpdatePartySlotColors();
            SetPokeStorageTask(Task_PokeStorageMain);
        }
        break;
    case 4:
        if (JOY_NEW(A_BUTTON | B_BUTTON | DPAD_ANY))
        {
            PrintMessage(PC_TEXT_DEPOSIT_IN_WHICH_BOX);
            sStorage->state = 1;
        }
        break;
    }
}

static void Task_ReleaseMon(u8 taskId)
{
    switch (sStorage->state)
    {
    case 0:
        PrintMessage(PC_TEXT_RELEASE_POKE);
        ShowYesNoWindow(1);
        sStorage->state++;
        // fallthrough
    case 1:
        switch (Menu_ProcessInputNoWrapClearOnChoose())
        {
        case MENU_B_PRESSED:
        case  1: // No
            ClearBottomWindow();
            SetPokeStorageTask(Task_PokeStorageMain);
            break;
        case  0: // Yes
            ClearBottomWindow();
            InitCanReleaseMonVars();
            InitReleaseMon();
            sStorage->state++;
            break;
        }
        break;
    case 2:
        RunCanReleaseMon();
        if (!TryHideReleaseMon())
        {
            while (1)
            {
                s8 r0 = RunCanReleaseMon();
                if (r0 == 1)
                {
                    sStorage->state++;
                    break;
                }
                else if (r0 == 0)
                {
                    sStorage->state = 8; // Can't release the mon.
                    break;
                }
            }
        }
        break;
    case 3:
        ReleaseMon();
        RefreshDisplayMonData();
        PrintMessage(PC_TEXT_WAS_RELEASED);
        sStorage->state++;
        break;
    case 4:
        if (JOY_NEW(A_BUTTON | B_BUTTON | DPAD_ANY))
        {
            PrintMessage(PC_TEXT_BYE_BYE);
            sStorage->state++;
        }
        break;
    case 5:
        if (JOY_NEW(A_BUTTON | B_BUTTON | DPAD_ANY))
        {
            ClearBottomWindow();
            if (sInPartyMenu)
            {
                CompactPartySlots();
                CompactPartySprites();
                sStorage->state++;
            }
            else
            {
                sStorage->state = 7;
            }
        }
        break;
    case 6:
        if (!GetNumPartySpritesCompacting())
        {
            RefreshDisplayMon();
            StartDisplayMonMosaicEffect();
            UpdatePartySlotColors();
            sStorage->state++;
        }
        break;
    case 7:
        SetPokeStorageTask(Task_PokeStorageMain);
        break;
    case 8:
        PrintMessage(PC_TEXT_WAS_RELEASED);
        sStorage->state++;
        break;
    case 9:
        if (JOY_NEW(A_BUTTON | B_BUTTON | DPAD_ANY))
        {
            PrintMessage(PC_TEXT_SURPRISE);
            sStorage->state++;
        }
        break;
    case 10:
        if (JOY_NEW(A_BUTTON | B_BUTTON | DPAD_ANY))
        {
            ClearBottomWindow();
            ReshowReleaseMon();
            sStorage->state++;
        }
        break;
    case 11:
        if (!ResetReleaseMonSpritePtr())
        {
            TrySetCursorFistAnim();
            PrintMessage(PC_TEXT_CAME_BACK);
            sStorage->state++;
        }
        break;
    case 12:
        if (JOY_NEW(A_BUTTON | B_BUTTON | DPAD_ANY))
        {
            PrintMessage(PC_TEXT_WORRIED);
            sStorage->state++;
        }
        break;
    case 13:
        if (JOY_NEW(A_BUTTON | B_BUTTON | DPAD_ANY))
        {
            ClearBottomWindow();
            SetPokeStorageTask(Task_PokeStorageMain);
        }
        break;
    }
}

static void Task_ShowMarkMenu(u8 taskId)
{
    switch (sStorage->state)
    {
    case 0:
        PrintMessage(PC_TEXT_MARK_POKE);
        sStorage->markMenu.markings = sStorage->cursorMonMarkings;
        DrawMonMarkingsMenu(sStorage->cursorMonMarkings, 0xb0, 0x10);
        sStorage->state++;
        break;
    case 1:
        if (!MonMarkingsHandleInput())
        {
            TeardownMonMarkingsMenu();
            ClearBottomWindow();
            SetMonMarkings(sStorage->markMenu.markings);
            RefreshDisplayMonData();
            SetPokeStorageTask(Task_PokeStorageMain);
        }
        break;
    }
}

static void Task_TakeItemForMoving(u8 taskId)
{
    switch (sStorage->state)
    {
    case 0:
        if (!ItemIsMail(sStorage->displayMonItemId))
        {
            ClearBottomWindow();
            sStorage->state++;
        }
        else
        {
            SetPokeStorageTask(Task_PrintCantStoreMail);
        }
        break;
    case 1:
        StartCursorAnim(CURSOR_ANIM_OPEN);
        Item_FromMonToMoving(sInPartyMenu ? CURSOR_AREA_IN_PARTY : CURSOR_AREA_IN_BOX, GetBoxCursorPosition());
        sStorage->state++;
        break;
    case 2:
        if (!IsItemIconAnimActive())
        {
            StartCursorAnim(CURSOR_ANIM_FIST);
            ClearBottomWindow();
            RefreshDisplayMon();
            PrintDisplayMonInfo();
            sStorage->state++;
        }
        break;
    case 3:
        if (!IsDma3ManagerBusyWithBgCopy())
            SetPokeStorageTask(Task_PokeStorageMain);
        break;
    }
}

static void Task_GiveMovingItemToMon(u8 taskId)
{
    switch (sStorage->state)
    {
    case 0:
        ClearBottomWindow();
        sStorage->state++;
        break;
    case 1:
        StartCursorAnim(CURSOR_ANIM_OPEN);
        Item_GiveMovingToMon(sInPartyMenu ? CURSOR_AREA_IN_PARTY : CURSOR_AREA_IN_BOX, GetBoxCursorPosition());
        sStorage->state++;
        break;
    case 2:
        if (!IsItemIconAnimActive())
        {
            StartCursorAnim(CURSOR_ANIM_BOUNCE);
            RefreshDisplayMon();
            PrintDisplayMonInfo();
            PrintMessage(PC_TEXT_ITEM_IS_HELD);
            sStorage->state++;
        }
        break;
    case 3:
        if (JOY_NEW(A_BUTTON | B_BUTTON | DPAD_ANY))
        {
            ClearBottomWindow();
            sStorage->state++;
        }
        break;
    case 4:
        if (!IsDma3ManagerBusyWithBgCopy())
            SetPokeStorageTask(Task_PokeStorageMain);
        break;
    }
}

static void Task_ItemToBag(u8 taskId)
{
    switch (sStorage->state)
    {
    case 0:
        if (!AddBagItem(sStorage->displayMonItemId, 1))
        {
            PlaySE(SE_FAILURE);
            PrintMessage(PC_TEXT_BAG_FULL);
            sStorage->state = 3;
        }
        else
        {
            PlaySE(SE_SELECT);
            Item_TakeMons(sInPartyMenu ? CURSOR_AREA_IN_PARTY : CURSOR_AREA_IN_BOX, GetBoxCursorPosition());
            sStorage->state = 1;
        }
        break;
    case 1:
        if (!IsItemIconAnimActive())
        {
            PrintMessage(PC_TEXT_PLACED_IN_BAG);
            sStorage->state = 2;
        }
        break;
    case 2:
        if (JOY_NEW(A_BUTTON | B_BUTTON | DPAD_ANY))
        {
            ClearBottomWindow();
            RefreshDisplayMon();
            PrintDisplayMonInfo();
            sStorage->state = 4;
        }
        break;
    case 4:
        if (!IsDma3ManagerBusyWithBgCopy())
            SetPokeStorageTask(Task_PokeStorageMain);
        break;
    case 3:
        if (JOY_NEW(A_BUTTON | B_BUTTON | DPAD_ANY))
        {
            ClearBottomWindow();
            SetPokeStorageTask(Task_PokeStorageMain);
        }
        break;
    }
}

static void Task_SwitchSelectedItem(u8 taskId)
{
    switch (sStorage->state)
    {
    case 0:
        if (!ItemIsMail(sStorage->displayMonItemId))
        {
            ClearBottomWindow();
            sStorage->state++;
        }
        else
        {
            SetPokeStorageTask(Task_PrintCantStoreMail);
        }
        break;
    case 1:
        StartCursorAnim(CURSOR_ANIM_OPEN);
        Item_SwitchMonsWithMoving(sInPartyMenu ? CURSOR_AREA_IN_PARTY : CURSOR_AREA_IN_BOX, GetBoxCursorPosition());
        sStorage->state++;
        break;
    case 2:
        if (!IsItemIconAnimActive())
        {
            StartCursorAnim(CURSOR_ANIM_FIST);
            RefreshDisplayMon();
            PrintDisplayMonInfo();
            PrintMessage(PC_TEXT_CHANGED_TO_ITEM);
            sStorage->state++;
        }
        break;
    case 3:
        if (JOY_NEW(A_BUTTON | B_BUTTON | DPAD_ANY))
        {
            ClearBottomWindow();
            sStorage->state++;
        }
        break;
    case 4:
        if (!IsDma3ManagerBusyWithBgCopy())
            SetPokeStorageTask(Task_PokeStorageMain);
        break;
    }
}

static void Task_ShowItemInfo(u8 taskId)
{
    switch (sStorage->state)
    {
    case 0:
        ClearBottomWindow();
        sStorage->state++;
        break;
    case 1:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            PlaySE(SE_WIN_OPEN);
            PrintItemDescription();
            InitItemInfoWindow();
            sStorage->state++;
        }
        break;
    case 2:
        if (!UpdateItemInfoWindowSlideIn())
            sStorage->state++;
        break;
    case 3:
        if (!IsDma3ManagerBusyWithBgCopy())
            sStorage->state++;
        break;
    case 4:
        if (JOY_NEW(A_BUTTON | B_BUTTON | DPAD_ANY))
        {
            PlaySE(SE_WIN_OPEN);
            sStorage->state++;
        }
        break;
    case 5:
        if (!UpdateItemInfoWindowSlideOut())
            sStorage->state++;
        break;
    case 6:
        if (!IsDma3ManagerBusyWithBgCopy())
            SetPokeStorageTask(Task_PokeStorageMain);
        break;
    }
}

static void Task_CloseBoxWhileHoldingItem(u8 taskId)
{
    switch (sStorage->state)
    {
    case 0:
        PlaySE(SE_SELECT);
        PrintMessage(PC_TEXT_PUT_IN_BAG);
        ShowYesNoWindow(0);
        sStorage->state = 1;
        break;
    case 1:
        switch (Menu_ProcessInputNoWrapClearOnChoose())
        {
        case MENU_B_PRESSED:
        case 1: // No
            ClearBottomWindow();
            SetPokeStorageTask(Task_PokeStorageMain);
            break;
        case 0: // Yes
            if (AddBagItem(sStorage->movingItemId, 1) == TRUE)
            {
                ClearBottomWindow();
                sStorage->state = 3;
            }
            else
            {
                PrintMessage(PC_TEXT_BAG_FULL);
                sStorage->state = 2;
            }
            break;
        }
        break;
    case 2:
        if (JOY_NEW(A_BUTTON | B_BUTTON | DPAD_ANY))
        {
            ClearBottomWindow();
            sStorage->state = 5;
        }
        break;
    case 3:
        MoveItemFromCursorToBag();
        sStorage->state = 4;
        break;
    case 4:
        if (!IsItemIconAnimActive())
        {
            StartCursorAnim(CURSOR_ANIM_BOUNCE);
            SetPokeStorageTask(Task_PokeStorageMain);
        }
        break;
    case 5:
        if (!IsDma3ManagerBusyWithBgCopy())
            SetPokeStorageTask(Task_PokeStorageMain);
        break;
    }
}

static void Task_HandleMovingMonFromParty(u8 taskId)
{
    switch (sStorage->state)
    {
    case 0:
        CompactPartySlots();
        CompactPartySprites();
        sStorage->state++;
        break;
    case 1:
        if (!GetNumPartySpritesCompacting())
        {
            UpdatePartySlotColors();
            SetPokeStorageTask(Task_PokeStorageMain);
        }
        break;
    }
}

static void Task_PrintCantStoreMail(u8 taskId)
{
    switch (sStorage->state)
    {
    case 0:
        PrintMessage(PC_TEXT_CANT_STORE_MAIL);
        sStorage->state++;
        break;
    case 1:
        if (!IsDma3ManagerBusyWithBgCopy())
            sStorage->state++;
        break;
    case 2:
        if (JOY_NEW(A_BUTTON | B_BUTTON | DPAD_ANY))
        {
            ClearBottomWindow();
            sStorage->state++;
        }
        break;
    case 3:
        if (!IsDma3ManagerBusyWithBgCopy())
            SetPokeStorageTask(Task_PokeStorageMain);
        break;
    }
}

static void Task_HandleBoxOptions(u8 taskId)
{
    switch (sStorage->state)
    {
    case 0:
        PrintMessage(PC_TEXT_WHAT_YOU_DO);
        AddMenu();
        sStorage->state++;
        break;
    case 1:
        if (IsMenuLoading())
            return;
        sStorage->state++;
    case 2:
        switch (PokeStorage_HandleMenuInput())
        {
        case MENU_B_PRESSED:
        case MENU_CANCEL:
            AnimateBoxScrollArrows(TRUE);
            ClearBottomWindow();
            SetPokeStorageTask(Task_PokeStorageMain);
            break;
        case MENU_NAME:
            PlaySE(SE_SELECT);
            SetPokeStorageTask(Task_NameBox);
            break;
        case MENU_WALLPAPER:
            PlaySE(SE_SELECT);
            ClearBottomWindow();
            SetPokeStorageTask(Task_HandleWallpapers);
            break;
        case MENU_JUMP:
            PlaySE(SE_SELECT);
            ClearBottomWindow();
            SetPokeStorageTask(Task_JumpBox);
            break;
        }
        break;
    }
}

static void Task_HandleWallpapers(u8 taskId)
{
    switch (sStorage->state)
    {
    case 0:
        AddWallpaperSetsMenu();
        PrintMessage(PC_TEXT_PICK_A_THEME);
        sStorage->state++;
        break;
    case 1:
        if (!IsMenuLoading())
            sStorage->state++;
        break;
    case 2:
        sStorage->wallpaperSetId = PokeStorage_HandleMenuInput();
        switch (sStorage->wallpaperSetId)
        {
        case MENU_B_PRESSED:
            AnimateBoxScrollArrows(TRUE);
            ClearBottomWindow();
            SetPokeStorageTask(Task_PokeStorageMain);
            break;
        case MENU_SCENERY_1:
        case MENU_SCENERY_2:
        case MENU_SCENERY_3:
        case MENU_ETCETERA:
            PlaySE(SE_SELECT);
            RemoveMenu();
            sStorage->wallpaperSetId -= MENU_WALLPAPER_SETS_START;
            sStorage->state++;
            break;
        }
        break;
    case 3:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            AddWallpapersMenu(sStorage->wallpaperSetId);
            PrintMessage(PC_TEXT_PICK_A_WALLPAPER);
            sStorage->state++;
        }
        break;
    case 4:
        sStorage->wallpaperId = PokeStorage_HandleMenuInput();
        switch (sStorage->wallpaperId)
        {
        case MENU_NOTHING_CHOSEN:
            break;
        case MENU_B_PRESSED:
            ClearBottomWindow();
            sStorage->state = 0;
            break;
        default:
            PlaySE(SE_SELECT);
            ClearBottomWindow();
            sStorage->wallpaperId -= MENU_WALLPAPERS_START;
            SetWallpaperForCurrentBox(sStorage->wallpaperId);
            sStorage->state++;
            break;
        }
        break;
    case 5:
        if (!DoWallpaperGfxChange())
        {
            AnimateBoxScrollArrows(TRUE);
            SetPokeStorageTask(Task_PokeStorageMain);
        }
        break;
    }
}

static void Task_JumpBox(u8 taskId)
{
    switch (sStorage->state)
    {
    case 0:
        PrintMessage(PC_TEXT_JUMP_TO_WHICH_BOX);
        LoadChooseBoxMenuGfx(&sStorage->chooseBoxMenu, TAG_TILE_A, TAG_PAL_HAND_CURSOR, 3, FALSE);
        CreateChooseBoxMenuSprites(StorageGetCurrentBox());
        sStorage->state++;
        break;
    case 1:
        sStorage->newCurrBoxId = HandleBoxChooseSelectionInput();
        switch (sStorage->newCurrBoxId)
        {
        case BOXID_NONE_CHOSEN:
            break;
        default:
            ClearBottomWindow();
            DestroyChooseBoxMenuSprites();
            FreeBoxSelectionPopupSpriteGfx();
            if (sStorage->newCurrBoxId == BOXID_CANCELED || sStorage->newCurrBoxId == StorageGetCurrentBox())
            {
                AnimateBoxScrollArrows(TRUE);
                SetPokeStorageTask(Task_PokeStorageMain);
            }
            else
            {
                sStorage->state++;
            }
            break;
        }
        break;
    case 2:
        SetUpScrollToBox(sStorage->newCurrBoxId);
        sStorage->state++;
        break;
    case 3:
        if (!ScrollToBox())
        {
            SetCurrentBox(sStorage->newCurrBoxId);
            SetPokeStorageTask(Task_PokeStorageMain);
        }
        break;
    }
}

static void Task_NameBox(u8 taskId)
{
    switch (sStorage->state)
    {
    case 0:
        SaveMovingMon();
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB_BLACK);
        sStorage->state++;
        break;
    case 1:
        if (!UpdatePaletteFade())
        {
            sWhichToReshow = SCREEN_CHANGE_NAME_BOX - 1;
            sStorage->screenChangeType = SCREEN_CHANGE_NAME_BOX;
            SetPokeStorageTask(Task_ChangeScreen);
        }
        break;
    }
}

static void Task_ShowMonSummary(u8 taskId)
{
    switch (sStorage->state)
    {
    case 0:
        InitSummaryScreenData();
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB_BLACK);
        sStorage->state++;
        break;
    case 1:
        if (!UpdatePaletteFade())
        {
            sWhichToReshow = SCREEN_CHANGE_SUMMARY_SCREEN - 1;
            sStorage->screenChangeType = SCREEN_CHANGE_SUMMARY_SCREEN;
            SetPokeStorageTask(Task_ChangeScreen);
        }
        break;
    }
}

static void Task_GiveItemFromBag(u8 taskId)
{
    switch (sStorage->state)
    {
    case 0:
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB_BLACK);
        sStorage->state++;
        break;
    case 1:
        if (!UpdatePaletteFade())
        {
            sWhichToReshow = SCREEN_CHANGE_ITEM_FROM_BAG - 1;
            sStorage->screenChangeType = SCREEN_CHANGE_ITEM_FROM_BAG;
            SetPokeStorageTask(Task_ChangeScreen);
        }
        break;
    }
}

static void Task_OnCloseBoxPressed(u8 taskId)
{
    switch (sStorage->state)
    {
    case 0:
        if (IsMonBeingMoved())
        {
            PlaySE(SE_FAILURE);
            PrintMessage(PC_TEXT_HOLDING_POKE);
            sStorage->state = 1;
        }
        else if (IsActiveItemMoving())
        {
            SetPokeStorageTask(Task_CloseBoxWhileHoldingItem);
        }
        else
        {
            PlaySE(SE_SELECT);
            PrintMessage(PC_TEXT_EXIT_BOX);
            ShowYesNoWindow(0);
            sStorage->state = 2;
        }
        break;
    case 1:
        if (JOY_NEW(A_BUTTON | B_BUTTON | DPAD_ANY))
        {
            ClearBottomWindow();
            SetPokeStorageTask(Task_PokeStorageMain);
        }
        break;
    case 2:
        switch (Menu_ProcessInputNoWrapClearOnChoose())
        {
        case MENU_B_PRESSED:
        case 1: // No
            ClearBottomWindow();
            SetPokeStorageTask(Task_PokeStorageMain);
            break;
        case 0: // Yes
            PlaySE(SE_PC_OFF);
            ClearBottomWindow();
            sStorage->state++;
            break;
        }
        break;
    case 3:
        BeginPCScreenEffect_TurnOff(20, 0, 1);
        sStorage->state++;
        break;
    case 4:
        if (!IsPCScreenEffectRunning_TurnOff())
        {
            UpdateBoxToSendMons();
            gPlayerPartyCount = CalculatePlayerPartyCount();
            sStorage->screenChangeType = SCREEN_CHANGE_EXIT_BOX;
            SetPokeStorageTask(Task_ChangeScreen);
        }
        break;
    }
}

static void Task_OnBPressed(u8 taskId)
{
    switch (sStorage->state)
    {
    case 0:
        if (IsMonBeingMoved())
        {
            PlaySE(SE_FAILURE);
            PrintMessage(PC_TEXT_HOLDING_POKE);
            sStorage->state = 1;
        }
        else if (IsActiveItemMoving())
        {
            SetPokeStorageTask(Task_CloseBoxWhileHoldingItem);
        }
        else
        {
            PlaySE(SE_SELECT);
            PrintMessage(PC_TEXT_CONTINUE_BOX);
            ShowYesNoWindow(0);
            sStorage->state = 2;
        }
        break;
    case 1:
        if (JOY_NEW(A_BUTTON | B_BUTTON | DPAD_ANY))
        {
            ClearBottomWindow();
            SetPokeStorageTask(Task_PokeStorageMain);
        }
        break;
    case 2:
        switch (Menu_ProcessInputNoWrapClearOnChoose())
        {
        case 0: // Yes
            ClearBottomWindow();
            SetPokeStorageTask(Task_PokeStorageMain);
            break;
        case 1: // No
        case MENU_B_PRESSED:
            PlaySE(SE_PC_OFF);
            ClearBottomWindow();
            sStorage->state++;
            break;
        }
        break;
    case 3:
        BeginPCScreenEffect_TurnOff(20, 0, 0);
        sStorage->state++;
        break;
    case 4:
        if (!IsPCScreenEffectRunning_TurnOff())
        {
            UpdateBoxToSendMons();
            gPlayerPartyCount = CalculatePlayerPartyCount();
            sStorage->screenChangeType = SCREEN_CHANGE_EXIT_BOX;
            SetPokeStorageTask(Task_ChangeScreen);
        }
        break;
    }
}

static void Task_ChangeScreen(u8 taskId)
{
    struct Pokemon * partyMon;
    u8 mode, monIndex, maxMonIndex;
    u8 screenChangeType = sStorage->screenChangeType;

    if (sStorage->boxOption == BOX_OPTION_MOVE_ITEMS && IsActiveItemMoving() == TRUE)
        sMovingItemId = GetMovingItem();
    else
        sMovingItemId = ITEM_NONE;

    switch (screenChangeType)
    {
    case SCREEN_CHANGE_EXIT_BOX:
    default:
        FreePokeStorageData();
        SetMainCallback2(CB2_ExitPokeStorage);
        break;
    case SCREEN_CHANGE_SUMMARY_SCREEN:
        partyMon = sStorage->summaryMon.mon;
        monIndex = sStorage->summaryStartPos;
        maxMonIndex = sStorage->summaryMaxPos;
        mode = sStorage->summaryScreenMode;
        FreePokeStorageData();
        ShowPokemonSummaryScreen(partyMon, monIndex, maxMonIndex, CB2_ReturnToPokeStorage, mode);
        break;
    case SCREEN_CHANGE_NAME_BOX:
        FreePokeStorageData();
        DoNamingScreen(NAMING_SCREEN_BOX, GetBoxNamePtr(StorageGetCurrentBox()), 0, 0, 0, CB2_ReturnToPokeStorage);
        break;
    case SCREEN_CHANGE_ITEM_FROM_BAG:
        FreePokeStorageData();
        GoToBagMenu(ITEMMENULOCATION_PCBOX, OPEN_BAG_ITEMS, CB2_ReturnToPokeStorage);
        break;
    }

    DestroyTask(taskId);
}

static void GiveChosenBagItem(void)
{
    u16 item = gSpecialVar_ItemId;

    if (item != ITEM_NONE)
    {
        u8 id = GetBoxCursorPosition();

        if (sInPartyMenu)
            SetMonData(&gPlayerParty[id], MON_DATA_HELD_ITEM, &item);
        else
            SetCurrentBoxMonData(id, MON_DATA_HELD_ITEM, &item);

        RemoveBagItem(item, 1);
    }
}

static void FreePokeStorageData(void)
{
    TilemapUtil_Free();
    MultiMove_Free();
    FREE_AND_SET_NULL(sStorage);
    FreeAllWindowBuffers();
}

//------------------------------------------------------------------------------
//  SECTION: Misc
//
//  No real uniform section below. Misc functions including more initialization,
//  showing/hiding the party menu, updating the Close Box button, printing
//  messages, doing the mosaic effect when transitioning between Pokémon, etc.
//------------------------------------------------------------------------------

static void SetScrollingBackground(void)
{
    SetGpuReg(REG_OFFSET_BG3CNT, BGCNT_PRIORITY(3) | BGCNT_CHARBASE(3) | BGCNT_16COLOR | BGCNT_SCREENBASE(31));
    DecompressAndLoadBgGfxUsingHeap(3, sScrollingBg_Gfx, 0, 0, 0);
    LZ77UnCompVram(sScrollingBg_Tilemap, (void *)BG_SCREEN_ADDR(31));
}

static void ScrollBackground(void)
{
    ChangeBgX(3, 128, 1);
    ChangeBgY(3, 128, 2);
}

static void LoadPSSMenuGfx(void)
{
    InitBgsFromTemplates(0, sBgTemplates, NELEMS(sBgTemplates));
    DecompressAndLoadBgGfxUsingHeap(1, gPSSMenu_Gfx, 0, 0, 0);
    LZ77UnCompWram(sDisplayMenu_Tilemap, sStorage->displayMenuTilemapBuffer);
    SetBgTilemapBuffer(1, sStorage->displayMenuTilemapBuffer);
    ShowBg(1);
    ScheduleBgCopyTilemapToVram(1);
}

static bool8 InitPSSWindows(void)
{
    if (!InitWindows(sWindowTemplates))
    {
        return FALSE;
    }
    else
    {
        DeactivateAllTextPrinters();
        return TRUE;
    }
}

static void LoadWaveformSpritePalette(void)
{
    LoadSpritePalette(&sWaveformSpritePalette);
}

static void InitPalettesAndSprites(void)
{
    LoadPalette(gPokeStorage_Interface_Pal, 0, 0x20);
    LoadPalette(gPokeStorage_PkmnDataGray_Pal, 0x20, 0x20);
    LoadPalette(sUnknown_Pal, 0xF0, 0x20);
    if (sStorage->boxOption != BOX_OPTION_MOVE_ITEMS)
        LoadPalette(sBg_Pal, 0x30, 0x20);
    else
        LoadPalette(sBgMoveItems_Pal, 0x30, 0x20);

    SetGpuReg(REG_OFFSET_BG1CNT, BGCNT_PRIORITY(1) | BGCNT_CHARBASE(1) | BGCNT_16COLOR | BGCNT_SCREENBASE(30));
    CreateDisplayMonSprite();
    CreateMarkingComboSprite();
    CreateWaveformSprites();
    RefreshDisplayMonData();
}

static void CreateMarkingComboSprite(void)
{
    sStorage->markingComboSprite = CreateMonMarkingComboSprite(TAG_TILE_10, TAG_PAL_DAC8, NULL);
    sStorage->markingComboSprite->oam.priority = 1;
    sStorage->markingComboSprite->subpriority = 1;
    sStorage->markingComboSprite->pos1.x = 40;
    sStorage->markingComboSprite->pos1.y = 150;
    sStorage->markingComboTilesPtr = (void *)OBJ_VRAM0 + 32 * GetSpriteTileStartByTag(TAG_TILE_10);
}

static void CreateWaveformSprites(void)
{
    u16 i;
    struct SpriteSheet sheet = sWaveformSpriteSheet;

    LoadSpriteSheet(&sheet);
    for (i = 0; i < 2; i++)
    {
        u8 spriteId = CreateSprite(&sSpriteTemplate_Waveform, i * 63 + 8, 9, 2);
        sStorage->waveformSprites[i] = &gSprites[spriteId];
    }
}

static void RefreshDisplayMonData(void)
{
    LoadDisplayMonGfx(sStorage->displayMonSpecies, sStorage->displayMonPersonality);
    PrintDisplayMonInfo();
    UpdateWaveformAnimation();
    ScheduleBgCopyTilemapToVram(0);
}

#define sMosaicSize      data[0]
#define sMosaicSpeed     data[1]

static void StartDisplayMonMosaicEffect(void)
{
    RefreshDisplayMonData();
    if (sStorage->displayMonSprite)
    {
        sStorage->displayMonSprite->oam.mosaic = TRUE;
        sStorage->displayMonSprite->sMosaicSize = 10;
        sStorage->displayMonSprite->sMosaicSpeed = 1;
        sStorage->displayMonSprite->callback = SpriteCB_DisplayMonMosaic;
        SetGpuReg(REG_OFFSET_MOSAIC, (sStorage->displayMonSprite->sMosaicSize << MOSAIC_OBJ_VSIZE_SHIFT) | (sStorage->displayMonSprite->sMosaicSize << MOSAIC_OBJ_HSIZE_SHIFT));
    }
}

static u8 IsDisplayMosaicActive(void)
{
    return sStorage->displayMonSprite->oam.mosaic;
}

static void SpriteCB_DisplayMonMosaic(struct Sprite *sprite)
{
    sprite->sMosaicSize -= sprite->sMosaicSpeed;
    if (sprite->sMosaicSize < 0)
        sprite->sMosaicSize = 0;
    SetGpuReg(REG_OFFSET_MOSAIC, (sprite->sMosaicSize << MOSAIC_OBJ_VSIZE_SHIFT) | (sprite->sMosaicSize << MOSAIC_OBJ_HSIZE_SHIFT));
    if (sprite->sMosaicSize == 0)
    {
        sprite->oam.mosaic = FALSE;
        sprite->callback = SpriteCallbackDummy;
    }
}

#undef sMosaicSize
#undef sMosaicSpeed

static void CreateDisplayMonSprite(void)
{
    u16 i;
    u16 tileStart;
    u8 palSlot;
    u8 spriteId;
    struct SpriteSheet sheet = {sStorage->tileBuffer, 0x800, TAG_TILE_2};
    struct SpritePalette palette = {sStorage->displayMonPalBuffer, TAG_PAL_DAC6};
    struct SpriteTemplate template = sSpriteTemplate_CursorMon;

    for (i = 0; i < 0x800; i++)
        sStorage->tileBuffer[i] = 0;
    for (i = 0; i < 0x10; i++)
        sStorage->displayMonPalBuffer[i] = 0;

    sStorage->displayMonSprite = NULL;

    do
    {
        tileStart = LoadSpriteSheet(&sheet);
        if (tileStart == 0)
            break;

        palSlot = LoadSpritePalette(&palette);
        if (palSlot == 0xFF)
            break;

        spriteId = CreateSprite(&template, 40, 48, 0);
        if (spriteId == MAX_SPRITES)
            break;

        sStorage->displayMonSprite = &gSprites[spriteId];
        sStorage->displayMonPalOffset = palSlot * 16 + 0x100;
        sStorage->displayMonTilePtr = (void *)OBJ_VRAM0 + tileStart * 32;
    } while (0);

    if (sStorage->displayMonSprite == NULL)
    {
        FreeSpriteTilesByTag(TAG_TILE_2);
        FreeSpritePaletteByTag(TAG_PAL_DAC6);
    }
}

static void LoadDisplayMonGfx(u16 species, u32 pid)
{
    if (sStorage->displayMonSprite == NULL)
        return;

    if (species != SPECIES_NONE)
    {
        HandleLoadSpecialPokePic(&gMonFrontPicTable[species], sStorage->tileBuffer, species, pid);
        LZ77UnCompWram(sStorage->displayMonPalette, sStorage->displayMonPalBuffer);
        CpuCopy32(sStorage->tileBuffer, sStorage->displayMonTilePtr, 0x800);
        LoadPalette(sStorage->displayMonPalBuffer, sStorage->displayMonPalOffset, 0x20);
        sStorage->displayMonSprite->invisible = FALSE;
    }
    else
    {
        sStorage->displayMonSprite->invisible = TRUE;
    }
}

static void PrintDisplayMonInfo(void)
{
    u16 i;
    u16 y;
    FillWindowPixelBuffer(PSS_WIN_DISPLAY_MON_INFO, PIXEL_FILL(1));
    if (sStorage->boxOption != BOX_OPTION_MOVE_ITEMS)
    {
        for (i = 0, y = 0; i < 3; i++, y += 14)
        {
            AddTextPrinterParameterized(PSS_WIN_DISPLAY_MON_INFO, 2, sStorage->cursorMonTexts[i], i == 2 ? 10 : 6, y, TEXT_SPEED_FF, NULL);
        }
        AddTextPrinterParameterized(PSS_WIN_DISPLAY_MON_INFO, 0, sStorage->cursorMonTexts[3], 6, y + 2, TEXT_SPEED_FF, NULL);
    }
    else
    {
        AddTextPrinterParameterized(PSS_WIN_DISPLAY_MON_INFO, 0, sStorage->cursorMonTexts[3], 6, 0, TEXT_SPEED_FF, NULL);
        for (i = 0, y = 15; i < 3; i++, y += 14)
        {
            AddTextPrinterParameterized(PSS_WIN_DISPLAY_MON_INFO, 2, sStorage->cursorMonTexts[i], i == 2 ? 10 : 6, y, TEXT_SPEED_FF, NULL);
        }
    }

    CopyWindowToVram(PSS_WIN_DISPLAY_MON_INFO, COPYWIN_GFX);
    if (sStorage->displayMonSpecies != SPECIES_NONE)
    {
        RequestDma3LoadMonMarking(sStorage->cursorMonMarkings, sStorage->markingComboTilesPtr);
        sStorage->markingComboSprite->invisible = FALSE;
    }
    else
    {
        sStorage->markingComboSprite->invisible = TRUE;
    }
}

static void UpdateWaveformAnimation(void)
{
    u16 i;

    if (sStorage->displayMonSpecies != SPECIES_NONE)
    {
        // Start waveform animation and color "Pkmn Data"
        TilemapUtil_SetRect(TILEMAPID_PKMN_DATA, 0, 0, 8, 2);
        for (i = 0; i < 2; i++)
            StartSpriteAnimIfDifferent(sStorage->waveformSprites[i], i * 2 + 1);
    }
    else
    {
        // Stop waveform animation and gray out "Pkmn Data"
        TilemapUtil_SetRect(TILEMAPID_PKMN_DATA, 0, 2, 8, 2);
        for (i = 0; i < 2; i++)
            StartSpriteAnim(sStorage->waveformSprites[i], i * 2);
    }

    TilemapUtil_Update(TILEMAPID_PKMN_DATA);
    ScheduleBgCopyTilemapToVram(1);
}

static void InitSupplementalTilemaps(void)
{
    LZ77UnCompWram(gStorageSystemPartyMenu_Tilemap, sStorage->partyMenuTilemapBuffer);
    LoadPalette(gPSSMenu_Pal, 0x10, 0x20);
    TilemapUtil_SetMap(TILEMAPID_PARTY_MENU, 1, sStorage->partyMenuTilemapBuffer, 12, 22);
    TilemapUtil_SetMap(TILEMAPID_CLOSE_BUTTON, 1, sCloseBoxButton_Tilemap, 9, 4);
    TilemapUtil_SetPos(TILEMAPID_PARTY_MENU, 10, 0);
    TilemapUtil_SetPos(TILEMAPID_CLOSE_BUTTON, 21, 0);
    SetPartySlotTilemaps();
    if (sInPartyMenu)
    {
        UpdateCloseBoxButtonTilemap(TRUE);
        CreatePartyMonsSprites(TRUE);
        TilemapUtil_Update(TILEMAPID_CLOSE_BUTTON);
        TilemapUtil_Update(TILEMAPID_PARTY_MENU);
    }
    else
    {
        TilemapUtil_SetRect(TILEMAPID_PARTY_MENU, 0, 20, 12, 2);
        UpdateCloseBoxButtonTilemap(TRUE);
        TilemapUtil_Update(TILEMAPID_PARTY_MENU);
        TilemapUtil_Update(TILEMAPID_CLOSE_BUTTON);
    }

    ScheduleBgCopyTilemapToVram(1);
    sStorage->closeBoxFlashing = FALSE;
}

static void SetUpShowPartyMenu(void)
{
    sStorage->partyMenuUnused1 = 20;
    sStorage->partyMenuY = 2;
    sStorage->partyMenuMoveTimer = 0;
    CreatePartyMonsSprites(FALSE);
}

static bool8 ShowPartyMenu(void)
{
    if (sStorage->partyMenuMoveTimer == 20)
        return FALSE;

    sStorage->partyMenuUnused1--;
    sStorage->partyMenuY++;
    TilemapUtil_Move(TILEMAPID_PARTY_MENU, BPPD_MOVE_OUTER_TOP, 1);
    TilemapUtil_Update(TILEMAPID_PARTY_MENU);
    ScheduleBgCopyTilemapToVram(1);
    MovePartySprites(8);
    if (++sStorage->partyMenuMoveTimer == 20)
    {
        sInPartyMenu = TRUE;
        return FALSE;
    }
    else
    {
        return TRUE;
    }
}

static void SetUpHidePartyMenu(void)
{
    sStorage->partyMenuUnused1 = 0;
    sStorage->partyMenuY = 22;
    sStorage->partyMenuMoveTimer = 0;
    if (sStorage->boxOption == BOX_OPTION_MOVE_ITEMS)
        MoveHeldItemWithPartyMenu();
}

static bool8 HidePartyMenu(void)
{
    if (sStorage->partyMenuMoveTimer != 20)
    {
        sStorage->partyMenuUnused1++;
        sStorage->partyMenuY--;
        TilemapUtil_Move(TILEMAPID_PARTY_MENU, BPPD_MOVE_OUTER_TOP, -1);
        TilemapUtil_Update(TILEMAPID_PARTY_MENU);
        FillBgTilemapBufferRect_Palette0(1, 0x100, 10, sStorage->partyMenuY, 12, 1);
        MovePartySprites(-8);
        if (++sStorage->partyMenuMoveTimer != 20)
        {
            ScheduleBgCopyTilemapToVram(1);
            return TRUE;
        }
        else
        {
            sInPartyMenu = FALSE;
            DestroyAllPartyMonIcons();
            CompactPartySlots();
            TilemapUtil_SetRect(TILEMAPID_CLOSE_BUTTON, 0, 0, 9, 2);
            TilemapUtil_Update(TILEMAPID_CLOSE_BUTTON);
            ScheduleBgCopyTilemapToVram(1);
            return FALSE;
        }
    }

    return FALSE;
}

static void UpdateCloseBoxButtonTilemap(bool8 normal)
{
    if (normal)
        TilemapUtil_SetRect(TILEMAPID_CLOSE_BUTTON, 0, 0, 9, 2);
    else
        TilemapUtil_SetRect(TILEMAPID_CLOSE_BUTTON, 0, 2, 9, 2);

    TilemapUtil_Update(TILEMAPID_CLOSE_BUTTON);
    ScheduleBgCopyTilemapToVram(1);
}

static void StartFlashingCloseBoxButton(void)
{
    sStorage->closeBoxFlashing = TRUE;
    sStorage->closeBoxFlashTimer = 30;
    sStorage->closeBoxFlashState = TRUE;
}

static void StopFlashingCloseBoxButton(void)
{
    if (sStorage->closeBoxFlashing)
    {
        sStorage->closeBoxFlashing = FALSE;
        UpdateCloseBoxButtonTilemap(TRUE);
    }
}

static void UpdateCloseBoxButtonFlash(void)
{
    if (sStorage->closeBoxFlashing && ++sStorage->closeBoxFlashTimer > 30)
    {
        sStorage->closeBoxFlashTimer = 0;
        sStorage->closeBoxFlashState = (sStorage->closeBoxFlashState == FALSE);
        UpdateCloseBoxButtonTilemap(sStorage->closeBoxFlashState);
    }
}

static void SetPartySlotTilemaps(void)
{
    u8 i;

    for (i = 1; i < PARTY_SIZE; i++)
    {
        s32 species = GetMonData(gPlayerParty + i, MON_DATA_SPECIES);
        SetPartySlotTilemap(i, (species != SPECIES_NONE));
    }
}

static void SetPartySlotTilemap(u8 pos, bool8 isPartyMon)
{
    u16 i, j, index;
    const u16 *data;

    if (isPartyMon)
        data = sPartySlotFilled_Tilemap;
    else
        data = sPartySlotEmpty_Tilemap;

    index = 3 * (3 * (pos - 1) + 1);
    index *= 4;
    index += 7;
    for (i = 0; i < 3; i++)
    {
        for (j = 0; j < 4; j++)
        {
            sStorage->partyMenuTilemapBuffer[index + j] = data[j];
        }
        data += 4;
        index += 12;
    }
}

static void UpdatePartySlotColors(void)
{
    SetPartySlotTilemaps();
    TilemapUtil_SetRect(TILEMAPID_PARTY_MENU, 0, 0, 12, 22);
    TilemapUtil_Update(TILEMAPID_PARTY_MENU);
    ScheduleBgCopyTilemapToVram(1);
}

static void SetUpDoShowPartyMenu(void)
{
    sStorage->showPartyMenuState = 0;
    PlaySE(SE_WIN_OPEN);
    SetUpShowPartyMenu();
}

static bool8 DoShowPartyMenu(void)
{
    switch (sStorage->showPartyMenuState)
    {
    case 0:
        if (!ShowPartyMenu())
        {
            SetCursorInParty();
            sStorage->showPartyMenuState++;
        }
        break;
    case 1:
        if (!UpdateCursorPos())
        {
            if (sStorage->setMosaic)
                StartDisplayMonMosaicEffect();
            sStorage->showPartyMenuState++;
        }
        break;
    case 2:
        return FALSE;
    }
    return TRUE;
}

static void InitPokeStorageBg0(void)
{
    SetGpuReg(REG_OFFSET_BG0CNT, BGCNT_PRIORITY(0) | BGCNT_CHARBASE(0) | BGCNT_SCREENBASE(29));
    TextWindow_SetStdFrame0_WithPal(PSS_WIN_MESSAGE_BOX, 2, 208);
    FillBgTilemapBufferRect(0, 0, 0, 0, 32, 20, 17);
    CopyBgTilemapBufferToVram(0);
}

static void PrintMessage(u8 id)
{
    u8 *txtPtr;

    DynamicPlaceholderTextUtil_Reset();
    switch (sPCStorageActionTexts[id].format)
    {
    case PC_TEXT_FMT_NORMAL:
        break;
    case PC_TEXT_FMT_MON_NAME_1:
    case PC_TEXT_FMT_MON_NAME_2:
    case PC_TEXT_FMT_MON_NAME_3:
        DynamicPlaceholderTextUtil_SetPlaceholderPtr(0, sStorage->cursorMonNick);
        break;
    case PC_TEXT_FMT_MON_NAME_4:
    case PC_TEXT_FMT_MON_NAME_5:
    case PC_TEXT_FMT_MON_NAME_6:
        DynamicPlaceholderTextUtil_SetPlaceholderPtr(0, sStorage->releaseMonName);
        break;
    case PC_TEXT_FMT_ITEM_NAME:
        if (IsActiveItemMoving())
            txtPtr = StringCopy(sStorage->itemName, GetMovingItemName());
        else
            txtPtr = StringCopy(sStorage->itemName, sStorage->cursorMonTexts[3]);

        while (*(txtPtr - 1) == CHAR_SPACE)
            txtPtr--;

        *txtPtr = EOS;
        DynamicPlaceholderTextUtil_SetPlaceholderPtr(0, sStorage->itemName);
        break;
    }

    DynamicPlaceholderTextUtil_ExpandPlaceholders(sStorage->messageText, sPCStorageActionTexts[id].text);
    FillWindowPixelBuffer(PSS_WIN_MESSAGE_BOX, PIXEL_FILL(1));
    AddTextPrinterParameterized(PSS_WIN_MESSAGE_BOX, 1, sStorage->messageText, 0, 2, TEXT_SPEED_FF, NULL);
    DrawTextBorderOuter(PSS_WIN_MESSAGE_BOX, 2, 13);
    PutWindowTilemap(PSS_WIN_MESSAGE_BOX);
    CopyWindowToVram(PSS_WIN_MESSAGE_BOX, COPYWIN_GFX);
    ScheduleBgCopyTilemapToVram(0);
}

static void ShowYesNoWindow(s8 cursorPos)
{
    CreateYesNoMenu(&sYesNoWindowTemplate, 1, 0, 2, 0x00b, 14, 1);
    Menu_MoveCursorNoWrapAround(cursorPos);
}

static void ClearBottomWindow(void)
{
    ClearStdWindowAndFrameToTransparent(PSS_WIN_MESSAGE_BOX, FALSE);
    ScheduleBgCopyTilemapToVram(0);
}

static void AddWallpaperSetsMenu(void)
{
    InitMenu();
    SetMenuText(MENU_SCENERY_1);
    SetMenuText(MENU_SCENERY_2);
    SetMenuText(MENU_SCENERY_3);
    SetMenuText(MENU_ETCETERA);
    AddMenu();
}

static void AddWallpapersMenu(u8 wallpaperSet)
{
    InitMenu();
    switch (wallpaperSet)
    {
    case MENU_SCENERY_1 - MENU_WALLPAPER_SETS_START:
        SetMenuText(MENU_FOREST);
        SetMenuText(MENU_CITY);
        SetMenuText(MENU_DESERT);
        SetMenuText(MENU_SAVANNA);
        break;
    case MENU_SCENERY_2 - MENU_WALLPAPER_SETS_START:
        SetMenuText(MENU_CRAG);
        SetMenuText(MENU_VOLCANO);
        SetMenuText(MENU_SNOW);
        SetMenuText(MENU_CAVE);
        break;
    case MENU_SCENERY_3 - MENU_WALLPAPER_SETS_START:
        SetMenuText(MENU_BEACH);
        SetMenuText(MENU_SEAFLOOR);
        SetMenuText(MENU_RIVER);
        SetMenuText(MENU_SKY);
        break;
    case MENU_ETCETERA - MENU_WALLPAPER_SETS_START:
        SetMenuText(MENU_POLKADOT);
        SetMenuText(MENU_POKECENTER);
        SetMenuText(MENU_MACHINE);
        SetMenuText(MENU_SIMPLE);
        break;
    }
    AddMenu();
}

u8 GetCurrentBoxOption(void)
{
    return sCurrentBoxOption;
}

static void InitCursorItemIcon(void)
{
    if (!IsCursorOnBox())
    {
        if (sInPartyMenu)
            TryLoadItemIconAtPos(CURSOR_AREA_IN_PARTY, GetBoxCursorPosition());
        else
            TryLoadItemIconAtPos(CURSOR_AREA_IN_BOX, GetBoxCursorPosition());
    }

    if (sMovingItemId != ITEM_NONE)
    {
        InitItemIconInCursor(sMovingItemId);
        StartCursorAnim(CURSOR_ANIM_FIST);
    }
}

static void PokeStorage_AppendActionToQuestLogBuffer(u8 action)
{
    u16 event;
    u8 fromBox = PSS_GetMovingMonOrigBoxId();
    u16 species = sStorage->displayMonSpecies;
    u16 species2;
    u8 toBox;
    struct PssQuestLogBuffer * qlogBuffer;
    if (sInPartyMenu)
    {
        toBox = TOTAL_BOXES_COUNT;
        species2 = GetMonData(&gPlayerParty[GetBoxCursorPosition()], MON_DATA_SPECIES2);
    }
    else
    {
        toBox = StorageGetCurrentBox();
        species2 = GetCurrentBoxMonData(GetBoxCursorPosition(), MON_DATA_SPECIES2);
    }
    qlogBuffer = &sStorage->qlogBuffer;

    switch (action)
    {
    default:
        return;
    case PSS_QL_SHIFT_MON:
        if (sInPartyMenu)
        {
            if (fromBox == TOTAL_BOXES_COUNT)
                return;
            else
                event = QL_EVENT_SWITCHED_PARTY_MON_FOR_PC_MON;
        }
        else
        {
            if (fromBox == TOTAL_BOXES_COUNT)
                // Should upmerge but doesn't
                event = QL_EVENT_SWITCHED_PARTY_MON_FOR_PC_MON;
            else
                event = fromBox != toBox ? QL_EVENT_SWITCHED_MONS_BETWEEN_BOXES : QL_EVENT_SWITCHED_MONS_WITHIN_BOX;
        }
        qlogBuffer->species = species;
        qlogBuffer->species2 = species2;
        qlogBuffer->fromBox = fromBox;
        qlogBuffer->toBox = toBox;
        break;
    case PSS_QL_PLACE_MON:
        qlogBuffer->species = species;
        qlogBuffer->species2 = SPECIES_NONE;
        qlogBuffer->fromBox = fromBox;
        qlogBuffer->toBox = 0xFF;
        if (sInPartyMenu)
        {
            if (fromBox == TOTAL_BOXES_COUNT)
                return;
            else
                event = QL_EVENT_WITHDREW_MON_PC;
        }
        else
        {
            if (fromBox == TOTAL_BOXES_COUNT)
            {
                event = QL_EVENT_DEPOSITED_MON_PC;
                qlogBuffer->fromBox = toBox;
            }
            else if (fromBox != toBox)
            {
                event = QL_EVENT_MOVED_MON_BETWEEN_BOXES;
                qlogBuffer->toBox = toBox;
            }
            else
                event = QL_EVENT_MOVED_MON_WITHIN_BOX;
        }
        break;
    case PSS_QL_DEPOSIT:
        event = QL_EVENT_DEPOSITED_MON_PC;
        qlogBuffer->species = species;
        qlogBuffer->species2 = SPECIES_NONE;
        qlogBuffer->fromBox = sDepositingBoxId;
        qlogBuffer->toBox = 0xFF;
        break;
    case PSS_QL_MULTIMOVE:
        event = QL_EVENT_SWITCHED_MULTIPLE_MONS;
        qlogBuffer->species = SPECIES_NONE;
        qlogBuffer->species2 = SPECIES_NONE;
        qlogBuffer->fromBox = fromBox;
        qlogBuffer->toBox = toBox;
        break;
    }
    SetQuestLogEvent(event, (const void *)qlogBuffer);
}

static void UpdateBoxToSendMons(void)
{
    if (sLastUsedBox != StorageGetCurrentBox())
    {
        FlagClear(FLAG_SHOWN_BOX_WAS_FULL_MESSAGE);
        VarSet(VAR_PC_BOX_TO_SEND_MON, StorageGetCurrentBox());
    }
}
