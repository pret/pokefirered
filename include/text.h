#ifndef GUARD_TEXT_H
#define GUARD_TEXT_H

#include "config/text.h"
#include "constants/characters.h"

// Given as a text speed when all the text should be
// loaded at once but not copied to vram yet.
#define TEXT_SKIP_DRAW 0xFF

enum {
    FONT_SMALL,
    FONT_NORMAL_COPY_1,
    FONT_NORMAL,
    FONT_NORMAL_COPY_2,
    FONT_MALE,
    FONT_FEMALE,
    FONT_BRAILLE,
    FONT_BOLD,
    FONT_NARROW,
    FONT_SMALL_NARROW, // Very similar to FONT_SMALL, some glyphs are narrower
    FONT_NARROWER,
    FONT_SMALL_NARROWER,
    FONT_SHORT_NARROW,
    FONT_SHORT
};

// Return values for font functions
enum {
    RENDER_PRINT,
    RENDER_FINISH,
    RENDER_REPEAT, // Run render function again, if e.g. a control code is encountered.
    RENDER_UPDATE,
};

// Text printer states read by RenderText / FontFunc_Braille
enum {
    RENDER_STATE_HANDLE_CHAR,
    RENDER_STATE_WAIT,
    RENDER_STATE_CLEAR,
    RENDER_STATE_SCROLL_START,
    RENDER_STATE_SCROLL,
    RENDER_STATE_WAIT_SE,
    RENDER_STATE_PAUSE,
};

enum
{
    FONTATTR_MAX_LETTER_WIDTH,
    FONTATTR_MAX_LETTER_HEIGHT,
    FONTATTR_LETTER_SPACING,
    FONTATTR_LINE_SPACING,
    FONTATTR_COLOR_ACCENT,   // dunno what this is yet
    FONTATTR_COLOR_FOREGROUND,
    FONTATTR_COLOR_BACKGROUND,
    FONTATTR_COLOR_SHADOW
};

enum PACKED TextPrinterType
{
    WINDOW_TEXT_PRINTER,
    SPRITE_TEXT_PRINTER,
};

union TextColor {
    struct {
        u8 background;
        u8 foreground;
        u8 shadow;
        u8 accent;
    };
    u32 asU32;
};

struct TextGlyph
{
    u32 gfxBufferTop[16];
    u32 gfxBufferBottom[16];
    u8 width;
    u8 height;
};

extern struct TextGlyph gCurGlyph;

struct TextPrinterSubStruct
{
    u8 fontId:4;  // 0x14
    bool8 hasPrintBeenSpedUp:1;
    u8 unk:3;
    u8 downArrowDelay:5;
    u8 downArrowYPosIdx:2;
    bool8 hasFontIdBeenSet:1;
    u8 autoScrollDelay;
};

struct TextPrinterTemplate
{
    const u8 *currentChar;

    enum TextPrinterType type;
    union {
        u8 windowId;
        u8 spriteId;
    };

    u8 fontId;
    u8 x;
    u8 y;
    u8 currentX;        // 0x8
    u8 currentY;
    u8 letterSpacing;
    u8 lineSpacing;
    u8 firstSpriteInRow;
    u8 firstSprite;
    union {
        struct {
            DEPRECATED("Use color.background instead") u8 bgColor;
            DEPRECATED("Use color.foreground instead") u8 fgColor;
            DEPRECATED("Use color.shadow instead") u8 shadowColor;
            DEPRECATED("Use color.accent instead") u8 accentColor;
        };
        union TextColor color;
    };
};

struct TextPrinter
{
    struct TextPrinterTemplate printerTemplate;

    void (*callback)(struct TextPrinterTemplate *, u16);

    u16 utilityCounter:13;
    u16 downArrowYPosIdx:2;
    bool16 hasFontIdBeenSet:1;
    u8 autoScrollDelay;
    u8 fontId:4;
    bool8 hasPrintBeenSpedUp:1;
    u8 japanese:1;
    u8 active:1;
    u8 isInUse:1;

    u8 state;
    u8 delayCounter;
    u8 scrollDistance;
    u8 minLetterSpacing;

    u8 textSpeed;
    u8 padding[3];

    struct TextPrinter *nextPrinter;
};

struct FontInfo
{
    u16 (*fontFunction)(struct TextPrinter *x);
    u8 maxLetterWidth;
    u8 maxLetterHeight;
    u8 letterSpacing;
    u8 lineSpacing;
    union {
        struct {
            DEPRECATED("Use color.background instead") u8 bgColor;
            DEPRECATED("Use color.foreground instead") u8 fgColor;
            DEPRECATED("Use color.shadow instead") u8 shadowColor;
            DEPRECATED("Use color.accent instead") u8 accentColor;
        };
        union TextColor color;
    };
};

extern const struct FontInfo *gFonts;

struct GlyphWidthFunc
{
    u32 fontId;
    u32 (*func)(u16 glyphId, bool32 isJapanese);
};

typedef struct {
    u8 canABSpeedUpPrint:1;
    u8 useAlternateDownArrow:1;
    u8 autoScroll:1;
    u8 forceMidTextSpeed:1;
} TextFlags;

extern TextFlags gTextFlags;

extern u8 gStringVar1[];
extern u8 gStringVar2[];
extern u8 gStringVar3[];
extern u8 gStringVar4[1000];

extern const u8 gKeypadIconTiles[];

void DeactivateAllTextPrinters(void);
u16 AddTextPrinterParameterized(u8 windowId, u8 fontId, const u8 *str, u8 x, u8 y, u8 speed, void (*callback)(struct TextPrinterTemplate *, u16));
bool32 AddTextPrinter(struct TextPrinterTemplate *textSubPrinter, u8 speed, void (*callback)(struct TextPrinterTemplate *, u16));
void RunTextPrinters(void);
bool32 IsTextPrinterActiveOnWindow(u32 windowId);
bool32 IsTextPrinterActiveOnSprite(u32 spriteId);
void GenerateFontHalfRowLookupTable(union TextColor color);
union TextColor SaveTextColors(void);
void RestoreTextColors(union TextColor color);
void DecompressGlyphTile(const void *src_, void *dest_);
u32 CopyGlyphToVRAM(struct TextPrinter *textPrinter);
void ClearTextSpan(struct TextPrinter *textPrinter, u32 width);

void TextPrinterInitDownArrowCounters(struct TextPrinter *textPrinter);
void TextPrinterDrawDownArrow(struct TextPrinter *textPrinter);
void TextPrinterClearDownArrow(struct TextPrinter *textPrinter);
bool32 TextPrinterWaitAutoMode(struct TextPrinter *textPrinter);
bool32 TextPrinterWaitWithDownArrow(struct TextPrinter *textPrinter);
bool32 TextPrinterWait(struct TextPrinter *textPrinter);
void DrawDownArrow(u8 windowId, u16 x, u16 y, u8 bgColor, bool32 drawArrow, u8 *counter, u8 *yCoordIndex);
s32 GetGlyphWidth(u16 glyphId, bool32 isJapanese, u8 fontId);
s32 GetStringWidth(u8 fontId, const u8 *str, s16 letterSpacing);
s32 GetStringLineWidth(u8 fontId, const u8 *str, s16 letterSpacing, u32 lineNum, u32 strSize);
u8 RenderTextHandleBold(u8 *pixels, u8 fontId, u8 *str);
u8 DrawKeypadIcon(u8 windowId, u8 keypadIconId, u16 x, u16 y);
u8 GetKeypadIconTileOffset(u8 keypadIconId);
u8 GetKeypadIconWidth(u8 keypadIconId);
u8 GetKeypadIconHeight(u8 keypadIconId);
void SetDefaultFontsPointer(void);
u8 GetFontAttribute(u8 fontId, u8 attributeId);
u8 GetMenuCursorDimensionByFont(u8 fontId, u8 whichDimension);
void DecompressGlyph_Small(u16 glyphId, bool32 isJapanese);
void DecompressGlyph_Normal(u16 glyphId, bool32 isJapanese);
void DecompressGlyph_Female(u16 glyphId, bool32 isJapanese);
u8 CreateTextCursorSprite(u8 sheetId, u16 x, u16 y, u8 priority, u8 subpriority);
void DestroyTextCursorSprite(u8 spriteId);

u32 GetFontIdToFit(const u8 *string, u32 widestFontId, u32 letterSpacing, u32 widthPx);
u8 *PrependFontIdToFit(u8 *start, u8 *end, u32 fontId, u32 width);
u8 *WrapFontIdToFit(u8 *start, u8 *end, u32 fontId, u32 width);

// player text speed
u32 GetPlayerTextSpeed(void);
u32 GetPlayerTextSpeedDelay(void);
u32 GetPlayerTextSpeedModifier(void);
u32 GetPlayerTextScrollSpeed(void);
bool32 IsPlayerTextSpeedInstant(void);

// braille.c
u16 FontFunc_Braille(struct TextPrinter *textPrinter);
u32 GetGlyphWidth_Braille(u16 font_type, bool32 isJapanese);

#endif // GUARD_TEXT_H
