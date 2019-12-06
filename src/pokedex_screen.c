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

struct PokedexScreenData
{
    u8 field_00;
    u8 filler_01[0x43];
    void * field_44;
    u8 filler_48[0x1E];
    u16 field_66;
    u16 field_68;
    u16 field_6A;
    u16 field_6C;
};

EWRAM_DATA struct PokedexScreenData * gUnknown_203ACF0 = NULL;

void sub_810287C(u8 taskId);
u16 sub_8104BBC(u8 a0, u8 a1);

extern const u32 gUnknown_8440274[];
extern const u32 gUnknown_84403AC[];
extern const u16 gUnknown_84404C8[];
extern const u16 gUnknown_84406E0[];
extern const struct BgTemplate gUnknown_8451EBC[4];
extern const struct WindowTemplate gUnknown_8451ECC[];
extern const struct PokedexScreenData gUnknown_8451EE4;

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
