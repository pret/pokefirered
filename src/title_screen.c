#include "global.h"
#include "gflib.h"
#include "task.h"
#include "new_menu_helpers.h"
#include "m4a.h"
#include "scanline_effect.h"
#include "graphics.h"
#include "help_system.h"
#include "intro.h"
#include "load_save.h"
#include "new_game.h"
#include "random.h"
#include "save.h"
#include "main_menu.h"
#include "clear_save_data_screen.h"
#include "berry_fix_program.h"
#include "decompress.h"
#include "constants/songs.h"

enum TitleScreenScene
{
    TITLESCREENSCENE_INIT = 0,
    TITLESCREENSCENE_FLASHSPRITE,
    TITLESCREENSCENE_FADEIN,
    TITLESCREENSCENE_RUN,
    TITLESCREENSCEEN_RESTART,
    TITLESCREENSCENE_CRY
};

#if   defined(FIRERED)
#define TITLE_SPECIES SPECIES_CHARIZARD
#elif defined(LEAFGREEN)
#define TITLE_SPECIES SPECIES_VENUSAUR
#endif

static EWRAM_DATA u8 sTitleScreenTimerTaskId = 0;

static void ResetGpuRegs(void);
static void CB2_TitleScreenRun(void);
static void VBlankCB(void);
static void Task_TitleScreenTimer(u8 taskId);
static void Task_TitleScreenMain(u8 taskId);
static void SetTitleScreenScene(s16 * data, u8 a1);
static void SetTitleScreenScene_Init(s16 * data);
static void SetTitleScreenScene_FlashSprite(s16 * data);
static void SetTitleScreenScene_FadeIn(s16 * data);
static void SetTitleScreenScene_Run(s16 * data);
static void SetGpuRegsForTitleScreenRun(void);
static void SetTitleScreenScene_Restart(s16 * data);
static void SetTitleScreenScene_Cry(s16 * data);
static void Task_TitleScreen_SlideWin0(u8 taskId);
static void Task_TitleScreen_BlinkPressStart(u8 taskId);
static void SignalEndTitleScreenPaletteSomethingTask(void);
static void UpdateScanlineEffectRegBuffer(s16 a0);
static void ScheduleStopScanlineEffect(void);
static void LoadMainTitleScreenPalsAndResetBgs(void);
static void CB2_FadeOutTransitionToSaveClearScreen(void);
static void SpriteCallback_TitleScreenFlameOrLeaf(struct Sprite *sprite);
static void CB2_FadeOutTransitionToBerryFix(void);
static void LoadSpriteGfxAndPals(void);
static void Task_FlameOrLeafSpawner(u8 taskId);
static void TitleScreen_srand(u8 taskId, u8 field, u16 seed);
static u16 TitleScreen_rand(u8 taskId, u8 field);
static u32 CreateBlankSprite(void);
static void SetPalOnOrCreateBlankSprite(bool32 a0);
static u8 CreateSlashSprite(void);
static void ScheduleHideSlashSprite(u8 spriteId);
static bool32 IsSlashSpriteHidden(u8 spriteId);
static void SpriteCallback_Slash(struct Sprite *sprite);

// bg3
static const u8 sBorderBgTiles[] = INCBIN_U8("graphics/title_screen/border_bg.4bpp.lz");
#if defined(FIRERED)
static const u8 sBorderBgMap[] = INCBIN_U8("graphics/title_screen/firered/border_bg.bin.lz");
#elif defined(LEAFGREEN)
static const u8 sBorderBgMap[] = INCBIN_U8("graphics/title_screen/leafgreen/border_bg.bin.lz");
#endif

//sprites
static const u32 sSlashSpriteTiles[] = INCBIN_U32("graphics/title_screen/slash_sprite.4bpp.lz");
#if defined(FIRERED)
static const u16 sSlashSpritePals[] = INCBIN_U16("graphics/title_screen/firered/slash_sprite.gbapal");
static const u32 sFireSpriteTiles[] = INCBIN_U32("graphics/title_screen/firered/fire_sprite.4bpp.lz");
static const u32 sBlankFireSpriteTiles[] = INCBIN_U32("graphics/title_screen/firered/blank_fire_sprite.4bpp.lz");
#elif defined(LEAFGREEN)
static const u16 sSlashSpritePals[] = INCBIN_U16("graphics/title_screen/leafgreen/slash_sprite.gbapal");
static const u32 sLeafSpriteTiles[] = INCBIN_U32("graphics/title_screen/leafgreen/leaf_sprite.4bpp.lz");
static const u32 sBlankLeafSpriteTiles[] = INCBIN_U32("graphics/title_screen/leafgreen/blank_leaf_sprite.4bpp.lz");
#endif

static const struct OamData sOamData_FlameOrLeaf = {
    .objMode = ST_OAM_OBJ_NORMAL,
    .shape = ST_OAM_SQUARE,
    .size = ST_OAM_SIZE_1,
    .tileNum = 0,
    .priority = 3,
    .paletteNum = 0
};

#if defined(FIRERED)
static const union AnimCmd sSpriteAnims_FlameOrLeaf_0[] = {
    ANIMCMD_FRAME(0x00, 3),
    ANIMCMD_FRAME(0x04, 6),
    ANIMCMD_FRAME(0x08, 6),
    ANIMCMD_FRAME(0x0c, 6),
    ANIMCMD_FRAME(0x10, 6),
    ANIMCMD_FRAME(0x14, 6),
    ANIMCMD_FRAME(0x18, 6),
    ANIMCMD_FRAME(0x1c, 6),
    ANIMCMD_FRAME(0x20, 6),
    ANIMCMD_FRAME(0x24, 6),
    ANIMCMD_END
};

static const union AnimCmd sSpriteAnims_FlameOrLeaf_1[] = {
    ANIMCMD_FRAME(0x18, 6),
    ANIMCMD_FRAME(0x1c, 6),
    ANIMCMD_FRAME(0x20, 6),
    ANIMCMD_FRAME(0x24, 6),
    ANIMCMD_END
};

static const union AnimCmd *const sSpriteAnimTable_FlameOrLeaf[] = {
    sSpriteAnims_FlameOrLeaf_0,
    sSpriteAnims_FlameOrLeaf_1
};

#elif defined(LEAFGREEN)
static const union AnimCmd sSpriteAnims_FlameOrLeaf_0[] = {
    ANIMCMD_FRAME(0x00, 8),
    ANIMCMD_FRAME(0x04, 8),
    ANIMCMD_FRAME(0x08, 8),
    ANIMCMD_FRAME(0x0c, 8),
    ANIMCMD_FRAME(0x10, 8),
    ANIMCMD_FRAME(0x14, 8),
    ANIMCMD_FRAME(0x18, 8),
    ANIMCMD_FRAME(0x1c, 8),
    ANIMCMD_FRAME(0x20, 8),
    ANIMCMD_FRAME(0x24, 8),
    ANIMCMD_FRAME(0x28, 8),
    ANIMCMD_JUMP(0)
};

static const union AnimCmd *const sSpriteAnimTable_FlameOrLeaf[] = {
    sSpriteAnims_FlameOrLeaf_0
};
#endif

static const struct SpriteTemplate sSpriteTemplate_FlameOrLeaf_State1 = {
    .tileTag = 0,
    .paletteTag = 0,
    .oam = &sOamData_FlameOrLeaf,
    .anims = sSpriteAnimTable_FlameOrLeaf,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy
};

#if defined(FIRERED)
static const struct SpriteTemplate sSpriteTemplate_FlameOrLeaf_State0 = {
    .tileTag = 1,
    .paletteTag = 0,
    .oam = &sOamData_FlameOrLeaf,
    .anims = sSpriteAnimTable_FlameOrLeaf,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy
};
#elif defined(LEAFGREEN)
static const struct OamData sOamData_LG_83BF950 = {
    .shape = SPRITE_SHAPE(32x16),
    .size = SPRITE_SIZE(32x16),
    .priority = 3
};

static const struct SpriteTemplate sSpriteTemplate_FlameOrLeaf_State0 = {
    .tileTag = 1,
    .paletteTag = 0,
    .oam = &sOamData_LG_83BF950,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy
};
#endif

static const struct OamData sOamData_UnknownEmptySprite = {
    .objMode = ST_OAM_OBJ_NORMAL,
    .shape = ST_OAM_V_RECTANGLE,
    .size = ST_OAM_SIZE_3,
    .tileNum = 0,
    .priority = 0,
    .paletteNum = 0
};

static const struct SpriteTemplate sUnknownEmptySprite = {
    .tileTag = 2,
    .paletteTag = 2,
    .oam = &sOamData_UnknownEmptySprite,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy
};

static const struct OamData sOamData_SlashSprite = {
    .objMode = ST_OAM_OBJ_WINDOW,
    .shape = ST_OAM_SQUARE,
    .size = ST_OAM_SIZE_3,
    .tileNum = 0,
    .priority = 0,
    .paletteNum = 0
};

static const struct SpriteTemplate sSlashSpriteTemplate = {
    .tileTag = 3,
    .paletteTag = 2,
    .oam = &sOamData_SlashSprite,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy
};

static const struct BgTemplate sBgTemplates[] = {
    {
        .bg = 0,
        .charBaseIndex = 0,
        .mapBaseIndex = 31,
        .screenSize = 0,
        .paletteMode = 1, // 8bpp
        .priority = 0,
        .baseTile = 0
    }, {
        .bg = 1,
        .charBaseIndex = 1,
        .mapBaseIndex = 30,
        .screenSize = 0,
        .paletteMode = 0, // 4bpp
        .priority = 1,
        .baseTile = 0
    }, {
        .bg = 2,
        .charBaseIndex = 2,
        .mapBaseIndex = 29,
        .screenSize = 0,
        .paletteMode = 0, // 4bpp
        .priority = 2,
        .baseTile = 0
    }, {
        .bg = 3,
        .charBaseIndex = 3,
        .mapBaseIndex = 28,
        .screenSize = 0,
        .paletteMode = 0, // 4bpp
        .priority = 3,
        .baseTile = 0
    }
};

static void (*const sSceneFuncs[])(s16 * data) = {
    SetTitleScreenScene_Init,
    SetTitleScreenScene_FlashSprite,
    SetTitleScreenScene_FadeIn,
    SetTitleScreenScene_Run,
    SetTitleScreenScene_Restart,
    SetTitleScreenScene_Cry
};

#if defined(FIRERED)
static const struct CompressedSpriteSheet sSpriteSheets[] = {
    {sFireSpriteTiles, 0x500, 0},
    {sBlankFireSpriteTiles, 0x500, 1},
    {gGraphics_TitleScreen_BlankObjTiles, 0x400, 2},
    {sSlashSpriteTiles, 0x800, 3}
};
#elif defined(LEAFGREEN)
static const struct CompressedSpriteSheet sSpriteSheets[] = {
    {sLeafSpriteTiles, 0x580, 0},
    {sBlankLeafSpriteTiles, 0x100, 1},
    {gGraphics_TitleScreen_BlankObjTiles, 0x400, 2},
    {sSlashSpriteTiles, 0x800, 3}
};
#endif

static const struct SpritePalette sSpritePals[] = {
    {sSlashSpritePals, 0},
    {gGraphics_TitleScreen_FireOrLeafPals, 2},
    {}
};

#if defined(FIRERED)
static const u8 gUnknown_83BFBD4[] = {
    0x04, 0x10, 0x1a, 0x20, 0x30, 0xc8, 0xd8, 0xe0, 0xe8, 0x3c, 0x4c, 0x5c, 0x6c, 0x80, 0x90
};

#elif defined(LEAFGREEN)
static const u16 gUnknown_LG_83BFA10[] = {
    40, 80, 110, 60, 90, 70, 100, 50
};
#endif

static const u32 gUnknown_83BFBE4[] = INCBIN_U32("graphics/title_screen/unk_83BFBE4.bin.lz");
static const u32 gUnknown_83C0408[] = INCBIN_U32("graphics/title_screen/unk_83C0408.bin.lz");
static const u32 gUnknown_83C0C00[] = INCBIN_U32("graphics/title_screen/unk_83C0C00.bin.lz");
static const u32 gUnknown_83C139C[] = INCBIN_U32("graphics/title_screen/unk_83C139C.bin.lz");
static const u32 gUnknown_83C1BB8[] = INCBIN_U32("graphics/title_screen/unk_83C1BB8.bin.lz");
static const u32 gUnknown_83C2380[] = INCBIN_U32("graphics/title_screen/unk_83C2380.bin.lz");

static const u32 *const gUnknown_83C2BA4[] = {
    gUnknown_83BFBE4,
    gUnknown_83C0408,
    gUnknown_83C0C00,
    gUnknown_83C139C,
    gUnknown_83C1BB8,
    gUnknown_83C2380
};

void CB2_InitTitleScreen(void)
{
    switch (gMain.state)
    {
    default:
        gMain.state = 0;
        // fallthrough
    case 0:
        SetVBlankCallback(NULL);
        StartTimer1();
        InitHeap(gHeap, HEAP_SIZE);
        ResetTasks();
        ResetSpriteData();
        FreeAllSpritePalettes();
        ResetPaletteFade();
        ResetGpuRegs();
        DmaFill16(3, 0, (void *)VRAM, VRAM_SIZE);
        DmaFill32(3, 0, (void *)OAM, OAM_SIZE);
        DmaFill16(3, 0, (void *)PLTT, PLTT_SIZE);
        ResetBgsAndClearDma3BusyFlags(FALSE);
        InitBgsFromTemplates(0, sBgTemplates, NELEMS(sBgTemplates));
        SetGpuRegBits(REG_OFFSET_DISPCNT, DISPCNT_OBJ_1D_MAP | DISPCNT_OBJ_ON);
        sTitleScreenTimerTaskId = 0xFF;
        break;
    case 1:
        LoadPalette(gGraphics_TitleScreen_GameTitleLogoPals, 0, 0x1A0);
        DecompressAndCopyTileDataToVram(0, gGraphics_TitleScreen_GameTitleLogoTiles, 0, 0, 0);
        DecompressAndCopyTileDataToVram(0, gGraphics_TitleScreen_GameTitleLogoMap, 0, 0, 1);
        LoadPalette(gGraphics_TitleScreen_BoxArtMonPals, 0xD0, 0x20);
        DecompressAndCopyTileDataToVram(1, gGraphics_TitleScreen_BoxArtMonTiles, 0, 0, 0);
        DecompressAndCopyTileDataToVram(1, gGraphics_TitleScreen_BoxArtMonMap, 0, 0, 1);
        LoadPalette(gGraphics_TitleScreen_BackgroundPals, 0xF0, 0x20);
        DecompressAndCopyTileDataToVram(2, gGraphics_TitleScreen_CopyrightPressStartTiles, 0, 0, 0);
        DecompressAndCopyTileDataToVram(2, gGraphics_TitleScreen_CopyrightPressStartMap, 0, 0, 1);
        LoadPalette(gGraphics_TitleScreen_BackgroundPals, 0xE0, 0x20);
        DecompressAndCopyTileDataToVram(3, sBorderBgTiles, 0, 0, 0);
        DecompressAndCopyTileDataToVram(3, sBorderBgMap, 0, 0, 1);
        LoadSpriteGfxAndPals();
        break;
    case 2:
        if (!FreeTempTileDataBuffersIfPossible())
        {
            BlendPalettes(0x0000FFFF, 0x10, RGB_BLACK);
            CreateTask(Task_TitleScreenMain, 4);
            sTitleScreenTimerTaskId = CreateTask(Task_TitleScreenTimer, 2);
            SetVBlankCallback(VBlankCB);
            SetMainCallback2(CB2_TitleScreenRun);
            m4aSongNumStart(MUS_TITLE);
        }
        return;
    }
    gMain.state++;
}

static void ResetGpuRegs(void)
{
    SetGpuReg(REG_OFFSET_DISPCNT,  0);
    SetGpuReg(REG_OFFSET_BLDCNT,   0);
    SetGpuReg(REG_OFFSET_BLDALPHA, 0);
    SetGpuReg(REG_OFFSET_BLDY,     0);
    SetGpuReg(REG_OFFSET_BG0HOFS,  0);
    SetGpuReg(REG_OFFSET_BG0VOFS,  0);
    SetGpuReg(REG_OFFSET_BG1HOFS,  0);
    SetGpuReg(REG_OFFSET_BG1VOFS,  0);
    SetGpuReg(REG_OFFSET_BG2HOFS,  0);
    SetGpuReg(REG_OFFSET_BG2VOFS,  0);
    SetGpuReg(REG_OFFSET_BG3HOFS,  0);
    SetGpuReg(REG_OFFSET_BG3VOFS,  0);
}

static void CB2_TitleScreenRun(void)
{
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

static void VBlankCB(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
    ScanlineEffect_InitHBlankDmaTransfer();

    if (sTitleScreenTimerTaskId != 0xFF)
        gTasks[sTitleScreenTimerTaskId].data[0]++;
}

static void Task_TitleScreenTimer(u8 taskId)
{
    s16 * data = gTasks[taskId].data;

    if (data[0] >= 2700)
    {
        sTitleScreenTimerTaskId = 0xFF;
        DestroyTask(taskId);
    }
}

static void Task_TitleScreenMain(u8 taskId)
{
    s16 * data = gTasks[taskId].data;

    if (JOY_NEW(A_BUTTON | B_BUTTON | START_BUTTON)
    && data[0] != 3 && data[0] != 4 && data[0] != 5)
    {
        ScheduleStopScanlineEffect();
        LoadMainTitleScreenPalsAndResetBgs();
        SetPalOnOrCreateBlankSprite(data[5]);
        SetTitleScreenScene(data, TITLESCREENSCENE_RUN);
    }
    else
    {
        sSceneFuncs[data[0]](data);
    }
}

static void SetTitleScreenScene(s16 * data, u8 a1)
{
    data[1] = 0;
    data[0] = a1;
}

static void SetTitleScreenScene_Init(s16 * data)
{
    struct ScanlineEffectParams params;

    HideBg(0);
    ShowBg(1);
    ShowBg(2);
    ShowBg(3);

    params.dmaDest = (volatile void *)REG_ADDR_BLDY;
    params.dmaControl = SCANLINE_EFFECT_DMACNT_16BIT;
    params.initState = 1;
    params.unused9 = 0;

    CpuFill16(0, gScanlineEffectRegBuffers[0], 0x140);
    CpuFill16(0, gScanlineEffectRegBuffers[1], 0x140);

    ScanlineEffect_SetParams(params);

    SetTitleScreenScene(data, TITLESCREENSCENE_FLASHSPRITE);
}

static void SetTitleScreenScene_FlashSprite(s16 * data)
{
    switch (data[1])
    {
    case 0:
        SetGpuReg(REG_OFFSET_BLDCNT, BLDCNT_TGT1_BG1 | BLDCNT_EFFECT_LIGHTEN);
        SetGpuReg(REG_OFFSET_BLDY, 0);
        data[2] = 0x80;
        UpdateScanlineEffectRegBuffer(data[2]);
        data[1]++;
        break;
    case 1:
        data[2] -= 4;
        UpdateScanlineEffectRegBuffer(data[2]);
        if (data[2] < 0)
        {
            gScanlineEffect.state = 3;
            data[1]++;
        }
        break;
    case 2:
        SetGpuReg(REG_OFFSET_BLDCNT, 0);
        SetGpuReg(REG_OFFSET_BLDY, 0);
        SetTitleScreenScene(data, TITLESCREENSCENE_FADEIN);
    }
}

static void SetTitleScreenScene_FadeIn(s16 * data)
{
    u32 r4;
    switch (data[1])
    {
    case 0:
        data[2] = 0;
        data[1]++;
        break;
    case 1:
        data[2]++;
        if (data[2] > 10)
        {
            TintPalette_GrayScale2(gPlttBufferUnfaded + 0xD0, 0x10);
            BeginNormalPaletteFade(0x00002000, 9, 0x10, 0, RGB_BLACK);
            data[1]++;
        }
        break;
    case 2:
        if (!gPaletteFade.active)
        {
            data[2] = 0;
            data[1]++;
        }
        break;
    case 3:
        data[2]++;
        if (data[2] > 36)
        {
            CreateTask(Task_TitleScreen_SlideWin0, 3);
            sub_80717A8(0x2000, -4, 0x01, 0x10, RGB(30, 30, 31), 0, 0);
            data[2] = 0;
            data[1]++;
        }
        break;
    case 4:
        if (!sub_807185C(0))
        {
            sub_80717A8(0x2000, -4, 0x0F, 0x00, RGB(30, 30, 31), 0, 0);
            data[1]++;
        }
        break;
    case 5:
        data[2]++;
        if (data[2] > 20)
        {
            data[2] = 0;
            sub_80717A8(0x2000, -4, 0x01, 0x10, RGB(30, 30, 31), 0, 0);
            data[1]++;
        }
        break;
    case 6:
        if (!sub_807185C(0))
        {
            sub_80717A8(0x2000, -4, 0x0F, 0x00, RGB(30, 30, 31), 0, 0);
            data[1]++;
        }
        break;
    case 7:
        data[2]++;
        if (data[2] > 20)
        {
            data[2] = 0;
            sub_80717A8(0x2000, -3, 0x00, 0x10, RGB(30, 30, 31), 0, 0);
            data[1]++;
        }
        break;
    case 8:
        if (!sub_807185C(0))
        {
            data[5] = 1;
            r4 = (0x10000 << CreateBlankSprite()) | 0x00001FFF;
            BlendPalettes(r4, 0x10, RGB(30, 30, 31));
            BeginNormalPaletteFade(r4, 1, 0x10, 0x00, RGB(30, 30, 31));
            ShowBg(0);
            CpuCopy16(gGraphics_TitleScreen_BoxArtMonPals, gPlttBufferUnfaded + 0xD0, 0x20);
            sub_80717A8(0x2000, 1, 0x0F, 0x00, RGB(30, 30, 31), 0, 0);
            data[1]++;
        }
        break;
    case 9:
        if (!sub_807185C(0) && !gPaletteFade.active)
        {
            SetTitleScreenScene(data, TITLESCREENSCENE_RUN);
        }
        break;
    }
}

#define KEYSTROKE_DELSAVE (B_BUTTON | SELECT_BUTTON | DPAD_UP)
#define KEYSTROKE_BERRY_FIX (B_BUTTON | SELECT_BUTTON)

static void SetTitleScreenScene_Run(s16 * data)
{
    switch (data[1])
    {
    case 0:
        SetHelpContext(HELPCONTEXT_TITLE_SCREEN);
        CreateTask(Task_TitleScreen_BlinkPressStart, 0);
        CreateTask(Task_FlameOrLeafSpawner, 5);
        SetGpuRegsForTitleScreenRun();
        data[6] = CreateSlashSprite();
        HelpSystem_Enable();
        data[1]++;
        // fallthrough
    case 1:
        if (JOY_HELD(KEYSTROKE_DELSAVE) == KEYSTROKE_DELSAVE)
        {
            ScheduleHideSlashSprite(data[6]);
            DestroyTask(FindTaskIdByFunc(Task_TitleScreenMain));
            SetMainCallback2(CB2_FadeOutTransitionToSaveClearScreen);
        }
        else if (JOY_HELD(KEYSTROKE_BERRY_FIX) == KEYSTROKE_BERRY_FIX)
        {
            ScheduleHideSlashSprite(data[6]);
            DestroyTask(FindTaskIdByFunc(Task_TitleScreenMain));
            SetMainCallback2(CB2_FadeOutTransitionToBerryFix);
        }
        else if (JOY_NEW(A_BUTTON | START_BUTTON))
        {
            SetTitleScreenScene(data, TITLESCREENSCENE_CRY);
        }
        else if (!FuncIsActiveTask(Task_TitleScreenTimer))
        {
            SetTitleScreenScene(data, TITLESCREENSCEEN_RESTART);
        }
        break;
    }
}

static void SetGpuRegsForTitleScreenRun(void)
{
    SetGpuRegBits(REG_OFFSET_DISPCNT, DISPCNT_OBJWIN_ON);
    SetGpuReg(REG_OFFSET_WINOUT, WIN_RANGE(0x3F, 0x1F));
    SetGpuReg(REG_OFFSET_BLDCNT, BLDCNT_TGT1_BG0 | BLDCNT_EFFECT_LIGHTEN);
    SetGpuReg(REG_OFFSET_BLDY, 13);
}

static void SetTitleScreenScene_Restart(s16 * data)
{
    switch (data[1])
    {
    case 0:
        ScheduleHideSlashSprite(data[6]);
        data[1]++;
        break;
    case 1:
        if (!gPaletteFade.active && !IsSlashSpriteHidden(data[6]))
        {
            FadeOutMapMusic(10);
            BeginNormalPaletteFade(PALETTES_ALL, 3, 0, 0x10, RGB_BLACK);
            SignalEndTitleScreenPaletteSomethingTask();
            data[1]++;
        }
        break;
    case 2:
        if (IsNotWaitingForBGMStop() && !gPaletteFade.active)
        {
            DestroyTask(FindTaskIdByFunc(Task_TitleScreen_BlinkPressStart));
            data[2] = 0;
            data[1]++;
        }
        break;
    case 3:
        data[2]++;
        if (data[2] >= 20)
        {
            DestroyTask(FindTaskIdByFunc(Task_TitleScreen_BlinkPressStart));
            data[1]++;
        }
        break;
    case 4:
        HelpSystem_Disable();
        DestroyTask(FindTaskIdByFunc(Task_TitleScreenMain));
        SetMainCallback2(CB2_InitCopyrightScreenAfterTitleScreen);
        break;
    }
}

static void SetTitleScreenScene_Cry(s16 * data)
{
    switch (data[1])
    {
    case 0:
        if (!gPaletteFade.active)
        {
            PlayCry_Normal(TITLE_SPECIES, 0);
            ScheduleHideSlashSprite(data[6]);
            data[2] = 0;
            data[1]++;
        }
        break;
    case 1:
        if (data[2] < 90)
            data[2]++;
        else if (!IsSlashSpriteHidden(data[6]))
        {
            BeginNormalPaletteFade(0x0FFFFFFF, 0, 0, 0x10, RGB_WHITE);
            SignalEndTitleScreenPaletteSomethingTask();
            FadeOutBGM(4);
            data[1]++;
        }
        break;
    case 2:
        if (!gPaletteFade.active)
        {
            SeedRngAndSetTrainerId();
            SetSaveBlocksPointers();
            ResetMenuAndMonGlobals();
            Save_ResetSaveCounters();
            LoadGameSave(SAVE_NORMAL);
            if (gSaveFileStatus == SAVE_STATUS_EMPTY || gSaveFileStatus == SAVE_STATUS_INVALID)
                Sav2_ClearSetDefault();
            SetPokemonCryStereo(gSaveBlock2Ptr->optionsSound);
            InitHeap(gHeap, HEAP_SIZE);
            SetMainCallback2(CB2_InitMainMenu);
            DestroyTask(FindTaskIdByFunc(Task_TitleScreenMain));
        }
        break;
    }
}

static void Task_TitleScreen_SlideWin0(u8 taskId)
{
    s16 * data = gTasks[taskId].data;

    switch (data[0])
    {
    case 0:
        SetGpuRegBits(REG_OFFSET_DISPCNT, DISPCNT_WIN0_ON);
        SetGpuReg(REG_OFFSET_WININ, WIN_RANGE(0x00, 0x3F));
        SetGpuReg(REG_OFFSET_WINOUT, WIN_RANGE(0x00, 0x37));
        SetGpuReg(REG_OFFSET_WIN0V, 0xA0);
        SetGpuReg(REG_OFFSET_WIN0H, 0x00);
        BlendPalettes(0x00004000, 0, RGB_BLACK);
        data[0]++;
        break;
    case 1:
        data[1] += 0x180;
        data[2] = data[1] >> 4;
        if (data[2] >= 0xF0)
        {
            data[2] = 0xF0;
            data[0]++;
        }
        SetGpuReg(REG_OFFSET_WIN0H, data[2]);
        break;
    case 2:
        data[3]++;
        if (data[3] >= 10)
        {
            data[3] = 0;
            data[0]++;
        }
        break;
    case 3:
        SetGpuReg(REG_OFFSET_WINOUT, WIN_RANGE(0, 0x3B));
        SetGpuReg(REG_OFFSET_WIN0H, 0xF0F0);
        ChangeBgX(2, -0xF000, 0);
        BlendPalettes(0x00008000, 0, RGB_BLACK);
        data[1] = 0xF00;
        data[0]++;
        break;
    case 4:
        data[1] -= 0x180;
        data[2] = data[1] >> 4;
        if (data[2] <= 0)
        {
            data[2] = 0;
            data[0]++;
        }
        ChangeBgX(2, -data[2] << 8, 0);
        SetGpuReg(REG_OFFSET_WIN0H, (data[2] << 8) | 0xF0);
        break;
    case 5:
        ClearGpuRegBits(REG_OFFSET_DISPCNT, DISPCNT_WIN0_ON);
        DestroyTask(taskId);
        break;
    }
}

static void Task_TitleScreen_BlinkPressStart(u8 taskId)
{
    s16 * data = gTasks[taskId].data;
    s32 i;

    if (data[15] && gPaletteFade.active)
        data[14] = 1;
    if (data[14] && !gPaletteFade.active)
        DestroyTask(taskId);
    else
    {
        if (!data[1])
            data[2] = 60;
        else
            data[2] = 30;
        data[0]++;
        if (data[0] >= data[2])
        {
            data[0] = 0;
            data[1] ^= 1;
            if (data[1])
            {
                for (i = 0; i < 5; i++)
                {
                    gPlttBufferUnfaded[0xF1 + i] = gGraphics_TitleScreen_BackgroundPals[6];
                    gPlttBufferFaded[0xF1 + i] = gGraphics_TitleScreen_BackgroundPals[6];
                }
            }
            else
            {
                for (i = 0; i < 5; i++)
                {
                    gPlttBufferUnfaded[0xF1 + i] = gGraphics_TitleScreen_BackgroundPals[1 + i];
                    gPlttBufferFaded[0xF1 + i] = gGraphics_TitleScreen_BackgroundPals[1 + i];
                }
            }
            if (data[14])
            {
                BlendPalettes(0x00008000, gPaletteFade.y, gPaletteFade.blendColor);
            }
        }
    }
}

static void SignalEndTitleScreenPaletteSomethingTask(void)
{
    u8 taskId = FindTaskIdByFunc(Task_TitleScreen_BlinkPressStart);
    gTasks[taskId].data[15] = TRUE;
}

static void UpdateScanlineEffectRegBuffer(s16 a0)
{
    s32 i;

    if (a0 >= 0)
    {
        gScanlineEffectRegBuffers[gScanlineEffect.srcBuffer][a0] = 16;
    }

    for (i = 0; i < 16; i++)
    {
        if (a0 + i >= 0)
        {
            gScanlineEffectRegBuffers[gScanlineEffect.srcBuffer][a0 + i] = 15 - i;
        }
        if (a0 - i >= 0)
        {
            gScanlineEffectRegBuffers[gScanlineEffect.srcBuffer][a0 - i] = 15 - i;
        }
    }
    for (i = a0 + 16; i < 160; i++)
    {
        if (i >= 0)
        {
            gScanlineEffectRegBuffers[gScanlineEffect.srcBuffer][i] = 0;
        }
    }
    for (i = a0 - 16; i >= 0; i--)
    {
        if (i >= 0)
        {
            gScanlineEffectRegBuffers[gScanlineEffect.srcBuffer][i] = 0;
        }
    }
}

static void ScheduleStopScanlineEffect(void)
{
    if (gScanlineEffect.state)
        gScanlineEffect.state = 3;
    SetGpuReg(REG_OFFSET_BLDCNT, 0);
    SetGpuReg(REG_OFFSET_BLDY, 0);
}

static void LoadMainTitleScreenPalsAndResetBgs(void)
{
    u8 taskId;

    taskId = FindTaskIdByFunc(Task_TitleScreen_SlideWin0);
    if (taskId != 0xFF)
        DestroyTask(taskId);

    sub_8071898();
    ResetPaletteFadeControl();
    LoadPalette(gGraphics_TitleScreen_GameTitleLogoPals, 0x00, 0x1A0);
    LoadPalette(gGraphics_TitleScreen_BoxArtMonPals, 0xD0, 0x20);
    LoadPalette(gGraphics_TitleScreen_BackgroundPals, 0xF0, 0x20);
    LoadPalette(gGraphics_TitleScreen_BackgroundPals, 0xE0, 0x20);
    ResetBgPositions();
    ClearGpuRegBits(REG_OFFSET_DISPCNT, DISPCNT_WIN0_ON | DISPCNT_WIN1_ON | DISPCNT_OBJWIN_ON);
    ShowBg(1);
    ShowBg(2);
    ShowBg(0);
    ShowBg(3);
}

static void CB2_FadeOutTransitionToSaveClearScreen(void)
{
    if (!UpdatePaletteFade())
        SetMainCallback2(CB2_SaveClearScreen_Init);
}

static void CB2_FadeOutTransitionToBerryFix(void)
{
    if (!UpdatePaletteFade())
    {
        m4aMPlayAllStop();
        SetMainCallback2(mb_berry_fix_serve);
    }
}

static void LoadSpriteGfxAndPals(void)
{
    s32 i;

    for (i = 0; i < NELEMS(sSpriteSheets); i++)
        LoadCompressedSpriteSheet(&sSpriteSheets[i]);
    LoadSpritePalettes(sSpritePals);
}

static void SpriteCallback_TitleScreenFlameOrLeaf(struct Sprite *sprite)
{
    s16 * data = sprite->data;
    sprite->data[0] -= data[1];
    sprite->x = sprite->data[0] >> 4;
    if (sprite->x < -8)
    {
        DestroySprite(sprite);
        return;
    }
    data[2] += data[3];
    sprite->y = data[2] >> 4;
    if (sprite->y < 0x10 || sprite->y > 0xc8)
    {
        DestroySprite(sprite);
        return;
    }
#if defined(FIRERED)
    if (sprite->animEnded)
    {
        DestroySprite(sprite);
        return;
    }
    if (data[7] != 0 && --data[7] == 0)
    {
        StartSpriteAnim(sprite, 0);
        sprite->invisible = FALSE;
    }
#elif defined(LEAFGREEN)
    if (!data[5])
    {
        s32 r2;
        s32 r1;
        data[6]++;
        r2 = data[1] * data[6];
        r1 = data[6] * data[3];
        r2 = (r2 * r2) >> 4;
        r1 = (r1 * r1) >> 4;
        if (r2 + r1 >= 0x510)
            data[5] = TRUE;
    }
#endif
}

#if defined(FIRERED)
static bool32 CreateFlameOrLeafSprite(s32 x, s32 y, s32 xspeed, s32 yspeed, bool32 templateId)
{
    u8 spriteId;
    if (templateId)
    {
        spriteId = CreateSprite(&sSpriteTemplate_FlameOrLeaf_State1, x, y, 0);
    }
    else
    {
        spriteId = CreateSprite(&sSpriteTemplate_FlameOrLeaf_State0, x, y, 0);
    }
    if (spriteId != MAX_SPRITES)
    {
        gSprites[spriteId].data[0] = x << 4;
        gSprites[spriteId].data[1] = xspeed;
        gSprites[spriteId].data[2] = y << 4;
        gSprites[spriteId].data[3] = yspeed;
        gSprites[spriteId].data[4] = 0;
        gSprites[spriteId].data[5] = (xspeed * yspeed) % 16;
        gSprites[spriteId].data[6] = templateId;
        gSprites[spriteId].callback = SpriteCallback_TitleScreenFlameOrLeaf;
        return TRUE;
    }
    return FALSE;
}

static void Task_FlameOrLeafSpawner(u8 taskId)
{
    s16 * data = gTasks[taskId].data;
    s32 x, y, xspeed, yspeed, templateId;
    s32 i;

    switch (data[0])
    {
    case 0:
        TitleScreen_srand(taskId, 3, 30840);
        data[0]++;
        break;
    case 1:
        data[1]++;
        if (data[1] >= data[2])
        {
            data[1] = 0;
            TitleScreen_rand(taskId, 3);
            data[2] = 18;
            xspeed = (TitleScreen_rand(taskId, 3) % 4) - 2;
            yspeed = (TitleScreen_rand(taskId, 3) % 8) - 16;
            y = (TitleScreen_rand(taskId, 3) % 3) + 0x74;
            x = TitleScreen_rand(taskId, 3) % 240;
            CreateFlameOrLeafSprite(
                x,
                y,
                xspeed,
                yspeed,
                (TitleScreen_rand(taskId, 3) % 16) < 8 ? 0 : 1
            );
            for (i = 0; i < 15; i++)
            {
                CreateFlameOrLeafSprite(
                    data[5] + gUnknown_83BFBD4[i],
                    y,
                    xspeed,
                    yspeed,
                    1
                );
                xspeed = (TitleScreen_rand(taskId, 3) % 4) - 2;
                yspeed = (TitleScreen_rand(taskId, 3) % 8) - 16;
            }
            data[5]++;
            if (data[5] > 3)
                data[5] = 0;
        }
    }
}

#elif defined(LEAFGREEN)

static void CreateFlameOrLeafSprite(s32 y0, s32 x1, s32 y1)
{
    u8 spriteId = CreateSprite(&sSpriteTemplate_FlameOrLeaf_State1, 0xF0, y0, 0);
    if (spriteId != MAX_SPRITES)
    {
        gSprites[spriteId].data[0] = 0xF00;
        gSprites[spriteId].data[1] = x1;
        gSprites[spriteId].data[2] = y0 << 4;
        gSprites[spriteId].data[3] = y1;
        gSprites[spriteId].callback = SpriteCallback_TitleScreenFlameOrLeaf;
    }
}

static void SpriteCallback_LG_8079800(struct Sprite *sprite)
{
    sprite->x -= 7;
    if (sprite->x < -16)
    {
        sprite->x = 0x100;
        sprite->data[7]++;
        if (sprite->data[7] >= NELEMS(gUnknown_LG_83BFA10))
            sprite->data[7] = 0;
        sprite->y = gUnknown_LG_83BFA10[sprite->data[7]];
    }
}

static void sub_LG_8079844(void)
{
    int i;
    u8 spriteId;
    for (i = 0; i < 4; i++)
    {
        spriteId = CreateSprite(&sSpriteTemplate_FlameOrLeaf_State0, 0x100 + 0x28 * i, gUnknown_LG_83BFA10[i], 0xFF);
        if (spriteId != MAX_SPRITES)
        {
            gSprites[spriteId].data[7] = i;
            gSprites[spriteId].callback = SpriteCallback_LG_8079800;
        }
    }
}

static void Task_FlameOrLeafSpawner(u8 taskId)
{
    s16 * data = gTasks[taskId].data;
    s32 rval;
    s32 r6;
    s32 r4;
    s32 r0;

    switch (data[0])
    {
    case 0:
        sub_LG_8079844();
        TitleScreen_srand(taskId, 3, 30840);
        data[0]++;
        break;
    case 1:
        data[1]++;
        if (data[1] >= data[2])
        {
            data[1] = 0;
            data[2] = (TitleScreen_rand(taskId, 3) % 6) + 6;
            rval = TitleScreen_rand(taskId, 3) % 30;
            r6 = 16;
            if (rval >= 6)
            {
                r6 = 48;
                if (rval < 12)
                    r6 = 24;
            }
            r4 = (TitleScreen_rand(taskId, 3) % 4) - 2;
            r0 = (TitleScreen_rand(taskId, 3) % 88) + 32;
            CreateFlameOrLeafSprite(r0, r6, r4);
        }
        break;
    }
}

#endif //FRLG

static void TitleScreen_srand(u8 taskId, u8 field, u16 seed)
{
    SetWordTaskArg(taskId, field, seed);
}

static u16 TitleScreen_rand(u8 taskId, u8 field)
{
    u32 rngval;

    rngval = GetWordTaskArg(taskId, field);
    rngval = ISO_RANDOMIZE1(rngval);
    SetWordTaskArg(taskId, field, rngval);
    return rngval >> 16;
}

static u32 CreateBlankSprite(void)
{
    CreateSprite(&sUnknownEmptySprite, 0x18, 0x90, 0);
    return IndexOfSpritePaletteTag(2);
}

static void SetPalOnOrCreateBlankSprite(bool32 mode)
{
    u32 palIdx;

    if (mode)
    {
        palIdx = IndexOfSpritePaletteTag(2);
        LoadPalette(gGraphics_TitleScreen_FireOrLeafPals, palIdx * 16 + 0x100, 0x20);
    }
    else
        CreateBlankSprite();
}

static u8 CreateSlashSprite(void)
{
    u8 spriteId = CreateSprite(&sSlashSpriteTemplate, -0x20, 0x1B, 1);
    if (spriteId != MAX_SPRITES)
    {
        gSprites[spriteId].callback = SpriteCallback_Slash;
        gSprites[spriteId].data[1] = 540;
    }
    return spriteId;
}

static void ScheduleHideSlashSprite(u8 spriteId)
{
    if (spriteId != MAX_SPRITES)
        gSprites[spriteId].data[2] = TRUE;
}

static bool32 IsSlashSpriteHidden(u8 spriteId)
{
    if (spriteId != MAX_SPRITES)
        return gSprites[spriteId].data[0] ^ 2 ? TRUE : FALSE;
    else
        return FALSE;
}

static void SpriteCallback_Slash(struct Sprite *sprite)
{
    switch (sprite->data[0])
    {
    case 0:
        if (sprite->data[2])
        {
            sprite->invisible = TRUE;
            sprite->data[0] = 2;
        }
        sprite->data[1]--;
        if (sprite->data[1] == 0)
        {
            sprite->invisible = FALSE;
            sprite->data[0] = 1;
        }
        break;
    case 1:
        sprite->x += 9;
        if (sprite->x == 67)
        {
            sprite->y -= 7;
        }
        if (sprite->x == 148)
        {
            sprite->y += 7;
        }
        if (sprite->x > 272)
        {
            sprite->invisible = TRUE;
            if (sprite->data[2])
                sprite->data[0] = 2;
            else
            {
                sprite->x = -0x20;
                sprite->data[1] = 540;
                sprite->data[0] = 0;
            }
        }
        break;
    case 2:
        break;
    }
}
