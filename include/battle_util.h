#ifndef GUARD_BATTLE_UTIL_H
#define GUARD_BATTLE_UTIL_H

#include "move.h"
#include "constants/battle_string_ids.h"

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
enum FunctionCallOption
{
    CHECK_TRIGGER, // Check the function without running scripts / setting any flags.
    AI_CHECK,  // Check the function without running scripts / setting any flags. Same as CHECK_TRIGGER but only used when additional data has to be fetched during ai calcs
    RUN_SCRIPT, // Used during actual combat where a script has to be run / flags need to be set
};

enum MoveAbsorbed
{
    MOVE_ABSORBED_BY_NO_ABILITY,
    MOVE_ABSORBED_BY_DRAIN_HP_ABILITY,
    MOVE_ABSORBED_BY_STAT_INCREASE_ABILITY,
    MOVE_ABSORBED_BY_BOOST_FLASH_FIRE,
};

enum {
    ABILITYEFFECT_ON_SWITCHIN,
    ABILITYEFFECT_ENDTURN,
    ABILITYEFFECT_MOVE_END_ATTACKER,
    ABILITYEFFECT_COLOR_CHANGE, // Color Change, Berserk, Anger Shell
    ABILITYEFFECT_MOVE_END,
    ABILITYEFFECT_IMMUNITY,
    ABILITYEFFECT_SYNCHRONIZE,
    ABILITYEFFECT_ATK_SYNCHRONIZE,
    ABILITYEFFECT_MOVE_END_OTHER,
    ABILITYEFFECT_NEUTRALIZINGGAS,
    ABILITYEFFECT_NEUTRALIZINGGAS_FIRST_TURN,
    ABILITYEFFECT_ON_WEATHER,
    ABILITYEFFECT_ON_TERRAIN,
    ABILITYEFFECT_SWITCH_IN_TERRAIN,
    ABILITYEFFECT_SWITCH_IN_WEATHER,
    ABILITYEFFECT_OPPORTUNIST,
    ABILITYEFFECT_OPPORTUNIST_FIRST_TURN,
    ABILITYEFFECT_SWITCH_IN_STATUSES,
};

// For the first argument of ItemBattleEffects, to deteremine which block of item effects to try
enum ItemCaseId
{
    ITEMEFFECT_NONE,
    ITEMEFFECT_ON_SWITCH_IN,
    ITEMEFFECT_ON_SWITCH_IN_FIRST_TURN,
    ITEMEFFECT_LEFTOVERS, // Leftovers, Black Sludge
    ITEMEFFECT_NORMAL,
    ITEMEFFECT_TRY_HEALING,
    ITEMEFFECT_MOVE_END,
    ITEMEFFECT_KINGSROCK,
    ITEMEFFECT_TARGET,
    ITEMEFFECT_ORBS,
    ITEMEFFECT_LIFEORB_SHELLBELL,
    ITEMEFFECT_USE_LAST_ITEM, // move end effects for just the battler, not whole field
    ITEMEFFECT_WHITE_HERB,
    ITEMEFFECT_WHITE_HERB_ENDTURN,
    ITEMEFFECT_WHITE_HERB_FIRST_TURN,
    ITEMEFFECT_MIRROR_HERB,
    ITEMEFFECT_MIRROR_HERB_FIRST_TURN,
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
    u8 type;
    u8 power;
    u16 effect;
};

enum MoveSuccessOrder
{
    CANCELLER_CLEAR_FLAGS,
    CANCELLER_STANCE_CHANGE_1,
    CANCELLER_SKY_DROP,
    CANCELLER_RECHARGE,
    CANCELLER_ASLEEP_OR_FROZEN,
    CANCELLER_POWER_POINTS,
    CANCELLER_OBEDIENCE,
    CANCELLER_TRUANT,
    CANCELLER_FLINCH,
    CANCELLER_DISABLED,
    CANCELLER_VOLATILE_BLOCKED, // Gravity / Heal Block / Throat Chop
    CANCELLER_TAUNTED,
    CANCELLER_IMPRISONED,
    CANCELLER_CONFUSED,
    CANCELLER_GHOST, // pokefirered
    CANCELLER_PARALYSED,
    CANCELLER_INFATUATION,
    CANCELLER_BIDE,
    CANCELLER_Z_MOVES,
    CANCELLER_CHOICE_LOCK,
    CANCELLER_CALLSUBMOVE,
    CANCELLER_THAW,
    CANCELLER_STANCE_CHANGE_2,
    CANCELLER_ATTACKSTRING,
    CANCELLER_PPDEDUCTION,
    CANCELLER_WEATHER_PRIMAL,
    CANCELLER_MOVE_FAILURE,
    CANCELLER_POWDER_STATUS,
    CANCELLER_PRIORITY_BLOCK,
    CANCELLER_PROTEAN,
    CANCELLER_EXPLODING_DAMP,
    CANCELLER_MULTIHIT_MOVES,
    CANCELLER_MULTI_TARGET_MOVES,
    CANCELLER_END,
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

enum MoveCanceller
{
    MOVE_STEP_SUCCESS,
    MOVE_STEP_BREAK, // Breaks out of the function to run a script
    MOVE_STEP_FAILURE, // Same as break but breaks out of it due to move failure and jumps to script that handles the failure
    MOVE_STEP_REMOVES_STATUS,
};

extern const struct TypePower gNaturalGiftTable[];

struct DamageContext
{
    u32 battlerAtk:3;
    u32 battlerDef:3;
    u32 move:16;
    u32 moveType:5;
    u32 isCrit:1;
    u32 randomFactor:1;
    u32 updateFlags:1;
    u32 padding1:2;
    u32 weather:16;
    u32 fixedBasePower:8;
    u32 padding2:8;
    uq4_12_t typeEffectivenessModifier;
    enum Ability abilityAtk;
    enum Ability abilityDef;
    enum ItemHoldEffect holdEffectAtk:16;
    enum ItemHoldEffect holdEffectDef:16;
};

struct BattleContext
{
    u32 battlerAtk:3;
    u32 battlerDef:3;
    u32 currentMove:16;
    enum BattleMoveEffects moveEffect:10;
    enum Ability ability[MAX_BATTLERS_COUNT];
};

enum SleepClauseBlock
{
    NOT_BLOCKED_BY_SLEEP_CLAUSE,
    BLOCKED_BY_SLEEP_CLAUSE,
};

enum SkyDropState
{
    SKY_DROP_IGNORE,
    SKY_DROP_ATTACKCANCELLER_CHECK,
    SKY_DROP_GRAVITY_ON_AIRBORNE,
    SKY_DROP_CANCEL_MULTI_TURN_MOVES,
    SKY_DROP_STATUS_YAWN,
    SKY_DROP_STATUS_FREEZE_SLEEP,
};

#define SKY_DROP_NO_TARGET 0xFF
#define SKY_DROP_RELEASED_TARGET 0xFE

void HandleAction_ThrowBall(void);
u32 GetCurrentBattleWeather(void);
bool32 EndOrContinueWeather(void);
bool32 IsAffectedByFollowMe(u32 battlerAtk, u32 defSide, u32 move);
bool32 HandleMoveTargetRedirection(void);
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
bool32 WasUnableToUseMove(u32 battler);
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
u8 GetImprisonedMovesCount(u32 battler, u16 move);
s32 GetDrainedBigRootHp(u32 battler, s32 hp);
bool32 IsAbilityAndRecord(u32 battler, enum Ability battlerAbility, enum Ability abilityToCheck);
u32 DoEndTurnEffects(void);
bool32 HandleFaintedMonActions(void);
void TryClearRageAndFuryCutter(void);
enum MoveCanceller AtkCanceller_MoveSuccessOrder(struct BattleContext *ctx);
bool32 HasNoMonsToSwitch(u32 battler, u8 partyIdBattlerOn1, u8 partyIdBattlerOn2);
bool32 TryChangeBattleWeather(u32 battler, u32 battleWeatherId, bool32 viaAbility);
bool32 CanAbilityBlockMove(u32 battlerAtk, u32 battlerDef, enum Ability abilityAtk, enum Ability abilityDef, u32 move, enum FunctionCallOption option);
bool32 CanAbilityAbsorbMove(u32 battlerAtk, u32 battlerDef, enum Ability abilityDef, u32 move, u32 moveType, enum FunctionCallOption option);
u32 AbilityBattleEffects(u32 caseID, u32 battler, enum Ability ability, u32 special, u32 moveArg);
bool32 TryPrimalReversion(u32 battler);
bool32 IsNeutralizingGasOnField(void);
bool32 IsMoldBreakerTypeAbility(u32 battler, enum Ability ability);
u32 GetBattlerAbilityIgnoreMoldBreaker(u32 battler);
u32 GetBattlerAbilityNoAbilityShield(u32 battler);
u32 GetBattlerAbilityInternal(u32 battler, u32 ignoreMoldBreaker, u32 noAbilityShield);
enum Ability GetBattlerAbility(u32 battler);
u32 IsAbilityOnSide(u32 battler, enum Ability ability);
u32 IsAbilityOnOpposingSide(u32 battler, enum Ability ability);
u32 IsAbilityOnField(enum Ability ability);
u32 IsAbilityOnFieldExcept(u32 battler, enum Ability ability);
u32 IsAbilityPreventingEscape(u32 battler);
bool32 IsBattlerProtected(u32 battlerAtk, u32 battlerDef, u32 move);
u32 GetProtectType(enum ProtectMethod method);
bool32 CanBattlerEscape(u32 battler); // no ability check
void BattleScriptExecute(const u8 *BS_ptr);
void BattleScriptPushCursorAndCallback(const u8 *BS_ptr);
u32 ItemBattleEffects(enum ItemCaseId, u32 battler);
void ClearVariousBattlerFlags(u32 battler);
void HandleAction_RunBattleScript(void);
u32 SetRandomTarget(u32 battler);
u32 GetBattleMoveTarget(u16 move, u8 setTarget);
u8 GetAttackerObedienceForAction();
enum ItemHoldEffect GetBattlerHoldEffect(u32 battler);
enum ItemHoldEffect GetBattlerHoldEffectIgnoreAbility(u32 battler);
enum ItemHoldEffect GetBattlerHoldEffectIgnoreNegation(u32 battler);
enum ItemHoldEffect GetBattlerHoldEffectInternal(u32 battler, u32 ability);
u32 GetBattlerHoldEffectParam(u32 battler);
bool32 CanBattlerAvoidContactEffects(u32 battlerAtk, u32 battlerDef, enum Ability abilityAtk, enum ItemHoldEffect holdEffectAtk, u32 move);
bool32 IsMoveMakingContact(u32 battlerAtk, u32 battlerDef, enum Ability abilityAtk, enum ItemHoldEffect holdEffectAtk, u32 move);
bool32 IsBattlerGrounded(u32 battler, enum Ability ability, enum ItemHoldEffect holdEffect);
u32 GetMoveSlot(u16 *moves, u32 move);
u32 GetBattlerWeight(u32 battler);
u32 CalcRolloutBasePower(u32 battlerAtk, u32 basePower, u32 rolloutTimer);
u32 CalcFuryCutterBasePower(u32 basePower, u32 furyCutterCounter);
s32 CalculateMoveDamage(struct DamageContext *ctx);
s32 CalculateMoveDamageVars(struct DamageContext *ctx);
s32 DoFixedDamageMoveCalc(struct DamageContext *ctx);
s32 ApplyModifiersAfterDmgRoll(struct DamageContext *ctx, s32 dmg);
uq4_12_t CalcTypeEffectivenessMultiplier(struct DamageContext *ctx);
uq4_12_t CalcPartyMonTypeEffectivenessMultiplier(u16 move, u16 speciesDef, enum Ability abilityDef);
uq4_12_t GetTypeModifier(u32 atkType, u32 defType);
uq4_12_t GetOverworldTypeEffectiveness(struct Pokemon *mon, u8 moveType);
void UpdateMoveResultFlags(uq4_12_t modifier, u16 *resultFlags);
s32 GetStealthHazardDamage(enum TypeSideHazard hazardType, u32 battler);
s32 GetStealthHazardDamageByTypesAndHP(enum TypeSideHazard hazardType, u8 type1, u8 type2, u32 maxHp);
bool32 CanMegaEvolve(u32 battler);
bool32 CanUltraBurst(u32 battler);
void ActivateMegaEvolution(u32 battler);
void ActivateUltraBurst(u32 battler);
bool32 IsBattlerMegaEvolved(u32 battler);
bool32 IsBattlerPrimalReverted(u32 battler);
bool32 IsBattlerUltraBursted(u32 battler);
u16 GetBattleFormChangeTargetSpecies(u32 battler, enum FormChanges method);
bool32 TryBattleFormChange(u32 battler, enum FormChanges method);
bool32 DoBattlersShareType(u32 battler1, u32 battler2);
bool32 CanBattlerGetOrLoseItem(u32 battler, u16 itemId);
u32 GetBattlerVisualSpecies(u32 battler);
bool32 TryClearIllusion(u32 battler, u32 caseID);
u32 GetIllusionMonSpecies(u32 battler);
struct Pokemon *GetIllusionMonPtr(u32 battler);
void ClearIllusionMon(u32 battler);
u32 GetIllusionMonPartyId(struct Pokemon *party, struct Pokemon *mon, struct Pokemon *partnerMon, u32 battler);
bool32 SetIllusionMon(struct Pokemon *mon, u32 battler);
bool32 ShouldGetStatBadgeBoost(u16 flagId, u32 battler);
enum DamageCategory GetBattleMoveCategory(u32 move);
void SetDynamicMoveCategory(u32 battlerAtk, u32 battlerDef, u32 move);
bool32 CanFling(u32 battler);
bool32 IsTelekinesisBannedSpecies(u16 species);
bool32 IsHealBlockPreventingMove(u32 battler, u32 move);
bool32 IsBelchPreventingMove(u32 battler, u32 move);
bool32 HasEnoughHpToEatBerry(u32 battler, u32 hpFraction, u32 itemId);
bool32 IsPartnerMonFromSameTrainer(u32 battler);
enum DamageCategory GetCategoryBasedOnStats(u32 battler);
void SetShellSideArmCategory(void);
bool32 MoveIsAffectedBySheerForce(u32 move);
bool32 TestIfSheerForceAffected(u32 battler, u16 move);
void TryRestoreHeldItems(void);
bool32 CanStealItem(u32 battlerStealing, u32 battlerItem, u16 item);
void TrySaveExchangedItem(u32 battler, u16 stolenItem);
bool32 IsPartnerMonFromSameTrainer(u32 battler);
enum ItemEffect TryHandleSeed(u32 battler, u32 terrainFlag, u32 statId, u32 itemId, enum ItemCaseId caseID);
bool32 IsBattlerAffectedByHazards(u32 battler, bool32 toxicSpikes);
void SortBattlersBySpeed(u8 *battlers, bool32 slowToFast);
bool32 CompareStat(u32 battler, u8 statId, u8 cmpTo, u8 cmpKind);
bool32 TryRoomService(u32 battler);
bool32 BlocksPrankster(u16 move, u32 battlerPrankster, u32 battlerDef, bool32 checkTarget);
u16 GetUsedHeldItem(u32 battler);
bool32 PickupHasValidTarget(u32 battler);
bool32 CantPickupItem(u32 battler);
bool32 IsBattlerWeatherAffected(u32 battler, u32 weatherFlags);
u32 GetBattlerMoveTargetType(u32 battler, u32 move);
bool32 CanTargetBattler(u32 battlerAtk, u32 battlerDef, u16 move);
void CopyMonLevelAndBaseStatsToBattleMon(u32 battler, struct Pokemon *mon);
void CopyMonAbilityAndTypesToBattleMon(u32 battler, struct Pokemon *mon);
void RecalcBattlerStats(u32 battler, struct Pokemon *mon, bool32 isDynamaxing);
bool32 IsGen6ExpShareEnabled(void);
bool32 MoveHasAdditionalEffect(u32 move, u32 moveEffect);
bool32 MoveHasAdditionalEffectWithChance(u32 move, u32 moveEffect, u32 chance);
bool32 MoveHasAdditionalEffectSelf(u32 move, u32 moveEffect);
bool32 IsMoveEffectRemoveSpeciesType(u32 move, u32 moveEffect, u32 argument);
bool32 MoveHasChargeTurnAdditionalEffect(u32 move);
bool32 CanTargetPartner(u32 battlerAtk, u32 battlerDef);
bool32 TargetFullyImmuneToCurrMove(u32 battlerAtk, u32 battlerDef);
bool32 MoodyCantRaiseStat(u32 stat);
bool32 MoodyCantLowerStat(u32 stat);

bool32 CanBeSlept(u32 battlerAtk, u32 battlerDef, enum Ability abilityDef, enum SleepClauseBlock isBlockedBySleepClause);
bool32 CanBePoisoned(u32 battlerAtk, u32 battlerDef, enum Ability abilityAtk, enum Ability abilityDef);
bool32 CanBeBurned(u32 battlerAtk, u32 battlerDef, enum Ability ability);
bool32 CanBeParalyzed(u32 battlerAtk, u32 battlerDef, enum Ability abilityDef);
bool32 CanBeFrozen(u32 battlerAtk, u32 battlerDef, enum Ability abilityDef);
bool32 CanGetFrostbite(u32 battlerAtk, u32 battlerDef, enum Ability abilityDef);
bool32 CanSetNonVolatileStatus(u32 battlerAtk, u32 battlerDef, enum Ability abilityAtk, enum Ability abilityDef, enum MoveEffect secondaryMoveEffect, enum FunctionCallOption option);
bool32 CanBeConfused(u32 battler);
bool32 IsBattlerTerrainAffected(u32 battler, enum Ability ability, enum ItemHoldEffect holdEffect, u32 terrainFlag);
u32 GetBattlerAffectionHearts(u32 battler);
void TryToRevertMimicryAndFlags(void);
bool32 BattleArenaTurnEnd(void);
u32 CountBattlerStatIncreases(u32 battler, bool32 countEvasionAcc);
bool32 ChangeTypeBasedOnTerrain(u32 battler);
void RemoveConfusionStatus(u32 battler);
u8 GetBattlerGender(u32 battler);
bool32 AreBattlersOfOppositeGender(u32 battler1, u32 battler2);
bool32 AreBattlersOfSameGender(u32 battler1, u32 battler2);
u32 CalcSecondaryEffectChance(u32 battler, enum Ability battlerAbility, const struct AdditionalEffect *additionalEffect);
bool32 MoveEffectIsGuaranteed(u32 battler, enum Ability battlerAbility, const struct AdditionalEffect *additionalEffect);
void GetBattlerTypes(u32 battler, bool32 ignoreTera, u32 types[static 3]);
u32 GetBattlerType(u32 battler, u32 typeIndex, bool32 ignoreTera);
bool8 CanMonParticipateInSkyBattle(struct Pokemon *mon);
bool8 IsMonBannedFromSkyBattles(u16 species);
void RemoveBattlerType(u32 battler, u8 type);
u32 GetBattleMoveType(u32 move);
void TryActivateSleepClause(u32 battler, u32 indexInParty);
void TryDeactivateSleepClause(u32 battlerSide, u32 indexInParty);
bool32 IsSleepClauseActiveForSide(u32 battlerSide);
bool32 IsSleepClauseEnabled();
void ClearDamageCalcResults(void);
u32 DoesDestinyBondFail(u32 battler);
bool32 IsMoveEffectBlockedByTarget(enum Ability ability);
bool32 IsPursuitTargetSet(void);
void ClearPursuitValuesIfSet(u32 battler);
void ClearPursuitValues(void);
bool32 HasWeatherEffect(void);
bool32 IsFutureSightAttackerInParty(u32 battlerAtk, u32 battlerDef, u32 move);
bool32 HadMoreThanHalfHpNowDoesnt(u32 battler);
void UpdateStallMons(void);
bool32 TryRestoreHPBerries(u32 battler, enum ItemCaseId caseId);
bool32 TrySwitchInEjectPack(enum ItemCaseId caseID);
u32 GetBattlerVolatile(u32 battler, enum Volatile _volatile);
void SetMonVolatile(u32 battler, enum Volatile _volatile, u32 newValue);
u32 TryBoosterEnergy(u32 battler, enum Ability ability, enum ItemCaseId caseID);
bool32 ItemHealMonVolatile(u32 battler, u16 itemId);
void PushHazardTypeToQueue(u32 side, enum Hazards hazardType);
bool32 IsHazardOnSide(u32 side, enum Hazards hazardType);
bool32 AreAnyHazardsOnSide(u32 side);
void RemoveAllHazardsFromField(u32 side);
bool32 IsHazardOnSideAndClear(u32 side, enum Hazards hazardType);
void RemoveHazardFromField(u32 side, enum Hazards hazardType);
bool32 CanMoveSkipAccuracyCalc(u32 battlerAtk, u32 battlerDef, enum Ability abilityAtk, enum Ability abilityDef, u32 move, enum FunctionCallOption option);
u32 GetTotalAccuracy(u32 battlerAtk, u32 battlerDef, u32 move, enum Ability atkAbility, enum Ability defAbility, u32 atkHoldEffect, u32 defHoldEffect);
bool32 IsSemiInvulnerable(u32 battler, enum SemiInvulnerableExclusion excludeCommander);
bool32 BreaksThroughSemiInvulnerablity(u32 battler, u32 move);
u32 GetNaturePowerMove(u32 battler);
u32 GetNaturePowerMove(u32 battler);
void RemoveAbilityFlags(u32 battler);
bool32 IsDazzlingAbility(enum Ability ability);
bool32 IsAllowedToUseBag(void);

#endif // GUARD_BATTLE_UTIL_H
