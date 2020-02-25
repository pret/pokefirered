#include "global.h"
#include "global.fieldmap.h"
#include "field_player_avatar.h"
#include "field_effect.h"
#include "party_menu.h"
#include "event_data.h"
#include "script.h"
#include "fldeff.h"
#include "event_scripts.h"
#include "sound.h"
#include "overworld.h"
#include "event_object_movement.h"
#include "constants/songs.h"
#include "constants/event_objects.h"
#include "constants/event_object_movement.h"
#include "constants/maps.h"

static void task08_080C9820(u8 taskId);
static void sub_80C98FC(u8 taskId);
static void sub_80C98B0(u8 taskId);
static void sub_80C99A0(u8 taskId);
static void sub_80C9A10(void);
static void sub_80C9A60(void);

EWRAM_DATA struct MapPosition gPlayerFacingPosition = {};

bool8 CheckObjectGraphicsInFrontOfPlayer(u8 graphicsId)
{
    u8 mapObjId;

    GetXYCoordsOneStepInFrontOfPlayer(&gPlayerFacingPosition.x, &gPlayerFacingPosition.y);
    gPlayerFacingPosition.height = PlayerGetZCoord();
    mapObjId = GetObjectEventIdByXYZ(gPlayerFacingPosition.x, gPlayerFacingPosition.y, gPlayerFacingPosition.height);
    if (gObjectEvents[mapObjId].graphicsId != graphicsId)
        return FALSE;
    gSpecialVar_LastTalked = gObjectEvents[mapObjId].localId;
    return TRUE;
}

u8 oei_task_add(void)
{
    GetXYCoordsOneStepInFrontOfPlayer(&gPlayerFacingPosition.x, &gPlayerFacingPosition.y);
    return CreateTask(task08_080C9820, 8);
}

static void task08_080C9820(u8 taskId)
{
    u8 mapObjId;

    ScriptContext2_Enable();
    gPlayerAvatar.unk6 = TRUE;
    mapObjId = gPlayerAvatar.objectEventId;
    if (!ObjectEventIsMovementOverridden(&gObjectEvents[mapObjId])
     || ObjectEventClearHeldMovementIfFinished(&gObjectEvents[mapObjId]))
    {
        if (gMapHeader.mapType == MAP_TYPE_UNDERWATER)
        {
            FieldEffectStart(FLDEFF_FIELD_MOVE_SHOW_MON_INIT);
            gTasks[taskId].func = sub_80C98FC;
        }
        else
        {
            sub_805CB70();
            ObjectEventSetHeldMovement(&gObjectEvents[mapObjId], MOVEMENT_ACTION_UNKNOWN_STEP_45);
            gTasks[taskId].func = sub_80C98B0;
        }
    }
}

static void sub_80C98B0(u8 taskId)
{
    if (ObjectEventCheckHeldMovementStatus(&gObjectEvents[gPlayerAvatar.objectEventId]) == TRUE)
    {
        FieldEffectStart(FLDEFF_FIELD_MOVE_SHOW_MON_INIT);
        gTasks[taskId].func = sub_80C98FC;
    }
}

static void sub_80C98FC(u8 taskId)
{
    if (!FieldEffectActiveListContains(FLDEFF_FIELD_MOVE_SHOW_MON))
    {
        gFieldEffectArguments[1] = GetPlayerFacingDirection();
        if (gFieldEffectArguments[1] == 1)
            gFieldEffectArguments[2] = 0;
        if (gFieldEffectArguments[1] == 2)
            gFieldEffectArguments[2] = 1;
        if (gFieldEffectArguments[1] == 3)
            gFieldEffectArguments[2] = 2;
        if (gFieldEffectArguments[1] == 4)
            gFieldEffectArguments[2] = 3;
        ObjectEventSetGraphicsId(&gObjectEvents[gPlayerAvatar.objectEventId], GetPlayerAvatarGraphicsIdByCurrentState());
        StartSpriteAnim(&gSprites[gPlayerAvatar.spriteId], gFieldEffectArguments[2]);
        FieldEffectActiveListRemove(6);
        gTasks[taskId].func = sub_80C99A0;
    }
}

static void sub_80C99A0(u8 taskId)
{
    FLDEFF_CALL_FUNC_IN_DATA();
    gPlayerAvatar.unk6 = FALSE;
    DestroyTask(taskId);
}

bool8 SetUpFieldMove_RockSmash(void)
{
    if (CheckObjectGraphicsInFrontOfPlayer(OBJ_EVENT_GFX_ROCK_SMASH_ROCK) == TRUE)
    {
        gFieldCallback2 = FieldCallback_PrepareFadeInFromMenu;
        gPostMenuFieldCallback = sub_80C9A10;
        return TRUE;
    }
    return FALSE;
}

static void sub_80C9A10(void)
{
    gFieldEffectArguments[0] = GetCursorSelectionMonId();
    ScriptContext1_SetupScript(EventScript_FldEffRockSmash);
}

bool8 FldEff_UseRockSmash(void)
{
    u8 taskId = oei_task_add();

    FLDEFF_SET_FUNC_TO_DATA(sub_80C9A60);
    IncrementGameStat(GAME_STAT_USED_ROCK_SMASH);
    return FALSE;
}

static void sub_80C9A60(void)
{
    PlaySE(SE_W088);
    FieldEffectActiveListRemove(FLDEFF_USE_ROCK_SMASH);
    EnableBothScriptContexts();
}
