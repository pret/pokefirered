#ifndef GUARD_EVENT_OBJECT_80688E4_H
#define GUARD_EVENT_OBJECT_80688E4_H

#include "global.h"

void FreezeObjectEvents(void);
bool8 FreezeObjectEvent(struct ObjectEvent *);
void FreezeObjectEventsExceptOne(u8 objEventId);
void sub_8069124(u8 a0, bool32 a1);
u32 sub_806916C(u8 a0);
void sub_80691A4(u8 a0, u8 a1);
void sub_8069094(u8 a0, u8 a1);
bool32 sub_8069294(u8 a0);

#endif // GUARD_EVENT_OBJECT_80688E4_H
