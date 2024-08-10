#ifndef GUARD_BATTLE_AI_SWITCH_ITEMS_H
#define GUARD_BATTLE_AI_SWITCH_ITEMS_H

void GetAIPartyIndexes(u32 battlerId, s32 *firstId, s32 *lastId);
void AI_TrySwitchOrUseItem(u32 battler);
u32 GetMostSuitableMonToSwitchInto(u32 battler, bool32 switchAfterMonKOd);
bool32 ShouldSwitch(u32 battler, bool32 emitResult);
bool32 IsMonGrounded(u16 heldItemEffect, u32 ability, u8 type1, u8 type2);

#endif // GUARD_BATTLE_AI_SWITCH_ITEMS_H
