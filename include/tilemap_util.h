#ifndef GUARD_TILEMAP_UTIL_H
#define GUARD_TILEMAP_UTIL_H

void TilemapUtil_Init(u8 numTilemapIds);
void TilemapUtil_Free(void);
void TilemapUtil_SetTilemap(u8 tilemapId, u8 bg, const void *tilemap, u16 width, u16 height);
void TilemapUtil_SetPos(u8 tilemapId, u16 destX, u16 destY);
void TilemapUtil_SetRect(u8 tilemapId, u16 x, u16 y, u16 width, u16 height);
void TilemapUtil_Move(u8 tilemapId, u8 mode, s8 param);
void TilemapUtil_Update(u8 tilemapId);

#endif //GUARD_TILEMAP_UTIL_H
