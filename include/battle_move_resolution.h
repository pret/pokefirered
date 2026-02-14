#ifndef GUARD_BATTLE_MOVE_RESOLUTION_H
#define GUARD_BATTLE_MOVE_RESOLUTION_H

#include "constants/battle_move_resolution.h"

enum CancelerResult DoAttackCanceler(void);
enum MoveEndResult DoMoveEnd(enum MoveEndState endMode, enum MoveEndState endState);
void MoveValuesCleanUp(void);

#endif // GUARD_BATTLE_MOVE_RESOLUTION_H
