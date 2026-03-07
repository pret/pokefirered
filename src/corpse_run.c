#include "global.h"
#include "corpse_run.h"

#include "event_data.h"
#include "event_object_movement.h"
#include "field_player_avatar.h"
#include "fieldmap.h"
#include "heal_location.h"
#include "overworld.h"
#include "pokemon.h"
#include "pokemon_storage_system.h"
#include "money.h"
#include "souls_hud.h"
#include "battle.h"
#include "battle_setup.h"
#include "safari_zone.h"
#include "field_fadetransition.h"

#include "constants/battle_setup.h"
#include "constants/event_object_movement.h"
#include "constants/event_objects.h"
#include "constants/maps.h"
#include "constants/opponents.h"
#include "constants/trainers.h"

#define CORPSE_RUN_PAYLOAD_OFFSET offsetof(struct CorpseRunSaveData, state)
#define CORPSE_RUN_MAX_PARTY_COUNT PARTY_SIZE
#define CORPSE_RUN_RECOVERY_HP_PERCENT 33
#define CORPSE_RUN_TRAINER_HP_BASE 40
#define CORPSE_RUN_TRAINER_HP_PER_BADGE 8
#define CORPSE_RUN_TRAINER_HP_MIN 40
#define CORPSE_RUN_TRAINER_HP_MAX 120
#define CORPSE_RUN_TRAINER_DAMAGE_BASE 6
#define CORPSE_RUN_TRAINER_DAMAGE_CAP 20
#define CORPSE_RUN_MARKER_LOCAL_ID 0xFE
#define CORPSE_RUN_MARKER_GFX_ID OBJ_EVENT_GFX_SIGN
#define CORPSE_RUN_STASH_VALID_INDEX 0
#define CORPSE_RUN_STASH_COUNT_INDEX 1
#define CORPSE_RUN_STASH_DATA_START 2

STATIC_ASSERT(sizeof(struct CorpseRunSaveData) == 400, CorpseRunSaveDataSize);


static const u16 sSalvageBadgeFlagIds[] =
{
    FLAG_BADGE01_GET,
    FLAG_BADGE02_GET,
    FLAG_BADGE03_GET,
    FLAG_BADGE04_GET,
    FLAG_BADGE05_GET,
    FLAG_BADGE06_GET,
    FLAG_BADGE07_GET,
    FLAG_BADGE08_GET,
};

static const u8 sGymAceLevelByBadgeCount[] =
{
    14, 21, 24, 29, 43, 43, 47, 50, 55
};

#define ELITE_FOUR_1_ACE_LEVEL 56

static u8 CorpseRun_GetBadgeCount(void);
static void CorpseRun_SyncVisibleMarkerObject(void);
static bool8 CorpseRun_IsPlayerAtOrFacingMarker(void);
static void CorpseRun_ClearPartyStashMetadata(void);

static bool8 CorpseRun_IsMapInSalvageSafariScope(u8 mapGroup, u8 mapNum)
{
    u16 i;
    static const u16 sValidSalvageMaps[] =
    {
        MAP_FUCHSIA_CITY_SAFARI_ZONE_ENTRANCE,
        MAP_SAFARI_ZONE_CENTER,
        MAP_SAFARI_ZONE_EAST,
        MAP_SAFARI_ZONE_NORTH,
        MAP_SAFARI_ZONE_WEST,
        MAP_SAFARI_ZONE_CENTER_REST_HOUSE,
        MAP_SAFARI_ZONE_EAST_REST_HOUSE,
        MAP_SAFARI_ZONE_NORTH_REST_HOUSE,
        MAP_SAFARI_ZONE_WEST_REST_HOUSE,
        MAP_SAFARI_ZONE_SECRET_HOUSE,
    };

    for (i = 0; i < NELEMS(sValidSalvageMaps); i++)
    {
        if (mapGroup == MAP_GROUP(sValidSalvageMaps[i]) && mapNum == MAP_NUM(sValidSalvageMaps[i]))
            return TRUE;
    }

    return FALSE;
}


static void CorpseRun_EnsureValidLastHealLocation(void)
{
    if (GetHealLocationIndexFromMapGroupAndNum(gSaveBlock1Ptr->lastHealLocation.mapGroup, gSaveBlock1Ptr->lastHealLocation.mapNum) != 0)
        return;

    gSaveBlock1Ptr->lastHealLocation.mapGroup = MAP_GROUP(MAP_PALLET_TOWN);
    gSaveBlock1Ptr->lastHealLocation.mapNum = MAP_NUM(MAP_PALLET_TOWN);
    gSaveBlock1Ptr->lastHealLocation.x = 6;
    gSaveBlock1Ptr->lastHealLocation.y = 8;
}

static void CorpseRun_WarpToMap(u16 map, s8 x, s8 y)
{
    SetWarpDestination(MAP_GROUP(map), MAP_NUM(map), WARP_ID_NONE, x, y);
    WarpIntoMap();
    gFieldCallback = FieldCB_WarpExitFadeFromBlack;
    SetMainCallback2(CB2_LoadMap);
}

static void CorpseRun_WarpToLastCenter(void)
{
    CorpseRun_EnsureValidLastHealLocation();
    SetWarpDestinationToLastHealLocation();
    WarpIntoMap();
    gFieldCallback = FieldCB_WarpExitFadeFromBlack;
    SetMainCallback2(CB2_LoadMap);
}

static void CorpseRun_InitSalvageRespawnCheckpoint(void)
{
    CorpseRun_EnsureValidLastHealLocation();
    gSaveBlock1Ptr->corpseRun.respawnMapId = (gSaveBlock1Ptr->lastHealLocation.mapGroup << 8) | gSaveBlock1Ptr->lastHealLocation.mapNum;
    gSaveBlock1Ptr->corpseRun.respawnX = gSaveBlock1Ptr->lastHealLocation.x;
    gSaveBlock1Ptr->corpseRun.respawnY = gSaveBlock1Ptr->lastHealLocation.y;
}

static void CorpseRun_ReconcileSalvageRuntimeState(void)
{
    if (gSaveBlock1Ptr->corpseRun.salvageBallsRemaining == 0)
        gSaveBlock1Ptr->corpseRun.salvageBallsRemaining = 30;

    SetSafariZoneFlag();
    gNumSafariBalls = gSaveBlock1Ptr->corpseRun.salvageBallsRemaining;
    if (gSafariZoneStepCounter == 0)
        gSafariZoneStepCounter = 600;
}

static void CorpseRun_ForceSalvageExitAndClear(void)
{
    ExitSafariMode();
    gSaveBlock1Ptr->corpseRun.salvageActive = FALSE;
    gSaveBlock1Ptr->corpseRun.salvageBallsRemaining = 0;
    gSaveBlock1Ptr->corpseRun.salvageCatchConsumed = FALSE;
    CorpseRun_WarpToLastCenter();
}

static bool8 CorpseRun_IsCriticalScriptedTrainer(u16 trainerId)
{
    // These story-gated opponents should never use the "escape" trainer path.
    // Defeats against them are always resolved by normal corpse-run persistence.
    switch (trainerId)
    {
    case TRAINER_RIVAL_OAKS_LAB_SQUIRTLE:
    case TRAINER_RIVAL_OAKS_LAB_BULBASAUR:
    case TRAINER_RIVAL_OAKS_LAB_CHARMANDER:
    case TRAINER_RIVAL_ROUTE22_EARLY_SQUIRTLE:
    case TRAINER_RIVAL_ROUTE22_EARLY_BULBASAUR:
    case TRAINER_RIVAL_ROUTE22_EARLY_CHARMANDER:
    case TRAINER_RIVAL_CERULEAN_SQUIRTLE:
    case TRAINER_RIVAL_CERULEAN_BULBASAUR:
    case TRAINER_RIVAL_CERULEAN_CHARMANDER:
    case TRAINER_RIVAL_SS_ANNE_SQUIRTLE:
    case TRAINER_RIVAL_SS_ANNE_BULBASAUR:
    case TRAINER_RIVAL_SS_ANNE_CHARMANDER:
    case TRAINER_RIVAL_POKEMON_TOWER_SQUIRTLE:
    case TRAINER_RIVAL_POKEMON_TOWER_BULBASAUR:
    case TRAINER_RIVAL_POKEMON_TOWER_CHARMANDER:
    case TRAINER_RIVAL_SILPH_SQUIRTLE:
    case TRAINER_RIVAL_SILPH_BULBASAUR:
    case TRAINER_RIVAL_SILPH_CHARMANDER:
    case TRAINER_RIVAL_ROUTE22_LATE_SQUIRTLE:
    case TRAINER_RIVAL_ROUTE22_LATE_BULBASAUR:
    case TRAINER_RIVAL_ROUTE22_LATE_CHARMANDER:
    case TRAINER_CHAMPION_FIRST_SQUIRTLE:
    case TRAINER_CHAMPION_FIRST_BULBASAUR:
    case TRAINER_CHAMPION_FIRST_CHARMANDER:
    case TRAINER_TEAM_ROCKET_ADMIN:
    case TRAINER_TEAM_ROCKET_ADMIN_2:
    case TRAINER_BOSS_GIOVANNI:
    case TRAINER_BOSS_GIOVANNI_2:
    case TRAINER_LEADER_GIOVANNI:
        return TRUE;
    default:
        return FALSE;
    }
}

static bool8 CorpseRun_IsBlockedTrainerClass(u8 trainerClass)
{
    // High-priority trainer archetypes that should always advance corpse-run state
    // on defeat: gym leaders, bosses, rivals, Elite Four, and Champion.
    switch (trainerClass)
    {
    case TRAINER_CLASS_LEADER:
    case TRAINER_CLASS_BOSS:
    case TRAINER_CLASS_RIVAL_EARLY:
    case TRAINER_CLASS_RIVAL_LATE:
    case TRAINER_CLASS_ELITE_FOUR:
    case TRAINER_CLASS_CHAMPION:
        return TRUE;
    default:
        return FALSE;
    }
}

static bool8 CorpseRun_IsValidTransition(u8 from, u8 to)
{
    switch (from)
    {
    case CR_OFF:
        return to == CR_ACTIVE;
    case CR_ACTIVE:
        return to == CR_RECOVERED || to == CR_FAILED;
    case CR_RECOVERED:
    case CR_FAILED:
        return to == CR_OFF || to == CR_ACTIVE;
    default:
        return FALSE;
    }
}

static u16 CorpseRun_CalculateChecksum(const void *data, u16 size)
{
    u16 i;
    u32 checksum = 0;
    const u8 *cursor = data;

    for (i = 0; i < (size / 4); i++)
    {
        checksum += *(const u32 *)cursor;
        cursor += 4;
    }

    return ((checksum >> 16) + checksum);
}

static u16 CorpseRun_CalcPayloadChecksum(const struct CorpseRunSaveData *save)
{
    struct CorpseRunSaveData copy = *save;

    copy.payloadChecksum = 0;
    return CorpseRun_CalculateChecksum((const void *)&copy.state, copy.payloadLength);
}

static bool8 CorpseRun_IsExpectedPayloadLength(u16 payloadLength)
{
    return payloadLength == sizeof(struct CorpseRunSaveData) - CORPSE_RUN_PAYLOAD_OFFSET;
}

static bool8 CorpseRun_IsMarkerMetadataSane(const struct CorpseRunSaveData *save)
{
    if (!save->markerSpawned)
        return TRUE;

    if (save->markerMapGroup == MAP_GROUP(MAP_UNDEFINED) || save->markerMapNum == MAP_NUM(MAP_UNDEFINED))
        return FALSE;

    return TRUE;
}

static bool8 CorpseRun_IsPartyPayloadSane(const struct CorpseRunSaveData *save)
{
    return save->partyCount <= CORPSE_RUN_MAX_PARTY_COUNT;
}

static bool8 CorpseRun_IsSchemaValid(const struct CorpseRunSaveData *save)
{
    if (save->magic != CORPSE_RUN_SAVE_MAGIC)
        return FALSE;
    if (save->version != CORPSE_RUN_SAVE_VERSION)
        return FALSE;
    if (!CorpseRun_IsExpectedPayloadLength(save->payloadLength))
        return FALSE;
    if (save->payloadChecksum != CorpseRun_CalcPayloadChecksum(save))
        return FALSE;
    if (save->state > CR_FAILED)
        return FALSE;
    if (!CorpseRun_IsPartyPayloadSane(save))
        return FALSE;
    if (!CorpseRun_IsMarkerMetadataSane(save))
        return FALSE;

    return TRUE;
}

static void CorpseRun_FinalizeForSave(void)
{
    gSaveBlock1Ptr->corpseRun.magic = CORPSE_RUN_SAVE_MAGIC;
    gSaveBlock1Ptr->corpseRun.version = CORPSE_RUN_SAVE_VERSION;
    gSaveBlock1Ptr->corpseRun.payloadLength = sizeof(struct CorpseRunSaveData) - CORPSE_RUN_PAYLOAD_OFFSET;
    gSaveBlock1Ptr->corpseRun.payloadChecksum = CorpseRun_CalcPayloadChecksum(&gSaveBlock1Ptr->corpseRun);
}

static void CorpseRun_DespawnMarker(void)
{
    gSaveBlock1Ptr->corpseRun.markerSpawned = FALSE;
    gSaveBlock1Ptr->corpseRun.markerMapGroup = 0;
    gSaveBlock1Ptr->corpseRun.markerMapNum = 0;
    gSaveBlock1Ptr->corpseRun.markerX = 0;
    gSaveBlock1Ptr->corpseRun.markerY = 0;
    gSaveBlock1Ptr->corpseRun.markerElevation = 0;
    gSaveBlock1Ptr->corpseRun.markerStyle = 0;
    gSaveBlock1Ptr->corpseRun.markerMapSection = 0;
    RemoveObjectEventByLocalIdAndMap(CORPSE_RUN_MARKER_LOCAL_ID, gSaveBlock1Ptr->location.mapNum, gSaveBlock1Ptr->location.mapGroup);
}

static void CorpseRun_SyncVisibleMarkerObject(void)
{
    RemoveObjectEventByLocalIdAndMap(CORPSE_RUN_MARKER_LOCAL_ID, gSaveBlock1Ptr->location.mapNum, gSaveBlock1Ptr->location.mapGroup);

    if (gSaveBlock1Ptr->corpseRun.state != CR_ACTIVE || !gSaveBlock1Ptr->corpseRun.markerSpawned)
        return;

    if (gSaveBlock1Ptr->location.mapGroup != gSaveBlock1Ptr->corpseRun.markerMapGroup
     || gSaveBlock1Ptr->location.mapNum != gSaveBlock1Ptr->corpseRun.markerMapNum)
        return;

    SpawnSpecialObjectEventParameterized(
        CORPSE_RUN_MARKER_GFX_ID,
        MOVEMENT_TYPE_FACE_DOWN,
        CORPSE_RUN_MARKER_LOCAL_ID,
        gSaveBlock1Ptr->corpseRun.markerX + MAP_OFFSET,
        gSaveBlock1Ptr->corpseRun.markerY + MAP_OFFSET,
        MapGridGetElevationAt(gSaveBlock1Ptr->corpseRun.markerX, gSaveBlock1Ptr->corpseRun.markerY));
}

static bool8 CorpseRun_IsPlayerAtOrFacingMarker(void)
{
    s16 facingX;
    s16 facingY;

    if (gSaveBlock1Ptr->pos.x == gSaveBlock1Ptr->corpseRun.markerX
     && gSaveBlock1Ptr->pos.y == gSaveBlock1Ptr->corpseRun.markerY)
        return TRUE;

    // Corpse marker coordinates are stored in saveblock map-space (camera origin),
    // so derive facing coordinates from the same space for consistent comparisons.
    facingX = gSaveBlock1Ptr->pos.x;
    facingY = gSaveBlock1Ptr->pos.y;
    MoveCoords(GetPlayerFacingDirection(), &facingX, &facingY);
    if (facingX == gSaveBlock1Ptr->corpseRun.markerX
     && facingY == gSaveBlock1Ptr->corpseRun.markerY)
        return TRUE;

    return FALSE;
}

static void CorpseRun_SetState(u8 newState)
{
    u8 oldState = gSaveBlock1Ptr->corpseRun.state;

    if (!CorpseRun_IsValidTransition(oldState, newState))
        return;

    gSaveBlock1Ptr->corpseRun.state = newState;

    switch (newState)
    {
    case CR_ACTIVE:
        gSaveBlock1Ptr->corpseRun.rewardSuppressed = TRUE;
        gSaveBlock1Ptr->corpseRun.trainerOverride = TRUE;
        break;
    case CR_RECOVERED:
    case CR_FAILED:
    case CR_OFF:
        gSaveBlock1Ptr->corpseRun.rewardSuppressed = FALSE;
        gSaveBlock1Ptr->corpseRun.trainerOverride = FALSE;
        if (newState != CR_ACTIVE)
        {
            gSaveBlock1Ptr->corpseRun.trainerHpMax = 0;
            gSaveBlock1Ptr->corpseRun.trainerHpCurrent = 0;
        }
        break;
    }
}

static void CorpseRun_SerializeParty(void)
{
    u8 i;
    u8 partyCount = CalculatePlayerPartyCount();

    gSaveBlock1Ptr->corpseRun.partyCount = partyCount;
    for (i = 0; i < PARTY_SIZE; i++)
    {
        struct CorpseRunPartySnapshot *slot = &gSaveBlock1Ptr->corpseRun.partySnapshot[i];

        slot->species = SPECIES_NONE;
        slot->level = 0;
        slot->hpPercent = 0;
        slot->personality = 0;

        if (i < partyCount)
        {
            u16 hp;
            u16 maxHp;

            slot->species = GetMonData(&gPlayerParty[i], MON_DATA_SPECIES);
            slot->level = GetMonData(&gPlayerParty[i], MON_DATA_LEVEL);
            hp = GetMonData(&gPlayerParty[i], MON_DATA_HP);
            maxHp = GetMonData(&gPlayerParty[i], MON_DATA_MAX_HP);
            slot->hpPercent = maxHp ? (hp * 100) / maxHp : 0;
            slot->personality = GetMonData(&gPlayerParty[i], MON_DATA_PERSONALITY);
        }
    }
}

static void CorpseRun_ApplyRecoveryHpToParty(void)
{
    u8 i;

    for (i = 0; i < PARTY_SIZE; i++)
    {
        u16 species = GetMonData(&gPlayerParty[i], MON_DATA_SPECIES);
        u16 maxHp;
        u16 hp;

        if (species == SPECIES_NONE)
            continue;

        if (GetMonData(&gPlayerParty[i], MON_DATA_IS_EGG))
            continue;

        maxHp = GetMonData(&gPlayerParty[i], MON_DATA_MAX_HP);
        if (maxHp == 0)
            continue;

        hp = (maxHp * CORPSE_RUN_RECOVERY_HP_PERCENT) / 100;
        if (hp == 0)
            hp = 1;

        SetMonData(&gPlayerParty[i], MON_DATA_HP, &hp);
    }
}

static void CorpseRun_SpawnMarkerAtPlayer(void)
{
    gSaveBlock1Ptr->corpseRun.markerSpawned = TRUE;
    gSaveBlock1Ptr->corpseRun.markerMapGroup = gSaveBlock1Ptr->location.mapGroup;
    gSaveBlock1Ptr->corpseRun.markerMapNum = gSaveBlock1Ptr->location.mapNum;
    gSaveBlock1Ptr->corpseRun.markerX = gSaveBlock1Ptr->pos.x;
    gSaveBlock1Ptr->corpseRun.markerY = gSaveBlock1Ptr->pos.y;
    gSaveBlock1Ptr->corpseRun.markerElevation = 0;
    gSaveBlock1Ptr->corpseRun.markerStyle = 0;
    gSaveBlock1Ptr->corpseRun.markerMapSection = Overworld_GetMapHeaderByGroupAndId(gSaveBlock1Ptr->location.mapGroup, gSaveBlock1Ptr->location.mapNum)->regionMapSectionId;
    gSaveBlock1Ptr->corpseRun.markerSpawnCounter++;
}

static void CorpseRun_InvalidateStoredPartyBlob(void)
{
    u8 i;

    gSaveBlock1Ptr->corpseRun.partyCount = 0;
    for (i = 0; i < PARTY_SIZE; i++)
    {
        gSaveBlock1Ptr->corpseRun.partySnapshot[i].species = SPECIES_NONE;
        gSaveBlock1Ptr->corpseRun.partySnapshot[i].level = 0;
        gSaveBlock1Ptr->corpseRun.partySnapshot[i].hpPercent = 0;
        gSaveBlock1Ptr->corpseRun.partySnapshot[i].personality = 0;
    }
}

static void CorpseRun_ClearPartyStashMetadata(void)
{
    gSaveBlock1Ptr->corpseRun.reserved[CORPSE_RUN_STASH_VALID_INDEX] = FALSE;
    gSaveBlock1Ptr->corpseRun.reserved[CORPSE_RUN_STASH_COUNT_INDEX] = 0;
    memset(&gSaveBlock1Ptr->corpseRun.reserved[CORPSE_RUN_STASH_DATA_START], 0, PARTY_SIZE * 2);
}

static bool8 CorpseRun_FindFreePcSlots(u8 requiredSlots, u8 *boxIds, u8 *boxPositions)
{
    u8 boxId;
    u8 boxPos;
    u8 found = 0;

    for (boxId = 0; boxId < TOTAL_BOXES_COUNT && found < requiredSlots; boxId++)
    {
        for (boxPos = 0; boxPos < IN_BOX_COUNT && found < requiredSlots; boxPos++)
        {
            if (GetBoxMonDataAt(boxId, boxPos, MON_DATA_SPECIES) == SPECIES_NONE)
            {
                boxIds[found] = boxId;
                boxPositions[found] = boxPos;
                found++;
            }
        }
    }

    return found == requiredSlots;
}

static bool8 CorpseRun_StashPlayerPartyInPc(void)
{
    u8 i;
    u8 partyCount = CalculatePlayerPartyCount();
    u8 stashBoxIds[PARTY_SIZE];
    u8 stashBoxPositions[PARTY_SIZE];

    if (partyCount == 0)
    {
        CorpseRun_ClearPartyStashMetadata();
        return TRUE;
    }

    if (!CorpseRun_FindFreePcSlots(partyCount, stashBoxIds, stashBoxPositions))
    {
        CorpseRun_ClearPartyStashMetadata();
        return FALSE;
    }

    for (i = 0; i < partyCount; i++)
    {
        SetBoxMonAt(stashBoxIds[i], stashBoxPositions[i], &gPlayerParty[i].box);
        ZeroMonData(&gPlayerParty[i]);
        gSaveBlock1Ptr->corpseRun.reserved[CORPSE_RUN_STASH_DATA_START + (i * 2)] = stashBoxIds[i];
        gSaveBlock1Ptr->corpseRun.reserved[CORPSE_RUN_STASH_DATA_START + (i * 2) + 1] = stashBoxPositions[i];
    }

    for (; i < PARTY_SIZE; i++)
        ZeroMonData(&gPlayerParty[i]);

    CalculatePlayerPartyCount();
    gSaveBlock1Ptr->playerPartyCount = gPlayerPartyCount;
    gSaveBlock1Ptr->corpseRun.reserved[CORPSE_RUN_STASH_COUNT_INDEX] = partyCount;
    gSaveBlock1Ptr->corpseRun.reserved[CORPSE_RUN_STASH_VALID_INDEX] = TRUE;
    return TRUE;
}

static void CorpseRun_RemoveStashedPartyFromPc(void)
{
    u8 i;
    u8 stashCount;

    if (!gSaveBlock1Ptr->corpseRun.reserved[CORPSE_RUN_STASH_VALID_INDEX])
        return;

    stashCount = min(gSaveBlock1Ptr->corpseRun.reserved[CORPSE_RUN_STASH_COUNT_INDEX], PARTY_SIZE);
    for (i = 0; i < stashCount; i++)
    {
        u8 boxId = gSaveBlock1Ptr->corpseRun.reserved[CORPSE_RUN_STASH_DATA_START + (i * 2)];
        u8 boxPos = gSaveBlock1Ptr->corpseRun.reserved[CORPSE_RUN_STASH_DATA_START + (i * 2) + 1];

        if (boxId >= TOTAL_BOXES_COUNT || boxPos >= IN_BOX_COUNT)
            continue;

        ZeroBoxMonData(GetBoxedMonPtr(boxId, boxPos));
    }

    CorpseRun_ClearPartyStashMetadata();
}

static void CorpseRun_RestorePartyFromPcStash(void)
{
    u8 i;
    u8 restoredCount = 0;
    u8 stashCount;

    if (!gSaveBlock1Ptr->corpseRun.reserved[CORPSE_RUN_STASH_VALID_INDEX])
        return;

    stashCount = min(gSaveBlock1Ptr->corpseRun.reserved[CORPSE_RUN_STASH_COUNT_INDEX], PARTY_SIZE);
    for (i = 0; i < stashCount; i++)
    {
        u8 boxId = gSaveBlock1Ptr->corpseRun.reserved[CORPSE_RUN_STASH_DATA_START + (i * 2)];
        u8 boxPos = gSaveBlock1Ptr->corpseRun.reserved[CORPSE_RUN_STASH_DATA_START + (i * 2) + 1];
        struct BoxPokemon *boxMon;

        if (boxId >= TOTAL_BOXES_COUNT || boxPos >= IN_BOX_COUNT)
            continue;

        boxMon = GetBoxedMonPtr(boxId, boxPos);
        if (GetBoxMonData(boxMon, MON_DATA_SPECIES) == SPECIES_NONE)
            continue;

        gPlayerParty[restoredCount].box = *boxMon;
        ZeroBoxMonData(boxMon);
        restoredCount++;
    }

    for (; restoredCount < PARTY_SIZE; restoredCount++)
        ZeroMonData(&gPlayerParty[restoredCount]);

    CalculatePlayerPartyCount();
    gSaveBlock1Ptr->playerPartyCount = gPlayerPartyCount;
    CorpseRun_ClearPartyStashMetadata();
}

static void OnSecondDeathDuringCorpseRun(void)
{
    gSaveBlock1Ptr->corpseRun.droppedSouls = 0;
    SoulsHud_Update();
    CorpseRun_RemoveStashedPartyFromPc();
    CorpseRun_InvalidateStoredPartyBlob();
    CorpseRun_SetState(CR_FAILED);
    CorpseRun_DespawnMarker();
    gSaveBlock1Ptr->corpseRun.salvageActive = TRUE;
    gSaveBlock1Ptr->corpseRun.salvageCatchConsumed = FALSE;
    gSaveBlock1Ptr->corpseRun.salvageBallsRemaining = 30;
    gSaveBlock1Ptr->corpseRun.trainerHpMax = 0;
    gSaveBlock1Ptr->corpseRun.trainerHpCurrent = 0;
    CorpseRun_InitSalvageRespawnCheckpoint();

    CorpseRun_ReconcileSalvageRuntimeState();
    SetWarpDestination(MAP_GROUP(MAP_FUCHSIA_CITY_SAFARI_ZONE_ENTRANCE), MAP_NUM(MAP_FUCHSIA_CITY_SAFARI_ZONE_ENTRANCE), WARP_ID_NONE, 4, 4);
}

void CorpseRun_ResetSaveData(void)
{
    CpuFill32(0, &gSaveBlock1Ptr->corpseRun, sizeof(gSaveBlock1Ptr->corpseRun));
    gSaveBlock1Ptr->corpseRun.state = CR_OFF;
    gSaveBlock1Ptr->corpseRun.salvageActive = FALSE;
    gSaveBlock1Ptr->corpseRun.salvageBallsRemaining = 0;
    gSaveBlock1Ptr->corpseRun.salvageCatchConsumed = FALSE;
    gSaveBlock1Ptr->corpseRun.trainerHpMax = 0;
    gSaveBlock1Ptr->corpseRun.trainerHpCurrent = 0;
    gSaveBlock1Ptr->corpseRun.respawnMapId = MAP_UNDEFINED;
    gSaveBlock1Ptr->corpseRun.respawnX = 0;
    gSaveBlock1Ptr->corpseRun.respawnY = 0;
    CorpseRun_ClearPartyStashMetadata();
    SoulsHud_Update();
    CorpseRun_DespawnMarker();
    CorpseRun_FinalizeForSave();
}

void CorpseRun_HandlePlayerDefeat(void)
{
    u8 i;

    if (gSaveBlock1Ptr->corpseRun.state == CR_ACTIVE)
    {
        OnSecondDeathDuringCorpseRun();
        CorpseRun_FinalizeForSave();
        return;
    }

    gSaveBlock1Ptr->corpseRun.deathMapGroup = gSaveBlock1Ptr->location.mapGroup;
    gSaveBlock1Ptr->corpseRun.deathMapNum = gSaveBlock1Ptr->location.mapNum;
    gSaveBlock1Ptr->corpseRun.deathX = gSaveBlock1Ptr->pos.x;
    gSaveBlock1Ptr->corpseRun.deathY = gSaveBlock1Ptr->pos.y;
    gSaveBlock1Ptr->corpseRun.deathElevation = 0;
    gSaveBlock1Ptr->corpseRun.droppedSouls = ComputeWhiteOutMoneyLoss();
    RemoveMoney(&gSaveBlock1Ptr->money, gSaveBlock1Ptr->corpseRun.droppedSouls);
    SoulsHud_Update();

    CorpseRun_SerializeParty();
    for (i = 0; i < gSaveBlock1Ptr->corpseRun.partyCount; i++)
        gSaveBlock1Ptr->corpseRun.partySnapshot[i].hpPercent = 0;

    if (!CorpseRun_StashPlayerPartyInPc())
        CorpseRun_ClearPartyStashMetadata();

    CorpseRun_SpawnMarkerAtPlayer();
    CorpseRun_SetState(CR_ACTIVE);
    gSaveBlock1Ptr->corpseRun.trainerHpMax = min(CORPSE_RUN_TRAINER_HP_MAX, max(CORPSE_RUN_TRAINER_HP_MIN, CORPSE_RUN_TRAINER_HP_BASE + (CorpseRun_GetBadgeCount() * CORPSE_RUN_TRAINER_HP_PER_BADGE)));
    gSaveBlock1Ptr->corpseRun.trainerHpCurrent = gSaveBlock1Ptr->corpseRun.trainerHpMax;
    CorpseRun_FinalizeForSave();
}

void CorpseRun_TryRecoverByTouch(void)
{
    if (gSaveBlock1Ptr->corpseRun.state != CR_ACTIVE || !gSaveBlock1Ptr->corpseRun.markerSpawned)
        return;

    if (gSaveBlock1Ptr->location.mapGroup != gSaveBlock1Ptr->corpseRun.markerMapGroup
     || gSaveBlock1Ptr->location.mapNum != gSaveBlock1Ptr->corpseRun.markerMapNum)
        return;

    if (CorpseRun_IsPlayerAtOrFacingMarker())
    {
        AddMoney(&gSaveBlock1Ptr->money, gSaveBlock1Ptr->corpseRun.droppedSouls);
        CorpseRun_RestorePartyFromPcStash();
        CorpseRun_ApplyRecoveryHpToParty();
        gSaveBlock1Ptr->corpseRun.droppedSouls = 0;
        SoulsHud_Update();
        gSaveBlock1Ptr->corpseRun.trainerHpMax = 0;
        gSaveBlock1Ptr->corpseRun.trainerHpCurrent = 0;
        CorpseRun_DespawnMarker();
        CorpseRun_SetState(CR_RECOVERED);
        CorpseRun_FinalizeForSave();
    }
}

void CorpseRun_OnMapEnter(void)
{
    if (!CorpseRun_IsSchemaValid(&gSaveBlock1Ptr->corpseRun))
        CorpseRun_ResetSaveData();

    if (gSaveBlock1Ptr->corpseRun.state == CR_RECOVERED || gSaveBlock1Ptr->corpseRun.state == CR_FAILED)
        CorpseRun_SetState(CR_OFF);

    // Save/quit policy: active runs persist exactly as captured. On continue,
    // the player may either recover at the marker or fail on the next defeat.
    if (gSaveBlock1Ptr->corpseRun.state == CR_ACTIVE && gSaveBlock1Ptr->corpseRun.markerSpawned)
        CorpseRun_TryRecoverByTouch();

    CorpseRun_SyncVisibleMarkerObject();

    if (gSaveBlock1Ptr->corpseRun.salvageActive)
    {
        if (CalculatePlayerPartyCount() > 0)
        {
            CorpseRun_ForceSalvageExitAndClear();
        }
        else if (gSaveBlock1Ptr->corpseRun.salvageCatchConsumed)
        {
            CorpseRun_ForceSalvageExitAndClear();
        }
        else
        {
            if (!CorpseRun_IsMapInSalvageSafariScope(gSaveBlock1Ptr->location.mapGroup, gSaveBlock1Ptr->location.mapNum))
                CorpseRun_WarpToMap(MAP_FUCHSIA_CITY_SAFARI_ZONE_ENTRANCE, 4, 4);

            CorpseRun_ReconcileSalvageRuntimeState();
        }
    }
    else if (gSaveBlock1Ptr->corpseRun.salvageCatchConsumed)
    {
        CorpseRun_ForceSalvageExitAndClear();
    }
    else
    {
        gSaveBlock1Ptr->corpseRun.salvageBallsRemaining = 0;
    }

    CorpseRun_FinalizeForSave();
}

void CorpseRun_DebugReset(void)
{
    CorpseRun_ResetSaveData();
}



static u8 CorpseRun_GetBadgeCount(void)
{
    u8 i;
    u8 badgesEarned = 0;

    for (i = 0; i < NELEMS(sSalvageBadgeFlagIds); i++)
    {
        if (FlagGet(sSalvageBadgeFlagIds[i]))
            badgesEarned++;
    }

    return badgesEarned;
}

u8 CorpseRun_GetSalvageLevelCap(void)
{
    u8 badgesEarned = CorpseRun_GetBadgeCount();
    u8 referenceLevel = (badgesEarned >= NELEMS(sSalvageBadgeFlagIds))
                        ? ELITE_FOUR_1_ACE_LEVEL
                        : sGymAceLevelByBadgeCount[badgesEarned];

    return referenceLevel - 5;
}

bool8 CorpseRun_IsSalvageCatchAllowed(struct Pokemon *mon)
{
    u8 caughtLevel;

    if (!gSaveBlock1Ptr->corpseRun.salvageActive)
        return TRUE;

    caughtLevel = GetMonData(mon, MON_DATA_LEVEL);
    // Salvage gating is intentionally an upper-bound-only policy.
    // Any encounter at or below the dynamic cap is valid.
    return caughtLevel <= CorpseRun_GetSalvageLevelCap();
}

void CorpseRun_CommitSalvageCatchState(void)
{
    gSaveBlock1Ptr->corpseRun.salvageCatchConsumed = TRUE;
    gSaveBlock1Ptr->corpseRun.salvageActive = FALSE;
    CorpseRun_FinalizeForSave();
}

void CorpseRun_CompleteSalvage(void)
{
    gSaveBlock1Ptr->corpseRun.salvageBallsRemaining = 0;
    ExitSafariMode();
    CorpseRun_WarpToLastCenter();
    CorpseRun_FinalizeForSave();
}



void CorpseRun_FailActiveRunAndEnterSalvage(void)
{
    if (gSaveBlock1Ptr->corpseRun.state != CR_ACTIVE)
        return;

    OnSecondDeathDuringCorpseRun();
    CorpseRun_FinalizeForSave();
}

void CorpseRun_ApplyTrainerDamageFromWild(u8 wildLevel)
{
    u16 damage;

    if (gSaveBlock1Ptr->corpseRun.state != CR_ACTIVE)
        return;

    damage = CORPSE_RUN_TRAINER_DAMAGE_BASE + (wildLevel / 4);
    if (damage < CORPSE_RUN_TRAINER_DAMAGE_BASE)
        damage = CORPSE_RUN_TRAINER_DAMAGE_BASE;
    if (damage > CORPSE_RUN_TRAINER_DAMAGE_CAP)
        damage = CORPSE_RUN_TRAINER_DAMAGE_CAP;

    if (gBattleTypeFlags & BATTLE_TYPE_CORPSE_SAFARI)
    {
        u16 threat = gBattleStruct->field_89;

        if (threat == 0)
            threat = 100;
        damage = (damage * threat) / 100;
    }

    if (gBattleStruct->safariBaitThrowCounter != 0)
        damage = (damage * 3) / 4;
    else if (gBattleStruct->safariRockThrowCounter != 0)
        damage = (damage * 14) / 10;

    if (damage == 0)
        damage = 1;

    if (damage >= gSaveBlock1Ptr->corpseRun.trainerHpCurrent)
        gSaveBlock1Ptr->corpseRun.trainerHpCurrent = 0;
    else
        gSaveBlock1Ptr->corpseRun.trainerHpCurrent -= damage;

    if (gSaveBlock1Ptr->corpseRun.trainerHpCurrent == 0)
        CorpseRun_FailActiveRunAndEnterSalvage();
    else
        CorpseRun_FinalizeForSave();
}

bool8 CorpseRun_IsActive(void)
{
    return gSaveBlock1Ptr->corpseRun.state == CR_ACTIVE;
}

bool8 CorpseRun_IsFieldMovementEscapeDisallowed(void)
{
    return gSaveBlock1Ptr->corpseRun.state == CR_ACTIVE;
}

bool8 CorpseRun_IsSalvageActive(void)
{
    return gSaveBlock1Ptr->corpseRun.salvageActive;
}

bool8 CorpseRun_IsRewardPolicyGateActive(void)
{
    return CorpseRun_IsActive() || CorpseRun_IsSalvageActive();
}

bool8 CorpseRun_ShouldBlockRewardScriptCommands(void)
{
    return CorpseRun_IsRewardPolicyGateActive();
}

bool8 CorpseRun_CanUseBagInCurrentBattle(void)
{
    return !CorpseRun_IsSalvageActive();
}

bool8 CorpseRun_CanRunFromCurrentBattle(void)
{
    if (!(gBattleTypeFlags & BATTLE_TYPE_TRAINER))
        return TRUE;

    if (!CorpseRun_IsActive())
        return FALSE;

    return CorpseRun_IsEscapeTrainerEncounter(gTrainerBattleOpponent_A, GetTrainerBattleMode());
}

bool8 CorpseRun_CanGainExpFromCurrentBattle(void)
{
    return !CorpseRun_IsRewardPolicyGateActive();
}

bool8 CorpseRun_CanGainCurrencyFromCurrentBattle(void)
{
    return !CorpseRun_IsRewardPolicyGateActive();
}

bool8 CorpseRun_CanCaptureInCurrentBattle(void)
{
    // Salvage mode's core objective is a single successful catch.
    // Keep capture blocked during active corpse-runs, but allow it during salvage.
    return !CorpseRun_IsActive();
}

bool8 CorpseRun_CanReceiveItemDrops(void)
{
    return !CorpseRun_IsRewardPolicyGateActive();
}

bool8 CorpseRun_ShouldUseSafariBattle(void)
{
    return GetSafariZoneFlag() || CorpseRun_IsSalvageActive() || CorpseRun_IsActive();
}

bool8 CorpseRun_ShouldUseStandardSafariBattle(void)
{
    return CorpseRun_IsSalvageActive();
}

bool8 CorpseRun_ShouldUseCorpseSafariBattle(void)
{
    if (InSafariZone())
        return FALSE;

    return CorpseRun_IsActive() && !CorpseRun_IsSalvageActive();
}

bool8 CorpseRun_ShouldRunPostBattleScripts(void)
{
    return !CorpseRun_IsSalvageActive();
}

void CorpseRun_OnCorpseSafariEncounterStart(u8 wildLevel)
{
    u16 threat;

    if (!(gBattleTypeFlags & BATTLE_TYPE_CORPSE_SAFARI) || !CorpseRun_IsActive())
        return;

    threat = 100 + wildLevel;
    if (threat > 220)
        threat = 220;

    gBattleStruct->field_89 = threat;
    gBattleStruct->field_8A = 0;
}

void CorpseRun_OnCorpseSafariTurnStart(void)
{
    if (gBattleTypeFlags & BATTLE_TYPE_CORPSE_SAFARI)
        gBattleStruct->field_8A = 0;
}

void CorpseRun_OnCorpseSafariAction(u8 action)
{
    // field_89 is the persisted corpse-safari threat meter for the current encounter.
    u16 threat = gBattleStruct->field_89;

    if (!(gBattleTypeFlags & BATTLE_TYPE_CORPSE_SAFARI) || !CorpseRun_IsActive())
        return;

    if (threat == 0)
        threat = 100;

    if (action == B_ACTION_SAFARI_BAIT)
    {
        threat = (threat * 75) / 100;
    }
    else if (action == B_ACTION_SAFARI_GO_NEAR)
    {
        threat = (threat * 140) / 100;
    }

    if (threat < 40)
        threat = 40;
    if (threat > 250)
        threat = 250;

    gBattleStruct->field_89 = threat;
}

void CorpseRun_OnCorpseSafariTurnEnd(u8 wildLevel)
{
    u16 before;

    if (!(gBattleTypeFlags & BATTLE_TYPE_CORPSE_SAFARI) || !CorpseRun_IsActive())
        return;
    if (gBattleOutcome != 0)
        return;
    if (gBattleStruct->field_8A)
        return;

    if (gBattleStruct->field_89 == 0)
        CorpseRun_OnCorpseSafariEncounterStart(wildLevel);

    before = gSaveBlock1Ptr->corpseRun.trainerHpCurrent;
    CorpseRun_ApplyTrainerDamageFromWild(wildLevel);

    if (before != 0 && gSaveBlock1Ptr->corpseRun.trainerHpCurrent == 0)
    {
        gCurrentTurnActionNumber = gBattlersCount;
        gBattleOutcome = B_OUTCOME_RAN;
    }

    gBattleStruct->field_8A = 1;
}

bool8 CorpseRun_IsEscapeTrainerEncounter(u16 trainerId, u8 trainerBattleMode)
{
    u8 trainerClass;

    if (gSaveBlock1Ptr->corpseRun.state != CR_ACTIVE)
        return FALSE;

    if (trainerId > NUM_TRAINERS)
        return FALSE;

    if (trainerBattleMode == TRAINER_BATTLE_EARLY_RIVAL
     || trainerBattleMode == TRAINER_BATTLE_CONTINUE_SCRIPT
     || trainerBattleMode == TRAINER_BATTLE_CONTINUE_SCRIPT_NO_MUSIC
     || trainerBattleMode == TRAINER_BATTLE_CONTINUE_SCRIPT_DOUBLE
     || trainerBattleMode == TRAINER_BATTLE_CONTINUE_SCRIPT_DOUBLE_NO_MUSIC)
        return FALSE;

    // Category policy for trainer encounters while a corpse-run is active:
    // - Gym/rival/boss/champion classes are blocked from escape handling.
    // - Specific scripted rivals/Giovanni/admin IDs are blocked explicitly.
    // - Regular trainers (lass, youngster, etc.) are considered escapable.
    // This helper now only documents/classifies encounter categories and is no
    // longer used by whiteout initialization to bypass defeat persistence.
    trainerClass = gTrainers[trainerId].trainerClass;
    if (CorpseRun_IsBlockedTrainerClass(trainerClass))
        return FALSE;

    if (CorpseRun_IsCriticalScriptedTrainer(trainerId))
        return FALSE;

    return TRUE;
}

bool8 CorpseRun_ShouldBypassDefeatPersistenceForCurrentBattle(void)
{
    if (!(gBattleTypeFlags & BATTLE_TYPE_TRAINER))
        return FALSE;

    return CorpseRun_IsEscapeTrainerEncounter(gTrainerBattleOpponent_A, GetTrainerBattleMode());
}

bool8 CorpseRun_ShouldSuppressTrainerBattleSideEffects(void)
{
    if (!CorpseRun_IsRewardPolicyGateActive())
        return FALSE;

    if (!(gBattleTypeFlags & BATTLE_TYPE_TRAINER))
        return FALSE;

    return TRUE;
}
