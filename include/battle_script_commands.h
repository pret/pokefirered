#ifndef GUARD_BATTLE_SCRIPT_COMMANDS_H
#define GUARD_BATTLE_SCRIPT_COMMANDS_H

#include "constants/battle_script_commands.h"

// Arguments for 'flags' in HandleBattleWindow
#define WINDOW_CLEAR (1 << 0)
#define WINDOW_BG1   (1 << 7)

// Arguments for 'xStart, yStart, xEnd, yEnd' in HandleBattleWindow
#define YESNOBOX_X_Y 23, 8, 29, 13

struct StatFractions
{
    u8 dividend;
    u8 divisor;
};

struct PickupItem
{
    u16 itemId;
    u8 percentage[10];
};

union TRANSPARENT StatChangeFlags
{
    int raw;
    u32 raw_u32;
    u16 raw_u16;
    u8 raw_u8;
    struct {
        bool32 allowPtr:1; // STAT_CHANGE_ALLOW_PTR
        bool32 mirrorArmored:1; // STAT_CHANGE_MIRROR_ARMOR
        bool32 onlyChecking:1; // STAT_CHANGE_ONLY_CHECKING
        bool32 notProtectAffected:1; // STAT_CHANGE_NOT_PROTECT_AFFECTED
        bool32 updateMoveEffect:1; // STAT_CHANGE_UPDATE_MOVE_EFFECT
        bool32 statDropPrevention:1; // STAT_CHANGE_CHECK_PREVENTION
        bool32 certain:1; // STAT_CHANGE_CERTAIN
        bool32 padding:25;
    };
};

s32 CalcCritChanceStage(u32 battlerAtk, u32 battlerDef, u32 move, bool32 recordAbility, enum Ability abilityAtk, enum Ability abilityDef, enum HoldEffect holdEffectAtk);
s32 CalcCritChanceStageGen1(u32 battlerAtk, u32 battlerDef, u32 move, bool32 recordAbility, enum Ability abilityAtk, enum Ability abilityDef, enum HoldEffect holdEffectAtk);
s32 GetCritHitOdds(s32 critChanceIndex);
bool32 HasBattlerActedThisTurn(u32 battler);
u32 GetBattlerTurnOrderNum(u32 battler);
bool32 NoAliveMonsForBattlerSide(u32 battler);
bool32 NoAliveMonsForPlayer(void);
bool32 NoAliveMonsForEitherParty(void);
void SetMoveEffect(u32 battler, u32 effectBattler, enum MoveEffect moveEffect, const u8 *battleScript, enum SetMoveEffectFlags effectFlags);
bool32 CanBattlerSwitch(u32 battlerId);
void BattleDestroyYesNoCursorAt(u8 cursorPosition);
void BattleCreateYesNoCursorAt(u8 cursorPosition);
void BufferMoveToLearnIntoBattleTextBuff2(void);
void HandleBattleWindow(u8 xStart, u8 yStart, u8 xEnd, u8 yEnd, u8 flags);
bool8 UproarWakeUpCheck(u8 battler);
bool32 DoesSubstituteBlockMove(u32 battlerAtk, u32 battlerDef, u32 move);
bool32 DoesDisguiseBlockMove(u32 battler, u32 move);
bool32 CanUseLastResort(u8 battlerId);
u32 IsFlowerVeilProtected(u32 battler);
u32 IsLeafGuardProtected(u32 battler, enum Ability ability);
bool32 IsShieldsDownProtected(u32 battler, enum Ability ability);
u32 IsAbilityStatusProtected(u32 battler, enum Ability ability);
bool32 TryResetBattlerStatChanges(u8 battler);
bool32 CanCamouflage(u8 battlerId);
void StealTargetItem(u8 battlerStealer, u8 battlerItem);
u8 GetCatchingBattler(void);
enum Stat GetHighestStatId(u32 battlerId);
bool32 ProteanTryChangeType(u32 battler, enum Ability ability, u32 move, enum Type moveType);
bool32 IsMoveNotAllowedInSkyBattles(u32 move);
bool32 DoSwitchInAbilities(u32 battlerId);
u8 GetFirstFaintedPartyIndex(u8 battlerId);
bool32 IsMoveAffectedByParentalBond(u32 move, u32 battler);
void SaveBattlerTarget(u32 battler);
void SaveBattlerAttacker(u32 battler);
bool32 CanBurnHitThaw(u16 move);
bool32 EmergencyExitCanBeTriggered(u32 battler);
bool32 IsMonGettingExpSentOut(void);

extern void (*const gBattleScriptingCommandsTable[])(void);
extern const struct StatFractions gAccuracyStageRatios[];

#endif // GUARD_BATTLE_SCRIPT_COMMANDS_H
