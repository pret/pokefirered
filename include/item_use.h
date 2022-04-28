#ifndef GUARD_ITEM_USE_H
#define GUARD_ITEM_USE_H

#include "global.h"

void Task_ItemUse_CloseMessageBoxAndReturnToField_VsSeeker(u8);
void ItemUse_SetQuestLogEvent(u8, struct Pokemon *, u16, u16);

void FieldUseFunc_OrangeMail(u8 taskId);
void FieldUseFunc_MachBike(u8 taskId);
void FieldUseFunc_OldRod(u8 taskId);
void FieldUseFunc_CoinCase(u8 taskId);
void FieldUseFunc_PowderJar(u8 taskId);
void FieldUseFunc_PokeFlute(u8 taskId);
void FieldUseFunc_Medicine(u8 taskId);
void FieldUseFunc_Ether(u8 taskId);
void FieldUseFunc_PpUp(u8 taskId);
void FieldUseFunc_RareCandy(u8 taskId);
void FieldUseFunc_EvoItem(u8 taskId);
void FieldUseFunc_SacredAsh(u8 taskId);
void FieldUseFunc_TmCase(u8 taskId);
void FieldUseFunc_BerryPouch(u8 taskId);
void BattleUseFunc_BerryPouch(u8 taskId);
void FieldUseFunc_TeachyTv(u8 taskId);
void FieldUseFunc_SuperRepel(u8 taskId);
void FieldUseFunc_BlackFlute(u8 taskId);
void FieldUseFunc_TownMap(u8 taskId);
void FieldUseFunc_FameChecker(u8 taskId);
void FieldUseFunc_VsSeeker(u8 taskId);
void FieldUseFunc_Honey(u8 taskId);
void FieldUseFunc_ExpShare(u8 taskId);
void BattleUseFunc_PokeBallEtc(u8 taskId);
void BattleUseFunc_PokeFlute(u8 taskId);
void BattleUseFunc_GuardSpec(u8 taskId);
void BattleUseFunc_Medicine(u8 taskId);
void BattleUseFunc_Ether(u8 taskId);
void BattleUseFunc_PokeDoll(u8 taskId);
void FieldUseFunc_OakStopsYou(u8 taskId);
void ItemUseOutOfBattle_EscapeRope(u8 taskId);
void ItemUseOutOfBattle_EnigmaBerry(u8 taskId);
void ItemUseInBattle_EnigmaBerry(u8 taskId);
void ItemUseOutOfBattle_Itemfinder(u8 taskId);
void sub_80A1C44(u8 taskId);
u8 CanUseEscapeRopeOnCurrMap(void);
u8 CheckIfItemIsTMHMOrEvolutionStone(u16 itemId);

#endif //GUARD_ITEM_USE_H
