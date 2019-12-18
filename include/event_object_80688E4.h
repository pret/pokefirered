#ifndef GUARD_EVENT_OBJECT_80688E4_H
#define GUARD_EVENT_OBJECT_80688E4_H

#include "global.h"

void FreezeObjectEvents(void);
void FreezeObjectEvent(struct ObjectEvent *);
void FreezeObjectEventsExceptOne(u8 objEventId);

#endif // GUARD_EVENT_OBJECT_80688E4_H
