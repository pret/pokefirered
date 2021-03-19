#ifndef GUARD_QUEST_LOG_PLAYER_H
#define GUARD_QUEST_LOG_PLAYER_H

#include "global.h"

#define QL_PLAYER_GFX_NORMAL          0
#define QL_PLAYER_GFX_BIKE            1
#define QL_PLAYER_GFX_FISH            2
#define QL_PLAYER_GFX_SURF            3
#define QL_PLAYER_GFX_STOP_SURF_S     4
#define QL_PLAYER_GFX_STOP_SURF_N     5
#define QL_PLAYER_GFX_STOP_SURF_W     6
#define QL_PLAYER_GFX_STOP_SURF_E     7
#define QL_PLAYER_GFX_VSSEEKER        8

void QuestLogUpdatePlayerSprite(u8 state);
bool32 QuestLogTryRecordPlayerAvatarGfxTransition(u8 state);
void QuestLogCallUpdatePlayerSprite(u8 state);

#endif //GUARD_QUEST_LOG_PLAYER_H
