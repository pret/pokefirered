#include "global.h"
#include "gflib.h"
#include "help_system.h"
#include "link.h"
#include "link_rfu.h"
#include "list_menu.h"
#include "load_save.h"
#include "menu.h"
#include "overworld.h"
#include "quest_log.h"
#include "save.h"
#include "scanline_effect.h"
#include "task.h"
#include "constants/songs.h"

enum
{
    UNION_ROOM_KB_PAGE_UPPER,
    UNION_ROOM_KB_PAGE_LOWER,
    UNION_ROOM_KB_PAGE_EMOJI,
    UNION_ROOM_KB_PAGE_COUNT
};

struct UnionRoomChat
{
    u8 filler0[0x4];
    u16 unk4;
    u16 unk6;
    u8 filler8[0x2];
    u16 unkA;
    u8 fillerC[0x1];
    u8 unkD;
    u8 unkE;
    u8 unkF;
    u8 currentPage;
    u8 unk11;
    u8 currentRow;
    u8 unk13;
    u8 unk14;
    u8 unk15;
    u8 unk16;
    u8 unk17;
    u8 unk18;
    u8 unk19;
    u8 unk1A[0x1F];
    u8 unk39[0x40];
    u8 unk79[0x40];
    u8 unkB9[UNION_ROOM_KB_ROW_COUNT][21];
    u8 filler18B[0x5];
    u8 unk190[0x28];
};

EWRAM_DATA struct UnionRoomChat * gUnknown_203B0E0 = NULL;

void sub_812845C(struct UnionRoomChat * unionRoomChat);
void c2_081284E0(void);
void sub_81285B4(void);
void sub_81285CC(void);
void sub_81285E8(u8 taskId);
void sub_8128640(void);
void sub_81286C4(void);
void sub_81287B4(void);
void sub_81288D4(void);
void sub_8128AA0(void);
void sub_8128C04(void);
void sub_8128CA8(void);
void sub_8128DA4(void);
void sub_8128E78(void);
void sub_8128FB8(void);
void sub_8129218(u16 a0);
bool32 sub_8129228(void);
void sub_81292D8(void);
void sub_81293AC(void);
void sub_81293D8(void);
bool32 sub_8129408(void);
void sub_8129424(void);
void sub_8129454(void);
void sub_8129470(void);
void sub_8129560(u8 *ptr);
void sub_8129568(u8 *ptr);
void sub_8129590(u8 *ptr);
void sub_81295C0(u8 *ptr);
void sub_81295EC(u8 *ptr);
void sub_8129614(u8 *ptr);
void sub_81298F8(u8 taskId);
void sub_8129B14(void);
bool32 sub_8129B78(void);
void sub_8129B88(void);
void sub_8129BFC(void);
void sub_8129C34(u16 a0, u8 a1);
u8 sub_8129C8C(u8 a0);
s8 sub_812A568(void);

static void (*const gUnknown_845A880[])(void) = {
    sub_8128640,
    sub_81286C4,
    sub_81287B4,
    sub_81288D4,
    sub_8128DA4,
    sub_8128E78,
    sub_8128AA0,
    sub_8128C04,
    sub_8128CA8,
    sub_8128FB8
};

void sub_8128420(void)
{
    gUnknown_203B0E0 = Alloc(sizeof(struct UnionRoomChat));
    sub_812845C(gUnknown_203B0E0);
    gKeyRepeatStartDelay = 20;
    sub_812B4AC();
    SetVBlankCallback(NULL);
    SetMainCallback2(c2_081284E0);
}

void sub_812845C(struct UnionRoomChat * unionRoomChat)
{
    int i;

    unionRoomChat->unk4 = 0;
    unionRoomChat->unk6 = 0;
    unionRoomChat->currentPage = 0;
    unionRoomChat->unk11 = 0;
    unionRoomChat->currentRow = 0;
    unionRoomChat->unk14 = 0;
    unionRoomChat->unk15 = 0;
    unionRoomChat->unk16 = 0;
    unionRoomChat->unk1A[0] = EOS;
    unionRoomChat->unkD = GetLinkPlayerCount();
    unionRoomChat->unk13 = GetMultiplayerId();
    unionRoomChat->unk17 = 0;
    unionRoomChat->unk18 = 0;
    sub_8129560(unionRoomChat->unk190);
    for (i = 0; i < UNION_ROOM_KB_ROW_COUNT; i++)
        StringCopy(unionRoomChat->unkB9[i], gSaveBlock1Ptr->unk3AD4[i]);
}

void sub_81284BC(void)
{
    DestroyTask(gUnknown_203B0E0->unkE);
    DestroyTask(gUnknown_203B0E0->unkF);
    Free(gUnknown_203B0E0);
}

void c2_081284E0(void)
{
    switch (gMain.state)
    {
    case 0:
        ResetTasks();
        ResetSpriteData();
        FreeAllSpritePalettes();
        sub_8129B14();
        gMain.state++;
        break;
    case 1:
        sub_8129BFC();
        if (!sub_8129B78())
        {
            BlendPalettes(0xFFFFFFFF, 16, RGB_BLACK);
            BeginNormalPaletteFade(0xFFFFFFFF, -1, 16, 0, RGB_BLACK);
            SetVBlankCallback(sub_81285B4);
            gMain.state++;
        }
        break;
    case 2:
        UpdatePaletteFade();
        if (!gPaletteFade.active)
        {
            SetMainCallback2(sub_81285CC);
            SetQuestLogEvent(QL_EVENT_USED_UNION_ROOM_CHAT, NULL);
            gUnknown_203B0E0->unkE = CreateTask(sub_81285E8, 8);
            gUnknown_203B0E0->unkF = CreateTask(sub_81298F8, 7);
            LoadWirelessStatusIndicatorSpriteGfx();
            CreateWirelessStatusIndicatorSprite(232, 150);
        }
        break;
    }
}

void sub_81285B4(void)
{
    TransferPlttBuffer();
    LoadOam();
    ProcessSpriteCopyRequests();
    ScanlineEffect_InitHBlankDmaTransfer();
}

void sub_81285CC(void)
{
    RunTasks();
    sub_8129BFC();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

void sub_81285E8(u8 taskId)
{
    switch (gUnknown_203B0E0->unk17)
    {
    case 1:
        sub_8129218(6);
        gUnknown_203B0E0->unk17 = 0;
        break;
    case 2:
        sub_8129218(7);
        gUnknown_203B0E0->unk17 = 0;
        break;
    case 3:
        sub_8129218(8);
        gUnknown_203B0E0->unk17 = 0;
        break;
    }

    gUnknown_845A880[gUnknown_203B0E0->unk4]();
}

void sub_8128640(void)
{
    switch (gUnknown_203B0E0->unk6)
    {
    case 0:
        sub_8129568(gUnknown_203B0E0->unk190);
        gUnknown_203B0E0->unk6++;
        // fall through
    case 1:
        if (IsLinkTaskFinished() && !sub_80FBA1C())
        {
            if (SendBlock(0, gUnknown_203B0E0->unk190, sizeof(gUnknown_203B0E0->unk190)))
                gUnknown_203B0E0->unk6++;
        }
        break;
    case 2:
        if (IsLinkTaskFinished())
            sub_8129218(1);
        break;
    }
}

void sub_81286C4(void)
{
    bool8 var0, var1;

    switch (gUnknown_203B0E0->unk6)
    {
    case 0:
        if (JOY_NEW(START_BUTTON))
        {
            if (gUnknown_203B0E0->unk15)
                sub_8129218(4);
        }
        else if (JOY_NEW(SELECT_BUTTON))
        {
            sub_8129218(2);
        }
        else if (JOY_REPT(B_BUTTON))
        {
            if (gUnknown_203B0E0->unk15)
            {
                sub_81293AC();
                sub_8129C34(8, 0);
                gUnknown_203B0E0->unk6 = 1;
            }
            else
            {
                sub_8129218(3);
            }
        }
        else if (JOY_NEW(A_BUTTON))
        {
            sub_81292D8();
            sub_8129C34(8, 0);
            sub_8129C34(2, 1);
            gUnknown_203B0E0->unk6 = 1;
        }
        else if (JOY_NEW(R_BUTTON))
        {
            if (gUnknown_203B0E0->currentPage != UNION_ROOM_KB_PAGE_COUNT)
            {
                sub_81293D8();
                sub_8129C34(8, 0);
                gUnknown_203B0E0->unk6 = 1;
            }
            else
            {
                sub_8129218(5);
            }
        }
        else if (sub_8129228())
        {
            sub_8129C34(1, 0);
            gUnknown_203B0E0->unk6 = 1;
        }
        break;
    case 1:
        var0 = sub_8129C8C(0);
        var1 = sub_8129C8C(1);
        if (!var0 && !var1)
            gUnknown_203B0E0->unk6 = 0;
        break;
    }
}

void sub_81287B4(void)
{
    s16 input;
    int var0;

    switch (gUnknown_203B0E0->unk6)
    {
    case 0:
        sub_8129C34(3, 0);
        gUnknown_203B0E0->unk6++;
        break;
    case 1:
        if (!sub_8129C8C(0))
            gUnknown_203B0E0->unk6++;
        break;
    case 2:
        input = Menu_ProcessInput();
        switch (input)
        {
        default:
            sub_8129C34(4, 0);
            var0 = 1;
            if (gUnknown_203B0E0->currentPage == input || input > UNION_ROOM_KB_PAGE_COUNT)
                var0 = 0;
            break;
        case MENU_NOTHING_CHOSEN:
            if (JOY_NEW(SELECT_BUTTON))
            {
                PlaySE(SE_SELECT);
                Menu_MoveCursor(1);
            }
            return;
        case MENU_B_PRESSED:
            sub_8129C34(4, 0);
            gUnknown_203B0E0->unk6 = 3;
            return;
        }

        if (!var0)
        {
            gUnknown_203B0E0->unk6 = 3;
            return;
        }

        gUnknown_203B0E0->unk11 = 0;
        gUnknown_203B0E0->currentRow = 0;
        sub_8129C34(5, 1);
        gUnknown_203B0E0->currentPage = input;
        gUnknown_203B0E0->unk6 = 4;
        break;
    case 3:
        if (!sub_8129C8C(0))
            sub_8129218(1);
        break;
    case 4:
        if (!sub_8129C8C(0) && !sub_8129C8C(1))
            sub_8129218(1);
        break;
    }
}

void sub_81288D4(void)
{
    s8 input;

    switch (gUnknown_203B0E0->unk6)
    {
    case 0:
        sub_8129C34(6, 0);
        gUnknown_203B0E0->unk6 = 1;
        break;
    case 1:
        if (!sub_8129C8C(0))
            gUnknown_203B0E0->unk6 = 2;
        break;
    case 2:
        input = sub_812A568();
        switch (input)
        {
        case -1:
        case 1:
            sub_8129C34(7, 0);
            gUnknown_203B0E0->unk6 = 3;
            break;
        case 0:
            if (gUnknown_203B0E0->unk13 == 0)
            {
                sub_8129614(gUnknown_203B0E0->unk190);
                sub_8129C34(7, 0);
                gUnknown_203B0E0->unk6 = 9;
            }
            else
            {
                sub_81295C0(gUnknown_203B0E0->unk190);
                gUnknown_203B0E0->unk6 = 4;
            }
            break;
        }
        break;
    case 3:
        if (!sub_8129C8C(0))
            sub_8129218(1);
        break;
    case 9:
        if (!sub_8129C8C(0))
        {
            sub_8129C34(20, 0);
            gUnknown_203B0E0->unk6 = 10;
        }
        break;
    case 10:
        if (!sub_8129C8C(0))
            gUnknown_203B0E0->unk6 = 8;
        break;
    case 8:
        input = sub_812A568();
        switch (input)
        {
        case -1:
        case 1:
            sub_8129C34(7, 0);
            gUnknown_203B0E0->unk6 = 3;
            break;
        case 0:
            sub_80FA4A8();
            sub_8129614(gUnknown_203B0E0->unk190);
            gUnknown_203B0E0->unk6 = 4;
            break;
        }
        break;
    case 4:
        if (IsLinkTaskFinished() && !sub_80FBA1C() && SendBlock(0, gUnknown_203B0E0->unk190, sizeof(gUnknown_203B0E0->unk190)))
        {
            if (!gUnknown_203B0E0->unk13)
                gUnknown_203B0E0->unk6 = 6;
            else
                gUnknown_203B0E0->unk6 = 5;
        }
        break;
    case 5:
        if (!gReceivedRemoteLinkPlayers)
        {
            sub_8129218(9);
        }
        break;
    }
}

void sub_8128AA0(void)
{
    switch (gUnknown_203B0E0->unk6)
    {
    case 0:
        if (!FuncIsActiveTask(sub_81298F8))
        {
            sub_8129C34(7, 0);
            gUnknown_203B0E0->unk6++;
        }
        break;
    case 1:
        if (!sub_8129C8C(0))
        {
            sub_8129C34(18, 0);
            gUnknown_203B0E0->unk6++;
        }
        break;
    case 2:
        if (!sub_8129C8C(0))
        {
            sub_81295EC(gUnknown_203B0E0->unk190);
            gUnknown_203B0E0->unk6++;
        }
        break;
    case 3:
        if (IsLinkTaskFinished() && !sub_80FBA1C() && SendBlock(0, gUnknown_203B0E0->unk190, sizeof(gUnknown_203B0E0->unk190)))
            gUnknown_203B0E0->unk6++;
        break;
    case 4:
        if ((GetBlockReceivedStatus() & 1) && !sub_80FBA1C())
            gUnknown_203B0E0->unk6++;
        break;
    case 5:
        if (IsLinkTaskFinished() && !sub_80FBA1C())
        {
            sub_800AAC0();
            gUnknown_203B0E0->unkA = 0;
            gUnknown_203B0E0->unk6++;
        }
        break;
    case 6:
        if (gUnknown_203B0E0->unkA < 150)
            gUnknown_203B0E0->unkA++;

        if (!gReceivedRemoteLinkPlayers)
            gUnknown_203B0E0->unk6++;
        break;
    case 7:
        if (gUnknown_203B0E0->unkA >= 150)
            sub_8129218(9);
        else
            gUnknown_203B0E0->unkA++;
        break;
    }
}

void sub_8128C04(void)
{
    switch (gUnknown_203B0E0->unk6)
    {
    case 0:
        if (!FuncIsActiveTask(sub_81298F8))
        {
            sub_8129C34(7, 0);
            gUnknown_203B0E0->unk6++;
        }
        break;
    case 1:
        if (!sub_8129C8C(0) && IsLinkTaskFinished() && !sub_80FBA1C())
        {
            sub_800AAC0();
            gUnknown_203B0E0->unkA = 0;
            gUnknown_203B0E0->unk6++;
        }
        break;
    case 2:
        if (gUnknown_203B0E0->unkA < 150)
            gUnknown_203B0E0->unkA++;

        if (!gReceivedRemoteLinkPlayers)
            gUnknown_203B0E0->unk6++;
        break;
    case 3:
        if (gUnknown_203B0E0->unkA >= 150)
            sub_8129218(9);
        else
            gUnknown_203B0E0->unkA++;
        break;
    }
}

void sub_8128CA8(void)
{
    switch (gUnknown_203B0E0->unk6)
    {
    case 0:
        if (!FuncIsActiveTask(sub_81298F8))
        {
            if (gUnknown_203B0E0->unk13)
                sub_8129C34(7, 0);

            gUnknown_203B0E0->unk6++;
        }
        break;
    case 1:
        if (!sub_8129C8C(0))
        {
            if (gUnknown_203B0E0->unk13)
                sub_8129C34(19, 0);

            gUnknown_203B0E0->unk6++;
        }
        break;
    case 2:
        if (sub_8129C8C(0) != TRUE && IsLinkTaskFinished() && !sub_80FBA1C())
        {
            sub_800AAC0();
            gUnknown_203B0E0->unkA = 0;
            gUnknown_203B0E0->unk6++;
        }
        break;
    case 3:
        if (gUnknown_203B0E0->unkA < 150)
            gUnknown_203B0E0->unkA++;

        if (!gReceivedRemoteLinkPlayers)
            gUnknown_203B0E0->unk6++;
        break;
    case 4:
        if (gUnknown_203B0E0->unkA >= 150)
            sub_8129218(9);
        else
            gUnknown_203B0E0->unkA++;
        break;
    }
}

void sub_8128DA4(void)
{
    switch (gUnknown_203B0E0->unk6)
    {
    case 0:
        if (!gReceivedRemoteLinkPlayers)
        {
            sub_8129218(1);
            break;
        }

        sub_8129590(gUnknown_203B0E0->unk190);
        gUnknown_203B0E0->unk6++;
        // fall through
    case 1:
        if (IsLinkTaskFinished() == TRUE && !sub_80FBA1C() && SendBlock(0, gUnknown_203B0E0->unk190, sizeof(gUnknown_203B0E0->unk190)))
            gUnknown_203B0E0->unk6++;
        break;
    case 2:
        sub_8129454();
        sub_8129C34(8, 0);
        gUnknown_203B0E0->unk6++;
        break;
    case 3:
        if (!sub_8129C8C(0))
            gUnknown_203B0E0->unk6++;
        break;
    case 4:
        if (IsLinkTaskFinished())
            sub_8129218(1);
        break;
    }
}

void sub_8128E78(void)
{
    switch (gUnknown_203B0E0->unk6)
    {
    case 0:
        if (sub_8129408())
        {
            sub_8129C34(9, 0);
            gUnknown_203B0E0->unk6 = 2;
        }
        else
        {
            sub_8129C34(13, 0);
            gUnknown_203B0E0->unk6 = 5;
        }
        break;
    case 1:
        if (JOY_NEW(A_BUTTON))
        {
            sub_8129424();
            sub_8129C34(11, 0);
            gUnknown_203B0E0->unk6 = 3;
        }
        else if (JOY_NEW(B_BUTTON))
        {
            sub_8129C34(10, 0);
            gUnknown_203B0E0->unk6 = 4;
        }
        else if (sub_8129228())
        {
            sub_8129C34(1, 0);
            gUnknown_203B0E0->unk6 = 2;
        }
        break;
    case 2:
        if (!sub_8129C8C(0))
            gUnknown_203B0E0->unk6 = 1;
        break;
    case 3:
        if (!sub_8129C8C(0))
        {
            sub_8129C34(10, 0);
            gUnknown_203B0E0->unk6 = 4;
        }
        break;
    case 4:
        if (!sub_8129C8C(0))
            sub_8129218(1);
        break;
    case 5:
        if (!sub_8129C8C(0))
            gUnknown_203B0E0->unk6 = 6;
        break;
    case 6:
        if (JOY_NEW(A_BUTTON | B_BUTTON))
        {
            sub_8129C34(7, 0);
            gUnknown_203B0E0->unk6 = 4;
        }
        break;
    }
}

void sub_8128FB8(void)
{
    s8 input;

    switch (gUnknown_203B0E0->unk6)
    {
    case 0:
        if (!gUnknown_203B0E0->unk18)
        {
            gUnknown_203B0E0->unk6 = 12;
        }
        else
        {
            sub_8129C34(7, 0);
            gUnknown_203B0E0->unk6 = 1;
        }
        break;
    case 1:
        if (!sub_8129C8C(0))
        {
            sub_8129C34(14, 0);
            gUnknown_203B0E0->unk6 = 2;
        }
        break;
    case 2:
        input = sub_812A568();
        switch (input)
        {
        case -1:
        case 1:
            gUnknown_203B0E0->unk6 = 12;
            break;
        case 0:
            sub_8129C34(7, 0);
            gUnknown_203B0E0->unk6 = 3;
            break;
        }
        break;
    case 3:
        if (!sub_8129C8C(0))
        {
            sub_8129C34(15, 0);
            gUnknown_203B0E0->unk6 = 4;
        }
        break;
    case 4:
        if (!sub_8129C8C(0))
            gUnknown_203B0E0->unk6 = 5;
        break;
    case 5:
        input = sub_812A568();
        switch (input)
        {
        case -1:
        case 1:
            gUnknown_203B0E0->unk6 = 12;
            break;
        case 0:
            sub_8129C34(7, 0);
            gUnknown_203B0E0->unk6 = 6;
            break;
        }
        break;
    case 6:
        if (!sub_8129C8C(0))
        {
            sub_8129C34(16, 0);
            sub_8129470();
            gUnknown_203B0E0->unk6 = 7;
        }
        break;
    case 7:
        if (!sub_8129C8C(0))
        {
            SetContinueGameWarpStatusToDynamicWarp();
            TrySavingData(SAVE_NORMAL);
            gUnknown_203B0E0->unk6 = 8;
        }
        break;
    case 8:
        sub_8129C34(17, 0);
        gUnknown_203B0E0->unk6 = 9;
        break;
    case 9:
        if (!sub_8129C8C(0))
        {
            PlaySE(SE_SAVE);
            ClearContinueGameWarpStatus2();
            gUnknown_203B0E0->unk6 = 10;
        }
        break;
    case 10:
        gUnknown_203B0E0->unk19 = 0;
        gUnknown_203B0E0->unk6 = 11;
        break;
    case 11:
        gUnknown_203B0E0->unk19++;
        if (gUnknown_203B0E0->unk19 > 120)
            gUnknown_203B0E0->unk6 = 12;
        break;
    case 12:
        BeginNormalPaletteFade(0xFFFFFFFF, -1, 0, 16, RGB_BLACK);
        gUnknown_203B0E0->unk6 = 13;
        break;
    case 13:
        if (!gPaletteFade.active)
        {
            sub_812B4B8();
            sub_8129B88();
            sub_81284BC();
            SetMainCallback2(CB2_ReturnToField);
        }
        break;
    }
}
