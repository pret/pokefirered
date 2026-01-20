#ifndef GUARD_BATTLE_TERASTAL_H
#define GUARD_BATTLE_TERASTAL_H

void ActivateTera(u32 battler);
void ApplyBattlerVisualsForTeraAnim(u32 battler);
bool32 CanTerastallize(u32 battler);
enum Type GetBattlerTeraType(u32 battler);
void ExpendTypeStellarBoost(u32 battler, enum Type type);
bool32 IsTypeStellarBoosted(u32 battler, enum Type type);
uq4_12_t GetTeraMultiplier(struct BattleContext *ctx);

u16 GetTeraTypeRGB(enum Type type);

#endif
