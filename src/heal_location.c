#include "global.h"
#include "heal_location.h"
#include "event_data.h"
#include "constants/vars.h"
#include "constants/maps.h"
#include "constants/spawn_points.h"

void sub_80BFE00(u32 healLocationIdx);

static const struct HealLocation sSpawnPoints[] = {
    {MAP_GROUP(PALLET_TOWN),             MAP_NUM(PALLET_TOWN),             0x06, 0x08},
    {MAP_GROUP(VIRIDIAN_CITY),           MAP_NUM(VIRIDIAN_CITY),           0x1a, 0x1b},
    {MAP_GROUP(PEWTER_CITY),             MAP_NUM(PEWTER_CITY),             0x11, 0x1a},
    {MAP_GROUP(CERULEAN_CITY),           MAP_NUM(CERULEAN_CITY),           0x16, 0x14},
    {MAP_GROUP(LAVENDER_TOWN),           MAP_NUM(LAVENDER_TOWN),           0x06, 0x06},
    {MAP_GROUP(VERMILION_CITY),          MAP_NUM(VERMILION_CITY),          0x0f, 0x07},
    {MAP_GROUP(CELADON_CITY),            MAP_NUM(CELADON_CITY),            0x30, 0x0c},
    {MAP_GROUP(FUCHSIA_CITY),            MAP_NUM(FUCHSIA_CITY),            0x19, 0x20},
    {MAP_GROUP(CINNABAR_ISLAND),         MAP_NUM(CINNABAR_ISLAND),         0x0e, 0x0c},
    {MAP_GROUP(INDIGO_PLATEAU_EXTERIOR), MAP_NUM(INDIGO_PLATEAU_EXTERIOR), 0x0b, 0x07},
    {MAP_GROUP(SAFFRON_CITY_DUPLICATE),  MAP_NUM(SAFFRON_CITY_DUPLICATE),  0x18, 0x27},
    {MAP_GROUP(ROUTE4),                  MAP_NUM(ROUTE4),                  0x0c, 0x06},
    {MAP_GROUP(ROUTE10),                 MAP_NUM(ROUTE10),                 0x0d, 0x15},
    {MAP_GROUP(ONE_ISLAND),              MAP_NUM(ONE_ISLAND),              0x0e, 0x06},
    {MAP_GROUP(TWO_ISLAND),              MAP_NUM(TWO_ISLAND),              0x15, 0x08},
    {MAP_GROUP(THREE_ISLAND),            MAP_NUM(THREE_ISLAND),            0x0e, 0x1c},
    {MAP_GROUP(FOUR_ISLAND),             MAP_NUM(FOUR_ISLAND),             0x12, 0x15},
    {MAP_GROUP(FIVE_ISLAND),             MAP_NUM(FIVE_ISLAND),             0x12, 0x07},
    {MAP_GROUP(SEVEN_ISLAND),            MAP_NUM(SEVEN_ISLAND),            0x0c, 0x04},
    {MAP_GROUP(SIX_ISLAND),              MAP_NUM(SIX_ISLAND),              0x0b, 0x0c},
};

const u16 gUnknown_83EEC98[][2] = {
    {MAP_GROUP(PALLET_TOWN_PLAYERS_HOUSE_1F), MAP_NUM(PALLET_TOWN_PLAYERS_HOUSE_1F)},
    {MAP_GROUP(VIRIDIAN_CITY_POKEMON_CENTER_1F), MAP_NUM(VIRIDIAN_CITY_POKEMON_CENTER_1F)},
    {MAP_GROUP(PEWTER_CITY_POKEMON_CENTER_1F), MAP_NUM(PEWTER_CITY_POKEMON_CENTER_1F)},
    {MAP_GROUP(CERULEAN_CITY_POKEMON_CENTER_1F), MAP_NUM(CERULEAN_CITY_POKEMON_CENTER_1F)},
    {MAP_GROUP(LAVENDER_TOWN_POKEMON_CENTER_1F), MAP_NUM(LAVENDER_TOWN_POKEMON_CENTER_1F)},
    {MAP_GROUP(VERMILION_CITY_POKEMON_CENTER_1F), MAP_NUM(VERMILION_CITY_POKEMON_CENTER_1F)},
    {MAP_GROUP(CELADON_CITY_POKEMON_CENTER_1F), MAP_NUM(CELADON_CITY_POKEMON_CENTER_1F)},
    {MAP_GROUP(FUCHSIA_CITY_POKEMON_CENTER_1F), MAP_NUM(FUCHSIA_CITY_POKEMON_CENTER_1F)},
    {MAP_GROUP(CINNABAR_ISLAND_POKEMON_CENTER_1F), MAP_NUM(CINNABAR_ISLAND_POKEMON_CENTER_1F)},
    {MAP_GROUP(INDIGO_PLATEAU_POKEMON_CENTER_1F), MAP_NUM(INDIGO_PLATEAU_POKEMON_CENTER_1F)},
    {MAP_GROUP(SAFFRON_CITY_POKEMON_CENTER_1F), MAP_NUM(SAFFRON_CITY_POKEMON_CENTER_1F)},
    {MAP_GROUP(ROUTE4_POKEMON_CENTER_1F), MAP_NUM(ROUTE4_POKEMON_CENTER_1F)},
    {MAP_GROUP(ROUTE10_POKEMON_CENTER_1F), MAP_NUM(ROUTE10_POKEMON_CENTER_1F)},
    {MAP_GROUP(ONE_ISLAND_POKEMON_CENTER_1F), MAP_NUM(ONE_ISLAND_POKEMON_CENTER_1F)},
    {MAP_GROUP(TWO_ISLAND_POKEMON_CENTER_1F), MAP_NUM(TWO_ISLAND_POKEMON_CENTER_1F)},
    {MAP_GROUP(THREE_ISLAND_POKEMON_CENTER_1F), MAP_NUM(THREE_ISLAND_POKEMON_CENTER_1F)},
    {MAP_GROUP(FOUR_ISLAND_POKEMON_CENTER_1F), MAP_NUM(FOUR_ISLAND_POKEMON_CENTER_1F)},
    {MAP_GROUP(FIVE_ISLAND_POKEMON_CENTER_1F), MAP_NUM(FIVE_ISLAND_POKEMON_CENTER_1F)},
    {MAP_GROUP(SEVEN_ISLAND_POKEMON_CENTER_1F), MAP_NUM(SEVEN_ISLAND_POKEMON_CENTER_1F)},
    {MAP_GROUP(SIX_ISLAND_POKEMON_CENTER_1F), MAP_NUM(SIX_ISLAND_POKEMON_CENTER_1F)}
};

static const u8 gUnknown_83EECE8[] = {
    0x01, 0x01, 0x03, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x02, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01
};

u32 GetHealLocationIndexFromMapGroupAndNum(u16 mapGroup, u16 mapNum)
{
    u32 i;

    for (i = 0; i < NELEMS(sSpawnPoints); i++) {
        if (sSpawnPoints[i].group == mapGroup && sSpawnPoints[i].map == mapNum)
        {
            return i + 1;
        }
    }

    return 0;
}

const struct HealLocation * GetHealLocationPointerFromMapGroupAndNum(u16 mapGroup, u16 mapNum)
{
    u32 i = GetHealLocationIndexFromMapGroupAndNum(mapGroup, mapNum);
    if (i == 0)
        return NULL;

    return &sSpawnPoints[i - 1];
}

const struct HealLocation * GetHealLocationPointer(u32 idx)
{
    if (idx == 0)
        return NULL;
    if (idx > NELEMS(sSpawnPoints))
        return NULL;
    return &sSpawnPoints[idx - 1];
}

void sub_80BFCD0(struct WarpData * warp)
{
    u32 healLocationIdx;

    if (VarGet(VAR_0x4082) == 1)
    {
        if (!gSaveBlock1Ptr->unkArray[gSaveBlock1Ptr->unkArrayIdx].unkA_2)
            VarSet(VAR_0x4082, 0);
        gSpecialVar_LastTalked = 1;
        warp->x = 4;
        warp->y = 11;
        warp->mapGroup = MAP_GROUP(SEVEN_ISLAND_TRAINER_TOWER_LOBBY);
        warp->mapNum = MAP_NUM(SEVEN_ISLAND_TRAINER_TOWER_LOBBY);
        warp->warpId = 0xFF;
    }
    else
    {
        healLocationIdx = GetHealLocationIndexFromMapGroupAndNum(gSaveBlock1Ptr->lastHealLocation.mapGroup, gSaveBlock1Ptr->lastHealLocation.mapNum);
        warp->mapGroup = gUnknown_83EEC98[healLocationIdx - 1][0];
        warp->mapNum = gUnknown_83EEC98[healLocationIdx - 1][1];
        warp->warpId = 0xFF;

        if (gUnknown_83EEC98[healLocationIdx - 1][0] == MAP_GROUP(PALLET_TOWN_PLAYERS_HOUSE_1F) && gUnknown_83EEC98[healLocationIdx - 1][1] == MAP_NUM(PALLET_TOWN_PLAYERS_HOUSE_1F))
        {
            warp->x = 8;
            warp->y = 5;
        }
        else if (gUnknown_83EEC98[healLocationIdx - 1][0] == MAP_GROUP(INDIGO_PLATEAU_POKEMON_CENTER_1F) && gUnknown_83EEC98[healLocationIdx - 1][1] == MAP_NUM(INDIGO_PLATEAU_POKEMON_CENTER_1F))
        {
            warp->x = 13;
            warp->y = 12;
        }
        else if (gUnknown_83EEC98[healLocationIdx - 1][0] == MAP_GROUP(ONE_ISLAND_POKEMON_CENTER_1F) && gUnknown_83EEC98[healLocationIdx - 1][1] == MAP_NUM(ONE_ISLAND_POKEMON_CENTER_1F))
        {
            warp->x = 5;
            warp->y = 4;
        }
        else if (gUnknown_83EEC98[healLocationIdx - 1][0] == MAP_GROUP(SEVEN_ISLAND_TRAINER_TOWER_LOBBY) && gUnknown_83EEC98[healLocationIdx - 1][1] == MAP_NUM(SEVEN_ISLAND_TRAINER_TOWER_LOBBY))
        {
            warp->x = 4;
            warp->y = 11;
            VarSet(VAR_0x4082, 0);
        }
        else
        {
            warp->x = 7;
            warp->y = 4;
        }
        sub_80BFE00(healLocationIdx);
    }
}

void sub_80BFE00(u32 healLocationIdx)
{
    gSpecialVar_LastTalked = gUnknown_83EECE8[healLocationIdx - 1];
}
