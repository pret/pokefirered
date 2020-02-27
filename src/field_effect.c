#include "global.h"
#include "gflib.h"
#include "data.h"
#include "decompress.h"
#include "field_effect.h"
#include "field_effect_scripts.h"
#include "field_weather.h"
#include "overworld.h"
#include "quest_log.h"
#include "trainer_pokemon_sprites.h"

#define FIELD_EFFECT_COUNT 32

static u8 sFieldEffectActiveList[FIELD_EFFECT_COUNT];

void FieldEffectActiveListAdd(u8 fldeff);
bool8 FieldEffectCmd_loadtiles(const u8 **script, u32 *result);
bool8 FieldEffectCmd_loadfadedpal(const u8 **script, u32 *result);
bool8 FieldEffectCmd_loadpal(const u8 **script, u32 *result);
bool8 FieldEffectCmd_callnative(const u8 **script, u32 *result);
bool8 FieldEffectCmd_end(const u8 **script, u32 *result);
bool8 FieldEffectCmd_loadgfx_callnative(const u8 **script, u32 *result);
bool8 FieldEffectCmd_loadtiles_callnative(const u8 **script, u32 *result);
bool8 FieldEffectCmd_loadfadedpal_callnative(const u8 **script, u32 *result);
void FieldEffectScript_LoadTiles(const u8 **script);
void FieldEffectScript_LoadFadedPal(const u8 **script);
void FieldEffectScript_LoadPal(const u8 **script);
void FieldEffectScript_CallNative(const u8 **script, u32 *result);
void FieldEffectFreeTilesIfUnused(u16 tilesTag);
void FieldEffectFreePaletteIfUnused(u8 paletteNum);

const u16 sNewGameOakObjectSpriteTiles[] = INCBIN_U16("graphics/field_effects/unk_83CA770.4bpp");
const u16 sNewGameOakObjectPals[] = INCBIN_U16("graphics/field_effects/unk_83CAF70.gbapal");
const u16 gUnknown_83CAF90[] = INCBIN_U16("graphics/field_effects/unk_83CAF90.4bpp");
const u16 gUnknown_83CAFB0[] = INCBIN_U16("graphics/field_effects/unk_83CAFB0.gbapal");
const u16 gUnknown_83CAFD0[] = INCBIN_U16("graphics/field_effects/unk_83CAFD0.4bpp");
const u16 gUnknown_83CB3D0[] = INCBIN_U16("graphics/field_effects/unk_83CB3D0.gbapal");
const u16 gUnknown_83CB3F0[] = INCBIN_U16("graphics/field_effects/unk_83CB3F0.4bpp");
const u16 gUnknown_83CB5F0[] = INCBIN_U16("graphics/field_effects/unk_83CB5F0.4bpp");
const u16 gUnknown_83CB7F0[] = INCBIN_U16("graphics/field_effects/unk_83CB7F0.gbapal");
const u16 gUnknown_83CB810[] = INCBIN_U16("graphics/field_effects/unk_83CB810.bin");
const u16 gUnknown_83CBA90[] = INCBIN_U16("graphics/field_effects/unk_83CBA90.4bpp");
const u16 gUnknown_83CBB10[] = INCBIN_U16("graphics/field_effects/unk_83CBB10.gbapal");
const u16 gUnknown_83CBB30[] = INCBIN_U16("graphics/field_effects/unk_83CBB30.bin");
const u16 gUnknown_83CBDB0[] = INCBIN_U16("graphics/field_effects/unk_83CBDB0.4bpp");

bool8 (*const sFldEffScrcmdTable[])(const u8 **script, u32 *result) = {
    FieldEffectCmd_loadtiles,
    FieldEffectCmd_loadfadedpal,
    FieldEffectCmd_loadpal,
    FieldEffectCmd_callnative,
    FieldEffectCmd_end,
    FieldEffectCmd_loadgfx_callnative,
    FieldEffectCmd_loadtiles_callnative,
    FieldEffectCmd_loadfadedpal_callnative
};

const struct OamData gNewGameOakOamAttributes = {
    .y = 0,
    .affineMode = ST_OAM_AFFINE_OFF,
    .objMode = ST_OAM_OBJ_NORMAL,
    .mosaic = FALSE,
    .bpp = ST_OAM_4BPP,
    .shape = SPRITE_SHAPE(64x64),
    .x = 0,
    .matrixNum = 0,
    .size = SPRITE_SIZE(64x64),
    .tileNum = 0x000,
    .priority = 0,
    .paletteNum = 0x0,
    .affineParam = 0
};

const struct OamData gOamData_83CBE58 = {
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
    .paletteNum = 0x0,
    .affineParam = 0
};

const struct OamData gOamData_83CBE60 = {
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
    .priority = 0,
    .paletteNum = 0x0,
    .affineParam = 0
};

const struct SpriteFrameImage gNewGameOakObjectSpriteFrames[] = {
    {sNewGameOakObjectSpriteTiles, 0x800}
};

const struct SpritePalette gNewGameOakObjectPaletteInfo = {
    sNewGameOakObjectPals, 4102
};

const union AnimCmd gNewGameOakAnim[] = {
    ANIMCMD_FRAME(0, 1),
    ANIMCMD_END
};

const union AnimCmd *const gNewGameOakAnimTable[] = {
    gNewGameOakAnim
};

const struct SpriteTemplate gNewGameOakObjectTemplate = {
    .tileTag = 0xFFFF,
    .paletteTag = 4102,
    .oam = &gNewGameOakOamAttributes,
    .anims = gNewGameOakAnimTable,
    .images = gNewGameOakObjectSpriteFrames,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy
};

u32 FieldEffectStart(u8 fldeff)
{
    const u8 *script;
    u32 result;
    FieldEffectActiveListAdd(fldeff);
    script = gFieldEffectScriptPointers[fldeff];
    while (sFldEffScrcmdTable[*script](&script, &result))
        ;
    return result;
}

bool8 FieldEffectCmd_loadtiles(const u8 **script, u32 *result)
{
    (*script)++;
    FieldEffectScript_LoadTiles(script);
    return TRUE;
}

bool8 FieldEffectCmd_loadfadedpal(const u8 **script, u32 *result)
{
    (*script)++;
    FieldEffectScript_LoadFadedPal(script);
    return TRUE;
}

bool8 FieldEffectCmd_loadpal(const u8 **script, u32 *result)
{
    (*script)++;
    FieldEffectScript_LoadPal(script);
    return TRUE;
}
bool8 FieldEffectCmd_callnative(const u8 **script, u32 *result)
{
    (*script)++;
    FieldEffectScript_CallNative(script, result);
    return TRUE;
}

bool8 FieldEffectCmd_end(const u8 **script, u32 *result)
{
    return FALSE;
}

bool8 FieldEffectCmd_loadgfx_callnative(const u8 **script, u32 *result)
{
    (*script)++;
    FieldEffectScript_LoadTiles(script);
    FieldEffectScript_LoadFadedPal(script);
    FieldEffectScript_CallNative(script, result);
    return TRUE;
}

bool8 FieldEffectCmd_loadtiles_callnative(const u8 **script, u32 *result)
{
    (*script)++;
    FieldEffectScript_LoadTiles(script);
    FieldEffectScript_CallNative(script, result);
    return TRUE;
}

bool8 FieldEffectCmd_loadfadedpal_callnative(const u8 **script, u32 *result)
{
    (*script)++;
    FieldEffectScript_LoadFadedPal(script);
    FieldEffectScript_CallNative(script, result);
    return TRUE;
}

u32 FieldEffectScript_ReadWord(const u8 **script)
{
    return T2_READ_32(*script);
}

void FieldEffectScript_LoadTiles(const u8 **script)
{
    const struct SpriteSheet * spriteSheet = (const struct SpriteSheet *)FieldEffectScript_ReadWord(script);
    if (GetSpriteTileStartByTag(spriteSheet->tag) == 0xFFFF)
        LoadSpriteSheet(spriteSheet);
    *script += sizeof(u32);
}

void sub_8083598(u8 paletteIdx)
{
    switch (gUnknown_2036E28)
    {
    case 0:
        return;
    case 1:
        TintPalette_GrayScale(&gPlttBufferUnfaded[(paletteIdx + 16) * 16], 0x10);
        break;
    case 2:
        TintPalette_SepiaTone(&gPlttBufferUnfaded[(paletteIdx + 16) * 16], 0x10);
        break;
    case 3:
        sub_8111F38((paletteIdx + 16) * 16, 0x10);
        TintPalette_GrayScale(&gPlttBufferUnfaded[(paletteIdx + 16) * 16], 0x10);
        break;
    default:
        return;
    }
    CpuFastCopy(&gPlttBufferUnfaded[(paletteIdx + 16) * 16], &gPlttBufferFaded[(paletteIdx + 16) * 16], 0x20);
}

void FieldEffectScript_LoadFadedPal(const u8 **script)
{
    const struct SpritePalette * spritePalette = (const struct SpritePalette *)FieldEffectScript_ReadWord(script);
    u8 idx = IndexOfSpritePaletteTag(spritePalette->tag);
    LoadSpritePalette(spritePalette);
    if (idx == 0xFF)
        sub_8083598(IndexOfSpritePaletteTag(spritePalette->tag));
    sub_807AA8C(IndexOfSpritePaletteTag(spritePalette->tag));
    *script += sizeof(u32);
}

void FieldEffectScript_LoadPal(const u8 **script)
{
    const struct SpritePalette * spritePalette = (const struct SpritePalette *)FieldEffectScript_ReadWord(script);
    u8 idx = IndexOfSpritePaletteTag(spritePalette->tag);
    LoadSpritePalette(spritePalette);
    if (idx != 0xFF)
        sub_8083598(IndexOfSpritePaletteTag(spritePalette->tag));
    *script += sizeof(u32);
}

void FieldEffectScript_CallNative(const u8 **script, u32 *result)
{
    u32 (*func)(void) = (u32 (*)(void))FieldEffectScript_ReadWord(script);
    *result = func();
    *script += sizeof(u32);
}

void FieldEffectFreeGraphicsResources(struct Sprite * sprite)
{
    u16 tileStart = sprite->sheetTileStart;
    u8 paletteNum = sprite->oam.paletteNum;
    DestroySprite(sprite);
    FieldEffectFreeTilesIfUnused(tileStart);
    FieldEffectFreePaletteIfUnused(paletteNum);
}

void FieldEffectStop(struct Sprite * sprite, u8 fldeff)
{
    FieldEffectFreeGraphicsResources(sprite);
    FieldEffectActiveListRemove(fldeff);
}

void FieldEffectFreeTilesIfUnused(u16 tileStart)
{
    u8 i;
    u16 tileTag = GetSpriteTileTagByTileStart(tileStart);
    if (tileTag == 0xFFFF)
        return;
    for (i = 0; i < MAX_SPRITES; i++)
    {
        if (gSprites[i].inUse && gSprites[i].usingSheet && tileStart == gSprites[i].sheetTileStart)
            return;
    }
    FreeSpriteTilesByTag(tileTag);
}

void FieldEffectFreePaletteIfUnused(u8 paletteNum)
{
    u8 i;
    u16 paletteTag = GetSpritePaletteTagByPaletteNum(paletteNum);
    if (paletteTag == 0xFFFF)
        return;
    for (i = 0; i < MAX_SPRITES; i++)
    {
        if (gSprites[i].inUse && gSprites[i].oam.paletteNum == paletteNum)
            return;
    }
    FreeSpritePaletteByTag(paletteTag);
}

void FieldEffectActiveListClear(void)
{
    u8 i;
    for (i = 0; i < FIELD_EFFECT_COUNT; i++)
    {
        sFieldEffectActiveList[i] = 0xFF;
    }
}

void FieldEffectActiveListAdd(u8 fldeff)
{
    u8 i;
    for (i = 0; i < FIELD_EFFECT_COUNT; i++)
    {
        if (sFieldEffectActiveList[i] == 0xFF)
        {
            sFieldEffectActiveList[i] = fldeff;
            return;
        }
    }
}

void FieldEffectActiveListRemove(u8 fldeff)
{
    u8 i;
    for (i = 0; i < FIELD_EFFECT_COUNT; i++)
    {
        if (sFieldEffectActiveList[i] == fldeff)
        {
            sFieldEffectActiveList[i] = 0xFF;
            return;
        }
    }
}

bool8 FieldEffectActiveListContains(u8 fldeff)
{
    u8 i;
    for (i = 0; i < FIELD_EFFECT_COUNT; i++)
    {
        if (sFieldEffectActiveList[i] == fldeff)
        {
            return TRUE;
        }
    }
    return FALSE;
}

u8 CreateTrainerSprite(u8 trainerSpriteID, s16 x, s16 y, u8 subpriority, u8 *buffer)
{
    struct SpriteTemplate spriteTemplate;
    LoadCompressedSpritePaletteOverrideBuffer(&gTrainerFrontPicPaletteTable[trainerSpriteID], buffer);
    LoadCompressedSpriteSheetOverrideBuffer(&gTrainerFrontPicTable[trainerSpriteID], buffer);
    spriteTemplate.tileTag = gTrainerFrontPicTable[trainerSpriteID].tag;
    spriteTemplate.paletteTag = gTrainerFrontPicPaletteTable[trainerSpriteID].tag;
    spriteTemplate.oam = &gNewGameOakOamAttributes;
    spriteTemplate.anims = gDummySpriteAnimTable;
    spriteTemplate.images = NULL;
    spriteTemplate.affineAnims = gDummySpriteAffineAnimTable;
    spriteTemplate.callback = SpriteCallbackDummy;
    return CreateSprite(&spriteTemplate, x, y, subpriority);
}

void LoadTrainerGfx_TrainerCard(u8 gender, u16 palOffset, u8 *dest)
{
    LZDecompressVram(gTrainerFrontPicTable[gender].data, dest);
    LoadCompressedPalette(gTrainerFrontPicPaletteTable[gender].data, palOffset, 0x20);
}

u8 AddNewGameBirchObject(s16 x, s16 y, u8 subpriority)
{
    LoadSpritePalette(&gNewGameOakObjectPaletteInfo);
    return CreateSprite(&gNewGameOakObjectTemplate, x, y, subpriority);
}

u8 CreateMonSprite_PicBox(u16 species, s16 x, s16 y, u8 subpriority)
{
    u16 spriteId = CreateMonPicSprite_HandleDeoxys(species, 0, 0x8000, TRUE, x, y, 0, gMonPaletteTable[species].tag);
    PreservePaletteInWeather(IndexOfSpritePaletteTag(gMonPaletteTable[species].tag) + 0x10);
    if (spriteId == 0xFFFF)
        return MAX_SPRITES;
    else
        return spriteId;
}

u8 CreateMonSprite_FieldMove(u16 species, u32 d, u32 g, s16 x, s16 y, u8 subpriority)
{
    const struct CompressedSpritePalette *spritePalette = GetMonSpritePalStructFromOtIdPersonality(species, d, g);
    u16 spriteId = CreateMonPicSprite_HandleDeoxys(species, d, g, 1, x, y, 0, spritePalette->tag);
    PreservePaletteInWeather(IndexOfSpritePaletteTag(spritePalette->tag) + 0x10);
    if (spriteId == 0xFFFF)
        return MAX_SPRITES;
    else
        return spriteId;
}

void FreeResourcesAndDestroySprite(struct Sprite *sprite, u8 spriteId)
{
    ResetPreservedPalettesInWeather();
    if (sprite->oam.affineMode != ST_OAM_AFFINE_OFF)
    {
        FreeOamMatrix(sprite->oam.matrixNum);
    }
    FreeAndDestroyMonPicSprite(spriteId);
}

// r, g, b are between 0 and 16
void MultiplyInvertedPaletteRGBComponents(u16 i, u8 r, u8 g, u8 b)
{
    int curRed;
    int curGreen;
    int curBlue;
    u16 outPal;

    outPal = gPlttBufferUnfaded[i];
    curRed = outPal & 0x1f;
    curGreen = (outPal & (0x1f << 5)) >> 5;
    curBlue = (outPal & (0x1f << 10)) >> 10;
    curRed += (((0x1f - curRed) * r) >> 4);
    curGreen += (((0x1f - curGreen) * g) >> 4);
    curBlue += (((0x1f - curBlue) * b) >> 4);
    outPal = curRed;
    outPal |= curGreen << 5;
    outPal |= curBlue << 10;
    gPlttBufferFaded[i] = outPal;
}

// r, g, b are between 0 and 16
void MultiplyPaletteRGBComponents(u16 i, u8 r, u8 g, u8 b)
{
    int curRed;
    int curGreen;
    int curBlue;
    u16 outPal;

    outPal = gPlttBufferUnfaded[i];
    curRed = outPal & 0x1f;
    curGreen = (outPal & (0x1f << 5)) >> 5;
    curBlue = (outPal & (0x1f << 10)) >> 10;
    curRed -= ((curRed * r) >> 4);
    curGreen -= ((curGreen * g) >> 4);
    curBlue -= ((curBlue * b) >> 4);
    outPal = curRed;
    outPal |= curGreen << 5;
    outPal |= curBlue << 10;
    gPlttBufferFaded[i] = outPal;
}
