#include "global.h"
#include "random.h"
#include "overworld.h"
#include "field_specials.h"
#include "constants/species.h"
#include "constants/maps.h"
#include "constants/region_map.h"

EWRAM_DATA u8 sLocationHistory[3][2] = {};
EWRAM_DATA u8 sRoamerLocation[2] = {};

#define saveRoamer (*(&gSaveBlock1Ptr->roamer))

enum
{
    MAP_GRP = 0, // map group
    MAP_NUM = 1, // map number
};

const u8 sRoamerLocations[][7] = {
    {MAP_NUM(ROUTE1), MAP_NUM(ROUTE2), MAP_NUM(ROUTE21_NORTH), MAP_NUM(ROUTE22), 0xff, 0xff, 0xff},
    {MAP_NUM(ROUTE2), MAP_NUM(ROUTE1), MAP_NUM(ROUTE3), MAP_NUM(ROUTE22), 0xff, 0xff, 0xff},
    {MAP_NUM(ROUTE3), MAP_NUM(ROUTE2), MAP_NUM(ROUTE4), 0xff, 0xff, 0xff, 0xff},
    {MAP_NUM(ROUTE4), MAP_NUM(ROUTE3), MAP_NUM(ROUTE5), MAP_NUM(ROUTE9), MAP_NUM(ROUTE24), 0xff, 0xff},
    {MAP_NUM(ROUTE5), MAP_NUM(ROUTE4), MAP_NUM(ROUTE6), MAP_NUM(ROUTE7), MAP_NUM(ROUTE8), MAP_NUM(ROUTE9), MAP_NUM(ROUTE24)},
    {MAP_NUM(ROUTE6), MAP_NUM(ROUTE5), MAP_NUM(ROUTE7), MAP_NUM(ROUTE8), MAP_NUM(ROUTE11), 0xff, 0xff},
    {MAP_NUM(ROUTE7), MAP_NUM(ROUTE5), MAP_NUM(ROUTE6), MAP_NUM(ROUTE8), MAP_NUM(ROUTE16), 0xff, 0xff},
    {MAP_NUM(ROUTE8), MAP_NUM(ROUTE5), MAP_NUM(ROUTE6), MAP_NUM(ROUTE7), MAP_NUM(ROUTE10), MAP_NUM(ROUTE12), 0xff},
    {MAP_NUM(ROUTE9), MAP_NUM(ROUTE4), MAP_NUM(ROUTE5), MAP_NUM(ROUTE10), MAP_NUM(ROUTE24), 0xff, 0xff},
    {MAP_NUM(ROUTE10), MAP_NUM(ROUTE8), MAP_NUM(ROUTE9), MAP_NUM(ROUTE12), 0xff, 0xff, 0xff},
    {MAP_NUM(ROUTE11), MAP_NUM(ROUTE6), MAP_NUM(ROUTE12), 0xff, 0xff, 0xff, 0xff},
    {MAP_NUM(ROUTE12), MAP_NUM(ROUTE10), MAP_NUM(ROUTE11), MAP_NUM(ROUTE13), 0xff, 0xff, 0xff},
    {MAP_NUM(ROUTE13), MAP_NUM(ROUTE12), MAP_NUM(ROUTE14), 0xff, 0xff, 0xff, 0xff},
    {MAP_NUM(ROUTE14), MAP_NUM(ROUTE13), MAP_NUM(ROUTE15), 0xff, 0xff, 0xff, 0xff},
    {MAP_NUM(ROUTE15), MAP_NUM(ROUTE14), MAP_NUM(ROUTE18), MAP_NUM(ROUTE19), 0xff, 0xff, 0xff},
    {MAP_NUM(ROUTE16), MAP_NUM(ROUTE7), MAP_NUM(ROUTE17), 0xff, 0xff, 0xff, 0xff},
    {MAP_NUM(ROUTE17), MAP_NUM(ROUTE16), MAP_NUM(ROUTE18), 0xff, 0xff, 0xff, 0xff},
    {MAP_NUM(ROUTE18), MAP_NUM(ROUTE15), MAP_NUM(ROUTE17), MAP_NUM(ROUTE19), 0xff, 0xff, 0xff},
    {MAP_NUM(ROUTE19), MAP_NUM(ROUTE15), MAP_NUM(ROUTE18), MAP_NUM(ROUTE20), 0xff, 0xff, 0xff},
    {MAP_NUM(ROUTE20), MAP_NUM(ROUTE19), MAP_NUM(ROUTE21_NORTH), 0xff, 0xff, 0xff, 0xff},
    {MAP_NUM(ROUTE21_NORTH), MAP_NUM(ROUTE1), MAP_NUM(ROUTE20), 0xff, 0xff, 0xff, 0xff},
    {MAP_NUM(ROUTE22), MAP_NUM(ROUTE1), MAP_NUM(ROUTE2), MAP_NUM(ROUTE23), 0xff, 0xff, 0xff},
    {MAP_NUM(ROUTE23), MAP_NUM(ROUTE22), MAP_NUM(ROUTE2), 0xff, 0xff, 0xff, 0xff},
    {MAP_NUM(ROUTE24), MAP_NUM(ROUTE4), MAP_NUM(ROUTE5), MAP_NUM(ROUTE9), 0xff, 0xff, 0xff},
    {MAP_NUM(ROUTE25), MAP_NUM(ROUTE24), MAP_NUM(ROUTE9), 0xff, 0xff, 0xff, 0xff},
    {0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff}
};

void ClearRoamerData(void)
{
    u32 i;
    gSaveBlock1Ptr->roamer = (struct Roamer){};
    sRoamerLocation[MAP_GRP] = 0;
    sRoamerLocation[MAP_NUM] = 0;
    for (i = 0; i < 3; i++)
    {
        sLocationHistory[i][MAP_GRP] = 0;
        sLocationHistory[i][MAP_NUM] = 0;
    }
}

#define GetRoamerSpecies() ({\
    u16 a;\
    switch (ScrSpecial_GetStarter())\
    {\
    default:\
        a = SPECIES_RAIKOU;\
        break;\
    case SPECIES_BULBASAUR:\
        a = SPECIES_ENTEI;\
        break;\
    case SPECIES_CHARMANDER:\
        a = SPECIES_SUICUNE;\
        break;\
    }\
    a;\
})

void CreateInitialRoamerMon(void)
{
    struct Pokemon * tmpMon = &gEnemyParty[0];
    u16 roamerMon;

    CreateMon(tmpMon, (roamerMon = GetRoamerSpecies()), 50, 0x20, 0, 0, 0, 0);
    saveRoamer.species = roamerMon;
    saveRoamer.level = 50;
    saveRoamer.status = 0;
    saveRoamer.active = TRUE;
    saveRoamer.ivs = GetMonData(tmpMon, MON_DATA_IVS);
    saveRoamer.personality = GetMonData(tmpMon, MON_DATA_PERSONALITY);
    saveRoamer.hp = GetMonData(tmpMon, MON_DATA_MAX_HP);
    saveRoamer.cool = GetMonData(tmpMon, MON_DATA_COOL);
    saveRoamer.beauty = GetMonData(tmpMon, MON_DATA_BEAUTY);
    saveRoamer.cute = GetMonData(tmpMon, MON_DATA_CUTE);
    saveRoamer.smart = GetMonData(tmpMon, MON_DATA_SMART);
    saveRoamer.tough = GetMonData(tmpMon, MON_DATA_TOUGH);
    sRoamerLocation[MAP_GRP] = 3;
    sRoamerLocation[MAP_NUM] = sRoamerLocations[Random() % (ARRAY_COUNT(sRoamerLocations) - 1)][0];
}

void InitRoamer(void)
{
    ClearRoamerData();
    CreateInitialRoamerMon();
}

void UpdateLocationHistoryForRoamer(void)
{
    sLocationHistory[2][MAP_GRP] = sLocationHistory[1][MAP_GRP];
    sLocationHistory[2][MAP_NUM] = sLocationHistory[1][MAP_NUM];
    sLocationHistory[1][MAP_GRP] = sLocationHistory[0][MAP_GRP];
    sLocationHistory[1][MAP_NUM] = sLocationHistory[0][MAP_NUM];
    sLocationHistory[0][MAP_GRP] = gSaveBlock1Ptr->location.mapGroup;
    sLocationHistory[0][MAP_NUM] = gSaveBlock1Ptr->location.mapNum;
}

void RoamerMoveToOtherLocationSet(void)
{
    u8 mapNum = 0;
    struct Roamer *roamer = &saveRoamer;

    if (!roamer->active)
        return;

    sRoamerLocation[MAP_GRP] = 3;

    while (1)
    {
        mapNum = sRoamerLocations[Random() % (ARRAY_COUNT(sRoamerLocations) - 1)][0];
        if (sRoamerLocation[MAP_NUM] != mapNum)
        {
            sRoamerLocation[MAP_NUM] = mapNum;
            return;
        }
    }
}


void RoamerMove(void)
{
    u8 locSet = 0;

    if ((Random() % 16) == 0)
    {
        RoamerMoveToOtherLocationSet();
    }
    else
    {
        struct Roamer *roamer = &saveRoamer;

        if (!roamer->active)
            return;

        while (locSet < (ARRAY_COUNT(sRoamerLocations) - 1))
        {
            if (sRoamerLocation[MAP_NUM] == sRoamerLocations[locSet][0])
            {
                u8 mapNum;
                while (1)
                {
                    mapNum = sRoamerLocations[locSet][(Random() % 6) + 1];
                    if (!(sLocationHistory[2][MAP_GRP] == 3 && sLocationHistory[2][MAP_NUM] == mapNum) && mapNum != 0xFF)
                        break;
                }
                sRoamerLocation[MAP_NUM] = mapNum;
                return;
            }
            locSet++;
        }
    }
}

bool8 IsRoamerAt(u8 mapGroup, u8 mapNum)
{
    struct Roamer *roamer = &saveRoamer;

    if (roamer->active && mapGroup == sRoamerLocation[MAP_GRP] && mapNum == sRoamerLocation[MAP_NUM])
        return TRUE;
    else
        return FALSE;
}

void CreateRoamerMonInstance(void)
{
    struct Pokemon *mon;
    struct Roamer *roamer;

    mon = &gEnemyParty[0];
    ZeroEnemyPartyMons();
    roamer = &saveRoamer;
    CreateMonWithIVsPersonality(mon, roamer->species, roamer->level, roamer->ivs, roamer->personality);
    SetMonData(mon, MON_DATA_STATUS, &gSaveBlock1Ptr->roamer.status);
    SetMonData(mon, MON_DATA_HP, &gSaveBlock1Ptr->roamer.hp);
    SetMonData(mon, MON_DATA_COOL, &gSaveBlock1Ptr->roamer.cool);
    SetMonData(mon, MON_DATA_BEAUTY, &gSaveBlock1Ptr->roamer.beauty);
    SetMonData(mon, MON_DATA_CUTE, &gSaveBlock1Ptr->roamer.cute);
    SetMonData(mon, MON_DATA_SMART, &gSaveBlock1Ptr->roamer.smart);
    SetMonData(mon, MON_DATA_TOUGH, &gSaveBlock1Ptr->roamer.tough);
}

bool8 TryStartRoamerEncounter(void)
{
    if (IsRoamerAt(gSaveBlock1Ptr->location.mapGroup, gSaveBlock1Ptr->location.mapNum) == TRUE && (Random() % 4) == 0)
    {
        CreateRoamerMonInstance();
        return TRUE;
    }
    else
    {
        return FALSE;
    }
}
void UpdateRoamerHPStatus(struct Pokemon *mon)
{
    saveRoamer.hp = GetMonData(mon, MON_DATA_HP);
    saveRoamer.status = GetMonData(mon, MON_DATA_STATUS);

    RoamerMoveToOtherLocationSet();
}

void SetRoamerInactive(void)
{
    struct Roamer *roamer = &saveRoamer;
    roamer->active = FALSE;
}

void GetRoamerLocation(u8 *mapGroup, u8 *mapNum)
{
    *mapGroup = sRoamerLocation[MAP_GRP];
    *mapNum = sRoamerLocation[MAP_NUM];
}

u16 GetRoamerLocationMapSectionId(void)
{
    struct Roamer *roamer = &saveRoamer;
    if (!saveRoamer.active)
        return MAPSEC_NONE;
    return Overworld_GetMapHeaderByGroupAndId(sRoamerLocation[MAP_GRP], sRoamerLocation[MAP_NUM])->regionMapSectionId;
}
