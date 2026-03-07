#ifndef GUARD_CHASE_OVERWORLD_H
#define GUARD_CHASE_OVERWORLD_H

#include "global.h"

void ChaseOverworld_UpdateOverworldFrame(bool8 tookStep);
void ChaseOverworld_OnMapTransition(const struct WarpData *from, const struct WarpData *to);
void ChaseOverworld_OnChaseEnded(void);

#endif // GUARD_CHASE_OVERWORLD_H
