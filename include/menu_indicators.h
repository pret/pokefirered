#ifndef GUARD_MENU_INDICATORS_H
#define GUARD_MENU_INDICATORS_H

#include "global.h"

// Exported type declarations

// Exported RAM declarations

struct ScrollIndicatorArrowPairTemplate
{
    u8 filler_00[6];
    u16 unk_06;
    u16 unk_08;
    u8 filler_0a[6];
};

// Exported ROM declarations
u8 AddScrollIndicatorArrowPairParametrized(u8, u8, u8, u8, s32, u16, u16, u16 *);
u8 AddScrollIndicatorArrowPair(const struct ScrollIndicatorArrowPairTemplate * template, u16 * a1);
void RemoveScrollIndicatorArrowPair(u8);

#endif //GUARD_MENU_INDICATORS_H
