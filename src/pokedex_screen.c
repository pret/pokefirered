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
#include "string_util.h"
#include "trainer_pokemon_sprites.h"
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
    u16 field_18[0x4];
    u8 field_20[0x4];
    u8 field_24[0x4];
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
u8 sub_8104234(void);
int sub_8104284(void);
void sub_81042EC(u8 taskId);
bool32 sub_8104664(u8 a0);
void sub_81047B0(u8 *windowId_p);
void sub_81047C8(u8 windowId, u8 fontId, const u8 *str, u8 x, u8 y, u8 colorIdx);
void sub_810491C(u8 windowId, u8 fontId, u16 num, u8 x, u8 y, u8 colorIdx);
void sub_8104A34(u8 windowId, u8 fontId, u16 species, u8 x, u8 y);
u16 sub_8104BBC(u8 caseID, bool8 whichDex);
void sub_8104C2C(const u8 *src);
void sub_8104E90(void);
bool8 sub_8104F0C(bool8 a0);
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
void sub_81068DC(u8 a0, u8 a1);
u8 sub_8106AF8(u16 a0);
void sub_8106B34(void);
void sub_8106E78(const u8 *a0, s32 a1);

extern const u16 gUnknown_8440124[];
extern const u32 gUnknown_8440274[];
extern const u32 gUnknown_84403AC[];
extern const u16 gUnknown_84404C8[];
extern const u16 gUnknown_84406C8[];
extern const u16 gUnknown_84406E0[];
extern const u16 gUnknown_8440EF0[];
extern const u16 gUnknown_8443460[];
extern const u8 gUnknown_8443600[];
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
extern const struct ListMenuTemplate gUnknown_8452004;
extern const struct ListMenuTemplate gUnknown_84520BC;
extern const struct ScrollArrowsTemplate gUnknown_84520D4;
extern const struct ScrollArrowsTemplate gUnknown_84520E4;
extern const struct PokedexScreenWindowGfx gUnknown_84520F4[];
extern const struct WindowTemplate gUnknown_845216C;
extern const struct ListMenuTemplate gUnknown_8452174;
extern const struct ListMenuWindowRect gUnknown_845218C;
extern const struct ScrollArrowsTemplate gUnknown_84521B4;
extern const struct WindowTemplate gUnknown_84521C4;
extern const struct WindowTemplate gUnknown_84521CC;
extern const u16 gUnknown_845228C[];
extern const u8 (*const gUnknown_8452334[])[4];
extern const u8 *const gUnknown_8452344[];
extern const struct ScrollArrowsTemplate gUnknown_84524B4;
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
    s32 max_n = IsNationalPokedexEnabled() ? NATIONAL_DEX_COUNT : KANTO_DEX_COUNT;
    u16 ndex_num;
    u16 ret = NATIONAL_DEX_NONE;
    s32 i;
    bool8 caught;
    bool8 seen;

    switch (a0)
    {
    default:
    case 0:
        for (i = 0; i < KANTO_DEX_COUNT; i++)
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
        for (i = 0; i < NATIONAL_DEX_COUNT; i++)
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
        for (i = 0; i < NATIONAL_DEX_COUNT; i++)
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
        for (i = 0; i < NATIONAL_DEX_COUNT; i++)
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

u8 sub_8104234(void)
{
    struct ScrollArrowsTemplate template = gUnknown_84524B4;
    template.fullyUpThreshold = gUnknown_203ACF0->field_29;
    template.fullyDownThreshold = gUnknown_203ACF0->field_2A - 1;
    gUnknown_203ACF0->field_62 = gUnknown_203ACF0->field_2B;
    return AddScrollIndicatorArrowPair(&template, &gUnknown_203ACF0->field_62);
}

int sub_8104284(void)
{
    switch (gSaveBlock2Ptr->optionsButtonMode)
    {
    case OPTIONS_BUTTON_MODE_L_EQUALS_A:
        // Using the JOY_HELD and JOY_NEW macros here does not match!
        if ((gMain.heldKeys & R_BUTTON) && (gMain.newKeys & DPAD_LEFT))
            return 1;
        else if ((gMain.heldKeys & R_BUTTON) && (gMain.newKeys & DPAD_RIGHT))
            return 2;
        else
            return 0;
    case OPTIONS_BUTTON_MODE_LR:
        if (gMain.newKeys & L_BUTTON)
            return 1;
        else if (gMain.newKeys & R_BUTTON)
            return 2;
        else
            return 0;
    default:
    case OPTIONS_BUTTON_MODE_HELP:
        return 0;
    }
}

void sub_81042EC(u8 taskId)
{
    switch (gUnknown_203ACF0->field_01)
    {
    case 0:
        HideBg(3);
        HideBg(2);
        HideBg(1);
        gUnknown_203ACF0->field_01 = 2;
        break;
    case 1:
        HideBg(2);
        HideBg(1);
        gTasks[taskId].func = sub_8102F80;
        gUnknown_203ACF0->field_01 = 0;
        break;
    case 2:
        gUnknown_203ACF0->field_2C = 1;
        sub_8105E1C(0);
        gUnknown_203ACF0->field_01 = 3;
        break;
    case 3:
        CopyBgTilemapBufferToVram(3);
        CopyBgTilemapBufferToVram(2);
        CopyBgTilemapBufferToVram(1);
        CopyBgTilemapBufferToVram(0);
        PlayCry2(gUnknown_203ACF0->field_5A, 0, 125, 10);
        gUnknown_203ACF0->field_01 = 4;
        break;
    case 4:
        BeginNormalPaletteFade(0xFFFF7FFF, 0, 16, 0, RGB_WHITEALPHA);
        ShowBg(3);
        ShowBg(2);
        ShowBg(1);
        gUnknown_203ACF0->field_01 = 5;
        break;
    case 5:
        if (JOY_NEW(A_BUTTON))
        {
            sub_8106014();
            FillBgTilemapBufferRect_Palette0(1, 0x000, 0, 2, 30, 16);
            CopyBgTilemapBufferToVram(1);
            gUnknown_203ACF0->field_01 = 7;
        }
        else if (JOY_NEW(B_BUTTON))
        {
            sub_8106014();
            BeginNormalPaletteFade(0xFFFF7FFF, 0, 0, 16, RGB_WHITEALPHA);
            gUnknown_203ACF0->field_01 = 1;
        }
        else if (JOY_NEW(DPAD_UP) && sub_8104664(1))
        {
            sub_8106014();
            BeginNormalPaletteFade(0xFFFF7FFF, 0, 0, 16, RGB_WHITEALPHA);
            gUnknown_203ACF0->field_01 = 6;
        }
        else if (JOY_NEW(DPAD_DOWN) && sub_8104664(0))
        {
            sub_8106014();
            BeginNormalPaletteFade(0xFFFF7FFF, 0, 0, 16, RGB_WHITEALPHA);
            gUnknown_203ACF0->field_01 = 6;
        }
        else
        {
            sub_8106B34();
        }
        break;
    case 6:
        HideBg(2);
        HideBg(1);
        gUnknown_203ACF0->field_5A = gUnknown_203ACF0->field_30;
        gUnknown_203ACF0->field_01 = 2;
        break;
    case 7:
        sub_810603C();
        gUnknown_203ACF0->field_01 = 8;
        break;
    case 8:
        CopyBgTilemapBufferToVram(3);
        CopyBgTilemapBufferToVram(2);
        CopyBgTilemapBufferToVram(1);
        CopyBgTilemapBufferToVram(0);
        gUnknown_203ACF0->field_01 = 9;
        break;
    case 9:
        if (JOY_NEW(A_BUTTON))
        {
            BeginNormalPaletteFade(0xFFFF7FFF, 0, 0, 16, RGB_WHITEALPHA);
            gUnknown_203ACF0->field_01 = 12;
        }
        else if (JOY_NEW(B_BUTTON))
        {
            FillBgTilemapBufferRect_Palette0(2, 0x000, 0, 2, 30, 16);
            FillBgTilemapBufferRect_Palette0(1, 0x000, 0, 2, 30, 16);
            FillBgTilemapBufferRect_Palette0(0, 0x000, 0, 2, 30, 16);
            CopyBgTilemapBufferToVram(2);
            CopyBgTilemapBufferToVram(1);
            CopyBgTilemapBufferToVram(0);
            gUnknown_203ACF0->field_01 = 10;
        }
        else
        {
            sub_8106B34();
        }
        break;
    case 10:
        sub_81067C0();
        gUnknown_203ACF0->field_01 = 11;
        break;
    case 11:
        sub_8105E1C(0);
        CopyBgTilemapBufferToVram(3);
        CopyBgTilemapBufferToVram(2);
        CopyBgTilemapBufferToVram(1);
        CopyBgTilemapBufferToVram(0);
        gUnknown_203ACF0->field_01 = 5;
        break;
    case 12:
        sub_81067C0();
        FillBgTilemapBufferRect_Palette0(0, 0x000, 0, 2, 30, 16);
        CopyBgTilemapBufferToVram(0);
        gUnknown_203ACF0->field_01 = 1;
        break;
    }
}

#ifdef NONMATCHING
// HOLY HECK THIS FUNCTION NotLikeThis
bool32 sub_8104664(u8 a0)
{
    u16 *r12;
    u16 *r6;
    int r3;

    switch (gUnknown_203ACF0->field_42)
    {
    case 0:
    default:
        r12 = &gUnknown_203ACF0->field_36;
        r6 = &gUnknown_203ACF0->field_34;
        break;
    case 1:
    case 2:
    case 3:
    case 4:
        r12 = &gUnknown_203ACF0->field_3A;
        r6 = &gUnknown_203ACF0->field_38;
        break;
    case 5:
        r12 = &gUnknown_203ACF0->field_3E;
        r6 = &gUnknown_203ACF0->field_3C;
        break;
    }
    r3 = *r12 + *r6;
    if (a0)
    {
        if (r3 == 0)
            return FALSE;
        while (r3-- >= 0)
        {
            if ((((u32)gUnknown_203ACF0->field_44[r3].index) >> 16) & 1)
                break;
        }
        if (r3 < 0)
            return FALSE;
    }
    else
    {
        if (r3 == gUnknown_203ACF0->field_48 - 1)
            return FALSE;
        while (r3++ < gUnknown_203ACF0->field_48)
        {
            if ((((u32)gUnknown_203ACF0->field_44[r3].index) >> 16) & 1)
                break;
        }
        if (r3 >= gUnknown_203ACF0->field_48)
            return FALSE;
    }
    gUnknown_203ACF0->field_30 = gUnknown_203ACF0->field_44[r3].index;
    if (gUnknown_203ACF0->field_48 > 9)
    {
        if (r3 < 4)
        {
            *r12 = 0;
            *r6 = r3;
        }
        else if (r3 >= gUnknown_203ACF0->field_48 - 4)
        {
            *r12 = gUnknown_203ACF0->field_48 - 9;
            *r6 = r3 + 9 - gUnknown_203ACF0->field_48;
        }
        else
        {
            *r12 = r3 - 4;
            *r6 = 4;
        }
    }
    else
    {
        *r12 = 0;
        *r6 = r3;
    }
    return TRUE;
}
#else
NAKED
bool32 sub_8104664(u8 a0)
{
    asm_unified("\tpush {r4-r7,lr}\n"
                "\tmov r7, r8\n"
                "\tpush {r7}\n"
                "\tlsls r0, 24\n"
                "\tlsrs r4, r0, 24\n"
                "\tldr r0, _08104684 @ =gUnknown_203ACF0\n"
                "\tldr r3, [r0]\n"
                "\tadds r2, r3, 0\n"
                "\tadds r2, 0x42\n"
                "\tldrb r2, [r2]\n"
                "\tmov r8, r0\n"
                "\tcmp r2, 0x4\n"
                "\tbgt _08104688\n"
                "\tcmp r2, 0x1\n"
                "\tbge _0810469C\n"
                "\tb _0810468C\n"
                "\t.align 2, 0\n"
                "_08104684: .4byte gUnknown_203ACF0\n"
                "_08104688:\n"
                "\tcmp r2, 0x5\n"
                "\tbeq _081046A8\n"
                "_0810468C:\n"
                "\tmov r1, r8\n"
                "\tldr r0, [r1]\n"
                "\tmovs r2, 0x36\n"
                "\tadds r2, r0\n"
                "\tmov r12, r2\n"
                "\tadds r6, r0, 0\n"
                "\tadds r6, 0x34\n"
                "\tb _081046B2\n"
                "_0810469C:\n"
                "\tmovs r0, 0x3A\n"
                "\tadds r0, r3\n"
                "\tmov r12, r0\n"
                "\tadds r6, r3, 0\n"
                "\tadds r6, 0x38\n"
                "\tb _081046B2\n"
                "_081046A8:\n"
                "\tmovs r1, 0x3E\n"
                "\tadds r1, r3\n"
                "\tmov r12, r1\n"
                "\tadds r6, r3, 0\n"
                "\tadds r6, 0x3C\n"
                "_081046B2:\n"
                "\tmov r2, r12\n"
                "\tldrh r1, [r2]\n"
                "\tldrh r0, [r6]\n"
                "\tadds r3, r1, r0\n"
                "\tcmp r4, 0\n"
                "\tbeq _08104700\n"
                "\tcmp r3, 0\n"
                "\tbeq _0810474C\n"
                "\tsubs r3, 0x1\n"
                "\tcmp r3, 0\n"
                "\tblt _0810474C\n"
                "\tmov r1, r8\n"
                "\tldr r0, [r1]\n"
                "\tldr r0, [r0, 0x44]\n"
                "\tlsls r2, r3, 3\n"
                "\tadds r0, r2, r0\n"
                "\tldrh r0, [r0, 0x6]\n"
                "\tmovs r1, 0x1\n"
                "\tands r0, r1\n"
                "\tcmp r0, 0\n"
                "\tbne _081046FA\n"
                "\tmov r5, r8\n"
                "\tmovs r4, 0x1\n"
                "\tadds r1, r2, 0\n"
                "_081046E2:\n"
                "\tsubs r1, 0x8\n"
                "\tsubs r3, 0x1\n"
                "\tcmp r3, 0\n"
                "\tblt _0810474C\n"
                "\tldr r0, [r5]\n"
                "\tldr r0, [r0, 0x44]\n"
                "\tadds r0, r1, r0\n"
                "\tldrh r0, [r0, 0x6]\n"
                "\tands r0, r4\n"
                "\tadds r2, r1, 0\n"
                "\tcmp r0, 0\n"
                "\tbeq _081046E2\n"
                "_081046FA:\n"
                "\tcmp r3, 0\n"
                "\tbge _08104750\n"
                "\tb _0810474C\n"
                "_08104700:\n"
                "\tmov r2, r8\n"
                "\tldr r5, [r2]\n"
                "\tadds r0, r5, 0\n"
                "\tadds r0, 0x48\n"
                "\tldrh r4, [r0]\n"
                "\tsubs r0, r4, 0x1\n"
                "\tcmp r3, r0\n"
                "\tbeq _0810474C\n"
                "\tadds r3, 0x1\n"
                "\tcmp r3, r4\n"
                "\tbge _0810474C\n"
                "\tldr r0, [r5, 0x44]\n"
                "\tlsls r2, r3, 3\n"
                "\tadds r0, r2, r0\n"
                "\tldrh r0, [r0, 0x6]\n"
                "\tmovs r1, 0x1\n"
                "\tands r0, r1\n"
                "\tcmp r0, 0\n"
                "\tbne _08104740\n"
                "\tadds r1, r2, 0\n"
                "\tmovs r7, 0x1\n"
                "_0810472A:\n"
                "\tadds r1, 0x8\n"
                "\tadds r3, 0x1\n"
                "\tcmp r3, r4\n"
                "\tbge _0810474C\n"
                "\tldr r0, [r5, 0x44]\n"
                "\tadds r0, r1, r0\n"
                "\tldrh r0, [r0, 0x6]\n"
                "\tands r0, r7\n"
                "\tadds r2, r1, 0\n"
                "\tcmp r0, 0\n"
                "\tbeq _0810472A\n"
                "_08104740:\n"
                "\tmov r1, r8\n"
                "\tldr r0, [r1]\n"
                "\tadds r0, 0x48\n"
                "\tldrh r0, [r0]\n"
                "\tcmp r3, r0\n"
                "\tblt _08104750\n"
                "_0810474C:\n"
                "\tmovs r0, 0\n"
                "\tb _081047A6\n"
                "_08104750:\n"
                "\tmov r0, r8\n"
                "\tldr r1, [r0]\n"
                "\tldr r0, [r1, 0x44]\n"
                "\tadds r0, r2, r0\n"
                "\tldr r0, [r0, 0x4]\n"
                "\tstr r0, [r1, 0x30]\n"
                "\tadds r1, 0x48\n"
                "\tldrh r0, [r1]\n"
                "\tcmp r0, 0x9\n"
                "\tbls _0810479C\n"
                "\tcmp r3, 0x3\n"
                "\tbgt _08104770\n"
                "\tmovs r0, 0\n"
                "\tmov r1, r12\n"
                "\tstrh r0, [r1]\n"
                "\tb _081047A2\n"
                "_08104770:\n"
                "\tldrh r1, [r1]\n"
                "\tsubs r0, r1, 0x4\n"
                "\tcmp r3, r0\n"
                "\tblt _08104790\n"
                "\tsubs r0, 0x5\n"
                "\tmov r2, r12\n"
                "\tstrh r0, [r2]\n"
                "\tadds r1, r3, 0\n"
                "\tadds r1, 0x9\n"
                "\tmov r2, r8\n"
                "\tldr r0, [r2]\n"
                "\tadds r0, 0x48\n"
                "\tldrh r0, [r0]\n"
                "\tsubs r1, r0\n"
                "\tstrh r1, [r6]\n"
                "\tb _081047A4\n"
                "_08104790:\n"
                "\tsubs r0, r3, 0x4\n"
                "\tmov r1, r12\n"
                "\tstrh r0, [r1]\n"
                "\tmovs r0, 0x4\n"
                "\tstrh r0, [r6]\n"
                "\tb _081047A4\n"
                "_0810479C:\n"
                "\tmovs r0, 0\n"
                "\tmov r2, r12\n"
                "\tstrh r0, [r2]\n"
                "_081047A2:\n"
                "\tstrh r3, [r6]\n"
                "_081047A4:\n"
                "\tmovs r0, 0x1\n"
                "_081047A6:\n"
                "\tpop {r3}\n"
                "\tmov r8, r3\n"
                "\tpop {r4-r7}\n"
                "\tpop {r1}\n"
                "\tbx r1");
}
#endif //NONMATCHING

void sub_81047B0(u8 *windowId_p)
{
    if (*windowId_p != 0xFF)
    {
        RemoveWindow(*windowId_p);
        *windowId_p = 0xFF;
    }
}

void sub_81047C8(u8 windowId, u8 fontId, const u8 *str, u8 x, u8 y, u8 colorIdx)
{
    u8 textColor[3];
    switch (colorIdx)
    {
    case 0:
        textColor[0] = 0;
        textColor[1] = 1;
        textColor[2] = 3;
        break;
    case 1:
        textColor[0] = 0;
        textColor[1] = 5;
        textColor[2] = 1;
        break;
    case 2:
        textColor[0] = 0;
        textColor[1] = 15;
        textColor[2] = 14;
        break;
    case 3:
        textColor[0] = 0;
        textColor[1] = 11;
        textColor[2] = 1;
        break;
    case 4:
        textColor[0] = 0;
        textColor[1] = 1;
        textColor[2] = 2;
        break;
    }
    AddTextPrinterParameterized4(windowId, fontId, x, y, fontId == 0 ? 0 : 1, 0, textColor, -1, str);
}

void sub_8104880(u8 windowId, u8 fontId, u16 num, u8 x, u8 y, u8 colorIdx)
{
    u8 buff[4];
    buff[0] = (num / 100) + CHAR_0;
    buff[1] = ((num %= 100) / 10) + CHAR_0;
    buff[2] = (num % 10) + CHAR_0;
    buff[3] = EOS;
    sub_81047C8(windowId, fontId, buff, x, y, colorIdx);
}

void sub_810491C(u8 windowId, u8 fontId, u16 num, u8 x, u8 y, u8 colorIdx)
{
    u8 buff[4];
    int i;
    buff[0] = (num / 100) + CHAR_0;
    buff[1] = ((num %= 100) / 10) + CHAR_0;
    buff[2] = (num % 10) + CHAR_0;
    buff[3] = EOS;
    for (i = 0; i < 3; i++)
    {
        if (buff[i] != CHAR_0)
            break;
        buff[i] = CHAR_SPACE;
    }
    sub_81047C8(windowId, fontId, buff, x, y, colorIdx);
}

u32 sub_81049CC(int species)
{
    switch (species)
    {
    case SPECIES_SPINDA:
        return gSaveBlock2Ptr->pokedex.spindaPersonality;
    case SPECIES_UNOWN:
        return gSaveBlock2Ptr->pokedex.unownPersonality;
    default:
        return 0;
    }
}

void sub_81049FC(u8 windowId, u16 species, u16 paletteOffset)
{
    LoadMonPicInWindow(species, 8, sub_81049CC(species), TRUE, paletteOffset >> 4, windowId);
}

void sub_8104A34(u8 windowId, u8 fontId, u16 species, u8 x, u8 y)
{
    u16 dexNum = SpeciesToNationalPokedexNum(species);
    sub_81047C8(windowId, fontId, gUnknown_8415FFF, x, y, 0);
    sub_8104880(windowId, fontId, dexNum, x + 9, y, 0);
}

s8 sub_8104AB0(u16 nationalDexNo, u8 caseID, bool8 indexIsSpecies)
{
    u8 index;
    u8 bit;
    u8 mask;
    s8 retVal;

    if (indexIsSpecies)
        nationalDexNo = SpeciesToNationalPokedexNum(nationalDexNo);

    nationalDexNo--;
    index = nationalDexNo / 8;
    bit = nationalDexNo % 8;
    mask = 1 << bit;
    retVal = 0;
    switch (caseID)
    {
    case FLAG_GET_SEEN:
        if (gSaveBlock2Ptr->pokedex.seen[index] & mask)
        {
            if ((gSaveBlock2Ptr->pokedex.seen[index] & mask) == (gSaveBlock1Ptr->seen1[index] & mask)
                && (gSaveBlock2Ptr->pokedex.seen[index] & mask) == (gSaveBlock1Ptr->seen2[index] & mask))
                retVal = 1;
        }
        break;
    case FLAG_GET_CAUGHT:
        if (gSaveBlock2Ptr->pokedex.owned[index] & mask)
        {
            if ((gSaveBlock2Ptr->pokedex.owned[index] & mask) == (gSaveBlock2Ptr->pokedex.seen[index] & mask)
                && (gSaveBlock2Ptr->pokedex.owned[index] & mask) == (gSaveBlock1Ptr->seen1[index] & mask)
                && (gSaveBlock2Ptr->pokedex.owned[index] & mask) == (gSaveBlock1Ptr->seen2[index] & mask))
                retVal = 1;
        }
        break;
    case FLAG_SET_SEEN:
        gSaveBlock2Ptr->pokedex.seen[index] |= mask;
        gSaveBlock1Ptr->seen1[index] |= mask;
        gSaveBlock1Ptr->seen2[index] |= mask;
        break;
    case FLAG_SET_CAUGHT:
        gSaveBlock2Ptr->pokedex.owned[index] |= mask;
        break;
    }
    return retVal;
}

u16 sub_8104BBC(u8 caseID, bool8 whichDex)
{
    u16 count = 0;
    u16 i;

    switch (whichDex)
    {
    case 0: // Kanto
        for (i = 0; i < KANTO_DEX_COUNT; i++)
        {
            if (sub_8104AB0(i + 1, caseID, FALSE))
                count++;
        }
        break;
    case 1: // National
        for (i = 0; i < NATIONAL_DEX_COUNT; i++)
        {
            if (sub_8104AB0(i + 1, caseID, FALSE))
                count++;

        }
        break;
    }
    return count;
}

void sub_8104C2C(const u8 *src)
{
    sub_81047C8(1, 0, src, 236 - GetStringWidth(0, src, 0), 2, 4);
}

bool8 sub_8104C64(u16 a0, u8 a1, u8 a2)
{
    struct WindowTemplate template;
    a2--;
    CopyToBgTilemapBufferRect_ChangePalette(3, gUnknown_845228C, gUnknown_8452334[a2][a1][0], gUnknown_8452334[a2][a1][1], 8, 8, a1 + 5);
    if (gUnknown_203ACF0->field_20[a1] == 0xFF)
    {
        template = gUnknown_84521C4;
        template.tilemapLeft = gUnknown_8452334[a2][a1][0];
        template.tilemapTop = gUnknown_8452334[a2][a1][1];
        template.paletteNum = a1 + 1;
        template.baseBlock = a1 * 64 + 8;
        gUnknown_203ACF0->field_20[a1] = AddWindow(&template);
        FillWindowPixelBuffer(gUnknown_203ACF0->field_20[a1], PIXEL_FILL(0));
        sub_81049FC(gUnknown_203ACF0->field_20[a1], a0, a1 * 16 + 16);
        PutWindowTilemap(gUnknown_203ACF0->field_20[a1]);
        CopyWindowToVram(gUnknown_203ACF0->field_20[a1], 2);
    }
    else
        PutWindowTilemap(gUnknown_203ACF0->field_20[a1]);

    if (gUnknown_203ACF0->field_24[a1] == 0xFF)
    {
        if (a0 != SPECIES_NONE)
        {
            template = gUnknown_84521CC;
            template.tilemapLeft = gUnknown_8452334[a2][a1][2];
            template.tilemapTop = gUnknown_8452334[a2][a1][3];
            template.baseBlock = a1 * 40 + 0x108;
            gUnknown_203ACF0->field_24[a1] = AddWindow(&template);
            CopyToWindowPixelBuffer(gUnknown_203ACF0->field_24[a1], gUnknown_8440124, 0, 0);
            sub_8104A34(gUnknown_203ACF0->field_24[a1], 0, a0, 12, 0);
            sub_81047C8(gUnknown_203ACF0->field_24[a1], 2, gSpeciesNames[a0], 2, 13, 0);
            if (sub_8104AB0(a0, FLAG_GET_CAUGHT, TRUE))
                BlitBitmapRectToWindow(gUnknown_203ACF0->field_24[a1], gUnknown_8443600, 0, 0, 8, 8, 2, 3, 8, 8);
            PutWindowTilemap(gUnknown_203ACF0->field_24[a1]);
            CopyWindowToVram(gUnknown_203ACF0->field_24[a1], 2);
        }
    }
    else
        PutWindowTilemap(gUnknown_203ACF0->field_24[a1]);

    return TRUE;
}

void sub_8104E90(void)
{
    int i;
    for (i = 0; i < 4; i++)
    {
        sub_81047B0(&gUnknown_203ACF0->field_20[i]);
        sub_81047B0(&gUnknown_203ACF0->field_24[i]);
    }
}

void sub_8104EC0(u8 unused, u16 a1, u16 a2, u8 unused2, u8 unused3)
{
    u8 buffer[30];
    u8 *ptr = StringCopy(buffer, gUnknown_8416002);
    ptr = ConvertIntToDecimalStringN(ptr, a1, STR_CONV_MODE_RIGHT_ALIGN, 2);
    *ptr++ = CHAR_SLASH;
    ptr = ConvertIntToDecimalStringN(ptr, a2, STR_CONV_MODE_RIGHT_ALIGN, 2);
    sub_8106E78(buffer, 2);
}

bool8 sub_8104F0C(bool8 a0)
{
    FillBgTilemapBufferRect_Palette0(3, 2, 0, 0, 30, 20);
    FillBgTilemapBufferRect_Palette0(2, 0, 0, 0, 32, 20);
    FillBgTilemapBufferRect_Palette0(1, 0, 0, 0, 32, 20);
    sub_81068DC(gUnknown_203ACF0->field_28, gUnknown_203ACF0->field_2B);
    FillWindowPixelBuffer(0, PIXEL_FILL(15));
    if (a0)
    {
        sub_8106E78(gUnknown_8452344[gUnknown_203ACF0->field_28], 1);
    }
    else
    {
        sub_8106E78(gUnknown_8452344[gUnknown_203ACF0->field_28], 0);
        sub_8104EC0(0, sub_8106AF8(gUnknown_203ACF0->field_2B), sub_8106AF8(gUnknown_203ACF0->field_2A - 1), 160, 2);
    }
    CopyWindowToVram(0, 2);
    FillWindowPixelBuffer(1, PIXEL_FILL(15));
    if (!a0)
        sub_8104C2C(gUnknown_8415F6C);
    CopyWindowToVram(1, 2);
    if (gUnknown_203ACF0->field_18[0] != 0xFFFF)
        sub_8104C64(gUnknown_203ACF0->field_18[0], 0, gUnknown_203ACF0->field_2C);
    if (gUnknown_203ACF0->field_18[1] != 0xFFFF)
        sub_8104C64(gUnknown_203ACF0->field_18[1], 1, gUnknown_203ACF0->field_2C);
    if (gUnknown_203ACF0->field_18[2] != 0xFFFF)
        sub_8104C64(gUnknown_203ACF0->field_18[2], 2, gUnknown_203ACF0->field_2C);
    if (gUnknown_203ACF0->field_18[3] != 0xFFFF)
        sub_8104C64(gUnknown_203ACF0->field_18[3], 3, gUnknown_203ACF0->field_2C);
    return FALSE;
}

void sub_8105058(u8 a0)
{
    int i;
    u32 r7;

    if (a0 == 0xFF)
    {
        for (i = 0; i < 4; i++)
        {
            LoadPalette(&gUnknown_84406C8[0], 0x52 + 0x10 * i, 2);
            LoadPalette(&gUnknown_84406C8[1], 0x58 + 0x10 * i, 2);
        }
        LoadPalette(&gUnknown_84406C8[0], 0x141, 2);
        gUnknown_203ACF0->field_2E = 0;
    }
    else
    {
        gUnknown_203ACF0->field_2E++;
        if (gUnknown_203ACF0->field_2E == 16)
            gUnknown_203ACF0->field_2E = 0;
        r7 = gUnknown_203ACF0->field_2E >> 2;
        for (i = 0; i < 4; i++)
        {
            if (i == a0)
            {
                LoadPalette(&gUnknown_84406C8[2 * r7 + 2], 0x52 + 0x10 * i, 2);
                LoadPalette(&gUnknown_84406C8[2 * r7 + 3], 0x58 + 0x10 * i, 2);
            }
            else
            {
                LoadPalette(&gUnknown_84406C8[0], 0x52 + 0x10 * i, 2);
                LoadPalette(&gUnknown_84406C8[1], 0x58 + 0x10 * i, 2);
            }
        }
        LoadPalette(&gUnknown_84406C8[2 * r7 + 2], 0x141, 2);
    }
}

void sub_8105178(u8 a0, u8 a1, u8 a2)
{
    a2--;
    ListMenuUpdateCursorObject(a0, gUnknown_8452334[a2][a1][2] * 8, gUnknown_8452334[a2][a1][3] * 8, 0);
}

bool8 sub_81051AC(const u16 *a0, u8 a1, u16 *a2, u8 a3)
{
    int i;
    const u16 *src = &a0[a1];
    u16 *dst = &a2[a3];
    for (i = 0; i < 20; i++)
    {
        *dst = *src;
        dst += 32;
        src += 32;
    }
    return FALSE;
}

bool8 sub_81051D0(u16 a0, u16 *a1, u8 a2)
{
    int i;
    u16 *dst = &a1[a2];
    for (i = 0; i < 20; i++)
    {
        *dst = a0;
        dst += 32;
    }
    return FALSE;
}
