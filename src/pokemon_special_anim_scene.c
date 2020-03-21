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

void sub_811D7D4(u16 animType);
void sub_811D9BC(u8 taskId);
void sub_811DA9C(struct Sprite * sprite, u8 closeness);
bool8 sub_811DAAC(struct Sprite * sprite);
void sub_811DB14(struct Sprite * sprite, u8 closeness);
void sub_811DB48(struct Sprite * sprite, u8 closeness);
void sub_811DB7C(struct PokemonSpecialAnimScene * scene, u8 a1, u8 a2, u8 a3);
void sub_811DBA8(struct PokemonSpecialAnimScene * scene);
void sub_811DBBC(struct Sprite * sprite);
void sub_811DC14(u16 *tilees, u16 *palette);
struct Sprite * sub_811DD20(u16 itemId);
u16 sub_811DCE8(u16 itemId);
void sub_811DDA4(u8 taskId);
void sub_811DF14(u8 taskId, s16 *data, struct Sprite * sprite);
void sub_811DFC0(struct Sprite * sprite);
void sub_811E06C(struct PokemonSpecialAnimScene * scene, struct Sprite * sprite, u8 closeness);
void sub_811E10C(void);
bool8 sub_811E138(void);
void sub_811E194(u8 a0);
void sub_811E204(struct PokemonSpecialAnimScene * scene);
bool8 sub_811E2F4(void);
void sub_811E300(struct Sprite * sprite);
void sub_811E348(struct PokemonSpecialAnimScene * scene);
void sub_811E388(void);
void sub_811E520(struct Sprite * sprite);
void sub_811E588(void);
bool32 sub_811E5A4(void);
void sub_811E7B4(struct Sprite * sprite);

const u16 gUnknown_845963C[] = INCBIN_U16("graphics/pokemon_special_anim/unk_845963C.gbapal");
const u16 gUnknown_845965C[] = INCBIN_U16("graphics/pokemon_special_anim/unk_845965C.gbapal");
const u32 gUnknown_845967C[] = INCBIN_U32("graphics/pokemon_special_anim/unk_845967C.4bpp.lz");
const u32 gUnknown_845973C[] = INCBIN_U32("graphics/pokemon_special_anim/unk_845973C.bin.lz");
const u16 gUnknown_8459868[] = INCBIN_U16("graphics/pokemon_special_anim/unk_8459868.gbapal");
const u32 gUnknown_8459888[] = INCBIN_U32("graphics/pokemon_special_anim/unk_8459888.4bpp.lz");
const u16 gUnknown_84598A4[] = INCBIN_U16("graphics/pokemon_special_anim/unk_84598A4.gbapal");
const u32 gUnknown_84598C4[] = INCBIN_U32("graphics/pokemon_special_anim/unk_84598C4.4bpp.lz");
const u16 gUnknown_8459940[] = INCBIN_U16("graphics/pokemon_special_anim/unk_8459940.gbapal");
const u32 gUnknown_8459960[] = INCBIN_U32("graphics/pokemon_special_anim/unk_8459960.4bpp.lz");

const struct BgTemplate gUnknown_8459980[] = {
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

const struct WindowTemplate gUnknown_8459988[] = {
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

const u8 *const gUnknown_8459998[] = {
    gUnknown_841B2ED, // 1,
    gUnknown_841B2F1, // 2, and ‥ ‥ ‥
    gUnknown_841B2FF, // Poof!
};

const u16 sUnref_84599A4[] = {
    0, 16, 68
};

const u16 gUnknown_84599AA[] = {
    0x100,
    0x155,
    0x1AA,
    0x200
};

const s8 gUnknown_84599B2[] = {
    -8, -8, 6, -13, 8, -8
};

const struct CompressedSpriteSheet gUnknown_84599B8 = {
    gUnknown_84598C4,
    0x80,
    2
};

const struct SpritePalette gUnknown_84599C0 = {
    gUnknown_84598A4,
    2
};

const struct CompressedSpriteSheet gUnknown_84599C8 = {
    gUnknown_8459960,
    0x60,
    5
};

const struct SpritePalette gUnknown_84599D0 = {
    gUnknown_8459940,
    5
};

const struct OamData gUnknown_84599D8 = {
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


const union AffineAnimCmd gUnknown_84599E0[] = {
    AFFINEANIMCMD_FRAME(0x100, 0x100, 0, 0),
    AFFINEANIMCMD_END
};

const union AffineAnimCmd gUnknown_84599F0[] = {
    AFFINEANIMCMD_FRAME(0x155, 0x155, 0, 0),
    AFFINEANIMCMD_END
};

const union AffineAnimCmd gUnknown_8459A00[] = {
    AFFINEANIMCMD_FRAME(0x1AA, 0x1AA, 0, 0),
    AFFINEANIMCMD_END
};

const union AffineAnimCmd gUnknown_8459A10[] = {
    AFFINEANIMCMD_FRAME(0x200, 0x200, 0, 0),
    AFFINEANIMCMD_END
};

const union AffineAnimCmd *const gUnknown_8459A20[] = {
    gUnknown_84599E0,
    gUnknown_84599F0,
    gUnknown_8459A00,
    gUnknown_8459A10
};

const struct SpriteTemplate gUnknown_8459A30 = {
    .tileTag = 0,
    .paletteTag = 0,
    .oam = &gUnknown_84599D8,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gUnknown_8459A20,
    .callback = SpriteCallbackDummy
};

const union AffineAnimCmd gUnknown_8459A48[] = {
    AFFINEANIMCMD_FRAME(0x100, 0x100, 0, 0),
    AFFINEANIMCMD_FRAME(-28, -28, 0, 8),
    AFFINEANIMCMD_END
};

const union AffineAnimCmd gUnknown_8459A60[] = {
    AFFINEANIMCMD_FRAME(0x155, 0x155, 0, 0),
    AFFINEANIMCMD_FRAME(-37, -37, 0, 8),
    AFFINEANIMCMD_END
};

const union AffineAnimCmd gUnknown_8459A78[] = {
    AFFINEANIMCMD_FRAME(0x1AA, 0x1AA, 0, 0),
    AFFINEANIMCMD_FRAME(-47, -47, 0, 8),
    AFFINEANIMCMD_END
};

const union AffineAnimCmd gUnknown_8459A90[] = {
    AFFINEANIMCMD_FRAME(0x200, 0x200, 0, 0),
    AFFINEANIMCMD_FRAME(-56, -56, 0, 8),
    AFFINEANIMCMD_END
};

const union AffineAnimCmd *const gUnknown_8459AA8[] = {
    gUnknown_8459A48,
    gUnknown_8459A60,
    gUnknown_8459A78,
    gUnknown_8459A90
};

const struct OamData gUnknown_8459AB8 = {
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

const union AnimCmd gUnknown_8459AC0[] = {
    ANIMCMD_FRAME(0, 3),
    ANIMCMD_END
};

const union AnimCmd *const gUnknown_8459AC8[] = {
    gUnknown_8459AC0
};

const struct SpriteTemplate gUnknown_8459ACC = {
    .tileTag = 0,
    .paletteTag = 0,
    .oam = &gUnknown_8459AB8,
    .anims = gUnknown_8459AC8,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_811E7B4
};

const struct OamData gUnknown_8459AE4 = {
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

const struct SpriteTemplate gUnknown_8459AEC = {
    .tileTag = 2,
    .paletteTag = 2,
    .oam = &gUnknown_8459AE4,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_811E300
};

const struct OamData gUnknown_8459B04 = {
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

const union AnimCmd gUnknown_8459B0C[] = {
    ANIMCMD_FRAME(0, 16),
    ANIMCMD_FRAME(1,  8),
    ANIMCMD_FRAME(2,  4),
    ANIMCMD_END
};

const union AnimCmd gUnknown_8459B1C[] = {
    ANIMCMD_FRAME(1, 4),
    ANIMCMD_FRAME(0, 4),
    ANIMCMD_END
};

const union AnimCmd *const gUnknown_8459B28[] = {
    gUnknown_8459B0C,
    gUnknown_8459B1C
};

const struct SpriteTemplate gUnknown_8459B30 = {
    .tileTag = 5,
    .paletteTag = 5,
    .oam = &gUnknown_8459B04,
    .anims = gUnknown_8459B28,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_811E520
};

const u8 *const gUnknown_8459B48[] = {
    gUnknown_841B2A9,
    gUnknown_841B2B7,
    gUnknown_841B2BE,
    gUnknown_841B2CC,
    gUnknown_841B2D4,
    gUnknown_841B2C6
};

void sub_811D184(struct PokemonSpecialAnimScene * buffer, u16 animType)
{
    FreeAllWindowBuffers();
    ResetTempTileDataBuffers();
    SetGpuReg(REG_OFFSET_DISPCNT, 0);
    ResetBgsAndClearDma3BusyFlags(FALSE);
    InitBgsFromTemplates(0, gUnknown_8459980, NELEMS(gUnknown_8459980));
    InitWindows(gUnknown_8459988);
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

bool8 sub_811D280(void)
{
    if (!FreeTempTileDataBuffersIfPossible())
        return IsDma3ManagerBusyWithBgCopy();
    else
        return TRUE;
}

void sub_811D29C(void)
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

void sub_811D2EC(u8 messageId)
{
    struct PokemonSpecialAnimScene * scene = sub_811D0A8();
    u16 itemId = sub_811D0B4();
    u16 strWidth = 0;
    u8 textSpeed = GetTextSpeedSetting();
    struct Pokemon * pokemon = sub_811D094();
    u16 level;
    u8 *str;

    switch (messageId)
    {
    case 0: // Item was used on Mon
        str = StringCopy(scene->field_0014, ItemId_GetName(itemId));
        str = StringCopy(str, gUnknown_841B285);
        GetMonData(pokemon, MON_DATA_NICKNAME, str);
        StringAppend(scene->field_0014, gUnknown_841B293);
        break;
    case 1: // Mon's level was elevated to level
        level = GetMonData(pokemon, MON_DATA_LEVEL);
        GetMonData(pokemon, MON_DATA_NICKNAME, scene->field_0014);
        str = StringAppend(scene->field_0014, gUnknown_841B295);
        if (level < MAX_LEVEL)
            level++;
        str = ConvertIntToDecimalStringN(str, level, STR_CONV_MODE_LEFT_ALIGN, level < MAX_LEVEL ? 2 : 3);
        StringAppend(str, gUnknown_841B2A7);
        break;
    case 9: // Mon learned move
        DynamicPlaceholderTextUtil_Reset();
        DynamicPlaceholderTextUtil_SetPlaceholderPtr(0, sub_811D0F4());
        DynamicPlaceholderTextUtil_SetPlaceholderPtr(1, sub_811D0D0());
        DynamicPlaceholderTextUtil_ExpandPlaceholders(scene->field_0014, gUnknown_841B32E);
        break;
    case 4: //  poof!
        strWidth += GetStringWidth(2, gUnknown_841B2F1, -1);
        // fallthrough
    case 3: // 2 and...
        strWidth += GetStringWidth(2, gUnknown_841B2ED, -1);
        // fallthrough
    case 2: // 1
        StringCopy(scene->field_0014, gUnknown_8459998[messageId - 2]);
        textSpeed = 1;
        break;
    case 5: // Mon forgot move
        DynamicPlaceholderTextUtil_Reset();
        DynamicPlaceholderTextUtil_SetPlaceholderPtr(0, sub_811D0F4());
        DynamicPlaceholderTextUtil_SetPlaceholderPtr(1, sub_811D0C4());
        DynamicPlaceholderTextUtil_ExpandPlaceholders(scene->field_0014, gUnknown_841B306);
        break;
    case 6: // And...
        StringCopy(scene->field_0014, gUnknown_841B315);
        break;
    case 7: // Machine set!
        StringCopy(scene->field_0014, gUnknown_841B31B);
        break;
    case 8: // Huh?
        StringCopy(scene->field_0014, gUnknown_841B329);
        break;
    default:
        return;
    }

    AddTextPrinterParameterized5(0, 2, scene->field_0014, strWidth, 0, textSpeed, NULL, 0, 4);
}

void sub_811D4D4(void)
{
    FillWindowPixelBuffer(0, PIXEL_FILL(1));
    CopyWindowToVram(0, 2);
}

bool8 sub_811D4EC(void)
{
    return IsTextPrinterActive(0);
}

void sub_811D4FC(void)
{
    struct PokemonSpecialAnimScene * scene = sub_811D0A8();
    scene->field_0000 = 0;
    BlendPalettes((0x10000 << IndexOfSpritePaletteTag(0)) | 4, 16, RGB_BLACK);
    sub_811E204(scene);
}

bool8 sub_811D530(void)
{
    struct PokemonSpecialAnimScene * scene = sub_811D0A8();

    switch (scene->field_0000)
    {
    case 0:
        if (!sub_811E2F4())
        {
            BeginNormalPaletteFade((0x10000 << IndexOfSpritePaletteTag(0)) | 4, -1, 16, 0, RGB_BLACK);
            scene->field_0000++;
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
    struct PokemonSpecialAnimScene * scene = sub_811D0A8();
    scene->field_0000 = 0;
}

void sub_811D5B0(void)
{
    sub_811E388();
    ResetPaletteFadeControl();
}

bool8 sub_811D5C0(void)
{
    struct PokemonSpecialAnimScene * scene = sub_811D0A8();
    switch (scene->field_0000)
    {
    case 0:
        sub_811E194(0);
        scene->field_0000++;
        break;
    case 1:
        if (!sub_811D9A8())
        {
            scene->field_0004 = 0;
            scene->field_0000++;
        }
        break;
    case 2:
        scene->field_0004++;
        if (scene->field_0004 > 20)
            scene->field_0000++;
        break;
    case 3:
        sub_811DB7C(scene, 1, 0, 1);
        scene->field_0004 = 0;
        scene->field_0000++;
        break;
    case 4:
        scene->field_0004++;
        if (scene->field_0004 > 0)
        {
            scene->field_0004 = 0;
            PlaySE(SE_W025);
            BeginNormalPaletteFade(0x00000001, 2, 0, 12, RGB(8, 13, 31));
            sub_811E348(scene);
            scene->field_0000++;
        }
        break;
    case 5:
        scene->field_0004++;
        if (scene->field_0004 > 70)
        {
            sub_811DBA8(scene);
            BeginNormalPaletteFade(0x00000001, 6, 12, 0, RGB(8, 13, 31));
            scene->field_0004 = 0;
            scene->field_0000++;
        }
        break;
    case 6:
        scene->field_0004++;
        if (!sub_811E5A4() && scene->field_0004 > 40)
        {
            scene->field_0004 = 0;
            scene->field_0000++;
        }
        break;
    case 7:
        scene->field_0004++;
        if (scene->field_0004 > 20)
        {
            scene->field_0000++;
        }
        break;
    case 8:
        PlaySE(SE_EXPMAX);
        DestroySprite(scene->field_0010);
        scene->field_0000++;
        break;
    default:
        return FALSE;
    }
    return TRUE;
}

void sub_811D6EC(void)
{
    struct PokemonSpecialAnimScene * scene = sub_811D0A8();
    scene->field_0000 = 0;
}

bool8 sub_811D6FC(void)
{
    struct PokemonSpecialAnimScene * scene = sub_811D0A8();

    switch (scene->field_0000)
    {
    case 0:
        sub_811E10C();
        PlaySE(SE_MU_PACHI);
        scene->field_0000++;
        break;
    case 1:
        return sub_811E138();
    }
    return TRUE;
}

void sub_811D734(void)
{
    sub_811E5B8(120, 56, 4, 4, 2, 0);
}

bool8 sub_811D754(void)
{
    return sub_811E680();
}

void sub_811D764(u16 *statsBefore, u16 *statsAfter)
{
    DrawTextBorderOuter(1, 0x001, 0xE);
    DrawLevelUpWindowPg1(1, statsBefore, statsAfter, TEXT_COLOR_WHITE, TEXT_COLOR_DARK_GREY, TEXT_COLOR_LIGHT_GREY);
    PutWindowTilemap(1);
    CopyWindowToVram(1, 3);
}
void sub_811D7A0(u16 *currStats)
{
    DrawLevelUpWindowPg2(1, currStats, TEXT_COLOR_WHITE, TEXT_COLOR_DARK_GREY, TEXT_COLOR_LIGHT_GREY);
    CopyWindowToVram(1, 2);
}

bool8 sub_811D7C4(void)
{
    return IsDma3ManagerBusyWithBgCopy();
}

void sub_811D7D4(u16 animType)
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
    struct PokemonSpecialAnimScene * scene = sub_811D0A8();
    struct Pokemon * pokemon = sub_811D094();
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
        sub_811DC14(r6, r4);
        spriteId = CreateSprite(&gUnknown_8459A30, 120, scene->field_0006, 4);
        if (spriteId != MAX_SPRITES)
        {
            scene->field_000c = &gSprites[spriteId];
            sub_811DB14(scene->field_000c, closeness);
        }
        else
            scene->field_000c = NULL;
        scene->field_000a = closeness;
    }
    if (r6 != NULL) Free(r6);
    if (r9 != NULL) Free(r9);
    if (r4 != NULL) Free(r4);
}

void sub_811D948(u8 closeness)
{
    struct PokemonSpecialAnimScene * scene = sub_811D0A8();
    u8 taskId;
    if (closeness != scene->field_000a)
    {
        taskId = CreateTask(sub_811D9BC, 4);
        SetWordTaskArg(taskId, 6, (uintptr_t)scene->field_000c);
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

void sub_811D9BC(u8 taskId)
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
                sub_811D0A8()->field_000a = data[2];
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

void sub_811DA9C(struct Sprite * sprite, u8 closeness)
{
    sprite->data[0] = 0;
    sprite->data[1] = 0;
    sprite->data[2] = closeness;
}

bool8 sub_811DAAC(struct Sprite * sprite)
{
    return sprite->callback != SpriteCallbackDummy;
}

s16 sub_811DAC0(s16 pos, u8 closeness)
{
    return (pos * gUnknown_84599AA[closeness]) >> 8;
}

// FIXME: better math
u16 sub_811DADC(u16 pos)
{
    struct PokemonSpecialAnimScene * scene = sub_811D0A8();
    s32 v = ((((((scene->field_0008 - scene->field_0006) << 16) >> 8) / 256 * (pos - 256)) << 8) >> 16);
    return v += scene->field_0006;
}

void sub_811DB14(struct Sprite * sprite, u8 closeness)
{
    if (closeness > 3)
        closeness = 3;
    sub_811D0A8(); // return value not used
    StartSpriteAffineAnim(sprite, closeness);
    sprite->pos1.y = sub_811DADC(gUnknown_84599AA[closeness]);
}

void sub_811DB48(struct Sprite * sprite, u8 closeness)
{
    sub_811DB14(sprite, closeness);
    sprite->pos2.x = sub_811DAC0(sprite->data[6] - 32, closeness);
    sprite->pos2.y = sub_811DAC0(sprite->data[7] - 32, closeness);
}

void sub_811DB7C(struct PokemonSpecialAnimScene * scene, u8 a1, u8 a2, u8 a3)
{
    scene->field_000c->data[0] = a1;
    scene->field_000c->data[1] = a2;
    scene->field_000c->data[2] = a3;
    scene->field_000c->callback = sub_811DBBC;
}

void sub_811DBA8(struct PokemonSpecialAnimScene * scene)
{
    scene->field_000c->pos2.x = 0;
    scene->field_000c->callback = SpriteCallbackDummy;
}

void sub_811DBBC(struct Sprite * sprite)
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

void sub_811DC14(u16 *tiles, u16 *palette)
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

void sub_811DC54(u16 itemId, u8 closeness, bool32 a2)
{
    struct PokemonSpecialAnimScene * scene = sub_811D0A8();
    u8 taskId;
    scene->field_0010 = sub_811DD20(itemId);
    if (scene->field_0010 != NULL)
    {
        sub_811E06C(scene, scene->field_0010, closeness);
        StartSpriteAffineAnim(scene->field_0010, closeness);
        scene->field_0010->invisible = TRUE;
        taskId = CreateTask(sub_811DDA4, 2);
        SetWordTaskArg(taskId, 4, (uintptr_t)scene->field_0010);
        gTasks[taskId].data[2] = closeness;
        gTasks[taskId].data[3] = sub_811DADC(gUnknown_84599AA[closeness]);
        gTasks[taskId].data[6] = a2;
        gTasks[taskId].data[9] = sub_811DCE8(itemId);
    }
}

u16 sub_811DCE8(u16 itemId)
{
    return RGB_WHITE;
}

void sub_811DCF0(u16 itemId)
{
    struct PokemonSpecialAnimScene * scene = sub_811D0A8();
    scene->field_0010 = sub_811DD20(itemId);
    if (scene->field_0010 != NULL)
    {
        StartSpriteAffineAnim(scene->field_0010, 3);
        sub_811E06C(scene, scene->field_0010, 3);
    }
}

struct Sprite * sub_811DD20(u16 itemId)
{
    u8 spriteId;
    struct Sprite * sprite;
    spriteId = AddItemIconObject(1, 1, itemId);
    if (spriteId == MAX_SPRITES)
        return NULL;
    gSprites[spriteId].oam.affineMode = ST_OAM_AFFINE_DOUBLE;
    gSprites[spriteId].oam.priority = 1;
    gSprites[spriteId].subpriority = 1;
    gSprites[spriteId].affineAnims = gUnknown_8459A20;
    gSprites[spriteId].callback = SpriteCallbackDummy;
    InitSpriteAffineAnim(&gSprites[spriteId]);
    return &gSprites[spriteId];
}

bool8 sub_811DD90(void)
{
    return FuncIsActiveTask(sub_811DDA4);
}

void sub_811DDA4(u8 taskId)
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
                sub_811DF14(taskId, data, sprite);
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

void sub_811DF14(u8 taskId, s16 *data, struct Sprite * sprite)
{
    int x = sprite->pos1.x + sprite->pos2.x - 4;
    int y = sprite->pos1.y + sprite->pos2.y - 4;
    u8 spriteId;
    int i;
    BlendPalettes(0x10000 << IndexOfSpritePaletteTag(5), 16, data[9]);
    for (i = 0; i < 15; i++)
    {
        spriteId = CreateSprite(&gUnknown_8459B30, x, y, 0);
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

void sub_811DFC0(struct Sprite * sprite)
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
    u8 taskId = FindTaskIdByFunc(sub_811DDA4);
    if (taskId != 0xFF)
    {
        gTasks[taskId].data[11] = TRUE;
    }
}
