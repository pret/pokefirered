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
    ABILITYEFFECT_ON_SWITCHIN,
    ABILITYEFFECT_ENDTURN,
    ABILITYEFFECT_MOVE_END_ATTACKER,
    ABILITYEFFECT_COLOR_CHANGE, // Color Change / Berserk / Anger Shell
    ABILITYEFFECT_MOVE_END,
    ABILITYEFFECT_IMMUNITY,
    ABILITYEFFECT_SYNCHRONIZE,
    ABILITYEFFECT_ATK_SYNCHRONIZE,
    ABILITYEFFECT_MOVE_END_OTHER,
    ABILITYEFFECT_MOVE_END_FOES_FAINTED, // Moxie-like abilities / Battle Bond / Magician

    // On Switch in
    ABILITYEFFECT_TERA_SHIFT,
    ABILITYEFFECT_NEUTRALIZINGGAS,
    ABILITYEFFECT_UNNERVE,
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
    enum Type type;
    u8 power;
    u16 effect;
};

enum MoveSuccessOrder
{
    CANCELER_STANCE_CHANGE_1,
    CANCELER_CLEAR_FLAGS,
    CANCELER_SKY_DROP,
    CANCELER_RECHARGE,
    CANCELER_CHILLY_RECEPTION,
    CANCELER_ASLEEP_OR_FROZEN,
    CANCELER_POWER_POINTS,
    CANCELER_OBEDIENCE,
    CANCELER_TRUANT,
    CANCELER_FOCUS_GEN5,
    CANCELER_FLINCH,
    CANCELER_DISABLED,
    CANCELER_VOLATILE_BLOCKED, // Gravity / Heal Block / Throat Chop
    CANCELER_TAUNTED,
    CANCELER_IMPRISONED,
    CANCELER_CONFUSED,
    CANCELER_GHOST,
    CANCELER_PARALYZED,
    CANCELER_INFATUATION,
    CANCELER_BIDE,
    CANCELER_Z_MOVES,
    CANCELER_CHOICE_LOCK,
    CANCELER_CALLSUBMOVE,
    CANCELER_THAW,
    CANCELER_STANCE_CHANGE_2,
    CANCELER_ATTACKSTRING,
    CANCELER_PPDEDUCTION,
    CANCELER_SKY_BATTLE,
    CANCELER_WEATHER_PRIMAL,
    CANCELER_FOCUS_PRE_GEN5,
    CANCELER_MOVE_FAILURE,
    CANCELER_POWDER_STATUS,
    CANCELER_PRIORITY_BLOCK,
    CANCELER_PROTEAN,
    CANCELER_EXPLODING_DAMP,
    CANCELER_EXPLOSION,
    CANCELER_CHARGING,
    CANCELER_NO_TARGET,
    CANCELER_TOOK_ATTACK,
    CANCELER_TARGET_FAILURE,
    CANCELER_NOT_FULLY_PROTECTED,
    CANCELER_MULTIHIT_MOVES,
    CANCELER_END,
};

enum Obedience
{
    OBEYS,
    DISOBEYS_LOAFS,
    DISOBEYS_HITS_SELF,
    DISOBEYS_FALL_ASLEEP,
    DISOBEYS_WHILE_ASLEEP,
    DISOBEYS_RANDOM_MOVE,
};

enum MoveCanceler
{
    MOVE_STEP_SUCCESS,
    MOVE_STEP_BREAK, // Runs script. Increments state
    MOVE_STEP_PAUSE, // Runs script. Does not increment state
    MOVE_STEP_FAILURE, // Move failed, jump to script that handles the failure
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
    u32 battlerAtk:3;
    u32 battlerDef:3;
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
    u32 battlerAtk:3;
    u32 battlerDef:3;
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
uq4_12_t CalcTypeEffectivenessMultiplierHelper(enum Move move, enum Type moveType, u32 battlerAtk, u32 battlerDef, enum Ability abilityAtk, enum Ability abilityDef, bool32 recordAbilities);
u32 GetCurrentBattleWeather(void);
bool32 EndOrContinueWeather(void);
bool32 IsUnnerveBlocked(u32 battler, enum Item itemId);
bool32 IsAffectedByFollowMe(u32 battlerAtk, enum BattleSide defSide, enum Move move);
void DetermineTarget(enum MoveTarget moveTarget, bool32 overwriteTarget);
void HandleAction_UseMove(void);
void HandleAction_Switch(void);
void HandleAction_UseItem(void);
bool32 TryRunFromBattle(u32 battler);
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
u8 GetBattlerForBattleScript(u8 caseId);
bool32 IsBattlerMarkedForControllerExec(u32 battler);
void MarkBattlerForControllerExec(u32 battler);
void MarkBattlerReceivedLinkData(u32 battler);
const u8 *CancelMultiTurnMoves(u32 battler, enum SkyDropState skyDropState);
bool32 IsLastMonToMove(u32 battler);
bool32 ShouldDefiantCompetitiveActivate(u32 battler, enum Ability ability);
void PrepareStringBattle(enum StringID stringId, u32 battler);
void ResetSentPokesToOpponentValue(void);
void OpponentSwitchInResetSentPokesToOpponentValue(u32 battler);
void UpdateSentPokesToOpponentValue(u32 battler);
void BattleScriptPush(const u8 *bsPtr);
void BattleScriptPushCursor(void);
void BattleScriptCall(const u8 *bsPtr);
void BattleScriptPop(void);
u32 TrySetCantSelectMoveBattleScript(u32 battler);
u32 CheckMoveLimitations(u32 battler, u8 unusableMoves, u16 check);
bool32 AreAllMovesUnusable(u32 battler);
u8 GetImprisonedMovesCount(u32 battler, enum Move move);
s32 GetDrainedBigRootHp(u32 battler, s32 hp);
bool32 IsAbilityAndRecord(u32 battler, enum Ability battlerAbility, enum Ability abilityToCheck);
bool32 HandleFaintedMonActions(void);
void TryClearRageAndFuryCutter(void);
enum MoveCanceler AtkCanceler_MoveSuccessOrder(void);
bool32 HasNoMonsToSwitch(u32 battler, u8 partyIdBattlerOn1, u8 partyIdBattlerOn2);
bool32 TryChangeBattleWeather(u32 battler, u32 battleWeatherId, enum Ability ability);
bool32 TryChangeBattleTerrain(u32 battler, u32 statusFlag);
bool32 CanAbilityBlockMove(u32 battlerAtk, u32 battlerDef, enum Ability abilityAtk, enum Ability abilityDef, u32 move, enum ResultOption option);
bool32 CanTargetBlockPranksterMove(struct BattleContext *ctx, s32 movePriority);
bool32 CanPsychicTerrainProtectTarget(struct BattleContext *ctx, s32 movePriority);
bool32 CanMoveBeBlockedByTarget(struct BattleContext *ctx, s32 movePriority);
bool32 CanAbilityAbsorbMove(struct BattleContext *ctx);
bool32 TryFieldEffects(enum FieldEffectCases caseId);
u32 AbilityBattleEffects(enum AbilityEffect caseID, u32 battler, enum Ability ability, enum Move move, bool32 shouldAbilityTrigger);
bool32 TryPrimalReversion(u32 battler);
bool32 IsNeutralizingGasOnField(void);
bool32 IsMoldBreakerTypeAbility(u32 battler, enum Ability ability);
enum Ability GetBattlerAbilityIgnoreMoldBreaker(u32 battler);
enum Ability GetBattlerAbilityNoAbilityShield(u32 battler);
enum Ability GetBattlerAbilityInternal(u32 battler, bool32 ignoreMoldBreaker, bool32 noAbilityShield);
enum Ability GetBattlerAbility(u32 battler);
u32 IsAbilityOnSide(u32 battler, enum Ability ability);
u32 IsAbilityOnOpposingSide(u32 battler, enum Ability ability);
u32 IsAbilityOnField(enum Ability ability);
u32 IsAbilityOnFieldExcept(u32 battler, enum Ability ability);
u32 IsAbilityPreventingEscape(u32 battler);
bool32 IsBattlerProtected(struct BattleContext *ctx);
enum ProtectType GetProtectType(enum ProtectMethod method);
bool32 CanBattlerEscape(u32 battler); // no ability check
void BattleScriptExecute(const u8 *BS_ptr);
void BattleScriptPushCursorAndCallback(const u8 *BS_ptr);
void ClearVariousBattlerFlags(u32 battler);
void HandleAction_RunBattleScript(void);
u32 SetRandomTarget(u32 battler);
u32 GetBattleMoveTarget(enum Move move, enum MoveTarget moveTarget);
enum Obedience GetAttackerObedienceForAction(void);
enum HoldEffect GetBattlerHoldEffect(u32 battler);
enum HoldEffect GetBattlerHoldEffectIgnoreAbility(u32 battler);
enum HoldEffect GetBattlerHoldEffectIgnoreNegation(u32 battler);
enum HoldEffect GetBattlerHoldEffectInternal(u32 battler, enum Ability ability);
u32 GetBattlerHoldEffectParam(u32 battler);
bool32 CanBattlerAvoidContactEffects(u32 battlerAtk, u32 battlerDef, enum Ability abilityAtk, enum HoldEffect holdEffectAtk, enum Move move);
bool32 IsMoveMakingContact(u32 battlerAtk, u32 battlerDef, enum Ability abilityAtk, enum HoldEffect holdEffectAtk, enum Move move);
bool32 IsBattlerGrounded(u32 battler, enum Ability ability, enum HoldEffect holdEffect);
u32 GetMoveSlot(u16 *moves, enum Move move);
u32 GetBattlerWeight(u32 battler);
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
s32 GetStealthHazardDamage(enum TypeSideHazard hazardType, u32 battler);
s32 GetStealthHazardDamageByTypesAndHP(enum TypeSideHazard hazardType, enum Type type1, enum Type type2, u32 maxHp);
bool32 CanMegaEvolve(u32 battler);
bool32 CanUltraBurst(u32 battler);
void ActivateMegaEvolution(u32 battler);
void ActivateUltraBurst(u32 battler);
bool32 IsBattlerMegaEvolved(u32 battler);
bool32 IsBattlerPrimalReverted(u32 battler);
bool32 IsBattlerUltraBursted(u32 battler);
u32 GetBattleFormChangeTargetSpecies(u32 battler, enum FormChanges method);
bool32 TryRevertPartyMonFormChange(u32 partyIndex);
bool32 TryBattleFormChange(u32 battler, enum FormChanges method);
bool32 DoBattlersShareType(u32 battler1, u32 battler2);
bool32 CanBattlerGetOrLoseItem(u32 fromBattler, u32 battler, enum Item itemId);
u32 GetBattlerVisualSpecies(u32 battler);
bool32 TryClearIllusion(u32 battler, enum Ability ability);
u32 GetIllusionMonSpecies(u32 battler);
struct Pokemon *GetIllusionMonPtr(u32 battler);
void ClearIllusionMon(u32 battler);
u32 GetIllusionMonPartyId(struct Pokemon *party, struct Pokemon *mon, struct Pokemon *partnerMon, u32 battler);
void SetIllusionMon(struct Pokemon *mon, u32 battler);
enum ImmunityHealStatusOutcome TryImmunityAbilityHealStatus(u32 battler);
bool32 ShouldGetStatBadgeBoost(u16 flagId, u32 battler);
uq4_12_t GetBadgeBoostModifier(void);
enum DamageCategory GetBattleMoveCategory(enum Move move);
void SetDynamicMoveCategory(u32 battlerAtk, u32 battlerDef, enum Move move);
bool32 CanFling(u32 battlerAtk, u32 battlerDef);
bool32 IsTelekinesisBannedSpecies(u16 species);
bool32 IsHealBlockPreventingMove(u32 battler, enum Move move);
bool32 IsBelchPreventingMove(u32 battler, enum Move move);
bool32 HasEnoughHpToEatBerry(u32 battler, enum Ability ability, u32 hpFraction, enum Item itemId);
bool32 IsPartnerMonFromSameTrainer(u32 battler);
enum DamageCategory GetCategoryBasedOnStats(u32 battler);
void SetShellSideArmCategory(void);
bool32 MoveIsAffectedBySheerForce(enum Move move);
bool32 IsSheerForceAffected(enum Move move, enum Ability ability);
void TryRestoreHeldItems(void);
bool32 CanStealItem(u32 battlerStealing, u32 battlerItem, enum Item item);
void TrySaveExchangedItem(u32 battler, enum Item stolenItem);
bool32 IsBattlerAffectedByHazards(u32 battler, enum HoldEffect holdEffect, bool32 toxicSpikes);
void SortBattlersBySpeed(u8 *battlers, bool32 slowToFast);
bool32 CompareStat(u32 battler, enum Stat statId, u32 cmpTo, u32 cmpKind, enum Ability ability);
bool32 BlocksPrankster(enum Move move, u32 battlerPrankster, u32 battlerDef, bool32 checkTarget);
bool32 PickupHasValidTarget(u32 battler);
bool32 CantPickupItem(u32 battler);
bool32 IsBattlerWeatherAffected(u32 battler, u32 weatherFlags);
enum MoveTarget GetBattlerMoveTargetType(u32 battler, enum Move move);
bool32 CanTargetBattler(u32 battlerAtk, u32 battlerDef, enum Move move);
u32 GetNextTarget(u32 moveTarget, bool32 excludeCurrent);
void CopyMonLevelAndBaseStatsToBattleMon(u32 battler, struct Pokemon *mon);
void CopyMonAbilityAndTypesToBattleMon(u32 battler, struct Pokemon *mon);
void RecalcBattlerStats(u32 battler, struct Pokemon *mon, bool32 isDynamaxing);
bool32 IsGen6ExpShareEnabled(void);
bool32 MoveHasAdditionalEffect(enum Move move, enum MoveEffect moveEffect);
bool32 MoveHasAdditionalEffectWithChance(enum Move move, enum MoveEffect moveEffect, u32 chance);
bool32 MoveHasAdditionalEffectSelf(enum Move move, enum MoveEffect moveEffect);
bool32 IsMoveEffectRemoveSpeciesType(enum Move move, enum MoveEffect moveEffect, u32 argument);
bool32 MoveHasChargeTurnAdditionalEffect(enum Move move);
bool32 CanTargetPartner(u32 battlerAtk, u32 battlerDef);
bool32 IsBattlerUnaffectedByMove(u32 battler);
bool32 MoodyCantRaiseStat(u32 stat);
bool32 MoodyCantLowerStat(u32 stat);
bool32 IsPsychicTerrainAffected(u32 battler, enum Ability ability, enum HoldEffect holdEffect, u32 fieldStatuses);
bool32 IsMistyTerrainAffected(u32 battler, enum Ability ability, enum HoldEffect holdEffect, u32 fieldStatuses);
bool32 IsGrassyTerrainAffected(u32 battler, enum Ability ability, enum HoldEffect holdEffect, u32 fieldStatuses);
bool32 IsElectricTerrainAffected(u32 battler, enum Ability ability, enum HoldEffect holdEffect, u32 fieldStatuses);
bool32 IsAnyTerrainAffected(u32 battler, enum Ability ability, enum HoldEffect holdEffect, u32 fieldStatuses);
bool32 IsBattlerTerrainAffected(u32 battler, enum Ability ability, enum HoldEffect holdEffect, u32 fieldStatuses, u32 terrainFlag);
enum Stat GetHighestStatId(u32 battler);
enum Stat GetParadoxHighestStatId(u32 battler);
enum Stat GetParadoxBoostedStatId(u32 battler);

bool32 CanBeSlept(u32 battlerAtk, u32 battlerDef, enum Ability abilityDef, enum SleepClauseBlock isBlockedBySleepClause);
bool32 CanBePoisoned(u32 battlerAtk, u32 battlerDef, enum Ability abilityAtk, enum Ability abilityDef);
bool32 CanBeBurned(u32 battlerAtk, u32 battlerDef, enum Ability ability);
bool32 CanBeParalyzed(u32 battlerAtk, u32 battlerDef, enum Ability abilityDef);
bool32 CanBeFrozen(u32 battlerAtk, u32 battlerDef, enum Ability abilityDef);
bool32 CanGetFrostbite(u32 battlerAtk, u32 battlerDef, enum Ability abilityDef);
bool32 CanSetNonVolatileStatus(u32 battlerAtk, u32 battlerDef, enum Ability abilityAtk, enum Ability abilityDef, enum MoveEffect secondaryMoveEffect, enum ResultOption option);
bool32 CanBeConfused(u32 battler);
u32 GetBattlerAffectionHearts(u32 battler);
void TryToRevertMimicryAndFlags(void);
bool32 BattleArenaTurnEnd(void);
u32 CountBattlerStatIncreases(u32 battler, bool32 countEvasionAcc);
bool32 BattlerHasCopyableChanges(u32 battler);
bool32 ChangeTypeBasedOnTerrain(u32 battler);
void RemoveConfusionStatus(u32 battler);
u32 GetBattlerGender(u32 battler);
bool32 AreBattlersOfOppositeGender(u32 battler1, u32 battler2);
bool32 AreBattlersOfSameGender(u32 battler1, u32 battler2);
u32 CalcSecondaryEffectChance(u32 battler, enum Ability battlerAbility, const struct AdditionalEffect *additionalEffect);
bool32 MoveEffectIsGuaranteed(u32 battler, enum Ability battlerAbility, const struct AdditionalEffect *additionalEffect);
void GetBattlerTypes(u32 battler, bool32 ignoreTera, enum Type types[static 3]);
enum Type GetBattlerType(u32 battler, u32 typeIndex, bool32 ignoreTera);
bool32 CanMonParticipateInSkyBattle(struct Pokemon *mon);
void RemoveBattlerType(u32 battler, enum Type type);
enum Type GetBattleMoveType(enum Move move);
void TryActivateSleepClause(u32 battler, u32 indexInParty);
void TryDeactivateSleepClause(enum BattleSide battlerSide, u32 indexInParty);
bool32 IsSleepClauseActiveForSide(enum BattleSide battlerSide);
bool32 IsSleepClauseEnabled(void);
void ClearDamageCalcResults(void);
u32 DoesDestinyBondFail(u32 battler);
bool32 IsMoveEffectBlockedByTarget(enum Ability ability);
bool32 SetTargetToNextPursuiter(u32 battlerDef);
bool32 IsPursuitTargetSet(void);
void ClearPursuitValuesIfSet(u32 battler);
void ClearPursuitValues(void);
bool32 HasWeatherEffect(void);
bool32 IsFutureSightAttackerInParty(u32 battlerAtk, u32 battlerDef, enum Move move);
bool32 HadMoreThanHalfHpNowDoesnt(u32 battler);
void ChooseStatBoostAnimation(u32 battler);
void UpdateStallMons(void);
bool32 TrySwitchInEjectPack(enum EjectPackTiming timing);
bool32 EmergencyExitCanBeTriggered(u32 battler);
bool32 TryTriggerSymbiosis(u32 battler, u32 ally);
bool32 TrySymbiosis(u32 battler, enum Item itemId, bool32 moveEnd);
void BestowItem(u32 battlerAtk, u32 battlerDef);
ARM_FUNC u32 GetBattlerVolatile(u32 battler, enum Volatile _volatile);
void SetMonVolatile(u32 battler, enum Volatile _volatile, u32 newValue);
bool32 ItemHealMonVolatile(u32 battler, enum Item itemId);
void PushHazardTypeToQueue(enum BattleSide side, enum Hazards hazardType);
bool32 IsHazardOnSide(enum BattleSide side, enum Hazards hazardType);
bool32 AreAnyHazardsOnSide(enum BattleSide side);
void RemoveAllHazardsFromField(enum BattleSide side);
bool32 IsHazardOnSideAndClear(enum BattleSide side, enum Hazards hazardType);
void RemoveHazardFromField(enum BattleSide side, enum Hazards hazardType);
bool32 CanMoveSkipAccuracyCalc(u32 battlerAtk, u32 battlerDef, enum Ability abilityAtk, enum Ability abilityDef, enum Move move, enum ResultOption option);
u32 GetTotalAccuracy(u32 battlerAtk, u32 battlerDef, enum Move move, enum Ability atkAbility, enum Ability defAbility, enum HoldEffect atkHoldEffect, enum HoldEffect defHoldEffect);
bool32 IsSemiInvulnerable(u32 battler, enum SemiInvulnerableExclusion excludeCommander);
bool32 BreaksThroughSemiInvulnerablity(u32 battlerAtk, u32 battlerDef, enum Ability abilityAtk, enum Ability abilityDef, enum Move move);
bool32 HasPartnerTrainer(u32 battler);
bool32 IsAffectedByPowderMove(u32 battler, enum Ability ability, enum HoldEffect holdEffect);
enum Move GetNaturePowerMove(u32 battler);
void RemoveAbilityFlags(u32 battler);
void CheckSetUnburden(u32 battler);
bool32 IsDazzlingAbility(enum Ability ability);
bool32 IsAllowedToUseBag(void);
bool32 IsAnyTargetTurnDamaged(u32 battlerAtk);
bool32 IsAnyTargetAffected(void);
bool32 IsMimikyuDisguised(u32 battler);
bool32 IsDoubleSpreadMove(void);
bool32 IsBattlerInvalidForSpreadMove(u32 battlerAtk, u32 battlerDef);
void SetStartingStatus(enum StartingStatus status);
void ResetStartingStatuses(void);
bool32 IsUsableWhileAsleepEffect(enum BattleMoveEffects effect);
void SetWrapTurns(u32 battler, enum HoldEffect holdEffect);
bool32 ChangeOrderTargetAfterAttacker(void);
void TryUpdateEvolutionTracker(enum EvolutionConditions evolutionCondition, u32 upAmount, enum Move usedMove);
bool32 CanUseMoveConsecutively(u32 battler);
void TryResetConsecutiveUseCounter(u32 battler);
void SetOrClearRageVolatile(void);

#endif // GUARD_BATTLE_UTIL_H
