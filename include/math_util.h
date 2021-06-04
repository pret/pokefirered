#ifndef GUARD_MATH_UTIL_H
#define GUARD_MATH_UTIL_H

// Fixed-point arithmetic library.

// x * y
s16 Q_8_8_mul(s16 x, s16 y);
s16 Q_N_S_mul(u8 s, s16 x, s16 y);
s32 Q_24_8_mul(s32 x, s32 y);

// x / y
s16 Q_8_8_div(s16 x, s16 y);
s16 Q_N_S_div(u8 s, s16 x, s16 y);
s32 Q_24_8_div(s32 x, s32 y);

// 1.0 / y
s16 Q_8_8_inv(s16 y);
s16 Q_N_S_inv(u8 s, s16 y);
s32 Q_24_8_inv(s32 y);

#endif //GUARD_MATH_UTIL_H
