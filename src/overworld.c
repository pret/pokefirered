#include "global.h"
#include "gflib.h"
#include "event_data.h"
#include "event_scripts.h"
#include "field_specials.h"
#include "load_save.h"
#include "money.h"
#include "overworld.h"
#include "roamer.h"
#include "script.h"
#include "script_pokemon_util.h"
#include "constants/maps.h"
#include "constants/flags.h"

struct InitialPlayerAvatarState
{
    u8 transitionFlags;
    u8 direction;
    u8 unk2;
};


EWRAM_DATA struct WarpData gUnknown_2031DB4 = {};
EWRAM_DATA struct WarpData gUnknown_2031DBC = {};
EWRAM_DATA struct WarpData gUnknown_2031DC4 = {};
EWRAM_DATA struct WarpData gUnknown_2031DCC = {};
EWRAM_DATA struct InitialPlayerAvatarState gUnknown_2031DD4 = {};

u8 CountBadgesForOverworldWhiteOutLossCalculation(void);
void Overworld_ResetStateAfterWhitingOut(void);
void Overworld_SetWhiteoutRespawnPoint(void);
void sub_805610C(void);

static const u8 sWhiteOutMoneyLossMultipliers[] = {
     2,
     4,
     6,
     9,
    12,
    16,
    20,
    25,
    30
};

const u16 sWhiteOutMoneyLossBadgeFlagIDs[] = {
    FLAG_BADGE01_GET,
    FLAG_BADGE02_GET,
    FLAG_BADGE03_GET,
    FLAG_BADGE04_GET,
    FLAG_BADGE05_GET,
    FLAG_BADGE06_GET,
    FLAG_BADGE07_GET,
    FLAG_BADGE08_GET
};

void sub_8054BC8(void)
{
    ScriptContext2_RunNewScript(EventScript_ResetEliteFourEnd);
    RemoveMoney(&gSaveBlock1Ptr->money, ComputeWhiteOutMoneyLoss());
    HealPlayerParty();
    Overworld_ResetStateAfterWhitingOut();
    Overworld_SetWhiteoutRespawnPoint();
    WarpIntoMap();
}

u32 ComputeWhiteOutMoneyLoss(void)
{
    u8 nbadges = CountBadgesForOverworldWhiteOutLossCalculation();
    u8 toplevel = GetPlayerPartyHighestLevel();
    u32 losings = toplevel * 4 * sWhiteOutMoneyLossMultipliers[nbadges];
    u32 money = GetMoney(&gSaveBlock1Ptr->money);
    if (losings > money)
        losings = money;
    return losings;
}

void OverworldWhiteOutGetMoneyLoss(void)
{
    u32 losings = ComputeWhiteOutMoneyLoss();
    ConvertIntToDecimalStringN(gStringVar1, losings, STR_CONV_MODE_LEFT_ALIGN, CountDigits(losings));
}

u8 CountBadgesForOverworldWhiteOutLossCalculation(void)
{
    int i;
    u8 nbadges = 0;
    for (i = 0; i < NELEMS(sWhiteOutMoneyLossBadgeFlagIDs); i++)
    {
        if (FlagGet(sWhiteOutMoneyLossBadgeFlagIDs[i]))
            nbadges++;
    }
    return nbadges;
}

void Overworld_ResetStateAfterFly(void)
{
    ResetInitialPlayerAvatarState();
    FlagClear(FLAG_SYS_ON_CYCLING_ROAD);
    VarSet(VAR_MAP_SCENE_ROUTE16, 0);
    FlagClear(FLAG_SYS_UNK_802);
    FlagClear(FLAG_SYS_SAFARI_MODE);
    VarSet(VAR_MAP_SCENE_FUCHSIA_CITY_SAFARI_ZONE_ENTRANCE, 0);
    FlagClear(FLAG_SYS_USE_STRENGTH);
    FlagClear(FLAG_SYS_FLASH_ACTIVE);
    FlagClear(FLAG_0x808);
    VarSet(VAR_0x404D, 0);
}

void Overworld_ResetStateAfterTeleport(void)
{
    ResetInitialPlayerAvatarState();
    FlagClear(FLAG_SYS_ON_CYCLING_ROAD);
    VarSet(VAR_MAP_SCENE_ROUTE16, 0);
    FlagClear(FLAG_SYS_UNK_802);
    FlagClear(FLAG_SYS_SAFARI_MODE);
    VarSet(VAR_MAP_SCENE_FUCHSIA_CITY_SAFARI_ZONE_ENTRANCE, 0);
    FlagClear(FLAG_SYS_USE_STRENGTH);
    FlagClear(FLAG_SYS_FLASH_ACTIVE);
    FlagClear(FLAG_0x808);
    VarSet(VAR_0x404D, 0);
}

void Overworld_ResetStateAfterDigEscRope(void)
{
    ResetInitialPlayerAvatarState();
    FlagClear(FLAG_SYS_ON_CYCLING_ROAD);
    VarSet(VAR_MAP_SCENE_ROUTE16, 0);
    FlagClear(FLAG_SYS_UNK_802);
    FlagClear(FLAG_SYS_SAFARI_MODE);
    VarSet(VAR_MAP_SCENE_FUCHSIA_CITY_SAFARI_ZONE_ENTRANCE, 0);
    FlagClear(FLAG_SYS_USE_STRENGTH);
    FlagClear(FLAG_SYS_FLASH_ACTIVE);
    FlagClear(FLAG_0x808);
    VarSet(VAR_0x404D, 0);
}

void Overworld_ResetStateAfterWhitingOut(void)
{
    ResetInitialPlayerAvatarState();
    FlagClear(FLAG_SYS_ON_CYCLING_ROAD);
    VarSet(VAR_MAP_SCENE_ROUTE16, 0);
    FlagClear(FLAG_SYS_UNK_802);
    FlagClear(FLAG_SYS_SAFARI_MODE);
    VarSet(VAR_MAP_SCENE_FUCHSIA_CITY_SAFARI_ZONE_ENTRANCE, 0);
    FlagClear(FLAG_SYS_USE_STRENGTH);
    FlagClear(FLAG_SYS_FLASH_ACTIVE);
    FlagClear(FLAG_0x808);
    VarSet(VAR_0x404D, 0);
}

void sub_8054E40(void)
{
    FlagClear(FLAG_SYS_SAFARI_MODE);
    VarSet(VAR_MAP_SCENE_FUCHSIA_CITY_SAFARI_ZONE_ENTRANCE, 0);
    sub_805610C();
    UpdateLocationHistoryForRoamer();
    RoamerMoveToOtherLocationSet();
}

void ResetGameStats(void)
{
    int i;

    for (i = 0; i < NUM_GAME_STATS; i++)
    {
        gSaveBlock1Ptr->gameStats[i] = 0;
    }
}

void IncrementGameStat(u8 statId)
{
    u32 statVal;
    if (statId >= NUM_USED_GAME_STATS)
        return;
    statVal = GetGameStat(statId);
    if (statVal < 0xFFFFFF)
        statVal++;
    else
        statVal = 0xFFFFFF;
    SetGameStat(statId, statVal);
}

u32 GetGameStat(u8 statId)
{
    if (statId >= NUM_USED_GAME_STATS)
        return 0;
    else
        return gSaveBlock1Ptr->gameStats[statId] ^ gSaveBlock2Ptr->encryptionKey;
}

void SetGameStat(u8 statId, u32 statVal)
{
    if (statId >= NUM_USED_GAME_STATS)
        return;
    gSaveBlock1Ptr->gameStats[statId] = statVal ^ gSaveBlock2Ptr->encryptionKey;
}

void sub_8054F38(u32 newKey)
{
    u8 i;
    for (i = 0; i < NUM_GAME_STATS; i++)
    {
        ApplyNewEncryptionKeyToWord(&gSaveBlock1Ptr->gameStats[i], newKey);
    }
}
