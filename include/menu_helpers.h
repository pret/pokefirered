#ifndef GUARD_MENU_HELPERS_H
#define GUARD_MENU_HELPERS_H

#include "global.h"

// Exported type declarations

struct YesNoFuncTable {
    TaskFunc yesFunc;
    TaskFunc noFunc;
};

// Exported RAM declarations

// Exported ROM declarations

void sub_812225C(u16 *, u16 *, u8, u8);
void sub_8122298(u16 *, u16 *, u8, u8, u8);
void sub_8121F68(u8 taskId, const struct YesNoFuncTable *data);
bool8 sub_81221AC(void);
bool8 sub_80BF72C(void);
bool8 sub_80BF708(void);
void sub_80BF768(void);
void sub_80BF7C8(void);

#endif //GUARD_MENU_HELPERS_H
