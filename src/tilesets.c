#include "global.h"
#include "rtc.h"
#include "tilesets.h"
#include "tileset_anims.h"

#include "data/tilesets/graphics.h"
#include "data/tilesets/metatiles.h"
#include "data/tilesets/headers.h"


#define SEASON_TILESETS_TERMINATOR  \
    {                           \
        [SEASON_SPRING] = NULL, \
        [SEASON_SUMMER] = NULL, \
        [SEASON_AUTUMN] = NULL, \
        [SEASON_WINTER] = NULL, \
    }

static const struct Tileset* const sSeasonTilesetsPrimary[][SEASON_WINTER + 1] =
{
    {
        [SEASON_SPRING] = &gTileset_General,
        [SEASON_SUMMER] = &gTileset_GeneralSummer,
        [SEASON_AUTUMN] = &gTileset_GeneralAutumn,
        [SEASON_WINTER] = &gTileset_GeneralWinter,
    },
    {
        [SEASON_SPRING] = &gTileset_Building,
        [SEASON_SUMMER] = NULL,
        [SEASON_AUTUMN] = NULL,
        [SEASON_WINTER] = NULL,
    },
    SEASON_TILESETS_TERMINATOR
};

static const struct Tileset* const sSeasonTilesetsSecondary[][SEASON_WINTER + 1] =
{
    {
        [SEASON_SPRING] = &gTileset_PalletTown,
        [SEASON_SUMMER] = &gTileset_PalletTownSummer,
        [SEASON_AUTUMN] = &gTileset_PalletTownAutumn,
        [SEASON_WINTER] = &gTileset_PalletTownWinter,
    },
    {
        [SEASON_SPRING] = &gTileset_ViridianForest,
        [SEASON_SUMMER] = &gTileset_ViridianForestSummer,
        [SEASON_AUTUMN] = &gTileset_ViridianForestAutumn,
        [SEASON_WINTER] = &gTileset_ViridianForestWinter,
    },
    {
        [SEASON_SPRING] = &gTileset_LavenderTown,
        [SEASON_SUMMER] = &gTileset_LavenderTownSummer,
        [SEASON_AUTUMN] = &gTileset_LavenderTownAutumn,
        [SEASON_WINTER] = &gTileset_LavenderTownWinter,
    },
    {
        [SEASON_SPRING] = &gTileset_SaffronCity,
        [SEASON_SUMMER] = &gTileset_SaffronCitySummer,
        [SEASON_AUTUMN] = &gTileset_SaffronCityAutumn,
        [SEASON_WINTER] = &gTileset_SaffronCityWinter,
    },
    {
        [SEASON_SPRING] = &gTileset_CeladonCity,
        [SEASON_SUMMER] = &gTileset_CeladonCitySummer,
        [SEASON_AUTUMN] = &gTileset_CeladonCityAutumn,
        [SEASON_WINTER] = &gTileset_CeladonCityWinter,
    },
    {
        [SEASON_SPRING] = &gTileset_FuchsiaCity,
        [SEASON_SUMMER] = &gTileset_FuchsiaCitySummer,
        [SEASON_AUTUMN] = &gTileset_FuchsiaCityAutumn,
        [SEASON_WINTER] = &gTileset_FuchsiaCityWinter,
    },
    {
        [SEASON_SPRING] = &gTileset_IndigoPlateau,
        [SEASON_SUMMER] = &gTileset_IndigoPlateauSummer,
        [SEASON_AUTUMN] = &gTileset_IndigoPlateauAutumn,
        [SEASON_WINTER] = &gTileset_IndigoPlateauWinter,
    },
    {
        [SEASON_SPRING] = &gTileset_SeviiIslands123,
        [SEASON_SUMMER] = &gTileset_SeviiIslands123Summer,
        [SEASON_AUTUMN] = &gTileset_SeviiIslands123Autumn,
        [SEASON_WINTER] = &gTileset_SeviiIslands123Winter,
    },
    {
        [SEASON_SPRING] = &gTileset_BerryForest,
        [SEASON_SUMMER] = &gTileset_BerryForestSummer,
        [SEASON_AUTUMN] = &gTileset_BerryForestAutumn,
        [SEASON_WINTER] = &gTileset_BerryForestWinter,
    },
    SEASON_TILESETS_TERMINATOR
};

const struct Tileset* GetPrimaryTileset(const struct MapLayout* mapLayout)
{
    u32 i;
    if (!OW_SEASONS)
        return mapLayout->primaryTileset;

    for (i = 0; sSeasonTilesetsPrimary[i][SEASON_SPRING] != NULL; i++) {
        if (mapLayout->primaryTileset == sSeasonTilesetsPrimary[i][SEASON_SPRING])
        {
            if (sSeasonTilesetsPrimary[i][gLoadedSeason] != NULL)
                return sSeasonTilesetsPrimary[i][gLoadedSeason];
            else
                return mapLayout->primaryTileset;
        }
    }
    return mapLayout->primaryTileset;
}

const struct Tileset* GetSecondaryTileset(const struct MapLayout* mapLayout)
{
    u32 i;

    if (!OW_SEASONS)
        return mapLayout->secondaryTileset;

    DebugPrintfLevel(MGBA_LOG_ERROR, "get secondary");
    for (i = 0; sSeasonTilesetsSecondary[i][SEASON_SPRING] != NULL; i++) {
        if (mapLayout->secondaryTileset == sSeasonTilesetsSecondary[i][SEASON_SPRING])
        {
            if (sSeasonTilesetsSecondary[i][gLoadedSeason] != NULL)
                return sSeasonTilesetsSecondary[i][gLoadedSeason];
            else
                return mapLayout->secondaryTileset;
        }
    }
    return mapLayout->secondaryTileset;
}
