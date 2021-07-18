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

void TilemapUtil_Init(u8 num);
void TilemapUtil_Free(void);
void TilemapUtil_UpdateAll(void);
void TilemapUtil_SetMap(u8 idx, u8 bgId, const void * src, u16 width, u16 height);
void TilemapUtil_SetSavedMap(u8 idx, const void * src);
void TilemapUtil_SetPos(u8 idx, u16 x, u16 y);
void TilemapUtil_SetRect(u8 idx, u16 x, u16 y, u16 width, u16 height);
void TilemapUtil_Move(u8 idx, u8 op, s8 param);
void TilemapUtil_Update(u8 idx);

#endif //GUARD_BOX_PARTY_POKEMON_DROPDOWN_H
