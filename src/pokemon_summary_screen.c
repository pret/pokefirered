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

static void sub_8138B8C(struct Pokemon * mon);
static void sub_8135C34(void);
static void sub_813B784(void);
static void sub_8138414(u8 curPageIndex);
static void sub_8134BAC(u8 taskId);
static void sub_8134E84(u8 taskId);
static void sub_813B3F0(u8 taskId);
static void sub_813B120(u8, s8);
static void sub_8137E64(u8 taskId);
static void sub_8135638(void);
static void sub_81356EC(void);
static void sub_813B750(u8 curPageIndex);
static void sub_8138280(u8 curPageIndex);
static void sub_8137D28(u8 curPageIndex);
static void sub_8135514(void);
static u8 sub_81357A0(u8);
static void sub_8138440(void);
static void sub_8138CD8(u8 taskId);
static void sub_8135AA4(void);
static void sub_8135B90(void);
static void sub_8138538(void);
static void sub_8137D28(u8 curPageIndex);
static void sub_8136F4C(void);
static void sub_81374E8(void);
static void sub_8137BD0(void);
static void sub_8138A38(void);
static void sub_8136DA4(const u8 * str);
static void sub_8136DF0(const u8 * str);
static void sub_8136E50(const u8 * str);
static void sub_81358DC(u8, u8);
static void sub_813A838(u8 invisible);
static void sub_813AB70(u8 invisible);
static void sub_8139C44(u8 invisible);
static void sub_813B084(u8 invisible);
static void sub_8139D54(u8 invisible);
static void sub_813A3B8(u8 invisible);
static void sub_813ACF8(u8 invisible);
static void sub_813AEB0(u8 invisible);
static void sub_813A0E8(u8 invisible);
static void sub_8139EE4(u8 invisible);
static void sub_81381AC(void);
static void sub_8136BC4(void);
static void sub_8136BAC(void);
static u8 sub_8135F20(void);
static u8 sub_8136AEC(void);
static void sub_81381D0(void);
static u8 sub_8136040(void);
static void sub_8137E28(void);
static void sub_81381C0(void);
static void sub_8136D54(void);
static void sub_81360D4(void);
static void sub_8136350(void);
static void sub_81367B0(void);
static u8 sub_8138C5C(u32 status);
static void sub_81367E8(u8);
static u16 sub_8138BEC(struct Pokemon * mon, u8 moveSlot);
static u16 sub_8138C24(struct Pokemon * mon, u8 moveSlot);
static void sub_813ADA8(u16, u16);
static void sub_813ABAC(u16, u16);
static void sub_813AFFC(void);
static void sub_8139F64(u16, u16);
static void sub_813A254(u16, u16);
static void sub_813A45C(u16, u16);
static void sub_813A874(u16, u16);
static void sub_8139CB0(void);
static void sub_8139DBC(void);
static void sub_813995C(void);
static void sub_81393D4(u8 taskId);
static void sub_8137EE8(void);
static void sub_8136FB0(void);
static void sub_81370EC(void);
static void sub_8137270(void);
static void sub_81372E4(u8 i);
static void sub_8137554(void);
static void sub_8137A90(void);
static void sub_8137AF8(void);
static void sub_8137944(void);
static void sub_8137970(void);
static bool32 sub_813B838(u8 metLocation);
static bool32 sub_8138B4C(void);
static bool32 sub_813B7E0(u8 nature);
static void sub_8137724(void);
static bool32 sub_813B7F8(void);
static u8 sub_813847C(struct Pokemon * mon);
static void sub_8137C18(void);
static void sub_8137C90(void);
static void sub_813AF90(void);
static void sub_81380F0(void);
static void sub_81390B0(void);
static void sub_81391EC(void);
static void sub_8139328(struct Pokemon * mon);
static void sub_8139AAC(u16 spriteId);
static void sub_813A124(struct Sprite * sprite);
static void sub_813A35C(void);
static void sub_813A620(void);
static void sub_813A994(void);
static void sub_813ACB4(void);
static void sub_813AF50(void);
static void sub_813B068(void);
static void sub_813B0E4(void);
static s8 sub_813B20C(s8);
static s8 sub_813B38C(s8);

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
        u8 ALIGNED(4) unk31CC[52];
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

static EWRAM_DATA struct PokemonSummaryScreenData * sMonSummaryScreen = NULL;
static EWRAM_DATA struct Struct203B144 * sUnknown_203B144 = NULL;
static EWRAM_DATA struct Struct203B148 * sUnknown_203B148[4] = {};
static EWRAM_DATA struct Struct203B158 * sUnknown_203B158 = NULL;
static EWRAM_DATA struct Struct203B15C * sUnknown_203B15C = NULL;
static EWRAM_DATA struct Struct203B160 * sUnknown_203B160 = NULL;
static EWRAM_DATA struct Struct203B164 * sUnknown_203B164 = NULL;
static EWRAM_DATA struct Struct203B168 * sUnknown_203B168 = NULL;
static EWRAM_DATA u8 sLastViewedMonIndex = 0;
static EWRAM_DATA u8 sUnknown_203B16D = 0;
static EWRAM_DATA u8 sUnknown_203B16E = 0;
static EWRAM_DATA struct Struct203B170 * sUnknown_203B170 = NULL;

extern const u32 gUnknown_8E9B750[];
extern const u32 gUnknown_8E9B950[];
extern const u32 gUnknown_8E9B598[];
extern const u32 gUnknown_8E9BA9C[];
extern const u32 gUnknown_8E9BBCC[];
extern const u16 gUnknown_8E9B310[];
extern const u32 gUnknown_8E9A460[];
extern const u16 gUnknown_8E9B578[];
extern const u32 gUnknown_8E9BF48[];
extern const u16 gUnknown_8E9BF28[];
extern const u32 gUnknown_8E9B4B8[];
extern const u32 gUnknown_8E9B3F0[];
extern const u16 gUnknown_8E9B578[];

static const u32 sUnknown_84636C0[] = INCBIN_U32("graphics/interface/pokesummary_unk_84636C0.gbapal");
static const u16 sUnknown_84636E0[] = INCBIN_U16("graphics/interface/pokesummary_unk_84636E0.gbapal");
static const u32 sUnknown_8463700[] = INCBIN_U32("graphics/interface/pokesummary_unk_8463700.gbapal");
static const u16 sUnknown_8463720[] = INCBIN_U16("graphics/interface/pokesummary_unk_8463720.gbapal");
static const u32 sUnknown_8463740[] = INCBIN_U32("graphics/interface/pokesummary_unk_8463740.4bpp.lz");
static const u32 sUnknown_846386C[] = INCBIN_U32("graphics/interface/pokesummary_unk_846386C.4bpp.lz");

static const struct OamData sUnknown_846398C =
{
    .y = 0,
    .affineMode = ST_OAM_AFFINE_OFF,
    .objMode = ST_OAM_OBJ_NORMAL,
    .mosaic = FALSE,
    .bpp = ST_OAM_4BPP,
    .shape = SPRITE_SHAPE(64x32),
    .x = 0,
    .matrixNum = 0,
    .size = SPRITE_SIZE(64x32),
    .tileNum = 0,
    .priority = 0,
    .paletteNum = 0
};

static const union AnimCmd sUnknown_8463994[] = 
{
    ANIMCMD_FRAME(0, 20),
    ANIMCMD_JUMP(0),
};

static const union AnimCmd sUnknown_846399C[] = 
{
    ANIMCMD_FRAME(0x20, 20),
    ANIMCMD_JUMP(0),
};

static const union AnimCmd * const sUnknown_84639A4[] =
{
    sUnknown_8463994,
    sUnknown_846399C
};

static const struct OamData sUnknown_84639AC = {
    .y = 0,
    .affineMode = ST_OAM_AFFINE_OFF,
    .objMode = ST_OAM_OBJ_NORMAL,
    .mosaic = FALSE,
    .bpp = ST_OAM_4BPP,
    .shape = SPRITE_SHAPE(32x8),
    .x = 0,
    .matrixNum = 0,
    .size = SPRITE_SIZE(32x8),
    .tileNum = 0,
    .priority = 0,
    .paletteNum = 0
};

static const union AnimCmd sUnknown_84639B4[] = 
{
    ANIMCMD_FRAME(0, 20),
    ANIMCMD_JUMP(0),
};

static const union AnimCmd sUnknown_84639BC[] = 
{
    ANIMCMD_FRAME(4, 20),
    ANIMCMD_JUMP(0),
};

static const union AnimCmd sUnknown_84639C4[] = 
{
    ANIMCMD_FRAME(8, 20),
    ANIMCMD_JUMP(0),
};

static const union AnimCmd sUnknown_84639CC[] = 
{
    ANIMCMD_FRAME(12, 20),
    ANIMCMD_JUMP(0),
};

static const union AnimCmd sUnknown_84639D4[] = 
{
    ANIMCMD_FRAME(16, 20),
    ANIMCMD_JUMP(0),
};

static const union AnimCmd sUnknown_84639DC[] = 
{
    ANIMCMD_FRAME(20, 20),
    ANIMCMD_JUMP(0),
};

static const union AnimCmd sUnknown_84639E4[] = 
{
    ANIMCMD_FRAME(24, 20),
    ANIMCMD_JUMP(0),
};

static const union AnimCmd sUnknown_84639EC[] = 
{
    ANIMCMD_FRAME(28, 20),
    ANIMCMD_JUMP(0),
};

static const union AnimCmd * const sUnknown_84639F4[] =
{
    sUnknown_84639B4,
    sUnknown_84639BC,
    sUnknown_84639C4,
    sUnknown_84639CC,
    sUnknown_84639D4,
    sUnknown_84639DC,
    sUnknown_84639E4,
    sUnknown_84639EC
};

static const struct OamData sUnknown_8463A14 = {
    .y = 0,
    .affineMode = ST_OAM_AFFINE_OFF,
    .objMode = ST_OAM_OBJ_NORMAL,
    .mosaic = FALSE,
    .bpp = ST_OAM_4BPP,
    .shape = SPRITE_SHAPE(8x8),
    .x = 0,
    .matrixNum = 0,
    .size = SPRITE_SIZE(8x8),
    .tileNum = 0,
    .priority = 0,
    .paletteNum = 0
};

static const union AnimCmd sUnknown_8463A1C[] = 
{
    ANIMCMD_FRAME(0, 20),
    ANIMCMD_JUMP(0),
};

static const union AnimCmd sUnknown_8463A24[] = 
{
    ANIMCMD_FRAME(1, 20),
    ANIMCMD_JUMP(0),
};

static const union AnimCmd sUnknown_8463A2C[] = 
{
    ANIMCMD_FRAME(2, 20),
    ANIMCMD_JUMP(0),
};

static const union AnimCmd sUnknown_8463A34[] = 
{
    ANIMCMD_FRAME(3, 20),
    ANIMCMD_JUMP(0),
};

static const union AnimCmd sUnknown_8463A3C[] = 
{
    ANIMCMD_FRAME(4, 20),
    ANIMCMD_JUMP(0),
};

static const union AnimCmd sUnknown_8463A44[] = 
{
    ANIMCMD_FRAME(5, 20),
    ANIMCMD_JUMP(0),
};

static const union AnimCmd sUnknown_8463A4C[] = 
{
    ANIMCMD_FRAME(6, 20),
    ANIMCMD_JUMP(0),
};

static const union AnimCmd sUnknown_8463A54[] = 
{
    ANIMCMD_FRAME(7, 20),
    ANIMCMD_JUMP(0),
};

static const union AnimCmd sUnknown_8463A5C[] = 
{
    ANIMCMD_FRAME(8, 20),
    ANIMCMD_JUMP(0),
};

static const union AnimCmd sUnknown_8463A64[] = 
{
    ANIMCMD_FRAME(9, 20),
    ANIMCMD_JUMP(0),
};

static const union AnimCmd sUnknown_8463A6C[] = 
{
    ANIMCMD_FRAME(10, 20),
    ANIMCMD_JUMP(0),
};

static const union AnimCmd sUnknown_8463A74[] = 
{
    ANIMCMD_FRAME(11, 20),
    ANIMCMD_JUMP(0),
};

static const union AnimCmd * const sUnknown_8463A7C[] =
{
    sUnknown_8463A1C,
    sUnknown_8463A24,
    sUnknown_8463A2C,
    sUnknown_8463A34,
    sUnknown_8463A3C,
    sUnknown_8463A44,
    sUnknown_8463A4C,
    sUnknown_8463A54,
    sUnknown_8463A5C,
    sUnknown_8463A64,
    sUnknown_8463A6C,
    sUnknown_8463A74
};

static const u16 sUnknown_8463AAC[] = INCBIN_U16("graphics/interface/pokesummary_unk_8463AAC.gbapal");
static const u16 sUnknown_8463ACC[] = INCBIN_U16("graphics/interface/pokesummary_unk_8463ACC.gbapal");

static const struct OamData sUnknown_8463AEC = {
    .y = 0,
    .affineMode = ST_OAM_AFFINE_OFF,
    .objMode = ST_OAM_OBJ_NORMAL,
    .mosaic = FALSE,
    .bpp = ST_OAM_4BPP,
    .shape = SPRITE_SHAPE(8x8),
    .x = 0,
    .matrixNum = 0,
    .size = SPRITE_SIZE(8x8),
    .tileNum = 0,
    .priority = 0,
    .paletteNum = 0
};

static const union AnimCmd sUnknown_8463AF4[] = 
{
    ANIMCMD_FRAME(0, 20),
    ANIMCMD_JUMP(0),
};

static const union AnimCmd * const sUnknown_8463AFC[] =
{
    sUnknown_8463AF4
};

static const u16 sUnknown_8463B00[] = INCBIN_U16("graphics/interface/pokesummary_unk_8463B00.gbapal");
static const u32 sUnknown_8463B20[] = INCBIN_U32("graphics/interface/pokesummary_unk_8463B20.4bpp.lz");

static const struct OamData sUnknown_8463B30 =
{
    .y = 0,
    .affineMode = ST_OAM_AFFINE_OFF,
    .objMode = ST_OAM_OBJ_NORMAL,
    .mosaic = FALSE,
    .bpp = ST_OAM_4BPP,
    .shape = SPRITE_SHAPE(8x8),
    .x = 0,
    .matrixNum = 0,
    .size = SPRITE_SIZE(8x8),
    .tileNum = 0,
    .priority = 0,
    .paletteNum = 0
};

static const union AnimCmd sUnknown_8463B38[] = 
{
    ANIMCMD_FRAME(1, 20),
    ANIMCMD_JUMP(0),
};

static const union AnimCmd * const sUnknown_8463B40[] =
{
    sUnknown_8463B38
};

static const u16 sUnknown_8463B44[] = INCBIN_U16( "graphics/interface/pokesummary_unk_8463B44.gbapal");
static const u32 sUnknown_8463B64[] = INCBIN_U32( "graphics/interface/pokesummary_unk_8463B64.4bpp.lz");
static const u32 sUnknown_8463B88[] = INCBIN_U32( "graphics/interface/pokesummary_unk_8463B88.bin.lz");
static const u32 sUnknown_8463C80[] = INCBIN_U32( "graphics/interface/pokesummary_unk_8463C80.bin.lz");

#include "data/text/nature_names.h"

static const u8 * const sUnknown_8463EC4[] = {
    gUnknown_8419B44,
    gUnknown_8419B7B,
    gUnknown_8419BAE,
    gUnknown_8419BDB
};

static const u8 * const sUnknown_8463ED4[] = {
    gUnknown_8419A3D,
    gUnknown_8419B18,
    gUnknown_8419A6E,
    gUnknown_8419B18,
    gUnknown_8419AA2,
    gUnknown_8419ADE,
    gUnknown_8419B18
};

static const u8 sUnknown_8463EF0[][3] = {
    {0, 7, 8},
    {0, 1, 2},
    {0, 3, 4},
    {0, 5, 6}
};

static const struct BgTemplate sUnknown_8463EFC[] = 
{
	 {
	 	.bg = 0,
	 	.charBaseIndex = 0,
	 	.mapBaseIndex = 14,
	 	.screenSize = 1,
	 	.paletteMode = 0,
	 	.priority = 0,
	 	.baseTile = 0x0000
	 },
	 {
	 	.bg = 2,
	 	.charBaseIndex = 2,
	 	.mapBaseIndex = 10,
	 	.screenSize = 1,
	 	.paletteMode = 0,
	 	.priority = 1,
	 	.baseTile = 0x0000
	 },
	 {
	 	.bg = 3,
	 	.charBaseIndex = 2,
	 	.mapBaseIndex = 9,
	 	.screenSize = 0,
	 	.paletteMode = 0,
	 	.priority = 3,
	 	.baseTile = 0x0000
	 },
	 {
	 	.bg = 1,
	 	.charBaseIndex = 2,
	 	.mapBaseIndex = 12,
	 	.screenSize = 1,
	 	.paletteMode = 0,
	 	.priority = 2,
	 	.baseTile = 0x0000
	 }
};

static const struct WindowTemplate sUnknown_8463F0C[] =
{
    {
        .bg = 1,
        .tilemapLeft = 0,
        .tilemapTop = 0,
        .width = 13,
        .height = 2,
        .paletteNum = 7,
        .baseBlock = 0x0258
    },
    {
        .bg = 1,
        .tilemapLeft = 19,
        .tilemapTop = 0,
        .width = 11,
        .height = 2,
        .paletteNum = 7,
        .baseBlock = 0x0272
    },
    {
        .bg = 1,
        .tilemapLeft = 0,
        .tilemapTop = 2,
        .width = 15,
        .height = 2,
        .paletteNum = 7,
        .baseBlock = 0x0288
    }
};

static const struct WindowTemplate sUnknown_8463F24[] = 
{
    {
        .bg = 2,
        .tilemapLeft = 0,
        .tilemapTop = 0,
        .width = 13,
        .height = 2,
        .paletteNum = 7,
        .baseBlock = 0x0258
    },
    {
        .bg = 2,
        .tilemapLeft = 19,
        .tilemapTop = 0,
        .width = 11,
        .height = 2,
        .paletteNum = 7,
        .baseBlock = 0x0272
    },
    {
        .bg = 2,
        .tilemapLeft = 0,
        .tilemapTop = 2,
        .width = 15,
        .height = 2,
        .paletteNum = 7,
        .baseBlock = 0x0288
    },
};

static const struct WindowTemplate sUnknown_8463F3C[] = 
{
    {
        .bg = 0,
        .tilemapLeft = 15,
        .tilemapTop = 2,
        .width = 15,
        .height = 12,
        .paletteNum = 6,
        .baseBlock = 0x0001
    },
    {
        .bg = 0,
        .tilemapLeft = 1,
        .tilemapTop = 14,
        .width = 28,
        .height = 6,
        .paletteNum = 6,
        .baseBlock = 0x00b5
    },
    {
        .bg = 0,
        .tilemapLeft = 0,
        .tilemapTop = 0,
        .width = 0,
        .height = 0,
        .paletteNum = 0,
        .baseBlock = 0x0000
    },
    {
        .bg = 0,
        .tilemapLeft = 0,
        .tilemapTop = 0,
        .width = 0,
        .height = 0,
        .paletteNum = 0,
        .baseBlock = 0x0000
    },
};

static const struct WindowTemplate sUnknown_8463F5C[] = 
{
    {
        .bg = 0,
        .tilemapLeft = 20,
        .tilemapTop = 2,
        .width = 10,
        .height = 14,
        .paletteNum = 6,
        .baseBlock = 0x0001
    },
    {
        .bg = 0,
        .tilemapLeft = 6,
        .tilemapTop = 12,
        .width = 14,
        .height = 4,
        .paletteNum = 6,
        .baseBlock = 0x008d
    },
    {
        .bg = 0,
        .tilemapLeft = 1,
        .tilemapTop = 16,
        .width = 29,
        .height = 4,
        .paletteNum = 6,
        .baseBlock = 0x00c5
    },
    {
        .bg = 0,
        .tilemapLeft = 0,
        .tilemapTop = 0,
        .width = 0,
        .height = 0,
        .paletteNum = 0,
        .baseBlock = 0x0000
    },
};

static const struct WindowTemplate sUnknown_8463F7C[] = 
{
    {
        .bg = 0,
        .tilemapLeft = 20,
        .tilemapTop = 2,
        .width = 10,
        .height = 18,
        .paletteNum = 8,
        .baseBlock = 0x0001
    },
    {
        .bg = 0,
        .tilemapLeft = 0,
        .tilemapTop = 7,
        .width = 15,
        .height = 13,
        .paletteNum = 6,
        .baseBlock = 0x00b5
    },
    {
        .bg = 0,
        .tilemapLeft = 15,
        .tilemapTop = 2,
        .width = 5,
        .height = 18,
        .paletteNum = 6,
        .baseBlock = 0x0178
    },
    {
        .bg = 0,
        .tilemapLeft = 6,
        .tilemapTop = 4,
        .width = 9,
        .height = 2,
        .paletteNum = 6,
        .baseBlock = 0x01d2
    },
};

static const struct WindowTemplate sUnknown_8463F9C[] = 
{
    {
        .bg = 255,
        .tilemapLeft = 0,
        .tilemapTop = 0,
        .width = 0,
        .height = 0,
        .paletteNum = 0,
        .baseBlock = 0x0000
    },
};


static const u8 sUnknown_8463FA4[][3] =
{
    {0, 14, 10},
    {0, 1, 2},
    {0, 9, 8},
    {0, 5, 4},
    {0, 2, 3},
    {0, 11, 10},
};

static const u8 ALIGNED(4) sUnknown_8463FB8[] =
{
    0, 2, 3, 1, 4, 5
};

static const s8 sUnknown_8463FBE[] =
{
    -1, 0, 1
};

static const s8 sUnknown_8463FC1[] =
{
    -2, -1, 0, 1, 2
};

static const s8 sUnknown_8463FC6[] =
{
    -3, -2, -1, 0, 1, 2, 3
};

static const s8 sUnknown_8463FCD[] =
{
    -5, -3, -1, 0, 1, 3, 5
};

static const s8 sUnknown_8463FD4[] =
{
    1, 1, 0, -1, -1, 0, -1, -1, 0, 1, 1
};

static const s8 sUnknown_8463FDF[] =
{
    2, 1, 0, -1, -2, 0, -2, -1, 0, 1, 2
};

static const s8 sUnknown_8463FEA[] =
{
    2, 1, 1, 0, -1, -1, -2, 0, -2, -1, -1, 0, 1, 1, 2
};

static const u16 * const sUnknown_8463FFC[] =
{
    gUnknown_8E9B578,
    sUnknown_8463AAC,
    sUnknown_8463ACC,
};


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
    sMonSummaryScreen = AllocZeroed(sizeof(struct PokemonSummaryScreenData));
    sUnknown_203B144 = AllocZeroed(sizeof(struct Struct203B144));

    if (sMonSummaryScreen == NULL)
    {
        SetMainCallback2(savedCallback);
        return;
    }

    sLastViewedMonIndex = cursorPos;

    sUnknown_203B16D = 0;
    sUnknown_203B16E = 0;
    sMonSummaryScreen->savedCallback = savedCallback;
    sMonSummaryScreen->monList.mons = party;

    if (party == gEnemyParty)
        sMonSummaryScreen->isEnemyParty = TRUE;
    else
        sMonSummaryScreen->isEnemyParty = FALSE;

    sMonSummaryScreen->lastIndex = lastIdx;
    sMonSummaryScreen->mode = mode;

    switch (sMonSummaryScreen->mode)
    {
    case PSS_MODE_NORMAL:
    default:
        SetHelpContext(HELPCONTEXT_POKEMON_INFO);
        sMonSummaryScreen->curPageIndex = PSS_PAGE_INFO;
        sMonSummaryScreen->isBoxMon = FALSE;
        sMonSummaryScreen->lockMovesFlag = FALSE;
        break;
    case PSS_MODE_BOX:
        SetHelpContext(HELPCONTEXT_POKEMON_INFO);
        sMonSummaryScreen->curPageIndex = PSS_PAGE_INFO;
        sMonSummaryScreen->isBoxMon = TRUE;
        sMonSummaryScreen->lockMovesFlag = FALSE;
        break;
    case PSS_MODE_SELECT_MOVE:
    case PSS_MODE_FORGET_MOVE:
        SetHelpContext(HELPCONTEXT_POKEMON_MOVES);
        sMonSummaryScreen->curPageIndex = PSS_PAGE_MOVES_INFO;
        sMonSummaryScreen->isBoxMon = FALSE;
        sMonSummaryScreen->lockMovesFlag = TRUE;
        break;
    }

    sMonSummaryScreen->state3270 = 0;
    sMonSummaryScreen->unk3274 = 0;
    sMonSummaryScreen->unk3278 = 0;
    sMonSummaryScreen->unk327C = 0;

    sMonSummaryScreen->unk3238 = 0;
    sMonSummaryScreen->unk323C = 2;
    sMonSummaryScreen->unk3240 = 1;
    sMonSummaryScreen->unk3244 = FALSE;

    sMonSummaryScreen->unk3228 = 0;
    sMonSummaryScreen->unk322C = 1;

    sub_8138B8C(&sMonSummaryScreen->currentMon);
    sMonSummaryScreen->isEgg = GetMonData(&sMonSummaryScreen->currentMon, MON_DATA_IS_EGG);
    sMonSummaryScreen->isBadEgg = GetMonData(&sMonSummaryScreen->currentMon, MON_DATA_SANITY_IS_BAD_EGG);

    if (sMonSummaryScreen->isBadEgg == TRUE)
        sMonSummaryScreen->isEgg = TRUE;

    sMonSummaryScreen->unk3300[0] = 0xff;
    SetMainCallback2(sub_8135C34);
}

void ShowSelectMovePokemonSummaryScreen(struct Pokemon * party, u8 cursorPos, u8 lastIdx, MainCallback savedCallback, u16 a4)
{
    ShowPokemonSummaryScreen(party, cursorPos, lastIdx, savedCallback, PSS_MODE_SELECT_MOVE);
    sMonSummaryScreen->unk325A[4] = a4;
}

static u8 sub_813476C(u8 a0)
{
    if (sMonSummaryScreen->unk301C == TRUE && sMonSummaryScreen->unk3224 != a0)
        return TRUE;

    return FALSE;
}

u32 sub_81347A4(u8 a0)
{
    if (sMonSummaryScreen->isEgg)
        return FALSE;

    if (sMonSummaryScreen->unk3300[0] != 0xff && sMonSummaryScreen->unk3300[0] == a0)
    {
        sMonSummaryScreen->unk3300[0] = 0xff;
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

static void sub_8134840(u8 taskId)
{
    switch (sMonSummaryScreen->state3270) {
    case PSS_STATE3270_0:
        BeginNormalPaletteFade(0xffffffff, 0, 16, 0, 0);
        sMonSummaryScreen->state3270 = PSS_STATE3270_1;
        break;
    case PSS_STATE3270_1:
        if (!gPaletteFade.active)
        {
            sub_813B784();
            sMonSummaryScreen->state3270 = PSS_STATE3270_2;
            return;
        }

        sMonSummaryScreen->state3270 = PSS_STATE3270_1;
        break;
    case PSS_STATE3270_2:
        if (MenuHelpers_CallLinkSomething() == TRUE)
            return;
        else if (sub_800B270() == TRUE)
            return;
        else if (FuncIsActiveTask(sub_813B3F0))
            return;

        if (sMonSummaryScreen->curPageIndex != PSS_PAGE_MOVES_INFO)
        {
            if (sub_81347A4(1) == TRUE)
            {
                if (FuncIsActiveTask(sub_8134BAC))
                {
                    sMonSummaryScreen->unk3300[0] = 1;
                    return;
                }
                else if (sMonSummaryScreen->curPageIndex < PSS_PAGE_MOVES)
                {
                    PlaySE(SE_SELECT);
                    HideBg(0);
                    sMonSummaryScreen->unk3224 = 1;
                    sub_8138414(sMonSummaryScreen->curPageIndex);
                    sMonSummaryScreen->curPageIndex++;
                    sMonSummaryScreen->state3270 = PSS_STATE3270_3;
                }
                return;
            }
            else if (sub_81347A4(0) == TRUE)
            {
                if (FuncIsActiveTask(sub_8134BAC))
                {
                    sMonSummaryScreen->unk3300[0] = 0;
                    return;
                }
                else if (sMonSummaryScreen->curPageIndex > PSS_PAGE_INFO)
                {
                    PlaySE(SE_SELECT);
                    HideBg(0);
                    sMonSummaryScreen->unk3224 = 0;
                    sub_8138414(sMonSummaryScreen->curPageIndex);
                    sMonSummaryScreen->curPageIndex--;
                    sMonSummaryScreen->state3270 = PSS_STATE3270_3;
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
                if (sMonSummaryScreen->curPageIndex == PSS_PAGE_INFO)
                {
                    PlaySE(SE_SELECT);
                    sMonSummaryScreen->state3270 = PSS_STATE3270_4;
                }
                else if (sMonSummaryScreen->curPageIndex == PSS_PAGE_MOVES)
                {
                    PlaySE(SE_SELECT);
                    sMonSummaryScreen->unk3224 = 1;
                    sub_8138414(sMonSummaryScreen->curPageIndex);
                    sMonSummaryScreen->curPageIndex++;
                    sMonSummaryScreen->state3270 = PSS_STATE3270_3;
                }
                return;
            }
            else if (JOY_NEW(B_BUTTON))
            {
                sMonSummaryScreen->state3270 = PSS_STATE3270_4;
            }
        }
        break;
    case PSS_STATE3270_3:
        if (sMonSummaryScreen->curPageIndex != PSS_PAGE_MOVES_INFO)
        {
            CreateTask(sub_8134BAC, 0);
            sMonSummaryScreen->state3270 = PSS_STATE3270_2;
        }
        else
        {
            gTasks[sMonSummaryScreen->unk3018].func = sub_8134E84;
            sMonSummaryScreen->state3270 = PSS_STATE3270_2;
        }
        break;
    case PSS_STATE3270_4:
        BeginNormalPaletteFade(0xffffffff, 0, 0, 16, 0);
        sMonSummaryScreen->state3270 = PSS_STATE3270_5;
        break;
    case PSS_STATE3270_5:
        if (Overworld_LinkRecvQueueLengthMoreThan2() == TRUE)
            return;
        else if (sub_800B270() == TRUE)
            return;

        sMonSummaryScreen->state3270 = PSS_STATE3270_6;
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
        sMonSummaryScreen->lockMovesFlag = TRUE;
        sMonSummaryScreen->unk301C = TRUE;
        sub_813B750(sMonSummaryScreen->curPageIndex);
        sub_8138280(sMonSummaryScreen->curPageIndex);
        break;
    case 1:
        if (sMonSummaryScreen->curPageIndex != PSS_PAGE_MOVES_INFO)
        {
            if (!(sMonSummaryScreen->curPageIndex == PSS_PAGE_MOVES && sMonSummaryScreen->unk3224 == 0))
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
        sub_8137D28(sMonSummaryScreen->curPageIndex);
        break;
    case 3:
        CopyWindowToVram(sMonSummaryScreen->unk3000[0], 2);
        CopyWindowToVram(sMonSummaryScreen->unk3000[1], 2);
        CopyWindowToVram(sMonSummaryScreen->unk3000[2], 2);
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
        sMonSummaryScreen->unk3244 = TRUE;
        break;
    case 6:
        if (!sub_81357A0(sMonSummaryScreen->unk3224))
            return;

        break;
    case 7:
        sub_8136F4C();
        if (sMonSummaryScreen->curPageIndex != PSS_PAGE_MOVES_INFO)
            sub_81374E8();

        sub_8137BD0();
        sub_8138A38();
        break;
    case 8:
        CopyWindowToVram(sMonSummaryScreen->unk3000[3], 2);
        CopyWindowToVram(sMonSummaryScreen->unk3000[4], 2);
        CopyWindowToVram(sMonSummaryScreen->unk3000[5], 2);
        CopyWindowToVram(sMonSummaryScreen->unk3000[6], 2);
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

        if (sMonSummaryScreen->curPageIndex == PSS_PAGE_MOVES_INFO)
            gTasks[sMonSummaryScreen->unk3018].func = sub_8138CD8;

        DestroyTask(taskId);
        data[0] = 0;
        sMonSummaryScreen->lockMovesFlag = FALSE;
        sMonSummaryScreen->unk301C = FALSE;
        return;
    }

    data[0]++;
}

static void sub_8134E84(u8 taskId)
{
    switch (sMonSummaryScreen->unk3284)
    {
    case 0:
        sMonSummaryScreen->lockMovesFlag = TRUE;
        sMonSummaryScreen->unk301C = TRUE;
        sub_8138280(sMonSummaryScreen->curPageIndex);
        break;
    case 1:
        if (sMonSummaryScreen->curPageIndex != PSS_PAGE_MOVES_INFO)
        {
            if (!(sMonSummaryScreen->curPageIndex == PSS_PAGE_MOVES && sMonSummaryScreen->unk3224 == 0))
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
        sub_813B750(sMonSummaryScreen->curPageIndex);
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
        CopyWindowToVram(sMonSummaryScreen->unk3000[0], 2);
        CopyWindowToVram(sMonSummaryScreen->unk3000[1], 2);
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
        CopyWindowToVram(sMonSummaryScreen->unk3000[3], 2);
        CopyWindowToVram(sMonSummaryScreen->unk3000[5], 2);
        break;
    case 7:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            CopyBgTilemapBufferToVram(0);
            sub_8135514();
            sMonSummaryScreen->unk3244 = TRUE;
        }
        else
            return;

        break;
    case 8:
        if (!sub_81357A0(sMonSummaryScreen->unk3224))
            return;

        sub_81374E8();
        CopyWindowToVram(sMonSummaryScreen->unk3000[4], 2);
        break;
    case 9:
        sub_8138A38();
        sub_8136E50(gUnknown_8419C45);
        break;
    case 10:
        sub_81356EC();
        CopyWindowToVram(sMonSummaryScreen->unk3000[6], 2);
        CopyWindowToVram(sMonSummaryScreen->unk3000[2], 2);
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
        gTasks[sMonSummaryScreen->unk3018].func = sub_8138CD8;
        sMonSummaryScreen->unk3284 = 0;
        sMonSummaryScreen->lockMovesFlag = FALSE;
        sMonSummaryScreen->unk301C = FALSE;
        return;
    }

    sMonSummaryScreen->unk3284++;
    return;
}

static void sub_81351A0(u8 taskId)
{
    switch (sMonSummaryScreen->unk3284)
    {
    case 0:
        sMonSummaryScreen->lockMovesFlag = TRUE;
        sMonSummaryScreen->unk301C = TRUE;
        sub_8138280(sMonSummaryScreen->curPageIndex);
        break;
    case 1:
        if (sMonSummaryScreen->curPageIndex != PSS_PAGE_MOVES_INFO) {
            if (!(sMonSummaryScreen->curPageIndex == PSS_PAGE_MOVES && sMonSummaryScreen->unk3224 == 0))
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
        CopyWindowToVram(sMonSummaryScreen->unk3000[3], 2);
        CopyWindowToVram(sMonSummaryScreen->unk3000[4], 2);
        CopyWindowToVram(sMonSummaryScreen->unk3000[5], 2);
        CopyBgTilemapBufferToVram(0);
        break;
    case 4:
        sub_8136DA4(gUnknown_8419C39);
        sub_8136DF0(gUnknown_8419C82);
        break;
    case 5:
        CopyWindowToVram(sMonSummaryScreen->unk3000[0], 2);
        CopyWindowToVram(sMonSummaryScreen->unk3000[1], 2);
        CopyBgTilemapBufferToVram(2);
        CopyBgTilemapBufferToVram(1);
        break;
    case 6:
        sub_8135514();
        sMonSummaryScreen->unk3244 = TRUE;
        sub_8135638();
        sub_813B750(sMonSummaryScreen->curPageIndex);
        sub_8138A38();
        break;
    case 7:
        break;
    case 8:
        if (sub_81357A0(sMonSummaryScreen->unk3224) == 0)
            return;

        sub_8136E50(gUnknown_8419C45);
        break;
    case 9:
        CopyWindowToVram(sMonSummaryScreen->unk3000[6], 2);
        CopyWindowToVram(sMonSummaryScreen->unk3000[2], 2);
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
        gTasks[sMonSummaryScreen->unk3018].func = sub_8134840;
        sMonSummaryScreen->unk3284 = 0;
        sMonSummaryScreen->lockMovesFlag = FALSE;
        sMonSummaryScreen->unk301C = FALSE;
        return;
    }

    sMonSummaryScreen->unk3284++;
    return;
}

static void sub_813546C(void)
{
    u8 i;
    for (i = 0; i < 11; i++)
    {
        sUnknown_203B160->unk2C[i] = (8 * i) + 396;
        sUnknown_203B160->sprites[i]->pos1.x = sUnknown_203B160->unk2C[i];
        if (i >= 9)
            continue;

        sUnknown_203B15C->unk28[i] = (8 * i) + 412;
        sUnknown_203B15C->sprites[i]->pos1.x = sUnknown_203B15C->unk28[i];
    }
}

static void sub_81354C4(void)
{
    u8 i;
    for (i = 0; i < 11; i++)
    {
        sUnknown_203B160->unk2C[i] = (8 * i) + 156;
        sUnknown_203B160->sprites[i]->pos1.x = sUnknown_203B160->unk2C[i];
        if (i >= 9)
            continue;
        sUnknown_203B15C->unk28[i] = (8 * i) + 172;
        sUnknown_203B15C->sprites[i]->pos1.x = sUnknown_203B15C->unk28[i];
    }
}

static void sub_8135514(void)
{
    s8 pageDelta = 1;

    if (sMonSummaryScreen->unk3224 == 1)
        pageDelta = -1;

    if (sMonSummaryScreen->curPageIndex == PSS_PAGE_MOVES_INFO)
    {
        sMonSummaryScreen->unk324C = 240;
        return;
    }

    if ((sMonSummaryScreen->curPageIndex + pageDelta) == PSS_PAGE_MOVES_INFO)
    {
        sub_81358DC(0, 0);
        sMonSummaryScreen->unk324C = 0;
        SetGpuReg(REG_OFFSET_BG1HOFS, 0);
        SetGpuReg(REG_OFFSET_BG2HOFS, 0);
        return;
    }

    if (sMonSummaryScreen->unk3224 == 1)
    {
        sMonSummaryScreen->unk324C = 0;
        SetGpuReg(REG_OFFSET_BG0HOFS, 0);
        SetGpuReg(REG_OFFSET_BG1HOFS, 0);
        SetGpuReg(REG_OFFSET_BG2HOFS, 0);
        sub_81358DC(1, 1);
    }
    else
    {
        u32 bg1Priority = GetGpuReg(REG_OFFSET_BG1CNT) & 3;
        u32 bg2Priority = GetGpuReg(REG_OFFSET_BG2CNT) & 3;
        sMonSummaryScreen->unk324C = 240;

        if (bg1Priority > bg2Priority)
            SetGpuReg(REG_OFFSET_BG1HOFS, 240);
        else
            SetGpuReg(REG_OFFSET_BG2HOFS, 240);

        SetGpuReg(REG_OFFSET_BG0HOFS, 240);
        sub_81358DC(1, 0);
    }

    if (sMonSummaryScreen->curPageIndex == PSS_PAGE_SKILLS)
    {
        if (sMonSummaryScreen->unk3224 == 1)
            sub_81354C4();
        else
            sub_813546C();
    }
    else if (sMonSummaryScreen->curPageIndex == PSS_PAGE_MOVES)
        sub_81354C4();

}

static void sub_8135638(void)
{
    u8 newPage;

    if (sMonSummaryScreen->unk3224 == 1)
        newPage = sMonSummaryScreen->curPageIndex - 1;
    else
        newPage = sMonSummaryScreen->curPageIndex + 1;

    switch (newPage)
    {
    case PSS_PAGE_INFO:
        break;
    case PSS_PAGE_SKILLS:
        sub_813A838(1);
        sub_813AB70(1);
        break;
    case PSS_PAGE_MOVES:
        if (sMonSummaryScreen->unk3224 == 1)
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

static void sub_81356EC(void)
{
    u8 newPage;

    if (sMonSummaryScreen->unk3224 == 1)
        newPage = sMonSummaryScreen->curPageIndex - 1;
    else
        newPage = sMonSummaryScreen->curPageIndex + 1;

    switch (newPage)
    {
    case PSS_PAGE_INFO:
        sub_813A838(0);
        sub_813AB70(0);
        break;
    case PSS_PAGE_SKILLS:
        break;
    case PSS_PAGE_MOVES:
        if (sMonSummaryScreen->unk3224 == 0)
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

static u8 sub_81357A0(u8 a0)
{
    s8 pageDelta = 1;

    if (sMonSummaryScreen->unk3224 == 1)
        pageDelta = -1;

    if (sMonSummaryScreen->curPageIndex == PSS_PAGE_MOVES_INFO)
        if (sMonSummaryScreen->unk324C <= 0)
        {
            sMonSummaryScreen->unk324C = 0;
            sMonSummaryScreen->unk3238 ^= 1;
            sub_81358DC(0, 0);
            sMonSummaryScreen->unk3244 = FALSE;
            return TRUE;
        }

    if ((sMonSummaryScreen->curPageIndex + pageDelta) == PSS_PAGE_MOVES_INFO)
        if (sMonSummaryScreen->unk324C >= 240)
        {
            sMonSummaryScreen->unk324C = 240;
            sMonSummaryScreen->unk3238 ^= 1;
            sMonSummaryScreen->unk3244 = FALSE;
            return TRUE;
        }

    if (sMonSummaryScreen->unk3224 == 1)
    {
        if (sMonSummaryScreen->unk324C >= 240)
        {
            sMonSummaryScreen->unk324C = 240;
            sMonSummaryScreen->unk3238 ^= 1;
            sub_81358DC(0, 0);
            sMonSummaryScreen->unk3244 = FALSE;
            return TRUE;
        }
    }
    else if (sMonSummaryScreen->unk324C <= 0)
    {
        sMonSummaryScreen->unk3238 ^= 1;
        sMonSummaryScreen->unk324C = 0;
        sMonSummaryScreen->unk3244 = FALSE;
        return TRUE;
    }

    return FALSE;
}

static void sub_81358DC(u8 a0, u8 a1)
{
    u8 i;
    u32 bg0Priority;
    u32 bg1Priority;
    u32 bg2Priority;

    bg0Priority = GetGpuReg(REG_OFFSET_BG0CNT) & 3;
    bg1Priority = GetGpuReg(REG_OFFSET_BG1CNT) & 3;
    bg2Priority = GetGpuReg(REG_OFFSET_BG2CNT) & 3;

    if (sMonSummaryScreen->unk3224 == 1)
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

    if (sMonSummaryScreen->unk3224 == 0)
    {
        bg0Priority = 0;
        if (bg1Priority > bg2Priority)
            bg1Priority = 1, bg2Priority = 2;
        else
            bg1Priority = 2, bg2Priority = 1;
    }

    for (i = 0; i < 11; i++)
    {
        if (sMonSummaryScreen->curPageIndex == PSS_PAGE_SKILLS && sMonSummaryScreen->unk3224 == 1)
            sUnknown_203B160->sprites[i]->oam.priority = bg0Priority;
        else
            sUnknown_203B160->sprites[i]->oam.priority = bg1Priority;

        if (i >= 9)
            continue;

        if (sMonSummaryScreen->curPageIndex == PSS_PAGE_SKILLS && sMonSummaryScreen->unk3224 == 1)
            sUnknown_203B15C->sprites[i]->oam.priority = bg0Priority;
        else
            sUnknown_203B15C->sprites[i]->oam.priority = bg1Priority;
    }

    SetGpuReg(REG_OFFSET_BG0CNT, (GetGpuReg(REG_OFFSET_BG0CNT) & 0xfffc) | bg0Priority);
    SetGpuReg(REG_OFFSET_BG1CNT, (GetGpuReg(REG_OFFSET_BG1CNT) & 0xfffc) | bg1Priority);
    SetGpuReg(REG_OFFSET_BG2CNT, (GetGpuReg(REG_OFFSET_BG2CNT) & 0xfffc) | bg2Priority);
}

static void sub_8135AA4(void)
{
    u8 newPage;

    if (sMonSummaryScreen->unk3224 == 1)
        newPage = sMonSummaryScreen->curPageIndex - 1;
    else
        newPage = sMonSummaryScreen->curPageIndex + 1;

    switch (newPage)
    {
    case PSS_PAGE_INFO:
        CopyToBgTilemapBuffer(sMonSummaryScreen->unk3240, gUnknown_8E9B750, 0, 0);
        break;
    case PSS_PAGE_SKILLS:
        if (sMonSummaryScreen->unk3224 == 1)
            CopyToBgTilemapBuffer(sMonSummaryScreen->unk323C, gUnknown_8E9B950, 0, 0);
        else
            CopyToBgTilemapBuffer(sMonSummaryScreen->unk323C, gUnknown_8E9B598, 0, 0);

        break;
    case PSS_PAGE_MOVES:
        if (sMonSummaryScreen->unk3224 == 1)
            CopyToBgTilemapBuffer(sMonSummaryScreen->unk3240, gUnknown_8E9BA9C, 0, 0);
        else
            CopyToBgTilemapBuffer(sMonSummaryScreen->unk3240, gUnknown_8E9B750, 0, 0);

        break;
    case PSS_PAGE_MOVES_INFO:
        CopyToBgTilemapBuffer(sMonSummaryScreen->unk323C, gUnknown_8E9B950, 0, 0);
        break;
    }
}

static void sub_8135B90(void)
{
    u8 newPage;

    if (sMonSummaryScreen->unk3224 == 1)
        newPage = sMonSummaryScreen->curPageIndex - 1;
    else
        newPage = sMonSummaryScreen->curPageIndex + 1;

    switch (newPage)
    {
    case PSS_PAGE_INFO:
        CopyToBgTilemapBuffer(sMonSummaryScreen->unk3240, gUnknown_8E9B750, 0, 0);
        break;
    case PSS_PAGE_SKILLS:
        break;
    case PSS_PAGE_MOVES:
        if (sMonSummaryScreen->unk3224 == 1)
            CopyToBgTilemapBuffer(3, sUnknown_8463C80, 0, 0);
        else
            CopyToBgTilemapBuffer(3, sUnknown_8463B88, 0, 0);

        break;
    case PSS_PAGE_MOVES_INFO:
        CopyToBgTilemapBuffer(3, sUnknown_8463B88, 0, 0);
        break;
    }
}

static void sub_8135C34(void)
{
    switch (sMonSummaryScreen->unk3274)
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
        if (sMonSummaryScreen->mode == PSS_MODE_SELECT_MOVE || sMonSummaryScreen->mode == PSS_MODE_FORGET_MOVE)
            CopyToBgTilemapBuffer(3, sUnknown_8463C80, 0, 0);
        else
            CopyToBgTilemapBuffer(3, sUnknown_8463B88, 0, 0);

        sub_8138538();
        break;
    case 11:
        if (sMonSummaryScreen->isEgg)
            CopyToBgTilemapBuffer(sMonSummaryScreen->unk323C, gUnknown_8E9BBCC, 0, 0);
        else
        {
            if (sMonSummaryScreen->mode == PSS_MODE_SELECT_MOVE || sMonSummaryScreen->mode == PSS_MODE_FORGET_MOVE)
            {
                CopyToBgTilemapBuffer(sMonSummaryScreen->unk323C, gUnknown_8E9B950, 0, 0);
                CopyToBgTilemapBuffer(sMonSummaryScreen->unk3240, gUnknown_8E9BA9C, 0, 0);
            }
            else
            {
                CopyToBgTilemapBuffer(sMonSummaryScreen->unk323C, gUnknown_8E9B598, 0, 0);
                CopyToBgTilemapBuffer(sMonSummaryScreen->unk3240, gUnknown_8E9B750, 0, 0);
            }
        }

        break;
    case 12:
        BlendPalettes(0xffffffff, 16, 0);
        sub_8137D28(sMonSummaryScreen->curPageIndex);
        sub_8137E28();
        break;
    case 13:
        BeginNormalPaletteFade(0xffffffff, 0, 16, 0, 0);
        CopyWindowToVram(sMonSummaryScreen->unk3000[0], 2);
        CopyWindowToVram(sMonSummaryScreen->unk3000[1], 2);
        CopyWindowToVram(sMonSummaryScreen->unk3000[2], 2);
        CopyWindowToVram(sMonSummaryScreen->unk3000[6], 2);
        CopyWindowToVram(sMonSummaryScreen->unk3000[3], 2);
        CopyWindowToVram(sMonSummaryScreen->unk3000[4], 2);
        CopyWindowToVram(sMonSummaryScreen->unk3000[5], 2);
        break;
    case 14:
        CopyBgTilemapBufferToVram(0);
        CopyBgTilemapBufferToVram(2);
        CopyBgTilemapBufferToVram(1);
        CopyBgTilemapBufferToVram(3);
        break;
    case 15:
        if (sMonSummaryScreen->mode == PSS_MODE_SELECT_MOVE || sMonSummaryScreen->mode == PSS_MODE_FORGET_MOVE)
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

    sMonSummaryScreen->unk3274++;
}

static u8 sub_8135F20(void)
{
    switch (sMonSummaryScreen->unk3278)
    {
    case 0:
        LoadPalette(gUnknown_8E9B310, 0, 0x20 * 5);
        if (IsMonShiny(&sMonSummaryScreen->currentMon) == TRUE && !sMonSummaryScreen->isEgg)
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
        LoadPalette(sUnknown_84636C0, 0x70, 0x20);
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
        LoadPalette(sUnknown_8463700, 0x80, 0x20);
        return TRUE;
    }

    sMonSummaryScreen->unk3278++;
    return FALSE;
}

static u8 sub_8136040(void)
{
    switch (sMonSummaryScreen->unk3280)
    {
    case 0:
        sub_81360D4();
        if (sMonSummaryScreen->isEgg)
        {
            sMonSummaryScreen->unk3280 = 0;
            return TRUE;
        }

        break;
    case 1:
        if (sMonSummaryScreen->isEgg == 0)
            sub_8136350();
        break;
    case 2:
        if (sMonSummaryScreen->isEgg == 0)
            sub_81367B0();
        break;
    default:
        sMonSummaryScreen->unk3280 = 0;
        return TRUE;
    }

    sMonSummaryScreen->unk3280++;
    return FALSE;
}

static void sub_81360D4(void)
{
    u8 tempStr[20];
    u16 dexNum;
    u16 gender;
    u16 heldItem;
    u32 otId;

    dexNum = SpeciesToPokedexNum(GetMonData(&sMonSummaryScreen->currentMon, MON_DATA_SPECIES));
    if (dexNum == 0xffff)
        StringCopy(sMonSummaryScreen->summary.unk3064, gUnknown_8416202);
    else
        ConvertIntToDecimalStringN(sMonSummaryScreen->summary.unk3064, dexNum, STR_CONV_MODE_LEADING_ZEROS, 3);

    sUnknown_203B144->unk00 = 0;

    if (!sMonSummaryScreen->isEgg)
    {
        dexNum = GetMonData(&sMonSummaryScreen->currentMon, MON_DATA_SPECIES);
        GetSpeciesName(sMonSummaryScreen->summary.unk3028, dexNum);
    }
    else
    {
        GetMonData(&sMonSummaryScreen->currentMon, MON_DATA_NICKNAME, sMonSummaryScreen->summary.unk3028);
        return;
    }

    sMonSummaryScreen->unk3220[0] = gBaseStats[dexNum].type1;
    sMonSummaryScreen->unk3220[1] = gBaseStats[dexNum].type2;

    GetMonData(&sMonSummaryScreen->currentMon, MON_DATA_NICKNAME, tempStr);
    StringCopyN_Multibyte(sMonSummaryScreen->summary.unk3034, tempStr, POKEMON_NAME_LENGTH);
    StringGetEnd10(sMonSummaryScreen->summary.unk3034);

    gender = GetMonGender(&sMonSummaryScreen->currentMon);
    dexNum = GetMonData(&sMonSummaryScreen->currentMon, MON_DATA_SPECIES2);

    if (gender == MON_FEMALE)
        StringCopy(sMonSummaryScreen->summary.unk3084, gText_FemaleSymbol);
    else if (gender == MON_MALE)
        StringCopy(sMonSummaryScreen->summary.unk3084, gText_MaleSymbol);
    else
        StringCopy(sMonSummaryScreen->summary.unk3084, gString_Dummy);

    if (dexNum == SPECIES_NIDORAN_M || dexNum == SPECIES_NIDORAN_F)
        if (StringCompare(sMonSummaryScreen->summary.unk3034, gSpeciesNames[dexNum]) == 0)
            StringCopy(sMonSummaryScreen->summary.unk3084, gString_Dummy);

    GetMonData(&sMonSummaryScreen->currentMon, MON_DATA_OT_NAME, tempStr);
    StringCopyN_Multibyte(sMonSummaryScreen->summary.unk3040, tempStr, OT_NAME_LENGTH);

    ConvertInternationalString(sMonSummaryScreen->summary.unk3040, GetMonData(&sMonSummaryScreen->currentMon, MON_DATA_LANGUAGE));

    otId = GetMonData(&sMonSummaryScreen->currentMon, MON_DATA_OT_ID) & 0xffff;
    ConvertIntToDecimalStringN(sMonSummaryScreen->summary.unk306C, otId, STR_CONV_MODE_LEADING_ZEROS, 5);

    ConvertIntToDecimalStringN(tempStr, GetMonData(&sMonSummaryScreen->currentMon, MON_DATA_LEVEL), STR_CONV_MODE_LEFT_ALIGN, 3);
    StringCopy(sMonSummaryScreen->summary.unk3088, gText_Lv);
    StringAppendN(sMonSummaryScreen->summary.unk3088, tempStr, 4);

    heldItem = GetMonData(&sMonSummaryScreen->currentMon, MON_DATA_HELD_ITEM);

    if (heldItem == ITEM_NONE)
        StringCopy(sMonSummaryScreen->summary.unk3074, gUnknown_84161EF);
    else
        CopyItemName(heldItem, sMonSummaryScreen->summary.unk3074);
}

#define MACRO_8136350_0(x) (63 - StringLength((x)) * 6)
#define MACRO_8136350_1(x) (27 - StringLength((x)) * 6)

static void sub_8136350(void)
{
    u8 tempStr[20];
    u8 level;
    u16 type;
    u16 species;
    u16 hp;
    u16 statValue;
    u32 exp;
    u32 expToNextLevel;

    hp = GetMonData(&sMonSummaryScreen->currentMon, MON_DATA_HP);
    ConvertIntToDecimalStringN(sMonSummaryScreen->summary.unk3090, hp, STR_CONV_MODE_LEFT_ALIGN, 3);
    StringAppend(sMonSummaryScreen->summary.unk3090, gText_Slash);

    hp = GetMonData(&sMonSummaryScreen->currentMon, MON_DATA_MAX_HP);
    ConvertIntToDecimalStringN(tempStr, hp, STR_CONV_MODE_LEFT_ALIGN, 3);
    StringAppend(sMonSummaryScreen->summary.unk3090, tempStr);

    sUnknown_203B144->unk02 = MACRO_8136350_0(sMonSummaryScreen->summary.unk3090);

    if (sMonSummaryScreen->savedCallback == CB2_ReturnToTradeMenuFromSummary && sMonSummaryScreen->isEnemyParty == TRUE)
    {
        statValue = GetMonData(&sMonSummaryScreen->currentMon, MON_DATA_ATK2);
        ConvertIntToDecimalStringN(sMonSummaryScreen->summary.unk309C[PSS_STAT_ATK], statValue, STR_CONV_MODE_LEFT_ALIGN, 3);
        sUnknown_203B144->unk04 = MACRO_8136350_1(sMonSummaryScreen->summary.unk309C[PSS_STAT_ATK]);

        statValue = GetMonData(&sMonSummaryScreen->currentMon, MON_DATA_DEF2);
        ConvertIntToDecimalStringN(sMonSummaryScreen->summary.unk309C[PSS_STAT_DEF], statValue, STR_CONV_MODE_LEFT_ALIGN, 3);
        sUnknown_203B144->unk06 = MACRO_8136350_1(sMonSummaryScreen->summary.unk309C[PSS_STAT_DEF]);

        statValue = GetMonData(&sMonSummaryScreen->currentMon, MON_DATA_SPATK2);
        ConvertIntToDecimalStringN(sMonSummaryScreen->summary.unk309C[PSS_STAT_SPA], statValue, STR_CONV_MODE_LEFT_ALIGN, 3);
        sUnknown_203B144->unk08 = MACRO_8136350_1(sMonSummaryScreen->summary.unk309C[PSS_STAT_SPA]);

        statValue = GetMonData(&sMonSummaryScreen->currentMon, MON_DATA_SPDEF2);
        ConvertIntToDecimalStringN(sMonSummaryScreen->summary.unk309C[PSS_STAT_SPD], statValue, STR_CONV_MODE_LEFT_ALIGN, 3);
        sUnknown_203B144->unk0A = MACRO_8136350_1(sMonSummaryScreen->summary.unk309C[PSS_STAT_SPD]);

        statValue = GetMonData(&sMonSummaryScreen->currentMon, MON_DATA_SPEED2);
        ConvertIntToDecimalStringN(sMonSummaryScreen->summary.unk309C[PSS_STAT_SPE], statValue, STR_CONV_MODE_LEFT_ALIGN, 3);
        sUnknown_203B144->unk0C = MACRO_8136350_1(sMonSummaryScreen->summary.unk309C[PSS_STAT_SPE]);
    }
    else
    {
        statValue = GetMonData(&sMonSummaryScreen->currentMon, MON_DATA_ATK);
        ConvertIntToDecimalStringN(sMonSummaryScreen->summary.unk309C[PSS_STAT_ATK], statValue, STR_CONV_MODE_LEFT_ALIGN, 3);
        sUnknown_203B144->unk04 = MACRO_8136350_1(sMonSummaryScreen->summary.unk309C[PSS_STAT_ATK]);

        statValue = GetMonData(&sMonSummaryScreen->currentMon, MON_DATA_DEF);
        ConvertIntToDecimalStringN(sMonSummaryScreen->summary.unk309C[PSS_STAT_DEF], statValue, STR_CONV_MODE_LEFT_ALIGN, 3);
        sUnknown_203B144->unk06 = MACRO_8136350_1(sMonSummaryScreen->summary.unk309C[PSS_STAT_DEF]);

        statValue = GetMonData(&sMonSummaryScreen->currentMon, MON_DATA_SPATK);
        ConvertIntToDecimalStringN(sMonSummaryScreen->summary.unk309C[PSS_STAT_SPA], statValue, STR_CONV_MODE_LEFT_ALIGN, 3);
        sUnknown_203B144->unk08 = MACRO_8136350_1(sMonSummaryScreen->summary.unk309C[PSS_STAT_SPA]);

        statValue = GetMonData(&sMonSummaryScreen->currentMon, MON_DATA_SPDEF);
        ConvertIntToDecimalStringN(sMonSummaryScreen->summary.unk309C[PSS_STAT_SPD], statValue, STR_CONV_MODE_LEFT_ALIGN, 3);
        sUnknown_203B144->unk0A = MACRO_8136350_1(sMonSummaryScreen->summary.unk309C[PSS_STAT_SPD]);

        statValue = GetMonData(&sMonSummaryScreen->currentMon, MON_DATA_SPEED);
        ConvertIntToDecimalStringN(sMonSummaryScreen->summary.unk309C[PSS_STAT_SPE], statValue, STR_CONV_MODE_LEFT_ALIGN, 3);
        sUnknown_203B144->unk0C = MACRO_8136350_1(sMonSummaryScreen->summary.unk309C[PSS_STAT_SPE]);
    }

    exp = GetMonData(&sMonSummaryScreen->currentMon, MON_DATA_EXP);
    ConvertIntToDecimalStringN(sMonSummaryScreen->summary.unk31A4, exp, STR_CONV_MODE_LEFT_ALIGN, 7);
    sUnknown_203B144->unk0E = MACRO_8136350_0(sMonSummaryScreen->summary.unk31A4);

    level = GetMonData(&sMonSummaryScreen->currentMon, MON_DATA_LEVEL);
    expToNextLevel = 0;
    if (level < 100)
    {
        species = GetMonData(&sMonSummaryScreen->currentMon, MON_DATA_SPECIES);
        expToNextLevel = gExperienceTables[gBaseStats[species].growthRate][level + 1] - exp;
    }

    ConvertIntToDecimalStringN(sMonSummaryScreen->summary.unk31B0, expToNextLevel, STR_CONV_MODE_LEFT_ALIGN, 7);
    sUnknown_203B144->unk10 = MACRO_8136350_0(sMonSummaryScreen->summary.unk31B0);

    type = GetAbilityBySpecies(GetMonData(&sMonSummaryScreen->currentMon, MON_DATA_SPECIES), GetMonData(&sMonSummaryScreen->currentMon, MON_DATA_ABILITY_NUM));
    StringCopy(sMonSummaryScreen->summary.unk31BC, gAbilityNames[type]);
    StringCopy(sMonSummaryScreen->summary.unk31CC, gAbilityDescriptionPointers[type]);

    sMonSummaryScreen->unk326C = sub_8138C5C(GetMonData(&sMonSummaryScreen->currentMon, MON_DATA_STATUS));
    if (sMonSummaryScreen->unk326C == AILMENT_NONE)
        if (CheckPartyPokerus(&sMonSummaryScreen->currentMon, 0))
            sMonSummaryScreen->unk326C = AILMENT_PKRS;
}

static void sub_81367B0(void)
{
    u8 i;

    for (i = 0; i < 4; i++)
        sub_81367E8(i);

    if (sMonSummaryScreen->mode == PSS_MODE_SELECT_MOVE)
        sub_81367E8(4);
}

#define MACRO_81367E8_0(a, b) ((6 * (a)) - StringLength((b)) * 6)

static void sub_81367E8(u8 i)
{
    if (i < 4)
        sMonSummaryScreen->unk325A[i] = sub_8138BEC(&sMonSummaryScreen->currentMon, i);

    if (sMonSummaryScreen->unk325A[i] == 0)
    {
        StringCopy(sMonSummaryScreen->summary.unk3128[i], gUnknown_841620E);
        StringCopy(sMonSummaryScreen->summary.unk30B8[i], gUnknown_8416210);
        StringCopy(sMonSummaryScreen->summary.unk316C[i], gText_ThreeHyphens);
        StringCopy(sMonSummaryScreen->summary.unk3188[i], gText_ThreeHyphens);
        sUnknown_203B144->unk12[i] = 0xff;
        sUnknown_203B144->unk1C[i] = 0xff;
        return;
    }

    sMonSummaryScreen->unk3264++;
    sMonSummaryScreen->unk3250[i] = gBattleMoves[sMonSummaryScreen->unk325A[i]].type;
    StringCopy(sMonSummaryScreen->summary.unk3128[i], gMoveNames[sMonSummaryScreen->unk325A[i]]);

    if (i >= 4 && sMonSummaryScreen->mode == PSS_MODE_SELECT_MOVE)
    {
        ConvertIntToDecimalStringN(sMonSummaryScreen->summary.unk30B8[i],
                                   gBattleMoves[sMonSummaryScreen->unk325A[i]].pp, STR_CONV_MODE_LEFT_ALIGN, 3);
        ConvertIntToDecimalStringN(sMonSummaryScreen->summary.unk30F0[i],
                                   gBattleMoves[sMonSummaryScreen->unk325A[i]].pp, STR_CONV_MODE_LEFT_ALIGN, 3);
    }
    else
    {
        ConvertIntToDecimalStringN(sMonSummaryScreen->summary.unk30B8[i],
                                   sub_8138C24(&sMonSummaryScreen->currentMon, i), STR_CONV_MODE_LEFT_ALIGN, 3);
        ConvertIntToDecimalStringN(sMonSummaryScreen->summary.unk30F0[i],
                                   CalculatePPWithBonus(sMonSummaryScreen->unk325A[i], GetMonData(&sMonSummaryScreen->currentMon, MON_DATA_PP_BONUSES), i),
                                   STR_CONV_MODE_LEFT_ALIGN, 3);
    }

    sUnknown_203B144->unk12[i] = MACRO_81367E8_0(2, sMonSummaryScreen->summary.unk30B8[i]);
    sUnknown_203B144->unk1C[i] = MACRO_81367E8_0(2, sMonSummaryScreen->summary.unk30F0[i]);

    if (gBattleMoves[sMonSummaryScreen->unk325A[i]].power <= 1)
        StringCopy(sMonSummaryScreen->summary.unk316C[i], gText_ThreeHyphens);
    else
        ConvertIntToDecimalStringN(sMonSummaryScreen->summary.unk316C[i], gBattleMoves[sMonSummaryScreen->unk325A[i]].power, STR_CONV_MODE_RIGHT_ALIGN, 3);

    if (gBattleMoves[sMonSummaryScreen->unk325A[i]].accuracy == 0)
        StringCopy(sMonSummaryScreen->summary.unk3188[i], gText_ThreeHyphens);
    else
        ConvertIntToDecimalStringN(sMonSummaryScreen->summary.unk3188[i], gBattleMoves[sMonSummaryScreen->unk325A[i]].accuracy, STR_CONV_MODE_RIGHT_ALIGN, 3);
}

static u8 sub_8136AEC(void)
{
    switch (sMonSummaryScreen->unk327C)
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

    sMonSummaryScreen->unk327C++;
    return FALSE;
}

static void sub_8136BAC(void)
{
    ResetSpriteData();
    ResetPaletteFade();
    FreeAllSpritePalettes();
    ScanlineEffect_Stop();
}

static void sub_8136BC4(void)
{
    DmaClearLarge16(3, (void *)VRAM, VRAM_SIZE, 0x1000);
    DmaClear32(3, (void *)OAM, OAM_SIZE);
    DmaClear16(3, (void *)PLTT, PLTT_SIZE);

    SetGpuReg(REG_OFFSET_DISPCNT, 0);

    ResetBgsAndClearDma3BusyFlags(0);
    InitBgsFromTemplates(0, sUnknown_8463EFC, ARRAY_COUNT(sUnknown_8463EFC));

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

    sub_813B750(sMonSummaryScreen->curPageIndex);

    SetGpuReg(REG_OFFSET_WININ, (WININ_WIN0_OBJ | WININ_WIN0_BG0 | WININ_WIN0_BG1 | WININ_WIN0_BG2 | WININ_WIN0_BG3) << 8);
    SetGpuReg(REG_OFFSET_WINOUT, WINOUT_WIN01_BG0 | WINOUT_WIN01_BG1 | WINOUT_WIN01_BG2 | WINOUT_WIN01_BG3);
    SetGpuReg(REG_OFFSET_WIN1V, 32 << 8 | 135);
    SetGpuReg(REG_OFFSET_WIN1H, 2 << 8 | 240);

    SetBgTilemapBuffer(1, sMonSummaryScreen->unk0);
    SetBgTilemapBuffer(2, sMonSummaryScreen->unk1000);
    SetBgTilemapBuffer(3, sMonSummaryScreen->unk2000);

    ShowBg(0);
    ShowBg(1);
    ShowBg(2);
    ShowBg(3);
}

static void sub_8136D54(void)
{
    if (sMonSummaryScreen->mode == PSS_MODE_SELECT_MOVE || sMonSummaryScreen->mode == PSS_MODE_FORGET_MOVE)
        sMonSummaryScreen->unk3018 = CreateTask(sub_81393D4, 0);
    else
        sMonSummaryScreen->unk3018 = CreateTask(sub_8134840, 0);

    SetMainCallback2(sub_8137EE8);
}

static void sub_8136DA4(const u8 * str)
{
    FillWindowPixelBuffer(sMonSummaryScreen->unk3000[0], 0);
    AddTextPrinterParameterized3(sMonSummaryScreen->unk3000[0], 2, 4, 1, sUnknown_8463FA4[1], 0, str);
    PutWindowTilemap(sMonSummaryScreen->unk3000[0]);
}

static void sub_8136DF0(const u8 * str)
{
    u8 v0;
    s32 width;
    u8 r1;

    FillWindowPixelBuffer(sMonSummaryScreen->unk3000[1], 0);
    width = GetStringWidth(0, str, 0);
    r1 = sMonSummaryScreen->unk3000[1];
    AddTextPrinterParameterized3(r1, 0, 0x54 - width, 0, sUnknown_8463FA4[1], 0, str);
    PutWindowTilemap(sMonSummaryScreen->unk3000[1]);
}

static void sub_8136E50(const u8 * msg)
{
    FillWindowPixelBuffer(sMonSummaryScreen->unk3000[2], 0);

    if (!sMonSummaryScreen->isEgg)
    {
        if (sMonSummaryScreen->curPageIndex != PSS_PAGE_MOVES_INFO)
            AddTextPrinterParameterized3(sMonSummaryScreen->unk3000[2], 2, 4, 2, sUnknown_8463FA4[1], 0xff, sMonSummaryScreen->summary.unk3088);

        AddTextPrinterParameterized3(sMonSummaryScreen->unk3000[2], 2, 40, 2, sUnknown_8463FA4[1], 0xff, sMonSummaryScreen->summary.unk3034);

        if (GetMonGender(&sMonSummaryScreen->currentMon) == MON_FEMALE)
            AddTextPrinterParameterized3(sMonSummaryScreen->unk3000[2], 2, 105, 2, sUnknown_8463FA4[3], 0, sMonSummaryScreen->summary.unk3084);
        else
            AddTextPrinterParameterized3(sMonSummaryScreen->unk3000[2], 2, 105, 2, sUnknown_8463FA4[2], 0, sMonSummaryScreen->summary.unk3084);
    }

    PutWindowTilemap(sMonSummaryScreen->unk3000[2]);
}

static void sub_8136F4C(void)
{
    FillWindowPixelBuffer(sMonSummaryScreen->unk3000[3], 0);

    switch (sMonSummaryScreen->curPageIndex)
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

    PutWindowTilemap(sMonSummaryScreen->unk3000[3]);
}

static void sub_8136FB0(void)
{
    AddTextPrinterParameterized3(sMonSummaryScreen->unk3000[3], 2, 47, 19, sUnknown_8463FA4[0], TEXT_SPEED_FF, sMonSummaryScreen->summary.unk3028);

    if (!sMonSummaryScreen->isEgg)
    {
        AddTextPrinterParameterized3(sMonSummaryScreen->unk3000[3], 2, 47 + sUnknown_203B144->unk00, 5, sUnknown_8463FA4[0], TEXT_SPEED_FF, sMonSummaryScreen->summary.unk3064);
        AddTextPrinterParameterized3(sMonSummaryScreen->unk3000[3], 2, 47, 49, sUnknown_8463FA4[0], TEXT_SPEED_FF, sMonSummaryScreen->summary.unk3040);
        AddTextPrinterParameterized3(sMonSummaryScreen->unk3000[3], 2, 47, 64, sUnknown_8463FA4[0], TEXT_SPEED_FF, sMonSummaryScreen->summary.unk306C);
        AddTextPrinterParameterized3(sMonSummaryScreen->unk3000[3], 2, 47, 79, sUnknown_8463FA4[0], TEXT_SPEED_FF, sMonSummaryScreen->summary.unk3074);
    }
    else
    {
        u8 eggCycles;
        u8 hatchMsgIndex;

        eggCycles = GetMonData(&sMonSummaryScreen->currentMon, MON_DATA_FRIENDSHIP);

        if (eggCycles <= 5)
            hatchMsgIndex = 3;
        else if (eggCycles <= 10)
            hatchMsgIndex = 2;
        else if (eggCycles <= 40)
            hatchMsgIndex = 1;
        else
            hatchMsgIndex = 0;

        if (sMonSummaryScreen->isBadEgg)
            hatchMsgIndex = 0;

        AddTextPrinterParameterized3(sMonSummaryScreen->unk3000[3], 2, 7, 45, sUnknown_8463FA4[0], TEXT_SPEED_FF, sUnknown_8463EC4[hatchMsgIndex]);
    }
}

static void sub_81370EC(void)
{
    AddTextPrinterParameterized3(sMonSummaryScreen->unk3000[3], 2, 14 + sUnknown_203B144->unk02, 4, sUnknown_8463FA4[0], TEXT_SPEED_FF, sMonSummaryScreen->summary.unk3090);
    AddTextPrinterParameterized3(sMonSummaryScreen->unk3000[3], 2, 50 + sUnknown_203B144->unk04, 22, sUnknown_8463FA4[0], TEXT_SPEED_FF, sMonSummaryScreen->summary.unk309C[PSS_STAT_ATK]);
    AddTextPrinterParameterized3(sMonSummaryScreen->unk3000[3], 2, 50 + sUnknown_203B144->unk06, 35, sUnknown_8463FA4[0], TEXT_SPEED_FF, sMonSummaryScreen->summary.unk309C[PSS_STAT_DEF]);
    AddTextPrinterParameterized3(sMonSummaryScreen->unk3000[3], 2, 50 + sUnknown_203B144->unk08, 48, sUnknown_8463FA4[0], TEXT_SPEED_FF, sMonSummaryScreen->summary.unk309C[PSS_STAT_SPA]);
    AddTextPrinterParameterized3(sMonSummaryScreen->unk3000[3], 2, 50 + sUnknown_203B144->unk0A, 61, sUnknown_8463FA4[0], TEXT_SPEED_FF, sMonSummaryScreen->summary.unk309C[PSS_STAT_SPD]);
    AddTextPrinterParameterized3(sMonSummaryScreen->unk3000[3], 2, 50 + sUnknown_203B144->unk0C, 74, sUnknown_8463FA4[0], TEXT_SPEED_FF, sMonSummaryScreen->summary.unk309C[PSS_STAT_SPE]);
    AddTextPrinterParameterized3(sMonSummaryScreen->unk3000[3], 2, 15 + sUnknown_203B144->unk0E, 87, sUnknown_8463FA4[0], TEXT_SPEED_FF, sMonSummaryScreen->summary.unk31A4);
    AddTextPrinterParameterized3(sMonSummaryScreen->unk3000[3], 2, 15 + sUnknown_203B144->unk10, 100, sUnknown_8463FA4[0], TEXT_SPEED_FF, sMonSummaryScreen->summary.unk31B0);
}

#define MACRO_8137270(x) ((x) * 28 + 5)

static void sub_8137270(void)
{
    u8 i;

    for (i = 0; i < 4; i++)
        sub_81372E4(i);

    if (sMonSummaryScreen->curPageIndex == PSS_PAGE_MOVES_INFO)
    {
        if (sMonSummaryScreen->mode == PSS_MODE_SELECT_MOVE)
            sub_81372E4(4);
        else
            AddTextPrinterParameterized3(sMonSummaryScreen->unk3000[3], 2,
                                         3, MACRO_8137270(4),
                                         sUnknown_8463EF0[0], TEXT_SPEED_FF, gFameCheckerText_Cancel);
    }
}

#define MACRO_81372E4(x) ((x) * 28 + 16)

static void sub_81372E4(u8 i)
{
    u8 v0 = 0;
    u8 curPP = sub_8138C24(&sMonSummaryScreen->currentMon, i);
    u16 move = sMonSummaryScreen->unk325A[i];
    u8 ppBonuses = GetMonData(&sMonSummaryScreen->currentMon, MON_DATA_PP_BONUSES);
    u8 maxPP = CalculatePPWithBonus(move, ppBonuses, i);

    if (i == 4)
        curPP = maxPP;

    AddTextPrinterParameterized3(sMonSummaryScreen->unk3000[3], 2, 3, MACRO_8137270(i), sUnknown_8463EF0[0], TEXT_SPEED_FF, sMonSummaryScreen->summary.unk3128[i]);

    if (sMonSummaryScreen->unk325A[i] == 0 || (curPP == maxPP))
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

    AddTextPrinterParameterized3(sMonSummaryScreen->unk3000[3], 2, 36, MACRO_81372E4(i), sUnknown_8463EF0[v0], TEXT_SPEED_FF, gUnknown_8416238);
    AddTextPrinterParameterized3(sMonSummaryScreen->unk3000[3], 2, 46 + sUnknown_203B144->unk12[i], MACRO_81372E4(i), sUnknown_8463EF0[v0], TEXT_SPEED_FF, sMonSummaryScreen->summary.unk30B8[i]);

    if (sMonSummaryScreen->unk325A[i] != MOVE_NONE)
    {
        AddTextPrinterParameterized3(sMonSummaryScreen->unk3000[3], 2, 58, MACRO_81372E4(i), sUnknown_8463EF0[v0], TEXT_SPEED_FF, gText_Slash);
        AddTextPrinterParameterized3(sMonSummaryScreen->unk3000[3], 2, 64 + sUnknown_203B144->unk1C[i], MACRO_81372E4(i), sUnknown_8463EF0[v0], TEXT_SPEED_FF, sMonSummaryScreen->summary.unk30F0[i]);
    }
}

static void sub_81374E8(void)
{
    FillWindowPixelBuffer(sMonSummaryScreen->unk3000[4], 0);

    switch (sMonSummaryScreen->curPageIndex)
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

    PutWindowTilemap(sMonSummaryScreen->unk3000[4]);
}

static void sub_8137554(void)
{
    if (!sMonSummaryScreen->isEgg)
        sub_8137944();
    else
        sub_8137970();
}

static void sub_8137578(void)
{
    u8 nature;
    u8 level;
    u8 metLocation;
    u8 levelStr[5];
    u8 mapNameStr[32];
    u8 natureMetOrHatchedAtLevelStr[152];

    DynamicPlaceholderTextUtil_Reset();
    nature = GetNature(&sMonSummaryScreen->currentMon);
    DynamicPlaceholderTextUtil_SetPlaceholderPtr(0, gNatureNamePointers[nature]);
    level = GetMonData(&sMonSummaryScreen->currentMon, MON_DATA_MET_LEVEL);

    if (level == 0)
        level = 5;

    ConvertIntToDecimalStringN(levelStr, level, STR_CONV_MODE_LEFT_ALIGN, 3);
    DynamicPlaceholderTextUtil_SetPlaceholderPtr(1, levelStr);

    metLocation = GetMonData(&sMonSummaryScreen->currentMon, MON_DATA_MET_LOCATION);

    if (sub_813B838(metLocation) == TRUE)
        GetMapNameGeneric_(mapNameStr, metLocation);
    else
    {
        if (sMonSummaryScreen->isEnemyParty == TRUE || sub_8138B4C() == TRUE)
            StringCopy(mapNameStr, gUnknown_8419C13);
        else
            StringCopy(mapNameStr, gUnknown_8419C0B);
    }

    DynamicPlaceholderTextUtil_SetPlaceholderPtr(2, mapNameStr);

    if (GetMonData(&sMonSummaryScreen->currentMon, MON_DATA_MET_LEVEL) == 0)
    {
        if (GetMonData(&sMonSummaryScreen->currentMon, MON_DATA_OBEDIENCE) == 1)
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

    AddTextPrinterParameterized4(sMonSummaryScreen->unk3000[4], 2, 0, 3, 0, 0, sUnknown_8463FA4[0], TEXT_SPEED_FF, natureMetOrHatchedAtLevelStr);
}

static void sub_8137724(void)
{
    u8 nature;
    u8 level;
    u8 metLocation;
    u8 levelStr[5];
    u8 mapNameStr[32];
    u8 natureMetOrHatchedAtLevelStr[152];

    DynamicPlaceholderTextUtil_Reset();
    nature = GetNature(&sMonSummaryScreen->currentMon);
    DynamicPlaceholderTextUtil_SetPlaceholderPtr(0, gNatureNamePointers[nature]);

    level = GetMonData(&sMonSummaryScreen->currentMon, MON_DATA_MET_LEVEL);

    if (level == 0)
        level = 5;

    ConvertIntToDecimalStringN(levelStr, level, STR_CONV_MODE_LEFT_ALIGN, 3);
    DynamicPlaceholderTextUtil_SetPlaceholderPtr(1, levelStr);

    metLocation = GetMonData(&sMonSummaryScreen->currentMon, MON_DATA_MET_LOCATION);

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

        AddTextPrinterParameterized4(sMonSummaryScreen->unk3000[4], 2, 0, 3, 0, 0, sUnknown_8463FA4[0], TEXT_SPEED_FF, natureMetOrHatchedAtLevelStr);
        return;
    }

    if (sub_813B838(metLocation) == TRUE)
        GetMapNameGeneric_(mapNameStr, metLocation);
    else
        StringCopy(mapNameStr, gUnknown_8419C0B);

    DynamicPlaceholderTextUtil_SetPlaceholderPtr(2, mapNameStr);

    if (GetMonData(&sMonSummaryScreen->currentMon, MON_DATA_MET_LEVEL) == 0)
    {
        if (GetMonData(&sMonSummaryScreen->currentMon, MON_DATA_OBEDIENCE) == 1)
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

    AddTextPrinterParameterized4(sMonSummaryScreen->unk3000[4], 2, 0, 3, 0, 0, sUnknown_8463FA4[0], TEXT_SPEED_FF, natureMetOrHatchedAtLevelStr);
}

static void sub_8137944(void)
{
    if (sub_813847C(&sMonSummaryScreen->currentMon) == TRUE)
        sub_8137578();
    else
        sub_8137724();
}

static void sub_8137970(void)
{
    u8 metLocation;
    u8 version;
    u8 chosenStrIndex = 0;

    metLocation = GetMonData(&sMonSummaryScreen->currentMon, MON_DATA_MET_LOCATION);

    if (sMonSummaryScreen->monList.mons != gEnemyParty)
    {
        if (metLocation == METLOC_FATEFUL_ENCOUNTER || GetMonData(&sMonSummaryScreen->currentMon, MON_DATA_OBEDIENCE) == 1)
            chosenStrIndex = 4;
        else
        {
            version = GetMonData(&sMonSummaryScreen->currentMon, MON_DATA_MET_GAME);

            if (version != VERSION_LEAF_GREEN && version != VERSION_FIRE_RED)
                chosenStrIndex = 1;
            else if (metLocation == METLOC_SPECIAL_EGG)
                chosenStrIndex = 2;

            if (chosenStrIndex == 0 || chosenStrIndex == 2)
                if (sub_813847C(&sMonSummaryScreen->currentMon) == FALSE)
                    chosenStrIndex++;
        }
    }
    else
    {
        if (metLocation == METLOC_FATEFUL_ENCOUNTER || GetMonData(&sMonSummaryScreen->currentMon, MON_DATA_OBEDIENCE) == 1)
            chosenStrIndex = 4;
        else
        {
            version = GetMonData(&sMonSummaryScreen->currentMon, MON_DATA_MET_GAME);

            if (version != VERSION_LEAF_GREEN && version != VERSION_FIRE_RED)
            {
                if (metLocation == METLOC_SPECIAL_EGG)
                    chosenStrIndex = 5;
            }
            else if (metLocation == METLOC_SPECIAL_EGG)
                chosenStrIndex = 2;

            if (sub_813847C(&sMonSummaryScreen->currentMon) == FALSE)
                chosenStrIndex++;
        }
    }

    if (sMonSummaryScreen->isBadEgg)
        chosenStrIndex = 0;

    AddTextPrinterParameterized4(sMonSummaryScreen->unk3000[4], 2, 0, 3, 0, 0, sUnknown_8463FA4[0], TEXT_SPEED_FF, sUnknown_8463ED4[chosenStrIndex]);
}

static void sub_8137A90(void)
{
    AddTextPrinterParameterized3(sMonSummaryScreen->unk3000[4], 2,
                                 26, 7,
                                 sUnknown_8463FA4[0], TEXT_SPEED_FF,
                                 gUnknown_8419C4D);

    AddTextPrinterParameterized3(sMonSummaryScreen->unk3000[4], 2,
                                 26, 20,
                                 sUnknown_8463FA4[0], TEXT_SPEED_FF,
                                 gUnknown_8419C59);
}

static void sub_8137AF8(void)
{
    if (sUnknown_203B16D < 5)
    {
        if (sMonSummaryScreen->mode != PSS_MODE_SELECT_MOVE && sUnknown_203B16D == 4)
            return;

        AddTextPrinterParameterized3(sMonSummaryScreen->unk3000[4], 2,
                                     57, 1,
                                     sUnknown_8463FA4[0], TEXT_SPEED_FF,
                                     sMonSummaryScreen->summary.unk316C[sUnknown_203B16D]);

        AddTextPrinterParameterized3(sMonSummaryScreen->unk3000[4], 2,
                                     57, 15,
                                     sUnknown_8463FA4[0], TEXT_SPEED_FF,
                                     sMonSummaryScreen->summary.unk3188[sUnknown_203B16D]);

        AddTextPrinterParameterized4(sMonSummaryScreen->unk3000[4], 2,
                                     7, 42,
                                     0, 0,
                                     sUnknown_8463FA4[0], TEXT_SPEED_FF,
                                     gMoveDescriptionPointers[sMonSummaryScreen->unk325A[sUnknown_203B16D] - 1]);
    }
}

static void sub_8137BD0(void)
{
    switch (sMonSummaryScreen->curPageIndex)
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

    PutWindowTilemap(sMonSummaryScreen->unk3000[5]);
}

static void sub_8137C18(void)
{
    FillWindowPixelBuffer(sMonSummaryScreen->unk3000[5], 0);

    AddTextPrinterParameterized3(sMonSummaryScreen->unk3000[5], 2,
                                 66, 1, sUnknown_8463FA4[0], TEXT_SPEED_FF, sMonSummaryScreen->summary.unk31BC);

    AddTextPrinterParameterized3(sMonSummaryScreen->unk3000[5], 2,
                                 2, 15, sUnknown_8463FA4[0], TEXT_SPEED_FF,
                                 sMonSummaryScreen->summary.unk31CC);

}

static void sub_8137C90(void)
{
    u8 i;

    FillWindowPixelBuffer(sMonSummaryScreen->unk3000[5], 0);

    for (i = 0; i < 4; i++)
    {
        if (sMonSummaryScreen->unk325A[i] == MOVE_NONE)
            continue;

        BlitMoveInfoIcon(sMonSummaryScreen->unk3000[5], sMonSummaryScreen->unk3250[i] + 1, 3, MACRO_8137270(i));
    }

    if (sMonSummaryScreen->mode == PSS_MODE_SELECT_MOVE)
        BlitMoveInfoIcon(sMonSummaryScreen->unk3000[5], sMonSummaryScreen->unk3250[4] + 1, 3, MACRO_8137270(4));
}

static void sub_8137D28(u8 curPageIndex)
{
    switch (curPageIndex)
    {
    case PSS_PAGE_INFO:
        sub_8136DA4(gUnknown_8419C1D);
        if (!sMonSummaryScreen->isEgg)
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

static void sub_8137E28(void)
{
    PutWindowTilemap(sMonSummaryScreen->unk3000[0]);
    PutWindowTilemap(sMonSummaryScreen->unk3000[1]);
    PutWindowTilemap(sMonSummaryScreen->unk3000[2]);
}

static void sub_8137E64(u8 taskId)
{
    sub_813AF90();
    FreeAllSpritePalettes();

    if (IsCryPlayingOrClearCrySongs() == TRUE)
        StopCryAndClearCrySongs();

    sub_8138414(sMonSummaryScreen->curPageIndex);
    FreeAllWindowBuffers();
    DestroyTask(taskId);
    SetMainCallback2(sMonSummaryScreen->savedCallback);

    sLastViewedMonIndex = GetLastViewedMonIndex();

    FREE_AND_SET_NULL_IF_SET(sMonSummaryScreen);
    FREE_AND_SET_NULL_IF_SET(sUnknown_203B144);
}

static void sub_8137EE8(void)
{
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

static void sub_8137F00(void)
{
    u8 i;

    for (i = 0; i < 11; i++)
    {
        if (sUnknown_203B160->unk2C[i] < 240)
        {
            sUnknown_203B160->unk2C[i] += 60;
            sUnknown_203B160->sprites[i]->pos1.x = sUnknown_203B160->unk2C[i] + 60;
        }

        if (i >= 9)
            continue;

        if (sUnknown_203B15C->unk28[i] < 240)
        {
            sUnknown_203B15C->unk28[i] += 60;
            sUnknown_203B15C->sprites[i]->pos1.x = sUnknown_203B15C->unk28[i] + 60;
        }
    }
}

static void sub_8137F68(void)
{
    u8 i;

    for (i = 0; i < 11; i++)
    {
        if (sUnknown_203B160->unk2C[i] > 156 + (8 * i))
        {
            sUnknown_203B160->unk2C[i] -= 60;

            if (sUnknown_203B160->unk2C[i] < 156 + (8 * i))
                sUnknown_203B160->unk2C[i] = 156 + (8 * i);

            sUnknown_203B160->sprites[i]->pos1.x = sUnknown_203B160->unk2C[i];
        }

        if (i >= 9)
            continue;

        if (sUnknown_203B15C->unk28[i] > 172 + (8 * i))
        {
            sUnknown_203B15C->unk28[i] -= 60;

            if (sUnknown_203B15C->unk28[i] < 172 + (8 * i))
                sUnknown_203B15C->unk28[i] = 172 + (8 * i);

            sUnknown_203B15C->sprites[i]->pos1.x = sUnknown_203B15C->unk28[i];
        }
    }
}

static void sub_8137FF4(void)
{
    if (sMonSummaryScreen->unk324C < 240)
    {
        sMonSummaryScreen->unk324C += 60;
        if (sMonSummaryScreen->unk324C > 240)
            sMonSummaryScreen->unk324C = 240;

        if (sMonSummaryScreen->unk3238 == 0)
            SetGpuReg(REG_OFFSET_BG2HOFS, -sMonSummaryScreen->unk324C);
        else
            SetGpuReg(REG_OFFSET_BG1HOFS, -sMonSummaryScreen->unk324C);
    }
}

static void sub_813805C(void)
{
    if (sMonSummaryScreen->unk324C >= 60)
    {
        sMonSummaryScreen->unk324C -= 60;
        if (sMonSummaryScreen->unk324C < 0)
            sMonSummaryScreen->unk324C = 0;

        if (sMonSummaryScreen->unk3238 == 0)
            SetGpuReg(REG_OFFSET_BG1HOFS, -sMonSummaryScreen->unk324C);
        else
            SetGpuReg(REG_OFFSET_BG2HOFS, -sMonSummaryScreen->unk324C);

        if (sMonSummaryScreen->curPageIndex != PSS_PAGE_MOVES_INFO)
            SetGpuReg(REG_OFFSET_BG0HOFS, -sMonSummaryScreen->unk324C);
    }
}

static void sub_81380F0(void)
{
    if (sMonSummaryScreen->unk3224 == 1)
    {
        if (sMonSummaryScreen->curPageIndex != PSS_PAGE_MOVES_INFO)
            sub_8137FF4();
        else
            sub_813805C();
    }
    else
    {
        if (sMonSummaryScreen->curPageIndex != PSS_PAGE_MOVES)
            sub_813805C();
        else
            sub_8137FF4();
    }
}

static void sub_8138134(void)
{
    if (sMonSummaryScreen->curPageIndex == PSS_PAGE_SKILLS
        && sMonSummaryScreen->unk3224 == 0)
        sub_8137F68();

    if (sMonSummaryScreen->curPageIndex == PSS_PAGE_MOVES
        && sMonSummaryScreen->unk3224 == 1)
        sub_8137F00();
}

static void sub_813817C(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();

    if (sMonSummaryScreen->unk3244 == FALSE)
        return;

    sub_81380F0();
    sub_8138134();
}

static void sub_81381AC(void)
{
    SetVBlankCallback(NULL);
    SetHBlankCallback(NULL);
}

static void sub_81381C0(void)
{
    SetVBlankCallback(sub_813817C);
}

static void sub_81381D0(void)
{
    u8 i;

    InitWindows(sUnknown_8463F9C);

    for (i = 0; i < 3; i++)
        sMonSummaryScreen->unk3000[i] = AddWindow(&sUnknown_8463F0C[i]);

    for (i = 0; i < 4; i++)
        switch (sMonSummaryScreen->curPageIndex)
        {
        case PSS_PAGE_INFO:
            sMonSummaryScreen->unk3000[i + 3] = AddWindow(&sUnknown_8463F3C[i]);
            break;
        case PSS_PAGE_SKILLS:
            sMonSummaryScreen->unk3000[i + 3] = AddWindow(&sUnknown_8463F5C[i]);
            break;
        case PSS_PAGE_MOVES:
        case PSS_PAGE_MOVES_INFO:
            sMonSummaryScreen->unk3000[i + 3] = AddWindow(&sUnknown_8463F7C[i]);
            break;
        default:
            break;
        }
}

static void sub_8138280(u8 curPageIndex)
{
    u8 i;
    u32 bgPriority1 = GetGpuReg(REG_OFFSET_BG1CNT) & 3;
    u32 bgPriority2 = GetGpuReg(REG_OFFSET_BG2CNT) & 3;

    for (i = 0; i < 7; i++)
        sMonSummaryScreen->unk3000[i] = 0xff;

    if ((sMonSummaryScreen->unk3224 == 1 && sMonSummaryScreen->curPageIndex != PSS_PAGE_MOVES_INFO)
        || (sMonSummaryScreen->unk3224 == 0 && sMonSummaryScreen->curPageIndex == PSS_PAGE_MOVES))
    {
        if (bgPriority2 > bgPriority1)
            for (i = 0; i < 3; i++)
                sMonSummaryScreen->unk3000[i] = AddWindow(&sUnknown_8463F24[i]);
        else
            for (i = 0; i < 3; i++)
                sMonSummaryScreen->unk3000[i] = AddWindow(&sUnknown_8463F0C[i]);
    }
    else
    {
        if (bgPriority2 > bgPriority1)
            for (i = 0; i < 3; i++)
                sMonSummaryScreen->unk3000[i] = AddWindow(&sUnknown_8463F0C[i]);
        else
            for (i = 0; i < 3; i++)
                sMonSummaryScreen->unk3000[i] = AddWindow(&sUnknown_8463F24[i]);
    }

    for (i = 0; i < 4; i++)
        switch (curPageIndex)
        {
        case PSS_PAGE_INFO:
            sMonSummaryScreen->unk3000[i + 3] = AddWindow(&sUnknown_8463F3C[i]);
            break;
        case PSS_PAGE_SKILLS:
        default:
            sMonSummaryScreen->unk3000[i + 3] = AddWindow(&sUnknown_8463F5C[i]);
            break;
        case PSS_PAGE_MOVES:
        case PSS_PAGE_MOVES_INFO:
            sMonSummaryScreen->unk3000[i + 3] = AddWindow(&sUnknown_8463F7C[i]);
            break;
        }
}

static void sub_8138414(u8 curPageIndex)
{
    u8 i;

    for (i = 0; i < 7; i++)
        RemoveWindow(sMonSummaryScreen->unk3000[i]);

}

static void sub_8138440(void)
{
    switch (sMonSummaryScreen->curPageIndex)
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

static u8 sub_813847C(struct Pokemon * mon)
{
    u8 i;
    u8 multiplayerId;
    u32 trainerId = 0;

    if (sMonSummaryScreen->monList.mons == gEnemyParty)
    {
        multiplayerId = GetMultiplayerId() ^ 1;
        trainerId = gLinkPlayers[multiplayerId].trainerId & 0xffff;
        StringCopy(sMonSummaryScreen->summary.unk304C[0], gLinkPlayers[multiplayerId].name);
    }
    else
    {
        trainerId = GetPlayerTrainerId() & 0xffff;
        StringCopy(sMonSummaryScreen->summary.unk304C[0], gSaveBlock2Ptr->playerName);
    }

    if (trainerId != (GetMonData(mon, MON_DATA_OT_ID) & 0xffff))
        return FALSE;

    GetMonData(mon, MON_DATA_OT_NAME, sMonSummaryScreen->summary.unk304C[1]);

    if (!StringCompareWithoutExtCtrlCodes(sMonSummaryScreen->summary.unk304C[0], sMonSummaryScreen->summary.unk304C[1]))
        return TRUE;
    else
        return FALSE;

    return TRUE;
}

#define SUB_8138538_BASE_TILE_NUM (345)

static void sub_8138538(void)
{
    switch (sMonSummaryScreen->curPageIndex)
    {
    case PSS_PAGE_INFO:
        if (!sMonSummaryScreen->isEgg)
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
        if (sMonSummaryScreen->mode == PSS_MODE_SELECT_MOVE)
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

static void sub_8138A38(void)
{
    switch (sMonSummaryScreen->curPageIndex)
    {
    case PSS_PAGE_INFO:
        if (!sMonSummaryScreen->isEgg)
        {
            BlitMoveInfoIcon(sMonSummaryScreen->unk3000[3], sMonSummaryScreen->unk3220[0] + 1, 47, 35);

            if (sMonSummaryScreen->unk3220[0] != sMonSummaryScreen->unk3220[1])
                BlitMoveInfoIcon(sMonSummaryScreen->unk3000[3], sMonSummaryScreen->unk3220[1] + 1, 83, 35);
        }
        break;
    case PSS_PAGE_SKILLS:
        break;
    case PSS_PAGE_MOVES:
        break;
    case PSS_PAGE_MOVES_INFO:
        FillWindowPixelBuffer(sMonSummaryScreen->unk3000[6], 0);
        BlitMoveInfoIcon(sMonSummaryScreen->unk3000[6], sMonSummaryScreen->unk3220[0] + 1, 0, 3);

        if (sMonSummaryScreen->unk3220[0] != sMonSummaryScreen->unk3220[1])
            BlitMoveInfoIcon(sMonSummaryScreen->unk3000[6], sMonSummaryScreen->unk3220[1] + 1, 36, 3);

        PutWindowTilemap(sMonSummaryScreen->unk3000[6]);
        break;
    }
}

u8 GetLastViewedMonIndex(void)
{
    return sLastViewedMonIndex;
}

u8 GetMoveSlotToReplace(void)
{
    return sUnknown_203B16E;
}

void sub_8138B38(u8 mode)
{
    sMonSummaryScreen->mode = mode;
}

static bool32 sub_8138B4C(void)
{
    if (!IsUpdateLinkStateCBActive()
        && IsMultiBattle() == TRUE
        && gReceivedRemoteLinkPlayers == 1
        && (sLastViewedMonIndex >= 4 || sLastViewedMonIndex == 1))
        return TRUE;

    return FALSE;
}

static void sub_8138B8C(struct Pokemon * mon)
{
    if (!sMonSummaryScreen->isBoxMon)
    {
        struct Pokemon * partyMons = sMonSummaryScreen->monList.mons;
        *mon = partyMons[GetLastViewedMonIndex()];
    }
    else
    {
        struct BoxPokemon * boxMons = sMonSummaryScreen->monList.boxMons;
        BoxMonToMon(&boxMons[GetLastViewedMonIndex()], mon);
    }
}

static u16 sub_8138BEC(struct Pokemon * mon, u8 moveSlot)
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

static u16 sub_8138C24(struct Pokemon * mon, u8 moveSlot)
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

static u8 sub_8138C5C(u32 status)
{
    if (GetMonData(&sMonSummaryScreen->currentMon, MON_DATA_HP) == 0)
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

    if (CheckPartyPokerus(&sMonSummaryScreen->currentMon, 0))
        return AILMENT_PKRS;

    return AILMENT_NONE;
}

static void sub_8138CD8(u8 id)
{
    u8 i;

    switch (sMonSummaryScreen->unk3288)
    {
    case 0:
        if (MenuHelpers_CallLinkSomething() == TRUE || sub_800B270() == TRUE)
            return;

        if (JOY_NEW(DPAD_UP))
        {
            if (sUnknown_203B16D > 0)
            {
                sMonSummaryScreen->unk3288 = 2;
                PlaySE(SE_SELECT);

                for (i = sUnknown_203B16D; i > 0; i--)
                    if (sMonSummaryScreen->unk325A[i - 1] != 0)
                    {
                        PlaySE(SE_SELECT);
                        sUnknown_203B16D = i - 1;
                        return;
                    }
            }
            else
            {
                sUnknown_203B16D = 4;
                sMonSummaryScreen->unk3288 = 2;
                PlaySE(SE_SELECT);

                if (sMonSummaryScreen->unk3268 == TRUE)
                    for (i = sUnknown_203B16D; i > 0; i--)
                        if (sMonSummaryScreen->unk325A[i - 1] != 0)
                        {
                            PlaySE(SE_SELECT);
                            sUnknown_203B16D = i - 1;
                            return;
                        }
            }
        }
        else if (JOY_NEW(DPAD_DOWN))
        {
            if (sUnknown_203B16D < 4)
            {
                u8 v0 = 4;

                sMonSummaryScreen->unk3288 = 2;

                if (sMonSummaryScreen->unk3268 == TRUE)
                {
                    if (sUnknown_203B16D == 5 - 2)
                    {
                        sUnknown_203B16D = 0;
                        sMonSummaryScreen->unk3288 = 2;
                        PlaySE(SE_SELECT);
                        return;
                    }
                    v0--;
                }

                for (i = sUnknown_203B16D; i < v0; i++)
                    if (sMonSummaryScreen->unk325A[i + 1] != 0)
                    {
                        PlaySE(SE_SELECT);
                        sUnknown_203B16D = i + 1;
                        return;
                    }

                if (!sMonSummaryScreen->unk3268)
                {
                    PlaySE(SE_SELECT);
                    sUnknown_203B16D = i;
                }
                else
                {
                    PlaySE(SE_SELECT);
                    sUnknown_203B16D = 0;
                }

                return;
            }
            else if (sUnknown_203B16D == 4)
            {
                sUnknown_203B16D = 0;
                sMonSummaryScreen->unk3288 = 2;
                PlaySE(SE_SELECT);
                return;
            }
        }
        else if (JOY_NEW(A_BUTTON))
        {
            PlaySE(SE_SELECT);
            if (sUnknown_203B16D == 4)
            {
                sUnknown_203B16D = 0;
                sUnknown_203B16E = 0;
                sMonSummaryScreen->unk3268 = FALSE;
                sub_813A0E8(1);
                sMonSummaryScreen->unk3224 = 0;
                sub_8138414(sMonSummaryScreen->curPageIndex);
                sMonSummaryScreen->curPageIndex--;
                sMonSummaryScreen->unk3288 = 1;
                return;
            }

            if (sMonSummaryScreen->unk3268 != TRUE)
            {
                if (sMonSummaryScreen->isEnemyParty == FALSE
                    && gMain.inBattle == 0
                    && gReceivedRemoteLinkPlayers == 0)
                {
                    sUnknown_203B16E = sUnknown_203B16D;
                    sMonSummaryScreen->unk3268 = TRUE;
                }
                return;
            }
            else
            {
                sMonSummaryScreen->unk3268 = FALSE;

                if (sUnknown_203B16D == sUnknown_203B16E)
                    return;

                if (sMonSummaryScreen->isBoxMon == 0)
                    sub_81390B0();
                else
                    sub_81391EC();

                sub_8139328(&sMonSummaryScreen->currentMon);
                sub_81367B0();
                sMonSummaryScreen->unk3288 = 2;
                return;
            }
        }
        else if (JOY_NEW(B_BUTTON))
        {
            if (sMonSummaryScreen->unk3268 == TRUE)
            {
                sUnknown_203B16E = sUnknown_203B16D;
                sMonSummaryScreen->unk3268 = FALSE;
                return;
            }

            if (sUnknown_203B16D == 4)
            {
                sUnknown_203B16D = 0;
                sUnknown_203B16E = 0;
            }

            sub_813A0E8(1);
            sMonSummaryScreen->unk3224 = 0;
            sub_8138414(sMonSummaryScreen->curPageIndex);
            sMonSummaryScreen->curPageIndex--;
            sMonSummaryScreen->unk3288 = 1;
        }
        break;
    case 1:
        gTasks[sMonSummaryScreen->unk3018].func = sub_81351A0;
        sMonSummaryScreen->unk3288 = 0;
        break;
    case 2:
        sub_8136F4C();
        sub_81374E8();
        sub_8137BD0();
        sMonSummaryScreen->unk3288 = 3;
        break;
    case 3:
        if (MenuHelpers_CallLinkSomething() == TRUE || sub_800B270() == TRUE)
            return;

        CopyWindowToVram(sMonSummaryScreen->unk3000[3], 2);
        CopyWindowToVram(sMonSummaryScreen->unk3000[4], 2);
        CopyWindowToVram(sMonSummaryScreen->unk3000[5], 2);
        CopyWindowToVram(sMonSummaryScreen->unk3000[6], 2);
        CopyBgTilemapBufferToVram(0);
        CopyBgTilemapBufferToVram(3);
        sMonSummaryScreen->unk3288 = 0;
        break;
    default:
        break;
    }
}

static void sub_81390B0(void)
{
    struct Pokemon * partyMons;
    struct Pokemon * mon;

    u16 move1, move2;
    u8 pp1, pp2;
    u8 allMovesPPBonuses;
    u8 move1ppBonus, move2ppBonus;

    partyMons = sMonSummaryScreen->monList.mons;
    mon = &partyMons[GetLastViewedMonIndex()];

    move1 = GetMonData(mon, MON_DATA_MOVE1 + sUnknown_203B16D);
    move2 = GetMonData(mon, MON_DATA_MOVE1 + sUnknown_203B16E);

    pp1 = GetMonData(mon, MON_DATA_PP1 + sUnknown_203B16D);
    pp2 = GetMonData(mon, MON_DATA_PP1 + sUnknown_203B16E);

    allMovesPPBonuses = GetMonData(mon, MON_DATA_PP_BONUSES);

    move1ppBonus = (allMovesPPBonuses & gPPUpGetMask[sUnknown_203B16D]) >> (sUnknown_203B16D * 2);
    move2ppBonus = (allMovesPPBonuses & gPPUpGetMask[sUnknown_203B16E]) >> (sUnknown_203B16E * 2);

    allMovesPPBonuses &= ~gPPUpGetMask[sUnknown_203B16D];
    allMovesPPBonuses &= ~gPPUpGetMask[sUnknown_203B16E];
    allMovesPPBonuses |= (move1ppBonus << (sUnknown_203B16E * 2)) + (move2ppBonus << (sUnknown_203B16D * 2));

    SetMonData(mon, MON_DATA_MOVE1 + sUnknown_203B16D, (u8 *)&move2);
    SetMonData(mon, MON_DATA_MOVE1 + sUnknown_203B16E, (u8 *)&move1);
    SetMonData(mon, MON_DATA_PP1 + sUnknown_203B16D, &pp2);
    SetMonData(mon, MON_DATA_PP1 + sUnknown_203B16E, &pp1);
    SetMonData(mon, MON_DATA_PP_BONUSES, &allMovesPPBonuses);
}

static void sub_81391EC(void)
{
    struct BoxPokemon * boxMons;
    struct BoxPokemon * boxMon;

    u16 move1, move2;
    u8 pp1, pp2;
    u8 allMovesPPBonuses;
    u8 move1ppBonus, move2ppBonus;

    boxMons = sMonSummaryScreen->monList.boxMons;
    boxMon = &boxMons[GetLastViewedMonIndex()];

    move1 = GetBoxMonData(boxMon, MON_DATA_MOVE1 + sUnknown_203B16D);
    move2 = GetBoxMonData(boxMon, MON_DATA_MOVE1 + sUnknown_203B16E);

    pp1 = GetBoxMonData(boxMon, MON_DATA_PP1 + sUnknown_203B16D);
    pp2 = GetBoxMonData(boxMon, MON_DATA_PP1 + sUnknown_203B16E);

    allMovesPPBonuses = GetBoxMonData(boxMon, MON_DATA_PP_BONUSES);

    move1ppBonus = (allMovesPPBonuses & gPPUpGetMask[sUnknown_203B16D]) >> (sUnknown_203B16D * 2);
    move2ppBonus = (allMovesPPBonuses & gPPUpGetMask[sUnknown_203B16E]) >> (sUnknown_203B16E * 2);

    allMovesPPBonuses &= ~gPPUpGetMask[sUnknown_203B16D];
    allMovesPPBonuses &= ~gPPUpGetMask[sUnknown_203B16E];
    allMovesPPBonuses |= (move1ppBonus << (sUnknown_203B16E * 2)) + (move2ppBonus << (sUnknown_203B16D * 2));

    SetBoxMonData(boxMon, MON_DATA_MOVE1 + sUnknown_203B16D, (u8 *)&move2);
    SetBoxMonData(boxMon, MON_DATA_MOVE1 + sUnknown_203B16E, (u8 *)&move1);
    SetBoxMonData(boxMon, MON_DATA_PP1 + sUnknown_203B16D, &pp2);
    SetBoxMonData(boxMon, MON_DATA_PP1 + sUnknown_203B16E, &pp1);
    SetBoxMonData(boxMon, MON_DATA_PP_BONUSES, &allMovesPPBonuses);
}

static void sub_8139328(struct Pokemon * mon)
{
    if (!sMonSummaryScreen->isBoxMon)
    {
        struct Pokemon * partyMons;
        partyMons = sMonSummaryScreen->monList.mons;
        *mon = partyMons[GetLastViewedMonIndex()];
    }
    else
    {
        struct BoxPokemon * boxMons;
        boxMons = sMonSummaryScreen->monList.boxMons;
        BoxMonToMon(&boxMons[GetLastViewedMonIndex()], mon);
    }
}

static u8 sub_8139388(void)
{
    u16 move;

    move = sub_8138BEC(&sMonSummaryScreen->currentMon, sUnknown_203B16D);

    if (IsMoveHm(move) == TRUE && sMonSummaryScreen->mode != PSS_MODE_FORGET_MOVE)
        return FALSE;

    return TRUE;
}

static void sub_81393D4(u8 taskId)
{
    u8 i;

    switch (sMonSummaryScreen->unk3288)
    {
    case 0:
        BeginNormalPaletteFade(0xffffffff, 0, 16, 0, 0);
        sMonSummaryScreen->unk3288++;
        break;
    case 1:
        if (!gPaletteFade.active)
        {
            sub_813B784();
            sMonSummaryScreen->unk3288++;
        }
        break;
    case 2:
        if (JOY_NEW(DPAD_UP))
        {
            if (sUnknown_203B16D > 0)
            {
                sMonSummaryScreen->unk3288 = 3;
                PlaySE(SE_SELECT);
                for (i = sUnknown_203B16D; i > 0; i--)
                    if (sMonSummaryScreen->unk325A[i - 1] != 0)
                    {
                        PlaySE(SE_SELECT);
                        sUnknown_203B16D = i - 1;
                        return;
                    }
            }
            else
            {
                sUnknown_203B16D = 4;
                sMonSummaryScreen->unk3288 = 3;
                PlaySE(SE_SELECT);
                return;
            }
        }
        else if (JOY_NEW(DPAD_DOWN))
        {
            if (sUnknown_203B16D < 4)
            {
                u8 v0 = 4;

                sMonSummaryScreen->unk3288 = 3;

                if (sMonSummaryScreen->unk3268 == TRUE)
                    v0--;

                for (i = sUnknown_203B16D; i < v0; i++)
                    if (sMonSummaryScreen->unk325A[i + 1] != 0)
                    {
                        PlaySE(SE_SELECT);
                        sUnknown_203B16D = i + 1;
                        return;
                    }

                if (!sMonSummaryScreen->unk3268)
                {
                    PlaySE(SE_SELECT);
                    sUnknown_203B16D = i;
                }

                return;
            }
            else if (sUnknown_203B16D == 4)
            {
                sUnknown_203B16D = 0;
                sMonSummaryScreen->unk3288 = 3;
                PlaySE(SE_SELECT);
                return;
            }
        }
        else if (JOY_NEW(A_BUTTON))
        {
            if (sub_8139388() == TRUE || sUnknown_203B16D == 4)
            {
                PlaySE(SE_SELECT);
                sUnknown_203B16E = sUnknown_203B16D;
                gSpecialVar_0x8005 = sUnknown_203B16E;
                sMonSummaryScreen->unk3288 = 6;
            }
            else
            {
                PlaySE(SE_HAZURE);
                sMonSummaryScreen->unk3288 = 5;
            }
        }
        else if (JOY_NEW(B_BUTTON))
        {
            sUnknown_203B16E = 4;
            gSpecialVar_0x8005 = (u16)sUnknown_203B16E;
            sMonSummaryScreen->unk3288 = 6;
        }
        break;
    case 3:
        sub_8136F4C();
        sub_81374E8();
        sub_8137BD0();
        sMonSummaryScreen->unk3288 = 4;
        break;
    case 4:
        if (MenuHelpers_CallLinkSomething() == TRUE || sub_800B270() == TRUE)
            return;

        CopyWindowToVram(sMonSummaryScreen->unk3000[3], 2);
        CopyWindowToVram(sMonSummaryScreen->unk3000[4], 2);
        CopyWindowToVram(sMonSummaryScreen->unk3000[5], 2);
        CopyWindowToVram(sMonSummaryScreen->unk3000[6], 2);
        CopyBgTilemapBufferToVram(0);
        CopyBgTilemapBufferToVram(3);
        sMonSummaryScreen->unk3288 = 2;
        break;
    case 5:
        FillWindowPixelBuffer(sMonSummaryScreen->unk3000[4], 0);
        AddTextPrinterParameterized4(sMonSummaryScreen->unk3000[4], 2,
                                     7, 42,
                                     0, 0,
                                     sUnknown_8463FA4[0], TEXT_SPEED_FF,
                                     gUnknown_8419CB9);
        CopyWindowToVram(sMonSummaryScreen->unk3000[4], 2);
        CopyBgTilemapBufferToVram(0);
        CopyBgTilemapBufferToVram(3);
        sMonSummaryScreen->unk3288 = 2;
        break;
    case 6:
        BeginNormalPaletteFade(0xffffffff, 0, 0, 16, 0);
        sMonSummaryScreen->unk3288++;
        break;
    default:
        if (!gPaletteFade.active)
            sub_8137E64(taskId);
        break;
    }
}

static void sub_8139768(struct Sprite * sprite)
{
    if (sMonSummaryScreen->unk3020 >= 2)
        return;

    if (sUnknown_203B170->unk04++ >= 2)
    {
        u8 v0;

        switch (sUnknown_203B170->unk08)
        {
        case 0:
            sprite->pos1.y += sUnknown_8463FBE[sUnknown_203B170->unk00++];
            v0 = ARRAY_COUNT(sUnknown_8463FBE);
            break;
        case 1:
            sprite->pos1.y += sUnknown_8463FC1[sUnknown_203B170->unk00++];
            v0 = ARRAY_COUNT(sUnknown_8463FC1);
            break;
        case 2:
            sprite->pos1.y += sUnknown_8463FC6[sUnknown_203B170->unk00++];
            v0 = ARRAY_COUNT(sUnknown_8463FC6);
            break;
        case 3:
        default:
            sprite->pos1.y += sUnknown_8463FCD[sUnknown_203B170->unk00++];
            v0 = ARRAY_COUNT(sUnknown_8463FCD);
            break;
        }

        if (sUnknown_203B170->unk00 >= v0)
        {
            sUnknown_203B170->unk00 = 0;
            sMonSummaryScreen->unk3020++;
        }

        sUnknown_203B170->unk04 = 0;
    }
}

static void sub_8139868(struct Sprite * sprite)
{
    if (sMonSummaryScreen->unk3020 >= 2)
        return;

    switch (sUnknown_203B170->unk08)
    {
    case 0:
    default:
        if (sUnknown_203B170->unk04++ >= 120)
        {
            sprite->pos1.x += sUnknown_8463FD4[sUnknown_203B170->unk00];
            if (++sUnknown_203B170->unk00 >= ARRAY_COUNT(sUnknown_8463FD4))
            {
                sUnknown_203B170->unk00 = 0;
                sUnknown_203B170->unk04 = 0;
                sMonSummaryScreen->unk3020++;
            }
        }
        break;
    case 1:
        if (sUnknown_203B170->unk04++ >= 90)
        {
            sprite->pos1.x += sUnknown_8463FDF[sUnknown_203B170->unk00];
            if (++sUnknown_203B170->unk00 >= ARRAY_COUNT(sUnknown_8463FDF))
            {
                sUnknown_203B170->unk00 = 0;
                sUnknown_203B170->unk04 = 0;
                sMonSummaryScreen->unk3020++;
            }
        }
        break;
    case 2:
        if (sUnknown_203B170->unk04++ >= 60)
        {
            sprite->pos1.x += sUnknown_8463FEA[sUnknown_203B170->unk00];
            if (++sUnknown_203B170->unk00 >= ARRAY_COUNT(sUnknown_8463FEA))
            {
                sUnknown_203B170->unk00 = 0;
                sUnknown_203B170->unk04 = 0;
                sMonSummaryScreen->unk3020++;
            }
        }
        break;
    }
}

static void nullsub_96(struct Sprite * sprite)
{
}

static void sub_813995C(void)
{
    u16 spriteId;
    u16 species;
    u32 personality;
    u32 trainerId;

    sUnknown_203B170 = AllocZeroed(sizeof(struct Struct203B170));

    species = GetMonData(&sMonSummaryScreen->currentMon, MON_DATA_SPECIES2);
    personality = GetMonData(&sMonSummaryScreen->currentMon, MON_DATA_PERSONALITY);
    trainerId = GetMonData(&sMonSummaryScreen->currentMon, MON_DATA_OT_ID);

    if (sMonSummaryScreen->savedCallback == CB2_ReturnToTradeMenuFromSummary)
    {
        if (sMonSummaryScreen->isEnemyParty == TRUE)
            spriteId = CreateMonPicSprite(species, trainerId, personality, 1, 60, 65, 12, 0xffff, 1);
        else
            spriteId = CreateMonPicSprite_HandleDeoxys(species, trainerId, personality, 1, 60, 65, 12, 0xffff);
    }
    else
    {
        if (sub_804455C(3, sLastViewedMonIndex))
            spriteId = CreateMonPicSprite(species, trainerId, personality, 1, 60, 65, 12, 0xffff, 1);
        else
            spriteId = CreateMonPicSprite_HandleDeoxys(species, trainerId, personality, 1, 60, 65, 12, 0xffff);
    }

    FreeSpriteOamMatrix(&gSprites[spriteId]);

    if (!IsPokeSpriteNotFlipped(species))
        gSprites[spriteId].hFlip = TRUE;
    else
        gSprites[spriteId].hFlip = FALSE;

    sMonSummaryScreen->unk3010 = spriteId;

    sub_8139C44(1);
    sub_8139AAC(spriteId);
}

static void sub_8139AAC(u16 spriteId)
{
    u16 curHp;
    u16 maxHp;

    sMonSummaryScreen->unk3020 = 0;

    if (sMonSummaryScreen->isEgg == TRUE)
    {
        u8 friendship = GetMonData(&sMonSummaryScreen->currentMon, MON_DATA_FRIENDSHIP);

        if (friendship <= 5)
            sUnknown_203B170->unk08 = 2;
        else
        {
            if (friendship <= 10)
                sUnknown_203B170->unk08 = 1;
            else if (friendship <= 40)
                sUnknown_203B170->unk08 = 0;
        }

        gSprites[spriteId].callback = sub_8139868;
        return;
    }

    if (sMonSummaryScreen->unk326C != AILMENT_NONE && sMonSummaryScreen->unk326C != AILMENT_PKRS)
    {
        if (sMonSummaryScreen->unk326C == AILMENT_FNT)
            return;

        gSprites[spriteId].callback = nullsub_96;
        return;
    }

    curHp = GetMonData(&sMonSummaryScreen->currentMon, MON_DATA_HP);
    maxHp = GetMonData(&sMonSummaryScreen->currentMon, MON_DATA_MAX_HP);

    if (curHp == maxHp)
        sUnknown_203B170->unk08 = 3;
    else if (maxHp * 0.8 <= curHp)
        sUnknown_203B170->unk08 = 2;
    else if (maxHp * 0.6 <= curHp)
        sUnknown_203B170->unk08 = 1;
    else
        sUnknown_203B170->unk08 = 0;

    gSprites[spriteId].callback = sub_8139768;
}

static void sub_8139C44(u8 invisible)
{
    gSprites[sMonSummaryScreen->unk3010].invisible = invisible;
}

static void sub_8139C80(void)
{
    FreeAndDestroyMonPicSprite(sMonSummaryScreen->unk3010);
    FREE_AND_SET_NULL(sUnknown_203B170);
}

static void sub_8139CB0(void)
{
    u16 ballItemId;
    u8 ballId;

    if (!sMonSummaryScreen->isEgg)
        ballItemId = GetMonData(&sMonSummaryScreen->currentMon, MON_DATA_POKEBALL);
    else
        ballItemId = 0;

    ballId = ItemIdToBallId(ballItemId);
    LoadBallGfx(ballId);

    sMonSummaryScreen->unk300C = CreateSprite(&gBallSpriteTemplates[ballId], 106, 88, 0);
    gSprites[sMonSummaryScreen->unk300C].callback = SpriteCallbackDummy;
    gSprites[sMonSummaryScreen->unk300C].oam.priority = 0;

    sub_8139D54(1);
}

static void sub_8139D54(u8 invisible)
{
    gSprites[sMonSummaryScreen->unk300C].invisible = invisible;
}

static void sub_8139D90(void)
{
    DestroySpriteAndFreeResources2(&gSprites[sMonSummaryScreen->unk300C]);
}

static void sub_8139DBC(void)
{
    u16 species;
    u32 personality;

    species = GetMonData(&sMonSummaryScreen->currentMon, MON_DATA_SPECIES2);
    personality = GetMonData(&sMonSummaryScreen->currentMon, MON_DATA_PERSONALITY);

    SafeLoadMonIconPalette(species);

    if (sMonSummaryScreen->savedCallback == CB2_ReturnToTradeMenuFromSummary)
    {
        if (sMonSummaryScreen->isEnemyParty == TRUE)
            sMonSummaryScreen->unk3014 = CreateMonIcon(species, SpriteCallbackDummy, 24, 32, 0, personality, 0);
        else
            sMonSummaryScreen->unk3014 = CreateMonIcon(species, SpriteCallbackDummy, 24, 32, 0, personality, 1);
    }
    else
    {
        if (sub_804455C(3, sLastViewedMonIndex))
            sMonSummaryScreen->unk3014 = CreateMonIcon(species, SpriteCallbackDummy, 24, 32, 0, personality, 0);
        else
            sMonSummaryScreen->unk3014 = CreateMonIcon(species, SpriteCallbackDummy, 24, 32, 0, personality, 1);
    }

    if (!IsPokeSpriteNotFlipped(species))
        gSprites[sMonSummaryScreen->unk3014].hFlip = TRUE;
    else
        gSprites[sMonSummaryScreen->unk3014].hFlip = FALSE;

    sub_8139EE4(1);
}

static void sub_8139EE4(u8 invisible)
{
    gSprites[sMonSummaryScreen->unk3014].invisible = invisible;
}

static void sub_8139F20(void)
{
    u16 species;
    species = GetMonData(&sMonSummaryScreen->currentMon, MON_DATA_SPECIES2);
    SafeFreeMonIconPalette(species);
    DestroyMonIcon(&gSprites[sMonSummaryScreen->unk3014]);
}

static void sub_8139F64(u16 tileTag, u16 palTag)
{
    u8 i;
    u8 spriteId;
    void * gfxBufferPtrs[2];
    gfxBufferPtrs[0] = AllocZeroed(0x20 * 64);
    gfxBufferPtrs[1] = AllocZeroed(0x20 * 64);

    sUnknown_203B148[0] = AllocZeroed(sizeof(struct Struct203B148));
    sUnknown_203B148[1] = AllocZeroed(sizeof(struct Struct203B148));
    sUnknown_203B148[2] = AllocZeroed(sizeof(struct Struct203B148));
    sUnknown_203B148[3] = AllocZeroed(sizeof(struct Struct203B148));

    LZ77UnCompWram(sUnknown_8463740, gfxBufferPtrs[0]);
    LZ77UnCompWram(sUnknown_846386C, gfxBufferPtrs[1]);

    for (i = 0; i < 4; i++)
    {
        struct SpriteSheet sheet = {
            .data = gfxBufferPtrs[i % 2],
            .size = 0x20 * 64,
            .tag = tileTag + i
        };

        struct SpritePalette palette = {.data = sUnknown_8463720, .tag = palTag};
        struct SpriteTemplate template = {
            .tileTag = tileTag + i,
            .paletteTag = palTag,
            .oam = &sUnknown_846398C,
            .anims = sUnknown_84639A4,
            .images = NULL,
            .affineAnims = gDummySpriteAffineAnimTable,
            .callback = sub_813A124,
        };

        LoadSpriteSheet(&sheet);
        LoadSpritePalette(&palette);

        spriteId = CreateSprite(&template, 64 * (i % 2) + 152, sUnknown_203B16D * 28 + 34, i % 2);
        sUnknown_203B148[i]->sprite = &gSprites[spriteId];
        sUnknown_203B148[i]->unk04 = i;
        sUnknown_203B148[i]->unk06 = tileTag + i;
        sUnknown_203B148[i]->unk08 = palTag;
        sUnknown_203B148[i]->sprite->subpriority = i;

        if (i > 1)
            StartSpriteAnim(sUnknown_203B148[i]->sprite, 1);
    }

    sub_813A0E8(1);

    FREE_AND_SET_NULL_IF_SET(gfxBufferPtrs[0]);
    FREE_AND_SET_NULL_IF_SET(gfxBufferPtrs[1]);
}

static void sub_813A0E8(u8 invisible)
{
    u8 i;
    for (i = 0; i < 4; i++)
        sUnknown_203B148[i]->sprite->invisible = invisible;
}

static void sub_813A124(struct Sprite * sprite)
{
    u8 i;

    for (i = 0; i < 4; i++)
    {
        if (sMonSummaryScreen->unk3268 == TRUE && i > 1)
            continue;

        sUnknown_203B148[i]->sprite->pos1.y = sUnknown_203B16D * 28 + 34;
    }

    if (sMonSummaryScreen->unk3268 != TRUE)
    {
        if (sMonSummaryScreen->curPageIndex == PSS_PAGE_MOVES_INFO)
        {
            sUnknown_203B148[0]->sprite->invisible = FALSE;
            sUnknown_203B148[1]->sprite->invisible = FALSE;
        }
        return;
    }

    for (i = 0; i < 2; i++)
    {
        sprite = sUnknown_203B148[i]->sprite;
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

static void sub_813A21C(void)
{
    u8 i;

    for (i = 0; i < 4; i++)
    {
        if (sUnknown_203B148[i]->sprite != NULL)
            DestroySpriteAndFreeResources(sUnknown_203B148[i]->sprite);

        FREE_AND_SET_NULL_IF_SET(sUnknown_203B148[i]);
    }
}

static void sub_813A254(u16 tileTag, u16 palTag)
{
    u16 spriteId;
    void * gfxBufferPtr;

    sUnknown_203B158 = AllocZeroed(sizeof(struct Struct203B158));
    gfxBufferPtr = AllocZeroed(0x20 * 32);

    LZ77UnCompWram(gUnknown_8E9BF48, gfxBufferPtr);

    if (sUnknown_203B158 != NULL)
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
            .oam = &sUnknown_84639AC,
            .anims = sUnknown_84639F4,
            .images = NULL,
            .affineAnims = gDummySpriteAffineAnimTable,
            .callback = SpriteCallbackDummy,
        };

        LoadSpriteSheet(&sheet);
        LoadSpritePalette(&palette);

        spriteId = CreateSprite(&template, 0, 0, 0);
        sUnknown_203B158->sprite = &gSprites[spriteId];
        sUnknown_203B158->unk04 = tileTag;
        sUnknown_203B158->unk06 = palTag;
    }

    sub_813A3B8(1);
    sub_813A35C();
    FREE_AND_SET_NULL_IF_SET(gfxBufferPtr);
}

static void sub_813A334(void)
{
    if (sUnknown_203B158->sprite != NULL)
        DestroySpriteAndFreeResources(sUnknown_203B158->sprite);

    FREE_AND_SET_NULL_IF_SET(sUnknown_203B158);
}

static void sub_813A35C(void)
{
    sMonSummaryScreen->unk326C = sub_8138C5C(GetMonData(&sMonSummaryScreen->currentMon, MON_DATA_STATUS));

    if (sMonSummaryScreen->unk326C == AILMENT_NONE)
    {
        sub_813A3B8(1);
        return;
    }

    StartSpriteAnim(sUnknown_203B158->sprite, sMonSummaryScreen->unk326C - 1);
    sub_813A3B8(0);
}

static void sub_813A3B8(u8 invisible)
{
    if (sMonSummaryScreen->unk326C == AILMENT_NONE || sMonSummaryScreen->isEgg)
        sUnknown_203B158->sprite->invisible = TRUE;
    else
        sUnknown_203B158->sprite->invisible = invisible;

    if (sMonSummaryScreen->curPageIndex == PSS_PAGE_MOVES_INFO)
    {
        if (sUnknown_203B158->sprite->pos1.y != 45)
        {
            sUnknown_203B158->sprite->pos1.x = 16;
            sUnknown_203B158->sprite->pos1.y = 45;
            return;
        }
    }
    else if (sUnknown_203B158->sprite->pos1.y != 38)
    {
        sUnknown_203B158->sprite->pos1.x = 16;
        sUnknown_203B158->sprite->pos1.y = 38;
        return;
    }
}

static void sub_813A45C(u16 tileTag, u16 palTag)
{
    u8 i;
    u8 spriteId;
    void * gfxBufferPtr;
    u32 curHp;
    u32 maxHp;
    u8 hpBarPalTagOffset = 0;

    sUnknown_203B15C = AllocZeroed(sizeof(struct Struct203B15C));
    gfxBufferPtr = AllocZeroed(0x20 * 12);
    LZ77UnCompWram(gUnknown_8E9B4B8, gfxBufferPtr);

    curHp = GetMonData(&sMonSummaryScreen->currentMon, MON_DATA_HP);
    maxHp = GetMonData(&sMonSummaryScreen->currentMon, MON_DATA_MAX_HP);

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

        struct SpritePalette palette1 = {.data = sUnknown_8463FFC[0], .tag = palTag};
        struct SpritePalette palette2 = {.data = sUnknown_8463FFC[1], .tag = palTag + 1};
        struct SpritePalette palette3 = {.data = sUnknown_8463FFC[2], .tag = palTag + 2};

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
            .oam = &sUnknown_8463A14,
            .anims = sUnknown_8463A7C,
            .images = NULL,
            .affineAnims = gDummySpriteAffineAnimTable,
            .callback = SpriteCallbackDummy,
        };

        sUnknown_203B15C->unk28[i] = i * 8 + 172;
        spriteId = CreateSprite(&template, sUnknown_203B15C->unk28[i], 36, 0);
        sUnknown_203B15C->sprites[i] = &gSprites[spriteId];
        sUnknown_203B15C->sprites[i]->invisible = FALSE;
        sUnknown_203B15C->sprites[i]->oam.priority = 2;
        sUnknown_203B15C->unk3C = tileTag;
        sUnknown_203B15C->unk3E = palTag;
        StartSpriteAnim(sUnknown_203B15C->sprites[i], 8);
    }

    sub_813A620();
    sub_813A838(1);

    FREE_AND_SET_NULL_IF_SET(gfxBufferPtr);
}

static void sub_813A620(void)
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

    if (sMonSummaryScreen->isEgg)
        return;

    curHp = GetMonData(&sMonSummaryScreen->currentMon, MON_DATA_HP);
    maxHp = GetMonData(&sMonSummaryScreen->currentMon, MON_DATA_MAX_HP);

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
        sUnknown_203B15C->sprites[i]->oam.paletteNum = IndexOfSpritePaletteTag(TAG_PSS_UNK_78) + hpBarPalOffset;

    if (curHp == maxHp)
        for (i = two; i < 8; i++)
            StartSpriteAnim(sUnknown_203B15C->sprites[i], 8);

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
            StartSpriteAnim(sUnknown_203B15C->sprites[i], 8);

        animNum = (v1 * 6) / v0;
        StartSpriteAnim(sUnknown_203B15C->sprites[numWholeHpBarTiles], animNum);

        for (i = numWholeHpBarTiles + 1; i < 8; i++)
            StartSpriteAnim(sUnknown_203B15C->sprites[i], 0);
    }

    StartSpriteAnim(sUnknown_203B15C->sprites[0], 9);
    StartSpriteAnim(sUnknown_203B15C->sprites[1], 10);
    StartSpriteAnim(sUnknown_203B15C->sprites[8], 11);
}

static void sub_813A800(void)
{
    u8 i;

    for (i = 0; i < 9; i++)
        if (sUnknown_203B15C->sprites[i] != NULL)
            DestroySpriteAndFreeResources(sUnknown_203B15C->sprites[i]);

    FREE_AND_SET_NULL_IF_SET(sUnknown_203B15C);
}

static void sub_813A838(u8 invisible)
{
    u8 i;

    for (i = 0; i < 9; i++)
        sUnknown_203B15C->sprites[i]->invisible = invisible;
}

static void sub_813A874(u16 tileTag, u16 palTag)
{
    u8 i;
    u8 spriteId;
    void * gfxBufferPtr;

    sUnknown_203B160 = AllocZeroed(sizeof(struct Struct203B160));
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
            .oam = &sUnknown_8463A14,
            .anims = sUnknown_8463A7C,
            .images = NULL,
            .affineAnims = gDummySpriteAffineAnimTable,
            .callback = SpriteCallbackDummy,
        };

        sUnknown_203B160->unk2C[i] = i * 8 + 156;
        spriteId = CreateSprite(&template, sUnknown_203B160->unk2C[i], 132, 0);
        sUnknown_203B160->sprites[i] = &gSprites[spriteId];
        sUnknown_203B160->sprites[i]->oam.priority = 2;
        sUnknown_203B160->unk42 = tileTag;
        sUnknown_203B160->unk44 = palTag;
    }

    sub_813A994();
    sub_813AB70(1);

    FREE_AND_SET_NULL_IF_SET(gfxBufferPtr);
}

static void sub_813A994(void)
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

    if (sMonSummaryScreen->isEgg)
        return;

    exp = GetMonData(&sMonSummaryScreen->currentMon, MON_DATA_EXP);
    level = GetMonData(&sMonSummaryScreen->currentMon, MON_DATA_LEVEL);
    species = GetMonData(&sMonSummaryScreen->currentMon, MON_DATA_SPECIES);

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
            StartSpriteAnim(sUnknown_203B160->sprites[i], 8);

        if (numWholeExpBarTiles >= 10)
        {
            if (totalExpToNextLevel == curExpToNextLevel)
                return;
            else
                StartSpriteAnim(sUnknown_203B160->sprites[9], 7);
        }

        animNum = (v1 * 8) / v0;
        StartSpriteAnim(sUnknown_203B160->sprites[numWholeExpBarTiles], animNum);

        for (i = numWholeExpBarTiles + 1; i < 10; i++)
            StartSpriteAnim(sUnknown_203B160->sprites[i], 0);
    }
    else
        for (i = two; i < 10; i++)
            StartSpriteAnim(sUnknown_203B160->sprites[i], 0);

    StartSpriteAnim(sUnknown_203B160->sprites[0], 9);
    StartSpriteAnim(sUnknown_203B160->sprites[1], 10);
    StartSpriteAnim(sUnknown_203B160->sprites[10], 11);
}

static void sub_813AB38(void)
{
    u8 i;

    for (i = 0; i < 11; i++)
        if (sUnknown_203B160->sprites[i] != NULL)
            DestroySpriteAndFreeResources(sUnknown_203B160->sprites[i]);

    FREE_AND_SET_NULL_IF_SET(sUnknown_203B160);
}

static void sub_813AB70(u8 invisible)
{
    u8 i;

    for (i = 0; i < 11; i++)
        sUnknown_203B160->sprites[i]->invisible = invisible;
}

static void sub_813ABAC(u16 tileTag, u16 palTag)
{
    u16 spriteId;
    void * gfxBufferPtr;

    sUnknown_203B164 = AllocZeroed(sizeof(struct Struct203B164));
    gfxBufferPtr = AllocZeroed(0x20 * 1);

    LZ77UnCompWram(sUnknown_8463B20, gfxBufferPtr);

    if (sUnknown_203B164 != NULL)
    {
        struct SpriteSheet sheet = {
            .data = gfxBufferPtr,
            .size = 0x20 * 1,
            .tag = tileTag
        };

        struct SpritePalette palette = {.data = sUnknown_8463B00, .tag = palTag};
        struct SpriteTemplate template = {
            .tileTag = tileTag,
            .paletteTag = palTag,
            .oam = &sUnknown_8463AEC,
            .anims = sUnknown_8463AFC,
            .images = NULL,
            .affineAnims = gDummySpriteAffineAnimTable,
            .callback = SpriteCallbackDummy,
        };

        LoadSpriteSheet(&sheet);
        LoadSpritePalette(&palette);

        spriteId = CreateSprite(&template, 114, 92, 0);
        sUnknown_203B164->sprite = &gSprites[spriteId];
        sUnknown_203B164->unk04 = tileTag;
        sUnknown_203B164->unk06 = palTag;
    }

    sub_813ACF8(1);
    sub_813ACB4();

    FREE_AND_SET_NULL_IF_SET(gfxBufferPtr);
}

static void sub_813AC8C(void)
{
    if (sUnknown_203B164->sprite != NULL)
        DestroySpriteAndFreeResources(sUnknown_203B164->sprite);

    FREE_AND_SET_NULL_IF_SET(sUnknown_203B164);
}

static void sub_813ACB4(void)
{
    if (!CheckPartyPokerus(&sMonSummaryScreen->currentMon, 0)
        && CheckPartyHasHadPokerus(&sMonSummaryScreen->currentMon, 0))
        sub_813ACF8(0);
    else
        sub_813ACF8(1);
}

static void sub_813ACF8(u8 invisible)
{
    if (!CheckPartyPokerus(&sMonSummaryScreen->currentMon, 0)
        && CheckPartyHasHadPokerus(&sMonSummaryScreen->currentMon, 0))
    {
        sUnknown_203B164->sprite->invisible = invisible;
        return;
    }
    else
        sUnknown_203B164->sprite->invisible = TRUE;

    if (sMonSummaryScreen->curPageIndex == PSS_PAGE_MOVES_INFO)
    {
        sUnknown_203B164->sprite->invisible = TRUE;
        sUnknown_203B164->sprite->pos1.x = 16;
        sUnknown_203B164->sprite->pos1.y = 44;
    }
    else
    {
        sUnknown_203B164->sprite->pos1.x = 114;
        sUnknown_203B164->sprite->pos1.y = 92;
    }
}

static void sub_813ADA8(u16 tileTag, u16 palTag)
{
    u16 spriteId;
    void * gfxBufferPtr;

    sUnknown_203B168 = AllocZeroed(sizeof(struct Struct203B168));
    gfxBufferPtr = AllocZeroed(0x20 * 2);

    LZ77UnCompWram(sUnknown_8463B64, gfxBufferPtr);

    if (sUnknown_203B168 != NULL)
    {
        struct SpriteSheet sheet = {
            .data = gfxBufferPtr,
            .size = 0x20 * 2,
            .tag = tileTag
        };

        struct SpritePalette palette = {.data = sUnknown_8463B44, .tag = palTag};
        struct SpriteTemplate template = {
            .tileTag = tileTag,
            .paletteTag = palTag,
            .oam = &sUnknown_8463B30,
            .anims = sUnknown_8463B40,
            .images = NULL,
            .affineAnims = gDummySpriteAffineAnimTable,
            .callback = SpriteCallbackDummy,
        };

        LoadSpriteSheet(&sheet);
        LoadSpritePalette(&palette);
        spriteId = CreateSprite(&template, 106, 40, 0);
        sUnknown_203B168->sprite = &gSprites[spriteId];
        sUnknown_203B168->unk04 = tileTag;
        sUnknown_203B168->unk06 = palTag;
    }

    sub_813AEB0(1);
    sub_813AF50();

    FREE_AND_SET_NULL_IF_SET(gfxBufferPtr);
}

static void sub_813AE88(void)
{
    if (sUnknown_203B168->sprite != NULL)
        DestroySpriteAndFreeResources(sUnknown_203B168->sprite);

    FREE_AND_SET_NULL_IF_SET(sUnknown_203B168);
}

static void sub_813AEB0(u8 invisible)
{
    if (IsMonShiny(&sMonSummaryScreen->currentMon) == TRUE
        && !sMonSummaryScreen->isEgg)
        sUnknown_203B168->sprite->invisible = invisible;
    else
        sUnknown_203B168->sprite->invisible = TRUE;

    if (sMonSummaryScreen->curPageIndex == PSS_PAGE_MOVES_INFO)
    {
        sUnknown_203B168->sprite->pos1.x = 8;
        sUnknown_203B168->sprite->pos1.y = 24;
    }
    else
    {
        sUnknown_203B168->sprite->pos1.x = 106;
        sUnknown_203B168->sprite->pos1.y = 40;
    }
}

static void sub_813AF50(void)
{
    if (IsMonShiny(&sMonSummaryScreen->currentMon) == TRUE && !sMonSummaryScreen->isEgg)
        sub_813AEB0(0);
    else
        sub_813AEB0(1);
}

static void sub_813AF90(void)
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

static void sub_813AFC4(void)
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

static void sub_813AFFC(void)
{
    u32 markings = GetMonData(&sMonSummaryScreen->currentMon, MON_DATA_MARKINGS);

    DestroySpriteAndFreeResources(sMonSummaryScreen->markingSprite);
    sMonSummaryScreen->markingSprite = CreateMonMarkingSprite_SelectCombo(TAG_PSS_UNK_8C, TAG_PSS_UNK_8C, sUnknown_84636E0);

    if (sMonSummaryScreen->markingSprite != NULL)
    {
        StartSpriteAnim(sMonSummaryScreen->markingSprite, markings);
        sMonSummaryScreen->markingSprite->pos1.x = 20;
        sMonSummaryScreen->markingSprite->pos1.y = 91;
    }

    sub_813B084(1);
}

static void sub_813B068(void)
{
    DestroySpriteAndFreeResources(sMonSummaryScreen->markingSprite);
}

static void sub_813B084(u8 invisible)
{
    u32 markings = GetMonData(&sMonSummaryScreen->currentMon, MON_DATA_MARKINGS);

    if (markings == 0)
        sMonSummaryScreen->markingSprite->invisible = TRUE;
    else
        sMonSummaryScreen->markingSprite->invisible = invisible;
}

static void sub_813B0E4(void)
{
    u32 markings = GetMonData(&sMonSummaryScreen->currentMon, MON_DATA_MARKINGS);

    StartSpriteAnim(sMonSummaryScreen->markingSprite, markings);
    sub_813B084(0);
}

static void sub_813B120(u8 taskId, s8 a1)
{
    s8 v0 = -1;

    if (sMonSummaryScreen->isBoxMon == TRUE)
    {
        if (sMonSummaryScreen->curPageIndex != 0)
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

        v0 = SeekToNextMonInBox(sMonSummaryScreen->monList.boxMons, GetLastViewedMonIndex(), sMonSummaryScreen->lastIndex, (u8)a1);
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

    sLastViewedMonIndex = v0;
    CreateTask(sub_813B3F0, 0);
    sMonSummaryScreen->unk328C = 0;
}

static s8 sub_813B20C(s8 a0)
{
    struct Pokemon * partyMons = sMonSummaryScreen->monList.mons;
    s8 v1 = 0;

    if (sMonSummaryScreen->curPageIndex == 0)
    {
        if (a0 == -1 && sLastViewedMonIndex == 0)
            return -1;
        else if (a0 == 1 && sLastViewedMonIndex >= sMonSummaryScreen->lastIndex)
            return -1;
        else
            return sLastViewedMonIndex + a0;
    }

    while (TRUE)
    {
        v1 += a0;
        if (0 > sLastViewedMonIndex + v1 || sLastViewedMonIndex + v1 > sMonSummaryScreen->lastIndex)
            return -1;

        if (GetMonData(&partyMons[sLastViewedMonIndex + v1], MON_DATA_IS_EGG) == 0)
            return sLastViewedMonIndex + v1;
    }

    return -1;
}

static u8 sub_813B2C8(struct Pokemon * partyMons)
{
    if (GetMonData(partyMons, MON_DATA_SPECIES) != 0 && (sMonSummaryScreen->curPageIndex != 0 || GetMonData(partyMons, MON_DATA_IS_EGG) == 0))
        return TRUE;

    return FALSE;
}

static s8 sub_813B304(u8 a0)
{
    while (TRUE)
    {
        a0++;

        if (a0 == 6)
            return -1;
        if (sub_813B2C8(&gPlayerParty[sUnknown_8463FB8[a0]]) == TRUE)
            break;
    }

    return (s8)sUnknown_8463FB8[a0];
}

static s8 sub_813B348(u8 a0)
{
    while (1)
    {
        if (a0 == 0)
            return -1;

        a0--;

        if (sub_813B2C8(&gPlayerParty[sUnknown_8463FB8[a0]]) == TRUE)
            break;
    }

    return (s8)(sUnknown_8463FB8[a0]);
}

static s8 sub_813B38C(s8 a0)
{
    u8 v0 = 0;
    u8 i;

    for (i = 0; i < PARTY_SIZE; i++)
        if (sUnknown_8463FB8[i] == GetLastViewedMonIndex())
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

static void sub_813B3F0(u8 id)
{
    switch (sMonSummaryScreen->unk328C)
    {
    case 0:
        StopCryAndClearCrySongs();
        sUnknown_203B16D = 0;
        sUnknown_203B16E = 0;
        sMonSummaryScreen->unk328C++;
        break;
    case 1:
        sub_8139C80();
        sub_8139F20();
        sub_8139D90();
        sMonSummaryScreen->unk328C++;
        break;
    case 2:
        sub_8138B8C(&sMonSummaryScreen->currentMon);

        sMonSummaryScreen->isEgg = GetMonData(&sMonSummaryScreen->currentMon, MON_DATA_IS_EGG);
        sMonSummaryScreen->isBadEgg = GetMonData(&sMonSummaryScreen->currentMon, MON_DATA_SANITY_IS_BAD_EGG);

        if (sMonSummaryScreen->isBadEgg == TRUE)
            sMonSummaryScreen->isEgg = TRUE;

        sMonSummaryScreen->unk328C++;
        break;
    case 3:
        FillBgTilemapBufferRect_Palette0(0, 0, 0, 0, 30, 20);

        if (IsMonShiny(&sMonSummaryScreen->currentMon) == TRUE && !sMonSummaryScreen->isEgg)
        {
            LoadPalette(&gUnknown_8E9B310[16 * 6], 0, 0x20);
            LoadPalette(&gUnknown_8E9B310[16 * 5], 0x10, 0x20);
        }
        else
        {
            LoadPalette(&gUnknown_8E9B310[16 * 0], 0, 0x20);
            LoadPalette(&gUnknown_8E9B310[16 * 1], 0x10, 0x20);
        }

        sMonSummaryScreen->unk328C++;
        break;
    case 4:
        if (sMonSummaryScreen->curPageIndex == PSS_PAGE_INFO)
        {
            if (sMonSummaryScreen->isEgg)
            {
                CopyToBgTilemapBuffer(sMonSummaryScreen->unk323C, gUnknown_8E9BBCC, 0, 0);
                CopyToBgTilemapBuffer(sMonSummaryScreen->unk3240, gUnknown_8E9B750, 0, 0);
            }
            else
            {
                CopyToBgTilemapBuffer(sMonSummaryScreen->unk323C, gUnknown_8E9B598, 0, 0);
                CopyToBgTilemapBuffer(sMonSummaryScreen->unk3240, gUnknown_8E9B750, 0, 0);
            }
        }
        sMonSummaryScreen->unk328C++;
        break;
    case 5:
        sub_81360D4();
        sMonSummaryScreen->unk328C++;
        break;
    case 6:
        if (!sMonSummaryScreen->isEgg)
            sub_8136350();

        sMonSummaryScreen->unk328C++;
        break;
    case 7:
        if (!sMonSummaryScreen->isEgg)
            sub_81367B0();

        sMonSummaryScreen->unk328C++;
        break;
    case 8:
        sub_8136F4C();
        sub_81374E8();
        sub_8137BD0();
        sMonSummaryScreen->unk328C++;
        break;
    case 9:
        sub_8138A38();
        sub_8138538();
        sub_8137D28(sMonSummaryScreen->curPageIndex);
        sMonSummaryScreen->unk328C++;
        break;
    case 10:
        CopyWindowToVram(sMonSummaryScreen->unk3000[0], 2);
        CopyWindowToVram(sMonSummaryScreen->unk3000[1], 2);
        CopyWindowToVram(sMonSummaryScreen->unk3000[2], 2);
        CopyWindowToVram(sMonSummaryScreen->unk3000[6], 2);
        CopyWindowToVram(sMonSummaryScreen->unk3000[3], 2);
        CopyWindowToVram(sMonSummaryScreen->unk3000[4], 2);
        CopyWindowToVram(sMonSummaryScreen->unk3000[5], 2);
        CopyBgTilemapBufferToVram(0);
        CopyBgTilemapBufferToVram(2);
        CopyBgTilemapBufferToVram(3);
        sMonSummaryScreen->unk328C++;
        break;
    case 11:
        if (!Overworld_LinkRecvQueueLengthMoreThan2() && !sub_800B270())
        {
            sub_813AFC4();
            sub_813B784();
            sMonSummaryScreen->unk328C++;
        }
        break;
    default:
        sMonSummaryScreen->unk328C = 0;
        DestroyTask(id);
        break;
    }
}

static void sub_813B750(u8 curPageIndex)
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

static void sub_813B784(void)
{
    if (!GetMonData(&sMonSummaryScreen->currentMon, MON_DATA_IS_EGG))
    {
        if (ShouldPlayNormalPokeCry(&sMonSummaryScreen->currentMon) == TRUE)
            PlayCry3(GetMonData(&sMonSummaryScreen->currentMon, MON_DATA_SPECIES2), 0, 0);
        else
            PlayCry3(GetMonData(&sMonSummaryScreen->currentMon, MON_DATA_SPECIES2), 0, 11);
    }
}

static bool32 sub_813B7E0(u8 nature)
{
    if (nature == NATURE_BOLD || nature == NATURE_GENTLE)
        return TRUE;

    return FALSE;
}

static bool32 sub_813B7F8(void)
{
    u8 version = GetMonData(&sMonSummaryScreen->currentMon, MON_DATA_MET_GAME);

    if (version == VERSION_LEAF_GREEN
        || version == VERSION_FIRE_RED
        || version == VERSION_RUBY
        || version == VERSION_SAPPHIRE
        || version == VERSION_EMERALD)
        return TRUE;

    return FALSE;
}

static bool32 sub_813B838(u8 place)
{
    if (place >= MAPSECS_KANTO && place < MAPSEC_NONE)
        return TRUE;
    return FALSE;
}

static void sub_813B854(void)
{
    ShowPokemonSummaryScreen(0, 0, 0, CB2_ReturnToField, PSS_MODE_NORMAL);
}
