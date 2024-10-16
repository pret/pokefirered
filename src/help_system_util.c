#include "global.h"
#include "gflib.h"
#include "decompress.h"
#include "m4a.h"
#include "event_data.h"
#include "help_system.h"
#include "list_menu.h"
#include "strings.h"
#include "constants/songs.h"

#define ZERO 0

COMMON_DATA bool8 gHelpSystemEnabled = 0;

struct HelpSystemVideoState
{
    /*0x00*/ MainCallback savedVblankCb;
    /*0x04*/ MainCallback savedHblankCb;
    /*0x08*/ u16 savedDispCnt;
    /*0x0a*/ u16 savedBg0Cnt;
    /*0x0c*/ u16 savedBg0Hofs;
    /*0x0e*/ u16 savedBg0Vofs;
    /*0x10*/ u16 savedBldCnt;
    /*0x12*/ u8 savedTextColor[3];
    /*0x15*/ u8 state;
};

static EWRAM_DATA u8 sMapTilesBackup[BG_CHAR_SIZE] = {0};
EWRAM_DATA u8 gDisableHelpSystemVolumeReduce = 0;
EWRAM_DATA bool8 gHelpSystemToggleWithRButtonDisabled = FALSE;
static EWRAM_DATA u8 sDelayTimer = 0;
static EWRAM_DATA u8 sInHelpSystem = 0;
static EWRAM_DATA struct HelpSystemVideoState sVideoState = {0};
EWRAM_DATA struct HelpSystemListMenu gHelpSystemListMenu = {0};
EWRAM_DATA struct ListMenuItem gHelpSystemListMenuItems[52] = {0};

static const u16 sTiles[] = INCBIN_U16("graphics/help_system/bg_tiles.4bpp");
static const u16 sPals[] = INCBIN_U16("graphics/help_system/bg_tiles.gbapal");

u8 RunHelpSystemCallback(void)
{
    s32 i;

    switch (sVideoState.state)
    {
    case 0:
        sInHelpSystem = 0;
        if (gSaveBlock2Ptr->optionsButtonMode != OPTIONS_BUTTON_MODE_HELP)
            return 0;
        if (JOY_NEW(R_BUTTON) && gHelpSystemToggleWithRButtonDisabled == TRUE)
            return 0;
        if (JOY_NEW(L_BUTTON | R_BUTTON))
        {
            if (!HelpSystem_IsSinglePlayer() || !gHelpSystemEnabled)
            {
                PlaySE(SE_HELP_ERROR);
                return 0;
            }
            m4aMPlayStop(&gMPlayInfo_SE1);
            m4aMPlayStop(&gMPlayInfo_SE2);
            PlaySE(SE_HELP_OPEN);
            if (!gDisableHelpSystemVolumeReduce)
                m4aMPlayVolumeControl(&gMPlayInfo_BGM, TRACKS_ALL, 0x80);
            SaveCallbacks();
            sInHelpSystem = 1;
            sVideoState.state = 1;
        }
        break;
    case 1:
        SaveMapTiles();
        SaveMapGPURegs();
        SaveMapTextColors();
        (*(vu16 *)PLTT) = sPals[15];
        SetGpuReg(REG_OFFSET_DISPCNT, 0);
        sVideoState.state = 2;
        break;
    case 2:
        RequestDma3Fill(0, (void *)BG_CHAR_ADDR(3), BG_CHAR_SIZE, DMA3_16BIT);
        RequestDma3Copy(sPals, (void *)PLTT, sizeof(sPals), DMA3_16BIT);
        RequestDma3Copy(sTiles, gDecompressionBuffer + 0x3EE0, sizeof(sTiles), DMA3_16BIT);
        sVideoState.state = 3;
        break;
    case 3:
        HS_BufferFillMapWithTile1FF();
        HelpSystem_FillPanel3();
        HelpSystem_FillPanel2();
        HelpSystem_PrintTextInTopLeftCorner(gString_Help);
        HS_ShowOrHideWordHELPinTopLeft(1);
        if (HelpSystem_UpdateHasntSeenIntro() == TRUE)
            HelpSystemSubroutine_PrintWelcomeMessage(&gHelpSystemListMenu, gHelpSystemListMenuItems);
        else
            HelpSystemSubroutine_WelcomeEndGotoMenu(&gHelpSystemListMenu, gHelpSystemListMenuItems);
        HS_ShowOrHideHeaderAndFooterLines_Lighter(1);
        HS_ShowOrHideVerticalBlackBarsAlongSides(1);
        CommitTilemap();
        sVideoState.state = 4;
        break;
    case 4:
        SetGpuReg(REG_OFFSET_BLDCNT, 0);
        SetGpuReg(REG_OFFSET_BG0HOFS, 0);
        SetGpuReg(REG_OFFSET_BG0VOFS, 0);
        SetGpuReg(REG_OFFSET_BG0CNT, BGCNT_PRIORITY(0) | BGCNT_CHARBASE(3) | BGCNT_16COLOR | BGCNT_SCREENBASE(31));
        SetGpuReg(REG_OFFSET_DISPCNT, DISPCNT_BG0_ON);
        sVideoState.state = 5;
        break;
    case 5:
        if (!RunHelpMenuSubroutine(&gHelpSystemListMenu, gHelpSystemListMenuItems))
        {
            PlaySE(SE_HELP_CLOSE);
            sVideoState.state = 6;
        }
        break;
    case 6:
        SetGpuReg(REG_OFFSET_DISPCNT, 0);
        RestoreMapTiles();
        for (i = 0; i < 0x200; i += 2)
        {
            *((vu16 *)(PLTT + 0x000 + i)) = sPals[15];
            *((vu16 *)(PLTT + 0x200 + i)) = sPals[15];
        }
        sVideoState.state = 7;
        break;
    case 7:
        if (!gDisableHelpSystemVolumeReduce)
            m4aMPlayVolumeControl(&gMPlayInfo_BGM, TRACKS_ALL, 0x100);
        RestoreMapTextColors();
        RestoreGPURegs();
        sVideoState.state = 8;
        break;
    case 8:
        RestoreCallbacks();
        sInHelpSystem = 0;
        sVideoState.state = 0;
        break;
    }
    return sVideoState.state;
}

void SaveCallbacks(void)
{
    vu16 * dma;
    sVideoState.savedVblankCb = gMain.vblankCallback;
    sVideoState.savedHblankCb = gMain.hblankCallback;
    gMain.vblankCallback = NULL;
    gMain.hblankCallback = NULL;

    dma = (void *)REG_ADDR_DMA0;
    dma[5] &= ~(DMA_START_MASK | DMA_DREQ_ON | DMA_REPEAT);
    dma[5] &= ~DMA_ENABLE;
    dma[5];
}

void SaveMapGPURegs(void)
{
    sVideoState.savedDispCnt = GetGpuReg(REG_OFFSET_DISPCNT);
    sVideoState.savedBg0Cnt = GetGpuReg(REG_OFFSET_BG0CNT);
    sVideoState.savedBg0Hofs = GetGpuReg(REG_OFFSET_BG0HOFS);
    sVideoState.savedBg0Vofs = GetGpuReg(REG_OFFSET_BG0VOFS);
    sVideoState.savedBldCnt = GetGpuReg(REG_OFFSET_BLDCNT);
}

void SaveMapTiles(void)
{
    RequestDma3Copy((void *)BG_CHAR_ADDR(3), sMapTilesBackup, BG_CHAR_SIZE, DMA3_16BIT);
}

void SaveMapTextColors(void)
{
    SaveTextColors(
        &sVideoState.savedTextColor[0],
        &sVideoState.savedTextColor[1],
        &sVideoState.savedTextColor[2]
    );
}

void RestoreCallbacks(void)
{
    gMain.vblankCallback = sVideoState.savedVblankCb;
    gMain.hblankCallback = sVideoState.savedHblankCb;
}

void RestoreGPURegs(void)
{
    SetGpuReg(REG_OFFSET_BLDCNT, sVideoState.savedBldCnt);
    SetGpuReg(REG_OFFSET_BG0HOFS, sVideoState.savedBg0Hofs);
    SetGpuReg(REG_OFFSET_BG0VOFS, sVideoState.savedBg0Vofs);
    SetGpuReg(REG_OFFSET_BG0CNT, sVideoState.savedBg0Cnt);
    SetGpuReg(REG_OFFSET_DISPCNT, sVideoState.savedDispCnt);
}

void RestoreMapTiles(void)
{
    RequestDma3Copy(sMapTilesBackup, (void *)BG_CHAR_ADDR(3), BG_CHAR_SIZE, DMA3_16BIT);
}

void RestoreMapTextColors(void)
{
    RestoreTextColors(
        &sVideoState.savedTextColor[0],
        &sVideoState.savedTextColor[1],
        &sVideoState.savedTextColor[2]
    );
}

void CommitTilemap(void)
{
    RequestDma3Copy(gDecompressionBuffer, (void *)BG_CHAR_ADDR(3), BG_CHAR_SIZE, DMA3_16BIT);
}

void HS_DrawBgTilemapRect(u16 baseTile, u8 left, u8 top, u8 width, u8 height, u16 increment)
{
    u16 i, j;

    for (i = top; i < top + height; i++)
    {
        for (j = left; j < left + width; j++)
        {
            *((u16 *)(gDecompressionBuffer + 0x3800 + 64 * i + 2 * j)) = baseTile;
            baseTile += increment;
        }
    }

    CommitTilemap();
}

void HS_BufferFillMapWithTile1FF(void)
{
    HS_DrawBgTilemapRect(0x1FF, 0, 0, 30, 20, 0);
}

void HS_ShowOrHideWordHELPinTopLeft(u8 mode)
{
    switch (mode)
    {
    case 0:
        HS_DrawBgTilemapRect(0x1FF, 1, 0, 7, 2, 0);
        break;
    case 1:
        HS_DrawBgTilemapRect(0x1E8, 1, 0, 7, 2, 1);
        break;
    }
}

void HS_ShowOrHideControlsGuideInTopRight(u8 mode)
{
    switch (mode)
    {
    case 0:
        HS_DrawBgTilemapRect(0x1FF, 13, 0, 16, 2, 0);
        break;
    case 1:
        HS_DrawBgTilemapRect(0x1A0, 13, 0, 16, 2, 1);
        break;
    }
}

void HS_ShowOrHideMainWindowText(u8 mode)
{
    switch (mode)
    {
    case 0:
        HS_DrawBgTilemapRect(0x1FF, 2, 3, 26, 16, 0);
        break;
    case 1:
        HS_DrawBgTilemapRect(0x000, 2, 3, 26, 16, 1);
        break;
    }
}

void HS_SetMainWindowBgBrightness(u8 mode)
{
    switch (mode)
    {
    case 0:
        // Brighter
        HS_DrawBgTilemapRect(0x1FF, 1, 3, 28, 16, 0);
        break;
    case 1:
        // Darker
        HS_DrawBgTilemapRect(0x1FA, 1, 3, 28, 17, 0);
        break;
    }
}

void HS_ShowOrHideToplevelTooltipWindow(u8 mode)
{
    switch (mode)
    {
    case 0:
        HS_DrawBgTilemapRect(0x1FF, 2, 14, 26, 5, 0);
        break;
    case 1:
        HS_DrawBgTilemapRect(0x11E, 2, 14, 26, 5, 1);
        break;
    }
}

void HS_ShowOrHideHeaderAndFooterLines_Lighter(u8 mode)
{
    switch (mode)
    {
    case 0:
        HS_DrawBgTilemapRect(0x1FF, 1,  2, 28, 1, 0);
        HS_DrawBgTilemapRect(0x1FF, 1, 19, 28, 1, 0);
        break;
    case 1:
        HS_DrawBgTilemapRect(0x1F7, 1,  2, 28, 1, 0);
        HS_DrawBgTilemapRect(0x1F8, 1, 19, 28, 1, 0);
        break;
    }
}

void HS_ShowOrHideHeaderAndFooterLines_Darker(u8 mode)
{
    switch (mode)
    {
    case 0:
        HS_DrawBgTilemapRect(0x1FF, 1,  2, 28, 1, 0);
        HS_DrawBgTilemapRect(0x1FF, 1, 19, 28, 1, 0);
        break;
    case 1:
        HS_DrawBgTilemapRect(0x1FB, 1,  2, 28, 1, 0);
        HS_DrawBgTilemapRect(0x1FC, 1, 19, 28, 1, 0);
        break;
    }
}

void HS_ShowOrHideVerticalBlackBarsAlongSides(u8 mode)
{
    switch (mode)
    {
    case 0:
        HS_DrawBgTilemapRect(0x1FF,  0, 0, 1, 20, 0);
        HS_DrawBgTilemapRect(0x1FF, 29, 0, 1, 20, 0);
        break;
    case 1:
        HS_DrawBgTilemapRect(0x1F9,  0, 0, 1, 20, 0);
        HS_DrawBgTilemapRect(0x1F9, 29, 0, 1, 20, 0);
        break;
    }
}

void HS_ShowOrHideHeaderLine_Darker_FooterStyle(u8 mode)
{
    switch (mode)
    {
    case 0:
        HS_DrawBgTilemapRect(0x1FF, 1, 5, 28, 1, 0);
        break;
    case 1:
        HS_DrawBgTilemapRect(0x1FC, 1, 5, 28, 1, 0);
        break;
    }
}

void HS_ShowOrHideScrollArrows(u8 which, u8 mode)
{
    switch (mode)
    {
    case 0:
        HS_DrawBgTilemapRect(0x1FF, 28,  3, 1, 1, 0);
        HS_DrawBgTilemapRect(0x1FF, 28, 18, 1, 1, 0);
        break;
    case 1:
        if (which == 0) // top
            HS_DrawBgTilemapRect(0x1FE, 28,  3, 1, 1, 0);
        else // bottom
            HS_DrawBgTilemapRect(0x1FD, 28, 18, 1, 1, 0);
        break;
    }
}

void HelpSystemRenderText(u8 fontId, u8 * dest, const u8 * src, u8 x, u8 y, u8 width, u8 height)
{
    // fontId -> sp+24
    // dest -> sp+28
    // src -> r9
    // x -> sp+34
    // y -> r10
    // width -> sp+2C
    // height -> sp+30
    struct Bitmap srcBlit;
    struct Bitmap destBlit;
    u8 orig_x = x;
    u8 i = 0;
    s32 clearPixels = 0;

    while (1)
    {
        u16 curChar = *src;
        src++;
        switch (curChar)
        {
        case EOS:
            return;
        case CHAR_NEWLINE:
            x = orig_x;
            y += gGlyphInfo.height + 1;
            break;
        case PLACEHOLDER_BEGIN:
            curChar = *src;
            src++;
            if (curChar == PLACEHOLDER_ID_PLAYER)
            {
                for (i = 0; i < 10; i++)
                {
                    if (gSaveBlock2Ptr->playerName[i] == EOS)
                    {
                        break;
                    }
                    DecompressAndRenderGlyph(fontId, gSaveBlock2Ptr->playerName[i], &srcBlit, &destBlit, dest, x, y, width, height);
                    // This is required to match a dummy [sp+#0x24] read here
                    if (fontId == FONT_SMALL)
                    {
                        x += gGlyphInfo.width;
                    }
                    else
                    {
                        x += gGlyphInfo.width + ZERO;
                    }
                }
            }
            else if (curChar == PLACEHOLDER_ID_STRING_VAR_1)
            {
                for (i = 0; ; i++)
                {
                    if (FlagGet(FLAG_SYS_NOT_SOMEONES_PC) == TRUE)
                    {
                        if (gString_Bill[i] == EOS)
                        {
                            break;
                        }
                        DecompressAndRenderGlyph(fontId, gString_Bill[i], &srcBlit, &destBlit, dest, x, y, width, height);
                    }
                    else
                    {
                        if (gString_Someone[i] == EOS)
                        {
                            break;
                        }
                        DecompressAndRenderGlyph(fontId, gString_Someone[i], &srcBlit, &destBlit, dest, x, y, width, height);
                    }
                    if (fontId == FONT_SMALL)
                    {
                        x += gGlyphInfo.width;
                    }
                    else
                    {
                        x += gGlyphInfo.width + ZERO;
                    }
                }
            }
            break;
        case CHAR_PROMPT_SCROLL:
        case CHAR_PROMPT_CLEAR:
            x = orig_x;
            y += gGlyphInfo.height + 1;
            break;
        case EXT_CTRL_CODE_BEGIN:
            curChar = *src;
            src++;
            switch (curChar)
            {
            case EXT_CTRL_CODE_COLOR_HIGHLIGHT_SHADOW:
                src++;
                //fallthrough
            case EXT_CTRL_CODE_PLAY_BGM:
            case EXT_CTRL_CODE_PLAY_SE:
                src++;
                //fallthrough
            case EXT_CTRL_CODE_COLOR:
            case EXT_CTRL_CODE_HIGHLIGHT:
            case EXT_CTRL_CODE_SHADOW:
            case EXT_CTRL_CODE_PALETTE:
            case EXT_CTRL_CODE_FONT:
            case EXT_CTRL_CODE_PAUSE:
            case EXT_CTRL_CODE_ESCAPE:
            case EXT_CTRL_CODE_SHIFT_RIGHT:
            case EXT_CTRL_CODE_SHIFT_DOWN:
                src++;
            case EXT_CTRL_CODE_RESET_FONT:
            case EXT_CTRL_CODE_PAUSE_UNTIL_PRESS:
            case EXT_CTRL_CODE_WAIT_SE:
            case EXT_CTRL_CODE_FILL_WINDOW:
                break;
            case EXT_CTRL_CODE_CLEAR:
            case EXT_CTRL_CODE_SKIP:
                src++;
                break;
            case EXT_CTRL_CODE_CLEAR_TO:
            {
                clearPixels = *src + orig_x - x;

                if (clearPixels > 0)
                {
                    destBlit.pixels = dest;
                    destBlit.width = width * 8;
                    destBlit.height = height * 8;
                    FillBitmapRect4Bit(&destBlit, x, y, clearPixels, GetFontAttribute(fontId, FONTATTR_MAX_LETTER_HEIGHT), 0);
                    x += clearPixels;
                }
                src++;
                break;
            }
            case EXT_CTRL_CODE_MIN_LETTER_SPACING:
                src++;
                break;
            case EXT_CTRL_CODE_JPN:
            case EXT_CTRL_CODE_ENG:
                break;
            }
            break;
        case CHAR_KEYPAD_ICON:
            curChar = *src;
            src++;
            srcBlit.pixels = (u8 *)&gKeypadIconTiles[0x20 * GetKeypadIconTileOffset(curChar)];
            srcBlit.width = 0x80;
            srcBlit.height = 0x80;
            destBlit.pixels = dest;
            destBlit.width = width * 8;
            destBlit.height = height * 8;
            BlitBitmapRect4Bit(&srcBlit, &destBlit, 0, 0, x, y, GetKeypadIconWidth(curChar), GetKeypadIconHeight(curChar), 0);
            x += GetKeypadIconWidth(curChar);
            break;
        case CHAR_EXTRA_SYMBOL:
            curChar = *src + 0x100;
            src++;
            //fallthrough
        default:
            if (curChar == CHAR_SPACE)
            {
                if (fontId == FONT_SMALL)
                {
                    x += 5;
                }
                else
                {
                    x += 4;
                }
            }
            else
            {
                DecompressAndRenderGlyph(fontId, curChar, &srcBlit, &destBlit, dest, x, y, width, height);
                if (fontId == FONT_SMALL)
                {
                    x += gGlyphInfo.width;
                }
                else
                {
                    x += gGlyphInfo.width + ZERO;
                }
            }
            break;
        }
    }
}

void DecompressAndRenderGlyph(u8 fontId, u16 glyph, struct Bitmap *srcBlit, struct Bitmap *destBlit, u8 *destBuffer, u8 x, u8 y, u8 width, u8 height)
{
    if (fontId == FONT_SMALL)
        DecompressGlyph_Small(glyph, FALSE);
    else if (fontId == FONT_FEMALE)
        DecompressGlyph_Female(glyph, FALSE);
    else
        DecompressGlyph_Normal(glyph, FALSE);
    srcBlit->pixels = gGlyphInfo.pixels;
    srcBlit->width = 16;
    srcBlit->height = 16;
    destBlit->pixels = destBuffer;
    destBlit->width = width * 8;
    destBlit->height = height * 8;
    BlitBitmapRect4Bit(srcBlit, destBlit, 0, 0, x, y, gGlyphInfo.width, gGlyphInfo.height, 0);
}

void HelpSystem_PrintTextInTopLeftCorner(const u8 * str)
{
    GenerateFontHalfRowLookupTable(TEXT_COLOR_WHITE, TEXT_DYNAMIC_COLOR_6, TEXT_COLOR_DARK_GRAY);
    HelpSystemRenderText(5, gDecompressionBuffer + 0x3D00, str, 6, 2, 7, 2);
}

void HelpSystem_PrintTextRightAlign_Row52(const u8 * str)
{
    s32 left = 0x7C - GetStringWidth(FONT_SMALL, str, 0);
    GenerateFontHalfRowLookupTable(TEXT_COLOR_WHITE, TEXT_DYNAMIC_COLOR_6, TEXT_COLOR_DARK_GRAY);
    HelpSystemRenderText(0, gDecompressionBuffer + 0x3400, str, left, 2, 16, 2);
}

void HelpSystem_PrintTextAt(const u8 * str, u8 x, u8 y)
{
    GenerateFontHalfRowLookupTable(TEXT_COLOR_WHITE, TEXT_DYNAMIC_COLOR_6, TEXT_COLOR_DARK_GRAY);
    HelpSystemRenderText(2, gDecompressionBuffer + 0x0000, str, x, y, 26, 16);
}

void HelpSystem_PrintQuestionAndAnswerPair(const u8 * question, const u8 * answer)
{
    CpuFill16(0xEEEE, gDecompressionBuffer + 0x0000, 0x3400);
    GenerateFontHalfRowLookupTable(TEXT_COLOR_WHITE, TEXT_DYNAMIC_COLOR_5, TEXT_COLOR_DARK_GRAY);
    HelpSystemRenderText(2, gDecompressionBuffer + 0x0000, question, 0, 0, 26, 16);
    HelpSystemRenderText(2, gDecompressionBuffer + 0x09C0, answer, 0, 0, 26, 13);
}

void HelpSystem_PrintTopicMouseoverDescription(const u8 * str)
{
    CpuFill16(0x1111, gDecompressionBuffer + 0x23C0, 0x1040);
    GenerateFontHalfRowLookupTable(TEXT_COLOR_DARK_GRAY, TEXT_COLOR_WHITE, TEXT_COLOR_LIGHT_GRAY);
    HelpSystemRenderText(2, gDecompressionBuffer + 0x23C0, str, 2, 6, 26, 5);
}

void HelpSystem_FillPanel3(void)
{
    CpuFill16(0xFFFF, gDecompressionBuffer + 0x3D00, 0x1C0);
}

void HelpSystem_FillPanel2(void)
{
    CpuFill16(0xFFFF, gDecompressionBuffer + 0x3400, 0x400);
}

void HelpSystem_FillPanel1(void)
{
    CpuFill16(0xFFFF, gDecompressionBuffer + 0x0000, 0x3400);
}

void HelpSystem_InitListMenuController(struct HelpSystemListMenu * a0, u8 a1, u8 a2)
{
    gHelpSystemListMenu.sub = a0->sub;
    gHelpSystemListMenu.itemsAbove = a1;
    gHelpSystemListMenu.cursorPos = a2;
    gHelpSystemListMenu.state = 0;
    if (gHelpSystemListMenu.sub.totalItems < gHelpSystemListMenu.sub.maxShowed)
        gHelpSystemListMenu.sub.maxShowed = gHelpSystemListMenu.sub.totalItems;
    HS_ShowOrHideMainWindowText(0);
    HelpSystem_FillPanel1();
    PrintListMenuItems();
    PlaceListMenuCursor();
}

void HelpSystem_SetInputDelay(u8 a0)
{
    sDelayTimer = a0;
}

s32 HelpSystem_GetMenuInput(void)
{
    if (sDelayTimer != 0)
    {
        sDelayTimer--;
        return -1;
    }
    else if (JOY_NEW(A_BUTTON))
    {
        PlaySE(SE_SELECT);
        return gHelpSystemListMenu.sub.items[gHelpSystemListMenu.itemsAbove + gHelpSystemListMenu.cursorPos].index;
    }
    else if (JOY_NEW(B_BUTTON))
    {
        PlaySE(SE_SELECT);
        return -2;
    }
    else if (JOY_NEW(L_BUTTON | R_BUTTON))
    {
        return -6;
    }
    else if (JOY_REPT(DPAD_UP))
    {
        if (!MoveCursor(1, 0))
            PlaySE(SE_SELECT);
        return -4;
    }
    else if (JOY_REPT(DPAD_DOWN))
    {
        if (!MoveCursor(1, 1))
            PlaySE(SE_SELECT);
        return -5;
    }
    else if (JOY_REPT(DPAD_LEFT))
    {
        if (!MoveCursor(7, 0))
            PlaySE(SE_SELECT);
        return -4;
    }
    else if (JOY_REPT(DPAD_RIGHT))
    {
        if (!MoveCursor(7, 1))
            PlaySE(SE_SELECT);
        return -5;
    }
    else
        return -1;
}

void HS_UpdateMenuScrollArrows(void)
{
    u8 topItemIdx = gHelpSystemListMenu.sub.totalItems - 7;
    if (gHelpSystemListMenu.sub.totalItems > 7)
    {
        s32 cursorPos = gHelpSystemListMenu.itemsAbove + gHelpSystemListMenu.cursorPos;
        HS_ShowOrHideScrollArrows(0, 0); // Hide both
        if (cursorPos == 0)
            HS_ShowOrHideScrollArrows(1, 1); // Show bottom
        else if (gHelpSystemListMenu.itemsAbove == 0 && gHelpSystemListMenu.cursorPos != 0)
            HS_ShowOrHideScrollArrows(1, 1); // Show bottom
        else if (gHelpSystemListMenu.itemsAbove == topItemIdx)
            HS_ShowOrHideScrollArrows(0, 1); // Show top
        else if (gHelpSystemListMenu.itemsAbove != 0)
        {
            // Show both
            HS_ShowOrHideScrollArrows(0, 1);
            HS_ShowOrHideScrollArrows(1, 1);
        }
    }
}

void PrintListMenuItems(void)
{
    u8 glyphHeight = GetFontAttribute(FONT_NORMAL, FONTATTR_MAX_LETTER_HEIGHT) + 1;
    s32 i;
    s32 r5 = gHelpSystemListMenu.itemsAbove;

    for (i = 0; i < gHelpSystemListMenu.sub.maxShowed; i++)
    {
        u8 x = gHelpSystemListMenu.sub.left + 8;
        u8 y = gHelpSystemListMenu.sub.top + glyphHeight * i;
        HelpSystem_PrintTextAt(gHelpSystemListMenu.sub.items[r5].label, x, y);
        r5++;
    }
}

void PlaceListMenuCursor(void)
{
    u8 glyphHeight = GetFontAttribute(FONT_NORMAL, FONTATTR_MAX_LETTER_HEIGHT) + 1;
    u8 x = gHelpSystemListMenu.sub.left;
    u8 y = gHelpSystemListMenu.sub.top + glyphHeight * gHelpSystemListMenu.cursorPos;
    HelpSystem_PrintTextAt(gText_SelectorArrow2, x, y);
}

void HS_RemoveSelectionCursorAt(u8 i)
{
    u8 glyphHeight = GetFontAttribute(FONT_NORMAL, FONTATTR_MAX_LETTER_HEIGHT) + 1;
    u8 x = gHelpSystemListMenu.sub.left;
    u8 y = gHelpSystemListMenu.sub.top + i * glyphHeight;
    HelpSystem_PrintTextAt(gString_HelpSystem_ClearTo8, x, y);
}

u8 TryMoveCursor1(u8 dirn)
{
    u16 midPoint;
    if (dirn == 0)
    {
        if (gHelpSystemListMenu.sub.maxShowed == 1)
            midPoint = 0;
        else
            midPoint = gHelpSystemListMenu.sub.maxShowed - (gHelpSystemListMenu.sub.maxShowed / 2 + (gHelpSystemListMenu.sub.maxShowed & 1)) - 1;
        if (gHelpSystemListMenu.itemsAbove == 0)
        {
            if (gHelpSystemListMenu.cursorPos != 0)
            {
                gHelpSystemListMenu.cursorPos--;
                return 1;
            }
            else
                return 0;
        }
        if (gHelpSystemListMenu.cursorPos > midPoint)
        {
            gHelpSystemListMenu.cursorPos--;
            return 1;
        }
        else
        {
            gHelpSystemListMenu.itemsAbove--;
            return 2;
        }
    }
    else
    {
        if (gHelpSystemListMenu.sub.maxShowed == 1)
            midPoint = 0;
        else
            midPoint = gHelpSystemListMenu.sub.maxShowed / 2 + (gHelpSystemListMenu.sub.maxShowed & 1);
        if (gHelpSystemListMenu.itemsAbove == gHelpSystemListMenu.sub.totalItems - gHelpSystemListMenu.sub.maxShowed)
        {
            if (gHelpSystemListMenu.cursorPos < gHelpSystemListMenu.sub.maxShowed - 1)
            {
                gHelpSystemListMenu.cursorPos++;
                return 1;
            }
            else
                return 0;
        }
        else if (gHelpSystemListMenu.cursorPos < midPoint)
        {
            gHelpSystemListMenu.cursorPos++;
            return 1;
        }
        else
        {
            gHelpSystemListMenu.itemsAbove++;
            return 2;
        }
    }
}

bool8 MoveCursor(u8 by, u8 dirn)
{
    u8 r7 = gHelpSystemListMenu.cursorPos;
    u8 flags = 0;
    s32 i;
    for (i = 0; i < by; i++)
        flags |= TryMoveCursor1(dirn);

    switch (flags)
    {
    case 0:
    default:
        // neither changed
        return TRUE;
    case 1:
        // changed cursorPos only
        HS_RemoveSelectionCursorAt(r7);
        PlaceListMenuCursor();
        CommitTilemap();
        break;
    case 2:
    case 3:
        // changed itemsAbove
        if (GetHelpSystemMenuLevel() == 1)
        {
            HelpSystem_SetInputDelay(2);
            HelpSystem_FillPanel1();
            PrintListMenuItems();
            PlaceListMenuCursor();
            HelpSystem_PrintTopicLabel();
            HS_UpdateMenuScrollArrows();
        }
        else
        {
            HS_ShowOrHideMainWindowText(0);
            HelpSystem_FillPanel1();
            PrintListMenuItems();
            PlaceListMenuCursor();
            HS_ShowOrHideMainWindowText(1);
        }
        CommitTilemap();
        break;
    }
    return FALSE;
}
