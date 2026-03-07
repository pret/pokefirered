#include "global.h"
#include "chase_overworld.h"
#include "chase_stamina.h"
#include "event_object_movement.h"
#include "field_effect.h"
#include "fieldmap.h"
#include "constants/event_object_movement.h"
#include "constants/field_effects.h"
#include "constants/event_objects.h"
#include "constants/maps.h"

#define CHASE_OVERWORLD_MAX_CHASERS 2
#define CHASE_OVERWORLD_LOCAL_ID_BASE 230
#define CHASE_OVERWORLD_GFX_ID OBJ_EVENT_GFX_MEOWTH
#define CHASE_OVERWORLD_MAX_STALLED_FRAMES 30
#define CHASE_OVERWORLD_MIN_RELOCATE_RADIUS 4
#define CHASE_OVERWORLD_RELOCATE_COOLDOWN_FRAMES 120

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
static EWRAM_DATA u8 sChaserRelocationCooldown[CHASE_OVERWORLD_MAX_CHASERS];

static void DespawnChasers(void)
{
    u8 i;

    for (i = 0; i < CHASE_OVERWORLD_MAX_CHASERS; i++)
    {
        RemoveObjectEventByLocalIdAndMap(CHASE_OVERWORLD_LOCAL_ID_BASE + i, sSpawnedMapNum, sSpawnedMapGroup);
        sChaserStalledFrames[i] = 0;
        sChaserRelocationCooldown[i] = 0;
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

static bool8 IsOutsideRelocationRadius(s16 x, s16 y, s16 playerX, s16 playerY)
{
    s16 dx = x - playerX;
    s16 dy = y - playerY;

    if (dx < 0)
        dx = -dx;
    if (dy < 0)
        dy = -dy;

    return (dx + dy) >= CHASE_OVERWORLD_MIN_RELOCATE_RADIUS;
}

static void GetViewBounds(s16 *left, s16 *right, s16 *top, s16 *bottom)
{
    *left = gSaveBlock1Ptr->pos.x;
    *right = gSaveBlock1Ptr->pos.x + MAP_OFFSET_W - 1;
    *top = gSaveBlock1Ptr->pos.y;
    *bottom = gSaveBlock1Ptr->pos.y + MAP_OFFSET_H - 1;
}

static u8 GetRelocationVisibilityRank(s16 x, s16 y)
{
    s16 left, right, top, bottom;

    GetViewBounds(&left, &right, &top, &bottom);
    if (x < left || x > right || y < top || y > bottom)
        return 0;
    if (x == left || x == right || y == top || y == bottom)
        return 1;

    return 2;
}

static bool8 TryGetRelocationCoords(s16 playerX, s16 playerY, u8 chaserIndex, u8 candidateIndex, s16 *candidateX, s16 *candidateY)
{
    s16 left, right, top, bottom;
    s16 sideOffset = chaserIndex + 1;

    GetViewBounds(&left, &right, &top, &bottom);

    switch (candidateIndex)
    {
    case 0:
        *candidateX = left - 1;
        *candidateY = playerY + sideOffset;
        return TRUE;
    case 1:
        *candidateX = right + 1;
        *candidateY = playerY - sideOffset;
        return TRUE;
    case 2:
        *candidateX = playerX - sideOffset;
        *candidateY = top - 1;
        return TRUE;
    case 3:
        *candidateX = playerX + sideOffset;
        *candidateY = bottom + 1;
        return TRUE;
    case 4:
        *candidateX = left;
        *candidateY = playerY + sideOffset;
        return TRUE;
    case 5:
        *candidateX = right;
        *candidateY = playerY - sideOffset;
        return TRUE;
    case 6:
        *candidateX = playerX - sideOffset;
        *candidateY = top;
        return TRUE;
    case 7:
        *candidateX = playerX + sideOffset;
        *candidateY = bottom;
        return TRUE;
    case 8:
        *candidateX = left - 1;
        *candidateY = top - 1;
        return TRUE;
    case 9:
        *candidateX = right + 1;
        *candidateY = top - 1;
        return TRUE;
    case 10:
        *candidateX = left - 1;
        *candidateY = bottom + 1;
        return TRUE;
    case 11:
        *candidateX = right + 1;
        *candidateY = bottom + 1;
        return TRUE;
    case 12:
        *candidateX = left;
        *candidateY = top;
        return TRUE;
    case 13:
        *candidateX = right;
        *candidateY = top;
        return TRUE;
    case 14:
        *candidateX = left;
        *candidateY = bottom;
        return TRUE;
    case 15:
        *candidateX = right;
        *candidateY = bottom;
        return TRUE;
    default:
        return TryGetChaserSpawnCoords(playerX, playerY, chaserIndex, candidateIndex - 16, candidateX, candidateY);
    }
}

static void PlayChaserRelocationEffect(u8 objectEventId)
{
    struct ObjectEvent *objectEvent = &gObjectEvents[objectEventId];
    u8 spritePriority = 1;

    if (objectEvent->spriteId < MAX_SPRITES)
        spritePriority = gSprites[objectEvent->spriteId].oam.priority;

    gFieldEffectArguments[0] = objectEvent->currentCoords.x;
    gFieldEffectArguments[1] = objectEvent->currentCoords.y;
    gFieldEffectArguments[2] = objectEvent->currentElevation;
    gFieldEffectArguments[3] = spritePriority;
    FieldEffectStart(FLDEFF_DUST);
}

static bool8 PlaceChaserNearPlayer(u8 localId, u8 objectEventId, u8 chaserIndex, s16 playerX, s16 playerY)
{
    u8 candidateIndex;
    bool8 moved = FALSE;
    u8 bestVisibilityRank = 3;

    for (candidateIndex = 0; candidateIndex < ARRAY_COUNT(sChaserSpawnOffsets) + 17; candidateIndex++)
    {
        s16 candidateX;
        s16 candidateY;
        u8 visibilityRank;

        if (!TryGetRelocationCoords(playerX, playerY, chaserIndex, candidateIndex, &candidateX, &candidateY))
            break;
        if (!IsOutsideRelocationRadius(candidateX, candidateY, playerX, playerY))
            continue;

        visibilityRank = GetRelocationVisibilityRank(candidateX, candidateY);
        if (moved && visibilityRank > bestVisibilityRank)
            continue;

        TryMoveObjectEventToMapCoords(localId, sSpawnedMapNum, sSpawnedMapGroup, candidateX, candidateY);
        if (gObjectEvents[objectEventId].currentCoords.x == candidateX
         && gObjectEvents[objectEventId].currentCoords.y == candidateY)
        {
            moved = TRUE;
            bestVisibilityRank = visibilityRank;
            if (bestVisibilityRank == 0)
                break;
        }
    }

    if (moved)
    {
        PlayChaserRelocationEffect(objectEventId);
        return TRUE;
    }

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
            sChaserStalledFrames[i] = 0;
            sChaserRelocationCooldown[i] = 0;
            continue;
        }

        if (sChaserRelocationCooldown[i] > 0)
            sChaserRelocationCooldown[i]--;

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
                if (sChaserRelocationCooldown[i] == 0 && PlaceChaserNearPlayer(localId, objectEventId, i, playerX, playerY))
                {
                    sChaserStalledFrames[i] = 0;
                    sChaserRelocationCooldown[i] = CHASE_OVERWORLD_RELOCATE_COOLDOWN_FRAMES;
                }
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
