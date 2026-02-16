#include "global.h"
#include "battle_pike.h"
#include "battle_pyramid_bag.h"
#include "battle_pyramid.h"
#include "bg.h"
#include "debug.h"
#include "dexnav.h"
#include "event_data.h"
#include "event_object_lock.h"
#include "event_object_movement.h"
#include "event_scripts.h"
#include "field_fadetransition.h"
#include "field_player_avatar.h"
#include "field_specials.h"
#include "field_weather.h"
#include "fieldmap.h"
#include "frontier_pass.h"
#include "gpu_regs.h"
#include "help_message.h"
#include "help_system.h"
#include "item_menu.h"
#include "link_rfu.h"
#include "link.h"
#include "load_save.h"
#include "menu_helpers.h"
#include "menu.h"
#include "new_game.h"
#include "option_menu.h"
#include "overworld.h"
#include "palette.h"
#include "party_menu.h"
#include "pokedex_screen.h"
#include "pokedex.h"
#include "quest_log.h"
#include "rtc.h"
#include "safari_zone.h"
#include "save.h"
#include "scanline_effect.h"
#include "script.h"
#include "sound.h"
#include "start_menu.h"
#include "string_util.h"
#include "strings.h"
#include "text_window.h"
#include "trainer_card.h"
#include "wild_encounter.h"
#include "constants/battle_frontier.h"
#include "constants/songs.h"
#include "constants/field_weather.h"

enum StartMenuOption
{
    MENU_ACTION_POKEDEX = 0,
    MENU_ACTION_POKEMON,
    MENU_ACTION_BAG,
    MENU_ACTION_PLAYER,
    MENU_ACTION_SAVE,
    MENU_ACTION_OPTION,
    MENU_ACTION_EXIT,
    MENU_ACTION_RETIRE_SAFARI,
    MENU_ACTION_PLAYER_LINK,
    MENU_ACTION_REST_FRONTIER,
    MENU_ACTION_RETIRE_FRONTIER,
    MENU_ACTION_PYRAMID_BAG,
    MENU_ACTION_DEBUG,
    MENU_ACTION_DEXNAV,
    MAX_STARTMENU_ITEMS
};

enum SaveCBReturn
{
    SAVE_IN_PROGRESS = 0,
    SAVE_SUCCESS,
    SAVE_CANCELED,
    SAVE_ERROR
};

static EWRAM_DATA bool8 (*gMenuCallback)(void) = NULL;
static EWRAM_DATA u8 sStartMenuCursorPos = 0;
static EWRAM_DATA u8 sNumStartMenuItems = 0;
static EWRAM_DATA u8 sCurrentStartMenuActions[MAX_STARTMENU_ITEMS] = {};
static EWRAM_DATA s8 sInitStartMenuData[2] = {};
static EWRAM_DATA u8 sSafariZoneStatsWindowId = 0;
EWRAM_DATA static u8 sBattlePyramidFloorWindowId = 0;
static EWRAM_INIT u8 sTimeWindowId = WINDOW_NONE;
static ALIGNED(4) EWRAM_DATA u8 sSaveStatsWindowId = 0;

static u8 (*sSaveDialogCallback)(void);
static u8 sSaveDialogDelay;
static bool8 sSavingComplete;

static void BuildLinkModeStartMenu(void);
static void BuildUnionRoomStartMenu(void);
static void BuildSafariZoneStartMenu(void);
static void BuildNormalStartMenu(void);
static void BuildBattlePikeStartMenu(void);
static void BuildBattlePyramidStartMenu(void);
static void BuildMultiPartnerRoomStartMenu(void);
static void BuildDebugStartMenu(void);

static bool8 HandleStartMenuInput(void);
static void StartMenu_FadeScreenIfLeavingOverworld(void);
static bool8 StartMenuPokedexSanityCheck(void);
static bool8 StartMenuPokedexCallback(void);
static bool8 StartMenuPokemonCallback(void);
static bool8 StartMenuBagCallback(void);
static bool8 StartMenuPlayerNameCallback(void);
static bool8 StartMenuSaveCallback(void);
static bool8 StartMenuOptionCallback(void);
static bool8 StartMenuExitCallback(void);
static bool8 StartMenuSafariZoneRetireCallback(void);
static bool8 StartMenuLinkPlayerCallback(void);
static bool8 StartMenuBattlePyramidRetireCallback(void);
static bool8 StartMenuBattlePyramidBagCallback(void);
static bool8 StartMenuDebugCallback(void);
static bool8 StartMenuDexNavCallback(void);

static bool8 BattlePyramidRetireStartCallback(void);
static bool8 BattlePyramidRetireReturnCallback(void);
static bool8 BattlePyramidRetireCallback(void);
static bool8 SaveStartCallback(void);
static bool8 SaveCallback(void);
static void InitSave(void);
static u8 RunSaveCallback(void);
static void SaveGameTask(u8 taskId);
static u8 SaveConfirmSaveCallback(void);
static u8 SaveYesNoCallback(void);
static u8 SaveConfirmInputCallback(void);
static u8 SaveFileExistsCallback(void);
static u8 SaveConfirmOverwriteCallback(void);
static u8 SaveConfirmOverwriteDefaultNoCallback(void);
static u8 SaveOverwriteInputCallback(void);
static u8 SaveSavingMessageCallback(void);
static u8 SaveDoSaveCallback(void);
static u8 SaveSuccessCallback(void);
static u8 SaveReturnSuccessCallback(void);
static u8 SaveErrorCallback(void);
static u8 SaveReturnErrorCallback(void);
static void CB2_WhileSavingAfterLinkBattle(void);
static void Task_SaveAfterLinkBattle(u8 taskId);
static void ShowSaveInfoWindow(void);
static void RemoveSaveInfoWindow(void);
static void DestroyTimeWindow(void);
static void HideStartMenuDebug(void);
static void InitBattlePyramidRetire(void);
static u8 BattlePyramidConfirmRetireCallback(void);
static u8 BattlePyramidRetireYesNoCallback(void);
static u8 BattlePyramidRetireInputCallback(void);

static const u8 sText_MenuDebug[] = _("DEBUG");

static const struct MenuAction sStartMenuActionTable[] = {
    [MENU_ACTION_POKEDEX]           = {gText_MenuPokedex, {.u8_void = StartMenuPokedexCallback}},
    [MENU_ACTION_POKEMON]           = {gText_MenuPokemon, {.u8_void = StartMenuPokemonCallback}},
    [MENU_ACTION_BAG]               = {gText_MenuBag,     {.u8_void = StartMenuBagCallback}},
    [MENU_ACTION_PLAYER]            = {gText_MenuPlayer,  {.u8_void = StartMenuPlayerNameCallback}},
    [MENU_ACTION_SAVE]              = {gText_MenuSave,    {.u8_void = StartMenuSaveCallback}},
    [MENU_ACTION_OPTION]            = {gText_MenuOption,  {.u8_void = StartMenuOptionCallback}},
    [MENU_ACTION_EXIT]              = {gText_MenuExit,    {.u8_void = StartMenuExitCallback}},
    [MENU_ACTION_RETIRE_SAFARI]     = {gText_MenuRetire,  {.u8_void = StartMenuSafariZoneRetireCallback}},
    [MENU_ACTION_PLAYER_LINK]       = {gText_MenuPlayer,  {.u8_void = StartMenuLinkPlayerCallback}},
    [MENU_ACTION_REST_FRONTIER]     = {gText_MenuRest,    {.u8_void = StartMenuSaveCallback}},
    [MENU_ACTION_RETIRE_FRONTIER]   = {gText_MenuRetire,  {.u8_void = StartMenuBattlePyramidRetireCallback}},
    [MENU_ACTION_PYRAMID_BAG]       = {gText_MenuBag,     {.u8_void = StartMenuBattlePyramidBagCallback}},
    [MENU_ACTION_DEBUG]             = {sText_MenuDebug,   {.u8_void = StartMenuDebugCallback}},
    [MENU_ACTION_DEXNAV]            = {gText_MenuDexNav,  {.u8_void = StartMenuDexNavCallback}},
};

static const struct WindowTemplate sTimeWindowTemplate = {
    .bg = 0,
    .tilemapLeft = 1,
    .tilemapTop = 1,
    .width = 10,
    .height = 4,
    .paletteNum = 15,
    .baseBlock = 0x1A8
};

static const struct WindowTemplate sWindowTemplate_SafariZoneStats = {
    .bg = 0,
    .tilemapLeft = 1,
    .tilemapTop = 1,
    .width = 10,
    .height = 4,
    .paletteNum = 15,
    .baseBlock = 0x008
};

static const u8 *const sPyramidFloorNames[FRONTIER_STAGES_PER_CHALLENGE + 1] =
{
    gText_Floor1,
    gText_Floor2,
    gText_Floor3,
    gText_Floor4,
    gText_Floor5,
    gText_Floor6,
    gText_Floor7,
    gText_Peak
};

static const struct WindowTemplate sWindowTemplate_PyramidFloor = {
    .bg = 0,
    .tilemapLeft = 1,
    .tilemapTop = 1,
    .width = 10,
    .height = 4,
    .paletteNum = 15,
    .baseBlock = 0x8
};

static const struct WindowTemplate sWindowTemplate_PyramidPeak = {
    .bg = 0,
    .tilemapLeft = 1,
    .tilemapTop = 1,
    .width = 12,
    .height = 4,
    .paletteNum = 15,
    .baseBlock = 0x8
};

static const u8 *const sStartMenuDescPointers[] = {
    gStartMenuDesc_Pokedex,
    gStartMenuDesc_Pokemon,
    gStartMenuDesc_Bag,
    gStartMenuDesc_Player,
    gStartMenuDesc_Save,
    gStartMenuDesc_Option,
    gStartMenuDesc_Exit,
    gStartMenuDesc_Retire,
    gStartMenuDesc_Player,
    gStartMenuDesc_Debug,
};

static const struct BgTemplate sBGTemplates_AfterLinkSaveMessage[] = {
    {
        .bg = 0,
        .charBaseIndex = 2,
        .mapBaseIndex = 31,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 0,
        .baseTile = 0x000
    }
};

static const struct WindowTemplate sWindowTemplates_AfterLinkSaveMessage[] = {
    {
        .bg = 0,
        .tilemapLeft = 2,
        .tilemapTop = 15,
        .width = 26,
        .height = 4,
        .paletteNum = 15,
        .baseBlock = 0x198
    }, DUMMY_WIN_TEMPLATE
};

static const struct WindowTemplate sSaveStatsWindowTemplate = {
    .bg = 0,
    .tilemapLeft = 1,
    .tilemapTop = 1,
    .width = 14,
    .height = 9,
    .paletteNum = 13,
    .baseBlock = 0x008
};

static ALIGNED(2) const u8 sTextColor_StatName[] = { 1, 2, 3 };
static ALIGNED(2) const u8 sTextColor_StatValue[] = { 1, 4, 5 };
static ALIGNED(2) const u8 sTextColor_LocationHeader[] = { 1, 6, 7 };

static void BuildStartMenuActions(void)
{
    sNumStartMenuItems = 0;

    if (IsOverworldLinkActive() == TRUE)
        BuildLinkModeStartMenu();
    else if (InUnionRoom() == TRUE)
        BuildUnionRoomStartMenu();
    else if (GetSafariZoneFlag() == TRUE)
        BuildSafariZoneStartMenu();
    else if (InBattlePike())
        BuildBattlePikeStartMenu();
    else if (CurrentBattlePyramidLocation() != PYRAMID_LOCATION_NONE)
        BuildBattlePyramidStartMenu();
    else if (InMultiPartnerRoom())
        BuildMultiPartnerRoomStartMenu();
    else if (DEBUG_OVERWORLD_MENU && DEBUG_OVERWORLD_IN_MENU)
        BuildDebugStartMenu();
    else
        BuildNormalStartMenu();
}

static void AddStartMenuAction(u8 newEntry)
{
    AppendToList(sCurrentStartMenuActions, &sNumStartMenuItems, newEntry);
}

static void BuildDebugStartMenu(void)
{
    AddStartMenuAction(MENU_ACTION_DEBUG);
    if (FlagGet(FLAG_SYS_POKEDEX_GET) == TRUE)
        AddStartMenuAction(MENU_ACTION_POKEDEX);
    if (FlagGet(FLAG_SYS_POKEMON_GET) == TRUE)
        AddStartMenuAction(MENU_ACTION_POKEMON);
    AddStartMenuAction(MENU_ACTION_BAG);
    AddStartMenuAction(MENU_ACTION_PLAYER);
    AddStartMenuAction(MENU_ACTION_SAVE);
    AddStartMenuAction(MENU_ACTION_OPTION);
    AddStartMenuAction(MENU_ACTION_EXIT);
}

static void BuildNormalStartMenu(void)
{
    if (FlagGet(FLAG_SYS_POKEDEX_GET) == TRUE)
        AddStartMenuAction(MENU_ACTION_POKEDEX);
    if (DN_FLAG_DEXNAV_GET != 0 && FlagGet(DN_FLAG_DEXNAV_GET))
        AddStartMenuAction(MENU_ACTION_DEXNAV);
    if (FlagGet(FLAG_SYS_POKEMON_GET) == TRUE)
        AddStartMenuAction(MENU_ACTION_POKEMON);
    AddStartMenuAction(MENU_ACTION_BAG);
    AddStartMenuAction(MENU_ACTION_PLAYER);
    AddStartMenuAction(MENU_ACTION_SAVE);
    AddStartMenuAction(MENU_ACTION_OPTION);
    AddStartMenuAction(MENU_ACTION_EXIT);
}

static void BuildSafariZoneStartMenu(void)
{
    AddStartMenuAction(MENU_ACTION_RETIRE_SAFARI);
    AddStartMenuAction(MENU_ACTION_POKEDEX);
    AddStartMenuAction(MENU_ACTION_POKEMON);
    AddStartMenuAction(MENU_ACTION_BAG);
    AddStartMenuAction(MENU_ACTION_PLAYER);
    AddStartMenuAction(MENU_ACTION_OPTION);
    AddStartMenuAction(MENU_ACTION_EXIT);
}

static void BuildLinkModeStartMenu(void)
{
    AddStartMenuAction(MENU_ACTION_POKEMON);
    AddStartMenuAction(MENU_ACTION_BAG);
    AddStartMenuAction(MENU_ACTION_PLAYER_LINK);
    AddStartMenuAction(MENU_ACTION_OPTION);
    AddStartMenuAction(MENU_ACTION_EXIT);
}

static void BuildUnionRoomStartMenu(void)
{
    AddStartMenuAction(MENU_ACTION_POKEMON);
    AddStartMenuAction(MENU_ACTION_BAG);
    AddStartMenuAction(MENU_ACTION_PLAYER);
    AddStartMenuAction(MENU_ACTION_OPTION);
    AddStartMenuAction(MENU_ACTION_EXIT);
}

static void BuildBattlePikeStartMenu(void)
{
    AddStartMenuAction(MENU_ACTION_POKEDEX);
    AddStartMenuAction(MENU_ACTION_POKEMON);
    AddStartMenuAction(MENU_ACTION_PLAYER);
    AddStartMenuAction(MENU_ACTION_OPTION);
    AddStartMenuAction(MENU_ACTION_EXIT);
}

static void BuildBattlePyramidStartMenu(void)
{
    AddStartMenuAction(MENU_ACTION_POKEMON);
    AddStartMenuAction(MENU_ACTION_PYRAMID_BAG);
    AddStartMenuAction(MENU_ACTION_PLAYER);
    AddStartMenuAction(MENU_ACTION_REST_FRONTIER);
    AddStartMenuAction(MENU_ACTION_RETIRE_FRONTIER);
    AddStartMenuAction(MENU_ACTION_OPTION);
    AddStartMenuAction(MENU_ACTION_EXIT);
}

static void BuildMultiPartnerRoomStartMenu(void)
{
    AddStartMenuAction(MENU_ACTION_POKEMON);
    AddStartMenuAction(MENU_ACTION_PLAYER);
    AddStartMenuAction(MENU_ACTION_OPTION);
    AddStartMenuAction(MENU_ACTION_EXIT);
}

static void ShowSafariZoneStatsWindow(void)
{
    sSafariZoneStatsWindowId = AddWindow(&sWindowTemplate_SafariZoneStats);
    PutWindowTilemap(sSafariZoneStatsWindowId);
    DrawStdWindowFrame(sSafariZoneStatsWindowId, FALSE);
    ConvertIntToDecimalStringN(gStringVar1, gSafariZoneStepCounter, STR_CONV_MODE_RIGHT_ALIGN, 3);
    ConvertIntToDecimalStringN(gStringVar2, MAX_SAFARI_STEPS, STR_CONV_MODE_RIGHT_ALIGN, 3);
    ConvertIntToDecimalStringN(gStringVar3, gNumSafariBalls, STR_CONV_MODE_RIGHT_ALIGN, 2);
    StringExpandPlaceholders(gStringVar4, gText_MenuSafariStats);
    AddTextPrinterParameterized(sSafariZoneStatsWindowId, FONT_NORMAL, gStringVar4, 4, 3, 0xFF, NULL);
    CopyWindowToVram(sSafariZoneStatsWindowId, COPYWIN_GFX);
}

static void ShowPyramidFloorWindow(void)
{
    if (gSaveBlock2Ptr->frontier.curChallengeBattleNum == FRONTIER_STAGES_PER_CHALLENGE)
        sBattlePyramidFloorWindowId = AddWindow(&sWindowTemplate_PyramidPeak);
    else
        sBattlePyramidFloorWindowId = AddWindow(&sWindowTemplate_PyramidFloor);

    PutWindowTilemap(sBattlePyramidFloorWindowId);
    DrawStdWindowFrame(sBattlePyramidFloorWindowId, FALSE);
    StringCopy(gStringVar1, sPyramidFloorNames[gSaveBlock2Ptr->frontier.curChallengeBattleNum]);
    StringExpandPlaceholders(gStringVar4, gText_BattlePyramidFloor);
    AddTextPrinterParameterized(sBattlePyramidFloorWindowId, FONT_NORMAL, gStringVar4, 0, 1, TEXT_SKIP_DRAW, NULL);
    CopyWindowToVram(sBattlePyramidFloorWindowId, COPYWIN_GFX);
}

static void RemoveExtraStartMenuWindows(void)
{
    if (GetSafariZoneFlag())
    {
        ClearStdWindowAndFrameToTransparent(sSafariZoneStatsWindowId, FALSE);
        CopyWindowToVram(sSafariZoneStatsWindowId, COPYWIN_GFX);
        RemoveWindow(sSafariZoneStatsWindowId);
    }
    if (CurrentBattlePyramidLocation() != PYRAMID_LOCATION_NONE)
    {
        ClearStdWindowAndFrameToTransparent(sBattlePyramidFloorWindowId, FALSE);
        RemoveWindow(sBattlePyramidFloorWindowId);
    }
    DestroyTimeWindow();
    if (DEBUG_OVERWORLD_MENU != TRUE)
        DestroyHelpMessageWindow(COPYWIN_GFX);
}

#define tCounter data[0]

static void Task_UpdateTimeWindow(u8 taskId)
{
    if (gTasks[taskId].tCounter < 60)
    {
        gTasks[taskId].tCounter++;
        return;
    }

    if (IsDma3ManagerBusyWithBgCopy())
        return;

    DrawStdWindowFrame(sTimeWindowId, FALSE);
    ConvertIntToDecimalStringN(gStringVar1, GetCurrentHour(), STR_CONV_MODE_RIGHT_ALIGN, 3);
    ConvertIntToDecimalStringN(gStringVar2, GetCurrentMinute(), STR_CONV_MODE_LEADING_ZEROS, 2);
    StringExpandPlaceholders(gStringVar4, gText_MenuTime);
    AddTextPrinterParameterized(sTimeWindowId, FONT_NORMAL, gStringVar4, 4, 1, 0xFF, NULL);

    StringCopy(gStringVar1, GetSeasonName(GetSeason()));
    ConvertIntToDecimalStringN(gStringVar2, GetSeasonDay(), STR_CONV_MODE_RIGHT_ALIGN, 2);
    StringExpandPlaceholders(gStringVar4, gText_MenuDay);
    AddTextPrinterParameterized(sTimeWindowId, FONT_NORMAL, gStringVar4, 4, 18, 0xFF, NULL);

    CopyWindowToVram(sTimeWindowId, COPYWIN_GFX);
    gTasks[taskId].tCounter = 0;
}

static void DrawTimeWindow(void)
{
    sTimeWindowId = AddWindow(&sTimeWindowTemplate);

    PutWindowTilemap(sTimeWindowId);
    DrawStdWindowFrame(sTimeWindowId, FALSE);
    ConvertIntToDecimalStringN(gStringVar1, GetCurrentHour(), STR_CONV_MODE_RIGHT_ALIGN, 3);
    ConvertIntToDecimalStringN(gStringVar2, GetCurrentMinute(), STR_CONV_MODE_LEADING_ZEROS, 2);
    StringExpandPlaceholders(gStringVar4, gText_MenuTime);
    AddTextPrinterParameterized(sTimeWindowId, FONT_NORMAL, gStringVar4, 4, 1, 0xFF, NULL);

    StringCopy(gStringVar1, GetSeasonName(GetSeason()));
    ConvertIntToDecimalStringN(gStringVar2, GetSeasonDay(), STR_CONV_MODE_RIGHT_ALIGN, 2);
    StringExpandPlaceholders(gStringVar4, gText_MenuDay);
    AddTextPrinterParameterized(sTimeWindowId, FONT_NORMAL, gStringVar4, 4, 18, 0xFF, NULL);

    CopyWindowToVram(sTimeWindowId, COPYWIN_GFX);

    u8 taskId = CreateTask(Task_UpdateTimeWindow, 0);
    gTasks[taskId].tCounter = 0;
}

#undef tCounter

static void DestroyTimeWindow(void)
{
    u8 taskId = FindTaskIdByFunc(Task_UpdateTimeWindow);
    if (taskId != TASK_NONE)
        DestroyTask(taskId);

    if (sTimeWindowId == WINDOW_NONE)
        return;

    ClearStdWindowAndFrameToTransparent(sTimeWindowId, FALSE);
    CopyWindowToVram(sTimeWindowId, COPYWIN_FULL);
    RemoveWindow(sTimeWindowId);
    sTimeWindowId = WINDOW_NONE;
}

static s8 PrintStartMenuActions(s8 *cursor_p, u8 nitems)
{
    s16 i = *cursor_p;
    do
    {
        if (sCurrentStartMenuActions[i] == MENU_ACTION_PLAYER || sCurrentStartMenuActions[i] == MENU_ACTION_PLAYER_LINK)
        {
            PrintPlayerNameOnWindow(GetStartMenuWindowId(), sStartMenuActionTable[sCurrentStartMenuActions[i]].text, 8, i * 15);
        }
        else
        {
            StringExpandPlaceholders(gStringVar4, sStartMenuActionTable[sCurrentStartMenuActions[i]].text);
            AddTextPrinterParameterized(GetStartMenuWindowId(), FONT_NORMAL, gStringVar4, 8, i * 15, 0xFF, NULL);
        }
        i++;
        if (i >= sNumStartMenuItems)
        {
            *cursor_p = i;
            return TRUE;
        }
    } while (--nitems);

    *cursor_p = i;
    return FALSE;
}

static s8 InitStartMenuStep(void)
{
    switch (sInitStartMenuData[0])
    {
    case 0:
        sInitStartMenuData[0]++;
        break;
    case 1:
        BuildStartMenuActions();
        sInitStartMenuData[0]++;
        break;
    case 2:
        LoadMessageBoxAndBorderGfx();
        DrawStdWindowFrame(AddStartMenuWindow(sNumStartMenuItems), FALSE);
        sInitStartMenuData[0]++;
        break;
    case 3:
        if (GetSafariZoneFlag())
            ShowSafariZoneStatsWindow();
        if (CurrentBattlePyramidLocation() != PYRAMID_LOCATION_NONE)
            ShowPyramidFloorWindow();
        sInitStartMenuData[0]++;
        break;
    case 4:
        if (CurrentBattlePyramidLocation() == PYRAMID_LOCATION_NONE)
            DrawTimeWindow();
        sInitStartMenuData[0]++;
        break;
    case 5:
        if (PrintStartMenuActions(&sInitStartMenuData[1], 2) == TRUE)
            sInitStartMenuData[0]++;
        break;
    case 6:
        sStartMenuCursorPos = InitMenuNormal(GetStartMenuWindowId(), FONT_NORMAL, 0, 0, 15, sNumStartMenuItems, sStartMenuCursorPos);
        if (DEBUG_OVERWORLD_MENU != TRUE && !MenuHelpers_IsLinkActive() && InUnionRoom() != TRUE && gSaveBlock2Ptr->optionsButtonMode == OPTIONS_BUTTON_MODE_HELP)
            DrawHelpMessageWindowWithText(sStartMenuDescPointers[sCurrentStartMenuActions[sStartMenuCursorPos]]);
        CopyWindowToVram(GetStartMenuWindowId(), COPYWIN_MAP);
        return TRUE;
    }
    return FALSE;
}

static void InitStartMenu(void)
{
    sInitStartMenuData[0] = 0;
    sInitStartMenuData[1] = 0;
    while (!InitStartMenuStep())
        ;
}

static void StartMenuTask(u8 taskId)
{
    if (InitStartMenuStep() == TRUE)
        SwitchTaskToFollowupFunc(taskId);
}

static void CreateStartMenuTask(TaskFunc followupFunc)
{
    u8 taskId;
    sInitStartMenuData[0] = 0;
    sInitStartMenuData[1] = 0;
    taskId = CreateTask(StartMenuTask, 80);
    SetTaskFuncWithFollowupFunc(taskId, StartMenuTask, followupFunc);
}

static bool8 FieldCB_ReturnToFieldStartMenu(void)
{
    if (!InitStartMenuStep())
        return FALSE;

    ReturnToFieldOpenStartMenu();
    return TRUE;
}

void ShowReturnToFieldStartMenu(void)
{
    sInitStartMenuData[0] = 0;
    sInitStartMenuData[1] = 0;
    gFieldCallback2 = FieldCB_ReturnToFieldStartMenu;
}

void Task_ShowStartMenu(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    switch (data[0])
    {
    case 0:
        if (InUnionRoom() == TRUE)
            SetUsingUnionRoomStartMenu();

        gMenuCallback = HandleStartMenuInput;
        data[0]++;
        break;
    case 1:
        if (gMenuCallback() == TRUE)
            DestroyTask(taskId);
        break;
    }
}

void ShowStartMenu(void)
{
    if (!IsOverworldLinkActive())
    {
        FreezeObjectEvents();
        PlayerFreeze();
        StopPlayerAvatar();
    }
    CreateStartMenuTask(Task_ShowStartMenu);
    LockPlayerFieldControls();
}

static bool8 HandleStartMenuInput(void)
{
    if (JOY_NEW(DPAD_UP))
    {
        PlaySE(SE_SELECT);
        sStartMenuCursorPos = Menu_MoveCursor(-1);
        if (DEBUG_OVERWORLD_MENU != TRUE && !MenuHelpers_IsLinkActive() && InUnionRoom() != TRUE && gSaveBlock2Ptr->optionsButtonMode == OPTIONS_BUTTON_MODE_HELP)
            PrintTextOnHelpMessageWindow(sStartMenuDescPointers[sCurrentStartMenuActions[sStartMenuCursorPos]], COPYWIN_GFX);
    }

    if (JOY_NEW(DPAD_DOWN))
    {
        PlaySE(SE_SELECT);
        sStartMenuCursorPos = Menu_MoveCursor(+1);
        if (DEBUG_OVERWORLD_MENU != TRUE && !MenuHelpers_IsLinkActive() && InUnionRoom() != TRUE && gSaveBlock2Ptr->optionsButtonMode == OPTIONS_BUTTON_MODE_HELP)
            PrintTextOnHelpMessageWindow(sStartMenuDescPointers[sCurrentStartMenuActions[sStartMenuCursorPos]], COPYWIN_GFX);
    }

    if (JOY_NEW(A_BUTTON))
    {
        PlaySE(SE_SELECT);
        if (!StartMenuPokedexSanityCheck())
            return FALSE;
        if (sCurrentStartMenuActions[sStartMenuCursorPos] == MENU_ACTION_DEXNAV
            && MapHasNoEncounterData())
            return FALSE;
        gMenuCallback = sStartMenuActionTable[sCurrentStartMenuActions[sStartMenuCursorPos]].func.u8_void;
        StartMenu_FadeScreenIfLeavingOverworld();
        return FALSE;
    }

    if (JOY_NEW(B_BUTTON | START_BUTTON))
    {
        RemoveExtraStartMenuWindows();
        HideStartMenu();
        return TRUE;
    }

    return FALSE;
}

static void StartMenu_FadeScreenIfLeavingOverworld(void)
{
    if (gMenuCallback != StartMenuSaveCallback
     && gMenuCallback != StartMenuExitCallback
     && gMenuCallback != StartMenuDebugCallback
     && gMenuCallback != StartMenuSafariZoneRetireCallback
     && gMenuCallback != StartMenuBattlePyramidRetireCallback)
    {
        StopPokemonLeagueLightingEffectTask();
        FadeScreen(FADE_TO_BLACK, 0);
    }
}

static bool8 StartMenuPokedexSanityCheck(void)
{
    if (sStartMenuActionTable[sCurrentStartMenuActions[sStartMenuCursorPos]].func.u8_void == StartMenuPokedexCallback && GetNationalPokedexCount(FLAG_GET_SEEN) == 0)
        return FALSE;
    return TRUE;
}

static bool8 StartMenuPokedexCallback(void)
{
    if (!gPaletteFade.active)
    {
        IncrementGameStat(GAME_STAT_CHECKED_POKEDEX);
        PlayRainStoppingSoundEffect();
        RemoveExtraStartMenuWindows();
        CleanupOverworldWindowsAndTilemaps();
        SetMainCallback2(CB2_OpenPokedexFromStartMenu);
        return TRUE;
    }
    return FALSE;
}

static bool8 StartMenuPokemonCallback(void)
{
    if (!gPaletteFade.active)
    {
        PlayRainStoppingSoundEffect();
        RemoveExtraStartMenuWindows();
        CleanupOverworldWindowsAndTilemaps();
        SetMainCallback2(CB2_PartyMenuFromStartMenu);
        return TRUE;
    }
    return FALSE;
}

static bool8 StartMenuBagCallback(void)
{
    if (!gPaletteFade.active)
    {
        PlayRainStoppingSoundEffect();
        RemoveExtraStartMenuWindows();
        CleanupOverworldWindowsAndTilemaps();
        SetMainCallback2(CB2_BagMenuFromStartMenu);
        return TRUE;
    }
    return FALSE;
}

static bool8 StartMenuPlayerNameCallback(void)
{
    if (!gPaletteFade.active)
    {
        PlayRainStoppingSoundEffect();
        RemoveExtraStartMenuWindows();
        CleanupOverworldWindowsAndTilemaps();
        if (IsOverworldLinkActive() || InUnionRoom())
            ShowPlayerTrainerCard(CB2_ReturnToFieldWithOpenMenu); // Display trainer card
        else if (FlagGet(FLAG_SYS_FRONTIER_PASS))
            ShowFrontierPass(CB2_ReturnToFieldWithOpenMenu); // Display frontier pass
        else
            ShowPlayerTrainerCard(CB2_ReturnToFieldWithOpenMenu);
        return TRUE;
    }
    return FALSE;
}

static bool8 StartMenuSaveCallback(void)
{
    if (CurrentBattlePyramidLocation() != PYRAMID_LOCATION_NONE)
        RemoveExtraStartMenuWindows();

    gMenuCallback = SaveStartCallback;
    return FALSE;
}

static bool8 StartMenuOptionCallback(void)
{
    if (!gPaletteFade.active)
    {
        PlayRainStoppingSoundEffect();
        RemoveExtraStartMenuWindows();
        CleanupOverworldWindowsAndTilemaps();
        SetMainCallback2(CB2_InitOptionMenu);
        gMain.savedCallback = CB2_ReturnToFieldWithOpenMenu;
        return TRUE;
    }
    return FALSE;
}

static bool8 StartMenuExitCallback(void)
{
    RemoveExtraStartMenuWindows();
    HideStartMenu();
    return TRUE;
}

static bool8 StartMenuDebugCallback(void)
{
    RemoveExtraStartMenuWindows();
    HideStartMenuDebug(); // Hide start menu without enabling movement

    if (DEBUG_OVERWORLD_MENU == TRUE)
    {
        FreezeObjectEvents();
        Debug_ShowMainMenu();
    }
    return TRUE;
}

static bool8 StartMenuSafariZoneRetireCallback(void)
{
    RemoveExtraStartMenuWindows();
    HideStartMenu();
    SafariZoneRetirePrompt();
    return TRUE;
}

static void HideStartMenuDebug(void)
{
    PlaySE(SE_SELECT);
    ClearStdWindowAndFrame(GetStartMenuWindowId(), TRUE);
    RemoveStartMenuWindow();
}

static bool8 StartMenuLinkPlayerCallback(void)
{
    if (!gPaletteFade.active)
    {
        PlayRainStoppingSoundEffect();
        CleanupOverworldWindowsAndTilemaps();
        ShowTrainerCardInLink(gLocalLinkPlayerId, CB2_ReturnToFieldWithOpenMenu);
        return TRUE;
    }
    return FALSE;
}

static bool8 StartMenuBattlePyramidRetireCallback(void)
{
    gMenuCallback = BattlePyramidRetireStartCallback; // Confirm retire

    return FALSE;
}

// Functionally unused
void ShowBattlePyramidStartMenu(void)
{
    ClearDialogWindowAndFrameToTransparent(0, FALSE);
    ScriptUnfreezeObjectEvents();
    CreateStartMenuTask(Task_ShowStartMenu);
    LockPlayerFieldControls();
}

static bool8 StartMenuBattlePyramidBagCallback(void)
{
    if (!gPaletteFade.active)
    {
        PlayRainStoppingSoundEffect();
        RemoveExtraStartMenuWindows();
        CleanupOverworldWindowsAndTilemaps();
        SetMainCallback2(CB2_PyramidBagMenuFromStartMenu);

        return TRUE;
    }

    return FALSE;
}

static bool8 SaveStartCallback(void)
{
    BackupHelpContext();
    SetHelpContext(HELPCONTEXT_SAVE);
    InitSave();
    gMenuCallback = SaveCallback;

    return FALSE;
}

static bool8 SaveCallback(void)
{
    switch (RunSaveCallback())
    {
    case SAVE_IN_PROGRESS:
        break;
    case SAVE_CANCELED:
        ClearDialogWindowAndFrameToTransparent(0, FALSE);
        InitStartMenu();
        RestoreHelpContext();
        gMenuCallback = HandleStartMenuInput;
        break;
    case SAVE_SUCCESS:
    case SAVE_ERROR:
        ClearDialogWindowAndFrameToTransparent(0, TRUE);
        ScriptUnfreezeObjectEvents();
        UnlockPlayerFieldControls();
        RestoreHelpContext();
        return TRUE;
    }
    return FALSE;
}

static bool8 BattlePyramidRetireStartCallback(void)
{
    InitBattlePyramidRetire();
    gMenuCallback = BattlePyramidRetireCallback;

    return FALSE;
}

static bool8 BattlePyramidRetireReturnCallback(void)
{
    InitStartMenu();
    gMenuCallback = HandleStartMenuInput;

    return FALSE;
}

static bool8 BattlePyramidRetireCallback(void)
{
    switch (RunSaveCallback())
    {
    case SAVE_SUCCESS: // No (Stay in battle pyramid)
        RemoveExtraStartMenuWindows();
        gMenuCallback = BattlePyramidRetireReturnCallback;
        return FALSE;
    case SAVE_IN_PROGRESS:
        return FALSE;
    case SAVE_CANCELED: // Yes (Retire from battle pyramid)
        ClearDialogWindowAndFrameToTransparent(0, TRUE);
        ScriptUnfreezeObjectEvents();
        UnlockPlayerFieldControls();
        ScriptContext_SetupScript(BattlePyramid_Retire);
        return TRUE;
    }

    return FALSE;
}

static void InitSave(void)
{
    SaveMapView();
    sSaveDialogCallback = SaveConfirmSaveCallback;
    sSavingComplete = FALSE;
}

static u8 RunSaveCallback(void)
{
    if (RunTextPrintersAndIsPrinter0Active() == TRUE)
        return SAVE_IN_PROGRESS;

    sSavingComplete = FALSE;
    return sSaveDialogCallback();
}

void SaveGame(void)
{
    sTimeWindowId = WINDOW_NONE;
    BackupHelpContext();
    SetHelpContext(HELPCONTEXT_SAVE);
    InitSave();
    CreateTask(SaveGameTask, 80);
}

static void ShowSaveMessage(const u8 *str, bool8 (*saveDialogCB)(void))
{
    StringExpandPlaceholders(gStringVar4, str);
    LoadMessageBoxAndFrameGfx(0, TRUE);
    AddTextPrinterForMessage_2(TRUE);
    sSavingComplete = TRUE;
    sSaveDialogCallback = saveDialogCB;
}

static void SaveGameTask(u8 taskId)
{
    switch (RunSaveCallback())
    {
    case SAVE_IN_PROGRESS:
        return;
    case SAVE_CANCELED:
    case SAVE_ERROR:
        gSpecialVar_Result = FALSE;
        break;
    case SAVE_SUCCESS:
        gSpecialVar_Result = TRUE;
        break;
    }
    DestroyTask(taskId);
    ScriptContext_Enable();
    RestoreHelpContext();
}

static void HideSaveMessageWindow(void)
{
    ClearDialogWindowAndFrame(0, TRUE);
}

static void HideSaveInfoWindow(void)
{
    RemoveSaveInfoWindow();
}

static void SaveStartTimer(void)
{
    sSaveDialogDelay = 60;
}

static bool8 SaveSuccesTimer(void)
{
    sSaveDialogDelay--;

    if (JOY_HELD(A_BUTTON))
    {
        PlaySE(SE_SELECT);
        return TRUE;
    }
    else if (sSaveDialogDelay == 0)
    {
        return TRUE;
    }

    return FALSE;
}

static bool8 SaveErrorTimer(void)
{
    if (sSaveDialogDelay == 0)
    {
        if (JOY_HELD(A_BUTTON))
        {
            return TRUE;
        }
        else
        {
            return FALSE;
        }
    }
    else
    {
        sSaveDialogDelay--;
        return FALSE;
    }
}

static u8 SaveConfirmSaveCallback(void)
{
    ClearStdWindowAndFrame(GetStartMenuWindowId(), FALSE);
    RemoveStartMenuWindow();
    DestroyTimeWindow();
    if (DEBUG_OVERWORLD_MENU != TRUE)
        DestroyHelpMessageWindow(COPYWIN_NONE);

    ShowSaveInfoWindow();

    if (CurrentBattlePyramidLocation() != PYRAMID_LOCATION_NONE)
        ShowSaveMessage(gText_BattlePyramidConfirmRest, SaveYesNoCallback);
    else
        ShowSaveMessage(gText_WouldYouLikeToSaveTheGame, SaveYesNoCallback);

    return SAVE_IN_PROGRESS;
}

static u8 SaveYesNoCallback(void)
{
    DisplayYesNoMenuDefaultYes();
    sSaveDialogCallback = SaveConfirmInputCallback;
    return SAVE_IN_PROGRESS;
}

static u8 SaveConfirmInputCallback(void)
{
    switch (Menu_ProcessInputNoWrapClearOnChoose())
    {
    case 0:
        if ((gSaveFileStatus != SAVE_STATUS_EMPTY && gSaveFileStatus != SAVE_STATUS_INVALID) || !gDifferentSaveFile)
            sSaveDialogCallback = SaveFileExistsCallback;
        else
            sSaveDialogCallback = SaveSavingMessageCallback;
        break;
    case 1:
    case MENU_B_PRESSED:
        HideSaveInfoWindow();
        HideSaveMessageWindow();
        return SAVE_CANCELED;
    }
    return SAVE_IN_PROGRESS;
}

static u8 SaveFileExistsCallback(void)
{
    if (gDifferentSaveFile == TRUE)
        ShowSaveMessage(gText_DifferentGameFile, SaveConfirmOverwriteDefaultNoCallback);
    else
        ShowSaveMessage(gText_AlreadySaveFile_WouldLikeToOverwrite, SaveConfirmOverwriteCallback);

    return SAVE_IN_PROGRESS;
}

static u8 SaveConfirmOverwriteCallback(void)
{
    DisplayYesNoMenuDefaultYes();
    sSaveDialogCallback = SaveOverwriteInputCallback;
    return SAVE_IN_PROGRESS;
}

static u8 SaveConfirmOverwriteDefaultNoCallback(void)
{
    DisplayYesNoMenuWithDefault(1);
    sSaveDialogCallback = SaveOverwriteInputCallback;
    return SAVE_IN_PROGRESS;
}

static u8 SaveOverwriteInputCallback(void)
{
    switch (Menu_ProcessInputNoWrapClearOnChoose())
    {
    case 0:
        sSaveDialogCallback = SaveSavingMessageCallback;
        break;
    case 1:
    case -1:
        HideSaveInfoWindow();
        HideSaveMessageWindow();
        return SAVE_CANCELED;
    }
    return SAVE_IN_PROGRESS;
}

static u8 SaveSavingMessageCallback(void)
{
    SaveQuestLogData();
    ShowSaveMessage(gText_SavingDontTurnOffThePower, SaveDoSaveCallback);
    return SAVE_IN_PROGRESS;
}

static u8 SaveDoSaveCallback(void)
{
    u8 saveStatus;

    IncrementGameStat(GAME_STAT_SAVED_GAME);
    PausePyramidChallenge();

    if (gDifferentSaveFile == TRUE)
    {
        saveStatus = TrySavingData(SAVE_OVERWRITE_DIFFERENT_FILE);
        gDifferentSaveFile = FALSE;
    }
    else
    {
        saveStatus = TrySavingData(SAVE_NORMAL);
    }

    if (saveStatus == SAVE_STATUS_OK)
        ShowSaveMessage(gText_PlayerSavedTheGame, SaveSuccessCallback);
    else
        ShowSaveMessage(gText_SaveError_PleaseExchangeBackupMemory, SaveErrorCallback);

    SaveStartTimer();
    return SAVE_IN_PROGRESS;
}

static u8 SaveSuccessCallback(void)
{
    if (!IsTextPrinterActiveOnWindow(0))
    {
        PlaySE(SE_SAVE);
        sSaveDialogCallback = SaveReturnSuccessCallback;
    }

    return SAVE_IN_PROGRESS;
}

static u8 SaveReturnSuccessCallback(void)
{
    if (!IsSEPlaying() && SaveSuccesTimer())
    {
        HideSaveInfoWindow();
        return SAVE_SUCCESS;
    }
    return SAVE_IN_PROGRESS;
}

static u8 SaveErrorCallback(void)
{
    if (!IsTextPrinterActiveOnWindow(0))
    {
        PlaySE(SE_BOO);
        sSaveDialogCallback = SaveReturnErrorCallback;
    }
    return SAVE_IN_PROGRESS;
}

static u8 SaveReturnErrorCallback(void)
{
    if (!SaveErrorTimer())
        return SAVE_IN_PROGRESS;

    HideSaveInfoWindow();
    return SAVE_ERROR;
}

static void InitBattlePyramidRetire(void)
{
    sSaveDialogCallback = BattlePyramidConfirmRetireCallback;
    sSavingComplete = FALSE;
}

static u8 BattlePyramidConfirmRetireCallback(void)
{
    ClearStdWindowAndFrame(GetStartMenuWindowId(), FALSE);
    RemoveStartMenuWindow();
    ShowSaveMessage(gText_BattlePyramidConfirmRetire, BattlePyramidRetireYesNoCallback);

    return SAVE_IN_PROGRESS;
}

static u8 BattlePyramidRetireYesNoCallback(void)
{
    DisplayYesNoMenuWithDefault(1); // Show Yes/No menu (No selected as default)
    sSaveDialogCallback = BattlePyramidRetireInputCallback;

    return SAVE_IN_PROGRESS;
}

static u8 BattlePyramidRetireInputCallback(void)
{
    switch (Menu_ProcessInputNoWrapClearOnChoose())
    {
    case 0: // Yes
        return SAVE_CANCELED;
    case MENU_B_PRESSED:
    case 1: // No
        HideSaveMessageWindow();
        return SAVE_SUCCESS;
    }

    return SAVE_IN_PROGRESS;
}

static void VBlankCB_LinkBattleSave(void)
{
    TransferPlttBuffer();
}

bool32 InitSaveWindowAfterLinkBattle(u8 *state)
{
    switch (*state)
    {
    case 0:
        SetGpuReg(REG_OFFSET_DISPCNT, DISPCNT_MODE_0);
        SetVBlankCallback(NULL);
        ScanlineEffect_Stop();
        DmaFill16Defvars(3, 0, (void *)PLTT, PLTT_SIZE);
        DmaFillLarge16(3, 0, (void *)VRAM, VRAM_SIZE, 0x1000);
        break;
    case 1:
        ResetSpriteData();
        ResetTasks();
        ResetPaletteFade();
        ScanlineEffect_Clear();
        break;
    case 2:
        ResetBgsAndClearDma3BusyFlags(FALSE);
        InitBgsFromTemplates(0, sBGTemplates_AfterLinkSaveMessage, NELEMS(sBGTemplates_AfterLinkSaveMessage));
        InitWindows(sWindowTemplates_AfterLinkSaveMessage);
        LoadStdWindowGfx(0, 0x008, BG_PLTT_ID(15));
        break;
    case 3:
        ShowBg(0);
        BlendPalettes(PALETTES_ALL, 16, RGB_BLACK);
        SetVBlankCallback(VBlankCB_LinkBattleSave);
        EnableInterrupts(INTR_FLAG_VBLANK);
        break;
    case 4:
        return TRUE;
    }
    (*state)++;
    return FALSE;
}

void CB2_SetUpSaveAfterLinkBattle(void)
{
    if (InitSaveWindowAfterLinkBattle(&gMain.state))
    {
        CreateTask(Task_SaveAfterLinkBattle, 80);
        SetMainCallback2(CB2_WhileSavingAfterLinkBattle);
    }
}

static void CB2_WhileSavingAfterLinkBattle(void)
{
    RunTasks();
    UpdatePaletteFade();
}

static void Task_SaveAfterLinkBattle(u8 taskId)
{
    s16 *data = gTasks[taskId].data;

    if (gPaletteFade.active)
        return;

    switch (data[0])
    {
    case 0:
        FillWindowPixelBuffer(0, PIXEL_FILL(1));
        AddTextPrinterParameterized2(0, FONT_NORMAL, gText_SavingDontTurnOffThePower2, TEXT_SKIP_DRAW, NULL, TEXT_COLOR_DARK_GRAY, TEXT_COLOR_WHITE, TEXT_COLOR_LIGHT_GRAY);
        DrawTextBorderOuter(0, 0x008, 15);
        PutWindowTilemap(0);
        CopyWindowToVram(0, COPYWIN_FULL);
        BeginNormalPaletteFade(PALETTES_ALL, 0, 16, 0, RGB_BLACK);
        if (gWirelessCommType != 0 && InUnionRoom())
            data[0] = 5;
        else
            data[0] = 1;
        break;
    case 1:
        SetContinueGameWarpStatusToDynamicWarp();
        WriteSaveBlock2();
        data[0] = 2;
        break;
    case 2:
        if (WriteSaveBlock1Sector())
        {
            ClearContinueGameWarpStatus2();
            data[0] = 3;
        }
        break;
    case 3:
        BeginNormalPaletteFade(PALETTES_ALL, 0, 0, 16, RGB_BLACK);
        data[0] = 4;
        break;
    case 4:
        FreeAllWindowBuffers();
        SetMainCallback2(gMain.savedCallback);
        DestroyTask(taskId);
        break;
    case 5:
        CreateTask(Task_LinkFullSave, 5);
        data[0] = 6;
        break;
    case 6:
        if (!FuncIsActiveTask(Task_LinkFullSave))
            data[0] = 3;
        break;
    }
}

static void ShowSaveInfoWindow(void)
{
    u8 y;
    u8 x;
    sSaveStatsWindowId = AddWindow(&sSaveStatsWindowTemplate);
    LoadStdWindowGfx(sSaveStatsWindowId, 0x21D, BG_PLTT_ID(13));
    DrawStdFrameWithCustomTileAndPalette(sSaveStatsWindowId, FALSE, 0x21D, 13);

    // Print region name
    BufferSaveMenuText(SAVE_MENU_LOCATION, gStringVar4, TEXT_COLOR_BLUE);
    x = (u32)(112 - GetStringWidth(FONT_NORMAL, gStringVar4, -1)) / 2;
    AddTextPrinterParameterized3(sSaveStatsWindowId, FONT_NORMAL, x, 0, sTextColor_LocationHeader, TEXT_SKIP_DRAW, gStringVar4);

    // Print player name
    x = (u32)(112 - GetStringWidth(FONT_NORMAL, gStringVar4, -1)) / 2;
    AddTextPrinterParameterized3(sSaveStatsWindowId, FONT_SMALL, 2, 14, sTextColor_StatName, TEXT_SKIP_DRAW, gSaveStatName_Player);
    BufferSaveMenuText(SAVE_MENU_NAME, gStringVar4, TEXT_COLOR_DARK_GRAY);

    // Print badge count
    PrintPlayerNameOnWindow(sSaveStatsWindowId, gStringVar4, 60, 14);
    AddTextPrinterParameterized3(sSaveStatsWindowId, FONT_SMALL, 2, 28, sTextColor_StatName, TEXT_SKIP_DRAW, gSaveStatName_Badges);
    BufferSaveMenuText(SAVE_MENU_BADGES, gStringVar4, TEXT_COLOR_DARK_GRAY);
    AddTextPrinterParameterized3(sSaveStatsWindowId, FONT_SMALL, 60, 28, sTextColor_StatValue, TEXT_SKIP_DRAW, gStringVar4);

    y = 42;
    if (FlagGet(FLAG_SYS_POKEDEX_GET) == TRUE)
    {
        // Print Pokédex count
        AddTextPrinterParameterized3(sSaveStatsWindowId, FONT_SMALL, 2, 42, sTextColor_StatName, TEXT_SKIP_DRAW, gSaveStatName_Pokedex);
        BufferSaveMenuText(SAVE_MENU_POKEDEX, gStringVar4, TEXT_COLOR_DARK_GRAY);
        AddTextPrinterParameterized3(sSaveStatsWindowId, FONT_SMALL, 60, 42, sTextColor_StatValue, TEXT_SKIP_DRAW, gStringVar4);
        y = 56;
    }

    // Print play time
    AddTextPrinterParameterized3(sSaveStatsWindowId, FONT_SMALL, 2, y, sTextColor_StatName, TEXT_SKIP_DRAW, gSaveStatName_Time);
    BufferSaveMenuText(SAVE_MENU_TIME, gStringVar4, TEXT_COLOR_DARK_GRAY);
    AddTextPrinterParameterized3(sSaveStatsWindowId, FONT_SMALL, 60, y, sTextColor_StatValue, TEXT_SKIP_DRAW, gStringVar4);

    CopyWindowToVram(sSaveStatsWindowId, COPYWIN_GFX);
}

static void RemoveSaveInfoWindow(void)
{
    ClearStdWindowAndFrame(sSaveStatsWindowId, FALSE);
    RemoveWindow(sSaveStatsWindowId);
}

static void Task_WaitForBattleTowerLinkSave(u8 taskId)
{
    if (!FuncIsActiveTask(Task_LinkFullSave))
    {
        DestroyTask(taskId);
        ScriptContext_Enable();
    }
}

#define tInBattleTower data[2]

void SaveForBattleTowerLink(void)
{
    u8 taskId = CreateTask(Task_LinkFullSave, 5);
    gTasks[taskId].tInBattleTower = TRUE;
    gTasks[CreateTask(Task_WaitForBattleTowerLinkSave, 6)].data[1] = taskId;
}

#undef tInBattleTower

static void HideStartMenuWindow(void)
{
    ClearStdWindowAndFrame(GetStartMenuWindowId(), TRUE);
    RemoveStartMenuWindow();
    ScriptUnfreezeObjectEvents();
    UnlockPlayerFieldControls();
}

void HideStartMenu(void)
{
    PlaySE(SE_SELECT);
    HideStartMenuWindow();
}

void AppendToList(u8 *list, u8 *cursor, u8 newEntry)
{
    list[*cursor] = newEntry;
    (*cursor)++;
}

static bool8 StartMenuDexNavCallback(void)
{
    CreateTask(Task_OpenDexNavFromStartMenu, 0);
    return TRUE;
}

void Script_ForceSaveGame(struct ScriptContext *ctx)
{
    SaveGame();
    ShowSaveInfoWindow();
    gMenuCallback = SaveCallback;
    sSaveDialogCallback = SaveSavingMessageCallback;
}

