//CREDITS
//TheXaman:             https://github.com/TheXaman/pokeemerald/tree/tx_debug_system
//CODE USED FROM:
//ketsuban:             https://github.com/pret/pokeemerald/wiki/Add-a-debug-menu
//Pyredrid:             https://github.com/Pyredrid/pokeemerald/tree/debugmenu
//AsparagusEduardo:     https://github.com/AsparagusEduardo/pokeemerald/tree/InfusedEmerald_v2
//Ghoulslash:           https://github.com/ghoulslash/pokeemerald
//Jaizu:                https://jaizu.moe/
//AND OTHER RHH POKEEMERALD-EXPANSION CONTRIBUTORS
#include "global.h"
#include "battle.h"
#include "battle_setup.h"
#include "berry.h"
#include "clock.h"
#include "coins.h"
#include "credits.h"
#include "data.h"
#include "daycare.h"
#include "debug.h"
#include "event_data.h"
#include "event_object_movement.h"
#include "event_scripts.h"
#include "field_fadetransition.h"
#include "field_message_box.h"
#include "field_screen_effect.h"
#include "field_weather.h"
#include "international_string_util.h"
#include "item.h"
#include "item_icon.h"
#include "list_menu.h"
#include "m4a.h"
#include "main.h"
#include "main_menu.h"
#include "malloc.h"
#include "map_name_popup.h"
#include "menu.h"
#include "money.h"
#include "naming_screen.h"
#include "new_game.h"
#include "overworld.h"
#include "palette.h"
#include "party_menu.h"
#include "pokedex.h"
#include "pokemon.h"
#include "pokemon_icon.h"
#include "pokemon_storage_system.h"
#include "random.h"
#include "region_map.h"
#include "rtc.h"
#include "script.h"
#include "script_pokemon_util.h"
#include "sound.h"
#include "strings.h"
#include "string_util.h"
#include "task.h"
#include "pokemon_summary_screen.h"
#include "wild_encounter.h"
#include "constants/abilities.h"
#include "constants/battle_ai.h"
// #include "constants/battle_frontier.h"
#include "constants/coins.h"
// #include "constants/expansion.h"
#include "constants/flags.h"
#include "constants/items.h"
#include "constants/map_groups.h"
#include "constants/rgb.h"
#include "constants/songs.h"
#include "constants/species.h"
#include "constants/weather.h"
#include "siirtc.h"
#include "rtc.h"
#include "fake_rtc.h"
#include "save.h"

// *******************************
enum DebugMenu
{
    DEBUG_MENU_ITEM_UTILITIES,
    DEBUG_MENU_ITEM_PCBAG,
    DEBUG_MENU_ITEM_PARTY,
    DEBUG_MENU_ITEM_GIVE,
    DEBUG_MENU_ITEM_PLAYER,
    DEBUG_MENU_ITEM_SCRIPTS,
    DEBUG_MENU_ITEM_FLAGVAR,
    //DEBUG_MENU_ITEM_BATTLE,
    DEBUG_MENU_ITEM_SOUND,
    DEBUG_MENU_ITEM_ROMINFO,
    DEBUG_MENU_ITEM_CANCEL,
};

enum UtilDebugMenu
{
    DEBUG_UTIL_MENU_ITEM_FLY,
    DEBUG_UTIL_MENU_ITEM_WARP,
    DEBUG_UTIL_MENU_ITEM_WEATHER,
    DEBUG_UTIL_MENU_ITEM_FONT_TEST,
    DEBUG_UTIL_MENU_ITEM_TIME_MENU,
    DEBUG_UTIL_MENU_ITEM_WATCHCREDITS,
    DEBUG_UTIL_MENU_ITEM_CHEAT,
    DEBUG_UTIL_MENU_ITEM_BERRY_FUNCTIONS,
    DEBUG_UTIL_MENU_ITEM_EWRAM_COUNTERS,
    DEBUG_UTIL_MENU_ITEM_STEVEN_MULTI // Please keep this at the bottom <3
};

enum TimeMenuDebugMenu
{
    DEBUG_TIME_MENU_ITEM_PRINTTIME,
    DEBUG_TIME_MENU_ITEM_PRINTTIMEOFDAY,
    DEBUG_TIME_MENU_ITEM_TIMESOFDAY,
    DEBUG_TIME_MENU_ITEM_WEEKDAYS,
    DEBUG_TIME_MENU_ITEM_CHECKWALLCLOCK,
    DEBUG_TIME_MENU_ITEM_SETWALLCLOCK,
};

enum TimeMenuTimeOfDay
{
    DEBUG_TIME_MENU_ITEM_MORNING,
    DEBUG_TIME_MENU_ITEM_DAY,
    DEBUG_TIME_MENU_ITEM_EVENING,
    DEBUG_TIME_MENU_ITEM_NIGHT,
};

enum TimeMenuWeekdays
{
    DEBUG_TIME_MENU_ITEM_SUNDAY,
    DEBUG_TIME_MENU_ITEM_MONDAY,
    DEBUG_TIME_MENU_ITEM_TUESDAY,
    DEBUG_TIME_MENU_ITEM_WEDNESDAY,
    DEBUG_TIME_MENU_ITEM_THURSDAY,
    DEBUG_TIME_MENU_ITEM_FRIDAY,
    DEBUG_TIME_MENU_ITEM_SATURDAY,
};

enum GivePCBagDebugMenu
{
    DEBUG_PCBAG_MENU_ITEM_ACCESS_PC,
    DEBUG_PCBAG_MENU_ITEM_FILL,
    DEBUG_PCBAG_MENU_ITEM_CLEAR_BAG,
    DEBUG_PCBAG_MENU_ITEM_CLEAR_BOXES,
};

enum GivePCBagFillDebugMenu
{
    DEBUG_PCBAG_MENU_ITEM_FILL_PC_BOXES_FAST,
    DEBUG_PCBAG_MENU_ITEM_FILL_PC_BOXES_SLOW,
    DEBUG_PCBAG_MENU_ITEM_FILL_PC_ITEMS,
    DEBUG_PCBAG_MENU_ITEM_FILL_POCKET_ITEMS,
    DEBUG_PCBAG_MENU_ITEM_FILL_POCKET_BALLS,
    DEBUG_PCBAG_MENU_ITEM_FILL_POCKET_TMHM,
    DEBUG_PCBAG_MENU_ITEM_FILL_POCKET_BERRIES,
    DEBUG_PCBAG_MENU_ITEM_FILL_POCKET_KEY_ITEMS,
};

enum PartyDebugMenu
{
    DEBUG_PARTY_MENU_ITEM_MOVE_REMINDER,
    DEBUG_PARTY_MENU_ITEM_HATCH_AN_EGG,
    DEBUG_PARTY_MENU_ITEM_HEAL_PARTY,
    DEBUG_PARTY_MENU_ITEM_INFLICT_STATUS1,
    DEBUG_PARTY_MENU_ITEM_CHECK_EVS,
    DEBUG_PARTY_MENU_ITEM_CHECK_IVS,
    DEBUG_PARTY_MENU_ITEM_CLEAR_PARTY,
};

enum ScriptDebugMenu
{
    DEBUG_UTIL_MENU_ITEM_SCRIPT_1,
    DEBUG_UTIL_MENU_ITEM_SCRIPT_2,
    DEBUG_UTIL_MENU_ITEM_SCRIPT_3,
    DEBUG_UTIL_MENU_ITEM_SCRIPT_4,
    DEBUG_UTIL_MENU_ITEM_SCRIPT_5,
    DEBUG_UTIL_MENU_ITEM_SCRIPT_6,
    DEBUG_UTIL_MENU_ITEM_SCRIPT_7,
    DEBUG_UTIL_MENU_ITEM_SCRIPT_8,
};

enum FlagsVarsDebugMenu
{
    DEBUG_FLAGVAR_MENU_ITEM_FLAGS,
    DEBUG_FLAGVAR_MENU_ITEM_VARS,
    DEBUG_FLAGVAR_MENU_ITEM_DEXFLAGS_ALL,
    DEBUG_FLAGVAR_MENU_ITEM_DEXFLAGS_RESET,
    DEBUG_FLAGVAR_MENU_ITEM_TOGGLE_POKEDEX,
    DEBUG_FLAGVAR_MENU_ITEM_TOGGLE_NATDEX,
    DEBUG_FLAGVAR_MENU_ITEM_TOGGLE_POKENAV,
    DEBUG_FLAGVAR_MENU_ITEM_TOGGLE_MATCH_CALL,
    DEBUG_FLAGVAR_MENU_ITEM_TOGGLE_RUN_SHOES,
    DEBUG_FLAGVAR_MENU_ITEM_TOGGLE_LOCATIONS,
    DEBUG_FLAGVAR_MENU_ITEM_TOGGLE_BADGES_ALL,
    DEBUG_FLAGVAR_MENU_ITEM_TOGGLE_GAME_CLEAR,
    DEBUG_FLAGVAR_MENU_ITEM_TOGGLE_FRONTIER_PASS,
    DEBUG_FLAGVAR_MENU_ITEM_TOGGLE_COLLISION,
    DEBUG_FLAGVAR_MENU_ITEM_TOGGLE_ENCOUNTER,
    DEBUG_FLAGVAR_MENU_ITEM_TOGGLE_TRAINER_SEE,
    DEBUG_FLAGVAR_MENU_ITEM_TOGGLE_BAG_USE,
    DEBUG_FLAGVAR_MENU_ITEM_TOGGLE_CATCHING,
};

enum BattleType
{
    DEBUG_BATTLE_0_MENU_ITEM_WILD,
    DEBUG_BATTLE_0_MENU_ITEM_WILD_DOUBLE,
    DEBUG_BATTLE_0_MENU_ITEM_SINGLE,
    DEBUG_BATTLE_0_MENU_ITEM_DOUBLE,
    DEBUG_BATTLE_0_MENU_ITEM_MULTI,
};

enum BattleAIFlags
{
    DEBUG_BATTLE_1_MENU_ITEM_AI_FLAG_00,
    DEBUG_BATTLE_1_MENU_ITEM_AI_FLAG_01,
    DEBUG_BATTLE_1_MENU_ITEM_AI_FLAG_02,
    DEBUG_BATTLE_1_MENU_ITEM_AI_FLAG_03,
    DEBUG_BATTLE_1_MENU_ITEM_AI_FLAG_04,
    DEBUG_BATTLE_1_MENU_ITEM_AI_FLAG_05,
    DEBUG_BATTLE_1_MENU_ITEM_AI_FLAG_06,
    DEBUG_BATTLE_1_MENU_ITEM_AI_FLAG_07,
    DEBUG_BATTLE_1_MENU_ITEM_AI_FLAG_08,
    DEBUG_BATTLE_1_MENU_ITEM_AI_FLAG_09,
    DEBUG_BATTLE_1_MENU_ITEM_AI_FLAG_10,
    DEBUG_BATTLE_1_MENU_ITEM_AI_FLAG_11,
    DEBUG_BATTLE_1_MENU_ITEM_AI_FLAG_12,
    DEBUG_BATTLE_1_MENU_ITEM_AI_FLAG_13,
    DEBUG_BATTLE_1_MENU_ITEM_AI_FLAG_14,
    DEBUG_BATTLE_1_MENU_ITEM_AI_FLAG_15,
    DEBUG_BATTLE_1_MENU_ITEM_AI_FLAG_16,
    DEBUG_BATTLE_1_MENU_ITEM_AI_FLAG_17,
    DEBUG_BATTLE_1_MENU_ITEM_CONTINUE,
};

enum BattleTerrain
{
    DEBUG_BATTLE_2_MENU_ITEM_TERRAIN_0,
    DEBUG_BATTLE_2_MENU_ITEM_TERRAIN_1,
    DEBUG_BATTLE_2_MENU_ITEM_TERRAIN_2,
    DEBUG_BATTLE_2_MENU_ITEM_TERRAIN_3,
    DEBUG_BATTLE_2_MENU_ITEM_TERRAIN_4,
    DEBUG_BATTLE_2_MENU_ITEM_TERRAIN_5,
    DEBUG_BATTLE_2_MENU_ITEM_TERRAIN_6,
    DEBUG_BATTLE_2_MENU_ITEM_TERRAIN_7,
    DEBUG_BATTLE_2_MENU_ITEM_TERRAIN_8,
    DEBUG_BATTLE_2_MENU_ITEM_TERRAIN_9,
};

enum GiveDebugMenu
{
    DEBUG_GIVE_MENU_ITEM_ITEM_X,
    DEBUG_GIVE_MENU_ITEM_POKEMON_SIMPLE,
    DEBUG_GIVE_MENU_ITEM_POKEMON_COMPLEX,
    DEBUG_GIVE_MENU_ITEM_MAX_MONEY,
    DEBUG_GIVE_MENU_ITEM_MAX_COINS,
    DEBUG_GIVE_MENU_ITEM_MAX_BATTLE_POINTS,
    DEBUG_GIVE_MENU_ITEM_DAYCARE_EGG,
};

enum SoundDebugMenu
{
    DEBUG_SOUND_MENU_ITEM_SE,
    DEBUG_SOUND_MENU_ITEM_MUS,
};

enum BerryFunctionsMenu
{
    DEBUG_BERRY_FUNCTIONS_MENU_CLEAR_ALL,
    DEBUG_BERRY_FUNCTIONS_MENU_READY,
    DEBUG_BERRY_FUNCTIONS_MENU_NEXT_STAGE,
    DEBUG_BERRY_FUNCTIONS_MENU_WEEDS,
    DEBUG_BERRY_FUNCTIONS_MENU_PESTS,
};

enum PlayerDebugMenu
{
    DEBUG_PLAYER_MENU_ITEM_PLAYER_NAME,
    DEBUG_PLAYER_MENU_ITEM_PLAYER_GENDER,
    DEBUG_PLAYER_MENU_ITEM_PLAYER_ID,
};

enum ROMInfoDebugMenu
{
    DEBUG_ROM_INFO_MENU_ITEM_SAVEBLOCK,
    DEBUG_ROM_INFO_MENU_ITEM_ROM_SPACE,
    DEBUG_ROM_INFO_MENU_ITEM_EXPANSION_VER,
};

// *******************************
// Constants
#define DEBUG_MENU_FONT FONT_SHORT

#define DEBUG_MENU_WIDTH_MAIN 17
#define DEBUG_MENU_HEIGHT_MAIN 9

#define DEBUG_MENU_WIDTH_EXTRA 10
#define DEBUG_MENU_HEIGHT_EXTRA 4

#define DEBUG_MENU_WIDTH_WEATHER 15
#define DEBUG_MENU_HEIGHT_WEATHER 3

#define DEBUG_MENU_WIDTH_SOUND 20
#define DEBUG_MENU_HEIGHT_SOUND 6

#define DEBUG_MENU_WIDTH_FLAGVAR 4
#define DEBUG_MENU_HEIGHT_FLAGVAR 2

#define DEBUG_NUMBER_DIGITS_FLAGS 4
#define DEBUG_NUMBER_DIGITS_VARIABLES 5
#define DEBUG_NUMBER_DIGITS_VARIABLE_VALUE 5
#define DEBUG_NUMBER_DIGITS_ITEMS 4
#define DEBUG_NUMBER_DIGITS_ITEM_QUANTITY 3

#define DEBUG_NUMBER_ICON_X 210
#define DEBUG_NUMBER_ICON_Y 50

#define DEBUG_MAX_MENU_ITEMS 50

// *******************************
struct DebugMonData
{
    u16 species;
    u8 level;
    bool8 isShiny:1;
    u8 nature:5;
    u8 abilityNum:2;
    u8 monIVs[NUM_STATS];
    u16 monMoves[MAX_MON_MOVES];
    u8 monEVs[NUM_STATS];
    u8 teraType;
    u8 dynamaxLevel:7;
    u8 gmaxFactor:1;
};

struct DebugMenuListData
{
    struct ListMenuItem listItems[20 + 1];
    u8 itemNames[DEBUG_MAX_MENU_ITEMS + 1][26];
    u8 listId;
};

struct DebugBattleData
{
    u8 submenu;
    u8 battleType;
    u8 battleTerrain;
    bool8 aiFlags[AI_FLAG_COUNT];
};

// EWRAM
static EWRAM_DATA struct DebugMonData *sDebugMonData = NULL;
static EWRAM_DATA struct DebugMenuListData *sDebugMenuListData = NULL;
static EWRAM_DATA struct DebugBattleData *sDebugBattleData = NULL;
EWRAM_DATA bool8 gIsDebugBattle = FALSE;
EWRAM_DATA u64 gDebugAIFlags = 0;

// *******************************
// Define functions
static void Debug_ReShowMainMenu(void);
static void Debug_ShowMenu(void (*HandleInput)(u8), struct ListMenuTemplate LMtemplate);
static void Debug_DestroyMenu(u8 taskId);
static void Debug_DestroyMenu_Full(u8 taskId);
static void DebugAction_Cancel(u8 taskId);
static void DebugAction_DestroyExtraWindow(u8 taskId);
static void Debug_InitDebugBattleData(void);
static void Debug_RefreshListMenu(u8 taskId);
static void Debug_RedrawListMenu(u8 taskId);

static void DebugAction_Util_Script_1(u8 taskId);
static void DebugAction_Util_Script_2(u8 taskId);
static void DebugAction_Util_Script_3(u8 taskId);
static void DebugAction_Util_Script_4(u8 taskId);
static void DebugAction_Util_Script_5(u8 taskId);
static void DebugAction_Util_Script_6(u8 taskId);
static void DebugAction_Util_Script_7(u8 taskId);
static void DebugAction_Util_Script_8(u8 taskId);

static void DebugAction_OpenUtilitiesMenu(u8 taskId);
static void DebugAction_OpenPCBagMenu(u8 taskId);
static void DebugAction_OpenPartyMenu(u8 taskId);
static void DebugAction_OpenScriptsMenu(u8 taskId);
static void DebugAction_OpenFlagsVarsMenu(u8 taskId);
static void DebugAction_OpenGiveMenu(u8 taskId);
static void DebugAction_OpenSoundMenu(u8 taskId);
static void DebugAction_OpenPlayerMenu(u8 taskId);
static void DebugAction_OpenROMInfoMenu(u8 taskId);

static void DebugTask_HandleMenuInput_Main(u8 taskId);
static void DebugTask_HandleMenuInput_Utilities(u8 taskId);
static void DebugTask_HandleMenuInput_PCBag(u8 taskId);
static void DebugTask_HandleMenuInput_PCBag_Fill(u8 taskId);
static void DebugTask_HandleMenuInput_Party(u8 taskId);
static void DebugTask_HandleMenuInput_Scripts(u8 taskId);
static void DebugTask_HandleMenuInput_FlagsVars(u8 taskId);
static void DebugTask_HandleMenuInput_Battle(u8 taskId);
static void DebugTask_HandleMenuInput_Give(u8 taskId);
static void DebugTask_HandleMenuInput_Sound(u8 taskId);
static void DebugTask_HandleMenuInput_BerryFunctions(u8 taskId);

static void DebugAction_Util_Fly(u8 taskId);
static void DebugAction_Util_Warp_Warp(u8 taskId);
static void DebugAction_Util_Warp_SelectMapGroup(u8 taskId);
static void DebugAction_Util_Warp_SelectMap(u8 taskId);
static void DebugAction_Util_Warp_SelectWarp(u8 taskId);
static void DebugAction_Util_Weather(u8 taskId);
static void DebugAction_Util_Weather_SelectId(u8 taskId);
static void DebugAction_Util_FontTest(u8 taskId);
static void DebugAction_TimeMenu_CheckWallClock(u8 taskId);
static void DebugAction_TimeMenu_SetWallClock(u8 taskId);
static void DebugAction_Util_WatchCredits(u8 taskId);
static void DebugAction_Util_CheatStart(u8 taskId);
static void DebugAction_Util_BerryFunctions(u8 taskId);
static void DebugAction_Util_CheckEWRAMCounters(u8 taskId);
static void DebugAction_Util_Steven_Multi(u8 taskId);
static void DebugAction_Util_OpenTimeMenu(u8 taskId);

static void DebugAction_TimeMenu_PrintTime(u8 taskId);
static void DebugAction_TimeMenu_PrintTimeOfDay(u8 taskId);
static void DebugAction_TimeMenu_TimesOfDay(u8 taskId);
static void DebugAction_TimeMenu_Weekdays(u8 taskId);

static void DebugAction_TimeMenu_ChangeTimeOfDay(u8 taskId);
static void DebugAction_TimeMenu_ChangeWeekdays(u8 taskId);

static void DebugAction_OpenPCBagFillMenu(u8 taskId);
static void DebugAction_PCBag_Fill_PCBoxes_Fast(u8 taskId);
static void DebugAction_PCBag_Fill_PCBoxes_Slow(u8 taskId);
static void DebugAction_PCBag_Fill_PCItemStorage(u8 taskId);
static void DebugAction_PCBag_Fill_PocketItems(u8 taskId);
static void DebugAction_PCBag_Fill_PocketPokeBalls(u8 taskId);
static void DebugAction_PCBag_Fill_PocketTMHM(u8 taskId);
static void DebugAction_PCBag_Fill_PocketBerries(u8 taskId);
static void DebugAction_PCBag_Fill_PocketKeyItems(u8 taskId);
static void DebugAction_PCBag_AccessPC(u8 taskId);
static void DebugAction_PCBag_ClearBag(u8 taskId);
static void DebugAction_PCBag_ClearBoxes(u8 taskId);

static void DebugAction_Party_MoveReminder(u8 taskId);
static void DebugAction_Party_HatchAnEgg(u8 taskId);
static void DebugAction_Party_HealParty(u8 taskId);
static void DebugAction_Party_InflictStatus1(u8 taskId);
static void DebugAction_Party_CheckEVs(u8 taskId);
static void DebugAction_Party_CheckIVs(u8 taskId);
static void DebugAction_Party_ClearParty(u8 taskId);

static void DebugAction_FlagsVars_Flags(u8 taskId);
static void DebugAction_FlagsVars_FlagsSelect(u8 taskId);
static void DebugAction_FlagsVars_Vars(u8 taskId);
static void DebugAction_FlagsVars_Select(u8 taskId);
static void DebugAction_FlagsVars_SetValue(u8 taskId);
static void DebugAction_FlagsVars_PokedexFlags_All(u8 taskId);
static void DebugAction_FlagsVars_PokedexFlags_Reset(u8 taskId);
static void DebugAction_FlagsVars_SwitchDex(u8 taskId);
static void DebugAction_FlagsVars_SwitchNatDex(u8 taskId);
static void DebugAction_FlagsVars_SwitchPokeNav(u8 taskId);
static void DebugAction_FlagsVars_SwitchMatchCall(u8 taskId);
static void DebugAction_FlagsVars_ToggleFlyFlags(u8 taskId);
static void DebugAction_FlagsVars_ToggleBadgeFlags(u8 taskId);
static void DebugAction_FlagsVars_ToggleGameClear(u8 taskId);
static void DebugAction_FlagsVars_ToggleFrontierPass(u8 taskId);
static void DebugAction_FlagsVars_CollisionOnOff(u8 taskId);
static void DebugAction_FlagsVars_EncounterOnOff(u8 taskId);
static void DebugAction_FlagsVars_TrainerSeeOnOff(u8 taskId);
static void DebugAction_FlagsVars_BagUseOnOff(u8 taskId);
static void DebugAction_FlagsVars_CatchingOnOff(u8 taskId);
static void DebugAction_FlagsVars_RunningShoes(u8 taskId);

static void Debug_InitializeBattle(u8 taskId);

static void DebugAction_Give_Item(u8 taskId);
static void DebugAction_Give_Item_SelectId(u8 taskId);
static void DebugAction_Give_Item_SelectQuantity(u8 taskId);
static void DebugAction_Give_PokemonSimple(u8 taskId);
static void DebugAction_Give_PokemonComplex(u8 taskId);
static void DebugAction_Give_Pokemon_SelectId(u8 taskId);
static void DebugAction_Give_Pokemon_SelectLevel(u8 taskId);
static void DebugAction_Give_Pokemon_SelectShiny(u8 taskId);
static void DebugAction_Give_Pokemon_SelectNature(u8 taskId);
static void DebugAction_Give_Pokemon_SelectAbility(u8 taskId);
static void DebugAction_Give_Pokemon_SelectTeraType(u8 taskId);
static void DebugAction_Give_Pokemon_SelectDynamaxLevel(u8 taskId);
static void DebugAction_Give_Pokemon_SelectGigantamaxFactor(u8 taskId);
static void DebugAction_Give_Pokemon_SelectIVs(u8 taskId);
static void DebugAction_Give_Pokemon_SelectEVs(u8 taskId);
static void DebugAction_Give_Pokemon_ComplexCreateMon(u8 taskId);
static void DebugAction_Give_Pokemon_Move(u8 taskId);
static void DebugAction_Give_MaxMoney(u8 taskId);
static void DebugAction_Give_MaxCoins(u8 taskId);
static void DebugAction_Give_MaxBattlePoints(u8 taskId);
static void DebugAction_Give_DayCareEgg(u8 taskId);

static void DebugAction_Sound_SE(u8 taskId);
static void DebugAction_Sound_SE_SelectId(u8 taskId);
static void DebugAction_Sound_MUS(u8 taskId);
static void DebugAction_Sound_MUS_SelectId(u8 taskId);

static void DebugAction_BerryFunctions_ClearAll(u8 taskId);
static void DebugAction_BerryFunctions_Ready(u8 taskId);
static void DebugAction_BerryFunctions_NextStage(u8 taskId);
static void DebugAction_BerryFunctions_Pests(u8 taskId);
static void DebugAction_BerryFunctions_Weeds(u8 taskId);

static void DebugAction_Player_Name(u8 taskId);
static void DebugAction_Player_Gender(u8 taskId);
static void DebugAction_Player_Id(u8 taskId);

static void DebugAction_ROMInfo_CheckSaveBlock(u8 taskId);
static void DebugAction_ROMInfo_CheckROMSpace(u8 taskId);
static void DebugAction_ROMInfo_ExpansionVersion(u8 taskId);

extern const u8 Debug_FlagsNotSetOverworldConfigMessage[];
extern const u8 Debug_FlagsNotSetBattleConfigMessage[];
extern const u8 Debug_FlagsAndVarNotSetBattleConfigMessage[];
extern const u8 Debug_EventScript_FontTest[];
extern const u8 Debug_EventScript_CheckEVs[];
extern const u8 Debug_EventScript_CheckIVs[];
extern const u8 Debug_EventScript_InflictStatus1[];
extern const u8 Debug_EventScript_Script_1[];
extern const u8 Debug_EventScript_Script_2[];
extern const u8 Debug_EventScript_Script_3[];
extern const u8 Debug_EventScript_Script_4[];
extern const u8 Debug_EventScript_Script_5[];
extern const u8 Debug_EventScript_Script_6[];
extern const u8 Debug_EventScript_Script_7[];
extern const u8 Debug_EventScript_Script_8[];
extern const u8 DebugScript_DaycareMonsNotCompatible[];
extern const u8 DebugScript_OneDaycareMons[];
extern const u8 DebugScript_ZeroDaycareMons[];

extern const u8 Debug_ShowFieldMessageStringVar4[];
extern const u8 Debug_CheatStart[];
extern const u8 Debug_HatchAnEgg[];
extern const u8 PlayersHouse_2F_EventScript_SetWallClock[];
extern const u8 PlayersHouse_2F_EventScript_CheckWallClock[];
extern const u8 Debug_CheckSaveBlock[];
extern const u8 Debug_CheckROMSpace[];
extern const u8 Debug_BoxFilledMessage[];
extern const u8 Debug_ShowExpansionVersion[];
extern const u8 Debug_EventScript_EWRAMCounters[];
extern const u8 Debug_EventScript_Steven_Multi[];
extern const u8 Debug_EventScript_PrintTimeOfDay[];
extern const u8 Debug_EventScript_TellTheTime[];
extern const u8 Debug_EventScript_FakeRTCNotEnabled[];

extern const u8 Debug_BerryPestsDisabled[];
extern const u8 Debug_BerryWeedsDisabled[];

extern const u8 TwoIsland_House_EventScript_ChooseMonToTutor[];

#include "data/map_group_count.h"

// Text
// General
static const u8 sDebugText_True[] =          _("TRUE");
static const u8 sDebugText_False[] =         _("FALSE");
static const u8 sDebugText_Colored_True[] =  _("{COLOR GREEN}TRUE");
static const u8 sDebugText_Colored_False[] = _("{COLOR RED}FALSE");
static const u8 sDebugText_Dashes[] =        _("---");
static const u8 sDebugText_Empty[] =         _("");
static const u8 sDebugText_Continue[] =      _("Continue…{CLEAR_TO 110}{RIGHT_ARROW}");
// Util Menu
static const u8 sDebugText_Util_WarpToMap_SelectMapGroup[] = _("Group: {STR_VAR_1}{CLEAR_TO 90}\n{CLEAR_TO 90}\n\n{STR_VAR_3}{CLEAR_TO 90}");
static const u8 sDebugText_Util_WarpToMap_SelectMap[] =      _("Map: {STR_VAR_1}{CLEAR_TO 90}\nMapSec:{CLEAR_TO 90}\n{STR_VAR_2}{CLEAR_TO 90}\n{STR_VAR_3}{CLEAR_TO 90}");
static const u8 sDebugText_Util_WarpToMap_SelectWarp[] =     _("Warp:{CLEAR_TO 90}\n{STR_VAR_1}{CLEAR_TO 90}\n{CLEAR_TO 90}\n{STR_VAR_3}{CLEAR_TO 90}");
static const u8 sDebugText_Util_WarpToMap_SelMax[] =         _("{STR_VAR_1} / {STR_VAR_2}");
static const u8 sDebugText_Util_Weather_ID[] =               _("Weather ID: {STR_VAR_3}\n{STR_VAR_1}\n{STR_VAR_2}");

//Time Menu

static const u8 *const gDayNameStringsTable[WEEKDAY_COUNT] = {
    COMPOUND_STRING("Sunday"),
    COMPOUND_STRING("Monday"),
    COMPOUND_STRING("Tuesday"),
    COMPOUND_STRING("Wednesday"),
    COMPOUND_STRING("Thursday"),
    COMPOUND_STRING("Friday"),
    COMPOUND_STRING("Saturday"),
};

static const u8 *const gTimeOfDayStringsTable[TIMES_OF_DAY_COUNT] = {
    COMPOUND_STRING("Morning"),
    COMPOUND_STRING("Day"),
    COMPOUND_STRING("Evening"),
    COMPOUND_STRING("Night"),
};

// Flags/Vars Menu
static const u8 sDebugText_FlagsVars_Flag[] =                _("Flag: {STR_VAR_1}{CLEAR_TO 90}\n{STR_VAR_2}{CLEAR_TO 90}\n{STR_VAR_3}");
static const u8 sDebugText_FlagsVars_VariableHex[] =         _("{STR_VAR_1}{CLEAR_TO 90}\n0x{STR_VAR_2}{CLEAR_TO 90}");
static const u8 sDebugText_FlagsVars_Variable[] =            _("Var: {STR_VAR_1}{CLEAR_TO 90}\nVal: {STR_VAR_3}{CLEAR_TO 90}\n{STR_VAR_2}");
static const u8 sDebugText_FlagsVars_VariableValueSet[] =    _("Var: {STR_VAR_1}{CLEAR_TO 90}\nVal: {STR_VAR_3}{CLEAR_TO 90}\n{STR_VAR_2}");
// Give Menu
static const u8 sDebugText_ItemQuantity[] =             _("Quantity:{CLEAR_TO 90}\n{STR_VAR_1}{CLEAR_TO 90}\n\n{STR_VAR_2}");
static const u8 sDebugText_ItemID[] =                   _("Item ID: {STR_VAR_3}\n{STR_VAR_1}{CLEAR_TO 90}\n\n{STR_VAR_2}");
static const u8 sDebugText_PokemonID[] =                _("Species: {STR_VAR_3}\n{STR_VAR_1}{CLEAR_TO 90}\n\n{STR_VAR_2}{CLEAR_TO 90}");
static const u8 sDebugText_PokemonLevel[] =             _("Level:{CLEAR_TO 90}\n{STR_VAR_1}{CLEAR_TO 90}\n{CLEAR_TO 90}\n{STR_VAR_2}{CLEAR_TO 90}");
static const u8 sDebugText_PokemonShiny[] =             _("Shiny:{CLEAR_TO 90}\n   {STR_VAR_2}{CLEAR_TO 90}\n{CLEAR_TO 90}\n{CLEAR_TO 90}");
static const u8 sDebugText_PokemonAbility[] =           _("Ability Num: {STR_VAR_3}{CLEAR_TO 90}\n{STR_VAR_1}{CLEAR_TO 90}\n{CLEAR_TO 90}\n{STR_VAR_2}{CLEAR_TO 90}");
static const u8 sDebugText_PokemonTeraType[] =          _("Tera Type: {STR_VAR_3}{CLEAR_TO 90}\n{STR_VAR_1}{CLEAR_TO 90}\n{CLEAR_TO 90}\n{STR_VAR_2}{CLEAR_TO 90}");
static const u8 sDebugText_PokemonDynamaxLevel[] =      _("Dmax Lvl:{CLEAR_TO 90}\n{STR_VAR_1}{CLEAR_TO 90}\n{CLEAR_TO 90}\n{STR_VAR_2}{CLEAR_TO 90}");
static const u8 sDebugText_PokemonGmaxFactor[] =        _("Gmax Factor:{CLEAR_TO 90}\n   {STR_VAR_2}{CLEAR_TO 90}\n{CLEAR_TO 90}\n{CLEAR_TO 90}");
static const u8 sDebugText_IVs[] =                      _("IV {STR_VAR_1}:{CLEAR_TO 90}\n    {STR_VAR_3}{CLEAR_TO 90}\n{CLEAR_TO 90}\n{STR_VAR_2}{CLEAR_TO 90}");
static const u8 sDebugText_EVs[] =                      _("EV {STR_VAR_1}:{CLEAR_TO 90}\n    {STR_VAR_3}{CLEAR_TO 90}\n{CLEAR_TO 90}\n{STR_VAR_2}{CLEAR_TO 90}");
// Sound Menu
static const u8 sDebugText_Sound_SFX_ID[] =             _("SFX ID: {STR_VAR_3}   {START_BUTTON} Stop\n{STR_VAR_1}    \n{STR_VAR_2}");
static const u8 sDebugText_Sound_Music_ID[] =           _("Music ID: {STR_VAR_3}   {START_BUTTON} Stop\n{STR_VAR_1}    \n{STR_VAR_2}");

const u8 *const gText_DigitIndicator[] =
{
    COMPOUND_STRING("{LEFT_ARROW}+1{RIGHT_ARROW}        "),
    COMPOUND_STRING("{LEFT_ARROW}+10{RIGHT_ARROW}       "),
    COMPOUND_STRING("{LEFT_ARROW}+100{RIGHT_ARROW}      "),
    COMPOUND_STRING("{LEFT_ARROW}+1000{RIGHT_ARROW}     "),
    COMPOUND_STRING("{LEFT_ARROW}+10000{RIGHT_ARROW}    "),
    COMPOUND_STRING("{LEFT_ARROW}+100000{RIGHT_ARROW}   "),
    COMPOUND_STRING("{LEFT_ARROW}+1000000{RIGHT_ARROW}  "),
    COMPOUND_STRING("{LEFT_ARROW}+10000000{RIGHT_ARROW} "),
};

static const s32 sPowersOfTen[] =
{
             1,
            10,
           100,
          1000,
         10000,
        100000,
       1000000,
      10000000,
     100000000,
    1000000000,
};

// *******************************
// List Menu Items
static const struct ListMenuItem sDebugMenu_Items_Main[] =
{
    [DEBUG_MENU_ITEM_UTILITIES]     = {COMPOUND_STRING("Utilities…{CLEAR_TO 110}{RIGHT_ARROW}"),    DEBUG_MENU_ITEM_UTILITIES},
    [DEBUG_MENU_ITEM_PCBAG]         = {COMPOUND_STRING("PC/Bag…{CLEAR_TO 110}{RIGHT_ARROW}"),       DEBUG_MENU_ITEM_PCBAG},
    [DEBUG_MENU_ITEM_PARTY]         = {COMPOUND_STRING("Party…{CLEAR_TO 110}{RIGHT_ARROW}"),        DEBUG_MENU_ITEM_PARTY},
    [DEBUG_MENU_ITEM_GIVE]          = {COMPOUND_STRING("Give X…{CLEAR_TO 110}{RIGHT_ARROW}"),       DEBUG_MENU_ITEM_GIVE},
    [DEBUG_MENU_ITEM_PLAYER]        = {COMPOUND_STRING("Player…{CLEAR_TO 110}{RIGHT_ARROW}"),       DEBUG_MENU_ITEM_PLAYER},
    [DEBUG_MENU_ITEM_SCRIPTS]       = {COMPOUND_STRING("Scripts…{CLEAR_TO 110}{RIGHT_ARROW}"),      DEBUG_MENU_ITEM_SCRIPTS},
    [DEBUG_MENU_ITEM_FLAGVAR]       = {COMPOUND_STRING("Flags & Vars…{CLEAR_TO 110}{RIGHT_ARROW}"), DEBUG_MENU_ITEM_FLAGVAR},
    //[DEBUG_MENU_ITEM_BATTLE]        = {COMPOUND_STRING("Battle Test{CLEAR_TO 110}{RIGHT_ARROW}"),   DEBUG_MENU_ITEM_BATTLE},
    [DEBUG_MENU_ITEM_SOUND]         = {COMPOUND_STRING("Sound…{CLEAR_TO 110}{RIGHT_ARROW}"),        DEBUG_MENU_ITEM_SOUND},
    [DEBUG_MENU_ITEM_ROMINFO]       = {COMPOUND_STRING("ROM Info…{CLEAR_TO 110}{RIGHT_ARROW}"),     DEBUG_MENU_ITEM_ROMINFO},
    [DEBUG_MENU_ITEM_CANCEL]        = {COMPOUND_STRING("Cancel"),                                   DEBUG_MENU_ITEM_CANCEL},
};

static const struct ListMenuItem sDebugMenu_Items_Utilities[] =
{
    [DEBUG_UTIL_MENU_ITEM_FLY]             = {COMPOUND_STRING("Fly to map…{CLEAR_TO 110}{RIGHT_ARROW}"),       DEBUG_UTIL_MENU_ITEM_FLY},
    [DEBUG_UTIL_MENU_ITEM_WARP]            = {COMPOUND_STRING("Warp to map warp…{CLEAR_TO 110}{RIGHT_ARROW}"), DEBUG_UTIL_MENU_ITEM_WARP},
    [DEBUG_UTIL_MENU_ITEM_WEATHER]         = {COMPOUND_STRING("Set weather…{CLEAR_TO 110}{RIGHT_ARROW}"),      DEBUG_UTIL_MENU_ITEM_WEATHER},
    [DEBUG_UTIL_MENU_ITEM_FONT_TEST]       = {COMPOUND_STRING("Font Test…{CLEAR_TO 110}{RIGHT_ARROW}"),        DEBUG_UTIL_MENU_ITEM_FONT_TEST},
    [DEBUG_UTIL_MENU_ITEM_TIME_MENU]       = {COMPOUND_STRING("Time Functions…{CLEAR_TO 110}{RIGHT_ARROW}"),   DEBUG_UTIL_MENU_ITEM_TIME_MENU},
    [DEBUG_UTIL_MENU_ITEM_WATCHCREDITS]    = {COMPOUND_STRING("Watch credits…{CLEAR_TO 110}{RIGHT_ARROW}"),    DEBUG_UTIL_MENU_ITEM_WATCHCREDITS},
    [DEBUG_UTIL_MENU_ITEM_CHEAT]           = {COMPOUND_STRING("Cheat start"),                                  DEBUG_UTIL_MENU_ITEM_CHEAT},
    [DEBUG_UTIL_MENU_ITEM_BERRY_FUNCTIONS] = {COMPOUND_STRING("Berry Functions…{CLEAR_TO 110}{RIGHT_ARROW}"),  DEBUG_UTIL_MENU_ITEM_BERRY_FUNCTIONS},
    [DEBUG_UTIL_MENU_ITEM_EWRAM_COUNTERS]  = {COMPOUND_STRING("EWRAM Counters…{CLEAR_TO 110}{RIGHT_ARROW}"),   DEBUG_UTIL_MENU_ITEM_EWRAM_COUNTERS},
    [DEBUG_UTIL_MENU_ITEM_STEVEN_MULTI]    = {COMPOUND_STRING("Steven Multi"),                                 DEBUG_UTIL_MENU_ITEM_STEVEN_MULTI},
};

static const struct ListMenuItem sDebugMenu_Items_TimeMenu[] =
{
    [DEBUG_TIME_MENU_ITEM_PRINTTIME]      = {COMPOUND_STRING("Print current time…"),                      DEBUG_TIME_MENU_ITEM_PRINTTIME},
    [DEBUG_TIME_MENU_ITEM_PRINTTIMEOFDAY] = {COMPOUND_STRING("{FONT_NARROW}Print current time of day…"),  DEBUG_TIME_MENU_ITEM_PRINTTIMEOFDAY},
    [DEBUG_TIME_MENU_ITEM_TIMESOFDAY]     = {COMPOUND_STRING("{FONT_NARROW}Change current time of day…"), DEBUG_TIME_MENU_ITEM_TIMESOFDAY},
    [DEBUG_TIME_MENU_ITEM_WEEKDAYS]       = {COMPOUND_STRING("Change current weekday…"),                  DEBUG_TIME_MENU_ITEM_WEEKDAYS},
    [DEBUG_TIME_MENU_ITEM_CHECKWALLCLOCK] = {COMPOUND_STRING("Check wall clock…"),                        DEBUG_TIME_MENU_ITEM_CHECKWALLCLOCK},
    [DEBUG_TIME_MENU_ITEM_SETWALLCLOCK]   = {COMPOUND_STRING("Set wall clock…"),                          DEBUG_TIME_MENU_ITEM_SETWALLCLOCK},
};

static const struct ListMenuItem sDebugMenu_Items_TimeMenu_TimesOfDay[] =
{
    [DEBUG_TIME_MENU_ITEM_MORNING] = {gTimeOfDayStringsTable[TIME_MORNING], DEBUG_TIME_MENU_ITEM_MORNING},
    [DEBUG_TIME_MENU_ITEM_DAY] = {gTimeOfDayStringsTable[TIME_DAY],         DEBUG_TIME_MENU_ITEM_DAY},
    [DEBUG_TIME_MENU_ITEM_EVENING] = {gTimeOfDayStringsTable[TIME_EVENING], DEBUG_TIME_MENU_ITEM_EVENING},
    [DEBUG_TIME_MENU_ITEM_NIGHT] = {gTimeOfDayStringsTable[TIME_NIGHT],     DEBUG_TIME_MENU_ITEM_NIGHT},
};

static const struct ListMenuItem sDebugMenu_Items_TimeMenu_Weekdays[] =
{
    [DEBUG_TIME_MENU_ITEM_SUNDAY] = {gDayNameStringsTable[WEEKDAY_SUN],    DEBUG_TIME_MENU_ITEM_SUNDAY},
    [DEBUG_TIME_MENU_ITEM_MONDAY] = {gDayNameStringsTable[WEEKDAY_MON],    DEBUG_TIME_MENU_ITEM_MONDAY},
    [DEBUG_TIME_MENU_ITEM_TUESDAY] = {gDayNameStringsTable[WEEKDAY_TUE],   DEBUG_TIME_MENU_ITEM_TUESDAY},
    [DEBUG_TIME_MENU_ITEM_WEDNESDAY] = {gDayNameStringsTable[WEEKDAY_WED], DEBUG_TIME_MENU_ITEM_WEDNESDAY},
    [DEBUG_TIME_MENU_ITEM_THURSDAY] = {gDayNameStringsTable[WEEKDAY_THU],  DEBUG_TIME_MENU_ITEM_THURSDAY},
    [DEBUG_TIME_MENU_ITEM_FRIDAY] = {gDayNameStringsTable[WEEKDAY_FRI],    DEBUG_TIME_MENU_ITEM_FRIDAY},
    [DEBUG_TIME_MENU_ITEM_SATURDAY] = {gDayNameStringsTable[WEEKDAY_SAT],  DEBUG_TIME_MENU_ITEM_SATURDAY},
};

static const struct ListMenuItem sDebugMenu_Items_PCBag[] =
{
    [DEBUG_PCBAG_MENU_ITEM_ACCESS_PC]   = {COMPOUND_STRING("Access PC"),                        DEBUG_PCBAG_MENU_ITEM_ACCESS_PC},
    [DEBUG_PCBAG_MENU_ITEM_FILL]        = {COMPOUND_STRING("Fill…{CLEAR_TO 110}{RIGHT_ARROW}"), DEBUG_PCBAG_MENU_ITEM_FILL},
    [DEBUG_PCBAG_MENU_ITEM_CLEAR_BAG]   = {COMPOUND_STRING("Clear Bag"),                        DEBUG_PCBAG_MENU_ITEM_CLEAR_BAG},
    [DEBUG_PCBAG_MENU_ITEM_CLEAR_BOXES] = {COMPOUND_STRING("Clear Storage Boxes"),              DEBUG_PCBAG_MENU_ITEM_CLEAR_BOXES},
};

static const struct ListMenuItem sDebugMenu_Items_PCBag_Fill[] =
{
    [DEBUG_PCBAG_MENU_ITEM_FILL_PC_BOXES_FAST]    = {COMPOUND_STRING("Fill PC Boxes Fast"),        DEBUG_PCBAG_MENU_ITEM_FILL_PC_BOXES_FAST},
    [DEBUG_PCBAG_MENU_ITEM_FILL_PC_BOXES_SLOW]    = {COMPOUND_STRING("Fill PC Boxes Slow (LAG!)"), DEBUG_PCBAG_MENU_ITEM_FILL_PC_BOXES_SLOW},
    [DEBUG_PCBAG_MENU_ITEM_FILL_PC_ITEMS]         = {COMPOUND_STRING("Fill PC Items") ,            DEBUG_PCBAG_MENU_ITEM_FILL_PC_ITEMS},
    [DEBUG_PCBAG_MENU_ITEM_FILL_POCKET_ITEMS]     = {COMPOUND_STRING("Fill Pocket Items"),         DEBUG_PCBAG_MENU_ITEM_FILL_POCKET_ITEMS},
    [DEBUG_PCBAG_MENU_ITEM_FILL_POCKET_BALLS]     = {COMPOUND_STRING("Fill Pocket Poké Balls"),    DEBUG_PCBAG_MENU_ITEM_FILL_POCKET_BALLS},
    [DEBUG_PCBAG_MENU_ITEM_FILL_POCKET_TMHM]      = {COMPOUND_STRING("Fill Pocket TMHM"),          DEBUG_PCBAG_MENU_ITEM_FILL_POCKET_TMHM},
    [DEBUG_PCBAG_MENU_ITEM_FILL_POCKET_BERRIES]   = {COMPOUND_STRING("Fill Pocket Berries"),       DEBUG_PCBAG_MENU_ITEM_FILL_POCKET_BERRIES},
    [DEBUG_PCBAG_MENU_ITEM_FILL_POCKET_KEY_ITEMS] = {COMPOUND_STRING("Fill Pocket Key Items"),     DEBUG_PCBAG_MENU_ITEM_FILL_POCKET_KEY_ITEMS},
};

static const struct ListMenuItem sDebugMenu_Items_Party[] =
{
    [DEBUG_PARTY_MENU_ITEM_MOVE_REMINDER]   = {COMPOUND_STRING("Move Reminder"),   DEBUG_PARTY_MENU_ITEM_MOVE_REMINDER},
    [DEBUG_PARTY_MENU_ITEM_HATCH_AN_EGG]    = {COMPOUND_STRING("Hatch an Egg"),    DEBUG_PARTY_MENU_ITEM_HATCH_AN_EGG},
    [DEBUG_PARTY_MENU_ITEM_HEAL_PARTY]      = {COMPOUND_STRING("Heal party"),      DEBUG_PARTY_MENU_ITEM_HEAL_PARTY},
    [DEBUG_PARTY_MENU_ITEM_INFLICT_STATUS1] = {COMPOUND_STRING("Inflict Status1"), DEBUG_PARTY_MENU_ITEM_INFLICT_STATUS1},
    [DEBUG_PARTY_MENU_ITEM_CHECK_EVS]       = {COMPOUND_STRING("Check EVs"),       DEBUG_PARTY_MENU_ITEM_CHECK_EVS},
    [DEBUG_PARTY_MENU_ITEM_CHECK_IVS]       = {COMPOUND_STRING("Check IVs"),       DEBUG_PARTY_MENU_ITEM_CHECK_IVS},
    [DEBUG_PARTY_MENU_ITEM_CLEAR_PARTY]     = {COMPOUND_STRING("Clear Party"),     DEBUG_PARTY_MENU_ITEM_CLEAR_PARTY},
};

static const struct ListMenuItem sDebugMenu_Items_Scripts[] =
{
    [DEBUG_UTIL_MENU_ITEM_SCRIPT_1] = {COMPOUND_STRING("Script 1"), DEBUG_UTIL_MENU_ITEM_SCRIPT_1},
    [DEBUG_UTIL_MENU_ITEM_SCRIPT_2] = {COMPOUND_STRING("Script 2"), DEBUG_UTIL_MENU_ITEM_SCRIPT_2},
    [DEBUG_UTIL_MENU_ITEM_SCRIPT_3] = {COMPOUND_STRING("Script 3"), DEBUG_UTIL_MENU_ITEM_SCRIPT_3},
    [DEBUG_UTIL_MENU_ITEM_SCRIPT_4] = {COMPOUND_STRING("Script 4"), DEBUG_UTIL_MENU_ITEM_SCRIPT_4},
    [DEBUG_UTIL_MENU_ITEM_SCRIPT_5] = {COMPOUND_STRING("Script 5"), DEBUG_UTIL_MENU_ITEM_SCRIPT_5},
    [DEBUG_UTIL_MENU_ITEM_SCRIPT_6] = {COMPOUND_STRING("Script 6"), DEBUG_UTIL_MENU_ITEM_SCRIPT_6},
    [DEBUG_UTIL_MENU_ITEM_SCRIPT_7] = {COMPOUND_STRING("Script 7"), DEBUG_UTIL_MENU_ITEM_SCRIPT_7},
    [DEBUG_UTIL_MENU_ITEM_SCRIPT_8] = {COMPOUND_STRING("Script 8"), DEBUG_UTIL_MENU_ITEM_SCRIPT_8},
};

static const struct ListMenuItem sDebugMenu_Items_FlagsVars[] =
{
    [DEBUG_FLAGVAR_MENU_ITEM_FLAGS]                = {COMPOUND_STRING("Set Flag XYZ…{CLEAR_TO 110}{RIGHT_ARROW}"), DEBUG_FLAGVAR_MENU_ITEM_FLAGS},
    [DEBUG_FLAGVAR_MENU_ITEM_VARS]                 = {COMPOUND_STRING("Set Var XYZ…{CLEAR_TO 110}{RIGHT_ARROW}"),  DEBUG_FLAGVAR_MENU_ITEM_VARS},
    [DEBUG_FLAGVAR_MENU_ITEM_DEXFLAGS_ALL]         = {COMPOUND_STRING("Pokédex Flags All"),                        DEBUG_FLAGVAR_MENU_ITEM_DEXFLAGS_ALL},
    [DEBUG_FLAGVAR_MENU_ITEM_DEXFLAGS_RESET]       = {COMPOUND_STRING("Pokédex Flags Reset"),                      DEBUG_FLAGVAR_MENU_ITEM_DEXFLAGS_RESET},
    [DEBUG_FLAGVAR_MENU_ITEM_TOGGLE_POKEDEX]       = {COMPOUND_STRING("Toggle {STR_VAR_1}Pokédex"),                DEBUG_FLAGVAR_MENU_ITEM_TOGGLE_POKEDEX},
    [DEBUG_FLAGVAR_MENU_ITEM_TOGGLE_NATDEX]        = {COMPOUND_STRING("Toggle {STR_VAR_1}National Dex"),           DEBUG_FLAGVAR_MENU_ITEM_TOGGLE_NATDEX},
    [DEBUG_FLAGVAR_MENU_ITEM_TOGGLE_POKENAV]       = {COMPOUND_STRING("Toggle {STR_VAR_1}PokéNav"),                DEBUG_FLAGVAR_MENU_ITEM_TOGGLE_POKENAV},
    [DEBUG_FLAGVAR_MENU_ITEM_TOGGLE_MATCH_CALL]    = {COMPOUND_STRING("Toggle {STR_VAR_1}Match Call"),             DEBUG_FLAGVAR_MENU_ITEM_TOGGLE_MATCH_CALL},
    [DEBUG_FLAGVAR_MENU_ITEM_TOGGLE_RUN_SHOES]     = {COMPOUND_STRING("Toggle {STR_VAR_1}Running Shoes"),          DEBUG_FLAGVAR_MENU_ITEM_TOGGLE_RUN_SHOES},
    [DEBUG_FLAGVAR_MENU_ITEM_TOGGLE_LOCATIONS]     = {COMPOUND_STRING("Toggle {STR_VAR_1}Fly Flags"),              DEBUG_FLAGVAR_MENU_ITEM_TOGGLE_LOCATIONS},
    [DEBUG_FLAGVAR_MENU_ITEM_TOGGLE_BADGES_ALL]    = {COMPOUND_STRING("Toggle {STR_VAR_1}All badges"),             DEBUG_FLAGVAR_MENU_ITEM_TOGGLE_BADGES_ALL},
    [DEBUG_FLAGVAR_MENU_ITEM_TOGGLE_GAME_CLEAR]    = {COMPOUND_STRING("Toggle {STR_VAR_1}Game clear"),             DEBUG_FLAGVAR_MENU_ITEM_TOGGLE_GAME_CLEAR},
    [DEBUG_FLAGVAR_MENU_ITEM_TOGGLE_FRONTIER_PASS] = {COMPOUND_STRING("Toggle {STR_VAR_1}Frontier Pass"),          DEBUG_FLAGVAR_MENU_ITEM_TOGGLE_FRONTIER_PASS},
    [DEBUG_FLAGVAR_MENU_ITEM_TOGGLE_COLLISION]     = {COMPOUND_STRING("Toggle {STR_VAR_1}Collision OFF"),          DEBUG_FLAGVAR_MENU_ITEM_TOGGLE_COLLISION},
    [DEBUG_FLAGVAR_MENU_ITEM_TOGGLE_ENCOUNTER]     = {COMPOUND_STRING("Toggle {STR_VAR_1}Encounter OFF"),          DEBUG_FLAGVAR_MENU_ITEM_TOGGLE_ENCOUNTER},
    [DEBUG_FLAGVAR_MENU_ITEM_TOGGLE_TRAINER_SEE]   = {COMPOUND_STRING("Toggle {STR_VAR_1}Trainer See OFF"),        DEBUG_FLAGVAR_MENU_ITEM_TOGGLE_TRAINER_SEE},
    [DEBUG_FLAGVAR_MENU_ITEM_TOGGLE_BAG_USE]       = {COMPOUND_STRING("Toggle {STR_VAR_1}Bag Use OFF"),            DEBUG_FLAGVAR_MENU_ITEM_TOGGLE_BAG_USE},
    [DEBUG_FLAGVAR_MENU_ITEM_TOGGLE_CATCHING]      = {COMPOUND_STRING("Toggle {STR_VAR_1}Catching OFF"),           DEBUG_FLAGVAR_MENU_ITEM_TOGGLE_CATCHING},
};

static const struct ListMenuItem sDebugMenu_Items_Battle_0[] =
{
    [DEBUG_BATTLE_0_MENU_ITEM_WILD]        = {COMPOUND_STRING("Wild…{CLEAR_TO 110}{RIGHT_ARROW}"),        DEBUG_BATTLE_0_MENU_ITEM_WILD},
    [DEBUG_BATTLE_0_MENU_ITEM_WILD_DOUBLE] = {COMPOUND_STRING("Wild Double…{CLEAR_TO 110}{RIGHT_ARROW}"), DEBUG_BATTLE_0_MENU_ITEM_WILD_DOUBLE},
    [DEBUG_BATTLE_0_MENU_ITEM_SINGLE]      = {COMPOUND_STRING("Single…{CLEAR_TO 110}{RIGHT_ARROW}"),      DEBUG_BATTLE_0_MENU_ITEM_SINGLE},
    [DEBUG_BATTLE_0_MENU_ITEM_DOUBLE]      = {COMPOUND_STRING("Double…{CLEAR_TO 110}{RIGHT_ARROW}"),      DEBUG_BATTLE_0_MENU_ITEM_DOUBLE},
    [DEBUG_BATTLE_0_MENU_ITEM_MULTI]       = {COMPOUND_STRING("Multi…{CLEAR_TO 110}{RIGHT_ARROW}"),       DEBUG_BATTLE_0_MENU_ITEM_MULTI},
};

static const struct ListMenuItem sDebugMenu_Items_Battle_1[] =
{
    [DEBUG_BATTLE_1_MENU_ITEM_AI_FLAG_00] = {COMPOUND_STRING("{STR_VAR_1}Check bad move"),        DEBUG_BATTLE_1_MENU_ITEM_AI_FLAG_00},
    [DEBUG_BATTLE_1_MENU_ITEM_AI_FLAG_01] = {COMPOUND_STRING("{STR_VAR_1}Try to faint"),          DEBUG_BATTLE_1_MENU_ITEM_AI_FLAG_01},
    [DEBUG_BATTLE_1_MENU_ITEM_AI_FLAG_02] = {COMPOUND_STRING("{STR_VAR_1}Check viability"),       DEBUG_BATTLE_1_MENU_ITEM_AI_FLAG_02},
    [DEBUG_BATTLE_1_MENU_ITEM_AI_FLAG_03] = {COMPOUND_STRING("{STR_VAR_1}Setup first turn"),      DEBUG_BATTLE_1_MENU_ITEM_AI_FLAG_03},
    [DEBUG_BATTLE_1_MENU_ITEM_AI_FLAG_04] = {COMPOUND_STRING("{STR_VAR_1}Risky"),                 DEBUG_BATTLE_1_MENU_ITEM_AI_FLAG_04},
    [DEBUG_BATTLE_1_MENU_ITEM_AI_FLAG_05] = {COMPOUND_STRING("{STR_VAR_1}Prefer strongest move"), DEBUG_BATTLE_1_MENU_ITEM_AI_FLAG_05},
    [DEBUG_BATTLE_1_MENU_ITEM_AI_FLAG_06] = {COMPOUND_STRING("{STR_VAR_1}Prefer Baton Pass"),     DEBUG_BATTLE_1_MENU_ITEM_AI_FLAG_06},
    [DEBUG_BATTLE_1_MENU_ITEM_AI_FLAG_07] = {COMPOUND_STRING("{STR_VAR_1}Double battle"),         DEBUG_BATTLE_1_MENU_ITEM_AI_FLAG_07},
    [DEBUG_BATTLE_1_MENU_ITEM_AI_FLAG_08] = {COMPOUND_STRING("{STR_VAR_1}HP aware"),              DEBUG_BATTLE_1_MENU_ITEM_AI_FLAG_08},
    [DEBUG_BATTLE_1_MENU_ITEM_AI_FLAG_09] = {COMPOUND_STRING("{STR_VAR_1}Negate Unaware"),        DEBUG_BATTLE_1_MENU_ITEM_AI_FLAG_09},
    [DEBUG_BATTLE_1_MENU_ITEM_AI_FLAG_10] = {COMPOUND_STRING("{STR_VAR_1}Will suicide"),          DEBUG_BATTLE_1_MENU_ITEM_AI_FLAG_10},
    [DEBUG_BATTLE_1_MENU_ITEM_AI_FLAG_11] = {COMPOUND_STRING("{STR_VAR_1}Help partner"),          DEBUG_BATTLE_1_MENU_ITEM_AI_FLAG_11},
    [DEBUG_BATTLE_1_MENU_ITEM_AI_FLAG_12] = {COMPOUND_STRING("{STR_VAR_1}Prefer status moves"),   DEBUG_BATTLE_1_MENU_ITEM_AI_FLAG_12},
    [DEBUG_BATTLE_1_MENU_ITEM_AI_FLAG_13] = {COMPOUND_STRING("{STR_VAR_1}Stall"),                 DEBUG_BATTLE_1_MENU_ITEM_AI_FLAG_13},
    [DEBUG_BATTLE_1_MENU_ITEM_AI_FLAG_14] = {COMPOUND_STRING("{STR_VAR_1}Screener"),              DEBUG_BATTLE_1_MENU_ITEM_AI_FLAG_14},
    [DEBUG_BATTLE_1_MENU_ITEM_AI_FLAG_15] = {COMPOUND_STRING("{STR_VAR_1}Smart switching"),       DEBUG_BATTLE_1_MENU_ITEM_AI_FLAG_15},
    [DEBUG_BATTLE_1_MENU_ITEM_AI_FLAG_16] = {COMPOUND_STRING("{STR_VAR_1}Ace pokemon"),           DEBUG_BATTLE_1_MENU_ITEM_AI_FLAG_16},
    [DEBUG_BATTLE_1_MENU_ITEM_AI_FLAG_17] = {COMPOUND_STRING("{STR_VAR_1}Omniscient"),            DEBUG_BATTLE_1_MENU_ITEM_AI_FLAG_17},
    [DEBUG_BATTLE_1_MENU_ITEM_CONTINUE]   = {sDebugText_Continue,                                 DEBUG_BATTLE_1_MENU_ITEM_CONTINUE},
};

static const struct ListMenuItem sDebugMenu_Items_Battle_2[] =
{
    [DEBUG_BATTLE_2_MENU_ITEM_TERRAIN_0] = {COMPOUND_STRING("Grass…{CLEAR_TO 110}{RIGHT_ARROW}"),      DEBUG_BATTLE_2_MENU_ITEM_TERRAIN_0},
    [DEBUG_BATTLE_2_MENU_ITEM_TERRAIN_1] = {COMPOUND_STRING("Long grass…{CLEAR_TO 110}{RIGHT_ARROW}"), DEBUG_BATTLE_2_MENU_ITEM_TERRAIN_1},
    [DEBUG_BATTLE_2_MENU_ITEM_TERRAIN_2] = {COMPOUND_STRING("Sand…{CLEAR_TO 110}{RIGHT_ARROW}"),       DEBUG_BATTLE_2_MENU_ITEM_TERRAIN_2},
    [DEBUG_BATTLE_2_MENU_ITEM_TERRAIN_3] = {COMPOUND_STRING("Underwater…{CLEAR_TO 110}{RIGHT_ARROW}"), DEBUG_BATTLE_2_MENU_ITEM_TERRAIN_3},
    [DEBUG_BATTLE_2_MENU_ITEM_TERRAIN_4] = {COMPOUND_STRING("Water…{CLEAR_TO 110}{RIGHT_ARROW}"),      DEBUG_BATTLE_2_MENU_ITEM_TERRAIN_4},
    [DEBUG_BATTLE_2_MENU_ITEM_TERRAIN_5] = {COMPOUND_STRING("Pond…{CLEAR_TO 110}{RIGHT_ARROW}"),       DEBUG_BATTLE_2_MENU_ITEM_TERRAIN_5},
    [DEBUG_BATTLE_2_MENU_ITEM_TERRAIN_6] = {COMPOUND_STRING("Mountain…{CLEAR_TO 110}{RIGHT_ARROW}"),   DEBUG_BATTLE_2_MENU_ITEM_TERRAIN_6},
    [DEBUG_BATTLE_2_MENU_ITEM_TERRAIN_7] = {COMPOUND_STRING("Cave…{CLEAR_TO 110}{RIGHT_ARROW}"),       DEBUG_BATTLE_2_MENU_ITEM_TERRAIN_7},
    [DEBUG_BATTLE_2_MENU_ITEM_TERRAIN_8] = {COMPOUND_STRING("Building…{CLEAR_TO 110}{RIGHT_ARROW}"),   DEBUG_BATTLE_2_MENU_ITEM_TERRAIN_8},
    [DEBUG_BATTLE_2_MENU_ITEM_TERRAIN_9] = {COMPOUND_STRING("Plain…{CLEAR_TO 110}{RIGHT_ARROW}"),      DEBUG_BATTLE_2_MENU_ITEM_TERRAIN_9},
};

static const struct ListMenuItem sDebugMenu_Items_Give[] =
{
    [DEBUG_GIVE_MENU_ITEM_ITEM_X]            = {COMPOUND_STRING("Give item XYZ…{CLEAR_TO 110}{RIGHT_ARROW}"),    DEBUG_GIVE_MENU_ITEM_ITEM_X},
    [DEBUG_GIVE_MENU_ITEM_POKEMON_SIMPLE]    = {COMPOUND_STRING("Pokémon (Basic){CLEAR_TO 110}{RIGHT_ARROW}"),   DEBUG_GIVE_MENU_ITEM_POKEMON_SIMPLE},
    [DEBUG_GIVE_MENU_ITEM_POKEMON_COMPLEX]   = {COMPOUND_STRING("Pokémon (Complex){CLEAR_TO 110}{RIGHT_ARROW}"), DEBUG_GIVE_MENU_ITEM_POKEMON_COMPLEX},
    [DEBUG_GIVE_MENU_ITEM_MAX_MONEY]         = {COMPOUND_STRING("Max Money"),                                    DEBUG_GIVE_MENU_ITEM_MAX_MONEY},
    [DEBUG_GIVE_MENU_ITEM_MAX_COINS]         = {COMPOUND_STRING("Max Coins"),                                    DEBUG_GIVE_MENU_ITEM_MAX_COINS},
    [DEBUG_GIVE_MENU_ITEM_MAX_BATTLE_POINTS] = {COMPOUND_STRING("Max Battle Points"),                            DEBUG_GIVE_MENU_ITEM_MAX_BATTLE_POINTS},
    [DEBUG_GIVE_MENU_ITEM_DAYCARE_EGG]       = {COMPOUND_STRING("Daycare Egg"),                                  DEBUG_GIVE_MENU_ITEM_DAYCARE_EGG},
};

static const struct ListMenuItem sDebugMenu_Items_Sound[] =
{
    [DEBUG_SOUND_MENU_ITEM_SE]  = {COMPOUND_STRING("SFX…{CLEAR_TO 110}{RIGHT_ARROW}"),   DEBUG_SOUND_MENU_ITEM_SE},
    [DEBUG_SOUND_MENU_ITEM_MUS] = {COMPOUND_STRING("Music…{CLEAR_TO 110}{RIGHT_ARROW}"), DEBUG_SOUND_MENU_ITEM_MUS},
};

static const struct ListMenuItem sDebugMenu_Items_BerryFunctions[] =
{
    [DEBUG_BERRY_FUNCTIONS_MENU_CLEAR_ALL]  = {COMPOUND_STRING("Clear map trees"),      DEBUG_BERRY_FUNCTIONS_MENU_CLEAR_ALL},
    [DEBUG_BERRY_FUNCTIONS_MENU_READY]      = {COMPOUND_STRING("Ready map trees"),      DEBUG_BERRY_FUNCTIONS_MENU_READY},
    [DEBUG_BERRY_FUNCTIONS_MENU_NEXT_STAGE] = {COMPOUND_STRING("Grow map trees"),       DEBUG_BERRY_FUNCTIONS_MENU_NEXT_STAGE},
    [DEBUG_BERRY_FUNCTIONS_MENU_PESTS]      = {COMPOUND_STRING("Give map trees pests"), DEBUG_BERRY_FUNCTIONS_MENU_PESTS},
    [DEBUG_BERRY_FUNCTIONS_MENU_WEEDS]      = {COMPOUND_STRING("Give map trees weeds"), DEBUG_BERRY_FUNCTIONS_MENU_WEEDS},
};

static const struct ListMenuItem sDebugMenu_Items_Player[] =
{
    [DEBUG_PLAYER_MENU_ITEM_PLAYER_NAME]   = {COMPOUND_STRING("Player name"),    DEBUG_PLAYER_MENU_ITEM_PLAYER_NAME},
    [DEBUG_PLAYER_MENU_ITEM_PLAYER_GENDER] = {COMPOUND_STRING("Toggle gender"),  DEBUG_PLAYER_MENU_ITEM_PLAYER_GENDER},
    [DEBUG_PLAYER_MENU_ITEM_PLAYER_ID]     = {COMPOUND_STRING("New Trainer ID"), DEBUG_PLAYER_MENU_ITEM_PLAYER_ID},
};

static const struct ListMenuItem sDebugMenu_Items_ROMInfo[] =
{
    [DEBUG_ROM_INFO_MENU_ITEM_SAVEBLOCK]     = {COMPOUND_STRING("Save Block space"),  DEBUG_ROM_INFO_MENU_ITEM_SAVEBLOCK},
    [DEBUG_ROM_INFO_MENU_ITEM_ROM_SPACE]     = {COMPOUND_STRING("ROM space"),         DEBUG_ROM_INFO_MENU_ITEM_ROM_SPACE},
    [DEBUG_ROM_INFO_MENU_ITEM_EXPANSION_VER] = {COMPOUND_STRING("Expansion Version"), DEBUG_ROM_INFO_MENU_ITEM_EXPANSION_VER},
};

// *******************************
// Menu Actions
static void (*const sDebugMenu_Actions_Main[])(u8) =
{
    [DEBUG_MENU_ITEM_UTILITIES]     = DebugAction_OpenUtilitiesMenu,
    [DEBUG_MENU_ITEM_PCBAG]         = DebugAction_OpenPCBagMenu,
    [DEBUG_MENU_ITEM_PARTY]         = DebugAction_OpenPartyMenu,
    [DEBUG_MENU_ITEM_GIVE]          = DebugAction_OpenGiveMenu,
    [DEBUG_MENU_ITEM_PLAYER]        = DebugAction_OpenPlayerMenu,
    [DEBUG_MENU_ITEM_SCRIPTS]       = DebugAction_OpenScriptsMenu,
    [DEBUG_MENU_ITEM_FLAGVAR]       = DebugAction_OpenFlagsVarsMenu,
    //[DEBUG_MENU_ITEM_BATTLE]        = DebugAction_OpenBattleMenu,
    [DEBUG_MENU_ITEM_SOUND]         = DebugAction_OpenSoundMenu,
    [DEBUG_MENU_ITEM_ROMINFO]       = DebugAction_OpenROMInfoMenu,
    [DEBUG_MENU_ITEM_CANCEL]        = DebugAction_Cancel
};

static void (*const sDebugMenu_Actions_Utilities[])(u8) =
{
    [DEBUG_UTIL_MENU_ITEM_FLY]             = DebugAction_Util_Fly,
    [DEBUG_UTIL_MENU_ITEM_WARP]            = DebugAction_Util_Warp_Warp,
    [DEBUG_UTIL_MENU_ITEM_WEATHER]         = DebugAction_Util_Weather,
    [DEBUG_UTIL_MENU_ITEM_FONT_TEST]       = DebugAction_Util_FontTest,
    [DEBUG_UTIL_MENU_ITEM_TIME_MENU]       = DebugAction_Util_OpenTimeMenu,
    [DEBUG_UTIL_MENU_ITEM_WATCHCREDITS]    = DebugAction_Util_WatchCredits,
    [DEBUG_UTIL_MENU_ITEM_CHEAT]           = DebugAction_Util_CheatStart,
    [DEBUG_UTIL_MENU_ITEM_BERRY_FUNCTIONS] = DebugAction_Util_BerryFunctions,
    [DEBUG_UTIL_MENU_ITEM_EWRAM_COUNTERS]  = DebugAction_Util_CheckEWRAMCounters,
    [DEBUG_UTIL_MENU_ITEM_STEVEN_MULTI]    = DebugAction_Util_Steven_Multi,
};

static void (*const sDebugMenu_Actions_PCBag[])(u8) =
{
    [DEBUG_PCBAG_MENU_ITEM_ACCESS_PC]             = DebugAction_PCBag_AccessPC,
    [DEBUG_PCBAG_MENU_ITEM_FILL]                  = DebugAction_OpenPCBagFillMenu,
    [DEBUG_PCBAG_MENU_ITEM_CLEAR_BAG]             = DebugAction_PCBag_ClearBag,
    [DEBUG_PCBAG_MENU_ITEM_CLEAR_BOXES]           = DebugAction_PCBag_ClearBoxes,
};

static void (*const sDebugMenu_Actions_PCBag_Fill[])(u8) =
{
    [DEBUG_PCBAG_MENU_ITEM_FILL_PC_BOXES_FAST]    = DebugAction_PCBag_Fill_PCBoxes_Fast,
    [DEBUG_PCBAG_MENU_ITEM_FILL_PC_BOXES_SLOW]    = DebugAction_PCBag_Fill_PCBoxes_Slow,
    [DEBUG_PCBAG_MENU_ITEM_FILL_PC_ITEMS]         = DebugAction_PCBag_Fill_PCItemStorage,
    [DEBUG_PCBAG_MENU_ITEM_FILL_POCKET_ITEMS]     = DebugAction_PCBag_Fill_PocketItems,
    [DEBUG_PCBAG_MENU_ITEM_FILL_POCKET_BALLS]     = DebugAction_PCBag_Fill_PocketPokeBalls,
    [DEBUG_PCBAG_MENU_ITEM_FILL_POCKET_TMHM]      = DebugAction_PCBag_Fill_PocketTMHM,
    [DEBUG_PCBAG_MENU_ITEM_FILL_POCKET_BERRIES]   = DebugAction_PCBag_Fill_PocketBerries,
    [DEBUG_PCBAG_MENU_ITEM_FILL_POCKET_KEY_ITEMS] = DebugAction_PCBag_Fill_PocketKeyItems,
};

static void (*const sDebugMenu_Actions_Party[])(u8) =
{
    [DEBUG_PARTY_MENU_ITEM_MOVE_REMINDER]   = DebugAction_Party_MoveReminder,
    [DEBUG_PARTY_MENU_ITEM_HATCH_AN_EGG]    = DebugAction_Party_HatchAnEgg,
    [DEBUG_PARTY_MENU_ITEM_HEAL_PARTY]      = DebugAction_Party_HealParty,
    [DEBUG_PARTY_MENU_ITEM_INFLICT_STATUS1] = DebugAction_Party_InflictStatus1,
    [DEBUG_PARTY_MENU_ITEM_CHECK_EVS]       = DebugAction_Party_CheckEVs,
    [DEBUG_PARTY_MENU_ITEM_CHECK_IVS]       = DebugAction_Party_CheckIVs,
    [DEBUG_PARTY_MENU_ITEM_CLEAR_PARTY]     = DebugAction_Party_ClearParty,
};

static void (*const sDebugMenu_Actions_Scripts[])(u8) =
{
    [DEBUG_UTIL_MENU_ITEM_SCRIPT_1] = DebugAction_Util_Script_1,
    [DEBUG_UTIL_MENU_ITEM_SCRIPT_2] = DebugAction_Util_Script_2,
    [DEBUG_UTIL_MENU_ITEM_SCRIPT_3] = DebugAction_Util_Script_3,
    [DEBUG_UTIL_MENU_ITEM_SCRIPT_4] = DebugAction_Util_Script_4,
    [DEBUG_UTIL_MENU_ITEM_SCRIPT_5] = DebugAction_Util_Script_5,
    [DEBUG_UTIL_MENU_ITEM_SCRIPT_6] = DebugAction_Util_Script_6,
    [DEBUG_UTIL_MENU_ITEM_SCRIPT_7] = DebugAction_Util_Script_7,
    [DEBUG_UTIL_MENU_ITEM_SCRIPT_8] = DebugAction_Util_Script_8,
};

static void (*const sDebugMenu_Actions_Flags[])(u8) =
{
    [DEBUG_FLAGVAR_MENU_ITEM_FLAGS]                = DebugAction_FlagsVars_Flags,
    [DEBUG_FLAGVAR_MENU_ITEM_VARS]                 = DebugAction_FlagsVars_Vars,
    [DEBUG_FLAGVAR_MENU_ITEM_DEXFLAGS_ALL]         = DebugAction_FlagsVars_PokedexFlags_All,
    [DEBUG_FLAGVAR_MENU_ITEM_DEXFLAGS_RESET]       = DebugAction_FlagsVars_PokedexFlags_Reset,
    [DEBUG_FLAGVAR_MENU_ITEM_TOGGLE_POKEDEX]       = DebugAction_FlagsVars_SwitchDex,
    [DEBUG_FLAGVAR_MENU_ITEM_TOGGLE_NATDEX]        = DebugAction_FlagsVars_SwitchNatDex,
    [DEBUG_FLAGVAR_MENU_ITEM_TOGGLE_POKENAV]       = DebugAction_FlagsVars_SwitchPokeNav,
    [DEBUG_FLAGVAR_MENU_ITEM_TOGGLE_MATCH_CALL]    = DebugAction_FlagsVars_SwitchMatchCall,
    [DEBUG_FLAGVAR_MENU_ITEM_TOGGLE_RUN_SHOES]     = DebugAction_FlagsVars_RunningShoes,
    [DEBUG_FLAGVAR_MENU_ITEM_TOGGLE_LOCATIONS]     = DebugAction_FlagsVars_ToggleFlyFlags,
    [DEBUG_FLAGVAR_MENU_ITEM_TOGGLE_BADGES_ALL]    = DebugAction_FlagsVars_ToggleBadgeFlags,
    [DEBUG_FLAGVAR_MENU_ITEM_TOGGLE_GAME_CLEAR]    = DebugAction_FlagsVars_ToggleGameClear,
    [DEBUG_FLAGVAR_MENU_ITEM_TOGGLE_FRONTIER_PASS] = DebugAction_FlagsVars_ToggleFrontierPass,
    [DEBUG_FLAGVAR_MENU_ITEM_TOGGLE_COLLISION]     = DebugAction_FlagsVars_CollisionOnOff,
    [DEBUG_FLAGVAR_MENU_ITEM_TOGGLE_ENCOUNTER]     = DebugAction_FlagsVars_EncounterOnOff,
    [DEBUG_FLAGVAR_MENU_ITEM_TOGGLE_TRAINER_SEE]   = DebugAction_FlagsVars_TrainerSeeOnOff,
    [DEBUG_FLAGVAR_MENU_ITEM_TOGGLE_BAG_USE]       = DebugAction_FlagsVars_BagUseOnOff,
    [DEBUG_FLAGVAR_MENU_ITEM_TOGGLE_CATCHING]      = DebugAction_FlagsVars_CatchingOnOff,
};
static void (*const sDebugMenu_Actions_Give[])(u8) =
{
    [DEBUG_GIVE_MENU_ITEM_ITEM_X]            = DebugAction_Give_Item,
    [DEBUG_GIVE_MENU_ITEM_POKEMON_SIMPLE]    = DebugAction_Give_PokemonSimple,
    [DEBUG_GIVE_MENU_ITEM_POKEMON_COMPLEX]   = DebugAction_Give_PokemonComplex,
    [DEBUG_GIVE_MENU_ITEM_MAX_MONEY]         = DebugAction_Give_MaxMoney,
    [DEBUG_GIVE_MENU_ITEM_MAX_COINS]         = DebugAction_Give_MaxCoins,
    [DEBUG_GIVE_MENU_ITEM_MAX_BATTLE_POINTS] = DebugAction_Give_MaxBattlePoints,
    [DEBUG_GIVE_MENU_ITEM_DAYCARE_EGG]       = DebugAction_Give_DayCareEgg,
};

static void (*const sDebugMenu_Actions_Sound[])(u8) =
{
    [DEBUG_SOUND_MENU_ITEM_SE]  = DebugAction_Sound_SE,
    [DEBUG_SOUND_MENU_ITEM_MUS] = DebugAction_Sound_MUS,
};

static void (*const sDebugMenu_Actions_BerryFunctions[])(u8) =
{
    [DEBUG_BERRY_FUNCTIONS_MENU_CLEAR_ALL]  = DebugAction_BerryFunctions_ClearAll,
    [DEBUG_BERRY_FUNCTIONS_MENU_READY]      = DebugAction_BerryFunctions_Ready,
    [DEBUG_BERRY_FUNCTIONS_MENU_NEXT_STAGE] = DebugAction_BerryFunctions_NextStage,
    [DEBUG_BERRY_FUNCTIONS_MENU_PESTS]      = DebugAction_BerryFunctions_Pests,
    [DEBUG_BERRY_FUNCTIONS_MENU_WEEDS]      = DebugAction_BerryFunctions_Weeds,
};

static void (*const sDebugMenu_Actions_TimeMenu[])(u8) =
{
    [DEBUG_TIME_MENU_ITEM_PRINTTIME] = DebugAction_TimeMenu_PrintTime,
    [DEBUG_TIME_MENU_ITEM_PRINTTIMEOFDAY] = DebugAction_TimeMenu_PrintTimeOfDay,
    [DEBUG_TIME_MENU_ITEM_TIMESOFDAY] = DebugAction_TimeMenu_TimesOfDay,
    [DEBUG_TIME_MENU_ITEM_WEEKDAYS] = DebugAction_TimeMenu_Weekdays,
    [DEBUG_TIME_MENU_ITEM_CHECKWALLCLOCK]  = DebugAction_TimeMenu_CheckWallClock,
    [DEBUG_TIME_MENU_ITEM_SETWALLCLOCK]    = DebugAction_TimeMenu_SetWallClock,
};

static void (*const sDebugMenu_Actions_TimeMenu_TimesOfDay[])(u8) =
{
    [DEBUG_TIME_MENU_ITEM_MORNING] = DebugAction_TimeMenu_ChangeTimeOfDay,
    [DEBUG_TIME_MENU_ITEM_DAY] = DebugAction_TimeMenu_ChangeTimeOfDay,
    [DEBUG_TIME_MENU_ITEM_EVENING] = DebugAction_TimeMenu_ChangeTimeOfDay,
    [DEBUG_TIME_MENU_ITEM_NIGHT] = DebugAction_TimeMenu_ChangeTimeOfDay,
};

static void (*const sDebugMenu_Actions_TimeMenu_Weekdays[])(u8) =
{
    [DEBUG_TIME_MENU_ITEM_SUNDAY] = DebugAction_TimeMenu_ChangeWeekdays,
    [DEBUG_TIME_MENU_ITEM_MONDAY] = DebugAction_TimeMenu_ChangeWeekdays,
    [DEBUG_TIME_MENU_ITEM_TUESDAY] = DebugAction_TimeMenu_ChangeWeekdays,
    [DEBUG_TIME_MENU_ITEM_WEDNESDAY] = DebugAction_TimeMenu_ChangeWeekdays,
    [DEBUG_TIME_MENU_ITEM_THURSDAY] = DebugAction_TimeMenu_ChangeWeekdays,
    [DEBUG_TIME_MENU_ITEM_FRIDAY] = DebugAction_TimeMenu_ChangeWeekdays,
    [DEBUG_TIME_MENU_ITEM_SATURDAY] = DebugAction_TimeMenu_ChangeWeekdays,
};

static void (*const sDebugMenu_Actions_Player[])(u8) =
{
    [DEBUG_PLAYER_MENU_ITEM_PLAYER_NAME]   = DebugAction_Player_Name,
    [DEBUG_PLAYER_MENU_ITEM_PLAYER_GENDER] = DebugAction_Player_Gender,
    [DEBUG_PLAYER_MENU_ITEM_PLAYER_ID]     = DebugAction_Player_Id,
};

static void (*const sDebugMenu_Actions_ROMInfo[])(u8) =
{
    [DEBUG_ROM_INFO_MENU_ITEM_SAVEBLOCK]     = DebugAction_ROMInfo_CheckSaveBlock,
    [DEBUG_ROM_INFO_MENU_ITEM_ROM_SPACE]     = DebugAction_ROMInfo_CheckROMSpace,
    [DEBUG_ROM_INFO_MENU_ITEM_EXPANSION_VER] = DebugAction_ROMInfo_ExpansionVersion,
};

// *******************************
// Windows
static const struct WindowTemplate sDebugMenuWindowTemplateMain =
{
    .bg = 0,
    .tilemapLeft = 1,
    .tilemapTop = 1,
    .width = DEBUG_MENU_WIDTH_MAIN,
    .height = 2 * DEBUG_MENU_HEIGHT_MAIN,
    .paletteNum = 15,
    .baseBlock = 1,
};

static const struct WindowTemplate sDebugMenuWindowTemplateExtra =
{
    .bg = 0,
    .tilemapLeft = 30 - DEBUG_MENU_WIDTH_EXTRA - 1,
    .tilemapTop = 1,
    .width = DEBUG_MENU_WIDTH_EXTRA,
    .height = 2 * DEBUG_MENU_HEIGHT_EXTRA,
    .paletteNum = 15,
    .baseBlock = 1,
};

static const struct WindowTemplate sDebugMenuWindowTemplateWeather =
{
    .bg = 0,
    .tilemapLeft = 30 - DEBUG_MENU_WIDTH_WEATHER - 1,
    .tilemapTop = 1,
    .width = DEBUG_MENU_WIDTH_WEATHER,
    .height = 2 * DEBUG_MENU_HEIGHT_WEATHER,
    .paletteNum = 15,
    .baseBlock = 1,
};

static const struct WindowTemplate sDebugMenuWindowTemplateSound =
{
    .bg = 0,
    .tilemapLeft = 30 - DEBUG_MENU_WIDTH_SOUND - 1,
    .tilemapTop = 1,
    .width = DEBUG_MENU_WIDTH_SOUND,
    .height = DEBUG_MENU_HEIGHT_SOUND,
    .paletteNum = 15,
    .baseBlock = 1,
};

static const struct WindowTemplate sDebugMenuWindowTemplateFlagsVars =
{
    .bg = 0,
    .tilemapLeft = 30 - DEBUG_MENU_WIDTH_FLAGVAR - 1,
    .tilemapTop = 1,
    .width = DEBUG_MENU_WIDTH_FLAGVAR,
    .height = DEBUG_MENU_HEIGHT_FLAGVAR,
    .paletteNum = 15,
    .baseBlock = 1 + DEBUG_MENU_WIDTH_MAIN * DEBUG_MENU_HEIGHT_MAIN * 2,
};

// *******************************
// List Menu Templates
static const struct ListMenuTemplate sDebugMenu_ListTemplate_Main =
{
    .items = sDebugMenu_Items_Main,
    .moveCursorFunc = ListMenuDefaultCursorMoveFunc,
    .totalItems = ARRAY_COUNT(sDebugMenu_Items_Main),
};

static const struct ListMenuTemplate sDebugMenu_ListTemplate_Utilities =
{
    .items = sDebugMenu_Items_Utilities,
    .moveCursorFunc = ListMenuDefaultCursorMoveFunc,
    .totalItems = ARRAY_COUNT(sDebugMenu_Items_Utilities),
};

static const struct ListMenuTemplate sDebugMenu_ListTemplate_PCBag =
{
    .items = sDebugMenu_Items_PCBag,
    .moveCursorFunc = ListMenuDefaultCursorMoveFunc,
    .totalItems = ARRAY_COUNT(sDebugMenu_Items_PCBag),
};

static const struct ListMenuTemplate sDebugMenu_ListTemplate_PCBag_Fill =
{
    .items = sDebugMenu_Items_PCBag_Fill,
    .moveCursorFunc = ListMenuDefaultCursorMoveFunc,
    .totalItems = ARRAY_COUNT(sDebugMenu_Items_PCBag_Fill),
};

static const struct ListMenuTemplate sDebugMenu_ListTemplate_Party =
{
    .items = sDebugMenu_Items_Party,
    .moveCursorFunc = ListMenuDefaultCursorMoveFunc,
    .totalItems = ARRAY_COUNT(sDebugMenu_Items_Party),
};

static const struct ListMenuTemplate sDebugMenu_ListTemplate_Scripts =
{
    .items = sDebugMenu_Items_Scripts,
    .moveCursorFunc = ListMenuDefaultCursorMoveFunc,
    .totalItems = ARRAY_COUNT(sDebugMenu_Items_Scripts),
};

static const struct ListMenuTemplate sDebugMenu_ListTemplate_FlagsVars =
{
    .items = sDebugMenu_Items_FlagsVars,
    .moveCursorFunc = ListMenuDefaultCursorMoveFunc,
    .totalItems = ARRAY_COUNT(sDebugMenu_Items_FlagsVars),
};

static const struct ListMenuTemplate sDebugMenu_ListTemplate_Battle_0 =
{
    .items = sDebugMenu_Items_Battle_0,
    .moveCursorFunc = ListMenuDefaultCursorMoveFunc,
    .totalItems = ARRAY_COUNT(sDebugMenu_Items_Battle_0),
};

static const struct ListMenuTemplate sDebugMenu_ListTemplate_Battle_1 =
{
    .items = sDebugMenu_Items_Battle_1,
    .moveCursorFunc = ListMenuDefaultCursorMoveFunc,
    .totalItems = ARRAY_COUNT(sDebugMenu_Items_Battle_1),
};

static const struct ListMenuTemplate sDebugMenu_ListTemplate_Battle_2 =
{
    .items = sDebugMenu_Items_Battle_2,
    .moveCursorFunc = ListMenuDefaultCursorMoveFunc,
    .totalItems = ARRAY_COUNT(sDebugMenu_Items_Battle_2),
};

static const struct ListMenuTemplate sDebugMenu_ListTemplate_Give =
{
    .items = sDebugMenu_Items_Give,
    .moveCursorFunc = ListMenuDefaultCursorMoveFunc,
    .totalItems = ARRAY_COUNT(sDebugMenu_Items_Give),
};

static const struct ListMenuTemplate sDebugMenu_ListTemplate_Sound =
{
    .items = sDebugMenu_Items_Sound,
    .moveCursorFunc = ListMenuDefaultCursorMoveFunc,
    .totalItems = ARRAY_COUNT(sDebugMenu_Items_Sound),
};

static const struct ListMenuTemplate sDebugMenu_ListTemplate_BerryFunctions =
{
    .items = sDebugMenu_Items_BerryFunctions,
    .moveCursorFunc = ListMenuDefaultCursorMoveFunc,
    .totalItems = ARRAY_COUNT(sDebugMenu_Items_BerryFunctions),
};

static const struct ListMenuTemplate sDebugMenu_ListTemplate_TimeMenu =
{
    .items = sDebugMenu_Items_TimeMenu,
    .moveCursorFunc = ListMenuDefaultCursorMoveFunc,
    .totalItems = ARRAY_COUNT(sDebugMenu_Items_TimeMenu),
};

static const struct ListMenuTemplate sDebugMenu_ListTemplate_TimeMenu_TimesOfDay =
{
    .items = sDebugMenu_Items_TimeMenu_TimesOfDay,
    .moveCursorFunc = ListMenuDefaultCursorMoveFunc,
    .totalItems = ARRAY_COUNT(sDebugMenu_Items_TimeMenu_TimesOfDay),
};

static const struct ListMenuTemplate sDebugMenu_ListTemplate_TimeMenu_Weekdays =
{
    .items = sDebugMenu_Items_TimeMenu_Weekdays,
    .moveCursorFunc = ListMenuDefaultCursorMoveFunc,
    .totalItems = ARRAY_COUNT(sDebugMenu_Items_TimeMenu_Weekdays),
};

static const struct ListMenuTemplate sDebugMenu_ListTemplate_Player =
{
    .items = sDebugMenu_Items_Player,
    .moveCursorFunc = ListMenuDefaultCursorMoveFunc,
    .totalItems = ARRAY_COUNT(sDebugMenu_Items_Player),
};

static const struct ListMenuTemplate sDebugMenu_ListTemplate_ROMInfo =
{
    .items = sDebugMenu_Items_ROMInfo,
    .moveCursorFunc = ListMenuDefaultCursorMoveFunc,
    .totalItems = ARRAY_COUNT(sDebugMenu_Items_ROMInfo),
};

// *******************************
// Functions universal
void Debug_ShowMainMenu(void)
{
    sDebugBattleData = AllocZeroed(sizeof(*sDebugBattleData));
    sDebugMenuListData = AllocZeroed(sizeof(*sDebugMenuListData));
    Debug_InitDebugBattleData();

    Debug_ShowMenu(DebugTask_HandleMenuInput_Main, sDebugMenu_ListTemplate_Main);
}

static void Debug_ReShowMainMenu(void)
{
    Debug_ShowMenu(DebugTask_HandleMenuInput_Main, sDebugMenu_ListTemplate_Main);
}

#define tMenuTaskId   data[0]
#define tWindowId     data[1]
#define tSubWindowId  data[2]
#define tInput        data[3]
#define tDigit        data[4]

static void Debug_ShowMenu(void (*HandleInput)(u8), struct ListMenuTemplate LMtemplate)
{
    struct ListMenuTemplate menuTemplate;
    u8 windowId;
    u8 menuTaskId;
    u8 inputTaskId;

    // create window
    HideMapNamePopUpWindow();
    LoadMessageBoxAndBorderGfx();
    windowId = AddWindow(&sDebugMenuWindowTemplateMain);
    DrawStdWindowFrame(windowId, FALSE);

    // create list menu
    menuTemplate = LMtemplate;
    menuTemplate.maxShowed = DEBUG_MENU_HEIGHT_MAIN;
    menuTemplate.windowId = windowId;
    menuTemplate.header_X = 0;
    menuTemplate.item_X = 8;
    menuTemplate.cursor_X = 0;
    menuTemplate.upText_Y = 1;
    menuTemplate.cursorPal = 2;
    menuTemplate.fillValue = 1;
    menuTemplate.cursorShadowPal = 3;
    menuTemplate.lettersSpacing = 1;
    menuTemplate.itemVerticalPadding = 0;
    menuTemplate.scrollMultiple = LIST_NO_MULTIPLE_SCROLL;
    menuTemplate.fontId = DEBUG_MENU_FONT;
    menuTemplate.cursorKind = 0;
    menuTaskId = ListMenuInit(&menuTemplate, 0, 0);

    // create input handler task
    inputTaskId = CreateTask(HandleInput, 3);
    gTasks[inputTaskId].tMenuTaskId = menuTaskId;
    gTasks[inputTaskId].tWindowId = windowId;
    gTasks[inputTaskId].tSubWindowId = 0;

    Debug_RefreshListMenu(inputTaskId);

    // draw everything
    CopyWindowToVram(windowId, COPYWIN_FULL);
}

static void Debug_DestroyMenu(u8 taskId)
{
    DestroyListMenuTask(gTasks[taskId].tMenuTaskId, NULL, NULL);
    RemoveWindow(gTasks[taskId].tWindowId);
    DestroyTask(taskId);
}

static void Debug_DestroyMenu_Full(u8 taskId)
{
    if (gTasks[taskId].tSubWindowId != 0)
    {
        ClearStdWindowAndFrame(gTasks[taskId].tSubWindowId, FALSE);
        DebugAction_DestroyExtraWindow(taskId);
    }
    DestroyListMenuTask(gTasks[taskId].tMenuTaskId, NULL, NULL);
    ClearStdWindowAndFrame(gTasks[taskId].tWindowId, TRUE);
    RemoveWindow(gTasks[taskId].tWindowId);
    DestroyTask(taskId);
    UnfreezeObjectEvents();
    Free(sDebugMenuListData);
    Free(sDebugBattleData);
}

static void Debug_DestroyMenu_Full_Script(u8 taskId, const u8 *script)
{
    Debug_DestroyMenu_Full(taskId);
    LockPlayerFieldControls();
    FreezeObjectEvents();
    ScriptContext_SetupScript(script);
}

static void Debug_HandleInput_Numeric(u8 taskId, s32 min, s32 max, u32 digits)
{
    if (JOY_NEW(DPAD_UP))
    {
        gTasks[taskId].tInput += sPowersOfTen[gTasks[taskId].tDigit];
        if (gTasks[taskId].tInput > max)
            gTasks[taskId].tInput = max;
    }
    if (JOY_NEW(DPAD_DOWN))
    {
        gTasks[taskId].tInput -= sPowersOfTen[gTasks[taskId].tDigit];
        if (gTasks[taskId].tInput < min)
            gTasks[taskId].tInput = min;
    }
    if (JOY_NEW(DPAD_LEFT))
    {
        if (gTasks[taskId].tDigit > 0)
            gTasks[taskId].tDigit -= 1;
    }
    if (JOY_NEW(DPAD_RIGHT))
    {
        if (gTasks[taskId].tDigit < digits - 1)
            gTasks[taskId].tDigit += 1;
    }
}

static void DebugAction_Cancel(u8 taskId)
{
    Debug_DestroyMenu_Full(taskId);
    ScriptContext_Enable();
}

static void DebugAction_DestroyExtraWindow(u8 taskId)
{
    ClearStdWindowAndFrame(gTasks[taskId].tWindowId, TRUE);
    RemoveWindow(gTasks[taskId].tWindowId);

    ClearStdWindowAndFrame(gTasks[taskId].tSubWindowId, TRUE);
    RemoveWindow(gTasks[taskId].tSubWindowId);

    DestroyListMenuTask(gTasks[taskId].tMenuTaskId, NULL, NULL);
    DestroyTask(taskId);
    ScriptContext_Enable();
    UnfreezeObjectEvents();
}


static const u16 sLocationFlags[] =
{
    FLAG_WORLD_MAP_PALLET_TOWN,
    FLAG_WORLD_MAP_VIRIDIAN_CITY,
    FLAG_WORLD_MAP_PEWTER_CITY,
    FLAG_WORLD_MAP_ROUTE4_POKEMON_CENTER_1F,
    FLAG_WORLD_MAP_CERULEAN_CITY,
    FLAG_WORLD_MAP_VERMILION_CITY,
    FLAG_WORLD_MAP_ROUTE10_POKEMON_CENTER_1F,
    FLAG_WORLD_MAP_LAVENDER_TOWN,
    FLAG_WORLD_MAP_CELADON_CITY,
    FLAG_WORLD_MAP_FUCHSIA_CITY,
    FLAG_WORLD_MAP_SAFFRON_CITY,
    FLAG_WORLD_MAP_CINNABAR_ISLAND,
    FLAG_WORLD_MAP_INDIGO_PLATEAU_EXTERIOR,
    FLAG_WORLD_MAP_ONE_ISLAND,
    FLAG_WORLD_MAP_TWO_ISLAND,
    FLAG_WORLD_MAP_THREE_ISLAND,
    FLAG_WORLD_MAP_FOUR_ISLAND,
    FLAG_WORLD_MAP_FIVE_ISLAND,
    FLAG_WORLD_MAP_SIX_ISLAND,
    FLAG_WORLD_MAP_SEVEN_ISLAND,
};

static u8 Debug_CheckToggleFlags(u8 id)
{
    u8 result = FALSE;

    switch (id)
    {
        case DEBUG_FLAGVAR_MENU_ITEM_TOGGLE_POKEDEX:
            result = FlagGet(FLAG_SYS_POKEDEX_GET);
            break;
        case DEBUG_FLAGVAR_MENU_ITEM_TOGGLE_NATDEX:
            result = IsNationalPokedexEnabled();
            break;
        // case DEBUG_FLAGVAR_MENU_ITEM_TOGGLE_POKENAV:
        //     result = FlagGet(FLAG_SYS_POKENAV_GET);
        //     break;
        // case DEBUG_FLAGVAR_MENU_ITEM_TOGGLE_MATCH_CALL:
        //     result = FlagGet(FLAG_ADDED_MATCH_CALL_TO_POKENAV) && FlagGet(FLAG_HAS_MATCH_CALL);
        //     break;
        case DEBUG_FLAGVAR_MENU_ITEM_TOGGLE_RUN_SHOES:
            result = FlagGet(FLAG_SYS_B_DASH);
            break;
        case DEBUG_FLAGVAR_MENU_ITEM_TOGGLE_LOCATIONS:
            result = TRUE;
            for (u32 i = 0; i < ARRAY_COUNT(sLocationFlags); i++)
            {
                if (!FlagGet(sLocationFlags[i]))
                {
                    result = FALSE;
                    break;
                }
            }
            break;
        case DEBUG_FLAGVAR_MENU_ITEM_TOGGLE_BADGES_ALL:
            result = TRUE;
            for (u32 i = 0; i < ARRAY_COUNT(gBadgeFlags); i++)
            {
                if (!FlagGet(gBadgeFlags[i]))
                {
                    result = FALSE;
                    break;
                }
            }
            break;
        case DEBUG_FLAGVAR_MENU_ITEM_TOGGLE_GAME_CLEAR:
            result = FlagGet(FLAG_SYS_GAME_CLEAR);
            break;
        // case DEBUG_FLAGVAR_MENU_ITEM_TOGGLE_FRONTIER_PASS:
        //     result = FlagGet(FLAG_SYS_FRONTIER_PASS);
        //     break;
    #if OW_FLAG_NO_COLLISION != 0
        case DEBUG_FLAGVAR_MENU_ITEM_TOGGLE_COLLISION:
            result = FlagGet(OW_FLAG_NO_COLLISION);
            break;
    #endif
    #if OW_FLAG_NO_ENCOUNTER != 0
        case DEBUG_FLAGVAR_MENU_ITEM_TOGGLE_ENCOUNTER:
            result = FlagGet(OW_FLAG_NO_ENCOUNTER);
            break;
    #endif
    #if OW_FLAG_NO_TRAINER_SEE != 0
        case DEBUG_FLAGVAR_MENU_ITEM_TOGGLE_TRAINER_SEE:
            result = FlagGet(OW_FLAG_NO_TRAINER_SEE);
            break;
    #endif
    #if B_FLAG_NO_BAG_USE != 0
        case DEBUG_FLAGVAR_MENU_ITEM_TOGGLE_BAG_USE:
            result = FlagGet(B_FLAG_NO_BAG_USE);
            break;
    #endif
    #if B_FLAG_NO_CATCHING != 0
        case DEBUG_FLAGVAR_MENU_ITEM_TOGGLE_CATCHING:
            result = FlagGet(B_FLAG_NO_CATCHING);
            break;
    #endif
        default:
            result = 0xFF;
            break;
    }

    return result;
}

static void Debug_InitDebugBattleData(void)
{
    u32 i;
    sDebugBattleData->submenu       = 0;
    sDebugBattleData->battleType    = 0xFF;
    sDebugBattleData->battleTerrain = 0xFF;

    for (i = 0; i < AI_FLAG_COUNT; i++)
        sDebugBattleData->aiFlags[i] = FALSE;
}

static void Debug_GenerateListMenuNames(u32 totalItems)
{
    const u8 sColor_Red[] = _("{COLOR RED}");
    const u8 sColor_Green[] = _("{COLOR GREEN}");
    u32 i, flagResult = 0;
    u8 const *name = NULL;

    // Copy item names for all entries but the last (which is Cancel)
    for (i = 0; i < totalItems; i++)
    {
        if (sDebugMenuListData->listId == 1 && sDebugBattleData->submenu > 1)
        {
            u16 species;
            if (i == 6)
            {
                name = sDebugText_Continue;
                StringCopy(&sDebugMenuListData->itemNames[i][0], name);
            }
            else if (GetMonData(&gEnemyParty[i], MON_DATA_SANITY_HAS_SPECIES))
            {
                species = GetMonData(&gEnemyParty[i], MON_DATA_SPECIES);
                StringCopy(gStringVar1, GetSpeciesName(species));
                StringCopy(&sDebugMenuListData->itemNames[i][0], gStringVar1);
            }
            else
            {
                StringCopy(&sDebugMenuListData->itemNames[i][0], sDebugText_Dashes);
            }
        }
        else
        {
            if (sDebugMenuListData->listId == 0)
            {
                flagResult = Debug_CheckToggleFlags(i);
                name = sDebugMenu_Items_FlagsVars[i].name;
            }
            else if (sDebugMenuListData->listId == 1)
            {
                flagResult = sDebugBattleData->aiFlags[i];
                if (i == totalItems - 1)
                    flagResult = 0xFF;
                name = sDebugMenu_Items_Battle_1[i].name;
            }

            if (flagResult == 0xFF)
            {
                StringCopy(&sDebugMenuListData->itemNames[i][0], name);
            }
            else if (flagResult)
            {
                StringCopy(gStringVar1, sColor_Green);
                StringExpandPlaceholders(gStringVar4, name);
                StringCopy(&sDebugMenuListData->itemNames[i][0], gStringVar4);
            }
            else
            {
                StringCopy(gStringVar1, sColor_Red);
                StringExpandPlaceholders(gStringVar4, name);
                StringCopy(&sDebugMenuListData->itemNames[i][0], gStringVar4);
            }
        }

        sDebugMenuListData->listItems[i].name = &sDebugMenuListData->itemNames[i][0];
        sDebugMenuListData->listItems[i].id = i;
    }
}

static void Debug_RefreshListMenu(u8 taskId)
{
    u8 totalItems = 0;

    if (sDebugMenuListData->listId == 0)
    {
        gMultiuseListMenuTemplate = sDebugMenu_ListTemplate_FlagsVars;
        totalItems = gMultiuseListMenuTemplate.totalItems;
    }
    else if (sDebugMenuListData->listId == 1 && sDebugBattleData->submenu <= 1)
    {
        gMultiuseListMenuTemplate = sDebugMenu_ListTemplate_Battle_1;
        totalItems = gMultiuseListMenuTemplate.totalItems;
    }
    else if (sDebugMenuListData->listId == 1 && sDebugBattleData->submenu > 1)
    {
        gMultiuseListMenuTemplate = sDebugMenu_ListTemplate_Battle_2;
        totalItems = 7;
    }

    // Failsafe to prevent memory corruption
    totalItems = min(totalItems, DEBUG_MAX_MENU_ITEMS);
    Debug_GenerateListMenuNames(totalItems);

    // Set list menu data
    gMultiuseListMenuTemplate.items = sDebugMenuListData->listItems;
    gMultiuseListMenuTemplate.totalItems = totalItems;
    gMultiuseListMenuTemplate.maxShowed = DEBUG_MENU_HEIGHT_MAIN;
    gMultiuseListMenuTemplate.windowId = gTasks[taskId].tWindowId;
    gMultiuseListMenuTemplate.header_X = 0;
    gMultiuseListMenuTemplate.item_X = 8;
    gMultiuseListMenuTemplate.cursor_X = 0;
    gMultiuseListMenuTemplate.upText_Y = 1;
    gMultiuseListMenuTemplate.cursorPal = 2;
    gMultiuseListMenuTemplate.fillValue = 1;
    gMultiuseListMenuTemplate.cursorShadowPal = 3;
    gMultiuseListMenuTemplate.lettersSpacing = 1;
    gMultiuseListMenuTemplate.itemVerticalPadding = 0;
    gMultiuseListMenuTemplate.scrollMultiple = LIST_NO_MULTIPLE_SCROLL;
    gMultiuseListMenuTemplate.fontId = 1;
    gMultiuseListMenuTemplate.cursorKind = 0;
}

static void Debug_RedrawListMenu(u8 taskId)
{
    u8 listTaskId = gTasks[taskId].tMenuTaskId;
    u16 scrollOffset, selectedRow;
    ListMenuGetScrollAndRow(listTaskId, &scrollOffset, &selectedRow);

    DestroyListMenuTask(gTasks[taskId].tMenuTaskId, &scrollOffset, &selectedRow);
    Debug_RefreshListMenu(taskId);
    gTasks[taskId].tMenuTaskId = ListMenuInit(&gMultiuseListMenuTemplate, scrollOffset, selectedRow);
}


// *******************************
// Handle Inputs
static void DebugTask_HandleMenuInput_Main(u8 taskId)
{
    void (*func)(u8);
    u32 input = ListMenu_ProcessInput(gTasks[taskId].tMenuTaskId);

    if (JOY_NEW(A_BUTTON))
    {
        PlaySE(SE_SELECT);
        if ((func = sDebugMenu_Actions_Main[input]) != NULL)
            func(taskId);
    }
    else if (JOY_NEW(B_BUTTON))
    {
        PlaySE(SE_SELECT);
        Debug_DestroyMenu_Full(taskId);
        ScriptContext_Enable();
    }
}

static void DebugTask_HandleMenuInput_General(u8 taskId, const void (*const actions[])(u8), void (*callbackInput)(u8), struct ListMenuTemplate callbackMenuTemplate)
{
    void (*func)(u8);
    u32 input = ListMenu_ProcessInput(gTasks[taskId].tMenuTaskId);

    if (JOY_NEW(A_BUTTON))
    {
        PlaySE(SE_SELECT);
        if ((func = actions[input]) != NULL)
            func(taskId);
    }
    else if (JOY_NEW(B_BUTTON))
    {
        PlaySE(SE_SELECT);
        Debug_DestroyMenu(taskId);
        Debug_ShowMenu(callbackInput, callbackMenuTemplate);
    }
}

static void DebugTask_HandleMenuInput_Utilities(u8 taskId)
{
    DebugTask_HandleMenuInput_General(taskId, sDebugMenu_Actions_Utilities, DebugTask_HandleMenuInput_Main, sDebugMenu_ListTemplate_Main);
}

static void DebugTask_HandleMenuInput_PCBag(u8 taskId)
{
    DebugTask_HandleMenuInput_General(taskId, sDebugMenu_Actions_PCBag, DebugTask_HandleMenuInput_Main, sDebugMenu_ListTemplate_Main);
}

static void DebugTask_HandleMenuInput_PCBag_Fill(u8 taskId)
{
    DebugTask_HandleMenuInput_General(taskId, sDebugMenu_Actions_PCBag_Fill, DebugTask_HandleMenuInput_PCBag, sDebugMenu_ListTemplate_PCBag);
}

static void DebugTask_HandleMenuInput_Party(u8 taskId)
{
    DebugTask_HandleMenuInput_General(taskId, sDebugMenu_Actions_Party, DebugTask_HandleMenuInput_Main, sDebugMenu_ListTemplate_Main);
}

static void DebugTask_HandleMenuInput_Scripts(u8 taskId)
{
    DebugTask_HandleMenuInput_General(taskId, sDebugMenu_Actions_Scripts, DebugTask_HandleMenuInput_Main, sDebugMenu_ListTemplate_Main);
}

static void DebugTask_HandleMenuInput_TimeMenu(u8 taskId)
{
    DebugTask_HandleMenuInput_General(taskId, sDebugMenu_Actions_TimeMenu, DebugTask_HandleMenuInput_Utilities, sDebugMenu_ListTemplate_Utilities);
}

static void DebugTask_HandleMenuInput_TimeMenu_TimesOfDay(u8 taskId)
{
    DebugTask_HandleMenuInput_General(taskId, sDebugMenu_Actions_TimeMenu_TimesOfDay, DebugTask_HandleMenuInput_Main, sDebugMenu_ListTemplate_Main);
}

static void DebugTask_HandleMenuInput_TimeMenu_Weekdays(u8 taskId)
{
    DebugTask_HandleMenuInput_General(taskId, sDebugMenu_Actions_TimeMenu_Weekdays, DebugTask_HandleMenuInput_Main, sDebugMenu_ListTemplate_Main);
}

static void DebugTask_HandleMenuInput_FlagsVars(u8 taskId)
{
    void (*func)(u8);
    u32 input = ListMenu_ProcessInput(gTasks[taskId].tMenuTaskId);

    if (JOY_NEW(A_BUTTON))
    {
        PlaySE(SE_SELECT);
        if ((func = sDebugMenu_Actions_Flags[input]) != NULL)
        {
            if (input == DEBUG_FLAGVAR_MENU_ITEM_FLAGS || input == DEBUG_FLAGVAR_MENU_ITEM_VARS)
            {
                Debug_RedrawListMenu(taskId);
                func(taskId);
            }
            else
            {
                func(taskId);
                Debug_GenerateListMenuNames(gMultiuseListMenuTemplate.totalItems);
                RedrawListMenu(gTasks[taskId].tMenuTaskId);
            }

            // Remove TRUE/FALSE window for functions that haven't been assigned flags
            if (gTasks[taskId].tInput == 0xFF)
            {
                ClearStdWindowAndFrame(gTasks[taskId].tSubWindowId, TRUE);
                RemoveWindow(gTasks[taskId].tSubWindowId);
                Free(sDebugMenuListData);
            }
        }
    }
    else if (JOY_NEW(B_BUTTON))
    {
        PlaySE(SE_SELECT);
        Debug_DestroyMenu(taskId);
        Debug_ReShowMainMenu();
    }
}

static void DebugTask_HandleBattleMenuReDraw(u8 taskId)
{
    Debug_RefreshListMenu(taskId);
    switch (sDebugBattleData->submenu)
    {
    case 0:
        Debug_DestroyMenu(taskId);
        Debug_ShowMenu(DebugTask_HandleMenuInput_Battle, sDebugMenu_ListTemplate_Battle_0);
        break;
    case 1:
        Debug_DestroyMenu(taskId);
        Debug_ShowMenu(DebugTask_HandleMenuInput_Battle, gMultiuseListMenuTemplate);
        break;
    case 2:
        Debug_DestroyMenu(taskId);
        Debug_ShowMenu(DebugTask_HandleMenuInput_Battle, sDebugMenu_ListTemplate_Battle_2);
        break;
    case 3:
        Debug_DestroyMenu(taskId);
        Debug_ShowMenu(DebugTask_HandleMenuInput_Battle, gMultiuseListMenuTemplate);
        break;
    }
}

static void DebugTask_HandleMenuInput_Battle(u8 taskId)
{
    u16 idx;
    u8 listTaskId = gTasks[taskId].tMenuTaskId;
    ListMenu_ProcessInput(listTaskId);

    ListMenuGetCurrentItemArrayId(listTaskId, &idx);

    if (JOY_NEW(A_BUTTON))
    {
        PlaySE(SE_SELECT);

        switch (sDebugBattleData->submenu)
        {
        case 0: // Battle type
            sDebugBattleData->battleType = idx;
            sDebugBattleData->submenu++;
            Debug_DestroyMenu(taskId);

            if (sDebugBattleData->battleType == DEBUG_BATTLE_0_MENU_ITEM_WILD // Skip AI Flag selection if wild battle
             || sDebugBattleData->battleType == DEBUG_BATTLE_0_MENU_ITEM_WILD_DOUBLE)
            {
                sDebugBattleData->submenu++;
                Debug_ShowMenu(DebugTask_HandleMenuInput_Battle, sDebugMenu_ListTemplate_Battle_2);
            }
            else
            {
                Debug_ShowMenu(DebugTask_HandleMenuInput_Battle, gMultiuseListMenuTemplate);
            }
            break;
        case 1: // AI Flags
            if (idx == sDebugMenu_ListTemplate_Battle_1.totalItems - 1)
            {
                sDebugBattleData->submenu++;
                Debug_DestroyMenu(taskId);
                Debug_ShowMenu(DebugTask_HandleMenuInput_Battle, sDebugMenu_ListTemplate_Battle_2);
            }
            else
            {
                sDebugBattleData->aiFlags[idx] = !sDebugBattleData->aiFlags[idx];
                Debug_RedrawListMenu(taskId);
            }

            break;
        case 2: // Terrain
            sDebugBattleData->submenu++;
            sDebugBattleData->battleTerrain = idx;
            Debug_DestroyMenu(taskId);
            Debug_ShowMenu(DebugTask_HandleMenuInput_Battle, gMultiuseListMenuTemplate);
            break;
        case 3: // Enemy pokemon
            if (idx == 6)
                Debug_InitializeBattle(taskId);
            break;
        }
    }
    else if (JOY_NEW(B_BUTTON))
    {
        switch (sDebugBattleData->submenu)
        {
        case 0: // Return to Main menu
            PlaySE(SE_SELECT);
            Debug_DestroyMenu(taskId);
            Debug_ReShowMainMenu();
            break;
        case 2: // Skip AI Flag selection if wild battle
            if (sDebugBattleData->battleType == DEBUG_BATTLE_0_MENU_ITEM_WILD
             || sDebugBattleData->battleType == DEBUG_BATTLE_0_MENU_ITEM_WILD_DOUBLE)
            {
                sDebugBattleData->submenu = 0;
            }
            else
                sDebugBattleData->submenu--;
            DebugTask_HandleBattleMenuReDraw(taskId);
            break;
        default:
            sDebugBattleData->submenu--;
            DebugTask_HandleBattleMenuReDraw(taskId);
            break;
        }
    }
}

static void Debug_InitializeBattle(u8 taskId)
{
    u32 i;
    gBattleTypeFlags = 0;

    // Set main battle flags
    switch (sDebugBattleData->battleType)
    {
    case DEBUG_BATTLE_0_MENU_ITEM_WILD:
        break;
    case DEBUG_BATTLE_0_MENU_ITEM_SINGLE:
        gBattleTypeFlags = (BATTLE_TYPE_TRAINER);
        break;
    case DEBUG_BATTLE_0_MENU_ITEM_DOUBLE:
        gBattleTypeFlags = (BATTLE_TYPE_DOUBLE | BATTLE_TYPE_TWO_OPPONENTS | BATTLE_TYPE_TRAINER);
        break;
    case DEBUG_BATTLE_0_MENU_ITEM_MULTI:
        gBattleTypeFlags = (BATTLE_TYPE_DOUBLE | BATTLE_TYPE_TWO_OPPONENTS | BATTLE_TYPE_TRAINER | BATTLE_TYPE_INGAME_PARTNER);
        break;
    }

    // Set terrain
    gBattleEnvironment = sDebugBattleData->battleTerrain;

    // Populate enemy party
    for (i = 0; i < PARTY_SIZE; i++)
    {
        ZeroMonData(&gEnemyParty[i]);
        if (GetMonData(&gPlayerParty[i], MON_DATA_SANITY_HAS_SPECIES))
            gEnemyParty[i] = gPlayerParty[i];
    }

    // Set AI flags
    for (i = 0; i < ARRAY_COUNT(sDebugBattleData->aiFlags); i++)
    {
        if (sDebugBattleData->aiFlags[i])
            gDebugAIFlags |= (1 << i);
    }

    gIsDebugBattle = TRUE;
    BattleSetup_StartTrainerBattle_Debug();


    Debug_DestroyMenu_Full(taskId);
}

static void DebugTask_HandleMenuInput_Give(u8 taskId)
{
    DebugTask_HandleMenuInput_General(taskId, sDebugMenu_Actions_Give, DebugTask_HandleMenuInput_Main, sDebugMenu_ListTemplate_Main);
}

static void DebugTask_HandleMenuInput_Sound(u8 taskId)
{
    DebugTask_HandleMenuInput_General(taskId, sDebugMenu_Actions_Sound, DebugTask_HandleMenuInput_Main, sDebugMenu_ListTemplate_Main);
}

static void DebugTask_HandleMenuInput_BerryFunctions(u8 taskId)
{
    DebugTask_HandleMenuInput_General(taskId, sDebugMenu_Actions_BerryFunctions, DebugTask_HandleMenuInput_Main, sDebugMenu_ListTemplate_Main);
}

static void DebugTask_HandleMenuInput_Player(u8 taskId)
{
    DebugTask_HandleMenuInput_General(taskId, sDebugMenu_Actions_Player, DebugTask_HandleMenuInput_Main, sDebugMenu_ListTemplate_Main);
}

static void DebugTask_HandleMenuInput_ROMInfo(u8 taskId)
{
    DebugTask_HandleMenuInput_General(taskId, sDebugMenu_Actions_ROMInfo, DebugTask_HandleMenuInput_Main, sDebugMenu_ListTemplate_Main);
}

// *******************************
// Open sub-menus
static void DebugAction_OpenUtilitiesMenu(u8 taskId)
{
    Debug_DestroyMenu(taskId);
    Debug_ShowMenu(DebugTask_HandleMenuInput_Utilities, sDebugMenu_ListTemplate_Utilities);
}

static void DebugAction_OpenPCBagMenu(u8 taskId)
{
    Debug_DestroyMenu(taskId);
    Debug_ShowMenu(DebugTask_HandleMenuInput_PCBag, sDebugMenu_ListTemplate_PCBag);
}

static void DebugAction_OpenPartyMenu(u8 taskId)
{
    Debug_DestroyMenu(taskId);
    Debug_ShowMenu(DebugTask_HandleMenuInput_Party, sDebugMenu_ListTemplate_Party);
}

static void DebugAction_OpenScriptsMenu(u8 taskId)
{
    Debug_DestroyMenu(taskId);
    Debug_ShowMenu(DebugTask_HandleMenuInput_Scripts, sDebugMenu_ListTemplate_Scripts);
}

static void DebugAction_OpenFlagsVarsMenu(u8 taskId)
{
    Debug_DestroyMenu(taskId);
    sDebugMenuListData->listId = 0;
    Debug_ShowMenu(DebugTask_HandleMenuInput_FlagsVars, gMultiuseListMenuTemplate);
}

static void DebugAction_OpenGiveMenu(u8 taskId)
{
    Debug_DestroyMenu(taskId);
    Debug_ShowMenu(DebugTask_HandleMenuInput_Give, sDebugMenu_ListTemplate_Give);
}

static void DebugAction_OpenSoundMenu(u8 taskId)
{
    Debug_DestroyMenu(taskId);
    Debug_ShowMenu(DebugTask_HandleMenuInput_Sound, sDebugMenu_ListTemplate_Sound);
}

static void DebugAction_Util_BerryFunctions(u8 taskId)
{
    Debug_DestroyMenu(taskId);
    Debug_ShowMenu(DebugTask_HandleMenuInput_BerryFunctions, sDebugMenu_ListTemplate_BerryFunctions);
}

static void DebugAction_Util_OpenTimeMenu(u8 taskId)
{
    Debug_DestroyMenu(taskId);
    Debug_ShowMenu(DebugTask_HandleMenuInput_TimeMenu, sDebugMenu_ListTemplate_TimeMenu);
}

static void DebugAction_TimeMenu_TimesOfDay(u8 taskId)
{
    if (!OW_USE_FAKE_RTC)
    {
        Debug_DestroyMenu_Full_Script(taskId, Debug_EventScript_FakeRTCNotEnabled);
    }
    else
    {
        Debug_DestroyMenu_Full(taskId);
        Debug_ShowMenu(DebugTask_HandleMenuInput_TimeMenu_TimesOfDay, sDebugMenu_ListTemplate_TimeMenu_TimesOfDay);
    }
}

static void DebugAction_TimeMenu_Weekdays(u8 taskId)
{
    if (!OW_USE_FAKE_RTC)
    {
        Debug_DestroyMenu_Full_Script(taskId, Debug_EventScript_FakeRTCNotEnabled);
    }
    else
    {
        Debug_DestroyMenu_Full(taskId);
        Debug_ShowMenu(DebugTask_HandleMenuInput_TimeMenu_Weekdays, sDebugMenu_ListTemplate_TimeMenu_Weekdays);
    }
}

static void DebugAction_OpenPlayerMenu(u8 taskId)
{
    Debug_DestroyMenu(taskId);
    Debug_ShowMenu(DebugTask_HandleMenuInput_Player, sDebugMenu_ListTemplate_Player);
}

static void DebugAction_OpenROMInfoMenu(u8 taskId)
{
    Debug_DestroyMenu(taskId);
    Debug_ShowMenu(DebugTask_HandleMenuInput_ROMInfo, sDebugMenu_ListTemplate_ROMInfo);
}

// *******************************
// Actions Utilities

static void DebugAction_Util_Fly(u8 taskId)
{
    Debug_DestroyMenu_Full(taskId);
    SetMainCallback2(CB2_OpenFlyMap);
}

#define tMapGroup  data[5]
#define tMapNum    data[6]
#define tWarp      data[7]

#define LAST_MAP_GROUP (MAP_GROUPS_COUNT - 1)

static void DebugAction_Util_Warp_Warp(u8 taskId)
{
    u8 windowId;

    ClearStdWindowAndFrame(gTasks[taskId].tWindowId, TRUE);
    RemoveWindow(gTasks[taskId].tWindowId);

    HideMapNamePopUpWindow();
    LoadMessageBoxAndBorderGfx();
    windowId = AddWindow(&sDebugMenuWindowTemplateExtra);
    DrawStdWindowFrame(windowId, FALSE);

    CopyWindowToVram(windowId, COPYWIN_FULL);

    ConvertIntToDecimalStringN(gStringVar1, gTasks[taskId].tInput, STR_CONV_MODE_LEADING_ZEROS, 3);
    ConvertIntToDecimalStringN(gStringVar2, LAST_MAP_GROUP, STR_CONV_MODE_LEADING_ZEROS, 3);
    StringExpandPlaceholders(gStringVar1, sDebugText_Util_WarpToMap_SelMax);
    StringCopy(gStringVar3, gText_DigitIndicator[0]);
    StringExpandPlaceholders(gStringVar4, sDebugText_Util_WarpToMap_SelectMapGroup);
    AddTextPrinterParameterized(windowId, DEBUG_MENU_FONT, gStringVar4, 0, 0, 0, NULL);

    gTasks[taskId].func = DebugAction_Util_Warp_SelectMapGroup;
    gTasks[taskId].tSubWindowId = windowId;
    gTasks[taskId].tInput = 0;
    gTasks[taskId].tDigit = 0;
    gTasks[taskId].tMapGroup = 0;
    gTasks[taskId].tMapNum = 0;
    gTasks[taskId].tWarp = 0;
}

static void DebugAction_Util_Warp_SelectMapGroup(u8 taskId)
{
    if (JOY_NEW(DPAD_ANY))
    {
        PlaySE(SE_SELECT);
        Debug_HandleInput_Numeric(taskId, 0, LAST_MAP_GROUP, 3);

        ConvertIntToDecimalStringN(gStringVar1, gTasks[taskId].tInput, STR_CONV_MODE_LEADING_ZEROS, 3);
        ConvertIntToDecimalStringN(gStringVar2, LAST_MAP_GROUP, STR_CONV_MODE_LEADING_ZEROS, 3);
        StringExpandPlaceholders(gStringVar1, sDebugText_Util_WarpToMap_SelMax);
        StringCopy(gStringVar3, gText_DigitIndicator[gTasks[taskId].tDigit]);
        StringExpandPlaceholders(gStringVar4, sDebugText_Util_WarpToMap_SelectMapGroup);
        AddTextPrinterParameterized(gTasks[taskId].tSubWindowId, DEBUG_MENU_FONT, gStringVar4, 0, 0, 0, NULL);
    }

    if (JOY_NEW(A_BUTTON))
    {
        gTasks[taskId].tMapGroup = gTasks[taskId].tInput;
        gTasks[taskId].tInput = 0;
        gTasks[taskId].tDigit = 0;

        ConvertIntToDecimalStringN(gStringVar1, gTasks[taskId].tInput, STR_CONV_MODE_LEADING_ZEROS, (MAP_GROUP_COUNT[gTasks[taskId].tMapGroup] - 1 >= 100) ? 3 : 2);
        ConvertIntToDecimalStringN(gStringVar2, MAP_GROUP_COUNT[gTasks[taskId].tMapGroup] - 1, STR_CONV_MODE_LEADING_ZEROS, (MAP_GROUP_COUNT[gTasks[taskId].tMapGroup] - 1 >= 100) ? 3 : 2);
        StringExpandPlaceholders(gStringVar1, sDebugText_Util_WarpToMap_SelMax);
        GetMapName(gStringVar2, Overworld_GetMapHeaderByGroupAndId(gTasks[taskId].tMapGroup, gTasks[taskId].tInput)->regionMapSectionId, 0);
        StringCopy(gStringVar3, gText_DigitIndicator[gTasks[taskId].tDigit]);
        StringExpandPlaceholders(gStringVar4, sDebugText_Util_WarpToMap_SelectMap);
        AddTextPrinterParameterized(gTasks[taskId].tSubWindowId, DEBUG_MENU_FONT, gStringVar4, 0, 0, 0, NULL);

        gTasks[taskId].func = DebugAction_Util_Warp_SelectMap;
    }
    else if (JOY_NEW(B_BUTTON))
    {
        PlaySE(SE_SELECT);
        DebugAction_DestroyExtraWindow(taskId);
    }
}

static void DebugAction_Util_Warp_SelectMap(u8 taskId)
{
    u8 max_value = MAP_GROUP_COUNT[gTasks[taskId].tMapGroup]; //maps in the selected map group

    if (JOY_NEW(DPAD_ANY))
    {
        PlaySE(SE_SELECT);
        Debug_HandleInput_Numeric(taskId, 0, max_value - 1, 3);

        ConvertIntToDecimalStringN(gStringVar1, gTasks[taskId].tInput, STR_CONV_MODE_LEADING_ZEROS, (max_value >= 100) ? 3 : 2);
        ConvertIntToDecimalStringN(gStringVar2, MAP_GROUP_COUNT[gTasks[taskId].tMapGroup] - 1, STR_CONV_MODE_LEADING_ZEROS, (max_value >= 100) ? 3 : 2);
        StringExpandPlaceholders(gStringVar1, sDebugText_Util_WarpToMap_SelMax);
        GetMapName(gStringVar2, Overworld_GetMapHeaderByGroupAndId(gTasks[taskId].tMapGroup, gTasks[taskId].tInput)->regionMapSectionId, 0);
        StringCopy(gStringVar3, gText_DigitIndicator[gTasks[taskId].tDigit]);
        StringExpandPlaceholders(gStringVar4, sDebugText_Util_WarpToMap_SelectMap);
        AddTextPrinterParameterized(gTasks[taskId].tSubWindowId, DEBUG_MENU_FONT, gStringVar4, 0, 0, 0, NULL);
    }

    if (JOY_NEW(A_BUTTON))
    {
        gTasks[taskId].tMapNum = gTasks[taskId].tInput;
        gTasks[taskId].tInput = 0;
        gTasks[taskId].tDigit = 0;

        StringCopy(gStringVar3, gText_DigitIndicator[gTasks[taskId].tDigit]);
        ConvertIntToDecimalStringN(gStringVar1, gTasks[taskId].tInput, STR_CONV_MODE_LEADING_ZEROS, 3);
        StringExpandPlaceholders(gStringVar4, sDebugText_Util_WarpToMap_SelectWarp);
        AddTextPrinterParameterized(gTasks[taskId].tSubWindowId, DEBUG_MENU_FONT, gStringVar4, 0, 0, 0, NULL);
        gTasks[taskId].func = DebugAction_Util_Warp_SelectWarp;
    }
    else if (JOY_NEW(B_BUTTON))
    {
        PlaySE(SE_SELECT);
        DebugAction_DestroyExtraWindow(taskId);
    }
}

static void DebugAction_Util_Warp_SelectWarp(u8 taskId)
{
    if (JOY_NEW(DPAD_ANY))
    {
        PlaySE(SE_SELECT);
        if (JOY_NEW(DPAD_UP))
        {
            gTasks[taskId].tInput += sPowersOfTen[gTasks[taskId].tDigit];
            if (gTasks[taskId].tInput > 10)
                gTasks[taskId].tInput = 10;
        }
        if (JOY_NEW(DPAD_DOWN))
        {
            gTasks[taskId].tInput -= sPowersOfTen[gTasks[taskId].tDigit];
            if (gTasks[taskId].tInput < 0)
                gTasks[taskId].tInput = 0;
        }

        StringCopy(gStringVar3, gText_DigitIndicator[gTasks[taskId].tDigit]);
        ConvertIntToDecimalStringN(gStringVar1, gTasks[taskId].tInput, STR_CONV_MODE_LEADING_ZEROS, 3);
        StringExpandPlaceholders(gStringVar4, sDebugText_Util_WarpToMap_SelectWarp);
        AddTextPrinterParameterized(gTasks[taskId].tSubWindowId, DEBUG_MENU_FONT, gStringVar4, 0, 0, 0, NULL);
    }

    if (JOY_NEW(A_BUTTON))
    {
        gTasks[taskId].tWarp = gTasks[taskId].tInput;
        //If there's no warp with the number available, warp to the center of the map.
        SetWarpDestinationToMapWarp(gTasks[taskId].tMapGroup, gTasks[taskId].tMapNum, gTasks[taskId].tWarp);
        DoWarp();
        ResetInitialPlayerAvatarState();
        DebugAction_DestroyExtraWindow(taskId);
    }
    else if (JOY_NEW(B_BUTTON))
    {
        PlaySE(SE_SELECT);
        DebugAction_DestroyExtraWindow(taskId);
    }
}

#undef tMapGroup
#undef tMapNum
#undef tWarp

void CheckSaveBlock1Size(struct ScriptContext *ctx)
{
    u32 currSb1Size = sizeof(struct SaveBlock1);
    u32 maxSb1Size = SECTOR_DATA_SIZE * (SECTOR_ID_SAVEBLOCK1_END - SECTOR_ID_SAVEBLOCK1_START + 1);
    ConvertIntToDecimalStringN(gStringVar1, currSb1Size, STR_CONV_MODE_LEFT_ALIGN, 6);
    ConvertIntToDecimalStringN(gStringVar2, maxSb1Size, STR_CONV_MODE_LEFT_ALIGN, 6);
    ConvertIntToDecimalStringN(gStringVar3, maxSb1Size - currSb1Size, STR_CONV_MODE_LEFT_ALIGN, 6);
    ConvertIntToDecimalStringN(gStringVar4, 1, STR_CONV_MODE_LEFT_ALIGN, 6);
}

void CheckSaveBlock2Size(struct ScriptContext *ctx)
{
    u32 currSb2Size = (sizeof(struct SaveBlock2));
    u32 maxSb2Size = SECTOR_DATA_SIZE;
    ConvertIntToDecimalStringN(gStringVar1, currSb2Size, STR_CONV_MODE_LEFT_ALIGN, 6);
    ConvertIntToDecimalStringN(gStringVar2, maxSb2Size, STR_CONV_MODE_LEFT_ALIGN, 6);
    ConvertIntToDecimalStringN(gStringVar3, maxSb2Size - currSb2Size, STR_CONV_MODE_LEFT_ALIGN, 6);
}

void CheckSaveBlock3Size(struct ScriptContext *ctx)
{
    u32 currSb3Size = (sizeof(struct SaveBlock3));
    u32 maxSb3Size = SAVE_BLOCK_3_CHUNK_SIZE * NUM_SECTORS_PER_SLOT;
    ConvertIntToDecimalStringN(gStringVar1, currSb3Size, STR_CONV_MODE_LEFT_ALIGN, 6);
    ConvertIntToDecimalStringN(gStringVar2, maxSb3Size, STR_CONV_MODE_LEFT_ALIGN, 6);
    ConvertIntToDecimalStringN(gStringVar3, maxSb3Size - currSb3Size, STR_CONV_MODE_LEFT_ALIGN, 6);
}

void CheckPokemonStorageSize(struct ScriptContext *ctx)
{
    u32 currPkmnStorageSize = sizeof(struct PokemonStorage);
    u32 maxPkmnStorageSize = SECTOR_DATA_SIZE * (SECTOR_ID_PKMN_STORAGE_END - SECTOR_ID_PKMN_STORAGE_START + 1);
    ConvertIntToDecimalStringN(gStringVar1, currPkmnStorageSize, STR_CONV_MODE_LEFT_ALIGN, 6);
    ConvertIntToDecimalStringN(gStringVar2, maxPkmnStorageSize, STR_CONV_MODE_LEFT_ALIGN, 6);
    ConvertIntToDecimalStringN(gStringVar3, maxPkmnStorageSize - currPkmnStorageSize, STR_CONV_MODE_LEFT_ALIGN, 6);
}

static void DebugAction_ROMInfo_CheckSaveBlock(u8 taskId)
{
    Debug_DestroyMenu_Full_Script(taskId, Debug_CheckSaveBlock);
}

enum RoundMode
{
    ROUND_CEILING,
    ROUND_NEAREST,
    ROUND_FLOOR,
};

static u8 *ConvertQ22_10ToDecimalString(u8 *string, u32 q22_10, u32 decimalDigits, enum RoundMode roundMode)
{
    string = ConvertIntToDecimalStringN(string, q22_10 >> 10, STR_CONV_MODE_LEFT_ALIGN, 10);

    if (decimalDigits == 0)
        return string;

    *string++ = CHAR_PERIOD;

    q22_10 &= (1 << 10) - 1;
    while (decimalDigits-- > 1)
    {
        q22_10 *= 10;
        *string++ = CHAR_0 + (q22_10 >> 10);
        q22_10 &= (1 << 10) - 1;
    }

    q22_10 *= 10;
    switch (roundMode)
    {
    case ROUND_CEILING: q22_10 += (1 << 10) - 1; break;
    case ROUND_NEAREST: q22_10 += 1 << (10 - 1); break;
    case ROUND_FLOOR:                            break;
    }
    *string++ = CHAR_0 + (q22_10 >> 10);

    *string++ = EOS;

    return string;
}

void CheckROMSize(struct ScriptContext *ctx)
{
    extern u8 __rom_end[];
    u32 currROMSizeB = __rom_end - (const u8 *)ROM_START;
    u32 currROMSizeKB = (currROMSizeB + 1023) / 1024;
    u32 currROMFreeKB = ((const u8 *)ROM_END - __rom_end) / 1024;
    ConvertQ22_10ToDecimalString(gStringVar1, currROMSizeKB, 2, ROUND_CEILING);
    ConvertQ22_10ToDecimalString(gStringVar2, currROMFreeKB, 2, ROUND_FLOOR);
}

static void DebugAction_ROMInfo_CheckROMSpace(u8 taskId)
{
    Debug_DestroyMenu_Full(taskId);
    LockPlayerFieldControls();
    ScriptContext_SetupScript(Debug_CheckROMSpace);
}

static const u8 sWeatherNames[WEATHER_COUNT][24] = {
    [WEATHER_NONE]               = _("NONE"),
    [WEATHER_SUNNY_CLOUDS]       = _("SUNNY CLOUDS"),
    [WEATHER_SUNNY]              = _("SUNNY"),
    [WEATHER_RAIN]               = _("RAIN"),
    [WEATHER_SNOW]               = _("SNOW"),
    [WEATHER_RAIN_THUNDERSTORM]  = _("RAIN THUNDERSTORM"),
    [WEATHER_FOG_HORIZONTAL]     = _("FOG HORIZONTAL"),
    [WEATHER_VOLCANIC_ASH]       = _("VOLCANIC ASH"),
    [WEATHER_SANDSTORM]          = _("SANDSTORM"),
    [WEATHER_FOG_DIAGONAL]       = _("FOG DIAGONAL"),
    [WEATHER_UNDERWATER]         = _("UNDERWATER"),
    [WEATHER_SHADE]              = _("SHADE"),
    [WEATHER_DROUGHT]            = _("DROUGHT"),
    [WEATHER_DOWNPOUR]           = _("DOWNPOUR"),
    [WEATHER_UNDERWATER_BUBBLES] = _("UNDERWATER BUBBLES"),
    [WEATHER_ABNORMAL]           = _("ABNORMAL(NOT WORKING)"),
    [WEATHER_ROUTE119_CYCLE]     = _("ROUTE119 CYCLE"),
    [WEATHER_ROUTE123_CYCLE]     = _("ROUTE123 CYCLE"),
    [WEATHER_FOG]                = _("FOG"),
};

const u8 *GetWeatherName(u32 weatherId)
{
    return sWeatherNames[weatherId];
}

static const u8 sDebugText_WeatherNotDefined[] = _("NOT DEFINED!!!");
static void DebugAction_Util_Weather(u8 taskId)
{
    u8 windowId;

    ClearStdWindowAndFrame(gTasks[taskId].tWindowId, TRUE);
    RemoveWindow(gTasks[taskId].tWindowId);

    HideMapNamePopUpWindow();
    LoadMessageBoxAndBorderGfx();
    windowId = AddWindow(&sDebugMenuWindowTemplateWeather);
    DrawStdWindowFrame(windowId, FALSE);

    CopyWindowToVram(windowId, COPYWIN_FULL);

    //Display initial ID
    StringCopy(gStringVar2, gText_DigitIndicator[0]);
    ConvertIntToDecimalStringN(gStringVar3, 1, STR_CONV_MODE_LEADING_ZEROS, 2);
    StringCopyPadded(gStringVar1, sWeatherNames[0], CHAR_SPACE, 30);
    StringExpandPlaceholders(gStringVar4, sDebugText_Util_Weather_ID);
    AddTextPrinterParameterized(windowId, DEBUG_MENU_FONT, gStringVar4, 0, 0, 0, NULL);

    gTasks[taskId].func = DebugAction_Util_Weather_SelectId;
    gTasks[taskId].tSubWindowId = windowId;
    gTasks[taskId].tInput = 0;
    gTasks[taskId].tDigit = 0;
}

static void DebugAction_Util_Weather_SelectId(u8 taskId)
{
    if (JOY_NEW(DPAD_ANY))
    {
        PlaySE(SE_SELECT);
        Debug_HandleInput_Numeric(taskId, WEATHER_NONE, WEATHER_COUNT - 1, 3);

        StringCopy(gStringVar2, gText_DigitIndicator[gTasks[taskId].tDigit]);
        ConvertIntToDecimalStringN(gStringVar3, gTasks[taskId].tInput, STR_CONV_MODE_LEADING_ZEROS, 2);

        if (gTasks[taskId].tInput <= 15 || gTasks[taskId].tInput >= 20)
            StringCopyPadded(gStringVar1, sWeatherNames[gTasks[taskId].tInput], CHAR_SPACE, 30);
        else
            StringCopyPadded(gStringVar1, sDebugText_WeatherNotDefined, CHAR_SPACE, 30);

        StringExpandPlaceholders(gStringVar4, sDebugText_Util_Weather_ID);
        AddTextPrinterParameterized(gTasks[taskId].tSubWindowId, DEBUG_MENU_FONT, gStringVar4, 0, 0, 0, NULL);
    }

    if (JOY_NEW(A_BUTTON))
    {
        if (gTasks[taskId].tInput <= 14 || gTasks[taskId].tInput >= 20)
        {
            gTasks[taskId].data[5] = gTasks[taskId].tInput;
            SetWeather(gTasks[taskId].data[5]);
        }
    }
    else if (JOY_NEW(B_BUTTON))
    {
        PlaySE(SE_SELECT);
        DebugAction_DestroyExtraWindow(taskId);
    }
}

static void DebugAction_Util_FontTest(u8 taskId)
{
    Debug_DestroyMenu_Full_Script(taskId, Debug_EventScript_FontTest);
}

static void DebugAction_TimeMenu_CheckWallClock(u8 taskId)
{
    // Debug_DestroyMenu_Full_Script(taskId, PlayersHouse_2F_EventScript_CheckWallClock);
}

static void DebugAction_TimeMenu_SetWallClock(u8 taskId)
{
    // Debug_DestroyMenu_Full_Script(taskId, PlayersHouse_2F_EventScript_SetWallClock);
}

static void DebugAction_Util_WatchCredits(u8 taskId)
{
    Debug_DestroyMenu_Full(taskId);
    SetMainCallback2(DoCredits);
}

static void DebugAction_Player_Name(u8 taskId)
{
    DoNamingScreen(NAMING_SCREEN_PLAYER, gSaveBlock2Ptr->playerName, gSaveBlock2Ptr->playerGender, 0, 0, CB2_ReturnToFieldContinueScript);
}

static void DebugAction_Player_Gender(u8 taskId)
{
    if (gSaveBlock2Ptr->playerGender == MALE)
        gSaveBlock2Ptr->playerGender = FEMALE;
    else
        gSaveBlock2Ptr->playerGender = MALE;
    Debug_DestroyMenu_Full(taskId);
    ScriptContext_Enable();
}

static void DebugAction_Player_Id(u8 taskId)
{
    u32 trainerId = Random32();
    SetTrainerId(trainerId, gSaveBlock2Ptr->playerTrainerId);
    Debug_DestroyMenu_Full(taskId);
    ScriptContext_Enable();
}

static void DebugAction_Util_CheatStart(u8 taskId)
{
    if (!FlagGet(FLAG_SYS_CLOCK_SET))
        RtcInitLocalTimeOffset(0, 0);

    InitTimeBasedEvents();
    Debug_DestroyMenu_Full_Script(taskId, Debug_CheatStart);
}

static void DebugAction_ROMInfo_ExpansionVersion(u8 taskId)
{
    Debug_DestroyMenu_Full(taskId);
    LockPlayerFieldControls();
    ScriptContext_SetupScript(Debug_ShowExpansionVersion);
}

static void DebugAction_Util_Steven_Multi(u8 taskId)
{
    Debug_DestroyMenu_Full_Script(taskId, Debug_EventScript_Steven_Multi);
}

void BufferExpansionVersion(struct ScriptContext *ctx)
{
    static const u8 sText_Released[] = _("\nRelease Build");
    static const u8 sText_Unreleased[] = _("\nDevelopment Build");
    u8 *string = gStringVar1;
    *string++ = CHAR_v;
    string = ConvertIntToDecimalStringN(string, 0, STR_CONV_MODE_LEFT_ALIGN, 3);
    *string++ = CHAR_PERIOD;
    string = ConvertIntToDecimalStringN(string, 0, STR_CONV_MODE_LEFT_ALIGN, 3);
    *string++ = CHAR_PERIOD;
    string = ConvertIntToDecimalStringN(string, 0, STR_CONV_MODE_LEFT_ALIGN, 3);
    if (FALSE)
        string = StringCopy(string, sText_Released);
    else
        string = StringCopy(string, sText_Unreleased);
}

static void DebugAction_TimeMenu_PrintTime(u8 taskId)
{
    LockPlayerFieldControls();
    Debug_DestroyMenu_Full_Script(taskId, Debug_EventScript_TellTheTime);
}

void DebugMenu_CalculateTime(struct ScriptContext *ctx)
{
    if (OW_USE_FAKE_RTC)
    {
        struct SiiRtcInfo *rtc = FakeRtc_GetCurrentTime();
        StringExpandPlaceholders(gStringVar1, gDayNameStringsTable[rtc->dayOfWeek]);
        ConvertIntToDecimalStringN(gStringVar2, rtc->hour, STR_CONV_MODE_LEFT_ALIGN, 3);
        ConvertIntToDecimalStringN(gStringVar3, rtc->minute, STR_CONV_MODE_LEADING_ZEROS, 2);
    }
    else
    {
        u32 day = ((gLocalTime.days - 1) + 6) % 7 ;
        RtcCalcLocalTime();
        StringExpandPlaceholders(gStringVar1, gDayNameStringsTable[day]);
        ConvertIntToDecimalStringN(gStringVar2, gLocalTime.hours, STR_CONV_MODE_LEFT_ALIGN, 3);
        ConvertIntToDecimalStringN(gStringVar3, gLocalTime.minutes, STR_CONV_MODE_LEADING_ZEROS, 2);
    }
}

static void DebugAction_TimeMenu_PrintTimeOfDay(u8 taskId)
{
    LockPlayerFieldControls();
    Debug_DestroyMenu_Full_Script(taskId, Debug_EventScript_PrintTimeOfDay);
}

void DebugMenu_CalculateTimeOfDay(struct ScriptContext *ctx)
{
    switch (GetTimeOfDay())
    {
        case TIME_MORNING:
            StringExpandPlaceholders(gStringVar1, gTimeOfDayStringsTable[TIME_MORNING]);
            break;
        case TIME_DAY:
            StringExpandPlaceholders(gStringVar1, gTimeOfDayStringsTable[TIME_DAY]);
            break;
        case TIME_EVENING:
            StringExpandPlaceholders(gStringVar1, gTimeOfDayStringsTable[TIME_EVENING]);
            break;
        case TIME_NIGHT:
            StringExpandPlaceholders(gStringVar1, gTimeOfDayStringsTable[TIME_NIGHT]);
            break;
        default:
            break;
    }
}

// *******************************
// Actions Scripts
static void DebugAction_Util_Script_1(u8 taskId)
{
    Debug_DestroyMenu_Full_Script(taskId, Debug_EventScript_Script_1);
}

static void DebugAction_Util_Script_2(u8 taskId)
{
    Debug_DestroyMenu_Full_Script(taskId, Debug_EventScript_Script_2);
}

static void DebugAction_Util_Script_3(u8 taskId)
{
    Debug_DestroyMenu_Full_Script(taskId, Debug_EventScript_Script_3);
}

static void DebugAction_Util_Script_4(u8 taskId)
{
    Debug_DestroyMenu_Full_Script(taskId, Debug_EventScript_Script_4);
}

static void DebugAction_Util_Script_5(u8 taskId)
{
    Debug_DestroyMenu_Full_Script(taskId, Debug_EventScript_Script_5);
}

static void DebugAction_Util_Script_6(u8 taskId)
{
    Debug_DestroyMenu_Full_Script(taskId, Debug_EventScript_Script_6);
}

static void DebugAction_Util_Script_7(u8 taskId)
{
    Debug_DestroyMenu_Full_Script(taskId, Debug_EventScript_Script_7);
}

static void DebugAction_Util_Script_8(u8 taskId)
{
    Debug_DestroyMenu_Full_Script(taskId, Debug_EventScript_Script_8);
}

// *******************************
// Actions Flags and Vars
static void Debug_Display_FlagInfo(u32 flag, u32 digit, u8 windowId)
{
    ConvertIntToDecimalStringN(gStringVar1, flag, STR_CONV_MODE_LEADING_ZEROS, DEBUG_NUMBER_DIGITS_FLAGS);
    ConvertIntToHexStringN(gStringVar2, flag, STR_CONV_MODE_LEFT_ALIGN, 3);
    StringExpandPlaceholders(gStringVar1, COMPOUND_STRING("{STR_VAR_1}{CLEAR_TO 90}\n0x{STR_VAR_2}{CLEAR_TO 90}"));
    if (FlagGet(flag))
        StringCopyPadded(gStringVar2, sDebugText_True, CHAR_SPACE, 15);
    else
        StringCopyPadded(gStringVar2, sDebugText_False, CHAR_SPACE, 15);
    StringCopy(gStringVar3, gText_DigitIndicator[digit]);
    StringExpandPlaceholders(gStringVar4, sDebugText_FlagsVars_Flag);
    AddTextPrinterParameterized(windowId, DEBUG_MENU_FONT, gStringVar4, 0, 0, 0, NULL);
}

static void DebugAction_FlagsVars_Flags(u8 taskId)
{
    u8 windowId;

    ClearStdWindowAndFrame(gTasks[taskId].tWindowId, TRUE);
    RemoveWindow(gTasks[taskId].tWindowId);

    HideMapNamePopUpWindow();
    LoadMessageBoxAndBorderGfx();
    windowId = AddWindow(&sDebugMenuWindowTemplateExtra);
    DrawStdWindowFrame(windowId, FALSE);

    CopyWindowToVram(windowId, COPYWIN_FULL);

    // Display initial flag
    Debug_Display_FlagInfo(FLAG_TEMP_1, 0, windowId);

    gTasks[taskId].func = DebugAction_FlagsVars_FlagsSelect;
    gTasks[taskId].tSubWindowId = windowId;
    gTasks[taskId].tInput = FLAG_TEMP_1;
    gTasks[taskId].tDigit = 0;
}

static void DebugAction_FlagsVars_FlagsSelect(u8 taskId)
{
    if (JOY_NEW(A_BUTTON))
    {
        FlagToggle(gTasks[taskId].tInput);
    }
    else if (JOY_NEW(B_BUTTON))
    {
        PlaySE(SE_SELECT);
        DebugAction_DestroyExtraWindow(taskId);
        return;
    }

    PlaySE(SE_SELECT);
    Debug_HandleInput_Numeric(taskId, 1, FLAGS_COUNT - 1, DEBUG_NUMBER_DIGITS_FLAGS);

    if (JOY_NEW(DPAD_ANY) || JOY_NEW(A_BUTTON))
    {
        Debug_Display_FlagInfo(gTasks[taskId].tInput, gTasks[taskId].tDigit, gTasks[taskId].tSubWindowId);
    }
}

#define tVarValue  data[5]

static void DebugAction_FlagsVars_Vars(u8 taskId)
{
    u8 windowId;

    ClearStdWindowAndFrame(gTasks[taskId].tWindowId, TRUE);
    RemoveWindow(gTasks[taskId].tWindowId);

    HideMapNamePopUpWindow();
    LoadMessageBoxAndBorderGfx();
    windowId = AddWindow(&sDebugMenuWindowTemplateExtra);
    DrawStdWindowFrame(windowId, FALSE);

    CopyWindowToVram(windowId, COPYWIN_FULL);

    // Display initial var
    ConvertIntToDecimalStringN(gStringVar1, VARS_START, STR_CONV_MODE_LEADING_ZEROS, DEBUG_NUMBER_DIGITS_VARIABLES);
    ConvertIntToHexStringN(gStringVar2, VARS_START, STR_CONV_MODE_LEFT_ALIGN, 4);
    StringExpandPlaceholders(gStringVar1, sDebugText_FlagsVars_VariableHex);
    ConvertIntToDecimalStringN(gStringVar3, 0, STR_CONV_MODE_LEADING_ZEROS, DEBUG_NUMBER_DIGITS_VARIABLES);
    StringCopyPadded(gStringVar3, gStringVar3, CHAR_SPACE, 15);
    StringCopy(gStringVar2, gText_DigitIndicator[0]);
    StringExpandPlaceholders(gStringVar4, sDebugText_FlagsVars_Variable);
    AddTextPrinterParameterized(windowId, DEBUG_MENU_FONT, gStringVar4, 0, 0, 0, NULL);

    gTasks[taskId].func = DebugAction_FlagsVars_Select;
    gTasks[taskId].tSubWindowId = windowId;
    gTasks[taskId].tInput = VARS_START;
    gTasks[taskId].tDigit = 0;
    gTasks[taskId].tVarValue = 0;
}

static void DebugAction_FlagsVars_Select(u8 taskId)
{
    Debug_HandleInput_Numeric(taskId, VARS_START, VARS_END, DEBUG_NUMBER_DIGITS_VARIABLES);

    if (JOY_NEW(DPAD_ANY))
    {
        PlaySE(SE_SELECT);

        ConvertIntToDecimalStringN(gStringVar1, gTasks[taskId].tInput, STR_CONV_MODE_LEADING_ZEROS, DEBUG_NUMBER_DIGITS_VARIABLES);
        ConvertIntToHexStringN(gStringVar2, gTasks[taskId].tInput, STR_CONV_MODE_LEFT_ALIGN, 4);
        StringExpandPlaceholders(gStringVar1, sDebugText_FlagsVars_VariableHex);
        if (VarGetIfExist(gTasks[taskId].tInput) == 0xFFFF)
            gTasks[taskId].tVarValue = 0;
        else
            gTasks[taskId].tVarValue = VarGet(gTasks[taskId].tInput);
        ConvertIntToDecimalStringN(gStringVar3, gTasks[taskId].tVarValue, STR_CONV_MODE_LEADING_ZEROS, DEBUG_NUMBER_DIGITS_VARIABLES);
        StringCopy(gStringVar2, gText_DigitIndicator[gTasks[taskId].tDigit]);

        //Combine str's to full window string
        StringExpandPlaceholders(gStringVar4, sDebugText_FlagsVars_Variable);
        AddTextPrinterParameterized(gTasks[taskId].tSubWindowId, DEBUG_MENU_FONT, gStringVar4, 0, 0, 0, NULL);
    }

    if (JOY_NEW(A_BUTTON))
    {
        gTasks[taskId].tDigit = 0;

        PlaySE(SE_SELECT);

        ConvertIntToDecimalStringN(gStringVar1, gTasks[taskId].tInput, STR_CONV_MODE_LEADING_ZEROS, DEBUG_NUMBER_DIGITS_VARIABLES);
        ConvertIntToHexStringN(gStringVar2, gTasks[taskId].tInput, STR_CONV_MODE_LEFT_ALIGN, 4);
        StringExpandPlaceholders(gStringVar1, sDebugText_FlagsVars_VariableHex);
        if (VarGetIfExist(gTasks[taskId].tInput) == 0xFFFF)
            gTasks[taskId].tVarValue = 0;
        else
            gTasks[taskId].tVarValue = VarGet(gTasks[taskId].tInput);
        ConvertIntToDecimalStringN(gStringVar3, gTasks[taskId].tVarValue, STR_CONV_MODE_LEADING_ZEROS, DEBUG_NUMBER_DIGITS_VARIABLES);
        StringCopyPadded(gStringVar3, gStringVar3, CHAR_SPACE, 15);
        StringCopy(gStringVar2, gText_DigitIndicator[gTasks[taskId].tDigit]);
        StringExpandPlaceholders(gStringVar4, sDebugText_FlagsVars_VariableValueSet);
        AddTextPrinterParameterized(gTasks[taskId].tSubWindowId, DEBUG_MENU_FONT, gStringVar4, 0, 0, 0, NULL);

        gTasks[taskId].data[6] = gTasks[taskId].data[5]; //New value selector
        gTasks[taskId].func = DebugAction_FlagsVars_SetValue;
    }
    else if (JOY_NEW(B_BUTTON))
    {
        PlaySE(SE_SELECT);
        DebugAction_DestroyExtraWindow(taskId);
        return;
    }
}

static void DebugAction_FlagsVars_SetValue(u8 taskId)
{
    if (JOY_NEW(DPAD_UP))
    {
        if (gTasks[taskId].data[6] + sPowersOfTen[gTasks[taskId].tDigit] <= 32000)
            gTasks[taskId].data[6] += sPowersOfTen[gTasks[taskId].tDigit];
        else
            gTasks[taskId].data[6] = 32000 - 1;

        if (gTasks[taskId].data[6] >= 32000)
            gTasks[taskId].data[6] = 32000 - 1;
    }
    if (JOY_NEW(DPAD_DOWN))
    {
        gTasks[taskId].data[6] -= sPowersOfTen[gTasks[taskId].tDigit];
        if (gTasks[taskId].data[6] < 0)
            gTasks[taskId].data[6] = 0;
    }
    if (JOY_NEW(DPAD_LEFT))
    {
        gTasks[taskId].tDigit -= 1;
        if (gTasks[taskId].tDigit < 0)
            gTasks[taskId].tDigit = 0;
    }
    if (JOY_NEW(DPAD_RIGHT))
    {
        gTasks[taskId].tDigit += 1;
        if (gTasks[taskId].tDigit > 4)
            gTasks[taskId].tDigit = 4;
    }

    if (JOY_NEW(A_BUTTON))
    {
        PlaySE(SE_SELECT);
        VarSet(gTasks[taskId].tInput, gTasks[taskId].data[6]);
    }
    else if (JOY_NEW(B_BUTTON))
    {
        PlaySE(SE_SELECT);
        DebugAction_DestroyExtraWindow(taskId);
        return;
    }

    if (JOY_NEW(DPAD_ANY) || JOY_NEW(A_BUTTON))
    {
        PlaySE(SE_SELECT);

        ConvertIntToDecimalStringN(gStringVar1, gTasks[taskId].tInput, STR_CONV_MODE_LEADING_ZEROS, DEBUG_NUMBER_DIGITS_VARIABLES);
        ConvertIntToHexStringN(gStringVar2, gTasks[taskId].tInput, STR_CONV_MODE_LEFT_ALIGN, 4);
        StringExpandPlaceholders(gStringVar1, sDebugText_FlagsVars_VariableHex);
        StringCopyPadded(gStringVar1, gStringVar1, CHAR_SPACE, 15);
        ConvertIntToDecimalStringN(gStringVar3, gTasks[taskId].data[6], STR_CONV_MODE_LEADING_ZEROS, DEBUG_NUMBER_DIGITS_VARIABLES);
        StringCopyPadded(gStringVar3, gStringVar3, CHAR_SPACE, 15);
        StringCopy(gStringVar2, gText_DigitIndicator[gTasks[taskId].tDigit]);
        StringExpandPlaceholders(gStringVar4, sDebugText_FlagsVars_VariableValueSet);
        AddTextPrinterParameterized(gTasks[taskId].tSubWindowId, DEBUG_MENU_FONT, gStringVar4, 0, 0, 0, NULL);
    }
}

#undef tVarValue

static void DebugAction_FlagsVars_PokedexFlags_All(u8 taskId)
{
    u16 i;
    for (i = 0; i < NATIONAL_DEX_COUNT; i++)
    {
        GetSetPokedexFlag(i + 1, FLAG_SET_CAUGHT);
        GetSetPokedexFlag(i + 1, FLAG_SET_SEEN);
    }
    Debug_DestroyMenu_Full(taskId);
    ScriptContext_Enable();
}

static void DebugAction_FlagsVars_PokedexFlags_Reset(u8 taskId)
{
    int boxId, boxPosition, partyId;
    u16 species;

    // Reset Pokedex to emtpy
    memset(&gSaveBlock1Ptr->dexCaught, 0, sizeof(gSaveBlock1Ptr->dexCaught));
    memset(&gSaveBlock1Ptr->dexSeen, 0, sizeof(gSaveBlock1Ptr->dexSeen));

    // Add party Pokemon to Pokedex
    for (partyId = 0; partyId < PARTY_SIZE; partyId++)
    {
        if (GetMonData(&gPlayerParty[partyId], MON_DATA_SANITY_HAS_SPECIES))
        {
            species = GetMonData(&gPlayerParty[partyId], MON_DATA_SPECIES);
            GetSetPokedexFlag(SpeciesToNationalPokedexNum(species), FLAG_SET_CAUGHT);
            GetSetPokedexFlag(SpeciesToNationalPokedexNum(species), FLAG_SET_SEEN);
        }
    }

    // Add box Pokemon to Pokedex
    for (boxId = 0; boxId < TOTAL_BOXES_COUNT; boxId++)
    {
        for (boxPosition = 0; boxPosition < IN_BOX_COUNT; boxPosition++)
        {
            if (GetBoxMonData(&gPokemonStoragePtr->boxes[boxId][boxPosition], MON_DATA_SANITY_HAS_SPECIES))
            {
                species = GetBoxMonData(&gPokemonStoragePtr->boxes[boxId][boxPosition], MON_DATA_SPECIES);
                GetSetPokedexFlag(SpeciesToNationalPokedexNum(species), FLAG_SET_CAUGHT);
                GetSetPokedexFlag(SpeciesToNationalPokedexNum(species), FLAG_SET_SEEN);
            }
        }
    }
    Debug_DestroyMenu_Full(taskId);
    ScriptContext_Enable();
}

static void DebugAction_FlagsVars_SwitchDex(u8 taskId)
{
    if (FlagGet(FLAG_SYS_POKEDEX_GET))
        PlaySE(SE_PC_OFF);
    else
        PlaySE(SE_PC_LOGIN);
    FlagToggle(FLAG_SYS_POKEDEX_GET);
}

static void DebugAction_FlagsVars_SwitchNatDex(u8 taskId)
{
    if (IsNationalPokedexEnabled())
    {
        DisableNationalPokedex();
        PlaySE(SE_PC_OFF);
    }
    else
    {
        EnableNationalPokedex();
        PlaySE(SE_PC_LOGIN);
    }
}

static void DebugAction_FlagsVars_SwitchPokeNav(u8 taskId)
{
    // if (FlagGet(FLAG_SYS_POKENAV_GET))
    //     PlaySE(SE_PC_OFF);
    // else
    //     PlaySE(SE_PC_LOGIN);
    // FlagToggle(FLAG_SYS_POKENAV_GET);
}

static void DebugAction_FlagsVars_SwitchMatchCall(u8 taskId)
{
    // if (FlagGet(FLAG_ADDED_MATCH_CALL_TO_POKENAV))
    // {
    //     PlaySE(SE_PC_OFF);
    //     FlagClear(FLAG_ADDED_MATCH_CALL_TO_POKENAV);
    //     FlagClear(FLAG_HAS_MATCH_CALL);
    // }
    // else
    // {
    //     PlaySE(SE_PC_LOGIN);
    //     FlagSet(FLAG_ADDED_MATCH_CALL_TO_POKENAV);
    //     FlagSet(FLAG_HAS_MATCH_CALL);
    // }
}

static void DebugAction_FlagsVars_RunningShoes(u8 taskId)
{
    if (FlagGet(FLAG_SYS_B_DASH))
        PlaySE(SE_PC_OFF);
    else
        PlaySE(SE_PC_LOGIN);
    FlagToggle(FLAG_SYS_B_DASH);
}

static void DebugAction_FlagsVars_ToggleFlyFlags(u8 taskId)
{
    if (FlagGet(sLocationFlags[ARRAY_COUNT(sLocationFlags) - 1]))
    {
        PlaySE(SE_PC_OFF);
        for (u32 i = 0; i < ARRAY_COUNT(sLocationFlags); i++)
            FlagClear(sLocationFlags[i]);
    }
    else
    {
        PlaySE(SE_PC_LOGIN);
        for (u32 i = 0; i < ARRAY_COUNT(sLocationFlags); i++)
            FlagSet(sLocationFlags[i]);
    }
}

static void DebugAction_FlagsVars_ToggleBadgeFlags(u8 taskId)
{
    if (FlagGet(gBadgeFlags[ARRAY_COUNT(gBadgeFlags) - 1]))
    {
        PlaySE(SE_PC_OFF);
        for (u32 i = 0; i < ARRAY_COUNT(gBadgeFlags); i++)
            FlagClear(gBadgeFlags[i]);
    }
    else
    {
        PlaySE(SE_PC_LOGIN);
        for (u32 i = 0; i < ARRAY_COUNT(gBadgeFlags); i++)
            FlagSet(gBadgeFlags[i]);
    }
}

static void DebugAction_FlagsVars_ToggleGameClear(u8 taskId)
{
    // Sound effect
    if (FlagGet(FLAG_SYS_GAME_CLEAR))
        PlaySE(SE_PC_OFF);
    else
        PlaySE(SE_PC_LOGIN);
    FlagToggle(FLAG_SYS_GAME_CLEAR);
}

static void DebugAction_FlagsVars_ToggleFrontierPass(u8 taskId)
{
    // // Sound effect
    // if (FlagGet(FLAG_SYS_FRONTIER_PASS))
    //     PlaySE(SE_PC_OFF);
    // else
    //     PlaySE(SE_PC_LOGIN);
    // FlagToggle(FLAG_SYS_FRONTIER_PASS);
}

static void DebugAction_FlagsVars_CollisionOnOff(u8 taskId)
{
#if OW_FLAG_NO_COLLISION == 0
    Debug_DestroyMenu_Full_Script(taskId, Debug_FlagsNotSetOverworldConfigMessage);
#else
    if (FlagGet(OW_FLAG_NO_COLLISION))
        PlaySE(SE_PC_OFF);
    else
        PlaySE(SE_PC_LOGIN);
    FlagToggle(OW_FLAG_NO_COLLISION);
#endif
}

static void DebugAction_FlagsVars_EncounterOnOff(u8 taskId)
{
#if OW_FLAG_NO_ENCOUNTER == 0
    Debug_DestroyMenu_Full_Script(taskId, Debug_FlagsNotSetOverworldConfigMessage);
#else
    if (FlagGet(OW_FLAG_NO_ENCOUNTER))
        PlaySE(SE_PC_OFF);
    else
        PlaySE(SE_PC_LOGIN);
    FlagToggle(OW_FLAG_NO_ENCOUNTER);
#endif
}

static void DebugAction_FlagsVars_TrainerSeeOnOff(u8 taskId)
{
#if OW_FLAG_NO_TRAINER_SEE == 0
    Debug_DestroyMenu_Full_Script(taskId, Debug_FlagsNotSetOverworldConfigMessage);
#else
    if (FlagGet(OW_FLAG_NO_TRAINER_SEE))
        PlaySE(SE_PC_OFF);
    else
        PlaySE(SE_PC_LOGIN);
    FlagToggle(OW_FLAG_NO_TRAINER_SEE);
#endif
}

static void DebugAction_FlagsVars_BagUseOnOff(u8 taskId)
{
#if B_FLAG_NO_BAG_USE == 0
    Debug_DestroyMenu_Full_Script(taskId, Debug_FlagsNotSetBattleConfigMessage);
#else
    if (FlagGet(B_FLAG_NO_BAG_USE))
        PlaySE(SE_PC_OFF);
    else
        PlaySE(SE_PC_LOGIN);
    FlagToggle(B_FLAG_NO_BAG_USE);
#endif
}

static void DebugAction_FlagsVars_CatchingOnOff(u8 taskId)
{
#if B_FLAG_NO_CATCHING == 0
    Debug_DestroyMenu_Full_Script(taskId, Debug_FlagsNotSetBattleConfigMessage);
#else
    if (FlagGet(B_FLAG_NO_CATCHING))
        PlaySE(SE_PC_OFF);
    else
        PlaySE(SE_PC_LOGIN);
    FlagToggle(B_FLAG_NO_CATCHING);
#endif
}

// *******************************
// Actions Give
#define ITEM_TAG 0xFDF3
#define tItemId    data[5]
#define tSpriteId  data[6]

static void Debug_Display_ItemInfo(u32 itemId, u32 digit, u8 windowId)
{
    StringCopy(gStringVar2, gText_DigitIndicator[digit]);
    u8* end = CopyItemName(itemId, gStringVar1);
    WrapFontIdToFit(gStringVar1, end, DEBUG_MENU_FONT, WindowWidthPx(windowId));
    StringCopyPadded(gStringVar1, gStringVar1, CHAR_SPACE, 15);
    ConvertIntToDecimalStringN(gStringVar3, itemId, STR_CONV_MODE_LEADING_ZEROS, DEBUG_NUMBER_DIGITS_ITEMS);
    StringExpandPlaceholders(gStringVar4, sDebugText_ItemID);
    AddTextPrinterParameterized(windowId, DEBUG_MENU_FONT, gStringVar4, 0, 0, 0, NULL);
}

static void DebugAction_Give_Item(u8 taskId)
{
    u8 windowId;

    ClearStdWindowAndFrame(gTasks[taskId].tWindowId, TRUE);
    RemoveWindow(gTasks[taskId].tWindowId);

    HideMapNamePopUpWindow();
    LoadMessageBoxAndBorderGfx();
    windowId = AddWindow(&sDebugMenuWindowTemplateExtra);
    DrawStdWindowFrame(windowId, FALSE);

    CopyWindowToVram(windowId, COPYWIN_FULL);

    // Display initial item
    Debug_Display_ItemInfo(1, 0, windowId);

    gTasks[taskId].func = DebugAction_Give_Item_SelectId;
    gTasks[taskId].tSubWindowId = windowId;
    gTasks[taskId].tInput = 1;
    gTasks[taskId].tDigit = 0;
    gTasks[taskId].tSpriteId = AddItemIconSprite(ITEM_TAG, ITEM_TAG, gTasks[taskId].tInput);
    gSprites[gTasks[taskId].tSpriteId].x2 = DEBUG_NUMBER_ICON_X+10;
    gSprites[gTasks[taskId].tSpriteId].y2 = DEBUG_NUMBER_ICON_Y+10;
    gSprites[gTasks[taskId].tSpriteId].oam.priority = 0;
}

static void DestroyItemIcon(u8 taskId)
{
    FreeSpriteTilesByTag(ITEM_TAG);
    FreeSpritePaletteByTag(ITEM_TAG);
    FreeSpriteOamMatrix(&gSprites[gTasks[taskId].tSpriteId]);
    DestroySprite(&gSprites[gTasks[taskId].tSpriteId]);
}

static void Debug_Display_ItemQuantity(u32 quantity, u32 digit, u8 windowId)
{
    StringCopy(gStringVar2, gText_DigitIndicator[digit]);
    ConvertIntToDecimalStringN(gStringVar1, quantity, STR_CONV_MODE_LEADING_ZEROS, DEBUG_NUMBER_DIGITS_ITEM_QUANTITY);
    StringCopyPadded(gStringVar1, gStringVar1, CHAR_SPACE, 15);
    StringExpandPlaceholders(gStringVar4, sDebugText_ItemQuantity);
    AddTextPrinterParameterized(windowId, DEBUG_MENU_FONT, gStringVar4, 0, 0, 0, NULL);
}

static void DebugAction_Give_Item_SelectId(u8 taskId)
{
    if (JOY_NEW(DPAD_ANY))
    {
        PlaySE(SE_SELECT);
        Debug_HandleInput_Numeric(taskId, 1, ITEMS_COUNT - 1, DEBUG_NUMBER_DIGITS_ITEMS);
        Debug_Display_ItemInfo(gTasks[taskId].tInput, gTasks[taskId].tDigit, gTasks[taskId].tSubWindowId);
        DestroyItemIcon(taskId);
        gTasks[taskId].tSpriteId = AddItemIconSprite(ITEM_TAG, ITEM_TAG, gTasks[taskId].tInput);
        gSprites[gTasks[taskId].tSpriteId].x2 = DEBUG_NUMBER_ICON_X+10;
        gSprites[gTasks[taskId].tSpriteId].y2 = DEBUG_NUMBER_ICON_Y+10;
        gSprites[gTasks[taskId].tSpriteId].oam.priority = 0;
    }

    if (JOY_NEW(A_BUTTON))
    {
        gTasks[taskId].tItemId = gTasks[taskId].tInput;
        gTasks[taskId].tInput = 1;
        gTasks[taskId].tDigit = 0;
        Debug_Display_ItemQuantity(gTasks[taskId].tInput, gTasks[taskId].tDigit, gTasks[taskId].tSubWindowId);
        gTasks[taskId].func = DebugAction_Give_Item_SelectQuantity;
    }
    else if (JOY_NEW(B_BUTTON))
    {
        DestroyItemIcon(taskId);

        PlaySE(SE_SELECT);
        DebugAction_DestroyExtraWindow(taskId);
    }
}

static void DebugAction_Give_Item_SelectQuantity(u8 taskId)
{
    u32 itemId = gTasks[taskId].tItemId;

    if (JOY_NEW(DPAD_ANY))
    {
        PlaySE(SE_SELECT);
        Debug_HandleInput_Numeric(taskId, 1, MAX_BAG_ITEM_CAPACITY, MAX_ITEM_DIGITS);
        Debug_Display_ItemQuantity(gTasks[taskId].tInput, gTasks[taskId].tDigit, gTasks[taskId].tSubWindowId);
    }

    if (JOY_NEW(A_BUTTON))
    {
        DestroyItemIcon(taskId);

        PlaySE(MUS_LEVEL_UP);
        AddBagItem(itemId, gTasks[taskId].tInput);
        DebugAction_DestroyExtraWindow(taskId);
    }
    else if (JOY_NEW(B_BUTTON))
    {
        DestroyItemIcon(taskId);

        PlaySE(SE_SELECT);
        DebugAction_DestroyExtraWindow(taskId);
    }
}

#undef tItemId
#undef tSpriteId

//Pokemon
static void ResetMonDataStruct(struct DebugMonData *sDebugMonData)
{
    sDebugMonData->species          = 1;
    sDebugMonData->level            = MIN_LEVEL;
    sDebugMonData->isShiny          = FALSE;
    sDebugMonData->nature           = 0;
    sDebugMonData->abilityNum       = 0;
    sDebugMonData->teraType         = TYPE_NONE;
    sDebugMonData->dynamaxLevel     = 0;
    sDebugMonData->gmaxFactor       = FALSE;
    for (u32 i = 0; i < NUM_STATS; i++)
    {
        sDebugMonData->monIVs[i] = 0;
        sDebugMonData->monEVs[i] = 0;
    }
}

#define tIsComplex  data[5]
#define tSpriteId   data[6]
#define tIterator   data[7]

static void Debug_Display_SpeciesInfo(u32 species, u32 digit, u8 windowId)
{
    StringCopy(gStringVar2, gText_DigitIndicator[digit]);
    u8 *end = StringCopy(gStringVar1, GetSpeciesName(species));
    WrapFontIdToFit(gStringVar1, end, DEBUG_MENU_FONT, WindowWidthPx(windowId));
    StringCopyPadded(gStringVar1, gStringVar1, CHAR_SPACE, 15);
    ConvertIntToDecimalStringN(gStringVar3, species, STR_CONV_MODE_LEADING_ZEROS, DEBUG_NUMBER_DIGITS_ITEMS);
    StringExpandPlaceholders(gStringVar4, sDebugText_PokemonID);
    AddTextPrinterParameterized(windowId, DEBUG_MENU_FONT, gStringVar4, 0, 0, 0, NULL);
}

static void DebugAction_Give_PokemonSimple(u8 taskId)
{
    u8 windowId;

    //Mon data struct
    sDebugMonData = AllocZeroed(sizeof(struct DebugMonData));
    ResetMonDataStruct(sDebugMonData);

    //Window initialization
    ClearStdWindowAndFrame(gTasks[taskId].tWindowId, TRUE);
    RemoveWindow(gTasks[taskId].tWindowId);

    HideMapNamePopUpWindow();
    LoadMessageBoxAndBorderGfx();
    windowId = AddWindow(&sDebugMenuWindowTemplateExtra);
    DrawStdWindowFrame(windowId, FALSE);

    CopyWindowToVram(windowId, COPYWIN_FULL);

    // Display initial Pokémon
    Debug_Display_SpeciesInfo(sDebugMonData->species, 0, windowId);

    //Set task data
    gTasks[taskId].func = DebugAction_Give_Pokemon_SelectId;
    gTasks[taskId].tSubWindowId = windowId;
    gTasks[taskId].tInput = sDebugMonData->species;
    gTasks[taskId].tDigit = 0;
    gTasks[taskId].tIsComplex = FALSE;

    FreeMonIconPalettes();
    LoadMonIconPalette(gTasks[taskId].tInput);
    gTasks[taskId].tSpriteId = CreateMonIcon(gTasks[taskId].tInput, SpriteCB_MonIcon, DEBUG_NUMBER_ICON_X, DEBUG_NUMBER_ICON_Y, 4, 0);
    gSprites[gTasks[taskId].tSpriteId].oam.priority = 0;
}

static void DebugAction_Give_PokemonComplex(u8 taskId)
{
    u8 windowId;

    //Mon data struct
    sDebugMonData = AllocZeroed(sizeof(struct DebugMonData));
    ResetMonDataStruct(sDebugMonData);

    //Window initialization
    ClearStdWindowAndFrame(gTasks[taskId].tWindowId, TRUE);
    RemoveWindow(gTasks[taskId].tWindowId);

    HideMapNamePopUpWindow();
    LoadMessageBoxAndBorderGfx();
    windowId = AddWindow(&sDebugMenuWindowTemplateExtra);
    DrawStdWindowFrame(windowId, FALSE);

    CopyWindowToVram(windowId, COPYWIN_FULL);

    // Display initial Pokémon
    Debug_Display_SpeciesInfo(sDebugMonData->species, 0, windowId);

    gTasks[taskId].func = DebugAction_Give_Pokemon_SelectId;
    gTasks[taskId].tSubWindowId = windowId;
    gTasks[taskId].tInput = 1;
    gTasks[taskId].tDigit = 0;
    gTasks[taskId].tIsComplex = TRUE;

    FreeMonIconPalettes();
    LoadMonIconPalette(gTasks[taskId].tInput);
    gTasks[taskId].tSpriteId = CreateMonIcon(gTasks[taskId].tInput, SpriteCB_MonIcon, DEBUG_NUMBER_ICON_X, DEBUG_NUMBER_ICON_Y, 4, 0);
    gSprites[gTasks[taskId].tSpriteId].oam.priority = 0;
    gTasks[taskId].tIterator = 0;
}

static void Debug_Display_Level(u32 level, u32 digit, u8 windowId)
{
    StringCopy(gStringVar2, gText_DigitIndicator[digit]);
    ConvertIntToDecimalStringN(gStringVar1, level, STR_CONV_MODE_LEADING_ZEROS, 3);
    StringCopyPadded(gStringVar1, gStringVar1, CHAR_SPACE, 15);
    StringExpandPlaceholders(gStringVar4, sDebugText_PokemonLevel);
    AddTextPrinterParameterized(windowId, DEBUG_MENU_FONT, gStringVar4, 0, 0, 0, NULL);
}

static void DebugAction_Give_Pokemon_SelectId(u8 taskId)
{
    if (JOY_NEW(DPAD_ANY))
    {
        PlaySE(SE_SELECT);
        Debug_HandleInput_Numeric(taskId, 1, NUM_SPECIES - 1, DEBUG_NUMBER_DIGITS_ITEMS);
        Debug_Display_SpeciesInfo(gTasks[taskId].tInput, gTasks[taskId].tDigit, gTasks[taskId].tSubWindowId);
        FreeAndDestroyMonIconSprite(&gSprites[gTasks[taskId].tSpriteId]);
        FreeMonIconPalettes();
        LoadMonIconPalette(gTasks[taskId].tInput);
        gTasks[taskId].tSpriteId = CreateMonIcon(gTasks[taskId].tInput, SpriteCB_MonIcon, DEBUG_NUMBER_ICON_X, DEBUG_NUMBER_ICON_Y, 4, 0);
        gSprites[gTasks[taskId].tSpriteId].oam.priority = 0;
    }

    if (JOY_NEW(A_BUTTON))
    {
        sDebugMonData->species = gTasks[taskId].tInput;
        gTasks[taskId].tInput = 1;
        gTasks[taskId].tDigit = 0;

        Debug_Display_Level(gTasks[taskId].tInput, gTasks[taskId].tDigit, gTasks[taskId].tSubWindowId);

        gTasks[taskId].func = DebugAction_Give_Pokemon_SelectLevel;
    }
    else if (JOY_NEW(B_BUTTON))
    {
        PlaySE(SE_SELECT);
        Free(sDebugMonData);
        FreeMonIconPalettes();
        FreeAndDestroyMonIconSprite(&gSprites[gTasks[taskId].tSpriteId]);
        DebugAction_DestroyExtraWindow(taskId);
    }
}

static void Debug_Display_TrueFalse(bool32 value, u8 windowId, const u8 *titleStr)
{
    static const u8 *txtStr;
    txtStr = value ? sDebugText_True : sDebugText_False;
    StringCopyPadded(gStringVar2, txtStr, CHAR_SPACE, 15);
    ConvertIntToDecimalStringN(gStringVar3, value, STR_CONV_MODE_LEADING_ZEROS, 0);
    StringCopyPadded(gStringVar3, gStringVar3, CHAR_SPACE, 15);
    StringExpandPlaceholders(gStringVar4, titleStr);
    AddTextPrinterParameterized(windowId, DEBUG_MENU_FONT, gStringVar4, 0, 0, 0, NULL);
}

static void DebugAction_Give_Pokemon_SelectLevel(u8 taskId)
{
    if (JOY_NEW(DPAD_ANY))
    {
        PlaySE(SE_SELECT);
        Debug_HandleInput_Numeric(taskId, 1, MAX_LEVEL, 3);
        Debug_Display_Level(gTasks[taskId].tInput, gTasks[taskId].tDigit, gTasks[taskId].tSubWindowId);
    }

    if (JOY_NEW(A_BUTTON))
    {
        FreeMonIconPalettes();
        FreeAndDestroyMonIconSprite(&gSprites[gTasks[taskId].tSpriteId]);
        if (gTasks[taskId].tIsComplex == FALSE)
        {
            PlaySE(MUS_LEVEL_UP);
            ScriptGiveMon(sDebugMonData->species, gTasks[taskId].tInput, ITEM_NONE);
            // Set flag for user convenience
            FlagSet(FLAG_SYS_POKEMON_GET);
            Free(sDebugMonData);
            DebugAction_DestroyExtraWindow(taskId);
        }
        else
        {
            sDebugMonData->level = gTasks[taskId].tInput;
            gTasks[taskId].tInput = 0;
            gTasks[taskId].tDigit = 0;
            Debug_Display_TrueFalse(gTasks[taskId].tInput, gTasks[taskId].tSubWindowId, sDebugText_PokemonShiny);
            gTasks[taskId].func = DebugAction_Give_Pokemon_SelectShiny;
        }
    }
    else if (JOY_NEW(B_BUTTON))
    {
        PlaySE(SE_SELECT);
        Free(sDebugMonData);
        FreeMonIconPalettes();
        FreeAndDestroyMonIconSprite(&gSprites[gTasks[taskId].tSpriteId]);
        DebugAction_DestroyExtraWindow(taskId);
    }
}

static void Debug_Display_Nature(u32 natureId, u32 digit, u8 windowId)
{
    StringCopy(gStringVar2, gText_DigitIndicator[digit]);
    ConvertIntToDecimalStringN(gStringVar3, natureId, STR_CONV_MODE_LEADING_ZEROS, 2);
    StringCopyPadded(gStringVar3, gStringVar3, CHAR_SPACE, 15);
    StringCopy(gStringVar1, gNaturesInfo[natureId].name);
    StringExpandPlaceholders(gStringVar4, COMPOUND_STRING("Nature ID: {STR_VAR_3}{CLEAR_TO 90}\n{STR_VAR_1}{CLEAR_TO 90}\n{CLEAR_TO 90}\n{STR_VAR_2}{CLEAR_TO 90}"));
    AddTextPrinterParameterized(windowId, DEBUG_MENU_FONT, gStringVar4, 0, 0, 0, NULL);
}

static void DebugAction_Give_Pokemon_SelectShiny(u8 taskId)
{
    if (JOY_NEW(DPAD_ANY))
    {
        PlaySE(SE_SELECT);
        gTasks[taskId].tInput ^= JOY_NEW(DPAD_UP | DPAD_DOWN) > 0;
        Debug_Display_TrueFalse(gTasks[taskId].tInput, gTasks[taskId].tSubWindowId, sDebugText_PokemonShiny);
    }

    if (JOY_NEW(A_BUTTON))
    {
        sDebugMonData->isShiny = gTasks[taskId].tInput;
        gTasks[taskId].tInput = 0;
        gTasks[taskId].tDigit = 0;
        Debug_Display_Nature(gTasks[taskId].tInput, gTasks[taskId].tDigit, gTasks[taskId].tSubWindowId);
        gTasks[taskId].func = DebugAction_Give_Pokemon_SelectNature;
    }
    else if (JOY_NEW(B_BUTTON))
    {
        PlaySE(SE_SELECT);
        Free(sDebugMonData);
        DebugAction_DestroyExtraWindow(taskId);
    }
}

static void Debug_Display_Ability(u32 abilityId, u32 digit, u8 windowId)//(u32 natureId, u32 digit, u8 windowId)
{
    StringCopy(gStringVar2, gText_DigitIndicator[digit]);
    ConvertIntToDecimalStringN(gStringVar3, abilityId, STR_CONV_MODE_LEADING_ZEROS, 2);
    StringCopyPadded(gStringVar3, gStringVar3, CHAR_SPACE, 15);
    u8 *end = StringCopy(gStringVar1, gAbilitiesInfo[abilityId].name);
    WrapFontIdToFit(gStringVar1, end, DEBUG_MENU_FONT, WindowWidthPx(windowId));
    StringExpandPlaceholders(gStringVar4, sDebugText_PokemonAbility);
    AddTextPrinterParameterized(windowId, DEBUG_MENU_FONT, gStringVar4, 0, 0, 0, NULL);
}

static void DebugAction_Give_Pokemon_SelectNature(u8 taskId)
{
    if (JOY_NEW(DPAD_ANY))
    {
        PlaySE(SE_SELECT);

        if (JOY_NEW(DPAD_UP))
        {
            gTasks[taskId].tInput += sPowersOfTen[gTasks[taskId].tDigit];
            if (gTasks[taskId].tInput > NUM_NATURES - 1)
                gTasks[taskId].tInput = NUM_NATURES - 1;
        }
        if (JOY_NEW(DPAD_DOWN))
        {
            gTasks[taskId].tInput -= sPowersOfTen[gTasks[taskId].tDigit];
            if (gTasks[taskId].tInput < 0)
                gTasks[taskId].tInput = 0;
        }

        Debug_Display_Nature(gTasks[taskId].tInput, gTasks[taskId].tDigit, gTasks[taskId].tSubWindowId);
    }

    if (JOY_NEW(A_BUTTON))
    {
        sDebugMonData->nature = gTasks[taskId].tInput;
        gTasks[taskId].tInput = 0;
        gTasks[taskId].tDigit = 0;

        u32 abilityId = GetAbilityBySpecies(sDebugMonData->species, 0);
        Debug_Display_Ability(abilityId, gTasks[taskId].tDigit, gTasks[taskId].tSubWindowId);

        gTasks[taskId].func = DebugAction_Give_Pokemon_SelectAbility;
    }
    else if (JOY_NEW(B_BUTTON))
    {
        PlaySE(SE_SELECT);
        Free(sDebugMonData);
        DebugAction_DestroyExtraWindow(taskId);
    }
}

static void DebugAction_Give_Pokemon_SelectAbility(u8 taskId)
{
    u8 abilityCount = NUM_ABILITY_SLOTS - 1; //-1 for proper iteration
    u8 i = 0;

    if (JOY_NEW(DPAD_ANY))
    {
        PlaySE(SE_SELECT);

        if (JOY_NEW(DPAD_UP))
        {
            gTasks[taskId].tInput += sPowersOfTen[gTasks[taskId].tDigit];
            if (gTasks[taskId].tInput > abilityCount)
                gTasks[taskId].tInput = abilityCount;
        }
        if (JOY_NEW(DPAD_DOWN))
        {
            gTasks[taskId].tInput -= sPowersOfTen[gTasks[taskId].tDigit];
            if (gTasks[taskId].tInput < 0)
                gTasks[taskId].tInput = 0;
        }

        while (GetAbilityBySpecies(sDebugMonData->species, gTasks[taskId].tInput - i) == ABILITY_NONE && gTasks[taskId].tInput - i < NUM_ABILITY_SLOTS)
        {
            i++;
        }
        u32 abilityId = GetAbilityBySpecies(sDebugMonData->species, gTasks[taskId].tInput - i);
        Debug_Display_Ability(abilityId, gTasks[taskId].tDigit, gTasks[taskId].tSubWindowId);
    }

    if (JOY_NEW(A_BUTTON))
    {
        sDebugMonData->abilityNum = gTasks[taskId].tInput - i;
        gTasks[taskId].tInput = 0;
        gTasks[taskId].tDigit = 0;

        StringCopy(gStringVar2, gText_DigitIndicator[gTasks[taskId].tDigit]);
        ConvertIntToDecimalStringN(gStringVar3, gTasks[taskId].tInput, STR_CONV_MODE_LEADING_ZEROS, 2);
        StringCopyPadded(gStringVar3, gStringVar3, CHAR_SPACE, 15);
        StringCopy(gStringVar1, gTypesInfo[0].name);
        StringExpandPlaceholders(gStringVar4, sDebugText_PokemonTeraType);
        AddTextPrinterParameterized(gTasks[taskId].tSubWindowId, DEBUG_MENU_FONT, gStringVar4, 0, 0, 0, NULL);

        gTasks[taskId].func = DebugAction_Give_Pokemon_SelectTeraType;
    }
    else if (JOY_NEW(B_BUTTON))
    {
        PlaySE(SE_SELECT);
        Free(sDebugMonData);
        DebugAction_DestroyExtraWindow(taskId);
    }
}

static void DebugAction_Give_Pokemon_SelectTeraType(u8 taskId)
{
    if (JOY_NEW(DPAD_ANY))
    {
        PlaySE(SE_SELECT);

        if (JOY_NEW(DPAD_UP))
        {
            gTasks[taskId].tInput += sPowersOfTen[gTasks[taskId].tDigit];
            if (gTasks[taskId].tInput > NUMBER_OF_MON_TYPES - 1)
                gTasks[taskId].tInput = NUMBER_OF_MON_TYPES - 1;
        }
        if (JOY_NEW(DPAD_DOWN))
        {
            gTasks[taskId].tInput -= sPowersOfTen[gTasks[taskId].tDigit];
            if (gTasks[taskId].tInput < 0)
                gTasks[taskId].tInput = 0;
        }

        StringCopy(gStringVar2, gText_DigitIndicator[gTasks[taskId].tDigit]);
        ConvertIntToDecimalStringN(gStringVar3, gTasks[taskId].tInput, STR_CONV_MODE_LEADING_ZEROS, 2);
        StringCopyPadded(gStringVar3, gStringVar3, CHAR_SPACE, 15);
        StringCopy(gStringVar1, gTypesInfo[gTasks[taskId].tInput].name);
        StringExpandPlaceholders(gStringVar4, sDebugText_PokemonTeraType);
        AddTextPrinterParameterized(gTasks[taskId].tSubWindowId, DEBUG_MENU_FONT, gStringVar4, 0, 0, 0, NULL);
    }

    if (JOY_NEW(A_BUTTON))
    {
        sDebugMonData->teraType = gTasks[taskId].tInput;
        gTasks[taskId].tInput = 0;
        gTasks[taskId].tDigit = 0;

        StringCopy(gStringVar2, gText_DigitIndicator[gTasks[taskId].tDigit]);
        ConvertIntToDecimalStringN(gStringVar1, gTasks[taskId].tInput, STR_CONV_MODE_LEADING_ZEROS, 2);
        StringCopyPadded(gStringVar1, gStringVar1, CHAR_SPACE, 15);
        StringExpandPlaceholders(gStringVar4, sDebugText_PokemonDynamaxLevel);
        AddTextPrinterParameterized(gTasks[taskId].tSubWindowId, DEBUG_MENU_FONT, gStringVar4, 0, 0, 0, NULL);

        gTasks[taskId].func = DebugAction_Give_Pokemon_SelectDynamaxLevel;
    }
    else if (JOY_NEW(B_BUTTON))
    {
        PlaySE(SE_SELECT);
        Free(sDebugMonData);
        DebugAction_DestroyExtraWindow(taskId);
    }
}

static void DebugAction_Give_Pokemon_SelectDynamaxLevel(u8 taskId)
{
    if (JOY_NEW(DPAD_ANY))
    {
        PlaySE(SE_SELECT);
        Debug_HandleInput_Numeric(taskId, 0, MAX_DYNAMAX_LEVEL, 2);

        StringCopy(gStringVar2, gText_DigitIndicator[gTasks[taskId].tDigit]);
        ConvertIntToDecimalStringN(gStringVar1, gTasks[taskId].tInput, STR_CONV_MODE_LEADING_ZEROS, 2);
        StringCopyPadded(gStringVar1, gStringVar1, CHAR_SPACE, 15);
        StringExpandPlaceholders(gStringVar4, sDebugText_PokemonDynamaxLevel);
        AddTextPrinterParameterized(gTasks[taskId].tSubWindowId, DEBUG_MENU_FONT, gStringVar4, 0, 0, 0, NULL);
    }

    if (JOY_NEW(A_BUTTON))
    {
        sDebugMonData->dynamaxLevel = gTasks[taskId].tInput;
        gTasks[taskId].tInput = 0;
        gTasks[taskId].tDigit = 0;
        Debug_Display_TrueFalse(gTasks[taskId].tInput, gTasks[taskId].tSubWindowId, sDebugText_PokemonGmaxFactor);
        gTasks[taskId].func = DebugAction_Give_Pokemon_SelectGigantamaxFactor;
    }
    else if (JOY_NEW(B_BUTTON))
    {
        PlaySE(SE_SELECT);
        Free(sDebugMonData);
        FreeMonIconPalettes();
        FreeAndDestroyMonIconSprite(&gSprites[gTasks[taskId].tSpriteId]);
        DebugAction_DestroyExtraWindow(taskId);
    }
}

static void Debug_Display_StatInfo(const u8* text, u32 stat, u32 value, u32 digit, u8 windowId)
{
    StringCopy(gStringVar1, gStatNamesTable[stat]);
    StringCopy(gStringVar2, gText_DigitIndicator[digit]);
    ConvertIntToDecimalStringN(gStringVar3, value, STR_CONV_MODE_LEADING_ZEROS, 2);
    StringCopyPadded(gStringVar3, gStringVar3, CHAR_SPACE, 15);
    StringExpandPlaceholders(gStringVar4, text);
    AddTextPrinterParameterized(windowId, DEBUG_MENU_FONT, gStringVar4, 0, 0, 0, NULL);
}

static void DebugAction_Give_Pokemon_SelectGigantamaxFactor(u8 taskId)
{
    if (JOY_NEW(DPAD_ANY))
    {
        PlaySE(SE_SELECT);
        gTasks[taskId].tInput ^= JOY_NEW(DPAD_UP | DPAD_DOWN) > 0;
        Debug_Display_TrueFalse(gTasks[taskId].tInput, gTasks[taskId].tSubWindowId, sDebugText_PokemonGmaxFactor);
    }

    if (JOY_NEW(A_BUTTON))
    {
        sDebugMonData->gmaxFactor = gTasks[taskId].tInput;
        gTasks[taskId].tInput = 0;
        gTasks[taskId].tDigit = 0;
        Debug_Display_StatInfo(sDebugText_IVs, gTasks[taskId].tIterator, gTasks[taskId].tInput, gTasks[taskId].tDigit, gTasks[taskId].tSubWindowId);
        gTasks[taskId].func = DebugAction_Give_Pokemon_SelectIVs;
    }
    else if (JOY_NEW(B_BUTTON))
    {
        PlaySE(SE_SELECT);
        Free(sDebugMonData);
        DebugAction_DestroyExtraWindow(taskId);
    }
}

static void DebugAction_Give_Pokemon_SelectIVs(u8 taskId)
{
    if (JOY_NEW(DPAD_ANY))
    {
        PlaySE(SE_SELECT);
        Debug_HandleInput_Numeric(taskId, 0, MAX_PER_STAT_IVS, 3);
        Debug_Display_StatInfo(sDebugText_IVs, gTasks[taskId].tIterator, gTasks[taskId].tInput, gTasks[taskId].tDigit, gTasks[taskId].tSubWindowId);
    }

    //If A or B button
    if (JOY_NEW(A_BUTTON))
    {
        // Set IVs for stat
        sDebugMonData->monIVs[gTasks[taskId].tIterator] = gTasks[taskId].tInput;

        //Check if all IVs set
        if (gTasks[taskId].tIterator != NUM_STATS - 1)
        {
            gTasks[taskId].tIterator++;
            gTasks[taskId].tInput = 0;
            gTasks[taskId].tDigit = 0;

            Debug_Display_StatInfo(sDebugText_IVs, gTasks[taskId].tIterator, gTasks[taskId].tInput, gTasks[taskId].tDigit, gTasks[taskId].tSubWindowId);
            gTasks[taskId].func = DebugAction_Give_Pokemon_SelectIVs;
        }
        else
        {
            gTasks[taskId].tInput = 0;
            gTasks[taskId].tDigit = 0;
            gTasks[taskId].tIterator = 0;

            Debug_Display_StatInfo(sDebugText_EVs, gTasks[taskId].tIterator, gTasks[taskId].tInput, gTasks[taskId].tDigit, gTasks[taskId].tSubWindowId);
            gTasks[taskId].func = DebugAction_Give_Pokemon_SelectEVs;
        }
    }
    else if (JOY_NEW(B_BUTTON))
    {
        PlaySE(SE_SELECT);
        Free(sDebugMonData);
        DebugAction_DestroyExtraWindow(taskId);
    }
}

static u32 GetDebugPokemonTotalEV(void)
{
    u32 totalEVs = 0;
    for (u32 i = 0; i < NUM_STATS; i++)
        totalEVs += sDebugMonData->monEVs[i];
    return totalEVs;
}

static void Debug_Display_MoveInfo(u32 moveId, u32 iteration, u32 digit, u8 windowId)
{
    // Doesn't expand placeholdes so a 4th dynamic value can be shown.
    u8 *end = StringCopy(gStringVar1, GetMoveName(moveId));
    WrapFontIdToFit(gStringVar1, end, DEBUG_MENU_FONT, WindowWidthPx(windowId));
    StringCopyPadded(gStringVar1, gStringVar1, CHAR_SPACE, 15);
    StringCopy(gStringVar4, COMPOUND_STRING("Move "));
    ConvertIntToDecimalStringN(gStringVar3, iteration, STR_CONV_MODE_LEADING_ZEROS, 1);
    StringAppend(gStringVar4, gStringVar3);
    StringAppend(gStringVar4, COMPOUND_STRING(": "));
    ConvertIntToDecimalStringN(gStringVar3, moveId, STR_CONV_MODE_LEADING_ZEROS, 3);
    StringAppend(gStringVar4, gStringVar3);
    StringAppend(gStringVar4, COMPOUND_STRING("{CLEAR_TO 90}\n"));
    StringAppend(gStringVar4, gStringVar1);
    StringAppend(gStringVar4, COMPOUND_STRING("{CLEAR_TO 90}\n{CLEAR_TO 90}\n"));
    StringAppend(gStringVar4, gText_DigitIndicator[digit]);
    StringAppend(gStringVar4, COMPOUND_STRING("{CLEAR_TO 90}"));
    AddTextPrinterParameterized(windowId, DEBUG_MENU_FONT, gStringVar4, 0, 0, 0, NULL);
}

static void DebugAction_Give_Pokemon_SelectEVs(u8 taskId)
{
    u16 totalEV = GetDebugPokemonTotalEV();

    if (JOY_NEW(DPAD_ANY))
    {
        PlaySE(SE_SELECT);
        Debug_HandleInput_Numeric(taskId, 0, MAX_PER_STAT_EVS, 4);
        Debug_Display_StatInfo(sDebugText_EVs, gTasks[taskId].tIterator, gTasks[taskId].tInput, gTasks[taskId].tDigit, gTasks[taskId].tSubWindowId);
    }

    //If A or B button
    if (JOY_NEW(A_BUTTON))
    {
        // Set EVs for stat
        sDebugMonData->monEVs[gTasks[taskId].tIterator] = gTasks[taskId].tInput;

        //Check if all EVs set
        if (gTasks[taskId].tIterator != NUM_STATS - 1)
        {
            gTasks[taskId].tIterator++;
            gTasks[taskId].tInput = 0;
            gTasks[taskId].tDigit = 0;
            Debug_Display_StatInfo(sDebugText_EVs, gTasks[taskId].tIterator, gTasks[taskId].tInput, gTasks[taskId].tDigit, gTasks[taskId].tSubWindowId);
            gTasks[taskId].func = DebugAction_Give_Pokemon_SelectEVs;
        }
        else
        {
            gTasks[taskId].tInput = 0;
            gTasks[taskId].tDigit = 0;
            gTasks[taskId].tIterator = 0;

            if (totalEV > MAX_TOTAL_EVS)
            {
                for (u32 i = 0; i < NUM_STATS; i++)
                {
                    sDebugMonData->monEVs[i] = 0;
                }

                PlaySE(SE_FAILURE);
                Debug_Display_StatInfo(sDebugText_EVs, gTasks[taskId].tIterator, gTasks[taskId].tInput, gTasks[taskId].tDigit, gTasks[taskId].tSubWindowId);
                gTasks[taskId].func = DebugAction_Give_Pokemon_SelectEVs;
            }
            else
            {
                Debug_Display_MoveInfo(gTasks[taskId].tInput, gTasks[taskId].tIterator, gTasks[taskId].tDigit, gTasks[taskId].tSubWindowId);
                gTasks[taskId].func = DebugAction_Give_Pokemon_Move;
            }
        }
    }
    else if (JOY_NEW(B_BUTTON))
    {
        PlaySE(SE_SELECT);
        Free(sDebugMonData);
        DebugAction_DestroyExtraWindow(taskId);
    }
}

static void DebugAction_Give_Pokemon_Move(u8 taskId)
{
    if (JOY_NEW(DPAD_ANY))
    {
        PlaySE(SE_SELECT);
        Debug_HandleInput_Numeric(taskId, 0, MOVES_COUNT - 1, 4);

        Debug_Display_MoveInfo(gTasks[taskId].tInput, gTasks[taskId].tIterator, gTasks[taskId].tDigit, gTasks[taskId].tSubWindowId);
    }

    if (JOY_NEW(A_BUTTON))
    {
        // Set current value
        sDebugMonData->monMoves[gTasks[taskId].tIterator] = gTasks[taskId].tInput;

        // If MOVE_NONE selected, stop asking for additional moves
        if (gTasks[taskId].tInput == MOVE_NONE)
            gTasks[taskId].tIterator = MAX_MON_MOVES;

        //If NOT last move or selected MOVE_NONE ask for next move, else make mon
        if (gTasks[taskId].tIterator < MAX_MON_MOVES - 1)
        {
            gTasks[taskId].tIterator++;
            gTasks[taskId].tInput = 0;
            gTasks[taskId].tDigit = 0;

            Debug_Display_MoveInfo(gTasks[taskId].tInput, gTasks[taskId].tIterator, gTasks[taskId].tDigit, gTasks[taskId].tSubWindowId);
            gTasks[taskId].func = DebugAction_Give_Pokemon_Move;
        }
        else
        {
            gTasks[taskId].tInput = 0;
            gTasks[taskId].tDigit = 0;

            PlaySE(MUS_LEVEL_UP);
            gTasks[taskId].func = DebugAction_Give_Pokemon_ComplexCreateMon;
        }
    }
    else if (JOY_NEW(B_BUTTON))
    {
        PlaySE(SE_SELECT);
        Free(sDebugMonData);
        DebugAction_DestroyExtraWindow(taskId);
    }
}

static void DebugAction_Give_Pokemon_ComplexCreateMon(u8 taskId) //https://github.com/ghoulslash/pokeemerald/tree/custom-givemon
{
    u16 nationalDexNum;
    int sentToPc;
    struct Pokemon mon;
    u8 i;
    u16 moves[MAX_MON_MOVES];
    u8 IVs[NUM_STATS];
    u8 iv_val;
    u8 EVs[NUM_STATS];
    u8 ev_val;
    u16 species     = sDebugMonData->species;
    u8 level        = sDebugMonData->level;
    bool8 isShiny   = sDebugMonData->isShiny;
    u8 nature       = sDebugMonData->nature;
    u8 abilityNum   = sDebugMonData->abilityNum;
    u32 teraType    = sDebugMonData->teraType;
    u32 dmaxLevel   = sDebugMonData->dynamaxLevel;
    u32 gmaxFactor  = sDebugMonData->gmaxFactor;
    for (u32 i = 0; i < MAX_MON_MOVES; i++)
    {
        moves[i] = sDebugMonData->monMoves[i];
    }
    for (u32 i = 0; i < NUM_STATS; i++)
    {
        EVs[i] = sDebugMonData->monEVs[i];
        IVs[i] = sDebugMonData->monIVs[i];
    }

    //Nature
    if (nature == NUM_NATURES || nature == 0xFF)
        nature = Random() % NUM_NATURES;
    CreateMonWithNature(&mon, species, level, USE_RANDOM_IVS, nature);

    //Shininess
    SetMonData(&mon, MON_DATA_IS_SHINY, &isShiny);

    // Gigantamax factor
    SetMonData(&mon, MON_DATA_GIGANTAMAX_FACTOR, &gmaxFactor);

    // Dynamax Level
    SetMonData(&mon, MON_DATA_DYNAMAX_LEVEL, &dmaxLevel);

    // tera type
    if (teraType == TYPE_NONE || teraType == TYPE_MYSTERY || teraType >= NUMBER_OF_MON_TYPES)
        teraType = GetTeraTypeFromPersonality(&mon);
    SetMonData(&mon, MON_DATA_TERA_TYPE, &teraType);

    //IVs
    for (i = 0; i < NUM_STATS; i++)
    {
        iv_val = IVs[i];
        if (iv_val != USE_RANDOM_IVS && iv_val != 0xFF)
            SetMonData(&mon, MON_DATA_HP_IV + i, &iv_val);
    }

    //EVs
    for (i = 0; i < NUM_STATS; i++)
    {
        ev_val = EVs[i];
        if (ev_val)
            SetMonData(&mon, MON_DATA_HP_EV + i, &ev_val);
    }

    //Moves
    for (i = 0; i < MAX_MON_MOVES; i++)
    {
        if (moves[i] == MOVE_NONE || moves[i] >= MOVES_COUNT)
            continue;

        SetMonMoveSlot(&mon, moves[i], i);
    }

    //Ability
    if (abilityNum == 0xFF || GetAbilityBySpecies(species, abilityNum) == ABILITY_NONE)
    {
        do {
            abilityNum = Random() % NUM_ABILITY_SLOTS;  // includes hidden abilities
        } while (GetAbilityBySpecies(species, abilityNum) == ABILITY_NONE);
    }

    SetMonData(&mon, MON_DATA_ABILITY_NUM, &abilityNum);

    //Update mon stats before giving it to the player
    CalculateMonStats(&mon);

    // give player the mon
    SetMonData(&mon, MON_DATA_OT_NAME, gSaveBlock2Ptr->playerName);
    SetMonData(&mon, MON_DATA_OT_GENDER, &gSaveBlock2Ptr->playerGender);
    for (i = 0; i < PARTY_SIZE; i++)
    {
        if (GetMonData(&gPlayerParty[i], MON_DATA_SPECIES, NULL) == SPECIES_NONE)
            break;
    }

    if (i >= PARTY_SIZE)
    {
        sentToPc = CopyMonToPC(&mon);
    }
    else
    {
        sentToPc = MON_GIVEN_TO_PARTY;
        CopyMon(&gPlayerParty[i], &mon, sizeof(mon));
        gPlayerPartyCount = i + 1;
    }

    //Pokedex entry
    nationalDexNum = SpeciesToNationalPokedexNum(species);
    switch(sentToPc)
    {
    case MON_GIVEN_TO_PARTY:
    case MON_GIVEN_TO_PC:
        GetSetPokedexFlag(nationalDexNum, FLAG_SET_SEEN);
        GetSetPokedexFlag(nationalDexNum, FLAG_SET_CAUGHT);
        break;
    case MON_CANT_GIVE:
        break;
    }

    // Set flag for user convenience
    FlagSet(FLAG_SYS_POKEMON_GET);

    Free(sDebugMonData);
    DebugAction_DestroyExtraWindow(taskId); //return sentToPc;
}

#undef tIsComplex
#undef tSpriteId
#undef tIterator

static void DebugAction_Give_MaxMoney(u8 taskId)
{
    SetMoney(&gSaveBlock1Ptr->money, MAX_MONEY);
}

static void DebugAction_Give_MaxCoins(u8 taskId)
{
    SetCoins(MAX_COINS);
}

static void DebugAction_Give_MaxBattlePoints(u8 taskId)
{
    // gSaveBlock2Ptr->frontier.battlePoints = MAX_BATTLE_FRONTIER_POINTS;
}

static void DebugAction_Give_DayCareEgg(u8 taskId)
{
    s32 emptySlot = Daycare_FindEmptySpot(&gSaveBlock1Ptr->daycare);
    if (emptySlot == 0) // no daycare mons
        Debug_DestroyMenu_Full_Script(taskId, DebugScript_ZeroDaycareMons);
    else if (emptySlot == 1) // 1 daycare mon
        Debug_DestroyMenu_Full_Script(taskId, DebugScript_OneDaycareMons);
    else if (GetDaycareCompatibilityScore(&gSaveBlock1Ptr->daycare) == PARENTS_INCOMPATIBLE) // not compatible parents
        Debug_DestroyMenu_Full_Script(taskId, DebugScript_DaycareMonsNotCompatible);
    else // 2 pokemon which can have a pokemon baby together
        TriggerPendingDaycareEgg();
}

// *******************************
// Actions TimeMenu

static void DebugAction_TimeMenu_ChangeTimeOfDay(u8 taskId)
{
    u32 input = ListMenu_ProcessInput(gTasks[taskId].tMenuTaskId);

    DebugAction_DestroyExtraWindow(taskId);
    switch (input)
    {
        case DEBUG_TIME_MENU_ITEM_MORNING:
            FakeRtc_ForwardTimeTo(MORNING_HOUR_BEGIN, 0, 0);
            break;
        case DEBUG_TIME_MENU_ITEM_DAY:
            FakeRtc_ForwardTimeTo(DAY_HOUR_BEGIN, 0, 0);
            break;
        case DEBUG_TIME_MENU_ITEM_EVENING:
            FakeRtc_ForwardTimeTo(EVENING_HOUR_BEGIN, 0, 0);
            break;
        case DEBUG_TIME_MENU_ITEM_NIGHT:
            FakeRtc_ForwardTimeTo(NIGHT_HOUR_BEGIN, 0, 0);
            break;
    }
    Debug_DestroyMenu_Full(taskId);
    SetMainCallback2(CB2_LoadMap);
}

static void DebugAction_TimeMenu_ChangeWeekdays(u8 taskId)
{
    u32 input = ListMenu_ProcessInput(gTasks[taskId].tMenuTaskId);
    struct SiiRtcInfo *rtc = FakeRtc_GetCurrentTime();
    u32 daysToAdd = 0;

    DebugAction_DestroyExtraWindow(taskId);
    switch(input)
    {
        case DEBUG_TIME_MENU_ITEM_SUNDAY:
            daysToAdd = ((WEEKDAY_SUN - rtc->dayOfWeek) + WEEKDAY_COUNT) % WEEKDAY_COUNT;
            FakeRtc_AdvanceTimeBy(daysToAdd, 0, 0, 0);
            break;
        case DEBUG_TIME_MENU_ITEM_MONDAY:
            daysToAdd = ((WEEKDAY_MON - rtc->dayOfWeek) + WEEKDAY_COUNT) % WEEKDAY_COUNT;
            FakeRtc_AdvanceTimeBy(daysToAdd, 0, 0, 0);
            break;
        case DEBUG_TIME_MENU_ITEM_TUESDAY:
            daysToAdd = ((WEEKDAY_TUE - rtc->dayOfWeek) + WEEKDAY_COUNT) % WEEKDAY_COUNT;
            FakeRtc_AdvanceTimeBy(daysToAdd, 0, 0, 0);
            break;
        case DEBUG_TIME_MENU_ITEM_WEDNESDAY:
            daysToAdd = ((WEEKDAY_WED - rtc->dayOfWeek) + WEEKDAY_COUNT) % WEEKDAY_COUNT;
            FakeRtc_AdvanceTimeBy(daysToAdd, 0, 0, 0);
            break;
        case DEBUG_TIME_MENU_ITEM_THURSDAY:
            daysToAdd = ((WEEKDAY_THU - rtc->dayOfWeek) + WEEKDAY_COUNT) % WEEKDAY_COUNT;
            FakeRtc_AdvanceTimeBy(daysToAdd, 0, 0, 0);
            break;
        case DEBUG_TIME_MENU_ITEM_FRIDAY:
            daysToAdd = ((WEEKDAY_FRI - rtc->dayOfWeek) + WEEKDAY_COUNT) % WEEKDAY_COUNT;
            FakeRtc_AdvanceTimeBy(daysToAdd, 0, 0, 0);
            break;
        case DEBUG_TIME_MENU_ITEM_SATURDAY:
            daysToAdd = ((WEEKDAY_SAT - rtc->dayOfWeek) + WEEKDAY_COUNT) % WEEKDAY_COUNT;
            FakeRtc_AdvanceTimeBy(daysToAdd, 0, 0, 0);
            break;
        }
    Debug_DestroyMenu_Full(taskId);
    SetMainCallback2(CB2_LoadMap);
}

// *******************************
// Actions PCBag

static void DebugAction_OpenPCBagFillMenu(u8 taskId)
{
    Debug_DestroyMenu(taskId);
    Debug_ShowMenu(DebugTask_HandleMenuInput_PCBag_Fill, sDebugMenu_ListTemplate_PCBag_Fill);
}

static void DebugAction_PCBag_Fill_PCBoxes_Fast(u8 taskId) //Credit: Sierraffinity
{
    int boxId, boxPosition;
    u32 personality;
    struct BoxPokemon boxMon;
    u16 species = SPECIES_BULBASAUR;
    u8 speciesName[POKEMON_NAME_LENGTH + 1];

    personality = Random32();

    CreateBoxMon(&boxMon, species, 100, USE_RANDOM_IVS, FALSE, personality, OT_ID_PLAYER_ID, 0);

    for (boxId = 0; boxId < TOTAL_BOXES_COUNT; boxId++)
    {
        for (boxPosition = 0; boxPosition < IN_BOX_COUNT; boxPosition++, species++)
        {
            if (!GetBoxMonData(&gPokemonStoragePtr->boxes[boxId][boxPosition], MON_DATA_SANITY_HAS_SPECIES))
            {
                StringCopy(speciesName, GetSpeciesName(species));
                SetBoxMonData(&boxMon, MON_DATA_NICKNAME, &speciesName);
                SetBoxMonData(&boxMon, MON_DATA_SPECIES, &species);
                GiveBoxMonInitialMoveset(&boxMon);
                gPokemonStoragePtr->boxes[boxId][boxPosition] = boxMon;
            }
        }
    }

    // Set flag for user convenience
    FlagSet(FLAG_SYS_POKEMON_GET);
    Debug_DestroyMenu_Full(taskId);
    ScriptContext_Enable();
}

static void DebugAction_PCBag_Fill_PCBoxes_Slow(u8 taskId)
{
    int boxId, boxPosition;
    struct BoxPokemon boxMon;
    u32 species = SPECIES_BULBASAUR;
    bool8 spaceAvailable = FALSE;

    for (boxId = 0; boxId < TOTAL_BOXES_COUNT; boxId++)
    {
        for (boxPosition = 0; boxPosition < IN_BOX_COUNT; boxPosition++)
        {
            if (!GetBoxMonData(&gPokemonStoragePtr->boxes[boxId][boxPosition], MON_DATA_SANITY_HAS_SPECIES))
            {
                if (!spaceAvailable)
                    PlayBGM(MUS_MYSTERY_GIFT);
                CreateBoxMon(&boxMon, species, 100, USE_RANDOM_IVS, FALSE, 0, OT_ID_PLAYER_ID, 0);
                gPokemonStoragePtr->boxes[boxId][boxPosition] = boxMon;
                species = (species < NUM_SPECIES - 1) ? species + 1 : 1;
                spaceAvailable = TRUE;
            }
        }
    }

    // Set flag for user convenience
    FlagSet(FLAG_SYS_POKEMON_GET);
    if (spaceAvailable)
        PlayBGM(GetCurrentMapMusic());

    Debug_DestroyMenu_Full_Script(taskId, Debug_BoxFilledMessage);
}

static void DebugAction_PCBag_Fill_PCItemStorage(u8 taskId)
{
    u16 itemId;

    for (itemId = 1; itemId < ITEMS_COUNT; itemId++)
    {
        if (!CheckPCHasItem(itemId, MAX_PC_ITEM_CAPACITY))
            AddPCItem(itemId, MAX_PC_ITEM_CAPACITY);
    }
}

static void DebugAction_PCBag_Fill_PocketItems(u8 taskId)
{
    u16 itemId;

    for (itemId = 1; itemId < ITEMS_COUNT; itemId++)
    {
        if (GetItemPocket(itemId) == POCKET_ITEMS && CheckBagHasSpace(itemId, MAX_BAG_ITEM_CAPACITY))
            AddBagItem(itemId, MAX_BAG_ITEM_CAPACITY);
    }
}

static void DebugAction_PCBag_Fill_PocketPokeBalls(u8 taskId)
{
    u16 ballId;

    for (ballId = BALL_STRANGE; ballId < POKEBALL_COUNT; ballId++)
    {
        if (CheckBagHasSpace(ballId, MAX_BAG_ITEM_CAPACITY))
            AddBagItem(ballId, MAX_BAG_ITEM_CAPACITY);
    }
}

static void DebugAction_PCBag_Fill_PocketTMHM(u8 taskId)
{
    u16 itemId;

    for (itemId = ITEM_TM01; itemId <= ITEM_HM08; itemId++)
    {
        if (CheckBagHasSpace(itemId, 1) && ItemIdToBattleMoveId(itemId) != MOVE_NONE)
            AddBagItem(itemId, 1);
    }
}

static void DebugAction_PCBag_Fill_PocketBerries(u8 taskId)
{
    u16 itemId;

    for (itemId = FIRST_BERRY_INDEX; itemId < LAST_BERRY_INDEX; itemId++)
    {
        if (CheckBagHasSpace(itemId, MAX_BAG_ITEM_CAPACITY))
            AddBagItem(itemId, MAX_BAG_ITEM_CAPACITY);
    }
}

static void DebugAction_PCBag_Fill_PocketKeyItems(u8 taskId)
{
    u16 itemId;

    for (itemId = 1; itemId < ITEMS_COUNT; itemId++)
    {
        if (GetItemPocket(itemId) == POCKET_KEY_ITEMS && CheckBagHasSpace(itemId, 1))
            AddBagItem(itemId, 1);
    }
}

static void DebugAction_PCBag_AccessPC(u8 taskId)
{
    Debug_DestroyMenu_Full_Script(taskId, EventScript_PC);
}

static void DebugAction_PCBag_ClearBag(u8 taskId)
{
    PlaySE(MUS_LEVEL_UP);
    ClearBag();
}

static void DebugAction_PCBag_ClearBoxes(u8 taskId)
{
    ResetPokemonStorageSystem();
    Debug_DestroyMenu_Full(taskId);
    ScriptContext_Enable();
}

// *******************************
// Actions Sound
static const u8 *const sBGMNames[];
static const u8 *const sSENames[];

#define tCurrentSong  data[5]

static void DebugAction_Sound_SE(u8 taskId)
{
    u8 windowId;

    ClearStdWindowAndFrame(gTasks[taskId].tWindowId, TRUE);
    RemoveWindow(gTasks[taskId].tWindowId);

    HideMapNamePopUpWindow();
    LoadMessageBoxAndBorderGfx();
    windowId = AddWindow(&sDebugMenuWindowTemplateSound);
    DrawStdWindowFrame(windowId, FALSE);

    CopyWindowToVram(windowId, COPYWIN_FULL);

    // Display initial sound effect
    StringCopy(gStringVar2, gText_DigitIndicator[0]);
    ConvertIntToDecimalStringN(gStringVar3, 1, STR_CONV_MODE_LEADING_ZEROS, DEBUG_NUMBER_DIGITS_ITEMS);
    StringCopyPadded(gStringVar1, sSENames[0], CHAR_SPACE, 35);
    StringExpandPlaceholders(gStringVar4, sDebugText_Sound_SFX_ID);
    AddTextPrinterParameterized(windowId, DEBUG_MENU_FONT, gStringVar4, 0, 0, 0, NULL);

    StopMapMusic(); //Stop map music to better hear sounds

    gTasks[taskId].func = DebugAction_Sound_SE_SelectId;
    gTasks[taskId].tSubWindowId = windowId;
    gTasks[taskId].tInput = 1;
    gTasks[taskId].tDigit = 0;
    gTasks[taskId].tCurrentSong = gTasks[taskId].tInput;
}

static void DebugAction_Sound_SE_SelectId(u8 taskId)
{
    if (JOY_NEW(DPAD_ANY))
    {
        Debug_HandleInput_Numeric(taskId, 1, END_SE, DEBUG_NUMBER_DIGITS_ITEMS);

        StringCopy(gStringVar2, gText_DigitIndicator[gTasks[taskId].tDigit]);
        StringCopyPadded(gStringVar1, sSENames[gTasks[taskId].tInput - 1], CHAR_SPACE, 35);
        ConvertIntToDecimalStringN(gStringVar3, gTasks[taskId].tInput, STR_CONV_MODE_LEADING_ZEROS, DEBUG_NUMBER_DIGITS_ITEMS);
        StringExpandPlaceholders(gStringVar4, sDebugText_Sound_SFX_ID);
        AddTextPrinterParameterized(gTasks[taskId].tSubWindowId, DEBUG_MENU_FONT, gStringVar4, 0, 0, 0, NULL);
    }

    if (JOY_NEW(A_BUTTON))
    {
        m4aSongNumStop(gTasks[taskId].tCurrentSong);
        gTasks[taskId].tCurrentSong = gTasks[taskId].tInput;
        m4aSongNumStart(gTasks[taskId].tInput);
    }
    else if (JOY_NEW(B_BUTTON))
    {
        PlaySE(SE_SELECT);
        m4aSongNumStop(gTasks[taskId].tCurrentSong);
        DebugAction_DestroyExtraWindow(taskId);
    }
    else if (JOY_NEW(START_BUTTON))
    {
        m4aSongNumStop(gTasks[taskId].tCurrentSong);
    }
}

static void DebugAction_Sound_MUS(u8 taskId)
{
    u8 windowId;

    ClearStdWindowAndFrame(gTasks[taskId].tWindowId, TRUE);
    RemoveWindow(gTasks[taskId].tWindowId);

    HideMapNamePopUpWindow();
    LoadMessageBoxAndBorderGfx();
    windowId = AddWindow(&sDebugMenuWindowTemplateSound);
    DrawStdWindowFrame(windowId, FALSE);

    CopyWindowToVram(windowId, COPYWIN_FULL);

    // Display initial song
    StringCopy(gStringVar2, gText_DigitIndicator[0]);
    ConvertIntToDecimalStringN(gStringVar3, START_MUS, STR_CONV_MODE_LEADING_ZEROS, DEBUG_NUMBER_DIGITS_ITEMS);
    StringCopyPadded(gStringVar1, sBGMNames[0], CHAR_SPACE, 35);
    StringExpandPlaceholders(gStringVar4, sDebugText_Sound_Music_ID);
    AddTextPrinterParameterized(windowId, DEBUG_MENU_FONT, gStringVar4, 0, 0, 0, NULL);

    StopMapMusic(); //Stop map music to better hear new music

    gTasks[taskId].func = DebugAction_Sound_MUS_SelectId;
    gTasks[taskId].tSubWindowId = windowId;
    gTasks[taskId].tInput = START_MUS;
    gTasks[taskId].tDigit = 0;
    gTasks[taskId].tCurrentSong = gTasks[taskId].tInput;
}

static void DebugAction_Sound_MUS_SelectId(u8 taskId)
{
    if (JOY_NEW(DPAD_ANY))
    {
        Debug_HandleInput_Numeric(taskId, START_MUS, END_MUS, DEBUG_NUMBER_DIGITS_ITEMS);

        StringCopy(gStringVar2, gText_DigitIndicator[gTasks[taskId].tDigit]);
        StringCopyPadded(gStringVar1, sBGMNames[gTasks[taskId].tInput - START_MUS], CHAR_SPACE, 35);
        ConvertIntToDecimalStringN(gStringVar3, gTasks[taskId].tInput, STR_CONV_MODE_LEADING_ZEROS, DEBUG_NUMBER_DIGITS_ITEMS);
        StringExpandPlaceholders(gStringVar4, sDebugText_Sound_Music_ID);
        AddTextPrinterParameterized(gTasks[taskId].tSubWindowId, DEBUG_MENU_FONT, gStringVar4, 0, 0, 0, NULL);
    }

    if (JOY_NEW(A_BUTTON))
    {
        m4aSongNumStop(gTasks[taskId].tCurrentSong);
        gTasks[taskId].tCurrentSong = gTasks[taskId].tInput;
        m4aSongNumStart(gTasks[taskId].tInput);
    }
    else if (JOY_NEW(B_BUTTON))
    {
        PlaySE(SE_SELECT);
        // m4aSongNumStop(gTasks[taskId].tCurrentSong);   //Uncomment if music should stop after leaving menu
        DebugAction_DestroyExtraWindow(taskId);
    }
    else if (JOY_NEW(START_BUTTON))
    {
        m4aSongNumStop(gTasks[taskId].tCurrentSong);
    }
}

#undef tCurrentSong

#undef tMenuTaskId
#undef tWindowId
#undef tSubWindowId
#undef tInput
#undef tDigit

#define SOUND_LIST_BGM          \
    X(MUS_HEAL)                 \
    X(MUS_LEVEL_UP)             \
    X(MUS_OBTAIN_ITEM)          \
    X(MUS_EVOLVED)              \
    X(MUS_OBTAIN_BADGE)         \
    X(MUS_OBTAIN_TMHM)          \
    X(MUS_OBTAIN_BERRY)         \
    X(MUS_EVOLUTION_INTRO)      \
    X(MUS_EVOLUTION)            \
    X(MUS_RS_VS_GYM_LEADER)     \
    X(MUS_RS_VS_TRAINER)        \
    X(MUS_SCHOOL)               \
    X(MUS_SLOTS_JACKPOT)        \
    X(MUS_SLOTS_WIN)            \
    X(MUS_MOVE_DELETED)         \
    X(MUS_TOO_BAD)              \
    X(MUS_FOLLOW_ME)            \
    X(MUS_GAME_CORNER)          \
    X(MUS_ROCKET_HIDEOUT)       \
    X(MUS_GYM)                  \
    X(MUS_JIGGLYPUFF)           \
    X(MUS_INTRO_FIGHT)          \
    X(MUS_TITLE)                \
    X(MUS_CINNABAR)             \
    X(MUS_LAVENDER)             \
    X(MUS_HEAL_UNUSED)          \
    X(MUS_CYCLING)              \
    X(MUS_ENCOUNTER_ROCKET)     \
    X(MUS_ENCOUNTER_GIRL)       \
    X(MUS_ENCOUNTER_BOY)        \
    X(MUS_HALL_OF_FAME)         \
    X(MUS_VIRIDIAN_FOREST)      \
    X(MUS_MT_MOON)              \
    X(MUS_POKE_MANSION)         \
    X(MUS_CREDITS)              \
    X(MUS_ROUTE1)               \
    X(MUS_ROUTE24)              \
    X(MUS_ROUTE3)               \
    X(MUS_ROUTE11)              \
    X(MUS_VICTORY_ROAD)         \
    X(MUS_VS_GYM_LEADER)        \
    X(MUS_VS_TRAINER)           \
    X(MUS_VS_WILD)              \
    X(MUS_VS_CHAMPION)          \
    X(MUS_PALLET)               \
    X(MUS_OAK_LAB)              \
    X(MUS_OAK)                  \
    X(MUS_POKE_CENTER)          \
    X(MUS_SS_ANNE)              \
    X(MUS_SURF)                 \
    X(MUS_POKE_TOWER)           \
    X(MUS_SILPH)                \
    X(MUS_FUCHSIA)              \
    X(MUS_CELADON)              \
    X(MUS_VICTORY_TRAINER)      \
    X(MUS_VICTORY_WILD)         \
    X(MUS_VICTORY_GYM_LEADER)   \
    X(MUS_VERMILLION)           \
    X(MUS_PEWTER)               \
    X(MUS_ENCOUNTER_RIVAL)      \
    X(MUS_RIVAL_EXIT)           \
    X(MUS_DEX_RATING)           \
    X(MUS_OBTAIN_KEY_ITEM)      \
    X(MUS_CAUGHT_INTRO)         \
    X(MUS_PHOTO)                \
    X(MUS_GAME_FREAK)           \
    X(MUS_CAUGHT)               \
    X(MUS_NEW_GAME_INSTRUCT)    \
    X(MUS_NEW_GAME_INTRO)       \
    X(MUS_NEW_GAME_EXIT)        \
    X(MUS_POKE_JUMP)            \
    X(MUS_UNION_ROOM)           \
    X(MUS_NET_CENTER)           \
    X(MUS_MYSTERY_GIFT)         \
    X(MUS_BERRY_PICK)           \
    X(MUS_SEVII_CAVE)           \
    X(MUS_TEACHY_TV_SHOW)       \
    X(MUS_SEVII_ROUTE)          \
    X(MUS_SEVII_DUNGEON)        \
    X(MUS_SEVII_123)            \
    X(MUS_SEVII_45)             \
    X(MUS_SEVII_67)             \
    X(MUS_POKE_FLUTE)           \
    X(MUS_VS_DEOXYS)            \
    X(MUS_VS_MEWTWO)            \
    X(MUS_VS_LEGEND)            \
    X(MUS_ENCOUNTER_GYM_LEADER) \
    X(MUS_ENCOUNTER_DEOXYS)     \
    X(MUS_TRAINER_TOWER)        \
    X(MUS_SLOW_PALLET)          \
    X(MUS_TEACHY_TV_MENU)

#define SOUND_LIST_SE            \
    X(SE_USE_ITEM)               \
    X(SE_PC_LOGIN)               \
    X(SE_PC_OFF)                 \
    X(SE_PC_ON)                  \
    X(SE_SELECT)                 \
    X(SE_WIN_OPEN)               \
    X(SE_WALL_HIT)               \
    X(SE_RS_DOOR)                \
    X(SE_EXIT)                   \
    X(SE_LEDGE)                  \
    X(SE_BIKE_BELL)              \
    X(SE_NOT_EFFECTIVE)          \
    X(SE_EFFECTIVE)              \
    X(SE_SUPER_EFFECTIVE)        \
    X(SE_BALL_OPEN)              \
    X(SE_FAINT)                  \
    X(SE_FLEE)                   \
    X(SE_SLIDING_DOOR)           \
    X(SE_SHIP)                   \
    X(SE_BANG)                   \
    X(SE_PIN)                    \
    X(SE_BOO)                    \
    X(SE_BALL)                   \
    X(SE_CONTEST_PLACE)          \
    X(SE_SUCCESS)                \
    X(SE_FAILURE)                \
    X(SE_EXP)                    \
    X(SE_BIKE_HOP)               \
    X(SE_SWITCH)                 \
    X(SE_CLICK)                  \
    X(SE_FU_ZAKU)                \
    X(SE_CONTEST_CONDITION_LOSE) \
    X(SE_LAVARIDGE_FALL_WARP)    \
    X(SE_ICE_STAIRS)             \
    X(SE_ICE_BREAK)              \
    X(SE_ICE_CRACK)              \
    X(SE_FALL)                   \
    X(SE_UNLOCK)                 \
    X(SE_WARP_IN)                \
    X(SE_WARP_OUT)               \
    X(SE_REPEL)                  \
    X(SE_ROTATING_GATE)          \
    X(SE_TRUCK_MOVE)             \
    X(SE_TRUCK_STOP)             \
    X(SE_TRUCK_UNLOAD)           \
    X(SE_TRUCK_DOOR)             \
    X(SE_BERRY_BLENDER)          \
    X(SE_SAVE)                   \
    X(SE_BALL_BOUNCE_1)          \
    X(SE_BALL_BOUNCE_2)          \
    X(SE_BALL_BOUNCE_3)          \
    X(SE_BALL_BOUNCE_4)          \
    X(SE_BALL_TRADE)             \
    X(SE_BALL_THROW)             \
    X(SE_NOTE_C)                 \
    X(SE_NOTE_D)                 \
    X(SE_NOTE_E)                 \
    X(SE_NOTE_F)                 \
    X(SE_NOTE_G)                 \
    X(SE_NOTE_A)                 \
    X(SE_NOTE_B)                 \
    X(SE_NOTE_C_HIGH)            \
    X(SE_PUDDLE)                 \
    X(SE_BRIDGE_WALK)            \
    X(SE_ITEMFINDER)             \
    X(SE_DING_DONG)              \
    X(SE_BALLOON_RED)            \
    X(SE_BALLOON_BLUE)           \
    X(SE_BALLOON_YELLOW)         \
    X(SE_BREAKABLE_DOOR)         \
    X(SE_MUD_BALL)               \
    X(SE_FIELD_POISON)           \
    X(SE_ESCALATOR)              \
    X(SE_THUNDERSTORM)           \
    X(SE_THUNDERSTORM_STOP)      \
    X(SE_DOWNPOUR)               \
    X(SE_DOWNPOUR_STOP)          \
    X(SE_RAIN)                   \
    X(SE_RAIN_STOP)              \
    X(SE_THUNDER)                \
    X(SE_THUNDER2)               \
    X(SE_ELEVATOR)               \
    X(SE_LOW_HEALTH)             \
    X(SE_EXP_MAX)                \
    X(SE_ROULETTE_BALL)          \
    X(SE_ROULETTE_BALL2)         \
    X(SE_TAILLOW_WING_FLAP)      \
    X(SE_RS_SHOP)                \
    X(SE_CONTEST_HEART)          \
    X(SE_CONTEST_CURTAIN_RISE)   \
    X(SE_CONTEST_CURTAIN_FALL)   \
    X(SE_CONTEST_ICON_CHANGE)    \
    X(SE_CONTEST_ICON_CLEAR)     \
    X(SE_CONTEST_MONS_TURN)      \
    X(SE_SHINY)                  \
    X(SE_INTRO_BLAST)            \
    X(SE_MUGSHOT)                \
    X(SE_APPLAUSE)               \
    X(SE_VEND)                   \
    X(SE_ORB)                    \
    X(SE_DEX_SCROLL)             \
    X(SE_DEX_PAGE)               \
    X(SE_POKENAV_ON)             \
    X(SE_POKENAV_OFF)            \
    X(SE_DEX_SEARCH)             \
    X(SE_EGG_HATCH)              \
    X(SE_BALL_TRAY_ENTER)        \
    X(SE_BALL_TRAY_BALL)         \
    X(SE_BALL_TRAY_EXIT)         \
    X(SE_GLASS_FLUTE)            \
    X(SE_M_THUNDERBOLT)          \
    X(SE_M_THUNDERBOLT2)         \
    X(SE_M_HARDEN)               \
    X(SE_M_NIGHTMARE)            \
    X(SE_M_VITAL_THROW)          \
    X(SE_M_VITAL_THROW2)         \
    X(SE_M_BUBBLE)               \
    X(SE_M_BUBBLE2)              \
    X(SE_M_BUBBLE3)              \
    X(SE_M_RAIN_DANCE)           \
    X(SE_M_CUT)                  \
    X(SE_M_STRING_SHOT)          \
    X(SE_M_STRING_SHOT2)         \
    X(SE_M_ROCK_THROW)           \
    X(SE_M_GUST)                 \
    X(SE_M_GUST2)                \
    X(SE_M_DOUBLE_SLAP)          \
    X(SE_M_DOUBLE_TEAM)          \
    X(SE_M_RAZOR_WIND)           \
    X(SE_M_ICY_WIND)             \
    X(SE_M_THUNDER_WAVE)         \
    X(SE_M_COMET_PUNCH)          \
    X(SE_M_MEGA_KICK)            \
    X(SE_M_MEGA_KICK2)           \
    X(SE_M_CRABHAMMER)           \
    X(SE_M_JUMP_KICK)            \
    X(SE_M_FLAME_WHEEL)          \
    X(SE_M_FLAME_WHEEL2)         \
    X(SE_M_FLAMETHROWER)         \
    X(SE_M_FIRE_PUNCH)           \
    X(SE_M_TOXIC)                \
    X(SE_M_SACRED_FIRE)          \
    X(SE_M_SACRED_FIRE2)         \
    X(SE_M_EMBER)                \
    X(SE_M_TAKE_DOWN)            \
    X(SE_M_BLIZZARD)             \
    X(SE_M_BLIZZARD2)            \
    X(SE_M_SCRATCH)              \
    X(SE_M_VICEGRIP)             \
    X(SE_M_WING_ATTACK)          \
    X(SE_M_FLY)                  \
    X(SE_M_SAND_ATTACK)          \
    X(SE_M_RAZOR_WIND2)          \
    X(SE_M_BITE)                 \
    X(SE_M_HEADBUTT)             \
    X(SE_M_SURF)                 \
    X(SE_M_HYDRO_PUMP)           \
    X(SE_M_WHIRLPOOL)            \
    X(SE_M_HORN_ATTACK)          \
    X(SE_M_TAIL_WHIP)            \
    X(SE_M_MIST)                 \
    X(SE_M_POISON_POWDER)        \
    X(SE_M_BIND)                 \
    X(SE_M_DRAGON_RAGE)          \
    X(SE_M_SING)                 \
    X(SE_M_PERISH_SONG)          \
    X(SE_M_PAY_DAY)              \
    X(SE_M_DIG)                  \
    X(SE_M_DIZZY_PUNCH)          \
    X(SE_M_SELF_DESTRUCT)        \
    X(SE_M_EXPLOSION)            \
    X(SE_M_ABSORB_2)             \
    X(SE_M_ABSORB)               \
    X(SE_M_SCREECH)              \
    X(SE_M_BUBBLE_BEAM)          \
    X(SE_M_BUBBLE_BEAM2)         \
    X(SE_M_SUPERSONIC)           \
    X(SE_M_BELLY_DRUM)           \
    X(SE_M_METRONOME)            \
    X(SE_M_BONEMERANG)           \
    X(SE_M_LICK)                 \
    X(SE_M_PSYBEAM)              \
    X(SE_M_FAINT_ATTACK)         \
    X(SE_M_SWORDS_DANCE)         \
    X(SE_M_LEER)                 \
    X(SE_M_SWAGGER)              \
    X(SE_M_SWAGGER2)             \
    X(SE_M_HEAL_BELL)            \
    X(SE_M_CONFUSE_RAY)          \
    X(SE_M_SNORE)                \
    X(SE_M_BRICK_BREAK)          \
    X(SE_M_GIGA_DRAIN)           \
    X(SE_M_PSYBEAM2)             \
    X(SE_M_SOLAR_BEAM)           \
    X(SE_M_PETAL_DANCE)          \
    X(SE_M_TELEPORT)             \
    X(SE_M_MINIMIZE)             \
    X(SE_M_SKETCH)               \
    X(SE_M_SWIFT)                \
    X(SE_M_REFLECT)              \
    X(SE_M_BARRIER)              \
    X(SE_M_DETECT)               \
    X(SE_M_LOCK_ON)              \
    X(SE_M_MOONLIGHT)            \
    X(SE_M_CHARM)                \
    X(SE_M_CHARGE)               \
    X(SE_M_STRENGTH)             \
    X(SE_M_HYPER_BEAM)           \
    X(SE_M_WATERFALL)            \
    X(SE_M_REVERSAL)             \
    X(SE_M_ACID_ARMOR)           \
    X(SE_M_SANDSTORM)            \
    X(SE_M_TRI_ATTACK)           \
    X(SE_M_TRI_ATTACK2)          \
    X(SE_M_ENCORE)               \
    X(SE_M_ENCORE2)              \
    X(SE_M_BATON_PASS)           \
    X(SE_M_MILK_DRINK)           \
    X(SE_M_ATTRACT)              \
    X(SE_M_ATTRACT2)             \
    X(SE_M_MORNING_SUN)          \
    X(SE_M_FLATTER)              \
    X(SE_M_SAND_TOMB)            \
    X(SE_M_GRASSWHISTLE)         \
    X(SE_M_SPIT_UP)              \
    X(SE_M_DIVE)                 \
    X(SE_M_EARTHQUAKE)           \
    X(SE_M_TWISTER)              \
    X(SE_M_SWEET_SCENT)          \
    X(SE_M_YAWN)                 \
    X(SE_M_SKY_UPPERCUT)         \
    X(SE_M_STAT_INCREASE)        \
    X(SE_M_HEAT_WAVE)            \
    X(SE_M_UPROAR)               \
    X(SE_M_HAIL)                 \
    X(SE_M_COSMIC_POWER)         \
    X(SE_M_TEETER_DANCE)         \
    X(SE_M_STAT_DECREASE)        \
    X(SE_M_HAZE)                 \
    X(SE_M_HYPER_BEAM2)          \
    X(SE_DOOR)                   \
    X(SE_CARD_FLIP)              \
    X(SE_CARD_FLIPPING)          \
    X(SE_CARD_OPEN)              \
    X(SE_BAG_CURSOR)             \
    X(SE_BAG_POCKET)             \
    X(SE_BALL_CLICK)             \
    X(SE_SHOP)                   \
    X(SE_SS_ANNE_HORN)           \
    X(SE_HELP_OPEN)              \
    X(SE_HELP_CLOSE)             \
    X(SE_HELP_ERROR)             \
    X(SE_DEOXYS_MOVE)            \
    X(SE_POKE_JUMP_SUCCESS)      \
    X(SE_POKE_JUMP_FAILURE)

// Create BGM list
#define X(songId) static const u8 sBGMName_##songId[] = _(#songId);
SOUND_LIST_BGM
#undef X

#define X(songId) [songId - START_MUS] = sBGMName_##songId,
static const u8 *const sBGMNames[] =
{
SOUND_LIST_BGM
};
#undef X

// Create SE list
#define X(songId) static const u8 sSEName_##songId[] = _(#songId);
SOUND_LIST_SE
#undef X

#define X(songId) [songId - 1] = sSEName_##songId,
static const u8 *const sSENames[] =
{
SOUND_LIST_SE
};
#undef X

// *******************************
// Actions BerryFunctions

static void DebugAction_BerryFunctions_ClearAll(u8 taskId)
{
    u8 i;

    for (i = 0; i < OBJECT_EVENTS_COUNT; i++)
    {
        if (gObjectEvents[i].movementType == MOVEMENT_TYPE_BERRY_TREE_GROWTH)
        {
            RemoveBerryTree(GetObjectEventBerryTreeId(i));
            SetBerryTreeJustPicked(gObjectEvents[i].localId, gSaveBlock1Ptr->location.mapNum, gSaveBlock1Ptr->location.mapGroup);
        }
    }

    ScriptContext_Enable();
    Debug_DestroyMenu_Full(taskId);
}

static void DebugAction_BerryFunctions_Ready(u8 taskId)
{
    u8 i;
    struct BerryTree *tree;

    for (i = 0; i < OBJECT_EVENTS_COUNT; i++)
    {
        if (gObjectEvents[i].movementType == MOVEMENT_TYPE_BERRY_TREE_GROWTH)
        {
            tree = &gSaveBlock2Ptr->berryTrees[GetObjectEventBerryTreeId(i)];
            if (tree->stage != BERRY_STAGE_NO_BERRY)
            {
                tree->stage = BERRY_STAGE_BERRIES - 1;
                BerryTreeGrow(tree);
            }
        }
    }

    ScriptContext_Enable();
    Debug_DestroyMenu_Full(taskId);
}

static void DebugAction_BerryFunctions_NextStage(u8 taskId)
{
    u8 i;
    struct BerryTree *tree;

    for (i = 0; i < OBJECT_EVENTS_COUNT; i++)
    {
        if (gObjectEvents[i].movementType == MOVEMENT_TYPE_BERRY_TREE_GROWTH)
        {
            tree = &gSaveBlock2Ptr->berryTrees[GetObjectEventBerryTreeId(i)];
            BerryTreeGrow(tree);
        }
    }

    ScriptContext_Enable();
    Debug_DestroyMenu_Full(taskId);
}

static void DebugAction_BerryFunctions_Pests(u8 taskId)
{
    u8 i;

    if (!OW_BERRY_PESTS)
    {
        Debug_DestroyMenu_Full_Script(taskId, Debug_BerryPestsDisabled);
        return;
    }

    for (i = 0; i < OBJECT_EVENTS_COUNT; i++)
    {
        if (gObjectEvents[i].movementType == MOVEMENT_TYPE_BERRY_TREE_GROWTH)
        {
            if (gSaveBlock2Ptr->berryTrees[GetObjectEventBerryTreeId(i)].stage != BERRY_STAGE_PLANTED)
                gSaveBlock2Ptr->berryTrees[GetObjectEventBerryTreeId(i)].pests = TRUE;
        }
    }

    ScriptContext_Enable();
    Debug_DestroyMenu_Full(taskId);
}

static void DebugAction_BerryFunctions_Weeds(u8 taskId)
{
    u8 i;

    if (!OW_BERRY_WEEDS)
    {
        Debug_DestroyMenu_Full_Script(taskId, Debug_BerryWeedsDisabled);
        return;
    }

    for (i = 0; i < OBJECT_EVENTS_COUNT; i++)
    {
        if (gObjectEvents[i].movementType == MOVEMENT_TYPE_BERRY_TREE_GROWTH)
        {
            gSaveBlock2Ptr->berryTrees[GetObjectEventBerryTreeId(i)].weeds = TRUE;
        }
    }

    ScriptContext_Enable();
    Debug_DestroyMenu_Full(taskId);
}

// *******************************
// Actions Party/Boxes

static void DebugAction_Party_MoveReminder(u8 taskId)
{
    Debug_DestroyMenu_Full_Script(taskId, TwoIsland_House_EventScript_ChooseMonToTutor);
}

static void DebugAction_Party_HatchAnEgg(u8 taskId)
{
    Debug_DestroyMenu_Full_Script(taskId, Debug_HatchAnEgg);
}

static void DebugAction_Party_HealParty(u8 taskId)
{
    PlaySE(SE_USE_ITEM);
    HealPlayerParty();
    ScriptContext_Enable();
    Debug_DestroyMenu_Full(taskId);
}

static void DebugAction_Party_InflictStatus1(u8 taskId)
{
    Debug_DestroyMenu_Full_Script(taskId, Debug_EventScript_InflictStatus1);
}

static void DebugAction_Party_CheckEVs(u8 taskId)
{
    Debug_DestroyMenu_Full_Script(taskId, Debug_EventScript_CheckEVs);
}

static void DebugAction_Party_CheckIVs(u8 taskId)
{
    Debug_DestroyMenu_Full_Script(taskId, Debug_EventScript_CheckIVs);
}

static void DebugAction_Party_ClearParty(u8 taskId)
{
    ZeroPlayerPartyMons();
    ScriptContext_Enable();
    Debug_DestroyMenu_Full(taskId);
}

void CheckEWRAMCounters(struct ScriptContext *ctx)
{
    ConvertIntToDecimalStringN(gStringVar1, gFollowerSteps, STR_CONV_MODE_LEFT_ALIGN, 5);
    ConvertIntToDecimalStringN(gStringVar2, gChainFishingDexNavStreak, STR_CONV_MODE_LEFT_ALIGN, 5);
}

static void DebugAction_Util_CheckEWRAMCounters(u8 taskId)
{
    Debug_DestroyMenu_Full_Script(taskId, Debug_EventScript_EWRAMCounters);
}
