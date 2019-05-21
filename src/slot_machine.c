#include "global.h"
#include "palette.h"
#include "task.h"
#include "main.h"
#include "malloc.h"
#include "sound.h"
#include "coins.h"
#include "quest_log.h"
#include "overworld.h"
#include "slot_machine.h"
#include "menu.h"
#include "constants/songs.h"

struct SlotMachineState
{
    MainCallback savedCallback;
    u16 machineidx;
    u16 field_06;
    u16 field_08;
    u16 slotRewardClass;
    u8 filler_0C[2];
    u16 bet;
    u8 field_10;
    u8 field_11;
    bool32 field_14[3];
    s16 field_20[3];
    s16 field_26[3];
    s16 field_2C[3];
    u8 filler_32[0x1E];
    u16 payout;
};

EWRAM_DATA struct SlotMachineState * sSlotMachineState = NULL;

void sub_813F84C(struct SlotMachineState * ptr);
void sub_813F898(void);
void sub_813F92C(void);
void sub_813F94C(void);
void MainTask_SlotsGameLoop(u8 taskId);
void MainTask_NoCoinsGameOver(u8 taskId);
void MainTask_ShowHelp(u8 taskId);
void MainTask_ConfirmExitGame(u8 taskId);
void MainTask_DarnNoPayout(u8 taskId);
void MainTask_WinHandlePayout(u8 taskId);
void MainTask_ExitSlots(u8 taskId);
static void SetMainTask(TaskFunc taskFunc);
void sub_8140060(u8 taskId);
void sub_8140148(void);
void sub_814016C(u16 whichReel, u16 whichReel2);
bool32 sub_81401A0(u16);
void sub_81401F0(u16 whichReel);
void sub_81403BC(u16 whichReel);
void sub_81404B8(u16 whichReel);
bool32 sub_81408F4(u32 a0, u32 a1);
void sub_81409B4(void);
void sub_8140A70(void);
u16 sub_8140A80(void);
void sub_8140D7C(s16 *, s16 *);
bool32 sub_814104C(void);
void sub_8141094(void);
void sub_8141148(u16 a0, u8 a1);
bool32 sub_8141180(u8 a0);
void sub_8141C30(u8, u8);

extern const u8 gUnknown_8464926[][21];

void PlaySlotMachine(u16 machineIdx, MainCallback savedCallback)
{
    ResetTasks();
    sSlotMachineState = Alloc(sizeof(*sSlotMachineState));
    if (sSlotMachineState == NULL)
        SetMainCallback2(savedCallback);
    else
    {
        if (machineIdx > 5)
            machineIdx = 0;
        sSlotMachineState->machineidx = machineIdx;
        sSlotMachineState->savedCallback = savedCallback;
        sub_813F84C(sSlotMachineState);
        SetMainCallback2(sub_813F898);
    }
}

void sub_813F84C(struct SlotMachineState * ptr)
{
    s32 i;

    ptr->field_06 = 0;
    ptr->bet = 0;
    ptr->payout = 0;
    // for whatever reason, the loop does not use the ptr param
    for (i = 0; i < 3; i++)
    {
        sSlotMachineState->field_14[i] = FALSE;
        sSlotMachineState->field_20[i] =     0;
        sSlotMachineState->field_26[i] =     0;
        sSlotMachineState->field_2C[i] =    21;
    }
}

void sub_813F898(void)
{
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();

    switch (gMain.state)
    {
    case 0:
        if (sub_814104C())
        {
            SetMainCallback2(sSlotMachineState->savedCallback);
            sub_813F92C();
        }
        else
        {
            sub_8141148(0, 0);
            gMain.state++;
        }
        break;
    case 1:
        if (!sub_8141180(0))
        {
            sSlotMachineState->field_10 = CreateTask(MainTask_SlotsGameLoop, 0);
            sSlotMachineState->field_11 = CreateTask(sub_8140060, 1);
            SetMainCallback2(sub_813F94C);
        }
        break;
    }
}

void sub_813F92C(void)
{
    sub_8141094();
    if (sSlotMachineState != NULL)
    {
        Free(sSlotMachineState);
        sSlotMachineState = NULL;
    }
}

void sub_813F94C(void)
{
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

void MainTask_SlotsGameLoop(u8 taskId)
{
    s16 * data = gTasks[taskId].data;

    switch (data[0])
    {
    case 0:
        if (GetCoins() == 0)
        {
            SetMainTask(MainTask_NoCoinsGameOver);
        }
        else if (JOY_NEW(DPAD_DOWN))
        {
            sSlotMachineState->bet++;
            TakeCoins(1);
            PlaySE(SE_T_KAMI2);
            sub_8141148(8, 0);
            sub_8141148(2, 1);
            data[0] = 1;
        }
        else if (JOY_NEW(R_BUTTON))
        {
            s32 toAdd = 3 - sSlotMachineState->bet;
            if (GetCoins() >= toAdd)
            {
                sSlotMachineState->bet = 3;
                TakeCoins(toAdd);
            }
            else
            {
                sSlotMachineState->bet += GetCoins();
                SetCoins(0);
            }
            PlaySE(SE_T_KAMI2);
            sub_8141148(8, 0);
            sub_8141148(2, 1);
            data[0] = 1;
        }
        else if (JOY_NEW(A_BUTTON) && sSlotMachineState->bet != 0)
        {
            data[0] = 2;
        }
        else if (JOY_NEW(B_BUTTON))
        {
            SetMainTask(MainTask_ConfirmExitGame);
        }
        else if (JOY_NEW(DPAD_RIGHT))
        {
            SetMainTask(MainTask_ShowHelp);
        }
        break;
    case 1:
        if (!sub_8141180(0) && !sub_8141180(1))
        {
            if (sSlotMachineState->bet == 3 || GetCoins() == 0)
                data[0] = 2;
            else
                data[0] = 0;
        }
        break;
    case 2:
        sub_811539C();
        sub_81409B4();
        sub_8140148();
        sSlotMachineState->field_06 = 0;
        sub_8141148(3, 0);
        data[0] = 3;
        break;
    case 3:
        if (!sub_8141180(0))
        {
            if (JOY_NEW(A_BUTTON))
            {
                PlaySE(SE_JYUNI);
                sub_814016C(sSlotMachineState->field_06, sSlotMachineState->field_06);
                sub_8141C30(sSlotMachineState->field_06, 0);
                data[0] = 4;
            }
        }
        break;
    case 4:
        if (sub_81401A0(sSlotMachineState->field_06) == 0 && !sub_8141180(0))
        {
            sSlotMachineState->field_06++;
            if (sSlotMachineState->field_06 >= 3)
            {
                sSlotMachineState->slotRewardClass = sub_8140A80();
                sSlotMachineState->bet = 0;
                sSlotMachineState->field_06 = 0;
                if (sSlotMachineState->slotRewardClass == 0)
                    SetMainTask(MainTask_DarnNoPayout);
                else
                {
                    if (sSlotMachineState->slotRewardClass == 6)
                        IncrementGameStat(GAME_STAT_SLOT_JACKPOTS);
                    sub_8140A70();
                    SetMainTask(MainTask_WinHandlePayout);
                }
            }
            else
                data[0] = 3;
        }
        break;
    }
}

void MainTask_NoCoinsGameOver(u8 taskId)
{
    s16 * data = gTasks[taskId].data;

    switch (data[0])
    {
    case 0:
        sub_8141148(9, 0);
        data[0]++;
        break;
    case 1:
        if (!sub_8141180(0))
            data[0]++;
        break;
    case 2:
        if (JOY_NEW(A_BUTTON | B_BUTTON | DPAD_ANY))
            SetMainTask(MainTask_ExitSlots);
        break;
    }
}

void MainTask_ShowHelp(u8 taskId)
{
    s16 * data = gTasks[taskId].data;

    switch (data[0])
    {
    case 0:
        sub_8141148(14, 0);
        data[0]++;
        break;
    case 1:
        if (!sub_8141180(0))
            data[0]++;
        break;
    case 2:
        if (JOY_NEW(DPAD_LEFT))
        {
            sub_8141148(15, 0);
            data[0]++;
        }
        break;
    case 3:
        if (!sub_8141180(0))
            SetMainTask(MainTask_SlotsGameLoop);
        break;
    }
}

void MainTask_ConfirmExitGame(u8 taskId)
{
    s16 * data = gTasks[taskId].data;

    switch (data[0])
    {
    case 0:
        sub_8141148(10, 0);
        data[0]++;
        break;
    case 1:
        if (!sub_8141180(0))
            data[0]++;
        break;
    case 2:
        switch (Menu_ProcessInputNoWrapClearOnChoose())
        {
        case 0:
            GiveCoins(sSlotMachineState->bet);
            sub_8141148(8, 0);
            data[0] = 3;
            break;
        case 1:
        case -1:
            sub_8141148(11, 0);
            data[0] = 4;
            break;
        }
        break;
    case 3:
        if (!sub_8141180(0))
            SetMainTask(MainTask_ExitSlots);
        break;
    case 4:
        if (!sub_8141180(0))
            SetMainTask(MainTask_SlotsGameLoop);
        break;
    }
}

void MainTask_DarnNoPayout(u8 taskId)
{
    s16 * data = gTasks[taskId].data;

    switch (data[0])
    {
    case 0:
        sub_8141148(6, 0);
        data[1] = 0;
        data[0]++;
        break;
    case 1:
        data[1]++;
        if (data[1] > 60)
        {
            sub_8141148(7, 0);
            sub_8141148(2, 1);
            sub_8141148(13, 2);
            data[0]++;
        }
        break;
    case 2:
        if (!sub_8141180(0) && !sub_8141180(1) && !sub_8141180(2))
            SetMainTask(MainTask_SlotsGameLoop);
        break;
    }
}

void MainTask_WinHandlePayout(u8 taskId)
{
    s16 * data = gTasks[taskId].data;

    switch (data[0])
    {
    case 0:
        if (sSlotMachineState->slotRewardClass == 5 || sSlotMachineState->slotRewardClass == 6)
            PlayFanfare(MUS_ME_B_BIG);
        else
            PlayFanfare(MUS_ME_B_SMALL);
        sub_8141148(8, 0);
        sub_8141148(4, 1);
        data[1] = 8;
        data[0]++;
        break;
    case 1:
        data[1]++;
        if (data[1] > 120)
        {
            data[1] = 8;
            if (JOY_HELD(A_BUTTON))
                data[1] = 2;
            data[0]++;
        }
        break;
    case 2:
        if (!sub_8141180(0))
        {
            if (IsFanfareTaskInactive() && JOY_NEW(START_BUTTON))
            {
                GiveCoins(sSlotMachineState->payout);
                sSlotMachineState->payout = 0;
            }
            else
            {
                data[1]--;
                if (data[1] == 0)
                {
                    if (IsFanfareTaskInactive())
                        PlaySE(SE_PIN);
                    if (sSlotMachineState->payout != 0)
                    {
                        GiveCoins(1);
                        sSlotMachineState->payout--;
                    }
                    data[1] = 8;
                    if (JOY_HELD(A_BUTTON))
                        data[1] = 2;
                }
            }
            sub_8141148(8, 0);
            if (sSlotMachineState->payout == 0)
                data[0]++;
        }
        break;
    case 3:
        if (IsFanfareTaskInactive() && !sub_8141180(0))
        {
            sub_8141148(5, 0);
            data[0]++;
        }
        break;
    case 4:
        if (!sub_8141180(0))
        {
            sub_8141148(2, 0);
            sub_8141148(13, 1);
            data[0]++;
        }
        break;
    case 5:
        if (!sub_8141180(0) && !sub_8141180(1))
            SetMainTask(MainTask_SlotsGameLoop);
        break;
    }
}

void MainTask_ExitSlots(u8 taskId)
{
    s16 * data = gTasks[taskId].data;

    switch (data[0])
    {
    case 0:
        sub_8141148(1, 0);
        data[0]++;
        break;
    case 1:
        if (!sub_8141180(0))
        {
            SetMainCallback2(sSlotMachineState->savedCallback);
            sub_813F92C();
        }
        break;
    }
}

static void SetMainTask(TaskFunc taskFunc)
{
    gTasks[sSlotMachineState->field_10].func = taskFunc;
    gTasks[sSlotMachineState->field_10].data[0] = 0;
}

void sub_8140060(u8 taskId)
{
    // taskId is never used

    s32 i;

    for (i = 0; i < 3; i++)
    {
        if (sSlotMachineState->field_14[i] || sSlotMachineState->field_26[i] != 0)
        {
            if (sSlotMachineState->field_26[i] != 0 || sSlotMachineState->field_20[i] != sSlotMachineState->field_2C[i])
            {
                sSlotMachineState->field_26[i]++;
                if (sSlotMachineState->field_26[i] > 2)
                {
                    sSlotMachineState->field_26[i] = 0;
                    sSlotMachineState->field_20[i]--;
                    if (sSlotMachineState->field_20[i] < 0)
                        sSlotMachineState->field_20[i] = 20;
                }
                if (sSlotMachineState->field_20[i] != sSlotMachineState->field_2C[i])
                    continue;
            }
            sSlotMachineState->field_2C[i] = 21;
            sSlotMachineState->field_14[i] = FALSE;
        }
    }
    sub_8140D7C(sSlotMachineState->field_20, sSlotMachineState->field_26);
}

void sub_8140148(void)
{
    s32 i;

    for (i = 0; i < 3; i++)
    {
        sSlotMachineState->field_14[i] = TRUE;
    }
}

void sub_814016C(u16 whichReel, u16 whichReel2)
{
    switch (whichReel2)
    {
    case 0:
        sub_81401F0(whichReel);
        break;
    case 1:
        sub_81403BC(whichReel);
        break;
    case 2:
        sub_81404B8(whichReel);
        break;
    }
}

bool32 sub_81401A0(u16 whichReel)
{
    return sSlotMachineState->field_14[whichReel];
}

s16 sub_81401B4(u16 whichReel)
{
    s16 position = sSlotMachineState->field_20[whichReel];
    if (sSlotMachineState->field_26[whichReel] != 0)
    {
        position--;
        if (position < 0)
            position = 20;
    }
    return position;
}

/*
void sub_81401F0(u16 whichReel)
{
    s32 i;
    s16 r2;
    s16 r6;
    s16 sp0C = sub_81401B4(whichReel);
    u32 r8 = 0;
    u32 sp08;
    u32 r10;
    u8 sp0[5];

    if (sSlotMachineState->field_08 == 0 && whichReel == 0)
    {
        sp08 = 0;
        r10 = 0;
        for (i = 0; i < 5; i++)
        {
            r6 = 0;
            r2 = sp0C - i + 1;
            for (; r6 < 3; r6++)
            {
                if (r2 >= 21)
                    r2 = 0;
                if (sub_81408F4(1, gUnknown_8464926[r10][r2]))
                    break;
            }
            if (r6 == 3)
            {
                sp0[r8] = i;
                r8++;
            }
        }
    }
    else if (sSlotMachineState->field_08 != 1 || whichReel == 0)
    {
        for (i = 0, r2 = whichReel + 1; i < 3; i++)
        {
            if (sub_81408F4(sSlotMachineState->field_08, gUnknown_8464926[]))
        }
    }
}
*/
