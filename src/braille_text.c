#include "global.h"
#include "main.h"
#include "window.h"
#include "text.h"
#include "sound.h"

extern u8 gGlyphInfo[];

ALIGNED(4)
static const u8 gUnknown_846FB08[] = {1, 2, 4};
static const u16 sFont6BrailleGlyphs[] = INCBIN_U16("data/graphics/fonts/font6.fwjpnfont");

static void DecompressGlyphFont6(u16);

u16 Font6Func(struct TextPrinter *textPrinter)
{
    u16 char_;
    struct TextPrinterSubStruct *sub;

    sub = &textPrinter->sub_union.sub;
    switch (textPrinter->state)
    {
        case 0:
            if (gMain.heldKeys & (A_BUTTON | B_BUTTON) && sub->font_type_upper)
            {
                textPrinter->delayCounter = 0;
            }
            if (textPrinter->delayCounter && textPrinter->text_speed)
            {
                textPrinter->delayCounter --;
                if (gTextFlags.canABSpeedUpPrint && gMain.newKeys & (A_BUTTON | B_BUTTON))
                {
                    sub->font_type_upper = TRUE;
                    textPrinter->delayCounter = 0;
                }
                return 3;
            }
            if (gTextFlags.autoScroll)
            {
                textPrinter->delayCounter = 1;
            }
            else
            {
                textPrinter->delayCounter = textPrinter->text_speed;
            }
            char_ = *textPrinter->subPrinter.currentChar++;
            switch (char_)
            {
                case EOS:
                    return 1;
                case CHAR_NEWLINE:
                    textPrinter->subPrinter.currentX = textPrinter->subPrinter.x;
                    textPrinter->subPrinter.currentY += gFonts[textPrinter->subPrinter.fontId].maxLetterHeight + textPrinter->subPrinter.lineSpacing;
                    return 2;
                case PLACEHOLDER_BEGIN:
                    textPrinter->subPrinter.currentChar++;
                    return 2;
                case EXT_CTRL_CODE_BEGIN:
                    char_ = *textPrinter->subPrinter.currentChar++;
                    switch (char_)
                    {
                        case 1:
                            textPrinter->subPrinter.fgColor = *textPrinter->subPrinter.currentChar++;
                            GenerateFontHalfRowLookupTable(textPrinter->subPrinter.fgColor, textPrinter->subPrinter.bgColor, textPrinter->subPrinter.shadowColor);
                            return 2;
                        case 2:
                            textPrinter->subPrinter.bgColor = *textPrinter->subPrinter.currentChar++;
                            GenerateFontHalfRowLookupTable(textPrinter->subPrinter.fgColor, textPrinter->subPrinter.bgColor, textPrinter->subPrinter.shadowColor);
                            return 2;
                        case 3:
                            textPrinter->subPrinter.shadowColor = *textPrinter->subPrinter.currentChar++;
                            GenerateFontHalfRowLookupTable(textPrinter->subPrinter.fgColor, textPrinter->subPrinter.bgColor, textPrinter->subPrinter.shadowColor);
                            return 2;
                        case 4:
                            textPrinter->subPrinter.fgColor = *textPrinter->subPrinter.currentChar;
                            textPrinter->subPrinter.bgColor = *++textPrinter->subPrinter.currentChar;
                            textPrinter->subPrinter.shadowColor = *++textPrinter->subPrinter.currentChar;
                            textPrinter->subPrinter.currentChar++;

                            GenerateFontHalfRowLookupTable(textPrinter->subPrinter.fgColor, textPrinter->subPrinter.bgColor, textPrinter->subPrinter.shadowColor);
                            return 2;
                        case 5:
                            textPrinter->subPrinter.currentChar++;
                            return 2;
                        case 6:
                            sub->font_type = *textPrinter->subPrinter.currentChar;
                            textPrinter->subPrinter.currentChar++;
                            return 2;
                        case 7:
                            return 2;
                        case 8:
                            textPrinter->delayCounter = *textPrinter->subPrinter.currentChar++;
                            textPrinter->state = 6;
                            return 2;
                        case 9:
                            textPrinter->state = 1;
                            if (gTextFlags.autoScroll)
                            {
                                sub->frames_visible_counter = 0;
                            }
                            return 3;
                        case 10:
                            textPrinter->state = 5;
                            return 3;
                        case 11:
                        case 16:
                            textPrinter->subPrinter.currentChar += 2;
                            return 2;
                        case 12:
                            char_ = *++textPrinter->subPrinter.currentChar;
                            break;
                        case 13:
                            textPrinter->subPrinter.currentX = textPrinter->subPrinter.x + *textPrinter->subPrinter.currentChar++;
                            return 2;
                        case 14:
                            textPrinter->subPrinter.currentY = textPrinter->subPrinter.y + *textPrinter->subPrinter.currentChar++;
                            return 2;
                        case 15:
                            FillWindowPixelBuffer(textPrinter->subPrinter.windowId, PIXEL_FILL(textPrinter->subPrinter.bgColor));
                            return 2;
                    }
                    break;
                case CHAR_PROMPT_CLEAR:
                    textPrinter->state = 2;
                    TextPrinterInitDownArrowCounters(textPrinter);
                    return 3;
                case CHAR_PROMPT_SCROLL:
                    textPrinter->state = 3;
                    TextPrinterInitDownArrowCounters(textPrinter);
                    return 3;
                case 0xF9:
                    char_ = *textPrinter->subPrinter.currentChar++| 0x100;
                    break;
                case 0xF8:
                    textPrinter->subPrinter.currentChar++;
                    return 0;
            }
            DecompressGlyphFont6(char_);
            CopyGlyphToWindow(textPrinter);
            textPrinter->subPrinter.currentX += gGlyphInfo[0x80] + textPrinter->subPrinter.letterSpacing;
            return 0;
        case 1:
            if (TextPrinterWait(textPrinter))
            {
                textPrinter->state = 0;
            }
            return 3;
        case 2:
            if (TextPrinterWaitWithDownArrow(textPrinter))
            {
                FillWindowPixelBuffer(textPrinter->subPrinter.windowId, PIXEL_FILL(textPrinter->subPrinter.bgColor));
                textPrinter->subPrinter.currentX = textPrinter->subPrinter.x;
                textPrinter->subPrinter.currentY = textPrinter->subPrinter.y;
                textPrinter->state = 0;
            }
            return 3;
        case 3:
            if (TextPrinterWaitWithDownArrow(textPrinter))
            {
                TextPrinterClearDownArrow(textPrinter);
                textPrinter->scrollDistance = gFonts[textPrinter->subPrinter.fontId].maxLetterHeight + textPrinter->subPrinter.lineSpacing;
                textPrinter->subPrinter.currentX = textPrinter->subPrinter.x;
                textPrinter->state = 4;
            }
            return 3;
        case 4:
            if (textPrinter->scrollDistance)
            {
                if (textPrinter->scrollDistance < gUnknown_846FB08[gSaveBlock2Ptr->optionsTextSpeed])
                {
                    ScrollWindow(textPrinter->subPrinter.windowId, 0, textPrinter->scrollDistance, PIXEL_FILL(textPrinter->subPrinter.bgColor));
                    textPrinter->scrollDistance = 0;
                }
                else
                {
                    ScrollWindow(textPrinter->subPrinter.windowId, 0, gUnknown_846FB08[gSaveBlock2Ptr->optionsTextSpeed], PIXEL_FILL(textPrinter->subPrinter.bgColor));
                    textPrinter->scrollDistance -= gUnknown_846FB08[gSaveBlock2Ptr->optionsTextSpeed];
                }
                CopyWindowToVram(textPrinter->subPrinter.windowId, 2);
            }
            else
            {
                textPrinter->state = 0;
            }
            return 3;
        case 5:
            if (!IsSEPlaying())
            {
                textPrinter->state = 0;
            }
            return 3;
        case 6:
            if (textPrinter->delayCounter)
            {
                textPrinter->delayCounter --;
            }
            else
            {
                textPrinter->state = 0;
            }
            return 3;
    }
    return 1;
}

static void DecompressGlyphFont6(u16 glyph)
{
    const u16 *glyphs;

    glyphs = sFont6BrailleGlyphs + 0x100 * (glyph / 8) + 0x10 * (glyph % 8);
    DecompressGlyphTile(glyphs, (u16 *)gGlyphInfo);
    DecompressGlyphTile(glyphs + 0x8, (u16 *)(gGlyphInfo + 0x20));
    DecompressGlyphTile(glyphs + 0x80, (u16 *)(gGlyphInfo + 0x40));
    DecompressGlyphTile(glyphs + 0x88, (u16 *)(gGlyphInfo + 0x60));
    gGlyphInfo[0x80] = 0x10;
    gGlyphInfo[0x81] = 0x10;
}

u32 GetGlyphWidthFont6(u16 font_type, bool32 isJapanese)
{
    return 0x10;
}
