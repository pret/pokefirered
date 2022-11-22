#include "global.h"
#include "gflib.h"
#include "dynamic_placeholder_text_util.h"
#include "help_system.h"
#include "link.h"
#include "link_rfu.h"
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
#include "keyboard_text.h"
#include "constants/songs.h"

#define MESSAGE_BUFFER_NCHAR 15

#define CHAT_MESSAGE_0 0
#define CHAT_MESSAGE_CHAT 1
#define CHAT_MESSAGE_JOIN 2
#define CHAT_MESSAGE_LEAVE 3
#define CHAT_MESSAGE_DROP 4
#define CHAT_MESSAGE_DISBAND 5

#define CHATENTRYROUTINE_JOIN 0
#define CHATNETRYROUTINE_HANDLE_INPUT 1
#define CHATENTRYROUTINE_SWITCH 2
#define CHATENTRYROUTINE_ASKQUITCHATTING 3
#define CHATENTRYROUTINE_SEND 4
#define CHATENTRYROUTINE_REGISTER 5
#define CHATENTRYROUTINE_EXITCHAT 6
#define CHATENTRYROUTINE_DROP 7
#define CHATENTRYROUTINE_DISBANDED 8
#define CHATENTRYROUTINE_SAVEANDEXIT 9

#define CHATEXIT_NONE 0
#define CHATEXIT_LEADER_LAST 1
#define CHATEXIT_DROPPED 2
#define CHATEXIT_DISBANDED 3

struct UnionRoomChat
{
    u8 filler0[0x4];
    u16 routineNo;
    u16 routineState;
    u8 filler8[0x2];
    u16 exitDelayTimer;
    u8 fillerC[0x1];
    u8 linkPlayerCount;
    u8 handleInputTask;
    u8 receiveMessagesTask;
    u8 currentPage;
    u8 currentCol;
    u8 currentRow;
    u8 multiplayerId;
    u8 lastBufferCursorPos;
    u8 bufferCursorPos;
    u8 receivedPlayerIndex;
    u8 exitType;
    bool8 changedRegisteredTexts;
    u8 afterSaveTimer;
    u8 messageEntryBuffer[2 * MESSAGE_BUFFER_NCHAR + 1];
    u8 receivedMessage[0x40];
    u8 hostName[0x40];
    u8 registeredTexts[UNION_ROOM_KB_ROW_COUNT][21];
    u8 filler18B[0x5];
    u8 sendMessageBuffer[0x28];
};

static EWRAM_DATA struct UnionRoomChat * sWork = NULL;

static void InitChatWork(struct UnionRoomChat * unionRoomChat);
static void CB2_LoadInterface(void);
static void VBlankCB_UnionRoomChatMain(void);
static void CB2_UnionRoomChatMain(void);
static void Task_HandlePlayerInput(u8 taskId);
static void ChatEntryRoutine_Join(void);
static void ChatEntryRoutine_HandleInput(void);
static void ChatEntryRoutine_Switch(void);
static void ChatEntryRoutine_AskQuitChatting(void);
static void ChatEntryRoutine_ExitChat(void);
static void ChatEntryRoutine_Drop(void);
static void ChatEntryRoutine_Disbanded(void);
static void ChatEntryRoutine_SendMessage(void);
static void ChatEntryRoutine_Register(void);
static void ChatEntryRoutine_SaveAndExit(void);
static void GoToRoutine(u16 routineNo);
static bool32 TypeChatMessage_HandleDPad(void);
static void AppendCharacterToChatMessageBuffer(void);
static void DeleteLastCharacterOfChatMessageBuffer(void);
static void ToggleCaseOfLastCharacterInChatMessageBuffer(void);
static bool32 ChatMsgHasAtLeastOneCharcter(void);
static void RegisterTextAtRow(void);
static void ResetMessageEntryBuffer(void);
static void SaveRegisteredTextsToSB1(void);
static u8 *GetEndOfUnk1A(void);
static u8 *GetPtrToLastCharOfUnk1A(void);
static void PrepareSendBuffer_Null(u8 *ptr);
static void PrepareSendBuffer_Join(u8 *ptr);
static void PrepareSendBuffer_Chat(u8 *ptr);
static void PrepareSendBuffer_Leave(u8 *ptr);
static void PrepareSendBuffer_Drop(u8 *ptr);
static void PrepareSendBuffer_Disband(u8 *ptr);
static void Task_ReceiveChatMessage(u8 taskId);

static void (*const sChatEntryRoutines[])(void) = {
    [CHATENTRYROUTINE_JOIN] = ChatEntryRoutine_Join,
    [CHATNETRYROUTINE_HANDLE_INPUT] = ChatEntryRoutine_HandleInput,
    [CHATENTRYROUTINE_SWITCH] = ChatEntryRoutine_Switch,
    [CHATENTRYROUTINE_ASKQUITCHATTING] = ChatEntryRoutine_AskQuitChatting,
    [CHATENTRYROUTINE_SEND] = ChatEntryRoutine_SendMessage,
    [CHATENTRYROUTINE_REGISTER] = ChatEntryRoutine_Register,
    [CHATENTRYROUTINE_EXITCHAT] = ChatEntryRoutine_ExitChat,
    [CHATENTRYROUTINE_DROP] = ChatEntryRoutine_Drop,
    [CHATENTRYROUTINE_DISBANDED] = ChatEntryRoutine_Disbanded,
    [CHATENTRYROUTINE_SAVEANDEXIT] = ChatEntryRoutine_SaveAndExit
};

static const u8 sKeyboardPageMaxRow[] =
{
    [UNION_ROOM_KB_PAGE_UPPER] = 9,
    [UNION_ROOM_KB_PAGE_LOWER] = 9,
    [UNION_ROOM_KB_PAGE_EMOJI] = 9,
    9
};

static const u8 sCaseToggleTable[256] = {
    [CHAR_A] = CHAR_a,
    [CHAR_B] = CHAR_b,
    [CHAR_C] = CHAR_c,
    [CHAR_D] = CHAR_d,
    [CHAR_E] = CHAR_e,
    [CHAR_F] = CHAR_f,
    [CHAR_G] = CHAR_g,
    [CHAR_H] = CHAR_h,
    [CHAR_I] = CHAR_i,
    [CHAR_J] = CHAR_j,
    [CHAR_K] = CHAR_k,
    [CHAR_L] = CHAR_l,
    [CHAR_M] = CHAR_m,
    [CHAR_N] = CHAR_n,
    [CHAR_O] = CHAR_o,
    [CHAR_P] = CHAR_p,
    [CHAR_Q] = CHAR_q,
    [CHAR_R] = CHAR_r,
    [CHAR_S] = CHAR_s,
    [CHAR_T] = CHAR_t,
    [CHAR_U] = CHAR_u,
    [CHAR_V] = CHAR_v,
    [CHAR_W] = CHAR_w,
    [CHAR_X] = CHAR_x,
    [CHAR_Y] = CHAR_y,
    [CHAR_Z] = CHAR_z,
    [CHAR_a] = CHAR_A,
    [CHAR_b] = CHAR_B,
    [CHAR_c] = CHAR_C,
    [CHAR_d] = CHAR_D,
    [CHAR_e] = CHAR_E,
    [CHAR_f] = CHAR_F,
    [CHAR_g] = CHAR_G,
    [CHAR_h] = CHAR_H,
    [CHAR_i] = CHAR_I,
    [CHAR_j] = CHAR_J,
    [CHAR_k] = CHAR_K,
    [CHAR_l] = CHAR_L,
    [CHAR_m] = CHAR_M,
    [CHAR_n] = CHAR_N,
    [CHAR_o] = CHAR_O,
    [CHAR_p] = CHAR_P,
    [CHAR_q] = CHAR_Q,
    [CHAR_r] = CHAR_R,
    [CHAR_s] = CHAR_S,
    [CHAR_t] = CHAR_T,
    [CHAR_u] = CHAR_U,
    [CHAR_v] = CHAR_V,
    [CHAR_w] = CHAR_W,
    [CHAR_x] = CHAR_X,
    [CHAR_y] = CHAR_Y,
    [CHAR_z] = CHAR_Z,
    [CHAR_A_GRAVE] = CHAR_a_GRAVE,
    [CHAR_A_ACUTE] = CHAR_a_ACUTE,
    [CHAR_A_CIRCUMFLEX] = CHAR_a_CIRCUMFLEX,
    [CHAR_A_DIAERESIS] = CHAR_a_DIAERESIS,
    [CHAR_C_CEDILLA] = CHAR_c_CEDILLA,
    [CHAR_E_GRAVE] = CHAR_e_GRAVE,
    [CHAR_E_ACUTE] = CHAR_e_ACUTE,
    [CHAR_E_CIRCUMFLEX] = CHAR_e_CIRCUMFLEX,
    [CHAR_E_DIAERESIS] = CHAR_e_DIAERESIS,
    [CHAR_I_GRAVE] = CHAR_i_GRAVE,
    [CHAR_I_ACUTE] = CHAR_i_ACUTE,
    [CHAR_I_CIRCUMFLEX] = CHAR_i_CIRCUMFLEX,
    [CHAR_I_DIAERESIS] = CHAR_i_DIAERESIS,
    [CHAR_O_GRAVE] = CHAR_o_GRAVE,
    [CHAR_O_ACUTE] = CHAR_o_ACUTE,
    [CHAR_O_CIRCUMFLEX] = CHAR_o_CIRCUMFLEX,
    [CHAR_O_DIAERESIS] = CHAR_o_DIAERESIS,
    [CHAR_OE] = CHAR_oe,
    [CHAR_U_GRAVE] = CHAR_u_GRAVE,
    [CHAR_U_ACUTE] = CHAR_u_ACUTE,
    [CHAR_U_CIRCUMFLEX] = CHAR_u_CIRCUMFLEX,
    [CHAR_U_DIAERESIS] = CHAR_u_DIAERESIS,
    [CHAR_N_TILDE] = CHAR_n_TILDE,
    [CHAR_ESZETT] = CHAR_ESZETT,
    [CHAR_a_GRAVE] = CHAR_A_GRAVE,
    [CHAR_a_ACUTE] = CHAR_A_ACUTE,
    [CHAR_a_CIRCUMFLEX] = CHAR_A_CIRCUMFLEX,
    [CHAR_a_DIAERESIS] = CHAR_A_DIAERESIS,
    [CHAR_c_CEDILLA] = CHAR_C_CEDILLA,
    [CHAR_e_GRAVE] = CHAR_E_GRAVE,
    [CHAR_e_ACUTE] = CHAR_E_ACUTE,
    [CHAR_e_CIRCUMFLEX] = CHAR_E_CIRCUMFLEX,
    [CHAR_e_DIAERESIS] = CHAR_E_DIAERESIS,
    [CHAR_i_GRAVE] = CHAR_I_GRAVE,
    [CHAR_i_ACUTE] = CHAR_I_ACUTE,
    [CHAR_i_CIRCUMFLEX] = CHAR_I_CIRCUMFLEX,
    [CHAR_i_DIAERESIS] = CHAR_I_DIAERESIS,
    [CHAR_o_GRAVE] = CHAR_O_GRAVE,
    [CHAR_o_ACUTE] = CHAR_O_ACUTE,
    [CHAR_o_CIRCUMFLEX] = CHAR_O_CIRCUMFLEX,
    [CHAR_o_DIAERESIS] = CHAR_O_DIAERESIS,
    [CHAR_oe] = CHAR_OE,
    [CHAR_u_GRAVE] = CHAR_U_GRAVE,
    [CHAR_u_ACUTE] = CHAR_U_ACUTE,
    [CHAR_u_CIRCUMFLEX] = CHAR_U_CIRCUMFLEX,
    [CHAR_u_DIAERESIS] = CHAR_U_DIAERESIS,
    [CHAR_n_TILDE] = CHAR_N_TILDE,
    [CHAR_0] = CHAR_0,
    [CHAR_1] = CHAR_1,
    [CHAR_2] = CHAR_2,
    [CHAR_3] = CHAR_3,
    [CHAR_4] = CHAR_4,
    [CHAR_5] = CHAR_5,
    [CHAR_6] = CHAR_6,
    [CHAR_7] = CHAR_7,
    [CHAR_8] = CHAR_8,
    [CHAR_9] = CHAR_9,
    [CHAR_PK] = CHAR_PK,
    [CHAR_MN] = CHAR_MN,
    [CHAR_PO] = CHAR_PO,
    [CHAR_KE] = CHAR_KE,
    [CHAR_SUPER_E]  = CHAR_SUPER_E,
    [CHAR_SUPER_ER] = CHAR_SUPER_ER,
    [CHAR_SUPER_RE] = CHAR_SUPER_RE,
    [CHAR_PERIOD] = CHAR_PERIOD,
    [CHAR_COMMA] = CHAR_COMMA,
    [CHAR_COLON] = CHAR_COLON,
    [CHAR_SEMICOLON] = CHAR_SEMICOLON,
    [CHAR_EXCL_MARK] = CHAR_EXCL_MARK,
    [CHAR_QUESTION_MARK] = CHAR_QUESTION_MARK,
    [CHAR_HYPHEN] = CHAR_HYPHEN,
    [CHAR_SLASH] = CHAR_SLASH,
    [CHAR_ELLIPSIS] = CHAR_ELLIPSIS,
    [CHAR_LEFT_PAREN] = CHAR_LEFT_PAREN,
    [CHAR_RIGHT_PAREN] = CHAR_RIGHT_PAREN,
    [CHAR_AMPERSAND] = CHAR_AMPERSAND,
    [CHAR_DBL_QUOTE_LEFT] = CHAR_DBL_QUOTE_LEFT,
    [CHAR_DBL_QUOTE_RIGHT] = CHAR_DBL_QUOTE_RIGHT,
    [CHAR_SGL_QUOTE_LEFT] = CHAR_SGL_QUOTE_LEFT,
    [CHAR_SGL_QUOTE_RIGHT] = CHAR_SGL_QUOTE_RIGHT,
    [CHAR_MASCULINE_ORDINAL] = CHAR_MASCULINE_ORDINAL,
    [CHAR_FEMININE_ORDINAL] = CHAR_FEMININE_ORDINAL,
    [CHAR_BULLET] = CHAR_BULLET,
    [CHAR_EQUALS] = CHAR_EQUALS,
    [CHAR_MULT_SIGN] = CHAR_MULT_SIGN,
    [CHAR_PERCENT] = CHAR_PERCENT,
    [CHAR_LESS_THAN] = CHAR_LESS_THAN,
    [CHAR_GREATER_THAN] = CHAR_GREATER_THAN,
    [CHAR_MALE] = CHAR_MALE,
    [CHAR_FEMALE] = CHAR_FEMALE,
    [CHAR_CURRENCY] = CHAR_CURRENCY,
    [CHAR_BLACK_TRIANGLE] = CHAR_BLACK_TRIANGLE,
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

void EnterUnionRoomChat(void)
{
    sWork = Alloc(sizeof(struct UnionRoomChat));
    InitChatWork(sWork);
    gKeyRepeatStartDelay = 20;
    HelpSystem_DisableToggleWithRButton();
    SetVBlankCallback(NULL);
    SetMainCallback2(CB2_LoadInterface);
}

static void InitChatWork(struct UnionRoomChat * unionRoomChat)
{
    int i;

    unionRoomChat->routineNo = CHATENTRYROUTINE_JOIN;
    unionRoomChat->routineState = 0;
    unionRoomChat->currentPage = UNION_ROOM_KB_PAGE_UPPER;
    unionRoomChat->currentCol = 0;
    unionRoomChat->currentRow = 0;
    unionRoomChat->lastBufferCursorPos = 0;
    unionRoomChat->bufferCursorPos = 0;
    unionRoomChat->receivedPlayerIndex = 0;
    unionRoomChat->messageEntryBuffer[0] = EOS;
    unionRoomChat->linkPlayerCount = GetLinkPlayerCount();
    unionRoomChat->multiplayerId = GetMultiplayerId();
    unionRoomChat->exitType = 0;
    unionRoomChat->changedRegisteredTexts = FALSE;
    PrepareSendBuffer_Null(unionRoomChat->sendMessageBuffer);
    for (i = 0; i < UNION_ROOM_KB_ROW_COUNT; i++)
        StringCopy(unionRoomChat->registeredTexts[i], gSaveBlock1Ptr->registeredTexts[i]);
}

static void FreeChatWork(void)
{
    DestroyTask(sWork->handleInputTask);
    DestroyTask(sWork->receiveMessagesTask);
    Free(sWork);
}

static void CB2_LoadInterface(void)
{
    switch (gMain.state)
    {
    case 0:
        ResetTasks();
        ResetSpriteData();
        FreeAllSpritePalettes();
        UnionRoomChat_TryAllocGraphicsWork();
        gMain.state++;
        break;
    case 1:
        UnionRoomChat_RunDisplaySubtasks();
        if (!UnionRoomChat_RunDisplaySubtask0())
        {
            BlendPalettes(PALETTES_ALL, 16, RGB_BLACK);
            BeginNormalPaletteFade(PALETTES_ALL, -1, 16, 0, RGB_BLACK);
            SetVBlankCallback(VBlankCB_UnionRoomChatMain);
            gMain.state++;
        }
        break;
    case 2:
        UpdatePaletteFade();
        if (!gPaletteFade.active)
        {
            SetMainCallback2(CB2_UnionRoomChatMain);
            SetQuestLogEvent(QL_EVENT_USED_UNION_ROOM_CHAT, NULL);
            sWork->handleInputTask = CreateTask(Task_HandlePlayerInput, 8);
            sWork->receiveMessagesTask = CreateTask(Task_ReceiveChatMessage, 7);
            LoadWirelessStatusIndicatorSpriteGfx();
            CreateWirelessStatusIndicatorSprite(232, 150);
        }
        break;
    }
}

static void VBlankCB_UnionRoomChatMain(void)
{
    TransferPlttBuffer();
    LoadOam();
    ProcessSpriteCopyRequests();
    ScanlineEffect_InitHBlankDmaTransfer();
}

static void CB2_UnionRoomChatMain(void)
{
    RunTasks();
    UnionRoomChat_RunDisplaySubtasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

static void Task_HandlePlayerInput(u8 taskId)
{
    switch (sWork->exitType)
    {
    case CHATEXIT_LEADER_LAST:
        GoToRoutine(CHATENTRYROUTINE_EXITCHAT);
        sWork->exitType = CHATEXIT_NONE;
        break;
    case CHATEXIT_DROPPED:
        GoToRoutine(CHATENTRYROUTINE_DROP);
        sWork->exitType = CHATEXIT_NONE;
        break;
    case CHATEXIT_DISBANDED:
        GoToRoutine(CHATENTRYROUTINE_DISBANDED);
        sWork->exitType = CHATEXIT_NONE;
        break;
    }

    sChatEntryRoutines[sWork->routineNo]();
}

static void ChatEntryRoutine_Join(void)
{
    switch (sWork->routineState)
    {
    case 0:
        PrepareSendBuffer_Join(sWork->sendMessageBuffer);
        sWork->routineState++;
        // fall through
    case 1:
        if (IsLinkTaskFinished() && !Rfu_IsPlayerExchangeActive())
        {
            if (SendBlock(0, sWork->sendMessageBuffer, sizeof(sWork->sendMessageBuffer)))
                sWork->routineState++;
        }
        break;
    case 2:
        if (IsLinkTaskFinished())
            GoToRoutine(CHATNETRYROUTINE_HANDLE_INPUT);
        break;
    }
}

static void ChatEntryRoutine_HandleInput(void)
{
    bool8 var0, var1;

    switch (sWork->routineState)
    {
    case 0:
        if (JOY_NEW(START_BUTTON))
        {
            if (sWork->bufferCursorPos)
                GoToRoutine(CHATENTRYROUTINE_SEND);
        }
        else if (JOY_NEW(SELECT_BUTTON))
        {
            GoToRoutine(CHATENTRYROUTINE_SWITCH);
        }
        else if (JOY_REPT(B_BUTTON))
        {
            if (sWork->bufferCursorPos)
            {
                DeleteLastCharacterOfChatMessageBuffer();
                UnionRoomChat_StartDisplaySubtask(CHATDISPLAYROUTINE_PRINTMSG, 0);
                sWork->routineState = 1;
            }
            else
            {
                GoToRoutine(CHATENTRYROUTINE_ASKQUITCHATTING);
            }
        }
        else if (JOY_NEW(A_BUTTON))
        {
            AppendCharacterToChatMessageBuffer();
            UnionRoomChat_StartDisplaySubtask(CHATDISPLAYROUTINE_PRINTMSG, 0);
            UnionRoomChat_StartDisplaySubtask(CHATDISPLAYROUTINE_CURSORBLINK, 1);
            sWork->routineState = 1;
        }
        else if (JOY_NEW(R_BUTTON))
        {
            if (sWork->currentPage != UNION_ROOM_KB_PAGE_COUNT)
            {
                ToggleCaseOfLastCharacterInChatMessageBuffer();
                UnionRoomChat_StartDisplaySubtask(CHATDISPLAYROUTINE_PRINTMSG, 0);
                sWork->routineState = 1;
            }
            else
            {
                GoToRoutine(CHATENTRYROUTINE_REGISTER);
            }
        }
        else if (TypeChatMessage_HandleDPad())
        {
            UnionRoomChat_StartDisplaySubtask(CHATDISPLAYROUTINE_MOVEKBCURSOR, 0);
            sWork->routineState = 1;
        }
        break;
    case 1:
        var0 = RunDisplaySubtask(0);
        var1 = RunDisplaySubtask(1);
        if (!var0 && !var1)
            sWork->routineState = 0;
        break;
    }
}

static void ChatEntryRoutine_Switch(void)
{
    s16 input;
    bool32 shouldSwitchPages;

    switch (sWork->routineState)
    {
    case 0:
        UnionRoomChat_StartDisplaySubtask(CHATDISPLAYROUTINE_SHOWKBSWAPMENU, 0);
        sWork->routineState++;
        break;
    case 1:
        if (!RunDisplaySubtask(0))
            sWork->routineState++;
        break;
    case 2:
        input = Menu_ProcessInput();
        switch (input)
        {
        default:
            UnionRoomChat_StartDisplaySubtask(CHATDISPLAYROUTINE_HIDEKBSWAPMENU, 0);
            shouldSwitchPages = TRUE;
            if (sWork->currentPage == input || input > UNION_ROOM_KB_PAGE_COUNT)
                shouldSwitchPages = FALSE;
            break;
        case MENU_NOTHING_CHOSEN:
            if (JOY_NEW(SELECT_BUTTON))
            {
                PlaySE(SE_SELECT);
                Menu_MoveCursor(1);
            }
            return;
        case MENU_B_PRESSED:
            UnionRoomChat_StartDisplaySubtask(CHATDISPLAYROUTINE_HIDEKBSWAPMENU, 0);
            sWork->routineState = 3;
            return;
        }

        if (!shouldSwitchPages)
        {
            sWork->routineState = 3;
            return;
        }

        sWork->currentCol = 0;
        sWork->currentRow = 0;
        UnionRoomChat_StartDisplaySubtask(CHATDISPLAYROUTINE_SWITCHPAGES, 1);
        sWork->currentPage = input;
        sWork->routineState = 4;
        break;
    case 3:
        // Wait Return To Prev Page
        if (!RunDisplaySubtask(0))
            GoToRoutine(CHATNETRYROUTINE_HANDLE_INPUT);
        break;
    case 4:
        // Wait Page Switch
        if (!RunDisplaySubtask(0) && !RunDisplaySubtask(1))
            GoToRoutine(CHATNETRYROUTINE_HANDLE_INPUT);
        break;
    }
}

static void ChatEntryRoutine_AskQuitChatting(void)
{
    s8 input;

    switch (sWork->routineState)
    {
    case 0:
        UnionRoomChat_StartDisplaySubtask(CHATDISPLAYROUTINE_SHOWQUITCHATTINGDIALOG, 0);
        sWork->routineState = 1;
        break;
    case 1:
        if (!RunDisplaySubtask(0))
            sWork->routineState = 2;
        break;
    case 2:
        input = UnionRoomChat_ProcessInput();
        switch (input)
        {
        case -1:
        case 1:
            UnionRoomChat_StartDisplaySubtask(CHATDISPLAYROUTINE_DESTROYSTDMSGANDYESNO, 0);
            sWork->routineState = 3;
            break;
        case 0:
            if (sWork->multiplayerId == 0)
            {
                PrepareSendBuffer_Disband(sWork->sendMessageBuffer);
                UnionRoomChat_StartDisplaySubtask(CHATDISPLAYROUTINE_DESTROYSTDMSGANDYESNO, 0);
                sWork->routineState = 9;
            }
            else
            {
                PrepareSendBuffer_Leave(sWork->sendMessageBuffer);
                sWork->routineState = 4;
            }
            break;
        }
        break;
    case 3:
        if (!RunDisplaySubtask(0))
            GoToRoutine(CHATNETRYROUTINE_HANDLE_INPUT);
        break;
    case 9:
        if (!RunDisplaySubtask(0))
        {
            UnionRoomChat_StartDisplaySubtask(CHATDISPLAYROUTINE_SHOWCONFIRMLEADERLEAVEDIALOG, 0);
            sWork->routineState = 10;
        }
        break;
    case 10:
        if (!RunDisplaySubtask(0))
            sWork->routineState = 8;
        break;
    case 8:
        input = UnionRoomChat_ProcessInput();
        switch (input)
        {
        case -1:
        case 1:
            UnionRoomChat_StartDisplaySubtask(CHATDISPLAYROUTINE_DESTROYSTDMSGANDYESNO, 0);
            sWork->routineState = 3;
            break;
        case 0:
            Rfu_StopPartnerSearch();
            PrepareSendBuffer_Disband(sWork->sendMessageBuffer);
            sWork->routineState = 4;
            break;
        }
        break;
    case 4:
        if (IsLinkTaskFinished() && !Rfu_IsPlayerExchangeActive() && SendBlock(0, sWork->sendMessageBuffer, sizeof(sWork->sendMessageBuffer)))
        {
            if (sWork->multiplayerId == 0)
                sWork->routineState = 6;
            else
                sWork->routineState = 5;
        }
        break;
    case 5:
        if (!gReceivedRemoteLinkPlayers)
        {
            GoToRoutine(CHATENTRYROUTINE_SAVEANDEXIT);
        }
        break;
    }
}

static void ChatEntryRoutine_ExitChat(void)
{
    switch (sWork->routineState)
    {
    case 0:
        if (!FuncIsActiveTask(Task_ReceiveChatMessage))
        {
            UnionRoomChat_StartDisplaySubtask(CHATDISPLAYROUTINE_DESTROYSTDMSGANDYESNO, 0);
            sWork->routineState++;
        }
        break;
    case 1:
        if (!RunDisplaySubtask(0))
        {
            UnionRoomChat_StartDisplaySubtask(CHATDISPLAYROUTINE_PRINTEXITINGCHAT, 0);
            sWork->routineState++;
        }
        break;
    case 2:
        if (!RunDisplaySubtask(0))
        {
            PrepareSendBuffer_Drop(sWork->sendMessageBuffer);
            sWork->routineState++;
        }
        break;
    case 3:
        if (IsLinkTaskFinished() && !Rfu_IsPlayerExchangeActive() && SendBlock(0, sWork->sendMessageBuffer, sizeof(sWork->sendMessageBuffer)))
            sWork->routineState++;
        break;
    case 4:
        if ((GetBlockReceivedStatus() & 1) && !Rfu_IsPlayerExchangeActive())
            sWork->routineState++;
        break;
    case 5:
        if (IsLinkTaskFinished() && !Rfu_IsPlayerExchangeActive())
        {
            SetCloseLinkCallback();
            sWork->exitDelayTimer = 0;
            sWork->routineState++;
        }
        break;
    case 6:
        if (sWork->exitDelayTimer < 150)
            sWork->exitDelayTimer++;

        if (!gReceivedRemoteLinkPlayers)
            sWork->routineState++;
        break;
    case 7:
        if (sWork->exitDelayTimer >= 150)
            GoToRoutine(CHATENTRYROUTINE_SAVEANDEXIT);
        else
            sWork->exitDelayTimer++;
        break;
    }
}

static void ChatEntryRoutine_Drop(void)
{
    switch (sWork->routineState)
    {
    case 0:
        if (!FuncIsActiveTask(Task_ReceiveChatMessage))
        {
            UnionRoomChat_StartDisplaySubtask(CHATDISPLAYROUTINE_DESTROYSTDMSGANDYESNO, 0);
            sWork->routineState++;
        }
        break;
    case 1:
        if (!RunDisplaySubtask(0) && IsLinkTaskFinished() && !Rfu_IsPlayerExchangeActive())
        {
            SetCloseLinkCallback();
            sWork->exitDelayTimer = 0;
            sWork->routineState++;
        }
        break;
    case 2:
        if (sWork->exitDelayTimer < 150)
            sWork->exitDelayTimer++;

        if (!gReceivedRemoteLinkPlayers)
            sWork->routineState++;
        break;
    case 3:
        if (sWork->exitDelayTimer >= 150)
            GoToRoutine(CHATENTRYROUTINE_SAVEANDEXIT);
        else
            sWork->exitDelayTimer++;
        break;
    }
}

static void ChatEntryRoutine_Disbanded(void)
{
    switch (sWork->routineState)
    {
    case 0:
        if (!FuncIsActiveTask(Task_ReceiveChatMessage))
        {
            if (sWork->multiplayerId)
                UnionRoomChat_StartDisplaySubtask(CHATDISPLAYROUTINE_DESTROYSTDMSGANDYESNO, 0);

            sWork->routineState++;
        }
        break;
    case 1:
        if (!RunDisplaySubtask(0))
        {
            if (sWork->multiplayerId != 0)
                UnionRoomChat_StartDisplaySubtask(CHATDISPLAYROUTINE_PRINTLEADERLEFT, 0);

            sWork->routineState++;
        }
        break;
    case 2:
        if (RunDisplaySubtask(0) != TRUE && IsLinkTaskFinished() && !Rfu_IsPlayerExchangeActive())
        {
            SetCloseLinkCallback();
            sWork->exitDelayTimer = 0;
            sWork->routineState++;
        }
        break;
    case 3:
        if (sWork->exitDelayTimer < 150)
            sWork->exitDelayTimer++;

        if (!gReceivedRemoteLinkPlayers)
            sWork->routineState++;
        break;
    case 4:
        if (sWork->exitDelayTimer >= 150)
            GoToRoutine(CHATENTRYROUTINE_SAVEANDEXIT);
        else
            sWork->exitDelayTimer++;
        break;
    }
}

static void ChatEntryRoutine_SendMessage(void)
{
    switch (sWork->routineState)
    {
    case 0:
        if (!gReceivedRemoteLinkPlayers)
        {
            GoToRoutine(CHATNETRYROUTINE_HANDLE_INPUT);
            break;
        }

        PrepareSendBuffer_Chat(sWork->sendMessageBuffer);
        sWork->routineState++;
        // fall through
    case 1:
        if (IsLinkTaskFinished() == TRUE && !Rfu_IsPlayerExchangeActive() && SendBlock(0, sWork->sendMessageBuffer, sizeof(sWork->sendMessageBuffer)))
            sWork->routineState++;
        break;
    case 2:
        ResetMessageEntryBuffer();
        UnionRoomChat_StartDisplaySubtask(CHATDISPLAYROUTINE_PRINTMSG, 0);
        sWork->routineState++;
        break;
    case 3:
        if (!RunDisplaySubtask(0))
            sWork->routineState++;
        break;
    case 4:
        if (IsLinkTaskFinished())
            GoToRoutine(CHATNETRYROUTINE_HANDLE_INPUT);
        break;
    }
}

static void ChatEntryRoutine_Register(void)
{
    switch (sWork->routineState)
    {
    case 0:
        if (ChatMsgHasAtLeastOneCharcter())
        {
            UnionRoomChat_StartDisplaySubtask(CHATDISPLAYROUTINE_PRINTREGISTERWHERE, 0);
            sWork->routineState = 2;
        }
        else
        {
            UnionRoomChat_StartDisplaySubtask(CHATDISPLAYROUTINE_PRINTINPUTTEXT, 0);
            sWork->routineState = 5;
        }
        break;
    case 1:
        if (JOY_NEW(A_BUTTON))
        {
            RegisterTextAtRow();
            UnionRoomChat_StartDisplaySubtask(CHATDISPLAYROUTINE_RETURNTOKB, 0);
            sWork->routineState = 3;
        }
        else if (JOY_NEW(B_BUTTON))
        {
            UnionRoomChat_StartDisplaySubtask(CHATDISPLAYROUTINE_CANCELREGISTER, 0);
            sWork->routineState = 4;
        }
        else if (TypeChatMessage_HandleDPad())
        {
            UnionRoomChat_StartDisplaySubtask(CHATDISPLAYROUTINE_MOVEKBCURSOR, 0);
            sWork->routineState = 2;
        }
        break;
    case 2:
        if (!RunDisplaySubtask(0))
            sWork->routineState = 1;
        break;
    case 3:
        if (!RunDisplaySubtask(0))
        {
            UnionRoomChat_StartDisplaySubtask(CHATDISPLAYROUTINE_CANCELREGISTER, 0);
            sWork->routineState = 4;
        }
        break;
    case 4:
        if (!RunDisplaySubtask(0))
            GoToRoutine(CHATNETRYROUTINE_HANDLE_INPUT);
        break;
    case 5:
        if (!RunDisplaySubtask(0))
            sWork->routineState = 6;
        break;
    case 6:
        if (JOY_NEW(A_BUTTON | B_BUTTON))
        {
            UnionRoomChat_StartDisplaySubtask(CHATDISPLAYROUTINE_DESTROYSTDMSGANDYESNO, 0);
            sWork->routineState = 4;
        }
        break;
    }
}

static void ChatEntryRoutine_SaveAndExit(void)
{
    s8 input;

    switch (sWork->routineState)
    {
    case 0:
        if (!sWork->changedRegisteredTexts)
        {
            sWork->routineState = 12;
        }
        else
        {
            UnionRoomChat_StartDisplaySubtask(CHATDISPLAYROUTINE_DESTROYSTDMSGANDYESNO, 0);
            sWork->routineState = 1;
        }
        break;
    case 1:
        if (!RunDisplaySubtask(0))
        {
            UnionRoomChat_StartDisplaySubtask(CHATDISPLAYROUTINE_ASKSAVE, 0);
            sWork->routineState = 2;
        }
        break;
    case 2:
        input = UnionRoomChat_ProcessInput();
        switch (input)
        {
        case -1:
        case 1:
            sWork->routineState = 12;
            break;
        case 0:
            UnionRoomChat_StartDisplaySubtask(CHATDISPLAYROUTINE_DESTROYSTDMSGANDYESNO, 0);
            sWork->routineState = 3;
            break;
        }
        break;
    case 3:
        if (!RunDisplaySubtask(0))
        {
            UnionRoomChat_StartDisplaySubtask(CHATDISPLAYROUTINE_ASKOVERWRITESAVE, 0);
            sWork->routineState = 4;
        }
        break;
    case 4:
        if (!RunDisplaySubtask(0))
            sWork->routineState = 5;
        break;
    case 5:
        input = UnionRoomChat_ProcessInput();
        switch (input)
        {
        case -1:
        case 1:
            sWork->routineState = 12;
            break;
        case 0:
            UnionRoomChat_StartDisplaySubtask(CHATDISPLAYROUTINE_DESTROYSTDMSGANDYESNO, 0);
            sWork->routineState = 6;
            break;
        }
        break;
    case 6:
        if (!RunDisplaySubtask(0))
        {
            UnionRoomChat_StartDisplaySubtask(CHATDISPLAYROUTINE_PRINTSAVING, 0);
            SaveRegisteredTextsToSB1();
            sWork->routineState = 7;
        }
        break;
    case 7:
        if (!RunDisplaySubtask(0))
        {
            SetContinueGameWarpStatusToDynamicWarp();
            TrySavingData(SAVE_NORMAL);
            sWork->routineState = 8;
        }
        break;
    case 8:
        UnionRoomChat_StartDisplaySubtask(CHATDISPLAYROUTINE_PRINTSAVEDTHEGAME, 0);
        sWork->routineState = 9;
        break;
    case 9:
        if (!RunDisplaySubtask(0))
        {
            PlaySE(SE_SAVE);
            ClearContinueGameWarpStatus2();
            sWork->routineState = 10;
        }
        break;
    case 10:
        sWork->afterSaveTimer = 0;
        sWork->routineState = 11;
        break;
    case 11:
        sWork->afterSaveTimer++;
        if (sWork->afterSaveTimer > 120)
            sWork->routineState = 12;
        break;
    case 12:
        BeginNormalPaletteFade(PALETTES_ALL, -1, 0, 16, RGB_BLACK);
        sWork->routineState = 13;
        break;
    case 13:
        if (!gPaletteFade.active)
        {
            HelpSystem_EnableToggleWithRButton();
            UnionRoomChat_FreeGraphicsWork();
            FreeChatWork();
            SetMainCallback2(CB2_ReturnToField);
        }
        break;
    }
}

static void GoToRoutine(u16 routineNo)
{
    sWork->routineNo = routineNo;
    sWork->routineState = 0;
}

static bool32 TypeChatMessage_HandleDPad(void)
{
    do
    {
        if (JOY_REPT(DPAD_UP))
        {
            if (sWork->currentRow > 0)
                sWork->currentRow--;
            else
                sWork->currentRow = sKeyboardPageMaxRow[sWork->currentPage];

            break;
        }
        if (JOY_REPT(DPAD_DOWN))
        {
            if (sWork->currentRow < sKeyboardPageMaxRow[sWork->currentPage])
            {
                sWork->currentRow++;
            }
            else
            {
                sWork->currentRow = 0;
            }

            break;
        }
        if (sWork->currentPage != UNION_ROOM_KB_PAGE_COUNT)
        {
            if (JOY_REPT(DPAD_LEFT))
            {
                if (sWork->currentCol > 0)
                    sWork->currentCol--;
                else
                    sWork->currentCol = 4;
                break;
            }
            if (JOY_REPT(DPAD_RIGHT))
            {
                if (sWork->currentCol < 4)
                    sWork->currentCol++;
                else
                    sWork->currentCol = 0;
                break;
            }
        }

        return FALSE;
    } while (0);
    return TRUE;
}

static void AppendCharacterToChatMessageBuffer(void)
{
    int i;
    const u8 *charsStr;
    int strLength;
    u8 *str;
    u8 buffer[21];

    if (sWork->currentPage != UNION_ROOM_KB_PAGE_COUNT)
    {
        charsStr = gUnionRoomKeyboardText[sWork->currentPage][sWork->currentRow];
        for (i = 0; i < sWork->currentCol; i++)
        {
            if (*charsStr == CHAR_EXTRA_SYMBOL)
                charsStr++;
            charsStr++;
        }

        strLength = 1;
    }
    else
    {
        u8 *tempStr = StringCopy(buffer, sWork->registeredTexts[sWork->currentRow]);
        tempStr[0] = CHAR_SPACE;
        tempStr[1] = EOS;
        charsStr = buffer;
        strLength = StringLength_Multibyte(buffer);
    }

    sWork->lastBufferCursorPos = sWork->bufferCursorPos;
    if (!charsStr)
        return;

    str = GetEndOfUnk1A();
    while (--strLength != -1 && sWork->bufferCursorPos < MESSAGE_BUFFER_NCHAR)
    {
        if (*charsStr == CHAR_EXTRA_SYMBOL)
        {
            *str = *charsStr;
            charsStr++;
            str++;
        }

        *str = *charsStr;
        charsStr++;
        str++;

        sWork->bufferCursorPos++;
    }

    *str = EOS;
}

static void DeleteLastCharacterOfChatMessageBuffer(void)
{
    sWork->lastBufferCursorPos = sWork->bufferCursorPos;
    if (sWork->bufferCursorPos)
    {
        u8 *str = GetPtrToLastCharOfUnk1A();
        *str = EOS;
        sWork->bufferCursorPos--;
    }
}

static void ToggleCaseOfLastCharacterInChatMessageBuffer(void)
{
    u8 *str;
    u8 character;

    sWork->lastBufferCursorPos = sWork->bufferCursorPos - 1;
    str = GetPtrToLastCharOfUnk1A();
    if (*str != CHAR_EXTRA_SYMBOL)
    {
        character = sCaseToggleTable[*str];
        if (character)
            *str = character;
    }
}

static bool32 ChatMsgHasAtLeastOneCharcter(void)
{
    if (sWork->bufferCursorPos)
        return TRUE;
    else
        return FALSE;
}

static void RegisterTextAtRow(void)
{
    u8 *src = UnionRoomChat_GetEndOfMessageEntryBuffer();
    StringCopy(sWork->registeredTexts[sWork->currentRow], src);
    sWork->changedRegisteredTexts = TRUE;
}

static void ResetMessageEntryBuffer(void)
{
    sWork->messageEntryBuffer[0] = EOS;
    sWork->lastBufferCursorPos = MESSAGE_BUFFER_NCHAR;
    sWork->bufferCursorPos = 0;
}

static void SaveRegisteredTextsToSB1(void)
{
    int i;
    for (i = 0; i < UNION_ROOM_KB_ROW_COUNT; i++)
        StringCopy(gSaveBlock1Ptr->registeredTexts[i], sWork->registeredTexts[i]);
}

u8 *UnionRoomChat_GetWorkRegisteredText(int arg0)
{
    return sWork->registeredTexts[arg0];
}

static u8 *GetEndOfUnk1A(void)
{
    u8 *str = sWork->messageEntryBuffer;
    while (*str != EOS)
        str++;

    return str;
}

static u8 *GetPtrToLastCharOfUnk1A(void)
{
    u8 *str = sWork->messageEntryBuffer;
    u8 *str2 = str;
    while (*str != EOS)
    {
        str2 = str;
        if (*str == CHAR_EXTRA_SYMBOL)
            str++;
        str++;
    }

    return str2;
}

static u16 GetNumCharsInMessageEntryBuffer(void)
{
    u8 *str;
    u32 i, numChars, strLength;

    strLength = StringLength_Multibyte(sWork->messageEntryBuffer);
    str = sWork->messageEntryBuffer;
    numChars = 0;
    if (strLength > 10)
    {
        strLength -= 10;
        for (i = 0; i < strLength; i++)
        {
            if (*str == CHAR_EXTRA_SYMBOL)
                str++;

            str++;
            numChars++;
        }
    }

    return numChars;
}

static void PrepareSendBuffer_Null(u8 *arg0)
{
    arg0[0] = CHAT_MESSAGE_0;
}

static void PrepareSendBuffer_Join(u8 *arg0)
{
    arg0[0] = CHAT_MESSAGE_JOIN;
    StringCopy(&arg0[1], gSaveBlock2Ptr->playerName);
    arg0[1 + (PLAYER_NAME_LENGTH + 1)] = sWork->multiplayerId;
}

static void PrepareSendBuffer_Chat(u8 *arg0)
{
    arg0[0] = CHAT_MESSAGE_CHAT;
    StringCopy(&arg0[1], gSaveBlock2Ptr->playerName);
    StringCopy(&arg0[1 + (PLAYER_NAME_LENGTH + 1)], sWork->messageEntryBuffer);
}

static void PrepareSendBuffer_Leave(u8 *arg0)
{
    arg0[0] = CHAT_MESSAGE_LEAVE;
    StringCopy(&arg0[1], gSaveBlock2Ptr->playerName);
    arg0[1 + (PLAYER_NAME_LENGTH + 1)] = sWork->multiplayerId;
    RfuSetNormalDisconnectMode();
}

static void PrepareSendBuffer_Drop(u8 *arg0)
{
    arg0[0] = CHAT_MESSAGE_DROP;
    StringCopy(&arg0[1], gSaveBlock2Ptr->playerName);
    arg0[1 + (PLAYER_NAME_LENGTH + 1)] = sWork->multiplayerId;
}

static void PrepareSendBuffer_Disband(u8 *arg0)
{
    arg0[0] = CHAT_MESSAGE_DISBAND;
    StringCopy(&arg0[1], gSaveBlock2Ptr->playerName);
    arg0[1 + (PLAYER_NAME_LENGTH + 1)] = sWork->multiplayerId;
}

static bool32 ProcessReceivedChatMessage(u8 *dest, u8 *recvMessage)
{
    u8 *tempStr;
    u8 cmd = *recvMessage;
    u8 *name = recvMessage + 1;
    recvMessage = name;
    recvMessage += PLAYER_NAME_LENGTH + 1;

    switch (cmd)
    {
    case CHAT_MESSAGE_JOIN:
        if (sWork->multiplayerId != name[PLAYER_NAME_LENGTH + 1])
        {
            DynamicPlaceholderTextUtil_Reset();
            DynamicPlaceholderTextUtil_SetPlaceholderPtr(0, name);
            DynamicPlaceholderTextUtil_ExpandPlaceholders(dest, gText_F700JoinedChat);
            return TRUE;
        }
        break;
    case CHAT_MESSAGE_CHAT:
        tempStr = StringCopy(dest, name);
        *(tempStr++) = EXT_CTRL_CODE_BEGIN;
        *(tempStr++) = EXT_CTRL_CODE_CLEAR_TO;
        *(tempStr++) = 42;
        *(tempStr++) = CHAR_COLON;
        StringCopy(tempStr, recvMessage);
        return TRUE;
    case CHAT_MESSAGE_DISBAND:
        StringCopy(sWork->hostName, name);
        // fall through
    case CHAT_MESSAGE_LEAVE:
        if (sWork->multiplayerId != *recvMessage)
        {
            DynamicPlaceholderTextUtil_Reset();
            DynamicPlaceholderTextUtil_SetPlaceholderPtr(0, name);
            DynamicPlaceholderTextUtil_ExpandPlaceholders(dest, gText_F700LeftChat);
            return TRUE;
        }
        break;
    }

    return FALSE;
}

u8 GetCurrentKeyboardPage(void)
{
    return sWork->currentPage;
}

void UnionRoomChat_GetCursorColAndRow(u8 *colp, u8 *rowp)
{
    *colp = sWork->currentCol;
    *rowp = sWork->currentRow;
}

u8 *UnionRoomChat_GetMessageEntryBuffer(void)
{
    return sWork->messageEntryBuffer;
}

int UnionRoomChat_LenMessageEntryBuffer(void)
{
    u8 *str = UnionRoomChat_GetMessageEntryBuffer();
    return StringLength_Multibyte(str);
}

void UnionRoomChat_GetBufferSelectionRegion(u32 *startp, u32 *diffp)
{
    int diff = sWork->bufferCursorPos - sWork->lastBufferCursorPos;
    if (diff < 0)
    {
        diff *= -1;
        *startp = sWork->bufferCursorPos;
    }
    else
    {
        *startp = sWork->lastBufferCursorPos;
    }

    *diffp = diff;
}

u8 *UnionRoomChat_GetEndOfMessageEntryBuffer(void)
{
    int i;
    u16 numChars = GetNumCharsInMessageEntryBuffer();
    u8 *str = sWork->messageEntryBuffer;
    for (i = 0; i < numChars; i++)
    {
        if (*str == CHAR_EXTRA_SYMBOL)
            str++;

        str++;
    }

    return str;
}

// Useless overhead
u16 UnionRoomChat_GetNumCharsInMessageEntryBuffer(void)
{
    u16 count;
    u32 i;
    u16 numChars = GetNumCharsInMessageEntryBuffer();
    u8 *str = sWork->messageEntryBuffer;
    for (count = 0, i = 0; i < numChars; count++, i++)
    {
        if (*str == CHAR_EXTRA_SYMBOL)
            str++;

        str++;
    }

    return count;
}

u8 *UnionRoomChat_GetLastReceivedMessage(void)
{
    return sWork->receivedMessage;
}

u16 UnionRoomChat_GetReceivedPlayerIndex(void)
{
    return sWork->receivedPlayerIndex;
}

int UnionRoomChat_GetMessageEntryCursorPosition(void)
{
    return sWork->bufferCursorPos;
}

// This probably does more in the Japanese titles.
int UnionRoomChat_GetWhetherShouldShowCaseToggleIcon(void)
{
    u8 *str = GetPtrToLastCharOfUnk1A();
    u32 character = *str;
    if (character > 0xFF || sCaseToggleTable[character] == character || sCaseToggleTable[character] == 0)
        return 3;
    else
        return 0;
}

u8 *UnionRoomChat_GetNameOfPlayerWhoDisbandedChat(void)
{
    return sWork->hostName;
}

void UnionRoomChat_InitializeRegisteredTexts(void)
{
    StringCopy(gSaveBlock1Ptr->registeredTexts[0], gText_Hello);
    StringCopy(gSaveBlock1Ptr->registeredTexts[1], gText_Pokemon2);
    StringCopy(gSaveBlock1Ptr->registeredTexts[2], gText_Trade);
    StringCopy(gSaveBlock1Ptr->registeredTexts[3], gText_Battle);
    StringCopy(gSaveBlock1Ptr->registeredTexts[4], gText_Lets);
    StringCopy(gSaveBlock1Ptr->registeredTexts[5], gText_Ok);
    StringCopy(gSaveBlock1Ptr->registeredTexts[6], gText_Sorry);
    StringCopy(gSaveBlock1Ptr->registeredTexts[7], gText_YaySmileEmoji);
    StringCopy(gSaveBlock1Ptr->registeredTexts[8], gText_ThankYou);
    StringCopy(gSaveBlock1Ptr->registeredTexts[9], gText_ByeBye);
}

#define tState               data[0]
#define tI                   data[1]
#define tCurrLinkPlayer      data[2]
#define tBlockReceivedStatus data[3]
#define tLinkPlayerCount     data[4]
#define tNextState           data[5]

static void Task_ReceiveChatMessage(u8 taskId)
{
    u8 *buffer;
    s16 *data = gTasks[taskId].data;

    switch (tState)
    {
    case 0:
        if (!gReceivedRemoteLinkPlayers)
        {
            DestroyTask(taskId);
            return;
        }

        tState = 1;
        // fall through
    case 1:
        tLinkPlayerCount = GetLinkPlayerCount();
        if (sWork->linkPlayerCount != tLinkPlayerCount)
        {
            tState = 2;
            sWork->linkPlayerCount = tLinkPlayerCount;
            return;
        }

        tBlockReceivedStatus = GetBlockReceivedStatus();
        if (!tBlockReceivedStatus && Rfu_IsPlayerExchangeActive())
            return;

        tI = 0;
        tState = 3;
        // fall through
    case 3:
        // Idle listen
        for (; tI < 5 && ((tBlockReceivedStatus >> tI) & 1) == 0; tI++)
            ;

        if (tI == 5)
        {
            tState = 1;
            return;
        }

        tCurrLinkPlayer = tI;
        ResetBlockReceivedFlag(tCurrLinkPlayer);
        buffer = (u8 *)gBlockRecvBuffer[tI];
        switch (buffer[0])
        {
        default:
        case CHAT_MESSAGE_CHAT: tNextState = 3; break;
        case CHAT_MESSAGE_JOIN: tNextState = 3; break;
        case CHAT_MESSAGE_LEAVE: tNextState = 4; break;
        case CHAT_MESSAGE_DROP: tNextState = 5; break;
        case CHAT_MESSAGE_DISBAND: tNextState = 6; break;
        }

        if (ProcessReceivedChatMessage(sWork->receivedMessage, (u8 *)gBlockRecvBuffer[tI]))
        {
            sWork->receivedPlayerIndex = tI;
            UnionRoomChat_StartDisplaySubtask(CHATDISPLAYROUTINE_SCROLLCHAT, 2);
            tState = 7;
        }
        else
        {
            tState = tNextState;
        }

        tI++;
        break;
    case 7:
        if (!RunDisplaySubtask(2))
            tState = tNextState;
        break;
    case 4:
        // Someone is leaving
        if (sWork->multiplayerId == 0 && tCurrLinkPlayer != 0)
        {
            // You're the leader, and the person who left is not you
            if (GetLinkPlayerCount() == 2)
            {
                Rfu_StopPartnerSearch();
                sWork->exitType = CHATEXIT_LEADER_LAST;
                DestroyTask(taskId);
                return;
            }

            Rfu_DisconnectPlayerById(tCurrLinkPlayer);
        }

        tState = 3;
        break;
    case 5:
        // Person left
        if (sWork->multiplayerId != 0)
            sWork->exitType = CHATEXIT_DROPPED;

        DestroyTask(taskId);
        break;
    case 6:
        // The leader disbanded the chat
        sWork->exitType = CHATEXIT_DISBANDED;
        DestroyTask(taskId);
        break;
    case 2:
        if (!Rfu_IsPlayerExchangeActive())
        {
            if (sWork->multiplayerId == 0)
                SetUnionRoomChatPlayerData(sWork->linkPlayerCount);

            tState = 1;
        }
        break;
    }
}

#undef tNextState
#undef tLinkPlayerCount
#undef tBlockReceivedStatus
#undef tCurrLinkPlayer
#undef tI
#undef tState
