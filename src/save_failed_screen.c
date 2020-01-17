#include "global.h"
#include "decompress.h"
#include "dma3.h"
#include "gpu_regs.h"
#include "help_system.h"
#include "m4a.h"
#include "save.h"
#include "save_failed_screen.h"
#include "strings.h"

bool32 gUnknown_3005430;
EWRAM_DATA u16 gUnknown_203AB4C = SAVE_NORMAL;
EWRAM_DATA u8 gUnknown_203AB50 = 0;

void sub_80F52EC(void);
void sub_80F53CC(void);
void sub_80F53E8(void);
void sub_80F5404(const u8 *a0);
bool32 sub_80F5458(void);

extern const u16 gUnknown_841EE44[];

void sub_80F50F4(void)
{
    gUnknown_3005430 = FALSE;
}

void DoSaveFailedScreen(u8 saveType)
{
    gUnknown_203AB4C = saveType;
    gUnknown_3005430 = TRUE;
}

bool32 sub_80F5118(void)
{
    switch (gUnknown_203AB50)
    {
    case 0:
        if (!gUnknown_3005430)
            return FALSE;
        m4aMPlayVolumeControl(&gMPlayInfo_BGM, 0xFFFF, 128);
        SaveCallbacks();
        gUnknown_203AB50 = 1;
        break;
    case 1:
        SaveMapTiles();
        SaveMapGPURegs();
        SaveMapTextColors();
        sub_80F52EC();
        SetGpuReg(REG_OFFSET_DISPCNT, 0);
        gUnknown_203AB50 = 2;
        break;
    case 2:
        RequestDma3Fill(0, (void *)BG_CHAR_ADDR(3), BG_CHAR_SIZE, 0);
        RequestDma3Copy(gUnknown_841EE44, (void *)PLTT, 0x20, 0);
        gUnknown_203AB50 = 3;
        break;
    case 3:
        sub_80F53E8();
        sub_80F5404(gUnknown_8418C83);
        sub_80F53CC();
        gUnknown_203AB50 = 4;
        break;
    case 4:
        SetGpuReg(REG_OFFSET_BLDCNT, 0);
        SetGpuReg(REG_OFFSET_BG0HOFS, 0);
        SetGpuReg(REG_OFFSET_BG0VOFS, 0);
        SetGpuReg(REG_OFFSET_BG0CNT, BGCNT_PRIORITY(0) | BGCNT_CHARBASE(3) | BGCNT_SCREENBASE(31));
        SetGpuReg(REG_OFFSET_DISPCNT, DISPCNT_BG0_ON);
        gUnknown_203AB50 = 5;
        break;
    case 5:
        if (sub_80F5458() == TRUE)
        {
            gSaveSucceeded = SAVE_STATUS_OK;
            sub_80F5404(gUnknown_8418E09);
        }
        else
        {
            gSaveSucceeded = SAVE_STATUS_ERROR;
            sub_80F5404(gUnknown_8418CD9);
        }
        gUnknown_203AB50 = 6;
        break;
    case 6:
        if (JOY_NEW(A_BUTTON))
            gUnknown_203AB50 = 7;
        break;
    case 7:
        SetGpuReg(REG_OFFSET_DISPCNT, 0);
        RestoreMapTiles();
        sub_80F52EC();
        gUnknown_203AB50 = 8;
        break;
    case 8:
        m4aMPlayVolumeControl(&gMPlayInfo_BGM, 0xFFFF, 256);
        RestoreMapTextColors();
        RestoreGPURegs();
        RestoreCallbacks();
        gUnknown_3005430 = FALSE;
        gUnknown_203AB50 = 0;
        break;
    }
    return TRUE;
}

void sub_80F52EC(void)
{
    int i;
    for (i = 0; i < BG_PLTT_SIZE; i += sizeof(u16))
    {
        *((u16 *)(BG_PLTT + i)) = RGB_BLACK;
        *((u16 *)(OBJ_PLTT + i)) = RGB_BLACK;
    }
}

void sub_80F5318(void)
{
    RequestDma3Copy(gDecompressionBuffer + 0x3800, (void *)BG_SCREEN_ADDR(31), 0x500, 0);
}

void sub_80F5334(void)
{
    RequestDma3Copy(gDecompressionBuffer + 0x020, (void *)BG_CHAR_ADDR(3) + 0x20, 0x2300, 0);
}
