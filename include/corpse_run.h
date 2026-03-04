#ifndef GUARD_CORPSE_RUN_H
#define GUARD_CORPSE_RUN_H

#include "global.h"

enum CorpseRunState
{
    CR_OFF = 0,
    CR_ACTIVE,
    CR_RECOVERED,
    CR_FAILED,
};

void CorpseRun_ResetSaveData(void);
void CorpseRun_HandlePlayerDefeat(void);
void CorpseRun_TryRecoverByTouch(void);
void CorpseRun_OnMapEnter(void);
void CorpseRun_DebugReset(void);

#endif // GUARD_CORPSE_RUN_H
