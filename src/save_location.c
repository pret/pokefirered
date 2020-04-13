#include "global.h"
#include "save_location.h"
#include "constants/maps.h"

static bool32 IsCurMapInLocationList(const u16 *list)
{
    s32 i;
    u16 locSum = (gSaveBlock1Ptr->location.mapGroup << 8) + (gSaveBlock1Ptr->location.mapNum);

    for (i = 0; list[i] != 0xFFFF; i++)
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
    0xFFFF,
};

bool32 IsCurMapPokeCenter(void)
{
    return IsCurMapInLocationList(sSaveLocationPokeCenterList);
}

static const u16 sSaveLocationReloadLocList[] = { 0xFFFF };

static bool32 IsCurMapReloadLocation(void)
{
    return IsCurMapInLocationList(sSaveLocationReloadLocList);
}

static const u16 sUnknown_8453094[] = { 0xFFFF };

static bool32 sub_810B75C(void)
{
    return IsCurMapInLocationList(sUnknown_8453094);
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

static void sub_810B7CC(void)
{
    if (!sub_810B75C())
        gSaveBlock2Ptr->specialSaveWarpFlags &= ~(UNK_SPECIAL_SAVE_WARP_FLAG_3);
    else
        gSaveBlock2Ptr->specialSaveWarpFlags |= UNK_SPECIAL_SAVE_WARP_FLAG_3;
}

void TrySetMapSaveWarpStatus(void)
{
    TrySetPokeCenterWarpStatus();
    TrySetReloadWarpStatus();
    sub_810B7CC();
}

void SetUnlockedPokedexFlags(void)
{
    gSaveBlock2Ptr->gcnLinkFlags |= 0x1;
    gSaveBlock2Ptr->gcnLinkFlags |= 0x10;
    gSaveBlock2Ptr->gcnLinkFlags |= 0x20;
}

void SetPostgameFlags(void)
{
    gSaveBlock2Ptr->specialSaveWarpFlags |= CHAMPION_SAVEWARP;
    gSaveBlock2Ptr->gcnLinkFlags |= 0x2;
    gSaveBlock2Ptr->gcnLinkFlags |= 0x4;
    gSaveBlock2Ptr->gcnLinkFlags |= 0x8;
    gSaveBlock2Ptr->gcnLinkFlags |= 0x8000;
}
