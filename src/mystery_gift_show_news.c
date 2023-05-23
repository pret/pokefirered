#include "global.h"
#include "gflib.h"
#include "menu_indicators.h"
#include "new_menu_helpers.h"
#include "mystery_gift.h"
#include "mystery_gift_menu.h"
#include "menu.h"
#include "link_rfu.h"
#include "list_menu.h"
#include "constants/mystery_gift.h"

enum {
    WIN_TITLE,
    WIN_BODY,
    WIN_COUNT
};

#define TAG_ARROWS 0x1000

struct WonderNewsData
{
    struct WonderNews news;
    const struct WonderGraphics * gfx;
    bool8 verticalScrollDisabled:1;
    u8 enterExitState:7;
    u8 arrowTaskId;
    bool8 scrolling:1;
    u8 scrollIncrement:7;
    bool8 scrollingDown:1;
    u8 scrollTotal:7;
    u16 scrollEnd;
    u16 scrollOffset;
    u16 windowIds[WIN_COUNT];
    u8 unused[2];
    u8 titleText[WONDER_NEWS_TEXT_LENGTH + 1];
    u8 bodyText[WONDER_NEWS_BODY_TEXT_LINES][WONDER_NEWS_TEXT_LENGTH + 1];
    struct ScrollArrowsTemplate arrowsTemplate;
    u8 bgTilemapBuffer[0x1000];
};

static EWRAM_DATA struct WonderNewsData * sWonderNewsData = NULL;

static void BufferNewsText(void);
static void DrawNewsWindows(void);
static void UpdateNewsScroll(void);

static const u8 sTextColorTable[][3] = {
    {0, 2, 3},
    {0, 1, 2}
};
static const struct WindowTemplate sWindowTemplates[] = {
    [WIN_TITLE] = {
        .bg = 0,
        .tilemapLeft = 1,
        .tilemapTop = 0,
        .width = 28,
        .height = 3,
        .paletteNum = 15,
        .baseBlock = 0x000
    },
    [WIN_BODY] = {
        .bg = 2,
        .tilemapLeft = 1,
        .tilemapTop = 3,
        .width = 28,
        .height = 20,
        .paletteNum = 15,
        .baseBlock = 0x000
    }
};
static const struct ScrollArrowsTemplate sArrowsTemplate = {
    .firstArrowType = SCROLL_ARROW_UP,
    .firstX = 232,
    .firstY = 24,
    .secondArrowType = SCROLL_ARROW_DOWN,
    .secondX = 232,
    .secondY = 152,
    .fullyUpThreshold = 0,
    .fullyDownThreshold = 2,
    .tileTag = TAG_ARROWS,
    .palTag = TAG_ARROWS,
    .palNum = 0
};

static const u16 sNews0Pal[] = INCBIN_U16("graphics/wonder_news/bg0.gbapal");
static const u16 sNews6Pal[] = INCBIN_U16("graphics/wonder_news/bg6.gbapal");
static const u16 sNews7Pal[] = INCBIN_U16("graphics/wonder_news/bg7.gbapal");
static const u8 sNews0Gfx[] = INCBIN_U8("graphics/wonder_news/bg0.4bpp.lz");
static const u8 sNews0Map[] = INCBIN_U8("graphics/wonder_news/bg0.bin.lz");
static const u8 sNews1Gfx[] = INCBIN_U8("graphics/wonder_news/bg1.4bpp.lz");
static const u8 sNews1Map[] = INCBIN_U8("graphics/wonder_news/bg1.bin.lz");
static const u8 sNews2Gfx[] = INCBIN_U8("graphics/wonder_news/bg2.4bpp.lz");
static const u8 sNews2Map[] = INCBIN_U8("graphics/wonder_news/bg2.bin.lz");
static const u8 sNews6Gfx[] = INCBIN_U8("graphics/wonder_news/bg6.4bpp.lz");
static const u8 sNews6Map[] = INCBIN_U8("graphics/wonder_news/bg6.bin.lz");
static const u8 sNews7Gfx[] = INCBIN_U8("graphics/wonder_news/bg7.4bpp.lz");
static const u8 sNews7Map[] = INCBIN_U8("graphics/wonder_news/bg7.bin.lz");

static const struct WonderGraphics sNewsGraphics[NUM_WONDER_BGS] = {
    {.titleTextPal = 1, .bodyTextPal = 0, .tiles = sNews0Gfx, .map = sNews0Map, .pal = sNews0Pal},
    {.titleTextPal = 1, .bodyTextPal = 0, .tiles = sNews1Gfx, .map = sNews1Map, .pal = gCard1Pal},
    {.titleTextPal = 1, .bodyTextPal = 0, .tiles = sNews2Gfx, .map = sNews2Map, .pal = gCard2Pal},
    {.titleTextPal = 1, .bodyTextPal = 0, .tiles = sNews2Gfx, .map = sNews2Map, .pal = gCard3Pal},
    {.titleTextPal = 1, .bodyTextPal = 0, .tiles = sNews2Gfx, .map = sNews2Map, .pal = gCard4Pal},
    {.titleTextPal = 1, .bodyTextPal = 0, .tiles = sNews2Gfx, .map = sNews2Map, .pal = gCard5Pal},
    {.titleTextPal = 1, .bodyTextPal = 0, .tiles = sNews6Gfx, .map = sNews6Map, .pal = sNews6Pal},
    {.titleTextPal = 1, .bodyTextPal = 0, .tiles = sNews7Gfx, .map = sNews7Map, .pal = sNews7Pal}
};

bool32 WonderNews_Init(const struct WonderNews * news)
{
    if (news == NULL)
        return FALSE;
    sWonderNewsData = AllocZeroed(sizeof(*sWonderNewsData));
    if (sWonderNewsData == NULL)
        return FALSE;
    sWonderNewsData->news = *news;
    if (sWonderNewsData->news.bgType >= NUM_WONDER_BGS)
        sWonderNewsData->news.bgType = 0;
    sWonderNewsData->gfx = &sNewsGraphics[sWonderNewsData->news.bgType];
    sWonderNewsData->arrowTaskId = TASK_NONE;
    return TRUE;
}

void WonderNews_Destroy(void)
{
    if (sWonderNewsData != NULL)
    {
        *sWonderNewsData = (struct WonderNewsData){};
        FREE_AND_SET_NULL(sWonderNewsData);
    }
}

s32 WonderNews_Enter(void)
{
    if (sWonderNewsData == NULL)
        return -1;

    switch (sWonderNewsData->enterExitState)
    {
    case 0:
        BeginNormalPaletteFade(PALETTES_ALL, 0, 0, 16, RGB_BLACK);
        break;
    case 1:
        if (UpdatePaletteFade())
            return 0;
        ChangeBgY(0, 0, BG_COORD_SET);
        ChangeBgY(1, 0, BG_COORD_SET);
        ChangeBgY(2, 0, BG_COORD_SET);
        ChangeBgY(3, 0, BG_COORD_SET);
        SetGpuReg(REG_OFFSET_WIN0H, WIN_RANGE(0, DISPLAY_WIDTH));
        SetGpuReg(REG_OFFSET_WIN0V, WIN_RANGE(26, 152));
        SetGpuReg(REG_OFFSET_WININ, WININ_WIN0_BG_ALL | WININ_WIN0_OBJ);
        SetGpuReg(REG_OFFSET_WINOUT, WINOUT_WIN01_BG0 | WINOUT_WIN01_BG1 | WINOUT_WIN01_BG3 | WINOUT_WIN01_OBJ);
        SetGpuRegBits(REG_OFFSET_DISPCNT, DISPCNT_WIN0_ON);
        break;
    case 2:
        FillBgTilemapBufferRect_Palette0(0, 0x000, 0, 0, 30, 20);
        FillBgTilemapBufferRect_Palette0(1, 0x000, 0, 0, 30, 20);
        FillBgTilemapBufferRect_Palette0(2, 0x000, 0, 0, 30, 20);
        FillBgTilemapBufferRect_Palette0(3, 0x000, 0, 0, 30, 20);
        CopyBgTilemapBufferToVram(0);
        CopyBgTilemapBufferToVram(1);
        CopyBgTilemapBufferToVram(2);
        CopyBgTilemapBufferToVram(3);
        DecompressAndCopyTileDataToVram(3, sWonderNewsData->gfx->tiles, 0, 8, 0);
        sWonderNewsData->windowIds[WIN_TITLE] = AddWindow(&sWindowTemplates[WIN_TITLE]);
        sWonderNewsData->windowIds[WIN_BODY] = AddWindow(&sWindowTemplates[WIN_BODY]);
        break;
    case 3:
        if (FreeTempTileDataBuffersIfPossible())
            return 0;
        gPaletteFade.bufferTransferDisabled = TRUE;
        LoadPalette(sWonderNewsData->gfx->pal, BG_PLTT_ID(1), PLTT_SIZE_4BPP);
        LZ77UnCompWram(sWonderNewsData->gfx->map, sWonderNewsData->bgTilemapBuffer);
        CopyRectToBgTilemapBufferRect(1, sWonderNewsData->bgTilemapBuffer, 0, 0, 30, 3, 0, 0, 30, 3, 1, 8, 0);
        CopyRectToBgTilemapBufferRect(3, sWonderNewsData->bgTilemapBuffer, 0, 3, 30, 23, 0, 3, 30, 23, 1, 8, 0);
        CopyBgTilemapBufferToVram(1);
        CopyBgTilemapBufferToVram(3);
        break;
    case 4:
        BufferNewsText();
        break;
    case 5:
        DrawNewsWindows();
        CopyBgTilemapBufferToVram(0);
        CopyBgTilemapBufferToVram(2);
        break;
    case 6:
        ShowBg(1);
        ShowBg(2);
        ShowBg(3);
        gPaletteFade.bufferTransferDisabled = FALSE;
        sWonderNewsData->arrowTaskId = AddScrollIndicatorArrowPair(&sWonderNewsData->arrowsTemplate, &sWonderNewsData->scrollOffset);
        BeginNormalPaletteFade(PALETTES_ALL, 0, 16, 0, RGB_BLACK);
        UpdatePaletteFade();
        break;
    default:
        if (UpdatePaletteFade())
            return 0;
        sWonderNewsData->enterExitState = 0;
        return 1;
    }

    sWonderNewsData->enterExitState++;
    return 0;
}

s32 WonderNews_Exit(bool32 useCancel)
{
    if (sWonderNewsData == NULL)
        return -1;
    switch (sWonderNewsData->enterExitState)
    {
    case 0:
        BeginNormalPaletteFade(PALETTES_ALL, 0, 0, 16, RGB_BLACK);
        break;
    case 1:
        if (UpdatePaletteFade())
            return 0;
        ChangeBgY(2, 0, BG_COORD_SET);
        SetGpuReg(REG_OFFSET_WIN0H, 0);
        SetGpuReg(REG_OFFSET_WIN0V, 0);
        SetGpuReg(REG_OFFSET_WININ, 0);
        SetGpuReg(REG_OFFSET_WINOUT, 0);
        ClearGpuRegBits(REG_OFFSET_DISPCNT, DISPCNT_WIN0_ON);
        break;
    case 2:
        FillBgTilemapBufferRect_Palette0(0, 0x000, 0, 0, 30, 20);
        FillBgTilemapBufferRect_Palette0(1, 0x000, 0, 0, 30, 20);
        FillBgTilemapBufferRect_Palette0(2, 0x000, 0, 0, 30, 24);
        FillBgTilemapBufferRect_Palette0(3, 0x000, 0, 0, 30, 24);
        CopyBgTilemapBufferToVram(0);
        CopyBgTilemapBufferToVram(1);
        CopyBgTilemapBufferToVram(2);
        CopyBgTilemapBufferToVram(3);
        break;
    case 3:
        HideBg(1);
        HideBg(2);
        RemoveWindow(sWonderNewsData->windowIds[WIN_BODY]);
        RemoveWindow(sWonderNewsData->windowIds[WIN_TITLE]);
        break;
    case 4:
        ChangeBgY(2, 0, BG_COORD_SET);
        ChangeBgY(3, 0, BG_COORD_SET);
        if (sWonderNewsData->arrowTaskId != TASK_NONE)
        {
            RemoveScrollIndicatorArrowPair(sWonderNewsData->arrowTaskId);
            sWonderNewsData->arrowTaskId = TASK_NONE;
        }
        break;
    case 5:
        PrintMysteryGiftOrEReaderTopMenu(gGiftIsFromEReader, useCancel);
        break;
    case 6:
        MG_DrawCheckerboardPattern();
        CopyBgTilemapBufferToVram(0);
        CopyBgTilemapBufferToVram(3);
        BeginNormalPaletteFade(PALETTES_ALL, 0, 16, 0, RGB_BLACK);
        break;
    default:
        if (UpdatePaletteFade())
            return 0;
        sWonderNewsData->enterExitState = 0;
        return 1;
    }
    ++sWonderNewsData->enterExitState;
    return 0;
}

void WonderNews_RemoveScrollIndicatorArrowPair(void)
{
    if (!sWonderNewsData->verticalScrollDisabled && sWonderNewsData->arrowTaskId != TASK_NONE)
    {
        RemoveScrollIndicatorArrowPair(sWonderNewsData->arrowTaskId);
        sWonderNewsData->arrowTaskId = TASK_NONE;
        sWonderNewsData->verticalScrollDisabled = TRUE;
    }
}


void WonderNews_AddScrollIndicatorArrowPair(void)
{
    if (sWonderNewsData->verticalScrollDisabled)
    {
        sWonderNewsData->arrowTaskId = AddScrollIndicatorArrowPair(&sWonderNewsData->arrowsTemplate, &sWonderNewsData->scrollOffset);
        sWonderNewsData->verticalScrollDisabled = FALSE;
    }
}

u32 WonderNews_GetInput(u16 input)
{
    if (sWonderNewsData->scrolling)
    {
        UpdateNewsScroll();
        return NEWS_INPUT_NONE;
    }
    switch (input)
    {
    case A_BUTTON:
        return NEWS_INPUT_A;
    case B_BUTTON:
        return NEWS_INPUT_B;
    case DPAD_UP:
        if (sWonderNewsData->scrollOffset == 0)
            return NEWS_INPUT_NONE;
        if (sWonderNewsData->verticalScrollDisabled)
            return NEWS_INPUT_NONE;
        sWonderNewsData->scrollingDown = FALSE;
        break;
    case DPAD_DOWN:
        if (sWonderNewsData->scrollOffset == sWonderNewsData->scrollEnd)
            return NEWS_INPUT_NONE;
        if (sWonderNewsData->verticalScrollDisabled)
            return NEWS_INPUT_NONE;
        sWonderNewsData->scrollingDown = TRUE;
        break;
    default:
        return NEWS_INPUT_NONE;
    }

    // Init scroll
    sWonderNewsData->scrolling = TRUE;
    sWonderNewsData->scrollIncrement = 2;
    sWonderNewsData->scrollTotal = 0;
    if (!sWonderNewsData->scrollingDown)
        return NEWS_INPUT_SCROLL_UP;
    else
        return NEWS_INPUT_SCROLL_DOWN;
}

static void BufferNewsText(void)
{
    u8 i = 0;

    // Copy title text
    memcpy(sWonderNewsData->titleText, sWonderNewsData->news.titleText, WONDER_NEWS_TEXT_LENGTH);
    sWonderNewsData->titleText[WONDER_NEWS_TEXT_LENGTH] = EOS;

    // Copy body text
    for (; i < WONDER_NEWS_BODY_TEXT_LINES; i++)
    {
        memcpy(sWonderNewsData->bodyText[i], sWonderNewsData->news.bodyText[i], WONDER_NEWS_TEXT_LENGTH);
        sWonderNewsData->bodyText[i][WONDER_NEWS_TEXT_LENGTH] = EOS;
        if (i > 7 && sWonderNewsData->bodyText[i][0] != EOS)
            sWonderNewsData->scrollEnd++;
    }
    sWonderNewsData->arrowsTemplate = sArrowsTemplate;
    sWonderNewsData->arrowsTemplate.fullyDownThreshold = sWonderNewsData->scrollEnd;
}

static void DrawNewsWindows(void)
{
    u8 i = 0;
    s32 x;
    PutWindowTilemap(sWonderNewsData->windowIds[WIN_TITLE]);
    PutWindowTilemap(sWonderNewsData->windowIds[WIN_BODY]);
    FillWindowPixelBuffer(sWonderNewsData->windowIds[WIN_TITLE], 0);
    FillWindowPixelBuffer(sWonderNewsData->windowIds[WIN_BODY], 0);

    // Print title text
    x = (224 - GetStringWidth(FONT_NORMAL_COPY_2, sWonderNewsData->titleText, GetFontAttribute(FONT_NORMAL_COPY_2, FONTATTR_LETTER_SPACING))) / 2;
    if (x < 0)
        x = 0;
    AddTextPrinterParameterized3(sWonderNewsData->windowIds[WIN_TITLE], FONT_NORMAL_COPY_2, x, 6, sTextColorTable[sWonderNewsData->gfx->titleTextPal], 0, sWonderNewsData->titleText);
    
    // Print body text
    for (; i < WONDER_NEWS_BODY_TEXT_LINES; ++i)
    {
        AddTextPrinterParameterized3(sWonderNewsData->windowIds[WIN_BODY], FONT_NORMAL_COPY_2, 0,
                                     16 * i + 2,
                                     sTextColorTable[sWonderNewsData->gfx->bodyTextPal],
                                     0, sWonderNewsData->bodyText[i]);
    }
    CopyWindowToVram(sWonderNewsData->windowIds[WIN_TITLE], COPYWIN_FULL);
    CopyWindowToVram(sWonderNewsData->windowIds[WIN_BODY], COPYWIN_FULL);
}

static void UpdateNewsScroll(void)
{
    u16 bgMove = sWonderNewsData->scrollIncrement;
    bgMove *= 256;
    if (sWonderNewsData->scrollingDown)
    {
        ChangeBgY(2, bgMove, BG_COORD_ADD);
        ChangeBgY(3, bgMove, BG_COORD_ADD);
    }
    else
    {
        ChangeBgY(2, bgMove, BG_COORD_SUB);
        ChangeBgY(3, bgMove, BG_COORD_SUB);
    }
    sWonderNewsData->scrollTotal += sWonderNewsData->scrollIncrement;
    if (sWonderNewsData->scrollTotal > 15)
    {
        if (sWonderNewsData->scrollingDown)
            sWonderNewsData->scrollOffset++;
        else
            sWonderNewsData->scrollOffset--;
        sWonderNewsData->scrolling = FALSE;
        sWonderNewsData->scrollTotal = 0;
    }
}
