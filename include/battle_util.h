#ifndef GUARD_BATTLE_UTIL_H
#define GUARD_BATTLE_UTIL_H

#include "global.h"

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

#define ABILITYEFFECT_ON_SWITCHIN                0
#define ABILITYEFFECT_ENDTURN                    1
#define ABILITYEFFECT_MOVES_BLOCK                2
#define ABILITYEFFECT_ABSORBING                  3
#define ABILITYEFFECT_MOVE_END_ATTACKER          4
#define ABILITYEFFECT_MOVE_END                   5
#define ABILITYEFFECT_IMMUNITY                   6
#define ABILITYEFFECT_SYNCHRONIZE                7
#define ABILITYEFFECT_ATK_SYNCHRONIZE            8
#define ABILITYEFFECT_TRACE1                     9
#define ABILITYEFFECT_TRACE2                     10
#define ABILITYEFFECT_MOVE_END_OTHER             11
#define ABILITYEFFECT_NEUTRALIZINGGAS            12
#define ABILITYEFFECT_FIELD_SPORT                13 // Only used if B_SPORT_TURNS >= GEN_6
#define ABILITYEFFECT_ON_WEATHER                 14
#define ABILITYEFFECT_ON_TERRAIN                 15
#define ABILITYEFFECT_SWITCH_IN_TERRAIN          16
#define ABILITYEFFECT_SWITCH_IN_WEATHER          17
#define ABILITYEFFECT_OPPORTUNIST                18
#define ABILITYEFFECT_SWITCH_IN_STATUSES         19
// pokefirered
#define ABILITYEFFECT_CHECK_OTHER_SIDE           20
#define ABILITYEFFECT_CHECK_BATTLER_SIDE         21
#define ABILITYEFFECT_INTIMIDATE1                22
#define ABILITYEFFECT_INTIMIDATE2                23
#define ABILITYEFFECT_TRACE                      24
#define ABILITYEFFECT_CHECK_FIELD_EXCEPT_BATTLER 25
#define ABILITYEFFECT_CHECK_ON_FIELD             26
#define ABILITYEFFECT_ON_DAMAGE                  27
#define ABILITYEFFECT_FORECAST                   28
#define ABILITYEFFECT_COUNT_OTHER_SIDE           29
// Special cases
#define ABILITYEFFECT_MUD_SPORT                  252 // Only used if B_SPORT_TURNS >= GEN_6
#define ABILITYEFFECT_WATER_SPORT                253 // Only used if B_SPORT_TURNS >= GEN_6

#define ABILITY_ON_OPPOSING_FIELD(battlerId, abilityId)(AbilityBattleEffects(ABILITYEFFECT_CHECK_OTHER_SIDE, battlerId, abilityId, 0, 0))
#define ABILITY_ON_FIELD(abilityId)(AbilityBattleEffects(ABILITYEFFECT_CHECK_ON_FIELD, 0, abilityId, 0, 0))
#define ABILITY_ON_FIELD2(abilityId)(AbilityBattleEffects(ABILITYEFFECT_FIELD_SPORT, 0, abilityId, 0, 0))

/// For the first argument of ItemBattleEffects, to deteremine which block of item effects to try
#define ITEMEFFECT_ON_SWITCH_IN                 0
#define ITEMEFFECT_NORMAL                       1
#define ITEMEFFECT_DUMMY                        2 // Unused, empty
#define ITEMEFFECT_MOVE_END                     3
#define ITEMEFFECT_KINGSROCK                    4
#define ITEMEFFECT_TARGET                       5
#define ITEMEFFECT_ORBS                         6
#define ITEMEFFECT_LIFEORB_SHELLBELL            7
#define ITEMEFFECT_USE_LAST_ITEM                8 // move end effects for just the battler, not whole field
#define ITEMEFFECT_STATS_CHANGED                9 // For White Herb and Eject Pack

#define WEATHER_HAS_EFFECT ((!AbilityBattleEffects(ABILITYEFFECT_CHECK_ON_FIELD, 0, ABILITY_CLOUD_NINE, 0, 0) && !AbilityBattleEffects(ABILITYEFFECT_CHECK_ON_FIELD, 0, ABILITY_AIR_LOCK, 0, 0)))
#define WEATHER_HAS_EFFECT2 ((!AbilityBattleEffects(ABILITYEFFECT_FIELD_SPORT, 0, ABILITY_CLOUD_NINE, 0, 0) && !AbilityBattleEffects(ABILITYEFFECT_FIELD_SPORT, 0, ABILITY_AIR_LOCK, 0, 0)))

#define IS_WHOLE_SIDE_ALIVE(battler)    ((IsBattlerAlive(battler) && IsBattlerAlive(BATTLE_PARTNER(battler))))
#define IS_ALIVE_AND_PRESENT(battler)   (IsBattlerAlive(battler) && IsBattlerSpritePresent(battler))

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
    CANCELLER_SKY_DROP,
    CANCELLER_ASLEEP,
    CANCELLER_FROZEN,
    CANCELLER_TRUANT,
    CANCELLER_RECHARGE,
    CANCELLER_FLINCH,
    CANCELLER_DISABLED,
    CANCELLER_GRAVITY,
    CANCELLER_HEAL_BLOCKED,
    CANCELLER_TAUNTED,
    CANCELLER_IMPRISONED,
    CANCELLER_CONFUSED,
    CANCELLER_PARALYSED,
    CANCELLER_GHOST,
    CANCELLER_IN_LOVE,
    CANCELLER_BIDE,
    CANCELLER_THAW,
    CANCELLER_POWDER_MOVE,
    CANCELLER_POWDER_STATUS,
    CANCELLER_THROAT_CHOP,
    CANCELLER_MULTIHIT_MOVES,
    CANCELLER_Z_MOVES,
    CANCELLER_END,
    CANCELLER_PSYCHIC_TERRAIN,
    CANCELLER_END2,
};


u8 GetBattlerForBattleScript(u8 caseId);
void PressurePPLoseOnUsingImprison(u8 attacker);
void MarkBattlerForControllerExec(u8 battlerId);
void MarkBattlerReceivedLinkData(u8 battlerId);
const u8* CancelMultiTurnMoves(u32 battler);
bool32 WasUnableToUseMove(u32 battler);
void PrepareStringBattle(u16 stringId, u8 battler);
void ResetSentPokesToOpponentValue(void);
void OpponentSwitchInResetSentPokesToOpponentValue(u8 battler);
void UpdateSentPokesToOpponentValue(u8 battler);
void BattleScriptPush(const u8 *bsPtr);
void BattleScriptPushCursor(void);
void BattleScriptPop(void);
u8 TrySetCantSelectMoveBattleScript(void);
u8 CheckMoveLimitations(u32 battler, u8 unusableMoves, u16 check);
bool8 AreAllMovesUnusable(void);
u8 GetImprisonedMovesCount(u8 battlerId, u16 move);
u8 DoFieldEndTurnEffects(void);
u8 DoBattlerEndTurnEffects(void);
bool8 HandleWishPerishSongOnTurnEnd(void);
bool8 HandleFaintedMonActions(void);
void TryClearRageStatuses(void);
u8 AtkCanceller_UnableToUseMove(u32 moveType);
bool32 HasNoMonsToSwitch(u32 battler, u8 partyIdBattlerOn1, u8 partyIdBattlerOn2);
u8 CastformDataTypeChange(u8 battler);
u32 AbilityBattleEffects(u32 caseID, u32 battler, u32 ability, u32 special, u32 moveArg);
void BattleScriptExecute(const u8 *BS_ptr);
void BattleScriptPushCursorAndCallback(const u8 *BS_ptr);
u8 ItemBattleEffects(u8 caseID, u32 battler, bool32 moveTurn);
void ClearFuryCutterDestinyBondGrudge(u8 battlerId);
void HandleAction_RunBattleScript(void);
u8 GetMoveTarget(u16 move, u8 setTarget);
u8 IsMonDisobedient(void);
void SwitchPartyOrderInGameMulti(u8 battler, u8 arg1);
// new
bool32 IsAffectedByFollowMe(u32 battlerAtk, u32 defSide, u32 move);
bool32 IsNeutralizingGasOnField(void);
bool32 IsMyceliumMightOnField(void);
bool32 IsMoldBreakerTypeAbility(u32 ability);
u32 GetBattlerAbility(u32 battler);
u32 IsAbilityOnSide(u32 battler, u32 ability);
u32 IsAbilityOnOpposingSide(u32 battler, u32 ability);
u32 IsAbilityOnField(u32 ability);
u32 IsAbilityOnFieldExcept(u32 battler, u32 ability);
u32 IsAbilityPreventingEscape(u32 battler);
bool32 IsBattlerAlive(u32 battler);
bool32 CompareStat(u32 battler, u8 statId, u8 cmpTo, u8 cmpKind);
u32 CalcSecondaryEffectChance(u32 battler, u32 battlerAbility, const struct AdditionalEffect *additionalEffect);
bool32 MoveHasAdditionalEffect(u32 move, u32 moveEffect);
u8 GetBattleMoveCategory(u32 moveId);
u32 GetBattlerMoveTargetType(u32 battler, u32 move);
bool32 IsBattlerTerrainAffected(u32 battler, u32 terrainFlag);
bool32 IsBattlerGrounded(u32 battler);
u8 AtkCanceller_UnableToUseMove2(void);
void SetAtkCancellerForCalledMove(void);
bool32 BlocksPrankster(u16 move, u32 battlerPrankster, u32 battlerDef, bool32 checkTarget);
bool32 IsBattlerProtected(u32 battler, u32 move);
bool32 IsMoveMakingContact(u32 move, u32 battlerAtk);
bool32 IsHealBlockPreventingMove(u32 battler, u32 move);
s32 CalculateMoveDamage(u32 move, u32 battlerAtk, u32 battlerDef, u32 moveType, s32 fixedBasePower, bool32 isCrit, bool32 randomFactor, bool32 updateFlags);
bool32 MoveHasAdditionalEffectSelfArg(u32 move, u32 moveEffect, u32 argument);
u32 GetMoveSlot(u16 *moves, u32 move);
u32 GetBattlerWeight(u32 battler);
u32 CountBattlerStatIncreases(u32 battler, bool32 countEvasionAcc);
bool32 ShouldGetStatBadgeBoost(u16 flagId, u32 battler);
bool32 IsBattlerWeatherAffected(u32 battler, u32 weatherFlags);
bool32 CanBattlerGetOrLoseItem(u32 battler, u16 itemId);
bool32 MoveIsAffectedBySheerForce(u32 move);
u8 GetBattlerGender(u32 battler);
bool32 AreBattlersOfOppositeGender(u32 battler1, u32 battler2);
bool32 AreBattlersOfSameGender(u32 battler1, u32 battler2);
u32 GetBattlerHoldEffectParam(u32 battler);
uq4_12_t CalcTypeEffectivenessMultiplier(u32 move, u32 moveType, u32 battlerAtk, u32 battlerDef, u32 defAbility, bool32 recordAbilities);
bool32 MoveHasAdditionalEffectSelf(u32 move, u32 moveEffect);
uq4_12_t GetTypeModifier(u32 atkType, u32 defType);
u8 GetBattlerType(u32 battler, u8 typeIndex);
u32 GetIllusionMonSpecies(u32 battler);
struct Pokemon *GetIllusionMonPtr(u32 battler);
void ClearIllusionMon(u32 battler);
bool32 SetIllusionMon(struct Pokemon *mon, u32 battler);
u32 GetBattlerAffectionHearts(u32 battler);
u32 GetBattlerHoldEffect(u32 battler, bool32 checkNegating);
u32 GetBattlerHoldEffectIgnoreAbility(u32 battler, bool32 checkNegating);
u32 GetBattlerHoldEffectInternal(u32 battler, bool32 checkNegating, bool32 checkAbility);
void RecalcBattlerStats(u32 battler, struct Pokemon *mon);
bool32 TestIfSheerForceAffected(u32 battler, u16 move);
bool32 CanSleep(u32 battler);
bool32 CanBePoisoned(u32 battlerAttacker, u32 battlerTarget);
bool32 CanBeBurned(u32 battler);
bool32 CanBeParalyzed(u32 battler);
bool32 CanBeFrozen(u32 battler);
bool32 CanGetFrostbite(u32 battler);
bool32 CanBeConfused(u32 battler);
bool32 CanStealItem(u32 battlerStealing, u32 battlerItem, u16 item);
void TrySaveExchangedItem(u32 battler, u16 stolenItem);
void RemoveBattlerType(u32 battler, u8 type);
bool32 IsBattlerMegaEvolved(u32 battler);
bool32 IsBattlerPrimalReverted(u32 battler);
bool32 IsBattlerUltraBursted(u32 battler);
u16 GetBattleFormChangeTargetSpecies(u32 battler, u16 method);
bool32 TryBattleFormChange(u32 battler, u16 method);
bool32 TryChangeBattleWeather(u32 battler, u32 weatherEnumId, bool32 viaAbility);
u16 GetUsedHeldItem(u32 battler);
void RemoveConfusionStatus(u32 battler);
bool32 ChangeTypeBasedOnTerrain(u32 battler);
bool32 TryRoomService(u32 battler);
void BufferStatChange(u32 battler, u8 statId, u8 stringId);
s32 GetDrainedBigRootHp(u32 battler, s32 hp);
u8 TryHandleSeed(u32 battler, u32 terrainFlag, u8 statId, u16 itemId, bool32 execute);
bool32 HasEnoughHpToEatBerry(u32 battler, u32 hpFraction, u32 itemId);
bool32 IsGen6ExpShareEnabled(void);
void CopyMonLevelAndBaseStatsToBattleMon(u32 battler, struct Pokemon *mon);
void SortBattlersBySpeed(u8 *battlers, bool32 slowToFast);
bool32 CanBattlerEscape(u32 battler); // no ability check
bool32 IsBattlerAffectedByHazards(u32 battler, bool32 toxicSpikes);
bool32 TryPrimalReversion(u32 battler);
s32 GetStealthHazardDamage(u8 hazardType, u32 battler);
s32 GetStealthHazardDamageByTypesAndHP(u8 hazardType, u8 type1, u8 type2, u32 maxHp);
bool32 DoBattlersShareType(u32 battler1, u32 battler2);
bool32 MoveHasChargeTurnAdditionalEffect(u32 move);

// battle_ai_util.h
bool32 IsHealingMove(u32 move);
void RecordKnownMove(u32 battlerId, u32 move);
s32 CountUsablePartyMons(u32 battlerId);
bool32 IsAiVsAiBattle(void);
void RecordLastUsedMoveBy(u32 battlerId, u32 move);
bool32 BattlerHasAi(u32 battlerId);
void ClearBattlerItemEffectHistory(u32 battlerId);
bool32 IsAffectedByPowder(u32 battler, u32 ability, u32 holdEffect);
void RecordAllMoves(u32 battler);

// end battle_ai_util.h

#endif // GUARD_BATTLE_UTIL_H
