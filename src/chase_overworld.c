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

static EWRAM_DATA bool8 sChasersSpawned = FALSE;
static EWRAM_DATA u8 sSpawnedMapGroup = MAP_GROUP(MAP_UNDEFINED);
static EWRAM_DATA u8 sSpawnedMapNum = MAP_NUM(MAP_UNDEFINED);

static void DespawnChasers(void)
{
    u8 i;

    for (i = 0; i < CHASE_OVERWORLD_MAX_CHASERS; i++)
        RemoveObjectEventByLocalIdAndMap(CHASE_OVERWORLD_LOCAL_ID_BASE + i, sSpawnedMapNum, sSpawnedMapGroup);

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

static u8 GetMoveDirectionTowardTarget(s16 fromX, s16 fromY, s16 toX, s16 toY, u8 preferredDir)
{
    if (fromX < toX)
        return DIR_EAST;
    if (fromX > toX)
        return DIR_WEST;
    if (fromY < toY)
        return DIR_SOUTH;
    if (fromY > toY)
        return DIR_NORTH;

    return preferredDir;
}

static bool8 TryQueueChaserStep(struct ObjectEvent *objectEvent, s16 targetX, s16 targetY)
{
    s16 dx;
    s16 dy;
    u8 i;
    u8 primaryDir;
    u8 secondaryDir;
    u8 fallbackDirs[4];

    primaryDir = DIR_NONE;
    secondaryDir = DIR_NONE;
    dx = objectEvent->currentCoords.x - targetX;
    if (dx < 0)
        dx = -dx;
    dy = objectEvent->currentCoords.y - targetY;
    if (dy < 0)
        dy = -dy;

    if (dx >= dy)
    {
        if (objectEvent->currentCoords.x < targetX)
            primaryDir = DIR_EAST;
        else if (objectEvent->currentCoords.x > targetX)
            primaryDir = DIR_WEST;

        if (objectEvent->currentCoords.y < targetY)
            secondaryDir = DIR_SOUTH;
        else if (objectEvent->currentCoords.y > targetY)
            secondaryDir = DIR_NORTH;
    }
    else
    {
        if (objectEvent->currentCoords.y < targetY)
            primaryDir = DIR_SOUTH;
        else if (objectEvent->currentCoords.y > targetY)
            primaryDir = DIR_NORTH;

        if (objectEvent->currentCoords.x < targetX)
            secondaryDir = DIR_EAST;
        else if (objectEvent->currentCoords.x > targetX)
            secondaryDir = DIR_WEST;
    }

    if (primaryDir == DIR_NONE)
        primaryDir = GetMoveDirectionTowardTarget(objectEvent->currentCoords.x, objectEvent->currentCoords.y, targetX, targetY, objectEvent->facingDirection);

    fallbackDirs[0] = primaryDir;
    fallbackDirs[1] = secondaryDir;
    fallbackDirs[2] = objectEvent->facingDirection;
    fallbackDirs[3] = GetOppositeDirection(objectEvent->facingDirection);

    for (i = 0; i < ARRAY_COUNT(fallbackDirs); i++)
    {
        u8 direction = fallbackDirs[i];
        s16 testX = objectEvent->currentCoords.x;
        s16 testY = objectEvent->currentCoords.y;

        if (direction == DIR_NONE)
            continue;

        MoveCoords(direction, &testX, &testY);
        if (GetCollisionAtCoords(objectEvent, testX, testY, direction) == COLLISION_NONE)
            return ObjectEventSetHeldMovement(objectEvent, GetWalkNormalMovementAction(direction));
    }

    ObjectEventTurn(objectEvent, GetMoveDirectionTowardTarget(objectEvent->currentCoords.x, objectEvent->currentCoords.y, targetX, targetY, objectEvent->facingDirection));
    return FALSE;
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
            continue;
        }

        if (!TryGetObjectEventIdByLocalIdAndMap(localId, sSpawnedMapNum, sSpawnedMapGroup, &objectEventId))
        {
            s16 spawnX = playerX - (i + 2);
            s16 spawnY = playerY + 1;
            u8 elevation = MapGridGetElevationAt(spawnX, spawnY);

            SpawnSpecialObjectEventParameterized(CHASE_OVERWORLD_GFX_ID, MOVEMENT_TYPE_FACE_DOWN, localId, spawnX + MAP_OFFSET, spawnY + MAP_OFFSET, elevation);
            if (!TryGetObjectEventIdByLocalIdAndMap(localId, sSpawnedMapNum, sSpawnedMapGroup, &objectEventId))
                continue;
        }

        if (ObjectEventIsHeldMovementActive(&gObjectEvents[objectEventId]))
        {
            if (!ObjectEventClearHeldMovementIfFinished(&gObjectEvents[objectEventId]))
                continue;
        }

        TryQueueChaserStep(&gObjectEvents[objectEventId], playerX, playerY);
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
