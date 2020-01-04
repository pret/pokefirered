#ifndef GUARD_MAP_PREVIEW_SCREEN_H
#define GUARD_MAP_PREVIEW_SCREEN_H

enum MapPreviewScreenId
{
    MPS_VIRIDIAN_FOREST = 0u,
    MPS_MT_MOON,
    MPS_DIGLETTS_CAVE,
    MPS_ROCK_TUNNEL,
    MPS_POKEMON_TOWER,
    MPS_SAFARI_ZONE,
    MPS_SEAFOAM_ISLANDS,
    MPS_POKEMON_MANSION,
    MPS_ROCKET_HIDEOUT,
    MPS_SILPH_CO,
    MPS_VICTORY_ROAD,
    MPS_CERULEAN_CAVE,
    MPS_POWER_PLANT,
    MPS_MT_EMBER,
    MPS_ROCKET_WAREHOUSE,
    MPS_MONEAN_CHAMBER,
    MPS_DOTTED_HOLE,
    MPS_BERRY_FOREST,
    MPS_ICEFALL_CAVE,
    MPS_LOST_CAVE,
    MPS_ALTERING_CAVE,
    MPS_PATTERN_BUSH,
    MPS_LIPTOO_CHAMBER,
    MPS_WEEPTH_CHAMBER,
    MPS_TDILFORD_CHAMBER,
    MPS_SCUFIB_CHAMBER,
    MPS_RIXY_CHAMBER,
    MPS_VIAPOIS_CHAMBER,
    MPS_COUNT
};

struct MapPreviewScreen
{
    u8 mapsec;
    bool8 forceFirstTime;
    u16 flagId;
    const void * tilesptr;
    const void * tilemapptr;
    const void * palptr;
};

u16 sub_80F8318(u8 id);
void sub_80F85BC(u16 a0);
u16 sub_80F856C(u8 id);
bool8 sub_80F8110(u8 mapsec, bool8 forceFirstTime);
bool32 sub_80F83B0(void);
const struct MapPreviewScreen * sub_80F8544(u8 mapsec);

#endif //GUARD_MAP_PREVIEW_SCREEN_H
