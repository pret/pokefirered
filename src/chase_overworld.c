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
#define CHASE_OVERWORLD_PROXIMITY_RANGE 5
#define CHASE_OVERWORLD_ATTENTION_COOLDOWN 120
#define CHASE_OVERWORLD_IDLE_ANIM_PERIOD 24

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
static EWRAM_DATA u8 sChaserStalledFrames[CHASE_OVERWORLD_MAX_CHASERS];
static EWRAM_DATA u8 sChaserAttentionCooldown[CHASE_OVERWORLD_MAX_CHASERS];
static EWRAM_DATA bool8 sChaserWasInProximity[CHASE_OVERWORLD_MAX_CHASERS];

static u8 GetDirectionTowardCoords(s16 fromX, s16 fromY, s16 toX, s16 toY)
{
    s16 dx = toX - fromX;
    s16 dy = toY - fromY;

    if (dx < 0)
        dx = -dx;
    if (dy < 0)
        dy = -dy;

    if (dx >= dy)
        return (toX >= fromX) ? DIR_EAST : DIR_WEST;
    else
        return (toY >= fromY) ? DIR_SOUTH : DIR_NORTH;
}

static u16 GetManhattanDistance(s16 x1, s16 y1, s16 x2, s16 y2)
{
    s16 dx = x1 - x2;
    s16 dy = y1 - y2;

    if (dx < 0)
        dx = -dx;
    if (dy < 0)
        dy = -dy;

    return dx + dy;
}

static void FaceChaserTowardPlayer(struct ObjectEvent *objectEvent, s16 playerX, s16 playerY)
{
    u8 faceDir = GetDirectionTowardCoords(objectEvent->currentCoords.x, objectEvent->currentCoords.y, playerX, playerY);

    if (!ObjectEventIsHeldMovementActive(objectEvent))
        ObjectEventSetHeldMovement(objectEvent, GetFaceDirectionMovementAction(faceDir));
}

static void UpdateChaserVisibilityPriority(struct ObjectEvent *objectEvent)
{
    if (objectEvent->spriteId < MAX_SPRITES)
        SetObjectSubpriorityByElevation(objectEvent->previousElevation, &gSprites[objectEvent->spriteId], 2);
}

static void DespawnChasers(void)
{
    u8 i;

    for (i = 0; i < CHASE_OVERWORLD_MAX_CHASERS; i++)
    {
        RemoveObjectEventByLocalIdAndMap(CHASE_OVERWORLD_LOCAL_ID_BASE + i, sSpawnedMapNum, sSpawnedMapGroup);
        sChaserStalledFrames[i] = 0;
        sChaserAttentionCooldown[i] = 0;
        sChaserWasInProximity[i] = FALSE;
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

static bool8 TryQueueChaserStep(struct ObjectEvent *objectEvent, s16 targetX, s16 targetY, bool8 activePursuit)
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
        {
            u8 movementAction = activePursuit ? GetWalkFastMovementAction(direction) : GetWalkNormalMovementAction(direction);
            return ObjectEventSetHeldMovement(objectEvent, movementAction);
        }
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
            sChaserAttentionCooldown[i] = 0;
            sChaserWasInProximity[i] = FALSE;
            continue;
        }

        if (!TryGetObjectEventIdByLocalIdAndMap(localId, sSpawnedMapNum, sSpawnedMapGroup, &objectEventId))
        {
            if (!TrySpawnChaserNearPlayer(localId, i, playerX, playerY, &objectEventId))
                continue;
            sChaserStalledFrames[i] = 0;
            sChaserAttentionCooldown[i] = 0;
            sChaserWasInProximity[i] = FALSE;
        }

        if (ObjectEventIsHeldMovementActive(&gObjectEvents[objectEventId]))
        {
            if (!ObjectEventClearHeldMovementIfFinished(&gObjectEvents[objectEventId]))
                continue;
        }

        {
            struct ObjectEvent *chaser = &gObjectEvents[objectEventId];
            u16 distanceToPlayer = GetManhattanDistance(chaser->currentCoords.x, chaser->currentCoords.y, playerX, playerY);
            bool8 isInProximity = (distanceToPlayer <= CHASE_OVERWORLD_PROXIMITY_RANGE);
            bool8 activePursuit = (distanceToPlayer <= (CHASE_OVERWORLD_PROXIMITY_RANGE + 2));

            if (sChaserAttentionCooldown[i] != 0)
                sChaserAttentionCooldown[i]--;

            if (isInProximity && !sChaserWasInProximity[i] && sChaserAttentionCooldown[i] == 0)
            {
                if (ObjectEventSetHeldMovement(chaser, MOVEMENT_ACTION_EMOTE_EXCLAMATION_MARK))
                    sChaserAttentionCooldown[i] = CHASE_OVERWORLD_ATTENTION_COOLDOWN;
                sChaserWasInProximity[i] = TRUE;
                UpdateChaserVisibilityPriority(chaser);
                continue;
            }

            sChaserWasInProximity[i] = isInProximity;

            if (TryQueueChaserStep(chaser, playerX, playerY, activePursuit))
            {
                sChaserStalledFrames[i] = 0;
            }
            else
            {
                if (sChaserStalledFrames[i] < 0xFF)
                    sChaserStalledFrames[i]++;

                FaceChaserTowardPlayer(chaser, playerX, playerY);
                if (sChaserStalledFrames[i] % CHASE_OVERWORLD_IDLE_ANIM_PERIOD == 0)
                    ObjectEventSetHeldMovement(chaser, GetWalkInPlaceSlowMovementAction(chaser->facingDirection));

                if (sChaserStalledFrames[i] >= CHASE_OVERWORLD_MAX_STALLED_FRAMES)
                {
                    PlaceChaserNearPlayer(localId, objectEventId, i, playerX, playerY);
                    sChaserStalledFrames[i] = 0;
                }
            }

            UpdateChaserVisibilityPriority(chaser);
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
