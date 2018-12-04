#ifndef GUARD_MYSTERY_EVENT_SCRIPT_H
#define GUARD_MYSTERY_EVENT_SCRIPT_H

#include "global.h"

u32 RunMysteryEventScript(u8 *);
void SetMysteryEventScriptStatus(u32 val);
u16 GetRecordMixingGift(void);

void sub_80DA89C(u8 *);
bool32 sub_80DA8B0(u32 *);

#endif // GUARD_MYSTERY_EVENT_SCRIPT_H
