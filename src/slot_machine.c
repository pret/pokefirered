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
#include "constants/songs.h"

struct SlotMachineState
{
    MainCallback savedCallback;
    u16 machineidx;
    u16 field_06;
    u8 filler_08[2];
    u16 field_0A;
    u8 filler_0C[2];
    u16 bet;
    u8 field_10;
    u8 field_11;
    TaskFunc field_14[3];
    u16 field_20[3];
    u16 field_26[3];
    u16 field_2C[3];
    u8 filler_32[0x1E];
    u16 field_50;
};

EWRAM_DATA struct SlotMachineState * gUnknown_203F3A0 = NULL;

void sub_813F84C(struct SlotMachineState * ptr);
void sub_813F898(void);
void sub_813F92C(void);
void sub_813F94C(void);
void sub_813F964(u8 taskId);
void sub_813FBC0(u8 taskId);
void sub_813FC2C(u8 taskId);
void sub_813FCAC(u8 taskId);
void sub_813FD84(u8 taskId);
void sub_813FE1C(u8 taskId);
void sub_813FFD8(u8 taskId);
void sub_8140030(TaskFunc taskFunc);
void sub_8140060(u8 taskId);
void sub_8140148(void);
void sub_814016C(u16, u16);
bool32 sub_81401A0(u16);
void sub_81409B4(void);
void sub_8140A70(void);
u16 sub_8140A80(void);
bool32 sub_814104C(void);
void sub_8141094(void);
void sub_8141148(u16 a0, u8 a1);
bool32 sub_8141180(u8 a0);
void sub_8141C30(u8, u8);

void PlaySlotMachine(u16 machineIdx, MainCallback savedCallback)
{
    ResetTasks();
    gUnknown_203F3A0 = Alloc(sizeof(*gUnknown_203F3A0));
    if (gUnknown_203F3A0 == NULL)
        SetMainCallback2(savedCallback);
    else
    {
        if (machineIdx > 5)
            machineIdx = 0;
        gUnknown_203F3A0->machineidx = machineIdx;
        gUnknown_203F3A0->savedCallback = savedCallback;
        sub_813F84C(gUnknown_203F3A0);
        SetMainCallback2(sub_813F898);
    }
}

void sub_813F84C(struct SlotMachineState * ptr)
{
    s32 i;

    ptr->field_06 = 0;
    ptr->bet = 0;
    ptr->field_50 = 0;
    // for whatever reason, the loop does not use the ptr param
    for (i = 0; i < 3; i++)
    {
        gUnknown_203F3A0->field_14[i] = NULL;
        gUnknown_203F3A0->field_20[i] =    0;
        gUnknown_203F3A0->field_26[i] =    0;
        gUnknown_203F3A0->field_2C[i] =   21;
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
            SetMainCallback2(gUnknown_203F3A0->savedCallback);
            sub_813F92C();
        }
        else
        {
            sub_8141148(0, 0);
            gMain.state++;
        }
        break;
    case 1:
        if (sub_8141180(0) == 0)
        {
            gUnknown_203F3A0->field_10 = CreateTask(sub_813F964, 0);
            gUnknown_203F3A0->field_11 = CreateTask(sub_8140060, 1);
            SetMainCallback2(sub_813F94C);
        }
        break;
    }
}

void sub_813F92C(void)
{
    sub_8141094();
    if (gUnknown_203F3A0 != NULL)
    {
        Free(gUnknown_203F3A0);
        gUnknown_203F3A0 = NULL;
    }
}

void sub_813F94C(void)
{
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

void sub_813F964(u8 taskId)
{
    s16 * data = gTasks[taskId].data;

    switch (data[0])
    {
    case 0:
        if (GetCoins() == 0)
        {
            sub_8140030(sub_813FBC0);
        }
        else if (JOY_NEW(DPAD_DOWN))
        {
            gUnknown_203F3A0->bet++;
            TakeCoins(1);
            PlaySE(SE_T_KAMI2);
            sub_8141148(8, 0);
            sub_8141148(2, 1);
            data[0] = 1;
        }
        else if (JOY_NEW(R_BUTTON))
        {
            s32 toAdd = 3 - gUnknown_203F3A0->bet;
            if (GetCoins() >= toAdd)
            {
                gUnknown_203F3A0->bet = 3;
                TakeCoins(toAdd);
            }
            else
            {
                gUnknown_203F3A0->bet += GetCoins();
                SetCoins(0);
            }
            PlaySE(SE_T_KAMI2);
            sub_8141148(8, 0);
            sub_8141148(2, 1);
            data[0] = 1;
        }
        else if (JOY_NEW(A_BUTTON) && gUnknown_203F3A0->bet != 0)
        {
            data[0] = 2;
        }
        else if (JOY_NEW(B_BUTTON))
        {
            sub_8140030(sub_813FCAC);
        }
        else if (JOY_NEW(DPAD_RIGHT))
        {
            sub_8140030(sub_813FC2C);
        }
        break;
    case 1:
        if (sub_8141180(0) == 0 && sub_8141180(1) == 0)
        {
            if (gUnknown_203F3A0->bet == 3 || GetCoins() == 0)
                data[0] = 2;
            else
                data[0] = 0;
        }
        break;
    case 2:
        sub_811539C();
        sub_81409B4();
        sub_8140148();
        gUnknown_203F3A0->field_06 = 0;
        sub_8141148(3, 0);
        data[0] = 3;
        break;
    case 3:
        if (sub_8141180(0) == 0)
        {
            if (JOY_NEW(A_BUTTON))
            {
                PlaySE(SE_JYUNI);
                sub_814016C(gUnknown_203F3A0->field_06, gUnknown_203F3A0->field_06);
                sub_8141C30(gUnknown_203F3A0->field_06, 0);
                data[0] = 4;
            }
        }
        break;
    case 4:
        if (sub_81401A0(gUnknown_203F3A0->field_06) == 0 && sub_8141180(0) == 0)
        {
            gUnknown_203F3A0->field_06++;
            if (gUnknown_203F3A0->field_06 >= 3)
            {
                gUnknown_203F3A0->field_0A = sub_8140A80();
                gUnknown_203F3A0->bet = 0;
                gUnknown_203F3A0->field_06 = 0;
                if (gUnknown_203F3A0->field_0A == 0)
                    sub_8140030(sub_813FD84);
                else
                {
                    if (gUnknown_203F3A0->field_0A == 6)
                        IncrementGameStat(GAME_STAT_SLOT_JACKPOTS);
                    sub_8140A70();
                    sub_8140030(sub_813FE1C);
                }
            }
            else
                data[0] = 3;
        }
        break;
    }
}

void sub_813FBC0(u8 taskId)
{
    s16 * data = gTasks[taskId].data;

    switch (data[0])
    {
    case 0:
        sub_8141148(9, 0);
        data[0]++;
        break;
    case 1:
        if (sub_8141180(0) == 0)
            data[0]++;
        break;
    case 2:
        if (JOY_NEW(A_BUTTON | B_BUTTON | DPAD_ANY))
            sub_8140030(sub_813FFD8);
        break;
    }
}
