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

struct DeferredLinkEvent
{
    u16 id;
    u16 ALIGNED(4) data[14];
};

static EWRAM_DATA struct DeferredLinkEvent sDeferredEvent = {0};
EWRAM_DATA struct UnkStruct_203B044 gUnknown_203B044 = {0};
static EWRAM_DATA u8 sEventShouldNotRecordSteps = 0;
static EWRAM_DATA bool8 sNewlyEnteredMap = FALSE;
static EWRAM_DATA u8 sLastDepartedMap = 0;
static EWRAM_DATA bool8 sPlayedTheSlots = FALSE;

static bool8 InQuestLogDisabledLocation(void);
static bool8 ShouldRegisterEvent_HandlePartyActions(u16, const u16 *);
static bool8 ShouldRegisterEvent_HandleBeatStoryTrainer(u16, const u16 *);
static u16 *ShouldRegisterEvent(u16, const u16 *);
static bool8 TrySetLinkQuestLogEvent(u16, const u16 *);
static bool8 TrySetTrainerBattleQuestLogEvent(u16, const u16 *);
static bool8 IsQuestLogEventWithSpecialEncounterSpecies(u16, const u16 *);
static void SetQuestLogEventToActive(u16);
static u16 *TryRecordEvent41(u16 *, u16);
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
static bool8 ShouldRegisterEvent_HandleDeparted(u16, const u16 *);
static bool8 ShouldRegisterEvent_HandleGameCorner(u16, const u16 *);
static void BufferLinkPartnersName(u8 *);

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

    if (eventId == QL_EVENT_DEPARTED && sEventShouldNotRecordSteps == 2)
    {
        QL_EnableRecordingSteps();
        return;
    }
    QL_EnableRecordingSteps();
    if (gQuestLogState == QL_STATE_PLAYBACK)
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

    if (ShouldRegisterEvent_HandleGameCorner(eventId, eventData) == FALSE)
        return;

    if (gQuestLogPlaybackState == QL_PLAYBACK_STATE_0)
    {
        if (ShouldRegisterEvent_HandlePartyActions(eventId, eventData) == TRUE)
            return;

        if (eventId != QL_EVENT_DEFEATED_WILD_MON || gUnknown_203AE04 == NULL)
        {
            if (ShouldRegisterEvent_HandleDeparted(eventId, eventData) == FALSE)
                return;
            StartRecordingQuestLogEntry(eventId);
        }
    }
    else if (eventId == QL_EVENT_OBTAINED_ITEM)
        return;

    SetQuestLogEventToActive(eventId);
    if (eventId == QL_EVENT_DEFEATED_WILD_MON)
    {
        if (gUnknown_203AE04 == NULL)
        {
            gUnknown_203AE04 = sEventRecordingPointer;
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
        r1 = sQuestLogStorageCBs[eventId](sEventRecordingPointer, eventData);
    }

    if (r1 == NULL)
    {
        FinishRecordingQuestLogScene();
        r1 = ShouldRegisterEvent(eventId, eventData);
        if (r1 == NULL)
            return;
    }

    sEventRecordingPointer = r1;
    if (sEventShouldNotRecordSteps == 0)
        return;
    FinishRecordingQuestLogScene();
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

static bool8 ShouldRegisterEvent_HandlePartyActions(u16 eventId, const u16 *eventData)
{
    if (eventId == QL_EVENT_USED_FIELD_MOVE || eventId == QL_EVENT_USED_PKMN_CENTER)
        return TRUE;

    if (!FlagGet(FLAG_SYS_GAME_CLEAR))
    {
        if (eventId == QL_EVENT_SWITCHED_PARTY_ORDER || eventId == QL_EVENT_DEFEATED_WILD_MON || ShouldRegisterEvent_HandleBeatStoryTrainer(eventId, eventData) == TRUE)
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

static bool8 ShouldRegisterEvent_HandleBeatStoryTrainer(u16 eventId, const u16 *eventData)
{
    if (eventId == QL_EVENT_DEFEATED_TRAINER)
    {
        u8 trainerClass = gTrainers[*eventData].trainerClass;
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
    sEventShouldNotRecordSteps = 0;
}

static u16 *ShouldRegisterEvent(u16 eventId, const u16 *eventData)
{
    if (ShouldRegisterEvent_HandlePartyActions(eventId, eventData) == TRUE)
        return NULL;

    if (ShouldRegisterEvent_HandleDeparted(eventId, eventData) == FALSE)
        return NULL;

    StartRecordingQuestLogEntry(eventId);
    SetQuestLogEventToActive(eventId);

    if (eventId == QL_EVENT_DEFEATED_WILD_MON)
        gUnknown_203AE04 = sEventRecordingPointer;
    else
        gUnknown_203AE04 = NULL;

    return sQuestLogStorageCBs[eventId](sEventRecordingPointer, eventData);
}

static bool8 TrySetLinkQuestLogEvent(u16 eventId, const u16 *eventData)
{
    if (!IS_LINK_QL_EVENT(eventId))
        return FALSE;

    ResetDeferredLinkEvent();
    sDeferredEvent.id = eventId;

    if (eventId != QL_EVENT_USED_UNION_ROOM && eventId != QL_EVENT_USED_UNION_ROOM_CHAT)
    {
        if (eventId == QL_EVENT_LINK_TRADED || eventId == QL_EVENT_LINK_TRADED_UNION)
            memcpy(sDeferredEvent.data, eventData, 12);
        else
            memcpy(sDeferredEvent.data, eventData, 24);
    }
    return TRUE;
}

void ResetDeferredLinkEvent(void)
{
    sDeferredEvent = (struct DeferredLinkEvent){};
}

void QuestLog_StartRecordingInputsAfterDeferredEvent(void)
{
    if (sDeferredEvent.id != QL_EVENT_0)
    {
        u16 *resp;
        sLastDepartedMap = 0;
        StartRecordingQuestLogEntry(sDeferredEvent.id);
        resp = sQuestLogStorageCBs[sDeferredEvent.id](sEventRecordingPointer, sDeferredEvent.data);
        sEventRecordingPointer = resp;
        ResetDeferredLinkEvent();
    }
}

static bool8 TrySetTrainerBattleQuestLogEvent(u16 eventId, const u16 *eventData)
{
    if (eventId != QL_EVENT_DEFEATED_TRAINER
        && eventId != QL_EVENT_DEFEATED_GYM_LEADER
        && eventId != QL_EVENT_DEFEATED_E4_MEMBER
        && eventId != QL_EVENT_DEFEATED_CHAMPION)
        return FALSE;

    ResetDeferredLinkEvent();
    if (gQuestLogPlaybackState != QL_PLAYBACK_STATE_0 || FlagGet(FLAG_SYS_GAME_CLEAR) || ShouldRegisterEvent_HandleBeatStoryTrainer(eventId, eventData) != TRUE)
    {
        sDeferredEvent.id = eventId;
        memcpy(sDeferredEvent.data, eventData, 8);
    }
    return TRUE;
}

void QuestLogEvents_HandleEndTrainerBattle(void)
{
    if (sDeferredEvent.id != QL_EVENT_0)
    {
        u16 *resp;
        if (gQuestLogPlaybackState == QL_PLAYBACK_STATE_0)
        {
            sLastDepartedMap = 0;
            StartRecordingQuestLogEntry(sDeferredEvent.id);
        }
        SetQuestLogEventToActive(sDeferredEvent.id);
        resp = sQuestLogStorageCBs[sDeferredEvent.id](sEventRecordingPointer, sDeferredEvent.data);
        sEventRecordingPointer = resp;
        TryRecordEvent41_IncCursor(1);
        ResetDeferredLinkEvent();
        FinishRecordingQuestLogScene();
    }
}

void TryRecordEvent41_IncCursor(u16 a0)
{
    sEventRecordingPointer = TryRecordEvent41(sEventRecordingPointer, a0);
    sQuestLogCursor++;
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

u16 *QuestLog_SkipCommand(u16 *curPtr, u16 **prevPtr_p)
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

void sub_8113ABC(const u16 *a0)
{
    const u8 *r2 = (const u8 *)(a0 + 2);
    if ((a0[0] & 0xFFF) != QL_EVENT_DEPARTED)
        sLastDepartedMap = 0;
    else
        sLastDepartedMap = r2[1] + 1;
}

bool8 sub_8113AE8(const u16 *a0)
{
    const u16 *r0 = a0;

    if (a0 == NULL) // checks must be separate to match
        return FALSE;
    if (r0[1] > sQuestLogCursor)
        return FALSE;

    sQuestLogEventTextBufferCBs[(r0[0] & 0xFFF)](a0);
    gUnknown_203B044.id = r0[0];
    gUnknown_203B044.unk_1 = (r0[0] & 0xF000) >> 12;
    if (gUnknown_203B044.unk_1 != 0)
        gUnknown_203B044.unk_2 = 1;
    return TRUE;
}

bool8 sub_8113B44(const u16 *a0)
{
    if (gUnknown_203B044.unk_2 == 0)
        return FALSE;

    sQuestLogEventTextBufferCBs[gUnknown_203B044.id](a0);
    gUnknown_203B044.unk_2++;
    if (gUnknown_203B044.unk_2 > gUnknown_203B044.unk_1)
        ResetUnk203B044();
    return TRUE;
}

void ResetUnk203B044(void)
{
    gUnknown_203B044 = (struct UnkStruct_203B044){};
}

static void SetQuestLogEventToActive(u16 eventId)
{
    if (gUnknown_203B044.id != (u8)eventId || gUnknown_203B044.unk_2 != sQuestLogCursor)
    {
        gUnknown_203B044.id = eventId;
        gUnknown_203B044.unk_1 = 0;
        gUnknown_203B044.unk_2 = sQuestLogCursor;
    }
    else if (gUnknown_203B044.unk_1 < 5)
        gUnknown_203B044.unk_1++;
}

void sub_8113BD8(void)
{
    sNewlyEnteredMap = FALSE;
    sLastDepartedMap = 0;
    sPlayedTheSlots = FALSE;
}

u16 *TryRecordEvent39_NoParams(u16 *a0)
{
    if (!WillCommandOfSizeFitInSav1Record(a0, sQuestLogEventCmdSizes[QL_EVENT_39]))
        return NULL;
    a0[0] = QL_EVENT_39;
    return a0 + 1;
}

u16 *sub_8113C20(u16 *a0, struct QuestLogEntry * a1)
{
    if (!WillCommandOfSizeFitInSav1Record(a0, sQuestLogEventCmdSizes[QL_EVENT_39]))
        return NULL;
    a1->command = 0xFF;
    a1->duration = 0;
    a1->localId = 0;
    a1->mapNum = 0;
    a1->mapGroup = 0;
    a1->animId = 0;
    return a0 + 1;
}

static u16 *TryRecordEvent41(u16 *a0, u16 a1)
{
    if (!WillCommandOfSizeFitInSav1Record(a0, sQuestLogEventCmdSizes[QL_EVENT_41]))
        return NULL;
    a0[0] = QL_EVENT_41;
    a0[1] = a1;
    return a0 + 2;
}

u16 *sub_8113C8C(u16 *a0, struct QuestLogEntry * a1)
{
    if (!WillCommandOfSizeFitInSav1Record(a0, sQuestLogEventCmdSizes[QL_EVENT_41]))
        return NULL;
    a1->command = 0xFE;
    a1->duration = a0[1];
    a1->localId = 0;
    a1->mapNum = 0;
    a1->mapGroup = 0;
    a1->animId = 0;
    return a0 + 2;
}

u16 *sub_8113CC8(u16 *a0, struct QuestLogEntry * a1)
{
    u8 *r6 = (u8 *)a0 + 4;

    if (!WillCommandOfSizeFitInSav1Record(a0, sQuestLogEventCmdSizes[QL_EVENT_0]))
        return NULL;
    a0[0] = 0;
    a0[1] = a1->duration;
    r6[0] = a1->localId;
    r6[1] = a1->mapNum;
    r6[2] = a1->mapGroup;
    r6[3] = a1->animId;
    return (u16 *)(r6 + 4);
}

u16 *sub_8113D08(u16 *a0, struct QuestLogEntry * a1)
{
    u8 *r6 = (u8 *)a0 + 4;

    if (!WillCommandOfSizeFitInSav1Record(a0, sQuestLogEventCmdSizes[QL_EVENT_0]))
        return NULL;
    a1->command = 2;
    a1->duration = a0[1];
    a1->localId = r6[0];
    a1->mapNum = r6[1];
    a1->mapGroup = r6[2];
    a1->animId = r6[3];
    return (u16 *)(r6 + 4);
}

u16 *sub_8113D48(u16 *a0, struct QuestLogEntry * a1)
{
    u16 *r4 = a0;
    u8 *r6 = (u8 *)a0 + 4;

    if (!WillCommandOfSizeFitInSav1Record(r4, sQuestLogEventCmdSizes[QL_EVENT_2]))
        return NULL;
    if (a1->command == 0)
        r4[0] = 2;
    else
        r4[0] = 1;
    r4[1] = a1->duration;
    r6[0] = a1->localId;
    r6[1] = a1->mapNum;
    r6[2] = a1->mapGroup;
    r6[3] = a1->animId;
    return (u16 *)(r6 + 4);
}

u16 *sub_8113D94(u16 *a0, struct QuestLogEntry * a1)
{
    u16 *r5 = a0;
    u8 *r6 = (u8 *)a0 + 4;

    if (!WillCommandOfSizeFitInSav1Record(r5, sQuestLogEventCmdSizes[QL_EVENT_2]))
        return NULL;
    if (r5[0] == 2)
        a1->command = 0;
    else
        a1->command = 1;
    a1->duration = r5[1];
    a1->localId = r6[0];
    a1->mapNum = r6[1];
    a1->mapGroup = r6[2];
    a1->animId = r6[3];
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
    r5[1] = sQuestLogCursor;
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
    StringExpandPlaceholders(gStringVar4, gText_QuestLog_SwitchMon1WithMon2);
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
        sEventShouldNotRecordSteps = 2;

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
            StringExpandPlaceholders(gStringVar4, gText_QuestLog_UsedEscapeRope);
        }
        else if (r5[1] != 0xFFFF)
        {
            QuestLog_GetSpeciesName(r5[1], gStringVar2, 0);
            StringExpandPlaceholders(gStringVar4, gText_QuestLog_UsedItemOnMonAtThisLocation);
        }
        else
        {
            StringExpandPlaceholders(gStringVar4, gText_QuestLog_UsedTheItem);
        }
        break;
    case POCKET_KEY_ITEMS:
        StringCopy(gStringVar1, ItemId_GetName(r5[0]));
        StringExpandPlaceholders(gStringVar4, gText_QuestLog_UsedTheKeyItem);
        break;
    case POCKET_TM_CASE:
        QuestLog_GetSpeciesName(r5[1], gStringVar1, 0);
        StringCopy(gStringVar2, gMoveNames[ItemIdToBattleMoveId(r5[0])]);
        if (r5[2] != 0xFFFF)
        {
            StringCopy(gStringVar3, gMoveNames[r5[2]]);
            if (r5[0] > ITEM_TM50)
                StringExpandPlaceholders(gStringVar4, gText_QuestLog_MonReplacedMoveWithHM);
            else
                StringExpandPlaceholders(gStringVar4, gText_QuestLog_MonReplacedMoveWithTM);
        }
        else
        {
            if (r5[0] > ITEM_TM50)
                StringExpandPlaceholders(gStringVar4, gText_QuestLog_MonLearnedMoveFromHM);
            else
                StringExpandPlaceholders(gStringVar4, gText_QuestLog_MonLearnedMoveFromTM);
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
    StringExpandPlaceholders(gStringVar4, gText_QuestLog_GaveMonHeldItem);
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
    StringExpandPlaceholders(gStringVar4, gText_QuestLog_GaveMonHeldItem2);
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
    StringExpandPlaceholders(gStringVar4, gText_QuestLog_GaveMonHeldItemFromPC);
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
    StringExpandPlaceholders(gStringVar4, gText_QuestLog_TookHeldItemFromMon);
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
    StringExpandPlaceholders(gStringVar4, gText_QuestLog_SwappedHeldItemsOnMon);
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
    StringExpandPlaceholders(gStringVar4, gText_QuestLog_SwappedHeldItemFromPC);
    r4 += 3;
    return r4;
}

static u16 *BufferQuestLogData_UsedPkmnCenter(u16 *a0, const u16 *eventData)
{
    u16 *r4 = a0;
    if (gUnknown_203B044.id == QL_EVENT_USED_PKMN_CENTER && gUnknown_203B044.unk_1 != 0)
        return r4;

    if (!sub_8110944(a0, sQuestLogEventCmdSizes[QL_EVENT_USED_PKMN_CENTER]))
        return NULL;

    r4[0] = QL_EVENT_USED_PKMN_CENTER;
    r4[1] = sQuestLogCursor;
    return r4 + 2;
}

static const u16 *BufferQuestLogText_UsedPkmnCenter(const u16 *a0)
{
    StringExpandPlaceholders(gStringVar4, gText_QuestLog_MonsWereFullyRestoredAtCenter);
    a0 += 2;
    return a0;
}

static u16 *BufferQuestLogData_LinkTraded(u16 *a0, const u16 *eventData)
{
    u16 *r4 = a0 + 4;

    a0[0] = QL_EVENT_LINK_TRADED;
    a0[1] = sQuestLogCursor;
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
    StringExpandPlaceholders(gStringVar4, gText_QuestLog_TradedMon1ForPersonsMon2);
    r6 += 4;
    return r6;
}

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
    gText_QuestLog_Win,
    gText_QuestLog_Loss,
    gText_QuestLog_Draw
};

static u16 *BufferQuestLogData_LinkBattledSingle(u16 *a0, const u16 *eventData)
{
    a0[0] = QL_EVENT_LINK_BATTLED_SINGLE;
    a0[1] = sQuestLogCursor;
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
    DynamicPlaceholderTextUtil_ExpandPlaceholders(gStringVar4, gText_QuestLog_SingleBattleWithPersonResultedInOutcome);
    a0 += 6;
    return a0;
}

static u16 *BufferQuestLogData_LinkBattledDouble(u16 *a0, const u16 *eventData)
{
    a0[0] = QL_EVENT_LINK_BATTLED_DOUBLE;
    a0[1] = sQuestLogCursor;
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
    DynamicPlaceholderTextUtil_ExpandPlaceholders(gStringVar4, gText_QuestLog_DoubleBattleWithPersonResultedInOutcome);
    a0 += 6;
    return a0;
}

static u16 *BufferQuestLogData_LinkBattledMulti(u16 *a0, const u16 *eventData)
{
    a0[0] = QL_EVENT_LINK_BATTLED_MULTI;
    a0[1] = sQuestLogCursor;
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
    StringCopy_PlayerName(gStringVar1, (const u8 *)a0 +  5);
    StringCopy_PlayerName(gStringVar2, (const u8 *)a0 + 12);
    StringCopy_PlayerName(gStringVar3, (const u8 *)a0 + 19);
    BufferLinkPartnersName(gStringVar1);
    BufferLinkPartnersName(gStringVar2);
    BufferLinkPartnersName(gStringVar3);
    DynamicPlaceholderTextUtil_SetPlaceholderPtr(0, gSaveBlock2Ptr->playerName);
    DynamicPlaceholderTextUtil_SetPlaceholderPtr(1, gStringVar1); // partner
    DynamicPlaceholderTextUtil_SetPlaceholderPtr(2, gStringVar2); // opponent 1
    DynamicPlaceholderTextUtil_SetPlaceholderPtr(3, gStringVar3); // opponent 2
    DynamicPlaceholderTextUtil_SetPlaceholderPtr(4, sBattleOutcomeTexts[((const u8 *)a0)[4]]);
    DynamicPlaceholderTextUtil_ExpandPlaceholders(gStringVar4, gText_QuestLog_MultiBattleWithPeopleResultedInOutcome);
    a0 += 13;
    return a0;
}

static u16 *BufferQuestLogData_UsedUnionRoom(u16 *a0, const u16 *eventData)
{
    a0[0] = QL_EVENT_USED_UNION_ROOM;
    a0[1] = sQuestLogCursor;
    return a0 + 2;
}

static const u16 *BufferQuestLogText_UsedUnionRoom(const u16 *a0)
{
    StringExpandPlaceholders(gStringVar4, gText_QuestLog_MingledInUnionRoom);
    a0 += 2;
    return a0;
}

static u16 *BufferQuestLogData_UsedUnionRoomChat(u16 *a0, const u16 *eventData)
{
    a0[0] = QL_EVENT_USED_UNION_ROOM_CHAT;
    a0[1] = sQuestLogCursor;
    return a0 + 2;
}

static const u16 *BufferQuestLogText_UsedUnionRoomChat(const u16 *a0)
{
    StringExpandPlaceholders(gStringVar4, gText_QuestLog_ChattedWithManyTrainers);
    a0 += 2;
    return a0;
}

static u16 *BufferQuestLogData_LinkTradedUnionRoom(u16 *a0, const u16 *eventData)
{
    u8 *r4 = (u8 *)(a0 + 4);
    a0[0] = QL_EVENT_LINK_TRADED_UNION;
    a0[1] = sQuestLogCursor;
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
    StringExpandPlaceholders(gStringVar4, gText_QuestLog_TradedMon1ForTrainersMon2);
    r6 += 8;
    return (const u16 *)r6;
}

static u16 *BufferQuestLogData_LinkBattledUnionRoom(u16 *a0, const u16 *eventData)
{
    a0[0] = QL_EVENT_LINK_BATTLED_UNION;
    a0[1] = sQuestLogCursor;
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
    StringExpandPlaceholders(gStringVar4, gText_QuestLog_BattledTrainerEndedInOutcome);
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
    DynamicPlaceholderTextUtil_ExpandPlaceholders(gStringVar4, gText_QuestLog_SwitchedMonsBetweenBoxes);
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
    DynamicPlaceholderTextUtil_ExpandPlaceholders(gStringVar4, gText_QuestLog_SwitchedMonsWithinBox);
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
    DynamicPlaceholderTextUtil_ExpandPlaceholders(gStringVar4, gText_QuestLog_SwitchedPartyMonForPCMon);
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
    DynamicPlaceholderTextUtil_ExpandPlaceholders(gStringVar4, gText_QuestLog_MovedMonToNewBox);
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
    DynamicPlaceholderTextUtil_ExpandPlaceholders(gStringVar4, gText_QuestLog_MovedMonWithinBox);
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
    DynamicPlaceholderTextUtil_ExpandPlaceholders(gStringVar4, gText_QuestLog_WithdrewMonFromPC);
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
    DynamicPlaceholderTextUtil_ExpandPlaceholders(gStringVar4, gText_QuestLog_DepositedMonInPC);
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
        DynamicPlaceholderTextUtil_SetPlaceholderPtr(1, gText_QuestLog_ADifferentSpot);
    else
        DynamicPlaceholderTextUtil_SetPlaceholderPtr(1, GetBoxNamePtr(*((const u8 *)r4 + 1)));
    DynamicPlaceholderTextUtil_ExpandPlaceholders(gStringVar4, gText_QuestLog_SwitchedMultipleMons);
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
    StringExpandPlaceholders(gStringVar4, gText_QuestLog_StoredItemInPC);
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
    StringExpandPlaceholders(gStringVar4, gText_QuestLog_WithdrewItemFromPC);
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
    sEventShouldNotRecordSteps = 1;
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
    DynamicPlaceholderTextUtil_ExpandPlaceholders(gStringVar4, gText_QuestLog_TookOnGymLeadersMonWithMonAndWon);
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
        r4[1] = sQuestLogCursor;
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

static u16 *BufferQuestLogData_DefeatedEliteFourMember(u16 *a0, const u16 *eventData)
{
    sEventShouldNotRecordSteps = 1;
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
    DynamicPlaceholderTextUtil_ExpandPlaceholders(gStringVar4, gText_QuestLog_TookOnEliteFoursMonWithMonAndWon);
    return eventData + 4;
}

static u16 *BufferQuestLogData_DefeatedChampion(u16 *a0, const u16 *eventData)
{
    if (!sub_8110944(a0, sQuestLogEventCmdSizes[QL_EVENT_DEFEATED_CHAMPION]))
        return NULL;
    a0[0] = QL_EVENT_DEFEATED_CHAMPION | (2 << 12);
    a0[1] = sQuestLogCursor;
    a0[2] = eventData[1];
    a0[3] = eventData[2];
    *((u8 *)a0 + 8) = *((const u8 *)eventData + 6);
    sEventShouldNotRecordSteps = 1;
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

static u16 *BufferQuestLogData_DefeatedTrainer(u16 *a0, const u16 *eventData)
{
    sEventShouldNotRecordSteps = 1;
    return BufferQuestLogData_DefeatedTrainer_(QL_EVENT_DEFEATED_TRAINER, a0, eventData);
}

static const u16 *BufferQuestLogText_DefeatedTrainer(const u16 *eventData)
{
    const u16 *r5 = sub_8113E88(QL_EVENT_DEFEATED_TRAINER, eventData);
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

static const u8 sGymCityMapSecs[] = {
    MAPSEC_PEWTER_CITY,
    MAPSEC_CERULEAN_CITY,
    MAPSEC_VERMILION_CITY,
    MAPSEC_CELADON_CITY,
    MAPSEC_FUCHSIA_CITY,
    MAPSEC_SAFFRON_CITY,
    MAPSEC_CINNABAR_ISLAND,
    MAPSEC_VIRIDIAN_CITY
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

static u16 *BufferQuestLogData_DepartedLocation(u16 *a0, const u16 *eventData)
{
    u16 *r2 = sub_8113DE0(QL_EVENT_DEPARTED, a0);
    if (r2 == NULL)
        return NULL;
    *((u8 *)r2 + 0) = *((const u8 *)eventData + 0);
    if ((*((u8 *)r2 + 1) = *((const u8 *)eventData + 1)) == QL_LOCATION_SAFARI_ZONE)
        sEventShouldNotRecordSteps = 1;
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
        for (r4 = 0; r4 < NELEMS(sGymCityMapSecs); r4++)
        {
            if (r5_2[0] != sGymCityMapSecs[r4])
                continue;
            if (FlagGet(FLAG_BADGE01_GET + r4) == TRUE)
                StringExpandPlaceholders(gStringVar4, gText_QuestLog_DepartedGym);
            else
                StringExpandPlaceholders(gStringVar4, gText_QuestLog_GymWasFullOfToughTrainers);
            break;
        }
        if (r4 == 8)
            StringExpandPlaceholders(gStringVar4, sDepartedLocationTexts[sLocationToDepartedTextId[locationId]]);
    }
    else
        StringExpandPlaceholders(gStringVar4, sDepartedLocationTexts[sLocationToDepartedTextId[locationId]]);

    return (const u16 *)(r5_2 + 2);
}

void SetQLPlayedTheSlots(void)
{
    sPlayedTheSlots = TRUE;
}

static bool8 ShouldRegisterEvent_HandleDeparted(u16 eventId, const u16 *eventData)
{
    if (eventId != QL_EVENT_DEPARTED)
    {
        sLastDepartedMap = 0;
        return TRUE;
    }
    if (sLastDepartedMap == *((u8 *)eventData + 1) + 1)
        return FALSE;
    sLastDepartedMap = *((u8 *)eventData + 1) + 1;
    return TRUE;
}

static bool8 ShouldRegisterEvent_HandleGameCorner(u16 eventId, const u16 *eventData)
{
    if (eventId != QL_EVENT_DEPARTED)
        return TRUE;

    // Bug: should be QL_LOCATION_GAME_CORNER + 1
    if (*((u8 *)eventData + 1) == QL_LOCATION_GAME_CORNER && !sPlayedTheSlots)
        return FALSE;

    sPlayedTheSlots = FALSE;
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
        sEventShouldNotRecordSteps = 2;
    else
        sEventShouldNotRecordSteps = 1;
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
            StringCopy(gStringVar3, gText_QuestLog_Home);
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
        DynamicPlaceholderTextUtil_ExpandPlaceholders(gStringVar4, gText_QuestLog_BoughtItem);
    else
    {
        ConvertIntToDecimalStringN(gStringVar2, r6, STR_CONV_MODE_LEFT_ALIGN, 6);
        DynamicPlaceholderTextUtil_SetPlaceholderPtr(2, gStringVar2);
        DynamicPlaceholderTextUtil_ExpandPlaceholders(gStringVar4, gText_QuestLog_BoughtItemsIncludingItem);
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
    StringExpandPlaceholders(gStringVar4, gText_QuestLog_ObtainedItemInLocation);
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

void QuestLog_RecordEnteredMap(u16 worldMapFlag)
{
    s32 i;

    if (QL_IS_PLAYBACK_STATE)
        return;

    for (i = 0; i < (int)NELEMS(sQuestLogWorldMapFlags); i++)
    {
        if (worldMapFlag == sQuestLogWorldMapFlags[i])
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

void sub_8115798(void)
{
    u16 sp0;
    if (!QL_IS_PLAYBACK_STATE)
    {
        if (sNewlyEnteredMap)
        {
            sp0 = gMapHeader.regionMapSectionId;
            SetQuestLogEvent(QL_EVENT_ARRIVED, &sp0);
            sNewlyEnteredMap = FALSE;
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
    StringExpandPlaceholders(gStringVar4, gText_QuestLog_ArrivedInLocation);
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
