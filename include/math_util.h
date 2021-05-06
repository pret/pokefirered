#ifndef GUARD_MATH_UTIL_H
#define GUARD_MATH_UTIL_H

// Fixed-point arithmetic library.

// Proposed TODO: Move the macros here from global.h
typedef s16 fx16;  // Fixed-point Q8.8
typedef s16 fxn16; // Fixed-point with arbitrary precision (QN.S)
typedef s32 fx32;  // Fixed-point Q24.8

// x * y
fx16 mulfx16(fx16 x, fx16 y);
fxn16 mulfxn16(u8 s, fxn16 x, fxn16 y);
fx32 mulfx32(fx32 x, fx32 y);

// x / y
fx16 divfx16(fx16 x, fx16 y);
fxn16 divfxn16(u8 s, fxn16 x, fxn16 y);
fx32 divfx32(fx32 x, fx32 y);

// 1.0 / y
fx16 invfx16(fx16 y);
fxn16 invfxn16(u8 s, fxn16 y);
fx32 invfx32(fx32 y);

#endif //GUARD_MATH_UTIL_H
