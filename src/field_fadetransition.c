#include "global.h"
#include "gflib.h"
#include "cable_club.h"
#include "event_object_lock.h"
#include "event_object_movement.h"
#include "field_door.h"
#include "field_effect.h"
#include "field_fadetransition.h"
#include "field_player_avatar.h"
#include "field_screen_effect.h"
#include "field_specials.h"
#include "field_weather.h"
#include "fieldmap.h"
#include "fldeff.h"
#include "follower_npc.h"
#include "link.h"
#include "map_preview_screen.h"
#include "metatile_behavior.h"
#include "overworld.h"
#include "quest_log.h"
#include "script.h"
#include "start_menu.h"
#include "task.h"
#include "constants/songs.h"
#include "constants/event_object_movement.h"
#include "constants/event_objects.h"
#include "constants/field_weather.h"

static void ExitWarpFadeInScreen(u8 playerNotMoving);
static void Task_ExitDoor(u8 taskId);
static void Task_ExitNonAnimDoor(u8 taskId);
static void Task_ExitNonDoor(u8 taskId);
static void Task_TeleportWarpIn(u8 taskId);
static void Task_Teleport2Warp(u8 taskId);
static void Task_TeleportWarp(u8 taskId);
static void Task_DoorWarp(u8 taskId);
static void Task_StairWarp(u8 taskId);
static void ForceStairsMovement(u16 metatileBehavior, s16 *x, s16 *y);
static void GetStairsMovementDirection(u8 metatileBehavior, s16 *x, s16 *y);
static void UpdateStairsMovement(s16 speedX, s16 speedY, s16 *offsetX, s16 *offsetY, s16 *timer);
static void Task_ExitStairs(u8 taskId);
static void ExitStairsMovement(s16 *speedX, s16 *speedY, s16 *offsetX, s16 *offsetY, s16 *timer);
static bool8 WaitStairExitMovementFinished(s16 *speedX, s16 *speedY, s16 *offsetX, s16 *offsetY, s16 *timer);

void palette_bg_faded_fill_white(void)
{
    CpuFastFill16(RGB_WHITE, gPlttBufferFaded, PLTT_SIZE);
}

void palette_bg_faded_fill_black(void)
{
    CpuFastFill16(RGB_BLACK, gPlttBufferFaded, PLTT_SIZE);
}

void WarpFadeInScreen(void)
{
    switch (MapTransitionIsExit(GetLastUsedWarpMapType(), GetCurrentMapType()))
    {
    case FALSE:
        palette_bg_faded_fill_black();
        FadeScreen(FADE_FROM_BLACK, 0);
        palette_bg_faded_fill_black();
        break;
    case TRUE:
        palette_bg_faded_fill_white();
        FadeScreen(FADE_FROM_WHITE, 0);
        palette_bg_faded_fill_white();
        break;
    }
}

static void WarpFadeInScreenWithDelay(void)
{
    switch (MapTransitionIsExit(GetLastUsedWarpMapType(), GetCurrentMapType()))
    {
    case FALSE:
        palette_bg_faded_fill_black();
        // delay changed from 3 to 4
        // fixes DNS palette issue
        // e.g. fat man in pallet town
        FadeScreen(FADE_FROM_BLACK, 4);
        palette_bg_faded_fill_black();
        break;
    case TRUE:
        palette_bg_faded_fill_white();
        FadeScreen(FADE_FROM_WHITE, 3);
        palette_bg_faded_fill_white();
        break;
    }
}

void FadeInFromBlack(void)
{
    palette_bg_faded_fill_black();
    FadeScreen(FADE_FROM_BLACK, 0);
    palette_bg_faded_fill_black();
}

void WarpFadeOutScreen(void)
{
    const struct MapHeader *header = GetDestinationWarpMapHeader();
    if (header->regionMapSectionId != gMapHeader.regionMapSectionId && MapHasPreviewScreen(header->regionMapSectionId, MPS_TYPE_CAVE))
        FadeScreen(FADE_TO_BLACK, 0);
    else
    {
        switch (MapTransitionIsEnter(GetCurrentMapType(), header->mapType))
        {
        case FALSE:
            FadeScreen(FADE_TO_BLACK, 0);
            break;
        case TRUE:
            FadeScreen(FADE_TO_WHITE, 0);
            break;
        }
    }
}

static void SetPlayerVisibility(bool8 visible)
{
    SetPlayerInvisibility(!visible);
}

static void Task_ContinueScriptUnionRoom(u8 taskId)
{
    if (FieldFadeTransitionBackgroundEffectIsFinished() == TRUE)
        DestroyTask(taskId);
}

void FieldCB_ContinueScriptUnionRoom(void)
{
    LockPlayerFieldControls();
    Overworld_PlaySpecialMapMusic();
    FadeInFromBlack();
    CreateTask(Task_ContinueScriptUnionRoom, 10);
}

static void Task_ContinueScript(u8 taskId)
{
    if (FieldFadeTransitionBackgroundEffectIsFinished() == TRUE)
    {
        DestroyTask(taskId);
        ScriptContext_Enable();
    }
}

void FieldCB_ContinueScriptHandleMusic(void)
{
    LockPlayerFieldControls();
    Overworld_PlaySpecialMapMusic();
    FadeInFromBlack();
    CreateTask(Task_ContinueScript, 10);
}

void FieldCB_ContinueScript(void)
{
    LockPlayerFieldControls();
    FadeInFromBlack();
    CreateTask(Task_ContinueScript, 10);
}

static void Task_ReturnToFieldCableLink(u8 taskId)
{
    struct Task *task = &gTasks[taskId];
    switch (task->data[0])
    {
    case 0:
        task->data[1] = CreateTask_ReestablishCableClubLink();
        task->data[0]++;
        break;
    case 1:
        if (gTasks[task->data[1]].isActive != TRUE)
        {
            WarpFadeInScreen();
            task->data[0]++;
        }
        break;
    case 2:
        if (FieldFadeTransitionBackgroundEffectIsFinished() == TRUE)
        {
            UnlockPlayerFieldControls();
            DestroyTask(taskId);
        }
        break;
    }
}

void FieldCB_ReturnToFieldCableLink(void)
{
    LockPlayerFieldControls();
    Overworld_PlaySpecialMapMusic();
    palette_bg_faded_fill_black();
    CreateTask(Task_ReturnToFieldCableLink, 10);
}

static void Task_ReturnToFieldRecordMixing(u8 taskId)
{
    struct Task *task = &gTasks[taskId];
    switch (task->data[0])
    {
    case 0:
        SetLinkStandbyCallback();
        task->data[0]++;
        break;
    case 1:
        if (IsLinkTaskFinished())
        {
            WarpFadeInScreen();
            task->data[0]++;
        }
        break;
    case 2:
        if (FieldFadeTransitionBackgroundEffectIsFinished() == TRUE)
        {
            StartSendingKeysToLink();
            UnlockPlayerFieldControls();
            DestroyTask(taskId);
        }
        break;
    }
}

void FieldCB_ReturnToFieldWirelessLink(void)
{
    LockPlayerFieldControls();
    Overworld_PlaySpecialMapMusic();
    palette_bg_faded_fill_black();
    CreateTask(Task_ReturnToFieldRecordMixing, 10);
}

static void SetUpWarpExitTask(bool8 playerNotMoving)
{
    s16 x, y;
    u32 metatileBehavior;
    TaskFunc func;

    PlayerGetDestCoords(&x, &y);
    metatileBehavior = MapGridGetMetatileBehaviorAt(x, y);
    if (MetatileBehavior_IsWarpDoor_2(metatileBehavior) == TRUE)
    {
        func = Task_ExitDoor;
        switch (MapTransitionIsExit(GetLastUsedWarpMapType(), GetCurrentMapType()))
        {
        case FALSE:
            palette_bg_faded_fill_black();
            break;
        case TRUE:
            palette_bg_faded_fill_white();
            break;
        }
    }
    else
    {
        ExitWarpFadeInScreen(playerNotMoving);
        if (MetatileBehavior_IsNonAnimDoor(metatileBehavior) == TRUE)
            func = Task_ExitNonAnimDoor;
        else if (MetatileBehavior_IsDirectionalStairWarp(metatileBehavior) == TRUE)
        {
            u8 tmp = gExitStairsMovementDisabled;
            func = Task_ExitNonDoor;
            if (!tmp)
                func = Task_ExitStairs;
        }
        else
            func = Task_ExitNonDoor;
    }
    gExitStairsMovementDisabled = FALSE;
    CreateTask(func, 10);
}

static void ExitWarpFadeInScreen(bool8 playerNotMoving)

{
    if (!playerNotMoving)
        WarpFadeInScreen();
    else
        FadeInFromBlack();
}

void FieldCB_DefaultWarpExit(void)
{
    Overworld_PlaySpecialMapMusic();
    QuestLog_DrawPreviouslyOnQuestHeaderIfInPlaybackMode();
    SetUpWarpExitTask(FALSE);
    FollowerNPC_WarpSetEnd();
    LockPlayerFieldControls();
}

void FieldCB_WarpExitFadeFromBlack(void)
{
    Overworld_PlaySpecialMapMusic();
    QuestLog_DrawPreviouslyOnQuestHeaderIfInPlaybackMode();
    SetUpWarpExitTask(TRUE);
    LockPlayerFieldControls();
}

static void FieldCB_TeleportWarpIn(void)
{
    Overworld_PlaySpecialMapMusic();
    WarpFadeInScreen();
    QuestLog_DrawPreviouslyOnQuestHeaderIfInPlaybackMode();
    PlaySE(SE_WARP_OUT);
    CreateTask(Task_TeleportWarpIn, 10);
    LockPlayerFieldControls();
}

static void Task_ExitDoor(u8 taskId)
{
    struct Task *task = &gTasks[taskId];
    s16 *x = &task->data[2];
    s16 *y = &task->data[3];

    if (task->data[0] == 0)
        task->data[0] = 5;

    switch (task->data[0])
    {
    case 0: // Never reached
        HideNPCFollower();
        SetPlayerVisibility(0);
        FreezeObjectEvents();
        PlayerGetDestCoords(x, y);
        FieldSetDoorOpened(*x, *y);
        task->data[0] = 1;
        break;
    case 5:
        SetPlayerVisibility(0);
        FreezeObjectEvents();
        DoOutwardBarnDoorWipe();
        WarpFadeInScreenWithDelay();
        task->data[0] = 6;
        break;
    case 6:
        task->data[15]++;
        if (task->data[15] == 25)
        {
            PlayerGetDestCoords(x, y);
            PlaySE(GetDoorSoundEffect(*x, *y));
            FieldAnimateDoorOpen(*x, *y);
            task->data[0] = 7;
        }
        break;
    case 7:
        if (!FieldIsDoorAnimationRunning())
        {
            PlayerGetDestCoords(&task->data[12], &task->data[13]);
            SetPlayerVisibility(TRUE);
            ObjectEventSetHeldMovement(&gObjectEvents[GetObjectEventIdByLocalIdAndMap(LOCALID_PLAYER, 0, 0)], MOVEMENT_ACTION_WALK_NORMAL_DOWN);
            task->data[0] = 8;
        }
        break;
    case 8:
        task->data[14]++;
        if (task->data[14] == 14)
        {
            FieldAnimateDoorClose(task->data[12], task->data[13]);
            task->data[0] = 9;
        }
        break;
    case 9:
        if (FieldFadeTransitionBackgroundEffectIsFinished() && IsPlayerStandingStill() && !FieldIsDoorAnimationRunning() && !FuncIsActiveTask(Task_BarnDoorWipe))
        {
            ObjectEventClearHeldMovementIfFinished(&gObjectEvents[GetObjectEventIdByLocalIdAndMap(LOCALID_PLAYER, 0, 0)]);
            task->data[0] = 4;
        }
        break;
    // Legacy RS
    case 1:
        if (FieldFadeTransitionBackgroundEffectIsFinished())
        {
            SetPlayerVisibility(TRUE);
            ObjectEventSetHeldMovement(&gObjectEvents[GetObjectEventIdByLocalIdAndMap(LOCALID_PLAYER, 0, 0)], MOVEMENT_ACTION_WALK_NORMAL_DOWN);
            task->data[0] = 2;
        }
        break;
    case 2:
        if (IsPlayerStandingStill())
        {
            task->data[1] = FieldAnimateDoorClose(*x, *y);
            ObjectEventClearHeldMovementIfFinished(&gObjectEvents[GetObjectEventIdByLocalIdAndMap(LOCALID_PLAYER, 0, 0)]);
            task->data[0] = 3;
        }
        break;
    case 3:
        if (task->data[1] < 0 || gTasks[task->data[1]].isActive != TRUE)
        {
            FollowerNPC_SetIndicatorToComeOutDoor();
            FollowerNPC_WarpSetEnd();
            task->data[0] = 4;
        }
        break;
    case 4:
        UnfreezeObjectEvents();
        UnlockPlayerFieldControls();
        DestroyTask(taskId);
        break;
    }
}

static void Task_ExitNonAnimDoor(u8 taskId)
{
    struct Task *task = &gTasks[taskId];
    s16 *x = &task->data[2];
    s16 *y = &task->data[3];

    switch (task->data[0])
    {
    case 0:
        HideNPCFollower();
        SetPlayerVisibility(0);
        FreezeObjectEvents();
        PlayerGetDestCoords(x, y);
        task->data[0] = 1;
        break;
    case 1:
        if (FieldFadeTransitionBackgroundEffectIsFinished())
        {
            SetPlayerVisibility(TRUE);
            ObjectEventSetHeldMovement(&gObjectEvents[GetObjectEventIdByLocalIdAndMap(LOCALID_PLAYER, 0, 0)], GetWalkNormalMovementAction(GetPlayerFacingDirection()));
            task->data[0] = 2;
        }
        break;
    case 2:
        if (IsPlayerStandingStill())
        {
            if (!MetatileBehavior_IsDeepSouthWarp(MapGridGetMetatileBehaviorAt(*x, *y + 1)))
                FollowerNPC_SetIndicatorToComeOutDoor();
            // TODO: Add specific follower door warp behavior for MB_DEEP_SOUTH_WARP.

            FollowerNPC_WarpSetEnd();
            task->data[0] = 3;
        }
        break;
    case 3:
        UnfreezeObjectEvents();
        UnlockPlayerFieldControls();
        DestroyTask(taskId);
        break;
    }
}

static void Task_ExitNonDoor(u8 taskId)
{
    switch (gTasks[taskId].data[0])
    {
    case 0:
        FreezeObjectEvents();
        LockPlayerFieldControls();
        gTasks[taskId].data[0]++;
        break;
    case 1:
        if (FieldFadeTransitionBackgroundEffectIsFinished())
        {
            UnfreezeObjectEvents();
            UnlockPlayerFieldControls();
            DestroyTask(taskId);
        }
        break;
    }
}

static void Task_TeleportWarpIn(u8 taskId)
{
    switch (gTasks[taskId].data[0])
    {
    case 0:
        FreezeObjectEvents();
        LockPlayerFieldControls();
        StartTeleportInPlayerAnim();
        gTasks[taskId].data[0]++;
        break;
    case 1:
        if (FieldFadeTransitionBackgroundEffectIsFinished() && WaitTeleportInPlayerAnim() != TRUE)
        {
            FollowerNPC_WarpSetEnd();
            UnfreezeObjectEvents();
            UnlockPlayerFieldControls();
            DestroyTask(taskId);
        }
        break;
    }
}

static void Task_WaitFadeAndCreateStartMenuTask(u8 taskId)
{
    if (FieldFadeTransitionBackgroundEffectIsFinished() == TRUE)
    {
        DestroyTask(taskId);
        CreateTask(Task_StartMenuHandleInput, 80);
    }
}

void FadeTransition_FadeInOnReturnToStartMenu(void)
{
    FadeInFromBlack();
    CreateTask(Task_WaitFadeAndCreateStartMenuTask, 80);
    LockPlayerFieldControls();
}

bool8 FieldCB_ReturnToFieldOpenStartMenu(void)
{
    SetUpReturnToStartMenu();
    return FALSE;
}

static void Task_SafariZoneRanOutOfBalls(u8 taskId)
{
    if (FieldFadeTransitionBackgroundEffectIsFinished() == TRUE)
    {
        UnlockPlayerFieldControls();
        DestroyTask(taskId);
        ClearPlayerHeldMovementAndUnfreezeObjectEvents();
    }
}

void FieldCB_SafariZoneRanOutOfBalls(void)
{
    LockPlayerFieldControls();
    Overworld_PlaySpecialMapMusic();
    FadeInFromBlack();
    CreateTask(Task_SafariZoneRanOutOfBalls, 10);
}

static bool32 WaitWarpFadeOutScreen(void)
{
    return gPaletteFade.active;
}

bool32 FieldFadeTransitionBackgroundEffectIsFinished(void)
{
    if (IsWeatherNotFadingIn() == TRUE && ForestMapPreviewScreenIsRunning())
        return TRUE;
    else
        return FALSE;
}

void DoWarp(void)
{
    LockPlayerFieldControls();
    TryFadeOutOldMapMusic();
    WarpFadeOutScreen();
    PlayRainStoppingSoundEffect();
    PlaySE(SE_EXIT);
    gFieldCallback = FieldCB_DefaultWarpExit;
    CreateTask(Task_Teleport2Warp, 10);
}

void DoDiveWarp(void)
{
    LockPlayerFieldControls();
    TryFadeOutOldMapMusic();
    WarpFadeOutScreen();
    PlayRainStoppingSoundEffect();
    SetFollowerNPCData(FNPC_DATA_COME_OUT_DOOR, FNPC_DOOR_NONE);
    gFieldCallback = FieldCB_DefaultWarpExit;
    CreateTask(Task_Teleport2Warp, 10);
}

void DoStairWarp(u16 metatileBehavior, u16 delay)
{
    u8 taskId = CreateTask(Task_StairWarp, 10);
    gTasks[taskId].data[1] = metatileBehavior;
    gTasks[taskId].data[15] = delay;
    Task_StairWarp(taskId);
}

void DoDoorWarp(void)
{
    LockPlayerFieldControls();
    gFieldCallback = FieldCB_DefaultWarpExit;
    CreateTask(Task_DoorWarp, 10);
}

void DoTeleport2Warp(void)
{
    LockPlayerFieldControls();
    CreateTask(Task_Teleport2Warp, 10);
    gFieldCallback = FieldCB_TeleportWarpIn;
}

void DoUnionRoomWarp(void)
{
    LockPlayerFieldControls();
    gFieldCallback = FieldCB_DefaultWarpExit;
    CreateTask(Task_TeleportWarp, 10);
}

void DoFallWarp(void)
{
    DoDiveWarp();
    gFieldCallback = FieldCB_FallWarpExit;
}

void DoEscalatorWarp(u8 metatileBehavior)
{
    LockPlayerFieldControls();
    StartEscalatorWarp(metatileBehavior, 10);
}

void DoLavaridgeGymB1FWarp(void)
{
    LockPlayerFieldControls();
    StartLavaridgeGymB1FWarp(10);
}

void DoLavaridgeGym1FWarp(void)
{
    LockPlayerFieldControls();
    StartLavaridgeGym1FWarp(10);
}

void DoTeleportWarp(void)
{
    LockPlayerFieldControls();
    TryFadeOutOldMapMusic();
    CreateTask(Task_TeleportWarp, 10);
    gFieldCallback = FieldCB_TeleportWarpIn;
}

static void Task_CableClubWarp(u8 taskId)
{
    struct Task *task = &gTasks[taskId];
    switch (task->data[0])
    {
    case 0:
        LockPlayerFieldControls();
        task->data[0]++;
        break;
    case 1:
        if (!WaitWarpFadeOutScreen() && BGMusicStopped())
            task->data[0]++;
        break;
    case 2:
        WarpIntoMap();
        SetMainCallback2(CB2_ReturnToFieldCableClub);
        DestroyTask(taskId);
        break;
    }
}

void DoCableClubWarp(void)
{
    LockPlayerFieldControls();
    TryFadeOutOldMapMusic();
    WarpFadeOutScreen();
    PlaySE(SE_EXIT);
    CreateTask(Task_CableClubWarp, 10);
}

static void Task_ReturnFromLinkRoomWarp(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    switch (data[0])
    {
    case 0:
        ClearLinkCallback_2();
        FadeScreen(FADE_TO_BLACK, 0);
        TryFadeOutOldMapMusic();
        PlaySE(SE_EXIT);
        data[0]++;
        break;
    case 1:
        if (!WaitWarpFadeOutScreen() && BGMusicStopped())
        {
            SetCloseLinkCallback();
            data[0]++;
        }
        break;
    case 2:
        if (!gReceivedRemoteLinkPlayers)
        {
            WarpIntoMap();
            SetMainCallback2(CB2_LoadMap);
            DestroyTask(taskId);
        }
        break;
    }
}

void ReturnFromLinkRoom(void)
{
    CreateTask(Task_ReturnFromLinkRoomWarp, 10);
}

static void Task_Teleport2Warp(u8 taskId)
{
    struct Task *task = &gTasks[taskId];
    switch (task->data[0])
    {
    case 0:
        FreezeObjectEvents();
        LockPlayerFieldControls();
        task->data[0]++;
        break;
    case 1:
        if (!WaitWarpFadeOutScreen() && BGMusicStopped())
            task->data[0]++;
        break;
    case 2:
        WarpIntoMap();
        SetMainCallback2(CB2_LoadMap);
        DestroyTask(taskId);
        break;
    }
}

static void Task_TeleportWarp(u8 taskId)
{
    struct Task *task = &gTasks[taskId];
    switch (task->data[0])
    {
    case 0:
        FreezeObjectEvents();
        LockPlayerFieldControls();
        PlaySE(SE_WARP_IN);
        StartTeleportWarpOutPlayerAnim();
        task->data[0]++;
        break;
    case 1:
        if (!WaitTeleportWarpOutPlayerAnim())
        {
            WarpFadeOutScreen();
            task->data[0]++;
        }
        break;
    case 2:
        if (!WaitWarpFadeOutScreen() && BGMusicStopped())
            task->data[0]++;
        break;
    case 3:
        WarpIntoMap();
        SetMainCallback2(CB2_LoadMap);
        DestroyTask(taskId);
        break;
    }
}

#define tState       data[0]
#define tDoorTask   data[1]

enum
{
    DOORWARP_OPEN_DOOR,
    DOORWARP_START_WALK_UP,
    DOORWARP_HIDE_PLAYER,
    DOORWARP_WAIT_DOOR_ANIM_TASK,
    DOORWARP_DO_WARP
};

static void Task_DoorWarp(u8 taskId)
{
    struct Task *task = &gTasks[taskId];
    s16 *xp = &task->data[2];
    s16 *yp = &task->data[3];
    u8 playerObjId = gPlayerAvatar.objectEventId;
    u8 followerObjId = GetFollowerNPCObjectId();
    struct ObjectEvent *followerObject = GetFollowerObject();

    switch (task->tState)
    {
    case DOORWARP_OPEN_DOOR:
        // Stop running.
        if (TestPlayerAvatarFlags(PLAYER_AVATAR_FLAG_DASH))
            SetPlayerAvatarTransitionFlags(PLAYER_AVATAR_FLAG_ON_FOOT);

        // Just in case came out and went right back in, reset follower NPC door state.
        SetFollowerNPCData(FNPC_DATA_COME_OUT_DOOR, FNPC_DOOR_NONE);
        FreezeObjectEvents();
        PlayerGetDestCoords(xp, yp);
        PlaySE(GetDoorSoundEffect(*xp, *yp - 1));
        if (followerObject)
        {
            // Put follower into pokeball
            ClearObjectEventMovement(followerObject, &gSprites[followerObject->spriteId]);
            ObjectEventSetHeldMovement(followerObject, MOVEMENT_ACTION_ENTER_POKEBALL);
        }
        task->tDoorTask = FieldAnimateDoorOpen(*xp, *yp - 1);
        task->tState = DOORWARP_START_WALK_UP;
        break;
    case DOORWARP_START_WALK_UP:
        if (task->tDoorTask < 0 || gTasks[task->tDoorTask].isActive != TRUE)
        {
            ObjectEventClearHeldMovementIfActive(&gObjectEvents[GetObjectEventIdByLocalIdAndMap(LOCALID_PLAYER, 0, 0)]);
            ObjectEventSetHeldMovement(&gObjectEvents[GetObjectEventIdByLocalIdAndMap(LOCALID_PLAYER, 0, 0)], MOVEMENT_ACTION_WALK_NORMAL_UP);

            if (PlayerHasFollowerNPC() && !gObjectEvents[followerObjId].invisible)
            {
                u8 newState = DetermineFollowerNPCState(&gObjectEvents[followerObjId], MOVEMENT_ACTION_WALK_NORMAL_UP,
                                                        DetermineFollowerNPCDirection(&gObjectEvents[playerObjId], &gObjectEvents[followerObjId]));
                ObjectEventClearHeldMovementIfActive(&gObjectEvents[followerObjId]);
                ObjectEventSetHeldMovement(&gObjectEvents[followerObjId], newState);
            }
            task->tState = DOORWARP_HIDE_PLAYER;
        }
        break;
    case DOORWARP_HIDE_PLAYER:
        if (IsPlayerStandingStill())
        {
            // Don't close door on NPC follower.
            if (!PlayerHasFollowerNPC() || gObjectEvents[followerObjId].invisible)
                task->tDoorTask = FieldAnimateDoorClose(*xp, *yp - 1);

            task->data[1] = FieldAnimateDoorClose(*xp, *yp - 1);
            ObjectEventClearHeldMovementIfFinished(&gObjectEvents[GetObjectEventIdByLocalIdAndMap(LOCALID_PLAYER, 0, 0)]);
            SetPlayerVisibility(FALSE);
            task->tState = DOORWARP_WAIT_DOOR_ANIM_TASK;
        }
        break;
    case DOORWARP_WAIT_DOOR_ANIM_TASK:
        if (task->tDoorTask < 0 || gTasks[task->tDoorTask].isActive != TRUE)
            task->tState = DOORWARP_DO_WARP;
        break;
    case DOORWARP_DO_WARP:
        if (PlayerHasFollowerNPC())
        {
            ObjectEventClearHeldMovementIfActive(&gObjectEvents[followerObjId]);
            ObjectEventSetHeldMovement(&gObjectEvents[followerObjId], MOVEMENT_ACTION_WALK_NORMAL_UP);
        }

        TryFadeOutOldMapMusic();
        WarpFadeOutScreen();
        PlayRainStoppingSoundEffect();
        task->tState = 0;
        task->func = Task_Teleport2Warp;
        break;
    case 5:
        TryFadeOutOldMapMusic();
        PlayRainStoppingSoundEffect();
        task->data[0] = 0;
        task->func = Task_Teleport2Warp;
        break;
    }
}

#undef tState
#undef tDoorTask

static void Task_StairWarp(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    struct ObjectEvent *playerObj = &gObjectEvents[gPlayerAvatar.objectEventId];
    struct Sprite *playerSpr = &gSprites[gPlayerAvatar.spriteId];
    switch (data[0])
    {
    case 0:
        LockPlayerFieldControls();
        FreezeObjectEvents();
        CameraObjectReset2();
        data[0]++;
        break;
    case 1:
        if (!ObjectEventIsMovementOverridden(playerObj) || ObjectEventClearHeldMovementIfFinished(playerObj))
        {
            if (data[15] != 0)
                data[15]--;
            else
            {
                TryFadeOutOldMapMusic();
                PlayRainStoppingSoundEffect();
                playerSpr->oam.priority = 1;
                ForceStairsMovement(data[1], &data[2], &data[3]);
                PlaySE(SE_EXIT);
                data[0]++;
            }
        }
        break;
    case 2:
        UpdateStairsMovement(data[2], data[3], &data[4], &data[5], &data[6]);
        data[15]++;
        if (data[15] >= 12)
        {
            WarpFadeOutScreen();
            data[0]++;
        }
        break;
    case 3:
        UpdateStairsMovement(data[2], data[3], &data[4], &data[5], &data[6]);
        if (!WaitWarpFadeOutScreen() && BGMusicStopped())
            data[0]++;
        break;
    default:
        gFieldCallback = FieldCB_DefaultWarpExit;
        WarpIntoMap();
        SetMainCallback2(CB2_LoadMap);
        DestroyTask(taskId);
        break;
    }
}

static void UpdateStairsMovement(s16 speedX, s16 speedY, s16 *offsetX, s16 *offsetY, s16 *timer)
{
    struct Sprite *playerSpr = &gSprites[gPlayerAvatar.spriteId];
    struct ObjectEvent *playerObj = &gObjectEvents[gPlayerAvatar.objectEventId];
    if (speedY > 0 || *timer > 6)
        *offsetY += speedY;
    *offsetX += speedX;
    (*timer)++;
    playerSpr->x2 = *offsetX >> 5;
    playerSpr->y2 = *offsetY >> 5;
    if (playerObj->heldMovementFinished)
        ObjectEventForceSetHeldMovement(playerObj, GetWalkInPlaceNormalMovementAction(GetPlayerFacingDirection()));
}

static void ForceStairsMovement(u16 metatileBehavior, s16 *x, s16 *y)
{
    ObjectEventForceSetHeldMovement(&gObjectEvents[gPlayerAvatar.objectEventId], GetWalkInPlaceNormalMovementAction(GetPlayerFacingDirection()));
    GetStairsMovementDirection(metatileBehavior, x, y);
    gObjectEvents[gPlayerAvatar.objectEventId].noShadow = TRUE;
}

static void GetStairsMovementDirection(u8 metatileBehavior, s16 *x, s16 *y)
{
    if (MetatileBehavior_IsDirectionalUpRightStairWarp(metatileBehavior))
    {
        *x = 16;
        *y = -10;
    }
    else if (MetatileBehavior_IsDirectionalUpLeftStairWarp(metatileBehavior))
    {
        *x = -17;
        *y = -10;
    }
    else if (MetatileBehavior_IsDirectionalDownRightStairWarp(metatileBehavior))
    {
        *x = 17;
        *y = 3;
    }
    else if (MetatileBehavior_IsDirectionalDownLeftStairWarp(metatileBehavior))
    {
        *x = -17;
        *y = 3;
    }
    else
    {
        *x = 0;
        *y = 0;
    }
}

static void Task_ExitStairs(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    switch (data[0])
    {
    default:
        if (FieldFadeTransitionBackgroundEffectIsFinished() == TRUE)
        {
            CameraObjectReset1();
            UnlockPlayerFieldControls();
            DestroyTask(taskId);
        }
        break;
    case 0:
        Overworld_PlaySpecialMapMusic();
        WarpFadeInScreen();
        LockPlayerFieldControls();
        ExitStairsMovement(&data[1], &data[2], &data[3], &data[4], &data[5]);
        data[0]++;
        break;
    case 1:
        if (!WaitStairExitMovementFinished(&data[1], &data[2], &data[3], &data[4], &data[5]))
            data[0]++;
        break;
    }
    gObjectEvents[gPlayerAvatar.objectEventId].noShadow = FALSE;
}

static void ExitStairsMovement(s16 *speedX, s16 *speedY, s16 *offsetX, s16 *offsetY, s16 *timer)
{
    s16 x, y;
    u8 metatileBehavior;
    s32 direction;
    struct Sprite *sprite;
    PlayerGetDestCoords(&x, &y);
    metatileBehavior = MapGridGetMetatileBehaviorAt(x, y);
    if (MetatileBehavior_IsDirectionalDownRightStairWarp(metatileBehavior) || MetatileBehavior_IsDirectionalUpRightStairWarp(metatileBehavior))
        direction = DIR_WEST;
    else
        direction = DIR_EAST;
    ObjectEventForceSetHeldMovement(&gObjectEvents[gPlayerAvatar.objectEventId], GetWalkInPlaceFastMovementAction(direction));
    GetStairsMovementDirection(metatileBehavior, speedX, speedY);
    *offsetX = *speedX * 16;
    *offsetY = *speedY * 16;
    *timer = 16;
    sprite = &gSprites[gPlayerAvatar.spriteId];
    sprite->x2 = *offsetX >> 5;
    sprite->y2 = *offsetY >> 5;
    *speedX *= -1;
    *speedY *= -1;
}

static bool8 WaitStairExitMovementFinished(s16 *speedX, s16 *speedY, s16 *offsetX, s16 *offsetY, s16 *timer)
{
    struct Sprite *sprite;
    sprite = &gSprites[gPlayerAvatar.spriteId];
    if (*timer != 0)
    {
        *offsetX += *speedX;
        *offsetY += *speedY;
        sprite->x2 = *offsetX >> 5;
        sprite->y2 = *offsetY >> 5;
        (*timer)--;
        return TRUE;
    }
    else
    {
        sprite->x2 = 0;
        sprite->y2 = 0;
        return FALSE;
    }
}
