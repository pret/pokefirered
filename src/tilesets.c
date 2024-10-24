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

static const struct Tileset* const gSeasonTilesetsPrimary[][SEASON_WINTER + 1] =
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

static const struct Tileset* const gSeasonTilesetsSecondary[][SEASON_WINTER + 1] =
{
    SEASON_TILESETS_TERMINATOR
};

const struct Tileset* GetPrimaryTileset(const struct MapLayout* mapLayout)
{
    u32 i;
    enum Season season;

    if (!OW_SEASONS)
        return mapLayout->primaryTileset;

    season = GetSeason();
    for (i = 0; gSeasonTilesetsPrimary[i][SEASON_SPRING] != NULL; i++) {
        if (mapLayout->primaryTileset == gSeasonTilesetsPrimary[i][SEASON_SPRING])
        {
            if (gSeasonTilesetsPrimary[i][season] != NULL)
                return gSeasonTilesetsPrimary[i][season];
            else
                return mapLayout->primaryTileset;
        }
    }
    return mapLayout->primaryTileset;
}
const struct Tileset* GetSecondaryTileset(const struct MapLayout* mapLayout)
{
    u32 i;
    enum Season season;

    if (!OW_SEASONS)
        return mapLayout->secondaryTileset;

    season = GetSeason();
    for (i = 0; gSeasonTilesetsSecondary[i][SEASON_SPRING] != NULL; i++) {
        if (mapLayout->secondaryTileset == gSeasonTilesetsSecondary[i][SEASON_SPRING])
        {
            if (gSeasonTilesetsSecondary[i][season] != NULL)
                return gSeasonTilesetsSecondary[i][season];
            else
                return mapLayout->secondaryTileset;
        }
    }
    return mapLayout->secondaryTileset;
}
