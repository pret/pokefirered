#ifndef GUARD_BATTLE_TERRAIN_H
#define GUARD_BATTLE_TERRAIN_H

#include "battle_bg.h"
#include "constants/battle.h"

struct BattleTerrain {
    u8 name[26];
    u16 naturePower;
    u16 secretPowerEffect;
    u8 camouflageType;
    struct BattleBackground background;
};

extern const struct BattleTerrain gBattleEnvironmentInfo[BATTLE_ENVIRONMENT_COUNT];

#endif // GUARD_BATTLE_TERRAIN_H
