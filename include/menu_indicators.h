#ifndef GUARD_MENU_INDICATORS_H
#define GUARD_MENU_INDICATORS_H

#include "global.h"

// Exported type declarations

// Exported RAM declarations

struct ScrollIndicatorArrowPairTemplate
{
    u8 unk_00;
    u8 unk_01;
    u8 unk_02;
    u8 unk_03;
    u8 unk_04;
    u8 unk_05;
    u16 unk_06;
    u16 unk_08;
    u16 unk_0a;
    u16 unk_0c;
    u16 unk_0e_0:4;
    u16 unk_0e_4:12;
};

// Exported ROM declarations
u8 AddScrollIndicatorArrowPairParametrized(u8, u8, u8, u8, s32, u16, u16, u16 *);
u8 AddScrollIndicatorArrowPair(const struct ScrollIndicatorArrowPairTemplate * template, u16 * a1);
void RemoveScrollIndicatorArrowPair(u8);

#endif //GUARD_MENU_INDICATORS_H
