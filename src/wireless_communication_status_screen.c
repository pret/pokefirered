#include "global.h"
#include "bg.h"
#include "palette.h"
#include "gpu_regs.h"
#include "malloc.h"
#include "task.h"
#include "text.h"
#include "window.h"
#include "new_menu_helpers.h"
#include "scanline_effect.h"
#include "m4a.h"
#include "unk_text_util.h"
#include "overworld.h"

struct WirelessCommunicationStatusScreenStruct
{
    u8 filler_00[0x1C];
    u32 field_1C;
    u8 filler_20[0x40];
    u8 field_60;
    u8 field_61;
    u8 filler_62[0xA];
};

struct WirelessCommunicationStatusScreenStruct * gUnknown_3002040;

extern const u8 gUnknown_841E2B4[];
extern const u8 gUnknown_841E2BF[];
extern const u8 gUnknown_841E2C9[];
extern const u8 gUnknown_841E2D4[];
extern const u8 gUnknown_841E245[];
extern const u8 gUnknown_841E263[];
extern const u8 gUnknown_841E273[];
extern const u8 gUnknown_841E284[];
extern const u8 gUnknown_841E29E[];

void sub_814F1E4(void);
void sub_814F46C(u8 taskId);
u8 sub_8116DE0(void);

const u16 gUnknown_846F4D0[][16] = {
    INCBIN_U16("graphics/misc/unk_846f4d0.gbapal"),
    INCBIN_U16("graphics/misc/unk_846f4f0.gbapal"),
    INCBIN_U16("graphics/misc/unk_846f510.gbapal"),
    INCBIN_U16("graphics/misc/unk_846f530.gbapal"),
    INCBIN_U16("graphics/misc/unk_846f550.gbapal"),
    INCBIN_U16("graphics/misc/unk_846f570.gbapal"),
    INCBIN_U16("graphics/misc/unk_846f590.gbapal"),
    INCBIN_U16("graphics/misc/unk_846f5b0.gbapal"),
    INCBIN_U16("graphics/misc/unk_846f5d0.gbapal"),
    INCBIN_U16("graphics/misc/unk_846f5f0.gbapal"),
    INCBIN_U16("graphics/misc/unk_846f610.gbapal"),
    INCBIN_U16("graphics/misc/unk_846f630.gbapal"),
    INCBIN_U16("graphics/misc/unk_846f650.gbapal"),
    INCBIN_U16("graphics/misc/unk_846f670.gbapal"),
    INCBIN_U16("graphics/misc/unk_846f690.gbapal"),
    INCBIN_U16("graphics/misc/unk_846f6b0.gbapal")
};

const u32 gUnknown_846F6D0[] = INCBIN_U32("graphics/misc/unk_846f6d0.4bpp.lz");
const u16 gUnknown_846F8E0[] = INCBIN_U16("graphics/misc/unk_846f8e0.bin");

const struct BgTemplate gUnknown_846FA74[] = {
    {
        .bg = 0,
        .charBaseIndex = 2,
        .mapBaseIndex = 31,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 0,
        .baseTile = 0x000
    }, {
        .bg = 1,
        .charBaseIndex = 0,
        .mapBaseIndex =  8,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 1,
        .baseTile = 0x000
    }
};

const struct WindowTemplate gUnknown_846FA7C[] = {
    {
        .priority = 0x00,
        .tilemapLeft = 0x03,
        .tilemapTop = 0x00,
        .width = 0x18,
        .height = 0x03,
        .paletteNum = 0x0f,
        .baseBlock = 0x0001
    }, {
        .priority = 0x00,
        .tilemapLeft = 0x03,
        .tilemapTop = 0x04,
        .width = 0x16,
        .height = 0x0f,
        .paletteNum = 0x0f,
        .baseBlock = 0x0049
    }, {
        .priority = 0x00,
        .tilemapLeft = 0x19,
        .tilemapTop = 0x04,
        .width = 0x02,
        .height = 0x0f,
        .paletteNum = 0x0f,
        .baseBlock = 0x0193
    }, DUMMY_WIN_TEMPLATE
};

const u8 *const gUnknown_846FA9C[] = {
    gUnknown_841E2B4,
    gUnknown_841E2BF,
    gUnknown_841E2C9,
    gUnknown_841E2D4
};
const u8 *const gUnknown_846FAAC[] = {
    gUnknown_841E245,
    gUnknown_841E263,
    gUnknown_841E273,
    gUnknown_841E284,
    gUnknown_841E29E
};

const u8 gUnknown_846FAC0[][3] = {
    {0x01, 0x01, 0x02},
    {0x02, 0x01, 0x02},
    {0x03, 0x01, 0x04},
    {0x04, 0x00, 0x02},
    {0x15, 0x03, 0x02},
    {0x16, 0x03, 0x02},
    {0x09, 0x04, 0x00},
    {0x0a, 0x04, 0x00},
    {0x0b, 0x04, 0x00},
    {0x0c, 0xff, 0x00},
    {0x0d, 0x00, 0x00},
    {0x0e, 0xff, 0x00},
    {0x0f, 0x04, 0x00},
    {0x10, 0xff, 0x00},
    {0x40, 0x02, 0x01},
    {0x41, 0x02, 0x02},
    {0x44, 0x02, 0x02},
    {0x45, 0x02, 0x00},
    {0x48, 0x02, 0x02},
    {0x54, 0x02, 0x01},
    {0x53, 0x02, 0x02},
    {0x51, 0x02, 0x01},
    {0x52, 0x02, 0x01},
    {0x00, 0x00, 0x00}
};

void sub_814F19C(void)
{
    if (!IsDma3ManagerBusyWithBgCopy())
    {
        RunTasks();
        RunTextPrinters();
        AnimateSprites();
        BuildOamBuffer();
        UpdatePaletteFade();
    }
}

void sub_814F1C0(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}

void sub_814F1D4(void)
{
    SetMainCallback2(sub_814F1E4);
}

void sub_814F1E4(void)
{
    SetGpuReg(REG_OFFSET_DISPCNT, 0);
    gUnknown_3002040 = AllocZeroed(sizeof(*gUnknown_3002040));
    SetVBlankCallback(NULL);
    ResetBgsAndClearDma3BusyFlags(0);
    InitBgsFromTemplates(0, gUnknown_846FA74, NELEMS(gUnknown_846FA74));
    SetBgTilemapBuffer(1, Alloc(0x800));
    SetBgTilemapBuffer(0, Alloc(0x800));
    DecompressAndLoadBgGfxUsingHeap(1, gUnknown_846F6D0, 0, 0, 0);
    CopyToBgTilemapBuffer(1, gUnknown_846F8E0, 0, 0);
    InitWindows(gUnknown_846FA7C);
    DeactivateAllTextPrinters();
    ResetPaletteFade();
    ResetSpriteData();
    ResetTasks();
    ScanlineEffect_Stop();
    m4aSoundVSyncOn();
    SetVBlankCallback(sub_814F1C0);
    gUnknown_3002040->field_60 = CreateTask(sub_814F46C, 0);
    gUnknown_3002040->field_61 = sub_8116DE0();
    gUnknown_3002040->field_1C = 1;
    ChangeBgX(0, 0, 0);
    ChangeBgY(0, 0, 0);
    ChangeBgX(1, 0, 0);
    ChangeBgY(1, 0, 0);
    LoadPalette(gUnknown_846F4D0, 0, 0x20);
    Menu_LoadStdPalAt(0xf0);
    UnkTextUtil_Reset();
    FillBgTilemapBufferRect(0, 0x000, 0, 0, 32, 32, 0xF);
    CopyBgTilemapBufferToVram(1);
    SetMainCallback2(sub_814F19C);
    RunTasks();
    RunTextPrinters();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

void sub_814F32C(void)
{
    s32 i;

    FreeAllWindowBuffers();
    for (i = 0; i < 2; i++)
    {
        Free(GetBgTilemapBuffer(i));
    }
    Free(gUnknown_3002040);
    SetMainCallback2(c2_exit_to_overworld_1_continue_scripts_restart_music);
}

void sub_814F364(s16 * unk0, s16 * unk1)
{
    s32 idx;
    (*unk0)++;
    if (*unk0 > 5)
    {
        (*unk1)++;
        if (*unk1 == 14)
        {
            *unk1 = 0;
        }
        *unk0 = 0;
    }
    idx = *unk1 + 2;
    LoadPalette(gUnknown_846F4D0[idx], 0, 16);
}
