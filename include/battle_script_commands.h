#ifndef GUARD_BATTLE_SCRIPT_COMMANDS_H
#define GUARD_BATTLE_SCRIPT_COMMANDS_H

#include "global.h"

#define NO_ACC_CALC 0xFFFE
#define NO_ACC_CALC_CHECK_LOCK_ON 0xFFFF
#define ACC_CURR_MOVE 0

#define ATK48_STAT_NEGATIVE         0x1
#define ATK48_STAT_BY_TWO           0x2
#define ATK48_BIT_x4                0x4
#define ATK48_LOWER_FAIL_CHECK      0x8

#define ATK4F_DONT_CHECK_STATUSES   0x80

#define ATK80_DMG_CHANGE_SIGN                               0
#define ATK80_DMG_HALF_BY_TWO_NOT_MORE_THAN_HALF_MAX_HP     1
#define ATK80_DMG_DOUBLED                                   2

#define STAT_CHANGE_BS_PTR                  0x1
#define STAT_CHANGE_NOT_PROTECT_AFFECTED    0x20

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

extern void (* const gBattleScriptingCommandsTable[])(void);

#endif // GUARD_BATTLE_SCRIPT_COMMANDS_H
