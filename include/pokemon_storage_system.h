#ifndef GUARD_POKEMON_STORAGE_SYSTEM_H
#define GUARD_POKEMON_STORAGE_SYSTEM_H

#include "global.h"

#define TOTAL_BOXES_COUNT       14
#define IN_BOX_COUNT            30

u8* GetBoxNamePtr(u8 boxNumber);
struct BoxPokemon *GetBoxedMonPtr(u8 boxId, u8 monPosition);
void SetBoxMonNickFromAnyBox(u8 boxId, u8 monPosition, u8 * newNick);
void CompactPartySlots(void);
u32 GetBoxMonDataFromAnyBox(u8 boxId, u8 monPosition, u32 request);
void sub_808BCB4(u8 boxId, u8 monPosition);
u8 * GetBoxNamePtr(u8 boxId);

#endif // GUARD_POKEMON_STORAGE_SYSTEM_H
