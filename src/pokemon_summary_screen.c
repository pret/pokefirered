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
#include "strings.h"
#include "new_menu_helpers.h"
#include "menu.h"
#include "constants/species.h"
#include "constants/items.h"
#include "data.h"
#include "item.h"
#include "constants/party_menu.h"
#include "trade.h"
#include "battle_main.h"
#include "scanline_effect.h"
#include "constants/moves.h"
#include "dynamic_placeholder_text_util.h"
#include "constants/region_map_sections.h"
#include "region_map.h"

extern void sub_8138B8C(struct Pokemon * mon);
void sub_8135C34(void);
extern void sub_813B784(void);
extern void sub_8138414(u8 curPageIndex);
static void sub_8134BAC(u8 taskId);
static void sub_8134E84(u8 taskId);
extern void sub_813B3F0(u8 taskId);
extern void sub_813B120(u8, s8);
extern void sub_8137E64(u8 taskId);
void sub_8135638(void);
void sub_81356EC(void);
extern void sub_813B750(u8 curPageIndex);
extern void sub_8138280(u8 curPageIndex);
extern void sub_8137D28(u8 curPageIndex);
void sub_8135514(void);
u8 sub_81357A0(u8);
extern void sub_8138440(void);
extern void sub_8138CD8(u8 taskId);
void sub_8135AA4(void);
void sub_8135B90(void);
extern void sub_8138538(void);
extern void sub_8137D28(u8 curPageIndex);
extern void sub_8136F4C(void);
extern void sub_81374E8(void);
extern void sub_8137BD0(void);
extern void sub_8138A38(void);
void sub_8136DA4(const u8 * str);
void sub_8136DF0(const u8 * str);
extern void sub_8136E50(const u8 * str);
void sub_81358DC(u8, u8);
extern void sub_813A838(u8 invisible);
extern void sub_813AB70(u8 invisible);
extern void sub_8139C44(u8 invisible);
extern void sub_813B084(u8 invisible);
extern void sub_8139D54(u8 invisible);
extern void sub_813A3B8(u8 invisible);
extern void sub_813ACF8(u8 invisible);
extern void sub_813AEB0(u8 invisible);
extern void sub_813A0E8(u8 invisible);
extern void sub_8139EE4(u8 invisible);
extern void sub_81381AC(void);
void sub_8136BC4(void);
void sub_8136BAC(void);
u8 sub_8135F20(void);
u8 sub_8136AEC(void);
extern void sub_81381D0(void);
u8 sub_8136040(void);
extern void sub_8137E28(void);
extern void sub_81381C0(void);
void sub_8136D54(void);
extern void sub_81360D4(void);
extern void sub_8136350(void);
extern void sub_81367B0(void);
extern u8 sub_8138C5C(u32 status);
void sub_81367E8(u8);
extern u16 sub_8138BEC(struct Pokemon * mon, u8 i);
extern u16 sub_8138C24(struct Pokemon * mon, u8 i);
extern void sub_813ADA8(u16, u16);
extern void sub_813ABAC(u16, u16);
extern void sub_813AFFC(void);
extern void sub_8139F64(u16, u16);
extern void sub_813A254(u16, u16);
extern void sub_813A45C(u16, u16);
extern void sub_813A874(u16, u16);
extern void sub_8139CB0(void);
extern void sub_8139DBC(void);
extern void sub_813995C(void);
extern void sub_81393D4(u8 taskId);
extern void sub_8137EE8(void);
extern void sub_8136FB0(void);
extern void sub_81370EC(void);
extern void sub_8137270(void);
extern void sub_81372E4(u8 i);
extern void sub_8137554(void);
extern void sub_8137A90(void);
extern void sub_8137AF8(void);
extern void sub_8137944(void);
extern void sub_8137970(void);
extern bool32 sub_813B838(u8 metLocation);
extern bool32 sub_8138B4C(void);
extern bool32 sub_813B7E0(u8 nature);

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
        // u8 ALIGNED(4) unk3028[POKEMON_NAME_LENGTH];
        // u8 ALIGNED(4) unk3034[POKEMON_NAME_LENGTH + 1];

        // u8 ALIGNED(4) unk3040[OT_NAME_LENGTH + 1];
        // u8 ALIGNED(4) unk3048[2][OT_NAME_LENGTH + 1];

        u8 ALIGNED(4) unk3028[POKEMON_NAME_LENGTH];
        u8 ALIGNED(4) unk3034[POKEMON_NAME_LENGTH + 1];
        u8 ALIGNED(4) unk3040[OT_NAME_LENGTH + 1];
        u8 ALIGNED(4) pad3048[0x1c];

        u8 ALIGNED(4) unk3064[5];
        //u8 ALIGNED(4) unk3060[7];
        //u8 ALIGNED(4) unk3068[16];
        u8 ALIGNED(4) unk306C[7];
        u8 ALIGNED(4) unk3074[ITEM_NAME_LENGTH + 1];

        u8 ALIGNED(4) unk3084[3];
        u8 ALIGNED(4) unk3088[7];
        u8 ALIGNED(4) unk3090[9];
        u8 ALIGNED(4) unk309C[5][5];

        u8 ALIGNED(4) unk30B8[5][11];
        u8 ALIGNED(4) unk30F0[5][11];
        u8 ALIGNED(4) unk3128[5][MOVE_NAME_LENGTH + 1];
        u8 ALIGNED(4) unk316C[5][5];
        u8 ALIGNED(4) unk3188[5][5];

        u8 ALIGNED(4) unk31A4[9];
        u8 ALIGNED(4) unk31B0[9];

        u8 ALIGNED(4) unk31BC[13];
        u8 ALIGNED(4) unk31CC[20];
        u8 ALIGNED(4) pad31E0[0x20];

        // u8 ALIGNED(4) unk3090[9];
        // u8 ALIGNED(4) unk309C[5][5];

        // u8 ALIGNED(4) unk30AC[5][11];
        // u8 ALIGNED(4) unk30E4[5][11];
        // u8 ALIGNED(4) unk311C[5][13];
        // u8 ALIGNED(4) pssd4[5][5];
        // u8 ALIGNED(4) pssd5[5][5];

        // u8 ALIGNED(4) pssd6[9];
        // u8 ALIGNED(4) pssd7[9];

        // u8 ALIGNED(4) pssd8[13];
        // u8 ALIGNED(4) pssd9[20];
        // u8 ALIGNED(4) tempPadRemoveLater[0x2c];
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
    u16 unk00;
    u16 unk02;
    u16 unk04;
    u16 unk06;
    u16 unk08;
    u16 unk0A;
    u16 unk0C;
    u16 unk0E;
    u16 unk10;

    u16 unk12[5];
    u16 unk1C[5];

    u16 unk26;
};

struct Struct203B160 {
    struct Sprite * sprite00[11]; /* 0x00 */
    u16 unk2C[11]; /* 0x2c */
    u16 unk42; /* 0x42 */
    u16 unk44; /* 0x44 */
};

struct Struct203B15C {
    struct Sprite * sprite00[10]; /* 0x00 */
    u16 unk28[10]; /* 0x28 */
    u16 unk3C; /* 0x3c */
    u16 unk3E; /* 0x3e */
};

extern struct PokemonSummaryScreenData * gMonSummaryScreen;
extern struct Struct203B144 * gUnknown_203B144;
extern struct Struct203B15C * gUnknown_203B15C;
extern struct Struct203B160 * gUnknown_203B160;
extern u8 gUnknown_203B16D;
extern u8 gUnknown_203B16E;

extern const u32 gUnknown_8E9B750[];
extern const u32 gUnknown_8E9B950[];
extern const u32 gUnknown_8E9B598[];
extern const u32 gUnknown_8E9BA9C[];
extern const u32 gUnknown_8463C80[];
extern const u32 gUnknown_8463B88[];
extern const u32 gUnknown_8E9BBCC[];
extern const u16 gUnknown_8E9B310[];
extern const u32 gUnknown_8E9A460[];

extern const u32 gUnknown_84636C0[];
extern const u32 gUnknown_8463700[];

extern const struct BgTemplate gUnknown_8463EFC[4];

extern const u8 gUnknown_8463FA4[][3];
extern const u8 gUnknown_8463EF0[][3];

extern const u8 * const gUnknown_8463EC4[];

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
    case PSS_MODE_FORGET_MOVE:
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

static void sub_8134BAC(u8 taskId)
{
    s16 * data = gTasks[taskId].data;

    switch (data[0])
    {
    case 0:
        sub_8135638();
        sub_81356EC();
        gMonSummaryScreen->lockMovesFlag = TRUE;
        gMonSummaryScreen->unk301C = TRUE;
        sub_813B750(gMonSummaryScreen->curPageIndex);
        sub_8138280(gMonSummaryScreen->curPageIndex);
        break;
    case 1:
        if (gMonSummaryScreen->curPageIndex != PSS_PAGE_MOVES_INFO)
        {
            if (!(gMonSummaryScreen->curPageIndex == PSS_PAGE_MOVES && gMonSummaryScreen->unk3224 == 0))
            {
                FillBgTilemapBufferRect_Palette0(0, 0, 0, 0, 30, 20);
                CopyBgTilemapBufferToVram(0);
            }
        }
        FillBgTilemapBufferRect_Palette0(1, 0, 0, 0, 30, 2);
        FillBgTilemapBufferRect_Palette0(1, 0, 0, 2, 15, 2);
        FillBgTilemapBufferRect_Palette0(2, 0, 0, 0, 30, 2);
        FillBgTilemapBufferRect_Palette0(2, 0, 0, 2, 15, 2);
        break;
    case 2:
        sub_8135AA4();
        sub_8135B90();
        sub_8138538();
        sub_8137D28(gMonSummaryScreen->curPageIndex);
        break;
    case 3:
        CopyWindowToVram(gMonSummaryScreen->unk3000[0], 2);
        CopyWindowToVram(gMonSummaryScreen->unk3000[1], 2);
        CopyWindowToVram(gMonSummaryScreen->unk3000[2], 2);
        break;
    case 4:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            CopyBgTilemapBufferToVram(3);
            CopyBgTilemapBufferToVram(2);
            CopyBgTilemapBufferToVram(1);
        }
        else
            return;

        break;
    case 5:
        sub_8135514();
        gMonSummaryScreen->unk3244 = TRUE;
        break;
    case 6:
        if (!sub_81357A0(gMonSummaryScreen->unk3224))
            return;

        break;
    case 7:
        sub_8136F4C();
        if (gMonSummaryScreen->curPageIndex != PSS_PAGE_MOVES_INFO)
            sub_81374E8();

        sub_8137BD0();
        sub_8138A38();
        break;
    case 8:
        CopyWindowToVram(gMonSummaryScreen->unk3000[3], 2);
        CopyWindowToVram(gMonSummaryScreen->unk3000[4], 2);
        CopyWindowToVram(gMonSummaryScreen->unk3000[5], 2);
        CopyWindowToVram(gMonSummaryScreen->unk3000[6], 2);
        break;
    case 9:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            CopyBgTilemapBufferToVram(0);
            ShowBg(0);
        }
        else
            return;

        break;
    default:
        sub_8138440();

        if (gMonSummaryScreen->curPageIndex == PSS_PAGE_MOVES_INFO)
            gTasks[gMonSummaryScreen->unk3018].func = sub_8138CD8;

        DestroyTask(taskId);
        data[0] = 0;
        gMonSummaryScreen->lockMovesFlag = FALSE;
        gMonSummaryScreen->unk301C = FALSE;
        return;
    }

    data[0]++;
}

static void sub_8134E84(u8 taskId)
{
    switch (gMonSummaryScreen->unk3284)
    {
    case 0:
        gMonSummaryScreen->lockMovesFlag = TRUE;
        gMonSummaryScreen->unk301C = TRUE;
        sub_8138280(gMonSummaryScreen->curPageIndex);
        break;
    case 1:
        if (gMonSummaryScreen->curPageIndex != PSS_PAGE_MOVES_INFO)
        {
            if (!(gMonSummaryScreen->curPageIndex == PSS_PAGE_MOVES && gMonSummaryScreen->unk3224 == 0))
            {
                FillBgTilemapBufferRect_Palette0(0, 0, 0, 0, 30, 20);
                CopyBgTilemapBufferToVram(0);
            }
        }

        FillBgTilemapBufferRect_Palette0(1, 0, 0, 0, 30, 2);
        FillBgTilemapBufferRect_Palette0(1, 0, 0, 2, 15, 2);
        FillBgTilemapBufferRect_Palette0(2, 0, 0, 0, 30, 2);
        FillBgTilemapBufferRect_Palette0(2, 0, 0, 2, 15, 2);
        break;
    case 2:
        sub_8135638();
        sub_813B750(gMonSummaryScreen->curPageIndex);
        sub_8135B90();
        sub_8138538();
        sub_8135AA4();
        break;
    case 3:
        sub_8136DA4(gUnknown_8419C39);
        if (!(gMain.inBattle || gReceivedRemoteLinkPlayers))
            sub_8136DF0(gUnknown_8419C92);
        else
            sub_8136DF0(gUnknown_8419CA2);

        break;
    case 4:
        CopyWindowToVram(gMonSummaryScreen->unk3000[0], 2);
        CopyWindowToVram(gMonSummaryScreen->unk3000[1], 2);
        break;
    case 5:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            CopyBgTilemapBufferToVram(2);
            CopyBgTilemapBufferToVram(1);
            CopyBgTilemapBufferToVram(3);
        }
        else
            return;

        break;
    case 6:
        sub_8136F4C();
        sub_8137BD0();
        CopyWindowToVram(gMonSummaryScreen->unk3000[3], 2);
        CopyWindowToVram(gMonSummaryScreen->unk3000[5], 2);
        break;
    case 7:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            CopyBgTilemapBufferToVram(0);
            sub_8135514();
            gMonSummaryScreen->unk3244 = TRUE;
        }
        else
            return;

        break;
    case 8:
        if (!sub_81357A0(gMonSummaryScreen->unk3224))
            return;

        sub_81374E8();
        CopyWindowToVram(gMonSummaryScreen->unk3000[4], 2);
        break;
    case 9:
        sub_8138A38();
        sub_8136E50(gUnknown_8419C45);
        break;
    case 10:
        sub_81356EC();
        CopyWindowToVram(gMonSummaryScreen->unk3000[6], 2);
        CopyWindowToVram(gMonSummaryScreen->unk3000[2], 2);
        break;
    case 11:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            CopyBgTilemapBufferToVram(0);
            CopyBgTilemapBufferToVram(2);
            CopyBgTilemapBufferToVram(1);
        }
        else
            return;

        break;
    default:
        sub_8138440();
        gTasks[gMonSummaryScreen->unk3018].func = sub_8138CD8;
        gMonSummaryScreen->unk3284 = 0;
        gMonSummaryScreen->lockMovesFlag = FALSE;
        gMonSummaryScreen->unk301C = FALSE;
        return;
    }

    gMonSummaryScreen->unk3284++;
    return;
}

void sub_81351A0(u8 taskId)
{
    switch (gMonSummaryScreen->unk3284)
    {
    case 0:
        gMonSummaryScreen->lockMovesFlag = TRUE;
        gMonSummaryScreen->unk301C = TRUE;
        sub_8138280(gMonSummaryScreen->curPageIndex);
        break;
    case 1:
        if (gMonSummaryScreen->curPageIndex != PSS_PAGE_MOVES_INFO) {
            if (!(gMonSummaryScreen->curPageIndex == PSS_PAGE_MOVES && gMonSummaryScreen->unk3224 == 0))
            {
                FillBgTilemapBufferRect_Palette0(0, 0, 0, 0, 30, 20);
                CopyBgTilemapBufferToVram(0);
            }
        }

        FillBgTilemapBufferRect_Palette0(1, 0, 0, 0, 30, 2);
        FillBgTilemapBufferRect_Palette0(1, 0, 0, 2, 15, 2);
        FillBgTilemapBufferRect_Palette0(2, 0, 0, 0, 30, 2);
        FillBgTilemapBufferRect_Palette0(2, 0, 0, 2, 15, 2);
        break;
    case 2:
        sub_8135AA4();
        break;
    case 3:
        sub_8136F4C();
        sub_81374E8();
        sub_8137BD0();
        CopyWindowToVram(gMonSummaryScreen->unk3000[3], 2);
        CopyWindowToVram(gMonSummaryScreen->unk3000[4], 2);
        CopyWindowToVram(gMonSummaryScreen->unk3000[5], 2);
        CopyBgTilemapBufferToVram(0);
        break;
    case 4:
        sub_8136DA4(gUnknown_8419C39);
        sub_8136DF0(gUnknown_8419C82);
        break;
    case 5:
        CopyWindowToVram(gMonSummaryScreen->unk3000[0], 2);
        CopyWindowToVram(gMonSummaryScreen->unk3000[1], 2);
        CopyBgTilemapBufferToVram(2);
        CopyBgTilemapBufferToVram(1);
        break;
    case 6:
        sub_8135514();
        gMonSummaryScreen->unk3244 = TRUE;
        sub_8135638();
        sub_813B750(gMonSummaryScreen->curPageIndex);
        sub_8138A38();
        break;
    case 7:
        break;
    case 8:
        if (sub_81357A0(gMonSummaryScreen->unk3224) == 0)
            return;

        sub_8136E50(gUnknown_8419C45);
        break;
    case 9:
        CopyWindowToVram(gMonSummaryScreen->unk3000[6], 2);
        CopyWindowToVram(gMonSummaryScreen->unk3000[2], 2);
        CopyBgTilemapBufferToVram(0);
        CopyBgTilemapBufferToVram(2);
        CopyBgTilemapBufferToVram(1);
        break;
    case 10:
        sub_8135B90();
        sub_8138538();
        CopyBgTilemapBufferToVram(3);
        sub_81356EC();
        break;
    default:
        sub_8138440();
        gTasks[gMonSummaryScreen->unk3018].func = sub_8134840;
        gMonSummaryScreen->unk3284 = 0;
        gMonSummaryScreen->lockMovesFlag = FALSE;
        gMonSummaryScreen->unk301C = FALSE;
        return;
    }

    gMonSummaryScreen->unk3284++;
    return;
}

void sub_813546C(void)
{
    u8 i;
    for (i = 0; i < 11; i++)
    {
        gUnknown_203B160->unk2C[i] = (8 * i) + 396;
        gUnknown_203B160->sprite00[i]->pos1.x = gUnknown_203B160->unk2C[i];
        if (i >= 9)
            continue;

        gUnknown_203B15C->unk28[i] = (8 * i) + 412;
        gUnknown_203B15C->sprite00[i]->pos1.x = gUnknown_203B15C->unk28[i];
    }
}

void sub_81354C4(void)
{
    u8 i;
    for (i = 0; i < 11; i++)
    {
        gUnknown_203B160->unk2C[i] = (8 * i) + 156;
        gUnknown_203B160->sprite00[i]->pos1.x = gUnknown_203B160->unk2C[i];
        if (i >= 9)
            continue;
        gUnknown_203B15C->unk28[i] = (8 * i) + 172;
        gUnknown_203B15C->sprite00[i]->pos1.x = gUnknown_203B15C->unk28[i];
    }
}

void sub_8135514(void)
{
    s8 pageDelta = 1;

    if (gMonSummaryScreen->unk3224 == 1)
        pageDelta = -1;

    if (gMonSummaryScreen->curPageIndex == PSS_PAGE_MOVES_INFO)
    {
        gMonSummaryScreen->unk324C = 240;
        return;
    }

    if ((gMonSummaryScreen->curPageIndex + pageDelta) == PSS_PAGE_MOVES_INFO)
    {
        sub_81358DC(0, 0);
        gMonSummaryScreen->unk324C = 0;
        SetGpuReg(REG_OFFSET_BG1HOFS, 0);
        SetGpuReg(REG_OFFSET_BG2HOFS, 0);
        return;
    }

    if (gMonSummaryScreen->unk3224 == 1)
    {
        gMonSummaryScreen->unk324C = 0;
        SetGpuReg(REG_OFFSET_BG0HOFS, 0);
        SetGpuReg(REG_OFFSET_BG1HOFS, 0);
        SetGpuReg(REG_OFFSET_BG2HOFS, 0);
        sub_81358DC(1, 1);
    }
    else
    {
        u32 bg1Priority = GetGpuReg(REG_OFFSET_BG1CNT) & 3;
        u32 bg2Priority = GetGpuReg(REG_OFFSET_BG2CNT) & 3;
        gMonSummaryScreen->unk324C = 240;

        if (bg1Priority > bg2Priority)
            SetGpuReg(REG_OFFSET_BG1HOFS, 240);
        else
            SetGpuReg(REG_OFFSET_BG2HOFS, 240);

        SetGpuReg(REG_OFFSET_BG0HOFS, 240);
        sub_81358DC(1, 0);
    }

    if (gMonSummaryScreen->curPageIndex == PSS_PAGE_SKILLS)
    {
        if (gMonSummaryScreen->unk3224 == 1)
            sub_81354C4();
        else
            sub_813546C();
    }
    else if (gMonSummaryScreen->curPageIndex == PSS_PAGE_MOVES)
        sub_81354C4();

}

void sub_8135638(void)
{
    u8 newPage;

    if (gMonSummaryScreen->unk3224 == 1)
        newPage = gMonSummaryScreen->curPageIndex - 1;
    else
        newPage = gMonSummaryScreen->curPageIndex + 1;

    switch (newPage)
    {
    case PSS_PAGE_INFO:
        break;
    case PSS_PAGE_SKILLS:
        sub_813A838(1);
        sub_813AB70(1);
        break;
    case PSS_PAGE_MOVES:
        if (gMonSummaryScreen->unk3224 == 1)
        {
            sub_8139C44(1);
            sub_813B084(1);
            sub_8139D54(1);
            sub_813A3B8(1);
            sub_813ACF8(1);
            sub_813AEB0(1);
        }

        break;
    case PSS_PAGE_MOVES_INFO:
        sub_813A0E8(1);
        sub_8139EE4(1);
        sub_813A3B8(1);
        sub_813ACF8(1);
        sub_813AEB0(1);
        break;
    }
}

void sub_81356EC(void)
{
    u8 newPage;

    if (gMonSummaryScreen->unk3224 == 1)
        newPage = gMonSummaryScreen->curPageIndex - 1;
    else
        newPage = gMonSummaryScreen->curPageIndex + 1;

    switch (newPage)
    {
    case PSS_PAGE_INFO:
        sub_813A838(0);
        sub_813AB70(0);
        break;
    case PSS_PAGE_SKILLS:
        break;
    case PSS_PAGE_MOVES:
        if (gMonSummaryScreen->unk3224 == 0)
        {
            sub_813A838(0);
            sub_813AB70(0);
        }
        else
        {
            sub_813A0E8(0);
            sub_813ACF8(0);
            sub_8139EE4(0);
            sub_813AEB0(0);
        }

        break;
    case PSS_PAGE_MOVES_INFO:
        sub_8139C44(0);
        sub_813B084(0);
        sub_813A3B8(0);
        sub_8139D54(0);
        sub_813ACF8(0);
        sub_813AEB0(0);
        break;
    }
}

u8 sub_81357A0(u8 a0)
{
    s8 pageDelta = 1;

    if (gMonSummaryScreen->unk3224 == 1)
        pageDelta = -1;

    if (gMonSummaryScreen->curPageIndex == PSS_PAGE_MOVES_INFO)
        if (gMonSummaryScreen->unk324C <= 0)
        {
            gMonSummaryScreen->unk324C = 0;
            gMonSummaryScreen->unk3238 ^= 1;
            sub_81358DC(0, 0);
            gMonSummaryScreen->unk3244 = FALSE;
            return TRUE;
        }

    if ((gMonSummaryScreen->curPageIndex + pageDelta) == PSS_PAGE_MOVES_INFO)
        if (gMonSummaryScreen->unk324C >= 240)
        {
            gMonSummaryScreen->unk324C = 240;
            gMonSummaryScreen->unk3238 ^= 1;
            gMonSummaryScreen->unk3244 = FALSE;
            return TRUE;
        }

    if (gMonSummaryScreen->unk3224 == 1)
    {
        if (gMonSummaryScreen->unk324C >= 240)
        {
            gMonSummaryScreen->unk324C = 240;
            gMonSummaryScreen->unk3238 ^= 1;
            sub_81358DC(0, 0);
            gMonSummaryScreen->unk3244 = FALSE;
            return TRUE;
        }
    }
    else if (gMonSummaryScreen->unk324C <= 0)
    {
        gMonSummaryScreen->unk3238 ^= 1;
        gMonSummaryScreen->unk324C = 0;
        gMonSummaryScreen->unk3244 = FALSE;
        return TRUE;
    }

    return FALSE;
}

void sub_81358DC(u8 a0, u8 a1)
{
    u8 i;
    u32 bg0Priority;
    u32 bg1Priority;
    u32 bg2Priority;

    bg0Priority = GetGpuReg(REG_OFFSET_BG0CNT) & 3;
    bg1Priority = GetGpuReg(REG_OFFSET_BG1CNT) & 3;
    bg2Priority = GetGpuReg(REG_OFFSET_BG2CNT) & 3;

    if (gMonSummaryScreen->unk3224 == 1)
    {
        if (a0 == 0)
        {
            bg0Priority = 0;

            if (a1 == 0)
            {
                if (bg1Priority > bg2Priority)
                    bg1Priority = 1, bg2Priority = 2;
                else
                    bg1Priority = 2, bg2Priority = 1;
            }
            else
            {
                if (bg1Priority > bg2Priority)
                    bg1Priority = 2, bg2Priority = 1;
                else
                    bg1Priority = 1, bg2Priority = 2;
            }
        }
        if (a0 == 1)
        {
            bg0Priority = 1;

            if (a1 == 0)
            {
                if (bg1Priority > bg2Priority)
                    bg1Priority = 0, bg2Priority = 2;
                else
                    bg1Priority = 2, bg2Priority = 0;
            }
            else
            {
                if (bg1Priority > bg2Priority)
                    bg1Priority = 2, bg2Priority = 0;
                else
                    bg1Priority = 0, bg2Priority = 2;
            }
        }
    }

    if (gMonSummaryScreen->unk3224 == 0)
    {
        bg0Priority = 0;
        if (bg1Priority > bg2Priority)
            bg1Priority = 1, bg2Priority = 2;
        else
            bg1Priority = 2, bg2Priority = 1;
    }

    for (i = 0; i < 11; i++)
    {
        if (gMonSummaryScreen->curPageIndex == PSS_PAGE_SKILLS && gMonSummaryScreen->unk3224 == 1)
            gUnknown_203B160->sprite00[i]->oam.priority = bg0Priority;
        else
            gUnknown_203B160->sprite00[i]->oam.priority = bg1Priority;

        if (i >= 9)
            continue;

        if (gMonSummaryScreen->curPageIndex == PSS_PAGE_SKILLS && gMonSummaryScreen->unk3224 == 1)
            gUnknown_203B15C->sprite00[i]->oam.priority = bg0Priority;
        else
            gUnknown_203B15C->sprite00[i]->oam.priority = bg1Priority;
    }

    SetGpuReg(REG_OFFSET_BG0CNT, (GetGpuReg(REG_OFFSET_BG0CNT) & 0xfffc) | bg0Priority);
    SetGpuReg(REG_OFFSET_BG1CNT, (GetGpuReg(REG_OFFSET_BG1CNT) & 0xfffc) | bg1Priority);
    SetGpuReg(REG_OFFSET_BG2CNT, (GetGpuReg(REG_OFFSET_BG2CNT) & 0xfffc) | bg2Priority);
}

void sub_8135AA4(void)
{
    u8 newPage;

    if (gMonSummaryScreen->unk3224 == 1)
        newPage = gMonSummaryScreen->curPageIndex - 1;
    else
        newPage = gMonSummaryScreen->curPageIndex + 1;

    switch (newPage)
    {
    case PSS_PAGE_INFO:
        CopyToBgTilemapBuffer(gMonSummaryScreen->unk3240, gUnknown_8E9B750, 0, 0);
        break;
    case PSS_PAGE_SKILLS:
        if (gMonSummaryScreen->unk3224 == 1)
            CopyToBgTilemapBuffer(gMonSummaryScreen->unk323C, gUnknown_8E9B950, 0, 0);
        else
            CopyToBgTilemapBuffer(gMonSummaryScreen->unk323C, gUnknown_8E9B598, 0, 0);

        break;
    case PSS_PAGE_MOVES:
        if (gMonSummaryScreen->unk3224 == 1)
            CopyToBgTilemapBuffer(gMonSummaryScreen->unk3240, gUnknown_8E9BA9C, 0, 0);
        else
            CopyToBgTilemapBuffer(gMonSummaryScreen->unk3240, gUnknown_8E9B750, 0, 0);

        break;
    case PSS_PAGE_MOVES_INFO:
        CopyToBgTilemapBuffer(gMonSummaryScreen->unk323C, gUnknown_8E9B950, 0, 0);
        break;
    }
}

void sub_8135B90(void)
{
    u8 newPage;

    if (gMonSummaryScreen->unk3224 == 1)
        newPage = gMonSummaryScreen->curPageIndex - 1;
    else
        newPage = gMonSummaryScreen->curPageIndex + 1;

    switch (newPage)
    {
    case PSS_PAGE_INFO:
        CopyToBgTilemapBuffer(gMonSummaryScreen->unk3240, gUnknown_8E9B750, 0, 0);
        break;
    case PSS_PAGE_SKILLS:
        break;
    case PSS_PAGE_MOVES:
        if (gMonSummaryScreen->unk3224 == 1)
            CopyToBgTilemapBuffer(3, gUnknown_8463C80, 0, 0);
        else
            CopyToBgTilemapBuffer(3, gUnknown_8463B88, 0, 0);

        break;
    case PSS_PAGE_MOVES_INFO:
        CopyToBgTilemapBuffer(3, gUnknown_8463B88, 0, 0);
        break;
    }
}

void sub_8135C34(void)
{
    switch (gMonSummaryScreen->unk3274)
    {
    case 0:
        sub_81381AC();
        break;
    case 1:
        sub_8136BC4();
        break;
    case 2:
        sub_8136BAC();
        break;
    case 3:
        if (!sub_8135F20())
            return;
        break;
    case 4:
        if (!sub_8136AEC())
            return;
        break;
    case 5:
        sub_81381D0();
        break;
    case 6:
        if (!sub_8136040())
            return;
        break;
    case 7:
        sub_8136F4C();
        break;
    case 8:
        sub_81374E8();
        break;
    case 9:
        sub_8137BD0();
        sub_8138A38();
        break;
    case 10:
        if (gMonSummaryScreen->mode == PSS_MODE_SELECT_MOVE || gMonSummaryScreen->mode == PSS_MODE_FORGET_MOVE)
            CopyToBgTilemapBuffer(3, gUnknown_8463C80, 0, 0);
        else
            CopyToBgTilemapBuffer(3, gUnknown_8463B88, 0, 0);

        sub_8138538();
        break;
    case 11:
        if (gMonSummaryScreen->isEgg)
            CopyToBgTilemapBuffer(gMonSummaryScreen->unk323C, gUnknown_8E9BBCC, 0, 0);
        else
        {
            if (gMonSummaryScreen->mode == PSS_MODE_SELECT_MOVE || gMonSummaryScreen->mode == PSS_MODE_FORGET_MOVE)
            {
                CopyToBgTilemapBuffer(gMonSummaryScreen->unk323C, gUnknown_8E9B950, 0, 0);
                CopyToBgTilemapBuffer(gMonSummaryScreen->unk3240, gUnknown_8E9BA9C, 0, 0);
            }
            else
            {
                CopyToBgTilemapBuffer(gMonSummaryScreen->unk323C, gUnknown_8E9B598, 0, 0);
                CopyToBgTilemapBuffer(gMonSummaryScreen->unk3240, gUnknown_8E9B750, 0, 0);
            }
        }

        break;
    case 12:
        BlendPalettes(0xffffffff, 16, 0);
        sub_8137D28(gMonSummaryScreen->curPageIndex);
        sub_8137E28();
        break;
    case 13:
        BeginNormalPaletteFade(0xffffffff, 0, 16, 0, 0);
        CopyWindowToVram(gMonSummaryScreen->unk3000[0], 2);
        CopyWindowToVram(gMonSummaryScreen->unk3000[1], 2);
        CopyWindowToVram(gMonSummaryScreen->unk3000[2], 2);
        CopyWindowToVram(gMonSummaryScreen->unk3000[6], 2);
        CopyWindowToVram(gMonSummaryScreen->unk3000[3], 2);
        CopyWindowToVram(gMonSummaryScreen->unk3000[4], 2);
        CopyWindowToVram(gMonSummaryScreen->unk3000[5], 2);
        break;
    case 14:
        CopyBgTilemapBufferToVram(0);
        CopyBgTilemapBufferToVram(2);
        CopyBgTilemapBufferToVram(1);
        CopyBgTilemapBufferToVram(3);
        break;
    case 15:
        if (gMonSummaryScreen->mode == PSS_MODE_SELECT_MOVE || gMonSummaryScreen->mode == PSS_MODE_FORGET_MOVE)
        {
            sub_8139EE4(0);
            sub_813A0E8(0);
        }
        else
        {
            sub_8139C44(0);
            sub_813B084(0);
            sub_8139D54(0);
            sub_813A838(0);
            sub_813AB70(0);
        }

        sub_813A3B8(0);
        sub_813ACF8(0);
        sub_813AEB0(0);
        break;
    default:
        sub_81381C0();
        sub_8136D54();
        return;
    }

    gMonSummaryScreen->unk3274++;
}

u8 sub_8135F20(void)
{
    switch (gMonSummaryScreen->unk3278)
    {
    case 0:
        LoadPalette(gUnknown_8E9B310, 0, 0x20 * 5);
        if (IsMonShiny(&gMonSummaryScreen->currentMon) == TRUE && !gMonSummaryScreen->isEgg)
        {
            LoadPalette(&gUnknown_8E9B310[16 * 6], 0, 0x20);
            LoadPalette(&gUnknown_8E9B310[16 * 5], 0x10, 0x20);
        }
        else
        {
            LoadPalette(&gUnknown_8E9B310[16 * 0], 0, 0x20);
            LoadPalette(&gUnknown_8E9B310[16 * 1], 0x10, 0x20);
        }

        break;
    case 1:
        ListMenuLoadStdPalAt(0x60, 1);
        LoadPalette(gUnknown_84636C0, 0x70, 0x20);
        break;
    case 2:
        ResetTempTileDataBuffers();
        break;
    case 3:
        DecompressAndCopyTileDataToVram(2, gUnknown_8E9A460, 0, 0, 0);
        break;
    case 4:
        if (FreeTempTileDataBuffersIfPossible() == TRUE)
            return FALSE;
        break;

    case 5:
    case 6:
        break;

    default:
        LoadPalette(gUnknown_8463700, 0x80, 0x20);
        return TRUE;
    }

    gMonSummaryScreen->unk3278++;
    return FALSE;
}

u8 sub_8136040(void)
{
    switch (gMonSummaryScreen->unk3280)
    {
    case 0:
        sub_81360D4();
        if (gMonSummaryScreen->isEgg)
        {
            gMonSummaryScreen->unk3280 = 0;
            return TRUE;
        }

        break;
    case 1:
        if (gMonSummaryScreen->isEgg == 0)
            sub_8136350();
        break;
    case 2:
        if (gMonSummaryScreen->isEgg == 0)
            sub_81367B0();
        break;
    default:
        gMonSummaryScreen->unk3280 = 0;
        return TRUE;
    }

    gMonSummaryScreen->unk3280++;
    return FALSE;
}

void sub_81360D4(void)
{
    u8 tempStr[20];
    u16 dexNum;
    u16 gender;
    u16 heldItem;
    u32 otId;

    dexNum = SpeciesToPokedexNum(GetMonData(&gMonSummaryScreen->currentMon, MON_DATA_SPECIES));
    if (dexNum == 0xffff)
        StringCopy(gMonSummaryScreen->summary.unk3064, gUnknown_8416202);
    else
        ConvertIntToDecimalStringN(gMonSummaryScreen->summary.unk3064, dexNum, STR_CONV_MODE_LEADING_ZEROS, 3);

    gUnknown_203B144->unk00 = 0;

    if (!gMonSummaryScreen->isEgg)
    {
        dexNum = GetMonData(&gMonSummaryScreen->currentMon, MON_DATA_SPECIES);
        GetSpeciesName(gMonSummaryScreen->summary.unk3028, dexNum);
    }
    else
    {
        GetMonData(&gMonSummaryScreen->currentMon, MON_DATA_NICKNAME, gMonSummaryScreen->summary.unk3028);
        return;
    }

    gMonSummaryScreen->unk3220[0] = gBaseStats[dexNum].type1;
    gMonSummaryScreen->unk3220[1] = gBaseStats[dexNum].type2;

    GetMonData(&gMonSummaryScreen->currentMon, MON_DATA_NICKNAME, tempStr);
    StringCopyN_Multibyte(gMonSummaryScreen->summary.unk3034, tempStr, POKEMON_NAME_LENGTH);
    StringGetEnd10(gMonSummaryScreen->summary.unk3034);

    gender = GetMonGender(&gMonSummaryScreen->currentMon);
    dexNum = GetMonData(&gMonSummaryScreen->currentMon, MON_DATA_SPECIES2);

    if (gender == MON_FEMALE)
        StringCopy(gMonSummaryScreen->summary.unk3084, gText_FemaleSymbol);
    else if (gender == MON_MALE)
        StringCopy(gMonSummaryScreen->summary.unk3084, gText_MaleSymbol);
    else
        StringCopy(gMonSummaryScreen->summary.unk3084, gString_Dummy);

    if (dexNum == SPECIES_NIDORAN_M || dexNum == SPECIES_NIDORAN_F)
        if (StringCompare(gMonSummaryScreen->summary.unk3034, gSpeciesNames[dexNum]) == 0)
            StringCopy(gMonSummaryScreen->summary.unk3084, gString_Dummy);

    GetMonData(&gMonSummaryScreen->currentMon, MON_DATA_OT_NAME, tempStr);
    StringCopyN_Multibyte(gMonSummaryScreen->summary.unk3040, tempStr, OT_NAME_LENGTH);

    ConvertInternationalString(gMonSummaryScreen->summary.unk3040, GetMonData(&gMonSummaryScreen->currentMon, MON_DATA_LANGUAGE));

    otId = GetMonData(&gMonSummaryScreen->currentMon, MON_DATA_OT_ID) & 0xffff;
    ConvertIntToDecimalStringN(gMonSummaryScreen->summary.unk306C, otId, STR_CONV_MODE_LEADING_ZEROS, 5);

    ConvertIntToDecimalStringN(tempStr, GetMonData(&gMonSummaryScreen->currentMon, MON_DATA_LEVEL), STR_CONV_MODE_LEFT_ALIGN, 3);
    StringCopy(gMonSummaryScreen->summary.unk3088, gText_Lv);
    StringAppendN(gMonSummaryScreen->summary.unk3088, tempStr, 4);

    heldItem = GetMonData(&gMonSummaryScreen->currentMon, MON_DATA_HELD_ITEM);

    if (heldItem == ITEM_NONE)
        StringCopy(gMonSummaryScreen->summary.unk3074, gUnknown_84161EF);
    else
        CopyItemName(heldItem, gMonSummaryScreen->summary.unk3074);
}

#define MACRO_8136350_0(x) (63 - StringLength((x)) * 6)
#define MACRO_8136350_1(x) (27 - StringLength((x)) * 6)

void sub_8136350(void)
{
    u8 tempStr[20];
    u8 level;
    u16 type;
    u16 species;
    u16 hp;
    u16 statValue;
    u32 exp;
    u32 expToNextLevel;

    hp = GetMonData(&gMonSummaryScreen->currentMon, MON_DATA_HP);
    ConvertIntToDecimalStringN(gMonSummaryScreen->summary.unk3090, hp, STR_CONV_MODE_LEFT_ALIGN, 3);
    StringAppend(gMonSummaryScreen->summary.unk3090, gText_Slash);

    hp = GetMonData(&gMonSummaryScreen->currentMon, MON_DATA_MAX_HP);
    ConvertIntToDecimalStringN(tempStr, hp, STR_CONV_MODE_LEFT_ALIGN, 3);
    StringAppend(gMonSummaryScreen->summary.unk3090, tempStr);

    gUnknown_203B144->unk02 = MACRO_8136350_0(gMonSummaryScreen->summary.unk3090);

    if (gMonSummaryScreen->savedCallback == CB2_ReturnToTradeMenuFromSummary && gMonSummaryScreen->isEnemyParty == TRUE)
    {
        statValue = GetMonData(&gMonSummaryScreen->currentMon, MON_DATA_ATK2);
        ConvertIntToDecimalStringN(gMonSummaryScreen->summary.unk309C[PSS_STAT_ATK], statValue, STR_CONV_MODE_LEFT_ALIGN, 3);
        gUnknown_203B144->unk04 = MACRO_8136350_1(gMonSummaryScreen->summary.unk309C[PSS_STAT_ATK]);

        statValue = GetMonData(&gMonSummaryScreen->currentMon, MON_DATA_DEF2);
        ConvertIntToDecimalStringN(gMonSummaryScreen->summary.unk309C[PSS_STAT_DEF], statValue, STR_CONV_MODE_LEFT_ALIGN, 3);
        gUnknown_203B144->unk06 = MACRO_8136350_1(gMonSummaryScreen->summary.unk309C[PSS_STAT_DEF]);

        statValue = GetMonData(&gMonSummaryScreen->currentMon, MON_DATA_SPATK2);
        ConvertIntToDecimalStringN(gMonSummaryScreen->summary.unk309C[PSS_STAT_SPA], statValue, STR_CONV_MODE_LEFT_ALIGN, 3);
        gUnknown_203B144->unk08 = MACRO_8136350_1(gMonSummaryScreen->summary.unk309C[PSS_STAT_SPA]);

        statValue = GetMonData(&gMonSummaryScreen->currentMon, MON_DATA_SPDEF2);
        ConvertIntToDecimalStringN(gMonSummaryScreen->summary.unk309C[PSS_STAT_SPD], statValue, STR_CONV_MODE_LEFT_ALIGN, 3);
        gUnknown_203B144->unk0A = MACRO_8136350_1(gMonSummaryScreen->summary.unk309C[PSS_STAT_SPD]);

        statValue = GetMonData(&gMonSummaryScreen->currentMon, MON_DATA_SPEED2);
        ConvertIntToDecimalStringN(gMonSummaryScreen->summary.unk309C[PSS_STAT_SPE], statValue, STR_CONV_MODE_LEFT_ALIGN, 3);
        gUnknown_203B144->unk0C = MACRO_8136350_1(gMonSummaryScreen->summary.unk309C[PSS_STAT_SPE]);
    }
    else
    {
        statValue = GetMonData(&gMonSummaryScreen->currentMon, MON_DATA_ATK);
        ConvertIntToDecimalStringN(gMonSummaryScreen->summary.unk309C[PSS_STAT_ATK], statValue, STR_CONV_MODE_LEFT_ALIGN, 3);
        gUnknown_203B144->unk04 = MACRO_8136350_1(gMonSummaryScreen->summary.unk309C[PSS_STAT_ATK]);

        statValue = GetMonData(&gMonSummaryScreen->currentMon, MON_DATA_DEF);
        ConvertIntToDecimalStringN(gMonSummaryScreen->summary.unk309C[PSS_STAT_DEF], statValue, STR_CONV_MODE_LEFT_ALIGN, 3);
        gUnknown_203B144->unk06 = MACRO_8136350_1(gMonSummaryScreen->summary.unk309C[PSS_STAT_DEF]);

        statValue = GetMonData(&gMonSummaryScreen->currentMon, MON_DATA_SPATK);
        ConvertIntToDecimalStringN(gMonSummaryScreen->summary.unk309C[PSS_STAT_SPA], statValue, STR_CONV_MODE_LEFT_ALIGN, 3);
        gUnknown_203B144->unk08 = MACRO_8136350_1(gMonSummaryScreen->summary.unk309C[PSS_STAT_SPA]);

        statValue = GetMonData(&gMonSummaryScreen->currentMon, MON_DATA_SPDEF);
        ConvertIntToDecimalStringN(gMonSummaryScreen->summary.unk309C[PSS_STAT_SPD], statValue, STR_CONV_MODE_LEFT_ALIGN, 3);
        gUnknown_203B144->unk0A = MACRO_8136350_1(gMonSummaryScreen->summary.unk309C[PSS_STAT_SPD]);

        statValue = GetMonData(&gMonSummaryScreen->currentMon, MON_DATA_SPEED);
        ConvertIntToDecimalStringN(gMonSummaryScreen->summary.unk309C[PSS_STAT_SPE], statValue, STR_CONV_MODE_LEFT_ALIGN, 3);
        gUnknown_203B144->unk0C = MACRO_8136350_1(gMonSummaryScreen->summary.unk309C[PSS_STAT_SPE]);
    }

    exp = GetMonData(&gMonSummaryScreen->currentMon, MON_DATA_EXP);
    ConvertIntToDecimalStringN(gMonSummaryScreen->summary.unk31A4, exp, STR_CONV_MODE_LEFT_ALIGN, 7);
    gUnknown_203B144->unk0E = MACRO_8136350_0(gMonSummaryScreen->summary.unk31A4);

    level = GetMonData(&gMonSummaryScreen->currentMon, MON_DATA_LEVEL);
    expToNextLevel = 0;
    if (level < 100)
    {
        species = GetMonData(&gMonSummaryScreen->currentMon, MON_DATA_SPECIES);
        expToNextLevel = gExperienceTables[gBaseStats[species].growthRate][level + 1] - exp;
    }

    ConvertIntToDecimalStringN(gMonSummaryScreen->summary.unk31B0, expToNextLevel, STR_CONV_MODE_LEFT_ALIGN, 7);
    gUnknown_203B144->unk10 = MACRO_8136350_0(gMonSummaryScreen->summary.unk31B0);

    type = GetAbilityBySpecies(GetMonData(&gMonSummaryScreen->currentMon, MON_DATA_SPECIES), GetMonData(&gMonSummaryScreen->currentMon, MON_DATA_ABILITY_NUM));
    StringCopy(gMonSummaryScreen->summary.unk31BC, gAbilityNames[type]);
    StringCopy(gMonSummaryScreen->summary.unk31CC, gAbilityDescriptionPointers[type]);

    gMonSummaryScreen->unk326C = sub_8138C5C(GetMonData(&gMonSummaryScreen->currentMon, MON_DATA_STATUS));
    if (gMonSummaryScreen->unk326C == AILMENT_NONE)
        if (CheckPartyPokerus(&gMonSummaryScreen->currentMon, 0))
            gMonSummaryScreen->unk326C = AILMENT_PKRS;
}

void sub_81367B0(void)
{
    u8 i;

    for (i = 0; i < 4; i++)
        sub_81367E8(i);

    if (gMonSummaryScreen->mode == PSS_MODE_SELECT_MOVE)
        sub_81367E8(4);
}

#define MACRO_81367E8_0(a, b) ((6 * (a)) - StringLength((b)) * 6)

void sub_81367E8(u8 i)
{
    if (i < 4)
        gMonSummaryScreen->unk325A[i] = sub_8138BEC(&gMonSummaryScreen->currentMon, i);

    if (gMonSummaryScreen->unk325A[i] == 0)
    {
        StringCopy(gMonSummaryScreen->summary.unk3128[i], gUnknown_841620E);
        StringCopy(gMonSummaryScreen->summary.unk30B8[i], gUnknown_8416210);
        StringCopy(gMonSummaryScreen->summary.unk316C[i], gText_ThreeHyphens);
        StringCopy(gMonSummaryScreen->summary.unk3188[i], gText_ThreeHyphens);
        gUnknown_203B144->unk12[i] = 0xff;
        gUnknown_203B144->unk1C[i] = 0xff;
        return;
    }

    gMonSummaryScreen->unk3264++;
    gMonSummaryScreen->unk3250[i] = gBattleMoves[gMonSummaryScreen->unk325A[i]].type;
    StringCopy(gMonSummaryScreen->summary.unk3128[i], gMoveNames[gMonSummaryScreen->unk325A[i]]);

    if (i >= 4 && gMonSummaryScreen->mode == PSS_MODE_SELECT_MOVE)
    {
        ConvertIntToDecimalStringN(gMonSummaryScreen->summary.unk30B8[i],
                                   gBattleMoves[gMonSummaryScreen->unk325A[i]].pp, STR_CONV_MODE_LEFT_ALIGN, 3);
        ConvertIntToDecimalStringN(gMonSummaryScreen->summary.unk30F0[i],
                                   gBattleMoves[gMonSummaryScreen->unk325A[i]].pp, STR_CONV_MODE_LEFT_ALIGN, 3);
    }
    else
    {
        ConvertIntToDecimalStringN(gMonSummaryScreen->summary.unk30B8[i],
                                   sub_8138C24(&gMonSummaryScreen->currentMon, i), STR_CONV_MODE_LEFT_ALIGN, 3);
        ConvertIntToDecimalStringN(gMonSummaryScreen->summary.unk30F0[i],
                                   CalculatePPWithBonus(gMonSummaryScreen->unk325A[i], GetMonData(&gMonSummaryScreen->currentMon, MON_DATA_PP_BONUSES), i),
                                   STR_CONV_MODE_LEFT_ALIGN, 3);
    }

    gUnknown_203B144->unk12[i] = MACRO_81367E8_0(2, gMonSummaryScreen->summary.unk30B8[i]);
    gUnknown_203B144->unk1C[i] = MACRO_81367E8_0(2, gMonSummaryScreen->summary.unk30F0[i]);

    if (gBattleMoves[gMonSummaryScreen->unk325A[i]].power <= 1)
        StringCopy(gMonSummaryScreen->summary.unk316C[i], gText_ThreeHyphens);
    else
        ConvertIntToDecimalStringN(gMonSummaryScreen->summary.unk316C[i], gBattleMoves[gMonSummaryScreen->unk325A[i]].power, STR_CONV_MODE_RIGHT_ALIGN, 3);

    if (gBattleMoves[gMonSummaryScreen->unk325A[i]].accuracy == 0)
        StringCopy(gMonSummaryScreen->summary.unk3188[i], gText_ThreeHyphens);
    else
        ConvertIntToDecimalStringN(gMonSummaryScreen->summary.unk3188[i], gBattleMoves[gMonSummaryScreen->unk325A[i]].accuracy, STR_CONV_MODE_RIGHT_ALIGN, 3);
}

u8 sub_8136AEC(void)
{
    switch (gMonSummaryScreen->unk327C)
    {
    case 0:
        sub_813ADA8(TAG_PSS_UNK_A0, TAG_PSS_UNK_A0);
        break;
    case 1:
        sub_813ABAC(TAG_PSS_UNK_96, TAG_PSS_UNK_96);
        break;
    case 2:
        sub_813AFFC();
        break;
    case 3:
        sub_8139F64(TAG_PSS_UNK_64, TAG_PSS_UNK_64);
        break;
    case 4:
        sub_813A254(TAG_PSS_UNK_6E, TAG_PSS_UNK_6E);
        break;
    case 5:
        sub_813A45C(TAG_PSS_UNK_78, TAG_PSS_UNK_78);
        break;
    case 6:
        sub_813A874(TAG_PSS_UNK_82, TAG_PSS_UNK_82);
        break;
    case 7:
        sub_8139CB0();
        break;
    case 8:
        sub_8139DBC();
        break;
    default:
        sub_813995C();
        return TRUE;
    }

    gMonSummaryScreen->unk327C++;
    return FALSE;
}

void sub_8136BAC(void)
{
    ResetSpriteData();
    ResetPaletteFade();
    FreeAllSpritePalettes();
    ScanlineEffect_Stop();
}

void sub_8136BC4(void)
{
    DmaClearLarge16(3, (void *)VRAM, VRAM_SIZE, 0x1000);
    DmaClear32(3, (void *)OAM, OAM_SIZE);
    DmaClear16(3, (void *)PLTT, PLTT_SIZE);

    SetGpuReg(REG_OFFSET_DISPCNT, 0);

    ResetBgsAndClearDma3BusyFlags(0);
    InitBgsFromTemplates(0, gUnknown_8463EFC, ARRAY_COUNT(gUnknown_8463EFC));

    ChangeBgX(0, 0, 0);
    ChangeBgY(0, 0, 0);
    ChangeBgX(1, 0, 0);
    ChangeBgY(1, 0, 0);
    ChangeBgX(2, 0, 0);
    ChangeBgY(2, 0, 0);
    ChangeBgX(3, 0, 0);
    ChangeBgY(3, 0, 0);

    DeactivateAllTextPrinters();

    SetGpuReg(REG_OFFSET_DISPCNT, DISPCNT_OBJ_1D_MAP | DISPCNT_OBJ_ON | DISPCNT_WIN1_ON);

    sub_813B750(gMonSummaryScreen->curPageIndex);

    SetGpuReg(REG_OFFSET_WININ, (WININ_WIN0_OBJ | WININ_WIN0_BG0 | WININ_WIN0_BG1 | WININ_WIN0_BG2 | WININ_WIN0_BG3) << 8);
    SetGpuReg(REG_OFFSET_WINOUT, WINOUT_WIN01_BG0 | WINOUT_WIN01_BG1 | WINOUT_WIN01_BG2 | WINOUT_WIN01_BG3);
    SetGpuReg(REG_OFFSET_WIN1V, 32 << 8 | 135);
    SetGpuReg(REG_OFFSET_WIN1H, 2 << 8 | 240);

    SetBgTilemapBuffer(1, gMonSummaryScreen->unk0);
    SetBgTilemapBuffer(2, gMonSummaryScreen->unk1000);
    SetBgTilemapBuffer(3, gMonSummaryScreen->unk2000);

    ShowBg(0);
    ShowBg(1);
    ShowBg(2);
    ShowBg(3);
}

void sub_8136D54(void)
{
    if (gMonSummaryScreen->mode == PSS_MODE_SELECT_MOVE || gMonSummaryScreen->mode == PSS_MODE_FORGET_MOVE)
        gMonSummaryScreen->unk3018 = CreateTask(sub_81393D4, 0);
    else
        gMonSummaryScreen->unk3018 = CreateTask(sub_8134840, 0);

    SetMainCallback2(sub_8137EE8);
}

void sub_8136DA4(const u8 * str)
{
    FillWindowPixelBuffer(gMonSummaryScreen->unk3000[0], 0);
    AddTextPrinterParameterized3(gMonSummaryScreen->unk3000[0], 2, 4, 1, gUnknown_8463FA4[1], 0, str);
    PutWindowTilemap(gMonSummaryScreen->unk3000[0]);
}

void sub_8136DF0(const u8 * str)
{
    u8 v0;
    s32 width;
    u8 r1;

    FillWindowPixelBuffer(gMonSummaryScreen->unk3000[1], 0);
    width = GetStringWidth(0, str, 0);
    r1 = gMonSummaryScreen->unk3000[1];
    AddTextPrinterParameterized3(r1, 0, 0x54 - width, 0, gUnknown_8463FA4[1], 0, str);
    PutWindowTilemap(gMonSummaryScreen->unk3000[1]);
}

void sub_8136E50(const u8 * msg)
{
    FillWindowPixelBuffer(gMonSummaryScreen->unk3000[2], 0);

    if (!gMonSummaryScreen->isEgg)
    {
        if (gMonSummaryScreen->curPageIndex != PSS_PAGE_MOVES_INFO)
            AddTextPrinterParameterized3(gMonSummaryScreen->unk3000[2], 2, 4, 2, gUnknown_8463FA4[1], 0xff, gMonSummaryScreen->summary.unk3088);

        AddTextPrinterParameterized3(gMonSummaryScreen->unk3000[2], 2, 40, 2, gUnknown_8463FA4[1], 0xff, gMonSummaryScreen->summary.unk3034);

        if (GetMonGender(&gMonSummaryScreen->currentMon) == MON_FEMALE)
            AddTextPrinterParameterized3(gMonSummaryScreen->unk3000[2], 2, 105, 2, gUnknown_8463FA4[3], 0, gMonSummaryScreen->summary.unk3084);
        else
            AddTextPrinterParameterized3(gMonSummaryScreen->unk3000[2], 2, 105, 2, gUnknown_8463FA4[2], 0, gMonSummaryScreen->summary.unk3084);
    }

    PutWindowTilemap(gMonSummaryScreen->unk3000[2]);
}

void sub_8136F4C(void)
{
    FillWindowPixelBuffer(gMonSummaryScreen->unk3000[3], 0);

    switch (gMonSummaryScreen->curPageIndex)
    {
    case PSS_PAGE_INFO:
        sub_8136FB0();
        break;
    case PSS_PAGE_SKILLS:
        sub_81370EC();
        break;
    case PSS_PAGE_MOVES:
    case PSS_PAGE_MOVES_INFO:
        sub_8137270();
        break;
    }

    PutWindowTilemap(gMonSummaryScreen->unk3000[3]);
}

void sub_8136FB0(void)
{
    AddTextPrinterParameterized3(gMonSummaryScreen->unk3000[3], 2, 47, 19, gUnknown_8463FA4[0], TEXT_SPEED_FF, gMonSummaryScreen->summary.unk3028);

    if (!gMonSummaryScreen->isEgg)
    {
        AddTextPrinterParameterized3(gMonSummaryScreen->unk3000[3], 2, 47 + gUnknown_203B144->unk00, 5, gUnknown_8463FA4[0], TEXT_SPEED_FF, gMonSummaryScreen->summary.unk3064);
        AddTextPrinterParameterized3(gMonSummaryScreen->unk3000[3], 2, 47, 49, gUnknown_8463FA4[0], TEXT_SPEED_FF, gMonSummaryScreen->summary.unk3040);
        AddTextPrinterParameterized3(gMonSummaryScreen->unk3000[3], 2, 47, 64, gUnknown_8463FA4[0], TEXT_SPEED_FF, gMonSummaryScreen->summary.unk306C);
        AddTextPrinterParameterized3(gMonSummaryScreen->unk3000[3], 2, 47, 79, gUnknown_8463FA4[0], TEXT_SPEED_FF, gMonSummaryScreen->summary.unk3074);
    }
    else
    {
        u8 eggCycles;
        u8 hatchMsgIndex;

        eggCycles = GetMonData(&gMonSummaryScreen->currentMon, MON_DATA_FRIENDSHIP);

        if (eggCycles <= 5)
            hatchMsgIndex = 3;
        else if (eggCycles <= 10)
            hatchMsgIndex = 2;
        else if (eggCycles <= 40)
            hatchMsgIndex = 1;
        else
            hatchMsgIndex = 0;

        if (gMonSummaryScreen->isBadEgg)
            hatchMsgIndex = 0;

        AddTextPrinterParameterized3(gMonSummaryScreen->unk3000[3], 2, 7, 45, gUnknown_8463FA4[0], TEXT_SPEED_FF, gUnknown_8463EC4[hatchMsgIndex]);
    }
}

void sub_81370EC(void)
{
    AddTextPrinterParameterized3(gMonSummaryScreen->unk3000[3], 2, 14 + gUnknown_203B144->unk02, 4, gUnknown_8463FA4[0], TEXT_SPEED_FF, gMonSummaryScreen->summary.unk3090);
    AddTextPrinterParameterized3(gMonSummaryScreen->unk3000[3], 2, 50 + gUnknown_203B144->unk04, 22, gUnknown_8463FA4[0], TEXT_SPEED_FF, gMonSummaryScreen->summary.unk309C[PSS_STAT_ATK]);
    AddTextPrinterParameterized3(gMonSummaryScreen->unk3000[3], 2, 50 + gUnknown_203B144->unk06, 35, gUnknown_8463FA4[0], TEXT_SPEED_FF, gMonSummaryScreen->summary.unk309C[PSS_STAT_DEF]);
    AddTextPrinterParameterized3(gMonSummaryScreen->unk3000[3], 2, 50 + gUnknown_203B144->unk08, 48, gUnknown_8463FA4[0], TEXT_SPEED_FF, gMonSummaryScreen->summary.unk309C[PSS_STAT_SPA]);
    AddTextPrinterParameterized3(gMonSummaryScreen->unk3000[3], 2, 50 + gUnknown_203B144->unk0A, 61, gUnknown_8463FA4[0], TEXT_SPEED_FF, gMonSummaryScreen->summary.unk309C[PSS_STAT_SPD]);
    AddTextPrinterParameterized3(gMonSummaryScreen->unk3000[3], 2, 50 + gUnknown_203B144->unk0C, 74, gUnknown_8463FA4[0], TEXT_SPEED_FF, gMonSummaryScreen->summary.unk309C[PSS_STAT_SPE]);
    AddTextPrinterParameterized3(gMonSummaryScreen->unk3000[3], 2, 15 + gUnknown_203B144->unk0E, 87, gUnknown_8463FA4[0], TEXT_SPEED_FF, gMonSummaryScreen->summary.unk31A4);
    AddTextPrinterParameterized3(gMonSummaryScreen->unk3000[3], 2, 15 + gUnknown_203B144->unk10, 100, gUnknown_8463FA4[0], TEXT_SPEED_FF, gMonSummaryScreen->summary.unk31B0);
}

#define MACRO_8137270(x) ((x) * 28 + 5)

void sub_8137270(void)
{
    u8 i;

    for (i = 0; i < 4; i++)
        sub_81372E4(i);

    if (gMonSummaryScreen->curPageIndex == PSS_PAGE_MOVES_INFO)
    {
        if (gMonSummaryScreen->mode == PSS_MODE_SELECT_MOVE)
            sub_81372E4(4);
        else
            AddTextPrinterParameterized3(gMonSummaryScreen->unk3000[3], 2, 3, MACRO_8137270(4), gUnknown_8463EF0[0], TEXT_SPEED_FF, gFameCheckerText_Cancel);
    }
}

#define MACRO_81372E4(x) ((x) * 28 + 16)

void sub_81372E4(u8 i)
{
    u8 v0 = 0;
    u8 curPP = sub_8138C24(&gMonSummaryScreen->currentMon, i);
    u16 move = gMonSummaryScreen->unk325A[i];
    u8 ppBonuses = GetMonData(&gMonSummaryScreen->currentMon, MON_DATA_PP_BONUSES);
    u8 maxPP = CalculatePPWithBonus(move, ppBonuses, i);

    if (i == 4)
        curPP = maxPP;

    AddTextPrinterParameterized3(gMonSummaryScreen->unk3000[3], 2, 3, MACRO_8137270(i), gUnknown_8463EF0[0], TEXT_SPEED_FF, gMonSummaryScreen->summary.unk3128[i]);

    if (gMonSummaryScreen->unk325A[i] == 0 || (curPP == maxPP))
        v0 = 0;
    else if (curPP == 0)
        v0 = 3;
    else if (maxPP == 3)
    {
        if (curPP == 2)
            v0 = 2;
        else if (curPP == 1)
            v0 = 1;
    }
    else if (maxPP == 2)
    {
        if (curPP == 1)
            v0 = 1;
    }
    else
    {
        if (curPP <= (maxPP / 4))
            v0 = 2;
        else if (curPP <= (maxPP / 2))
            v0 = 1;
    }

    AddTextPrinterParameterized3(gMonSummaryScreen->unk3000[3], 2, 36, MACRO_81372E4(i), gUnknown_8463EF0[v0], TEXT_SPEED_FF, gUnknown_8416238);
    AddTextPrinterParameterized3(gMonSummaryScreen->unk3000[3], 2, 46 + gUnknown_203B144->unk12[i], MACRO_81372E4(i), gUnknown_8463EF0[v0], TEXT_SPEED_FF, gMonSummaryScreen->summary.unk30B8[i]);

    if (gMonSummaryScreen->unk325A[i] != MOVE_NONE)
    {
        AddTextPrinterParameterized3(gMonSummaryScreen->unk3000[3], 2, 58, MACRO_81372E4(i), gUnknown_8463EF0[v0], TEXT_SPEED_FF, gText_Slash);
        AddTextPrinterParameterized3(gMonSummaryScreen->unk3000[3], 2, 64 + gUnknown_203B144->unk1C[i], MACRO_81372E4(i), gUnknown_8463EF0[v0], TEXT_SPEED_FF, gMonSummaryScreen->summary.unk30F0[i]);
    }
}

void sub_81374E8(void)
{
    FillWindowPixelBuffer(gMonSummaryScreen->unk3000[4], 0);

    switch (gMonSummaryScreen->curPageIndex)
    {
    case PSS_PAGE_INFO:
        sub_8137554();
        break;
    case PSS_PAGE_SKILLS:
        sub_8137A90();
        break;
    case PSS_PAGE_MOVES_INFO:
        sub_8137AF8();
        break;
    case PSS_PAGE_MOVES:
        break;
    }

    PutWindowTilemap(gMonSummaryScreen->unk3000[4]);
}

void sub_8137554(void)
{
    if (!gMonSummaryScreen->isEgg)
        sub_8137944();
    else
        sub_8137970();
}

void sub_8137578(void)
{
    u8 nature;
    u8 level;
    u8 metLocation;
    u8 levelStr[5];
    u8 mapNameStr[32];
    u8 natureMetOrHatchedAtLevelStr[152];

    DynamicPlaceholderTextUtil_Reset();
    nature = GetNature(&gMonSummaryScreen->currentMon);
    DynamicPlaceholderTextUtil_SetPlaceholderPtr(0, gNatureNamePointers[nature]);
    level = GetMonData(&gMonSummaryScreen->currentMon, MON_DATA_MET_LEVEL);

    if (level == 0)
        level = 5;

    ConvertIntToDecimalStringN(levelStr, level, STR_CONV_MODE_LEFT_ALIGN, 3);
    DynamicPlaceholderTextUtil_SetPlaceholderPtr(1, levelStr);

    metLocation = GetMonData(&gMonSummaryScreen->currentMon, MON_DATA_MET_LOCATION);

    if (sub_813B838(metLocation) == TRUE)
        GetMapNameGeneric_(mapNameStr, metLocation);
    else
    {
        if (gMonSummaryScreen->isEnemyParty == TRUE || sub_8138B4C() == TRUE)
            StringCopy(mapNameStr, gUnknown_8419C13);
        else
            StringCopy(mapNameStr, gUnknown_8419C0B);
    }

    DynamicPlaceholderTextUtil_SetPlaceholderPtr(2, mapNameStr);

    if (GetMonData(&gMonSummaryScreen->currentMon, MON_DATA_MET_LEVEL) == 0)
    {
        if (GetMonData(&gMonSummaryScreen->currentMon, MON_DATA_OBEDIENCE) == 1)
        {
            if (sub_813B7E0(nature))
                DynamicPlaceholderTextUtil_ExpandPlaceholders(natureMetOrHatchedAtLevelStr, gUnknown_841996D);
            else
                DynamicPlaceholderTextUtil_ExpandPlaceholders(natureMetOrHatchedAtLevelStr, gUnknown_841992F);
        }
        else
        {
            if (sub_813B7E0(nature))
                DynamicPlaceholderTextUtil_ExpandPlaceholders(natureMetOrHatchedAtLevelStr, gUnknown_84198D5);
            else
                DynamicPlaceholderTextUtil_ExpandPlaceholders(natureMetOrHatchedAtLevelStr, gUnknown_84198B4);
        }
    }
    else
    {
        if (metLocation == METLOC_FATEFUL_ENCOUNTER)
        {
            if (sub_813B7E0(nature))
                DynamicPlaceholderTextUtil_ExpandPlaceholders(natureMetOrHatchedAtLevelStr, gUnknown_84197ED);
            else
                DynamicPlaceholderTextUtil_ExpandPlaceholders(natureMetOrHatchedAtLevelStr, gUnknown_84197B8);
        }
        else
        {
            if (sub_813B7E0(nature))
                DynamicPlaceholderTextUtil_ExpandPlaceholders(natureMetOrHatchedAtLevelStr, gUnknown_8419841);
            else
                DynamicPlaceholderTextUtil_ExpandPlaceholders(natureMetOrHatchedAtLevelStr, gUnknown_8419822);
        }
    }

    AddTextPrinterParameterized4(gMonSummaryScreen->unk3000[4], 2, 0, 3, 0, 0, gUnknown_8463FA4[0], TEXT_SPEED_FF, natureMetOrHatchedAtLevelStr);
}
