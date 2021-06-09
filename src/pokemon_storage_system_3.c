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
#include "pokemon_icon.h"
#include "pokemon_storage_system_internal.h"
#include "pokemon_summary_screen.h"
#include "quest_log.h"
#include "strings.h"
#include "task.h"
#include "text_window.h"
#include "trig.h"
#include "constants/items.h"
#include "constants/help_system.h"
#include "constants/songs.h"

EWRAM_DATA struct PokemonStorageSystemData *gPSSData = NULL;
static EWRAM_DATA bool8 sInPartyMenu = 0;
static EWRAM_DATA u8 sCurrentBoxOption = 0;
static EWRAM_DATA u8 sDepositingBoxId = 0;
static EWRAM_DATA u8 sWhichToReshow = 0;
static EWRAM_DATA u8 sLastUsedBox = 0;
static EWRAM_DATA u16 sMovingItemId = ITEM_NONE;

static void Cb_InitPSS(u8 taskId);
static void Cb_ShowPSS(u8 taskId);
static void Cb_ReshowPSS(u8 taskId);
static void Cb_MainPSS(u8 taskId);
static void Cb_ShowPartyPokemon(u8 taskId);
static void Cb_HidePartyPokemon(u8 taskId);
static void Cb_OnSelectedMon(u8 taskId);
static void Cb_MoveMon(u8 taskId);
static void Cb_PlaceMon(u8 taskId);
static void Cb_ShiftMon(u8 taskId);
static void Cb_WithdrawMon(u8 taskId);
static void Cb_DepositMenu(u8 taskId);
static void Cb_ReleaseMon(u8 taskId);
static void Cb_ShowMarkMenu(u8 taskId);
static void Cb_TakeItemForMoving(u8 taskId);
static void Cb_GiveMovingItemToMon(u8 taskId);
static void Cb_ItemToBag(u8 taskId);
static void Cb_SwitchSelectedItem(u8 taskId);
static void Cb_ShowItemInfo(u8 taskId);
static void Cb_HandleMovingMonFromParty(u8 taskId);
static void Cb_PrintCantStoreMail(u8 taskId);
static void Cb_HandleBoxOptions(u8 taskId);
static void Cb_HandleWallpapers(u8 taskId);
static void Cb_JumpBox(u8 taskId);
static void Cb_NameBox(u8 taskId);
static void Cb_ShowMonSummary(u8 taskId);
static void Cb_GiveItemFromBag(u8 taskId);
static void Cb_OnCloseBoxPressed(u8 taskId);
static void Cb_OnBPressed(u8 taskId);
static void Cb_ChangeScreen(u8 taskId);
static void GiveChosenBagItem(void);
static void FreePSSData(void);
static void SetScrollingBackground(void);
static void ScrollBackground(void);
static void LoadPSSMenuGfx(void);
static bool8 InitPSSWindows(void);
static void LoadWaveformSpritePalette(void);
static void sub_808F078(void);
static void PSS_CreateMonMarkingSprite(void);
static void CreateWaveformSprites(void);
static void RefreshCursorMonData(void);
static void BoxSetMosaic(void);
static void SpriteCB_CursorMon_Mosaic(struct Sprite * sprite);
static bool8 BoxGetMosaic(void);
static void LoadCursorMonSprite(void);
static void LoadCursorMonGfx(u16 species, u32 pid);
static void PrintCursorMonInfo(void);
static void sub_808F5E8(void);
static void sub_808F68C(void);
static void SetUpHidePartyMenu(void);
static bool8 HidePartyMenu(void);
static void sub_808F90C(bool8 species);
static void sub_808F948(void);
static void sub_808F974(void);
static void sub_808F99C(void);
static void sub_808F9FC(void);
static void sub_808FA30(u8 pos, bool8 isPartyMon);
static void sub_808FAA8(void);
static void SetUpDoShowPartyMenu(void);
static bool8 DoShowPartyMenu(void);
static void sub_808FB68(void);
static void PrintStorageActionText(u8 textId);
static void ShowYesNoWindow(s8 species);
static void ClearBottomWindow(void);
static void AddWallpaperSetsMenu(void);
static void AddWallpapersMenu(u8 wallpaperSet);
static void sub_808FDFC(void);
static void sub_808FE54(u8 action);
static void sub_808FF70(void);

static const u32 sPokemonStorageScrollingBGTileset[] = INCBIN_U32("graphics/interface/pss_unk_83CE438.4bpp.lz");
static const u32 sPokemonStorageScrollingBGTilemap[] = INCBIN_U32("graphics/interface/pss_unk_83CE4D0.bin.lz");
static const u16 sPokemonStorageScrollingBGPalette[] = INCBIN_U16("graphics/interface/pss_unk_83CE5DC.gbapal");
static const u32 gPSS_BG1Tilemap[] = INCBIN_U32("graphics/interface/pss_unk_83CE5FC.bin.lz");

static const u16 sBoxPartyPokemonDropdown0_Map2[] = {
    0x0101, 0x0102, 0x0103, 0x0104, 0x0105, 0x0106, 0x0107, 0x0108,
    0x0111, 0x0112, 0x0113, 0x0114, 0x0115, 0x0116, 0x0117, 0x0118,
    0x2101, 0x2102, 0x2103, 0x2104, 0x2105, 0x2106, 0x2107, 0x2108,
    0x2111, 0x2112, 0x2113, 0x2114, 0x2115, 0x2116, 0x2117, 0x2118,
};

static const u16 gUnknown_83CE738[] = INCBIN_U16("graphics/interface/pss_unk_83CE738.gbapal");
static const u16 gUnknown_83CE758[] = INCBIN_U16("graphics/interface/pss_unk_83CE758.gbapal");

static const u16 sBoxPartyPokemonDropdown2_Map2[] = {
    0x014c, 0x014d, 0x014e, 0x014f, 0x0170, 0x0171, 0x0172, 0x0173, 0x0174,
    0x015c, 0x015d, 0x015e, 0x015f, 0x0180, 0x0181, 0x0182, 0x0183, 0x0184,
    0x0175, 0x0176, 0x0177, 0x0178, 0x0179, 0x017a, 0x017b, 0x017c, 0x017d,
    0x0185, 0x0186, 0x0187, 0x0188, 0x0189, 0x018a, 0x018b, 0x018c, 0x018d,
};

static const u16 gUnknown_83CE7C0[] = {
    0x1140, 0x1141, 0x1141, 0x1142,
    0x1150, 0x1151, 0x1151, 0x1152,
    0x1160, 0x1161, 0x1161, 0x1162,
};

static const u16 gUnknown_83CE7D8[] = {
    0x1143, 0x1144, 0x1144, 0x1145,
    0x1153, 0x1154, 0x1154, 0x1155,
    0x1163, 0x1164, 0x1164, 0x1165,
};

static const u16 sWaveformSpritePalsData[] = INCBIN_U16("graphics/interface/pss_unk_83CE810.gbapal");
static const u16 sWaveformSpriteTilesData[] = INCBIN_U16("graphics/interface/pss_unk_83CE810.4bpp");
static const u16 gUnknown_83CE9D0[] = INCBIN_U16("graphics/interface/pss_unk_83CE9D0.gbapal");
static const u16 gUnknown_83CEA10[] = INCBIN_U16("graphics/interface/pss_unk_83CEA10.gbapal");

enum {
    PSS_WIN_0,
    PSS_WIN_1,
    PSS_WIN_2,
};

enum {
    PSS_DROPDOWN_0,
    PSS_DROPDOWN_1,
    PSS_DROPDOWN_2,
};

static const struct WindowTemplate sWindowTemplates[] = {
    [PSS_WIN_0] = {
        .bg = 1,
        .tilemapLeft = 0,
        .tilemapTop = 11,
        .width = 9,
        .height = 7,
        .paletteNum = 3,
        .baseBlock = 0x0c0
    }, 
    [PSS_WIN_1] = {
        .bg = 0,
        .tilemapLeft = 11,
        .tilemapTop = 17,
        .width = 18,
        .height = 2,
        .paletteNum = 13,
        .baseBlock = 0x014
    }, 
    [PSS_WIN_2] = {
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
    sWaveformSpritePalsData, TAG_PAL_WAVEFORM
};

static const struct SpriteSheet sWaveformSpriteSheet = {
    sWaveformSpriteTilesData, 0x01c0, TAG_TILE_WAVEFORM
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

static void VblankCb_PSS(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    sub_8096BF8();
    TransferPlttBuffer();
    SetGpuReg(REG_OFFSET_BG2HOFS, gPSSData->bg2_X);
}

static void Cb2_PSS(void)
{
    RunTasks();
    DoScheduledBgTilemapCopiesToVram();
    ScrollBackground();
    sub_808F99C();
    AnimateSprites();
    BuildOamBuffer();
}

void Cb2_EnterPSS(u8 boxOption)
{
    ResetTasks();
    sCurrentBoxOption = boxOption;
    gPSSData = Alloc(sizeof(struct PokemonStorageSystemData));
    if (gPSSData == NULL)
        SetMainCallback2(Cb2_ExitPSS);
    else
    {
        gPSSData->boxOption = boxOption;
        gPSSData->isReopening = FALSE;
        sMovingItemId = 0;
        gPSSData->state = 0;
        gPSSData->taskId = CreateTask(Cb_InitPSS, 3);
        SetHelpContext(HELPCONTEXT_BILLS_PC);
        sLastUsedBox = StorageGetCurrentBox();
        SetMainCallback2(Cb2_PSS);
    }
}

void Cb2_ReturnToPSS(void)
{
    ResetTasks();
    gPSSData = Alloc(sizeof(struct PokemonStorageSystemData));
    if (gPSSData == NULL)
        SetMainCallback2(Cb2_ExitPSS);
    else
    {
        gPSSData->boxOption = sCurrentBoxOption;
        gPSSData->isReopening = TRUE;
        gPSSData->state = 0;
        gPSSData->taskId = CreateTask(Cb_InitPSS, 3);
        SetHelpContext(HELPCONTEXT_BILLS_PC);
        SetMainCallback2(Cb2_PSS);
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

static void ResetGraphics(void)
{
    ResetPaletteFade();
    ResetSpriteData();
    FreeSpriteTileRanges();
    FreeAllSpritePalettes();
    ClearDma3Requests();
    gReservedSpriteTileCount = 0x280;
    PSS_InitCopyAndFillManager(&gPSSData->unkUtil, gPSSData->unkUtilData, NELEMS(gPSSData->unkUtilData));
    gKeyRepeatStartDelay = 20;
    ClearScheduledBgCopiesToVram();
    AllocBoxPartyPokemonDropdowns(3);
    SetBoxPartyPokemonDropdownMap2(PSS_DROPDOWN_0, 1, sBoxPartyPokemonDropdown0_Map2, 8, 4);
    SetBoxPartyPokemonDropdownMap2Pos(PSS_DROPDOWN_0, 1, 0);
    gPSSData->closeBoxFlashing = FALSE;
}

static void sub_808CF94(void)
{
    ClearSavedCursorPos();
    sInPartyMenu = gPSSData->boxOption == BOX_OPTION_DEPOSIT;
    sDepositingBoxId = 0;
}

static void sub_808CFC4(void)
{
    if (gPSSData->boxOption == BOX_OPTION_MOVE_ITEMS)
    {
        SetGpuReg(REG_OFFSET_BLDCNT, BLDCNT_TGT2_ALL);
        SetGpuReg(REG_OFFSET_BLDALPHA, BLDALPHA_BLEND(7, 11));
    }
    SetGpuReg(REG_OFFSET_DISPCNT, DISPCNT_OBJ_ON | DISPCNT_BG_ALL_ON | DISPCNT_OBJ_1D_MAP);
}

static void SetPSSCallback(TaskFunc newFunc)
{
    gTasks[gPSSData->taskId].func = newFunc;
    gPSSData->state = 0;
}

static void Cb_InitPSS(u8 taskId)
{
    switch (gPSSData->state)
    {
    case 0:
        SetVBlankCallback(NULL);
        SetGpuReg(REG_OFFSET_DISPCNT, 0);
        ResetGraphics();
        if (gPSSData->isReopening)
        {
            switch (sWhichToReshow)
            {
            case 1:
                LoadSavedMovingMon();
                break;
            case 0:
                SetSelectionAfterSummaryScreen();
                break;
            case 2:
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
            SetPSSCallback(Cb_ChangeScreen);
            return;
        }
        break;
    case 2:
        PutWindowTilemap(PSS_WIN_0);
        ClearWindowTilemap(PSS_WIN_1);
        CpuFill32(0, (void *)VRAM, 0x200);
        TextWindow_SetUserSelectedFrame(PSS_WIN_1, 0xB, 0xE0);
        break;
    case 3:
        ResetAllBgCoords();
        if (!gPSSData->isReopening)
            sub_808CF94();
        break;
    case 4:
        sub_808FFAC();
        if (!gPSSData->isReopening)
            InitCursor();
        else
            InitCursorOnReopen();
        break;
    case 5:
        if (!sub_8095050())
        {
            SetPSSCallback(Cb_ChangeScreen);
            return;
        }
        else
        {
            SetScrollingBackground();
            sub_808FB68();
        }
        break;
    case 6:
        sub_808F078();
        break;
    case 7:
        sub_808F68C();
        break;
    case 8:
        sub_80913DC(StorageGetCurrentBox());
        break;
    case 9:
        if (sub_809140C())
            return;

        if (gPSSData->boxOption != BOX_OPTION_MOVE_ITEMS)
        {
            gPSSData->markMenu.baseTileTag = TAG_TILE_D;
            gPSSData->markMenu.basePaletteTag = TAG_PAL_DACE;
            SetMonMarkingsMenuPointer(&gPSSData->markMenu);
            LoadMonMarkingsFrameGfx();
        }
        else
        {
            sub_8095B5C();
            sub_808FDFC();
        }
        break;
    case 10:
        sub_808CFC4();
        if (!gPSSData->isReopening)
        {
            BlendPalettes(0xFFFFFFFF, 0x10, RGB_BLACK);
            SetPSSCallback(Cb_ShowPSS);
        }
        else
        {
            BlendPalettes(0xFFFFFFFF, 0x10, RGB_BLACK);
            SetPSSCallback(Cb_ReshowPSS);
        }
        SetVBlankCallback(VblankCb_PSS);
        return;
    default:
        return;
    }

    gPSSData->state++;
}

static void Cb_ShowPSS(u8 taskId)
{
    switch (gPSSData->state)
    {
    case 0:
        PlaySE(SE_PC_LOGIN);
        BeginPCScreenEffect_TurnOn(20, 0, 1);
        gPSSData->state++;
        break;
    case 1:
        if (!IsPCScreenEffectRunning_TurnOn())
            SetPSSCallback(Cb_MainPSS);
        break;
    }
}

static void Cb_ReshowPSS(u8 taskId)
{
    switch (gPSSData->state)
    {
    case 0:
        BeginNormalPaletteFade(0xFFFFFFFF, -1, 0x10, 0, RGB_BLACK);
        gPSSData->state++;
        break;
    case 1:
        if (!UpdatePaletteFade())
        {
            SetPSSCallback(Cb_MainPSS);
        }
        break;
    }
}

static void Cb_MainPSS(u8 taskId)
{
    switch (gPSSData->state)
    {
    case 0:
        switch (HandleInput())
        {
        case 1:
            PlaySE(SE_SELECT);
            gPSSData->state = 1;
            break;
        case 5:
            if (gPSSData->boxOption != BOX_OPTION_MOVE_MONS && gPSSData->boxOption != BOX_OPTION_MOVE_ITEMS)
            {
                PrintStorageActionText(PC_TEXT_WHICH_ONE_WILL_TAKE);
                gPSSData->state = 3;
            }
            else
            {
                ClearSavedCursorPos();
                SetPSSCallback(Cb_ShowPartyPokemon);
            }
            break;
        case 6:
            if (gPSSData->boxOption == BOX_OPTION_MOVE_MONS)
            {
                if (IsMonBeingMoved() && ItemIsMail(gPSSData->displayMonItemId))
                    gPSSData->state = 5;
                else
                    SetPSSCallback(Cb_HidePartyPokemon);
            }
            else if (gPSSData->boxOption == BOX_OPTION_MOVE_ITEMS)
            {
                SetPSSCallback(Cb_HidePartyPokemon);
            }
            break;
        case 4:
            SetPSSCallback(Cb_OnCloseBoxPressed);
            break;
        case 19:
            SetPSSCallback(Cb_OnBPressed);
            break;
        case 7:
            PlaySE(SE_SELECT);
            SetPSSCallback(Cb_HandleBoxOptions);
            break;
        case 8:
            SetPSSCallback(Cb_OnSelectedMon);
            break;
        case 9:
            PlaySE(SE_SELECT);
            gPSSData->newCurrBoxId = StorageGetCurrentBox() + 1;
            if (gPSSData->newCurrBoxId >= TOTAL_BOXES_COUNT)
                gPSSData->newCurrBoxId = 0;
            if (gPSSData->boxOption != BOX_OPTION_MOVE_ITEMS)
            {
                SetUpScrollToBox(gPSSData->newCurrBoxId);
                gPSSData->state = 2;
            }
            else
            {
                TryHideItemAtCursor();
                gPSSData->state = 10;
            }
            break;
        case 10:
            PlaySE(SE_SELECT);
            gPSSData->newCurrBoxId = StorageGetCurrentBox() - 1;
            if (gPSSData->newCurrBoxId < 0)
                gPSSData->newCurrBoxId = TOTAL_BOXES_COUNT - 1;
            if (gPSSData->boxOption != BOX_OPTION_MOVE_ITEMS)
            {
                SetUpScrollToBox(gPSSData->newCurrBoxId);
                gPSSData->state = 2;
            }
            else
            {
                TryHideItemAtCursor();
                gPSSData->state = 10;
            }
            break;
        case 11:
            if (!CanMovePartyMon())
            {
                if (ItemIsMail(gPSSData->displayMonItemId))
                {
                    gPSSData->state = 5;
                }
                else
                {
                    PlaySE(SE_SELECT);
                    SetPSSCallback(Cb_DepositMenu);
                }
            }
            else
            {
                gPSSData->state = 4;
            }
            break;
        case 13:
            if (CanMovePartyMon())
            {
                gPSSData->state = 4;
            }
            else
            {
                PlaySE(SE_SELECT);
                SetPSSCallback(Cb_MoveMon);
            }
            break;
        case 14:
            if (!CanShiftMon())
            {
                gPSSData->state = 4;
            }
            else
            {
                PlaySE(SE_SELECT);
                SetPSSCallback(Cb_ShiftMon);
            }
            break;
        case 12:
            PlaySE(SE_SELECT);
            SetPSSCallback(Cb_WithdrawMon);
            break;
        case 15:
            PlaySE(SE_SELECT);
            SetPSSCallback(Cb_PlaceMon);
            break;
        case 16:
            PlaySE(SE_SELECT);
            SetPSSCallback(Cb_TakeItemForMoving);
            break;
        case 17:
            PlaySE(SE_SELECT);
            SetPSSCallback(Cb_GiveMovingItemToMon);
            break;
        case 18:
            PlaySE(SE_SELECT);
            SetPSSCallback(Cb_SwitchSelectedItem);
            break;
        case 20:
            PlaySE(SE_SELECT);
            sub_80950BC(0);
            gPSSData->state = 7;
            break;
        case 22:
            sub_80950BC(1);
            gPSSData->state = 8;
            break;
        case 21:
            PlaySE(SE_SELECT);
            sub_80950BC(2);
            gPSSData->state = 9;
            break;
        case 23:
            sub_80950BC(3);
            gPSSData->state = 7;
            break;
        case 25:
            PlaySE(SE_SELECT);
            sub_80950BC(4);
            gPSSData->state = 9;
            break;
        case 26:
            PlaySE(SE_SELECT);
            sub_808FE54(3);
            sub_80950BC(5);
            gPSSData->state = 7;
            break;
        case 24:
            PlaySE(SE_FAILURE);
            break;
        }
        break;
    case 1:
        if (!UpdateCursorPos())
        {
            if (IsCursorOnCloseBox())
                sub_808F948();
            else
                sub_808F974();

            if (gPSSData->setMosaic)
                BoxSetMosaic();
            gPSSData->state = 0;
        }
        break;
    case 2:
        if (!ScrollToBox())
        {
            SetCurrentBox(gPSSData->newCurrBoxId);
            if (!sInPartyMenu && !IsMonBeingMoved())
            {
                RefreshDisplayMon();
                BoxSetMosaic();
            }

            if (gPSSData->boxOption == BOX_OPTION_MOVE_ITEMS)
            {
                TryShowItemAtCursor();
                gPSSData->state = 11;
            }
            else
            {
                gPSSData->state = 0;
            }
        }
        break;
    case 3:
        if (JOY_NEW(A_BUTTON | B_BUTTON | DPAD_ANY))
        {
            ClearBottomWindow();
            gPSSData->state = 0;
        }
        break;
    case 4:
        PlaySE(SE_FAILURE);
        PrintStorageActionText(PC_TEXT_LAST_POKE);
        gPSSData->state = 6;
        break;
    case 5:
        PlaySE(SE_FAILURE);
        PrintStorageActionText(PC_TEXT_PLEASE_REMOVE_MAIL);
        gPSSData->state = 6;
        break;
    case 6:
        if (JOY_NEW(A_BUTTON | B_BUTTON | DPAD_ANY))
        {
            ClearBottomWindow();
            SetPSSCallback(Cb_MainPSS);
        }
        break;
    case 7:
        if (!sub_80950D0())
            gPSSData->state = 0;
        break;
    case 8:
        if (!sub_80950D0())
            SetPSSCallback(Cb_MoveMon);
        break;
    case 9:
        if (!sub_80950D0())
        {
            if (gPSSData->setMosaic)
                BoxSetMosaic();
            gPSSData->state = 0;
        }
        break;
    case 10:
        if (!IsItemIconAnimActive())
        {
            SetUpScrollToBox(gPSSData->newCurrBoxId);
            gPSSData->state = 2;
        }
        break;
    case 11:
        if (!IsItemIconAnimActive())
            gPSSData->state = 0;
        break;
    }
}

static void Cb_ShowPartyPokemon(u8 taskId)
{
    switch (gPSSData->state)
    {
    case 0:
        SetUpDoShowPartyMenu();
        gPSSData->state++;
        break;
    case 1:
        if (!DoShowPartyMenu())
            SetPSSCallback(Cb_MainPSS);
        break;
    }
}

static void Cb_HidePartyPokemon(u8 taskId)
{
    switch (gPSSData->state)
    {
    case 0:
        PlaySE(SE_SELECT);
        SetUpHidePartyMenu();
        gPSSData->state++;
        break;
    case 1:
        if (!HidePartyMenu())
        {
            SetCursorBoxPosition(GetSavedCursorPos());
            gPSSData->state++;
        }
        break;
    case 2:
        if (!UpdateCursorPos())
        {
            if (gPSSData->setMosaic)
                BoxSetMosaic();
            SetPSSCallback(Cb_MainPSS);
        }
        break;
    }
}

static void Cb_OnSelectedMon(u8 taskId)
{
    switch (gPSSData->state)
    {
    case 0:
        if (!BoxGetMosaic())
        {
            PlaySE(SE_SELECT);
            if (gPSSData->boxOption != BOX_OPTION_MOVE_ITEMS)
                PrintStorageActionText(PC_TEXT_IS_SELECTED);
            else if (IsActiveItemMoving() || gPSSData->displayMonItemId != 0)
                PrintStorageActionText(PC_TEXT_IS_SELECTED2);
            else
                PrintStorageActionText(PC_TEXT_GIVE_TO_MON);

            AddMenu();
            gPSSData->state = 1;
        }
        break;
    case 1: // debug?
        if (!sub_8094F90())
            gPSSData->state = 2;
        break;
    case 2:
        switch (sub_8094F94())
        {
        case -1:
        case  0:
            ClearBottomWindow();
            SetPSSCallback(Cb_MainPSS);
            break;
        case 3:
            if (CanMovePartyMon())
            {
                gPSSData->state = 3;
            }
            else
            {
                PlaySE(SE_SELECT);
                ClearBottomWindow();
                SetPSSCallback(Cb_MoveMon);
            }
            break;
        case 5:
            PlaySE(SE_SELECT);
            ClearBottomWindow();
            SetPSSCallback(Cb_PlaceMon);
            break;
        case 4:
            if (!CanShiftMon())
            {
                gPSSData->state = 3;
            }
            else
            {
                PlaySE(SE_SELECT);
                ClearBottomWindow();
                SetPSSCallback(Cb_ShiftMon);
            }
            break;
        case 2:
            PlaySE(SE_SELECT);
            ClearBottomWindow();
            SetPSSCallback(Cb_WithdrawMon);
            break;
        case 1:
            if (CanMovePartyMon())
            {
                gPSSData->state = 3;
            }
            else if (ItemIsMail(gPSSData->displayMonItemId))
            {
                gPSSData->state = 4;
            }
            else
            {
                PlaySE(SE_SELECT);
                ClearBottomWindow();
                SetPSSCallback(Cb_DepositMenu);
            }
            break;
        case 7:
            if (CanMovePartyMon())
            {
                gPSSData->state = 3;
            }
            else if (gPSSData->cursorMonIsEgg)
            {
                gPSSData->state = 5; // Cannot release an Egg.
            }
            else if (ItemIsMail(gPSSData->displayMonItemId))
            {
                gPSSData->state = 4;
            }
            else
            {
                PlaySE(SE_SELECT);
                SetPSSCallback(Cb_ReleaseMon);
            }
            break;
        case 6:
            PlaySE(SE_SELECT);
            SetPSSCallback(Cb_ShowMonSummary);
            break;
        case 8:
            PlaySE(SE_SELECT);
            SetPSSCallback(Cb_ShowMarkMenu);
            break;
        case 12:
            PlaySE(SE_SELECT);
            SetPSSCallback(Cb_TakeItemForMoving);
            break;
        case 13:
            PlaySE(SE_SELECT);
            SetPSSCallback(Cb_GiveMovingItemToMon);
            break;
        case 16:
            SetPSSCallback(Cb_ItemToBag);
            break;
        case 15:
            SetPSSCallback(Cb_SwitchSelectedItem);
            break;
        case 14:
            SetPSSCallback(Cb_GiveItemFromBag);
            break;
        case 17:
            SetPSSCallback(Cb_ShowItemInfo);
            break;
        }
        break;
    case 3:
        PlaySE(SE_FAILURE);
        PrintStorageActionText(PC_TEXT_LAST_POKE);
        gPSSData->state = 6;
        break;
    case 5:
        PlaySE(SE_FAILURE);
        PrintStorageActionText(PC_TEXT_CANT_RELEASE_EGG);
        gPSSData->state = 6;
        break;
    case 4:
        PlaySE(SE_FAILURE);
        PrintStorageActionText(PC_TEXT_PLEASE_REMOVE_MAIL);
        gPSSData->state = 6;
        break;
    case 6:
        if (JOY_NEW(A_BUTTON | B_BUTTON | DPAD_ANY))
        {
            ClearBottomWindow();
            SetPSSCallback(Cb_MainPSS);
        }
        break;
    }
}

static void Cb_MoveMon(u8 taskId)
{
    switch (gPSSData->state)
    {
    case 0:
        InitMonPlaceChange(0);
        gPSSData->state++;
        break;
    case 1:
        if (!DoMonPlaceChange())
        {
            if (sInPartyMenu)
                SetPSSCallback(Cb_HandleMovingMonFromParty);
            else
                SetPSSCallback(Cb_MainPSS);
        }
        break;
    }
}

static void Cb_PlaceMon(u8 taskId)
{
    switch (gPSSData->state)
    {
    case 0:
        sub_808FE54(1);
        InitMonPlaceChange(1);
        gPSSData->state++;
        break;
    case 1:
        if (!DoMonPlaceChange())
        {
            if (sInPartyMenu)
                SetPSSCallback(Cb_HandleMovingMonFromParty);
            else
                SetPSSCallback(Cb_MainPSS);
        }
        break;
    }
}

static void Cb_ShiftMon(u8 taskId)
{
    switch (gPSSData->state)
    {
    case 0:
        sub_808FE54(0);
        InitMonPlaceChange(2);
        gPSSData->state++;
        break;
    case 1:
        if (!DoMonPlaceChange())
        {
            BoxSetMosaic();
            SetPSSCallback(Cb_MainPSS);
        }
        break;
    }
}

static void Cb_WithdrawMon(u8 taskId)
{
    switch (gPSSData->state)
    {
    case 0:
        if (CalculatePlayerPartyCount() == PARTY_SIZE)
        {
            PrintStorageActionText(PC_TEXT_PARTY_FULL);
            gPSSData->state = 1;
        }
        else
        {
            SaveCursorPos();
            InitMonPlaceChange(0);
            gPSSData->state = 2;
        }
        break;
    case 1:
        if (JOY_NEW(A_BUTTON | B_BUTTON | DPAD_ANY))
        {
            ClearBottomWindow();
            SetPSSCallback(Cb_MainPSS);
        }
        break;
    case 2:
        if (!DoMonPlaceChange())
        {
            SetMovingMonPriority(1);
            SetUpDoShowPartyMenu();
            gPSSData->state++;
        }
        break;
    case 3:
        if (!DoShowPartyMenu())
        {
            sub_808FE54(1);
            InitMonPlaceChange(1);
            gPSSData->state++;
        }
        break;
    case 4:
        if (!DoMonPlaceChange())
        {
            sub_808FAA8();
            gPSSData->state++;
        }
        break;
    case 5:
        SetPSSCallback(Cb_HidePartyPokemon);
        break;
    }
}

static void Cb_DepositMenu(u8 taskId)
{
    u8 boxId;

    switch (gPSSData->state)
    {
    case 0:
        PrintStorageActionText(PC_TEXT_DEPOSIT_IN_WHICH_BOX);
        LoadBoxSelectionPopupSpriteGfx(&gPSSData->chooseBoxMenu, TAG_TILE_A, TAG_PAL_DAC7, 3, FALSE);
        sub_808C940(sDepositingBoxId);
        gPSSData->state++;
        break;
    case 1:
        boxId = HandleBoxChooseSelectionInput();
        if (boxId == 200)
        {
            // no box chosen yet
        }
        else if (boxId == 201)
        {
            ClearBottomWindow();
            sub_808C950();
            FreeBoxSelectionPopupSpriteGfx();
            SetPSSCallback(Cb_MainPSS);
        }
        else
        {
            if (TryStorePartyMonInBox(boxId))
            {
                sDepositingBoxId = boxId;
                sub_808FE54(2);
                ClearBottomWindow();
                sub_808C950();
                FreeBoxSelectionPopupSpriteGfx();
                gPSSData->state = 2;
            }
            else
            {
                PrintStorageActionText(PC_TEXT_BOX_IS_FULL);
                gPSSData->state = 4;
            }
        }
        break;
    case 2:
        CompactPartySlots();
        sub_80909F4();
        gPSSData->state++;
        break;
    case 3:
        if (!sub_8090A60())
        {
            ResetSelectionAfterDeposit();
            BoxSetMosaic();
            sub_808FAA8();
            SetPSSCallback(Cb_MainPSS);
        }
        break;
    case 4:
        if (JOY_NEW(A_BUTTON | B_BUTTON | DPAD_ANY))
        {
            PrintStorageActionText(PC_TEXT_DEPOSIT_IN_WHICH_BOX);
            gPSSData->state = 1;
        }
        break;
    }
}

static void Cb_ReleaseMon(u8 taskId)
{
    switch (gPSSData->state)
    {
    case 0:
        PrintStorageActionText(PC_TEXT_RELEASE_POKE);
        ShowYesNoWindow(1);
        gPSSData->state++;
        // fallthrough
    case 1:
        switch (Menu_ProcessInputNoWrapClearOnChoose())
        {
        case MENU_B_PRESSED:
        case  1:
            ClearBottomWindow();
            SetPSSCallback(Cb_MainPSS);
            break;
        case  0:
            ClearBottomWindow();
            InitCanReleaseMonVars();
            InitReleaseMon();
            gPSSData->state++;
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
                    gPSSData->state++;
                    break;
                }
                else if (r0 == 0)
                {
                    gPSSData->state = 8; // Can't release the mon.
                    break;
                }
            }
        }
        break;
    case 3:
        ReleaseMon();
        RefreshCursorMonData();
        PrintStorageActionText(PC_TEXT_WAS_RELEASED);
        gPSSData->state++;
        break;
    case 4:
        if (JOY_NEW(A_BUTTON | B_BUTTON | DPAD_ANY))
        {
            PrintStorageActionText(PC_TEXT_BYE_BYE);
            gPSSData->state++;
        }
        break;
    case 5:
        if (JOY_NEW(A_BUTTON | B_BUTTON | DPAD_ANY))
        {
            ClearBottomWindow();
            if (sInPartyMenu)
            {
                CompactPartySlots();
                sub_80909F4();
                gPSSData->state++;
            }
            else
            {
                gPSSData->state = 7;
            }
        }
        break;
    case 6:
        if (!sub_8090A60())
        {
            RefreshDisplayMon();
            BoxSetMosaic();
            sub_808FAA8();
            gPSSData->state++;
        }
        break;
    case 7:
        SetPSSCallback(Cb_MainPSS);
        break;
    case 8:
        PrintStorageActionText(PC_TEXT_WAS_RELEASED);
        gPSSData->state++;
        break;
    case 9:
        if (JOY_NEW(A_BUTTON | B_BUTTON | DPAD_ANY))
        {
            PrintStorageActionText(PC_TEXT_SURPRISE);
            gPSSData->state++;
        }
        break;
    case 10:
        if (JOY_NEW(A_BUTTON | B_BUTTON | DPAD_ANY))
        {
            ClearBottomWindow();
            sub_8091114();
            gPSSData->state++;
        }
        break;
    case 11:
        if (!sub_8091150())
        {
            TrySetCursorFistAnim();
            PrintStorageActionText(PC_TEXT_CAME_BACK);
            gPSSData->state++;
        }
        break;
    case 12:
        if (JOY_NEW(A_BUTTON | B_BUTTON | DPAD_ANY))
        {
            PrintStorageActionText(PC_TEXT_WORRIED);
            gPSSData->state++;
        }
        break;
    case 13:
        if (JOY_NEW(A_BUTTON | B_BUTTON | DPAD_ANY))
        {
            ClearBottomWindow();
            SetPSSCallback(Cb_MainPSS);
        }
        break;
    }
}

static void Cb_ShowMarkMenu(u8 taskId)
{
    switch (gPSSData->state)
    {
    case 0:
        PrintStorageActionText(PC_TEXT_MARK_POKE);
        gPSSData->markMenu.markings = gPSSData->cursorMonMarkings;
        DrawMonMarkingsMenu(gPSSData->cursorMonMarkings, 0xb0, 0x10);
        gPSSData->state++;
        break;
    case 1:
        if (!MonMarkingsHandleInput())
        {
            TeardownMonMarkingsMenu();
            ClearBottomWindow();
            SetMonMarkings(gPSSData->markMenu.markings);
            RefreshCursorMonData();
            SetPSSCallback(Cb_MainPSS);
        }
        break;
    }
}

static void Cb_TakeItemForMoving(u8 taskId)
{
    switch (gPSSData->state)
    {
    case 0:
        if (!ItemIsMail(gPSSData->displayMonItemId))
        {
            ClearBottomWindow();
            gPSSData->state++;
        }
        else
        {
            SetPSSCallback(Cb_PrintCantStoreMail);
        }
        break;
    case 1:
        StartCursorAnim(2);
        Item_FromMonToMoving(sInPartyMenu ? CURSOR_AREA_IN_PARTY : CURSOR_AREA_IN_BOX, GetBoxCursorPosition());
        gPSSData->state++;
        break;
    case 2:
        if (!IsItemIconAnimActive())
        {
            StartCursorAnim(3);
            ClearBottomWindow();
            RefreshDisplayMon();
            PrintCursorMonInfo();
            gPSSData->state++;
        }
        break;
    case 3:
        if (!IsDma3ManagerBusyWithBgCopy())
            SetPSSCallback(Cb_MainPSS);
        break;
    }
}

static void Cb_GiveMovingItemToMon(u8 taskId)
{
    switch (gPSSData->state)
    {
    case 0:
        ClearBottomWindow();
        gPSSData->state++;
        break;
    case 1:
        StartCursorAnim(2);
        Item_GiveMovingToMon(sInPartyMenu ? CURSOR_AREA_IN_PARTY : CURSOR_AREA_IN_BOX, GetBoxCursorPosition());
        gPSSData->state++;
        break;
    case 2:
        if (!IsItemIconAnimActive())
        {
            StartCursorAnim(0);
            RefreshDisplayMon();
            PrintCursorMonInfo();
            PrintStorageActionText(PC_TEXT_ITEM_IS_HELD);
            gPSSData->state++;
        }
        break;
    case 3:
        if (JOY_NEW(A_BUTTON | B_BUTTON | DPAD_ANY))
        {
            ClearBottomWindow();
            gPSSData->state++;
        }
        break;
    case 4:
        if (!IsDma3ManagerBusyWithBgCopy())
            SetPSSCallback(Cb_MainPSS);
        break;
    }
}

static void Cb_ItemToBag(u8 taskId)
{
    switch (gPSSData->state)
    {
    case 0:
        if (!AddBagItem(gPSSData->displayMonItemId, 1))
        {
            PlaySE(SE_FAILURE);
            PrintStorageActionText(PC_TEXT_BAG_FULL);
            gPSSData->state = 3;
        }
        else
        {
            PlaySE(SE_SELECT);
            Item_TakeMons(sInPartyMenu ? CURSOR_AREA_IN_PARTY : CURSOR_AREA_IN_BOX, GetBoxCursorPosition());
            gPSSData->state = 1;
        }
        break;
    case 1:
        if (!IsItemIconAnimActive())
        {
            PrintStorageActionText(PC_TEXT_PLACED_IN_BAG);
            gPSSData->state = 2;
        }
        break;
    case 2:
        if (JOY_NEW(A_BUTTON | B_BUTTON | DPAD_ANY))
        {
            ClearBottomWindow();
            RefreshDisplayMon();
            PrintCursorMonInfo();
            gPSSData->state = 4;
        }
        break;
    case 4:
        if (!IsDma3ManagerBusyWithBgCopy())
            SetPSSCallback(Cb_MainPSS);
        break;
    case 3:
        if (JOY_NEW(A_BUTTON | B_BUTTON | DPAD_ANY))
        {
            ClearBottomWindow();
            SetPSSCallback(Cb_MainPSS);
        }
        break;
    }
}

static void Cb_SwitchSelectedItem(u8 taskId)
{
    switch (gPSSData->state)
    {
    case 0:
        if (!ItemIsMail(gPSSData->displayMonItemId))
        {
            ClearBottomWindow();
            gPSSData->state++;
        }
        else
        {
            SetPSSCallback(Cb_PrintCantStoreMail);
        }
        break;
    case 1:
        StartCursorAnim(2);
        Item_SwitchMonsWithMoving(sInPartyMenu ? CURSOR_AREA_IN_PARTY : CURSOR_AREA_IN_BOX, GetBoxCursorPosition());
        gPSSData->state++;
        break;
    case 2:
        if (!IsItemIconAnimActive())
        {
            StartCursorAnim(3);
            RefreshDisplayMon();
            PrintCursorMonInfo();
            PrintStorageActionText(PC_TEXT_CHANGED_TO_ITEM);
            gPSSData->state++;
        }
        break;
    case 3:
        if (JOY_NEW(A_BUTTON | B_BUTTON | DPAD_ANY))
        {
            ClearBottomWindow();
            gPSSData->state++;
        }
        break;
    case 4:
        if (!IsDma3ManagerBusyWithBgCopy())
            SetPSSCallback(Cb_MainPSS);
        break;
    }
}

static void Cb_ShowItemInfo(u8 taskId)
{
    switch (gPSSData->state)
    {
    case 0:
        ClearBottomWindow();
        gPSSData->state++;
        break;
    case 1:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            PlaySE(SE_WIN_OPEN);
            PrintItemDescription();
            sub_80966F4();
            gPSSData->state++;
        }
        break;
    case 2:
        if (!sub_8096728())
            gPSSData->state++;
        break;
    case 3:
        if (!IsDma3ManagerBusyWithBgCopy())
            gPSSData->state++;
        break;
    case 4:
        if (JOY_NEW(A_BUTTON | B_BUTTON | DPAD_ANY))
        {
            PlaySE(SE_WIN_OPEN);
            gPSSData->state++;
        }
        break;
    case 5:
        if (!sub_80967C0())
            gPSSData->state++;
        break;
    case 6:
        if (!IsDma3ManagerBusyWithBgCopy())
            SetPSSCallback(Cb_MainPSS);
        break;
    }
}

static void Cb_CloseBoxWhileHoldingItem(u8 taskId)
{
    switch (gPSSData->state)
    {
    case 0:
        PlaySE(SE_SELECT);
        PrintStorageActionText(PC_TEXT_PUT_IN_BAG);
        ShowYesNoWindow(0);
        gPSSData->state = 1;
        break;
    case 1:
        switch (Menu_ProcessInputNoWrapClearOnChoose())
        {
        case MENU_B_PRESSED:
        case 1:
            ClearBottomWindow();
            SetPSSCallback(Cb_MainPSS);
            break;
        case 0:
            if (AddBagItem(gPSSData->movingItemId, 1) == TRUE)
            {
                ClearBottomWindow();
                gPSSData->state = 3;
            }
            else
            {
                PrintStorageActionText(PC_TEXT_BAG_FULL);
                gPSSData->state = 2;
            }
            break;
        }
        break;
    case 2:
        if (JOY_NEW(A_BUTTON | B_BUTTON | DPAD_ANY))
        {
            ClearBottomWindow();
            gPSSData->state = 5;
        }
        break;
    case 3:
        sub_8096088();
        gPSSData->state = 4;
        break;
    case 4:
        if (!IsItemIconAnimActive())
        {
            StartCursorAnim(0);
            SetPSSCallback(Cb_MainPSS);
        }
        break;
    case 5:
        if (!IsDma3ManagerBusyWithBgCopy())
            SetPSSCallback(Cb_MainPSS);
        break;
    }
}

static void Cb_HandleMovingMonFromParty(u8 taskId)
{
    switch (gPSSData->state)
    {
    case 0:
        CompactPartySlots();
        sub_80909F4();
        gPSSData->state++;
        break;
    case 1:
        if (!sub_8090A60())
        {
            sub_808FAA8();
            SetPSSCallback(Cb_MainPSS);
        }
        break;
    }
}

static void Cb_PrintCantStoreMail(u8 taskId)
{
    switch (gPSSData->state)
    {
    case 0:
        PrintStorageActionText(PC_TEXT_CANT_STORE_MAIL);
        gPSSData->state++;
        break;
    case 1:
        if (!IsDma3ManagerBusyWithBgCopy())
            gPSSData->state++;
        break;
    case 2:
        if (JOY_NEW(A_BUTTON | B_BUTTON | DPAD_ANY))
        {
            ClearBottomWindow();
            gPSSData->state++;
        }
        break;
    case 3:
        if (!IsDma3ManagerBusyWithBgCopy())
            SetPSSCallback(Cb_MainPSS);
        break;
    }
}

static void Cb_HandleBoxOptions(u8 taskId)
{
    switch (gPSSData->state)
    {
    case 0:
        PrintStorageActionText(PC_TEXT_WHAT_YOU_DO);
        AddMenu();
        gPSSData->state++;
        break;
    case 1:
        if (sub_8094F90())
            return;
        gPSSData->state++;
    case 2:
        switch (sub_8094F94())
        {
        case -1:
        case  0:
            AnimateBoxScrollArrows(TRUE);
            ClearBottomWindow();
            SetPSSCallback(Cb_MainPSS);
            break;
        case 11:
            PlaySE(SE_SELECT);
            SetPSSCallback(Cb_NameBox);
            break;
        case 10:
            PlaySE(SE_SELECT);
            ClearBottomWindow();
            SetPSSCallback(Cb_HandleWallpapers);
            break;
        case 9:
            PlaySE(SE_SELECT);
            ClearBottomWindow();
            SetPSSCallback(Cb_JumpBox);
            break;
        }
        break;
    }
}

static void Cb_HandleWallpapers(u8 taskId)
{
    switch (gPSSData->state)
    {
    case 0:
        AddWallpaperSetsMenu();
        PrintStorageActionText(PC_TEXT_PICK_A_THEME);
        gPSSData->state++;
        break;
    case 1:
        if (!sub_8094F90())
            gPSSData->state++;
        break;
    case 2:
        gPSSData->wallpaperSetId = sub_8094F94();
        switch (gPSSData->wallpaperSetId)
        {
        case -1:
            AnimateBoxScrollArrows(TRUE);
            ClearBottomWindow();
            SetPSSCallback(Cb_MainPSS);
            break;
        case 18 ... 21:
            PlaySE(SE_SELECT);
            sub_8095024();
            gPSSData->wallpaperSetId -= 18;
            gPSSData->state++;
            break;
        }
        break;
    case 3:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            AddWallpapersMenu(gPSSData->wallpaperSetId);
            PrintStorageActionText(PC_TEXT_PICK_A_WALLPAPER);
            gPSSData->state++;
        }
        break;
    case 4:
        gPSSData->wallpaperId = sub_8094F94();
        switch (gPSSData->wallpaperId)
        {
        case MENU_NOTHING_CHOSEN:
            break;
        case MENU_B_PRESSED:
            ClearBottomWindow();
            gPSSData->state = 0;
            break;
        default:
            PlaySE(SE_SELECT);
            ClearBottomWindow();
            gPSSData->wallpaperId -= 22;
            SetWallpaperForCurrentBox(gPSSData->wallpaperId);
            gPSSData->state++;
            break;
        }
        break;
    case 5:
        if (!DoWallpaperGfxChange())
        {
            AnimateBoxScrollArrows(TRUE);
            SetPSSCallback(Cb_MainPSS);
        }
        break;
    }
}

static void Cb_JumpBox(u8 taskId)
{
    switch (gPSSData->state)
    {
    case 0:
        PrintStorageActionText(PC_TEXT_JUMP_TO_WHICH_BOX);
        LoadBoxSelectionPopupSpriteGfx(&gPSSData->chooseBoxMenu, TAG_TILE_A, TAG_PAL_DAC7, 3, FALSE);
        sub_808C940(StorageGetCurrentBox());
        gPSSData->state++;
        break;
    case 1:
        gPSSData->newCurrBoxId = HandleBoxChooseSelectionInput();
        switch (gPSSData->newCurrBoxId)
        {
        case 200:
            break;
        default:
            ClearBottomWindow();
            sub_808C950();
            FreeBoxSelectionPopupSpriteGfx();
            if (gPSSData->newCurrBoxId == 201 || gPSSData->newCurrBoxId == StorageGetCurrentBox())
            {
                AnimateBoxScrollArrows(TRUE);
                SetPSSCallback(Cb_MainPSS);
            }
            else
            {
                gPSSData->state++;
            }
            break;
        }
        break;
    case 2:
        SetUpScrollToBox(gPSSData->newCurrBoxId);
        gPSSData->state++;
        break;
    case 3:
        if (!ScrollToBox())
        {
            SetCurrentBox(gPSSData->newCurrBoxId);
            SetPSSCallback(Cb_MainPSS);
        }
        break;
    }
}

static void Cb_NameBox(u8 taskId)
{
    switch (gPSSData->state)
    {
    case 0:
        SaveMovingMon();
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB_BLACK);
        gPSSData->state++;
        break;
    case 1:
        if (!UpdatePaletteFade())
        {
            sWhichToReshow = 1;
            gPSSData->screenChangeType = SCREEN_CHANGE_NAME_BOX;
            SetPSSCallback(Cb_ChangeScreen);
        }
        break;
    }
}

static void Cb_ShowMonSummary(u8 taskId)
{
    switch (gPSSData->state)
    {
    case 0:
        InitSummaryScreenData();
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB_BLACK);
        gPSSData->state++;
        break;
    case 1:
        if (!UpdatePaletteFade())
        {
            sWhichToReshow = 0;
            gPSSData->screenChangeType = SCREEN_CHANGE_SUMMARY_SCREEN;
            SetPSSCallback(Cb_ChangeScreen);
        }
        break;
    }
}

static void Cb_GiveItemFromBag(u8 taskId)
{
    switch (gPSSData->state)
    {
    case 0:
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB_BLACK);
        gPSSData->state++;
        break;
    case 1:
        if (!UpdatePaletteFade())
        {
            sWhichToReshow = 2;
            gPSSData->screenChangeType = SCREEN_CHANGE_ITEM_FROM_BAG;
            SetPSSCallback(Cb_ChangeScreen);
        }
        break;
    }
}

static void Cb_OnCloseBoxPressed(u8 taskId)
{
    switch (gPSSData->state)
    {
    case 0:
        if (IsMonBeingMoved())
        {
            PlaySE(SE_FAILURE);
            PrintStorageActionText(PC_TEXT_HOLDING_POKE);
            gPSSData->state = 1;
        }
        else if (IsActiveItemMoving())
        {
            SetPSSCallback(Cb_CloseBoxWhileHoldingItem);
        }
        else
        {
            PlaySE(SE_SELECT);
            PrintStorageActionText(PC_TEXT_EXIT_BOX);
            ShowYesNoWindow(0);
            gPSSData->state = 2;
        }
        break;
    case 1:
        if (JOY_NEW(A_BUTTON | B_BUTTON | DPAD_ANY))
        {
            ClearBottomWindow();
            SetPSSCallback(Cb_MainPSS);
        }
        break;
    case 2:
        switch (Menu_ProcessInputNoWrapClearOnChoose())
        {
        case MENU_B_PRESSED:
        case 1:
            ClearBottomWindow();
            SetPSSCallback(Cb_MainPSS);
            break;
        case 0:
            PlaySE(SE_PC_OFF);
            ClearBottomWindow();
            gPSSData->state++;
            break;
        }
        break;
    case 3:
        BeginPCScreenEffect_TurnOff(20, 0, 1);
        gPSSData->state++;
        break;
    case 4:
        if (!IsPCScreenEffectRunning_TurnOff())
        {
            sub_808FF70();
            gPlayerPartyCount = CalculatePlayerPartyCount();
            gPSSData->screenChangeType = SCREEN_CHANGE_EXIT_BOX;
            SetPSSCallback(Cb_ChangeScreen);
        }
        break;
    }
}

static void Cb_OnBPressed(u8 taskId)
{
    switch (gPSSData->state)
    {
    case 0:
        if (IsMonBeingMoved())
        {
            PlaySE(SE_FAILURE);
            PrintStorageActionText(PC_TEXT_HOLDING_POKE);
            gPSSData->state = 1;
        }
        else if (IsActiveItemMoving())
        {
            SetPSSCallback(Cb_CloseBoxWhileHoldingItem);
        }
        else
        {
            PlaySE(SE_SELECT);
            PrintStorageActionText(PC_TEXT_CONTINUE_BOX);
            ShowYesNoWindow(0);
            gPSSData->state = 2;
        }
        break;
    case 1:
        if (JOY_NEW(A_BUTTON | B_BUTTON | DPAD_ANY))
        {
            ClearBottomWindow();
            SetPSSCallback(Cb_MainPSS);
        }
        break;
    case 2:
        switch (Menu_ProcessInputNoWrapClearOnChoose())
        {
        case 0:
            ClearBottomWindow();
            SetPSSCallback(Cb_MainPSS);
            break;
        case 1:
        case MENU_B_PRESSED:
            PlaySE(SE_PC_OFF);
            ClearBottomWindow();
            gPSSData->state++;
            break;
        }
        break;
    case 3:
        BeginPCScreenEffect_TurnOff(20, 0, 0);
        gPSSData->state++;
        break;
    case 4:
        if (!IsPCScreenEffectRunning_TurnOff())
        {
            sub_808FF70();
            gPlayerPartyCount = CalculatePlayerPartyCount();
            gPSSData->screenChangeType = SCREEN_CHANGE_EXIT_BOX;
            SetPSSCallback(Cb_ChangeScreen);
        }
        break;
    }
}

static void Cb_ChangeScreen(u8 taskId)
{
    struct Pokemon * partyMon;
    u8 mode, monIndex, maxMonIndex;
    u8 screenChangeType = gPSSData->screenChangeType;

    if (gPSSData->boxOption == BOX_OPTION_MOVE_ITEMS && IsActiveItemMoving() == TRUE)
        sMovingItemId = GetMovingItem();
    else
        sMovingItemId = ITEM_NONE;

    switch (screenChangeType)
    {
    case SCREEN_CHANGE_EXIT_BOX:
    default:
        FreePSSData();
        SetMainCallback2(Cb2_ExitPSS);
        break;
    case SCREEN_CHANGE_SUMMARY_SCREEN:
        partyMon = gPSSData->summaryMon.mon;
        monIndex = gPSSData->summaryStartPos;
        maxMonIndex = gPSSData->summaryMaxPos;
        mode = gPSSData->summaryScreenMode;
        FreePSSData();
        ShowPokemonSummaryScreen(partyMon, monIndex, maxMonIndex, Cb2_ReturnToPSS, mode);
        break;
    case SCREEN_CHANGE_NAME_BOX:
        FreePSSData();
        DoNamingScreen(NAMING_SCREEN_BOX, GetBoxNamePtr(StorageGetCurrentBox()), 0, 0, 0, Cb2_ReturnToPSS);
        break;
    case SCREEN_CHANGE_ITEM_FROM_BAG:
        FreePSSData();
        GoToBagMenu(ITEMMENULOCATION_PCBOX, OPEN_BAG_ITEMS, Cb2_ReturnToPSS);
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

static void FreePSSData(void)
{
    FreeBoxPartyPokemonDropdowns();
    sub_80950A4();
    FREE_AND_SET_NULL(gPSSData);
    FreeAllWindowBuffers();
}

// ******************************************************************
// Graphics util
// ******************************************************************

static void SetScrollingBackground(void)
{
    SetGpuReg(REG_OFFSET_BG3CNT, BGCNT_PRIORITY(3) | BGCNT_CHARBASE(3) | BGCNT_16COLOR | BGCNT_SCREENBASE(31));
    DecompressAndLoadBgGfxUsingHeap(3, sPokemonStorageScrollingBGTileset, 0, 0, 0);
    LZ77UnCompVram(sPokemonStorageScrollingBGTilemap, (void *)BG_SCREEN_ADDR(31));
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
    LZ77UnCompWram(gPSS_BG1Tilemap, gPSSData->displayMenuTilemapBuffer);
    SetBgTilemapBuffer(1, gPSSData->displayMenuTilemapBuffer);
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

static void sub_808F078(void)
{
    LoadPalette(gUnknown_8E9C3F8, 0, 0x20);
    LoadPalette(gUnknown_8E9C418, 0x20, 0x20);
    LoadPalette(gUnknown_83CEA10, 0xF0, 0x20);
    if (gPSSData->boxOption != BOX_OPTION_MOVE_ITEMS)
        LoadPalette(gUnknown_83CE738, 0x30, 0x20);
    else
        LoadPalette(gUnknown_83CE758, 0x30, 0x20);

    SetGpuReg(REG_OFFSET_BG1CNT, BGCNT_PRIORITY(1) | BGCNT_CHARBASE(1) | BGCNT_16COLOR | BGCNT_SCREENBASE(30));
    LoadCursorMonSprite();
    PSS_CreateMonMarkingSprite();
    CreateWaveformSprites();
    RefreshCursorMonData();
}

static void PSS_CreateMonMarkingSprite(void)
{
    gPSSData->markingComboSprite = CreateMonMarkingSprite_AllOff(TAG_TILE_10, TAG_PAL_DAC8, NULL);
    gPSSData->markingComboSprite->oam.priority = 1;
    gPSSData->markingComboSprite->subpriority = 1;
    gPSSData->markingComboSprite->pos1.x = 40;
    gPSSData->markingComboSprite->pos1.y = 150;
    gPSSData->markingComboTilesPtr = (void *)OBJ_VRAM0 + 32 * GetSpriteTileStartByTag(TAG_TILE_10);
}

static void CreateWaveformSprites(void)
{
    u16 i;
    struct SpriteSheet sheet = sWaveformSpriteSheet;

    LoadSpriteSheet(&sheet);
    for (i = 0; i < 2; i++)
    {
        u8 spriteId = CreateSprite(&sSpriteTemplate_Waveform, i * 63 + 8, 9, 2);
        gPSSData->waveformSprites[i] = &gSprites[spriteId];
    }
}

static void RefreshCursorMonData(void)
{
    LoadCursorMonGfx(gPSSData->displayMonSpecies, gPSSData->displayMonPersonality);
    PrintCursorMonInfo();
    sub_808F5E8();
    ScheduleBgCopyTilemapToVram(0);
}

#define sMosaicSize      data[0]
#define sMosaicSpeed     data[1]

static void BoxSetMosaic(void)
{
    RefreshCursorMonData();
    if (gPSSData->displayMonSprite)
    {
        gPSSData->displayMonSprite->oam.mosaic = TRUE;
        gPSSData->displayMonSprite->sMosaicSize = 10;
        gPSSData->displayMonSprite->sMosaicSpeed = 1;
        gPSSData->displayMonSprite->callback = SpriteCB_CursorMon_Mosaic;
        SetGpuReg(REG_OFFSET_MOSAIC, (gPSSData->displayMonSprite->sMosaicSize << MOSAIC_OBJ_VSIZE_SHIFT) | (gPSSData->displayMonSprite->sMosaicSize << MOSAIC_OBJ_HSIZE_SHIFT));
    }
}

static u8 BoxGetMosaic(void)
{
    return gPSSData->displayMonSprite->oam.mosaic;
}

static void SpriteCB_CursorMon_Mosaic(struct Sprite *sprite)
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

static void LoadCursorMonSprite(void)
{
    u16 i;
    u16 tileStart;
    u8 palSlot;
    u8 spriteId;
    struct SpriteSheet sheet = {gPSSData->tileBuffer, 0x800, TAG_TILE_2};
    struct SpritePalette palette = {gPSSData->displayMonPalBuffer, TAG_PAL_DAC6};
    struct SpriteTemplate template = sSpriteTemplate_CursorMon;

    for (i = 0; i < 0x800; i++)
        gPSSData->tileBuffer[i] = 0;
    for (i = 0; i < 0x10; i++)
        gPSSData->displayMonPalBuffer[i] = 0;

    gPSSData->displayMonSprite = NULL;

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

        gPSSData->displayMonSprite = &gSprites[spriteId];
        gPSSData->displayMonPalOffset = palSlot * 16 + 0x100;
        gPSSData->displayMonTilePtr = (void *)OBJ_VRAM0 + tileStart * 32;
    } while (0);

    if (gPSSData->displayMonSprite == NULL)
    {
        FreeSpriteTilesByTag(TAG_TILE_2);
        FreeSpritePaletteByTag(TAG_PAL_DAC6);
    }
}

static void LoadCursorMonGfx(u16 species, u32 pid)
{
    if (gPSSData->displayMonSprite == NULL)
        return;

    if (species != SPECIES_NONE)
    {
        HandleLoadSpecialPokePic(&gMonFrontPicTable[species], gPSSData->tileBuffer, species, pid);
        LZ77UnCompWram(gPSSData->displayMonPalette, gPSSData->displayMonPalBuffer);
        CpuCopy32(gPSSData->tileBuffer, gPSSData->displayMonTilePtr, 0x800);
        LoadPalette(gPSSData->displayMonPalBuffer, gPSSData->displayMonPalOffset, 0x20);
        gPSSData->displayMonSprite->invisible = FALSE;
    }
    else
    {
        gPSSData->displayMonSprite->invisible = TRUE;
    }
}

static void PrintCursorMonInfo(void)
{
    u16 i;
    u16 y;
    FillWindowPixelBuffer(PSS_WIN_0, PIXEL_FILL(1));
    if (gPSSData->boxOption != BOX_OPTION_MOVE_ITEMS)
    {
        for (i = 0, y = 0; i < 3; i++, y += 14)
        {
            AddTextPrinterParameterized(PSS_WIN_0, 2, gPSSData->cursorMonTexts[i], i == 2 ? 10 : 6, y, TEXT_SPEED_FF, NULL);
        }
        AddTextPrinterParameterized(PSS_WIN_0, 0, gPSSData->cursorMonTexts[3], 6, y + 2, TEXT_SPEED_FF, NULL);
    }
    else
    {
        AddTextPrinterParameterized(PSS_WIN_0, 0, gPSSData->cursorMonTexts[3], 6, 0, TEXT_SPEED_FF, NULL);
        for (i = 0, y = 15; i < 3; i++, y += 14)
        {
            AddTextPrinterParameterized(PSS_WIN_0, 2, gPSSData->cursorMonTexts[i], i == 2 ? 10 : 6, y, TEXT_SPEED_FF, NULL);
        }
    }

    CopyWindowToVram(PSS_WIN_0, COPYWIN_GFX);
    if (gPSSData->displayMonSpecies != SPECIES_NONE)
    {
        RequestDma3LoadMonMarking(gPSSData->cursorMonMarkings, gPSSData->markingComboTilesPtr);
        gPSSData->markingComboSprite->invisible = FALSE;
    }
    else
    {
        gPSSData->markingComboSprite->invisible = TRUE;
    }
}

static void sub_808F5E8(void)
{
    u16 i;

    if (gPSSData->displayMonSpecies != SPECIES_NONE)
    {
        SetBoxPartyPokemonDropdownMap2Rect(PSS_DROPDOWN_0, 0, 0, 8, 2);
        for (i = 0; i < 2; i++)
            StartSpriteAnimIfDifferent(gPSSData->waveformSprites[i], i * 2 + 1);
    }
    else
    {
        SetBoxPartyPokemonDropdownMap2Rect(PSS_DROPDOWN_0, 0, 2, 8, 2);
        for (i = 0; i < 2; i++)
            StartSpriteAnim(gPSSData->waveformSprites[i], i * 2);
    }

    CopyBoxPartyPokemonDropdownToBgTilemapBuffer(PSS_DROPDOWN_0);
    ScheduleBgCopyTilemapToVram(1);
}

static void sub_808F68C(void)
{
    LZ77UnCompWram(gUnknown_8E9CAEC, gPSSData->partyMenuTilemapBuffer);
    LoadPalette(gPSSMenu_Pal, 0x10, 0x20);
    SetBoxPartyPokemonDropdownMap2(PSS_DROPDOWN_1, 1, gPSSData->partyMenuTilemapBuffer, 12, 22);
    SetBoxPartyPokemonDropdownMap2(PSS_DROPDOWN_2, 1, sBoxPartyPokemonDropdown2_Map2, 9, 4);
    SetBoxPartyPokemonDropdownMap2Pos(PSS_DROPDOWN_1, 10, 0);
    SetBoxPartyPokemonDropdownMap2Pos(PSS_DROPDOWN_2, 21, 0);
    sub_808F9FC();
    if (sInPartyMenu)
    {
        sub_808F90C(TRUE);
        CreatePartyMonsSprites(TRUE);
        CopyBoxPartyPokemonDropdownToBgTilemapBuffer(PSS_DROPDOWN_2);
        CopyBoxPartyPokemonDropdownToBgTilemapBuffer(PSS_DROPDOWN_1);
    }
    else
    {
        SetBoxPartyPokemonDropdownMap2Rect(PSS_DROPDOWN_1, 0, 20, 12, 2);
        sub_808F90C(TRUE);
        CopyBoxPartyPokemonDropdownToBgTilemapBuffer(PSS_DROPDOWN_1);
        CopyBoxPartyPokemonDropdownToBgTilemapBuffer(PSS_DROPDOWN_2);
    }

    ScheduleBgCopyTilemapToVram(1);
    gPSSData->closeBoxFlashing = FALSE;
}

static void SetUpShowPartyMenu(void)
{
    gPSSData->partyMenuUnused1 = 20;
    gPSSData->partyMenuY = 2;
    gPSSData->partyMenuMoveTimer = 0;
    CreatePartyMonsSprites(FALSE);
}

static bool8 ShowPartyMenu(void)
{
    if (gPSSData->partyMenuMoveTimer == 20)
        return FALSE;

    gPSSData->partyMenuUnused1--;
    gPSSData->partyMenuY++;
    AdjustBoxPartyPokemonDropdownPos(PSS_DROPDOWN_1, BPPD_MOVE_OUTER_TOP, 1);
    CopyBoxPartyPokemonDropdownToBgTilemapBuffer(PSS_DROPDOWN_1);
    ScheduleBgCopyTilemapToVram(1);
    sub_8090B98(8);
    if (++gPSSData->partyMenuMoveTimer == 20)
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
    gPSSData->partyMenuUnused1 = 0;
    gPSSData->partyMenuY = 22;
    gPSSData->partyMenuMoveTimer = 0;
    if (gPSSData->boxOption == BOX_OPTION_MOVE_ITEMS)
        sub_80960C0();
}

static bool8 HidePartyMenu(void)
{
    if (gPSSData->partyMenuMoveTimer != 20)
    {
        gPSSData->partyMenuUnused1++;
        gPSSData->partyMenuY--;
        AdjustBoxPartyPokemonDropdownPos(PSS_DROPDOWN_1, BPPD_MOVE_OUTER_TOP, -1);
        CopyBoxPartyPokemonDropdownToBgTilemapBuffer(PSS_DROPDOWN_1);
        FillBgTilemapBufferRect_Palette0(1, 0x100, 10, gPSSData->partyMenuY, 12, 1);
        sub_8090B98(-8);
        if (++gPSSData->partyMenuMoveTimer != 20)
        {
            ScheduleBgCopyTilemapToVram(1);
            return TRUE;
        }
        else
        {
            sInPartyMenu = FALSE;
            DestroyAllPartyMonIcons();
            CompactPartySlots();
            SetBoxPartyPokemonDropdownMap2Rect(PSS_DROPDOWN_2, 0, 0, 9, 2);
            CopyBoxPartyPokemonDropdownToBgTilemapBuffer(PSS_DROPDOWN_2);
            ScheduleBgCopyTilemapToVram(1);
            return FALSE;
        }
    }

    return FALSE;
}

static void sub_808F90C(bool8 arg0)
{
    if (arg0)
        SetBoxPartyPokemonDropdownMap2Rect(PSS_DROPDOWN_2, 0, 0, 9, 2);
    else
        SetBoxPartyPokemonDropdownMap2Rect(PSS_DROPDOWN_2, 0, 2, 9, 2);

    CopyBoxPartyPokemonDropdownToBgTilemapBuffer(PSS_DROPDOWN_2);
    ScheduleBgCopyTilemapToVram(1);
}

static void sub_808F948(void)
{
    gPSSData->closeBoxFlashing = TRUE;
    gPSSData->closeBoxFlashTimer = 30;
    gPSSData->closeBoxFlashState = TRUE;
}

static void sub_808F974(void)
{
    if (gPSSData->closeBoxFlashing)
    {
        gPSSData->closeBoxFlashing = FALSE;
        sub_808F90C(TRUE);
    }
}

static void sub_808F99C(void)
{
    if (gPSSData->closeBoxFlashing && ++gPSSData->closeBoxFlashTimer > 30)
    {
        gPSSData->closeBoxFlashTimer = 0;
        gPSSData->closeBoxFlashState = (gPSSData->closeBoxFlashState == FALSE);
        sub_808F90C(gPSSData->closeBoxFlashState);
    }
}

static void sub_808F9FC(void)
{
    u8 i;

    for (i = 1; i < PARTY_SIZE; i++)
    {
        s32 species = GetMonData(gPlayerParty + i, MON_DATA_SPECIES);
        sub_808FA30(i, (species != SPECIES_NONE));
    }
}

static void sub_808FA30(u8 pos, bool8 isPartyMon)
{
    u16 i, j, index;
    const u16 *data;

    if (isPartyMon)
        data = gUnknown_83CE7C0;
    else
        data = gUnknown_83CE7D8;

    index = 3 * (3 * (pos - 1) + 1);
    index *= 4;
    index += 7;
    for (i = 0; i < 3; i++)
    {
        for (j = 0; j < 4; j++)
        {
            gPSSData->partyMenuTilemapBuffer[index + j] = data[j];
        }
        data += 4;
        index += 12;
    }
}

static void sub_808FAA8(void)
{
    sub_808F9FC();
    SetBoxPartyPokemonDropdownMap2Rect(PSS_DROPDOWN_1, 0, 0, 12, 22);
    CopyBoxPartyPokemonDropdownToBgTilemapBuffer(PSS_DROPDOWN_1);
    ScheduleBgCopyTilemapToVram(1);
}

static void SetUpDoShowPartyMenu(void)
{
    gPSSData->showPartyMenuState = 0;
    PlaySE(SE_WIN_OPEN);
    SetUpShowPartyMenu();
}

static bool8 DoShowPartyMenu(void)
{
    switch (gPSSData->showPartyMenuState)
    {
    case 0:
        if (!ShowPartyMenu())
        {
            SetCursorInParty();
            gPSSData->showPartyMenuState++;
        }
        break;
    case 1:
        if (!UpdateCursorPos())
        {
            if (gPSSData->setMosaic)
                BoxSetMosaic();
            gPSSData->showPartyMenuState++;
        }
        break;
    case 2:
        return FALSE;
    }
    return TRUE;
}

static void sub_808FB68(void)
{
    SetGpuReg(REG_OFFSET_BG0CNT, BGCNT_PRIORITY(0) | BGCNT_CHARBASE(0) | BGCNT_SCREENBASE(29));
    TextWindow_SetStdFrame0_WithPal(PSS_WIN_1, 2, 208);
    FillBgTilemapBufferRect(0, 0, 0, 0, 32, 20, 17);
    CopyBgTilemapBufferToVram(0);
}

static void PrintStorageActionText(u8 id)
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
        DynamicPlaceholderTextUtil_SetPlaceholderPtr(0, gPSSData->cursorMonNick);
        break;
    case PC_TEXT_FMT_MON_NAME_4:
    case PC_TEXT_FMT_MON_NAME_5:
    case PC_TEXT_FMT_MON_NAME_6:
        DynamicPlaceholderTextUtil_SetPlaceholderPtr(0, gPSSData->releaseMonName);
        break;
    case PC_TEXT_FMT_ITEM_NAME:
        if (IsActiveItemMoving())
            txtPtr = StringCopy(gPSSData->itemName, GetMovingItemName());
        else
            txtPtr = StringCopy(gPSSData->itemName, gPSSData->cursorMonTexts[3]);

        while (*(txtPtr - 1) == CHAR_SPACE)
            txtPtr--;

        *txtPtr = EOS;
        DynamicPlaceholderTextUtil_SetPlaceholderPtr(0, gPSSData->itemName);
        break;
    }

    DynamicPlaceholderTextUtil_ExpandPlaceholders(gPSSData->messageText, sPCStorageActionTexts[id].text);
    FillWindowPixelBuffer(PSS_WIN_1, PIXEL_FILL(1));
    AddTextPrinterParameterized(PSS_WIN_1, 1, gPSSData->messageText, 0, 2, TEXT_SPEED_FF, NULL);
    DrawTextBorderOuter(PSS_WIN_1, 2, 13);
    PutWindowTilemap(PSS_WIN_1);
    CopyWindowToVram(PSS_WIN_1, COPYWIN_GFX);
    ScheduleBgCopyTilemapToVram(0);
}

static void ShowYesNoWindow(s8 cursorPos)
{
    CreateYesNoMenu(&sYesNoWindowTemplate, 1, 0, 2, 0x00b, 14, 1);
    Menu_MoveCursorNoWrapAround(cursorPos);
}

static void ClearBottomWindow(void)
{
    ClearStdWindowAndFrameToTransparent(1, FALSE);
    ScheduleBgCopyTilemapToVram(0);
}

static void AddWallpaperSetsMenu(void)
{
    InitMenu();
    SetMenuText(PC_TEXT_SCENERY1);
    SetMenuText(PC_TEXT_SCENERY2);
    SetMenuText(PC_TEXT_SCENERY3);
    SetMenuText(PC_TEXT_ETCETERA);
    AddMenu();
}

static void AddWallpapersMenu(u8 wallpaperSet)
{
    InitMenu();
    switch (wallpaperSet)
    {
    case 0:
        SetMenuText(PC_TEXT_FOREST);
        SetMenuText(PC_TEXT_CITY);
        SetMenuText(PC_TEXT_DESERT);
        SetMenuText(PC_TEXT_SAVANNA);
        break;
    case 1:
        SetMenuText(PC_TEXT_CRAG);
        SetMenuText(PC_TEXT_VOLCANO);
        SetMenuText(PC_TEXT_SNOW);
        SetMenuText(PC_TEXT_CAVE);
        break;
    case 2:
        SetMenuText(PC_TEXT_BEACH);
        SetMenuText(PC_TEXT_SEAFLOOR);
        SetMenuText(PC_TEXT_RIVER);
        SetMenuText(PC_TEXT_SKY);
        break;
    case 3:
        SetMenuText(PC_TEXT_POLKADOT);
        SetMenuText(PC_TEXT_POKECENTER);
        SetMenuText(PC_TEXT_MACHINE);
        SetMenuText(PC_TEXT_SIMPLE);
        break;
    }
    AddMenu();
}

u8 GetCurrentBoxOption(void)
{
    return sCurrentBoxOption;
}

static void sub_808FDFC(void)
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
        sub_8095E2C(sMovingItemId);
        StartCursorAnim(3);
    }
}

static void sub_808FE54(u8 action)
{
    u16 event;
    u8 fromBox = PSS_GetMovingMonOrigBoxId();
    u16 species = gPSSData->displayMonSpecies;
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
    qlogBuffer = &gPSSData->qlogBuffer;

    switch (action)
    {
    default:
        return;
    case 0:
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
    case 1:
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
    case 2:
        event = QL_EVENT_DEPOSITED_MON_PC;
        qlogBuffer->species = species;
        qlogBuffer->species2 = SPECIES_NONE;
        qlogBuffer->fromBox = sDepositingBoxId;
        qlogBuffer->toBox = 0xFF;
        break;
    case 3:
        event = QL_EVENT_SWITCHED_MULTIPLE_MONS;
        qlogBuffer->species = SPECIES_NONE;
        qlogBuffer->species2 = SPECIES_NONE;
        qlogBuffer->fromBox = fromBox;
        qlogBuffer->toBox = toBox;
        break;
    }
    SetQuestLogEvent(event, (const void *)qlogBuffer);
}

static void sub_808FF70(void)
{
    if (sLastUsedBox != StorageGetCurrentBox())
    {
        FlagClear(FLAG_SHOWN_BOX_WAS_FULL_MESSAGE);
        VarSet(VAR_PC_BOX_TO_SEND_MON, StorageGetCurrentBox());
    }
}
