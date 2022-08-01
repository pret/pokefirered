#include "global.h"
#include "gflib.h"
#include "dodrio_berry_picking.h"
#include "event_data.h"
#include "item.h"
#include "link.h"
#include "link_rfu.h"
#include "m4a.h"
#include "minigame_countdown.h"
#include "random.h"
#include "script.h"
#include "strings.h"
#include "task.h"
#include "text_window.h"
#include "constants/songs.h"
#include "constants/sound.h"
#include "constants/items.h"

struct DodrioStruct
{
    /*0x0000*/ void (*savedCallback)(void);
    /*0x0004*/ u8 ALIGNED(4) unk04;
    /*0x0008*/ u8 ALIGNED(4) unk08;
    /*0x000C*/ u8 ALIGNED(4) unk0C;
    /*0x0010*/ u8 ALIGNED(4) unk10;
    /*0x0014*/ u8 ALIGNED(4) unk14;
    /*0x0018*/ u8 ALIGNED(4) unk18;
    /*0x001C*/ u8 ALIGNED(4) unk1C;
    /*0x0020*/ u8 ALIGNED(4) unk20;
    /*0x0024*/ u8 ALIGNED(4) unk24;
    /*0x0028*/ u8 ALIGNED(4) multiplayerId;
    /*0x0030*/ u8 ALIGNED(8) unk30;
    /*0x0034*/ u8 ALIGNED(4) unk34[5];
    /*0x003C*/ u8 ALIGNED(4) unk3C;
    /*0x0040*/ u8 ALIGNED(4) unk40;
    /*0x0044*/ u8 ALIGNED(4) unk44;
    /*0x0048*/ u8 ALIGNED(4) unk48;
    /*0x004A*/ u16 unk4A[5][6];
    /*0x0086*/ u16 unk86[5];
    /*0x0090*/ u8 ALIGNED(4) unk90[5];
    /*0x0098*/ u8 ALIGNED(4) unk98[4];
    /*0x009C*/ u8 ALIGNED(4) unk9C[11];
    /*0x00A8*/ u8 ALIGNED(4) unkA8[5];
    /*0x00B0*/ u8 ALIGNED(4) unkB0[5];
    /*0x00B8*/ u8 ALIGNED(4) unkB8[11];
    /*0x00C4*/ u8 ALIGNED(4) unkC4[11];
    /*0x00D0*/ u8 ALIGNED(4) unkD0[11];
    /*0x00DC*/ u8 ALIGNED(4) unkDC[11];
    /*0x00E8*/ u8 ALIGNED(4) unkE8[11];
    /*0x00F4*/ u8 ALIGNED(4) unkF4[11][2];
    /*0x010C*/ u8 ALIGNED(4) unk10C[5];
    /*0x0112*/ u16 unk112;
    /*0x0114*/ u16 unk114;
    /*0x0118*/ u32 unk118;
    /*0x011C*/ u32 unk11C;
    /*0x0120*/ u32 unk120;
    /*0x0124*/ u8 ALIGNED(4) unk124;
    /*0x0128*/ u8 ALIGNED(4) unk128;
    /*0x012C*/ u32 unk12C;
    /*0x0130*/ u32 unk130[5];
    /*0x0144*/ u8 ALIGNED(4) unk144;
    /*0x0148*/ u8 ALIGNED(4) unk148[11];
    /*0x0154*/ u8 ALIGNED(4) unk154;
    /*0x0158*/ u8 ALIGNED(4) unk158[5];
    /*0x0160*/ struct DodrioSubstruct_0160 unk160;
    /*0x318C*/ struct DodrioSubstruct_318C unk318C[5];
    /*0x31A0*/ struct DodrioSubstruct_31A0 unk31A0[5];
    /*0x32CC*/ struct DodrioSubstruct_31A0 unk32CC;
    /*0x3308*/ struct DodrioSubstruct_3308 unk3308[5];
}; // size = 0x3330

static EWRAM_DATA struct DodrioStruct * gUnknown_203F3E0 = NULL;

static bool32 gUnknown_3002044;

static void sub_81508D8(void);
static void sub_81508EC(struct DodrioStruct * dodrio);
static void sub_8150A84(u8 taskId);
static void sub_8150C78(void);
static void sub_8150CBC(void);
static void sub_8150CF4(void);
static void sub_8150D7C(void);
static void sub_8150DA4(void);
static void sub_8150E68(void);
static void sub_8150F40(void);
static void sub_8150FC4(void);
static void sub_8150FDC(void);
static void sub_815109C(void);
static void sub_8151198(void);
static void sub_81512B4(void);
static void sub_8151488(void);
static void sub_81514F0(void);
static void sub_815159C(void);
static void sub_81516DC(u8 taskId);
static void sub_8151750(u8 taskId);
static void sub_8151B54(void);
static void sub_8151BA0(void);
static void sub_8151C5C(void);
static void sub_8151D28(void);
static void sub_8151D98(void);
static void sub_8151E94(void);
static void sub_815201C(void);
static void sub_8152034(void);
static void sub_8152048(struct DodrioSubstruct_318C * dodrioMon, struct Pokemon * partyMon);
static void sub_815205C(TaskFunc func, u8 priority);
static void sub_815206C(TaskFunc func);
static void sub_8152090(u8 a0);
static bool32 sub_81520B4(void);
static void sub_8152110(void);
static bool32 sub_8152484(u8 a0, u8 a1, u8 a2);
static void sub_815256C(void);
static void sub_815293C(void);
static void sub_8152970(void);
static bool32 sub_8152A00(void);
static void sub_8152A70(void);
static void sub_81529A4(u8 a0, u8 *a1, u8 *a2);
static bool32 sub_8152A98(void);
static bool32 sub_8152AD8(void);
static void sub_8152B64(u8 a0);
static u8 sub_8152BD4(u8 a0);
static u8 sub_8152BF8(u8 a0, u8 a1);
static u8 sub_8152CB8(u8 arg0, u8 arg1);
static void sub_8152D34(u8 a0, u8 a1, u8 a2);
static void sub_8152F94(bool32 a0);
static void sub_8153004(void);
static void sub_8153048(void);
static void sub_8153150(void);
static void sub_81531FC(void);
static u8 sub_815327C(u8);
static void sub_81532B8(void);
static void sub_815336C(void);
static u32 sub_8153424(u8 mpId);
static void Task_ShowDodrioBerryPickingRecords(u8 taskId);
static void sub_81538D0(u8 windowId);

// const rom data

// Assets in this header are duplicated
#include "data/dodrio_berry_picking.h"

static const u8 sUnknown_847553C[][3] =
{
    {40, 24, 13},
    {32, 19, 10},
    {22, 13, 7},
};

ALIGNED(4)
static const u8 sUnknown_8475548[] = {8, 5, 8, 11, 15};

ALIGNED(4)
static const u8 sUnknown_8475550[] = {5, 10, 20, 30, 50, 70, 100};

ALIGNED(4)
static const u8 sUnknown_8475558[][10] =
{
    {15, 16, 17, 18, 19, 19, 18, 17, 16, 15},
    {20, 21, 22, 23, 24, 25, 26, 27, 28, 29},
    {30, 31, 32, 33, 34, 34, 33, 32, 31, 30},
};

static void (*const sUnknown_8475578[])(void) =
{
    sub_8150C78,
    sub_8150CBC,
    sub_8150CF4,
    sub_8150D7C,
    sub_8150DA4,
    sub_8150FDC,
    sub_8151198,
    sub_81512B4,
    sub_8151488,
    sub_81514F0,
    sub_815159C,
    sub_8150F40
};

static void (*const sUnknown_84755A8[])(void) =
{
    sub_8150C78,
    sub_8150CBC,
    sub_8150CF4,
    sub_8150D7C,
    sub_8150E68,
    sub_815109C,
    sub_8151198,
    sub_81512B4,
    sub_8151488,
    sub_81514F0,
    sub_815159C,
    sub_8150FC4
};

void StartDodrioBerryPicking(u16 a0, MainCallback callback)
{
    gUnknown_3002044 = FALSE;

    if (gReceivedRemoteLinkPlayers && (gUnknown_203F3E0 = AllocZeroed(sizeof(*gUnknown_203F3E0))) != NULL)
    {
        sub_81508D8();
        sub_81508EC(gUnknown_203F3E0);
        gUnknown_203F3E0->savedCallback = callback;
        gUnknown_203F3E0->multiplayerId = GetMultiplayerId();
        gUnknown_203F3E0->unk32CC = gUnknown_203F3E0->unk31A0[gUnknown_203F3E0->multiplayerId];
        sub_8152048(&gUnknown_203F3E0->unk318C[gUnknown_203F3E0->multiplayerId], &gPlayerParty[a0]);
        CreateTask(sub_8150A84, 1);
        SetMainCallback2(sub_815201C);
        sub_8153150();
        sub_81529A4(gUnknown_203F3E0->unk24, &gUnknown_203F3E0->unk44, &gUnknown_203F3E0->unk48);
        StopMapMusic();
        PlayNewMapMusic(MUS_BERRY_PICK);
    }
    else
    {
        SetMainCallback2(callback);
        return;
    }
}

static void sub_81508D8(void)
{
    ResetTasks();
    ResetSpriteData();
    FreeAllSpritePalettes();
}

static void sub_81508EC(struct DodrioStruct * data)
{
    u8 i;

    data->unk0C = 0;
    data->unk10 = 0;
    data->unk14 = 0;
    data->unk18 = 0;
    data->unk1C = 0;
    data->unk11C = 0;
    data->unk120 = 0;
    data->unk30 = 0;
    data->unk40 = 0;
    data->unk3C = 0;
    data->unk12C = 0;

    for (i = 0; i < 4; i++)
    {
        data->unk98[i] = 0;
    }

    for (i = 0; i < 5; i++)
    {
        data->unkA8[i] = 0;
        data->unkB0[i] = 0;
        data->unk4A[i][0] = 0;
        data->unk4A[i][1] = 0;
        data->unk4A[i][2] = 0;
        data->unk4A[i][3] = 0;
        data->unk4A[i][5] = 0;
        data->unk10C[i] = 0;
        data->unk130[i] = 0;
    }

    for (i = 0; i < 11; i++)
    {
        data->unkD0[i] = 0;
        data->unkDC[i] = 0;
        data->unkC4[i] = 0;
        data->unkF4[i][0] = 0xFF;
        data->unkF4[i][1] = 0xFF;
    }

    data->unk20 = GetMultiplayerId() == 0 ? 1 : 0;
    data->unk24 = GetLinkPlayerCount();
    data->unk34[0] = GetMultiplayerId();
    for (i = 1; i < data->unk24; i++)
    {
        data->unk34[i] = data->unk34[i - 1] + 1;
        if (data->unk34[i] > data->unk24 - 1)
            data->unk34[i] %= data->unk24;
    }
}

static void sub_8150A84(u8 taskId)
{
    u8 r4, r5;

    switch (gUnknown_203F3E0->unk0C)
    {
    case 0:
        SetVBlankCallback(NULL);
        sub_815205C(sub_8151750, 4);
        gUnknown_203F3E0->unk0C++;
        break;
    case 1:
        if (!FuncIsActiveTask(sub_8151750))
        {
            sub_8154968(&gUnknown_203F3E0->unk160);
            gUnknown_203F3E0->unk0C++;
        }
        break;
    case 2:
        if (!sub_8155E68())
        {
            Rfu_SetLinkStandbyCallback();
            gUnknown_203F3E0->unk0C++;
        }
        break;
    case 3:
        if (IsLinkTaskFinished())
        {
            if (gReceivedRemoteLinkPlayers)
            {
                LoadWirelessStatusIndicatorSpriteGfx();
                CreateWirelessStatusIndicatorSprite(0, 0);
            }
            gUnknown_203F3E0->unk0C++;
        }
        break;
    case 4:
        r5 = gUnknown_203F3E0->unk24;
        sub_8153A9C();
        for (r4 = 0; r4 < r5; r4++)
        {
            sub_8153AFC(&gUnknown_203F3E0->unk318C[gUnknown_203F3E0->unk34[r4]], r4, gUnknown_203F3E0->unk34[r4], gUnknown_203F3E0->unk24);
        }
        sub_8153D80(FALSE, gUnknown_203F3E0->unk24);
        gUnknown_203F3E0->unk0C++;
        break;
    case 5:
        sub_8154128();
        sub_815417C();
        sub_8154438();
        sub_8153E28();
        gUnknown_203F3E0->unk0C++;
        break;
    case 6:
        BlendPalettes(PALETTES_ALL, 0x10, RGB_BLACK);
        BeginNormalPaletteFade(PALETTES_ALL, 0, 16, 0, RGB_BLACK);
        SetVBlankCallback(sub_8152034);
        gUnknown_203F3E0->unk0C++;
        break;
    case 7:
        UpdatePaletteFade();
        if (!gPaletteFade.active)
        {
            gUnknown_203F3E0->unk0C++;
        }
        break;
    default:
        DestroyTask(taskId);
        sub_815206C(sub_81516DC);
        break;
    }
}

static void sub_8150C08(u8 taskId)
{
    sub_8151B54();
    sUnknown_8475578[gUnknown_203F3E0->unk18]();
    if (!gUnknown_3002044)
    {
        sub_815293C();
    }
    sub_8151BA0();
}

static void sub_8150C40(u8 taskId)
{
    sub_8151C5C();
    sUnknown_84755A8[gUnknown_203F3E0->unk18]();
    if (!gUnknown_3002044)
    {
        sub_8152970();
    }
    sub_8151D28();
}

static void sub_8150C78(void)
{
    switch (gUnknown_203F3E0->unk10)
    {
    case 0:
        sub_8153BF8(1);
        sub_81549D4(1);
        gUnknown_203F3E0->unk10++;
        break;
    case 1:
        if (!sub_8155E68())
            sub_8152090(1);
        break;
    }
}

static void sub_8150CBC(void)
{
    if (gUnknown_203F3E0->unk10 == 0)
    {
        sub_8152110();
        gUnknown_203F3E0->unk10++;
    }
    else
    {
        gUnknown_203F3E0->unk118 = 1;
        sub_8152090(2);
    }
}

static void sub_8150CF4(void)
{
    switch (gUnknown_203F3E0->unk10)
    {
    case 0:
        StartMinigameCountdown(7, 8, 120, 80, 0);
        gUnknown_203F3E0->unk10++;
        break;
    case 1:
        Rfu_SetLinkStandbyCallback();
        gUnknown_203F3E0->unk10++;
        break;
    case 2:
        if (IsLinkTaskFinished())
        {
            gUnknown_203F3E0->unk10++;
        }
        break;
    case 3:
        if (!IsMinigameCountdownRunning())
        {
            Rfu_SetLinkStandbyCallback();
            gUnknown_203F3E0->unk10++;
        }
        break;
    case 4:
        if (IsLinkTaskFinished())
        {
            sub_8152090(3);
        }
        break;
    }
}

static void sub_8150D7C(void)
{
    if (gUnknown_203F3E0->unk10 == 0)
    {
        if (gUnknown_203F3E0->unk11C != 0)
        {
            sub_8152090(4);
        }
    }
}

static void sub_8150DA4(void)
{
    if (gUnknown_203F3E0->unk10 == 0)
    {
        if (gUnknown_203F3E0->unk40 < 10)
        {
            if (gUnknown_203F3E0->unkA8[0] == 0)
            {
                if (JOY_NEW(DPAD_UP))
                {
                    if (gUnknown_203F3E0->unk31A0[0].unk2C.unk0 == 0)
                    {
                        gUnknown_203F3E0->unk31A0[0].unk2C.unk4 = 0;
                        gUnknown_203F3E0->unk31A0[0].unk2C.unk0 = sub_815327C(2);
                    }
                }
                else if (JOY_NEW(DPAD_RIGHT))
                {
                    if (gUnknown_203F3E0->unk31A0[0].unk2C.unk0 == 0)
                    {
                        gUnknown_203F3E0->unk31A0[0].unk2C.unk4 = 0;
                        gUnknown_203F3E0->unk31A0[0].unk2C.unk0 = sub_815327C(1);
                    }
                }
                else if (JOY_NEW(DPAD_LEFT))
                {
                    if (gUnknown_203F3E0->unk31A0[0].unk2C.unk0 == 0)
                    {
                        gUnknown_203F3E0->unk31A0[0].unk2C.unk4 = 0;
                        gUnknown_203F3E0->unk31A0[0].unk2C.unk0 = sub_815327C(3);
                    }
                }
                else
                {
                    gUnknown_203F3E0->unk31A0[0].unk2C.unk0 = sub_815327C(0);
                }
            }
        }
        else
        {
            sub_8152090(11);
        }
        sub_815256C();
        sub_8151D98();
    }
}
static void sub_8150E68(void)
{
    if (gUnknown_203F3E0->unk40 < 10)
    {
        if (JOY_NEW(DPAD_UP))
        {
            if (gUnknown_203F3E0->unk31A0[gUnknown_203F3E0->multiplayerId].unk2C.unk0 == 0)
            {
                gUnknown_203F3E0->unk32CC.unk2C.unk0 = 2;
            }
        }
        else if (JOY_NEW(DPAD_RIGHT))
        {
            if (gUnknown_203F3E0->unk31A0[gUnknown_203F3E0->multiplayerId].unk2C.unk0 == 0)
            {
                gUnknown_203F3E0->unk32CC.unk2C.unk0 = 1;
            }
        }
        else if (JOY_NEW(DPAD_LEFT))
        {
            if (gUnknown_203F3E0->unk31A0[gUnknown_203F3E0->multiplayerId].unk2C.unk0 == 0)
            {
                gUnknown_203F3E0->unk32CC.unk2C.unk0 = 3;
            }
        }
        else
        {
            gUnknown_203F3E0->unk32CC.unk2C.unk0 = 0;
        }
    }
    else
    {
        sub_8152090(11);
    }
    sub_8151E94();
}

static void sub_8150F40(void)
{
    u8 i;

    sub_815256C();
    sub_8151D98();
    if (sub_8152A98() == 1)
    {
        sub_8153004();
        sub_8152090(5);
    }
    else
    {
        gUnknown_203F3E0->unk12C = 1;
        for (i = 1; i < gUnknown_203F3E0->unk24; i++)
        {
            if (gUnknown_203F3E0->unk130[i] != 1)
            {
                gUnknown_203F3E0->unk12C = 0;
                break;
            }
        }
    }
}

static void sub_8150FC4(void)
{
    sub_8151E94();
    if (sub_8152AD8() == 1)
        sub_8152090(5);
}

static void sub_8150FDC(void)
{
    u8 blockReceivedStatus;
    u8 i;
    switch (gUnknown_203F3E0->unk10)
    {
    case 0:
        SendBlock(0, gUnknown_203F3E0->unk4A, sizeof(gUnknown_203F3E0->unk4A));
        gUnknown_203F3E0->unk08 = 0;
        gUnknown_203F3E0->unk10++;
        break;
    case 1:
        if (IsLinkTaskFinished())
        {
            gUnknown_203F3E0->unk10++;
        }
        break;
    case 2:
        blockReceivedStatus = GetBlockReceivedStatus();
        for (i = 0; i < gUnknown_203F3E0->unk24; blockReceivedStatus >>= 1, i++)
        {
            if (blockReceivedStatus & 1)
            {
                ResetBlockReceivedFlag(i);
                gUnknown_203F3E0->unk08++;
            }
        }
        if (gUnknown_203F3E0->unk08 >= gUnknown_203F3E0->unk24)
        {
            gUnknown_203F3E0->unk14++;
            gUnknown_203F3E0->unk10++;
        }
        break;
    default:
        if (WaitFanfare(TRUE))
        {
            sub_8152090(6);
            FadeOutAndPlayNewMapMusic(MUS_VICTORY_WILD, 4);
        }
        break;
    }
}

static void sub_815109C(void)
{
    u8 i;
    u8 blockReceivedStatus;

    switch (gUnknown_203F3E0->unk10) {
    case 0:
        SendBlock(0, gUnknown_203F3E0->unk4A[gUnknown_203F3E0->unk14], sizeof(gUnknown_203F3E0->unk4A));
        gUnknown_203F3E0->unk08 = 0;
        gUnknown_203F3E0->unk10++;
        break;
    case 1:
        if (IsLinkTaskFinished()) {
            gUnknown_203F3E0->unk10++;
        }
        break;
    case 2:
        blockReceivedStatus = GetBlockReceivedStatus();
        for (i = 0; i < gUnknown_203F3E0->unk24; blockReceivedStatus >>= 1, i++)
        {
            if (blockReceivedStatus & 1)
            {
                memcpy(gUnknown_203F3E0->unk4A, gBlockRecvBuffer, sizeof(gUnknown_203F3E0->unk4A));
                ResetBlockReceivedFlag(i);
                gUnknown_203F3E0->unk08++;
            }
        }
        if (gUnknown_203F3E0->unk08 >= gUnknown_203F3E0->unk24) {
            gUnknown_203F3E0->unk14++;
            gUnknown_203F3E0->unk10++;
        }
        break;
    default:
        if (WaitFanfare(TRUE)) {
            gUnknown_203F3E0->unk114 = gUnknown_203F3E0->unk4A[gUnknown_203F3E0->multiplayerId][5];
            sub_8152090(6);
            FadeOutAndPlayNewMapMusic(MUS_VICTORY_WILD, 4);
        }
        break;
    }
}

static void sub_8151198(void)
{
    u8 sp00;
    u8 i;
    u8 blockReceivedStatus;

    switch (gUnknown_203F3E0->unk10)
    {
    case 0:
        sub_81531FC();
        sub_81540DC(TRUE);
        sub_81544F0();
        sub_81545BC(TRUE);
        sub_81549D4(2);
        gUnknown_203F3E0->unk10++;
        break;
    case 1:
        if (!sub_8155E68())
        {
            sp00 = 1;
            sub_81549D4(5);
            sp00 = sub_8155E8C();
            SendBlock(0, &sp00, sizeof(sp00));
            gUnknown_203F3E0->unk10++;
        }
        break;
    case 2:
        if (IsLinkTaskFinished())
        {
            gUnknown_203F3E0->unk10++;
            gUnknown_203F3E0->unk08 = 0;
        }
        break;
    case 3:
        blockReceivedStatus = GetBlockReceivedStatus();
        for (i = 0; i < gUnknown_203F3E0->unk24; blockReceivedStatus >>= 1, i++)
        {
            if (blockReceivedStatus & 1)
            {
                *(gUnknown_203F3E0->unk10C + i) = *(u8 *)gBlockRecvBuffer[i];
                ResetBlockReceivedFlag(i);
                gUnknown_203F3E0->unk08++;
            }
        }
        if (gUnknown_203F3E0->unk08 >= gUnknown_203F3E0->unk24) {
            if (++gUnknown_203F3E0->unk14 >= 120)
            {
                sub_81549D4(6);
                gUnknown_203F3E0->unk10++;
            }
        }
        break;
    default:
        if (!sub_8155E68())
        {
            sub_8152090(7);
        }
        break;
    }
}

static void sub_81512B4(void)
{
    u8 sp0;
    u8 i;
    u8 blockReceivedStatus;

    switch (gUnknown_203F3E0->unk10)
    {
    case 0:
        if (sub_81534AC() >= 3000)
        {
            sub_81549D4(4);
        }
        gUnknown_203F3E0->unk10++;
        break;
    case 1:
        if (!sub_8155E68())
        {
            sub_81549D4(3);
            gUnknown_203F3E0->unk10++;
        }
        break;
    case 2:
        sub_81546C0();
        sub_8153048();
        gUnknown_203F3E0->unk10++;
        break;
    case 3:
        if ((sp0 = sub_8155E8C()) != 0)
        {
            gUnknown_203F3E0->unk10++;
        }
        break;
    case 4:
        if (!sub_8155E68())
        {
            sub_81549D4(5);
            sp0 = sub_8155E8C();
            SendBlock(0, &sp0, sizeof(sp0));
            gUnknown_203F3E0->unk10++;
        }
        break;
    case 5:
        if (IsLinkTaskFinished())
        {
            gUnknown_203F3E0->unk10++;
            gUnknown_203F3E0->unk08 = 0;
        }
        break;
    case 6:
        blockReceivedStatus = GetBlockReceivedStatus();
        for (i = 0; i < gUnknown_203F3E0->unk24; blockReceivedStatus >>= 1, i++)
        {
            if (blockReceivedStatus & 1)
            {
                *(gUnknown_203F3E0->unk10C + i) = *(u8 *)gBlockRecvBuffer[i];
                ResetBlockReceivedFlag(i);
                gUnknown_203F3E0->unk08++;
            }
        }
        if (gUnknown_203F3E0->unk08 >= gUnknown_203F3E0->unk24) {
            if (++gUnknown_203F3E0->unk14 >= 120)
            {
                sub_815336C();
                sub_81549D4(6);
                gUnknown_203F3E0->unk10++;
            }
        }
        else
        {
            sub_81532B8();
        }
        break;
    default:
        if (!sub_8155E68())
        {
            for (i = 0; i < gUnknown_203F3E0->unk24; i++)
            {
                if (gUnknown_203F3E0->unk10C[i] == 2)
                {
                    sub_8152090(8);
                    return;
                }
            }
            sub_8152090(10);
        }
        break;
    }
}

static void sub_8151488(void)
{
    switch (gUnknown_203F3E0->unk10)
    {
    case 0:
        SetCloseLinkCallback();
        sub_81549D4(7);
        gUnknown_203F3E0->unk10++;
        break;
    case 1:
        if (!sub_8155E68())
        {
            gUnknown_203F3E0->unk10++;
        }
        break;
    case 2:
        if (sub_8155E8C() == 5)
        {
            gUnknown_203F3E0->unk10++;
        }
        break;
    default:
        if (!gReceivedRemoteLinkPlayers)
        {
            sub_8152090(9);
        }
        break;
    }
}

static void sub_81514F0(void)
{
    switch (gUnknown_203F3E0->unk10)
    {
    case 0:
        BeginNormalPaletteFade(PALETTES_ALL, 0, 0, 16, RGB_BLACK);
        gUnknown_203F3E0->unk10++;
        break;
    case 1:
        UpdatePaletteFade();
        if (!gPaletteFade.active)
        {
            gUnknown_203F3E0->unk10++;
        }
        break;
    case 2:
        sub_8154274();
        sub_8153ED8();
        sub_8153D08(gUnknown_203F3E0->unk24);
        sub_8154578();
        gUnknown_3002044 = TRUE;
        sub_81549D4(8);
        gUnknown_203F3E0->unk10++;
        break;
    default:
        if (!sub_8155E68())
        {
            SetMainCallback2(gUnknown_203F3E0->savedCallback);
            DestroyTask(gUnknown_203F3E0->unk04);
            Free(gUnknown_203F3E0);
            FreeAllWindowBuffers();
        }
        break;
    }
}

static void sub_815159C(void)
{
    switch (gUnknown_203F3E0->unk10)
    {
    case 0:
        sub_81549D4(9);
        BeginNormalPaletteFade(PALETTES_ALL, 0, 0, 16, RGB_BLACK);
        gUnknown_203F3E0->unk10++;
        break;
    case 1:
        UpdatePaletteFade();
        if (!gPaletteFade.active)
        {
            gUnknown_203F3E0->unk10++;
        }
        break;
    case 2:
        ChangeBgX(0, 0, 0);
        ChangeBgY(0, 0, 0);
        ChangeBgX(1, 0, 0);
        ChangeBgY(1, 0, 0);
        ChangeBgX(2, 0, 0);
        ChangeBgY(2, 0, 0);
        ChangeBgX(3, 0, 0);
        ChangeBgY(3, 0, 0);
        gUnknown_203F3E0->unk10++;
        break;
    case 3:
        StopMapMusic();
        gUnknown_203F3E0->unk10++;
        break;
    case 4:
        PlayNewMapMusic(MUS_BERRY_PICK);
        sub_8154540();
        gUnknown_203F3E0->unk10++;
        break;
    case 5:
        BlendPalettes(PALETTES_ALL, 16, RGB_BLACK);
        BeginNormalPaletteFade(PALETTES_ALL, 0, 16, 0, RGB_BLACK);
        gUnknown_203F3E0->unk10++;
        break;
    case 6:
        UpdatePaletteFade();
        if (!gPaletteFade.active)
        {
            gUnknown_203F3E0->unk10++;
        }
        break;
    default:
        DestroyTask(gUnknown_203F3E0->unk04);
        sub_815206C(sub_81516DC);
        sub_8154730();
        sub_81508EC(gUnknown_203F3E0);
        if (!gReceivedRemoteLinkPlayers)
        {
            gUnknown_203F3E0->unk24 = 1;
        }
        sub_8153150();
        sub_81545BC(FALSE);
        break;
    }
}

static void sub_81516DC(u8 taskId)
{
    switch (gUnknown_203F3E0->unk10)
    {
    case 0:
        if (sub_81520B4() == 1)
        {
            gUnknown_203F3E0->unk10++;
        }
        break;
    case 1:
        sub_8153DD8();
        gUnknown_203F3E0->unk10++;
        break;
    case 2:
        if (sub_8153F1C() == TRUE)
        {
            gUnknown_203F3E0->unk10++;
        }
        break;
    default:
        if (gUnknown_203F3E0->unk20 != 0)
        {
            sub_815206C(sub_8150C08);
        }
        else
        {
            sub_815206C(sub_8150C40);
        }
        DestroyTask(taskId);
        break;
    }
}

static void sub_8151750(u8 taskId)
{
    s16 * data = gTasks[taskId].data;
    u8 i;
    u8 blockReceivedStatus;

    switch (data[0])
    {
    case 0:
        SendBlock(0, &gUnknown_203F3E0->unk318C[gUnknown_203F3E0->multiplayerId].isShiny, sizeof(gUnknown_203F3E0->unk318C[gUnknown_203F3E0->multiplayerId].isShiny));
        gUnknown_203F3E0->unk08 = 0;
        data[0]++;
        break;
    case 1:
        if (IsLinkTaskFinished())
        {
            data[0]++;
        }
        break;
    case 2:
        blockReceivedStatus = GetBlockReceivedStatus();
        for (i = 0; i < gUnknown_203F3E0->unk24; blockReceivedStatus >>= 1, i++)
        {
            if (blockReceivedStatus & 1)
            {
                *(u8 *)&gUnknown_203F3E0->unk318C[i] = *(u8 *)gBlockRecvBuffer[i];
                ResetBlockReceivedFlag(i);
                gUnknown_203F3E0->unk08++;
            }
        }
        if (gUnknown_203F3E0->unk08 >= gUnknown_203F3E0->unk24)
        {
            DestroyTask(taskId);
            sub_81549D4(6);
            gUnknown_203F3E0->unk10++;
        }
        break;
    }
}

static void sub_815184C(void)
{
    u8 i;
    u8 r7 = gUnknown_203F3E0->unk24;

    gUnknown_203F3E0->unk31A0[0].unk10 = sub_815A950(0, &gUnknown_203F3E0->unk31A0[0], &gUnknown_203F3E0->unk31A0[0].unk2C, &gUnknown_203F3E0->unk31A0[1].unk2C, &gUnknown_203F3E0->unk31A0[2].unk2C, &gUnknown_203F3E0->unk31A0[3].unk2C, &gUnknown_203F3E0->unk31A0[4].unk2C, &gUnknown_203F3E0->unk40, &gUnknown_203F3E0->unk120, &gUnknown_203F3E0->unk12C);
    gUnknown_203F3E0->unk128 = 1;

    for (i = 1; i < r7; i++)
    {
        if (   gUnknown_203F3E0->unkA8[i] == 0
               && sub_815AB04(i, &gUnknown_203F3E0->unk31A0[i].unk2C.unk0) == 0)
        {
            gUnknown_203F3E0->unk31A0[i].unk2C.unk0 = 0;
            gUnknown_203F3E0->unk128 = 0;
        }
    }
    if (++gUnknown_203F3E0->unk124 >= 60)
    {
        if (gUnknown_203F3E0->unk128 != 0)
        {
            ClearRecvCommands();
            gUnknown_203F3E0->unk124 = 0;
        }
        else if (gUnknown_203F3E0->unk124 > 70)
        {
            ClearRecvCommands();
            gUnknown_203F3E0->unk124 = 0;
        }
    }

    for (i = 0; i < r7; i++)
    {
        if (   gUnknown_203F3E0->unk31A0[i].unk2C.unk0 != 0
               && gUnknown_203F3E0->unkA8[i] == 0)
        {
            gUnknown_203F3E0->unkA8[i] = 1;
        }
        switch (gUnknown_203F3E0->unkA8[i])
        {
        case 0:
        default:
            break;
        case 1 ... 3:
            if (++gUnknown_203F3E0->unkB0[i] >= 6)
            {
                gUnknown_203F3E0->unkB0[i] = 0;
                gUnknown_203F3E0->unkA8[i] = 0;
                gUnknown_203F3E0->unk31A0[i].unk2C.unk0 = 0;
                gUnknown_203F3E0->unk31A0[i].unk2C.unk4 = 0;
                gUnknown_203F3E0->unk31A0[i].unk2C.unk8 = 0;
            }
            break;
        case 4:
            if (++gUnknown_203F3E0->unkB0[i] >= 40)
            {
                gUnknown_203F3E0->unkB0[i] = 0;
                gUnknown_203F3E0->unkA8[i] = 0;
                gUnknown_203F3E0->unk31A0[i].unk2C.unk0 = 0;
                gUnknown_203F3E0->unk31A0[i].unk2C.unk4 = 0;
                gUnknown_203F3E0->unk31A0[i].unk2C.unk8 = 0;
            }
            break;
        }
    }
}

static void sub_8151A5C(void)
{
    u8 i;
    u8 r6 = gUnknown_203F3E0->unk24;

    gUnknown_203F3E0->unk31A0[0].unk10 = sub_815A950(0, &gUnknown_203F3E0->unk31A0[0], &gUnknown_203F3E0->unk31A0[0].unk2C, &gUnknown_203F3E0->unk31A0[1].unk2C, &gUnknown_203F3E0->unk31A0[2].unk2C, &gUnknown_203F3E0->unk31A0[3].unk2C, &gUnknown_203F3E0->unk31A0[4].unk2C, &gUnknown_203F3E0->unk40, &gUnknown_203F3E0->unk120, &gUnknown_203F3E0->unk12C);
    gUnknown_203F3E0->unk128 = 1;

    for (i = 1; i < r6; i++)
    {
        if (sub_815AB60(i) != 0)
        {
            gUnknown_203F3E0->unk130[i] = 1;
            gUnknown_203F3E0->unk128 = 0;
        }
    }
    if (++gUnknown_203F3E0->unk124 >= 60)
    {
        if (gUnknown_203F3E0->unk128 != 0)
        {
            ClearRecvCommands();
            gUnknown_203F3E0->unk124 = 0;
        }
        else if (gUnknown_203F3E0->unk124 > 70)
        {
            ClearRecvCommands();
            gUnknown_203F3E0->unk124 = 0;
        }
    }
}

static void sub_8151B54(void)
{
    switch (gUnknown_203F3E0->unk18)
    {
    case 3:
        if (sub_8152A00() == TRUE)
        {
            sub_8152A70();
            gUnknown_203F3E0->unk11C = 1;
        }
        break;
    case 4:
        sub_815184C();
        break;
    case 11:
        sub_8151A5C();
        break;
    }
}

static void sub_8151BA0(void)
{
    switch (gUnknown_203F3E0->unk18)
    {
    case 4:
        sub_815A61C(&gUnknown_203F3E0->unk32CC, &gUnknown_203F3E0->unk31A0[0].unk2C, &gUnknown_203F3E0->unk31A0[1].unk2C, &gUnknown_203F3E0->unk31A0[2].unk2C, &gUnknown_203F3E0->unk31A0[3].unk2C, &gUnknown_203F3E0->unk31A0[4].unk2C, gUnknown_203F3E0->unk40, gUnknown_203F3E0->unk120, gUnknown_203F3E0->unk12C);
        break;
    case 11:
        sub_815A61C(&gUnknown_203F3E0->unk32CC, &gUnknown_203F3E0->unk31A0[0].unk2C, &gUnknown_203F3E0->unk31A0[1].unk2C, &gUnknown_203F3E0->unk31A0[2].unk2C, &gUnknown_203F3E0->unk31A0[3].unk2C, &gUnknown_203F3E0->unk31A0[4].unk2C, gUnknown_203F3E0->unk40, gUnknown_203F3E0->unk120, gUnknown_203F3E0->unk12C);
        break;
    }
}

static void sub_8151C5C(void)
{
    switch (gUnknown_203F3E0->unk18)
    {
    case 4:
        sub_815A950(gUnknown_203F3E0->multiplayerId, &gUnknown_203F3E0->unk31A0[gUnknown_203F3E0->multiplayerId], &gUnknown_203F3E0->unk31A0[0].unk2C, &gUnknown_203F3E0->unk31A0[1].unk2C, &gUnknown_203F3E0->unk31A0[2].unk2C, &gUnknown_203F3E0->unk31A0[3].unk2C, &gUnknown_203F3E0->unk31A0[4].unk2C, &gUnknown_203F3E0->unk40, &gUnknown_203F3E0->unk120, &gUnknown_203F3E0->unk12C);
        break;
    case 11:
        sub_815A950(gUnknown_203F3E0->multiplayerId, &gUnknown_203F3E0->unk31A0[gUnknown_203F3E0->multiplayerId], &gUnknown_203F3E0->unk31A0[0].unk2C, &gUnknown_203F3E0->unk31A0[1].unk2C, &gUnknown_203F3E0->unk31A0[2].unk2C, &gUnknown_203F3E0->unk31A0[3].unk2C, &gUnknown_203F3E0->unk31A0[4].unk2C, &gUnknown_203F3E0->unk40, &gUnknown_203F3E0->unk120, &gUnknown_203F3E0->unk12C);
        break;
    }
}

static void sub_8151D28(void)
{
    switch (gUnknown_203F3E0->unk18)
    {
    case 3:
        sub_815A5BC(1);
        gUnknown_203F3E0->unk11C = 1;
        break;
    case 4:
        if (gUnknown_203F3E0->unk32CC.unk2C.unk0 != 0)
        {
            sub_815AAD8(gUnknown_203F3E0->unk32CC.unk2C.unk0);
        }
        break;
    case 11:
        if (gUnknown_203F3E0->unk120 == 0 && gUnknown_203F3E0->unk12C == 0)
        {
            sub_815AB3C(1);
        }
        break;
    }
}

static void sub_8151D98(void)
{
    if (gUnknown_203F3E0->unk31A0[gUnknown_203F3E0->multiplayerId].unk2C.unk0 == 0)
    {
        if (!IsSEPlaying())
        {
            gUnknown_203F3E0->unk144 = 0;
        }
    }
    else if (gUnknown_203F3E0->unk31A0[gUnknown_203F3E0->multiplayerId].unk2C.unk4 == 1)
    {
        if (gUnknown_203F3E0->unk144 == 0)
        {
            m4aSongNumStop(SE_SUCCESS);
            PlaySE(SE_SUCCESS);
            gUnknown_203F3E0->unk144 = 1;
        }
    }
    else if (gUnknown_203F3E0->unk31A0[gUnknown_203F3E0->multiplayerId].unk2C.unk8 == 1)
    {
        if (gUnknown_203F3E0->unk144 == 0 && !IsSEPlaying())
        {
            PlaySE(SE_BOO);
            sub_8153BC0(1);
            gUnknown_203F3E0->unk144 = 1;
        }
    }

    if (gUnknown_203F3E0->unk154 == 0 && gUnknown_203F3E0->unk40 >= 10)
    {
        StopMapMusic();
        gUnknown_203F3E0->unk154 = 1;
    }
    else if (gUnknown_203F3E0->unk154 == 1)
    {
        PlayFanfareByFanfareNum(FANFARE_TOO_BAD);
        gUnknown_203F3E0->unk154 = 2;
    }
}

static void sub_8151E94(void)
{
    u8 r8 = gUnknown_203F3E0->unk44;
    u8 r7 = gUnknown_203F3E0->unk48;
    u8 r4;
    if (gUnknown_203F3E0->unk31A0[gUnknown_203F3E0->multiplayerId].unk2C.unk0 == 0)
    {
        if (gUnknown_203F3E0->unk31A0[gUnknown_203F3E0->multiplayerId].unk2C.unk4 != 1 && gUnknown_203F3E0->unk31A0[gUnknown_203F3E0->multiplayerId].unk2C.unk8 != 1)
        {
            gUnknown_203F3E0->unk144 = 0;
        }
    }
    else if (gUnknown_203F3E0->unk31A0[gUnknown_203F3E0->multiplayerId].unk2C.unk4 == 1)
    {
        if (gUnknown_203F3E0->unk144 == 0)
        {
            m4aSongNumStop(SE_SUCCESS);
            PlaySE(SE_SUCCESS);
            gUnknown_203F3E0->unk144 = 1;
        }
    }
    else if (gUnknown_203F3E0->unk31A0[gUnknown_203F3E0->multiplayerId].unk2C.unk8 == 1)
    {
        if (gUnknown_203F3E0->unk144 == 0 && !IsSEPlaying())
        {
            PlaySE(SE_BOO);
            sub_8153BC0(1);
            gUnknown_203F3E0->unk144 = 1;
        }
    }
    for (r4 = r8; r4 < r7; r4++)
    {
        struct DodrioSubstruct_31A0_14 * ptr = &gUnknown_203F3E0->unk31A0[gUnknown_203F3E0->multiplayerId].unk14;
        if (ptr->unkB[r4] >= 10)
        {
            if (gUnknown_203F3E0->unk148[r4] == 0)
            {
                PlaySE(SE_BALLOON_RED + ptr->unk0[r4]);
                gUnknown_203F3E0->unk148[r4] = 1;
            }
        }
        else
        {
            gUnknown_203F3E0->unk148[r4] = 0;
        }
    }
    if (gUnknown_203F3E0->unk154 == 0 && gUnknown_203F3E0->unk40 >= 10)
    {
        StopMapMusic();
        gUnknown_203F3E0->unk154 = 1;
    }
    else if (gUnknown_203F3E0->unk154 == 1)
    {
        PlayFanfareByFanfareNum(FANFARE_TOO_BAD);
        gUnknown_203F3E0->unk154 = 2;
    }
}

static void sub_815201C(void)
{
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

static void sub_8152034(void)
{
    TransferPlttBuffer();
    LoadOam();
    ProcessSpriteCopyRequests();
}

static void sub_8152048(struct DodrioSubstruct_318C * a0, struct Pokemon * a1)
{
    a0->isShiny = IsMonShiny(a1);
}

static void sub_815205C(TaskFunc func, u8 priority)
{
    CreateTask(func, priority);
}

static void sub_815206C(TaskFunc func)
{
    gUnknown_203F3E0->unk04 = CreateTask(func, 1);
    gUnknown_203F3E0->unk10 = 0;
    gUnknown_203F3E0->unk0C = 0;
    gUnknown_203F3E0->unk14 = 0;
}

static void sub_8152090(u8 a0)
{
    gUnknown_203F3E0->unk1C = gUnknown_203F3E0->unk18;
    gUnknown_203F3E0->unk18 = a0;
    gUnknown_203F3E0->unk10 = 0;
    gUnknown_203F3E0->unk14 = 0;
}

static bool32 sub_81520B4(void)
{
    u8 r2 = gUnknown_203F3E0->unk14 / 4;
    gUnknown_203F3E0->unk14++;
    if (r2 != 0 && gUnknown_203F3E0->unk14 % 4 == 0)
    {
        if (r2 < sUnknown_8475548[gUnknown_203F3E0->unk24 - 1])
        {
            SetGpuReg(REG_OFFSET_BG1HOFS,  (r2 * 8));
            SetGpuReg(REG_OFFSET_BG2HOFS, -(r2 * 8));
            return FALSE;
        }
        else
        {
            return TRUE;
        }
    }
    else
    {
        return FALSE;
    }
}

static void sub_8152110(void)
{
    u8 i;
    u8 start = gUnknown_203F3E0->unk44;
    u8 finish = gUnknown_203F3E0->unk48;

    for (i = start; i < finish; i++)
    {
        struct DodrioSubstruct_31A0_14 * ptr = &gUnknown_203F3E0->unk32CC.unk14;
        ptr->unkB[i] = (i % 2 == 0) ? 1 : 0;
        ptr->unk0[i] = 0;
    }
}

static void sub_8152174(void)
{
    u8 sp0 = gUnknown_203F3E0->unk44;
    u8 sp4 = gUnknown_203F3E0->unk48;
    u8 sp8 = gUnknown_203F3E0->unk24;
    u8 i, j, k, r5;

    if (gUnknown_203F3E0->unk40 >= 10)
        return;

    for (i = 0; i < sp8; i++)
    {
        u8 *ptr = &gUnknown_203F3E0->unk31A0[i].unk2C.unk0;
        if (*ptr != 0 && gUnknown_203F3E0->unkA8[i] == 1)
        {
            for (j = sp0; j < sp4; j++)
            {
                r5 = sUnknown_8471F50[0][0][j];
                if (gUnknown_203F3E0->unkF4[r5][0] == i || gUnknown_203F3E0->unkF4[r5][1] == i)
                    break;
                if (sub_8152484(i, *ptr, r5) == TRUE)
                {
                    for (k = 0; k < 2; k++)
                    {
                        if (gUnknown_203F3E0->unkF4[r5][k] == 0xFF)
                        {
                            gUnknown_203F3E0->unkF4[r5][k] = i;
                            gUnknown_203F3E0->unkA8[i] = 2;
                            gUnknown_203F3E0->unkC4[r5] = 1;
                            break;
                        }
                    }
                    break;
                }
                if (gUnknown_203F3E0->unk31A0[i].unk2C.unk8 == 1)
                    break;
            }
        }
    }

    for (j = sp0; j < sp4; j++)
    {
        u8 id = 0xFF;
        r5 = sUnknown_8471F50[0][0][j];
        if (gUnknown_203F3E0->unkC4[r5] == 1)
        {
            s32 r2;
            u8 r4, r3 = gUnknown_203F3E0->unk90[sub_8152BD4(r5)] / 7;
            if (r3 >= NELEMS(sUnknown_847553C) - 1)
                r3 = NELEMS(sUnknown_847553C) - 1;

            r2 = sUnknown_847553C[r3][gUnknown_203F3E0->unk31A0[0].unk14.unk0[r5]] - gUnknown_203F3E0->unkD0[r5];
            if (r2 < 6)
                gUnknown_203F3E0->unk9C[r5] += r2;

            if (++gUnknown_203F3E0->unk9C[r5] >= 6)
            {
                gUnknown_203F3E0->unk9C[r5] = 0;
                if (gUnknown_203F3E0->unkF4[r5][0] == 0xFF && gUnknown_203F3E0->unkF4[r5][1] == 0xFF)
                {
                    continue;
                }
                else if (gUnknown_203F3E0->unkF4[r5][0] != 0xFF && gUnknown_203F3E0->unkF4[r5][1] == 0xFF)
                {
                    r4 = gUnknown_203F3E0->unkF4[r5][0];
                }
                else
                {
                    u8 unk0 = gUnknown_203F3E0->unkF4[r5][0];
                    i = gUnknown_203F3E0->unkF4[r5][1]; // Have to re-use the variable to match.
                    if (!(Random() & 1))
                    {
                        r4 = unk0;
                        id = i;
                    }
                    else
                    {
                        r4 = i;
                        id = unk0;
                    }
                }
                gUnknown_203F3E0->unk32CC.unk14.unkB[r5] = 7;
                gUnknown_203F3E0->unkC4[r5] = 2;
                gUnknown_203F3E0->unkA8[r4] = 3;
                gUnknown_203F3E0->unkB8[r5] = r4;
                gUnknown_203F3E0->unk31A0[r4].unk2C.unk4 = 1;
                gUnknown_203F3E0->unk31A0[id].unk2C.unk8 = 1;
                gUnknown_203F3E0->unk86[r4]++;
                sub_8152D34(0, r5, r4);
                sub_8152F94(TRUE);
                sub_8152B64(r4);
                gUnknown_203F3E0->unkE8[r5] = gUnknown_203F3E0->unk32CC.unk14.unk0[r5];
                gUnknown_203F3E0->unk32CC.unk14.unk0[r5] = 3;
                gUnknown_203F3E0->unkF4[r5][0] = 0xFF;
                gUnknown_203F3E0->unkF4[r5][1] = 0xFF;
            }
        }
    }
}

static bool32 sub_8152484(u8 a0, u8 a1, u8 a2)
{
    s32 r7 = 0;
    u8 r5 = gUnknown_203F3E0->unk24 - 1;
    struct DodrioSubstruct_31A0_14 * ptr = &gUnknown_203F3E0->unk32CC.unk14;

    switch (a1)
    {
    case 3:
    default:
        r7 = 0;
        break;
    case 2:
        r7 = 1;
        break;
    case 1:
        r7 = 2;
        break;
    }
    if (ptr->unkB[a2] == 6 || ptr->unkB[a2] == 7)
    {
        if (a2 == sUnknown_8472063[r5][a0][r7])
        {
            if (gUnknown_203F3E0->unkC4[a2] == 1 || gUnknown_203F3E0->unkC4[a2] == 2)
            {
                gUnknown_203F3E0->unk31A0[a0].unk2C.unk8 = 1;
                return FALSE;
            }
            else
            {
                return TRUE;
            }
        }
    }
    else
    {
        if (a2 == sUnknown_8472063[r5][a0][r7])
        {
            gUnknown_203F3E0->unkA8[a0] = 4;
            gUnknown_203F3E0->unk31A0[a0].unk2C.unk8 = 1;
        }
    }
    return FALSE;
}

static void sub_815256C(void)
{
    u8 r1 = gUnknown_203F3E0->unk44;
    u8 r9 = gUnknown_203F3E0->unk48;
    u8 r3 = 0;
    u8 r10 = 0;
    u8 i;
    u8 r2;
    struct DodrioStruct * ptr;

    gUnknown_203F3E0->unk120 = 0;

    for (i = r1; i < r9 - 1; i++)
    {
        ptr = gUnknown_203F3E0;

        if (gUnknown_203F3E0->unkC4[i] == 0 || gUnknown_203F3E0->unkC4[i] == 1)
        {
            gUnknown_203F3E0->unk120 = 1;
            if (ptr->unk32CC.unk14.unkB[i] >= 10)
            {
                ptr->unk32CC.unk14.unkB[i] = 10;
                gUnknown_203F3E0->unkC4[i] = 3;
                if (gUnknown_203F3E0->unk148[i] == 0)
                {
                    gUnknown_203F3E0->unk148[i] = 1;
                    PlaySE(SE_BALLOON_RED + ptr->unk32CC.unk14.unk0[i]);
                }
                if (gUnknown_203F3E0->unk40 < 10 || r10 == 1)
                {
                    r10 = 1;
                    gUnknown_203F3E0->unk148[i] = 0;
                    if (gUnknown_203F3E0->unk40 < 10)
                    {
                        gUnknown_203F3E0->unk40++;
                    }
                    sub_8152D34(3, i, 0);
                    sub_8152F94(FALSE);
                }
            }
            else
            {
                r3 = gUnknown_203F3E0->unk90[sub_8152BD4(i)] / 7;
                if (r3 >= NELEMS(sUnknown_847553C) - 1)
                {
                    r3 = NELEMS(sUnknown_847553C) - 1;
                }
                r2 = sUnknown_847553C[r3][ptr->unk32CC.unk14.unk0[i]];
                if (++gUnknown_203F3E0->unkD0[i] >= r2)
                {
                    ptr->unk32CC.unk14.unkB[i]++;
                    gUnknown_203F3E0->unkD0[i] = 0;
                }
                sub_8152174();
            }
        }
        else if (gUnknown_203F3E0->unkC4[i] == 2)
        {
            // gUnknown_203F3E0->unk120 = 1;
            if (++gUnknown_203F3E0->unkDC[i] >= 20)
            {
                gUnknown_203F3E0->unk31A0[gUnknown_203F3E0->unkB8[i]].unk2C.unk4 = 0;
                gUnknown_203F3E0->unkDC[i] = 0;
                gUnknown_203F3E0->unkD0[i] = 0;
                gUnknown_203F3E0->unkC4[i] = 0;
                ptr->unk32CC.unk14.unkB[i] = 1;
                ptr->unk32CC.unk14.unk0[i] = sub_8152BF8(sub_8152BD4(i), i);
            }
        }
        else if (gUnknown_203F3E0->unkC4[i] == 3)
        {
            if (++gUnknown_203F3E0->unkDC[i] >= 20)
            {
                if (gUnknown_203F3E0->unk40 < 10)
                {
                    gUnknown_203F3E0->unkDC[i] = 0;
                    gUnknown_203F3E0->unkD0[i] = 0;
                    gUnknown_203F3E0->unkC4[i] = 0;
                    ptr->unk32CC.unk14.unkB[i] = 1;
                    gUnknown_203F3E0->unkE8[i] = ptr->unk32CC.unk14.unk0[i];
                    ptr->unk32CC.unk14.unk0[i] = sub_8152BF8(sub_8152BD4(i), i);
                }
            }
        }
    }
}

static void sub_81527D0(void)
{
    u8 i, first, count;

    first = gUnknown_203F3E0->unk44;
    count = gUnknown_203F3E0->unk48;
    for (i = first; i < count; i++)
    {
        struct DodrioSubstruct_31A0 * ptr = &gUnknown_203F3E0->unk31A0[gUnknown_203F3E0->multiplayerId];
        u8 var = sUnknown_8471F50[gUnknown_203F3E0->unk24 - 1][gUnknown_203F3E0->multiplayerId][i];

        if (ptr->unk14.unkB[var] != 0)
            sub_81542EC(i, FALSE);
        else
            sub_81542EC(i, TRUE);

        if (ptr->unk14.unkB[var] > 9)
        {
            sub_8154398(i, ptr->unk14.unk0[var] + 3);
            sub_8154370(i, ptr->unk14.unkB[var] * 2 - 1);
        }
        else if (ptr->unk14.unk0[var] == 3)
        {
            ptr->unk14.unkB[var] = 7;
            sub_8154398(i, 6);
            sub_8154370(i, ptr->unk14.unkB[var] * 2 - 1);
        }
        else
        {
            sub_8154398(i, ptr->unk14.unk0[var]);
            sub_8154370(i, ptr->unk14.unkB[var] * 2);
        }
    }
}

static void sub_81528D0(void)
{
    u8 i, count;

    count = gUnknown_203F3E0->unk24;
    for (i = 0; i < count; i++)
    {
        struct DodrioSubstruct_31A0 * ptr = &gUnknown_203F3E0->unk31A0[i];
        sub_8153DA8(i, ptr->unk2C.unk0);
    }
}

static void sub_8152910(void)
{
    u8 i, count;

    count = gUnknown_203F3E0->unk24;
    for (i = 0; i < count; i++)
        sub_8153DA8(i, 4);
}

static void sub_815293C(void)
{
    sub_81527D0();
    if (gUnknown_203F3E0->unk40 > 9)
        sub_8152910();
    else
        sub_81528D0();

    sub_8153FC8(gUnknown_203F3E0->unk40);
}

// This function is literally the same as the one above...Why?
static void sub_8152970(void)
{
    sub_81527D0();
    if (gUnknown_203F3E0->unk40 > 9)
        sub_8152910();
    else
        sub_81528D0();

    sub_8153FC8(gUnknown_203F3E0->unk40);
}

static void sub_81529A4(u8 arg0, u8 *arg1, u8 *arg2)
{
    switch (arg0)
    {
    case 1:
        *arg1 = 4, *arg2 = 7;
        break;
    case 2:
        *arg1 = 3, *arg2 = 8;
        break;
    case 3:
        *arg1 = 2, *arg2 = 9;
        break;
    case 4:
        *arg1 = 1, *arg2 = 10;
        break;
    case 5:
        *arg1 = 0, *arg2 = 11;
        break;
    }
}

static bool32 sub_8152A00(void)
{
    u8 i, count;

    count = gUnknown_203F3E0->unk24;
    for (i = 1; i < count; i++)
    {
        if (gUnknown_203F3E0->unk158[i] == 0)
            gUnknown_203F3E0->unk158[i] = sub_815A5E8(i);
    }

    // This loop won't ever run, the seemingly pointless assingment below is to make the compiler
    // generate code for it.
    count = count;
    for (; i < count; i++)
    {
        if (gUnknown_203F3E0->unk158[i] == 0)
            return FALSE;
    }

    return TRUE;
}

static void sub_8152A70(void)
{
    u8 i;

    for (i = 0; i < 5; i++)
        gUnknown_203F3E0->unk158[i] = 0;
}

static bool32 sub_8152A98(void)
{
    if (gUnknown_203F3E0->unk40 > 9 && gUnknown_203F3E0->unk120 == 0)
    {
        gUnknown_203F3E0->unk40 = 10;
        if (gUnknown_203F3E0->unk12C != 0)
            return TRUE;
    }

    return FALSE;
}

static bool32 sub_8152AD8(void)
{
    u8 i, first, count;

    if (gUnknown_203F3E0->unk40 > 9)
    {
        first = gUnknown_203F3E0->unk44;
        count = gUnknown_203F3E0->unk48;
        gUnknown_203F3E0->unk40 = 10;
        if (gUnknown_203F3E0->unk12C != 0)
        {
            for (i = first; i < count; i++)
            {
                struct DodrioSubstruct_31A0 * ptr = &gUnknown_203F3E0->unk31A0[gUnknown_203F3E0->multiplayerId];
                u8 var = sUnknown_8471F50[gUnknown_203F3E0->unk24 - 1][gUnknown_203F3E0->multiplayerId][i];

                if (ptr->unk14.unkB[var] != 10)
                    return FALSE;
            }
            return TRUE;
        }
    }

    return FALSE;
}

static void sub_8152B64(u8 arg0)
{
    u8 var = sUnknown_8475550[gUnknown_203F3E0->unk90[arg0] % 7] + (gUnknown_203F3E0->unk90[arg0] / 7) * 100;
    if (gUnknown_203F3E0->unk86[arg0] >= var)
        gUnknown_203F3E0->unk90[arg0]++;
}

static u8 sub_8152BD4(u8 arg0)
{
    return sUnknown_84720FC[gUnknown_203F3E0->unk24 - 1][arg0];
}

static u8 sub_8152BF8(u8 arg0, u8 arg1)
{
    u8 i, var3;
    u8 count = gUnknown_203F3E0->unk24 - 1;
    u8 var0 = sUnknown_84720AE[count][arg0][0];
    u8 var1 = sUnknown_84720AE[count][arg0][1];
    u8 var2 = sUnknown_84720AE[count][arg0][2];

    for (i = 0; sUnknown_8472133[count][i] != 0; i++)
    {
        if (arg1 == sUnknown_8472133[count][i])
            return sub_8152CB8(gUnknown_203F3E0->unk90[var1], arg1);
    }

    // Gets the highest of the three.
    if (gUnknown_203F3E0->unk90[var0] > gUnknown_203F3E0->unk90[var1])
        var3 = gUnknown_203F3E0->unk90[var0];
    else
        var3 = gUnknown_203F3E0->unk90[var1];

    if (gUnknown_203F3E0->unk90[var2] > var3)
        var3 = gUnknown_203F3E0->unk90[var2];

    return sub_8152CB8(var3, arg1);
}

static u8 sub_8152CB8(u8 arg0, u8 arg1)
{
    u8 var = gUnknown_203F3E0->unkE8[arg1];
    switch (arg0 % 7)
    {
    default: return 0;
    case 0:  return 0;
    case 1:  return 1;
    case 2:  return 2;
    case 3:
        if (var == 0)
            return 1;
        else
            return 0;
    case 4:
        if (var == 0)
            return 2;
        else
            return 0;
    case 5:
        if (var == 2)
            return 1;
        else
            return 2;
    case 6:
        if (var == 0)
            return 1;
        else if (var == 1)
            return 2;
        else
            return 0;
    }
}

static void sub_8152D34(u8 arg0, u8 arg1, u8 arg2)
{
    u8 var;
    u8 count = gUnknown_203F3E0->unk24;
    switch (arg0)
    {
    case 0:
    case 1:
    case 2:
        var = gUnknown_203F3E0->unk31A0[0].unk14.unk0[arg1];
        gUnknown_203F3E0->unk4A[arg2][var] = IncrementWithLimit(gUnknown_203F3E0->unk4A[arg2][var], 20000);
        break;
    case 3:
        switch (count)
        {
        case 5:
            switch (arg1)
            {
            case 0:
                gUnknown_203F3E0->unk4A[2][3]++;
                gUnknown_203F3E0->unk4A[3][3]++;
                break;
            case 1:
                gUnknown_203F3E0->unk4A[3][3]++;
                break;
            case 2:
                gUnknown_203F3E0->unk4A[3][3]++;
                gUnknown_203F3E0->unk4A[4][3]++;
                break;
            case 3:
                gUnknown_203F3E0->unk4A[4][3]++;
                break;
            case 4:
                gUnknown_203F3E0->unk4A[4][3]++;
                gUnknown_203F3E0->unk4A[0][3]++;
                break;
            case 5:
                gUnknown_203F3E0->unk4A[0][3]++;
                break;
            case 6:
                gUnknown_203F3E0->unk4A[0][3]++;
                gUnknown_203F3E0->unk4A[1][3]++;
                break;
            case 7:
                gUnknown_203F3E0->unk4A[1][3]++;
                break;
            case 8:
                gUnknown_203F3E0->unk4A[1][3]++;
                gUnknown_203F3E0->unk4A[2][3]++;
                break;
            case 9:
                gUnknown_203F3E0->unk4A[2][3]++;
                break;
            }
            break;
        case 4:
            switch (arg1)
            {
            case 1:
                gUnknown_203F3E0->unk4A[2][3]++;
                gUnknown_203F3E0->unk4A[3][3]++;
                break;
            case 2:
                gUnknown_203F3E0->unk4A[3][3]++;
                break;
            case 3:
                gUnknown_203F3E0->unk4A[3][3]++;
                gUnknown_203F3E0->unk4A[0][3]++;
                break;
            case 4:
                gUnknown_203F3E0->unk4A[0][3]++;
                break;
            case 5:
                gUnknown_203F3E0->unk4A[0][3]++;
                gUnknown_203F3E0->unk4A[1][3]++;
                break;
            case 6:
                gUnknown_203F3E0->unk4A[1][3]++;
                break;
            case 7:
                gUnknown_203F3E0->unk4A[1][3]++;
                gUnknown_203F3E0->unk4A[2][3]++;
                break;
            case 8:
                gUnknown_203F3E0->unk4A[2][3]++;
                break;
            }
            break;
        case 3:
            switch (arg1)
            {
            case 2:
                gUnknown_203F3E0->unk4A[1][3]++;
                gUnknown_203F3E0->unk4A[2][3]++;
                break;
            case 3:
                gUnknown_203F3E0->unk4A[2][3]++;
                break;
            case 4:
                gUnknown_203F3E0->unk4A[2][3]++;
                gUnknown_203F3E0->unk4A[0][3]++;
                break;
            case 5:
                gUnknown_203F3E0->unk4A[0][3]++;
                break;
            case 6:
                gUnknown_203F3E0->unk4A[0][3]++;
                gUnknown_203F3E0->unk4A[1][3]++;
                break;
            case 7:
                gUnknown_203F3E0->unk4A[1][3]++;
                break;
            }
            break;
        case 2:
            switch (arg1)
            {
            case 3:
                gUnknown_203F3E0->unk4A[0][3]++;
                gUnknown_203F3E0->unk4A[1][3]++;
                break;
            case 4:
                gUnknown_203F3E0->unk4A[0][3]++;
                break;
            case 5:
                gUnknown_203F3E0->unk4A[0][3]++;
                gUnknown_203F3E0->unk4A[1][3]++;
                break;
            case 6:
                gUnknown_203F3E0->unk4A[1][3]++;
                break;
            }
            break;
        }
        break;
    }
}

static void sub_8152F94(bool32 arg0)
{
    if (gUnknown_203F3E0->unk24 != 5)
        return;

    if (arg0 == TRUE)
    {
        if (++gUnknown_203F3E0->unk112 > gUnknown_203F3E0->unk114)
            gUnknown_203F3E0->unk114 = gUnknown_203F3E0->unk112;
        if (gUnknown_203F3E0->unk112 > 9999)
            gUnknown_203F3E0->unk112 = 9999;
    }
    else
    {
        if (gUnknown_203F3E0->unk112 > gUnknown_203F3E0->unk114)
            gUnknown_203F3E0->unk114 = gUnknown_203F3E0->unk112;
        gUnknown_203F3E0->unk112 = 0;
    }
}

static void sub_8153004(void)
{
    u8 i;
    for (i = 0; i < gUnknown_203F3E0->unk24; i++)
        gUnknown_203F3E0->unk4A[i][5] = gUnknown_203F3E0->unk114;
}

static void sub_8153048(void)
{
    u8 i, j;

    for (i = 0; i < 5; i++)
    {
        for (j = 0; j < 11; j++)
            gUnknown_203F3E0->unk31A0[i].unk14.unkB[j] = 0;
        gUnknown_203F3E0->unk31A0[i].unk2C.unk0 = 0;
        gUnknown_203F3E0->unk31A0[i].unk2C.unk4 = 0;
        gUnknown_203F3E0->unk90[i] = 0;
        gUnknown_203F3E0->unk86[i] = 0;
        gUnknown_203F3E0->unk3308[i].unk0 = 0;
        gUnknown_203F3E0->unk3308[i].unk4 = 0;
        gUnknown_203F3E0->unk4A[i][0] = 0;
        gUnknown_203F3E0->unk4A[i][1] = 0;
        gUnknown_203F3E0->unk4A[i][2] = 0;
        gUnknown_203F3E0->unk4A[i][3] = 0;
        gUnknown_203F3E0->unk4A[i][4] = 0;
        gUnknown_203F3E0->unk4A[i][5] = 0;
    }
    gUnknown_203F3E0->unk154 = 0;
    gUnknown_203F3E0->unk112 = 0;
    gUnknown_203F3E0->unk40 = 0;
    sub_81528D0();
    sub_81527D0();
}

static const s16 sUnknown_84755D8[] = {10, 30, 50, 50};

static void sub_8153150(void)
{
    u8 i, var = 0, var2 = 0;

    switch (gUnknown_203F3E0->unk24)
    {
    case 4:  var = 1; break;
    case 5:  var = 2; break;
    }

    var2 = Random() % 10;
    for (i = 0; i < 5; i++)
        gUnknown_203F3E0->unk4A[i][4] = sUnknown_8475558[var][var2];
}

static u32 sub_81531BC(u8 arg0)
{
    u32 sum = gUnknown_203F3E0->unk4A[arg0][0]
              + gUnknown_203F3E0->unk4A[arg0][1]
              + gUnknown_203F3E0->unk4A[arg0][2];
    return min(sum, 9999);
}

static void sub_81531FC(void)
{
    u32 berriesPicked = Min(sub_81531BC(gUnknown_203F3E0->multiplayerId), 9999);
    u32 score = Min(sub_8153424(gUnknown_203F3E0->multiplayerId), 999990);

    if (gSaveBlock2Ptr->berryPick.bestScore < score)
        gSaveBlock2Ptr->berryPick.bestScore = score;
    if (gSaveBlock2Ptr->berryPick.berriesPicked < berriesPicked)
        gSaveBlock2Ptr->berryPick.berriesPicked = berriesPicked;
    if (gSaveBlock2Ptr->berryPick.berriesPickedInRow < gUnknown_203F3E0->unk114)
        gSaveBlock2Ptr->berryPick.berriesPickedInRow = gUnknown_203F3E0->unk114;
}

static u8 sub_815327C(u8 arg0)
{
    u8 i, saved;

    saved = gUnknown_203F3E0->unk98[3];
    for (i = 3; i != 0; i--)
        gUnknown_203F3E0->unk98[i] = gUnknown_203F3E0->unk98[i - 1];
    gUnknown_203F3E0->unk98[0] = arg0;
    return saved;
}

static void sub_81532B8(void)
{
    if (gUnknown_203F3E0->unkB0[gUnknown_203F3E0->multiplayerId] == 0)
    {
        if (JOY_NEW(DPAD_UP))
        {
            gUnknown_203F3E0->unk31A0[gUnknown_203F3E0->multiplayerId].unk2C.unk0 = 2;
            gUnknown_203F3E0->unkB0[gUnknown_203F3E0->multiplayerId] = 6;
            PlaySE(SE_M_CHARM);
        }
        else if (JOY_NEW(DPAD_LEFT))
        {
            gUnknown_203F3E0->unk31A0[gUnknown_203F3E0->multiplayerId].unk2C.unk0 = 3;
            gUnknown_203F3E0->unkB0[gUnknown_203F3E0->multiplayerId] = 6;
            PlaySE(SE_M_CHARM);
        }
        else if (JOY_NEW(DPAD_RIGHT))
        {
            gUnknown_203F3E0->unk31A0[gUnknown_203F3E0->multiplayerId].unk2C.unk0 = 1;
            gUnknown_203F3E0->unkB0[gUnknown_203F3E0->multiplayerId] = 6;
            PlaySE(SE_M_CHARM);
        }
        else
        {
            gUnknown_203F3E0->unk31A0[gUnknown_203F3E0->multiplayerId].unk2C.unk0 = 0;
        }
    }
    else
    {
        gUnknown_203F3E0->unkB0[gUnknown_203F3E0->multiplayerId]--;
    }
}

static void sub_815336C(void)
{
    gUnknown_203F3E0->unk31A0[gUnknown_203F3E0->multiplayerId].unk2C.unk0 = 0;
}

u16 sub_8153390(void)
{
    return gUnknown_203F3E0->unk4A[gUnknown_203F3E0->multiplayerId][4] + FIRST_BERRY_INDEX;
}

u8 sub_81533B4(void)
{
    return gUnknown_203F3E0->unk24;
}

u8 *sub_81533C4(u8 id)
{
    if (gReceivedRemoteLinkPlayers)
        return gLinkPlayers[id].name;
    else
        return gUnknown_203F3E0->unk31A0[id].name;
}

u16 sub_8153404(u8 arg0, u8 arg1)
{
    return gUnknown_203F3E0->unk4A[arg0][arg1];
}

static u32 sub_8153424(u8 arg0)
{
    u8 i;
    u32 var, sum = 0;

    for (i = 0; i < 3; i++)
        sum += gUnknown_203F3E0->unk4A[arg0][i] * sUnknown_84755D8[i];

    var = gUnknown_203F3E0->unk4A[arg0][3] * sUnknown_84755D8[3];
    if (sum <= var)
        return 0;
    else
        return sum - var;
}

u32 sub_81534AC(void)
{
    u8 i, count = gUnknown_203F3E0->unk24;
    u32 maxVar = sub_8153424(0);

    for (i = 1; i < count; i++)
    {
        u32 var = sub_8153424(i);
        if (var > maxVar)
            maxVar = var;
    }
    return Min(maxVar, 999990);
}

u32 sub_81534F0(u8 arg0)
{
    u8 i, count = gUnknown_203F3E0->unk24;
    u16 maxVar = gUnknown_203F3E0->unk4A[0][arg0];

    for (i = 0; i < count; i++)
    {
        u16 var = gUnknown_203F3E0->unk4A[i][arg0];
        if (var > maxVar)
            maxVar = var;
    }
    return maxVar;
}

static u32 sub_8153534(u8 arg0)
{
    u32 vals[5], temp;
    s16 r6 = TRUE;
    u8 i, count = gUnknown_203F3E0->unk24;

    for (i = 0; i < count; i++)
        vals[i] = temp = sub_8153424(i);

    while (r6)
    {
        r6 = FALSE;
        for (i = 0; i < count - 1; i++)
        {
            if (vals[i] < vals[i + 1])
            {
                SWAP(vals[i], vals[i + 1], temp);
                r6 = TRUE;
            }
        }
    }

    return vals[arg0];
}

u32 sub_81535B0(void)
{
    u8 i, r10 = 0, r8 = 0, r9 = 0, count = gUnknown_203F3E0->unk24;

    // Function called two times for some reason.
    sub_81534AC();
    if (sub_81534AC() == 0)
    {
        for (i = 0; i < count; i++)
        {
            gUnknown_203F3E0->unk3308[i].unk0 = 4;
            gUnknown_203F3E0->unk3308[i].unk4 = 0;
        }
    }

    for (i = 0; i < count; i++)
        gUnknown_203F3E0->unk3308[i].unk4 = Min(sub_8153424(i), 999990);

    do
    {
        u32 r6 = sub_8153534(r10);
        u8 r3 = r8;
        for (i = 0; i < count; i++)
        {
            if (r6 == gUnknown_203F3E0->unk3308[i].unk4)
            {
                gUnknown_203F3E0->unk3308[i].unk0 = r3;
                r8++;
                r9++;
            }
        }
        r10 = r8;
    } while (r9 < count);

    return 0;
}

void sub_81536A0(struct DodrioSubstruct_3308 * dst, u8 id)
{
    *dst = gUnknown_203F3E0->unk3308[id];
}

static u8 sub_81536C0(u8 arg0)
{
    u8 i, ret = 0, count = gUnknown_203F3E0->unk24;
    u32 var, vars[5] = {0};

    for (i = 0; i < count; i++)
        vars[i] = sub_8153424(i);

    var = vars[arg0];
    for (i = 0; i < 5; i++)
    {
        if (i != arg0 && var < vars[i])
            ret++;
    }

    return ret;
}

u8 sub_815372C(void)
{
    u8 multiplayerId = gUnknown_203F3E0->multiplayerId;
    u16 itemId = sub_8153390();

    if (sub_8153424(multiplayerId) != sub_81534AC())
        return 3;
    if (!CheckBagHasSpace(itemId, 1))
        return 2;

    AddBagItem(itemId, 1);
    if (!CheckBagHasSpace(itemId, 1))
        return 1;
    return 0;
}

// Really? What next, u32 Add(u32 a)return a+1;?
u32 IncrementWithLimit(u32 a, u32 max)
{
    if (a < max)
        return a + 1;
    else
        return max;
}

// Gamefreak pls, min(a, b) ((a) < (b) ? (a) : (b)) is a well-known macro
u32 Min(u32 a, u32 b)
{
    if (a < b)
        return a;
    else
        return b;
}

u8 sub_81537AC(u8 id)
{
    return gUnknown_203F3E0->unk34[id];
}

void IsDodrioInParty(void)
{
    int i;
    for (i = 0; i < PARTY_SIZE; i++)
    {
        if (GetMonData(&gPlayerParty[i], MON_DATA_SANITY_HAS_SPECIES)
            && GetMonData(&gPlayerParty[i], MON_DATA_SPECIES2) == SPECIES_DODRIO)
        {
            gSpecialVar_Result = TRUE;
            return;
        }
    }

    gSpecialVar_Result = FALSE;
}

void ShowDodrioBerryPickingRecords(void)
{
    u8 taskId = CreateTask(Task_ShowDodrioBerryPickingRecords, 0);
    Task_ShowDodrioBerryPickingRecords(taskId);
}

// Data related to printing saved results.
static const struct WindowTemplate sUnknown_84755E0 =
{
    .bg = 0,
    .tilemapLeft = 1,
    .tilemapTop = 1,
    .width = 28,
    .height = 11,
    .paletteNum = 15,
    .baseBlock = 1,
};

static const u8 *const sUnknown_84755E8[] = {gText_BerryPickingRecords, gText_BerriesPicked, gText_BestScore, gText_BerriesInRowFivePlayers};
static const u8 sUnknown_84755F8[] = {4, 7, 4};

ALIGNED(4)
static const u8 sUnknown_84755FC[][2] = {{24}, {40}, {56}};
static const u8 sUnknown_8475602[][2] = {{24}, {40}, {70}};

static void Task_ShowDodrioBerryPickingRecords(u8 taskId)
{
    struct WindowTemplate window;
    s32 i, width, widthCurr;
    s16 *data = gTasks[taskId].data;

    switch (data[0])
    {
    case 0:
        data[1] = AddWindow(&sUnknown_84755E0);
        sub_81538D0(data[1]);
        CopyWindowToVram(data[1], COPYWIN_FULL);
        data[0]++;
        break;
    case 1:
        if (!IsDma3ManagerBusyWithBgCopy())
            data[0]++;
        break;
    case 2:
        if (JOY_NEW(A_BUTTON | B_BUTTON))
        {
            rbox_fill_rectangle(data[1]);
            CopyWindowToVram(data[1], COPYWIN_MAP);
            data[0]++;
        }
        break;
    case 3:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            RemoveWindow(data[1]);
            DestroyTask(taskId);
            EnableBothScriptContexts();
        }
        break;
    }
}

static void sub_81538D0(u8 windowId)
{
    s32 i, x, numWidth;
    s32 results[3];
    u8 strbuf[20];
    results[0] = gSaveBlock2Ptr->berryPick.berriesPicked;
    results[1] = gSaveBlock2Ptr->berryPick.bestScore;
    results[2] = gSaveBlock2Ptr->berryPick.berriesPickedInRow;

    TextWindow_SetStdFrame0_WithPal(windowId, 0x21D, 0xD0);
    DrawTextBorderOuter(windowId, 0x21D, 0xD);
    FillWindowPixelBuffer(windowId, PIXEL_FILL(1));
    AddTextPrinterParameterized(windowId, FONT_2, sUnknown_84755E8[0], 1, 1, TEXT_SKIP_DRAW, NULL);
    for (i = 0; i < 3; i++)
    {
        ConvertIntToDecimalStringN(strbuf, results[i], STR_CONV_MODE_LEFT_ALIGN, sUnknown_84755F8[i]);
        numWidth = GetStringWidth(FONT_2, strbuf, -1);
        AddTextPrinterParameterized(windowId, FONT_2, sUnknown_84755E8[i + 1], 1, sUnknown_84755FC[i][0], TEXT_SKIP_DRAW, NULL);
        x = 224 - numWidth;
        AddTextPrinterParameterized(windowId, FONT_2, strbuf, x, sUnknown_8475602[i][0], TEXT_SKIP_DRAW, NULL);
    }
    PutWindowTilemap(windowId);
}

// Debug functions?
static const u16 sUnknown_8475608[][4] =
{
    {9999, 0, 90, 9999},
    {9999, 9999, 70, 9999},
    {9999, 0, 9999, 0},
    {9999, 9999, 60, 0},
    {9999, 9999, 9999, 0},
};

static const u8 sUnknown_8475630[] = _("あいうえおかき");
static const u8 sUnknown_8475638[] = _("ABCDEFG");
static const u8 sUnknown_8475640[] = _("0123456");

static const u8 *const sPlaceholderPlayerNames[] =
{
    sUnknown_8475630,
    sUnknown_8475630,
    sUnknown_8475630,
    sUnknown_8475638,
    sUnknown_8475640
};

static void sub_81539EC(void)
{
    gUnknown_203F3E0->unk24 = GetLinkPlayerCount();
}

static void sub_8153A04(void)
{
    u8 i, playerId;

    for (playerId = gUnknown_203F3E0->unk24; playerId < NELEMS(sPlaceholderPlayerNames); playerId++)
        StringCopy(gLinkPlayers[playerId].name, sPlaceholderPlayerNames[playerId]);

    gUnknown_203F3E0->unk24 = 5;
    for (i = 0; i < 4; i++)
    {
        for (playerId = 0; playerId < gUnknown_203F3E0->unk24; playerId++)
            gUnknown_203F3E0->unk4A[playerId][i] = sUnknown_8475608[playerId][i];
    }
}
