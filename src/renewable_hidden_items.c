#include "global.h"
#include "event_data.h"
#include "random.h"
#include "constants/maps.h"
#include "constants/flags.h"

struct UnkStruct_8479D34
{
    s8 mapGroup;
    s8 mapNum;
    u8 filler[2];
    u8 flags1[8];
    u8 flags2[8];
    u8 flags3[8];
};

void sub_815D96C(void);

const struct UnkStruct_8479D34 gUnknown_8479D34[] = {
    {
        .mapGroup = MAP_GROUP(ROUTE20),
        .mapNum = MAP_NUM(ROUTE20),
        .flags1 = {
            0xFF,
            0xFF,
            0xFF,
            0xFF,
            0xFF,
            0xFF,
            0xFF,
            0xFF
        },
        .flags2 = {
            HIDDEN_ITEM_ROUTE20_STARDUST,
            0xFF,
            0xFF,
            0xFF,
            0xFF,
            0xFF,
            0xFF,
            0xFF
        },
        .flags3 = {
            0xFF,
            0xFF,
            0xFF,
            0xFF,
            0xFF,
            0xFF,
            0xFF,
            0xFF
        }
    },
    {
        .mapGroup = MAP_GROUP(ROUTE21_NORTH),
        .mapNum = MAP_NUM(ROUTE21_NORTH),
        .flags1 = {
            0xFF,
            0xFF,
            0xFF,
            0xFF,
            0xFF,
            0xFF,
            0xFF,
            0xFF
        },
        .flags2 = {
            HIDDEN_ITEM_ROUTE21_NORTH_PEARL,
            0xFF,
            0xFF,
            0xFF,
            0xFF,
            0xFF,
            0xFF,
            0xFF
        },
        .flags3 = {
            0xFF,
            0xFF,
            0xFF,
            0xFF,
            0xFF,
            0xFF,
            0xFF,
            0xFF
        }
    },
    {
        .mapGroup = MAP_GROUP(UNDERGROUND_PATH_NORTH_SOUTH_TUNNEL),
        .mapNum = MAP_NUM(UNDERGROUND_PATH_NORTH_SOUTH_TUNNEL),
        .flags1 = {
            HIDDEN_ITEM_UNDERGROUND_PATH_NORTH_SOUTH_TUNNEL_ETHER,
            0xFF,
            0xFF,
            0xFF,
            0xFF,
            0xFF,
            0xFF,
            0xFF
        },
        .flags2 = {
            HIDDEN_ITEM_UNDERGROUND_PATH_NORTH_SOUTH_TUNNEL_POTION,
            HIDDEN_ITEM_UNDERGROUND_PATH_NORTH_SOUTH_TUNNEL_ANTIDOTE,
            HIDDEN_ITEM_UNDERGROUND_PATH_NORTH_SOUTH_TUNNEL_PARALYZE_HEAL,
            HIDDEN_ITEM_UNDERGROUND_PATH_NORTH_SOUTH_TUNNEL_AWAKENING,
            HIDDEN_ITEM_UNDERGROUND_PATH_NORTH_SOUTH_TUNNEL_BURN_HEAL,
            HIDDEN_ITEM_UNDERGROUND_PATH_NORTH_SOUTH_TUNNEL_ICE_HEAL,
            0xFF,
            0xFF
        },
        .flags3 = {
            0xFF,
            0xFF,
            0xFF,
            0xFF,
            0xFF,
            0xFF,
            0xFF,
            0xFF
        }
    },
    {
        .mapGroup = MAP_GROUP(UNDERGROUND_PATH_EAST_WEST_TUNNEL),
        .mapNum = MAP_NUM(UNDERGROUND_PATH_EAST_WEST_TUNNEL),
        .flags1 = {
            HIDDEN_ITEM_UNDERGROUND_PATH_EAST_WEST_TUNNEL_ETHER,
            0xFF,
            0xFF,
            0xFF,
            0xFF,
            0xFF,
            0xFF,
            0xFF
        },
        .flags2 = {
            HIDDEN_ITEM_UNDERGROUND_PATH_EAST_WEST_TUNNEL_POTION,
            HIDDEN_ITEM_UNDERGROUND_PATH_EAST_WEST_TUNNEL_ANTIDOTE,
            HIDDEN_ITEM_UNDERGROUND_PATH_EAST_WEST_TUNNEL_PARALYZE_HEAL,
            HIDDEN_ITEM_UNDERGROUND_PATH_EAST_WEST_TUNNEL_AWAKENING,
            HIDDEN_ITEM_UNDERGROUND_PATH_EAST_WEST_TUNNEL_BURN_HEAL,
            HIDDEN_ITEM_UNDERGROUND_PATH_EAST_WEST_TUNNEL_ICE_HEAL,
            0xFF,
            0xFF
        },
        .flags3 = {
            0xFF,
            0xFF,
            0xFF,
            0xFF,
            0xFF,
            0xFF,
            0xFF,
            0xFF
        }
    },
    {
        .mapGroup = MAP_GROUP(SEVEN_ISLAND_TANOBY_RUINS),
        .mapNum = MAP_NUM(SEVEN_ISLAND_TANOBY_RUINS),
        .flags1 = {
            HIDDEN_ITEM_SEVEN_ISLAND_TANOBY_RUINS_HEART_SCALE_4,
            HIDDEN_ITEM_SEVEN_ISLAND_TANOBY_RUINS_HEART_SCALE,
            HIDDEN_ITEM_SEVEN_ISLAND_TANOBY_RUINS_HEART_SCALE_2,
            HIDDEN_ITEM_SEVEN_ISLAND_TANOBY_RUINS_HEART_SCALE_3,
            0xFF,
            0xFF,
            0xFF,
            0xFF
        },
        .flags2 = {
            0xFF,
            0xFF,
            0xFF,
            0xFF,
            0xFF,
            0xFF,
            0xFF,
            0xFF
        },
        .flags3 = {
            0xFF,
            0xFF,
            0xFF,
            0xFF,
            0xFF,
            0xFF,
            0xFF,
            0xFF
        }
    },
    {
        .mapGroup = MAP_GROUP(MT_MOON_B1F),
        .mapNum = MAP_NUM(MT_MOON_B1F),
        .flags1 = {
            HIDDEN_ITEM_MT_MOON_B1F_TINY_MUSHROOM,
            HIDDEN_ITEM_MT_MOON_B1F_TINY_MUSHROOM_2,
            HIDDEN_ITEM_MT_MOON_B1F_TINY_MUSHROOM_3,
            HIDDEN_ITEM_MT_MOON_B1F_BIG_MUSHROOM,
            HIDDEN_ITEM_MT_MOON_B1F_BIG_MUSHROOM_2,
            HIDDEN_ITEM_MT_MOON_B1F_BIG_MUSHROOM_3,
            0xFF,
            0xFF
        },
        .flags2 = {
            HIDDEN_ITEM_MT_MOON_B1F_TINY_MUSHROOM,
            HIDDEN_ITEM_MT_MOON_B1F_TINY_MUSHROOM_2,
            HIDDEN_ITEM_MT_MOON_B1F_TINY_MUSHROOM_3,
            0xFF,
            0xFF,
            0xFF,
            0xFF,
            0xFF
        },
        .flags3 = {
            0xFF,
            0xFF,
            0xFF,
            0xFF,
            0xFF,
            0xFF,
            0xFF,
            0xFF
        }
    },
    {
        .mapGroup = MAP_GROUP(THREE_ISLAND_BERRY_FOREST),
        .mapNum = MAP_NUM(THREE_ISLAND_BERRY_FOREST),
        .flags1 = {
            HIDDEN_ITEM_THREE_ISLAND_BERRY_FOREST_BLUK_BERRY,
            HIDDEN_ITEM_THREE_ISLAND_BERRY_FOREST_WEPEAR_BERRY,
            HIDDEN_ITEM_THREE_ISLAND_BERRY_FOREST_ORAN_BERRY,
            HIDDEN_ITEM_THREE_ISLAND_BERRY_FOREST_CHERI_BERRY,
            HIDDEN_ITEM_THREE_ISLAND_BERRY_FOREST_ASPEAR_BERRY,
            HIDDEN_ITEM_THREE_ISLAND_BERRY_FOREST_PERSIM_BERRY,
            HIDDEN_ITEM_THREE_ISLAND_BERRY_FOREST_PINAP_BERRY,
            HIDDEN_ITEM_THREE_ISLAND_BERRY_FOREST_LUM_BERRY
        },
        .flags2 = {
            HIDDEN_ITEM_THREE_ISLAND_BERRY_FOREST_BLUK_BERRY,
            HIDDEN_ITEM_THREE_ISLAND_BERRY_FOREST_WEPEAR_BERRY,
            HIDDEN_ITEM_THREE_ISLAND_BERRY_FOREST_ORAN_BERRY,
            HIDDEN_ITEM_THREE_ISLAND_BERRY_FOREST_CHERI_BERRY,
            HIDDEN_ITEM_THREE_ISLAND_BERRY_FOREST_ASPEAR_BERRY,
            HIDDEN_ITEM_THREE_ISLAND_BERRY_FOREST_PERSIM_BERRY,
            HIDDEN_ITEM_THREE_ISLAND_BERRY_FOREST_PINAP_BERRY,
            0xFF
        },
        .flags3 = {
            HIDDEN_ITEM_THREE_ISLAND_BERRY_FOREST_RAZZ_BERRY,
            HIDDEN_ITEM_THREE_ISLAND_BERRY_FOREST_NANAB_BERRY,
            HIDDEN_ITEM_THREE_ISLAND_BERRY_FOREST_CHESTO_BERRY,
            HIDDEN_ITEM_THREE_ISLAND_BERRY_FOREST_PECHA_BERRY,
            HIDDEN_ITEM_THREE_ISLAND_BERRY_FOREST_RAWST_BERRY,
            0xFF,
            0xFF,
            0xFF
        }
    },
    {
        .mapGroup = MAP_GROUP(ONE_ISLAND_TREASURE_BEACH),
        .mapNum = MAP_NUM(ONE_ISLAND_TREASURE_BEACH),
        .flags1 = {
            HIDDEN_ITEM_ONE_ISLAND_TREASURE_BEACH_ULTRA_BALL,
            HIDDEN_ITEM_ONE_ISLAND_TREASURE_BEACH_ULTRA_BALL_2,
            HIDDEN_ITEM_ONE_ISLAND_TREASURE_BEACH_STAR_PIECE,
            HIDDEN_ITEM_ONE_ISLAND_TREASURE_BEACH_BIG_PEARL,
            0xFF,
            0xFF,
            0xFF,
            0xFF
        },
        .flags2 = {
            HIDDEN_ITEM_ONE_ISLAND_TREASURE_BEACH_STARDUST,
            HIDDEN_ITEM_ONE_ISLAND_TREASURE_BEACH_STARDUST_2,
            HIDDEN_ITEM_ONE_ISLAND_TREASURE_BEACH_PEARL,
            HIDDEN_ITEM_ONE_ISLAND_TREASURE_BEACH_PEARL_2,
            HIDDEN_ITEM_ONE_ISLAND_TREASURE_BEACH_ULTRA_BALL,
            HIDDEN_ITEM_ONE_ISLAND_TREASURE_BEACH_ULTRA_BALL_2,
            0xFF,
            0xFF
        },
        .flags3 = {
            HIDDEN_ITEM_ONE_ISLAND_TREASURE_BEACH_ULTRA_BALL,
            HIDDEN_ITEM_ONE_ISLAND_TREASURE_BEACH_ULTRA_BALL_2,
            0xFF,
            0xFF,
            0xFF,
            0xFF,
            0xFF,
            0xFF
        }
    },
    {
        .mapGroup = MAP_GROUP(THREE_ISLAND_BOND_BRIDGE),
        .mapNum = MAP_NUM(THREE_ISLAND_BOND_BRIDGE),
        .flags1 = {
            0xFF,
            0xFF,
            0xFF,
            0xFF,
            0xFF,
            0xFF,
            0xFF,
            0xFF
        },
        .flags2 = {
            HIDDEN_ITEM_THREE_ISLAND_BOND_BRIDGE_PEARL,
            HIDDEN_ITEM_THREE_ISLAND_BOND_BRIDGE_STARDUST,
            0xFF,
            0xFF,
            0xFF,
            0xFF,
            0xFF,
            0xFF
        },
        .flags3 = {
            0xFF,
            0xFF,
            0xFF,
            0xFF,
            0xFF,
            0xFF,
            0xFF,
            0xFF
        }
    },
    {
        .mapGroup = MAP_GROUP(FOUR_ISLAND),
        .mapNum = MAP_NUM(FOUR_ISLAND),
        .flags1 = {
            0xFF,
            0xFF,
            0xFF,
            0xFF,
            0xFF,
            0xFF,
            0xFF,
            0xFF
        },
        .flags2 = {
            HIDDEN_ITEM_FOUR_ISLAND_PEARL,
            0xFF,
            0xFF,
            0xFF,
            0xFF,
            0xFF,
            0xFF,
            0xFF
        },
        .flags3 = {
            HIDDEN_ITEM_FOUR_ISLAND_ULTRA_BALL,
            0xFF,
            0xFF,
            0xFF,
            0xFF,
            0xFF,
            0xFF,
            0xFF
        }
    },
    {
        .mapGroup = MAP_GROUP(FIVE_ISLAND_MEMORIAL_PILLAR),
        .mapNum = MAP_NUM(FIVE_ISLAND_MEMORIAL_PILLAR),
        .flags1 = {
            HIDDEN_ITEM_FIVE_ISLAND_MEMORIAL_PILLAR_BIG_PEARL,
            0xFF,
            0xFF,
            0xFF,
            0xFF,
            0xFF,
            0xFF,
            0xFF
        },
        .flags2 = {
            0xFF,
            0xFF,
            0xFF,
            0xFF,
            0xFF,
            0xFF,
            0xFF,
            0xFF
        },
        .flags3 = {
            0xFF,
            0xFF,
            0xFF,
            0xFF,
            0xFF,
            0xFF,
            0xFF,
            0xFF
        }
    },
    {
        .mapGroup = MAP_GROUP(FIVE_ISLAND_RESORT_GORGEOUS),
        .mapNum = MAP_NUM(FIVE_ISLAND_RESORT_GORGEOUS),
        .flags1 = {
            HIDDEN_ITEM_FIVE_ISLAND_RESORT_GORGEOUS_NEST_BALL,
            HIDDEN_ITEM_FIVE_ISLAND_RESORT_GORGEOUS_STAR_PIECE,
            0xFF,
            0xFF,
            0xFF,
            0xFF,
            0xFF,
            0xFF
        },
        .flags2 = {
            HIDDEN_ITEM_FIVE_ISLAND_RESORT_GORGEOUS_STARDUST,
            HIDDEN_ITEM_FIVE_ISLAND_RESORT_GORGEOUS_STARDUST_2,
            0xFF,
            0xFF,
            0xFF,
            0xFF,
            0xFF,
            0xFF
        },
        .flags3 = {
            0xFF,
            0xFF,
            0xFF,
            0xFF,
            0xFF,
            0xFF,
            0xFF,
            0xFF
        }
    },
    {
        .mapGroup = MAP_GROUP(SIX_ISLAND_OUTCAST_ISLAND),
        .mapNum = MAP_NUM(SIX_ISLAND_OUTCAST_ISLAND),
        .flags1 = {
            HIDDEN_ITEM_SIX_ISLAND_OUTCAST_ISLAND_STAR_PIECE,
            HIDDEN_ITEM_SIX_ISLAND_OUTCAST_ISLAND_NET_BALL,
            0xFF,
            0xFF,
            0xFF,
            0xFF,
            0xFF,
            0xFF
        },
        .flags2 = {
            0xFF,
            0xFF,
            0xFF,
            0xFF,
            0xFF,
            0xFF,
            0xFF,
            0xFF
        },
        .flags3 = {
            0xFF,
            0xFF,
            0xFF,
            0xFF,
            0xFF,
            0xFF,
            0xFF,
            0xFF
        }
    },
    {
        .mapGroup = MAP_GROUP(SIX_ISLAND_GREEN_PATH),
        .mapNum = MAP_NUM(SIX_ISLAND_GREEN_PATH),
        .flags1 = {
            0xFF,
            0xFF,
            0xFF,
            0xFF,
            0xFF,
            0xFF,
            0xFF,
            0xFF
        },
        .flags2 = {
            0xFF,
            0xFF,
            0xFF,
            0xFF,
            0xFF,
            0xFF,
            0xFF,
            0xFF
        },
        .flags3 = {
            HIDDEN_ITEM_SIX_ISLAND_GREEN_PATH_ULTRA_BALL,
            0xFF,
            0xFF,
            0xFF,
            0xFF,
            0xFF,
            0xFF,
            0xFF
        }
    },
    {
        .mapGroup = MAP_GROUP(SEVEN_ISLAND_TRAINER_TOWER),
        .mapNum = MAP_NUM(SEVEN_ISLAND_TRAINER_TOWER),
        .flags1 = {
            HIDDEN_ITEM_SEVEN_ISLAND_TRAINER_TOWER_BIG_PEARL,
            0xFF,
            0xFF,
            0xFF,
            0xFF,
            0xFF,
            0xFF,
            0xFF
        },
        .flags2 = {
            HIDDEN_ITEM_SEVEN_ISLAND_TRAINER_TOWER_PEARL,
            0xFF,
            0xFF,
            0xFF,
            0xFF,
            0xFF,
            0xFF,
            0xFF
        },
        .flags3 = {
            0xFF,
            0xFF,
            0xFF,
            0xFF,
            0xFF,
            0xFF,
            0xFF,
            0xFF
        }
    },
};

bool32 sub_815D834(void)
{
    // Stubbed out?
    return FALSE;
}

void sub_815D838(void)
{
    u8 i, j;

    for (i = 0; i < 15; i++)
    {
        const u8 * flags1 = gUnknown_8479D34[i].flags1;
        const u8 * flags2 = gUnknown_8479D34[i].flags2;
        const u8 * flags3 = gUnknown_8479D34[i].flags3;
        for (j = 0; j < 8; j++)
        {
            if (flags1[j] != 0xFF)
                FlagSet(FLAG_HIDDEN_ITEMS_START + flags1[j]);
            if (flags2[j] != 0xFF)
                FlagSet(FLAG_HIDDEN_ITEMS_START + flags2[j]);
            if (flags3[j] != 0xFF)
                FlagSet(FLAG_HIDDEN_ITEMS_START + flags3[j]);
        }
    }
}

void sub_815D8C8(void)
{
    u16 var = VarGet(VAR_0x4023);
    if (var < 1500) {
        VarSet(VAR_0x4023, var + 1);
    }
}

void sub_815D8F8(void)
{
    u8 i;
    u8 found_map = 0xFF;
    for (i = 0; i < 15; i++)
    {
        if (gUnknown_8479D34[i].mapGroup == gSaveBlock1Ptr->location.mapGroup && gUnknown_8479D34[i].mapNum == gSaveBlock1Ptr->location.mapNum)
            found_map = i;
    }

    if (found_map == 0xFF)
        return;
    if (VarGet(VAR_0x4023) >= 1500)
    {
        VarSet(VAR_0x4023, 0);
        sub_815D838();
        sub_815D96C();
    }
}

void sub_815D96C(void)
{
    u8 i, j;
    const u8 * flags;
    u16 rval;

    for (i = 0; i < 15; i++)
    {
        rval = Random() % 100;
        if (rval >= 90)
            flags = gUnknown_8479D34[i].flags1;
        else if (rval >= 60)
            flags = gUnknown_8479D34[i].flags2;
        else
            flags = gUnknown_8479D34[i].flags3;
        for (j = 0; j < 8; j++)
        {
            if (flags[j] != 0xFF)
                FlagClear(FLAG_HIDDEN_ITEMS_START + flags[j]);
        }
    }
}

