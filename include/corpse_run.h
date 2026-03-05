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

enum
{
    CORPSE_RUN_SAVE_MAGIC = 0x43525356, // 'CRSV'
    CORPSE_RUN_SAVE_VERSION = 2,
};

void CorpseRun_ResetSaveData(void);
void CorpseRun_HandlePlayerDefeat(void);
void CorpseRun_TryRecoverByTouch(void);
void CorpseRun_OnMapEnter(void);
void CorpseRun_DebugReset(void);
void CorpseRun_ApplyTrainerDamageFromWild(u8 wildLevel);
void CorpseRun_FailActiveRunAndEnterSalvage(void);
bool8 CorpseRun_IsEscapeTrainerEncounter(u16 trainerId, u8 trainerBattleMode);
bool8 CorpseRun_ShouldBypassDefeatPersistenceForCurrentBattle(void);
bool8 CorpseRun_ShouldSuppressTrainerBattleSideEffects(void);
bool8 CorpseRun_IsActive(void);
bool8 CorpseRun_IsSalvageActive(void);
bool8 CorpseRun_CanUseBagInCurrentBattle(void);
bool8 CorpseRun_CanRunFromCurrentBattle(void);
bool8 CorpseRun_IsRewardPolicyGateActive(void);
bool8 CorpseRun_ShouldBlockRewardScriptCommands(void);
bool8 CorpseRun_CanGainExpFromCurrentBattle(void);
bool8 CorpseRun_CanGainCurrencyFromCurrentBattle(void);
bool8 CorpseRun_CanCaptureInCurrentBattle(void);
bool8 CorpseRun_ShouldRunPostBattleScripts(void);
bool8 CorpseRun_CanReceiveItemDrops(void);
bool8 CorpseRun_ShouldUseSafariBattle(void);
u8 CorpseRun_GetSalvageLevelCap(void);
bool8 CorpseRun_IsSalvageCatchAllowed(const struct Pokemon *mon);
void CorpseRun_CommitSalvageCatchState(void);
void CorpseRun_CompleteSalvage(void);

#endif // GUARD_CORPSE_RUN_H
