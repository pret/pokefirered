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
#include "constants/songs.h"

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
