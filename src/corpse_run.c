#include "global.h"
#include "corpse_run.h"

#include "event_data.h"
#include "overworld.h"
#include "pokemon.h"

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

static void CorpseRun_DespawnMarker(void)
{
    gSaveBlock1Ptr->corpseRun.markerSpawned = FALSE;
    gSaveBlock1Ptr->corpseRun.markerMapGroup = 0;
    gSaveBlock1Ptr->corpseRun.markerMapNum = 0;
    gSaveBlock1Ptr->corpseRun.markerX = 0;
    gSaveBlock1Ptr->corpseRun.markerY = 0;
    gSaveBlock1Ptr->corpseRun.markerElevation = 0;
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
}

void CorpseRun_ResetSaveData(void)
{
    CpuFill32(0, &gSaveBlock1Ptr->corpseRun, sizeof(gSaveBlock1Ptr->corpseRun));
    gSaveBlock1Ptr->corpseRun.state = CR_OFF;
    CorpseRun_DespawnMarker();
}

void CorpseRun_HandlePlayerDefeat(void)
{
    if (gSaveBlock1Ptr->corpseRun.state == CR_ACTIVE)
    {
        CorpseRun_SetState(CR_FAILED);
        CorpseRun_DespawnMarker();
    }

    CorpseRun_SerializeParty();
    CorpseRun_SpawnMarkerAtPlayer();
    CorpseRun_SetState(CR_ACTIVE);
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
        CorpseRun_DespawnMarker();
        CorpseRun_SetState(CR_RECOVERED);
    }
}

void CorpseRun_OnMapEnter(void)
{
    if (gSaveBlock1Ptr->corpseRun.state > CR_FAILED)
        CorpseRun_ResetSaveData();

    if (gSaveBlock1Ptr->corpseRun.state == CR_RECOVERED || gSaveBlock1Ptr->corpseRun.state == CR_FAILED)
        CorpseRun_SetState(CR_OFF);

    if (gSaveBlock1Ptr->corpseRun.state == CR_ACTIVE && gSaveBlock1Ptr->corpseRun.markerSpawned)
        CorpseRun_TryRecoverByTouch();
}

void CorpseRun_DebugReset(void)
{
    CorpseRun_ResetSaveData();
}
