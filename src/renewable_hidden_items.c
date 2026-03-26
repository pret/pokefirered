#include "global.h"
#include "event_data.h"
#include "random.h"
#include "constants/maps.h"

#define MAX_HIDDEN_ITEMS_PER_GROUP 8

struct RenewableHiddenItemData
{
    s8 mapGroup;
    s8 mapNum;
    u8 filler[2];
    u8 rare[MAX_HIDDEN_ITEMS_PER_GROUP];     // 10%
    u8 uncommon[MAX_HIDDEN_ITEMS_PER_GROUP]; // 30%
    u8 common[MAX_HIDDEN_ITEMS_PER_GROUP];   // 60%
};

static void SampleRenewableItemFlags(void);

#define HIDDEN_ID(flag)(flag - FLAG_HIDDEN_ITEMS_START)
#define NO_ITEM 0xFF

static const struct RenewableHiddenItemData sRenewableHiddenItems[] = {
    {
        .mapGroup = MAP_GROUP(ROUTE20),
        .mapNum = MAP_NUM(ROUTE20),
        .rare = {
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM
        },
        .uncommon = {
            HIDDEN_ID(FLAG_HIDDEN_ITEM_ROUTE20_STARDUST),
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM
        },
        .common = {
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM
        }
    },
    {
        .mapGroup = MAP_GROUP(ROUTE21_NORTH),
        .mapNum = MAP_NUM(ROUTE21_NORTH),
        .rare = {
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM
        },
        .uncommon = {
            HIDDEN_ID(FLAG_HIDDEN_ITEM_ROUTE21_NORTH_PEARL),
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM
        },
        .common = {
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM
        }
    },
    {
        .mapGroup = MAP_GROUP(UNDERGROUND_PATH_NORTH_SOUTH_TUNNEL),
        .mapNum = MAP_NUM(UNDERGROUND_PATH_NORTH_SOUTH_TUNNEL),
        .rare = {
            HIDDEN_ID(FLAG_HIDDEN_ITEM_UNDERGROUND_PATH_NORTH_SOUTH_TUNNEL_ETHER),
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM
        },
        .uncommon = {
            HIDDEN_ID(FLAG_HIDDEN_ITEM_UNDERGROUND_PATH_NORTH_SOUTH_TUNNEL_POTION),
            HIDDEN_ID(FLAG_HIDDEN_ITEM_UNDERGROUND_PATH_NORTH_SOUTH_TUNNEL_ANTIDOTE),
            HIDDEN_ID(FLAG_HIDDEN_ITEM_UNDERGROUND_PATH_NORTH_SOUTH_TUNNEL_PARALYZE_HEAL),
            HIDDEN_ID(FLAG_HIDDEN_ITEM_UNDERGROUND_PATH_NORTH_SOUTH_TUNNEL_AWAKENING),
            HIDDEN_ID(FLAG_HIDDEN_ITEM_UNDERGROUND_PATH_NORTH_SOUTH_TUNNEL_BURN_HEAL),
            HIDDEN_ID(FLAG_HIDDEN_ITEM_UNDERGROUND_PATH_NORTH_SOUTH_TUNNEL_ICE_HEAL),
            NO_ITEM,
            NO_ITEM
        },
        .common = {
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM
        }
    },
    {
        .mapGroup = MAP_GROUP(UNDERGROUND_PATH_EAST_WEST_TUNNEL),
        .mapNum = MAP_NUM(UNDERGROUND_PATH_EAST_WEST_TUNNEL),
        .rare = {
            HIDDEN_ID(FLAG_HIDDEN_ITEM_UNDERGROUND_PATH_EAST_WEST_TUNNEL_ETHER),
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM
        },
        .uncommon = {
            HIDDEN_ID(FLAG_HIDDEN_ITEM_UNDERGROUND_PATH_EAST_WEST_TUNNEL_POTION),
            HIDDEN_ID(FLAG_HIDDEN_ITEM_UNDERGROUND_PATH_EAST_WEST_TUNNEL_ANTIDOTE),
            HIDDEN_ID(FLAG_HIDDEN_ITEM_UNDERGROUND_PATH_EAST_WEST_TUNNEL_PARALYZE_HEAL),
            HIDDEN_ID(FLAG_HIDDEN_ITEM_UNDERGROUND_PATH_EAST_WEST_TUNNEL_AWAKENING),
            HIDDEN_ID(FLAG_HIDDEN_ITEM_UNDERGROUND_PATH_EAST_WEST_TUNNEL_BURN_HEAL),
            HIDDEN_ID(FLAG_HIDDEN_ITEM_UNDERGROUND_PATH_EAST_WEST_TUNNEL_ICE_HEAL),
            NO_ITEM,
            NO_ITEM
        },
        .common = {
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM
        }
    },
    {
        .mapGroup = MAP_GROUP(SEVEN_ISLAND_TANOBY_RUINS),
        .mapNum = MAP_NUM(SEVEN_ISLAND_TANOBY_RUINS),
        .rare = {
            HIDDEN_ID(FLAG_HIDDEN_ITEM_SEVEN_ISLAND_TANOBY_RUINS_HEART_SCALE_4),
            HIDDEN_ID(FLAG_HIDDEN_ITEM_SEVEN_ISLAND_TANOBY_RUINS_HEART_SCALE),
            HIDDEN_ID(FLAG_HIDDEN_ITEM_SEVEN_ISLAND_TANOBY_RUINS_HEART_SCALE_2),
            HIDDEN_ID(FLAG_HIDDEN_ITEM_SEVEN_ISLAND_TANOBY_RUINS_HEART_SCALE_3),
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM
        },
        .uncommon = {
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM
        },
        .common = {
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM
        }
    },
    {
        .mapGroup = MAP_GROUP(MT_MOON_B1F),
        .mapNum = MAP_NUM(MT_MOON_B1F),
        .rare = {
            HIDDEN_ID(FLAG_HIDDEN_ITEM_MT_MOON_B1F_TINY_MUSHROOM),
            HIDDEN_ID(FLAG_HIDDEN_ITEM_MT_MOON_B1F_TINY_MUSHROOM_2),
            HIDDEN_ID(FLAG_HIDDEN_ITEM_MT_MOON_B1F_TINY_MUSHROOM_3),
            HIDDEN_ID(FLAG_HIDDEN_ITEM_MT_MOON_B1F_BIG_MUSHROOM),
            HIDDEN_ID(FLAG_HIDDEN_ITEM_MT_MOON_B1F_BIG_MUSHROOM_2),
            HIDDEN_ID(FLAG_HIDDEN_ITEM_MT_MOON_B1F_BIG_MUSHROOM_3),
            NO_ITEM,
            NO_ITEM
        },
        .uncommon = {
            HIDDEN_ID(FLAG_HIDDEN_ITEM_MT_MOON_B1F_TINY_MUSHROOM),
            HIDDEN_ID(FLAG_HIDDEN_ITEM_MT_MOON_B1F_TINY_MUSHROOM_2),
            HIDDEN_ID(FLAG_HIDDEN_ITEM_MT_MOON_B1F_TINY_MUSHROOM_3),
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM
        },
        .common = {
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM
        }
    },
    {
        .mapGroup = MAP_GROUP(THREE_ISLAND_BERRY_FOREST),
        .mapNum = MAP_NUM(THREE_ISLAND_BERRY_FOREST),
        .rare = {
            HIDDEN_ID(FLAG_HIDDEN_ITEM_THREE_ISLAND_BERRY_FOREST_BLUK_BERRY),
            HIDDEN_ID(FLAG_HIDDEN_ITEM_THREE_ISLAND_BERRY_FOREST_WEPEAR_BERRY),
            HIDDEN_ID(FLAG_HIDDEN_ITEM_THREE_ISLAND_BERRY_FOREST_ORAN_BERRY),
            HIDDEN_ID(FLAG_HIDDEN_ITEM_THREE_ISLAND_BERRY_FOREST_CHERI_BERRY),
            HIDDEN_ID(FLAG_HIDDEN_ITEM_THREE_ISLAND_BERRY_FOREST_ASPEAR_BERRY),
            HIDDEN_ID(FLAG_HIDDEN_ITEM_THREE_ISLAND_BERRY_FOREST_PERSIM_BERRY),
            HIDDEN_ID(FLAG_HIDDEN_ITEM_THREE_ISLAND_BERRY_FOREST_PINAP_BERRY),
            HIDDEN_ID(FLAG_HIDDEN_ITEM_THREE_ISLAND_BERRY_FOREST_LUM_BERRY),
        },
        .uncommon = {
            HIDDEN_ID(FLAG_HIDDEN_ITEM_THREE_ISLAND_BERRY_FOREST_BLUK_BERRY),
            HIDDEN_ID(FLAG_HIDDEN_ITEM_THREE_ISLAND_BERRY_FOREST_WEPEAR_BERRY),
            HIDDEN_ID(FLAG_HIDDEN_ITEM_THREE_ISLAND_BERRY_FOREST_ORAN_BERRY),
            HIDDEN_ID(FLAG_HIDDEN_ITEM_THREE_ISLAND_BERRY_FOREST_CHERI_BERRY),
            HIDDEN_ID(FLAG_HIDDEN_ITEM_THREE_ISLAND_BERRY_FOREST_ASPEAR_BERRY),
            HIDDEN_ID(FLAG_HIDDEN_ITEM_THREE_ISLAND_BERRY_FOREST_PERSIM_BERRY),
            HIDDEN_ID(FLAG_HIDDEN_ITEM_THREE_ISLAND_BERRY_FOREST_PINAP_BERRY),
            NO_ITEM
        },
        .common = {
            HIDDEN_ID(FLAG_HIDDEN_ITEM_THREE_ISLAND_BERRY_FOREST_RAZZ_BERRY),
            HIDDEN_ID(FLAG_HIDDEN_ITEM_THREE_ISLAND_BERRY_FOREST_NANAB_BERRY),
            HIDDEN_ID(FLAG_HIDDEN_ITEM_THREE_ISLAND_BERRY_FOREST_CHESTO_BERRY),
            HIDDEN_ID(FLAG_HIDDEN_ITEM_THREE_ISLAND_BERRY_FOREST_PECHA_BERRY),
            HIDDEN_ID(FLAG_HIDDEN_ITEM_THREE_ISLAND_BERRY_FOREST_RAWST_BERRY),
            NO_ITEM,
            NO_ITEM,
            NO_ITEM
        }
    },
    {
        .mapGroup = MAP_GROUP(ONE_ISLAND_TREASURE_BEACH),
        .mapNum = MAP_NUM(ONE_ISLAND_TREASURE_BEACH),
        .rare = {
            HIDDEN_ID(FLAG_HIDDEN_ITEM_ONE_ISLAND_TREASURE_BEACH_ULTRA_BALL),
            HIDDEN_ID(FLAG_HIDDEN_ITEM_ONE_ISLAND_TREASURE_BEACH_ULTRA_BALL_2),
            HIDDEN_ID(FLAG_HIDDEN_ITEM_ONE_ISLAND_TREASURE_BEACH_STAR_PIECE),
            HIDDEN_ID(FLAG_HIDDEN_ITEM_ONE_ISLAND_TREASURE_BEACH_BIG_PEARL),
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM
        },
        .uncommon = {
            HIDDEN_ID(FLAG_HIDDEN_ITEM_ONE_ISLAND_TREASURE_BEACH_STARDUST),
            HIDDEN_ID(FLAG_HIDDEN_ITEM_ONE_ISLAND_TREASURE_BEACH_STARDUST_2),
            HIDDEN_ID(FLAG_HIDDEN_ITEM_ONE_ISLAND_TREASURE_BEACH_PEARL),
            HIDDEN_ID(FLAG_HIDDEN_ITEM_ONE_ISLAND_TREASURE_BEACH_PEARL_2),
            HIDDEN_ID(FLAG_HIDDEN_ITEM_ONE_ISLAND_TREASURE_BEACH_ULTRA_BALL),
            HIDDEN_ID(FLAG_HIDDEN_ITEM_ONE_ISLAND_TREASURE_BEACH_ULTRA_BALL_2),
            NO_ITEM,
            NO_ITEM
        },
        .common = {
            HIDDEN_ID(FLAG_HIDDEN_ITEM_ONE_ISLAND_TREASURE_BEACH_ULTRA_BALL),
            HIDDEN_ID(FLAG_HIDDEN_ITEM_ONE_ISLAND_TREASURE_BEACH_ULTRA_BALL_2),
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM
        }
    },
    {
        .mapGroup = MAP_GROUP(THREE_ISLAND_BOND_BRIDGE),
        .mapNum = MAP_NUM(THREE_ISLAND_BOND_BRIDGE),
        .rare = {
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM
        },
        .uncommon = {
            HIDDEN_ID(FLAG_HIDDEN_ITEM_THREE_ISLAND_BOND_BRIDGE_PEARL),
            HIDDEN_ID(FLAG_HIDDEN_ITEM_THREE_ISLAND_BOND_BRIDGE_STARDUST),
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM
        },
        .common = {
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM
        }
    },
    {
        .mapGroup = MAP_GROUP(FOUR_ISLAND),
        .mapNum = MAP_NUM(FOUR_ISLAND),
        .rare = {
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM
        },
        .uncommon = {
            HIDDEN_ID(FLAG_HIDDEN_ITEM_FOUR_ISLAND_PEARL),
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM
        },
        .common = {
            HIDDEN_ID(FLAG_HIDDEN_ITEM_FOUR_ISLAND_ULTRA_BALL),
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM
        }
    },
    {
        .mapGroup = MAP_GROUP(FIVE_ISLAND_MEMORIAL_PILLAR),
        .mapNum = MAP_NUM(FIVE_ISLAND_MEMORIAL_PILLAR),
        .rare = {
            HIDDEN_ID(FLAG_HIDDEN_ITEM_FIVE_ISLAND_MEMORIAL_PILLAR_BIG_PEARL),
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM
        },
        .uncommon = {
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM
        },
        .common = {
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM
        }
    },
    {
        .mapGroup = MAP_GROUP(FIVE_ISLAND_RESORT_GORGEOUS),
        .mapNum = MAP_NUM(FIVE_ISLAND_RESORT_GORGEOUS),
        .rare = {
            HIDDEN_ID(FLAG_HIDDEN_ITEM_FIVE_ISLAND_RESORT_GORGEOUS_NEST_BALL),
            HIDDEN_ID(FLAG_HIDDEN_ITEM_FIVE_ISLAND_RESORT_GORGEOUS_STAR_PIECE),
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM
        },
        .uncommon = {
            HIDDEN_ID(FLAG_HIDDEN_ITEM_FIVE_ISLAND_RESORT_GORGEOUS_STARDUST),
            HIDDEN_ID(FLAG_HIDDEN_ITEM_FIVE_ISLAND_RESORT_GORGEOUS_STARDUST_2),
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM
        },
        .common = {
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM
        }
    },
    {
        .mapGroup = MAP_GROUP(SIX_ISLAND_OUTCAST_ISLAND),
        .mapNum = MAP_NUM(SIX_ISLAND_OUTCAST_ISLAND),
        .rare = {
            HIDDEN_ID(FLAG_HIDDEN_ITEM_SIX_ISLAND_OUTCAST_ISLAND_STAR_PIECE),
            HIDDEN_ID(FLAG_HIDDEN_ITEM_SIX_ISLAND_OUTCAST_ISLAND_NET_BALL),
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM
        },
        .uncommon = {
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM
        },
        .common = {
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM
        }
    },
    {
        .mapGroup = MAP_GROUP(SIX_ISLAND_GREEN_PATH),
        .mapNum = MAP_NUM(SIX_ISLAND_GREEN_PATH),
        .rare = {
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM
        },
        .uncommon = {
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM
        },
        .common = {
            HIDDEN_ID(FLAG_HIDDEN_ITEM_SIX_ISLAND_GREEN_PATH_ULTRA_BALL),
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM
        }
    },
    {
        .mapGroup = MAP_GROUP(SEVEN_ISLAND_TRAINER_TOWER),
        .mapNum = MAP_NUM(SEVEN_ISLAND_TRAINER_TOWER),
        .rare = {
            HIDDEN_ID(FLAG_HIDDEN_ITEM_SEVEN_ISLAND_TRAINER_TOWER_BIG_PEARL),
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM
        },
        .uncommon = {
            HIDDEN_ID(FLAG_HIDDEN_ITEM_SEVEN_ISLAND_TRAINER_TOWER_PEARL),
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM
        },
        .common = {
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM,
            NO_ITEM
        }
    },
};

void SetAllRenewableItemFlags(void)
{
    u8 i, j;

    for (i = 0; i < ARRAY_COUNT(sRenewableHiddenItems); i++)
    {
        const u8 * rare = sRenewableHiddenItems[i].rare;
        const u8 * uncommon = sRenewableHiddenItems[i].uncommon;
        const u8 * common = sRenewableHiddenItems[i].common;
        for (j = 0; j < MAX_HIDDEN_ITEMS_PER_GROUP; j++)
        {
            if (rare[j] != NO_ITEM)
                FlagSet(FLAG_HIDDEN_ITEMS_START + rare[j]);
            if (uncommon[j] != NO_ITEM)
                FlagSet(FLAG_HIDDEN_ITEMS_START + uncommon[j]);
            if (common[j] != NO_ITEM)
                FlagSet(FLAG_HIDDEN_ITEMS_START + common[j]);
        }
    }
}

void IncrementRenewableHiddenItemStepCounter(void)
{
    u16 var = VarGet(VAR_RENEWABLE_ITEM_STEP_COUNTER);
    if (var < 1500)
    {
        VarSet(VAR_RENEWABLE_ITEM_STEP_COUNTER, var + 1);
    }
}

void TryRegenerateRenewableHiddenItems(void)
{
    u8 i;
    u8 found_map = 0xFF;
    for (i = 0; i < ARRAY_COUNT(sRenewableHiddenItems); i++)
    {
        if (sRenewableHiddenItems[i].mapGroup == gSaveBlock1Ptr->location.mapGroup
         && sRenewableHiddenItems[i].mapNum == gSaveBlock1Ptr->location.mapNum)
            found_map = i;
    }

    if (found_map == 0xFF)
        return;
    if (VarGet(VAR_RENEWABLE_ITEM_STEP_COUNTER) >= 1500)
    {
        VarSet(VAR_RENEWABLE_ITEM_STEP_COUNTER, 0);
        SetAllRenewableItemFlags();
        SampleRenewableItemFlags();
    }
}

static void SampleRenewableItemFlags(void)
{
    u8 i, j;
    const u8 * flags;
    u16 rval;

    for (i = 0; i < ARRAY_COUNT(sRenewableHiddenItems); i++)
    {
        rval = Random() % 100;
        if (rval >= 90)
            flags = sRenewableHiddenItems[i].rare;
        else if (rval >= 60)
            flags = sRenewableHiddenItems[i].uncommon;
        else
            flags = sRenewableHiddenItems[i].common;
        for (j = 0; j < MAX_HIDDEN_ITEMS_PER_GROUP; j++)
        {
            if (flags[j] != NO_ITEM)
                FlagClear(FLAG_HIDDEN_ITEMS_START + flags[j]);
        }
    }
}
