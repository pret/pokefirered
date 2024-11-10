#ifndef GUARD_POKEMON_GROUPS_H
#define GUARD_POKEMON_GROUPS_H

#include "global.h"

u32 GameHash();
u32 MapHash();
u32 HashCombine(u32 h1, u32 h2);
u16 GetSpeciesFromGroup(u16 species, u16 manual_random);

#endif // GUARD_POKEMON_GROUPS_H
