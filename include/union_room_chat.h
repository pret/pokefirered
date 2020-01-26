#ifndef GUARD_UNION_ROOM_CHAT_H
#define GUARD_UNION_ROOM_CHAT_H

enum
{
    UNION_ROOM_KB_PAGE_UPPER,
    UNION_ROOM_KB_PAGE_LOWER,
    UNION_ROOM_KB_PAGE_EMOJI,
    UNION_ROOM_KB_PAGE_COUNT
};

extern const u8 *const gUnionRoomKeyboardText[UNION_ROOM_KB_PAGE_COUNT][UNION_ROOM_KB_ROW_COUNT];

void EnterUnionRoomChat(void);
u8 *UnionRoomChat_GetWorkRegisteredText(int arg0);
void UnionRoomChat_GetCursorColAndRow(u8 *colp, u8 *rowp);
u8 *UnionRoomChat_GetMessageEntryBuffer(void);
int UnionRoomChat_LenMessageEntryBuffer(void);
void UnionRoomChat_GetBufferSelectionRegion(u32 *startp, u32 *diffp);
u8 *UnionRoomChat_GetEndOfMessageEntryBuffer(void);
u16 UnionRoomChat_GetNumCharsInMessageEntryBuffer(void);
u8 *UnionRoomChat_GetLastReceivedMessage(void);
u16 UnionRoomChat_GetReceivedPlayerIndex(void);
int UnionRoomChat_GetMessageEntryCursorPosition(void);
int UnionRoomChat_GetWhetherShouldShowCaseToggleIcon(void);
u8 *UnionRoomChat_GetNameOfPlayerWhoDisbandedChat(void);
void UnionRoomChat_InitializeRegisteredTexts(void);
u8 GetCurrentKeyboardPage(void);

#endif // GUARD_UNION_ROOM_CHAT_H
