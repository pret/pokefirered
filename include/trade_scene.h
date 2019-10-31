#ifndef GUARD_TRADE_SCENE_H
#define GUARD_TRADE_SCENE_H

void CB2_InitTradeAnim_LinkTrade(void);
void CreateInGameTradePokemon(void);
void DoInGameTradeScene(void);
void DrawTextOnTradeWindow(u8 windowId, const u8 *str, s8 speed);
u16 GetInGameTradeSpeciesInfo(void);
u16 GetTradeSpecies(void);
void sub_805049C(void);
void sub_80504B0(void);
void LoadTradeAnimGfx(void);

extern const u16 gUnknown_826601C[];
extern const struct WindowTemplate gUnknown_826D1CC;

#endif //GUARD_TRADE_SCENE_H
