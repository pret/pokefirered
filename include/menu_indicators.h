#ifndef GUARD_MENU_INDICATORS_H
#define GUARD_MENU_INDICATORS_H

#include "global.h"

// Exported type declarations

// Exported RAM declarations

struct ScrollArrowsTemplate
{
    u8 firstArrowType;
    u8 firstX;
    u8 firstY;
    u8 secondArrowType;
    u8 secondX;
    u8 secondY;
    u16 fullyUpThreshold;
    u16 fullyDownThreshold;
    u16 tileTag;
    u16 palTag;
    u8 palNum;
};

// Exported ROM declarations
u8 AddScrollIndicatorArrowPairParameterized(u8, u8, u8, u8, s32, u16, u16, u16 *);
u8 AddScrollIndicatorArrowPair(const struct ScrollArrowsTemplate * template, u16 * a1);
void RemoveScrollIndicatorArrowPair(u8);

#endif //GUARD_MENU_INDICATORS_H
