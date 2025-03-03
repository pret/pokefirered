#ifndef GUARD_POKEMON_GROUPS_H
#define GUARD_POKEMON_GROUPS_H

#include "global.h"

#define RAND_INPUT_PICK_1 0
#define RAND_INPUT_PICK_2 1
#define RAND_INPUT_MANUAL(x) (x <= 1 ? 2 : x)

u32 GameHash();
u32 MapHashFromMapId(bool8 fine, u8 mapGroup, u8 mapNump);
u32 MapHash();
u32 CoarseMapHash();
u16 IndexInto(const u16 *group, u32 hash);
u32 HashCombine(u32 h1, u32 h2);
u16 GetSpeciesFromGroup(u16 species, u16 randInput);

#endif // GUARD_POKEMON_GROUPS_H
