#ifndef GUARD_BATTLE_SCRIPT_COMMANDS_H
#define GUARD_BATTLE_SCRIPT_COMMANDS_H

#include "global.h"

#define STAT_CHANGE_WORKED      0
#define STAT_CHANGE_DIDNT_WORK  1

#define WINDOW_CLEAR            0x1
#define WINDOW_x80              0x80

void SetMoveEffect(bool8 primary, u8 certain);
bool8 UproarWakeUpCheck(u8 battlerId);
u8 AI_TypeCalc(u16 move, u16 targetSpecies, u8 targetAbility);
u8 TypeCalc(u16 move, u8 attacker, u8 defender);
void AI_CalcDmg(u8 attacker, u8 defender);
bool32 IsMonGettingExpSentOut(void);
void BattleCreateYesNoCursorAt(void);
void BattleDestroyYesNoCursorAt(void);
void HandleBattleWindow(u8 xStart, u8 yStart, u8 xEnd, u8 yEnd, u8 flags);
u8 GetBattlerTurnOrderNum(u8 battlerId);
void BufferMoveToLearnIntoBattleTextBuff2(void);
u8 TryChangeMoveType(u8 battler, u8 type, u16 move);
bool8 MakesSound(u16 move);
void ModulateDmgByType(u8 multiplier);

//callasm functions declaration
void DoAftermathDamage(void);
void TryDoAnticipationShudder(void);
void TryBadDreamsSecondDamage(void);
void GetStatRaiseDownload(void);
void GetStrongestMoveForewarn(void);
void TryFriskFirstTarget(void);
void TryFriskSecondTarget(void);

extern const u16 gNoChangeTypeMoves[];
extern const u16 gSheerForceBoostedMoves[];

extern void (* const gBattleScriptingCommandsTable[])(void);

#endif // GUARD_BATTLE_SCRIPT_COMMANDS_H
