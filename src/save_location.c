#include "global.h"
#include "save_location.h"
#include "constants/maps.h"

static bool32 IsCurMapInLocationList(const u16 *list)
{
    s32 i;
    u16 locSum = (gSaveBlock1Ptr->location.mapGroup << 8) + (gSaveBlock1Ptr->location.mapNum);

    for (i = 0; list[i] != MAP_UNDEFINED; i++)
    {
        if (list[i] == locSum)
            return TRUE;
    }
    return FALSE;
}

static const u16 sSaveLocationPokeCenterList[] = 
{
    MAP_VIRIDIAN_CITY_POKEMON_CENTER_1F, MAP_VIRIDIAN_CITY_POKEMON_CENTER_2F,
    MAP_PEWTER_CITY_POKEMON_CENTER_1F, MAP_PEWTER_CITY_POKEMON_CENTER_2F,
    MAP_CERULEAN_CITY_POKEMON_CENTER_1F, MAP_CERULEAN_CITY_POKEMON_CENTER_2F,
    MAP_LAVENDER_TOWN_POKEMON_CENTER_1F, MAP_LAVENDER_TOWN_POKEMON_CENTER_2F,
    MAP_VERMILION_CITY_POKEMON_CENTER_1F, MAP_VERMILION_CITY_POKEMON_CENTER_2F,
    MAP_CELADON_CITY_POKEMON_CENTER_1F, MAP_CELADON_CITY_POKEMON_CENTER_2F,
    MAP_FUCHSIA_CITY_POKEMON_CENTER_1F, MAP_FUCHSIA_CITY_POKEMON_CENTER_2F,
    MAP_CINNABAR_ISLAND_POKEMON_CENTER_1F, MAP_CINNABAR_ISLAND_POKEMON_CENTER_2F,
    MAP_INDIGO_PLATEAU_POKEMON_CENTER_1F, MAP_INDIGO_PLATEAU_POKEMON_CENTER_2F,
    MAP_SAFFRON_CITY_POKEMON_CENTER_1F, MAP_SAFFRON_CITY_POKEMON_CENTER_2F,
    MAP_ROUTE4_POKEMON_CENTER_1F, MAP_ROUTE4_POKEMON_CENTER_2F,
    MAP_ROUTE10_POKEMON_CENTER_1F, MAP_ROUTE10_POKEMON_CENTER_2F,
    MAP_ONE_ISLAND_POKEMON_CENTER_1F, MAP_ONE_ISLAND_POKEMON_CENTER_2F,
    MAP_TWO_ISLAND_POKEMON_CENTER_1F, MAP_TWO_ISLAND_POKEMON_CENTER_2F,
    MAP_THREE_ISLAND_POKEMON_CENTER_1F, MAP_THREE_ISLAND_POKEMON_CENTER_2F,
    MAP_FOUR_ISLAND_POKEMON_CENTER_1F, MAP_FOUR_ISLAND_POKEMON_CENTER_2F,
    MAP_FIVE_ISLAND_POKEMON_CENTER_1F, MAP_FIVE_ISLAND_POKEMON_CENTER_2F,
    MAP_SEVEN_ISLAND_POKEMON_CENTER_1F, MAP_SEVEN_ISLAND_POKEMON_CENTER_2F, 
    MAP_SIX_ISLAND_POKEMON_CENTER_1F, MAP_SIX_ISLAND_POKEMON_CENTER_2F,
    MAP_BATTLE_COLOSSEUM_2P, 
    MAP_TRADE_CENTER,
    MAP_BATTLE_COLOSSEUM_4P, 
    MAP_UNION_ROOM,
    MAP_UNDEFINED,
};

bool32 IsCurMapPokeCenter(void)
{
    return IsCurMapInLocationList(sSaveLocationPokeCenterList);
}

static const u16 sSaveLocationReloadLocList[] = { MAP_UNDEFINED };

static bool32 IsCurMapReloadLocation(void)
{
    return IsCurMapInLocationList(sSaveLocationReloadLocList);
}

// Nulled out list. Unknown what this would have been.
static const u16 sEmptyMapList[] = { MAP_UNDEFINED };

static bool32 IsCurMapInEmptyList(void)
{
    return IsCurMapInLocationList(sEmptyMapList);
}

static void TrySetPokeCenterWarpStatus(void)
{
    if (IsCurMapPokeCenter() == FALSE)
        gSaveBlock2Ptr->specialSaveWarpFlags &= ~(POKECENTER_SAVEWARP);
    else
        gSaveBlock2Ptr->specialSaveWarpFlags |= POKECENTER_SAVEWARP;
}

static void TrySetReloadWarpStatus(void)
{
    if (!IsCurMapReloadLocation())
        gSaveBlock2Ptr->specialSaveWarpFlags &= ~(LOBBY_SAVEWARP);
    else
        gSaveBlock2Ptr->specialSaveWarpFlags |= LOBBY_SAVEWARP;
}

// Unknown save warp flag. Never set because map list is empty.
static void TrySetUnknownWarpStatus(void)
{
    if (!IsCurMapInEmptyList())
        gSaveBlock2Ptr->specialSaveWarpFlags &= ~(UNK_SPECIAL_SAVE_WARP_FLAG_3);
    else
        gSaveBlock2Ptr->specialSaveWarpFlags |= UNK_SPECIAL_SAVE_WARP_FLAG_3;
}

void TrySetMapSaveWarpStatus(void)
{
    TrySetPokeCenterWarpStatus();
    TrySetReloadWarpStatus();
    TrySetUnknownWarpStatus();
}

void SetUnlockedPokedexFlags(void)
{
    gSaveBlock2Ptr->gcnLinkFlags |= (1 << 0);
    gSaveBlock2Ptr->gcnLinkFlags |= (1 << 4);
    gSaveBlock2Ptr->gcnLinkFlags |= (1 << 5);
}

void SetPostgameFlags(void)
{
    gSaveBlock2Ptr->specialSaveWarpFlags |= CHAMPION_SAVEWARP;
    gSaveBlock2Ptr->gcnLinkFlags |= (1 << 1);
    gSaveBlock2Ptr->gcnLinkFlags |= (1 << 2);
    gSaveBlock2Ptr->gcnLinkFlags |= (1 << 3);
    gSaveBlock2Ptr->gcnLinkFlags |= (1 << 15);
}
