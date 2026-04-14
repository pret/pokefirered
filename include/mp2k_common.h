#ifndef MP2020_COMMON_H
#define MP2020_COMMON_H

#ifndef __has_builtin
#define __has_builtin(x) defined(__GNUC__)
#endif

#if ((-1 >> 1) == -1) && __has_builtin(__builtin_ctz)
#define FLOOR_DIV_POW2(a, b) ((a) >> __builtin_ctz(b))
#else
#define FLOOR_DIV_POW2(a, b) ((a) > 0 ? (a) / (b) : (((a) + 1 - (b)) / (b)))
#endif

#define NOT_GBA_BIOS
#define NOT_GBA
//#define ORIGINAL_COARSE_POSITION_CLEARING
#define POKEMON_EXTENSIONS

#endif
