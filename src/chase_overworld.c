#include "global.h"
#include "chase_overworld.h"
#include "chase_stamina.h"
#include "event_object_movement.h"
#include "field_message_box.h"
#include "fieldmap.h"
#include "palette.h"
#include "script.h"
#include "sound.h"
#include "constants/event_object_movement.h"
#include "constants/event_objects.h"
#include "constants/maps.h"
#include "constants/rgb.h"
#include "constants/songs.h"

#define CHASE_OVERWORLD_MAX_CHASERS 2
#define CHASE_OVERWORLD_LOCAL_ID_BASE 230
#define CHASE_OVERWORLD_GFX_ID OBJ_EVENT_GFX_MEOWTH
#define CHASE_OVERWORLD_MAX_STALLED_FRAMES 30
#define CHASE_CUE_DISTANCE_CLOSE 3
#define CHASE_CUE_DISTANCE_MEDIUM 6
#define CHASE_CUE_DISTANCE_FAR 10
#define CHASE_CUE_VOLUME_NONE 256
#define CHASE_CUE_VOLUME_LOW 232
#define CHASE_CUE_VOLUME_MEDIUM 208
#define CHASE_CUE_VOLUME_HIGH 184

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
    ResetChaseCues();
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
    u8 activeChasers = ChaseStamina_GetActiveChasers();
    s16 playerX;
    s16 playerY;

    GetPlayerCoordsForChase(&playerX, &playerY);

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
