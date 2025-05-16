#include "global.h"
#include "gflib.h"
#include "m4a.h"
#include "quest_log.h"
#include "graphics.h"
#include "dynamic_placeholder_text_util.h"
#include "constants/songs.h"

#define TAG_CURSOR 0x8000

#define CURSOR_DELAY 8

#define DARK_DOWN_ARROW_OFFSET 256

extern const struct OamData gOamData_AffineOff_ObjNormal_16x16;

static void DecompressGlyph_NormalCopy1(u16 glyphId, bool32 isJapanese);
static void DecompressGlyph_NormalCopy2(u16 glyphId, bool32 isJapanese);
static void DecompressGlyph_Male(u16 glyphId, bool32 isJapanese);
static void DecompressGlyph_Bold(u16 glyphId);
static s32 GetGlyphWidth_Small(u16 glyphId, bool32 isJapanese);
static s32 GetGlyphWidth_NormalCopy1(u16 glyphId, bool32 isJapanese);
static s32 GetGlyphWidth_Normal(u16 glyphId, bool32 isJapanese);
static s32 GetGlyphWidth_NormalCopy2(u16 glyphId, bool32 isJapanese);
static s32 GetGlyphWidth_Male(u16 glyphId, bool32 isJapanese);
static s32 GetGlyphWidth_Female(u16 glyphId, bool32 isJapanese);
static void SpriteCB_TextCursor(struct Sprite *sprite);

COMMON_DATA TextFlags gTextFlags = {0};

static const u8 sDownArrowTiles[]    = INCBIN_U8("graphics/fonts/down_arrows.4bpp");
static const u8 sDoubleArrowTiles1[] = INCBIN_U8("graphics/fonts/down_arrow_3.4bpp");
static const u8 sDoubleArrowTiles2[] = INCBIN_U8("graphics/fonts/down_arrow_4.4bpp");

static const u8 sDownArrowYCoords[]           = { 0, 16, 32, 16 };
static const u8 sWindowVerticalScrollSpeeds[] = {
    [OPTIONS_TEXT_SPEED_SLOW] = 1,
    [OPTIONS_TEXT_SPEED_MID] = 2,
    [OPTIONS_TEXT_SPEED_FAST] = 4,
};

static const struct GlyphWidthFunc sGlyphWidthFuncs[] = {
    { FONT_SMALL,         GetGlyphWidth_Small },
    { FONT_NORMAL_COPY_1, GetGlyphWidth_NormalCopy1 },
    { FONT_NORMAL,        GetGlyphWidth_Normal },
    { FONT_NORMAL_COPY_2, GetGlyphWidth_NormalCopy2 },
    { FONT_MALE,          GetGlyphWidth_Male },
    { FONT_FEMALE,        GetGlyphWidth_Female },
    { FONT_BRAILLE,       GetGlyphWidth_Braille }
};

static const struct SpriteSheet sSpriteSheets_TextCursor[] =
{
    {sDoubleArrowTiles1, sizeof(sDoubleArrowTiles1), TAG_CURSOR},
    {sDoubleArrowTiles2, sizeof(sDoubleArrowTiles2), TAG_CURSOR},
    {NULL}
};

static const struct SpritePalette sSpritePalettes_TextCursor[] =
{
    {gStandardMenuPalette, TAG_CURSOR},
    {NULL}
};

static const struct SpriteTemplate sSpriteTemplate_TextCursor =
{
    .tileTag = TAG_CURSOR,
    .paletteTag = TAG_CURSOR,
    .oam = &gOamData_AffineOff_ObjNormal_16x16,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCB_TextCursor,
};

struct
{
    u16 tileOffset;
    u8 width;
    u8 height;
} static const sKeypadIcons[] =
{
    [CHAR_A_BUTTON]       = {  0x0,  8, 12 },
    [CHAR_B_BUTTON]       = {  0x1,  8, 12 },
    [CHAR_L_BUTTON]       = {  0x2, 16, 12 },
    [CHAR_R_BUTTON]       = {  0x4, 16, 12 },
    [CHAR_START_BUTTON]   = {  0x6, 24, 12 },
    [CHAR_SELECT_BUTTON]  = {  0x9, 24, 12 },
    [CHAR_DPAD_UP]        = {  0xC,  8, 12 },
    [CHAR_DPAD_DOWN]      = {  0xD,  8, 12 },
    [CHAR_DPAD_LEFT]      = {  0xE,  8, 12 },
    [CHAR_DPAD_RIGHT]     = {  0xF,  8, 12 },
    [CHAR_DPAD_UPDOWN]    = { 0x20,  8, 12 },
    [CHAR_DPAD_LEFTRIGHT] = { 0x21,  8, 12 },
    [CHAR_DPAD_NONE]      = { 0x22,  8, 12 },
};

const u8 gKeypadIconTiles[] = INCBIN_U8("graphics/fonts/keypad_icons.4bpp");

static const u16 sFontSmallLatinGlyphs[] = INCBIN_U16("graphics/fonts/latin_small.latfont");
static const u8 sFontSmallLatinGlyphWidths[] = 
{
     5,  5,  5,  5,  5,  5,  5,  5,  5,  4,  5,  4,  4,  5, 
     5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,
     5,  5,  4,  5,  4,  4,  5,  5,  5,  6,  5,  5,  5,  5,
     5,  5,  8,  7,  8,  5,  5,  5,  5,  5,  8,  8,  7,  5,
     5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,
     5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  8,
     8,  8,  8,  8,  8,  8,  4,  7,  5,  5,  5,  5,  5,  5,
     5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  4,
     5,  5,  5,  5,  5,  5,  5,  5,  5,  8,  8,  8,  8,  5,
     5,  5,  5,  5,  5,  5,  5,  7,  7,  5,  5,  5,  5,  5,
     5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,
     5,  5,  5,  5,  5,  5,  8,  5,  5,  5,  5,  5,  5,  5,
     5,  5,  5,  4,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,
     5,  8,  5,  8,  5,  5,  5,  5,  5,  5,  5,  5,  5,  4,
     5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  4,  5,  5,  5,
     5,  4,  5,  5,  5,  5,  5,  5,  5,  5,  5,  4,  5,  5,
     5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,
     5,  8,  7,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,
     5,  5,  5,  5,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,
     8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,
     5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,
     5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,
     5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,
     5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,
     5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,
     5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,
     5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,
     5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,
     5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,
     5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,
     5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,
     5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,
     5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,
     5,  5,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,
     8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,
     8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,
     8,  8,  8,  8,  8,  8,  8,  5
};
static const u16 sFontSmallJapaneseGlyphs[] = INCBIN_U16("graphics/fonts/japanese_small.fwjpnfont");

static const u16 sFontNormalCopy1LatinGlyphs[] = INCBIN_U16("graphics/fonts/latin_normal.latfont");
static const u8 sFontNormalCopy1LatinGlyphWidths[] =
{
     6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,
     6,  6,  8,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,
     6,  6,  6,  6,  6,  6,  6,  6,  6,  8,  6,  6,  6,  6,
     6,  6,  9,  8,  8,  6,  6,  6,  6,  6, 10,  8,  5,  6,
     6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,
     6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  8,
     8,  8,  8,  8,  8,  4,  6,  8,  5,  5,  6,  6,  6,  6,
     6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,
     6,  6,  6,  6,  6,  6,  6,  6,  6, 12, 12, 12, 12,  6,
     6,  6,  6,  6,  6,  6,  8,  8,  8,  6,  6,  6,  6,  6,
     6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,
     6,  6,  6,  6,  6,  6,  8,  6,  6,  6,  6,  6,  6,  6,
     6,  6,  6,  6,  6,  5,  6,  5,  6,  6,  6,  3,  3,  6,
     6,  8,  5,  9,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,
     6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,
     6,  6,  6,  6,  6,  6,  6,  6,  5,  6,  6,  4,  6,  5,
     5,  6,  5,  6,  6,  6,  5,  5,  5,  6,  6,  6,  6,  6,
     6,  8,  5,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,
     6,  6,  6,  6, 12, 12, 12, 12,  8, 10, 10, 10, 10, 10,
    10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
     6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,
     6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,
     6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,
     6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,
     6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,
     6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,
     6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,
     6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,
     6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,
     6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,
     6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,
     6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,
     6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,
     6,  6,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,
     8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,
     8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,
     8,  8,  8,  8,  8,  8,  8,  6
};
static const u16 sFontTallJapaneseGlyphs[] = INCBIN_U16("graphics/fonts/japanese_tall.fwjpnfont");

static const u16 sFontNormalLatinGlyphs[] = INCBIN_U16("graphics/fonts/latin_normal.latfont");
static const u8 sFontNormalLatinGlyphWidths[] =
{
     6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,
     6,  6,  8,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,
     6,  6,  6,  6,  6,  6,  6,  6,  6,  8,  6,  6,  6,  6,
     6,  6,  9,  8,  8,  6,  6,  6,  6,  6, 10,  8,  5,  6,
     6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,
     6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  8,
     8,  8,  8,  8,  8,  4,  6,  8,  5,  5,  6,  6,  6,  6,
     6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,
     6,  6,  6,  6,  6,  6,  6,  6,  6, 12, 12, 12, 12,  6,
     6,  6,  6,  6,  6,  6,  8,  8,  8,  6,  6,  6,  6,  6,
     6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,
     6,  6,  6,  6,  6,  6,  8,  6,  6,  6,  6,  6,  6,  6,
     6,  6,  6,  6,  6,  5,  6,  5,  6,  6,  6,  3,  3,  6,
     6,  8,  5,  9,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,
     6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,
     6,  6,  6,  6,  6,  6,  6,  6,  5,  6,  6,  4,  6,  5,
     5,  6,  5,  6,  6,  6,  5,  5,  5,  6,  6,  6,  6,  6,
     6,  8,  5,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,
     6,  6,  6,  6, 12, 12, 12, 12,  8, 10, 10, 10, 10, 10,
    10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
     6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,
     6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,
     6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,
     6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,
     6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,
     6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,
     6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,
     6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,
     6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,
     6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,
     6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,
     6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,
     6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,
     6,  6,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,
     8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,
     8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,
     8,  8,  8,  8,  8,  8,  8,  6
};
static const u16 sFontNormalJapaneseGlyphs[] = INCBIN_U16("graphics/fonts/japanese_normal.fwjpnfont");
static const u8 sFontNormalJapaneseGlyphWidths[] =
{
     0, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
    10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
    10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
    10, 10, 10, 10, 10,  9,  9,  9,  9,  9,  9,  9,  9, 10,
    10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
    10, 10, 10, 10, 10, 10, 10, 10, 10, 10,  9, 10, 10, 10,
    10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
    10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
    10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
    10,  9,  9,  9,  9,  9,  9,  9,  9, 10, 10, 10, 10, 10,
    10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
    10, 10, 10, 10, 10, 10,  9,  8,  7,  8,  8,  8,  8,  8,
     8,  8,  8,  5,  9, 10, 10, 10,  8, 10, 10, 10, 10,  8,
     8,  8, 10, 10,  8,  6,  6,  6,  6,  6,  6,  6,  6,  6,
     6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,
     6,  6,  6,  6,  6,  6,  6,  6,  5,  6,  6,  2,  4,  6,
     3,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,
     6,  6,  5,  6,  6,  6,  6,  6,  6,  0,  0,  0,  0,  0,
     0,  0,  0,  0, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
    10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,  0
};

static const u16 sFontMaleLatinGlyphs[] = INCBIN_U16("graphics/fonts/latin_male.latfont");
static const u8 sFontMaleLatinGlyphWidths[] =
{
     6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,
     6,  6,  8,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,
     6,  6,  6,  6,  6,  6,  6,  6,  6,  8,  6,  6,  6,  6,
     6,  6,  9,  8,  8,  6,  6,  6,  6,  6, 10,  8,  5,  6,
     6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,
     6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  8,
     8,  8,  8,  8,  8,  4,  6,  8,  5,  5,  6,  6,  6,  6,
     6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,
     6,  6,  6,  6,  6,  6,  6,  6,  6, 12, 12, 12, 12,  6,
     6,  6,  6,  6,  6,  6,  8,  8,  8,  6,  6,  6,  6,  6,
     6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,
     6,  6,  6,  6,  6,  6,  8,  6,  6,  6,  6,  6,  6,  6,
     6,  6,  6,  6,  6,  5,  6,  5,  6,  6,  6,  3,  3,  6,
     6,  8,  5,  9,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,
     6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,
     6,  6,  6,  6,  6,  6,  6,  6,  5,  6,  6,  4,  6,  5,
     5,  6,  5,  6,  6,  6,  5,  5,  5,  6,  6,  6,  6,  6,
     6,  8,  5,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,
     6,  6,  6,  6, 12, 12, 12, 12,  8, 10, 10, 10, 10, 10,
    10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
     6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,
     6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,
     6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,
     6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,
     6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,
     6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,
     6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,
     6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,
     6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,
     6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,
     6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,
     6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,
     6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,
     6,  6,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,
     8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,
     8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,
     8,  8,  8,  8,  8,  8,  8,  6
};
static const u16 sFontMaleJapaneseGlyphs[] = INCBIN_U16("graphics/fonts/japanese_male.fwjpnfont");
static const u8 sFontMaleJapaneseGlyphWidths[] = 
{
     0, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
    10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
    10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
    10, 10, 10, 10, 10, 10,  9,  9,  9,  9,  9,  9,  9, 10,
    10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
    10, 10, 10, 10, 10, 10, 10, 10, 10, 10,  9, 10, 10, 10,
    10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
    10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
    10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
    10,  9,  9,  9,  9,  9,  9,  9,  9, 10, 10, 10, 10, 10,
    10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
    10, 10, 10, 10, 10, 10,  9,  8,  7,  8,  8,  8,  8,  8,
     8,  8,  8,  5,  9, 10, 10, 10,  8, 10, 10, 10, 10,  8,
     8,  8, 10, 10,  8,  6,  6,  6,  6,  6,  6,  6,  6,  6,
     6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,
     6,  6,  6,  6,  6,  6,  6,  6,  5,  6,  6,  2,  4,  6,
     3,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,
     6,  6,  5,  6,  6,  6,  6,  6,  6,  0,  0,  0,  0,  0,
     0,  0,  0,  0, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
    10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,  0
};

static const u16 sFontFemaleLatinGlyphs[] = INCBIN_U16("graphics/fonts/latin_female.latfont");
static const u8 sFontFemaleLatinGlyphWidths[] =
{
     6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,
     6,  6,  8,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,
     6,  6,  6,  6,  6,  6,  6,  6,  6,  8,  6,  6,  6,  6,
     6,  6,  9,  8,  8,  6,  6,  6,  6,  6, 10,  8,  5,  6,
     6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,
     6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  8,
     8,  8,  8,  8,  8,  4,  6,  8,  5,  5,  6,  6,  6,  6,
     6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,
     6,  6,  6,  6,  6,  6,  6,  6,  6, 12, 12, 12, 12,  6,
     6,  6,  6,  6,  6,  6,  8,  8,  8,  6,  6,  6,  6,  6,
     6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,
     6,  6,  6,  6,  6,  6,  8,  6,  6,  6,  6,  6,  6,  6,
     6,  6,  6,  6,  6,  5,  6,  5,  6,  6,  6,  3,  3,  6,
     6,  8,  5,  9,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,
     6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,
     6,  6,  6,  6,  6,  6,  6,  6,  5,  6,  6,  4,  6,  5,
     5,  6,  5,  6,  6,  6,  5,  5,  5,  6,  6,  6,  6,  6,
     6,  8,  5,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,
     6,  6,  6,  6, 12, 12, 12, 12,  8, 10, 10, 10, 10, 10,
    10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
     6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,
     6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,
     6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,
     6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,
     6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,
     6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,
     6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,
     6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,
     6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,
     6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,
     6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,
     6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,
     6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,
     6,  6,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,
     8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,
     8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,
     8,  8,  8,  8,  8,  8,  8,  6
};
static const u16 sFontFemaleJapaneseGlyphs[] = INCBIN_U16("graphics/fonts/japanese_female.fwjpnfont");
static const u8 sFontFemaleJapaneseGlyphWidths[] =
{
     0, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
    10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
    10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
    10, 10, 10, 10, 10,  9,  9,  9,  9,  9,  9,  9,  9, 10,
    10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
    10, 10, 10, 10, 10, 10, 10, 10, 10, 10,  9, 10, 10, 10,
    10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
    10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
    10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
    10,  9,  9,  9,  9,  9,  9,  9,  8, 10, 10, 10, 10, 10,
    10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
    10, 10, 10, 10, 10, 10,  9,  8,  7,  8,  8,  8,  8,  8,
     8,  8,  8,  5,  9, 10, 10, 10,  8, 10, 10, 10, 10,  8,
     8,  8, 10, 10,  8,  6,  6,  6,  6,  6,  6,  6,  6,  6,
     6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,
     6,  6,  6,  6,  6,  6,  6,  6,  5,  6,  6,  2,  4,  6,
     3,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,
     6,  6,  5,  6,  6,  6,  6,  6,  6,  0,  0,  0,  0,  0,
     0,  0,  0,  0, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
    10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,  0
};

static const u16 sFontBoldJapaneseGlyphs[] = INCBIN_U16("graphics/fonts/japanese_bold.fwjpnfont");

u16 FontFunc_Small(struct TextPrinter *textPrinter)
{
    struct TextPrinterSubStruct *subStruct = &textPrinter->subUnion.sub;

    if (subStruct->hasGlyphIdBeenSet == 0)
    {
        textPrinter->subUnion.sub.glyphId = FONT_SMALL;
        subStruct->hasGlyphIdBeenSet = 1;
    }
    return RenderText(textPrinter);
}

u16 FontFunc_NormalCopy1(struct TextPrinter *textPrinter)
{
    struct TextPrinterSubStruct *subStruct = &textPrinter->subUnion.sub;

    if (subStruct->hasGlyphIdBeenSet == 0)
    {
        textPrinter->subUnion.sub.glyphId = FONT_NORMAL_COPY_1;
        subStruct->hasGlyphIdBeenSet = 1;
    }
    return RenderText(textPrinter);
}

u16 FontFunc_Normal(struct TextPrinter *textPrinter)
{
    struct TextPrinterSubStruct *subStruct = &textPrinter->subUnion.sub;

    if (subStruct->hasGlyphIdBeenSet == 0)
    {
        textPrinter->subUnion.sub.glyphId = FONT_NORMAL;
        subStruct->hasGlyphIdBeenSet = 1;
    }
    return RenderText(textPrinter);
}

u16 FontFunc_NormalCopy2(struct TextPrinter *textPrinter)
{
    struct TextPrinterSubStruct *subStruct = &textPrinter->subUnion.sub;

    if (subStruct->hasGlyphIdBeenSet == 0)
    {
        textPrinter->subUnion.sub.glyphId = FONT_NORMAL_COPY_2;
        subStruct->hasGlyphIdBeenSet = 1;
    }
    return RenderText(textPrinter);
}

u16 FontFunc_Male(struct TextPrinter *textPrinter)
{
    struct TextPrinterSubStruct *subStruct = &textPrinter->subUnion.sub;

    if (subStruct->hasGlyphIdBeenSet == 0)
    {
        textPrinter->subUnion.sub.glyphId = FONT_MALE;
        subStruct->hasGlyphIdBeenSet = 1;
    }
    return RenderText(textPrinter);
}

u16 FontFunc_Female(struct TextPrinter *textPrinter)
{
    struct TextPrinterSubStruct *subStruct = &textPrinter->subUnion.sub;

    if (subStruct->hasGlyphIdBeenSet == 0)
    {
        textPrinter->subUnion.sub.glyphId = FONT_FEMALE;
        subStruct->hasGlyphIdBeenSet = 1;
    }
    return RenderText(textPrinter);
}

void TextPrinterInitDownArrowCounters(struct TextPrinter *textPrinter)
{
    struct TextPrinterSubStruct *subStruct = &textPrinter->subUnion.sub;

    if (gTextFlags.autoScroll == 1)
        subStruct->autoScrollDelay = 0;
    else
    {
        subStruct->downArrowYPosIdx = 0;
        subStruct->downArrowDelay = 0;
    }
}

void TextPrinterDrawDownArrow(struct TextPrinter *textPrinter)
{
    struct TextPrinterSubStruct *subStruct = &textPrinter->subUnion.sub;
    const u8 *arrowTiles;

    if (gTextFlags.autoScroll == 0)
    {
        if (subStruct->downArrowDelay != 0)
        {
            subStruct->downArrowDelay = ((*(u32 *)&textPrinter->subUnion.sub) << 19 >> 27) - 1;    // convoluted way of getting field_1, necessary to match
        }
        else
        {
            FillWindowPixelRect(
                textPrinter->printerTemplate.windowId,
                textPrinter->printerTemplate.bgColor << 4 | textPrinter->printerTemplate.bgColor,
                textPrinter->printerTemplate.currentX,
                textPrinter->printerTemplate.currentY,
                10,
                12);

            switch (gTextFlags.useAlternateDownArrow)
            {
                case 0:
                default:
                    arrowTiles = sDownArrowTiles;
                    break;
                case 1:
                    arrowTiles = &sDownArrowTiles[DARK_DOWN_ARROW_OFFSET];
                    break;
            }

            BlitBitmapRectToWindow(
                textPrinter->printerTemplate.windowId,
                arrowTiles,
                sDownArrowYCoords[subStruct->downArrowYPosIdx],
                0,
                0x80,
                0x10,
                textPrinter->printerTemplate.currentX,
                textPrinter->printerTemplate.currentY,
                10,
                12);
            CopyWindowToVram(textPrinter->printerTemplate.windowId, 0x2);

            subStruct->downArrowDelay = CURSOR_DELAY;
            subStruct->downArrowYPosIdx = (*(u32 *)subStruct << 17 >> 30) + 1;
        }
    }
}

void TextPrinterClearDownArrow(struct TextPrinter *textPrinter)
{
    FillWindowPixelRect(
        textPrinter->printerTemplate.windowId,
        textPrinter->printerTemplate.bgColor << 4 | textPrinter->printerTemplate.bgColor,
        textPrinter->printerTemplate.currentX,
        textPrinter->printerTemplate.currentY,
        10,
        12);
    CopyWindowToVram(textPrinter->printerTemplate.windowId, 0x2);
}

bool8 TextPrinterWaitAutoMode(struct TextPrinter *textPrinter)
{
    struct TextPrinterSubStruct *subStruct = &textPrinter->subUnion.sub;
    u8 delay = (gQuestLogState == QL_STATE_PLAYBACK) ? 50 : 120;

    if (subStruct->autoScrollDelay == delay)
    {
        return TRUE;
    }
    else
    {
        subStruct->autoScrollDelay++;
        return FALSE;
    }
}

bool16 TextPrinterWaitWithDownArrow(struct TextPrinter *textPrinter)
{
    bool8 result = FALSE;
    if (gTextFlags.autoScroll != 0)
    {
        result = TextPrinterWaitAutoMode(textPrinter);
    }
    else
    {
        TextPrinterDrawDownArrow(textPrinter);
        if (JOY_NEW(A_BUTTON | B_BUTTON))
        {
            result = TRUE;
            PlaySE(SE_SELECT);
        }
    }
    return result;
}

bool16 TextPrinterWait(struct TextPrinter *textPrinter)
{
    bool16 result = FALSE;
    if (gTextFlags.autoScroll != 0)
    {
        result = TextPrinterWaitAutoMode(textPrinter);
    }
    else
    {
        if (JOY_NEW(A_BUTTON | B_BUTTON))
        {
            result = TRUE;
            PlaySE(SE_SELECT);
        }
    }
    return result;
}

void DrawDownArrow(u8 windowId, u16 x, u16 y, u8 bgColor, bool8 drawArrow, u8 *counter, u8 *yCoordIndex)
{
    const u8 *arrowTiles;

    if (*counter != 0)
    {
        --*counter;
    }
    else
    {
        FillWindowPixelRect(windowId, (bgColor << 4) | bgColor, x, y, 10, 12);
        if (drawArrow == 0)
        {
            switch (gTextFlags.useAlternateDownArrow)
            {
                case 0:
                default:
                    arrowTiles = sDownArrowTiles;
                    break;
                case 1:
                    arrowTiles = &sDownArrowTiles[DARK_DOWN_ARROW_OFFSET];
                    break;
            }

            BlitBitmapRectToWindow(
                windowId,
                arrowTiles,
                sDownArrowYCoords[*yCoordIndex & 3],
                0,
                0x80,
                0x10,
                x,
                y,
                10,
                12);
            CopyWindowToVram(windowId, 0x2);
            *counter = CURSOR_DELAY;
            ++*yCoordIndex;
        }
    }
}

u16 RenderText(struct TextPrinter *textPrinter)
{
    struct TextPrinterSubStruct *subStruct = &textPrinter->subUnion.sub;
    u16 currChar;
    s32 width;
    s32 widthHelper;

    switch (textPrinter->state)
    {
    case RENDER_STATE_HANDLE_CHAR:
        if (JOY_HELD(A_BUTTON | B_BUTTON) && subStruct->hasPrintBeenSpedUp)
            textPrinter->delayCounter = 0;

        if (textPrinter->delayCounter && textPrinter->textSpeed)
        {
            textPrinter->delayCounter--;
            if (gTextFlags.canABSpeedUpPrint && JOY_NEW(A_BUTTON | B_BUTTON))
            {
                subStruct->hasPrintBeenSpedUp = TRUE;
                textPrinter->delayCounter = 0;
            }
            return RENDER_UPDATE;
        }

        if (gTextFlags.autoScroll)
            textPrinter->delayCounter = 1;
        else
            textPrinter->delayCounter = textPrinter->textSpeed;

        currChar = *textPrinter->printerTemplate.currentChar;
        textPrinter->printerTemplate.currentChar++;

        switch (currChar)
        {
        case CHAR_NEWLINE:
            textPrinter->printerTemplate.currentX = textPrinter->printerTemplate.x;
            textPrinter->printerTemplate.currentY += gFonts[textPrinter->printerTemplate.fontId].maxLetterHeight + textPrinter->printerTemplate.lineSpacing;
            return RENDER_REPEAT;
        case PLACEHOLDER_BEGIN:
            textPrinter->printerTemplate.currentChar++;
            return RENDER_REPEAT;
        case EXT_CTRL_CODE_BEGIN:
            currChar = *textPrinter->printerTemplate.currentChar;
            textPrinter->printerTemplate.currentChar++;
            switch (currChar)
            {
            case EXT_CTRL_CODE_COLOR:
                textPrinter->printerTemplate.fgColor = *textPrinter->printerTemplate.currentChar;
                textPrinter->printerTemplate.currentChar++;
                GenerateFontHalfRowLookupTable(textPrinter->printerTemplate.fgColor, textPrinter->printerTemplate.bgColor, textPrinter->printerTemplate.shadowColor);
                return RENDER_REPEAT;
            case EXT_CTRL_CODE_HIGHLIGHT:
                textPrinter->printerTemplate.bgColor = *textPrinter->printerTemplate.currentChar;
                textPrinter->printerTemplate.currentChar++;
                GenerateFontHalfRowLookupTable(textPrinter->printerTemplate.fgColor, textPrinter->printerTemplate.bgColor, textPrinter->printerTemplate.shadowColor);
                return RENDER_REPEAT;
            case EXT_CTRL_CODE_SHADOW:
                textPrinter->printerTemplate.shadowColor = *textPrinter->printerTemplate.currentChar;
                textPrinter->printerTemplate.currentChar++;
                GenerateFontHalfRowLookupTable(textPrinter->printerTemplate.fgColor, textPrinter->printerTemplate.bgColor, textPrinter->printerTemplate.shadowColor);
                return RENDER_REPEAT;
            case EXT_CTRL_CODE_COLOR_HIGHLIGHT_SHADOW:
                textPrinter->printerTemplate.fgColor = *textPrinter->printerTemplate.currentChar;
                textPrinter->printerTemplate.currentChar++;
                textPrinter->printerTemplate.bgColor = *textPrinter->printerTemplate.currentChar;
                textPrinter->printerTemplate.currentChar++;
                textPrinter->printerTemplate.shadowColor = *textPrinter->printerTemplate.currentChar;
                textPrinter->printerTemplate.currentChar++;
                GenerateFontHalfRowLookupTable(textPrinter->printerTemplate.fgColor, textPrinter->printerTemplate.bgColor, textPrinter->printerTemplate.shadowColor);
                return RENDER_REPEAT;
            case EXT_CTRL_CODE_PALETTE:
                textPrinter->printerTemplate.currentChar++;
                return RENDER_REPEAT;
            case EXT_CTRL_CODE_FONT:
                subStruct->glyphId = *textPrinter->printerTemplate.currentChar;
                textPrinter->printerTemplate.currentChar++;
                return RENDER_REPEAT;
            case EXT_CTRL_CODE_RESET_FONT:
                return RENDER_REPEAT;
            case EXT_CTRL_CODE_PAUSE:
                textPrinter->delayCounter = *textPrinter->printerTemplate.currentChar;
                textPrinter->printerTemplate.currentChar++;
                textPrinter->state = RENDER_STATE_PAUSE;
                return RENDER_REPEAT;
            case EXT_CTRL_CODE_PAUSE_UNTIL_PRESS:
                textPrinter->state = RENDER_STATE_WAIT;
                if (gTextFlags.autoScroll)
                    subStruct->autoScrollDelay = 0;
                return RENDER_UPDATE;
            case EXT_CTRL_CODE_WAIT_SE:
                textPrinter->state = RENDER_STATE_WAIT_SE;
                return RENDER_UPDATE;
            case EXT_CTRL_CODE_PLAY_BGM:
                currChar = *textPrinter->printerTemplate.currentChar;
                textPrinter->printerTemplate.currentChar++;
                currChar |= *textPrinter->printerTemplate.currentChar << 8;
                textPrinter->printerTemplate.currentChar++;
                if (!QL_IS_PLAYBACK_STATE)
                    PlayBGM(currChar);
                return RENDER_REPEAT;
            case EXT_CTRL_CODE_PLAY_SE:
                currChar = *textPrinter->printerTemplate.currentChar;
                textPrinter->printerTemplate.currentChar++;
                currChar |= (*textPrinter->printerTemplate.currentChar << 8);
                textPrinter->printerTemplate.currentChar++;
                PlaySE(currChar);
                return RENDER_REPEAT;
            case EXT_CTRL_CODE_ESCAPE:
                textPrinter->printerTemplate.currentChar++;
                currChar = *textPrinter->printerTemplate.currentChar;
                break;
            case EXT_CTRL_CODE_SHIFT_RIGHT:
                textPrinter->printerTemplate.currentX = textPrinter->printerTemplate.x + *textPrinter->printerTemplate.currentChar;
                textPrinter->printerTemplate.currentChar++;
                return RENDER_REPEAT;
            case EXT_CTRL_CODE_SHIFT_DOWN:
                textPrinter->printerTemplate.currentY = textPrinter->printerTemplate.y + *textPrinter->printerTemplate.currentChar;
                textPrinter->printerTemplate.currentChar++;
                return RENDER_REPEAT;
            case EXT_CTRL_CODE_FILL_WINDOW:
                FillWindowPixelBuffer(textPrinter->printerTemplate.windowId, PIXEL_FILL(textPrinter->printerTemplate.bgColor));
                return RENDER_REPEAT;
            case EXT_CTRL_CODE_PAUSE_MUSIC:
                m4aMPlayStop(&gMPlayInfo_BGM);
                return RENDER_REPEAT;
            case EXT_CTRL_CODE_RESUME_MUSIC:
                m4aMPlayContinue(&gMPlayInfo_BGM);
                return RENDER_REPEAT;
            case EXT_CTRL_CODE_CLEAR:
                width = *textPrinter->printerTemplate.currentChar;
                textPrinter->printerTemplate.currentChar++;
                if (width > 0)
                {
                    ClearTextSpan(textPrinter, width);
                    textPrinter->printerTemplate.currentX += width;
                    return RENDER_PRINT;
                }
                return RENDER_REPEAT;
            case EXT_CTRL_CODE_SKIP:
                textPrinter->printerTemplate.currentX = *textPrinter->printerTemplate.currentChar + textPrinter->printerTemplate.x;
                textPrinter->printerTemplate.currentChar++;
                return RENDER_REPEAT;
            case EXT_CTRL_CODE_CLEAR_TO:
                {
                    widthHelper = *textPrinter->printerTemplate.currentChar;
                    widthHelper += textPrinter->printerTemplate.x;
                    textPrinter->printerTemplate.currentChar++;
                    width = widthHelper - textPrinter->printerTemplate.currentX;
                    if (width > 0)
                    {
                        ClearTextSpan(textPrinter, width);
                        textPrinter->printerTemplate.currentX += width;
                        return RENDER_PRINT;
                    }
                }
                return RENDER_REPEAT;
            case EXT_CTRL_CODE_MIN_LETTER_SPACING:
                textPrinter->minLetterSpacing = *textPrinter->printerTemplate.currentChar++;
                return RENDER_REPEAT;
            case EXT_CTRL_CODE_JPN:
                textPrinter->japanese = TRUE;
                return RENDER_REPEAT;
            case EXT_CTRL_CODE_ENG:
                textPrinter->japanese = FALSE;
                return RENDER_REPEAT;
            }
            break;
        case CHAR_PROMPT_CLEAR:
            textPrinter->state = RENDER_STATE_CLEAR;
            TextPrinterInitDownArrowCounters(textPrinter);
            return RENDER_UPDATE;
        case CHAR_PROMPT_SCROLL:
            textPrinter->state = RENDER_STATE_SCROLL_START;
            TextPrinterInitDownArrowCounters(textPrinter);
            return RENDER_UPDATE;
        case CHAR_EXTRA_SYMBOL:
            currChar = *textPrinter->printerTemplate.currentChar | 0x100;
            textPrinter->printerTemplate.currentChar++;
            break;
        case CHAR_KEYPAD_ICON:
            currChar = *textPrinter->printerTemplate.currentChar++;
            gGlyphInfo.width = DrawKeypadIcon(textPrinter->printerTemplate.windowId, currChar, textPrinter->printerTemplate.currentX, textPrinter->printerTemplate.currentY);
            textPrinter->printerTemplate.currentX += gGlyphInfo.width + textPrinter->printerTemplate.letterSpacing;
            return RENDER_PRINT;
        case EOS:
            return RENDER_FINISH;
        }

        switch (subStruct->glyphId)
        {
        case FONT_SMALL:
            DecompressGlyph_Small(currChar, textPrinter->japanese);
            break;
        case FONT_NORMAL_COPY_1:
            DecompressGlyph_NormalCopy1(currChar, textPrinter->japanese);
            break;
        case FONT_NORMAL:
            DecompressGlyph_Normal(currChar, textPrinter->japanese);
            break;
        case FONT_NORMAL_COPY_2:
            DecompressGlyph_NormalCopy2(currChar, textPrinter->japanese);
            break;
        case FONT_MALE:
            DecompressGlyph_Male(currChar, textPrinter->japanese);
            break;
        case FONT_FEMALE:
            DecompressGlyph_Female(currChar, textPrinter->japanese);
            break;
        }

        CopyGlyphToWindow(textPrinter);

        if (textPrinter->minLetterSpacing)
        {
            textPrinter->printerTemplate.currentX += gGlyphInfo.width;
            width = textPrinter->minLetterSpacing - gGlyphInfo.width;
            if (width > 0)
            {
                ClearTextSpan(textPrinter, width);
                textPrinter->printerTemplate.currentX += width;
            }
        }
        else
        {
            if (textPrinter->japanese)
                textPrinter->printerTemplate.currentX += (gGlyphInfo.width + textPrinter->printerTemplate.letterSpacing);
            else
                textPrinter->printerTemplate.currentX += gGlyphInfo.width;
        }
        return RENDER_PRINT;
    case RENDER_STATE_WAIT:
        if (TextPrinterWait(textPrinter))
            textPrinter->state = RENDER_STATE_HANDLE_CHAR;
        return RENDER_UPDATE;
    case RENDER_STATE_CLEAR:
        if (TextPrinterWaitWithDownArrow(textPrinter))
        {
            FillWindowPixelBuffer(textPrinter->printerTemplate.windowId, PIXEL_FILL(textPrinter->printerTemplate.bgColor));
            textPrinter->printerTemplate.currentX = textPrinter->printerTemplate.x;
            textPrinter->printerTemplate.currentY = textPrinter->printerTemplate.y;
            textPrinter->state = RENDER_STATE_HANDLE_CHAR;
        }
        return RENDER_UPDATE;
    case RENDER_STATE_SCROLL_START:
        if (TextPrinterWaitWithDownArrow(textPrinter))
        {
            TextPrinterClearDownArrow(textPrinter);
            textPrinter->scrollDistance = gFonts[textPrinter->printerTemplate.fontId].maxLetterHeight + textPrinter->printerTemplate.lineSpacing;
            textPrinter->printerTemplate.currentX = textPrinter->printerTemplate.x;
            textPrinter->state = RENDER_STATE_SCROLL;
        }
        return RENDER_UPDATE;
    case RENDER_STATE_SCROLL:
        if (textPrinter->scrollDistance)
        {
    
            if (textPrinter->scrollDistance < sWindowVerticalScrollSpeeds[gSaveBlock2Ptr->optionsTextSpeed])
            {
                ScrollWindow(textPrinter->printerTemplate.windowId, 0, textPrinter->scrollDistance, PIXEL_FILL(textPrinter->printerTemplate.bgColor));
                textPrinter->scrollDistance = 0;
            }
            else
            {
                ScrollWindow(textPrinter->printerTemplate.windowId, 0, sWindowVerticalScrollSpeeds[gSaveBlock2Ptr->optionsTextSpeed], PIXEL_FILL(textPrinter->printerTemplate.bgColor));
                textPrinter->scrollDistance -= sWindowVerticalScrollSpeeds[gSaveBlock2Ptr->optionsTextSpeed];
            }
            CopyWindowToVram(textPrinter->printerTemplate.windowId, COPYWIN_GFX);
        }
        else
        {
            textPrinter->state = RENDER_STATE_HANDLE_CHAR;
        }
        return RENDER_UPDATE;
    case RENDER_STATE_WAIT_SE:
        if (!IsSEPlaying())
            textPrinter->state = RENDER_STATE_HANDLE_CHAR;
        return RENDER_UPDATE;
    case RENDER_STATE_PAUSE:
        if (textPrinter->delayCounter != 0)
            textPrinter->delayCounter--;
        else
            textPrinter->state = RENDER_STATE_HANDLE_CHAR;
        return RENDER_UPDATE;
    }

    return RENDER_FINISH;
}

// Unused
static s32 GetStringWidthFixedWidthFont(const u8 *str, u8 fontId, u8 letterSpacing)
{
    int i;
    u8 width;
    int temp;
    int temp2;
    u8 line;
    int strPos;
    u8 lineWidths[8];
    const u8 *strLocal;

    for (i = 0; i < (int)ARRAY_COUNT(lineWidths); i++)
        lineWidths[i] = 0;

    width = 0;
    line = 0;
    strLocal = str;
    strPos = 0;

    do
    {
        temp = strLocal[strPos++];
        switch (temp)
        {
        case CHAR_NEWLINE:
        case EOS:
            lineWidths[line] = width;
            width = 0;
            line++;
            break;
        case EXT_CTRL_CODE_BEGIN:
            temp2 = strLocal[strPos++];
            switch (temp2)
            {
            case EXT_CTRL_CODE_COLOR_HIGHLIGHT_SHADOW:
                ++strPos;
            case EXT_CTRL_CODE_PLAY_BGM:
            case EXT_CTRL_CODE_PLAY_SE:
                ++strPos;
            case EXT_CTRL_CODE_COLOR:
            case EXT_CTRL_CODE_HIGHLIGHT:
            case EXT_CTRL_CODE_SHADOW:
            case EXT_CTRL_CODE_PALETTE:
            case EXT_CTRL_CODE_FONT:
            case EXT_CTRL_CODE_PAUSE:
            case EXT_CTRL_CODE_ESCAPE:
            case EXT_CTRL_CODE_SHIFT_RIGHT:
            case EXT_CTRL_CODE_SHIFT_DOWN:
            case EXT_CTRL_CODE_CLEAR:
            case EXT_CTRL_CODE_SKIP:
            case EXT_CTRL_CODE_CLEAR_TO:
            case EXT_CTRL_CODE_MIN_LETTER_SPACING:
                ++strPos;
                break;
            case EXT_CTRL_CODE_RESET_FONT:
            case EXT_CTRL_CODE_PAUSE_UNTIL_PRESS:
            case EXT_CTRL_CODE_WAIT_SE:
            case EXT_CTRL_CODE_FILL_WINDOW:
            case EXT_CTRL_CODE_JPN:
            case EXT_CTRL_CODE_ENG:
            default:
                break;
            }
            break;
        case CHAR_DYNAMIC:
        case PLACEHOLDER_BEGIN:
            ++strPos;
            break;
        case CHAR_PROMPT_SCROLL:
        case CHAR_PROMPT_CLEAR:
            break;
        case CHAR_KEYPAD_ICON:
        case CHAR_EXTRA_SYMBOL:
            ++strPos;
        default:
            ++width;
            break;
        }
    } while (temp != EOS);

    for (width = 0, strPos = 0; strPos < (int)ARRAY_COUNT(lineWidths); ++strPos)
    {
        if (width < lineWidths[strPos])
            width = lineWidths[strPos];
    }

    return (u8)(GetFontAttribute(fontId, FONTATTR_MAX_LETTER_WIDTH) + letterSpacing) * width;
}

s32 (*GetFontWidthFunc(u8 glyphId))(u16 _glyphId, bool32 _isJapanese)
{
    u32 i;

    for (i = 0; i < ARRAY_COUNT(sGlyphWidthFuncs); ++i)
    {
        if (glyphId == sGlyphWidthFuncs[i].fontId)
            return *sGlyphWidthFuncs[i].func;
    }

    return NULL;
}

s32 GetStringWidth(u8 fontId, const u8 *str, s16 letterSpacing)
{
    bool8 isJapanese;
    int minGlyphWidth;
    s32 (*func)(u16 glyphId, bool32 isJapanese);
    int localLetterSpacing;
    u32 lineWidth;
    const u8 *bufferPointer;
    int glyphWidth;
    u32 width;

    isJapanese = FALSE;
    minGlyphWidth = 0;

    func = GetFontWidthFunc(fontId);
    if (func == NULL)
        return 0;

    if (letterSpacing == -1)
        localLetterSpacing = GetFontAttribute(fontId, FONTATTR_LETTER_SPACING);
    else
        localLetterSpacing = letterSpacing;

    width = 0;
    lineWidth = 0;
    bufferPointer = NULL;

    while (*str != EOS)
    {
        switch (*str)
        {
        case CHAR_NEWLINE:
            if (lineWidth > width)
                width = lineWidth;
            lineWidth = 0;
            break;
        case PLACEHOLDER_BEGIN:
            switch (*++str)
            {
                case PLACEHOLDER_ID_STRING_VAR_1:
                    bufferPointer = gStringVar1;
                    break;
                case PLACEHOLDER_ID_STRING_VAR_2:
                    bufferPointer = gStringVar2;
                    break;
                case PLACEHOLDER_ID_STRING_VAR_3:
                    bufferPointer = gStringVar3;
                    break;
                default:
                    return 0;
            }
        case CHAR_DYNAMIC:
            if (bufferPointer == NULL)
                bufferPointer = DynamicPlaceholderTextUtil_GetPlaceholderPtr(*++str);
            while (*bufferPointer != EOS)
            {
                glyphWidth = func(*bufferPointer++, isJapanese);
                if (minGlyphWidth > 0)
                    lineWidth += minGlyphWidth > glyphWidth ? minGlyphWidth : glyphWidth;
                else
                    lineWidth += isJapanese ? glyphWidth + localLetterSpacing : glyphWidth;
            }
            bufferPointer = NULL;
            break;
        case CHAR_PROMPT_SCROLL:
        case CHAR_PROMPT_CLEAR:
            break;
        case EXT_CTRL_CODE_BEGIN:
            switch (*++str)
            {
            case EXT_CTRL_CODE_COLOR_HIGHLIGHT_SHADOW:
                ++str;
            case EXT_CTRL_CODE_PLAY_BGM:
            case EXT_CTRL_CODE_PLAY_SE:
                ++str;
            case EXT_CTRL_CODE_COLOR:
            case EXT_CTRL_CODE_HIGHLIGHT:
            case EXT_CTRL_CODE_SHADOW:
            case EXT_CTRL_CODE_PALETTE:
            case EXT_CTRL_CODE_PAUSE:
            case EXT_CTRL_CODE_ESCAPE:
            case EXT_CTRL_CODE_SHIFT_RIGHT:
            case EXT_CTRL_CODE_SHIFT_DOWN:
                ++str;
            case EXT_CTRL_CODE_RESET_FONT:
            case EXT_CTRL_CODE_PAUSE_UNTIL_PRESS:
            case EXT_CTRL_CODE_WAIT_SE:
            case EXT_CTRL_CODE_FILL_WINDOW:
                break;
            case EXT_CTRL_CODE_FONT:
                func = GetFontWidthFunc(*++str);
                if (func == NULL)
                    return 0;
                if (letterSpacing == -1)
                    localLetterSpacing = GetFontAttribute(*str, FONTATTR_LETTER_SPACING);
                break;
            case EXT_CTRL_CODE_CLEAR:
                glyphWidth = *++str;
                lineWidth += glyphWidth;
                break;
            case EXT_CTRL_CODE_SKIP:
                lineWidth = *++str;
                break;
            case EXT_CTRL_CODE_CLEAR_TO:
                if (*++str > lineWidth)
                    lineWidth = *str;
                break;
            case EXT_CTRL_CODE_MIN_LETTER_SPACING:
                minGlyphWidth = *++str;
                break;
            case EXT_CTRL_CODE_JPN:
                isJapanese = TRUE;
                break;
            case EXT_CTRL_CODE_ENG:
                isJapanese = FALSE;
            default:
                break;
            }
            break;
        case CHAR_KEYPAD_ICON:
        case CHAR_EXTRA_SYMBOL:
            if (*str == CHAR_EXTRA_SYMBOL)
                glyphWidth = func(*++str | 0x100, isJapanese);
            else
                glyphWidth = GetKeypadIconWidth(*++str);

            if (minGlyphWidth > 0)
            {
                if (glyphWidth < minGlyphWidth)
                    glyphWidth = minGlyphWidth;
            }
            else if (isJapanese)
            {
                glyphWidth += localLetterSpacing;
            }
            lineWidth += glyphWidth;
            break;
        default:
            glyphWidth = func(*str, isJapanese);
            if (minGlyphWidth > 0)
            {
                if (glyphWidth < minGlyphWidth)
                    glyphWidth = minGlyphWidth;
                lineWidth += glyphWidth;
            }
            else
            {
                if (fontId != FONT_BRAILLE && isJapanese)
                    glyphWidth += localLetterSpacing;
                lineWidth += glyphWidth;
            }
            break;
        }
        ++str;
    }

    if (lineWidth > width)
        return lineWidth;
    return width;
}

u8 RenderTextHandleBold(u8 *pixels, u8 fontId, u8 *str, int a3, int a4, int a5, int a6, int a7)
{
    u8 shadowColor;
    u8 *strLocal;
    int strPos;
    int temp;
    int temp2;
    u8 colorBackup[3];
    u8 fgColor;
    u8 bgColor;

    SaveTextColors(&colorBackup[0], &colorBackup[1], &colorBackup[2]);

    fgColor = 1;
    bgColor = 0;
    shadowColor = 3;

    GenerateFontHalfRowLookupTable(TEXT_COLOR_WHITE, TEXT_COLOR_TRANSPARENT, TEXT_COLOR_LIGHT_GRAY);
    strLocal = str;
    strPos = 0;

    do
    {
        temp = strLocal[strPos++];
        switch (temp)
        {
        case EXT_CTRL_CODE_BEGIN:
            temp2 = strLocal[strPos++];
            switch (temp2)
            {
            case EXT_CTRL_CODE_COLOR_HIGHLIGHT_SHADOW:
                fgColor = strLocal[strPos++];
                bgColor = strLocal[strPos++];
                shadowColor = strLocal[strPos++];
                GenerateFontHalfRowLookupTable(fgColor, bgColor, shadowColor);
                continue;
            case EXT_CTRL_CODE_COLOR:
                fgColor = strLocal[strPos++];
                GenerateFontHalfRowLookupTable(fgColor, bgColor, shadowColor);
                continue;
            case EXT_CTRL_CODE_HIGHLIGHT:
                bgColor = strLocal[strPos++];
                GenerateFontHalfRowLookupTable(fgColor, bgColor, shadowColor);
                continue;
            case EXT_CTRL_CODE_SHADOW:
                shadowColor = strLocal[strPos++];
                GenerateFontHalfRowLookupTable(fgColor, bgColor, shadowColor);
                continue;
            case EXT_CTRL_CODE_FONT:
                fontId = strLocal[strPos++];
                break;
            case EXT_CTRL_CODE_PLAY_BGM:
            case EXT_CTRL_CODE_PLAY_SE:
                ++strPos;
            case EXT_CTRL_CODE_PALETTE:
            case EXT_CTRL_CODE_PAUSE:
            case EXT_CTRL_CODE_ESCAPE:
            case EXT_CTRL_CODE_SHIFT_RIGHT:
            case EXT_CTRL_CODE_SHIFT_DOWN:
            case EXT_CTRL_CODE_CLEAR:
            case EXT_CTRL_CODE_SKIP:
            case EXT_CTRL_CODE_CLEAR_TO:
            case EXT_CTRL_CODE_MIN_LETTER_SPACING:
                ++strPos;
                break;
            case EXT_CTRL_CODE_RESET_FONT:
            case EXT_CTRL_CODE_PAUSE_UNTIL_PRESS:
            case EXT_CTRL_CODE_WAIT_SE:
            case EXT_CTRL_CODE_FILL_WINDOW:
            case EXT_CTRL_CODE_JPN:
            case EXT_CTRL_CODE_ENG:
            default:
                continue;
            }
            break;
        case CHAR_DYNAMIC:
        case CHAR_KEYPAD_ICON:
        case CHAR_EXTRA_SYMBOL:
        case PLACEHOLDER_BEGIN:
            ++strPos;
            break;
        case CHAR_PROMPT_SCROLL:
        case CHAR_PROMPT_CLEAR:
        case CHAR_NEWLINE:
        case EOS:
            break;
        default:
            DecompressGlyph_Bold(temp);
            CpuCopy32(gGlyphInfo.pixels, pixels, 0x20);
            CpuCopy32(gGlyphInfo.pixels + 0x40, pixels + 0x20, 0x20);
            pixels += 0x40;
            break;
        }
    }
    while (temp != EOS);

    RestoreTextColors(&colorBackup[0], &colorBackup[1], &colorBackup[2]);
    return 1;
}

#define sDelay data[0]
#define sState data[1]

static void SpriteCB_TextCursor(struct Sprite *sprite)
{
    if (sprite->sDelay)
    {
        sprite->sDelay--;
    }
    else
    {
        sprite->sDelay = CURSOR_DELAY;
        switch(sprite->sState)
        {
        case 0:
            sprite->y2 = 0;
            break;
        case 1:
            sprite->y2 = 1;
            break;
        case 2:
            sprite->y2 = 2;
            break;
        case 3:
            sprite->y2 = 1;
            sprite->sState = 0;
            return;
        }
        sprite->sState++;
    }
}

u8 CreateTextCursorSprite(u8 sheetId, u16 x, u16 y, u8 priority, u8 subpriority)
{
    u8 spriteId;
    LoadSpriteSheet(&sSpriteSheets_TextCursor[sheetId & 1]);
    LoadSpritePalette(&sSpritePalettes_TextCursor[0]);
    spriteId = CreateSprite(&sSpriteTemplate_TextCursor, x + 3, y + 4, subpriority);
    gSprites[spriteId].oam.priority = (priority & 3);
    gSprites[spriteId].oam.matrixNum = 0;
    gSprites[spriteId].sDelay = CURSOR_DELAY;
    return spriteId;
}

void DestroyTextCursorSprite(u8 spriteId)
{
    DestroySprite(&gSprites[spriteId]);
    FreeSpriteTilesByTag(TAG_CURSOR);
    FreeSpritePaletteByTag(TAG_CURSOR);
}

#undef sDelay
#undef sState

u8 DrawKeypadIcon(u8 windowId, u8 keypadIconId, u16 x, u16 y)
{
    BlitBitmapRectToWindow(
        windowId,
        gKeypadIconTiles + (sKeypadIcons[keypadIconId].tileOffset * 0x20),
        0,
        0,
        0x80,
        0x80,
        x,
        y,
        sKeypadIcons[keypadIconId].width,
        sKeypadIcons[keypadIconId].height);
    return sKeypadIcons[keypadIconId].width;
}

u8 GetKeypadIconTileOffset(u8 keypadIconId)
{
    return sKeypadIcons[keypadIconId].tileOffset;
}

u8 GetKeypadIconWidth(u8 keypadIconId)
{
    return sKeypadIcons[keypadIconId].width;
}

u8 GetKeypadIconHeight(u8 keypadIconId)
{
    return sKeypadIcons[keypadIconId].height;
}

void DecompressGlyph_Small(u16 glyphId, bool32 isJapanese)
{
    const u16 *glyphs;

    if (isJapanese == TRUE)
    {
        glyphs = sFontSmallJapaneseGlyphs + (0x100 * (glyphId >> 0x4)) + (0x8 * (glyphId & 0xF));
        DecompressGlyphTile(glyphs, (u16 *)gGlyphInfo.pixels);
        DecompressGlyphTile(glyphs + 0x80, (u16 *)(gGlyphInfo.pixels + 0x40));
        gGlyphInfo.width = 8;
        gGlyphInfo.height = 12;
    }
    else
    {
        glyphs = sFontSmallLatinGlyphs + (0x10 * glyphId);
        DecompressGlyphTile(glyphs, (u16 *)gGlyphInfo.pixels);
        DecompressGlyphTile(glyphs + 0x8, (u16 *)(gGlyphInfo.pixels + 0x40));
        gGlyphInfo.width = sFontSmallLatinGlyphWidths[glyphId];
        gGlyphInfo.height = 13;
    }
}

static s32 GetGlyphWidth_Small(u16 glyphId, bool32 isJapanese)
{
    if (isJapanese == TRUE)
        return 8;
    else
        return sFontSmallLatinGlyphWidths[glyphId];
}

static void DecompressGlyph_NormalCopy1(u16 glyphId, bool32 isJapanese)
{
    const u16 *glyphs;

    if (isJapanese == TRUE)
    {
        // This font only differs from the Normal font in Japanese
        int eff;
        glyphs = sFontTallJapaneseGlyphs + (0x100 * (glyphId >> 0x4)) + (0x8 * (glyphId & (eff = 0xF)));  // shh, no questions, only matching now
        DecompressGlyphTile(glyphs, (u16 *)gGlyphInfo.pixels);
        DecompressGlyphTile(glyphs + 0x80, (u16 *)(gGlyphInfo.pixels + 0x40));
        gGlyphInfo.width = 8;
        gGlyphInfo.height = 16;
    }
    else
    {
        glyphs = sFontNormalCopy1LatinGlyphs + (0x20 * glyphId);
        DecompressGlyphTile(glyphs, (u16 *)gGlyphInfo.pixels);
        DecompressGlyphTile(glyphs + 0x8, (u16 *)(gGlyphInfo.pixels + 0x20));
        DecompressGlyphTile(glyphs + 0x10, (u16 *)(gGlyphInfo.pixels + 0x40));
        DecompressGlyphTile(glyphs + 0x18, (u16 *)(gGlyphInfo.pixels + 0x60));
        gGlyphInfo.width = sFontNormalCopy1LatinGlyphWidths[glyphId];
        gGlyphInfo.height = 14;
    }
}

static s32 GetGlyphWidth_NormalCopy1(u16 glyphId, bool32 isJapanese)
{
    if (isJapanese == TRUE)
        return 8;
    else
        return sFontNormalCopy1LatinGlyphWidths[glyphId];
}

void DecompressGlyph_Normal(u16 glyphId, bool32 isJapanese)
{
    const u16 *glyphs;
    int i;
    u8 lastColor;

    if (isJapanese == TRUE)
    {
        if (glyphId == 0)
        {
            lastColor = GetLastTextColor(2);

            for(i = 0; i < 0x80; i++)
            {
                gGlyphInfo.pixels[i] = lastColor | lastColor << 4;
                // Game Freak, please. writing the same values over and over...
                gGlyphInfo.width = 10;
                gGlyphInfo.height = 12;
            }
        }
        else
        {
            glyphs = sFontNormalJapaneseGlyphs + (0x100 * (glyphId >> 0x3)) + (0x10 * (glyphId & 0x7));
            DecompressGlyphTile(glyphs, (u16 *)gGlyphInfo.pixels);
            DecompressGlyphTile(glyphs + 0x8, (u16 *)(gGlyphInfo.pixels + 0x20));
            DecompressGlyphTile(glyphs + 0x80, (u16 *)(gGlyphInfo.pixels + 0x40));
            DecompressGlyphTile(glyphs + 0x88, (u16 *)(gGlyphInfo.pixels + 0x60));
            gGlyphInfo.width = sFontNormalJapaneseGlyphWidths[glyphId];
            gGlyphInfo.height = 12;
        }
    }
    else
    {
        if (glyphId == 0)
        {
            lastColor = GetLastTextColor(2);

            for(i = 0; i < 0x80; i++)
            {
                gGlyphInfo.pixels[i] = lastColor | lastColor << 4;
                // but why
                gGlyphInfo.width = sFontNormalLatinGlyphWidths[0];
                gGlyphInfo.height = 14;
            }
        }
        else
        {
            glyphs = sFontNormalLatinGlyphs + (0x20 * glyphId);
            DecompressGlyphTile(glyphs, (u16 *)gGlyphInfo.pixels);
            DecompressGlyphTile(glyphs + 0x8, (u16 *)(gGlyphInfo.pixels + 0x20));
            DecompressGlyphTile(glyphs + 0x10, (u16 *)(gGlyphInfo.pixels + 0x40));
            DecompressGlyphTile(glyphs + 0x18, (u16 *)(gGlyphInfo.pixels + 0x60));
            gGlyphInfo.width = sFontNormalLatinGlyphWidths[glyphId];
            gGlyphInfo.height = 14;
        }
    }
}

static s32 GetGlyphWidth_Normal(u16 glyphId, bool32 isJapanese)
{
    if (isJapanese == TRUE)
    {
        if (glyphId == 0)
            return 10;

        return sFontNormalJapaneseGlyphWidths[glyphId];
    }
    else
    {
        return sFontNormalLatinGlyphWidths[glyphId];
    }
}

static void DecompressGlyph_NormalCopy2(u16 glyphId, bool32 isJapanese)
{
    const u16 *glyphs;
    int i;
    u8 lastColor;

    if (isJapanese == TRUE)
    {
        if (glyphId == 0)
        {
            lastColor = GetLastTextColor(2);

            for(i = 0; i < 0x80; i++)
            {
                gGlyphInfo.pixels[i] = lastColor | lastColor << 4;
                // Game Freak, please. writing the same values over and over...
                gGlyphInfo.width = 10;
                gGlyphInfo.height = 12;
            }
        }
        else
        {
            glyphs = sFontNormalJapaneseGlyphs + (0x100 * (glyphId >> 0x3)) + (0x10 * (glyphId & 0x7));
            DecompressGlyphTile(glyphs, (u16 *)gGlyphInfo.pixels);
            DecompressGlyphTile(glyphs + 0x8, (u16 *)(gGlyphInfo.pixels + 0x20));
            DecompressGlyphTile(glyphs + 0x80, (u16 *)(gGlyphInfo.pixels + 0x40));
            DecompressGlyphTile(glyphs + 0x88, (u16 *)(gGlyphInfo.pixels + 0x60));
            gGlyphInfo.width = 10;
            gGlyphInfo.height = 12;
        }
    }
    else
        DecompressGlyph_Normal(glyphId, isJapanese);
}

static s32 GetGlyphWidth_NormalCopy2(u16 glyphId, bool32 isJapanese)
{
    if (isJapanese == TRUE)
        return 10;
    else
        return sFontNormalLatinGlyphWidths[glyphId];
}

static void DecompressGlyph_Male(u16 glyphId, bool32 isJapanese)
{
    const u16 *glyphs;
    int i;
    u8 lastColor;

    if (isJapanese == TRUE)
    {
        if (glyphId == 0)
        {
            lastColor = GetLastTextColor(2);

            for(i = 0; i < 0x80; i++)
            {
                gGlyphInfo.pixels[i] = lastColor | lastColor << 4;
                // Game Freak, please. writing the same values over and over...
                gGlyphInfo.width = 10;
                gGlyphInfo.height = 12;
            }
        }
        else
        {
            glyphs = sFontMaleJapaneseGlyphs + (0x100 * (glyphId >> 0x3)) + (0x10 * (glyphId & 0x7));
            DecompressGlyphTile(glyphs, (u16 *)gGlyphInfo.pixels);
            DecompressGlyphTile(glyphs + 0x8, (u16 *)(gGlyphInfo.pixels + 0x20));
            DecompressGlyphTile(glyphs + 0x80, (u16 *)(gGlyphInfo.pixels + 0x40));
            DecompressGlyphTile(glyphs + 0x88, (u16 *)(gGlyphInfo.pixels + 0x60));
            gGlyphInfo.width = sFontMaleJapaneseGlyphWidths[glyphId];
            gGlyphInfo.height = 12;
        }
    }
    else
    {
        if (glyphId == 0)
        {
            lastColor = GetLastTextColor(2);

            for(i = 0; i < 0x80; i++)
            {
                gGlyphInfo.pixels[i] = lastColor | lastColor << 4;
                // but why
                gGlyphInfo.width = sFontMaleLatinGlyphWidths[0];
                gGlyphInfo.height = 14;
            }
        }
        else
        {
            glyphs = sFontMaleLatinGlyphs + (0x20 * glyphId);
            DecompressGlyphTile(glyphs, (u16 *)gGlyphInfo.pixels);
            DecompressGlyphTile(glyphs + 0x8, (u16 *)(gGlyphInfo.pixels + 0x20));
            DecompressGlyphTile(glyphs + 0x10, (u16 *)(gGlyphInfo.pixels + 0x40));
            DecompressGlyphTile(glyphs + 0x18, (u16 *)(gGlyphInfo.pixels + 0x60));
            gGlyphInfo.width = sFontMaleLatinGlyphWidths[glyphId];
            gGlyphInfo.height = 14;
        }
    }
}

static s32 GetGlyphWidth_Male(u16 glyphId, bool32 isJapanese)
{
    if (isJapanese == TRUE)
    {
        if (glyphId == 0)
            return 10;

        return sFontMaleJapaneseGlyphWidths[glyphId];
    }
    else
        return sFontMaleLatinGlyphWidths[glyphId];
}

void DecompressGlyph_Female(u16 glyphId, bool32 isJapanese)
{
    const u16 *glyphs;
    int i;
    u8 lastColor;

    if (isJapanese == TRUE)
    {
        if (glyphId == 0)
        {
            lastColor = GetLastTextColor(2);

            for(i = 0; i < 0x80; i++)
            {
                gGlyphInfo.pixels[i] = lastColor | lastColor << 4;
                // Game Freak, please. writing the same values over and over...
                gGlyphInfo.width = 10;
                gGlyphInfo.height = 12;
            }
        }
        else
        {
            glyphs = sFontFemaleJapaneseGlyphs + (0x100 * (glyphId >> 0x3)) + (0x10 * (glyphId & 0x7));
            DecompressGlyphTile(glyphs, (u16 *)gGlyphInfo.pixels);
            DecompressGlyphTile(glyphs + 0x8, (u16 *)(gGlyphInfo.pixels + 0x20));
            DecompressGlyphTile(glyphs + 0x80, (u16 *)(gGlyphInfo.pixels + 0x40));
            DecompressGlyphTile(glyphs + 0x88, (u16 *)(gGlyphInfo.pixels + 0x60));
            gGlyphInfo.width = sFontFemaleJapaneseGlyphWidths[glyphId];
            gGlyphInfo.height = 12;
        }
    }
    else
    {
        if (glyphId == 0)
        {
            lastColor = GetLastTextColor(2);

            for(i = 0; i < 0x80; i++)
            {
                gGlyphInfo.pixels[i] = lastColor | lastColor << 4;
                // but why
                gGlyphInfo.width = sFontFemaleLatinGlyphWidths[0];
                gGlyphInfo.height = 14;
            }
        }
        else
        {
            glyphs = sFontFemaleLatinGlyphs + (0x20 * glyphId);
            DecompressGlyphTile(glyphs, (u16 *)gGlyphInfo.pixels);
            DecompressGlyphTile(glyphs + 0x8, (u16 *)(gGlyphInfo.pixels + 0x20));
            DecompressGlyphTile(glyphs + 0x10, (u16 *)(gGlyphInfo.pixels + 0x40));
            DecompressGlyphTile(glyphs + 0x18, (u16 *)(gGlyphInfo.pixels + 0x60));
            gGlyphInfo.width = sFontFemaleLatinGlyphWidths[glyphId];
            gGlyphInfo.height = 14;
        }
    }
}

static s32 GetGlyphWidth_Female(u16 glyphId, bool32 isJapanese)
{
    if (isJapanese == TRUE)
    {
        if (glyphId == 0)
            return 10;
        
        return sFontFemaleJapaneseGlyphWidths[glyphId];
    }
    else
        return sFontFemaleLatinGlyphWidths[glyphId];
}

static void DecompressGlyph_Bold(u16 glyphId)
{
    const u16 *glyphs = sFontBoldJapaneseGlyphs + (0x100 * (glyphId >> 0x4)) + (0x8 * (glyphId & 0xF));
    DecompressGlyphTile(glyphs, (u16 *)gGlyphInfo.pixels);
    DecompressGlyphTile(glyphs + 0x80, (u16 *)(gGlyphInfo.pixels + 0x40));
    gGlyphInfo.width = 8;
    gGlyphInfo.height = 12;
}
