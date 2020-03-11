#ifndef GUARD_BOX_PARTY_POKEMON_DROPDOWN_H
#define GUARD_BOX_PARTY_POKEMON_DROPDOWN_H

void AllocBoxPartyPokemonDropdowns(u8 num);
void sub_80F7B2C(void);
void sub_80F7B40(void);
void SetBoxPartyPokemonDropdownMap2(u8 idx, u8 bgId, const void * src, u16 width, u16 height);
void sub_80F7C7C(u8 a0, const void * a1);
void SetBoxPartyPokemonDropdownMap2Pos(u8 idx, u16 x, u16 y);
void sub_80F7CE8(u8 a0, u16 a1, u16 a2, u16 a3, u16 a4);
void sub_80F7D30(u8 a0, u8 a1, s8 a2);
void sub_80F7E54(u8 a0);

#endif //GUARD_BOX_PARTY_POKEMON_DROPDOWN_H
