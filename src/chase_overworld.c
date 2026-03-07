#include "global.h"
#include "chase_overworld.h"
#include "chase_stamina.h"
#include "event_object_movement.h"
#include "fieldmap.h"
#include "constants/event_object_movement.h"
#include "constants/event_objects.h"
#include "constants/maps.h"

#define CHASE_OVERWORLD_MAX_CHASERS (LOCALID_CHASE_VISUAL_MAX - LOCALID_CHASE_VISUAL_BASE + 1)
#define CHASE_OVERWORLD_GFX_ID OBJ_EVENT_GFX_MEOWTH
#define CHASE_OVERWORLD_MAX_STALLED_FRAMES 30

static const u8 sAllMoveDirections[] =
{
    DIR_NORTH,
    DIR_SOUTH,
    DIR_WEST,
    DIR_EAST,
};

static const s8 sChaserSpawnOffsets[][2] =
{
    {-2, 0},
    {2, 0},
    {0, -2},
    {0, 2},
    {-2, 2},
    {2, 2},
};

static EWRAM_DATA bool8 sChasersSpawned = FALSE;
static EWRAM_DATA u8 sSpawnedMapGroup = MAP_GROUP(MAP_UNDEFINED);
static EWRAM_DATA u8 sSpawnedMapNum = MAP_NUM(MAP_UNDEFINED);
static EWRAM_DATA u8 sChaserStalledFrames[CHASE_STAMINA_MAX_ACTIVE_CHASERS];

static void DespawnChasers(void)
{
    u8 i;

    for (i = 0; i < CHASE_STAMINA_MAX_ACTIVE_CHASERS; i++)
    {
        RemoveObjectEventByLocalIdAndMap(LOCALID_CHASE_VISUAL_BASE + i, sSpawnedMapNum, sSpawnedMapGroup);
        sChaserStalledFrames[i] = 0;
    }

    sChasersSpawned = FALSE;
    sSpawnedMapGroup = MAP_GROUP(MAP_UNDEFINED);
    sSpawnedMapNum = MAP_NUM(MAP_UNDEFINED);
}

static bool8 IsSpawnContextValid(void)
{
    return sChasersSpawned
        && sSpawnedMapGroup == gSaveBlock1Ptr->location.mapGroup
        && sSpawnedMapNum == gSaveBlock1Ptr->location.mapNum;
}

static u16 GetDistanceScore(s16 fromX, s16 fromY, s16 toX, s16 toY, u8 direction)
{
    s16 testX = fromX;
    s16 testY = fromY;
    s16 dx;
    s16 dy;

    MoveCoords(direction, &testX, &testY);
    dx = testX - toX;
    if (dx < 0)
        dx = -dx;
    dy = testY - toY;
    if (dy < 0)
        dy = -dy;

    return dx + dy;
}

static bool8 TryQueueChaserStep(struct ObjectEvent *objectEvent, s16 targetX, s16 targetY)
{
    u8 i;
    u8 dirOrder[ARRAY_COUNT(sAllMoveDirections)];

    for (i = 0; i < ARRAY_COUNT(dirOrder); i++)
        dirOrder[i] = sAllMoveDirections[i];

    for (i = 0; i < ARRAY_COUNT(dirOrder); i++)
    {
        u8 j;

        for (j = i + 1; j < ARRAY_COUNT(dirOrder); j++)
        {
            if (GetDistanceScore(objectEvent->currentCoords.x, objectEvent->currentCoords.y, targetX, targetY, dirOrder[j])
             < GetDistanceScore(objectEvent->currentCoords.x, objectEvent->currentCoords.y, targetX, targetY, dirOrder[i]))
            {
                u8 tmp = dirOrder[i];
                dirOrder[i] = dirOrder[j];
                dirOrder[j] = tmp;
            }
        }
    }

    for (i = 0; i < ARRAY_COUNT(dirOrder); i++)
    {
        u8 direction = dirOrder[i];
        s16 testX = objectEvent->currentCoords.x;
        s16 testY = objectEvent->currentCoords.y;

        MoveCoords(direction, &testX, &testY);
        if (GetCollisionAtCoords(objectEvent, testX, testY, direction) == COLLISION_NONE)
            return ObjectEventSetHeldMovement(objectEvent, GetWalkNormalMovementAction(direction));
    }

    return FALSE;
}

static bool8 TryGetChaserSpawnCoords(s16 playerX, s16 playerY, u8 chaserIndex, u8 candidateIndex, s16 *candidateX, s16 *candidateY)
{
    if (candidateIndex == 0)
    {
        *candidateX = playerX - (chaserIndex + 2);
        *candidateY = playerY + 1;
        return TRUE;
    }

    candidateIndex--;
    if (candidateIndex < ARRAY_COUNT(sChaserSpawnOffsets))
    {
        candidateIndex = (candidateIndex + chaserIndex) % ARRAY_COUNT(sChaserSpawnOffsets);
        *candidateX = playerX + sChaserSpawnOffsets[candidateIndex][0];
        *candidateY = playerY + sChaserSpawnOffsets[candidateIndex][1];
        return TRUE;
    }

    return FALSE;
}

static bool8 TrySpawnChaserNearPlayer(u8 localId, u8 chaserIndex, s16 playerX, s16 playerY, u8 *objectEventId)
{
    u8 candidateIndex;

    for (candidateIndex = 0; candidateIndex <= ARRAY_COUNT(sChaserSpawnOffsets); candidateIndex++)
    {
        s16 candidateX;
        s16 candidateY;
        u8 elevation;

        if (!TryGetChaserSpawnCoords(playerX, playerY, chaserIndex, candidateIndex, &candidateX, &candidateY))
            break;

        elevation = MapGridGetElevationAt(candidateX, candidateY);
        SpawnSpecialObjectEventParameterized(CHASE_OVERWORLD_GFX_ID, MOVEMENT_TYPE_FACE_DOWN, localId, candidateX + MAP_OFFSET, candidateY + MAP_OFFSET, elevation);
        if (!TryGetObjectEventIdByLocalIdAndMap(localId, sSpawnedMapNum, sSpawnedMapGroup, objectEventId))
            return TRUE;
    }

    return FALSE;
}

static void PlaceChaserNearPlayer(u8 localId, u8 objectEventId, u8 chaserIndex, s16 playerX, s16 playerY)
{
    u8 candidateIndex;

    for (candidateIndex = 0; candidateIndex <= ARRAY_COUNT(sChaserSpawnOffsets); candidateIndex++)
    {
        s16 candidateX;
        s16 candidateY;

        if (!TryGetChaserSpawnCoords(playerX, playerY, chaserIndex, candidateIndex, &candidateX, &candidateY))
            break;

        TryMoveObjectEventToMapCoords(localId, sSpawnedMapNum, sSpawnedMapGroup, candidateX, candidateY);
        if (gObjectEvents[objectEventId].currentCoords.x == candidateX
         && gObjectEvents[objectEventId].currentCoords.y == candidateY)
            return;
    }
}

static void SpawnOrSyncChasers(void)
{
    u8 i;
    u8 playerObjectEventId;
    u8 activeChasers = ChaseStamina_GetActiveChasers();
    s16 playerX = gSaveBlock1Ptr->pos.x;
    s16 playerY = gSaveBlock1Ptr->pos.y;

    if (TryGetObjectEventIdByLocalIdAndMap(LOCALID_PLAYER, 0, 0, &playerObjectEventId))
    {
        playerX = gObjectEvents[playerObjectEventId].currentCoords.x;
        playerY = gObjectEvents[playerObjectEventId].currentCoords.y;
    }

    if (activeChasers > CHASE_STAMINA_MAX_ACTIVE_CHASERS)
        activeChasers = CHASE_STAMINA_MAX_ACTIVE_CHASERS;

    if (!sChasersSpawned)
    {
        sChasersSpawned = TRUE;
        sSpawnedMapGroup = gSaveBlock1Ptr->location.mapGroup;
        sSpawnedMapNum = gSaveBlock1Ptr->location.mapNum;
    }

    for (i = 0; i < CHASE_STAMINA_MAX_ACTIVE_CHASERS; i++)
    {
        u8 localId = LOCALID_CHASE_VISUAL_BASE + i;
        u8 objectEventId;

        if (i >= activeChasers)
        {
            RemoveObjectEventByLocalIdAndMap(localId, sSpawnedMapNum, sSpawnedMapGroup);
            sChaserStalledFrames[i] = 0;
            continue;
        }

        if (!TryGetObjectEventIdByLocalIdAndMap(localId, sSpawnedMapNum, sSpawnedMapGroup, &objectEventId))
        {
            if (!TrySpawnChaserNearPlayer(localId, i, playerX, playerY, &objectEventId))
                continue;
            sChaserStalledFrames[i] = 0;
        }

        if (ObjectEventIsHeldMovementActive(&gObjectEvents[objectEventId]))
        {
            if (!ObjectEventClearHeldMovementIfFinished(&gObjectEvents[objectEventId]))
                continue;
        }

        if (TryQueueChaserStep(&gObjectEvents[objectEventId], playerX, playerY))
        {
            sChaserStalledFrames[i] = 0;
        }
        else
        {
            if (sChaserStalledFrames[i] < 0xFF)
                sChaserStalledFrames[i]++;

            if (sChaserStalledFrames[i] >= CHASE_OVERWORLD_MAX_STALLED_FRAMES)
            {
                PlaceChaserNearPlayer(localId, objectEventId, i, playerX, playerY);
                sChaserStalledFrames[i] = 0;
            }
        }
    }
}

void ChaseOverworld_UpdateOverworldFrame(bool8 tookStep)
{
    (void)tookStep;

    if (!ChaseStamina_IsChaseActive())
    {
        if (sChasersSpawned)
            DespawnChasers();
        return;
    }

    if (sChasersSpawned && !IsSpawnContextValid())
    {
        DespawnChasers();
        return;
    }

    SpawnOrSyncChasers();
}

void ChaseOverworld_OnMapTransition(const struct WarpData *from, const struct WarpData *to)
{
    (void)from;
    (void)to;

    if (sChasersSpawned)
        DespawnChasers();
}

void ChaseOverworld_OnChaseEnded(void)
{
    if (sChasersSpawned)
        DespawnChasers();
}
