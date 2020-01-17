#ifndef GUARD_BAG_H
#define GUARD_BAG_H

#include "menu_helpers.h"

void sub_810B858(void);
void sub_810B8F0(u8 windowId, u8 fontId, const u8 * str, u8 x, u8 y, u8 letterSpacing, u8 lineSpacing, s8 speed, u8 colorIdx);
void sub_810B958(const u8 * str);
void sub_810B994(void);
u8 sub_810B9DC(u8 a0, u8 a1);
void sub_810BA3C(u8 a0);
u8 sub_810BA70(u8 a0);
void sub_810BA9C(u8 a0);
u8 sub_810BAD8(u8 a0);
void sub_810BAE8(u8 taskId, const struct YesNoFuncTable * ptrs);
void sub_810BB14(u8 taskId, const struct YesNoFuncTable * ptrs);
void sub_810BB40(void);
void sub_810BB74(u8 windowId);

#endif //GUARD_BAG_H
