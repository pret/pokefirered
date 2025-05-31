#include "decompress_error_handler.h"
#include "global.h"
#include "data.h"
#include "menu.h"
#include "menu_helpers.h"
#include "malloc.h"
#include "palette.h"
#include "graphics.h"
#include "gpu_regs.h"
#include "bg.h"
#include "main.h"
#include "text_window.h"
#include "string_util.h"
#include "constants/rgb.h"

static EWRAM_DATA u32 sErrorAddress;
static EWRAM_DATA enum CompressionError sCompressionError;

static const struct BgTemplate sBgTemplates[3] =
{
    {
        .bg = 0,
        .charBaseIndex = 2,
        .mapBaseIndex = 31,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 0,
        .baseTile = 0,
    },
    {
        .bg = 2,
        .charBaseIndex = 0,
        .mapBaseIndex = 14,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 2,
        .baseTile = 0,
    },
    {
        .bg = 3,
        .charBaseIndex = 0,
        .mapBaseIndex = 15,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 3,
        .baseTile = 0,
    },
};

static void DecompressErrorScreenTextPrint(const u8 *text, u8 x, u8 y)
{
    u8 color[3];

    color[0] = TEXT_COLOR_TRANSPARENT;
    color[1] = TEXT_DYNAMIC_COLOR_6;
    color[2] = TEXT_COLOR_LIGHT_GRAY;
    AddTextPrinterParameterized4(0, FONT_NORMAL, x * 8, y * 8 + 1, 0, 0, color, 0, text);
}

static void GetHexStringFromU32(u8 *str, u32 value)
{
    str[0] = CHAR_0;
    str[1] = CHAR_x;
    str[10] = EOS;
    for (u32 i = 0; i < 8; i++)
    {
        u8 currChar = 0;
        switch ((value >> (4*i)) & 0xF)
        {
        case 0:
            currChar = CHAR_0;
            break;
        case 1:
            currChar = CHAR_1;
            break;
        case 2:
            currChar = CHAR_2;
            break;
        case 3:
            currChar = CHAR_3;
            break;
        case 4:
            currChar = CHAR_4;
            break;
        case 5:
            currChar = CHAR_5;
            break;
        case 6:
            currChar = CHAR_6;
            break;
        case 7:
            currChar = CHAR_7;
            break;
        case 8:
            currChar = CHAR_8;
            break;
        case 9:
            currChar = CHAR_9;
            break;
        case 10:
            currChar = CHAR_A;
            break;
        case 11:
            currChar = CHAR_B;
            break;
        case 12:
            currChar = CHAR_C;
            break;
        case 13:
            currChar = CHAR_D;
            break;
        case 14:
            currChar = CHAR_E;
            break;
        case 15:
            currChar = CHAR_F;
            break;
        }
        u32 pos = 9 - i;
        str[pos] = currChar;
    }
}

void DecompressionError_CB2(void)
{
    static const struct WindowTemplate textWin[] =
    {
        {
            .bg = 0,
            .tilemapLeft = 3,
            .tilemapTop = 2,
            .width = 24,
            .height = 16,
            .paletteNum = 15,
            .baseBlock = 1,
        }
    };

    if (sErrorAddress == 0)
        return;

    ResetVramOamAndBgCntRegs();
    ResetAllBgsCoordinates();
    FreeAllWindowBuffers();

    SetGpuReg(REG_OFFSET_DISPCNT, 0);
    SetGpuReg(REG_OFFSET_BLDCNT, 0);
    SetGpuReg(REG_OFFSET_BG0CNT, 0);
    SetGpuReg(REG_OFFSET_BG0HOFS, 0);
    SetGpuReg(REG_OFFSET_BG0VOFS, 0);
    DmaFill16(3, 0, VRAM, VRAM_SIZE);
    DmaFill32(3, 0, OAM, OAM_SIZE);
    DmaFill16(3, 0, PLTT, PLTT_SIZE);
    ResetBgsAndClearDma3BusyFlags(0);
    InitBgsFromTemplates(0, sBgTemplates, ARRAY_COUNT(sBgTemplates));
    LoadBgTiles(0, gTextWindowFrame1_Gfx, 0x120, 0x214);
    DeactivateAllTextPrinters();
    ResetTasks();
    ResetPaletteFade();
    LoadPalette(gTextWindowFrame1_Pal, 0xE0, 0x20);
    LoadPalette(gStandardMenuPalette, 0xF0, 0x20);
    InitWindows(textWin);
    DrawStdFrameWithCustomTileAndPalette(0, TRUE, 0x214, 0xE);
    static const u8 romCheckFailMessage[] =_(
        "{COLOR RED}ERROR! {COLOR DARK_GRAY}Decompression Failed!\n"
        "\n"
        "Address:\n"
        "Error:\n");
    DecompressErrorScreenTextPrint(romCheckFailMessage, 1, 0);
    u8 addressStr[11];
    u8 errorStr[11];
    GetHexStringFromU32(addressStr, sErrorAddress);
    GetHexStringFromU32(errorStr, sCompressionError);
    DecompressErrorScreenTextPrint(addressStr, 7, 4);
    DecompressErrorScreenTextPrint(errorStr, 7, 6);
    TransferPlttBuffer();
    *(u16*)PLTT = RGB(17, 18, 31);
    ShowBg(0);
    sErrorAddress = 0;
    //  This loop is apparently needed to prevent the game from doing
    //  stupid stuff with data it couldn't decompress
    while(TRUE)
        sCompressionError++;
}

void DecompressionError(const u32 *src, enum CompressionError error)
{
    sErrorAddress = (u32)src;
    sCompressionError = error;
    SetMainCallback2(DecompressionError_CB2);
    DecompressionError_CB2();
}

void DoDecompressionError(void)
{
    DecompressionError((u32 *)0x12345678, HEADER_ERROR);
}
