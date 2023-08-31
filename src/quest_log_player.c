#include "global.h"
#include "bike.h"
#include "script.h"
#include "task.h"
#include "field_player_avatar.h"
#include "event_object_movement.h"
#include "field_effect.h"
#include "field_effect_helpers.h"
#include "quest_log.h"
#include "quest_log_player.h"

static void QL_GfxTransition_Normal(void);
static void QL_GfxTransition_Bike(void);
static void QL_GfxTransition_Fish(void);
static void Task_QLFishMovement(u8 taskId);
static void QL_GfxTransition_StartSurf(void);
static void QL_GfxTransition_VSSeeker(void);
static void Task_QLVSSeekerMovement(u8 taskId);
static void QL_GfxTransition_StopSurfSouth(void);
static void QL_GfxTransition_StopSurfNorth(void);
static void QL_GfxTransition_StopSurfWest(void);
static void QL_GfxTransition_StopSurfEast(void);
static void QL_SetObjectGraphicsId(struct ObjectEvent *object, u8 graphicsId);

static void (*const sQLGfxTransitions[])(void) = {
    [QL_PLAYER_GFX_NORMAL]      = QL_GfxTransition_Normal,
    [QL_PLAYER_GFX_BIKE]        = QL_GfxTransition_Bike,
    [QL_PLAYER_GFX_FISH]        = QL_GfxTransition_Fish,
    [QL_PLAYER_GFX_SURF]        = QL_GfxTransition_StartSurf,
    [QL_PLAYER_GFX_STOP_SURF_S] = QL_GfxTransition_StopSurfSouth,
    [QL_PLAYER_GFX_STOP_SURF_N] = QL_GfxTransition_StopSurfNorth,
    [QL_PLAYER_GFX_STOP_SURF_W] = QL_GfxTransition_StopSurfWest,
    [QL_PLAYER_GFX_STOP_SURF_E] = QL_GfxTransition_StopSurfEast,
    [QL_PLAYER_GFX_VSSEEKER]    = QL_GfxTransition_VSSeeker
};

void QuestLogUpdatePlayerSprite(u8 state)
{
    if (state < NELEMS(sQLGfxTransitions))
        sQLGfxTransitions[state]();
}

bool32 QuestLogTryRecordPlayerAvatarGfxTransition(u8 state)
{
    if (gQuestLogPlaybackState == QL_PLAYBACK_STATE_RECORDING)
    {
        QuestLogRecordPlayerAvatarGfxTransition(state);
        return TRUE;
    }
    return FALSE;
}

void QuestLogCallUpdatePlayerSprite(u8 state)
{
    return QuestLogUpdatePlayerSprite(state);
}

static void QL_GfxTransition_Normal(void)
{
    struct ObjectEvent *objectEvent = &gObjectEvents[gPlayerAvatar.objectEventId];
    QL_SetObjectGraphicsId(objectEvent, GetPlayerAvatarGraphicsIdByStateId(PLAYER_AVATAR_GFX_NORMAL));
    ObjectEventTurn(objectEvent, objectEvent->movementDirection);
    SetPlayerAvatarStateMask(PLAYER_AVATAR_FLAG_ON_FOOT);
}

static void QL_GfxTransition_Bike(void)
{
    struct ObjectEvent *objectEvent = &gObjectEvents[gPlayerAvatar.objectEventId];
    QL_SetObjectGraphicsId(objectEvent, GetPlayerAvatarGraphicsIdByStateId(PLAYER_AVATAR_GFX_BIKE));
    ObjectEventTurn(objectEvent, objectEvent->movementDirection);
    SetPlayerAvatarStateMask(PLAYER_AVATAR_FLAG_MACH_BIKE);
    BikeClearState(0, 0);
}

static void QL_GfxTransition_Fish(void)
{
    struct ObjectEvent *objectEvent = &gObjectEvents[gPlayerAvatar.objectEventId];
    struct Sprite *sprite = &gSprites[objectEvent->spriteId];

    if (gQuestLogPlaybackState == QL_PLAYBACK_STATE_RUNNING || gQuestLogPlaybackState == QL_PLAYBACK_STATE_ACTION_END)
    {
        u8 taskId;
        LockPlayerFieldControls();
        gPlayerAvatar.preventStep = TRUE;
        taskId = CreateTask(Task_QLFishMovement, 0xFF);
        gTasks[taskId].data[0] = 0;
    }
    else
    {
        QL_SetObjectGraphicsId(objectEvent, GetPlayerAvatarGraphicsIdByStateId(PLAYER_AVATAR_GFX_FISH));
        StartSpriteAnim(sprite, GetFishingDirectionAnimNum(objectEvent->facingDirection));
    }
}

static void Task_QLFishMovement(u8 taskId)
{
    struct ObjectEvent *objectEvent = &gObjectEvents[gPlayerAvatar.objectEventId];
    struct Sprite *sprite = &gSprites[objectEvent->spriteId];

    switch (gTasks[taskId].data[0])
    {
        case 0:
            ObjectEventClearHeldMovementIfActive(objectEvent);
            objectEvent->enableAnim = TRUE;
            QL_SetObjectGraphicsId(objectEvent, GetPlayerAvatarGraphicsIdByStateId(PLAYER_AVATAR_GFX_FISH));
            StartSpriteAnim(sprite, GetFishingDirectionAnimNum(objectEvent->facingDirection));
            gTasks[taskId].data[0]++;
            gTasks[taskId].data[1] = 0;
            break;
        case 1:
            AlignFishingAnimationFrames(sprite);
            if (gTasks[taskId].data[1] < 60)
                gTasks[taskId].data[1]++;
            else
                gTasks[taskId].data[0]++;
            break;
        case 2:
            StartSpriteAnim(sprite, GetFishingNoCatchDirectionAnimNum(GetPlayerFacingDirection()));
            gTasks[taskId].data[0]++;
            break;
        case 3:
            AlignFishingAnimationFrames(sprite);
            if (sprite->animEnded)
            {
                if (!(gPlayerAvatar.flags & PLAYER_AVATAR_FLAG_SURFING))
                    QL_SetObjectGraphicsId(objectEvent, GetPlayerAvatarGraphicsIdByStateId(PLAYER_AVATAR_GFX_NORMAL));
                else
                    QL_SetObjectGraphicsId(objectEvent, GetPlayerAvatarGraphicsIdByStateId(PLAYER_AVATAR_GFX_RIDE));
                ObjectEventTurn(objectEvent, objectEvent->movementDirection);
                sprite->x2 = 0;
                sprite->y2 = 0;
                UnlockPlayerFieldControls();
                DestroyTask(taskId);
            }
            break;
    }
}

static void QL_GfxTransition_StartSurf(void)
{
    struct ObjectEvent *objectEvent = &gObjectEvents[gPlayerAvatar.objectEventId];
    u8 fieldEffectId;

    if (!(gPlayerAvatar.flags & PLAYER_AVATAR_FLAG_SURFING))
    {
        QL_SetObjectGraphicsId(objectEvent, GetPlayerAvatarGraphicsIdByStateId(PLAYER_AVATAR_GFX_RIDE));
        ObjectEventTurn(objectEvent, objectEvent->movementDirection);
        SetPlayerAvatarStateMask(PLAYER_AVATAR_FLAG_SURFING);
        gFieldEffectArguments[0] = objectEvent->currentCoords.x;
        gFieldEffectArguments[1] = objectEvent->currentCoords.y;
        gFieldEffectArguments[2] = gPlayerAvatar.objectEventId;
        fieldEffectId = FieldEffectStart(FLDEFF_SURF_BLOB);
        objectEvent->fieldEffectSpriteId = fieldEffectId;
        SetSurfBlob_BobState(fieldEffectId, BOB_PLAYER_AND_MON);
    }
}

static void QL_GfxTransition_VSSeeker(void)
{
    FieldEffectStart(FLDEFF_USE_VS_SEEKER);
    CreateTask(Task_QLVSSeekerMovement, 0x00);
}

static void Task_QLVSSeekerMovement(u8 taskId)
{
    if (!FieldEffectActiveListContains(FLDEFF_USE_VS_SEEKER))
    {
        UnfreezeObjectEvents();
        UnlockPlayerFieldControls();
        DestroyTask(taskId);
    }
}

static void QL_SetObjectGraphicsId(struct ObjectEvent * object, u8 graphicsId)
{
    ObjectEventSetGraphicsId(object, graphicsId);
}

static void QL_GfxTransition_StopSurfSouth(void)
{
    CreateStopSurfingTask_NoMusicChange(DIR_SOUTH);
}

static void QL_GfxTransition_StopSurfNorth(void)
{
    CreateStopSurfingTask_NoMusicChange(DIR_NORTH);
}

static void QL_GfxTransition_StopSurfWest(void)
{
    CreateStopSurfingTask_NoMusicChange(DIR_WEST);
}

static void QL_GfxTransition_StopSurfEast(void)
{
    CreateStopSurfingTask_NoMusicChange(DIR_EAST);
}
