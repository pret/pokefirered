//
// Created by scott on 9/7/2017.
//

#ifndef GUARD_FIELD_EFFECT_HELPERS_H
#define GUARD_FIELD_EFFECT_HELPERS_H

#include "global.h"

// Exported type declarations

// Exported RAM declarations

// Exported ROM declarations

u8 CreateWarpArrowSprite(void);
void sub_80DC44C(u8, u8);
void sub_80DC478(u8, u8);
void StartAshFieldEffect(s16, s16, u16, s16);
void sub_80DCBB8(struct ObjectEvent *);
bool8 sub_80DCBE0(struct ObjectEvent *);
void SetUpReflection(struct ObjectEvent*, struct Sprite*, u8);
u32 StartFieldEffectForObjectEvent(u8, struct ObjectEvent*);
u8 FindTallGrassFieldEffectSpriteId(u8 localId, u8 mapNum, u8 mapGroup, s16 x, s16 y);
void ShowWarpArrowSprite(u8 spriteId, u8 direction, s16 x, s16 y);
void SetSpriteInvisible(u8 spriteId);
void sub_80DC4A4(u8 spriteId, u8 value, s16 data1);

#endif //GUARD_FIELD_EFFECT_HELPERS_H
