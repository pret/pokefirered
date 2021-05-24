#ifndef GUARD_MATH_UTIL_H
#define GUARD_MATH_UTIL_H

// Fixed-point arithmetic library.

// Proposed TODO: Move the macros here from global.h
typedef s16 fx16;  // Fixed-point Q8.8
typedef s16 fxn16; // Fixed-point with arbitrary precision (QN.S)
typedef s32 fx32;  // Fixed-point Q24.8

// x * y
fx16 Q_8_8_mul(fx16 x, fx16 y);
fxn16 Q_N_S_mul(u8 s, fxn16 x, fxn16 y);
fx32 Q_24_8_mul(fx32 x, fx32 y);

// x / y
fx16 Q_8_8_div(fx16 x, fx16 y);
fxn16 Q_N_S_div(u8 s, fxn16 x, fxn16 y);
fx32 Q_24_8_div(fx32 x, fx32 y);

// 1.0 / y
fx16 Q_8_8_inv(fx16 y);
fxn16 Q_N_S_inv(u8 s, fxn16 y);
fx32 Q_24_8_inv(fx32 y);

#endif //GUARD_MATH_UTIL_H
