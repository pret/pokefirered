#include "global.h"
#include "window.h"
#include "text.h"

static EWRAM_DATA struct TextPrinter sTempTextPrinter = {0};
static EWRAM_DATA struct TextPrinter sTextPrinters[NUM_TEXT_PRINTERS] = {0};

static u16 sFontHalfRowLookupTable[0x51];
static u16 sLastTextBgColor;
static u16 sLastTextFgColor;
static u16 sLastTextShadowColor;

COMMON_DATA const struct FontInfo *gFonts = NULL;
COMMON_DATA struct GlyphInfo gGlyphInfo = {0};

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
        int offsetIndex = (i << 31) ? (u8)*src++ : (*src >> 8);
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

// Unused
static void CopyGlyphToWindow_Parameterized(void *tileData, u16 currentX, u16 currentY, u16 width, u16 height)
{
    int glyphWidth, glyphHeight;
    u8 sizeType;
    u16 sizeX;
    
    if (width - currentX < gGlyphInfo.width)
        glyphWidth = width - currentX;
    else
        glyphWidth = gGlyphInfo.width;
    if (height - currentY < gGlyphInfo.height)
        glyphHeight = height - currentY;
    else
        glyphHeight = gGlyphInfo.height;
    
    sizeType = 0;
    sizeX  = (width + (width & 7)) >> 3;
    if (glyphWidth > 8)
        sizeType |= 1;
    if (glyphHeight > 8)
        sizeType |= 2;
    
    switch (sizeType)
    {
        case 0:
            GLYPH_COPY(0, 0, glyphWidth, glyphHeight, tileData, currentX, currentY, sizeX);
            return;
        case 1:
            GLYPH_COPY(0, 0, 8, glyphHeight, tileData, currentX, currentY, sizeX);
            GLYPH_COPY(8, 0, glyphWidth - 8, glyphHeight, tileData, currentX, currentY, sizeX);
            return;
        case 2:
            GLYPH_COPY(0, 0, glyphWidth, 8, tileData, currentX, currentY, sizeX);
            GLYPH_COPY(0, 8, glyphWidth, glyphHeight - 8, tileData, currentX, currentY, sizeX);
            return;
        case 3:
            GLYPH_COPY(0, 0, 8, 8, tileData, currentX, currentY, sizeX);
            GLYPH_COPY(8, 0, glyphWidth - 8, 8, tileData, currentX, currentY, sizeX);
            GLYPH_COPY(0, 8, 8, glyphHeight - 8, tileData, currentX, currentY, sizeX);
            GLYPH_COPY(8, 8, glyphWidth - 8, glyphHeight - 8, tileData, currentX, currentY, sizeX);
            return;
    }
}

void ClearTextSpan(struct TextPrinter *textPrinter, u32 width)
{
}
