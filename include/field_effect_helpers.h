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
void StartAshFieldEffect(s16, s16, u16, s16);
void sub_80DCBB8(struct ObjectEvent *);
bool8 sub_80DCBE0(struct ObjectEvent *);

#endif //GUARD_FIELD_EFFECT_HELPERS_H
