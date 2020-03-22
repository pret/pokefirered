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
#include "strings.h"
#include "text_window.h"
#include "trig.h"
#include "constants/songs.h"

static void sub_811D7D4(u16 animType);
static void sub_811D9BC(u8 taskId);
static void sub_811DA9C(struct Sprite * sprite, u8 closeness);
static bool8 sub_811DAAC(struct Sprite * sprite);
static void sub_811DB14(struct Sprite * sprite, u8 closeness);
static void sub_811DB48(struct Sprite * sprite, u8 closeness);
static void StartMonWiggleAnim(struct PokemonSpecialAnimScene * scene, u8 frameLen, u8 niter, u8 amplitude);
static void StopMonWiggleAnim(struct PokemonSpecialAnimScene * scene);
static void SpriteCallback_MonSpriteWiggle(struct Sprite * sprite);
static void LoadMonSpriteGraphics(u16 *tilees, u16 *palette);
struct Sprite * PSA_CreateItemIconObject(u16 itemId);
static u16 GetBlendColorByItemId(u16 itemId);
static void Task_ZoomOutMon(u8 taskId);
static void CreateSprites_UseItem_OutwardSpiralDots(u8 taskId, s16 *data, struct Sprite * sprite);
static void sub_811DFC0(struct Sprite * sprite);
static void sub_811E06C(struct PokemonSpecialAnimScene * scene, struct Sprite * sprite, u8 closeness);
static void sub_811E10C(void);
static void sub_811E128(struct Sprite * sprite);
static bool8 sub_811E138(void);
static void sub_811E154(struct Sprite * sprite);
static void sub_811E194(u8 a0);
static void sub_811E204(struct PokemonSpecialAnimScene * scene);
static bool8 sub_811E2F4(void);
static void sub_811E300(struct Sprite * sprite);
static void sub_811E348(struct PokemonSpecialAnimScene * scene);
static void sub_811E388(void);
static void sub_811E3B4(u8 taskId);
static u16 sub_811E4EC(u8 taskId);
static void SpriteCallback_UseItem_OutwardSpiralDots(struct Sprite * sprite);
static void sub_811E588(void);
static bool32 sub_811E5A4(void);
static void sub_811E694(u8 taskId);
static void sub_811E710(u8 taskId, s16 *data);
static void sub_811E7B4(struct Sprite * sprite);

static const u16 gUnknown_845963C[] = INCBIN_U16("graphics/pokemon_special_anim/unk_845963C.gbapal");
static const u16 gUnknown_845965C[] = INCBIN_U16("graphics/pokemon_special_anim/unk_845965C.gbapal");
static const u32 gUnknown_845967C[] = INCBIN_U32("graphics/pokemon_special_anim/unk_845967C.4bpp.lz");
static const u32 gUnknown_845973C[] = INCBIN_U32("graphics/pokemon_special_anim/unk_845973C.bin.lz");
static const u16 gUnknown_8459868[] = INCBIN_U16("graphics/pokemon_special_anim/unk_8459868.gbapal");
static const u32 gUnknown_8459888[] = INCBIN_U32("graphics/pokemon_special_anim/unk_8459888.4bpp.lz");
static const u16 gUnknown_84598A4[] = INCBIN_U16("graphics/pokemon_special_anim/unk_84598A4.gbapal");
static const u32 gUnknown_84598C4[] = INCBIN_U32("graphics/pokemon_special_anim/unk_84598C4.4bpp.lz");
static const u16 sSpritePals_UseItem_OutwardSpiralDots[] = INCBIN_U16("graphics/pokemon_special_anim/unk_8459940.gbapal");
static const u32 sSpriteTiles_UseItem_OutwardSpiralDots[] = INCBIN_U32("graphics/pokemon_special_anim/unk_8459960.4bpp.lz");

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
    gUnknown_841B2ED, // 1,
    gUnknown_841B2F1, // 2, and ‥ ‥ ‥
    gUnknown_841B2FF, // Poof!
};

static const u16 sUnref_84599A4[] = {
    0, 16, 68
};

static const u16 sAffineScales[] = {
    0x100,
    0x155,
    0x1AA,
    0x200
};

static const s8 gUnknown_84599B2[][2] = {
    {-8,  -8},
    { 6, -13},
    { 8,  -8}
};

static const struct CompressedSpriteSheet gUnknown_84599B8 = {
    gUnknown_84598C4,
    0x80,
    2
};

static const struct SpritePalette gUnknown_84599C0 = {
    gUnknown_84598A4,
    2
};

static const struct CompressedSpriteSheet sSpriteSheet_UseItem_OutwardSpiralDots = {
    sSpriteTiles_UseItem_OutwardSpiralDots,
    0x60,
    5
};

static const struct SpritePalette sSpritePalette_UseItem_OutwardSpiralDots = {
    sSpritePals_UseItem_OutwardSpiralDots,
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


static const union AffineAnimCmd gUnknown_84599E0[] = {
    AFFINEANIMCMD_FRAME(0x100, 0x100, 0, 0),
    AFFINEANIMCMD_END
};

static const union AffineAnimCmd gUnknown_84599F0[] = {
    AFFINEANIMCMD_FRAME(0x155, 0x155, 0, 0),
    AFFINEANIMCMD_END
};

static const union AffineAnimCmd gUnknown_8459A00[] = {
    AFFINEANIMCMD_FRAME(0x1AA, 0x1AA, 0, 0),
    AFFINEANIMCMD_END
};

static const union AffineAnimCmd gUnknown_8459A10[] = {
    AFFINEANIMCMD_FRAME(0x200, 0x200, 0, 0),
    AFFINEANIMCMD_END
};

static const union AffineAnimCmd *const sAffineAnimTable_Zoom[] = {
    gUnknown_84599E0,
    gUnknown_84599F0,
    gUnknown_8459A00,
    gUnknown_8459A10
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

static const union AffineAnimCmd gUnknown_8459A48[] = {
    AFFINEANIMCMD_FRAME(0x100, 0x100, 0, 0),
    AFFINEANIMCMD_FRAME(-28, -28, 0, 8),
    AFFINEANIMCMD_END
};

static const union AffineAnimCmd gUnknown_8459A60[] = {
    AFFINEANIMCMD_FRAME(0x155, 0x155, 0, 0),
    AFFINEANIMCMD_FRAME(-37, -37, 0, 8),
    AFFINEANIMCMD_END
};

static const union AffineAnimCmd gUnknown_8459A78[] = {
    AFFINEANIMCMD_FRAME(0x1AA, 0x1AA, 0, 0),
    AFFINEANIMCMD_FRAME(-47, -47, 0, 8),
    AFFINEANIMCMD_END
};

static const union AffineAnimCmd gUnknown_8459A90[] = {
    AFFINEANIMCMD_FRAME(0x200, 0x200, 0, 0),
    AFFINEANIMCMD_FRAME(-56, -56, 0, 8),
    AFFINEANIMCMD_END
};

static const union AffineAnimCmd *const gUnknown_8459AA8[] = {
    gUnknown_8459A48,
    gUnknown_8459A60,
    gUnknown_8459A78,
    gUnknown_8459A90
};

static const struct OamData gUnknown_8459AB8 = {
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

static const union AnimCmd gUnknown_8459AC0[] = {
    ANIMCMD_FRAME(0, 3),
    ANIMCMD_END
};

static const union AnimCmd *const gUnknown_8459AC8[] = {
    gUnknown_8459AC0
};

static const struct SpriteTemplate gUnknown_8459ACC = {
    .tileTag = 0,
    .paletteTag = 0,
    .oam = &gUnknown_8459AB8,
    .anims = gUnknown_8459AC8,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_811E7B4
};

static const struct OamData gUnknown_8459AE4 = {
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

static const struct SpriteTemplate gUnknown_8459AEC = {
    .tileTag = 2,
    .paletteTag = 2,
    .oam = &gUnknown_8459AE4,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_811E300
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

static const union AnimCmd gUnknown_8459B0C[] = {
    ANIMCMD_FRAME(0, 16),
    ANIMCMD_FRAME(1,  8),
    ANIMCMD_FRAME(2,  4),
    ANIMCMD_END
};

static const union AnimCmd gUnknown_8459B1C[] = {
    ANIMCMD_FRAME(1, 4),
    ANIMCMD_FRAME(0, 4),
    ANIMCMD_END
};

static const union AnimCmd *const sAnimTable_UseItem_OutwardSpiralDots[] = {
    gUnknown_8459B0C,
    gUnknown_8459B1C
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
    RequestDma3Fill(0, (void *)BG_VRAM, 0x20, TRUE);
    FillBgTilemapBufferRect_Palette0(0, 0x000, 0, 0, 32, 32);
    sub_811D7D4(animType);
    FillWindowPixelBuffer(0, PIXEL_FILL(0));
    TextWindow_SetUserSelectedFrame(0, 0x000, 0xe0);
    CopyWindowToVram(0, 3);
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

void sub_811D2A8(void)
{
    PutWindowTilemap(0);
    FillWindowPixelBuffer(0, PIXEL_FILL(1));
    DrawTextBorderOuter(0, 0x001, 0xE);
    CopyWindowToVram(0, 3);
}

void sub_811D2D0(void)
{
    ClearWindowTilemap(0);
    ClearStdWindowAndFrameToTransparent(0, FALSE);
    CopyWindowToVram(0, 1);
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
        str = StringCopy(str, gUnknown_841B285);
        GetMonData(pokemon, MON_DATA_NICKNAME, str);
        StringAppend(scene->textBuf, gUnknown_841B293);
        break;
    case 1: // Mon's level was elevated to level
        level = GetMonData(pokemon, MON_DATA_LEVEL);
        GetMonData(pokemon, MON_DATA_NICKNAME, scene->textBuf);
        str = StringAppend(scene->textBuf, gUnknown_841B295);
        if (level < MAX_LEVEL)
            level++;
        str = ConvertIntToDecimalStringN(str, level, STR_CONV_MODE_LEFT_ALIGN, level < MAX_LEVEL ? 2 : 3);
        StringAppend(str, gUnknown_841B2A7);
        break;
    case 9: // Mon learned move
        DynamicPlaceholderTextUtil_Reset();
        DynamicPlaceholderTextUtil_SetPlaceholderPtr(0, PSA_GetMonNickname());
        DynamicPlaceholderTextUtil_SetPlaceholderPtr(1, PSA_GetNameOfMoveToTeach());
        DynamicPlaceholderTextUtil_ExpandPlaceholders(scene->textBuf, gUnknown_841B32E);
        break;
    case 4: //  poof!
        strWidth += GetStringWidth(2, gUnknown_841B2F1, -1);
        // fallthrough
    case 3: // 2 and...
        strWidth += GetStringWidth(2, gUnknown_841B2ED, -1);
        // fallthrough
    case 2: // 1
        StringCopy(scene->textBuf, s1_2_and_Poof_textPtrs[messageId - 2]);
        textSpeed = 1;
        break;
    case 5: // Mon forgot move
        DynamicPlaceholderTextUtil_Reset();
        DynamicPlaceholderTextUtil_SetPlaceholderPtr(0, PSA_GetMonNickname());
        DynamicPlaceholderTextUtil_SetPlaceholderPtr(1, PSA_GetNameOfMoveForgotten());
        DynamicPlaceholderTextUtil_ExpandPlaceholders(scene->textBuf, gUnknown_841B306);
        break;
    case 6: // And...
        StringCopy(scene->textBuf, gUnknown_841B315);
        break;
    case 7: // Machine set!
        StringCopy(scene->textBuf, gUnknown_841B31B);
        break;
    case 8: // Huh?
        StringCopy(scene->textBuf, gUnknown_841B329);
        break;
    default:
        return;
    }

    AddTextPrinterParameterized5(0, 2, scene->textBuf, strWidth, 0, textSpeed, NULL, 0, 4);
}

void sub_811D4D4(void)
{
    FillWindowPixelBuffer(0, PIXEL_FILL(1));
    CopyWindowToVram(0, 2);
}

bool8 PSA_IsMessagePrintTaskActive(void)
{
    return IsTextPrinterActive(0);
}

void sub_811D4FC(void)
{
    struct PokemonSpecialAnimScene * scene = PSA_GetSceneWork();
    scene->state = 0;
    BlendPalettes((0x10000 << IndexOfSpritePaletteTag(0)) | 4, 16, RGB_BLACK);
    sub_811E204(scene);
}

bool8 sub_811D530(void)
{
    struct PokemonSpecialAnimScene * scene = PSA_GetSceneWork();

    switch (scene->state)
    {
    case 0:
        if (!sub_811E2F4())
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

void sub_811D5A0(void)
{
    struct PokemonSpecialAnimScene * scene = PSA_GetSceneWork();
    scene->state = 0;
}

void sub_811D5B0(void)
{
    sub_811E388();
    ResetPaletteFadeControl();
}

bool8 sub_811D5C0(void)
{
    struct PokemonSpecialAnimScene * scene = PSA_GetSceneWork();
    switch (scene->state)
    {
    case 0:
        sub_811E194(0);
        scene->state++;
        break;
    case 1:
        if (!sub_811D9A8())
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
            PlaySE(SE_W025);
            BeginNormalPaletteFade(0x00000001, 2, 0, 12, RGB(8, 13, 31));
            sub_811E348(scene);
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
        if (!sub_811E5A4() && scene->field_0004 > 40)
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
        PlaySE(SE_EXPMAX);
        DestroySprite(scene->itemIconSprite);
        scene->state++;
        break;
    default:
        return FALSE;
    }
    return TRUE;
}

void sub_811D6EC(void)
{
    struct PokemonSpecialAnimScene * scene = PSA_GetSceneWork();
    scene->state = 0;
}

bool8 sub_811D6FC(void)
{
    struct PokemonSpecialAnimScene * scene = PSA_GetSceneWork();

    switch (scene->state)
    {
    case 0:
        sub_811E10C();
        PlaySE(SE_MU_PACHI);
        scene->state++;
        break;
    case 1:
        return sub_811E138();
    }
    return TRUE;
}

static void sub_811D734(void)
{
    sub_811E5B8(120, 56, 4, 4, 2, 0);
}

bool8 sub_811D754(void)
{
    return sub_811E680();
}

static void sub_811D764(u16 *statsBefore, u16 *statsAfter)
{
    DrawTextBorderOuter(1, 0x001, 0xE);
    DrawLevelUpWindowPg1(1, statsBefore, statsAfter, TEXT_COLOR_WHITE, TEXT_COLOR_DARK_GREY, TEXT_COLOR_LIGHT_GREY);
    PutWindowTilemap(1);
    CopyWindowToVram(1, 3);
}
static void sub_811D7A0(u16 *currStats)
{
    DrawLevelUpWindowPg2(1, currStats, TEXT_COLOR_WHITE, TEXT_COLOR_DARK_GREY, TEXT_COLOR_LIGHT_GREY);
    CopyWindowToVram(1, 2);
}

static bool8 sub_811D7C4(void)
{
    return IsDma3ManagerBusyWithBgCopy();
}

static void sub_811D7D4(u16 animType)
{
    CopyToBgTilemapBuffer(3, gUnknown_845973C, 0, 0x000);
    DecompressAndCopyTileDataToVram(3, gUnknown_845967C, 0, 0x000, 0);
    if (animType != 4)
        LoadPalette(gUnknown_845963C, 0x00, 0x20);
    else
        LoadPalette(gUnknown_845965C, 0x00, 0x20);
}

void sub_811D830(u8 closeness)
{
    struct PokemonSpecialAnimScene * scene = PSA_GetSceneWork();
    struct Pokemon * pokemon = PSA_GetPokemon();
    u16 species = GetMonData(pokemon, MON_DATA_SPECIES);
    u32 personality = GetMonData(pokemon, MON_DATA_PERSONALITY);
    u8 r1 = sub_812EA78(species, personality, 2);
    void * r6;
    void * r9;
    void * r4;
    u8 spriteId;

    if (r1 != 0xFF)
    {
        scene->field_0006 = 0x48;
        scene->field_0008 = r1 + 0x30;
    }
    else
    {
        scene->field_0006 = 0x48;
        scene->field_0008 = 0x60;
    }

    r6 = Alloc(0x2000);
    r9 = Alloc(0x2000);
    r4 = Alloc(0x100);
    if (r6 != NULL && r9 != NULL && r4 != NULL)
    {
        HandleLoadSpecialPokePic(&gMonFrontPicTable[species], r6, species, personality);
        LZ77UnCompWram(GetMonFrontSpritePal(pokemon), r4);
        LoadMonSpriteGraphics(r6, r4);
        spriteId = CreateSprite(&sSpriteTemplate_MonSprite, 120, scene->field_0006, 4);
        if (spriteId != MAX_SPRITES)
        {
            scene->monSprite = &gSprites[spriteId];
            sub_811DB14(scene->monSprite, closeness);
        }
        else
            scene->monSprite = NULL;
        scene->field_000a = closeness;
    }
    if (r6 != NULL) Free(r6);
    if (r9 != NULL) Free(r9);
    if (r4 != NULL) Free(r4);
}

void PSA_SetUpZoomAnim(u8 closeness)
{
    struct PokemonSpecialAnimScene * scene = PSA_GetSceneWork();
    u8 taskId;
    if (closeness != scene->field_000a)
    {
        taskId = CreateTask(sub_811D9BC, 4);
        SetWordTaskArg(taskId, 6, (uintptr_t)scene->monSprite);
        gTasks[taskId].data[1] = scene->field_000a;
        gTasks[taskId].data[2] = closeness;
        gTasks[taskId].data[5] = 6;
        if (closeness > scene->field_000a)
            gTasks[taskId].data[3] = 1;
        else
            gTasks[taskId].data[3] = -1;
    }
}

bool8 sub_811D9A8(void)
{
    return FuncIsActiveTask(sub_811D9BC);
}

static void sub_811D9BC(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    struct Sprite * sprite = (void *)GetWordTaskArg(taskId, 6);
    switch (data[0])
    {
    case 0:
        sub_811DA9C(sprite, data[1]);
        if (data[8])
            sub_811DA9C((void *)GetWordTaskArg(taskId, 9), data[1]);
        data[1] += data[3];
        data[0]++;
        break;
    case 1:
        if (!sub_811DAAC(sprite))
        {
            PlaySE(SE_TB_KARA);
            sub_811DB14(sprite, data[1]);
            if (data[8])
                sub_811DB48((void *)GetWordTaskArg(taskId, 9), data[1]);
            if (data[1] == data[2])
            {
                PSA_GetSceneWork()->field_000a = data[2];
                DestroyTask(taskId);
            }
            else
            {
                data[4] = 0;
                data[0] = 2;
            }
        }
        break;
    case 2:
        data[4]++;
        if (data[4] > data[5])
            data[0] = 0;
        break;
    }
}

static void sub_811DA9C(struct Sprite * sprite, u8 closeness)
{
    sprite->data[0] = 0;
    sprite->data[1] = 0;
    sprite->data[2] = closeness;
}

static bool8 sub_811DAAC(struct Sprite * sprite)
{
    return sprite->callback != SpriteCallbackDummy;
}

static s16 sub_811DAC0(s16 pos, u8 closeness)
{
    return (pos * sAffineScales[closeness]) >> 8;
}

// FIXME: better math
static u16 sub_811DADC(u16 pos)
{
    struct PokemonSpecialAnimScene * scene = PSA_GetSceneWork();
    s32 v = ((((((scene->field_0008 - scene->field_0006) << 16) >> 8) / 256 * (pos - 256)) << 8) >> 16);
    return v += scene->field_0006;
}

static void sub_811DB14(struct Sprite * sprite, u8 closeness)
{
    if (closeness > 3)
        closeness = 3;
    PSA_GetSceneWork(); // return value not used
    StartSpriteAffineAnim(sprite, closeness);
    sprite->pos1.y = sub_811DADC(sAffineScales[closeness]);
}

static void sub_811DB48(struct Sprite * sprite, u8 closeness)
{
    sub_811DB14(sprite, closeness);
    sprite->pos2.x = sub_811DAC0(sprite->data[6] - 32, closeness);
    sprite->pos2.y = sub_811DAC0(sprite->data[7] - 32, closeness);
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
    scene->monSprite->pos2.x = 0;
    scene->monSprite->callback = SpriteCallbackDummy;
}

static void SpriteCallback_MonSpriteWiggle(struct Sprite * sprite)
{
    sprite->data[7]++;
    if (sprite->data[7] > sprite->data[0])
    {
        sprite->data[7] = 0;
        sprite->data[6]++;
        if (sprite->data[1] != 0 && sprite->data[6] >= sprite->data[1])
        {
            sprite->pos2.x = 0;
            sprite->callback = SpriteCallbackDummy;
        }
        else if (sprite->data[6] & 1)
            sprite->pos2.x = sprite->data[2];
        else
            sprite->pos2.x = -sprite->data[2];
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

void PSA_SetUpZoomOutMonTask(u16 itemId, u8 closeness, bool32 a2)
{
    struct PokemonSpecialAnimScene * scene = PSA_GetSceneWork();
    u8 taskId;
    scene->itemIconSprite = PSA_CreateItemIconObject(itemId);
    if (scene->itemIconSprite != NULL)
    {
        sub_811E06C(scene, scene->itemIconSprite, closeness);
        StartSpriteAffineAnim(scene->itemIconSprite, closeness);
        scene->itemIconSprite->invisible = TRUE;
        taskId = CreateTask(Task_ZoomOutMon, 2);
        SetWordTaskArg(taskId, 4, (uintptr_t)scene->itemIconSprite);
        gTasks[taskId].data[2] = closeness;
        gTasks[taskId].data[3] = sub_811DADC(sAffineScales[closeness]);
        gTasks[taskId].data[6] = a2;
        gTasks[taskId].data[9] = GetBlendColorByItemId(itemId);
    }
}

static u16 GetBlendColorByItemId(u16 itemId)
{
    return RGB_WHITE;
}

void sub_811DCF0(u16 itemId)
{
    struct PokemonSpecialAnimScene * scene = PSA_GetSceneWork();
    scene->itemIconSprite = PSA_CreateItemIconObject(itemId);
    if (scene->itemIconSprite != NULL)
    {
        StartSpriteAffineAnim(scene->itemIconSprite, 3);
        sub_811E06C(scene, scene->itemIconSprite, 3);
    }
}

struct Sprite * PSA_CreateItemIconObject(u16 itemId)
{
    u8 spriteId;
    struct Sprite * sprite;
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

bool8 PSA_IsZoomOutMonTaskRunning(void)
{
    return FuncIsActiveTask(Task_ZoomOutMon);
}

static void Task_ZoomOutMon(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    struct Sprite * sprite = (void *)GetWordTaskArg(taskId, 4);
    switch (data[0])
    {
    case 0:
        data[1]++;
        if (data[1] > 20)
        {
            data[1] = 0;
            PlaySE(SE_W207B);
            sprite->invisible = FALSE;
            if (!data[11])
                sub_811E588();
            data[0] = 1;
        }
        break;
    case 1:
        data[1]++;
        if (data[1] > 30)
        {
            data[1] = 0;
            sprite->affineAnims = gUnknown_8459AA8;
            StartSpriteAffineAnim(sprite, data[2]);
            BeginNormalPaletteFade(0x10000 << IndexOfSpritePaletteTag(1), -2, 0, 12, data[9]);
            data[0] = 2;
            PlaySE(SE_W208);
        }
        break;
    case 2:
        if (sprite->affineAnimEnded)
        {
            sprite->invisible = TRUE;
            data[10] = 20;
            data[0] = 3;
        }
        break;
    case 3:
        data[1]++;
        if (data[1] > data[10])
        {
            data[1] = 0;
            if (!data[11])
                CreateSprites_UseItem_OutwardSpiralDots(taskId, data, sprite);
            if (data[7] == 0)
                PlaySE(SE_W179);
            data[7]++;
            if (data[7] > 2)
                data[0] = 4;
            else
                data[10] = 8;
        }
        break;
    case 4:
        if (data[8] == 0)
        {
            if (data[6] != 0)
                DestroySprite(sprite);
            DestroyTask(taskId);
        }
        break;
    }
}

static void CreateSprites_UseItem_OutwardSpiralDots(u8 taskId, s16 *data, struct Sprite * sprite)
{
    int x = sprite->pos1.x + sprite->pos2.x - 4;
    int y = sprite->pos1.y + sprite->pos2.y - 4;
    u8 spriteId;
    int i;
    BlendPalettes(0x10000 << IndexOfSpritePaletteTag(5), 16, data[9]);
    for (i = 0; i < 15; i++)
    {
        spriteId = CreateSprite(&sSpriteTemplate_UseItem_OutwardSpiralDots, x, y, 0);
        if (spriteId != MAX_SPRITES)
        {
            gSprites[spriteId].data[1] = i << 4;
            gSprites[spriteId].data[7] = taskId;
            gSprites[spriteId].callback = sub_811DFC0;
            StartSpriteAnim(&gSprites[spriteId], 1);
            data[8]++;
        }
    }
}

static void sub_811DFC0(struct Sprite * sprite)
{
    s16 *data = sprite->data;
    if (data[0] < 16)
    {
        data[0]++;
        data[1] += 7;
        data[1] &= 0xFF;
        data[2] += 4;
        sprite->pos2.x = (data[2] * gSineTable[data[1] + 0x40]) >> 8;
        sprite->pos2.y = (data[2] * gSineTable[data[1]])        >> 8;
    }
    else
    {
        gTasks[data[7]].data[8]--;
        DestroySprite(sprite);
    }
}

void sub_811E040(void)
{
    u8 taskId = FindTaskIdByFunc(Task_ZoomOutMon);
    if (taskId != 0xFF)
    {
        gTasks[taskId].data[11] = TRUE;
    }
}

static void sub_811E06C(struct PokemonSpecialAnimScene * scene, struct Sprite * sprite, u8 closeness)
{
    u16 species;
    u32 personality;
    register int r4 asm("r4"); // FIXME
    u8 r0;
    if (closeness == 3)
    {
        sprite->pos1.x = 120;
        sprite->pos1.y = scene->field_0008;
    }
    else
    {
        sprite->pos1.x = 120;
        sprite->pos1.y = scene->field_0006;
    }
    sprite->pos1.x += 4;
    sprite->pos1.y += 4;
    species = PSA_GetMonSpecies();
    personality = PSA_GetMonPersonality();
    if (PSA_GetAnimType() == 4)
    {
        r4 = sub_812EA78(species, personality, 0);
        r0 = sub_812EA78(species, personality, 1);
    }
    else
    {
        r4 = sub_812EA78(species, personality, 3);
        r0 = sub_812EA78(species, personality, 4);
    }
    if (r4 == 0xFF)
        r4 = 0;
    if (r0 == 0xFF)
        r0 = 0;
    sprite->data[6] = r4;
    sprite->data[7] = r0;
    sub_811DB48(sprite, closeness);
}

static void sub_811E10C(void)
{
    struct PokemonSpecialAnimScene * scene = PSA_GetSceneWork();
    sub_811E128(scene->monSprite);
    sub_811E128(scene->itemIconSprite);
}

static void sub_811E128(struct Sprite * sprite)
{
    sprite->data[0] = 0;
    sprite->data[1] = 0;
    sprite->callback = sub_811E154;
}

static bool8 sub_811E138(void)
{
    struct PokemonSpecialAnimScene * scene = PSA_GetSceneWork();
    return scene->monSprite->callback != SpriteCallbackDummy;
}

static void sub_811E154(struct Sprite * sprite)
{
    switch (sprite->data[0])
    {
    case 0:
        sprite->pos1.x += 3;
        sprite->data[0]++;
        break;
    case 1:
        sprite->data[1]++;
        if (sprite->data[1] > 30)
        {
            sprite->pos1.x -= 3;
            sprite->callback = SpriteCallbackDummy;
        }
        break;
    }
}

static void sub_811E194(u8 a0)
{
    struct PokemonSpecialAnimScene * scene = PSA_GetSceneWork();
    u8 taskId;
    if (a0 != scene->field_000a)
    {
        taskId = CreateTask(sub_811D9BC, 1);
        SetWordTaskArg(taskId, 6, (uintptr_t)scene->monSprite);
        SetWordTaskArg(taskId, 9, (uintptr_t)scene->itemIconSprite);
        gTasks[taskId].data[1] = scene->field_000a;
        gTasks[taskId].data[2] = a0;
        gTasks[taskId].data[8] = 1;
        gTasks[taskId].data[5] = 6;
        if (a0 > scene->field_000a)
            gTasks[taskId].data[3] = 1;
        else
            gTasks[taskId].data[3] = -1;
    }
}

static void sub_811E204(struct PokemonSpecialAnimScene * scene)
{
    int i;
    u8 spriteId;
    u16 species;
    u32 personality;
    LoadCompressedSpriteSheet(&gUnknown_84599B8);
    LoadSpritePalette(&gUnknown_84599C0);
    scene->field_0002 = 0;
    for (i = 0; i < 3; i++)
    {
        spriteId = CreateSprite(&gUnknown_8459AEC, 120 + gUnknown_84599B2[i][0],  scene->field_0008 + gUnknown_84599B2[i][1], 2);
        if (spriteId != MAX_SPRITES)
        {
            species = PSA_GetMonSpecies();
            personality = PSA_GetMonPersonality();
            gSprites[spriteId].data[3] = gUnknown_84599B2[i][0] * 8;
            gSprites[spriteId].data[4] = gUnknown_84599B2[i][1] * 8;
            gSprites[spriteId].pos1.x += sub_811DAC0(sub_812EAE4(species, personality, 0), 3);
            gSprites[spriteId].pos1.y += sub_811DAC0(sub_812EAE4(species, personality, 1), 3);
            scene->field_0002++;
        }
    }
}

static u8 sub_811E2F4(void)
{
    return PSA_GetSceneWork()->field_0002;
}

static void sub_811E300(struct Sprite * sprite)
{
    sprite->data[0]++;
    if (sprite->data[0] < 10)
    {
        sprite->data[1] += sprite->data[3];
        sprite->data[2] += sprite->data[4];
        sprite->pos2.x = sprite->data[1] >> 4;
        sprite->pos2.y = sprite->data[2] >> 4;
    }
    else
    {
        PSA_GetSceneWork()->field_0002--;
        DestroySprite(sprite);
    }
}

static void sub_811E348(struct PokemonSpecialAnimScene * scene)
{
    u8 taskId;
    sub_811E588();
    taskId = CreateTask(sub_811E3B4, 1);
    SetWordTaskArg(taskId, 3, 2022069025);
    gTasks[taskId].data[5] = 224;
}

static void sub_811E388(void)
{
    u8 taskId = FindTaskIdByFunc(sub_811E3B4);
    if (taskId != 0xFF)
        gTasks[taskId].data[0] = 1;
}

static void sub_811E3B4(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    struct Sprite * sprite;
    int x;
    register int y asm("r10"); // FIXME
    int x2;
    int y2;
    int r0;
    u8 spriteId;
    switch (data[0])
    {
    case 0:
        if (data[1] == 0)
        {
            sprite = PSA_GetSceneWork()->itemIconSprite;
            x = sprite->pos1.x + sprite->pos2.x;
            y = sprite->pos1.y + sprite->pos2.y;
            r0 = (sub_811E4EC(taskId) % 21) + 70;
            x2 = x + ((u32)(gSineTable[data[5] + 0x40] * r0) >> 8);
            y2 = y + ((u32)(gSineTable[data[5]       ] * r0) >> 8);
            data[5] += 76;
            data[5] &= 0xFF;
            spriteId = CreateSprite(&sSpriteTemplate_UseItem_OutwardSpiralDots, x2, y2, 0);
            if (spriteId != MAX_SPRITES)
            {
                gSprites[spriteId].data[0] = 0;
                gSprites[spriteId].data[1] = (sub_811E4EC(taskId) & 1) + 6;
                gSprites[spriteId].data[2] = x2;
                gSprites[spriteId].data[3] = y2;
                gSprites[spriteId].data[4] = x;
                gSprites[spriteId].data[5] = y;
                gSprites[spriteId].data[6] = taskId;
                data[2]++;
            }
            data[6]++;
            if (data[6] > 47)
                data[0]++;
        }
        else
            data[1]--;
        break;
    case 1:
        if (data[2] == 0)
            DestroyTask(taskId);
        break;
    }
}

static u16 sub_811E4EC(u8 taskId)
{
    u32 state = GetWordTaskArg(taskId, 3);
    state = state * 1103515245 + 24691;
    SetWordTaskArg(taskId, 3, state);
    return state >> 16;
}

static void SpriteCallback_UseItem_OutwardSpiralDots(struct Sprite * sprite)
{
    int x;
    int y;
    sprite->data[0] += sprite->data[1];
    if (sprite->data[0] > 255)
    {
        gTasks[sprite->data[6]].data[2]--;
        DestroySprite(sprite);
    }
    else
    {
        x = (sprite->data[4] - sprite->data[2]) * sprite->data[0];
        y = (sprite->data[5] - sprite->data[3]) * sprite->data[0];
        sprite->pos1.x = (x >> 8) + sprite->data[2];
        sprite->pos1.y = (y >> 8) + sprite->data[3];
    }
}

static void sub_811E588(void)
{
    LoadCompressedSpriteSheet(&sSpriteSheet_UseItem_OutwardSpiralDots);
    LoadSpritePalette(&sSpritePalette_UseItem_OutwardSpiralDots);
}

static bool32 sub_811E5A4(void)
{
    return FuncIsActiveTask(sub_811E3B4);
}

void sub_811E5B8(u16 a0, u16 a1, u16 a2, u16 a3, u16 a4, u16 a5)
{
    static struct CompressedSpriteSheet gUnknown_3002030;
    static struct SpritePalette gUnknown_3002038;
    u8 taskId;
    gUnknown_3002030.tag = a2;
    gUnknown_3002030.data = gUnknown_8459888;
    gUnknown_3002030.size = gUnknown_8459888[0] >> 8;
    gUnknown_3002038.data = gUnknown_8459868;
    gUnknown_3002038.tag = a3;
    LoadCompressedSpriteSheet(&gUnknown_3002030);
    LoadSpritePalette(&gUnknown_3002038);
    taskId = CreateTask(sub_811E694, 0);
    gTasks[taskId].data[4] = a0 - 32;
    gTasks[taskId].data[5] = a1 + 32;
    gTasks[taskId].data[6] = a2;
    gTasks[taskId].data[7] = a3;
    gTasks[taskId].data[8] = a4;
    gTasks[taskId].data[9] = a5;
    SetGpuReg(REG_OFFSET_BLDCNT, BLDCNT_EFFECT_NONE  | BLDCNT_TGT2_ALL);
    SetGpuReg(REG_OFFSET_BLDALPHA, BLDALPHA_BLEND(12, 6));
}

bool8 sub_811E680(void)
{
    return FuncIsActiveTask(sub_811E694);
}

static void sub_811E694(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    switch (data[0])
    {
    case 0:
        if (data[3] == 0)
        {
            data[3]++;
            sub_811E710(taskId, data);
            if (data[2] > 17)
                data[0]++;
        }
        else
        {
            data[3]++;
            if (data[3] == 2)
                data[3] = 0;
        }
        break;
    case 1:
        if (data[1] == 0)
        {
            FreeSpriteTilesByTag(data[6]);
            FreeSpritePaletteByTag(data[7]);
            DestroyTask(taskId);
        }
        break;
    }
}

static void sub_811E710(u8 taskId, s16 *data)
{
    u8 spriteId;
    struct SpriteTemplate template = gUnknown_8459ACC;
    template.tileTag = data[6];
    template.paletteTag = data[7];
    data[2]++;
    spriteId = CreateSprite(&template, ((data[2] * 219) & 0x3F) + data[4], data[5], data[9]);
    if (spriteId != MAX_SPRITES)
    {
        gSprites[spriteId].oam.priority = data[8];
        gSprites[spriteId].data[1] = 0;
        gSprites[spriteId].data[2] = ((data[2] * 1103515245 + 24691) & 0x3F) + 0x20;
        gSprites[spriteId].data[7] = taskId;
        data[1]++;
    }
}

static void sub_811E7B4(struct Sprite * sprite)
{
    sprite->data[1] -= sprite->data[2];
    sprite->pos2.y = sprite->data[1] >> 4;
    if (sprite->pos2.y < -0x40)
    {
        gTasks[sprite->data[7]].data[1]--;
        DestroySprite(sprite);
    }
}

static const u8 *const sLevelUpWindowStatNames[] = {
    gUnknown_841B2A9,
    gUnknown_841B2B7,
    gUnknown_841B2BE,
    gUnknown_841B2CC,
    gUnknown_841B2D4,
    gUnknown_841B2C6
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
        AddTextPrinterParameterized3(windowId, 2, 0, i * 15, textColor, TEXT_SPEED_FF, sLevelUpWindowStatNames[i]);
        StringCopy(textbuf, diffStats[i] >= 0 ? gUnknown_841B2DC : gUnknown_841B2E5);
        AddTextPrinterParameterized3(windowId, 2, 56, i * 15, textColor, TEXT_SPEED_FF, textbuf);
        textbuf[0] = CHAR_SPACE;
        x = abs(diffStats[i]) < 10 ? 12 : 6;
        ConvertIntToDecimalStringN(textbuf + 1, abs(diffStats[i]), STR_CONV_MODE_LEFT_ALIGN, 2);
        AddTextPrinterParameterized3(windowId, 2, x + 56, i * 15, textColor, TEXT_SPEED_FF, textbuf);
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
        AddTextPrinterParameterized3(windowId, 2, 0, i * 15, textColor, TEXT_SPEED_FF, sLevelUpWindowStatNames[i]);
        AddTextPrinterParameterized3(windowId, 2, 56 + x, i * 15, textColor, TEXT_SPEED_FF, textbuf);
    }
}
