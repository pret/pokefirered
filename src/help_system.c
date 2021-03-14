#include "global.h"
#include "gflib.h"
#include "decompress.h"
#include "m4a.h"
#include "event_data.h"
#include "help_system.h"
#include "list_menu.h"
#include "strings.h"
#include "event_data.h"
#include "constants/songs.h"

#if !defined(NONMATCHING) && MODERN
#define static
#endif

extern u8 gGlyphInfo[];

bool8 gHelpSystemEnabled;

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
EWRAM_DATA u8 gUnknown_203F174 = 0;
EWRAM_DATA bool8 gHelpSystemToggleWithRButtonDisabled = FALSE;
static EWRAM_DATA u8 sDelayTimer = 0;
static EWRAM_DATA u8 sInHelpSystem = 0;
static EWRAM_DATA struct HelpSystemVideoState sVideoState = {0};
EWRAM_DATA struct HelpSystemListMenu gHelpSystemListMenu = {0};
EWRAM_DATA struct ListMenuItem gHelpSystemListMenuItems[52] = {0};

static const u16 sTiles[] = INCBIN_U16("graphics/help_system/unk_8464008.4bpp");
static const u16 sPals[] = INCBIN_U16("graphics/help_system/unk_8464008.gbapal");

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
            if (!sub_812B45C() || !gHelpSystemEnabled)
            {
                PlaySE(SE_HELP_ERROR);
                return 0;
            }
            m4aMPlayStop(&gMPlayInfo_SE1);
            m4aMPlayStop(&gMPlayInfo_SE2);
            PlaySE(SE_HELP_OPEN);
            if (!gUnknown_203F174)
                m4aMPlayVolumeControl(&gMPlayInfo_BGM, 0xFFFF, 0x80);
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
        sub_813BCF4();
        HelpSystem_FillPanel3();
        HelpSystem_FillPanel2();
        HelpSystem_PrintText_Row61(gString_Help);
        sub_813BD14(1);
        if (HelpSystem_UpdateHasntSeenIntro() == TRUE)
            HelpSystemSubroutine_PrintWelcomeMessage(&gHelpSystemListMenu, gHelpSystemListMenuItems);
        else
            HelpSystemSubroutine_WelcomeEndGotoMenu(&gHelpSystemListMenu, gHelpSystemListMenuItems);
        sub_813BE78(1);
        sub_813BF50(1);
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
        if (!gUnknown_203F174)
            m4aMPlayVolumeControl(&gMPlayInfo_BGM, 0xFFFF, 0x100);
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

void sub_813BCF4(void)
{
    HS_DrawBgTilemapRect(0x1FF, 0, 0, 30, 20, 0);
}

void sub_813BD14(u8 mode)
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

void sub_813BD5C(u8 mode)
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

void sub_813BDA4(u8 mode)
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

void sub_813BDE8(u8 mode)
{
    switch (mode)
    {
    case 0:
        HS_DrawBgTilemapRect(0x1FF, 1, 3, 28, 16, 0);
        break;
    case 1:
        HS_DrawBgTilemapRect(0x1FA, 1, 3, 28, 17, 0);
        break;
    }
}

void sub_813BE30(u8 mode)
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

void sub_813BE78(u8 mode)
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

void sub_813BEE4(u8 mode)
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

void sub_813BF50(u8 mode)
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

void sub_813BFC0(u8 mode)
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

void sub_813C004(u8 a0, u8 mode)
{
    switch (mode)
    {
    case 0:
        HS_DrawBgTilemapRect(0x1FF, 28,  3, 1, 1, 0);
        HS_DrawBgTilemapRect(0x1FF, 28, 18, 1, 1, 0);
        break;
    case 1:
        if (a0 == 0)
            HS_DrawBgTilemapRect(0x1FE, 28,  3, 1, 1, 0);
        else
            HS_DrawBgTilemapRect(0x1FD, 28, 18, 1, 1, 0);
        break;
    }
}

#define HelpSystemHandleRenderGlyph(character) ({\
    do {DecompressAndRenderGlyph(font, character, &srcBlit, &destBlit, dest, x, y, width, height);} while (0); font;\
})

#ifdef NONMATCHING
void HelpSystemRenderText(u8 font, u8 * dest, const u8 * src, u8 x, u8 y, u8 width, u8 height)
{
    // font -> sp+24
    // dest -> sp+28
    // src -> r9
    // x -> sp+34
    // y -> r10
    // width -> sp+2C
    // height -> sp+30
    struct Bitmap srcBlit;
    struct Bitmap destBlit;
    u8 i;
    u8 orig_x = x;
    s32 clearPixels;

    while (1)
    {
        u16 curChar = *src++;
        switch (curChar)
        {
        case EOS:
            return;
        case PLACEHOLDER_BEGIN:
            curChar = *src++;
            if (curChar == 1) {
                for (i = 0; i < 10; i++)
                {
                    if (gSaveBlock2Ptr->playerName[i] == EOS)
                        break;
                    HelpSystemHandleRenderGlyph(gSaveBlock2Ptr->playerName[i]);
                    x += gGlyphInfo[0x80];
                }
            }
            else if (curChar == 2)
            {
                for (i = 0; ; i++)
                {
                    if (FlagGet(FLAG_SYS_NOT_SOMEONES_PC) == TRUE)
                    {
                        if (gString_Bill[i] == EOS)
                            break;
                        HelpSystemHandleRenderGlyph(gString_Bill[i]);
                    }
                    else
                    {
                        if (gString_Someone[i] == EOS)
                            break;
                        HelpSystemHandleRenderGlyph(gString_Someone[i]);
                    }
                    x += gGlyphInfo[0x80];
                }
            }
            break;
        case CHAR_PROMPT_SCROLL:
        case CHAR_PROMPT_CLEAR:
        case CHAR_NEWLINE:
            x = orig_x;
            y += gGlyphInfo[0x81] + 1;
            break;
        case EXT_CTRL_CODE_BEGIN:
            curChar = *src++;
            switch (curChar)
            {
            case 4:
                src++;
                //fallthrough
            case 11:
            case 16:
                src++;
                //fallthrough
            case 1:
            case 2:
            case 3:
            case 5:
            case 6:
            case 8:
            case 12:
            case 13:
            case 14:
                src++;
                break;
            case 19:
                clearPixels = *src + orig_x - x;
                if (clearPixels > 0)
                {
                    destBlit.pixels = dest;
                    destBlit.width = width * 8;
                    destBlit.height = height * 8;
                    FillBitmapRect4Bit(&destBlit, x, y, clearPixels, GetFontAttribute(font, 1), 0);
                    x += clearPixels;
                }
                src++;
                break;
            case 17:
            case 18:
            case 20:
                src++;
                break;
            case 7:
            case 9:
            case 10:
            case 15:
            case 21:
            case 22:
                break;
            }
            break;
        case CHAR_KEYPAD_ICON:
            curChar = *src++;
            srcBlit.pixels = (u8 *)gKeypadIconTiles + 0x20 * GetKeypadIconTileOffset(curChar);
            srcBlit.width = 0x80;
            srcBlit.height = 0x80;
            destBlit.pixels = dest;
            destBlit.width = width * 8;
            destBlit.height = height * 8;
            BlitBitmapRect4Bit(&srcBlit, &destBlit, 0, 0, x, y, GetKeypadIconWidth(curChar), GetKeypadIconHeight(curChar), 0);
            x += GetKeypadIconWidth(curChar);
            break;
        case CHAR_EXTRA_EMOJI:
            curChar = 0x100 | *src++;
            //fallthrough
        default:
            if (curChar == CHAR_SPACE)
            {
                if (font == 0)
                    x += 5;
                else
                    x += 4;
            }
            else
            {
                HelpSystemHandleRenderGlyph(curChar);
                x += gGlyphInfo[0x80];
            }
            break;
        }
    }
}
#else
NAKED
void HelpSystemRenderText(u8 font, u8 * dest, const u8 * src, u8 x, u8 y, u8 width, u8 height)
{
    asm_unified("\tpush {r4-r7,lr}\n"
                "\tmov r7, r10\n"
                "\tmov r6, r9\n"
                "\tmov r5, r8\n"
                "\tpush {r5-r7}\n"
                "\tsub sp, 0x38\n"
                "\tstr r1, [sp, 0x28]\n"
                "\tmov r9, r2\n"
                "\tldr r1, [sp, 0x58]\n"
                "\tldr r2, [sp, 0x5C]\n"
                "\tldr r4, [sp, 0x60]\n"
                "\tlsls r0, 24\n"
                "\tlsrs r0, 24\n"
                "\tstr r0, [sp, 0x24]\n"
                "\tlsls r3, 24\n"
                "\tlsrs r7, r3, 24\n"
                "\tlsls r1, 24\n"
                "\tlsrs r1, 24\n"
                "\tmov r10, r1\n"
                "\tlsls r2, 24\n"
                "\tlsrs r2, 24\n"
                "\tstr r2, [sp, 0x2C]\n"
                "\tlsls r4, 24\n"
                "\tlsrs r4, 24\n"
                "\tstr r4, [sp, 0x30]\n"
                "\tstr r7, [sp, 0x34]\n"
                "_0813C0AC_masterLoop:\n"
                "\tmov r0, r9\n"
                "\tldrb r1, [r0]\n"
                "\tmovs r2, 0x1\n"
                "\tadd r9, r2\n"
                "\tadds r0, r1, 0\n"
                "\tsubs r0, 0xF8\n"
                "\tcmp r0, 0x7\n"
                "\tbls _0813C0BE\n"
                "\tb _0813C358\n"
                "_0813C0BE:\n"
                "\tlsls r0, 2\n"
                "\tldr r1, _0813C0C8 @ =_0813C0CC\n"
                "\tadds r0, r1\n"
                "\tldr r0, [r0]\n"
                "\tmov pc, r0\n"
                "\t.align 2, 0\n"
                "_0813C0C8: .4byte _0813C0CC\n"
                "\t.align 2, 0\n"
                "_0813C0CC:\n"
                "\t.4byte _0813C2D4\n"
                "\t.4byte _0813C348\n"
                "\t.4byte _0813C1E4\n"
                "\t.4byte _0813C1E4\n"
                "\t.4byte _0813C200\n"
                "\t.4byte _0813C0EC\n"
                "\t.4byte _0813C1E4\n"
                "\t.4byte _0813C39C\n"
                "_0813C0EC:\n"
                "\tmov r0, r9\n"
                "\tldrb r1, [r0]\n"
                "\tmovs r2, 0x1\n"
                "\tadd r9, r2\n"
                "\tcmp r1, 0x1\n"
                "\tbne _0813C154\n"
                "\tmovs r4, 0\n"
                "\tldr r0, _0813C14C @ =gSaveBlock2Ptr\n"
                "\tldr r1, [r0]\n"
                "\tldrb r1, [r1]\n"
                "\tcmp r1, 0xFF\n"
                "\tbeq _0813C0AC_masterLoop\n"
                "\tldr r5, _0813C150 @ =gGlyphInfo + 0x80\n"
                "_0813C106:\n"
                "\tldr r0, [r0]\n"
                "\tadds r0, r4\n"
                "\tldrb r1, [r0]\n"
                "\tldr r0, [sp, 0x28]\n"
                "\tstr r0, [sp]\n"
                "\tstr r7, [sp, 0x4]\n"
                "\tmov r2, r10\n"
                "\tstr r2, [sp, 0x8]\n"
                "\tldr r0, [sp, 0x2C]\n"
                "\tstr r0, [sp, 0xC]\n"
                "\tldr r2, [sp, 0x30]\n"
                "\tstr r2, [sp, 0x10]\n"
                "\tldr r0, [sp, 0x24]\n"
                "\tadd r2, sp, 0x14\n"
                "\tadd r3, sp, 0x1C\n"
                "\tbl DecompressAndRenderGlyph\n"
                "\tldr r0, [sp, 0x24]\n"
                "\tldrb r0, [r5]\n"
                "\tadds r0, r7, r0\n"
                "\tlsls r0, 24\n"
                "\tlsrs r7, r0, 24\n"
                "\tadds r0, r4, 0x1\n"
                "\tlsls r0, 24\n"
                "\tlsrs r4, r0, 24\n"
                "\tcmp r4, 0x9\n"
                "\tbhi _0813C0AC_masterLoop\n"
                "\tldr r0, _0813C14C @ =gSaveBlock2Ptr\n"
                "\tldr r1, [r0]\n"
                "\tadds r1, r4\n"
                "\tldrb r1, [r1]\n"
                "\tcmp r1, 0xFF\n"
                "\tbne _0813C106\n"
                "\tb _0813C0AC_masterLoop\n"
                "\t.align 2, 0\n"
                "_0813C14C: .4byte gSaveBlock2Ptr\n"
                "_0813C150: .4byte gGlyphInfo + 0x80\n"
                "_0813C154:\n"
                "\tcmp r1, 0x2\n"
                "\tbne _0813C0AC_masterLoop\n"
                "\tmovs r4, 0\n"
                "\tldr r5, _0813C160 @ =gGlyphInfo + 0x80\n"
                "\tb _0813C1BC\n"
                "\t.align 2, 0\n"
                "_0813C160: .4byte gGlyphInfo + 0x80\n"
                "_0813C164:\n"
                "\tldrb r1, [r1]\n"
                "\tldr r2, [sp, 0x28]\n"
                "\tstr r2, [sp]\n"
                "\tstr r7, [sp, 0x4]\n"
                "\tmov r0, r10\n"
                "\tstr r0, [sp, 0x8]\n"
                "\tldr r2, [sp, 0x2C]\n"
                "\tstr r2, [sp, 0xC]\n"
                "\tldr r0, [sp, 0x30]\n"
                "\tstr r0, [sp, 0x10]\n"
                "\tldr r0, [sp, 0x24]\n"
                "\tadd r2, sp, 0x14\n"
                "\tadd r3, sp, 0x1C\n"
                "\tbl DecompressAndRenderGlyph\n"
                "\tb _0813C1AC\n"
                "_0813C184:\n"
                "\tldr r0, _0813C1D8 @ =gString_Someone\n"
                "\tadds r1, r4, r0\n"
                "\tldrb r0, [r1]\n"
                "\tcmp r0, 0xFF\n"
                "\tbeq _0813C0AC_masterLoop\n"
                "\tadds r1, r0, 0\n"
                "\tldr r2, [sp, 0x28]\n"
                "\tstr r2, [sp]\n"
                "\tstr r7, [sp, 0x4]\n"
                "\tmov r0, r10\n"
                "\tstr r0, [sp, 0x8]\n"
                "\tldr r2, [sp, 0x2C]\n"
                "\tstr r2, [sp, 0xC]\n"
                "\tldr r0, [sp, 0x30]\n"
                "\tstr r0, [sp, 0x10]\n"
                "\tldr r0, [sp, 0x24]\n"
                "\tadd r2, sp, 0x14\n"
                "\tadd r3, sp, 0x1C\n"
                "\tbl DecompressAndRenderGlyph\n"
                "_0813C1AC:\n"
                "\tldr r1, [sp, 0x24]\n"
                "\tldrb r0, [r5]\n"
                "\tadds r0, r7, r0\n"
                "\tlsls r0, 24\n"
                "\tlsrs r7, r0, 24\n"
                "\tadds r0, r4, 0x1\n"
                "\tlsls r0, 24\n"
                "\tlsrs r4, r0, 24\n"
                "_0813C1BC:\n"
                "\tldr r0, _0813C1DC @ =0x00000834\n"
                "\tbl FlagGet\n"
                "\tlsls r0, 24\n"
                "\tlsrs r0, 24\n"
                "\tcmp r0, 0x1\n"
                "\tbne _0813C184\n"
                "\tldr r0, _0813C1E0 @ =gString_Bill\n"
                "\tadds r1, r4, r0\n"
                "\tldrb r0, [r1]\n"
                "\tcmp r0, 0xFF\n"
                "\tbne _0813C164\n"
                "\tb _0813C0AC_masterLoop\n"
                "\t.align 2, 0\n"
                "_0813C1D8: .4byte gString_Someone\n"
                "_0813C1DC: .4byte 0x00000834\n"
                "_0813C1E0: .4byte gString_Bill\n"
                "_0813C1E4:\n"
                "\tldr r7, [sp, 0x34]\n"
                "\tldr r1, _0813C1FC @ =gGlyphInfo\n"
                "\tadds r1, 0x81\n"
                "\tmov r0, r10\n"
                "\tadds r0, 0x1\n"
                "\tldrb r1, [r1]\n"
                "\tadds r0, r1\n"
                "\tlsls r0, 24\n"
                "\tlsrs r0, 24\n"
                "\tmov r10, r0\n"
                "\tb _0813C0AC_masterLoop\n"
                "\t.align 2, 0\n"
                "_0813C1FC: .4byte gGlyphInfo\n"
                "_0813C200:\n"
                "\tmov r2, r9\n"
                "\tldrb r1, [r2]\n"
                "\tmovs r0, 0x1\n"
                "\tadd r9, r0\n"
                "\tsubs r0, r1, 0x1\n"
                "\tcmp r0, 0x15\n"
                "\tbls _0813C210\n"
                "\tb _0813C0AC_masterLoop\n"
                "_0813C210:\n"
                "\tlsls r0, 2\n"
                "\tldr r1, _0813C21C @ =_0813C220\n"
                "\tadds r0, r1\n"
                "\tldr r0, [r0]\n"
                "\tmov pc, r0\n"
                "\t.align 2, 0\n"
                "_0813C21C: .4byte _0813C220\n"
                "\t.align 2, 0\n"
                "_0813C220:\n"
                "\t.4byte _0813C2C8\n"
                "\t.4byte _0813C2C8\n"
                "\t.4byte _0813C2C8\n"
                "\t.4byte _0813C278\n"
                "\t.4byte _0813C2C8\n"
                "\t.4byte _0813C2C8\n"
                "\t.4byte _0813C0AC_masterLoop\n"
                "\t.4byte _0813C2C8\n"
                "\t.4byte _0813C0AC_masterLoop\n"
                "\t.4byte _0813C0AC_masterLoop\n"
                "\t.4byte _0813C27C\n"
                "\t.4byte _0813C2C8\n"
                "\t.4byte _0813C2C8\n"
                "\t.4byte _0813C2C8\n"
                "\t.4byte _0813C0AC_masterLoop\n"
                "\t.4byte _0813C27C\n"
                "\t.4byte _0813C2CE\n"
                "\t.4byte _0813C2CE\n"
                "\t.4byte _0813C282\n"
                "\t.4byte _0813C2CE\n"
                "\t.4byte _0813C0AC_masterLoop\n"
                "\t.4byte _0813C0AC_masterLoop\n"
                "_0813C278:\n"
                "\tmovs r1, 0x1\n"
                "\tadd r9, r1\n"
                "_0813C27C:\n"
                "\tmovs r2, 0x1\n"
                "\tadd r9, r2\n"
                "\tb _0813C2C8\n"
                "_0813C282:\n"
                "\tmov r2, r9\n"
                "\tldrb r0, [r2]\n"
                "\tldr r1, [sp, 0x34]\n"
                "\tadds r0, r1\n"
                "\tsubs r6, r0, r7\n"
                "\tcmp r6, 0\n"
                "\tble _0813C2C8\n"
                "\tldr r2, [sp, 0x28]\n"
                "\tstr r2, [sp, 0x1C]\n"
                "\tldr r1, [sp, 0x2C]\n"
                "\tlsls r0, r1, 3\n"
                "\tadd r4, sp, 0x1C\n"
                "\tmovs r5, 0\n"
                "\tstrh r0, [r4, 0x4]\n"
                "\tldr r2, [sp, 0x30]\n"
                "\tlsls r0, r2, 3\n"
                "\tstrh r0, [r4, 0x6]\n"
                "\tldr r0, [sp, 0x24]\n"
                "\tmovs r1, 0x1\n"
                "\tbl GetFontAttribute\n"
                "\tlsls r0, 24\n"
                "\tlsrs r0, 24\n"
                "\tlsls r3, r6, 16\n"
                "\tlsrs r3, 16\n"
                "\tstr r0, [sp]\n"
                "\tstr r5, [sp, 0x4]\n"
                "\tadds r0, r4, 0\n"
                "\tadds r1, r7, 0\n"
                "\tmov r2, r10\n"
                "\tbl FillBitmapRect4Bit\n"
                "\tadds r0, r7, r6\n"
                "\tlsls r0, 24\n"
                "\tlsrs r7, r0, 24\n"
                "_0813C2C8:\n"
                "\tmovs r0, 0x1\n"
                "\tadd r9, r0\n"
                "\tb _0813C0AC_masterLoop\n"
                "_0813C2CE:\n"
                "\tmovs r1, 0x1\n"
                "\tadd r9, r1\n"
                "\tb _0813C0AC_masterLoop\n"
                "_0813C2D4:\n"
                "\tmov r2, r9\n"
                "\tldrb r1, [r2]\n"
                "\tmovs r0, 0x1\n"
                "\tadd r9, r0\n"
                "\tadds r6, r1, 0\n"
                "\tadds r0, r6, 0\n"
                "\tbl GetKeypadIconTileOffset\n"
                "\tlsls r0, 24\n"
                "\tlsrs r0, 19\n"
                "\tldr r1, _0813C344 @ =gKeypadIconTiles\n"
                "\tadds r0, r1\n"
                "\tstr r0, [sp, 0x14]\n"
                "\tadd r1, sp, 0x14\n"
                "\tmovs r2, 0\n"
                "\tmov r8, r2\n"
                "\tmovs r0, 0x80\n"
                "\tstrh r0, [r1, 0x4]\n"
                "\tstrh r0, [r1, 0x6]\n"
                "\tldr r0, [sp, 0x28]\n"
                "\tstr r0, [sp, 0x1C]\n"
                "\tldr r1, [sp, 0x2C]\n"
                "\tlsls r0, r1, 3\n"
                "\tadd r5, sp, 0x1C\n"
                "\tstrh r0, [r5, 0x4]\n"
                "\tldr r2, [sp, 0x30]\n"
                "\tlsls r0, r2, 3\n"
                "\tstrh r0, [r5, 0x6]\n"
                "\tadds r0, r6, 0\n"
                "\tbl GetKeypadIconWidth\n"
                "\tadds r4, r0, 0\n"
                "\tlsls r4, 24\n"
                "\tlsrs r4, 24\n"
                "\tadds r0, r6, 0\n"
                "\tbl GetKeypadIconHeight\n"
                "\tlsls r0, 24\n"
                "\tlsrs r0, 24\n"
                "\tstr r7, [sp]\n"
                "\tmov r1, r10\n"
                "\tstr r1, [sp, 0x4]\n"
                "\tstr r4, [sp, 0x8]\n"
                "\tstr r0, [sp, 0xC]\n"
                "\tmov r2, r8\n"
                "\tstr r2, [sp, 0x10]\n"
                "\tadd r0, sp, 0x14\n"
                "\tadds r1, r5, 0\n"
                "\tmovs r2, 0\n"
                "\tmovs r3, 0\n"
                "\tbl BlitBitmapRect4Bit\n"
                "\tadds r0, r6, 0\n"
                "\tbl GetKeypadIconWidth\n"
                "\tb _0813C38E\n"
                "\t.align 2, 0\n"
                "_0813C344: .4byte gKeypadIconTiles\n"
                "_0813C348:\n"
                "\tmov r0, r9\n"
                "\tldrb r1, [r0]\n"
                "\tmovs r2, 0x80\n"
                "\tlsls r2, 1\n"
                "\tadds r0, r2, 0\n"
                "\torrs r1, r0\n"
                "\tmovs r0, 0x1\n"
                "\tadd r9, r0\n"
                "_0813C358:\n"
                "\tcmp r1, 0\n"
                "\tbne _0813C36A\n"
                "\tldr r1, [sp, 0x24]\n"
                "\tcmp r1, 0\n"
                "\tbne _0813C366\n"
                "\tadds r0, r7, 0x5\n"
                "\tb _0813C390\n"
                "_0813C366:\n"
                "\tadds r0, r7, 0x4\n"
                "\tb _0813C390\n"
                "_0813C36A:\n"
                "\tadd r3, sp, 0x1C\n"
                "\tldr r2, [sp, 0x28]\n"
                "\tstr r2, [sp]\n"
                "\tstr r7, [sp, 0x4]\n"
                "\tmov r0, r10\n"
                "\tstr r0, [sp, 0x8]\n"
                "\tldr r2, [sp, 0x2C]\n"
                "\tstr r2, [sp, 0xC]\n"
                "\tldr r0, [sp, 0x30]\n"
                "\tstr r0, [sp, 0x10]\n"
                "\tldr r0, [sp, 0x24]\n"
                "\tadd r2, sp, 0x14\n"
                "\tbl DecompressAndRenderGlyph\n"
                "\tldr r1, [sp, 0x24]\n"
                "\tldr r0, _0813C398 @ =gGlyphInfo\n"
                "\tadds r0, 0x80\n"
                "\tldrb r0, [r0]\n"
                "_0813C38E:\n"
                "\tadds r0, r7, r0\n"
                "_0813C390:\n"
                "\tlsls r0, 24\n"
                "\tlsrs r7, r0, 24\n"
                "\tb _0813C0AC_masterLoop\n"
                "\t.align 2, 0\n"
                "_0813C398: .4byte gGlyphInfo\n"
                "_0813C39C:\n"
                "\tadd sp, 0x38\n"
                "\tpop {r3-r5}\n"
                "\tmov r8, r3\n"
                "\tmov r9, r4\n"
                "\tmov r10, r5\n"
                "\tpop {r4-r7}\n"
                "\tpop {r0}\n"
                "\tbx r0");
}
#endif //NONMATCHING

void DecompressAndRenderGlyph(u8 font, u16 glyph, struct Bitmap *srcBlit, struct Bitmap *destBlit, u8 *destBuffer, u8 x, u8 y, u8 width, u8 height)
{
    if (font == 0)
        DecompressGlyphFont0(glyph, FALSE);
    else if (font == 5)
        DecompressGlyphFont5(glyph, FALSE);
    else
        DecompressGlyphFont2(glyph, FALSE);
    srcBlit->pixels = gGlyphInfo;
    srcBlit->width = 16;
    srcBlit->height = 16;
    destBlit->pixels = destBuffer;
    destBlit->width = width * 8;
    destBlit->height = height * 8;
    BlitBitmapRect4Bit(srcBlit, destBlit, 0, 0, x, y, gGlyphInfo[0x80], gGlyphInfo[0x81], 0);
}

void HelpSystem_PrintText_Row61(const u8 * str)
{
    GenerateFontHalfRowLookupTable(1, 15, 2);
    HelpSystemRenderText(5, gDecompressionBuffer + 0x3D00, str, 6, 2, 7, 2);
}

void HelpSystem_PrintTextRightAlign_Row52(const u8 * str)
{
    s32 left = 0x7C - GetStringWidth(0, str, 0);
    GenerateFontHalfRowLookupTable(1, 15, 2);
    HelpSystemRenderText(0, gDecompressionBuffer + 0x3400, str, left, 2, 16, 2);
}

void HelpSystem_PrintTextAt(const u8 * str, u8 x, u8 y)
{
    GenerateFontHalfRowLookupTable(1, 15, 2);
    HelpSystemRenderText(2, gDecompressionBuffer + 0x0000, str, x, y, 26, 16);
}

void HelpSystem_PrintTwoStrings(const u8 * str1, const u8 * str2)
{
    CpuFill16(0xEEEE, gDecompressionBuffer + 0x0000, 0x3400);
    GenerateFontHalfRowLookupTable(1, 14, 2);
    HelpSystemRenderText(2, gDecompressionBuffer + 0x0000, str1, 0, 0, 26, 16);
    HelpSystemRenderText(2, gDecompressionBuffer + 0x09C0, str2, 0, 0, 26, 13);
}

void HelpSystem_PrintText_813C584(const u8 * str)
{
    CpuFill16(0x1111, gDecompressionBuffer + 0x23C0, 0x1040);
    GenerateFontHalfRowLookupTable(2, 1, 3);
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
    sub_813BDA4(0);
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

void sub_813C75C(void)
{
    u8 r6 = gHelpSystemListMenu.sub.totalItems - 7;
    if (gHelpSystemListMenu.sub.totalItems > 7)
    {
        s32 r4 = gHelpSystemListMenu.itemsAbove + gHelpSystemListMenu.cursorPos;
        sub_813C004(0, 0);
        if (r4 == 0)
            sub_813C004(1, 1);
        else if (gHelpSystemListMenu.itemsAbove == 0 && gHelpSystemListMenu.cursorPos != 0)
            sub_813C004(1, 1);
        else if (gHelpSystemListMenu.itemsAbove == r6)
            sub_813C004(0, 1);
        else if (gHelpSystemListMenu.itemsAbove != 0)
        {
            sub_813C004(0, 1);
            sub_813C004(1, 1);
        }
    }
}

void PrintListMenuItems(void)
{
    u8 glyphHeight = GetFontAttribute(2, 1) + 1;
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
    u8 glyphHeight = GetFontAttribute(2, 1) + 1;
    u8 x = gHelpSystemListMenu.sub.left;
    u8 y = gHelpSystemListMenu.sub.top + glyphHeight * gHelpSystemListMenu.cursorPos;
    HelpSystem_PrintTextAt(gText_SelectorArrow2, x, y);
}

void sub_813C860(u8 i)
{
    u8 glyphHeight = GetFontAttribute(2, 1) + 1;
    u8 x = gHelpSystemListMenu.sub.left;
    u8 y = gHelpSystemListMenu.sub.top + i * glyphHeight;
    HelpSystem_PrintTextAt(gString_HelpSystem_ClearTo8, x, y);
}

u8 TryMoveCursor1(u8 dirn)
{
    u16 r4;
    if (dirn == 0)
    {
        if (gHelpSystemListMenu.sub.maxShowed == 1)
            r4 = 0;
        else
            r4 = gHelpSystemListMenu.sub.maxShowed - (gHelpSystemListMenu.sub.maxShowed / 2 + (gHelpSystemListMenu.sub.maxShowed & 1)) - 1;
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
        if (gHelpSystemListMenu.cursorPos > r4)
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
            r4 = 0;
        else
            r4 = gHelpSystemListMenu.sub.maxShowed / 2 + (gHelpSystemListMenu.sub.maxShowed & 1);
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
        else if (gHelpSystemListMenu.cursorPos < r4)
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
        sub_813C860(r7);
        PlaceListMenuCursor();
        CommitTilemap();
        break;
    case 2:
    case 3:
        // changed itemsAbove
        if (sub_812BF88() == TRUE)
        {
            HelpSystem_SetInputDelay(2);
            HelpSystem_FillPanel1();
            PrintListMenuItems();
            PlaceListMenuCursor();
            HelpSystem_PrintTopicLabel();
            sub_813C75C();
        }
        else
        {
            sub_813BDA4(0);
            HelpSystem_FillPanel1();
            PrintListMenuItems();
            PlaceListMenuCursor();
            sub_813BDA4(1);
        }
        CommitTilemap();
        break;
    }
    return FALSE;
}
