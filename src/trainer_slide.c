#include "global.h"
#include "battle.h"
#include "battle_anim.h"
#include "battle_controllers.h"
#include "battle_message.h"
#include "battle_setup.h"
#include "battle_z_move.h"
#include "data.h"
#include "event_data.h"
// #include "frontier_util.h"
#include "graphics.h"
#include "international_string_util.h"
#include "item.h"
#include "link.h"
#include "menu.h"
#include "palette.h"
#include "party_menu.h"
#include "recorded_battle.h"
#include "string_util.h"
#include "strings.h"
#include "test_runner.h"
#include "text.h"
// #include "trainer_hill.h"
#include "window.h"
#include "line_break.h"
#include "constants/abilities.h"
// #include "constants/battle_dome.h"
#include "constants/battle_string_ids.h"
#include "constants/flags.h"
// #include "constants/frontier_util.h"
#include "constants/items.h"
#include "constants/moves.h"
#include "constants/opponents.h"
#include "constants/species.h"
#include "constants/trainers.h"
// #include "constants/trainer_hill.h"
#include "constants/vars.h"
#include "constants/weather.h"
#include "trainer_slide.h"
#include "battle_message.h"

static u32 BattlerHPPercentage(u32 battler, u32 operation, u32 threshold);
static u32 GetPartyMonCount(u32 firstId, u32 lastId, enum BattleSide side, bool32 onlyAlive);
static bool32 DoesTrainerHaveSlideMessage(enum DifficultyLevel difficulty, u32 trainerId, u32 slideId);
static bool32 ShouldRunTrainerSlidePlayerLandsFirstCriticalHit(u32 battler, enum TrainerSlideType slideId);
static bool32 ShouldRunTrainerSlideEnemyLandsFirstCriticalHit(u32 battler, enum TrainerSlideType slideId);
static bool32 ShouldRunTrainerSlidePlayerLandsFirstSuperEffectiveHit(u32 battler, enum TrainerSlideType slideId);
static bool32 ShouldRunTrainerSlidePlayerLandsFirstSTABMove(u32 firstId, u32 lastId, enum BattleSide side, u32 battler, enum TrainerSlideType slideId);
static bool32 ShouldRunTrainerSlidePlayerLandsFirstDown(u32 firstId, u32 lastId, enum BattleSide side);
static bool32 ShouldRunTrainerSlideEnemyMonUnaffected(u32 firstId, u32 lastId, enum BattleSide side, u32 battler, enum TrainerSlideType slideId);
static bool32 ShouldRunTrainerSlideLastSwitchIn(u32 battler);
static bool32 ShouldRunTrainerSlideLastHalfHP(u32 firstId, u32 lastId, enum BattleSide side, u32 battler);
static bool32 ShouldRunTrainerSlideLastLowHp(u32 firstId, u32 lastId, enum BattleSide side, u32 battler);
static void SetTrainerSlideParameters(u32 battler, u32* firstId, u32* lastId, u32* trainerId, u32* retValue);
static bool32 IsSlideInitalizedOrPlayed(u32 battler, enum TrainerSlideType slideId);

// Partner trainers must be added as TRAINER_PARTNER(PARTNER_XXXX)
static const u8* const sTrainerSlides[DIFFICULTY_COUNT][TRAINER_PARTNER(PARTNER_COUNT)][TRAINER_SLIDE_COUNT] =
{
    [DIFFICULTY_NORMAL] =
    {
    },
};

#define FRONTIER_TRAINERS_COUNT         300
static const u8* const sFrontierTrainerSlides[DIFFICULTY_COUNT][FRONTIER_TRAINERS_COUNT][TRAINER_SLIDE_COUNT] =
{
    [DIFFICULTY_NORMAL] =
    {
    },
};

static const u8* const sTestTrainerSlides[DIFFICULTY_COUNT][MAX_TRAINERS_COUNT + PARTNER_COUNT][TRAINER_SLIDE_COUNT] =
{
#include "../test/battle/trainer_slides.h"
};

static u32 BattlerHPPercentage(u32 battler, u32 operation, u32 threshold)
{
    switch (operation)
    {
        case LESS_THAN:
            return gBattleMons[battler].hp < (gBattleMons[battler].maxHP / threshold);
        case EQUAL:
            return gBattleMons[battler].hp == (gBattleMons[battler].maxHP / threshold);
        case GREATER_THAN:
            return gBattleMons[battler].hp > (gBattleMons[battler].maxHP / threshold);
        case LESS_THAN_OR_EQUAL:
            return gBattleMons[battler].hp <= (gBattleMons[battler].maxHP / threshold);
        case GREATER_THAN_OR_EQUAL:
            return gBattleMons[battler].hp >= (gBattleMons[battler].maxHP / threshold);
        case NOT_EQUAL:
        default:
            return gBattleMons[battler].hp != (gBattleMons[battler].maxHP / threshold);
    }
}

static const s8 sMultiBattleOrder[] = {0, 2, 3, 1, 4, 5};

static u32 GetPartyMonCount(u32 firstId, u32 lastId, enum BattleSide side, bool32 onlyAlive)
{
    u32 count = 0;
    struct Pokemon* party = (side == B_SIDE_OPPONENT ? gEnemyParty : gPlayerParty);

    if (IsMultiBattle() && side == B_SIDE_PLAYER)
    {
        for (u32 i = firstId; i < lastId; i++)
        {
            u32 species = GetMonData(&party[sMultiBattleOrder[i]], MON_DATA_SPECIES_OR_EGG);
            if (species != SPECIES_NONE
                    && species != SPECIES_EGG
                    && (!onlyAlive || GetMonData(&party[sMultiBattleOrder[i]], MON_DATA_HP)))
            {
                count++;
            }
        }
    }
    else
    {
        for (u32 i = firstId; i < lastId; i++)
        {
            u32 species = GetMonData(&party[i], MON_DATA_SPECIES_OR_EGG);
            if (species != SPECIES_NONE
                    && species != SPECIES_EGG
                    && (!onlyAlive || GetMonData(&party[i], MON_DATA_HP)))
            {
                count++;
            }
        }
    }

    return count;
}

static const u8* const *GetTrainerSlideArray(enum DifficultyLevel difficulty, u32 trainerId, u32 slideId)
{
#if TESTING
    return (FlagGet(TESTING_FLAG_TRAINER_SLIDES) ? sTestTrainerSlides[difficulty][trainerId] : NULL);
#else
    if (gBattleTypeFlags & BATTLE_TYPE_FRONTIER)
        return sFrontierTrainerSlides[difficulty][trainerId];
    else
        return sTrainerSlides[difficulty][trainerId];
#endif // TESTING
}

static bool32 DoesTrainerHaveSlideMessage(enum DifficultyLevel difficulty, u32 trainerId, u32 slideId)
{
    const u8* const *trainerSlides = GetTrainerSlideArray(difficulty, trainerId, slideId);
    const u8* const *trainerSlidesNormal = GetTrainerSlideArray(DIFFICULTY_NORMAL, trainerId, slideId);

#if TESTING
    if (VarGet(TESTING_VAR_TRAINER_SLIDES) == slideId)
    {
        if (trainerSlides[slideId] == NULL)
            return (trainerSlidesNormal[slideId] != NULL);
        else
            return TRUE;
    }
    else
    {
        return FALSE;
    }
#else
    if (trainerSlides[slideId] == NULL)
        return (trainerSlidesNormal[slideId] != NULL);
    else
        return TRUE;
#endif // TESTING
}

void SetTrainerSlideMessage(enum DifficultyLevel difficulty, u32 trainerId, u32 slideId)
{
    const u8* const *trainerSlides = GetTrainerSlideArray(difficulty, trainerId, slideId);
    const u8* const *trainerSlidesNormal = GetTrainerSlideArray(DIFFICULTY_NORMAL, trainerId, slideId);

    if (trainerSlides[slideId] != NULL)
        gBattleStruct->trainerSlideMsg = trainerSlides[slideId];
    else
        gBattleStruct->trainerSlideMsg = trainerSlidesNormal[slideId];
}

static bool32 ShouldRunTrainerSlidePlayerLandsFirstCriticalHit(u32 battler, enum TrainerSlideType slideId)
{
    return IsTrainerSlideInitialized(battler, slideId);
}

static bool32 ShouldRunTrainerSlideEnemyLandsFirstCriticalHit(u32 battler, enum TrainerSlideType slideId)
{
    return IsTrainerSlideInitialized(battler, slideId);
}

static bool32 ShouldRunTrainerSlidePlayerLandsFirstSuperEffectiveHit(u32 battler, enum TrainerSlideType slideId)
{
    if (!IsTrainerSlideInitialized(battler, slideId))
        return FALSE;

    if (!IsBattlerAlive(battler))
        return FALSE;

    return TRUE;
}

static bool32 ShouldRunTrainerSlidePlayerLandsFirstSTABMove(u32 firstId, u32 lastId, enum BattleSide side, u32 battler, enum TrainerSlideType slideId)
{
    if (!IsTrainerSlideInitialized(battler, slideId))
        return FALSE;

    if (GetPartyMonCount(firstId, lastId, side, TRUE) != GetPartyMonCount(firstId, lastId, side, FALSE))
        return FALSE;

    return TRUE;
}

static bool32 ShouldRunTrainerSlidePlayerLandsFirstDown(u32 firstId, u32 lastId, enum BattleSide side)
{
    return ((GetPartyMonCount(firstId, lastId, side, TRUE) == (GetPartyMonCount(firstId, lastId, side, FALSE) - 1)));
}

static bool32 ShouldRunTrainerSlideEnemyMonUnaffected(u32 firstId, u32 lastId, enum BattleSide side, u32 battler, enum TrainerSlideType slideId)
{
    if (!IsTrainerSlideInitialized(battler, slideId))
        return FALSE;

    return (GetPartyMonCount(firstId, lastId, side, TRUE) == GetPartyMonCount(firstId, lastId, side, FALSE));
}

static bool32 ShouldRunTrainerSlideLastSwitchIn(u32 battler)
{
    return !CanBattlerSwitch(battler);
}

static bool32 ShouldRunTrainerSlideLastHalfHP(u32 firstId, u32 lastId, enum BattleSide side, u32 battler)
{
    if (GetPartyMonCount(firstId, lastId, side, TRUE) != 1)
        return FALSE;

    if (BattlerHPPercentage(battler, GREATER_THAN, 2))
        return FALSE;

    return (BattlerHPPercentage(battler, GREATER_THAN, 4));
}

static bool32 ShouldRunTrainerSlideLastLowHp(u32 firstId, u32 lastId, enum BattleSide side, u32 battler)
{
    if (GetPartyMonCount(firstId, lastId, side, TRUE) != 1)
        return FALSE;

    if (!IsBattlerAlive(battler))
        return FALSE;

    return (BattlerHPPercentage(battler, LESS_THAN_OR_EQUAL, 4));
}

static void SetTrainerSlideParameters(u32 battler, u32* firstId, u32* lastId, u32* trainerId, u32* retValue)
{
    if ((battler & BIT_SIDE) == B_SIDE_OPPONENT)
    {
        if (gBattleTypeFlags & BATTLE_TYPE_TWO_OPPONENTS)
        {
            if (gBattlerPartyIndexes[battler] >= MULTI_PARTY_SIZE)
            {
                *firstId = MULTI_PARTY_SIZE;
                *lastId = PARTY_SIZE;
                *trainerId = SanitizeTrainerId(TRAINER_BATTLE_PARAM.opponentB);
                *retValue = TRAINER_SLIDE_TARGET_TRAINER_B;
            }
            else
            {
                *firstId = 0;
                *lastId = MULTI_PARTY_SIZE;
                *trainerId = SanitizeTrainerId(TRAINER_BATTLE_PARAM.opponentA);
            }
        }
        else
        {
            *firstId = 0;
            *lastId = PARTY_SIZE;
            *trainerId = SanitizeTrainerId(TRAINER_BATTLE_PARAM.opponentA);
        }
    }
    else if (GetBattlerPosition(battler) == B_POSITION_PLAYER_RIGHT && gBattleTypeFlags & BATTLE_TYPE_INGAME_PARTNER)
    {
        *firstId = MULTI_PARTY_SIZE;
        *lastId = PARTY_SIZE;
        *trainerId = SanitizeTrainerId(gPartnerTrainerId);
        *retValue = TRAINER_SLIDE_TARGET_TRAINER_PARTNER;
    }
}

enum TrainerSlideTargets ShouldDoTrainerSlide(u32 battler, enum TrainerSlideType slideId)
{
    u32 firstId = 0, lastId = PARTY_SIZE, trainerId = 0;
    enum BattleSide side = GetBattlerSide(battler);
    u32 retValue = TRAINER_SLIDE_TARGET_TRAINER_A;
    bool32 shouldRun = FALSE;

    if (!(gBattleTypeFlags & BATTLE_TYPE_TRAINER))
        return TRAINER_SLIDE_TARGET_NONE;

    if (!IsDoubleBattle() && (battler > B_BATTLER_1))
        return TRAINER_SLIDE_TARGET_NONE;

    SetTrainerSlideParameters(battler, &firstId, &lastId, &trainerId, &retValue);
    enum DifficultyLevel difficulty = GetCurrentDifficultyLevel();

    gBattleScripting.battler = battler;

    if (IsTrainerSlidePlayed(battler, slideId))
        return TRAINER_SLIDE_TARGET_NONE;

    if (!DoesTrainerHaveSlideMessage(difficulty,trainerId,slideId))
        return TRAINER_SLIDE_TARGET_NONE;

    switch (slideId)
    {
        case TRAINER_SLIDE_PLAYER_LANDS_FIRST_CRITICAL_HIT:
            shouldRun = ShouldRunTrainerSlidePlayerLandsFirstCriticalHit(battler, slideId);
            break;
        case TRAINER_SLIDE_ENEMY_LANDS_FIRST_CRITICAL_HIT:
            shouldRun = ShouldRunTrainerSlideEnemyLandsFirstCriticalHit(battler, slideId);
            break;
        case TRAINER_SLIDE_PLAYER_LANDS_FIRST_SUPER_EFFECTIVE_HIT:
            shouldRun = ShouldRunTrainerSlidePlayerLandsFirstSuperEffectiveHit(battler, slideId);
            break;
        case TRAINER_SLIDE_PLAYER_LANDS_FIRST_STAB_MOVE:
            shouldRun = ShouldRunTrainerSlidePlayerLandsFirstSTABMove(firstId, lastId, side, battler, slideId);
            break;
        case TRAINER_SLIDE_PLAYER_LANDS_FIRST_DOWN:
            shouldRun = ShouldRunTrainerSlidePlayerLandsFirstDown(firstId, lastId, side);
            break;
        case TRAINER_SLIDE_ENEMY_MON_UNAFFECTED:
            shouldRun = ShouldRunTrainerSlideEnemyMonUnaffected(firstId, lastId, side, battler, slideId);
            break;
        case TRAINER_SLIDE_LAST_SWITCHIN:
            shouldRun = ShouldRunTrainerSlideLastSwitchIn(battler);
            break;
        case TRAINER_SLIDE_LAST_HALF_HP:
            shouldRun = ShouldRunTrainerSlideLastHalfHP(firstId, lastId, side, battler);
            break;
        case TRAINER_SLIDE_LAST_LOW_HP:
            shouldRun = ShouldRunTrainerSlideLastLowHp(firstId, lastId, side, battler);
            break;
        case TRAINER_SLIDE_BEFORE_FIRST_TURN:
        case TRAINER_SLIDE_MEGA_EVOLUTION:
        case TRAINER_SLIDE_Z_MOVE:
        case TRAINER_SLIDE_DYNAMAX:
            shouldRun = TRUE;
            break;
        default:
            return TRAINER_SLIDE_TARGET_NONE;
    }

    if (shouldRun == FALSE)
        return TRAINER_SLIDE_TARGET_NONE;

    // Prevents slides triggering twice in single-trainer doubles (B == A / B == TRAINER_NONE) and 2v1 multibattles (B == 0xFFFF)
    if (((TRAINER_BATTLE_PARAM.opponentB == TRAINER_BATTLE_PARAM.opponentA)
     || (TRAINER_BATTLE_PARAM.opponentB == TRAINER_NONE)
     || (TRAINER_BATTLE_PARAM.opponentB == 0xFFFF)))
    {
        MarkTrainerSlideAsPlayed(BATTLE_PARTNER(battler), slideId);
    }

    MarkTrainerSlideAsPlayed(battler, slideId);
    SetTrainerSlideMessage(difficulty,trainerId,slideId);
    return retValue;
}

static bool32 IsSlideInitalizedOrPlayed(u32 battler, enum TrainerSlideType slideId)
{
    if (IsTrainerSlideInitialized(battler, slideId))
        return TRUE;

    if (IsTrainerSlidePlayed(battler, slideId))
        return TRUE;

    return FALSE;
}

void TryInitializeFirstSTABMoveTrainerSlide(u32 battlerDef, u32 battlerAtk, enum Type moveType)
{
    enum TrainerSlideType slideId = TRAINER_SLIDE_PLAYER_LANDS_FIRST_STAB_MOVE;

    if (IsSlideInitalizedOrPlayed(battlerDef, slideId))
        return;

    if ((IsOnPlayerSide(battlerDef)))
        return;

    if (IS_BATTLER_OF_TYPE(battlerAtk, moveType) == FALSE)
        return;

    InitalizeTrainerSlide(battlerDef, slideId);
}

void TryInitializeTrainerSlidePlayerLandsFirstCriticalHit(u32 target)
{
    enum TrainerSlideType slideId = TRAINER_SLIDE_PLAYER_LANDS_FIRST_CRITICAL_HIT;

    if (IsSlideInitalizedOrPlayed(target, slideId))
        return;

    if (IsOnPlayerSide(target))
        return;

    InitalizeTrainerSlide(target, slideId);
}

void TryInitializeTrainerSlideEnemyLandsFirstCriticalHit(u32 target)
{
    enum TrainerSlideType slideId = TRAINER_SLIDE_ENEMY_LANDS_FIRST_CRITICAL_HIT;

    if (IsSlideInitalizedOrPlayed(gBattlerAttacker, slideId))
        return;

    if (!IsOnPlayerSide(target))
        return;

    InitalizeTrainerSlide(gBattlerAttacker, slideId);
}

void TryInitializeTrainerSlidePlayerLandsFirstSuperEffectiveHit(u32 target)
{
    enum TrainerSlideType slideId = TRAINER_SLIDE_PLAYER_LANDS_FIRST_SUPER_EFFECTIVE_HIT;

    if (IsSlideInitalizedOrPlayed(target, slideId))
        return;

    if (IsOnPlayerSide(target))
        return;

    InitalizeTrainerSlide(target, slideId);
}

void TryInitializeTrainerSlideEnemyMonUnaffected(u32 target)
{
    enum TrainerSlideType slideId = TRAINER_SLIDE_ENEMY_MON_UNAFFECTED;

    if (IsSlideInitalizedOrPlayed(target, slideId))
        return;

    if (IsOnPlayerSide(target))
        return;

    InitalizeTrainerSlide(target, slideId);
}

bool32 IsTrainerSlideInitialized(u32 battler, enum TrainerSlideType slideId)
{
    u32 arrayIndex = slideId / TRAINER_SLIDES_PER_ARRAY;
    u32 bitPosition = slideId % TRAINER_SLIDES_PER_ARRAY;

    return (gBattleStruct->slideMessageStatus.messageInitalized[battler][arrayIndex] & (1 << bitPosition)) != 0;
}

bool32 IsTrainerSlidePlayed(u32 battler, enum TrainerSlideType slideId)
{
    u32 arrayIndex = slideId / TRAINER_SLIDES_PER_ARRAY;
    u32 bitPosition = slideId % TRAINER_SLIDES_PER_ARRAY;

    return (gBattleStruct->slideMessageStatus.messagePlayed[battler][arrayIndex] & (1 << bitPosition)) != 0;
}

void InitalizeTrainerSlide(u32 battler, enum TrainerSlideType slideId)
{
    u32 arrayIndex = slideId / TRAINER_SLIDES_PER_ARRAY;
    u32 bitPosition = slideId % TRAINER_SLIDES_PER_ARRAY;

    gBattleStruct->slideMessageStatus.messageInitalized[battler][arrayIndex] |= (1 << bitPosition);
}

void MarkInitializedTrainerSlidesAsPlayed(u32 battler, enum TrainerSlideType slideId)
{
    u32 arrayIndex = slideId / TRAINER_SLIDES_PER_ARRAY;
    u32 bitPosition = slideId % TRAINER_SLIDES_PER_ARRAY;

    if (IsTrainerSlideInitialized(battler, slideId) && !IsTrainerSlidePlayed(battler, slideId))
        gBattleStruct->slideMessageStatus.messagePlayed[battler][arrayIndex] |= (1 << bitPosition);
}

void MarkTrainerSlideAsPlayed(u32 battler, enum TrainerSlideType slideId)
{
    u32 arrayIndex = slideId / TRAINER_SLIDES_PER_ARRAY;
    u32 bitPosition = slideId % TRAINER_SLIDES_PER_ARRAY;

    gBattleStruct->slideMessageStatus.messagePlayed[battler][arrayIndex] |= (1 << bitPosition);
}
