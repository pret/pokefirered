#ifndef GUARD_POKEMON_STORAGE_SYSTEM_H
#define GUARD_POKEMON_STORAGE_SYSTEM_H

#include "global.h"

#define TOTAL_BOXES_COUNT       14
#define IN_BOX_COUNT            30

u8 *GetBoxNamePtr(u8 boxNumber);
struct BoxPokemon *GetBoxedMonPtr(u8 boxId, u8 monPosition);
void SetBoxMonNickAt(u8 boxId, u8 monPosition, const u8 *newNick);
void CompactPartySlots(void);
u32 GetBoxMonDataAt(u8 boxId, u8 monPosition, s32 request);
void ZeroBoxMonAt(u8 boxId, u8 monPosition);
void sub_808CE60(void);
void ResetPokemonStorageSystem(void);
u8 StorageGetCurrentBox(void);
void PSS_RenderTextToVramViaBuffer(const u8 *name, u8 *a1, u8 a2, u8 a3, u8 *buffer, u8 a5);

#endif // GUARD_POKEMON_STORAGE_SYSTEM_H
