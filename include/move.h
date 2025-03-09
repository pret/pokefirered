#ifndef GUARD_MOVES_H
#define GUARD_MOVES_H

#include "contest_effect.h"
#include "constants/battle_move_effects.h"
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

enum SheerForceBoost
{
    SHEER_FORCE_AUTO_BOOST, // This is the default state when a move has a move effect with a chance
    SHEER_FORCE_BOOST,      // If a move effect doesn't have an effect with a chance this can force a boost
    SHEER_FORCE_NO_BOOST,   // Prevents a Sheer Force boost
};

struct AdditionalEffect
{
    u16 moveEffect;
    u8 self:1;
    u8 onlyIfTargetRaisedStats:1;
    u8 onChargeTurnOnly:1;
    u8 sheerForceBoost:2; // Handles edge cases for Sheer Force
    u8 padding:3;
    u8 chance; // 0% = effect certain, primary effect
};

struct MoveInfo
{
    const u8 *name;
    const u8 *description;
    u16 effect;
    u16 type:5;     // Up to 32
    u16 category:2;
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
    u32 recoil:7;
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
    // end of word
    bool32 windMove:1;
    bool32 slicingMove:1;
    bool32 healingMove:1;
    bool32 minimizeDoubleDamage:1;
    bool32 ignoresTargetAbility:1;
    bool32 ignoresTargetDefenseEvasionStages:1;
    bool32 damagesUnderground:1;
    bool32 damagesUnderwater:1;
    bool32 damagesAirborne:1;
    bool32 damagesAirborneDoubleDamage:1;
    bool32 ignoreTypeIfFlyingAndUngrounded:1;
    bool32 thawsUser:1;
    bool32 ignoresSubstitute:1;
    bool32 forcePressure:1;
    bool32 cantUseTwice:1;
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
    //Other
    bool32 validApprenticeMove:1;
    u32 padding:3;
    // end of word

    union {
        struct {
            u16 stringId;
            u16 status;
        } twoTurnAttack;
        struct {
            u16 side;
            u16 property; // can be used to remove the hardcoded values
        } protect;
        u32 status;
        u16 moveProperty;
        u16 holdEffect;
        u16 type;
        u16 fixedDamage;
        u16 absorbPercentage;
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

extern const struct MoveInfo gMovesInfo[];
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

static inline const u8 *GetMoveDescription(u32 moveId)
{
    moveId = SanitizeMoveId(moveId);
    if (gMovesInfo[moveId].effect == EFFECT_PLACEHOLDER)
        return gNotDoneYetDescription;
    return gMovesInfo[moveId].description;
}

static inline u32 GetMoveEffect(u32 moveId)
{
    return gMovesInfo[SanitizeMoveId(moveId)].effect;
}

static inline u32 GetMoveType(u32 moveId)
{
    return gMovesInfo[SanitizeMoveId(moveId)].type;
}

static inline u32 GetMoveCategory(u32 moveId)
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

static inline u32 GetMoveRecoil(u32 moveId)
{
    return gMovesInfo[SanitizeMoveId(moveId)].recoil;
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

static inline u32 GetMoveTwoTurnAttackStringId(u32 moveId)
{
    return gMovesInfo[SanitizeMoveId(moveId)].argument.twoTurnAttack.stringId;
}

static inline u32 GetMoveTwoTurnAttackStatus(u32 moveId)
{
    return UNCOMPRESS_BITS(gMovesInfo[SanitizeMoveId(moveId)].argument.twoTurnAttack.status);
}

static inline u32 GetMoveTwoTurnAttackWeather(u32 moveId)
{
    return gMovesInfo[SanitizeMoveId(moveId)].argument.twoTurnAttack.status;
}

static inline u32 GetMoveProtectSide(u32 moveId)
{
    return gMovesInfo[SanitizeMoveId(moveId)].argument.protect.side;
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

static inline u32 GetMoveFixedDamage(u32 moveId)
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
    if (gBattleMoveEffects[gMovesInfo[moveId].effect].battleScript == NULL)
    {
        DebugPrintfLevel(MGBA_LOG_WARN, "No effect for moveId=%u", moveId);
        return gBattleMoveEffects[EFFECT_PLACEHOLDER].battleScript;
    }
    return gBattleMoveEffects[gMovesInfo[moveId].effect].battleScript;
}

#endif // GUARD_MOVES_H
