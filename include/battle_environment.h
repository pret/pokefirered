#ifndef GUARD_BATTLE_ENVIRONMENT_H
#define GUARD_BATTLE_ENVIRONMENT_H

#include "battle_bg.h"
#include "constants/battle.h"

struct BattleEnvironmentInfo {
    u8 name[26];
    u16 naturePower;
    u16 secretPowerEffect;
    u8 camouflageType;
    struct BattleBackground background;
};

extern const struct BattleEnvironmentInfo gBattleEnvironmentInfo[BATTLE_ENVIRONMENT_COUNT];

#endif // GUARD_BATTLE_ENVIRONMENT_H
