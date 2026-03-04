#include "global.h"
#include "corpse_run.h"

#include "event_data.h"
#include "overworld.h"
#include "pokemon.h"
#include "battle.h"
#include "battle_setup.h"
#include "safari_zone.h"

#include "constants/battle_setup.h"
#include "constants/opponents.h"
#include "constants/trainers.h"

#define CORPSE_RUN_PAYLOAD_OFFSET offsetof(struct CorpseRunSaveData, state)
#define CORPSE_RUN_MAX_PARTY_COUNT PARTY_SIZE

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

static bool8 CorpseRun_IsCriticalScriptedTrainer(u16 trainerId)
{
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

static u16 CorpseRun_CalcPayloadChecksum(const struct CorpseRunSaveData *save)
{
    struct CorpseRunSaveData copy = *save;

    copy.payloadChecksum = 0;
    return CalculateChecksum((const void *)&copy.state, copy.payloadLength);
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

static void OnSecondDeathDuringCorpseRun(void)
{
    gSaveBlock1Ptr->corpseRun.droppedSouls = 0;
    CorpseRun_InvalidateStoredPartyBlob();
    CorpseRun_SetState(CR_FAILED);
    CorpseRun_DespawnMarker();
    gSaveBlock1Ptr->corpseRun.salvageActive = TRUE;

    SetSafariZoneFlag();
    gNumSafariBalls = 30;
    gSafariZoneStepCounter = 600;
    SetWarpDestination(MAP_GROUP(MAP_FUCHSIA_CITY_SAFARI_ZONE_ENTRANCE), MAP_NUM(MAP_FUCHSIA_CITY_SAFARI_ZONE_ENTRANCE), -1, 4, 4);
}

void CorpseRun_ResetSaveData(void)
{
    CpuFill32(0, &gSaveBlock1Ptr->corpseRun, sizeof(gSaveBlock1Ptr->corpseRun));
    gSaveBlock1Ptr->corpseRun.state = CR_OFF;
    gSaveBlock1Ptr->corpseRun.salvageActive = FALSE;
    gSaveBlock1Ptr->corpseRun.salvageWarpToHealPending = FALSE;
    CorpseRun_DespawnMarker();
    CorpseRun_FinalizeForSave();
}

void CorpseRun_HandlePlayerDefeat(void)
{
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

    CorpseRun_SerializeParty();
    CorpseRun_SpawnMarkerAtPlayer();
    CorpseRun_SetState(CR_ACTIVE);
    CorpseRun_FinalizeForSave();
}

void CorpseRun_TryRecoverByTouch(void)
{
    if (gSaveBlock1Ptr->corpseRun.state != CR_ACTIVE || !gSaveBlock1Ptr->corpseRun.markerSpawned)
        return;

    if (gSaveBlock1Ptr->location.mapGroup != gSaveBlock1Ptr->corpseRun.markerMapGroup
     || gSaveBlock1Ptr->location.mapNum != gSaveBlock1Ptr->corpseRun.markerMapNum)
        return;

    if (gSaveBlock1Ptr->pos.x == gSaveBlock1Ptr->corpseRun.markerX
     && gSaveBlock1Ptr->pos.y == gSaveBlock1Ptr->corpseRun.markerY)
    {
        gSaveBlock1Ptr->corpseRun.droppedSouls = 0;
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

    if (gSaveBlock1Ptr->corpseRun.salvageWarpToHealPending)
        gSaveBlock1Ptr->corpseRun.salvageWarpToHealPending = FALSE;

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

bool8 CorpseRun_IsSalvageCatchAllowed(const struct Pokemon *mon)
{
    u8 caughtLevel;

    if (!gSaveBlock1Ptr->corpseRun.salvageActive)
        return TRUE;

    caughtLevel = GetMonData(mon, MON_DATA_LEVEL);
    return caughtLevel <= CorpseRun_GetSalvageLevelCap();
}

void CorpseRun_CompleteSalvage(void)
{
    ExitSafariMode();
    gSaveBlock1Ptr->corpseRun.salvageActive = FALSE;
    gSaveBlock1Ptr->corpseRun.salvageWarpToHealPending = TRUE;
    SetWarpDestinationToLastHealLocation();
    CorpseRun_FinalizeForSave();
}


bool8 CorpseRun_IsActive(void)
{
    return gSaveBlock1Ptr->corpseRun.state == CR_ACTIVE;
}

bool8 CorpseRun_IsSalvageActive(void)
{
    return gSaveBlock1Ptr->corpseRun.salvageActive;
}

bool8 CorpseRun_CanUseBagInCurrentBattle(void)
{
    return !CorpseRun_IsSalvageActive();
}

bool8 CorpseRun_CanRunFromCurrentBattle(void)
{
    return TRUE;
}

bool8 CorpseRun_CanGainExpFromCurrentBattle(void)
{
    return !CorpseRun_IsSalvageActive();
}

bool8 CorpseRun_CanGainCurrencyFromCurrentBattle(void)
{
    return !CorpseRun_IsSalvageActive();
}

bool8 CorpseRun_CanCaptureInCurrentBattle(void)
{
    return !CorpseRun_IsSalvageActive();
}

bool8 CorpseRun_CanReceiveItemDrops(void)
{
    return !CorpseRun_IsSalvageActive();
}

bool8 CorpseRun_ShouldUseSafariBattle(void)
{
    return GetSafariZoneFlag() || CorpseRun_IsSalvageActive();
}

bool8 CorpseRun_ShouldRunPostBattleScripts(void)
{
    return !CorpseRun_IsSalvageActive();
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
    if (gSaveBlock1Ptr->corpseRun.state != CR_ACTIVE)
        return FALSE;

    if (!(gBattleTypeFlags & BATTLE_TYPE_TRAINER))
        return FALSE;

    if (gTrainerBattleOpponent_A > NUM_TRAINERS)
        return FALSE;

    if (CorpseRun_IsCriticalScriptedTrainer(gTrainerBattleOpponent_A))
        return FALSE;

    return TRUE;
}
