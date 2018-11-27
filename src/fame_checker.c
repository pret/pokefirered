#include "global.h"
#include "constants/songs.h"
#include "sprite.h"
#include "bg.h"
#include "event_data.h"
#include "event_scripts.h"
#include "graphics.h"
#include "battle.h"
#include "battle_setup.h"
#include "menu.h"
#include "battle_dome_cards.h"
#include "scanline_effect.h"
#include "new_menu_helpers.h"
#include "item_menu.h"
#include "list_menu.h"
#include "gpu_regs.h"
#include "palette.h"
#include "task.h"
#include "malloc.h"
#include "main.h"
#include "sound.h"
#include "text.h"
#include "window.h"
#include "string_util.h"
#include "field_map_obj.h"
#include "menu_indicators.h"
#include "text_window.h"
#include "fame_checker.h"

#define SPRITETAG_1000 1000
#define SPRITETAG_1001 1001
#define SPRITETAG_1002 1002
#define SPRITETAG_1004 1004
#define SPRITETAG_1006 1006
#define SPRITETAG_1007 1007
#define SPRITETAG_1008 1008
#define SPRITETAG_1009 1009

struct FameCheckerData
{
    MainCallback savedCallback;
    u16 unk_04;
    u8 unk_06;
    u8 unk_07_0:1;
    u8 inPickMode:1;
    u8 numUnlockedPersons:6;
    u8 scrollIndicatorArrowObjectTaskId;
    u8 unk_09;
    u8 unk_0A;
    u8 unk_0B;
    u8 unlockedPersons[17];
    u8 spriteIds[6];
    u8 unk_23_0:1;
    u8 unk_23_1:1;
    u8 unk_23_2:1;
};

static EWRAM_DATA u16 * sBg3TilemapBuffer = NULL;
static EWRAM_DATA u16 * sBg1TilemapBuffer = NULL;
static EWRAM_DATA u16 * sBg2TilemapBuffer = NULL;
static EWRAM_DATA struct FameCheckerData * sFameCheckerData = NULL;
static EWRAM_DATA struct ListMenuItem * sListMenuItems = NULL;
static EWRAM_DATA s32 sLastMenuIdx = 0;

struct ListMenuTemplate gFameChecker_ListMenuTemplate;
u8 gUnknown_3005EC8;

static void sub_812C3F8(void);
static void sub_812C648(void);
static void sub_812C664(u8 taskId);
static void sub_812C694(u8 taskId);
static bool8 sub_812C8F8(u8 taskId);
static void sub_812C990(void);
static void sub_812C9BC(u8 taskId);
static void sub_812CA1C(u8 taskId);
static void sub_812CAD8(u8 taskId);
static void sub_812CC68(u8 taskId, s8 dx, s8 dy);
static void sub_812CD3C(void);
static void sub_812CE04(u8 taskId);
static void sub_812CE9C(void);
static void sub_812CEC0(void);
static void sub_812CEE0(u8 windowId);
static bool8 sub_812CEFC(u8 taskId, u8 objMode);
static void sub_812CF3C(u8 taskId);
static void sub_812CF7C(u8 taskId);
static void sub_812D094(u8 windowId);
static void sub_812D0F4(u8 a0);
static bool8 sub_812D1A8(u8 a0);
static void sub_812D420(void);
static void sub_812D558(void);
static void sub_812D584(void);
static void sub_812D594(void);
static void sub_812D650(void);
static bool8 sub_812D6B4(void);
static void sub_812D70C(void);
static u8 sub_812D724(s16 a0);
static void sub_812D764(struct Sprite *sprite);
static void sub_812D770(void);
static u8 PlaceQuestionMarkTile(u8, u8);
static void sub_812D7C8(void);
static u8 sub_812D7E4(void);
static void sub_812D800(struct Sprite *sprite);
static void sub_812D814(void);
static u8 sub_812D888(u8 a0);
static void sub_812D9A8(u8 a0, u16 a1);
static void sub_812DA14(u8 a0);
static void sub_812DB10(void);
static void sub_812DB28(void);
static void sub_812D840(struct Sprite * sprite);
static void sub_812DB64(void);
static void sub_812DBC0(s32, bool8, struct ListMenu *);
static void sub_812DD50(u8 taskId);
static void sub_812DDAC(void);
static void sub_812DDF0(s32 itemIndex, bool8 onInit);
static u8 sub_812DEF0(void);
static void sub_812DFE4(u8);
static void sub_812E000(void);
static void sub_812E048(void);
static u16 FameCheckerGetCursorY(void);
static void sub_812E094(u8);
static void sub_812E110(u8 taskId);
static void sub_812E178(u8 a0, s16 a1);
static void sub_812E4A4(u8 a0);

extern const u8 gUnknown_84161C1[];
extern const u8 gUnknown_841623B[];
extern const u8 gUnknown_84181C3[];
extern const u8 gUnknown_84181E4[];
extern const u8 gUnknown_841E5A4[]; // "{KEYGFX_START_BUTTON}PICK {KEYGFX_DPAD_UP_DOWN}SELECT {KEYGFX_A_BUTTON}OK$"
extern const u8 gUnknown_841E5B9[]; // "{KEYGFX_START_BUTTON}PICK {KEYGFX_DPAD_UP_DOWN}SELECT {KEYGFX_B_BUTTON}CANCEL$"
extern const u8 gUnknown_841E5D2[]; // "{KEYGFX_DPAD_ANY}PICK {KEYGFX_A_BUTTON}READ {UNKNOWN_F8 0x01}CANCEL$"
extern const u8 gUnknown_841E5E9[]; // "OAK$"
extern const u8 gUnknown_841E5ED[]; // "DAISY$"
extern const u8 gUnknown_841E5F3[]; // "BILL$"
extern const u8 gUnknown_841E5F8[]; // "FUJI$"

static const u16 sFameCheckerTilemap[] = INCBIN_U16("data/fame_checker/tilemap_845c600.bin");
static const u8 sQuestionMarkSpriteGfx[] = INCBIN_U8("data/fame_checker/img_845ce00.4bpp");
static const u8 sSpinningPokeballSpriteGfx[] = INCBIN_U8("data/fame_checker/img_845cf00.4bpp");
static const u16 sSpinningPokeballSpritePalette[] = INCBIN_U16("data/fame_checker/pal_845d0e0.gbapal");
static const u8 sSelectorCursorSpriteGfx[] = INCBIN_U8("data/fame_checker/img_845d100.4bpp");
static const u16 sSelectorCursorSpritePalette[] = INCBIN_U16("data/fame_checker/pal_845d500.gbapal");
static const u8 sFujiSpriteGfx[] = INCBIN_U8("data/fame_checker/img_845d520.4bpp");
static const u16 sFujiSpritePalette[] = INCBIN_U16("data/fame_checker/pal_845dd20.gbapal");
static const u8 sBillSpriteGfx[] = INCBIN_U8("data/fame_checker/img_845dd40.4bpp");
static const u16 sBillSpritePalette[] = INCBIN_U16("data/fame_checker/pal_845e540.gbapal");
static const u8 sDaisySpriteGfx[] = INCBIN_U8("data/fame_checker/img_845e560.4bpp");
static const u16 sDaisySpritePalette[] = INCBIN_U16("data/fame_checker/pal_845ed60.gbapal");
static const u8 sOakSpriteGfx[] = INCBIN_U8("data/fame_checker/img_845ed80.4bpp");
static const u16 sOakSpritePalette[] = INCBIN_U16("data/fame_checker/pal_845f580.gbapal");
static const u16 gUnknown_845F5A0[] = INCBIN_U16("data/fame_checker/pal_845f5a0.gbapal");
static const u16 gUnknown_845F5C0[] = INCBIN_U16("data/fame_checker/pal_845f5c0.gbapal");

static const struct TextColor gUnknown_845F5E0 = {0x00, 0x01, 0x02};
static const struct TextColor gUnknown_845F5E3 = {0x00, 0x02, 0x03};
static const struct TextColor gUnknown_845F5E6 = {0x00, 0x06, 0x07};

static const u16 gUnknown_845F5EA[] = {
    0xfe00,
    0xfe01,
    0x019e,
    0x019f,
    0x01a0,
    0x01a1,
    0x01a2,
    0x01a4,
    0x01a3,
    0x019a,
    0x019b,
    0x019c,
    0x019d,
    0xfe02,
    0xfe03,
    0x015c
};

static const u8 *const gUnknown_845F60C[] = {
    gUnknown_841E5E9,
    gUnknown_841E5ED,
    gUnknown_841E5F3,
    gUnknown_841E5F8
};

static const u8 gUnknown_845F61C[] = {
    0x56, 0x54, 0x74, 0x75, 0x76, 0x77, 0x78, 0x7a, 0x79, 0x70, 0x71, 0x72, 0x73, 0x64, 0x7b, 0x6c,
    0x00, 0x01, 0x00, 0x01, 0x00, 0x01, 0x00, 0x01, 0x00, 0x01, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00
};

static const u8 *const gUnknown_845F63C[] = {
    gUnknown_81B0188,
    gUnknown_81B0251,
    gUnknown_81B030F,
    gUnknown_81B03B3,
    gUnknown_81B0446,
    gUnknown_81B0504,
    gUnknown_81B05C2,
    gUnknown_81B0667,
    gUnknown_81B06FB,
    gUnknown_81B079F,
    gUnknown_81B0845,
    gUnknown_81B08EE,
    gUnknown_81B097F,
    gUnknown_81B0A45,
    gUnknown_81B0AFF,
    gUnknown_81B0BA6,
    gUnknown_81B0198,
    gUnknown_81B025D,
    gUnknown_81B031B,
    gUnknown_81B03BF,
    gUnknown_81B0456,
    gUnknown_81B0510,
    gUnknown_81B05CD,
    gUnknown_81B0675,
    gUnknown_81B0708,
    gUnknown_81B07AD,
    gUnknown_81B0851,
    gUnknown_81B08FB,
    gUnknown_81B098B,
    gUnknown_81B0A50,
    gUnknown_81B0B0E,
    gUnknown_81B0BB5
};

static const u8 *const gUnknown_845F6BC[] = {
    gUnknown_81AD106, gUnknown_81AD145, gUnknown_81AD1BB, gUnknown_81AD258, gUnknown_81AD2B9, gUnknown_81AD377,
    gUnknown_81AD40C, gUnknown_81AD4AE, gUnknown_81AD516, gUnknown_81AD5A7, gUnknown_81AD608, gUnknown_81AD69F,
    gUnknown_81AD705, gUnknown_81AD771, gUnknown_81AD840, gUnknown_81AD908, gUnknown_81AD99A, gUnknown_81ADA27,
    gUnknown_81ADA91, gUnknown_81ADAF6, gUnknown_81ADB5A, gUnknown_81ADBD9, gUnknown_81ADC72, gUnknown_81ADCEB,
    gUnknown_81ADD3C, gUnknown_81ADDA7, gUnknown_81ADE0B, gUnknown_81ADE82, gUnknown_81ADEEC, gUnknown_81ADF6A,
    gUnknown_81AE009, gUnknown_81AE072, gUnknown_81AE0F3, gUnknown_81AE15B, gUnknown_81AE1E5, gUnknown_81AE247,
    gUnknown_81AE2B6, gUnknown_81AE31D, gUnknown_81AE37D, gUnknown_81AE407, gUnknown_81AE48D, gUnknown_81AE51B,
    gUnknown_81AE5E8, gUnknown_81AE656, gUnknown_81AE6D7, gUnknown_81AE762, gUnknown_81AE7CB, gUnknown_81AE841,
    gUnknown_81AE89E, gUnknown_81AE90A, gUnknown_81AE990, gUnknown_81AEA59, gUnknown_81AEAEE, gUnknown_81AEB69,
    gUnknown_81AEBDF, gUnknown_81AEC28, gUnknown_81AEC82, gUnknown_81AED27, gUnknown_81AEDAA, gUnknown_81AEE51,
    gUnknown_81AEF25, gUnknown_81AEF6C, gUnknown_81AEFC6, gUnknown_81AF04C, gUnknown_81AF0F0, gUnknown_81AF19A,
    gUnknown_81AF200, gUnknown_81AF248, gUnknown_81AF2B7, gUnknown_81AF34E, gUnknown_81AF3BE, gUnknown_81AF47C,
    gUnknown_81AF4FD, gUnknown_81AF567, gUnknown_81AF641, gUnknown_81AF6BA, gUnknown_81AF758, gUnknown_81AF7CB,
    gUnknown_81AF83E, gUnknown_81AF8CA, gUnknown_81AF929, gUnknown_81AF998, gUnknown_81AFA20, gUnknown_81AFAB9,
    gUnknown_81AFB0C, gUnknown_81AFB76, gUnknown_81AFC38, gUnknown_81AFCE9, gUnknown_81AFD49, gUnknown_81AFDC4,
    gUnknown_81AFE68, gUnknown_81AFF23, gUnknown_81AFFA8, gUnknown_81B0022, gUnknown_81B00A6, gUnknown_81B0106
};

static const u8 sFameCheckerArrayNpcGraphicsIds[] = {
    0x67, 0x47, 0x30, 0x69, 0x4b, 0x37,
    0x37, 0x30, 0x3d, 0x69, 0x23, 0x69,
    0x66, 0x50, 0x1b, 0x13, 0x1e, 0x69,
    0x66, 0x51, 0x2b, 0x27, 0x1d, 0x69,
    0x66, 0x52, 0x3d, 0x3d, 0x3e, 0x69,
    0x66, 0x53, 0x16, 0x1d, 0x53, 0x69,
    0x66, 0x54, 0x1a, 0x16, 0x69, 0x1e,
    0x66, 0x19, 0x55, 0x55, 0x69, 0x29,
    0x66, 0x56, 0x37, 0x1c, 0x69, 0x69,
    0x4d, 0x4d, 0x20, 0x69, 0x11, 0x23,
    0x4f, 0x4f, 0x69, 0x36, 0x1d, 0x36,
    0x4b, 0x36, 0x36, 0x69, 0x4b, 0x23,
    0x4a, 0x4a, 0x18, 0x17, 0x69, 0x29,
    0x48, 0x12, 0x20, 0x59, 0x59, 0x59,
    0x11, 0x31, 0x69, 0x1e, 0x69, 0x69,
    0x57, 0x37, 0x37, 0x57, 0x5b, 0x37
};

static const u8 *const gUnknown_845F89C[] = {
    gUnknown_81B0C45, gUnknown_81B0C51, gUnknown_81B0C5E, gUnknown_81B0C6B, gUnknown_81B0C79, gUnknown_81B0C88,
    gUnknown_81B0C95, gUnknown_81B0CA2, gUnknown_81B0CB1, gUnknown_81B0CC1, gUnknown_81B0CCF, gUnknown_81B0CDF,
    gUnknown_81B0CEB, gUnknown_81B0CF7, gUnknown_81B0D02, gUnknown_81B0D0E, gUnknown_81B0D16, gUnknown_81B0D1F,
    gUnknown_81B0D2D, gUnknown_81B0D3B, gUnknown_81B0D48, gUnknown_81B0D55, gUnknown_81B0D65, gUnknown_81B0D73,
    gUnknown_81B0D81, gUnknown_81B0D90, gUnknown_81B0D9E, gUnknown_81B0DAC, gUnknown_81B0DBA, gUnknown_81B0DC8,
    gUnknown_81B0DD7, gUnknown_81B0DE4, gUnknown_81B0DF0, gUnknown_81B0DFC, gUnknown_81B0E08, gUnknown_81B0E14,
    gUnknown_81B0E24, gUnknown_81B0E31, gUnknown_81B0E3D, gUnknown_81B0E49, gUnknown_81B0E56, gUnknown_81B0E63,
    gUnknown_81B0E6F, gUnknown_81B0E7C, gUnknown_81B0E89, gUnknown_81B0E95, gUnknown_81B0EA1, gUnknown_81B0EAE,
    gUnknown_81B0EBA, gUnknown_81B0ECA, gUnknown_81B0ED7, gUnknown_81B0EE4, gUnknown_81B0EF4, gUnknown_81B0F01,
    gUnknown_81B0F11, gUnknown_81B0F20, gUnknown_81B0F2F, gUnknown_81B0F3B, gUnknown_81B0F47, gUnknown_81B0F53,
    gUnknown_81B0F5F, gUnknown_81B0F6E, gUnknown_81B0F7D, gUnknown_81B0F8A, gUnknown_81B0F94, gUnknown_81B0F9F,
    gUnknown_81B0FAE, gUnknown_81B0FBD, gUnknown_81B0FCC, gUnknown_81B0FDB, gUnknown_81B0FE8, gUnknown_81B0FF7,
    gUnknown_81B1002, gUnknown_81B1011, gUnknown_81B1020, gUnknown_81B102D, gUnknown_81B103B, gUnknown_81B104A,
    gUnknown_81B1059, gUnknown_81B1067, gUnknown_81B1075, gUnknown_81B1082, gUnknown_81B108D, gUnknown_81B1098,
    gUnknown_81B10A3, gUnknown_81B10B1, gUnknown_81B10BF, gUnknown_81B10CD, gUnknown_81B10DB, gUnknown_81B10E8,
    gUnknown_81B10F8, gUnknown_81B1107, gUnknown_81B1111, gUnknown_81B111B, gUnknown_81B1128, gUnknown_81B1135
};

static const u8 *const gUnknown_845FA1C[] = {
    gUnknown_81B1146, gUnknown_81B114B, gUnknown_81B1155, gUnknown_81B115A, gUnknown_81B116A, gUnknown_81B1171,
    gUnknown_81B1176, gUnknown_81B117B, gUnknown_81B1181, gUnknown_81B1185, gUnknown_81B1195, gUnknown_81B119E,
    gUnknown_81B11AE, gUnknown_81B11B3, gUnknown_81B11B9, gUnknown_81B11C3, gUnknown_81B11C7, gUnknown_81B11CB,
    gUnknown_81B11DB, gUnknown_81B11E0, gUnknown_81B11E6, gUnknown_81B11EB, gUnknown_81B11F5, gUnknown_81B11FA,
    gUnknown_81B120A, gUnknown_81B120F, gUnknown_81B1219, gUnknown_81B1220, gUnknown_81B1227, gUnknown_81B122E,
    gUnknown_81B123E, gUnknown_81B1243, gUnknown_81B1249, gUnknown_81B124E, gUnknown_81B1254, gUnknown_81B125A,
    gUnknown_81B126A, gUnknown_81B126F, gUnknown_81B1274, gUnknown_81B1279, gUnknown_81B1281, gUnknown_81B1291,
    gUnknown_81B1295, gUnknown_81B129A, gUnknown_81B12A4, gUnknown_81B12AC, gUnknown_81B12B4, gUnknown_81B12C4,
    gUnknown_81B12CA, gUnknown_81B12CF, gUnknown_81B12D6, gUnknown_81B12DC, gUnknown_81B12E2, gUnknown_81B12E8,
    gUnknown_81B12F8, gUnknown_81B1300, gUnknown_81B1308, gUnknown_81B1310, gUnknown_81B1320, gUnknown_81B132C,
    gUnknown_81B1335, gUnknown_81B133B, gUnknown_81B1341, gUnknown_81B1351, gUnknown_81B1359, gUnknown_81B135F,
    gUnknown_81B1367, gUnknown_81B136E, gUnknown_81B1376, gUnknown_81B137E, gUnknown_81B138E, gUnknown_81B1395,
    gUnknown_81B139E, gUnknown_81B13A4, gUnknown_81B13AA, gUnknown_81B13B0, gUnknown_81B13BC, gUnknown_81B13CC,
    gUnknown_81B13D6, gUnknown_81B13D9, gUnknown_81B13E4, gUnknown_81B13EC, gUnknown_81B13F2, gUnknown_81B13F8,
    gUnknown_81B13FE, gUnknown_81B140A, gUnknown_81B1416, gUnknown_81B141F, gUnknown_81B1423, gUnknown_81B1429,
    gUnknown_81B1439, gUnknown_81B1442, gUnknown_81B144C, gUnknown_81B1456, gUnknown_81B145F, gUnknown_81B1463
};

static const struct SpriteSheet gUnknown_845FB9C[] = {
    {sSelectorCursorSpriteGfx, 0x400, SPRITETAG_1000},
    {sQuestionMarkSpriteGfx, 0x100, SPRITETAG_1001},
    {sSpinningPokeballSpriteGfx, 0x1e0, SPRITETAG_1002},
    {sDaisySpriteGfx, 0x800, SPRITETAG_1006},
    {sFujiSpriteGfx, 0x800, SPRITETAG_1007},
    {sOakSpriteGfx, 0x800, SPRITETAG_1008},
    {sBillSpriteGfx, 0x800, SPRITETAG_1009},
    {}
};

static const struct SpritePalette gUnknown_845FBDC[] = {
    {sSelectorCursorSpritePalette, SPRITETAG_1000},
    {sSpinningPokeballSpritePalette, SPRITETAG_1002},
    {}
};

static const struct BgTemplate gUnknown_845FBF4[4] = {
    {
        .bg = 3,
        .charBaseIndex = 0x03,
        .mapBaseIndex =  0x1e,
        .screenSize = 0,
        .paletteMode = FALSE,
        .priority = 3,
        .baseTile = 0x000},
    {
        .bg = 2,
        .charBaseIndex = 0x03,
        .mapBaseIndex =  0x1b,
        .screenSize = 0,
        .paletteMode = FALSE,
        .priority = 2,
        .baseTile = 0x000},
    {
        .bg = 1,
        .charBaseIndex = 0x03,
        .mapBaseIndex =  0x1c,
        .screenSize = 1,
        .paletteMode = FALSE,
        .priority = 0,
        .baseTile = 0x000},
    {
        .bg = 0,
        .charBaseIndex = 0x00,
        .mapBaseIndex =  0x1f,
        .screenSize = 0,
        .paletteMode = FALSE,
        .priority = 2,
        .baseTile = 0x000},
};

static const struct WindowTemplate gUnknown_845FC04[] = {
    {0x00, 0x01, 0x03, 0x08, 0x0a, 0x0f, 0x0014},
    {0x00, 0x06, 0x00, 0x18, 0x02, 0x0f, 0x0064},
    {0x00, 0x02, 0x0f, 0x1a, 0x04, 0x0f, 0x0094},
    {0x00, 0x0f, 0x0a, 0x0b, 0x04, 0x0f, 0x00fc},
    DUMMY_WIN_TEMPLATE
};

static const union AnimCmd gUnknown_845FC2C[] = {
    ANIMCMD_FRAME( 0, 15),
    ANIMCMD_FRAME(16, 15),
    ANIMCMD_JUMP(0)
};

static const union AnimCmd *const gUnknown_845FC38[] = {
    gUnknown_845FC2C
};

static const struct OamData gOamData_845FC3C = {
    .size = 2,
    .priority = 2
};

static const struct SpriteTemplate gUnknown_845FC44 = {
    SPRITETAG_1000, SPRITETAG_1000, &gOamData_845FC3C, gUnknown_845FC38, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy
};

static const u8 filler_845FC5C[8] = {};

static const struct OamData gOamData_845FC64 = {
    .shape = ST_OAM_V_RECTANGLE,
    .size = 2,
    .priority = 2
};

static const union AnimCmd gUnknown_845FC6C[] = {
    ANIMCMD_FRAME( 0, 10),
    ANIMCMD_END
};

static const union AnimCmd *const gUnknown_845FC74[] = {
    gUnknown_845FC6C
};

static const struct SpriteTemplate gUnknown_845FC78 = {
    SPRITETAG_1001, 0xffff, &gOamData_845FC64, gUnknown_845FC74, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy
};

static const union AnimCmd gUnknown_845FC90[] = {
    ANIMCMD_FRAME( 0, 10),
    ANIMCMD_END
};

static const union AnimCmd *const gUnknown_845FC98[] = {
    gUnknown_845FC90
};

static const struct OamData gOamData_845FC9C = {
    .affineMode = ST_OAM_AFFINE_NORMAL,
    .size = 2
};

static const union AffineAnimCmd gUnknown_845FCA4[] = {
    AFFINEANIMCMD_FRAME(0, 0, 4, 20),
    AFFINEANIMCMD_JUMP(0)
};

static const union AffineAnimCmd *const gUnknown_845FCB4[] = {
    gUnknown_845FCA4
};

static const struct SpriteTemplate sSpinningPokeballSpriteTemplate = {
    SPRITETAG_1002, SPRITETAG_1002, &gOamData_845FC9C, gUnknown_845FC98, NULL, gUnknown_845FCB4, sub_812D840
};

static const union AnimCmd gUnknown_845FCD0[] = {
    ANIMCMD_FRAME( 0, 15),
    ANIMCMD_END
};

static const union AnimCmd *const gUnknown_845FCD8[] = {
    gUnknown_845FCD0
};

static const struct OamData gOamData_845FCDC = {
    .size = 3
};

static const struct SpriteTemplate sDaisySpriteTemplate = {
    SPRITETAG_1006, 0xffff, &gOamData_845FCDC, gUnknown_845FCD8, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy
};

static const struct SpriteTemplate sFujiSpriteTemplate = {
    SPRITETAG_1007, 0xffff, &gOamData_845FCDC, gUnknown_845FCD8, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy
};

static const struct SpriteTemplate sOakSpriteTemplate = {
    SPRITETAG_1008, 0xffff, &gOamData_845FCDC, gUnknown_845FCD8, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy
};

static const struct SpriteTemplate sBillSpriteTemplate = {
    SPRITETAG_1009, 0xffff, &gOamData_845FCDC, gUnknown_845FCD8, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy
};

static void sub_812C380(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}

static void sub_812C394(void)
{
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

void UseFameChecker(MainCallback savedCallback)
{
    SetVBlankCallback(NULL);
    sFameCheckerData = AllocZeroed(sizeof(struct FameCheckerData));
    sFameCheckerData->savedCallback = savedCallback;
    sFameCheckerData->unk_09 = 0;
    sFameCheckerData->unk_0A = 0;
    sFameCheckerData->unk_0B = 0;
    sFameCheckerData->unk_23_0 = FALSE;
    PlaySE(SE_W202);
    SetMainCallback2(sub_812C3F8);
}

static void sub_812C3F8(void)
{
    switch (gMain.state)
    {
        case 0:
            SetVBlankCallback(NULL);
            sub_812D420();
            gMain.state++;
            break;
        case 1:
            sub_812D558();
            gMain.state++;
            break;
        case 2:
            sBg3TilemapBuffer = AllocZeroed(0x800);
            sBg1TilemapBuffer = AllocZeroed(0x1000);
            sBg2TilemapBuffer = AllocZeroed(0x800);
            ResetBgsAndClearDma3BusyFlags(0);
            InitBgsFromTemplates(0, gUnknown_845FBF4, ARRAY_COUNT(gUnknown_845FBF4));
            SetBgTilemapBuffer(3, sBg3TilemapBuffer);
            SetBgTilemapBuffer(2, sBg2TilemapBuffer);
            SetBgTilemapBuffer(1, sBg1TilemapBuffer);
            sub_812D594();
            gMain.state++;
            break;
        case 3:
            LoadBgTiles(3, gUnknown_8E9F260, sizeof(gUnknown_8E9F260), 0);
            CopyToBgTilemapBufferRect(3, gUnknown_8EA0700, 0, 0, 32, 32);
            LoadPalette(gUnknown_8E9F220 + 0x00, 0x00, 0x40);
            LoadPalette(gUnknown_8E9F220 + 0x10, 0x10, 0x20);
            CopyToBgTilemapBufferRect(2, gUnknown_8EA0F00, 0, 0, 32, 32);
            CopyToBgTilemapBufferRect_ChangePalette(1, sFameCheckerTilemap, 30, 0, 32, 32, 0x11);
            LoadPalette(stdpal_get(2), 0xF0, 0x20);
            gMain.state++;
            break;
        case 4:
            if (IsDma3ManagerBusyWithBgCopy() != TRUE)
            {
                ShowBg(0);
                ShowBg(1);
                ShowBg(2);
                ShowBg(3);
                CopyBgTilemapBufferToVram(3);
                CopyBgTilemapBufferToVram(2);
                CopyBgTilemapBufferToVram(1);
                gMain.state++;
            }
            break;
        case 5:
            InitWindows(gUnknown_845FC04);
            DeactivateAllTextPrinters();
            sub_812CEC0();
            sListMenuItems = AllocZeroed(17 * sizeof(struct ListMenuItem));
            sub_812DB28();
            gMain.state++;
            break;
        case 6:
            sub_812C648();
            sub_812D1A8(0);
            sub_812CE9C();
            BeginNormalPaletteFade(0xFFFFFFFF,0, 16, 0, 0);
            gMain.state++;
            break;
        case 7:
            sub_812D584();
            SetGpuReg(REG_OFFSET_BLDCNT, BLDCNT_EFFECT_BLEND | BLDCNT_TGT2_BG0 | BLDCNT_TGT2_BG1 | BLDCNT_TGT2_BG2 | BLDCNT_TGT2_BG3 | BLDCNT_TGT2_OBJ | BLDCNT_TGT2_BD);
            SetGpuReg(REG_OFFSET_BLDALPHA, 0x07);
            SetGpuReg(REG_OFFSET_BLDY, 0x08);
            SetVBlankCallback(sub_812C380);
            sFameCheckerData->unk_04 = 0;
            sub_812E000();
            sub_812E178(1, 4);
            CreateTask(sub_812C664, 0x08);
            SetMainCallback2(sub_812C394);
            gMain.state = 0;
            break;
    }
}

static void sub_812C648(void)
{
    LoadSpriteSheets(gUnknown_845FB9C);
    LoadSpritePalettes(gUnknown_845FBDC);
}

static void sub_812C664(u8 taskId)
{
    if (!gPaletteFade.active)
        gTasks[taskId].func = sub_812C694;
}

static void sub_812C694(u8 taskId)
{
    u16 r4;
    u8 r4_2;
    struct Task *task = &gTasks[taskId];
    s16 * data = gTasks[taskId].data;
    if (FindTaskIdByFunc(sub_812E110) == 0xFF)
    {
        RunTextPrinters();
        if ((JOY_NEW(SELECT_BUTTON)) && !sFameCheckerData->inPickMode && sFameCheckerData->savedCallback != UseFameCheckerFromMenu)
            task->func = sub_812CF3C;
        else if (JOY_NEW(START_BUTTON))
        {
            r4 = FameCheckerGetCursorY();
            if (sub_812C8F8(taskId) == TRUE)
            {
                PlaySE(SE_W100);
            }
            else if (r4 != sFameCheckerData->numUnlockedPersons - 1)
            {
                PlaySE(SE_W100);
                FillWindowPixelRect(3, 0x00, 0, 0, 88, 32);
                sub_812CEE0(3);
                sub_812E178(2, 4);
                sub_812E178(1, 5);
                sub_812D0F4(1);
                task->data[2] = sub_812D888(sFameCheckerData->unlockedPersons[r4]);
                gSprites[task->data[2]].pos2.x = 0xF0;
                gSprites[task->data[2]].data[0] = 1;
                task->data[3] = sub_812D7E4();
                gSprites[task->data[3]].pos2.x = 0xF0;
                gSprites[task->data[3]].data[0] = 1;
                task->func = sub_812C9BC;
            }
        }
        else if (JOY_NEW(A_BUTTON))
        {
            r4 = ListMenuHandleInput(0);
            if (r4 == sFameCheckerData->numUnlockedPersons - 1)
                task->func = sub_812CF3C;
            else if (sFameCheckerData->inPickMode)
            {
                if (!IsTextPrinterActive(2) && sub_812D6B4() == TRUE)
                    sub_812CD3C();
            }
            else if (sFameCheckerData->unk_07_0)
            {
                PlaySE(SE_SELECT);
                task->data[0] = sub_812D724(task->data[1]);
                for (r4_2 = 0; r4_2 < 6; r4_2++)
                {
                    if (r4_2 != task->data[1])
                        sub_812CEFC(sFameCheckerData->spriteIds[r4_2], ST_OAM_OBJ_BLEND);
                }
                gUnknown_3005EC8 = 0xFF;
                sub_812E4A4(0);
                sub_812D0F4(2);
                if (gSprites[sFameCheckerData->spriteIds[task->data[1]]].data[1] != 0xFF)
                {
                    sub_812CE04(taskId);
                    sub_812DA14(data[1]);
                }
                sub_812E048();
                task->func = sub_812CAD8;
            }
        }
        else if (JOY_NEW(B_BUTTON))
        {
            if (sub_812C8F8(taskId) != TRUE)
                task->func = sub_812CF3C;
        }
        else
            ListMenuHandleInput(0);
    }
}

static bool8 sub_812C8F8(u8 taskId)
{
    struct Task *task = &gTasks[taskId];
    if (sFameCheckerData->inPickMode)
    {
        gSprites[task->data[2]].data[0] = 2;
        gSprites[task->data[2]].pos2.x += 10;
        gSprites[task->data[3]].data[0] = 2;
        gSprites[task->data[3]].pos2.x += 10;
        sub_812CE9C();
        task->func = sub_812CA1C;
        sub_812C990();
        sFameCheckerData->unk_23_2 = FALSE;
        return TRUE;
    }
    return FALSE;
}

static void sub_812C990(void)
{
    AddTextPrinterParametrized(2, 2, gUnknown_84181E4, 0, NULL, 2, 1, 3);
}

static void sub_812C9BC(u8 taskId)
{
    struct Task *task = &gTasks[taskId];
    if (gSprites[task->data[2]].data[0] == 0)
    {
        sub_812CD3C();
        sFameCheckerData->inPickMode = TRUE;
        task->func = sub_812C694;
    }
    else
        ChangeBgX(1, 0xA00, 1);
}

static void sub_812CA1C(u8 taskId)
{
    struct Task *task = &gTasks[taskId];
    if (GetBgX(1) != 0)
        ChangeBgX(1, 0xA00, 2);
    else
        ChangeBgX(1, 0x000, 0);
    if (gSprites[task->data[2]].data[0] == 0)
    {
        if (sFameCheckerData->unk_07_0)
            sub_812D0F4(0);
        sub_812E178(1, 4);
        sub_812E178(2, 2);
        sFameCheckerData->inPickMode = FALSE;
        sub_812D9A8(taskId, FameCheckerGetCursorY());
        task->func = sub_812C694;
        gSprites[task->data[3]].callback = sub_812D800;
    }
}

static void sub_812CAD8(u8 taskId)
{
    struct Task *task = &gTasks[taskId];
    s16 *data = gTasks[taskId].data;

    RunTextPrinters();
    if (JOY_NEW(A_BUTTON) && !IsTextPrinterActive(2))
    {
        u8 spriteId = sFameCheckerData->spriteIds[data[1]];
        if (gSprites[spriteId].data[1] != 0xFF)
            sub_812CE04(taskId);
    }
    if (JOY_NEW(B_BUTTON))
    {
        u8 r4;
        PlaySE(SE_SELECT);
        for (r4 = 0; r4 < 6; r4++)
            sub_812CEFC(sFameCheckerData->spriteIds[r4], ST_OAM_OBJ_NORMAL);
        sub_812CE9C();
        gSprites[task->data[0]].callback = sub_812D764;
        if (gUnknown_3005EC8 != 0xFF)
            sub_812DB10();
        sub_812E4A4(1);
        sub_812D0F4(0);
        sub_812E000();
        sub_812C990();
        task->func = sub_812C694;
    }
    else if (JOY_NEW(DPAD_UP) || JOY_NEW(DPAD_DOWN))
    {
        if (task->data[1] >= 3)
        {
            task->data[1] -= 3;
            sub_812CC68(taskId, 0, -0x1b);
        }
        else
        {
            task->data[1] += 3;
            sub_812CC68(taskId, 0, +0x1b);
        }
    }
    else if (JOY_NEW(DPAD_LEFT))
    {
        if (task->data[1] == 0 || task->data[1] % 3 == 0)
        {
            task->data[1] += 2;
            sub_812CC68(taskId, +0x5e, 0);
        }
        else
        {
            task->data[1]--;
            sub_812CC68(taskId, -0x2f, 0);
        }
    }
    else if (JOY_NEW(DPAD_RIGHT))
    {
        if ((task->data[1] + 1) % 3 == 0)
        {
            task->data[1] -= 2;
            sub_812CC68(taskId, -0x5e, 0);
        }
        else
        {
            task->data[1]++;
            sub_812CC68(taskId, +0x2f, 0);
        }
    }
}

static void sub_812CC68(u8 taskId, s8 dx, s8 dy)
{
    u8 i;
    s16 *data = gTasks[taskId].data;
    PlaySE(SE_W155);
    gSprites[data[0]].pos1.x += dx;
    gSprites[data[0]].pos1.y += dy;
    for (i = 0; i < 6; i++)
        sub_812CEFC(sFameCheckerData->spriteIds[i], ST_OAM_OBJ_BLEND);
    FillWindowPixelRect(2, 0x11, 0, 0, 0xd0, 0x20);
    sub_812C990();
    if (sub_812CEFC(sFameCheckerData->spriteIds[data[1]], ST_OAM_OBJ_NORMAL) == TRUE)
    {
        sub_812CE04(taskId);
        sub_812DA14(data[1]);
    }
    else if (gUnknown_3005EC8 != 0xFF)
        sub_812DB10();
}

static void sub_812CD3C(void)
{
    u8 r8 = 0;
    u16 r6 = FameCheckerGetCursorY();
    if (gSaveBlock1Ptr->fameChecker[sFameCheckerData->unlockedPersons[r6]].unk_0_0 != 2)
    {
        sub_812CE9C();
        sub_812C990();
    }
    else
    {
        FillWindowPixelRect(2, 0x11, 0, 0, 0xd0, 0x20);
        if (sub_812D6B4() == TRUE)
            r8 = 16;
        StringExpandPlaceholders(gStringVar4, gUnknown_845F63C[sFameCheckerData->unlockedPersons[r6] + r8]);
        AddTextPrinterParametrized(2, 2, gStringVar4, sub_80F78A8(), NULL, 2, 1, 3);
        sub_812CEE0(2);
    }
}

static void sub_812CE04(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    u16 r5 = FameCheckerGetCursorY();
    FillWindowPixelRect(2, 0x11, 0, 0, 0xd0, 0x20);
    StringExpandPlaceholders(gStringVar4, gUnknown_845F6BC[sFameCheckerData->unlockedPersons[r5] * 6 + data[1]]);
    AddTextPrinterParametrized(2, 2, gStringVar4, sub_80F78A8(), NULL, 2, 1, 3);
    sub_812CEE0(2);
}

static void sub_812CE9C(void)
{
    FillWindowPixelRect(2, 0x11, 0, 0, 0xd0, 0x20);
    sub_812CEE0(2);
}

static void sub_812CEC0(void)
{
    sub_80F6E9C();
    sub_80F6EE4(2, 1);
    sub_812CEE0(2);
    sub_812CEE0(0);
}

static void sub_812CEE0(u8 windowId)
{
    PutWindowTilemap(windowId);
    CopyWindowToVram(windowId, 3);
}

static bool8 sub_812CEFC(u8 spriteId, u8 objMode)
{
    if (gSprites[spriteId].data[1] != 0xFF)
    {
        gSprites[spriteId].oam.objMode = objMode;
        return TRUE;
    }
    return FALSE;
}

static void sub_812CF3C(u8 taskId)
{
    PlaySE(SE_W202);
    BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, 0);
    gTasks[taskId].func = sub_812CF7C;
}

static void sub_812CF7C(u8 taskId)
{
    u8 r4;

    if (!gPaletteFade.active)
    {
        if (sFameCheckerData->inPickMode)
        {
            sub_812D9A8(taskId, FameCheckerGetCursorY());
            FreeSpriteOamMatrix(&gSprites[gTasks[taskId].data[3]]);
            DestroySprite(&gSprites[gTasks[taskId].data[3]]);
        }
        for (r4 = 0; r4 < 6; r4++)
        {
            DestroySprite(&gSprites[sFameCheckerData->spriteIds[r4]]);
        }
        sub_812D814();
        sub_812D7C8();
        sub_812D70C();
        sub_812D770();
        sub_812E048();
        SetMainCallback2(sFameCheckerData->savedCallback);
        sub_810713C(sFameCheckerData->scrollIndicatorArrowObjectTaskId, 0, 0);
        Free(sBg3TilemapBuffer);
        Free(sBg1TilemapBuffer);
        Free(sBg2TilemapBuffer);
        Free(sFameCheckerData);
        Free(sListMenuItems);
        sub_812D094(0);
        sub_812D094(1);
        sub_812D094(2);
        sub_812D094(3);
        FreeAllWindowBuffers();
        DestroyTask(taskId);
    }
}

static void sub_812D094(u8 windowId)
{
    FillWindowPixelBuffer(windowId, 0);
    ClearWindowTilemap(windowId);
    CopyWindowToVram(windowId, 2);
    RemoveWindow(windowId);
}

static u8 sub_812D0C0(u8 a0)
{
    if (HasTrainerAlreadyBeenFought(0x15e) == TRUE)
    {
        if (a0 == 9)
            return 15;
        if (a0 > 9)
            return a0 - 1;
    }
    return a0;
}

static void sub_812D0F4(u8 a0)
{
    const u8 * r5 = gUnknown_841E5A4;
    s32 width;
    if (a0 != 0)
    {
        r5 = gUnknown_841E5D2;
        if (a0 == 1)
            r5 = gUnknown_841E5B9;
    }
    width = GetStringWidth(0, r5, 0);
    FillWindowPixelRect(1, 0x00, 0, 0, 0xc0, 0x10);
    AddTextPrinterParametrized2(1, 0, 188 - width, 0, 0, 2, &gUnknown_845F5E0, -1, r5);
    sub_812CEE0(1);
}

static void sub_812D174(void)
{
    u8 r4;
    for (r4 = 0; r4 < 6; r4++)
    {
        DestroySprite(&gSprites[sFameCheckerData->spriteIds[r4]]);
    }
}

static bool8 sub_812D1A8(u8 a0)
{
    // r8 <- a0
    bool8 r5 = FALSE;
    u8 r6;
    for (r6 = 0; r6 < 6; r6++)
    {
        if ((gSaveBlock1Ptr->fameChecker[sFameCheckerData->unlockedPersons[a0]].unk_0_2 >> r6) & 1)
        {
            sFameCheckerData->spriteIds[r6] = sub_805EB44(
                sFameCheckerArrayNpcGraphicsIds[sFameCheckerData->unlockedPersons[a0] * 6 + r6],
                r6,
                47 * (r6 % 3) + 0x72,
                27 * (r6 / 3) + 0x2F
            );
            r5 = TRUE;
        }
        else
        {
            sFameCheckerData->spriteIds[r6] = PlaceQuestionMarkTile(
                47 * (r6 % 3) + 0x72,
                27 * (r6 / 3) + 0x1F
            );
            gSprites[sFameCheckerData->spriteIds[r6]].data[1] = 0xFF;
        }
    }
    if (r5 == TRUE)
    {
        sFameCheckerData->unk_07_0 = TRUE;
        if (sFameCheckerData->inPickMode)
            sub_812D0F4(TRUE);
        else
            sub_812D0F4(FALSE);
    }
    else
    {
        sFameCheckerData->unk_07_0 = FALSE;
        sub_812D0F4(TRUE);
    }
    return r5;
}

void ResetFameChecker(void)
{
    u8 r4;
    for (r4 = 0; r4 < 16; r4++)
    {
        gSaveBlock1Ptr->fameChecker[r4].unk_0_0 = 0;
        gSaveBlock1Ptr->fameChecker[r4].unk_0_2 = 0;
        gSaveBlock1Ptr->fameChecker[r4].unk_0_E = 0;
    }
    gSaveBlock1Ptr->fameChecker[0].unk_0_0 = 2;
}

static void sub_812D388(void)
{
    u8 r5, r4;
    for (r5 = 0; r5 < 16; r5++)
    {
        gSaveBlock1Ptr->fameChecker[r5].unk_0_0 = 2;
        for (r4 = 0; r4 < 6; r4++)
        {
            gSaveBlock1Ptr->fameChecker[r5].unk_0_2 |= (1 << r4);
        }
    }
}

static void sub_812D420(void)
{
    void * vram = (void *)VRAM;
    DmaClearLarge16(3, vram, VRAM_SIZE, 0x1000);
    DmaClear32(3, OAM, OAM_SIZE);
    DmaClear16(3, PLTT, PLTT_SIZE);
    SetGpuReg(REG_OFFSET_DISPCNT,  0);
    SetGpuReg(REG_OFFSET_BG0CNT,   0);
    SetGpuReg(REG_OFFSET_BG0HOFS,  0);
    SetGpuReg(REG_OFFSET_BG0VOFS,  0);
    SetGpuReg(REG_OFFSET_BG1CNT,   0);
    SetGpuReg(REG_OFFSET_BG1HOFS,  0);
    SetGpuReg(REG_OFFSET_BG1VOFS,  0);
    SetGpuReg(REG_OFFSET_BG2CNT,   0);
    SetGpuReg(REG_OFFSET_BG2HOFS,  0);
    SetGpuReg(REG_OFFSET_BG2VOFS,  0);
    SetGpuReg(REG_OFFSET_BG3CNT,   0);
    SetGpuReg(REG_OFFSET_BG3HOFS,  0);
    SetGpuReg(REG_OFFSET_BG3VOFS,  0);
    SetGpuReg(REG_OFFSET_WIN0H,    0);
    SetGpuReg(REG_OFFSET_WIN0V,    0);
    SetGpuReg(REG_OFFSET_WININ,    0);
    SetGpuReg(REG_OFFSET_WINOUT,   0);
    SetGpuReg(REG_OFFSET_BLDCNT,   0);
    SetGpuReg(REG_OFFSET_BLDALPHA, 0);
    SetGpuReg(REG_OFFSET_BLDY,     0);
}

static void sub_812D558(void)
{
    remove_some_task();
    ResetTasks();
    ResetSpriteData();
    dp13_810BB8C();
    ResetPaletteFade();
    npc_paltag_set_load(0);
    gReservedSpritePaletteCount = 7;

}

static void sub_812D584(void)
{
    SetGpuReg(REG_OFFSET_DISPCNT, DISPCNT_MODE_0 | DISPCNT_OBJ_1D_MAP | DISPCNT_BG_ALL_ON | DISPCNT_OBJ_ON);
}

static void sub_812D594(void)
{
    ChangeBgX(0, 0, 0);
    ChangeBgY(0, 0, 0);
    ChangeBgX(1, 0, 0);
    ChangeBgY(1, 0, 0);
    ChangeBgX(2, 0, 0);
    ChangeBgY(2, 0, 0);
    ChangeBgX(3, 0, 0);
    ChangeBgY(3, 0, 0);
}

static void sub_812D5EC(void)
{
    if (gUnknown_20370C0 < 16 && gSpecialVar_0x8005 < 6)
    {
        gSaveBlock1Ptr->fameChecker[gUnknown_20370C0].unk_0_2 |= (1 << gSpecialVar_0x8005);
        gSpecialVar_0x8005 = 1;
        sub_812D650();
    }
}

static void sub_812D650(void)
{
    if (gUnknown_20370C0 < 16 && gSpecialVar_0x8005 < 3)
    {
        if (gSpecialVar_0x8005 == 0)
            return;
        if (gSpecialVar_0x8005 == 1 && gSaveBlock1Ptr->fameChecker[gUnknown_20370C0].unk_0_0 == 2)
            return;
        gSaveBlock1Ptr->fameChecker[gUnknown_20370C0].unk_0_0 = gSpecialVar_0x8005;
    }
}

static bool8 sub_812D6B4(void)
{
    u8 r2;
    u8 r1 = sFameCheckerData->unlockedPersons[FameCheckerGetCursorY()];
    for (r2 = 0; r2 < 6; r2++)
    {
        if (!((gSaveBlock1Ptr->fameChecker[r1].unk_0_2 >> r2) & 1))
            return FALSE;
    }
    return TRUE;
}

static void sub_812D70C(void)
{
    FreeSpriteTilesByTag(SPRITETAG_1000);
    FreeSpritePaletteByTag(SPRITETAG_1000);
}

static u8 sub_812D724(s16 a0)
{
    s16 r4 = a0 >= 3 ? 61 : 34;
    s16 r1 = 47 * (a0 % 3) + 0x72;
    return CreateSprite(&gUnknown_845FC44, r1, r4, 0);
}

static void sub_812D764(struct Sprite * sprite)
{
    DestroySprite(sprite);
}

static void sub_812D770(void)
{
    FreeSpriteTilesByTag(SPRITETAG_1001);
}

static u8 PlaceQuestionMarkTile(u8 x, u8 y)
{
    u8 spriteId = CreateSprite(&gUnknown_845FC78, x, y, 8);
    gSprites[spriteId].oam.priority = 2;
    gSprites[spriteId].oam.paletteNum = 2;
    return spriteId;
}

static void sub_812D7C8(void)
{
    FreeSpriteTilesByTag(SPRITETAG_1002);
    FreeSpritePaletteByTag(SPRITETAG_1002);
}

static u8 sub_812D7E4(void)
{
    return CreateSprite(&sSpinningPokeballSpriteTemplate, 0xe2, 0x42, 0);
}

static void sub_812D800(struct Sprite * sprite)
{
    FreeSpriteOamMatrix(sprite);
    DestroySprite(sprite);
}

static void sub_812D814(void)
{
    FreeSpriteTilesByTag(SPRITETAG_1006);
    FreeSpriteTilesByTag(SPRITETAG_1007);
    FreeSpriteTilesByTag(SPRITETAG_1008);
    FreeSpriteTilesByTag(SPRITETAG_1009);
}

static void sub_812D840(struct Sprite * sprite)
{
    if (sprite->data[0] == 1)
    {
        if (sprite->pos2.x - 10 < 0)
        {
            sprite->pos2.x = 0;
            sprite->data[0] = 0;
        }
        else
            sprite->pos2.x -= 10;
    }
    else if (sprite->data[0] == 2)
    {
        if (sprite->pos2.x > 240)
        {
            sprite->pos2.x = 240;
            sprite->data[0] = 0;
        }
        else
            sprite->pos2.x += 10;
    }
}

static u8 sub_812D888(u8 a0)
{
    u8 r4;
    if (a0 == FAMECHECKER_DAISY)
    {
        r4 = CreateSprite(&sDaisySpriteTemplate, 0x94, 0x42, 0);
        LoadPalette(sDaisySpritePalette, 0x160, 0x20);
        gSprites[r4].oam.paletteNum = 6;
    }
    else if (a0 == FAMECHECKER_MRFUJI)
    {
        r4 = CreateSprite(&sFujiSpriteTemplate, 0x94, 0x42, 0);
        LoadPalette(sFujiSpritePalette, 0x160, 0x20);
        gSprites[r4].oam.paletteNum = 6;
    }
    else if (a0 == FAMECHECKER_OAK)
    {
        r4 = CreateSprite(&sOakSpriteTemplate, 0x94, 0x42, 0);
        LoadPalette(sOakSpritePalette, 0x160, 0x20);
        gSprites[r4].oam.paletteNum = 6;
    }
    else if (a0 == FAMECHECKER_BILL)
    {
        r4 = CreateSprite(&sBillSpriteTemplate, 0x94, 0x42, 0);
        LoadPalette(sBillSpritePalette, 0x160, 0x20);
        gSprites[r4].oam.paletteNum = 6;
    }
    else
    {
        r4 = sub_810C2A4(gUnknown_845F61C[a0], 1, 0x94, 0x42, 6, 0xFFFF);
    }
    gSprites[r4].callback = sub_812D840;
    if (gSaveBlock1Ptr->fameChecker[a0].unk_0_0 == 1)
        LoadPalette(gUnknown_845F5C0, 0x160, 0x20);
    return r4;
}

static void sub_812D9A8(u8 taskId, u16 a1)
{
    s16 * data = gTasks[taskId].data;
    u16 r1 = a1;
    if (a1 == sFameCheckerData->numUnlockedPersons - 1)
        r1 = a1 - 1;
    if (   sFameCheckerData->unlockedPersons[r1] == FAMECHECKER_DAISY
        || sFameCheckerData->unlockedPersons[r1] == FAMECHECKER_MRFUJI
        || sFameCheckerData->unlockedPersons[r1] == FAMECHECKER_OAK
        || sFameCheckerData->unlockedPersons[r1] == FAMECHECKER_BILL
    )
        DestroySprite(&gSprites[data[2]]);
    else
        sub_810C2E8(data[2]);
}

static void sub_812DA14(u8 a0)
{
    s32 width;
    u32 r5 = 6 * sFameCheckerData->unlockedPersons[FameCheckerGetCursorY()] + a0;
    sub_812E094(1);
    gUnknown_3005EC8 = 1;
    FillWindowPixelRect(3, 0x00, 0, 0, 0x58, 0x20);
    width = (0x54 - GetStringWidth(0, gUnknown_845F89C[r5], 0)) / 2;
    AddTextPrinterParametrized2(3, 0, width, 0, 0, 2, &gUnknown_845F5E3, -1, gUnknown_845F89C[r5]);
    StringExpandPlaceholders(gStringVar1, gUnknown_845FA1C[r5]);
    width = (0x54 - GetStringWidth(0, gStringVar1, 0)) / 2;
    AddTextPrinterParametrized2(3, 0, width, 10, 0, 2, &gUnknown_845F5E3, -1, gStringVar1);
    sub_812CEE0(3);
}

static void sub_812DB10(void)
{
    sub_812E094(0);
    gUnknown_3005EC8 = 0xFF;
}

static void sub_812DB28(void)
{
    sub_812DB64();
    sFameCheckerData->numUnlockedPersons = sub_812DEF0();
    sFameCheckerData->scrollIndicatorArrowObjectTaskId = ListMenuInit(&gFameChecker_ListMenuTemplate, 0, 0);
    sub_812DFE4(0);
}

static void sub_812DB64(void)
{
    gFameChecker_ListMenuTemplate.items = sListMenuItems;
    gFameChecker_ListMenuTemplate.moveCursorFunc = sub_812DBC0;
    gFameChecker_ListMenuTemplate.itemPrintFunc = NULL;
    gFameChecker_ListMenuTemplate.totalItems = 1;
    gFameChecker_ListMenuTemplate.maxShowed = 1;
    gFameChecker_ListMenuTemplate.windowId = 0;
    gFameChecker_ListMenuTemplate.header_X = 0;
    gFameChecker_ListMenuTemplate.item_X = 8;
    gFameChecker_ListMenuTemplate.cursor_X = 0;
    gFameChecker_ListMenuTemplate.upText_Y = 4;
    gFameChecker_ListMenuTemplate.cursorPal = 2;
    gFameChecker_ListMenuTemplate.fillValue = 0;
    gFameChecker_ListMenuTemplate.cursorShadowPal = 3;
    gFameChecker_ListMenuTemplate.lettersSpacing = 0;
    gFameChecker_ListMenuTemplate.itemVerticalPadding = 0;
    gFameChecker_ListMenuTemplate.scrollMultiple = 0;
    gFameChecker_ListMenuTemplate.fontId = 2;
    gFameChecker_ListMenuTemplate.cursorKind = 0;
}

static void sub_812DBC0(s32 itemIndex, bool8 onInit, struct ListMenu *list)
{
    u16 sp8;
    u8 taskId;
    u16 r9;
    sLastMenuIdx = 0;
    r9 = sFameCheckerData->unk_0A + sFameCheckerData->unk_0B;
    sub_812DDF0(itemIndex, onInit);
    taskId = FindTaskIdByFunc(sub_812C694);
    if (taskId != 0xFF)
    {
        struct Task *task = &gTasks[taskId];
        PlaySE(SE_SELECT);
        task->data[1] = 0;
        get_coro_args_x18_x1A(sFameCheckerData->scrollIndicatorArrowObjectTaskId, &sp8, NULL);
        sFameCheckerData->unk_04 = sp8;
        if (itemIndex != sFameCheckerData->numUnlockedPersons - 1)
        {
            sub_812D174();
            sub_812D1A8(itemIndex);
            if (sFameCheckerData->inPickMode)
            {
                if (!sFameCheckerData->unk_23_2)
                {
                    sub_812D9A8(taskId, r9);
                    sLastMenuIdx = itemIndex;
                    task->func = sub_812DD50;
                }
                else
                {
                    gSprites[task->data[2]].invisible = FALSE;
                    sFameCheckerData->unk_23_2 = FALSE;
                    gSprites[task->data[2]].data[0] = 0;
                    sub_812CD3C();
                }
            }
            else
            {
                FillWindowPixelRect(2, 0x11, 0, 0, 0xd0, 0x20);
                sub_812CEE0(2);
            }
        }
        else
        {
            sub_812DDAC();
            if (sFameCheckerData->inPickMode)
            {
                gSprites[task->data[2]].invisible = TRUE;
                sFameCheckerData->unk_23_2 = TRUE;
            }
            else
            {
                u8 r2;
                for (r2 = 0; r2 < 6; r2++)
                {
                    gSprites[sFameCheckerData->spriteIds[r2]].invisible = TRUE;
                }
            }
        }
    }
}

static void sub_812DD50(u8 taskId)
{
    struct Task * task = &gTasks[taskId];
    task->data[2] = sub_812D888(sFameCheckerData->unlockedPersons[sLastMenuIdx]);
    gSprites[task->data[2]].data[0] = 0;
    sub_812CD3C();
    task->func = sub_812C694;
}

static void sub_812DDAC(void)
{
    FillWindowPixelRect(2, 0x11, 0, 0, 0xd0, 0x20);
    AddTextPrinterParametrized(2, 2, gUnknown_84181C3, 0, NULL, 2, 1, 3);
    sub_812CEE0(2);
}

static void sub_812DDF0(s32 itemIndex, bool8 onInit)
{
    u16 sp14;
    u16 sp16;
    u16 r6;
    get_coro_args_x18_x1A(sFameCheckerData->scrollIndicatorArrowObjectTaskId, &sp14, &sp16);
    r6 = sp14 + sp16;
    AddTextPrinterParametrized2(0, 2, 8, 14 * sp16 + 4, 0, 0, &gUnknown_845F5E6, 0, sListMenuItems[itemIndex].unk_00);
    if (!onInit)
    {
        if (sp14 < sFameCheckerData->unk_0A)
            sFameCheckerData->unk_0B++;
        else if (sp14 > sFameCheckerData->unk_0A && r6 != sFameCheckerData->numUnlockedPersons - 1)
            sFameCheckerData->unk_0B--;
        AddTextPrinterParametrized2(0, 2, 8, 14 * sFameCheckerData->unk_0B + 4, 0, 0, &gUnknown_845F5E3, 0, sListMenuItems[sFameCheckerData->unk_09].unk_00);

    }
    sFameCheckerData->unk_09 = itemIndex;
    sFameCheckerData->unk_0B = sp16;
    sFameCheckerData->unk_0A = sp14;
}

static u8 sub_812DEF0(void)
{
    u8 r4 = 0;
    u8 r6;

    for (r6 = 0; r6 < 16; r6++)
    {
        u8 r5 = sub_812D0C0(r6);
        if (gSaveBlock1Ptr->fameChecker[r5].unk_0_0 != 0)
        {
            if (gUnknown_845F5EA[r5] < 0xFE00)
            {
                sListMenuItems[r4].unk_00 = gTrainers[gUnknown_845F5EA[r5]].trainerName;
                sListMenuItems[r4].unk_04 = r4;
            }
            else
            {
                sListMenuItems[r4].unk_00 = gUnknown_845F60C[gUnknown_845F5EA[r5] - 0xFE00];
                sListMenuItems[r4].unk_04 = r4;
            }
            sFameCheckerData->unlockedPersons[r4] = r5;
            r4++;
        }
    }
    sListMenuItems[r4].unk_00 = gUnknown_84161C1;
    sListMenuItems[r4].unk_04 = r4;
    sFameCheckerData->unlockedPersons[r4] = 0xFF;
    r4++;
    gFameChecker_ListMenuTemplate.totalItems = r4;
    if (r4 < 5)
        gFameChecker_ListMenuTemplate.maxShowed = r4;
    else
        gFameChecker_ListMenuTemplate.maxShowed = 5;
    return r4;
}

static void sub_812DFE4(u8 windowId)
{
    PutWindowTilemap(windowId);
    CopyWindowToVram(windowId, 3);
}

static void sub_812E000(void)
{
    struct ScrollIndicatorArrowPairTemplate sp0 = {
                       2,
                      40,
                      26,
                       3,
                      40,
                     100,
                       0,
                       0,
          SPRITETAG_1004,
                  0xFFFF,
                       1,
                       0
    };

    if (sFameCheckerData->numUnlockedPersons > 5)
    {
        sp0.unk_06 = 0;
        sp0.unk_08 = sFameCheckerData->numUnlockedPersons - 5;
        sFameCheckerData->unk_06 = AddScrollIndicatorArrowPair(&sp0, &sFameCheckerData->unk_04);
    }
}

static void sub_812E048(void)
{
    if (sFameCheckerData->numUnlockedPersons > 5)
        RemoveScrollIndicatorArrowPair(sFameCheckerData->unk_06);
}

static u16 FameCheckerGetCursorY(void)
{
    u16 sp0, sp2;
    get_coro_args_x18_x1A(sFameCheckerData->scrollIndicatorArrowObjectTaskId, &sp0, &sp2);
    return sp0 + sp2;
}

static void sub_812E094(u8 a0)
{
    if (sFameCheckerData->unk_23_0 != a0)
    {
        u8 taskId = FindTaskIdByFunc(sub_812E110);
        if (taskId == 0xFF)
            taskId = CreateTask(sub_812E110, 8);
        gTasks[taskId].data[0] = 0;
        gTasks[taskId].data[1] = 4;
        if (a0 == TRUE)
        {
            gTasks[taskId].data[2] = 1;
            sFameCheckerData->unk_23_0 = TRUE;
        }
        else
        {
            gTasks[taskId].data[2] = 4;
            sFameCheckerData->unk_23_0 = FALSE;
        }
    }
}

static void sub_812E110(u8 taskId)
{
    struct Task * task = &gTasks[taskId];
    switch (task->data[0])
    {
        case 0:
            if (--task->data[1] == 0)
            {
                sub_812E178(1, 0);
                task->data[1] = 4;
                task->data[0]++;
            }
            break;
        case 1:
            if (--task->data[1] == 0)
            {
                sub_812E178(1, task->data[2]);
                DestroyTask(taskId);
            }
            break;
    }
}

static void sub_812E178(u8 bg, s16 a1)
{
    if (a1 == 0 || a1 == 3)
    {
        FillBgTilemapBufferRect(bg, 0x8C, 14, 10,  1,  1, 1);
        FillBgTilemapBufferRect(bg, 0xA1, 15, 10, 10,  1, 1);
        FillBgTilemapBufferRect(bg, 0x8D, 25, 10,  1,  1, 1);
        FillBgTilemapBufferRect(bg, 0x8E, 26, 10,  1,  1, 1);
        FillBgTilemapBufferRect(bg, 0x8F, 14, 11,  1,  1, 1);
        FillBgTilemapBufferRect(bg, 0x00, 15, 11, 11,  1, 1);
        FillBgTilemapBufferRect(bg, 0x90, 26, 11,  1,  1, 1);
        FillBgTilemapBufferRect(bg, 0x91, 14, 12,  1,  1, 1);
        FillBgTilemapBufferRect(bg, 0xA3, 15, 12, 10,  1, 1);
        FillBgTilemapBufferRect(bg, 0x92, 25, 12,  1,  1, 1);
        FillBgTilemapBufferRect(bg, 0x93, 26, 12,  1,  1, 1);
    }
    else if (a1 == 1)
    {
        FillBgTilemapBufferRect(bg, 0x9B, 14, 10,  1,  1, 1);
        FillBgTilemapBufferRect(bg, 0x9C, 15, 10, 11,  1, 1);
        FillBgTilemapBufferRect(bg, 0x96, 26, 10,  1,  1, 1);
        FillBgTilemapBufferRect(bg, 0x9D, 14, 11,  1,  1, 1);
        FillBgTilemapBufferRect(bg, 0x00, 15, 11, 11,  1, 1);
        FillBgTilemapBufferRect(bg, 0x90, 26, 11,  1,  1, 1);
        FillBgTilemapBufferRect(bg, 0x9E, 14, 12,  1,  1, 1);
        FillBgTilemapBufferRect(bg, 0x9F, 15, 12, 11,  1, 1);
        FillBgTilemapBufferRect(bg, 0x99, 26, 12,  1,  1, 1);
    }
    else if (a1 == 2)
    {
        FillBgTilemapBufferRect(bg, 0x94, 14, 10,  1,  1, 1);
        FillBgTilemapBufferRect(bg, 0x95, 15, 10, 11,  1, 1);
        FillBgTilemapBufferRect(bg, 0x96, 26, 10,  1,  1, 1);
        FillBgTilemapBufferRect(bg, 0x8F, 14, 11,  1,  1, 1);
        FillBgTilemapBufferRect(bg, 0x9A, 15, 11, 11,  1, 1);
        FillBgTilemapBufferRect(bg, 0x90, 26, 11,  1,  1, 1);
        FillBgTilemapBufferRect(bg, 0x97, 14, 12,  1,  1, 1);
        FillBgTilemapBufferRect(bg, 0x98, 15, 12, 11,  1, 1);
        FillBgTilemapBufferRect(bg, 0x99, 26, 12,  1,  1, 1);
    }
    else if (a1 == 4)
    {
        FillBgTilemapBufferRect(bg, 0x83, 14, 10,  1,  1, 1);
        FillBgTilemapBufferRect(bg, 0xA0, 15, 10, 10,  1, 1);
        FillBgTilemapBufferRect(bg, 0x84, 25, 10,  1,  1, 1);
        FillBgTilemapBufferRect(bg, 0x85, 26, 10,  1,  1, 1);
        FillBgTilemapBufferRect(bg, 0x86, 14, 11,  1,  1, 1);
        FillBgTilemapBufferRect(bg, 0xA2, 15, 11, 10,  1, 1);
        FillBgTilemapBufferRect(bg, 0x87, 25, 11,  1,  1, 1);
        FillBgTilemapBufferRect(bg, 0x88, 26, 11,  1,  1, 1);
        FillBgTilemapBufferRect(bg, 0x83, 14, 12,  1,  1, 1);
        FillBgTilemapBufferRect(bg, 0xA0, 15, 12, 10,  1, 1);
        FillBgTilemapBufferRect(bg, 0x84, 25, 12,  1,  1, 1);
        FillBgTilemapBufferRect(bg, 0x85, 26, 12,  1,  1, 1);
    }
    else if (a1 == 5)
    {
        FillBgTilemapBufferRect(bg, 0x00, 14, 10, 13,  3, 1);
    }
    CopyBgTilemapBufferToVram(bg);
}

static void sub_812E4A4(u8 a0)
{
    u16 cursorY = ListMenuGetYCoordForPrintingArrowCursor(sFameCheckerData->scrollIndicatorArrowObjectTaskId);
    if (a0 == 1)
        AddTextPrinterParametrized2(0, 2, 0, cursorY, 0, 0, &gUnknown_845F5E3, 0, gUnknown_841623B);
    else
        AddTextPrinterParametrized2(0, 2, 0, cursorY, 0, 0, &gUnknown_845F5E0, 0, gUnknown_841623B);
}
