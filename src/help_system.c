#include "global.h"
#include "decompress.h"
#include "gpu_regs.h"
#include "main.h"
#include "m4a.h"
#include "dma3.h"
#include "help_system.h"
#include "list_menu.h"
#include "sound.h"
#include "strings.h"
#include "text.h"
#include "blit.h"
#include "event_data.h"
#include "constants/songs.h"
#include "constants/flags.h"

extern u8 gGlyphInfo[];

struct DmaController
{
    void * dest;
    void * src;
    u32 size:21;
    u32 destMode:2;
    u32 srcMode:2;
    u32 repeat:1;
    u32 width:1;
    u32 dreqOn:1;
    u32 startMode:3;
    u32 intrEnable:1;
    u32 dmaEnable:1;
};

struct HelpSystemVideoState
{
    /*0x00*/ MainCallback savedVblankCb;
    /*0x04*/ MainCallback savedHblankCb;
    /*0x08*/ u16 savedDispCnt;
    /*0x0a*/ u16 savedBg0Cnt;
    /*0x0c*/ u16 savedBg0Hofs;
    /*0x0e*/ u16 savedBg0Vofs;
    /*0x10*/ u16 savedBldCnt;
    /*0x12*/ struct TextColor savedTextColor;
    /*0x15*/ u8 state;
};

void sub_813BB38(void);
void sub_813BB74(void);
void sub_813BBAC(void);
void sub_813BBC8(void);
void sub_813BBDC(void);
void sub_813BCF4(void);
void sub_813BBF4(void);
void sub_813BD14(u8);
void sub_813BF50(u8);
void sub_813BC2C(void);
void sub_813BC48(void);
void sub_813BC5C(void);
void sub_813C3AC(u8, u16, struct Bitmap *, struct Bitmap *, u8 *, u8, u8, u8, u8);
void sub_813C454(const u8 * str);
void sub_813C5D4(void);

EWRAM_DATA u8 gUnknown_203B174[BG_CHAR_SIZE] = {0};
EWRAM_DATA u8 gUnknown_203F174 = 0;
EWRAM_DATA u8 gUnknown_203F175 = 0;
EWRAM_DATA u8 gUnknown_203F176 = 0;
EWRAM_DATA u8 gUnknown_203F177 = 0;
EWRAM_DATA struct HelpSystemVideoState gUnknown_203F178 = {0};
EWRAM_DATA struct HelpSystemStruct_203F190 gUnknown_203F190 = {0};
EWRAM_DATA struct ListMenuItem gUnknown_203F1AC[52] = {0};

const u16 gUnknown_8464008[] = INCBIN_U16("graphics/help_system/unk_8464008.4bpp");
const u16 gUnknown_8464128[] = INCBIN_U16("graphics/help_system/unk_8464008.gbapal");

u8 sub_813B870(void)
{
    s32 i;

    switch (gUnknown_203F178.state)
    {
    case 0:
        gUnknown_203F177 = 0;
        if (gSaveBlock2Ptr->optionsButtonMode != OPTIONS_BUTTON_MODE_NORMAL)
            return 0;
        if (JOY_NEW(R_BUTTON) && gUnknown_203F175 == 1)
            return 0;
        if (JOY_NEW(L_BUTTON | R_BUTTON))
        {
            if (!sub_812B45C() || !gUnknown_3005ECC)
            {
                PlaySE(SE_HELP_PAGE);
                return 0;
            }
            m4aMPlayStop(&gMPlayInfo_SE1);
            m4aMPlayStop(&gMPlayInfo_SE2);
            PlaySE(SE_HELP_OPEN);
            if (!gUnknown_203F174)
                m4aMPlayVolumeControl(&gMPlayInfo_BGM, 0xFFFF, 0x80);
            sub_813BB38();
            gUnknown_203F177 = 1;
            gUnknown_203F178.state = 1;
        }
        break;
    case 1:
        sub_813BBAC();
        sub_813BB74();
        sub_813BBC8();
        (*(vu16 *)PLTT) = gUnknown_8464128[15];
        SetGpuReg(REG_OFFSET_DISPCNT, 0);
        gUnknown_203F178.state = 2;
        break;
    case 2:
        RequestDma3Fill(0, (void *)BG_CHAR_ADDR(3), BG_CHAR_SIZE, 0);
        RequestDma3Copy(gUnknown_8464128, (void *)PLTT, sizeof(gUnknown_8464128), 0);
        RequestDma3Copy(gUnknown_8464008, gDecompressionBuffer + 0x3EE0, sizeof(gUnknown_8464008), 0);
        gUnknown_203F178.state = 3;
        break;
    case 3:
        sub_813BCF4();
        sub_813C5D4();
        sub_813C5FC();
        sub_813C454(gUnknown_841CB49);
        sub_813BD14(1);
        if (sub_812B40C() == TRUE)
            sub_812BC54(&gUnknown_203F190, gUnknown_203F1AC);
        else
            sub_812BCA8(&gUnknown_203F190, gUnknown_203F1AC);
        sub_813BE78(1);
        sub_813BF50(1);
        sub_813BC5C();
        gUnknown_203F178.state = 4;
        break;
    case 4:
        SetGpuReg(REG_OFFSET_BLDCNT, 0);
        SetGpuReg(REG_OFFSET_BG0HOFS, 0);
        SetGpuReg(REG_OFFSET_BG0VOFS, 0);
        SetGpuReg(REG_OFFSET_BG0CNT, BGCNT_PRIORITY(0) | BGCNT_CHARBASE(3) | BGCNT_16COLOR | BGCNT_SCREENBASE(31));
        SetGpuReg(REG_OFFSET_DISPCNT, DISPCNT_BG0_ON);
        gUnknown_203F178.state = 5;
        break;
    case 5:
        if (!sub_812BB9C(&gUnknown_203F190, gUnknown_203F1AC))
        {
            PlaySE(SE_HELP_CLOSE);
            gUnknown_203F178.state = 6;
        }
        break;
    case 6:
        SetGpuReg(REG_OFFSET_DISPCNT, 0);
        sub_813BC2C();
        for (i = 0; i < 0x200; i += 2)
        {
            *((vu16 *)(PLTT + 0x000 + i)) = gUnknown_8464128[15];
            *((vu16 *)(PLTT + 0x200 + i)) = gUnknown_8464128[15];
        }
        gUnknown_203F178.state = 7;
        break;
    case 7:
        if (!gUnknown_203F174)
            m4aMPlayVolumeControl(&gMPlayInfo_BGM, 0xFFFF, 0x100);
        sub_813BC48();
        sub_813BBF4();
        gUnknown_203F178.state = 8;
        break;
    case 8:
        sub_813BBDC();
        gUnknown_203F177 = 0;
        gUnknown_203F178.state = 0;
        break;
    }
    return gUnknown_203F178.state;
}

void sub_813BB38(void)
{
    vu16 * dma;
    gUnknown_203F178.savedVblankCb = gMain.vblankCallback;
    gUnknown_203F178.savedHblankCb = gMain.hblankCallback;
    gMain.vblankCallback = NULL;
    gMain.hblankCallback = NULL;

    dma = (void *)REG_ADDR_DMA0;
    dma[5] &= ~(DMA_START_MASK | DMA_DREQ_ON | DMA_REPEAT);
    dma[5] &= ~DMA_ENABLE;
    dma[5];
}

void sub_813BB74(void)
{
    gUnknown_203F178.savedDispCnt = GetGpuReg(REG_OFFSET_DISPCNT);
    gUnknown_203F178.savedBg0Cnt = GetGpuReg(REG_OFFSET_BG0CNT);
    gUnknown_203F178.savedBg0Hofs = GetGpuReg(REG_OFFSET_BG0HOFS);
    gUnknown_203F178.savedBg0Vofs = GetGpuReg(REG_OFFSET_BG0VOFS);
    gUnknown_203F178.savedBldCnt = GetGpuReg(REG_OFFSET_BLDCNT);
}

void sub_813BBAC(void)
{
    RequestDma3Copy((void *)BG_CHAR_ADDR(3), gUnknown_203B174, BG_CHAR_SIZE, 0);
}

void sub_813BBC8(void)
{
    SaveTextColors(
        &gUnknown_203F178.savedTextColor.fgColor,
        &gUnknown_203F178.savedTextColor.bgColor,
        &gUnknown_203F178.savedTextColor.shadowColor
    );
}

void sub_813BBDC(void)
{
    gMain.vblankCallback = gUnknown_203F178.savedVblankCb;
    gMain.hblankCallback = gUnknown_203F178.savedHblankCb;
}

void sub_813BBF4(void)
{
    SetGpuReg(REG_OFFSET_BLDCNT, gUnknown_203F178.savedBldCnt);
    SetGpuReg(REG_OFFSET_BG0HOFS, gUnknown_203F178.savedBg0Hofs);
    SetGpuReg(REG_OFFSET_BG0VOFS, gUnknown_203F178.savedBg0Vofs);
    SetGpuReg(REG_OFFSET_BG0CNT, gUnknown_203F178.savedBg0Cnt);
    SetGpuReg(REG_OFFSET_DISPCNT, gUnknown_203F178.savedDispCnt);
}

void sub_813BC2C(void)
{
    RequestDma3Copy(gUnknown_203B174, (void *)BG_CHAR_ADDR(3), BG_CHAR_SIZE, 0);
}

void sub_813BC48(void)
{
    RestoreTextColors(
        &gUnknown_203F178.savedTextColor.fgColor,
        &gUnknown_203F178.savedTextColor.bgColor,
        &gUnknown_203F178.savedTextColor.shadowColor
    );
}

void sub_813BC5C(void)
{
    RequestDma3Copy(gDecompressionBuffer, (void *)BG_CHAR_ADDR(3), BG_CHAR_SIZE, 0);
}

void sub_813BC78(u16 baseTile, u8 left, u8 top, u8 width, u8 height, u16 increment)
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

    sub_813BC5C();
}

void sub_813BCF4(void)
{
    sub_813BC78(0x1FF, 0, 0, 30, 20, 0);
}

void sub_813BD14(u8 mode)
{
    switch (mode)
    {
    case 0:
        sub_813BC78(0x1FF, 1, 0, 7, 2, 0);
        break;
    case 1:
        sub_813BC78(0x1E8, 1, 0, 7, 2, 1);
        break;
    }
}

void sub_813BD5C(u8 mode)
{
    switch (mode)
    {
    case 0:
        sub_813BC78(0x1FF, 13, 0, 16, 2, 0);
        break;
    case 1:
        sub_813BC78(0x1A0, 13, 0, 16, 2, 1);
        break;
    }
}

void sub_813BDA4(u8 mode)
{
    switch (mode)
    {
    case 0:
        sub_813BC78(0x1FF, 2, 3, 26, 16, 0);
        break;
    case 1:
        sub_813BC78(0x000, 2, 3, 26, 16, 1);
        break;
    }
}

void sub_813BDE8(u8 mode)
{
    switch (mode)
    {
    case 0:
        sub_813BC78(0x1FF, 1, 3, 28, 16, 0);
        break;
    case 1:
        sub_813BC78(0x1FA, 1, 3, 28, 17, 0);
        break;
    }
}

void sub_813BE30(u8 mode)
{
    switch (mode)
    {
    case 0:
        sub_813BC78(0x1FF, 2, 14, 26, 5, 0);
        break;
    case 1:
        sub_813BC78(0x11E, 2, 14, 26, 5, 1);
        break;
    }
}

void sub_813BE78(u8 mode)
{
    switch (mode)
    {
    case 0:
        sub_813BC78(0x1FF, 1,  2, 28, 1, 0);
        sub_813BC78(0x1FF, 1, 19, 28, 1, 0);
        break;
    case 1:
        sub_813BC78(0x1F7, 1,  2, 28, 1, 0);
        sub_813BC78(0x1F8, 1, 19, 28, 1, 0);
        break;
    }
}

void sub_813BEE4(u8 mode)
{
    switch (mode)
    {
    case 0:
        sub_813BC78(0x1FF, 1,  2, 28, 1, 0);
        sub_813BC78(0x1FF, 1, 19, 28, 1, 0);
        break;
    case 1:
        sub_813BC78(0x1FB, 1,  2, 28, 1, 0);
        sub_813BC78(0x1FC, 1, 19, 28, 1, 0);
        break;
    }
}

void sub_813BF50(u8 mode)
{
    switch (mode)
    {
    case 0:
        sub_813BC78(0x1FF,  0, 0, 1, 20, 0);
        sub_813BC78(0x1FF, 29, 0, 1, 20, 0);
        break;
    case 1:
        sub_813BC78(0x1F9,  0, 0, 1, 20, 0);
        sub_813BC78(0x1F9, 29, 0, 1, 20, 0);
        break;
    }
}

void sub_813BFC0(u8 mode)
{
    switch (mode)
    {
    case 0:
        sub_813BC78(0x1FF, 1, 5, 28, 1, 0);
        break;
    case 1:
        sub_813BC78(0x1FC, 1, 5, 28, 1, 0);
        break;
    }
}

void sub_813C004(u8 a0, u8 mode)
{
    switch (mode)
    {
    case 0:
        sub_813BC78(0x1FF, 28,  3, 1, 1, 0);
        sub_813BC78(0x1FF, 28, 18, 1, 1, 0);
        break;
    case 1:
        if (a0 == 0)
            sub_813BC78(0x1FE, 28,  3, 1, 1, 0);
        else
            sub_813BC78(0x1FD, 28, 18, 1, 1, 0);
        break;
    }
}

#define HelpSystemHandleRenderGlyph(character) ({\
    do {sub_813C3AC(font, character, &srcBlit, &destBlit, dest, x, y, width, height);} while (0); font;\
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
                        if (gUnknown_841CB3C[i] == EOS)
                            break;
                        HelpSystemHandleRenderGlyph(gUnknown_841CB3C[i]);
                    }
                    else
                    {
                        if (gUnknown_841CB41[i] == EOS)
                            break;
                        HelpSystemHandleRenderGlyph(gUnknown_841CB41[i]);
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
                "\tbl sub_813C3AC\n"
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
                "\tbl sub_813C3AC\n"
                "\tb _0813C1AC\n"
                "_0813C184:\n"
                "\tldr r0, _0813C1D8 @ =gUnknown_841CB41\n"
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
                "\tbl sub_813C3AC\n"
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
                "\tldr r0, _0813C1E0 @ =gUnknown_841CB3C\n"
                "\tadds r1, r4, r0\n"
                "\tldrb r0, [r1]\n"
                "\tcmp r0, 0xFF\n"
                "\tbne _0813C164\n"
                "\tb _0813C0AC_masterLoop\n"
                "\t.align 2, 0\n"
                "_0813C1D8: .4byte gUnknown_841CB41\n"
                "_0813C1DC: .4byte 0x00000834\n"
                "_0813C1E0: .4byte gUnknown_841CB3C\n"
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
                "\tbl sub_813C3AC\n"
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

void sub_813C3AC(u8 font, u16 glyph, struct Bitmap *srcBlit, struct Bitmap *destBlit, u8 *destBuffer, u8 x, u8 y, u8 width, u8 height)
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

void sub_813C454(const u8 * str)
{
    GenerateFontHalfRowLookupTable(1, 15, 2);
    HelpSystemRenderText(5, gDecompressionBuffer + 0x3D00, str, 6, 2, 7, 2);
}

void sub_813C488(const u8 * str)
{
    s32 left = 0x7C - GetStringWidth(0, str, 0);
    GenerateFontHalfRowLookupTable(1, 15, 2);
    HelpSystemRenderText(0, gDecompressionBuffer + 0x3400, str, left, 2, 16, 2);
}

void sub_813C4CC(const u8 * str, u8 x, u8 y)
{
    GenerateFontHalfRowLookupTable(1, 15, 2);
    HelpSystemRenderText(2, gDecompressionBuffer + 0x0000, str, x, y, 26, 16);
}

void sub_813C50C(const u8 * str1, const u8 * str2)
{
    CpuFill16(0xEEEE, gDecompressionBuffer + 0x0000, 0x3400);
    GenerateFontHalfRowLookupTable(1, 14, 2);
    HelpSystemRenderText(2, gDecompressionBuffer + 0x0000, str1, 0, 0, 26, 16);
    HelpSystemRenderText(2, gDecompressionBuffer + 0x09C0, str2, 0, 0, 26, 13);
}

void sub_813C584(const u8 * str)
{
    CpuFill16(0x1111, gDecompressionBuffer + 0x23C0, 0x1040);
    GenerateFontHalfRowLookupTable(2, 1, 3);
    HelpSystemRenderText(2, gDecompressionBuffer + 0x23C0, str, 2, 6, 26, 5);
}
