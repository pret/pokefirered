#include "global.h"

#include "battle.h"
#include "blit.h"
#include "dynamic_placeholder_text_util.h"
#include "fonts.h"
#include "graphics.h"
#include "m4a.h"
#include "main.h"
#include "menu.h"
#include "palette.h"
#include "quest_log.h"
#include "sound.h"
#include "string_util.h"
#include "text.h"
#include "window.h"
#include "constants/songs.h"

#define TAG_CURSOR 0x8000

#define CURSOR_DELAY 8

extern const struct OamData gOamData_AffineOff_ObjNormal_16x16;

static void DecompressGlyph_NormalCopy1(u16 glyphId, bool32 isJapanese);
static void DecompressGlyph_NormalCopy2(u16 glyphId, bool32 isJapanese);
static void DecompressGlyph_Male(u16 glyphId, bool32 isJapanese);
static void DecompressGlyph_Bold(u16 glyphId);
static void DecompressGlyph_Narrow(u16, bool32);
static void DecompressGlyph_SmallNarrow(u16, bool32);
static void DecompressGlyph_Narrower(u16, bool32);
static void DecompressGlyph_SmallNarrower(u16, bool32);
static void DecompressGlyph_ShortNarrow(u16, bool32);
static u32 GetGlyphWidth_Small(u16 glyphId, bool32 isJapanese);
static u32 GetGlyphWidth_NormalCopy1(u16 glyphId, bool32 isJapanese);
static u32 GetGlyphWidth_Normal(u16 glyphId, bool32 isJapanese);
static u32 GetGlyphWidth_NormalCopy2(u16 glyphId, bool32 isJapanese);
static u32 GetGlyphWidth_Male(u16 glyphId, bool32 isJapanese);
static u32 GetGlyphWidth_Female(u16 glyphId, bool32 isJapanese);
static u32 GetGlyphWidth_Narrow(u16, bool32);
static u32 GetGlyphWidth_SmallNarrow(u16, bool32);
static u32 GetGlyphWidth_Narrower(u16, bool32);
static u32 GetGlyphWidth_SmallNarrower(u16, bool32);
static u32 GetGlyphWidth_ShortNarrow(u16, bool32);
static void SpriteCB_TextCursor(struct Sprite *sprite);

static EWRAM_DATA struct TextPrinter sTempTextPrinter = {0};
static EWRAM_DATA struct TextPrinter sTextPrinters[NUM_TEXT_PRINTERS] = {0};

static u16 sFontHalfRowLookupTable[0x51];
static u16 sLastTextBgColor;
static u16 sLastTextFgColor;
static u16 sLastTextShadowColor;

const struct FontInfo *gFonts;
struct GlyphInfo gGlyphInfo;
TextFlags gTextFlags;

static const u8 sFontHalfRowOffsets[] =
{
    0x00, 0x01, 0x02, 0x00, 0x03, 0x04, 0x05, 0x03, 0x06, 0x07, 0x08, 0x06, 0x00, 0x01, 0x02, 0x00,
    0x09, 0x0A, 0x0B, 0x09, 0x0C, 0x0D, 0x0E, 0x0C, 0x0F, 0x10, 0x11, 0x0F, 0x09, 0x0A, 0x0B, 0x09,
    0x12, 0x13, 0x14, 0x12, 0x15, 0x16, 0x17, 0x15, 0x18, 0x19, 0x1A, 0x18, 0x12, 0x13, 0x14, 0x12,
    0x00, 0x01, 0x02, 0x00, 0x03, 0x04, 0x05, 0x03, 0x06, 0x07, 0x08, 0x06, 0x00, 0x01, 0x02, 0x00,
    0x1B, 0x1C, 0x1D, 0x1B, 0x1E, 0x1F, 0x20, 0x1E, 0x21, 0x22, 0x23, 0x21, 0x1B, 0x1C, 0x1D, 0x1B,
    0x24, 0x25, 0x26, 0x24, 0x27, 0x28, 0x29, 0x27, 0x2A, 0x2B, 0x2C, 0x2A, 0x24, 0x25, 0x26, 0x24,
    0x2D, 0x2E, 0x2F, 0x2D, 0x30, 0x31, 0x32, 0x30, 0x33, 0x34, 0x35, 0x33, 0x2D, 0x2E, 0x2F, 0x2D,
    0x1B, 0x1C, 0x1D, 0x1B, 0x1E, 0x1F, 0x20, 0x1E, 0x21, 0x22, 0x23, 0x21, 0x1B, 0x1C, 0x1D, 0x1B,
    0x36, 0x37, 0x38, 0x36, 0x39, 0x3A, 0x3B, 0x39, 0x3C, 0x3D, 0x3E, 0x3C, 0x36, 0x37, 0x38, 0x36,
    0x3F, 0x40, 0x41, 0x3F, 0x42, 0x43, 0x44, 0x42, 0x45, 0x46, 0x47, 0x45, 0x3F, 0x40, 0x41, 0x3F,
    0x48, 0x49, 0x4A, 0x48, 0x4B, 0x4C, 0x4D, 0x4B, 0x4E, 0x4F, 0x50, 0x4E, 0x48, 0x49, 0x4A, 0x48,
    0x36, 0x37, 0x38, 0x36, 0x39, 0x3A, 0x3B, 0x39, 0x3C, 0x3D, 0x3E, 0x3C, 0x36, 0x37, 0x38, 0x36,
    0x00, 0x01, 0x02, 0x00, 0x03, 0x04, 0x05, 0x03, 0x06, 0x07, 0x08, 0x06, 0x00, 0x01, 0x02, 0x00,
    0x09, 0x0A, 0x0B, 0x09, 0x0C, 0x0D, 0x0E, 0x0C, 0x0F, 0x10, 0x11, 0x0F, 0x09, 0x0A, 0x0B, 0x09,
    0x12, 0x13, 0x14, 0x12, 0x15, 0x16, 0x17, 0x15, 0x18, 0x19, 0x1A, 0x18, 0x12, 0x13, 0x14, 0x12,
    0x00, 0x01, 0x02, 0x00, 0x03, 0x04, 0x05, 0x03, 0x06, 0x07, 0x08, 0x06, 0x00, 0x01, 0x02, 0x00
};

static const u8 sDownArrowTiles[]         = INCBIN_U8("graphics/fonts/down_arrow.4bpp");
static const u8 sDarkDownArrowTiles[]     = INCBIN_U8("graphics/fonts/down_arrow_RS.4bpp");
static const u8 sTinyArrowTiles[]         = INCBIN_U8("graphics/fonts/down_arrow_2.4bpp");
static const u8 sTinyDarkDownArrowTiles[] = INCBIN_U8("graphics/fonts/down_arrow_RS_2.4bpp");
static const u8 sDoubleArrowTiles1[]       = INCBIN_U8("graphics/fonts/down_arrow_3.4bpp");
static const u8 sDoubleArrowTiles2[]       = INCBIN_U8("graphics/fonts/down_arrow_4.4bpp");

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
    { FONT_BRAILLE,       GetGlyphWidth_Braille },
    { FONT_NARROW,         GetGlyphWidth_Narrow },
    { FONT_SMALL_NARROW,   GetGlyphWidth_SmallNarrow },
    { FONT_NARROWER,       GetGlyphWidth_Narrower },
    { FONT_SMALL_NARROWER, GetGlyphWidth_SmallNarrower },
    { FONT_SHORT_NARROW,   GetGlyphWidth_ShortNarrow },
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


static const u16 sFontBoldJapaneseGlyphs[] = INCBIN_U16("graphics/fonts/japanese_bold.fwjpnfont");

void SetFontsPointer(const struct FontInfo *fonts)
{
    gFonts = fonts;
}

void DeactivateAllTextPrinters (void)
{
    int printer;
    for (printer = 0; printer < NUM_TEXT_PRINTERS; ++printer)
        sTextPrinters[printer].active = 0;
}

u16 AddTextPrinterParameterized(u8 windowId, u8 fontId, const u8 *str, u8 x, u8 y, u8 speed, void (*callback)(struct TextPrinterTemplate *, u16))
{
    struct TextPrinterTemplate printerTemplate;

    printerTemplate.currentChar = str;
    printerTemplate.windowId = windowId;
    printerTemplate.fontId = fontId;
    printerTemplate.x = x;
    printerTemplate.y = y;
    printerTemplate.currentX = x;
    printerTemplate.currentY = y;
    printerTemplate.letterSpacing = gFonts[fontId].letterSpacing;
    printerTemplate.lineSpacing = gFonts[fontId].lineSpacing;
    printerTemplate.unk = gFonts[fontId].unk;
    printerTemplate.fgColor = gFonts[fontId].fgColor;
    printerTemplate.bgColor = gFonts[fontId].bgColor;
    printerTemplate.shadowColor = gFonts[fontId].shadowColor;
    return AddTextPrinter(&printerTemplate, speed, callback);
}

bool16 AddTextPrinter(struct TextPrinterTemplate *textSubPrinter, u8 speed, void (*callback)(struct TextPrinterTemplate *, u16))
{
    int i;
    u16 j;

    if (!gFonts)
        return FALSE;

    sTempTextPrinter.active = TRUE;
    sTempTextPrinter.state = RENDER_STATE_HANDLE_CHAR;
    sTempTextPrinter.textSpeed = speed;
    sTempTextPrinter.delayCounter = 0;
    sTempTextPrinter.scrollDistance = 0;

    for (i = 0; i < (int)ARRAY_COUNT(sTempTextPrinter.subUnion.fields); ++i)
        sTempTextPrinter.subUnion.fields[i] = 0;

    sTempTextPrinter.printerTemplate = *textSubPrinter;
    sTempTextPrinter.callback = callback;
    sTempTextPrinter.minLetterSpacing = 0;
    sTempTextPrinter.japanese = 0;

    GenerateFontHalfRowLookupTable(textSubPrinter->fgColor, textSubPrinter->bgColor, textSubPrinter->shadowColor);
    if (speed != TEXT_SKIP_DRAW && speed != 0)
    {
        --sTempTextPrinter.textSpeed;
        sTextPrinters[textSubPrinter->windowId] = sTempTextPrinter;
    }
    else
    {
        sTempTextPrinter.textSpeed = 0;
        
        // Render all text (up to limit) at once
        for (j = 0; j < 0x400; ++j)
        {
            if (RenderFont(&sTempTextPrinter) == RENDER_FINISH)
                break;
        }

        // All the text is rendered to the window but don't draw it yet.
        if (speed != TEXT_SKIP_DRAW)
          CopyWindowToVram(sTempTextPrinter.printerTemplate.windowId, COPYWIN_GFX);
        sTextPrinters[textSubPrinter->windowId].active = FALSE;
    }
    return TRUE;
}

void RunTextPrinters(void)
{
    int i;

    for (i = 0; i < NUM_TEXT_PRINTERS; ++i)
    {
        if (sTextPrinters[i].active)
        {
            u16 renderCmd = RenderFont(&sTextPrinters[i]);
            switch (renderCmd)
            {
            case RENDER_PRINT:
                CopyWindowToVram(sTextPrinters[i].printerTemplate.windowId, COPYWIN_GFX);
            case RENDER_UPDATE:
                if (sTextPrinters[i].callback != NULL)
                    sTextPrinters[i].callback(&sTextPrinters[i].printerTemplate, renderCmd);
                break;
            case RENDER_FINISH:
                sTextPrinters[i].active = FALSE;
                break;
            }
        }
    }
}

void GenerateFontHalfRowLookupTable(u8 fgColor, u8 bgColor, u8 shadowColor)
{
    int lutIndex;
    int i, j, k, l;
    const u32 colors[] = {bgColor, fgColor, shadowColor};

    sLastTextBgColor = bgColor;
    sLastTextFgColor = fgColor;
    sLastTextShadowColor = shadowColor;

    lutIndex = 0;

    for (i = 0; i < 3; i++)
        for (j = 0; j < 3; j++)
            for (k = 0; k < 3; k++)
                for (l = 0; l < 3; l++)
                    sFontHalfRowLookupTable[lutIndex++] = (colors[l] << 12) | (colors[k] << 8) | (colors[j] << 4) | colors[i];
}

bool16 IsTextPrinterActive(u8 id)
{
    return sTextPrinters[id].active;
}

u32 RenderFont(struct TextPrinter *textPrinter)
{
    u32 ret;
    while (TRUE)
    {
        ret = gFonts[textPrinter->printerTemplate.fontId].fontFunction(textPrinter);
        if (ret != 2)
            return ret;
    }
}

void SaveTextColors(u8 *fgColor, u8 *bgColor, u8 *shadowColor)
{
    *bgColor = sLastTextBgColor;
    *fgColor = sLastTextFgColor;
    *shadowColor = sLastTextShadowColor;
}

void RestoreTextColors(u8 *fgColor, u8 *bgColor, u8 *shadowColor)
{
    GenerateFontHalfRowLookupTable(*fgColor, *bgColor, *shadowColor);
}

void DecompressGlyphTile(const u16 *src, u16 *dest)
{
    int i;

    for (i = 0; i < 16; i++)
    {
        int offsetIndex = (i << 31) != 0 ? (u8)*src++ : (*src >> 8);
        dest[i] = sFontHalfRowLookupTable[sFontHalfRowOffsets[offsetIndex]];
    }
}


u8 GetLastTextColor(u8 colorType)
{
    switch (colorType)
    {
        case 0:
            return sLastTextFgColor;
        case 2:
            return sLastTextBgColor;
        case 1:
            return sLastTextShadowColor;
        default:
            return 0;
    }
}

#define GLYPH_COPY(widthOffset, heightOffset, width, height, tilesDest, left, top, sizeX)                                                    \
{                                                                                                                                            \
    int xAdd, xpos, yAdd, ypos, toOrr, bits;                                                                                                 \
    u8 * src, * dst;                                                                                                                         \
    u32 _8pixbuf;                                                                                                                            \
                                                                                                                                             \
    src = gGlyphInfo.pixels + (heightOffset / 8 * 0x40) + (widthOffset / 8 * 0x20);                                                          \
    for (yAdd = 0, ypos = top + heightOffset; yAdd < height; yAdd++, ypos++)                                                                 \
    {                                                                                                                                        \
        _8pixbuf = *(u32 *)src;                                                                                                              \
        for (xAdd = 0, xpos = left + widthOffset; xAdd < width; xAdd++, xpos++)                                                              \
        {                                                                                                                                    \
            dst = (u8 *)((tilesDest) + ((xpos >> 1) & 3) + ((xpos >> 3) << 5) + (((ypos >> 3) * (sizeX)) << 5) + ((u32)(ypos << 29) >> 27)); \
            toOrr = (_8pixbuf >> (xAdd * 4)) & 0xF;                                                                                          \
            if (toOrr != 0)                                                                                                                  \
            {                                                                                                                                \
                bits = (xpos & 1) * 4;                                                                                                       \
                *dst = (toOrr << bits) | (*dst & (0xF0 >> bits));                                                                            \
            }                                                                                                                                \
        }                                                                                                                                    \
        src += 4;                                                                                                                            \
    }                                                                                                                                        \
}

void CopyGlyphToWindow(struct TextPrinter *textPrinter)
{
    int glyphWidth, glyphHeight;
    u8 sizeType;
    
    if (gWindows[textPrinter->printerTemplate.windowId].window.width * 8 - textPrinter->printerTemplate.currentX < gGlyphInfo.width)
        glyphWidth = gWindows[textPrinter->printerTemplate.windowId].window.width * 8 - textPrinter->printerTemplate.currentX;
    else
        glyphWidth = gGlyphInfo.width;
    if (gWindows[textPrinter->printerTemplate.windowId].window.height * 8 - textPrinter->printerTemplate.currentY < gGlyphInfo.height)
        glyphHeight = gWindows[textPrinter->printerTemplate.windowId].window.height * 8 - textPrinter->printerTemplate.currentY;
    else
        glyphHeight = gGlyphInfo.height;

    sizeType = 0;
    if (glyphWidth > 8)
        sizeType |= 1;
    if (glyphHeight > 8)
        sizeType |= 2;
    
    switch (sizeType)
    {
        case 0: // ≤ 8x8
            GLYPH_COPY(0, 0, glyphWidth, glyphHeight, gWindows[textPrinter->printerTemplate.windowId].tileData, textPrinter->printerTemplate.currentX, textPrinter->printerTemplate.currentY, ((gWindows[textPrinter->printerTemplate.windowId].window.width * 8 + ((gWindows[textPrinter->printerTemplate.windowId].window.width * 8) & 7)) >> 3));
            return;
        case 1: // ≤ 16x8
            GLYPH_COPY(0, 0, 8, glyphHeight, gWindows[textPrinter->printerTemplate.windowId].tileData, textPrinter->printerTemplate.currentX, textPrinter->printerTemplate.currentY, ((gWindows[textPrinter->printerTemplate.windowId].window.width * 8 + ((gWindows[textPrinter->printerTemplate.windowId].window.width * 8) & 7)) >> 3));
            GLYPH_COPY(8, 0, glyphWidth - 8, glyphHeight, gWindows[textPrinter->printerTemplate.windowId].tileData, textPrinter->printerTemplate.currentX, textPrinter->printerTemplate.currentY, ((gWindows[textPrinter->printerTemplate.windowId].window.width * 8 + ((gWindows[textPrinter->printerTemplate.windowId].window.width * 8) & 7)) >> 3));
            return;
        case 2: // ≤ 8x16
            GLYPH_COPY(0, 0, glyphWidth, 8, gWindows[textPrinter->printerTemplate.windowId].tileData, textPrinter->printerTemplate.currentX, textPrinter->printerTemplate.currentY, ((gWindows[textPrinter->printerTemplate.windowId].window.width * 8 + ((gWindows[textPrinter->printerTemplate.windowId].window.width * 8) & 7)) >> 3));
            GLYPH_COPY(0, 8, glyphWidth, glyphHeight - 8, gWindows[textPrinter->printerTemplate.windowId].tileData, textPrinter->printerTemplate.currentX, textPrinter->printerTemplate.currentY, ((gWindows[textPrinter->printerTemplate.windowId].window.width * 8 + ((gWindows[textPrinter->printerTemplate.windowId].window.width * 8) & 7)) >> 3));
            return;
        case 3: // ≤ 16x16
            GLYPH_COPY(0, 0, 8, 8, gWindows[textPrinter->printerTemplate.windowId].tileData, textPrinter->printerTemplate.currentX, textPrinter->printerTemplate.currentY, ((gWindows[textPrinter->printerTemplate.windowId].window.width * 8 + ((gWindows[textPrinter->printerTemplate.windowId].window.width * 8) & 7)) >> 3));
            GLYPH_COPY(8, 0, glyphWidth - 8, 8, gWindows[textPrinter->printerTemplate.windowId].tileData, textPrinter->printerTemplate.currentX, textPrinter->printerTemplate.currentY, ((gWindows[textPrinter->printerTemplate.windowId].window.width * 8 + ((gWindows[textPrinter->printerTemplate.windowId].window.width * 8) & 7)) >> 3));
            GLYPH_COPY(0, 8, 8, glyphHeight - 8, gWindows[textPrinter->printerTemplate.windowId].tileData, textPrinter->printerTemplate.currentX, textPrinter->printerTemplate.currentY, ((gWindows[textPrinter->printerTemplate.windowId].window.width * 8 + ((gWindows[textPrinter->printerTemplate.windowId].window.width * 8) & 7)) >> 3));
            GLYPH_COPY(8, 8, glyphWidth - 8, glyphHeight - 8, gWindows[textPrinter->printerTemplate.windowId].tileData, textPrinter->printerTemplate.currentX, textPrinter->printerTemplate.currentY, ((gWindows[textPrinter->printerTemplate.windowId].window.width * 8 + ((gWindows[textPrinter->printerTemplate.windowId].window.width * 8) & 7)) >> 3));
            return;
    }
}

void ClearTextSpan(struct TextPrinter *textPrinter, u32 width)
{
    struct Window *window;
    struct Bitmap pixels_data;
    struct GlyphInfo *glyph;
    u8 *glyphHeight;

    if (sLastTextBgColor != TEXT_COLOR_TRANSPARENT)
    {
        window = &gWindows[textPrinter->printerTemplate.windowId];
        pixels_data.pixels = window->tileData;
        pixels_data.width = window->window.width << 3;
        pixels_data.height = window->window.height << 3;

        glyph = &gGlyphInfo;
        glyphHeight = &glyph->height;

        FillBitmapRect4Bit(
            &pixels_data,
            textPrinter->printerTemplate.currentX,
            textPrinter->printerTemplate.currentY,
            width,
            *glyphHeight,
            sLastTextBgColor);
    }
}

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

u16 FontFunc_Narrow(struct TextPrinter *textPrinter)
{
    struct TextPrinterSubStruct *subStruct = &textPrinter->subUnion.sub;

    if (subStruct->hasGlyphIdBeenSet == FALSE)
    {
        textPrinter->subUnion.sub.glyphId = FONT_NARROW;
        subStruct->hasGlyphIdBeenSet = TRUE;
    }
    return RenderText(textPrinter);
}

u16 FontFunc_SmallNarrow(struct TextPrinter *textPrinter)
{
    struct TextPrinterSubStruct *subStruct = &textPrinter->subUnion.sub;

    if (subStruct->hasGlyphIdBeenSet == FALSE)
    {
        textPrinter->subUnion.sub.glyphId = FONT_SMALL_NARROW;
        subStruct->hasGlyphIdBeenSet = TRUE;
    }
    return RenderText(textPrinter);
}

u16 FontFunc_Narrower(struct TextPrinter *textPrinter)
{
    struct TextPrinterSubStruct *subStruct = &textPrinter->subUnion.sub;

    if (subStruct->hasGlyphIdBeenSet == FALSE)
    {
        textPrinter->subUnion.sub.glyphId = FONT_NARROWER;
        subStruct->hasGlyphIdBeenSet = TRUE;
    }
    return RenderText(textPrinter);
}

u16 FontFunc_SmallNarrower(struct TextPrinter *textPrinter)
{
    struct TextPrinterSubStruct *subStruct = &textPrinter->subUnion.sub;

    if (subStruct->hasGlyphIdBeenSet == FALSE)
    {
        textPrinter->subUnion.sub.glyphId = FONT_SMALL_NARROWER;
        subStruct->hasGlyphIdBeenSet = TRUE;
    }
    return RenderText(textPrinter);
}

u16 FontFunc_ShortNarrow(struct TextPrinter *textPrinter)
{
    struct TextPrinterSubStruct *subStruct = &textPrinter->subUnion.sub;

    if (subStruct->hasGlyphIdBeenSet == FALSE)
    {
        textPrinter->subUnion.sub.glyphId = FONT_SHORT_NARROW;
        subStruct->hasGlyphIdBeenSet = TRUE;
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
                    arrowTiles = sDarkDownArrowTiles;
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
                    arrowTiles = sDarkDownArrowTiles;
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

        if (!(gBattleTypeFlags & BATTLE_TYPE_RECORDED) && gTextFlags.autoScroll)
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
        case FONT_NARROW:
            DecompressGlyph_Narrow(currChar, textPrinter->japanese);
            break;
        case FONT_SMALL_NARROW:
            DecompressGlyph_SmallNarrow(currChar, textPrinter->japanese);
            break;
        case FONT_NARROWER:
            DecompressGlyph_Narrower(currChar, textPrinter->japanese);
            break;
        case FONT_SMALL_NARROWER:
            DecompressGlyph_SmallNarrower(currChar, textPrinter->japanese);
            break;
        case FONT_SHORT_NARROW:
            DecompressGlyph_ShortNarrow(currChar, textPrinter->japanese);
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

u32 (*GetFontWidthFunc(u8 glyphId))(u16 _glyphId, bool32 _isJapanese)
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
    u32 (*func)(u16 glyphId, bool32 isJapanese);
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

u8 RenderTextHandleBold(u8 *pixels, u8 fontId, u8 *str)
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
        glyphs = gFontSmallJapaneseGlyphs + (0x100 * (glyphId >> 0x4)) + (0x8 * (glyphId & 0xF));
        DecompressGlyphTile(glyphs, (u16 *)gGlyphInfo.pixels);
        DecompressGlyphTile(glyphs + 0x80, (u16 *)(gGlyphInfo.pixels + 0x40));
        gGlyphInfo.width = 8;
        gGlyphInfo.height = 12;
    }
    else
    {
        glyphs = gFontSmallLatinGlyphs + (0x10 * glyphId);
        DecompressGlyphTile(glyphs, (u16 *)gGlyphInfo.pixels);
        DecompressGlyphTile(glyphs + 0x8, (u16 *)(gGlyphInfo.pixels + 0x40));
        gGlyphInfo.width = gFontSmallLatinGlyphWidths[glyphId];
        gGlyphInfo.height = 13;
    }
}

static u32 GetGlyphWidth_Small(u16 glyphId, bool32 isJapanese)
{
    if (isJapanese == TRUE)
        return 8;
    else
        return gFontSmallLatinGlyphWidths[glyphId];
}

static void DecompressGlyph_NormalCopy1(u16 glyphId, bool32 isJapanese)
{
    const u16 *glyphs;

    if (isJapanese == TRUE)
    {
        // This font only differs from the Normal font in Japanese
        int eff;
        glyphs = gFontTallJapaneseGlyphs + (0x100 * (glyphId >> 0x4)) + (0x8 * (glyphId & (eff = 0xF)));  // shh, no questions, only matching now
        DecompressGlyphTile(glyphs, (u16 *)gGlyphInfo.pixels);
        DecompressGlyphTile(glyphs + 0x80, (u16 *)(gGlyphInfo.pixels + 0x40));
        gGlyphInfo.width = 8;
        gGlyphInfo.height = 16;
    }
    else
    {
        glyphs = gFontNormalCopy1LatinGlyphs + (0x20 * glyphId);
        DecompressGlyphTile(glyphs, (u16 *)gGlyphInfo.pixels);
        DecompressGlyphTile(glyphs + 0x8, (u16 *)(gGlyphInfo.pixels + 0x20));
        DecompressGlyphTile(glyphs + 0x10, (u16 *)(gGlyphInfo.pixels + 0x40));
        DecompressGlyphTile(glyphs + 0x18, (u16 *)(gGlyphInfo.pixels + 0x60));
        gGlyphInfo.width = gFontNormalCopy1LatinGlyphWidths[glyphId];
        gGlyphInfo.height = 14;
    }
}

static u32 GetGlyphWidth_NormalCopy1(u16 glyphId, bool32 isJapanese)
{
    if (isJapanese == TRUE)
        return 8;
    else
        return gFontNormalCopy1LatinGlyphWidths[glyphId];
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
            glyphs = gFontNormalJapaneseGlyphs + (0x100 * (glyphId >> 0x3)) + (0x10 * (glyphId & 0x7));
            DecompressGlyphTile(glyphs, (u16 *)gGlyphInfo.pixels);
            DecompressGlyphTile(glyphs + 0x8, (u16 *)(gGlyphInfo.pixels + 0x20));
            DecompressGlyphTile(glyphs + 0x80, (u16 *)(gGlyphInfo.pixels + 0x40));
            DecompressGlyphTile(glyphs + 0x88, (u16 *)(gGlyphInfo.pixels + 0x60));
            gGlyphInfo.width = gFontNormalJapaneseGlyphWidths[glyphId];
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
                gGlyphInfo.width = gFontNormalLatinGlyphWidths[0];
                gGlyphInfo.height = 14;
            }
        }
        else
        {
            glyphs = gFontNormalLatinGlyphs + (0x20 * glyphId);
            DecompressGlyphTile(glyphs, (u16 *)gGlyphInfo.pixels);
            DecompressGlyphTile(glyphs + 0x8, (u16 *)(gGlyphInfo.pixels + 0x20));
            DecompressGlyphTile(glyphs + 0x10, (u16 *)(gGlyphInfo.pixels + 0x40));
            DecompressGlyphTile(glyphs + 0x18, (u16 *)(gGlyphInfo.pixels + 0x60));
            gGlyphInfo.width = gFontNormalLatinGlyphWidths[glyphId];
            gGlyphInfo.height = 14;
        }
    }
}

static u32 GetGlyphWidth_Normal(u16 glyphId, bool32 isJapanese)
{
    if (isJapanese == TRUE)
    {
        if (glyphId == 0)
            return 10;

        return gFontNormalJapaneseGlyphWidths[glyphId];
    }
    else
    {
        return gFontNormalLatinGlyphWidths[glyphId];
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
            glyphs = gFontNormalJapaneseGlyphs + (0x100 * (glyphId >> 0x3)) + (0x10 * (glyphId & 0x7));
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

static u32 GetGlyphWidth_NormalCopy2(u16 glyphId, bool32 isJapanese)
{
    if (isJapanese == TRUE)
        return 10;
    else
        return gFontNormalLatinGlyphWidths[glyphId];
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
            glyphs = gFontMaleJapaneseGlyphs + (0x100 * (glyphId >> 0x3)) + (0x10 * (glyphId & 0x7));
            DecompressGlyphTile(glyphs, (u16 *)gGlyphInfo.pixels);
            DecompressGlyphTile(glyphs + 0x8, (u16 *)(gGlyphInfo.pixels + 0x20));
            DecompressGlyphTile(glyphs + 0x80, (u16 *)(gGlyphInfo.pixels + 0x40));
            DecompressGlyphTile(glyphs + 0x88, (u16 *)(gGlyphInfo.pixels + 0x60));
            gGlyphInfo.width = gFontMaleJapaneseGlyphWidths[glyphId];
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
                gGlyphInfo.width = gFontMaleLatinGlyphWidths[0];
                gGlyphInfo.height = 14;
            }
        }
        else
        {
            glyphs = gFontMaleLatinGlyphs + (0x20 * glyphId);
            DecompressGlyphTile(glyphs, (u16 *)gGlyphInfo.pixels);
            DecompressGlyphTile(glyphs + 0x8, (u16 *)(gGlyphInfo.pixels + 0x20));
            DecompressGlyphTile(glyphs + 0x10, (u16 *)(gGlyphInfo.pixels + 0x40));
            DecompressGlyphTile(glyphs + 0x18, (u16 *)(gGlyphInfo.pixels + 0x60));
            gGlyphInfo.width = gFontMaleLatinGlyphWidths[glyphId];
            gGlyphInfo.height = 14;
        }
    }
}

static u32 GetGlyphWidth_Male(u16 glyphId, bool32 isJapanese)
{
    if (isJapanese == TRUE)
    {
        if (glyphId == 0)
            return 10;

        return gFontMaleJapaneseGlyphWidths[glyphId];
    }
    else
        return gFontMaleLatinGlyphWidths[glyphId];
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
            glyphs = gFontFemaleJapaneseGlyphs + (0x100 * (glyphId >> 0x3)) + (0x10 * (glyphId & 0x7));
            DecompressGlyphTile(glyphs, (u16 *)gGlyphInfo.pixels);
            DecompressGlyphTile(glyphs + 0x8, (u16 *)(gGlyphInfo.pixels + 0x20));
            DecompressGlyphTile(glyphs + 0x80, (u16 *)(gGlyphInfo.pixels + 0x40));
            DecompressGlyphTile(glyphs + 0x88, (u16 *)(gGlyphInfo.pixels + 0x60));
            gGlyphInfo.width = gFontFemaleJapaneseGlyphWidths[glyphId];
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
                gGlyphInfo.width = gFontFemaleLatinGlyphWidths[0];
                gGlyphInfo.height = 14;
            }
        }
        else
        {
            glyphs = gFontFemaleLatinGlyphs + (0x20 * glyphId);
            DecompressGlyphTile(glyphs, (u16 *)gGlyphInfo.pixels);
            DecompressGlyphTile(glyphs + 0x8, (u16 *)(gGlyphInfo.pixels + 0x20));
            DecompressGlyphTile(glyphs + 0x10, (u16 *)(gGlyphInfo.pixels + 0x40));
            DecompressGlyphTile(glyphs + 0x18, (u16 *)(gGlyphInfo.pixels + 0x60));
            gGlyphInfo.width = gFontFemaleLatinGlyphWidths[glyphId];
            gGlyphInfo.height = 14;
        }
    }
}

static u32 GetGlyphWidth_Female(u16 glyphId, bool32 isJapanese)
{
    if (isJapanese == TRUE)
    {
        if (glyphId == 0)
            return 10;
        
        return gFontFemaleJapaneseGlyphWidths[glyphId];
    }
    else
        return gFontFemaleLatinGlyphWidths[glyphId];
}

static void DecompressGlyph_Bold(u16 glyphId)
{
    const u16 *glyphs = sFontBoldJapaneseGlyphs + (0x100 * (glyphId >> 0x4)) + (0x8 * (glyphId & 0xF));
    DecompressGlyphTile(glyphs, (u16 *)gGlyphInfo.pixels);
    DecompressGlyphTile(glyphs + 0x80, (u16 *)(gGlyphInfo.pixels + 0x40));
    gGlyphInfo.width = 8;
    gGlyphInfo.height = 12;
}

static void DecompressGlyph_Narrow(u16 glyphId, bool32 isJapanese)
{
    const u16 *glyphs;

    if (isJapanese == TRUE)
    {
        glyphs = gFontNormalJapaneseGlyphs + (0x100 * (glyphId >> 0x4)) + (0x8 * (glyphId % 0x10));
        DecompressGlyphTile(glyphs, (u16 *)gGlyphInfo.pixels);
        DecompressGlyphTile(glyphs + 0x8, (u16 *)(gGlyphInfo.pixels + 0x20));
        DecompressGlyphTile(glyphs + 0x10, (u16 *)(gGlyphInfo.pixels + 0x40));
        DecompressGlyphTile(glyphs + 0x18, (u16 *)(gGlyphInfo.pixels + 0x60));
        gGlyphInfo.width = 8;
        gGlyphInfo.height = 15;
    }
    else
    {
        glyphs = gFontNarrowLatinGlyphs + (0x20 * glyphId);
        gGlyphInfo.width = gFontNarrowLatinGlyphWidths[glyphId];

        if (gGlyphInfo.width <= 8)
        {
            DecompressGlyphTile(glyphs, (u16 *)gGlyphInfo.pixels);
            DecompressGlyphTile(glyphs + 0x10, (u16 *)(gGlyphInfo.pixels + 0x40));
        }
        else
        {
            DecompressGlyphTile(glyphs, (u16 *)gGlyphInfo.pixels);
            DecompressGlyphTile(glyphs + 0x8, (u16 *)(gGlyphInfo.pixels + 0x20));
            DecompressGlyphTile(glyphs + 0x10, (u16 *)(gGlyphInfo.pixels + 0x40));
            DecompressGlyphTile(glyphs + 0x18, (u16 *)(gGlyphInfo.pixels + 0x60));
        }

        gGlyphInfo.height = 15;
    }
}

static u32 GetGlyphWidth_Narrow(u16 glyphId, bool32 isJapanese)
{
    if (isJapanese == TRUE)
        return 8;
    else
        return gFontNarrowLatinGlyphWidths[glyphId];
}

static void DecompressGlyph_SmallNarrow(u16 glyphId, bool32 isJapanese)
{
    const u16 *glyphs;

    if (isJapanese == TRUE)
    {
        glyphs = gFontNormalJapaneseGlyphs + (0x100 * (glyphId >> 0x4)) + (0x8 * (glyphId & 0xF));
            DecompressGlyphTile(glyphs, (u16 *)gGlyphInfo.pixels);
            DecompressGlyphTile(glyphs + 0x8, (u16 *)(gGlyphInfo.pixels + 0x20));
            DecompressGlyphTile(glyphs + 0x10, (u16 *)(gGlyphInfo.pixels + 0x40));
            DecompressGlyphTile(glyphs + 0x18, (u16 *)(gGlyphInfo.pixels + 0x60));
        gGlyphInfo.width = 8;
        gGlyphInfo.height = 12;
    }
    else
    {
        glyphs = gFontSmallNarrowLatinGlyphs + (0x20 * glyphId);
        gGlyphInfo.width = gFontSmallNarrowLatinGlyphWidths[glyphId];

        if (gGlyphInfo.width <= 8)
        {
            DecompressGlyphTile(glyphs, (u16 *)gGlyphInfo.pixels);
            DecompressGlyphTile(glyphs + 0x10, (u16 *)(gGlyphInfo.pixels + 0x40));
        }
        else
        {
            DecompressGlyphTile(glyphs, (u16 *)gGlyphInfo.pixels);
            DecompressGlyphTile(glyphs + 0x8, (u16 *)(gGlyphInfo.pixels + 0x20));
            DecompressGlyphTile(glyphs + 0x10, (u16 *)(gGlyphInfo.pixels + 0x40));
            DecompressGlyphTile(glyphs + 0x18, (u16 *)(gGlyphInfo.pixels + 0x60));
        }

        gGlyphInfo.height = 12;
    }
}

static u32 GetGlyphWidth_SmallNarrow(u16 glyphId, bool32 isJapanese)
{
    if (isJapanese == TRUE)
        return 8;
    else
        return gFontSmallNarrowLatinGlyphWidths[glyphId];
}

static void DecompressGlyph_Narrower(u16 glyphId, bool32 isJapanese)
{
    const u16 *glyphs;

    if (isJapanese == TRUE)
    {
        glyphs = gFontNormalJapaneseGlyphs + (0x100 * (glyphId >> 0x4)) + (0x8 * (glyphId % 0x10));
        DecompressGlyphTile(glyphs, (u16 *)gGlyphInfo.pixels);
        DecompressGlyphTile(glyphs + 0x10, (u16 *)(gGlyphInfo.pixels + 0x40));
        gGlyphInfo.width = 8;
        gGlyphInfo.height = 15;
    }
    else
    {
        glyphs = gFontNarrowerLatinGlyphs + (0x20 * glyphId);
        gGlyphInfo.width = gFontNarrowerLatinGlyphWidths[glyphId];

        if (gGlyphInfo.width <= 8)
        {
            DecompressGlyphTile(glyphs, (u16 *)gGlyphInfo.pixels);
            DecompressGlyphTile(glyphs + 0x10, (u16 *)(gGlyphInfo.pixels + 0x40));
        }
        else
        {
            DecompressGlyphTile(glyphs, (u16 *)gGlyphInfo.pixels);
            DecompressGlyphTile(glyphs + 0x8, (u16 *)(gGlyphInfo.pixels + 0x20));
            DecompressGlyphTile(glyphs + 0x10, (u16 *)(gGlyphInfo.pixels + 0x40));
            DecompressGlyphTile(glyphs + 0x18, (u16 *)(gGlyphInfo.pixels + 0x60));
        }

        gGlyphInfo.height = 15;
    }
}

static u32 GetGlyphWidth_Narrower(u16 glyphId, bool32 isJapanese)
{
    if (isJapanese == TRUE)
        return 8;
    else
        return gFontNarrowerLatinGlyphWidths[glyphId];
}

static void DecompressGlyph_SmallNarrower(u16 glyphId, bool32 isJapanese)
{
    const u16 *glyphs;

    if (isJapanese == TRUE)
    {
        glyphs = gFontNormalJapaneseGlyphs + (0x100 * (glyphId >> 0x4)) + (0x8 * (glyphId % 0x10));
        DecompressGlyphTile(glyphs, (u16 *)gGlyphInfo.pixels);
        DecompressGlyphTile(glyphs + 0x8, (u16 *)(gGlyphInfo.pixels + 0x20));
        DecompressGlyphTile(glyphs + 0x10, (u16 *)(gGlyphInfo.pixels + 0x40));
        DecompressGlyphTile(glyphs + 0x18, (u16 *)(gGlyphInfo.pixels + 0x60));
        gGlyphInfo.width = 8;
        gGlyphInfo.height = 15;
    }
    else
    {
        glyphs = gFontSmallNarrowerLatinGlyphs + (0x20 * glyphId);
        gGlyphInfo.width = gFontSmallNarrowerLatinGlyphWidths[glyphId];

        if (gGlyphInfo.width <= 8)
        {
            DecompressGlyphTile(glyphs, (u16 *)gGlyphInfo.pixels);
            DecompressGlyphTile(glyphs + 0x10, (u16 *)(gGlyphInfo.pixels + 0x40));
        }
        else
        {
            DecompressGlyphTile(glyphs, (u16 *)gGlyphInfo.pixels);
            DecompressGlyphTile(glyphs + 0x8, (u16 *)(gGlyphInfo.pixels + 0x20));
            DecompressGlyphTile(glyphs + 0x10, (u16 *)(gGlyphInfo.pixels + 0x40));
            DecompressGlyphTile(glyphs + 0x18, (u16 *)(gGlyphInfo.pixels + 0x60));
        }

        gGlyphInfo.height = 15;
    }
}

static u32 GetGlyphWidth_SmallNarrower(u16 glyphId, bool32 isJapanese)
{
    if (isJapanese == TRUE)
        return 8;
    else
        return gFontSmallNarrowerLatinGlyphWidths[glyphId];
}

static void DecompressGlyph_ShortNarrow(u16 glyphId, bool32 isJapanese)
{
    const u16 *glyphs;

    if (isJapanese == TRUE)
    {
        glyphs = gFontNormalJapaneseGlyphs + (0x100 * (glyphId >> 0x3)) + (0x10 * (glyphId & 0x7));
        DecompressGlyphTile(glyphs, (u16 *)gGlyphInfo.pixels);
        DecompressGlyphTile(glyphs + 0x8, (u16 *)(gGlyphInfo.pixels + 0x20));
        DecompressGlyphTile(glyphs + 0x10, (u16 *)(gGlyphInfo.pixels + 0x40));
        DecompressGlyphTile(glyphs + 0x18, (u16 *)(gGlyphInfo.pixels + 0x60));
        gGlyphInfo.width = gFontNormalJapaneseGlyphWidths[glyphId];
        gGlyphInfo.height = 14;
    }
    else
    {
        glyphs = gFontShortNarrowLatinGlyphs + (0x20 * glyphId);
        gGlyphInfo.width = gFontShortNarrowLatinGlyphWidths[glyphId];

        if (gGlyphInfo.width <= 8)
        {
            DecompressGlyphTile(glyphs, (u16 *)gGlyphInfo.pixels);
            DecompressGlyphTile(glyphs + 0x10, (u16 *)(gGlyphInfo.pixels + 0x40));
        }
        else
        {
            DecompressGlyphTile(glyphs, (u16 *)gGlyphInfo.pixels);
            DecompressGlyphTile(glyphs + 0x8, (u16 *)(gGlyphInfo.pixels + 0x20));
            DecompressGlyphTile(glyphs + 0x10, (u16 *)(gGlyphInfo.pixels + 0x40));
            DecompressGlyphTile(glyphs + 0x18, (u16 *)(gGlyphInfo.pixels + 0x60));
        }

        gGlyphInfo.height = 14;
    }
}

static u32 GetGlyphWidth_ShortNarrow(u16 glyphId, bool32 isJapanese)
{
    if (isJapanese == TRUE)
        return gFontNormalJapaneseGlyphWidths[glyphId];
    else
        return gFontShortNarrowLatinGlyphWidths[glyphId];
}

static const s8 sNarrowerFontIds[] =
{
    [FONT_SMALL] = FONT_SMALL_NARROW, // FONT_SMALL_NARROW,
    [FONT_NORMAL] = FONT_NARROW, // FONT_NARROW,
    // [FONT_SHORT] = FONT_SHORT_NARROW,
    // [FONT_SHORT_COPY_1] = FONT_SHORT_NARROW,
    // [FONT_SHORT_COPY_2] = FONT_SHORT_NARROW,
    // [FONT_SHORT_COPY_3] = FONT_SHORT_NARROW,
    [FONT_BRAILLE] = -1,
    [FONT_NARROW] = FONT_NARROWER,
    [FONT_SMALL_NARROW] = FONT_SMALL_NARROWER,
    [FONT_BOLD] = -1,
    [FONT_NARROWER] = -1,
    [FONT_SMALL_NARROWER] = -1,
    [FONT_SHORT_NARROW] = -1,
    [FONT_MALE] = FONT_NORMAL,
    [FONT_FEMALE] = FONT_NORMAL,
};

// If the narrowest font ID doesn't fit the text, we still return that
// ID because clipping is better than crashing.
u32 GetFontIdToFit(const u8 *string, u32 fontId, u32 letterSpacing, u32 widthPx)
{
    for (;;)
    {
        s32 narrowerFontId = sNarrowerFontIds[fontId];
        if (narrowerFontId == -1)
            return fontId;
        if (GetStringWidth(fontId, string, letterSpacing) <= widthPx)
            return fontId;
        fontId = narrowerFontId;
    }
}

u8 *PrependFontIdToFit(u8 *start, u8 *end, u32 fontId, u32 width)
{

    u32 fitFontId = GetFontIdToFit(start, fontId, 0, width);
    if (fitFontId != fontId)
    {
        memmove(&start[3], &start[0], end - start);
        start[0] = EXT_CTRL_CODE_BEGIN;
        start[1] = EXT_CTRL_CODE_FONT;
        start[2] = fitFontId;
        end[3] = EOS;
        return end + 3;
    }
    else
    {
        return end;
    }
}
