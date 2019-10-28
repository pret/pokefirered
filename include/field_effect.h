#ifndef GUARD_FIELD_EFFECTS_H
#define GUARD_FIELD_EFFECTS_H

#include "global.h"
#include "constants/field_effects.h"

extern u32 gFieldEffectArguments[8];
extern void (*gPostMenuFieldCallback)(void);
extern bool8 (*gFieldCallback2)(void);

u8 FieldEffectStart(u8);
bool8 FieldEffectActiveListContains(u8 id);
void sub_80B69DC(void);
void CreateTeleportFieldEffectTask(void);
void FieldEffectActiveListRemove(u8 id);
void sub_8085620(void);
void FieldEffectStop(struct Sprite *sprite, u8 id);
u8 CreateTrainerSprite(u8 trainerSpriteID, s16 x, s16 y, u8 subpriority, u8 *buffer);
void sub_8084454(void);
void sub_8084784(u8 a0, u8 a1);
void sub_8084F2C(u8 a0);
void sub_80853CC(u8 a0);
void sub_8083598(u8 a0);
void sub_8083A5C(struct Sprite * sprite, u8 spriteId);
u8 sub_8083970(u16 species, s16 x, s16 y, bool8 unused);

#endif //GUARD_FIELD_EFFECTS_H
