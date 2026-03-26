#include "global.h"
#include "gflib.h"
#include "data.h"
#include "decompress.h"
#include "dynamic_placeholder_text_util.h"
#include "item.h"
#include "item_menu_icons.h"
#include "menu.h"
#include "new_menu_helpers.h"
#include "pokemon_special_anim_internal.h"
#include "random.h"
#include "strings.h"
#include "text_window.h"
#include "trig.h"
#include "constants/songs.h"

static void LoadBgGfxByAnimType(u16 animType);
static void Task_ZoomAnim(u8 taskId);
static void SetSpriteWithCloseness(struct Sprite *sprite, u8 closeness);
static bool8 IsZoomSpriteCBActive(struct Sprite *sprite);
static void MonSpriteZoom_UpdateYPos(struct Sprite *sprite, u8 closeness);
static void ItemSpriteZoom_UpdateYPos(struct Sprite *sprite, u8 closeness);
static void StartMonWiggleAnim(struct PokemonSpecialAnimScene * scene, u8 frameLen, u8 niter, u8 amplitude);
static void StopMonWiggleAnim(struct PokemonSpecialAnimScene * scene);
static void SpriteCallback_MonSpriteWiggle(struct Sprite *sprite);
static void LoadMonSpriteGraphics(u16 *tilees, u16 *palette);
static struct Sprite *PSA_CreateItemIconObject(u16 itemId);
static u16 GetBlendColorByItemId(u16 itemId);
static void Task_ItemUseOnMonAnim(u8 taskId);
static void CreateSprites_UseItem_OutwardSpiralDots(u8 taskId, s16 *data, struct Sprite *sprite);
static void SpriteCB_OutwardSpiralDots(struct Sprite *sprite);
static void InitItemIconSpriteState(struct PokemonSpecialAnimScene * scene, struct Sprite *sprite, u8 closeness);
static void MachineSetWobbleInit(void);
static void MachineSetWobble_SetCB(struct Sprite *sprite);
static bool8 MachineSetWobbleCBIsRunning(void);
static void SpriteCB_MachineSetWobble(struct Sprite *sprite);
static void StartZoomOutAnimForUseTM(u8 closeness);
static void CreateStarSprites(struct PokemonSpecialAnimScene * scene);
static bool8 AnyStarSpritesActive(void);
static void SpriteCB_Star(struct Sprite *sprite);
static void PSAScene_SeedRandomInTask(struct PokemonSpecialAnimScene * scene);
static void StopMakingOutwardSpiralDots(void);
static void Task_UseItem_OutwardSpiralDots(u8 taskId);
static u16 PSAScene_RandomFromTask(u8 taskId);
static void SpriteCallback_UseItem_OutwardSpiralDots(struct Sprite *sprite);
static void LoadOutwardSpiralDotsGfx(void);
static bool32 IsOutwardSpiralDotsTaskRunning(void);
static void Task_LevelUpVerticalSprites(u8 taskId);
static void CreateLevelUpVerticalSprite(u8 taskId, s16 *data);
static void SpriteCB_LevelUpVertical(struct Sprite *sprite);

static const u16 sBg_Pal[] = INCBIN_U16("graphics/pokemon_special_anim/bg.gbapal");
static const u16 sBg_TmHm_Pal[] = INCBIN_U16("graphics/pokemon_special_anim/bg_tm_hm.gbapal");
static const u32 sBg_Gfx[] = INCBIN_U32("graphics/pokemon_special_anim/bg.4bpp.lz");
static const u32 sBg_Tilemap[] = INCBIN_U32("graphics/pokemon_special_anim/bg.bin.lz");
static const u16 sLevelUp_Pal[] = INCBIN_U16("graphics/pokemon_special_anim/level_up.gbapal");
static const u32 sLevelUp_Gfx[] = INCBIN_U32("graphics/pokemon_special_anim/level_up.4bpp.lz");
static const u16 sStar_Pal[] = INCBIN_U16("graphics/pokemon_special_anim/star.gbapal");
static const u32 sStar_Gfx[] = INCBIN_U32("graphics/pokemon_special_anim/star.4bpp.lz");
static const u16 sOutwardSpiralDots_Pal[] = INCBIN_U16("graphics/pokemon_special_anim/outward_spiral_dots.gbapal");
static const u32 sOutwardSpiralDots_Gfx[] = INCBIN_U32("graphics/pokemon_special_anim/outward_spiral_dots.4bpp.lz");

static const struct BgTemplate sBgTemplates[] = {
    {
        .bg = 0,
        .charBaseIndex = 0,
        .mapBaseIndex = 31,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 0,
        .baseTile = 0x001
    }, {
        .bg = 3,
        .charBaseIndex = 3,
        .mapBaseIndex = 28,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 3,
        .baseTile = 0x000
    }
};

static const struct WindowTemplate sWindowTemplates[] = {
    {
        .bg = 0,
        .tilemapLeft = 1,
        .tilemapTop = 15,
        .width = 28,
        .height = 4,
        .paletteNum = 15,
        .baseBlock = 0x00a
    }, DUMMY_WIN_TEMPLATE
};

static const u8 *const s1_2_and_Poof_textPtrs[] = {
    gText_Counting_1,
    gText_Counting_2And,
    gText_Poof,
};

static const u16 sUnusedArray[] = {
    0, 16, 68
};

static const u16 sAffineScales[] = {
    0x100,
    0x155,
    0x1AA,
    0x200
};

static const s8 sStarCoordOffsets[][2] = {
    {-8,  -8},
    { 6, -13},
    { 8,  -8}
};

static const struct CompressedSpriteSheet sSpriteSheet_Star = {
    sStar_Gfx,
    0x80,
    2
};

static const struct SpritePalette sSpritePalette_Star = {
    sStar_Pal,
    2
};

static const struct CompressedSpriteSheet sSpriteSheet_UseItem_OutwardSpiralDots = {
    sOutwardSpiralDots_Gfx,
    0x60,
    5
};

static const struct SpritePalette sSpritePalette_UseItem_OutwardSpiralDots = {
    sOutwardSpiralDots_Pal,
    5
};

static const struct OamData sOamData_MonSprite = {
    .y = 0,
    .affineMode = ST_OAM_AFFINE_DOUBLE,
    .objMode = ST_OAM_OBJ_NORMAL,
    .mosaic = FALSE,
    .bpp = ST_OAM_4BPP,
    .shape = SPRITE_SHAPE(64x64),
    .x = 0,
    .matrixNum = 0,
    .size = SPRITE_SIZE(64x64),
    .tileNum = 0x000,
    .priority = 1,
    .paletteNum = 0
};


static const union AffineAnimCmd sAffineAnim_Zoom_0[] = {
    AFFINEANIMCMD_FRAME(0x100, 0x100, 0, 0),
    AFFINEANIMCMD_END
};

static const union AffineAnimCmd sAffineAnim_Zoom_1[] = {
    AFFINEANIMCMD_FRAME(0x155, 0x155, 0, 0),
    AFFINEANIMCMD_END
};

static const union AffineAnimCmd sAffineAnim_Zoom_2[] = {
    AFFINEANIMCMD_FRAME(0x1AA, 0x1AA, 0, 0),
    AFFINEANIMCMD_END
};

static const union AffineAnimCmd sAffineAnim_Zoom_3[] = {
    AFFINEANIMCMD_FRAME(0x200, 0x200, 0, 0),
    AFFINEANIMCMD_END
};

static const union AffineAnimCmd *const sAffineAnimTable_Zoom[] = {
    sAffineAnim_Zoom_0,
    sAffineAnim_Zoom_1,
    sAffineAnim_Zoom_2,
    sAffineAnim_Zoom_3
};

static const struct SpriteTemplate sSpriteTemplate_MonSprite = {
    .tileTag = 0,
    .paletteTag = 0,
    .oam = &sOamData_MonSprite,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = sAffineAnimTable_Zoom,
    .callback = SpriteCallbackDummy
};

static const union AffineAnimCmd sAffineAnim_ItemZoom_0[] = {
    AFFINEANIMCMD_FRAME(0x100, 0x100, 0, 0),
    AFFINEANIMCMD_FRAME(-28, -28, 0, 8),
    AFFINEANIMCMD_END
};

static const union AffineAnimCmd sAffineAnim_ItemZoom_1[] = {
    AFFINEANIMCMD_FRAME(0x155, 0x155, 0, 0),
    AFFINEANIMCMD_FRAME(-37, -37, 0, 8),
    AFFINEANIMCMD_END
};

static const union AffineAnimCmd sAffineAnim_ItemZoom_2[] = {
    AFFINEANIMCMD_FRAME(0x1AA, 0x1AA, 0, 0),
    AFFINEANIMCMD_FRAME(-47, -47, 0, 8),
    AFFINEANIMCMD_END
};

static const union AffineAnimCmd sAffineAnim_ItemZoom_3[] = {
    AFFINEANIMCMD_FRAME(0x200, 0x200, 0, 0),
    AFFINEANIMCMD_FRAME(-56, -56, 0, 8),
    AFFINEANIMCMD_END
};

static const union AffineAnimCmd *const sAffineAnimTable_ItemZoom[] = {
    sAffineAnim_ItemZoom_0,
    sAffineAnim_ItemZoom_1,
    sAffineAnim_ItemZoom_2,
    sAffineAnim_ItemZoom_3
};

static const struct OamData sOamData_LevelUpVertical = {
    .y = 0,
    .affineMode = ST_OAM_AFFINE_OFF,
    .objMode = ST_OAM_OBJ_BLEND,
    .mosaic = FALSE,
    .bpp = ST_OAM_4BPP,
    .shape = SPRITE_SHAPE(8x16),
    .x = 0,
    .matrixNum = 0,
    .size = SPRITE_SIZE(8x16),
    .tileNum = 0x000,
    .priority = 1,
    .paletteNum = 0
};

static const union AnimCmd sAnim_LevelUpVertical[] = {
    ANIMCMD_FRAME(0, 3),
    ANIMCMD_END
};

static const union AnimCmd *const sAnimTable_LevelUpVertical[] = {
    sAnim_LevelUpVertical
};

static const struct SpriteTemplate sSpriteTemplate_LevelUpVertical = {
    .tileTag = 0,
    .paletteTag = 0,
    .oam = &sOamData_LevelUpVertical,
    .anims = sAnimTable_LevelUpVertical,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCB_LevelUpVertical
};

static const struct OamData sOamData_Star = {
    .y = 0,
    .affineMode = ST_OAM_AFFINE_OFF,
    .objMode = ST_OAM_OBJ_NORMAL,
    .mosaic = FALSE,
    .bpp = ST_OAM_4BPP,
    .shape = SPRITE_SHAPE(16x16),
    .x = 0,
    .matrixNum = 0,
    .size = SPRITE_SIZE(16x16),
    .tileNum = 0x000,
    .priority = 1,
    .paletteNum = 0
};

static const struct SpriteTemplate sSpriteTemplate_Star = {
    .tileTag = 2,
    .paletteTag = 2,
    .oam = &sOamData_Star,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCB_Star
};

static const struct OamData sOamData_UseItem_OutwardSpiralDots = {
    .y = 0,
    .affineMode = ST_OAM_AFFINE_OFF,
    .objMode = ST_OAM_OBJ_NORMAL,
    .mosaic = FALSE,
    .bpp = ST_OAM_4BPP,
    .shape = SPRITE_SHAPE(8x8),
    .x = 0,
    .matrixNum = 0,
    .size = SPRITE_SIZE(8x8),
    .tileNum = 0x000,
    .priority = 0,
    .paletteNum = 0
};

static const union AnimCmd sAnim_UseItem_OutwardSpiralDots_0[] = {
    ANIMCMD_FRAME(0, 16),
    ANIMCMD_FRAME(1,  8),
    ANIMCMD_FRAME(2,  4),
    ANIMCMD_END
};

static const union AnimCmd sAnim_UseItem_OutwardSpiralDots_1[] = {
    ANIMCMD_FRAME(1, 4),
    ANIMCMD_FRAME(0, 4),
    ANIMCMD_END
};

static const union AnimCmd *const sAnimTable_UseItem_OutwardSpiralDots[] = {
    sAnim_UseItem_OutwardSpiralDots_0,
    sAnim_UseItem_OutwardSpiralDots_1
};

static const struct SpriteTemplate sSpriteTemplate_UseItem_OutwardSpiralDots = {
    .tileTag = 5,
    .paletteTag = 5,
    .oam = &sOamData_UseItem_OutwardSpiralDots,
    .anims = sAnimTable_UseItem_OutwardSpiralDots,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallback_UseItem_OutwardSpiralDots
};

void InitPokemonSpecialAnimScene(struct PokemonSpecialAnimScene * buffer, u16 animType)
{
    FreeAllWindowBuffers();
    ResetTempTileDataBuffers();
    SetGpuReg(REG_OFFSET_DISPCNT, 0);
    ResetBgsAndClearDma3BusyFlags(FALSE);
    InitBgsFromTemplates(0, sBgTemplates, NELEMS(sBgTemplates));
    InitWindows(sWindowTemplates);
    ChangeBgX(0, 0, 0);
    ChangeBgY(0, 0, 0);
    ChangeBgX(3, 0, 0);
    ChangeBgY(3, 0, 0);
    SetBgTilemapBuffer(0, buffer->field_0914);
    SetBgTilemapBuffer(3, buffer->field_1914);
    RequestDma3Fill(0, (void *)BG_VRAM, 0x20, DMA3_32BIT);
    FillBgTilemapBufferRect_Palette0(0, 0x000, 0, 0, 32, 32);
    LoadBgGfxByAnimType(animType);
    FillWindowPixelBuffer(0, PIXEL_FILL(0));
    LoadUserWindowGfx(0, 0x000, BG_PLTT_ID(14));
    CopyWindowToVram(0, COPYWIN_FULL);
    ShowBg(0);
    ShowBg(3);
    HideBg(1);
    HideBg(2);
    CopyBgTilemapBufferToVram(0);
    CopyBgTilemapBufferToVram(3);
    SetGpuRegBits(REG_OFFSET_DISPCNT, DISPCNT_MODE_0 | DISPCNT_OBJ_1D_MAP | DISPCNT_OBJ_ON);
    SetGpuReg(REG_OFFSET_BLDCNT, 0);
}

bool8 PokemonSpecialAnimSceneInitIsNotFinished(void)
{
    if (!FreeTempTileDataBuffersIfPossible())
        return IsDma3ManagerBusyWithBgCopy();
    else
        return TRUE;
}

void PSA_FreeWindowBuffers(void)
{
    FreeAllWindowBuffers();
}

void PSA_ShowMessageWindow(void)
{
    PutWindowTilemap(0);
    FillWindowPixelBuffer(0, PIXEL_FILL(1));
    DrawTextBorderOuter(0, 0x001, 14);
    CopyWindowToVram(0, COPYWIN_FULL);
}

void PSA_HideMessageWindow(void)
{
    ClearWindowTilemap(0);
    ClearStdWindowAndFrameToTransparent(0, FALSE);
    CopyWindowToVram(0, COPYWIN_MAP);
}

void PSA_PrintMessage(u8 messageId)
{
    struct PokemonSpecialAnimScene * scene = PSA_GetSceneWork();
    u16 itemId = PSA_GetItemId();
    u16 strWidth = 0;
    u8 textSpeed = GetTextSpeedSetting();
    struct Pokemon * pokemon = PSA_GetPokemon();
    u16 level;
    u8 *str;

    switch (messageId)
    {
    case 0: // Item was used on Mon
        str = StringCopy(scene->textBuf, ItemId_GetName(itemId));
        str = StringCopy(str, gText_WasUsedOn);
        GetMonData(pokemon, MON_DATA_NICKNAME, str);
        StringAppend(scene->textBuf, gText_Period);
        break;
    case 1: // Mon's level was elevated to level
        level = GetMonData(pokemon, MON_DATA_LEVEL);
        GetMonData(pokemon, MON_DATA_NICKNAME, scene->textBuf);
        str = StringAppend(scene->textBuf, gText_LevelRoseTo);
        if (level < MAX_LEVEL)
            level++;
        str = ConvertIntToDecimalStringN(str, level, STR_CONV_MODE_LEFT_ALIGN, level < MAX_LEVEL ? 2 : 3);
        StringAppend(str, gText_Period2);
        break;
    case 9: // Mon learned move
        DynamicPlaceholderTextUtil_Reset();
        DynamicPlaceholderTextUtil_SetPlaceholderPtr(0, PSA_GetMonNickname());
        DynamicPlaceholderTextUtil_SetPlaceholderPtr(1, PSA_GetNameOfMoveToTeach());
        DynamicPlaceholderTextUtil_ExpandPlaceholders(scene->textBuf, gText_MonLearnedTMHM);
        break;
    case 4:
        strWidth += GetStringWidth(FONT_NORMAL, gText_Counting_2And, -1);
        // fallthrough
    case 3:
        strWidth += GetStringWidth(FONT_NORMAL, gText_Counting_1, -1);
        // fallthrough
    case 2: // 1
        StringCopy(scene->textBuf, s1_2_and_Poof_textPtrs[messageId - 2]);
        textSpeed = 1;
        break;
    case 5:
        DynamicPlaceholderTextUtil_Reset();
        DynamicPlaceholderTextUtil_SetPlaceholderPtr(0, PSA_GetMonNickname());
        DynamicPlaceholderTextUtil_SetPlaceholderPtr(1, PSA_GetNameOfMoveForgotten());
        DynamicPlaceholderTextUtil_ExpandPlaceholders(scene->textBuf, gText_MonForgotMove);
        break;
    case 6:
        StringCopy(scene->textBuf, gText_And);
        break;
    case 7:
        StringCopy(scene->textBuf, gText_MachineSet);
        break;
    case 8:
        StringCopy(scene->textBuf, gText_Huh);
        break;
    default:
        return;
    }

    AddTextPrinterParameterized5(0, FONT_NORMAL, scene->textBuf, strWidth, 0, textSpeed, NULL, 0, 4);
}

void PSA_AfterPoof_ClearMessageWindow(void)
{
    FillWindowPixelBuffer(0, PIXEL_FILL(1));
    CopyWindowToVram(0, COPYWIN_GFX);
}

bool8 PSA_IsMessagePrintTaskActive(void)
{
    return IsTextPrinterActive(0);
}

void PSA_DarkenMonSprite(void)
{
    struct PokemonSpecialAnimScene * scene = PSA_GetSceneWork();
    scene->state = 0;
    BlendPalettes((0x10000 << IndexOfSpritePaletteTag(0)) | 4, 16, RGB_BLACK);
    CreateStarSprites(scene);
}

bool8 PSA_RunPoofAnim(void)
{
    struct PokemonSpecialAnimScene * scene = PSA_GetSceneWork();

    switch (scene->state)
    {
    case 0:
        if (!AnyStarSpritesActive())
        {
            BeginNormalPaletteFade((0x10000 << IndexOfSpritePaletteTag(0)) | 4, -1, 16, 0, RGB_BLACK);
            scene->state++;
        }
        break;
    case 1:
        if (!gPaletteFade.active)
            return FALSE;
        break;
    }
    return TRUE;
}

void PSA_UseTM_SetUpZoomOutAnim(void)
{
    struct PokemonSpecialAnimScene * scene = PSA_GetSceneWork();
    scene->state = 0;
}

void PSA_UseTM_CleanUpForCancel(void)
{
    StopMakingOutwardSpiralDots();
    ResetPaletteFadeControl();
}

bool8 PSA_UseTM_RunZoomOutAnim(void)
{
    struct PokemonSpecialAnimScene * scene = PSA_GetSceneWork();
    switch (scene->state)
    {
    case 0:
        StartZoomOutAnimForUseTM(0);
        scene->state++;
        break;
    case 1:
        if (!PSA_IsZoomTaskActive())
        {
            scene->field_0004 = 0;
            scene->state++;
        }
        break;
    case 2:
        scene->field_0004++;
        if (scene->field_0004 > 20)
            scene->state++;
        break;
    case 3:
        StartMonWiggleAnim(scene, 1, 0, 1);
        scene->field_0004 = 0;
        scene->state++;
        break;
    case 4:
        scene->field_0004++;
        if (scene->field_0004 > 0)
        {
            scene->field_0004 = 0;
            PlaySE(SE_M_MEGA_KICK);
            BeginNormalPaletteFade(0x00000001, 2, 0, 12, RGB(8, 13, 31));
            PSAScene_SeedRandomInTask(scene);
            scene->state++;
        }
        break;
    case 5:
        scene->field_0004++;
        if (scene->field_0004 > 70)
        {
            StopMonWiggleAnim(scene);
            BeginNormalPaletteFade(0x00000001, 6, 12, 0, RGB(8, 13, 31));
            scene->field_0004 = 0;
            scene->state++;
        }
        break;
    case 6:
        scene->field_0004++;
        if (!IsOutwardSpiralDotsTaskRunning() && scene->field_0004 > 40)
        {
            scene->field_0004 = 0;
            scene->state++;
        }
        break;
    case 7:
        scene->field_0004++;
        if (scene->field_0004 > 20)
        {
            scene->state++;
        }
        break;
    case 8:
        PlaySE(SE_EXP_MAX);
        DestroySprite(scene->itemIconSprite);
        scene->state++;
        break;
    default:
        return FALSE;
    }
    return TRUE;
}

void PSA_UseTM_SetUpMachineSetWobble(void)
{
    struct PokemonSpecialAnimScene * scene = PSA_GetSceneWork();
    scene->state = 0;
}

bool8 PSA_UseTM_RunMachineSetWobble(void)
{
    struct PokemonSpecialAnimScene * scene = PSA_GetSceneWork();

    switch (scene->state)
    {
    case 0:
        MachineSetWobbleInit();
        PlaySE(SE_SWITCH);
        scene->state++;
        break;
    case 1:
        return MachineSetWobbleCBIsRunning();
    }
    return TRUE;
}

// There may once have been plans to put the battle level up
// anim in with using Rare Candy, but they were scrapped
// at a later stage of development

// Unused
void PSA_CreateLevelUpVerticalSpritesTask(void)
{
    CreateLevelUpVerticalSpritesTask(120, 56, 4, 4, 2, 0);
}

bool8 PSA_LevelUpVerticalSpritesTaskIsRunning(void)
{
    return LevelUpVerticalSpritesTaskIsRunning();
}

// Unused
void PSA_DrawLevelUpWindowPg1(u16 *statsBefore, u16 *statsAfter)
{
    DrawTextBorderOuter(1, 0x001, 14);
    DrawLevelUpWindowPg1(1, statsBefore, statsAfter, TEXT_COLOR_WHITE, TEXT_COLOR_DARK_GRAY, TEXT_COLOR_LIGHT_GRAY);
    PutWindowTilemap(1);
    CopyWindowToVram(1, COPYWIN_FULL);
}

// Unused
void PSA_DrawLevelUpWindowPg2(u16 *currStats)
{
    DrawLevelUpWindowPg2(1, currStats, TEXT_COLOR_WHITE, TEXT_COLOR_DARK_GRAY, TEXT_COLOR_LIGHT_GRAY);
    CopyWindowToVram(1, COPYWIN_GFX);
}

// Unused
bool8 PSA_IsCopyingLevelUpWindowToVram(void)
{
    return IsDma3ManagerBusyWithBgCopy();
}

static void LoadBgGfxByAnimType(u16 animType)
{
    CopyToBgTilemapBuffer(3, sBg_Tilemap, 0, 0x000);
    DecompressAndCopyTileDataToVram(3, sBg_Gfx, 0, 0x000, 0);
    if (animType != 4)
        LoadPalette(sBg_Pal, BG_PLTT_ID(0), sizeof(sBg_Pal));
    else
        LoadPalette(sBg_TmHm_Pal, BG_PLTT_ID(0), sizeof(sBg_TmHm_Pal));
}

void PSA_CreateMonSpriteAtCloseness(u8 closeness)
{
    struct PokemonSpecialAnimScene * scene = PSA_GetSceneWork();
    struct Pokemon * pokemon = PSA_GetPokemon();
    u16 species = GetMonData(pokemon, MON_DATA_SPECIES);
    u32 personality = GetMonData(pokemon, MON_DATA_PERSONALITY);
    u8 r1 = Menu2_GetMonSpriteAnchorCoord(species, personality, 2);
    void *r6;
    void *r9;
    void *r4;
    u8 spriteId;

    if (r1 != 0xFF)
    {
        scene->monSpriteY1 = 0x48;
        scene->monSpriteY2 = r1 + 0x30;
    }
    else
    {
        scene->monSpriteY1 = 0x48;
        scene->monSpriteY2 = 0x60;
    }

    r6 = Alloc(0x2000);
    r9 = Alloc(0x2000);
    r4 = Alloc(0x100);
    if (r6 != NULL && r9 != NULL && r4 != NULL)
    {
        HandleLoadSpecialPokePic(&gMonFrontPicTable[species], r6, species, personality);
        LZ77UnCompWram(GetMonFrontSpritePal(pokemon), r4);
        LoadMonSpriteGraphics(r6, r4);
        spriteId = CreateSprite(&sSpriteTemplate_MonSprite, 120, scene->monSpriteY1, 4);
        if (spriteId != MAX_SPRITES)
        {
            scene->monSprite = &gSprites[spriteId];
            MonSpriteZoom_UpdateYPos(scene->monSprite, closeness);
        }
        else
            scene->monSprite = NULL;
        scene->lastCloseness = closeness;
    }
    if (r6 != NULL) Free(r6);
    if (r9 != NULL) Free(r9);
    if (r4 != NULL) Free(r4);
}

#define tState          data[0]
#define tCurrCloseness  data[1]
#define tFinalCloseness data[2]
#define tDeltaCloseness data[3]
#define tTimer          data[4]
#define tDelay          data[5]
#define tOff_MonSprite  6
#define tHasItemSprite  data[8]
#define tOff_ItemSprite 9

void PSA_SetUpZoomAnim(u8 closeness)
{
    struct PokemonSpecialAnimScene * scene = PSA_GetSceneWork();
    u8 taskId;
    if (closeness != scene->lastCloseness)
    {
        taskId = CreateTask(Task_ZoomAnim, 4);
        SetWordTaskArg(taskId, tOff_MonSprite, (uintptr_t)scene->monSprite);
        gTasks[taskId].tCurrCloseness = scene->lastCloseness;
        gTasks[taskId].tFinalCloseness = closeness;
        gTasks[taskId].tDelay = 6;
        if (closeness > scene->lastCloseness)
            gTasks[taskId].tDeltaCloseness = 1;
        else
            gTasks[taskId].tDeltaCloseness = -1;
    }
}

bool8 PSA_IsZoomTaskActive(void)
{
    return FuncIsActiveTask(Task_ZoomAnim);
}

static void Task_ZoomAnim(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    struct Sprite *sprite = (void *)GetWordTaskArg(taskId, tOff_MonSprite);
    switch (tState)
    {
    case 0:
        SetSpriteWithCloseness(sprite, tCurrCloseness);
        if (tHasItemSprite)
            SetSpriteWithCloseness((void *)GetWordTaskArg(taskId, tOff_ItemSprite), tCurrCloseness);
        tCurrCloseness += tDeltaCloseness;
        tState++;
        break;
    case 1:
        if (!IsZoomSpriteCBActive(sprite))
        {
            PlaySE(SE_BALL_TRAY_EXIT);
            MonSpriteZoom_UpdateYPos(sprite, tCurrCloseness);
            if (tHasItemSprite)
                ItemSpriteZoom_UpdateYPos((void *)GetWordTaskArg(taskId, tOff_ItemSprite), tCurrCloseness);
            if (tCurrCloseness == tFinalCloseness)
            {
                PSA_GetSceneWork()->lastCloseness = tFinalCloseness;
                DestroyTask(taskId);
            }
            else
            {
                tTimer = 0;
                tState = 2;
            }
        }
        break;
    case 2:
        tTimer++;
        if (tTimer > tDelay)
            tState = 0;
        break;
    }
}

static void SetSpriteWithCloseness(struct Sprite *sprite, u8 closeness)
{
    sprite->data[0] = 0;
    sprite->data[1] = 0;
    sprite->data[2] = closeness;
}

static bool8 IsZoomSpriteCBActive(struct Sprite *sprite)
{
    return sprite->callback != SpriteCallbackDummy;
}

static s16 GetSpriteOffsetByScale(s16 pos, u8 closeness)
{
    return (pos * sAffineScales[closeness]) >> 8;
}

// FIXME: better math
static u16 GetYPosByScale(u16 pos)
{
    struct PokemonSpecialAnimScene * scene = PSA_GetSceneWork();
    s32 v = ((((((scene->monSpriteY2 - scene->monSpriteY1) << 16) >> 8) / 256 * (pos - 256)) << 8) >> 16);
    return v += scene->monSpriteY1;
}

static void MonSpriteZoom_UpdateYPos(struct Sprite *sprite, u8 closeness)
{
    if (closeness > 3)
        closeness = 3;
    PSA_GetSceneWork(); // return value not used
    StartSpriteAffineAnim(sprite, closeness);
    sprite->y = GetYPosByScale(sAffineScales[closeness]);
}

static void ItemSpriteZoom_UpdateYPos(struct Sprite *sprite, u8 closeness)
{
    MonSpriteZoom_UpdateYPos(sprite, closeness);
    sprite->x2 = GetSpriteOffsetByScale(sprite->data[6] - 32, closeness);
    sprite->y2 = GetSpriteOffsetByScale(sprite->data[7] - 32, closeness);
}

static void StartMonWiggleAnim(struct PokemonSpecialAnimScene * scene, u8 frameLen, u8 niter, u8 amplitude)
{
    // frameLen: frame duration
    // niter = 0: iterate ad infinitum
    scene->monSprite->data[0] = frameLen;
    scene->monSprite->data[1] = niter;
    scene->monSprite->data[2] = amplitude;
    scene->monSprite->callback = SpriteCallback_MonSpriteWiggle;
}

static void StopMonWiggleAnim(struct PokemonSpecialAnimScene * scene)
{
    scene->monSprite->x2 = 0;
    scene->monSprite->callback = SpriteCallbackDummy;
}

static void SpriteCallback_MonSpriteWiggle(struct Sprite *sprite)
{
    sprite->data[7]++;
    if (sprite->data[7] > sprite->data[0])
    {
        sprite->data[7] = 0;
        sprite->data[6]++;
        if (sprite->data[1] != 0 && sprite->data[6] >= sprite->data[1])
        {
            sprite->x2 = 0;
            sprite->callback = SpriteCallbackDummy;
        }
        else if (sprite->data[6] & 1)
            sprite->x2 = sprite->data[2];
        else
            sprite->x2 = -sprite->data[2];
    }
}

static void LoadMonSpriteGraphics(u16 *tiles, u16 *palette)
{
    struct SpriteSheet spriteSheet;
    struct SpritePalette spritePalette;

    spriteSheet.data = tiles;
    spriteSheet.size = 0x800;
    spriteSheet.tag = 0;
    spritePalette.data = palette;
    spritePalette.tag = 0;
    LoadSpriteSheet(&spriteSheet);
    LoadSpritePalette(&spritePalette);
}

#undef tOff_ItemSprite
#undef tHasItemSprite
#undef tOff_MonSprite
#undef tDelay
#undef tTimer
#undef tDeltaCloseness
#undef tFinalCloseness
#undef tCurrCloseness
#undef tState

#define tState           data[0]
#define tTimer           data[1]
#define tCloseness       data[2]
#define tYpos            data[3]
#define tOff_ItemSprite  4
#define tData6           data[6]
#define tData7           data[7]
#define tActiveSprCt     data[8]
#define tBlendColor      data[9]
#define tTimerReset      data[10]
#define tSuppressDots    data[11]

void PSA_SetUpItemUseOnMonAnim(u16 itemId, u8 closeness, bool32 a2)
{
    struct PokemonSpecialAnimScene * scene = PSA_GetSceneWork();
    u8 taskId;
    scene->itemIconSprite = PSA_CreateItemIconObject(itemId);
    if (scene->itemIconSprite != NULL)
    {
        InitItemIconSpriteState(scene, scene->itemIconSprite, closeness);
        StartSpriteAffineAnim(scene->itemIconSprite, closeness);
        scene->itemIconSprite->invisible = TRUE;
        taskId = CreateTask(Task_ItemUseOnMonAnim, 2);
        SetWordTaskArg(taskId, tOff_ItemSprite, (uintptr_t)scene->itemIconSprite);
        gTasks[taskId].tCloseness = closeness;
        gTasks[taskId].tYpos = GetYPosByScale(sAffineScales[closeness]);
        gTasks[taskId].tData6 = a2;
        gTasks[taskId].tBlendColor = GetBlendColorByItemId(itemId);
    }
}

static u16 GetBlendColorByItemId(u16 itemId)
{
    return RGB_WHITE;
}

void CreateItemIconSpriteAtMaxCloseness(u16 itemId)
{
    struct PokemonSpecialAnimScene * scene = PSA_GetSceneWork();
    scene->itemIconSprite = PSA_CreateItemIconObject(itemId);
    if (scene->itemIconSprite != NULL)
    {
        StartSpriteAffineAnim(scene->itemIconSprite, 3);
        InitItemIconSpriteState(scene, scene->itemIconSprite, 3);
    }
}

static struct Sprite *PSA_CreateItemIconObject(u16 itemId)
{
    u8 spriteId;
    struct Sprite *sprite;
    spriteId = AddItemIconObject(1, 1, itemId);
    if (spriteId == MAX_SPRITES)
        return NULL;
    gSprites[spriteId].oam.affineMode = ST_OAM_AFFINE_DOUBLE;
    gSprites[spriteId].oam.priority = 1;
    gSprites[spriteId].subpriority = 1;
    gSprites[spriteId].affineAnims = sAffineAnimTable_Zoom;
    gSprites[spriteId].callback = SpriteCallbackDummy;
    InitSpriteAffineAnim(&gSprites[spriteId]);
    return &gSprites[spriteId];
}

bool8 PSA_IsItemUseOnMonAnimActive(void)
{
    return FuncIsActiveTask(Task_ItemUseOnMonAnim);
}

static void Task_ItemUseOnMonAnim(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    struct Sprite *sprite = (void *)GetWordTaskArg(taskId, tOff_ItemSprite);
    switch (tState)
    {
    case 0:
        tTimer++;
        if (tTimer > 20)
        {
            tTimer = 0;
            PlaySE(SE_M_SWAGGER2);
            sprite->invisible = FALSE;
            if (!tSuppressDots)
                LoadOutwardSpiralDotsGfx();
            tState = 1;
        }
        break;
    case 1:
        tTimer++;
        if (tTimer > 30)
        {
            tTimer = 0;
            sprite->affineAnims = sAffineAnimTable_ItemZoom;
            StartSpriteAffineAnim(sprite, tCloseness);
            BeginNormalPaletteFade(0x10000 << IndexOfSpritePaletteTag(1), -2, 0, 12, tBlendColor);
            tState = 2;
            PlaySE(SE_M_MILK_DRINK);
        }
        break;
    case 2:
        if (sprite->affineAnimEnded)
        {
            sprite->invisible = TRUE;
            tTimerReset = 20;
            tState = 3;
        }
        break;
    case 3:
        tTimer++;
        if (tTimer > tTimerReset)
        {
            tTimer = 0;
            if (!tSuppressDots)
                CreateSprites_UseItem_OutwardSpiralDots(taskId, data, sprite);
            if (tData7 == 0)
                PlaySE(SE_M_REVERSAL);
            tData7++;
            if (tData7 > 2)
                tState = 4;
            else
                tTimerReset = 8;
        }
        break;
    case 4:
        if (tActiveSprCt == 0)
        {
            if (tData6)
                DestroySprite(sprite);
            DestroyTask(taskId);
        }
        break;
    }
}

static void CreateSprites_UseItem_OutwardSpiralDots(u8 taskId, s16 *data, struct Sprite *sprite)
{
    int x = sprite->x + sprite->x2 - 4;
    int y = sprite->y + sprite->y2 - 4;
    u8 spriteId;
    int i;
    BlendPalettes(0x10000 << IndexOfSpritePaletteTag(5), 16, tBlendColor);
    for (i = 0; i < 15; i++)
    {
        spriteId = CreateSprite(&sSpriteTemplate_UseItem_OutwardSpiralDots, x, y, 0);
        if (spriteId != MAX_SPRITES)
        {
            gSprites[spriteId].data[1] = i << 4;
            gSprites[spriteId].data[7] = taskId;
            gSprites[spriteId].callback = SpriteCB_OutwardSpiralDots;
            StartSpriteAnim(&gSprites[spriteId], 1);
            tActiveSprCt++;
        }
    }
}

static void SpriteCB_OutwardSpiralDots(struct Sprite *sprite)
{
    s16 *data = sprite->data;
    if (data[0] < 16)
    {
        data[0]++;
        data[1] += 7;
        data[1] &= 0xFF;
        data[2] += 4;
        sprite->x2 = (data[2] * gSineTable[data[1] + 0x40]) >> 8;
        sprite->y2 = (data[2] * gSineTable[data[1]])        >> 8;
    }
    else
    {
        gTasks[data[7]].tActiveSprCt--;
        DestroySprite(sprite);
    }
}

void PSA_UseItem_CleanUpForCancel(void)
{
    u8 taskId = FindTaskIdByFunc(Task_ItemUseOnMonAnim);
    if (taskId != 0xFF)
    {
        gTasks[taskId].tSuppressDots = TRUE;
    }
}

static void InitItemIconSpriteState(struct PokemonSpecialAnimScene * scene, struct Sprite *sprite, u8 closeness)
{
    u16 species, x, y;
    u32 personality;
    if (closeness == 3)
    {
        sprite->x = 120;
        sprite->y = scene->monSpriteY2;
    }
    else
    {
        sprite->x = 120;
        sprite->y = scene->monSpriteY1;
    }
    sprite->x += 4;
    sprite->y += 4;
    species = PSA_GetMonSpecies();
    personality = PSA_GetMonPersonality();
    switch (PSA_GetAnimType())
    {
        case 4:
        {
            x = Menu2_GetMonSpriteAnchorCoord(species, personality, 0);
            y = Menu2_GetMonSpriteAnchorCoord(species, personality, 1);
            if (x == 0xFF)
                x = 0;
            if (y == 0xFF)
                y = 0;
            sprite->data[6] = x;
            sprite->data[7] = y;
            break;
        }
        default:
        {
            x = Menu2_GetMonSpriteAnchorCoord(species, personality, 3);
            y = Menu2_GetMonSpriteAnchorCoord(species, personality, 4);
            if (x == 0xFF)
                x = 0;
            if (y == 0xFF)
                y = 0;
            sprite->data[6] = x;
            sprite->data[7] = y;
            break;
        }
    }
    ItemSpriteZoom_UpdateYPos(sprite, closeness);
}

#undef tSuppressDots
#undef tTimerReset
#undef tBlendColor
#undef tActiveSprCt
#undef tData7
#undef tData6
#undef tOff_ItemSprite
#undef tYpos
#undef tCloseness
#undef tTimer
#undef tState

static void MachineSetWobbleInit(void)
{
    struct PokemonSpecialAnimScene * scene = PSA_GetSceneWork();
    MachineSetWobble_SetCB(scene->monSprite);
    MachineSetWobble_SetCB(scene->itemIconSprite);
}

static void MachineSetWobble_SetCB(struct Sprite *sprite)
{
    sprite->data[0] = 0;
    sprite->data[1] = 0;
    sprite->callback = SpriteCB_MachineSetWobble;
}

static bool8 MachineSetWobbleCBIsRunning(void)
{
    struct PokemonSpecialAnimScene * scene = PSA_GetSceneWork();
    return scene->monSprite->callback != SpriteCallbackDummy;
}

static void SpriteCB_MachineSetWobble(struct Sprite *sprite)
{
    switch (sprite->data[0])
    {
    case 0:
        sprite->x += 3;
        sprite->data[0]++;
        break;
    case 1:
        sprite->data[1]++;
        if (sprite->data[1] > 30)
        {
            sprite->x -= 3;
            sprite->callback = SpriteCallbackDummy;
        }
        break;
    }
}

// Redefined from above
#define tState          data[0]
#define tCurrCloseness  data[1]
#define tFinalCloseness data[2]
#define tDeltaCloseness data[3]
#define tTimer          data[4]
#define tDelay          data[5]
#define tOff_MonSprite  6
#define tHasItemSprite  data[8]
#define tOff_ItemSprite 9

static void StartZoomOutAnimForUseTM(u8 closeness)
{
    struct PokemonSpecialAnimScene * scene = PSA_GetSceneWork();
    u8 taskId;
    if (closeness != scene->lastCloseness)
    {
        taskId = CreateTask(Task_ZoomAnim, 1);
        SetWordTaskArg(taskId, tOff_MonSprite, (uintptr_t)scene->monSprite);
        SetWordTaskArg(taskId, tOff_ItemSprite, (uintptr_t)scene->itemIconSprite);
        gTasks[taskId].tCurrCloseness = scene->lastCloseness;
        gTasks[taskId].tFinalCloseness = closeness;
        gTasks[taskId].tHasItemSprite = 1;
        gTasks[taskId].tDelay = 6;
        if (closeness > scene->lastCloseness)
            gTasks[taskId].tDeltaCloseness = 1;
        else
            gTasks[taskId].tDeltaCloseness = -1;
    }
}

#undef tOff_ItemSprite
#undef tHasItemSprite
#undef tOff_MonSprite
#undef tDelay
#undef tTimer
#undef tDeltaCloseness
#undef tFinalCloseness
#undef tCurrCloseness
#undef tState

static void CreateStarSprites(struct PokemonSpecialAnimScene * scene)
{
    int i;
    u8 spriteId;
    u16 species;
    u32 personality;
    LoadCompressedSpriteSheet(&sSpriteSheet_Star);
    LoadSpritePalette(&sSpritePalette_Star);
    scene->field_0002 = 0;
    for (i = 0; i < 3; i++)
    {
        spriteId = CreateSprite(&sSpriteTemplate_Star, 120 + sStarCoordOffsets[i][0],  scene->monSpriteY2 + sStarCoordOffsets[i][1], 2);
        if (spriteId != MAX_SPRITES)
        {
            species = PSA_GetMonSpecies();
            personality = PSA_GetMonPersonality();
            gSprites[spriteId].data[3] = sStarCoordOffsets[i][0] * 8;
            gSprites[spriteId].data[4] = sStarCoordOffsets[i][1] * 8;
            gSprites[spriteId].x += GetSpriteOffsetByScale(Menu2_GetMonSpriteAnchorCoordMinusx20(species, personality, 0), 3);
            gSprites[spriteId].y += GetSpriteOffsetByScale(Menu2_GetMonSpriteAnchorCoordMinusx20(species, personality, 1), 3);
            scene->field_0002++;
        }
    }
}

static u8 AnyStarSpritesActive(void)
{
    return PSA_GetSceneWork()->field_0002;
}

static void SpriteCB_Star(struct Sprite *sprite)
{
    sprite->data[0]++;
    if (sprite->data[0] < 10)
    {
        sprite->data[1] += sprite->data[3];
        sprite->data[2] += sprite->data[4];
        sprite->x2 = sprite->data[1] >> 4;
        sprite->y2 = sprite->data[2] >> 4;
    }
    else
    {
        PSA_GetSceneWork()->field_0002--;
        DestroySprite(sprite);
    }
}

// ========================================================

#define tState        data[0]
#define tTimer        data[1]
#define tActiveSprCt  data[2]
#define tOff_RngState 3
#define tAngle        data[5]
#define tMadeSprCt    data[6]

#define tsRadius   data[0]
#define tsSpeed    data[1]
#define tsXinit    data[2]
#define tsYinit    data[3]
#define tsXorig    data[4]
#define tsYorig    data[5]
#define tsTaskId   data[6]

static void PSAScene_SeedRandomInTask(struct PokemonSpecialAnimScene * scene)
{
    u8 taskId;
    LoadOutwardSpiralDotsGfx();
    taskId = CreateTask(Task_UseItem_OutwardSpiralDots, 1);
    SetWordTaskArg(taskId, tOff_RngState, 2022069025);
    gTasks[taskId].tAngle = 0xE0;
}

static void StopMakingOutwardSpiralDots(void)
{
    u8 taskId = FindTaskIdByFunc(Task_UseItem_OutwardSpiralDots);
    if (taskId != 0xFF)
        gTasks[taskId].tState = 1;
}

static void Task_UseItem_OutwardSpiralDots(u8 taskId)
{
    s16 *data = gTasks[taskId].data;

    switch (tState)
    {
    case 0:
        if (tTimer == 0)
        {
            u32 spriteId, x, y, x2, y2, ampl;
            struct Sprite *sprite = PSA_GetSceneWork()->itemIconSprite;
            x = sprite->x + sprite->x2;
            y = sprite->y + sprite->y2;
            ampl = (PSAScene_RandomFromTask(taskId) % 21) + 70;
            x2 = x + ((u32)(gSineTable[tAngle + 0x40] * ampl) >> 8);
            y2 = y + ((u32)(gSineTable[tAngle       ] * ampl) >> 8);
            tAngle += 0x4C;
            tAngle &= 0xFF;
            spriteId = CreateSprite(&sSpriteTemplate_UseItem_OutwardSpiralDots, x2, y2, 0);
            if (spriteId != MAX_SPRITES)
            {
                gSprites[spriteId].tsRadius = 0;
                gSprites[spriteId].tsSpeed = (PSAScene_RandomFromTask(taskId) & 1) + 6;
                gSprites[spriteId].tsXinit = x2;
                gSprites[spriteId].tsYinit = y2;
                gSprites[spriteId].tsXorig = x;
                gSprites[spriteId].tsYorig = y;
                gSprites[spriteId].tsTaskId = taskId;
                tActiveSprCt++;
            }
            tMadeSprCt++;
            if (tMadeSprCt > 47)
                tState++;
        }
        else
            tTimer--;
        break;
    case 1:
        if (tActiveSprCt == 0)
            DestroyTask(taskId);
        break;
    }
}

static u16 PSAScene_RandomFromTask(u8 taskId)
{
    u32 state = GetWordTaskArg(taskId, tOff_RngState);
    state = ISO_RANDOMIZE1(state);
    SetWordTaskArg(taskId, tOff_RngState, state);
    return state >> 16;
}

static void SpriteCallback_UseItem_OutwardSpiralDots(struct Sprite *sprite)
{
    int x;
    int y;
    sprite->tsRadius += sprite->tsSpeed;
    if (sprite->tsRadius > 255)
    {
        gTasks[sprite->tsTaskId].tActiveSprCt--;
        DestroySprite(sprite);
    }
    else
    {
        x = (sprite->tsXorig - sprite->tsXinit) * sprite->tsRadius;
        y = (sprite->tsYorig - sprite->tsYinit) * sprite->tsRadius;
        sprite->x = (x >> 8) + sprite->tsXinit;
        sprite->y = (y >> 8) + sprite->tsYinit;
    }
}

static void LoadOutwardSpiralDotsGfx(void)
{
    LoadCompressedSpriteSheet(&sSpriteSheet_UseItem_OutwardSpiralDots);
    LoadSpritePalette(&sSpritePalette_UseItem_OutwardSpiralDots);
}

static bool32 IsOutwardSpiralDotsTaskRunning(void)
{
    return FuncIsActiveTask(Task_UseItem_OutwardSpiralDots);
}

#undef tsTaskId
#undef tsYorig
#undef tsXorig
#undef tsYinit
#undef tsXinit
#undef tsSpeed
#undef tsRadius

#undef tMadeSprCt
#undef tAngle
#undef tOff_RngState
#undef tActiveSprCt
#undef tTimer
#undef tState

// ========================================================

#define tState       data[0]
#define tActiveSprCt data[1]
#define tMadeSprCt   data[2]
#define tTimer       data[3]
#define tXpos        data[4]
#define tYpos        data[5]
#define tTileTag     data[6]
#define tPaletteTag  data[7]
#define tPriority    data[8]
#define tSubpriority data[9]

#define tsYsubpixel data[1]
#define tsSpeed     data[2]
#define tsTaskId    data[7]

void CreateLevelUpVerticalSpritesTask(u16 x, u16 y, u16 tileTag, u16 paletteTag, u16 priority, u16 subpriority)
{
    static struct CompressedSpriteSheet spriteSheet;
    static struct SpritePalette spritePalette;
    u8 taskId;
    spriteSheet.tag = tileTag;
    spriteSheet.data = sLevelUp_Gfx;
    spriteSheet.size = sLevelUp_Gfx[0] >> 8;
    spritePalette.data = sLevelUp_Pal;
    spritePalette.tag = paletteTag;
    LoadCompressedSpriteSheet(&spriteSheet);
    LoadSpritePalette(&spritePalette);
    taskId = CreateTask(Task_LevelUpVerticalSprites, 0);
    gTasks[taskId].tXpos = x - 32;
    gTasks[taskId].tYpos = y + 32;
    gTasks[taskId].tTileTag = tileTag;
    gTasks[taskId].tPaletteTag = paletteTag;
    gTasks[taskId].tPriority = priority;
    gTasks[taskId].tSubpriority = subpriority;
    SetGpuReg(REG_OFFSET_BLDCNT, BLDCNT_EFFECT_NONE  | BLDCNT_TGT2_ALL);
    SetGpuReg(REG_OFFSET_BLDALPHA, BLDALPHA_BLEND(12, 6));
}

bool8 LevelUpVerticalSpritesTaskIsRunning(void)
{
    return FuncIsActiveTask(Task_LevelUpVerticalSprites);
}

static void Task_LevelUpVerticalSprites(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    switch (tState)
    {
    case 0:
        if (tTimer == 0)
        {
            tTimer++;
            CreateLevelUpVerticalSprite(taskId, data);
            if (tMadeSprCt > 17)
                tState++;
        }
        else
        {
            tTimer++;
            if (tTimer == 2)
                tTimer = 0;
        }
        break;
    case 1:
        if (tActiveSprCt == 0)
        {
            FreeSpriteTilesByTag(tTileTag);
            FreeSpritePaletteByTag(tPaletteTag);
            DestroyTask(taskId);
        }
        break;
    }
}

static void CreateLevelUpVerticalSprite(u8 taskId, s16 *data)
{
    u8 spriteId;
    struct SpriteTemplate template = sSpriteTemplate_LevelUpVertical;
    template.tileTag = tTileTag;
    template.paletteTag = tPaletteTag;
    tMadeSprCt++;
    spriteId = CreateSprite(&template, ((tMadeSprCt * 219) & 0x3F) + tXpos, tYpos, tSubpriority);
    if (spriteId != MAX_SPRITES)
    {
        gSprites[spriteId].oam.priority = tPriority;
        gSprites[spriteId].tsYsubpixel = 0;
        gSprites[spriteId].tsSpeed = (ISO_RANDOMIZE1(tMadeSprCt) & 0x3F) + 0x20;
        gSprites[spriteId].tsTaskId = taskId;
        tActiveSprCt++;
    }
}

static void SpriteCB_LevelUpVertical(struct Sprite *sprite)
{
    sprite->tsYsubpixel -= sprite->tsSpeed;
    sprite->y2 = sprite->tsYsubpixel >> 4;
    if (sprite->y2 < -0x40)
    {
        gTasks[sprite->tsTaskId].tActiveSprCt--;
        DestroySprite(sprite);
    }
}

#undef tsTaskId
#undef tsSpeed
#undef tsYsubpixel

#undef tSubpriority
#undef tPriority
#undef tPaletteTag
#undef tTileTag
#undef tYpos
#undef tXpos
#undef tTimer
#undef tMadeSprCt
#undef tActiveSprCt
#undef tState

// ========================================================

static const u8 *const sLevelUpWindowStatNames[] = {
    gText_LevelUp_MaxHP,
    gText_LevelUp_Attack,
    gText_LevelUp_Defense,
    gText_LevelUp_SpAtk,
    gText_LevelUp_SpDef,
    gText_LevelUp_Speed
};

void DrawLevelUpWindowPg1(u16 windowId, u16 *beforeStats, u16 *afterStats, u8 bgColor, u8 fgColor, u8 shadowColor)
{
    s16 diffStats[6];
    u8 textbuf[12];
    u8 textColor[3];
    u16 i;
    u8 x;

    FillWindowPixelBuffer(windowId, PIXEL_FILL(bgColor));

    diffStats[0] = afterStats[0] - beforeStats[0];
    diffStats[1] = afterStats[1] - beforeStats[1];
    diffStats[2] = afterStats[2] - beforeStats[2];
    diffStats[3] = afterStats[4] - beforeStats[4];
    diffStats[4] = afterStats[5] - beforeStats[5];
    diffStats[5] = afterStats[3] - beforeStats[3];

    textColor[0] = bgColor;
    textColor[1] = fgColor;
    textColor[2] = shadowColor;

    for (i = 0; i < 6; i++)
    {
        AddTextPrinterParameterized3(windowId, FONT_NORMAL, 0, i * 15, textColor, TEXT_SKIP_DRAW, sLevelUpWindowStatNames[i]);
        StringCopy(textbuf, diffStats[i] >= 0 ? gText_LevelUp_Plus : gText_LevelUp_Minus);
        AddTextPrinterParameterized3(windowId, FONT_NORMAL, 56, i * 15, textColor, TEXT_SKIP_DRAW, textbuf);
        textbuf[0] = CHAR_SPACE;
        x = abs(diffStats[i]) < 10 ? 12 : 6;
        ConvertIntToDecimalStringN(textbuf + 1, abs(diffStats[i]), STR_CONV_MODE_LEFT_ALIGN, 2);
        AddTextPrinterParameterized3(windowId, FONT_NORMAL, x + 56, i * 15, textColor, TEXT_SKIP_DRAW, textbuf);
    }
}

void DrawLevelUpWindowPg2(u16 windowId, u16 *currStats, u8 bgColor, u8 fgColor, u8 shadowColor)
{
    s16 statsRearrange[6];
    u8 textbuf[12];
    u8 textColor[3];
    u16 i;
    u8 ndigits;
    u16 x;

    FillWindowPixelBuffer(windowId, PIXEL_FILL(bgColor));

    statsRearrange[0] = currStats[0];
    statsRearrange[1] = currStats[1];
    statsRearrange[2] = currStats[2];
    statsRearrange[3] = currStats[4];
    statsRearrange[4] = currStats[5];
    statsRearrange[5] = currStats[3];

    textColor[0] = bgColor;
    textColor[1] = fgColor;
    textColor[2] = shadowColor;

    for (i = 0; i < 6; i++)
    {
        if (statsRearrange[i] >= 100)
            ndigits = 3;
        else if (statsRearrange[i] >= 10)
            ndigits = 2;
        else
            ndigits = 1;
        ConvertIntToDecimalStringN(textbuf, statsRearrange[i], STR_CONV_MODE_LEFT_ALIGN, ndigits);
        x = 6 * (4 - ndigits);
        AddTextPrinterParameterized3(windowId, FONT_NORMAL, 0, i * 15, textColor, TEXT_SKIP_DRAW, sLevelUpWindowStatNames[i]);
        AddTextPrinterParameterized3(windowId, FONT_NORMAL, 56 + x, i * 15, textColor, TEXT_SKIP_DRAW, textbuf);
    }
}
