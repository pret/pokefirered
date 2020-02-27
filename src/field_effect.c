#include "global.h"
#include "gflib.h"
#include "data.h"
#include "decompress.h"
#include "event_object_movement.h"
#include "field_effect.h"
#include "field_effect_scripts.h"
#include "field_fadetransition.h"
#include "field_weather.h"
#include "overworld.h"
#include "party_menu.h"
#include "quest_log.h"
#include "script.h"
#include "task.h"
#include "trainer_pokemon_sprites.h"
#include "constants/songs.h"

#define subsprite_table(ptr) {.subsprites = ptr, .subspriteCount = (sizeof ptr) / (sizeof(struct Subsprite))}
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
void Task_PokecenterHeal(u8 taskId);
void SpriteCB_PokeballGlow(struct Sprite * sprite);
void SpriteCB_PokecenterMonitor(struct Sprite * sprite);
void SpriteCB_HallOfFameMonitor(struct Sprite * sprite);

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

const struct SpritePalette gUnknown_83CBE9C = {
    gUnknown_83CAFB0, 4103
};

const struct SpritePalette gUnknown_83CBEA4 = {
    gUnknown_83CB3D0, 4112
};

const struct OamData gOamData_83CBEAC = {
    .y = 0,
    .affineMode = ST_OAM_AFFINE_OFF,
    .objMode = ST_OAM_OBJ_NORMAL,
    .mosaic = FALSE,
    .bpp = ST_OAM_4BPP,
    .shape = SPRITE_SHAPE(32x16),
    .x = 0,
    .matrixNum = 0,
    .size = SPRITE_SIZE(32x16),
    .tileNum = 0x000,
    .priority = 0,
    .paletteNum = 0x0,
    .affineParam = 0
};

const struct SpriteFrameImage gUnknown_83CBEB4[] = {
    {gUnknown_83CAF90, 0x20}
};

const struct SpriteFrameImage gUnknown_83CBEBC[] = {
    {gUnknown_83CAFD0 + 0x000, 0x100},
    {gUnknown_83CAFD0 + 0x080, 0x100},
    {gUnknown_83CAFD0 + 0x100, 0x100},
    {gUnknown_83CAFD0 + 0x180, 0x100}
};

const struct SpriteFrameImage gUnknown_83CBEDC[] = {
    {gUnknown_83CB3F0 + 0x00, 0x80},
    {gUnknown_83CB3F0 + 0x40, 0x80},
    {gUnknown_83CB3F0 + 0x80, 0x80},
    {gUnknown_83CB3F0 + 0xC0, 0x80}
};

const struct Subsprite gUnknown_83CBEFC[] =
{
    {
        .x = -12,
        .y =  -8,
        .shape = SPRITE_SHAPE(16x8),
        .size = SPRITE_SIZE(16x8),
        .tileOffset = 0,
        .priority = 2
    }, {
        .x =  4,
        .y = -8,
        .shape = SPRITE_SHAPE(8x8),
        .size = SPRITE_SIZE(8x8),
        .tileOffset = 2,
        .priority = 2
    }, {
        .x = -12,
        .y =   0,
        .shape = SPRITE_SHAPE(16x8),
        .size = SPRITE_SIZE(16x8),
        .tileOffset = 3,
        .priority = 2
    }, {
        .x = 4,
        .y = 0,
        .shape = SPRITE_SHAPE(8x8),
        .size = SPRITE_SIZE(8x8),
        .tileOffset = 5,
        .priority = 2
    }
};

const struct SubspriteTable gUnknown_83CBF0C = subsprite_table(gUnknown_83CBEFC);

const struct Subsprite gUnknown_83CBF14[] =
{
    {
        .x = -32,
        .y = -8,
        .shape = SPRITE_SHAPE(32x8),
        .size = SPRITE_SIZE(32x8),
        .tileOffset = 0,
        .priority = 2
    }, {
        .x =  0,
        .y = -8,
        .shape = SPRITE_SHAPE(32x8),
        .size = SPRITE_SIZE(32x8),
        .tileOffset = 4,
        .priority = 2
    }, {
        .x = -32,
        .y =  0,
        .shape = SPRITE_SHAPE(32x8),
        .size = SPRITE_SIZE(32x8),
        .tileOffset = 8,
        .priority = 2
    }, {
        .x =   0,
        .y =  0,
        .shape = SPRITE_SHAPE(32x8),
        .size = SPRITE_SIZE(32x8),
        .tileOffset = 12,
        .priority = 2
    }
};

const struct SubspriteTable gUnknown_83CBF24 = subsprite_table(gUnknown_83CBF14);

const union AnimCmd gUnknown_83CBF2C[] = {
    ANIMCMD_FRAME(0, 1),
    ANIMCMD_JUMP(0)
};

const union AnimCmd gUnknown_83CBF34[] = {
    ANIMCMD_FRAME(1, 5),
    ANIMCMD_FRAME(2, 5),
    ANIMCMD_FRAME(3, 7),
    ANIMCMD_FRAME(2, 5),
    ANIMCMD_FRAME(1, 5),
    ANIMCMD_FRAME(0, 5),
    ANIMCMD_LOOP(3),
    ANIMCMD_END
};

const union AnimCmd *const gUnknown_83CBF54[] = {
    gUnknown_83CBF2C,
    gUnknown_83CBF34
};

const union AnimCmd gUnknown_83CBF5C[] = {
    ANIMCMD_FRAME(3, 8),
    ANIMCMD_FRAME(2, 8),
    ANIMCMD_FRAME(1, 8),
    ANIMCMD_FRAME(0, 8),
    ANIMCMD_FRAME(1, 8),
    ANIMCMD_FRAME(2, 8),
    ANIMCMD_LOOP(2),
    ANIMCMD_FRAME(1, 8),
    ANIMCMD_FRAME(0, 8),
    ANIMCMD_END
};

const union AnimCmd *const gUnknown_83CBF84[] = {
    gUnknown_83CBF5C
};

const struct SpriteTemplate gUnknown_83CBF88 = {
    .tileTag = 65535,
    .paletteTag = 4103,
    .oam = &gOamData_83CBE58,
    .anims = gUnknown_83CBF54,
    .images = gUnknown_83CBEB4,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCB_PokeballGlow
};

const struct SpriteTemplate gUnknown_83CBFA0 = {
    .tileTag = 65535,
    .paletteTag = 4103,
    .oam = &gOamData_83CBEAC,
    .anims = gUnknown_83CBF54,
    .images = gUnknown_83CBEBC,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCB_PokecenterMonitor
};

const struct SpriteTemplate gUnknown_83CBFB8 = {
    .tileTag = 65535,
    .paletteTag = 4112,
    .oam = &gOamData_83CBE60,
    .anims = gUnknown_83CBF84,
    .images = gUnknown_83CBEDC,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCB_HallOfFameMonitor
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

void PokecenterHealEffect_0(struct Task * task);
void PokecenterHealEffect_1(struct Task * task);
void PokecenterHealEffect_2(struct Task * task);
void PokecenterHealEffect_3(struct Task * task);
void HallOfFameRecordEffect_0(struct Task * task);
void HallOfFameRecordEffect_1(struct Task * task);
void HallOfFameRecordEffect_2(struct Task * task);
void HallOfFameRecordEffect_3(struct Task * task);
void Task_HallOfFameRecord(u8 taskId);
u8 CreatePokeballGlowSprite(s16 duration, s16 x, s16 y, bool16 fanfare);
void SpriteCB_PokeballGlowEffect(struct Sprite * sprite);
void PokeballGlowEffect_0(struct Sprite * sprite);
void PokeballGlowEffect_1(struct Sprite * sprite);
void PokeballGlowEffect_2(struct Sprite * sprite);
void PokeballGlowEffect_3(struct Sprite * sprite);
void PokeballGlowEffect_4(struct Sprite * sprite);
void PokeballGlowEffect_5(struct Sprite * sprite);
void PokeballGlowEffect_6(struct Sprite * sprite);
void PokeballGlowEffect_7(struct Sprite * sprite);
u8 PokecenterHealEffectHelper(s32 x, s32 y);
void HallOfFameRecordEffectHelper(s32 x, s32 y);

void (*const sPokecenterHealTaskCBTable[])(struct Task *) = {
    PokecenterHealEffect_0,
    PokecenterHealEffect_1,
    PokecenterHealEffect_2,
    PokecenterHealEffect_3
};

void (*const sHallOfFameRecordTaskCBTable[])(struct Task *) = {
    HallOfFameRecordEffect_0,
    HallOfFameRecordEffect_1,
    HallOfFameRecordEffect_2,
    HallOfFameRecordEffect_3
};

void (*const sPokeballGlowSpriteCBTable[])(struct Sprite *) = {
    PokeballGlowEffect_0,
    PokeballGlowEffect_1,
    PokeballGlowEffect_2,
    PokeballGlowEffect_3,
    PokeballGlowEffect_4,
    PokeballGlowEffect_5,
    PokeballGlowEffect_6,
    PokeballGlowEffect_7
};

bool8 FldEff_PokecenterHeal(void)
{
    u8 nPokemon;
    struct Task *task;

    nPokemon = CalculatePlayerPartyCount();
    task = &gTasks[CreateTask(Task_PokecenterHeal, 0xff)];
    task->data[1] = nPokemon;
    task->data[2] = 0x5d;
    task->data[3] = 0x24;
    task->data[4] = 0x80;
    task->data[5] = 0x18;
    return FALSE;
}

void Task_PokecenterHeal(u8 taskId)
{
    struct Task * task = &gTasks[taskId];
    sPokecenterHealTaskCBTable[task->data[0]](task);
}

void PokecenterHealEffect_0(struct Task *task)
{
    task->data[0]++;
    task->data[6] = CreatePokeballGlowSprite(task->data[1], task->data[2], task->data[3], TRUE);
    task->data[7] = PokecenterHealEffectHelper(task->data[4], task->data[5]);
}

void PokecenterHealEffect_1(struct Task *task)
{
    if (gSprites[task->data[6]].data[0] > 1)
    {
        gSprites[task->data[7]].data[0]++;
        task->data[0]++;
    }
}

void PokecenterHealEffect_2(struct Task *task)
{
    if (gSprites[task->data[6]].data[0] > 4)
    {
        task->data[0]++;
    }
}

void PokecenterHealEffect_3(struct Task *task)
{
    if (gSprites[task->data[6]].data[0] > 6)
    {
        DestroySprite(&gSprites[task->data[6]]);
        FieldEffectActiveListRemove(FLDEFF_POKECENTER_HEAL);
        DestroyTask(FindTaskIdByFunc(Task_PokecenterHeal));
    }
}


bool8 FldEff_HallOfFameRecord(void)
{
    u8 nPokemon;
    struct Task *task;

    nPokemon = CalculatePlayerPartyCount();
    task = &gTasks[CreateTask(Task_HallOfFameRecord, 0xff)];
    task->data[1] = nPokemon;
    task->data[2] = 0x75;
    task->data[3] = 0x3C;
    return FALSE;
}

void Task_HallOfFameRecord(u8 taskId)
{
    struct Task *task;
    task = &gTasks[taskId];
    sHallOfFameRecordTaskCBTable[task->data[0]](task);
}

void HallOfFameRecordEffect_0(struct Task *task)
{
    u8 taskId;
    task->data[0]++;
    task->data[6] = CreatePokeballGlowSprite(task->data[1], task->data[2], task->data[3], FALSE);
}

void HallOfFameRecordEffect_1(struct Task *task)
{
    if (gSprites[task->data[6]].data[0] > 1)
    {
        HallOfFameRecordEffectHelper(0x78, 0x19);
        task->data[15]++; // was this ever initialized? is this ever used?
        task->data[0]++;
    }
}

void HallOfFameRecordEffect_2(struct Task *task)
{
    if (gSprites[task->data[6]].data[0] > 4)
    {
        task->data[0]++;
    }
}

void HallOfFameRecordEffect_3(struct Task *task)
{
    if (gSprites[task->data[6]].data[0] > 6)
    {
        DestroySprite(&gSprites[task->data[6]]);
        FieldEffectActiveListRemove(FLDEFF_HALL_OF_FAME_RECORD);
        DestroyTask(FindTaskIdByFunc(Task_HallOfFameRecord));
    }
}

u8 CreatePokeballGlowSprite(s16 duration, s16 x, s16 y, bool16 fanfare)
{
    u8 spriteId;
    struct Sprite *sprite;
    spriteId = CreateInvisibleSprite(SpriteCB_PokeballGlowEffect);
    sprite = &gSprites[spriteId];
    sprite->pos2.x = x;
    sprite->pos2.y = y;
    sprite->subpriority = 0xFF;
    sprite->data[5] = fanfare;
    sprite->data[6] = duration;
    sprite->data[7] = spriteId;
    return spriteId;
}

void SpriteCB_PokeballGlowEffect(struct Sprite * sprite)
{
    sPokeballGlowSpriteCBTable[sprite->data[0]](sprite);
}

const struct Coords16 gUnknown_83CC010[] = {
    {0, 0},
    {6, 0},
    {0, 4},
    {6, 4},
    {0, 8},
    {6, 8}
};

const u8 gUnknown_83CC028[] = {16, 12,  8,  0};
const u8 gUnknown_83CC02C[] = {16, 12,  8,  0};
const u8 gUnknown_83CC030[] = { 0,  0,  0,  0};

void PokeballGlowEffect_0(struct Sprite *sprite)
{
    u8 endSpriteId;
    if (sprite->data[1] == 0 || (--sprite->data[1]) == 0)
    {
        sprite->data[1] = 25;
        endSpriteId = CreateSpriteAtEnd(&gUnknown_83CBF88, gUnknown_83CC010[sprite->data[2]].x + sprite->pos2.x, gUnknown_83CC010[sprite->data[2]].y + sprite->pos2.y, 0xFF);
        gSprites[endSpriteId].oam.priority = 2;
        gSprites[endSpriteId].data[0] = sprite->data[7];
        sprite->data[2]++;
        sprite->data[6]--;
        PlaySE(SE_BOWA);
    }
    if (sprite->data[6] == 0)
    {
        sprite->data[1] = 32;
        sprite->data[0]++;
    }
}

void PokeballGlowEffect_1(struct Sprite *sprite)
{
    if ((--sprite->data[1]) == 0)
    {
        sprite->data[0]++;
        sprite->data[1] = 8;
        sprite->data[2] = 0;
        sprite->data[3] = 0;
        if (sprite->data[5])
        {
            PlayFanfare(MUS_ME_ASA);
        }
    }
}

void PokeballGlowEffect_2(struct Sprite *sprite)
{
    u8 phase;
    if ((--sprite->data[1]) == 0)
    {
        sprite->data[1] = 8;
        sprite->data[2]++;
        sprite->data[2] &= 3;
        if (sprite->data[2] == 0)
        {
            sprite->data[3]++;
        }
    }
    phase = (sprite->data[2] + 3) & 3;
    MultiplyInvertedPaletteRGBComponents((IndexOfSpritePaletteTag(0x1007) << 4) + 0x108, gUnknown_83CC028[phase], gUnknown_83CC02C[phase], gUnknown_83CC030[phase]);
    phase = (sprite->data[2] + 2) & 3;
    MultiplyInvertedPaletteRGBComponents((IndexOfSpritePaletteTag(0x1007) << 4) + 0x106, gUnknown_83CC028[phase], gUnknown_83CC02C[phase], gUnknown_83CC030[phase]);
    phase = (sprite->data[2] + 1) & 3;
    MultiplyInvertedPaletteRGBComponents((IndexOfSpritePaletteTag(0x1007) << 4) + 0x102, gUnknown_83CC028[phase], gUnknown_83CC02C[phase], gUnknown_83CC030[phase]);
    phase = sprite->data[2];
    MultiplyInvertedPaletteRGBComponents((IndexOfSpritePaletteTag(0x1007) << 4) + 0x105, gUnknown_83CC028[phase], gUnknown_83CC02C[phase], gUnknown_83CC030[phase]);
    MultiplyInvertedPaletteRGBComponents((IndexOfSpritePaletteTag(0x1007) << 4) + 0x103, gUnknown_83CC028[phase], gUnknown_83CC02C[phase], gUnknown_83CC030[phase]);
    if (sprite->data[3] > 2)
    {
        sprite->data[0]++;
        sprite->data[1] = 8;
        sprite->data[2] = 0;
    }
}

void PokeballGlowEffect_3(struct Sprite *sprite)
{
    u8 phase;
    if ((--sprite->data[1]) == 0)
    {
        sprite->data[1] = 8;
        sprite->data[2]++;
        sprite->data[2] &= 3;
        if (sprite->data[2] == 3)
        {
            sprite->data[0]++;
            sprite->data[1] = 30;
        }
    }
    phase = sprite->data[2];
    MultiplyInvertedPaletteRGBComponents((IndexOfSpritePaletteTag(0x1007) << 4) + 0x108, gUnknown_83CC028[phase], gUnknown_83CC02C[phase], gUnknown_83CC030[phase]);
    MultiplyInvertedPaletteRGBComponents((IndexOfSpritePaletteTag(0x1007) << 4) + 0x106, gUnknown_83CC028[phase], gUnknown_83CC02C[phase], gUnknown_83CC030[phase]);
    MultiplyInvertedPaletteRGBComponents((IndexOfSpritePaletteTag(0x1007) << 4) + 0x102, gUnknown_83CC028[phase], gUnknown_83CC02C[phase], gUnknown_83CC030[phase]);
    MultiplyInvertedPaletteRGBComponents((IndexOfSpritePaletteTag(0x1007) << 4) + 0x105, gUnknown_83CC028[phase], gUnknown_83CC02C[phase], gUnknown_83CC030[phase]);
    MultiplyInvertedPaletteRGBComponents((IndexOfSpritePaletteTag(0x1007) << 4) + 0x103, gUnknown_83CC028[phase], gUnknown_83CC02C[phase], gUnknown_83CC030[phase]);
}

void PokeballGlowEffect_4(struct Sprite *sprite)
{
    if ((--sprite->data[1]) == 0)
    {
        sprite->data[0]++;
    }
}

void PokeballGlowEffect_5(struct Sprite *sprite)
{
    sprite->data[0]++;
}

void PokeballGlowEffect_6(struct Sprite *sprite)
{
    if (sprite->data[5] == 0 || IsFanfareTaskInactive())
    {
        sprite->data[0]++;
    }
}

void PokeballGlowEffect_7(struct Sprite *sprite)
{
}

void SpriteCB_PokeballGlow(struct Sprite * sprite)
{
    if (gSprites[sprite->data[0]].data[0] > 4)
        FieldEffectFreeGraphicsResources(sprite);
}

u8 PokecenterHealEffectHelper(s32 x, s32 y)
{
    u8 spriteId;
    struct Sprite * sprite;
    spriteId = CreateSpriteAtEnd(&gUnknown_83CBFA0, x, y, 0);
    sprite = &gSprites[spriteId];
    sprite->oam.priority = 2;
    sprite->invisible = TRUE;
    return spriteId;
}

void SpriteCB_PokecenterMonitor(struct Sprite * sprite)
{
    if (sprite->data[0] != 0)
    {
        sprite->data[0] = 0;
        sprite->invisible = FALSE;
        StartSpriteAnim(sprite, 1);
    }
    if (sprite->animEnded)
        FieldEffectFreeGraphicsResources(sprite);
}

void HallOfFameRecordEffectHelper(s32 x, s32 y)
{
    CreateSpriteAtEnd(&gUnknown_83CBFB8, x, y, 0);
}

void SpriteCB_HallOfFameMonitor(struct Sprite * sprite)
{
    if (sprite->animEnded)
        FieldEffectFreeGraphicsResources(sprite);
}

void FieldCallback_Fly(void);
void Task_FlyOut(u8 taskId);
void FieldCallback_FlyArrive(void);
void Task_FlyIn(u8 taskId);

void ReturnToFieldFromFlyMapSelect(void)
{
    SetMainCallback2(CB2_ReturnToField);
    gFieldCallback = FieldCallback_Fly;
}

void FieldCallback_Fly(void)
{
    FadeInFromBlack();
    CreateTask(Task_FlyOut, 0);
    ScriptContext2_Enable();
    FreezeObjectEvents();
    gFieldCallback = NULL;
}

void Task_FlyOut(u8 taskId)
{
    struct Task * task;
    task = &gTasks[taskId];
    if (task->data[0] == 0)
    {
        if (!IsWeatherNotFadingIn())
            return;
        gFieldEffectArguments[0] = GetCursorSelectionMonId();
        if ((int)gFieldEffectArguments[0] >= PARTY_SIZE)
            gFieldEffectArguments[0] = 0;
        FieldEffectStart(FLDEFF_USE_FLY);
        task->data[0]++;
    }
    if (!FieldEffectActiveListContains(FLDEFF_USE_FLY))
    {
        Overworld_ResetStateAfterFly();
        WarpIntoMap();
        SetMainCallback2(CB2_LoadMap);
        gFieldCallback = FieldCallback_FlyArrive;
        DestroyTask(taskId);
    }
}

void FieldCallback_FlyArrive(void)
{
    Overworld_PlaySpecialMapMusic();
    FadeInFromBlack();
    CreateTask(Task_FlyIn, 0);
    gObjectEvents[gPlayerAvatar.objectEventId].invisible = TRUE;
    if (gPlayerAvatar.flags & PLAYER_AVATAR_FLAG_SURFING)
    {
        ObjectEventTurn(&gObjectEvents[gPlayerAvatar.objectEventId], DIR_WEST);
    }
    ScriptContext2_Enable();
    FreezeObjectEvents();
    gFieldCallback = NULL;
}

void Task_FlyIn(u8 taskId)
{
    struct Task *task;
    task = &gTasks[taskId];
    if (task->data[0] == 0)
    {
        if (gPaletteFade.active)
        {
            return;
        }
        FieldEffectStart(FLDEFF_FLY_IN);
        task->data[0]++;
    }
    if (!FieldEffectActiveListContains(FLDEFF_FLY_IN))
    {
        ScriptContext2_Disable();
        UnfreezeObjectEvents();
        DestroyTask(taskId);
    }
}
