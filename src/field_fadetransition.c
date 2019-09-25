#include "global.h"
#include "palette.h"
#include "field_fadetransition.h"
#include "overworld.h"
#include "fldeff.h"
#include "field_weather.h"
#include "map_preview_screen.h"
#include "field_player_avatar.h"
#include "task.h"
#include "script.h"
#include "cable_club.h"
#include "fieldmap.h"
#include "metatile_behavior.h"
#include "quest_log.h"
#include "link.h"
#include "map_obj_80688E4.h"
#include "sound.h"
#include "field_door.h"
#include "field_screen_effect.h"
#include "field_map_obj.h"
#include "field_map_obj_helpers.h"
#include "map_obj_lock.h"
#include "start_menu.h"
#include "constants/songs.h"

void sub_807DF4C(u8 a0);
void sub_807DFBC(u8 taskId);
void task_map_chg_seq_0807E20C(u8 taskId);
void task_map_chg_seq_0807E2CC(u8 taskId);
void sub_807E31C(u8 taskId);
void sub_807EC34(u8 taskId);
void sub_807F204(u8 taskId);

void palette_bg_faded_fill_white(void)
{
    CpuFastFill16(RGB_WHITE, gPlttBufferFaded, 0x400);
}

void palette_bg_faded_fill_black(void)
{
    CpuFastFill16(RGB_BLACK, gPlttBufferFaded, 0x400);
}

void pal_fill_for_maplights(void)
{
    switch (sub_80C9DCC(get_map_light_from_warp0(), GetCurrentMapType()))
    {
    case 0:
        palette_bg_faded_fill_black();
        fade_screen(0, 0);
        palette_bg_faded_fill_black();
        break;
    case 1:
        palette_bg_faded_fill_white();
        fade_screen(2, 0);
        palette_bg_faded_fill_white();
        break;
    }
}

void sub_807DBAC(void)
{
    switch (sub_80C9DCC(get_map_light_from_warp0(), GetCurrentMapType()))
    {
    case 0:
        palette_bg_faded_fill_black();
        fade_screen(0, 3);
        palette_bg_faded_fill_black();
        break;
    case 1:
        palette_bg_faded_fill_white();
        fade_screen(2, 3);
        palette_bg_faded_fill_white();
        break;
    }
}

void sub_807DC00(void)
{
    palette_bg_faded_fill_black();
    fade_screen(0, 0);
    palette_bg_faded_fill_black();
}

void sub_807DC18(void)
{
    const struct MapHeader *header = warp1_get_mapheader();
    if (header->regionMapSectionId != gMapHeader.regionMapSectionId && sub_80F8110(header->regionMapSectionId, FALSE))
        fade_screen(1, 0);
    else
    {
        switch (sub_80C9D7C(GetCurrentMapType(), header->mapType))
        {
        case 0:
            fade_screen(1, 0);
            break;
        case 1:
            fade_screen(3, 0);
            break;
        }
    }
}

void sub_807DC70(void)
{
    switch (sub_80C9D7C(GetCurrentMapType(), warp1_get_mapheader()->mapType))
    {
    case 0:
        fade_screen(1, 3);
        break;
    case 1:
        fade_screen(3, 3);
        break;
    }
}

void sub_807DCB0(bool8 arg)
{
    sub_805CB04(!arg);
}

void task0A_nop_for_a_while(u8 taskId)
{
    if (sub_807E418() == TRUE)
        DestroyTask(taskId);
}

void sub_807DCE4(void)
{
    ScriptContext2_Enable();
    Overworld_PlaySpecialMapMusic();
    sub_807DC00();
    CreateTask(task0A_nop_for_a_while, 10);
}

void task0A_asap_script_env_2_enable_and_set_ctx_running(u8 taskId)
{
    if (sub_807E418() == TRUE)
    {
        DestroyTask(taskId);
        EnableBothScriptContexts();
    }
}

void FieldCallback_ReturnToEventScript2(void)
{
    ScriptContext2_Enable();
    Overworld_PlaySpecialMapMusic();
    sub_807DC00();
    CreateTask(task0A_asap_script_env_2_enable_and_set_ctx_running, 10);
}

void sub_807DD44(void)
{
    ScriptContext2_Enable();
    sub_807DC00();
    CreateTask(task0A_asap_script_env_2_enable_and_set_ctx_running, 10);
}

void task_mpl_807DD60(u8 taskId)
{
    struct Task *task = &gTasks[taskId];
    switch (task->data[0])
    {
    case 0:
        task->data[1] = sub_8081150();
        task->data[0]++;
        break;
    case 1:
        if (gTasks[task->data[1]].isActive != TRUE)
        {
            pal_fill_for_maplights();
            task->data[0]++;
        }
        break;
    case 2:
        if (sub_807E418() == TRUE)
        {
            ScriptContext2_Disable();
            DestroyTask(taskId);
        }
        break;
    }
}

void sub_807DDD0(void)
{
    ScriptContext2_Enable();
    Overworld_PlaySpecialMapMusic();
    palette_bg_faded_fill_black();
    CreateTask(task_mpl_807DD60, 10);
}

void sub_807DDF0(u8 taskId)
{
    struct Task *task = &gTasks[taskId];
    switch (task->data[0])
    {
    case 0:
        sub_800AB9C();
        task->data[0]++;
        break;
    case 1:
        if (IsLinkTaskFinished())
        {
            pal_fill_for_maplights();
            task->data[0]++;
        }
        break;
    case 2:
        if (sub_807E418() == TRUE)
        {
            sub_8009FE8();
            ScriptContext2_Disable();
            DestroyTask(taskId);
        }
        break;
    }
}

void sub_807DE58(void)
{
    ScriptContext2_Enable();
    Overworld_PlaySpecialMapMusic();
    palette_bg_faded_fill_black();
    CreateTask(sub_807DDF0, 10);
}

void sub_807DE78(bool8 a0)
{
    s16 x, y;
    u32 behavior;
    TaskFunc func;

    PlayerGetDestCoords(&x, &y);
    behavior = MapGridGetMetatileBehaviorAt(x, y);
    if (MetatileBehavior_IsWarpDoor_2(behavior) == TRUE)
    {
        func = sub_807DFBC;
        switch (sub_80C9DCC(get_map_light_from_warp0(), GetCurrentMapType()))
        {
        case 0:
            palette_bg_faded_fill_black();
            break;
        case 1:
            palette_bg_faded_fill_white();
            break;
        }
    }
    else
    {
        sub_807DF4C(a0);
        if (MetatileBehavior_IsCaveDoor(behavior) == TRUE)
            func = task_map_chg_seq_0807E20C;
        else if (MetatileBehavior_IsUnknownWarp6C_to_6F(behavior) == TRUE)
        {
            u8 tmp = gUnknown_2031DE0;
            func = task_map_chg_seq_0807E2CC;
            if (!tmp)
                func = sub_807EC34;
        }
        else
            func = task_map_chg_seq_0807E2CC;
    }
    gUnknown_2031DE0 = FALSE;
    CreateTask(func, 10);
}

void sub_807DF4C(bool8 a0)
{
    if (!a0)
        pal_fill_for_maplights();
    else
        sub_807DC00();
}

void sub_807DF64(void)
{
    Overworld_PlaySpecialMapMusic();
    sub_8111CF0();
    sub_807DE78(FALSE);
    ScriptContext2_Enable();
}

void sub_807DF7C(void)
{
    Overworld_PlaySpecialMapMusic();
    sub_8111CF0();
    sub_807DE78(TRUE);
    ScriptContext2_Enable();
}

void sub_807DF94(void)
{
    Overworld_PlaySpecialMapMusic();
    pal_fill_for_maplights();
    sub_8111CF0();
    PlaySE(SE_RU_GASHIN);
    CreateTask(sub_807E31C, 10);
    ScriptContext2_Enable();
}

void sub_807DFBC(u8 taskId)
{
    struct Task * task = &gTasks[taskId];
    s16 *x = &task->data[2];
    s16 *y = &task->data[3];

    if (task->data[0] == 0)
        task->data[0] = 5;

    switch (task->data[0])
    {
    case 0: // Never reached
        sub_807DCB0(0);
        player_bitmagic();
        PlayerGetDestCoords(x, y);
        FieldSetDoorOpened(*x, *y);
        task->data[0] = 1;
        break;
    case 5:
        sub_807DCB0(0);
        player_bitmagic();
        sub_807F114();
        sub_807DBAC();
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
            sub_807DCB0(TRUE);
            FieldObjectSetHeldMovement(&gMapObjects[GetFieldObjectIdByLocalIdAndMap(0xFF, 0, 0)], 16);
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
        if (sub_807E418() && walkrun_is_standing_still() && !FieldIsDoorAnimationRunning() && !FuncIsActiveTask(sub_807F204))
        {
            FieldObjectClearHeldMovementIfFinished(&gMapObjects[GetFieldObjectIdByLocalIdAndMap(0xFF, 0, 0)]);
            task->data[0] = 4;
        }
        break;
    // Legacy RS
    case 1:
        if (sub_807E418())
        {
            sub_807DCB0(TRUE);
            FieldObjectSetHeldMovement(&gMapObjects[GetFieldObjectIdByLocalIdAndMap(0xFF, 0, 0)], 16);
            task->data[0] = 2;
        }
        break;
    case 2:
        if (walkrun_is_standing_still())
        {
            task->data[1] = FieldAnimateDoorClose(*x, *y);
            FieldObjectClearHeldMovementIfFinished(&gMapObjects[GetFieldObjectIdByLocalIdAndMap(0xFF, 0, 0)]);
            task->data[0] = 3;
        }
        break;
    case 3:
        if (task->data[1] < 0 || gTasks[task->data[1]].isActive != TRUE)
            task->data[0] = 4;
        break;
    case 4:
        UnfreezeMapObjects();
        ScriptContext2_Disable();
        DestroyTask(taskId);
        break;
    }
}

void task_map_chg_seq_0807E20C(u8 taskId)
{
    struct Task * task = &gTasks[taskId];
    s16 *x = &task->data[2];
    s16 *y = &task->data[3];

    switch (task->data[0])
    {
    case 0:
        sub_807DCB0(0);
        player_bitmagic();
        PlayerGetDestCoords(x, y);
        task->data[0] = 1;
        break;
    case 1:
        if (sub_807E418())
        {
            sub_807DCB0(TRUE);
            FieldObjectSetHeldMovement(&gMapObjects[GetFieldObjectIdByLocalIdAndMap(0xFF, 0, 0)], sub_8063F84(GetPlayerFacingDirection()));
            task->data[0] = 2;
        }
        break;
    case 2:
        if (walkrun_is_standing_still())
        {
            task->data[0] = 3;
        }
        break;
    case 3:
        UnfreezeMapObjects();
        ScriptContext2_Disable();
        DestroyTask(taskId);
        break;
    }
}

void task_map_chg_seq_0807E2CC(u8 taskId)
{
    switch (gTasks[taskId].data[0])
    {
    case 0:
        player_bitmagic();
        ScriptContext2_Enable();
        gTasks[taskId].data[0]++;
        break;
    case 1:
        if (sub_807E418())
        {
            UnfreezeMapObjects();
            ScriptContext2_Disable();
            DestroyTask(taskId);
        }
        break;
    }
}

void sub_807E31C(u8 taskId)
{
    switch (gTasks[taskId].data[0])
    {
    case 0:
        player_bitmagic();
        ScriptContext2_Enable();
        sub_805DC04();
        gTasks[taskId].data[0]++;
        break;
    case 1:
        if (sub_807E418() && sub_805DC24() != TRUE)
        {
            UnfreezeMapObjects();
            ScriptContext2_Disable();
            DestroyTask(taskId);
        }
        break;
    }
}

void sub_807E378(u8 taskId)
{
    if (sub_807E418() == TRUE)
    {
        DestroyTask(taskId);
        CreateTask(sub_806F1F0, 80);
    }
}

void sub_807E3A0(void)
{
    sub_807DC00();
    CreateTask(sub_807E378, 80);
    ScriptContext2_Enable();
}

bool32 sub_807E3BC(void)
{
    sub_806F1D4();
    return FALSE;
}
