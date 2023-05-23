#include "global.h"
#include "gflib.h"
#include "decompress.h"
#include "task.h"
#include "wild_pokemon_area.h"
#include "pokedex_area_markers.h"
#include "pokedex.h"

/*
    Controls the red ellipse markers that appear on the pokedex maps to show where a species is found.
    All of the markers together are a single sprite, with each individual marker being represented by
    a subsprite of the necessary size and shape.

    The data about each area marker is in sAreaMarkers, each specified by a DEX_AREA constant.
    A MAPSEC is associated with a DEX_AREA constant by a series of arrays in wild_pokemon_area.c
*/

struct PAM_TaskData
{
    struct SubspriteTable subsprites;
    void *buffer;
    u8 unused;
    u8 spriteId;
    u16 tilesTag;
    u16 paletteTag; // Never read
};

enum {
    MARKER_CIRCULAR,
    MARKER_SMALL_H,
    MARKER_SMALL_V,
    MARKER_MED_H,
    MARKER_MED_V,
    MARKER_LARGE_H,
    MARKER_LARGE_V,
};

static const u16 sMarkerPal[] = INCBIN_U16("graphics/pokedex/area_markers/marker.gbapal");
static const u32 sMarkerTiles[] = INCBIN_U32("graphics/pokedex/area_markers/marker.4bpp.lz");

static const struct Subsprite sSubsprite_Circular = {
    .size = SPRITE_SIZE(8x8),
    .shape = SPRITE_SHAPE(8x8),
    .priority = 1,
    .tileOffset = 0
};

static const struct Subsprite sSubsprite_SmallHorizontal = {
    .size = SPRITE_SIZE(16x8),
    .shape = SPRITE_SHAPE(16x8),
    .priority = 1,
    .tileOffset = 1
};

static const struct Subsprite sSubsprite_SmallVertical = {
    .size = SPRITE_SIZE(8x16),
    .shape = SPRITE_SHAPE(8x16),
    .priority = 1,
    .tileOffset = 3
};

static const struct Subsprite sSubsprite_MediumHorizontal = {
    .size = SPRITE_SIZE(32x16),
    .shape = SPRITE_SHAPE(32x16),
    .priority = 1,
    .tileOffset = 5
};

static const struct Subsprite sSubsprite_MediumVertical = {
    .size = SPRITE_SIZE(16x32),
    .shape = SPRITE_SHAPE(16x32),
    .priority = 1,
    .tileOffset = 13
};

static const struct Subsprite sSubsprite_LargeHorizontal = {
    .size = SPRITE_SIZE(32x16),
    .shape = SPRITE_SHAPE(32x16),
    .priority = 1,
    .tileOffset = 21
};

static const struct Subsprite sSubsprite_LargeVertical = {
    .size = SPRITE_SIZE(16x32),
    .shape = SPRITE_SHAPE(16x32),
    .priority = 1,
    .tileOffset = 29
};


static const struct Subsprite *const sSubsprites[] = {
    [MARKER_CIRCULAR] = &sSubsprite_Circular,
    [MARKER_SMALL_H]  = &sSubsprite_SmallHorizontal,
    [MARKER_SMALL_V]  = &sSubsprite_SmallVertical,
    [MARKER_MED_H]    = &sSubsprite_MediumHorizontal,
    [MARKER_MED_V]    = &sSubsprite_MediumVertical,
    [MARKER_LARGE_H]  = &sSubsprite_LargeHorizontal,
    [MARKER_LARGE_V]  = &sSubsprite_LargeVertical
};

static const s8 sAreaMarkers[][4] = {
                                  // Marker,          x,    y
    [DEX_AREA_NONE]             = {},
    [DEX_AREA_PALLET_TOWN]      = { MARKER_CIRCULAR,  54,  44 },
    [DEX_AREA_VIRIDIAN_CITY]    = { MARKER_CIRCULAR,  54,  28 },
    [DEX_AREA_PEWTER_CITY]      = { MARKER_CIRCULAR,  54,  12 },
    [DEX_AREA_CERULEAN_CITY]    = { MARKER_CIRCULAR,  92,  12 },
    [DEX_AREA_LAVENDER_TOWN]    = { MARKER_CIRCULAR, 110,  24 },
    [DEX_AREA_VERMILION_CITY]   = { MARKER_CIRCULAR,  92,  36 },
    [DEX_AREA_CELADON_CITY]     = { MARKER_CIRCULAR,  76,  24 },
    [DEX_AREA_FUCHSIA_CITY]     = { MARKER_CIRCULAR,  78,  52 },
    [DEX_AREA_CINNABAR_ISLAND]  = { MARKER_CIRCULAR,  54,  62 },
    [DEX_AREA_INDIGO_PLATEAU]   = { MARKER_CIRCULAR,  42,   2 },
    [DEX_AREA_SAFFRON_CITY]     = { MARKER_CIRCULAR,  92,  24 },
    [DEX_AREA_ROUTE_1]          = { MARKER_SMALL_V,   54,  32 },
    [DEX_AREA_ROUTE_2]          = { MARKER_SMALL_V,   54,  16 },
    [DEX_AREA_ROUTE_3]          = { MARKER_SMALL_H,   61,  12 },
    [DEX_AREA_ROUTE_4]          = { MARKER_SMALL_H,   77,  12 },
    [DEX_AREA_ROUTE_5]          = { MARKER_CIRCULAR,  92,  18 },
    [DEX_AREA_ROUTE_6]          = { MARKER_CIRCULAR,  92,  30 },
    [DEX_AREA_ROUTE_7]          = { MARKER_CIRCULAR,  84,  24 },
    [DEX_AREA_ROUTE_8]          = { MARKER_SMALL_H,   98,  24 },
    [DEX_AREA_ROUTE_9]          = { MARKER_SMALL_H,   98,  12 },
    [DEX_AREA_ROUTE_10]         = { MARKER_SMALL_V,  110,  12 },
    [DEX_AREA_ROUTE_11]         = { MARKER_SMALL_H,   98,  36 },
    [DEX_AREA_ROUTE_12]         = { MARKER_MED_V,    106,  25 },
    [DEX_AREA_ROUTE_13]         = { MARKER_SMALL_H,  100,  46 },
    [DEX_AREA_ROUTE_14]         = { MARKER_SMALL_V,   94,  45 },
    [DEX_AREA_ROUTE_15]         = { MARKER_SMALL_H,   85,  52 },
    [DEX_AREA_ROUTE_16]         = { MARKER_CIRCULAR,  68,  24 },
    [DEX_AREA_ROUTE_17]         = { MARKER_MED_V,     62,  26 },
    [DEX_AREA_ROUTE_18]         = { MARKER_SMALL_H,   64,  52 },
    [DEX_AREA_ROUTE_19]         = { MARKER_CIRCULAR,  78,  60 },
    [DEX_AREA_ROUTE_20]         = { MARKER_MED_H,     55,  58 },
    [DEX_AREA_ROUTE_21]         = { MARKER_SMALL_V,   54,  50 },
    [DEX_AREA_ROUTE_22]         = { MARKER_SMALL_H,   40,  28 },
    [DEX_AREA_ROUTE_23]         = { MARKER_MED_V,     38,   4 },
    [DEX_AREA_ROUTE_24]         = { MARKER_CIRCULAR,  92,   4 },
    [DEX_AREA_ROUTE_25]         = { MARKER_MED_H,     90,  -2 },
    [DEX_AREA_VIRIDIAN_FOREST]  = { MARKER_CIRCULAR,  51,  20 },
    [DEX_AREA_DIGLETTS_CAVE]    = { MARKER_SMALL_H,   61,  18 },
    [DEX_AREA_MT_MOON]          = { MARKER_CIRCULAR,  72,   8 },
    [DEX_AREA_CERULEAN_CAVE]    = { MARKER_CIRCULAR,  87,   8 },
    [DEX_AREA_ROCK_TUNNEL]      = { MARKER_CIRCULAR, 112,  14 },
    [DEX_AREA_POWER_PLANT]      = { MARKER_CIRCULAR, 113,  20 },
    [DEX_AREA_POKEMON_TOWER]    = { MARKER_CIRCULAR, 113,  25 },
    [DEX_AREA_SAFARI_ZONE]      = { MARKER_SMALL_H,   78,  44 },
    [DEX_AREA_SEAFOAM_ISLANDS]  = { MARKER_CIRCULAR,  65,  60 },
    [DEX_AREA_POKEMON_MANSION]  = { MARKER_CIRCULAR,  52,  62 },
    [DEX_AREA_VICTORY_ROAD]     = { MARKER_CIRCULAR,  45,   7 },
    [DEX_AREA_ONE_ISLAND]       = { MARKER_CIRCULAR,  10,  10 },
    [DEX_AREA_TWO_ISLAND]       = { MARKER_CIRCULAR,  12,  35 },
    [DEX_AREA_THREE_ISLAND]     = { MARKER_CIRCULAR,  14,  52 },
    [DEX_AREA_FOUR_ISLAND]      = { MARKER_CIRCULAR,  12,  84 },
    [DEX_AREA_FIVE_ISLAND]      = { MARKER_CIRCULAR,  45,  81 },
    [DEX_AREA_SIX_ISLAND]       = { MARKER_CIRCULAR,  76,  84 },
    [DEX_AREA_SEVEN_ISLAND]     = { MARKER_CIRCULAR, 104,  82 },
    [DEX_AREA_KINDLE_ROAD]      = { MARKER_SMALL_V,   14,   2 },
    [DEX_AREA_TREASURE_BEACH]   = { MARKER_CIRCULAR,  10,  15 },
    [DEX_AREA_CAPE_BRINK]       = { MARKER_CIRCULAR,  12,  29 },
    [DEX_AREA_BOND_BRIDGE]      = { MARKER_SMALL_H,    2,  52 },
    [DEX_AREA_THREE_ISLE_PATH]  = { MARKER_SMALL_H,   12,  56 },
    [DEX_AREA_RESORT_GORGEOUS]  = { MARKER_SMALL_H,   44,  74 },
    [DEX_AREA_WATER_LABYRINTH]  = { MARKER_SMALL_H,   36,  78 },
    [DEX_AREA_FIVE_ISLE_MEADOW] = { MARKER_SMALL_V,   48,  80 },
    [DEX_AREA_MEMORIAL_PILLAR]  = { MARKER_SMALL_V,   52,  86 },
    [DEX_AREA_OUTCAST_ISLAND]   = { MARKER_CIRCULAR,  72,  74 },
    [DEX_AREA_GREEN_PATH]       = { MARKER_SMALL_H,   72,  78 },
    [DEX_AREA_WATER_PATH]       = { MARKER_SMALL_V,   81,  80 },
    [DEX_AREA_RUIN_VALLEY]      = { MARKER_CIRCULAR,  76,  92 },
    [DEX_AREA_TRAINER_TOWER]    = { MARKER_CIRCULAR, 104,  75 },
    [DEX_AREA_CANYON_ENTRANCE]  = { MARKER_CIRCULAR, 104,  86 },
    [DEX_AREA_SEVAULT_CANYON]   = { MARKER_SMALL_V,  108,  83 },
    [DEX_AREA_TANOBY_RUINS]     = { MARKER_MED_H,     96,  90 },
    [DEX_AREA_MT_EMBER]         = { MARKER_CIRCULAR,  14,   1 },
    [DEX_AREA_BERRY_FOREST]     = { MARKER_CIRCULAR,   5,  52 },
    [DEX_AREA_ICEFALL_CAVE]     = { MARKER_CIRCULAR,  13,  80 },
    [DEX_AREA_LOST_CAVE]        = { MARKER_CIRCULAR,  54,  74 },
    [DEX_AREA_ALTERING_CAVE]    = { MARKER_CIRCULAR,  69,  73 },
    [DEX_AREA_PATTERN_BUSH]     = { MARKER_CIRCULAR,  76,  77 },
    [DEX_AREA_DOTTED_HOLE]      = { MARKER_CIRCULAR,  73,  95 },
    [DEX_AREA_TANOBY_CHAMBER]   = { MARKER_MED_H,     96,  90 },
};

static void Task_ShowAreaMarkers(u8 taskId)
{
    struct PAM_TaskData * data = (void *)gTasks[taskId].data;
    gSprites[data->spriteId].invisible = FALSE;
}

u8 CreatePokedexAreaMarkers(u16 species, u16 tilesTag, u8 palIdx, u8 y)
{
    struct SpriteTemplate spriteTemplate;
    struct CompressedSpriteSheet spriteSheet;
    u8 taskId;
    struct PAM_TaskData * data;
    struct Subsprite * subsprites;

    // Load gfx
    spriteSheet.data = sMarkerTiles;
    spriteSheet.size = 0x4A0;
    spriteSheet.tag = tilesTag;
    LoadCompressedSpriteSheet(&spriteSheet);
    LoadPalette(sMarkerPal, OBJ_PLTT_ID(palIdx), sizeof(sMarkerPal));

    // Get marker subsprites
    taskId = CreateTask(Task_ShowAreaMarkers, 0);
    data = (void *)gTasks[taskId].data;
    data->unused = 0;
    data->tilesTag = tilesTag;
    data->paletteTag = TAG_NONE;
    subsprites = Alloc(120 * sizeof(struct Subsprite));
    data->buffer = subsprites;
    data->subsprites.subsprites = subsprites;
    data->subsprites.subspriteCount = GetSpeciesPokedexAreaMarkers(species, subsprites);

    SetGpuRegBits(REG_OFFSET_DISPCNT, DISPCNT_OBJWIN_ON);
    SetGpuReg(REG_OFFSET_BLDCNT, BLDCNT_TGT1_BG1 | BLDCNT_EFFECT_BLEND | BLDCNT_TGT2_BG0 | BLDCNT_TGT2_BG1 | BLDCNT_TGT2_BG2 | BLDCNT_TGT2_BG3 | BLDCNT_TGT2_BD);
    SetGpuReg(REG_OFFSET_BLDALPHA, BLDALPHA_BLEND(12, 8));
    SetGpuReg(REG_OFFSET_BLDY, 0);
    SetGpuReg(REG_OFFSET_WININ, WININ_WIN0_BG_ALL | WININ_WIN0_OBJ | WININ_WIN1_BG_ALL | WININ_WIN1_OBJ);
    SetGpuReg(REG_OFFSET_WINOUT, WINOUT_WIN01_BG0 | WINOUT_WIN01_BG2 | WINOUT_WIN01_BG3 | WINOUT_WIN01_OBJ | WINOUT_WIN01_CLR | WINOUT_WINOBJ_BG_ALL | WINOUT_WINOBJ_CLR);

    // Set marker subsprites on full sprite
    spriteTemplate = gDummySpriteTemplate;
    spriteTemplate.tileTag = tilesTag;
    data->spriteId = CreateSprite(&spriteTemplate, 104, y + 32, 0);
    SetSubspriteTables(&gSprites[data->spriteId], &data->subsprites);
    gSprites[data->spriteId].oam.objMode = ST_OAM_OBJ_WINDOW;
    gSprites[data->spriteId].oam.paletteNum = palIdx;
    gSprites[data->spriteId].subspriteTableNum = 0;
    gSprites[data->spriteId].invisible = TRUE;

    // Show markers
    HideBg(1);
    SetBgAttribute(1, BG_ATTR_CHARBASEINDEX, 0);
    FillBgTilemapBufferRect_Palette0(1, 0x00F, 0, 0, 30, 20);
    CopyBgTilemapBufferToVram(1);
    ShowBg(1);
    return taskId;
}

void DestroyPokedexAreaMarkers(u8 taskId)
{
    struct PAM_TaskData * data = (void *)gTasks[taskId].data;
    FreeSpriteTilesByTag(data->tilesTag);
    DestroySprite(&gSprites[data->spriteId]);
    Free(data->buffer);
    SetGpuReg(REG_OFFSET_BLDCNT, 0);
    SetGpuReg(REG_OFFSET_BLDALPHA, 0);
    SetGpuReg(REG_OFFSET_BLDY, 0);
    SetGpuReg(REG_OFFSET_WININ, WININ_WIN0_BG_ALL | WININ_WIN0_OBJ | WININ_WIN1_BG_ALL | WININ_WIN1_OBJ);
    SetGpuReg(REG_OFFSET_WINOUT, WINOUT_WIN01_BG_ALL | WINOUT_WIN01_OBJ | WINOUT_WINOBJ_BG_ALL | WINOUT_WINOBJ_OBJ);
    ClearGpuRegBits(REG_OFFSET_DISPCNT, DISPCNT_OBJWIN_ON);
    HideBg(1);
    SetBgAttribute(1, BG_ATTR_CHARBASEINDEX, 2);
    FillBgTilemapBufferRect_Palette0(1, 0x000, 0, 0, 30, 20);
    CopyBgTilemapBufferToVram(1);
    ShowBg(1);
    DestroyTask(taskId);
}

void GetAreaMarkerSubsprite(s32 i, s32 dexArea, struct Subsprite * subsprites)
{
    subsprites[i] = *sSubsprites[sAreaMarkers[dexArea][0]];
    subsprites[i].x = sAreaMarkers[dexArea][1];
    subsprites[i].y = sAreaMarkers[dexArea][2];
}

u8 GetNumPokedexAreaMarkers(u8 taskId)
{
    struct PAM_TaskData * data = (void *)gTasks[taskId].data;
    return data->subsprites.subspriteCount;
}
