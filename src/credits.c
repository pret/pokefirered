#include "global.h"
#include "malloc.h"
#include "palette.h"
#include "gpu_regs.h"
#include "task.h"
#include "overworld.h"
#include "event_data.h"
#include "window.h"
#include "new_menu_helpers.h"
#include "menu.h"
#include "strings.h"
#include "field_weather.h"

struct CreditsResources
{
    u8 unk_00;
    u8 unk_01;
    u8 unk_02;
    u16 unk_04;
    u16 unk_06;
    u8 unk_08;
    u8 unk_09;
    u8 unk_0A;
    bool8 unk_0B;
    u8 filler_0C[16];
    u8 unk_1C;
    u8 unk_1D;
};

struct UnkStruct_8410CF4
{
    u8 unk0;
    u8 unk1;
    u16 unk2;
};

struct UnkStruct_84145BC
{
    const u8 * unk_0;
    const u8 * unk_4;
    u8 unk_8;
};

EWRAM_DATA struct CreditsResources * gUnknown_203AB40 = NULL;

void sub_80F39E8(void);
s32 sub_80F3BD0(void);
bool32 sub_80F4328(void);
bool32 sub_80F4674(void);
void sub_80F48D0(void);
void sub_80F4930(u8 a0);

/*
const ALIGNED(4) u8 gUnknown_8410E00[3] = {0, 5, 2};
const ALIGNED(4) u8 gUnknown_8410E04[3] = {0, 1, 2};

const struct WindowTemplate gUnknown_8410E08 = {
    .bg = 0,
    .tilemapLeft = 0,
    .tilemapTop = 4,
    .width = 30,
    .height = 12,
    .paletteNum = 15,
    .baseBlock = 0x008
};
 */

extern const struct UnkStruct_8410CF4 gUnknown_8410CF4[];
extern const u8 gUnknown_8410E00[3];
extern const u8 gUnknown_8410E04[3];
extern const struct WindowTemplate gUnknown_8410E08;

extern const char * gUnknown_8414588[];
extern const struct UnkStruct_84145BC gUnknown_84145BC[];

void sub_80F39B4(void)
{
    gUnknown_203AB40 = AllocZeroed(sizeof(*gUnknown_203AB40));
    ResetTasks();
    gUnknown_203AB40->unk_02 = 0xFF;
    gUnknown_203AB40->unk_1D = 0;
    ResetSpriteData();
    SetMainCallback2(sub_80F39E8);
}

void sub_80F39E8(void)
{
    switch (sub_80F3BD0())
    {
    case 0:
        RunTasks();
        AnimateSprites();
        BuildOamBuffer();
        UpdatePaletteFade();
        break;
    case 1:
        if (gUnknown_203AB40->unk_1D & 1)
        {
            sub_80574A4();
        }
        else
        {
            RunTasks();
            AnimateSprites();
            BuildOamBuffer();
            UpdatePaletteFade();
        }
        gUnknown_203AB40->unk_1D++;
        break;
    case 2:
        FlagClear(0x4000);
        gUnknown_2031DD8 = 0;
        Free(gUnknown_203AB40);
        SoftReset(RESET_ALL);
        // noreturn
    }
}

void sub_80F3A74(void)
{
    ClearGpuRegBits(REG_OFFSET_DISPCNT, DISPCNT_WIN1_ON);
    SetGpuRegBits(REG_OFFSET_DISPCNT, DISPCNT_WIN0_ON);
    SetGpuReg(REG_OFFSET_WININ, 0x1F3F);
    SetGpuReg(REG_OFFSET_WINOUT, 0x000E);
}

void sub_80F3AA4(void)
{
    SetGpuReg(REG_OFFSET_BLDCNT, BLDCNT_TGT1_BG1 | BLDCNT_TGT1_BG2 | BLDCNT_TGT1_BG3 | BLDCNT_EFFECT_DARKEN);
    SetGpuReg(REG_OFFSET_BLDALPHA, BLDALPHA_BLEND(16, 4));
    SetGpuReg(REG_OFFSET_BLDY, 10);
}

void sub_80F3AC4(void)
{
    gUnknown_203AB40->unk_0A = AddWindow(&gUnknown_8410E08);
    FillWindowPixelBuffer(gUnknown_203AB40->unk_0A, PIXEL_FILL(0));
    PutWindowTilemap(gUnknown_203AB40->unk_0A);
    CopyWindowToVram(gUnknown_203AB40->unk_0A, 3);
    gUnknown_203AB40->unk_0B = TRUE;
}

void sub_80F3B04(void)
{
    if (gUnknown_203AB40->unk_0B)
    {
        RemoveWindow(gUnknown_203AB40->unk_0A);
        CleanupOverworldWindowsAndTilemaps();
        gUnknown_203AB40->unk_0B = FALSE;
    }
}

bool32 sub_80F3B2C(UNUSED u8 unused)
{
    switch (gUnknown_203AB40->unk_01)
    {
    case 0:
        FlagSet(0x4000);
        gUnknown_2031DD8 = 2;
        gUnknown_203AB40->unk_1C = 0;
        gUnknown_203AB40->unk_01++;
        // fallthrough
    case 1:
        if (!sub_805750C(&gUnknown_203AB40->unk_1C, gUnknown_8414588[gUnknown_203AB40->unk_09], 0))
            return FALSE;
        sub_80F3AC4();
        SetGpuReg(REG_OFFSET_WIN0H, 0xF0);
        SetGpuReg(REG_OFFSET_WIN0V, 0x247C);
        sub_80F3A74();
        sub_80F3AA4();
        Menu_LoadStdPalAt(0xF0);
        gPlttBufferUnfaded[0xFF] = RGB_BLACK;
        gPlttBufferFaded[0xFF] = RGB_BLACK;
        return TRUE;
    default:
        return FALSE;
    }
}

#ifdef NONMATCHING
s32 sub_80F3BD0(void)
{
    u16 win0v[2];

    switch (gUnknown_203AB40->unk_00)
    {
    case 0:
        sub_80F3A74();
        SetGpuReg(REG_OFFSET_WIN0H, 0x40);
        SetGpuReg(REG_OFFSET_WIN0V, 0x4F51);
        gUnknown_203AB40->unk_00 = 1;
        return 0;
    case 1:
        sub_80F3AA4();
        sub_80F3AC4();
        Menu_LoadStdPalAt(0xF0);
        gPlttBufferUnfaded[0xFF] = RGB_BLACK;
        gPlttBufferFaded[0xFF] = RGB_BLACK;
        gUnknown_203AB40->unk_00 = 2;
        return 0;
    case 2:
        win0v[0] = GetGpuReg(REG_OFFSET_WIN0V) >> 8;
        win0v[1] = GetGpuReg(REG_OFFSET_WIN0V) & 0xFF;
        if (win0v[0] == 0x24)
        {
            gUnknown_203AB40->unk_04 = 0;
            gUnknown_203AB40->unk_00 = 3;
        }
        else
        {
            win0v[0]--;
            win0v[1]++;
            SetGpuReg(REG_OFFSET_WIN0V, win0v[1] + (win0v[0] << 8));
        }
        return 0;
    case 3:
        if (gUnknown_203AB40->unk_04 == 0)
        {
            sub_80F4930(0);
            gUnknown_203AB40->unk_04 = 100;
            gUnknown_203AB40->unk_00 = 4;
        }
        else
        {
            gUnknown_203AB40->unk_04--;
        }
        return 0;
    case 4:
        if (gUnknown_203AB40->unk_04 == 0)
        {
            gUnknown_203AB40->unk_04 = 360;
            AddTextPrinterParameterized4(gUnknown_203AB40->unk_0A, 1, 0x08, 0x29, 1, 2, gUnknown_8410E00, 0, gUnknown_841D198);
            gUnknown_203AB40->unk_00 = 5;
        }
        else
        {
            gUnknown_203AB40->unk_04--;
        }
        return 0;
    case 5:
        if (gUnknown_203AB40->unk_04 == 0)
        {
            sub_80F3B04();
            gUnknown_203AB40->unk_00 = 6;
            gUnknown_203AB40->unk_04 = 0;
            gUnknown_203AB40->unk_06 = 0;
        }
        else
        {
            gUnknown_203AB40->unk_04--;
        }
        return 0;
    case 6:
        if (gUnknown_203AB40->unk_04 != 0)
        {
            gUnknown_203AB40->unk_04--;
            return gUnknown_203AB40->unk_08;
        }
        else
        {
            switch (gUnknown_203AB40->unk_06)
            {
            case 0:
                BeginNormalPaletteFade(0x00008000, 0, 0, 16, RGB_BLACK);
                gUnknown_203AB40->unk_00 = 7;
                FillWindowPixelBuffer(gUnknown_203AB40->unk_0A, PIXEL_FILL(0));
                return gUnknown_203AB40->unk_08;
            case 1:
                gUnknown_203AB40->unk_00 = 10;
                gUnknown_203AB40->unk_09 = gUnknown_8410CF4[gUnknown_203AB40->unk_06].unk1;
                sub_807A944(1, 0, 0x3FFFFFFF);
                break;
            case 2:
                gUnknown_203AB40->unk_00 = 12;
                gUnknown_203AB40->unk_09 = gUnknown_8410CF4[gUnknown_203AB40->unk_06].unk1;
                break;
            case 3:
                gUnknown_203AB40->unk_00 = 13;
                gUnknown_203AB40->unk_09 = gUnknown_8410CF4[gUnknown_203AB40->unk_06].unk1;
                fade_screen(1, 0);
                break;
            case 4:
                gUnknown_203AB40->unk_00 = 15;
                gUnknown_203AB40->unk_09 = gUnknown_8410CF4[gUnknown_203AB40->unk_06].unk1;
                BeginNormalPaletteFade(0xFFFFFFFF, 4, 0, 16, RGB_BLACK);
                break;
            case 5:
                gUnknown_203AB40->unk_00 = 17;
                break;
            }
            gUnknown_203AB40->unk_04 = gUnknown_8410CF4[gUnknown_203AB40->unk_06].unk2;
            gUnknown_203AB40->unk_06++;
        }
        return 0;
    case 7:
        if (!gPaletteFade.active)
        {
            win0v[0] = gUnknown_84145BC[gUnknown_8410CF4[gUnknown_203AB40->unk_06].unk1].unk_8; // unused
            AddTextPrinterParameterized4(gUnknown_203AB40->unk_0A, 1, 2, 6, 0, 0, gUnknown_8410E00, -1, gUnknown_84145BC[gUnknown_8410CF4[gUnknown_203AB40->unk_06].unk1].unk_0);
            gUnknown_203AB40->unk_00 = 8;
        }
        return gUnknown_203AB40->unk_08;
    case 8:
        win0v[0] = gUnknown_84145BC[gUnknown_8410CF4[gUnknown_203AB40->unk_06].unk1].unk_8;
        AddTextPrinterParameterized4(gUnknown_203AB40->unk_0A, 1, 2, 6, 0, 0, gUnknown_8410E00, -1, gUnknown_84145BC[gUnknown_8410CF4[gUnknown_203AB40->unk_06].unk1].unk_4);
        gUnknown_203AB40->unk_00 = 9;
        return gUnknown_203AB40->unk_08;
    case 9:
        CopyWindowToVram(gUnknown_203AB40->unk_0A, 2);
        gUnknown_203AB40->unk_04 = gUnknown_8410CF4[gUnknown_203AB40->unk_06].unk2;
        gUnknown_203AB40->unk_06++;
        BeginNormalPaletteFade(0x00008000, 0, 16, 0, RGB_BLACK);
        gUnknown_203AB40->unk_00 = 6;
        return gUnknown_203AB40->unk_08;
    case 10:
        if (!gPaletteFade.active)
        {
            sub_80F3B04();
            gUnknown_203AB40->unk_01 = 0;
            gUnknown_203AB40->unk_00 = 11;
        }
        return 0;
    case 11:
        if (sub_80F3B2C(gUnknown_203AB40->unk_09))
        {
            gUnknown_203AB40->unk_08 = 1;
            gUnknown_203AB40->unk_00 = 6;
        }
        return 0;
    case 12:
        if (!gPaletteFade.active)
        {
            sub_80F3B04();
            gUnknown_203AB40->unk_01 = 0;
            while (sub_80F3B2C(gUnknown_203AB40->unk_09))
            {}
            switch (gUnknown_203AB40->unk_09)
            {
            default:
                win0v[0] = 1;
                break;
            case 6:
                win0v[0] = 2;
                break;
            case 9:
                win0v[0] = 3;
                break;
            case 12:
                win0v[0] = 4;
                break;
            }
            sub_80F4930(win0v[0]);
            gUnknown_203AB40->unk_08 = 1;
            gUnknown_203AB40->unk_00 = 6;
        }
        return 0;
    case 13:
        if (!gPaletteFade.active)
        {
            sub_80F48D0();
            sub_80F3B04();
            gUnknown_203AB40->unk_01 = 0;
            gUnknown_203AB40->unk_08 = 0;
            gUnknown_203AB40->unk_00 = 14;
        }
        return 0;
    case 14:
        if (sub_80F4328())
        {
            gUnknown_203AB40->unk_00 = 6;
        }
        return 0;
    case 15:
        if (!gPaletteFade.active)
        {
            sub_80F3B04();
            gUnknown_203AB40->unk_01 = 0;
            gUnknown_203AB40->unk_08 = 0;
            gUnknown_203AB40->unk_00 = 16;
        }
        return 0;
    case 16:
        if (sub_80F4674())
        {
            gUnknown_203AB40->unk_00 = 6;
        }
        return 0;
    case 17:
        if (JOY_NEW(A_BUTTON))
        {
            BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB_WHITE);
            gUnknown_203AB40->unk_00 = 18;
        }
        else if (gUnknown_203AB40->unk_04 == 0)
        {
            gUnknown_203AB40->unk_00 = 18;
            BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB_WHITE);
        }
        else
            gUnknown_203AB40->unk_04--;
        return 0;
    case 18:
        if (!gPaletteFade.active)
            sub_80F3B04();
    default:
        return 2;
    }
}
#else
NAKED
s32 sub_80F3BD0(void)
{
    asm_unified("\tpush {r4-r7,lr}\n"
                "\tsub sp, 0x24\n"
                "\tldr r1, _080F3BEC @ =gUnknown_203AB40\n"
                "\tldr r0, [r1]\n"
                "\tldrb r0, [r0]\n"
                "\tadds r7, r1, 0\n"
                "\tcmp r0, 0x12\n"
                "\tbls _080F3BE2\n"
                "\tb _080F4180_default_return2\n"
                "_080F3BE2:\n"
                "\tlsls r0, 2\n"
                "\tldr r1, _080F3BF0 @ =_080F3BF4\n"
                "\tadds r0, r1\n"
                "\tldr r0, [r0]\n"
                "\tmov pc, r0\n"
                "\t.align 2, 0\n"
                "_080F3BEC: .4byte gUnknown_203AB40\n"
                "_080F3BF0: .4byte _080F3BF4\n"
                "\t.align 2, 0\n"
                "_080F3BF4:\n"
                "\t.4byte _080F3C40_case00\n"
                "\t.4byte _080F3C64_case01\n"
                "\t.4byte _080F3C98_case02\n"
                "\t.4byte _080F3CEE_case03\n"
                "\t.4byte _080F3D0A_case04\n"
                "\t.4byte _080F3D48_case05\n"
                "\t.4byte _080F3D6A_case06\n"
                "\t.4byte _080F3EB4_case07\n"
                "\t.4byte _080F3F24_case08\n"
                "\t.4byte _080F3F84_case09\n"
                "\t.4byte _080F3FC4_case0A\n"
                "\t.4byte _080F3FF0_case0B\n"
                "\t.4byte _080F400A_case0C\n"
                "\t.4byte _080F4084_case0D\n"
                "\t.4byte _080F40B8_case0E\n"
                "\t.4byte _080F40D0_case0F\n"
                "\t.4byte _080F4100_case10\n"
                "\t.4byte _080F4118_case11\n"
                "\t.4byte _080F4170_case12\n"
                "_080F3C40_case00:\n"
                "\tbl sub_80F3A74\n"
                "\tmovs r0, 0x40\n"
                "\tmovs r1, 0xF0\n"
                "\tbl SetGpuReg\n"
                "\tldr r1, _080F3C5C @ =0x00004f51\n"
                "\tmovs r0, 0x44\n"
                "\tbl SetGpuReg\n"
                "\tldr r0, _080F3C60 @ =gUnknown_203AB40\n"
                "\tldr r1, [r0]\n"
                "\tmovs r0, 0x1\n"
                "\tb _080F413C_setfield0_return0\n"
                "\t.align 2, 0\n"
                "_080F3C5C: .4byte 0x00004f51\n"
                "_080F3C60: .4byte gUnknown_203AB40\n"
                "_080F3C64_case01:\n"
                "\tbl sub_80F3AA4\n"
                "\tbl sub_80F3AC4\n"
                "\tmovs r0, 0xF0\n"
                "\tbl Menu_LoadStdPalAt\n"
                "\tldr r0, _080F3C8C @ =gPlttBufferUnfaded\n"
                "\tmovs r2, 0xFF\n"
                "\tlsls r2, 1\n"
                "\tadds r0, r2\n"
                "\tmovs r1, 0\n"
                "\tstrh r1, [r0]\n"
                "\tldr r0, _080F3C90 @ =gPlttBufferFaded\n"
                "\tadds r0, r2\n"
                "\tstrh r1, [r0]\n"
                "\tldr r0, _080F3C94 @ =gUnknown_203AB40\n"
                "\tldr r1, [r0]\n"
                "\tmovs r0, 0x2\n"
                "\tb _080F413C_setfield0_return0\n"
                "\t.align 2, 0\n"
                "_080F3C8C: .4byte gPlttBufferUnfaded\n"
                "_080F3C90: .4byte gPlttBufferFaded\n"
                "_080F3C94: .4byte gUnknown_203AB40\n"
                "_080F3C98_case02:\n"
                "\tmovs r0, 0x44\n"
                "\tbl GetGpuReg\n"
                "\tadd r1, sp, 0x14\n"
                "\tlsls r0, 16\n"
                "\tlsrs r0, 24\n"
                "\tstrh r0, [r1]\n"
                "\tmovs r0, 0x44\n"
                "\tbl GetGpuReg\n"
                "\tadd r2, sp, 0x14\n"
                "\tmovs r1, 0xFF\n"
                "\tands r1, r0\n"
                "\tstrh r1, [r2, 0x2]\n"
                "\tadds r0, r2, 0\n"
                "\tldrh r0, [r0]\n"
                "\tcmp r0, 0x24\n"
                "\tbne _080F3CCC\n"
                "\tldr r0, _080F3CC8 @ =gUnknown_203AB40\n"
                "\tldr r1, [r0]\n"
                "\tmovs r0, 0\n"
                "\tstrh r0, [r1, 0x4]\n"
                "\tmovs r0, 0x3\n"
                "\tb _080F413C_setfield0_return0\n"
                "\t.align 2, 0\n"
                "_080F3CC8: .4byte gUnknown_203AB40\n"
                "_080F3CCC:\n"
                "\tadd r1, sp, 0x14\n"
                "\tsubs r0, 0x1\n"
                "\tstrh r0, [r1]\n"
                "\tadds r2, r1, 0\n"
                "\tadds r0, r1, 0\n"
                "\tldrh r1, [r0, 0x2]\n"
                "\tadds r1, 0x1\n"
                "\tstrh r1, [r2, 0x2]\n"
                "\tldrh r0, [r0]\n"
                "\tlsls r0, 8\n"
                "\tadds r1, r0\n"
                "\tlsls r1, 16\n"
                "\tlsrs r1, 16\n"
                "\tmovs r0, 0x44\n"
                "\tbl SetGpuReg\n"
                "\tb _080F3D06_return0\n"
                "_080F3CEE_case03:\n"
                "\tldr r1, [r7]\n"
                "\tldrh r0, [r1, 0x4]\n"
                "\tcmp r0, 0\n"
                "\tbne _080F3D52_decfield4_return0\n"
                "\tmovs r0, 0\n"
                "\tbl sub_80F4930\n"
                "\tldr r0, [r7]\n"
                "\tmovs r1, 0x64\n"
                "\tstrh r1, [r0, 0x4]\n"
                "\tmovs r1, 0x4\n"
                "\tstrb r1, [r0]\n"
                "_080F3D06_return0:\n"
                "\tmovs r0, 0\n"
                "\tb _080F4182_return\n"
                "_080F3D0A_case04:\n"
                "\tldr r1, [r7]\n"
                "\tldrh r0, [r1, 0x4]\n"
                "\tadds r2, r0, 0\n"
                "\tcmp r2, 0\n"
                "\tbne _080F3D52_decfield4_return0\n"
                "\tmovs r0, 0xB4\n"
                "\tlsls r0, 1\n"
                "\tstrh r0, [r1, 0x4]\n"
                "\tldrb r0, [r1, 0xA]\n"
                "\tmovs r1, 0x1\n"
                "\tstr r1, [sp]\n"
                "\tmovs r1, 0x2\n"
                "\tstr r1, [sp, 0x4]\n"
                "\tldr r1, _080F3D40 @ =gUnknown_8410E00\n"
                "\tstr r1, [sp, 0x8]\n"
                "\tstr r2, [sp, 0xC]\n"
                "\tldr r1, _080F3D44 @ =gUnknown_841D198\n"
                "\tstr r1, [sp, 0x10]\n"
                "\tmovs r1, 0x1\n"
                "\tmovs r2, 0x8\n"
                "\tmovs r3, 0x29\n"
                "\tbl AddTextPrinterParameterized4\n"
                "\tldr r1, [r7]\n"
                "\tmovs r0, 0x5\n"
                "\tb _080F413C_setfield0_return0\n"
                "\t.align 2, 0\n"
                "_080F3D40: .4byte gUnknown_8410E00\n"
                "_080F3D44: .4byte gUnknown_841D198\n"
                "_080F3D48_case05:\n"
                "\tldr r1, [r7]\n"
                "\tldrh r0, [r1, 0x4]\n"
                "\tadds r4, r0, 0\n"
                "\tcmp r4, 0\n"
                "\tbeq _080F3D58\n"
                "_080F3D52_decfield4_return0:\n"
                "\tsubs r0, 0x1\n"
                "\tstrh r0, [r1, 0x4]\n"
                "\tb _080F3D06_return0\n"
                "_080F3D58:\n"
                "\tbl sub_80F3B04\n"
                "\tldr r0, [r7]\n"
                "\tmovs r1, 0x6\n"
                "\tstrb r1, [r0]\n"
                "\tldr r0, [r7]\n"
                "\tstrh r4, [r0, 0x4]\n"
                "\tstrh r4, [r0, 0x6]\n"
                "\tb _080F3D06_return0\n"
                "_080F3D6A_case06:\n"
                "\tldr r2, [r7]\n"
                "\tldrh r0, [r2, 0x4]\n"
                "\tcmp r0, 0\n"
                "\tbeq _080F3D7A\n"
                "\tsubs r0, 0x1\n"
                "\tstrh r0, [r2, 0x4]\n"
                "\tldrb r0, [r2, 0x8]\n"
                "\tb _080F4182_return\n"
                "_080F3D7A:\n"
                "\tldr r1, _080F3D94 @ =gUnknown_8410CF4\n"
                "\tldrh r0, [r2, 0x6]\n"
                "\tlsls r0, 2\n"
                "\tadds r0, r1\n"
                "\tldrb r0, [r0]\n"
                "\tcmp r0, 0x5\n"
                "\tbls _080F3D8A\n"
                "\tb _080F3E94\n"
                "_080F3D8A:\n"
                "\tlsls r0, 2\n"
                "\tldr r1, _080F3D98 @ =_080F3D9C\n"
                "\tadds r0, r1\n"
                "\tldr r0, [r0]\n"
                "\tmov pc, r0\n"
                "\t.align 2, 0\n"
                "_080F3D94: .4byte gUnknown_8410CF4\n"
                "_080F3D98: .4byte _080F3D9C\n"
                "\t.align 2, 0\n"
                "_080F3D9C:\n"
                "\t.4byte _080F3DB4\n"
                "\t.4byte _080F3DE0\n"
                "\t.4byte _080F3E10\n"
                "\t.4byte _080F3E30\n"
                "\t.4byte _080F3E58\n"
                "\t.4byte _080F3E8C\n"
                "_080F3DB4:\n"
                "\tmovs r0, 0x80\n"
                "\tlsls r0, 8\n"
                "\tmovs r1, 0\n"
                "\tstr r1, [sp]\n"
                "\tmovs r2, 0\n"
                "\tmovs r3, 0x10\n"
                "\tbl BeginNormalPaletteFade\n"
                "\tldr r4, _080F3DDC @ =gUnknown_203AB40\n"
                "\tldr r1, [r4]\n"
                "\tmovs r0, 0x7\n"
                "\tstrb r0, [r1]\n"
                "\tldr r0, [r4]\n"
                "\tldrb r0, [r0, 0xA]\n"
                "\tmovs r1, 0\n"
                "\tbl FillWindowPixelBuffer\n"
                "\tldr r0, [r4]\n"
                "\tldrb r0, [r0, 0x8]\n"
                "\tb _080F4182_return\n"
                "\t.align 2, 0\n"
                "_080F3DDC: .4byte gUnknown_203AB40\n"
                "_080F3DE0:\n"
                "\tldr r2, _080F3E04 @ =gUnknown_203AB40\n"
                "\tldr r1, [r2]\n"
                "\tmovs r0, 0xA\n"
                "\tstrb r0, [r1]\n"
                "\tldr r2, [r2]\n"
                "\tldr r1, _080F3E08 @ =gUnknown_8410CF4\n"
                "\tldrh r0, [r2, 0x6]\n"
                "\tlsls r0, 2\n"
                "\tadds r0, r1\n"
                "\tldrb r0, [r0, 0x1]\n"
                "\tstrb r0, [r2, 0x9]\n"
                "\tldr r2, _080F3E0C @ =0x3fffffff\n"
                "\tmovs r0, 0x1\n"
                "\tmovs r1, 0\n"
                "\tbl sub_807A944\n"
                "\tb _080F3E94\n"
                "\t.align 2, 0\n"
                "_080F3E04: .4byte gUnknown_203AB40\n"
                "_080F3E08: .4byte gUnknown_8410CF4\n"
                "_080F3E0C: .4byte 0x3fffffff\n"
                "_080F3E10:\n"
                "\tldr r2, _080F3E28 @ =gUnknown_203AB40\n"
                "\tldr r1, [r2]\n"
                "\tmovs r0, 0xC\n"
                "\tstrb r0, [r1]\n"
                "\tldr r2, [r2]\n"
                "\tldr r1, _080F3E2C @ =gUnknown_8410CF4\n"
                "\tldrh r0, [r2, 0x6]\n"
                "\tlsls r0, 2\n"
                "\tadds r0, r1\n"
                "\tldrb r0, [r0, 0x1]\n"
                "\tstrb r0, [r2, 0x9]\n"
                "\tb _080F3E94\n"
                "\t.align 2, 0\n"
                "_080F3E28: .4byte gUnknown_203AB40\n"
                "_080F3E2C: .4byte gUnknown_8410CF4\n"
                "_080F3E30:\n"
                "\tldr r2, _080F3E50 @ =gUnknown_203AB40\n"
                "\tldr r1, [r2]\n"
                "\tmovs r0, 0xD\n"
                "\tstrb r0, [r1]\n"
                "\tldr r2, [r2]\n"
                "\tldr r1, _080F3E54 @ =gUnknown_8410CF4\n"
                "\tldrh r0, [r2, 0x6]\n"
                "\tlsls r0, 2\n"
                "\tadds r0, r1\n"
                "\tldrb r0, [r0, 0x1]\n"
                "\tstrb r0, [r2, 0x9]\n"
                "\tmovs r0, 0x1\n"
                "\tmovs r1, 0\n"
                "\tbl fade_screen\n"
                "\tb _080F3E94\n"
                "\t.align 2, 0\n"
                "_080F3E50: .4byte gUnknown_203AB40\n"
                "_080F3E54: .4byte gUnknown_8410CF4\n"
                "_080F3E58:\n"
                "\tldr r2, _080F3E84 @ =gUnknown_203AB40\n"
                "\tldr r1, [r2]\n"
                "\tmovs r3, 0\n"
                "\tmovs r0, 0xF\n"
                "\tstrb r0, [r1]\n"
                "\tldr r2, [r2]\n"
                "\tldr r1, _080F3E88 @ =gUnknown_8410CF4\n"
                "\tldrh r0, [r2, 0x6]\n"
                "\tlsls r0, 2\n"
                "\tadds r0, r1\n"
                "\tldrb r0, [r0, 0x1]\n"
                "\tstrb r0, [r2, 0x9]\n"
                "\tmovs r0, 0x1\n"
                "\tnegs r0, r0\n"
                "\tstr r3, [sp]\n"
                "\tmovs r1, 0x4\n"
                "\tmovs r2, 0\n"
                "\tmovs r3, 0x10\n"
                "\tbl BeginNormalPaletteFade\n"
                "\tb _080F3E94\n"
                "\t.align 2, 0\n"
                "_080F3E84: .4byte gUnknown_203AB40\n"
                "_080F3E88: .4byte gUnknown_8410CF4\n"
                "_080F3E8C:\n"
                "\tldr r0, _080F3EAC @ =gUnknown_203AB40\n"
                "\tldr r1, [r0]\n"
                "\tmovs r0, 0x11\n"
                "\tstrb r0, [r1]\n"
                "_080F3E94:\n"
                "\tldr r0, _080F3EAC @ =gUnknown_203AB40\n"
                "\tldr r1, [r0]\n"
                "\tldr r2, _080F3EB0 @ =gUnknown_8410CF4\n"
                "\tldrh r0, [r1, 0x6]\n"
                "\tlsls r0, 2\n"
                "\tadds r0, r2\n"
                "\tldrh r0, [r0, 0x2]\n"
                "\tstrh r0, [r1, 0x4]\n"
                "\tldrh r0, [r1, 0x6]\n"
                "\tadds r0, 0x1\n"
                "\tstrh r0, [r1, 0x6]\n"
                "\tb _080F3D06_return0\n"
                "\t.align 2, 0\n"
                "_080F3EAC: .4byte gUnknown_203AB40\n"
                "_080F3EB0: .4byte gUnknown_8410CF4\n"
                "_080F3EB4_case07:\n"
                "\tldr r0, _080F3F14 @ =gPaletteFade\n"
                "\tldrb r1, [r0, 0x7]\n"
                "\tmovs r0, 0x80\n"
                "\tands r0, r1\n"
                "\tlsls r0, 24\n"
                "\tlsrs r6, r0, 24\n"
                "\tcmp r6, 0\n"
                "\tbne _080F3FBA_returnfield8\n"
                "\tadd r3, sp, 0x14\n"
                "\tldr r5, _080F3F18 @ =gUnknown_84145BC\n"
                "\tldr r4, _080F3F1C @ =gUnknown_8410CF4\n"
                "\tldr r2, [r7]\n"
                "\tldrh r0, [r2, 0x6]\n"
                "\tlsls r0, 2\n"
                "\tadds r0, r4\n"
                "\tldrb r1, [r0, 0x1]\n"
                "\tlsls r0, r1, 1\n"
                "\tadds r0, r1\n"
                "\tlsls r0, 2\n"
                "\tadds r0, r5\n"
                "\tldrb r0, [r0, 0x8]\n"
                "\tstrh r0, [r3]\n"
                "\tldrb r0, [r2, 0xA]\n"
                "\tstr r6, [sp]\n"
                "\tstr r6, [sp, 0x4]\n"
                "\tldr r1, _080F3F20 @ =gUnknown_8410E00\n"
                "\tstr r1, [sp, 0x8]\n"
                "\tmovs r1, 0x1\n"
                "\tnegs r1, r1\n"
                "\tstr r1, [sp, 0xC]\n"
                "\tldrh r1, [r2, 0x6]\n"
                "\tlsls r1, 2\n"
                "\tadds r1, r4\n"
                "\tldrb r2, [r1, 0x1]\n"
                "\tlsls r1, r2, 1\n"
                "\tadds r1, r2\n"
                "\tlsls r1, 2\n"
                "\tadds r1, r5\n"
                "\tldr r1, [r1]\n"
                "\tstr r1, [sp, 0x10]\n"
                "\tmovs r1, 0x1\n"
                "\tmovs r2, 0x2\n"
                "\tmovs r3, 0x6\n"
                "\tbl AddTextPrinterParameterized4\n"
                "\tldr r1, [r7]\n"
                "\tmovs r0, 0x8\n"
                "\tb _080F3FB8_setfield0_returnfield8\n"
                "\t.align 2, 0\n"
                "_080F3F14: .4byte gPaletteFade\n"
                "_080F3F18: .4byte gUnknown_84145BC\n"
                "_080F3F1C: .4byte gUnknown_8410CF4\n"
                "_080F3F20: .4byte gUnknown_8410E00\n"
                "_080F3F24_case08:\n"
                "\tadd r4, sp, 0x14\n"
                "\tldr r3, _080F3F78 @ =gUnknown_84145BC\n"
                "\tldr r5, _080F3F7C @ =gUnknown_8410CF4\n"
                "\tldr r2, [r7]\n"
                "\tldrh r0, [r2, 0x6]\n"
                "\tlsls r0, 2\n"
                "\tadds r0, r5\n"
                "\tldrb r1, [r0, 0x1]\n"
                "\tlsls r0, r1, 1\n"
                "\tadds r0, r1\n"
                "\tlsls r0, 2\n"
                "\tadds r0, r3\n"
                "\tldrb r0, [r0, 0x8]\n"
                "\tmovs r1, 0\n"
                "\tstrh r0, [r4]\n"
                "\tldrb r0, [r2, 0xA]\n"
                "\tstr r1, [sp]\n"
                "\tstr r1, [sp, 0x4]\n"
                "\tldr r1, _080F3F80 @ =gUnknown_8410E04\n"
                "\tstr r1, [sp, 0x8]\n"
                "\tmovs r1, 0x1\n"
                "\tnegs r1, r1\n"
                "\tstr r1, [sp, 0xC]\n"
                "\tldrh r1, [r2, 0x6]\n"
                "\tlsls r1, 2\n"
                "\tadds r1, r5\n"
                "\tldrb r2, [r1, 0x1]\n"
                "\tlsls r1, r2, 1\n"
                "\tadds r1, r2\n"
                "\tlsls r1, 2\n"
                "\tadds r3, 0x4\n"
                "\tadds r1, r3\n"
                "\tldr r1, [r1]\n"
                "\tstr r1, [sp, 0x10]\n"
                "\tmovs r1, 0x2\n"
                "\tmovs r2, 0x8\n"
                "\tmovs r3, 0x6\n"
                "\tbl AddTextPrinterParameterized4\n"
                "\tldr r1, [r7]\n"
                "\tmovs r0, 0x9\n"
                "\tb _080F3FB8_setfield0_returnfield8\n"
                "\t.align 2, 0\n"
                "_080F3F78: .4byte gUnknown_84145BC\n"
                "_080F3F7C: .4byte gUnknown_8410CF4\n"
                "_080F3F80: .4byte gUnknown_8410E04\n"
                "_080F3F84_case09:\n"
                "\tldr r0, [r7]\n"
                "\tldrb r0, [r0, 0xA]\n"
                "\tmovs r1, 0x2\n"
                "\tbl CopyWindowToVram\n"
                "\tldr r1, [r7]\n"
                "\tldr r2, _080F3FC0 @ =gUnknown_8410CF4\n"
                "\tldrh r0, [r1, 0x6]\n"
                "\tlsls r0, 2\n"
                "\tadds r0, r2\n"
                "\tldrh r0, [r0, 0x2]\n"
                "\tmovs r2, 0\n"
                "\tstrh r0, [r1, 0x4]\n"
                "\tldrh r0, [r1, 0x6]\n"
                "\tadds r0, 0x1\n"
                "\tstrh r0, [r1, 0x6]\n"
                "\tmovs r0, 0x80\n"
                "\tlsls r0, 8\n"
                "\tstr r2, [sp]\n"
                "\tmovs r1, 0\n"
                "\tmovs r2, 0x10\n"
                "\tmovs r3, 0\n"
                "\tbl BeginNormalPaletteFade\n"
                "\tldr r1, [r7]\n"
                "\tmovs r0, 0x6\n"
                "_080F3FB8_setfield0_returnfield8:\n"
                "\tstrb r0, [r1]\n"
                "_080F3FBA_returnfield8:\n"
                "\tldr r0, [r7]\n"
                "\tldrb r0, [r0, 0x8]\n"
                "\tb _080F4182_return\n"
                "\t.align 2, 0\n"
                "_080F3FC0: .4byte gUnknown_8410CF4\n"
                "_080F3FC4_case0A:\n"
                "\tldr r0, _080F3FE8 @ =gPaletteFade\n"
                "\tldrb r1, [r0, 0x7]\n"
                "\tmovs r0, 0x80\n"
                "\tands r0, r1\n"
                "\tlsls r0, 24\n"
                "\tlsrs r4, r0, 24\n"
                "\tcmp r4, 0\n"
                "\tbeq _080F3FD6\n"
                "\tb _080F3D06_return0\n"
                "_080F3FD6:\n"
                "\tbl sub_80F3B04\n"
                "\tldr r1, _080F3FEC @ =gUnknown_203AB40\n"
                "\tldr r0, [r1]\n"
                "\tstrb r4, [r0, 0x1]\n"
                "\tldr r1, [r1]\n"
                "\tmovs r0, 0xB\n"
                "\tb _080F413C_setfield0_return0\n"
                "\t.align 2, 0\n"
                "_080F3FE8: .4byte gPaletteFade\n"
                "_080F3FEC: .4byte gUnknown_203AB40\n"
                "_080F3FF0_case0B:\n"
                "\tldr r0, [r7]\n"
                "\tldrb r0, [r0, 0x9]\n"
                "\tbl sub_80F3B2C\n"
                "\tcmp r0, 0\n"
                "\tbne _080F3FFE\n"
                "\tb _080F3D06_return0\n"
                "_080F3FFE:\n"
                "\tldr r1, [r7]\n"
                "\tmovs r0, 0x1\n"
                "\tstrb r0, [r1, 0x8]\n"
                "\tldr r1, [r7]\n"
                "\tmovs r0, 0x6\n"
                "\tb _080F413C_setfield0_return0\n"
                "_080F400A_case0C:\n"
                "\tldr r0, _080F4050 @ =gPaletteFade\n"
                "\tldrb r1, [r0, 0x7]\n"
                "\tmovs r0, 0x80\n"
                "\tands r0, r1\n"
                "\tlsls r0, 24\n"
                "\tlsrs r4, r0, 24\n"
                "\tcmp r4, 0\n"
                "\tbeq _080F401C\n"
                "\tb _080F3D06_return0\n"
                "_080F401C:\n"
                "\tbl sub_80F3B04\n"
                "\tldr r1, _080F4054 @ =gUnknown_203AB40\n"
                "\tldr r0, [r1]\n"
                "\tstrb r4, [r0, 0x1]\n"
                "\tadds r4, r1, 0\n"
                "_080F4028:\n"
                "\tldr r0, [r4]\n"
                "\tldrb r0, [r0, 0x9]\n"
                "\tbl sub_80F3B2C\n"
                "\tcmp r0, 0\n"
                "\tbeq _080F4028\n"
                "\tldr r0, _080F4054 @ =gUnknown_203AB40\n"
                "\tldr r0, [r0]\n"
                "\tldrb r0, [r0, 0x9]\n"
                "\tcmp r0, 0x6\n"
                "\tbeq _080F4058\n"
                "\tcmp r0, 0x6\n"
                "\tble _080F404A\n"
                "\tcmp r0, 0x9\n"
                "\tbeq _080F405E\n"
                "\tcmp r0, 0xC\n"
                "\tbeq _080F4064\n"
                "_080F404A:\n"
                "\tadd r1, sp, 0x14\n"
                "\tmovs r0, 0x1\n"
                "\tb _080F4068\n"
                "\t.align 2, 0\n"
                "_080F4050: .4byte gPaletteFade\n"
                "_080F4054: .4byte gUnknown_203AB40\n"
                "_080F4058:\n"
                "\tadd r1, sp, 0x14\n"
                "\tmovs r0, 0x2\n"
                "\tb _080F4068\n"
                "_080F405E:\n"
                "\tadd r1, sp, 0x14\n"
                "\tmovs r0, 0x3\n"
                "\tb _080F4068\n"
                "_080F4064:\n"
                "\tadd r1, sp, 0x14\n"
                "\tmovs r0, 0x4\n"
                "_080F4068:\n"
                "\tstrh r0, [r1]\n"
                "\tadd r0, sp, 0x14\n"
                "\tldrb r0, [r0]\n"
                "\tbl sub_80F4930\n"
                "\tldr r2, _080F4080 @ =gUnknown_203AB40\n"
                "\tldr r1, [r2]\n"
                "\tmovs r0, 0x1\n"
                "\tstrb r0, [r1, 0x8]\n"
                "\tldr r1, [r2]\n"
                "\tmovs r0, 0x6\n"
                "\tb _080F413C_setfield0_return0\n"
                "\t.align 2, 0\n"
                "_080F4080: .4byte gUnknown_203AB40\n"
                "_080F4084_case0D:\n"
                "\tldr r0, _080F40B0 @ =gPaletteFade\n"
                "\tldrb r1, [r0, 0x7]\n"
                "\tmovs r0, 0x80\n"
                "\tands r0, r1\n"
                "\tlsls r0, 24\n"
                "\tlsrs r4, r0, 24\n"
                "\tcmp r4, 0\n"
                "\tbeq _080F4096\n"
                "\tb _080F3D06_return0\n"
                "_080F4096:\n"
                "\tbl sub_80F48D0\n"
                "\tbl sub_80F3B04\n"
                "\tldr r1, _080F40B4 @ =gUnknown_203AB40\n"
                "\tldr r0, [r1]\n"
                "\tstrb r4, [r0, 0x1]\n"
                "\tldr r0, [r1]\n"
                "\tstrb r4, [r0, 0x8]\n"
                "\tldr r1, [r1]\n"
                "\tmovs r0, 0xE\n"
                "\tb _080F413C_setfield0_return0\n"
                "\t.align 2, 0\n"
                "_080F40B0: .4byte gPaletteFade\n"
                "_080F40B4: .4byte gUnknown_203AB40\n"
                "_080F40B8_case0E:\n"
                "\tbl sub_80F4328\n"
                "\tcmp r0, 0\n"
                "\tbne _080F40C2\n"
                "\tb _080F3D06_return0\n"
                "_080F40C2:\n"
                "\tldr r0, _080F40CC @ =gUnknown_203AB40\n"
                "\tldr r1, [r0]\n"
                "\tmovs r0, 0x6\n"
                "\tb _080F413C_setfield0_return0\n"
                "\t.align 2, 0\n"
                "_080F40CC: .4byte gUnknown_203AB40\n"
                "_080F40D0_case0F:\n"
                "\tldr r0, _080F40F8 @ =gPaletteFade\n"
                "\tldrb r1, [r0, 0x7]\n"
                "\tmovs r0, 0x80\n"
                "\tands r0, r1\n"
                "\tlsls r0, 24\n"
                "\tlsrs r4, r0, 24\n"
                "\tcmp r4, 0\n"
                "\tbeq _080F40E2\n"
                "\tb _080F3D06_return0\n"
                "_080F40E2:\n"
                "\tbl sub_80F3B04\n"
                "\tldr r1, _080F40FC @ =gUnknown_203AB40\n"
                "\tldr r0, [r1]\n"
                "\tstrb r4, [r0, 0x1]\n"
                "\tldr r0, [r1]\n"
                "\tstrb r4, [r0, 0x8]\n"
                "\tldr r1, [r1]\n"
                "\tmovs r0, 0x10\n"
                "\tb _080F413C_setfield0_return0\n"
                "\t.align 2, 0\n"
                "_080F40F8: .4byte gPaletteFade\n"
                "_080F40FC: .4byte gUnknown_203AB40\n"
                "_080F4100_case10:\n"
                "\tbl sub_80F4674\n"
                "\tcmp r0, 0\n"
                "\tbne _080F410A\n"
                "\tb _080F3D06_return0\n"
                "_080F410A:\n"
                "\tldr r0, _080F4114 @ =gUnknown_203AB40\n"
                "\tldr r1, [r0]\n"
                "\tmovs r0, 0x6\n"
                "\tb _080F413C_setfield0_return0\n"
                "\t.align 2, 0\n"
                "_080F4114: .4byte gUnknown_203AB40\n"
                "_080F4118_case11:\n"
                "\tldr r0, _080F4140 @ =gMain\n"
                "\tldrh r1, [r0, 0x2E]\n"
                "\tmovs r0, 0x1\n"
                "\tands r0, r1\n"
                "\tcmp r0, 0\n"
                "\tbeq _080F414C\n"
                "\tmovs r0, 0x1\n"
                "\tnegs r0, r0\n"
                "\tldr r1, _080F4144 @ =0x00007fff\n"
                "\tstr r1, [sp]\n"
                "\tmovs r1, 0\n"
                "\tmovs r2, 0\n"
                "\tmovs r3, 0x10\n"
                "\tbl BeginNormalPaletteFade\n"
                "\tldr r0, _080F4148 @ =gUnknown_203AB40\n"
                "\tldr r1, [r0]\n"
                "\tmovs r0, 0x12\n"
                "_080F413C_setfield0_return0:\n"
                "\tstrb r0, [r1]\n"
                "\tb _080F3D06_return0\n"
                "\t.align 2, 0\n"
                "_080F4140: .4byte gMain\n"
                "_080F4144: .4byte 0x00007fff\n"
                "_080F4148: .4byte gUnknown_203AB40\n"
                "_080F414C:\n"
                "\tldr r1, [r7]\n"
                "\tldrh r0, [r1, 0x4]\n"
                "\tcmp r0, 0\n"
                "\tbeq _080F4156\n"
                "\tb _080F3D52_decfield4_return0\n"
                "_080F4156:\n"
                "\tmovs r0, 0x12\n"
                "\tstrb r0, [r1]\n"
                "\tsubs r0, 0x13\n"
                "\tldr r1, _080F416C @ =0x00007fff\n"
                "\tstr r1, [sp]\n"
                "\tmovs r1, 0\n"
                "\tmovs r2, 0\n"
                "\tmovs r3, 0x10\n"
                "\tbl BeginNormalPaletteFade\n"
                "\tb _080F3D06_return0\n"
                "\t.align 2, 0\n"
                "_080F416C: .4byte 0x00007fff\n"
                "_080F4170_case12:\n"
                "\tldr r0, _080F418C @ =gPaletteFade\n"
                "\tldrb r1, [r0, 0x7]\n"
                "\tmovs r0, 0x80\n"
                "\tands r0, r1\n"
                "\tcmp r0, 0\n"
                "\tbne _080F4180_default_return2\n"
                "\tbl sub_80F3B04\n"
                "_080F4180_default_return2:\n"
                "\tmovs r0, 0x2\n"
                "_080F4182_return:\n"
                "\tadd sp, 0x24\n"
                "\tpop {r4-r7}\n"
                "\tpop {r1}\n"
                "\tbx r1\n"
                "\t.align 2, 0\n"
                "_080F418C: .4byte gPaletteFade");
}
#endif //NONMATCHING
