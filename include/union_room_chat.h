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

void sub_8128420(void);
u8 *sub_81294B0(int arg0);
void sub_8129700(u8 *arg0, u8 *arg1);
u8 *sub_8129714(void);
int sub_8129720(void);
void sub_8129730(u32 *a0, u32 *a1);
u8 *sub_8129758(void);
u16 sub_8129788(void);
u8 *sub_81297C4(void);
u16 sub_81297D0(void);
int sub_81297DC(void);
int sub_81297E8(void);
u8 *sub_8129814(void);
void copy_strings_to_sav1(void);
u8 GetCurrentKeyboardPage(void);

#endif // GUARD_UNION_ROOM_CHAT_H
