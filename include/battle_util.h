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

enum AbilityEffectOptions
{
    ABILITY_CHECK_TRIGGER,
    ABILITY_CHECK_TRIGGER_AI,
    ABILITY_RUN_SCRIPT,
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
    ABILITYEFFECT_MOVE_END,
    ABILITYEFFECT_IMMUNITY,
    ABILITYEFFECT_SYNCHRONIZE,
    ABILITYEFFECT_ATK_SYNCHRONIZE,
    ABILITYEFFECT_MOVE_END_OTHER,
    ABILITYEFFECT_NEUTRALIZINGGAS,
    ABILITYEFFECT_FIELD_SPORT,         // Only used if B_SPORT_TURNS >= GEN_6
    ABILITYEFFECT_ON_WEATHER,
    ABILITYEFFECT_ON_TERRAIN,
    ABILITYEFFECT_SWITCH_IN_TERRAIN,
    ABILITYEFFECT_SWITCH_IN_WEATHER,
    ABILITYEFFECT_OPPORTUNIST,
    ABILITYEFFECT_SWITCH_IN_STATUSES,
};

// Special cases
#define ABILITYEFFECT_MUD_SPORT                  252 // Only used if B_SPORT_TURNS >= GEN_6
#define ABILITYEFFECT_WATER_SPORT                253 // Only used if B_SPORT_TURNS >= GEN_6

// For the first argument of ItemBattleEffects, to deteremine which block of item effects to try
enum ItemCaseId
{
    ITEMEFFECT_NONE,
    ITEMEFFECT_ON_SWITCH_IN,
    ITEMEFFECT_ON_SWITCH_IN_FIRST_TURN,
    ITEMEFFECT_NORMAL,
    ITEMEFFECT_TRY_HEALING,
    ITEMEFFECT_MOVE_END,
    ITEMEFFECT_KINGSROCK,
    ITEMEFFECT_TARGET,
    ITEMEFFECT_ORBS,
    ITEMEFFECT_LIFEORB_SHELLBELL,
    ITEMEFFECT_USE_LAST_ITEM, // move end effects for just the battler, not whole field
    ITEMEFFECT_STATS_CHANGED, // For White Herb and Eject Pack
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

enum
{
    CANCELLER_FLAGS,
    CANCELLER_STANCE_CHANGE_1,
    CANCELLER_SKY_DROP,
    CANCELLER_RECHARGE,
    CANCELLER_ASLEEP,
    CANCELLER_FROZEN,
    CANCELLER_OBEDIENCE,
    CANCELLER_TRUANT,
    CANCELLER_FLINCH,
    CANCELLER_IN_LOVE,
    CANCELLER_DISABLED,
    CANCELLER_HEAL_BLOCKED,
    CANCELLER_GRAVITY,
    CANCELLER_THROAT_CHOP,
    CANCELLER_TAUNTED,
    CANCELLER_IMPRISONED,
    CANCELLER_CONFUSED,
    CANCELLER_PARALYSED,
    CANCELLER_GHOST, // pokefirered
    CANCELLER_BIDE,
    CANCELLER_THAW,
    CANCELLER_STANCE_CHANGE_2,
    CANCELLER_WEATHER_PRIMAL,
    CANCELLER_DYNAMAX_BLOCKED,
    CANCELLER_POWDER_STATUS,
    CANCELLER_PROTEAN,
    CANCELLER_PSYCHIC_TERRAIN,
    CANCELLER_EXPLODING_DAMP,
    CANCELLER_MULTIHIT_MOVES,
    CANCELLER_Z_MOVES,
    CANCELLER_MULTI_TARGET_MOVES,
    CANCELLER_END,
};

enum {
    OBEYS,
    DISOBEYS_LOAFS,
    DISOBEYS_HITS_SELF,
    DISOBEYS_FALL_ASLEEP,
    DISOBEYS_WHILE_ASLEEP,
    DISOBEYS_RANDOM_MOVE,
};

extern const struct TypePower gNaturalGiftTable[];

struct DamageCalculationData
{
    u32 battlerAtk:3;
    u32 battlerDef:3;
    u32 move:16;
    u32 moveType:5;
    u32 isCrit:1;
    u32 randomFactor:1;
    u32 updateFlags:1;
    u32 padding:2;
};
STATIC_ASSERT(sizeof(struct DamageCalculationData) <= 4, StructExceedsFourBytes);

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
void PrepareStringBattle(enum StringID stringId, u32 battler);
void ResetSentPokesToOpponentValue(void);
void OpponentSwitchInResetSentPokesToOpponentValue(u32 battler);
void UpdateSentPokesToOpponentValue(u32 battler);
void BattleScriptPush(const u8 *bsPtr);
void BattleScriptPushCursor(void);
void BattleScriptPop(void);
u32 TrySetCantSelectMoveBattleScript(u32 battler);
u8 CheckMoveLimitations(u32 battler, u8 unusableMoves, u16 check);
bool32 AreAllMovesUnusable(u32 battler);
u8 GetImprisonedMovesCount(u32 battler, u16 move);
s32 GetDrainedBigRootHp(u32 battler, s32 hp);
bool32 IsMagicGuardProtected(u32 battler, u32 ability);
u32 DoEndTurnEffects(void);
bool32 HandleFaintedMonActions(void);
void TryClearRageAndFuryCutter(void);
u32 AtkCanceller_MoveSuccessOrder(void);
void SetAtkCancellerForCalledMove(void);
bool32 HasNoMonsToSwitch(u32 battler, u8 r1, u8 r2);
bool32 TryChangeBattleWeather(u32 battler, u32 battleWeatherId, bool32 viaAbility);
bool32 CanAbilityBlockMove(u32 battlerAtk, u32 battlerDef, u32 abilityAtk, u32 abilityDef, u32 move, enum AbilityEffectOptions option);
bool32 CanAbilityAbsorbMove(u32 battlerAtk, u32 battlerDef, u32 abilityDef, u32 move, u32 moveType, enum AbilityEffectOptions option);
u32 AbilityBattleEffects(u32 caseID, u32 battler, u32 ability, u32 special, u32 moveArg);
bool32 TryPrimalReversion(u32 battler);
bool32 IsNeutralizingGasOnField(void);
bool32 IsMoldBreakerTypeAbility(u32 battler, u32 ability);
u32 GetBattlerAbility(u32 battler);
u32 IsAbilityOnSide(u32 battler, u32 ability);
u32 IsAbilityOnOpposingSide(u32 battler, u32 ability);
u32 IsAbilityOnField(u32 ability);
u32 IsAbilityOnFieldExcept(u32 battler, u32 ability);
u32 IsAbilityPreventingEscape(u32 battler);
bool32 IsBattlerProtected(u32 battlerAtk, u32 battlerDef, u32 move);
u32 GetProtectType(enum ProtectMethod method);
bool32 CanBattlerEscape(u32 battler); // no ability check
void BattleScriptExecute(const u8 *BS_ptr);
void BattleScriptPushCursorAndCallback(const u8 *BS_ptr);
u32 ItemBattleEffects(enum ItemCaseId, u32 battler, bool32 moveTurn);
void ClearVariousBattlerFlags(u32 battler);
void HandleAction_RunBattleScript(void);
u32 SetRandomTarget(u32 battler);
u32 GetBattleMoveTarget(u16 move, u8 setTarget);
u8 GetAttackerObedienceForAction();
enum ItemHoldEffect GetBattlerHoldEffect(u32 battler, bool32 checkNegating);
enum ItemHoldEffect GetBattlerHoldEffectIgnoreAbility(u32 battler, bool32 checkNegating);
enum ItemHoldEffect GetBattlerHoldEffectInternal(u32 battler, bool32 checkNegating, bool32 checkAbility);
u32 GetBattlerHoldEffectParam(u32 battler);
bool32 IsMoveMakingContact(u32 move, u32 battlerAtk);
bool32 IsBattlerGrounded(u32 battler);
u32 GetMoveSlot(u16 *moves, u32 move);
u32 GetBattlerWeight(u32 battler);
u32 CalcRolloutBasePower(u32 battlerAtk, u32 basePower, u32 rolloutTimer);
u32 CalcFuryCutterBasePower(u32 basePower, u32 furyCutterCounter);
s32 CalculateMoveDamage(struct DamageCalculationData *damageCalcData, u32 fixedBasePower);
s32 CalculateMoveDamageVars(struct DamageCalculationData *damageCalcData, u32 fixedBasePower, uq4_12_t typeEffectivenessModifier,
                            u32 weather, enum ItemHoldEffect holdEffectAtk, enum ItemHoldEffect holdEffectDef, u32 abilityAtk, u32 abilityDef);
s32 ApplyModifiersAfterDmgRoll(s32 dmg, struct DamageCalculationData *damageCalcData, uq4_12_t typeEffectivenessModifier, u32 abilityAtk, u32 abilityDef, enum ItemHoldEffect holdEffectAtk, enum ItemHoldEffect holdEffectDef);
uq4_12_t CalcTypeEffectivenessMultiplier(u32 move, u32 moveType, u32 battlerAtk, u32 battlerDef, u32 defAbility, bool32 recordAbilities);
uq4_12_t CalcPartyMonTypeEffectivenessMultiplier(u16 move, u16 speciesDef, u16 abilityDef);
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
u32 GetIllusionMonSpecies(u32 battler);
struct Pokemon *GetIllusionMonPtr(u32 battler);
void ClearIllusionMon(u32 battler);
bool32 SetIllusionMon(struct Pokemon *mon, u32 battler);
bool32 ShouldGetStatBadgeBoost(u16 flagId, u32 battler);
u32 GetBattleMoveCategory(u32 move);
void SetDynamicMoveCategory(u32 battlerAtk, u32 battlerDef, u32 move);
bool32 CanFling(u32 battler);
bool32 IsTelekinesisBannedSpecies(u16 species);
bool32 IsHealBlockPreventingMove(u32 battler, u32 move);
bool32 IsBelchPreventingMove(u32 battler, u32 move);
bool32 HasEnoughHpToEatBerry(u32 battler, u32 hpFraction, u32 itemId);
bool32 IsPartnerMonFromSameTrainer(u32 battler);
u8 GetCategoryBasedOnStats(u32 battler);
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
void BufferStatChange(u32 battler, u8 statId, enum StringID stringId);
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

bool32 CanBeSlept(u32 battler, u32 ability, enum SleepClauseBlock isBlockedBySleepClause);
bool32 CanBePoisoned(u32 battlerAtk, u32 battlerDef, u32 defAbility);
bool32 CanBeBurned(u32 battler, u32 ability);
bool32 CanBeParalyzed(u32 battler, u32 ability);
bool32 CanBeFrozen(u32 battler);
bool32 CanGetFrostbite(u32 battler);
bool32 CanBeConfused(u32 battler);
bool32 IsBattlerTerrainAffected(u32 battler, u32 terrainFlag);
u32 GetBattlerAffectionHearts(u32 battler);
void TryToRevertMimicryAndFlags(void);
bool32 BattleArenaTurnEnd(void);
u32 CountBattlerStatIncreases(u32 battler, bool32 countEvasionAcc);
bool32 ChangeTypeBasedOnTerrain(u32 battler);
void RemoveConfusionStatus(u32 battler);
u8 GetBattlerGender(u32 battler);
bool32 AreBattlersOfOppositeGender(u32 battler1, u32 battler2);
bool32 AreBattlersOfSameGender(u32 battler1, u32 battler2);
u32 CalcSecondaryEffectChance(u32 battler, u32 battlerAbility, const struct AdditionalEffect *additionalEffect);
bool32 MoveEffectIsGuaranteed(u32 battler, u32 battlerAbility, const struct AdditionalEffect *additionalEffect);
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
bool32 IsMoveEffectBlockedByTarget(u32 ability);
bool32 IsPursuitTargetSet(void);
void ClearPursuitValuesIfSet(u32 battler);
void ClearPursuitValues(void);
bool32 HasWeatherEffect(void);
u32 RestoreWhiteHerbStats(u32 battler);
bool32 IsFutureSightAttackerInParty(u32 battlerAtk, u32 battlerDef);
bool32 HadMoreThanHalfHpNowDoesnt(u32 battler);

#endif // GUARD_BATTLE_UTIL_H
