#ifndef GUARD_CONFIG_H
#define GUARD_CONFIG_H

#include "global.h"

// In the Generation 3 games, Asserts were used in various debug builds.
// Ruby/Sapphire and Emerald do not have these asserts while Fire Red
// still has them in the ROM. This is because the developers forgot
// to define NDEBUG before release, however this has been changed as
// Ruby's actual debug build does not use the AGBPrint features.
// #define NDEBUG

// Fire Red likely forgot to define NDEBUG/NOAGBPRN before release, leading
// to the inclusion of asserts in the retail ROM.

// Define the game version for use elsewhere
#if defined(FIRERED)
#define GAME_VERSION VERSION_FIRE_RED
#else // Default version seems to be LeafGreen
#define GAME_VERSION VERSION_LEAF_GREEN
#endif // GAME_VERSION

// rev1 renamed the source folder for reasons
#if REVISION == 0
#define CODE_ROOT "C:/WORK/POKeFRLG/src/pm_lgfr_ose/source/"
#else
#define CODE_ROOT "C:/WORK/POKeFRLG/Src/pm_lgfr_ose/source/"
#endif // REVISION

#define ABSPATH(x) (CODE_ROOT x)

#ifdef ENGLISH
#define UNITS_IMPERIAL
#else
#define UNITS_METRIC
#endif // ENGLISH

// Crashes may occur due to section reordering in the modern build,
// so we force BUGFIX here.
#if MODERN
#ifndef BUGFIX
#define BUGFIX
#endif // BUGFIX
#ifndef UBFIX
#define UBFIX
#endif // UBFIX
#endif // MODERN

#endif // GUARD_CONFIG_H
