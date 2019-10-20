#ifndef GUARD_BATTLE_SETUP_H
#define GUARD_BATTLE_SETUP_H

#include "global.h"

void BattleSetup_StartWildBattle(void);
void BattleSetup_StartRoamerBattle(void);
void BattleSetup_StartOldManTutorialBattle(void);
void BattleSetup_StartScriptedWildBattle(void);
void BattleSetup_StartMarowakBattle(void);
void sub_807F998(void);
void BattleSetup_StartLegendaryBattle(void);
void BattleSetup_StartIceCaveBattle(void);
void sub_807FABC(void);
u8 BattleSetup_GetTerrainId(void);
u8 sub_8080060(void);
const u8 *BattleSetup_ConfigureTrainerBattle(const u8 *data);
void ConfigureAndSetUpOneTrainerBattle(u8 trainerEventObjId, const u8 *trainerScript);
bool32 GetTrainerFlagFromScriptPointer(const u8 *data);
void SetUpTrainerMovement(void);
u8 GetTrainerBattleMode(void);
u16 sub_80803D8(void);
u16 GetTrainerFlag(void);
void SetBattledTrainerFlag(void);
bool8 HasTrainerBeenFought(u16 trainerId);
void SetTrainerFlag(u16 trainerId);
void ClearTrainerFlag(u16 trainerId);
void BattleSetup_StartTrainerBattle(void);
void BattleSetup_StartRematchBattle(void);
void ShowTrainerIntroSpeech(void);
const u8 *BattleSetup_GetScriptAddrAfterBattle(void);
const u8 *BattleSetup_GetTrainerPostBattleScript(void);
void ShowTrainerCantBattleSpeech(void);
void SetUpTrainerEncounterMusic(void);
const u8 *GetTrainerALoseText(void);
const u8 *GetTrainerWonSpeech(void);

#endif // GUARD_BATTLE_SETUP_H
