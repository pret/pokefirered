#include "global.h"
#include "chase_overworld.h"
#include "chase_stamina.h"
#include "event_object_movement.h"
#include "fieldmap.h"
#include "constants/event_object_movement.h"
#include "constants/event_objects.h"
#include "constants/maps.h"

#define CHASE_OVERWORLD_MAX_CHASERS 2
#define CHASE_OVERWORLD_LOCAL_ID_BASE 230
#define CHASE_OVERWORLD_GFX_ID OBJ_EVENT_GFX_MEOWTH
#define CHASE_OVERWORLD_MAX_STALLED_FRAMES 30
#define CHASE_OVERWORLD_CENTER_SAFE_RADIUS_X 2
#define CHASE_OVERWORLD_CENTER_SAFE_RADIUS_Y 2
#define CHASE_OVERWORLD_OFFSCREEN_RADIUS_X 8
#define CHASE_OVERWORLD_OFFSCREEN_RADIUS_Y 6

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

static const s8 sChaserEdgeSpawnOffsets[][2] =
{
    {-9, 0},
    {9, 0},
    {0, -7},
    {0, 7},
    {-9, -3},
    {9, -3},
    {-9, 3},
    {9, 3},
};

static EWRAM_DATA bool8 sChasersSpawned = FALSE;
static EWRAM_DATA u8 sSpawnedMapGroup = MAP_GROUP(MAP_UNDEFINED);
static EWRAM_DATA u8 sSpawnedMapNum = MAP_NUM(MAP_UNDEFINED);
static EWRAM_DATA u8 sChaserStalledFrames[CHASE_OVERWORLD_MAX_CHASERS];

static bool8 IsOutsideImmediateCameraCenter(s16 playerX, s16 playerY, s16 targetX, s16 targetY)
{
    s16 dx = targetX - playerX;
    s16 dy = targetY - playerY;

    if (dx < 0)
        dx = -dx;
    if (dy < 0)
        dy = -dy;

    return dx > CHASE_OVERWORLD_CENTER_SAFE_RADIUS_X || dy > CHASE_OVERWORLD_CENTER_SAFE_RADIUS_Y;
}

static bool8 IsLikelyOffscreenFromPlayer(s16 playerX, s16 playerY, s16 targetX, s16 targetY)
{
    s16 dx = targetX - playerX;
    s16 dy = targetY - playerY;

    if (dx < 0)
        dx = -dx;
    if (dy < 0)
        dy = -dy;

    return dx >= CHASE_OVERWORLD_OFFSCREEN_RADIUS_X || dy >= CHASE_OVERWORLD_OFFSCREEN_RADIUS_Y;
}

static void DespawnChasers(void)
{
    u8 i;

    for (i = 0; i < CHASE_OVERWORLD_MAX_CHASERS; i++)
    {
        RemoveObjectEventByLocalIdAndMap(CHASE_OVERWORLD_LOCAL_ID_BASE + i, sSpawnedMapNum, sSpawnedMapGroup);
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

static bool8 IsSpawnTileValid(struct ObjectEvent *referenceObjectEvent, s16 x, s16 y)
{
    if (MapGridGetCollisionAt(x, y))
        return FALSE;
    if (GetMapBorderIdAt(x, y) == CONNECTION_INVALID)
        return FALSE;

    return GetCollisionAtCoords(referenceObjectEvent, x, y, DIR_SOUTH) == COLLISION_NONE;
}

static bool8 TryGetSpawnCoordsFromOffsets(struct ObjectEvent *referenceObjectEvent, s16 playerX, s16 playerY, u8 chaserIndex, const s8 offsets[][2], u8 offsetsCount, bool8 requireLikelyOffscreen, s16 *candidateX, s16 *candidateY)
{
    u8 i;

    for (i = 0; i < offsetsCount; i++)
    {
        u8 offsetIndex = (i + chaserIndex) % offsetsCount;
        s16 testX = playerX + offsets[offsetIndex][0];
        s16 testY = playerY + offsets[offsetIndex][1];

        if (!IsOutsideImmediateCameraCenter(playerX, playerY, testX, testY))
            continue;
        if (requireLikelyOffscreen && !IsLikelyOffscreenFromPlayer(playerX, playerY, testX, testY))
            continue;
        if (!IsSpawnTileValid(referenceObjectEvent, testX, testY))
            continue;

        *candidateX = testX;
        *candidateY = testY;
        return TRUE;
    }

    return FALSE;
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

static bool8 TryGetChaserSpawnCoords(struct ObjectEvent *referenceObjectEvent, s16 playerX, s16 playerY, u8 chaserIndex, bool8 allowNearPlayerFallback, s16 *candidateX, s16 *candidateY)
{
    if (TryGetSpawnCoordsFromOffsets(referenceObjectEvent, playerX, playerY, chaserIndex, sChaserEdgeSpawnOffsets, ARRAY_COUNT(sChaserEdgeSpawnOffsets), TRUE, candidateX, candidateY))
        return TRUE;

    if (TryGetSpawnCoordsFromOffsets(referenceObjectEvent, playerX, playerY, chaserIndex, sChaserSpawnOffsets, ARRAY_COUNT(sChaserSpawnOffsets), TRUE, candidateX, candidateY))
        return TRUE;

    if (allowNearPlayerFallback
     && TryGetSpawnCoordsFromOffsets(referenceObjectEvent, playerX, playerY, chaserIndex, sChaserSpawnOffsets, ARRAY_COUNT(sChaserSpawnOffsets), FALSE, candidateX, candidateY))
        return TRUE;

    return FALSE;
}

static bool8 TrySpawnChaserNearPlayer(struct ObjectEvent *referenceObjectEvent, u8 localId, u8 chaserIndex, s16 playerX, s16 playerY, u8 *objectEventId)
{
    s16 candidateX;
    s16 candidateY;
    u8 elevation;

    if (!TryGetChaserSpawnCoords(referenceObjectEvent, playerX, playerY, chaserIndex, FALSE, &candidateX, &candidateY))
        return FALSE;

    elevation = MapGridGetElevationAt(candidateX, candidateY);
    SpawnSpecialObjectEventParameterized(CHASE_OVERWORLD_GFX_ID, MOVEMENT_TYPE_FACE_DOWN, localId, candidateX + MAP_OFFSET, candidateY + MAP_OFFSET, elevation);
    if (!TryGetObjectEventIdByLocalIdAndMap(localId, sSpawnedMapNum, sSpawnedMapGroup, objectEventId))
        return TRUE;

    return FALSE;
}

static void PlaceChaserNearPlayer(struct ObjectEvent *referenceObjectEvent, u8 localId, u8 chaserIndex, s16 playerX, s16 playerY)
{
    s16 candidateX;
    s16 candidateY;

    if (!TryGetChaserSpawnCoords(referenceObjectEvent, playerX, playerY, chaserIndex, TRUE, &candidateX, &candidateY))
        return;

    TryMoveObjectEventToMapCoords(localId, sSpawnedMapNum, sSpawnedMapGroup, candidateX, candidateY);
}

static void SpawnOrSyncChasers(void)
{
    u8 i;
    u8 playerObjectEventId = 0;
    u8 activeChasers = ChaseStamina_GetActiveChasers();
    bool8 playerObjectAvailable = FALSE;
    s16 playerX = gSaveBlock1Ptr->pos.x;
    s16 playerY = gSaveBlock1Ptr->pos.y;

    if (TryGetObjectEventIdByLocalIdAndMap(LOCALID_PLAYER, 0, 0, &playerObjectEventId))
    {
        playerObjectAvailable = TRUE;
        playerX = gObjectEvents[playerObjectEventId].currentCoords.x;
        playerY = gObjectEvents[playerObjectEventId].currentCoords.y;
    }

    if (activeChasers > CHASE_OVERWORLD_MAX_CHASERS)
        activeChasers = CHASE_OVERWORLD_MAX_CHASERS;

    if (!sChasersSpawned)
    {
        sChasersSpawned = TRUE;
        sSpawnedMapGroup = gSaveBlock1Ptr->location.mapGroup;
        sSpawnedMapNum = gSaveBlock1Ptr->location.mapNum;
    }

    for (i = 0; i < CHASE_OVERWORLD_MAX_CHASERS; i++)
    {
        u8 localId = CHASE_OVERWORLD_LOCAL_ID_BASE + i;
        u8 objectEventId;

        if (i >= activeChasers)
        {
            RemoveObjectEventByLocalIdAndMap(localId, sSpawnedMapNum, sSpawnedMapGroup);
            sChaserStalledFrames[i] = 0;
            continue;
        }

        if (!TryGetObjectEventIdByLocalIdAndMap(localId, sSpawnedMapNum, sSpawnedMapGroup, &objectEventId))
        {
            if (!playerObjectAvailable)
                continue;

            if (!TrySpawnChaserNearPlayer(&gObjectEvents[playerObjectEventId], localId, i, playerX, playerY, &objectEventId))
                continue;
            sChaserStalledFrames[i] = 0;

            if (TryQueueChaserStep(&gObjectEvents[objectEventId], playerX, playerY))
                continue;
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
                PlaceChaserNearPlayer(&gObjectEvents[objectEventId], localId, i, playerX, playerY);
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
