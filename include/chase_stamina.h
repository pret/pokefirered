#ifndef GUARD_CHASE_STAMINA_H
#define GUARD_CHASE_STAMINA_H

#include "global.h"

#define STAMINA_UPGRADE_SUCCESS 0
#define STAMINA_UPGRADE_FAIL_MAX 1
#define STAMINA_UPGRADE_FAIL_NOT_ENOUGH_SOULS 2

void ChaseStamina_UpdateOverworldFrame(bool8 tookStep);
bool8 ChaseStamina_CanUseRunStep(void);
void ChaseStamina_ConsumeRunStep(void);
u8 ChaseStamina_GetCurrent(void);
u8 ChaseStamina_GetMax(void);
u8 ChaseStamina_GetActiveChasers(void);
u16 ChaseStamina_GetChaseStepsRemaining(void);
bool8 ChaseStamina_IsChaseActive(void);

u16 PkmnCenterStaminaUpgrade_Preview(void);
u16 PkmnCenterStaminaUpgrade_Purchase(void);

void ChaseStamina_OnWildBattleEnded(u8 battleOutcome, u32 battleTypeFlags);
bool8 ChaseStamina_TryStartChaseEncounter(u32 metatileAttributes);
bool8 ChaseStamina_ShouldSuppressRandomEncounters(void);
void ChaseStamina_OnMapTransition(const struct WarpData *from, const struct WarpData *to);

void ChaseStamina_OnBattleStart(void);
bool8 ChaseStamina_ShouldPrioritizeWildOpponent(u8 battler1, u8 battler2);

#endif // GUARD_CHASE_STAMINA_H
