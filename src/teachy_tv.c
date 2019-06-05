#include "main.h"
#include "global.h"
#include "task.h"
#include "menu.h"
#include "palette.h"
#include "sprite.h"
#include "menu_helpers.h"
#include "new_menu_helpers.h"
#include "sound.h"
#include "malloc.h"
#include "sprite.h"
#include "scanline_effect.h"
#include "bg.h"
#include "gpu_regs.h"
#include "decompress.h"
#include "window.h"
#include "list_menu.h"
#include "item_menu.h"
#include "item.h"
#include "menu_indicators.h"
#include "field_map_obj.h"
#include "random.h"
#include "text.h"
#include "constants/songs.h"
#include "constants/items.h"

typedef struct Task Task;

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
extern const struct ScrollIndicatorArrowPairTemplate gUnknown_8479380;
extern char gUnknown_841B83D;
extern struct BgTemplate gUnknown_84792E0;
extern struct SpritePalette gUnknown_83A5348;
extern void (**gUnknown_8479548)(u8);
extern char * gUnknown_8479560;
extern char * gUnknown_8479578;
extern void *gUnknown_203F450;
extern u8 gUnknown_8E86240;
extern u8 gUnknown_8E86BE8;
extern u8 gUnknown_8E86D6C;
extern u8 gUnknown_8E86F98;
extern struct ListMenuTemplate gUnknown_8479368;
extern struct ListMenuItem gUnknown_8479340;
extern struct WindowTemplate gUnknown_84792F0;
extern u8 gUnknown_8479590;
extern u8 gUnknown_8479390;

void C2TeachyTv();
void C2TeachyTvMainCallback();
void VblankHandlerTeachyTv();
void sub_815ABC4(u8 mode, void (*cb)());
void sub_815ABFC();
void sub_815AC20();
void TeachyTvCreateAndRenderRbox();
void TeachyTvInitIo();
u8 TeachyTvSetupObjEventAndOam();
void TeachyTvSetupPostBattleWindowAndObj(u8);
u8 TeachyTvSetupWindow();
void TeachyTvSetupScrollIndicatorArrowPair();
void TeachyTvSetWindowRegs();
void TeachyTvSetupBg();
void TeachyTvLoadGraphic();
void TeachyTvPostBattleFadeControl(u8);
void TeachyTvOptionListController(u8);
void TeachyTvAudioByInput(s32, bool8, struct ListMenu *);
void TeachyTvQuitFadeControlAndTaskDel(u8 taskId);
void TeachyTvRenderMsgAndSwitchClusterFuncs(u8 taskId);
void TeachyTvClearBg1EndGraphicText();
void TeachyTvBackToOptionList(u8 taskId);
void TeachyTvSetupBagItemsByOptionChosen();
void TeachyTvPrepBattle(u8 taskId);
void TeachyTvGrassAnimationMain(u8 taskId, s16 x, s16 y, u8 subpriority, bool8 mode);

extern void VblankHblankHandlerSetZero();
extern void sub_812B1E0(u16);
extern void sub_815BD80(void *);
extern u8 ListMenuInitInternal(struct ListMenuTemplate *, u16 scrollOffset, u16 selectedRow); 
extern void sub_8055DC4();
extern bool16 sub_80BF518(u8 textPrinterId);
extern void _call_via_r1(s32 arg, void *func);
extern void sub_810B108(u8);


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
    if(!mode)
    {
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
        goto RESETANDLOAD;
    else if ( state == 1 )
        goto SETDMATOVRAM;
    else
        return;
RESETANDLOAD:
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
SETDMATOVRAM:
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
        taskId = CreateTask(TeachyTvOptionListController, 0);
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

void TeachyTvSetupScrollIndicatorArrowPair()
{
    int hasItem;
    hasItem = (u8)CheckBagHasItem(ITEM_TM_CASE, 1u);
    if ( ! hasItem << 24 )
    {
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

void TeachyTvSetupPostBattleWindowAndObj(u8 taskId)
{
    u16 *v2 = gTasks[taskId].data;
    int v1 = ((s16 *)v2)[1];
    struct Sprite *v3 = &gSprites[v1];
    int op;

    ClearWindowTilemap(1u);
    TeachyTvClearWindowRegs();
    op = gTeachyTV_StaticResources.optionChosen;
    if ( op >= 0 )
    {
        if ( op <= 3 )
        {
            TeachyTvSetSpriteCoordsAndSwitchFrame(((char*)v2)[2], 0x78, 0x38, 0);
            ChangeBgX(3u, 0x3000u, 1u);
            ChangeBgY(3u, 0x3000u, 2u);
            *((u8 *)gUnknown_203F450 + 0x4004) += 3;
            *((u8 *)gUnknown_203F450 + 0x4005) -= 3;
        }
        else if ( op <= 5 )
            TeachyTvSetSpriteCoordsAndSwitchFrame(((char*)v2)[2], 0x78, 0x38, 0);
    }

    v2[4] = 0;
    v2[5] = 0;
    TeachyTvGrassAnimationMain(taskId, v3->pos2.x, v3->pos2.y, 0, 1u);
}

void TeachyTvInitTextPrinter(char *text)
{
    u8 spd;
    gTextFlags.autoScroll = 0;
    spd = GetTextSpeedSetting();
    AddTextPrinterParameterized2(0, 4u, (const u8 *)text, spd, 0, 1u, 0xCu, 3u);
}

void TeachyTvFree()
{
    Free(gUnknown_203F450);
    gUnknown_203F450 = NULL;
    FreeAllWindowBuffers();
}

void TeachyTvQuitBeginFade(u8 taskId)
{
    BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 0x10u, 0);
    gTasks[taskId].func = TeachyTvQuitFadeControlAndTaskDel;
}

void TeachyTvQuitFadeControlAndTaskDel(u8 taskId)
{
    if ( !(gPaletteFade.active) )
    {
        if ( *(u32 *)gUnknown_203F450 )
        {
            SetMainCallback2(*(void (**)())gUnknown_203F450);
        }
        else
        {
            sub_8055DC4();
            SetMainCallback2((void (*)())gTeachyTV_StaticResources.callback);
        }
        TeachyTvFree();
        DestroyTask(taskId);
    }
}

#ifdef NONMATCHING
void TeachyTvOptionListController(u8 taskId)
{
    char *v2;
    s32 v3;

    v2 = (char *)gTasks[taskId].data;
    TeachyTvBg2AnimController();
    if ( !(gPaletteFade.active) )
    {
        v3 = ListMenuHandleInput(*v2);
        ListMenuGetScrollAndRow(*v2, &gTeachyTV_StaticResources.scrollOffset, &gTeachyTV_StaticResources.selectedRow);
        if ( ((gMain.newKeys) & 4 && (gTeachyTV_StaticResources.callback != UseFameCheckerFromMenu))
          || (v3 == -2) )
        {
            PlaySE(SE_SELECT);
            TeachyTvQuitBeginFade(taskId);
        }
        else if ( v3 != -1 )
        {
            PlaySE(SE_SELECT);
            gTeachyTV_StaticResources.optionChosen = v3;
            DestroyListMenu(*v2, &gTeachyTV_StaticResources.scrollOffset, &gTeachyTV_StaticResources.selectedRow);
            TeachyTvClearWindowRegs();
            ClearWindowTilemap(1u);
            schedule_bg_copy_tilemap_to_vram(0);
            TeachyTvRemoveScrollIndicatorArrowPair();
            *((u16 *)v2 + 3) = 0;
            *((u16 *)v2 + 2) = 0;
            gTasks[taskId].func = TeachyTvRenderMsgAndSwitchClusterFuncs;
        }
    }
}

#else
__attribute__((naked))
void TeachyTvOptionListController(u8 taskId)
{
    asm_unified("\n\
        push {r4-r7,lr}\n\
        lsls r0, 24\n\
        lsrs r7, r0, 24\n\
        lsls r0, r7, 2\n\
        adds r0, r7\n\
        lsls r0, 3\n\
        ldr r1, _0815B31C @ =gTasks+0x8\n\
        adds r6, r0, r1\n\
        bl TeachyTvBg2AnimController\n\
        ldr r0, _0815B320 @ =gPaletteFade\n\
        ldrb r1, [r0, 0x7]\n\
        movs r0, 0x80\n\
        ands r0, r1\n\
        cmp r0, 0\n\
        bne _0815B37A\n\
        ldrb r0, [r6]\n\
        bl ListMenuHandleInput\n\
        adds r5, r0, 0\n\
        ldrb r0, [r6]\n\
        ldr r4, _0815B324 @ =gTeachyTV_StaticResources+6\n\
        adds r2, r4, 0x2\n\
        adds r1, r4, 0\n\
        bl ListMenuGetScrollAndRow\n\
        ldr r0, _0815B328 @ =gMain\n\
        ldrh r1, [r0, 0x2E]\n\
        movs r0, 0x4\n\
        ands r0, r1\n\
        cmp r0, 0\n\
        beq _0815B30A\n\
        subs r0, r4, 0x6\n\
        ldr r1, [r0]\n\
        ldr r0, _0815B32C @ =UseFameCheckerFromMenu\n\
        cmp r1, r0\n\
        bne _0815B330\n\
    _0815B30A:\n\
        movs r0, 0x2\n\
        negs r0, r0\n\
        cmp r5, r0\n\
        beq _0815B330\n\
        adds r0, 0x1\n\
        cmp r5, r0\n\
        bne _0815B33E\n\
        b _0815B37A\n\
        .align 2, 0\n\
    _0815B31C: .4byte gTasks+0x8\n\
    _0815B320: .4byte gPaletteFade\n\
    _0815B324: .4byte gTeachyTV_StaticResources+6\n\
    _0815B328: .4byte gMain\n\
    _0815B32C: .4byte UseFameCheckerFromMenu\n\
    _0815B330:\n\
        movs r0, 0x5\n\
        bl PlaySE\n\
        adds r0, r7, 0\n\
        bl TeachyTvQuitBeginFade\n\
        b _0815B37A\n\
    _0815B33E:\n\
        movs r0, 0x5\n\
        bl PlaySE\n\
        ldr r2, _0815B380 @ =gTeachyTV_StaticResources\n\
        movs r4, 0\n\
        strb r5, [r2, 0x5]\n\
        ldrb r0, [r6]\n\
        adds r1, r2, 0x6\n\
        adds r2, 0x8\n\
        bl DestroyListMenu\n\
        bl TeachyTvClearWindowRegs\n\
        movs r0, 0x1\n\
        bl ClearWindowTilemap\n\
        movs r0, 0\n\
        bl schedule_bg_copy_tilemap_to_vram\n\
        bl TeachyTvRemoveScrollIndicatorArrowPair\n\
        strh r4, [r6, 0x6]\n\
        strh r4, [r6, 0x4]\n\
        ldr r1, _0815B384 @ =gTasks\n\
        lsls r0, r7, 2\n\
        adds r0, r7\n\
        lsls r0, 3\n\
        adds r0, r1\n\
        ldr r1, _0815B388 @ =TeachyTvRenderMsgAndSwitchClusterFuncs\n\
        str r1, [r0]\n\
    _0815B37A:\n\
        pop {r4-r7}\n\
        pop {r0}\n\
        bx r0\n\
        .align 2, 0\n\
    _0815B380: .4byte gTeachyTV_StaticResources\n\
    _0815B384: .4byte gTasks\n\
    _0815B388: .4byte TeachyTvRenderMsgAndSwitchClusterFuncs\n\
        ");
}
#endif

void TeachyTvClusFuncTransitionRenderBg2TeachyTvGraphicInitNpcPos(u8 taskId)
{
    u16 *data;
    u32 counter;

    data = (u16 *)gTasks[taskId].data;
    TeachyTvBg2AnimController();
    counter = data[2] + 1;
    data[2] = counter;
    if ( (s16)counter > 63 )
    {
        CopyToBgTilemapBufferRect_ChangePalette(2u, (u8 *)gUnknown_203F450 + 0x3004, 0, 0, 0x20u, 0x20u, 0x11u);
        TeachyTvSetSpriteCoordsAndSwitchFrame(((u8*)data)[2], 8, 0x38, 7u);
        schedule_bg_copy_tilemap_to_vram(2u);
        data[2] = 0;
        ++data[3];
        PlayNewMapMusic(BGM_FRLG_FOLLOW_ME);
    }
}

void TeachyTvClusFuncClearBg2TeachyTvGraphic(u8 taskId)
{
    u16 *data;
    u32 counter;

    data = (u16*)gTasks[taskId].data;
    counter = data[2] + 1;
    data[2] = counter;
    if ( (s16)counter == 134 )
    {
        FillBgTilemapBufferRect_Palette0(2u, 0, 2u, 1u, 0x1Au, 0xCu);
        schedule_bg_copy_tilemap_to_vram(2u);
        data[2] = 0;
        ++data[3];
    }
}

void TeachyTvClusFuncNpcMoveAndSetupTextPrinter(u8 taskId)
{
    s16 *data;
    struct Sprite * spriteAddr;

    data = gTasks[taskId].data;
    spriteAddr = &gSprites[data[1]];
    if ( data[2] != 35 )
        ++data[2];
    else {
        if ( spriteAddr->pos2.x == 0x78 )
        {
            StartSpriteAnim(&gSprites[data[1]], 0);
            TeachyTvInitTextPrinter(&gUnknown_841B83D);
            data[2] = 0;
            ++data[3];
        }
        else
            ++spriteAddr->pos2.x;
    }   
}

void TeachyTvClusFuncIdleIfTextPrinterIsActive(u8 taskId)
{
    u16* data = (u16 *)gTasks[taskId].data;
    if ( !(sub_80BF518(0) << 16) )
        ++data[3];
}

void TeachyTvRenderMsgAndSwitchClusterFuncs(u8 taskId)
{
    u16 *data;
    data = gTasks[taskId].data;
    if ( gMain.newKeys & 2 )
    {
        char *offset = ((char *)gUnknown_203F450 + 0x4006);
        u32 v4 = 0;
        offset[0] = 1;
        TeachyTvSetSpriteCoordsAndSwitchFrame(*((char *)data + 2), 0, 0, 0);
        FillWindowPixelBuffer(0, 0xCCu);
        CopyWindowToVram(0, 2u);
        TeachyTvClearBg1EndGraphicText();
        data[2] = v4;
        data[3] = v4;
        gTasks[taskId].func = TeachyTvBackToOptionList;
    }
    else
    {
        void (***array)(u8) = &gUnknown_8479548;
        void (**cluster)(u8) = array[(u8)gTeachyTV_StaticResources.optionChosen];
        _call_via_r1(
            taskId,
            cluster[(s16)data[3]]);
    }
}

void TeachyTvClusFuncTextPrinterSwitchStringByOptionChosen(u8 taskId)
{
    u16 *data = (u16 *)gTasks[taskId].data;
    char ** texts = &gUnknown_8479560;
    TeachyTvInitTextPrinter(texts[gTeachyTV_StaticResources.optionChosen]);
    ++data[3];
}

void TeachyTvClusFuncTextPrinterSwitchStringByOptionChosen2(u8 taskId)
{
    u16 *data = (u16 *)gTasks[taskId].data;
    char ** texts = &gUnknown_8479578;
    TeachyTvInitTextPrinter(texts[gTeachyTV_StaticResources.optionChosen]);
    ++data[3];
}

void TeachyTvClusFuncIdleIfTextPrinterIsActive2(u8 taskId)
{
    u16* data = (u16 *)gTasks[taskId].data;
    if ( !(sub_80BF518(0) << 16) )
        ++data[3];
}

void TeachyTvClusFuncEraseTextWindowIfKeyPressed(u8 taskId)
{
    u16 *data;
    data = (u16 *)gTasks[taskId].data;
    if ( gMain.newKeys & 3 )
    {
        FillWindowPixelBuffer(0, 0xCCu);
        CopyWindowToVram(0, 2u);
        ++data[3];
    }
}

void TeachyTvClusFuncStartAnimNpcWalkIntoGrass(u8 taskId)
{
    u16 *data;
    data = (u16 *)gTasks[taskId].data;
    StartSpriteAnim(&gSprites[(s16)data[1]], 5u);
    data[2] = 0;
    data[4] = 0;
    data[5] = 1;
    ++data[3];
}

void TeachyTvClusFuncDudeMoveUp(u8 taskId)
{
    s16 *data;
    struct Sprite *v3;
    int temp;
    int v4;

    data = gTasks[taskId].data;
    v3 = &gSprites[data[1]];
    ChangeBgY(3u, 0x100u, 2u);
    v4 = (u16)data[2] + 1;
    ((u16*)data)[2] = v4;
    if ( !( v4 % 16 ) )
    {
        --((u8*)gUnknown_203F450)[0x4005];
        TeachyTvGrassAnimationMain(taskId, v3->pos2.x, v3->pos2.y, 0, 0);
    }
    if ( data[2] == 0x30 )
    {
        data[2] = 0;
        data[4] = -1;
        data[5] = 0;
        StartSpriteAnim(v3, 7u);
        ++data[3];
    }
}

void TeachyTvClusFuncDudeMoveRight(u8 taskId)
{
    u16 *data;
    struct Sprite *v3;
    int v4;

    data = (u16 *)gTasks[taskId].data;
    v3 = &gSprites[(s16)data[1]];
    ChangeBgX(3u, 0x100u, 1u);
    v4 = data[2] + 1;
    data[2] = v4;
    if ( !(v4 & 0xF) )
        ++((u8*)gUnknown_203F450)[0x4004];
    if ( !((((s16*)data)[2] + 8) & 0xF) )
        TeachyTvGrassAnimationMain(taskId, v3->pos2.x + 8, v3->pos2.y, 0, 0);
    if ( (s16)data[2] == 0x30 )
    {
        data[2] = 0;
        data[4] = 0;
        data[5] = 0;
        StartSpriteAnim(v3, 3u);
        ++data[3];
    }
}

void TeachyTvClusFuncDudeTurnLeft(u8 taskId)
{
    s16 *data;
    struct Sprite *v3;

    data = gTasks[taskId].data;
    v3 = &gSprites[data[1]];
    StartSpriteAnim(v3, 6u);
    ++(u16)data[3];
    data[4] = 0;
    data[5] = 0;
    TeachyTvGrassAnimationMain(taskId, v3->pos2.x, v3->pos2.y, 0, 0);
}

void TeachyTvClusFuncDudeMoveLeft(u8 taskId)
{
    s16 *data;
    struct Sprite *v2;

    data = gTasks[taskId].data;
    v2 = &gSprites[data[1]];

    if ( !(v2->pos2.x & 0xF) )
        TeachyTvGrassAnimationMain(taskId, v2->pos2.x - 8, v2->pos2.y, 0, 0);
    if ( v2->pos2.x == 8 )
        ++(u16)data[3];
    else
        --v2->pos2.x;
}

void TeachyTvClusFuncRenderAndRemoveBg1EndGraphic(u8 taskId)
{
    s16 *data;
    int temp;

    data = gTasks[taskId].data;
    if ( !data[2] )
    {
        CopyToBgTilemapBufferRect_ChangePalette(1u, &gUnknown_8479590, 0x14u, 0xAu, 8u, 2u, 0x11u);
        schedule_bg_copy_tilemap_to_vram(1u);
    }
    temp = (u16)data[2] + 1;
    data[2] = temp;
    if ( (s16)temp > 126 )
    {
        TeachyTvClearBg1EndGraphicText();
        (u16)data[2] = 0;
        ++(u16)data[3];
    }
}

void TeachyTvClearBg1EndGraphicText()
{
    FillBgTilemapBufferRect_Palette0(1u, 0, 0x14u, 0xAu, 8u, 2u);
    schedule_bg_copy_tilemap_to_vram(1u);
}

void TeachyTvBackToOptionList(u8 taskId)
{
    s16 *data;
    s32 temp;

    data = gTasks[taskId].data;
    if ( !data[2] )
        PlayNewMapMusic(BGM_FRLG_TEACHY_TV);
    TeachyTvBg2AnimController();
    temp = (u16)data[2] + 1;
    data[2] = temp;
    if ( (s16)temp > 0x3F )
    {
        data[2] = 0;
        data[3] = 0;
        *data = TeachyTvSetupWindow();
        gTasks[taskId].func = TeachyTvOptionListController;
        PutWindowTilemap(0);
        TeachyTvSetupScrollIndicatorArrowPair();
        TeachyTvSetWindowRegs();
        schedule_bg_copy_tilemap_to_vram(0);
        ChangeBgX(3u, 0, 0);
        ChangeBgY(3u, 0, 0);
        ChangeBgX(3u, 0x1000u, 2u);
        ChangeBgY(3u, 0x2800u, 1u);
        ((u8*)gUnknown_203F450)[0x4004] = 0;
        ((u8*)gUnknown_203F450)[0x4005] = 3;
        ((u8*)gUnknown_203F450)[0x4006] = 0;
    }
}

void TeachyTvChainTaskBattleOrFadeByOptionChosen(u8 taskId)
{
    int op = gTeachyTV_StaticResources.optionChosen;
    if( op < 0 )
        return;
    if ( op <= 3 )
    {
        TeachyTvPrepBattle(taskId);

    }
    else if ( op <= 5 )
    {
        *((void(**)())gUnknown_203F450) = TeachyTvSetupBagItemsByOptionChosen;
        TeachyTvQuitBeginFade(taskId);
    }
}

void TeachyTvSetupBagItemsByOptionChosen()
{
    if ( gTeachyTV_StaticResources.optionChosen == 4 )
        sub_810B108(0xAu);
    else
        sub_810B108(9u);
}

void TeachyTvPostBattleFadeControl(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    if ( !(gPaletteFade.active) )
    {
        u8* funcIdx = &gUnknown_8479390;
        int arg = funcIdx[gTeachyTV_StaticResources.optionChosen];
        data[3] = arg;
        gTasks[taskId].func = TeachyTvRenderMsgAndSwitchClusterFuncs;
    }
}

