#ifndef GUARD_BATTLE_DYNAMAX_H
#define GUARD_BATTLE_DYNAMAX_H

#define DYNAMAX_TURNS_COUNT	3

bool32 CanDynamax(u32 battler);
bool32 IsGigantamaxed(u32 battler);
void ApplyDynamaxHPMultiplier(struct Pokemon *mon);
void ActivateDynamax(u32 battler);
u32 GetNonDynamaxHP(u32 battler);
u32 GetNonDynamaxMaxHP(u32 battler);
void UndoDynamax(u32 battler);
bool32 IsMoveBlockedByMaxGuard(enum Move move);

enum Move GetMaxMove(u32 battler, enum Move baseMove);
u32 GetMaxMovePower(enum Move move);
bool32 IsMaxMove(enum Move move);
void ChooseDamageNonTypesString(enum Type type);

void BS_UpdateDynamax(void);
void BS_SetSteelsurge(void);
void BS_HealOneSixth(void);
void BS_TryRecycleBerry(void);
void BS_JumpIfDynamaxed(void);

#endif
