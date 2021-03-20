#ifndef GUARD_BLEND_PALETTE_H
#define GUARD_BLEND_PALETTE_H

#include "global.h"

// Exported type declarations

// Exported RAM declarations

// Exported ROM declarations

void BlendPalette(u16, u16, u8, u16);
void BlendPalettesAt(u16 * palbuff, u16 blend_pal, u32 coefficient, s32 size);

#endif //GUARD_BLEND_PALETTE_H
