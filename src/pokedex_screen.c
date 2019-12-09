#include "global.h"
#include "bg.h"
#include "malloc.h"
#include "palette.h"
#include "graphics.h"
#include "dma3.h"
#include "gpu_regs.h"
#include "m4a.h"
#include "scanline_effect.h"
#include "task.h"
#include "text.h"
#include "window.h"
#include "new_menu_helpers.h"
#include "sound.h"
#include "event_data.h"
#include "help_system.h"
#include "menu_indicators.h"
#include "overworld.h"

struct PokedexScreenData
{
    u8 field_00;
    u8 field_01;
    u8 filler_02[0x6];
    u32 field_08;
    s32 field_0C;
    u16 field_10;
    u16 field_12;
    u8 field_14;
    u8 field_15;
    u8 field_16;
    u8 field_17;
    u8 filler_18[0x10];
    u8 field_28;
    u8 filler_29[0x2];
    u8 field_2B;
    u8 field_2C;
    u8 field_2D;
    u8 field_2E;
    u8 field_2F;
    u8 filler_30[0x8];
    u16 field_38;
    u16 field_3A;
    u8 filler_3C[0x6];
    u8 field_42;
    void * field_44;
    u8 filler_48[0x18];
    u8 field_60;
    u16 field_62;
    u8 filler_64[0x2];
    u16 field_66;
    u16 field_68;
    u16 field_6A;
    u16 field_6C;
};

EWRAM_DATA struct PokedexScreenData * gUnknown_203ACF0 = NULL;

void sub_810287C(u8 taskId);
void sub_8103238(u8 taskId);
void sub_8103AC8(u8 taskId);
void sub_8102C28(void);
void sub_8102F80(u8 taskId);
void sub_81047B0(u8 *a0);
u16 sub_8104BBC(u8 a0, u8 a1);
u8 sub_81068A0(u8 a0);

extern const u32 gUnknown_8440274[];
extern const u32 gUnknown_84403AC[];
extern const u16 gUnknown_84404C8[];
extern const u16 gUnknown_84406E0[];
extern const struct BgTemplate gUnknown_8451EBC[4];
extern const struct WindowTemplate gUnknown_8451ECC[];
extern const struct PokedexScreenData gUnknown_8451EE4;
extern const struct ScrollArrowsTemplate gUnknown_84520D4;
extern const struct ScrollArrowsTemplate gUnknown_84520E4;

void sub_81024C0(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}

void sub_81024D4(void)
{
    if (!gPaletteFade.active || IsDma3ManagerBusyWithBgCopy())
    {
        RunTasks();
        RunTextPrinters();
        AnimateSprites();
        BuildOamBuffer();
    }
    else
    {
        UpdatePaletteFade();
    }
}

void sub_810250C(void)
{
    bool8 natDex;
    u8 taskId;

    natDex = IsNationalPokedexEnabled();
    m4aSoundVSyncOff();
    SetVBlankCallback(NULL);
    ResetPaletteFade();
    ResetSpriteData();
    ResetTasks();
    ScanlineEffect_Stop();
    ResetBgsAndClearDma3BusyFlags(TRUE);
    InitBgsFromTemplates(0, gUnknown_8451EBC, NELEMS(gUnknown_8451EBC));
    SetBgTilemapBuffer(3, Alloc(BG_SCREEN_SIZE));
    SetBgTilemapBuffer(2, Alloc(BG_SCREEN_SIZE));
    SetBgTilemapBuffer(1, Alloc(BG_SCREEN_SIZE));
    SetBgTilemapBuffer(0, Alloc(BG_SCREEN_SIZE));
    if (natDex)
        DecompressAndLoadBgGfxUsingHeap(3, gUnknown_84403AC, BG_SCREEN_SIZE, 0, 0);
    else
        DecompressAndLoadBgGfxUsingHeap(3, gUnknown_8440274, BG_SCREEN_SIZE, 0, 0);
    InitWindows(gUnknown_8451ECC);
    DeactivateAllTextPrinters();
    m4aSoundVSyncOn();
    SetVBlankCallback(sub_81024C0);
    EnableInterrupts(INTR_FLAG_VBLANK);
    taskId = CreateTask(sub_810287C, 0);
    gUnknown_203ACF0 = Alloc(sizeof(*gUnknown_203ACF0));
    *gUnknown_203ACF0 = gUnknown_8451EE4;
    gUnknown_203ACF0->field_00 = taskId;
    gUnknown_203ACF0->field_44 = Alloc(0xC10);
    gUnknown_203ACF0->field_6A = sub_8104BBC(0, 1);
    gUnknown_203ACF0->field_6C = sub_8104BBC(1, 1);
    gUnknown_203ACF0->field_66 = sub_8104BBC(0, 0);
    gUnknown_203ACF0->field_68 = sub_8104BBC(1, 0);
    sub_8072474(0x80);
    ChangeBgX(0, 0, 0);
    ChangeBgY(0, 0, 0);
    ChangeBgX(1, 0, 0);
    ChangeBgY(1, 0, 0);
    ChangeBgX(2, 0, 0);
    ChangeBgY(2, 0, 0);
    ChangeBgX(3, 0, 0);
    ChangeBgY(3, 0, 0);
    gPaletteFade.bufferTransferDisabled = TRUE;
    if (natDex)
        LoadPalette(gUnknown_84406E0, 0, 0x200);
    else
        LoadPalette(gUnknown_84404C8, 0, 0x200);
    FillBgTilemapBufferRect(3, 0x001, 0, 0, 32, 32, 0);
    FillBgTilemapBufferRect(2, 0x000, 0, 0, 32, 32, 0x11);
    FillBgTilemapBufferRect(1, 0x000, 0, 0, 32, 32, 0x11);
    FillBgTilemapBufferRect(0, 0x0003, 0, 0, 32, 2, 0xF);
    FillBgTilemapBufferRect(0, 0x0000, 0, 2, 32, 16, 0x11);
    FillBgTilemapBufferRect(0, 0x003, 0, 18, 32, 2, 0xF);
}

void CB2_OpenPokedexFromStartMenu(void)
{
    sub_810250C();
    ClearGpuRegBits(REG_OFFSET_DISPCNT, DISPCNT_WIN0_ON | DISPCNT_WIN1_ON);
    SetGpuReg(REG_OFFSET_BLDCNT, 0);
    SetGpuReg(REG_OFFSET_BLDALPHA, 0);
    SetGpuReg(REG_OFFSET_BLDY, 0);
    SetMainCallback2(sub_81024D4);
    HelpSystem_SetSomeVariable2(4);
}

#define FREE_IF_NOT_NULL(ptr0) ({ void * ptr = (ptr0); if (ptr) Free(ptr); })

bool8 sub_8102798(void)
{
    switch (gMain.state)
    {
    case 0:
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB_BLACK);
        gMain.state++;
        return FALSE;
    case 1:
        if (!gPaletteFade.active)
            gMain.state = 2;
        else
            UpdatePaletteFade();
        return FALSE;
    case 2:
        FREE_IF_NOT_NULL(gUnknown_203ACF0->field_44);
        FREE_IF_NOT_NULL(gUnknown_203ACF0);
        FreeAllWindowBuffers();
        FREE_IF_NOT_NULL(GetBgTilemapBuffer(0));
        FREE_IF_NOT_NULL(GetBgTilemapBuffer(1));
        FREE_IF_NOT_NULL(GetBgTilemapBuffer(2));
        FREE_IF_NOT_NULL(GetBgTilemapBuffer(3));
        sub_807249C();
        break;
    }
    return TRUE;
}

void sub_8102858(void)
{
    if (sub_8102798())
    {
        SetGpuRegBits(REG_OFFSET_DISPCNT, DISPCNT_WIN0_ON | DISPCNT_WIN1_ON);
        SetMainCallback2(CB2_ReturnToFieldWithOpenMenu);
    }
}

#ifdef NONMATCHING
void sub_810287C(u8 taskId)
{
    int i;
    switch (gUnknown_203ACF0->field_01)
    {
    case 0:
        gUnknown_203ACF0->field_08 = 0;
        for (i = 0; i < 9; i++)
            gUnknown_203ACF0->field_08 |= sub_81068A0(i);
        gUnknown_203ACF0->field_01 = 2;
        break;
    case 1:
        RemoveScrollIndicatorArrowPair(gUnknown_203ACF0->field_60);
        sub_81047B0(&gUnknown_203ACF0->field_14);
        sub_81047B0(&gUnknown_203ACF0->field_15);
        sub_81047B0(&gUnknown_203ACF0->field_16);
        SetMainCallback2(sub_8102858);
        DestroyTask(taskId);
        break;
    case 2:
        sub_8102C28();
        gUnknown_203ACF0->field_01 = 3;
        break;
    case 3:
        CopyBgTilemapBufferToVram(3);
        CopyBgTilemapBufferToVram(2);
        CopyBgTilemapBufferToVram(1);
        CopyBgTilemapBufferToVram(0);
        gUnknown_203ACF0->field_01 = 4;
        break;
    case 4:
        ShowBg(3);
        ShowBg(2);
        ShowBg(1);
        ShowBg(0);
        if (gPaletteFade.bufferTransferDisabled)
        {
            gPaletteFade.bufferTransferDisabled = FALSE;
            BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 0, RGB_WHITEALPHA);
        }
        else
            BeginNormalPaletteFade(0xFFFF7FFF, 0, 16, 0, RGB_WHITEALPHA);
        gUnknown_203ACF0->field_01 = 5;
        break;
    case 5:
        ListMenuGetScrollAndRow(gUnknown_203ACF0->field_17, &gUnknown_203ACF0->field_62, NULL);
        if (IsNationalPokedexEnabled())
            gUnknown_203ACF0->field_60 = AddScrollIndicatorArrowPair(&gUnknown_84520E4, &gUnknown_203ACF0->field_62);
        else
            gUnknown_203ACF0->field_60 = AddScrollIndicatorArrowPair(&gUnknown_84520D4, &gUnknown_203ACF0->field_62);
        gUnknown_203ACF0->field_01 = 6;
        break;
    case 6:
        gUnknown_203ACF0->field_0C = ListMenu_ProcessInput(gUnknown_203ACF0->field_17);
        ListMenuGetScrollAndRow(gUnknown_203ACF0->field_17, &gUnknown_203ACF0->field_62, NULL);
        if (JOY_NEW(A_BUTTON))
        {
            // FIXME: Get this switch to behave
            switch (gUnknown_203ACF0->field_0C)
            {
            case -2:
                gUnknown_203ACF0->field_01 = 1;
                break;
            case -1:
                return;
            case 0:
            case 1:
            case 2:
            case 3:
            case 4:
            case 5:
            case 6:
            case 7:
            case 8:
                if (sub_81068A0(gUnknown_203ACF0->field_0C))
                {
                    RemoveScrollIndicatorArrowPair(gUnknown_203ACF0->field_60);
                    gUnknown_203ACF0->field_28 = gUnknown_203ACF0->field_0C;
                    BeginNormalPaletteFade(0xFFFF7FFF, 0, 0, 16, RGB_WHITEALPHA);
                    gUnknown_203ACF0->field_01 = 7;
                }
                break;
            case 9:
            case 14:
                RemoveScrollIndicatorArrowPair(gUnknown_203ACF0->field_60);
                gUnknown_203ACF0->field_42 = gUnknown_203ACF0->field_0C - 9;
                BeginNormalPaletteFade(0xFFFF7FFF, 0, 0, 16, RGB_WHITEALPHA);
                gUnknown_203ACF0->field_01 = 9;
                break;
            case 10:
            case 11:
            case 12:
            case 13:
                RemoveScrollIndicatorArrowPair(gUnknown_203ACF0->field_60);
                gUnknown_203ACF0->field_42 = gUnknown_203ACF0->field_0C - 9;
                gUnknown_203ACF0->field_38 = gUnknown_203ACF0->field_3A = 0;
                BeginNormalPaletteFade(0xFFFF7FFF, 0, 0, 16, RGB_WHITEALPHA);
                gUnknown_203ACF0->field_01 = 8;
                break;
            }
            break;
        }
        if (JOY_NEW(B_BUTTON))
        {
            gUnknown_203ACF0->field_01 = 1;
        }
        break;
    case 7:
        DestroyListMenuTask(gUnknown_203ACF0->field_17, &gUnknown_203ACF0->field_12, &gUnknown_203ACF0->field_10);
        FillBgTilemapBufferRect_Palette0(1, 0, 0, 0, 32, 20);
        CopyBgTilemapBufferToVram(1);
        sub_81047B0(&gUnknown_203ACF0->field_14);
        sub_81047B0(&gUnknown_203ACF0->field_15);
        sub_81047B0(&gUnknown_203ACF0->field_16);
        gUnknown_203ACF0->field_2B = 0;
        gUnknown_203ACF0->field_2D = 0;
        gUnknown_203ACF0->field_2F = 0;
        gTasks[taskId].func = sub_8103AC8;
        gUnknown_203ACF0->field_01 = 0;
        break;
    case 8:
        DestroyListMenuTask(gUnknown_203ACF0->field_17, &gUnknown_203ACF0->field_12, &gUnknown_203ACF0->field_10);
        HideBg(1);
        sub_81047B0(&gUnknown_203ACF0->field_14);
        sub_81047B0(&gUnknown_203ACF0->field_15);
        sub_81047B0(&gUnknown_203ACF0->field_16);
        gTasks[taskId].func = sub_8103238;
        gUnknown_203ACF0->field_01 = 0;
        break;
    case 9:
        DestroyListMenuTask(gUnknown_203ACF0->field_17, &gUnknown_203ACF0->field_12, &gUnknown_203ACF0->field_10);
        HideBg(1);
        sub_81047B0(&gUnknown_203ACF0->field_14);
        sub_81047B0(&gUnknown_203ACF0->field_15);
        sub_81047B0(&gUnknown_203ACF0->field_16);
        gTasks[taskId].func = sub_8102F80;
        gUnknown_203ACF0->field_01 = 0;
        break;
    }
}
#else
NAKED
void sub_810287C(u8 taskId)
{
    asm_unified("\tpush {r4,r5,lr}\n"
                "\tsub sp, 0x8\n"
                "\tlsls r0, 24\n"
                "\tlsrs r5, r0, 24\n"
                "\tldr r1, _0810289C @ =gUnknown_203ACF0\n"
                "\tldr r0, [r1]\n"
                "\tldrb r0, [r0, 0x1]\n"
                "\tadds r4, r1, 0\n"
                "\tcmp r0, 0x9\n"
                "\tbls _08102892\n"
                "\tb _08102C18\n"
                "_08102892:\n"
                "\tlsls r0, 2\n"
                "\tldr r1, _081028A0 @ =_081028A4\n"
                "\tadds r0, r1\n"
                "\tldr r0, [r0]\n"
                "\tmov pc, r0\n"
                "\t.align 2, 0\n"
                "_0810289C: .4byte gUnknown_203ACF0\n"
                "_081028A0: .4byte _081028A4\n"
                "\t.align 2, 0\n"
                "_081028A4:\n"
                "\t.4byte _081028CC\n"
                "\t.4byte _081028FC\n"
                "\t.4byte _08102930\n"
                "\t.4byte _08102940\n"
                "\t.4byte _08102964\n"
                "\t.4byte _081029D0\n"
                "\t.4byte _08102A14\n"
                "\t.4byte _08102B24\n"
                "\t.4byte _08102B94\n"
                "\t.4byte _08102BD8\n"
                "_081028CC:\n"
                "\tldr r1, [r4]\n"
                "\tmovs r0, 0\n"
                "\tstr r0, [r1, 0x8]\n"
                "\tmovs r4, 0\n"
                "_081028D4:\n"
                "\tlsls r0, r4, 24\n"
                "\tlsrs r0, 24\n"
                "\tbl sub_81068A0\n"
                "\tldr r1, _081028F8 @ =gUnknown_203ACF0\n"
                "\tldr r2, [r1]\n"
                "\tlsls r0, 24\n"
                "\tlsrs r0, 24\n"
                "\tlsls r0, r4\n"
                "\tldr r1, [r2, 0x8]\n"
                "\torrs r1, r0\n"
                "\tstr r1, [r2, 0x8]\n"
                "\tadds r4, 0x1\n"
                "\tcmp r4, 0x8\n"
                "\tble _081028D4\n"
                "\tmovs r0, 0x2\n"
                "\tstrb r0, [r2, 0x1]\n"
                "\tb _08102C18\n"
                "\t.align 2, 0\n"
                "_081028F8: .4byte gUnknown_203ACF0\n"
                "_081028FC:\n"
                "\tldr r0, [r4]\n"
                "\tadds r0, 0x60\n"
                "\tldrb r0, [r0]\n"
                "\tbl RemoveScrollIndicatorArrowPair\n"
                "\tldr r0, [r4]\n"
                "\tadds r0, 0x14\n"
                "\tbl sub_81047B0\n"
                "\tldr r0, [r4]\n"
                "\tadds r0, 0x15\n"
                "\tbl sub_81047B0\n"
                "\tldr r0, [r4]\n"
                "\tadds r0, 0x16\n"
                "\tbl sub_81047B0\n"
                "\tldr r0, _0810292C @ =sub_8102858\n"
                "\tbl SetMainCallback2\n"
                "\tadds r0, r5, 0\n"
                "\tbl DestroyTask\n"
                "\tb _08102C18\n"
                "\t.align 2, 0\n"
                "_0810292C: .4byte sub_8102858\n"
                "_08102930:\n"
                "\tbl sub_8102C28\n"
                "\tldr r0, _0810293C @ =gUnknown_203ACF0\n"
                "\tldr r1, [r0]\n"
                "\tmovs r0, 0x3\n"
                "\tb _08102C16\n"
                "\t.align 2, 0\n"
                "_0810293C: .4byte gUnknown_203ACF0\n"
                "_08102940:\n"
                "\tmovs r0, 0x3\n"
                "\tbl CopyBgTilemapBufferToVram\n"
                "\tmovs r0, 0x2\n"
                "\tbl CopyBgTilemapBufferToVram\n"
                "\tmovs r0, 0x1\n"
                "\tbl CopyBgTilemapBufferToVram\n"
                "\tmovs r0, 0\n"
                "\tbl CopyBgTilemapBufferToVram\n"
                "\tldr r0, _08102960 @ =gUnknown_203ACF0\n"
                "\tldr r1, [r0]\n"
                "\tmovs r0, 0x4\n"
                "\tb _08102C16\n"
                "\t.align 2, 0\n"
                "_08102960: .4byte gUnknown_203ACF0\n"
                "_08102964:\n"
                "\tmovs r0, 0x3\n"
                "\tbl ShowBg\n"
                "\tmovs r0, 0x2\n"
                "\tbl ShowBg\n"
                "\tmovs r0, 0x1\n"
                "\tbl ShowBg\n"
                "\tmovs r0, 0\n"
                "\tbl ShowBg\n"
                "\tldr r2, _081029A4 @ =gPaletteFade\n"
                "\tldrb r1, [r2, 0x8]\n"
                "\tmovs r0, 0x80\n"
                "\tands r0, r1\n"
                "\tcmp r0, 0\n"
                "\tbeq _081029AC\n"
                "\tmovs r0, 0x7F\n"
                "\tands r0, r1\n"
                "\tstrb r0, [r2, 0x8]\n"
                "\tmovs r0, 0x1\n"
                "\tnegs r0, r0\n"
                "\tldr r1, _081029A8 @ =0x0000ffff\n"
                "\tstr r1, [sp]\n"
                "\tmovs r1, 0\n"
                "\tmovs r2, 0\n"
                "\tmovs r3, 0\n"
                "\tbl BeginNormalPaletteFade\n"
                "\tb _081029BC\n"
                "\t.align 2, 0\n"
                "_081029A4: .4byte gPaletteFade\n"
                "_081029A8: .4byte 0x0000ffff\n"
                "_081029AC:\n"
                "\tldr r0, _081029C4 @ =0xffff7fff\n"
                "\tldr r1, _081029C8 @ =0x0000ffff\n"
                "\tstr r1, [sp]\n"
                "\tmovs r1, 0\n"
                "\tmovs r2, 0x10\n"
                "\tmovs r3, 0\n"
                "\tbl BeginNormalPaletteFade\n"
                "_081029BC:\n"
                "\tldr r0, _081029CC @ =gUnknown_203ACF0\n"
                "\tldr r1, [r0]\n"
                "\tmovs r0, 0x5\n"
                "\tb _08102C16\n"
                "\t.align 2, 0\n"
                "_081029C4: .4byte 0xffff7fff\n"
                "_081029C8: .4byte 0x0000ffff\n"
                "_081029CC: .4byte gUnknown_203ACF0\n"
                "_081029D0:\n"
                "\tldr r4, _081029EC @ =gUnknown_203ACF0\n"
                "\tldr r1, [r4]\n"
                "\tldrb r0, [r1, 0x17]\n"
                "\tadds r1, 0x62\n"
                "\tmovs r2, 0\n"
                "\tbl ListMenuGetScrollAndRow\n"
                "\tbl IsNationalPokedexEnabled\n"
                "\tcmp r0, 0\n"
                "\tbeq _081029F4\n"
                "\tldr r0, _081029F0 @ =gUnknown_84520E4\n"
                "\tb _081029F6\n"
                "\t.align 2, 0\n"
                "_081029EC: .4byte gUnknown_203ACF0\n"
                "_081029F0: .4byte gUnknown_84520E4\n"
                "_081029F4:\n"
                "\tldr r0, _08102A0C @ =gUnknown_84520D4\n"
                "_081029F6:\n"
                "\tldr r1, [r4]\n"
                "\tadds r1, 0x62\n"
                "\tbl AddScrollIndicatorArrowPair\n"
                "\tldr r1, [r4]\n"
                "\tadds r1, 0x60\n"
                "\tstrb r0, [r1]\n"
                "\tldr r0, _08102A10 @ =gUnknown_203ACF0\n"
                "\tldr r1, [r0]\n"
                "\tmovs r0, 0x6\n"
                "\tb _08102C16\n"
                "\t.align 2, 0\n"
                "_08102A0C: .4byte gUnknown_84520D4\n"
                "_08102A10: .4byte gUnknown_203ACF0\n"
                "_08102A14:\n"
                "\tldr r0, [r4]\n"
                "\tldrb r0, [r0, 0x17]\n"
                "\tbl ListMenu_ProcessInput\n"
                "\tldr r1, [r4]\n"
                "\tstr r0, [r1, 0xC]\n"
                "\tldrb r0, [r1, 0x17]\n"
                "\tadds r1, 0x62\n"
                "\tmovs r2, 0\n"
                "\tbl ListMenuGetScrollAndRow\n"
                "\tldr r0, _08102A4C @ =gMain\n"
                "\tldrh r1, [r0, 0x2E]\n"
                "\tmovs r3, 0x1\n"
                "\tmovs r0, 0x1\n"
                "\tands r0, r1\n"
                "\tcmp r0, 0\n"
                "\tbeq _08102B14\n"
                "\tldr r2, [r4]\n"
                "\tldr r1, [r2, 0xC]\n"
                "\tcmp r1, 0xD\n"
                "\tbhi _08102A50\n"
                "\tcmp r1, 0xA\n"
                "\tbcs _08102ADC\n"
                "\tcmp r1, 0x8\n"
                "\tbls _08102A62\n"
                "\tb _08102AA4\n"
                "\t.align 2, 0\n"
                "_08102A4C: .4byte gMain\n"
                "_08102A50:\n"
                "\tcmp r1, 0xE\n"
                "\tbeq _08102AA4\n"
                "\tmovs r0, 0x2\n"
                "\tnegs r0, r0\n"
                "\tcmp r1, r0\n"
                "\tbeq _08102A5E\n"
                "\tb _08102C18\n"
                "_08102A5E:\n"
                "\tstrb r3, [r2, 0x1]\n"
                "\tb _08102C18\n"
                "_08102A62:\n"
                "\tlsls r0, r1, 24\n"
                "\tlsrs r0, 24\n"
                "\tbl sub_81068A0\n"
                "\tlsls r0, 24\n"
                "\tcmp r0, 0\n"
                "\tbne _08102A72\n"
                "\tb _08102C18\n"
                "_08102A72:\n"
                "\tldr r0, [r4]\n"
                "\tadds r0, 0x60\n"
                "\tldrb r0, [r0]\n"
                "\tbl RemoveScrollIndicatorArrowPair\n"
                "\tldr r0, [r4]\n"
                "\tldr r1, [r0, 0xC]\n"
                "\tadds r0, 0x28\n"
                "\tstrb r1, [r0]\n"
                "\tldr r0, _08102A9C @ =0xffff7fff\n"
                "\tldr r1, _08102AA0 @ =0x0000ffff\n"
                "\tstr r1, [sp]\n"
                "\tmovs r1, 0\n"
                "\tmovs r2, 0\n"
                "\tmovs r3, 0x10\n"
                "\tbl BeginNormalPaletteFade\n"
                "\tldr r1, [r4]\n"
                "\tmovs r0, 0x7\n"
                "\tb _08102C16\n"
                "\t.align 2, 0\n"
                "_08102A9C: .4byte 0xffff7fff\n"
                "_08102AA0: .4byte 0x0000ffff\n"
                "_08102AA4:\n"
                "\tldr r4, _08102AD0 @ =gUnknown_203ACF0\n"
                "\tldr r0, [r4]\n"
                "\tadds r0, 0x60\n"
                "\tldrb r0, [r0]\n"
                "\tbl RemoveScrollIndicatorArrowPair\n"
                "\tldr r1, [r4]\n"
                "\tldr r0, [r1, 0xC]\n"
                "\tsubs r0, 0x9\n"
                "\tadds r1, 0x42\n"
                "\tstrb r0, [r1]\n"
                "\tldr r0, _08102AD4 @ =0xffff7fff\n"
                "\tldr r1, _08102AD8 @ =0x0000ffff\n"
                "\tstr r1, [sp]\n"
                "\tmovs r1, 0\n"
                "\tmovs r2, 0\n"
                "\tmovs r3, 0x10\n"
                "\tbl BeginNormalPaletteFade\n"
                "\tldr r1, [r4]\n"
                "\tmovs r0, 0x9\n"
                "\tb _08102C16\n"
                "\t.align 2, 0\n"
                "_08102AD0: .4byte gUnknown_203ACF0\n"
                "_08102AD4: .4byte 0xffff7fff\n"
                "_08102AD8: .4byte 0x0000ffff\n"
                "_08102ADC:\n"
                "\tadds r0, r2, 0\n"
                "\tadds r0, 0x60\n"
                "\tldrb r0, [r0]\n"
                "\tbl RemoveScrollIndicatorArrowPair\n"
                "\tldr r0, [r4]\n"
                "\tldr r1, [r0, 0xC]\n"
                "\tsubs r1, 0x9\n"
                "\tadds r0, 0x42\n"
                "\tmovs r2, 0\n"
                "\tstrb r1, [r0]\n"
                "\tldr r0, [r4]\n"
                "\tstrh r2, [r0, 0x3A]\n"
                "\tstrh r2, [r0, 0x38]\n"
                "\tldr r0, _08102B0C @ =0xffff7fff\n"
                "\tldr r1, _08102B10 @ =0x0000ffff\n"
                "\tstr r1, [sp]\n"
                "\tmovs r1, 0\n"
                "\tmovs r3, 0x10\n"
                "\tbl BeginNormalPaletteFade\n"
                "\tldr r1, [r4]\n"
                "\tmovs r0, 0x8\n"
                "\tb _08102C16\n"
                "\t.align 2, 0\n"
                "_08102B0C: .4byte 0xffff7fff\n"
                "_08102B10: .4byte 0x0000ffff\n"
                "_08102B14:\n"
                "\tmovs r0, 0x2\n"
                "\tands r0, r1\n"
                "\tcmp r0, 0\n"
                "\tbne _08102B1E\n"
                "\tb _08102C18\n"
                "_08102B1E:\n"
                "\tldr r0, [r4]\n"
                "\tstrb r3, [r0, 0x1]\n"
                "\tb _08102C18\n"
                "_08102B24:\n"
                "\tldr r2, [r4]\n"
                "\tldrb r0, [r2, 0x17]\n"
                "\tadds r1, r2, 0\n"
                "\tadds r1, 0x12\n"
                "\tadds r2, 0x10\n"
                "\tbl DestroyListMenuTask\n"
                "\tmovs r0, 0x20\n"
                "\tstr r0, [sp]\n"
                "\tmovs r0, 0x14\n"
                "\tstr r0, [sp, 0x4]\n"
                "\tmovs r0, 0x1\n"
                "\tmovs r1, 0\n"
                "\tmovs r2, 0\n"
                "\tmovs r3, 0\n"
                "\tbl FillBgTilemapBufferRect_Palette0\n"
                "\tmovs r0, 0x1\n"
                "\tbl CopyBgTilemapBufferToVram\n"
                "\tldr r0, [r4]\n"
                "\tadds r0, 0x14\n"
                "\tbl sub_81047B0\n"
                "\tldr r0, [r4]\n"
                "\tadds r0, 0x15\n"
                "\tbl sub_81047B0\n"
                "\tldr r0, [r4]\n"
                "\tadds r0, 0x16\n"
                "\tbl sub_81047B0\n"
                "\tldr r0, [r4]\n"
                "\tadds r0, 0x2B\n"
                "\tmovs r2, 0\n"
                "\tstrb r2, [r0]\n"
                "\tldr r0, [r4]\n"
                "\tadds r0, 0x2D\n"
                "\tstrb r2, [r0]\n"
                "\tldr r0, [r4]\n"
                "\tadds r0, 0x2F\n"
                "\tstrb r2, [r0]\n"
                "\tldr r1, _08102B8C @ =gTasks\n"
                "\tlsls r0, r5, 2\n"
                "\tadds r0, r5\n"
                "\tlsls r0, 3\n"
                "\tadds r0, r1\n"
                "\tldr r1, _08102B90 @ =sub_8103AC8\n"
                "\tstr r1, [r0]\n"
                "\tldr r0, [r4]\n"
                "\tstrb r2, [r0, 0x1]\n"
                "\tb _08102C18\n"
                "\t.align 2, 0\n"
                "_08102B8C: .4byte gTasks\n"
                "_08102B90: .4byte sub_8103AC8\n"
                "_08102B94:\n"
                "\tldr r2, [r4]\n"
                "\tldrb r0, [r2, 0x17]\n"
                "\tadds r1, r2, 0\n"
                "\tadds r1, 0x12\n"
                "\tadds r2, 0x10\n"
                "\tbl DestroyListMenuTask\n"
                "\tmovs r0, 0x1\n"
                "\tbl HideBg\n"
                "\tldr r0, [r4]\n"
                "\tadds r0, 0x14\n"
                "\tbl sub_81047B0\n"
                "\tldr r0, [r4]\n"
                "\tadds r0, 0x15\n"
                "\tbl sub_81047B0\n"
                "\tldr r0, [r4]\n"
                "\tadds r0, 0x16\n"
                "\tbl sub_81047B0\n"
                "\tldr r1, _08102BD0 @ =gTasks\n"
                "\tlsls r0, r5, 2\n"
                "\tadds r0, r5\n"
                "\tlsls r0, 3\n"
                "\tadds r0, r1\n"
                "\tldr r1, _08102BD4 @ =sub_8103238\n"
                "\tb _08102C10\n"
                "\t.align 2, 0\n"
                "_08102BD0: .4byte gTasks\n"
                "_08102BD4: .4byte sub_8103238\n"
                "_08102BD8:\n"
                "\tldr r2, [r4]\n"
                "\tldrb r0, [r2, 0x17]\n"
                "\tadds r1, r2, 0\n"
                "\tadds r1, 0x12\n"
                "\tadds r2, 0x10\n"
                "\tbl DestroyListMenuTask\n"
                "\tmovs r0, 0x1\n"
                "\tbl HideBg\n"
                "\tldr r0, [r4]\n"
                "\tadds r0, 0x14\n"
                "\tbl sub_81047B0\n"
                "\tldr r0, [r4]\n"
                "\tadds r0, 0x15\n"
                "\tbl sub_81047B0\n"
                "\tldr r0, [r4]\n"
                "\tadds r0, 0x16\n"
                "\tbl sub_81047B0\n"
                "\tldr r1, _08102C20 @ =gTasks\n"
                "\tlsls r0, r5, 2\n"
                "\tadds r0, r5\n"
                "\tlsls r0, 3\n"
                "\tadds r0, r1\n"
                "\tldr r1, _08102C24 @ =sub_8102F80\n"
                "_08102C10:\n"
                "\tstr r1, [r0]\n"
                "\tldr r1, [r4]\n"
                "\tmovs r0, 0\n"
                "_08102C16:\n"
                "\tstrb r0, [r1, 0x1]\n"
                "_08102C18:\n"
                "\tadd sp, 0x8\n"
                "\tpop {r4,r5}\n"
                "\tpop {r0}\n"
                "\tbx r0\n"
                "\t.align 2, 0\n"
                "_08102C20: .4byte gTasks\n"
                "_08102C24: .4byte sub_8102F80");
}
#endif //NONMATCHING
