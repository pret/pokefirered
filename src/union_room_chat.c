#include "global.h"
#include "gflib.h"
#include "dynamic_placeholder_text_util.h"
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
#include "strings.h"
#include "task.h"
#include "union_room_chat.h"
#include "union_room_chat_display.h"
#include "data_8479668.h"
#include "constants/songs.h"

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

static EWRAM_DATA struct UnionRoomChat * gUnknown_203B0E0 = NULL;

static void sub_812845C(struct UnionRoomChat * unionRoomChat);
static void c2_081284E0(void);
static void sub_81285B4(void);
static void sub_81285CC(void);
static void sub_81285E8(u8 taskId);
static void sub_8128640(void);
static void sub_81286C4(void);
static void sub_81287B4(void);
static void sub_81288D4(void);
static void sub_8128AA0(void);
static void sub_8128C04(void);
static void sub_8128CA8(void);
static void sub_8128DA4(void);
static void sub_8128E78(void);
static void sub_8128FB8(void);
static void sub_8129218(u16 a0);
static bool32 sub_8129228(void);
static void sub_81292D8(void);
static void sub_81293AC(void);
static void sub_81293D8(void);
static bool32 sub_8129408(void);
static void sub_8129424(void);
static void sub_8129454(void);
static void sub_8129470(void);
static u8 *sub_81294C8(void);
static u8 *sub_81294EC(void);
static void sub_8129560(u8 *ptr);
static void sub_8129568(u8 *ptr);
static void sub_8129590(u8 *ptr);
static void sub_81295C0(u8 *ptr);
static void sub_81295EC(u8 *ptr);
static void sub_8129614(u8 *ptr);
static void sub_81298F8(u8 taskId);

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

static const u8 sKeyboardPageMaxRow[] =
{
    [UNION_ROOM_KB_PAGE_UPPER] = 9,
    [UNION_ROOM_KB_PAGE_LOWER] = 9,
    [UNION_ROOM_KB_PAGE_EMOJI] = 9,
    9
};

static const u8 gUnknown_845A8AC[] = {
    CHAR_SPACE, 0x16, 0x17, 0x68, 0x19, 0x1A, 0x1B, 0x1C,
    0x1D, 0x1E, CHAR_SPACE, 0x20, 0x21, 0x22, 0x23, 0x24,
    0x25, 0x26, 0x27, 0x28, 0x29, 0x15, 0x01, 0x02,
    CHAR_SPACE, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, CHAR_SPACE,
    0x0B, 0x0C, 0x0D, 0x0E, 0x0F, 0x10, 0x11, 0x12,
    0x13, 0x14, 0x2A, 0x2B, 0x2C, 0x2D, CHAR_SPACE, CHAR_SPACE,
    CHAR_SPACE, CHAR_SPACE, CHAR_SPACE, CHAR_SPACE, CHAR_SPACE, 0x35, 0x36, CHAR_SPACE,
    CHAR_SPACE, CHAR_SPACE, CHAR_SPACE, CHAR_SPACE, CHAR_SPACE, CHAR_SPACE, CHAR_SPACE, CHAR_SPACE,
    CHAR_SPACE, CHAR_SPACE, CHAR_SPACE, CHAR_SPACE, CHAR_SPACE, CHAR_SPACE, CHAR_SPACE, CHAR_SPACE,
    CHAR_SPACE, CHAR_SPACE, CHAR_SPACE, CHAR_SPACE, CHAR_SPACE, CHAR_SPACE, CHAR_SPACE, CHAR_SPACE,
    CHAR_SPACE, CHAR_SPACE, CHAR_SPACE, 0x53, 0x54, 0x55, 0x56, CHAR_SPACE,
    CHAR_SPACE, CHAR_SPACE, 0x6F, 0x5B, 0x5C, 0x5D, CHAR_SPACE, CHAR_SPACE,
    CHAR_SPACE, CHAR_SPACE, CHAR_SPACE, CHAR_SPACE, CHAR_SPACE, CHAR_SPACE, CHAR_SPACE, CHAR_SPACE,
    0x03, CHAR_SPACE, CHAR_SPACE, CHAR_SPACE, CHAR_SPACE, CHAR_SPACE, CHAR_SPACE, 0x5A,
    CHAR_SPACE, CHAR_SPACE, CHAR_SPACE, CHAR_SPACE, CHAR_SPACE, CHAR_SPACE, CHAR_SPACE, CHAR_SPACE,
    CHAR_SPACE, CHAR_SPACE, CHAR_SPACE, CHAR_SPACE, CHAR_SPACE, CHAR_SPACE, CHAR_SPACE, CHAR_SPACE,
    CHAR_SPACE, CHAR_SPACE, CHAR_SPACE, CHAR_SPACE, 0x84, 0x85, 0x86, CHAR_SPACE,
    CHAR_SPACE, CHAR_SPACE, CHAR_SPACE, CHAR_SPACE, CHAR_SPACE, CHAR_SPACE, CHAR_SPACE, CHAR_SPACE,
    CHAR_SPACE, CHAR_SPACE, CHAR_SPACE, CHAR_SPACE, CHAR_SPACE, CHAR_SPACE, CHAR_SPACE, CHAR_SPACE,
    CHAR_SPACE, CHAR_SPACE, CHAR_SPACE, CHAR_SPACE, CHAR_SPACE, CHAR_SPACE, CHAR_SPACE, CHAR_SPACE,
    0xA0, CHAR_0, CHAR_1, CHAR_2, CHAR_3, CHAR_4, CHAR_5, CHAR_6,
    CHAR_7, CHAR_8, CHAR_9, CHAR_EXCL_MARK, CHAR_QUESTION_MARK, CHAR_PERIOD, CHAR_HYPHEN, 0xAF,
    CHAR_ELLIPSIS, CHAR_DBL_QUOT_LEFT, CHAR_DBL_QUOT_RIGHT, CHAR_SGL_QUOT_LEFT, CHAR_SGL_QUOT_RIGHT, CHAR_MALE, CHAR_FEMALE, CHAR_CURRENCY,
    CHAR_COMMA, CHAR_MULT_SIGN, CHAR_SLASH, CHAR_a, CHAR_b, CHAR_c, CHAR_d, CHAR_e,
    CHAR_f, CHAR_g, CHAR_h, CHAR_i, CHAR_j, CHAR_k, CHAR_l, CHAR_m,
    CHAR_n, CHAR_o, CHAR_p, CHAR_q, CHAR_r, CHAR_s, CHAR_t, CHAR_u,
    CHAR_v, CHAR_w, CHAR_x, CHAR_y, CHAR_z, CHAR_A, CHAR_B, CHAR_C,
    CHAR_D, CHAR_E, CHAR_F, CHAR_G, CHAR_H, CHAR_I, CHAR_J, CHAR_K,
    CHAR_L, CHAR_M, CHAR_N, CHAR_O, CHAR_P, CHAR_Q, CHAR_R, CHAR_S,
    CHAR_T, CHAR_U, CHAR_V, CHAR_W, CHAR_X, CHAR_Y, CHAR_Z, 0xEF,
    CHAR_COLON, 0xF4, 0xF5, 0xF6, 0xF1, 0xF2, 0xF3, CHAR_SPACE,
    CHAR_SPACE, CHAR_SPACE, CHAR_SPACE, CHAR_SPACE, CHAR_SPACE, CHAR_SPACE, CHAR_SPACE, CHAR_SPACE
};

const u8 *const gUnionRoomKeyboardText[UNION_ROOM_KB_PAGE_COUNT][UNION_ROOM_KB_ROW_COUNT] = {
    [UNION_ROOM_KB_PAGE_UPPER] = {
        gText_UnionRoomChatKeyboard_ABCDE,
        gText_UnionRoomChatKeyboard_FGHIJ,
        gText_UnionRoomChatKeyboard_KLMNO,
        gText_UnionRoomChatKeyboard_PQRST,
        gText_UnionRoomChatKeyboard_UVWXY,
        gText_UnionRoomChatKeyboard_Z,
        gText_UnionRoomChatKeyboard_01234Upper,
        gText_UnionRoomChatKeyboard_56789Upper,
        gText_UnionRoomChatKeyboard_PunctuationUpper,
        gText_UnionRoomChatKeyboard_SymbolsUpper
    },
    [UNION_ROOM_KB_PAGE_LOWER] = {
        gText_UnionRoomChatKeyboard_abcde,
        gText_UnionRoomChatKeyboard_fghij,
        gText_UnionRoomChatKeyboard_klmno,
        gText_UnionRoomChatKeyboard_pqrst,
        gText_UnionRoomChatKeyboard_uvwxy,
        gText_UnionRoomChatKeyboard_z,
        gText_UnionRoomChatKeyboard_01234Lower,
        gText_UnionRoomChatKeyboard_56789Lower,
        gText_UnionRoomChatKeyboard_PunctuationLower,
        gText_UnionRoomChatKeyboard_SymbolsLower
    },
    [UNION_ROOM_KB_PAGE_EMOJI] = {
        gText_UnionRoomChatKeyboard_Emoji1,
        gText_UnionRoomChatKeyboard_Emoji2,
        gText_UnionRoomChatKeyboard_Emoji3,
        gText_UnionRoomChatKeyboard_Emoji4,
        gText_UnionRoomChatKeyboard_Emoji5,
        gText_UnionRoomChatKeyboard_Emoji6,
        gText_UnionRoomChatKeyboard_Emoji7,
        gText_UnionRoomChatKeyboard_Emoji8,
        gText_UnionRoomChatKeyboard_Emoji9,
        gText_UnionRoomChatKeyboard_Emoji10
    }
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

static void sub_812845C(struct UnionRoomChat * unionRoomChat)
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

static void sub_81284BC(void)
{
    DestroyTask(gUnknown_203B0E0->unkE);
    DestroyTask(gUnknown_203B0E0->unkF);
    Free(gUnknown_203B0E0);
}

static void c2_081284E0(void)
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

static void sub_81285B4(void)
{
    TransferPlttBuffer();
    LoadOam();
    ProcessSpriteCopyRequests();
    ScanlineEffect_InitHBlankDmaTransfer();
}

static void sub_81285CC(void)
{
    RunTasks();
    sub_8129BFC();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

static void sub_81285E8(u8 taskId)
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

static void sub_8128640(void)
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

static void sub_81286C4(void)
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

static void sub_81287B4(void)
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

static void sub_81288D4(void)
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

static void sub_8128AA0(void)
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

static void sub_8128C04(void)
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

static void sub_8128CA8(void)
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

static void sub_8128DA4(void)
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

static void sub_8128E78(void)
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

static void sub_8128FB8(void)
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

static void sub_8129218(u16 arg0)
{
    gUnknown_203B0E0->unk4 = arg0;
    gUnknown_203B0E0->unk6 = 0;
}

static bool32 sub_8129228(void)
{
    if (!(gMain.newAndRepeatedKeys & DPAD_UP))
    {
        if (gMain.newAndRepeatedKeys & DPAD_DOWN)
        {
            if (gUnknown_203B0E0->currentRow < sKeyboardPageMaxRow[gUnknown_203B0E0->currentPage])
                gUnknown_203B0E0->currentRow++;
            else
                gUnknown_203B0E0->currentRow = 0;

            return TRUE;
        }

        if (gUnknown_203B0E0->currentPage != UNION_ROOM_KB_PAGE_COUNT)
        {
            if (gMain.newAndRepeatedKeys & DPAD_LEFT)
            {
                if (gUnknown_203B0E0->unk11)
                    gUnknown_203B0E0->unk11--;
                else
                    gUnknown_203B0E0->unk11 = 4;
            }
            else if (gMain.newAndRepeatedKeys & DPAD_RIGHT)
            {
                if (gUnknown_203B0E0->unk11 > 3)
                    gUnknown_203B0E0->unk11 = 0;
                else
                    gUnknown_203B0E0->unk11++;
            }
            else
            {
                return FALSE;
            }

            return TRUE;
        }

        return FALSE;
    }
    else
    {
        if (gUnknown_203B0E0->currentRow)
            gUnknown_203B0E0->currentRow--;
        else
            gUnknown_203B0E0->currentRow = sKeyboardPageMaxRow[gUnknown_203B0E0->currentPage];

        return TRUE;
    }
}

static void sub_81292D8(void)
{
    int i;
    const u8 *charsStr;
    int strLength;
    u8 *str;
    u8 buffer[21];

    if (gUnknown_203B0E0->currentPage != UNION_ROOM_KB_PAGE_COUNT)
    {
        charsStr = gUnionRoomKeyboardText[gUnknown_203B0E0->currentPage][gUnknown_203B0E0->currentRow];
        for (i = 0; i < gUnknown_203B0E0->unk11; i++)
        {
            if (*charsStr == CHAR_EXTRA_EMOJI)
                charsStr++;
            charsStr++;
        }

        strLength = 1;
    }
    else
    {
        u8 *tempStr = StringCopy(buffer, gUnknown_203B0E0->unkB9[gUnknown_203B0E0->currentRow]);
        tempStr[0] = CHAR_SPACE;
        tempStr[1] = EOS;
        charsStr = buffer;
        strLength = StringLength_Multibyte(buffer);
    }

    gUnknown_203B0E0->unk14 = gUnknown_203B0E0->unk15;
    if (!charsStr)
        return;

    str = sub_81294C8();
    while (--strLength != -1 && gUnknown_203B0E0->unk15 < 15)
    {
        if (*charsStr == CHAR_EXTRA_EMOJI)
        {
            *str = *charsStr;
            charsStr++;
            str++;
        }

        *str = *charsStr;
        charsStr++;
        str++;

        gUnknown_203B0E0->unk15++;
    }

    *str = EOS;
}

static void sub_81293AC(void)
{
    gUnknown_203B0E0->unk14 = gUnknown_203B0E0->unk15;
    if (gUnknown_203B0E0->unk15)
    {
        u8 *str = sub_81294EC();
        *str = EOS;
        gUnknown_203B0E0->unk15--;
    }
}

static void sub_81293D8(void)
{
    u8 *str;
    u8 character;

    gUnknown_203B0E0->unk14 = gUnknown_203B0E0->unk15 - 1;
    str = sub_81294EC();
    if (*str != CHAR_EXTRA_EMOJI)
    {
        character = gUnknown_845A8AC[*str];
        if (character)
            *str = character;
    }
}

static bool32 sub_8129408(void)
{
    if (gUnknown_203B0E0->unk15)
        return TRUE;
    else
        return FALSE;
}

static void sub_8129424(void)
{
    u8 *src = sub_8129758();
    StringCopy(gUnknown_203B0E0->unkB9[gUnknown_203B0E0->currentRow], src);
    gUnknown_203B0E0->unk18 = 1;
}

static void sub_8129454(void)
{
    gUnknown_203B0E0->unk1A[0] = EOS;
    gUnknown_203B0E0->unk14 = 15;
    gUnknown_203B0E0->unk15 = 0;
}

static void sub_8129470(void)
{
    int i;
    for (i = 0; i < UNION_ROOM_KB_ROW_COUNT; i++)
        StringCopy(gSaveBlock1Ptr->unk3AD4[i], gUnknown_203B0E0->unkB9[i]);
}

u8 *sub_81294B0(int arg0)
{
    return gUnknown_203B0E0->unkB9[arg0];
}

// GetEndOfUnk1A
static u8 *sub_81294C8(void)
{
    u8 *str = gUnknown_203B0E0->unk1A;
    while (*str != EOS)
        str++;

    return str;
}

// GetPtrToLastCharOfUnk1A
static u8 *sub_81294EC(void)
{
    u8 *str = gUnknown_203B0E0->unk1A;
    u8 *str2 = str;
    while (*str != EOS)
    {
        str2 = str;
        if (*str == CHAR_EXTRA_EMOJI)
            str++;
        str++;
    }

    return str2;
}

static u16 sub_812951C(void)
{
    u8 *str;
    u32 i, numChars, strLength;

    strLength = StringLength_Multibyte(gUnknown_203B0E0->unk1A);
    str = gUnknown_203B0E0->unk1A;
    numChars = 0;
    if (strLength > 10)
    {
        strLength -= 10;
        for (i = 0; i < strLength; i++)
        {
            if (*str == CHAR_EXTRA_EMOJI)
                str++;

            str++;
            numChars++;
        }
    }

    return numChars;
}

static void sub_8129560(u8 *arg0)
{
    arg0[0] = 0;
}

static void sub_8129568(u8 *arg0)
{
    arg0[0] = 2;
    StringCopy(&arg0[1], gSaveBlock2Ptr->playerName);
    arg0[1 + (PLAYER_NAME_LENGTH + 1)] = gUnknown_203B0E0->unk13;
}

static void sub_8129590(u8 *arg0)
{
    arg0[0] = 1;
    StringCopy(&arg0[1], gSaveBlock2Ptr->playerName);
    StringCopy(&arg0[1 + (PLAYER_NAME_LENGTH + 1)], gUnknown_203B0E0->unk1A);
}

static void sub_81295C0(u8 *arg0)
{
    arg0[0] = 3;
    StringCopy(&arg0[1], gSaveBlock2Ptr->playerName);
    arg0[1 + (PLAYER_NAME_LENGTH + 1)] = gUnknown_203B0E0->unk13;
    sub_80FB9D0();
}

static void sub_81295EC(u8 *arg0)
{
    arg0[0] = 4;
    StringCopy(&arg0[1], gSaveBlock2Ptr->playerName);
    arg0[1 + (PLAYER_NAME_LENGTH + 1)] = gUnknown_203B0E0->unk13;
}

static void sub_8129614(u8 *arg0)
{
    arg0[0] = 5;
    StringCopy(&arg0[1], gSaveBlock2Ptr->playerName);
    arg0[1 + (PLAYER_NAME_LENGTH + 1)] = gUnknown_203B0E0->unk13;
}

static bool32 sub_812963C(u8 *arg0, u8 *arg1)
{
    u8 *tempStr;
    u8 var0 = *arg1;
    u8 *str = arg1 + 1;
    arg1 = str;
    arg1 += 8;

    switch (var0)
    {
    case 2:
        if (gUnknown_203B0E0->unk13 != str[8])
        {
            DynamicPlaceholderTextUtil_Reset();
            DynamicPlaceholderTextUtil_SetPlaceholderPtr(0, str);
            DynamicPlaceholderTextUtil_ExpandPlaceholders(arg0, gText_F700JoinedChat);
            return TRUE;
        }
        break;
    case 1:
        tempStr = StringCopy(arg0, str);
        *(tempStr++) = EXT_CTRL_CODE_BEGIN;
        *(tempStr++) = EXT_CTRL_CODE_CLEAR_TO;
        *(tempStr++) = 42;
        *(tempStr++) = CHAR_COLON;
        StringCopy(tempStr, arg1);
        return TRUE;
    case 5:
        StringCopy(gUnknown_203B0E0->unk79, str);
        // fall through
    case 3:
        if (gUnknown_203B0E0->unk13 != *arg1)
        {
            DynamicPlaceholderTextUtil_Reset();
            DynamicPlaceholderTextUtil_SetPlaceholderPtr(0, str);
            DynamicPlaceholderTextUtil_ExpandPlaceholders(arg0, gText_F700LeftChat);
            return TRUE;
        }
        break;
    }

    return FALSE;
}

u8 GetCurrentKeyboardPage(void)
{
    return gUnknown_203B0E0->currentPage;
}

void sub_8129700(u8 *arg0, u8 *arg1)
{
    *arg0 = gUnknown_203B0E0->unk11;
    *arg1 = gUnknown_203B0E0->currentRow;
}

u8 *sub_8129714(void)
{
    return gUnknown_203B0E0->unk1A;
}

int sub_8129720(void)
{
    u8 *str = sub_8129714();
    return StringLength_Multibyte(str);
}

void sub_8129730(u32 *arg0, u32 *arg1)
{
    int diff = gUnknown_203B0E0->unk15 - gUnknown_203B0E0->unk14;
    if (diff < 0)
    {
        diff *= -1;
        *arg0 = gUnknown_203B0E0->unk15;
    }
    else
    {
        *arg0 = gUnknown_203B0E0->unk14;
    }

    *arg1 = diff;
}

u8 *sub_8129758(void)
{
    int i;
    u16 numChars = sub_812951C();
    u8 *str = gUnknown_203B0E0->unk1A;
    for (i = 0; i < numChars; i++)
    {
        if (*str == CHAR_EXTRA_EMOJI)
            str++;

        str++;
    }

    return str;
}

u16 sub_8129788(void)
{
    u16 count;
    u32 i;
    u16 numChars = sub_812951C();
    u8 *str = gUnknown_203B0E0->unk1A;
    for (count = 0, i = 0; i < numChars; count++, i++)
    {
        if (*str == CHAR_EXTRA_EMOJI)
            str++;

        str++;
    }

    return count;
}

u8 *sub_81297C4(void)
{
    return gUnknown_203B0E0->unk39;
}

u16 sub_81297D0(void)
{
    return gUnknown_203B0E0->unk16;
}

int sub_81297DC(void)
{
    return gUnknown_203B0E0->unk15;
}

int sub_81297E8(void)
{
    u8 *str = sub_81294EC();
    u32 character = *str;
    if (character > 0xFF || gUnknown_845A8AC[character] == character || gUnknown_845A8AC[character] == 0)
        return 3;
    else
        return 0;
}

u8 *sub_8129814(void)
{
    return gUnknown_203B0E0->unk79;
}

void copy_strings_to_sav1(void)
{
    StringCopy(gSaveBlock1Ptr->unk3AD4[0], gText_Hello);
    StringCopy(gSaveBlock1Ptr->unk3AD4[1], gText_Pokemon2);
    StringCopy(gSaveBlock1Ptr->unk3AD4[2], gText_Trade);
    StringCopy(gSaveBlock1Ptr->unk3AD4[3], gText_Battle);
    StringCopy(gSaveBlock1Ptr->unk3AD4[4], gText_Lets);
    StringCopy(gSaveBlock1Ptr->unk3AD4[5], gText_Ok);
    StringCopy(gSaveBlock1Ptr->unk3AD4[6], gText_Sorry);
    StringCopy(gSaveBlock1Ptr->unk3AD4[7], gText_YaySmileEmoji);
    StringCopy(gSaveBlock1Ptr->unk3AD4[8], gText_ThankYou);
    StringCopy(gSaveBlock1Ptr->unk3AD4[9], gText_ByeBye);
}

static void sub_81298F8(u8 taskId)
{
    u8 *buffer;
    s16 *data = gTasks[taskId].data;

    switch (data[0])
    {
    case 0:
        if (!gReceivedRemoteLinkPlayers)
        {
            DestroyTask(taskId);
            return;
        }

        data[0] = 1;
        // fall through
    case 1:
        data[4] = GetLinkPlayerCount();
        if (gUnknown_203B0E0->unkD != data[4])
        {
            data[0] = 2;
            gUnknown_203B0E0->unkD = data[4];
            return;
        }

        data[3] = GetBlockReceivedStatus();
        if (!data[3] && sub_80FBA1C())
            return;

        data[1] = 0;
        data[0] = 3;
        // fall through
    case 3:
        for (; data[1] < 5 && ((data[3] >> data[1]) & 1) == 0; data[1]++)
            ;

        if (data[1] == 5)
        {
            data[0] = 1;
            return;
        }

        data[2] = data[1];
        ResetBlockReceivedFlag(data[2]);
        buffer = (u8 *)gBlockRecvBuffer[data[1]];
        switch (buffer[0])
        {
        default:
        case 1: data[5] = 3; break;
        case 2: data[5] = 3; break;
        case 3: data[5] = 4; break;
        case 4: data[5] = 5; break;
        case 5: data[5] = 6; break;
        }

        if (sub_812963C(gUnknown_203B0E0->unk39, (u8 *)gBlockRecvBuffer[data[1]]))
        {
            gUnknown_203B0E0->unk16 = data[1];
            sub_8129C34(12, 2);
            data[0] = 7;
        }
        else
        {
            data[0] = data[5];
        }

        data[1]++;
        break;
    case 7:
        if (!sub_8129C8C(2))
            data[0] = data[5];
        break;
    case 4:
        if (!gUnknown_203B0E0->unk13 && data[2])
        {
            if (GetLinkPlayerCount() == 2)
            {
                sub_80FA4A8();
                gUnknown_203B0E0->unk17 = 1;
                DestroyTask(taskId);
                return;
            }

            sub_80FBD6C(data[2]);
        }

        data[0] = 3;
        break;
    case 5:
        if (gUnknown_203B0E0->unk13)
            gUnknown_203B0E0->unk17 = 2;

        DestroyTask(taskId);
        break;
    case 6:
        gUnknown_203B0E0->unk17 = 3;
        DestroyTask(taskId);
        break;
    case 2:
        if (!sub_80FBA1C())
        {
            if (!gUnknown_203B0E0->unk13)
                sub_80FB030(gUnknown_203B0E0->unkD);

            data[0] = 1;
        }
        break;
    }
}
