#ifndef GUARD_EVENT_OBJECT_LOCK_H
#define GUARD_EVENT_OBJECT_LOCK_H

#include "global.h"

bool8 IsFreezePlayerFinished(void);
void FreezeObjects_WaitForPlayer(void);
bool8 IsFreezeSelectedObjectAndPlayerFinished(void);
void FreezeObjects_WaitForPlayerAndSelected(void);
void ClearPlayerHeldMovementAndUnfreezeObjectEvents(void);
bool8 walkrun_is_standing_still(void);
void UnionRoom_UnlockPlayerAndChatPartner(void);

#endif // GUARD_EVENT_OBJECT_LOCK_H
