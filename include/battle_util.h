#ifndef GUARD_BATTLE_UTIL_H
#define GUARD_BATTLE_UTIL_H

#include "move.h"
#include "constants/battle_string_ids.h"
#include "constants/hold_effects.h"

#define MOVE_LIMITATION_ZEROMOVE                (1 << 0)
#define MOVE_LIMITATION_PP                      (1 << 1)
#define MOVE_LIMITATION_DISABLED                (1 << 2)
#define MOVE_LIMITATION_TORMENTED               (1 << 3)
#define MOVE_LIMITATION_TAUNT                   (1 << 4)
#define MOVE_LIMITATION_IMPRISON                (1 << 5)
#define MOVE_LIMITATION_ENCORE                  (1 << 6)
#define MOVE_LIMITATION_CHOICE_ITEM             (1 << 7)
#define MOVE_LIMITATION_ASSAULT_VEST            (1 << 8)
#define MOVE_LIMITATION_GRAVITY                 (1 << 9)
#define MOVE_LIMITATION_HEAL_BLOCK              (1 << 10)
#define MOVE_LIMITATION_BELCH                   (1 << 11)
#define MOVE_LIMITATION_THROAT_CHOP             (1 << 12)
#define MOVE_LIMITATION_STUFF_CHEEKS            (1 << 13)
#define MOVE_LIMITATION_CANT_USE_TWICE          (1 << 14)

#define MOVE_LIMITATION_PLACEHOLDER             (1 << 15)
#define MOVE_LIMITATIONS_ALL                    0xFFFF

// Switches between simulated battle calc and actual battle combat
enum ResultOption
{
    CHECK_TRIGGER, // Check the function without running scripts / setting any flags.
    AI_CHECK,  // Check the function without running scripts / setting any flags. Same as CHECK_TRIGGER but only used when additional data has to be fetched during ai calcs
    RUN_SCRIPT,
};

enum FieldEffectCases
{
    FIELD_EFFECT_TRAINER_STATUSES,
    FIELD_EFFECT_OVERWORLD_TERRAIN,
    FIELD_EFFECT_OVERWORLD_WEATHER,
};

enum AbilityEffect
{
    ABILITYEFFECT_ENDTURN,
    ABILITYEFFECT_MOVE_END_ATTACKER,
    ABILITYEFFECT_COLOR_CHANGE, // Color Change / Berserk / Anger Shell
    ABILITYEFFECT_MOVE_END,
    ABILITYEFFECT_IMMUNITY,
    ABILITYEFFECT_SYNCHRONIZE,
    ABILITYEFFECT_ATK_SYNCHRONIZE,
    ABILITYEFFECT_FORM_CHANGE_ON_HIT,
    ABILITYEFFECT_MOVE_END_OTHER,
    ABILITYEFFECT_MOVE_END_FOES_FAINTED, // Moxie-like abilities / Battle Bond / Magician

    // On Switch in
    ABILITYEFFECT_TERA_SHIFT,
    ABILITYEFFECT_NEUTRALIZINGGAS,
    ABILITYEFFECT_UNNERVE,
    ABILITYEFFECT_ON_SWITCHIN,
    ABILITYEFFECT_SWITCH_IN_FORM_CHANGE,
    ABILITYEFFECT_COMMANDER, // Commander / Hospitality / Costar
    ABILITYEFFECT_ON_WEATHER,
    ABILITYEFFECT_ON_TERRAIN,
    ABILITYEFFECT_OPPORTUNIST,
};

enum ItemEffect
{
    ITEM_NO_EFFECT,
    ITEM_STATUS_CHANGE,
    ITEM_EFFECT_OTHER,
    ITEM_PP_CHANGE,
    ITEM_HP_CHANGE,
    ITEM_STATS_CHANGE,
};

#define IS_WHOLE_SIDE_ALIVE(battler)    ((IsBattlerAlive(battler) && IsBattlerAlive(BATTLE_PARTNER(battler))))
#define IS_ALIVE_AND_PRESENT(battler)   (IsBattlerAlive(battler) && IsBattlerSpritePresent(battler))

// Lowest and highest percentages used for damage roll calculations
#define DMG_ROLL_PERCENT_LO 85
#define DMG_ROLL_PERCENT_HI 100

// Crit chance exceptions
#define CRITICAL_HIT_BLOCKED -1
#define CRITICAL_HIT_ALWAYS  -2

// for Natural Gift and Fling
struct TypePower
{
    enum Type type:8;
    u8 power;
    u16 effect;
};

enum ImmunityHealStatusOutcome
{
    IMMUNITY_NO_EFFECT,
    IMMUNITY_STATUS_CLEARED,
    IMMUNITY_CONFUSION_CLEARED,
    IMMUNITY_INFATUATION_CLEARED,
    IMMUNITY_TAUNT_CLEARED,
};

extern const struct TypePower gNaturalGiftTable[];

struct BattleContext
{
    enum BattlerId battlerAtk:3;
    enum BattlerId battlerDef:3;
    u32 fixedBasePower:8;
    u32 weather:16;
    u32 unused:2;
    u32 fieldStatuses;

    enum Move move:13;
    enum Move chosenMove:13; // May be different to 'move', e.g. for Z moves.
    enum Type moveType:6;

    uq4_12_t typeEffectivenessModifier;
    enum Ability abilityAtk;
    enum Ability abilityDef;
    enum HoldEffect holdEffectAtk;
    enum HoldEffect holdEffectDef;

    // Flags
    u32 isCrit:1;
    u32 randomFactor:1;
    u32 updateFlags:1;
    u32 isAnticipation:1;
    u32 isSelfInflicted:1;
    u32 aiCalc:1;
    u32 aiCheckBerryModifier:1; // Flags that KOing through a berry should be checked
    u32 airBalloonBlocked:1;
    u32 abilityBlocked:1;
    u32 runScript:1;  // Used during actual combat where scripts have to be run / flags need to be set
    u32 padding:22;
};

// Helper struct to keep the arg list small and prevent constant recalculations of abilities/hold effects.
struct BattleCalcValues
{
    enum BattlerId battlerAtk:3;
    enum BattlerId battlerDef:3;
    enum Move move:16;
    u32 padding:10;
    enum Ability abilities[MAX_BATTLERS_COUNT];
    enum HoldEffect holdEffects[MAX_BATTLERS_COUNT];
};

enum SleepClauseBlock
{
    NOT_BLOCKED_BY_SLEEP_CLAUSE,
    BLOCKED_BY_SLEEP_CLAUSE,
};

enum SkyDropState
{
    SKY_DROP_IGNORE,
    SKY_DROP_ATTACKCANCELER_CHECK,
    SKY_DROP_GRAVITY_ON_AIRBORNE,
    SKY_DROP_CANCEL_MULTI_TURN_MOVES,
    SKY_DROP_STATUS_YAWN,
    SKY_DROP_STATUS_FREEZE_SLEEP,
};

#define SKY_DROP_NO_TARGET 0xFF
#define SKY_DROP_RELEASED_TARGET 0xFE

enum EjectPackTiming
{
    START_OF_TURN,
    END_TURN,
    OTHER,
};

void HandleAction_ThrowBall(void);
uq4_12_t CalcTypeEffectivenessMultiplierHelper(enum Move move, enum Type moveType, enum BattlerId battlerAtk, enum BattlerId battlerDef, enum Ability abilityAtk, enum Ability abilityDef, bool32 recordAbilities);
u32 GetCurrentBattleWeather(void);
bool32 EndOrContinueWeather(void);
enum DamageCategory GetReflectDamageMoveDamageCategory(enum BattlerId battler, enum Move move);
bool32 IsUnnerveBlocked(enum BattlerId battler, enum Item itemId);
bool32 IsAffectedByFollowMe(enum BattlerId battlerAtk, enum BattleSide defSide, enum Move move);
void DetermineTarget(enum MoveTarget moveTarget, bool32 overwriteTarget);
void HandleAction_UseMove(void);
void HandleAction_Switch(void);
void HandleAction_UseItem(void);
bool32 TryRunFromBattle(enum BattlerId battler);
void HandleAction_Run(void);
void HandleAction_WatchesCarefully(void);
void HandleAction_SafariZoneBallThrow(void);
void HandleAction_ThrowBait(void);
void HandleAction_ThrowRock(void);
void HandleAction_SafariZoneRun(void);
void HandleAction_OldManBallThrow(void);
void HandleAction_TryFinish(void);
void HandleAction_NothingIsFainted(void);
void HandleAction_ActionFinished(void);
enum BattlerId GetBattlerForBattleScript(u8 caseId);
bool32 IsBattlerMarkedForControllerExec(enum BattlerId battler);
void MarkBattlerForControllerExec(enum BattlerId battler);
void MarkBattlerReceivedLinkData(enum BattlerId battler);
const u8 *CancelMultiTurnMoves(enum BattlerId battler, enum SkyDropState skyDropState);
bool32 IsLastMonToMove(enum BattlerId battler);
bool32 ShouldDefiantCompetitiveActivate(enum BattlerId battler, enum Ability ability);
void PrepareStringBattle(enum StringID stringId, enum BattlerId battler);
void ResetSentPokesToOpponentValue(void);
void OpponentSwitchInResetSentPokesToOpponentValue(enum BattlerId battler);
void UpdateSentPokesToOpponentValue(enum BattlerId battler);
void BattleScriptPush(const u8 *bsPtr);
void BattleScriptPushCursor(void);
void BattleScriptCall(const u8 *bsPtr);
void BattleScriptPop(void);
u32 TrySetCantSelectMoveBattleScript(enum BattlerId battler);
u32 CheckMoveLimitations(enum BattlerId battler, u8 unusableMoves, u16 check);
bool32 AreAllMovesUnusable(enum BattlerId battler);
u8 GetImprisonedMovesCount(enum BattlerId battler, enum Move move);
s32 GetDrainedBigRootHp(enum BattlerId battler, s32 hp);
bool32 IsAbilityAndRecord(enum BattlerId battler, enum Ability battlerAbility, enum Ability abilityToCheck);
bool32 HandleFaintedMonActions(void);
void TryClearRageAndFuryCutter(void);
bool32 HasNoMonsToSwitch(enum BattlerId battler, u8 partyIdBattlerOn1, u8 partyIdBattlerOn2);
bool32 TryChangeBattleWeather(enum BattlerId battler, u32 battleWeatherId, enum Ability ability);
bool32 TryChangeBattleTerrain(enum BattlerId battler, u32 statusFlag);
bool32 CanAbilityBlockMove(enum BattlerId battlerAtk, enum BattlerId battlerDef, enum Ability abilityAtk, enum Ability abilityDef, u32 move, enum ResultOption option);
bool32 CanTargetBlockPranksterMove(struct BattleContext *ctx, s32 movePriority);
bool32 CanPsychicTerrainProtectTarget(struct BattleContext *ctx, s32 movePriority);
bool32 CanMoveBeBlockedByTarget(struct BattleContext *ctx, s32 movePriority);
bool32 CanAbilityAbsorbMove(struct BattleContext *ctx);
bool32 TryFieldEffects(enum FieldEffectCases caseId);
u32 AbilityBattleEffects(enum AbilityEffect caseID, enum BattlerId battler, enum Ability ability, enum Move move, bool32 shouldAbilityTrigger);
bool32 TryPrimalReversion(enum BattlerId battler);
bool32 IsNeutralizingGasOnField(void);
bool32 IsMoldBreakerTypeAbility(enum BattlerId battler, enum Ability ability);
enum Ability GetBattlerAbilityIgnoreMoldBreaker(enum BattlerId battler);
enum Ability GetBattlerAbilityNoAbilityShield(enum BattlerId battler);
enum Ability GetBattlerAbilityInternal(enum BattlerId battler, bool32 ignoreMoldBreaker, bool32 noAbilityShield);
enum Ability GetBattlerAbility(enum BattlerId battler);
u32 IsAbilityOnSide(enum BattlerId battler, enum Ability ability);
u32 IsAbilityOnOpposingSide(enum BattlerId battler, enum Ability ability);
u32 IsAbilityOnField(enum Ability ability);
u32 IsAbilityOnFieldExcept(enum BattlerId battler, enum Ability ability);
u32 IsAbilityPreventingEscape(enum BattlerId battler);
bool32 IsBattlerProtected(struct BattleContext *ctx);
enum ProtectType GetProtectType(enum ProtectMethod method);
bool32 CanBattlerEscape(enum BattlerId battler); // no ability check
void BattleScriptExecute(const u8 *BS_ptr);
void BattleScriptPushCursorAndCallback(const u8 *BS_ptr);
void ClearVariousBattlerFlags(enum BattlerId battler);
void HandleAction_RunBattleScript(void);
u32 SetRandomTarget(enum BattlerId battlerAtk);
u32 GetBattleMoveTarget(enum Move move, enum MoveTarget moveTarget);
enum Obedience GetAttackerObedienceForAction(void);
enum HoldEffect GetBattlerHoldEffect(enum BattlerId battler);
enum HoldEffect GetBattlerHoldEffectIgnoreAbility(enum BattlerId battler);
enum HoldEffect GetBattlerHoldEffectIgnoreNegation(enum BattlerId battler);
enum HoldEffect GetBattlerHoldEffectInternal(enum BattlerId battler, enum Ability ability);
u32 GetBattlerHoldEffectParam(enum BattlerId battler);
bool32 CanBattlerAvoidContactEffects(enum BattlerId battlerAtk, enum BattlerId battlerDef, enum Ability abilityAtk, enum HoldEffect holdEffectAtk, enum Move move);
bool32 IsMoveMakingContact(enum BattlerId battlerAtk, enum BattlerId battlerDef, enum Ability abilityAtk, enum HoldEffect holdEffectAtk, enum Move move);
bool32 IsBattlerGrounded(enum BattlerId battler, enum Ability ability, enum HoldEffect holdEffect);
u32 GetMoveSlot(u16 *moves, enum Move move);
u32 GetBattlerWeight(enum BattlerId battler);
s32 CalcCritChanceStage(struct BattleContext *ctx);
s32 CalcCritChanceStageGen1(struct BattleContext *ctx);
s32 CalculateMoveDamage(struct BattleContext *ctx);
s32 CalculateMoveDamageVars(struct BattleContext *ctx);
s32 DoFixedDamageMoveCalc(struct BattleContext *ctx);
s32 ApplyModifiersAfterDmgRoll(struct BattleContext *ctx, s32 dmg);
uq4_12_t CalcTypeEffectivenessMultiplier(struct BattleContext *ctx);
uq4_12_t CalcPartyMonTypeEffectivenessMultiplier(enum Move move, u16 speciesDef, enum Ability abilityDef);
uq4_12_t GetTypeModifier(enum Type atkType, enum Type defType);
uq4_12_t GetOverworldTypeEffectiveness(struct Pokemon *mon, enum Type moveType);
void UpdateMoveResultFlags(uq4_12_t modifier, u16 *resultFlags);
s32 GetStealthHazardDamage(enum TypeSideHazard hazardType, enum BattlerId battler);
s32 GetStealthHazardDamageByTypesAndHP(enum TypeSideHazard hazardType, enum Type type1, enum Type type2, u32 maxHp);
bool32 CanMegaEvolve(enum BattlerId battler);
bool32 CanUltraBurst(enum BattlerId battler);
void ActivateMegaEvolution(enum BattlerId battler);
void ActivateUltraBurst(enum BattlerId battler);
bool32 IsBattlerMegaEvolved(enum BattlerId battler);
bool32 IsBattlerPrimalReverted(enum BattlerId battler);
bool32 IsBattlerUltraBursted(enum BattlerId battler);
u32 GetBattleFormChangeTargetSpecies(enum BattlerId battler, enum FormChanges method, enum Ability ability);
bool32 TryRevertPartyMonFormChange(u32 partyIndex);
bool32 TryBattleFormChange(enum BattlerId battler, enum FormChanges method, enum Ability ability);
bool32 DoBattlersShareType(enum BattlerId battler1, enum BattlerId battler2);
bool32 CanBattlerGetOrLoseItem(enum BattlerId fromBattler, enum BattlerId battler, enum Item itemId);
u32 GetBattlerVisualSpecies(enum BattlerId battler);
bool32 TryClearIllusion(enum BattlerId battler, enum Ability ability);
u32 GetIllusionMonSpecies(enum BattlerId battler);
struct Pokemon *GetIllusionMonPtr(enum BattlerId battler);
void ClearIllusionMon(enum BattlerId battler);
u32 GetIllusionMonPartyId(struct Pokemon *party, struct Pokemon *mon, struct Pokemon *partnerMon, enum BattlerId battler);
void SetIllusionMon(struct Pokemon *mon, enum BattlerId battler);
enum ImmunityHealStatusOutcome TryImmunityAbilityHealStatus(enum BattlerId battler);
bool32 ShouldGetStatBadgeBoost(u16 flagId, enum BattlerId battler);
uq4_12_t GetBadgeBoostModifier(void);
enum DamageCategory GetBattleMoveCategory(enum Move move);
void SetDynamicMoveCategory(enum BattlerId battlerAtk, enum BattlerId battlerDef, enum Move move);
bool32 CanFling(enum BattlerId battlerAtk);
bool32 IsTelekinesisBannedSpecies(u16 species);
bool32 IsHealBlockPreventingMove(enum BattlerId battler, enum Move move);
bool32 IsGravityPreventingMove(enum Move move);
bool32 IsBelchPreventingMove(enum BattlerId battler, enum Move move);
bool32 HasEnoughHpToEatBerry(enum BattlerId battler, enum Ability ability, u32 hpFraction, enum Item itemId);
bool32 IsPartnerMonFromSameTrainer(enum BattlerId battler);
enum DamageCategory GetCategoryBasedOnStats(enum BattlerId battler);
void SetShellSideArmCategory(void);
bool32 MoveIsAffectedBySheerForce(enum Move move);
bool32 IsSheerForceAffected(enum Move move, enum Ability ability);
void TryRestoreHeldItems(void);
bool32 CanStealItem(enum BattlerId battlerStealing, enum BattlerId battlerItem, enum Item item);
void TrySaveExchangedItem(enum BattlerId battler, enum Item stolenItem);
bool32 IsBattlerAffectedByHazards(enum BattlerId battler, enum HoldEffect holdEffect, bool32 toxicSpikes);
void SortBattlersBySpeed(enum BattlerId *battlers, bool32 slowToFast);
bool32 CompareStat(enum BattlerId battler, enum Stat statId, u32 cmpTo, u32 cmpKind, enum Ability ability);
bool32 BlocksPrankster(enum Move move, enum BattlerId battlerPrankster, enum BattlerId battlerDef, bool32 checkTarget);
bool32 PickupHasValidTarget(enum BattlerId battler);
bool32 CantPickupItem(u32 battler);
bool32 IsBattlerWeatherAffected(enum BattlerId battler, u32 weatherFlags);
enum MoveTarget GetBattlerMoveTargetType(enum BattlerId battler, enum Move move);
bool32 CanTargetBattler(enum BattlerId battlerAtk, enum BattlerId battlerDef, enum Move move);
u32 GetNextTarget(u32 moveTarget, bool32 excludeCurrent);
void CopyMonLevelAndBaseStatsToBattleMon(enum BattlerId battler, struct Pokemon *mon);
void CopyMonAbilityAndTypesToBattleMon(enum BattlerId battler, struct Pokemon *mon);
void RecalcBattlerStats(enum BattlerId battler, struct Pokemon *mon, bool32 isDynamaxing);
bool32 IsGen6ExpShareEnabled(void);
bool32 MoveHasAdditionalEffect(enum Move move, enum MoveEffect moveEffect);
bool32 MoveHasAdditionalEffectWithChance(enum Move move, enum MoveEffect moveEffect, u32 chance);
bool32 MoveHasAdditionalEffectSelf(enum Move move, enum MoveEffect moveEffect);
bool32 IsMoveEffectRemoveSpeciesType(enum Move move, enum MoveEffect moveEffect, u32 argument);
bool32 MoveHasChargeTurnAdditionalEffect(enum Move move);
bool32 CanTargetPartner(enum BattlerId battlerAtk, enum BattlerId battlerDef);
bool32 IsBattlerUnaffectedByMove(enum BattlerId battler);
bool32 MoodyCantRaiseStat(u32 stat);
bool32 MoodyCantLowerStat(u32 stat);
bool32 IsPsychicTerrainAffected(enum BattlerId battler, enum Ability ability, enum HoldEffect holdEffect, u32 fieldStatuses);
bool32 IsMistyTerrainAffected(enum BattlerId battler, enum Ability ability, enum HoldEffect holdEffect, u32 fieldStatuses);
bool32 IsGrassyTerrainAffected(enum BattlerId battler, enum Ability ability, enum HoldEffect holdEffect, u32 fieldStatuses);
bool32 IsElectricTerrainAffected(enum BattlerId battler, enum Ability ability, enum HoldEffect holdEffect, u32 fieldStatuses);
bool32 IsAnyTerrainAffected(enum BattlerId battler, enum Ability ability, enum HoldEffect holdEffect, u32 fieldStatuses);
bool32 IsBattlerTerrainAffected(enum BattlerId battler, enum Ability ability, enum HoldEffect holdEffect, u32 fieldStatuses, u32 terrainFlag);
enum Stat GetHighestStatId(enum BattlerId battler);
enum Stat GetParadoxHighestStatId(enum BattlerId battler);
enum Stat GetParadoxBoostedStatId(enum BattlerId battler);

bool32 CanBeSlept(enum BattlerId battlerAtk, enum BattlerId battlerDef, enum Ability abilityDef, enum SleepClauseBlock isBlockedBySleepClause);
bool32 CanBePoisoned(enum BattlerId battlerAtk, enum BattlerId battlerDef, enum Ability abilityAtk, enum Ability abilityDef);
bool32 CanBeBurned(enum BattlerId battlerAtk, enum BattlerId battlerDef, enum Ability ability);
bool32 CanBeParalyzed(enum BattlerId battlerAtk, enum BattlerId battlerDef, enum Ability abilityDef);
bool32 CanBeFrozen(enum BattlerId battlerAtk, enum BattlerId battlerDef, enum Ability abilityDef);
bool32 CanGetFrostbite(enum BattlerId battlerAtk, enum BattlerId battlerDef, enum Ability abilityDef);
bool32 CanSetNonVolatileStatus(enum BattlerId battlerAtk, enum BattlerId battlerDef, enum Ability abilityAtk, enum Ability abilityDef, enum MoveEffect secondaryMoveEffect, enum ResultOption option);
bool32 CanBeConfused(enum BattlerId battler);
u32 GetBattlerAffectionHearts(enum BattlerId battler);
void TryToRevertMimicryAndFlags(void);
bool32 BattleArenaTurnEnd(void);
u32 CountBattlerStatIncreases(enum BattlerId battler, bool32 countEvasionAcc);
bool32 BattlerHasCopyableChanges(enum BattlerId battler);
bool32 ChangeTypeBasedOnTerrain(enum BattlerId battler);
void RemoveConfusionStatus(enum BattlerId battler);
u32 GetBattlerGender(enum BattlerId battler);
bool32 AreBattlersOfOppositeGender(enum BattlerId battler1, enum BattlerId battler2);
bool32 AreBattlersOfSameGender(enum BattlerId battler1, enum BattlerId battler2);
u32 CalcSecondaryEffectChance(enum BattlerId battler, enum Ability battlerAbility, const struct AdditionalEffect *additionalEffect);
bool32 MoveEffectIsGuaranteed(enum BattlerId battler, enum Ability battlerAbility, const struct AdditionalEffect *additionalEffect);
void GetBattlerTypes(enum BattlerId battler, bool32 ignoreTera, enum Type types[static 3]);
enum Type GetBattlerType(enum BattlerId battler, u32 typeIndex, bool32 ignoreTera);
bool32 CanMonParticipateInSkyBattle(struct Pokemon *mon);
void RemoveBattlerType(enum BattlerId battler, enum Type type);
enum Type GetBattleMoveType(enum Move move);
void TryActivateSleepClause(enum BattlerId battler, u32 indexInParty);
void TryDeactivateSleepClause(enum BattleSide battlerSide, u32 indexInParty);
bool32 IsSleepClauseActiveForSide(enum BattleSide battlerSide);
bool32 IsSleepClauseEnabled(void);
void ClearDamageCalcResults(void);
u32 DoesDestinyBondFail(enum BattlerId battler);
bool32 IsMoveEffectBlockedByTarget(enum Ability ability);
bool32 SetTargetToNextPursuiter(enum BattlerId battlerDef);
bool32 IsPursuitTargetSet(void);
void ClearPursuitValuesIfSet(enum BattlerId battler);
void ClearPursuitValues(void);
bool32 HasWeatherEffect(void);
bool32 IsFutureSightAttackerInParty(enum BattlerId battlerAtk, enum BattlerId battlerDef, enum Move move);
bool32 HadMoreThanHalfHpNowDoesnt(enum BattlerId battler);
void ChooseStatBoostAnimation(enum BattlerId battler);
void UpdateStallMons(void);
bool32 TrySwitchInEjectPack(enum EjectPackTiming timing);
bool32 EmergencyExitCanBeTriggered(enum BattlerId battler);
bool32 TryTriggerSymbiosis(enum BattlerId battler, u32 ally);
bool32 TrySymbiosis(enum BattlerId battler, enum Item itemId, bool32 moveEnd);
void BestowItem(enum BattlerId battlerAtk, enum BattlerId battlerDef);
ARM_FUNC u32 GetBattlerVolatile(enum BattlerId battler, enum Volatile _volatile);
void SetMonVolatile(enum BattlerId battler, enum Volatile _volatile, u32 newValue);
bool32 ItemHealMonVolatile(enum BattlerId battler, enum Item itemId);
void PushHazardTypeToQueue(enum BattleSide side, enum Hazards hazardType);
bool32 IsHazardOnSide(enum BattleSide side, enum Hazards hazardType);
bool32 AreAnyHazardsOnSide(enum BattleSide side);
void RemoveAllHazardsFromField(enum BattleSide side);
bool32 IsHazardOnSideAndClear(enum BattleSide side, enum Hazards hazardType);
void RemoveHazardFromField(enum BattleSide side, enum Hazards hazardType);
bool32 CanMoveSkipAccuracyCalc(enum BattlerId battlerAtk, enum BattlerId battlerDef, enum Ability abilityAtk, enum Ability abilityDef, enum Move move, enum ResultOption option);
u32 GetTotalAccuracy(enum BattlerId battlerAtk, enum BattlerId battlerDef, enum Move move, enum Ability atkAbility, enum Ability defAbility, enum HoldEffect atkHoldEffect, enum HoldEffect defHoldEffect);
bool32 DoesOHKOMoveMissTarget(struct BattleCalcValues *cv);
bool32 DoesMoveMissTarget(struct BattleCalcValues *cv);
bool32 IsSemiInvulnerable(enum BattlerId battler, enum SemiInvulnerableExclusion excludeCommander);
bool32 BreaksThroughSemiInvulnerablity(enum BattlerId battlerAtk, enum BattlerId battlerDef, enum Ability abilityAtk, enum Ability abilityDef, enum Move move);
bool32 HasPartnerTrainer(enum BattlerId battler);
bool32 IsAffectedByPowderMove(enum BattlerId battler, enum Ability ability, enum HoldEffect holdEffect);
enum Move GetNaturePowerMove(void);
void RemoveAbilityFlags(enum BattlerId battler);
void CheckSetUnburden(enum BattlerId battler);
bool32 IsDazzlingAbility(enum Ability ability);
bool32 IsAllowedToUseBag(void);
bool32 IsAnyTargetTurnDamaged(enum BattlerId battlerAtk);
bool32 IsAnyTargetAffected(void);
bool32 IsMimikyuDisguised(enum BattlerId battler);
bool32 IsDoubleSpreadMove(void);
bool32 IsBattlerInvalidForSpreadMove(enum BattlerId battlerAtk, enum BattlerId battlerDef);
void SetStartingStatus(enum StartingStatus status);
void ResetStartingStatuses(void);
bool32 IsUsableWhileAsleepEffect(enum BattleMoveEffects effect);
void SetWrapTurns(enum BattlerId battler, enum HoldEffect holdEffect);
bool32 ChangeOrderTargetAfterAttacker(void);
void TryUpdateEvolutionTracker(enum EvolutionConditions evolutionCondition, u32 upAmount, enum Move usedMove);
bool32 CanUseMoveConsecutively(enum BattlerId battler);
void TryResetConsecutiveUseCounter(enum BattlerId battler);
void SetOrClearRageVolatile(void);

#endif // GUARD_BATTLE_UTIL_H
