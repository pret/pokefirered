#ifndef GUARD_MYSTERY_EVENT_SCRIPT_H
#define GUARD_MYSTERY_EVENT_SCRIPT_H

#include "global.h"

u32 RunMysteryEventScript(u8 *);
void SetMysteryEventScriptStatus(u32 val);

void MEventScript_InitContext(u8 *);
bool32 MEventScript_Run(u32 *);

#endif // GUARD_MYSTERY_EVENT_SCRIPT_H
