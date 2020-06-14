#include "global.h"
#include "gflib.h"
#include "pokemon.h"
#include "pokemon_summary_screen.h"
#include "help_system.h"
#include "task.h"
#include "menu_helpers.h"
#include "link.h"
#include "overworld.h"
#include "constants/songs.h"

extern void sub_8138B8C(struct Pokemon * mon);
extern void sub_8135C34(void);
extern void sub_813B784(void);
extern void sub_8138414(u8 curPageIndex);
extern void sub_8134BAC(u8 taskId);
extern void sub_8134E84(u8 taskId);
extern void sub_813B3F0(u8 taskId);
extern void sub_813B120(u8, s8);
extern void sub_8137E64(u8 taskId);

struct PokemonSummaryScreenData {
    u16 unk0[0x800];
    u16 unk1000[0x800];
    u16 unk2000[0x800];
    u8 ALIGNED(4) unk3000[7];

    u8 ALIGNED(4) unk3008;
    u8 ALIGNED(4) unk300C;
    u8 ALIGNED(4) unk3010;
    u8 ALIGNED(4) unk3014;

    u8 ALIGNED(4) unk3018;
    u8 ALIGNED(4) unk301C;

    u8 ALIGNED(4) unk3020;

    bool32 isEnemyParty; /* 0x3024 */

    struct PokeSummary {
        u8 ALIGNED(4) unk3028[POKEMON_NAME_LENGTH];
        u8 ALIGNED(4) unk3034[POKEMON_NAME_LENGTH + 1];

        u8 ALIGNED(4) unk3040[OT_NAME_LENGTH + 1];
        u8 ALIGNED(4) unk3048[2][OT_NAME_LENGTH + 1];

        u8 ALIGNED(4) unk3058[5];
        u8 ALIGNED(4) unk3060[7];
        u8 ALIGNED(4) unk3068[16];

        u8 ALIGNED(4) unk3078[3];
        u8 ALIGNED(4) unk307C[7];
        u8 ALIGNED(4) unk3084[9];
        u8 ALIGNED(4) unk3090[5][5];

        u8 ALIGNED(4) unk30AC[5][11];
        u8 ALIGNED(4) unk30E4[5][11];
        u8 ALIGNED(4) unk311C[5][13];
        u8 ALIGNED(4) pssd4[5][5];
        u8 ALIGNED(4) pssd5[5][5];

        u8 ALIGNED(4) pssd6[9];
        u8 ALIGNED(4) pssd7[9];

        u8 ALIGNED(4) pssd8[13];
        u8 ALIGNED(4) pssd9[20];
        u8 ALIGNED(4) tempPadRemoveLater[0x2c];
    } summary;

    u8 ALIGNED(4) isEgg; /* 0x3200 */
    u8 ALIGNED(4) isBadEgg; /* 0x3204 */

    u8 ALIGNED(4) mode; /* 0x3208 */
    u8 ALIGNED(4) unk320C; /* 0x320C */
    u8 ALIGNED(4) lastIndex; /* 0x3210 */
    u8 ALIGNED(4) curPageIndex; /* 0x3214 */
    u8 ALIGNED(4) unk3218; /* 0x3218 */
    u8 ALIGNED(4) isBoxMon; /* 0x321C */
    u8 ALIGNED(4) unk3220[2]; /* 0x3220 */

    u8 ALIGNED(4) unk3224; /* 0x3224 */
    u8 ALIGNED(4) unk3228; /* 0x3228 */
    u8 ALIGNED(4) unk322C; /* 0x322C */
    u8 ALIGNED(4) unk3230; /* 0x3230 */

    u8 ALIGNED(4) lockMovesFlag; /* 0x3234 */

    u8 ALIGNED(4) unk3238; /* 0x3238 */
    u8 ALIGNED(4) unk323C; /* 0x323C */
    u8 ALIGNED(4) unk3240; /* 0x3240 */
    u8 ALIGNED(4) unk3244; /* 0x3244 */
    u8 ALIGNED(4) unk3248; /* 0x3248 */
    s16 ALIGNED(4) unk324C; /* 0x324C */

    u16 unk3250[5]; /* 0x3250 */
    u16 unk325A[5]; /* 0x325A */
    u8 ALIGNED(4) unk3264; /* 0x3264 */
    u8 ALIGNED(4) unk3268; /* 0x3268 */

    u8 ALIGNED(4) unk326C; /* 0x326C */

    u8 ALIGNED(4) state3270; /* 0x3270 */
    u8 ALIGNED(4) unk3274; /* 0x3274 */
    u8 ALIGNED(4) unk3278; /* 0x3278 */
    u8 ALIGNED(4) unk327C; /* 0x327C */
    u8 ALIGNED(4) unk3280; /* 0x3280 */
    u8 ALIGNED(4) unk3284; /* 0x3284 */
    u8 ALIGNED(4) unk3288; /* 0x3288 */
    u8 ALIGNED(4) unk328C; /* 0x328C */

    struct Pokemon currentMon;

    union {
        struct Pokemon * mons;
        struct BoxPokemon * boxMons;
    } monList;

    MainCallback savedCallback;
    struct Sprite * markingSprite;

    u8 ALIGNED(4) unk3300[2]; /* 0x3300 */
    u8 ALIGNED(4) unk3304[3]; /* 0x3304 */
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

    switch (gMonSummaryScreen->mode)
    {
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

    gMonSummaryScreen->state3270 = 0;
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

    if (gMonSummaryScreen->isBadEgg == TRUE)
        gMonSummaryScreen->isEgg = TRUE;

    gMonSummaryScreen->unk3300[0] = 0xff;
    SetMainCallback2(sub_8135C34);
}

void ShowSelectMovePokemonSummaryScreen(struct Pokemon * party, u8 cursorPos, u8 lastIdx, MainCallback savedCallback, u16 a4)
{
    ShowPokemonSummaryScreen(party, cursorPos, lastIdx, savedCallback, PSS_MODE_SELECT_MOVE);
    gMonSummaryScreen->unk325A[4] = a4;
}

u8 sub_813476C(u8 a0)
{
    if (gMonSummaryScreen->unk301C == TRUE && gMonSummaryScreen->unk3224 != a0)
        return TRUE;

    return FALSE;
}

u32 sub_81347A4(u8 a0)
{
    if (gMonSummaryScreen->isEgg)
        return FALSE;

    if (gMonSummaryScreen->unk3300[0] != 0xff && gMonSummaryScreen->unk3300[0] == a0)
    {
        gMonSummaryScreen->unk3300[0] = 0xff;
        return TRUE;
    }

    if (sub_813476C(a0))
        return FALSE;

    switch (a0)
    {
    case 1:
        if (JOY_NEW(DPAD_RIGHT))
            return TRUE;

        if (gSaveBlock2Ptr->optionsButtonMode == OPTIONS_BUTTON_MODE_LR && JOY_NEW(R_BUTTON))
            return TRUE;

        break;
    case 0:
        if (JOY_NEW(DPAD_LEFT))
            return TRUE;

        if (gSaveBlock2Ptr->optionsButtonMode == OPTIONS_BUTTON_MODE_LR && JOY_NEW(L_BUTTON))
            return TRUE;

        break;
    }

    return FALSE;
}

void sub_8134840(u8 taskId)
{
    switch (gMonSummaryScreen->state3270) {
    case PSS_STATE3270_0:
        BeginNormalPaletteFade(0xffffffff, 0, 16, 0, 0);
        gMonSummaryScreen->state3270 = PSS_STATE3270_1;
        break;
    case PSS_STATE3270_1:
        if (!gPaletteFade.active)
        {
            sub_813B784();
            gMonSummaryScreen->state3270 = PSS_STATE3270_2;
            return;
        }

        gMonSummaryScreen->state3270 = PSS_STATE3270_1;
        break;
    case PSS_STATE3270_2:
        if (MenuHelpers_CallLinkSomething() == TRUE)
            return;
        else if (sub_800B270() == TRUE)
            return;
        else if (FuncIsActiveTask(sub_813B3F0))
            return;

        if (gMonSummaryScreen->curPageIndex != PSS_PAGE_MOVES_INFO)
        {
            if (sub_81347A4(1) == TRUE)
            {
                if (FuncIsActiveTask(sub_8134BAC))
                {
                    gMonSummaryScreen->unk3300[0] = 1;
                    return;
                }
                else if (gMonSummaryScreen->curPageIndex < PSS_PAGE_MOVES)
                {
                    PlaySE(SE_SELECT);
                    HideBg(0);
                    gMonSummaryScreen->unk3224 = 1;
                    sub_8138414(gMonSummaryScreen->curPageIndex);
                    gMonSummaryScreen->curPageIndex++;
                    gMonSummaryScreen->state3270 = PSS_STATE3270_3;
                }
                return;
            }
            else if (sub_81347A4(0) == TRUE)
            {
                if (FuncIsActiveTask(sub_8134BAC))
                {
                    gMonSummaryScreen->unk3300[0] = 0;
                    return;
                }
                else if (gMonSummaryScreen->curPageIndex > PSS_PAGE_INFO)
                {
                    PlaySE(SE_SELECT);
                    HideBg(0);
                    gMonSummaryScreen->unk3224 = 0;
                    sub_8138414(gMonSummaryScreen->curPageIndex);
                    gMonSummaryScreen->curPageIndex--;
                    gMonSummaryScreen->state3270 = PSS_STATE3270_3;
                }
                return;
            }
        }

        if ((!FuncIsActiveTask(sub_8134BAC)) || FuncIsActiveTask(sub_813B3F0))
        {
            if (JOY_NEW(DPAD_UP))
            {
                sub_813B120(taskId, -1);
                return;
            }
            else if (JOY_NEW(DPAD_DOWN))
            {
                sub_813B120(taskId, 1);
                return;
            }
            else if (JOY_NEW(A_BUTTON))
            {
                if (gMonSummaryScreen->curPageIndex == PSS_PAGE_INFO)
                {
                    PlaySE(SE_SELECT);
                    gMonSummaryScreen->state3270 = PSS_STATE3270_4;
                }
                else if (gMonSummaryScreen->curPageIndex == PSS_PAGE_MOVES)
                {
                    PlaySE(SE_SELECT);
                    gMonSummaryScreen->unk3224 = 1;
                    sub_8138414(gMonSummaryScreen->curPageIndex);
                    gMonSummaryScreen->curPageIndex++;
                    gMonSummaryScreen->state3270 = PSS_STATE3270_3;
                }
                return;
            }
            else if (JOY_NEW(B_BUTTON))
            {
                gMonSummaryScreen->state3270 = PSS_STATE3270_4;
            }
        }
        break;
    case PSS_STATE3270_3:
        if (gMonSummaryScreen->curPageIndex != PSS_PAGE_MOVES_INFO)
        {
            CreateTask(sub_8134BAC, 0);
            gMonSummaryScreen->state3270 = PSS_STATE3270_2;
        }
        else
        {
            gTasks[gMonSummaryScreen->unk3018].func = sub_8134E84;
            gMonSummaryScreen->state3270 = PSS_STATE3270_2;
        }
        break;
    case PSS_STATE3270_4:
        BeginNormalPaletteFade(0xffffffff, 0, 0, 16, 0);
        gMonSummaryScreen->state3270 = PSS_STATE3270_5;
        break;
    case PSS_STATE3270_5:
        if (Overworld_LinkRecvQueueLengthMoreThan2() == TRUE)
            return;
        else if (sub_800B270() == TRUE)
            return;

        gMonSummaryScreen->state3270 = PSS_STATE3270_6;
        break;
    default:
        if (!gPaletteFade.active)
            sub_8137E64(taskId);

        break;
    }
}
