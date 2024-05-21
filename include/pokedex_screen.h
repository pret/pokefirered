#ifndef GUARD_POKEDEX_SCREEN_H
#define GUARD_POKEDEX_SCREEN_H

#define DEX_CATEGORY_GRASSLAND          0
#define DEX_CATEGORY_FOREST             1
#define DEX_CATEGORY_WATERS_EDGE        2
#define DEX_CATEGORY_SEA                3
#define DEX_CATEGORY_CAVE               4
#define DEX_CATEGORY_MOUNTAIN           5
#define DEX_CATEGORY_ROUGH_TERRAIN      6
#define DEX_CATEGORY_URBAN              7
#define DEX_CATEGORY_RARE               8
#define DEX_ORDER_NUMERICAL_KANTO       9
#define DEX_ORDER_ATOZ                  10
#define DEX_ORDER_TYPE                  11
#define DEX_ORDER_LIGHTEST              12
#define DEX_ORDER_SMALLEST              13
#define DEX_ORDER_NUMERICAL_NATIONAL    14

#define DEX_ORDER_START DEX_ORDER_NUMERICAL_KANTO

#include "pokedex.h"

void CB2_OpenPokedexFromStartMenu(void);
s8 DexScreen_GetSetPokedexFlag(u16 nationalDexNo, u8 caseId, bool8 indexIsSpecies);

#endif //GUARD_POKEDEX_SCREEN_H
