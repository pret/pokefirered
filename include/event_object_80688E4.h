#ifndef GUARD_EVENT_OBJECT_80688E4_H
#define GUARD_EVENT_OBJECT_80688E4_H

#include "global.h"

void FreezeObjectEvents(void);
void FreezeObjectEvent(struct ObjectEvent *);
void FreezeObjectEventsExceptOne(u8 objEventId);
void sub_8069124(u8 a0, bool8 a1);
u32 sub_806916C(u8 a0);
void sub_80691A4(u8 a0, u8 a1);
void sub_8069094(u8 a0, u8 a1);
bool32 sub_8069294(u8 a0);
void sub_8068BBC(struct Sprite *, u8);
void sub_8068C58(struct Sprite *, u8);
void sub_8068C08(struct Sprite *, u8);
bool8 sub_8068C68(struct Sprite *sprite);
bool8 sub_8068C18(struct Sprite *sprite);
void sub_8068CA4(struct Sprite *, u8);
bool8 obj_npc_ministep(struct Sprite *sprite);
bool8 sub_8068CB4(struct Sprite *sprite);
void SetAndStartSpriteAnim(struct Sprite *, u8, u8);
bool8 SpriteAnimEnded(struct Sprite *);
void SetMovementDelay(struct Sprite *, s16);
bool8 WaitForMovementDelay(struct Sprite *);
void UpdateObjectEventSpriteSubpriorityAndVisibility(struct Sprite *);

#endif // GUARD_EVENT_OBJECT_80688E4_H
