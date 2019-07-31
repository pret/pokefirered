#include "global.h"
#include "malloc.h"
#include "palette.h"
#include "gpu_regs.h"
#include "bg.h"
#include "task.h"
#include "main.h"
#include "new_menu_helpers.h"
#include "m4a.h"
#include "scanline_effect.h"
#include "constants/songs.h"

EWRAM_DATA u8 gUnknown_2037F30 = 0;

void sub_8078B34(void);
void sub_8078B9C(void);
void sub_8078BB4(void);
void sub_8078BEC(u8 taskId);
void sub_8078C24(u8 taskId);
void sub_8078C90(s16 * data, u8 a1);
void sub_8078C9C(s16 * data);
void sub_8078D24(s16 * data);
void sub_8078DA4(s16 * data);
void sub_8078FC4(s16 * data);
void sub_80790CC(s16 * data);
void sub_80791C0(s16 * data);
void sub_8079708(void);
void sub_8079620(void);
void sub_8079648(void);
void sub_8079A10(s16 a0);

const u8 gUnknown_83BF58C[] = INCBIN_U8("data/graphics/title_screen/unk_83BF58C.4bpp.lz");
const u8 gUnknown_83BF5A8[] = INCBIN_U8("data/graphics/title_screen/unk_83BF5A8.bin.lz");
extern const struct BgTemplate gUnknown_83BFB74[4];
extern const void (*const gUnknown_83BFB84[])(s16 * data);

/*graphics.h*/
extern const u16 gUnknown_8EAB6C4[];
extern const u8 gUnknown_8EAB8C4[];
extern const u8 gUnknown_8EAD390[];
extern const u16 gUnknown_8EAD5E8[];
extern const u8 gUnknown_8EAD608[];
extern const u8 gUnknown_8EADEE4[];
extern const u16 gUnknown_8EAE094[];
extern const u8 gUnknown_8EAE0B4[];
extern const u8 gUnknown_8EAE374[];

void CB2_InitTitleScreen(void)
{
    switch (gMain.state)
    {
    default:
        gMain.state = 0;
        // fallthrough
    case 0:
        SetVBlankCallback(NULL);
        StartTimer1();
        InitHeap(gHeap, HEAP_SIZE);
        ResetTasks();
        ResetSpriteData();
        FreeAllSpritePalettes();
        ResetPaletteFade();
        sub_8078B34();
        DmaFill16(3, 0, (void *)VRAM, VRAM_SIZE);
        DmaFill32(3, 0, (void *)OAM, OAM_SIZE);
        DmaFill16(3, 0, (void *)PLTT, PLTT_SIZE);
        ResetBgsAndClearDma3BusyFlags(FALSE);
        InitBgsFromTemplates(0, gUnknown_83BFB74, NELEMS(gUnknown_83BFB74));
        SetGpuRegBits(REG_OFFSET_DISPCNT, DISPCNT_OBJ_1D_MAP | DISPCNT_OBJ_ON);
        gUnknown_2037F30 = 0xFF;
        break;
    case 1:
        LoadPalette(gUnknown_8EAB6C4, 0, 0x1A0);
        DecompressAndCopyTileDataToVram(0, gUnknown_8EAB8C4, 0, 0, 0);
        DecompressAndCopyTileDataToVram(0, gUnknown_8EAD390, 0, 0, 1);
        LoadPalette(gUnknown_8EAD5E8, 0xD0, 0x20);
        DecompressAndCopyTileDataToVram(1, gUnknown_8EAD608, 0, 0, 0);
        DecompressAndCopyTileDataToVram(1, gUnknown_8EADEE4, 0, 0, 1);
        LoadPalette(gUnknown_8EAE094, 0xF0, 0x20);
        DecompressAndCopyTileDataToVram(2, gUnknown_8EAE0B4, 0, 0, 0);
        DecompressAndCopyTileDataToVram(2, gUnknown_8EAE374, 0, 0, 1);
        LoadPalette(gUnknown_8EAE094, 0xE0, 0x20);
        DecompressAndCopyTileDataToVram(3, gUnknown_83BF58C, 0, 0, 0);
        DecompressAndCopyTileDataToVram(3, gUnknown_83BF5A8, 0, 0, 1);
        sub_8079708();
        break;
    case 2:
        if (!FreeTempTileDataBuffersIfPossible())
        {
            BlendPalettes(0x0000FFFF, 0x10, RGB_BLACK);
            CreateTask(sub_8078C24, 4);
            gUnknown_2037F30 = CreateTask(sub_8078BEC, 2);
            SetVBlankCallback(sub_8078BB4);
            SetMainCallback2(sub_8078B9C);
            m4aSongNumStart(BGM_FRLG_TITLE);
        }
        return;
    }
    gMain.state++;
}

void sub_8078B34(void)
{
    SetGpuReg(REG_OFFSET_DISPCNT,  0);
    SetGpuReg(REG_OFFSET_BLDCNT,   0);
    SetGpuReg(REG_OFFSET_BLDALPHA, 0);
    SetGpuReg(REG_OFFSET_BLDY,     0);
    SetGpuReg(REG_OFFSET_BG0HOFS,  0);
    SetGpuReg(REG_OFFSET_BG0VOFS,  0);
    SetGpuReg(REG_OFFSET_BG1HOFS,  0);
    SetGpuReg(REG_OFFSET_BG1VOFS,  0);
    SetGpuReg(REG_OFFSET_BG2HOFS,  0);
    SetGpuReg(REG_OFFSET_BG2VOFS,  0);
    SetGpuReg(REG_OFFSET_BG3HOFS,  0);
    SetGpuReg(REG_OFFSET_BG3VOFS,  0);
}

void sub_8078B9C(void)
{
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

void sub_8078BB4(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
    ScanlineEffect_InitHBlankDmaTransfer();

    if (gUnknown_2037F30 != 0xFF)
        gTasks[gUnknown_2037F30].data[0]++;
}

void sub_8078BEC(u8 taskId)
{
    s16 * data = gTasks[taskId].data;

    if (data[0] >= 2700)
    {
        gUnknown_2037F30 = 0xFF;
        DestroyTask(taskId);
    }
}

void sub_8078C24(u8 taskId)
{
    s16 * data = gTasks[taskId].data;

    if (JOY_NEW(A_BUTTON | B_BUTTON | START_BUTTON)
    && data[0] != 3 && data[0] != 4 && data[0] != 5)
    {
        sub_8079620();
        sub_8079648();
        sub_8079A10(data[5]);
        sub_8078C90(data, 3);
    }
    else
    {
        gUnknown_83BFB84[data[0]](data);
    }
}

void sub_8078C90(s16 * data, u8 a1)
{
    data[1] = 0;
    data[0] = a1;
}

void sub_8078C9C(s16 * data)
{
    struct ScanlineEffectParams params;

    HideBg(0);
    ShowBg(1);
    ShowBg(2);
    ShowBg(3);

    params.dmaDest = (volatile void *)REG_ADDR_BLDY;
    params.dmaControl = SCANLINE_EFFECT_DMACNT_16BIT;
    params.initState = 1;
    params.unused9 = 0;

    CpuFill16(0, gScanlineEffectRegBuffers[0], 0x140);
    CpuFill16(0, gScanlineEffectRegBuffers[1], 0x140);

    ScanlineEffect_SetParams(params);

    sub_8078C90(data, 1);
}
