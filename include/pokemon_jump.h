#ifndef GUARD_POKEMON_JUMP_H
#define GUARD_POKEMON_JUMP_H

#include "main.h"

void ResetPokemonJumpRecords(void);
bool32 IsSpeciesAllowedInPokemonJump(u16 species);
void StartPokemonJump(u16 species, MainCallback callback);

#endif // GUARD_POKEMON_JUMP_H
