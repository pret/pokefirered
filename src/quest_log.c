#include "global.h"
#include "data.h"
#include "malloc.h"
#include "main.h"
#include "task.h"
#include "palette.h"
#include "menu.h"
#include "random.h"
#include "menu_helpers.h"
#include "window.h"
#include "text_window.h"
#include "dynamic_placeholder_text_util.h"
#include "event_data.h"
#include "event_scripts.h"
#include "string_util.h"
#include "script.h"
#include "overworld.h"
#include "field_fadetransition.h"
#include "field_weather.h"
#include "event_object_movement.h"
#include "event_object_lock.h"
#include "field_player_avatar.h"
#include "battle.h"
#include "item.h"
#include "region_map.h"
#include "map_name_popup.h"
#include "wild_encounter.h"
#include "help_system.h"
#include "party_menu.h"
#include "pokemon_storage_system.h"
#include "save.h"
#include "link.h"
#include "quest_log_objects.h"
#include "quest_log_player.h"
#include "quest_log.h"
#include "new_menu_helpers.h"
#include "strings.h"
#include "constants/event_objects.h"
#include "constants/maps.h"
#include "constants/party_menu.h"
#include "constants/quest_log.h"
#include "constants/trainer_classes.h"
#include "constants/species.h"
#include "constants/items.h"

u8 gUnknown_3005E88;

struct TrainerFanClub
{
    u8 timer:7;
    u8 gotInitialFans:1;
    u8 fanFlags;
};

#define TRAINER_FAN_CLUB ((struct TrainerFanClub *)GetVarPointer(VAR_FANCLUB_FAN_COUNTER))

#define GET_TRAINER_FAN_CLUB_FLAG(flag) (fanClub->fanFlags >> (flag) & 1)
#define SET_TRAINER_FAN_CLUB_FLAG(flag) (fanClub->fanFlags |= 1 << (flag))
#define FLIP_TRAINER_FAN_CLUB_FLAG(flag)(fanClub->fanFlags ^= 1 << (flag))

struct UnkStruct_203AE94
{
    u8 unk_0_0:4;
    u8 unk_0_4:2;
    u8 unk_0_6:2;
    u8 unk_1;
    u8 unk_2;
    u8 unk_3;
};

struct UnkStruct_203AE98
{
    u8 unk_0;
    u8 unk_1;
    u8 unk_2;
    u8 unk_3;
    u16 unk_4;
    u8 unk_6;
};

struct UnkStruct_300201C
{
    u16 idx:15;
    u16 isFlag:1;
    u16 value;
};

struct UnkStruct_203B044
{
    u8 unk_0;
    u8 unk_1;
    u16 unk_2;
};

u8 gUnknown_3005E88;
u16 sNumQuestLogs;
struct UnkStruct_3005E90 gUnknown_3005E90;
struct UnkStruct_203AE98 * gUnknown_3005E94;

static struct UnkStruct_300201C * sFlagOrVarRecords;
static u16 sNumFlagsOrVars;

static EWRAM_DATA u8 sCurrentSceneNum = 0;
static EWRAM_DATA u8 sNumScenes = 0;
EWRAM_DATA u8 gQuestLogState = 0;
static EWRAM_DATA u16 gUnknown_203ADFC = 0;
static EWRAM_DATA u8 gUnknown_203ADFE[3] = {0};
static EWRAM_DATA u16 *gUnknown_203AE04 = NULL;
static EWRAM_DATA u16 *gUnknown_203AE08 = NULL;
static EWRAM_DATA u16 *gUnknown_203AE0C[32] = {NULL};
static EWRAM_DATA void (* sQuestLogCB)(void) = NULL;
static EWRAM_DATA u16 *gUnknown_203AE90 = NULL;
static EWRAM_DATA struct UnkStruct_203AE94 gUnknown_203AE94 = {0};
static EWRAM_DATA struct UnkStruct_203AE98 gUnknown_203AE98[32] = {0};
static EWRAM_DATA u16 sQuestLogIdx = 0;
static EWRAM_DATA u8 gUnknown_203AF9A[64][2] = {{0}};
static EWRAM_DATA u16 gUnknown_203B01A = 0;
static EWRAM_DATA u16 gUnknown_203B01C = 0;
static EWRAM_DATA u16 sFlagOrVarPlayhead = 0;
static EWRAM_DATA u8 sHelpMessageWindowId = 0;
static EWRAM_DATA struct UnkStruct_203B024 gUnknown_203B024 = {0};
static EWRAM_DATA struct UnkStruct_203B044 gUnknown_203B044 = {0};
static EWRAM_DATA u8 gUnknown_203B048 = 0;
static EWRAM_DATA u8 gUnknown_203B049 = 0;
static EWRAM_DATA u8 gUnknown_203B04A = 0;
static EWRAM_DATA bool8 gUnknown_203B04B = 0;

static void sub_8110A00(void);
static void sub_8110A3C(void);
static void sub_8110BB0(u8);
static void sub_8110BE8(u8);
static void sub_8110E3C(void);
static void sub_8110D94(void);
static void sub_8110E20(void);
static void sub_8110D48(u8);
static u8 sub_8110E68(struct UnkStruct_203AE98 *);
static void sub_8110F90(u8);
static void sub_8111150(u8);
static void sub_8111368(void);
static void QuestLog_GetSaneMonCounts(void);
static u16 QuestLog_GetSanePartyCount(void);
static u16 QuestLog_GetSaneBoxCount(void);
static void sub_8111688(void);
static void sub_811175C(u8, struct UnkStruct_203AE98 *);
static void sub_81118F4(s8);
static void QuestLog_AdvancePlayhead(void);
static void QuestLog_StartFinalScene(void);
static void Task_RunPlaybackCB(u8);
static void sub_8111AD8(void);
static void sub_8111B80(void);
static u8 sub_8111BD4(void);
static void DrawQuestLogSceneDescription(void);
static void sub_8111D90(u8);
static void QuestLog_CloseTextWindow(void);
static void QuestLog_SkipToEndOfPlayback(s8);
static void QuestLog_WaitFadeAndCancelPlayback(void);
static bool8 sub_8111F60(void);
static void sub_8111F8C(u8);
static void Task_QuestLogScene_SavedGame(u8);
static void Task_WaitAtEndOfQuestLog(u8);
static void Task_EndQuestLog(u8);
static bool8 sub_81121D8(u8);
static void sub_811229C(void);
static void sub_8112888(u8);
static void sub_8112940(u8, struct UnkStruct_203AE98 *, u16);
static bool8 sub_8112CEC(void);
static bool8 sub_8112D1C(void);
static void TryLoseFansFromPlayTimeAfterLinkBattle(struct TrainerFanClub *);
static void UpdateTrainerFanClubGameClear(struct TrainerFanClub *);
static u8 PlayerGainRandomTrainerFan(struct TrainerFanClub *);
static u16 GetNumFansOfPlayerInTrainerFanClub(struct TrainerFanClub *);
static void TryLoseFansFromPlayTime(struct TrainerFanClub *);
static bool16 IsFanClubMemberFanOfPlayer(struct TrainerFanClub *);
static void SetInitialFansOfPlayer(struct TrainerFanClub *);
static void BufferFanClubTrainerName(struct LinkBattleRecords *, u8, u8);
static void UpdateTrainerFansAfterLinkBattle(struct TrainerFanClub *);
static bool8 DidPlayerGetFirstFans(struct TrainerFanClub * );
static void SetPlayerGotFirstFans(struct TrainerFanClub *);
static bool8 InQuestLogDisabledLocation(void);
static bool8 sub_8113778(u16, const u16 *);
static bool8 sub_81137E4(u16, const u16 *);
static u16 *sub_8113828(u16, const u16 *);
static bool8 TrySetLinkQuestLogEvent(u16, const u16 *);
static bool8 TrySetTrainerBattleQuestLogEvent(u16, const u16 *);
static void sub_8113A1C(u16);
static void sub_811381C(void);
static bool8 IsQuestLogEventWithSpecialEncounterSpecies(u16, const u16 *);
static u16 *QuestLog_SkipCommand(u16 *, u16 **);
static void sub_8113ABC(const u16 *);
static bool8 sub_8113AE8(const u16 *);
static bool8 sub_8113B44(const u16 *);
static void sub_8113B88(void);
static void sub_8113B94(u16);
static void sub_8113BD8(void);
static u16 *sub_8113BF4(u16 *);
static u16 *sub_8113C20(u16 *, struct UnkStruct_203AE98 *);
static u16 *sub_8113C5C(u16 *, u16);
static u16 *sub_8113C8C(u16 *, struct UnkStruct_203AE98 *);
static u16 *sub_8113CC8(u16 *, struct UnkStruct_203AE98 *);
static u16 *sub_8113D08(u16 *, struct UnkStruct_203AE98 *);
static u16 *sub_8113D48(u16 *, struct UnkStruct_203AE98 *);
static u16 *sub_8113D94(u16 *, struct UnkStruct_203AE98 *);
static u16 *BufferQuestLogData_SwitchedPartyOrder(u16 *, const u16 *);
static u16 *BufferQuestLogData_UsedItem(u16 *, const u16 *);
static u16 *BufferQuestLogData_GaveHeldItemFromPartyMenu(u16 *, const u16 *);
static u16 *BufferQuestLogData_GaveHeldItemFromBagMenu(u16 *, const u16 *);
static u16 *BufferQuestLogData_GaveHeldItemFromPC(u16 *, const u16 *);
static u16 *BufferQuestLogData_TookHeldItem(u16 *, const u16 *);
static u16 *BufferQuestLogData_SwappedHeldItem(u16 *, const u16 *);
static u16 *BufferQuestLogData_SwappedHeldItemFromPC(u16 *, const u16 *);
static u16 *BufferQuestLogData_UsedPkmnCenter(u16 *, const u16 *);
static u16 *BufferQuestLogData_LinkTraded(u16 *, const u16 *);
static u16 *BufferQuestLogData_LinkBattledSingle(u16 *, const u16 *);
static u16 *BufferQuestLogData_LinkBattledDouble(u16 *, const u16 *);
static u16 *BufferQuestLogData_LinkBattledMulti(u16 *, const u16 *);
static u16 *BufferQuestLogData_UsedUnionRoom(u16 *, const u16 *);
static u16 *BufferQuestLogData_UsedUnionRoomChat(u16 *, const u16 *);
static u16 *BufferQuestLogData_LinkTradedUnionRoom(u16 *, const u16 *);
static u16 *BufferQuestLogData_LinkBattledUnionRoom(u16 *, const u16 *);
static u16 *BufferQuestLogData_SwitchedMonsBetweenBoxes(u16 *, const u16 *);
static u16 *BufferQuestLogData_SwitchedMonsWithinBox(u16 *, const u16 *);
static u16 *BufferQuestLogData_SwitchedPartyMonForPCMon(u16 *, const u16 *);
static u16 *BufferQuestLogData_MovedMonBetweenBoxes(u16 *, const u16 *);
static u16 *BufferQuestLogData_MovedMonWithinBox(u16 *, const u16 *);
static u16 *BufferQuestLogData_WithdrewMonFromPC(u16 *, const u16 *);
static u16 *BufferQuestLogData_DepositedMonInPC(u16 *, const u16 *);
static u16 *BufferQuestLogData_SwitchedMultipleMons(u16 *, const u16 *);
static u16 *BufferQuestLogData_DepositedItemInPC(u16 *, const u16 *);
static u16 *BufferQuestLogData_WithdrewItemFromPC(u16 *, const u16 *);
static u16 *BufferQuestLogData_DefeatedGymLeader(u16 *, const u16 *);
static u16 *BufferQuestLogData_DefeatedWildMon(u16 *, const u16 *);
static u16 *BufferQuestLogData_DefeatedEliteFourMember(u16 *, const u16 *);
static u16 *BufferQuestLogData_DefeatedChampion(u16 *, const u16 *);
static u16 *BufferQuestLogData_DefeatedTrainer(u16 *, const u16 *);
static u16 *BufferQuestLogData_DepartedLocation(u16 *, const u16 *);
static u16 *BufferQuestLogData_UsedFieldMove(u16 *, const u16 *);
static u16 *BufferQuestLogData_BoughtItem(u16 *, const u16 *);
static u16 *BufferQuestLogData_SoldItem(u16 *, const u16 *);
static u16 *BufferQuestLogData_ObtainedItem(u16 *, const u16 *);
static u16 *BufferQuestLogData_ArrivedInLocation(u16 *, const u16 *);
static const u16 *BufferQuestLogText_SwitchedPartyOrder(const u16 *);
static const u16 *BufferQuestLogText_UsedItem(const u16 *);
static const u16 *BufferQuestLogText_GaveHeldItemFromPartyMenu(const u16 *);
static const u16 *BufferQuestLogText_GaveHeldItemFromBagMenu(const u16 *);
static const u16 *BufferQuestLogText_GaveHeldItemFromPC(const u16 *);
static const u16 *BufferQuestLogText_TookHeldItem(const u16 *);
static const u16 *BufferQuestLogText_SwappedHeldItem(const u16 *);
static const u16 *BufferQuestLogText_SwappedHeldItemFromPC(const u16 *);
static const u16 *BufferQuestLogText_UsedPkmnCenter(const u16 *);
static const u16 *BufferQuestLogText_LinkTraded(const u16 *);
static const u16 *BufferQuestLogText_LinkBattledSingle(const u16 *);
static const u16 *BufferQuestLogText_LinkBattledDouble(const u16 *);
static const u16 *BufferQuestLogText_LinkBattledMulti(const u16 *);
static const u16 *BufferQuestLogText_UsedUnionRoom(const u16 *);
static const u16 *BufferQuestLogText_UsedUnionRoomChat(const u16 *);
static const u16 *BufferQuestLogText_LinkTradedUnionRoom(const u16 *);
static const u16 *BufferQuestLogText_LinkBattledUnionRoom(const u16 *);
static const u16 *BufferQuestLogText_SwitchedMonsBetweenBoxes(const u16 *);
static const u16 *BufferQuestLogText_SwitchedMonsWithinBox(const u16 *);
static const u16 *BufferQuestLogText_SwitchedPartyMonForPCMon(const u16 *);
static const u16 *BufferQuestLogText_MovedMonBetweenBoxes(const u16 *);
static const u16 *BufferQuestLogText_MovedMonWithinBox(const u16 *);
static const u16 *BufferQuestLogText_WithdrewMonFromPC(const u16 *);
static const u16 *BufferQuestLogText_DepositedMonInPC(const u16 *);
static const u16 *BufferQuestLogText_SwitchedMultipleMons(const u16 *);
static const u16 *BufferQuestLogText_DepositedItemInPC(const u16 *);
static const u16 *BufferQuestLogText_WithdrewItemFromPC(const u16 *);
static const u16 *BufferQuestLogText_DefeatedGymLeader(const u16 *);
static const u16 *BufferQuestLogText_DefeatedWildMon(const u16 *);
static const u16 *BufferQuestLogText_DefeatedEliteFourMember(const u16 *);
static const u16 *BufferQuestLogText_DefeatedChampion(const u16 *);
static const u16 *BufferQuestLogText_DefeatedTrainer(const u16 *);
static const u16 *BufferQuestLogText_DepartedLocation(const u16 *);
static const u16 *BufferQuestLogText_UsedFieldMove(const u16 *);
static const u16 *BufferQuestLogText_BoughtItem(const u16 *);
static const u16 *BufferQuestLogText_SoldItem(const u16 *);
static const u16 *BufferQuestLogText_ObtainedItem(const u16 *);
static const u16 *BufferQuestLogText_ArrivedInLocation(const u16 *);
static bool8 IsSpeciesFromSpecialEncounter(u16);
static bool8 sub_81153A8(u16, const u16 *);
static bool8 sub_81153E4(u16, const u16 *);
static void BufferLinkPartnersName(u8 *);

extern const u8 QuestLog_Text_PreviouslyOnYourQuest[];
extern const u8 QuestLog_Text_SwitchMon1WithMon2[];
extern const u8 QuestLog_Text_SwappedHeldItemsOnMon[];
extern const u8 QuestLog_Text_TookHeldItemFromMon[];
extern const u8 QuestLog_Text_UsedItemOnMonAtThisLocation[];
extern const u8 QuestLog_Text_UsedTheItem[];
extern const u8 QuestLog_Text_UsedTheKeyItem[];
extern const u8 QuestLog_Text_MonLearnedMoveFromTM[];
extern const u8 QuestLog_Text_MonReplacedMoveWithTM[];
extern const u8 QuestLog_Text_MonsWereFullyRestoredAtCenter[];
extern const u8 QuestLog_Text_PlayerBattledChampionRival[];
extern const u8 QuestLog_Text_PlayerSentOutMon1RivalSentOutMon2[];
extern const u8 QuestLog_Text_WonTheMatchAsAResult[];
extern const u8 QuestLog_Text_StoredItemInPC[];
extern const u8 QuestLog_Text_WithdrewItemFromPC[];
extern const u8 QuestLog_Text_TradedMon1ForPersonsMon2[];
extern const u8 QuestLog_Text_SingleBattleWithPersonResultedInOutcome[];
extern const u8 QuestLog_Text_DoubleBattleWithPersonResultedInOutcome[];
extern const u8 QuestLog_Text_MultiBattleWithPeopleResultedInOutcome[];
extern const u8 QuestLog_Text_Win[];
extern const u8 QuestLog_Text_Loss[];
extern const u8 QuestLog_Text_MingledInUnionRoom[];
extern const u8 QuestLog_Text_DepartedPlaceInTownForNextDestination[];
extern const u8 QuestLog_Text_SwitchedMonsBetweenBoxes[];
extern const u8 QuestLog_Text_MovedMonToNewBox[];
extern const u8 QuestLog_Text_SwitchedMonsWithinBox[];
extern const u8 QuestLog_Text_MovedMonWithinBox[];
extern const u8 QuestLog_Text_SwitchedPartyMonForPCMon[];
extern const u8 QuestLog_Text_WithdrewMonFromPC[];
extern const u8 QuestLog_Text_DepositedMonInPC[];
extern const u8 QuestLog_Text_SwitchedMultipleMons[];
extern const u8 QuestLog_Text_ADifferentSpot[];
extern const u8 QuestLog_Text_GaveMonHeldItemFromPC[];
extern const u8 QuestLog_Text_SwappedHeldItemFromPC[];
extern const u8 QuestLog_Text_ChattedWithManyTrainers[];
extern const u8 QuestLog_Text_Handily[];
extern const u8 QuestLog_Text_Tenaciously[];
extern const u8 QuestLog_Text_Somehow[];
extern const u8 QuestLog_Text_TradedMon1ForTrainersMon2[];
extern const u8 QuestLog_Text_BattledTrainerEndedInOutcome[];
extern const u8 QuestLog_Text_BoughtItem[];
extern const u8 QuestLog_Text_BoughtItemsIncludingItem[];
extern const u8 QuestLog_Text_SoldNumOfItem[];
extern const u8 QuestLog_Text_SoldItemsIncludingItem[];
extern const u8 QuestLog_Text_JustOne[];
extern const u8 QuestLog_Text_Num[];
extern const u8 QuestLog_Text_UsedSoftboiled[];
extern const u8 QuestLog_Text_UsedMilkDrink[];
extern const u8 QuestLog_Text_MonLearnedMoveFromHM[];
extern const u8 QuestLog_Text_MonReplacedMoveWithHM[];
extern const u8 QuestLog_Text_DefeatedWildMon[];
extern const u8 QuestLog_Text_DefeatedWildMons[];
extern const u8 QuestLog_Text_CaughtWildMon[];
extern const u8 QuestLog_Text_CaughtWildMons[];
extern const u8 QuestLog_Text_DefeatedWildMonAndCaughtWildMon[];
extern const u8 QuestLog_Text_DefeatedWildMonAndCaughtWildMons[];
extern const u8 QuestLog_Text_DefeatedWildMonsAndCaughtWildMon[];
extern const u8 QuestLog_Text_DefeatedWildMonsAndCaughtWildMons[];
extern const u8 QuestLog_Text_GaveMonHeldItem[];
extern const u8 QuestLog_Text_GaveMonHeldItem2[];
extern const u8 QuestLog_Text_UsedCut[];
extern const u8 QuestLog_Text_UsedFly[];
extern const u8 QuestLog_Text_UsedSurf[];
extern const u8 QuestLog_Text_UsedStrength[];
extern const u8 QuestLog_Text_UsedFlash[];
extern const u8 QuestLog_Text_UsedRockSmash[];
extern const u8 QuestLog_Text_UsedWaterfall[];
extern const u8 QuestLog_Text_UsedDive[];
extern const u8 QuestLog_Text_UsedDigInLocation[];
extern const u8 QuestLog_Text_UsedSweetScent[];
extern const u8 QuestLog_Text_UsedTeleportToLocation[];
extern const u8 QuestLog_Text_LeftTownsLocationForNextDestination[];
extern const u8 QuestLog_Text_PlayedGamesAtGameCorner[];
extern const u8 QuestLog_Text_RestedAtHome[];
extern const u8 QuestLog_Text_LeftOaksLab[];
extern const u8 QuestLog_Text_GymWasFullOfToughTrainers[];
extern const u8 QuestLog_Text_DepartedGym[];
extern const u8 QuestLog_Text_HadGreatTimeInSafariZone[];
extern const u8 QuestLog_Text_ManagedToGetOutOfLocation[];
extern const u8 QuestLog_Text_TookOnGymLeadersMonWithMonAndWon[];
extern const u8 QuestLog_Text_TookOnEliteFoursMonWithMonAndWon[];
extern const u8 QuestLog_Text_TookOnTrainersMonWithMonAndWon[];
extern const u8 QuestLog_Text_Coolly[];
extern const u8 QuestLog_Text_Barely[];
extern const u8 QuestLog_Text_UsedEscapeRope[];
extern const u8 QuestLog_Text_Draw[];
extern const u8 QuestLog_Text_DepartedTheLocationForNextDestination[];
extern const u8 QuestLog_Text_DepartedFromLocationToNextDestination[];
extern const u8 QuestLog_Text_ObtainedItemInLocation[];
extern const u8 QuestLog_Text_ArrivedInLocation[];
extern const u8 QuestLog_Text_SavedGameAtLocation[];
extern const u8 QuestLog_Text_Home[];
extern const u8 QuestLog_Text_OakResearchLab[];
extern const u8 QuestLog_Text_Gym[];
extern const u8 QuestLog_Text_PokemonLeagueGate[];
extern const u8 QuestLog_Text_ViridianForest[];
extern const u8 QuestLog_Text_PewterMuseumOfScience[];
extern const u8 QuestLog_Text_MtMoon[];
extern const u8 QuestLog_Text_BikeShop[];
extern const u8 QuestLog_Text_BillsHouse[];
extern const u8 QuestLog_Text_DayCare[];
extern const u8 QuestLog_Text_UndergroundPath[];
extern const u8 QuestLog_Text_PokemonFanClub[];
extern const u8 QuestLog_Text_SSAnne[];
extern const u8 QuestLog_Text_DiglettsCave[];
extern const u8 QuestLog_Text_RockTunnel[];
extern const u8 QuestLog_Text_PowerPlant[];
extern const u8 QuestLog_Text_PokemonTower[];
extern const u8 QuestLog_Text_VolunteerHouse[];
extern const u8 QuestLog_Text_NameRatersHouse[];
extern const u8 QuestLog_Text_CeladonDeptStore[];
extern const u8 QuestLog_Text_CeladonMansion[];
extern const u8 QuestLog_Text_RocketGameCorner[];
extern const u8 QuestLog_Text_Restaurant[];
extern const u8 QuestLog_Text_RocketHideout[];
extern const u8 QuestLog_Text_SafariZone[];
extern const u8 QuestLog_Text_WardensHome[];
extern const u8 QuestLog_Text_FightingDojo[];
extern const u8 QuestLog_Text_SilphCo[];
extern const u8 QuestLog_Text_SeafoamIslands[];
extern const u8 QuestLog_Text_PokemonMansion[];
extern const u8 QuestLog_Text_PokemonResearchLab[];
extern const u8 QuestLog_Text_VictoryRoad[];
extern const u8 QuestLog_Text_PokemonLeague[];
extern const u8 QuestLog_Text_CeruleanCave[];


static const struct WindowTemplate gUnknown_845661C[3] = {
    { 0, 0,  0, 30, 2, 15, 0x0e9 },
    { 0, 0, 18, 30, 2, 15, 0x0ad },
    { 0, 0, 14, 30, 6, 15, 0x14c }
};

static const u8 sTextColors[3] = {TEXT_DYNAMIC_COLOR_6, TEXT_COLOR_WHITE, TEXT_DYNAMIC_COLOR_3};

static const u16 gUnknown_8456638[] = INCBIN_U16("data/graphics/unknown_8456638.bin");

static const u8 sQuestLogTextLineYCoords[] = {17, 10, 3};

void sub_8110840(void * oldPointer)
{
    ptrdiff_t offset = (void *)gSaveBlock1Ptr - oldPointer;
    if (gUnknown_203AE04)
        gUnknown_203AE04 = (void *)gUnknown_203AE04 + offset;
    if (gQuestLogState != 0)
    {
        if (gUnknown_203AE08)
            gUnknown_203AE08 = (void *)gUnknown_203AE08 + offset;
        if (gQuestLogState == 2)
        {
            int r3;
            for (r3 = 0; r3 < (int)NELEMS(gUnknown_203AE0C); r3++)
                if (gUnknown_203AE0C[r3])
                    gUnknown_203AE0C[r3] = (void *)gUnknown_203AE0C[r3] + offset;
        }
    }
}

void ResetQuestLog(void)
{
    memset(gSaveBlock1Ptr->questLog, 0, sizeof(gSaveBlock1Ptr->questLog));
    sCurrentSceneNum = 0;
    gQuestLogState = 0;
    sQuestLogCB = NULL;
    gUnknown_203AE08 = NULL;
    gUnknown_203AE04 = NULL;
    sub_8113BD8();
    sub_81138F8();
}

void sub_81108F0(u8 a0)
{
    memset(gSaveBlock1Ptr->questLog + a0, 0, sizeof(struct QuestLog));
    gUnknown_203AE04 = NULL;
}

void sub_8110920(void)
{
    gUnknown_203AE04 = NULL;
}

void RunQuestLogCB(void)
{
    if (sQuestLogCB != NULL)
        sQuestLogCB();
}

bool8 sub_8110944(const void * a0, size_t cmdSize)
{
    void * r2 = gSaveBlock1Ptr->questLog[sCurrentSceneNum].unk_568;
    void * r0 = gSaveBlock1Ptr->questLog[sCurrentSceneNum].end;
    r0 -= cmdSize;
    if ((const void *)a0 < r2 || (const void *)a0 > r0)
        return FALSE;
    return TRUE;
}

bool8 sub_8110988(u16 *a0, size_t a1)
{
    void * r2 = gSaveBlock1Ptr->questLog[sCurrentSceneNum].unk_568;
    void * r0 = gSaveBlock1Ptr->questLog[sCurrentSceneNum].end;
    r0 -= a1;
    if ((void *)a0 < r2 || (void *)a0 > r0)
        return FALSE;
    return TRUE;
}

static void SetQuestLogState(u8 state)
{
    gQuestLogState = state;
    if (state == 1)
        sQuestLogCB = sub_8110A00;
    else
        sQuestLogCB = sub_8110A3C;
}

static void sub_8110A00(void)
{
    if (sub_8110E68(gUnknown_203AE98) != 1)
    {
        gUnknown_3005E88 = 0;
        sub_8110E3C();
        gQuestLogState = 0;
        sQuestLogCB = NULL;
    }
}

static void sub_8110A3C(void)
{
    if (gUnknown_203AE94.unk_0_0 == 2)
        gUnknown_203AE94.unk_0_0 = 0;

    if (gUnknown_203AE94.unk_0_6 == 0)
    {
        if (gUnknown_3005E88 || gUnknown_203AE94.unk_0_0 == 1 || (gUnknown_203AE94.unk_1 < 32 && gUnknown_203AE0C[gUnknown_203AE94.unk_1]))
            sub_8111AD8();
        else
        {
            gUnknown_203AE94.unk_0_6 = 2;
            ScriptContext2_Enable();
            sub_81118F4(0);
        }
    }
}

void Special_GetQuestLogState(void)
{
    gSpecialVar_Result = gQuestLogState;
}

u8 sub_8110AC8(void)
{
    return gSaveBlock1Ptr->questLog[sCurrentSceneNum].unk_000;
}

void sub_8110AEC(u16 eventId)
{
    if (sCurrentSceneNum >= QUEST_LOG_SCENE_COUNT)
        sCurrentSceneNum = 0;

    sub_81108F0(sCurrentSceneNum);
    sub_8113B88();
    gUnknown_203AE08 = gSaveBlock1Ptr->questLog[sCurrentSceneNum].unk_568;
    if (IS_LINK_QL_EVENT(eventId) || eventId == QL_EVENT_DEPARTED)
        gSaveBlock1Ptr->questLog[sCurrentSceneNum].unk_000 = 2;
    else
        gSaveBlock1Ptr->questLog[sCurrentSceneNum].unk_000 = 1;
    QuestLog_GetSaneMonCounts();
    sub_8110BB0(sCurrentSceneNum);
    sub_8110BE8(sCurrentSceneNum);
    sub_8110D94();
    sub_8110E20();
    sub_8110D48(sCurrentSceneNum);
    gUnknown_203ADFC = 0;
    sub_8112940(2, gUnknown_203AE98, 0x100);
    sub_8110E68(gUnknown_203AE98);
    SetQuestLogState(1);
}

static void sub_8110BB0(u8 sceneNum)
{
    struct QuestLog * questLog = &gSaveBlock1Ptr->questLog[sceneNum];
    questLog->mapGroup = gSaveBlock1Ptr->location.mapGroup;
    questLog->mapNum = gSaveBlock1Ptr->location.mapNum;
    questLog->warpId = gSaveBlock1Ptr->location.warpId;
    questLog->x = gSaveBlock1Ptr->pos.x;
    questLog->y = gSaveBlock1Ptr->pos.y;
}

static void sub_8110BE8(u8 sceneNum)
{
    struct QuestLog * questLog = &gSaveBlock1Ptr->questLog[sceneNum];
    u16 i;

    SetQuestLogObjectEventsData(questLog);

    for (i = 0; i < NELEMS(gSaveBlock1Ptr->objectEventTemplates); i++)
    {
        if (gSaveBlock1Ptr->objectEventTemplates[i].x < 0)
        {
            questLog->npcData[i].x = -1 * gSaveBlock1Ptr->objectEventTemplates[i].x;
            questLog->npcData[i].negx = TRUE;
        }
        else
        {
            questLog->npcData[i].x = (u8)gSaveBlock1Ptr->objectEventTemplates[i].x;
            questLog->npcData[i].negx = FALSE;
        }
        if (gSaveBlock1Ptr->objectEventTemplates[i].y < 0)
        {
            questLog->npcData[i].y = (-gSaveBlock1Ptr->objectEventTemplates[i].y << 24) >> 24;
            questLog->npcData[i].negy = TRUE;
        }
        else
        {
            questLog->npcData[i].y = (u8)gSaveBlock1Ptr->objectEventTemplates[i].y;
            questLog->npcData[i].negy = FALSE;
        }
        questLog->npcData[i].elevation = gSaveBlock1Ptr->objectEventTemplates[i].elevation;
        questLog->npcData[i].movementType = gSaveBlock1Ptr->objectEventTemplates[i].movementType;
    }
}

static void sub_8110D48(u8 sceneNum)
{
    struct QuestLog * questLog = &gSaveBlock1Ptr->questLog[sceneNum];

    CpuCopy16(gSaveBlock1Ptr->flags, questLog->flags, FLAGS_COUNT * sizeof(u8));
    CpuCopy16(gSaveBlock1Ptr->vars, questLog->vars, VARS_COUNT * sizeof(u16));
}

static void sub_8110D94(void)
{
    u16 i, j;
    u16 sp0[4];

    for (i = 0; i < 4; i++)
    {
        sp0[i] = 0;
        for (j = 0; j < 16; j++)
        {
            if (gSaveBlock1Ptr->trainerRematches[16 * i + j])
            {
                sp0[i] += (1 << j);
            }
        }
        VarSet(VAR_0x40AA + i, sp0[i]);
    }
}

static void sub_8110E20(void)
{
    VarSet(VAR_0x40AE, gSaveBlock1Ptr->mapLayoutId);
}

static void sub_8110E3C(void)
{
    sub_8113BF4(gUnknown_203AE08);
    if (++sCurrentSceneNum >= QUEST_LOG_SCENE_COUNT)
        sCurrentSceneNum = 0;
}

static bool8 sub_8110E68(struct UnkStruct_203AE98 * a0)
{
    u16 i;

    for (i = gUnknown_203ADFC; i < sQuestLogIdx; i++)
    {
        if (gUnknown_203AE08 == NULL)
            return FALSE;
        switch (a0[i].unk_6)
        {
        case 0:
        case 1:
            gUnknown_203AE08 = sub_8113D48(gUnknown_203AE08, &a0[i]);
            break;
        default:
            gUnknown_203AE08 = sub_8113CC8(gUnknown_203AE08, &a0[i]);
            break;
        }
        if (gUnknown_203AE08 == NULL)
        {
            gUnknown_3005E88 = 0;
            return FALSE;
        }
    }

    if (gUnknown_3005E88 == 0)
    {
        gUnknown_203AE08 = sub_8113BF4(gUnknown_203AE08);
        return FALSE;
    }
    gUnknown_203ADFC = sQuestLogIdx;
    return TRUE;
}

void TrySetUpQuestLogScenes_ElseContinueFromSave(u8 taskId)
{
    u8 i;

    sub_811381C();
    sNumScenes = 0;
    for (i = 0; i < QUEST_LOG_SCENE_COUNT; i++)
    {
        if (gSaveBlock1Ptr->questLog[i].unk_000)
            sNumScenes++;
    }

    if (sNumScenes != 0)
    {
        gHelpSystemEnabled = FALSE;
        sub_8110F90(taskId);
        DestroyTask(taskId);
    }
    else
    {
        SetMainCallback2(CB2_ContinueSavedGame);
        DestroyTask(taskId);
    }
}

static void sub_8110F90(u8 unused)
{
    gSaveBlock1Ptr->location.mapGroup = 3;
    gSaveBlock1Ptr->location.mapNum = 19;
    gSaveBlock1Ptr->location.warpId = -1;
    sCurrentSceneNum = 0;
    gDisableMapMusicChangeOnMapLoad = 1;
    DisableWildEncounters(TRUE);
    sub_8111368();
}

void sub_8110FCC(void)
{
    sub_811175C(sCurrentSceneNum, gUnknown_203AE98);
    sub_8113B88();
    sub_8112940(1, gUnknown_203AE98, 0x100);
    sub_8111150(sCurrentSceneNum);
}

bool8 sub_8111000(void)
{
    LoadPalette(stdpal_get(4), 0xF0, 0x20);
    SetQuestLogState(2);
    sub_807DF64();
    gUnknown_203AE94 = (struct UnkStruct_203AE94){};
    gUnknown_203AE94.unk_0_0 = 2;
    return 1;
}

bool8 sub_8111038(void)
{
    LoadPalette(stdpal_get(4), 0xF0, 0x20);
    SetQuestLogState(2);
    sub_807DF7C();
    gUnknown_203AE94 = (struct UnkStruct_203AE94){};
    gUnknown_203AE94.unk_0_0 = 2;
    return 1;
}

void DrawPreviouslyOnQuestHeader(u8 sceneNum)
{
    u8 i;

    for (i = 0; i < 3; i++)
    {
        gUnknown_203ADFE[i] = AddWindow(&gUnknown_845661C[i]);
        FillWindowPixelRect(gUnknown_203ADFE[i], 15, 0, 0, gUnknown_845661C[i].width * 8, gUnknown_845661C[i].height * 8);
    }

    StringExpandPlaceholders(gStringVar4, QuestLog_Text_PreviouslyOnYourQuest);

    // Scene numbers count from 4 to 0, 0 being where the player saved
    if (sceneNum != 0)
    {
        ConvertIntToDecimalStringN(gStringVar1, sceneNum, STR_CONV_MODE_LEFT_ALIGN, 1);
        StringAppend(gStringVar4, gStringVar1);
    }

    AddTextPrinterParameterized4(gUnknown_203ADFE[0], 2, 2, 2, 1, 2, sTextColors, 0, gStringVar4);
    PutWindowTilemap(gUnknown_203ADFE[0]);
    PutWindowTilemap(gUnknown_203ADFE[1]);
    CopyWindowToVram(gUnknown_203ADFE[0], 2);
    CopyWindowToVram(gUnknown_203ADFE[2], 2);
    CopyWindowToVram(gUnknown_203ADFE[1], 3);
}

void sub_8111134(void)
{
    PutWindowTilemap(gUnknown_203ADFE[1]);
    CopyWindowToVram(gUnknown_203ADFE[1], 1);
}

static void sub_8111150(u8 sceneNum)
{
    struct QuestLog *questLog = &gSaveBlock1Ptr->questLog[sceneNum];
    u16 i;
    
    for (i = 0; i < 64; i++)
    {
        if (questLog->npcData[i].negx)
            gSaveBlock1Ptr->objectEventTemplates[i].x = -questLog->npcData[i].x;
        else
            gSaveBlock1Ptr->objectEventTemplates[i].x = questLog->npcData[i].x;
        if (questLog->npcData[i].negy)
            gSaveBlock1Ptr->objectEventTemplates[i].y = -(u8)questLog->npcData[i].y;
        else
            gSaveBlock1Ptr->objectEventTemplates[i].y = questLog->npcData[i].y;
        gSaveBlock1Ptr->objectEventTemplates[i].elevation = questLog->npcData[i].elevation;
        gSaveBlock1Ptr->objectEventTemplates[i].movementType = questLog->npcData[i].movementType;
    }

    sub_815A1F8(questLog, gSaveBlock1Ptr->objectEventTemplates);
}

void sub_8111274(u8 sceneNum, bool8 a1)
{
    struct WarpData sp0;
    
    if (!a1)
    {
        gSaveBlock1Ptr->location.mapGroup = gSaveBlock1Ptr->questLog[sceneNum].mapGroup;
        gSaveBlock1Ptr->location.mapNum = gSaveBlock1Ptr->questLog[sceneNum].mapNum;
        gSaveBlock1Ptr->location.warpId = gSaveBlock1Ptr->questLog[sceneNum].warpId;
        gSaveBlock1Ptr->pos.x = gSaveBlock1Ptr->questLog[sceneNum].x;
        gSaveBlock1Ptr->pos.y = gSaveBlock1Ptr->questLog[sceneNum].y;
    }
    else
    {
        sp0.mapGroup = gSaveBlock1Ptr->questLog[sceneNum].mapGroup;
        sp0.mapNum = gSaveBlock1Ptr->questLog[sceneNum].mapNum;
        sp0.warpId = gSaveBlock1Ptr->questLog[sceneNum].warpId;
        sp0.x = gSaveBlock1Ptr->questLog[sceneNum].x;
        sp0.y = gSaveBlock1Ptr->questLog[sceneNum].y;
        sub_8055D5C(&sp0);
    }
}

static void sub_8111368(void)
{
    gQuestLogState = 2;
    ResetSpecialVars();
    ClearBag();
    ClearPCItemSlots();
    if (sub_8110AC8() == 1)
    {
        sub_8111274(sCurrentSceneNum, FALSE);
        gFieldCallback2 = sub_8111038;
        SetMainCallback2(sub_80572A8);
    }
    else
    {
        sub_8111274(sCurrentSceneNum, TRUE);
        WarpIntoMap();
        gFieldCallback2 = sub_8111000;
        SetMainCallback2(sub_805726C);
    }
}

void sub_81113E4(void)
{
    struct QuestLog * questLog = &gSaveBlock1Ptr->questLog[sCurrentSceneNum];

    CpuCopy16(questLog->flags, gSaveBlock1Ptr->flags, FLAGS_COUNT * sizeof(u8));
    CpuCopy16(questLog->vars, gSaveBlock1Ptr->vars, VARS_COUNT * sizeof(u16));
    sub_8111688();
}

struct PokemonAndSomethingElse
{
    struct Pokemon mon;
    u16 sanePartyCount;
    u16 saneBoxesCount;
};

void sub_8111438(void)
{
    struct PokemonAndSomethingElse *r9 = AllocZeroed(sizeof(struct PokemonAndSomethingElse));
    u16 r0, r3, r5, r6;

    CreateMon(&r9->mon, SPECIES_RATTATA, 1, 0x20, FALSE, 0, 0, 0);
    r0 = VarGet(VAR_QUEST_LOG_MON_COUNTS);
    r9->sanePartyCount = r0 >> 12;
    r9->saneBoxesCount = r0 % 0x1000;

    r5 = QuestLog_GetSanePartyCount();
    if (r5 > r9->sanePartyCount)
    {
        for (r3 = 0; r3 < r5 - r9->sanePartyCount; r3++)
        {
            ZeroMonData(&gPlayerParty[5 - r3]);
        }
    }
    else if (r5 < r9->sanePartyCount)
    {
        for (r3 = 0; r3 < 5; r3++)
        {
            sub_808BCB4(0, r3);
        }
        for (r3 = r5; r3 < r9->sanePartyCount; r3++)
        {
            CopyMon(&gPlayerParty[r3], &r9->mon, sizeof(struct Pokemon));
        }
    }

    r5 = QuestLog_GetSaneBoxCount();
    if (r5 > r9->saneBoxesCount)
    {
        for (r3 = 0; r3 < 14; r3++)
        {
            for (r6 = 0; r6 < 30; r6++)
            {
                if (GetBoxMonDataFromAnyBox(r3, r6, MON_DATA_SANITY_HAS_SPECIES))
                {
                    sub_808BCB4(r3, r6);
                    r5--;
                    if (r5 == r9->saneBoxesCount)
                        break;
                }
            }
            if (r5 == r9->saneBoxesCount)
                break;
        }
    }
    else if (r5 < r9->saneBoxesCount)
    {
        for (r3 = 0; r3 < TOTAL_BOXES_COUNT; r3++)
        {
            for (r6 = 0; r6 < IN_BOX_COUNT; r6++)
            {
                struct BoxPokemon * boxMon = GetBoxedMonPtr(r3, r6);
                if (!GetBoxMonData(boxMon, MON_DATA_SANITY_HAS_SPECIES))
                {
                    CopyMon(boxMon, &r9->mon.box, sizeof(struct BoxPokemon));
                    r5++;
                    if (r5 == r9->saneBoxesCount)
                        break;
                }
            }
            if (r5 == r9->saneBoxesCount)
                break;
        }
    }

    Free(r9);
}

static void QuestLog_GetSaneMonCounts(void)
{
    u16 partyCount = QuestLog_GetSanePartyCount();
    u16 boxesCount = QuestLog_GetSaneBoxCount();
    VarSet(VAR_QUEST_LOG_MON_COUNTS, (partyCount << 12) + boxesCount);
}

static u16 QuestLog_GetSanePartyCount(void)
{
    u16 count = 0;
    u16 i;

    for (i = 0; i < PARTY_SIZE; i++)
    {
        if (GetMonData(&gPlayerParty[i], MON_DATA_SANITY_HAS_SPECIES))
            count++;
    }

    return count;
}

static u16 QuestLog_GetSaneBoxCount(void)
{
    u16 count = 0;
    u16 i, j;

    for (i = 0; i < TOTAL_BOXES_COUNT; i++)
    {
        for (j = 0; j < IN_BOX_COUNT; j++)
        {
            if (GetBoxMonDataFromAnyBox(i, j, MON_DATA_SANITY_HAS_SPECIES))
                count++;
        }
    }

    return count;
}

static void sub_8111688(void)
{
    u16 i, j;
    u16 sp0[4];

    for (i = 0; i < 4; i++)
    {
        sp0[i] = VarGet(VAR_0x40AA + i);

        for (j = 0; j < 16; j++)
        {
            if (sp0[i] & 1)
                gSaveBlock1Ptr->trainerRematches[16 * i + j] = 30;
            else
                gSaveBlock1Ptr->trainerRematches[16 * i + j] = 0;
            sp0[i] >>= 1;
        }
    }
}

void sub_8111708(void)
{
    struct MapHeader sp0;

    gSaveBlock1Ptr->mapLayoutId = VarGet(VAR_0x40AE);
    if (gSaveBlock1Ptr->mapLayoutId == 0)
    {
        sp0 = *Overworld_GetMapHeaderByGroupAndId(gSaveBlock1Ptr->location.mapGroup, gSaveBlock1Ptr->location.mapNum);
        gSaveBlock1Ptr->mapLayoutId = sp0.mapLayoutId;
    }
}

static void sub_811175C(u8 sceneNum, struct UnkStruct_203AE98 * a1)
{
    u16 i;
    u16 *r4;
    u16 r6 = 0;
    u16 r9 = 0;

    memset(a1, 0, 32 * sizeof(struct UnkStruct_203AE98));
    for (i = 0; i < NELEMS(gUnknown_203AE0C); i++)
    {
        gUnknown_203AE0C[i] = NULL;
    }

    r4 = gSaveBlock1Ptr->questLog[sceneNum].unk_568;
    for (i = 0; i < 32; i++)
    {
        switch (r4[0] & 0xFFF)
        {
        case QL_EVENT_0:
            r4 = sub_8113D08(r4, &a1[r6]);
            r6++;
            break;
        case QL_EVENT_1:
        case QL_EVENT_2:
            r4 = sub_8113D94(r4, &a1[r6]);
            r6++;
            break;
        case QL_EVENT_39:
            r4 = sub_8113C20(r4, &a1[r6]);
            r6++;
            break;
        case QL_EVENT_41:
            r4 = sub_8113C8C(r4, &a1[r6]);
            r6++;
            break;
        default:
            r4 = QuestLog_SkipCommand(r4, &gUnknown_203AE0C[r9]);
            if (r9 == 0)
                sub_8113ABC(gUnknown_203AE0C[0]);
            r9++;
            break;
        }
        if (r4 == NULL)
            break;
    }
}

static void sub_81118F4(s8 a0)
{
    FadeScreen(1, a0);
    sQuestLogCB = QuestLog_AdvancePlayhead;
}

static void QuestLog_AdvancePlayhead(void)
{
    if (!gPaletteFade.active)
    {
        ScriptContext2_Enable();
        if (++sCurrentSceneNum < QUEST_LOG_SCENE_COUNT && gSaveBlock1Ptr->questLog[sCurrentSceneNum].unk_000)
        {
            sNumScenes--;
            sub_8111368();
        }
        else
        {
            gUnknown_3005E88 = 0;
            QuestLog_StartFinalScene();
        }
    }
}

static void QuestLog_StartFinalScene(void)
{
    ResetSpecialVars();
    Save_ResetSaveCounters();
    Save_LoadGameData(SAVE_NORMAL);
    SetMainCallback2(sub_8057430);
    gFieldCallback2 = sub_8111F60;
    FreeAllWindowBuffers();
    gQuestLogState = 3;
    sQuestLogCB = NULL;
}

void sub_81119C8(void)
{
    QuestLog_AdvancePlayhead();
}

bool8 QuestLog_SchedulePlaybackCB(void (*callback)(void))
{
    u8 taskId;

    switch (gQuestLogState)
    {
        case 1:
            sub_8112364();
            break;
        case 2:
            gUnknown_3005E88 = 3;
            taskId = CreateTask(Task_RunPlaybackCB, 80);
            gTasks[taskId].data[0] = 0;
            gTasks[taskId].data[1] = 0;
            SetWordTaskArg(taskId, 14, (uintptr_t)callback);
            return TRUE;
    }
    return FALSE;
}

static void Task_RunPlaybackCB(u8 taskId)
{
    void (*routine)(void);
    s16 *data = gTasks[taskId].data;

    switch (data[1])
    {
    case 0:
        if (++data[0] == 0x7F)
        {
            BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, 0);
            gUnknown_203AE94.unk_0_6 = 2;
            data[1]++;
        }
        break;
    case 1:
        if (!gPaletteFade.active)
        {
            gUnknown_3005E88 = 0;
            routine = (void (*)(void)) GetWordTaskArg(taskId, 14);
            if (routine != NULL)
                routine();
            DestroyTask(taskId);
            sQuestLogCB = QuestLog_AdvancePlayhead;
        }
        break;
    }
}

static void sub_8111AD8(void)
{
    if (gUnknown_203AE94.unk_0_0 == 1)
    {
        if (--gUnknown_203AE94.unk_2 != 0)
            return;
        gUnknown_203AE94.unk_0_0 = 0;
        gUnknown_203AE94.unk_0_4 = 1;
        sub_8112888(2);
    }

    if (gUnknown_203AE94.unk_0_4 == 1)
    {
        if (++gUnknown_203AE94.unk_3 > 15)
        {
            QuestLog_CloseTextWindow();
            gUnknown_203AE94.unk_0_4 = 0;
            gUnknown_203AE94.unk_3 = 0;
        }
    }
    if (gUnknown_203AE94.unk_1 < NELEMS(gUnknown_203AE0C))
    {
        if (sub_8113B44(gUnknown_203AE0C[gUnknown_203AE94.unk_1]) == 1)
            sub_8111B80();
        else if (sub_8113AE8(gUnknown_203AE0C[gUnknown_203AE94.unk_1]) == 1)
            sub_8111B80();
    }
}

static void sub_8111B80(void)
{
    if (gUnknown_203AE94.unk_0_0 == 0)
    {
        gUnknown_203AE94.unk_0_0 = 1;
        gUnknown_203AE94.unk_0_4 = 0;
        gUnknown_203AE94.unk_3 = 0;
        gUnknown_203AE94.unk_2 = sub_8111BD4();
        if (gUnknown_203B044.unk_2 == 0)
            gUnknown_203AE94.unk_1++;
        if (gUnknown_203AE94.unk_1 > 32)
            return;
        DrawQuestLogSceneDescription();
    }
    sub_8112888(1);
}

static u8 sub_8111BD4(void)
{
    u16 i;
    u16 count = 0;

    for (i = 0; i < 0x400 && gStringVar4[i] != EOS; i++)
    {
        if (gStringVar4[i] != CHAR_NEWLINE)
            count++;
    }

    if (count < 20)
        return 0x5F;
    if (count < 36)
        return 0x7F;
    if (count < 46)
        return 0xBF;
    return 0xFF;
}

bool8 sub_8111C2C(void)
{
    if (gQuestLogState != 2)
        return FALSE;
    if (gUnknown_3005E88 == 0 || gUnknown_203AE94.unk_0_0 == 1 || gUnknown_203AE94.unk_0_0 == 2)
        return TRUE;
    return FALSE;
}

void sub_8111C68(void)
{
    if (gUnknown_203AE94.unk_0_6 == 0)
    {
        if (gMain.newKeys & A_BUTTON)
        {
            gUnknown_203AE94.unk_0_6 = 2;
            gUnknown_3005E88 = 0;
            sub_81118F4(-3);
        }
        else if (gMain.newKeys & B_BUTTON)
        {
            gUnknown_203AE94.unk_0_6 = 1;
            gUnknown_3005E88 = 0;
            QuestLog_SkipToEndOfPlayback(-3);
        }
    }
}

bool8 sub_8111CD0(void)
{
    if (gUnknown_203AE94.unk_0_6 != 0)
        return TRUE;
    return FALSE;
}

void sub_8111CF0(void)
{
    if (gQuestLogState == 2)
        DrawPreviouslyOnQuestHeader(sNumScenes);
}

static void DrawQuestLogSceneDescription(void)
{
    u16 i;
    u8 numLines = 0;

    for (i = 0; i < 0x100 && gStringVar4[i] != EOS; i++)
    {
        if (gStringVar4[i] == CHAR_NEWLINE)
            numLines++;
    }

    PutWindowTilemap(gUnknown_203ADFE[2]);
    sub_8111D90(gUnknown_203ADFE[2]);
    AddTextPrinterParameterized4(gUnknown_203ADFE[2], 2, 2, sQuestLogTextLineYCoords[numLines], 1, 0, sTextColors, 0, gStringVar4);
    ScheduleBgCopyTilemapToVram(0);
}

static void sub_8111D90(u8 a0)
{
    const u16 *src = gUnknown_8456638;
    u16 *buffer = Alloc(0x1680);
    u8 i, j, y;

    if (buffer)
    {
        for (i = 0; i < 6; i++)
        {
            switch (i)
            {
            default:
                y = 1;
                break;
            case 0:
                y = 0;
                break;
            case 5:
                y = 2;
                break;
            }

            // r6 = y * 32
            // r5 = 2 * (i % 16)
            // r4 = j
            for (j = 0; j < 30; j++)
            {
                CpuCopy32(src + 16 * y, buffer + 16 * (2 * (15 * i) + j), 32);
            }
        }

        CopyToWindowPixelBuffer(a0, (const u8 *)buffer, 0x1680, 0);
        Free(buffer);
    }
}

static void QuestLog_CloseTextWindow(void)
{
    ClearWindowTilemap(gUnknown_203ADFE[2]);
    FillWindowPixelRect(gUnknown_203ADFE[2], 15, 0, 0, 0xf0, 0x30);
    CopyWindowToVram(gUnknown_203ADFE[2], 2);
    PutWindowTilemap(gUnknown_203ADFE[1]);
    CopyWindowToVram(gUnknown_203ADFE[1], 1);
}

static void QuestLog_SkipToEndOfPlayback(s8 a0)
{
    FadeScreen(1, a0);
    sQuestLogCB = QuestLog_WaitFadeAndCancelPlayback;
}

static void QuestLog_WaitFadeAndCancelPlayback(void)
{
    if (!gPaletteFade.active)
    {
        ScriptContext2_Enable();
        for (sCurrentSceneNum = sCurrentSceneNum; sCurrentSceneNum < QUEST_LOG_SCENE_COUNT; sCurrentSceneNum++)
        {
            if (gSaveBlock1Ptr->questLog[sCurrentSceneNum].unk_000 == 0)
                break;
            sub_811175C(sCurrentSceneNum, gUnknown_203AE98);
        }
        gUnknown_3005E88 = 0;
        QuestLog_StartFinalScene();
    }
}

void sub_8111F14(void)
{
    if (gQuestLogState == 3)
        gUnknown_203AE90 = AllocZeroed(0x200 * sizeof(u16));
}

void sub_8111F38(u16 a0, u16 a1)
{
    CpuSet(gPlttBufferUnfaded + a0, gUnknown_203AE90 + a0, a1);
}

static bool8 sub_8111F60(void)
{
    LoadPalette(stdpal_get(4), 0xF0, 0x20);
    DrawPreviouslyOnQuestHeader(0);
    sub_807DF7C();
    CreateTask(sub_8111F8C, 0xFF);
    return TRUE;
}

static void sub_8111F8C(u8 taskId)
{
    struct Task *task = &gTasks[taskId];

    if (ScriptContext2_IsEnabled() != TRUE)
    {
        FreezeObjectEvents();
        sub_805C270();
        sub_805C780();
        ScriptContext2_Enable();
        task->func = Task_QuestLogScene_SavedGame;
    }
}

static void Task_QuestLogScene_SavedGame(u8 taskId)
{
    struct Task *task = &gTasks[taskId];

    if (!gPaletteFade.active)
    {
        if (gUnknown_203AE94.unk_0_6 != 1)
        {
            GetMapNameGeneric(gStringVar1, gMapHeader.regionMapSectionId);
            StringExpandPlaceholders(gStringVar4, QuestLog_Text_SavedGameAtLocation);
            DrawQuestLogSceneDescription();
        }
        task->data[0] = 0;
        task->data[1] = 0;
        task->func = Task_WaitAtEndOfQuestLog;
        FreezeObjectEvents();
        ScriptContext2_Enable();
    }
}

#define tTimer data[0]

static void Task_WaitAtEndOfQuestLog(u8 taskId)
{
    struct Task *task = &gTasks[taskId];

    if (gMain.newKeys & (A_BUTTON | B_BUTTON) || task->tTimer >= 127 || gUnknown_203AE94.unk_0_6 == 1)
    {
        QuestLog_CloseTextWindow();
        task->tTimer = 0;
        task->func = Task_EndQuestLog;
        gQuestLogState = 0;
    }
    else
        task->tTimer++;
}

#undef tTimer

#define tState data[0]
#define tTimer data[1]

static void Task_EndQuestLog(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    u8 i;

    switch (tState)
    {
    case 0:
        gDisableMapMusicChangeOnMapLoad = 0;
        Overworld_PlaySpecialMapMusic();
        sub_811229C();
        FillWindowPixelRect(gUnknown_203ADFE[0], 0xF, 0, 0, gUnknown_845661C[0].width * 8, gUnknown_845661C[0].height * 8);
        tState++;
        break;
    case 1:
        if (sub_81121D8(taskId))
        {
            for (i = 0; i < 3; i++)
            {
                ClearWindowTilemap(gUnknown_203ADFE[i]);
                CopyWindowToVram(gUnknown_203ADFE[i], 1);
                RemoveWindow(gUnknown_203ADFE[i]);
            }
            tTimer = 0;
            tState++;
        }
        break;
    case 2:
        if (tTimer < 32)
            tTimer++;
        else
            tState++;
        break;
    default:
        if (gUnknown_203AE94.unk_0_6 == 1)
            CreateMapNamePopupIfNotAlreadyRunning(1);
        CpuCopy16(gUnknown_203AE90, gPlttBufferUnfaded, 0x400);
        Free(gUnknown_203AE90);
        gUnknown_203AE94 = (struct UnkStruct_203AE94){};
        sub_80696C0();
        ScriptContext2_Disable();
        gTextFlags.autoScroll = FALSE;
        gUnknown_2036E28 = 0;
        DisableWildEncounters(FALSE);
        gHelpSystemEnabled = TRUE;
        DestroyTask(taskId);
        break;
    }
}

#undef tState
#undef tTimer

static bool8 sub_81121D8(u8 taskId)
{
    s16 *data = gTasks[taskId].data;

    if (data[1] > 15)
        return TRUE;

    sub_80716F8(gPlttBufferUnfaded + 0x01, gPlttBufferFaded + 0x01, 0xDF, 0x0F - data[1]);
    sub_80716F8(gPlttBufferUnfaded + 0x100, gPlttBufferFaded + 0x100, 0x100, 0x0F - data[1]);
    FillWindowPixelRect(gUnknown_203ADFE[0], 0x00, 0, gUnknown_845661C[0].height * 8 - 1 - data[1], gUnknown_845661C[0].width * 8, 1);
    FillWindowPixelRect(gUnknown_203ADFE[1], 0x00, 0, data[1], gUnknown_845661C[1].width * 8, 1);
    CopyWindowToVram(gUnknown_203ADFE[0], 2);
    CopyWindowToVram(gUnknown_203ADFE[1], 2);
    data[1]++;
    return FALSE;
}

static void sub_811229C(void)
{
    u16 *buffer = Alloc(0x400);
    CpuCopy16(gUnknown_203AE90, buffer, 0x400);
    sub_807B0C4(gUnknown_203AE90, gUnknown_203AE90, 0xd0);
    sub_807B0C4(gUnknown_203AE90 + 0x110, gUnknown_203AE90 + 0x110, 0x10);
    sub_807B0C4(gUnknown_203AE90 + 0x160, gUnknown_203AE90 + 0x160, 0x40);
    sub_807B0C4(gUnknown_203AE90 + 0x1b0, gUnknown_203AE90 + 0x1b0, 0x50);
    CpuCopy16(gUnknown_203AE90, gPlttBufferUnfaded, 0x400);
    CpuCopy16(buffer, gUnknown_203AE90, 0x400);
    Free(buffer);
}

void sub_811231C(void)
{
    if (gQuestLogState == 1)
    {
        sub_8110E68(gUnknown_203AE98);
        sub_8110E3C();
        gQuestLogState = 0;
        sQuestLogCB = NULL;
        gUnknown_203AE04 = NULL;
        gUnknown_203AE08 = NULL;
        gUnknown_3005E88 = 0;
    }
}

void sub_8112364(void)
{
    if (gUnknown_3005E88 && gQuestLogState == 1)
    {
        sub_8110E68(gUnknown_203AE98);
        sub_8113A1C(1);
        sub_8110E3C();
        gUnknown_3005E88 = 0;
        gQuestLogState = 0;
        sQuestLogCB = NULL;
    }
    gUnknown_203AE04 = NULL;
    gUnknown_203AE08 = NULL;
}

void sub_81123BC(void)
{
    struct QuestLog * buffer = AllocZeroed(QUEST_LOG_SCENE_COUNT * sizeof(struct QuestLog));
    u8 i;
    u8 sceneNum = sCurrentSceneNum;
    u8 count = 0;
    for (i = 0; i < QUEST_LOG_SCENE_COUNT; i++)
    {
        if (sceneNum >= QUEST_LOG_SCENE_COUNT)
            sceneNum = 0;
        if (gSaveBlock1Ptr->questLog[sceneNum].unk_000)
        {
            buffer[count] = gSaveBlock1Ptr->questLog[sceneNum];
            count++;
        }
        sceneNum++;
    }
    sCurrentSceneNum = count % QUEST_LOG_SCENE_COUNT;
    CpuCopy16(buffer, gSaveBlock1Ptr->questLog, QUEST_LOG_SCENE_COUNT * sizeof(struct QuestLog));
    Free(buffer);
}

void sub_8112450(void)
{
    if (MenuHelpers_LinkSomething() != TRUE)
    {
        sub_8112364();
        sub_81123BC();
    }
}

void sub_811246C(struct Sprite *sprite)
{
    struct ObjectEvent *objectEvent = &gObjectEvents[sprite->data[0]];
    if (objectEvent->localId == OBJ_EVENT_ID_PLAYER)
    {
        if (gUnknown_203AF9A[0][0] != OBJ_EVENT_ID_PLAYER)
        {
            ObjectEventSetHeldMovement(objectEvent, gUnknown_203AF9A[0][0]);
            gUnknown_203AF9A[0][0] = OBJ_EVENT_ID_PLAYER;
        }
        if (gUnknown_203AF9A[0][1] != OBJ_EVENT_ID_PLAYER)
        {
            sub_8150454();
            gUnknown_203AF9A[0][1] = OBJ_EVENT_ID_PLAYER;
        }
        sub_8063E28(objectEvent, sprite);
    }
    else
    {
        if (gUnknown_203AF9A[objectEvent->localId][0] != OBJ_EVENT_ID_PLAYER)
        {
            ObjectEventSetHeldMovement(objectEvent, gUnknown_203AF9A[objectEvent->localId][0]);
            gUnknown_203AF9A[objectEvent->localId][0] = OBJ_EVENT_ID_PLAYER;
        }
        sub_8063E28(objectEvent, sprite);
    }
}

void sub_81124EC(u8 a0, u8 a1, u8 a2, u8 a3)
{
    if (!sub_8112CEC())
    {
        gUnknown_3005E94[sQuestLogIdx].unk_4 = gUnknown_203B01A;
        gUnknown_3005E94[sQuestLogIdx].unk_6 = 0;
        gUnknown_3005E94[sQuestLogIdx].unk_0 = a0;
        gUnknown_3005E94[sQuestLogIdx].unk_1 = a1;
        gUnknown_3005E94[sQuestLogIdx].unk_2 = a2;
        gUnknown_3005E94[sQuestLogIdx].unk_3 = a3;
        sQuestLogIdx++;
        gUnknown_203B01A = 0;
    }
}

void sub_8112588(u8 a0, u8 a1, u8 a2, u8 a3, u8 a4)
{
    if (!sub_8112D1C())
    {
        gUnknown_3005E94[sQuestLogIdx].unk_4 = gUnknown_203B01A;
        gUnknown_3005E94[sQuestLogIdx].unk_6 = 0;
        gUnknown_3005E94[sQuestLogIdx].unk_0 = a0;
        gUnknown_3005E94[sQuestLogIdx].unk_1 = a1;
        gUnknown_3005E94[sQuestLogIdx].unk_2 = a2;
        gUnknown_3005E94[sQuestLogIdx].unk_3 = a3;
        sQuestLogIdx++;
        gUnknown_203B01A = a4;
    }
}

void sub_8112628(u8 a0)
{
    if (!sub_8112CEC())
    {
        if (a0 != gUnknown_3005E94[gUnknown_203B01C].unk_3 || a0 > 3)
        {
            gUnknown_3005E94[sQuestLogIdx].unk_4 = gUnknown_203B01A;
            gUnknown_3005E94[sQuestLogIdx].unk_6 = 0;
            gUnknown_3005E94[sQuestLogIdx].unk_0 = 0;
            gUnknown_3005E94[sQuestLogIdx].unk_3 = a0;
            gUnknown_203B01C = sQuestLogIdx;
            sQuestLogIdx++;
            gUnknown_203B01A = 0;
        }
    }
}

void sub_81126AC(u8 a0, u8 a1)
{
    if (!sub_8112D1C())
    {
        gUnknown_3005E94[sQuestLogIdx].unk_4 = gUnknown_203B01A;
        gUnknown_3005E94[sQuestLogIdx].unk_6 = 0;
        gUnknown_3005E94[sQuestLogIdx].unk_0 = 0;
        gUnknown_3005E94[sQuestLogIdx].unk_3 = a0;
        gUnknown_203B01C = sQuestLogIdx;
        sQuestLogIdx++;
        gUnknown_203B01A = a1;
    }
}

void sub_8112720(u8 a0)
{
    if (!sub_8112D1C())
    {
        gUnknown_3005E94[sQuestLogIdx].unk_4 = gUnknown_203B01A;
        gUnknown_3005E94[sQuestLogIdx].unk_6 = 1;
        gUnknown_3005E94[sQuestLogIdx].unk_0 = 0;
        gUnknown_3005E94[sQuestLogIdx].unk_3 = a0;
        sQuestLogIdx++;
        gUnknown_203B01A = 0;
    }
}

void sub_811278C(u8 a0, u8 a1)
{
    if (!sub_8112D1C())
    {
        gUnknown_3005E94[sQuestLogIdx].unk_4 = gUnknown_203B01A;
        gUnknown_3005E94[sQuestLogIdx].unk_6 = 1;
        gUnknown_3005E94[sQuestLogIdx].unk_0 = 0;
        gUnknown_3005E94[sQuestLogIdx].unk_3 = a0;
        sQuestLogIdx++;
        gUnknown_203B01A = a1;
    }
}

void sub_81127F8(struct UnkStruct_3005E90 * a0)
{
    if (sQuestLogIdx < sNumQuestLogs)
    {
        u32 r2 = *(u32 *)a0 & 0x00FF00F3;
        gUnknown_3005E94[sQuestLogIdx].unk_4 = gUnknown_203B01A;
        gUnknown_3005E94[sQuestLogIdx].unk_6 = 2;
        gUnknown_3005E94[sQuestLogIdx].unk_0 = r2;
        gUnknown_3005E94[sQuestLogIdx].unk_1 = r2 >> 8;
        gUnknown_3005E94[sQuestLogIdx].unk_2 = r2 >> 16;
        gUnknown_3005E94[sQuestLogIdx].unk_3 = r2 >> 24;
        sQuestLogIdx++;
        if (ScriptContext2_IsEnabled())
            gUnknown_203B01A = TRUE;
        else
            gUnknown_203B01A = FALSE;
    }
}

static void sub_8112888(u8 a0)
{
    switch (a0)
    {
    case 1:
        if (gUnknown_3005E88 == 1)
            gUnknown_3005E88 = 3;
        break;
    case 2:
        if (gUnknown_3005E88 == 3)
            gUnknown_3005E88 = 1;
        break;
    }
}

void sub_81128BC(u8 a0)
{
    u8 r1 = sub_8112CAC();

    switch (a0)
    {
    case 1:
        if (r1 == 1)
            gUnknown_3005E88 = 3;
        else if (r1 == 2)
        {
            gUnknown_3005E94[sQuestLogIdx].unk_4 = gUnknown_203B01A;
            gUnknown_3005E94[sQuestLogIdx].unk_6 = 3;
            sQuestLogIdx++;
            gUnknown_203B01A = 0;
            gUnknown_3005E88 = 4;
        }
        break;
    case 2:
        if (r1 == 1)
            gUnknown_3005E88 = 1;
        else if (r1 == 2)
            gUnknown_3005E88 = 2;
        break;
    }
}

static void sub_8112940(u8 a0, struct UnkStruct_203AE98 *a1, u16 a2)
{
    s32 i;

    switch (a0)
    {
    default:
        gUnknown_3005E88 = 0;
        break;
    case 1:
        gUnknown_3005E94 = a1;
        sNumQuestLogs = a2 / 8;
        for (i = 0; i < 0x40; i++)
        {
            gUnknown_203AF9A[i][0] |= 0xFF;
            gUnknown_203AF9A[i][1] |= 0xFF;
        }
        sQuestLogIdx = 0;
        gUnknown_203B01C = 0;
        gUnknown_3005E90 = (struct UnkStruct_3005E90){};
        gUnknown_203B01A = gUnknown_3005E94[sQuestLogIdx].unk_4;
        gUnknown_203AF9A[0][0] = gUnknown_3005E94[sQuestLogIdx].unk_3;
        gUnknown_203AF9A[0][1] = 0xFF;
        gUnknown_3005E88 = 1;
        break;
    case 2:
        gUnknown_3005E94 = a1;
        sNumQuestLogs = a2 / 8;
        for (i = 0; i < sNumQuestLogs; i++)
        {
            gUnknown_3005E94[i] = (struct UnkStruct_203AE98){ 0, 0, 0, 0, 0xFFFF, 0xFF };
        }
        sQuestLogIdx = 0;
        gUnknown_203B01A = 0;
        gUnknown_3005E94[sQuestLogIdx].unk_4 = 0;
        gUnknown_3005E94[sQuestLogIdx].unk_6 = 0;
        gUnknown_3005E94[sQuestLogIdx].unk_0 = 0;
        switch (GetPlayerFacingDirection())
        {
        case DIR_NONE:
        case DIR_SOUTH:
            gUnknown_3005E94[sQuestLogIdx].unk_3 = DIR_SOUTH - 1;
            break;
        case DIR_EAST:
            gUnknown_3005E94[sQuestLogIdx].unk_3 = DIR_EAST - 1;
            break;
        case DIR_NORTH:
            gUnknown_3005E94[sQuestLogIdx].unk_3 = DIR_NORTH - 1;
            break;
        case DIR_WEST:
            gUnknown_3005E94[sQuestLogIdx].unk_3 = DIR_WEST - 1;
            break;
        }
        gUnknown_203B01C = 0;
        sQuestLogIdx++;
        gUnknown_3005E94[sQuestLogIdx].unk_4 = 0;
        gUnknown_3005E94[sQuestLogIdx].unk_6 = 2;
        gUnknown_3005E94[sQuestLogIdx].unk_0 = 0;
        gUnknown_3005E94[sQuestLogIdx].unk_1 = 0;
        gUnknown_3005E94[sQuestLogIdx].unk_2 = 0;
        gUnknown_3005E94[sQuestLogIdx].unk_3 = 0;
        sQuestLogIdx++;
        gUnknown_3005E88 = 2;
        break;
    }
}

void sub_8112B3C(void)
{
    switch (gUnknown_3005E88)
    {
    case 0:
        break;
    case 1:
        if (!sub_8112CEC())
        {
            if (gUnknown_203B01A != 0)
                gUnknown_203B01A--;
            else
            {
                do
                {
                    switch (gUnknown_3005E94[sQuestLogIdx].unk_6)
                    {
                    case 0:
                        gUnknown_203AF9A[gUnknown_3005E94[sQuestLogIdx].unk_0][0] = gUnknown_3005E94[sQuestLogIdx].unk_3;
                        break;
                    case 1:
                        gUnknown_203AF9A[gUnknown_3005E94[sQuestLogIdx].unk_0][1] = gUnknown_3005E94[sQuestLogIdx].unk_3;
                        break;
                    case 2:
                        *(u32 *)&gUnknown_3005E90 = ((gUnknown_3005E94[sQuestLogIdx].unk_3 << 24) | (gUnknown_3005E94[sQuestLogIdx].unk_2 << 16) | (gUnknown_3005E94[sQuestLogIdx].unk_1 << 8) | (gUnknown_3005E94[sQuestLogIdx].unk_0 << 0));
                        break;
                    case 3:
                        gUnknown_3005E88 = 3;
                        break;
                    case 0xFE:
                        break;
                    case 0xFF:
                        gUnknown_3005E88 = 0;
                        break;
                    }
                    if (gUnknown_3005E88 == 0)
                        break;
                    if (++sQuestLogIdx >= sNumQuestLogs)
                    {
                        gUnknown_3005E88 = 0;
                        break;
                    }
                    gUnknown_203B01A = gUnknown_3005E94[sQuestLogIdx].unk_4;
                } while (gUnknown_3005E88 != 3
                      && (gUnknown_203B01A == 0 || gUnknown_203B01A == 0xFFFF));
            }
        }
        else if (sQuestLogIdx >= sNumQuestLogs)
        {
            gUnknown_3005E88 = 0;
        }
        break;
    case 2:
        if (ScriptContext2_IsEnabled() != TRUE)
        {
            gUnknown_203B01A++;
            if (sQuestLogIdx >= sNumQuestLogs)
                gUnknown_3005E88 = 0;
        }
        break;
    case 3:
        break;
    case 4:
        break;
    }
}

void sub_8112C9C(void)
{
    gUnknown_203B01A++;
}

u8 sub_8112CAC(void)
{
    switch (gUnknown_3005E88)
    {
    case 0:
    default:
        return 0;
    case 1:
    case 3:
        return 1;
    case 2:
    case 4:
        return 2;
    }
}

static bool8 sub_8112CEC(void)
{
    if (sQuestLogIdx >= sNumQuestLogs || ScriptContext2_IsEnabled() == TRUE)
        return TRUE;
    return FALSE;
}

static bool8 sub_8112D1C(void)
{
    if (sQuestLogIdx >= sNumQuestLogs)
        return TRUE;
    return FALSE;
}

static const struct UnkStruct_300201C gUnknown_84566A4 = {
    0,
    FALSE,
    0x7FFF
};

void * QuestLogGetFlagOrVarPtr(bool8 isFlag, u16 idx)
{
    void * response;
    if (sQuestLogIdx == 0)
        return NULL;
    if (sQuestLogIdx >= sNumQuestLogs)
        return NULL;
    if (sFlagOrVarPlayhead >= sNumFlagsOrVars)
        return NULL;
    if (sFlagOrVarRecords[sFlagOrVarPlayhead].idx == idx && sFlagOrVarRecords[sFlagOrVarPlayhead].isFlag == isFlag)
    {
        response = &sFlagOrVarRecords[sFlagOrVarPlayhead].value;
        sFlagOrVarPlayhead++;
    }
    else
        response = NULL;
    return response;
}

void QuestLogSetFlagOrVar(bool8 isFlag, u16 idx, u16 value)
{
    if (sQuestLogIdx == 0)
        return;
    if (sQuestLogIdx >= sNumQuestLogs)
        return;
    if (sFlagOrVarPlayhead >= sNumFlagsOrVars)
        return;
    sFlagOrVarRecords[sFlagOrVarPlayhead].idx = idx;
    sFlagOrVarRecords[sFlagOrVarPlayhead].isFlag = isFlag;
    sFlagOrVarRecords[sFlagOrVarPlayhead].value = value;
    sFlagOrVarPlayhead++;
}

void sub_8112E3C(u8 a0, struct UnkStruct_300201C * a1, u16 a2)
{
    s32 i;

    if (a0 == 0 || a0 > 2)
        gUnknown_3005E88 = 0;
    else
    {
        sFlagOrVarRecords = a1;
        sNumFlagsOrVars = a2 >> 2;
        sFlagOrVarPlayhead = 0;
        if (a0 == 2)
        {
            for (i = 0; i < sNumQuestLogs; i++)
            {
                sFlagOrVarRecords[i] = gUnknown_84566A4;
            }
        }
    }
}


// Probable file boundary, help_message.c below, quest_log.c above


const u16 gUnknown_84566A8[] = INCBIN_U16("data/graphics/unknown_84566a8.bin");

static const struct WindowTemplate sHelpMessageWindowTemplate = {
    0x00, 0, 15, 30, 5, 15, 0x008F
};

void MapNamePopupWindowIdSetDummy(void)
{
    sHelpMessageWindowId = 0xFF;
}

u8 CreateHelpMessageWindow(void)
{
    if (sHelpMessageWindowId == 0xFF)
    {
        sHelpMessageWindowId = AddWindow(&sHelpMessageWindowTemplate);
        PutWindowTilemap(sHelpMessageWindowId);
    }
    return sHelpMessageWindowId;
}

void DestroyHelpMessageWindow(u8 a0)
{
    if (sHelpMessageWindowId != 0xFF)
    {
        FillWindowPixelBuffer(sHelpMessageWindowId, PIXEL_FILL(0));
        ClearWindowTilemap(sHelpMessageWindowId);

        if (a0)
            CopyWindowToVram(sHelpMessageWindowId, a0);

        RemoveWindow(sHelpMessageWindowId);
        sHelpMessageWindowId = 0xFF;
    }
}

#ifdef NONMATCHING
void sub_8112F18(u8 windowId)
{
    u8 width = GetWindowAttribute(windowId, WINDOW_WIDTH);
    u8 height = GetWindowAttribute(windowId, WINDOW_HEIGHT);
    u8 *buffer = Alloc(32 * width * height);
    u8 i, j;
    u8 k;

    if (buffer != NULL)
    {
        for (i = 0; i < height; i++)
        {
            for (j = 0; j < width; j++)
            {
                if (i == 0)
                    k = 0;
                else if (i == height - 1)
                    k = 14;
                else
                    k = 5;
                CpuCopy32(
                    (void *)gUnknown_84566A8 + 32 * k, // operand swap on "add" instruction
                    buffer + 32 * (i * width + j),
                    32
                );
            }
        }
        CopyToWindowPixelBuffer(windowId, buffer, width * height * 32, 0);
        Free(buffer);
    }
}
#else
NAKED
void sub_8112F18(u8 windowId)
{
    asm_unified("\tpush {r4-r7,lr}\n"
                "\tmov r7, r10\n"
                "\tmov r6, r9\n"
                "\tmov r5, r8\n"
                "\tpush {r5-r7}\n"
                "\tsub sp, 0x8\n"
                "\tlsls r0, 24\n"
                "\tlsrs r0, 24\n"
                "\tmov r10, r0\n"
                "\tmovs r1, 0x3\n"
                "\tbl GetWindowAttribute\n"
                "\tlsls r0, 24\n"
                "\tlsrs r6, r0, 24\n"
                "\tmov r0, r10\n"
                "\tmovs r1, 0x4\n"
                "\tbl GetWindowAttribute\n"
                "\tlsls r0, 24\n"
                "\tlsrs r7, r0, 24\n"
                "\tlsls r0, r7, 5\n"
                "\tmuls r0, r6\n"
                "\tbl Alloc\n"
                "\tmov r8, r0\n"
                "\tcmp r0, 0\n"
                "\tbeq _08112FB8\n"
                "\tmovs r5, 0\n"
                "\tadds r0, r6, 0\n"
                "\tmuls r0, r7\n"
                "\tstr r0, [sp]\n"
                "\tcmp r5, r7\n"
                "\tbcs _08112FA2\n"
                "_08112F5A:\n"
                "\tmovs r4, 0\n"
                "\tadds r1, r5, 0x1\n"
                "\tmov r9, r1\n"
                "\tcmp r4, r6\n"
                "\tbcs _08112F98\n"
                "\tsubs r3, r7, 0x1\n"
                "_08112F66:\n"
                "\tmovs r0, 0\n"
                "\tcmp r5, 0\n"
                "\tbeq _08112F74\n"
                "\tmovs r0, 0x5\n"
                "\tcmp r5, r3\n"
                "\tbne _08112F74\n"
                "\tmovs r0, 0xE\n"
                "_08112F74:\n"
                "\tlsls r0, 5\n"
                "\tldr r1, _08112FC8 @ =gUnknown_84566A8\n"
                "\tadds r0, r1, r0\n"
                "\tadds r1, r5, 0\n"
                "\tmuls r1, r6\n"
                "\tadds r1, r4\n"
                "\tlsls r1, 5\n"
                "\tadd r1, r8\n"
                "\tldr r2, _08112FCC @ =0x04000008\n"
                "\tstr r3, [sp, 0x4]\n"
                "\tbl CpuSet\n"
                "\tadds r0, r4, 0x1\n"
                "\tlsls r0, 24\n"
                "\tlsrs r4, r0, 24\n"
                "\tldr r3, [sp, 0x4]\n"
                "\tcmp r4, r6\n"
                "\tbcc _08112F66\n"
                "_08112F98:\n"
                "\tmov r1, r9\n"
                "\tlsls r0, r1, 24\n"
                "\tlsrs r5, r0, 24\n"
                "\tcmp r5, r7\n"
                "\tbcc _08112F5A\n"
                "_08112FA2:\n"
                "\tldr r0, [sp]\n"
                "\tlsls r2, r0, 21\n"
                "\tlsrs r2, 16\n"
                "\tmov r0, r10\n"
                "\tmov r1, r8\n"
                "\tmovs r3, 0\n"
                "\tbl CopyToWindowPixelBuffer\n"
                "\tmov r0, r8\n"
                "\tbl Free\n"
                "_08112FB8:\n"
                "\tadd sp, 0x8\n"
                "\tpop {r3-r5}\n"
                "\tmov r8, r3\n"
                "\tmov r9, r4\n"
                "\tmov r10, r5\n"
                "\tpop {r4-r7}\n"
                "\tpop {r0}\n"
                "\tbx r0\n"
                "\t.align 2, 0\n"
                "_08112FC8: .4byte gUnknown_84566A8\n"
                "_08112FCC: .4byte 0x04000008");
}
#endif

static void sub_8112FD0(void)
{
    sub_8112F18(sHelpMessageWindowId);
}

static const u8 sHelpMessageTextColors[3] = {TEXT_COLOR_TRANSPARENT, TEXT_DYNAMIC_COLOR_1, TEXT_COLOR_DARK_GREY};

static void PrintHelpMessageText(const u8 *text)
{
    AddTextPrinterParameterized4(sHelpMessageWindowId, 2, 2, 5, 1, 1, sHelpMessageTextColors, -1, text);
}

void PrintTextOnHelpMessageWindow(const u8 *text, u8 mode)
{
    sub_8112FD0();
    PrintHelpMessageText(text);
    if (mode)
        CopyWindowToVram(sHelpMessageWindowId, mode);
}


// Probable file boundary, trainer_fan_club.c below, help_message.c above


void ResetTrainerFanClub(void)
{
    VarSet(VAR_FANCLUB_FAN_COUNTER, 0);
    VarSet(VAR_FANCLUB_LOSE_FAN_TIMER, 0);
}

void Special_TryLoseFansFromPlayTimeAfterLinkBattle(void)
{
    TryLoseFansFromPlayTimeAfterLinkBattle(TRAINER_FAN_CLUB);
}

static void TryLoseFansFromPlayTimeAfterLinkBattle(struct TrainerFanClub *fanClub)
{
    if (DidPlayerGetFirstFans(fanClub))
    {
        TryLoseFansFromPlayTime(fanClub);
        VarSet(VAR_FANCLUB_LOSE_FAN_TIMER, gSaveBlock2Ptr->playTimeHours);
    }
}

void Special_UpdateTrainerFanClubGameClear(void)
{
    UpdateTrainerFanClubGameClear(TRAINER_FAN_CLUB);
}

static void UpdateTrainerFanClubGameClear(struct TrainerFanClub *fanClub)
{
    if (!fanClub->gotInitialFans)
    {
        SetPlayerGotFirstFans(fanClub);
        SetInitialFansOfPlayer(fanClub);
        VarSet(VAR_FANCLUB_LOSE_FAN_TIMER, gSaveBlock2Ptr->playTimeHours);
        FlagClear(FLAG_HIDE_SAFFRON_FAN_CLUB_BLACKBELT);
        FlagClear(FLAG_HIDE_SAFFRON_FAN_CLUB_ROCKER);
        FlagClear(FLAG_HIDE_SAFFRON_FAN_CLUB_WOMAN);
        FlagClear(FLAG_HIDE_SAFFRON_FAN_CLUB_BEAUTY);
        VarSet(VAR_MAP_SCENE_SAFFRON_CITY_POKEMON_TRAINER_FAN_CLUB, 1);
    }
}

ALIGNED(4) const u8 sCounterIncrements[] = {2, 1, 2, 1};

static u8 TryGainNewFanFromCounter(struct TrainerFanClub *fanClub, u8 a1)
{
    if (VarGet(VAR_MAP_SCENE_SAFFRON_CITY_POKEMON_TRAINER_FAN_CLUB) == 2)
    {
        if (fanClub->timer + sCounterIncrements[a1] >= 20)
        {
            if (GetNumFansOfPlayerInTrainerFanClub(fanClub) < 3)
            {
                PlayerGainRandomTrainerFan(fanClub);
                fanClub->timer = 0;
            }
            else
                fanClub->timer = 20;
        }
        else
            fanClub->timer += sCounterIncrements[a1];
    }

    return fanClub->timer;
}


static u8 PlayerGainRandomTrainerFan(struct TrainerFanClub *fanClub)
{
    static const u8 sFanClubMemberIds[] = 
    {
        FANCLUB_MEMBER2, 
        FANCLUB_MEMBER4, 
        FANCLUB_MEMBER6, 
        FANCLUB_MEMBER1, 
        FANCLUB_MEMBER8, 
        FANCLUB_MEMBER7, 
        FANCLUB_MEMBER5, 
        FANCLUB_MEMBER3
    };

    u8 i;
    u8 idx = 0;

    for (i = 0; i < NUM_TRAINER_FAN_CLUB_MEMBERS; i++)
    {
        if (!(GET_TRAINER_FAN_CLUB_FLAG(sFanClubMemberIds[i])))
        {
            idx = i;
            if (Random() % 2)
            {
                SET_TRAINER_FAN_CLUB_FLAG(sFanClubMemberIds[i]);
                return sFanClubMemberIds[i];
            }
        }
    }

    SET_TRAINER_FAN_CLUB_FLAG(sFanClubMemberIds[idx]);
    return sFanClubMemberIds[idx];
}

static u8 PlayerLoseRandomTrainerFan(struct TrainerFanClub *fanClub)
{
    static const u8 sFanClubMemberIds[] = 
    {
        FANCLUB_MEMBER6, 
        FANCLUB_MEMBER7, 
        FANCLUB_MEMBER4, 
        FANCLUB_MEMBER8, 
        FANCLUB_MEMBER5, 
        FANCLUB_MEMBER2, 
        FANCLUB_MEMBER1, 
        FANCLUB_MEMBER3
    };

    u8 i;
    u8 idx = 0;

    if (GetNumFansOfPlayerInTrainerFanClub(fanClub) == 1)
        return 0;

    for (i = 0; i < NUM_TRAINER_FAN_CLUB_MEMBERS; i++)
    {
        if (GET_TRAINER_FAN_CLUB_FLAG(sFanClubMemberIds[i]))
        {
            idx = i;
            if (Random() % 2)
            {
                FLIP_TRAINER_FAN_CLUB_FLAG(sFanClubMemberIds[i]);
                return sFanClubMemberIds[i];
            }
        }
    }

    if (GET_TRAINER_FAN_CLUB_FLAG(sFanClubMemberIds[idx]))
        FLIP_TRAINER_FAN_CLUB_FLAG(sFanClubMemberIds[idx]);

    return sFanClubMemberIds[idx];
}

u16 Special_GetNumFansOfPlayerInTrainerFanClub(void)
{
    return GetNumFansOfPlayerInTrainerFanClub(TRAINER_FAN_CLUB);
}

static u16 GetNumFansOfPlayerInTrainerFanClub(struct TrainerFanClub *fanClub)
{
    u8 count = 0;
    u8 i;

    for (i = 0; i < NUM_TRAINER_FAN_CLUB_MEMBERS; i++)
    {
        if (GET_TRAINER_FAN_CLUB_FLAG(i))
            count++;
    }

    return count;
}

void Special_TryLoseFansFromPlayTime(void)
{
    TryLoseFansFromPlayTime(TRAINER_FAN_CLUB);
}

static void TryLoseFansFromPlayTime(struct TrainerFanClub *fanClub)
{
    u8 i = 0;
    u16 timer;

    if (gSaveBlock2Ptr->playTimeHours < 999)
    {
        while (1)
        {
            if (GetNumFansOfPlayerInTrainerFanClub(fanClub) < 5)
            {
                VarSet(VAR_FANCLUB_LOSE_FAN_TIMER, gSaveBlock2Ptr->playTimeHours);
                break;
            }
            if (i == NUM_TRAINER_FAN_CLUB_MEMBERS)
                break;

            timer = VarGet(VAR_FANCLUB_LOSE_FAN_TIMER);
            if (gSaveBlock2Ptr->playTimeHours - timer < 12)
                break;

            PlayerLoseRandomTrainerFan(fanClub);
            timer = VarGet(VAR_FANCLUB_LOSE_FAN_TIMER);
            VarSet(VAR_FANCLUB_LOSE_FAN_TIMER, timer + 12);
            i++;
        }
    }
}

bool16 Special_IsFanClubMemberFanOfPlayer(void)
{
    return IsFanClubMemberFanOfPlayer(TRAINER_FAN_CLUB);
}

static bool16 IsFanClubMemberFanOfPlayer(struct TrainerFanClub *fanClub)
{
    return GET_TRAINER_FAN_CLUB_FLAG(gSpecialVar_0x8004);
}

static void SetInitialFansOfPlayer(struct TrainerFanClub *fanClub)
{
    SET_TRAINER_FAN_CLUB_FLAG(FANCLUB_MEMBER1);
    SET_TRAINER_FAN_CLUB_FLAG(FANCLUB_MEMBER2);
    SET_TRAINER_FAN_CLUB_FLAG(FANCLUB_MEMBER3);
}

void Special_BufferFanClubTrainerName(void)
{
    u8 whichLinkTrainer = 0;
    u8 whichNPCTrainer = 0;

    switch (gSpecialVar_0x8004)
    {
    case FANCLUB_MEMBER1:
        whichNPCTrainer = 0;
        whichLinkTrainer = 0;
        break;
    case FANCLUB_MEMBER2:
    case FANCLUB_MEMBER3:
    case FANCLUB_MEMBER4:
    case FANCLUB_MEMBER8:
        break;
    case FANCLUB_MEMBER5:
        whichNPCTrainer = 1;
        whichLinkTrainer = 0;
        break;
    case FANCLUB_MEMBER6:
        whichNPCTrainer = 0;
        whichLinkTrainer = 1;
        break;
    case FANCLUB_MEMBER7:
        whichNPCTrainer = 2;
        whichLinkTrainer = 1;
        break;
    }
    BufferFanClubTrainerName(&gSaveBlock2Ptr->linkBattleRecords, whichLinkTrainer, whichNPCTrainer);
}

static void BufferFanClubTrainerName(struct LinkBattleRecords *linkRecords, u8 whichLinkTrainer, u8 whichNPCTrainer)
{
    u8 *str;
    const u8 *linkTrainerName = linkRecords->entries[whichLinkTrainer].name;
    if (linkTrainerName[0] == EOS)
    {
        switch (whichNPCTrainer)
        {
        case 0:
            StringCopy(gStringVar1, gSaveBlock1Ptr->rivalName);
            break;
        case 1:
            StringCopy(gStringVar1, gText_LtSurge);
            break;
        case 2:
            StringCopy(gStringVar1, gText_Koga);
            break;
        default:
            StringCopy(gStringVar1, gSaveBlock1Ptr->rivalName);
            break;
        }
    }
    else
    {
        str = gStringVar1;
        StringCopyN(str, linkTrainerName, PLAYER_NAME_LENGTH);
        str[PLAYER_NAME_LENGTH] = EOS;
        if (   str[0] == EXT_CTRL_CODE_BEGIN
            && str[1] == EXT_CTRL_CODE_JPN)
        {
            str += 2;
            while (*str != EOS)
                str++;
            *str++ = EXT_CTRL_CODE_BEGIN;
            *str++ = EXT_CTRL_CODE_ENG;
            *str++ = EOS;
        }
    }
}

void Special_UpdateTrainerFansAfterLinkBattle(void)
{
    UpdateTrainerFansAfterLinkBattle(TRAINER_FAN_CLUB);
}

static void UpdateTrainerFansAfterLinkBattle(struct TrainerFanClub *fanClub)
{
    if (VarGet(VAR_MAP_SCENE_SAFFRON_CITY_POKEMON_TRAINER_FAN_CLUB) == 2)
    {
        TryLoseFansFromPlayTimeAfterLinkBattle(fanClub);
        if (gBattleOutcome == B_OUTCOME_WON)
            PlayerGainRandomTrainerFan(fanClub);
        else
            PlayerLoseRandomTrainerFan(fanClub);
    }
}

static bool8 DidPlayerGetFirstFans(struct TrainerFanClub *fanClub)
{
    return fanClub->gotInitialFans;
}

void Special_SetPlayerGotFirstFans(void)
{
    SetPlayerGotFirstFans(TRAINER_FAN_CLUB);
}

static void SetPlayerGotFirstFans(struct TrainerFanClub *fanClub)
{
    fanClub->gotInitialFans = TRUE;
}

u8 Special_TryGainNewFanFromCounter(void)
{
    return TryGainNewFanFromCounter(TRAINER_FAN_CLUB, gSpecialVar_0x8004);
}


// Probable file boundary, quest_log_events.c below, trainer_fan_club.c above


static u16 *(*const sQuestLogStorageCBs[])(u16 *, const u16 *) = {
    [QL_EVENT_0]                             = NULL,
    [QL_EVENT_1]                             = NULL,
    [QL_EVENT_2]                             = NULL,
    [QL_EVENT_SWITCHED_PARTY_ORDER]          = BufferQuestLogData_SwitchedPartyOrder,
    [QL_EVENT_USED_ITEM]                     = BufferQuestLogData_UsedItem,
    [QL_EVENT_GAVE_HELD_ITEM]                = BufferQuestLogData_GaveHeldItemFromPartyMenu,
    [QL_EVENT_GAVE_HELD_ITEM_BAG]            = BufferQuestLogData_GaveHeldItemFromBagMenu,
    [QL_EVENT_GAVE_HELD_ITEM_PC]             = BufferQuestLogData_GaveHeldItemFromPC,
    [QL_EVENT_TOOK_HELD_ITEM]                = BufferQuestLogData_TookHeldItem,
    [QL_EVENT_SWAPPED_HELD_ITEM]             = BufferQuestLogData_SwappedHeldItem,
    [QL_EVENT_SWAPPED_HELD_ITEM_PC]          = BufferQuestLogData_SwappedHeldItemFromPC,
    [QL_EVENT_USED_PKMN_CENTER]              = BufferQuestLogData_UsedPkmnCenter,
    [QL_EVENT_LINK_TRADED]                   = BufferQuestLogData_LinkTraded,
    [QL_EVENT_LINK_BATTLED_SINGLE]           = BufferQuestLogData_LinkBattledSingle,
    [QL_EVENT_LINK_BATTLED_DOUBLE]           = BufferQuestLogData_LinkBattledDouble,
    [QL_EVENT_LINK_BATTLED_MULTI]            = BufferQuestLogData_LinkBattledMulti,
    [QL_EVENT_USED_UNION_ROOM]               = BufferQuestLogData_UsedUnionRoom,
    [QL_EVENT_USED_UNION_ROOM_CHAT]          = BufferQuestLogData_UsedUnionRoomChat,
    [QL_EVENT_LINK_TRADED_UNION]             = BufferQuestLogData_LinkTradedUnionRoom,
    [QL_EVENT_LINK_BATTLED_UNION]            = BufferQuestLogData_LinkBattledUnionRoom,
    [QL_EVENT_SWITCHED_MONS_BETWEEN_BOXES]   = BufferQuestLogData_SwitchedMonsBetweenBoxes,
    [QL_EVENT_SWITCHED_MONS_WITHIN_BOX]      = BufferQuestLogData_SwitchedMonsWithinBox,
    [QL_EVENT_SWITCHED_PARTY_MON_FOR_PC_MON] = BufferQuestLogData_SwitchedPartyMonForPCMon,
    [QL_EVENT_MOVED_MON_BETWEEN_BOXES]       = BufferQuestLogData_MovedMonBetweenBoxes,
    [QL_EVENT_MOVED_MON_WITHIN_BOX]          = BufferQuestLogData_MovedMonWithinBox,
    [QL_EVENT_WITHDREW_MON_PC]               = BufferQuestLogData_WithdrewMonFromPC,
    [QL_EVENT_DEPOSITED_MON_PC]              = BufferQuestLogData_DepositedMonInPC,
    [QL_EVENT_SWITCHED_MULTIPLE_MONS]        = BufferQuestLogData_SwitchedMultipleMons,
    [QL_EVENT_DEPOSITED_ITEM_PC]             = BufferQuestLogData_DepositedItemInPC,
    [QL_EVENT_WITHDREW_ITEM_PC]              = BufferQuestLogData_WithdrewItemFromPC,
    [QL_EVENT_DEFEATED_GYM_LEADER]           = BufferQuestLogData_DefeatedGymLeader,
    [QL_EVENT_DEFEATED_WILD_MON]             = BufferQuestLogData_DefeatedWildMon,
    [QL_EVENT_DEFEATED_E4_MEMBER]            = BufferQuestLogData_DefeatedEliteFourMember,
    [QL_EVENT_DEFEATED_CHAMPION]             = BufferQuestLogData_DefeatedChampion,
    [QL_EVENT_DEFEATED_TRAINER]              = BufferQuestLogData_DefeatedTrainer,
    [QL_EVENT_DEPARTED]                      = BufferQuestLogData_DepartedLocation,
    [QL_EVENT_USED_FIELD_MOVE]               = BufferQuestLogData_UsedFieldMove,
    [QL_EVENT_BOUGHT_ITEM]                   = BufferQuestLogData_BoughtItem,
    [QL_EVENT_SOLD_ITEM]                     = BufferQuestLogData_SoldItem,
    [QL_EVENT_39]                            = NULL,
    [QL_EVENT_OBTAINED_ITEM]                 = BufferQuestLogData_ObtainedItem,
    [QL_EVENT_41]                            = NULL,
    [QL_EVENT_ARRIVED]                       = BufferQuestLogData_ArrivedInLocation
};

void SetQuestLogEvent(u16 eventId, const u16 *eventData)
{
    u16 *r1;

    if (eventId == QL_EVENT_DEPARTED && gUnknown_203B048 == 2)
    {
        sub_811381C();
        return;
    }
    sub_811381C();
    if (gQuestLogState == 2)
        return;

    if (!IS_VALID_QL_EVENT(eventId))
        return;

    if (InQuestLogDisabledLocation() == TRUE)
        return;

    if (TrySetLinkQuestLogEvent(eventId, eventData) == TRUE)
        return;

    if (MenuHelpers_LinkSomething() == TRUE)
        return;

    if (InUnionRoom() == TRUE)
        return;

    if (TrySetTrainerBattleQuestLogEvent(eventId, eventData) == TRUE)
        return;

    if (IsQuestLogEventWithSpecialEncounterSpecies(eventId, eventData) == TRUE)
        return;

    if (sub_81153E4(eventId, eventData) == FALSE)
        return;

    if (gUnknown_3005E88 == 0)
    {
        if (sub_8113778(eventId, eventData) == TRUE)
            return;

        if (eventId != QL_EVENT_DEFEATED_WILD_MON || gUnknown_203AE04 == NULL)
        {
            if (sub_81153A8(eventId, eventData) == FALSE)
                return;
            sub_8110AEC(eventId);
        }
    }
    else if (eventId == QL_EVENT_OBTAINED_ITEM)
        return;

    sub_8113B94(eventId);
    if (eventId == QL_EVENT_DEFEATED_WILD_MON)
    {
        if (gUnknown_203AE04 == NULL)
        {
            gUnknown_203AE04 = gUnknown_203AE08;
            r1 = sQuestLogStorageCBs[eventId](gUnknown_203AE04, eventData);
        }
        else
        {
            sQuestLogStorageCBs[eventId](gUnknown_203AE04, eventData);
            return;
        }
    }
    else
    {
        gUnknown_203AE04 = NULL;
        r1 = sQuestLogStorageCBs[eventId](gUnknown_203AE08, eventData);
    }

    if (r1 == NULL)
    {
        sub_811231C();
        r1 = sub_8113828(eventId, eventData);
        if (r1 == NULL)
            return;
    }

    gUnknown_203AE08 = r1;
    if (gUnknown_203B048 == 0)
        return;
    sub_811231C();
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
    if (gSaveBlock1Ptr->location.mapGroup == MAP_GROUP(SAFFRON_CITY_POKEMON_TRAINER_FAN_CLUB) && gSaveBlock1Ptr->location.mapNum == MAP_NUM(SAFFRON_CITY_POKEMON_TRAINER_FAN_CLUB))
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

bool8 sub_8113748(void)
{
    if (InQuestLogDisabledLocation() != TRUE)
        return FALSE;

    if (gQuestLogState == 2)
        return TRUE;

    if (gQuestLogState == 1)
        sub_8112364();

    return FALSE;
}

static bool8 sub_8113778(u16 eventId, const u16 *eventData)
{
    if (eventId == QL_EVENT_USED_FIELD_MOVE || eventId == QL_EVENT_USED_PKMN_CENTER)
        return TRUE;

    if (!FlagGet(FLAG_SYS_GAME_CLEAR))
    {
        if (eventId == QL_EVENT_SWITCHED_PARTY_ORDER || eventId == QL_EVENT_DEFEATED_WILD_MON || sub_81137E4(eventId, eventData) == TRUE)
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

static bool8 sub_81137E4(u16 eventId, const u16 *eventData)
{
    if (eventId == QL_EVENT_DEFEATED_TRAINER)
    {
        u8 trainerClass = gTrainers[*eventData].trainerClass;
        if (   trainerClass == CLASS_RIVAL
            || trainerClass == CLASS_RIVAL_2
            || trainerClass == CLASS_CHAMPION_2
            || trainerClass == CLASS_BOSS)
            return FALSE;
        return TRUE;
    }
    return FALSE;
}

static void sub_811381C(void)
{
    gUnknown_203B048 = 0;
}

static u16 *sub_8113828(u16 eventId, const u16 *eventData)
{
    if (sub_8113778(eventId, eventData) == TRUE)
        return NULL;

    if (sub_81153A8(eventId, eventData) == FALSE)
        return NULL;

    sub_8110AEC(eventId);
    sub_8113B94(eventId);

    if (eventId == QL_EVENT_DEFEATED_WILD_MON)
        gUnknown_203AE04 = gUnknown_203AE08;
    else
        gUnknown_203AE04 = NULL;

    return sQuestLogStorageCBs[eventId](gUnknown_203AE08, eventData);
}

static bool8 TrySetLinkQuestLogEvent(u16 eventId, const u16 *eventData)
{
    if (!IS_LINK_QL_EVENT(eventId))
        return FALSE;

    sub_81138F8();
    gUnknown_203B024.unk_00 = eventId;

    if (eventId != QL_EVENT_USED_UNION_ROOM && eventId != QL_EVENT_USED_UNION_ROOM_CHAT)
    {
        if (eventId == QL_EVENT_LINK_TRADED || eventId == QL_EVENT_LINK_TRADED_UNION)
            memcpy(gUnknown_203B024.unk_04, eventData, 12);
        else
            memcpy(gUnknown_203B024.unk_04, eventData, 24);
    }
    return TRUE;
}

void sub_81138F8(void)
{
    gUnknown_203B024 = (struct UnkStruct_203B024){};
}

void sub_811390C(void)
{
    if (gUnknown_203B024.unk_00 != QL_EVENT_0)
    {
        u16 *resp;
        gUnknown_203B04A = 0;
        sub_8110AEC(gUnknown_203B024.unk_00);
        resp = sQuestLogStorageCBs[gUnknown_203B024.unk_00](gUnknown_203AE08, gUnknown_203B024.unk_04);
        gUnknown_203AE08 = resp;
        sub_81138F8();
    }
}

static bool8 TrySetTrainerBattleQuestLogEvent(u16 eventId, const u16 *eventData)
{
    if (eventId != QL_EVENT_DEFEATED_TRAINER 
     && eventId != QL_EVENT_DEFEATED_GYM_LEADER 
     && eventId != QL_EVENT_DEFEATED_E4_MEMBER 
     && eventId != QL_EVENT_DEFEATED_CHAMPION)
        return FALSE;

    sub_81138F8();
    if (gUnknown_3005E88 || FlagGet(FLAG_SYS_GAME_CLEAR) || sub_81137E4(eventId, eventData) != TRUE)
    {
        gUnknown_203B024.unk_00 = eventId;
        memcpy(gUnknown_203B024.unk_04, eventData, 8);
    }
    return TRUE;
}

void sub_81139BC(void)
{
    if (gUnknown_203B024.unk_00 != QL_EVENT_0)
    {
        u16 *resp;
        if (gUnknown_3005E88 == 0)
        {
            gUnknown_203B04A = 0;
            sub_8110AEC(gUnknown_203B024.unk_00);
        }
        sub_8113B94(gUnknown_203B024.unk_00);
        resp = sQuestLogStorageCBs[gUnknown_203B024.unk_00](gUnknown_203AE08, gUnknown_203B024.unk_04);
        gUnknown_203AE08 = resp;
        sub_8113A1C(1);
        sub_81138F8();
        sub_811231C();
    }
}

static void sub_8113A1C(u16 a0)
{
    gUnknown_203AE08 = sub_8113C5C(gUnknown_203AE08, a0);
    sQuestLogIdx++;
}

static bool8 IsQuestLogEventWithSpecialEncounterSpecies(u16 eventId, const u16 *eventData)
{
    if (eventId != QL_EVENT_DEFEATED_WILD_MON)
        return FALSE;

    if (IsSpeciesFromSpecialEncounter(eventData[0]) == TRUE)
        return TRUE;

    if (IsSpeciesFromSpecialEncounter(eventData[1]) == TRUE)
        return TRUE;

    return FALSE;
}

static const u16 *(*const sQuestLogEventTextBufferCBs[])(const u16 *) = {
    [QL_EVENT_0]                             = NULL,
    [QL_EVENT_1]                             = NULL,
    [QL_EVENT_2]                             = NULL,
    [QL_EVENT_SWITCHED_PARTY_ORDER]          = BufferQuestLogText_SwitchedPartyOrder,
    [QL_EVENT_USED_ITEM]                     = BufferQuestLogText_UsedItem,
    [QL_EVENT_GAVE_HELD_ITEM]                = BufferQuestLogText_GaveHeldItemFromPartyMenu,
    [QL_EVENT_GAVE_HELD_ITEM_BAG]            = BufferQuestLogText_GaveHeldItemFromBagMenu,
    [QL_EVENT_GAVE_HELD_ITEM_PC]             = BufferQuestLogText_GaveHeldItemFromPC,
    [QL_EVENT_TOOK_HELD_ITEM]                = BufferQuestLogText_TookHeldItem,
    [QL_EVENT_SWAPPED_HELD_ITEM]             = BufferQuestLogText_SwappedHeldItem,
    [QL_EVENT_SWAPPED_HELD_ITEM_PC]          = BufferQuestLogText_SwappedHeldItemFromPC,
    [QL_EVENT_USED_PKMN_CENTER]              = BufferQuestLogText_UsedPkmnCenter,
    [QL_EVENT_LINK_TRADED]                   = BufferQuestLogText_LinkTraded,
    [QL_EVENT_LINK_BATTLED_SINGLE]           = BufferQuestLogText_LinkBattledSingle,
    [QL_EVENT_LINK_BATTLED_DOUBLE]           = BufferQuestLogText_LinkBattledDouble,
    [QL_EVENT_LINK_BATTLED_MULTI]            = BufferQuestLogText_LinkBattledMulti,
    [QL_EVENT_USED_UNION_ROOM]               = BufferQuestLogText_UsedUnionRoom,
    [QL_EVENT_USED_UNION_ROOM_CHAT]          = BufferQuestLogText_UsedUnionRoomChat,
    [QL_EVENT_LINK_TRADED_UNION]             = BufferQuestLogText_LinkTradedUnionRoom,
    [QL_EVENT_LINK_BATTLED_UNION]            = BufferQuestLogText_LinkBattledUnionRoom,
    [QL_EVENT_SWITCHED_MONS_BETWEEN_BOXES]   = BufferQuestLogText_SwitchedMonsBetweenBoxes,
    [QL_EVENT_SWITCHED_MONS_WITHIN_BOX]      = BufferQuestLogText_SwitchedMonsWithinBox,
    [QL_EVENT_SWITCHED_PARTY_MON_FOR_PC_MON] = BufferQuestLogText_SwitchedPartyMonForPCMon,
    [QL_EVENT_MOVED_MON_BETWEEN_BOXES]       = BufferQuestLogText_MovedMonBetweenBoxes,
    [QL_EVENT_MOVED_MON_WITHIN_BOX]          = BufferQuestLogText_MovedMonWithinBox,
    [QL_EVENT_WITHDREW_MON_PC]               = BufferQuestLogText_WithdrewMonFromPC,
    [QL_EVENT_DEPOSITED_MON_PC]              = BufferQuestLogText_DepositedMonInPC,
    [QL_EVENT_SWITCHED_MULTIPLE_MONS]        = BufferQuestLogText_SwitchedMultipleMons,
    [QL_EVENT_DEPOSITED_ITEM_PC]             = BufferQuestLogText_DepositedItemInPC,
    [QL_EVENT_WITHDREW_ITEM_PC]              = BufferQuestLogText_WithdrewItemFromPC,
    [QL_EVENT_DEFEATED_GYM_LEADER]           = BufferQuestLogText_DefeatedGymLeader,
    [QL_EVENT_DEFEATED_WILD_MON]             = BufferQuestLogText_DefeatedWildMon,
    [QL_EVENT_DEFEATED_E4_MEMBER]            = BufferQuestLogText_DefeatedEliteFourMember,
    [QL_EVENT_DEFEATED_CHAMPION]             = BufferQuestLogText_DefeatedChampion,
    [QL_EVENT_DEFEATED_TRAINER]              = BufferQuestLogText_DefeatedTrainer,
    [QL_EVENT_DEPARTED]                      = BufferQuestLogText_DepartedLocation,
    [QL_EVENT_USED_FIELD_MOVE]               = BufferQuestLogText_UsedFieldMove,
    [QL_EVENT_BOUGHT_ITEM]                   = BufferQuestLogText_BoughtItem,
    [QL_EVENT_SOLD_ITEM]                     = BufferQuestLogText_SoldItem,
    [QL_EVENT_39]                            = NULL,
    [QL_EVENT_OBTAINED_ITEM]                 = BufferQuestLogText_ObtainedItem,
    [QL_EVENT_41]                            = NULL,
    [QL_EVENT_ARRIVED]                       = BufferQuestLogText_ArrivedInLocation
};

static const u8 sQuestLogEventCmdSizes[] = {
    [QL_EVENT_0] = 0x08,
    [QL_EVENT_1] = 0x08,
    [QL_EVENT_2] = 0x08,
    [QL_EVENT_SWITCHED_PARTY_ORDER] = 0x08,
    [QL_EVENT_USED_ITEM] = 0x0a,
    [QL_EVENT_GAVE_HELD_ITEM] = 0x08,
    [QL_EVENT_GAVE_HELD_ITEM_BAG] = 0x08,
    [QL_EVENT_GAVE_HELD_ITEM_PC] = 0x08,
    [QL_EVENT_TOOK_HELD_ITEM] = 0x08,
    [QL_EVENT_SWAPPED_HELD_ITEM] = 0x0a,
    [QL_EVENT_SWAPPED_HELD_ITEM_PC] = 0x0a,
    [QL_EVENT_USED_PKMN_CENTER] = 0x04,
    [QL_EVENT_LINK_TRADED] = 0x10,
    [QL_EVENT_LINK_BATTLED_SINGLE] = 0x0c,
    [QL_EVENT_LINK_BATTLED_DOUBLE] = 0x0c,
    [QL_EVENT_LINK_BATTLED_MULTI] = 0x1a,
    [QL_EVENT_USED_UNION_ROOM] = 0x04,
    [QL_EVENT_USED_UNION_ROOM_CHAT] = 0x04,
    [QL_EVENT_LINK_TRADED_UNION] = 0x10,
    [QL_EVENT_LINK_BATTLED_UNION] = 0x0c,
    [QL_EVENT_SWITCHED_MONS_BETWEEN_BOXES] = 0x0a,
    [QL_EVENT_SWITCHED_MONS_WITHIN_BOX] = 0x0a,
    [QL_EVENT_SWITCHED_PARTY_MON_FOR_PC_MON] = 0x0a,
    [QL_EVENT_MOVED_MON_BETWEEN_BOXES] = 0x08,
    [QL_EVENT_MOVED_MON_WITHIN_BOX] = 0x08,
    [QL_EVENT_WITHDREW_MON_PC] = 0x08,
    [QL_EVENT_DEPOSITED_MON_PC] = 0x08,
    [QL_EVENT_SWITCHED_MULTIPLE_MONS] = 0x06,
    [QL_EVENT_DEPOSITED_ITEM_PC] = 0x06,
    [QL_EVENT_WITHDREW_ITEM_PC] = 0x06,
    [QL_EVENT_DEFEATED_GYM_LEADER] = 0x0c,
    [QL_EVENT_DEFEATED_WILD_MON] = 0x0c,
    [QL_EVENT_DEFEATED_E4_MEMBER] = 0x0c,
    [QL_EVENT_DEFEATED_CHAMPION] = 0x0a,
    [QL_EVENT_DEFEATED_TRAINER] = 0x0c,
    [QL_EVENT_DEPARTED] = 0x06,
    [QL_EVENT_USED_FIELD_MOVE] = 0x08,
    [QL_EVENT_BOUGHT_ITEM] = 0x0e,
    [QL_EVENT_SOLD_ITEM] = 0x0e,
    [QL_EVENT_39] = 0x02,
    [QL_EVENT_OBTAINED_ITEM] = 0x08,
    [QL_EVENT_41] = 0x04,
    [QL_EVENT_ARRIVED] = 0x06
};

static u16 *QuestLog_SkipCommand(u16 *curPtr, u16 **prevPtr_p)
{
    u16 eventId = curPtr[0] & 0xfff;
    u16 cnt = curPtr[0] >> 12;

    if (eventId == QL_EVENT_DEFEATED_CHAMPION)
        cnt = 0;

    if (!IS_VALID_QL_EVENT(eventId))
        return NULL;

    *prevPtr_p = curPtr;
    return sQuestLogEventCmdSizes[eventId] + (sQuestLogEventCmdSizes[eventId] - 4) * cnt + (void *)curPtr;
}

static void sub_8113ABC(const u16 *a0)
{
    const u8 *r2 = (const u8 *)(a0 + 2);
    if ((a0[0] & 0xFFF) != QL_EVENT_DEPARTED)
        gUnknown_203B04A = 0;
    else
        gUnknown_203B04A = r2[1] + 1;
}

static bool8 sub_8113AE8(const u16 *a0)
{
#ifndef NONMATCHING
    register const u16 *r0 asm("r0") = a0;
#else
    const u16 *r0 = a0;
#endif
    
    if (r0 == NULL || r0[1] > sQuestLogIdx)
        return FALSE;

    sQuestLogEventTextBufferCBs[a0[0] & 0xFFF](a0);
    gUnknown_203B044.unk_0 = a0[0];
    gUnknown_203B044.unk_1 = (a0[0] & 0xF000) >> 12;
    if (gUnknown_203B044.unk_1 != 0)
        gUnknown_203B044.unk_2 = 1;
    return TRUE;
}

static bool8 sub_8113B44(const u16 *a0)
{
    if (gUnknown_203B044.unk_2 == 0)
        return FALSE;

    sQuestLogEventTextBufferCBs[gUnknown_203B044.unk_0](a0);
    gUnknown_203B044.unk_2++;
    if (gUnknown_203B044.unk_2 > gUnknown_203B044.unk_1)
        sub_8113B88();
    return TRUE;
}

static void sub_8113B88(void)
{
    gUnknown_203B044 = (struct UnkStruct_203B044){};
}

static void sub_8113B94(u16 eventId)
{
    if (gUnknown_203B044.unk_0 != (u8)eventId || gUnknown_203B044.unk_2 != sQuestLogIdx)
    {
        gUnknown_203B044.unk_0 = eventId;
        gUnknown_203B044.unk_1 = 0;
        gUnknown_203B044.unk_2 = sQuestLogIdx;
    }
    else if (gUnknown_203B044.unk_1 < 5)
        gUnknown_203B044.unk_1++;
}

static void sub_8113BD8(void)
{
    gUnknown_203B049 = 0;
    gUnknown_203B04A = 0;
    gUnknown_203B04B = FALSE;
}

static u16 *sub_8113BF4(u16 *a0)
{
    if (!sub_8110988(a0, sQuestLogEventCmdSizes[QL_EVENT_39]))
        return NULL;
    a0[0] = QL_EVENT_39;
    return a0 + 1;
}

static u16 *sub_8113C20(u16 *a0, struct UnkStruct_203AE98 * a1)
{
    if (!sub_8110988(a0, sQuestLogEventCmdSizes[QL_EVENT_39]))
        return NULL;
    a1->unk_6 = 0xFF;
    a1->unk_4 = 0;
    a1->unk_0 = 0;
    a1->unk_1 = 0;
    a1->unk_2 = 0;
    a1->unk_3 = 0;
    return a0 + 1;
}

static u16 *sub_8113C5C(u16 *a0, u16 a1)
{
    if (!sub_8110988(a0, sQuestLogEventCmdSizes[QL_EVENT_41]))
        return NULL;
    a0[0] = QL_EVENT_41;
    a0[1] = a1;
    return a0 + 2;
}

static u16 *sub_8113C8C(u16 *a0, struct UnkStruct_203AE98 * a1)
{
    if (!sub_8110988(a0, sQuestLogEventCmdSizes[QL_EVENT_41]))
        return NULL;
    a1->unk_6 = 0xFE;
    a1->unk_4 = a0[1];
    a1->unk_0 = 0;
    a1->unk_1 = 0;
    a1->unk_2 = 0;
    a1->unk_3 = 0;
    return a0 + 2;
}

static u16 *sub_8113CC8(u16 *a0, struct UnkStruct_203AE98 * a1)
{
    u8 *r6 = (u8 *)a0 + 4;

    if (!sub_8110988(a0, sQuestLogEventCmdSizes[QL_EVENT_0]))
        return NULL;
    a0[0] = 0;
    a0[1] = a1->unk_4;
    r6[0] = a1->unk_0;
    r6[1] = a1->unk_1;
    r6[2] = a1->unk_2;
    r6[3] = a1->unk_3;
    return (u16 *)(r6 + 4);
}

static u16 *sub_8113D08(u16 *a0, struct UnkStruct_203AE98 * a1)
{
    u8 *r6 = (u8 *)a0 + 4;

    if (!sub_8110988(a0, sQuestLogEventCmdSizes[QL_EVENT_0]))
        return NULL;
    a1->unk_6 = 2;
    a1->unk_4 = a0[1];
    a1->unk_0 = r6[0];
    a1->unk_1 = r6[1];
    a1->unk_2 = r6[2];
    a1->unk_3 = r6[3];
    return (u16 *)(r6 + 4);
}

static u16 *sub_8113D48(u16 *a0, struct UnkStruct_203AE98 * a1)
{
    u16 *r4 = a0;
    u8 *r6 = (u8 *)a0 + 4;

    if (!sub_8110988(r4, sQuestLogEventCmdSizes[QL_EVENT_2]))
        return NULL;
    if (a1->unk_6 == 0)
        r4[0] = 2;
    else
        r4[0] = 1;
    r4[1] = a1->unk_4;
    r6[0] = a1->unk_0;
    r6[1] = a1->unk_1;
    r6[2] = a1->unk_2;
    r6[3] = a1->unk_3;
    return (u16 *)(r6 + 4);
}

static u16 *sub_8113D94(u16 *a0, struct UnkStruct_203AE98 * a1)
{
    u16 *r5 = a0;
    u8 *r6 = (u8 *)a0 + 4;

    if (!sub_8110988(r5, sQuestLogEventCmdSizes[QL_EVENT_2]))
        return NULL;
    if (r5[0] == 2)
        a1->unk_6 = 0;
    else
        a1->unk_6 = 1;
    a1->unk_4 = r5[1];
    a1->unk_0 = r6[0];
    a1->unk_1 = r6[1];
    a1->unk_2 = r6[2];
    a1->unk_3 = r6[3];
    return (u16 *)(r6 + 4);
}

u16 *sub_8113DE0(u16 eventId, u16 *a1)
{
    u8 cmdSize;
    u16 *r5;
    u8 r4;
    u8 r1;

    if (gUnknown_203B044.unk_1 == 0)
        cmdSize = sQuestLogEventCmdSizes[eventId];
    else
        cmdSize = sQuestLogEventCmdSizes[eventId] - 4;
    if (!sub_8110944(a1, cmdSize))
        return NULL;

    r5 = (void *)a1;

    if (gUnknown_203B044.unk_1 != 0)
        r5 = (void *)r5 - (gUnknown_203B044.unk_1 * cmdSize + 4);

    if (gUnknown_203B044.unk_1 == 5)
    {
        for (r4 = 0; r4 < 4; r4++)
        {
            memcpy(
                (void *)r5 + (r4 * cmdSize + 4),
                (void *)r5 + ((r4 + 1) * cmdSize + 4),
                cmdSize
            );
        }
        r1 = 4;
    }
    else
        r1 = gUnknown_203B044.unk_1;

    r5[0] = eventId + (r1 << 12);
    r5[1] = sQuestLogIdx;
    r5 = (void *)r5 + (r1 * cmdSize + 4);
    return r5;
}

static const u16 *sub_8113E88(u16 eventId, const u16 *eventData)
{
    eventData = (const void *)eventData + (gUnknown_203B044.unk_2 * (sQuestLogEventCmdSizes[eventId] - 4) + 4);
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

static u16 *BufferQuestLogData_SwitchedPartyOrder(u16 *a0, const u16 *eventData)
{
    u16 *r2 = sub_8113DE0(QL_EVENT_SWITCHED_PARTY_ORDER, a0);
    if (r2 == NULL)
        return NULL;
    
    r2[0] = eventData[0];
    r2[1] = eventData[1];
    return r2 + 2;
}

static const u16 *BufferQuestLogText_SwitchedPartyOrder(const u16 *eventData)
{
    const u16 *r4 = sub_8113E88(QL_EVENT_SWITCHED_PARTY_ORDER, eventData);
    QuestLog_GetSpeciesName(r4[0], gStringVar1, 0);
    QuestLog_GetSpeciesName(r4[1], gStringVar2, 0);
    StringExpandPlaceholders(gStringVar4, QuestLog_Text_SwitchMon1WithMon2);
    r4 += 2;
    return r4;
}

static u16 *BufferQuestLogData_UsedItem(u16 *a0, const u16 *eventData)
{
    u16 *r2 = sub_8113DE0(QL_EVENT_USED_ITEM, a0);
    if (r2 == NULL)
        return NULL;

    r2[0] = eventData[0];
    r2[1] = eventData[2];
    r2[2] = eventData[3];

    if (eventData[0] == ITEM_ESCAPE_ROPE)
        gUnknown_203B048 = 2;

    return r2 + 3;
}

static const u16 *BufferQuestLogText_UsedItem(const u16 *eventData)
{
    const u16 *r5 = sub_8113E88(QL_EVENT_USED_ITEM, eventData);

    switch (ItemId_GetPocket(r5[0]))
    {
    case POCKET_ITEMS:
    case POCKET_POKE_BALLS:
    case POCKET_BERRY_POUCH:
        StringCopy(gStringVar1, ItemId_GetName(r5[0]));
        if (r5[0] == ITEM_ESCAPE_ROPE)
        {
            GetMapNameGeneric(gStringVar2, (u8)r5[2]);
            StringExpandPlaceholders(gStringVar4, QuestLog_Text_UsedEscapeRope);
        }
        else if (r5[1] != 0xFFFF)
        {
            QuestLog_GetSpeciesName(r5[1], gStringVar2, 0);
            StringExpandPlaceholders(gStringVar4, QuestLog_Text_UsedItemOnMonAtThisLocation);
        }
        else
        {
            StringExpandPlaceholders(gStringVar4, QuestLog_Text_UsedTheItem);
        }
        break;
    case POCKET_KEY_ITEMS:
        StringCopy(gStringVar1, ItemId_GetName(r5[0]));
        StringExpandPlaceholders(gStringVar4, QuestLog_Text_UsedTheKeyItem);
        break;
    case POCKET_TM_CASE:
        QuestLog_GetSpeciesName(r5[1], gStringVar1, 0);
        StringCopy(gStringVar2, gMoveNames[ItemIdToBattleMoveId(r5[0])]);
        if (r5[2] != 0xFFFF)
        {
            StringCopy(gStringVar3, gMoveNames[r5[2]]);
            if (r5[0] > ITEM_TM50)
                StringExpandPlaceholders(gStringVar4, QuestLog_Text_MonReplacedMoveWithHM);
            else
                StringExpandPlaceholders(gStringVar4, QuestLog_Text_MonReplacedMoveWithTM);
        }
        else
        {
            if (r5[0] > ITEM_TM50)
                StringExpandPlaceholders(gStringVar4, QuestLog_Text_MonLearnedMoveFromHM);
            else
                StringExpandPlaceholders(gStringVar4, QuestLog_Text_MonLearnedMoveFromTM);
        }
        break;
    }
    return r5 + 3;
}

u16 *BufferQuestLogData_GiveTakeHeldItem(u16 eventId, u16 *a1, const u16 *eventData)
{
    u16 *r1 = sub_8113DE0(eventId, a1);
    if (r1 == NULL)
        return NULL;

    r1[0] = eventData[0];
    r1[1] = eventData[2];
    return r1 + 2;
}

static u16 *BufferQuestLogData_GaveHeldItemFromPartyMenu(u16 *a0, const u16 *eventData)
{
    return BufferQuestLogData_GiveTakeHeldItem(QL_EVENT_GAVE_HELD_ITEM, a0, eventData);
}

static const u16 *BufferQuestLogText_GaveHeldItemFromPartyMenu(const u16 *eventData)
{
    const u16 *r4 = sub_8113E88(QL_EVENT_GAVE_HELD_ITEM, eventData);
    QuestLog_GetSpeciesName(r4[1], gStringVar1, 0);
    StringCopy(gStringVar2, ItemId_GetName(r4[0]));
    StringExpandPlaceholders(gStringVar4, QuestLog_Text_GaveMonHeldItem);
    r4 += 2;
    return r4;
}

static u16 *BufferQuestLogData_GaveHeldItemFromBagMenu(u16 *a0, const u16 *eventData)
{
    return BufferQuestLogData_GiveTakeHeldItem(QL_EVENT_GAVE_HELD_ITEM_BAG, a0, eventData);
}

static const u16 *BufferQuestLogText_GaveHeldItemFromBagMenu(const u16 *eventData)
{
    const u16 *r4 = sub_8113E88(QL_EVENT_GAVE_HELD_ITEM_BAG, eventData);
    QuestLog_GetSpeciesName(r4[1], gStringVar1, 0);
    StringCopy(gStringVar2, ItemId_GetName(r4[0]));
    StringExpandPlaceholders(gStringVar4, QuestLog_Text_GaveMonHeldItem2);
    r4 += 2;
    return r4;
}

static u16 *BufferQuestLogData_GaveHeldItemFromPC(u16 *a0, const u16 *eventData)
{
    return BufferQuestLogData_GiveTakeHeldItem(QL_EVENT_GAVE_HELD_ITEM_PC, a0, eventData);
}

static const u16 *BufferQuestLogText_GaveHeldItemFromPC(const u16 *eventData)
{
    const u16 *r4 = sub_8113E88(QL_EVENT_GAVE_HELD_ITEM_PC, eventData);

    QuestLog_GetSpeciesName(r4[1], gStringVar2, 0);
    StringCopy(gStringVar1, ItemId_GetName(r4[0]));
    StringExpandPlaceholders(gStringVar4, QuestLog_Text_GaveMonHeldItemFromPC);
    r4 += 2;
    return r4;
}

static u16 *BufferQuestLogData_TookHeldItem(u16 *a0, const u16 *eventData)
{
    return BufferQuestLogData_GiveTakeHeldItem(QL_EVENT_TOOK_HELD_ITEM, a0, eventData);
}

static const u16 *BufferQuestLogText_TookHeldItem(const u16 *eventData)
{
    const u16 *r4 = sub_8113E88(QL_EVENT_TOOK_HELD_ITEM, eventData);

    QuestLog_GetSpeciesName(r4[1], gStringVar1, 0);
    StringCopy(gStringVar2, ItemId_GetName(r4[0]));
    StringExpandPlaceholders(gStringVar4, QuestLog_Text_TookHeldItemFromMon);
    r4 += 2;
    return r4;
}

u16 *BufferQuestLogData_SwappedHeldItem_(u16 eventId, u16 *a1, const u16 *eventData)
{
    u16 *r1 = sub_8113DE0(eventId, a1);
    if (r1 == NULL)
        return NULL;

    r1[0] = eventData[0];
    r1[1] = eventData[1];
    r1[2] = eventData[2];
    return r1 + 3;
}

static u16 *BufferQuestLogData_SwappedHeldItem(u16 *a0, const u16 *eventData)
{
    return BufferQuestLogData_SwappedHeldItem_(QL_EVENT_SWAPPED_HELD_ITEM, a0, eventData);
}

static const u16 *BufferQuestLogText_SwappedHeldItem(const u16 *eventData)
{
    const u16 *r4 = sub_8113E88(QL_EVENT_SWAPPED_HELD_ITEM, eventData);
    QuestLog_GetSpeciesName(r4[2], gStringVar1, 0);
    StringCopy(gStringVar2, ItemId_GetName(r4[0])); // Item taken
    StringCopy(gStringVar3, ItemId_GetName(r4[1])); // Item given
    StringExpandPlaceholders(gStringVar4, QuestLog_Text_SwappedHeldItemsOnMon);
    r4 += 3;
    return r4;
}

static u16 *BufferQuestLogData_SwappedHeldItemFromPC(u16 *a0, const u16 *eventData)
{
    return BufferQuestLogData_SwappedHeldItem_(QL_EVENT_SWAPPED_HELD_ITEM_PC, a0, eventData);
}

static const u16 *BufferQuestLogText_SwappedHeldItemFromPC(const u16 *eventData)
{
    const u16 *r4 = sub_8113E88(QL_EVENT_SWAPPED_HELD_ITEM_PC, eventData);
    QuestLog_GetSpeciesName(r4[2], gStringVar2, 0);
    StringCopy(gStringVar3, ItemId_GetName(r4[0]));
    StringCopy(gStringVar1, ItemId_GetName(r4[1]));
    StringExpandPlaceholders(gStringVar4, QuestLog_Text_SwappedHeldItemFromPC);
    r4 += 3;
    return r4;
}

static u16 *BufferQuestLogData_UsedPkmnCenter(u16 *a0, const u16 *eventData)
{
    u16 *r4 = a0;
    if (gUnknown_203B044.unk_0 == QL_EVENT_USED_PKMN_CENTER && gUnknown_203B044.unk_1 != 0)
        return r4;

    if (!sub_8110944(a0, sQuestLogEventCmdSizes[QL_EVENT_USED_PKMN_CENTER]))
        return NULL;

    r4[0] = QL_EVENT_USED_PKMN_CENTER;
    r4[1] = sQuestLogIdx;
    return r4 + 2;
}

static const u16 *BufferQuestLogText_UsedPkmnCenter(const u16 *a0)
{
    StringExpandPlaceholders(gStringVar4, QuestLog_Text_MonsWereFullyRestoredAtCenter);
    a0 += 2;
    return a0;
}

static u16 *BufferQuestLogData_LinkTraded(u16 *a0, const u16 *eventData)
{
    u16 *r4 = a0 + 4;

    a0[0] = QL_EVENT_LINK_TRADED;
    a0[1] = sQuestLogIdx;
    a0[2] = eventData[0];
    a0[3] = eventData[1];
    eventData += 2;
    memcpy(r4, eventData, 7);
    r4 += 4;
    return r4;
}

static const u16 *BufferQuestLogText_LinkTraded(const u16 *a0)
{
    const u16 *r6 = a0 + 4;

    memset(gStringVar1, EOS, PLAYER_NAME_LENGTH + 1);
    memcpy(gStringVar1, r6, PLAYER_NAME_LENGTH);

    BufferLinkPartnersName(gStringVar1);
    QuestLog_GetSpeciesName(a0[3], gStringVar2, 0); // Mon received
    QuestLog_GetSpeciesName(a0[2], gStringVar3, 0); // Mon sent
    StringExpandPlaceholders(gStringVar4, QuestLog_Text_TradedMon1ForPersonsMon2);
    r6 += 4;
    return r6;
}

static const u8 *const sDefeatedOpponentFlavorTexts[] = {
    QuestLog_Text_Handily,
    QuestLog_Text_Tenaciously,
    QuestLog_Text_Somehow
};

static const u8 *const sDefeatedChampionFlavorTexts[] = {
    QuestLog_Text_Coolly,
    QuestLog_Text_Somehow,
    QuestLog_Text_Barely
};

static const u8 *const sBattleOutcomeTexts[] = {
    QuestLog_Text_Win,
    QuestLog_Text_Loss,
    QuestLog_Text_Draw
};

static u16 *BufferQuestLogData_LinkBattledSingle(u16 *a0, const u16 *eventData)
{
    a0[0] = QL_EVENT_LINK_BATTLED_SINGLE;
    a0[1] = sQuestLogIdx;
    *((u8 *)a0 + 4) = *((const u8 *)eventData + 0);
    memcpy((u8 *)a0 + 5, (const u8 *)eventData + 1, PLAYER_NAME_LENGTH);
    a0 += 6;
    return a0;
}

static const u16 *BufferQuestLogText_LinkBattledSingle(const u16 *a0)
{
    DynamicPlaceholderTextUtil_Reset();

    memset(gStringVar1, EOS, PLAYER_NAME_LENGTH + 1);
    memcpy(gStringVar1, (const u8 *)a0 + 5, PLAYER_NAME_LENGTH);
    BufferLinkPartnersName(gStringVar1);
    DynamicPlaceholderTextUtil_SetPlaceholderPtr(0, gStringVar1);
    DynamicPlaceholderTextUtil_SetPlaceholderPtr(1, sBattleOutcomeTexts[((const u8 *)a0)[4]]);
    DynamicPlaceholderTextUtil_ExpandPlaceholders(gStringVar4, QuestLog_Text_SingleBattleWithPersonResultedInOutcome);
    a0 += 6;
    return a0;
}

static u16 *BufferQuestLogData_LinkBattledDouble(u16 *a0, const u16 *eventData)
{
    a0[0] = QL_EVENT_LINK_BATTLED_DOUBLE;
    a0[1] = sQuestLogIdx;
    *((u8 *)a0 + 4) = *((const u8 *)eventData + 0);
    memcpy((u8 *)a0 + 5, (const u8 *)eventData + 1, PLAYER_NAME_LENGTH);
    a0 += 6;
    return a0;
}

static const u16 *BufferQuestLogText_LinkBattledDouble(const u16 *a0)
{
    DynamicPlaceholderTextUtil_Reset();

    memset(gStringVar1, EOS, PLAYER_NAME_LENGTH + 1);
    memcpy(gStringVar1, (const u8 *)a0 + 5, PLAYER_NAME_LENGTH);
    BufferLinkPartnersName(gStringVar1);
    DynamicPlaceholderTextUtil_SetPlaceholderPtr(0, gStringVar1);
    DynamicPlaceholderTextUtil_SetPlaceholderPtr(1, sBattleOutcomeTexts[((const u8 *)a0)[4]]);
    DynamicPlaceholderTextUtil_ExpandPlaceholders(gStringVar4, QuestLog_Text_DoubleBattleWithPersonResultedInOutcome);
    a0 += 6;
    return a0;
}

static u16 *BufferQuestLogData_LinkBattledMulti(u16 *a0, const u16 *eventData)
{
    a0[0] = QL_EVENT_LINK_BATTLED_MULTI;
    a0[1] = sQuestLogIdx;
    *((u8 *)a0 + 4) = *((const u8 *)eventData + 0);
    memcpy((u8 *)a0 +  5, (const u8 *)eventData +  1, PLAYER_NAME_LENGTH);
    memcpy((u8 *)a0 + 12, (const u8 *)eventData +  8, PLAYER_NAME_LENGTH);
    memcpy((u8 *)a0 + 19, (const u8 *)eventData + 15, PLAYER_NAME_LENGTH);
    a0 += 13;
    return a0;
}

static const u16 *BufferQuestLogText_LinkBattledMulti(const u16 *a0)
{
    DynamicPlaceholderTextUtil_Reset();

    memset(gStringVar1, EOS, PLAYER_NAME_LENGTH + 1);
    memset(gStringVar2, EOS, PLAYER_NAME_LENGTH + 1);
    memset(gStringVar3, EOS, PLAYER_NAME_LENGTH + 1);
    StringCopy7(gStringVar1, (const u8 *)a0 +  5);
    StringCopy7(gStringVar2, (const u8 *)a0 + 12);
    StringCopy7(gStringVar3, (const u8 *)a0 + 19);
    BufferLinkPartnersName(gStringVar1);
    BufferLinkPartnersName(gStringVar2);
    BufferLinkPartnersName(gStringVar3);
    DynamicPlaceholderTextUtil_SetPlaceholderPtr(0, gSaveBlock2Ptr->playerName);
    DynamicPlaceholderTextUtil_SetPlaceholderPtr(1, gStringVar1); // partner
    DynamicPlaceholderTextUtil_SetPlaceholderPtr(2, gStringVar2); // opponent 1
    DynamicPlaceholderTextUtil_SetPlaceholderPtr(3, gStringVar3); // opponent 2
    DynamicPlaceholderTextUtil_SetPlaceholderPtr(4, sBattleOutcomeTexts[((const u8 *)a0)[4]]);
    DynamicPlaceholderTextUtil_ExpandPlaceholders(gStringVar4, QuestLog_Text_MultiBattleWithPeopleResultedInOutcome);
    a0 += 13;
    return a0;
}

static u16 *BufferQuestLogData_UsedUnionRoom(u16 *a0, const u16 *eventData)
{
    a0[0] = QL_EVENT_USED_UNION_ROOM;
    a0[1] = sQuestLogIdx;
    return a0 + 2;
}

static const u16 *BufferQuestLogText_UsedUnionRoom(const u16 *a0)
{
    StringExpandPlaceholders(gStringVar4, QuestLog_Text_MingledInUnionRoom);
    a0 += 2;
    return a0;
}

static u16 *BufferQuestLogData_UsedUnionRoomChat(u16 *a0, const u16 *eventData)
{
    a0[0] = QL_EVENT_USED_UNION_ROOM_CHAT;
    a0[1] = sQuestLogIdx;
    return a0 + 2;
}

static const u16 *BufferQuestLogText_UsedUnionRoomChat(const u16 *a0)
{
    StringExpandPlaceholders(gStringVar4, QuestLog_Text_ChattedWithManyTrainers);
    a0 += 2;
    return a0;
}

static u16 *BufferQuestLogData_LinkTradedUnionRoom(u16 *a0, const u16 *eventData)
{
    u8 *r4 = (u8 *)(a0 + 4);
    a0[0] = QL_EVENT_LINK_TRADED_UNION;
    a0[1] = sQuestLogIdx;
    a0[2] = eventData[0];
    a0[3] = eventData[1];
    memcpy(r4, eventData + 2, PLAYER_NAME_LENGTH);
    r4 += 8;
    return (u16 *)r4;
}

static const u16 *BufferQuestLogText_LinkTradedUnionRoom(const u16 *a0)
{
    const u8 *r6 = (const u8 *)(a0 + 4);
    memset(gStringVar1, EOS, PLAYER_NAME_LENGTH + 1);
    memcpy(gStringVar1, r6, PLAYER_NAME_LENGTH);
    BufferLinkPartnersName(gStringVar1);
    QuestLog_GetSpeciesName(a0[3], gStringVar2, 0);
    QuestLog_GetSpeciesName(a0[2], gStringVar3, 0);
    StringExpandPlaceholders(gStringVar4, QuestLog_Text_TradedMon1ForTrainersMon2);
    r6 += 8;
    return (const u16 *)r6;
}

static u16 *BufferQuestLogData_LinkBattledUnionRoom(u16 *a0, const u16 *eventData)
{
    a0[0] = QL_EVENT_LINK_BATTLED_UNION;
    a0[1] = sQuestLogIdx;
    *(u8 *)&a0[2] = *(const u8 *)&eventData[0];
    memcpy((u8 *)a0 + 5, (const u8 *)eventData + 1, PLAYER_NAME_LENGTH);
    a0 += 6;
    return a0;
}

static const u16 *BufferQuestLogText_LinkBattledUnionRoom(const u16 *a0)
{
    memset(gStringVar1, EOS, PLAYER_NAME_LENGTH + 1);
    memcpy(gStringVar1, (const u8 *)a0 + 5, PLAYER_NAME_LENGTH);
    BufferLinkPartnersName(gStringVar1);
    StringCopy(gStringVar2, sBattleOutcomeTexts[*(const u8 *)&a0[2]]);
    StringExpandPlaceholders(gStringVar4, QuestLog_Text_BattledTrainerEndedInOutcome);
    a0 += 6;
    return a0;
}

static u16 *BufferQuestLogData_SwitchedMonsBetweenBoxes(u16 *a0, const u16 *eventData)
{
    a0 = sub_8113DE0(QL_EVENT_SWITCHED_MONS_BETWEEN_BOXES, a0);
    if (a0 == NULL)
        return NULL;
    a0[0] = eventData[0];
    a0[1] = eventData[1];
    *((u8 *)a0 + 4) = *((const u8 *)eventData + 4);
    *((u8 *)a0 + 5) = *((const u8 *)eventData + 5);
    return a0 + 3;
}

static const u16 *BufferQuestLogText_SwitchedMonsBetweenBoxes(const u16 *eventData)
{
    const u8 *boxIdxs;
    eventData = sub_8113E88(QL_EVENT_SWITCHED_MONS_BETWEEN_BOXES, eventData);
    boxIdxs = (const u8 *)eventData + 4;
    DynamicPlaceholderTextUtil_Reset();
    DynamicPlaceholderTextUtil_SetPlaceholderPtr(0, GetBoxNamePtr(boxIdxs[0]));
    QuestLog_GetSpeciesName(eventData[0], NULL, 1);
    DynamicPlaceholderTextUtil_SetPlaceholderPtr(2, GetBoxNamePtr(boxIdxs[1]));
    QuestLog_GetSpeciesName(eventData[1], NULL, 3);
    DynamicPlaceholderTextUtil_ExpandPlaceholders(gStringVar4, QuestLog_Text_SwitchedMonsBetweenBoxes);
    return eventData + 3;
}

static u16 *BufferQuestLogData_SwitchedMonsWithinBox(u16 *a0, const u16 *eventData)
{
    a0 = sub_8113DE0(QL_EVENT_SWITCHED_MONS_WITHIN_BOX, a0);
    if (a0 == NULL)
        return NULL;
    a0[0] = eventData[0];
    a0[1] = eventData[1];
    *((u8 *)a0 + 4) = *((const u8 *)eventData + 4);
    return a0 + 3;
}

static const u16 *BufferQuestLogText_SwitchedMonsWithinBox(const u16 *eventData)
{
    const u8 *boxIdxs;
    eventData = sub_8113E88(QL_EVENT_SWITCHED_MONS_WITHIN_BOX, eventData);
    boxIdxs = (const u8 *)eventData + 4;
    DynamicPlaceholderTextUtil_Reset();
    DynamicPlaceholderTextUtil_SetPlaceholderPtr(0, GetBoxNamePtr(boxIdxs[0]));
    QuestLog_GetSpeciesName(eventData[0], NULL, 1);
    QuestLog_GetSpeciesName(eventData[1], NULL, 2);
    DynamicPlaceholderTextUtil_ExpandPlaceholders(gStringVar4, QuestLog_Text_SwitchedMonsWithinBox);
    return eventData + 3;
}

static u16 *BufferQuestLogData_SwitchedPartyMonForPCMon(u16 *a0, const u16 *eventData)
{
    u16 *r2;
    u16 *ret;
    r2 = sub_8113DE0(QL_EVENT_SWITCHED_PARTY_MON_FOR_PC_MON, a0);
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

static const u16 *BufferQuestLogText_SwitchedPartyMonForPCMon(const u16 *eventData)
{
    const u8 *boxIdxs;
    eventData = sub_8113E88(QL_EVENT_SWITCHED_PARTY_MON_FOR_PC_MON, eventData);
    boxIdxs = (const u8 *)eventData + 4;
    DynamicPlaceholderTextUtil_Reset();
    DynamicPlaceholderTextUtil_SetPlaceholderPtr(0, GetBoxNamePtr(boxIdxs[0]));
    QuestLog_GetSpeciesName(eventData[0], NULL, 1);
    QuestLog_GetSpeciesName(eventData[1], NULL, 2);
    DynamicPlaceholderTextUtil_ExpandPlaceholders(gStringVar4, QuestLog_Text_SwitchedPartyMonForPCMon);
    return eventData + 3;
}

static u16 *BufferQuestLogData_MovedMonBetweenBoxes(u16 *a0, const u16 *eventData)
{
    u16 *r2;
    u16 *ret;
    r2 = sub_8113DE0(QL_EVENT_MOVED_MON_BETWEEN_BOXES, a0);
    if (r2 == NULL)
        return NULL;
    r2[0] = eventData[0];
    ret = r2 + 1;
    *((u8 *)ret + 0) = *((const u8 *)eventData + 4);
    *((u8 *)ret + 1) = *((const u8 *)eventData + 5);
    return ret + 1;
}

static const u16 *BufferQuestLogText_MovedMonBetweenBoxes(const u16 *eventData)
{
    const u8 *boxIdxs;
    eventData = sub_8113E88(QL_EVENT_MOVED_MON_BETWEEN_BOXES, eventData);
    boxIdxs = (const u8 *)eventData + 2;
    DynamicPlaceholderTextUtil_Reset();
    DynamicPlaceholderTextUtil_SetPlaceholderPtr(0, GetBoxNamePtr(boxIdxs[0]));
    QuestLog_GetSpeciesName(eventData[0], NULL, 1);
    DynamicPlaceholderTextUtil_SetPlaceholderPtr(2, GetBoxNamePtr(boxIdxs[1]));
    DynamicPlaceholderTextUtil_ExpandPlaceholders(gStringVar4, QuestLog_Text_MovedMonToNewBox);
    return (const u16 *)boxIdxs + 1;
}

static u16 *BufferQuestLogData_MovedMonWithinBox(u16 *a0, const u16 *eventData)
{
    u16 *r2;
    r2 = sub_8113DE0(QL_EVENT_MOVED_MON_WITHIN_BOX, a0);
    if (r2 == NULL)
        return NULL;
    r2[0] = eventData[0];
    *((u8 *)r2 + 2) = *((const u8 *)eventData + 4);
    return r2 + 2;
}

static const u16 *BufferQuestLogText_MovedMonWithinBox(const u16 *eventData)
{
    const u8 *boxIdxs;
    eventData = sub_8113E88(QL_EVENT_MOVED_MON_WITHIN_BOX, eventData);
    boxIdxs = (const u8 *)eventData + 2;
    DynamicPlaceholderTextUtil_Reset();
    DynamicPlaceholderTextUtil_SetPlaceholderPtr(0, GetBoxNamePtr(boxIdxs[0]));
    QuestLog_GetSpeciesName(eventData[0], NULL, 1);
    DynamicPlaceholderTextUtil_ExpandPlaceholders(gStringVar4, QuestLog_Text_MovedMonWithinBox);
    return (const u16 *)boxIdxs + 1;
}

static u16 *BufferQuestLogData_WithdrewMonFromPC(u16 *a0, const u16 *eventData)
{
    u16 *r2;
    r2 = sub_8113DE0(QL_EVENT_WITHDREW_MON_PC, a0);
    if (r2 == NULL)
        return NULL;
    r2[0] = eventData[0];
    *((u8 *)r2 + 2) = *((const u8 *)eventData + 4);
    return r2 + 2;
}

static const u16 *BufferQuestLogText_WithdrewMonFromPC(const u16 *eventData)
{
    const u8 *boxIdxs;
    eventData = sub_8113E88(QL_EVENT_WITHDREW_MON_PC, eventData);
    boxIdxs = (const u8 *)eventData + 2;
    DynamicPlaceholderTextUtil_Reset();
    DynamicPlaceholderTextUtil_SetPlaceholderPtr(0, GetBoxNamePtr(boxIdxs[0]));
    QuestLog_GetSpeciesName(eventData[0], NULL, 1);
    DynamicPlaceholderTextUtil_ExpandPlaceholders(gStringVar4, QuestLog_Text_WithdrewMonFromPC);
    return (const u16 *)boxIdxs + 1;
}

static u16 *BufferQuestLogData_DepositedMonInPC(u16 *a0, const u16 *eventData)
{
    u16 *r2;
    r2 = sub_8113DE0(QL_EVENT_DEPOSITED_MON_PC, a0);
    if (r2 == NULL)
        return NULL;
    r2[0] = eventData[0];
    *((u8 *)r2 + 2) = *((const u8 *)eventData + 4);
    return r2 + 2;
}

static const u16 *BufferQuestLogText_DepositedMonInPC(const u16 *eventData)
{
    const u8 *boxIdxs;
    eventData = sub_8113E88(QL_EVENT_DEPOSITED_MON_PC, eventData);
    boxIdxs = (const u8 *)eventData + 2;
    DynamicPlaceholderTextUtil_Reset();
    QuestLog_GetSpeciesName(eventData[0], NULL, 0);
    DynamicPlaceholderTextUtil_SetPlaceholderPtr(1, GetBoxNamePtr(boxIdxs[0]));
    DynamicPlaceholderTextUtil_ExpandPlaceholders(gStringVar4, QuestLog_Text_DepositedMonInPC);
    return (const u16 *)boxIdxs + 1;
}

static u16 *BufferQuestLogData_SwitchedMultipleMons(u16 *a0, const u16 *eventData)
{
    u16 *r2;
    r2 = sub_8113DE0(QL_EVENT_SWITCHED_MULTIPLE_MONS, a0);
    if (r2 == NULL)
        return NULL;
    *((u8 *)r2 + 0) = *((const u8 *)eventData + 4);
    *((u8 *)r2 + 1) = *((const u8 *)eventData + 5);
    return r2 + 1;
}

static const u16 *BufferQuestLogText_SwitchedMultipleMons(const u16 *eventData)
{
    const u16 *r4 = sub_8113E88(QL_EVENT_SWITCHED_MULTIPLE_MONS, eventData);
    DynamicPlaceholderTextUtil_Reset();
    DynamicPlaceholderTextUtil_SetPlaceholderPtr(0, GetBoxNamePtr(*((const u8 *)r4 + 0)));
    if (*((const u8 *)r4 + 0) == *((const u8 *)r4 + 1))
        DynamicPlaceholderTextUtil_SetPlaceholderPtr(1, QuestLog_Text_ADifferentSpot);
    else
        DynamicPlaceholderTextUtil_SetPlaceholderPtr(1, GetBoxNamePtr(*((const u8 *)r4 + 1)));
    DynamicPlaceholderTextUtil_ExpandPlaceholders(gStringVar4, QuestLog_Text_SwitchedMultipleMons);
    return r4 + 1;
}

static u16 *BufferQuestLogData_DepositedItemInPC(u16 *a0, const u16 *eventData)
{
    a0 = sub_8113DE0(QL_EVENT_DEPOSITED_ITEM_PC, a0);
    if (a0 == NULL)
        return NULL;
    a0[0] = eventData[0];
    return a0 + 1;
}

static const u16 *BufferQuestLogText_DepositedItemInPC(const u16 *eventData)
{
    const u16 *r4 = sub_8113E88(QL_EVENT_DEPOSITED_ITEM_PC, eventData);
    CopyItemName(r4[0], gStringVar1);
    StringExpandPlaceholders(gStringVar4, QuestLog_Text_StoredItemInPC);
    return r4 + 1;
}

static u16 *BufferQuestLogData_WithdrewItemFromPC(u16 *a0, const u16 *eventData)
{
    a0 = sub_8113DE0(QL_EVENT_WITHDREW_ITEM_PC, a0);
    if (a0 == NULL)
        return NULL;
    a0[0] = eventData[0];
    return a0 + 1;
}

static const u16 *BufferQuestLogText_WithdrewItemFromPC(const u16 *eventData)
{
    const u16 *r4 = sub_8113E88(QL_EVENT_WITHDREW_ITEM_PC, eventData);
    CopyItemName(r4[0], gStringVar1);
    StringExpandPlaceholders(gStringVar4, QuestLog_Text_WithdrewItemFromPC);
    return r4 + 1;
}

u16 *BufferQuestLogData_DefeatedTrainer_(u16 eventId, u16 *a1, const u16 *a2)
{
    a1 = sub_8113DE0(eventId, a1);
    if (a1 == NULL)
        return NULL;
    a1[0] = a2[1];
    a1[1] = a2[2];
    a1[2] = a2[0];
    *((u8 *)a1 + 6) = *((const u8 *)a2 + 7);
    *((u8 *)a1 + 7) = *((const u8 *)a2 + 6);
    return a1 + 4;
}

static u16 *BufferQuestLogData_DefeatedGymLeader(u16 *a0, const u16 *eventData)
{
    gUnknown_203B048 = 1;
    return BufferQuestLogData_DefeatedTrainer_(QL_EVENT_DEFEATED_GYM_LEADER, a0, eventData);
}

static const u16 *BufferQuestLogText_DefeatedGymLeader(const u16 *eventData)
{
    const u8 *r6;
    eventData = sub_8113E88(QL_EVENT_DEFEATED_GYM_LEADER, eventData);
    r6 = (const u8 *)eventData + 6;
    DynamicPlaceholderTextUtil_Reset();
    GetMapNameGeneric(gStringVar1, r6[0]);
    DynamicPlaceholderTextUtil_SetPlaceholderPtr(0, gStringVar1);
    DynamicPlaceholderTextUtil_SetPlaceholderPtr(1, gTrainers[eventData[2]].trainerName);
    QuestLog_GetSpeciesName(eventData[0], 0, 2);
    QuestLog_GetSpeciesName(eventData[1], 0, 3);
    DynamicPlaceholderTextUtil_SetPlaceholderPtr(4, sDefeatedOpponentFlavorTexts[r6[1]]);
    DynamicPlaceholderTextUtil_ExpandPlaceholders(gStringVar4, QuestLog_Text_TookOnGymLeadersMonWithMonAndWon);
    return eventData + 4;
}

static u16 *BufferQuestLogData_DefeatedWildMon(u16 *a0, const u16 *eventData)
{
    u16 *r4 = a0;
    u8 *r5 = (u8 *)a0 + 8;
    if (!sub_8110944(r4, sQuestLogEventCmdSizes[QL_EVENT_DEFEATED_WILD_MON]))
        return NULL;
    if (r5[0] == 0 && r5[1] == 0)
    {
        r4[0] = QL_EVENT_DEFEATED_WILD_MON;
        r4[1] = sQuestLogIdx;
    }
    if (eventData[0])
        r4[2] = eventData[0];
    if (eventData[1])
        r4[3] = eventData[1];
    if (eventData[0] && r5[0] != 0xFF)
        r5[0]++;
    if (eventData[1] && r5[1] != 0xFF)
        r5[1]++;
    r5[2] = *((const u8 *)eventData + 4);
    return (u16 *)(r5 + 4);
}

static const u16 *BufferQuestLogText_DefeatedWildMon(const u16 *a0)
{
    const u8 *data;
    if (!sub_8110944(a0, sQuestLogEventCmdSizes[QL_EVENT_DEFEATED_WILD_MON]))
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
            DynamicPlaceholderTextUtil_ExpandPlaceholders(gStringVar4, QuestLog_Text_CaughtWildMon);
        else
            DynamicPlaceholderTextUtil_ExpandPlaceholders(gStringVar4, QuestLog_Text_CaughtWildMons);
    }
    else if (data[1] == 0)
    {
        if (data[0] == 1)
            DynamicPlaceholderTextUtil_ExpandPlaceholders(gStringVar4, QuestLog_Text_DefeatedWildMon);
        else
            DynamicPlaceholderTextUtil_ExpandPlaceholders(gStringVar4, QuestLog_Text_DefeatedWildMons);
    }
    else if (data[0] == 1)
    {
        if (data[1] == 1)
            DynamicPlaceholderTextUtil_ExpandPlaceholders(gStringVar4, QuestLog_Text_DefeatedWildMonAndCaughtWildMon);
        else
            DynamicPlaceholderTextUtil_ExpandPlaceholders(gStringVar4, QuestLog_Text_DefeatedWildMonAndCaughtWildMons);
    }
    else
    {
        if (data[1] == 1)
            DynamicPlaceholderTextUtil_ExpandPlaceholders(gStringVar4, QuestLog_Text_DefeatedWildMonsAndCaughtWildMon);
        else
            DynamicPlaceholderTextUtil_ExpandPlaceholders(gStringVar4, QuestLog_Text_DefeatedWildMonsAndCaughtWildMons);
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

static u16 *BufferQuestLogData_DefeatedEliteFourMember(u16 *a0, const u16 *eventData)
{
    gUnknown_203B048 = 1;
    return BufferQuestLogData_DefeatedTrainer_(QL_EVENT_DEFEATED_E4_MEMBER, a0, eventData);
}

static const u16 *BufferQuestLogText_DefeatedEliteFourMember(const u16 *eventData)
{
    const u8 *r5;
    eventData = sub_8113E88(QL_EVENT_DEFEATED_E4_MEMBER, eventData);
    r5 = (const u8 *)eventData + 6;
    DynamicPlaceholderTextUtil_Reset();
    DynamicPlaceholderTextUtil_SetPlaceholderPtr(0, gTrainers[eventData[2]].trainerName);
    QuestLog_GetSpeciesName(eventData[0], NULL, 1);
    QuestLog_GetSpeciesName(eventData[1], NULL, 2);
    DynamicPlaceholderTextUtil_SetPlaceholderPtr(3, sDefeatedOpponentFlavorTexts[r5[1]]);
    DynamicPlaceholderTextUtil_ExpandPlaceholders(gStringVar4, QuestLog_Text_TookOnEliteFoursMonWithMonAndWon);
    return eventData + 4;
}

static u16 *BufferQuestLogData_DefeatedChampion(u16 *a0, const u16 *eventData)
{
    if (!sub_8110944(a0, sQuestLogEventCmdSizes[QL_EVENT_DEFEATED_CHAMPION]))
        return NULL;
    a0[0] = 0x2021;
    a0[1] = sQuestLogIdx;
    a0[2] = eventData[1];
    a0[3] = eventData[2];
    *((u8 *)a0 + 8) = *((const u8 *)eventData + 6);
    gUnknown_203B048 = 1;
    return a0 + 5;
}

static const u16 *BufferQuestLogText_DefeatedChampion(const u16 *a0)
{
    const u8 *r5;
    if (!sub_8110944(a0, sQuestLogEventCmdSizes[QL_EVENT_DEFEATED_CHAMPION]))
        return NULL;

    r5 = (const u8 *)a0 + 8;
    DynamicPlaceholderTextUtil_Reset();

    switch (gUnknown_203B044.unk_2)
    {
    case 0:
        DynamicPlaceholderTextUtil_SetPlaceholderPtr(0, gSaveBlock2Ptr->playerName);
        DynamicPlaceholderTextUtil_SetPlaceholderPtr(1, gSaveBlock1Ptr->rivalName);
        DynamicPlaceholderTextUtil_ExpandPlaceholders(gStringVar4, QuestLog_Text_PlayerBattledChampionRival);
        break;
    case 1:
        DynamicPlaceholderTextUtil_SetPlaceholderPtr(0, gSaveBlock1Ptr->rivalName);
        QuestLog_GetSpeciesName(a0[2], NULL, 1);
        DynamicPlaceholderTextUtil_SetPlaceholderPtr(2, gSaveBlock2Ptr->playerName);
        QuestLog_GetSpeciesName(a0[3], NULL, 3);
        DynamicPlaceholderTextUtil_ExpandPlaceholders(gStringVar4, QuestLog_Text_PlayerSentOutMon1RivalSentOutMon2);
        break;
    case 2:
        DynamicPlaceholderTextUtil_SetPlaceholderPtr(0, sDefeatedChampionFlavorTexts[r5[0]]);
        DynamicPlaceholderTextUtil_ExpandPlaceholders(gStringVar4, QuestLog_Text_WonTheMatchAsAResult);
        break;
    }
    return (const u16 *)(r5 + 2);
}

static u16 *BufferQuestLogData_DefeatedTrainer(u16 *a0, const u16 *eventData)
{
    gUnknown_203B048 = 1;
    return BufferQuestLogData_DefeatedTrainer_(QL_EVENT_DEFEATED_TRAINER, a0, eventData);
}

static const u16 *BufferQuestLogText_DefeatedTrainer(const u16 *eventData)
{
    const u16 *r5 = sub_8113E88(QL_EVENT_DEFEATED_TRAINER, eventData);
    const u8 *r6 = (const u8 *)r5 + 6;
    DynamicPlaceholderTextUtil_Reset();
    GetMapNameGeneric(gStringVar1, r6[0]);
    DynamicPlaceholderTextUtil_SetPlaceholderPtr(0, gStringVar1);

    if (gTrainers[r5[2]].trainerClass == CLASS_RIVAL
     || gTrainers[r5[2]].trainerClass == CLASS_RIVAL_2
     || gTrainers[r5[2]].trainerClass == CLASS_CHAMPION_2)
        DynamicPlaceholderTextUtil_SetPlaceholderPtr(1, GetExpandedPlaceholder(PLACEHOLDER_ID_RIVAL));
    else
        DynamicPlaceholderTextUtil_SetPlaceholderPtr(1, gTrainers[r5[2]].trainerName);

    QuestLog_GetSpeciesName(r5[0], NULL, 2);
    QuestLog_GetSpeciesName(r5[1], NULL, 3);
    DynamicPlaceholderTextUtil_SetPlaceholderPtr(4, sDefeatedOpponentFlavorTexts[r6[1]]);
    DynamicPlaceholderTextUtil_ExpandPlaceholders(gStringVar4, QuestLog_Text_TookOnTrainersMonWithMonAndWon);
    return (const u16 *)(r6 + 2);
}

static const u8 *const sLocationNameTexts[] = 
{
    [QL_LOCATION_HOME]               = QuestLog_Text_Home,
    [QL_LOCATION_OAKS_LAB]           = QuestLog_Text_OakResearchLab,
    [QL_LOCATION_VIRIDIAN_GYM]       = QuestLog_Text_Gym,
    [QL_LOCATION_LEAGUE_GATE_1]      = QuestLog_Text_PokemonLeagueGate,
    [QL_LOCATION_LEAGUE_GATE_2]      = QuestLog_Text_PokemonLeagueGate,
    [QL_LOCATION_VIRIDIAN_FOREST_1]  = QuestLog_Text_ViridianForest,
    [QL_LOCATION_VIRIDIAN_FOREST_2]  = QuestLog_Text_ViridianForest,
    [QL_LOCATION_PEWTER_MUSEUM]      = QuestLog_Text_PewterMuseumOfScience,
    [QL_LOCATION_PEWTER_GYM]         = QuestLog_Text_Gym,
    [QL_LOCATION_MT_MOON_1]          = QuestLog_Text_MtMoon,
    [QL_LOCATION_MT_MOON_2]          = QuestLog_Text_MtMoon,
    [QL_LOCATION_CERULEAN_GYM]       = QuestLog_Text_Gym,
    [QL_LOCATION_BIKE_SHOP]          = QuestLog_Text_BikeShop,
    [QL_LOCATION_BILLS_HOUSE]        = QuestLog_Text_BillsHouse,
    [QL_LOCATION_DAY_CARE]           = QuestLog_Text_DayCare,
    [QL_LOCATION_UNDERGROUND_PATH_1] = QuestLog_Text_UndergroundPath,
    [QL_LOCATION_UNDERGROUND_PATH_2] = QuestLog_Text_UndergroundPath,
    [QL_LOCATION_PKMN_FAN_CLUB]      = QuestLog_Text_PokemonFanClub,
    [QL_LOCATION_VERMILION_GYM]      = QuestLog_Text_Gym,
    [QL_LOCATION_SS_ANNE]            = QuestLog_Text_SSAnne,
    [QL_LOCATION_DIGLETTS_CAVE_1]    = QuestLog_Text_DiglettsCave,
    [QL_LOCATION_DIGLETTS_CAVE_2]    = QuestLog_Text_DiglettsCave,
    [QL_LOCATION_ROCK_TUNNEL_1]      = QuestLog_Text_RockTunnel,
    [QL_LOCATION_ROCK_TUNNEL_2]      = QuestLog_Text_RockTunnel,
    [QL_LOCATION_POWER_PLANT]        = QuestLog_Text_PowerPlant,
    [QL_LOCATION_PKMN_TOWER]         = QuestLog_Text_PokemonTower,
    [QL_LOCATION_VOLUNTEER_HOUSE]    = QuestLog_Text_VolunteerHouse,
    [QL_LOCATION_NAME_RATERS_HOUSE]  = QuestLog_Text_NameRatersHouse,
    [QL_LOCATION_UNDERGROUND_PATH_3] = QuestLog_Text_UndergroundPath,
    [QL_LOCATION_UNDERGROUND_PATH_4] = QuestLog_Text_UndergroundPath,
    [QL_LOCATION_CELADON_DEPT_STORE] = QuestLog_Text_CeladonDeptStore,
    [QL_LOCATION_CELADON_MANSION]    = QuestLog_Text_CeladonMansion,
    [QL_LOCATION_GAME_CORNER]        = QuestLog_Text_RocketGameCorner,
    [QL_LOCATION_CELADON_GYM]        = QuestLog_Text_Gym,
    [QL_LOCATION_CELADON_RESTAURANT] = QuestLog_Text_Restaurant,
    [QL_LOCATION_ROCKET_HIDEOUT]     = QuestLog_Text_RocketHideout,
    [QL_LOCATION_SAFARI_ZONE]        = QuestLog_Text_SafariZone,
    [QL_LOCATION_FUCHSIA_GYM]        = QuestLog_Text_Gym,
    [QL_LOCATION_WARDENS_HOME]       = QuestLog_Text_WardensHome,
    [QL_LOCATION_FIGHTING_DOJO]      = QuestLog_Text_FightingDojo,
    [QL_LOCATION_SAFFRON_GYM]        = QuestLog_Text_Gym,
    [QL_LOCATION_SILPH_CO]           = QuestLog_Text_SilphCo,
    [QL_LOCATION_SEAFOAM_ISLANDS_1]  = QuestLog_Text_SeafoamIslands,
    [QL_LOCATION_SEAFOAM_ISLANDS_2]  = QuestLog_Text_SeafoamIslands,
    [QL_LOCATION_PKMN_MANSION]       = QuestLog_Text_PokemonMansion,
    [QL_LOCATION_CINNABAR_GYM]       = QuestLog_Text_Gym,
    [QL_LOCATION_CINNABAR_LAB]       = QuestLog_Text_PokemonResearchLab,
    [QL_LOCATION_VICTORY_ROAD_1]     = QuestLog_Text_VictoryRoad,
    [QL_LOCATION_VICTORY_ROAD_2]     = QuestLog_Text_VictoryRoad,
    [QL_LOCATION_PKMN_LEAGUE]        = QuestLog_Text_PokemonLeague,
    [QL_LOCATION_CERULEAN_CAVE]      = QuestLog_Text_CeruleanCave
};

static const u8 *const sDepartedLocationTexts[] = 
{
    [QL_DEPARTED_TOWN_BUILDING]   = QuestLog_Text_DepartedPlaceInTownForNextDestination,
    [QL_DEPARTED_MUSEUM]          = QuestLog_Text_LeftTownsLocationForNextDestination,
    [QL_DEPARTED_GAME_CORNER]     = QuestLog_Text_PlayedGamesAtGameCorner,
    [QL_DEPARTED_HOME]            = QuestLog_Text_RestedAtHome,
    [QL_DEPARTED_OAKS_LAB]        = QuestLog_Text_LeftOaksLab,
    [QL_DEPARTED_GYM]             = QuestLog_Text_GymWasFullOfToughTrainers,
    [QL_DEPARTED_SAFARI_ZONE]     = QuestLog_Text_HadGreatTimeInSafariZone,
    [QL_DEPARTED_CAVE]            = QuestLog_Text_ManagedToGetOutOfLocation,
    [QL_DEPARTED_MISC_BUILDING_1] = QuestLog_Text_DepartedTheLocationForNextDestination,
    [QL_DEPARTED_MISC_BUILDING_2] = QuestLog_Text_DepartedFromLocationToNextDestination
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

static const u8 gUnknown_8456C17[] = {
    0x5a,
    0x5b,
    0x5d,
    0x5e,
    0x5f,
    0x62,
    0x60,
    0x59
};

static const u8 *const sUsedFieldMoveTexts[] = 
{
    [FIELD_MOVE_FLASH]       = QuestLog_Text_UsedFlash,
    [FIELD_MOVE_CUT]         = QuestLog_Text_UsedCut,
    [FIELD_MOVE_FLY]         = QuestLog_Text_UsedFly,
    [FIELD_MOVE_STRENGTH]    = QuestLog_Text_UsedStrength,
    [FIELD_MOVE_SURF]        = QuestLog_Text_UsedSurf,
    [FIELD_MOVE_ROCK_SMASH]  = QuestLog_Text_UsedRockSmash,
    [FIELD_MOVE_WATERFALL]   = QuestLog_Text_UsedWaterfall,
    [FIELD_MOVE_TELEPORT]    = QuestLog_Text_UsedTeleportToLocation,
    [FIELD_MOVE_DIG]         = QuestLog_Text_UsedDigInLocation,
    [FIELD_MOVE_MILK_DRINK]  = QuestLog_Text_UsedMilkDrink,
    [FIELD_MOVE_SOFT_BOILED] = QuestLog_Text_UsedSoftboiled,
    [FIELD_MOVE_SWEET_SCENT] = QuestLog_Text_UsedSweetScent
};

static u16 *BufferQuestLogData_DepartedLocation(u16 *a0, const u16 *eventData)
{
    u16 *r2 = sub_8113DE0(QL_EVENT_DEPARTED, a0);
    if (r2 == NULL)
        return NULL;
    *((u8 *)r2 + 0) = *((const u8 *)eventData + 0);
    if ((*((u8 *)r2 + 1) = *((const u8 *)eventData + 1)) == 0x24)
        gUnknown_203B048 = 1;
    return r2 + 1;
}

static const u16 *BufferQuestLogText_DepartedLocation(const u16 *eventData)
{
    u8 r4, locationId;
    const u16 *r5 = sub_8113E88(QL_EVENT_DEPARTED, eventData);
    const u8 *r5_2 = (const u8 *)r5 + 0;
    locationId = r5_2[1];
    GetMapNameGeneric(gStringVar1, r5_2[0]);
    StringCopy(gStringVar2, sLocationNameTexts[locationId]);
    if (sLocationToDepartedTextId[locationId] == QL_DEPARTED_GYM)
    {
        for (r4 = 0; r4 < ARRAY_COUNT(gUnknown_8456C17); r4++)
        {
            if (r5_2[0] != gUnknown_8456C17[r4])
                continue;
            if (FlagGet(FLAG_BADGE01_GET + r4) == TRUE)
                StringExpandPlaceholders(gStringVar4, QuestLog_Text_DepartedGym);
            else
                StringExpandPlaceholders(gStringVar4, QuestLog_Text_GymWasFullOfToughTrainers);
            break;
        }
        if (r4 == 8)
            StringExpandPlaceholders(gStringVar4, sDepartedLocationTexts[sLocationToDepartedTextId[locationId]]);
    }
    else
        StringExpandPlaceholders(gStringVar4, sDepartedLocationTexts[sLocationToDepartedTextId[locationId]]);

    return (const u16 *)(r5_2 + 2);
}

void sub_811539C(void)
{
    gUnknown_203B04B = TRUE;
}

static bool8 sub_81153A8(u16 eventId, const u16 *eventData)
{
    if (eventId != QL_EVENT_DEPARTED)
    {
        gUnknown_203B04A = 0;
        return TRUE;
    }
    if (gUnknown_203B04A == *((u8 *)eventData + 1) + 1)
        return FALSE;
    gUnknown_203B04A = *((u8 *)eventData + 1) + 1;
    return TRUE;
}

static bool8 sub_81153E4(u16 eventId, const u16 *eventData)
{
    if (eventId != QL_EVENT_DEPARTED)
        return TRUE;

    if (*((u8 *)eventData + 1) == 32 && !gUnknown_203B04B)
        return FALSE;

    gUnknown_203B04B = FALSE;
    return TRUE;
}

static u16 *BufferQuestLogData_UsedFieldMove(u16 *a0, const u16 *eventData)
{
    u8 *r3;
    a0 = sub_8113DE0(QL_EVENT_USED_FIELD_MOVE, a0);
    if (a0 == NULL)
        return NULL;
    a0[0] = eventData[0];
    r3 = (u8 *)a0 + 2;
    r3[0] = *((const u8 *)eventData + 2);
    r3[1] = *((const u8 *)eventData + 3);
    if (r3[0] == FIELD_MOVE_TELEPORT || r3[0] == FIELD_MOVE_DIG)
        gUnknown_203B048 = 2;
    else
        gUnknown_203B048 = 1;
    return (u16 *)(r3 + 2);
}

static const u16 *BufferQuestLogText_UsedFieldMove(const u16 *eventData)
{
    const u16 *r4 = sub_8113E88(QL_EVENT_USED_FIELD_MOVE, eventData);
    const u8 *r5 = (const u8 *)r4 + 2;
    QuestLog_GetSpeciesName(r4[0], gStringVar1, 0);
    if (r5[1] != 0xFF)
        GetMapNameGeneric(gStringVar2, r5[1]);

    // If used Teleport, get name of destination
    if (r5[0] == FIELD_MOVE_TELEPORT)
    {
        if (r5[1] == 0x58)
            StringCopy(gStringVar3, QuestLog_Text_Home);
        else
            StringCopy(gStringVar3, gText_PokemonCenter);
    }

    StringExpandPlaceholders(gStringVar4, sUsedFieldMoveTexts[r5[0]]);
    return (const u16 *)(r5 + 2);
}

static u16 *BufferQuestLogData_BoughtItem(u16 *a0, const u16 *eventData)
{
    a0 = sub_8113DE0(QL_EVENT_BOUGHT_ITEM, a0);
    if (a0 == NULL)
        return NULL;
    a0[0] = eventData[2];
    a0[1] = eventData[3];
    a0[2] = *((const u32 *)eventData) >> 16;
    a0[3] = *((const u32 *)eventData);
    *((u8 *)a0 + 8) = *((const u8 *)eventData + 8);
    *((u8 *)a0 + 9) = 1;
    return a0 + 5;
}

static const u16 *BufferQuestLogText_BoughtItem(const u16 *eventData)
{
    const u16 *r4 = sub_8113E88(QL_EVENT_BOUGHT_ITEM, eventData);
    const u8 *r7 = (const u8 *)r4 + 8;
    u32 r6 = (r4[2] << 16) + r4[3];
    DynamicPlaceholderTextUtil_Reset();
    GetMapNameGeneric(gStringVar1, r7[0]);
    DynamicPlaceholderTextUtil_SetPlaceholderPtr(0, gStringVar1);
    DynamicPlaceholderTextUtil_SetPlaceholderPtr(1, ItemId_GetName(r4[0]));
    if (r4[1] < 2)
        DynamicPlaceholderTextUtil_ExpandPlaceholders(gStringVar4, QuestLog_Text_BoughtItem);
    else
    {
        ConvertIntToDecimalStringN(gStringVar2, r6, STR_CONV_MODE_LEFT_ALIGN, 6);
        DynamicPlaceholderTextUtil_SetPlaceholderPtr(2, gStringVar2);
        DynamicPlaceholderTextUtil_ExpandPlaceholders(gStringVar4, QuestLog_Text_BoughtItemsIncludingItem);
    }
    return (const u16 *)(r7 + 2);
}

static u16 *BufferQuestLogData_SoldItem(u16 *a0, const u16 *eventData)
{
    a0 = sub_8113DE0(QL_EVENT_SOLD_ITEM, a0);
    if (a0 == NULL)
        return NULL;
    a0[0] = eventData[2];
    a0[1] = eventData[3];
    a0[2] = *((const u32 *)eventData) >> 16;
    a0[3] = *((const u32 *)eventData);
    *((u8 *)a0 + 8) = *((const u8 *)eventData + 8);
    *((u8 *)a0 + 9) = *((const u8 *)eventData + 9);
    return a0 + 5;
}

static const u16 *BufferQuestLogText_SoldItem(const u16 *eventData)
{
    const u16 *r5 = sub_8113E88(QL_EVENT_SOLD_ITEM, eventData);
    const u8 *r7 = (const u8 *) r5 + 8;
    u32 r6 = (r5[2] << 16) + r5[3];
    DynamicPlaceholderTextUtil_Reset();
    GetMapNameGeneric(gStringVar1, r7[0]);
    if (r7[1] == 0) {
        DynamicPlaceholderTextUtil_SetPlaceholderPtr(0, gSaveBlock2Ptr->playerName);
        DynamicPlaceholderTextUtil_SetPlaceholderPtr(1, gStringVar1);
        DynamicPlaceholderTextUtil_SetPlaceholderPtr(2, ItemId_GetName(r5[0]));
        if (r5[1] == 1)
            DynamicPlaceholderTextUtil_SetPlaceholderPtr(3, QuestLog_Text_JustOne);
        else
        {
            ConvertIntToDecimalStringN(gStringVar2, r5[1], STR_CONV_MODE_LEFT_ALIGN, 3);
            DynamicPlaceholderTextUtil_SetPlaceholderPtr(4, gStringVar2);
            DynamicPlaceholderTextUtil_ExpandPlaceholders(gStringVar3, QuestLog_Text_Num);
            DynamicPlaceholderTextUtil_SetPlaceholderPtr(3, gStringVar3);
        }
        DynamicPlaceholderTextUtil_ExpandPlaceholders(gStringVar4, QuestLog_Text_SoldNumOfItem);
    }
    else
    {
        DynamicPlaceholderTextUtil_SetPlaceholderPtr(0, gStringVar1);
        DynamicPlaceholderTextUtil_SetPlaceholderPtr(1, ItemId_GetName(r5[0]));
        ConvertIntToDecimalStringN(gStringVar2, r6, STR_CONV_MODE_LEFT_ALIGN, 6);
        DynamicPlaceholderTextUtil_SetPlaceholderPtr(2, gStringVar2);
        DynamicPlaceholderTextUtil_ExpandPlaceholders(gStringVar4, QuestLog_Text_SoldItemsIncludingItem);
    }
    return (const u16 *)(r7 + 2);
}

static u16 *BufferQuestLogData_ObtainedItem(u16 *a0, const u16 *eventData)
{
    a0 = sub_8113DE0(QL_EVENT_OBTAINED_ITEM, a0);
    if (a0 == NULL)
        return NULL;
    a0[0] = eventData[0];
    *((u8 *)a0 + 2) = *((const u8 *)eventData + 2);
    return a0 + 2;
}

static const u16 *BufferQuestLogText_ObtainedItem(const u16 *eventData)
{
    const u16 *r4 = sub_8113E88(QL_EVENT_OBTAINED_ITEM, eventData);
    const u8 *r5 = (const u8 *)r4 + 2;
    GetMapNameGeneric(gStringVar1, r5[0]);
    StringCopy(gStringVar2, ItemId_GetName(r4[0]));
    StringExpandPlaceholders(gStringVar4, QuestLog_Text_ObtainedItemInLocation);
    return (const u16 *)(r5 + 2);
}

static const u16 sQuestLogWorldMapFlags[] = 
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

void sub_8115748(u16 worldMapFlag)
{
    s32 i;

    if (gQuestLogState == 2 || gQuestLogState == 3)
        return;

    for (i = 0; i < (int)NELEMS(sQuestLogWorldMapFlags); i++)
    {
        if (worldMapFlag == sQuestLogWorldMapFlags[i])
        {
            if (!FlagGet(worldMapFlag))
            {
                gUnknown_203B049 = TRUE;
                break;
            }
            else
            {
                gUnknown_203B049 += 0;
                gUnknown_203B049 = FALSE;
                break;
            }
        }
    }
}

void sub_8115798(void)
{
    u16 sp0;
    if (gQuestLogState != 2 && gQuestLogState != 3)
    {
        if (gUnknown_203B049)
        {
            sp0 = gMapHeader.regionMapSectionId;
            SetQuestLogEvent(QL_EVENT_ARRIVED, &sp0);
            gUnknown_203B049 = FALSE;
        }
    }
}

static u16 *BufferQuestLogData_ArrivedInLocation(u16 *a0, const u16 *eventData)
{
    a0 = sub_8113DE0(QL_EVENT_ARRIVED, a0);
    if (a0 == NULL)
        return NULL;
    a0[0] = eventData[0];
    return a0 + 1;
}

static const u16 *BufferQuestLogText_ArrivedInLocation(const u16 *eventData)
{
    const u16 *r4 = sub_8113E88(QL_EVENT_ARRIVED, eventData);
    GetMapNameGeneric(gStringVar1, (u8)r4[0]);
    StringExpandPlaceholders(gStringVar4, QuestLog_Text_ArrivedInLocation);
    return r4 + 1;
}

static void BufferLinkPartnersName(u8 *dest)
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
