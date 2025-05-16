#ifndef GUARD_QUEST_LOG_PLAYER_H
#define GUARD_QUEST_LOG_PLAYER_H

#include "global.h"

enum {
    QL_PLAYER_GFX_NORMAL,
    QL_PLAYER_GFX_BIKE,
    QL_PLAYER_GFX_FISH,
    QL_PLAYER_GFX_SURF,
    QL_PLAYER_GFX_STOP_SURF_S,
    QL_PLAYER_GFX_STOP_SURF_N,
    QL_PLAYER_GFX_STOP_SURF_W,
    QL_PLAYER_GFX_STOP_SURF_E,
    QL_PLAYER_GFX_VSSEEKER,
    QL_PLAYER_GFX_NONE = 0xFF
};


void QuestLogUpdatePlayerSprite(u8 state);
bool32 QuestLogTryRecordPlayerAvatarGfxTransition(u8 state);
void QuestLogCallUpdatePlayerSprite(u8 state);

#endif //GUARD_QUEST_LOG_PLAYER_H
