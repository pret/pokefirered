#include "global.h"
#include "rtc.h"
#include "tilesets.h"
#include "tileset_anims.h"

#include "data/tilesets/graphics.h"
#include "data/tilesets/metatiles.h"
#include "data/tilesets/headers.h"


const struct Tileset gTilsetsPerSeason[][SEASON_WINTER + 1] =
{
    [0] = {
        [SEASON_SPRING] = gTileset_General,
        [SEASON_SUMMER] = gTileset_GeneralSummer,
        [SEASON_AUTUMN] = gTileset_GeneralAutumn,
        [SEASON_WINTER] = gTileset_GeneralWinter,
    }
};
