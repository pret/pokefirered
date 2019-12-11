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
#include "strings.h"
#include "menu.h"
#include "pokedex_screen.h"
#include "data.h"
#include "pokedex.h"
#include "constants/songs.h"
#include "constants/species.h"

struct PokedexScreenData
{
    u8 field_00;
    u8 field_01;
    u8 field_02;
    u8 field_03;
    u8 filler_04[0x4];
    u32 field_08;
    u32 field_0C;
    u16 field_10;
    u16 field_12;
    u8 field_14;
    u8 field_15;
    u8 field_16;
    u8 field_17;
    u16 field_18[0x8];
    u8 field_28;
    u8 field_29;
    u8 field_2A;
    u8 field_2B;
    u8 field_2C;
    u8 field_2D;
    u8 field_2E;
    u8 field_2F;
    u32 field_30;
    u16 field_34;
    u16 field_36;
    u16 field_38;
    u16 field_3A;
    u16 field_3C;
    u16 field_3E;
    u8 field_40;
    u8 field_41;
    u8 field_42;
    struct ListMenuItem * field_44;
    u16 field_48;
    u8 filler_4A[0x10];
    u16 field_5A;
    u8 filler_5C[0x4];
    u8 field_60;
    u8 field_61;
    u16 field_62;
    u8 filler_64[0x2];
    u16 field_66;
    u16 field_68;
    u16 field_6A;
    u16 field_6C;
};

struct PokedexScreenWindowGfx
{
    const u16 *map;
    const u16 *pal;
};

EWRAM_DATA struct PokedexScreenData * gUnknown_203ACF0 = NULL;

void sub_810287C(u8 taskId);
void sub_8102C28(void);
void sub_8102F80(u8 taskId);
void sub_810317C(void);
void sub_8103238(u8 taskId);
void sub_810345C(void);
u16 sub_8103518(u8 a0);
void sub_8103924(const struct ListMenuTemplate * a0, u8 a1);
u8 sub_81039F0(void);
void sub_8103988(u8 a0);
void sub_8103AC8(u8 taskId);
int sub_8104284(void);
u8 sub_8104234(void);
void sub_81042EC(u8 taskId);
void sub_81047B0(u8 *a0);
void sub_81047C8(u8 a0, u8 a1, const u8 *a2, u8 a3, u8 a4, u8 a5);
void sub_810491C(u8 a0, u8 a1, u16 a2, u8 a3, u8 a4, u8 a5);
void sub_8104A34(u8 windowId, u8 a1, u16 species, u8 a3, u8 y);
u16 sub_8104BBC(u8 a0, u8 a1);
void sub_8104C2C(const u8 *a0);
void sub_8104E90(void);
void sub_8104F0C(u8 a0);
void sub_8105058(u8 a0);
void sub_8105178(u8 a0, u8 a1, u8 a2);
bool8 sub_81052D0(u8 a0);
void sub_8105594(u8 a0, u8 a1);
void sub_8105E1C(u8 a0);
void sub_8106014(void);
void sub_810603C(void);
bool8 sub_8106838(u8 a0, u8 a1);
u8 sub_81068A0(u8 a0);
void sub_810699C(u8 a0);
bool8 sub_8106A20(u16 a0);
void sub_81067C0(void);
void sub_8106B34(void);
void sub_8106E78(const u8 *a0, s32 a1);

extern const u32 gUnknown_8440274[];
extern const u32 gUnknown_84403AC[];
extern const u16 gUnknown_84404C8[];
extern const u16 gUnknown_84406E0[];
extern const u16 gUnknown_8440EF0[];
extern const u16 gUnknown_8443460[];
extern const u16 gUnknown_8443FC0[];
extern const u16 gUnknown_84442F6[];
extern const u16 gUnknown_84448FE[];
extern const u16 gUnknown_84445FA[];
extern const struct BgTemplate gUnknown_8451EBC[4];
extern const struct WindowTemplate gUnknown_8451ECC[];
extern const struct PokedexScreenData gUnknown_8451EE4;
extern const struct WindowTemplate gUnknown_8451F54;
extern const struct WindowTemplate gUnknown_8451F5C;
extern const struct WindowTemplate gUnknown_8451F64;
extern const struct WindowTemplate gUnknown_845216C;
extern const struct ListMenuTemplate gUnknown_8452174;
extern const struct ListMenuTemplate gUnknown_8452004;
extern const struct ListMenuTemplate gUnknown_84520BC;
extern const struct ScrollArrowsTemplate gUnknown_84520D4;
extern const struct ScrollArrowsTemplate gUnknown_84520E4;
extern const struct PokedexScreenWindowGfx gUnknown_84520F4[];
extern const struct ListMenuWindowRect gUnknown_845218C;
extern const struct ScrollArrowsTemplate gUnknown_84521B4;
extern const struct CursorStruct gUnknown_84524C4;

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
    gUnknown_203ACF0->field_44 = Alloc(386 * sizeof(struct ListMenuItem));
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

void sub_810287C(u8 taskId)
{
    int i;
    switch (gUnknown_203ACF0->field_01)
    {
    case 0:
        gUnknown_203ACF0->field_08 = 0;
        for (i = 0; i < 9; i++)
            gUnknown_203ACF0->field_08 |= (sub_81068A0(i) << i);
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
            case LIST_CANCEL:
                gUnknown_203ACF0->field_01 = 1;
                break;
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

void sub_8102C28(void)
{
    struct ListMenuTemplate listMenuTemplate;
    FillBgTilemapBufferRect(3, 0x00E, 0, 0, 30, 20, 0x00);
    FillBgTilemapBufferRect(2, 0x000, 0, 0, 30, 20, 0x11);
    FillBgTilemapBufferRect(1, 0x000, 0, 0, 30, 20, 0x11);
    gUnknown_203ACF0->field_14 = AddWindow(&gUnknown_8451F54);
    gUnknown_203ACF0->field_15 = AddWindow(&gUnknown_8451F5C);
    gUnknown_203ACF0->field_16 = AddWindow(&gUnknown_8451F64);
    if (IsNationalPokedexEnabled())
    {
        listMenuTemplate = gUnknown_84520BC;
        listMenuTemplate.windowId = gUnknown_203ACF0->field_14;
        gUnknown_203ACF0->field_17 = ListMenuInit(&listMenuTemplate, gUnknown_203ACF0->field_12, gUnknown_203ACF0->field_10);
        FillWindowPixelBuffer(gUnknown_203ACF0->field_16, PIXEL_FILL(0));
        sub_81047C8(gUnknown_203ACF0->field_16, 0, gUnknown_8415DC4, 0, 2, 0);
        sub_81047C8(gUnknown_203ACF0->field_16, 0, gUnknown_8415DD1, 8, 13, 0);
        sub_810491C(gUnknown_203ACF0->field_16, 0, gUnknown_203ACF0->field_66, 52, 13, 2);
        sub_81047C8(gUnknown_203ACF0->field_16, 0, gUnknown_8415DD7, 8, 24, 0);
        sub_810491C(gUnknown_203ACF0->field_16, 0, gUnknown_203ACF0->field_6A, 52, 24, 2);
        sub_81047C8(gUnknown_203ACF0->field_16, 0, gUnknown_8415DCA, 0, 37, 0);
        sub_81047C8(gUnknown_203ACF0->field_16, 0, gUnknown_8415DD1, 8, 48, 0);
        sub_810491C(gUnknown_203ACF0->field_16, 0, gUnknown_203ACF0->field_68, 52, 48, 2);
        sub_81047C8(gUnknown_203ACF0->field_16, 0, gUnknown_8415DD7, 8, 59, 0);
        sub_810491C(gUnknown_203ACF0->field_16, 0, gUnknown_203ACF0->field_6C, 52, 59, 2);
    }
    else
    {
        listMenuTemplate = gUnknown_8452004;
        listMenuTemplate.windowId = gUnknown_203ACF0->field_14;
        gUnknown_203ACF0->field_17 = ListMenuInit(&listMenuTemplate, gUnknown_203ACF0->field_12, gUnknown_203ACF0->field_10);
        FillWindowPixelBuffer(gUnknown_203ACF0->field_16, PIXEL_FILL(0));
        sub_81047C8(gUnknown_203ACF0->field_16, 1, gUnknown_8415DC4, 0, 9, 0);
        sub_810491C(gUnknown_203ACF0->field_16, 1, gUnknown_203ACF0->field_66, 32, 21, 2);
        sub_81047C8(gUnknown_203ACF0->field_16, 1, gUnknown_8415DCA, 0, 37, 0);
        sub_810491C(gUnknown_203ACF0->field_16, 1, gUnknown_203ACF0->field_68, 32, 49, 2);
    }
    FillWindowPixelBuffer(0, PIXEL_FILL(15));
    sub_8106E78(gUnknown_8415D9C, 1);
    FillWindowPixelBuffer(1, PIXEL_FILL(15));
    sub_8104C2C(gUnknown_8415DB8);
    PutWindowTilemap(0);
    CopyWindowToVram(0, 2);
    PutWindowTilemap(1);
    CopyWindowToVram(1, 2);
    PutWindowTilemap(gUnknown_203ACF0->field_16);
    CopyWindowToVram(gUnknown_203ACF0->field_16, 2);
}

void sub_8102EC0(s32 itemIndex, bool8 onInit, struct ListMenu *list)
{
    if (!onInit)
        PlaySE(SE_SELECT);
    if (itemIndex == LIST_CANCEL)
    {
        CopyToWindowPixelBuffer(gUnknown_203ACF0->field_15, gUnknown_8440EF0, 0x000, 0x000);
        LoadPalette(gUnknown_8443460, 0x10, 0x20);
    }
    else
    {
        CopyToWindowPixelBuffer(gUnknown_203ACF0->field_15, gUnknown_84520F4[itemIndex].map, 0x000, 0x000);
        LoadPalette(gUnknown_84520F4[itemIndex].pal, 0x10, 0x20);
    }
    PutWindowTilemap(gUnknown_203ACF0->field_15);
    CopyWindowToVram(gUnknown_203ACF0->field_15, 2);
}

void sub_8102F48(u8 windowId, s32 itemId, u8 y)
{
    if (itemId < 0 || itemId > 8 || gUnknown_203ACF0->field_08 & (1 << itemId))
        ListMenuOverrideSetColors(1, 0, 3);
    else
        ListMenuOverrideSetColors(10, 0, 11);
}

void sub_8102F80(u8 taskId)
{
    switch (gUnknown_203ACF0->field_01)
    {
    case 0:
        sub_8107D38(0x10, 0);
        sub_8107D38(0x20, 1);
        gUnknown_203ACF0->field_48 = sub_8103518(gUnknown_203ACF0->field_42);
        gUnknown_203ACF0->field_01 = 2;
        break;
    case 1:
        sub_8103988(gUnknown_203ACF0->field_42);
        HideBg(1);
        sub_81047B0(&gUnknown_203ACF0->field_40);
        gTasks[taskId].func = sub_810287C;
        gUnknown_203ACF0->field_01 = 0;
        break;
    case 2:
        sub_810317C();
        gUnknown_203ACF0->field_01 = 3;
        break;
    case 3:
        CopyBgTilemapBufferToVram(3);
        CopyBgTilemapBufferToVram(1);
        gUnknown_203ACF0->field_01 = 4;
        break;
    case 4:
        ShowBg(1);
        BeginNormalPaletteFade(0xFFFF7FFF, 0, 16, 0, RGB_WHITEALPHA);
        gUnknown_203ACF0->field_01 = 5;
        break;
    case 5:
        ListMenuGetScrollAndRow(gUnknown_203ACF0->field_17, &gUnknown_203ACF0->field_62, NULL);
        gUnknown_203ACF0->field_60 = sub_81039F0();
        gUnknown_203ACF0->field_01 = 6;
        break;
    case 6:
        gUnknown_203ACF0->field_30 = ListMenu_ProcessInput(gUnknown_203ACF0->field_41);
        ListMenuGetScrollAndRow(gUnknown_203ACF0->field_17, &gUnknown_203ACF0->field_62, NULL);
        if (JOY_NEW(A_BUTTON))
        {
            if ((gUnknown_203ACF0->field_30 >> 16) & 1)
            {
                gUnknown_203ACF0->field_5A = gUnknown_203ACF0->field_30;
                RemoveScrollIndicatorArrowPair(gUnknown_203ACF0->field_60);
                BeginNormalPaletteFade(0xFFFF7FFF, 0, 0, 16, RGB_WHITEALPHA);
                gUnknown_203ACF0->field_01 = 7;
            }
        }
        else if (JOY_NEW(B_BUTTON))
        {
            RemoveScrollIndicatorArrowPair(gUnknown_203ACF0->field_60);
            BeginNormalPaletteFade(0xFFFF7FFF, 0, 0, 16, RGB_WHITEALPHA);
            gUnknown_203ACF0->field_01 = 1;
        }
        break;
    case 7:
        sub_8103988(gUnknown_203ACF0->field_42);
        FillBgTilemapBufferRect_Palette0(1, 0x000, 0, 0, 32, 20);
        CopyBgTilemapBufferToVram(1);
        sub_81047B0(&gUnknown_203ACF0->field_40);
        gTasks[taskId].func = sub_81042EC;
        gUnknown_203ACF0->field_01 = 0;
        break;
    }
}

void sub_810317C(void)
{
    struct ListMenuTemplate template;
    FillBgTilemapBufferRect(3, 0x00E, 0, 0, 30, 20, 0x00);
    FillBgTilemapBufferRect(1, 0x000, 0, 0, 32, 32, 0x11);
    gUnknown_203ACF0->field_40 = AddWindow(&gUnknown_845216C);
    template = gUnknown_8452174;
    template.items = gUnknown_203ACF0->field_44;
    template.windowId = gUnknown_203ACF0->field_40;
    template.totalItems = gUnknown_203ACF0->field_48;
    sub_8103924(&template, gUnknown_203ACF0->field_42);
    FillWindowPixelBuffer(0, PIXEL_FILL(15));
    sub_8106E78(gUnknown_8415F3D, 1);
    FillWindowPixelBuffer(1, PIXEL_FILL(15));
    sub_8104C2C(gText_PickOKExit);
    CopyWindowToVram(0, 2);
    CopyWindowToVram(1, 2);
}

void sub_8103238(u8 taskId)
{
    switch (gUnknown_203ACF0->field_01)
    {
    case 0:
        sub_8107D38(0x10, 0);
        sub_8107D38(0x20, 1);
        gUnknown_203ACF0->field_48 = sub_8103518(gUnknown_203ACF0->field_42);
        gUnknown_203ACF0->field_01 = 2;
        break;
    case 1:
        sub_8103988(gUnknown_203ACF0->field_42);
        HideBg(1);
        sub_81047B0(&gUnknown_203ACF0->field_40);
        gTasks[taskId].func = sub_810287C;
        gUnknown_203ACF0->field_01 = 0;
        break;
    case 2:
        sub_810345C();
        gUnknown_203ACF0->field_01 = 3;
        break;
    case 3:
        CopyBgTilemapBufferToVram(3);
        CopyBgTilemapBufferToVram(1);
        gUnknown_203ACF0->field_01 = 4;
        break;
    case 4:
        ShowBg(1);
        BeginNormalPaletteFade(0xFFFF7FFF, 0, 16, 0, RGB_WHITEALPHA);
        gUnknown_203ACF0->field_01 = 5;
        break;
    case 5:
        ListMenuGetScrollAndRow(gUnknown_203ACF0->field_17, &gUnknown_203ACF0->field_62, NULL);
        gUnknown_203ACF0->field_60 = sub_81039F0();
        gUnknown_203ACF0->field_01 = 6;
        break;
    case 6:
        gUnknown_203ACF0->field_30 = ListMenu_ProcessInput(gUnknown_203ACF0->field_41);
        ListMenuGetScrollAndRow(gUnknown_203ACF0->field_17, &gUnknown_203ACF0->field_62, NULL);
        if (JOY_NEW(A_BUTTON))
        {
            if (((gUnknown_203ACF0->field_30 >> 16) & 1) && !sub_8106A20(gUnknown_203ACF0->field_30))
            {
                RemoveScrollIndicatorArrowPair(gUnknown_203ACF0->field_60);
                BeginNormalPaletteFade(0xFFFF7FFF, 0, 0, 16, RGB_WHITEALPHA);
                gUnknown_203ACF0->field_01 = 7;
            }
        }
        else if (JOY_NEW(B_BUTTON))
        {
            RemoveScrollIndicatorArrowPair(gUnknown_203ACF0->field_60);
            BeginNormalPaletteFade(0xFFFF7FFF, 0, 0, 16, RGB_WHITEALPHA);
            gUnknown_203ACF0->field_01 = 1;
        }
        break;
    case 7:
        sub_8103988(gUnknown_203ACF0->field_42);
        FillBgTilemapBufferRect_Palette0(1, 0x000, 0, 0, 32, 20);
        CopyBgTilemapBufferToVram(1);
        sub_81047B0(&gUnknown_203ACF0->field_40);
        gUnknown_203ACF0->field_2F = 1;
        gTasks[taskId].func = sub_8103AC8;
        gUnknown_203ACF0->field_01 = 0;
        break;
    }
}

void sub_810345C(void)
{
    struct ListMenuTemplate template;
    FillBgTilemapBufferRect(3, 0x00E, 0, 0, 30, 20, 0x00);
    FillBgTilemapBufferRect(1, 0x000, 0, 0, 32, 32, 0x11);
    gUnknown_203ACF0->field_40 = AddWindow(&gUnknown_845216C);
    template = gUnknown_8452174;
    template.items = gUnknown_203ACF0->field_44;
    template.windowId = gUnknown_203ACF0->field_40;
    template.totalItems = gUnknown_203ACF0->field_48;
    sub_8103924(&template, gUnknown_203ACF0->field_42);
    FillWindowPixelBuffer(0, PIXEL_FILL(15));
    sub_8106E78(gUnknown_8415F4A, 1);
    FillWindowPixelBuffer(1, PIXEL_FILL(15));
    sub_8104C2C(gText_PickOKExit);
    CopyWindowToVram(0, 2);
    CopyWindowToVram(1, 2);
}

u16 sub_8103518(u8 a0)
{
    s32 max_n = IsNationalPokedexEnabled() ? NATIONAL_DEX_DEOXYS : NATIONAL_DEX_MEW;
    u16 ndex_num;
    u16 ret = NATIONAL_DEX_NONE;
    s32 i;
    bool8 caught;
    bool8 seen;

    switch (a0)
    {
    default:
    case 0:
        for (i = 0; i < NATIONAL_DEX_MEW; i++)
        {
            ndex_num = i + 1;
            seen = sub_8104AB0(ndex_num, FLAG_GET_SEEN, 0);
            caught = sub_8104AB0(ndex_num, FLAG_GET_CAUGHT, 0);
            if (seen)
            {
                gUnknown_203ACF0->field_44[i].label = gSpeciesNames[NationalPokedexNumToSpecies(ndex_num)];
                ret = ndex_num;
            }
            else
            {
                gUnknown_203ACF0->field_44[i].label = gUnknown_8415F66;
            }
            gUnknown_203ACF0->field_44[i].index = (caught << 17) + (seen << 16) + NationalPokedexNumToSpecies(ndex_num);
        }
        break;
    case 1:
        for (i = 0; i < SPECIES_CHIMECHO; i++)
        {
            ndex_num = gUnknown_8443FC0[i];
            if (ndex_num <= max_n)
            {
                seen = sub_8104AB0(ndex_num, FLAG_GET_SEEN, 0);
                caught = sub_8104AB0(ndex_num, FLAG_GET_CAUGHT, 0);
                if (seen)
                {
                    gUnknown_203ACF0->field_44[ret].label = gSpeciesNames[NationalPokedexNumToSpecies(ndex_num)];
                    gUnknown_203ACF0->field_44[ret].index = (caught << 17) + (seen << 16) + NationalPokedexNumToSpecies(ndex_num);
                    ret++;
                }
            }
        }
        break;
    case 2:
        for (i = 0; i < SPECIES_CHIMECHO; i++)
        {
            ndex_num = SpeciesToNationalPokedexNum(gUnknown_84448FE[i]);
            if (ndex_num <= max_n)
            {
                seen = sub_8104AB0(ndex_num, FLAG_GET_SEEN, 0);
                caught = sub_8104AB0(ndex_num, FLAG_GET_CAUGHT, 0);
                if (caught)
                {
                    gUnknown_203ACF0->field_44[ret].label = gSpeciesNames[NationalPokedexNumToSpecies(ndex_num)];
                    gUnknown_203ACF0->field_44[ret].index = (caught << 17) + (seen << 16) + NationalPokedexNumToSpecies(ndex_num);
                    ret++;
                }
            }
        }
        break;
    case 3:
        for (i = 0; i < NATIONAL_DEX_DEOXYS; i++)
        {
            ndex_num = gUnknown_84442F6[i];
            if (ndex_num <= max_n)
            {
                seen = sub_8104AB0(ndex_num, FLAG_GET_SEEN, 0);
                caught = sub_8104AB0(ndex_num, FLAG_GET_CAUGHT, 0);
                if (caught)
                {
                    gUnknown_203ACF0->field_44[ret].label = gSpeciesNames[NationalPokedexNumToSpecies(ndex_num)];
                    gUnknown_203ACF0->field_44[ret].index = (caught << 17) + (seen << 16) + NationalPokedexNumToSpecies(ndex_num);
                    ret++;
                }
            }
        }
        break;
    case 4:
        for (i = 0; i < NATIONAL_DEX_DEOXYS; i++)
        {
            ndex_num = gUnknown_84445FA[i];
            if (ndex_num <= max_n)
            {
                seen = sub_8104AB0(ndex_num, FLAG_GET_SEEN, 0);
                caught = sub_8104AB0(ndex_num, FLAG_GET_CAUGHT, 0);
                if (caught)
                {
                    gUnknown_203ACF0->field_44[ret].label = gSpeciesNames[NationalPokedexNumToSpecies(ndex_num)];
                    gUnknown_203ACF0->field_44[ret].index = (caught << 17) + (seen << 16) + NationalPokedexNumToSpecies(ndex_num);
                    ret++;
                }
            }
        }
        break;
    case 5:
        for (i = 0; i < NATIONAL_DEX_DEOXYS; i++)
        {
            ndex_num = i + 1;
            seen = sub_8104AB0(ndex_num, FLAG_GET_SEEN, 0);
            caught = sub_8104AB0(ndex_num, FLAG_GET_CAUGHT, 0);
            if (seen)
            {
                gUnknown_203ACF0->field_44[i].label = gSpeciesNames[NationalPokedexNumToSpecies(ndex_num)];
                ret = ndex_num;
            }
            else
            {
                gUnknown_203ACF0->field_44[i].label = gUnknown_8415F66;
            }
            gUnknown_203ACF0->field_44[i].index = (caught << 17) + (seen << 16) + NationalPokedexNumToSpecies(ndex_num);
        }
        break;
    }
    return ret;
}

void sub_8103924(const struct ListMenuTemplate * template, u8 a1)
{
    switch (a1)
    {
    default:
    case 0:
        gUnknown_203ACF0->field_41 = ListMenuInitInRect(template, &gUnknown_845218C, gUnknown_203ACF0->field_36, gUnknown_203ACF0->field_34);
        break;
    case 1:
    case 2:
    case 3:
    case 4:
        gUnknown_203ACF0->field_41 = ListMenuInitInRect(template, &gUnknown_845218C, gUnknown_203ACF0->field_3A, gUnknown_203ACF0->field_38);
        break;
    case 5:
        gUnknown_203ACF0->field_41 = ListMenuInitInRect(template, &gUnknown_845218C, gUnknown_203ACF0->field_3E, gUnknown_203ACF0->field_3C);
        break;
    }
}

void sub_8103988(u8 a0)
{
    switch (a0)
    {
    default:
    case 0:
        DestroyListMenuTask(gUnknown_203ACF0->field_41, &gUnknown_203ACF0->field_36, &gUnknown_203ACF0->field_34);
        break;
    case 1:
    case 2:
    case 3:
    case 4:
        DestroyListMenuTask(gUnknown_203ACF0->field_41, &gUnknown_203ACF0->field_3A, &gUnknown_203ACF0->field_38);
        break;
    case 5:
        DestroyListMenuTask(gUnknown_203ACF0->field_41, &gUnknown_203ACF0->field_3E, &gUnknown_203ACF0->field_3C);
        break;
    }
}

u8 sub_81039F0(void)
{
    struct ScrollArrowsTemplate template = gUnknown_84521B4;
    if (gUnknown_203ACF0->field_48 > gUnknown_8452174.maxShowed)
        template.fullyDownThreshold = gUnknown_203ACF0->field_48 - gUnknown_8452174.maxShowed;
    else
        template.fullyDownThreshold = 0;
    return AddScrollIndicatorArrowPair(&template, &gUnknown_203ACF0->field_62);
}

struct PokedexListItem
{
    u16 species;
    bool8 seen:1;
    bool8 caught:1;
};

void sub_8103A40(u8 windowId, s32 itemId, u8 y)
{
    u32 itemId_ = itemId;
    u16 species = itemId_;
    bool8 seen = (itemId_ >> 16) & 1;  // not used but required to match
    bool8 caught = (itemId_ >> 17) & 1;
    u8 type1;
    sub_8104A34(gUnknown_203ACF0->field_40, 0, species, 12, y);
    if (caught)
    {
        BlitMoveInfoIcon(gUnknown_203ACF0->field_40, 0, 0x28, y);
        type1 = gBaseStats[species].type1;
        BlitMoveInfoIcon(gUnknown_203ACF0->field_40, type1 + 1, 0x78, y);
        if (type1 != gBaseStats[species].type2)
            BlitMoveInfoIcon(gUnknown_203ACF0->field_40, gBaseStats[species].type2 + 1, 0x98, y);
    }
}

void sub_8103AC8(u8 taskId)
{
    int r4;
    u8 *ptr;
    switch (gUnknown_203ACF0->field_01)
    {
    case 0:
        HideBg(3);
        HideBg(2);
        HideBg(1);
        sub_810699C(gUnknown_203ACF0->field_28);
        if (gUnknown_203ACF0->field_2B < gUnknown_203ACF0->field_29)
            gUnknown_203ACF0->field_2B = gUnknown_203ACF0->field_29;
        gUnknown_203ACF0->field_01 = 2;
        break;
    case 1:
        sub_8104E90();
        HideBg(2);
        HideBg(1);
        switch (gUnknown_203ACF0->field_2F)
        {
        case 0:
        default:
            gTasks[taskId].func = sub_810287C;
            break;
        case 1:
            gTasks[taskId].func = sub_8103238;
            break;
        }
        gUnknown_203ACF0->field_01 = 0;
        break;
    case 2:
        sub_8104F0C(0);
        CopyBgTilemapBufferToVram(3);
        CopyBgTilemapBufferToVram(2);
        CopyBgTilemapBufferToVram(1);
        sub_8105058(0xFF);
        gUnknown_203ACF0->field_01 = 3;
        break;
    case 3:
        BeginNormalPaletteFade(0xFFFF7FFF, 0, 16, 0, RGB_WHITEALPHA);
        ShowBg(3);
        ShowBg(2);
        ShowBg(1);
        gUnknown_203ACF0->field_01 = 4;
        break;
    case 4:
        gUnknown_203ACF0->field_60 = sub_8104234();
        gUnknown_203ACF0->field_61 = ListMenuAddCursorObjectInternal(&gUnknown_84524C4, 0);
        gUnknown_203ACF0->field_01 = 5;
        break;
    case 5:
        sub_8105058(gUnknown_203ACF0->field_2D);
        sub_8105178(gUnknown_203ACF0->field_61, gUnknown_203ACF0->field_2D, gUnknown_203ACF0->field_2C);
        gUnknown_203ACF0->field_62 = gUnknown_203ACF0->field_2B;
        r4 = 0;
        if (JOY_NEW(A_BUTTON) && sub_8104AB0(gUnknown_203ACF0->field_18[gUnknown_203ACF0->field_2D], FLAG_GET_SEEN, 1))
        {
            RemoveScrollIndicatorArrowPair(gUnknown_203ACF0->field_60);
            ListMenuRemoveCursorObject(gUnknown_203ACF0->field_61, 0);
            gUnknown_203ACF0->field_01 = 12;
        }
        else
        {
            if (!JOY_HELD(R_BUTTON) && JOY_REPT(DPAD_LEFT))
            {
                if (gUnknown_203ACF0->field_2D != 0)
                {
                    gUnknown_203ACF0->field_2D--;
                    PlaySE(SE_SELECT);
                    break;
                }
                else
                    r4 = 1;
            }
            if (!JOY_HELD(R_BUTTON) && JOY_REPT(DPAD_RIGHT))
            {
                if (gUnknown_203ACF0->field_2D < gUnknown_203ACF0->field_2C - 1)
                {
                    gUnknown_203ACF0->field_2D++;
                    PlaySE(SE_SELECT);
                    break;
                }
                else
                    r4 = 2;
            }
            if (r4 == 0)
                r4 = sub_8104284();
            switch (r4)
            {
            case 0:
                break;
            case 1:
                while (gUnknown_203ACF0->field_2B > gUnknown_203ACF0->field_29)
                {
                    gUnknown_203ACF0->field_2B--;
                    if (sub_8106838(gUnknown_203ACF0->field_28, gUnknown_203ACF0->field_2B))
                    {
                        gUnknown_203ACF0->field_01 = 8;
                        break;
                    }
                }
                if (gUnknown_203ACF0->field_01 != 8)
                    gUnknown_203ACF0->field_01 = 6;
                break;
            case 2:
                while (gUnknown_203ACF0->field_2B < gUnknown_203ACF0->field_2A - 1)
                {
                    gUnknown_203ACF0->field_2B++;
                    if (sub_8106838(gUnknown_203ACF0->field_28, gUnknown_203ACF0->field_2B))
                    {
                        gUnknown_203ACF0->field_01 = 10;
                        break;
                    }
                }
                if (gUnknown_203ACF0->field_01 != 10)
                    gUnknown_203ACF0->field_01 = 6;
                break;
            }
            if (JOY_NEW(B_BUTTON))
            {
                gUnknown_203ACF0->field_01 = 6;
            }
        }
        break;
    case 6:
    case 7:
        RemoveScrollIndicatorArrowPair(gUnknown_203ACF0->field_60);
        ListMenuRemoveCursorObject(gUnknown_203ACF0->field_61, 0);
        BeginNormalPaletteFade(0xFFFF7FFF, 0, 0, 16, RGB_WHITEALPHA);
        gUnknown_203ACF0->field_01 = 1;
        break;
    case 8:
    case 10:
        sub_8104E90();
        sub_8105058(0xFF);
        ListMenuUpdateCursorObject(gUnknown_203ACF0->field_61, 0, 0xA0, 0);
        gUnknown_203ACF0->field_2E = 0;
        gUnknown_203ACF0->field_02 = 0;
        gUnknown_203ACF0->field_01++;
        break;
    case 9:
        if (sub_81052D0(0))
        {
            gUnknown_203ACF0->field_2D = gUnknown_203ACF0->field_2C - 1;
            gUnknown_203ACF0->field_01 = 5;
        }
        break;
    case 11:
        if (sub_81052D0(1))
        {
            gUnknown_203ACF0->field_2D = 0;
            gUnknown_203ACF0->field_01 = 5;
        }
        break;
    case 12:
        gUnknown_203ACF0->field_5A = gUnknown_203ACF0->field_18[gUnknown_203ACF0->field_2D];
        PlaySE(SE_SELECT);
        gUnknown_203ACF0->field_01 = 14;
        break;
    case 13:
        sub_8106014();
        gUnknown_203ACF0->field_01 = 4;
        break;
    case 14:
        sub_8105E1C(0);
        gUnknown_203ACF0->field_01 = 15;
        break;
    case 15:
        gUnknown_203ACF0->field_02 = 0;
        gUnknown_203ACF0->field_03 = 0;
        gUnknown_203ACF0->field_01++;
        // fallthrough
    case 16:
        if (gUnknown_203ACF0->field_03 < 6)
        {
            if (!gUnknown_203ACF0->field_02)
            {
                gUnknown_203ACF0->field_02--;
            }
            else
            {
                sub_8105594(0, gUnknown_203ACF0->field_03);
                CopyBgTilemapBufferToVram(0);
                gUnknown_203ACF0->field_02 = 4;
                gUnknown_203ACF0->field_03++;
            }
        }
        else
        {
            FillBgTilemapBufferRect_Palette0(0, 0x000, 0, 2, 30, 16);
            CopyBgTilemapBufferToVram(3);
            CopyBgTilemapBufferToVram(2);
            CopyBgTilemapBufferToVram(1);
            CopyBgTilemapBufferToVram(0);
            PlayCry2(gUnknown_203ACF0->field_5A, 0, 125, 10);
            gUnknown_203ACF0->field_02 = 0;
            gUnknown_203ACF0->field_01 = 17;
        }
        break;
    case 17:
        if (JOY_NEW(A_BUTTON))
        {
            sub_8106014();
            FillBgTilemapBufferRect_Palette0(1, 0x000, 0, 2, 30, 16);
            CopyBgTilemapBufferToVram(1);
            gUnknown_203ACF0->field_01 = 21;
        }
        else if (JOY_NEW(B_BUTTON))
        {
            gUnknown_203ACF0->field_01 = 18;
        }
        else
        {
            sub_8106B34();
        }
        break;
    case 18:
        sub_8104F0C(0);
        sub_8105594(0, 6);
        CopyBgTilemapBufferToVram(3);
        CopyBgTilemapBufferToVram(2);
        CopyBgTilemapBufferToVram(1);
        CopyBgTilemapBufferToVram(0);
        gUnknown_203ACF0->field_01 = 19;
        break;
    case 19:
        gUnknown_203ACF0->field_02 = 0;
        gUnknown_203ACF0->field_03 = 6;
        gUnknown_203ACF0->field_01++;
        // fallthrough
    case 20:
        if (gUnknown_203ACF0->field_03)
        {
            if (gUnknown_203ACF0->field_02)
            {
                gUnknown_203ACF0->field_03--;
                FillBgTilemapBufferRect_Palette0(0, 0x000, 0, 2, 30, 16);
                sub_8105594(0, gUnknown_203ACF0->field_03);
                CopyBgTilemapBufferToVram(0);
                gUnknown_203ACF0->field_02 = 1;
            }
            else
                gUnknown_203ACF0->field_02--;
        }
        else
        {
            FillBgTilemapBufferRect_Palette0(0, 0x000, 0, 2, 30, 16);
            CopyBgTilemapBufferToVram(0);
            gUnknown_203ACF0->field_01 = 13;
        }
        break;
    case 21:
        sub_810603C();
        gUnknown_203ACF0->field_01 = 22;
        break;
    case 22:
        CopyBgTilemapBufferToVram(3);
        CopyBgTilemapBufferToVram(2);
        CopyBgTilemapBufferToVram(1);
        CopyBgTilemapBufferToVram(0);
        gUnknown_203ACF0->field_01 = 23;
        break;
    case 23:
        if (JOY_NEW(A_BUTTON))
        {
            FillBgTilemapBufferRect_Palette0(2, 0x000, 0, 2, 30, 16);
            FillBgTilemapBufferRect_Palette0(1, 0x000, 0, 2, 30, 16);
            FillBgTilemapBufferRect_Palette0(0, 0x000, 0, 2, 30, 16);
            CopyBgTilemapBufferToVram(2);
            CopyBgTilemapBufferToVram(1);
            CopyBgTilemapBufferToVram(0);
            gUnknown_203ACF0->field_01 = 26;
        }
        else if (JOY_NEW(B_BUTTON))
        {
            FillBgTilemapBufferRect_Palette0(2, 0x000, 0, 2, 30, 16);
            FillBgTilemapBufferRect_Palette0(1, 0x000, 0, 2, 30, 16);
            FillBgTilemapBufferRect_Palette0(0, 0x000, 0, 2, 30, 16);
            CopyBgTilemapBufferToVram(2);
            CopyBgTilemapBufferToVram(1);
            CopyBgTilemapBufferToVram(0);
            gUnknown_203ACF0->field_01 = 24;
        }
        else
        {
            sub_8106B34();
        }
        break;
    case 24:
        sub_81067C0();
        gUnknown_203ACF0->field_01 = 25;
        break;
    case 25:
        sub_8105E1C(0);
        CopyBgTilemapBufferToVram(3);
        CopyBgTilemapBufferToVram(2);
        CopyBgTilemapBufferToVram(1);
        CopyBgTilemapBufferToVram(0);
        gUnknown_203ACF0->field_01 = 17;
        break;
    case 26:
        sub_81067C0();
        gUnknown_203ACF0->field_01 = 18;
        break;
    }
}
