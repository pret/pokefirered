#ifndef GUARD_BATTLE_AI_SCRIPT_COMMANDS_H
#define GUARD_BATTLE_AI_SCRIPT_COMMANDS_H

#include "global.h"

// return values for BattleAI_ChooseMoveOrAction
// 0 - 3 are move idx
#define AI_CHOICE_FLEE 4
#define AI_CHOICE_WATCH 5

void BattleAI_HandleItemUseBeforeAISetup(void);
void BattleAI_SetupAIData(void);
u8 BattleAI_ChooseMoveOrAction(void);
void ClearBankMoveHistory(u8 bank);
void RecordAbilityBattle(u8 bank, u8 abilityId);
void ClearBankAbilityHistory(u8 bank);
void RecordItemEffectBattle(u8 bank, u8 itemEffect);
void ClearBankItemEffectHistory(u8 bank);
u8 BattleAI_ChooseMoveOrAction(void);

#endif // GUARD_BATTLE_AI_SCRIPT_COMMANDS_H
