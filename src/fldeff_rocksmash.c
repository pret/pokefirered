#include "global.h"
#include "global.fieldmap.h"
#include "field_player_avatar.h"
#include "field_effect.h"
#include "party_menu.h"
#include "malloc.h"
#include "event_data.h"
#include "script.h"
#include "fldeff.h"
#include "event_scripts.h"
#include "field_weather.h"
#include "sound.h"
#include "palette.h"
#include "overworld.h"
#include "wild_encounter.h"
#include "field_map_obj.h"
#include "constants/songs.h"
#include "constants/map_objects.h"

static void task08_080C9820(u8 taskId);
static void sub_80C98FC(u8 taskId);
static void sub_80C98B0(u8 taskId);
static void sub_80C99A0(u8 taskId);
static void sub_80C9A10(void);
static void sub_80C9A60(void);

bool8 CheckObjectGraphicsInFrontOfPlayer(u8 graphicsId)
{
    u8 mapObjId;

    GetXYCoordsOneStepInFrontOfPlayer(&gPlayerFacingPosition.x, &gPlayerFacingPosition.y);
    gPlayerFacingPosition.height = PlayerGetZCoord();
    mapObjId = GetFieldObjectIdByXYZ(gPlayerFacingPosition.x, gPlayerFacingPosition.y, gPlayerFacingPosition.height);
    if (gMapObjects[mapObjId].graphicsId != graphicsId)
        return FALSE;
    gSpecialVar_LastTalked = gMapObjects[mapObjId].localId;
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
    mapObjId = gPlayerAvatar.mapObjectId;
    if (!FieldObjectIsMovementOverridden(&gMapObjects[mapObjId])
     || FieldObjectClearHeldMovementIfFinished(&gMapObjects[mapObjId]))
    {
        if (gMapHeader.mapType == MAP_TYPE_UNDERWATER)
        {
            FieldEffectStart(FLDEFF_FIELD_MOVE_SHOW_MON_INIT);
            gTasks[taskId].func = sub_80C98FC;
        }
        else
        {
            sub_805CB70();
            FieldObjectSetHeldMovement(&gMapObjects[mapObjId], 0x45);
            gTasks[taskId].func = sub_80C98B0;
        }
    }
}

static void sub_80C98B0(u8 taskId)
{
    if (FieldObjectCheckHeldMovementStatus(&gMapObjects[gPlayerAvatar.mapObjectId]) == TRUE)
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
        EventObjectSetGraphicsId(&gMapObjects[gPlayerAvatar.mapObjectId], GetPlayerAvatarGraphicsIdByCurrentState());
        StartSpriteAnim(&gSprites[gPlayerAvatar.spriteId], gFieldEffectArguments[2]);
        FieldEffectActiveListRemove(6);
        gTasks[taskId].func = sub_80C99A0;
    }
}

static void sub_80C99A0(u8 taskId)
{
    ((void (*)(void))(((u16)gTasks[taskId].data[8] << 16) | (u16)gTasks[taskId].data[9]))();
    gPlayerAvatar.unk6 = FALSE;
    DestroyTask(taskId);
}

bool8 SetUpFieldMove_RockSmash(void)
{
    if (CheckObjectGraphicsInFrontOfPlayer(/*MAP_OBJ_GFX_BREAKABLE_ROCK*/0x60) == TRUE)
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

    gTasks[taskId].data[8] = (u32)sub_80C9A60 >> 16;
    gTasks[taskId].data[9] = (u32)sub_80C9A60;
    IncrementGameStat(GAME_STAT_USED_ROCK_SMASH);
    return FALSE;
}

static void sub_80C9A60(void)
{
    PlaySE(SE_W145);
    FieldEffectActiveListRemove(FLDEFF_USE_ROCK_SMASH);
    EnableBothScriptContexts();
}
