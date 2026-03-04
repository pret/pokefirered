#include "global.h"
#include "corpse_run.h"

#include "event_data.h"
#include "overworld.h"
#include "pokemon.h"

#define CORPSE_RUN_PAYLOAD_OFFSET offsetof(struct CorpseRunSaveData, state)
#define CORPSE_RUN_MAX_PARTY_COUNT PARTY_SIZE

STATIC_ASSERT(sizeof(struct CorpseRunSaveData) == 400, CorpseRunSaveDataSize);

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

void CorpseRun_ResetSaveData(void)
{
    CpuFill32(0, &gSaveBlock1Ptr->corpseRun, sizeof(gSaveBlock1Ptr->corpseRun));
    gSaveBlock1Ptr->corpseRun.state = CR_OFF;
    CorpseRun_DespawnMarker();
    CorpseRun_FinalizeForSave();
}

void CorpseRun_HandlePlayerDefeat(void)
{
    if (gSaveBlock1Ptr->corpseRun.state == CR_ACTIVE)
    {
        CorpseRun_SetState(CR_FAILED);
        CorpseRun_DespawnMarker();
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

    CorpseRun_FinalizeForSave();
}

void CorpseRun_DebugReset(void)
{
    CorpseRun_ResetSaveData();
}
