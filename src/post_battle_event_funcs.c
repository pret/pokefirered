#include "global.h"
#include "script_pokemon_util.h"
#include "event_data.h"
#include "credits.h"
#include "overworld.h"
#include "hall_of_fame.h"
#include "load_save.h"
#include "constants/heal_locations.h"

bool8 EnterHallOfFame(void)
{
    bool8 ribbonState;
    bool8 *r7;
    int i;
    bool8 gaveAtLeastOneRibbon;
    HealPlayerParty();
    if (FlagGet(FLAG_SYS_GAME_CLEAR) == TRUE)
    {
        gHasHallOfFameRecords = TRUE;
    }
    else
    {
        gHasHallOfFameRecords = FALSE;
        FlagSet(FLAG_SYS_GAME_CLEAR);
    }
    if (GetGameStat(GAME_STAT_FIRST_HOF_PLAY_TIME) == 0)
    {
        SetGameStat(GAME_STAT_FIRST_HOF_PLAY_TIME, (gSaveBlock2Ptr->playTimeHours << 16) | (gSaveBlock2Ptr->playTimeMinutes << 8) | gSaveBlock2Ptr->playTimeSeconds);
    }
    SetContinueGameWarpStatus();
    SetContinueGameWarpToHealLocation(SPAWN_PALLET_TOWN);
    SetMainCallback2(CB2_DoHallOfFameScreen);
    return FALSE;
}

bool8 SetCB2WhiteOut(void)
{
    SetMainCallback2(CB2_WhiteOut);
    return FALSE;
}
