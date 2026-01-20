#ifndef GUARD_BATTLE_AI_UTIL_H
#define GUARD_BATTLE_AI_UTIL_H

#include "battle_ai_main.h"
#include "battle_ai_field_statuses.h"

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

enum AiConsiderEndure
{
    CONSIDER_ENDURE,
    DONT_CONSIDER_ENDURE,
};

// Higher priority at the bottom; note that these are used in the formula MAX_MON_MOVES ^ AiCompareMovesPriority, which must fit within a u32.
// In expansion where MAX_MON_MOVES is 4, this means that AiCompareMovesPriority can range from 0 - 15 inclusive.
enum AiCompareMovesPriority
{
    PRIORITY_EFFECT,
    PRIORITY_ACCURACY,
    PRIORITY_GUARANTEE,
    PRIORITY_AVOID_SELF_SACRIFICE,
    PRIORITY_SPEED,
    PRIORITY_NOT_CHARGING,
    PRIORITY_RESIST_BERRY,
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

enum AIConsiderGimmick
{
    NO_GIMMICK,
    USE_GIMMICK,
};

enum ConsiderPriority
{
    DONT_CONSIDER_PRIORITY,
    CONSIDER_PRIORITY,
};

static inline bool32 IsMoveUnusable(u32 moveIndex, enum Move move, u32 moveLimitations)
{
    return move == MOVE_NONE
        || move == MOVE_UNAVAILABLE
        || moveLimitations & 1u << moveIndex;
}

typedef bool32 (*MoveFlag)(enum Move move);

bool32 AI_IsFaster(u32 battlerAi, u32 battlerDef, enum Move aiMove, enum Move playerMove, enum ConsiderPriority considerPriority);
bool32 AI_IsSlower(u32 battlerAi, u32 battlerDef, enum Move aiMove, enum Move playerMove, enum ConsiderPriority considerPriority);
bool32 AI_RandLessThan(u32 val);
bool32 AI_IsBattlerGrounded(u32 battler);
enum MoveTarget AI_GetBattlerMoveTargetType(u32 battler, enum Move move);
enum Ability AI_GetMoldBreakerSanitizedAbility(u32 battlerAtk, enum Ability abilityAtk, enum Ability abilityDef, enum HoldEffect holdEffectDef, enum Move move);
u32 AI_GetDamage(u32 battlerAtk, u32 battlerDef, u32 moveIndex, enum DamageCalcContext calcContext, struct AiLogicData *aiData);
bool32 IsAiFlagPresent(u64 flag);
bool32 IsAiBattlerAware(u32 battlerId);
bool32 CanAiPredictMove(u32 battlerId);
bool32 IsAiBattlerAssumingStab(u32 battlerId);
bool32 IsAiBattlerAssumingStatusMoves(u32 battlerId);
bool32 IsAiBattlerPredictingAbility(u32 battlerId);
bool32 ShouldRecordStatusMove(enum Move move);
void ClearBattlerMoveHistory(u32 battlerId);
void RecordLastUsedMoveBy(u32 battlerId, enum Move move);
void RecordAllMoves(u32 battler);
void RecordKnownMove(u32 battlerId, enum Move move);
void RecordAbilityBattle(u32 battlerId, enum Ability abilityId);
void ClearBattlerAbilityHistory(u32 battlerId);
void RecordItemEffectBattle(u32 battlerId, enum HoldEffect itemEffect);
void ClearBattlerItemEffectHistory(u32 battlerId);
void SaveBattlerData(u32 battlerId);
void SetBattlerData(u32 battlerId);
void SetBattlerAiData(u32 battlerId, struct AiLogicData *aiData);
void RestoreBattlerData(u32 battlerId);
enum Move GetAIChosenMove(u32 battlerId);
u32 GetTotalBaseStat(u32 species);
bool32 IsTruantMonVulnerable(u32 battlerAI, u32 opposingBattler);
bool32 AI_BattlerAtMaxHp(u32 battler);
u32 GetHealthPercentage(u32 battler);
bool32 AI_CanBattlerEscape(u32 battler);
bool32 IsBattlerTrapped(u32 battlerAtk, u32 battlerDef);
s32 AI_WhoStrikesFirst(u32 battlerAI, u32 battler2, enum Move aiMoveConsidered, enum Move playerMoveConsidered, enum ConsiderPriority considerPriority);
bool32 CanTargetFaintAi(u32 battlerDef, u32 battlerAtk);
u32 NoOfHitsForTargetToFaintBattler(u32 battlerDef, u32 battlerAtk, enum AiConsiderEndure considerEndure);
void GetBestDmgMovesFromBattler(u32 battlerAtk, u32 battlerDef, enum DamageCalcContext calcContext, enum Move *bestMoves);
u32 GetMoveIndex(u32 battler, enum Move move);
bool32 IsBestDmgMove(u32 battlerAtk, u32 battlerDef, enum DamageCalcContext calcContext, enum Move move);
bool32 BestDmgMoveHasEffect(u32 battlerAtk, u32 battlerDef, enum DamageCalcContext calcContext, enum BattleMoveEffects moveEffect);
u32 GetBestDmgFromBattler(u32 battler, u32 battlerTarget, enum DamageCalcContext calcContext);
bool32 CanTargetMoveFaintAi(enum Move move, u32 battlerDef, u32 battlerAtk, u32 nHits);
bool32 CanTargetFaintAiWithMod(u32 battlerDef, u32 battlerAtk, s32 hpMod, s32 dmgMod);
enum Ability AI_DecideKnownAbilityForTurn(u32 battlerId);
enum HoldEffect AI_DecideHoldEffectForTurn(u32 battlerId);
bool32 DoesBattlerIgnoreAbilityChecks(u32 battlerAtk, enum Ability atkAbility, enum Move move);
u32 AI_GetWeather(void);
u32 AI_GetSwitchinWeather(u32 battler);
u32 AI_GetSwitchinFieldStatus(u32 battler);
enum WeatherState IsWeatherActive(u32 flags);
bool32 CanAIFaintTarget(u32 battlerAtk, u32 battlerDef, u32 numHits);
bool32 CanIndexMoveFaintTarget(u32 battlerAtk, u32 battlerDef, u32 index, enum DamageCalcContext calcContext);
bool32 HasDamagingMove(u32 battler);
bool32 HasDamagingMoveOfType(u32 battler, enum Type type);
u32 GetBattlerSecondaryDamage(u32 battlerId);
bool32 BattlerWillFaintFromWeather(u32 battler, enum Ability ability);
bool32 BattlerWillFaintFromSecondaryDamage(u32 battler, enum Ability ability);
bool32 ShouldTryOHKO(u32 battlerAtk, u32 battlerDef, enum Ability atkAbility, enum Ability defAbility, enum Move move);
bool32 ShouldUseRecoilMove(u32 battlerAtk, u32 battlerDef, u32 recoilDmg, u32 moveIndex);
bool32 ShouldAbsorb(u32 battlerAtk, u32 battlerDef, enum Move move);
bool32 ShouldRecover(u32 battlerAtk, u32 battlerDef, enum Move move, u32 healPercent);
bool32 ShouldSetScreen(u32 battlerAtk, u32 battlerDef, enum BattleMoveEffects moveEffect);
bool32 ShouldCureStatus(u32 battlerAtk, u32 battlerDef, struct AiLogicData *aiData);
bool32 ShouldCureStatusWithItem(u32 battlerAtk, u32 battlerDef, struct AiLogicData *aiData);
enum AIPivot ShouldPivot(u32 battlerAtk, u32 battlerDef, enum Move move);
bool32 IsRecycleEncouragedItem(enum Item item);
bool32 ShouldRestoreHpBerry(u32 battlerAtk, enum Item item);
bool32 IsStatBoostingBerry(enum Item item);
bool32 CanKnockOffItem(u32 fromBattler, u32 battler, enum Item item);
bool32 IsAbilityOfRating(enum Ability ability, s32 rating);
bool32 AI_IsAbilityOnSide(u32 battlerId, enum Ability ability);
bool32 AI_MoveMakesContact(u32 battlerAtk, u32 battlerDef, enum Ability ability, enum HoldEffect holdEffect, enum Move move);
bool32 IsUnseenFistContactMove(u32 battlerAtk, u32 battlerDef, enum Move move);
bool32 IsConsideringZMove(u32 battlerAtk, u32 battlerDef, enum Move move);
bool32 ShouldUseZMove(u32 battlerAtk, u32 battlerDef, enum Move chosenMove);
void SetAIUsingGimmick(u32 battler, enum AIConsiderGimmick use);
bool32 IsAIUsingGimmick(u32 battler);
void DecideTerastal(u32 battler);
bool32 CanEndureHit(u32 battler, u32 battlerTarget, enum Move move);
bool32 ShouldFinalGambit(u32 battlerAtk, u32 battlerDef, bool32 aiIsFaster);
bool32 ShouldConsiderSelfSacrificeDamageEffect(u32 battlerAtk, u32 battlerDef, enum Move move, bool32 aiIsFaster);

// stat stage checks
bool32 AnyStatIsRaised(u32 battlerId);
bool32 AnyUsefulStatIsRaised(u32 battlerId);
bool32 CanLowerStat(u32 battlerAtk, u32 battlerDef, struct AiLogicData *aiData, enum Stat stat);
bool32 BattlerStatCanRise(u32 battler, enum Ability battlerAbility, enum Stat stat);
bool32 AreBattlersStatsMaxed(u32 battler);
u32 CountPositiveStatStages(u32 battlerId);
u32 CountNegativeStatStages(u32 battlerId);

// move checks
bool32 Ai_IsPriorityBlocked(u32 battlerAtk, u32 battlerDef, enum Move move, struct AiLogicData *aiData);
bool32 AI_CanMoveBeBlockedByTarget(struct BattleContext *ctx);
bool32 MovesWithCategoryUnusable(u32 attacker, u32 target, enum DamageCategory category);
enum MoveComparisonResult CompareMoveEffects(enum Move move1, enum Move move2, u32 battlerAtk, u32 battlerDef, s32 noOfHitsToKo);
struct SimulatedDamage AI_CalcDamageSaveBattlers(enum Move move, u32 battlerAtk, u32 battlerDef, uq4_12_t *typeEffectiveness, enum AIConsiderGimmick considerGimmickAtk, enum AIConsiderGimmick considerGimmickDef);
bool32 IsAdditionalEffectBlocked(u32 battlerAtk, u32 abilityAtk, u32 battlerDef, enum Ability abilityDef);
struct SimulatedDamage AI_CalcDamage(enum Move move, u32 battlerAtk, u32 battlerDef, uq4_12_t *typeEffectiveness, enum AIConsiderGimmick considerGimmickAtk, enum AIConsiderGimmick considerGimmickDef, u32 weather, u32 fieldStatuses);
bool32 AI_IsDamagedByRecoil(u32 battler);
u32 GetNoOfHitsToKO(u32 dmg, s32 hp);
u32 GetNoOfHitsToKOBattlerDmg(u32 dmg, u32 battlerDef);
u32 GetNoOfHitsToKOBattler(u32 battlerAtk, u32 battlerDef, u32 moveIndex, enum DamageCalcContext calcContext, enum AiConsiderEndure considerEndure);
u32 GetBestNoOfHitsToKO(u32 battlerAtk, u32 battlerDef, enum DamageCalcContext calcContext);
u32 GetCurrDamageHpPercent(u32 battlerAtk, u32 battlerDef, enum DamageCalcContext calcContext);
uq4_12_t AI_GetMoveEffectiveness(enum Move move, u32 battlerAtk, u32 battlerDef);
enum Move *GetMovesArray(u32 battler);
bool32 IsConfusionMoveEffect(enum BattleMoveEffects moveEffect);
bool32 HasMove(u32 battlerId, enum Move move);
u32 GetBattlerMoveIndexWithEffect(u32 battler, enum BattleMoveEffects effect);
bool32 HasPhysicalBestMove(u32 battlerAtk, u32 battlerDef, enum DamageCalcContext calcContext);
bool32 HasOnlyMovesWithCategory(u32 battlerId, enum DamageCategory category, bool32 onlyOffensive);
bool32 HasMoveWithCategory(u32 battler, enum DamageCategory category);
bool32 HasMoveWithType(u32 battler, enum Type type);
bool32 HasMoveWithEffect(u32 battler, enum BattleMoveEffects moveEffect);
bool32 HasMoveWithAIEffect(u32 battler, u32 aiEffect);
bool32 HasBattlerSideMoveWithEffect(u32 battler, enum BattleMoveEffects effect);
bool32 HasBattlerSideMoveWithAIEffect(u32 battler, u32 effect);
bool32 HasBattlerSideUsedMoveWithEffect(u32 battler, enum BattleMoveEffects effect);
bool32 HasNonVolatileMoveEffect(u32 battlerId, enum MoveEffect effect);
bool32 IsPowerBasedOnStatus(u32 battlerId, enum BattleMoveEffects effect, u32 argument);
bool32 HasMoveWithAdditionalEffect(u32 battlerId, enum MoveEffect moveEffect);
bool32 HasBattlerSideMoveWithAdditionalEffect(u32 battler, enum MoveEffect moveEffect);
bool32 HasMoveWithCriticalHitChance(u32 battlerId);
bool32 HasMoveWithMoveEffectExcept(u32 battlerId, enum MoveEffect moveEffect, enum BattleMoveEffects exception);
bool32 HasMoveThatLowersOwnStats(u32 battlerId);
bool32 HasMoveWithLowAccuracy(u32 battlerAtk, u32 battlerDef, u32 accCheck, bool32 ignoreStatus);
bool32 HasAnyKnownMove(u32 battlerId);
bool32 IsAromaVeilProtectedEffect(enum BattleMoveEffects moveEffect);
bool32 IsNonVolatileStatusMove(enum Move move);
bool32 IsMoveRedirectionPrevented(u32 battlerAtk, enum Move move, enum Ability atkAbility);
bool32 IsHazardMove(enum Move move);
bool32 IsTwoTurnNotSemiInvulnerableMove(u32 battlerAtk, enum Move move);
bool32 IsBattlerDamagedByStatus(u32 battler);
s32 ProtectChecks(u32 battlerAtk, u32 battlerDef, enum Move move, enum Move predictedMove);
bool32 ShouldRaiseAnyStat(u32 battlerAtk, u32 battlerDef);
bool32 ShouldSetWeather(u32 battler, u32 weather);
bool32 ShouldClearWeather(u32 battler, u32 weather);
bool32 ShouldSetFieldStatus(u32 battler, u32 fieldStatus);
bool32 ShouldClearFieldStatus(u32 battler, u32 fieldStatus);
bool32 HasSleepMoveWithLowAccuracy(u32 battlerAtk, u32 battlerDef);
bool32 HasHealingEffect(u32 battler);
bool32 IsTrappingMove(enum Move move);
bool32 HasTrappingMoveEffect(u32 battler);
bool32 IsFlinchGuaranteed(u32 battlerAtk, u32 battlerDef, enum Move move);
bool32 HasChoiceEffect(u32 battler);
bool32 HasThawingMove(u32 battler);
bool32 HasUsableWhileAsleepMove(u32 battler);
bool32 IsStatRaisingEffect(enum BattleMoveEffects effect);
bool32 IsStatLoweringEffect(enum BattleMoveEffects effect);
bool32 IsSelfStatLoweringEffect(enum MoveEffect effect);
bool32 IsSelfStatRaisingEffect(enum MoveEffect effect);
bool32 IsSwitchOutEffect(enum BattleMoveEffects effect);
bool32 IsChaseEffect(enum BattleMoveEffects effect);
bool32 IsAttackBoostMoveEffect(enum BattleMoveEffects effect);
bool32 IsUngroundingEffect(enum BattleMoveEffects effect);
bool32 HasMoveWithFlag(u32 battler, MoveFlag getFlag);
bool32 IsHazardClearingMove(enum Move move);
bool32 IsSubstituteEffect(enum BattleMoveEffects effect);
bool32 IsSelfSacrificeEffect(enum Move move);
u32 GetAIExplosionChanceFromHP(u32 hpPercent);

// status checks
bool32 AI_CanBeConfused(u32 battlerAtk, u32 battlerDef, enum Move move, enum Ability ability);
bool32 IsBattlerIncapacitated(u32 battler, enum Ability ability);
bool32 AI_CanPutToSleep(u32 battlerAtk, u32 battlerDef, enum Ability defAbility, enum Move move, enum Move partnerMove);
bool32 ShouldPoison(u32 battlerAtk, u32 battlerDef);
bool32 AI_CanPoison(u32 battlerAtk, u32 battlerDef, enum Ability defAbility, enum Move move, enum Move partnerMove);
bool32 AI_CanParalyze(u32 battlerAtk, u32 battlerDef, enum Ability defAbility, enum Move move, enum Move partnerMove);
bool32 AI_CanConfuse(u32 battlerAtk, u32 battlerDef, enum Ability defAbility, u32 battlerAtkPartner, enum Move move, enum Move partnerMove);
bool32 ShouldBurn(u32 battlerAtk, u32 battlerDef, enum Ability abilityDef);
bool32 ShouldFreezeOrFrostbite(u32 battlerAtk, u32 battlerDef, enum Ability abilityDef);
bool32 ShouldParalyze(u32 battlerAtk, u32 battlerDef, enum Ability abilityDef);
bool32 AI_CanBurn(u32 battlerAtk, u32 battlerDef, enum Ability defAbility, u32 battlerAtkPartner, enum Move move, enum Move partnerMove);
bool32 AI_CanGiveFrostbite(u32 battlerAtk, u32 battlerDef, enum Ability defAbility, u32 battlerAtkPartner, enum Move move, enum Move partnerMove);
bool32 AI_CanBeInfatuated(u32 battlerAtk, u32 battlerDef, enum Ability defAbility);
bool32 AnyPartyMemberStatused(u32 battlerId, bool32 checkSoundproof);
bool32 ShouldTryToFlinch(u32 battlerAtk, u32 battlerDef, enum Ability atkAbility, enum Ability defAbility, enum Move move);
bool32 ShouldTrap(u32 battlerAtk, u32 battlerDef, enum Move move);
bool32 IsWakeupTurn(u32 battler);
bool32 AI_IsBattlerAsleepOrComatose(u32 battlerId);

// ability logic
bool32 IsMoxieTypeAbility(enum Ability ability);
bool32 DoesAbilityRaiseStatsWhenLowered(enum Ability ability);
bool32 ShouldTriggerAbility(u32 battlerAtk, u32 battlerDef, enum Ability ability);
bool32 CanEffectChangeAbility(u32 battlerAtk, u32 battlerDef, enum Move move, struct AiLogicData *aiData);
void AbilityChangeScore(u32 battlerAtk, u32 battlerDef, enum Move move, s32 *score, struct AiLogicData *aiData);
s32 BattlerBenefitsFromAbilityScore(u32 battler, enum Ability ability, struct AiLogicData *aiData);

// partner logic
bool32 IsTargetingPartner(u32 battlerAtk, u32 battlerDef);
// IsTargetingPartner includes a check to make sure the adjacent pokemon is truly a partner.
enum Move GetAllyChosenMove(u32 battlerId);
bool32 IsBattle1v1(void);
// IsBattle1v1 is distinct from !IsDoubleBattle. If the player is fighting Maxie and Tabitha, with Steven as their partner, and both Tabitha and Steven have run out of Pokemon, the battle is 1v1, even though mechanically it is a Double Battle for how battlers and flags are set.
// Most AI checks should be using IsBattle1v1; most engine checks should be using !IsDoubleBattle
bool32 HasTwoOpponents(u32 battler);
// HasTwoOpponents checks if the opposing side has two pokemon. Partner state is irrelevant. e.g., Dragon Darts hits one time with two opponents and twice with one opponent.
bool32 HasPartner(u32 battler);
bool32 HasPartnerIgnoreFlags(u32 battler);
// HasPartner respects the Attacks Partner AI flag; HasPartnerIgnoreFlags checks only if a live pokemon is adjacent.
bool32 AreMovesEquivalent(u32 battlerAtk, u32 battlerAtkPartner, enum Move move, enum Move partnerMove);
bool32 DoesPartnerHaveSameMoveEffect(u32 battlerAtkPartner, u32 battlerDef, enum Move move, enum Move partnerMove);
bool32 PartnerMoveEffectIsStatusSameTarget(u32 battlerAtkPartner, u32 battlerDef, enum Move partnerMove);
bool32 PartnerMoveEffectIs(u32 battlerAtkPartner, enum Move partnerMove, enum BattleMoveEffects effectCheck);
bool32 PartnerMoveIs(u32 battlerAtkPartner, enum Move partnerMove, enum Move moveCheck);
bool32 PartnerMoveIsSameAsAttacker(u32 battlerAtkPartner, u32 battlerDef, enum Move move, enum Move partnerMove);
bool32 PartnerMoveIsSameNoTarget(u32 battlerAtkPartner, enum Move move, enum Move partnerMove);
bool32 PartnerMoveActivatesSleepClause(enum Move partnerMove);
bool32 ShouldUseWishAromatherapy(u32 battlerAtk, u32 battlerDef, enum Move move);
u32 GetFriendlyFireKOThreshold(u32 battler);
bool32 IsAllyProtectingFromMove(u32 battlerAtk, enum Move attackerMove, enum Move allyMove);

// party logic
struct BattlePokemon *AllocSaveBattleMons(void);
void FreeRestoreBattleMons(struct BattlePokemon *savedBattleMons);
struct AiLogicData *AllocSaveAiLogicData(void);
void FreeRestoreAiLogicData(struct AiLogicData *savedAiLogicData);
s32 CountUsablePartyMons(u32 battlerId);
bool32 IsPartyFullyHealedExceptBattler(u32 battler);
bool32 PartyHasMoveCategory(u32 battlerId, enum DamageCategory category);
bool32 SideHasMoveCategory(u32 battlerId, enum DamageCategory category);
void GetAIPartyIndexes(u32 battlerId, s32 *firstId, s32 *lastId);
u32 GetActiveBattlerIds(u32 battler, u32 *battlerIn1, u32 *battlerIn2);
bool32 IsPartyMonOnFieldOrChosenToSwitch(u32 partyIndex, u32 battlerIn1, u32 battlerIn2);

// score increases
enum AIScore IncreaseStatUpScore(u32 battlerAtk, u32 battlerDef, enum StatChange statId);
enum AIScore IncreaseStatUpScoreContrary(u32 battlerAtk, u32 battlerDef, enum StatChange statId);
enum AIScore IncreaseStatDownScore(u32 battlerAtk, u32 battlerDef, enum Stat stat);
void IncreasePoisonScore(u32 battlerAtk, u32 battlerDef, enum Move move, s32 *score);
void IncreaseBurnScore(u32 battlerAtk, u32 battlerDef, enum Move move, s32 *score);
void IncreaseParalyzeScore(u32 battlerAtk, u32 battlerDef, enum Move move, s32 *score);
void IncreaseSleepScore(u32 battlerAtk, u32 battlerDef, enum Move move, s32 *score);
void IncreaseConfusionScore(u32 battlerAtk, u32 battlerDef, enum Move move, s32 *score);
void IncreaseFrostbiteScore(u32 battlerAtk, u32 battlerDef, enum Move move, s32 *score);
bool32 HasHPForDamagingSetup(u32 battlerAtk, u32 battlerDef, u32 hpThreshold);

s32 AI_TryToClearStats(u32 battlerAtk, u32 battlerDef, bool32 isDoubleBattle);
bool32 AI_ShouldCopyStatChanges(u32 battlerAtk, u32 battlerDef);
bool32 AI_ShouldSetUpHazards(u32 battlerAtk, u32 battlerDef, enum Move move, struct AiLogicData *aiData);
void IncreaseTidyUpScore(u32 battlerAtk, u32 battlerDef, enum Move move, s32 *score);
bool32 AI_ShouldSpicyExtract(u32 battlerAtk, u32 battlerAtkPartner, enum Move move, struct AiLogicData *aiData);
u32 IncreaseSubstituteMoveScore(u32 battlerAtk, u32 battlerDef, enum Move move);
bool32 IsBattlerItemEnabled(u32 battler);
bool32 IsBattlerPredictedToSwitch(u32 battler);
enum Move GetIncomingMove(u32 battler, u32 opposingBattler, struct AiLogicData *aiData);
enum Move GetIncomingMoveSpeedCheck(u32 battler, u32 opposingBattler, struct AiLogicData *aiData);
bool32 IsNaturalEnemy(u32 speciesAttacker, u32 speciesTarget);
bool32 AI_OpponentCanFaintAiWithMod(u32 battler, u32 healAmount);
void SetBattlerFieldStatusForSwitchin(u32 battler);
bool32 ShouldInstructPartner(u32 battlerDef, enum Move move);
bool32 CanMoveBeBouncedBack(u32 battler, enum Move move);

// Switching and item helpers
bool32 AiExpectsToFaintPlayer(u32 battler);

// These are for the purpose of not doubling up on moves during double battles.
// Used in GetAIEffectGroup for move effects and GetAIEffectGroupFromMove for additional effects
#define AI_EFFECT_NONE                        0
#define AI_EFFECT_WEATHER              (1 <<  0)
#define AI_EFFECT_TERRAIN              (1 <<  1)
#define AI_EFFECT_CLEAR_HAZARDS        (1 <<  2)
#define AI_EFFECT_BREAK_SCREENS        (1 <<  3)
#define AI_EFFECT_RESET_STATS          (1 <<  4)
#define AI_EFFECT_FORCE_SWITCH         (1 <<  5)
#define AI_EFFECT_TORMENT              (1 <<  6)
#define AI_EFFECT_LIGHT_SCREEN         (1 <<  7)
#define AI_EFFECT_REFLECT              (1 <<  8)
#define AI_EFFECT_GRAVITY              (1 <<  9)
#define AI_EFFECT_CHANGE_ABILITY       (1 << 10)

// As Aurora Veil should almost never be used alongside the other screens, we save the bit.
#define AI_EFFECT_AURORA_VEIL          (AI_EFFECT_LIGHT_SCREEN | AI_EFFECT_REFLECT)

#endif //GUARD_BATTLE_AI_UTIL_H
