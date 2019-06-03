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
#include "menu_indicators.h"
#include "field_map_obj.h"
#include "random.h"
#include "text.h"
#include "constants/songs.h"
#include "constants/items.h"

typedef struct {
    void (*callback)();
    u8 mode;
    u8 optionChosen;
    u16 scrollOffset;
    u16 selectedRow;
    u8 param4;
    u8 filler;
} TeachyTv_s;

extern TeachyTv_s gTeachyTV_StaticResources;
extern void * gUnknown_203F450;
void C2TeachyTv();
void C2TeachyTvMainCallback();
void VblankHandlerTeachyTv();
void sub_815ABC4(u8 mode, void (*cb)());
void sub_815ABFC();
extern void sub_815AC20();
void TeachyTvCreateAndRenderRbox();
void TeachyTvInitIo();
u8 TeachyTvSetupObjEventAndOam();
extern void TeachyTvSetupPostBattleWindowAndObj(u8);
u8 TeachyTvSetupWindow();
void TeachyTvSetupScrollIndicatorArrowPair();
void TeachyTvSetWindowRegs();
void TeachyTvSetupBg();
void TeachyTvLoadGraphic();
extern void TeachyTvPostBattleFadeControl(u8);
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
    TeachyTv_s *v3 = &gTeachyTV_StaticResources;
    u16 v4 = 0;
    v3->mode = mode;
    v3->callback = cb;
    if(!mode) {
        v3->scrollOffset = v4;
        v3->selectedRow = v4;
        v3->optionChosen = 0;
    }
    if(mode == 1)
        v3->mode = 0;
    SetMainCallback2(C2TeachyTvMainCallback);
}

void sub_815ABFC()
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
    int taskId;
    Task *taskAddr;
    u8 **v4;
    u32 x;

    state = gMain.state;
    // tried several ways to reproduce the control flow, but all failed. Now using goto
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
            taskId = CreateTask(TeachyTvPostBattleFadeControl, 0);
            gTasks[taskId].data[1] = TeachyTvSetupObjEventAndOam();
            TeachyTvSetupPostBattleWindowAndObj(taskId);
        }
        else
        {
            taskId = CreateTask(sub_815B2C0, 0);
            x = (u32)TeachyTvSetupWindow();
            gTasks[taskId].data[0] = (x << 24) >> 24;
            gTasks[taskId].data[1] = TeachyTvSetupObjEventAndOam();
            TeachyTvSetupScrollIndicatorArrowPair();
            PlayNewMapMusic(BGM_FRLG_TEACHY_TV);
            TeachyTvSetWindowRegs();
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

extern struct ListMenuTemplate gUnknown_8479368;
extern struct ListMenuItem gUnknown_8479340;
extern u8 ListMenuInitInternal(struct ListMenuTemplate *, u16 scrollOffset, u16 selectedRow); 
void TeachyTvAudioByInput(s32, bool8, struct ListMenu *);

u8 TeachyTvSetupWindow()
{
    int hasItem;
    gMultiuseListMenuTemplate = gUnknown_8479368;
    gMultiuseListMenuTemplate.windowId = 1;
    gMultiuseListMenuTemplate.moveCursorFunc = TeachyTvAudioByInput;
    hasItem = (u8)CheckBagHasItem(ITEM_TM_CASE, 1u);
    if ( !(hasItem << 24) )
    {
        gMultiuseListMenuTemplate.items = &gUnknown_8479340;
        gMultiuseListMenuTemplate.totalItems = 5;
        gMultiuseListMenuTemplate.maxShowed = 5;
        gMultiuseListMenuTemplate.upText_Y = (gMultiuseListMenuTemplate.upText_Y + 8) & 0xF;
    }
    return ListMenuInit(
               &gMultiuseListMenuTemplate,
               gTeachyTV_StaticResources.scrollOffset,
               gTeachyTV_StaticResources.selectedRow);
}

extern const struct ScrollIndicatorArrowPairTemplate gUnknown_8479380;

void TeachyTvSetupScrollIndicatorArrowPair()
{
    int hasItem;
    hasItem = (u8)CheckBagHasItem(ITEM_TM_CASE, 1u);
    if ( ! hasItem << 24 ) {
        u8 * temp = (u8 *)gUnknown_203F450;
        *((u8 *)temp + 0x4007) = 0xFF;
    }

    else {
        u8 *temp, res;
        res = AddScrollIndicatorArrowPair(
                                                    &gUnknown_8479380,
                                                    &(gTeachyTV_StaticResources.scrollOffset));
        temp = (u8 *)gUnknown_203F450;
        *((u8 *)temp + 0x4007) = res;
        }
}

void TeachyTvRemoveScrollIndicatorArrowPair()
{
    u8 *temp = ((u8*)gUnknown_203F450 + 0x4007);
    if ( *temp != 0xFF )
    {
        RemoveScrollIndicatorArrowPair(*temp);
        *((u8*)gUnknown_203F450 + 0x4007) = 0xFF;
    }
}

void TeachyTvAudioByInput(s32 notUsed, bool8 play, struct ListMenu *notUsedAlt)
{
    if ( play != 1 )
        PlaySE(SE_SELECT);
}

void TeachyTvInitIo()
{
    SetGpuReg(0x48u, 0x3Fu);
    SetGpuReg(0x4Au, 0x1Fu);
    SetGpuReg(0x50u, 0xCCu);
    SetGpuReg(0x54u, 5u);
}

u8 TeachyTvSetupObjEventAndOam()
{
    u8 temp = AddPseudoEventObject(90, SpriteCallbackDummy, 0, 0, 8);
    gSprites[temp].oam.priority = 2;
    gSprites[temp].invisible = 1;
    return temp;
}

void TeachyTvSetSpriteCoordsAndSwitchFrame(u8 objId, u16 x, u16 y, u8 frame)
{
    gSprites[objId].pos2.x = x;
    gSprites[objId].pos2.y = y;
    gSprites[objId].invisible = 0;
    StartSpriteAnim(&gSprites[objId], frame);
}

void TeachyTvSetWindowRegs()
{
    SetGpuReg(0x44u, 0xC64u);
    SetGpuReg(0x40u, 0x1CD4u);
}

void TeachyTvClearWindowRegs()
{
    SetGpuReg(0x44u, 0);
    SetGpuReg(0x40u, 0);
}

void TeachyTvBg2AnimController()
{
    u16 *tilemapBuffer;
    u8 counter;
    u32 offset2;
    u32 offset;
    u32 counter2;

    tilemapBuffer = (u16 *)GetBgTilemapBuffer(2u);
    counter = 1;
    do
    {
        offset2 = 2;
        offset = 0x20 * counter;
        counter2 = counter + 1;
        do
        {
            tilemapBuffer[offset + offset2] = ((Random() & 3) << 10) + 0x301F;
            offset2 = (offset2 + 1) << 0x18 >> 0x18;
        }
        while ( offset2 <= 0x1B );
        counter = counter2;
    }
    while ( counter2 << 0x18 >> 0x18 <= 0xCu );
    schedule_bg_copy_tilemap_to_vram(2u);
}

