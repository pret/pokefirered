#include "global.h"
#include "gflib.h"
#include "battle.h"
#include "data.h"
#include "dynamic_placeholder_text_util.h"
#include "event_data.h"
#include "event_scripts.h"
#include "menu_helpers.h"
#include "item.h"
#include "link.h"
#include "quest_log.h"
#include "party_menu.h"
#include "pokemon_storage_system.h"
#include "region_map.h"
#include "strings.h"
#include "constants/maps.h"
#include "constants/trainers.h"
#include "constants/items.h"
#include "constants/region_map_sections.h"

enum {
    STEP_RECORDING_MODE_ENABLED,
    STEP_RECORDING_MODE_DISABLED,
    STEP_RECORDING_MODE_DISABLED_UNTIL_DEPART,
};

struct DeferredLinkEvent
{
    u16 id;
    u16 ALIGNED(4) data[14];
};

#define CMD_HEADER_SIZE 4
#define MAX_CMD_REPEAT  4

static EWRAM_DATA struct DeferredLinkEvent sDeferredEvent = {0};
EWRAM_DATA struct QuestLogRepeatEventTracker gQuestLogRepeatEventTracker = {0};
static EWRAM_DATA u8 sStepRecordingMode = 0;
static EWRAM_DATA bool8 sNewlyEnteredMap = FALSE;
static EWRAM_DATA u8 sLastDepartedLocation = 0;
static EWRAM_DATA bool8 sPlayedTheSlots = FALSE;

static bool8 InQuestLogDisabledLocation(void);
static bool8 ShouldRegisterEvent_HandlePartyActions(u16, const u16 *);
static bool8 ShouldRegisterEvent_HandleBeatStoryTrainer(u16, const u16 *);
static u16 *ShouldRegisterEvent(u16, const u16 *);
static bool8 TryDeferLinkEvent(u16, const u16 *);
static bool8 TryDeferTrainerBattleEvent(u16, const u16 *);
static bool8 IsEventWithSpecialEncounterSpecies(u16, const u16 *);
static void UpdateRepeatEventCounter(u16);
static u16 *QL_RecordAction_Wait(u16 *, u16);
static u16 *RecordEvent_SwitchedPartyOrder(u16 *, const struct QuestLogEvent_SwitchedPartyOrder *);
static u16 *RecordEvent_UsedItem(u16 *, const struct QuestLogEvent_Item *);
static u16 *RecordEvent_GaveHeldItemFromPartyMenu(u16 *, const struct QuestLogEvent_Item *);
static u16 *RecordEvent_GaveHeldItemFromBagMenu(u16 *, const struct QuestLogEvent_Item *);
static u16 *RecordEvent_GaveHeldItemFromPC(u16 *, const struct QuestLogEvent_Item *);
static u16 *RecordEvent_TookHeldItem(u16 *, const struct QuestLogEvent_Item *);
static u16 *RecordEvent_SwappedHeldItemFromBag(u16 *, const struct QuestLogEvent_SwappedHeldItem *);
static u16 *RecordEvent_SwappedHeldItemFromPC(u16 *, const struct QuestLogEvent_SwappedHeldItem *);
static u16 *RecordEvent_UsedPkmnCenter(u16 *, const u16 *);
static u16 *RecordEvent_LinkTraded(u16 *, const struct QuestLogEvent_Traded *);
static u16 *RecordEvent_LinkBattledSingle(u16 *, const struct QuestLogEvent_LinkBattle *);
static u16 *RecordEvent_LinkBattledDouble(u16 *, const struct QuestLogEvent_LinkBattle *);
static u16 *RecordEvent_LinkBattledMulti(u16 *, const struct QuestLogEvent_LinkBattle *);
static u16 *RecordEvent_UsedUnionRoom(u16 *, const u16 *);
static u16 *RecordEvent_UsedUnionRoomChat(u16 *, const u16 *);
static u16 *RecordEvent_LinkTradedUnionRoom(u16 *, const struct QuestLogEvent_Traded *);
static u16 *RecordEvent_LinkBattledUnionRoom(u16 *, const struct QuestLogEvent_LinkBattle *);
static u16 *RecordEvent_SwitchedMonsBetweenBoxes(u16 *, const struct QuestLogEvent_MovedBoxMon *);
static u16 *RecordEvent_SwitchedMonsWithinBox(u16 *, const u16 *);
static u16 *RecordEvent_SwitchedPartyMonForPCMon(u16 *, const u16 *);
static u16 *RecordEvent_MovedMonBetweenBoxes(u16 *, const u16 *);
static u16 *RecordEvent_MovedMonWithinBox(u16 *, const u16 *);
static u16 *RecordEvent_WithdrewMonFromPC(u16 *, const u16 *);
static u16 *RecordEvent_DepositedMonInPC(u16 *, const u16 *);
static u16 *RecordEvent_SwitchedMultipleMons(u16 *, const u16 *);
static u16 *RecordEvent_DepositedItemInPC(u16 *, const struct QuestLogEvent_Item *);
static u16 *RecordEvent_WithdrewItemFromPC(u16 *, const struct QuestLogEvent_Item *);
static u16 *RecordEvent_DefeatedGymLeader(u16 *, const struct QuestLogEvent_TrainerBattle *);
static u16 *RecordEvent_DefeatedWildMon(u16 *, const struct QuestLogEvent_WildBattle *);
static u16 *RecordEvent_DefeatedEliteFourMember(u16 *, const struct QuestLogEvent_TrainerBattle *);
static u16 *RecordEvent_DefeatedChampion(u16 *, const struct QuestLogEvent_TrainerBattle *);
static u16 *RecordEvent_DefeatedNormalTrainer(u16 *, const struct QuestLogEvent_TrainerBattle *);
static u16 *RecordEvent_DepartedLocation(u16 *, const struct QuestLogEvent_Departed *);
static u16 *RecordEvent_UsedFieldMove(u16 *, const struct QuestLogEvent_FieldMove *);
static u16 *RecordEvent_BoughtItem(u16 *, const struct QuestLogEvent_Shop *);
static u16 *RecordEvent_SoldItem(u16 *, const struct QuestLogEvent_Shop *);
static u16 *RecordEvent_ObtainedStoryItem(u16 *, const struct QuestLogEvent_StoryItem *);
static u16 *RecordEvent_ArrivedInLocation(u16 *, const u16 *);
static const u16 *LoadEvent_SwitchedPartyOrder(const u16 *);
static const u16 *LoadEvent_UsedItem(const u16 *);
static const u16 *LoadEvent_GaveHeldItemFromPartyMenu(const u16 *);
static const u16 *LoadEvent_GaveHeldItemFromBagMenu(const u16 *);
static const u16 *LoadEvent_GaveHeldItemFromPC(const u16 *);
static const u16 *LoadEvent_TookHeldItem(const u16 *);
static const u16 *LoadEvent_SwappedHeldItem(const u16 *);
static const u16 *LoadEvent_SwappedHeldItemFromPC(const u16 *);
static const u16 *LoadEvent_UsedPkmnCenter(const u16 *);
static const u16 *LoadEvent_LinkTraded(const u16 *);
static const u16 *LoadEvent_LinkBattledSingle(const u16 *);
static const u16 *LoadEvent_LinkBattledDouble(const u16 *);
static const u16 *LoadEvent_LinkBattledMulti(const u16 *);
static const u16 *LoadEvent_UsedUnionRoom(const u16 *);
static const u16 *LoadEvent_UsedUnionRoomChat(const u16 *);
static const u16 *LoadEvent_LinkTradedUnionRoom(const u16 *);
static const u16 *LoadEvent_LinkBattledUnionRoom(const u16 *);
static const u16 *LoadEvent_SwitchedMonsBetweenBoxes(const u16 *);
static const u16 *LoadEvent_SwitchedMonsWithinBox(const u16 *);
static const u16 *LoadEvent_SwitchedPartyMonForPCMon(const u16 *);
static const u16 *LoadEvent_MovedMonBetweenBoxes(const u16 *);
static const u16 *LoadEvent_MovedMonWithinBox(const u16 *);
static const u16 *LoadEvent_WithdrewMonFromPC(const u16 *);
static const u16 *LoadEvent_DepositedMonInPC(const u16 *);
static const u16 *LoadEvent_SwitchedMultipleMons(const u16 *);
static const u16 *LoadEvent_DepositedItemInPC(const u16 *);
static const u16 *LoadEvent_WithdrewItemFromPC(const u16 *);
static const u16 *LoadEvent_DefeatedGymLeader(const u16 *);
static const u16 *LoadEvent_DefeatedWildMon(const u16 *);
static const u16 *LoadEvent_DefeatedEliteFourMember(const u16 *);
static const u16 *LoadEvent_DefeatedChampion(const u16 *);
static const u16 *LoadEvent_DefeatedTrainer(const u16 *);
static const u16 *LoadEvent_DepartedLocation(const u16 *);
static const u16 *LoadEvent_UsedFieldMove(const u16 *);
static const u16 *LoadEvent_BoughtItem(const u16 *);
static const u16 *LoadEvent_SoldItem(const u16 *);
static const u16 *LoadEvent_ObtainedStoryItem(const u16 *);
static const u16 *LoadEvent_ArrivedInLocation(const u16 *);
static bool8 IsSpeciesFromSpecialEncounter(u16);
static bool8 ShouldRegisterEvent_HandleDeparted(u16, const u16 *);
static bool8 ShouldRegisterEvent_DepartedGameCorner(u16, const u16 *);
static void TranslateLinkPartnersName(u8 *);

typedef u16 *(*RecordEventFunc)(u16 *, const u16 *);

static const RecordEventFunc sRecordEventFuncs[] = {
    [QL_EVENT_INPUT]                         = NULL,
    [QL_EVENT_GFX_CHANGE]                    = NULL,
    [QL_EVENT_MOVEMENT]                      = NULL,
    [QL_EVENT_SWITCHED_PARTY_ORDER]          = (RecordEventFunc) RecordEvent_SwitchedPartyOrder,
    [QL_EVENT_USED_ITEM]                     = (RecordEventFunc) RecordEvent_UsedItem,
    [QL_EVENT_GAVE_HELD_ITEM]                = (RecordEventFunc) RecordEvent_GaveHeldItemFromPartyMenu,
    [QL_EVENT_GAVE_HELD_ITEM_BAG]            = (RecordEventFunc) RecordEvent_GaveHeldItemFromBagMenu,
    [QL_EVENT_GAVE_HELD_ITEM_PC]             = (RecordEventFunc) RecordEvent_GaveHeldItemFromPC,
    [QL_EVENT_TOOK_HELD_ITEM]                = (RecordEventFunc) RecordEvent_TookHeldItem,
    [QL_EVENT_SWAPPED_HELD_ITEM]             = (RecordEventFunc) RecordEvent_SwappedHeldItemFromBag,
    [QL_EVENT_SWAPPED_HELD_ITEM_PC]          = (RecordEventFunc) RecordEvent_SwappedHeldItemFromPC,
    [QL_EVENT_USED_PKMN_CENTER]              = (RecordEventFunc) RecordEvent_UsedPkmnCenter,
    [QL_EVENT_LINK_TRADED]                   = (RecordEventFunc) RecordEvent_LinkTraded,
    [QL_EVENT_LINK_BATTLED_SINGLE]           = (RecordEventFunc) RecordEvent_LinkBattledSingle,
    [QL_EVENT_LINK_BATTLED_DOUBLE]           = (RecordEventFunc) RecordEvent_LinkBattledDouble,
    [QL_EVENT_LINK_BATTLED_MULTI]            = (RecordEventFunc) RecordEvent_LinkBattledMulti,
    [QL_EVENT_USED_UNION_ROOM]               = (RecordEventFunc) RecordEvent_UsedUnionRoom,
    [QL_EVENT_USED_UNION_ROOM_CHAT]          = (RecordEventFunc) RecordEvent_UsedUnionRoomChat,
    [QL_EVENT_LINK_TRADED_UNION]             = (RecordEventFunc) RecordEvent_LinkTradedUnionRoom,
    [QL_EVENT_LINK_BATTLED_UNION]            = (RecordEventFunc) RecordEvent_LinkBattledUnionRoom,
    [QL_EVENT_SWITCHED_MONS_BETWEEN_BOXES]   = (RecordEventFunc) RecordEvent_SwitchedMonsBetweenBoxes,
    [QL_EVENT_SWITCHED_MONS_WITHIN_BOX]      = (RecordEventFunc) RecordEvent_SwitchedMonsWithinBox,
    [QL_EVENT_SWITCHED_PARTY_MON_FOR_PC_MON] = (RecordEventFunc) RecordEvent_SwitchedPartyMonForPCMon,
    [QL_EVENT_MOVED_MON_BETWEEN_BOXES]       = (RecordEventFunc) RecordEvent_MovedMonBetweenBoxes,
    [QL_EVENT_MOVED_MON_WITHIN_BOX]          = (RecordEventFunc) RecordEvent_MovedMonWithinBox,
    [QL_EVENT_WITHDREW_MON_PC]               = (RecordEventFunc) RecordEvent_WithdrewMonFromPC,
    [QL_EVENT_DEPOSITED_MON_PC]              = (RecordEventFunc) RecordEvent_DepositedMonInPC,
    [QL_EVENT_SWITCHED_MULTIPLE_MONS]        = (RecordEventFunc) RecordEvent_SwitchedMultipleMons,
    [QL_EVENT_DEPOSITED_ITEM_PC]             = (RecordEventFunc) RecordEvent_DepositedItemInPC,
    [QL_EVENT_WITHDREW_ITEM_PC]              = (RecordEventFunc) RecordEvent_WithdrewItemFromPC,
    [QL_EVENT_DEFEATED_GYM_LEADER]           = (RecordEventFunc) RecordEvent_DefeatedGymLeader,
    [QL_EVENT_DEFEATED_WILD_MON]             = (RecordEventFunc) RecordEvent_DefeatedWildMon,
    [QL_EVENT_DEFEATED_E4_MEMBER]            = (RecordEventFunc) RecordEvent_DefeatedEliteFourMember,
    [QL_EVENT_DEFEATED_CHAMPION]             = (RecordEventFunc) RecordEvent_DefeatedChampion,
    [QL_EVENT_DEFEATED_TRAINER]              = (RecordEventFunc) RecordEvent_DefeatedNormalTrainer,
    [QL_EVENT_DEPARTED]                      = (RecordEventFunc) RecordEvent_DepartedLocation,
    [QL_EVENT_USED_FIELD_MOVE]               = (RecordEventFunc) RecordEvent_UsedFieldMove,
    [QL_EVENT_BOUGHT_ITEM]                   = (RecordEventFunc) RecordEvent_BoughtItem,
    [QL_EVENT_SOLD_ITEM]                     = (RecordEventFunc) RecordEvent_SoldItem,
    [QL_EVENT_SCENE_END]                     = NULL,
    [QL_EVENT_OBTAINED_STORY_ITEM]           = (RecordEventFunc) RecordEvent_ObtainedStoryItem,
    [QL_EVENT_WAIT]                          = NULL,
    [QL_EVENT_ARRIVED]                       = (RecordEventFunc) RecordEvent_ArrivedInLocation
};

static const u16 *(*const sLoadEventFuncs[])(const u16 *) = {
    [QL_EVENT_INPUT]                         = NULL,
    [QL_EVENT_GFX_CHANGE]                    = NULL,
    [QL_EVENT_MOVEMENT]                      = NULL,
    [QL_EVENT_SWITCHED_PARTY_ORDER]          = LoadEvent_SwitchedPartyOrder,
    [QL_EVENT_USED_ITEM]                     = LoadEvent_UsedItem,
    [QL_EVENT_GAVE_HELD_ITEM]                = LoadEvent_GaveHeldItemFromPartyMenu,
    [QL_EVENT_GAVE_HELD_ITEM_BAG]            = LoadEvent_GaveHeldItemFromBagMenu,
    [QL_EVENT_GAVE_HELD_ITEM_PC]             = LoadEvent_GaveHeldItemFromPC,
    [QL_EVENT_TOOK_HELD_ITEM]                = LoadEvent_TookHeldItem,
    [QL_EVENT_SWAPPED_HELD_ITEM]             = LoadEvent_SwappedHeldItem,
    [QL_EVENT_SWAPPED_HELD_ITEM_PC]          = LoadEvent_SwappedHeldItemFromPC,
    [QL_EVENT_USED_PKMN_CENTER]              = LoadEvent_UsedPkmnCenter,
    [QL_EVENT_LINK_TRADED]                   = LoadEvent_LinkTraded,
    [QL_EVENT_LINK_BATTLED_SINGLE]           = LoadEvent_LinkBattledSingle,
    [QL_EVENT_LINK_BATTLED_DOUBLE]           = LoadEvent_LinkBattledDouble,
    [QL_EVENT_LINK_BATTLED_MULTI]            = LoadEvent_LinkBattledMulti,
    [QL_EVENT_USED_UNION_ROOM]               = LoadEvent_UsedUnionRoom,
    [QL_EVENT_USED_UNION_ROOM_CHAT]          = LoadEvent_UsedUnionRoomChat,
    [QL_EVENT_LINK_TRADED_UNION]             = LoadEvent_LinkTradedUnionRoom,
    [QL_EVENT_LINK_BATTLED_UNION]            = LoadEvent_LinkBattledUnionRoom,
    [QL_EVENT_SWITCHED_MONS_BETWEEN_BOXES]   = LoadEvent_SwitchedMonsBetweenBoxes,
    [QL_EVENT_SWITCHED_MONS_WITHIN_BOX]      = LoadEvent_SwitchedMonsWithinBox,
    [QL_EVENT_SWITCHED_PARTY_MON_FOR_PC_MON] = LoadEvent_SwitchedPartyMonForPCMon,
    [QL_EVENT_MOVED_MON_BETWEEN_BOXES]       = LoadEvent_MovedMonBetweenBoxes,
    [QL_EVENT_MOVED_MON_WITHIN_BOX]          = LoadEvent_MovedMonWithinBox,
    [QL_EVENT_WITHDREW_MON_PC]               = LoadEvent_WithdrewMonFromPC,
    [QL_EVENT_DEPOSITED_MON_PC]              = LoadEvent_DepositedMonInPC,
    [QL_EVENT_SWITCHED_MULTIPLE_MONS]        = LoadEvent_SwitchedMultipleMons,
    [QL_EVENT_DEPOSITED_ITEM_PC]             = LoadEvent_DepositedItemInPC,
    [QL_EVENT_WITHDREW_ITEM_PC]              = LoadEvent_WithdrewItemFromPC,
    [QL_EVENT_DEFEATED_GYM_LEADER]           = LoadEvent_DefeatedGymLeader,
    [QL_EVENT_DEFEATED_WILD_MON]             = LoadEvent_DefeatedWildMon,
    [QL_EVENT_DEFEATED_E4_MEMBER]            = LoadEvent_DefeatedEliteFourMember,
    [QL_EVENT_DEFEATED_CHAMPION]             = LoadEvent_DefeatedChampion,
    [QL_EVENT_DEFEATED_TRAINER]              = LoadEvent_DefeatedTrainer,
    [QL_EVENT_DEPARTED]                      = LoadEvent_DepartedLocation,
    [QL_EVENT_USED_FIELD_MOVE]               = LoadEvent_UsedFieldMove,
    [QL_EVENT_BOUGHT_ITEM]                   = LoadEvent_BoughtItem,
    [QL_EVENT_SOLD_ITEM]                     = LoadEvent_SoldItem,
    [QL_EVENT_SCENE_END]                     = NULL,
    [QL_EVENT_OBTAINED_STORY_ITEM]           = LoadEvent_ObtainedStoryItem,
    [QL_EVENT_WAIT]                          = NULL,
    [QL_EVENT_ARRIVED]                       = LoadEvent_ArrivedInLocation
};

static const u8 sQuestLogEventCmdSizes[] = {
    [QL_EVENT_INPUT]                         = 8,
    [QL_EVENT_GFX_CHANGE]                    = 8,
    [QL_EVENT_MOVEMENT]                      = 8,
    [QL_EVENT_SWITCHED_PARTY_ORDER]          = CMD_HEADER_SIZE + 4,
    [QL_EVENT_USED_ITEM]                     = CMD_HEADER_SIZE + 6,
    [QL_EVENT_GAVE_HELD_ITEM]                = CMD_HEADER_SIZE + 4,
    [QL_EVENT_GAVE_HELD_ITEM_BAG]            = CMD_HEADER_SIZE + 4,
    [QL_EVENT_GAVE_HELD_ITEM_PC]             = CMD_HEADER_SIZE + 4,
    [QL_EVENT_TOOK_HELD_ITEM]                = CMD_HEADER_SIZE + 4,
    [QL_EVENT_SWAPPED_HELD_ITEM]             = CMD_HEADER_SIZE + 6,
    [QL_EVENT_SWAPPED_HELD_ITEM_PC]          = CMD_HEADER_SIZE + 6,
    [QL_EVENT_USED_PKMN_CENTER]              = CMD_HEADER_SIZE + 0,
    [QL_EVENT_LINK_TRADED]                   = CMD_HEADER_SIZE + 12,
    [QL_EVENT_LINK_BATTLED_SINGLE]           = CMD_HEADER_SIZE + 8,
    [QL_EVENT_LINK_BATTLED_DOUBLE]           = CMD_HEADER_SIZE + 8,
    [QL_EVENT_LINK_BATTLED_MULTI]            = CMD_HEADER_SIZE + 22,
    [QL_EVENT_USED_UNION_ROOM]               = CMD_HEADER_SIZE + 0,
    [QL_EVENT_USED_UNION_ROOM_CHAT]          = CMD_HEADER_SIZE + 0,
    [QL_EVENT_LINK_TRADED_UNION]             = CMD_HEADER_SIZE + 12,
    [QL_EVENT_LINK_BATTLED_UNION]            = CMD_HEADER_SIZE + 8,
    [QL_EVENT_SWITCHED_MONS_BETWEEN_BOXES]   = CMD_HEADER_SIZE + 6,
    [QL_EVENT_SWITCHED_MONS_WITHIN_BOX]      = CMD_HEADER_SIZE + 6,
    [QL_EVENT_SWITCHED_PARTY_MON_FOR_PC_MON] = CMD_HEADER_SIZE + 6,
    [QL_EVENT_MOVED_MON_BETWEEN_BOXES]       = CMD_HEADER_SIZE + 4,
    [QL_EVENT_MOVED_MON_WITHIN_BOX]          = CMD_HEADER_SIZE + 4,
    [QL_EVENT_WITHDREW_MON_PC]               = CMD_HEADER_SIZE + 4,
    [QL_EVENT_DEPOSITED_MON_PC]              = CMD_HEADER_SIZE + 4,
    [QL_EVENT_SWITCHED_MULTIPLE_MONS]        = CMD_HEADER_SIZE + 2,
    [QL_EVENT_DEPOSITED_ITEM_PC]             = CMD_HEADER_SIZE + 2,
    [QL_EVENT_WITHDREW_ITEM_PC]              = CMD_HEADER_SIZE + 2,
    [QL_EVENT_DEFEATED_GYM_LEADER]           = CMD_HEADER_SIZE + 8,
    [QL_EVENT_DEFEATED_WILD_MON]             = CMD_HEADER_SIZE + 8,
    [QL_EVENT_DEFEATED_E4_MEMBER]            = CMD_HEADER_SIZE + 8,
    [QL_EVENT_DEFEATED_CHAMPION]             = CMD_HEADER_SIZE + 6,
    [QL_EVENT_DEFEATED_TRAINER]              = CMD_HEADER_SIZE + 8,
    [QL_EVENT_DEPARTED]                      = CMD_HEADER_SIZE + 2,
    [QL_EVENT_USED_FIELD_MOVE]               = CMD_HEADER_SIZE + 4,
    [QL_EVENT_BOUGHT_ITEM]                   = CMD_HEADER_SIZE + 10,
    [QL_EVENT_SOLD_ITEM]                     = CMD_HEADER_SIZE + 10,
    [QL_EVENT_SCENE_END]                     = 2,
    [QL_EVENT_OBTAINED_STORY_ITEM]           = CMD_HEADER_SIZE + 4,
    [QL_EVENT_WAIT]                          = 4,
    [QL_EVENT_ARRIVED]                       = CMD_HEADER_SIZE + 2
};

static const u8 *const sDefeatedOpponentFlavorTexts[] = {
    gText_QuestLog_Handily,
    gText_QuestLog_Tenaciously,
    gText_QuestLog_Somehow
};

static const u8 *const sDefeatedChampionFlavorTexts[] = {
    gText_QuestLog_Coolly,
    gText_QuestLog_Somehow,
    gText_QuestLog_Barely
};

static const u8 *const sBattleOutcomeTexts[] = {
    [B_OUTCOME_WON - 1]  = gText_QuestLog_Win,
    [B_OUTCOME_LOST - 1] = gText_QuestLog_Loss,
    [B_OUTCOME_DREW - 1] = gText_QuestLog_Draw,
};

static const u8 *const sLocationNameTexts[] =
{
    [QL_LOCATION_HOME]               = gText_QuestLog_Home,
    [QL_LOCATION_OAKS_LAB]           = gText_QuestLog_OakResearchLab,
    [QL_LOCATION_VIRIDIAN_GYM]       = gText_QuestLog_Gym,
    [QL_LOCATION_LEAGUE_GATE_1]      = gText_QuestLog_PokemonLeagueGate,
    [QL_LOCATION_LEAGUE_GATE_2]      = gText_QuestLog_PokemonLeagueGate,
    [QL_LOCATION_VIRIDIAN_FOREST_1]  = gText_QuestLog_ViridianForest,
    [QL_LOCATION_VIRIDIAN_FOREST_2]  = gText_QuestLog_ViridianForest,
    [QL_LOCATION_PEWTER_MUSEUM]      = gText_QuestLog_PewterMuseumOfScience,
    [QL_LOCATION_PEWTER_GYM]         = gText_QuestLog_Gym,
    [QL_LOCATION_MT_MOON_1]          = gText_QuestLog_MtMoon,
    [QL_LOCATION_MT_MOON_2]          = gText_QuestLog_MtMoon,
    [QL_LOCATION_CERULEAN_GYM]       = gText_QuestLog_Gym,
    [QL_LOCATION_BIKE_SHOP]          = gText_QuestLog_BikeShop,
    [QL_LOCATION_BILLS_HOUSE]        = gText_QuestLog_BillsHouse,
    [QL_LOCATION_DAY_CARE]           = gText_QuestLog_DayCare,
    [QL_LOCATION_UNDERGROUND_PATH_1] = gText_QuestLog_UndergroundPath,
    [QL_LOCATION_UNDERGROUND_PATH_2] = gText_QuestLog_UndergroundPath,
    [QL_LOCATION_PKMN_FAN_CLUB]      = gText_QuestLog_PokemonFanClub,
    [QL_LOCATION_VERMILION_GYM]      = gText_QuestLog_Gym,
    [QL_LOCATION_SS_ANNE]            = gText_QuestLog_SSAnne,
    [QL_LOCATION_DIGLETTS_CAVE_1]    = gText_QuestLog_DiglettsCave,
    [QL_LOCATION_DIGLETTS_CAVE_2]    = gText_QuestLog_DiglettsCave,
    [QL_LOCATION_ROCK_TUNNEL_1]      = gText_QuestLog_RockTunnel,
    [QL_LOCATION_ROCK_TUNNEL_2]      = gText_QuestLog_RockTunnel,
    [QL_LOCATION_POWER_PLANT]        = gText_QuestLog_PowerPlant,
    [QL_LOCATION_PKMN_TOWER]         = gText_QuestLog_PokemonTower,
    [QL_LOCATION_VOLUNTEER_HOUSE]    = gText_QuestLog_VolunteerHouse,
    [QL_LOCATION_NAME_RATERS_HOUSE]  = gText_QuestLog_NameRatersHouse,
    [QL_LOCATION_UNDERGROUND_PATH_3] = gText_QuestLog_UndergroundPath,
    [QL_LOCATION_UNDERGROUND_PATH_4] = gText_QuestLog_UndergroundPath,
    [QL_LOCATION_CELADON_DEPT_STORE] = gText_QuestLog_CeladonDeptStore,
    [QL_LOCATION_CELADON_MANSION]    = gText_QuestLog_CeladonMansion,
    [QL_LOCATION_GAME_CORNER]        = gText_QuestLog_RocketGameCorner,
    [QL_LOCATION_CELADON_GYM]        = gText_QuestLog_Gym,
    [QL_LOCATION_CELADON_RESTAURANT] = gText_QuestLog_Restaurant,
    [QL_LOCATION_ROCKET_HIDEOUT]     = gText_QuestLog_RocketHideout,
    [QL_LOCATION_SAFARI_ZONE]        = gText_QuestLog_SafariZone,
    [QL_LOCATION_FUCHSIA_GYM]        = gText_QuestLog_Gym,
    [QL_LOCATION_WARDENS_HOME]       = gText_QuestLog_WardensHome,
    [QL_LOCATION_FIGHTING_DOJO]      = gText_QuestLog_FightingDojo,
    [QL_LOCATION_SAFFRON_GYM]        = gText_QuestLog_Gym,
    [QL_LOCATION_SILPH_CO]           = gText_QuestLog_SilphCo,
    [QL_LOCATION_SEAFOAM_ISLANDS_1]  = gText_QuestLog_SeafoamIslands,
    [QL_LOCATION_SEAFOAM_ISLANDS_2]  = gText_QuestLog_SeafoamIslands,
    [QL_LOCATION_PKMN_MANSION]       = gText_QuestLog_PokemonMansion,
    [QL_LOCATION_CINNABAR_GYM]       = gText_QuestLog_Gym,
    [QL_LOCATION_CINNABAR_LAB]       = gText_QuestLog_PokemonResearchLab,
    [QL_LOCATION_VICTORY_ROAD_1]     = gText_QuestLog_VictoryRoad,
    [QL_LOCATION_VICTORY_ROAD_2]     = gText_QuestLog_VictoryRoad,
    [QL_LOCATION_PKMN_LEAGUE]        = gText_QuestLog_PokemonLeague,
    [QL_LOCATION_CERULEAN_CAVE]      = gText_QuestLog_CeruleanCave
};

static const u8 *const sDepartedLocationTexts[] =
{
    [QL_DEPARTED_TOWN_BUILDING]   = gText_QuestLog_DepartedPlaceInTownForNextDestination,
    [QL_DEPARTED_MUSEUM]          = gText_QuestLog_LeftTownsLocationForNextDestination,
    [QL_DEPARTED_GAME_CORNER]     = gText_QuestLog_PlayedGamesAtGameCorner,
    [QL_DEPARTED_HOME]            = gText_QuestLog_RestedAtHome,
    [QL_DEPARTED_OAKS_LAB]        = gText_QuestLog_LeftOaksLab,
    [QL_DEPARTED_GYM]             = gText_QuestLog_GymWasFullOfToughTrainers,
    [QL_DEPARTED_SAFARI_ZONE]     = gText_QuestLog_HadGreatTimeInSafariZone,
    [QL_DEPARTED_CAVE]            = gText_QuestLog_ManagedToGetOutOfLocation,
    [QL_DEPARTED_MISC_BUILDING_1] = gText_QuestLog_DepartedTheLocationForNextDestination,
    [QL_DEPARTED_MISC_BUILDING_2] = gText_QuestLog_DepartedFromLocationToNextDestination
};

static const u8 sLocationToDepartedTextId[] =
{
    [QL_LOCATION_HOME]               = QL_DEPARTED_HOME,
    [QL_LOCATION_OAKS_LAB]           = QL_DEPARTED_OAKS_LAB,
    [QL_LOCATION_VIRIDIAN_GYM]       = QL_DEPARTED_GYM,
    [QL_LOCATION_LEAGUE_GATE_1]      = QL_DEPARTED_MISC_BUILDING_1,
    [QL_LOCATION_LEAGUE_GATE_2]      = QL_DEPARTED_MISC_BUILDING_1,
    [QL_LOCATION_VIRIDIAN_FOREST_1]  = QL_DEPARTED_CAVE,
    [QL_LOCATION_VIRIDIAN_FOREST_2]  = QL_DEPARTED_CAVE,
    [QL_LOCATION_PEWTER_MUSEUM]      = QL_DEPARTED_MUSEUM,
    [QL_LOCATION_PEWTER_GYM]         = QL_DEPARTED_GYM,
    [QL_LOCATION_MT_MOON_1]          = QL_DEPARTED_CAVE,
    [QL_LOCATION_MT_MOON_2]          = QL_DEPARTED_CAVE,
    [QL_LOCATION_CERULEAN_GYM]       = QL_DEPARTED_GYM,
    [QL_LOCATION_BIKE_SHOP]          = QL_DEPARTED_TOWN_BUILDING,
    [QL_LOCATION_BILLS_HOUSE]        = QL_DEPARTED_TOWN_BUILDING,
    [QL_LOCATION_DAY_CARE]           = QL_DEPARTED_TOWN_BUILDING,
    [QL_LOCATION_UNDERGROUND_PATH_1] = QL_DEPARTED_MISC_BUILDING_1,
    [QL_LOCATION_UNDERGROUND_PATH_2] = QL_DEPARTED_MISC_BUILDING_1,
    [QL_LOCATION_PKMN_FAN_CLUB]      = QL_DEPARTED_TOWN_BUILDING,
    [QL_LOCATION_VERMILION_GYM]      = QL_DEPARTED_GYM,
    [QL_LOCATION_SS_ANNE]            = QL_DEPARTED_MISC_BUILDING_1,
    [QL_LOCATION_DIGLETTS_CAVE_1]    = QL_DEPARTED_CAVE,
    [QL_LOCATION_DIGLETTS_CAVE_2]    = QL_DEPARTED_CAVE,
    [QL_LOCATION_ROCK_TUNNEL_1]      = QL_DEPARTED_CAVE,
    [QL_LOCATION_ROCK_TUNNEL_2]      = QL_DEPARTED_CAVE,
    [QL_LOCATION_POWER_PLANT]        = QL_DEPARTED_MISC_BUILDING_1,
    [QL_LOCATION_PKMN_TOWER]         = QL_DEPARTED_MISC_BUILDING_1,
    [QL_LOCATION_VOLUNTEER_HOUSE]    = QL_DEPARTED_TOWN_BUILDING,
    [QL_LOCATION_NAME_RATERS_HOUSE]  = QL_DEPARTED_TOWN_BUILDING,
    [QL_LOCATION_UNDERGROUND_PATH_3] = QL_DEPARTED_MISC_BUILDING_1,
    [QL_LOCATION_UNDERGROUND_PATH_4] = QL_DEPARTED_MISC_BUILDING_1,
    [QL_LOCATION_CELADON_DEPT_STORE] = QL_DEPARTED_TOWN_BUILDING,
    [QL_LOCATION_CELADON_MANSION]    = QL_DEPARTED_TOWN_BUILDING,
    [QL_LOCATION_GAME_CORNER]        = QL_DEPARTED_GAME_CORNER,
    [QL_LOCATION_CELADON_GYM]        = QL_DEPARTED_GYM,
    [QL_LOCATION_CELADON_RESTAURANT] = QL_DEPARTED_TOWN_BUILDING,
    [QL_LOCATION_ROCKET_HIDEOUT]     = QL_DEPARTED_MISC_BUILDING_1,
    [QL_LOCATION_SAFARI_ZONE]        = QL_DEPARTED_SAFARI_ZONE,
    [QL_LOCATION_FUCHSIA_GYM]        = QL_DEPARTED_GYM,
    [QL_LOCATION_WARDENS_HOME]       = QL_DEPARTED_TOWN_BUILDING,
    [QL_LOCATION_FIGHTING_DOJO]      = QL_DEPARTED_TOWN_BUILDING,
    [QL_LOCATION_SAFFRON_GYM]        = QL_DEPARTED_GYM,
    [QL_LOCATION_SILPH_CO]           = QL_DEPARTED_MISC_BUILDING_2,
    [QL_LOCATION_SEAFOAM_ISLANDS_1]  = QL_DEPARTED_CAVE,
    [QL_LOCATION_SEAFOAM_ISLANDS_2]  = QL_DEPARTED_CAVE,
    [QL_LOCATION_PKMN_MANSION]       = QL_DEPARTED_MISC_BUILDING_2,
    [QL_LOCATION_CINNABAR_GYM]       = QL_DEPARTED_GYM,
    [QL_LOCATION_CINNABAR_LAB]       = QL_DEPARTED_TOWN_BUILDING,
    [QL_LOCATION_VICTORY_ROAD_1]     = QL_DEPARTED_CAVE,
    [QL_LOCATION_VICTORY_ROAD_2]     = QL_DEPARTED_CAVE,
    [QL_LOCATION_PKMN_LEAGUE]        = QL_DEPARTED_MISC_BUILDING_1,
    [QL_LOCATION_CERULEAN_CAVE]      = QL_DEPARTED_CAVE
};

static const u8 sGymCityMapSecs[NUM_BADGES] = {
    MAPSEC_PEWTER_CITY,
    MAPSEC_CERULEAN_CITY,
    MAPSEC_VERMILION_CITY,
    MAPSEC_CELADON_CITY,
    MAPSEC_FUCHSIA_CITY,
    MAPSEC_SAFFRON_CITY,
    MAPSEC_CINNABAR_ISLAND,
    MAPSEC_VIRIDIAN_CITY,
};

static const u8 *const sUsedFieldMoveTexts[] =
{
    [FIELD_MOVE_FLASH]       = gText_QuestLog_UsedFlash,
    [FIELD_MOVE_CUT]         = gText_QuestLog_UsedCut,
    [FIELD_MOVE_FLY]         = gText_QuestLog_UsedFly,
    [FIELD_MOVE_STRENGTH]    = gText_QuestLog_UsedStrength,
    [FIELD_MOVE_SURF]        = gText_QuestLog_UsedSurf,
    [FIELD_MOVE_ROCK_SMASH]  = gText_QuestLog_UsedRockSmash,
    [FIELD_MOVE_WATERFALL]   = gText_QuestLog_UsedWaterfall,
    [FIELD_MOVE_TELEPORT]    = gText_QuestLog_UsedTeleportToLocation,
    [FIELD_MOVE_DIG]         = gText_QuestLog_UsedDigInLocation,
    [FIELD_MOVE_MILK_DRINK]  = gText_QuestLog_UsedMilkDrink,
    [FIELD_MOVE_SOFT_BOILED] = gText_QuestLog_UsedSoftboiled,
    [FIELD_MOVE_SWEET_SCENT] = gText_QuestLog_UsedSweetScent
};

static const u16 sWorldMapFlags[] =
{
    FLAG_WORLD_MAP_VIRIDIAN_CITY,
    FLAG_WORLD_MAP_PEWTER_CITY,
    FLAG_WORLD_MAP_CERULEAN_CITY,
    FLAG_WORLD_MAP_LAVENDER_TOWN,
    FLAG_WORLD_MAP_VERMILION_CITY,
    FLAG_WORLD_MAP_CELADON_CITY,
    FLAG_WORLD_MAP_FUCHSIA_CITY,
    FLAG_WORLD_MAP_CINNABAR_ISLAND,
    FLAG_WORLD_MAP_INDIGO_PLATEAU_EXTERIOR,
    FLAG_WORLD_MAP_SAFFRON_CITY,
    FLAG_WORLD_MAP_ONE_ISLAND,
    FLAG_WORLD_MAP_TWO_ISLAND,
    FLAG_WORLD_MAP_THREE_ISLAND,
    FLAG_WORLD_MAP_FOUR_ISLAND,
    FLAG_WORLD_MAP_FIVE_ISLAND,
    FLAG_WORLD_MAP_SEVEN_ISLAND,
    FLAG_WORLD_MAP_SIX_ISLAND
};

void SetQuestLogEvent(u16 eventId, const u16 * data)
{
    u16 *r1;

    if (eventId == QL_EVENT_DEPARTED && sStepRecordingMode == STEP_RECORDING_MODE_DISABLED_UNTIL_DEPART)
    {
        QL_EnableRecordingSteps();
        return;
    }
    QL_EnableRecordingSteps();

    if (gQuestLogState == QL_STATE_PLAYBACK)
        return;

    if (!IS_VALID_QL_EVENT(eventId))
        return;

    // Certain locations like Trainer Tower do not allow Quest Log events to be recorded
    if (InQuestLogDisabledLocation() == TRUE)
        return;

    if (TryDeferLinkEvent(eventId, data) == TRUE)
        return;

    // Link events handled above. If we're in an active link, don't record any other events.
    if (MenuHelpers_IsLinkActive() == TRUE || InUnionRoom() == TRUE)
        return;

    if (TryDeferTrainerBattleEvent(eventId, data) == TRUE)
        return;

    // Wild battles with static encounter species (Snorlax, Mewtwo, etc.) are not recorded.
    if (IsEventWithSpecialEncounterSpecies(eventId, data) == TRUE)
        return;

    // If player departed Game Corner without using the slots, don't record it
    if (ShouldRegisterEvent_DepartedGameCorner(eventId, data) == FALSE)
        return;

    if (gQuestLogPlaybackState == QL_PLAYBACK_STATE_STOPPED)
    {
        if (ShouldRegisterEvent_HandlePartyActions(eventId, data) == TRUE)
            return;

        if (eventId != QL_EVENT_DEFEATED_WILD_MON || gQuestLogDefeatedWildMonRecord == NULL)
        {
            if (ShouldRegisterEvent_HandleDeparted(eventId, data) == FALSE)
                return;
            QL_StartRecordingAction(eventId);
        }
    }
    else if (eventId == QL_EVENT_OBTAINED_STORY_ITEM)
        return;

    UpdateRepeatEventCounter(eventId);
    if (eventId == QL_EVENT_DEFEATED_WILD_MON)
    {
        if (gQuestLogDefeatedWildMonRecord == NULL)
        {
            gQuestLogDefeatedWildMonRecord = gQuestLogRecordingPointer;
            r1 = sRecordEventFuncs[eventId](gQuestLogDefeatedWildMonRecord, data);
        }
        else
        {
            sRecordEventFuncs[eventId](gQuestLogDefeatedWildMonRecord, data);
            return;
        }
    }
    else
    {
        gQuestLogDefeatedWildMonRecord = NULL;
        r1 = sRecordEventFuncs[eventId](gQuestLogRecordingPointer, data);
    }

    if (r1 == NULL)
    {
        QL_FinishRecordingScene();
        r1 = ShouldRegisterEvent(eventId, data);
        if (!r1)
            return;
    }

    gQuestLogRecordingPointer = r1;
    if (sStepRecordingMode == STEP_RECORDING_MODE_ENABLED)
        return;
    QL_FinishRecordingScene();
}

static bool8 InQuestLogDisabledLocation(void)
{
    // In Trainer Tower
    if (gSaveBlock1Ptr->location.mapGroup == MAP_GROUP(TRAINER_TOWER_1F)
        && (gSaveBlock1Ptr->location.mapNum == MAP_NUM(TRAINER_TOWER_1F)
         || gSaveBlock1Ptr->location.mapNum == MAP_NUM(TRAINER_TOWER_2F)
         || gSaveBlock1Ptr->location.mapNum == MAP_NUM(TRAINER_TOWER_3F)
         || gSaveBlock1Ptr->location.mapNum == MAP_NUM(TRAINER_TOWER_4F)
         || gSaveBlock1Ptr->location.mapNum == MAP_NUM(TRAINER_TOWER_5F)
         || gSaveBlock1Ptr->location.mapNum == MAP_NUM(TRAINER_TOWER_6F)
         || gSaveBlock1Ptr->location.mapNum == MAP_NUM(TRAINER_TOWER_7F)
         || gSaveBlock1Ptr->location.mapNum == MAP_NUM(TRAINER_TOWER_8F)
         || gSaveBlock1Ptr->location.mapNum == MAP_NUM(TRAINER_TOWER_ROOF)
         || gSaveBlock1Ptr->location.mapNum == MAP_NUM(TRAINER_TOWER_LOBBY)
         || gSaveBlock1Ptr->location.mapNum == MAP_NUM(TRAINER_TOWER_ELEVATOR)))
        return TRUE;

    // In pokemon trainer fan club
    if (gSaveBlock1Ptr->location.mapGroup == MAP_GROUP(SAFFRON_CITY_POKEMON_TRAINER_FAN_CLUB)
      && gSaveBlock1Ptr->location.mapNum == MAP_NUM(SAFFRON_CITY_POKEMON_TRAINER_FAN_CLUB))
        return TRUE;

    // In E-Reader house
    if (gSaveBlock1Ptr->location.mapGroup == MAP_GROUP(SEVEN_ISLAND_HOUSE_ROOM1) &&
        (gSaveBlock1Ptr->location.mapNum == MAP_NUM(SEVEN_ISLAND_HOUSE_ROOM1)
      || gSaveBlock1Ptr->location.mapNum == MAP_NUM(SEVEN_ISLAND_HOUSE_ROOM2)))
        return TRUE;

    // In elevator
    if ((gSaveBlock1Ptr->location.mapGroup == MAP_GROUP(ROCKET_HIDEOUT_ELEVATOR) && gSaveBlock1Ptr->location.mapNum == MAP_NUM(ROCKET_HIDEOUT_ELEVATOR))
     || (gSaveBlock1Ptr->location.mapGroup == MAP_GROUP(SILPH_CO_ELEVATOR) && gSaveBlock1Ptr->location.mapNum == MAP_NUM(SILPH_CO_ELEVATOR))
     || (gSaveBlock1Ptr->location.mapGroup == MAP_GROUP(TRAINER_TOWER_ELEVATOR) && gSaveBlock1Ptr->location.mapNum == MAP_NUM(TRAINER_TOWER_ELEVATOR))
     || (gSaveBlock1Ptr->location.mapGroup == MAP_GROUP(CELADON_CITY_DEPARTMENT_STORE_ELEVATOR) && gSaveBlock1Ptr->location.mapNum == MAP_NUM(CELADON_CITY_DEPARTMENT_STORE_ELEVATOR)))
        return TRUE;

    return FALSE;
}

bool8 QuestLog_ShouldEndSceneOnMapChange(void)
{
    if (InQuestLogDisabledLocation() != TRUE)
        return FALSE;

    if (gQuestLogState == QL_STATE_PLAYBACK)
        return TRUE;

    if (gQuestLogState == QL_STATE_RECORDING)
        QuestLog_CutRecording();

    return FALSE;
}

static bool8 ShouldRegisterEvent_HandlePartyActions(u16 eventId, const u16 * data)
{
    if (eventId == QL_EVENT_USED_FIELD_MOVE || eventId == QL_EVENT_USED_PKMN_CENTER)
        return TRUE;

    if (!FlagGet(FLAG_SYS_GAME_CLEAR))
    {
        if (eventId == QL_EVENT_SWITCHED_PARTY_ORDER
         || eventId == QL_EVENT_DEFEATED_WILD_MON
         || ShouldRegisterEvent_HandleBeatStoryTrainer(eventId, data) == TRUE)
            return TRUE;
    }

    if (!FlagGet(FLAG_SYS_CAN_LINK_WITH_RS))
    {
        if (eventId == QL_EVENT_USED_ITEM
         || eventId == QL_EVENT_GAVE_HELD_ITEM
         || eventId == QL_EVENT_GAVE_HELD_ITEM_BAG
         || eventId == QL_EVENT_GAVE_HELD_ITEM_PC
         || eventId == QL_EVENT_TOOK_HELD_ITEM
         || eventId == QL_EVENT_SWAPPED_HELD_ITEM
         || eventId == QL_EVENT_SWAPPED_HELD_ITEM_PC
         || eventId == QL_EVENT_SWITCHED_PARTY_MON_FOR_PC_MON
         || eventId == QL_EVENT_WITHDREW_MON_PC
         || eventId == QL_EVENT_DEPOSITED_MON_PC)
            return TRUE;
    }

    return FALSE;
}

static bool8 ShouldRegisterEvent_HandleBeatStoryTrainer(u16 eventId, const u16 * genericData)
{
    if (eventId == QL_EVENT_DEFEATED_TRAINER)
    {
        const struct QuestLogEvent_TrainerBattle * data = (struct QuestLogEvent_TrainerBattle *)genericData;
        u8 trainerClass = gTrainers[data->trainerId].trainerClass;
        if (trainerClass == TRAINER_CLASS_RIVAL_EARLY
         || trainerClass == TRAINER_CLASS_RIVAL_LATE
         || trainerClass == TRAINER_CLASS_CHAMPION
         || trainerClass == TRAINER_CLASS_BOSS)
            return FALSE;
        return TRUE;
    }
    return FALSE;
}

void QL_EnableRecordingSteps(void)
{
    sStepRecordingMode = STEP_RECORDING_MODE_ENABLED;
}

static u16 *ShouldRegisterEvent(u16 eventId, const u16 * data)
{
    if (ShouldRegisterEvent_HandlePartyActions(eventId, data) == TRUE)
        return NULL;

    if (ShouldRegisterEvent_HandleDeparted(eventId, data) == FALSE)
        return NULL;

    QL_StartRecordingAction(eventId);
    UpdateRepeatEventCounter(eventId);

    if (eventId == QL_EVENT_DEFEATED_WILD_MON)
        gQuestLogDefeatedWildMonRecord = gQuestLogRecordingPointer;
    else
        gQuestLogDefeatedWildMonRecord = NULL;

    return sRecordEventFuncs[eventId](gQuestLogRecordingPointer, data);
}

static bool8 TryDeferLinkEvent(u16 eventId, const u16 * data)
{
    if (!IS_LINK_QL_EVENT(eventId))
        return FALSE;

    ResetDeferredLinkEvent();
    sDeferredEvent.id = eventId;

    // These two events have no data, so no need to copy
    if (eventId != QL_EVENT_USED_UNION_ROOM && eventId != QL_EVENT_USED_UNION_ROOM_CHAT)
    {
        if (eventId == QL_EVENT_LINK_TRADED || eventId == QL_EVENT_LINK_TRADED_UNION)
            memcpy(sDeferredEvent.data, data, sizeof(struct QuestLogEvent_Traded));
        else
            memcpy(sDeferredEvent.data, data, sizeof(struct QuestLogEvent_LinkBattle));
    }
    return TRUE;
}

void ResetDeferredLinkEvent(void)
{
    sDeferredEvent = (struct DeferredLinkEvent){};
}

void QuestLog_StartRecordingInputsAfterDeferredEvent(void)
{
    if (sDeferredEvent.id != 0)
    {
        u16 *resp;
        sLastDepartedLocation = 0;
        QL_StartRecordingAction(sDeferredEvent.id);
        resp = sRecordEventFuncs[sDeferredEvent.id](gQuestLogRecordingPointer, sDeferredEvent.data);
        gQuestLogRecordingPointer = resp;
        ResetDeferredLinkEvent();
    }
}

static bool8 TryDeferTrainerBattleEvent(u16 eventId, const u16 * data)
{
    if (eventId != QL_EVENT_DEFEATED_TRAINER
     && eventId != QL_EVENT_DEFEATED_GYM_LEADER
     && eventId != QL_EVENT_DEFEATED_E4_MEMBER
     && eventId != QL_EVENT_DEFEATED_CHAMPION)
        return FALSE;

    ResetDeferredLinkEvent();
    if (gQuestLogPlaybackState != QL_PLAYBACK_STATE_STOPPED || FlagGet(FLAG_SYS_GAME_CLEAR) || ShouldRegisterEvent_HandleBeatStoryTrainer(eventId, data) != TRUE)
    {
        sDeferredEvent.id = eventId;
        memcpy(sDeferredEvent.data, data, sizeof(struct QuestLogEvent_TrainerBattle));
    }
    return TRUE;
}

void QuestLogEvents_HandleEndTrainerBattle(void)
{
    if (sDeferredEvent.id != 0)
    {
        u16 *resp;
        if (gQuestLogPlaybackState == QL_PLAYBACK_STATE_STOPPED)
        {
            sLastDepartedLocation = 0;
            QL_StartRecordingAction(sDeferredEvent.id);
        }
        UpdateRepeatEventCounter(sDeferredEvent.id);
        resp = sRecordEventFuncs[sDeferredEvent.id](gQuestLogRecordingPointer, sDeferredEvent.data);
        gQuestLogRecordingPointer = resp;
        QL_RecordWait(1);
        ResetDeferredLinkEvent();
        QL_FinishRecordingScene();
    }
}

void QL_RecordWait(u16 duration)
{
    gQuestLogRecordingPointer = QL_RecordAction_Wait(gQuestLogRecordingPointer, duration);
    gQuestLogCurActionIdx++;
}

static bool8 IsEventWithSpecialEncounterSpecies(u16 eventId, const u16 * genericData)
{
    const struct QuestLogEvent_WildBattle * data;

    if (eventId != QL_EVENT_DEFEATED_WILD_MON)
        return FALSE;

    data = (struct QuestLogEvent_WildBattle *)genericData;

    if (IsSpeciesFromSpecialEncounter(data->defeatedSpecies) == TRUE)
        return TRUE;

    if (IsSpeciesFromSpecialEncounter(data->caughtSpecies) == TRUE)
        return TRUE;

    return FALSE;
}

u16 *QL_SkipCommand(u16 *curPtr, u16 **prevPtr_p)
{
    u16 eventId = curPtr[0] & QL_CMD_EVENT_MASK;
    u16 count = curPtr[0] >> QL_CMD_COUNT_SHIFT;

    if (eventId == QL_EVENT_DEFEATED_CHAMPION)
        count = 0;

    if (!IS_VALID_QL_EVENT(eventId))
        return NULL;

    *prevPtr_p = curPtr;
    return sQuestLogEventCmdSizes[eventId] + (sQuestLogEventCmdSizes[eventId] - CMD_HEADER_SIZE) * count + (void *)curPtr;
}

void QL_UpdateLastDepartedLocation(const u16 *a0)
{
    const u8 *r2 = (const u8 *)(a0 + 2);
    if ((a0[0] & QL_CMD_EVENT_MASK) != QL_EVENT_DEPARTED)
        sLastDepartedLocation = 0;
    else
        sLastDepartedLocation = r2[1] + 1;
}

bool8 QL_LoadEvent(const u16 *eventData)
{
    const u16 *r0 = eventData;

    if (eventData == NULL)
        return FALSE;
    if (r0[1] > gQuestLogCurActionIdx)
        return FALSE;

    sLoadEventFuncs[(r0[0] & QL_CMD_EVENT_MASK)](eventData);
    gQuestLogRepeatEventTracker.id = r0[0];
    gQuestLogRepeatEventTracker.numRepeats = (r0[0] & QL_CMD_COUNT_MASK) >> QL_CMD_COUNT_SHIFT;
    if (gQuestLogRepeatEventTracker.numRepeats != 0)
        gQuestLogRepeatEventTracker.counter = 1;
    return TRUE;
}

bool8 QL_TryRepeatEvent(const u16 *eventData)
{
    // This is the first for a new event, do nothing. Counter may be changed later by QL_LoadEvent.
    if (gQuestLogRepeatEventTracker.counter == 0)
        return FALSE;

    // Repeat event
    sLoadEventFuncs[gQuestLogRepeatEventTracker.id](eventData);
    if (++gQuestLogRepeatEventTracker.counter > gQuestLogRepeatEventTracker.numRepeats)
        QL_ResetRepeatEventTracker();
    return TRUE;
}

void QL_ResetRepeatEventTracker(void)
{
    gQuestLogRepeatEventTracker = (struct QuestLogRepeatEventTracker){};
}

static void UpdateRepeatEventCounter(u16 eventId)
{
    if (gQuestLogRepeatEventTracker.id != (u8)eventId || gQuestLogRepeatEventTracker.counter != gQuestLogCurActionIdx)
    {
        gQuestLogRepeatEventTracker.id = eventId;
        gQuestLogRepeatEventTracker.numRepeats = 0;
        gQuestLogRepeatEventTracker.counter = gQuestLogCurActionIdx;
    }
    // Allow 1 over the max. It will be recorded temporarily, ultimately replacing the oldest record.
    else if (gQuestLogRepeatEventTracker.numRepeats < MAX_CMD_REPEAT + 1)
    {
        gQuestLogRepeatEventTracker.numRepeats++;
    }
}

void QL_ResetEventStates(void)
{
    sNewlyEnteredMap = FALSE;
    sLastDepartedLocation = 0;
    sPlayedTheSlots = FALSE;
}

u16 *QL_RecordAction_SceneEnd(u16 *a0)
{
    if (!QL_IsRoomToSaveAction(a0, sQuestLogEventCmdSizes[QL_EVENT_SCENE_END]))
        return NULL;
    a0[0] = QL_EVENT_SCENE_END;
    return a0 + 1;
}

u16 *QL_LoadAction_SceneEnd(u16 *a0, struct QuestLogAction * a1)
{
    if (!QL_IsRoomToSaveAction(a0, sQuestLogEventCmdSizes[QL_EVENT_SCENE_END]))
        return NULL;
    a1->type = QL_ACTION_SCENE_END;
    a1->duration = 0;
    a1->data.raw[0] = 0;
    a1->data.raw[1] = 0;
    a1->data.raw[2] = 0;
    a1->data.raw[3] = 0;
    return a0 + 1;
}

static u16 *QL_RecordAction_Wait(u16 *a0, u16 duration)
{
    if (!QL_IsRoomToSaveAction(a0, sQuestLogEventCmdSizes[QL_EVENT_WAIT]))
        return NULL;
    a0[0] = QL_EVENT_WAIT;
    a0[1] = duration;
    return a0 + 2;
}

u16 *QL_LoadAction_Wait(u16 *a0, struct QuestLogAction * a1)
{
    if (!QL_IsRoomToSaveAction(a0, sQuestLogEventCmdSizes[QL_EVENT_WAIT]))
        return NULL;
    a1->type = QL_ACTION_WAIT;
    a1->duration = a0[1];
    a1->data.raw[0] = 0;
    a1->data.raw[1] = 0;
    a1->data.raw[2] = 0;
    a1->data.raw[3] = 0;
    return a0 + 2;
}

u16 *QL_RecordAction_Input(u16 *script, struct QuestLogAction * a1)
{
    u8 *r6 = (u8 *)script + 4;

    if (!QL_IsRoomToSaveAction(script, sQuestLogEventCmdSizes[QL_EVENT_INPUT]))
        return NULL;
    script[0] = QL_EVENT_INPUT;
    script[1] = a1->duration;
    r6[0] = a1->data.raw[0];
    r6[1] = a1->data.raw[1];
    r6[2] = a1->data.raw[2];
    r6[3] = a1->data.raw[3];
    return (u16 *)(r6 + 4);
}

u16 *QL_LoadAction_Input(u16 *a0, struct QuestLogAction * a1)
{
    u8 *r6 = (u8 *)a0 + 4;

    if (!QL_IsRoomToSaveAction(a0, sQuestLogEventCmdSizes[QL_EVENT_INPUT]))
        return NULL;
    a1->type = QL_ACTION_INPUT;
    a1->duration = a0[1];
    a1->data.raw[0] = r6[0];
    a1->data.raw[1] = r6[1];
    a1->data.raw[2] = r6[2];
    a1->data.raw[3] = r6[3];
    return (u16 *)(r6 + 4);
}

u16 *QL_RecordAction_MovementOrGfxChange(u16 *script, struct QuestLogAction * a1)
{
    u16 *r4 = script;
    u8 *r6 = (u8 *)script + 4;

    if (!QL_IsRoomToSaveAction(r4, sQuestLogEventCmdSizes[QL_EVENT_MOVEMENT]))
        return NULL;
    if (a1->type == QL_ACTION_MOVEMENT)
        r4[0] = QL_EVENT_MOVEMENT;
    else
        r4[0] = QL_EVENT_GFX_CHANGE;
    r4[1] = a1->duration;
    r6[0] = a1->data.raw[0];
    r6[1] = a1->data.raw[1];
    r6[2] = a1->data.raw[2];
    r6[3] = a1->data.raw[3];
    return (u16 *)(r6 + 4);
}

u16 *QL_LoadAction_MovementOrGfxChange(u16 *a0, struct QuestLogAction * a1)
{
    u16 *r5 = a0;
    u8 *r6 = (u8 *)a0 + 4;

    if (!QL_IsRoomToSaveAction(r5, sQuestLogEventCmdSizes[QL_EVENT_MOVEMENT]))
        return NULL;
    if (r5[0] == QL_EVENT_MOVEMENT)
        a1->type = QL_ACTION_MOVEMENT;
    else
        a1->type = QL_ACTION_GFX_CHANGE;
    a1->duration = r5[1];
    a1->data.raw[0] = r6[0];
    a1->data.raw[1] = r6[1];
    a1->data.raw[2] = r6[2];
    a1->data.raw[3] = r6[3];
    return (u16 *)(r6 + 4);
}

static u16 *RecordEventHeader(u16 eventId, u16 *dest)
{
    u8 cmdSize;
    u16 *record;
    u8 i;
    u8 count;

    if (gQuestLogRepeatEventTracker.numRepeats == 0)
        cmdSize = sQuestLogEventCmdSizes[eventId];
    else
        cmdSize = sQuestLogEventCmdSizes[eventId] - CMD_HEADER_SIZE; // First will already have the header

    if (!QL_IsRoomToSaveEvent(dest, cmdSize))
        return NULL;

    record = (void *)dest;

    if (gQuestLogRepeatEventTracker.numRepeats != 0)
        record = (void *)record - (gQuestLogRepeatEventTracker.numRepeats * cmdSize + CMD_HEADER_SIZE);

    if (gQuestLogRepeatEventTracker.numRepeats == MAX_CMD_REPEAT + 1)
    {
        // Shift back one, replacing oldest
        for (i = 0; i < MAX_CMD_REPEAT; i++)
        {
            memcpy(
                (void *)record + ((i + 0) * cmdSize + CMD_HEADER_SIZE),
                (void *)record + ((i + 1) * cmdSize + CMD_HEADER_SIZE),
                cmdSize
            );
        }
        count = MAX_CMD_REPEAT;
    }
    else
        count = gQuestLogRepeatEventTracker.numRepeats;

    // Set header data (CMD_HEADER_SIZE)
    record[0] = eventId + (count << QL_CMD_COUNT_SHIFT);
    record[1] = gQuestLogCurActionIdx;

    // Move past header and event data
    record = (void *)record + (count * cmdSize + CMD_HEADER_SIZE);
    return record;
}

static const u16 *LoadEvent(u16 eventId, const u16 *eventData)
{
    eventData = (const void *)eventData + (gQuestLogRepeatEventTracker.counter * (sQuestLogEventCmdSizes[eventId] - CMD_HEADER_SIZE) + CMD_HEADER_SIZE);
    return eventData;
}

static void QuestLog_GetSpeciesName(u16 species, u8 *dest, u8 stringVarId)
{
    if (dest != NULL)
    {
        if (species != SPECIES_EGG)
            GetSpeciesName(dest, species);
        else
            StringCopy(dest, gText_EggNickname);
    }
    else
    {
        if (species != SPECIES_EGG)
            DynamicPlaceholderTextUtil_SetPlaceholderPtr(stringVarId, gSpeciesNames[species]);
        else
            DynamicPlaceholderTextUtil_SetPlaceholderPtr(stringVarId, gText_EggNickname);
    }
}

static u16 *RecordEvent_SwitchedPartyOrder(u16 *dest, const struct QuestLogEvent_SwitchedPartyOrder * data)
{
    u16 *r2 = RecordEventHeader(QL_EVENT_SWITCHED_PARTY_ORDER, dest);
    if (r2 == NULL)
        return NULL;

    r2[0] = data->species1;
    r2[1] = data->species2;
    return r2 + 2;
}

static const u16 *LoadEvent_SwitchedPartyOrder(const u16 *eventData)
{
    const u16 *r4 = LoadEvent(QL_EVENT_SWITCHED_PARTY_ORDER, eventData);
    QuestLog_GetSpeciesName(r4[0], gStringVar1, 0);
    QuestLog_GetSpeciesName(r4[1], gStringVar2, 0);
    StringExpandPlaceholders(gStringVar4, gText_QuestLog_SwitchMon1WithMon2);
    return r4 + 2;
}

#define rItemId    record[0]
#define rSpecies   record[1]
#define rItemParam record[2]

static u16 *RecordEvent_UsedItem(u16 *dest, const struct QuestLogEvent_Item * data)
{
    u16 *record = RecordEventHeader(QL_EVENT_USED_ITEM, dest);
    if (record == NULL)
        return NULL;

    rItemId = data->itemId;
    rSpecies = data->species;
    rItemParam = data->itemParam;

    if (data->itemId == ITEM_ESCAPE_ROPE)
        sStepRecordingMode = STEP_RECORDING_MODE_DISABLED_UNTIL_DEPART;

    return record + 3;
}

static const u16 *LoadEvent_UsedItem(const u16 *eventData)
{
    const u16 *record = LoadEvent(QL_EVENT_USED_ITEM, eventData);

    switch (ItemId_GetPocket(rItemId))
    {
    case POCKET_ITEMS:
    case POCKET_POKE_BALLS:
    case POCKET_BERRY_POUCH:
        StringCopy(gStringVar1, ItemId_GetName(rItemId));
        if (rItemId == ITEM_ESCAPE_ROPE)
        {
            GetMapNameGeneric(gStringVar2, (u8)rItemParam);
            StringExpandPlaceholders(gStringVar4, gText_QuestLog_UsedEscapeRope);
        }
        else if (rSpecies != 0xFFFF)
        {
            QuestLog_GetSpeciesName(rSpecies, gStringVar2, 0);
            StringExpandPlaceholders(gStringVar4, gText_QuestLog_UsedItemOnMonAtThisLocation);
        }
        else
        {
            StringExpandPlaceholders(gStringVar4, gText_QuestLog_UsedTheItem);
        }
        break;
    case POCKET_KEY_ITEMS:
        StringCopy(gStringVar1, ItemId_GetName(rItemId));
        StringExpandPlaceholders(gStringVar4, gText_QuestLog_UsedTheKeyItem);
        break;
    case POCKET_TM_CASE:
        QuestLog_GetSpeciesName(rSpecies, gStringVar1, 0);
        StringCopy(gStringVar2, gMoveNames[ItemIdToBattleMoveId(rItemId)]);
        if (rItemParam != 0xFFFF)
        {
            StringCopy(gStringVar3, gMoveNames[rItemParam]);
            if (rItemId >= ITEM_HM01)
                StringExpandPlaceholders(gStringVar4, gText_QuestLog_MonReplacedMoveWithHM);
            else
                StringExpandPlaceholders(gStringVar4, gText_QuestLog_MonReplacedMoveWithTM);
        }
        else
        {
            if (rItemId >= ITEM_HM01)
                StringExpandPlaceholders(gStringVar4, gText_QuestLog_MonLearnedMoveFromHM);
            else
                StringExpandPlaceholders(gStringVar4, gText_QuestLog_MonLearnedMoveFromTM);
        }
        break;
    }
    return record + 3;
}

static u16 *RecordEvent_GiveTakeHeldItem(u16 eventId, u16 *dest, const struct QuestLogEvent_Item * data)
{
    u16 *record = RecordEventHeader(eventId, dest);
    if (record == NULL)
        return NULL;

    rItemId = data->itemId;
    rSpecies = data->species;
    return record + 2;
}

static u16 *RecordEvent_GaveHeldItemFromPartyMenu(u16 *dest, const struct QuestLogEvent_Item * data)
{
    return RecordEvent_GiveTakeHeldItem(QL_EVENT_GAVE_HELD_ITEM, dest, data);
}

static const u16 *LoadEvent_GaveHeldItemFromPartyMenu(const u16 * eventData)
{
    const u16 *record = LoadEvent(QL_EVENT_GAVE_HELD_ITEM, eventData);
    QuestLog_GetSpeciesName(rSpecies, gStringVar1, 0);
    StringCopy(gStringVar2, ItemId_GetName(rItemId));
    StringExpandPlaceholders(gStringVar4, gText_QuestLog_GaveMonHeldItem);
    return record + 2;
}

static u16 *RecordEvent_GaveHeldItemFromBagMenu(u16 *dest, const struct QuestLogEvent_Item * data)
{
    return RecordEvent_GiveTakeHeldItem(QL_EVENT_GAVE_HELD_ITEM_BAG, dest, data);
}

static const u16 *LoadEvent_GaveHeldItemFromBagMenu(const u16 *eventData)
{
    const u16 *record = LoadEvent(QL_EVENT_GAVE_HELD_ITEM_BAG, eventData);
    QuestLog_GetSpeciesName(rSpecies, gStringVar1, 0);
    StringCopy(gStringVar2, ItemId_GetName(rItemId));
    StringExpandPlaceholders(gStringVar4, gText_QuestLog_GaveMonHeldItem2);
    return record + 2;
}

static u16 *RecordEvent_GaveHeldItemFromPC(u16 *dest, const struct QuestLogEvent_Item * data)
{
    return RecordEvent_GiveTakeHeldItem(QL_EVENT_GAVE_HELD_ITEM_PC, dest, data);
}

static const u16 *LoadEvent_GaveHeldItemFromPC(const u16 *eventData)
{
    const u16 *record = LoadEvent(QL_EVENT_GAVE_HELD_ITEM_PC, eventData);

    QuestLog_GetSpeciesName(rSpecies, gStringVar2, 0);
    StringCopy(gStringVar1, ItemId_GetName(rItemId));
    StringExpandPlaceholders(gStringVar4, gText_QuestLog_GaveMonHeldItemFromPC);
    return record + 2;
}

static u16 *RecordEvent_TookHeldItem(u16 *dest, const struct QuestLogEvent_Item * data)
{
    return RecordEvent_GiveTakeHeldItem(QL_EVENT_TOOK_HELD_ITEM, dest, data);
}

static const u16 *LoadEvent_TookHeldItem(const u16 *eventData)
{
    const u16 *record = LoadEvent(QL_EVENT_TOOK_HELD_ITEM, eventData);

    QuestLog_GetSpeciesName(rSpecies, gStringVar1, 0);
    StringCopy(gStringVar2, ItemId_GetName(rItemId));
    StringExpandPlaceholders(gStringVar4, gText_QuestLog_TookHeldItemFromMon);
    return record + 2;
}

#undef rItemId
#undef rSpecies
#undef rItemParam

#define rTakenItemId record[0]
#define rGivenItemId record[1]
#define rSpecies     record[2]

static u16 *RecordEvent_SwappedHeldItem(u16 eventId, u16 *dest, const struct QuestLogEvent_SwappedHeldItem * data)
{
    u16 *record = RecordEventHeader(eventId, dest);
    if (record == NULL)
        return NULL;

    rTakenItemId = data->takenItemId;
    rGivenItemId = data->givenItemId;
    rSpecies = data->species;
    return record + 3;
}

static u16 *RecordEvent_SwappedHeldItemFromBag(u16 *dest, const struct QuestLogEvent_SwappedHeldItem * data)
{
    return RecordEvent_SwappedHeldItem(QL_EVENT_SWAPPED_HELD_ITEM, dest, data);
}

static const u16 *LoadEvent_SwappedHeldItem(const u16 *eventData)
{
    const u16 *record = LoadEvent(QL_EVENT_SWAPPED_HELD_ITEM, eventData);
    QuestLog_GetSpeciesName(rSpecies, gStringVar1, 0);
    StringCopy(gStringVar2, ItemId_GetName(rTakenItemId));
    StringCopy(gStringVar3, ItemId_GetName(rGivenItemId));
    StringExpandPlaceholders(gStringVar4, gText_QuestLog_SwappedHeldItemsOnMon);
    return record + 3;
}

static u16 *RecordEvent_SwappedHeldItemFromPC(u16 *dest, const struct QuestLogEvent_SwappedHeldItem * data)
{
    return RecordEvent_SwappedHeldItem(QL_EVENT_SWAPPED_HELD_ITEM_PC, dest, data);
}

static const u16 *LoadEvent_SwappedHeldItemFromPC(const u16 *eventData)
{
    const u16 *record = LoadEvent(QL_EVENT_SWAPPED_HELD_ITEM_PC, eventData);
    QuestLog_GetSpeciesName(rSpecies, gStringVar2, 0);
    StringCopy(gStringVar3, ItemId_GetName(rTakenItemId));
    StringCopy(gStringVar1, ItemId_GetName(rGivenItemId));
    StringExpandPlaceholders(gStringVar4, gText_QuestLog_SwappedHeldItemFromPC);
    return record + 3;
}

#undef rTakenItemId
#undef rGivenItemId
#undef rSpecies

// data argument will be a null pointer, no information needed for this event
static u16 *RecordEvent_UsedPkmnCenter(u16 *dest, const u16 * data)
{
    u16 *record = dest;
    if (gQuestLogRepeatEventTracker.id == QL_EVENT_USED_PKMN_CENTER && gQuestLogRepeatEventTracker.numRepeats != 0)
        return record;

    if (!QL_IsRoomToSaveEvent(dest, sQuestLogEventCmdSizes[QL_EVENT_USED_PKMN_CENTER]))
        return NULL;

    record[0] = QL_EVENT_USED_PKMN_CENTER;
    record[1] = gQuestLogCurActionIdx;
    return record + 2;
}

static const u16 *LoadEvent_UsedPkmnCenter(const u16 *eventData)
{
    StringExpandPlaceholders(gStringVar4, gText_QuestLog_MonsWereFullyRestoredAtCenter);
    return eventData + 2;
}

static u16 *RecordEvent_LinkTraded(u16 *dest, const struct QuestLogEvent_Traded * data)
{
    u16 *nameDest = dest + 4;

    dest[0] = QL_EVENT_LINK_TRADED;
    dest[1] = gQuestLogCurActionIdx;
    dest[2] = data->speciesSent;
    dest[3] = data->speciesReceived;
    memcpy(nameDest, data->partnerName, PLAYER_NAME_LENGTH);
    return nameDest + 4;
}

static const u16 *LoadEvent_LinkTraded(const u16 *eventData)
{
    const u16 *name = eventData + 4;

    memset(gStringVar1, EOS, PLAYER_NAME_LENGTH + 1);
    memcpy(gStringVar1, name, PLAYER_NAME_LENGTH);

    TranslateLinkPartnersName(gStringVar1);
    QuestLog_GetSpeciesName(eventData[3], gStringVar2, 0); // Mon received
    QuestLog_GetSpeciesName(eventData[2], gStringVar3, 0); // Mon sent
    StringExpandPlaceholders(gStringVar4, gText_QuestLog_TradedMon1ForPersonsMon2);
    return name + 4;
}

#define rOutcome      record[0]
#define rBattler1Name record[1]
#define rBattler2Name record[1 + PLAYER_NAME_LENGTH]
#define rBattler3Name record[1 + PLAYER_NAME_LENGTH * 2]

static u16 *RecordEvent_LinkBattledSingle(u16 *dest, const struct QuestLogEvent_LinkBattle * data)
{
    u8 * record;

    dest[0] = QL_EVENT_LINK_BATTLED_SINGLE;
    dest[1] = gQuestLogCurActionIdx;
    record = (u8 *)(dest + 2);

    rOutcome = data->outcome;
    memcpy(&rBattler1Name, data->playerNames[0], PLAYER_NAME_LENGTH);
    return (u16 *)(record + 1 + PLAYER_NAME_LENGTH);
}

static const u16 *LoadEvent_LinkBattledSingle(const u16 *eventData)
{
    const u8 * record = (const u8 *)(eventData + 2);
    DynamicPlaceholderTextUtil_Reset();

    memset(gStringVar1, EOS, PLAYER_NAME_LENGTH + 1);
    memcpy(gStringVar1, &rBattler1Name, PLAYER_NAME_LENGTH);
    TranslateLinkPartnersName(gStringVar1);
    DynamicPlaceholderTextUtil_SetPlaceholderPtr(0, gStringVar1);
    DynamicPlaceholderTextUtil_SetPlaceholderPtr(1, sBattleOutcomeTexts[rOutcome]);
    DynamicPlaceholderTextUtil_ExpandPlaceholders(gStringVar4, gText_QuestLog_SingleBattleWithPersonResultedInOutcome);
    return (const u16 *)(record + 1 + PLAYER_NAME_LENGTH);
}

static u16 *RecordEvent_LinkBattledDouble(u16 *dest, const struct QuestLogEvent_LinkBattle * data)
{
    u8 * record;

    dest[0] = QL_EVENT_LINK_BATTLED_DOUBLE;
    dest[1] = gQuestLogCurActionIdx;
    record = (u8 *)(dest + 2);

    rOutcome = data->outcome;
    memcpy(&rBattler1Name, data->playerNames[0], PLAYER_NAME_LENGTH);
    return (u16 *)(record + 1 + PLAYER_NAME_LENGTH);
}

static const u16 *LoadEvent_LinkBattledDouble(const u16 *eventData)
{
    const u8 * record = (const u8 *)(eventData + 2);
    DynamicPlaceholderTextUtil_Reset();

    memset(gStringVar1, EOS, PLAYER_NAME_LENGTH + 1);
    memcpy(gStringVar1, &rBattler1Name, PLAYER_NAME_LENGTH);
    TranslateLinkPartnersName(gStringVar1);
    DynamicPlaceholderTextUtil_SetPlaceholderPtr(0, gStringVar1);
    DynamicPlaceholderTextUtil_SetPlaceholderPtr(1, sBattleOutcomeTexts[rOutcome]);
    DynamicPlaceholderTextUtil_ExpandPlaceholders(gStringVar4, gText_QuestLog_DoubleBattleWithPersonResultedInOutcome);
    return (const u16 *)(record + 1 + PLAYER_NAME_LENGTH);
}

static u16 *RecordEvent_LinkBattledMulti(u16 *dest, const struct QuestLogEvent_LinkBattle * data)
{
    u8 * record;

    dest[0] = QL_EVENT_LINK_BATTLED_MULTI;
    dest[1] = gQuestLogCurActionIdx;
    record = (u8 *)(dest + 2);

    rOutcome = data->outcome;
    memcpy(&rBattler1Name, data->playerNames[0], PLAYER_NAME_LENGTH);
    memcpy(&rBattler2Name, data->playerNames[1], PLAYER_NAME_LENGTH);
    memcpy(&rBattler3Name, data->playerNames[2], PLAYER_NAME_LENGTH);
    return (u16 *)(record + 1 + PLAYER_NAME_LENGTH * 3);
}

static const u16 *LoadEvent_LinkBattledMulti(const u16 *eventData)
{
    const u8 * record = (const u8 *)(eventData + 2);
    DynamicPlaceholderTextUtil_Reset();

    memset(gStringVar1, EOS, PLAYER_NAME_LENGTH + 1);
    memset(gStringVar2, EOS, PLAYER_NAME_LENGTH + 1);
    memset(gStringVar3, EOS, PLAYER_NAME_LENGTH + 1);
    StringCopy_PlayerName(gStringVar1, &rBattler1Name);
    StringCopy_PlayerName(gStringVar2, &rBattler2Name);
    StringCopy_PlayerName(gStringVar3, &rBattler3Name);
    TranslateLinkPartnersName(gStringVar1);
    TranslateLinkPartnersName(gStringVar2);
    TranslateLinkPartnersName(gStringVar3);
    DynamicPlaceholderTextUtil_SetPlaceholderPtr(0, gSaveBlock2Ptr->playerName);
    DynamicPlaceholderTextUtil_SetPlaceholderPtr(1, gStringVar1); // partner
    DynamicPlaceholderTextUtil_SetPlaceholderPtr(2, gStringVar2); // opponent 1
    DynamicPlaceholderTextUtil_SetPlaceholderPtr(3, gStringVar3); // opponent 2
    DynamicPlaceholderTextUtil_SetPlaceholderPtr(4, sBattleOutcomeTexts[rOutcome]);
    DynamicPlaceholderTextUtil_ExpandPlaceholders(gStringVar4, gText_QuestLog_MultiBattleWithPeopleResultedInOutcome);
    return (const u16 *)(record + 1 + PLAYER_NAME_LENGTH * 3);
}

// data argument will be a null pointer, no information needed for this event
static u16 *RecordEvent_UsedUnionRoom(u16 *dest, const u16 * data)
{
    dest[0] = QL_EVENT_USED_UNION_ROOM;
    dest[1] = gQuestLogCurActionIdx;
    return dest + 2;
}

static const u16 *LoadEvent_UsedUnionRoom(const u16 *eventData)
{
    StringExpandPlaceholders(gStringVar4, gText_QuestLog_MingledInUnionRoom);
    return eventData + 2;
}

// data argument will be a null pointer, no information needed for this event
static u16 *RecordEvent_UsedUnionRoomChat(u16 *dest, const u16 * data)
{
    dest[0] = QL_EVENT_USED_UNION_ROOM_CHAT;
    dest[1] = gQuestLogCurActionIdx;
    return dest + 2;
}

static const u16 *LoadEvent_UsedUnionRoomChat(const u16 *eventData)
{
    StringExpandPlaceholders(gStringVar4, gText_QuestLog_ChattedWithManyTrainers);
    return eventData + 2;
}

static u16 *RecordEvent_LinkTradedUnionRoom(u16 *dest, const struct QuestLogEvent_Traded * data)
{
    u8 *name = (u8 *)(dest + 4);
    dest[0] = QL_EVENT_LINK_TRADED_UNION;
    dest[1] = gQuestLogCurActionIdx;
    dest[2] = data->speciesSent;
    dest[3] = data->speciesReceived;
    memcpy(name, &data->partnerName, PLAYER_NAME_LENGTH);
    return (u16 *)(name + 8);
}

static const u16 *LoadEvent_LinkTradedUnionRoom(const u16 *a0)
{
    const u8 *r6 = (const u8 *)(a0 + 4);
    memset(gStringVar1, EOS, PLAYER_NAME_LENGTH + 1);
    memcpy(gStringVar1, r6, PLAYER_NAME_LENGTH);
    TranslateLinkPartnersName(gStringVar1);
    QuestLog_GetSpeciesName(a0[3], gStringVar2, 0);
    QuestLog_GetSpeciesName(a0[2], gStringVar3, 0);
    StringExpandPlaceholders(gStringVar4, gText_QuestLog_TradedMon1ForTrainersMon2);
    return (const u16 *)(r6 + 8);
}

static u16 *RecordEvent_LinkBattledUnionRoom(u16 *dest, const struct QuestLogEvent_LinkBattle * data)
{
    dest[0] = QL_EVENT_LINK_BATTLED_UNION;
    dest[1] = gQuestLogCurActionIdx;
    *(u8 *)&dest[2] = data->outcome;
    memcpy((u8 *)dest + 5, &data->playerNames[0], PLAYER_NAME_LENGTH);
    return dest + 6;
}

static const u16 *LoadEvent_LinkBattledUnionRoom(const u16 *eventData)
{
    const u8 * record = (const u8 *)(eventData + 2);

    memset(gStringVar1, EOS, PLAYER_NAME_LENGTH + 1);
    memcpy(gStringVar1, &rBattler1Name, PLAYER_NAME_LENGTH);
    TranslateLinkPartnersName(gStringVar1);
    StringCopy(gStringVar2, sBattleOutcomeTexts[rOutcome]);
    StringExpandPlaceholders(gStringVar4, gText_QuestLog_BattledTrainerEndedInOutcome);
    return (const u16 *)(record + 1 + PLAYER_NAME_LENGTH);
}

#undef rOutcome
#undef rBattler1Name
#undef rBattler2Name
#undef rBattler3Name

#define rSpecies1 record[0]
#define rSpecies2 record[1]
#define rBox1     (*((u8*)&record[2] + 0)) // 1st byte of record[2]
#define rBox2     (*((u8*)&record[2] + 1)) // 2nd byte of record[2]

static u16 *RecordEvent_SwitchedMonsBetweenBoxes(u16 *dest, const struct QuestLogEvent_MovedBoxMon * data)
{
    u16 * record = RecordEventHeader(QL_EVENT_SWITCHED_MONS_BETWEEN_BOXES, dest);
    if (record == NULL)
        return NULL;
    rSpecies1 = data->species1;
    rSpecies2 = data->species2;
    rBox1 = data->box1;
    rBox2 = data->box2;
    return record + 3;
}

static const u16 *LoadEvent_SwitchedMonsBetweenBoxes(const u16 *eventData)
{
    const u8 *boxIdxs;
    const u16 * r0 = LoadEvent(QL_EVENT_SWITCHED_MONS_BETWEEN_BOXES, eventData);
    boxIdxs = (const u8 *)r0 + 4;
    DynamicPlaceholderTextUtil_Reset();
    DynamicPlaceholderTextUtil_SetPlaceholderPtr(0, GetBoxNamePtr(boxIdxs[0]));
    QuestLog_GetSpeciesName(r0[0], NULL, 1);
    DynamicPlaceholderTextUtil_SetPlaceholderPtr(2, GetBoxNamePtr(boxIdxs[1]));
    QuestLog_GetSpeciesName(r0[1], NULL, 3);
    DynamicPlaceholderTextUtil_ExpandPlaceholders(gStringVar4, gText_QuestLog_SwitchedMonsBetweenBoxes);
    return r0 + 3;
}

static u16 *RecordEvent_SwitchedMonsWithinBox(u16 *dest, const u16 *eventData)
{
    dest = RecordEventHeader(QL_EVENT_SWITCHED_MONS_WITHIN_BOX, dest);
    if (dest == NULL)
        return NULL;
    dest[0] = eventData[0];
    dest[1] = eventData[1];
    *((u8 *)dest + 4) = *((const u8 *)eventData + 4);
    return dest + 3;
}

static const u16 *LoadEvent_SwitchedMonsWithinBox(const u16 *eventData)
{
    const u8 *boxIdxs;
    eventData = LoadEvent(QL_EVENT_SWITCHED_MONS_WITHIN_BOX, eventData);
    boxIdxs = (const u8 *)eventData + 4;
    DynamicPlaceholderTextUtil_Reset();
    DynamicPlaceholderTextUtil_SetPlaceholderPtr(0, GetBoxNamePtr(boxIdxs[0]));
    QuestLog_GetSpeciesName(eventData[0], NULL, 1);
    QuestLog_GetSpeciesName(eventData[1], NULL, 2);
    DynamicPlaceholderTextUtil_ExpandPlaceholders(gStringVar4, gText_QuestLog_SwitchedMonsWithinBox);
    return eventData + 3;
}

static u16 *RecordEvent_SwitchedPartyMonForPCMon(u16 *dest, const u16 *eventData)
{
    u16 *r2;
    u16 *ret;
    r2 = RecordEventHeader(QL_EVENT_SWITCHED_PARTY_MON_FOR_PC_MON, dest);
    if (r2 == NULL)
        return NULL;
    ret = r2 + 2;
    if (*((const u8 *)eventData + 4) == TOTAL_BOXES_COUNT)
    {
        r2[0] = eventData[1];
        r2[1] = eventData[0];
        *((u8 *)r2 + 4) = *((const u8 *)eventData + 5);
    }
    else
    {
        r2[0] = eventData[0];
        r2[1] = eventData[1];
        *((u8 *)r2 + 4) = *((const u8 *)eventData + 4);
    }
    return ret + 1;
}

static const u16 *LoadEvent_SwitchedPartyMonForPCMon(const u16 *eventData)
{
    const u8 *boxIdxs;
    eventData = LoadEvent(QL_EVENT_SWITCHED_PARTY_MON_FOR_PC_MON, eventData);
    boxIdxs = (const u8 *)eventData + 4;
    DynamicPlaceholderTextUtil_Reset();
    DynamicPlaceholderTextUtil_SetPlaceholderPtr(0, GetBoxNamePtr(boxIdxs[0]));
    QuestLog_GetSpeciesName(eventData[0], NULL, 1);
    QuestLog_GetSpeciesName(eventData[1], NULL, 2);
    DynamicPlaceholderTextUtil_ExpandPlaceholders(gStringVar4, gText_QuestLog_SwitchedPartyMonForPCMon);
    return eventData + 3;
}

static u16 *RecordEvent_MovedMonBetweenBoxes(u16 *dest, const u16 *eventData)
{
    u16 *r2;
    u16 *ret;
    r2 = RecordEventHeader(QL_EVENT_MOVED_MON_BETWEEN_BOXES, dest);
    if (r2 == NULL)
        return NULL;
    r2[0] = eventData[0];
    ret = r2 + 1;
    *((u8 *)ret + 0) = *((const u8 *)eventData + 4);
    *((u8 *)ret + 1) = *((const u8 *)eventData + 5);
    return ret + 1;
}

static const u16 *LoadEvent_MovedMonBetweenBoxes(const u16 *eventData)
{
    const u8 *boxIdxs;
    eventData = LoadEvent(QL_EVENT_MOVED_MON_BETWEEN_BOXES, eventData);
    boxIdxs = (const u8 *)eventData + 2;
    DynamicPlaceholderTextUtil_Reset();
    DynamicPlaceholderTextUtil_SetPlaceholderPtr(0, GetBoxNamePtr(boxIdxs[0]));
    QuestLog_GetSpeciesName(eventData[0], NULL, 1);
    DynamicPlaceholderTextUtil_SetPlaceholderPtr(2, GetBoxNamePtr(boxIdxs[1]));
    DynamicPlaceholderTextUtil_ExpandPlaceholders(gStringVar4, gText_QuestLog_MovedMonToNewBox);
    return (const u16 *)boxIdxs + 1;
}

static u16 *RecordEvent_MovedMonWithinBox(u16 *dest, const u16 *eventData)
{
    u16 *r2;
    r2 = RecordEventHeader(QL_EVENT_MOVED_MON_WITHIN_BOX, dest);
    if (r2 == NULL)
        return NULL;
    r2[0] = eventData[0];
    *((u8 *)r2 + 2) = *((const u8 *)eventData + 4);
    return r2 + 2;
}

static const u16 *LoadEvent_MovedMonWithinBox(const u16 *eventData)
{
    const u8 *boxIdxs;
    eventData = LoadEvent(QL_EVENT_MOVED_MON_WITHIN_BOX, eventData);
    boxIdxs = (const u8 *)eventData + 2;
    DynamicPlaceholderTextUtil_Reset();
    DynamicPlaceholderTextUtil_SetPlaceholderPtr(0, GetBoxNamePtr(boxIdxs[0]));
    QuestLog_GetSpeciesName(eventData[0], NULL, 1);
    DynamicPlaceholderTextUtil_ExpandPlaceholders(gStringVar4, gText_QuestLog_MovedMonWithinBox);
    return (const u16 *)boxIdxs + 1;
}

static u16 *RecordEvent_WithdrewMonFromPC(u16 *dest, const u16 *eventData)
{
    u16 *r2;
    r2 = RecordEventHeader(QL_EVENT_WITHDREW_MON_PC, dest);
    if (r2 == NULL)
        return NULL;
    r2[0] = eventData[0];
    *((u8 *)r2 + 2) = *((const u8 *)eventData + 4);
    return r2 + 2;
}

static const u16 *LoadEvent_WithdrewMonFromPC(const u16 *eventData)
{
    const u8 *boxIdxs;
    eventData = LoadEvent(QL_EVENT_WITHDREW_MON_PC, eventData);
    boxIdxs = (const u8 *)eventData + 2;
    DynamicPlaceholderTextUtil_Reset();
    DynamicPlaceholderTextUtil_SetPlaceholderPtr(0, GetBoxNamePtr(boxIdxs[0]));
    QuestLog_GetSpeciesName(eventData[0], NULL, 1);
    DynamicPlaceholderTextUtil_ExpandPlaceholders(gStringVar4, gText_QuestLog_WithdrewMonFromPC);
    return (const u16 *)boxIdxs + 1;
}

static u16 *RecordEvent_DepositedMonInPC(u16 *dest, const u16 *eventData)
{
    u16 *r2;
    r2 = RecordEventHeader(QL_EVENT_DEPOSITED_MON_PC, dest);
    if (r2 == NULL)
        return NULL;
    r2[0] = eventData[0];
    *((u8 *)r2 + 2) = *((const u8 *)eventData + 4);
    return r2 + 2;
}

static const u16 *LoadEvent_DepositedMonInPC(const u16 *eventData)
{
    const u8 *boxIdxs;
    eventData = LoadEvent(QL_EVENT_DEPOSITED_MON_PC, eventData);
    boxIdxs = (const u8 *)eventData + 2;
    DynamicPlaceholderTextUtil_Reset();
    QuestLog_GetSpeciesName(eventData[0], NULL, 0);
    DynamicPlaceholderTextUtil_SetPlaceholderPtr(1, GetBoxNamePtr(boxIdxs[0]));
    DynamicPlaceholderTextUtil_ExpandPlaceholders(gStringVar4, gText_QuestLog_DepositedMonInPC);
    return (const u16 *)boxIdxs + 1;
}

static u16 *RecordEvent_SwitchedMultipleMons(u16 *dest, const u16 *eventData)
{
    u16 *r2;
    r2 = RecordEventHeader(QL_EVENT_SWITCHED_MULTIPLE_MONS, dest);
    if (r2 == NULL)
        return NULL;
    *((u8 *)r2 + 0) = *((const u8 *)eventData + 4);
    *((u8 *)r2 + 1) = *((const u8 *)eventData + 5);
    return r2 + 1;
}

static const u16 *LoadEvent_SwitchedMultipleMons(const u16 *eventData)
{
    const u16 *r4 = LoadEvent(QL_EVENT_SWITCHED_MULTIPLE_MONS, eventData);
    DynamicPlaceholderTextUtil_Reset();
    DynamicPlaceholderTextUtil_SetPlaceholderPtr(0, GetBoxNamePtr(*((const u8 *)r4 + 0)));
    if (*((const u8 *)r4 + 0) == *((const u8 *)r4 + 1))
        DynamicPlaceholderTextUtil_SetPlaceholderPtr(1, gText_QuestLog_ADifferentSpot);
    else
        DynamicPlaceholderTextUtil_SetPlaceholderPtr(1, GetBoxNamePtr(*((const u8 *)r4 + 1)));
    DynamicPlaceholderTextUtil_ExpandPlaceholders(gStringVar4, gText_QuestLog_SwitchedMultipleMons);
    return r4 + 1;
}

#undef rSpecies1
#undef rSpecies2
#undef rBox1
#undef rBox2

#define rItemId record[0]

static u16 *RecordEvent_DepositedItemInPC(u16 *dest, const struct QuestLogEvent_Item * data)
{
    u16 * record = RecordEventHeader(QL_EVENT_DEPOSITED_ITEM_PC, dest);
    if (record == NULL)
        return NULL;
    rItemId = data->itemId;
    return record + 1;
}

static const u16 *LoadEvent_DepositedItemInPC(const u16 *eventData)
{
    const u16 *record = LoadEvent(QL_EVENT_DEPOSITED_ITEM_PC, eventData);
    CopyItemName(rItemId, gStringVar1);
    StringExpandPlaceholders(gStringVar4, gText_QuestLog_StoredItemInPC);
    return record + 1;
}

static u16 *RecordEvent_WithdrewItemFromPC(u16 *dest, const struct QuestLogEvent_Item * data)
{
    u16 * record = RecordEventHeader(QL_EVENT_WITHDREW_ITEM_PC, dest);
    if (record == NULL)
        return NULL;
    rItemId = data->itemId;
    return record + 1;
}

static const u16 *LoadEvent_WithdrewItemFromPC(const u16 *eventData)
{
    const u16 *record = LoadEvent(QL_EVENT_WITHDREW_ITEM_PC, eventData);
    CopyItemName(rItemId, gStringVar1);
    StringExpandPlaceholders(gStringVar4, gText_QuestLog_WithdrewItemFromPC);
    return record + 1;
}

#undef rItemId

#define rSpeciesOpponent record[0]
#define rSpeciesPlayer   record[1]
#define rTrainerId       record[2]
#define rMapSec          (*((u8*)&record[3] + 0)) // 1st byte of record[3]
#define rHpFractionId    (*((u8*)&record[3] + 1)) // 2nd byte of record[3]

static u16 *RecordEvent_DefeatedTrainer(u16 eventId, u16 *dest, const struct QuestLogEvent_TrainerBattle * data)
{
    u16 * record = RecordEventHeader(eventId, dest);
    if (record == NULL)
        return NULL;
    rSpeciesOpponent = data->speciesOpponent;
    rSpeciesPlayer = data->speciesPlayer;
    rTrainerId = data->trainerId;
    rMapSec = data->mapSec;
    rHpFractionId = data->hpFractionId;
    return record + 4;
}

static u16 *RecordEvent_DefeatedGymLeader(u16 *dest, const struct QuestLogEvent_TrainerBattle * data)
{
    sStepRecordingMode = STEP_RECORDING_MODE_DISABLED;
    return RecordEvent_DefeatedTrainer(QL_EVENT_DEFEATED_GYM_LEADER, dest, data);
}

static const u16 *LoadEvent_DefeatedGymLeader(const u16 *eventData)
{
    const u8 *r6;
    eventData = LoadEvent(QL_EVENT_DEFEATED_GYM_LEADER, eventData);
    r6 = (const u8 *)eventData + 6;
    DynamicPlaceholderTextUtil_Reset();
    GetMapNameGeneric(gStringVar1, r6[0]);
    DynamicPlaceholderTextUtil_SetPlaceholderPtr(0, gStringVar1);
    DynamicPlaceholderTextUtil_SetPlaceholderPtr(1, gTrainers[eventData[2]].trainerName);
    QuestLog_GetSpeciesName(eventData[0], 0, 2);
    QuestLog_GetSpeciesName(eventData[1], 0, 3);
    DynamicPlaceholderTextUtil_SetPlaceholderPtr(4, sDefeatedOpponentFlavorTexts[r6[1]]);
    DynamicPlaceholderTextUtil_ExpandPlaceholders(gStringVar4, gText_QuestLog_TookOnGymLeadersMonWithMonAndWon);
    return eventData + 4;
}

static u16 *RecordEvent_DefeatedWildMon(u16 *dest, const struct QuestLogEvent_WildBattle * data)
{
    u16 *body = dest;
    u8 *footer = (u8 *)dest + sizeof(struct QuestLogEvent_WildBattle);
    if (!QL_IsRoomToSaveEvent(body, sQuestLogEventCmdSizes[QL_EVENT_DEFEATED_WILD_MON]))
        return NULL;
    if (footer[0] == 0 && footer[1] == 0)
    {
        body[0] = QL_EVENT_DEFEATED_WILD_MON;
        body[1] = gQuestLogCurActionIdx;
    }
    if (data->defeatedSpecies != SPECIES_NONE)
        body[2] = data->defeatedSpecies;
    if (data->caughtSpecies != SPECIES_NONE)
        body[3] = data->caughtSpecies;
    if (data->defeatedSpecies != SPECIES_NONE && footer[0] != 0xFF)
        footer[0]++;
    if (data->caughtSpecies != SPECIES_NONE && footer[1] != 0xFF)
        footer[1]++;
    footer[2] = data->mapSec;
    return (u16 *)(footer + 4);
}

static const u16 *LoadEvent_DefeatedWildMon(const u16 *a0)
{
    const u8 *data;
    if (!QL_IsRoomToSaveEvent(a0, sQuestLogEventCmdSizes[QL_EVENT_DEFEATED_WILD_MON]))
        return NULL;

    data = (const u8 *)a0 + 8;
    DynamicPlaceholderTextUtil_Reset();
    GetMapNameGeneric(gStringVar1, data[2]);
    DynamicPlaceholderTextUtil_SetPlaceholderPtr(0, gStringVar1);
    QuestLog_GetSpeciesName(a0[2], NULL, 1);
    ConvertIntToDecimalStringN(gStringVar2, data[0], STR_CONV_MODE_LEFT_ALIGN, 3);
    DynamicPlaceholderTextUtil_SetPlaceholderPtr(2, gStringVar2);
    QuestLog_GetSpeciesName(a0[3], NULL, 3);
    ConvertIntToDecimalStringN(gStringVar3, data[1], STR_CONV_MODE_LEFT_ALIGN, 3);
    DynamicPlaceholderTextUtil_SetPlaceholderPtr(4, gStringVar3);
    DynamicPlaceholderTextUtil_SetPlaceholderPtr(5, gSaveBlock2Ptr->playerName);
    if (data[0] == 0)
    {
        if (data[1] == 1)
            DynamicPlaceholderTextUtil_ExpandPlaceholders(gStringVar4, gText_QuestLog_CaughtWildMon);
        else
            DynamicPlaceholderTextUtil_ExpandPlaceholders(gStringVar4, gText_QuestLog_CaughtWildMons);
    }
    else if (data[1] == 0)
    {
        if (data[0] == 1)
            DynamicPlaceholderTextUtil_ExpandPlaceholders(gStringVar4, gText_QuestLog_DefeatedWildMon);
        else
            DynamicPlaceholderTextUtil_ExpandPlaceholders(gStringVar4, gText_QuestLog_DefeatedWildMons);
    }
    else if (data[0] == 1)
    {
        if (data[1] == 1)
            DynamicPlaceholderTextUtil_ExpandPlaceholders(gStringVar4, gText_QuestLog_DefeatedWildMonAndCaughtWildMon);
        else
            DynamicPlaceholderTextUtil_ExpandPlaceholders(gStringVar4, gText_QuestLog_DefeatedWildMonAndCaughtWildMons);
    }
    else
    {
        if (data[1] == 1)
            DynamicPlaceholderTextUtil_ExpandPlaceholders(gStringVar4, gText_QuestLog_DefeatedWildMonsAndCaughtWildMon);
        else
            DynamicPlaceholderTextUtil_ExpandPlaceholders(gStringVar4, gText_QuestLog_DefeatedWildMonsAndCaughtWildMons);
    }
    return (const u16 *)(data + 4);
}

static bool8 IsSpeciesFromSpecialEncounter(u16 species)
{
    switch (species)
    {
    case SPECIES_SNORLAX:
    case SPECIES_ARTICUNO:
    case SPECIES_ZAPDOS:
    case SPECIES_MOLTRES:
    case SPECIES_MEWTWO:
    case SPECIES_LUGIA:
    case SPECIES_HO_OH:
    case SPECIES_DEOXYS:
        return TRUE;
    }
    return FALSE;
}

static u16 *RecordEvent_DefeatedEliteFourMember(u16 *dest, const struct QuestLogEvent_TrainerBattle * data)
{
    sStepRecordingMode = STEP_RECORDING_MODE_DISABLED;
    return RecordEvent_DefeatedTrainer(QL_EVENT_DEFEATED_E4_MEMBER, dest, data);
}

static const u16 *LoadEvent_DefeatedEliteFourMember(const u16 *eventData)
{
    const u8 *r5;
    eventData = LoadEvent(QL_EVENT_DEFEATED_E4_MEMBER, eventData);
    r5 = (const u8 *)eventData + 6;
    DynamicPlaceholderTextUtil_Reset();
    DynamicPlaceholderTextUtil_SetPlaceholderPtr(0, gTrainers[eventData[2]].trainerName);
    QuestLog_GetSpeciesName(eventData[0], NULL, 1);
    QuestLog_GetSpeciesName(eventData[1], NULL, 2);
    DynamicPlaceholderTextUtil_SetPlaceholderPtr(3, sDefeatedOpponentFlavorTexts[r5[1]]);
    DynamicPlaceholderTextUtil_ExpandPlaceholders(gStringVar4, gText_QuestLog_TookOnEliteFoursMonWithMonAndWon);
    return eventData + 4;
}

static u16 *RecordEvent_DefeatedChampion(u16 *dest, const struct QuestLogEvent_TrainerBattle * data)
{
    if (!QL_IsRoomToSaveEvent(dest, sQuestLogEventCmdSizes[QL_EVENT_DEFEATED_CHAMPION]))
        return NULL;
    dest[0] = QL_EVENT_DEFEATED_CHAMPION | (2 << QL_CMD_COUNT_SHIFT); // Event will run two additional times, for each state in LoadEvent_DefeatedChampion
    dest[1] = gQuestLogCurActionIdx;
    dest[2] = data->speciesOpponent;
    dest[3] = data->speciesPlayer;
    *((u8 *)dest + 8) = data->hpFractionId;
    sStepRecordingMode = STEP_RECORDING_MODE_DISABLED;
    return dest + 5;
}

static const u16 *LoadEvent_DefeatedChampion(const u16 *a0)
{
    const u8 *r5;
    if (!QL_IsRoomToSaveEvent(a0, sQuestLogEventCmdSizes[QL_EVENT_DEFEATED_CHAMPION]))
        return NULL;

    r5 = (const u8 *)a0 + 8;
    DynamicPlaceholderTextUtil_Reset();

    switch (gQuestLogRepeatEventTracker.counter)
    {
    case 0:
        DynamicPlaceholderTextUtil_SetPlaceholderPtr(0, gSaveBlock2Ptr->playerName);
        DynamicPlaceholderTextUtil_SetPlaceholderPtr(1, gSaveBlock1Ptr->rivalName);
        DynamicPlaceholderTextUtil_ExpandPlaceholders(gStringVar4, gText_QuestLog_PlayerBattledChampionRival);
        break;
    case 1:
        DynamicPlaceholderTextUtil_SetPlaceholderPtr(0, gSaveBlock1Ptr->rivalName);
        QuestLog_GetSpeciesName(a0[2], NULL, 1);
        DynamicPlaceholderTextUtil_SetPlaceholderPtr(2, gSaveBlock2Ptr->playerName);
        QuestLog_GetSpeciesName(a0[3], NULL, 3);
        DynamicPlaceholderTextUtil_ExpandPlaceholders(gStringVar4, gText_QuestLog_PlayerSentOutMon1RivalSentOutMon2);
        break;
    case 2:
        DynamicPlaceholderTextUtil_SetPlaceholderPtr(0, sDefeatedChampionFlavorTexts[r5[0]]);
        DynamicPlaceholderTextUtil_ExpandPlaceholders(gStringVar4, gText_QuestLog_WonTheMatchAsAResult);
        break;
    }
    return (const u16 *)(r5 + 2);
}

static u16 *RecordEvent_DefeatedNormalTrainer(u16 *dest, const struct QuestLogEvent_TrainerBattle * data)
{
    sStepRecordingMode = STEP_RECORDING_MODE_DISABLED;
    return RecordEvent_DefeatedTrainer(QL_EVENT_DEFEATED_TRAINER, dest, data);
}

static const u16 *LoadEvent_DefeatedTrainer(const u16 *eventData)
{
    const u16 *r5 = LoadEvent(QL_EVENT_DEFEATED_TRAINER, eventData);
    const u8 *r6 = (const u8 *)r5 + 6;
    DynamicPlaceholderTextUtil_Reset();
    GetMapNameGeneric(gStringVar1, r6[0]);
    DynamicPlaceholderTextUtil_SetPlaceholderPtr(0, gStringVar1);

    if (gTrainers[r5[2]].trainerClass == TRAINER_CLASS_RIVAL_EARLY
     || gTrainers[r5[2]].trainerClass == TRAINER_CLASS_RIVAL_LATE
     || gTrainers[r5[2]].trainerClass == TRAINER_CLASS_CHAMPION)
        DynamicPlaceholderTextUtil_SetPlaceholderPtr(1, GetExpandedPlaceholder(PLACEHOLDER_ID_RIVAL));
    else
        DynamicPlaceholderTextUtil_SetPlaceholderPtr(1, gTrainers[r5[2]].trainerName);

    QuestLog_GetSpeciesName(r5[0], NULL, 2);
    QuestLog_GetSpeciesName(r5[1], NULL, 3);
    DynamicPlaceholderTextUtil_SetPlaceholderPtr(4, sDefeatedOpponentFlavorTexts[r6[1]]);
    DynamicPlaceholderTextUtil_ExpandPlaceholders(gStringVar4, gText_QuestLog_TookOnTrainersMonWithMonAndWon);
    return (const u16 *)(r6 + 2);
}

#undef rSpeciesOpponent
#undef rSpeciesPlayer
#undef rTrainerId
#undef rMapSec
#undef rHpFractionId

#define rMapSec     record[0]
#define rLocationId record[1]

static u16 *RecordEvent_DepartedLocation(u16 *dest, const struct QuestLogEvent_Departed * data)
{
    u8 *record = (u8 *)RecordEventHeader(QL_EVENT_DEPARTED, dest);
    if (record == NULL)
        return NULL;

    rMapSec = data->mapSec;
    rLocationId = data->locationId;
    if (rLocationId == QL_LOCATION_SAFARI_ZONE)
        sStepRecordingMode = STEP_RECORDING_MODE_DISABLED;

    return (u16 *)(record + 2);
}

static const u16 *LoadEvent_DepartedLocation(const u16 *eventData)
{
    u8 i, locationId;
    const u8 *record = (const u8 *)LoadEvent(QL_EVENT_DEPARTED, eventData);

    locationId = rLocationId;
    GetMapNameGeneric(gStringVar1, rMapSec);
    StringCopy(gStringVar2, sLocationNameTexts[locationId]);
    if (sLocationToDepartedTextId[locationId] == QL_DEPARTED_GYM)
    {
        for (i = 0; i < NUM_BADGES; i++)
        {
            if (rMapSec != sGymCityMapSecs[i])
                continue;
            if (FlagGet(FLAG_BADGE01_GET + i) == TRUE)
                StringExpandPlaceholders(gStringVar4, gText_QuestLog_DepartedGym);
            else
                StringExpandPlaceholders(gStringVar4, gText_QuestLog_GymWasFullOfToughTrainers);
            break;
        }
        if (i == NUM_BADGES)
            StringExpandPlaceholders(gStringVar4, sDepartedLocationTexts[sLocationToDepartedTextId[locationId]]);
    }
    else
        StringExpandPlaceholders(gStringVar4, sDepartedLocationTexts[sLocationToDepartedTextId[locationId]]);

    return (const u16 *)(record + 2);
}

#undef rMapSec
#undef rLocationId

void SetQLPlayedTheSlots(void)
{
    sPlayedTheSlots = TRUE;
}

static bool8 ShouldRegisterEvent_HandleDeparted(u16 eventId, const u16 * genericData)
{
    const struct QuestLogEvent_Departed * data;

    if (eventId != QL_EVENT_DEPARTED)
    {
        sLastDepartedLocation = 0;
        return TRUE;
    }

    data = (struct QuestLogEvent_Departed *)genericData;

    if (sLastDepartedLocation == data->locationId + 1)
        return FALSE;
    sLastDepartedLocation = data->locationId + 1;
    return TRUE;
}

static bool8 ShouldRegisterEvent_DepartedGameCorner(u16 eventId, const u16 * genericData)
{
    const struct QuestLogEvent_Departed * data;

    if (eventId != QL_EVENT_DEPARTED)
        return TRUE;

    data = (struct QuestLogEvent_Departed *)genericData;

    if (data->locationId == QL_LOCATION_GAME_CORNER && !sPlayedTheSlots)
        return FALSE;

    sPlayedTheSlots = FALSE;
    return TRUE;
}

static u16 *RecordEvent_UsedFieldMove(u16 *dest, const struct QuestLogEvent_FieldMove * data)
{
    u8 *record;
    dest = RecordEventHeader(QL_EVENT_USED_FIELD_MOVE, dest);
    if (dest == NULL)
        return NULL;
    dest[0] = data->species;
    record = (u8 *)dest + 2;
    record[0] = data->fieldMove;
    record[1] = data->mapSec;
    if (record[0] == FIELD_MOVE_TELEPORT || record[0] == FIELD_MOVE_DIG)
        sStepRecordingMode = STEP_RECORDING_MODE_DISABLED_UNTIL_DEPART;
    else
        sStepRecordingMode = STEP_RECORDING_MODE_DISABLED;
    return (u16 *)(record + 2);
}

static const u16 *LoadEvent_UsedFieldMove(const u16 *eventData)
{
    const u16 *r4 = LoadEvent(QL_EVENT_USED_FIELD_MOVE, eventData);
    const u8 *r5 = (const u8 *)r4 + 2;
    QuestLog_GetSpeciesName(r4[0], gStringVar1, 0);
    if (r5[1] != 0xFF)
        GetMapNameGeneric(gStringVar2, r5[1]);

    // If used Teleport, get name of destination
    if (r5[0] == FIELD_MOVE_TELEPORT)
    {
        if (r5[1] == MAPSEC_PALLET_TOWN)
            StringCopy(gStringVar3, gText_QuestLog_Home);
        else
            StringCopy(gStringVar3, gText_PokemonCenter);
    }

    StringExpandPlaceholders(gStringVar4, sUsedFieldMoveTexts[r5[0]]);
    return (const u16 *)(r5 + 2);
}

static u16 *RecordEvent_BoughtItem(u16 *dest, const struct QuestLogEvent_Shop * data)
{
    dest = RecordEventHeader(QL_EVENT_BOUGHT_ITEM, dest);
    if (dest == NULL)
        return NULL;
    dest[0] = data->lastItemId;
    dest[1] = data->itemQuantity;
    dest[2] = data->totalMoney >> 16;
    dest[3] = data->totalMoney;
    *((u8 *)dest + 8) = data->mapSec;
    *((u8 *)dest + 9) = TRUE; // data->hasMultipleTransactions ignored for some reason. It's assumed true if quantity >= 2
    return dest + 5;
}

static const u16 *LoadEvent_BoughtItem(const u16 *eventData)
{
    const u16 *r4 = LoadEvent(QL_EVENT_BOUGHT_ITEM, eventData);
    const u8 *r7 = (const u8 *)r4 + 8;
    u32 r6 = (r4[2] << 16) + r4[3];
    DynamicPlaceholderTextUtil_Reset();
    GetMapNameGeneric(gStringVar1, r7[0]);
    DynamicPlaceholderTextUtil_SetPlaceholderPtr(0, gStringVar1);
    DynamicPlaceholderTextUtil_SetPlaceholderPtr(1, ItemId_GetName(r4[0]));
    if (r4[1] < 2)
        DynamicPlaceholderTextUtil_ExpandPlaceholders(gStringVar4, gText_QuestLog_BoughtItem);
    else
    {
        ConvertIntToDecimalStringN(gStringVar2, r6, STR_CONV_MODE_LEFT_ALIGN, 6);
        DynamicPlaceholderTextUtil_SetPlaceholderPtr(2, gStringVar2);
        DynamicPlaceholderTextUtil_ExpandPlaceholders(gStringVar4, gText_QuestLog_BoughtItemsIncludingItem);
    }
    return (const u16 *)(r7 + 2);
}

static u16 *RecordEvent_SoldItem(u16 *dest, const struct QuestLogEvent_Shop * data)
{
    dest = RecordEventHeader(QL_EVENT_SOLD_ITEM, dest);
    if (dest == NULL)
        return NULL;
    dest[0] = data->lastItemId;
    dest[1] = data->itemQuantity;
    dest[2] = data->totalMoney >> 16;
    dest[3] = data->totalMoney;
    *((u8 *)dest + 8) = data->mapSec;
    *((u8 *)dest + 9) = data->hasMultipleTransactions;
    return dest + 5;
}

static const u16 *LoadEvent_SoldItem(const u16 *eventData)
{
    const u16 *r5 = LoadEvent(QL_EVENT_SOLD_ITEM, eventData);
    const u8 *r7 = (const u8 *) r5 + 8;
    u32 r6 = (r5[2] << 16) + r5[3];
    DynamicPlaceholderTextUtil_Reset();
    GetMapNameGeneric(gStringVar1, r7[0]);
    if (r7[1] == 0) {
        DynamicPlaceholderTextUtil_SetPlaceholderPtr(0, gSaveBlock2Ptr->playerName);
        DynamicPlaceholderTextUtil_SetPlaceholderPtr(1, gStringVar1);
        DynamicPlaceholderTextUtil_SetPlaceholderPtr(2, ItemId_GetName(r5[0]));
        if (r5[1] == 1)
            DynamicPlaceholderTextUtil_SetPlaceholderPtr(3, gText_QuestLog_JustOne);
        else
        {
            ConvertIntToDecimalStringN(gStringVar2, r5[1], STR_CONV_MODE_LEFT_ALIGN, 3);
            DynamicPlaceholderTextUtil_SetPlaceholderPtr(4, gStringVar2);
            DynamicPlaceholderTextUtil_ExpandPlaceholders(gStringVar3, gText_QuestLog_Num);
            DynamicPlaceholderTextUtil_SetPlaceholderPtr(3, gStringVar3);
        }
        DynamicPlaceholderTextUtil_ExpandPlaceholders(gStringVar4, gText_QuestLog_SoldNumOfItem);
    }
    else
    {
        DynamicPlaceholderTextUtil_SetPlaceholderPtr(0, gStringVar1);
        DynamicPlaceholderTextUtil_SetPlaceholderPtr(1, ItemId_GetName(r5[0]));
        ConvertIntToDecimalStringN(gStringVar2, r6, STR_CONV_MODE_LEFT_ALIGN, 6);
        DynamicPlaceholderTextUtil_SetPlaceholderPtr(2, gStringVar2);
        DynamicPlaceholderTextUtil_ExpandPlaceholders(gStringVar4, gText_QuestLog_SoldItemsIncludingItem);
    }
    return (const u16 *)(r7 + 2);
}

static u16 *RecordEvent_ObtainedStoryItem(u16 *dest, const struct QuestLogEvent_StoryItem * data)
{
    dest = RecordEventHeader(QL_EVENT_OBTAINED_STORY_ITEM, dest);
    if (dest == NULL)
        return NULL;
    dest[0] = data->itemId;
    *((u8 *)dest + 2) = data->mapSec;
    return dest + 2;
}

static const u16 *LoadEvent_ObtainedStoryItem(const u16 *eventData)
{
    const u16 *r4 = LoadEvent(QL_EVENT_OBTAINED_STORY_ITEM, eventData);
    const u8 *r5 = (const u8 *)r4 + 2;
    GetMapNameGeneric(gStringVar1, r5[0]);
    StringCopy(gStringVar2, ItemId_GetName(r4[0]));
    StringExpandPlaceholders(gStringVar4, gText_QuestLog_ObtainedItemInLocation);
    return (const u16 *)(r5 + 2);
}

void QuestLog_RecordEnteredMap(u16 worldMapFlag)
{
    s32 i;

    if (QL_IS_PLAYBACK_STATE)
        return;

    for (i = 0; i < (int)ARRAY_COUNT(sWorldMapFlags); i++)
    {
        if (worldMapFlag == sWorldMapFlags[i])
        {
            if (!FlagGet(worldMapFlag))
            {
                sNewlyEnteredMap = TRUE;
                break;
            }
            else
            {
                sNewlyEnteredMap += 0;
                sNewlyEnteredMap = FALSE;
                break;
            }
        }
    }
}

void SetQuestLogEvent_Arrived(void)
{
    if (!QL_IS_PLAYBACK_STATE)
    {
        if (sNewlyEnteredMap)
        {
            u16 mapSec = gMapHeader.regionMapSectionId;
            SetQuestLogEvent(QL_EVENT_ARRIVED, &mapSec);
            sNewlyEnteredMap = FALSE;
        }
    }
}

static u16 *RecordEvent_ArrivedInLocation(u16 *dest, const u16 * data)
{
    dest = RecordEventHeader(QL_EVENT_ARRIVED, dest);
    if (dest == NULL)
        return NULL;
    dest[0] = data[0];
    return dest + 1;
}

static const u16 *LoadEvent_ArrivedInLocation(const u16 *eventData)
{
    const u16 *r4 = LoadEvent(QL_EVENT_ARRIVED, eventData);
    GetMapNameGeneric(gStringVar1, (u8)r4[0]);
    StringExpandPlaceholders(gStringVar4, gText_QuestLog_ArrivedInLocation);
    return r4 + 1;
}

static void TranslateLinkPartnersName(u8 *dest)
{
    s32 i;
    if (*dest++ == EXT_CTRL_CODE_BEGIN && *dest++ == EXT_CTRL_CODE_JPN)
    {
        for (i = 0; i < 5; i++)
        {
            if (*dest == EXT_CTRL_CODE_BEGIN)
                break;
            dest++;
        }
        *dest++ = EXT_CTRL_CODE_BEGIN;
        *dest++ = EXT_CTRL_CODE_ENG;
        *dest++ = EOS;
    }
}
