#ifndef GUARD_EVENT_OBJECT_80688E4_H
#define GUARD_EVENT_OBJECT_80688E4_H

#include "global.h"

void FreezeObjectEvents(void);
bool8 FreezeObjectEvent(struct ObjectEvent *);
void FreezeObjectEventsExceptOne(u8 objEventId);
void RfuUnionObjectSetFacingDirection(u8 objectEventId, u8 direction);
void RfuUnionObjectToggleInvisibility(u8 objectEventId, bool32 invisible);
bool32 RfuUnionObjectIsInvisible(u8 objectEventId);
void RfuUnionObjectStartWarp(u8 objectEventId, u8 animNo);
bool32 RfuUnionObjectIsWarping(u8 objectEventId);

#endif // GUARD_EVENT_OBJECT_80688E4_H
