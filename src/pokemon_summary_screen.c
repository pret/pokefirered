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
#include "field_specials.h"
#include "party_menu.h"
#include "constants/battle.h"
#include "event_data.h"
#include "trainer_pokemon_sprites.h"
#include "battle_anim.h"
#include "pokeball.h"
#include "pokemon_icon.h"
#include "battle_interface.h"
#include "mon_markings.h"
#include "pokemon_storage_system.h"

// needs conflicting header to match (curIndex is s8 in the function, but has to be defined as u8 here)
extern s16 SeekToNextMonInBox(struct BoxPokemon * boxMons, u8 curIndex, u8 maxIndex, u8 flags);

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
u16 sub_8138BEC(struct Pokemon * mon, u8 moveSlot);
u16 sub_8138C24(struct Pokemon * mon, u8 moveSlot);
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
void sub_8137A90(void);
extern void sub_8137AF8(void);
void sub_8137944(void);
void sub_8137970(void);
extern bool32 sub_813B838(u8 metLocation);
extern bool32 sub_8138B4C(void);
extern bool32 sub_813B7E0(u8 nature);
void sub_8137724(void);
extern bool32 sub_813B7F8(void);
extern u8 sub_813847C(struct Pokemon * mon);
extern void sub_8137C18(void);
extern void sub_8137C90(void);
extern void sub_813AF90(void);
void sub_81380F0(void);
extern void sub_81390B0(void);
extern void sub_81391EC(void);
extern void sub_8139328(struct Pokemon * mon);
extern void sub_8139AAC(u16 spriteId);
extern void sub_813A124(struct Sprite * sprite);
extern void sub_813A35C(void);
extern void sub_813A620(void);
extern void sub_813A994(void);
extern void sub_813ACB4(void);
extern void sub_813AF50(void);
extern void sub_813B068(void);
extern void sub_813B0E4(void);
extern s8 sub_813B20C(s8);
extern s8 sub_813B38C(s8);

struct PokemonSummaryScreenData
{
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

    struct PokeSummary
    {
        u8 ALIGNED(4) unk3028[POKEMON_NAME_LENGTH];
        u8 ALIGNED(4) unk3034[POKEMON_NAME_LENGTH + 1];
        u8 ALIGNED(4) unk3040[12];
        u8 ALIGNED(4) unk304C[2][12];

        u8 ALIGNED(4) unk3064[5];
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

    struct Pokemon currentMon; /* 0x3290 */

    union
    {
        struct Pokemon * mons;
        struct BoxPokemon * boxMons;
    } monList;

    MainCallback savedCallback;
    struct Sprite * markingSprite;

    u8 ALIGNED(4) unk3300[2]; /* 0x3300 */
    u8 ALIGNED(4) unk3304[3]; /* 0x3304 */
};

struct Struct203B144
{
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

struct Struct203B160
{
    struct Sprite * sprites[11]; /* 0x00 */
    u16 unk2C[11]; /* 0x2c */
    u16 unk42; /* 0x42 */
    u16 unk44; /* 0x44 */
};

struct Struct203B15C
{
    struct Sprite * sprites[10]; /* 0x00 */
    u16 unk28[10]; /* 0x28 */
    u16 unk3C; /* 0x3c */
    u16 unk3E; /* 0x3e */
};

struct Struct203B170
{
    u8 ALIGNED(4) unk00; /* 0x00 */
    u8 ALIGNED(4) unk04; /* 0x04 */
    u8 ALIGNED(4) unk08; /* 0x08 */
};

struct Struct203B148
{
    struct Sprite * sprite; /* 0x00 */
    u16 unk04; /* 0x04 */
    u16 unk06; /* 0x06 */
    u16 unk08; /* 0x08 */
};

struct Struct203B158
{
    struct Sprite * sprite; /* 0x00 */
    u16 unk04; /* 0x04 */
    u16 unk06; /* 0x06 */
};

struct Struct203B164
{
    struct Sprite * sprite; /* 0x00 */
    u16 unk04; /* 0x04 */
    u16 unk06; /* 0x06 */
};

struct Struct203B168
{
    struct Sprite * sprite; /* 0x00 */
    u16 unk04; /* 0x04 */
    u16 unk06; /* 0x06 */
};

static EWRAM_DATA struct PokemonSummaryScreenData * gMonSummaryScreen = NULL;
static EWRAM_DATA struct Struct203B144 * gUnknown_203B144 = NULL;
static EWRAM_DATA struct Struct203B148 * gUnknown_203B148[4] = {};
static EWRAM_DATA struct Struct203B158 * gUnknown_203B158 = NULL;
static EWRAM_DATA struct Struct203B15C * gUnknown_203B15C = NULL;
static EWRAM_DATA struct Struct203B160 * gUnknown_203B160 = NULL;
static EWRAM_DATA struct Struct203B164 * gUnknown_203B164 = NULL;
static EWRAM_DATA struct Struct203B168 * gUnknown_203B168 = NULL;
static EWRAM_DATA u8 gLastViewedMonIndex = 0;
static EWRAM_DATA u8 gUnknown_203B16D = 0;
static EWRAM_DATA u8 gUnknown_203B16E = 0;
static EWRAM_DATA struct Struct203B170 * gUnknown_203B170 = NULL;

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
extern const u8 * const gUnknown_8463ED4[];

extern const struct WindowTemplate gUnknown_8463F9C[];
extern const struct WindowTemplate gUnknown_8463F0C[];
extern const struct WindowTemplate gUnknown_8463F3C[];
extern const struct WindowTemplate gUnknown_8463F5C[];
extern const struct WindowTemplate gUnknown_8463F7C[];
extern const struct WindowTemplate gUnknown_8463F24[];

extern const s8 gUnknown_8463FBE[3];
extern const s8 gUnknown_8463FC1[5];
extern const s8 gUnknown_8463FC6[7];
extern const s8 gUnknown_8463FCD[7];

extern const s8 gUnknown_8463FD4[11];
extern const s8 gUnknown_8463FDF[11];
extern const s8 gUnknown_8463FEA[15];

extern const u32 gUnknown_8463740[];
extern const u32 gUnknown_846386C[];

extern const u16 gUnknown_8463720[];
extern const struct OamData gUnknown_846398C;
extern const union AnimCmd * const gUnknown_84639A4[];

extern const u32 gUnknown_8E9BF48[];
extern const u16 gUnknown_8E9BF28[];

extern const struct OamData gUnknown_84639AC;
extern const union AnimCmd * const gUnknown_84639F4[];

extern const u32 gUnknown_8E9B4B8[];
extern const u16 * const gUnknown_8463FFC[];
extern const struct OamData gUnknown_8463A14;
extern const union AnimCmd * const gUnknown_8463A7C[];

extern const u32 gUnknown_8E9B3F0[];
extern const u16 gUnknown_8E9B578[];

extern const u32 gUnknown_8463B20[];
extern const u16 gUnknown_8463B00[];

extern const struct OamData gUnknown_8463AEC;
extern const union AnimCmd * const gUnknown_8463AFC[];

extern const u32 gUnknown_8463B64[];
extern const u16 gUnknown_8463B44[];
extern const struct OamData gUnknown_8463B30;
extern const union AnimCmd * const gUnknown_8463B40[];

extern const u16 gUnknown_84636E0[];
extern const u8 gUnknown_8463FB8[];

#define FREE_AND_SET_NULL_IF_SET(ptr) \
{                                     \
    if (ptr != NULL)                  \
    {                                 \
        free(ptr);                    \
        (ptr) = NULL;                 \
    }                                 \
}

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
    gMonSummaryScreen->unk3244 = FALSE;

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
        gUnknown_203B160->sprites[i]->pos1.x = gUnknown_203B160->unk2C[i];
        if (i >= 9)
            continue;

        gUnknown_203B15C->unk28[i] = (8 * i) + 412;
        gUnknown_203B15C->sprites[i]->pos1.x = gUnknown_203B15C->unk28[i];
    }
}

void sub_81354C4(void)
{
    u8 i;
    for (i = 0; i < 11; i++)
    {
        gUnknown_203B160->unk2C[i] = (8 * i) + 156;
        gUnknown_203B160->sprites[i]->pos1.x = gUnknown_203B160->unk2C[i];
        if (i >= 9)
            continue;
        gUnknown_203B15C->unk28[i] = (8 * i) + 172;
        gUnknown_203B15C->sprites[i]->pos1.x = gUnknown_203B15C->unk28[i];
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
            gUnknown_203B160->sprites[i]->oam.priority = bg0Priority;
        else
            gUnknown_203B160->sprites[i]->oam.priority = bg1Priority;

        if (i >= 9)
            continue;

        if (gMonSummaryScreen->curPageIndex == PSS_PAGE_SKILLS && gMonSummaryScreen->unk3224 == 1)
            gUnknown_203B15C->sprites[i]->oam.priority = bg0Priority;
        else
            gUnknown_203B15C->sprites[i]->oam.priority = bg1Priority;
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

void sub_8137724(void)
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

    if (!sub_813B838(metLocation) || !sub_813B7F8())
    {
        if (sub_8138B4C() == TRUE)
        {
            sub_8137578();
            return;
        }

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
                DynamicPlaceholderTextUtil_ExpandPlaceholders(natureMetOrHatchedAtLevelStr, gUnknown_841979D);
            else
                DynamicPlaceholderTextUtil_ExpandPlaceholders(natureMetOrHatchedAtLevelStr, gUnknown_8419782);
        }

        AddTextPrinterParameterized4(gMonSummaryScreen->unk3000[4], 2, 0, 3, 0, 0, gUnknown_8463FA4[0], TEXT_SPEED_FF, natureMetOrHatchedAtLevelStr);
        return;
    }

    if (sub_813B838(metLocation) == TRUE)
        GetMapNameGeneric_(mapNameStr, metLocation);
    else
        StringCopy(mapNameStr, gUnknown_8419C0B);

    DynamicPlaceholderTextUtil_SetPlaceholderPtr(2, mapNameStr);

    if (GetMonData(&gMonSummaryScreen->currentMon, MON_DATA_MET_LEVEL) == 0)
    {
        if (GetMonData(&gMonSummaryScreen->currentMon, MON_DATA_OBEDIENCE) == 1)
        {
            if (sub_813B7E0(nature))
                DynamicPlaceholderTextUtil_ExpandPlaceholders(natureMetOrHatchedAtLevelStr, gUnknown_84199F4);
            else
                DynamicPlaceholderTextUtil_ExpandPlaceholders(natureMetOrHatchedAtLevelStr, gUnknown_84199AB);
        }
        else
        {
            if (sub_813B7E0(nature))
                DynamicPlaceholderTextUtil_ExpandPlaceholders(natureMetOrHatchedAtLevelStr, gUnknown_841988A);
            else
                DynamicPlaceholderTextUtil_ExpandPlaceholders(natureMetOrHatchedAtLevelStr, gUnknown_8419860);
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
                DynamicPlaceholderTextUtil_ExpandPlaceholders(natureMetOrHatchedAtLevelStr, gUnknown_841988A);
            else
                DynamicPlaceholderTextUtil_ExpandPlaceholders(natureMetOrHatchedAtLevelStr, gUnknown_8419860);
        }
    }

    AddTextPrinterParameterized4(gMonSummaryScreen->unk3000[4], 2, 0, 3, 0, 0, gUnknown_8463FA4[0], TEXT_SPEED_FF, natureMetOrHatchedAtLevelStr);
}

void sub_8137944(void)
{
    if (sub_813847C(&gMonSummaryScreen->currentMon) == TRUE)
        sub_8137578();
    else
        sub_8137724();
}

void sub_8137970(void)
{
    u8 metLocation;
    u8 version;
    u8 chosenStrIndex = 0;

    metLocation = GetMonData(&gMonSummaryScreen->currentMon, MON_DATA_MET_LOCATION);

    if (gMonSummaryScreen->monList.mons != gEnemyParty)
    {
        if (metLocation == METLOC_FATEFUL_ENCOUNTER || GetMonData(&gMonSummaryScreen->currentMon, MON_DATA_OBEDIENCE) == 1)
            chosenStrIndex = 4;
        else
        {
            version = GetMonData(&gMonSummaryScreen->currentMon, MON_DATA_MET_GAME);

            if (version != VERSION_LEAF_GREEN && version != VERSION_FIRE_RED)
                chosenStrIndex = 1;
            else if (metLocation == METLOC_SPECIAL_EGG)
                chosenStrIndex = 2;

            if (chosenStrIndex == 0 || chosenStrIndex == 2)
                if (sub_813847C(&gMonSummaryScreen->currentMon) == FALSE)
                    chosenStrIndex++;
        }
    }
    else
    {
        if (metLocation == METLOC_FATEFUL_ENCOUNTER || GetMonData(&gMonSummaryScreen->currentMon, MON_DATA_OBEDIENCE) == 1)
            chosenStrIndex = 4;
        else
        {
            version = GetMonData(&gMonSummaryScreen->currentMon, MON_DATA_MET_GAME);

            if (version != VERSION_LEAF_GREEN && version != VERSION_FIRE_RED)
            {
                if (metLocation == METLOC_SPECIAL_EGG)
                    chosenStrIndex = 5;
            }
            else if (metLocation == METLOC_SPECIAL_EGG)
                chosenStrIndex = 2;

            if (sub_813847C(&gMonSummaryScreen->currentMon) == FALSE)
                chosenStrIndex++;
        }
    }

    if (gMonSummaryScreen->isBadEgg)
        chosenStrIndex = 0;

    AddTextPrinterParameterized4(gMonSummaryScreen->unk3000[4], 2, 0, 3, 0, 0, gUnknown_8463FA4[0], TEXT_SPEED_FF, gUnknown_8463ED4[chosenStrIndex]);
}

void sub_8137A90(void)
{
    AddTextPrinterParameterized3(gMonSummaryScreen->unk3000[4], 2,
                                 26, 7,
                                 gUnknown_8463FA4[0], TEXT_SPEED_FF,
                                 gUnknown_8419C4D);

    AddTextPrinterParameterized3(gMonSummaryScreen->unk3000[4], 2,
                                 26, 20,
                                 gUnknown_8463FA4[0], TEXT_SPEED_FF,
                                 gUnknown_8419C59);
}

void sub_8137AF8(void)
{
    if (gUnknown_203B16D < 5)
    {
        if (gMonSummaryScreen->mode != PSS_MODE_SELECT_MOVE && gUnknown_203B16D == 4)
            return;

        AddTextPrinterParameterized3(gMonSummaryScreen->unk3000[4], 2,
                                     57, 1,
                                     gUnknown_8463FA4[0], TEXT_SPEED_FF,
                                     gMonSummaryScreen->summary.unk316C[gUnknown_203B16D]);

        AddTextPrinterParameterized3(gMonSummaryScreen->unk3000[4], 2,
                                     57, 15,
                                     gUnknown_8463FA4[0], TEXT_SPEED_FF,
                                     gMonSummaryScreen->summary.unk3188[gUnknown_203B16D]);

        AddTextPrinterParameterized4(gMonSummaryScreen->unk3000[4], 2,
                                     7, 42,
                                     0, 0,
                                     gUnknown_8463FA4[0], TEXT_SPEED_FF,
                                     gMoveDescriptionPointers[gMonSummaryScreen->unk325A[gUnknown_203B16D] - 1]);
    }
}

void sub_8137BD0(void)
{
    switch (gMonSummaryScreen->curPageIndex)
    {
    case PSS_PAGE_INFO:
        break;
    case PSS_PAGE_SKILLS:
        sub_8137C18();
        break;
    case PSS_PAGE_MOVES:
    case PSS_PAGE_MOVES_INFO:
        sub_8137C90();
        break;
    }

    PutWindowTilemap(gMonSummaryScreen->unk3000[5]);
}

#ifdef NONMATCHING
// bad register allocation
void sub_8137C18(void)
{
    FillWindowPixelBuffer(gMonSummaryScreen->unk3000[5], 0);

    AddTextPrinterParameterized3(gMonSummaryScreen->unk3000[5], 2,
                                 66, 1, gUnknown_8463FA4[0], TEXT_SPEED_FF, gMonSummaryScreen->summary.unk31CC);

    AddTextPrinterParameterized3(gMonSummaryScreen->unk3000[5], 2,
                                 2, 15, gUnknown_8463FA4[0], TEXT_SPEED_FF,
                                 gMonSummaryScreen->summary.unk31CC);

}
#else
NAKED
void sub_8137C18(void)
{
    asm_unified("\tpush {r4-r6,lr}\n"
                "\tmov r6, r8\n"
                "\tpush {r6}\n"
                "\tsub sp, 0xC\n"
                "\tldr r5, _08137C7C @ =gMonSummaryScreen\n"
                "\tldr r0, [r5]\n"
                "\tldr r4, _08137C80 @ =0x00003005\n"
                "\tadds r0, r4\n"
                "\tldrb r0, [r0]\n"
                "\tmovs r1, 0\n"
                "\tbl FillWindowPixelBuffer\n"
                "\tldr r1, [r5]\n"
                "\tadds r0, r1, r4\n"
                "\tldrb r0, [r0]\n"
                "\tldr r2, _08137C84 @ =gUnknown_8463FA4\n"
                "\tmov r8, r2\n"
                "\tstr r2, [sp]\n"
                "\tmovs r6, 0x1\n"
                "\tnegs r6, r6\n"
                "\tstr r6, [sp, 0x4]\n"
                "\tldr r2, _08137C88 @ =0x000031bc\n"
                "\tadds r1, r2\n"
                "\tstr r1, [sp, 0x8]\n"
                "\tmovs r1, 0x2\n"
                "\tmovs r2, 0x42\n"
                "\tmovs r3, 0x1\n"
                "\tbl AddTextPrinterParameterized3\n"
                "\tldr r1, [r5]\n"
                "\tadds r4, r1, r4\n"
                "\tldrb r0, [r4]\n"
                "\tmov r2, r8\n"
                "\tstr r2, [sp]\n"
                "\tstr r6, [sp, 0x4]\n"
                "\tldr r2, _08137C8C @ =0x000031cc\n"
                "\tadds r1, r2\n"
                "\tstr r1, [sp, 0x8]\n"
                "\tmovs r1, 0x2\n"
                "\tmovs r2, 0x2\n"
                "\tmovs r3, 0xF\n"
                "\tbl AddTextPrinterParameterized3\n"
                "\tadd sp, 0xC\n"
                "\tpop {r3}\n"
                "\tmov r8, r3\n"
                "\tpop {r4-r6}\n"
                "\tpop {r0}\n"
                "\tbx r0\n"
                "\t.align 2, 0\n"
                "_08137C7C: .4byte gMonSummaryScreen\n"
                "_08137C80: .4byte 0x00003005\n"
                "_08137C84: .4byte gUnknown_8463FA4\n"
                "_08137C88: .4byte 0x000031bc\n"
                "_08137C8C: .4byte 0x000031cc");
}
#endif // NONMATCHING

void sub_8137C90(void)
{
    u8 i;

    FillWindowPixelBuffer(gMonSummaryScreen->unk3000[5], 0);

    for (i = 0; i < 4; i++)
    {
        if (gMonSummaryScreen->unk325A[i] == MOVE_NONE)
            continue;

        BlitMoveInfoIcon(gMonSummaryScreen->unk3000[5], gMonSummaryScreen->unk3250[i] + 1, 3, MACRO_8137270(i));
    }

    if (gMonSummaryScreen->mode == PSS_MODE_SELECT_MOVE)
        BlitMoveInfoIcon(gMonSummaryScreen->unk3000[5], gMonSummaryScreen->unk3250[4] + 1, 3, MACRO_8137270(4));
}

void sub_8137D28(u8 curPageIndex)
{
    switch (curPageIndex)
    {
    case PSS_PAGE_INFO:
        sub_8136DA4(gUnknown_8419C1D);
        if (!gMonSummaryScreen->isEgg)
            sub_8136DF0(gUnknown_8419C62);
        else
            sub_8136DF0(gUnknown_8419C72);

        sub_8136E50(gUnknown_8419C45);
        break;
    case PSS_PAGE_SKILLS:
        sub_8136DA4(gUnknown_8419C2A);
        sub_8136DF0(gUnknown_8419C7B);
        sub_8136E50(gUnknown_8419C45);
        break;
    case PSS_PAGE_MOVES:
        sub_8136DA4(gUnknown_8419C39);
        sub_8136DF0(gUnknown_8419C82);
        sub_8136E50(gUnknown_8419C45);
        break;
    case PSS_PAGE_MOVES_INFO:
        sub_8136DA4(gUnknown_8419C39);
        if (!gMain.inBattle)
            sub_8136DF0(gUnknown_8419C92);
        else
            sub_8136DF0(gUnknown_8419CA2);
        sub_8136E50(gUnknown_8419C45);
        break;
    case PSS_PAGE_MOVE_DELETER:
        sub_8136DA4(gUnknown_8419C39);
        sub_8136DF0(gUnknown_8419CA9);
        sub_8136E50(gUnknown_8419C45);
        break;
    default:
        break;
    }
}

void sub_8137E28(void)
{
    PutWindowTilemap(gMonSummaryScreen->unk3000[0]);
    PutWindowTilemap(gMonSummaryScreen->unk3000[1]);
    PutWindowTilemap(gMonSummaryScreen->unk3000[2]);
}

void sub_8137E64(u8 taskId)
{
    sub_813AF90();
    FreeAllSpritePalettes();

    if (IsCryPlayingOrClearCrySongs() == TRUE)
        StopCryAndClearCrySongs();

    sub_8138414(gMonSummaryScreen->curPageIndex);
    FreeAllWindowBuffers();
    DestroyTask(taskId);
    SetMainCallback2(gMonSummaryScreen->savedCallback);

    gLastViewedMonIndex = GetLastViewedMonIndex();

    FREE_AND_SET_NULL_IF_SET(gMonSummaryScreen);
    FREE_AND_SET_NULL_IF_SET(gUnknown_203B144);
}

void sub_8137EE8(void)
{
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

void sub_8137F00(void)
{
    u8 i;

    for (i = 0; i < 11; i++)
    {
        if (gUnknown_203B160->unk2C[i] < 240)
        {
            gUnknown_203B160->unk2C[i] += 60;
            gUnknown_203B160->sprites[i]->pos1.x = gUnknown_203B160->unk2C[i] + 60;
        }

        if (i >= 9)
            continue;

        if (gUnknown_203B15C->unk28[i] < 240)
        {
            gUnknown_203B15C->unk28[i] += 60;
            gUnknown_203B15C->sprites[i]->pos1.x = gUnknown_203B15C->unk28[i] + 60;
        }
    }
}

void sub_8137F68(void)
{
    u8 i;

    for (i = 0; i < 11; i++)
    {
        if (gUnknown_203B160->unk2C[i] > 156 + (8 * i))
        {
            gUnknown_203B160->unk2C[i] -= 60;

            if (gUnknown_203B160->unk2C[i] < 156 + (8 * i))
                gUnknown_203B160->unk2C[i] = 156 + (8 * i);

            gUnknown_203B160->sprites[i]->pos1.x = gUnknown_203B160->unk2C[i];
        }

        if (i >= 9)
            continue;

        if (gUnknown_203B15C->unk28[i] > 172 + (8 * i))
        {
            gUnknown_203B15C->unk28[i] -= 60;

            if (gUnknown_203B15C->unk28[i] < 172 + (8 * i))
                gUnknown_203B15C->unk28[i] = 172 + (8 * i);

            gUnknown_203B15C->sprites[i]->pos1.x = gUnknown_203B15C->unk28[i];
        }
    }
}

void sub_8137FF4(void)
{
    if (gMonSummaryScreen->unk324C < 240)
    {
        gMonSummaryScreen->unk324C += 60;
        if (gMonSummaryScreen->unk324C > 240)
            gMonSummaryScreen->unk324C = 240;

        if (gMonSummaryScreen->unk3238 == 0)
            SetGpuReg(REG_OFFSET_BG2HOFS, -gMonSummaryScreen->unk324C);
        else
            SetGpuReg(REG_OFFSET_BG1HOFS, -gMonSummaryScreen->unk324C);
    }
}

void sub_813805C(void)
{
    if (gMonSummaryScreen->unk324C >= 60)
    {
        gMonSummaryScreen->unk324C -= 60;
        if (gMonSummaryScreen->unk324C < 0)
            gMonSummaryScreen->unk324C = 0;

        if (gMonSummaryScreen->unk3238 == 0)
            SetGpuReg(REG_OFFSET_BG1HOFS, -gMonSummaryScreen->unk324C);
        else
            SetGpuReg(REG_OFFSET_BG2HOFS, -gMonSummaryScreen->unk324C);

        if (gMonSummaryScreen->curPageIndex != PSS_PAGE_MOVES_INFO)
            SetGpuReg(REG_OFFSET_BG0HOFS, -gMonSummaryScreen->unk324C);
    }
}

void sub_81380F0(void)
{
    if (gMonSummaryScreen->unk3224 == 1)
    {
        if (gMonSummaryScreen->curPageIndex != PSS_PAGE_MOVES_INFO)
            sub_8137FF4();
        else
            sub_813805C();
    }
    else
    {
        if (gMonSummaryScreen->curPageIndex != PSS_PAGE_MOVES)
            sub_813805C();
        else
            sub_8137FF4();
    }
}

void sub_8138134(void)
{
    if (gMonSummaryScreen->curPageIndex == PSS_PAGE_SKILLS
        && gMonSummaryScreen->unk3224 == 0)
        sub_8137F68();

    if (gMonSummaryScreen->curPageIndex == PSS_PAGE_MOVES
        && gMonSummaryScreen->unk3224 == 1)
        sub_8137F00();
}

void sub_813817C(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();

    if (gMonSummaryScreen->unk3244 == FALSE)
        return;

    sub_81380F0();
    sub_8138134();
}

void sub_81381AC(void)
{
    SetVBlankCallback(NULL);
    SetHBlankCallback(NULL);
}

void sub_81381C0(void)
{
    SetVBlankCallback(sub_813817C);
}

void sub_81381D0(void)
{
    u8 i;

    InitWindows(gUnknown_8463F9C);

    for (i = 0; i < 3; i++)
        gMonSummaryScreen->unk3000[i] = AddWindow(&gUnknown_8463F0C[i]);

    for (i = 0; i < 4; i++)
        switch (gMonSummaryScreen->curPageIndex)
        {
        case PSS_PAGE_INFO:
            gMonSummaryScreen->unk3000[i + 3] = AddWindow(&gUnknown_8463F3C[i]);
            break;
        case PSS_PAGE_SKILLS:
            gMonSummaryScreen->unk3000[i + 3] = AddWindow(&gUnknown_8463F5C[i]);
            break;
        case PSS_PAGE_MOVES:
        case PSS_PAGE_MOVES_INFO:
            gMonSummaryScreen->unk3000[i + 3] = AddWindow(&gUnknown_8463F7C[i]);
            break;
        default:
            break;
        }
}

void sub_8138280(u8 curPageIndex)
{
    u8 i;
    u32 bgPriority1 = GetGpuReg(REG_OFFSET_BG1CNT) & 3;
    u32 bgPriority2 = GetGpuReg(REG_OFFSET_BG2CNT) & 3;

    for (i = 0; i < 7; i++)
        gMonSummaryScreen->unk3000[i] = 0xff;

    if ((gMonSummaryScreen->unk3224 == 1 && gMonSummaryScreen->curPageIndex != PSS_PAGE_MOVES_INFO)
        || (gMonSummaryScreen->unk3224 == 0 && gMonSummaryScreen->curPageIndex == PSS_PAGE_MOVES))
    {
        if (bgPriority2 > bgPriority1)
            for (i = 0; i < 3; i++)
                gMonSummaryScreen->unk3000[i] = AddWindow(&gUnknown_8463F24[i]);
        else
            for (i = 0; i < 3; i++)
                gMonSummaryScreen->unk3000[i] = AddWindow(&gUnknown_8463F0C[i]);
    }
    else
    {
        if (bgPriority2 > bgPriority1)
            for (i = 0; i < 3; i++)
                gMonSummaryScreen->unk3000[i] = AddWindow(&gUnknown_8463F0C[i]);
        else
            for (i = 0; i < 3; i++)
                gMonSummaryScreen->unk3000[i] = AddWindow(&gUnknown_8463F24[i]);
    }

    for (i = 0; i < 4; i++)
        switch (curPageIndex)
        {
        case PSS_PAGE_INFO:
            gMonSummaryScreen->unk3000[i + 3] = AddWindow(&gUnknown_8463F3C[i]);
            break;
        case PSS_PAGE_SKILLS:
        default:
            gMonSummaryScreen->unk3000[i + 3] = AddWindow(&gUnknown_8463F5C[i]);
            break;
        case PSS_PAGE_MOVES:
        case PSS_PAGE_MOVES_INFO:
            gMonSummaryScreen->unk3000[i + 3] = AddWindow(&gUnknown_8463F7C[i]);
            break;
        }
}

void sub_8138414(u8 curPageIndex)
{
    u8 i;

    for (i = 0; i < 7; i++)
        RemoveWindow(gMonSummaryScreen->unk3000[i]);

}

void sub_8138440(void)
{
    switch (gMonSummaryScreen->curPageIndex)
    {
    case PSS_PAGE_INFO:
        SetHelpContext(HELPCONTEXT_POKEMON_INFO);
        break;
    case PSS_PAGE_SKILLS:
        SetHelpContext(HELPCONTEXT_POKEMON_SKILLS);
        break;
    case PSS_PAGE_MOVES:
    case PSS_PAGE_MOVES_INFO:
        SetHelpContext(HELPCONTEXT_POKEMON_MOVES);
        break;
    }
}

u8 sub_813847C(struct Pokemon * mon)
{
    u8 i;
    u8 multiplayerId;
    u32 trainerId = 0;

    if (gMonSummaryScreen->monList.mons == gEnemyParty)
    {
        multiplayerId = GetMultiplayerId() ^ 1;
        trainerId = gLinkPlayers[multiplayerId].trainerId & 0xffff;
        StringCopy(gMonSummaryScreen->summary.unk304C[0], gLinkPlayers[multiplayerId].name);
    }
    else
    {
        trainerId = GetPlayerTrainerId() & 0xffff;
        StringCopy(gMonSummaryScreen->summary.unk304C[0], gSaveBlock2Ptr->playerName);
    }

    if (trainerId != (GetMonData(mon, MON_DATA_OT_ID) & 0xffff))
        return FALSE;

    GetMonData(mon, MON_DATA_OT_NAME, gMonSummaryScreen->summary.unk304C[1]);

    if (!StringCompareWithoutExtCtrlCodes(gMonSummaryScreen->summary.unk304C[0], gMonSummaryScreen->summary.unk304C[1]))
        return TRUE;
    else
        return FALSE;

    return TRUE;
}

#define SUB_8138538_BASE_TILE_NUM (345)

void sub_8138538(void)
{
    switch (gMonSummaryScreen->curPageIndex)
    {
    case PSS_PAGE_INFO:
        if (!gMonSummaryScreen->isEgg)
        {
            FillBgTilemapBufferRect(3, 17 + SUB_8138538_BASE_TILE_NUM, 13, 0, 1, 1, 0);
            FillBgTilemapBufferRect(3, 33 + SUB_8138538_BASE_TILE_NUM, 13, 1, 1, 1, 0);
            FillBgTilemapBufferRect(3, 16 + SUB_8138538_BASE_TILE_NUM, 14, 0, 1, 1, 0);
            FillBgTilemapBufferRect(3, 32 + SUB_8138538_BASE_TILE_NUM, 14, 1, 1, 1, 0);
            FillBgTilemapBufferRect(3, 18 + SUB_8138538_BASE_TILE_NUM, 15, 0, 1, 1, 0);
            FillBgTilemapBufferRect(3, 34 + SUB_8138538_BASE_TILE_NUM, 15, 1, 1, 1, 0);
            FillBgTilemapBufferRect(3, 20 + SUB_8138538_BASE_TILE_NUM, 16, 0, 1, 1, 0);
            FillBgTilemapBufferRect(3, 36 + SUB_8138538_BASE_TILE_NUM, 16, 1, 1, 1, 0);
            FillBgTilemapBufferRect(3, 18 + SUB_8138538_BASE_TILE_NUM, 17, 0, 1, 1, 0);
            FillBgTilemapBufferRect(3, 34 + SUB_8138538_BASE_TILE_NUM, 17, 1, 1, 1, 0);
            FillBgTilemapBufferRect(3, 21 + SUB_8138538_BASE_TILE_NUM, 18, 0, 1, 1, 0);
            FillBgTilemapBufferRect(3, 37 + SUB_8138538_BASE_TILE_NUM, 18, 1, 1, 1, 0);
        }
        else
        {
            FillBgTilemapBufferRect(3, 17 + SUB_8138538_BASE_TILE_NUM, 13, 0, 1, 1, 0);
            FillBgTilemapBufferRect(3, 33 + SUB_8138538_BASE_TILE_NUM, 13, 1, 1, 1, 0);
            FillBgTilemapBufferRect(3, 48 + SUB_8138538_BASE_TILE_NUM, 14, 0, 1, 1, 0);
            FillBgTilemapBufferRect(3, 64 + SUB_8138538_BASE_TILE_NUM, 14, 1, 1, 1, 0);
            FillBgTilemapBufferRect(3, 2 + SUB_8138538_BASE_TILE_NUM, 15, 0, 4, 2, 0);
        }
        break;
    case PSS_PAGE_SKILLS:
        FillBgTilemapBufferRect(3, 49 + SUB_8138538_BASE_TILE_NUM, 13, 0, 1, 1, 0);
        FillBgTilemapBufferRect(3, 65 + SUB_8138538_BASE_TILE_NUM, 13, 1, 1, 1, 0);
        FillBgTilemapBufferRect(3, 1 + SUB_8138538_BASE_TILE_NUM, 14, 0, 1, 1, 0);
        FillBgTilemapBufferRect(3, 19 + SUB_8138538_BASE_TILE_NUM, 14, 1, 1, 1, 0);
        FillBgTilemapBufferRect(3, 17 + SUB_8138538_BASE_TILE_NUM, 15, 0, 1, 1, 0);
        FillBgTilemapBufferRect(3, 33 + SUB_8138538_BASE_TILE_NUM, 15, 1, 1, 1, 0);
        FillBgTilemapBufferRect(3, 16 + SUB_8138538_BASE_TILE_NUM, 16, 0, 1, 1, 0);
        FillBgTilemapBufferRect(3, 32 + SUB_8138538_BASE_TILE_NUM, 16, 1, 1, 1, 0);
        FillBgTilemapBufferRect(3, 18 + SUB_8138538_BASE_TILE_NUM, 17, 0, 1, 1, 0);
        FillBgTilemapBufferRect(3, 34 + SUB_8138538_BASE_TILE_NUM, 17, 1, 1, 1, 0);
        FillBgTilemapBufferRect(3, 21 + SUB_8138538_BASE_TILE_NUM, 18, 0, 1, 1, 0);
        FillBgTilemapBufferRect(3, 37 + SUB_8138538_BASE_TILE_NUM, 18, 1, 1, 1, 0);
        break;
    case PSS_PAGE_MOVES:
        FillBgTilemapBufferRect(3, 49 + SUB_8138538_BASE_TILE_NUM, 13, 0, 1, 1, 0);
        FillBgTilemapBufferRect(3, 65 + SUB_8138538_BASE_TILE_NUM, 13, 1, 1, 1, 0);
        FillBgTilemapBufferRect(3, 1 + SUB_8138538_BASE_TILE_NUM, 14, 0, 1, 1, 0);
        FillBgTilemapBufferRect(3, 19 + SUB_8138538_BASE_TILE_NUM, 14, 1, 1, 1, 0);
        FillBgTilemapBufferRect(3, 49 + SUB_8138538_BASE_TILE_NUM, 15, 0, 1, 1, 0);
        FillBgTilemapBufferRect(3, 65 + SUB_8138538_BASE_TILE_NUM, 15, 1, 1, 1, 0);
        FillBgTilemapBufferRect(3, 1 + SUB_8138538_BASE_TILE_NUM, 16, 0, 1, 1, 0);
        FillBgTilemapBufferRect(3, 19 + SUB_8138538_BASE_TILE_NUM, 16, 1, 1, 1, 0);
        FillBgTilemapBufferRect(3, 17 + SUB_8138538_BASE_TILE_NUM, 17, 0, 1, 1, 0);
        FillBgTilemapBufferRect(3, 33 + SUB_8138538_BASE_TILE_NUM, 17, 1, 1, 1, 0);
        FillBgTilemapBufferRect(3, 48 + SUB_8138538_BASE_TILE_NUM, 18, 0, 1, 1, 0);
        FillBgTilemapBufferRect(3, 64 + SUB_8138538_BASE_TILE_NUM, 18, 1, 1, 1, 0);
        break;
    case PSS_PAGE_MOVES_INFO:
        if (gMonSummaryScreen->mode == PSS_MODE_SELECT_MOVE)
        {
            FillBgTilemapBufferRect(3, 1 + SUB_8138538_BASE_TILE_NUM, 13, 0, 4, 1, 0);
            FillBgTilemapBufferRect(3, 19 + SUB_8138538_BASE_TILE_NUM, 13, 1, 4, 1, 0);
        }
        else
        {
            FillBgTilemapBufferRect(3, 49 + SUB_8138538_BASE_TILE_NUM, 13, 0, 1, 1, 0);
            FillBgTilemapBufferRect(3, 65 + SUB_8138538_BASE_TILE_NUM, 13, 1, 1, 1, 0);
            FillBgTilemapBufferRect(3, 1 + SUB_8138538_BASE_TILE_NUM, 14, 0, 1, 1, 0);
            FillBgTilemapBufferRect(3, 19 + SUB_8138538_BASE_TILE_NUM, 14, 1, 1, 1, 0);
            FillBgTilemapBufferRect(3, 49 + SUB_8138538_BASE_TILE_NUM, 15, 0, 1, 1, 0);
            FillBgTilemapBufferRect(3, 65 + SUB_8138538_BASE_TILE_NUM, 15, 1, 1, 1, 0);
            FillBgTilemapBufferRect(3, 1 + SUB_8138538_BASE_TILE_NUM, 16, 0, 1, 1, 0);
            FillBgTilemapBufferRect(3, 19 + SUB_8138538_BASE_TILE_NUM, 16, 1, 1, 1, 0);
        }
        FillBgTilemapBufferRect(3, 50 + SUB_8138538_BASE_TILE_NUM, 17, 0, 1, 1, 0);
        FillBgTilemapBufferRect(3, 66 + SUB_8138538_BASE_TILE_NUM, 17, 1, 1, 1, 0);
        FillBgTilemapBufferRect(3, 48 + SUB_8138538_BASE_TILE_NUM, 18, 0, 1, 1, 0);
        FillBgTilemapBufferRect(3, 64 + SUB_8138538_BASE_TILE_NUM, 18, 1, 1, 1, 0);
        break;
    }
}

void sub_8138A38(void)
{
    switch (gMonSummaryScreen->curPageIndex)
    {
    case PSS_PAGE_INFO:
        if (!gMonSummaryScreen->isEgg)
        {
            BlitMoveInfoIcon(gMonSummaryScreen->unk3000[3], gMonSummaryScreen->unk3220[0] + 1, 47, 35);

            if (gMonSummaryScreen->unk3220[0] != gMonSummaryScreen->unk3220[1])
                BlitMoveInfoIcon(gMonSummaryScreen->unk3000[3], gMonSummaryScreen->unk3220[1] + 1, 83, 35);
        }
        break;
    case PSS_PAGE_SKILLS:
        break;
    case PSS_PAGE_MOVES:
        break;
    case PSS_PAGE_MOVES_INFO:
        FillWindowPixelBuffer(gMonSummaryScreen->unk3000[6], 0);
        BlitMoveInfoIcon(gMonSummaryScreen->unk3000[6], gMonSummaryScreen->unk3220[0] + 1, 0, 3);

        if (gMonSummaryScreen->unk3220[0] != gMonSummaryScreen->unk3220[1])
            BlitMoveInfoIcon(gMonSummaryScreen->unk3000[6], gMonSummaryScreen->unk3220[1] + 1, 36, 3);

        PutWindowTilemap(gMonSummaryScreen->unk3000[6]);
        break;
    }
}

u8 GetLastViewedMonIndex(void)
{
    return gLastViewedMonIndex;
}

u8 GetMoveSlotToReplace(void)
{
    return gUnknown_203B16E;
}

void sub_8138B38(u8 mode)
{
    gMonSummaryScreen->mode = mode;
}

bool32 sub_8138B4C(void)
{
    if (!IsUpdateLinkStateCBActive()
        && IsMultiBattle() == TRUE
        && gReceivedRemoteLinkPlayers == 1
        && (gLastViewedMonIndex >= 4 || gLastViewedMonIndex == 1))
        return TRUE;

    return FALSE;
}

void sub_8138B8C(struct Pokemon * mon)
{
    if (!gMonSummaryScreen->isBoxMon)
    {
        struct Pokemon * partyMons = gMonSummaryScreen->monList.mons;
        *mon = partyMons[GetLastViewedMonIndex()];
    }
    else
    {
        struct BoxPokemon * boxMons = gMonSummaryScreen->monList.boxMons;
        BoxMonToMon(&boxMons[GetLastViewedMonIndex()], mon);
    }
}

u16 sub_8138BEC(struct Pokemon * mon, u8 moveSlot)
{
    u16 move;

    switch (moveSlot)
    {
    case 0:
        move = GetMonData(mon, MON_DATA_MOVE1);
        break;
    case 1:
        move = GetMonData(mon, MON_DATA_MOVE2);
        break;
    case 2:
        move = GetMonData(mon, MON_DATA_MOVE3);
        break;
    default:
        move = GetMonData(mon, MON_DATA_MOVE4);
    }

    return move;
}

u16 sub_8138C24(struct Pokemon * mon, u8 moveSlot)
{
    u16 pp;

    switch (moveSlot)
    {
    case 0:
        pp = GetMonData(mon, MON_DATA_PP1);
        break;
    case 1:
        pp = GetMonData(mon, MON_DATA_PP2);
        break;
    case 2:
        pp = GetMonData(mon, MON_DATA_PP3);
        break;
    default:
        pp = GetMonData(mon, MON_DATA_PP4);
    }
    return pp;
}

u8 sub_8138C5C(u32 status)
{
    if (GetMonData(&gMonSummaryScreen->currentMon, MON_DATA_HP) == 0)
        return AILMENT_FNT;

    if ((status & STATUS1_PSN_ANY) != 0)
        return AILMENT_PSN;

    if ((status & STATUS1_PARALYSIS) != 0)
        return AILMENT_PRZ;

    if ((status & STATUS1_SLEEP) != 0)
        return AILMENT_SLP;

    if ((status & STATUS1_FREEZE) != 0)
        return AILMENT_FRZ;

    if ((status & STATUS1_BURN) != 0)
        return AILMENT_BRN;

    if (CheckPartyPokerus(&gMonSummaryScreen->currentMon, 0))
        return AILMENT_PKRS;

    return AILMENT_NONE;
}

void sub_8138CD8(u8 id)
{
    u8 i;

    switch (gMonSummaryScreen->unk3288)
    {
    case 0:
        if (MenuHelpers_CallLinkSomething() == TRUE || sub_800B270() == TRUE)
            return;

        if (JOY_NEW(DPAD_UP))
        {
            if (gUnknown_203B16D > 0)
            {
                gMonSummaryScreen->unk3288 = 2;
                PlaySE(SE_SELECT);

                for (i = gUnknown_203B16D; i > 0; i--)
                    if (gMonSummaryScreen->unk325A[i - 1] != 0)
                    {
                        PlaySE(SE_SELECT);
                        gUnknown_203B16D = i - 1;
                        return;
                    }
            }
            else
            {
                gUnknown_203B16D = 4;
                gMonSummaryScreen->unk3288 = 2;
                PlaySE(SE_SELECT);

                if (gMonSummaryScreen->unk3268 == TRUE)
                    for (i = gUnknown_203B16D; i > 0; i--)
                        if (gMonSummaryScreen->unk325A[i - 1] != 0)
                        {
                            PlaySE(SE_SELECT);
                            gUnknown_203B16D = i - 1;
                            return;
                        }
            }
        }
        else if (JOY_NEW(DPAD_DOWN))
        {
            if (gUnknown_203B16D < 4)
            {
                u8 v0 = 4;

                gMonSummaryScreen->unk3288 = 2;

                if (gMonSummaryScreen->unk3268 == TRUE)
                {
                    if (gUnknown_203B16D == 5 - 2)
                    {
                        gUnknown_203B16D = 0;
                        gMonSummaryScreen->unk3288 = 2;
                        PlaySE(SE_SELECT);
                        return;
                    }
                    v0--;
                }

                for (i = gUnknown_203B16D; i < v0; i++)
                    if (gMonSummaryScreen->unk325A[i + 1] != 0)
                    {
                        PlaySE(SE_SELECT);
                        gUnknown_203B16D = i + 1;
                        return;
                    }

                if (!gMonSummaryScreen->unk3268)
                {
                    PlaySE(SE_SELECT);
                    gUnknown_203B16D = i;
                }
                else
                {
                    PlaySE(SE_SELECT);
                    gUnknown_203B16D = 0;
                }

                return;
            }
            else if (gUnknown_203B16D == 4)
            {
                gUnknown_203B16D = 0;
                gMonSummaryScreen->unk3288 = 2;
                PlaySE(SE_SELECT);
                return;
            }
        }
        else if (JOY_NEW(A_BUTTON))
        {
            PlaySE(SE_SELECT);
            if (gUnknown_203B16D == 4)
            {
                gUnknown_203B16D = 0;
                gUnknown_203B16E = 0;
                gMonSummaryScreen->unk3268 = FALSE;
                sub_813A0E8(1);
                gMonSummaryScreen->unk3224 = 0;
                sub_8138414(gMonSummaryScreen->curPageIndex);
                gMonSummaryScreen->curPageIndex--;
                gMonSummaryScreen->unk3288 = 1;
                return;
            }

            if (gMonSummaryScreen->unk3268 != TRUE)
            {
                if (gMonSummaryScreen->isEnemyParty == FALSE
                    && gMain.inBattle == 0
                    && gReceivedRemoteLinkPlayers == 0)
                {
                    gUnknown_203B16E = gUnknown_203B16D;
                    gMonSummaryScreen->unk3268 = TRUE;
                }
                return;
            }
            else
            {
                gMonSummaryScreen->unk3268 = FALSE;

                if (gUnknown_203B16D == gUnknown_203B16E)
                    return;

                if (gMonSummaryScreen->isBoxMon == 0)
                    sub_81390B0();
                else
                    sub_81391EC();

                sub_8139328(&gMonSummaryScreen->currentMon);
                sub_81367B0();
                gMonSummaryScreen->unk3288 = 2;
                return;
            }
        }
        else if (JOY_NEW(B_BUTTON))
        {
            if (gMonSummaryScreen->unk3268 == TRUE)
            {
                gUnknown_203B16E = gUnknown_203B16D;
                gMonSummaryScreen->unk3268 = FALSE;
                return;
            }

            if (gUnknown_203B16D == 4)
            {
                gUnknown_203B16D = 0;
                gUnknown_203B16E = 0;
            }

            sub_813A0E8(1);
            gMonSummaryScreen->unk3224 = 0;
            sub_8138414(gMonSummaryScreen->curPageIndex);
            gMonSummaryScreen->curPageIndex--;
            gMonSummaryScreen->unk3288 = 1;
        }
        break;
    case 1:
        gTasks[gMonSummaryScreen->unk3018].func = sub_81351A0;
        gMonSummaryScreen->unk3288 = 0;
        break;
    case 2:
        sub_8136F4C();
        sub_81374E8();
        sub_8137BD0();
        gMonSummaryScreen->unk3288 = 3;
        break;
    case 3:
        if (MenuHelpers_CallLinkSomething() == TRUE || sub_800B270() == TRUE)
            return;

        CopyWindowToVram(gMonSummaryScreen->unk3000[3], 2);
        CopyWindowToVram(gMonSummaryScreen->unk3000[4], 2);
        CopyWindowToVram(gMonSummaryScreen->unk3000[5], 2);
        CopyWindowToVram(gMonSummaryScreen->unk3000[6], 2);
        CopyBgTilemapBufferToVram(0);
        CopyBgTilemapBufferToVram(3);
        gMonSummaryScreen->unk3288 = 0;
        break;
    default:
        break;
    }
}

void sub_81390B0(void)
{
    struct Pokemon * partyMons;
    struct Pokemon * mon;

    u16 move1, move2;
    u8 pp1, pp2;
    u8 allMovesPPBonuses;
    u8 move1ppBonus, move2ppBonus;

    partyMons = gMonSummaryScreen->monList.mons;
    mon = &partyMons[GetLastViewedMonIndex()];

    move1 = GetMonData(mon, MON_DATA_MOVE1 + gUnknown_203B16D);
    move2 = GetMonData(mon, MON_DATA_MOVE1 + gUnknown_203B16E);

    pp1 = GetMonData(mon, MON_DATA_PP1 + gUnknown_203B16D);
    pp2 = GetMonData(mon, MON_DATA_PP1 + gUnknown_203B16E);

    allMovesPPBonuses = GetMonData(mon, MON_DATA_PP_BONUSES);

    move1ppBonus = (allMovesPPBonuses & gPPUpGetMask[gUnknown_203B16D]) >> (gUnknown_203B16D * 2);
    move2ppBonus = (allMovesPPBonuses & gPPUpGetMask[gUnknown_203B16E]) >> (gUnknown_203B16E * 2);

    allMovesPPBonuses &= ~gPPUpGetMask[gUnknown_203B16D];
    allMovesPPBonuses &= ~gPPUpGetMask[gUnknown_203B16E];
    allMovesPPBonuses |= (move1ppBonus << (gUnknown_203B16E * 2)) + (move2ppBonus << (gUnknown_203B16D * 2));

    SetMonData(mon, MON_DATA_MOVE1 + gUnknown_203B16D, (u8 *)&move2);
    SetMonData(mon, MON_DATA_MOVE1 + gUnknown_203B16E, (u8 *)&move1);
    SetMonData(mon, MON_DATA_PP1 + gUnknown_203B16D, &pp2);
    SetMonData(mon, MON_DATA_PP1 + gUnknown_203B16E, &pp1);
    SetMonData(mon, MON_DATA_PP_BONUSES, &allMovesPPBonuses);
}

void sub_81391EC(void)
{
    struct BoxPokemon * boxMons;
    struct BoxPokemon * boxMon;

    u16 move1, move2;
    u8 pp1, pp2;
    u8 allMovesPPBonuses;
    u8 move1ppBonus, move2ppBonus;

    boxMons = gMonSummaryScreen->monList.boxMons;
    boxMon = &boxMons[GetLastViewedMonIndex()];

    move1 = GetBoxMonData(boxMon, MON_DATA_MOVE1 + gUnknown_203B16D);
    move2 = GetBoxMonData(boxMon, MON_DATA_MOVE1 + gUnknown_203B16E);

    pp1 = GetBoxMonData(boxMon, MON_DATA_PP1 + gUnknown_203B16D);
    pp2 = GetBoxMonData(boxMon, MON_DATA_PP1 + gUnknown_203B16E);

    allMovesPPBonuses = GetBoxMonData(boxMon, MON_DATA_PP_BONUSES);

    move1ppBonus = (allMovesPPBonuses & gPPUpGetMask[gUnknown_203B16D]) >> (gUnknown_203B16D * 2);
    move2ppBonus = (allMovesPPBonuses & gPPUpGetMask[gUnknown_203B16E]) >> (gUnknown_203B16E * 2);

    allMovesPPBonuses &= ~gPPUpGetMask[gUnknown_203B16D];
    allMovesPPBonuses &= ~gPPUpGetMask[gUnknown_203B16E];
    allMovesPPBonuses |= (move1ppBonus << (gUnknown_203B16E * 2)) + (move2ppBonus << (gUnknown_203B16D * 2));

    SetBoxMonData(boxMon, MON_DATA_MOVE1 + gUnknown_203B16D, (u8 *)&move2);
    SetBoxMonData(boxMon, MON_DATA_MOVE1 + gUnknown_203B16E, (u8 *)&move1);
    SetBoxMonData(boxMon, MON_DATA_PP1 + gUnknown_203B16D, &pp2);
    SetBoxMonData(boxMon, MON_DATA_PP1 + gUnknown_203B16E, &pp1);
    SetBoxMonData(boxMon, MON_DATA_PP_BONUSES, &allMovesPPBonuses);
}

void sub_8139328(struct Pokemon * mon)
{
    if (!gMonSummaryScreen->isBoxMon)
    {
        struct Pokemon * partyMons;
        partyMons = gMonSummaryScreen->monList.mons;
        *mon = partyMons[GetLastViewedMonIndex()];
    }
    else
    {
        struct BoxPokemon * boxMons;
        boxMons = gMonSummaryScreen->monList.boxMons;
        BoxMonToMon(&boxMons[GetLastViewedMonIndex()], mon);
    }
}

u8 sub_8139388(void)
{
    u16 move;

    move = sub_8138BEC(&gMonSummaryScreen->currentMon, gUnknown_203B16D);

    if (IsMoveHm(move) == TRUE && gMonSummaryScreen->mode != PSS_MODE_FORGET_MOVE)
        return FALSE;

    return TRUE;
}

void sub_81393D4(u8 taskId)
{
    u8 i;

    switch (gMonSummaryScreen->unk3288)
    {
    case 0:
        BeginNormalPaletteFade(0xffffffff, 0, 16, 0, 0);
        gMonSummaryScreen->unk3288++;
        break;
    case 1:
        if (!gPaletteFade.active)
        {
            sub_813B784();
            gMonSummaryScreen->unk3288++;
        }
        break;
    case 2:
        if (JOY_NEW(DPAD_UP))
        {
            if (gUnknown_203B16D > 0)
            {
                gMonSummaryScreen->unk3288 = 3;
                PlaySE(SE_SELECT);
                for (i = gUnknown_203B16D; i > 0; i--)
                    if (gMonSummaryScreen->unk325A[i - 1] != 0)
                    {
                        PlaySE(SE_SELECT);
                        gUnknown_203B16D = i - 1;
                        return;
                    }
            }
            else
            {
                gUnknown_203B16D = 4;
                gMonSummaryScreen->unk3288 = 3;
                PlaySE(SE_SELECT);
                return;
            }
        }
        else if (JOY_NEW(DPAD_DOWN))
        {
            if (gUnknown_203B16D < 4)
            {
                u8 v0 = 4;

                gMonSummaryScreen->unk3288 = 3;

                if (gMonSummaryScreen->unk3268 == TRUE)
                    v0--;

                for (i = gUnknown_203B16D; i < v0; i++)
                    if (gMonSummaryScreen->unk325A[i + 1] != 0)
                    {
                        PlaySE(SE_SELECT);
                        gUnknown_203B16D = i + 1;
                        return;
                    }

                if (!gMonSummaryScreen->unk3268)
                {
                    PlaySE(SE_SELECT);
                    gUnknown_203B16D = i;
                }

                return;
            }
            else if (gUnknown_203B16D == 4)
            {
                gUnknown_203B16D = 0;
                gMonSummaryScreen->unk3288 = 3;
                PlaySE(SE_SELECT);
                return;
            }
        }
        else if (JOY_NEW(A_BUTTON))
        {
            if (sub_8139388() == TRUE || gUnknown_203B16D == 4)
            {
                PlaySE(SE_SELECT);
                gUnknown_203B16E = gUnknown_203B16D;
                gSpecialVar_0x8005 = gUnknown_203B16E;
                gMonSummaryScreen->unk3288 = 6;
            }
            else
            {
                PlaySE(SE_HAZURE);
                gMonSummaryScreen->unk3288 = 5;
            }
        }
        else if (JOY_NEW(B_BUTTON))
        {
            gUnknown_203B16E = 4;
            gSpecialVar_0x8005 = (u16)gUnknown_203B16E;
            gMonSummaryScreen->unk3288 = 6;
        }
        break;
    case 3:
        sub_8136F4C();
        sub_81374E8();
        sub_8137BD0();
        gMonSummaryScreen->unk3288 = 4;
        break;
    case 4:
        if (MenuHelpers_CallLinkSomething() == TRUE || sub_800B270() == TRUE)
            return;

        CopyWindowToVram(gMonSummaryScreen->unk3000[3], 2);
        CopyWindowToVram(gMonSummaryScreen->unk3000[4], 2);
        CopyWindowToVram(gMonSummaryScreen->unk3000[5], 2);
        CopyWindowToVram(gMonSummaryScreen->unk3000[6], 2);
        CopyBgTilemapBufferToVram(0);
        CopyBgTilemapBufferToVram(3);
        gMonSummaryScreen->unk3288 = 2;
        break;
    case 5:
        FillWindowPixelBuffer(gMonSummaryScreen->unk3000[4], 0);
        AddTextPrinterParameterized4(gMonSummaryScreen->unk3000[4], 2,
                                     7, 42,
                                     0, 0,
                                     gUnknown_8463FA4[0], TEXT_SPEED_FF,
                                     gUnknown_8419CB9);
        CopyWindowToVram(gMonSummaryScreen->unk3000[4], 2);
        CopyBgTilemapBufferToVram(0);
        CopyBgTilemapBufferToVram(3);
        gMonSummaryScreen->unk3288 = 2;
        break;
    case 6:
        BeginNormalPaletteFade(0xffffffff, 0, 0, 16, 0);
        gMonSummaryScreen->unk3288++;
        break;
    default:
        if (!gPaletteFade.active)
            sub_8137E64(taskId);
        break;
    }
}

void sub_8139768(struct Sprite * sprite)
{
    if (gMonSummaryScreen->unk3020 >= 2)
        return;

    if (gUnknown_203B170->unk04++ >= 2)
    {
        u8 v0;

        switch (gUnknown_203B170->unk08)
        {
        case 0:
            sprite->pos1.y += gUnknown_8463FBE[gUnknown_203B170->unk00++];
            v0 = ARRAY_COUNT(gUnknown_8463FBE);
            break;
        case 1:
            sprite->pos1.y += gUnknown_8463FC1[gUnknown_203B170->unk00++];
            v0 = ARRAY_COUNT(gUnknown_8463FC1);
            break;
        case 2:
            sprite->pos1.y += gUnknown_8463FC6[gUnknown_203B170->unk00++];
            v0 = ARRAY_COUNT(gUnknown_8463FC6);
            break;
        case 3:
        default:
            sprite->pos1.y += gUnknown_8463FCD[gUnknown_203B170->unk00++];
            v0 = ARRAY_COUNT(gUnknown_8463FCD);
            break;
        }

        if (gUnknown_203B170->unk00 >= v0)
        {
            gUnknown_203B170->unk00 = 0;
            gMonSummaryScreen->unk3020++;
        }

        gUnknown_203B170->unk04 = 0;
    }
}

void sub_8139868(struct Sprite * sprite)
{
    if (gMonSummaryScreen->unk3020 >= 2)
        return;

    switch (gUnknown_203B170->unk08)
    {
    case 0:
    default:
        if (gUnknown_203B170->unk04++ >= 120)
        {
            sprite->pos1.x += gUnknown_8463FD4[gUnknown_203B170->unk00];
            if (++gUnknown_203B170->unk00 >= ARRAY_COUNT(gUnknown_8463FD4))
            {
                gUnknown_203B170->unk00 = 0;
                gUnknown_203B170->unk04 = 0;
                gMonSummaryScreen->unk3020++;
            }
        }
        break;
    case 1:
        if (gUnknown_203B170->unk04++ >= 90)
        {
            sprite->pos1.x += gUnknown_8463FDF[gUnknown_203B170->unk00];
            if (++gUnknown_203B170->unk00 >= ARRAY_COUNT(gUnknown_8463FDF))
            {
                gUnknown_203B170->unk00 = 0;
                gUnknown_203B170->unk04 = 0;
                gMonSummaryScreen->unk3020++;
            }
        }
        break;
    case 2:
        if (gUnknown_203B170->unk04++ >= 60)
        {
            sprite->pos1.x += gUnknown_8463FEA[gUnknown_203B170->unk00];
            if (++gUnknown_203B170->unk00 >= ARRAY_COUNT(gUnknown_8463FEA))
            {
                gUnknown_203B170->unk00 = 0;
                gUnknown_203B170->unk04 = 0;
                gMonSummaryScreen->unk3020++;
            }
        }
        break;
    }
}

void nullsub_96(struct Sprite * sprite)
{
}

void sub_813995C(void)
{
    u16 spriteId;
    u16 species;
    u32 personality;
    u32 trainerId;

    gUnknown_203B170 = AllocZeroed(sizeof(struct Struct203B170));

    species = GetMonData(&gMonSummaryScreen->currentMon, MON_DATA_SPECIES2);
    personality = GetMonData(&gMonSummaryScreen->currentMon, MON_DATA_PERSONALITY);
    trainerId = GetMonData(&gMonSummaryScreen->currentMon, MON_DATA_OT_ID);

    if (gMonSummaryScreen->savedCallback == CB2_ReturnToTradeMenuFromSummary)
    {
        if (gMonSummaryScreen->isEnemyParty == TRUE)
            spriteId = CreateMonPicSprite(species, trainerId, personality, 1, 60, 65, 12, 0xffff, 1);
        else
            spriteId = CreateMonPicSprite_HandleDeoxys(species, trainerId, personality, 1, 60, 65, 12, 0xffff);
    }
    else
    {
        if (sub_804455C(3, gLastViewedMonIndex))
            spriteId = CreateMonPicSprite(species, trainerId, personality, 1, 60, 65, 12, 0xffff, 1);
        else
            spriteId = CreateMonPicSprite_HandleDeoxys(species, trainerId, personality, 1, 60, 65, 12, 0xffff);
    }

    FreeSpriteOamMatrix(&gSprites[spriteId]);

    if (!IsPokeSpriteNotFlipped(species))
        gSprites[spriteId].hFlip = TRUE;
    else
        gSprites[spriteId].hFlip = FALSE;

    gMonSummaryScreen->unk3010 = spriteId;

    sub_8139C44(1);
    sub_8139AAC(spriteId);
}

void sub_8139AAC(u16 spriteId)
{
    u16 curHp;
    u16 maxHp;

    gMonSummaryScreen->unk3020 = 0;

    if (gMonSummaryScreen->isEgg == TRUE)
    {
        u8 friendship = GetMonData(&gMonSummaryScreen->currentMon, MON_DATA_FRIENDSHIP);

        if (friendship <= 5)
            gUnknown_203B170->unk08 = 2;
        else
        {
            if (friendship <= 10)
                gUnknown_203B170->unk08 = 1;
            else if (friendship <= 40)
                gUnknown_203B170->unk08 = 0;
        }

        gSprites[spriteId].callback = sub_8139868;
        return;
    }

    if (gMonSummaryScreen->unk326C != AILMENT_NONE && gMonSummaryScreen->unk326C != AILMENT_PKRS)
    {
        if (gMonSummaryScreen->unk326C == AILMENT_FNT)
            return;

        gSprites[spriteId].callback = nullsub_96;
        return;
    }

    curHp = GetMonData(&gMonSummaryScreen->currentMon, MON_DATA_HP);
    maxHp = GetMonData(&gMonSummaryScreen->currentMon, MON_DATA_MAX_HP);

    if (curHp == maxHp)
        gUnknown_203B170->unk08 = 3;
    else if (maxHp * 0.8 <= curHp)
        gUnknown_203B170->unk08 = 2;
    else if (maxHp * 0.6 <= curHp)
        gUnknown_203B170->unk08 = 1;
    else
        gUnknown_203B170->unk08 = 0;

    gSprites[spriteId].callback = sub_8139768;
}

void sub_8139C44(u8 invisible)
{
    gSprites[gMonSummaryScreen->unk3010].invisible = invisible;
}

void sub_8139C80(void)
{
    FreeAndDestroyMonPicSprite(gMonSummaryScreen->unk3010);
    FREE_AND_SET_NULL(gUnknown_203B170);
}

void sub_8139CB0(void)
{
    u16 ballItemId;
    u8 ballId;

    if (!gMonSummaryScreen->isEgg)
        ballItemId = GetMonData(&gMonSummaryScreen->currentMon, MON_DATA_POKEBALL);
    else
        ballItemId = 0;

    ballId = ItemIdToBallId(ballItemId);
    LoadBallGfx(ballId);

    gMonSummaryScreen->unk300C = CreateSprite(&gBallSpriteTemplates[ballId], 106, 88, 0);
    gSprites[gMonSummaryScreen->unk300C].callback = SpriteCallbackDummy;
    gSprites[gMonSummaryScreen->unk300C].oam.priority = 0;

    sub_8139D54(1);
}

void sub_8139D54(u8 invisible)
{
    gSprites[gMonSummaryScreen->unk300C].invisible = invisible;
}

void sub_8139D90(void)
{
    DestroySpriteAndFreeResources2(&gSprites[gMonSummaryScreen->unk300C]);
}

void sub_8139DBC(void)
{
    u16 species;
    u32 personality;

    species = GetMonData(&gMonSummaryScreen->currentMon, MON_DATA_SPECIES2);
    personality = GetMonData(&gMonSummaryScreen->currentMon, MON_DATA_PERSONALITY);

    SafeLoadMonIconPalette(species);

    if (gMonSummaryScreen->savedCallback == CB2_ReturnToTradeMenuFromSummary)
    {
        if (gMonSummaryScreen->isEnemyParty == TRUE)
            gMonSummaryScreen->unk3014 = CreateMonIcon(species, SpriteCallbackDummy, 24, 32, 0, personality, 0);
        else
            gMonSummaryScreen->unk3014 = CreateMonIcon(species, SpriteCallbackDummy, 24, 32, 0, personality, 1);
    }
    else
    {
        if (sub_804455C(3, gLastViewedMonIndex))
            gMonSummaryScreen->unk3014 = CreateMonIcon(species, SpriteCallbackDummy, 24, 32, 0, personality, 0);
        else
            gMonSummaryScreen->unk3014 = CreateMonIcon(species, SpriteCallbackDummy, 24, 32, 0, personality, 1);
    }

    if (!IsPokeSpriteNotFlipped(species))
        gSprites[gMonSummaryScreen->unk3014].hFlip = TRUE;
    else
        gSprites[gMonSummaryScreen->unk3014].hFlip = FALSE;

    sub_8139EE4(1);
}

void sub_8139EE4(u8 invisible)
{
    gSprites[gMonSummaryScreen->unk3014].invisible = invisible;
}

void sub_8139F20(void)
{
    u16 species;
    species = GetMonData(&gMonSummaryScreen->currentMon, MON_DATA_SPECIES2);
    SafeFreeMonIconPalette(species);
    DestroyMonIcon(&gSprites[gMonSummaryScreen->unk3014]);
}

void sub_8139F64(u16 tileTag, u16 palTag)
{
    u8 i;
    u8 spriteId;
    void * gfxBufferPtrs[2];
    gfxBufferPtrs[0] = AllocZeroed(0x20 * 64);
    gfxBufferPtrs[1] = AllocZeroed(0x20 * 64);

    gUnknown_203B148[0] = AllocZeroed(sizeof(struct Struct203B148));
    gUnknown_203B148[1] = AllocZeroed(sizeof(struct Struct203B148));
    gUnknown_203B148[2] = AllocZeroed(sizeof(struct Struct203B148));
    gUnknown_203B148[3] = AllocZeroed(sizeof(struct Struct203B148));

    LZ77UnCompWram(gUnknown_8463740, gfxBufferPtrs[0]);
    LZ77UnCompWram(gUnknown_846386C, gfxBufferPtrs[1]);

    for (i = 0; i < 4; i++)
    {
        struct SpriteSheet sheet = {
            .data = gfxBufferPtrs[i % 2],
            .size = 0x20 * 64,
            .tag = tileTag + i
        };

        struct SpritePalette palette = {.data = gUnknown_8463720, .tag = palTag};
        struct SpriteTemplate template = {
            .tileTag = tileTag + i,
            .paletteTag = palTag,
            .oam = &gUnknown_846398C,
            .anims = gUnknown_84639A4,
            .images = NULL,
            .affineAnims = gDummySpriteAffineAnimTable,
            .callback = sub_813A124,
        };

        LoadSpriteSheet(&sheet);
        LoadSpritePalette(&palette);

        spriteId = CreateSprite(&template, 64 * (i % 2) + 152, gUnknown_203B16D * 28 + 34, i % 2);
        gUnknown_203B148[i]->sprite = &gSprites[spriteId];
        gUnknown_203B148[i]->unk04 = i;
        gUnknown_203B148[i]->unk06 = tileTag + i;
        gUnknown_203B148[i]->unk08 = palTag;
        gUnknown_203B148[i]->sprite->subpriority = i;

        if (i > 1)
            StartSpriteAnim(gUnknown_203B148[i]->sprite, 1);
    }

    sub_813A0E8(1);

    FREE_AND_SET_NULL_IF_SET(gfxBufferPtrs[0]);
    FREE_AND_SET_NULL_IF_SET(gfxBufferPtrs[1]);
}

void sub_813A0E8(u8 invisible)
{
    u8 i;
    for (i = 0; i < 4; i++)
        gUnknown_203B148[i]->sprite->invisible = invisible;
}

void sub_813A124(struct Sprite * sprite)
{
    u8 i;

    for (i = 0; i < 4; i++)
    {
        if (gMonSummaryScreen->unk3268 == TRUE && i > 1)
            continue;

        gUnknown_203B148[i]->sprite->pos1.y = gUnknown_203B16D * 28 + 34;
    }

    if (gMonSummaryScreen->unk3268 != TRUE)
    {
        if (gMonSummaryScreen->curPageIndex == PSS_PAGE_MOVES_INFO)
        {
            gUnknown_203B148[0]->sprite->invisible = FALSE;
            gUnknown_203B148[1]->sprite->invisible = FALSE;
        }
        return;
    }

    for (i = 0; i < 2; i++)
    {
        sprite = gUnknown_203B148[i]->sprite;
        sprite->data[0]++;

        if (sprite->invisible)
        {
            if (sprite->data[0] > 60)
            {
                sprite->invisible = FALSE;
                sprite->data[0] = 0;
            }
        }
        else if (sprite->data[0] > 60)
        {
            sprite->invisible = TRUE;
            sprite->data[0] = 0;
        }
    }
}

void sub_813A21C(void)
{
    u8 i;

    for (i = 0; i < 4; i++)
    {
        if (gUnknown_203B148[i]->sprite != NULL)
            DestroySpriteAndFreeResources(gUnknown_203B148[i]->sprite);

        FREE_AND_SET_NULL_IF_SET(gUnknown_203B148[i]);
    }
}

void sub_813A254(u16 tileTag, u16 palTag)
{
    u16 spriteId;
    void * gfxBufferPtr;

    gUnknown_203B158 = AllocZeroed(sizeof(struct Struct203B158));
    gfxBufferPtr = AllocZeroed(0x20 * 32);

    LZ77UnCompWram(gUnknown_8E9BF48, gfxBufferPtr);

    if (gUnknown_203B158 != NULL)
    {
        struct SpriteSheet sheet = {
            .data = gfxBufferPtr,
            .size = 0x20 * 32,
            .tag = tileTag
        };

        struct SpritePalette palette = {.data = gUnknown_8E9BF28, .tag = palTag};
        struct SpriteTemplate template = {
            .tileTag = tileTag,
            .paletteTag = palTag,
            .oam = &gUnknown_84639AC,
            .anims = gUnknown_84639F4,
            .images = NULL,
            .affineAnims = gDummySpriteAffineAnimTable,
            .callback = SpriteCallbackDummy,
        };

        LoadSpriteSheet(&sheet);
        LoadSpritePalette(&palette);

        spriteId = CreateSprite(&template, 0, 0, 0);
        gUnknown_203B158->sprite = &gSprites[spriteId];
        gUnknown_203B158->unk04 = tileTag;
        gUnknown_203B158->unk06 = palTag;
    }

    sub_813A3B8(1);
    sub_813A35C();
    FREE_AND_SET_NULL_IF_SET(gfxBufferPtr);
}

void sub_813A334(void)
{
    if (gUnknown_203B158->sprite != NULL)
        DestroySpriteAndFreeResources(gUnknown_203B158->sprite);

    FREE_AND_SET_NULL_IF_SET(gUnknown_203B158);
}

void sub_813A35C(void)
{
    gMonSummaryScreen->unk326C = sub_8138C5C(GetMonData(&gMonSummaryScreen->currentMon, MON_DATA_STATUS));

    if (gMonSummaryScreen->unk326C == AILMENT_NONE)
    {
        sub_813A3B8(1);
        return;
    }

    StartSpriteAnim(gUnknown_203B158->sprite, gMonSummaryScreen->unk326C - 1);
    sub_813A3B8(0);
}

void sub_813A3B8(u8 invisible)
{
    if (gMonSummaryScreen->unk326C == AILMENT_NONE || gMonSummaryScreen->isEgg)
        gUnknown_203B158->sprite->invisible = TRUE;
    else
        gUnknown_203B158->sprite->invisible = invisible;

    if (gMonSummaryScreen->curPageIndex == PSS_PAGE_MOVES_INFO)
    {
        if (gUnknown_203B158->sprite->pos1.y != 45)
        {
            gUnknown_203B158->sprite->pos1.x = 16;
            gUnknown_203B158->sprite->pos1.y = 45;
            return;
        }
    }
    else if (gUnknown_203B158->sprite->pos1.y != 38)
    {
        gUnknown_203B158->sprite->pos1.x = 16;
        gUnknown_203B158->sprite->pos1.y = 38;
        return;
    }
}

void sub_813A45C(u16 tileTag, u16 palTag)
{
    u8 i;
    u8 spriteId;
    void * gfxBufferPtr;
    u32 curHp;
    u32 maxHp;
    u8 hpBarPalTagOffset = 0;

    gUnknown_203B15C = AllocZeroed(sizeof(struct Struct203B15C));
    gfxBufferPtr = AllocZeroed(0x20 * 12);
    LZ77UnCompWram(gUnknown_8E9B4B8, gfxBufferPtr);

    curHp = GetMonData(&gMonSummaryScreen->currentMon, MON_DATA_HP);
    maxHp = GetMonData(&gMonSummaryScreen->currentMon, MON_DATA_MAX_HP);

    if (maxHp / 4 > curHp)
        hpBarPalTagOffset = 2;
    else if (maxHp / 2 > curHp)
        hpBarPalTagOffset = 1;

    if (gfxBufferPtr != NULL)
    {
        struct SpriteSheet sheet = {
            .data = gfxBufferPtr,
            .size = 0x20 * 12,
            .tag = tileTag
        };

        struct SpritePalette palette1 = {.data = gUnknown_8463FFC[0], .tag = palTag};
        struct SpritePalette palette2 = {.data = gUnknown_8463FFC[1], .tag = palTag + 1};
        struct SpritePalette palette3 = {.data = gUnknown_8463FFC[2], .tag = palTag + 2};

        LoadSpriteSheet(&sheet);
        LoadSpritePalette(&palette1);
        LoadSpritePalette(&palette2);
        LoadSpritePalette(&palette3);
    }

    for (i = 0; i < 9; i++)
    {
        struct SpriteTemplate template = {
            .tileTag = tileTag,
            .paletteTag = palTag + hpBarPalTagOffset,
            .oam = &gUnknown_8463A14,
            .anims = gUnknown_8463A7C,
            .images = NULL,
            .affineAnims = gDummySpriteAffineAnimTable,
            .callback = SpriteCallbackDummy,
        };

        gUnknown_203B15C->unk28[i] = i * 8 + 172;
        spriteId = CreateSprite(&template, gUnknown_203B15C->unk28[i], 36, 0);
        gUnknown_203B15C->sprites[i] = &gSprites[spriteId];
        gUnknown_203B15C->sprites[i]->invisible = FALSE;
        gUnknown_203B15C->sprites[i]->oam.priority = 2;
        gUnknown_203B15C->unk3C = tileTag;
        gUnknown_203B15C->unk3E = palTag;
        StartSpriteAnim(gUnknown_203B15C->sprites[i], 8);
    }

    sub_813A620();
    sub_813A838(1);

    FREE_AND_SET_NULL_IF_SET(gfxBufferPtr);
}

void sub_813A620(void)
{
    u8 numWholeHpBarTiles = 0;
    u8 i;
    u8 animNum;
    u8 two = 2;
    u8 hpBarPalOffset = 0;
    u32 curHp;
    u32 maxHp;
    s64 v0;
    s64 v1;

    if (gMonSummaryScreen->isEgg)
        return;

    curHp = GetMonData(&gMonSummaryScreen->currentMon, MON_DATA_HP);
    maxHp = GetMonData(&gMonSummaryScreen->currentMon, MON_DATA_MAX_HP);

    if (maxHp / 5 >= curHp)
        hpBarPalOffset = 2;
    else if (maxHp / 2 >= curHp)
        hpBarPalOffset = 1;

    switch (GetHPBarLevel(curHp, maxHp))
    {
    case 3:
    default:
        hpBarPalOffset = 0;
        break;
    case 2:
        hpBarPalOffset = 1;
        break;
    case 1:
        hpBarPalOffset = 2;
        break;
    }

    for (i = 0; i < 9; i++)
        gUnknown_203B15C->sprites[i]->oam.paletteNum = IndexOfSpritePaletteTag(TAG_PSS_UNK_78) + hpBarPalOffset;

    if (curHp == maxHp)
        for (i = two; i < 8; i++)
            StartSpriteAnim(gUnknown_203B15C->sprites[i], 8);

    else
    {
        v0 = (maxHp << 2) / 6;
        v1 = (curHp << 2);

        while (TRUE)
        {
            if (v1 <= v0)
                break;
            v1 -= v0;
            numWholeHpBarTiles++;
        }

        numWholeHpBarTiles += two;

        for (i = two; i < numWholeHpBarTiles; i++)
            StartSpriteAnim(gUnknown_203B15C->sprites[i], 8);

        animNum = (v1 * 6) / v0;
        StartSpriteAnim(gUnknown_203B15C->sprites[numWholeHpBarTiles], animNum);

        for (i = numWholeHpBarTiles + 1; i < 8; i++)
            StartSpriteAnim(gUnknown_203B15C->sprites[i], 0);
    }

    StartSpriteAnim(gUnknown_203B15C->sprites[0], 9);
    StartSpriteAnim(gUnknown_203B15C->sprites[1], 10);
    StartSpriteAnim(gUnknown_203B15C->sprites[8], 11);
}

void sub_813A800(void)
{
    u8 i;

    for (i = 0; i < 9; i++)
        if (gUnknown_203B15C->sprites[i] != NULL)
            DestroySpriteAndFreeResources(gUnknown_203B15C->sprites[i]);

    FREE_AND_SET_NULL_IF_SET(gUnknown_203B15C);
}

void sub_813A838(u8 invisible)
{
    u8 i;

    for (i = 0; i < 9; i++)
        gUnknown_203B15C->sprites[i]->invisible = invisible;
}

void sub_813A874(u16 tileTag, u16 palTag)
{
    u8 i;
    u8 spriteId;
    void * gfxBufferPtr;

    gUnknown_203B160 = AllocZeroed(sizeof(struct Struct203B160));
    gfxBufferPtr = AllocZeroed(0x20 * 12);

    LZ77UnCompWram(gUnknown_8E9B3F0, gfxBufferPtr);
    if (gfxBufferPtr != NULL)
    {
        struct SpriteSheet sheet = {
            .data = gfxBufferPtr,
            .size = 0x20 * 12,
            .tag = tileTag
        };

        struct SpritePalette palette = {.data = gUnknown_8E9B578, .tag = palTag};
        LoadSpriteSheet(&sheet);
        LoadSpritePalette(&palette);
    }

    for (i = 0; i < 11; i++)
    {
        struct SpriteTemplate template = {
            .tileTag = tileTag,
            .paletteTag = palTag,
            .oam = &gUnknown_8463A14,
            .anims = gUnknown_8463A7C,
            .images = NULL,
            .affineAnims = gDummySpriteAffineAnimTable,
            .callback = SpriteCallbackDummy,
        };

        gUnknown_203B160->unk2C[i] = i * 8 + 156;
        spriteId = CreateSprite(&template, gUnknown_203B160->unk2C[i], 132, 0);
        gUnknown_203B160->sprites[i] = &gSprites[spriteId];
        gUnknown_203B160->sprites[i]->oam.priority = 2;
        gUnknown_203B160->unk42 = tileTag;
        gUnknown_203B160->unk44 = palTag;
    }

    sub_813A994();
    sub_813AB70(1);

    FREE_AND_SET_NULL_IF_SET(gfxBufferPtr);
}

void sub_813A994(void)
{
    u8 numWholeExpBarTiles = 0;
    u8 i;
    u8 level;
    u32 exp;
    u32 totalExpToNextLevel;
    u32 curExpToNextLevel;
    u16 species;
    s64 v0;
    s64 v1;
    u8 animNum;
    u8 two = 2;

    if (gMonSummaryScreen->isEgg)
        return;

    exp = GetMonData(&gMonSummaryScreen->currentMon, MON_DATA_EXP);
    level = GetMonData(&gMonSummaryScreen->currentMon, MON_DATA_LEVEL);
    species = GetMonData(&gMonSummaryScreen->currentMon, MON_DATA_SPECIES);

    if (level < 100)
    {
        totalExpToNextLevel = gExperienceTables[gBaseStats[species].growthRate][level + 1] - gExperienceTables[gBaseStats[species].growthRate][level];
        curExpToNextLevel = exp - gExperienceTables[gBaseStats[species].growthRate][level];
        v0 = ((totalExpToNextLevel << 2) / 8);
        v1 = (curExpToNextLevel << 2);

        while (TRUE)
        {
            if (v1 <= v0)
                break;
            v1 -= v0;
            numWholeExpBarTiles++;
        }

        numWholeExpBarTiles += two;

        for (i = two; i < numWholeExpBarTiles; i++)
            StartSpriteAnim(gUnknown_203B160->sprites[i], 8);

        if (numWholeExpBarTiles >= 10)
        {
            if (totalExpToNextLevel == curExpToNextLevel)
                return;
            else
                StartSpriteAnim(gUnknown_203B160->sprites[9], 7);
        }

        animNum = (v1 * 8) / v0;
        StartSpriteAnim(gUnknown_203B160->sprites[numWholeExpBarTiles], animNum);

        for (i = numWholeExpBarTiles + 1; i < 10; i++)
            StartSpriteAnim(gUnknown_203B160->sprites[i], 0);
    }
    else
        for (i = two; i < 10; i++)
            StartSpriteAnim(gUnknown_203B160->sprites[i], 0);

    StartSpriteAnim(gUnknown_203B160->sprites[0], 9);
    StartSpriteAnim(gUnknown_203B160->sprites[1], 10);
    StartSpriteAnim(gUnknown_203B160->sprites[10], 11);
}

void sub_813AB38(void)
{
    u8 i;

    for (i = 0; i < 11; i++)
        if (gUnknown_203B160->sprites[i] != NULL)
            DestroySpriteAndFreeResources(gUnknown_203B160->sprites[i]);

    FREE_AND_SET_NULL_IF_SET(gUnknown_203B160);
}

void sub_813AB70(u8 invisible)
{
    u8 i;

    for (i = 0; i < 11; i++)
        gUnknown_203B160->sprites[i]->invisible = invisible;
}

void sub_813ABAC(u16 tileTag, u16 palTag)
{
    u16 spriteId;
    void * gfxBufferPtr;

    gUnknown_203B164 = AllocZeroed(sizeof(struct Struct203B164));
    gfxBufferPtr = AllocZeroed(0x20 * 1);

    LZ77UnCompWram(gUnknown_8463B20, gfxBufferPtr);

    if (gUnknown_203B164 != NULL)
    {
        struct SpriteSheet sheet = {
            .data = gfxBufferPtr,
            .size = 0x20 * 1,
            .tag = tileTag
        };

        struct SpritePalette palette = {.data = gUnknown_8463B00, .tag = palTag};
        struct SpriteTemplate template = {
            .tileTag = tileTag,
            .paletteTag = palTag,
            .oam = &gUnknown_8463AEC,
            .anims = gUnknown_8463AFC,
            .images = NULL,
            .affineAnims = gDummySpriteAffineAnimTable,
            .callback = SpriteCallbackDummy,
        };

        LoadSpriteSheet(&sheet);
        LoadSpritePalette(&palette);

        spriteId = CreateSprite(&template, 114, 92, 0);
        gUnknown_203B164->sprite = &gSprites[spriteId];
        gUnknown_203B164->unk04 = tileTag;
        gUnknown_203B164->unk06 = palTag;
    }

    sub_813ACF8(1);
    sub_813ACB4();

    FREE_AND_SET_NULL_IF_SET(gfxBufferPtr);
}

void sub_813AC8C(void)
{
    if (gUnknown_203B164->sprite != NULL)
        DestroySpriteAndFreeResources(gUnknown_203B164->sprite);

    FREE_AND_SET_NULL_IF_SET(gUnknown_203B164);
}

void sub_813ACB4(void)
{
    if (!CheckPartyPokerus(&gMonSummaryScreen->currentMon, 0)
        && CheckPartyHasHadPokerus(&gMonSummaryScreen->currentMon, 0))
        sub_813ACF8(0);
    else
        sub_813ACF8(1);
}

void sub_813ACF8(u8 invisible)
{
    if (!CheckPartyPokerus(&gMonSummaryScreen->currentMon, 0)
        && CheckPartyHasHadPokerus(&gMonSummaryScreen->currentMon, 0))
    {
        gUnknown_203B164->sprite->invisible = invisible;
        return;
    }
    else
        gUnknown_203B164->sprite->invisible = TRUE;

    if (gMonSummaryScreen->curPageIndex == PSS_PAGE_MOVES_INFO)
    {
        gUnknown_203B164->sprite->invisible = TRUE;
        gUnknown_203B164->sprite->pos1.x = 16;
        gUnknown_203B164->sprite->pos1.y = 44;
    }
    else
    {
        gUnknown_203B164->sprite->pos1.x = 114;
        gUnknown_203B164->sprite->pos1.y = 92;
    }
}

void sub_813ADA8(u16 tileTag, u16 palTag)
{
    u16 spriteId;
    void * gfxBufferPtr;

    gUnknown_203B168 = AllocZeroed(sizeof(struct Struct203B168));
    gfxBufferPtr = AllocZeroed(0x20 * 2);

    LZ77UnCompWram(gUnknown_8463B64, gfxBufferPtr);

    if (gUnknown_203B168 != NULL)
    {
        struct SpriteSheet sheet = {
            .data = gfxBufferPtr,
            .size = 0x20 * 2,
            .tag = tileTag
        };

        struct SpritePalette palette = {.data = gUnknown_8463B44, .tag = palTag};
        struct SpriteTemplate template = {
            .tileTag = tileTag,
            .paletteTag = palTag,
            .oam = &gUnknown_8463B30,
            .anims = gUnknown_8463B40,
            .images = NULL,
            .affineAnims = gDummySpriteAffineAnimTable,
            .callback = SpriteCallbackDummy,
        };

        LoadSpriteSheet(&sheet);
        LoadSpritePalette(&palette);
        spriteId = CreateSprite(&template, 106, 40, 0);
        gUnknown_203B168->sprite = &gSprites[spriteId];
        gUnknown_203B168->unk04 = tileTag;
        gUnknown_203B168->unk06 = palTag;
    }

    sub_813AEB0(1);
    sub_813AF50();

    FREE_AND_SET_NULL_IF_SET(gfxBufferPtr);
}

void sub_813AE88(void)
{
    if (gUnknown_203B168->sprite != NULL)
        DestroySpriteAndFreeResources(gUnknown_203B168->sprite);

    FREE_AND_SET_NULL_IF_SET(gUnknown_203B168);
}

void sub_813AEB0(u8 invisible)
{
    if (IsMonShiny(&gMonSummaryScreen->currentMon) == TRUE
        && !gMonSummaryScreen->isEgg)
        gUnknown_203B168->sprite->invisible = invisible;
    else
        gUnknown_203B168->sprite->invisible = TRUE;

    if (gMonSummaryScreen->curPageIndex == PSS_PAGE_MOVES_INFO)
    {
        gUnknown_203B168->sprite->pos1.x = 8;
        gUnknown_203B168->sprite->pos1.y = 24;
    }
    else
    {
        gUnknown_203B168->sprite->pos1.x = 106;
        gUnknown_203B168->sprite->pos1.y = 40;
    }
}

void sub_813AF50(void)
{
    if (IsMonShiny(&gMonSummaryScreen->currentMon) == TRUE && !gMonSummaryScreen->isEgg)
        sub_813AEB0(0);
    else
        sub_813AEB0(1);
}

void sub_813AF90(void)
{
    sub_813A21C();
    sub_813A800();
    sub_813AB38();
    sub_8139C80();
    sub_8139F20();
    sub_8139D90();
    sub_813B068();
    sub_813A334();
    sub_813AC8C();
    sub_813AE88();
    ResetSpriteData();
}

void sub_813AFC4(void)
{
    sub_8139CB0();
    sub_8139D54(0);
    sub_8139DBC();
    sub_813995C();
    sub_8139C44(0);
    sub_813A620();
    sub_813A994();
    sub_813B0E4();
    sub_813A35C();
    sub_813ACB4();
    sub_813AF50();
}

void sub_813AFFC(void)
{
    u32 markings = GetMonData(&gMonSummaryScreen->currentMon, MON_DATA_MARKINGS);

    DestroySpriteAndFreeResources(gMonSummaryScreen->markingSprite);
    gMonSummaryScreen->markingSprite = CreateMonMarkingSprite_SelectCombo(TAG_PSS_UNK_8C, TAG_PSS_UNK_8C, gUnknown_84636E0);

    if (gMonSummaryScreen->markingSprite != NULL)
    {
        StartSpriteAnim(gMonSummaryScreen->markingSprite, markings);
        gMonSummaryScreen->markingSprite->pos1.x = 20;
        gMonSummaryScreen->markingSprite->pos1.y = 91;
    }

    sub_813B084(1);
}

void sub_813B068(void)
{
    DestroySpriteAndFreeResources(gMonSummaryScreen->markingSprite);
}

void sub_813B084(u8 invisible)
{
    u32 markings = GetMonData(&gMonSummaryScreen->currentMon, MON_DATA_MARKINGS);

    if (markings == 0)
        gMonSummaryScreen->markingSprite->invisible = TRUE;
    else
        gMonSummaryScreen->markingSprite->invisible = invisible;
}

void sub_813B0E4(void)
{
    u32 markings = GetMonData(&gMonSummaryScreen->currentMon, MON_DATA_MARKINGS);

    StartSpriteAnim(gMonSummaryScreen->markingSprite, markings);
    sub_813B084(0);
}

void sub_813B120(u8 taskId, s8 a1)
{
    s8 v0 = -1;

    if (gMonSummaryScreen->isBoxMon == TRUE)
    {
        if (gMonSummaryScreen->curPageIndex != 0)
        {
            if (a1 == 1)
                a1 = 0;
            else
                a1 = 2;
        }
        else
        {
            if (a1 == 1)
                a1 = 1;
            else
                a1 = 3;
        }

        v0 = SeekToNextMonInBox(gMonSummaryScreen->monList.boxMons, GetLastViewedMonIndex(), gMonSummaryScreen->lastIndex, (u8)a1);
    }
    else
    {
        if (IsUpdateLinkStateCBActive() == FALSE
            && gReceivedRemoteLinkPlayers == 1
            && IsMultiBattle() == TRUE)
            v0 = sub_813B38C(a1);
        else
            v0 = sub_813B20C(a1);
    }

    if (v0 == -1)
        return;

    gLastViewedMonIndex = v0;
    CreateTask(sub_813B3F0, 0);
    gMonSummaryScreen->unk328C = 0;
}

s8 sub_813B20C(s8 a0)
{
    struct Pokemon * partyMons = gMonSummaryScreen->monList.mons;
    s8 v1 = 0;

    if (gMonSummaryScreen->curPageIndex == 0)
    {
        if (a0 == -1 && gLastViewedMonIndex == 0)
            return -1;
        else if (a0 == 1 && gLastViewedMonIndex >= gMonSummaryScreen->lastIndex)
            return -1;
        else
            return gLastViewedMonIndex + a0;
    }

    while (TRUE)
    {
        v1 += a0;
        if (0 > gLastViewedMonIndex + v1 || gLastViewedMonIndex + v1 > gMonSummaryScreen->lastIndex)
            return -1;

        if (GetMonData(&partyMons[gLastViewedMonIndex + v1], MON_DATA_IS_EGG) == 0)
            return gLastViewedMonIndex + v1;
    }

    return -1;
}

u8 sub_813B2C8(struct Pokemon * partyMons)
{
    if (GetMonData(partyMons, MON_DATA_SPECIES) != 0 && (gMonSummaryScreen->curPageIndex != 0 || GetMonData(partyMons, MON_DATA_IS_EGG) == 0))
        return TRUE;

    return FALSE;
}

s8 sub_813B304(u8 a0)
{
    while (TRUE)
    {
        a0++;

        if (a0 == 6)
            return -1;
        if (sub_813B2C8(&gPlayerParty[gUnknown_8463FB8[a0]]) == TRUE)
            break;
    }

    return (s8)gUnknown_8463FB8[a0];
}

s8 sub_813B348(u8 a0)
{
    while (1)
    {
        if (a0 == 0)
            return -1;

        a0--;

        if (sub_813B2C8(&gPlayerParty[gUnknown_8463FB8[a0]]) == TRUE)
            break;
    }

    return (s8)(gUnknown_8463FB8[a0]);
}

s8 sub_813B38C(s8 a0)
{
    u8 v0 = 0;
    u8 i;

    for (i = 0; i < PARTY_SIZE; i++)
        if (gUnknown_8463FB8[i] == GetLastViewedMonIndex())
        {
            v0 = i;
            break;
        }

    if ((a0 == -1 && v0 == 0)
        || (a0 == 1 && v0 == 5))
        return -1;

    if (a0 == 1)
        return sub_813B304(v0);
    else
        return sub_813B348(v0);
}

void sub_813B3F0(u8 id)
{
    switch (gMonSummaryScreen->unk328C)
    {
    case 0:
        StopCryAndClearCrySongs();
        gUnknown_203B16D = 0;
        gUnknown_203B16E = 0;
        gMonSummaryScreen->unk328C++;
        break;
    case 1:
        sub_8139C80();
        sub_8139F20();
        sub_8139D90();
        gMonSummaryScreen->unk328C++;
        break;
    case 2:
        sub_8138B8C(&gMonSummaryScreen->currentMon);

        gMonSummaryScreen->isEgg = GetMonData(&gMonSummaryScreen->currentMon, MON_DATA_IS_EGG);
        gMonSummaryScreen->isBadEgg = GetMonData(&gMonSummaryScreen->currentMon, MON_DATA_SANITY_IS_BAD_EGG);

        if (gMonSummaryScreen->isBadEgg == TRUE)
            gMonSummaryScreen->isEgg = TRUE;

        gMonSummaryScreen->unk328C++;
        break;
    case 3:
        FillBgTilemapBufferRect_Palette0(0, 0, 0, 0, 30, 20);

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

        gMonSummaryScreen->unk328C++;
        break;
    case 4:
        if (gMonSummaryScreen->curPageIndex == PSS_PAGE_INFO)
        {
            if (gMonSummaryScreen->isEgg)
            {
                CopyToBgTilemapBuffer(gMonSummaryScreen->unk323C, gUnknown_8E9BBCC, 0, 0);
                CopyToBgTilemapBuffer(gMonSummaryScreen->unk3240, gUnknown_8E9B750, 0, 0);
            }
            else
            {
                CopyToBgTilemapBuffer(gMonSummaryScreen->unk323C, gUnknown_8E9B598, 0, 0);
                CopyToBgTilemapBuffer(gMonSummaryScreen->unk3240, gUnknown_8E9B750, 0, 0);
            }
        }
        gMonSummaryScreen->unk328C++;
        break;
    case 5:
        sub_81360D4();
        gMonSummaryScreen->unk328C++;
        break;
    case 6:
        if (!gMonSummaryScreen->isEgg)
            sub_8136350();

        gMonSummaryScreen->unk328C++;
        break;
    case 7:
        if (!gMonSummaryScreen->isEgg)
            sub_81367B0();

        gMonSummaryScreen->unk328C++;
        break;
    case 8:
        sub_8136F4C();
        sub_81374E8();
        sub_8137BD0();
        gMonSummaryScreen->unk328C++;
        break;
    case 9:
        sub_8138A38();
        sub_8138538();
        sub_8137D28(gMonSummaryScreen->curPageIndex);
        gMonSummaryScreen->unk328C++;
        break;
    case 10:
        CopyWindowToVram(gMonSummaryScreen->unk3000[0], 2);
        CopyWindowToVram(gMonSummaryScreen->unk3000[1], 2);
        CopyWindowToVram(gMonSummaryScreen->unk3000[2], 2);
        CopyWindowToVram(gMonSummaryScreen->unk3000[6], 2);
        CopyWindowToVram(gMonSummaryScreen->unk3000[3], 2);
        CopyWindowToVram(gMonSummaryScreen->unk3000[4], 2);
        CopyWindowToVram(gMonSummaryScreen->unk3000[5], 2);
        CopyBgTilemapBufferToVram(0);
        CopyBgTilemapBufferToVram(2);
        CopyBgTilemapBufferToVram(3);
        gMonSummaryScreen->unk328C++;
        break;
    case 11:
        if (!Overworld_LinkRecvQueueLengthMoreThan2() && !sub_800B270())
        {
            sub_813AFC4();
            sub_813B784();
            gMonSummaryScreen->unk328C++;
        }
        break;
    default:
        gMonSummaryScreen->unk328C = 0;
        DestroyTask(id);
        break;
    }
}

void sub_813B750(u8 curPageIndex)
{
    ClearGpuRegBits(REG_OFFSET_DISPCNT, DISPCNT_WIN1_ON);

    switch (curPageIndex)
    {
    case PSS_PAGE_INFO:
    case PSS_PAGE_SKILLS:
    case PSS_PAGE_MOVES:
        SetGpuReg(REG_OFFSET_DISPCNT, GetGpuReg(REG_OFFSET_DISPCNT) | DISPCNT_WIN1_ON);
        break;
    default:
        break;
    }
}

void sub_813B784(void)
{
    if (!GetMonData(&gMonSummaryScreen->currentMon, MON_DATA_IS_EGG))
    {
        if (ShouldPlayNormalPokeCry(&gMonSummaryScreen->currentMon) == TRUE)
            PlayCry3(GetMonData(&gMonSummaryScreen->currentMon, MON_DATA_SPECIES2), 0, 0);
        else
            PlayCry3(GetMonData(&gMonSummaryScreen->currentMon, MON_DATA_SPECIES2), 0, 11);
    }
}

bool32 sub_813B7E0(u8 nature)
{
    if (nature == NATURE_BOLD || nature == NATURE_GENTLE)
        return TRUE;

    return FALSE;
}

bool32 sub_813B7F8(void)
{
    u8 version = GetMonData(&gMonSummaryScreen->currentMon, MON_DATA_MET_GAME);

    if (version == VERSION_LEAF_GREEN
        || version == VERSION_FIRE_RED
        || version == VERSION_RUBY
        || version == VERSION_SAPPHIRE
        || version == VERSION_EMERALD)
        return TRUE;

    return FALSE;
}

bool32 sub_813B838(u8 place)
{
    if (place >= MAPSECS_KANTO && place < MAPSEC_NONE)
        return TRUE;
    return FALSE;
}

void sub_813B854(void)
{
    ShowPokemonSummaryScreen(0, 0, 0, CB2_ReturnToField, PSS_MODE_NORMAL);
}
