#include "global.h"
#include "chase_overworld.h"
#include "chase_stamina.h"
#include "event_object_movement.h"
#include "field_message_box.h"
#include "field_effect.h"
#include "fieldmap.h"
#include "palette.h"
#include "script.h"
#include "sound.h"
#include "constants/event_object_movement.h"
#include "constants/field_effects.h"
#include "constants/event_objects.h"
#include "constants/maps.h"
#include "constants/rgb.h"
#include "constants/songs.h"

#define CHASE_OVERWORLD_MAX_CHASERS (LOCALID_CHASE_VISUAL_MAX - LOCALID_CHASE_VISUAL_BASE + 1)
#define CHASE_OVERWORLD_GFX_ID OBJ_EVENT_GFX_MEOWTH
#define CHASE_OVERWORLD_MAX_STALLED_FRAMES 30
#define CHASE_CUE_DISTANCE_CLOSE 3
#define CHASE_CUE_DISTANCE_MEDIUM 6
#define CHASE_CUE_DISTANCE_FAR 10
#define CHASE_CUE_VOLUME_NONE 256
#define CHASE_CUE_VOLUME_LOW 232
#define CHASE_CUE_VOLUME_MEDIUM 208
#define CHASE_CUE_VOLUME_HIGH 184
#define CHASE_OVERWORLD_MIN_RELOCATE_RADIUS 4
#define CHASE_OVERWORLD_RELOCATE_COOLDOWN_FRAMES 120
#define CHASE_OVERWORLD_CENTER_SAFE_RADIUS_X 2
#define CHASE_OVERWORLD_CENTER_SAFE_RADIUS_Y 2
#define CHASE_OVERWORLD_OFFSCREEN_RADIUS_X 8
#define CHASE_OVERWORLD_OFFSCREEN_RADIUS_Y 6
#define CHASE_OVERWORLD_PROXIMITY_RANGE 5
#define CHASE_OVERWORLD_ATTENTION_COOLDOWN 120
#define CHASE_OVERWORLD_IDLE_ANIM_PERIOD 24
#define CHASE_OVERWORLD_RESPAWN_SEARCH_MAX_RADIUS 4

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
static EWRAM_DATA u8 sCueLevel = 0;
static EWRAM_DATA u8 sCueCooldownFrames = 0;
static EWRAM_DATA u8 sHeartbeatTimer = 0;
static EWRAM_DATA u8 sVignettePulsePhase = 0;

static void ResetChaseCues(void)
{
    sCueLevel = 0;
    sCueCooldownFrames = 0;
    sHeartbeatTimer = 0;
    sVignettePulsePhase = 0;
    BlendPalettes(PALETTES_ALL, 0, RGB_BLACK);
    BGMVolumeMax_EnableHelpSystemReduction();
}

static void GetPlayerCoordsForChase(s16 *x, s16 *y)
{
    u8 playerObjectEventId;

    *x = gSaveBlock1Ptr->pos.x;
    *y = gSaveBlock1Ptr->pos.y;
    if (TryGetObjectEventIdByLocalIdAndMap(LOCALID_PLAYER, 0, 0, &playerObjectEventId))
    {
        *x = gObjectEvents[playerObjectEventId].currentCoords.x;
        *y = gObjectEvents[playerObjectEventId].currentCoords.y;
    }
}

static u16 GetMinDistanceToActiveChaser(void)
{
    u8 i;
    u16 minDistance = 0xFFFF;
    u8 activeChasers = ChaseStamina_GetActiveChasers();
    s16 playerX;
    s16 playerY;

    GetPlayerCoordsForChase(&playerX, &playerY);
    if (activeChasers > CHASE_OVERWORLD_MAX_CHASERS)
        activeChasers = CHASE_OVERWORLD_MAX_CHASERS;

    for (i = 0; i < activeChasers; i++)
    {
        u8 objectEventId;
        s16 dx;
        s16 dy;
        u16 distance;

        if (!TryGetObjectEventIdByLocalIdAndMap(CHASE_OVERWORLD_LOCAL_ID_BASE + i, sSpawnedMapNum, sSpawnedMapGroup, &objectEventId))
            continue;

        dx = gObjectEvents[objectEventId].currentCoords.x - playerX;
        dy = gObjectEvents[objectEventId].currentCoords.y - playerY;
        if (dx < 0)
            dx = -dx;
        if (dy < 0)
            dy = -dy;
        distance = dx + dy;
        if (distance < minDistance)
            minDistance = distance;
    }

    return minDistance;
}

static bool8 ShouldDisableChaseCues(void)
{
    return ScriptContext_IsEnabled() || !IsFieldMessageBoxHidden();
}

static u8 GetCueLevelFromDistance(u16 minDistance)
{
    if (minDistance <= CHASE_CUE_DISTANCE_CLOSE)
        return 3;
    if (minDistance <= CHASE_CUE_DISTANCE_MEDIUM)
        return 2;
    if (minDistance <= CHASE_CUE_DISTANCE_FAR)
        return 1;
    return 0;
}

static void UpdateChaseCues(void)
{
    static const u8 sHeartbeatIntervals[] = {0, 26, 18, 10};
    static const u8 sPulsePeriods[] = {1, 30, 22, 14};
    static const u8 sPulseMaxBlend[] = {0, 3, 5, 7};
    static const u16 sCueVolumes[] =
    {
        CHASE_CUE_VOLUME_NONE,
        CHASE_CUE_VOLUME_LOW,
        CHASE_CUE_VOLUME_MEDIUM,
        CHASE_CUE_VOLUME_HIGH,
    };
    u8 targetCueLevel;
    u16 minDistance;

    if (ShouldDisableChaseCues())
    {
        ResetChaseCues();
        return;
    }

    minDistance = GetMinDistanceToActiveChaser();
    targetCueLevel = GetCueLevelFromDistance(minDistance);

    if (targetCueLevel > sCueLevel)
    {
        sCueLevel = targetCueLevel;
        sCueCooldownFrames = 0;
    }
    else if (targetCueLevel < sCueLevel)
    {
        if (++sCueCooldownFrames >= 3)
        {
            sCueLevel--;
            sCueCooldownFrames = 0;
        }
    }
    else
    {
        sCueCooldownFrames = 0;
    }

    if (sCueLevel != 0)
    {
        u8 pulsePeriod = sPulsePeriods[sCueLevel];
        u8 halfPeriod = pulsePeriod / 2;
        u8 phase = sVignettePulsePhase % pulsePeriod;
        u8 rising = phase <= halfPeriod ? phase : pulsePeriod - phase;
        u8 pulseCoeff = (rising * sPulseMaxBlend[sCueLevel]) / halfPeriod;

        sVignettePulsePhase++;
        BlendPalettes(PALETTES_ALL, pulseCoeff, RGB_BLACK);

        if (++sHeartbeatTimer >= sHeartbeatIntervals[sCueLevel])
        {
            PlaySE(SE_CONTEST_HEART);
            sHeartbeatTimer = 0;
        }
    }
    else
    {
        sHeartbeatTimer = 0;
        sVignettePulsePhase = 0;
        BlendPalettes(PALETTES_ALL, 0, RGB_BLACK);
    }

    SetBGMVolume_SuppressHelpSystemReduction(sCueVolumes[sCueLevel]);
static EWRAM_DATA u8 sChaserRelocationCooldown[CHASE_OVERWORLD_MAX_CHASERS];
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
static EWRAM_DATA u8 sChaserStalledFrames[CHASE_STAMINA_MAX_ACTIVE_CHASERS];

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

    for (i = 0; i < CHASE_STAMINA_MAX_ACTIVE_CHASERS; i++)
    {
        RemoveObjectEventByLocalIdAndMap(LOCALID_CHASE_VISUAL_BASE + i, sSpawnedMapNum, sSpawnedMapGroup);
        sChaserStalledFrames[i] = 0;
        sChaserRelocationCooldown[i] = 0;
        sChaserAttentionCooldown[i] = 0;
        sChaserWasInProximity[i] = FALSE;
    }

    sChasersSpawned = FALSE;
    sSpawnedMapGroup = MAP_GROUP(MAP_UNDEFINED);
    sSpawnedMapNum = MAP_NUM(MAP_UNDEFINED);
    ResetChaseCues();
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
static void PlaceChaserNearPlayer(struct ObjectEvent *referenceObjectEvent, u8 localId, u8 chaserIndex, s16 playerX, s16 playerY)
{
    s16 candidateX;
    s16 candidateY;

    if (!TryGetChaserSpawnCoords(referenceObjectEvent, playerX, playerY, chaserIndex, TRUE, &candidateX, &candidateY))
        return;

    TryMoveObjectEventToMapCoords(localId, sSpawnedMapNum, sSpawnedMapGroup, candidateX, candidateY);
    s16 radius;

    (void)chaserIndex;

    for (radius = 1; radius <= CHASE_OVERWORLD_RESPAWN_SEARCH_MAX_RADIUS; radius++)
    {
        s16 x;
        s16 y;

        // Deterministic clockwise perimeter scan for this radius:
        // top edge (left->right), right edge (top->bottom),
        // bottom edge (right->left), left edge (bottom->top).
        for (x = playerX - radius; x <= playerX + radius; x++)
        {
            s16 candidateX = x;
            s16 candidateY = playerY - radius;

            if (candidateX == playerX && candidateY == playerY)
                continue;

            TryMoveObjectEventToMapCoords(localId, sSpawnedMapNum, sSpawnedMapGroup, candidateX, candidateY);
            if (gObjectEvents[objectEventId].currentCoords.x == candidateX
             && gObjectEvents[objectEventId].currentCoords.y == candidateY)
                return;
        }

        for (y = playerY - radius + 1; y <= playerY + radius; y++)
        {
            s16 candidateX = playerX + radius;
            s16 candidateY = y;

            if (candidateX == playerX && candidateY == playerY)
                continue;

            TryMoveObjectEventToMapCoords(localId, sSpawnedMapNum, sSpawnedMapGroup, candidateX, candidateY);
            if (gObjectEvents[objectEventId].currentCoords.x == candidateX
             && gObjectEvents[objectEventId].currentCoords.y == candidateY)
                return;
        }

        for (x = playerX + radius - 1; x >= playerX - radius; x--)
        {
            s16 candidateX = x;
            s16 candidateY = playerY + radius;

            if (candidateX == playerX && candidateY == playerY)
                continue;

            TryMoveObjectEventToMapCoords(localId, sSpawnedMapNum, sSpawnedMapGroup, candidateX, candidateY);
            if (gObjectEvents[objectEventId].currentCoords.x == candidateX
             && gObjectEvents[objectEventId].currentCoords.y == candidateY)
                return;
        }

        for (y = playerY + radius - 1; y >= playerY - radius + 1; y--)
        {
            s16 candidateX = playerX - radius;
            s16 candidateY = y;

            if (candidateX == playerX && candidateY == playerY)
                continue;

            TryMoveObjectEventToMapCoords(localId, sSpawnedMapNum, sSpawnedMapGroup, candidateX, candidateY);
            if (gObjectEvents[objectEventId].currentCoords.x == candidateX
             && gObjectEvents[objectEventId].currentCoords.y == candidateY)
                return;
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
    u8 activeChasers = ChaseStamina_GetActiveChasers();
    s16 playerX;
    s16 playerY;

    GetPlayerCoordsForChase(&playerX, &playerY);
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
            sChaserRelocationCooldown[i] = 0;
            sChaserAttentionCooldown[i] = 0;
            sChaserWasInProximity[i] = FALSE;
            continue;
        }

        if (sChaserRelocationCooldown[i] > 0)
            sChaserRelocationCooldown[i]--;

        if (!TryGetObjectEventIdByLocalIdAndMap(localId, sSpawnedMapNum, sSpawnedMapGroup, &objectEventId))
        {
            if (!playerObjectAvailable)
                continue;

            if (!TrySpawnChaserNearPlayer(&gObjectEvents[playerObjectEventId], localId, i, playerX, playerY, &objectEventId))
                continue;
            sChaserStalledFrames[i] = 0;

            if (TryQueueChaserStep(&gObjectEvents[objectEventId], playerX, playerY))
                continue;
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
                if (sChaserRelocationCooldown[i] == 0 && PlaceChaserNearPlayer(localId, objectEventId, i, playerX, playerY))
                {
                    sChaserStalledFrames[i] = 0;
                    sChaserRelocationCooldown[i] = CHASE_OVERWORLD_RELOCATE_COOLDOWN_FRAMES;
                }
                if (ObjectEventSetHeldMovement(chaser, MOVEMENT_ACTION_EMOTE_EXCLAMATION_MARK))
                    sChaserAttentionCooldown[i] = CHASE_OVERWORLD_ATTENTION_COOLDOWN;
                sChaserWasInProximity[i] = TRUE;
                UpdateChaserVisibilityPriority(chaser);
                continue;
            }

            sChaserWasInProximity[i] = isInProximity;

            if (TryQueueChaserStep(chaser, playerX, playerY, activePursuit))
            {
                PlaceChaserNearPlayer(&gObjectEvents[objectEventId], localId, i, playerX, playerY);
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
    UpdateChaseCues();
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
