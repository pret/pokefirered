#include "global.h"
#include "palette.h"
#include "gpu_regs.h"
#include "scanline_effect.h"
#include "task.h"
#include "malloc.h"
#include "overworld.h"
#include "event_data.h"
#include "region_map.h"
#include "window.h"
#include "sound.h"
#include "new_menu_helpers.h"
#include "strings.h"
#include "constants/flags.h"
#include "constants/songs.h"
#include "constants/region_map.h"

struct UnkStruct_20399D4
{
    u8 filler_0000[0x0026];
    u16 field_0026[5][600];
    // Inefficiency: these should be u8 or have half the elements each
    u16 field_1796[BG_SCREEN_SIZE];
    u16 field_2796[BG_SCREEN_SIZE];
    u16 field_3796[BG_SCREEN_SIZE];
    u8 field_4796;
    u8 field_4797[4];
    u8 field_479B;
    u8 field_479C;
    u8 filler_479D[3];
    u8 field_47A0;
    u8 filler_47A1[3];
    u8 field_47A4;
    u8 filler_47A5[3];
    u8 field_47A8;
    u8 filler_47A9[15];
    TaskFunc field_47B8;
    MainCallback field_47BC;
};

EWRAM_DATA struct UnkStruct_20399D4 * gUnknown_20399D4 = NULL;
EWRAM_DATA void * gUnknown_20399D8 = NULL;
EWRAM_DATA void * gUnknown_20399DC = NULL;
EWRAM_DATA void * gUnknown_20399E0 = NULL;
EWRAM_DATA void * gUnknown_20399E4 = NULL;
EWRAM_DATA void * gUnknown_20399E8 = NULL;
EWRAM_DATA void * gUnknown_20399EC = NULL;
EWRAM_DATA void * gUnknown_20399F0[3] = {};
EWRAM_DATA void * gUnknown_20399FC = NULL;

static void sub_80BFFD0(void);
void sub_80C0100(void);
bool8 sub_80C0238(void);
void sub_80C03E8(void);
void sub_80C04E4(u8 taskId);
void sub_80C07F8(u8 taskId);
void sub_80C0820(u8 taskId);
void sub_80C08B4(void);
void sub_80C08E0(void);
void sub_80C08F4(void);
void sub_80C0904(void);
void sub_80C0A2C(void);
void sub_80C0A6C(void);
void sub_80C0A88(u8 a0);
void sub_80C0AB8(void);
void sub_80C0B18(void);
void sub_80C0B9C(void);
void sub_80C0BB0(void);
void sub_80C0CC8(u8 bg, u16 *map);
bool8 sub_80C0E04(u8 a0);
u8 sub_80C0E20(void);
void sub_80C0E70(u8 a0, u8 taskId, TaskFunc taskFunc);
void sub_80C195C(u8 a0, u8 taskId, TaskFunc taskFunc);
void sub_80C2208(u8 taskId, TaskFunc taskFunc);
void sub_80C25BC(void);
void sub_80C2C1C(u8 taskId);
void sub_80C3008(u16 a0, u16 a1);
void sub_80C3154(u8 a0);
void sub_80C3178(void);
void sub_80C3188(void);
u8 sub_80C3AC8(u8 a0);
u8 sub_80C3400(void);
u8 sub_80C4164(u8 a0, u8 a1, s16 a2, s16 a3);
void sub_80C41D8(u16 a0, u16 a1);
void sub_80C4324(u8 a0);
void sub_80C4398(u8 a0, u8 taskId, TaskFunc taskFunc);
void sub_80C4348(void);
void sub_80C48BC(u8 a0, u8 a1, u8 a2);
void sub_80C4960(u8 a0, u8 a1, u8 a2);
void sub_80C4A04(void);
void sub_80C4D30(void);
void sub_80C4E18(const u8 *str);
void sub_80C4E74(const u8 *str);
void sub_80C4ED0(bool8 a0);
void sub_80C4F08(u8 taskId);
u16 sub_80C3508(void);
u16 sub_80C3514(void);
u16 sub_80C3580(void);

#include "data/text/map_section_names.h"

extern const u16 gUnknown_83EF23C[];
extern const u16 gUnknown_83EF2DC[];
extern const u32 gUnknown_83EF61C[];
extern const u32 gUnknown_83F089C[];
extern const u32 gUnknown_83F0AFC[];
extern const u32 gUnknown_83F0C0C[];
extern const u32 gUnknown_83F0CF0[];
extern const u32 gUnknown_83F1978[];
extern const u32 gUnknown_83F19A0[];
extern const struct BgTemplate gUnknown_83F1A50[4];
extern const struct WindowTemplate gUnknown_83F1A60[];
extern const u8 sSeviiMapsecs[3][30];
extern const u8 gUnknown_83F1B00[3][4];

static void RegionMap_DarkenPalette(u16 *pal, u16 size, u16 tint)
{
    int i;
    int r, g, b;

    for (i = 0; i < size; i++)
    {
        r = (*pal) & 0x1F;
        g = ((*pal) >> 5) & 0x1F;
        b = ((*pal) >> 10) & 0x1F;

        r = (((r << 8) / 100) * tint) >> 8;
        g = (((g << 8) / 100) * tint) >> 8;
        b = (((b << 8) / 100) * tint) >> 8;

        *pal = RGB2(r, g, b);
        pal++;
    }
}

void sub_80BFEA0(void)
{
    u16 pal[16];
    CpuCopy16(&gUnknown_83EF2DC[0x20], pal, sizeof(pal));
    RegionMap_DarkenPalette(pal, NELEMS(pal), 95);
    LoadPalette(pal, 0x20, 0x20);
    LoadPalette(&gUnknown_83EF2DC[0x2F], 0x2F, sizeof(u16));
}

void sub_80BFEDC(u8 kind)
{
    gUnknown_20399D4 = AllocZeroed(sizeof(struct UnkStruct_20399D4));
    if (gUnknown_20399D4 == NULL)
    {
        SetMainCallback2(CB2_ReturnToField);
    }
    else
    {
        gUnknown_2031DE0 = TRUE;
        gUnknown_20399D4->field_4796 = kind;
        gUnknown_20399D4->field_47A0 = 0;
        gUnknown_20399D4->field_47A4 = 0;
        gUnknown_20399D4->field_47A8 = 0;
        sub_80BFFD0();
        SetMainCallback2(sub_80C0100);
    }
}

void sub_80BFF50(u8 kind, MainCallback cb)
{
    gUnknown_20399D4 = AllocZeroed(sizeof(struct UnkStruct_20399D4));
    if (gUnknown_20399D4 == NULL)
    {
        SetMainCallback2(CB2_ReturnToField);
    }
    else
    {
        gUnknown_2031DE0 = TRUE;
        gUnknown_20399D4->field_4796 = kind;
        gUnknown_20399D4->field_47A0 = 0;
        gUnknown_20399D4->field_47A4 = 0;
        gUnknown_20399D4->field_47A8 = 0;
        gUnknown_20399D4->field_47BC = cb;
        sub_80BFFD0();
        SetMainCallback2(sub_80C0100);
    }
}

static void sub_80BFFD0(void)
{
    u8 i;
    u8 j;
    u8 r7;

    switch (gUnknown_20399D4->field_4796)
    {
    default:
    case 0:
    case 1:
        gUnknown_20399D4->field_47B8 = sub_80C04E4;
        break;
    case 2:
        gUnknown_20399D4->field_47B8 = sub_80C4F08;
        break;
    }
    for (i = 0; i < 4; i++)
    {
        gUnknown_20399D4->field_4797[i] = gUnknown_83F1B00[gUnknown_20399D4->field_4796][i];
    }
    if (!FlagGet(FLAG_SYS_SEVII_MAP_123))
        gUnknown_20399D4->field_4797[0] = FALSE;
    r7 = 0;
    j = 0;
    if (gMapHeader.regionMapSectionId >= MAPSECS_SEVII_123)
    {
        while (r7 == 0)
        {
            for (i = 0; sSeviiMapsecs[j][i] != MAPSEC_NONE; i++)
            {
                if (gMapHeader.regionMapSectionId == sSeviiMapsecs[j][i])
                {
                    r7 = j + 1;
                    break;
                }
            }
            j++;
        }
    }
    gUnknown_20399D4->field_479B = r7;
    gUnknown_20399D4->field_479C = r7;
}

void sub_80C0100(void)
{
    switch (gUnknown_20399D4->field_47A4)
    {
    case 0:
        sub_80C08E0();
        break;
    case 1:
        sub_80C0904();
        break;
    case 2:
        sub_80C0A6C();
        break;
    case 3:
        if (!sub_80C0238())
            return;
        break;
    case 4:
        FillBgTilemapBufferRect_Palette0(1, 0x000, 0, 0, 30, 20);
        CopyBgTilemapBufferToVram(1);
        break;
    case 5:
        sub_80C0CC8(0, gUnknown_20399D4->field_0026[gUnknown_20399D4->field_479B]);
        CopyBgTilemapBufferToVram(0);
        if (gUnknown_20399D4->field_4796 != 0)
        {
            sub_80C0CC8(1, gUnknown_20399D4->field_0026[4]);
            CopyBgTilemapBufferToVram(1);
        }
        break;
    case 6:
        sub_80C0B18();
        PutWindowTilemap(0);
        break;
    case 7:
        sub_80C0BB0();
        PutWindowTilemap(1);
        break;
    case 8:
        if (sub_80C0E04(2) == TRUE)
            sub_80C0A88(1);
        break;
    default:
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 16, 0, RGB_BLACK);
        sub_80C03E8();
        sub_80C08F4();
        break;
    }
    gUnknown_20399D4->field_47A4++;
}

bool8 sub_80C0238(void)
{
    switch (gUnknown_20399D4->field_47A8)
    {
    case 0:
        LoadPalette(gUnknown_83EF23C, 0xC0, 0x20);
        break;
    case 1:
        LoadPalette(gUnknown_83EF2DC, 0x00, 0xA0);
        sub_80BFEA0();
        if (gUnknown_20399D4->field_4796 != 0)
        {
            LoadPalette(&gUnknown_83EF23C[15], 0x00, 0x02);
            LoadPalette(&gUnknown_83EF23C[15], 0x10, 0x02);
            LoadPalette(&gUnknown_83EF23C[15], 0x20, 0x02);
            LoadPalette(&gUnknown_83EF23C[15], 0x30, 0x02);
            LoadPalette(&gUnknown_83EF23C[15], 0x40, 0x02);
        }
        break;
    case 2:
        ResetTempTileDataBuffers();
        break;
    case 3:
        DecompressAndCopyTileDataToVram(0, gUnknown_83EF61C, 0, 0, 0);
        if (gUnknown_20399D4->field_4796 != 0)
        {
            DecompressAndCopyTileDataToVram(1, gUnknown_83F1978, 0, 0, 0);
        }
        break;
    case 4:
        if (FreeTempTileDataBuffersIfPossible() == TRUE)
            return FALSE;
        break;
    case 5:
        LZ77UnCompWram(gUnknown_83F089C, gUnknown_20399D4->field_0026[0]);
        break;
    case 6:
        LZ77UnCompWram(gUnknown_83F0AFC, gUnknown_20399D4->field_0026[1]);
        break;
    case 7:
        LZ77UnCompWram(gUnknown_83F0C0C, gUnknown_20399D4->field_0026[2]);
        break;
    case 8:
        LZ77UnCompWram(gUnknown_83F0CF0, gUnknown_20399D4->field_0026[3]);
        break;
    default:
        LZ77UnCompWram(gUnknown_83F19A0, gUnknown_20399D4->field_0026[4]);
        return TRUE;
    }
    gUnknown_20399D4->field_47A8++;
    return FALSE;
}

void sub_80C03E8(void)
{
    CreateTask(gUnknown_20399D4->field_47B8, 0);
    SetMainCallback2(sub_80C08B4);
}

bool32 sub_80C0410(void)
{
    if (sub_80C4164(sub_80C0E20(), 0, sub_80C3514(), sub_80C3508()) == 99)
        return FALSE;
    else
        return TRUE;
}

void sub_80C0450(void)
{
    if (sub_80C0410())
    {
        if ((sub_80C3AC8(0) != 1 && sub_80C3AC8(0) != 0) || (sub_80C3AC8(1) != 1 && sub_80C3AC8(1) != 0))
            PlaySE(SE_Z_SCROLL);
        if (sub_80C3508() == 21 && sub_80C3514() == 11 && sub_80C0E04(0) == TRUE)
            PlaySE(SE_W255);
        else if (sub_80C3508() == 21 && sub_80C3514() == 13)
            PlaySE(SE_W255);
    }
}

void sub_80C04E4(u8 taskId)
{
    switch (gUnknown_20399D4->field_47A0)
    {
    case 0:
        sub_80C4398(sub_80C0E20(), taskId, gUnknown_20399D4->field_47B8);
        sub_80C3008(0, 0);
        sub_80C41D8(1, 1);
        gUnknown_20399D4->field_47A0++;
        break;
    case 1:
        if (gUnknown_20399D4->field_4797[2] == 1)
        {
            sub_80C2208(taskId, gUnknown_20399D4->field_47B8);
        }
        else
        {
            ShowBg(0);
            ShowBg(3);
            ShowBg(1);
            sub_80C4E18(gUnknown_8418EB5);
            sub_80C4E74(gUnknown_8418E8B);
            sub_80C4ED0(FALSE);
            sub_80C4324(0);
            sub_80C3154(0);
            sub_80C48BC(sub_80C0E20(), 25, 0);
            sub_80C4960(sub_80C0E20(), 25, 0);
        }
        gUnknown_20399D4->field_47A0++;
        break;
    case 2:
        if (!gPaletteFade.active && !IsDma3ManagerBusyWithBgCopy())
        {
            sub_80C0B18();
            PutWindowTilemap(0);
            sub_80C0BB0();
            PutWindowTilemap(1);
            gUnknown_20399D4->field_47A0++;
        }
        break;
    case 3:
        switch (sub_80C3400())
        {
        case 1:
            sub_80C3178();
            break;
        case 3:
            sub_80C0B18();
            sub_80C0BB0();
            sub_80C0B9C();
            sub_80C0450();
            if (sub_80C3580() != MAPSEC_NONE)
            {
                if (sub_80C0E04(1) == TRUE)
                {
                    if (sub_80C3AC8(1) == 2)
                    {
                        sub_80C4E74(gUnknown_8418E8D);
                    }
                    else
                    {
                        sub_80C4E74(gUnknown_8418E8B);
                    }
                }
            }
            else
            {
                if (sub_80C3508() == 21 && sub_80C3514() == 11 && sub_80C0E04(0) == TRUE)
                {
                    sub_80C4E74(gUnknown_8418EA7);
                }
                else if (sub_80C3508() == 21 && sub_80C3514() == 13)
                {
                    sub_80C4E74(gUnknown_8418E95);
                }
                else
                {
                    sub_80C4E74(gUnknown_8418E8B);
                }
            }
            break;
        case 4:
            if (sub_80C3AC8(1) == 2 && gUnknown_20399D4->field_4797[1] == 1)
            {
                sub_80C195C(0, taskId, sub_80C07F8);
            }
            break;
        case 5:
            sub_80C0E70(gUnknown_20399D4->field_479B, taskId, sub_80C07F8);
            break;
        case 6:
            gUnknown_20399D4->field_47A0++;
            break;
        }
        break;
    case 4:
        if (sub_80C0E04(2) == 1)
        {
            sub_80C2C1C(taskId);
            // gUnknown_20399D4->field_47A0++;
            goto _080C0798;
        }
        else
        {
            gUnknown_20399D4->field_47A0++;
        }
        break;
    case 5:
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB_BLACK);
    _080C0798:
        gUnknown_20399D4->field_47A0++;
        break;
    default:
        if (!gPaletteFade.active)
        {
            sub_80C0820(taskId);
        }
        break;
    }
}

void sub_80C07D0(TaskFunc taskFunc)
{
    gUnknown_20399D4->field_47B8 = taskFunc;
}

TaskFunc sub_80C07E4(void)
{
    return gUnknown_20399D4->field_47B8;
}

void sub_80C07F8(u8 taskId)
{
    gTasks[taskId].func = gUnknown_20399D4->field_47B8;
}

void sub_80C0820(u8 taskId)
{
    if (sub_80C0E04(2) == TRUE)
        sub_80C25BC();
    sub_80C4A04();
    sub_80C3188();
    sub_80C4348();
    sub_80C4D30();
    DestroyTask(taskId);
    FreeAllWindowBuffers();
    if (gUnknown_20399D4->field_47BC == NULL)
        SetMainCallback2(gMain.savedCallback);
    else
        SetMainCallback2(gUnknown_20399D4->field_47BC);
    if (gUnknown_20399D4 != NULL)
    {
        FREE_AND_SET_NULL(gUnknown_20399D4);
    }
}

void sub_80C0898(void)
{
    if (gUnknown_20399D4 != NULL)
    {
        FREE_AND_SET_NULL(gUnknown_20399D4);
    }
}

void sub_80C08B4(void)
{
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

void sub_80C08CC(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}

void sub_80C08E0(void)
{
    SetVBlankCallback(NULL);
    SetHBlankCallback(NULL);
}

void sub_80C08F4(void)
{
    SetVBlankCallback(sub_80C08CC);
}

void sub_80C0904(void)
{
    DmaFillLarge16(3, 0, (void *)VRAM, VRAM_SIZE, 0x1000);
    DmaFill32Defvars(3, 0, (void *)OAM, OAM_SIZE);
    DmaFill16Defvars(3, 0, (void *)PLTT, PLTT_SIZE);
    SetGpuReg(REG_OFFSET_DISPCNT, 0);
    ResetBgsAndClearDma3BusyFlags(FALSE);
    InitBgsFromTemplates(0, gUnknown_83F1A50, NELEMS(gUnknown_83F1A50));
    ChangeBgX(0, 0, 0);
    ChangeBgY(0, 0, 0);
    ChangeBgX(1, 0, 0);
    ChangeBgY(1, 0, 0);
    ChangeBgX(2, 0, 0);
    ChangeBgY(2, 0, 0);
    ChangeBgX(3, 0, 0);
    ChangeBgY(3, 0, 0);
    InitWindows(gUnknown_83F1A60);
    DeactivateAllTextPrinters();
    SetGpuReg(REG_OFFSET_DISPCNT, DISPCNT_MODE_0 | DISPCNT_OBJ_1D_MAP | DISPCNT_WIN0_ON | DISPCNT_WIN1_ON);
    sub_80C0A2C();
    sub_80C0AB8();
}

void sub_80C0A2C(void)
{
    SetBgTilemapBuffer(0, gUnknown_20399D4->field_1796);
    SetBgTilemapBuffer(1, gUnknown_20399D4->field_2796);
    SetBgTilemapBuffer(2, gUnknown_20399D4->field_3796);
}

void sub_80C0A6C(void)
{
    ResetSpriteData();
    ResetPaletteFade();
    FreeAllSpritePalettes();
    ResetTasks();
    ScanlineEffect_Stop();
}

void sub_80C0A88(u8 mode)
{
    switch (mode)
    {
    case 0:
        ShowBg(0);
        ShowBg(3);
        break;
    case 1:
        HideBg(0);
        HideBg(3);
        break;
    }
}
