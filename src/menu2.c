#include "global.h"
#include "gflib.h"
#include "task.h"
#include "wild_encounter.h"

// Not actually "old" given these were introduced in Gen 3,
// but they're used as equivalents here alongside the other OLD_UNOWN
// #define SPECIES_OLD_UNOWN_EMARK (NUM_SPECIES + 0)
// #define SPECIES_OLD_UNOWN_QMARK (NUM_SPECIES + 1)

static void Task_SmoothBlendLayers(u8 taskId);

void AddTextPrinterParameterized3(u8 windowId, u8 fontId, u8 x, u8 y, const u8 * color, s8 speed, const u8 * str)
{
    struct TextPrinterTemplate printer;

    printer.currentChar = str;
    printer.windowId = windowId;
    printer.fontId = fontId;
    printer.x = x;
    printer.y = y;
    printer.currentX = printer.x;
    printer.currentY = printer.y;
    printer.letterSpacing = GetFontAttribute(fontId, FONTATTR_LETTER_SPACING);
    printer.lineSpacing = GetFontAttribute(fontId, FONTATTR_LINE_SPACING);
    printer.unk = 0;
    printer.fgColor = color[1];
    printer.bgColor = color[0];
    printer.shadowColor = color[2];
    AddTextPrinter(&printer, speed, NULL);
}

void AddTextPrinterParameterized4(u8 windowId, u8 fontId, u8 x, u8 y, u8 letterSpacing, u8 lineSpacing, const u8 *color, s8 speed, const u8 *str)
{
    struct TextPrinterTemplate printer;

    printer.currentChar = str;
    printer.windowId = windowId;
    printer.fontId = fontId;
    printer.x = x;
    printer.y = y;
    printer.currentX = printer.x;
    printer.currentY = printer.y;
    printer.letterSpacing = letterSpacing;
    printer.lineSpacing = lineSpacing;
    printer.unk = 0;
    printer.fgColor = color[1];
    printer.bgColor = color[0];
    printer.shadowColor = color[2];
    AddTextPrinter(&printer, speed, NULL);
}

void AddTextPrinterParameterized5(u8 windowId, u8 fontId, const u8 *str, u8 x, u8 y, u8 speed, void (*callback)(struct TextPrinterTemplate *, u16), u8 letterSpacing, u8 lineSpacing)
{
    struct TextPrinterTemplate printer;

    printer.currentChar = str;
    printer.windowId = windowId;
    printer.fontId = fontId;
    printer.x = x;
    printer.y = y;
    printer.currentX = x;
    printer.currentY = y;
    printer.letterSpacing = letterSpacing;
    printer.lineSpacing = lineSpacing;
    printer.unk = 0;
    printer.fgColor = GetFontAttribute(fontId, FONTATTR_COLOR_FOREGROUND);
    printer.bgColor = GetFontAttribute(fontId, FONTATTR_COLOR_BACKGROUND);
    printer.shadowColor = GetFontAttribute(fontId, FONTATTR_COLOR_SHADOW);
    AddTextPrinter(&printer, speed, callback);
}

void Menu_PrintFormatIntlPlayerName(u8 windowId, const u8 * src, u16 x, u16 y)
{
    s32 i;

    for (i = 0; gSaveBlock2Ptr->playerName[i] != EOS; i++)
        ;

    StringExpandPlaceholders(gStringVar4, src);
    if (i != 5)
    {
        AddTextPrinterParameterized(windowId, FONT_NORMAL, gStringVar4, x, y, 0xFF, NULL);
    }
    else
    {
        AddTextPrinterParameterized5(windowId, FONT_NORMAL, gStringVar4, x, y, 0xFF, NULL, 0, 0);
    }
}

#define tEvA data[0]
#define tEvB data[1]
#define tEvAEnd data[2]
#define tEvBEnd data[3]
#define tEvADelta data[4]
#define tEvBDelta data[5]
#define tEvWhich data[6]
#define tEvStepCount data[8]

void StartBlendTask(u8 eva_start, u8 evb_start, u8 eva_end, u8 evb_end, u8 ev_step, u8 priority)
{
    u8 taskId = CreateTask(Task_SmoothBlendLayers, priority);
    gTasks[taskId].tEvA = eva_start << 8;
    gTasks[taskId].tEvB = evb_start << 8;
    gTasks[taskId].tEvAEnd = eva_end;
    gTasks[taskId].tEvBEnd = evb_end;
    gTasks[taskId].tEvADelta = (eva_end - eva_start) * 256 / ev_step;
    gTasks[taskId].tEvBDelta = (evb_end - evb_start) * 256 / ev_step;
    gTasks[taskId].tEvStepCount = ev_step;
    SetGpuReg(REG_OFFSET_BLDALPHA, (evb_start << 8) | eva_start);
}

bool8 IsBlendTaskActive(void)
{
    return FuncIsActiveTask(Task_SmoothBlendLayers);
}

static void Task_SmoothBlendLayers(u8 taskId)
{
    s16 * data = gTasks[taskId].data;

    if (tEvStepCount != 0)
    {
        if (tEvWhich == 0)
        {
            tEvA += tEvADelta;
            tEvWhich = 1;
        }
        else
        {
            if (--tEvStepCount != 0)
            {
                tEvB += tEvBDelta;
            }
            else
            {
                tEvA = tEvAEnd << 8;
                tEvB = tEvBEnd << 8;
            }
            tEvWhich = 0;
        }
        SetGpuReg(REG_OFFSET_BLDALPHA, (tEvB & ~0xFF) | ((u16)tEvA >> 8));
        if (tEvStepCount == 0)
            DestroyTask(taskId);
    }
}

u8 Menu2_GetMonSpriteAnchorCoord(u16 species, u32 personality, u8 a2)
{
    // if (species == SPECIES_UNOWN)
    // {
    //     u8 unownLetter = GetUnownLetterByPersonalityLoByte(personality);
    //     switch (unownLetter)
    //     {
    //     case 0:
    //         break;
    //     case 26:
    //         species = SPECIES_OLD_UNOWN_EMARK;
    //         break;
    //     case 27:
    //         species = SPECIES_OLD_UNOWN_QMARK;
    //         break;
    //     default:
    //         species = SPECIES_OLD_UNOWN_B + unownLetter - 1;
    //         break;
    //     }
    // }
    // if (species != SPECIES_NONE && a2 < 5)
    // {
    //     species--;
    //     if (sMonSpriteAnchorCoords[species][a2] != 0xFF)
    //         return sMonSpriteAnchorCoords[species][a2];
    // }
    return 32;
}

s8 Menu2_GetMonSpriteAnchorCoordMinusx20(u16 species, u32 personality, u8 a2)
{
    return Menu2_GetMonSpriteAnchorCoord(species, personality, a2) - 32;
}
