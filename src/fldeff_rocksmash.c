#include "global.h"
#include "gflib.h"
#include "field_player_avatar.h"
#include "field_effect.h"
#include "party_menu.h"
#include "event_data.h"
#include "script.h"
#include "fldeff.h"
#include "event_scripts.h"
#include "overworld.h"
#include "event_object_movement.h"
#include "constants/songs.h"
#include "constants/event_objects.h"
#include "constants/event_object_movement.h"
#include "constants/maps.h"

static void Task_FieldEffectShowMon_Init(u8 taskId);
static void Task_FieldEffectShowMon_WaitFldeff(u8 taskId);
static void Task_FieldEffectShowMon_WaitPlayerAnim(u8 taskId);
static void Task_FieldEffectShowMon_Cleanup(u8 taskId);
static void FieldCallback_UseRockSmash(void);
static void StartRockSmashFieldEffect(void);

EWRAM_DATA struct MapPosition gPlayerFacingPosition = {};

bool8 CheckObjectGraphicsInFrontOfPlayer(u8 graphicsId)
{
    u8 mapObjId;

    GetXYCoordsOneStepInFrontOfPlayer(&gPlayerFacingPosition.x, &gPlayerFacingPosition.y);
    gPlayerFacingPosition.elevation = PlayerGetElevation();
    mapObjId = GetObjectEventIdByPosition(gPlayerFacingPosition.x, gPlayerFacingPosition.y, gPlayerFacingPosition.elevation);
    if (gObjectEvents[mapObjId].graphicsId != graphicsId)
        return FALSE;
    gSpecialVar_LastTalked = gObjectEvents[mapObjId].localId;
    return TRUE;
}

u8 CreateFieldEffectShowMon(void)
{
    GetXYCoordsOneStepInFrontOfPlayer(&gPlayerFacingPosition.x, &gPlayerFacingPosition.y);
    return CreateTask(Task_FieldEffectShowMon_Init, 8);
}

static void Task_FieldEffectShowMon_Init(u8 taskId)
{
    u8 mapObjId;

    LockPlayerFieldControls();
    gPlayerAvatar.preventStep = TRUE;
    mapObjId = gPlayerAvatar.objectEventId;
    if (!ObjectEventIsMovementOverridden(&gObjectEvents[mapObjId])
     || ObjectEventClearHeldMovementIfFinished(&gObjectEvents[mapObjId]))
    {
        if (gMapHeader.mapType == MAP_TYPE_UNDERWATER)
        {
            // Leftover from RS, inhibits the player anim while underwater.
            FieldEffectStart(FLDEFF_FIELD_MOVE_SHOW_MON_INIT);
            gTasks[taskId].func = Task_FieldEffectShowMon_WaitFldeff;
        }
        else
        {
            StartPlayerAvatarSummonMonForFieldMoveAnim();
            ObjectEventSetHeldMovement(&gObjectEvents[mapObjId], MOVEMENT_ACTION_START_ANIM_IN_DIRECTION);
            gTasks[taskId].func = Task_FieldEffectShowMon_WaitPlayerAnim;
        }
    }
}

static void Task_FieldEffectShowMon_WaitPlayerAnim(u8 taskId)
{
    if (ObjectEventCheckHeldMovementStatus(&gObjectEvents[gPlayerAvatar.objectEventId]) == TRUE)
    {
        FieldEffectStart(FLDEFF_FIELD_MOVE_SHOW_MON_INIT);
        gTasks[taskId].func = Task_FieldEffectShowMon_WaitFldeff;
    }
}

static void Task_FieldEffectShowMon_WaitFldeff(u8 taskId)
{
    if (!FieldEffectActiveListContains(FLDEFF_FIELD_MOVE_SHOW_MON))
    {
        gFieldEffectArguments[1] = GetPlayerFacingDirection();
        if (gFieldEffectArguments[1] == DIR_SOUTH)
            gFieldEffectArguments[2] = 0;
        if (gFieldEffectArguments[1] == DIR_NORTH)
            gFieldEffectArguments[2] = 1;
        if (gFieldEffectArguments[1] == DIR_WEST)
            gFieldEffectArguments[2] = 2;
        if (gFieldEffectArguments[1] == DIR_EAST)
            gFieldEffectArguments[2] = 3;
        ObjectEventSetGraphicsId(&gObjectEvents[gPlayerAvatar.objectEventId], GetPlayerAvatarGraphicsIdByCurrentState());
        StartSpriteAnim(&gSprites[gPlayerAvatar.spriteId], gFieldEffectArguments[2]);
        FieldEffectActiveListRemove(FLDEFF_FIELD_MOVE_SHOW_MON);
        gTasks[taskId].func = Task_FieldEffectShowMon_Cleanup;
    }
}

static void Task_FieldEffectShowMon_Cleanup(u8 taskId)
{
    FLDEFF_CALL_FUNC_IN_DATA();
    gPlayerAvatar.preventStep = FALSE;
    DestroyTask(taskId);
}

bool8 SetUpFieldMove_RockSmash(void)
{
    if (CheckObjectGraphicsInFrontOfPlayer(OBJ_EVENT_GFX_ROCK_SMASH_ROCK) == TRUE)
    {
        gFieldCallback2 = FieldCallback_PrepareFadeInFromMenu;
        gPostMenuFieldCallback = FieldCallback_UseRockSmash;
        return TRUE;
    }
    return FALSE;
}

static void FieldCallback_UseRockSmash(void)
{
    gFieldEffectArguments[0] = GetCursorSelectionMonId();
    ScriptContext_SetupScript(EventScript_FldEffRockSmash);
}

bool8 FldEff_UseRockSmash(void)
{
    u8 taskId = CreateFieldEffectShowMon();

    FLDEFF_SET_FUNC_TO_DATA(StartRockSmashFieldEffect);
    IncrementGameStat(GAME_STAT_USED_ROCK_SMASH);
    return FALSE;
}

static void StartRockSmashFieldEffect(void)
{
    PlaySE(SE_M_ROCK_THROW);
    FieldEffectActiveListRemove(FLDEFF_USE_ROCK_SMASH);
    ScriptContext_Enable();
}
