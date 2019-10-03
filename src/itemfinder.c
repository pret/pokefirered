#include "global.h"
#include "task.h"
#include "new_menu_helpers.h"
#include "strings.h"
#include "map_obj_lock.h"
#include "script.h"
#include "sound.h"
#include "event_data.h"
#include "field_player_avatar.h"
#include "field_specials.h"
#include "constants/songs.h"

void sub_813ED18(u8 taskId);
void sub_813ED3C(u8 taskId);
void sub_813EDB0(u8 taskId);
bool8 sub_813EE14(struct MapEvents *events, u8 taskId);
void sub_813EF9C(u8 taskId);
void sub_813F108(u8 taskId);
void sub_813F220(u8 taskId, s16 dx, s16 dy);
u8 GetPlayerDirectionTowardsHiddenItem(s16 x, s16 y);
void sub_813F364(u8 taskId);
void sub_813F3A8(u8 taskId);
void sub_813F3EC(void);
void sub_813F40C(u8 palIdx, u8 direction);
u8 sub_813F5AC(void);
void sub_813EF40(u8 taskId, struct HiddenItemStruct hiddenItem);

void sub_813EC8C(u8 taskId)
{
    u8 i;
    for (i = 0; i < 16; i++)
        gTasks[taskId].data[i] = 0;
    if (sub_813EE14(gMapHeader.events, taskId) == TRUE)
    {
        sub_813F3EC();
        if (gTasks[taskId].data[6] == 1)
            gTasks[taskId].func = sub_813EDB0;
        else
            gTasks[taskId].func = sub_813ED3C;
    }
    else
    {
        DisplayItemMessageOnField(taskId, 2, gText_NopeTheresNoResponse, sub_813ED18);
    }
}

void sub_813ED18(u8 taskId)
{
    ClearDialogWindowAndFrame(0, TRUE);
    sub_80696C0();
    ScriptContext2_Disable();
    DestroyTask(taskId);
}

void sub_813ED3C(u8 taskId)
{
    s16 * data = gTasks[taskId].data;
    u8 direction;
    if (data[3] % 25 == 0)
    {
        direction = GetPlayerDirectionTowardsHiddenItem(data[0], data[1]);
        if (data[4] == 0)
        {
            gTasks[taskId].func = sub_813F364;
            return;
        }
        else
        {
            PlaySE(SE_TOY_F);
            sub_813F40C(data[5], direction);
            data[5]++;
            data[4]--;
        }
    }
    data[3]++;
}

void sub_813EDB0(u8 taskId)
{
    s16 * data = gTasks[taskId].data;
    if (data[3] % 25 == 0)
    {
        if (data[4] == 0)
        {
            gTasks[taskId].func = sub_813F3A8;
            return;
        }
        else
        {
            PlaySE(SE_TOY_F);
            data[7] = sub_813F5AC();
            data[5]++;
            data[4]--;
        }
    }
    data[3]++;
}

bool8 sub_813EE14(struct MapEvents *events, u8 taskId)
{
    s16 x, y, i, dx, dy;
    PlayerGetDestCoords(&x, &y);
    gTasks[taskId].data[2] = 0;
    for (i = 0; i < events->bgEventCount; i++)
    {
        if (events->bgEvents[i].kind == 7 && !FlagGet(sub_80CC44C(events->bgEvents[i].bgUnion.hiddenItem, 1)))
        {
            dx = events->bgEvents[i].x + 7 - x;
            dy = events->bgEvents[i].y + 7 - y;
            if (sub_80CC44C(events->bgEvents[i].bgUnion.hiddenItem, 3) == TRUE)
            {
                if (dx == 0 && dy == 0)
                {
                    sub_813EF40(taskId, events->bgEvents[i].bgUnion.hiddenItem);
                    return TRUE;
                }
            }
            else if (
                dx >= -7
             && dx <=  7
             && dy >= -5
             && dy <=  5
            )
            {
                sub_813F220(taskId, dx, dy);
            }
        }
    }
    sub_813F108(taskId);
    if (gTasks[taskId].data[2] == 1)
    {
        sub_813EF9C(taskId);
        return TRUE;
    }
    return FALSE;
}

void sub_813EF40(u8 taskId, struct HiddenItemStruct hiddenItem)
{
    s16 * data = gTasks[taskId].data;
    gSpecialVar_0x8004 = sub_80CC44C(hiddenItem, 1);
    gSpecialVar_0x8005 = sub_80CC44C(hiddenItem, 0);
    gSpecialVar_0x8006 = 1;
    TV_PrintIntToStringVar(0, gSpecialVar_0x8005);
    data[2] = 1;
    data[0] = 0;
    data[1] = 0;
    data[4] = 3;
    data[6] = 1;
}

void sub_813EF9C(u8 taskId)
{
    s16 * data = gTasks[taskId].data;
    s16 r3 = data[1];
    s16 r2 = data[0];
    if (data[0] == 0 && data[1] == 0)
        data[4] = 4;
    else
    {
        if (data[0] < 0)
            r2 = data[0] * -1;
        if (data[1] < 0)
            r3 = data[1] * -1;
        if (r2 > r3)
        {
            if (r2 > 3)
                data[4] = 2;
            else
                data[4] = 4;
        }
        else
        {
            if (r3 > 3)
                data[4] = 2;
            else
                data[4] = 4;
        }
    }
}

bool8 sub_813F004(struct MapEvents *events, s16 x, s16 y)
{
    s32 i;
    u16 eventFlag;
    s32 bgEventCount = events->bgEventCount;
    struct BgEvent *bgEvents = events->bgEvents;
    for (i = 0; i < bgEventCount; i++)
    {
        if (
            bgEvents[i].kind == 7
         && x == bgEvents[i].x
         && y == bgEvents[i].y
        )
        {
            eventFlag = sub_80CC44C(bgEvents[i].bgUnion.hiddenItem, 1);
            if (sub_80CC44C(bgEvents[i].bgUnion.hiddenItem, 3) != TRUE && !FlagGet(eventFlag))
                return TRUE;
            else
                return FALSE;
        }
    }
    return FALSE;
}
