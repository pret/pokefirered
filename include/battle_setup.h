#ifndef GUARD_BATTLE_SETUP_H
#define GUARD_BATTLE_SETUP_H

#include "global.h"

void BattleSetup_StartWildBattle(void);
void BattleSetup_StartRoamerBattle(void);
void ScrSpecial_StartOldManTutorialBattle(void);
void BattleSetup_StartScriptedWildBattle(void);
void ScrSpecial_StartMarowakBattle(void);
void ScrSpecial_StartSouthernIslandBattle(void);
void Special_StartLegendaryBattle(void);
void Special_StartGroudonKyogreBattle(void);
void Special_StartRegiBattle(void);
u8 BattleSetup_GetTerrainId(void);
u8 BattleSetup_GetBattleTowerBattleTransition(void);
const u8 *BattleSetup_ConfigureTrainerBattle(const u8 *data);
void ConfigureAndSetUpOneTrainerBattle(u8 trainerEventObjId, const u8 *trainerScript);
bool32 GetTrainerFlagFromScriptPointer(const u8 *data);
void SetUpTrainerMovement(void);
u8 ScrSpecial_GetTrainerBattleMode(void);
u16 GetRivalBattleFlags(void);
u16 ScrSpecial_HasTrainerBeenFought(void);
void SetBattledTrainerFlag(void);
bool8 HasTrainerBeenFought(u16 trainerId);
void SetTrainerFlag(u16 trainerId);
void ClearTrainerFlag(u16 trainerId);
void BattleSetup_StartTrainerBattle(void);
void ScrSpecial_StartTrainerEyeRematch(void);
void ScrSpecial_ShowTrainerIntroSpeech(void);
const u8 *BattleSetup_GetScriptAddrAfterBattle(void);
const u8 *BattleSetup_GetTrainerPostBattleScript(void);
void ScrSpecial_ShowTrainerNonBattlingSpeech(void);
void PlayTrainerEncounterMusic(void);
const u8 *GetTrainerALoseText(void);
const u8 *GetTrainerWonSpeech(void);

#endif // GUARD_BATTLE_SETUP_H
