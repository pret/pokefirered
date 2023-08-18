#include "global.h"
#include "gflib.h"
#include "dynamic_placeholder_text_util.h"
#include "graphics.h"
#include "menu.h"
#include "new_menu_helpers.h"
#include "scanline_effect.h"
#include "strings.h"
#include "text_window.h"
#include "union_room_chat.h"
#include "union_room_chat_display.h"
#include "union_room_chat_objects.h"

#define STDMESSAGE_QUIT_CHATTING 0
#define STDMESSAGE_REGISTER_WHERE 1
#define STDMESSAGE_REGISTER_HERE 2
#define STDMESSAGE_INPUT_TEXT 3
#define STDMESSAGE_EXITING_CHAT 4
#define STDMESSAGE_LEADER_LEFT 5
#define STDMESSAGE_ASK_SAVE 6
#define STDMESSAGE_ASK_OVERWRITE 7
#define STDMESSAGE_SAVING_NO_OFF 8
#define STDMESSAGE_SAVED_THE_GAME 9
#define STDMESSAGE_WARN_LEADER_LEAVE 10

struct UnionRoomChat2Subtask
{
    bool32 (*callback)(u8 *);
    u8 active;
    u8 state;
};

struct UnionRoomChat2
{
    struct UnionRoomChat2Subtask subtasks[3];
    u16 yesNoMenuWinId;
    u16 curLine;
    u16 scrollCount;
    u16 messageWindowId;
    s16 bg1hofs;
    u8 expandedPlaceholdersBuffer[0x106];
    u8 bg0Buffer[BG_SCREEN_SIZE];
    u8 bg1Buffer[BG_SCREEN_SIZE];
    u8 bg3Buffer[BG_SCREEN_SIZE];
    u8 bg2Buffer[BG_SCREEN_SIZE];
    u8 unk2128[0x20];
    u8 unk2148[0x20];
};

struct SubtaskInfo
{
    u16 idx;
    bool32 (*callback)(u8 *);
};

struct MessageWindowInfo
{
    const u8 *text;
    bool8 boxType;
    u8 x;
    u8 y;
    u8 letterSpacing;
    u8 lineSpacing;
    bool8 expandPlaceholders;
    bool8 widerBox;
};

static EWRAM_DATA struct UnionRoomChat2 * sWork = NULL;

static void InitWork(struct UnionRoomChat2 * ptr);
static void UnionRoomChat_ResetDisplaySubtasks(void);
static bool32 DisplaySubtask_LoadGfx(u8 *state);
static bool32 DisplaySubtask_PrintWin3(u8 *state);
static bool32 DisplaySubtask_HideWin3(u8 *state);
static bool32 DisplaySubtask_SwitchPages(u8 *state);
static bool32 DisplaySubtask_MoveSelectorCursorObj(u8 *state);
static bool32 DisplaySubtask_ShowQuitChattingDialog(u8 *state);
static bool32 DisplaySubtask_HideQuitChattingDialog(u8 *state);
static bool32 DisplaySubtask_UpdateMessageBuffer(u8 *state);
static bool32 DisplaySubtask_PrintRegisterWhere(u8 *state);
static bool32 DisplaySubtask_CancelRegister(u8 *state);
static bool32 DisplaySubtask_ReturnToKeyboard(u8 *state);
static bool32 DisplaySubtask_ScrollChat(u8 *state);
static bool32 DisplaySubtask_AnimateSelectorCursorBlink(u8 *state);
static bool32 DisplaySubtask_PrintInputText(u8 *state);
static bool32 DisplaySubtask_PrintExitingChat(u8 *state);
static bool32 DisplaySubtask_PrintLeaderLeft(u8 *state);
static bool32 DisplaySubtask_AskSave(u8 *state);
static bool32 DisplaySubtask_AskOverwriteSave(u8 *state);
static bool32 DisplaySubtask_PrintSavingDontTurnOffPower(u8 *state);
static bool32 DisplaySubtask_PrintSavedTheGame(u8 *state);
static bool32 DisplaySubtask_ShowConfirmLeaderLeaveDialog(u8 *state);
static bool32 DisplaySubtaskDummy(u8 *state);
static void PlaceYesNoMenuAt(u8 a0, u8 a1, u8 a2);
static void HideYesNoMenuWindow(void);
static void DestroyYesNoMenuWindow(void);
static void PlaceStdMessageWindow(int id, u16 bg0vofs);
static void HideStdMessageWindow(void);
static void DestroyStdMessageWindow(void);
static void FillWin1Rect(u16 x, u16 width, u8 fillValue);
static void PrintOnWin1Parameterized(u16 x, u8 *str, u8 bgColor, u8 fgColor, u8 shadowColor);
static void PrintCurrentKeyboardPage(void);
static bool32 AnimateMoveBg1Right(void);
static bool32 AnimateMoveBg1Left(void);
static void PrintKeyboardSwapTextsOnWin3(void);
static void ClearWin3(void);
static void PrintTextOnWin0Colorized(u16 row, u8 *str, u8 colorIdx);
static void ResetGpuBgState(void);
static void SetBgTilemapWorkBuffers(void);
static void ClearBg0(void);
static void LoadUnionRoomChatPanelGfx(void);
static void LoadLinkMiscMenuGfx(void);
static void LoadBg1Pal8(void);
static void LoadWin0(void);
static void LoadWin2(void);
static void LoadWin1(void);
static void LoadWin3(void);
static void InitScanlineEffect(void);
static void FillScanlineEffectWithValue1col(s16 a0);
static void FillScanlineEffectWithValue2col(s16 a0);

static const u16 sUnionRoomChat_TextEntry_Pal[] = INCBIN_U16("graphics/union_room_chat/text_entry.gbapal");
static const u16 gUnionRoomChat_Unused_Pal[] = INCBIN_U16("graphics/union_room_chat/unused.gbapal"); // Loaded, but nothing uses it
static const u16 sUnionRoomChat_Messages_Pal[] = INCBIN_U16("graphics/union_room_chat/messages.gbapal");

static const struct BgTemplate sBgTemplates[] = {
    {
        .bg = 0,
        .charBaseIndex = 0,
        .mapBaseIndex = 7,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 0,
        .baseTile = 0x0000
    }, {
        .bg = 1,
        .charBaseIndex = 3,
        .mapBaseIndex = 31,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 1,
        .baseTile = 0x0000
    }, {
        .bg = 2,
        .charBaseIndex = 2,
        .mapBaseIndex = 23,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 2,
        .baseTile = 0x0000
    }, {
        .bg = 3,
        .charBaseIndex = 1,
        .mapBaseIndex = 15,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 3,
        .baseTile = 0x0001
    }
};

static const struct WindowTemplate sWindowTemplates[] = {
    {
        .bg = 3,
        .tilemapLeft = 8,
        .tilemapTop = 1,
        .width = 21,
        .height = 19,
        .paletteNum = 15,
        .baseBlock = 0x001
    }, {
        .bg = 1,
        .tilemapLeft = 9,
        .tilemapTop = 18,
        .width = 15,
        .height = 2,
        .paletteNum = 12,
        .baseBlock = 0x07a
    }, {
        .bg = 1,
        .tilemapLeft = 0,
        .tilemapTop = 2,
        .width = 6,
        .height = 15,
        .paletteNum = 7,
        .baseBlock = 0x020
    }, {
        .bg = 0,
        .tilemapLeft = 1,
        .tilemapTop = 2,
        .width = 7,
        .height = 9,
        .paletteNum = 14,
        .baseBlock = 0x013
    }, DUMMY_WIN_TEMPLATE
};

static const struct SubtaskInfo sSubtaskInfo[] = {
    {CHATDISPLAYROUTINE_LOADGFX, DisplaySubtask_LoadGfx},
    {CHATDISPLAYROUTINE_SHOWKBSWAPMENU, DisplaySubtask_PrintWin3},
    {CHATDISPLAYROUTINE_HIDEKBSWAPMENU, DisplaySubtask_HideWin3},
    {CHATDISPLAYROUTINE_SWITCHPAGES, DisplaySubtask_SwitchPages},
    {CHATDISPLAYROUTINE_MOVEKBCURSOR, DisplaySubtask_MoveSelectorCursorObj},
    {CHATDISPLAYROUTINE_SHOWQUITCHATTINGDIALOG, DisplaySubtask_ShowQuitChattingDialog},
    {CHATDISPLAYROUTINE_DESTROYSTDMSGANDYESNO, DisplaySubtask_HideQuitChattingDialog},
    {CHATDISPLAYROUTINE_PRINTMSG, DisplaySubtask_UpdateMessageBuffer},
    {CHATDISPLAYROUTINE_PRINTREGISTERWHERE, DisplaySubtask_PrintRegisterWhere},
    {CHATDISPLAYROUTINE_CANCELREGISTER, DisplaySubtask_CancelRegister},
    {CHATDISPLAYROUTINE_RETURNTOKB, DisplaySubtask_ReturnToKeyboard},
    {CHATDISPLAYROUTINE_SCROLLCHAT, DisplaySubtask_ScrollChat},
    {CHATDISPLAYROUTINE_CURSORBLINK, DisplaySubtask_AnimateSelectorCursorBlink},
    {CHATDISPLAYROUTINE_PRINTINPUTTEXT, DisplaySubtask_PrintInputText},
    {CHATDISPLAYROUTINE_PRINTEXITINGCHAT, DisplaySubtask_PrintExitingChat},
    {CHATDISPLAYROUTINE_PRINTLEADERLEFT, DisplaySubtask_PrintLeaderLeft},
    {CHATDISPLAYROUTINE_ASKSAVE, DisplaySubtask_AskSave},
    {CHATDISPLAYROUTINE_ASKOVERWRITESAVE, DisplaySubtask_AskOverwriteSave},
    {CHATDISPLAYROUTINE_PRINTSAVING, DisplaySubtask_PrintSavingDontTurnOffPower},
    {CHATDISPLAYROUTINE_PRINTSAVEDTHEGAME, DisplaySubtask_PrintSavedTheGame},
    {CHATDISPLAYROUTINE_SHOWCONFIRMLEADERLEAVEDIALOG, DisplaySubtask_ShowConfirmLeaderLeaveDialog}
};

static const struct MessageWindowInfo sMessageWindowInfo[] = {

    [STDMESSAGE_QUIT_CHATTING] = {
        .text = gText_QuitChatting,
        .boxType = 1,
        .x = 0,
        .y = 0,
        .letterSpacing = 1,
        .lineSpacing = 2, 
        .expandPlaceholders = FALSE,
        .widerBox = FALSE
    },
    [STDMESSAGE_REGISTER_WHERE] = {
        .text = gText_RegisterTextWhere,
        .boxType = 1,
        .x = 0,
        .y = 0,
        .letterSpacing = 1,
        .lineSpacing = 2, 
        .expandPlaceholders = FALSE,
        .widerBox = FALSE
    },
    [STDMESSAGE_REGISTER_HERE] = {
        .text = gText_RegisterTextHere,
        .boxType = 1,
        .x = 0,
        .y = 0,
        .letterSpacing = 1,
        .lineSpacing = 2, 
        .expandPlaceholders = FALSE,
        .widerBox = FALSE
    },
    [STDMESSAGE_INPUT_TEXT] = {
        .text = gText_InputText,
        .boxType = 1,
        .x = 0,
        .y = 0,
        .letterSpacing = 1,
        .lineSpacing = 2, 
        .expandPlaceholders = FALSE,
        .widerBox = FALSE
    },
    [STDMESSAGE_EXITING_CHAT] = {
        .text = gText_ExitingTheChat,
        .boxType = 2,
        .x = 0,
        .y = 0,
        .letterSpacing = 1,
        .lineSpacing = 2, 
        .expandPlaceholders = FALSE,
        .widerBox = FALSE
    },
    [STDMESSAGE_LEADER_LEFT] = {
        .text = gText_LeaderHasLeftEndingChat,
        .boxType = 2,
        .x = 0,
        .y = 0,
        .letterSpacing = 0,
        .lineSpacing = 2, 
        .expandPlaceholders = TRUE,
        .widerBox = FALSE
    },
    [STDMESSAGE_ASK_SAVE] = {
        .text = gText_RegisteredTextChanged_OKtoSave,
        .boxType = 2,
        .x = 0,
        .y = 0,
        .letterSpacing = 1,
        .lineSpacing = 2, 
        .expandPlaceholders = FALSE,
        .widerBox = TRUE
    },
    [STDMESSAGE_ASK_OVERWRITE] = {
        .text = gText_RegisteredTextChanged_AlreadySavedFile,
        .boxType = 2,
        .x = 0,
        .y = 0,
        .letterSpacing = 1,
        .lineSpacing = 2, 
        .expandPlaceholders = FALSE,
        .widerBox = TRUE
    },
    [STDMESSAGE_SAVING_NO_OFF] = {
        .text = gText_RegisteredTextChanged_SavingDontTurnOff,
        .boxType = 2,
        .x = 0,
        .y = 0,
        .letterSpacing = 1,
        .lineSpacing = 2, 
        .expandPlaceholders = FALSE,
        .widerBox = TRUE
    },
    [STDMESSAGE_SAVED_THE_GAME] = {
        .text = gText_RegisteredTextChanged_SavedTheGame,
        .boxType = 2,
        .x = 0,
        .y = 0,
        .letterSpacing = 1,
        .lineSpacing = 2, 
        .expandPlaceholders = TRUE,
        .widerBox = TRUE
    },
    [STDMESSAGE_WARN_LEADER_LEAVE] = {
        .text = gText_IfLeaderLeavesChatWillEnd,
        .boxType = 2,
        .x = 0,
        .y = 0,
        .letterSpacing = 1,
        .lineSpacing = 2, 
        .expandPlaceholders = FALSE,
        .widerBox = TRUE
    }
};

static const u8 gText_Ellipsis[] = _("…");

static const struct MenuAction sKeyboardSwapTexts[] = {
    {gText_Upper},
    {gText_Lower},
    {gText_Symbols},
    {gText_Register2},
    {gText_Exit}
};

bool8 UnionRoomChat_TryAllocGraphicsWork(void)
{
    sWork = Alloc(sizeof(*sWork));
    if (sWork && UnionRoomChat_TryAllocSpriteWork())
    {
        ResetBgsAndClearDma3BusyFlags(0);
        InitBgsFromTemplates(0, sBgTemplates, ARRAY_COUNT(sBgTemplates));
        InitWindows(sWindowTemplates);
        ResetTempTileDataBuffers();
        InitScanlineEffect();
        InitWork(sWork);
        UnionRoomChat_ResetDisplaySubtasks();
        UnionRoomChat_StartDisplaySubtask(0, 0);
        return TRUE;
    }
    else
    {
        return FALSE;
    }
}

bool32 UnionRoomChat_RunDisplaySubtask0(void)
{
    return RunDisplaySubtask(0);
}

void UnionRoomChat_FreeGraphicsWork(void)
{
    UnionRoomChat_FreeSpriteWork();
    if (sWork != NULL)
        FREE_AND_SET_NULL(sWork);

    FreeAllWindowBuffers();
    gScanlineEffect.state = 3;
}

static void InitWork(struct UnionRoomChat2 *arg0)
{
    arg0->yesNoMenuWinId = 0xFF;
    arg0->messageWindowId = 0xFF;
    arg0->curLine = 0;
}

void UnionRoomChat_ResetDisplaySubtasks(void)
{
    int i;

    if (sWork == NULL)
        return;

    for (i = 0; i < 3; i++)
    {
        sWork->subtasks[i].callback = DisplaySubtaskDummy;
        sWork->subtasks[i].active = FALSE;
        sWork->subtasks[i].state = 0;
    }
}

void UnionRoomChat_RunDisplaySubtasks(void)
{
    int i;

    if (sWork == NULL)
        return;

    for (i = 0; i < 3; i++)
    {
        if (sWork->subtasks[i].active)
            sWork->subtasks[i].active = sWork->subtasks[i].callback(&sWork->subtasks[i].state);
    }
}

void UnionRoomChat_StartDisplaySubtask(u16 arg0, u8 arg1)
{
    int i;

    sWork->subtasks[arg1].callback = DisplaySubtaskDummy;
    for (i = 0; i < NELEMS(sSubtaskInfo); i++)
    {
        if (sSubtaskInfo[i].idx == arg0)
        {
            sWork->subtasks[arg1].callback = sSubtaskInfo[i].callback;
            sWork->subtasks[arg1].active = TRUE;
            sWork->subtasks[arg1].state = 0;
            break;
        }
    }
}

bool8 RunDisplaySubtask(u8 arg0)
{
    return sWork->subtasks[arg0].active;
}

static bool32 DisplaySubtask_LoadGfx(u8 *state)
{
    if (FreeTempTileDataBuffersIfPossible() == TRUE)
        return TRUE;

    switch (*state)
    {
    case 0:
        ResetGpuBgState();
        SetBgTilemapWorkBuffers();
        break;
    case 1:
        ClearBg0();
        break;
    case 2:
        LoadUnionRoomChatPanelGfx();
        break;
    case 3:
        LoadLinkMiscMenuGfx();
        break;
    case 4:
        LoadBg1Pal8();
        break;
    case 5:
        LoadWin0();
        LoadWin2();
        LoadWin3();
        LoadWin1();
        break;
    case 6:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            UnionRoomChat_CreateSelectorCursorObj();
            UnionRoomChat_SpawnTextEntryPointerSprites();
            CreatePageSwitchUISprites();
        }
        break;
    default:
        return FALSE;
    }

    (*state)++;
    return TRUE;
}

static bool32 DisplaySubtask_PrintWin3(u8 *state)
{
    switch (*state)
    {
    case 0:
        PrintKeyboardSwapTextsOnWin3();
        CopyWindowToVram(3, COPYWIN_FULL);
        break;
    case 1:
        return IsDma3ManagerBusyWithBgCopy();
    }

    (*state)++;
    return TRUE;
}

static bool32 DisplaySubtask_HideWin3(u8 *state)
{
    switch (*state)
    {
    case 0:
        ClearWin3();
        CopyWindowToVram(3, COPYWIN_FULL);
        break;
    case 1:
        return IsDma3ManagerBusyWithBgCopy();
    }

    (*state)++;
    return TRUE;
}

static bool32 DisplaySubtask_SwitchPages(u8 *state)
{
    switch (*state)
    {
    case 0:
        UnionRoomChat_ToggleSelectorCursorObjVisibility(TRUE);
        if (AnimateMoveBg1Right())
            return TRUE;

        PrintCurrentKeyboardPage();
        CopyWindowToVram(2, COPYWIN_GFX);
        break;
    case 1:
        if (IsDma3ManagerBusyWithBgCopy())
            return TRUE;
        break;
    case 2:
        if (AnimateMoveBg1Left())
            return TRUE;

        UnionRoomChat_MoveSelectorCursorObj();
        UnionRoomChat_ToggleSelectorCursorObjVisibility(FALSE);
        UpdateVisibleUnionRoomChatIcon();
        return FALSE;
    }

    (*state)++;
    return TRUE;
}

static bool32 DisplaySubtask_MoveSelectorCursorObj(u8 *state)
{
    UnionRoomChat_MoveSelectorCursorObj();
    return FALSE;
}

static bool32 DisplaySubtask_ShowQuitChattingDialog(u8 *state)
{
    switch (*state)
    {
    case 0:
        PlaceStdMessageWindow(STDMESSAGE_QUIT_CHATTING, 0);
        PlaceYesNoMenuAt(23, 11, 1);
        CopyWindowToVram(sWork->messageWindowId, COPYWIN_FULL);
        break;
    case 1:
        return IsDma3ManagerBusyWithBgCopy();
    }

    (*state)++;
    return TRUE;
}

static bool32 DisplaySubtask_HideQuitChattingDialog(u8 *state)
{
    switch (*state)
    {
    case 0:
        HideStdMessageWindow();
        HideYesNoMenuWindow();
        CopyBgTilemapBufferToVram(0);
        break;
    case 1:
        if (IsDma3ManagerBusyWithBgCopy())
            return TRUE;

        DestroyStdMessageWindow();
        DestroyYesNoMenuWindow();
        return FALSE;
    }

    (*state)++;
    return TRUE;
}

static bool32 DisplaySubtask_UpdateMessageBuffer(u8 *state)
{
    u32 start, length;
    u8 *str;

    switch (*state)
    {
    case 0:
        UnionRoomChat_GetBufferSelectionRegion(&start, &length);
        FillWin1Rect(start, length, PIXEL_FILL(0));
        str = UnionRoomChat_GetMessageEntryBuffer();
        PrintOnWin1Parameterized(0, str, TEXT_COLOR_LIGHT_GRAY, TEXT_COLOR_WHITE, TEXT_COLOR_DARK_GRAY);
        CopyWindowToVram(1, COPYWIN_GFX);
        break;
    case 1:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            UpdateVisibleUnionRoomChatIcon();
            return FALSE;
        }
        return TRUE;
    }

    (*state)++;
    return TRUE;
}

static bool32 DisplaySubtask_PrintRegisterWhere(u8 *state)
{
    u16 var0;
    u8 *str;
    u16 length;

    switch (*state)
    {
    case 0:
        var0 = UnionRoomChat_GetNumCharsInMessageEntryBuffer();
        str = UnionRoomChat_GetEndOfMessageEntryBuffer();
        length = StringLength_Multibyte(str);
        FillWin1Rect(var0, length, PIXEL_FILL(6));
        PrintOnWin1Parameterized(var0, str, TEXT_COLOR_TRANSPARENT, TEXT_COLOR_RED, TEXT_COLOR_LIGHT_RED);
        CopyWindowToVram(1, COPYWIN_GFX);
        break;
    case 1:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            PlaceStdMessageWindow(STDMESSAGE_REGISTER_WHERE, 16);
            CopyWindowToVram(sWork->messageWindowId, COPYWIN_FULL);
        }
        else
        {
            return TRUE;
        }
        break;
    case 2:
        if (!IsDma3ManagerBusyWithBgCopy())
            UnionRoomChat_UpdateObjPalCycle(1);
        else
            return TRUE;
        break;
    case 3:
        return FALSE;
    }

    (*state)++;
    return TRUE;
}

static bool32 DisplaySubtask_CancelRegister(u8 *state)
{
    u16 x;
    u8 *str;
    u16 length;

    switch (*state)
    {
    case 0:
        x = UnionRoomChat_GetNumCharsInMessageEntryBuffer();
        str = UnionRoomChat_GetEndOfMessageEntryBuffer();
        length = StringLength_Multibyte(str);
        FillWin1Rect(x, length, PIXEL_FILL(0));
        PrintOnWin1Parameterized(x, str, TEXT_COLOR_LIGHT_GRAY, TEXT_COLOR_WHITE, TEXT_COLOR_DARK_GRAY);
        CopyWindowToVram(1, COPYWIN_GFX);
        break;
    case 1:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            HideStdMessageWindow();
            CopyWindowToVram(sWork->messageWindowId, COPYWIN_FULL);
        }
        else
        {
            return TRUE;
        }
        break;
    case 2:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            UnionRoomChat_UpdateObjPalCycle(0);
            DestroyStdMessageWindow();
        }
        else
        {
            return TRUE;
        }
        break;
    case 3:
        return FALSE;
    }

    (*state)++;
    return TRUE;
}

static bool32 DisplaySubtask_ReturnToKeyboard(u8 *state)
{
    switch (*state)
    {
    case 0:
        PrintCurrentKeyboardPage();
        CopyWindowToVram(2, COPYWIN_GFX);
        (*state)++;
        break;
    case 1:
        if (IsDma3ManagerBusyWithBgCopy())
            return TRUE;
        else
            return FALSE;
    }

    return TRUE;
}

static bool32 DisplaySubtask_ScrollChat(u8 *state)
{
    u16 row;
    u8 *str;
    u8 colorIdx;

    switch (*state)
    {
    case 0:
        row = sWork->curLine;
        str = UnionRoomChat_GetLastReceivedMessage();
        colorIdx = UnionRoomChat_GetReceivedPlayerIndex();
        PrintTextOnWin0Colorized(row, str, colorIdx);
        CopyWindowToVram(0, COPYWIN_GFX);
        break;
    case 1:
        if (IsDma3ManagerBusyWithBgCopy())
            return TRUE;

        if (sWork->curLine < 9)
        {
            sWork->curLine++;
            *state = 4;
            return FALSE;
        }
        else
        {
            sWork->scrollCount = 0;
            (*state)++;
        }
        // fall through
    case 2:
        ScrollWindow(0, 0, 5, PIXEL_FILL(1));
        CopyWindowToVram(0, COPYWIN_GFX);
        sWork->scrollCount++;
        (*state)++;
        // fall through
    case 3:
        if (IsDma3ManagerBusyWithBgCopy())
            return TRUE;

        if (sWork->scrollCount < 3)
        {
            (*state)--;
            return TRUE;
        }
        break;
    case 4:
        return FALSE;
    default:
        return TRUE;
    }

    (*state)++;
    return TRUE;
}

static bool32 DisplaySubtask_AnimateSelectorCursorBlink(u8 *state)
{
    switch (*state)
    {
    case 0:
        UnionRoomChat_SetSelectorCursorClosedImage();
        (*state)++;
        break;
    case 1:
        return UnionRoomChat_AnimateSelectorCursorReopen();
    }

    return TRUE;
}

static bool32 DisplaySubtask_PrintInputText(u8 *state)
{
    switch (*state)
    {
    case 0:
        PlaceStdMessageWindow(STDMESSAGE_INPUT_TEXT, 16);
        CopyWindowToVram(sWork->messageWindowId, COPYWIN_FULL);
        (*state)++;
        break;
    case 1:
        return IsDma3ManagerBusyWithBgCopy();
    }

    return TRUE;
}

static bool32 DisplaySubtask_PrintExitingChat(u8 *state)
{
    switch (*state)
    {
    case 0:
        PlaceStdMessageWindow(STDMESSAGE_EXITING_CHAT, 0);
        CopyWindowToVram(sWork->messageWindowId, COPYWIN_FULL);
        (*state)++;
        break;
    case 1:
        return IsDma3ManagerBusyWithBgCopy();
    }

    return TRUE;
}

static bool32 DisplaySubtask_PrintLeaderLeft(u8 *state)
{
    u8 *str;

    switch (*state)
    {
    case 0:
        DynamicPlaceholderTextUtil_Reset();
        str = UnionRoomChat_GetNameOfPlayerWhoDisbandedChat();
        DynamicPlaceholderTextUtil_SetPlaceholderPtr(0, str);
        PlaceStdMessageWindow(STDMESSAGE_LEADER_LEFT, 0);
        CopyWindowToVram(sWork->messageWindowId, COPYWIN_FULL);
        (*state)++;
        break;
    case 1:
        return IsDma3ManagerBusyWithBgCopy();
    }

    return TRUE;
}

static bool32 DisplaySubtask_AskSave(u8 *state)
{
    switch (*state)
    {
    case 0:
        PlaceStdMessageWindow(STDMESSAGE_ASK_SAVE, 0);
        PlaceYesNoMenuAt(23, 10, 1);
        CopyWindowToVram(sWork->messageWindowId, COPYWIN_FULL);
        (*state)++;
        break;
    case 1:
        return IsDma3ManagerBusyWithBgCopy();
    }

    return TRUE;
}

static bool32 DisplaySubtask_AskOverwriteSave(u8 *state)
{
    switch (*state)
    {
    case 0:
        PlaceStdMessageWindow(STDMESSAGE_ASK_OVERWRITE, 0);
        PlaceYesNoMenuAt(23, 10, 1);
        CopyWindowToVram(sWork->messageWindowId, COPYWIN_FULL);
        (*state)++;
        break;
    case 1:
        return IsDma3ManagerBusyWithBgCopy();
    }

    return TRUE;
}

static bool32 DisplaySubtask_PrintSavingDontTurnOffPower(u8 *state)
{
    switch (*state)
    {
    case 0:
        PlaceStdMessageWindow(STDMESSAGE_SAVING_NO_OFF, 0);
        CopyWindowToVram(sWork->messageWindowId, COPYWIN_FULL);
        (*state)++;
        break;
    case 1:
        return IsDma3ManagerBusyWithBgCopy();
    }

    return TRUE;
}

static bool32 DisplaySubtask_PrintSavedTheGame(u8 *state)
{
    switch (*state)
    {
    case 0:
        DynamicPlaceholderTextUtil_Reset();
        DynamicPlaceholderTextUtil_SetPlaceholderPtr(0, gSaveBlock2Ptr->playerName);
        PlaceStdMessageWindow(STDMESSAGE_SAVED_THE_GAME, 0);
        CopyWindowToVram(sWork->messageWindowId, COPYWIN_FULL);
        (*state)++;
        break;
    case 1:
        return IsDma3ManagerBusyWithBgCopy();
    }

    return TRUE;
}

static bool32 DisplaySubtask_ShowConfirmLeaderLeaveDialog(u8 *state)
{
    switch (*state)
    {
    case 0:
        PlaceStdMessageWindow(STDMESSAGE_WARN_LEADER_LEAVE, 0);
        PlaceYesNoMenuAt(23, 10, 1);
        CopyWindowToVram(sWork->messageWindowId, COPYWIN_FULL);
        (*state)++;
        break;
    case 1:
        return IsDma3ManagerBusyWithBgCopy();
    }

    return TRUE;
}

static bool32 DisplaySubtaskDummy(u8 *arg0)
{
    return FALSE;
}

static void PlaceYesNoMenuAt(u8 left, u8 top, u8 initialCursorPos)
{
    struct WindowTemplate template;
    template.bg = 0;
    template.tilemapLeft = left;
    template.tilemapTop = top;
    template.width = 6;
    template.height = 4;
    template.paletteNum = 14;
    template.baseBlock = 0x052;
    sWork->yesNoMenuWinId = AddWindow(&template);
    if (sWork->yesNoMenuWinId != 0xFF)
    {
        FillWindowPixelBuffer(sWork->yesNoMenuWinId, PIXEL_FILL(1));
        PutWindowTilemap(sWork->yesNoMenuWinId);
        AddTextPrinterParameterized(sWork->yesNoMenuWinId, FONT_NORMAL, gText_Yes, 8, 2, TEXT_SKIP_DRAW, NULL);
        AddTextPrinterParameterized(sWork->yesNoMenuWinId, FONT_NORMAL, gText_No, 8, 16, TEXT_SKIP_DRAW, NULL);
        DrawTextBorderOuter(sWork->yesNoMenuWinId, 1, 13);
        Menu_InitCursor(sWork->yesNoMenuWinId, FONT_NORMAL, 0, 2, 14, 2, initialCursorPos);
    }
}

static void HideYesNoMenuWindow(void)
{
    if (sWork->yesNoMenuWinId != 0xFF)
    {
        ClearStdWindowAndFrameToTransparent(sWork->yesNoMenuWinId, FALSE);
        ClearWindowTilemap(sWork->yesNoMenuWinId);
    }
}

static void DestroyYesNoMenuWindow(void)
{
    if (sWork->yesNoMenuWinId != 0xFF)
    {
        RemoveWindow(sWork->yesNoMenuWinId);
        sWork->yesNoMenuWinId = 0xFF;
    }
}

s8 UnionRoomChat_ProcessInput(void)
{
    return Menu_ProcessInput();
}

static void PlaceStdMessageWindow(int id, u16 bg0vofs)
{
    const u8 *str;
    int windowId;
    struct WindowTemplate template;
    template.bg = 0;
    template.tilemapLeft = 8;
    template.tilemapTop = 16;
    template.width = 21;
    template.height = 4;
    template.paletteNum = 14;
    template.baseBlock = 0x06A;
    if (sMessageWindowInfo[id].widerBox)
    {
        template.tilemapLeft -= 7;
        template.width += 7;
    }

    sWork->messageWindowId = AddWindow(&template);
    windowId = sWork->messageWindowId;
    if (sWork->messageWindowId == 0xFF)
        return;

    if (sMessageWindowInfo[id].expandPlaceholders)
    {
        DynamicPlaceholderTextUtil_ExpandPlaceholders(sWork->expandedPlaceholdersBuffer, sMessageWindowInfo[id].text);
        str = sWork->expandedPlaceholdersBuffer;
    }
    else
    {
        str = sMessageWindowInfo[id].text;
    }

    ChangeBgY(0, bg0vofs * 256, 0);
    FillWindowPixelBuffer(windowId, PIXEL_FILL(1));
    PutWindowTilemap(windowId);
    if (sMessageWindowInfo[id].boxType == 1)
    {
        DrawTextBorderInner(windowId, 0xA, 2);
        AddTextPrinterParameterized5(
            windowId,
            FONT_NORMAL,
            str,
            sMessageWindowInfo[id].x + 8,
            sMessageWindowInfo[id].y + 8,
            TEXT_SKIP_DRAW,
            NULL,
            sMessageWindowInfo[id].letterSpacing,
            sMessageWindowInfo[id].lineSpacing);
    }
    else
    {
        DrawTextBorderOuter(windowId, 0xA, 2);
        AddTextPrinterParameterized5(
            windowId,
            FONT_NORMAL,
            str,
            sMessageWindowInfo[id].x,
            sMessageWindowInfo[id].y,
            TEXT_SKIP_DRAW,
            NULL,
            sMessageWindowInfo[id].letterSpacing,
            sMessageWindowInfo[id].lineSpacing);
    }

    sWork->messageWindowId = windowId;
}

static void HideStdMessageWindow(void)
{
    if (sWork->messageWindowId != 0xFF)
    {
        ClearStdWindowAndFrameToTransparent(sWork->messageWindowId, FALSE);
        ClearWindowTilemap(sWork->messageWindowId);
    }

    ChangeBgY(0, 0, 0);
}

static void DestroyStdMessageWindow(void)
{
    if (sWork->messageWindowId != 0xFF)
    {
        RemoveWindow(sWork->messageWindowId);
        sWork->messageWindowId = 0xFF;
    }
}

static void FillWin1Rect(u16 x, u16 width, u8 fillValue)
{
    FillWindowPixelRect(1, fillValue, x * 8, 1, width * 8, 14);
}

static void PrintOnWin1Parameterized(u16 x, u8 *str, u8 bgColor, u8 fgColor, u8 shadowColor)
{
    u8 color[3];
    u8 strbuf[35];

    if (bgColor != TEXT_COLOR_TRANSPARENT)
        FillWin1Rect(x, UnionRoomChat_GetMessageEntryCursorPosition() - x, bgColor);

    color[0] = bgColor;
    color[1] = fgColor;
    color[2] = shadowColor;
    strbuf[0] = EXT_CTRL_CODE_BEGIN;
    strbuf[1] = EXT_CTRL_CODE_MIN_LETTER_SPACING;
    strbuf[2] = 8;
    StringCopy(&strbuf[3], str);
    AddTextPrinterParameterized3(1, FONT_NORMAL, x * 8, 1, color, TEXT_SKIP_DRAW, strbuf);
}

static void PrintCurrentKeyboardPage(void)
{
    u8 page;
    int i;
    u16 left;
    u16 top;
    u8 color[3];
    u8 str[45];
    u8 *str2;

    FillWindowPixelBuffer(2, PIXEL_FILL(15));
    page = GetCurrentKeyboardPage();
    color[0] = TEXT_COLOR_TRANSPARENT;
    color[1] = TEXT_DYNAMIC_COLOR_5;
    color[2] = TEXT_DYNAMIC_COLOR_4;
    if (page != UNION_ROOM_KB_PAGE_COUNT)
    {
        str[0] = EXT_CTRL_CODE_BEGIN;
        str[1] = EXT_CTRL_CODE_MIN_LETTER_SPACING;
        str[2] = 8;

        if (page == UNION_ROOM_KB_PAGE_EMOJI)
            left = 6;
        else
            left = 8;
        for (i = 0, top = 0; i < UNION_ROOM_KB_ROW_COUNT; i++, top += 12)
        {
            if (!gUnionRoomKeyboardText[page][i])
                return;

            StringCopy(&str[3], gUnionRoomKeyboardText[page][i]);
            AddTextPrinterParameterized3(2, FONT_SMALL, left, top, color, TEXT_SKIP_DRAW, str);
        }
    }
    else
    {
        left = 4;
        for (i = 0, top = 0; i < 10; i++, top += 12)
        {
            str2 = UnionRoomChat_GetWorkRegisteredText(i);
            if (GetStringWidth(FONT_SMALL, str2, 0) <= 40)
            {
                AddTextPrinterParameterized3(2, FONT_SMALL, left, top, color, TEXT_SKIP_DRAW, str2);
            }
            else
            {
                int length = StringLength_Multibyte(str2);
                do
                {
                    length--;
                    StringCopyN_Multibyte(str, str2, length);
                } while (GetStringWidth(FONT_SMALL, str, 0) > 35);

                AddTextPrinterParameterized3(2, FONT_SMALL, left, top, color, TEXT_SKIP_DRAW, str);
                AddTextPrinterParameterized3(2, FONT_SMALL, left + 35, top, color, TEXT_SKIP_DRAW, gText_Ellipsis);
            }
        }
    }
}

static bool32 AnimateMoveBg1Right(void)
{
    if (sWork->bg1hofs < 56)
    {
        sWork->bg1hofs += 12;
        if (sWork->bg1hofs >= 56)
            sWork->bg1hofs = 56;

        if (sWork->bg1hofs < 56)
        {
            FillScanlineEffectWithValue1col(sWork->bg1hofs);
            return TRUE;
        }
    }

    FillScanlineEffectWithValue2col(sWork->bg1hofs);
    return FALSE;
}

static bool32 AnimateMoveBg1Left(void)
{
    if (sWork->bg1hofs > 0)
    {
        sWork->bg1hofs -= 12;
        if (sWork->bg1hofs <= 0)
            sWork->bg1hofs = 0;

        if (sWork->bg1hofs > 0)
        {
            FillScanlineEffectWithValue1col(sWork->bg1hofs);
            return TRUE;
        }
    }

    FillScanlineEffectWithValue2col(sWork->bg1hofs);
    return FALSE;
}

static void PrintKeyboardSwapTextsOnWin3(void)
{
    FillWindowPixelBuffer(3, PIXEL_FILL(1));
    DrawTextBorderOuter(3, 1, 13);
    PrintMenuTable(3, FONT_NORMAL, 14, 5, sKeyboardSwapTexts);
    Menu_InitCursor(3, FONT_NORMAL, 0, 0, 14, 5, GetCurrentKeyboardPage());
    PutWindowTilemap(3);
}

static void ClearWin3(void)
{
    ClearStdWindowAndFrameToTransparent(3, FALSE);
    ClearWindowTilemap(3);
}

static void PrintTextOnWin0Colorized(u16 row, u8 *str, u8 colorIdx)
// colorIdx: 0 = grey, 1 = red, 2 = green, 3 = blue
{
    u8 color[3];
    color[0] = TEXT_COLOR_WHITE;
    color[1] = colorIdx * 2 + 2;
    color[2] = colorIdx * 2 + 3;
    FillWindowPixelRect(0, PIXEL_FILL(1), 0, row * 15, 168, 15);
    AddTextPrinterParameterized3(0, FONT_NORMAL, 0, row * 15, color, TEXT_SKIP_DRAW, str);
}

static void ResetGpuBgState(void)
{
    ChangeBgX(0, 0, 0);
    ChangeBgY(0, 0, 0);
    ChangeBgX(1, 0, 0);
    ChangeBgY(1, 0, 0);
    ChangeBgX(2, 0, 0);
    ChangeBgY(2, 0, 0);
    ChangeBgX(3, 0, 0);
    ChangeBgY(3, 0, 0);
    ShowBg(0);
    ShowBg(1);
    ShowBg(2);
    ShowBg(3);
    SetGpuRegBits(REG_OFFSET_DISPCNT, DISPCNT_OBJ_ON | DISPCNT_OBJ_1D_MAP);
    SetGpuReg(REG_OFFSET_BLDCNT, 0);
    ClearGpuRegBits(REG_OFFSET_DISPCNT, DISPCNT_WIN0_ON | DISPCNT_WIN1_ON | DISPCNT_OBJWIN_ON);
    SetGpuRegBits(REG_OFFSET_DISPCNT, DISPCNT_WIN0_ON);
    SetGpuReg(REG_OFFSET_WIN0H, WIN_RANGE(64, 240));
    SetGpuReg(REG_OFFSET_WIN0V, WIN_RANGE(0, 144));
    SetGpuReg(REG_OFFSET_WININ, WININ_WIN0_BG0 | WININ_WIN0_BG2 | WININ_WIN0_BG3
                                | WININ_WIN0_OBJ | WININ_WIN0_CLR);
    SetGpuReg(REG_OFFSET_WINOUT, WINOUT_WIN01_BG_ALL | WINOUT_WIN01_OBJ | WINOUT_WIN01_CLR);
}

static void SetBgTilemapWorkBuffers(void)
{
    SetBgTilemapBuffer(0, sWork->bg0Buffer);
    SetBgTilemapBuffer(1, sWork->bg1Buffer);
    SetBgTilemapBuffer(3, sWork->bg3Buffer);
    SetBgTilemapBuffer(2, sWork->bg2Buffer);
}

static void ClearBg0(void)
{
    RequestDma3Fill(0, (void *)BG_CHAR_ADDR(0), 0x20, DMA3_32BIT);
    FillBgTilemapBufferRect_Palette0(0, 0, 0, 0, 32, 32);
    CopyBgTilemapBufferToVram(0);
}

static void LoadUnionRoomChatPanelGfx(void)
{
    LoadPalette(gUnionRoomChat_Panel_Pal, BG_PLTT_ID(7), PLTT_SIZE_4BPP);
    LoadPalette(sUnionRoomChat_TextEntry_Pal, BG_PLTT_ID(12), PLTT_SIZE_4BPP);
    DecompressAndCopyTileDataToVram(1, gUnionRoomChat_Panel_Gfx, 0, 0, 0);
    CopyToBgTilemapBuffer(1, gUnionRoomChat_Panel_Tilemap, 0, 0);
    CopyBgTilemapBufferToVram(1);
}

static void LoadLinkMiscMenuGfx(void)
{
    u8 *ptr;

    LoadPalette(gUnionRoomChat_Bg_Pal, BG_PLTT_ID(0), PLTT_SIZE_4BPP);
    ptr = DecompressAndCopyTileDataToVram(2, gUnionRoomChat_Bg_Gfx, 0, 0, 0);
    CopyToBgTilemapBuffer(2, gUnionRoomChat_Bg_Tilemap, 0, 0);
    CopyBgTilemapBufferToVram(2);
}

static void LoadBg1Pal8(void)
{
    LoadPalette(gUnionRoomChat_Unused_Pal, BG_PLTT_ID(8), PLTT_SIZE_4BPP);
    RequestDma3Fill(0, (void *)BG_CHAR_ADDR(1) + 0x20, 0x20, DMA3_32BIT);
}

static void LoadWin0(void)
{
    LoadPalette(sUnionRoomChat_Messages_Pal, BG_PLTT_ID(15), PLTT_SIZE_4BPP);
    PutWindowTilemap(0);
    FillWindowPixelBuffer(0, PIXEL_FILL(1));
    CopyWindowToVram(0, COPYWIN_FULL);
}

static void LoadWin2(void)
{
    PutWindowTilemap(2);
    PrintCurrentKeyboardPage();
    CopyWindowToVram(2, COPYWIN_FULL);
}

static void LoadWin1(void)
{
    FillWindowPixelBuffer(1, PIXEL_FILL(0));
    PutWindowTilemap(1);
    CopyWindowToVram(1, COPYWIN_FULL);
}

static void LoadWin3(void)
{
    FillWindowPixelBuffer(3, PIXEL_FILL(1));
    LoadUserWindowGfx(3, 1, BG_PLTT_ID(13));
    LoadStdWindowGfx(3, 0xA, BG_PLTT_ID(2));
    LoadPalette(gStandardMenuPalette, BG_PLTT_ID(14),  PLTT_SIZE_4BPP);
}

static void InitScanlineEffect(void)
{
    struct ScanlineEffectParams params;
    params.dmaControl = SCANLINE_EFFECT_DMACNT_16BIT;
    params.dmaDest = &REG_BG1HOFS;
    params.initState = 1;
    params.unused9 = 0;
    sWork->bg1hofs = 0;
    CpuFastFill(0, gScanlineEffectRegBuffers, sizeof(gScanlineEffectRegBuffers));
    ScanlineEffect_SetParams(params);
}

static void FillScanlineEffectWithValue1col(s16 arg0)
{
    CpuFill16(arg0, gScanlineEffectRegBuffers[gScanlineEffect.srcBuffer], 0x120);
    CpuFill16(0, gScanlineEffectRegBuffers[gScanlineEffect.srcBuffer] + 0x90, 0x20);
}

static void FillScanlineEffectWithValue2col(s16 arg0)
{
    CpuFill16(arg0, gScanlineEffectRegBuffers[0],         0x120);
    CpuFill16(0,    gScanlineEffectRegBuffers[0] +  0x90, 0x20);
    CpuFill16(arg0, gScanlineEffectRegBuffers[0] + 0x3C0, 0x120);
    CpuFill16(0,    gScanlineEffectRegBuffers[0] + 0x450, 0x20);
}
