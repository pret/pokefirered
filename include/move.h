#ifndef GUARD_MOVES_H
#define GUARD_MOVES_H

#include "contest_effect.h"
#include "constants/battle.h"
#include "constants/battle_move_effects.h"
#include "constants/battle_string_ids.h"
#include "constants/moves.h"

// For defining EFFECT_HIT etc. with battle TV scores and flags etc.
struct __attribute__((packed, aligned(2))) BattleMoveEffect
{
    const u8 *battleScript;
    u16 battleTvScore:3;
    u16 encourageEncore:1;
    u16 twoTurnEffect:1;
    u16 semiInvulnerableEffect:1;
    u16 usesProtectCounter:1;
    u16 padding:9;
};

#define EFFECTS_ARR(...) (const struct AdditionalEffect[]) {__VA_ARGS__}
#define ADDITIONAL_EFFECTS(...) EFFECTS_ARR( __VA_ARGS__ ), .numAdditionalEffects = ARRAY_COUNT(EFFECTS_ARR( __VA_ARGS__ ))

struct AdditionalEffect
{
    enum MoveEffect moveEffect;
    u8 self:1;
    u8 onlyIfTargetRaisedStats:1;
    u8 onChargeTurnOnly:1;
    u8 sheerForceOverride:1; // Handles edge cases for Sheer Force - if TRUE, boosts when it shouldn't, or doesn't boost when it should
    u8 padding:4;
    union PACKED {
        enum WrappedStringID wrapped;
    } multistring;
    u8 chance; // 0% = effect certain, primary effect
};

enum ProtectType
{
    PROTECT_TYPE_NONE,
    PROTECT_TYPE_SIDE,
    PROTECT_TYPE_SINGLE,
};

enum ProtectMethod
{
    PROTECT_NONE,
    PROTECT_NORMAL,
    PROTECT_SPIKY_SHIELD,
    PROTECT_KINGS_SHIELD,
    PROTECT_BANEFUL_BUNKER,
    PROTECT_BURNING_BULWARK,
    PROTECT_OBSTRUCT,
    PROTECT_SILK_TRAP,
    PROTECT_MAX_GUARD,
    PROTECT_WIDE_GUARD,
    PROTECT_QUICK_GUARD,
    PROTECT_CRAFTY_SHIELD,
    PROTECT_MAT_BLOCK,
};

struct MoveInfo
{
    const u8 *name;
    const u8 *description;
    enum BattleMoveEffects effect;
    u16 type:5;     // Up to 32
    enum DamageCategory category:2;
    u16 power:9;    // up to 511
    // end of word
    u16 accuracy:7;
    u16 target:9;
    u8 pp;
    union {
        u8 effect;
        u8 powerOverride;
    } zMove;
    // end of word
    s32 priority:4;
    u32 strikeCount:4; // Max 15 hits. Defaults to 1 if not set. May apply its effect on each hit.
    u32 criticalHitStage:2;
    bool32 alwaysCriticalHit:1;
    u32 numAdditionalEffects:2; // limited to 3 - don't want to get too crazy
    // Flags
    bool32 makesContact:1;
    bool32 ignoresProtect:1;
    bool32 magicCoatAffected:1;
    bool32 snatchAffected:1;
    bool32 ignoresKingsRock:1;
    bool32 punchingMove:1;
    bool32 bitingMove:1;
    bool32 pulseMove:1;
    bool32 soundMove:1;
    bool32 ballisticMove:1;
    bool32 powderMove:1;
    bool32 danceMove:1;
    bool32 windMove:1;
    bool32 slicingMove:1;
    bool32 healingMove:1;
    bool32 minimizeDoubleDamage:1;
    bool32 ignoresTargetAbility:1;
    bool32 ignoresTargetDefenseEvasionStages:1;
    bool32 damagesUnderground:1;
    // end of word
    bool32 damagesUnderwater:1;
    bool32 damagesAirborne:1;
    bool32 damagesAirborneDoubleDamage:1;
    bool32 ignoreTypeIfFlyingAndUngrounded:1;
    bool32 thawsUser:1;
    bool32 ignoresSubstitute:1;
    bool32 forcePressure:1;
    bool32 cantUseTwice:1;
    bool32 alwaysHitsInRain:1;
    bool32 accuracy50InSun:1;
    bool32 alwaysHitsInHailSnow:1;
    // Ban flags
    bool32 gravityBanned:1;
    bool32 mirrorMoveBanned:1;
    bool32 meFirstBanned:1;
    bool32 mimicBanned:1;
    bool32 metronomeBanned:1;
    bool32 copycatBanned:1;
    bool32 assistBanned:1; // Matches same moves as copycatBanned + semi-invulnerable moves and Mirror Coat.
    bool32 sleepTalkBanned:1;
    bool32 instructBanned:1;
    bool32 encoreBanned:1;
    bool32 parentalBondBanned:1;
    bool32 skyBattleBanned:1;
    bool32 sketchBanned:1;
    bool32 dampBanned:1;
    //Other
    bool32 validApprenticeMove:1;
    u32 padding:6;
    // end of word

    union {
        struct {
            u16 stringId;
            u16 status;
        } twoTurnAttack;
        u32 protectMethod;
        u32 status;
        u32 moveProperty;
        u32 holdEffect;
        u32 type;
        u32 fixedDamage;
        u32 damagePercentage;
        u32 absorbPercentage;
        u32 recoilPercentage;
        u32 nonVolatileStatus;
    } argument;

    // primary/secondary effects
    const struct AdditionalEffect *additionalEffects;

    // contest parameters
    u8 contestEffect;
    u8 contestCategory:3;
    u8 contestComboStarterId;
    u8 contestComboMoves[MAX_COMBO_MOVES];
    const u8 *battleAnimScript;
};

extern const struct MoveInfo gMovesInfo[MOVES_COUNT_ALL];
extern const u8 gNotDoneYetDescription[];
extern const struct BattleMoveEffect gBattleMoveEffects[];

static inline u32 SanitizeMoveId(u32 moveId)
{
    if (moveId >= MOVES_COUNT_ALL)
        return MOVE_NONE;
    else
        return moveId;
}

static inline const u8 *GetMoveName(u32 moveId)
{
    return gMovesInfo[SanitizeMoveId(moveId)].name;
}

static inline enum BattleMoveEffects GetMoveEffect(u32 moveId)
{
    return gMovesInfo[SanitizeMoveId(moveId)].effect;
}

static inline const u8 *GetMoveDescription(u32 moveId)
{
    moveId = SanitizeMoveId(moveId);
    if (GetMoveEffect(moveId) == EFFECT_PLACEHOLDER)
        return gNotDoneYetDescription;
    return gMovesInfo[moveId].description;
}

static inline u32 GetMoveType(u32 moveId)
{
    return gMovesInfo[SanitizeMoveId(moveId)].type;
}

static inline enum DamageCategory GetMoveCategory(u32 moveId)
{
    return gMovesInfo[SanitizeMoveId(moveId)].category;
}

static inline u32 GetMovePower(u32 moveId)
{
    return gMovesInfo[SanitizeMoveId(moveId)].power;
}

static inline u32 GetMoveAccuracy(u32 moveId)
{
    return gMovesInfo[SanitizeMoveId(moveId)].accuracy;
}

static inline u32 GetMoveTarget(u32 moveId)
{
    return gMovesInfo[SanitizeMoveId(moveId)].target;
}

static inline u32 GetMovePP(u32 moveId)
{
    return gMovesInfo[SanitizeMoveId(moveId)].pp;
}

static inline u32 GetMoveZEffect(u32 moveId)
{
    return gMovesInfo[SanitizeMoveId(moveId)].zMove.effect;
}

static inline u32 GetMoveZPowerOverride(u32 moveId)
{
    return gMovesInfo[SanitizeMoveId(moveId)].zMove.powerOverride;
}

static inline s32 GetMovePriority(u32 moveId)
{
    return gMovesInfo[SanitizeMoveId(moveId)].priority;
}

static inline u32 GetMoveStrikeCount(u32 moveId)
{
    return gMovesInfo[SanitizeMoveId(moveId)].strikeCount;
}

static inline u32 GetMoveCriticalHitStage(u32 moveId)
{
    return gMovesInfo[SanitizeMoveId(moveId)].criticalHitStage;
}

static inline bool32 MoveAlwaysCrits(u32 moveId)
{
    return gMovesInfo[SanitizeMoveId(moveId)].alwaysCriticalHit;
}

static inline u32 GetMoveAdditionalEffectCount(u32 moveId)
{
    return gMovesInfo[SanitizeMoveId(moveId)].numAdditionalEffects;
}

static inline bool32 MoveMakesContact(u32 moveId)
{
    return gMovesInfo[SanitizeMoveId(moveId)].makesContact;
}

static inline bool32 MoveIgnoresProtect(u32 moveId)
{
    return gMovesInfo[SanitizeMoveId(moveId)].ignoresProtect;
}

static inline bool32 MoveCanBeBouncedBack(u32 moveId)
{
    return gMovesInfo[SanitizeMoveId(moveId)].magicCoatAffected;
}

static inline bool32 MoveCanBeSnatched(u32 moveId)
{
    return gMovesInfo[SanitizeMoveId(moveId)].snatchAffected;
}

static inline bool32 MoveIgnoresKingsRock(u32 moveId)
{
    return gMovesInfo[SanitizeMoveId(moveId)].ignoresKingsRock;
}

static inline bool32 IsPunchingMove(u32 moveId)
{
    return gMovesInfo[SanitizeMoveId(moveId)].punchingMove;
}

static inline bool32 IsBitingMove(u32 moveId)
{
    return gMovesInfo[SanitizeMoveId(moveId)].bitingMove;
}

static inline bool32 IsPulseMove(u32 moveId)
{
    return gMovesInfo[SanitizeMoveId(moveId)].pulseMove;
}

static inline bool32 IsSoundMove(u32 moveId)
{
    return gMovesInfo[SanitizeMoveId(moveId)].soundMove;
}

static inline bool32 IsBallisticMove(u32 moveId)
{
    return gMovesInfo[SanitizeMoveId(moveId)].ballisticMove;
}

static inline bool32 IsPowderMove(u32 moveId)
{
    return gMovesInfo[SanitizeMoveId(moveId)].powderMove;
}

static inline bool32 IsDanceMove(u32 moveId)
{
    return gMovesInfo[SanitizeMoveId(moveId)].danceMove;
}

static inline bool32 IsWindMove(u32 moveId)
{
    return gMovesInfo[SanitizeMoveId(moveId)].windMove;
}

static inline bool32 IsSlicingMove(u32 moveId)
{
    return gMovesInfo[SanitizeMoveId(moveId)].slicingMove;
}

static inline bool32 IsHealingMove(u32 moveId)
{
    return gMovesInfo[SanitizeMoveId(moveId)].healingMove;
}

static inline bool32 MoveIncreasesPowerToMinimizedTargets(u32 moveId)
{
    return gMovesInfo[SanitizeMoveId(moveId)].minimizeDoubleDamage;
}

static inline bool32 MoveIgnoresTargetAbility(u32 moveId)
{
    return gMovesInfo[SanitizeMoveId(moveId)].ignoresTargetAbility;
}

static inline bool32 MoveIgnoresDefenseEvasionStages(u32 moveId)
{
    return gMovesInfo[SanitizeMoveId(moveId)].ignoresTargetDefenseEvasionStages;
}

static inline bool32 MoveDamagesUnderground(u32 moveId)
{
    return gMovesInfo[SanitizeMoveId(moveId)].damagesUnderground;
}

static inline bool32 MoveDamagesUnderWater(u32 moveId)
{
    return gMovesInfo[SanitizeMoveId(moveId)].damagesUnderwater;
}

static inline bool32 MoveDamagesAirborne(u32 moveId)
{
    return gMovesInfo[SanitizeMoveId(moveId)].damagesAirborne;
}

static inline bool32 MoveDamagesAirborneDoubleDamage(u32 moveId)
{
    return gMovesInfo[SanitizeMoveId(moveId)].damagesAirborneDoubleDamage;
}

static inline bool32 MoveIgnoresTypeIfFlyingAndUngrounded(u32 moveId)
{
    return gMovesInfo[SanitizeMoveId(moveId)].ignoreTypeIfFlyingAndUngrounded;
}

static inline bool32 MoveThawsUser(u32 moveId)
{
    return gMovesInfo[SanitizeMoveId(moveId)].thawsUser;
}

static inline bool32 MoveIgnoresSubstitute(u32 moveId)
{
    return gMovesInfo[SanitizeMoveId(moveId)].ignoresSubstitute;
}

static inline bool32 MoveForcesPressure(u32 moveId)
{
    return gMovesInfo[SanitizeMoveId(moveId)].forcePressure;
}

static inline bool32 MoveCantBeUsedTwice(u32 moveId)
{
    return gMovesInfo[SanitizeMoveId(moveId)].cantUseTwice;
}

static inline bool32 MoveAlwaysHitsInRain(u32 moveId)
{
    return gMovesInfo[SanitizeMoveId(moveId)].alwaysHitsInRain;
}

static inline bool32 MoveHas50AccuracyInSun(u32 moveId)
{
    return gMovesInfo[SanitizeMoveId(moveId)].accuracy50InSun;
}

static inline bool32 MoveAlwaysHitsInHailSnow(u32 moveId)
{
    return gMovesInfo[SanitizeMoveId(moveId)].alwaysHitsInHailSnow;
}

static inline bool32 IsMoveGravityBanned(u32 moveId)
{
    return gMovesInfo[SanitizeMoveId(moveId)].gravityBanned;
}

static inline bool32 IsMoveMirrorMoveBanned(u32 moveId)
{
    return gMovesInfo[SanitizeMoveId(moveId)].mirrorMoveBanned;
}

static inline bool32 IsMoveMeFirstBanned(u32 moveId)
{
    return gMovesInfo[SanitizeMoveId(moveId)].meFirstBanned;
}

static inline bool32 IsMoveMimicBanned(u32 moveId)
{
    return gMovesInfo[SanitizeMoveId(moveId)].mimicBanned;
}

static inline bool32 IsMoveMetronomeBanned(u32 moveId)
{
    return gMovesInfo[SanitizeMoveId(moveId)].metronomeBanned;
}

static inline bool32 IsMoveCopycatBanned(u32 moveId)
{
    return gMovesInfo[SanitizeMoveId(moveId)].copycatBanned;
}

static inline bool32 IsMoveAssistBanned(u32 moveId)
{
    return gMovesInfo[SanitizeMoveId(moveId)].assistBanned;
}

static inline bool32 IsMoveSleepTalkBanned(u32 moveId)
{
    return gMovesInfo[SanitizeMoveId(moveId)].sleepTalkBanned;
}

static inline bool32 IsMoveInstructBanned(u32 moveId)
{
    return gMovesInfo[SanitizeMoveId(moveId)].instructBanned;
}

static inline bool32 IsMoveEncoreBanned(u32 moveId)
{
    return gMovesInfo[SanitizeMoveId(moveId)].encoreBanned;
}

static inline bool32 IsMoveParentalBondBanned(u32 moveId)
{
    return gMovesInfo[SanitizeMoveId(moveId)].parentalBondBanned;
}

static inline bool32 IsMoveSkyBattleBanned(u32 moveId)
{
    return gMovesInfo[SanitizeMoveId(moveId)].skyBattleBanned;
}

static inline bool32 IsMoveSketchBanned(u32 moveId)
{
    return gMovesInfo[SanitizeMoveId(moveId)].sketchBanned;
}

static inline bool32 IsMoveDampBanned(u32 moveId)
{
    return gMovesInfo[SanitizeMoveId(moveId)].dampBanned;
}

static inline bool32 IsValidApprenticeMove(u32 moveId)
{
    return gMovesInfo[SanitizeMoveId(moveId)].validApprenticeMove;
}

static inline u32 GetMoveTwoTurnAttackStringId(u32 moveId)
{
    return gMovesInfo[SanitizeMoveId(moveId)].argument.twoTurnAttack.stringId;
}

static inline u32 GetMoveTwoTurnAttackStatus(u32 moveId)
{
    return gMovesInfo[SanitizeMoveId(moveId)].argument.twoTurnAttack.status;
}

static inline u32 GetMoveTwoTurnAttackWeather(u32 moveId)
{
    return gMovesInfo[SanitizeMoveId(moveId)].argument.twoTurnAttack.status;
}

static inline enum ProtectMethod GetMoveProtectMethod(u32 moveId)
{
    return gMovesInfo[SanitizeMoveId(moveId)].argument.protectMethod;
}

static inline u32 GetMoveTerrainFlag(u32 moveId)
{
    return gMovesInfo[SanitizeMoveId(moveId)].argument.moveProperty;
}

static inline u32 GetMoveEffectArg_Status(u32 moveId)
{
    return gMovesInfo[SanitizeMoveId(moveId)].argument.status;
}

static inline u32 GetMoveEffectArg_MoveProperty(u32 moveId)
{
    return gMovesInfo[SanitizeMoveId(moveId)].argument.moveProperty;
}

static inline u32 GetMoveEffectArg_HoldEffect(u32 moveId)
{
    return gMovesInfo[SanitizeMoveId(moveId)].argument.holdEffect;
}

static inline u32 GetMoveArgType(u32 moveId)
{
    return gMovesInfo[SanitizeMoveId(moveId)].argument.type;
}

static inline u32 GetMoveFixedHPDamage(u32 moveId)
{
    return gMovesInfo[SanitizeMoveId(moveId)].argument.fixedDamage;
}

static inline u32 GetMoveAbsorbPercentage(u32 moveId)
{
    moveId = SanitizeMoveId(moveId);
    if (gMovesInfo[moveId].argument.absorbPercentage == 0)
        return 50;
    return gMovesInfo[moveId].argument.absorbPercentage;
}

static inline u32 GetMoveRecoil(u32 moveId)
{
    return gMovesInfo[SanitizeMoveId(moveId)].argument.recoilPercentage;
}

static inline u32 GetMoveNonVolatileStatus(u32 move)
{
    move = SanitizeMoveId(move);
    switch(GetMoveEffect(move))
    {
    case EFFECT_NON_VOLATILE_STATUS:
    case EFFECT_YAWN:
    case EFFECT_DARK_VOID:
        return gMovesInfo[move].argument.nonVolatileStatus;
    default:
        return MOVE_EFFECT_NONE;
    }
}

static inline u32 GetMoveDamagePercentage(u32 move)
{
    return gMovesInfo[SanitizeMoveId(move)].argument.damagePercentage;
}

static inline const struct AdditionalEffect *GetMoveAdditionalEffectById(u32 moveId, u32 effect)
{
    return &gMovesInfo[SanitizeMoveId(moveId)].additionalEffects[effect];
}

static inline u32 GetMoveContestEffect(u32 moveId)
{
    return gMovesInfo[SanitizeMoveId(moveId)].contestEffect;
}

static inline u32 GetMoveContestCategory(u32 moveId)
{
    return gMovesInfo[SanitizeMoveId(moveId)].contestCategory;
}

static inline u32 GetMoveContestComboStarter(u32 moveId)
{
    return gMovesInfo[SanitizeMoveId(moveId)].contestComboStarterId;
}

static inline u32 GetMoveContestComboMoves(u32 moveId, u32 comboMove)
{
    return gMovesInfo[SanitizeMoveId(moveId)].contestComboMoves[comboMove];
}

static inline const u8 *GetMoveAnimationScript(u32 moveId)
{
    moveId = SanitizeMoveId(moveId);
    if (gMovesInfo[moveId].battleAnimScript == NULL)
    {
        DebugPrintfLevel(MGBA_LOG_WARN, "No animation for moveId=%u", moveId);
        return gMovesInfo[MOVE_NONE].battleAnimScript;
    }
    return gMovesInfo[moveId].battleAnimScript;
}

static inline const u8 *GetMoveBattleScript(u32 moveId)
{
    moveId = SanitizeMoveId(moveId);
    if (gBattleMoveEffects[GetMoveEffect(moveId)].battleScript == NULL)
    {
        DebugPrintfLevel(MGBA_LOG_WARN, "No effect for moveId=%u", moveId);
        return gBattleMoveEffects[EFFECT_PLACEHOLDER].battleScript;
    }
    return gBattleMoveEffects[GetMoveEffect(moveId)].battleScript;
}

#endif // GUARD_MOVES_H
