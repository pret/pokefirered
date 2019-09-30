#ifndef GUARD_BERRY_POUCH_H
#define GUARD_BERRY_POUCH_H

#include "task.h"

void BerryPouch_StartFadeToExitCallback(u8 taskId);
void BerryPouch_SetExitCallback(void (*)(void));
void InitBerryPouch(u8, void (*)(void), u8);
void DisplayItemMessageInBerryPouch(u8 taskId, u8 fontId, const u8 * str, TaskFunc followUpFunc);
void sub_813E2B8(u8 taskId);

#endif //GUARD_BERRY_POUCH_H
