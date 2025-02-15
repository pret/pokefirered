enum
{
    WALLPAPER_FOREST,
    WALLPAPER_CITY,
    WALLPAPER_DESERT,
    WALLPAPER_SAVANNA,
    WALLPAPER_CRAG,
    WALLPAPER_VOLCANO,
    WALLPAPER_SNOW,
    WALLPAPER_CAVE,
    WALLPAPER_BEACH,
    WALLPAPER_SEAFLOOR,
    WALLPAPER_RIVER,
    WALLPAPER_SKY,
    WALLPAPER_STARS,
    WALLPAPER_POKECENTER,
    WALLPAPER_TILES,
    WALLPAPER_SIMPLE,
    WALLPAPER_COUNT
};
#define MAX_DEFAULT_WALLPAPER WALLPAPER_SAVANNA

static const u16 sWallpaperPalettes_Forest[] = INCBIN_U16("graphics/pokemon_storage/wallpapers/forest/tiles.gbapal");
static const u32 sWallpaperTiles_Forest[] = INCBIN_U32("graphics/pokemon_storage/wallpapers/forest/tiles.4bpp.lz");
static const u32 sWallpaperTilemap_Forest[] = INCBIN_U32("graphics/pokemon_storage/wallpapers/forest/tilemap.bin.lz");

static const u16 sWallpaperPalettes_City[] = INCBIN_U16("graphics/pokemon_storage/wallpapers/city/tiles.gbapal");
static const u32 sWallpaperTiles_City[] = INCBIN_U32("graphics/pokemon_storage/wallpapers/city/tiles.4bpp.lz");
static const u32 sWallpaperTilemap_City[] = INCBIN_U32("graphics/pokemon_storage/wallpapers/city/tilemap.bin.lz");

static const u16 sWallpaperPalettes_Desert[] = INCBIN_U16("graphics/pokemon_storage/wallpapers/desert/tiles.gbapal");
static const u32 sWallpaperTiles_Desert[] = INCBIN_U32("graphics/pokemon_storage/wallpapers/desert/tiles.4bpp.lz");
static const u32 sWallpaperTilemap_Desert[] = INCBIN_U32("graphics/pokemon_storage/wallpapers/desert/tilemap.bin.lz");

static const u16 sWallpaperPalettes_Savanna[] = INCBIN_U16("graphics/pokemon_storage/wallpapers/savanna/tiles.gbapal");
static const u32 sWallpaperTiles_Savanna[] = INCBIN_U32("graphics/pokemon_storage/wallpapers/savanna/tiles.4bpp.lz");
static const u32 sWallpaperTilemap_Savanna[] = INCBIN_U32("graphics/pokemon_storage/wallpapers/savanna/tilemap.bin.lz");

static const u16 sWallpaperPalettes_Crag[] = INCBIN_U16("graphics/pokemon_storage/wallpapers/crag/tiles.gbapal");
static const u32 sWallpaperTiles_Crag[] = INCBIN_U32("graphics/pokemon_storage/wallpapers/crag/tiles.4bpp.lz");
static const u32 sWallpaperTilemap_Crag[] = INCBIN_U32("graphics/pokemon_storage/wallpapers/crag/tilemap.bin.lz");

static const u16 sWallpaperPalettes_Volcano[] = INCBIN_U16("graphics/pokemon_storage/wallpapers/volcano/tiles.gbapal");
static const u32 sWallpaperTiles_Volcano[] = INCBIN_U32("graphics/pokemon_storage/wallpapers/volcano/tiles.4bpp.lz");
static const u8 sUnusedSpace1[4] = {};
static const u32 sWallpaperTilemap_Volcano[] = INCBIN_U32("graphics/pokemon_storage/wallpapers/volcano/tilemap.bin.lz");

static const u16 sWallpaperPalettes_Snow[] = INCBIN_U16("graphics/pokemon_storage/wallpapers/snow/tiles.gbapal");
static const u32 sWallpaperTiles_Snow[] = INCBIN_U32("graphics/pokemon_storage/wallpapers/snow/tiles.4bpp.lz");
static const u32 sWallpaperTilemap_Snow[] = INCBIN_U32("graphics/pokemon_storage/wallpapers/snow/tilemap.bin.lz");

static const u16 sWallpaperPalettes_Cave[] = INCBIN_U16("graphics/pokemon_storage/wallpapers/cave/tiles.gbapal");
static const u32 sWallpaperTiles_Cave[] = INCBIN_U32("graphics/pokemon_storage/wallpapers/cave/tiles.4bpp.lz");
static const u32 sWallpaperTilemap_Cave[] = INCBIN_U32("graphics/pokemon_storage/wallpapers/cave/tilemap.bin.lz");

static const u16 sWallpaperPalettes_Beach[] = INCBIN_U16("graphics/pokemon_storage/wallpapers/beach/tiles.gbapal");
static const u32 sWallpaperTiles_Beach[] = INCBIN_U32("graphics/pokemon_storage/wallpapers/beach/tiles.4bpp.lz");
static const u32 sWallpaperTilemap_Beach[] = INCBIN_U32("graphics/pokemon_storage/wallpapers/beach/tilemap.bin.lz");

static const u16 sWallpaperPalettes_Seafloor[] = INCBIN_U16("graphics/pokemon_storage/wallpapers/seafloor/tiles.gbapal");
static const u32 sWallpaperTiles_Seafloor[] = INCBIN_U32("graphics/pokemon_storage/wallpapers/seafloor/tiles.4bpp.lz");
static const u32 sWallpaperTilemap_Seafloor[] = INCBIN_U32("graphics/pokemon_storage/wallpapers/seafloor/tilemap.bin.lz");

static const u16 sWallpaperPalettes_River[] = INCBIN_U16("graphics/pokemon_storage/wallpapers/river/tiles.gbapal");
static const u32 sWallpaperTiles_River[] = INCBIN_U32("graphics/pokemon_storage/wallpapers/river/tiles.4bpp.lz");
static const u32 sWallpaperTilemap_River[] = INCBIN_U32("graphics/pokemon_storage/wallpapers/river/tilemap.bin.lz");

static const u16 sWallpaperPalettes_Sky[] = INCBIN_U16("graphics/pokemon_storage/wallpapers/sky/tiles.gbapal");
static const u32 sWallpaperTiles_Sky[] = INCBIN_U32("graphics/pokemon_storage/wallpapers/sky/tiles.4bpp.lz");
static const u32 sWallpaperTilemap_Sky[] = INCBIN_U32("graphics/pokemon_storage/wallpapers/sky/tilemap.bin.lz");

static const u16 sWallpaperPalettes_Stars[] = INCBIN_U16("graphics/pokemon_storage/wallpapers/stars/tiles.gbapal");
static const u8 sUnusedSpace2[32] = {};
static const u32 sWallpaperTiles_Stars[] = INCBIN_U32("graphics/pokemon_storage/wallpapers/stars/tiles.4bpp.lz");
static const u32 sWallpaperTilemap_Stars[] = INCBIN_U32("graphics/pokemon_storage/wallpapers/stars/tilemap.bin.lz");

static const u16 sWallpaperPalettes_Pokecenter[] = INCBIN_U16("graphics/pokemon_storage/wallpapers/pokecenter/tiles.gbapal");
static const u32 sWallpaperTiles_Pokecenter[] = INCBIN_U32("graphics/pokemon_storage/wallpapers/pokecenter/tiles.4bpp.lz");
static const u32 sWallpaperTilemap_Pokecenter[] = INCBIN_U32("graphics/pokemon_storage/wallpapers/pokecenter/tilemap.bin.lz");

static const u16 sWallpaperPalettes_Tiles[] = INCBIN_U16("graphics/pokemon_storage/wallpapers/tiles/tiles.gbapal");
static const u32 sWallpaperTiles_Tiles[] = INCBIN_U32("graphics/pokemon_storage/wallpapers/tiles/tiles.4bpp.lz");
static const u32 sWallpaperTilemap_Tiles[] = INCBIN_U32("graphics/pokemon_storage/wallpapers/tiles/tilemap.bin.lz");

static const u16 sWallpaperPalettes_Simple[] = INCBIN_U16("graphics/pokemon_storage/wallpapers/simple/tiles.gbapal");
static const u32 sWallpaperTiles_Simple[] = INCBIN_U32("graphics/pokemon_storage/wallpapers/simple/tiles.4bpp.lz");
static const u32 sWallpaperTilemap_Simple[] = INCBIN_U32("graphics/pokemon_storage/wallpapers/simple/tilemap.bin.lz");

// Shadow color, text color
static const u16 sBoxTitleColors[][2] = {
    {RGB( 7,  7,  7), RGB_WHITE},
    {RGB( 7,  7,  7), RGB_WHITE},
    {RGB( 7,  7,  7), RGB_WHITE},
    {RGB( 7,  7,  7), RGB_WHITE},
    {RGB( 7,  7,  7), RGB_WHITE},
    {RGB( 7,  7,  7), RGB_WHITE},
    {RGB( 7,  7,  7), RGB_WHITE},
    {RGB( 7,  7,  7), RGB_WHITE},
    {RGB( 7,  7,  7), RGB_WHITE},
    {RGB( 7,  7,  7), RGB_WHITE},
    {RGB( 7,  7,  7), RGB_WHITE},
    {RGB( 7,  7,  7), RGB_WHITE},
    {RGB( 7,  7,  7), RGB_WHITE},
    {RGB( 7,  7,  7), RGB_WHITE},
    {RGB( 7,  7,  7), RGB_WHITE},
    {RGB( 7,  7,  7), RGB_WHITE}
};

static const struct Wallpaper sWallpapers[] = {
    {sWallpaperTiles_Forest,     sWallpaperTilemap_Forest,     sWallpaperPalettes_Forest    },
    {sWallpaperTiles_City,       sWallpaperTilemap_City,       sWallpaperPalettes_City      },
    {sWallpaperTiles_Desert,     sWallpaperTilemap_Desert,     sWallpaperPalettes_Desert    },
    {sWallpaperTiles_Savanna,    sWallpaperTilemap_Savanna,    sWallpaperPalettes_Savanna   },
    {sWallpaperTiles_Crag,       sWallpaperTilemap_Crag,       sWallpaperPalettes_Crag      },
    {sWallpaperTiles_Volcano,    sWallpaperTilemap_Volcano,    sWallpaperPalettes_Volcano   },
    {sWallpaperTiles_Snow,       sWallpaperTilemap_Snow,       sWallpaperPalettes_Snow      },
    {sWallpaperTiles_Cave,       sWallpaperTilemap_Cave,       sWallpaperPalettes_Cave      },
    {sWallpaperTiles_Beach,      sWallpaperTilemap_Beach,      sWallpaperPalettes_Beach     },
    {sWallpaperTiles_Seafloor,   sWallpaperTilemap_Seafloor,   sWallpaperPalettes_Seafloor  },
    {sWallpaperTiles_River,      sWallpaperTilemap_River,      sWallpaperPalettes_River     },
    {sWallpaperTiles_Sky,        sWallpaperTilemap_Sky,        sWallpaperPalettes_Sky       },
    {sWallpaperTiles_Stars,      sWallpaperTilemap_Stars,      sWallpaperPalettes_Stars     },
    {sWallpaperTiles_Pokecenter, sWallpaperTilemap_Pokecenter, sWallpaperPalettes_Pokecenter},
    {sWallpaperTiles_Tiles,      sWallpaperTilemap_Tiles,      sWallpaperPalettes_Tiles     },
    {sWallpaperTiles_Simple,     sWallpaperTilemap_Simple,     sWallpaperPalettes_Simple    },
};

static const u16 sBoxScrollArrow_Gfx[] = INCBIN_U16("graphics/pokemon_storage/box_scroll_arrow.4bpp");