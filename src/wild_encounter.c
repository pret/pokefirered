#include "global.h"
#include "random.h"
#include "wild_encounter.h"
#include "event_data.h"
#include "field_player_avatar.h"
#include "constants/species.h"
#include "constants/maps.h"
#include "constants/vars.h"
#include "constants/abilities.h"

struct UnkStruct_20386D0
{
    u8 filler_0[6];
    u16 unk_6;
    u8 unk_8;
    u8 unk_9;
};

EWRAM_DATA struct UnkStruct_20386D0 gUnknown_20386D0 = {};
EWRAM_DATA bool8 gUnknown_20386DC = FALSE;

extern const u8 gUnknown_83CA71C[][12];

bool8 UnlockedTanobyOrAreNotInTanoby(void);
u32 GenerateUnownPersonalityByLetter(u8 letter);
bool8 sub_808310C(u8 level);
u16 sub_808322C(void);
void ApplyFluteEncounterRateMod(u32 *rate);
void ApplyCleanseTagEncounterRateMod(u32 *rate);

void sub_8082740(bool8 state)
{
    gUnknown_20386DC = state;
}

u8 ChooseWildMonIndex_Land(void)
{
    u8 pct = Random() % 100;
    if (pct < 20)
        return 0;
    if (pct >= 20 && pct < 40)
        return 1;
    if (pct >= 40 && pct < 50)
        return 2;
    if (pct >= 50 && pct < 60)
        return 3;
    if (pct >= 60 && pct < 70)
        return 4;
    if (pct >= 70 && pct < 80)
        return 5;
    if (pct >= 80 && pct < 85)
        return 6;
    if (pct >= 85 && pct < 90)
        return 7;
    if (pct >= 90 && pct < 94)
        return 8;
    if (pct >= 94 && pct < 98)
        return 9;
    if (pct == 98)
        return 10;
    return 11;
}

u8 ChooseWildMonIndex_WaterRock(void)
{
    u8 pct = Random() % 100;
    if (pct < 60)
        return 0;
    if (pct >= 60 && pct < 90)
        return 1;
    if (pct >= 90 && pct < 95)
        return 2;
    if (pct >= 95 && pct < 99)
        return 3;
    return 4;
}

u8 ChooseWildMonIndex_Fishing(u8 rod)
{
    u8 slot = 0;
    u8 pct = Random() % 100;
    switch (rod)
    {
    case 0: // old
        if (pct < 70)
            slot = 0;
        else
            slot = 1;
        break;
    case 1:
        if (pct < 60)
            slot = 2;
        if (pct >= 60 && pct < 80)
            slot = 3;
        if (pct >= 80 && pct < 100)
            slot = 4;
        break;
    case 2:
        if (pct < 40)
            slot = 5;
        if (pct >= 40 && pct < 80)
            slot = 6;
        if (pct >= 80 && pct < 95)
            slot = 7;
        if (pct >= 95 && pct < 99)
            slot = 8;
        if (pct == 99)
            slot = 9;
        break;
    }
    return slot;
}

u8 ChooseWildMonLevel(const struct WildPokemon * info)
{
    u8 lo;
    u8 hi;
    u8 mod;
    u8 res;
    if (info->maxLevel >= info->minLevel)
    {
        lo = info->minLevel;
        hi = info->maxLevel;
    }
    else
    {
        lo = info->maxLevel;
        hi = info->minLevel;
    }
    mod = hi - lo + 1;
    res = Random() % mod;
    return lo + res;
}

u16 sub_8082934(void)
{
    u16 i;

    for (i = 0; ; i++)
    {
        const struct WildPokemonHeader *wildHeader = &gWildMonHeaders[i];
        if (wildHeader->mapGroup == 0xFF)
            break;

        if (gWildMonHeaders[i].mapGroup == gSaveBlock1Ptr->location.mapGroup &&
            gWildMonHeaders[i].mapNum == gSaveBlock1Ptr->location.mapNum)
        {
            if (gSaveBlock1Ptr->location.mapGroup == MAP_GROUP(SIX_ISLAND_ALTERING_CAVE) &&
                gSaveBlock1Ptr->location.mapNum == MAP_NUM(SIX_ISLAND_ALTERING_CAVE))
            {
                u16 alteringCaveId = VarGet(VAR_ALTERING_CAVE_WILD_SET);
                if (alteringCaveId > 8)
                    alteringCaveId = 0;

                i += alteringCaveId;
            }

            if (!UnlockedTanobyOrAreNotInTanoby())
                break;
            return i;
        }
    }

    return -1;
}

bool8 UnlockedTanobyOrAreNotInTanoby(void)
{
    if (FlagGet(FLAG_SYS_UNLOCKED_TANOBY_RUINS))
        return TRUE;
    if (gSaveBlock1Ptr->location.mapGroup != MAP_GROUP(SEVEN_ISLAND_TANOBY_RUINS_DILFORD_CHAMBER))
        return TRUE;
    if (!(gSaveBlock1Ptr->location.mapNum == MAP_NUM(SEVEN_ISLAND_TANOBY_RUINS_MONEAN_CHAMBER)
    ||  gSaveBlock1Ptr->location.mapNum == MAP_NUM(SEVEN_ISLAND_TANOBY_RUINS_LIPTOO_CHAMBER)
    ||  gSaveBlock1Ptr->location.mapNum == MAP_NUM(SEVEN_ISLAND_TANOBY_RUINS_WEEPTH_CHAMBER)
    ||  gSaveBlock1Ptr->location.mapNum == MAP_NUM(SEVEN_ISLAND_TANOBY_RUINS_DILFORD_CHAMBER)
    ||  gSaveBlock1Ptr->location.mapNum == MAP_NUM(SEVEN_ISLAND_TANOBY_RUINS_SCUFIB_CHAMBER)
    ||  gSaveBlock1Ptr->location.mapNum == MAP_NUM(SEVEN_ISLAND_TANOBY_RUINS_RIXY_CHAMBER)
    ||  gSaveBlock1Ptr->location.mapNum == MAP_NUM(SEVEN_ISLAND_TANOBY_RUINS_VIAPOIS_CHAMBER)
    ))
        return TRUE;
    return FALSE;
}

void GenerateWildMon(u16 species, u8 level, u8 slot)
{
    u32 personality;
    s8 chamber;
    ZeroEnemyPartyMons();
    if (species != SPECIES_UNOWN)
    {
        CreateMonWithNature(&gEnemyParty[0], species, level, 32, Random() % 25);
    }
    else
    {
        chamber = gSaveBlock1Ptr->location.mapNum - MAP_NUM(SEVEN_ISLAND_TANOBY_RUINS_MONEAN_CHAMBER);
        personality = GenerateUnownPersonalityByLetter(gUnknown_83CA71C[chamber][slot]);
        CreateMon(&gEnemyParty[0], species, level, 32, TRUE, personality, FALSE, 0);
    }
}

u32 GenerateUnownPersonalityByLetter(u8 letter)
{
    u32 personality;
    do
    {
        personality = (Random() << 16) | Random();
    } while (GetUnownLetterByPersonalityLoByte(personality) != letter);
    return personality;
}

u8 GetUnownLetterByPersonalityLoByte(u32 personality)
{
    return (((personality & 0x3000000) >> 18) | ((personality & 0x30000) >> 12) | ((personality & 0x300) >> 6) | (personality & 0x3)) % 0x1C;
}

bool8 sub_8082AEC(const struct WildPokemonInfo * info, u8 tableIdx, u8 a2)
{
    u8 slot = 0;
    u8 level;
    switch (tableIdx)
    {
    case 0:
        slot = ChooseWildMonIndex_Land();
        break;
    case 1:
        slot = ChooseWildMonIndex_WaterRock();
        break;
    case 2:
        slot = ChooseWildMonIndex_WaterRock();
        break;
    }
    level = ChooseWildMonLevel(&info->wildPokemon[slot]);
    if (a2 == 1 && !sub_808310C(level))
    {
        return FALSE;
    }
    GenerateWildMon(info->wildPokemon[slot].species, level, slot);
    return TRUE;
}

u16 sub_8082B64(const struct WildPokemonInfo * info, u8 rod)
{
    u8 slot = ChooseWildMonIndex_Fishing(rod);
    u8 level = ChooseWildMonLevel(&info->wildPokemon[slot]);
    GenerateWildMon(info->wildPokemon[slot].species, level, slot);
    return info->wildPokemon[slot].species;
}

bool8 DoWildEncounterRateDiceRoll(u16 a0)
{
    if (sub_808322C() % 1600 < a0)
        return TRUE;
    return FALSE;
}

bool8 sub_8082BCC(u32 encounterRate, bool8 ignoreAbility)
{
    encounterRate *= 16;
    if (TestPlayerAvatarFlags(PLAYER_AVATAR_FLAG_MACH_BIKE | PLAYER_AVATAR_FLAG_ACRO_BIKE))
        encounterRate = encounterRate * 80 / 100;
    encounterRate += gUnknown_20386D0.unk_6 * 16 / 200;
    ApplyFluteEncounterRateMod(&encounterRate);
    ApplyCleanseTagEncounterRateMod(&encounterRate);
    if (!ignoreAbility)
    {
        switch (gUnknown_20386D0.unk_9)
        {
        case 1:
            encounterRate /= 2;
            break;
        case 2:
            encounterRate *= 2;
            break;
        }
    }
    if (encounterRate > 1600)
        encounterRate = 1600;
    return DoWildEncounterRateDiceRoll(encounterRate);
}

u8 sub_8082C58(void)
{
    gUnknown_20386D0.unk_9 = 0;
    if (!GetMonData(&gPlayerParty[0], MON_DATA_SANITY_IS_EGG))
    {
        u8 ability = GetMonAbility(&gPlayerParty[0]);
        if (ability == ABILITY_STENCH)
            gUnknown_20386D0.unk_9 = 1;
        else if (ability == ABILITY_ILLUMINATE)
            gUnknown_20386D0.unk_9 = 2;
    }
    return gUnknown_20386D0.unk_9;
}

bool8 sub_8082C98(void)
{
    if ((Random() % 100) >= 60)
        return FALSE;
    return TRUE;
}
