#include "global.h"
#include "event_data.h"
#include "task.h"
#include "field_player_avatar.h"
#include "fieldmap.h"
#include "field_camera.h"

static EWRAM_DATA u8 gUnknown_2039984 = 0;

static void sub_809C1D8(u8 taskId, const s16 *a1, u16 a2);
static void sub_809C334(u8 taskId);
static void sub_809C500(u8 taskId);
static void sub_809C640(u8 taskId);

static const u16 gUnknown_83DF0D4[] = {0x0308, 0x030a, 0x02d0};
static const u16 gUnknown_83DF0DA[] = {0x0309, 0x030b, 0x02d1};
static const u16 gUnknown_83DF0E0[] = {0x0310, 0x0312, 0x02d8};
static const u16 gUnknown_83DF0E6[] = {0x0311, 0x0313, 0x02d9};
static const u16 gUnknown_83DF0EC[] = {0x02e3, 0x0316, 0x0314};
static const u16 gUnknown_83DF0F2[] = {0x02e4, 0x0317, 0x0315};
static const u16 gUnknown_83DF0F8[] = {0x02eb, 0x031e, 0x031c};

// Functions
static void sub_809C1D8(u8 taskId, const s16 *a1, u16 a2)
{
    s16 r5, r3, r4;
    s16 i, j;
    
    r5 = gTasks[taskId].data[4] - 1;
    r3 = gTasks[taskId].data[5] - 1;
    r4 = gTasks[taskId].data[1];
    
    if (gTasks[taskId].data[2] == 0)
    {
        for (i = 0; i < 3; i++)
        {
            for (j = 0; j < 3; j++)
            {
                s32 id = MapGridGetMetatileIdAt(r5 + j, r3 + i);
                
                if (a1[r4] == (s16)id)
                {
                    if (r4 != 2)
                        MapGridSetMetatileIdAt(r5 + j, r3 + i, a2 | a1[r4 + 1]);
                    else
                        MapGridSetMetatileIdAt(r5 + j, r3 + i, a2 | a1[0]);
                }
            }
        }
    }
    else
    {
        for (i = 0; i < 3; i++)
        {
            for (j = 0; j < 3; j++)
            {
                s32 id = MapGridGetMetatileIdAt(r5 + j, r3 + i);

                if (a1[2 - r4] == (s16)id)
                {
                    if (r4 != 2)
                        MapGridSetMetatileIdAt(r5 + j, r3 + i, a2 | a1[1 - r4]);
                    else
                        MapGridSetMetatileIdAt(r5 + j, r3 + i, a2 | a1[2]);
                }
            }
        }
    }
}

static void sub_809C334(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    u16 v1;
    
    data[3] = 1;
    switch (data[0])
    {
    case 0:
        sub_809C1D8(taskId, gUnknown_83DF0D4, 0);
        break;
    case 1:
        sub_809C1D8(taskId, gUnknown_83DF0DA, 0);
        break;
    case 2:
        sub_809C1D8(taskId, gUnknown_83DF0E0, 0xC00);
        break;
    case 3:
        sub_809C1D8(taskId, gUnknown_83DF0E6, 0);
        break;
    case 4:
        sub_809C1D8(taskId, gUnknown_83DF0EC, 0xC00);
        break;
    case 5:
        sub_809C1D8(taskId, gUnknown_83DF0F2, 0);
        break;
    case 6:
        sub_809C1D8(taskId, gUnknown_83DF0F8, 0);
    default:
        break;
    }
    
    data[0] = (data[0] + 1) & 7;
    v1 = data[0] & 7;
    if (v1 == 0)
    {
        DrawWholeMapView();
        data[1] = (data[1] + 1) % 3;
        data[3] = v1;
    }
}

static u8 sub_809C3FC(u16 a0)
{
    u8 taskId;
    s16 *data;

    taskId = CreateTask(sub_809C334, 0);
    data = gTasks[taskId].data;
    PlayerGetDestCoords(&data[4], &data[5]);
    data[0] = 0;
    data[1] = 0;
    data[2] = a0;
    sub_809C334(taskId);
    return taskId;
}

void sub_809C448(u8 a0)
{
    u8 taskId;
    
    taskId = sub_809C3FC(a0);
    gUnknown_2039984 = taskId;
}

void sub_809C460(void)
{
    DestroyTask(gUnknown_2039984);
}

bool8 sub_809C474(void)
{    
    if (gTasks[gUnknown_2039984].data[3] == 0)
    {
        if (gTasks[gUnknown_2039984].data[1] != 2)
            return TRUE;
        return FALSE;
    }
    else
    {
        return TRUE;
    }
}

// special 0x1b5 - creates a tile animaiton one block left two-four up the player
void sub_809C4A8(void)
{
    u8 taskId;
    s16 *data;
    
    taskId = CreateTask(sub_809C500, 0);
    gTasks[taskId].data[0] = 0;
    gTasks[taskId].data[1] = 0;
    data = gTasks[taskId].data;
    PlayerGetDestCoords(&data[2], &data[3]);
    if (gSpecialVar_0x8004 == 0)
    {
        gTasks[taskId].data[2] += 6;
        gTasks[taskId].data[3] -= 5;
    }
    else
    {
        gTasks[taskId].data[2]--;
        gTasks[taskId].data[3] -= 5;
    }    
}

static void sub_809C500(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    
    if (data[0] == 0)
    {
        if ((data[1] & 1) == 0)
        {
            MapGridSetMetatileIdAt(data[2], data[3], 0xEB5);
            MapGridSetMetatileIdAt(data[2], data[3] + 2, 0xEB7);
        }
        else
        {
            MapGridSetMetatileIdAt(data[2], data[3], 0xEB6);
            MapGridSetMetatileIdAt(data[2], data[3] + 2, 0xEB8);
        }
        CurrentMapDrawMetatileAt(data[2], data[3]);
        CurrentMapDrawMetatileAt(data[2], data[3] + 2);
    }
    
    data[0]++;
    if (data[0] != 0x10)
        return;
    
    data[0] = 0;
    data[1]++;
    if (data[1] != 0xD)
        return;
    
    MapGridSetMetatileIdAt(data[2], data[3], 0xE8A);
    MapGridSetMetatileIdAt(data[2], data[3] + 2, 0xE96);
    CurrentMapDrawMetatileAt(data[2], data[3]);
    CurrentMapDrawMetatileAt(data[2], data[3] + 2);
    DestroyTask(taskId);
}

// special 0x1B7 - creates a tile animation two-six blocks right from the top-left corner of the screen
void sub_809C5FC(void)
{
    u8 taskId;
    s16 *data;
    
    taskId = CreateTask(sub_809C640, 0);
    gTasks[taskId].data[0] = 0;
    gTasks[taskId].data[1] = 0;
    data = gTasks[taskId].data;
    PlayerGetDestCoords(&data[2], &data[3]);
    gTasks[taskId].data[2] += 4;
    gTasks[taskId].data[3] -= 5;
}

static void sub_809C640(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    
    if (data[0] == 0)
    {
        if (data[1] != 0)
        {
            MapGridSetMetatileIdAt(data[2], data[3], 0xE85);
            MapGridSetMetatileIdAt(data[2], data[3] + 1, 0xEB4);
            CurrentMapDrawMetatileAt(data[2], data[3]);
            CurrentMapDrawMetatileAt(data[2], data[3] + 1);
            if (data[1] == 4)
            {
                DestroyTask(taskId);
                return;
            }
            
            data[2]--;
        }
        MapGridSetMetatileIdAt(data[2], data[3], 0xEB9);
        MapGridSetMetatileIdAt(data[2], data[3] + 1, 0xEBA);
        CurrentMapDrawMetatileAt(data[2], data[3]);
        CurrentMapDrawMetatileAt(data[2], data[3] + 1);
    }
    
    data[0]++;
    if (data[0] == 4)
    {
        data[0] = 0;
        data[1]++;
    }
}

