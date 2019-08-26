#include "global.h"
#include "gpu_regs.h"
#include "bg.h"
#include "palette.h"
#include "malloc.h"
#include "quest_log.h"
#include "new_menu_helpers.h"
#include "window.h"
#include "region_map.h"
#include "menu.h"
#include "field_fadetransition.h"
#include "field_weather.h"
#include "script.h"
#include "overworld.h"
#include "event_data.h"
#include "map_preview_screen.h"
#include "constants/region_map.h"

static EWRAM_DATA bool8 gUnknown_203ABEC = FALSE;
static EWRAM_DATA bool8 gUnknown_203ABED = FALSE;

static void sub_80F83D0(u8 taskId);

static const u8 gViridianForestMapPreviewPalette[] = INCBIN_U8("data/map_preview/viridian_forest_pal.gbapal");
static const u8 gViridianForestMapPreviewTiles[] = INCBIN_U8("data/map_preview/viridian_forest_tiles.4bpp.lz");
static const u8 gViridianForestMapPreviewTilemap[] = INCBIN_U8("data/map_preview/viridian_forest_tilemap.bin");
static const u8 gRockTunnelMapPreviewPalette[] = INCBIN_U8("data/map_preview/rock_tunnel_pal.gbapal");
static const u8 gRockTunnelMapPreviewTiles[] = INCBIN_U8("data/map_preview/rock_tunnel_tiles.4bpp.lz");
static const u8 gRockTunnelMapPreviewTilemap[] = INCBIN_U8("data/map_preview/rock_tunnel_tilemap.bin");
static const u8 gRocketHideoutMapPreviewPalette[] = INCBIN_U8("data/map_preview/rocket_hideout_pal.gbapal");
static const u8 gRocketHideoutMapPreviewTiles[] = INCBIN_U8("data/map_preview/rocket_hideout_tiles.4bpp.lz");
static const u8 gRocketHideoutMapPreviewTilemap[] = INCBIN_U8("data/map_preview/rocket_hideout_tilemap.bin");
static const u8 gPowerPlantMapPreviewPalette[] = INCBIN_U8("data/map_preview/power_plant_pal.gbapal");
static const u8 gPowerPlantMapPreviewTiles[] = INCBIN_U8("data/map_preview/power_plant_tiles.4bpp.lz");
static const u8 gPowerPlantMapPreviewTilemap[] = INCBIN_U8("data/map_preview/power_plant_tilemap.bin");
static const u8 gPokemonMansionMapPreviewPalette[] = INCBIN_U8("data/map_preview/pokemon_mansion_pal.gbapal");
static const u8 gPokemonMansionMapPreviewTiles[] = INCBIN_U8("data/map_preview/pokemon_mansion_tiles.4bpp.lz");
static const u8 gPokemonMansionMapPreviewTilemap[] = INCBIN_U8("data/map_preview/pokemon_mansion_tilemap.bin");
static const u8 gPokemonTowerMapPreviewPalette[] = INCBIN_U8("data/map_preview/pokemon_tower_pal.gbapal");
static const u8 gPokemonTowerMapPreviewTiles[] = INCBIN_U8("data/map_preview/pokemon_tower_tiles.4bpp.lz");
static const u8 gPokemonTowerMapPreviewTilemap[] = INCBIN_U8("data/map_preview/pokemon_tower_tilemap.bin");
static const u8 gSilphCoMapPreviewPalette[] = INCBIN_U8("data/map_preview/silph_co_pal.gbapal");
static const u8 gSilphCoMapPreviewTiles[] = INCBIN_U8("data/map_preview/silph_co_tiles.4bpp.lz");
static const u8 gSilphCoMapPreviewTilemap[] = INCBIN_U8("data/map_preview/silph_co_tilemap.bin");
static const u8 gMtMoonMapPreviewPalette[] = INCBIN_U8("data/map_preview/mt_moon_pal.gbapal");
static const u8 gMtMoonMapPreviewTiles[] = INCBIN_U8("data/map_preview/mt_moon_tiles.4bpp.lz");
static const u8 gMtMoonMapPreviewTilemap[] = INCBIN_U8("data/map_preview/mt_moon_tilemap.bin");
static const u8 gSeafoamIslandsMapPreviewPalette[] = INCBIN_U8("data/map_preview/seafoam_islands_pal.gbapal");
static const u8 gSeafoamIslandsMapPreviewTiles[] = INCBIN_U8("data/map_preview/seafoam_islands_tiles.4bpp.lz");
static const u8 gSeafoamIslandsMapPreviewTilemap[] = INCBIN_U8("data/map_preview/seafoam_islands_tilemap.bin");
static const u8 gRocketWarehouseMapPreviewPalette[] = INCBIN_U8("data/map_preview/rocket_warehouse_pal.gbapal");
static const u8 gRocketWarehouseMapPreviewTiles[] = INCBIN_U8("data/map_preview/rocket_warehouse_tiles.4bpp.lz");
static const u8 gRocketWarehouseMapPreviewTilemap[] = INCBIN_U8("data/map_preview/rocket_warehouse_tilemap.bin");
static const u8 gKantoVictoryRoadMapPreviewPalette[] = INCBIN_U8("data/map_preview/kanto_victory_road_pal.gbapal");
static const u8 gKantoVictoryRoadMapPreviewTiles[] = INCBIN_U8("data/map_preview/kanto_victory_road_tiles.4bpp.lz");
static const u8 gKantoVictoryRoadMapPreviewTilemap[] = INCBIN_U8("data/map_preview/kanto_victory_road_tilemap.bin");
static const u8 gMtEmberMapPreviewPalette[] = INCBIN_U8("data/map_preview/mt_ember_pal.gbapal");
static const u8 gMtEmberMapPreviewTiles[] = INCBIN_U8("data/map_preview/mt_ember_tiles.4bpp.lz");
static const u8 gMtEmberMapPreviewTilemap[] = INCBIN_U8("data/map_preview/mt_ember_tilemap.bin");
static const u8 gKantoSafariZoneMapPreviewPalette[] = INCBIN_U8("data/map_preview/kanto_safari_zone_pal.gbapal");
static const u8 gKantoSafariZoneMapPreviewTiles[] = INCBIN_U8("data/map_preview/kanto_safari_zone_tiles.4bpp.lz");
static const u8 gKantoSafariZoneMapPreviewTilemap[] = INCBIN_U8("data/map_preview/kanto_safari_zone_tilemap.bin");
static const u8 gMoneanChamberMapPreviewPalette[] = INCBIN_U8("data/map_preview/monean_chamber_pal.gbapal");
static const u8 gMoneanChamberMapPreviewTiles[] = INCBIN_U8("data/map_preview/monean_chamber_tiles.4bpp.lz");
static const u8 gMoneanChamberMapPreviewTilemap[] = INCBIN_U8("data/map_preview/monean_chamber_tilemap.bin");
static const u8 gDottedHoleMapPreviewPalette[] = INCBIN_U8("data/map_preview/dotted_hole_pal.gbapal");
static const u8 gDottedHoleMapPreviewTiles[] = INCBIN_U8("data/map_preview/dotted_hole_tiles.4bpp.lz");
static const u8 gDottedHoleMapPreviewTilemap[] = INCBIN_U8("data/map_preview/dotted_hole_tilemap.bin");
static const u8 gCeruleanCaveMapPreviewPalette[] = INCBIN_U8("data/map_preview/cerulean_cave_pal.gbapal");
static const u8 gCeruleanCaveMapPreviewTiles[] = INCBIN_U8("data/map_preview/cerulean_cave_tiles.4bpp.lz");
static const u8 gCeruleanCaveMapPreviewTilemap[] = INCBIN_U8("data/map_preview/cerulean_cave_tilemap.bin");
static const u8 gDiglettsCaveMapPreviewPalette[] = INCBIN_U8("data/map_preview/digletts_cave_pal.gbapal");
static const u8 gDiglettsCaveMapPreviewTiles[] = INCBIN_U8("data/map_preview/digletts_cave_tiles.4bpp.lz");
static const u8 gDiglettsCaveMapPreviewTilemap[] = INCBIN_U8("data/map_preview/digletts_cave_tilemap.bin");
static const u8 gLostCaveMapPreviewPalette[] = INCBIN_U8("data/map_preview/lost_cave_pal.gbapal");
static const u8 gLostCaveMapPreviewTiles[] = INCBIN_U8("data/map_preview/lost_cave_tiles.4bpp.lz");
static const u8 gLostCaveMapPreviewTilemap[] = INCBIN_U8("data/map_preview/lost_cave_tilemap.bin");
static const u8 gBerryForestMapPreviewPalette[] = INCBIN_U8("data/map_preview/berry_forest_pal.gbapal");
static const u8 gBerryForestMapPreviewTiles[] = INCBIN_U8("data/map_preview/berry_forest_tiles.4bpp.lz");
static const u8 gBerryForestMapPreviewTilemap[] = INCBIN_U8("data/map_preview/berry_forest_tilemap.bin");
static const u8 gIcefallCaveMapPreviewPalette[] = INCBIN_U8("data/map_preview/icefall_cave_pal.gbapal");
static const u8 gIcefallCaveMapPreviewTiles[] = INCBIN_U8("data/map_preview/icefall_cave_tiles.4bpp.lz");
static const u8 gIcefallCaveMapPreviewTilemap[] = INCBIN_U8("data/map_preview/icefall_cave_tilemap.bin");
static const u8 gAlteringCaveMapPreviewPalette[] = INCBIN_U8("data/map_preview/altering_cave_pal.gbapal");
static const u8 gAlteringCaveMapPreviewTiles[] = INCBIN_U8("data/map_preview/altering_cave_tiles.4bpp.lz");
static const u8 gAlteringCaveMapPreviewTilemap[] = INCBIN_U8("data/map_preview/altering_cave_tilemap.bin");

static const struct MapPreviewScreen sMapPreviewScreenData[MPS_COUNT] = {
    [MPS_VIRIDIAN_FOREST] = {
        .mapsec = MAPSEC_VIRIDIAN_FOREST,
        .forceFirstTime = TRUE,
        .flagId = FLAG_WORLD_MAP_VIRIDIAN_FOREST,
        .tilesptr = gViridianForestMapPreviewTiles,
        .tilemapptr = gViridianForestMapPreviewTilemap,
        .palptr = gViridianForestMapPreviewPalette
    },
    [MPS_MT_MOON] = {
        .mapsec = MAPSEC_MT_MOON,
        .forceFirstTime = FALSE,
        .flagId = FLAG_WORLD_MAP_MT_MOON_1F,
        .tilesptr = gMtMoonMapPreviewTiles,
        .tilemapptr = gMtMoonMapPreviewTilemap,
        .palptr = gMtMoonMapPreviewPalette
    },
    [MPS_DIGLETTS_CAVE] = {
        .mapsec = MAPSEC_DIGLETTS_CAVE,
        .forceFirstTime = FALSE,
        .flagId = FLAG_WORLD_MAP_DIGLETTS_CAVE_B1F,
        .tilesptr = gDiglettsCaveMapPreviewTiles,
        .tilemapptr = gDiglettsCaveMapPreviewTilemap,
        .palptr = gDiglettsCaveMapPreviewPalette
    },
    [MPS_ROCK_TUNNEL] = {
        .mapsec = MAPSEC_ROCK_TUNNEL,
        .forceFirstTime = FALSE,
        .flagId = FLAG_WORLD_MAP_ROCK_TUNNEL_1F,
        .tilesptr = gRockTunnelMapPreviewTiles,
        .tilemapptr = gRockTunnelMapPreviewTilemap,
        .palptr = gRockTunnelMapPreviewPalette
    },
    [MPS_POKEMON_TOWER] = {
        .mapsec = MAPSEC_POKEMON_TOWER,
        .forceFirstTime = FALSE,
        .flagId = FLAG_WORLD_MAP_POKEMON_TOWER_1F,
        .tilesptr = gPokemonTowerMapPreviewTiles,
        .tilemapptr = gPokemonTowerMapPreviewTilemap,
        .palptr = gPokemonTowerMapPreviewPalette
    },
    [MPS_SAFARI_ZONE] = {
        .mapsec = MAPSEC_KANTO_SAFARI_ZONE,
        .forceFirstTime = TRUE,
        .flagId = FLAG_WORLD_MAP_SAFARI_ZONE_CENTER,
        .tilesptr = gKantoSafariZoneMapPreviewTiles,
        .tilemapptr = gKantoSafariZoneMapPreviewTilemap,
        .palptr = gKantoSafariZoneMapPreviewPalette
    },
    [MPS_SEAFOAM_ISLANDS] = {
        .mapsec = MAPSEC_SEAFOAM_ISLANDS,
        .forceFirstTime = FALSE,
        .flagId = FLAG_WORLD_MAP_SEAFOAM_ISLANDS_1F,
        .tilesptr = gSeafoamIslandsMapPreviewTiles,
        .tilemapptr = gSeafoamIslandsMapPreviewTilemap,
        .palptr = gSeafoamIslandsMapPreviewPalette
    },
    [MPS_POKEMON_MANSION] = {
        .mapsec = MAPSEC_POKEMON_MANSION,
        .forceFirstTime = TRUE,
        .flagId = FLAG_WORLD_MAP_POKEMON_MANSION_1F,
        .tilesptr = gPokemonMansionMapPreviewTiles,
        .tilemapptr = gPokemonMansionMapPreviewTilemap,
        .palptr = gPokemonMansionMapPreviewPalette
    },
    [MPS_ROCKET_HIDEOUT] = {
        .mapsec = MAPSEC_ROCKET_HIDEOUT,
        .forceFirstTime = TRUE,
        .flagId = FLAG_WORLD_MAP_ROCKET_HIDEOUT_B1F,
        .tilesptr = gRocketHideoutMapPreviewTiles,
        .tilemapptr = gRocketHideoutMapPreviewTilemap,
        .palptr = gRocketHideoutMapPreviewPalette
    },
    [MPS_SILPH_CO] = {
        .mapsec = MAPSEC_SILPH_CO,
        .forceFirstTime = FALSE,
        .flagId = FLAG_WORLD_MAP_SILPH_CO_1F,
        .tilesptr = gSilphCoMapPreviewTiles,
        .tilemapptr = gSilphCoMapPreviewTilemap,
        .palptr = gSilphCoMapPreviewPalette
    },
    [MPS_VICTORY_ROAD] = {
        .mapsec = MAPSEC_KANTO_VICTORY_ROAD,
        .forceFirstTime = FALSE,
        .flagId = FLAG_WORLD_MAP_VICTORY_ROAD_1F,
        .tilesptr = gKantoVictoryRoadMapPreviewTiles,
        .tilemapptr = gKantoVictoryRoadMapPreviewTilemap,
        .palptr = gKantoVictoryRoadMapPreviewPalette
    },
    [MPS_CERULEAN_CAVE] = {
        .mapsec = MAPSEC_CERULEAN_CAVE,
        .forceFirstTime = FALSE,
        .flagId = FLAG_WORLD_MAP_CERULEAN_CAVE_1F,
        .tilesptr = gCeruleanCaveMapPreviewTiles,
        .tilemapptr = gCeruleanCaveMapPreviewTilemap,
        .palptr = gCeruleanCaveMapPreviewPalette
    },
    [MPS_POWER_PLANT] = {
        .mapsec = MAPSEC_POWER_PLANT,
        .forceFirstTime = TRUE,
        .flagId = FLAG_WORLD_MAP_POWER_PLANT,
        .tilesptr = gPowerPlantMapPreviewTiles,
        .tilemapptr = gPowerPlantMapPreviewTilemap,
        .palptr = gPowerPlantMapPreviewPalette
    },
    [MPS_MT_EMBER] = {
        .mapsec = MAPSEC_MT_EMBER,
        .forceFirstTime = FALSE,
        .flagId = FLAG_WORLD_MAP_MT_EMBER_EXTERIOR,
        .tilesptr = gMtEmberMapPreviewTiles,
        .tilemapptr = gMtEmberMapPreviewTilemap,
        .palptr = gMtEmberMapPreviewPalette
    },
    [MPS_ROCKET_WAREHOUSE] = {
        .mapsec = MAPSEC_ROCKET_WAREHOUSE,
        .forceFirstTime = TRUE,
        .flagId = FLAG_WORLD_MAP_THREE_ISLAND_BERRY_FOREST,
        .tilesptr = gRocketWarehouseMapPreviewTiles,
        .tilemapptr = gRocketWarehouseMapPreviewTilemap,
        .palptr = gRocketWarehouseMapPreviewPalette
    },
    [MPS_MONEAN_CHAMBER] = {
        .mapsec = MAPSEC_MONEAN_CHAMBER,
        .forceFirstTime = FALSE,
        .flagId = FLAG_WORLD_MAP_SEVEN_ISLAND_TANOBY_RUINS_MONEAN_CHAMBER,
        .tilesptr = gMoneanChamberMapPreviewTiles,
        .tilemapptr = gMoneanChamberMapPreviewTilemap,
        .palptr = gMoneanChamberMapPreviewPalette
    },
    [MPS_DOTTED_HOLE] = {
        .mapsec = MAPSEC_DOTTED_HOLE,
        .forceFirstTime = FALSE,
        .flagId = FLAG_WORLD_MAP_SIX_ISLAND_DOTTED_HOLE_1F,
        .tilesptr = gDottedHoleMapPreviewTiles,
        .tilemapptr = gDottedHoleMapPreviewTilemap,
        .palptr = gDottedHoleMapPreviewPalette
    },
    [MPS_BERRY_FOREST] = {
        .mapsec = MAPSEC_BERRY_FOREST,
        .forceFirstTime = TRUE,
        .flagId = FLAG_WORLD_MAP_THREE_ISLAND_BERRY_FOREST,
        .tilesptr = gBerryForestMapPreviewTiles,
        .tilemapptr = gBerryForestMapPreviewTilemap,
        .palptr = gBerryForestMapPreviewPalette
    },
    [MPS_ICEFALL_CAVE] = {
        .mapsec = MAPSEC_ICEFALL_CAVE,
        .forceFirstTime = FALSE,
        .flagId = FLAG_WORLD_MAP_FOUR_ISLAND_ICEFALL_CAVE_ENTRANCE,
        .tilesptr = gIcefallCaveMapPreviewTiles,
        .tilemapptr = gIcefallCaveMapPreviewTilemap,
        .palptr = gIcefallCaveMapPreviewPalette
    },
    [MPS_LOST_CAVE] = {
        .mapsec = MAPSEC_LOST_CAVE,
        .forceFirstTime = FALSE,
        .flagId = FLAG_WORLD_MAP_FIVE_ISLAND_LOST_CAVE_ENTRANCE,
        .tilesptr = gLostCaveMapPreviewTiles,
        .tilemapptr = gLostCaveMapPreviewTilemap,
        .palptr = gLostCaveMapPreviewPalette
    },
    [MPS_ALTERING_CAVE] = {
        .mapsec = MAPSEC_ALTERING_CAVE,
        .forceFirstTime = FALSE,
        .flagId = FLAG_WORLD_MAP_SIX_ISLAND_ALTERING_CAVE,
        .tilesptr = gAlteringCaveMapPreviewTiles,
        .tilemapptr = gAlteringCaveMapPreviewTilemap,
        .palptr = gAlteringCaveMapPreviewPalette
    },
    [MPS_PATTERN_BUSH] = {
        .mapsec = MAPSEC_PATTERN_BUSH,
        .forceFirstTime = TRUE,
        .flagId = FLAG_WORLD_MAP_SIX_ISLAND_PATTERN_BUSH,
        .tilesptr = gViridianForestMapPreviewTiles,
        .tilemapptr = gViridianForestMapPreviewTilemap,
        .palptr = gViridianForestMapPreviewPalette
    },
    [MPS_LIPTOO_CHAMBER] = {
        .mapsec = MAPSEC_LIPTOO_CHAMBER,
        .forceFirstTime = FALSE,
        .flagId = FLAG_WORLD_MAP_SEVEN_ISLAND_TANOBY_RUINS_MONEAN_CHAMBER,
        .tilesptr = gMoneanChamberMapPreviewTiles,
        .tilemapptr = gMoneanChamberMapPreviewTilemap,
        .palptr = gMoneanChamberMapPreviewPalette
    },
    [MPS_WEEPTH_CHAMBER] = {
        .mapsec = MAPSEC_WEEPTH_CHAMBER,
        .forceFirstTime = FALSE,
        .flagId = FLAG_WORLD_MAP_SEVEN_ISLAND_TANOBY_RUINS_MONEAN_CHAMBER,
        .tilesptr = gMoneanChamberMapPreviewTiles,
        .tilemapptr = gMoneanChamberMapPreviewTilemap,
        .palptr = gMoneanChamberMapPreviewPalette
    },
    [MPS_TDILFORD_CHAMBER] = {
        .mapsec = MAPSEC_DILFORD_CHAMBER,
        .forceFirstTime = FALSE,
        .flagId = FLAG_WORLD_MAP_SEVEN_ISLAND_TANOBY_RUINS_MONEAN_CHAMBER,
        .tilesptr = gMoneanChamberMapPreviewTiles,
        .tilemapptr = gMoneanChamberMapPreviewTilemap,
        .palptr = gMoneanChamberMapPreviewPalette
    },
    [MPS_SCUFIB_CHAMBER] = {
        .mapsec = MAPSEC_SCUFIB_CHAMBER,
        .forceFirstTime = FALSE,
        .flagId = FLAG_WORLD_MAP_SEVEN_ISLAND_TANOBY_RUINS_MONEAN_CHAMBER,
        .tilesptr = gMoneanChamberMapPreviewTiles,
        .tilemapptr = gMoneanChamberMapPreviewTilemap,
        .palptr = gMoneanChamberMapPreviewPalette
    },
    [MPS_RIXY_CHAMBER] = {
        .mapsec = MAPSEC_RIXY_CHAMBER,
        .forceFirstTime = FALSE,
        .flagId = FLAG_WORLD_MAP_SEVEN_ISLAND_TANOBY_RUINS_MONEAN_CHAMBER,
        .tilesptr = gMoneanChamberMapPreviewTiles,
        .tilemapptr = gMoneanChamberMapPreviewTilemap,
        .palptr = gMoneanChamberMapPreviewPalette
    },
    [MPS_VIAPOIS_CHAMBER] = {
        .mapsec = MAPSEC_VIAPOIS_CHAMBER,
        .forceFirstTime = FALSE,
        .flagId = FLAG_WORLD_MAP_SEVEN_ISLAND_TANOBY_RUINS_MONEAN_CHAMBER,
        .tilesptr = gMoneanChamberMapPreviewTiles,
        .tilemapptr = gMoneanChamberMapPreviewTilemap,
        .palptr = gMoneanChamberMapPreviewPalette
    }
};

static const struct WindowTemplate sMapNameWindow = {
    .bg = 0,
    .tilemapLeft = 0,
    .tilemapTop = 0,
    .width = 13,
    .height = 2,
    .paletteNum = 14,
    .baseBlock = 0x1C2
};

static const struct BgTemplate sMapPreviewBgTemplate[1] = {
    {
        .mapBaseIndex = 31
    }
};

static u8 sub_80F80E4(u8 mapsec)
{
    s32 i;

    for (i = 0; i < MPS_COUNT; i++)
    {
        if (sMapPreviewScreenData[i].mapsec == mapsec)
        {
            return i;
        }
    }
    return MPS_COUNT;
}

bool8 sub_80F8110(u8 mapsec, u8 forceFirstTime)
{
    u8 idx;

    idx = sub_80F80E4(mapsec);
    if (idx != MPS_COUNT)
    {
        if (forceFirstTime == 2)
        {
            return TRUE;
        }
        else
        {
            return sMapPreviewScreenData[idx].forceFirstTime == forceFirstTime ? TRUE : FALSE;
        }
    }
    else
    {
        return FALSE;
    }
}

bool8 sub_80F8154(u8 mapsec, u8 forceFirstTime)
{
    if (gUnknown_203ADFA == 2)
    {
        return FALSE;
    }
    else
    {
        return sub_80F8110(mapsec, forceFirstTime);
    }
}

void sub_80F8180(void)
{
    InitBgsFromTemplates(0, sMapPreviewBgTemplate, NELEMS(sMapPreviewBgTemplate));
    ShowBg(0);
}

void sub_80F819C(u8 mapsec)
{
    u8 idx;

    idx = sub_80F80E4(mapsec);
    if (idx != MPS_COUNT)
    {
       ResetTempTileDataBuffers();
       LoadPalette(sMapPreviewScreenData[idx].palptr, 0xD0, 0x60);
       DecompressAndCopyTileDataToVram(0, sMapPreviewScreenData[idx].tilesptr, 0, 0, 0);
       if (GetBgTilemapBuffer(0) == NULL)
       {
           SetBgTilemapBuffer(0, Alloc(BG_SCREEN_SIZE));
           gUnknown_203ABED = TRUE;
       }
       else
       {
           gUnknown_203ABED = FALSE;
       }
       CopyToBgTilemapBuffer(0, sMapPreviewScreenData[idx].tilemapptr, 0, 0x000);
       CopyBgTilemapBufferToVram(0);
    }
}

void sub_80F8234(s32 windowId)
{
    RemoveWindow(windowId);
    if (gUnknown_203ABED)
    {
        Free(GetBgTilemapBuffer(0));
    }
}

bool32 sub_80F8258(void)
{
    return FreeTempTileDataBuffersIfPossible();
}

void sub_80F8268(u8 mapsec)
{
    u8 taskId;

    taskId = CreateTask(sub_80F83D0, 0);
    gTasks[taskId].data[2] = GetBgAttribute(0, BG_ATTR_PRIORITY);
    gTasks[taskId].data[4] = GetGpuReg(REG_OFFSET_BLDCNT);
    gTasks[taskId].data[5] = GetGpuReg(REG_OFFSET_BLDALPHA);
    gTasks[taskId].data[3] = GetGpuReg(REG_OFFSET_DISPCNT);
    gTasks[taskId].data[6] = GetGpuReg(REG_OFFSET_WININ);
    gTasks[taskId].data[7] = GetGpuReg(REG_OFFSET_WINOUT);
    gTasks[taskId].data[10] = sub_80F856C(mapsec);
    gTasks[taskId].data[8] = 16;
    gTasks[taskId].data[9] = 0;
    SetBgAttribute(0, BG_ATTR_PRIORITY, 0);
    SetGpuReg(REG_OFFSET_BLDCNT, BLDCNT_TGT1_BG0 | BLDCNT_EFFECT_BLEND | BLDCNT_TGT2_BG1 | BLDCNT_TGT2_BG2 | BLDCNT_TGT2_BG3 | BLDCNT_TGT2_OBJ | BLDCNT_TGT2_BD);
    SetGpuReg(REG_OFFSET_BLDALPHA, BLDALPHA_BLEND(16, 0));
    SetGpuRegBits(REG_OFFSET_WININ, 0x2020);
    SetGpuRegBits(REG_OFFSET_WINOUT, 0x0020);
    gTasks[taskId].data[11] = sub_80F8318(mapsec);
    ScriptContext2_Enable();
}

u16 sub_80F8318(u8 mapsec)
{
    u16 windowId;
    u32 xctr;
    u8 color[0];

    windowId = AddWindow(&sMapNameWindow);
    FillWindowPixelBuffer(windowId, PIXEL_FILL(1));
    PutWindowTilemap(windowId);
    color[0] = 1; // Access violation
    color[1] = 4; // Access violation
    color[2] = 3; // Access violation
    GetMapName(gStringVar4, mapsec, 0);
    xctr = 104 - GetStringWidth(2, gStringVar4, 0);
    AddTextPrinterParameterized4(windowId, 2, xctr / 2, 2, 0, 0, color/* Access violation */, -1, gStringVar4);
    return windowId;
}

bool8 sub_80F83B0(void)
{
    if (FuncIsActiveTask(sub_80F83D0) == TRUE)
    {
        return FALSE;
    }
    else
    {
        return TRUE;
    }
}

static void sub_80F83D0(u8 taskId)
{
    s16 * data;

    data = gTasks[taskId].data;
    switch (data[0])
    {
    case 0:
        if (!sub_80F8258() && !IsDma3ManagerBusyWithBgCopy())
        {
            CopyWindowToVram(data[11], 3);
            data[0]++;
        }
        break;
    case 1:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            sub_807DC00();
            data[0]++;
        }
        break;
    case 2:
        if (sub_807AA70())
        {
            Overworld_PlaySpecialMapMusic();
            data[0]++;
        }
        break;
    case 3:
        data[1]++;
        if (data[1] > data[10])
        {
            data[1] = 0;
            data[0]++;
        }
        break;
    case 4:
        switch (data[1])
        {
        case 0:
            data[9]++;
            if (data[9] > 16)
            {
                data[9] = 16;
            }
            break;
        case 1:
            data[8]--;
            if (data[8] < 0)
            {
                data[8] = 0;
            }
            break;
        }
        data[1] = (data[1] + 1) % 3;
        SetGpuReg(REG_OFFSET_BLDALPHA, BLDALPHA_BLEND(data[8], data[9]));
        if (data[8] == 0 && data[9] == 16)
        {
            FillBgTilemapBufferRect_Palette0(0, 0, 0, 0, 32, 32);
            CopyBgTilemapBufferToVram(0);
            data[0]++;
        }
        break;
    case 5:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            sub_80F8234(data[11]);
            SetBgAttribute(0, BG_ATTR_PRIORITY, data[2]);
            SetGpuReg(REG_OFFSET_DISPCNT, data[3]);
            SetGpuReg(REG_OFFSET_BLDCNT, data[4]);
            SetGpuReg(REG_OFFSET_BLDALPHA, data[5]);
            SetGpuReg(REG_OFFSET_WININ, data[6]);
            SetGpuReg(REG_OFFSET_WINOUT, data[7]);
            DestroyTask(taskId);
        }
        break;
    }
}

const struct MapPreviewScreen * sub_80F8544(u8 mapsec)
{
    u8 idx;

    idx = sub_80F80E4(mapsec);
    if (idx == MPS_COUNT)
    {
        return NULL;
    }
    else
    {
        return &sMapPreviewScreenData[idx];
    }
}

u16 sub_80F856C(u8 mapsec)
{
    u8 idx;
    u16 flagId;

    idx = sub_80F80E4(mapsec);
    if (idx == MPS_COUNT)
    {
        return 0;
    }
    flagId = sMapPreviewScreenData[idx].flagId;
    if (!sMapPreviewScreenData[idx].forceFirstTime)
    {
        if (!FlagGet(flagId))
        {
            return 120;
        }
        else
        {
            return 40;
        }
    }
    else {
        if (gUnknown_203ABEC)
        {
            return 120;
        }
        else
        {
            return 40;
        }
    }
}

void sub_80F85BC(u16 flagId)
{
    if (!FlagGet(flagId))
    {
        gUnknown_203ABEC = TRUE;
    }
    else
    {
        gUnknown_203ABEC = FALSE;
    }
    FlagSet(flagId);
}
