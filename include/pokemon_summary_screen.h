#ifndef GUARD_POKEMON_SUMMARY_SCREEN_H
#define GUARD_POKEMON_SUMMARY_SCREEN_H

#include "main.h"

extern const u8 *const gMoveDescriptionPointers[];
extern const u8 *const gNatureNamePointers[];

void ShowSelectMovePokemonSummaryScreen(struct Pokemon *, u8, u8, MainCallback, u16);
u8 GetMoveSlotToReplace(void);
void SummaryScreen_SetUnknownTaskId(u8 a0);
void SummaryScreen_DestroyUnknownTask(void);
u8 GetLastViewedMonIndex(void);
void ShowPokemonSummaryScreen(struct Pokemon * party, u8 cursorPos, u8 lastIdx, void (*callback)(void), u8 a4);
void SetPokemonSummaryScreenMode(u8);

// The Pokemon Summary Screen can operate in different modes. Certain features,
// such as move re-ordering, are available in the different modes.
enum PokemonSummaryScreenMode
{
    PSS_MODE_NORMAL,
    PSS_MODE_UNK1,
    PSS_MODE_SELECT_MOVE,
    PSS_MODE_FORGET_MOVE,
    PSS_MODE_TRADE,
    PSS_MODE_BOX,
};

enum PokemonSummaryScreenPage
{
    PSS_PAGE_INFO,
    PSS_PAGE_SKILLS,
    PSS_PAGE_MOVES,
    PSS_PAGE_MOVES_INFO,
    PSS_PAGE_UNK4,
    PSS_PAGE_MOVE_DELETER,
};

enum PokemonSummaryScreenState3270
{
    PSS_STATE3270_FADEIN,
    PSS_STATE3270_PLAYCRY,
    PSS_STATE3270_HANDLEINPUT,
    PSS_STATE3270_FLIPPAGES,
    PSS_STATE3270_ATEXIT_FADEOUT,
    PSS_STATE3270_ATEXIT_WAITLINKDELAY,
    PSS_STATE3270_ATEXIT_WAITFADE
};

enum PokemonSummaryScreenStat
{
    PSS_STAT_ATK,
    PSS_STAT_DEF,
    PSS_STAT_SPA,
    PSS_STAT_SPD,
    PSS_STAT_SPE
};

#define TAG_PSS_UNK_64 0x64
#define TAG_PSS_UNK_65 0x65
#define TAG_PSS_UNK_66 0x66
#define TAG_PSS_UNK_67 0x67
#define TAG_PSS_UNK_6E 0x6E
#define TAG_PSS_UNK_78 0x78
#define TAG_PSS_UNK_82 0x82
#define TAG_PSS_UNK_8C 0x8C
#define TAG_PSS_UNK_96 0x96
#define TAG_PSS_UNK_A0 0xA0

#endif // GUARD_POKEMON_SUMMARY_SCREEN_H
