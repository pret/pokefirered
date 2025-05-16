#ifndef GUARD_CONSTANTS_DEXNAV_H
#define GUARD_CONSTANTS_DEXNAV_H

/**
 * \file dexnav_config.h
 * \brief A file to be included only by "src/dexnav.c". It contains various customizable
 *		  options for the DexNav feature.
 */

//15 seconds is the time out. Max of 1092 seconds allowed
#define DEXNAV_TIMEOUT 15

//Tile amount
#define SNEAKING_PROXIMITY 5

//Chance of encountering egg move at search levels
#define SEARCHLEVEL0_MOVECHANCE 0
#define SEARCHLEVEL5_MOVECHANCE 21
#define SEARCHLEVEL10_MOVECHANCE 46
#define SEARCHLEVEL25_MOVECHANCE 58
#define SEARCHLEVEL50_MOVECHANCE 63
#define SEARCHLEVEL100_MOVECHANCE 83

//Chance of encountering Hidden Abilities at search levels
#define SEARCHLEVEL0_ABILITYCHANCE 0
#define SEARCHLEVEL5_ABILITYCHANCE 0
#define SEARCHLEVEL10_ABILITYCHANCE 5
#define SEARCHLEVEL25_ABILITYCHANCE 15
#define SEARCHLEVEL50_ABILITYCHANCE 20
#define SEARCHLEVEL100_ABILITYCHANCE 23

//Chance of encountering held item
#define SEARCHLEVEL0_ITEM 0
#define SEARCHLEVEL5_ITEM 0
#define SEARCHLEVEL10_ITEM 1
#define SEARCHLEVEL25_ITEM 7
#define SEARCHLEVEL50_ITEM 6
#define SEARCHLEVEL100_ITEM 12

//Chance of encountering one star potential
#define SEARCHLEVEL0_ONESTAR 0
#define SEARCHLEVEL5_ONESTAR 14
#define SEARCHLEVEL10_ONESTAR 17
#define SEARCHLEVEL25_ONESTAR 17
#define SEARCHLEVEL50_ONESTAR 15
#define SEARCHLEVEL100_ONESTAR 8

//Chance of encountering two star potential
#define SEARCHLEVEL0_TWOSTAR 0
#define SEARCHLEVEL5_TWOSTAR 1
#define SEARCHLEVEL10_TWOSTAR 9
#define SEARCHLEVEL25_TWOSTAR 16
#define SEARCHLEVEL50_TWOSTAR 17
#define SEARCHLEVEL100_TWOSTAR 24

//Chance of encountering three star potential
#define SEARCHLEVEL0_THREESTAR 0
#define SEARCHLEVEL5_THREESTAR 0
#define SEARCHLEVEL10_THREESTAR 1
#define SEARCHLEVEL25_THREESTAR 7
#define SEARCHLEVEL50_THREESTAR 6
#define SEARCHLEVEL100_THREESTAR 12

#endif // GUARD_CONSTANTS_DEXNAV_H