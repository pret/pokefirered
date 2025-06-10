#ifndef GUARD_DEXNAV_H
#define GUARD_DEXNAV_H

#include "global.h"

/**
 * \file dexnav.h
 * \brief Contains a significant improvement of the DexNav system created by FBI on Pokecommunity:
 *		  https://www.pokecommunity.com/showthread.php?p=9998647
 */

//Exported Functions
void InitDexNavHUD(u16 species, u8 environment);
bool8 IsDexNavHudActive(void);
void TryFreeDexnavState(void);
u8 GetPlayerDistance(s16 x, s16 y);

//Functions Hooked In
u8 SelectHookRestore(void);
u8 StartMenuDexNavCallback(void);

#define TILE_FLAG_ENCOUNTER_TILE 1
#define TILE_FLAG_SURFABLE 2
#define TILE_FLAG_WILD_DOUBLE 4
#define TILE_FLAG_SHAKING 8

#define ENCOUNTER_TYPE_LAND 0
#define ENCOUNTER_TYPE_WATER 1

#define SPRITE_RAM 0x6010000

extern u8 gCurrentDexNavChain;
extern bool8 gDexNavStartedBattle;

#endif // GUARD_DEXNAV_H