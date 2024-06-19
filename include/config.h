#ifndef GUARD_CONFIG_H
#define GUARD_CONFIG_H

// In the Generation 3 games, Asserts were used in various debug builds.
// Ruby/Sapphire and Emerald do not have these asserts while Fire Red
// still has them in the ROM. This is because the developers forgot
// to define NDEBUG before release, however this has been changed as
// Ruby's actual debug build does not use the AGBPrint features.
// #define NDEBUG

// Fire Red likely forgot to define NDEBUG/NOAGBPRN before release, leading
// to the inclusion of asserts in the retail ROM.

#ifndef NDEBUG
#define PRETTY_PRINT_OFF (0)
#define PRETTY_PRINT_MINI_PRINTF (1)
#define PRETTY_PRINT_LIBC (2)

#define LOG_HANDLER_AGB_PRINT (0)
#define LOG_HANDLER_NOCASH_PRINT (1)
#define LOG_HANDLER_MGBA_PRINT (2)

// Use this switch to choose a handler for pretty printing.
// NOTE: mini_printf supports a custom pretty printing formatter to display preproc encoded strings. (%S)
//       some libc distributions (especially dkp arm-libc) will fail to link pretty printing.
#define PRETTY_PRINT_HANDLER (PRETTY_PRINT_MINI_PRINTF)

// Use this switch to choose a handler for printf output.
// NOTE: These will only work on the respective emulators and should not be used in a productive environment.
//       Some emulators or real hardware might (and is allowed to) crash if they are used.
//       AGB_PRINT is supported on respective debug units.

#define LOG_HANDLER (LOG_HANDLER_MGBA_PRINT)
#endif // NDEBUG

// Uncomment to fix some identified minor bugs
#define BUGFIX

// Define the game version for use elsewhere
#if defined(FIRERED)
#define GAME_VERSION VERSION_FIRE_RED
#else // Default version seems to be LeafGreen
#define GAME_VERSION VERSION_LEAF_GREEN
#endif // GAME_VERSION

// rev1 renamed the source folder for reasons
#define CODE_ROOT "C:/WORK/POKeFRLG/Src/pm_lgfr_ose/source/"
#define ABSPATH(x) (CODE_ROOT x)

// Various undefined behavior bugs may or may not prevent compilation with
// newer compilers. So always fix them when using a modern compiler.
#if MODERN || defined(BUGFIX)
#ifndef UBFIX
#define UBFIX
#endif
#endif

// Generation constants used in configs to define behavior
#define GEN_1 0
#define GEN_2 1
#define GEN_3 2
#define GEN_4 3
#define GEN_5 4
#define GEN_6 5
#define GEN_7 6
#define GEN_8 7
#define GEN_9 8
#define GEN_LATEST GEN_9

// General settings
#define EXPANSION_INTRO              TRUE    // If TRUE, a custom RHH intro will play after the vanilla copyright screen.
#define POKEDEX_PLUS_HGSS            FALSE   // If TRUE, enables the custom HGSS style Pokedex.
#define SUMMARY_SCREEN_NATURE_COLORS TRUE    // If TRUE, nature-based stat boosts and reductions will be red and blue in the summary screen.
#define HQ_RANDOM                    TRUE    // If TRUE, replaces the default RNG with an implementation of SFC32 RNG. May break code that relies on RNG.

// Measurement system constants to be used for UNITS
#define UNITS_IMPERIAL               0       // Inches, feet, pounds
#define UNITS_METRIC                 1       // meters, kilograms

#define UNITS                        UNITS_METRIC
#define CHAR_DEC_SEPARATOR           CHAR_PERIOD // CHAR_PERIOD is used as a decimal separator only in the UK and the US. The rest of the world uses CHAR_COMMA.

#endif // GUARD_CONFIG_H
