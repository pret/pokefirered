#include "global.h"
#include "gflib.h"
#include "decompress.h"
#include "event_data.h"
#include "event_object_movement.h"
#include "field_camera.h"
#include "field_control_avatar.h"
#include "field_effect.h"
#include "field_effect_helpers.h"
#include "field_effect_scripts.h"
#include "field_fadetransition.h"
#include "field_player_avatar.h"
#include "field_weather.h"
#include "fieldmap.h"
#include "help_system.h"
#include "metatile_behavior.h"
#include "new_menu_helpers.h"
#include "overworld.h"
#include "party_menu.h"
#include "quest_log.h"
#include "script.h"
#include "special_field_anim.h"
#include "task.h"
#include "trainer_pokemon_sprites.h"
#include "trig.h"
#include "util.h"
#include "constants/event_object_movement.h"
#include "constants/metatile_behaviors.h"
#include "constants/songs.h"
#include "pokemon_storage_system.h"
#include "constants/inserts.h"

extern struct CompressedSpritePalette gMonPaletteTable[]; // Intentionally declared (incorrectly) without const in order to match
extern const struct CompressedSpritePalette gTrainerFrontPicPaletteTable[];
extern const struct CompressedSpriteSheet gTrainerFrontPicTable[];

#define FIELD_EFFECT_COUNT 32

EWRAM_DATA u32 gFieldEffectArguments[8] = {0};

static u8 sFieldEffectActiveList[FIELD_EFFECT_COUNT];

static void FieldEffectActiveListAdd(u8 fldeff);
static bool8 FieldEffectCmd_loadtiles(const u8 **script, u32 *result);
static bool8 FieldEffectCmd_loadfadedpal(const u8 **script, u32 *result);
static bool8 FieldEffectCmd_loadpal(const u8 **script, u32 *result);
static bool8 FieldEffectCmd_callnative(const u8 **script, u32 *result);
static bool8 FieldEffectCmd_end(const u8 **script, u32 *result);
static bool8 FieldEffectCmd_loadgfx_callnative(const u8 **script, u32 *result);
static bool8 FieldEffectCmd_loadtiles_callnative(const u8 **script, u32 *result);
static bool8 FieldEffectCmd_loadfadedpal_callnative(const u8 **script, u32 *result);
static void FieldEffectScript_LoadTiles(const u8 **script);
static void FieldEffectScript_LoadFadedPal(const u8 **script);
static void FieldEffectScript_LoadPal(const u8 **script);
static void FieldEffectScript_CallNative(const u8 **script, u32 *result);
static void FieldEffectFreeTilesIfUnused(u16 tilesTag);
static void FieldEffectFreePaletteIfUnused(u8 paletteNum);
static void Task_PokecenterHeal(u8 taskId);
static void SpriteCB_PokeballGlow(struct Sprite * sprite);
static void SpriteCB_PokecenterMonitor(struct Sprite * sprite);
static void SpriteCB_HallOfFameMonitor(struct Sprite * sprite);

static const u16 sNewGameOakObjectSpriteTiles[] = INCBIN_U16("graphics/field_effects/new_game_oak.4bpp");
static const u16 sNewGameOakObjectPals[] = INCBIN_U16("graphics/field_effects/new_game_oak.gbapal");
static const u16 sPokeballGfx[] = INCBIN_U16("graphics/field_effects/pokeball.4bpp");
static const u16 sPokeballPal[] = INCBIN_U16("graphics/field_effects/pokeball.gbapal");
static const u16 sUnknown_83CAFD0[] = INCBIN_U16("graphics/field_effects/unk_83CAFD0.4bpp");
static const u16 sUnknown_83CB3D0[] = INCBIN_U16("graphics/field_effects/unk_83CB3D0.gbapal");
static const u16 sUnknown_83CB3F0[] = INCBIN_U16("graphics/field_effects/unk_83CB3F0.4bpp");
static const u16 sFieldMoveStreaksTiles[] = INCBIN_U16("graphics/field_effects/unk_83CB5F0.4bpp");
static const u16 sFieldMoveStreaksPalette[] = INCBIN_U16("graphics/field_effects/unk_83CB7F0.gbapal");
static const u16 sFieldMoveStreaksTilemap[] = INCBIN_U16("graphics/field_effects/unk_83CB810.bin");
static const u16 sDarknessFieldMoveStreaksTiles[] = INCBIN_U16("graphics/field_effects/unk_83CBA90.4bpp");
static const u16 sDarknessFieldMoveStreaksPalette[] = INCBIN_U16("graphics/field_effects/unk_83CBB10.gbapal");
static const u16 sDarknessFieldMoveStreaksTilemap[] = INCBIN_U16("graphics/field_effects/unk_83CBB30.bin");
static const u16 sFldEffUnk44_Tiles[] = INCBIN_U16("graphics/field_effects/unk_83CBDB0.4bpp");

static bool8 (*const sFldEffScrcmdTable[])(const u8 **script, u32 *result) = {
    FieldEffectCmd_loadtiles,
    FieldEffectCmd_loadfadedpal,
    FieldEffectCmd_loadpal,
    FieldEffectCmd_callnative,
    FieldEffectCmd_end,
    FieldEffectCmd_loadgfx_callnative,
    FieldEffectCmd_loadtiles_callnative,
    FieldEffectCmd_loadfadedpal_callnative
};

static const struct OamData sNewGameOakOamAttributes = {
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

static const struct OamData sOamData_8x8 = {
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

static const struct OamData sOamData_16x16 = {
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

static const struct SpriteFrameImage sNewGameOakObjectSpriteFrames[] = {
    {sNewGameOakObjectSpriteTiles, 0x800}
};

static const struct SpritePalette sNewGameOakObjectPaletteInfo = {
    sNewGameOakObjectPals, 4102
};

static const union AnimCmd sNewGameOakAnim[] = {
    ANIMCMD_FRAME(0, 1),
    ANIMCMD_END
};

static const union AnimCmd *const sNewGameOakAnimTable[] = {
    sNewGameOakAnim
};

static const struct SpriteTemplate sNewGameOakObjectTemplate = {
    .tileTag = SPRITE_INVALID_TAG,
    .paletteTag = 4102,
    .oam = &sNewGameOakOamAttributes,
    .anims = sNewGameOakAnimTable,
    .images = sNewGameOakObjectSpriteFrames,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy
};

const struct SpritePalette gUnknown_83CBE9C = {
    sPokeballPal, 4103
};

const struct SpritePalette gUnknown_83CBEA4 = {
    sUnknown_83CB3D0, 4112
};

static const struct OamData sOamData_83CBEAC = {
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

static const struct SpriteFrameImage sUnknown_83CBEB4[] = {
    {sPokeballGfx, 0x20}
};

static const struct SpriteFrameImage sUnknown_83CBEBC[] = {
    {sUnknown_83CAFD0 + 0x000, 0x100},
    {sUnknown_83CAFD0 + 0x080, 0x100},
    {sUnknown_83CAFD0 + 0x100, 0x100},
    {sUnknown_83CAFD0 + 0x180, 0x100}
};

static const struct SpriteFrameImage sUnknown_83CBEDC[] = {
    {sUnknown_83CB3F0 + 0x00, 0x80},
    {sUnknown_83CB3F0 + 0x40, 0x80},
    {sUnknown_83CB3F0 + 0x80, 0x80},
    {sUnknown_83CB3F0 + 0xC0, 0x80}
};

static const union AnimCmd sUnknown_83CBF2C[] = {
    ANIMCMD_FRAME(0, 1),
    ANIMCMD_JUMP(0)
};

static const union AnimCmd sUnknown_83CBF34[] = {
    ANIMCMD_FRAME(1, 5),
    ANIMCMD_FRAME(2, 5),
    ANIMCMD_FRAME(3, 7),
    ANIMCMD_FRAME(2, 5),
    ANIMCMD_FRAME(1, 5),
    ANIMCMD_FRAME(0, 5),
    ANIMCMD_LOOP(3),
    ANIMCMD_END
};

static const union AnimCmd *const sUnknown_83CBF54[] = {
    sUnknown_83CBF2C,
    sUnknown_83CBF34
};

static const union AnimCmd sUnknown_83CBF5C[] = {
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

static const union AnimCmd *const sUnknown_83CBF84[] = {
    sUnknown_83CBF5C
};

static const struct SpriteTemplate sUnknown_83CBF88 = {
    .tileTag = SPRITE_INVALID_TAG,
    .paletteTag = 4103,
    .oam = &sOamData_8x8,
    .anims = sUnknown_83CBF54,
    .images = sUnknown_83CBEB4,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCB_PokeballGlow
};

static const struct SpriteTemplate sUnknown_83CBFA0 = {
    .tileTag = SPRITE_INVALID_TAG,
    .paletteTag = 4103,
    .oam = &sOamData_83CBEAC,
    .anims = sUnknown_83CBF54,
    .images = sUnknown_83CBEBC,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCB_PokecenterMonitor
};

static const struct SpriteTemplate sUnknown_83CBFB8 = {
    .tileTag = SPRITE_INVALID_TAG,
    .paletteTag = 4112,
    .oam = &sOamData_16x16,
    .anims = sUnknown_83CBF84,
    .images = sUnknown_83CBEDC,
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

static bool8 FieldEffectCmd_loadtiles(const u8 **script, u32 *result)
{
    (*script)++;
    FieldEffectScript_LoadTiles(script);
    return TRUE;
}

static bool8 FieldEffectCmd_loadfadedpal(const u8 **script, u32 *result)
{
    (*script)++;
    FieldEffectScript_LoadFadedPal(script);
    return TRUE;
}

static bool8 FieldEffectCmd_loadpal(const u8 **script, u32 *result)
{
    (*script)++;
    FieldEffectScript_LoadPal(script);
    return TRUE;
}
static bool8 FieldEffectCmd_callnative(const u8 **script, u32 *result)
{
    (*script)++;
    FieldEffectScript_CallNative(script, result);
    return TRUE;
}

static bool8 FieldEffectCmd_end(const u8 **script, u32 *result)
{
    return FALSE;
}

static bool8 FieldEffectCmd_loadgfx_callnative(const u8 **script, u32 *result)
{
    (*script)++;
    FieldEffectScript_LoadTiles(script);
    FieldEffectScript_LoadFadedPal(script);
    FieldEffectScript_CallNative(script, result);
    return TRUE;
}

static bool8 FieldEffectCmd_loadtiles_callnative(const u8 **script, u32 *result)
{
    (*script)++;
    FieldEffectScript_LoadTiles(script);
    FieldEffectScript_CallNative(script, result);
    return TRUE;
}

static bool8 FieldEffectCmd_loadfadedpal_callnative(const u8 **script, u32 *result)
{
    (*script)++;
    FieldEffectScript_LoadFadedPal(script);
    FieldEffectScript_CallNative(script, result);
    return TRUE;
}

static u32 FieldEffectScript_ReadWord(const u8 **script)
{
    return T2_READ_32(*script);
}

static void FieldEffectScript_LoadTiles(const u8 **script)
{
    const struct SpriteSheet * spriteSheet = (const struct SpriteSheet * )FieldEffectScript_ReadWord(script);
    if (GetSpriteTileStartByTag(spriteSheet->tag) == 0xFFFF)
        LoadSpriteSheet(spriteSheet);
    *script += sizeof(u32);
}

void ApplyGlobalFieldPaletteTint(u8 paletteIdx)
{
    switch (gGlobalFieldTintMode)
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
        QuestLog_BackUpPalette((paletteIdx + 16) * 16, 0x10);
        TintPalette_GrayScale(&gPlttBufferUnfaded[(paletteIdx + 16) * 16], 0x10);
        break;
    default:
        return;
    }
    CpuFastCopy(&gPlttBufferUnfaded[(paletteIdx + 16) * 16], &gPlttBufferFaded[(paletteIdx + 16) * 16], 0x20);
}

static void FieldEffectScript_LoadFadedPal(const u8 **script)
{
    const struct SpritePalette * spritePalette = (const struct SpritePalette * )FieldEffectScript_ReadWord(script);
    u8 idx = IndexOfSpritePaletteTag(spritePalette->tag);
    LoadSpritePalette(spritePalette);
    if (idx == 0xFF)
        ApplyGlobalFieldPaletteTint(IndexOfSpritePaletteTag(spritePalette->tag));
    UpdateSpritePaletteWithWeather(IndexOfSpritePaletteTag(spritePalette->tag));
    *script += sizeof(u32);
}

static void FieldEffectScript_LoadPal(const u8 **script)
{
    const struct SpritePalette * spritePalette = (const struct SpritePalette * )FieldEffectScript_ReadWord(script);
    u8 idx = IndexOfSpritePaletteTag(spritePalette->tag);
    LoadSpritePalette(spritePalette);
    if (idx != 0xFF)
        ApplyGlobalFieldPaletteTint(IndexOfSpritePaletteTag(spritePalette->tag));
    *script += sizeof(u32);
}

static void FieldEffectScript_CallNative(const u8 **script, u32 *result)
{
    u32 (*func)(void) = (u32 (*)(void))FieldEffectScript_ReadWord(script);
    *result = func();
    *script += sizeof(u32);
}

static void FieldEffectFreeGraphicsResources(struct Sprite * sprite)
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

static void FieldEffectFreeTilesIfUnused(u16 tileStart)
{
    u8 i;
    u16 tileTag = GetSpriteTileTagByTileStart(tileStart);
    if (tileTag == SPRITE_INVALID_TAG)
        return;
    for (i = 0; i < MAX_SPRITES; i++)
    {
        if (gSprites[i].inUse && gSprites[i].usingSheet && tileStart == gSprites[i].sheetTileStart)
            return;
    }
    FreeSpriteTilesByTag(tileTag);
}

static void FieldEffectFreePaletteIfUnused(u8 paletteNum)
{
    u8 i;
    u16 paletteTag = GetSpritePaletteTagByPaletteNum(paletteNum);
    if (paletteTag == SPRITE_INVALID_TAG)
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

static void FieldEffectActiveListAdd(u8 fldeff)
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
    spriteTemplate.oam = &sNewGameOakOamAttributes;
    spriteTemplate.anims = gDummySpriteAnimTable;
    spriteTemplate.images = NULL;
    spriteTemplate.affineAnims = gDummySpriteAffineAnimTable;
    spriteTemplate.callback = SpriteCallbackDummy;
    return CreateSprite(&spriteTemplate, x, y, subpriority);
}

static void LoadTrainerGfx_TrainerCard(u8 gender, u16 palOffset, u8 *dest)
{
    LZDecompressVram(gTrainerFrontPicTable[gender].data, dest);
    LoadCompressedPalette(gTrainerFrontPicPaletteTable[gender].data, palOffset, 0x20);
}

static u8 AddNewGameBirchObject(s16 x, s16 y, u8 subpriority)
{
    LoadSpritePalette(&sNewGameOakObjectPaletteInfo);
    return CreateSprite(&sNewGameOakObjectTemplate, x, y, subpriority);
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

static u8 CreateMonSprite_FieldMove(u16 species, u32 otId, u32 personality, s16 x, s16 y, u8 subpriority)
{
    const struct CompressedSpritePalette * spritePalette = GetMonSpritePalStructFromOtIdPersonality(species, otId, personality);
    u16 spriteId = CreateMonPicSprite_HandleDeoxys(species, otId, personality, 1, x, y, 0, spritePalette->tag);
    PreservePaletteInWeather(IndexOfSpritePaletteTag(spritePalette->tag) + 0x10);
    if (spriteId == 0xFFFF)
        return MAX_SPRITES;
    else
        return spriteId;
}

void FreeResourcesAndDestroySprite(struct Sprite * sprite, u8 spriteId)
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
static void MultiplyPaletteRGBComponents(u16 i, u8 r, u8 g, u8 b)
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

static void PokecenterHealEffect_0(struct Task * task);
static void PokecenterHealEffect_1(struct Task * task);
static void PokecenterHealEffect_2(struct Task * task);
static void PokecenterHealEffect_3(struct Task * task);
static void HallOfFameRecordEffect_0(struct Task * task);
static void HallOfFameRecordEffect_1(struct Task * task);
static void HallOfFameRecordEffect_2(struct Task * task);
static void HallOfFameRecordEffect_3(struct Task * task);
static void Task_HallOfFameRecord(u8 taskId);
static u8 CreatePokeballGlowSprite(s16 duration, s16 x, s16 y, bool16 fanfare);
static void SpriteCB_PokeballGlowEffect(struct Sprite * sprite);
static void PokeballGlowEffect_0(struct Sprite * sprite);
static void PokeballGlowEffect_1(struct Sprite * sprite);
static void PokeballGlowEffect_2(struct Sprite * sprite);
static void PokeballGlowEffect_3(struct Sprite * sprite);
static void PokeballGlowEffect_4(struct Sprite * sprite);
static void PokeballGlowEffect_5(struct Sprite * sprite);
static void PokeballGlowEffect_6(struct Sprite * sprite);
static void PokeballGlowEffect_7(struct Sprite * sprite);
static u8 PokecenterHealEffectHelper(s32 x, s32 y);
static void HallOfFameRecordEffectHelper(s32 x, s32 y);

static void (*const sPokecenterHealTaskCBTable[])(struct Task * ) = {
    PokecenterHealEffect_0,
    PokecenterHealEffect_1,
    PokecenterHealEffect_2,
    PokecenterHealEffect_3
};

static void (*const sHallOfFameRecordTaskCBTable[])(struct Task * ) = {
    HallOfFameRecordEffect_0,
    HallOfFameRecordEffect_1,
    HallOfFameRecordEffect_2,
    HallOfFameRecordEffect_3
};

static void (*const sPokeballGlowSpriteCBTable[])(struct Sprite * ) = {
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
    struct Task * task;

#if NO_HEAL_EGGS
    nPokemon = CountPartyNonEggMons();
#else
    nPokemon = CalculatePlayerPartyCount();
#endif
    task = &gTasks[CreateTask(Task_PokecenterHeal, 0xff)];
    task->data[1] = nPokemon;
    task->data[2] = 0x5d;
    task->data[3] = 0x24;
    task->data[4] = 0x80;
    task->data[5] = 0x18;
    return FALSE;
}

static void Task_PokecenterHeal(u8 taskId)
{
    struct Task * task = &gTasks[taskId];
    sPokecenterHealTaskCBTable[task->data[0]](task);
}

static void PokecenterHealEffect_0(struct Task * task)
{
    task->data[0]++;
    task->data[6] = CreatePokeballGlowSprite(task->data[1], task->data[2], task->data[3], TRUE);
    task->data[7] = PokecenterHealEffectHelper(task->data[4], task->data[5]);
}

static void PokecenterHealEffect_1(struct Task * task)
{
    if (gSprites[task->data[6]].data[0] > 1)
    {
        gSprites[task->data[7]].data[0]++;
        task->data[0]++;
    }
}

static void PokecenterHealEffect_2(struct Task * task)
{
    if (gSprites[task->data[6]].data[0] > 4)
    {
        task->data[0]++;
    }
}

static void PokecenterHealEffect_3(struct Task * task)
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
    struct Task * task;

    nPokemon = CalculatePlayerPartyCount();
    task = &gTasks[CreateTask(Task_HallOfFameRecord, 0xff)];
    task->data[1] = nPokemon;
    task->data[2] = 0x75;
    task->data[3] = 0x3C;
    return FALSE;
}

static void Task_HallOfFameRecord(u8 taskId)
{
    struct Task * task;
    task = &gTasks[taskId];
    sHallOfFameRecordTaskCBTable[task->data[0]](task);
}

static void HallOfFameRecordEffect_0(struct Task * task)
{
    u8 taskId;
    task->data[0]++;
    task->data[6] = CreatePokeballGlowSprite(task->data[1], task->data[2], task->data[3], FALSE);
}

static void HallOfFameRecordEffect_1(struct Task * task)
{
    if (gSprites[task->data[6]].data[0] > 1)
    {
        HallOfFameRecordEffectHelper(0x78, 0x19);
        task->data[15]++; // was this ever initialized? is this ever used?
        task->data[0]++;
    }
}

static void HallOfFameRecordEffect_2(struct Task * task)
{
    if (gSprites[task->data[6]].data[0] > 4)
    {
        task->data[0]++;
    }
}

static void HallOfFameRecordEffect_3(struct Task * task)
{
    if (gSprites[task->data[6]].data[0] > 6)
    {
        DestroySprite(&gSprites[task->data[6]]);
        FieldEffectActiveListRemove(FLDEFF_HALL_OF_FAME_RECORD);
        DestroyTask(FindTaskIdByFunc(Task_HallOfFameRecord));
    }
}

static u8 CreatePokeballGlowSprite(s16 duration, s16 x, s16 y, bool16 fanfare)
{
    u8 spriteId;
    struct Sprite * sprite;
    spriteId = CreateInvisibleSprite(SpriteCB_PokeballGlowEffect);
    sprite = &gSprites[spriteId];
    sprite->x2 = x;
    sprite->y2 = y;
    sprite->subpriority = 0xFF;
    sprite->data[5] = fanfare;
    sprite->data[6] = duration;
    sprite->data[7] = spriteId;
    return spriteId;
}

static void SpriteCB_PokeballGlowEffect(struct Sprite * sprite)
{
    sPokeballGlowSpriteCBTable[sprite->data[0]](sprite);
}

static const struct Coords16 sUnknown_83CC010[] = {
    {0, 0},
    {6, 0},
    {0, 4},
    {6, 4},
    {0, 8},
    {6, 8}
};

static const u8 sUnknown_83CC028[] = {16, 12,  8,  0};
static const u8 sUnknown_83CC02C[] = {16, 12,  8,  0};
static const u8 sUnknown_83CC030[] = { 0,  0,  0,  0};

static void PokeballGlowEffect_0(struct Sprite * sprite)
{
    u8 endSpriteId;
    if (sprite->data[1] == 0 || (--sprite->data[1]) == 0)
    {
        sprite->data[1] = 25;
        endSpriteId = CreateSpriteAtEnd(&sUnknown_83CBF88, sUnknown_83CC010[sprite->data[2]].x + sprite->x2, sUnknown_83CC010[sprite->data[2]].y + sprite->y2, 0xFF);
        gSprites[endSpriteId].oam.priority = 2;
        gSprites[endSpriteId].data[0] = sprite->data[7];
        sprite->data[2]++;
        sprite->data[6]--;
        PlaySE(SE_BALL);
    }
    if (sprite->data[6] == 0)
    {
        sprite->data[1] = 32;
        sprite->data[0]++;
    }
}

static void PokeballGlowEffect_1(struct Sprite * sprite)
{
    if ((--sprite->data[1]) == 0)
    {
        sprite->data[0]++;
        sprite->data[1] = 8;
        sprite->data[2] = 0;
        sprite->data[3] = 0;
        if (sprite->data[5])
        {
            PlayFanfare(MUS_HEAL);
        }
    }
}

static void PokeballGlowEffect_2(struct Sprite * sprite)
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
    MultiplyInvertedPaletteRGBComponents((IndexOfSpritePaletteTag(0x1007) << 4) + 0x108, sUnknown_83CC028[phase], sUnknown_83CC02C[phase], sUnknown_83CC030[phase]);
    phase = (sprite->data[2] + 2) & 3;
    MultiplyInvertedPaletteRGBComponents((IndexOfSpritePaletteTag(0x1007) << 4) + 0x106, sUnknown_83CC028[phase], sUnknown_83CC02C[phase], sUnknown_83CC030[phase]);
    phase = (sprite->data[2] + 1) & 3;
    MultiplyInvertedPaletteRGBComponents((IndexOfSpritePaletteTag(0x1007) << 4) + 0x102, sUnknown_83CC028[phase], sUnknown_83CC02C[phase], sUnknown_83CC030[phase]);
    phase = sprite->data[2];
    MultiplyInvertedPaletteRGBComponents((IndexOfSpritePaletteTag(0x1007) << 4) + 0x105, sUnknown_83CC028[phase], sUnknown_83CC02C[phase], sUnknown_83CC030[phase]);
    MultiplyInvertedPaletteRGBComponents((IndexOfSpritePaletteTag(0x1007) << 4) + 0x103, sUnknown_83CC028[phase], sUnknown_83CC02C[phase], sUnknown_83CC030[phase]);
    if (sprite->data[3] > 2)
    {
        sprite->data[0]++;
        sprite->data[1] = 8;
        sprite->data[2] = 0;
    }
}

static void PokeballGlowEffect_3(struct Sprite * sprite)
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
    MultiplyInvertedPaletteRGBComponents((IndexOfSpritePaletteTag(0x1007) << 4) + 0x108, sUnknown_83CC028[phase], sUnknown_83CC02C[phase], sUnknown_83CC030[phase]);
    MultiplyInvertedPaletteRGBComponents((IndexOfSpritePaletteTag(0x1007) << 4) + 0x106, sUnknown_83CC028[phase], sUnknown_83CC02C[phase], sUnknown_83CC030[phase]);
    MultiplyInvertedPaletteRGBComponents((IndexOfSpritePaletteTag(0x1007) << 4) + 0x102, sUnknown_83CC028[phase], sUnknown_83CC02C[phase], sUnknown_83CC030[phase]);
    MultiplyInvertedPaletteRGBComponents((IndexOfSpritePaletteTag(0x1007) << 4) + 0x105, sUnknown_83CC028[phase], sUnknown_83CC02C[phase], sUnknown_83CC030[phase]);
    MultiplyInvertedPaletteRGBComponents((IndexOfSpritePaletteTag(0x1007) << 4) + 0x103, sUnknown_83CC028[phase], sUnknown_83CC02C[phase], sUnknown_83CC030[phase]);
}

static void PokeballGlowEffect_4(struct Sprite * sprite)
{
    if ((--sprite->data[1]) == 0)
    {
        sprite->data[0]++;
    }
}

static void PokeballGlowEffect_5(struct Sprite * sprite)
{
    sprite->data[0]++;
}

static void PokeballGlowEffect_6(struct Sprite * sprite)
{
    if (sprite->data[5] == 0 || IsFanfareTaskInactive())
    {
        sprite->data[0]++;
    }
}

static void PokeballGlowEffect_7(struct Sprite * sprite)
{
}

static void SpriteCB_PokeballGlow(struct Sprite * sprite)
{
    if (gSprites[sprite->data[0]].data[0] > 4)
        FieldEffectFreeGraphicsResources(sprite);
}

static u8 PokecenterHealEffectHelper(s32 x, s32 y)
{
    u8 spriteId;
    struct Sprite * sprite;
    spriteId = CreateSpriteAtEnd(&sUnknown_83CBFA0, x, y, 0);
    sprite = &gSprites[spriteId];
    sprite->oam.priority = 2;
    sprite->invisible = TRUE;
    return spriteId;
}

static void SpriteCB_PokecenterMonitor(struct Sprite * sprite)
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

static void HallOfFameRecordEffectHelper(s32 x, s32 y)
{
    CreateSpriteAtEnd(&sUnknown_83CBFB8, x, y, 0);
}

static void SpriteCB_HallOfFameMonitor(struct Sprite * sprite)
{
    if (sprite->animEnded)
        FieldEffectFreeGraphicsResources(sprite);
}

static void FieldCallback_Fly(void);
static void Task_FlyOut(u8 taskId);
static void FieldCallback_FlyArrive(void);
static void Task_FlyIn(u8 taskId);

void ReturnToFieldFromFlyMapSelect(void)
{
    SetMainCallback2(CB2_ReturnToField);
    gFieldCallback = FieldCallback_Fly;
}

static void FieldCallback_Fly(void)
{
    FadeInFromBlack();
    CreateTask(Task_FlyOut, 0);
    ScriptContext2_Enable();
    FreezeObjectEvents();
    gFieldCallback = NULL;
}

static void Task_FlyOut(u8 taskId)
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

static void FieldCallback_FlyArrive(void)
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

static void Task_FlyIn(u8 taskId)
{
    struct Task * task;
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

static void Task_FallWarpFieldEffect(u8 taskId);
static bool8 FallWarpEffect_1(struct Task * task);
static bool8 FallWarpEffect_2(struct Task * task);
static bool8 FallWarpEffect_3(struct Task * task);
static bool8 FallWarpEffect_4(struct Task * task);
static bool8 FallWarpEffect_5(struct Task * task);
static bool8 FallWarpEffect_6(struct Task * task);
static bool8 FallWarpEffect_7(struct Task * task);

static bool8 (*const sFallWarpEffectCBPtrs[])(struct Task * task) = {
    FallWarpEffect_1,
    FallWarpEffect_2,
    FallWarpEffect_3,
    FallWarpEffect_4,
    FallWarpEffect_5,
    FallWarpEffect_6,
    FallWarpEffect_7
};

void FieldCB_FallWarpExit(void)
{
    Overworld_PlaySpecialMapMusic();
    WarpFadeInScreen();
    QuestLog_DrawPreviouslyOnQuestHeaderIfInPlaybackMode();
    ScriptContext2_Enable();
    FreezeObjectEvents();
    CreateTask(Task_FallWarpFieldEffect, 0);
    gFieldCallback = NULL;
}

static void Task_FallWarpFieldEffect(u8 taskId)
{
    struct Task * task = &gTasks[taskId];
    while (sFallWarpEffectCBPtrs[task->data[0]](task))
        ;
}

static bool8 FallWarpEffect_1(struct Task * task)
{
    struct ObjectEvent * playerObject;
    struct Sprite * playerSprite;
    playerObject = &gObjectEvents[gPlayerAvatar.objectEventId];
    playerSprite = &gSprites[gPlayerAvatar.spriteId];
    CameraObjectReset2();
    gObjectEvents[gPlayerAvatar.objectEventId].invisible = TRUE;
    gPlayerAvatar.preventStep = TRUE;
    ObjectEventSetHeldMovement(playerObject, GetFaceDirectionMovementAction(GetPlayerFacingDirection()));
    task->data[4] = playerSprite->subspriteMode;
    playerObject->fixedPriority = TRUE;
    playerSprite->oam.priority = 1;
    playerSprite->subspriteMode = SUBSPRITES_IGNORE_PRIORITY;
    task->data[0]++;
    return TRUE;
}

static bool8 FallWarpEffect_2(struct Task * task)
{
    if (IsWeatherNotFadingIn())
    {
        task->data[0]++;
    }
    return FALSE;
}

static bool8 FallWarpEffect_3(struct Task * task)
{
    struct Sprite * sprite;
    s16 centerToCornerVecY;
    sprite = &gSprites[gPlayerAvatar.spriteId];
    centerToCornerVecY = -(sprite->centerToCornerVecY << 1);
    sprite->y2 = -(sprite->y + sprite->centerToCornerVecY + gSpriteCoordOffsetY + centerToCornerVecY);
    task->data[1] = 1;
    task->data[2] = 0;
    gObjectEvents[gPlayerAvatar.objectEventId].invisible = FALSE;
    PlaySE(SE_FALL);
    task->data[0]++;
    return FALSE;
}

static bool8 FallWarpEffect_4(struct Task * task)
{
    struct ObjectEvent * objectEvent;
    struct Sprite * sprite;

    objectEvent = &gObjectEvents[gPlayerAvatar.objectEventId];
    sprite = &gSprites[gPlayerAvatar.spriteId];
    sprite->y2 += task->data[1];
    if (task->data[1] < 8)
    {
        task->data[2] += task->data[1];
        if (task->data[2] & 0xf)
        {
            task->data[1] <<= 1;
        }
    }
    if (task->data[3] == 0 && sprite->y2 >= -16)
    {
        task->data[3]++;
        objectEvent->fixedPriority = FALSE;
        sprite->subspriteMode = task->data[4];
        objectEvent->triggerGroundEffectsOnMove = TRUE;
    }
    if (sprite->y2 >= 0)
    {
        PlaySE(SE_M_STRENGTH);
        objectEvent->triggerGroundEffectsOnStop = TRUE;
        objectEvent->landingJump = TRUE;
        sprite->y2 = 0;
        task->data[0]++;
    }
    return FALSE;
}

static bool8 FallWarpEffect_5(struct Task * task)
{
    task->data[0]++;
    task->data[1] = 4;
    task->data[2] = 0;
    SetCameraPanningCallback(NULL);
    return TRUE;
}

static bool8 FallWarpEffect_6(struct Task * task)
{
    SetCameraPanning(0, task->data[1]);
    task->data[1] = -task->data[1];
    task->data[2]++;
    if ((task->data[2] & 3) == 0)
    {
        task->data[1] >>= 1;
    }
    if (task->data[1] == 0)
    {
        task->data[0]++;
    }
    return FALSE;
}

static bool8 FallWarpEffect_7(struct Task * task)
{
    s16 x, y;
    gPlayerAvatar.preventStep = FALSE;
    ScriptContext2_Disable();
    CameraObjectReset1();
    UnfreezeObjectEvents();
    InstallCameraPanAheadCallback();
    PlayerGetDestCoords(&x, &y);
    // Seafoam Islands
    if (sub_8055B38(MapGridGetMetatileBehaviorAt(x, y)) == TRUE)
    {
        VarSet(VAR_TEMP_1, 1);
        SetPlayerAvatarTransitionFlags(PLAYER_AVATAR_FLAG_SURFING);
        SetHelpContext(HELPCONTEXT_SURFING);
    }
    DestroyTask(FindTaskIdByFunc(Task_FallWarpFieldEffect));
    return FALSE;
}

static void Task_EscalatorWarpFieldEffect(u8 taskId);
static bool8 EscalatorWarpEffect_1(struct Task * task);
static bool8 EscalatorWarpEffect_2(struct Task * task);
static bool8 EscalatorWarpEffect_3(struct Task * task);
static bool8 EscalatorWarpEffect_4(struct Task * task);
static bool8 EscalatorWarpEffect_5(struct Task * task);
static bool8 EscalatorWarpEffect_6(struct Task * task);
static void Escalator_AnimatePlayerGoingDown(struct Task * task);
static void Escalator_AnimatePlayerGoingUp(struct Task * task);
static void Escalator_BeginFadeOutToNewMap(void);
static void Escalator_TransitionToWarpInEffect(void);
static void FieldCB_EscalatorWarpIn(void);
static void Task_EscalatorWarpInFieldEffect(u8 taskId);
static bool8 EscalatorWarpInEffect_1(struct Task * task);
static bool8 EscalatorWarpInEffect_2(struct Task * task);
static bool8 EscalatorWarpInEffect_3(struct Task * task);
static bool8 EscalatorWarpInEffect_4(struct Task * task);
static bool8 EscalatorWarpInEffect_5(struct Task * task);
static bool8 EscalatorWarpInEffect_6(struct Task * task);
static bool8 EscalatorWarpInEffect_7(struct Task * task);

static bool8 (*const sEscalatorWarpFieldEffectFuncs[])(struct Task * task) = {
    EscalatorWarpEffect_1,
    EscalatorWarpEffect_2,
    EscalatorWarpEffect_3,
    EscalatorWarpEffect_4,
    EscalatorWarpEffect_5,
    EscalatorWarpEffect_6
};

void StartEscalatorWarp(u8 metatileBehavior, u8 priority)
{
    u8 taskId = CreateTask(Task_EscalatorWarpFieldEffect, priority);
    gTasks[taskId].data[1] = 0;
    if (metatileBehavior == MB_UP_ESCALATOR)
        gTasks[taskId].data[1] = 1;
}

static void Task_EscalatorWarpFieldEffect(u8 taskId)
{
    struct Task * task = &gTasks[taskId];
    while (sEscalatorWarpFieldEffectFuncs[task->data[0]](task))
        ;
}

static bool8 EscalatorWarpEffect_1(struct Task * task)
{
    FreezeObjectEvents();
    CameraObjectReset2();
    StartEscalator(task->data[1]);
    QuestLog_OnEscalatorWarp(QL_ESCALATOR_OUT);
    task->data[0]++;
    return FALSE;
}

static bool8 EscalatorWarpEffect_2(struct Task * task)
{
    struct ObjectEvent * objectEvent;
    objectEvent = &gObjectEvents[gPlayerAvatar.objectEventId];
    if (!ObjectEventIsMovementOverridden(objectEvent) || ObjectEventClearHeldMovementIfFinished(objectEvent))
    {
        ObjectEventSetHeldMovement(objectEvent, GetFaceDirectionMovementAction(GetPlayerFacingDirection()));
        task->data[0]++;
        task->data[2] = 0;
        task->data[3] = 0;
        if ((u8)task->data[1] == 0)
        {
            task->data[0] = 4;
        }
        PlaySE(SE_ESCALATOR);
    }
    return FALSE;
}

static bool8 EscalatorWarpEffect_3(struct Task * task)
{
    Escalator_AnimatePlayerGoingDown(task);
    if (task->data[2] > 3)
    {
        Escalator_BeginFadeOutToNewMap();
        task->data[0]++;
    }
    return FALSE;
}

static bool8 EscalatorWarpEffect_4(struct Task * task)
{
    Escalator_AnimatePlayerGoingDown(task);
    Escalator_TransitionToWarpInEffect();
    return FALSE;
}

static bool8 EscalatorWarpEffect_5(struct Task * task)
{
    Escalator_AnimatePlayerGoingUp(task);
    if (task->data[2] > 3)
    {
        Escalator_BeginFadeOutToNewMap();
        task->data[0]++;
    }
    return FALSE;
}

static bool8 EscalatorWarpEffect_6(struct Task * task)
{
    Escalator_AnimatePlayerGoingUp(task);
    Escalator_TransitionToWarpInEffect();
    return FALSE;
}


static void Escalator_AnimatePlayerGoingDown(struct Task * task)
{
    struct Sprite * sprite;
    sprite = &gSprites[gPlayerAvatar.spriteId];
    sprite->x2 = Cos(0x84, task->data[2]);
    sprite->y2 = Sin(0x94, task->data[2]);
    task->data[3]++;
    if (task->data[3] & 1)
    {
        task->data[2]++;
    }
}

static void Escalator_AnimatePlayerGoingUp(struct Task * task)
{
    struct Sprite * sprite;
    sprite = &gSprites[gPlayerAvatar.spriteId];
    sprite->x2 = Cos(0x7c, task->data[2]);
    sprite->y2 = Sin(0x76, task->data[2]);
    task->data[3]++;
    if (task->data[3] & 1)
    {
        task->data[2]++;
    }
}

static void Escalator_BeginFadeOutToNewMap(void)
{
    TryFadeOutOldMapMusic();
    WarpFadeOutScreen();
}

static void Escalator_TransitionToWarpInEffect(void)
{
    if (!gPaletteFade.active && BGMusicStopped() == TRUE)
    {
        StopEscalator();
        WarpIntoMap();
        gFieldCallback = FieldCB_EscalatorWarpIn;
        SetMainCallback2(CB2_LoadMap);
        DestroyTask(FindTaskIdByFunc(Task_EscalatorWarpFieldEffect));
    }
}

static bool8 (*const sEscalatorWarpInFieldEffectFuncs[])(struct Task * task) = {
    EscalatorWarpInEffect_1,
    EscalatorWarpInEffect_2,
    EscalatorWarpInEffect_3,
    EscalatorWarpInEffect_4,
    EscalatorWarpInEffect_5,
    EscalatorWarpInEffect_6,
    EscalatorWarpInEffect_7
};

static void FieldCB_EscalatorWarpIn(void)
{
    Overworld_PlaySpecialMapMusic();
    WarpFadeInScreen();
    QuestLog_DrawPreviouslyOnQuestHeaderIfInPlaybackMode();
    ScriptContext2_Enable();
    FreezeObjectEvents();
    CreateTask(Task_EscalatorWarpInFieldEffect, 0);
    gFieldCallback = NULL;
}

static void Task_EscalatorWarpInFieldEffect(u8 taskId)
{
    struct Task * task = &gTasks[taskId];
    while (sEscalatorWarpInFieldEffectFuncs[task->data[0]](task))
        ;
}

static bool8 EscalatorWarpInEffect_1(struct Task * task)
{
    struct ObjectEvent * objectEvent;
    s16 x;
    s16 y;
    u8 behavior;
    CameraObjectReset2();
    objectEvent = &gObjectEvents[gPlayerAvatar.objectEventId];
    ObjectEventSetHeldMovement(objectEvent, GetFaceDirectionMovementAction(DIR_EAST));
    PlayerGetDestCoords(&x, &y);
    behavior = MapGridGetMetatileBehaviorAt(x, y);
    task->data[0]++;
    task->data[1] = 16;
    if (behavior == MB_DOWN_ESCALATOR)
    {
        behavior = 1;
        task->data[0] = 3;
    } else
    {
        behavior = 0;
    }
    StartEscalator(behavior);
    return TRUE;
}

static bool8 EscalatorWarpInEffect_2(struct Task * task)
{
    struct Sprite * sprite;
    sprite = &gSprites[gPlayerAvatar.spriteId];
    sprite->x2 = Cos(0x84, task->data[1]);
    sprite->y2 = Sin(0x94, task->data[1]);
    task->data[0]++;
    return FALSE;
}

static bool8 EscalatorWarpInEffect_3(struct Task * task)
{
    struct Sprite * sprite;
    sprite = &gSprites[gPlayerAvatar.spriteId];
    sprite->x2 = Cos(0x84, task->data[1]);
    sprite->y2 = Sin(0x94, task->data[1]);
    task->data[2]++;
    if (task->data[2] & 1)
    {
        task->data[1]--;
    }
    if (task->data[1] == 0)
    {
        sprite->x2 = 0;
        sprite->y2 = 0;
        task->data[0] = 5;
    }
    return FALSE;
}


static bool8 EscalatorWarpInEffect_4(struct Task * task)
{
    struct Sprite * sprite;
    sprite = &gSprites[gPlayerAvatar.spriteId];
    sprite->x2 = Cos(0x7c, task->data[1]);
    sprite->y2 = Sin(0x76, task->data[1]);
    task->data[0]++;
    return FALSE;
}

static bool8 EscalatorWarpInEffect_5(struct Task * task)
{
    struct Sprite * sprite;
    sprite = &gSprites[gPlayerAvatar.spriteId];
    sprite->x2 = Cos(0x7c, task->data[1]);
    sprite->y2 = Sin(0x76, task->data[1]);
    task->data[2]++;
    if (task->data[2] & 1)
    {
        task->data[1]--;
    }
    if (task->data[1] == 0)
    {
        sprite->x2 = 0;
        sprite->y2 = 0;
        task->data[0]++;
    }
    return FALSE;
}

static bool8 EscalatorWarpInEffect_6(struct Task * task)
{
    if (IsEscalatorMoving())
    {
        return FALSE;
    }
    StopEscalator();
    task->data[0]++;
    return TRUE;
}

static bool8 EscalatorWarpInEffect_7(struct Task * task)
{
    struct ObjectEvent * objectEvent;
    objectEvent = &gObjectEvents[gPlayerAvatar.objectEventId];
    if (ObjectEventClearHeldMovementIfFinished(objectEvent))
    {
        CameraObjectReset1();
        ScriptContext2_Disable();
        UnfreezeObjectEvents();
        ObjectEventSetHeldMovement(objectEvent, GetWalkNormalMovementAction(DIR_EAST));
        DestroyTask(FindTaskIdByFunc(Task_EscalatorWarpInFieldEffect));
        QuestLog_OnEscalatorWarp(QL_ESCALATOR_IN);
    }
    return FALSE;
}

static void Task_UseWaterfall(u8 taskId);

static bool8 waterfall_0_setup(struct Task * task, struct ObjectEvent * playerObj);
static bool8 waterfall_1_do_anim_probably(struct Task * task, struct ObjectEvent * playerObj);
static bool8 waterfall_2_wait_anim_finish_probably(struct Task * task, struct ObjectEvent * playerObj);
static bool8 waterfall_3_move_player_probably(struct Task * task, struct ObjectEvent * playerObj);
static bool8 waterfall_4_wait_player_move_probably(struct Task * task, struct ObjectEvent * playerObj);

static bool8 (*const sUseWaterfallFieldEffectFuncs[])(struct Task * task, struct ObjectEvent * playerObj) = {
    waterfall_0_setup,
    waterfall_1_do_anim_probably,
    waterfall_2_wait_anim_finish_probably,
    waterfall_3_move_player_probably,
    waterfall_4_wait_player_move_probably
};

u32 FldEff_UseWaterfall(void)
{
    u8 taskId = CreateTask(Task_UseWaterfall, 0xFF);
    gTasks[taskId].data[1] = gFieldEffectArguments[0];
    Task_UseWaterfall(taskId);
    return 0;
}

static void Task_UseWaterfall(u8 taskId)
{
    while (sUseWaterfallFieldEffectFuncs[gTasks[taskId].data[0]](&gTasks[taskId], &gObjectEvents[gPlayerAvatar.objectEventId]))
        ;
}

static bool8 waterfall_0_setup(struct Task * task, struct ObjectEvent * playerObj)
{
    ScriptContext2_Enable();
    gPlayerAvatar.preventStep = TRUE;
    task->data[0]++;
    return FALSE;
}

static bool8 waterfall_1_do_anim_probably(struct Task * task, struct ObjectEvent * playerObj)
{
    ScriptContext2_Enable();
    if (!ObjectEventIsMovementOverridden(playerObj))
    {
        ObjectEventClearHeldMovementIfFinished(playerObj);
        gFieldEffectArguments[0] = task->data[1];
        FieldEffectStart(FLDEFF_FIELD_MOVE_SHOW_MON_INIT);
        task->data[0]++;
    }
    return FALSE;
}

static bool8 waterfall_2_wait_anim_finish_probably(struct Task * task, struct ObjectEvent * playerObj)
{
    if (FieldEffectActiveListContains(FLDEFF_FIELD_MOVE_SHOW_MON))
        return FALSE;
    task->data[0]++;
    return TRUE;
}

static bool8 waterfall_3_move_player_probably(struct Task * task, struct ObjectEvent * playerObj)
{
    ObjectEventSetHeldMovement(playerObj, GetWalkSlowestMovementAction(DIR_NORTH));
    task->data[0]++;
    return FALSE;
}

static bool8 waterfall_4_wait_player_move_probably(struct Task * task, struct ObjectEvent * playerObj)
{
    if (!ObjectEventClearHeldMovementIfFinished(playerObj))
        return FALSE;
    if (MetatileBehavior_IsWaterfall(playerObj->currentMetatileBehavior))
    {
        task->data[0] = 3;
        return TRUE;
    }
    ScriptContext2_Disable();
    gPlayerAvatar.preventStep = FALSE;
    DestroyTask(FindTaskIdByFunc(Task_UseWaterfall));
    FieldEffectActiveListRemove(FLDEFF_USE_WATERFALL);
    return FALSE;
}

static void Task_Dive(u8 taskId);
static bool8 dive_1_lock(struct Task * task);
static bool8 dive_2_unknown(struct Task * task);
static bool8 dive_3_unknown(struct Task * task);

static bool8 (*const sDiveFieldEffectFuncPtrs[])(struct Task * task) = {
    dive_1_lock,
    dive_2_unknown,
    dive_3_unknown
};

u32 FldEff_UseDive(void)
{
    u8 taskId = CreateTask(Task_Dive, 0xFF);
    gTasks[taskId].data[15] = gFieldEffectArguments[0];
    gTasks[taskId].data[14] = gFieldEffectArguments[1];
    Task_Dive(taskId);
    return 0;
}

static void Task_Dive(u8 taskId)
{
    while (sDiveFieldEffectFuncPtrs[gTasks[taskId].data[0]](&gTasks[taskId]))
        ;
}

static bool8 dive_1_lock(struct Task * task)
{
    gPlayerAvatar.preventStep = TRUE;
    task->data[0]++;
    return FALSE;
}

static bool8 dive_2_unknown(struct Task * task)
{
    ScriptContext2_Enable();
    gFieldEffectArguments[0] = task->data[15];
    FieldEffectStart(FLDEFF_FIELD_MOVE_SHOW_MON_INIT);
    task->data[0]++;
    return FALSE;
}

static bool8 dive_3_unknown(struct Task * task)
{
    struct MapPosition pos;
    PlayerGetDestCoords(&pos.x, &pos.y);
    if (!FieldEffectActiveListContains(FLDEFF_FIELD_MOVE_SHOW_MON))
    {
        dive_warp(&pos, gObjectEvents[gPlayerAvatar.objectEventId].currentMetatileBehavior);
        DestroyTask(FindTaskIdByFunc(Task_Dive));
        FieldEffectActiveListRemove(FLDEFF_USE_DIVE);
    }
    return FALSE;
}

static void Task_LavaridgeGymB1FWarp(u8 taskId);
static bool8 LavaridgeGymB1FWarpEffect_1(struct Task * task, struct ObjectEvent * objectEvent, struct Sprite * sprite);
static bool8 LavaridgeGymB1FWarpEffect_2(struct Task * task, struct ObjectEvent * objectEvent, struct Sprite * sprite);
static bool8 LavaridgeGymB1FWarpEffect_3(struct Task * task, struct ObjectEvent * objectEvent, struct Sprite * sprite);
static bool8 LavaridgeGymB1FWarpEffect_4(struct Task * task, struct ObjectEvent * objectEvent, struct Sprite * sprite);
static bool8 LavaridgeGymB1FWarpEffect_5(struct Task * task, struct ObjectEvent * objectEvent, struct Sprite * sprite);
static bool8 LavaridgeGymB1FWarpEffect_6(struct Task * task, struct ObjectEvent * objectEvent, struct Sprite * sprite);
static void FieldCB_LavaridgeGymB1FWarpExit(void);
static void Task_LavaridgeGymB1FWarpExit(u8 taskId);
static bool8 LavaridgeGymB1FWarpExitEffect_1(struct Task * task, struct ObjectEvent * objectEvent, struct Sprite * sprite);
static bool8 LavaridgeGymB1FWarpExitEffect_2(struct Task * task, struct ObjectEvent * objectEvent, struct Sprite * sprite);
static bool8 LavaridgeGymB1FWarpExitEffect_3(struct Task * task, struct ObjectEvent * objectEvent, struct Sprite * sprite);
static bool8 LavaridgeGymB1FWarpExitEffect_4(struct Task * task, struct ObjectEvent * objectEvent, struct Sprite * sprite);

static bool8 (*const sLavaridgeGymB1FWarpEffectFuncs[])(struct Task * task, struct ObjectEvent * objectEvent, struct Sprite * sprite) = {
    LavaridgeGymB1FWarpEffect_1,
    LavaridgeGymB1FWarpEffect_2,
    LavaridgeGymB1FWarpEffect_3,
    LavaridgeGymB1FWarpEffect_4,
    LavaridgeGymB1FWarpEffect_5,
    LavaridgeGymB1FWarpEffect_6
};

void StartLavaridgeGymB1FWarp(u8 priority)
{
    CreateTask(Task_LavaridgeGymB1FWarp, priority);
}

static void Task_LavaridgeGymB1FWarp(u8 taskId)
{
    while (sLavaridgeGymB1FWarpEffectFuncs[gTasks[taskId].data[0]](&gTasks[taskId], &gObjectEvents[gPlayerAvatar.objectEventId], &gSprites[gPlayerAvatar.spriteId]));
}

static bool8 LavaridgeGymB1FWarpEffect_1(struct Task * task, struct ObjectEvent * objectEvent, struct Sprite * sprite)
{
    FreezeObjectEvents();
    CameraObjectReset2();
    SetCameraPanningCallback(NULL);
    gPlayerAvatar.preventStep = TRUE;
    objectEvent->fixedPriority = TRUE;
    task->data[1] = 1;
    task->data[0]++;
    return TRUE;
}

static bool8 LavaridgeGymB1FWarpEffect_2(struct Task * task, struct ObjectEvent * objectEvent, struct Sprite * sprite)
{
    SetCameraPanning(0, task->data[1]);
    task->data[1] = -task->data[1];
    task->data[2]++;
    if (task->data[2] > 7)
    {
        task->data[2] = 0;
        task->data[0]++;
    }
    return FALSE;
}

static bool8 LavaridgeGymB1FWarpEffect_3(struct Task * task, struct ObjectEvent * objectEvent, struct Sprite * sprite)
{
    sprite->y2 = 0;
    task->data[3] = 1;
    gFieldEffectArguments[0] = objectEvent->currentCoords.x;
    gFieldEffectArguments[1] = objectEvent->currentCoords.y;
    gFieldEffectArguments[2] = sprite->subpriority - 1;
    gFieldEffectArguments[3] = sprite->oam.priority;
    FieldEffectStart(FLDEFF_LAVARIDGE_GYM_WARP);
    PlaySE(SE_M_EXPLOSION);
    task->data[0]++;
    return TRUE;
}

static bool8 LavaridgeGymB1FWarpEffect_4(struct Task * task, struct ObjectEvent * objectEvent, struct Sprite * sprite)
{
    s16 centerToCornerVecY;
    SetCameraPanning(0, task->data[1]);
    if (task->data[1] = -task->data[1], ++task->data[2] <= 17)
    {
        if (!(task->data[2] & 1) && (task->data[1] <= 3))
        {
            task->data[1] <<= 1;
        }
    } else if (!(task->data[2] & 4) && (task->data[1] > 0))
    {
        task->data[1] >>= 1;
    }
    if (task->data[2] > 6)
    {
        centerToCornerVecY = -(sprite->centerToCornerVecY << 1);
        if (sprite->y2 > -(sprite->y + sprite->centerToCornerVecY + gSpriteCoordOffsetY + centerToCornerVecY))
        {
            sprite->y2 -= task->data[3];
            if (task->data[3] <= 7)
            {
                task->data[3]++;
            }
        } else
        {
            task->data[4] = 1;
        }
    }
    if (task->data[5] == 0 && sprite->y2 < -0x10)
    {
        task->data[5]++;
        objectEvent->fixedPriority = TRUE;
        sprite->oam.priority = 1;
        sprite->subspriteMode = SUBSPRITES_IGNORE_PRIORITY;
    }
    if (task->data[1] == 0 && task->data[4] != 0)
    {
        task->data[0]++;
    }
    return FALSE;
}

static bool8 LavaridgeGymB1FWarpEffect_5(struct Task * task, struct ObjectEvent * objectEvent, struct Sprite * sprite)
{
    TryFadeOutOldMapMusic();
    WarpFadeOutScreen();
    task->data[0]++;
    return FALSE;
}

static bool8 LavaridgeGymB1FWarpEffect_6(struct Task * task, struct ObjectEvent * objectEvent, struct Sprite * sprite)
{
    if (!gPaletteFade.active && BGMusicStopped() == TRUE)
    {
        WarpIntoMap();
        gFieldCallback = FieldCB_LavaridgeGymB1FWarpExit;
        SetMainCallback2(CB2_LoadMap);
        DestroyTask(FindTaskIdByFunc(Task_LavaridgeGymB1FWarp));
    }
    return FALSE;
}

static bool8 (*const sLavaridgeGymB1FWarpExitEffectFuncs[])(struct Task * task, struct ObjectEvent * objectEvent, struct Sprite * sprite) = {
    LavaridgeGymB1FWarpExitEffect_1,
    LavaridgeGymB1FWarpExitEffect_2,
    LavaridgeGymB1FWarpExitEffect_3,
    LavaridgeGymB1FWarpExitEffect_4
};

static void FieldCB_LavaridgeGymB1FWarpExit(void)
{
    Overworld_PlaySpecialMapMusic();
    WarpFadeInScreen();
    QuestLog_DrawPreviouslyOnQuestHeaderIfInPlaybackMode();
    ScriptContext2_Enable();
    gFieldCallback = NULL;
    CreateTask(Task_LavaridgeGymB1FWarpExit, 0);
}

static void Task_LavaridgeGymB1FWarpExit(u8 taskId)
{
    while (sLavaridgeGymB1FWarpExitEffectFuncs[gTasks[taskId].data[0]](&gTasks[taskId], &gObjectEvents[gPlayerAvatar.objectEventId], &gSprites[gPlayerAvatar.spriteId]));
}

static bool8 LavaridgeGymB1FWarpExitEffect_1(struct Task * task, struct ObjectEvent * objectEvent, struct Sprite * sprite)
{
    CameraObjectReset2();
    FreezeObjectEvents();
    gPlayerAvatar.preventStep = TRUE;
    objectEvent->invisible = TRUE;
    task->data[0]++;
    return FALSE;
}

static bool8 LavaridgeGymB1FWarpExitEffect_2(struct Task * task, struct ObjectEvent * objectEvent, struct Sprite * sprite)
{
    if (IsWeatherNotFadingIn())
    {
        gFieldEffectArguments[0] = objectEvent->currentCoords.x;
        gFieldEffectArguments[1] = objectEvent->currentCoords.y;
        gFieldEffectArguments[2] = sprite->subpriority - 1;
        gFieldEffectArguments[3] = sprite->oam.priority;
        task->data[1] = FieldEffectStart(FLDEFF_POP_OUT_OF_ASH);
        task->data[0]++;
    }
    return FALSE;
}

static bool8 LavaridgeGymB1FWarpExitEffect_3(struct Task * task, struct ObjectEvent * objectEvent, struct Sprite * sprite)
{
    sprite = &gSprites[task->data[1]];
    if (sprite->animCmdIndex > 1)
    {
        task->data[0]++;
        objectEvent->invisible = FALSE;
        CameraObjectReset1();
        PlaySE(SE_M_DIG);
        ObjectEventSetHeldMovement(objectEvent, GetJumpMovementAction(DIR_EAST));
    }
    return FALSE;
}

static bool8 LavaridgeGymB1FWarpExitEffect_4(struct Task * task, struct ObjectEvent * objectEvent, struct Sprite * sprite)
{
    if (ObjectEventClearHeldMovementIfFinished(objectEvent))
    {
        gPlayerAvatar.preventStep = FALSE;
        ScriptContext2_Disable();
        UnfreezeObjectEvents();
        DestroyTask(FindTaskIdByFunc(Task_LavaridgeGymB1FWarpExit));
    }
    return FALSE;
}

static void Task_LavaridgeGym1FWarp(u8 taskId);
static bool8 LavaridgeGym1FWarpEffect_1(struct Task * task, struct ObjectEvent * objectEvent, struct Sprite * sprite);
static bool8 LavaridgeGym1FWarpEffect_2(struct Task * task, struct ObjectEvent * objectEvent, struct Sprite * sprite);
static bool8 LavaridgeGym1FWarpEffect_3(struct Task * task, struct ObjectEvent * objectEvent, struct Sprite * sprite);
static bool8 LavaridgeGym1FWarpEffect_4(struct Task * task, struct ObjectEvent * objectEvent, struct Sprite * sprite);
static bool8 LavaridgeGym1FWarpEffect_5(struct Task * task, struct ObjectEvent * objectEvent, struct Sprite * sprite);

static bool8 (*const sLavaridgeGym1FWarpEffectFuncs[])(struct Task * task, struct ObjectEvent * objectEvent, struct Sprite * sprite) = {
    LavaridgeGym1FWarpEffect_1,
    LavaridgeGym1FWarpEffect_2,
    LavaridgeGym1FWarpEffect_3,
    LavaridgeGym1FWarpEffect_4,
    LavaridgeGym1FWarpEffect_5
};

// For the ash puff effect when warping off the B1F ash tiles
u8 FldEff_LavaridgeGymWarp(void)
{
    u8 spriteId;
    SetSpritePosToOffsetMapCoords((s16 *)&gFieldEffectArguments[0], (s16 *)&gFieldEffectArguments[1], 8, 8);
    spriteId = CreateSpriteAtEnd(gFieldEffectObjectTemplatePointers[FLDEFFOBJ_ASH_LAUNCH], gFieldEffectArguments[0], gFieldEffectArguments[1], gFieldEffectArguments[2]);
    gSprites[spriteId].oam.priority = gFieldEffectArguments[3];
    gSprites[spriteId].coordOffsetEnabled = TRUE;
    return spriteId;
}

void SpriteCB_AshLaunch(struct Sprite * sprite)
{
    if (sprite->animEnded)
    {
        FieldEffectStop(sprite, FLDEFF_LAVARIDGE_GYM_WARP);
    }
}

void StartLavaridgeGym1FWarp(u8 priority)
{
    CreateTask(Task_LavaridgeGym1FWarp, priority);
}

static void Task_LavaridgeGym1FWarp(u8 taskId)
{
    while(sLavaridgeGym1FWarpEffectFuncs[gTasks[taskId].data[0]](&gTasks[taskId], &gObjectEvents[gPlayerAvatar.objectEventId], &gSprites[gPlayerAvatar.spriteId]));
}

static bool8 LavaridgeGym1FWarpEffect_1(struct Task * task, struct ObjectEvent * objectEvent, struct Sprite * sprite)
{
    FreezeObjectEvents();
    CameraObjectReset2();
    gPlayerAvatar.preventStep = TRUE;
    objectEvent->fixedPriority = TRUE;
    task->data[0]++;
    return FALSE;
}

static bool8 LavaridgeGym1FWarpEffect_2(struct Task * task, struct ObjectEvent * objectEvent, struct Sprite * sprite)
{
    if (ObjectEventClearHeldMovementIfFinished(objectEvent))
    {
        if (task->data[1] > 3)
        {
            gFieldEffectArguments[0] = objectEvent->currentCoords.x;
            gFieldEffectArguments[1] = objectEvent->currentCoords.y;
            gFieldEffectArguments[2] = sprite->subpriority - 1;
            gFieldEffectArguments[3] = sprite->oam.priority;
            task->data[1] = FieldEffectStart(FLDEFF_POP_OUT_OF_ASH);
            task->data[0]++;
        } else
        {
            task->data[1]++;
            ObjectEventSetHeldMovement(objectEvent, GetWalkInPlaceFastMovementAction(objectEvent->facingDirection));
            PlaySE(SE_LAVARIDGE_FALL_WARP);
        }
    }
    return FALSE;
}

static bool8 LavaridgeGym1FWarpEffect_3(struct Task * task, struct ObjectEvent * objectEvent, struct Sprite * sprite)
{
    if (gSprites[task->data[1]].animCmdIndex == 2)
    {
        objectEvent->invisible = TRUE;
        task->data[0]++;
    }
    return FALSE;
}

static bool8 LavaridgeGym1FWarpEffect_4(struct Task * task, struct ObjectEvent * objectEvent, struct Sprite * sprite)
{
    if (!FieldEffectActiveListContains(FLDEFF_POP_OUT_OF_ASH))
    {
        TryFadeOutOldMapMusic();
        WarpFadeOutScreen();
        task->data[0]++;
    }
    return FALSE;
}

static bool8 LavaridgeGym1FWarpEffect_5(struct Task * task, struct ObjectEvent * objectEvent, struct Sprite * sprite)
{
    if (!gPaletteFade.active && BGMusicStopped() == TRUE)
    {
        WarpIntoMap();
        gFieldCallback = FieldCB_FallWarpExit;
        SetMainCallback2(CB2_LoadMap);
        DestroyTask(FindTaskIdByFunc(Task_LavaridgeGym1FWarp));
    }
    return FALSE;
}

u8 FldEff_PopOutOfAsh(void)
{
    u8 spriteId;
    SetSpritePosToOffsetMapCoords((s16 *)&gFieldEffectArguments[0], (s16 *)&gFieldEffectArguments[1], 8, 8);
    spriteId = CreateSpriteAtEnd(gFieldEffectObjectTemplatePointers[FLDEFFOBJ_ASH_PUFF], gFieldEffectArguments[0], gFieldEffectArguments[1], gFieldEffectArguments[2]);
    gSprites[spriteId].oam.priority = gFieldEffectArguments[3];
    gSprites[spriteId].coordOffsetEnabled = TRUE;
    return spriteId;
}

void SpriteCB_PopOutOfAsh(struct Sprite * sprite)
{
    if (sprite->animEnded)
    {
        FieldEffectStop(sprite, FLDEFF_POP_OUT_OF_ASH);
    }
}

static void Task_DoEscapeRopeFieldEffect(u8 taskId);
static void EscapeRopeFieldEffect_Step0(struct Task * task);
static void EscapeRopeFieldEffect_Step1(struct Task * task);
static u8 sub_808576C(struct ObjectEvent * playerObj, s16 *a1p, s16 *a2p);
static bool32 sub_80857F0(struct ObjectEvent * playerObj, s16 *a1p, s16 *a2p);
static void FieldCallback_EscapeRopeExit(void);
static void Task_DoEscapeRopeExitFieldEffect(u8 taskId);
static void EscapeRopeExitFieldEffect_Step0(struct Task * task);
static void EscapeRopeExitFieldEffect_Step1(struct Task * task);

static void (*const gEscapeRopeFieldEffectFuncs[])(struct Task * task) = {
    EscapeRopeFieldEffect_Step0,
    EscapeRopeFieldEffect_Step1
};

void StartEscapeRopeFieldEffect(void)
{
    ScriptContext2_Enable();
    FreezeObjectEvents();
    CreateTask(Task_DoEscapeRopeFieldEffect, 80);
}

static void Task_DoEscapeRopeFieldEffect(u8 taskId)
{
    gEscapeRopeFieldEffectFuncs[gTasks[taskId].data[0]](&gTasks[taskId]);
}

static void EscapeRopeFieldEffect_Step0(struct Task * task)
{
    task->data[0]++;
    task->data[13] = 64;
    task->data[14] = GetPlayerFacingDirection();
    task->data[15] = 0;
}

static void EscapeRopeFieldEffect_Step1(struct Task * task)
{
    struct ObjectEvent * playerObj = &gObjectEvents[gPlayerAvatar.objectEventId];
    s16 *data = task->data;
    sub_808576C(playerObj, &task->data[1], &task->data[2]);
    if (data[3] < 60)
    {
        data[3]++;
        if (data[3] == 20)
        {
            PlaySE(SE_WARP_IN);
        }
    }
    else if (data[4] == 0 && !sub_80857F0(playerObj, &task->data[5], &task->data[6]))
    {
        TryFadeOutOldMapMusic();
        WarpFadeOutScreen();
        data[4] = 1;
    }
    if (data[4] == 1 && !gPaletteFade.active && BGMusicStopped() == TRUE)
    {
        SetObjectEventDirection(playerObj, task->data[15]);
        SetWarpDestinationToEscapeWarp();
        WarpIntoMap();
        gFieldCallback = FieldCallback_EscapeRopeExit;
        SetMainCallback2(CB2_LoadMap);
        DestroyTask(FindTaskIdByFunc(Task_DoEscapeRopeFieldEffect));
    }
}

static const u8 sUnknown_83CC0E8[] = {
    [DIR_NONE]  = DIR_SOUTH,
    [DIR_SOUTH] = DIR_WEST,
    [DIR_WEST]  = DIR_NORTH,
    [DIR_NORTH] = DIR_EAST,
    [DIR_EAST]  = DIR_SOUTH,
};

static u8 sub_808576C(struct ObjectEvent * playerObj, s16 *delay_p, s16 *stage_p)
{
    if (!ObjectEventIsMovementOverridden(playerObj) || ObjectEventClearHeldMovementIfFinished(playerObj))
    {
        if (*delay_p != 0 && --(*delay_p) != 0)
            return playerObj->facingDirection;
        ObjectEventSetHeldMovement(playerObj, GetFaceDirectionMovementAction(sUnknown_83CC0E8[playerObj->facingDirection]));
        if (*stage_p < 12)
            (*stage_p)++;
        *delay_p = 12 >> (*stage_p); // 12 >> 4 = 0
        return sUnknown_83CC0E8[playerObj->facingDirection];
    }
    return playerObj->facingDirection;
}

static bool32 sub_80857F0(struct ObjectEvent * playerObj, s16 *state_p, s16 *y_p)
{
    struct Sprite * sprite = &gSprites[playerObj->spriteId];
    switch (*state_p)
    {
    case 0:
        CameraObjectReset2();
        (*state_p)++;
        // fallthrough
    case 1:
        sprite->y2 -= 8;
        (*y_p) -= 8;
        if (*y_p <= -16)
        {
            playerObj->fixedPriority = TRUE;
            sprite->oam.priority = 1;
            sprite->subpriority = 0;
            sprite->subspriteMode = SUBSPRITES_OFF;
            (*state_p)++;
        }
        break;
    case 2:
        sprite->y2 -= 8;
        (*y_p) -= 8;
        if (*y_p <= -88)
        {
            (*state_p)++;
            return FALSE;
        }
        break;
    case 3:
        return FALSE;
    }
    return TRUE;
}

static void (*const sEscapeRopeExitEffectFuncs[])(struct Task * task) = {
    EscapeRopeExitFieldEffect_Step0,
    EscapeRopeExitFieldEffect_Step1
};

static bool32 sub_80858A4(struct ObjectEvent * playerObj, s16 *state_p, s16 *y_p, s16 *priority_p, s16 *subpriority_p, s16 *subspriteMode_p)
{
    struct Sprite * sprite = &gSprites[playerObj->spriteId];
    switch (*state_p)
    {
    case 0:
        CameraObjectReset2();
        *y_p = -88;
        sprite->y2 -= 88;
        *priority_p = sprite->oam.priority;
        *subpriority_p = sprite->subpriority;
        *subspriteMode_p = sprite->subspriteMode;
        playerObj->fixedPriority = TRUE;
        sprite->oam.priority = 1;
        sprite->subpriority = 0;
        sprite->subspriteMode = SUBSPRITES_OFF;
        (*state_p)++;
        // fallthrough
    case 1:
        sprite->y2 += 4;
        (*y_p) += 4;
        if (*y_p >= -16)
        {
            sprite->oam.priority = *priority_p;
            sprite->subpriority = *subpriority_p;
            sprite->subspriteMode = *subspriteMode_p;
            (*state_p)++;
        }
        break;
    case 2:
        sprite->y2 += 4;
        (*y_p) += 4;
        if (*y_p >= 0)
        {
            PlaySE(SE_CLICK);
            CameraObjectReset1();
            (*state_p)++;
            return FALSE;
        }
        break;
    case 3:
        return FALSE;
    }
    return TRUE;
}

static void FieldCallback_EscapeRopeExit(void)
{
    Overworld_PlaySpecialMapMusic();
    WarpFadeInScreen();
    QuestLog_DrawPreviouslyOnQuestHeaderIfInPlaybackMode();
    ScriptContext2_Enable();
    FreezeObjectEvents();
    gFieldCallback = NULL;
    gObjectEvents[gPlayerAvatar.objectEventId].invisible = TRUE;
    CreateTask(Task_DoEscapeRopeExitFieldEffect, 0);
}

static void Task_DoEscapeRopeExitFieldEffect(u8 taskId)
{
    sEscapeRopeExitEffectFuncs[gTasks[taskId].data[0]](&gTasks[taskId]);
}

static void EscapeRopeExitFieldEffect_Step0(struct Task * task)
{
    if (IsWeatherNotFadingIn())
    {
        PlaySE(SE_WARP_OUT);
        task->data[15] = GetPlayerFacingDirection();
        task->data[0]++;
    }
}

static void EscapeRopeExitFieldEffect_Step1(struct Task * task)
{
    s16 *data = task->data;
    struct ObjectEvent * playerObj = &gObjectEvents[gPlayerAvatar.objectEventId];
    bool32 finished = sub_80858A4(playerObj, &data[1], &data[2], &data[3], &data[4], &data[5]);
    playerObj->invisible = FALSE;
    if (data[6] < 8)
        data[6]++;
    else if (data[7] == 0)
    {
        data[6]++;
        data[8] = sub_808576C(playerObj, &data[9], &data[10]);
        if (data[6] >= 50 && data[8] == data[15])
            data[7] = 1;
    }
    if (!finished && data[8] == data[15] && ObjectEventCheckHeldMovementStatus(playerObj) == TRUE)
    {
        playerObj->invisible = FALSE;
        playerObj->fixedPriority = FALSE;
        ScriptContext2_Disable();
        UnfreezeObjectEvents();
        DestroyTask(FindTaskIdByFunc(Task_DoEscapeRopeExitFieldEffect));
    }
}

static void Task_DoTeleportFieldEffect(u8 taskId);
static void TeleportFieldEffectTask1(struct Task * task);
static void TeleportFieldEffectTask2(struct Task * task);
static void TeleportFieldEffectTask3(struct Task * task);
static void TeleportFieldEffectTask4(struct Task * task);
static void FieldCallback_TeleportIn(void);
static void Task_DoTeleportInFieldEffect(u8 taskId);
static void TeleportInFieldEffectTask1(struct Task * task);
static void TeleportInFieldEffectTask2(struct Task * task);
static void TeleportInFieldEffectTask3(struct Task * task);

static void (*const sTeleportEffectFuncs[])(struct Task * ) = {
    TeleportFieldEffectTask1,
    TeleportFieldEffectTask2,
    TeleportFieldEffectTask3,
    TeleportFieldEffectTask4
};

void CreateTeleportFieldEffectTask(void)
{
    CreateTask(Task_DoTeleportFieldEffect, 0);
}

static void Task_DoTeleportFieldEffect(u8 taskId)
{
    sTeleportEffectFuncs[gTasks[taskId].data[0]](&gTasks[taskId]);
}

static void TeleportFieldEffectTask1(struct Task * task)
{
    ScriptContext2_Enable();
    FreezeObjectEvents();
    CameraObjectReset2();
    task->data[15] = GetPlayerFacingDirection();
    task->data[0]++;
}

static void TeleportFieldEffectTask2(struct Task * task)
{
    u8 spinDirections[5] = {
        [DIR_NONE]  = DIR_SOUTH,
        [DIR_SOUTH] = DIR_WEST,
        [DIR_WEST]  = DIR_NORTH,
        [DIR_NORTH] = DIR_EAST,
        [DIR_EAST]  = DIR_SOUTH
    };
    struct ObjectEvent * objectEvent = &gObjectEvents[gPlayerAvatar.objectEventId];
    if (task->data[1] == 0 || (--task->data[1]) == 0)
    {
        ObjectEventTurn(objectEvent, spinDirections[objectEvent->facingDirection]);
        task->data[1] = 8;
        task->data[2]++;
    }
    if (task->data[2] > 7 && task->data[15] == objectEvent->facingDirection)
    {
        task->data[0]++;
        task->data[1] = 4;
        task->data[2] = 8;
        task->data[3] = 1;
        PlaySE(SE_WARP_IN);
    }
}

static void TeleportFieldEffectTask3(struct Task * task)
{
    u8 spinDirections[5] = {DIR_SOUTH, DIR_WEST, DIR_EAST, DIR_NORTH, DIR_SOUTH};
    struct ObjectEvent * objectEvent = &gObjectEvents[gPlayerAvatar.objectEventId];
    struct Sprite * sprite = &gSprites[gPlayerAvatar.spriteId];
    if ((--task->data[1]) <= 0)
    {
        task->data[1] = 4;
        ObjectEventTurn(objectEvent, spinDirections[objectEvent->facingDirection]);
    }
    sprite->y -= task->data[3];
    task->data[4] += task->data[3];
    if ((--task->data[2]) <= 0 && (task->data[2] = 4, task->data[3] < 8))
    {
        task->data[3] <<= 1;
    }
    if (task->data[4] > 8 && (sprite->oam.priority = 1, sprite->subspriteMode != SUBSPRITES_OFF))
    {
        sprite->subspriteMode = SUBSPRITES_IGNORE_PRIORITY;
    }
    if (task->data[4] >= 0xa8)
    {
        task->data[0]++;
        TryFadeOutOldMapMusic();
        WarpFadeOutScreen();
    }
}

static void TeleportFieldEffectTask4(struct Task * task)
{
    if (!gPaletteFade.active)
    {
        if (BGMusicStopped() == TRUE)
        {
            SetWarpDestinationToLastHealLocation();
            WarpIntoMap();
            SetMainCallback2(CB2_LoadMap);
            gFieldCallback = FieldCallback_TeleportIn;
            DestroyTask(FindTaskIdByFunc(Task_DoTeleportFieldEffect));
        }
    }
}

static void (*const sTeleportInEffectFuncs[])(struct Task * ) = {
    TeleportInFieldEffectTask1,
    TeleportInFieldEffectTask2,
    TeleportInFieldEffectTask3
};

static void FieldCallback_TeleportIn(void)
{
    Overworld_PlaySpecialMapMusic();
    WarpFadeInScreen();
    QuestLog_DrawPreviouslyOnQuestHeaderIfInPlaybackMode();
    ScriptContext2_Enable();
    FreezeObjectEvents();
    gFieldCallback = NULL;
    gObjectEvents[gPlayerAvatar.objectEventId].invisible = TRUE;
    CameraObjectReset2();
    CreateTask(Task_DoTeleportInFieldEffect, 0);
}

static void Task_DoTeleportInFieldEffect(u8 taskId)
{
    sTeleportInEffectFuncs[gTasks[taskId].data[0]](&gTasks[taskId]);
}

static void TeleportInFieldEffectTask1(struct Task * task)
{
    struct Sprite * sprite;
    s16 centerToCornerVecY;
    if (IsWeatherNotFadingIn())
    {
        sprite = &gSprites[gPlayerAvatar.spriteId];
        centerToCornerVecY = -(sprite->centerToCornerVecY << 1);
        sprite->y2 = -(sprite->y + sprite->centerToCornerVecY + gSpriteCoordOffsetY + centerToCornerVecY);
        gObjectEvents[gPlayerAvatar.objectEventId].invisible = FALSE;
        task->data[0]++;
        task->data[1] = 8;
        task->data[2] = 1;
        task->data[14] = sprite->subspriteMode;
        task->data[15] = GetPlayerFacingDirection();
        PlaySE(SE_WARP_IN);
    }
}

static void TeleportInFieldEffectTask2(struct Task * task)
{
    u8 spinDirections[5] = {1, 3, 4, 2, 1};
    struct ObjectEvent * objectEvent = &gObjectEvents[gPlayerAvatar.objectEventId];
    struct Sprite * sprite = &gSprites[gPlayerAvatar.spriteId];
    if ((sprite->y2 += task->data[1]) >= -8)
    {
        if (task->data[13] == 0)
        {
            task->data[13]++;
            objectEvent->triggerGroundEffectsOnMove = TRUE;
            sprite->subspriteMode = task->data[14];
        }
    } else
    {
        sprite->oam.priority = 1;
        if (sprite->subspriteMode != SUBSPRITES_OFF)
        {
            sprite->subspriteMode = SUBSPRITES_IGNORE_PRIORITY;
        }
    }
    if (sprite->y2 >= -0x30 && task->data[1] > 1 && !(sprite->y2 & 1))
    {
        task->data[1]--;
    }
    if ((--task->data[2]) == 0)
    {
        task->data[2] = 4;
        ObjectEventTurn(objectEvent, spinDirections[objectEvent->facingDirection]);
    }
    if (sprite->y2 >= 0)
    {
        sprite->y2 = 0;
        task->data[0]++;
        task->data[1] = 1;
        task->data[2] = 0;
    }
}

static void TeleportInFieldEffectTask3(struct Task * task)
{
    u8 spinDirections[5] = {1, 3, 4, 2, 1};
    struct ObjectEvent * objectEvent = &gObjectEvents[gPlayerAvatar.objectEventId];
    if ((--task->data[1]) == 0)
    {
        ObjectEventTurn(objectEvent, spinDirections[objectEvent->facingDirection]);
        task->data[1] = 8;
        if ((++task->data[2]) > 4 && task->data[14] == objectEvent->facingDirection)
        {
            ScriptContext2_Disable();
            CameraObjectReset1();
            UnfreezeObjectEvents();
            DestroyTask(FindTaskIdByFunc(Task_DoTeleportInFieldEffect));
        }
    }
}

static void Task_ShowMon_Outdoors(u8 taskId);
static void ShowMonEffect_Outdoors_1(struct Task * task);
static void ShowMonEffect_Outdoors_2(struct Task * task);
static void ShowMonEffect_Outdoors_3(struct Task * task);
static void ShowMonEffect_Outdoors_4(struct Task * task);
static void ShowMonEffect_Outdoors_5(struct Task * task);
static void ShowMonEffect_Outdoors_6(struct Task * task);
static void ShowMonEffect_Outdoors_7(struct Task * task);
static void VBlankCB_ShowMonEffect_Outdoors(void);
static void LoadFieldMoveStreaksTilemapToVram(u16 screenbase);
static void Task_ShowMon_Indoors(u8 taskId);
static void ShowMonEffect_Indoors_1(struct Task * task);
static void ShowMonEffect_Indoors_2(struct Task * task);
static void ShowMonEffect_Indoors_3(struct Task * task);
static void ShowMonEffect_Indoors_4(struct Task * task);
static void ShowMonEffect_Indoors_5(struct Task * task);
static void ShowMonEffect_Indoors_6(struct Task * task);
static void ShowMonEffect_Indoors_7(struct Task * task);
static void VBlankCB_ShowMonEffect_Indoors(void);
static void AnimateIndoorShowMonBg(struct Task * task);
static bool8 SlideIndoorBannerOnscreen(struct Task * task);
static bool8 SlideIndoorBannerOffscreen(struct Task * task);
static u8 InitFieldMoveMonSprite(u32 species, u32 otId, u32 personality);
static void SpriteCB_FieldMoveMonSlideOnscreen(struct Sprite * sprite);
static void SpriteCB_FieldMoveMonWaitAfterCry(struct Sprite * sprite);
static void SpriteCB_FieldMoveMonSlideOffscreen(struct Sprite * sprite);

static void (*const sShowMonOutdoorsEffectFuncs[])(struct Task * task) = {
    ShowMonEffect_Outdoors_1,
    ShowMonEffect_Outdoors_2,
    ShowMonEffect_Outdoors_3,
    ShowMonEffect_Outdoors_4,
    ShowMonEffect_Outdoors_5,
    ShowMonEffect_Outdoors_6,
    ShowMonEffect_Outdoors_7
};

u32 FldEff_FieldMoveShowMon(void)
{
    u8 taskId;
    if (IsMapTypeOutdoors(GetCurrentMapType()) == TRUE)
        taskId = CreateTask(Task_ShowMon_Outdoors, 0xFF);
    else
        taskId = CreateTask(Task_ShowMon_Indoors, 0xFF);
    gTasks[taskId].data[15] = InitFieldMoveMonSprite(gFieldEffectArguments[0], gFieldEffectArguments[1], gFieldEffectArguments[2]);
    return 0;
}

u32 FldEff_FieldMoveShowMonInit(void)
{
    u32 r6 = gFieldEffectArguments[0] & 0x80000000;
    u8 partyIdx = gFieldEffectArguments[0];
    gFieldEffectArguments[0] = GetMonData(&gPlayerParty[partyIdx], MON_DATA_SPECIES);
    gFieldEffectArguments[1] = GetMonData(&gPlayerParty[partyIdx], MON_DATA_OT_ID);
    gFieldEffectArguments[2] = GetMonData(&gPlayerParty[partyIdx], MON_DATA_PERSONALITY);
    gFieldEffectArguments[0] |= r6;
    FieldEffectStart(FLDEFF_FIELD_MOVE_SHOW_MON);
    FieldEffectActiveListRemove(FLDEFF_FIELD_MOVE_SHOW_MON_INIT);
    return 0;
}

static void Task_ShowMon_Outdoors(u8 taskId)
{
    sShowMonOutdoorsEffectFuncs[gTasks[taskId].data[0]](&gTasks[taskId]);
}

static void ShowMonEffect_Outdoors_1(struct Task * task)
{
    task->data[11] = GetGpuReg(REG_OFFSET_WININ);
    task->data[12] = GetGpuReg(REG_OFFSET_WINOUT);
    StoreWordInTwoHalfwords((u16*)&task->data[13], (u32)gMain.vblankCallback);
    task->data[1] = WIN_RANGE(0xF0, 0xF1);
    task->data[2] = WIN_RANGE(0x50, 0x51);
    task->data[3] = WININ_WIN0_BG_ALL | WININ_WIN0_OBJ | WININ_WIN0_CLR;
    task->data[4] = WINOUT_WIN01_BG1 | WINOUT_WIN01_BG2 | WINOUT_WIN01_BG3 | WINOUT_WIN01_OBJ | WINOUT_WIN01_CLR;
    SetGpuReg(REG_OFFSET_WIN0H, task->data[1]);
    SetGpuReg(REG_OFFSET_WIN0V, task->data[2]);
    SetGpuReg(REG_OFFSET_WININ, task->data[3]);
    SetGpuReg(REG_OFFSET_WINOUT, task->data[4]);
    SetVBlankCallback(VBlankCB_ShowMonEffect_Outdoors);
    task->data[0]++;
}

static void ShowMonEffect_Outdoors_2(struct Task * task)
{
    u16 charbase = ((GetGpuReg(REG_OFFSET_BG0CNT) >> 2) << 14);
    u16 screenbase = ((GetGpuReg(REG_OFFSET_BG0CNT) >> 8) << 11);
    CpuCopy16(sFieldMoveStreaksTiles, (void *)(VRAM + charbase), 0x200);
    CpuFill32(0, (void *)(VRAM + screenbase), 0x800);
    LoadPalette(sFieldMoveStreaksPalette, 0xf0, 0x20);
    LoadFieldMoveStreaksTilemapToVram(screenbase);
    task->data[0]++;
}

static void ShowMonEffect_Outdoors_3(struct Task * task)
{
    s16 win0h_lo;
    s16 win0v_lo;
    s16 win0v_hi;
    task->data[5] -= 16;
    win0h_lo = ((u16)task->data[1] >> 8);
    win0v_lo = ((u16)task->data[2] >> 8);
    win0v_hi = ((u16)task->data[2] & 0xff);
    win0h_lo -= 16;
    win0v_lo -= 2;
    win0v_hi += 2;
    if (win0h_lo < 0)
    {
        win0h_lo = 0;
    }
    if (win0v_lo < 0x28)
    {
        win0v_lo = 0x28;
    }
    if (win0v_hi > 0x78)
    {
        win0v_hi = 0x78;
    }
    task->data[1] = WIN_RANGE(win0h_lo, task->data[1] & 0xff);
    task->data[2] = WIN_RANGE(win0v_lo, win0v_hi);
    if (win0h_lo == 0 && win0v_lo == 0x28 && win0v_hi == 0x78)
    {
        gSprites[task->data[15]].callback = SpriteCB_FieldMoveMonSlideOnscreen;
        task->data[0]++;
    }
}

static void ShowMonEffect_Outdoors_4(struct Task * task)
{
    task->data[5] -= 16;
    if (gSprites[task->data[15]].data[7])
    {
        task->data[0]++;
    }
}

static void ShowMonEffect_Outdoors_5(struct Task * task)
{
    s16 win0v_lo;
    s16 win0v_hi;
    task->data[5] -= 16;
    win0v_lo = (task->data[2] >> 8);
    win0v_hi = (task->data[2] & 0xff);
    win0v_lo += 6;
    win0v_hi -= 6;
    if (win0v_lo > 0x50)
    {
        win0v_lo = 0x50;
    }
    if (win0v_hi < 0x51)
    {
        win0v_hi = 0x51;
    }
    task->data[2] = WIN_RANGE(win0v_lo, win0v_hi);
    if (win0v_lo == 0x50 && win0v_hi == 0x51)
    {
        task->data[0]++;
    }
}

static void ShowMonEffect_Outdoors_6(struct Task * task)
{
    u16 bg0cnt = (GetGpuReg(REG_OFFSET_BG0CNT) >> 8) << 11;
    CpuFill32(0, (void *)VRAM + bg0cnt, 0x800);
    task->data[1] = WIN_RANGE(0x00, 0xf1);
    task->data[2] = WIN_RANGE(0x00, 0xa1);
    task->data[3] = task->data[11];
    task->data[4] = task->data[12];
    task->data[0]++;
}

static void ShowMonEffect_Outdoors_7(struct Task * task)
{
    IntrCallback callback;
    LoadWordFromTwoHalfwords((u16 *)&task->data[13], (uintptr_t *)&callback);
    SetVBlankCallback(callback);
    ChangeBgX(0, 0, 0);
    ChangeBgY(0, 0, 0);
    Menu_LoadStdPal();
    FreeResourcesAndDestroySprite(&gSprites[task->data[15]], task->data[15]);
    FieldEffectActiveListRemove(FLDEFF_FIELD_MOVE_SHOW_MON);
    DestroyTask(FindTaskIdByFunc(Task_ShowMon_Outdoors));
}

static void VBlankCB_ShowMonEffect_Outdoors(void)
{
    IntrCallback callback;
    struct Task * task = &gTasks[FindTaskIdByFunc(Task_ShowMon_Outdoors)];
    LoadWordFromTwoHalfwords((u16 *)&task->data[13], (uintptr_t *)&callback);
    callback();
    SetGpuReg(REG_OFFSET_WIN0H, task->data[1]);
    SetGpuReg(REG_OFFSET_WIN0V, task->data[2]);
    SetGpuReg(REG_OFFSET_WININ, task->data[3]);
    SetGpuReg(REG_OFFSET_WINOUT, task->data[4]);
    SetGpuReg(REG_OFFSET_BG0HOFS, task->data[5]);
    SetGpuReg(REG_OFFSET_BG0VOFS, task->data[6]);
}

static void LoadFieldMoveStreaksTilemapToVram(u16 screenbase)
{
    u16 i;
    u16 *dest;
    dest = (u16 *)(VRAM + (10 * 32) + screenbase);
    for (i = 0; i < (10 * 32); i++, dest++)
    {
        *dest = sFieldMoveStreaksTilemap[i] | METATILE_ELEVATION_MASK;
    }
}

static void (*const sShowMonIndoorsEffectFuncs[])(struct Task * ) = {
    ShowMonEffect_Indoors_1,
    ShowMonEffect_Indoors_2,
    ShowMonEffect_Indoors_3,
    ShowMonEffect_Indoors_4,
    ShowMonEffect_Indoors_5,
    ShowMonEffect_Indoors_6,
    ShowMonEffect_Indoors_7
};

static void Task_ShowMon_Indoors(u8 taskId)
{
    sShowMonIndoorsEffectFuncs[gTasks[taskId].data[0]](&gTasks[taskId]);
}

static void ShowMonEffect_Indoors_1(struct Task * task)
{
    SetGpuReg(REG_OFFSET_BG0HOFS, task->data[1]);
    SetGpuReg(REG_OFFSET_BG0VOFS, task->data[2]);
    StoreWordInTwoHalfwords((u16 *)&task->data[13], (u32)gMain.vblankCallback);
    SetVBlankCallback(VBlankCB_ShowMonEffect_Indoors);
    task->data[0]++;
}

static void ShowMonEffect_Indoors_2(struct Task * task)
{
    u16 charbase;
    u16 screenbase;
    charbase = ((GetGpuReg(REG_OFFSET_BG0CNT) >> 2) << 14);
    screenbase = ((GetGpuReg(REG_OFFSET_BG0CNT) >> 8) << 11);
    task->data[12] = screenbase;
    CpuCopy16(sDarknessFieldMoveStreaksTiles, (void *)(VRAM + charbase), 0x80);
    CpuFill32(0, (void *)(VRAM + screenbase), 0x800);
    LoadPalette(sDarknessFieldMoveStreaksPalette, 0xf0, 0x20);
    task->data[0]++;
}

static void ShowMonEffect_Indoors_3(struct Task * task)
{
    if (SlideIndoorBannerOnscreen(task))
    {
        task->data[5] = GetGpuReg(REG_OFFSET_WININ);
        SetGpuReg(REG_OFFSET_WININ, (task->data[5] & 0xFF) | WININ_WIN1_BG0 | WININ_WIN1_OBJ);
        SetGpuReg(REG_OFFSET_WIN1H, WIN_RANGE(0x00, 0xf0));
        SetGpuReg(REG_OFFSET_WIN1V, WIN_RANGE(0x28, 0x78));
        gSprites[task->data[15]].callback = SpriteCB_FieldMoveMonSlideOnscreen;
        task->data[0]++;
    }
    AnimateIndoorShowMonBg(task);
}

static void ShowMonEffect_Indoors_4(struct Task * task)
{
    AnimateIndoorShowMonBg(task);
    if (gSprites[task->data[15]].data[7])
    {
        task->data[0]++;
    }
}

static void ShowMonEffect_Indoors_5(struct Task * task)
{
    AnimateIndoorShowMonBg(task);
    task->data[3] = task->data[1] & 7;
    task->data[4] = 0;
    SetGpuReg(REG_OFFSET_WIN1H, WIN_RANGE(0xff, 0xff));
    SetGpuReg(REG_OFFSET_WIN1V, WIN_RANGE(0xff, 0xff));
    SetGpuReg(REG_OFFSET_WININ, task->data[5]);
    task->data[0]++;
}

static void ShowMonEffect_Indoors_6(struct Task * task)
{
    AnimateIndoorShowMonBg(task);
    if (SlideIndoorBannerOffscreen(task))
    {
        task->data[0]++;
    }
}

static void ShowMonEffect_Indoors_7(struct Task * task)
{
    IntrCallback intrCallback;
    u16 charbase;
    charbase = (GetGpuReg(REG_OFFSET_BG0CNT) >> 8) << 11;
    CpuFill32(0, (void *)VRAM + charbase, 0x800);
    LoadWordFromTwoHalfwords((u16 *)&task->data[13], (uintptr_t *)&intrCallback);
    SetVBlankCallback(intrCallback);
    ChangeBgX(0, 0, 0);
    ChangeBgY(0, 0, 0);
    Menu_LoadStdPal();
    FreeResourcesAndDestroySprite(&gSprites[task->data[15]], task->data[15]);
    FieldEffectActiveListRemove(FLDEFF_FIELD_MOVE_SHOW_MON);
    DestroyTask(FindTaskIdByFunc(Task_ShowMon_Indoors));
}

static void VBlankCB_ShowMonEffect_Indoors(void)
{
    IntrCallback intrCallback;
    struct Task * task;
    task = &gTasks[FindTaskIdByFunc(Task_ShowMon_Indoors)];
    LoadWordFromTwoHalfwords((u16 *)&task->data[13], (uintptr_t *)&intrCallback);
    intrCallback();
    SetGpuReg(REG_OFFSET_BG0HOFS, task->data[1]);
    SetGpuReg(REG_OFFSET_BG0VOFS, task->data[2]);
}

static void AnimateIndoorShowMonBg(struct Task * task)
{
    task->data[1] -= 16;
    task->data[3] += 16;
}

static bool8 SlideIndoorBannerOnscreen(struct Task * task)
{
    u16 i;
    u16 srcOffs;
    u16 dstOffs;
    u16 *dest;
    if (task->data[4] >= 32)
    {
        return TRUE;
    }
    dstOffs = (task->data[3] >> 3) & 0x1f;
    if (dstOffs >= task->data[4])
    {
        dstOffs = (32 - dstOffs) & 0x1f;
        srcOffs = (32 - task->data[4]) & 0x1f;
        dest = (u16 *)(VRAM + 0x140 + (u16)task->data[12]);
        for (i = 0; i < 10; i++)
        {
            dest[dstOffs + i * 32] = sDarknessFieldMoveStreaksTilemap[srcOffs + i * 32];
            dest[dstOffs + i * 32] |= 0xf000;

            dest[((dstOffs + 1) & 0x1f) + i * 32] = sDarknessFieldMoveStreaksTilemap[((srcOffs + 1) & 0x1f) + i * 32] | 0xf000;
            dest[((dstOffs + 1) & 0x1f) + i * 32] |= 0xf000;
        }
        task->data[4] += 2;
    }
    return FALSE;
}

static bool8 SlideIndoorBannerOffscreen(struct Task * task)
{
    u16 i;
    u16 dstOffs;
    u16 *dest;
    if (task->data[4] >= 32)
    {
        return TRUE;
    }
    dstOffs = task->data[3] >> 3;
    if (dstOffs >= task->data[4])
    {
        dstOffs = (task->data[1] >> 3) & 0x1f;
        dest = (u16 *)(VRAM + 0x140 + (u16)task->data[12]);
        for (i = 0; i < 10; i++)
        {
            dest[dstOffs + i * 32] = 0xf000;
            dest[((dstOffs + 1) & 0x1f) + i * 32] = 0xf000;
        }
        task->data[4] += 2;
    }
    return FALSE;
}

static u8 InitFieldMoveMonSprite(u32 species, u32 otId, u32 personality)
{
    bool16 playCry;
    u8 monSprite;
    struct Sprite * sprite;
    playCry = (species & 0x80000000) >> 16;
    species &= 0x7fffffff;
    monSprite = CreateMonSprite_FieldMove(species, otId, personality, 0x140, 0x50, 0);
    sprite = &gSprites[monSprite];
    sprite->callback = SpriteCallbackDummy;
    sprite->oam.priority = 0;
    sprite->data[0] = species;
    sprite->data[6] = playCry;
    return monSprite;
}

static void SpriteCB_FieldMoveMonSlideOnscreen(struct Sprite * sprite)
{
    if ((sprite->x -= 20) <= 0x78)
    {
        sprite->x = 0x78;
        sprite->data[1] = 30;
        sprite->callback = SpriteCB_FieldMoveMonWaitAfterCry;
        if (sprite->data[6])
        {
            PlayCry2(sprite->data[0], 0, 0x7d, 0xa);
        }
        else
        {
            PlayCry1(sprite->data[0], 0);
        }
    }
}

static void SpriteCB_FieldMoveMonWaitAfterCry(struct Sprite * sprite)
{
    if ((--sprite->data[1]) == 0)
    {
        sprite->callback = SpriteCB_FieldMoveMonSlideOffscreen;
    }
}

static void SpriteCB_FieldMoveMonSlideOffscreen(struct Sprite * sprite)
{
    if (sprite->x < -0x40)
    {
        sprite->data[7] = 1;
    }
    else
    {
        sprite->x -= 20;
    }
}

static void Task_FldEffUseSurf(u8 taskId);
static void UseSurfEffect_1(struct Task * task);
static void UseSurfEffect_2(struct Task * task);
static void UseSurfEffect_3(struct Task * task);
static void UseSurfEffect_4(struct Task * task);
static void UseSurfEffect_5(struct Task * task);

static void (*const sUseSurfEffectFuncs[])(struct Task * ) = {
    UseSurfEffect_1,
    UseSurfEffect_2,
    UseSurfEffect_3,
    UseSurfEffect_4,
    UseSurfEffect_5,
};

u8 FldEff_UseSurf(void)
{
    u8 taskId = CreateTask(Task_FldEffUseSurf, 0xff);
    gTasks[taskId].data[15] = gFieldEffectArguments[0];
    Overworld_ClearSavedMusic();
    if (Overworld_MusicCanOverrideMapMusic(MUS_SURF))
        Overworld_ChangeMusicTo(MUS_SURF);
    return FALSE;
}

static void Task_FldEffUseSurf(u8 taskId)
{
    sUseSurfEffectFuncs[gTasks[taskId].data[0]](&gTasks[taskId]);
}

static void UseSurfEffect_1(struct Task * task)
{
    ScriptContext2_Enable();
    FreezeObjectEvents();
    gPlayerAvatar.preventStep = TRUE;
    SetPlayerAvatarStateMask(PLAYER_AVATAR_FLAG_SURFING);
    PlayerGetDestCoords(&task->data[1], &task->data[2]);
    MoveCoords(gObjectEvents[gPlayerAvatar.objectEventId].movementDirection, &task->data[1], &task->data[2]);
    task->data[0]++;
}

static void UseSurfEffect_2(struct Task * task)
{
    struct ObjectEvent * objectEvent;
    objectEvent = &gObjectEvents[gPlayerAvatar.objectEventId];
    if (!ObjectEventIsMovementOverridden(objectEvent) || ObjectEventClearHeldMovementIfFinished(objectEvent))
    {
        StartPlayerAvatarSummonMonForFieldMoveAnim();
        ObjectEventSetHeldMovement(objectEvent, MOVEMENT_ACTION_START_ANIM_IN_DIRECTION);
        task->data[0]++;
    }
}

static void UseSurfEffect_3(struct Task * task)
{
    struct ObjectEvent * objectEvent;
    objectEvent = &gObjectEvents[gPlayerAvatar.objectEventId];
    if (ObjectEventCheckHeldMovementStatus(objectEvent))
    {
        gFieldEffectArguments[0] = task->data[15] | 0x80000000;
        FieldEffectStart(FLDEFF_FIELD_MOVE_SHOW_MON_INIT);
        task->data[0]++;
    }
}

static void UseSurfEffect_4(struct Task * task)
{
    struct ObjectEvent * objectEvent;
    if (!FieldEffectActiveListContains(FLDEFF_FIELD_MOVE_SHOW_MON))
    {
        objectEvent = &gObjectEvents[gPlayerAvatar.objectEventId];
        ObjectEventSetGraphicsId(objectEvent, GetPlayerAvatarGraphicsIdByStateId(PLAYER_AVATAR_GFX_RIDE));
        ObjectEventClearHeldMovementIfFinished(objectEvent);
        ObjectEventSetHeldMovement(objectEvent, GetJumpSpecialMovementAction(objectEvent->movementDirection));
        gFieldEffectArguments[0] = task->data[1];
        gFieldEffectArguments[1] = task->data[2];
        gFieldEffectArguments[2] = gPlayerAvatar.objectEventId;
        objectEvent->fieldEffectSpriteId = FieldEffectStart(FLDEFF_SURF_BLOB);
        task->data[0]++;
    }
}

static void UseSurfEffect_5(struct Task * task)
{
    struct ObjectEvent * objectEvent;
    objectEvent = &gObjectEvents[gPlayerAvatar.objectEventId];
    if (ObjectEventClearHeldMovementIfFinished(objectEvent))
    {
        gPlayerAvatar.preventStep = FALSE;
        gPlayerAvatar.flags &= ~PLAYER_AVATAR_FLAG_CONTROLLABLE;
        ObjectEventSetHeldMovement(objectEvent, GetFaceDirectionMovementAction(objectEvent->movementDirection));
        SetSurfBlob_BobState(objectEvent->fieldEffectSpriteId, 1);
        UnfreezeObjectEvents();
        ScriptContext2_Disable();
        FieldEffectActiveListRemove(FLDEFF_USE_SURF);
        DestroyTask(FindTaskIdByFunc(Task_FldEffUseSurf));
        SetHelpContext(HELPCONTEXT_SURFING);
    }
}

static void Task_FldEffUseVsSeeker(u8 taskId);
static void UseVsSeekerEffect_1(struct Task * task);
static void UseVsSeekerEffect_2(struct Task * task);
static void UseVsSeekerEffect_3(struct Task * task);
static void UseVsSeekerEffect_4(struct Task * task);

static void (*const sUseVsSeekerEffectFuncs[])(struct Task * task) = {
    UseVsSeekerEffect_1,
    UseVsSeekerEffect_2,
    UseVsSeekerEffect_3,
    UseVsSeekerEffect_4
};

u32 FldEff_UseVsSeeker(void)
{
    if (gQuestLogState == QL_STATE_RECORDING)
        QuestLogRecordPlayerAvatarGfxTransitionWithDuration(8, 89);
    CreateTask(Task_FldEffUseVsSeeker, 0xFF);
    return 0;
}

static void Task_FldEffUseVsSeeker(u8 taskId)
{
    sUseVsSeekerEffectFuncs[gTasks[taskId].data[0]](&gTasks[taskId]);
}

static void UseVsSeekerEffect_1(struct Task * task)
{
    ScriptContext2_Enable();
    FreezeObjectEvents();
    gPlayerAvatar.preventStep = TRUE;
    task->data[0]++;
}

static void UseVsSeekerEffect_2(struct Task * task)
{
    struct ObjectEvent * playerObj = &gObjectEvents[gPlayerAvatar.objectEventId];
    if (!ObjectEventIsMovementOverridden(playerObj) || ObjectEventClearHeldMovementIfFinished(playerObj))
    {
        StartPlayerAvatarVsSeekerAnim();
        ObjectEventSetHeldMovement(playerObj, MOVEMENT_ACTION_START_ANIM_IN_DIRECTION);
        task->data[0]++;
    }
}

static void UseVsSeekerEffect_3(struct Task * task)
{
    struct ObjectEvent * playerObj = &gObjectEvents[gPlayerAvatar.objectEventId];
    if (ObjectEventClearHeldMovementIfFinished(playerObj))
    {
        if (gPlayerAvatar.flags & (PLAYER_AVATAR_FLAG_ACRO_BIKE | PLAYER_AVATAR_FLAG_MACH_BIKE))
            ObjectEventSetGraphicsId(playerObj, GetPlayerAvatarGraphicsIdByStateId(PLAYER_AVATAR_GFX_BIKE));
        else if (gPlayerAvatar.flags & PLAYER_AVATAR_FLAG_SURFING)
            ObjectEventSetGraphicsId(playerObj, GetPlayerAvatarGraphicsIdByStateId(PLAYER_AVATAR_GFX_RIDE));
        else
            ObjectEventSetGraphicsId(playerObj, GetPlayerAvatarGraphicsIdByStateId(PLAYER_AVATAR_GFX_NORMAL));
        ObjectEventForceSetHeldMovement(playerObj, GetFaceDirectionMovementAction(playerObj->facingDirection));
        task->data[0]++;
    }
}

static void UseVsSeekerEffect_4(struct Task * task)
{
    struct ObjectEvent * playerObj = &gObjectEvents[gPlayerAvatar.objectEventId];
    if (ObjectEventClearHeldMovementIfFinished(playerObj))
    {
        gPlayerAvatar.preventStep = FALSE;
        FieldEffectActiveListRemove(FLDEFF_USE_VS_SEEKER);
        DestroyTask(FindTaskIdByFunc(Task_FldEffUseVsSeeker));
    }
}

static void SpriteCB_NPCFlyOut(struct Sprite * sprite);

u8 FldEff_NpcFlyOut(void)
{
    u8 spriteId = CreateSprite(gFieldEffectObjectTemplatePointers[FLDEFFOBJ_BIRD], 0x78, 0, 1);
    struct Sprite * sprite = &gSprites[spriteId];

    sprite->oam.paletteNum = 0;
    sprite->oam.priority = 1;
    sprite->callback = SpriteCB_NPCFlyOut;
    sprite->data[1] = gFieldEffectArguments[0];
    PlaySE(SE_M_FLY);
    return spriteId;
}

static void SpriteCB_NPCFlyOut(struct Sprite * sprite)
{
    struct Sprite * npcSprite;

    sprite->x2 = Cos(sprite->data[2], 0x8c);
    sprite->y2 = Sin(sprite->data[2], 0x48);
    sprite->data[2] = (sprite->data[2] + 4) & 0xff;
    if (sprite->data[0])
    {
        npcSprite = &gSprites[sprite->data[1]];
        npcSprite->coordOffsetEnabled = FALSE;
        npcSprite->x = sprite->x + sprite->x2;
        npcSprite->y = sprite->y + sprite->y2 - 8;
        npcSprite->x2 = 0;
        npcSprite->y2 = 0;
    }
    if (sprite->data[2] >= 0x80)
    {
        FieldEffectStop(sprite, FLDEFF_NPCFLY_OUT);
    }
}

static void Task_UseFly(u8 taskId);
static void UseFlyEffect_1(struct Task * task);
static void UseFlyEffect_2(struct Task * task);
static void UseFlyEffect_3(struct Task * task);
static void UseFlyEffect_4(struct Task * task);
static void UseFlyEffect_5(struct Task * task);
static void UseFlyEffect_6(struct Task * task);
static void UseFlyEffect_7(struct Task * task);
static void UseFlyEffect_8(struct Task * task);
static void UseFlyEffect_9(struct Task * task);
static u8 CreateFlyBirdSprite(void);
static bool8 GetFlyBirdAnimCompleted(u8 flyBlobSpriteId);
static void StartFlyBirdSwoopDown(u8 flyBlobSpriteId);
static void SetFlyBirdPlayerSpriteId(u8 flyBlobSpriteId, u8 playerSpriteId);
static void SpriteCB_FlyBirdLeaveBall(struct Sprite * sprite);
static void SpriteCB_FlyBirdSwoopDown(struct Sprite * sprite);
static void sub_80877FC(struct Sprite * sprite, u8 affineAnimId);
static void sub_8087828(struct Sprite * sprite);

static void (*const sUseFlyEffectFuncs[])(struct Task * ) = {
    UseFlyEffect_1,
    UseFlyEffect_2,
    UseFlyEffect_3,
    UseFlyEffect_4,
    UseFlyEffect_5,
    UseFlyEffect_6,
    UseFlyEffect_7,
    UseFlyEffect_8,
    UseFlyEffect_9
};

u8 FldEff_UseFly(void)
{
    u8 taskId = CreateTask(Task_UseFly, 0xfe);
    gTasks[taskId].data[1] = gFieldEffectArguments[0];
    return 0;
}

static void Task_UseFly(u8 taskId)
{
    sUseFlyEffectFuncs[gTasks[taskId].data[0]](&gTasks[taskId]);
}

static void UseFlyEffect_1(struct Task * task)
{
    struct ObjectEvent * objectEvent = &gObjectEvents[gPlayerAvatar.objectEventId];
    if (!ObjectEventIsMovementOverridden(objectEvent) || ObjectEventClearHeldMovementIfFinished(objectEvent))
    {
        task->data[15] = gPlayerAvatar.flags;
        gPlayerAvatar.preventStep = TRUE;
        SetPlayerAvatarStateMask(PLAYER_AVATAR_FLAG_ON_FOOT);
        StartPlayerAvatarSummonMonForFieldMoveAnim();
        ObjectEventSetHeldMovement(objectEvent, MOVEMENT_ACTION_START_ANIM_IN_DIRECTION);
        task->data[0]++;
    }
}

static void UseFlyEffect_2(struct Task * task)
{
    struct ObjectEvent * objectEvent = &gObjectEvents[gPlayerAvatar.objectEventId];
    if (ObjectEventClearHeldMovementIfFinished(objectEvent))
    {
        task->data[0]++;
        gFieldEffectArguments[0] = task->data[1];
        FieldEffectStart(FLDEFF_FIELD_MOVE_SHOW_MON_INIT);
    }
}

static void UseFlyEffect_3(struct Task * task)
{
    if (!FieldEffectActiveListContains(FLDEFF_FIELD_MOVE_SHOW_MON))
    {
        struct ObjectEvent * objectEvent = &gObjectEvents[gPlayerAvatar.objectEventId];
        if (task->data[15] & 0x08)
        {
            SetSurfBlob_BobState(objectEvent->fieldEffectSpriteId, 2);
            SetSurfBlob_DontSyncAnim(objectEvent->fieldEffectSpriteId, 0);
        }
        task->data[1] = CreateFlyBirdSprite();
        task->data[0]++;
    }
}

static void UseFlyEffect_4(struct Task * task)
{
    if (GetFlyBirdAnimCompleted(task->data[1]))
    {
        task->data[0]++;
        task->data[2] = 16;
        SetPlayerAvatarTransitionFlags(PLAYER_AVATAR_FLAG_ON_FOOT);
        ObjectEventSetHeldMovement(&gObjectEvents[gPlayerAvatar.objectEventId], MOVEMENT_ACTION_FACE_LEFT);
    }
}

static void UseFlyEffect_5(struct Task * task)
{
    struct ObjectEvent * objectEvent = &gObjectEvents[gPlayerAvatar.objectEventId];
    if ((task->data[2] == 0 || (--task->data[2]) == 0) && ObjectEventClearHeldMovementIfFinished(objectEvent))
    {
        task->data[0]++;
        PlaySE(SE_M_FLY);
        StartFlyBirdSwoopDown(task->data[1]);
    }
}

static void UseFlyEffect_6(struct Task * task)
{
    if ((++task->data[2]) >= 8)
    {
        struct ObjectEvent * objectEvent = &gObjectEvents[gPlayerAvatar.objectEventId];
        ObjectEventSetGraphicsId(objectEvent, GetPlayerAvatarGraphicsIdByStateId(PLAYER_AVATAR_GFX_RIDE));
        StartSpriteAnim(&gSprites[objectEvent->spriteId], ANIM_GET_ON_OFF_POKEMON_WEST);
        objectEvent->inanimate = TRUE;
        ObjectEventSetHeldMovement(objectEvent, MOVEMENT_ACTION_JUMP_IN_PLACE_LEFT);
        task->data[0]++;
        task->data[2] = 0;
    }
}

static void UseFlyEffect_7(struct Task * task)
{
    if ((++task->data[2]) >= 10)
    {
        struct ObjectEvent * objectEvent = &gObjectEvents[gPlayerAvatar.objectEventId];
        ObjectEventClearHeldMovementIfActive(objectEvent);
        objectEvent->inanimate = FALSE;
        objectEvent->hasShadow = FALSE;
        SetFlyBirdPlayerSpriteId(task->data[1], objectEvent->spriteId);
        StartSpriteAnim(&gSprites[task->data[1]], gSaveBlock2Ptr->playerGender * 2 + 1);
        sub_80877FC(&gSprites[task->data[1]], 0);
        gSprites[task->data[1]].callback = sub_8087828;
        CameraObjectReset2();
        task->data[0]++;
    }
}

static void UseFlyEffect_8(struct Task * task)
{
    if (GetFlyBirdAnimCompleted(task->data[1]))
    {
        WarpFadeOutScreen();
        task->data[0]++;
    }
}

static void UseFlyEffect_9(struct Task * task)
{
    if (!gPaletteFade.active)
    {
        FieldEffectActiveListRemove(FLDEFF_USE_FLY);
        DestroyTask(FindTaskIdByFunc(Task_UseFly));
    }
}

static u8 CreateFlyBirdSprite(void)
{
    u8 spriteId;
    struct Sprite * sprite;
    spriteId = CreateSprite(gFieldEffectObjectTemplatePointers[FLDEFFOBJ_BIRD], 0xff, 0xb4, 0x1);
    sprite = &gSprites[spriteId];
    sprite->oam.paletteNum = 0;
    sprite->oam.priority = 1;
    sprite->callback = SpriteCB_FlyBirdLeaveBall;
    return spriteId;
}

static u8 GetFlyBirdAnimCompleted(u8 spriteId)
{
    return gSprites[spriteId].data[7];
}

static void StartFlyBirdSwoopDown(u8 spriteId)
{
    struct Sprite * sprite;
    sprite = &gSprites[spriteId];
    sprite->callback = SpriteCB_FlyBirdSwoopDown;
    sprite->x = 0x78;
    sprite->y = 0x00;
    sprite->x2 = 0;
    sprite->y2 = 0;
    memset(&sprite->data[0], 0, 8 * sizeof(u16) /* zero all data cells */);
    sprite->data[6] = 0x40;
}

static void SetFlyBirdPlayerSpriteId(u8 flyBlobSpriteId, u8 playerSpriteId)
{
    gSprites[flyBlobSpriteId].data[6] = playerSpriteId;
}

static const union AffineAnimCmd sUnknown_83CC19C[] = {
    AFFINEANIMCMD_FRAME( 8,  8, 226,  0),
    AFFINEANIMCMD_FRAME(28, 28,   0, 30),
    AFFINEANIMCMD_END
};

static const union AffineAnimCmd sUnknown_83CC1B4[] = {
    AFFINEANIMCMD_FRAME(256, 256, 64,  0),
    AFFINEANIMCMD_FRAME(-10, -10,  0, 22),
    AFFINEANIMCMD_END
};

static const union AffineAnimCmd *const sUnknown_83CC1CC[] = {
    sUnknown_83CC19C,
    sUnknown_83CC1B4
};

static void SpriteCB_FlyBirdLeaveBall(struct Sprite * sprite)
{
    if (sprite->data[7] == 0)
    {
        if (sprite->data[0] == 0)
        {
            sprite->oam.affineMode = ST_OAM_AFFINE_DOUBLE;
            sprite->affineAnims = sUnknown_83CC1CC;
            InitSpriteAffineAnim(sprite);
            StartSpriteAffineAnim(sprite, 0);
            if (gSaveBlock2Ptr->playerGender == MALE)
                sprite->x = 0x80;
            else
                sprite->x = 0x76;
            sprite->y = -0x30;
            sprite->data[0]++;
            sprite->data[1] = 0x40;
            sprite->data[2] = 0x100;
        }
        sprite->data[1] += (sprite->data[2] >> 8);
        sprite->x2 = Cos(sprite->data[1], 0x78);
        sprite->y2 = Sin(sprite->data[1], 0x78);
        if (sprite->data[2] < 0x800)
        {
            sprite->data[2] += 0x60;
        }
        if (sprite->data[1] > 0x81)
        {
            sprite->data[7]++;
            sprite->oam.affineMode = ST_OAM_AFFINE_OFF;
            FreeOamMatrix(sprite->oam.matrixNum);
            CalcCenterToCornerVec(sprite, sprite->oam.shape, sprite->oam.size, ST_OAM_AFFINE_OFF);
        }
    }
}

static void SpriteCB_FlyBirdSwoopDown(struct Sprite * sprite)
{
    sprite->x2 = Cos(sprite->data[2], 0x8c);
    sprite->y2 = Sin(sprite->data[2], 0x48);
    sprite->data[2] = (sprite->data[2] + 4) & 0xff;
    if (sprite->data[6] != MAX_SPRITES)
    {
        struct Sprite * sprite1 = &gSprites[sprite->data[6]];
        sprite1->coordOffsetEnabled = FALSE;
        sprite1->x = sprite->x + sprite->x2;
        sprite1->y = sprite->y + sprite->y2 - 8;
        sprite1->x2 = 0;
        sprite1->y2 = 0;
    }
    if (sprite->data[2] >= 0x80)
    {
        sprite->data[7] = 1;
    }
}

static void SpriteCB_FlyBirdReturnToBall(struct Sprite * sprite)
{
    if (sprite->data[7] == 0)
    {
        if (sprite->data[0] == 0)
        {
            sprite->oam.affineMode = ST_OAM_AFFINE_DOUBLE;
            sprite->affineAnims = sUnknown_83CC1CC;
            InitSpriteAffineAnim(sprite);
            StartSpriteAffineAnim(sprite, 1);
            if (gSaveBlock2Ptr->playerGender == MALE)
                sprite->x = 0x70;
            else
                sprite->x = 0x64;
            sprite->y = -0x20;
            sprite->data[0]++;
            sprite->data[1] = 0xf0;
            sprite->data[2] = 0x800;
            sprite->data[4] = 0x80;
        }
        sprite->data[1] += sprite->data[2] >> 8;
        sprite->data[3] += sprite->data[2] >> 8;
        sprite->data[1] &= 0xff;
        sprite->x2 = Cos(sprite->data[1], 0x20);
        sprite->y2 = Sin(sprite->data[1], 0x78);
        if (sprite->data[2] > 0x100)
        {
            sprite->data[2] -= sprite->data[4];
        }
        if (sprite->data[4] < 0x100)
        {
            sprite->data[4] += 24;
        }
        if (sprite->data[2] < 0x100)
        {
            sprite->data[2] = 0x100;
        }
        if (sprite->data[3] >= 60)
        {
            sprite->data[7]++;
            sprite->oam.affineMode = ST_OAM_AFFINE_OFF;
            FreeOamMatrix(sprite->oam.matrixNum);
            sprite->invisible = TRUE;
        }
    }
}

static void StartFlyBirdReturnToBall(u8 spriteId)
{
    StartFlyBirdSwoopDown(spriteId);
    gSprites[spriteId].callback = SpriteCB_FlyBirdReturnToBall;
}

static void Task_FldEffFlyIn(u8 taskId);
static void FlyInEffect_1(struct Task * task);
static void FlyInEffect_2(struct Task * task);
static void FlyInEffect_3(struct Task * task);
static void FlyInEffect_4(struct Task * task);
static void FlyInEffect_5(struct Task * task);
static void FlyInEffect_6(struct Task * task);
static void FlyInEffect_7(struct Task * task);
static void sub_80878C0(struct Sprite * sprite);

static void (*const sFlyInEffectFuncs[])(struct Task * task) = {
    FlyInEffect_1,
    FlyInEffect_2,
    FlyInEffect_3,
    FlyInEffect_4,
    FlyInEffect_5,
    FlyInEffect_6,
    FlyInEffect_7
};

u32 FldEff_FlyIn(void)
{
    CreateTask(Task_FldEffFlyIn, 0xfe);
    return 0;
}

static void Task_FldEffFlyIn(u8 taskId)
{
    sFlyInEffectFuncs[gTasks[taskId].data[0]](&gTasks[taskId]);
}

static void FlyInEffect_1(struct Task * task)
{
    struct ObjectEvent * objectEvent;
    objectEvent = &gObjectEvents[gPlayerAvatar.objectEventId];
    if (!ObjectEventIsMovementOverridden(objectEvent) || ObjectEventClearHeldMovementIfFinished(objectEvent))
    {
        task->data[0]++;
        task->data[2] = 33;
        task->data[15] = gPlayerAvatar.flags;
        gPlayerAvatar.preventStep = TRUE;
        SetPlayerAvatarStateMask(PLAYER_AVATAR_FLAG_ON_FOOT);
        if (task->data[15] & PLAYER_AVATAR_FLAG_SURFING)
        {
            SetSurfBlob_BobState(objectEvent->fieldEffectSpriteId, 0);
        }
        ObjectEventSetGraphicsId(objectEvent, GetPlayerAvatarGraphicsIdByStateId(PLAYER_AVATAR_GFX_RIDE));
        CameraObjectReset2();
        ObjectEventTurn(objectEvent, DIR_WEST);
        StartSpriteAnim(&gSprites[objectEvent->spriteId], ANIM_GET_ON_OFF_POKEMON_WEST);
        objectEvent->invisible = FALSE;
        task->data[1] = CreateFlyBirdSprite();
        StartFlyBirdSwoopDown(task->data[1]);
        SetFlyBirdPlayerSpriteId(task->data[1], objectEvent->spriteId);
        StartSpriteAnim(&gSprites[task->data[1]], gSaveBlock2Ptr->playerGender * 2 + 2);
        sub_80877FC(&gSprites[task->data[1]], 1);
        gSprites[task->data[1]].callback = sub_8087828;
    }
}

static void FlyInEffect_2(struct Task * task)
{
    struct ObjectEvent * objectEvent;
    struct Sprite * sprite;
    sub_80878C0(&gSprites[task->data[1]]);
    if (task->data[2] == 0 || (--task->data[2]) == 0)
    {
        objectEvent = &gObjectEvents[gPlayerAvatar.objectEventId];
        sprite = &gSprites[objectEvent->spriteId];
        SetFlyBirdPlayerSpriteId(task->data[1], 0x40);
        sprite->x += sprite->x2;
        sprite->y += sprite->y2;
        sprite->x2 = 0;
        sprite->y2 = 0;
        task->data[0]++;
        task->data[2] = 0;
    }
}

static void FlyInEffect_3(struct Task * task)
{
    s16 gUnknown_83CC1F0[18] = {
        -2,
        -4,
        -5,
        -6,
        -7,
        -8,
        -8,
        -8,
        -7,
        -7,
        -6,
        -5,
        -3,
        -2,
        0,
        2,
        4,
        8
    };
    struct Sprite * sprite = &gSprites[gPlayerAvatar.spriteId];
    sprite->y2 = gUnknown_83CC1F0[task->data[2]];
    if ((++task->data[2]) >= 18)
    {
        task->data[0]++;
    }
}

static void FlyInEffect_4(struct Task * task)
{
    struct ObjectEvent * objectEvent;
    struct Sprite * sprite;
    if (GetFlyBirdAnimCompleted(task->data[1]))
    {
        objectEvent = &gObjectEvents[gPlayerAvatar.objectEventId];
        sprite = &gSprites[objectEvent->spriteId];
        objectEvent->inanimate = FALSE;
        MoveObjectEventToMapCoords(objectEvent, objectEvent->currentCoords.x, objectEvent->currentCoords.y);
        sprite->x2 = 0;
        sprite->y2 = 0;
        sprite->coordOffsetEnabled = TRUE;
        StartPlayerAvatarSummonMonForFieldMoveAnim();
        ObjectEventSetHeldMovement(objectEvent, MOVEMENT_ACTION_START_ANIM_IN_DIRECTION);
        task->data[0]++;
    }
}

static void FlyInEffect_5(struct Task * task)
{
    if (ObjectEventClearHeldMovementIfFinished(&gObjectEvents[gPlayerAvatar.objectEventId]))
    {
        task->data[0]++;
        StartFlyBirdReturnToBall(task->data[1]);
    }
}

static void FlyInEffect_6(struct Task * task)
{
    if (GetFlyBirdAnimCompleted(task->data[1]))
    {
        DestroySprite(&gSprites[task->data[1]]);
        task->data[0]++;
        task->data[1] = 0x10;
    }
}

static void FlyInEffect_7(struct Task * task)
{
    u8 state;
    struct ObjectEvent * objectEvent;
    if ((--task->data[1]) == 0)
    {
        objectEvent = &gObjectEvents[gPlayerAvatar.objectEventId];
        state = PLAYER_AVATAR_GFX_NORMAL;
        if (task->data[15] & PLAYER_AVATAR_FLAG_SURFING)
        {
            state = PLAYER_AVATAR_GFX_RIDE;
            SetSurfBlob_BobState(objectEvent->fieldEffectSpriteId, 1);
        }
        ObjectEventSetGraphicsId(objectEvent, GetPlayerAvatarGraphicsIdByStateId(state));
        ObjectEventTurn(objectEvent, DIR_SOUTH);
        gPlayerAvatar.flags = task->data[15];
        gPlayerAvatar.preventStep = FALSE;
        FieldEffectActiveListRemove(FLDEFF_FLY_IN);
        DestroyTask(FindTaskIdByFunc(Task_FldEffFlyIn));
    }
}

static const union AffineAnimCmd sUnknown_83CC214[] = {
    AFFINEANIMCMD_FRAME(24, 24, 0, 1),
    AFFINEANIMCMD_JUMP(0)
};

static const union AffineAnimCmd sUnknown_83CC224[] = {
    AFFINEANIMCMD_FRAME(512, 512, 0, 1),
    AFFINEANIMCMD_FRAME(-16, -16, 0, 1),
    AFFINEANIMCMD_JUMP(1)
};

static const union AffineAnimCmd *const sUnknown_83CC23C[] = {
    sUnknown_83CC214,
    sUnknown_83CC224
};

static void sub_80877FC(struct Sprite * sprite, u8 affineAnimId)
{
    sprite->oam.affineMode = ST_OAM_AFFINE_DOUBLE;
    sprite->affineAnims = sUnknown_83CC23C;
    InitSpriteAffineAnim(sprite);
    StartSpriteAffineAnim(sprite, affineAnimId);
}

static void sub_8087828(struct Sprite * sprite)
{
    struct Sprite * sprite2;
    sprite->x2 = Cos(sprite->data[2], 0xB4);
    sprite->y2 = Sin(sprite->data[2], 0x48);
    sprite->data[2] += 2;
    sprite->data[2] &= 0xFF;
    if (sprite->data[6] != MAX_SPRITES)
    {
        sprite2 = &gSprites[sprite->data[6]];
        sprite2->coordOffsetEnabled = FALSE;
        sprite2->x = sprite->x + sprite->x2;
        sprite2->y = sprite->y + sprite->y2 - 8;
        sprite2->x2 = 0;
        sprite2->y2 = 0;
    }
    if (sprite->data[2] >= 0x80)
    {
        sprite->data[7] = 1;
        sprite->oam.affineMode = ST_OAM_AFFINE_OFF;
        FreeOamMatrix(sprite->oam.matrixNum);
        CalcCenterToCornerVec(sprite, sprite->oam.shape, sprite->oam.size, ST_OAM_AFFINE_OFF);
    }
}

static void sub_80878C0(struct Sprite * sprite)
{
    if (sprite->oam.affineMode != ST_OAM_AFFINE_OFF)
    {
        if (gOamMatrices[sprite->oam.matrixNum].a == 0x100 || gOamMatrices[sprite->oam.matrixNum].d == 0x100)
        {
            sprite->oam.affineMode = ST_OAM_AFFINE_OFF;
            FreeOamMatrix(sprite->oam.matrixNum);
            CalcCenterToCornerVec(sprite, sprite->oam.shape, sprite->oam.size, ST_OAM_AFFINE_OFF);
            StartSpriteAnim(sprite, 0);
            sprite->callback = SpriteCB_FlyBirdSwoopDown;
        }
    }
}

static void Task_MoveDeoxysRock_Step(u8 taskId);

u32 FldEff_MoveDeoxysRock(void)
{
    u8 taskId;
    u8 objectEventIdBuffer;
    s32 x;
    s32 y;
    struct ObjectEvent * objectEvent;
    if (!TryGetObjectEventIdByLocalIdAndMap(gFieldEffectArguments[0], gFieldEffectArguments[1], gFieldEffectArguments[2], &objectEventIdBuffer))
    {
        objectEvent = &gObjectEvents[objectEventIdBuffer];
        x = objectEvent->currentCoords.x - 7;
        y = objectEvent->currentCoords.y - 7;
        x = (gFieldEffectArguments[3] - x) * 16;
        y = (gFieldEffectArguments[4] - y) * 16;
        ShiftObjectEventCoords(objectEvent, gFieldEffectArguments[3] + 7, gFieldEffectArguments[4] + 7);
        taskId = CreateTask(Task_MoveDeoxysRock_Step, 0x50);
        gTasks[taskId].data[1] = objectEvent->spriteId;
        gTasks[taskId].data[2] = gSprites[objectEvent->spriteId].x + x;
        gTasks[taskId].data[3] = gSprites[objectEvent->spriteId].y + y;
        gTasks[taskId].data[8] = gFieldEffectArguments[5];
        gTasks[taskId].data[9] = objectEventIdBuffer;
    }
    return FALSE;
}

static void Task_MoveDeoxysRock_Step(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    struct Sprite * sprite = &gSprites[data[1]];
    struct ObjectEvent * objectEvent;
    switch (data[0])
    {
    case 0:
        data[4] = sprite->x << 4;
        data[5] = sprite->y << 4;

        // UB: Possible divide by zero
        data[6] = SAFE_DIV(((data[2] << 4) - data[4]), data[8]);
        data[7] = SAFE_DIV(((data[3] << 4) - data[5]), data[8]);
        data[0]++;
        // fallthrough
    case 1:
        if (data[8] != 0)
        {
            data[8]--;
            data[4] += data[6];
            data[5] += data[7];
            sprite->x = data[4] >> 4;
            sprite->y = data[5] >> 4;
        }
        else
        {
            objectEvent = &gObjectEvents[data[9]];
            sprite->x = data[2];
            sprite->y = data[3];
            ShiftStillObjectEventCoords(objectEvent);
            objectEvent->triggerGroundEffectsOnStop = TRUE;
            FieldEffectActiveListRemove(FLDEFF_MOVE_DEOXYS_ROCK);
            DestroyTask(taskId);
        }
        break;
    }
}

static void Task_DestroyDeoxysRock(u8 taskId);
static void DestroyDeoxysRockEffect_CameraShake(s16 *data, u8 taskId);
static void DestroyDeoxysRockEffect_RockFragments(s16 *data, u8 taskId);
static void Unk44Effect_2(s16 *data, u8 taskId);
static void CreateDeoxysRockFragments(struct Sprite * sprite);
static void SpriteCB_FldEffUnk44(struct Sprite * sprite);

static void (*const sUnk44EffectFuncs[])(s16 *data, u8 taskId) = {
    DestroyDeoxysRockEffect_CameraShake,
    DestroyDeoxysRockEffect_RockFragments,
    Unk44Effect_2
};

static const struct SpriteFrameImage sImages_FldEffUnk44[] = {
    {sFldEffUnk44_Tiles + 0x00, 0x20},
    {sFldEffUnk44_Tiles + 0x10, 0x20},
    {sFldEffUnk44_Tiles + 0x20, 0x20},
    {sFldEffUnk44_Tiles + 0x30, 0x20}
};

static const union AnimCmd sAnimCmd_FldEffUnk44_0[] = {
    ANIMCMD_FRAME(0, 0),
    ANIMCMD_END
};

static const union AnimCmd sAnimCmd_FldEffUnk44_1[] = {
    ANIMCMD_FRAME(1, 0),
    ANIMCMD_END
};

static const union AnimCmd sAnimCmd_FldEffUnk44_2[] = {
    ANIMCMD_FRAME(2, 0),
    ANIMCMD_END
};

static const union AnimCmd sAnimCmd_FldEffUnk44_3[] = {
    ANIMCMD_FRAME(3, 0),
    ANIMCMD_END
};

static const union AnimCmd *const sAnimCmdTable_FldEffUnk44[] = {
    sAnimCmd_FldEffUnk44_0,
    sAnimCmd_FldEffUnk44_1,
    sAnimCmd_FldEffUnk44_2,
    sAnimCmd_FldEffUnk44_3
};

static const struct SpriteTemplate sUnknown_83CC2A0 = {
    .tileTag = SPRITE_INVALID_TAG,
    .paletteTag = 4371,
    .oam = &sOamData_8x8,
    .anims = sAnimCmdTable_FldEffUnk44,
    .images = sImages_FldEffUnk44,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCB_FldEffUnk44
};

u32 FldEff_Unk44(void)
{
    u8 taskId;
    u8 objectEventIdBuffer;
    if (!TryGetObjectEventIdByLocalIdAndMap(gFieldEffectArguments[0], gFieldEffectArguments[1], gFieldEffectArguments[2], &objectEventIdBuffer))
    {
        taskId = CreateTask(Task_DestroyDeoxysRock, 0x50);
        gTasks[taskId].data[2] = objectEventIdBuffer;
        gTasks[taskId].data[6] = gFieldEffectArguments[0];
        gTasks[taskId].data[7] = gFieldEffectArguments[1];
        gTasks[taskId].data[8] = gFieldEffectArguments[2];
    }
    else
    {
        FieldEffectActiveListRemove(FLDEFF_DESTROY_DEOXYS_ROCK);
    }
    return FALSE;
}

static void Task_DeoxysRockCameraShake(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    if (data[7] != 0)
    {
        if (++data[6] > 20)
        {
            data[6] = 0;
            if (data[5] != 0)
                data[5]--;
        }
    }
    else
    {
        data[5] = 4;
    }

    if (++data[0] > 1)
    {
        data[0] = 0;
        if (++data[1] & 1)
        {
            SetCameraPanning(0, -data[5]);
        }
        else
        {
            SetCameraPanning(0, data[5]);
        }
    }
    UpdateCameraPanning();
    if (data[5] == 0)
        DestroyTask(taskId);
}

static void StartEndingDeoxysRockCameraShake(u8 taskId)
{
    gTasks[taskId].data[7] = 1;
}

static void Task_DestroyDeoxysRock(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    InstallCameraPanAheadCallback();
    SetCameraPanningCallback(NULL);
    sUnk44EffectFuncs[data[1]](data, taskId);
}

static void DestroyDeoxysRockEffect_CameraShake(s16 *data, u8 taskId)
{
    u8 newTaskId = CreateTask(Task_DeoxysRockCameraShake, 90);
    PlaySE(SE_THUNDER2);
    data[5] = newTaskId;
    data[1]++;
}

static void DestroyDeoxysRockEffect_RockFragments(s16 *data, u8 taskId)
{
    if (++data[3] > 0x78)
    {
        struct Sprite * sprite = &gSprites[gObjectEvents[data[2]].spriteId];
        gObjectEvents[data[2]].invisible = TRUE;
        BlendPalettes(0x0000FFFF, 0x10, RGB_WHITE);
        BeginNormalPaletteFade(0x0000FFFF, 0, 0x10, 0, RGB_WHITE);
        CreateDeoxysRockFragments(sprite);
        PlaySE(SE_THUNDER);
        StartEndingDeoxysRockCameraShake(data[5]);
        data[3] = 0;
        data[1]++;
    }
}

static void Unk44Effect_2(s16 *data, u8 taskId)
{
    if (!gPaletteFade.active && !FuncIsActiveTask(Task_DeoxysRockCameraShake))
    {
        InstallCameraPanAheadCallback();
        RemoveObjectEventByLocalIdAndMap(data[6], data[7], data[8]);
        FieldEffectActiveListRemove(FLDEFF_DESTROY_DEOXYS_ROCK);
        DestroyTask(taskId);
    }
}

static void CreateDeoxysRockFragments(struct Sprite* sprite)
{
    int i;
    int xPos = (s16)gTotalCameraPixelOffsetX + sprite->x + sprite->x2;
    int yPos = (s16)gTotalCameraPixelOffsetY + sprite->y + sprite->y2 - 4;

    for (i = 0; i < 4; i++)
    {
        u8 spriteId = CreateSprite(&sUnknown_83CC2A0, xPos, yPos, 0);
        if (spriteId != MAX_SPRITES)
        {
            StartSpriteAnim(&gSprites[spriteId], i);
            gSprites[spriteId].data[0] = i;
            gSprites[spriteId].oam.paletteNum = sprite->oam.paletteNum;
        }
    }
}

static void SpriteCB_FldEffUnk44(struct Sprite* sprite)
{
    switch (sprite->data[0])
    {
    case 0:
        sprite->x -= 16;
        sprite->y -= 12;
        break;
    case 1:
        sprite->x += 16;
        sprite->y -= 12;
        break;
    case 2:
        sprite->x -= 16;
        sprite->y += 12;
        break;
    case 3:
        sprite->x += 16;
        sprite->y += 12;
        break;
    }
    if (sprite->x < -4 || sprite->x > 0xF4 || sprite->y < -4 || sprite->y > 0xA4)
        DestroySprite(sprite);
}

static void Task_FldEffUnk45(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        FieldEffectActiveListRemove(FLDEFF_UNK_45);
        DestroyTask(taskId);
    }
}

// Bug: Return value should be u32, not void
void FldEff_Unk45(void)
{
    BlendPalettes(0xFFFFFFFF, 0x10, RGB_WHITE);
    BeginNormalPaletteFade(0xFFFFFFFF, -1, 0x0F, 0x00, RGB_WHITE);
    CreateTask(Task_FldEffUnk45, 90);
}
