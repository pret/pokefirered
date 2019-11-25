#include "global.h"
#include "event_data.h"
#include "task.h"
#include "menu.h"
#include "field_player_avatar.h"
#include "fieldmap.h"
#include "field_map_obj.h"
#include "field_camera.h"

// Defines
#define t0 data[0]
#define tX data[4]
#define tListTaskId data[7]

// RAM
EWRAM_DATA u8 gUnknown_2039984 = 0;


// Function Declarations
static void sub_809C334(u8 taskId);
static void sub_809C500(u8 taskId);
static void sub_809C640(u8 taskId);

// Data Definitions
static const u16 gUnknown_83DF0D4[] = {0x0308, 0x030a, 0x02d0};
static const u16 gUnknown_83DF0DA[] = {0x0309, 0x030b, 0x02d1};
static const u16 gUnknown_83DF0E0[] = {0x0310, 0x0312, 0x02d8};
static const u16 gUnknown_83DF0E6[] = {0x0311, 0x0313, 0x02d9};
static const u16 gUnknown_83DF0EC[] = {0x02e3, 0x0316, 0x0314};
static const u16 gUnknown_83DF0F2[] = {0x02e4, 0x0317, 0x0315};
static const u16 gUnknown_83DF0F8[] = {0x02eb, 0x031e, 0x031c};


// Functions
#ifdef NONMATCHING
void sub_809C1D8(u8 taskId, const u16* a1, u16 a2)
{
    s16 v1, v2, v3;
	s16 i, j;
	
	v1 = gTasks[taskId].data[5] - 1;
	v2 = gTasks[taskId].data[6] - 1;
	v3 = gTasks[taskId].data[2];
	
	if (gTasks[taskId].data[3] == 0)
	{
		for (i = 0; i < 3; i++)
		{
			for (j = 0; j < 3; j++)
			{
				MapGridGetMetatileIdAt(v1 + j, v2 + i);
				if ()
				{
					
				}
				
				MapGridSetMetatileIdAt
			}
		}
	}
}
#else
NAKED
void sub_809C1D8(u8 taskId, const u16* a1, u16 a2)
{
    asm_unified("\tpush {r4-r7,lr}\n"
                "\tmov r7, r10\n"
                "\tmov r6, r9\n"
                "\tmov r5, r8\n"
                "\tpush {r5-r7}\n"
                "\tsub sp, 0x10\n"
                "\tmov r9, r1\n"
                "\tlsls r0, 24\n"
                "\tlsrs r0, 24\n"
                "\tlsls r2, 16\n"
                "\tlsrs r2, 16\n"
                "\tmov r10, r2\n"
                "\tldr r2, _0809C26C @ =gTasks\n"
                "\tlsls r1, r0, 2\n"
                "\tadds r1, r0\n"
                "\tlsls r1, 3\n"
                "\tadds r1, r2\n"
                "\tldrh r0, [r1, 0x10]\n"
                "\tsubs r0, 0x1\n"
                "\tlsls r0, 16\n"
                "\tlsrs r5, r0, 16\n"
                "\tldrh r0, [r1, 0x12]\n"
                "\tsubs r0, 0x1\n"
                "\tlsls r0, 16\n"
                "\tlsrs r3, r0, 16\n"
                "\tldrh r4, [r1, 0xA]\n"
                "\tmovs r2, 0xC\n"
                "\tldrsh r0, [r1, r2]\n"
                "\tcmp r0, 0\n"
                "\tbne _0809C29C\n"
                "\tmovs r2, 0\n"
                "\tlsls r5, 16\n"
                "\tstr r5, [sp, 0xC]\n"
                "\tlsls r0, r3, 16\n"
                "\tlsls r1, r4, 16\n"
                "\tasrs r0, 16\n"
                "\tstr r0, [sp]\n"
                "\tasrs r1, 16\n"
                "\tstr r1, [sp, 0x4]\n"
                "\tlsls r0, r1, 1\n"
                "\tmov r1, r9\n"
                "\tadds r7, r0, r1\n"
                "_0809C22C:\n"
                "\tmovs r4, 0\n"
                "\tlsls r2, 16\n"
                "\tmov r8, r2\n"
                "\tasrs r0, r2, 16\n"
                "\tldr r2, [sp]\n"
                "\tadds r6, r2, r0\n"
                "_0809C238:\n"
                "\tldr r0, [sp, 0xC]\n"
                "\tasrs r1, r0, 16\n"
                "\tlsls r4, 16\n"
                "\tasrs r0, r4, 16\n"
                "\tadds r5, r1, r0\n"
                "\tadds r0, r5, 0\n"
                "\tadds r1, r6, 0\n"
                "\tbl MapGridGetMetatileIdAt\n"
                "\tmovs r2, 0\n"
                "\tldrsh r1, [r7, r2]\n"
                "\tlsls r0, 16\n"
                "\tasrs r0, 16\n"
                "\tcmp r1, r0\n"
                "\tbne _0809C280\n"
                "\tldr r0, [sp, 0x4]\n"
                "\tcmp r0, 0x2\n"
                "\tbeq _0809C270\n"
                "\tldrh r0, [r7, 0x2]\n"
                "\tmov r2, r10\n"
                "\torrs r2, r0\n"
                "\tadds r0, r5, 0\n"
                "\tadds r1, r6, 0\n"
                "\tbl MapGridSetMetatileIdAt\n"
                "\tb _0809C280\n"
                "\t.align 2, 0\n"
                "_0809C26C: .4byte gTasks\n"
                "_0809C270:\n"
                "\tmov r1, r9\n"
                "\tldrh r0, [r1]\n"
                "\tmov r2, r10\n"
                "\torrs r2, r0\n"
                "\tadds r0, r5, 0\n"
                "\tadds r1, r6, 0\n"
                "\tbl MapGridSetMetatileIdAt\n"
                "_0809C280:\n"
                "\tmovs r2, 0x80\n"
                "\tlsls r2, 9\n"
                "\tadds r0, r4, r2\n"
                "\tlsrs r4, r0, 16\n"
                "\tasrs r0, 16\n"
                "\tcmp r0, 0x2\n"
                "\tble _0809C238\n"
                "\tadds r0, r2, 0\n"
                "\tadd r0, r8\n"
                "\tlsrs r2, r0, 16\n"
                "\tasrs r0, 16\n"
                "\tcmp r0, 0x2\n"
                "\tble _0809C22C\n"
                "\tb _0809C324\n"
                "_0809C29C:\n"
                "\tmovs r2, 0\n"
                "\tlsls r5, 16\n"
                "\tstr r5, [sp, 0xC]\n"
                "\tlsls r0, r3, 16\n"
                "\tlsls r1, r4, 16\n"
                "\tasrs r0, 16\n"
                "\tstr r0, [sp, 0x8]\n"
                "\tasrs r7, r1, 16\n"
                "_0809C2AC:\n"
                "\tmovs r4, 0\n"
                "\tlsls r2, 16\n"
                "\tmov r8, r2\n"
                "\tasrs r0, r2, 16\n"
                "\tldr r1, [sp, 0x8]\n"
                "\tadds r6, r1, r0\n"
                "_0809C2B8:\n"
                "\tldr r2, [sp, 0xC]\n"
                "\tasrs r1, r2, 16\n"
                "\tlsls r4, 16\n"
                "\tasrs r0, r4, 16\n"
                "\tadds r5, r1, r0\n"
                "\tadds r0, r5, 0\n"
                "\tadds r1, r6, 0\n"
                "\tbl MapGridGetMetatileIdAt\n"
                "\tmovs r1, 0x2\n"
                "\tsubs r1, r7\n"
                "\tlsls r1, 1\n"
                "\tadd r1, r9\n"
                "\tmovs r2, 0\n"
                "\tldrsh r1, [r1, r2]\n"
                "\tlsls r0, 16\n"
                "\tasrs r0, 16\n"
                "\tcmp r1, r0\n"
                "\tbne _0809C30A\n"
                "\tcmp r7, 0x2\n"
                "\tbeq _0809C2FA\n"
                "\tmovs r0, 0x1\n"
                "\tsubs r0, r7\n"
                "\tlsls r0, 1\n"
                "\tadd r0, r9\n"
                "\tldrh r0, [r0]\n"
                "\tmov r2, r10\n"
                "\torrs r2, r0\n"
                "\tadds r0, r5, 0\n"
                "\tadds r1, r6, 0\n"
                "\tbl MapGridSetMetatileIdAt\n"
                "\tb _0809C30A\n"
                "_0809C2FA:\n"
                "\tmov r1, r9\n"
                "\tldrh r0, [r1, 0x4]\n"
                "\tmov r2, r10\n"
                "\torrs r2, r0\n"
                "\tadds r0, r5, 0\n"
                "\tadds r1, r6, 0\n"
                "\tbl MapGridSetMetatileIdAt\n"
                "_0809C30A:\n"
                "\tmovs r2, 0x80\n"
                "\tlsls r2, 9\n"
                "\tadds r0, r4, r2\n"
                "\tlsrs r4, r0, 16\n"
                "\tasrs r0, 16\n"
                "\tcmp r0, 0x2\n"
                "\tble _0809C2B8\n"
                "\tadds r0, r2, 0\n"
                "\tadd r0, r8\n"
                "\tlsrs r2, r0, 16\n"
                "\tasrs r0, 16\n"
                "\tcmp r0, 0x2\n"
                "\tble _0809C2AC\n"
                "_0809C324:\n"
                "\tadd sp, 0x10\n"
                "\tpop {r3-r5}\n"
                "\tmov r8, r3\n"
                "\tmov r9, r4\n"
                "\tmov r10, r5\n"
                "\tpop {r4-r7}\n"
                "\tpop {r0}\n"
                "\tbx r0\n");
}
#endif

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
    //ldrh r5, [r4] instead mov r5, r0 somehow 
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
    PlayerGetDestCoords(&tX, &data[5]);
    t0 = 0;
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
    
    data[0] == 0;
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
