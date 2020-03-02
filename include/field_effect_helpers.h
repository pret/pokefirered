//
// Created by scott on 9/7/2017.
//

#ifndef GUARD_FIELD_EFFECT_HELPERS_H
#define GUARD_FIELD_EFFECT_HELPERS_H

#include "global.h"

// Exported type declarations

// Exported RAM declarations

// Exported ROM declarations
u8 sub_8154228(void);
bool8 sub_80DCBE0(struct ObjectEvent *);
void sub_80DC44C(u8, u8);
void sub_80DC478(u8, u8);
void StartAshFieldEffect(s16, s16, u16, s16);

#endif //GUARD_FIELD_EFFECT_HELPERS_H
