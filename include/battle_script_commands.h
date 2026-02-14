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
    enum Item itemId;
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

bool32 HasBattlerActedThisTurn(enum BattlerId battler);
u32 GetBattlerTurnOrderNum(enum BattlerId battler);
bool32 NoAliveMonsForBattlerSide(enum BattlerId battler);
bool32 NoAliveMonsForPlayer(void);
bool32 NoAliveMonsForEitherParty(void);
void SetMoveEffect(enum BattlerId battlerAtk, enum BattlerId effectBattler, enum MoveEffect moveEffect, const u8 *battleScript, enum SetMoveEffectFlags effectFlags);
bool32 CanBattlerSwitch(enum BattlerId battlerId);
void BattleDestroyYesNoCursorAt(u8 cursorPosition);
void BattleCreateYesNoCursorAt(u8 cursorPosition);
void BufferMoveToLearnIntoBattleTextBuff2(void);
void HandleBattleWindow(u8 xStart, u8 yStart, u8 xEnd, u8 yEnd, u8 flags);
bool8 UproarWakeUpCheck(enum BattlerId battler);
bool32 DoesSubstituteBlockMove(enum BattlerId battlerAtk, enum BattlerId battlerDef, enum Move move);
bool32 DoesDisguiseBlockMove(enum BattlerId battler, enum Move move);
bool32 DoesIceFaceBlockMove(enum BattlerId battler, enum Move move);
bool32 CanUseLastResort(enum BattlerId battlerId);
u32 IsFlowerVeilProtected(enum BattlerId battler);
u32 IsLeafGuardProtected(enum BattlerId battler, enum Ability ability);
bool32 IsShieldsDownProtected(enum BattlerId battler, enum Ability ability);
u32 IsAbilityStatusProtected(enum BattlerId battler, enum Ability ability);
bool32 TryResetBattlerStatChanges(enum BattlerId battler);
bool32 CanCamouflage(enum BattlerId battler);
void StealTargetItem(enum BattlerId battlerStealer, enum BattlerId battlerItem);
u8 GetCatchingBattler(void);
bool32 ProteanTryChangeType(enum BattlerId battler, enum Ability ability, enum Move move, enum Type moveType);
u8 GetFirstFaintedPartyIndex(enum BattlerId battler);
void SaveBattlerTarget(enum BattlerId battler);
void SaveBattlerAttacker(enum BattlerId battler);
bool32 CanBurnHitThaw(enum Move move);
bool32 IsMonGettingExpSentOut(void);

extern void (*const gBattleScriptingCommandsTable[])(void);
extern const struct StatFractions gAccuracyStageRatios[];

#endif // GUARD_BATTLE_SCRIPT_COMMANDS_H
