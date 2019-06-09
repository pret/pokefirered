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
#include "event_data.h"
#include "load_save.h"
#include "battle_transition.h"
#include "battle_2.h"
#include "battle.h"
#include "global.fieldmap.h"
#include "teachy_tv.h"

struct TeachyTvCtrlBlk
{
    void (*callback)();
    u8 mode;
    u8 optionChosen;
    u16 scrollOffset;
    u16 selectedRow;
    u16 filler;
};

extern struct TeachyTvCtrlBlk gTeachyTV_StaticResources;
extern void * gUnknown_203F450;
extern const struct ScrollIndicatorArrowPairTemplate gUnknown_8479380;
extern const char gUnknown_841B83D;
extern const struct BgTemplate gUnknown_84792E0;
extern const struct SpritePalette gUnknown_83A5348;
extern void (**gUnknown_8479548)(u8);
extern const char * const gUnknown_8479560;
extern const char * const gUnknown_8479578;
extern const u8 gUnknown_8E86240;
extern const u8 gUnknown_8E86BE8;
extern const u8 gUnknown_8E86D6C;
extern const u8 gUnknown_8E86F98;
extern const struct ListMenuTemplate gUnknown_8479368;
extern const struct ListMenuItem gUnknown_8479340;
extern const struct WindowTemplate gUnknown_84792F0;
extern const u8 gUnknown_8479590;
extern const u8 gUnknown_8479390;
extern const struct SubspriteTable gUnknown_84795B8;
extern const struct SpriteTemplate * const gUnknown_83A0010;
extern const u8 gUnknown_84795C8;
extern const struct MapData Route1_Layout;

extern void VblankHblankHandlerSetZero();
extern void sub_812B1E0(u16);
extern u8 ListMenuInitInternal(struct ListMenuTemplate *, u16 scrollOffset, u16 selectedRow); 
extern void sub_8055DC4();
extern bool16 sub_80BF518(u8 textPrinterId);
extern void _call_via_r1(s32 arg, void *func);
extern void sub_810B108(u8);
extern void sub_8159F40();

void TeachyTvCallback();
void TeachyTvMainCallback();
void TeachyTvVblankHandler();
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
void TeachyTvLoadBg3Map(void *);
u8 TeachyTvGrassAnimationCheckIfNeedsToGenerateGrassObj(s16 x, s16 y);
void TeachyTvGrassAnimationObjCallback(struct Sprite *sprite);
void TeachyTvRestorePlayerPartyCallback();
void TeachyTvPreBattleAnimAndSetBattleCallback(u8 taskId);
void TeachyTvLoadMapTilesetToBuffer(struct Tileset *ts, u8 *dstBuffer, u16 size);
void TeachyTvPushBackNewMapPalIndexArrayEntry(struct MapData *mStruct, u16 *buf1, u8 *palIndexArray, u16 mapEntry, u16 offset);
void TeachyTvComputeMapTilesFromTilesetAndMetaTiles(u16 *metaTilesArray, u8 *blockBuf, u8 *tileset);
void TeachyTvComputeSingleMapTileBlockFromTilesetAndMetaTiles(u8 *blockBuf, u8 *tileset, u8 metaTile);
u16 TeachyTvComputePalIndexArrayEntryByMetaTile(u8 *palIndexArrayBuf, u16 metaTile);
void TeachyTvLoadMapPalette(const struct MapData *const mStruct, u8 *palIndexArray);

void TeachyTvCallback()
{
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    do_scheduled_bg_tilemap_copies_to_vram();
    UpdatePaletteFade();
}

void TeachyTvVblankHandler()
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}

void sub_815ABC4(u8 mode, void (*cb)())
{
    struct TeachyTvCtrlBlk *resAddr = &gTeachyTV_StaticResources;
    u16 zero = 0;
    resAddr->mode = mode;
    resAddr->callback = cb;
    if (!mode)
    {
        resAddr->scrollOffset = zero;
        resAddr->selectedRow = zero;
        resAddr->optionChosen = 0;
    }
    if (mode == 1)
        resAddr->mode = 0;
    SetMainCallback2(TeachyTvMainCallback);
}

void sub_815ABFC()
{
    if (gTeachyTV_StaticResources.mode == 1)
        sub_815ABC4(1, gTeachyTV_StaticResources.callback);
    else
        sub_815ABC4(2, gTeachyTV_StaticResources.callback);
}

void sub_815AC20()
{
    gTeachyTV_StaticResources.mode = 1;
}

void TeachyTvMainCallback()
{
    int state;
    int taskId;
    struct Task *taskAddr;
    u8 **memBuf;
    u32 x;

    state = gMain.state;
    switch (state)
    {
    case 0:
        memBuf = (u8 **)&gUnknown_203F450;
        (*memBuf) = (u8*)AllocZeroed(0x4008);
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
        break;
    case 1:
        if ( free_temp_tile_data_buffers_if_possible() == 1 )
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
        schedule_bg_copy_tilemap_to_vram(1);
        schedule_bg_copy_tilemap_to_vram(2);
        schedule_bg_copy_tilemap_to_vram(3);
        sub_812B1E0(9); // help system something
        BlendPalettes(0xFFFFFFFF, 0x10, 0);
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 0x10, 0, 0);
        SetVBlankCallback(TeachyTvVblankHandler);
        SetMainCallback2(TeachyTvCallback);
        break;
    }
}

void TeachyTvSetupBg()
{
    InitBgReg();
    ResetBgsAndClearDma3BusyFlags(0);
    InitBgsFromTemplates(0, &gUnknown_84792E0, 4);
    SetBgTilemapBuffer(1, (u8 *)gUnknown_203F450 + 4);
    SetBgTilemapBuffer(2, (u8 *)gUnknown_203F450 + 0x1004);
    SetBgTilemapBuffer(3, (u8 *)gUnknown_203F450 + 0x2004);
    SetGpuReg(REG_OFFSET_DISPCNT, 0x3040);
    ShowBg(0);
    ShowBg(1);
    ShowBg(2);
    ShowBg(3);
    ChangeBgX(3, 0x1000, 2);
    ChangeBgY(3, 0x2800, 1);
    *((u8 *)gUnknown_203F450 + 0x4004) = 0;
    *((u8 *)gUnknown_203F450 + 0x4005) = 3;
    SetGpuReg(REG_OFFSET_BLDCNT, 0);
}

void TeachyTvLoadGraphic()
{
    u16 src;
    src = 0;
    reset_temp_tile_data_buffers();
    decompress_and_copy_tile_data_to_vram(1, &gUnknown_8E86240, 0, 0, 0);
    LZDecompressWram(&gUnknown_8E86BE8, (*(u8 **)&gUnknown_203F450) + 0x4);
    LZDecompressWram(&gUnknown_8E86D6C, (*(u8 **)&gUnknown_203F450) + 0x3004);
    LoadCompressedPalette(&gUnknown_8E86F98, 0, 0x80);
    LoadPalette(&src, 0, 2);
    LoadSpritePalette(&gUnknown_83A5348);
    TeachyTvLoadBg3Map((u8 *)gUnknown_203F450 + 0x2004);
}

void TeachyTvCreateAndRenderRbox()
{
    InitWindows(&gUnknown_84792F0);
    DeactivateAllTextPrinters();
    FillWindowPixelBuffer(0, 0xCC);
    PutWindowTilemap(0);
    PutWindowTilemap(1);
    CopyWindowToVram(0, 2);
}

u8 TeachyTvSetupWindow()
{
    int hasItem;
    gMultiuseListMenuTemplate = gUnknown_8479368;
    gMultiuseListMenuTemplate.windowId = 1;
    gMultiuseListMenuTemplate.moveCursorFunc = TeachyTvAudioByInput;
    hasItem = (u8)CheckBagHasItem(ITEM_TM_CASE, 1);
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
    hasItem = (u8)CheckBagHasItem(ITEM_TM_CASE, 1);
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
    SetGpuReg(REG_OFFSET_WININ, 0x3F);
    SetGpuReg(REG_OFFSET_WINOUT, 0x1F);
    SetGpuReg(REG_OFFSET_BLDCNT, 0xCC);
    SetGpuReg(REG_OFFSET_BLDY, 0x5);
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
    SetGpuReg(REG_OFFSET_WIN0V, 0xC64);
    SetGpuReg(REG_OFFSET_WIN0H, 0x1CD4);
}

void TeachyTvClearWindowRegs()
{
    SetGpuReg(REG_OFFSET_WIN0V, 0x0);
    SetGpuReg(REG_OFFSET_WIN0H, 0x0);
}

void TeachyTvBg2AnimController()
{
    u16 *tilemapBuffer;
    u8 i;
    u32 offset, offset2, j;

    tilemapBuffer = (u16 *)GetBgTilemapBuffer(2);
    i = 1;
    do
    {
        offset2 = 2;
        offset = 0x20 * i;
        j = i + 1;
        do
        {
            tilemapBuffer[offset + offset2] = ((Random() & 3) << 10) + 0x301F;
            offset2 = (offset2 + 1) << 0x18 >> 0x18;
        }
        while ( offset2 <= 0x1B );
        i = j;
    }
    while ( j << 0x18 >> 0x18 <= 0xC );
    schedule_bg_copy_tilemap_to_vram(2);
}

void TeachyTvSetupPostBattleWindowAndObj(u8 taskId)
{
    u16 *v2 = gTasks[taskId].data;
    int v1 = ((s16 *)v2)[1];
    struct Sprite *v3 = &gSprites[v1];
    int op;

    ClearWindowTilemap(1);
    TeachyTvClearWindowRegs();
    op = gTeachyTV_StaticResources.optionChosen;
    if ( op >= 0 )
    {
        if ( op <= 3 )
        {
            TeachyTvSetSpriteCoordsAndSwitchFrame(((char*)v2)[2], 0x78, 0x38, 0);
            ChangeBgX(3, 0x3000, 1);
            ChangeBgY(3, 0x3000, 2);
            *((u8 *)gUnknown_203F450 + 0x4004) += 3;
            *((u8 *)gUnknown_203F450 + 0x4005) -= 3;
        }
        else if ( op <= 5 )
            TeachyTvSetSpriteCoordsAndSwitchFrame(((char*)v2)[2], 0x78, 0x38, 0);
    }

    v2[4] = 0;
    v2[5] = 0;
    TeachyTvGrassAnimationMain(taskId, v3->pos2.x, v3->pos2.y, 0, 1);
}

void TeachyTvInitTextPrinter(const char *text)
{
    u8 spd;
    gTextFlags.autoScroll = 0;
    spd = GetTextSpeedSetting();
    AddTextPrinterParameterized2(0, 4, (const char *)text, spd, 0, 1, 0xC, 3);
}

void TeachyTvFree()
{
    Free(gUnknown_203F450);
    gUnknown_203F450 = NULL;
    FreeAllWindowBuffers();
}

void TeachyTvQuitBeginFade(u8 taskId)
{
    BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 0x10, 0);
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
            ClearWindowTilemap(1);
            schedule_bg_copy_tilemap_to_vram(0);
            TeachyTvRemoveScrollIndicatorArrowPair();
            *((u16 *)v2 + 3) = 0;
            *((u16 *)v2 + 2) = 0;
            gTasks[taskId].func = TeachyTvRenderMsgAndSwitchClusterFuncs;
        }
    }
}

#else
NAKED
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
    s16 *data = gTasks[taskId].data;
    TeachyTvBg2AnimController();
    if ( ++data[2] > 63 )
    {
        CopyToBgTilemapBufferRect_ChangePalette(2, (u8 *)gUnknown_203F450 + 0x3004, 0, 0, 0x20, 0x20, 0x11);
        TeachyTvSetSpriteCoordsAndSwitchFrame(((u8*)data)[2], 8, 0x38, 7);
        schedule_bg_copy_tilemap_to_vram(2);
        data[2] = 0;
        ++data[3];
        PlayNewMapMusic(BGM_FRLG_FOLLOW_ME);
    }
}

void TeachyTvClusFuncClearBg2TeachyTvGraphic(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    if ( ++data[2] == 134 )
    {
        FillBgTilemapBufferRect_Palette0(2, 0, 2, 1, 0x1A, 0xC);
        schedule_bg_copy_tilemap_to_vram(2);
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
        FillWindowPixelBuffer(0, 0xCC);
        CopyWindowToVram(0, 2);
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
    const char * const* texts = &gUnknown_8479560;
    TeachyTvInitTextPrinter(texts[gTeachyTV_StaticResources.optionChosen]);
    ++data[3];
}

void TeachyTvClusFuncTextPrinterSwitchStringByOptionChosen2(u8 taskId)
{
    u16 *data = (u16 *)gTasks[taskId].data;
    const char * const* texts = &gUnknown_8479578;
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
        FillWindowPixelBuffer(0, 0xCC);
        CopyWindowToVram(0, 2);
        ++data[3];
    }
}

void TeachyTvClusFuncStartAnimNpcWalkIntoGrass(u8 taskId)
{
    u16 *data;
    data = (u16 *)gTasks[taskId].data;
    StartSpriteAnim(&gSprites[(s16)data[1]], 5);
    data[2] = 0;
    data[4] = 0;
    data[5] = 1;
    ++data[3];
}

void TeachyTvClusFuncDudeMoveUp(u8 taskId)
{
    s16 *data;
    struct Sprite *obj;
    int temp;
    int counter;

    data = gTasks[taskId].data;
    obj = &gSprites[data[1]];
    ChangeBgY(3, 0x100, 2);
    counter = (u16)data[2] + 1;
    ((u16*)data)[2] = counter;
    if ( !( counter % 16 ) )
    {
        --((u8*)gUnknown_203F450)[0x4005];
        TeachyTvGrassAnimationMain(taskId, obj->pos2.x, obj->pos2.y, 0, 0);
    }
    if ( data[2] == 48 )
    {
        data[2] = 0;
        data[4] = -1;
        data[5] = 0;
        StartSpriteAnim(obj, 7);
        ++data[3];
    }
}

void TeachyTvClusFuncDudeMoveRight(u8 taskId)
{
    s16 *data;
    struct Sprite *obj;

    data = (u16 *)gTasks[taskId].data;
    obj = &gSprites[(s16)data[1]];
    ChangeBgX(3, 0x100, 1);
    if ( !(++data[2] & 0xF) )
        ++((u8*)gUnknown_203F450)[0x4004];
    if ( !((((s16*)data)[2] + 8) & 0xF) )
        TeachyTvGrassAnimationMain(taskId, obj->pos2.x + 8, obj->pos2.y, 0, 0);
    if ( data[2] == 0x30 )
    {
        data[2] = 0;
        data[4] = 0;
        data[5] = 0;
        StartSpriteAnim(obj, 3);
        ++data[3];
    }
}

void TeachyTvClusFuncDudeTurnLeft(u8 taskId)
{
    s16 *data;
    struct Sprite *v3;

    data = gTasks[taskId].data;
    v3 = &gSprites[data[1]];
    StartSpriteAnim(v3, 6);
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
        CopyToBgTilemapBufferRect_ChangePalette(1, &gUnknown_8479590, 0x14, 0xA, 8, 2, 0x11);
        schedule_bg_copy_tilemap_to_vram(1);
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
    FillBgTilemapBufferRect_Palette0(1, 0, 0x14, 0xA, 8, 2);
    schedule_bg_copy_tilemap_to_vram(1);
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
        ChangeBgX(3, 0x0, 0);
        ChangeBgY(3, 0x0, 0);
        ChangeBgX(3, 0x1000, 2);
        ChangeBgY(3, 0x2800, 1);
        ((u8*)gUnknown_203F450)[0x4004] = 0;
        ((u8*)gUnknown_203F450)[0x4005] = 3;
        ((u8*)gUnknown_203F450)[0x4006] = 0;
    }
}

void TeachyTvChainTaskBattleOrFadeByOptionChosen(u8 taskId)
{
    int op = gTeachyTV_StaticResources.optionChosen;
    if ( op < 0 )
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
        sub_810B108(10);
    else
        sub_810B108(9);
}

void TeachyTvPostBattleFadeControl(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    if ( !(gPaletteFade.active) )
    {
        const u8* funcIdx = &gUnknown_8479390;
        int arg = funcIdx[gTeachyTV_StaticResources.optionChosen];
        data[3] = arg;
        gTasks[taskId].func = TeachyTvRenderMsgAndSwitchClusterFuncs;
    }
}

void TeachyTvGrassAnimationMain(u8 taskId, s16 x, s16 y, u8 subpriority, bool8 mode)
{
    u8 subprio;
    int res;
    struct Sprite *obj;
    int objId;
    const struct SpriteTemplate *const *objTemAddr;

    subprio = subpriority;
    if ( ((u8*)gUnknown_203F450)[0x4006] != 1 )
    {
        res = TeachyTvGrassAnimationCheckIfNeedsToGenerateGrassObj(
                          (u32)((x << 16) - 0x100000) >> 16,
                          y);
        if ( res << 24 )
        {
            objTemAddr = &gUnknown_83A0010;
            objId = CreateSprite(*(objTemAddr+4), 0, 0, subprio);
            obj = gSprites + objId;
            obj->pos2.x = x;
            obj->pos2.y = y + 8;
            obj->callback = TeachyTvGrassAnimationObjCallback;
            obj->data[0] = taskId;
            if ( mode == 1 )
            {
                SeekSpriteAnim(obj, 4);
                obj->oam.priority = 2;
            }
            else
            {
                SetSubspriteTables(obj, &gUnknown_84795B8);
                obj->subspriteTableNum = 0;
                obj->subspriteMode = 1;
            }
        }
    }
}

void TeachyTvGrassAnimationObjCallback(struct Sprite *sprite)
{
    u32 diff1, diff2;
    s16 *data = gTasks[sprite->data[0]].data;
    struct Sprite *objAddr = &gSprites[data[1]];
    if (((u8*)gUnknown_203F450)[0x4006] == 1)
        DestroySprite(sprite);
    else {
        if (!sprite->animCmdIndex)
            sprite->subspriteTableNum = 1;
        else
            sprite->subspriteTableNum = 0;
        sprite->pos2.x += (u16)data[4];
        sprite->pos2.y += (u16)data[5];
        if (!sprite->animEnded)
            return;
        sprite->subpriority = 0;
        diff1 = (u16)(sprite->pos2.x - objAddr->pos2.x);
        diff2 = (u16)(sprite->pos2.y - objAddr->pos2.y);
        diff1 = ((diff1 << 0x10) + 0xF0000) >> 0x10;
        if (diff1 <= 0x1E)
        {
            if ((s16)diff2 > -0x10)
            {
                if ((s16)diff2 <= 0x17)
                    return;
            }
        }
        DestroySprite(sprite);
    }
}

u8 TeachyTvGrassAnimationCheckIfNeedsToGenerateGrassObj(s16 x, s16 y)
{
    const u8 * arr;
    u8 *ptr;
    int high, low;
    if ( (x < 0) || (y < 0) )
        return 0;
    arr = &gUnknown_84795C8;
    ptr = gUnknown_203F450;
    high = ((y >> 4) + ptr[0x4005]) << 4;
    low = ((x >> 4) + ptr[0x4004]);
    return arr[high+low];
}

void TeachyTvPrepBattle(u8 taskId)
{
    s16 *data;

    taskId = taskId;
    data = gTasks[taskId].data;
    TeachyTvFree();
    gSpecialVar_0x8004 = gTeachyTV_StaticResources.optionChosen;
    gMain.savedCallback = TeachyTvRestorePlayerPartyCallback;
    SavePlayerParty();
    sub_8159F40();
    PlayMapChosenOrBattleBGM(MUS_DUMMY);
    if ( !gTeachyTV_StaticResources.optionChosen )
        data[6] = 9;
    else
        data[6] = 8;
    data[7] = 0;
    gTasks[taskId].func = TeachyTvPreBattleAnimAndSetBattleCallback;
}

void TeachyTvPreBattleAnimAndSetBattleCallback(u8 taskId)
{
    s16 *data;
    int temp;

    data = gTasks[taskId].data;
    switch (data[7])
    {
    case 0:
        sub_80D08B8(*((u8*)data + 12));
        ++data[7];
        break;
    case 1:
        temp = sub_80D08F8();
        if ( temp << 24 )
        {
            SetMainCallback2(sub_800FD9C);
            DestroyTask(taskId);
        }
        break;
    }
}

void TeachyTvRestorePlayerPartyCallback()
{
    LoadPlayerParty();
    if ( gUnknown_2023E8A == 3 )
        sub_815AC20();
    else
        PlayNewMapMusic(BGM_FRLG_FOLLOW_ME);
    sub_815ABFC();
}

#ifdef NONMATCHING
void TeachyTvLoadBg3Map(void *buffer)
{
    u16 *mapArray;
    int v2;
    int v3;
    int v4;
    int v5;
    int mapEntry;
    int v7;
    u16 v8;
    int i;
    char *MapTileBlockBuf;
    void *FourMapTileBlocksTempBuf;
    unsigned int j;
    u16 *v13;
    u8 *v14;
    void *tileset;
    u8 *palIndexArray;
    unsigned int v17;
    u32 v18;
    int v19;
    struct MapData * md;

    md = &Route1_Layout;
    v14 = (u8 *)buffer;
    v17 = 0;
    mapArray = (u16 *)AllocZeroed(0x800);
    tileset = AllocZeroed(0x8000);
    palIndexArray = Alloc(0x10);
    memset(palIndexArray, 0xFF, 0x10);
    TeachyTvLoadMapTilesetToBuffer(md->primaryTileset, (u8 *)tileset, 0x280);
    TeachyTvLoadMapTilesetToBuffer(md->secondaryTileset, (u8 *)tileset + 0x5000, 0x180);
    v2 = 0;
    do
    {
        v3 = 0;
        v19 = v2 + 6;
        v4 = 16 * v2;
        v5 = v2 << 6;
        v18 = v2 + 1;
        do
        {
            mapEntry = md->map[v3 + 24 * v19 + 8] & 0x3FF;
            v7 = 0;
            v8 = v3 + 1;
            if ( v4 + v3 <= 0 )
            {
LABEL_9:
                if ( mapArray[v7] )
                    goto LABEL_11;
            }
            else
            {
                for ( i = *mapArray; i; i = mapArray[v7] )
                {
                    if ( i == mapEntry )
                        goto LABEL_9;
                    v7 = (u16)(v7 + 1);
                    if ( v7 >= v4 + v3 )
                        goto LABEL_9;
                }
            }
            mapArray[v7] = mapEntry;
            v17 = (u16)(v17 + 1);
LABEL_11:
            TeachyTvPushBackNewMapPalIndexArrayEntry(
                md,
                (u16 *)&v14[2 * (v5 + 2 * v3)],
                palIndexArray,
                mapEntry,
                v7);
            v3 = v8;
        }
        while ( (u16)v8 <= 0xF );
        v2 = v18;
    }
    while ( (u16)v18 <= 8 );
    MapTileBlockBuf = (char *)Alloc(v17 << 7);
    FourMapTileBlocksTempBuf = Alloc(0x80);
    for ( j = 0; j < v17; j = (u16)j + 1 )
    {
        memset(FourMapTileBlocksTempBuf, 0, 0x80);
        v13 = &mapArray[j];
        if ( *v13 <= 0x27F )
            TeachyTvComputeMapTilesFromTilesetAndMetaTiles(
                (u16 *)(16 * *v13 + (u16*)(md->primaryTileset->metatiles)),
                (u8 *)FourMapTileBlocksTempBuf,
                (u8 *)tileset);
        else
            TeachyTvComputeMapTilesFromTilesetAndMetaTiles(
                (u16 *)(16 * (*v13 - 0x280) + (u16*)(md->secondaryTileset->metatiles)),
                (u8 *)FourMapTileBlocksTempBuf,
                (u8 *)tileset);

        CpuFastSet(FourMapTileBlocksTempBuf, &MapTileBlockBuf[0x80 * j], 0x20);
    }
    LoadBgTiles(3, MapTileBlockBuf, (u16)v17 << 7, 0);
    TeachyTvLoadMapPalette(&Route1_Layout, palIndexArray);
    Free(FourMapTileBlocksTempBuf);
    Free(MapTileBlockBuf);
    Free(palIndexArray);
    Free(tileset);
    Free(mapArray);
}
#else
NAKED
void TeachyTvLoadBg3Map(void *buffer)
{
    asm_unified("\n\
        push {r4-r7,lr}\n\
        mov r7, r10\n\
        mov r6, r9\n\
        mov r5, r8\n\
        push {r5-r7}\n\
        sub sp, 0x1C\n\
        str r0, [sp, 0x4]\n\
        movs r0, 0\n\
        str r0, [sp, 0x10]\n\
        ldr r1, _0815BE1C @ =Route1_Layout\n\
        mov r8, r1\n\
        movs r0, 0x80\n\
        lsls r0, 4\n\
        bl AllocZeroed\n\
        adds r6, r0, 0\n\
        movs r0, 0x80\n\
        lsls r0, 8\n\
        bl AllocZeroed\n\
        str r0, [sp, 0x8]\n\
        movs r0, 0x10\n\
        bl Alloc\n\
        str r0, [sp, 0xC]\n\
        movs r1, 0xFF\n\
        movs r2, 0x10\n\
        bl memset\n\
        mov r2, r8\n\
        ldr r0, [r2, 0x10]\n\
        movs r2, 0xA0\n\
        lsls r2, 2\n\
        ldr r1, [sp, 0x8]\n\
        bl TeachyTvLoadMapTilesetToBuffer\n\
        mov r3, r8\n\
        ldr r0, [r3, 0x14]\n\
        ldr r2, [sp, 0x8]\n\
        movs r3, 0xA0\n\
        lsls r3, 7\n\
        adds r1, r2, r3\n\
        movs r2, 0xC0\n\
        lsls r2, 1\n\
        bl TeachyTvLoadMapTilesetToBuffer\n\
        movs r4, 0\n\
    _0815BDDE:\n\
        movs r2, 0\n\
        adds r0, r4, 0x6\n\
        str r0, [sp, 0x18]\n\
        lsls r1, r4, 4\n\
        mov r10, r1\n\
        lsls r3, r4, 6\n\
        mov r9, r3\n\
        adds r4, 0x1\n\
        str r4, [sp, 0x14]\n\
    _0815BDF0:\n\
        mov r1, r8\n\
        ldr r0, [r1]\n\
        ldr r3, [sp, 0x18]\n\
        muls r0, r3\n\
        ldr r1, [r1, 0xC]\n\
        adds r0, r2, r0\n\
        lsls r0, 1\n\
        adds r0, r1\n\
        ldrh r1, [r0, 0x10]\n\
        ldr r3, _0815BE20 @ =0x000003ff\n\
        adds r0, r3, 0\n\
        adds r4, r0, 0\n\
        ands r4, r1\n\
        movs r3, 0\n\
        mov r0, r10\n\
        adds r1, r0, r2\n\
        lsls r5, r2, 1\n\
        adds r7, r2, 0x1\n\
        cmp r3, r1\n\
        bge _0815BE3C\n\
        ldrh r0, [r6]\n\
        b _0815BE34\n\
        .align 2, 0\n\
    _0815BE1C: .4byte Route1_Layout\n\
    _0815BE20: .4byte 0x000003ff\n\
    _0815BE24:\n\
        adds r0, r3, 0x1\n\
        lsls r0, 16\n\
        lsrs r3, r0, 16\n\
        cmp r3, r1\n\
        bge _0815BE3C\n\
        lsls r0, r3, 1\n\
        adds r0, r6\n\
        ldrh r0, [r0]\n\
    _0815BE34:\n\
        cmp r0, 0\n\
        beq _0815BE46\n\
        cmp r0, r4\n\
        bne _0815BE24\n\
    _0815BE3C:\n\
        lsls r0, r3, 1\n\
        adds r0, r6\n\
        ldrh r0, [r0]\n\
        cmp r0, 0\n\
        bne _0815BE56\n\
    _0815BE46:\n\
        lsls r0, r3, 1\n\
        adds r0, r6\n\
        strh r4, [r0]\n\
        ldr r0, [sp, 0x10]\n\
        adds r0, 0x1\n\
        lsls r0, 16\n\
        lsrs r0, 16\n\
        str r0, [sp, 0x10]\n\
    _0815BE56:\n\
        mov r2, r9\n\
        adds r1, r2, r5\n\
        lsls r1, 1\n\
        ldr r0, [sp, 0x4]\n\
        adds r1, r0, r1\n\
        str r3, [sp]\n\
        mov r0, r8\n\
        ldr r2, [sp, 0xC]\n\
        adds r3, r4, 0\n\
        bl TeachyTvPushBackNewMapPalIndexArrayEntry\n\
        lsls r0, r7, 16\n\
        lsrs r2, r0, 16\n\
        cmp r2, 0xF\n\
        bls _0815BDF0\n\
        ldr r1, [sp, 0x14]\n\
        lsls r0, r1, 16\n\
        lsrs r4, r0, 16\n\
        cmp r4, 0x8\n\
        bls _0815BDDE\n\
        ldr r2, [sp, 0x10]\n\
        lsls r0, r2, 7\n\
        bl Alloc\n\
        adds r7, r0, 0\n\
        movs r0, 0x80\n\
        bl Alloc\n\
        adds r5, r0, 0\n\
        movs r4, 0\n\
        ldr r3, [sp, 0x10]\n\
        lsls r3, 23\n\
        mov r9, r3\n\
        ldr r0, [sp, 0x10]\n\
        cmp r4, r0\n\
        bcs _0815BF00\n\
        ldr r1, _0815BECC @ =0x0000027f\n\
        mov r10, r1\n\
    _0815BEA2:\n\
        adds r0, r5, 0\n\
        movs r1, 0\n\
        movs r2, 0x80\n\
        bl memset\n\
        lsls r0, r4, 1\n\
        adds r1, r0, r6\n\
        ldrh r0, [r1]\n\
        cmp r0, r10\n\
        bhi _0815BED0\n\
        mov r2, r8\n\
        ldr r0, [r2, 0x10]\n\
        ldrh r1, [r1]\n\
        lsls r1, 4\n\
        ldr r0, [r0, 0xC]\n\
        adds r0, r1\n\
        adds r1, r5, 0\n\
        ldr r2, [sp, 0x8]\n\
        bl TeachyTvComputeMapTilesFromTilesetAndMetaTiles\n\
        b _0815BEE8\n\
        .align 2, 0\n\
    _0815BECC: .4byte 0x0000027f\n\
    _0815BED0:\n\
        mov r3, r8\n\
        ldr r0, [r3, 0x14]\n\
        ldrh r1, [r1]\n\
        ldr r2, _0815BF44 @ =0xfffffd80\n\
        adds r1, r2\n\
        lsls r1, 4\n\
        ldr r0, [r0, 0xC]\n\
        adds r0, r1\n\
        adds r1, r5, 0\n\
        ldr r2, [sp, 0x8]\n\
        bl TeachyTvComputeMapTilesFromTilesetAndMetaTiles\n\
    _0815BEE8:\n\
        lsls r1, r4, 7\n\
        adds r1, r7, r1\n\
        adds r0, r5, 0\n\
        movs r2, 0x20\n\
        bl CpuFastSet\n\
        adds r0, r4, 0x1\n\
        lsls r0, 16\n\
        lsrs r4, r0, 16\n\
        ldr r3, [sp, 0x10]\n\
        cmp r4, r3\n\
        bcc _0815BEA2\n\
    _0815BF00:\n\
        mov r0, r9\n\
        lsrs r2, r0, 16\n\
        movs r0, 0x3\n\
        adds r1, r7, 0\n\
        movs r3, 0\n\
        bl LoadBgTiles\n\
        mov r0, r8\n\
        ldr r1, [sp, 0xC]\n\
        bl TeachyTvLoadMapPalette\n\
        adds r0, r5, 0\n\
        bl Free\n\
        adds r0, r7, 0\n\
        bl Free\n\
        ldr r0, [sp, 0xC]\n\
        bl Free\n\
        ldr r0, [sp, 0x8]\n\
        bl Free\n\
        adds r0, r6, 0\n\
        bl Free\n\
        add sp, 0x1C\n\
        pop {r3-r5}\n\
        mov r8, r3\n\
        mov r9, r4\n\
        mov r10, r5\n\
        pop {r4-r7}\n\
        pop {r0}\n\
        bx r0\n\
        .align 2, 0\n\
    _0815BF44: .4byte 0xfffffd80\n\
            ");
}
#endif

void TeachyTvLoadMapTilesetToBuffer(struct Tileset *ts, u8 *dstBuffer, u16 size)
{
    if ( ts )
    {
        if ( !ts->isCompressed )
            CpuFastSet(ts->tiles, dstBuffer, 8 * size);
        else
            LZDecompressWram(ts->tiles, dstBuffer);
    }
}

#ifdef NONMATCHING
void TeachyTvPushBackNewMapPalIndexArrayEntry(struct MapData *mStruct, u16 *buf1, u8 *palIndexArray, u16 mapEntry, u16 offset)
{
    struct Tileset *ts;
    u16 *metaTileEntryAddr;

    int temp = mapEntry;
    if ( temp <= 0x27F )
    {
        ts = mStruct->primaryTileset;
    }
    else
    {
        ts = mStruct->secondaryTileset;
        temp = mapEntry - 0x280;
    }
    metaTileEntryAddr = &((u16*)(ts->metatiles))[8 * temp];
    buf1[0] = (TeachyTvComputePalIndexArrayEntryByMetaTile(palIndexArray, metaTileEntryAddr[0]) << 12) + 4 * offset;
    buf1[1] = (TeachyTvComputePalIndexArrayEntryByMetaTile(palIndexArray, metaTileEntryAddr[1]) << 12) + 4 * offset + 1;
    buf1[0x20] = (TeachyTvComputePalIndexArrayEntryByMetaTile(palIndexArray, metaTileEntryAddr[2]) << 12) + 4 * offset + 2;
    buf1[0x21] = (TeachyTvComputePalIndexArrayEntryByMetaTile(palIndexArray, metaTileEntryAddr[3]) << 12) + 4 * offset + 3;
}
#else
NAKED
void TeachyTvPushBackNewMapPalIndexArrayEntry(struct MapData *mStruct, u16 *buf1, u8 *palIndexArray, u16 mapEntry, u16 offset)
{
    asm_unified("\n\
        push {r4-r7,lr}\n\
        adds r5, r0, 0\n\
        adds r7, r1, 0\n\
        adds r6, r2, 0\n\
        ldr r0, [sp, 0x14]\n\
        lsls r3, 16\n\
        lsrs r1, r3, 16\n\
        lsls r0, 16\n\
        lsrs r4, r0, 16\n\
        ldr r0, _0815BF8C @ =0x0000027f\n\
        cmp r1, r0\n\
        bhi _0815BF90\n\
        ldr r0, [r5, 0x10]\n\
        b _0815BF96\n\
        .align 2, 0\n\
    _0815BF8C: .4byte 0x0000027f\n\
    _0815BF90:\n\
        ldr r0, [r5, 0x14]\n\
        ldr r2, _0815BFEC @ =0xfffffd80\n\
        adds r1, r2\n\
    _0815BF96:\n\
        lsls r1, 4\n\
        ldr r0, [r0, 0xC]\n\
        adds r5, r0, r1\n\
        ldrh r1, [r5]\n\
        adds r0, r6, 0\n\
        bl TeachyTvComputePalIndexArrayEntryByMetaTile\n\
        lsls r0, 12\n\
        lsls r4, 2\n\
        adds r0, r4\n\
        strh r0, [r7]\n\
        ldrh r1, [r5, 0x2]\n\
        adds r0, r6, 0\n\
        bl TeachyTvComputePalIndexArrayEntryByMetaTile\n\
        lsls r0, 12\n\
        adds r0, r4\n\
        adds r0, 0x1\n\
        strh r0, [r7, 0x2]\n\
        ldrh r1, [r5, 0x4]\n\
        adds r0, r6, 0\n\
        bl TeachyTvComputePalIndexArrayEntryByMetaTile\n\
        adds r1, r7, 0\n\
        adds r1, 0x40\n\
        lsls r0, 12\n\
        adds r0, r4\n\
        adds r0, 0x2\n\
        strh r0, [r1]\n\
        ldrh r1, [r5, 0x6]\n\
        adds r0, r6, 0\n\
        bl TeachyTvComputePalIndexArrayEntryByMetaTile\n\
        adds r1, r7, 0\n\
        adds r1, 0x42\n\
        lsls r0, 12\n\
        adds r0, r4\n\
        adds r0, 0x3\n\
        strh r0, [r1]\n\
        pop {r4-r7}\n\
        pop {r0}\n\
        bx r0\n\
        .align 2, 0\n\
    _0815BFEC: .4byte 0xfffffd80\n\
        ");
}
#endif

void TeachyTvComputeMapTilesFromTilesetAndMetaTiles(u16 *metaTilesArray, u8 *blockBuf, u8 *tileset)
{
    TeachyTvComputeSingleMapTileBlockFromTilesetAndMetaTiles(blockBuf, &tileset[0x20 * (*metaTilesArray & 0x3FF)], (*metaTilesArray >> 10) & 3);
    TeachyTvComputeSingleMapTileBlockFromTilesetAndMetaTiles(blockBuf, &tileset[0x20 * (metaTilesArray[4] & 0x3FF)], (metaTilesArray[4] >> 10) & 3);
    TeachyTvComputeSingleMapTileBlockFromTilesetAndMetaTiles(blockBuf + 0x20, &tileset[0x20 * (metaTilesArray[1] & 0x3FF)], (metaTilesArray[1] >> 10) & 3);
    TeachyTvComputeSingleMapTileBlockFromTilesetAndMetaTiles(blockBuf + 0x20, &tileset[0x20 * (metaTilesArray[5] & 0x3FF)], (metaTilesArray[5] >> 10) & 3);
    TeachyTvComputeSingleMapTileBlockFromTilesetAndMetaTiles(blockBuf + 0x40, &tileset[0x20 * (metaTilesArray[2] & 0x3FF)], (metaTilesArray[2] >> 10) & 3);
    TeachyTvComputeSingleMapTileBlockFromTilesetAndMetaTiles(blockBuf + 0x40, &tileset[0x20 * (metaTilesArray[6] & 0x3FF)], (metaTilesArray[6] >> 10) & 3);
    blockBuf += 0x60;
    TeachyTvComputeSingleMapTileBlockFromTilesetAndMetaTiles(blockBuf, &tileset[0x20 * (metaTilesArray[3] & 0x3FF)], (metaTilesArray[3] >> 10) & 3);
    TeachyTvComputeSingleMapTileBlockFromTilesetAndMetaTiles(blockBuf, &tileset[0x20 * (metaTilesArray[7] & 0x3FF)], (metaTilesArray[7] >> 10) & 3);
}

#ifdef NONMATCHING
void TeachyTvComputeSingleMapTileBlockFromTilesetAndMetaTiles(u8 *blockBuf, u8 *tileset, u8 metaTile)
{
    u8 *buffer;
    u32 i;
    u32 j;
    vu32 src;

    buffer = (u8 *)AllocZeroed(0x20);
    src = ((u32)AllocZeroed(0x20));
    CpuFastSet(tileset, buffer, 8);
    if ( metaTile & 1 )
    {
        i = 0;
        do
        {
            j = 0;
            do
            {
                u32 offset1 = i << 2;
                u32 offset2 = j - 3;
                u32 offset = offset1 - offset2;
                u32 value = buffer[offset];
                u32 dstOffset = offset1 + j;
                *(u8*)(src + dstOffset) = ((value & 0xF) << 4) + ((value & 0xF0) >> 4);
            }
            while ( ++(u8)j <= 3 );
        }
        while ( ++(u8)i <= 7 );
        CpuFastSet((u8*)src, buffer, 8);
    }
    if ( metaTile & 2 )
    {
        j = 0;
        do
        {
            memcpy(&((u8*)src)[4 * j], &buffer[4 * (7 - j)], 4);
            j = (u8)(j + 1);
        }
        while ( j <= 7 );
        CpuFastSet((u8*)src, buffer, 8);
    }
    j = 0;
    do
    {
        if ( buffer[j] & 0xF0 )
            blockBuf[j] = (blockBuf[j] & 0xF) + (buffer[j] & 0xF0);
        if ( buffer[j] & 0xF )
            blockBuf[j] = (blockBuf[j] & 0xF0) + (buffer[j] & 0xF);
        j = (u8)(j + 1);
    }
    while ( j <= 0x1F );
    Free((u8*)src);
    Free(buffer);
}
#else
NAKED
void TeachyTvComputeSingleMapTileBlockFromTilesetAndMetaTiles(u8 *blockBuf, u8 *tileset, u8 metaTile)
{
    asm_unified("\n\
        push {r4-r7,lr}\n\
        mov r7, r10\n\
        mov r6, r9\n\
        mov r5, r8\n\
        push {r5-r7}\n\
        sub sp, 0x4\n\
        mov r9, r0\n\
        adds r4, r1, 0\n\
        lsls r2, 24\n\
        lsrs r2, 24\n\
        mov r10, r2\n\
        movs r0, 0x20\n\
        bl AllocZeroed\n\
        adds r6, r0, 0\n\
        movs r0, 0x20\n\
        bl AllocZeroed\n\
        str r0, [sp]\n\
        adds r0, r4, 0\n\
        adds r1, r6, 0\n\
        movs r2, 0x8\n\
        bl CpuFastSet\n\
        movs r0, 0x1\n\
        mov r1, r10\n\
        ands r0, r1\n\
        cmp r0, 0\n\
        beq _0815C15A\n\
        movs r5, 0\n\
        movs r7, 0xF\n\
        mov r12, r7\n\
        movs r0, 0xF0\n\
        mov r8, r0\n\
    _0815C118:\n\
        movs r3, 0\n\
        lsls r4, r5, 2\n\
    _0815C11C:\n\
        subs r0, r3, 0x3\n\
        subs r0, r4, r0\n\
        adds r0, r6, r0\n\
        ldrb r1, [r0]\n\
        adds r2, r4, r3\n\
        ldr r7, [sp]\n\
        adds r2, r7, r2\n\
        adds r0, r1, 0\n\
        mov r7, r12\n\
        ands r0, r7\n\
        lsls r0, 4\n\
        mov r7, r8\n\
        ands r1, r7\n\
        lsrs r1, 4\n\
        adds r0, r1\n\
        strb r0, [r2]\n\
        adds r0, r3, 0x1\n\
        lsls r0, 24\n\
        lsrs r3, r0, 24\n\
        cmp r3, 0x3\n\
        bls _0815C11C\n\
        adds r0, r5, 0x1\n\
        lsls r0, 24\n\
        lsrs r5, r0, 24\n\
        cmp r5, 0x7\n\
        bls _0815C118\n\
        ldr r0, [sp]\n\
        adds r1, r6, 0\n\
        movs r2, 0x8\n\
        bl CpuFastSet\n\
    _0815C15A:\n\
        movs r0, 0x2\n\
        mov r1, r10\n\
        ands r0, r1\n\
        cmp r0, 0\n\
        beq _0815C18E\n\
        movs r5, 0\n\
    _0815C166:\n\
        lsls r0, r5, 2\n\
        ldr r7, [sp]\n\
        adds r0, r7\n\
        movs r1, 0x7\n\
        subs r1, r5\n\
        lsls r1, 2\n\
        adds r1, r6\n\
        movs r2, 0x4\n\
        bl memcpy\n\
        adds r0, r5, 0x1\n\
        lsls r0, 24\n\
        lsrs r5, r0, 24\n\
        cmp r5, 0x7\n\
        bls _0815C166\n\
        ldr r0, [sp]\n\
        adds r1, r6, 0\n\
        movs r2, 0x8\n\
        bl CpuFastSet\n\
    _0815C18E:\n\
        movs r5, 0\n\
        movs r0, 0xF0\n\
        mov r8, r0\n\
        movs r1, 0xF\n\
        mov r12, r1\n\
    _0815C198:\n\
        adds r4, r6, r5\n\
        ldrb r0, [r4]\n\
        mov r3, r8\n\
        ands r3, r0\n\
        cmp r3, 0\n\
        beq _0815C1B2\n\
        mov r7, r9\n\
        adds r2, r7, r5\n\
        ldrb r1, [r2]\n\
        mov r0, r12\n\
        ands r0, r1\n\
        adds r0, r3\n\
        strb r0, [r2]\n\
    _0815C1B2:\n\
        ldrb r0, [r4]\n\
        mov r3, r12\n\
        ands r3, r0\n\
        cmp r3, 0\n\
        beq _0815C1CA\n\
        mov r0, r9\n\
        adds r2, r0, r5\n\
        ldrb r1, [r2]\n\
        mov r0, r8\n\
        ands r0, r1\n\
        adds r0, r3\n\
        strb r0, [r2]\n\
    _0815C1CA:\n\
        adds r0, r5, 0x1\n\
        lsls r0, 24\n\
        lsrs r5, r0, 24\n\
        cmp r5, 0x1F\n\
        bls _0815C198\n\
        ldr r0, [sp]\n\
        bl Free\n\
        adds r0, r6, 0\n\
        bl Free\n\
        add sp, 0x4\n\
        pop {r3-r5}\n\
        mov r8, r3\n\
        mov r9, r4\n\
        mov r10, r5\n\
        pop {r4-r7}\n\
        pop {r0}\n\
        bx r0\n\
        ");
}
#endif

u16 TeachyTvComputePalIndexArrayEntryByMetaTile(u8 *palIndexArrayBuf, u16 metaTile)
{
    u32 pal;
    u32 i;
    int firstEntry;
    int temp;

    pal = (u32)(metaTile << 16) >> 28;
    i = 0;
    firstEntry = *palIndexArrayBuf;
    if ( firstEntry != pal )
    {
        if ( firstEntry == 0xFF )
        {
            *palIndexArrayBuf = pal;
        }
        else
        {
            while ( 1 )
            {
                i = ((i + 1) << 0x10) >> 0x10;
                if ( i > 0xF )
                    break;
                temp = palIndexArrayBuf[i];
                if ( temp == pal )
                    break;
                if ( temp == 0xFF )
                {
                    palIndexArrayBuf[i] = pal;
                    break;
                }
            }
        }
    }
    return (u16)(0xF - i);
}

#ifdef NONMATCHING
void TeachyTvLoadMapPalette(const struct MapData * const mStruct, u8 *palIndexArray)
{
    u8 i;
    struct Tileset *ts;

    for (i = 0; i < 16 && palIndexArray[i] != 0xFF; i++)
    {
        ts = *(palIndexArray + i) > 6 ? mStruct->secondaryTileset : mStruct->primaryTileset;
        LoadPalette((u16 *)ts->palettes + 0x10 * palIndexArray[i], 0x10 * (0xF - i), 0x20);
    }
}
#else
NAKED
void TeachyTvLoadMapPalette(const struct MapData * const mStruct, u8 *palIndexArray)
{
    asm_unified("\n\
        push {r4-r6,lr}\n\
        adds r6, r0, 0\n\
        adds r5, r1, 0\n\
        movs r4, 0\n\
        ldrb r0, [r5]\n\
        cmp r0, 0xFF\n\
        beq _0815C274\n\
    _0815C23E:\n\
        adds r1, r5, r4\n\
        ldrb r0, [r1]\n\
        cmp r0, 0x6\n\
        bls _0815C24A\n\
        ldr r0, [r6, 0x14]\n\
        b _0815C24C\n\
    _0815C24A:\n\
        ldr r0, [r6, 0x10]\n\
    _0815C24C:\n\
        ldrb r1, [r1]\n\
        lsls r1, 5\n\
        ldr r0, [r0, 0x8]\n\
        adds r0, r1\n\
        movs r1, 0xF\n\
        subs r1, r4\n\
        lsls r1, 20\n\
        lsrs r1, 16\n\
        movs r2, 0x20\n\
        bl LoadPalette\n\
        adds r0, r4, 0x1\n\
        lsls r0, 24\n\
        lsrs r4, r0, 24\n\
        cmp r4, 0xF\n\
        bhi _0815C274\n\
        adds r0, r5, r4\n\
        ldrb r0, [r0]\n\
        cmp r0, 0xFF\n\
        bne _0815C23E\n\
    _0815C274:\n\
        pop {r4-r6}\n\
        pop {r0}\n\
        bx r0\n\
        ");
}
#endif
