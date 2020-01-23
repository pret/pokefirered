#include "global.h"
#include "gflib.h"
#include "help_system.h"
#include "link.h"
#include "link_rfu.h"
#include "list_menu.h"
#include "menu.h"
#include "quest_log.h"
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
void sub_8128DA4(void);
void sub_8128E78(void);
void sub_8128AA0(void);
void sub_8128C04(void);
void sub_8128CA8(void);
void sub_8128FB8(void);
void sub_8129218(u16 a0);
bool32 sub_8129228(void);
void sub_81292D8(void);
void sub_81293AC(void);
void sub_81293D8(void);
void sub_8129560(u8 *ptr);
void sub_8129568(u8 *ptr);
void sub_81298F8(u8 taskId);
void sub_8129B14(void);
bool32 sub_8129B78(void);
void sub_8129BFC(void);
void sub_8129C34(u16 a0, u8 a1);
u8 sub_8129C8C(u8 a0);

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
            if (gMain.newKeys & SELECT_BUTTON)
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
