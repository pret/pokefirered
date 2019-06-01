#include "main.h"
#include "global.h"
#include "task.h"
#include "menu.h"
#include "palette.h"
#include "sprite.h"
#include "menu_helpers.h"
#include "sound.h"
#include "malloc.h"
#include "sprite.h"
#include "scanline_effect.h"
#include "bg.h"
#include "gpu_regs.h"
#include "decompress.h"
#include "window.h"
#include "list_menu.h"
#include "item.h"
#include "constants/songs.h"
#include "constants/items.h"

typedef struct {
    void (*callback)();
    u8 mode;
    u8 param1;
    u16 param2;
    u16 param3;
    u8 param4;
    u8 filler;
} TeachyTv_s;

extern TeachyTv_s gTeachyTV_StaticResources;
extern void * gUnknown_203F450;
void C2TeachyTv();
void C2TeachyTvMainCallback();
void VblankHandlerTeachyTv();
void sub_815ABC4(u8 mode, void (*cb)());
void CB2_ReturnToTeachyTV();
extern void sub_815AC20();
void TeachyTvCreateAndRenderRbox();
extern void TeachyTvInitIo();
extern u8 TeachyTvSetupObj();
extern void TeachyTvConfigRboxAndObj(u8);
extern u8 sub_815AEE8();
extern void sub_815AF5C();
extern void sub_815B094();
void TeachyTvSetupBg();
void TeachyTvLoadGraphic();
extern void TeachyTvTaskFunction(u8);
extern void sub_815B2C0(u8);
extern void VblankHblankHandlerSetZero();
extern void sub_812B1E0(u16);
extern struct BgTemplate gUnknown_84792E0;
extern void *gUnknown_203F450; // tilemap pointer location
extern u8 gUnknown_8E86240; // tilemap
extern u8 gUnknown_8E86BE8;
extern u8 gUnknown_8E86D6C;
extern u8 gUnknown_8E86F98; // pal
extern struct SpritePalette gUnknown_83A5348;
extern void sub_815BD80(void *);
typedef struct Task Task;
extern struct WindowTemplate gUnknown_84792F0;


void C2TeachyTv()
{
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    do_scheduled_bg_tilemap_copies_to_vram();
    UpdatePaletteFade();
}

void VblankHandlerTeachyTv()
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}

void sub_815ABC4(u8 mode, void (*cb)())
{
    // JZW: I'm sorry, but otherwise I can't make it match baserom
    TeachyTv_s *v3 = &gTeachyTV_StaticResources;
    u16 v4 = 0;
    v3->mode = mode;
    v3->callback = cb;
    if(!mode) {
        v3->param2 = v4;
        v3->param3 = v4;
        v3->param1 = 0;
    }
    if(mode == 1)
        v3->mode = 0;
    SetMainCallback2(C2TeachyTvMainCallback);
}

void CB2_ReturnToTeachyTV()
{
    if(gTeachyTV_StaticResources.mode == 1)
        sub_815ABC4(1,gTeachyTV_StaticResources.callback);
    else
        sub_815ABC4(2,gTeachyTV_StaticResources.callback);
}

void sub_815AC20()
{
    gTeachyTV_StaticResources.mode = 1;
}

void C2TeachyTvMainCallback()
{
    int state;
    void *mallocPtr;
    int taskId;
    Task *taskAddr;
    u8 **v4;
    u32 x;

    state = gMain.state;
    if ( state == 0 )
        goto section_0;
    else if ( state == 1 )
        goto section_1;
    else
        return;
    section_0:
        v4 = (u8 **)&gUnknown_203F450;
        (*v4) = (u8*)AllocZeroed(0x4008u);
        *(u32*)gUnknown_203F450 = (u32)state;
        *((u8*)gUnknown_203F450 + 0x4006) = state;
        *((u8*)gUnknown_203F450 + 0x4007) = 0xFF;
        VblankHblankHandlerSetZero();
        clear_scheduled_bg_copies_to_vram();
        ScanlineEffect_Stop();
        FreeAllSpritePalettes();
        ResetPaletteFade();
        ResetSpriteData();
        ResetTasks();
        TeachyTvSetupBg();
        TeachyTvLoadGraphic();
        ++gMain.state;
        return;
    section_1:
        if( free_temp_tile_data_buffers_if_possible() == 1 )
            return;
        TeachyTvCreateAndRenderRbox();
        TeachyTvInitIo();
        if ( gTeachyTV_StaticResources.mode == 2 )
        {
            taskId = CreateTask(TeachyTvTaskFunction, 0);
            gTasks[taskId].data[1] = TeachyTvSetupObj();
            TeachyTvConfigRboxAndObj(taskId);
        }
        else
        {
            taskId = CreateTask(sub_815B2C0, 0);
            x = (u32)sub_815AEE8();
            gTasks[taskId].data[0] = (x << 24) >> 24;
            gTasks[taskId].data[1] = TeachyTvSetupObj();
            sub_815AF5C();
            PlayNewMapMusic(BGM_FRLG_TEACHY_TV);
            sub_815B094();
        }
        schedule_bg_copy_tilemap_to_vram(0);
        schedule_bg_copy_tilemap_to_vram(1u);
        schedule_bg_copy_tilemap_to_vram(2u);
        schedule_bg_copy_tilemap_to_vram(3u);
        sub_812B1E0(9); // help system something
        BlendPalettes(0xFFFFFFFF, 0x10u, 0);
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 0x10u, 0, 0);
        SetVBlankCallback(VblankHandlerTeachyTv);
        SetMainCallback2(C2TeachyTv);
}

void TeachyTvSetupBg()
{
    InitBgReg();
    ResetBgsAndClearDma3BusyFlags(0);
    InitBgsFromTemplates(0, &gUnknown_84792E0, 4u);
    SetBgTilemapBuffer(1u, (u8 *)gUnknown_203F450 + 4);
    SetBgTilemapBuffer(2u, (u8 *)gUnknown_203F450 + 0x1004);
    SetBgTilemapBuffer(3u, (u8 *)gUnknown_203F450 + 0x2004);
    SetGpuReg(0, 0x3040u);
    ShowBg(0);
    ShowBg(1u);
    ShowBg(2u);
    ShowBg(3u);
    ChangeBgX(3u, 0x1000u, 2u);
    ChangeBgY(3u, 0x2800u, 1u);
    *((u8 *)gUnknown_203F450 + 0x4004) = 0;
    *((u8 *)gUnknown_203F450 + 0x4005) = 3;
    SetGpuReg(0x50u, 0);
}

void TeachyTvLoadGraphic()
{
    u16 src;
    src = 0;
    reset_temp_tile_data_buffers();
    decompress_and_copy_tile_data_to_vram(1u, &gUnknown_8E86240, 0, 0, 0);
    LZDecompressWram((u8 *)&gUnknown_8E86BE8, (*(u8 **)&gUnknown_203F450) + 4);
    LZDecompressWram((u8 *)&gUnknown_8E86D6C, (*(u8 **)&gUnknown_203F450) + 0x3004);
    LoadCompressedPalette(&gUnknown_8E86F98, 0, 0x80u);
    LoadPalette(&src, 0, 2u);
    LoadSpritePalette((struct SpritePalette *)&gUnknown_83A5348);
    sub_815BD80((u8 *)gUnknown_203F450 + 0x2004);
}

void TeachyTvCreateAndRenderRbox()
{
    InitWindows(&gUnknown_84792F0);
    DeactivateAllTextPrinters();
    FillWindowPixelBuffer(0, 0xCCu);
    PutWindowTilemap(0);
    PutWindowTilemap(1u);
    CopyWindowToVram(0, 2u);
}