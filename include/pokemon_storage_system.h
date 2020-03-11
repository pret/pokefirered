#ifndef GUARD_POKEMON_STORAGE_SYSTEM_H
#define GUARD_POKEMON_STORAGE_SYSTEM_H

#include "global.h"

#define TOTAL_BOXES_COUNT       14
#define IN_BOX_COUNT            30

enum
{
    WALLPAPER_FOREST,
    WALLPAPER_CITY,
    WALLPAPER_DESERT,
    WALLPAPER_SAVANNA,
    WALLPAPER_CRAG,
    WALLPAPER_VOLCANO,
    WALLPAPER_SNOW,
    WALLPAPER_CAVE,
    WALLPAPER_BEACH,
    WALLPAPER_SEAFLOOR,
    WALLPAPER_RIVER,
    WALLPAPER_SKY,
    WALLPAPER_POLKADOT,
    WALLPAPER_POKECENTER,
    WALLPAPER_MACHINE,
    WALLPAPER_PLAIN,
    WALLPAPER_COUNT
};

u8 *GetBoxNamePtr(u8 boxNumber);
struct BoxPokemon *GetBoxedMonPtr(u8 boxId, u8 monPosition);
void SetBoxMonNickAt(u8 boxId, u8 monPosition, const u8 *newNick);
void CompactPartySlots(void);
u32 GetBoxMonDataAt(u8 boxId, u8 monPosition, s32 request);
void ZeroBoxMonAt(u8 boxId, u8 monPosition);
void Cb2_ReturnToPSS(void);
void ResetPokemonStorageSystem(void);
u8 StorageGetCurrentBox(void);
void DrawTextWindowAndBufferTiles(const u8 *name, void *a1, u8 a2, u8 a3, u8 *buffer, s32 a5);
void SetCurrentBox(u8 boxId);
void SetBoxWallpaper(u8 boxId, u8 wallpaperId);
struct Sprite *sub_809223C(u16 x, u16 y, u8 animId, u8 priority, u8 subpriority);

void Cb2_EnterPSS(u8 a0);
u8 GetCurrentBoxOption(void);

#endif // GUARD_POKEMON_STORAGE_SYSTEM_H
