#ifndef GUARD_LIST_MENU_H
#define GUARD_LIST_MENU_H

#include "global.h"

// Exported type declarations

// Exported RAM declarations

struct ListMenuItem
{
    const u8 *unk_00;
    s32 unk_04;
};

struct ListMenu;

struct ListMenuTemplate
{
    const struct ListMenuItem *items;
    void (* moveCursorFunc)(s32 itemIndex, bool8 onInit, struct ListMenu *list);
    void (* itemPrintFunc)(u8 windowId, s32 itemId, u8 y);
    u16 totalItems;
    u16 maxShowed;
    u8 windowId;
    u8 header_X;
    u8 item_X;
    u8 cursor_X;
    u8 upText_Y:4; // x1, x2, x4, x8 = xF
    u8 cursorPal:4; // x10, x20, x40, x80 = xF0
    u8 fillValue:4; // x1, x2, x4, x8 = xF
    u8 cursorShadowPal:4; // x10, x20, x40, x80 = xF0
    u8 lettersSpacing:3;
    u8 itemVerticalPadding:3;
    u8 scrollMultiple:2; // x40, x80 = xC0
    u8 fontId:6; // x1, x2, x4, x8, x10, x20 = x3F
    u8 cursorKind:2; // x40, x80
};

struct ListMenu {
    struct ListMenuTemplate _template;
    u16 scrollOffset;
    u16 selectedRow;
    u8 unk_1C;
    u8 unk_1D;
    u8 unk_1E;
    u8 unk_1F;
};

extern struct ListMenuTemplate gUnknown_03006310;
extern struct ListMenuTemplate gUnknown_3005E70;

// Exported ROM declarations

u8 ListMenuInit(struct ListMenuTemplate *template, u16 a1, u16 a2);
s32 ListMenuHandleInput(u8 id);
void get_coro_args_x18_x1A(u8 a0, u16 *a1, u16 *a2);
void sub_81AE6C8(u8 a0, u16 *a1, u16 *a2);
void sub_810713C(u8, u16 *, u16 *);
u16 ListMenuGetYCoordForPrintingArrowCursor(u8);
void sub_8107D38(u8, u8);
void sub_8107D68(u8, u8, u8, u8);

#endif //GUARD_LIST_MENU_H
