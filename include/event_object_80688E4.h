#ifndef GUARD_EVENT_OBJECT_80688E4_H
#define GUARD_EVENT_OBJECT_80688E4_H

#include "global.h"

void FreezeObjectEvents(void);
bool8 FreezeObjectEvent(struct ObjectEvent *);
void FreezeObjectEventsExceptOne(u8 objEventId);
void RfuUnionObjectToggleInvisibility(u8 a0, bool32 a1);
u32 RfuUnionObjectIsInvisible(u8 a0);
void RfuUnionObjectStartWarp(u8 a0, u8 a1);
void RfuUnionObjectSetFacingDirection(u8 a0, u8 a1);
bool32 RfuUnionObjectIsWarping(u8 a0);

#endif // GUARD_EVENT_OBJECT_80688E4_H
