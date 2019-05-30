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
#include "string_util.h"
#include "unk_text_util.h"
#include "overworld.h"
#include "sound.h"
#include "menu.h"
#include "librfu.h"
#include "link_rfu.h"
#include "union_room.h"
#include "constants/songs.h"

struct WirelessCommunicationStatusScreenStruct
{
    u32 field_00[4];
    u32 field_10[4];
    u32 field_20[16];
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
void sub_814F65C(u8 windowId, u8 fontId, const u8 * str, u8 x, u8 y, u8 palIdx);
bool32 sub_814F7E4(u32 * a0, u32 * a1, u32 * a2, u8 taskId);

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
        .bg = 0x00,
        .tilemapLeft = 0x03,
        .tilemapTop = 0x00,
        .width = 0x18,
        .height = 0x03,
        .paletteNum = 0x0f,
        .baseBlock = 0x0001
    }, {
        .bg = 0x00,
        .tilemapLeft = 0x03,
        .tilemapTop = 0x04,
        .width = 0x16,
        .height = 0x0f,
        .paletteNum = 0x0f,
        .baseBlock = 0x0049
    }, {
        .bg = 0x00,
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
    {0x52, 0x02, 0x01}
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
    gUnknown_3002040->field_10[3] = 1;
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

void sub_814F3A8(void)
{
    s32 i;
    u32 width;

    FillWindowPixelBuffer(0, 0);
    FillWindowPixelBuffer(1, 0);
    FillWindowPixelBuffer(2, 0);
    width = 0xC0 - GetStringWidth(3, gUnknown_846FAAC[0], 0);
    sub_814F65C(0, 3, gUnknown_846FAAC[0], width / 2, 6, 3);
    for (i = 0; i < 3; i++)
    {
        sub_814F65C(1, 3, gUnknown_846FAAC[i + 1], 0, 30 * i + 10, 1);
    }
    sub_814F65C(1, 3, gUnknown_846FAAC[i + 1], 0, 30 * i + 10, 2);
    PutWindowTilemap(0);
    CopyWindowToVram(0, 2);
    PutWindowTilemap(1);
    CopyWindowToVram(1, 2);
}

void sub_814F46C(u8 taskId)
{
    s32 i;
    switch (gTasks[taskId].data[0])
    {
    case 0:
        sub_814F3A8();
        gTasks[taskId].data[0]++;
        break;
    case 1:
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 16, 0, RGB_BLACK);
        ShowBg(1);
        CopyBgTilemapBufferToVram(0);
        ShowBg(0);
        gTasks[taskId].data[0]++;
        break;
    case 2:
        if (!gPaletteFade.active)
            gTasks[taskId].data[0]++;
        break;
    case 3:
        if (sub_814F7E4(gUnknown_3002040->field_00, gUnknown_3002040->field_10, gUnknown_3002040->field_20, gUnknown_3002040->field_61))
        {
            FillWindowPixelBuffer(2, 0x00);
            for (i = 0; i < 4; i++)
            {
                ConvertIntToDecimalStringN(gStringVar4, gUnknown_3002040->field_00[i], STR_CONV_MODE_RIGHT_ALIGN, 2);
                if (i != 3)
                    sub_814F65C(2, 3, gStringVar4, 4, 30 * i + 10, 1);
                else
                    sub_814F65C(2, 3, gStringVar4, 4, 100, 2);
            }
            PutWindowTilemap(2);
            CopyWindowToVram(2, 3);
        }
        if (JOY_NEW(A_BUTTON) || JOY_NEW(B_BUTTON))
        {
            PlaySE(SE_SELECT);
            gTasks[gUnknown_3002040->field_61].data[15] = 0xFF;
            gTasks[taskId].data[0]++;
        }
        sub_814F364(&gTasks[taskId].data[7], &gTasks[taskId].data[8]);
        break;
    case 4:
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB_BLACK);
        gTasks[taskId].data[0]++;
        break;
    case 5:
        if (!gPaletteFade.active)
        {
            SetMainCallback2(sub_814F32C);
            DestroyTask(taskId);
        }
        break;
    }
}

void sub_814F65C(u8 windowId, u8 fontId, const u8 * str, u8 x, u8 y, u8 palIdx)
{
    struct TextColor textColor;
    switch (palIdx)
    {
    case 0:
        textColor.fgColor = 0;
        textColor.bgColor = 2;
        textColor.shadowColor = 3;
        break;
    case 1:
        textColor.fgColor = 0;
        textColor.bgColor = 1;
        textColor.shadowColor = 3;
        break;
    case 2:
        textColor.fgColor = 0;
        textColor.bgColor = 4;
        textColor.shadowColor = 5;
        break;
    case 3:
        textColor.fgColor = 0;
        textColor.bgColor = 7;
        textColor.shadowColor = 6;
        break;
    case 4:
        textColor.fgColor = 0;
        textColor.bgColor = 1;
        textColor.shadowColor = 2;
        break;
    // default: UB
    }
    AddTextPrinterParameterized4(windowId, fontId,x, y, fontId == 0 ? 0 : 1, 0, &textColor, -1, str);
}

u32 sub_814F714(struct UnkStruct_x20 * unk20, u32 * arg1)
{
    u32 r8 = unk20->unk.field_0.unk_0a_0;
    s32 i, j, k;

    for (i = 0; i < NELEMS(gUnknown_846FAC0); i++)
    {
        if (r8 == gUnknown_846FAC0[i][0] && unk20->field_1A_0 == 1)
        {
            if (gUnknown_846FAC0[i][2] == 0)
            {
                k = 0;
                for (j = 0; j < 4; j++)
                {
                    if (unk20->unk.field_0.unk_04[j] != 0) k++;
                }
                k++;
                arg1[gUnknown_846FAC0[i][1]] += k;
            }
            else
            {
                arg1[gUnknown_846FAC0[i][1]] += gUnknown_846FAC0[i][2];
            }
        }
    }

    return r8;
}

bool32 sub_814F7BC(const u32 * ptr0, const u32 * ptr1)
{
    s32 i;

    for (i = 0; i < 4; i++)
    {
        if (ptr0[i] != ptr1[i])
            return TRUE;
    }

    return FALSE;
}

bool32 sub_814F7E4(u32 * a0, u32 * a1, u32 * a2, u8 taskId)
{
    bool32 r8 = FALSE;
    u32 sp0[4] = {0, 0, 0, 0};
    struct UnkStruct_Group * group = (void *)gTasks[taskId].data;
    s32 i;

    for (i = 0; i < 16; i++)
    {
        u32 r1 = sub_814F714(&group->field_0->arr[i], sp0);
        if (r1 != a2[i])
        {
            a2[i] = r1;
            r8 = TRUE;
        }
    }

    if (sub_814F7BC(sp0, a1) == FALSE)
    {
        if (r8 == TRUE)
            return TRUE;
        else
            return FALSE;
    }

    memcpy(a0, sp0, sizeof(sp0));
    memcpy(a1, sp0, sizeof(sp0));
    a0[3] = a0[0] + a0[1] + a0[2];
    return TRUE;
}
