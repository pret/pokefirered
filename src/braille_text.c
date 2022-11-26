#include "global.h"
#include "main.h"
#include "window.h"
#include "text.h"
#include "sound.h"

// This file handles the braille font.
// For printing braille messages, see ScrCmd_braillemessage

static const u8 sScrollDistances[] = {
    [OPTIONS_TEXT_SPEED_SLOW] = 1,
    [OPTIONS_TEXT_SPEED_MID] = 2,
    [OPTIONS_TEXT_SPEED_FAST] = 4,
};
static const u16 sBrailleGlyphs[] = INCBIN_U16("graphics/fonts/braille.fwjpnfont");

static void DecompressGlyph_Braille(u16);

u16 FontFunc_Braille(struct TextPrinter *textPrinter)
{
    u16 char_;
    struct TextPrinterSubStruct *sub = &textPrinter->subUnion.sub;

    switch (textPrinter->state)
    {
    case RENDER_STATE_HANDLE_CHAR:
        if (JOY_HELD(A_BUTTON | B_BUTTON) && sub->hasPrintBeenSpedUp)
        {
            textPrinter->delayCounter = 0;
        }
        if (textPrinter->delayCounter && textPrinter->textSpeed)
        {
            textPrinter->delayCounter--;
            if (gTextFlags.canABSpeedUpPrint && JOY_NEW(A_BUTTON | B_BUTTON))
            {
                sub->hasPrintBeenSpedUp = TRUE;
                textPrinter->delayCounter = 0;
            }
            return RENDER_UPDATE;
        }
        if (gTextFlags.autoScroll)
            textPrinter->delayCounter = 1;
        else
            textPrinter->delayCounter = textPrinter->textSpeed;

        char_ = *textPrinter->printerTemplate.currentChar++;
        switch (char_)
        {
        case EOS:
            return RENDER_FINISH;
        case CHAR_NEWLINE:
            textPrinter->printerTemplate.currentX = textPrinter->printerTemplate.x;
            textPrinter->printerTemplate.currentY += gFonts[textPrinter->printerTemplate.fontId].maxLetterHeight + textPrinter->printerTemplate.lineSpacing;
            return RENDER_REPEAT;
        case PLACEHOLDER_BEGIN:
            textPrinter->printerTemplate.currentChar++;
            return RENDER_REPEAT;
        case EXT_CTRL_CODE_BEGIN:
            char_ = *textPrinter->printerTemplate.currentChar++;
            switch (char_)
            {
            case EXT_CTRL_CODE_COLOR:
                textPrinter->printerTemplate.fgColor = *textPrinter->printerTemplate.currentChar++;
                GenerateFontHalfRowLookupTable(textPrinter->printerTemplate.fgColor, textPrinter->printerTemplate.bgColor, textPrinter->printerTemplate.shadowColor);
                return RENDER_REPEAT;
            case EXT_CTRL_CODE_HIGHLIGHT:
                textPrinter->printerTemplate.bgColor = *textPrinter->printerTemplate.currentChar++;
                GenerateFontHalfRowLookupTable(textPrinter->printerTemplate.fgColor, textPrinter->printerTemplate.bgColor, textPrinter->printerTemplate.shadowColor);
                return RENDER_REPEAT;
            case EXT_CTRL_CODE_SHADOW:
                textPrinter->printerTemplate.shadowColor = *textPrinter->printerTemplate.currentChar++;
                GenerateFontHalfRowLookupTable(textPrinter->printerTemplate.fgColor, textPrinter->printerTemplate.bgColor, textPrinter->printerTemplate.shadowColor);
                return RENDER_REPEAT;
            case EXT_CTRL_CODE_COLOR_HIGHLIGHT_SHADOW:
                textPrinter->printerTemplate.fgColor = *textPrinter->printerTemplate.currentChar;
                textPrinter->printerTemplate.bgColor = *++textPrinter->printerTemplate.currentChar;
                textPrinter->printerTemplate.shadowColor = *++textPrinter->printerTemplate.currentChar;
                textPrinter->printerTemplate.currentChar++;

                GenerateFontHalfRowLookupTable(textPrinter->printerTemplate.fgColor, textPrinter->printerTemplate.bgColor, textPrinter->printerTemplate.shadowColor);
                return RENDER_REPEAT;
            case EXT_CTRL_CODE_PALETTE:
                textPrinter->printerTemplate.currentChar++;
                return RENDER_REPEAT;
            case EXT_CTRL_CODE_FONT:
                sub->glyphId = *textPrinter->printerTemplate.currentChar;
                textPrinter->printerTemplate.currentChar++;
                return RENDER_REPEAT;
            case EXT_CTRL_CODE_RESET_FONT:
                return RENDER_REPEAT;
            case EXT_CTRL_CODE_PAUSE:
                textPrinter->delayCounter = *textPrinter->printerTemplate.currentChar++;
                textPrinter->state = RENDER_STATE_PAUSE;
                return RENDER_REPEAT;
            case EXT_CTRL_CODE_PAUSE_UNTIL_PRESS:
                textPrinter->state = RENDER_STATE_WAIT;
                if (gTextFlags.autoScroll)
                    sub->autoScrollDelay = 0;
                return RENDER_UPDATE;
            case EXT_CTRL_CODE_WAIT_SE:
                textPrinter->state = RENDER_STATE_WAIT_SE;
                return RENDER_UPDATE;
            case EXT_CTRL_CODE_PLAY_BGM:
            case EXT_CTRL_CODE_PLAY_SE:
                textPrinter->printerTemplate.currentChar += 2;
                return RENDER_REPEAT;
            case EXT_CTRL_CODE_ESCAPE:
                char_ = *++textPrinter->printerTemplate.currentChar;
                break;
            case EXT_CTRL_CODE_SHIFT_RIGHT:
                textPrinter->printerTemplate.currentX = textPrinter->printerTemplate.x + *textPrinter->printerTemplate.currentChar++;
                return RENDER_REPEAT;
            case EXT_CTRL_CODE_SHIFT_DOWN:
                textPrinter->printerTemplate.currentY = textPrinter->printerTemplate.y + *textPrinter->printerTemplate.currentChar++;
                return RENDER_REPEAT;
            case EXT_CTRL_CODE_FILL_WINDOW:
                FillWindowPixelBuffer(textPrinter->printerTemplate.windowId, PIXEL_FILL(textPrinter->printerTemplate.bgColor));
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
            char_ = *textPrinter->printerTemplate.currentChar++| 0x100;
            break;
        case CHAR_KEYPAD_ICON:
            textPrinter->printerTemplate.currentChar++;
            return RENDER_PRINT;
        }
        DecompressGlyph_Braille(char_);
        CopyGlyphToWindow(textPrinter);
        textPrinter->printerTemplate.currentX += gGlyphInfo.width + textPrinter->printerTemplate.letterSpacing;
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
            if (textPrinter->scrollDistance < sScrollDistances[gSaveBlock2Ptr->optionsTextSpeed])
            {
                ScrollWindow(textPrinter->printerTemplate.windowId, 0, textPrinter->scrollDistance, PIXEL_FILL(textPrinter->printerTemplate.bgColor));
                textPrinter->scrollDistance = 0;
            }
            else
            {
                ScrollWindow(textPrinter->printerTemplate.windowId, 0, sScrollDistances[gSaveBlock2Ptr->optionsTextSpeed], PIXEL_FILL(textPrinter->printerTemplate.bgColor));
                textPrinter->scrollDistance -= sScrollDistances[gSaveBlock2Ptr->optionsTextSpeed];
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
        if (textPrinter->delayCounter)
            textPrinter->delayCounter--;
        else
            textPrinter->state = RENDER_STATE_HANDLE_CHAR;
        return RENDER_UPDATE;
    }
    return RENDER_FINISH;
}

static void DecompressGlyph_Braille(u16 glyph)
{
    const u16 *glyphs;

    glyphs = sBrailleGlyphs + 0x100 * (glyph / 8) + 0x10 * (glyph % 8);
    DecompressGlyphTile(glyphs, (u16 *)gGlyphInfo.pixels);
    DecompressGlyphTile(glyphs + 0x8, (u16 *)(gGlyphInfo.pixels + 0x20));
    DecompressGlyphTile(glyphs + 0x80, (u16 *)(gGlyphInfo.pixels + 0x40));
    DecompressGlyphTile(glyphs + 0x88, (u16 *)(gGlyphInfo.pixels + 0x60));
    gGlyphInfo.width = 16;
    gGlyphInfo.height = 16;
}

s32 GetGlyphWidth_Braille(u16 font_type, bool32 isJapanese)
{
    return 16;
}
