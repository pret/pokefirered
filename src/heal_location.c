#include "global.h"
#include "heal_location.h"
#include "constants/maps.h"
#include "constants/spawn_points.h"

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
