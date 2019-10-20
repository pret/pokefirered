#ifndef GUARD_BATTLE_SETUP_H
#define GUARD_BATTLE_SETUP_H

#include "global.h"

void BattleSetup_StartScriptedWildBattle(void);
u8 BattleSetup_GetTerrainId(void);
const u8 *BattleSetup_ConfigureTrainerBattle(const u8 *data);
void BattleSetup_StartBattlePikeWildBattle(void);
void BattleSetup_StartWildBattle(void);
void BattleSetup_StartRoamerBattle(void);

u8 HasTrainerBeenFought(u16);
void SetTrainerFlag(u16);
void ClearTrainerFlag(u16);
void BattleSetup_StartTrainerBattle(void);
const u8 *BattleSetup_GetScriptAddrAfterBattle(void);
const u8 *BattleSetup_GetTrainerPostBattleScript(void);
void SetBattledTrainerFlag(void);
u8 sub_8080060(void);
u8 GetTrainerBattleMode(void);
u16 sub_80803D8(void);

#endif // GUARD_BATTLE_SETUP_H
