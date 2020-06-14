#include "global.h"
#include "gflib.h"
#include "pokemon.h"
#include "pokemon_summary_screen.h"
#include "help_system.h"

extern void sub_8138B8C(struct Pokemon * mon);
extern void sub_8135C34(void);

struct PokemonSummaryScreenData {
    u8 temp0[0x3024];
    bool32 isEnemyParty; /* 0x3024 */

    u8 temp3028[0x1d8];

    u8 ALIGNED(4) isEgg; /* 0x3200 */
    u8 ALIGNED(4) isBadEgg; /* 0x3204 */
    u8 ALIGNED(4) mode; /* 0x3208 */
    u8 ALIGNED(4) unk320C; /* 0x320C */
    u8 ALIGNED(4) lastIndex; /* 0x3210 */
    u8 ALIGNED(4) curPageIndex; /* 0x3214 */
    u8 ALIGNED(4) unk3218; /* 0x3218 */
    u8 ALIGNED(4) isBoxMon; /* 0x321C */
    u8 ALIGNED(4) unk3220; /* 0x3220 */
    u8 ALIGNED(4) unk3224; /* 0x3224 */
    u8 ALIGNED(4) unk3228; /* 0x3228 */
    u8 ALIGNED(4) unk322C; /* 0x322C */
    u8 ALIGNED(4) unk3230; /* 0x3230 */
    u8 ALIGNED(4) lockMovesFlag; /* 0x3234 */
    u8 ALIGNED(4) unk3238; /* 0x3238 */
    u8 ALIGNED(4) unk323C; /* 0x323C */
    u8 ALIGNED(4) unk3240; /* 0x3240 */
    u8 ALIGNED(4) unk3244; /* 0x3244 */

    u8 temp3248[0x18];
    u16 ALIGNED(4) unk3260; /* 0x3260 */

    u8 temp3264[0xc];

    u8 ALIGNED(4) unk3270; /* 0x3270 */
    u8 ALIGNED(4) unk3274; /* 0x3274 */
    u8 ALIGNED(4) unk3278; /* 0x3278 */
    u8 ALIGNED(4) unk327C; /* 0x327C */

    u8 temp3280[0x10];

    struct Pokemon currentMon;

    union {
        struct Pokemon * mons;
        struct BoxPokemon * boxMons;
    } monList;

    MainCallback savedCallback;
    struct Sprite * markingSprite;

    u8 ALIGNED(4) unk3300; /* 0x3300 */
    u8 ALIGNED(4) unk3304; /* 0x3304 */
};

struct Struct203B144 {
    u8 unk0[0x28];
};

extern struct PokemonSummaryScreenData * gMonSummaryScreen;
extern struct Struct203B144 * gUnknown_203B144;
extern u8 gUnknown_203B16D;
extern u8 gUnknown_203B16E;

void ShowPokemonSummaryScreen(struct Pokemon * party, u8 cursorPos, u8 lastIdx, MainCallback savedCallback, u8 mode)
{
    gMonSummaryScreen = AllocZeroed(sizeof(struct PokemonSummaryScreenData));
    gUnknown_203B144 = AllocZeroed(sizeof(struct Struct203B144));

    if (gMonSummaryScreen == NULL)
    {
        SetMainCallback2(savedCallback);
        return;
    }

    gLastViewedMonIndex = cursorPos;

    gUnknown_203B16D = 0;
    gUnknown_203B16E = 0;
    gMonSummaryScreen->savedCallback = savedCallback;
    gMonSummaryScreen->monList.mons = party;

    if (party == gEnemyParty)
        gMonSummaryScreen->isEnemyParty = TRUE;
    else
        gMonSummaryScreen->isEnemyParty = FALSE;

    gMonSummaryScreen->lastIndex = lastIdx;
    gMonSummaryScreen->mode = mode;

    switch (gMonSummaryScreen->mode) {
    case PSS_MODE_NORMAL:
    default:
        SetHelpContext(HELPCONTEXT_POKEMON_INFO);
        gMonSummaryScreen->curPageIndex = PSS_PAGE_INFO;
        gMonSummaryScreen->isBoxMon = FALSE;
        gMonSummaryScreen->lockMovesFlag = FALSE;
        break;
    case PSS_MODE_BOX:
        SetHelpContext(HELPCONTEXT_POKEMON_INFO);
        gMonSummaryScreen->curPageIndex = PSS_PAGE_INFO;
        gMonSummaryScreen->isBoxMon = TRUE;
        gMonSummaryScreen->lockMovesFlag = FALSE;
        break;
    case PSS_MODE_SELECT_MOVE:
    case PSS_MODE_UNK3:
        SetHelpContext(HELPCONTEXT_POKEMON_MOVES);
        gMonSummaryScreen->curPageIndex = PSS_PAGE_MOVES_INFO;
        gMonSummaryScreen->isBoxMon = FALSE;
        gMonSummaryScreen->lockMovesFlag = TRUE;
        break;
    }

    gMonSummaryScreen->unk3270 = 0;
    gMonSummaryScreen->unk3274 = 0;
    gMonSummaryScreen->unk3278 = 0;
    gMonSummaryScreen->unk327C = 0;

    gMonSummaryScreen->unk3238 = 0;
    gMonSummaryScreen->unk323C = 2;
    gMonSummaryScreen->unk3240 = 1;
    gMonSummaryScreen->unk3244 = 0;

    gMonSummaryScreen->unk3228 = 0;
    gMonSummaryScreen->unk322C = 1;

    sub_8138B8C(&gMonSummaryScreen->currentMon);
    gMonSummaryScreen->isEgg = GetMonData(&gMonSummaryScreen->currentMon, MON_DATA_IS_EGG);
    gMonSummaryScreen->isBadEgg = GetMonData(&gMonSummaryScreen->currentMon, MON_DATA_SANITY_IS_BAD_EGG);

    if (gMonSummaryScreen->isBadEgg == TRUE) {
        gMonSummaryScreen->isEgg = TRUE;
    }

    gMonSummaryScreen->unk3300 = 0xff;
    SetMainCallback2(sub_8135C34);
}

void ShowSelectMovePokemonSummaryScreen(struct Pokemon * party, u8 cursorPos, u8 lastIdx, MainCallback savedCallback, u16 a4) {
    ShowPokemonSummaryScreen(party, cursorPos, lastIdx, savedCallback, PSS_MODE_SELECT_MOVE);
    gMonSummaryScreen->unk3260 = a4;
}
