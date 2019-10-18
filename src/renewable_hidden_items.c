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
            FLAG_0x481 - FLAG_HIDDEN_ITEMS_START,
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
            FLAG_0x482 - FLAG_HIDDEN_ITEMS_START,
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
            FLAG_0x434 - FLAG_HIDDEN_ITEMS_START,
            0xFF,
            0xFF,
            0xFF,
            0xFF,
            0xFF,
            0xFF,
            0xFF
        },
        .flags2 = {
            FLAG_0x42E - FLAG_HIDDEN_ITEMS_START,
            FLAG_0x42F - FLAG_HIDDEN_ITEMS_START,
            FLAG_0x430 - FLAG_HIDDEN_ITEMS_START,
            FLAG_0x431 - FLAG_HIDDEN_ITEMS_START,
            FLAG_0x432 - FLAG_HIDDEN_ITEMS_START,
            FLAG_0x433 - FLAG_HIDDEN_ITEMS_START,
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
            FLAG_0x43B - FLAG_HIDDEN_ITEMS_START,
            0xFF,
            0xFF,
            0xFF,
            0xFF,
            0xFF,
            0xFF,
            0xFF
        },
        .flags2 = {
            FLAG_0x435 - FLAG_HIDDEN_ITEMS_START,
            FLAG_0x436 - FLAG_HIDDEN_ITEMS_START,
            FLAG_0x437 - FLAG_HIDDEN_ITEMS_START,
            FLAG_0x438 - FLAG_HIDDEN_ITEMS_START,
            FLAG_0x439 - FLAG_HIDDEN_ITEMS_START,
            FLAG_0x43A - FLAG_HIDDEN_ITEMS_START,
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
            FLAG_0x428 - FLAG_HIDDEN_ITEMS_START,
            FLAG_0x429 - FLAG_HIDDEN_ITEMS_START,
            FLAG_0x42A - FLAG_HIDDEN_ITEMS_START,
            FLAG_0x42B - FLAG_HIDDEN_ITEMS_START,
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
            FLAG_0x43C - FLAG_HIDDEN_ITEMS_START,
            FLAG_0x43D - FLAG_HIDDEN_ITEMS_START,
            FLAG_0x43E - FLAG_HIDDEN_ITEMS_START,
            FLAG_0x43F - FLAG_HIDDEN_ITEMS_START,
            FLAG_0x440 - FLAG_HIDDEN_ITEMS_START,
            FLAG_0x441 - FLAG_HIDDEN_ITEMS_START,
            0xFF,
            0xFF
        },
        .flags2 = {
            FLAG_0x43C - FLAG_HIDDEN_ITEMS_START,
            FLAG_0x43D - FLAG_HIDDEN_ITEMS_START,
            FLAG_0x43E - FLAG_HIDDEN_ITEMS_START,
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
            FLAG_0x443 - FLAG_HIDDEN_ITEMS_START,
            FLAG_0x445 - FLAG_HIDDEN_ITEMS_START,
            FLAG_0x446 - FLAG_HIDDEN_ITEMS_START,
            FLAG_0x447 - FLAG_HIDDEN_ITEMS_START,
            FLAG_0x44B - FLAG_HIDDEN_ITEMS_START,
            FLAG_0x44C - FLAG_HIDDEN_ITEMS_START,
            FLAG_0x44D - FLAG_HIDDEN_ITEMS_START,
            FLAG_0x44E - FLAG_HIDDEN_ITEMS_START
        },
        .flags2 = {
            FLAG_0x443 - FLAG_HIDDEN_ITEMS_START,
            FLAG_0x445 - FLAG_HIDDEN_ITEMS_START,
            FLAG_0x446 - FLAG_HIDDEN_ITEMS_START,
            FLAG_0x447 - FLAG_HIDDEN_ITEMS_START,
            FLAG_0x44B - FLAG_HIDDEN_ITEMS_START,
            FLAG_0x44C - FLAG_HIDDEN_ITEMS_START,
            FLAG_0x44D - FLAG_HIDDEN_ITEMS_START,
            0xFF
        },
        .flags3 = {
            FLAG_0x442 - FLAG_HIDDEN_ITEMS_START,
            FLAG_0x444 - FLAG_HIDDEN_ITEMS_START,
            FLAG_0x448 - FLAG_HIDDEN_ITEMS_START,
            FLAG_0x449 - FLAG_HIDDEN_ITEMS_START,
            FLAG_0x44A - FLAG_HIDDEN_ITEMS_START,
            0xFF,
            0xFF,
            0xFF
        }
    },
    {
        .mapGroup = MAP_GROUP(ONE_ISLAND_TREASURE_BEACH),
        .mapNum = MAP_NUM(ONE_ISLAND_TREASURE_BEACH),
        .flags1 = {
            FLAG_0x453 - FLAG_HIDDEN_ITEMS_START,
            FLAG_0x454 - FLAG_HIDDEN_ITEMS_START,
            FLAG_0x455 - FLAG_HIDDEN_ITEMS_START,
            FLAG_0x456 - FLAG_HIDDEN_ITEMS_START,
            0xFF,
            0xFF,
            0xFF,
            0xFF
        },
        .flags2 = {
            FLAG_0x44F - FLAG_HIDDEN_ITEMS_START,
            FLAG_0x450 - FLAG_HIDDEN_ITEMS_START,
            FLAG_0x451 - FLAG_HIDDEN_ITEMS_START,
            FLAG_0x452 - FLAG_HIDDEN_ITEMS_START,
            FLAG_0x453 - FLAG_HIDDEN_ITEMS_START,
            FLAG_0x454 - FLAG_HIDDEN_ITEMS_START,
            0xFF,
            0xFF
        },
        .flags3 = {
            FLAG_0x453 - FLAG_HIDDEN_ITEMS_START,
            FLAG_0x454 - FLAG_HIDDEN_ITEMS_START,
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
            FLAG_0x48E - FLAG_HIDDEN_ITEMS_START,
            FLAG_0x48F - FLAG_HIDDEN_ITEMS_START,
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
            FLAG_0x490 - FLAG_HIDDEN_ITEMS_START,
            0xFF,
            0xFF,
            0xFF,
            0xFF,
            0xFF,
            0xFF,
            0xFF
        },
        .flags3 = {
            FLAG_0x491 - FLAG_HIDDEN_ITEMS_START,
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
            FLAG_0x492 - FLAG_HIDDEN_ITEMS_START,
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
            FLAG_0x496 - FLAG_HIDDEN_ITEMS_START,
            FLAG_0x498 - FLAG_HIDDEN_ITEMS_START,
            0xFF,
            0xFF,
            0xFF,
            0xFF,
            0xFF,
            0xFF
        },
        .flags2 = {
            FLAG_0x497 - FLAG_HIDDEN_ITEMS_START,
            FLAG_0x499 - FLAG_HIDDEN_ITEMS_START,
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
            FLAG_0x49A - FLAG_HIDDEN_ITEMS_START,
            FLAG_0x49B - FLAG_HIDDEN_ITEMS_START,
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
            FLAG_0x49C - FLAG_HIDDEN_ITEMS_START,
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
            FLAG_0x4A1 - FLAG_HIDDEN_ITEMS_START,
            0xFF,
            0xFF,
            0xFF,
            0xFF,
            0xFF,
            0xFF,
            0xFF
        },
        .flags2 = {
            FLAG_0x4A2 - FLAG_HIDDEN_ITEMS_START,
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

