#ifndef GUARD_BOX_PARTY_POKEMON_DROPDOWN_H
#define GUARD_BOX_PARTY_POKEMON_DROPDOWN_H

enum
{
    BPPD_MOVE_INNER_LEFT = 0,
    BPPD_MOVE_OUTER_LEFT,
    BPPD_MOVE_INNER_TOP,
    BPPD_MOVE_OUTER_TOP,
    BPPD_MOVE_INNER_X,
    BPPD_MOVE_INNER_Y
};

void AllocBoxPartyPokemonDropdowns(u8 num);
void FreeBoxPartyPokemonDropdowns(void);
void CopyAllBoxPartyPokemonDropdownsToVram(void);
void SetBoxPartyPokemonDropdownMap2(u8 idx, u8 bgId, const void *src, u16 width, u16 height);
void SetBoxPartyPokemonDropdownMap1Tiles(u8 idx, const void *src);
void SetBoxPartyPokemonDropdownMap2Pos(u8 idx, u16 x, u16 y);
void SetBoxPartyPokemonDropdownMap2Rect(u8 idx, u16 x, u16 y, u16 width, u16 height);
void AdjustBoxPartyPokemonDropdownPos(u8 a0, u8 a1, s8 a2);
void CopyBoxPartyPokemonDropdownToBgTilemapBuffer(u8 idx);

#endif //GUARD_BOX_PARTY_POKEMON_DROPDOWN_H
