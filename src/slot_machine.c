#include "global.h"
#include "palette.h"
#include "decompress.h"
#include "task.h"
#include "main.h"
#include "malloc.h"
#include "sound.h"
#include "coins.h"
#include "quest_log.h"
#include "overworld.h"
#include "slot_machine.h"
#include "menu.h"
#include "random.h"
#include "constants/songs.h"

struct SlotMachineState
{
    MainCallback savedCallback;
    u16 machineidx;
    u16 field_06;
    u16 field_08;
    u16 slotRewardClass;
    u16 field_0C;
    u16 bet;
    u8 field_10;
    u8 field_11;
    bool32 field_14[3];
    s16 field_20[3];
    s16 field_26[3];
    s16 field_2C[3];
    s16 field_32[3];
    u32 field_38;
    u32 field_3C[5];
    u16 payout;
};

struct SlotMachineGfxManager
{
    u32 field_00[3];
    struct Sprite * field_0C[3][5];
    struct Sprite * field_48[4];
    struct Sprite * field_58[4];
    struct Sprite * field_68[2];
    vu16 * field_70;
};

EWRAM_DATA struct SlotMachineState * sSlotMachineState = NULL;
EWRAM_DATA struct SlotMachineGfxManager * sSlotMachineGfxManager = NULL;

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
bool32 sub_814054C(s32, s32, s32, s32, s32);
bool32 sub_81406E8(s32, s32, s32);
bool32 sub_81408F4(s32, s32);
void sub_81409B4(void);
void sub_8140A70(void);
u16 sub_8140A80(void);
void sub_8140C6C(struct SlotMachineGfxManager * manager);
void sub_8140D7C(const s16 *, const s16 *);
bool32 sub_814104C(void);
void sub_8141094(void);
void sub_8141148(u16 a0, u8 a1);
bool32 sub_8141180(u8 a0);
void sub_8141C30(u8, u8);

const u8 gUnknown_8464890[][2] = {
    {0x00, 0x03},
    {0x00, 0x06},
    {0x03, 0x06},

    {0x01, 0x04},
    {0x01, 0x07},
    {0x04, 0x07},

    {0x02, 0x05},
    {0x02, 0x08},
    {0x05, 0x08},

    {0x00, 0x04},
    {0x00, 0x08},
    {0x04, 0x08},

    {0x02, 0x04},
    {0x02, 0x06},
    {0x04, 0x06}
};

const u8 gUnknown_84648AE[][3] = {
    {0x00, 0x03, 0x06}, // top row
    {0x01, 0x04, 0x07}, // middle row
    {0x02, 0x05, 0x08}, // bottom row
    {0x00, 0x04, 0x08}, // tl-br
    {0x02, 0x04, 0x06}  // bl-tr
};

const u8 gUnknown_84648BD[][4] = {
    {0x00, 0x04, 0x08, 0x03}, // tl-br
    {0x00, 0x03, 0x06, 0x02}, // top row
    {0x01, 0x04, 0x07, 0x01}, // middle row
    {0x02, 0x05, 0x08, 0x02}, // bottom row
    {0x02, 0x04, 0x06, 0x03}  // bl-tr
};

const u16 gUnknown_84648D2[][7] = {
    {0x1fa1, 0x2eab, 0x3630, 0x39f3, 0x3bd4, 0x3bfc, 0x0049},
    {0x1f97, 0x2ea2, 0x3627, 0x39e9, 0x3bca, 0x3bf8, 0x0049},
    {0x1f91, 0x2e9b, 0x3620, 0x39e3, 0x3bc4, 0x3bf4, 0x0049},
    {0x1f87, 0x2e92, 0x3617, 0x39d9, 0x3bba, 0x3bef, 0x0050},
    {0x1f7f, 0x2e89, 0x360e, 0x39d1, 0x3bb2, 0x3bea, 0x0050},
    {0x1fc9, 0x2efc, 0x3696, 0x3a63, 0x3c49, 0x3c8b, 0x0073},
};

const u8 gUnknown_8464926[][21] = {
    {0x00, 0x03, 0x04, 0x01, 0x02, 0x06, 0x02, 0x05, 0x00, 0x06, 0x03, 0x01, 0x04, 0x02, 0x06, 0x00, 0x05, 0x02, 0x01, 0x06, 0x02},
    {0x00, 0x05, 0x04, 0x03, 0x01, 0x05, 0x04, 0x03, 0x02, 0x05, 0x04, 0x03, 0x00, 0x05, 0x04, 0x01, 0x03, 0x06, 0x05, 0x03, 0x04},
    {0x00, 0x03, 0x06, 0x05, 0x02, 0x03, 0x06, 0x05, 0x02, 0x03, 0x05, 0x06, 0x02, 0x03, 0x05, 0x06, 0x02, 0x03, 0x05, 0x06, 0x01},
};

const u16 gUnknown_8464966[] = {
      0,
      2,
      6,
      8,
     15,
    100,
    300
};

const u16 gUnknown_8464974[] = INCBIN_U16("graphics/slot_machine/unk_8464974.gbapal");
const u16 gUnknown_8464994[] = INCBIN_U16("graphics/slot_machine/unk_8464994.gbapal");
const u16 gUnknown_84649B4[] = INCBIN_U16("graphics/slot_machine/unk_84649b4.gbapal");
const u16 gUnknown_84649D4[] = INCBIN_U16("graphics/slot_machine/unk_84649d4.gbapal");
const u16 gUnknown_84649F4[] = INCBIN_U16("graphics/slot_machine/unk_84649f4.gbapal");
const u32 gUnknown_8464A14[] = INCBIN_U32("graphics/slot_machine/unk_8464a14.4bpp.lz");
const u16 gUnknown_846504C[] = INCBIN_U16("graphics/slot_machine/unk_846504c.gbapal");
const u32 gUnknown_846506C[] = INCBIN_U32("graphics/slot_machine/unk_846506c.4bpp.lz");
const u16 gUnknown_8465524[] = INCBIN_U16("graphics/slot_machine/unk_8465524.gbapal");
const u32 gUnknown_8465544[] = INCBIN_U32("graphics/slot_machine/unk_8465544.4bpp.lz");

const struct CompressedSpriteSheet gUnknown_84655B0[] = {
    {(const void *)gUnknown_8464A14, 0xe00, 0},
    {(const void *)gUnknown_846506C, 0xc00, 1},
    {(const void *)gUnknown_8465544, 0x280, 2},
};

const struct SpritePalette gUnknown_84655C8[] = {
    {gUnknown_8464974, 0},
    {gUnknown_8464994, 1},
    {gUnknown_84649B4, 2},
    {gUnknown_84649D4, 3},
    {gUnknown_84649F4, 4},
    {gUnknown_846504C, 5},
    {gUnknown_8465524, 6},
    {NULL}
};

const u16 gUnknown_8465608[] = {
    2,
    2,
    0,
    0,
    2,
    4,
    3
};

const u16 gUnknown_8465616[] = {
    0x0120, 0x011f, 0x011e, 0x011d, 0x011c, 0x011b, 0x011a, 0x0119, 0x0118, 0x0117, 0x0116, 0x0115, 0x0114, 0x0113, 0x0112, 0x0111,
    0x0110, 0x010f, 0x010e, 0x010d, 0x010c, 0x010b, 0x010a, 0x0109, 0x0108, 0x0107, 0x0106, 0x0105, 0x0104, 0x0103, 0x0102, 0x0101,
    0x0100, 0x0100, 0x0100, 0x0100, 0x0100, 0x0100, 0x0100, 0x0100, 0x0100, 0x0100, 0x0100, 0x0100, 0x0100, 0x0100, 0x0100, 0x0100,
    0x0100, 0x0100, 0x0100, 0x0100, 0x0100, 0x0100, 0x0100, 0x0100, 0x0100, 0x0100, 0x0100, 0x0100, 0x0100, 0x0100, 0x0100, 0x0100,
    0x0101, 0x0102, 0x0103, 0x0104, 0x0105, 0x0106, 0x0107, 0x0108, 0x0109, 0x010a, 0x010b, 0x010c, 0x010d, 0x010e, 0x010f, 0x0110,
    0x0111, 0x0112, 0x0113, 0x0114, 0x0115, 0x0116, 0x0117, 0x0118, 0x0119, 0x011a, 0x011b, 0x011c, 0x011d, 0x011e, 0x011f, 0x0120
};

const u8 gUnknown_84656D6[] = {
    0x10, 0x10, 0x10, 0x10, 0x0f, 0x0e, 0x0d, 0x0d, 0x0c, 0x0b, 0x0a, 0x0a, 0x09, 0x08, 0x07, 0x07, 0x06, 0x05, 0x04, 0x04, 0x03, 0x02, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x02, 0x03, 0x03, 0x04, 0x05, 0x06, 0x06, 0x07, 0x08, 0x09, 0x09, 0x0a, 0x0b, 0x0c, 0x0c, 0x0d, 0x0e, 0x0f, 0x0f, 0x0f, 0x0f, 0x0f, 0x0f
};

extern const struct SpriteTemplate gUnknown_84657E4;
extern const struct SpriteTemplate gUnknown_846587C;
extern const struct SpriteTemplate gUnknown_84658D8;

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

void sub_81401F0(u16 whichReel)
{
    s32 i, j;
    s16 r2;
    u8 sp0[5];
    s16 sp0C = sub_81401B4(whichReel);
    s32 r8 = 0;

    if (sSlotMachineState->field_08 == 0 && whichReel == 0)
    {
        for (i = 0; i < 5; i++)
        {
            for (j = 0, r2 = sp0C - i + 1; j < 3; j++, r2++)
            {
                if (r2 >= 21)
                    r2 = 0;
                if (sub_81408F4(1, gUnknown_8464926[whichReel][r2]))
                    break;
            }
            if (j == 3)
            {
                sp0[r8] = i;
                r8++;
            }
        }
    }
    else if (sSlotMachineState->field_08 != 1 || whichReel == 0)
    {
        for (i = 0, r2 = sp0C + 1; i < 3; i++, r2++)
        {
            if (r2 >= 21)
                r2 = 0;
            if (sub_81408F4(sSlotMachineState->field_08, gUnknown_8464926[whichReel][r2]))
            {
                sp0[0] = 0;
                r8 = 1;
                break;
            }
        }
        for (i = 0, r2 = sp0C; i < 4; i++, r2--)
        {
            if (r2 < 0)
                r2 = 20;
            if (sub_81408F4(sSlotMachineState->field_08, gUnknown_8464926[whichReel][r2]))
            {
                sp0[r8] = i + 1;
                r8++;
            }
        }
    }
    if (r8 == 0)
    {
        r2 = Random() % 5;
    }
    else
    {
        r2 = sp0[Random() % r8];
    }
    r2 = sp0C - r2;
    if (r2 < 0)
        r2 += 21;
    sSlotMachineState->field_32[0] = whichReel;
    sSlotMachineState->field_2C[whichReel] = r2;
}

void sub_81403BC(u16 whichReel)
{
    s16 r2, r4, r7, sp10;
    s32 i;
    s32 r6;
    u8 sp4[5];

    r7 = sSlotMachineState->field_32[0];
    r4 = sSlotMachineState->field_20[r7] + 1;
    if (r4 >= 21)
        r4 = 0;
    sp10 = sub_81401B4(whichReel);
    r2 = sp10 + 1;
    if (r2 >= 21)
        r2 = 0;
    r6 = 0;
    for (i = 0; i < 5; i++)
    {
        if (sub_814054C(r7, r4, whichReel, r2, sSlotMachineState->field_08))
        {
            sp4[r6] = i;
            r6++;
        }
        r2--;
        if (r2 < 0)
            r2 = 20;
    }
    if (r6 == 0)
    {
        sSlotMachineState->field_38 = 0;
        if (sSlotMachineState->field_08 == 5 || sSlotMachineState->field_08 == 6)
            r2 = 4;
        else
            r2 = 0;
    }
    else
    {
        sSlotMachineState->field_38 = 1;
        r2 = sp4[0];
    }
    r2 = sp10 - r2;
    if (r2 < 0)
        r2 += 21;
    sSlotMachineState->field_32[1] = whichReel;
    sSlotMachineState->field_2C[whichReel] = r2;
}

void sub_81404B8(u16 whichReel)
{
    s32 i;
    s32 r6;
    s32 r9;
    s32 r4;
    s32 r2;
    u8 sp0[5];

    r9 = sub_81401B4(whichReel);
    r4 = r9;
    r6 = 0;
    for (i = 0; i < 5; i++)
    {
        if (sub_81406E8(whichReel, r4, sSlotMachineState->field_08))
        {
            sp0[r6] = i;
            r6++;
        }
        r4--;
        if (r4 < 0)
            r4 = 20;
    }
    if (r6 == 0)
    {
        if (sSlotMachineState->field_08 == 5 || sSlotMachineState->field_08 == 6)
            r2 = 4;
        else
            r2 = 0;
    }
    else
        r2 = sp0[0];
    r2 = r9 - r2;
    if (r2 < 0)
        r2 += 21;
    sSlotMachineState->field_2C[whichReel] = r2;
}

bool32 sub_814054C(s32 a0, s32 a1, s32 a2, s32 a3, s32 a4)
{
    s32 i;
    s32 r5;
    u8 sp0[9] = {};
    
    for (i = 0; i < 9; i++)
        sp0[i] = 7;
    
    for (i = 0; i < 3; i++)
    {
        sp0[3 * a0 + i] = gUnknown_8464926[a0][a1];
        sp0[3 * a2 + i] = gUnknown_8464926[a2][a3];
        a1++;
        if (a1 >= 21)
            a1 = 0;
        a3++;
        if (a3 >= 21)
            a3 = 0;
    }

    switch (a4)
    {
    case 0:
        for (i = 0; i < 3; i++)
        {
            if (sub_81408F4(1, sp0[i]))
                return FALSE;
        }
        for (i = 0; i < 15; i++)
        {
            if (sp0[gUnknown_8464890[i][0]] == sp0[gUnknown_8464890[i][1]])
                return TRUE;
        }
        return FALSE;
    case 1:
        if (a0 == 0 || a2 == 0)
        {
            if (a0 == 1 || a2 == 1)
            {
                for (i = 0; i < 15; i += 3)
                {
                    if (sp0[gUnknown_8464890[i][0]] == sp0[gUnknown_8464890[i][1]])
                        return FALSE;
                }
            }
            for (i = 0; i < 3; i++)
            {
                if (sub_81408F4(a4, sp0[i]))
                    return TRUE;
            }
            return FALSE;
        }
        else
            return TRUE;
    case 2:
        if (a0 == 2 || a2 == 2)
        {
            for (i = 0; i < 9; i++)
            {
                if (sub_81408F4(a4, sp0[i]))
                    return TRUE;
            }
            return FALSE; // wrong level
        }
    }
    for (i = 0; i < 15; i++)
    {
        if (sp0[gUnknown_8464890[i][0]] == sp0[gUnknown_8464890[i][1]] && sub_81408F4(a4, sp0[gUnknown_8464890[i][0]]))
            return TRUE;
    }
    return FALSE;
}

#ifdef NONMATCHING
bool32 sub_81406E8(s32 a0, s32 a1, s32 a2)
{
    u8 sp0[9];
    s32 r3, r6;
    s32 i;

    r6 = sSlotMachineState->field_20[sSlotMachineState->field_32[0]] + 1;
    r3 = sSlotMachineState->field_20[sSlotMachineState->field_32[1]] + 1;
    a1++;
    if (r6 >= 21)
        r6 = 0;
    if (r3 >= 21)
        r3 = 0;
    if (a1 >= 21)
        a1 = 0;
    for (i = 0; i < 3; i++)
    {
        sp0[sSlotMachineState->field_32[0] * 3 + i] = gUnknown_8464926[sSlotMachineState->field_32[0]][r6];
        sp0[sSlotMachineState->field_32[1] * 3 + i] = gUnknown_8464926[sSlotMachineState->field_32[1]][r3];
        sp0[a0 * 3 + i] = gUnknown_8464926[a0][a1];
        r6++;
        if (r6 >= 21)
            r6 = 0;
        r3++;
        if (r3 >= 21)
            r3 = 0;
        a1++;
        if (a1 >= 21)
            a1++;
    }
    switch (a2)
    {
    case 0:
        for (i = 0; i < 3; i++)
        {
            if (sub_81408F4(1, sp0[i]))
                return FALSE;
        }
        for (i = 0; i < 5; i++)
        {
            if (sp0[gUnknown_84648AE[i][0]] == sp0[gUnknown_84648AE[i][1]] && sp0[gUnknown_84648AE[i][0]] == sp0[gUnknown_84648AE[i][2]])
                return FALSE;
        }
        return TRUE;
    case 1:
        for (i = 0; i < 5; i++)
        {
            if (sp0[gUnknown_84648AE[i][0]] == sp0[gUnknown_84648AE[i][1]] && sub_81408F4(a2, sp0[gUnknown_84648AE[i][0]]))
                return FALSE;
        }
        for (i = 0; i < 3; i++)
        {
            if (sub_81408F4(a2, sp0[i]))
                return TRUE;
        }
        return FALSE;
    case 2:
        for (i = 0; i < 5; i++)
        {
            if (sp0[gUnknown_84648AE[i][0]] == sp0[gUnknown_84648AE[i][1]] && sub_81408F4(a2, sp0[gUnknown_84648AE[i][0]]))
                return TRUE;
        }
        return FALSE;
    }
    for (i = 0; i < 5; i++)
    {
        if (sp0[gUnknown_84648AE[i][0]] == sp0[gUnknown_84648AE[i][1]] && sp0[gUnknown_84648AE[i][0]] == sp0[gUnknown_84648AE[i][2]] && sub_81408F4(a2, sp0[gUnknown_84648AE[i][0]]))
            return TRUE;
    }
    return FALSE;
}
#else
NAKED
bool32 sub_81406E8(s32 a0, s32 a1, s32 a2)
{
    asm_unified("\tpush {r4-r7,lr}\n"
                "\tmov r7, r10\n"
                "\tmov r6, r9\n"
                "\tmov r5, r8\n"
                "\tpush {r5-r7}\n"
                "\tsub sp, 0x10\n"
                "\tadds r7, r0, 0\n"
                "\tadds r5, r1, 0\n"
                "\tmov r8, r2\n"
                "\tldr r0, _081407C8 @ =sSlotMachineState\n"
                "\tldr r2, [r0]\n"
                "\tmovs r1, 0x32\n"
                "\tldrsh r0, [r2, r1]\n"
                "\tlsls r0, 1\n"
                "\tadds r1, r2, 0\n"
                "\tadds r1, 0x20\n"
                "\tadds r0, r1, r0\n"
                "\tmovs r3, 0\n"
                "\tldrsh r0, [r0, r3]\n"
                "\tadds r6, r0, 0x1\n"
                "\tmovs r3, 0x34\n"
                "\tldrsh r0, [r2, r3]\n"
                "\tlsls r0, 1\n"
                "\tadds r1, r0\n"
                "\tmovs r3, 0\n"
                "\tldrsh r0, [r1, r3]\n"
                "\tadds r3, r0, 0x1\n"
                "\tadds r5, 0x1\n"
                "\tcmp r6, 0x14\n"
                "\tble _08140726\n"
                "\tmovs r6, 0\n"
                "_08140726:\n"
                "\tcmp r3, 0x14\n"
                "\tble _0814072C\n"
                "\tmovs r3, 0\n"
                "_0814072C:\n"
                "\tcmp r5, 0x14\n"
                "\tble _08140732\n"
                "\tmovs r5, 0\n"
                "_08140732:\n"
                "\tmovs r4, 0\n"
                "\tlsls r1, r7, 1\n"
                "\tlsls r0, r7, 2\n"
                "\tmov r9, r2\n"
                "\tldr r2, _081407CC @ =gUnknown_8464926\n"
                "\tmov r10, r2\n"
                "\tadds r1, r7\n"
                "\tadd r1, sp\n"
                "\tmov r12, r1\n"
                "\tadds r0, r7\n"
                "\tlsls r0, 2\n"
                "\tadds r0, r7\n"
                "\tstr r0, [sp, 0xC]\n"
                "_0814074C:\n"
                "\tmov r7, r9\n"
                "\tmovs r0, 0x32\n"
                "\tldrsh r1, [r7, r0]\n"
                "\tlsls r0, r1, 1\n"
                "\tadds r0, r1\n"
                "\tadds r0, r4\n"
                "\tmov r7, sp\n"
                "\tadds r2, r7, r0\n"
                "\tlsls r0, r1, 2\n"
                "\tadds r0, r1\n"
                "\tlsls r0, 2\n"
                "\tadds r0, r1\n"
                "\tadds r0, r6, r0\n"
                "\tadd r0, r10\n"
                "\tldrb r0, [r0]\n"
                "\tstrb r0, [r2]\n"
                "\tmov r0, r9\n"
                "\tmovs r2, 0x34\n"
                "\tldrsh r1, [r0, r2]\n"
                "\tlsls r0, r1, 1\n"
                "\tadds r0, r1\n"
                "\tadds r0, r4\n"
                "\tadds r2, r7, r0\n"
                "\tlsls r0, r1, 2\n"
                "\tadds r0, r1\n"
                "\tlsls r0, 2\n"
                "\tadds r0, r1\n"
                "\tadds r0, r3, r0\n"
                "\tadd r0, r10\n"
                "\tldrb r0, [r0]\n"
                "\tstrb r0, [r2]\n"
                "\tldr r7, [sp, 0xC]\n"
                "\tadds r0, r5, r7\n"
                "\tadd r0, r10\n"
                "\tldrb r0, [r0]\n"
                "\tmov r1, r12\n"
                "\tstrb r0, [r1]\n"
                "\tadds r6, 0x1\n"
                "\tcmp r6, 0x14\n"
                "\tble _0814079E\n"
                "\tmovs r6, 0\n"
                "_0814079E:\n"
                "\tadds r3, 0x1\n"
                "\tcmp r3, 0x14\n"
                "\tble _081407A6\n"
                "\tmovs r3, 0\n"
                "_081407A6:\n"
                "\tadds r5, 0x1\n"
                "\tcmp r5, 0x14\n"
                "\tble _081407AE\n"
                "\tmovs r5, 0\n"
                "_081407AE:\n"
                "\tmovs r2, 0x1\n"
                "\tadd r12, r2\n"
                "\tadds r4, 0x1\n"
                "\tcmp r4, 0x2\n"
                "\tble _0814074C\n"
                "\tmov r3, r8\n"
                "\tcmp r3, 0x1\n"
                "\tbeq _08140828\n"
                "\tcmp r3, 0x1\n"
                "\tbgt _081407D0\n"
                "\tcmp r3, 0\n"
                "\tbeq _081407D8\n"
                "\tb _081408A0\n"
                "\t.align 2, 0\n"
                "_081407C8: .4byte sSlotMachineState\n"
                "_081407CC: .4byte gUnknown_8464926\n"
                "_081407D0:\n"
                "\tmov r6, r8\n"
                "\tcmp r6, 0x2\n"
                "\tbeq _08140870\n"
                "\tb _081408A0\n"
                "_081407D8:\n"
                "\tmovs r4, 0\n"
                "_081407DA:\n"
                "\tmov r7, sp\n"
                "\tadds r0, r7, r4\n"
                "\tldrb r1, [r0]\n"
                "\tmovs r0, 0x1\n"
                "\tbl sub_81408F4\n"
                "\tcmp r0, 0\n"
                "\tbne _081408DC_return_false\n"
                "\tadds r4, 0x1\n"
                "\tcmp r4, 0x2\n"
                "\tble _081407DA\n"
                "\tmovs r4, 0\n"
                "\tldr r2, _08140824 @ =gUnknown_84648AE\n"
                "\tmovs r3, 0\n"
                "\tadds r5, r2, 0x2\n"
                "_081407F8:\n"
                "\tldrb r0, [r2]\n"
                "\tmov r6, sp\n"
                "\tadds r1, r6, r0\n"
                "\tldrb r0, [r2, 0x1]\n"
                "\tadd r0, sp\n"
                "\tldrb r1, [r1]\n"
                "\tldrb r0, [r0]\n"
                "\tcmp r1, r0\n"
                "\tbne _08140816\n"
                "\tadds r0, r3, r5\n"
                "\tldrb r0, [r0]\n"
                "\tadd r0, sp\n"
                "\tldrb r0, [r0]\n"
                "\tcmp r1, r0\n"
                "\tbeq _081408DC_return_false\n"
                "_08140816:\n"
                "\tadds r2, 0x3\n"
                "\tadds r3, 0x3\n"
                "\tadds r4, 0x1\n"
                "\tcmp r4, 0x4\n"
                "\tble _081407F8\n"
                "_08140820_return_true:\n"
                "\tmovs r0, 0x1\n"
                "\tb _081408DE\n"
                "\t.align 2, 0\n"
                "_08140824: .4byte gUnknown_84648AE\n"
                "_08140828:\n"
                "\tmovs r4, 0\n"
                "\tldr r5, _0814086C @ =gUnknown_84648AE\n"
                "_0814082C:\n"
                "\tldrb r0, [r5]\n"
                "\tmov r7, sp\n"
                "\tadds r2, r7, r0\n"
                "\tldrb r0, [r5, 0x1]\n"
                "\tadds r1, r7, r0\n"
                "\tldrb r0, [r2]\n"
                "\tldrb r1, [r1]\n"
                "\tcmp r0, r1\n"
                "\tbne _0814084A\n"
                "\tadds r1, r0, 0\n"
                "\tmov r0, r8\n"
                "\tbl sub_81408F4\n"
                "\tcmp r0, 0\n"
                "\tbne _081408DC_return_false\n"
                "_0814084A:\n"
                "\tadds r5, 0x3\n"
                "\tadds r4, 0x1\n"
                "\tcmp r4, 0x4\n"
                "\tble _0814082C\n"
                "\tmovs r4, 0\n"
                "_08140854:\n"
                "\tmov r1, sp\n"
                "\tadds r0, r1, r4\n"
                "\tldrb r1, [r0]\n"
                "\tmov r0, r8\n"
                "\tbl sub_81408F4\n"
                "\tcmp r0, 0\n"
                "\tbne _08140820_return_true\n"
                "\tadds r4, 0x1\n"
                "\tcmp r4, 0x2\n"
                "\tble _08140854\n"
                "\tb _081408DC_return_false\n"
                "\t.align 2, 0\n"
                "_0814086C: .4byte gUnknown_84648AE\n"
                "_08140870:\n"
                "\tmovs r4, 0\n"
                "\tldr r5, _0814089C @ =gUnknown_84648AE\n"
                "_08140874:\n"
                "\tldrb r0, [r5]\n"
                "\tmov r3, sp\n"
                "\tadds r2, r3, r0\n"
                "\tldrb r0, [r5, 0x1]\n"
                "\tadds r1, r3, r0\n"
                "\tldrb r0, [r2]\n"
                "\tldrb r1, [r1]\n"
                "\tcmp r0, r1\n"
                "\tbne _08140892\n"
                "\tadds r1, r0, 0\n"
                "\tmov r0, r8\n"
                "\tbl sub_81408F4\n"
                "\tcmp r0, 0\n"
                "\tbne _08140820_return_true\n"
                "_08140892:\n"
                "\tadds r5, 0x3\n"
                "\tadds r4, 0x1\n"
                "\tcmp r4, 0x4\n"
                "\tble _08140874\n"
                "\tb _081408DC_return_false\n"
                "\t.align 2, 0\n"
                "_0814089C: .4byte gUnknown_84648AE\n"
                "_081408A0:\n"
                "\tmovs r4, 0\n"
                "\tldr r5, _081408F0 @ =gUnknown_84648AE\n"
                "\tadds r7, r5, 0\n"
                "\tmovs r6, 0\n"
                "_081408A8:\n"
                "\tldrb r0, [r5]\n"
                "\tmov r1, sp\n"
                "\tadds r2, r1, r0\n"
                "\tadds r0, r7, 0x1\n"
                "\tadds r0, r6, r0\n"
                "\tldrb r0, [r0]\n"
                "\tadd r0, sp\n"
                "\tldrb r1, [r2]\n"
                "\tldrb r0, [r0]\n"
                "\tcmp r1, r0\n"
                "\tbne _081408D2\n"
                "\tldrb r0, [r5, 0x2]\n"
                "\tadd r0, sp\n"
                "\tldrb r0, [r0]\n"
                "\tcmp r1, r0\n"
                "\tbne _081408D2\n"
                "\tmov r0, r8\n"
                "\tbl sub_81408F4\n"
                "\tcmp r0, 0\n"
                "\tbne _08140820_return_true\n"
                "_081408D2:\n"
                "\tadds r5, 0x3\n"
                "\tadds r6, 0x3\n"
                "\tadds r4, 0x1\n"
                "\tcmp r4, 0x4\n"
                "\tble _081408A8\n"
                "_081408DC_return_false:\n"
                "\tmovs r0, 0\n"
                "_081408DE:\n"
                "\tadd sp, 0x10\n"
                "\tpop {r3-r5}\n"
                "\tmov r8, r3\n"
                "\tmov r9, r4\n"
                "\tmov r10, r5\n"
                "\tpop {r4-r7}\n"
                "\tpop {r1}\n"
                "\tbx r1\n"
                "\t.align 2, 0\n"
                "_081408F0: .4byte gUnknown_84648AE");
}
#endif //NONMATCHING

bool32 sub_81408F4(s32 a0, s32 a1)
{
    switch (a0)
    {
    case 0:
        return a1 ^ 4 ? TRUE : FALSE;
    case 1:
    case 2:
        return a1 == 4 ? TRUE : FALSE;
    case 3:
        return a1 == 5 || a1 == 6 ? TRUE : FALSE;
    case 4:
        return a1 == 2 || a1 == 3 ? TRUE : FALSE;
    case 5:
        return a1 == 1 ? TRUE : FALSE;
    case 6:
        return a1 == 0 ? TRUE : FALSE;
    default:
        return FALSE;
    }
}

u8 sub_814096C(s32 a0)
{
    switch (a0)
    {
    default:
    case 4:
        return 1;
    case 5:
    case 6:
        return 3;
    case 2:
    case 3:
        return 4;
    case 1:
        return 5;
    case 0:
        return 6;
    }
}

void sub_81409B4(void)
{
    u16 r2 = Random() / 4;
    s32 i;
    const u16 * r4 = gUnknown_84648D2[sSlotMachineState->machineidx];
    for (i = 0; i < 6; i++)
    {
        if (r2 < r4[i])
            break;
    }
    if (sSlotMachineState->field_08 < 5)
    {
        if (sSlotMachineState->field_0C == 0)
        {
            if ((Random() & 0x3FFF) < r4[6])
                sSlotMachineState->field_0C = (Random() & 1) ? 5 : 60;
        }
        if (sSlotMachineState->field_0C != 0)
        {
            if (i == 0 && (Random() & 0x3FFF) < 0x2CCC)
                sSlotMachineState->field_0C = (Random() & 1) ? 5 : 60;
            sSlotMachineState->field_0C--;
        }
        sSlotMachineState->field_08 = i;
    }
}

void sub_8140A70(void)
{
    sSlotMachineState->field_08 = 0;
}

u16 sub_8140A80(void)
{
    u8 sp0[9] = {};
    s32 i;
    s32 r4, r3, r2;
    s32 r9;

    for (i = 0; i < 5; i++)
        sSlotMachineState->field_3C[i] = 0;

    r9 = 0;
    r4 = sSlotMachineState->field_20[0];
    r3 = sSlotMachineState->field_20[1];
    r2 = sSlotMachineState->field_20[2];

    for (i = 0; i < 3; i++)
    {
        r4++;
        if (r4 >= 21)
            r4 = 0;
        r3++;
        if (r3 >= 21)
            r3 = 0;
        r2++;
        if (r2 >= 21)
            r2 = 0;
        sp0[0 * 3 + i] = gUnknown_8464926[0][r4];
        sp0[1 * 3 + i] = gUnknown_8464926[1][r3];
        sp0[2 * 3 + i] = gUnknown_8464926[2][r2];
    }
    sSlotMachineState->payout = 0;
    for (i = 0; i < 5; i++)
    {
        if (sSlotMachineState->bet >= gUnknown_84648BD[i][3])
        {
            if (sub_81408F4(1, sp0[gUnknown_84648BD[i][0]]))
                r3 = sub_81408F4(2, sp0[gUnknown_84648BD[i][1]]) ? 2 : 1;
            else if (sp0[gUnknown_84648BD[i][0]] == sp0[gUnknown_84648BD[i][1]] && sp0[gUnknown_84648BD[i][0]] == sp0[gUnknown_84648BD[i][2]])
                r3 = sub_814096C(sp0[gUnknown_84648BD[i][0]]);
            else
                r3 = 0;
            if (r3 != 0)
            {
                sSlotMachineState->field_3C[i] = 1;
                sSlotMachineState->payout += gUnknown_8464966[r3];
            }
            if (r3 > r9)
                r9 = r3;
        }
    }
    return r9;
}

u16 sub_8140BDC(void)
{
    return sSlotMachineState->payout;
}

u8 sub_8140BEC(void)
{
    return sSlotMachineState->bet;
}

bool32 sub_8140BF8(s32 a0)
{
    return sSlotMachineState->field_3C[a0];
}

bool32 sub_8140C0C(void)
{
    s32 i;

    for (i = 0; i < NELEMS(gUnknown_84655B0); i++)
        LoadCompressedObjectPic(&gUnknown_84655B0[i]);
    LoadSpritePalettes(gUnknown_84655C8);
    sSlotMachineGfxManager = Alloc(sizeof(*sSlotMachineGfxManager));
    if (sSlotMachineGfxManager == NULL)
        return FALSE;
    sub_8140C6C(sSlotMachineGfxManager);
    return TRUE;
}

void sub_8140C50(void)
{
    if (sSlotMachineGfxManager != NULL)
    {
        Free(sSlotMachineGfxManager);
        sSlotMachineGfxManager = NULL;
    }
}

void sub_8140C6C(struct SlotMachineGfxManager * manager)
{
    s32 i, j;

    for (i = 0; i < 3; i++)
    {
        manager->field_00[i] = 0;
        for (j = 0; j < 5; j++)
        {
            manager->field_0C[i][j] = NULL;
        }
    }
}

void sub_8140CA0(void)
{
    struct Sprite * sprite;
    s32 i, j;
    s32 spriteId;
    s32 animId;
    for (i = 0; i < 3; i++)
    {
        for (j = 0; j < 5; j++)
        {
            spriteId = CreateSprite(&gUnknown_84657E4, 80 + 40 * i, 44 + 24 * j, 2);
            animId =  gUnknown_8464926[i][j];
            sprite = &gSprites[spriteId];
            StartSpriteAnim(sprite, animId);
            sprite->oam.paletteNum = IndexOfSpritePaletteTag(gUnknown_8465608[animId]);
            sprite->data[0] = i;
            sprite->data[1] = j;
            sprite->data[2] = j;
            sprite->data[3] = 0;
            sprite->oam.matrixNum = 0;
            sSlotMachineGfxManager->field_0C[i][j] = sprite;
            sSlotMachineGfxManager->field_70 = (vu16 *)(OAM + 0 * sizeof(struct OamData) + offsetof(struct OamData, affineParam));
        }
    }
}

void sub_8140D7C(const s16 * a0, const s16 * a1)
{
    s32 i, j;
    s32 r6, r10;

    for (i = 0; i < 3; i++)
    {
        r6 = *a0;
        r10 = *a1 * 8;
        for (j = 0; j < 5; j++)
        {
            sSlotMachineGfxManager->field_0C[i][j]->pos2.y = r10;
            {
                s32 r4 = gUnknown_8464926[i][r6];
                struct Sprite * sprite = sSlotMachineGfxManager->field_0C[i][j];
                StartSpriteAnim(sprite, r4);
            }
            {
                s32 r4 = gUnknown_8464926[i][r6];
                struct Sprite * sprite = sSlotMachineGfxManager->field_0C[i][j];
                StartSpriteAnim(sprite, r4);
            }
            sSlotMachineGfxManager->field_0C[i][j]->oam.paletteNum = IndexOfSpritePaletteTag(gUnknown_8465608[gUnknown_8464926[i][r6]]);
            r6++;
            if (r6 >= 21)
                r6 = 0;
        }
        a0++;
        a1++;
    }
}

void sub_8140E40(void)
{
    s32 vcount = REG_VCOUNT - 0x2B;
    if (vcount >= 0 && vcount < 0x54)
    {
        *sSlotMachineGfxManager->field_70 = gUnknown_8465616[vcount];
        REG_BLDY = gUnknown_84656D6[vcount];
    }
    else
    {
        *sSlotMachineGfxManager->field_70 = 0x100;
        REG_BLDY = 0;
    }
}

void sub_8140E9C(void)
{
    s32 i;
    s32 spriteId;

    for (i = 0; i < 4; i++)
    {
        spriteId = CreateSprite(&gUnknown_846587C, 0x55 + 7 * i, 30, 0);
        sSlotMachineGfxManager->field_48[i] = &gSprites[spriteId];
        spriteId = CreateSprite(&gUnknown_846587C, 0x85 + 7 * i, 30, 0);
        sSlotMachineGfxManager->field_58[i] = &gSprites[spriteId];
    }
}

void sub_8140F2C(void)
{
    s32 coins = GetCoins();
    s32 payout = sub_8140BDC();
    s32 i;
    s32 divisor = 1000;
    s32 quotient;

    for (i = 0; i < 4; i++)
    {
        quotient = coins / divisor;
        StartSpriteAnim(sSlotMachineGfxManager->field_48[i], quotient);
        coins -= quotient * divisor;
        quotient = payout / divisor;
        StartSpriteAnim(sSlotMachineGfxManager->field_58[i], quotient);
        payout -= quotient * divisor;
        divisor /= 10;
    }
}

void sub_8140FC4(void)
{
    s32 spriteId;

    spriteId = CreateSprite(&gUnknown_84658D8, 0x10, 0x88, 1);
    sSlotMachineGfxManager->field_68[0] = &gSprites[spriteId];
    spriteId = CreateSprite(&gUnknown_84658D8, 0xE0, 0x88, 1);
    sSlotMachineGfxManager->field_68[1] = &gSprites[spriteId];
    sSlotMachineGfxManager->field_68[1]->hFlip = TRUE;
}

void sub_8141020(u8 a0)
{
    s32 i;
    for (i = 0; i < 2; i++)
    {
        StartSpriteAnim(sSlotMachineGfxManager->field_68[i], a0);
    }
}
