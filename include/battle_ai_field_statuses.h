#ifndef GUARD_BATTLE_AI_FIELD_STATUSES_H
#define GUARD_BATTLE_AI_FIELD_STATUSES_H

#include "battle_ai_main.h"
#include "battle_ai_util.h"

enum FieldEffectOutcome
{
    FIELD_EFFECT_POSITIVE,
    FIELD_EFFECT_NEUTRAL,
    FIELD_EFFECT_NEGATIVE,
    FIELD_EFFECT_BLOCKED,
};

bool32 WeatherChecker(u32 battler, u32 weather, enum FieldEffectOutcome desiredResult);
bool32 FieldStatusChecker(u32 battler, u32 fieldStatus, enum FieldEffectOutcome desiredResult);

#endif //GUARD_BATTLE_AI_FIELD_STATUSES_H
