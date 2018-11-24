#include "global.h"
#include "constants/songs.h"
#include "bg.h"
#include "gpu_regs.h"
#include "palette.h"
#include "task.h"
#include "malloc.h"
#include "main.h"
#include "sound.h"
#include "text.h"
#include "window.h"
#include "text_window.h"

struct FameCheckerData
{
    u32 unk_00;
    u16 unk_04;
    u8 filler_06[3];
    u8 unk_09;
    u8 unk_0A;
    u8 unk_0B;
    u8 filler_0C[23];
    u8 unk_23_0:1;
    u8 unk_23_1:7;
};

struct FameCheckerData2
{
    u8 filler_00[0x88];
};

EWRAM_DATA u16 * gUnknown_203B0F0 = NULL;
EWRAM_DATA u16 * gUnknown_203B0F4 = NULL;
EWRAM_DATA u16 * gUnknown_203B0F8 = NULL;
EWRAM_DATA struct FameCheckerData * gUnknown_203B0FC = NULL;
EWRAM_DATA struct FameCheckerData2 * gUnknown_203B100 = NULL;
EWRAM_DATA u32 gUnknown_203B104 = 0;

void sub_812C3F8(void);
void sub_812C648(void);
void sub_812C664(u8 taskId);
void sub_812CE9C(void);
void sub_812CEC0(void);
void sub_812D1A8(u8 a0);
void sub_812D420(void);
void sub_812D558(void);
void sub_812D584(void);
void sub_812D594(void);
void sub_812DB28(void);
void sub_812E000(void);
void sub_812E178(u8 a0, s16 a1);

extern const struct BgTemplate gUnknown_845FBF4[4];
extern const struct WindowTemplate gUnknown_845FC04[];
extern const u16 gUnknown_845C600[0x40];

extern const u16 gUnknown_8E9F220[0x30];
extern const u16 gUnknown_8E9F260[0xa50];
extern const u16 gUnknown_8EA0700[0x400];
extern const u16 gUnknown_8EA0F00[0x400];

void sub_812C380(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}

void sub_812C394(void)
{
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

void sub_812C3AC(u32 a0)
{
    SetVBlankCallback(NULL);
    gUnknown_203B0FC = AllocZeroed(sizeof(struct FameCheckerData));
    gUnknown_203B0FC->unk_00 = a0;
    gUnknown_203B0FC->unk_09 = 0;
    gUnknown_203B0FC->unk_0A = 0;
    gUnknown_203B0FC->unk_0B = 0;
    gUnknown_203B0FC->unk_23_0 = FALSE;
    PlaySE(SE_W202);
    SetMainCallback2(sub_812C3F8);
}

void sub_812C3F8(void)
{
    switch (gMain.state)
    {
        case 0:
            SetVBlankCallback(NULL);
            sub_812D420();
            gMain.state++;
            break;
        case 1:
            sub_812D558();
            gMain.state++;
            break;
        case 2:
            gUnknown_203B0F0 = AllocZeroed(0x800);
            gUnknown_203B0F4 = AllocZeroed(0x1000);
            gUnknown_203B0F8 = AllocZeroed(0x800);
            ResetBgsAndClearDma3BusyFlags(0);
            InitBgsFromTemplates(0, gUnknown_845FBF4, ARRAY_COUNT(gUnknown_845FBF4));
            SetBgTilemapBuffer(3, gUnknown_203B0F0);
            SetBgTilemapBuffer(2, gUnknown_203B0F8);
            SetBgTilemapBuffer(1, gUnknown_203B0F4);
            sub_812D594();
            gMain.state++;
            break;
        case 3:
            LoadBgTiles(3, gUnknown_8E9F260, sizeof(gUnknown_8E9F260), 0);
            CopyToBgTilemapBufferRect(3, gUnknown_8EA0700, 0, 0, 32, 32);
            LoadPalette(gUnknown_8E9F220 + 0x00, 0x00, 0x40);
            LoadPalette(gUnknown_8E9F220 + 0x10, 0x10, 0x20);
            CopyToBgTilemapBufferRect(2, gUnknown_8EA0F00, 0, 0, 32, 32);
            CopyToBgTilemapBufferRect_ChangePalette(1, gUnknown_845C600, 30, 0, 32, 32, 0x11);
            LoadPalette(stdpal_get(2), 0xF0, 0x20);
            gMain.state++;
            break;
        case 4:
            if (IsDma3ManagerBusyWithBgCopy() != TRUE)
            {
                ShowBg(0);
                ShowBg(1);
                ShowBg(2);
                ShowBg(3);
                CopyBgTilemapBufferToVram(3);
                CopyBgTilemapBufferToVram(2);
                CopyBgTilemapBufferToVram(1);
                gMain.state++;
            }
            break;
        case 5:
            InitWindows(gUnknown_845FC04);
            DeactivateAllTextPrinters();
            sub_812CEC0();
            gUnknown_203B100 = AllocZeroed(sizeof(struct FameCheckerData2));
            sub_812DB28();
            gMain.state++;
            break;
        case 6:
            sub_812C648();
            sub_812D1A8(0);
            sub_812CE9C();
            BeginNormalPaletteFade(0xFFFFFFFF,0, 16, 0, 0);
            gMain.state++;
            break;
        case 7:
            sub_812D584();
            SetGpuReg(REG_OFFSET_BLDCNT, BLDCNT_EFFECT_BLEND | BLDCNT_TGT2_BG0 | BLDCNT_TGT2_BG1 | BLDCNT_TGT2_BG2 | BLDCNT_TGT2_BG3 | BLDCNT_TGT2_OBJ | BLDCNT_TGT2_BD);
            SetGpuReg(REG_OFFSET_BLDALPHA, 0x07);
            SetGpuReg(REG_OFFSET_BLDY, 0x08);
            SetVBlankCallback(sub_812C380);
            gUnknown_203B0FC->unk_04 = 0;
            sub_812E000();
            sub_812E178(1, 4);
            CreateTask(sub_812C664, 0x08);
            SetMainCallback2(sub_812C394);
            gMain.state = 0;
            break;
    }
}
