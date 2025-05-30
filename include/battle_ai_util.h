#ifndef GUARD_BATTLE_AI_UTIL_H
#define GUARD_BATTLE_AI_UTIL_H

#include "battle_ai_main.h"

#define FOE(battler) ((BATTLE_OPPOSITE(battler)) & BIT_SIDE)

// Roll boundaries used by AI when scoring. Doesn't affect actual damage dealt.
#define MAX_ROLL_PERCENTAGE DMG_ROLL_PERCENT_HI
#define MIN_ROLL_PERCENTAGE DMG_ROLL_PERCENT_LO
#define DMG_ROLL_PERCENTAGE ((MAX_ROLL_PERCENTAGE + MIN_ROLL_PERCENTAGE + 1) / 2) // Controls the damage roll the AI sees for the default roll. By default the 9th roll is seen

enum DamageRollType
{
    DMG_ROLL_LOWEST,
    DMG_ROLL_DEFAULT,
    DMG_ROLL_HIGHEST,
};

enum DamageCalcContext
{
    AI_DEFENDING,
    AI_ATTACKING,
};

enum AIPivot
{
    DONT_PIVOT,
    CAN_TRY_PIVOT,
    SHOULD_PIVOT,
};

enum WeatherState
{
    WEATHER_INACTIVE,
    WEATHER_ACTIVE,
    WEATHER_ACTIVE_BUT_BLOCKED,
    WEATHER_INACTIVE_AND_BLOCKED,
};

static inline bool32 IsMoveUnusable(u32 moveIndex, u32 move, u32 moveLimitations)
{
    return move == MOVE_NONE
        || move == MOVE_UNAVAILABLE
        || moveLimitations & 1u << moveIndex;
}

typedef bool32 (*MoveFlag)(u32 move);

bool32 AI_IsFaster(u32 battlerAi, u32 battlerDef, u32 move);
bool32 AI_IsSlower(u32 battlerAi, u32 battlerDef, u32 move);
bool32 AI_RandLessThan(u32 val);
u32 AI_GetDamage(u32 battlerAtk, u32 battlerDef, u32 moveIndex, enum DamageCalcContext calcContext, struct AiLogicData *aiData);
bool32 IsAiVsAiBattle(void);
bool32 BattlerHasAi(u32 battlerId);
bool32 IsAiBattlerAware(u32 battlerId);
void ClearBattlerMoveHistory(u32 battlerId);
void RecordLastUsedMoveBy(u32 battlerId, u32 move);
void RecordAllMoves(u32 battler);
void RecordKnownMove(u32 battlerId, u32 move);
void RecordAbilityBattle(u32 battlerId, u32 abilityId);
void ClearBattlerAbilityHistory(u32 battlerId);
void RecordItemEffectBattle(u32 battlerId, u32 itemEffect);
void ClearBattlerItemEffectHistory(u32 battlerId);
void SaveBattlerData(u32 battlerId);
void SetBattlerData(u32 battlerId);
void SetBattlerAiData(u32 battlerId, struct AiLogicData *aiData);
void RestoreBattlerData(u32 battlerId);
u32 GetAIChosenMove(u32 battlerId);
u32 GetTotalBaseStat(u32 species);
bool32 IsTruantMonVulnerable(u32 battlerAI, u32 opposingBattler);
bool32 AI_BattlerAtMaxHp(u32 battler);
u32 GetHealthPercentage(u32 battler);
bool32 AI_CanBattlerEscape(u32 battler);
bool32 IsBattlerTrapped(u32 battlerAtk, u32 battlerDef);
s32 AI_WhoStrikesFirst(u32 battlerAI, u32 battler2, u32 moveConsidered);
bool32 CanTargetFaintAi(u32 battlerDef, u32 battlerAtk);
u32 NoOfHitsForTargetToFaintAI(u32 battlerDef, u32 battlerAtk);
u32 GetBestDmgMoveFromBattler(u32 battlerAtk, u32 battlerDef, enum DamageCalcContext calcContext);
u32 GetBestDmgFromBattler(u32 battler, u32 battlerTarget, enum DamageCalcContext calcContext);
bool32 CanTargetMoveFaintAi(u32 move, u32 battlerDef, u32 battlerAtk, u32 nHits);
bool32 CanTargetFaintAiWithMod(u32 battlerDef, u32 battlerAtk, s32 hpMod, s32 dmgMod);
s32 AI_DecideKnownAbilityForTurn(u32 battlerId);
enum ItemHoldEffect AI_DecideHoldEffectForTurn(u32 battlerId);
bool32 DoesBattlerIgnoreAbilityChecks(u32 battlerAtk, u32 atkAbility, u32 move);
u32 AI_GetWeather(void);
enum WeatherState IsWeatherActive(u32 flags);
bool32 CanAIFaintTarget(u32 battlerAtk, u32 battlerDef, u32 numHits);
bool32 CanIndexMoveFaintTarget(u32 battlerAtk, u32 battlerDef, u32 index, enum DamageCalcContext calcContext);
bool32 CanIndexMoveGuaranteeFaintTarget(u32 battlerAtk, u32 battlerDef, u32 index);
bool32 HasDamagingMove(u32 battlerId);
bool32 HasDamagingMoveOfType(u32 battlerId, u32 type);
u32 GetBattlerSecondaryDamage(u32 battlerId);
bool32 BattlerWillFaintFromWeather(u32 battler, u32 ability);
bool32 BattlerWillFaintFromSecondaryDamage(u32 battler, u32 ability);
bool32 ShouldTryOHKO(u32 battlerAtk, u32 battlerDef, u32 atkAbility, u32 defAbility, u32 move);
bool32 ShouldUseRecoilMove(u32 battlerAtk, u32 battlerDef, u32 recoilDmg, u32 moveIndex);
u32 GetBattlerSideSpeedAverage(u32 battler);
bool32 ShouldAbsorb(u32 battlerAtk, u32 battlerDef, u32 move, s32 damage);
bool32 ShouldRecover(u32 battlerAtk, u32 battlerDef, u32 move, u32 healPercent, enum DamageCalcContext calcContext);
bool32 ShouldSetScreen(u32 battlerAtk, u32 battlerDef, enum BattleMoveEffects moveEffect);
enum AIPivot ShouldPivot(u32 battlerAtk, u32 battlerDef, u32 defAbility, u32 move, u32 moveIndex);
bool32 IsRecycleEncouragedItem(u32 item);
bool32 ShouldRestoreHpBerry(u32 battlerAtk, u32 item);
bool32 IsStatBoostingBerry(u32 item);
bool32 CanKnockOffItem(u32 battler, u32 item);
bool32 IsAbilityOfRating(u32 ability, s8 rating);
bool32 AI_IsAbilityOnSide(u32 battlerId, u32 ability);
bool32 AI_MoveMakesContact(u32 ability, enum ItemHoldEffect holdEffect, u32 move);
bool32 ShouldUseZMove(u32 battlerAtk, u32 battlerDef, u32 chosenMove);
u32 AI_GetBattlerAbility(u32 battler);

// stat stage checks
bool32 AnyStatIsRaised(u32 battlerId);
bool32 ShouldLowerStat(u32 battlerAtk, u32 battlerDef, u32 abilityDef, u32 stat);
bool32 BattlerStatCanRise(u32 battler, u32 battlerAbility, u32 stat);
bool32 AreBattlersStatsMaxed(u32 battler);
u32 CountPositiveStatStages(u32 battlerId);
u32 CountNegativeStatStages(u32 battlerId);
bool32 ShouldLowerAttack(u32 battlerAtk, u32 battlerDef, u32 defAbility);
bool32 ShouldLowerDefense(u32 battlerAtk, u32 battlerDef, u32 defAbility);
bool32 ShouldLowerSpeed(u32 battlerAtk, u32 battlerDef, u32 defAbility);
bool32 ShouldLowerSpAtk(u32 battlerAtk, u32 battlerDef, u32 defAbility);
bool32 ShouldLowerSpDef(u32 battlerAtk, u32 battlerDef, u32 defAbility);
bool32 ShouldLowerAccuracy(u32 battlerAtk, u32 battlerDef, u32 defAbility);
bool32 ShouldLowerEvasion(u32 battlerAtk, u32 battlerDef, u32 defAbility);

// move checks
bool32 IsAffectedByPowder(u32 battler, u32 ability, enum ItemHoldEffect holdEffect);
bool32 MovesWithCategoryUnusable(u32 attacker, u32 target, u32 category);
s32 AI_WhichMoveBetter(u32 move1, u32 move2, u32 battlerAtk, u32 battlerDef, s32 noOfHitsToKo);
struct SimulatedDamage AI_CalcDamageSaveBattlers(u32 move, u32 battlerAtk, u32 battlerDef, uq4_12_t *typeEffectiveness, bool32 considerZPower);
struct SimulatedDamage AI_CalcDamage(u32 move, u32 battlerAtk, u32 battlerDef, uq4_12_t *typeEffectiveness, bool32 considerZPower, u32 weather);
bool32 AI_IsDamagedByRecoil(u32 battler);
u32 GetNoOfHitsToKO(u32 dmg, s32 hp);
u32 GetNoOfHitsToKOBattlerDmg(u32 dmg, u32 battlerDef);
u32 GetNoOfHitsToKOBattler(u32 battlerAtk, u32 battlerDef, u32 moveIndex, enum DamageCalcContext calcContext);
u32 GetCurrDamageHpPercent(u32 battlerAtk, u32 battlerDef, enum DamageCalcContext calcContext);
uq4_12_t AI_GetMoveEffectiveness(u32 move, u32 battlerAtk, u32 battlerDef);
u16 *GetMovesArray(u32 battler);
bool32 IsConfusionMoveEffect(enum BattleMoveEffects moveEffect);
bool32 HasMove(u32 battlerId, u32 move);
bool32 HasOnlyMovesWithCategory(u32 battlerId, u32 category, bool32 onlyOffensive);
bool32 HasMoveWithCategory(u32 battler, u32 category);
bool32 HasMoveWithType(u32 battler, u32 type);
bool32 HasMoveWithEffect(u32 battlerId, enum BattleMoveEffects moveEffect);
bool32 HasNonVolatileMoveEffect(u32 battlerId, u32 effect);
bool32 IsPowerBasedOnStatus(u32 battlerId, enum BattleMoveEffects effect, u32 argument);
bool32 HasMoveWithAdditionalEffect(u32 battlerId, u32 moveEffect);
bool32 HasMoveWithCriticalHitChance(u32 battlerId);
bool32 HasMoveWithMoveEffectExcept(u32 battlerId, u32 moveEffect, enum BattleMoveEffects exception);
bool32 HasMoveThatLowersOwnStats(u32 battlerId);
bool32 HasMoveWithLowAccuracy(u32 battlerAtk, u32 battlerDef, u32 accCheck, bool32 ignoreStatus, u32 atkAbility, u32 defAbility, u32 atkHoldEffect, u32 defHoldEffect);
bool32 HasAnyKnownMove(u32 battlerId);
bool32 IsAromaVeilProtectedEffect(enum BattleMoveEffects moveEffect);
bool32 IsNonVolatileStatusMove(u32 moveEffect);
bool32 IsMoveRedirectionPrevented(u32 battlerAtk, u32 move, u32 atkAbility);
bool32 IsMoveEncouragedToHit(u32 battlerAtk, u32 battlerDef, u32 move);
bool32 IsHazardMove(u32 move);
bool32 IsTwoTurnNotSemiInvulnerableMove(u32 battlerAtk, u32 move);
void ProtectChecks(u32 battlerAtk, u32 battlerDef, u32 move, u32 predictedMove, s32 *score);
bool32 ShouldSetSandstorm(u32 battler, u32 ability, enum ItemHoldEffect holdEffect);
bool32 ShouldSetHail(u32 battler, u32 ability, enum ItemHoldEffect holdEffect);
bool32 ShouldSetSnow(u32 battler, u32 ability, enum ItemHoldEffect holdEffect);
bool32 ShouldSetRain(u32 battlerAtk, u32 ability, enum ItemHoldEffect holdEffect);
bool32 ShouldSetSun(u32 battlerAtk, u32 atkAbility, enum ItemHoldEffect holdEffect);
bool32 HasSleepMoveWithLowAccuracy(u32 battlerAtk, u32 battlerDef);
bool32 IsHealingMove(u32 move);
bool32 HasHealingEffect(u32 battler);
bool32 IsTrappingMove(u32 move);
bool32 HasTrappingMoveEffect(u32 battler);
bool32 ShouldFakeOut(u32 battlerAtk, u32 battlerDef, u32 move);
bool32 HasThawingMove(u32 battler);
bool32 IsStatRaisingEffect(enum BattleMoveEffects effect);
bool32 IsStatLoweringEffect(enum BattleMoveEffects effect);
bool32 IsSelfStatLoweringEffect(enum BattleMoveEffects effect);
bool32 IsSwitchOutEffect(enum BattleMoveEffects effect);
bool32 IsChaseEffect(enum BattleMoveEffects effect);
bool32 IsAttackBoostMoveEffect(enum BattleMoveEffects effect);
bool32 IsUngroundingEffect(enum BattleMoveEffects effect);
bool32 IsSemiInvulnerable(u32 battlerDef, u32 move);
bool32 HasMoveWithFlag(u32 battler, MoveFlag getFlag);
bool32 IsHazardClearingMove(u32 move);
bool32 IsSubstituteEffect(enum BattleMoveEffects effect);

// status checks
bool32 AI_CanBeConfused(u32 battlerAtk, u32 battlerDef, u32 move, u32 ability);
bool32 IsBattlerIncapacitated(u32 battler, u32 ability);
bool32 AI_CanPutToSleep(u32 battlerAtk, u32 battlerDef, u32 defAbility, u32 move, u32 partnerMove);
bool32 ShouldPoison(u32 battlerAtk, u32 battlerDef);
bool32 AI_CanPoison(u32 battlerAtk, u32 battlerDef, u32 defAbility, u32 move, u32 partnerMove);
bool32 AI_CanParalyze(u32 battlerAtk, u32 battlerDef, u32 defAbility, u32 move, u32 partnerMove);
bool32 AI_CanConfuse(u32 battlerAtk, u32 battlerDef, u32 defAbility, u32 battlerAtkPartner, u32 move, u32 partnerMove);
bool32 ShouldBurn(u32 battlerAtk, u32 battlerDef, u32 abilityDef);
bool32 ShouldFreezeOrFrostbite(u32 battlerAtk, u32 battlerDef, u32 abilityDef);
bool32 ShouldParalyze(u32 battlerAtk, u32 battlerDef, u32 abilityDef);
bool32 AI_CanBurn(u32 battlerAtk, u32 battlerDef, u32 defAbility, u32 battlerAtkPartner, u32 move, u32 partnerMove);
bool32 AI_CanGiveFrostbite(u32 battlerAtk, u32 battlerDef, u32 defAbility, u32 battlerAtkPartner, u32 move, u32 partnerMove);
bool32 AI_CanBeInfatuated(u32 battlerAtk, u32 battlerDef, u32 defAbility);
bool32 AnyPartyMemberStatused(u32 battlerId, bool32 checkSoundproof);
u32 ShouldTryToFlinch(u32 battlerAtk, u32 battlerDef, u32 atkAbility, u32 defAbility, u32 move);
bool32 ShouldTrap(u32 battlerAtk, u32 battlerDef, u32 move);
bool32 IsWakeupTurn(u32 battler);
bool32 AI_IsBattlerAsleepOrComatose(u32 battlerId);

// ability logic
bool32 IsMoxieTypeAbility(u32 ability);
bool32 ShouldTriggerAbility(u32 battler, u32 ability);

// partner logic
#define IS_TARGETING_PARTNER(battlerAtk, battlerDef)((battlerAtk) == (battlerDef ^ BIT_FLANK))
u32 GetAllyChosenMove(u32 battlerId);
bool32 IsValidDoubleBattle(u32 battlerAtk);
bool32 DoesPartnerHaveSameMoveEffect(u32 battlerAtkPartner, u32 battlerDef, u32 move, u32 partnerMove);
bool32 PartnerHasSameMoveEffectWithoutTarget(u32 battlerAtkPartner, u32 move, u32 partnerMove);
bool32 PartnerMoveEffectIsStatusSameTarget(u32 battlerAtkPartner, u32 battlerDef, u32 partnerMove);
bool32 IsMoveEffectWeather(u32 move);
bool32 PartnerMoveEffectIsTerrain(u32 battlerAtkPartner, u32 partnerMove);
bool32 PartnerMoveEffectIs(u32 battlerAtkPartner, u32 partnerMove, enum BattleMoveEffects effectCheck);
bool32 PartnerMoveIs(u32 battlerAtkPartner, u32 partnerMove, u32 moveCheck);
bool32 PartnerMoveIsSameAsAttacker(u32 battlerAtkPartner, u32 battlerDef, u32 move, u32 partnerMove);
bool32 PartnerMoveIsSameNoTarget(u32 battlerAtkPartner, u32 move, u32 partnerMove);
bool32 PartnerMoveActivatesSleepClause(u32 move);
bool32 ShouldUseWishAromatherapy(u32 battlerAtk, u32 battlerDef, u32 move);
u32 GetFriendlyFireKOThreshold(u32 battler);
bool32 IsAllyProtectingFromMove(u32 battlerAtk, u32 attackerMove, u32 allyMove);

// party logic
struct BattlePokemon *AllocSaveBattleMons(void);
void FreeRestoreBattleMons(struct BattlePokemon *savedBattleMons);
s32 CountUsablePartyMons(u32 battlerId);
bool32 IsPartyFullyHealedExceptBattler(u32 battler);
bool32 PartyHasMoveCategory(u32 battlerId, u32 category);
bool32 SideHasMoveCategory(u32 battlerId, u32 category);

// score increases
u32 IncreaseStatUpScore(u32 battlerAtk, u32 battlerDef, enum StatChange statId);
u32 IncreaseStatUpScoreContrary(u32 battlerAtk, u32 battlerDef, enum StatChange statId);
void IncreasePoisonScore(u32 battlerAtk, u32 battlerDef, u32 move, s32 *score);
void IncreaseBurnScore(u32 battlerAtk, u32 battlerDef, u32 move, s32 *score);
void IncreaseParalyzeScore(u32 battlerAtk, u32 battlerDef, u32 move, s32 *score);
void IncreaseSleepScore(u32 battlerAtk, u32 battlerDef, u32 move, s32 *score);
void IncreaseConfusionScore(u32 battlerAtk, u32 battlerDef, u32 move, s32 *score);
void IncreaseFrostbiteScore(u32 battlerAtk, u32 battlerDef, u32 move, s32 *score);

s32 AI_CalcPartyMonDamage(u32 move, u32 battlerAtk, u32 battlerDef, struct BattlePokemon switchinCandidate, enum DamageCalcContext calcContext);
u32 AI_WhoStrikesFirstPartyMon(u32 battlerAtk, u32 battlerDef, struct BattlePokemon switchinCandidate, u32 moveConsidered);
s32 AI_TryToClearStats(u32 battlerAtk, u32 battlerDef, bool32 isDoubleBattle);
bool32 AI_ShouldCopyStatChanges(u32 battlerAtk, u32 battlerDef);
bool32 AI_ShouldSetUpHazards(u32 battlerAtk, u32 battlerDef, struct AiLogicData *aiData);
void IncreaseTidyUpScore(u32 battlerAtk, u32 battlerDef, u32 move, s32 *score);
bool32 AI_ShouldSpicyExtract(u32 battlerAtk, u32 battlerAtkPartner, u32 move, struct AiLogicData *aiData);
u32 IncreaseSubstituteMoveScore(u32 battlerAtk, u32 battlerDef, u32 move);
bool32 IsBattlerItemEnabled(u32 battler);
bool32 IsBattlerPredictedToSwitch(u32 battler);
u32 GetIncomingMove(u32 battler, u32 opposingBattler, struct AiLogicData *aiData);
bool32 HasLowAccuracyMove(u32 battlerAtk, u32 battlerDef);
bool32 HasBattlerSideAbility(u32 battlerDef, u32 ability, struct AiLogicData *aiData);
u32 GetThinkingBattler(u32 battler);

#endif //GUARD_BATTLE_AI_UTIL_H
