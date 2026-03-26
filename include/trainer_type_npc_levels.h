#ifndef GUARD_TRAINER_TYPE_NPC_LEVELS_H
#define GUARD_TRAINER_TYPE_NPC_LEVELS_H

#include "global.h"

struct NpcTrainerTypeLevelEntry
{
    u16 trainerId;
    u8 levels[NUMBER_OF_MON_TYPES];
};

extern const struct NpcTrainerTypeLevelEntry gNpcTrainerTypeLevelEntries[];
extern const u16 gNpcTrainerTypeLevelEntryCount;

#endif // GUARD_TRAINER_TYPE_NPC_LEVELS_H
