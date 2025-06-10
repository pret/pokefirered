#ifndef EV_IV_DISPLAY_SCREEN_H
#define EV_IV_DISPLAY_SCREEN_H

#include "global.h"
#include "main.h"
#include "script.h"
#include "sound.h"
#include "constants/songs.h"
#include "quest_log.h"

// ------------------------------------------------------------------ 
//                           FIRE RED/ROJOFUEGO     EMERALD/ESMERALDA
// FLAG_SYS_POKEMON_GET      0x828                  0x860
// FLAG_SYS_POKEDEX_GET      0x829                  0x861
//
// [ESP] ------------------------------------------------------------ 
// Cambiar FLAG_SYS_POKEMON_GET por la flag que quieras usar.
// ejemplo: FLAG_EV_IV  0x200
//
//  [ENG] ------------------------------------------------------------ 
// Change FLAG_SYS_POKEMON_GET to the flag you want to use.
// example: FLAG_EV_IV  0x200
#define FLAG_EV_IV FLAG_SYS_POKEMON_GET

//Dirección en que se mueve el cursor del ev-iv. No modificar
//Direction in which the ev-iv cursor moves. Do not change
#define SEARCH_DIR_DOWN     (0 << 1)
#define SEARCH_DIR_UP       (1 << 1)
#define ALLOW_EGGS          1
#define BOX_SEARCH_DIRECTION_DOWN     (SEARCH_DIR_DOWN|ALLOW_EGGS)
#define BOX_SEARCH_DIRECTION_UP       (SEARCH_DIR_UP|ALLOW_EGGS)

extern void CB2_ShowEvIv_PlayerParty(void);
extern void Show_EvIv(struct Pokemon * party, u8 cursorPos, u8 lastIdx, MainCallback savedCallback, bool8 isBoxMon, bool8 return_summary_screen);

struct EvIvDisplayScreen
{
    u8 state;
    u8 gfxStep;
    u8 callbackStep;
    bool8 return_summary_screen;

    u8 spriteTaskId;
    u8 cursorPos;
    u8 lastIdx;
    bool8 isBoxMon;
 
    u8 stats_ev[NUM_STATS];
    u8 stats_iv[NUM_STATS];
    u8 stats_bs[NUM_STATS];
    u16 totalStatsEV;
    u16 totalStatsIV;
    u16 totalStatsBS;

    struct Pokemon currentMon;

    union
    {
        struct Pokemon * mons;
        struct BoxPokemon * boxMons;
    } monList;

    MainCallback savedCallback;
    u16 tilemapBuffer[0x400];
};

extern const u8 gText_PokeSum_Controls_Page_EvIv[];

void CB2_ShowEvIv_PlayerParty(void);
void Show_EvIv(struct Pokemon * party, u8 cursorPos, u8 lastIdx, MainCallback savedCallback, bool8 isBoxMon, bool8 return_summary_screen);
void CB2_ShowEvIv_SummaryScreen(void);
void EvIv_SummaryScreen_Callback(u8 cursorPos);

extern const u8 gMultiBattlePartyOrder[];
extern const s8 gNatureStatTable[NUM_NATURES][NUM_NATURE_STATS];
extern s16 SeekToNextMonInBox(struct BoxPokemon * boxMons, u8 curIndex, u8 maxIndex, u8 flags);

#endif // EV_IV_DISPLAY_SCREEN_H