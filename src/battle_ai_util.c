#include "global.h"
#include "battle_z_move.h"
#include "malloc.h"
#include "battle.h"
#include "battle_anim.h"
#include "battle_ai_util.h"
#include "battle_ai_main.h"
#include "battle_ai_switch_items.h"
// #include "battle_factory.h"
#include "battle_setup.h"
#include "event_data.h"
#include "data.h"
#include "item.h"
#include "move.h"
#include "pokemon.h"
#include "random.h"
#include "recorded_battle.h"
#include "util.h"
#include "constants/abilities.h"
#include "constants/battle_ai.h"
#include "constants/battle_move_effects.h"
#include "constants/hold_effects.h"
#include "constants/moves.h"
#include "constants/items.h"

// Functions
static bool32 AI_IsDoubleSpreadMove(u32 battlerAtk, u32 move)
{
    u32 numOfTargets = 0;
    u32 moveTargetType = GetBattlerMoveTargetType(battlerAtk, move);

    if (!IsSpreadMove(moveTargetType))
        return FALSE;

    for (u32 battlerDef = 0; battlerDef < MAX_BATTLERS_COUNT; battlerDef++)
    {
        if (battlerAtk == battlerDef)
            continue;

        if (moveTargetType == MOVE_TARGET_BOTH && battlerAtk == BATTLE_PARTNER(battlerDef))
            continue;

        if (IsBattlerAlive(battlerDef) && !IsSemiInvulnerable(battlerDef, move))
            numOfTargets++;
    }

    if (numOfTargets > 1)
        return TRUE;

    return FALSE;
}

u32 AI_GetDamage(u32 battlerAtk, u32 battlerDef, u32 moveIndex, enum DamageCalcContext calcContext, struct AiLogicData *aiData)
{
    if (calcContext == AI_ATTACKING && BattlerHasAi(battlerAtk))
    {

        if ((AI_THINKING_STRUCT->aiFlags[battlerAtk] & AI_FLAG_RISKY) && !(AI_THINKING_STRUCT->aiFlags[battlerAtk] & AI_FLAG_CONSERVATIVE)) // Risky assumes it deals max damage
            return aiData->simulatedDmg[battlerAtk][battlerDef][moveIndex].maximum;
        if ((AI_THINKING_STRUCT->aiFlags[battlerAtk] & AI_FLAG_CONSERVATIVE) && !(AI_THINKING_STRUCT->aiFlags[battlerAtk] & AI_FLAG_RISKY)) // Conservative assumes it deals min damage
            return aiData->simulatedDmg[battlerAtk][battlerDef][moveIndex].minimum;
        return aiData->simulatedDmg[battlerAtk][battlerDef][moveIndex].median; // Default assumes it deals median damage
    }
    else if (calcContext == AI_DEFENDING && BattlerHasAi(battlerDef))
    {
        if ((AI_THINKING_STRUCT->aiFlags[battlerAtk] & AI_FLAG_RISKY) && !(AI_THINKING_STRUCT->aiFlags[battlerAtk] & AI_FLAG_CONSERVATIVE)) // Risky assumes it takes min damage
            return aiData->simulatedDmg[battlerAtk][battlerDef][moveIndex].minimum;
        if ((AI_THINKING_STRUCT->aiFlags[battlerAtk] & AI_FLAG_CONSERVATIVE) && !(AI_THINKING_STRUCT->aiFlags[battlerAtk] & AI_FLAG_RISKY)) // Conservative assumes it takes max damage
            return aiData->simulatedDmg[battlerAtk][battlerDef][moveIndex].maximum;
        return aiData->simulatedDmg[battlerAtk][battlerDef][moveIndex].median; // Default assumes it takes median damage
    }
    else
    {
        return aiData->simulatedDmg[battlerAtk][battlerDef][moveIndex].median;
    }
}

bool32 AI_IsFaster(u32 battlerAi, u32 battlerDef, u32 move)
{
    return (AI_WhoStrikesFirst(battlerAi, battlerDef, move) == AI_IS_FASTER);
}

bool32 AI_IsSlower(u32 battlerAi, u32 battlerDef, u32 move)
{
    return (AI_WhoStrikesFirst(battlerAi, battlerDef, move) == AI_IS_SLOWER);
}

u32 GetAIChosenMove(u32 battlerId)
{
    return (gBattleMons[battlerId].moves[gAiBattleData->moveOrAction[battlerId]]);
}

bool32 AI_RandLessThan(u32 val)
{
    if ((Random() % 0xFF) < val)
        return TRUE;
    return FALSE;
}

bool32 IsAiVsAiBattle(void)
{
    return (B_FLAG_AI_VS_AI_BATTLE && FlagGet(B_FLAG_AI_VS_AI_BATTLE));
}

bool32 BattlerHasAi(u32 battlerId)
{
    switch (GetBattlerPosition(battlerId))
    {
    case B_POSITION_PLAYER_LEFT:
        if (IsAiVsAiBattle())
            return TRUE;
    default:
        return FALSE;
    case B_POSITION_OPPONENT_LEFT:
        return TRUE;
    case B_POSITION_PLAYER_RIGHT:
        if ((gBattleTypeFlags & BATTLE_TYPE_INGAME_PARTNER) || IsAiVsAiBattle())
            return TRUE;
        else
            return FALSE;
    case B_POSITION_OPPONENT_RIGHT:
        return TRUE;
    }
}

bool32 IsAiBattlerAware(u32 battlerId)
{
    if (AI_THINKING_STRUCT->aiFlags[B_POSITION_OPPONENT_LEFT] & AI_FLAG_OMNISCIENT
     || AI_THINKING_STRUCT->aiFlags[B_POSITION_OPPONENT_RIGHT] & AI_FLAG_OMNISCIENT)
        return TRUE;

    return BattlerHasAi(battlerId);
}

bool32 IsAiBattlerPredictingAbility(u32 battlerId)
{
    if (AI_THINKING_STRUCT->aiFlags[B_POSITION_OPPONENT_LEFT] & AI_FLAG_WEIGH_ABILITY_PREDICTION
     || AI_THINKING_STRUCT->aiFlags[B_POSITION_OPPONENT_RIGHT] & AI_FLAG_WEIGH_ABILITY_PREDICTION)
        return TRUE;

    return BattlerHasAi(battlerId);
}

bool32 IsBattlerPredictedToSwitch(u32 battler)
{
    // Check for prediction flag on AI, whether they're using those predictions this turn, and whether the AI thinks the player should switch
    if (AI_THINKING_STRUCT->aiFlags[AI_DATA->battlerDoingPrediction] & AI_FLAG_PREDICT_SWITCH
        || AI_THINKING_STRUCT->aiFlags[AI_DATA->battlerDoingPrediction] & AI_FLAG_PREDICT_SWITCH)
     {
        if (AI_DATA->predictingSwitch && AI_DATA->shouldSwitch & (1u << battler))
            return TRUE;
     }
    return FALSE;
}

void ClearBattlerMoveHistory(u32 battlerId)
{
    memset(BATTLE_HISTORY->usedMoves[battlerId], 0, sizeof(BATTLE_HISTORY->usedMoves[battlerId]));
    memset(BATTLE_HISTORY->moveHistory[battlerId], 0, sizeof(BATTLE_HISTORY->moveHistory[battlerId]));
    BATTLE_HISTORY->moveHistoryIndex[battlerId] = 0;
}

void RecordLastUsedMoveBy(u32 battlerId, u32 move)
{
    u8 *index = &BATTLE_HISTORY->moveHistoryIndex[battlerId];

    if (++(*index) >= AI_MOVE_HISTORY_COUNT)
        *index = 0;
    BATTLE_HISTORY->moveHistory[battlerId][*index] = move;
}

void RecordKnownMove(u32 battlerId, u32 move)
{
    s32 i;
    for (i = 0; i < MAX_MON_MOVES; i++)
    {

        if (BATTLE_HISTORY->usedMoves[battlerId][i] == move)
            break;
        if (BATTLE_HISTORY->usedMoves[battlerId][i] == MOVE_NONE)
        {
            BATTLE_HISTORY->usedMoves[battlerId][i] = move;
            AI_PARTY->mons[GetBattlerSide(battlerId)][gBattlerPartyIndexes[battlerId]].moves[i] = move;
            break;
        }
    }
}

void RecordAllMoves(u32 battler)
{
    memcpy(AI_PARTY->mons[GetBattlerSide(battler)][gBattlerPartyIndexes[battler]].moves, gBattleMons[battler].moves, MAX_MON_MOVES * sizeof(u16));
}

void RecordAbilityBattle(u32 battlerId, u32 abilityId)
{
    BATTLE_HISTORY->abilities[battlerId] = abilityId;
    AI_PARTY->mons[GetBattlerSide(battlerId)][gBattlerPartyIndexes[battlerId]].ability = abilityId;
}

void ClearBattlerAbilityHistory(u32 battlerId)
{
    BATTLE_HISTORY->abilities[battlerId] = ABILITY_NONE;
}

void RecordItemEffectBattle(u32 battlerId, u32 itemEffect)
{
    BATTLE_HISTORY->itemEffects[battlerId] = itemEffect;
    AI_PARTY->mons[GetBattlerSide(battlerId)][gBattlerPartyIndexes[battlerId]].heldEffect = itemEffect;
}

void ClearBattlerItemEffectHistory(u32 battlerId)
{
    BATTLE_HISTORY->itemEffects[battlerId] = 0;
}

void SaveBattlerData(u32 battlerId)
{
    if (!BattlerHasAi(battlerId) && !AI_THINKING_STRUCT->saved[battlerId].saved)
    {
        u32 i;

        AI_THINKING_STRUCT->saved[battlerId].saved = TRUE;
        AI_THINKING_STRUCT->saved[battlerId].ability = gBattleMons[battlerId].ability;
        AI_THINKING_STRUCT->saved[battlerId].heldItem = gBattleMons[battlerId].item;
        AI_THINKING_STRUCT->saved[battlerId].species = gBattleMons[battlerId].species;
        for (i = 0; i < 4; i++)
            AI_THINKING_STRUCT->saved[battlerId].moves[i] = gBattleMons[battlerId].moves[i];
    }
    // Save and restore types even for AI controlled battlers in case it gets changed during move evaluation process.
    AI_THINKING_STRUCT->saved[battlerId].types[0] = gBattleMons[battlerId].types[0];
    AI_THINKING_STRUCT->saved[battlerId].types[1] = gBattleMons[battlerId].types[1];
}

static bool32 ShouldFailForIllusion(u32 illusionSpecies, u32 battlerId)
{
    u32 i, j;
    const struct LevelUpMove *learnset;

    if (BATTLE_HISTORY->abilities[battlerId] == ABILITY_ILLUSION)
        return FALSE;

    // Don't fall for Illusion if the mon used a move it cannot know.
    for (i = 0; i < MAX_MON_MOVES; i++)
    {
        u32 move = BATTLE_HISTORY->usedMoves[battlerId][i];
        if (move == MOVE_NONE)
            continue;

        learnset = GetSpeciesLevelUpLearnset(illusionSpecies);
        for (j = 0; learnset[j].move != MOVE_UNAVAILABLE; j++)
        {
            if (learnset[j].move == move)
                break;
        }
        // The used move is in the learnsets of the fake species.
        if (learnset[j].move != MOVE_UNAVAILABLE)
            continue;

        // The used move can be learned from Tm/Hm or Move Tutors.
        if (CanLearnTeachableMove(illusionSpecies, move))
            continue;

        // 'Illegal move', AI won't fail for the illusion.
        return FALSE;
    }

    return TRUE;
}

void SetBattlerData(u32 battlerId)
{
    if (!BattlerHasAi(battlerId) && AI_THINKING_STRUCT->saved[battlerId].saved)
    {
        u32 i, species, illusionSpecies, side;
        side = GetBattlerSide(battlerId);

        // Simulate Illusion
        species = gBattleMons[battlerId].species;
        illusionSpecies = GetIllusionMonSpecies(battlerId);
        if (illusionSpecies != SPECIES_NONE && ShouldFailForIllusion(illusionSpecies, battlerId))
        {
            // If the battler's type has not been changed, AI assumes the types of the illusion mon.
            if (gBattleMons[battlerId].types[0] == gSpeciesInfo[species].types[0]
                && gBattleMons[battlerId].types[1] == gSpeciesInfo[species].types[1])
            {
                gBattleMons[battlerId].types[0] = gSpeciesInfo[illusionSpecies].types[0];
                gBattleMons[battlerId].types[1] = gSpeciesInfo[illusionSpecies].types[1];
            }
            species = illusionSpecies;
        }

        // Use the known battler's ability.
        if (AI_PARTY->mons[side][gBattlerPartyIndexes[battlerId]].ability != ABILITY_NONE)
            gBattleMons[battlerId].ability = AI_PARTY->mons[side][gBattlerPartyIndexes[battlerId]].ability;
        // Check if mon can only have one ability.
        else if (gSpeciesInfo[species].abilities[1] == ABILITY_NONE
                || gSpeciesInfo[species].abilities[1] == gSpeciesInfo[species].abilities[0])
            gBattleMons[battlerId].ability = gSpeciesInfo[species].abilities[0];
        // The ability is unknown.
        else
            gBattleMons[battlerId].ability = ABILITY_NONE;

        if (AI_PARTY->mons[side][gBattlerPartyIndexes[battlerId]].heldEffect == 0)
            gBattleMons[battlerId].item = 0;

        for (i = 0; i < MAX_MON_MOVES; i++)
        {
            if (AI_PARTY->mons[side][gBattlerPartyIndexes[battlerId]].moves[i] == 0)
                gBattleMons[battlerId].moves[i] = 0;
        }
    }
}

void RestoreBattlerData(u32 battlerId)
{
    if (!BattlerHasAi(battlerId) && AI_THINKING_STRUCT->saved[battlerId].saved)
    {
        u32 i;

        AI_THINKING_STRUCT->saved[battlerId].saved = FALSE;
        gBattleMons[battlerId].ability = AI_THINKING_STRUCT->saved[battlerId].ability;
        gBattleMons[battlerId].item = AI_THINKING_STRUCT->saved[battlerId].heldItem;
        gBattleMons[battlerId].species = AI_THINKING_STRUCT->saved[battlerId].species;
        for (i = 0; i < 4; i++)
            gBattleMons[battlerId].moves[i] = AI_THINKING_STRUCT->saved[battlerId].moves[i];
    }
    gBattleMons[battlerId].types[0] = AI_THINKING_STRUCT->saved[battlerId].types[0];
    gBattleMons[battlerId].types[1] = AI_THINKING_STRUCT->saved[battlerId].types[1];
}

u32 GetHealthPercentage(u32 battlerId)
{
    return (u32)((100 * gBattleMons[battlerId].hp) / gBattleMons[battlerId].maxHP);
}

bool32 AI_BattlerAtMaxHp(u32 battlerId)
{
    if (AI_DATA->hpPercents[battlerId] == 100)
        return TRUE;
    return FALSE;
}


bool32 AI_CanBattlerEscape(u32 battler)
{
    enum ItemHoldEffect holdEffect = AI_DATA->holdEffects[battler];

    if (B_GHOSTS_ESCAPE >= GEN_6 && IS_BATTLER_OF_TYPE(battler, TYPE_GHOST))
        return TRUE;
    if (holdEffect == HOLD_EFFECT_SHED_SHELL)
        return TRUE;

    return FALSE;
}

bool32 IsBattlerTrapped(u32 battlerAtk, u32 battlerDef)
{
    if (gBattleMons[battlerDef].status2 & (STATUS2_ESCAPE_PREVENTION | STATUS2_WRAPPED))
        return TRUE;
    if (gStatuses3[battlerDef] & (STATUS3_ROOTED | STATUS3_SKY_DROPPED))
        return TRUE;
    if (gFieldStatuses & STATUS_FIELD_FAIRY_LOCK)
        return TRUE;
    if (AI_IsAbilityOnSide(battlerAtk, ABILITY_SHADOW_TAG)
        && (B_SHADOW_TAG_ESCAPE >= GEN_4 && AI_DATA->abilities[battlerDef] != ABILITY_SHADOW_TAG))
        return TRUE;
    if (AI_IsAbilityOnSide(battlerAtk, ABILITY_ARENA_TRAP)
        && IsBattlerGrounded(battlerAtk))
        return TRUE;
    if (AI_IsAbilityOnSide(battlerAtk, ABILITY_MAGNET_PULL)
        && IS_BATTLER_OF_TYPE(battlerAtk, TYPE_STEEL))
        return TRUE;

    return FALSE;
}

u32 GetTotalBaseStat(u32 species)
{
    return gSpeciesInfo[species].baseHP
        + gSpeciesInfo[species].baseAttack
        + gSpeciesInfo[species].baseDefense
        + gSpeciesInfo[species].baseSpeed
        + gSpeciesInfo[species].baseSpAttack
        + gSpeciesInfo[species].baseSpDefense;
}

bool32 IsTruantMonVulnerable(u32 battlerAI, u32 opposingBattler)
{
    int i;

    for (i = 0; i < MAX_MON_MOVES; i++)
    {
        u32 move = gBattleResources->battleHistory->usedMoves[opposingBattler][i];
        enum BattleMoveEffects effect = GetMoveEffect(move);
        if (effect == EFFECT_PROTECT && move != MOVE_ENDURE)
            return TRUE;
        if (effect == EFFECT_SEMI_INVULNERABLE && AI_IsSlower(battlerAI, opposingBattler, GetAIChosenMove(battlerAI)))
            return TRUE;
    }
    return FALSE;
}

// move checks
bool32 IsAffectedByPowder(u32 battler, u32 ability, enum ItemHoldEffect holdEffect)
{
    if (ability == ABILITY_OVERCOAT
        || (B_POWDER_GRASS >= GEN_6 && IS_BATTLER_OF_TYPE(battler, TYPE_GRASS))
        || holdEffect == HOLD_EFFECT_SAFETY_GOGGLES)
        return FALSE;
    return TRUE;
}

// This function checks if all physical/special moves are either unusable or unreasonable to use.
// Consider a pokemon boosting their attack against a ghost pokemon having only normal-type physical attacks.
bool32 MovesWithCategoryUnusable(u32 attacker, u32 target, u32 category)
{
    s32 i, moveType;
    u32 usable = 0;
    u16 *moves = GetMovesArray(attacker);
    u32 moveLimitations = AI_DATA->moveLimitations[attacker];

    for (i = 0; i < MAX_MON_MOVES; i++)
    {
        if (IsMoveUnusable(i, moves[i], moveLimitations))
            continue;

        if (GetBattleMoveCategory(moves[i]) == category)
        {
            SetTypeBeforeUsingMove(moves[i], attacker);
            moveType = GetBattleMoveType(moves[i]);
            if (CalcTypeEffectivenessMultiplier(moves[i], moveType, attacker, target, AI_DATA->abilities[target], FALSE) != 0)
                usable |= 1u << i;
        }
    }

    return (usable == 0);
}

// To save computation time this function has 2 variants. One saves, sets and restores battlers, while the other doesn't.
struct SimulatedDamage AI_CalcDamageSaveBattlers(u32 move, u32 battlerAtk, u32 battlerDef, uq4_12_t *typeEffectiveness, bool32 considerZPower)
{
    struct SimulatedDamage dmg;

    SaveBattlerData(battlerAtk);
    SaveBattlerData(battlerDef);
    SetBattlerData(battlerAtk);
    SetBattlerData(battlerDef);
    dmg = AI_CalcDamage(move, battlerAtk, battlerDef, typeEffectiveness, considerZPower, AI_GetWeather());
    RestoreBattlerData(battlerAtk);
    RestoreBattlerData(battlerDef);
    return dmg;
}

static inline s32 LowestRollDmg(s32 dmg)
{
    dmg *= MIN_ROLL_PERCENTAGE;
    dmg /= 100;
    return dmg;
}

static inline s32 HighestRollDmg(s32 dmg)
{
    dmg *= MAX_ROLL_PERCENTAGE;
    dmg /= 100;
    return dmg;
}

static inline s32 DmgRoll(s32 dmg)
{
    dmg *= DMG_ROLL_PERCENTAGE;
    dmg /= 100;
    return dmg;
}

bool32 IsDamageMoveUnusable(u32 battlerAtk, u32 battlerDef, u32 move, u32 moveType)
{
    struct AiLogicData *aiData = AI_DATA;

    if (gBattleStruct->battlerState[battlerDef].commandingDondozo)
        return TRUE;

    if (CanAbilityBlockMove(battlerAtk, battlerDef, aiData->abilities[battlerAtk], aiData->abilities[battlerDef], move, ABILITY_CHECK_TRIGGER_AI))
        return TRUE;

    if (CanAbilityAbsorbMove(battlerAtk, battlerDef, aiData->abilities[battlerDef], move, moveType, ABILITY_CHECK_TRIGGER_AI))
        return TRUE;

    switch (GetMoveEffect(move))
    {
    case EFFECT_DREAM_EATER:
        if (!AI_IsBattlerAsleepOrComatose(battlerDef))
            return TRUE;
        break;
    case EFFECT_BELCH:
        if (IsBelchPreventingMove(battlerAtk, move))
            return TRUE;
        break;
    case EFFECT_LAST_RESORT:
        if (!CanUseLastResort(battlerAtk))
            return TRUE;
        break;
    case EFFECT_LOW_KICK:
    case EFFECT_HEAT_CRASH:
        if (GetActiveGimmick(battlerDef) == GIMMICK_DYNAMAX)
            return TRUE;
        break;
    case EFFECT_FAIL_IF_NOT_ARG_TYPE:
        if (!IS_BATTLER_OF_TYPE(battlerAtk, GetMoveArgType(move)))
            return TRUE;
        break;
    case EFFECT_HIT_SET_REMOVE_TERRAIN:
        if (!(gFieldStatuses & STATUS_FIELD_TERRAIN_ANY) && GetMoveEffectArg_MoveProperty(move) == ARG_TRY_REMOVE_TERRAIN_FAIL)
            return TRUE;
        break;
    case EFFECT_POLTERGEIST:
        if (AI_DATA->items[battlerDef] == ITEM_NONE || !IsBattlerItemEnabled(battlerDef))
            return TRUE;
        break;
    case EFFECT_FIRST_TURN_ONLY:
        if (!gDisableStructs[battlerAtk].isFirstTurn)
            return TRUE;
        break;
    default:
        break;
    }

    return FALSE;
}

static inline s32 GetDamageByRollType(s32 dmg, enum DamageRollType rollType)
{
    if (rollType == DMG_ROLL_LOWEST)
        return LowestRollDmg(dmg);
    else if (rollType == DMG_ROLL_HIGHEST)
        return HighestRollDmg(dmg);
    else
        return DmgRoll(dmg);
}

static inline s32 SetFixedMoveBasePower(u32 battlerAtk, u32 move)
{
    s32 fixedBasePower = 0, n = 0;
    switch (GetMoveEffect(move))
    {
    case EFFECT_ROLLOUT:
        n = gDisableStructs[battlerAtk].rolloutTimer - 1;
        fixedBasePower = CalcRolloutBasePower(battlerAtk, GetMovePower(move), n < 0 ? 5 : n);
        break;
    case EFFECT_FURY_CUTTER:
        fixedBasePower = CalcFuryCutterBasePower(GetMovePower(move), min(gDisableStructs[battlerAtk].furyCutterCounter + 1, 5));
        break;
    default:
        fixedBasePower = 0;
        break;
    }
    return fixedBasePower;
}

static inline void AI_StoreBattlerTypes(u32 battlerAtk, u32 *types)
{
    types[0] = gBattleMons[battlerAtk].types[0];
    types[1] = gBattleMons[battlerAtk].types[1];
    types[2] = gBattleMons[battlerAtk].types[2];
}

static inline void AI_RestoreBattlerTypes(u32 battlerAtk, u32 *types)
{
    gBattleMons[battlerAtk].types[0] = types[0];
    gBattleMons[battlerAtk].types[1] = types[1];
    gBattleMons[battlerAtk].types[2] = types[2];
}

static inline void CalcDynamicMoveDamage(struct DamageCalculationData *damageCalcData, u16 *medianDamage, u16 *minimumDamage, u16 *maximumDamage, enum ItemHoldEffect holdEffectAtk, u32 abilityAtk)
{
    u32 move = damageCalcData->move;
    enum BattleMoveEffects effect = GetMoveEffect(move);
    u16 median = *medianDamage;
    u16 minimum = *minimumDamage;
    u16 maximum = *maximumDamage;

    switch (effect)
    {
    case EFFECT_MULTI_HIT:
        if (move == MOVE_WATER_SHURIKEN && gBattleMons[damageCalcData->battlerAtk].species == SPECIES_GRENINJA_ASH)
        {
            median *= 3;
            minimum *= 3;
            maximum *= 3;
        }
        else if (abilityAtk == ABILITY_SKILL_LINK)
        {
            median *= 5;
            minimum *= 5;
            maximum *= 5;
        }
        else if (holdEffectAtk == HOLD_EFFECT_LOADED_DICE)
        {
            median *= 9;
            median /= 2;
            minimum *= 4;
            maximum *= 5;
        }
        else
        {
            median *= 3;
            minimum *= 2;
            maximum *= 5;
        }
        break;
    case EFFECT_ENDEAVOR:
        // If target has less HP than user, Endeavor does no damage
        median = maximum = minimum = max(0, gBattleMons[damageCalcData->battlerDef].hp - gBattleMons[damageCalcData->battlerAtk].hp);
        break;
    case EFFECT_FINAL_GAMBIT:
        median = maximum = minimum = gBattleMons[damageCalcData->battlerAtk].hp;
        break;
    case EFFECT_BEAT_UP:
        if (B_BEAT_UP >= GEN_5)
        {
            u32 partyCount = CalculatePartyCount(GetBattlerParty(damageCalcData->battlerAtk));
            u32 i;
            gBattleStruct->beatUpSlot = 0;
            damageCalcData->isCrit = FALSE;
            median = 0;
            for (i = 0; i < partyCount; i++)
                median += CalculateMoveDamage(damageCalcData, 0);
            maximum = minimum = median;
            gBattleStruct->beatUpSlot = 0;
        }
        break;
    default:
        break;
    }

    // Handle other multi-strike moves
    u32 strikeCount = GetMoveStrikeCount(move);
    if (strikeCount > 1 && effect != EFFECT_TRIPLE_KICK)
    {
        median *= strikeCount;
        minimum *= strikeCount;
        maximum *= strikeCount;
    }

    if (abilityAtk == ABILITY_PARENTAL_BOND
        && !strikeCount
        && effect != EFFECT_TRIPLE_KICK
        && effect != EFFECT_MULTI_HIT
        && !AI_IsDoubleSpreadMove(damageCalcData->battlerAtk, move))
    {
        median  += median  / (B_PARENTAL_BOND_DMG >= GEN_7 ? 4 : 2);
        minimum += minimum / (B_PARENTAL_BOND_DMG >= GEN_7 ? 4 : 2);
        maximum += maximum / (B_PARENTAL_BOND_DMG >= GEN_7 ? 4 : 2);
    }

    if (median == 0)
        median = 1;
    if (minimum == 0)
        minimum = 1;
    if (maximum == 0)
        maximum = 1;

    *medianDamage = median;
    *minimumDamage = minimum;
    *maximumDamage = maximum;
}

static inline bool32 ShouldCalcCritDamage(u32 battlerAtk, u32 battlerDef, u32 move, struct AiLogicData *aiData)
{
    s32 critChanceIndex = 0;

    // Get crit chance
    if (GetGenConfig(GEN_CONFIG_CRIT_CHANCE) == GEN_1)
        critChanceIndex = CalcCritChanceStageGen1(battlerAtk, battlerDef, move, FALSE, aiData->abilities[battlerAtk], aiData->abilities[battlerDef], aiData->holdEffects[battlerAtk]);
    else
        critChanceIndex = CalcCritChanceStage(battlerAtk, battlerDef, move, FALSE, aiData->abilities[battlerAtk], aiData->abilities[battlerDef], aiData->holdEffects[battlerAtk]);

    if (critChanceIndex == CRITICAL_HIT_ALWAYS)
        return TRUE;
    if (critChanceIndex >= RISKY_AI_CRIT_STAGE_THRESHOLD // Not guaranteed but above Risky threshold
        && (AI_THINKING_STRUCT->aiFlags[battlerAtk] & AI_FLAG_RISKY)
        && GetGenConfig(GEN_CONFIG_CRIT_CHANCE) != GEN_1)
        return TRUE;
    if (critChanceIndex >= RISKY_AI_CRIT_THRESHOLD_GEN_1 // Not guaranteed but above Risky threshold
        && (AI_THINKING_STRUCT->aiFlags[battlerAtk] & AI_FLAG_RISKY)
        && GetGenConfig(GEN_CONFIG_CRIT_CHANCE) == GEN_1)
        return TRUE;
    return FALSE;
}

struct SimulatedDamage AI_CalcDamage(u32 move, u32 battlerAtk, u32 battlerDef, uq4_12_t *typeEffectiveness, bool32 considerZPower, u32 weather)
{
    struct SimulatedDamage simDamage;
    s32 moveType;
    enum BattleMoveEffects moveEffect = GetMoveEffect(move);
    uq4_12_t effectivenessMultiplier;
    bool32 isDamageMoveUnusable = FALSE;
    bool32 toggledGimmick = FALSE;
    struct AiLogicData *aiData = AI_DATA;
    AI_DATA->aiCalcInProgress = TRUE;

    if (moveEffect == EFFECT_NATURE_POWER)
        move = GetNaturePowerMove(battlerAtk);

    // Temporarily enable gimmicks for damage calcs if planned
    if (gBattleStruct->gimmick.usableGimmick[battlerAtk] && GetActiveGimmick(battlerAtk) == GIMMICK_NONE
        && !(gBattleStruct->gimmick.usableGimmick[battlerAtk] == GIMMICK_Z_MOVE && !considerZPower))
    {
        // Set Z-Move variables if needed
        if (gBattleStruct->gimmick.usableGimmick[battlerAtk] == GIMMICK_Z_MOVE && IsViableZMove(battlerAtk, move))
            gBattleStruct->zmove.baseMoves[battlerAtk] = move;

        toggledGimmick = TRUE;
        SetActiveGimmick(battlerAtk, gBattleStruct->gimmick.usableGimmick[battlerAtk]);
    }

    SetDynamicMoveCategory(battlerAtk, battlerDef, move);
    SetTypeBeforeUsingMove(move, battlerAtk);
    moveType = GetBattleMoveType(move);
    effectivenessMultiplier = CalcTypeEffectivenessMultiplier(move, moveType, battlerAtk, battlerDef, aiData->abilities[battlerDef], FALSE);

    u32 movePower = GetMovePower(move);
    if (movePower)
        isDamageMoveUnusable = IsDamageMoveUnusable(battlerAtk, battlerDef, move, moveType);

    if (movePower && !isDamageMoveUnusable)
    {
        u32 types[3];
        AI_StoreBattlerTypes(battlerAtk, types);

        ProteanTryChangeType(battlerAtk, aiData->abilities[battlerAtk], move, moveType);
        s32 fixedBasePower = SetFixedMoveBasePower(battlerAtk, move);

        struct DamageCalculationData damageCalcData;
        damageCalcData.battlerAtk = battlerAtk;
        damageCalcData.battlerDef = battlerDef;
        damageCalcData.move = move;
        damageCalcData.moveType = moveType;
        damageCalcData.isCrit = ShouldCalcCritDamage(battlerAtk, battlerDef, move, aiData);
        damageCalcData.randomFactor = FALSE;
        damageCalcData.updateFlags = FALSE;

        if (moveEffect == EFFECT_TRIPLE_KICK)
        {
            for (gMultiHitCounter = GetMoveStrikeCount(move); gMultiHitCounter > 0; gMultiHitCounter--) // The global is used to simulate actual damage done
            {
                s32 damageByRollType = 0;

                s32 oneTripleKickHit = CalculateMoveDamageVars(&damageCalcData, fixedBasePower,
                                                               effectivenessMultiplier, weather,
                                                               aiData->holdEffects[battlerAtk], aiData->holdEffects[battlerDef],
                                                               aiData->abilities[battlerAtk], aiData->abilities[battlerDef]);

                damageByRollType = GetDamageByRollType(oneTripleKickHit, DMG_ROLL_LOWEST);
                simDamage.minimum += ApplyModifiersAfterDmgRoll(damageByRollType, &damageCalcData, effectivenessMultiplier,
                                                                aiData->holdEffects[battlerAtk], aiData->holdEffects[battlerDef],
                                                                aiData->abilities[battlerAtk], aiData->abilities[battlerDef]);

                damageByRollType = GetDamageByRollType(oneTripleKickHit, DMG_ROLL_DEFAULT);
                simDamage.median += ApplyModifiersAfterDmgRoll(damageByRollType, &damageCalcData, effectivenessMultiplier,
                                                               aiData->holdEffects[battlerAtk], aiData->holdEffects[battlerDef],
                                                               aiData->abilities[battlerAtk], aiData->abilities[battlerDef]);

                damageByRollType = GetDamageByRollType(oneTripleKickHit, DMG_ROLL_HIGHEST);
                simDamage.maximum += ApplyModifiersAfterDmgRoll(damageByRollType, &damageCalcData, effectivenessMultiplier,
                                                                aiData->holdEffects[battlerAtk], aiData->holdEffects[battlerDef],
                                                                aiData->abilities[battlerAtk], aiData->abilities[battlerDef]);
            }
        }
        else
        {
            u32 damage = CalculateMoveDamageVars(&damageCalcData, fixedBasePower,
                                                 effectivenessMultiplier, weather,
                                                 aiData->holdEffects[battlerAtk], aiData->holdEffects[battlerDef],
                                                 aiData->abilities[battlerAtk], aiData->abilities[battlerDef]);

            simDamage.minimum = GetDamageByRollType(damage, DMG_ROLL_LOWEST);
            simDamage.minimum = ApplyModifiersAfterDmgRoll(simDamage.minimum, &damageCalcData, effectivenessMultiplier,
                                                           aiData->holdEffects[battlerAtk], aiData->holdEffects[battlerDef],
                                                           aiData->abilities[battlerAtk], aiData->abilities[battlerDef]);

            simDamage.median = GetDamageByRollType(damage, DMG_ROLL_DEFAULT);
            simDamage.median = ApplyModifiersAfterDmgRoll(simDamage.median, &damageCalcData, effectivenessMultiplier,
                                                          aiData->holdEffects[battlerAtk], aiData->holdEffects[battlerDef],
                                                          aiData->abilities[battlerAtk], aiData->abilities[battlerDef]);

            simDamage.maximum = GetDamageByRollType(damage, DMG_ROLL_HIGHEST);
            simDamage.maximum = ApplyModifiersAfterDmgRoll(simDamage.maximum, &damageCalcData, effectivenessMultiplier,
                                                           aiData->holdEffects[battlerAtk], aiData->holdEffects[battlerDef],
                                                           aiData->abilities[battlerAtk], aiData->abilities[battlerDef]);
        }

        if (GetActiveGimmick(battlerAtk) != GIMMICK_Z_MOVE)
        {
            CalcDynamicMoveDamage(&damageCalcData,
                                  &simDamage.median,
                                  &simDamage.minimum,
                                  &simDamage.maximum,
                                  aiData->holdEffects[battlerAtk],
                                  aiData->abilities[battlerAtk]);
        }

        AI_RestoreBattlerTypes(battlerAtk, types);
    }
    else
    {
        simDamage.minimum = 0;
        simDamage.median = 0;
        simDamage.maximum = 0;
    }

    // convert multiper to AI_EFFECTIVENESS_xX
    *typeEffectiveness = effectivenessMultiplier;

    // Undo temporary settings
    gBattleStruct->dynamicMoveType = 0;
    gBattleStruct->swapDamageCategory = FALSE;
    gBattleStruct->zmove.baseMoves[battlerAtk] = MOVE_NONE;
    if (toggledGimmick)
        SetActiveGimmick(battlerAtk, GIMMICK_NONE);
    AI_DATA->aiCalcInProgress = FALSE;
    return simDamage;
}

bool32 AI_IsDamagedByRecoil(u32 battler)
{
    u32 ability = AI_DATA->abilities[battler];
    if (ability == ABILITY_MAGIC_GUARD || ability == ABILITY_ROCK_HEAD)
        return FALSE;
    return TRUE;
}

// Decide whether move having an additional effect for .
static bool32 AI_IsMoveEffectInPlus(u32 battlerAtk, u32 battlerDef, u32 move, s32 noOfHitsToKo)
{
    u32 i;
    u32 abilityDef = AI_DATA->abilities[battlerDef];
    u32 abilityAtk = AI_DATA->abilities[battlerAtk];

    switch (GetMoveEffect(move))
    {
    case EFFECT_HIT_ESCAPE:
        if (CountUsablePartyMons(battlerAtk) != 0 && ShouldPivot(battlerAtk, battlerDef, abilityDef, move, AI_THINKING_STRUCT->movesetIndex))
            return TRUE;
        break;
    case EFFECT_FELL_STINGER:
        if (BattlerStatCanRise(battlerAtk, abilityAtk, STAT_ATK) && noOfHitsToKo == 1)
            return TRUE;
        break;
    case EFFECT_PURSUIT:
        if(noOfHitsToKo == 1)
            return TRUE;
        break;
    default:
        break;
    }

    // check ADDITIONAL_EFFECTS
    u32 additionalEffectCount = GetMoveAdditionalEffectCount(move);
    for (i = 0; i < additionalEffectCount; i++)
    {
        const struct AdditionalEffect *additionalEffect = GetMoveAdditionalEffectById(move, i);
        // Consider move effects that target self
        if (additionalEffect->self)
        {
            switch (additionalEffect->moveEffect)
            {
                case MOVE_EFFECT_ATK_PLUS_1:
                case MOVE_EFFECT_ATK_PLUS_2:
                    if (BattlerStatCanRise(battlerAtk, abilityAtk, STAT_ATK))
                        return TRUE;
                    break;
                case MOVE_EFFECT_DEF_PLUS_1:
                case MOVE_EFFECT_DEF_PLUS_2:
                    if (BattlerStatCanRise(battlerAtk, abilityAtk, STAT_DEF))
                        return TRUE;
                    break;
                case MOVE_EFFECT_SPD_PLUS_1:
                case MOVE_EFFECT_SPD_PLUS_2:
                    if (BattlerStatCanRise(battlerAtk, abilityAtk, STAT_SPEED))
                        return TRUE;
                    break;
                case MOVE_EFFECT_SP_ATK_PLUS_1:
                case MOVE_EFFECT_SP_ATK_PLUS_2:
                    if (BattlerStatCanRise(battlerAtk, abilityAtk, STAT_SPATK))
                        return TRUE;
                    break;
                case MOVE_EFFECT_EVS_PLUS_1:
                case MOVE_EFFECT_EVS_PLUS_2:
                    if (BattlerStatCanRise(battlerAtk, abilityAtk, STAT_EVASION))
                        return TRUE;
                    break;
                case MOVE_EFFECT_ACC_PLUS_1:
                case MOVE_EFFECT_ACC_PLUS_2:
                    if (BattlerStatCanRise(battlerAtk, abilityAtk, STAT_ACC))
                        return TRUE;
                    break;
                case MOVE_EFFECT_ALL_STATS_UP:
                    for (i = STAT_ATK; i <= NUM_STATS; i++)
                    {
                        if (BattlerStatCanRise(battlerAtk, abilityAtk, i))
                            return TRUE;
                    }
                    break;
            }
        }
        else // consider move effects that hinder the target
        {
            switch (additionalEffect->moveEffect)
            {
                case MOVE_EFFECT_POISON:
                case MOVE_EFFECT_TOXIC:
                    if (AI_CanPoison(battlerAtk, battlerDef, abilityDef, move, MOVE_NONE))
                        return TRUE;
                    break;
                case MOVE_EFFECT_BURN:
                    if (AI_CanBurn(battlerAtk, battlerDef, abilityDef, BATTLE_PARTNER(battlerAtk), move, MOVE_NONE))
                        return TRUE;
                    break;
                case MOVE_EFFECT_FREEZE_OR_FROSTBITE:
                    if (AI_CanGetFrostbite(battlerDef, abilityDef))
                        return TRUE;
                    break;
                case MOVE_EFFECT_PARALYSIS:
                    if (AI_CanParalyze(battlerAtk, battlerDef, abilityDef, move, MOVE_NONE))
                        return TRUE;
                    break;
                case MOVE_EFFECT_CONFUSION:
                    if (AI_CanConfuse(battlerAtk, battlerDef, abilityDef, BATTLE_PARTNER(battlerAtk), move, MOVE_NONE))
                        return TRUE;
                    break;
                case MOVE_EFFECT_FLINCH:
                    if (ShouldTryToFlinch(battlerAtk, battlerDef, abilityAtk, abilityDef, move))
                        return TRUE;
                    break;
                case MOVE_EFFECT_ATK_MINUS_1:
                case MOVE_EFFECT_DEF_MINUS_1:
                case MOVE_EFFECT_SPD_MINUS_1:
                case MOVE_EFFECT_SP_ATK_MINUS_1:
                case MOVE_EFFECT_SP_DEF_MINUS_1:
                case MOVE_EFFECT_ACC_MINUS_1:
                case MOVE_EFFECT_EVS_MINUS_1:
                    if (ShouldLowerStat(battlerAtk, battlerDef, abilityDef, STAT_ATK + (additionalEffect->moveEffect - MOVE_EFFECT_ATK_MINUS_1)) && noOfHitsToKo != 1)
                        return TRUE;
                    break;
                case MOVE_EFFECT_ATK_MINUS_2:
                case MOVE_EFFECT_DEF_MINUS_2:
                case MOVE_EFFECT_SPD_MINUS_2:
                case MOVE_EFFECT_SP_ATK_MINUS_2:
                case MOVE_EFFECT_SP_DEF_MINUS_2:
                case MOVE_EFFECT_ACC_MINUS_2:
                case MOVE_EFFECT_EVS_MINUS_2:
                    if (ShouldLowerStat(battlerAtk, battlerDef, abilityDef, STAT_ATK + (additionalEffect->moveEffect - MOVE_EFFECT_ATK_MINUS_2)) && noOfHitsToKo != 1)
                        return TRUE;
                    break;
            }
        }
    }

    return FALSE;
}

static bool32 AI_IsMoveEffectInMinus(u32 battlerAtk, u32 battlerDef, u32 move, s32 noOfHitsToKo)
{
    u32 abilityAtk = AI_DATA->abilities[battlerAtk];
    u32 abilityDef = AI_DATA->abilities[battlerDef];
    u8 i;

    switch (GetMoveEffect(move))
    {
    case EFFECT_MAX_HP_50_RECOIL:
    case EFFECT_MIND_BLOWN:
    case EFFECT_EXPLOSION:
    case EFFECT_FINAL_GAMBIT:
        return TRUE;
    case EFFECT_RECOIL_IF_MISS:
        if (AI_IsDamagedByRecoil(battlerAtk))
            return TRUE;
    case EFFECT_RECOIL:
        if (AI_IsDamagedByRecoil(battlerAtk))
            return TRUE;
        break;
    default:
    {
        u32 additionalEffectCount = GetMoveAdditionalEffectCount(move);
        for (i = 0; i < additionalEffectCount; i++)
        {
            const struct AdditionalEffect *additionalEffect = GetMoveAdditionalEffectById(move, i);
            switch (additionalEffect->moveEffect)
            {
                case MOVE_EFFECT_ATK_MINUS_1:
                case MOVE_EFFECT_DEF_MINUS_1:
                case MOVE_EFFECT_SPD_MINUS_1:
                case MOVE_EFFECT_SP_ATK_MINUS_1:
                case MOVE_EFFECT_SP_DEF_MINUS_1:
                case MOVE_EFFECT_EVS_MINUS_1:
                case MOVE_EFFECT_ACC_MINUS_1:
                case MOVE_EFFECT_ATK_MINUS_2:
                case MOVE_EFFECT_DEF_MINUS_2:
                case MOVE_EFFECT_SPD_MINUS_2:
                case MOVE_EFFECT_SP_ATK_MINUS_2:
                case MOVE_EFFECT_SP_DEF_MINUS_2:
                case MOVE_EFFECT_EVS_MINUS_2:
                case MOVE_EFFECT_ACC_MINUS_2:
                case MOVE_EFFECT_V_CREATE:
                case MOVE_EFFECT_ATK_DEF_DOWN:
                case MOVE_EFFECT_DEF_SPDEF_DOWN:
                    if ((additionalEffect->self && abilityAtk != ABILITY_CONTRARY)
                        || (noOfHitsToKo != 1 && abilityDef == ABILITY_CONTRARY && !DoesBattlerIgnoreAbilityChecks(battlerAtk, abilityAtk, move)))
                        return TRUE;
                    break;
                case MOVE_EFFECT_RECHARGE:
                    return additionalEffect->self;
                case MOVE_EFFECT_ATK_PLUS_1:
                case MOVE_EFFECT_DEF_PLUS_1:
                case MOVE_EFFECT_SPD_PLUS_1:
                case MOVE_EFFECT_SP_ATK_PLUS_1:
                case MOVE_EFFECT_SP_DEF_PLUS_1:
                case MOVE_EFFECT_EVS_PLUS_1:
                case MOVE_EFFECT_ACC_PLUS_1:
                case MOVE_EFFECT_ATK_PLUS_2:
                case MOVE_EFFECT_DEF_PLUS_2:
                case MOVE_EFFECT_SPD_PLUS_2:
                case MOVE_EFFECT_SP_ATK_PLUS_2:
                case MOVE_EFFECT_SP_DEF_PLUS_2:
                case MOVE_EFFECT_EVS_PLUS_2:
                case MOVE_EFFECT_ACC_PLUS_2:
                case MOVE_EFFECT_ALL_STATS_UP:
                    if ((additionalEffect->self && abilityAtk == ABILITY_CONTRARY)
                        || (noOfHitsToKo != 1 && !(abilityDef == ABILITY_CONTRARY && !DoesBattlerIgnoreAbilityChecks(battlerAtk, abilityAtk, move))))
                        return TRUE;
                    break;
            }
        }
        break;
    }
    }
    return FALSE;
}

// Checks if one of the moves has side effects or perks, assuming equal dmg or equal no of hits to KO
s32 AI_WhichMoveBetter(u32 move1, u32 move2, u32 battlerAtk, u32 battlerDef, s32 noOfHitsToKo)
{
    bool32 effect1, effect2;
    u32 defAbility = AI_DATA->abilities[battlerDef];
    u32 atkAbility = AI_DATA->abilities[battlerAtk];

    // Check if physical moves hurt.
    if (AI_DATA->holdEffects[battlerAtk] != HOLD_EFFECT_PROTECTIVE_PADS && atkAbility != ABILITY_LONG_REACH
        && (AI_DATA->holdEffects[battlerDef] == HOLD_EFFECT_ROCKY_HELMET
        || defAbility == ABILITY_IRON_BARBS || defAbility == ABILITY_ROUGH_SKIN))
    {
        bool32 moveContact1 = MoveMakesContact(move1);
        bool32 moveContact2 = MoveMakesContact(move2);
        if (moveContact1 && !moveContact2)
            return -1;
        if (moveContact2 && !moveContact1)
            return 1;
    }

    // Check additional effects.
    effect1 = AI_IsMoveEffectInMinus(battlerAtk, battlerDef, move1, noOfHitsToKo);
    effect2 = AI_IsMoveEffectInMinus(battlerAtk, battlerDef, move2, noOfHitsToKo);
    if (effect2 && !effect1)
        return 1;
    if (effect1 && !effect2)
        return -1;

    effect1 = AI_IsMoveEffectInPlus(battlerAtk, battlerDef, move1, noOfHitsToKo);
    effect2 = AI_IsMoveEffectInPlus(battlerAtk, battlerDef, move2, noOfHitsToKo);
    if (effect2 && !effect1)
        return -1;
    if (effect1 && !effect2)
        return 1;

    return 0;
}

u32 GetNoOfHitsToKO(u32 dmg, s32 hp)
{
    if (dmg == 0)
        return 0;
    return hp / (dmg + 1) + 1;
}

u32 GetNoOfHitsToKOBattlerDmg(u32 dmg, u32 battlerDef)
{
    return GetNoOfHitsToKO(dmg, gBattleMons[battlerDef].hp);
}

u32 GetNoOfHitsToKOBattler(u32 battlerAtk, u32 battlerDef, u32 moveIndex, enum DamageCalcContext calcContext)
{
    return GetNoOfHitsToKOBattlerDmg(AI_GetDamage(battlerAtk, battlerDef, moveIndex, calcContext, AI_DATA), battlerDef);
}

u32 GetCurrDamageHpPercent(u32 battlerAtk, u32 battlerDef, enum DamageCalcContext calcContext)
{
    int bestDmg = AI_GetDamage(battlerAtk, battlerDef, AI_THINKING_STRUCT->movesetIndex, calcContext, AI_DATA);

    return (bestDmg * 100) / gBattleMons[battlerDef].maxHP;
}

uq4_12_t AI_GetMoveEffectiveness(u32 move, u32 battlerAtk, u32 battlerDef)
{
    uq4_12_t typeEffectiveness;
    u32 moveType;

    SaveBattlerData(battlerAtk);
    SaveBattlerData(battlerDef);

    SetBattlerData(battlerAtk);
    SetBattlerData(battlerDef);

    gBattleStruct->dynamicMoveType = 0;
    SetTypeBeforeUsingMove(move, battlerAtk);
    moveType = GetBattleMoveType(move);
    typeEffectiveness = CalcTypeEffectivenessMultiplier(move, moveType, battlerAtk, battlerDef, AI_DATA->abilities[battlerDef], FALSE);

    RestoreBattlerData(battlerAtk);
    RestoreBattlerData(battlerDef);

    return typeEffectiveness;
}

/* Checks to see if AI will move ahead of another battler
 * The function uses a stripped down version of the checks from GetWhichBattlerFasterArgs
 * Output:
    * AI_IS_FASTER: is user(ai) faster
    * AI_IS_SLOWER: is target faster
*/
s32 AI_WhoStrikesFirst(u32 battlerAI, u32 battler, u32 moveConsidered)
{
    u32 speedBattlerAI, speedBattler;
    enum ItemHoldEffect holdEffectAI = AI_DATA->holdEffects[battlerAI];
    enum ItemHoldEffect holdEffectPlayer = AI_DATA->holdEffects[battler];
    u32 abilityAI = AI_DATA->abilities[battlerAI];
    u32 abilityPlayer = AI_DATA->abilities[battler];

    u32 predictedMove = AI_DATA->lastUsedMove[battler]; // TODO update for move prediction

    s8 aiPriority = GetBattleMovePriority(battlerAI, abilityAI, moveConsidered);
    s8 playerPriority = GetBattleMovePriority(battler, abilityPlayer, predictedMove);

    if (aiPriority > playerPriority)
        return AI_IS_FASTER;
    else if (aiPriority < playerPriority)
        return AI_IS_SLOWER;

    speedBattlerAI = GetBattlerTotalSpeedStatArgs(battlerAI, abilityAI, holdEffectAI);
    speedBattler   = GetBattlerTotalSpeedStatArgs(battler, abilityPlayer, holdEffectPlayer);

    if (holdEffectAI == HOLD_EFFECT_LAGGING_TAIL && holdEffectPlayer != HOLD_EFFECT_LAGGING_TAIL)
        return AI_IS_SLOWER;
    else if (holdEffectAI != HOLD_EFFECT_LAGGING_TAIL && holdEffectPlayer == HOLD_EFFECT_LAGGING_TAIL)
        return AI_IS_FASTER;

    if (abilityAI == ABILITY_STALL && abilityPlayer != ABILITY_STALL)
        return AI_IS_SLOWER;
    else if (abilityAI != ABILITY_STALL && abilityPlayer == ABILITY_STALL)
        return AI_IS_FASTER;

    if (speedBattlerAI > speedBattler)
    {
        if (gFieldStatuses & STATUS_FIELD_TRICK_ROOM)
            return AI_IS_SLOWER;
        else
            return AI_IS_FASTER;
    }
    else if (speedBattlerAI == speedBattler)
    {
        return AI_IS_FASTER;
    }
    else
    {
        if (gFieldStatuses & STATUS_FIELD_TRICK_ROOM)
            return AI_IS_FASTER;
        else
            return AI_IS_SLOWER;
    }

    return AI_IS_SLOWER;
}

static bool32 CanEndureHit(u32 battler, u32 battlerTarget, u32 move)
{
    enum BattleMoveEffects effect = GetMoveEffect(move);
    if (!AI_BattlerAtMaxHp(battlerTarget) || effect == EFFECT_MULTI_HIT)
        return FALSE;
    if (GetMoveStrikeCount(move) > 1 && !(effect == EFFECT_DRAGON_DARTS && IsValidDoubleBattle(battlerTarget)))
        return FALSE;
    if (AI_DATA->holdEffects[battlerTarget] == HOLD_EFFECT_FOCUS_SASH)
        return TRUE;

    if (!DoesBattlerIgnoreAbilityChecks(battler, AI_DATA->abilities[battler], move))
    {
        if (B_STURDY >= GEN_5 && AI_DATA->abilities[battlerTarget] == ABILITY_STURDY)
            return TRUE;
        if (gBattleMons[battlerTarget].species == SPECIES_MIMIKYU_DISGUISED)
            return TRUE;
    }

    return FALSE;
}

// Check if target has means to faint ai mon.
bool32 CanTargetFaintAi(u32 battlerDef, u32 battlerAtk)
{
    struct AiLogicData *aiData = AI_DATA;
    s32 moveIndex;
    u16 *moves = GetMovesArray(battlerDef);
    u32 moveLimitations = aiData->moveLimitations[battlerDef];

    for (moveIndex = 0; moveIndex < MAX_MON_MOVES; moveIndex++)
    {
        if (IsMoveUnusable(moveIndex, moves[moveIndex], moveLimitations))
            continue;

        if (AI_GetDamage(battlerDef, battlerAtk, moveIndex, AI_DEFENDING, aiData) >= gBattleMons[battlerAtk].hp
            && !CanEndureHit(battlerDef, battlerAtk, moves[moveIndex]))
            return TRUE;
    }

    return FALSE;
}

u32 NoOfHitsForTargetToFaintAI(u32 battlerDef, u32 battlerAtk)
{
    u32 i;
    u32 currNumberOfHits;
    u32 leastNumberOfHits = UNKNOWN_NO_OF_HITS;

    for (i = 0; i < MAX_MON_MOVES; i++)
    {
        currNumberOfHits = GetNoOfHitsToKOBattler(battlerDef, battlerAtk, i, AI_DEFENDING);
        if (currNumberOfHits != 0)
        {
            if (currNumberOfHits < leastNumberOfHits)
                leastNumberOfHits = currNumberOfHits;
        }
    }
    return leastNumberOfHits;
}

u32 GetBestDmgMoveFromBattler(u32 battlerAtk, u32 battlerDef, enum DamageCalcContext calcContext)
{
    struct AiLogicData *aiData = AI_DATA;
    u32 moveIndex;
    u32 move = 0;
    u32 bestDmg = 0;
    u16 *moves = GetMovesArray(battlerAtk);
    u32 moveLimitations = aiData->moveLimitations[battlerAtk];

    for (moveIndex = 0; moveIndex < MAX_MON_MOVES; moveIndex++)
    {
        if (IsMoveUnusable(moveIndex, moves[moveIndex], moveLimitations))
            continue;

        if (bestDmg < AI_GetDamage(battlerAtk, battlerDef, moveIndex, calcContext, aiData))
        {
            bestDmg = AI_GetDamage(battlerAtk, battlerDef, moveIndex, calcContext, aiData);
            move = moves[moveIndex];
        }
    }
    return move;
}

u32 GetBestDmgFromBattler(u32 battler, u32 battlerTarget, enum DamageCalcContext calcContext)
{
    struct AiLogicData *aiData = AI_DATA;
    u32 moveIndex;
    u32 bestDmg = 0;
    u16 *moves = GetMovesArray(battler);
    u32 moveLimitations = aiData->moveLimitations[battler];

    for (moveIndex = 0; moveIndex < MAX_MON_MOVES; moveIndex++)
    {
        if (IsMoveUnusable(moveIndex, moves[moveIndex], moveLimitations))
            continue;

        u32 damage = AI_GetDamage(battler, battlerTarget, moveIndex, calcContext, aiData);
        if (bestDmg < damage)
            bestDmg = damage;
    }

    return bestDmg;
}

// Check if AI mon has the means to faint the target with any of its moves.
// If numHits > 1, check if the target will be KO'ed by that number of hits (ignoring healing effects)
bool32 CanAIFaintTarget(u32 battlerAtk, u32 battlerDef, u32 numHits)
{
    struct AiLogicData *aiData = AI_DATA;
    s32 moveIndex, dmg;
    u16 *moves = gBattleMons[battlerAtk].moves;
    u32 moveLimitations = aiData->moveLimitations[battlerAtk];

    for (moveIndex = 0; moveIndex < MAX_MON_MOVES; moveIndex++)
    {
        if (IsMoveUnusable(moveIndex, moves[moveIndex], moveLimitations))
            continue;

        dmg = AI_GetDamage(battlerAtk, battlerDef, moveIndex, AI_ATTACKING, aiData);

        if (numHits)
            dmg *= numHits;

        if (gBattleMons[battlerDef].hp <= dmg)
        {
            if (numHits > 1)
                return TRUE;

            if (!CanEndureHit(battlerAtk, battlerDef, moves[moveIndex]))
                return TRUE;
        }
    }

    return FALSE;
}

bool32 CanTargetMoveFaintAi(u32 move, u32 battlerDef, u32 battlerAtk, u32 nHits)
{
    u32 indexSlot = GetMoveSlot(GetMovesArray(battlerDef), move);
    if (indexSlot < MAX_MON_MOVES)
    {
        if (GetNoOfHitsToKO(AI_GetDamage(battlerDef, battlerAtk, indexSlot, AI_DEFENDING, AI_DATA), gBattleMons[battlerAtk].hp) <= nHits)
            return TRUE;
    }
    return FALSE;
}

// Check if target has means to faint ai mon after modding hp/dmg
bool32 CanTargetFaintAiWithMod(u32 battlerDef, u32 battlerAtk, s32 hpMod, s32 dmgMod)
{
    struct AiLogicData *aiData = AI_DATA;
    u32 moveIndex;
    s32 dmg;
    u16 *moves = GetMovesArray(battlerDef);
    u32 hpCheck = gBattleMons[battlerAtk].hp + hpMod;
    u32 moveLimitations = aiData->moveLimitations[battlerAtk];

    if (hpCheck > gBattleMons[battlerAtk].maxHP)
        hpCheck = gBattleMons[battlerAtk].maxHP;

    for (moveIndex = 0; moveIndex < MAX_MON_MOVES; moveIndex++)
    {
        if (IsMoveUnusable(moveIndex, moves[moveIndex], moveLimitations))
            continue;

        dmg = AI_GetDamage(battlerDef, battlerAtk, moveIndex, AI_DEFENDING, aiData);

        if (dmgMod)
            dmg *= dmgMod;

        if (dmg >= hpCheck)
            return TRUE;
    }

    return FALSE;
}

bool32 AI_IsAbilityOnSide(u32 battlerId, u32 ability)
{
    if (IsBattlerAlive(battlerId) && AI_DATA->abilities[battlerId] == ability)
        return TRUE;
    else if (IsBattlerAlive(BATTLE_PARTNER(battlerId)) && AI_DATA->abilities[BATTLE_PARTNER(battlerId)] == ability)
        return TRUE;
    else
        return FALSE;
}

u32 AI_GetBattlerAbility(u32 battler)
{
    if (gAbilitiesInfo[gBattleMons[battler].ability].cantBeSuppressed)
        return gBattleMons[battler].ability;

    if (gStatuses3[battler] & STATUS3_GASTRO_ACID)
        return ABILITY_NONE;

    if (IsNeutralizingGasOnField()
     && gBattleMons[battler].ability != ABILITY_NEUTRALIZING_GAS
     && GetBattlerHoldEffectIgnoreAbility(battler, TRUE) != HOLD_EFFECT_ABILITY_SHIELD)
        return ABILITY_NONE;

    return gBattleMons[battler].ability;
}

// does NOT include ability suppression checks
s32 AI_DecideKnownAbilityForTurn(u32 battlerId)
{
    u32 validAbilities[NUM_ABILITY_SLOTS];
    u8 i, numValidAbilities = 0;
    u32 knownAbility = AI_GetBattlerAbility(battlerId);
    u32 indexAbility;
    u32 abilityAiRatings[NUM_ABILITY_SLOTS] = {0};

    // We've had ability overwritten by e.g. Worry Seed. It is not part of AI_PARTY in case of switching
    if (gDisableStructs[battlerId].overwrittenAbility)
        return gDisableStructs[battlerId].overwrittenAbility;

    // The AI knows its own ability.
    if (IsAiBattlerAware(battlerId))
        return knownAbility;

    // Check neutralizing gas, gastro acid
    if (knownAbility == ABILITY_NONE)
        return knownAbility;

    if (AI_PARTY->mons[GetBattlerSide(battlerId)][gBattlerPartyIndexes[battlerId]].ability != ABILITY_NONE)
        return AI_PARTY->mons[GetBattlerSide(battlerId)][gBattlerPartyIndexes[battlerId]].ability;

    // Abilities that prevent fleeing - treat as always known
    if (knownAbility == ABILITY_SHADOW_TAG || knownAbility == ABILITY_MAGNET_PULL || knownAbility == ABILITY_ARENA_TRAP)
        return knownAbility;

    for (i = 0; i < NUM_ABILITY_SLOTS; i++)
    {
        indexAbility = gSpeciesInfo[gBattleMons[battlerId].species].abilities[i];
        if (indexAbility != ABILITY_NONE)
        {
            abilityAiRatings[numValidAbilities] = gAbilitiesInfo[indexAbility].aiRating;
            validAbilities[numValidAbilities++] = indexAbility;
        }
    }

    if (numValidAbilities > 0 && IsAiBattlerPredictingAbility(battlerId))
        return validAbilities[RandomWeighted(RNG_AI_PREDICT_ABILITY, abilityAiRatings[0], abilityAiRatings[1], abilityAiRatings[2])];

    if (numValidAbilities > 0)
        return validAbilities[RandomUniform(RNG_AI_ABILITY, 0, numValidAbilities - 1)];

    return ABILITY_NONE; // Unknown.
}

enum ItemHoldEffect AI_DecideHoldEffectForTurn(u32 battlerId)
{
    enum ItemHoldEffect holdEffect;

    if (!IsAiBattlerAware(battlerId))
        holdEffect = AI_PARTY->mons[GetBattlerSide(battlerId)][gBattlerPartyIndexes[battlerId]].heldEffect;
    else
        holdEffect = GetBattlerHoldEffect(battlerId, FALSE);

    if (AI_THINKING_STRUCT->aiFlags[battlerId] & AI_FLAG_NEGATE_UNAWARE)
        return holdEffect;

    if (gStatuses3[battlerId] & STATUS3_EMBARGO)
        return HOLD_EFFECT_NONE;
    if (gFieldStatuses & STATUS_FIELD_MAGIC_ROOM)
        return HOLD_EFFECT_NONE;
    if (AI_DATA->abilities[battlerId] == ABILITY_KLUTZ && !(gStatuses3[battlerId] & STATUS3_GASTRO_ACID))
        return HOLD_EFFECT_NONE;

    return holdEffect;
}

bool32 DoesBattlerIgnoreAbilityChecks(u32 battlerAtk, u32 atkAbility, u32 move)
{
    if (AI_THINKING_STRUCT->aiFlags[battlerAtk] & AI_FLAG_NEGATE_UNAWARE)
        return FALSE;   // AI handicap flag: doesn't understand ability suppression concept

    if (IsMoldBreakerTypeAbility(battlerAtk, atkAbility) || MoveIgnoresTargetAbility(move))
        return TRUE;

    return FALSE;
}

static inline bool32 AI_WeatherHasEffect(void)
{
    if (AI_THINKING_STRUCT->aiFlags[B_POSITION_OPPONENT_LEFT] & AI_FLAG_NEGATE_UNAWARE
     || AI_THINKING_STRUCT->aiFlags[B_POSITION_OPPONENT_RIGHT] & AI_FLAG_NEGATE_UNAWARE)
        return TRUE;   // AI doesn't understand weather supression (handicap)

    return AI_DATA->weatherHasEffect;  // weather damping abilities are announced
}

u32 AI_GetWeather(void)
{
    if (gBattleWeather == B_WEATHER_NONE)
        return B_WEATHER_NONE;
    if (!AI_WeatherHasEffect())
        return B_WEATHER_NONE;
    return gBattleWeather;
}

bool32 IsAromaVeilProtectedEffect(enum BattleMoveEffects moveEffect)
{
    switch (moveEffect)
    {
    case EFFECT_DISABLE:
    case EFFECT_ATTRACT:
    case EFFECT_ENCORE:
    case EFFECT_TORMENT:
    case EFFECT_TAUNT:
    case EFFECT_HEAL_BLOCK:
        return TRUE;
    default:
        return FALSE;
    }
}

bool32 IsNonVolatileStatusMoveEffect(enum BattleMoveEffects moveEffect)
{
    switch (moveEffect)
    {
    case EFFECT_SLEEP:
    case EFFECT_TOXIC:
    case EFFECT_POISON:
    case EFFECT_PARALYZE:
    case EFFECT_WILL_O_WISP:
    case EFFECT_YAWN:
        return TRUE;
    default:
        return FALSE;
    }
}

bool32 IsConfusionMoveEffect(enum BattleMoveEffects moveEffect)
{
    switch (moveEffect)
    {
    case EFFECT_CONFUSE:
    case EFFECT_SWAGGER:
    case EFFECT_FLATTER:
        return TRUE;
    default:
        return FALSE;
    }
}

bool32 IsHazardMove(u32 move)
{
    // Hazard setting moves like Stealth Rock, Spikes, etc.
    u32 i, moveEffect = GetMoveEffect(move);
    switch (moveEffect)
    {
    case EFFECT_SPIKES:
    case EFFECT_TOXIC_SPIKES:
    case EFFECT_STICKY_WEB:
    case EFFECT_STEALTH_ROCK:
        return TRUE;
    }

    u32 additionalEffectCount = GetMoveAdditionalEffectCount(move);
    for (i = 0; i < additionalEffectCount; i++)
    {
        const struct AdditionalEffect *additionalEffect = GetMoveAdditionalEffectById(move, i);
        switch (additionalEffect->moveEffect)
        {
        case MOVE_EFFECT_STEELSURGE:
            return TRUE;
        }
    }
    return FALSE;
}

bool32 IsHazardClearingMove(u32 move)
{
    // Hazard clearing effects like Rapid Spin, Tidy Up, etc.
    u32 i, moveEffect = GetMoveEffect(move);
    switch (moveEffect)
    {
    case EFFECT_RAPID_SPIN:
    case EFFECT_TIDY_UP:
        return TRUE;
    case EFFECT_DEFOG:
        if (B_DEFOG_EFFECT_CLEARING >= GEN_6)
            return TRUE;
        break;
    }

    u32 additionalEffectCount = GetMoveAdditionalEffectCount(move);
    for (i = 0; i < additionalEffectCount; i++)
    {
        const struct AdditionalEffect *additionalEffect = GetMoveAdditionalEffectById(move, i);
        switch (additionalEffect->moveEffect)
        {
        case MOVE_EFFECT_DEFOG:
            return TRUE;
        }
    }

    return FALSE;
}

bool32 IsMoveRedirectionPrevented(u32 battlerAtk, u32 move, u32 atkAbility)
{
    if (AI_THINKING_STRUCT->aiFlags[battlerAtk] & AI_FLAG_NEGATE_UNAWARE)
        return FALSE;

    enum BattleMoveEffects effect = GetMoveEffect(move);
    if (effect == EFFECT_SKY_DROP
      || effect == EFFECT_SNIPE_SHOT
      || atkAbility == ABILITY_PROPELLER_TAIL
      || atkAbility == ABILITY_STALWART)
        return TRUE;
    return FALSE;
}

bool32 IsSemiInvulnerable(u32 battlerDef, u32 move)
{
    if (gStatuses3[battlerDef] & STATUS3_PHANTOM_FORCE)
        return TRUE;
    else if (gBattleStruct->battlerState[battlerDef].commandingDondozo)
        return TRUE;
    else if (!MoveDamagesAirborne(move) && gStatuses3[battlerDef] & STATUS3_ON_AIR)
        return TRUE;
    else if (!MoveDamagesUnderWater(move) && gStatuses3[battlerDef] & STATUS3_UNDERWATER)
        return TRUE;
    else if (!MoveDamagesUnderground(move) && gStatuses3[battlerDef] & STATUS3_UNDERGROUND)
        return TRUE;
    else
        return FALSE;
}

bool32 IsMoveEncouragedToHit(u32 battlerAtk, u32 battlerDef, u32 move)
{
    u32 weather;
    if (IsSemiInvulnerable(battlerDef, move))
        return FALSE;

    //TODO - anticipate protect move?

    // always hits
    if (gStatuses3[battlerDef] & STATUS3_ALWAYS_HITS || gDisableStructs[battlerDef].battlerWithSureHit == battlerAtk)
        return TRUE;

    if (AI_DATA->abilities[battlerDef] == ABILITY_NO_GUARD || AI_DATA->abilities[battlerAtk] == ABILITY_NO_GUARD)
        return TRUE;

    enum BattleMoveEffects effect = GetMoveEffect(move);
    if (B_TOXIC_NEVER_MISS >= GEN_6 && effect == EFFECT_TOXIC && IS_BATTLER_OF_TYPE(battlerAtk, TYPE_POISON))
        return TRUE;

    // discouraged from hitting
    weather = AI_GetWeather();
    if ((weather & B_WEATHER_SUN) && effect == EFFECT_THUNDER)
        return FALSE;

    // increased accuracy but don't always hit
    if ((weather & B_WEATHER_RAIN) && effect == EFFECT_THUNDER)
        return TRUE;
    if ((weather & (B_WEATHER_HAIL | B_WEATHER_SNOW)) && effect == EFFECT_BLIZZARD)
        return TRUE;
    if (B_MINIMIZE_DMG_ACC >= GEN_6 && (gStatuses3[battlerDef] & STATUS3_MINIMIZED) && MoveIncreasesPowerToMinimizedTargets(move))
        return TRUE;
    if (GetMoveAccuracy(move) == 0)
        return TRUE;

    return FALSE;
}

bool32 ShouldTryOHKO(u32 battlerAtk, u32 battlerDef, u32 atkAbility, u32 defAbility, u32 move)
{
    enum ItemHoldEffect holdEffect = AI_DATA->holdEffects[battlerDef];
    u32 accuracy = AI_DATA->moveAccuracy[battlerAtk][battlerDef][AI_THINKING_STRUCT->movesetIndex];

    gPotentialItemEffectBattler = battlerDef;
    if (holdEffect == HOLD_EFFECT_FOCUS_BAND && (Random() % 100) < AI_DATA->holdEffectParams[battlerDef])
        return FALSE;   //probabilistically speaking, focus band should activate so dont OHKO
    else if (holdEffect == HOLD_EFFECT_FOCUS_SASH && AI_BattlerAtMaxHp(battlerDef))
        return FALSE;

    if (!DoesBattlerIgnoreAbilityChecks(battlerAtk, atkAbility, move) && defAbility == ABILITY_STURDY)
        return FALSE;

    if ((((gStatuses3[battlerDef] & STATUS3_ALWAYS_HITS)
        && gDisableStructs[battlerDef].battlerWithSureHit == battlerAtk)
        || atkAbility == ABILITY_NO_GUARD || defAbility == ABILITY_NO_GUARD)
        && gBattleMons[battlerAtk].level >= gBattleMons[battlerDef].level)
    {
        return TRUE;
    }
    else    // test the odds
    {
        u32 odds = accuracy + (gBattleMons[battlerAtk].level - gBattleMons[battlerDef].level);
        if (B_SHEER_COLD_ACC >= GEN_7 && move == MOVE_SHEER_COLD && !IS_BATTLER_OF_TYPE(gBattlerAttacker, TYPE_ICE))
            odds -= 10;
        if (Random() % 100 + 1 < odds && gBattleMons[battlerAtk].level >= gBattleMons[battlerDef].level)
            return TRUE;
    }
    return FALSE;
}

bool32 ShouldSetSandstorm(u32 battler, u32 ability, enum ItemHoldEffect holdEffect)
{
    u32 weather = AI_GetWeather();
    if (weather & B_WEATHER_SANDSTORM)
        return FALSE;

    if (ability == ABILITY_SAND_VEIL
      || ability == ABILITY_SAND_RUSH
      || ability == ABILITY_SAND_FORCE
      || ability == ABILITY_OVERCOAT
      || ability == ABILITY_MAGIC_GUARD
      || holdEffect == HOLD_EFFECT_SAFETY_GOGGLES
      || IS_BATTLER_ANY_TYPE(battler, TYPE_ROCK, TYPE_GROUND, TYPE_STEEL)
      || HasMoveEffect(battler, EFFECT_SHORE_UP)
      || HasMoveEffect(battler, EFFECT_WEATHER_BALL))
    {
        return TRUE;
    }
    return FALSE;
}

bool32 ShouldSetHail(u32 battler, u32 ability, enum ItemHoldEffect holdEffect)
{
    u32 weather = AI_GetWeather();
    if (weather & (B_WEATHER_HAIL | B_WEATHER_SNOW))
        return FALSE;

    if (ability == ABILITY_SNOW_CLOAK
      || ability == ABILITY_ICE_BODY
      || ability == ABILITY_FORECAST
      || ability == ABILITY_SLUSH_RUSH
      || ability == ABILITY_MAGIC_GUARD
      || ability == ABILITY_OVERCOAT
      || holdEffect == HOLD_EFFECT_SAFETY_GOGGLES
      || IS_BATTLER_OF_TYPE(battler, TYPE_ICE)
      || HasMoveEffect(battler, EFFECT_BLIZZARD)
      || HasMoveEffect(battler, EFFECT_AURORA_VEIL)
      || HasMoveEffect(battler, EFFECT_WEATHER_BALL))
    {
        return TRUE;
    }
    return FALSE;
}

bool32 ShouldSetRain(u32 battlerAtk, u32 atkAbility, enum ItemHoldEffect holdEffect)
{
    u32 weather = AI_GetWeather();
    if (weather & B_WEATHER_RAIN)
        return FALSE;

    if (holdEffect != HOLD_EFFECT_UTILITY_UMBRELLA
     && (atkAbility == ABILITY_SWIFT_SWIM
      || atkAbility == ABILITY_FORECAST
      || atkAbility == ABILITY_HYDRATION
      || atkAbility == ABILITY_RAIN_DISH
      || atkAbility == ABILITY_DRY_SKIN
      || HasMoveEffect(battlerAtk, EFFECT_THUNDER)
      || HasMoveEffect(battlerAtk, EFFECT_WEATHER_BALL)
      || HasMoveWithType(battlerAtk, TYPE_WATER)))
    {
        return TRUE;
    }
    return FALSE;
}

bool32 ShouldSetSun(u32 battlerAtk, u32 atkAbility, enum ItemHoldEffect holdEffect)
{
    u32 weather = AI_GetWeather();
    if (weather & B_WEATHER_SUN)
        return FALSE;

    if (holdEffect != HOLD_EFFECT_UTILITY_UMBRELLA
     && (atkAbility == ABILITY_CHLOROPHYLL
      || atkAbility == ABILITY_FLOWER_GIFT
      || atkAbility == ABILITY_FORECAST
      || atkAbility == ABILITY_LEAF_GUARD
      || atkAbility == ABILITY_SOLAR_POWER
      || atkAbility == ABILITY_HARVEST
      || HasMoveEffect(battlerAtk, EFFECT_SOLAR_BEAM)
      || HasMoveEffect(battlerAtk, EFFECT_MORNING_SUN)
      || HasMoveEffect(battlerAtk, EFFECT_SYNTHESIS)
      || HasMoveEffect(battlerAtk, EFFECT_MOONLIGHT)
      || HasMoveEffect(battlerAtk, EFFECT_WEATHER_BALL)
      || HasMoveEffect(battlerAtk, EFFECT_GROWTH)
      || HasMoveWithType(battlerAtk, TYPE_FIRE)))
    {
        return TRUE;
    }
    return FALSE;
}

bool32 ShouldSetSnow(u32 battler, u32 ability, enum ItemHoldEffect holdEffect)
{
    u32 weather = AI_GetWeather();
    if (weather & (B_WEATHER_SNOW | B_WEATHER_HAIL))
        return FALSE;

    if (ability == ABILITY_SNOW_CLOAK
      || ability == ABILITY_ICE_BODY
      || ability == ABILITY_FORECAST
      || ability == ABILITY_SLUSH_RUSH
      || IS_BATTLER_OF_TYPE(battler, TYPE_ICE)
      || HasMoveEffect(battler, EFFECT_BLIZZARD)
      || HasMoveEffect(battler, EFFECT_AURORA_VEIL)
      || HasMoveEffect(battler, EFFECT_WEATHER_BALL))
    {
        return TRUE;
    }
    return FALSE;
}

void ProtectChecks(u32 battlerAtk, u32 battlerDef, u32 move, u32 predictedMove, s32 *score)
{
    // TODO more sophisticated logic
    u32 uses = gDisableStructs[battlerAtk].protectUses;

    /*if (GetMoveResultFlags(predictedMove) & (MOVE_RESULT_NO_EFFECT | MOVE_RESULT_MISSED))
    {
        ADJUST_SCORE_PTR(-5);
        return;
    }*/

    if (uses == 0)
    {
        if (predictedMove != MOVE_NONE && predictedMove != 0xFFFF && !IsBattleMoveStatus(predictedMove))
            ADJUST_SCORE_PTR(DECENT_EFFECT);
        else if (Random() % 256 < 100)
            ADJUST_SCORE_PTR(WEAK_EFFECT);
    }
    else
    {
        if (IsDoubleBattle())
            ADJUST_SCORE_PTR(-(2 * min(uses, 3)));
        else
            ADJUST_SCORE_PTR(-(min(uses, 3)));
    }

    if (gBattleMons[battlerAtk].status1 & (STATUS1_PSN_ANY | STATUS1_BURN | STATUS1_FROSTBITE)
     || gBattleMons[battlerAtk].status2 & (STATUS2_CURSED | STATUS2_INFATUATION)
     || gStatuses3[battlerAtk] & (STATUS3_PERISH_SONG | STATUS3_LEECHSEED | STATUS3_YAWN))
    {
        ADJUST_SCORE_PTR(-1);
    }

    if (gBattleMons[battlerDef].status1 & STATUS1_TOXIC_POISON
      || gBattleMons[battlerDef].status2 & (STATUS2_CURSED | STATUS2_INFATUATION)
      || gStatuses3[battlerDef] & (STATUS3_PERISH_SONG | STATUS3_LEECHSEED | STATUS3_YAWN))
        ADJUST_SCORE_PTR(DECENT_EFFECT);
}

// stat stages
bool32 ShouldLowerStat(u32 battlerAtk, u32 battlerDef, u32 abilityDef, u32 stat)
{
    if (gBattleMons[battlerDef].statStages[stat] == MIN_STAT_STAGE)
        return FALSE;

    if (AI_DATA->holdEffects[battlerDef] == HOLD_EFFECT_CLEAR_AMULET)
        return FALSE;

    switch (abilityDef)
    {
    case ABILITY_SPEED_BOOST:
        if (stat == STAT_SPEED)
            return FALSE;
    case ABILITY_HYPER_CUTTER:
        if (stat == STAT_ATK)
            return FALSE;
    case ABILITY_BIG_PECKS:
        if (stat == STAT_DEF)
            return FALSE;
    case ABILITY_ILLUMINATE:
        if (B_ILLUMINATE_EFFECT < GEN_9)
            break;
    case ABILITY_KEEN_EYE:
    case ABILITY_MINDS_EYE:
        if (stat == STAT_ACC)
            return FALSE;
    case ABILITY_FLOWER_VEIL:
        if (IS_BATTLER_OF_TYPE(battlerDef, TYPE_GRASS))
            return FALSE;
        break;
    case ABILITY_CONTRARY:
    case ABILITY_CLEAR_BODY:
    case ABILITY_WHITE_SMOKE:
    case ABILITY_FULL_METAL_BODY:
        return FALSE;
    }

    // This should be a viability check
    if (stat == STAT_SPEED)
    {
        // If AI is faster and doesn't have any mons left, lowering speed doesn't give any
        return !(AI_IsFaster(battlerAtk, battlerDef, AI_THINKING_STRUCT->moveConsidered)
            && CountUsablePartyMons(battlerAtk) == 0
            && !HasMoveEffect(battlerAtk, EFFECT_ELECTRO_BALL));
    }

    return TRUE;
}

bool32 BattlerStatCanRise(u32 battler, u32 battlerAbility, u32 stat)
{
    if ((gBattleMons[battler].statStages[stat] < MAX_STAT_STAGE && battlerAbility != ABILITY_CONTRARY)
      || (battlerAbility == ABILITY_CONTRARY && gBattleMons[battler].statStages[stat] > MIN_STAT_STAGE))
        return TRUE;
    return FALSE;
}

bool32 AreBattlersStatsMaxed(u32 battlerId)
{
    u32 i;
    for (i = STAT_ATK; i < NUM_BATTLE_STATS; i++)
    {
        if (gBattleMons[battlerId].statStages[i] < MAX_STAT_STAGE)
            return FALSE;
    }
    return TRUE;
}

bool32 AnyStatIsRaised(u32 battlerId)
{
    u32 i;

    for (i = STAT_ATK; i < NUM_BATTLE_STATS; i++)
    {
        if (gBattleMons[battlerId].statStages[i] > DEFAULT_STAT_STAGE)
            return TRUE;
    }
    return FALSE;
}

u32 CountPositiveStatStages(u32 battlerId)
{
    u32 count = 0;
    u32 i;
    for (i = STAT_ATK; i < NUM_BATTLE_STATS; i++)
    {
        if (gBattleMons[battlerId].statStages[i] > DEFAULT_STAT_STAGE)
            count++;
    }
    return count;
}

u32 CountNegativeStatStages(u32 battlerId)
{
    u32 count = 0;
    u32 i;
    for (i = STAT_ATK; i < NUM_BATTLE_STATS; i++)
    {
        if (gBattleMons[battlerId].statStages[i] < DEFAULT_STAT_STAGE)
            count++;
    }
    return count;
}

bool32 ShouldLowerAttack(u32 battlerAtk, u32 battlerDef, u32 defAbility)
{
    if (AI_IsFaster(battlerAtk, battlerDef, AI_THINKING_STRUCT->moveConsidered)
            && (AI_THINKING_STRUCT->aiFlags[battlerAtk] & AI_FLAG_TRY_TO_FAINT)
            && CanAIFaintTarget(battlerAtk, battlerDef, 0))
        return FALSE; // Don't bother lowering stats if can kill enemy.

    if (gBattleMons[battlerDef].statStages[STAT_ATK] > 4
      && HasMoveWithCategory(battlerDef, DAMAGE_CATEGORY_PHYSICAL)
      && defAbility != ABILITY_CONTRARY
      && defAbility != ABILITY_CLEAR_BODY
      && defAbility != ABILITY_WHITE_SMOKE
      && defAbility != ABILITY_FULL_METAL_BODY
      && defAbility != ABILITY_HYPER_CUTTER
      && AI_DATA->holdEffects[battlerDef] != HOLD_EFFECT_CLEAR_AMULET)
        return TRUE;
    return FALSE;
}

bool32 ShouldLowerDefense(u32 battlerAtk, u32 battlerDef, u32 defAbility)
{
    if (AI_IsFaster(battlerAtk, battlerDef, AI_THINKING_STRUCT->moveConsidered)
            && (AI_THINKING_STRUCT->aiFlags[battlerAtk] & AI_FLAG_TRY_TO_FAINT)
            && CanAIFaintTarget(battlerAtk, battlerDef, 0))
        return FALSE; // Don't bother lowering stats if can kill enemy.

    if (gBattleMons[battlerDef].statStages[STAT_DEF] > 4
      && HasMoveWithCategory(battlerAtk, DAMAGE_CATEGORY_PHYSICAL)
      && defAbility != ABILITY_CONTRARY
      && defAbility != ABILITY_CLEAR_BODY
      && defAbility != ABILITY_WHITE_SMOKE
      && defAbility != ABILITY_FULL_METAL_BODY
      && defAbility != ABILITY_BIG_PECKS
      && AI_DATA->holdEffects[battlerDef] != HOLD_EFFECT_CLEAR_AMULET)
        return TRUE;
    return FALSE;
}

bool32 ShouldLowerSpeed(u32 battlerAtk, u32 battlerDef, u32 defAbility)
{
    if (defAbility == ABILITY_CONTRARY
     || defAbility == ABILITY_CLEAR_BODY
     || defAbility == ABILITY_FULL_METAL_BODY
     || defAbility == ABILITY_WHITE_SMOKE
     || AI_DATA->holdEffects[battlerDef] == HOLD_EFFECT_CLEAR_AMULET)
        return FALSE;

    return (AI_IsSlower(battlerAtk, battlerDef, AI_THINKING_STRUCT->moveConsidered));
}

bool32 ShouldLowerSpAtk(u32 battlerAtk, u32 battlerDef, u32 defAbility)
{
    if (AI_IsFaster(battlerAtk, battlerDef, AI_THINKING_STRUCT->moveConsidered)
            && (AI_THINKING_STRUCT->aiFlags[battlerAtk] & AI_FLAG_TRY_TO_FAINT)
            && CanAIFaintTarget(battlerAtk, battlerDef, 0))
        return FALSE; // Don't bother lowering stats if can kill enemy.

    if (gBattleMons[battlerDef].statStages[STAT_SPATK] > 4
      && HasMoveWithCategory(battlerDef, DAMAGE_CATEGORY_SPECIAL)
      && defAbility != ABILITY_CONTRARY
      && defAbility != ABILITY_CLEAR_BODY
      && defAbility != ABILITY_FULL_METAL_BODY
      && defAbility != ABILITY_WHITE_SMOKE
      && AI_DATA->holdEffects[battlerDef] != HOLD_EFFECT_CLEAR_AMULET)
        return TRUE;
    return FALSE;
}

bool32 ShouldLowerSpDef(u32 battlerAtk, u32 battlerDef, u32 defAbility)
{
    if (AI_IsFaster(battlerAtk, battlerDef, AI_THINKING_STRUCT->moveConsidered)
            && (AI_THINKING_STRUCT->aiFlags[battlerAtk] & AI_FLAG_TRY_TO_FAINT)
            && CanAIFaintTarget(battlerAtk, battlerDef, 0))
        return FALSE; // Don't bother lowering stats if can kill enemy.

    if (gBattleMons[battlerDef].statStages[STAT_SPDEF] > 4
      && HasMoveWithCategory(battlerAtk, DAMAGE_CATEGORY_SPECIAL)
      && defAbility != ABILITY_CONTRARY
      && defAbility != ABILITY_CLEAR_BODY
      && defAbility != ABILITY_FULL_METAL_BODY
      && defAbility != ABILITY_WHITE_SMOKE
      && AI_DATA->holdEffects[battlerDef] != HOLD_EFFECT_CLEAR_AMULET)
        return TRUE;
    return FALSE;
}

bool32 ShouldLowerAccuracy(u32 battlerAtk, u32 battlerDef, u32 defAbility)
{
    if (AI_IsFaster(battlerAtk, battlerDef, AI_THINKING_STRUCT->moveConsidered)
            && (AI_THINKING_STRUCT->aiFlags[battlerAtk] & AI_FLAG_TRY_TO_FAINT)
            && CanAIFaintTarget(battlerAtk, battlerDef, 0))
        return FALSE; // Don't bother lowering stats if can kill enemy.

    if (defAbility != ABILITY_CONTRARY
      && defAbility != ABILITY_CLEAR_BODY
      && defAbility != ABILITY_WHITE_SMOKE
      && defAbility != ABILITY_FULL_METAL_BODY
      && defAbility != ABILITY_KEEN_EYE
      && defAbility != ABILITY_MINDS_EYE
      && (B_ILLUMINATE_EFFECT >= GEN_9 && defAbility != ABILITY_ILLUMINATE)
      && AI_DATA->holdEffects[battlerDef] != HOLD_EFFECT_CLEAR_AMULET)
        return TRUE;
    return FALSE;
}

bool32 ShouldLowerEvasion(u32 battlerAtk, u32 battlerDef, u32 defAbility)
{
    if (AI_IsFaster(battlerAtk, battlerDef, AI_THINKING_STRUCT->moveConsidered)
            && (AI_THINKING_STRUCT->aiFlags[battlerAtk] & AI_FLAG_TRY_TO_FAINT)
            && CanAIFaintTarget(battlerAtk, battlerDef, 0))
        return FALSE; // Don't bother lowering stats if can kill enemy.

    if (gBattleMons[battlerDef].statStages[STAT_EVASION] > DEFAULT_STAT_STAGE
      && defAbility != ABILITY_CONTRARY
      && defAbility != ABILITY_CLEAR_BODY
      && defAbility != ABILITY_FULL_METAL_BODY
      && defAbility != ABILITY_WHITE_SMOKE
      && AI_DATA->holdEffects[battlerDef] != HOLD_EFFECT_CLEAR_AMULET)
        return TRUE;
    return FALSE;
}

bool32 CanIndexMoveFaintTarget(u32 battlerAtk, u32 battlerDef, u32 moveIndex, enum DamageCalcContext calcContext)
{
    s32 dmg;
    u16 *moves = gBattleMons[battlerAtk].moves;

    if (IsDoubleBattle() && battlerDef == BATTLE_PARTNER(battlerAtk))
        dmg = AI_DATA->simulatedDmg[battlerAtk][battlerDef][moveIndex].maximum; // Attacking partner, be careful
    else
        dmg = AI_GetDamage(battlerAtk, battlerDef, moveIndex, calcContext, AI_DATA);

    if (gBattleMons[battlerDef].hp <= dmg && !CanEndureHit(battlerAtk, battlerDef, moves[moveIndex]))
        return TRUE;
    return FALSE;
}

bool32 CanIndexMoveGuaranteeFaintTarget(u32 battlerAtk, u32 battlerDef, u32 moveIndex)
{
    s32 dmg;
    u16 *moves = gBattleMons[battlerAtk].moves;

    dmg = AI_DATA->simulatedDmg[battlerAtk][battlerDef][moveIndex].minimum; // Explictly care about guaranteed KOs universally

    if (gBattleMons[battlerDef].hp <= dmg && !CanEndureHit(battlerAtk, battlerDef, moves[moveIndex]))
        return TRUE;
    return FALSE;
}

u16 *GetMovesArray(u32 battler)
{
    if (IsAiBattlerAware(battler) || IsAiBattlerAware(BATTLE_PARTNER(battler)))
        return gBattleMons[battler].moves;
    else
        return gBattleResources->battleHistory->usedMoves[battler];
}

bool32 HasOnlyMovesWithCategory(u32 battlerId, u32 category, bool32 onlyOffensive)
{
    u32 i;
    u16 *moves = GetMovesArray(battlerId);

    for (i = 0; i < MAX_MON_MOVES; i++)
    {
        if (onlyOffensive && IsBattleMoveStatus(moves[i]))
            continue;
        if (moves[i] != MOVE_NONE && moves[i] != MOVE_UNAVAILABLE && GetBattleMoveCategory(moves[i]) != category)
            return FALSE;
    }

    return TRUE;
}

bool32 HasMoveWithCategory(u32 battler, u32 category)
{
    u32 i;
    u16 *moves = GetMovesArray(battler);

    for (i = 0; i < MAX_MON_MOVES; i++)
    {
        if (moves[i] != MOVE_NONE && moves[i] != MOVE_UNAVAILABLE && GetBattleMoveCategory(moves[i]) == category)
            return TRUE;
    }
    return FALSE;
}

bool32 HasMoveWithType(u32 battler, u32 type)
{
    s32 i;
    u16 *moves = GetMovesArray(battler);

    for (i = 0; i < MAX_MON_MOVES; i++)
    {
        if (moves[i] != MOVE_NONE && moves[i] != MOVE_UNAVAILABLE && GetMoveType(moves[i]) == type)
            return TRUE;
    }

    return FALSE;
}

bool32 HasMoveEffect(u32 battlerId, enum BattleMoveEffects effect)
{
    s32 i;
    u16 *moves = GetMovesArray(battlerId);

    for (i = 0; i < MAX_MON_MOVES; i++)
    {
        if (moves[i] != MOVE_NONE && moves[i] != MOVE_UNAVAILABLE
            && GetMoveEffect(moves[i]) == effect)
            return TRUE;
    }

    return FALSE;
}

bool32 IsPowerBasedOnStatus(u32 battlerId, enum BattleMoveEffects effect, u32 argument)
{
    s32 i;
    u16 *moves = GetMovesArray(battlerId);

    for (i = 0; i < MAX_MON_MOVES; i++)
    {
        if (moves[i] != MOVE_NONE && moves[i] != MOVE_UNAVAILABLE
            && GetMoveEffect(moves[i]) == effect
            && (GetMoveEffectArg_Status(moves[i]) & argument))
            return TRUE;
    }

    return FALSE;
}

bool32 HasMoveWithAdditionalEffect(u32 battlerId, u32 moveEffect)
{
    s32 i;
    u16 *moves = GetMovesArray(battlerId);

    for (i = 0; i < MAX_MON_MOVES; i++)
    {
        if (moves[i] != MOVE_NONE && moves[i] != MOVE_UNAVAILABLE
            && MoveHasAdditionalEffect(moves[i], moveEffect))
            return TRUE;
    }

    return FALSE;
}

bool32 HasMoveWithCriticalHitChance(u32 battlerId)
{
    s32 i;
    u16 *moves = GetMovesArray(battlerId);

    for (i = 0; i < MAX_MON_MOVES; i++)
    {
        if (moves[i] != MOVE_NONE && moves[i] != MOVE_UNAVAILABLE
            && GetMoveCriticalHitStage(moves[i]) > 0)
            return TRUE;
    }

    return FALSE;
}

bool32 HasMoveWithMoveEffectExcept(u32 battlerId, u32 moveEffect, enum BattleMoveEffects exception)
{
    s32 i;
    u16 *moves = GetMovesArray(battlerId);

    for (i = 0; i < MAX_MON_MOVES; i++)
    {
        if (moves[i] != MOVE_NONE && moves[i] != MOVE_UNAVAILABLE
            && GetMoveEffect(moves[i]) != exception
            && MoveHasAdditionalEffect(moves[i], moveEffect))
            return TRUE;
    }

    return FALSE;
}

bool32 HasMove(u32 battlerId, u32 move)
{
    s32 i;
    u16 *moves = GetMovesArray(battlerId);

    for (i = 0; i < MAX_MON_MOVES; i++)
    {
        if (moves[i] != MOVE_NONE && moves[i] != MOVE_UNAVAILABLE && moves[i] == move)
            return TRUE;
    }

    return FALSE;
}

bool32 HasAnyKnownMove(u32 battlerId)
{
    s32 i;
    u16 *moves = GetMovesArray(battlerId);

    for (i = 0; i < MAX_MON_MOVES; i++)
    {
        if (moves[i] != MOVE_NONE)
            return TRUE;
    }

    return FALSE;
}

bool32 HasMoveThatLowersOwnStats(u32 battlerId)
{
    s32 i, j;
    u32 aiMove;
    u16 *moves = GetMovesArray(battlerId);
    for (i = 0; i < MAX_MON_MOVES; i++)
    {
        aiMove = moves[i];
        if (aiMove != MOVE_NONE && aiMove != MOVE_UNAVAILABLE)
        {
            u32 additionalEffectCount = GetMoveAdditionalEffectCount(aiMove);
            for (j = 0; j < additionalEffectCount; j++)
            {
                const struct AdditionalEffect *additionalEffect = GetMoveAdditionalEffectById(aiMove, j);
                if (IsSelfStatLoweringEffect(additionalEffect->moveEffect) && additionalEffect->self)
                    return TRUE;
            }
        }
    }
    return FALSE;
}

bool32 HasMoveWithLowAccuracy(u32 battlerAtk, u32 battlerDef, u32 accCheck, bool32 ignoreStatus, u32 atkAbility, u32 defAbility, u32 atkHoldEffect, u32 defHoldEffect)
{
    s32 i;
    u16 *moves = GetMovesArray(battlerAtk);
    u32 moveLimitations = AI_DATA->moveLimitations[battlerAtk];

    for (i = 0; i < MAX_MON_MOVES; i++)
    {
        if (IsMoveUnusable(i, moves[i], moveLimitations))
            continue;

        if (ignoreStatus && IsBattleMoveStatus(moves[i]))
            continue;
        else if ((!IsBattleMoveStatus(moves[i]) && GetMoveAccuracy(moves[i]) == 0)
              || GetBattlerMoveTargetType(battlerAtk, moves[i]) & (MOVE_TARGET_USER | MOVE_TARGET_OPPONENTS_FIELD))
            continue;

        if (AI_DATA->moveAccuracy[battlerAtk][battlerDef][i] <= accCheck)
            return TRUE;
    }

    return FALSE;
}

bool32 HasSleepMoveWithLowAccuracy(u32 battlerAtk, u32 battlerDef)
{
    u32 i;
    u16 *moves = GetMovesArray(battlerAtk);
    u32 moveLimitations = AI_DATA->moveLimitations[battlerAtk];

    for (i = 0; i < MAX_MON_MOVES; i++)
    {
        if (IsMoveUnusable(i, moves[i], moveLimitations))
            continue;

        if (GetMoveEffect(moves[i]) == EFFECT_SLEEP && AI_DATA->moveAccuracy[battlerAtk][battlerDef][i] < 85)
            return TRUE;
    }
    return FALSE;
}

bool32 HasHealingEffect(u32 battlerId)
{
    s32 i;
    u16 *moves = GetMovesArray(battlerId);

    for (i = 0; i < MAX_MON_MOVES; i++)
    {
        if (moves[i] != MOVE_NONE && moves[i] != MOVE_UNAVAILABLE && IsHealingMove(moves[i]))
            return TRUE;
    }

    return FALSE;
}

bool32 IsTrappingMove(u32 move)
{
    switch (GetMoveEffect(move))
    {
    case EFFECT_MEAN_LOOK:
    case EFFECT_FAIRY_LOCK:
    //case EFFECT_NO_RETREAT:   // TODO
        return TRUE;
    default:
        return MoveHasAdditionalEffect(move, MOVE_EFFECT_PREVENT_ESCAPE)
            || MoveHasAdditionalEffect(move, MOVE_EFFECT_WRAP);
    }
}

bool32 HasTrappingMoveEffect(u32 battler)
{
    s32 i;
    u16 *moves = GetMovesArray(battler);

    for (i = 0; i < MAX_MON_MOVES; i++)
    {
        if (moves[i] != MOVE_NONE && moves[i] != MOVE_UNAVAILABLE && IsTrappingMove(moves[i]))
            return TRUE;
    }

    return FALSE;
}

bool32 HasThawingMove(u32 battler)
{
    s32 i;
    u16 *moves = GetMovesArray(battler);
    for (i = 0; i < MAX_MON_MOVES; i++)
    {
        if (moves[i] != MOVE_NONE && moves[i] != MOVE_UNAVAILABLE && MoveThawsUser(moves[i]))
            return TRUE;
    }
    return FALSE;
}

bool32 IsUngroundingEffect(enum BattleMoveEffects effect)
{
    switch (effect)
    {
    case EFFECT_MAGNET_RISE:
        return TRUE;
    default:
        return FALSE;
    }
}

// for anger point
bool32 IsAttackBoostMoveEffect(enum BattleMoveEffects effect)
{
    switch (effect)
    {
    case EFFECT_ATTACK_UP:
    case EFFECT_ATTACK_UP_2:
    case EFFECT_ATTACK_ACCURACY_UP:
    case EFFECT_ATTACK_SPATK_UP:
    case EFFECT_DRAGON_DANCE:
    case EFFECT_COIL:
    case EFFECT_BELLY_DRUM:
    case EFFECT_BULK_UP:
    case EFFECT_GROWTH:
    case EFFECT_FILLET_AWAY:
        return TRUE;
    default:
        return FALSE;
    }
}

bool32 IsStatRaisingEffect(enum BattleMoveEffects effect)
{
    switch (effect)
    {
    case EFFECT_ATTACK_UP:
    case EFFECT_ATTACK_UP_2:
    case EFFECT_DEFENSE_UP:
    case EFFECT_DEFENSE_UP_2:
    case EFFECT_DEFENSE_UP_3:
    case EFFECT_SPEED_UP:
    case EFFECT_SPEED_UP_2:
    case EFFECT_SPECIAL_ATTACK_UP:
    case EFFECT_SPECIAL_ATTACK_UP_2:
    case EFFECT_SPECIAL_ATTACK_UP_3:
    case EFFECT_SPECIAL_DEFENSE_UP:
    case EFFECT_SPECIAL_DEFENSE_UP_2:
    case EFFECT_ACCURACY_UP:
    case EFFECT_ACCURACY_UP_2:
    case EFFECT_EVASION_UP:
    case EFFECT_EVASION_UP_2:
    case EFFECT_MINIMIZE:
    case EFFECT_DEFENSE_CURL:
    case EFFECT_CALM_MIND:
    case EFFECT_COSMIC_POWER:
    case EFFECT_DRAGON_DANCE:
    case EFFECT_ACUPRESSURE:
    case EFFECT_SHELL_SMASH:
    case EFFECT_SHIFT_GEAR:
    case EFFECT_ATTACK_ACCURACY_UP:
    case EFFECT_ATTACK_SPATK_UP:
    case EFFECT_GROWTH:
    case EFFECT_COIL:
    case EFFECT_QUIVER_DANCE:
    case EFFECT_BULK_UP:
    case EFFECT_GEOMANCY:
    case EFFECT_STOCKPILE:
    case EFFECT_VICTORY_DANCE:
        return TRUE;
    case EFFECT_CHARGE:
        return B_CHARGE_SPDEF_RAISE >= GEN_5;
    default:
        return FALSE;
    }
}

bool32 IsStatLoweringEffect(enum BattleMoveEffects effect)
{
    // ignore other potentially-beneficial effects like defog, gravity
    switch (effect)
    {
    case EFFECT_ATTACK_DOWN:
    case EFFECT_DEFENSE_DOWN:
    case EFFECT_SPEED_DOWN:
    case EFFECT_SPECIAL_ATTACK_DOWN:
    case EFFECT_SPECIAL_DEFENSE_DOWN:
    case EFFECT_ACCURACY_DOWN:
    case EFFECT_EVASION_DOWN:
    case EFFECT_ATTACK_DOWN_2:
    case EFFECT_DEFENSE_DOWN_2:
    case EFFECT_SPEED_DOWN_2:
    case EFFECT_SPECIAL_ATTACK_DOWN_2:
    case EFFECT_SPECIAL_DEFENSE_DOWN_2:
    case EFFECT_ACCURACY_DOWN_2:
    case EFFECT_EVASION_DOWN_2:
    case EFFECT_TICKLE:
    case EFFECT_CAPTIVATE:
    case EFFECT_NOBLE_ROAR:
    case EFFECT_MEMENTO:
        return TRUE;
    default:
        return FALSE;
    }
}

bool32 IsSelfStatLoweringEffect(enum BattleMoveEffects effect)
{
    // Self stat lowering moves like Overheart, Superpower etc.
    switch (effect)
    {
    case MOVE_EFFECT_ATK_MINUS_1:
    case MOVE_EFFECT_DEF_MINUS_1:
    case MOVE_EFFECT_SPD_MINUS_1:
    case MOVE_EFFECT_SP_ATK_MINUS_1:
    case MOVE_EFFECT_SP_DEF_MINUS_1:
    case MOVE_EFFECT_EVS_MINUS_1:
    case MOVE_EFFECT_ACC_MINUS_1:
    case MOVE_EFFECT_ATK_MINUS_2:
    case MOVE_EFFECT_DEF_MINUS_2:
    case MOVE_EFFECT_SPD_MINUS_2:
    case MOVE_EFFECT_SP_ATK_MINUS_2:
    case MOVE_EFFECT_SP_DEF_MINUS_2:
    case MOVE_EFFECT_EVS_MINUS_2:
    case MOVE_EFFECT_ACC_MINUS_2:
    case MOVE_EFFECT_V_CREATE:
    case MOVE_EFFECT_ATK_DEF_DOWN:
    case MOVE_EFFECT_DEF_SPDEF_DOWN:
        return TRUE;
    default:
        return FALSE;
    }
}

bool32 IsSwitchOutEffect(enum BattleMoveEffects effect)
{
    // Switch out effects like U-Turn, Volt Switch, etc.
    switch (effect)
    {
    case EFFECT_TELEPORT:
        if (B_TELEPORT_BEHAVIOR >= GEN_8)
            return TRUE;
    case EFFECT_HIT_ESCAPE:
    case EFFECT_PARTING_SHOT:
    case EFFECT_BATON_PASS:
    case EFFECT_CHILLY_RECEPTION:
    case EFFECT_SHED_TAIL:
        return TRUE;
    default:
        return FALSE;
    }
}

bool32 IsSubstituteEffect(enum BattleMoveEffects effect)
{
    // Substitute effects like Substitute, Shed Tail, etc.
    switch (effect)
    {
    case EFFECT_SUBSTITUTE:
    case EFFECT_SHED_TAIL:
        return TRUE;
    default:
        return FALSE;
    }
}

bool32 IsChaseEffect(enum BattleMoveEffects effect)
{
    // Effects that hit switching out mons like Pursuit
    switch (effect)
    {
    case EFFECT_PURSUIT:
        return TRUE;
    default:
        return FALSE;
    }
}

static inline bool32 IsMoveSleepClauseTrigger(u32 move)
{
    u32 i;
    enum BattleMoveEffects effect = GetMoveEffect(move);

    // Sleeping effects like Sleep Powder, Yawn, Dark Void, etc.
    switch (effect)
    {
    case EFFECT_SLEEP:
    case EFFECT_YAWN:
    case EFFECT_DARK_VOID:
        return TRUE;
    default:
        break;
    }

    // Sleeping effects like G-Max Befuddle, G-Max Snooze, etc.
    u32 additionalEffectCount = GetMoveAdditionalEffectCount(move);
    for (i = 0; i < additionalEffectCount; i++)
    {
        const struct AdditionalEffect *additionalEffect = GetMoveAdditionalEffectById(move, i);
        switch (additionalEffect->moveEffect)
        {
        // Skip MOVE_EFFECT_SLEEP as moves with a secondary chance of applying sleep are allowed by Smogon's rules (ie. Relic Song)
        case MOVE_EFFECT_EFFECT_SPORE_SIDE:
        case MOVE_EFFECT_YAWN_FOE:
            return TRUE;
        }
    }
    return FALSE;
}

bool32 HasDamagingMove(u32 battlerId)
{
    u32 i;
    u16 *moves = GetMovesArray(battlerId);

    for (i = 0; i < MAX_MON_MOVES; i++)
    {
        if (moves[i] != MOVE_NONE && moves[i] != MOVE_UNAVAILABLE && !IsBattleMoveStatus(moves[i]))
            return TRUE;
    }

    return FALSE;
}

bool32 HasDamagingMoveOfType(u32 battlerId, u32 type)
{
    s32 i;
    u16 *moves = GetMovesArray(battlerId);

    for (i = 0; i < MAX_MON_MOVES; i++)
    {
        if (moves[i] != MOVE_NONE && moves[i] != MOVE_UNAVAILABLE
          && GetMoveType(moves[i]) == type && !IsBattleMoveStatus(moves[i]))
            return TRUE;
    }

    return FALSE;
}

bool32 HasSubstituteIgnoringMove(u32 battler)
{
    s32 i;
    u16 *moves = GetMovesArray(battler);
    for (i = 0; i < MAX_MON_MOVES; i++)
    {
        if (moves[i] != MOVE_NONE && moves[i] != MOVE_UNAVAILABLE && MoveIgnoresSubstitute(moves[i]))
            return TRUE;
    }
    return FALSE;
}

bool32 HasHighCritRatioMove(u32 battler)
{
    s32 i;
    u16 *moves = GetMovesArray(battler);

    for (i = 0; i < MAX_MON_MOVES; i++)
    {
        if (moves[i] != MOVE_NONE && moves[i] != MOVE_UNAVAILABLE && GetMoveCriticalHitStage(moves[i]) > 0)
            return TRUE;
    }

    return FALSE;
}

bool32 HasMagicCoatAffectedMove(u32 battler)
{
    s32 i;
    u16 *moves = GetMovesArray(battler);
    for (i = 0; i < MAX_MON_MOVES; i++)
    {
        if (moves[i] != MOVE_NONE && moves[i] != MOVE_UNAVAILABLE && MoveCanBeBouncedBack(moves[i]))
            return TRUE;
    }
    return FALSE;
}

bool32 HasSnatchAffectedMove(u32 battler)
{
    s32 i;
    u16 *moves = GetMovesArray(battler);
    for (i = 0; i < MAX_MON_MOVES; i++)
    {
        if (moves[i] != MOVE_NONE && moves[i] != MOVE_UNAVAILABLE && MoveCanBeSnatched(moves[i]))
            return TRUE;
    }
    return FALSE;
}

bool32 IsTwoTurnNotSemiInvulnerableMove(u32 battlerAtk, u32 move)
{
    switch (GetMoveEffect(move))
    {
    case EFFECT_SOLAR_BEAM:
    case EFFECT_TWO_TURNS_ATTACK:
        return !(AI_DATA->holdEffects[battlerAtk] == HOLD_EFFECT_POWER_HERB
              || (AI_GetWeather() & GetMoveTwoTurnAttackWeather(move)));
    default:
        return FALSE;
    }
}

static u32 GetLeechSeedDamage(u32 battlerId)
{
    u32 damage = 0;
    if ((gStatuses3[battlerId] & STATUS3_LEECHSEED)
     && gBattleMons[gStatuses3[battlerId] & STATUS3_LEECHSEED_BATTLER].hp != 0)
     {
        damage = GetNonDynamaxMaxHP(battlerId) / 8;
        if (damage == 0)
            damage = 1;
     }
     return damage;
}

static u32 GetNightmareDamage(u32 battlerId)
{
    u32 damage = 0;
    if ((gBattleMons[battlerId].status2 & STATUS2_NIGHTMARE) && gBattleMons[battlerId].status1 & STATUS1_SLEEP)
    {
        damage = GetNonDynamaxMaxHP(battlerId) / 4;
        if (damage == 0)
            damage = 1;
    }
    return damage;
}

static u32 GetCurseDamage(u32 battlerId)
{
    u32 damage = 0;
    if (gBattleMons[battlerId].status2 & STATUS2_CURSED)
    {
        damage = GetNonDynamaxMaxHP(battlerId) / 4;
        if (damage == 0)
            damage = 1;
    }
    return damage;
}

static u32 GetTrapDamage(u32 battlerId)
{
    // ai has no knowledge about turns remaining
    u32 damage = 0;
    enum ItemHoldEffect holdEffect = AI_DATA->holdEffects[gBattleStruct->wrappedBy[battlerId]];
    if (gBattleMons[battlerId].status2 & STATUS2_WRAPPED)
    {
        if (holdEffect == HOLD_EFFECT_BINDING_BAND)
            damage = GetNonDynamaxMaxHP(battlerId) / (B_BINDING_DAMAGE >= GEN_6 ? 6 : 8);
        else
            damage = GetNonDynamaxMaxHP(battlerId) / (B_BINDING_DAMAGE >= GEN_6 ? 8 : 16);

        if (damage == 0)
            damage = 1;
    }
    return damage;
}

static u32 GetPoisonDamage(u32 battlerId)
{
    u32 damage = 0;

    if (AI_DATA->abilities[battlerId] == ABILITY_POISON_HEAL)
        return damage;

    if (gBattleMons[battlerId].status1 & STATUS1_POISON)
    {
        damage = gBattleMons[battlerId].maxHP / 8;
        if (damage == 0)
            damage = 1;
    }
    else if (gBattleMons[battlerId].status1 & STATUS1_TOXIC_POISON)
    {
        u32 status1Temp = gBattleMons[battlerId].status1;
        damage = gBattleMons[battlerId].maxHP / 16;
        if (damage == 0)
            damage = 1;
        if ((status1Temp & STATUS1_TOXIC_COUNTER) != STATUS1_TOXIC_TURN(15)) // not 16 turns
            status1Temp += STATUS1_TOXIC_TURN(1);
        damage *= (status1Temp & STATUS1_TOXIC_COUNTER) >> 8;
    }
    return damage;
}

static bool32 BattlerAffectedBySandstorm(u32 battlerId, u32 ability)
{
    if (!IS_BATTLER_ANY_TYPE(battlerId, TYPE_ROCK, TYPE_GROUND, TYPE_STEEL)
      && ability != ABILITY_SAND_VEIL
      && ability != ABILITY_SAND_FORCE
      && ability != ABILITY_SAND_RUSH
      && ability != ABILITY_OVERCOAT)
        return TRUE;
    return FALSE;
}

static bool32 BattlerAffectedByHail(u32 battlerId, u32 ability)
{
    if (!IS_BATTLER_OF_TYPE(battlerId, TYPE_ICE)
      && ability != ABILITY_SNOW_CLOAK
      && ability != ABILITY_OVERCOAT
      && ability != ABILITY_ICE_BODY)
        return TRUE;
    return FALSE;
}

static u32 GetWeatherDamage(u32 battlerId)
{
    u32 ability = AI_DATA->abilities[battlerId];
    enum ItemHoldEffect holdEffect = AI_DATA->holdEffects[battlerId];
    u32 damage = 0;
    u32 weather = AI_GetWeather();
    if (!weather)
        return 0;

    if (weather & B_WEATHER_SANDSTORM)
    {
        if (BattlerAffectedBySandstorm(battlerId, ability)
          && !(gStatuses3[battlerId] & (STATUS3_UNDERGROUND | STATUS3_UNDERWATER))
          && holdEffect != HOLD_EFFECT_SAFETY_GOGGLES)
        {
            damage = GetNonDynamaxMaxHP(battlerId) / 16;
            if (damage == 0)
                damage = 1;
        }
    }
    if ((weather & B_WEATHER_HAIL) && ability != ABILITY_ICE_BODY)
    {
        if (BattlerAffectedByHail(battlerId, ability)
          && !(gStatuses3[battlerId] & (STATUS3_UNDERGROUND | STATUS3_UNDERWATER))
          && holdEffect != HOLD_EFFECT_SAFETY_GOGGLES)
        {
            damage = GetNonDynamaxMaxHP(battlerId) / 16;
            if (damage == 0)
                damage = 1;
        }
    }
    return damage;
}

u32 GetBattlerSecondaryDamage(u32 battlerId)
{
    u32 secondaryDamage;

    if (AI_DATA->abilities[battlerId] == ABILITY_MAGIC_GUARD)
        return FALSE;

    secondaryDamage = GetLeechSeedDamage(battlerId)
     + GetNightmareDamage(battlerId)
     + GetCurseDamage(battlerId)
     + GetTrapDamage(battlerId)
     + GetPoisonDamage(battlerId)
     + GetWeatherDamage(battlerId);

    return secondaryDamage;
}

bool32 BattlerWillFaintFromWeather(u32 battler, u32 ability)
{
    if ((BattlerAffectedBySandstorm(battler, ability) || BattlerAffectedByHail(battler, ability))
      && gBattleMons[battler].hp <= max(1, gBattleMons[battler].maxHP / 16))
        return TRUE;

    return FALSE;
}

bool32 BattlerWillFaintFromSecondaryDamage(u32 battler, u32 ability)
{
    if (GetBattlerSecondaryDamage(battler) != 0
      && gBattleMons[battler].hp <= max(1, gBattleMons[battler].maxHP / 16))
        return TRUE;
    return FALSE;
}

static bool32 AnyUsefulStatIsRaised(u32 battler)
{
    u32 statId;

    for (statId = STAT_ATK; statId < NUM_BATTLE_STATS; statId++)
    {
        if (gBattleMons[battler].statStages[statId] > DEFAULT_STAT_STAGE)
        {
            switch (statId)
            {
            case STAT_ATK:
                if (HasMoveWithCategory(battler, DAMAGE_CATEGORY_PHYSICAL))
                    return TRUE;
                break;
            case STAT_SPATK:
                if (HasMoveWithCategory(battler, DAMAGE_CATEGORY_SPECIAL))
                    return TRUE;
                break;
            case STAT_SPEED:
                return TRUE;
            }
        }
    }

    return FALSE;
}

static bool32 PartyBattlerShouldAvoidHazards(u32 currBattler, u32 switchBattler)
{
    struct Pokemon *mon = &GetBattlerParty(currBattler)[switchBattler];
    u32 ability = GetMonAbility(mon);   // we know our own party data
    enum ItemHoldEffect holdEffect;
    u32 species = GetMonData(mon, MON_DATA_SPECIES);
    u32 flags = gSideStatuses[GetBattlerSide(currBattler)] & (SIDE_STATUS_SPIKES | SIDE_STATUS_STEALTH_ROCK | SIDE_STATUS_STEELSURGE | SIDE_STATUS_STICKY_WEB | SIDE_STATUS_TOXIC_SPIKES);
    s32 hazardDamage = 0;
    u32 type1 = gSpeciesInfo[species].types[0];
    u32 type2 = gSpeciesInfo[species].types[1];
    u32 maxHp = GetMonData(mon, MON_DATA_MAX_HP);

    if (flags == 0)
        return FALSE;

    if (ability == ABILITY_MAGIC_GUARD)
        return FALSE;
    if (gFieldStatuses & STATUS_FIELD_MAGIC_ROOM || ability == ABILITY_KLUTZ)
        holdEffect = HOLD_EFFECT_NONE;
    else
        holdEffect = gItemsInfo[GetMonData(mon, MON_DATA_HELD_ITEM)].holdEffect;
    if (holdEffect == HOLD_EFFECT_HEAVY_DUTY_BOOTS)
        return FALSE;

    if (flags & SIDE_STATUS_STEALTH_ROCK)
        hazardDamage += GetStealthHazardDamageByTypesAndHP(TYPE_SIDE_HAZARD_POINTED_STONES, type1, type2, maxHp);
    if ((flags & SIDE_STATUS_STEELSURGE))
        hazardDamage += GetStealthHazardDamageByTypesAndHP(TYPE_SIDE_HAZARD_SHARP_STEEL, type1, type2, maxHp);

    if (flags & SIDE_STATUS_SPIKES && ((type1 != TYPE_FLYING && type2 != TYPE_FLYING
        && ability != ABILITY_LEVITATE && holdEffect != HOLD_EFFECT_AIR_BALLOON)
        || holdEffect == HOLD_EFFECT_IRON_BALL || gFieldStatuses & STATUS_FIELD_GRAVITY))
    {
        s32 spikesDmg = maxHp / ((5 - gSideTimers[GetBattlerSide(currBattler)].spikesAmount) * 2);
        if (spikesDmg == 0)
            spikesDmg = 1;
        hazardDamage += spikesDmg;
    }

    if (hazardDamage >= GetMonData(mon, MON_DATA_HP))
        return TRUE;
    return FALSE;
}

enum AIPivot ShouldPivot(u32 battlerAtk, u32 battlerDef, u32 defAbility, u32 move, u32 moveIndex)
{
    bool32 hasStatBoost = AnyUsefulStatIsRaised(battlerAtk) || gBattleMons[battlerDef].statStages[STAT_EVASION] >= 9; //Significant boost in evasion for any class
    u32 battlerToSwitch;

    battlerToSwitch = gBattleStruct->AI_monToSwitchIntoId[battlerAtk];

    if (PartyBattlerShouldAvoidHazards(battlerAtk, battlerToSwitch))
        return DONT_PIVOT;

    if (!IsDoubleBattle())
    {
        if (CountUsablePartyMons(battlerAtk) == 0)
            return CAN_TRY_PIVOT; // can't switch, but attack might still be useful

        if (IsBattlerPredictedToSwitch(battlerDef))
            return SHOULD_PIVOT; // Try pivoting so you can switch to a better matchup to counter your new opponent

        if (AI_IsFaster(battlerAtk, battlerDef, move)) // Attacker goes first
        {
            if (!CanAIFaintTarget(battlerAtk, battlerDef, 0)) // Can't KO foe otherwise
            {
                if (CanAIFaintTarget(battlerAtk, battlerDef, 2))
                {
                    // attacker can kill target in two hits (theoretically)
                    if (CanTargetFaintAi(battlerDef, battlerAtk))
                        return SHOULD_PIVOT;   // Won't get the two turns, pivot

                    if (!IsBattleMoveStatus(move) && ((AI_DATA->shouldSwitch & (1u << battlerAtk))
                        || (AI_BattlerAtMaxHp(battlerDef) && (AI_DATA->holdEffects[battlerDef] == HOLD_EFFECT_FOCUS_SASH
                        || (B_STURDY >= GEN_5 && defAbility == ABILITY_STURDY)
                        || defAbility == ABILITY_MULTISCALE
                        || defAbility == ABILITY_SHADOW_SHIELD))))
                        return SHOULD_PIVOT;   // pivot to break sash/sturdy/multiscale
                }
                else if (!hasStatBoost)
                {
                    if (!IsBattleMoveStatus(move) && (AI_BattlerAtMaxHp(battlerDef) && (AI_DATA->holdEffects[battlerDef] == HOLD_EFFECT_FOCUS_SASH
                        || (B_STURDY >= GEN_5 && defAbility == ABILITY_STURDY)
                        || defAbility == ABILITY_MULTISCALE
                        || defAbility == ABILITY_SHADOW_SHIELD)))
                        return SHOULD_PIVOT;   // pivot to break sash/sturdy/multiscale

                    if (AI_DATA->shouldSwitch & (1u << battlerAtk))
                        return SHOULD_PIVOT;

                    /* TODO - check if switchable mon unafffected by/will remove hazards
                    if (gSideStatuses[battlerAtk] & SIDE_STATUS_SPIKES && switchScore >= SWITCHING_INCREASE_CAN_REMOVE_HAZARDS)
                        return SHOULD_PIVOT;*/

                    /*if (BattlerWillFaintFromSecondaryDamage(battlerAtk, AI_DATA->abilities[battlerAtk]) && switchScore >= SWITCHING_INCREASE_WALLS_FOE)
                        return SHOULD_PIVOT;*/

                    /*if (IsClassDamager(class) && switchScore >= SWITCHING_INCREASE_HAS_SUPER_EFFECTIVE_MOVE)
                    {
                        bool32 physMoveInMoveset = PhysicalMoveInMoveset(battlerAtk);
                        bool32 specMoveInMoveset = SpecialMoveInMoveset(battlerAtk);

                        //Pivot if attacking stats are bad
                        if (physMoveInMoveset && !specMoveInMoveset)
                        {
                            if (STAT_STAGE_ATK < 6)
                                return SHOULD_PIVOT;
                        }
                        else if (!physMoveInMoveset && specMoveInMoveset)
                        {
                            if (STAT_STAGE_SPATK < 6)
                                return SHOULD_PIVOT;
                        }
                        else if (physMoveInMoveset && specMoveInMoveset)
                        {
                            if (STAT_STAGE_ATK < 6 && STAT_STAGE_SPATK < 6)
                                return SHOULD_PIVOT;
                        }

                        return SHOULD_PIVOT;
                    }*/
                }
            }
        }
        else // Opponent Goes First
        {
            if (CanTargetFaintAi(battlerDef, battlerAtk))
            {
                if (GetMoveEffect(move) == EFFECT_TELEPORT)
                    return DONT_PIVOT; // If you're going to faint because you'll go second, use a different move
                else
                    return CAN_TRY_PIVOT; // You're probably going to faint anyways so if for some reason you don't, better switch
            }
            else if (CanTargetFaintAiWithMod(battlerDef, battlerAtk, 0, 2)) // Foe can 2HKO AI
            {
                if (CanAIFaintTarget(battlerAtk, battlerDef, 0))
                {
                    if (!BattlerWillFaintFromSecondaryDamage(battlerAtk, AI_DATA->abilities[battlerAtk]))
                        return CAN_TRY_PIVOT; // Use this move to KO if you must
                }
                else // Can't KO the foe
                {
                    return SHOULD_PIVOT;
                }
            }
            else // Foe can 3HKO+ AI
            {
                if (CanAIFaintTarget(battlerAtk, battlerDef, 0))
                {
                    if (!BattlerWillFaintFromSecondaryDamage(battlerAtk, AI_DATA->abilities[battlerAtk]) // This is the only move that can KO
                      && !hasStatBoost) //You're not wasting a valuable stat boost
                    {
                        return CAN_TRY_PIVOT;
                    }
                }
                else if (CanAIFaintTarget(battlerAtk, battlerDef, 2))
                {
                    // can knock out foe in 2 hits
                    if (IsBattleMoveStatus(move) && ((AI_DATA->shouldSwitch & (1u << battlerAtk)) //Damaging move
                      //&& (switchScore >= SWITCHING_INCREASE_RESIST_ALL_MOVES + SWITCHING_INCREASE_KO_FOE //remove hazards
                     || (AI_DATA->holdEffects[battlerDef] == HOLD_EFFECT_FOCUS_SASH && AI_BattlerAtMaxHp(battlerDef))))
                        return DONT_PIVOT; // Pivot to break the sash
                    else
                        return CAN_TRY_PIVOT;
                }
                else
                {
                    //if (IsClassDamager(class) && switchScore >= SWITCHING_INCREASE_KO_FOE)
                        //return SHOULD_PIVOT; //Only switch if way better matchup

                    if (!hasStatBoost)
                    {
                        // TODO - check if switching prevents/removes hazards
                        //if (gSideStatuses[battlerAtk] & SIDE_STATUS_SPIKES && switchScore >= SWITCHING_INCREASE_CAN_REMOVE_HAZARDS)
                            //return SHOULD_PIVOT;

                        // TODO - not always a good idea
                        //if (BattlerWillFaintFromSecondaryDamage(battlerAtk) && switchScore >= SWITCHING_INCREASE_HAS_SUPER_EFFECTIVE_MOVE)
                            //return SHOULD_PIVOT;

                        /*if (IsClassDamager(class) && switchScore >= SWITCHING_INCREASE_HAS_SUPER_EFFECTIVE_MOVE)
                        {
                            bool32 physMoveInMoveset = PhysicalMoveInMoveset(battlerAtk);
                            bool32 specMoveInMoveset = SpecialMoveInMoveset(battlerAtk);

                            //Pivot if attacking stats are bad
                            if (physMoveInMoveset && !specMoveInMoveset)
                            {
                                if (STAT_STAGE_ATK < 6)
                                    return SHOULD_PIVOT;
                            }
                            else if (!physMoveInMoveset && specMoveInMoveset)
                            {
                                if (STAT_STAGE_SPATK < 6)
                                    return SHOULD_PIVOT;
                            }
                            else if (physMoveInMoveset && specMoveInMoveset)
                            {
                                if (STAT_STAGE_ATK < 6 && STAT_STAGE_SPATK < 6)
                                    return SHOULD_PIVOT;
                            }
                        }*/

                        return CAN_TRY_PIVOT;
                    }
                }
            }
        }
    }

    return DONT_PIVOT;
}

bool32 CanKnockOffItem(u32 battler, u32 item)
{
    if (item == ITEM_NONE)
        return FALSE;

    if (!(gBattleTypeFlags & (BATTLE_TYPE_EREADER_TRAINER
      | BATTLE_TYPE_FRONTIER
      | BATTLE_TYPE_LINK
      | BATTLE_TYPE_RECORDED_LINK
      | BATTLE_TYPE_SECRET_BASE
      | (B_TRAINERS_KNOCK_OFF_ITEMS == TRUE ? BATTLE_TYPE_TRAINER : 0)
      )) && GetBattlerSide(battler) == B_SIDE_PLAYER)
        return FALSE;

    if (AI_DATA->abilities[battler] == ABILITY_STICKY_HOLD)
        return FALSE;

    if (!CanBattlerGetOrLoseItem(battler, item))
        return FALSE;

    return TRUE;
}

// status checks
bool32 IsBattlerIncapacitated(u32 battler, u32 ability)
{
    if ((gBattleMons[battler].status1 & STATUS1_FREEZE) && !HasThawingMove(battler))
        return TRUE;    // if battler has thawing move we assume they will definitely use it, and thus being frozen should be neglected

    if (gBattleMons[battler].status1 & STATUS1_SLEEP && !HasMoveEffect(battler, EFFECT_SLEEP_TALK))
        return TRUE;

    if (gBattleMons[battler].status2 & STATUS2_RECHARGE || (ability == ABILITY_TRUANT && gDisableStructs[battler].truantCounter != 0))
        return TRUE;

    return FALSE;
}

bool32 AI_CanPutToSleep(u32 battlerAtk, u32 battlerDef, u32 defAbility, u32 move, u32 partnerMove)
{
    if (!CanBeSlept(battlerDef, defAbility, BLOCKED_BY_SLEEP_CLAUSE)
      || DoesSubstituteBlockMove(battlerAtk, battlerDef, move)
      || PartnerMoveEffectIsStatusSameTarget(BATTLE_PARTNER(battlerAtk), battlerDef, partnerMove))   // shouldn't try to sleep mon that partner is trying to make sleep
        return FALSE;
    return TRUE;
}

static inline bool32 DoesBattlerBenefitFromAllVolatileStatus(u32 battler, u32 ability)
{
    if (ability == ABILITY_MARVEL_SCALE
     || ability == ABILITY_QUICK_FEET
     || ability == ABILITY_MAGIC_GUARD
     || (ability == ABILITY_GUTS && HasMoveWithCategory(battler, DAMAGE_CATEGORY_PHYSICAL))
     || HasMoveEffect(battler, EFFECT_FACADE)
     || HasMoveEffect(battler, EFFECT_PSYCHO_SHIFT))
        return TRUE;
    return FALSE;
}

bool32 ShouldPoison(u32 battlerAtk, u32 battlerDef)
{
    u32 defAbility = AI_DATA->abilities[battlerDef];
    // Battler can be poisoned and has move/ability that synergizes with being poisoned
    if (CanBePoisoned(battlerAtk, battlerDef, defAbility) && (
        DoesBattlerBenefitFromAllVolatileStatus(battlerDef, defAbility)
        || defAbility == ABILITY_POISON_HEAL
        || (defAbility == ABILITY_TOXIC_BOOST && HasMoveWithCategory(battlerDef, DAMAGE_CATEGORY_PHYSICAL))))
    {
        if (battlerAtk == battlerDef) // Targeting self
            return TRUE;
        else
            return FALSE;
    }
    if (battlerAtk == battlerDef)
        return FALSE;
    else
        return TRUE;
}

bool32 ShouldBurn(u32 battlerAtk, u32 battlerDef)
{
    u32 defAbility = AI_DATA->abilities[battlerDef];
    // Battler can be burned and has move/ability that synergizes with being burned
    if (CanBeBurned(battlerDef, defAbility) && (
        DoesBattlerBenefitFromAllVolatileStatus(battlerDef, defAbility)
        || defAbility == ABILITY_HEATPROOF
        || (defAbility == ABILITY_FLARE_BOOST && HasMoveWithCategory(battlerDef, DAMAGE_CATEGORY_SPECIAL))))
    {
        if (battlerAtk == battlerDef) // Targeting self
            return TRUE;
        else
            return FALSE;
    }

    if (battlerAtk == battlerDef)
        return FALSE;
    else
        return TRUE;
}

bool32 ShouldFreezeOrFrostbite(u32 battlerAtk, u32 battlerDef)
{
    if (!B_USE_FROSTBITE)
    {
        if (CanBeFrozen(battlerDef))
        {
            if (battlerAtk == battlerDef) // Targeting self
                return FALSE;
            else
                return TRUE;
        }
        return FALSE;
    }
    else
    {
        u32 defAbility = AI_DATA->abilities[battlerDef];
        // Battler can be frostbitten and has move/ability that synergizes with being frostbitten
        if (CanBeFrozen(battlerDef) && 
            DoesBattlerBenefitFromAllVolatileStatus(battlerDef, defAbility))
        {
            if (battlerAtk == battlerDef) // Targeting self
                return TRUE;
            else
                return FALSE;
        }
    
        if (battlerAtk == battlerDef)
            return FALSE;
        else
            return TRUE;
    }
}

bool32 ShouldParalyze(u32 battlerAtk, u32 battlerDef)
{
    u32 defAbility = AI_DATA->abilities[battlerDef];
    // Battler can be paralyzed and has move/ability that synergizes with being paralyzed
    if (CanBeParalyzed(battlerDef, defAbility) && (
        DoesBattlerBenefitFromAllVolatileStatus(battlerDef, defAbility)))
    {
        if (battlerAtk == battlerDef) // Targeting self
            return TRUE;
        else
            return FALSE;
    }
    if (battlerAtk == battlerDef)
        return FALSE;
    else
        return TRUE;
}

bool32 AI_CanPoison(u32 battlerAtk, u32 battlerDef, u32 defAbility, u32 move, u32 partnerMove)
{
    if (!CanBePoisoned(battlerAtk, battlerDef, GetBattlerAbility(battlerDef))
      || AI_DATA->effectiveness[battlerAtk][battlerDef][AI_THINKING_STRUCT->movesetIndex] == UQ_4_12(0.0)
      || DoesSubstituteBlockMove(battlerAtk, battlerDef, move)
      || PartnerMoveEffectIsStatusSameTarget(BATTLE_PARTNER(battlerAtk), battlerDef, partnerMove))
        return FALSE;
    else if (defAbility != ABILITY_CORROSION && IS_BATTLER_ANY_TYPE(battlerDef, TYPE_POISON, TYPE_STEEL))
        return FALSE;
    else if (IsValidDoubleBattle(battlerAtk) && AI_DATA->abilities[BATTLE_PARTNER(battlerDef)] == ABILITY_PASTEL_VEIL)
        return FALSE;

    return TRUE;
}

bool32 AI_CanParalyze(u32 battlerAtk, u32 battlerDef, u32 defAbility, u32 move, u32 partnerMove)
{
    if (!CanBeParalyzed(battlerDef, defAbility)
      || AI_DATA->effectiveness[battlerAtk][battlerDef][AI_THINKING_STRUCT->movesetIndex] == UQ_4_12(0.0)
      || gSideStatuses[GetBattlerSide(battlerDef)] & SIDE_STATUS_SAFEGUARD
      || DoesSubstituteBlockMove(battlerAtk, battlerDef, move)
      || PartnerMoveEffectIsStatusSameTarget(BATTLE_PARTNER(battlerAtk), battlerDef, partnerMove))
        return FALSE;
    return TRUE;
}

bool32 AI_CanBeConfused(u32 battlerAtk, u32 battlerDef, u32 move, u32 ability)
{
    if ((gBattleMons[battlerDef].status2 & STATUS2_CONFUSION)
     || (ability == ABILITY_OWN_TEMPO && !DoesBattlerIgnoreAbilityChecks(battlerAtk, AI_DATA->abilities[battlerAtk], move))
     || IsBattlerTerrainAffected(battlerDef, STATUS_FIELD_MISTY_TERRAIN)
     || gSideStatuses[GetBattlerSide(battlerDef)] & SIDE_STATUS_SAFEGUARD
     || DoesSubstituteBlockMove(battlerAtk, battlerDef, move))
        return FALSE;
    return TRUE;
}

bool32 AI_CanConfuse(u32 battlerAtk, u32 battlerDef, u32 defAbility, u32 battlerAtkPartner, u32 move, u32 partnerMove)
{
    if (GetBattlerMoveTargetType(battlerAtk, move) == MOVE_TARGET_FOES_AND_ALLY
     && AI_CanBeConfused(battlerAtk, battlerDef, move, defAbility)
     && !AI_CanBeConfused(battlerAtk, BATTLE_PARTNER(battlerDef), move, AI_DATA->abilities[BATTLE_PARTNER(battlerDef)]))
        return FALSE;

    if (!AI_CanBeConfused(battlerAtk, battlerDef, move, defAbility)
     || DoesPartnerHaveSameMoveEffect(battlerAtkPartner, battlerDef, move, partnerMove))
        return FALSE;

    return TRUE;
}

bool32 AI_CanGetFrostbite(u32 battler, u32 ability)
{
    if (ability == ABILITY_MAGMA_ARMOR
      || ability == ABILITY_COMATOSE
      || IS_BATTLER_OF_TYPE(battler, TYPE_ICE)
      || gBattleMons[battler].status1 & STATUS1_ANY
      || IsAbilityStatusProtected(battler, ability)
      || gSideStatuses[GetBattlerSide(battler)] & SIDE_STATUS_SAFEGUARD)
        return FALSE;
    return TRUE;
}

bool32 AI_CanBurn(u32 battlerAtk, u32 battlerDef, u32 defAbility, u32 battlerAtkPartner, u32 move, u32 partnerMove)
{
    if (!CanBeBurned(battlerDef, defAbility)
      || AI_DATA->effectiveness[battlerAtk][battlerDef][AI_THINKING_STRUCT->movesetIndex] == UQ_4_12(0.0)
      || DoesSubstituteBlockMove(battlerAtk, battlerDef, move)
      || PartnerMoveEffectIsStatusSameTarget(battlerAtkPartner, battlerDef, partnerMove))
    {
        return FALSE;
    }
    return TRUE;
}

bool32 AI_CanGiveFrostbite(u32 battlerAtk, u32 battlerDef, u32 defAbility, u32 battlerAtkPartner, u32 move, u32 partnerMove)
{
    if (!AI_CanGetFrostbite(battlerDef, defAbility)
      || AI_DATA->effectiveness[battlerAtk][battlerDef][AI_THINKING_STRUCT->movesetIndex] == UQ_4_12(0.0)
      || DoesSubstituteBlockMove(battlerAtk, battlerDef, move)
      || PartnerMoveEffectIsStatusSameTarget(battlerAtkPartner, battlerDef, partnerMove))
    {
        return FALSE;
    }
    return TRUE;
}

bool32 AI_CanBeInfatuated(u32 battlerAtk, u32 battlerDef, u32 defAbility)
{
    if ((gBattleMons[battlerDef].status2 & STATUS2_INFATUATION)
      || AI_DATA->effectiveness[battlerAtk][battlerDef][AI_THINKING_STRUCT->movesetIndex] == UQ_4_12(0.0)
      || defAbility == ABILITY_OBLIVIOUS
      || !AreBattlersOfOppositeGender(battlerAtk, battlerDef)
      || AI_IsAbilityOnSide(battlerDef, ABILITY_AROMA_VEIL))
        return FALSE;
    return TRUE;
}

u32 ShouldTryToFlinch(u32 battlerAtk, u32 battlerDef, u32 atkAbility, u32 defAbility, u32 move)
{
    if (((!IsMoldBreakerTypeAbility(battlerAtk, AI_DATA->abilities[battlerAtk]) && (defAbility == ABILITY_SHIELD_DUST || defAbility == ABILITY_INNER_FOCUS))
      || AI_DATA->holdEffects[battlerDef] == HOLD_EFFECT_COVERT_CLOAK
      || DoesSubstituteBlockMove(battlerAtk, battlerDef, move)
      || AI_IsSlower(battlerAtk, battlerDef, move))) // Opponent goes first
    {
        return 0;
    }
    else if ((atkAbility == ABILITY_SERENE_GRACE
      || gBattleMons[battlerDef].status1 & STATUS1_PARALYSIS
      || gBattleMons[battlerDef].status2 & STATUS2_INFATUATION
      || gBattleMons[battlerDef].status2 & STATUS2_CONFUSION)
      || ((AI_IsFaster(battlerAtk, battlerDef, move)) && CanTargetFaintAi(battlerDef, battlerAtk)))
    {
        return 2;   // good idea to flinch
    }

    return 0;   // don't try to flinch
}

bool32 ShouldTrap(u32 battlerAtk, u32 battlerDef, u32 move)
{
    if (AI_CanBattlerEscape(battlerDef))
        return FALSE;

    if (IsBattlerTrapped(battlerAtk, battlerDef))
        return FALSE;

    if (BattlerWillFaintFromSecondaryDamage(battlerDef, AI_DATA->abilities[battlerDef]))
        return TRUE;    // battler is taking secondary damage with low HP

    if (AI_THINKING_STRUCT->aiFlags[battlerAtk] & AI_FLAG_STALL)
    {
        if (!CanTargetFaintAi(battlerDef, battlerAtk))
            return TRUE;    // attacker goes first and opponent can't kill us
    }

    return FALSE;
}

bool32 ShouldFakeOut(u32 battlerAtk, u32 battlerDef, u32 move)
{
    if ((!gDisableStructs[battlerAtk].isFirstTurn && MoveHasAdditionalEffectWithChance(move, MOVE_EFFECT_FLINCH, 100))
    || AI_DATA->abilities[battlerAtk] == ABILITY_GORILLA_TACTICS
    || AI_DATA->holdEffects[battlerAtk] == HOLD_EFFECT_CHOICE_BAND
    || AI_DATA->holdEffects[battlerDef] == HOLD_EFFECT_COVERT_CLOAK
    || DoesSubstituteBlockMove(battlerAtk, battlerDef, move)
    || (!IsMoldBreakerTypeAbility(battlerAtk, AI_DATA->abilities[battlerAtk])
    && (AI_DATA->abilities[battlerDef] == ABILITY_SHIELD_DUST || AI_DATA->abilities[battlerDef] == ABILITY_INNER_FOCUS)))
        return FALSE;

    return TRUE;
}

static u32 FindMoveUsedXTurnsAgo(u32 battlerId, u32 x)
{
    s32 i, index = BATTLE_HISTORY->moveHistoryIndex[battlerId];
    for (i = 0; i < x; i++)
    {
        if (--index < 0)
            index = AI_MOVE_HISTORY_COUNT - 1;
    }
    return BATTLE_HISTORY->moveHistory[battlerId][index];
}

bool32 IsWakeupTurn(u32 battler)
{
    // Check if rest was used 2 turns ago
    if ((gBattleMons[battler].status1 & STATUS1_SLEEP) == 1 && GetMoveEffect(FindMoveUsedXTurnsAgo(battler, 2)) == EFFECT_REST)
        return TRUE;
    else // no way to know
        return FALSE;
}

bool32 AnyPartyMemberStatused(u32 battlerId, bool32 checkSoundproof)
{
    struct Pokemon *party;
    u32 i, battlerOnField1, battlerOnField2;

    party = GetBattlerParty(battlerId);

    if (IsDoubleBattle())
    {
        battlerOnField1 = gBattlerPartyIndexes[battlerId];
        battlerOnField2 = gBattlerPartyIndexes[GetPartnerBattler(battlerId)];
        // Check partner's status
        if ((GetGenConfig(GEN_CONFIG_HEAL_BELL_SOUNDPROOF) == GEN_5
            || AI_DATA->abilities[BATTLE_PARTNER(battlerId)] != ABILITY_SOUNDPROOF
            || !checkSoundproof)
         && GetMonData(&party[battlerOnField2], MON_DATA_STATUS) != STATUS1_NONE)
            return TRUE;
    }
    else // In singles there's only one battlerId by side.
    {
        battlerOnField1 = gBattlerPartyIndexes[battlerId];
        battlerOnField2 = gBattlerPartyIndexes[battlerId];
    }

    // Check attacker's status
    if ((GetGenConfig(GEN_CONFIG_HEAL_BELL_SOUNDPROOF) == GEN_5
      || GetGenConfig(GEN_CONFIG_HEAL_BELL_SOUNDPROOF) >= GEN_8
      || AI_DATA->abilities[battlerId] != ABILITY_SOUNDPROOF || !checkSoundproof)
     && GetMonData(&party[battlerOnField1], MON_DATA_STATUS) != STATUS1_NONE)
        return TRUE;

    // Check inactive party mons' status
    for (i = 0; i < PARTY_SIZE; i++)
    {
        if (i == battlerOnField1 || i == battlerOnField2)
            continue;
        if (GetGenConfig(GEN_CONFIG_HEAL_BELL_SOUNDPROOF) < GEN_5
         && checkSoundproof
         && GetMonAbility(&party[i]) == ABILITY_SOUNDPROOF)
            continue;
        if (GetMonData(&party[i], MON_DATA_STATUS) != STATUS1_NONE)
            return TRUE;
    }

    return FALSE;
}

u32 GetBattlerSideSpeedAverage(u32 battler)
{
    u32 speed1 = 0;
    u32 speed2 = 0;
    u32 numBattlersAlive = 0;

    if (IsBattlerAlive(battler))
    {
        speed1 = AI_DATA->speedStats[battler];
        numBattlersAlive++;
    }

    if (IsDoubleBattle() && IsBattlerAlive(BATTLE_PARTNER(battler)))
    {
        speed2 = AI_DATA->speedStats[BATTLE_PARTNER(battler)];
        numBattlersAlive++;
    }

    return (speed1 + speed2) / numBattlersAlive;
}

bool32 ShouldUseRecoilMove(u32 battlerAtk, u32 battlerDef, u32 recoilDmg, u32 moveIndex)
{
    if (recoilDmg >= gBattleMons[battlerAtk].hp //Recoil kills attacker
      && CountUsablePartyMons(battlerDef) != 0) //Foe has more than 1 target left
    {
        if (recoilDmg >= gBattleMons[battlerDef].hp && !CanAIFaintTarget(battlerAtk, battlerDef, 0))
            return TRUE; //If it's the only KO move then just use it
        else
            return FALSE; //Not as good to use move if you'll faint and not win
    }

    return TRUE;
}

bool32 ShouldAbsorb(u32 battlerAtk, u32 battlerDef, u32 move, s32 damage)
{
    if (move == 0xFFFF || AI_IsFaster(battlerAtk, battlerDef, move))
    {
        // using item or user goes first
        s32 healDmg = (GetMoveAbsorbPercentage(move) * damage) / 100;

        if (gStatuses3[battlerAtk] & STATUS3_HEAL_BLOCK)
            healDmg = 0;

        if (CanTargetFaintAi(battlerDef, battlerAtk)
          && !CanTargetFaintAiWithMod(battlerDef, battlerAtk, healDmg, 0))
            return TRUE;    // target can faint attacker unless they heal
        else if (!CanTargetFaintAi(battlerDef, battlerAtk) && AI_DATA->hpPercents[battlerAtk] < 60 && (Random() % 3))
            return TRUE;    // target can't faint attacker at all, attacker health is about half, 2/3rds rate of encouraging healing
    }
    else
    {
        // opponent goes first
        if (!CanTargetFaintAi(battlerDef, battlerAtk))
            return TRUE;
    }

    return FALSE;
}

bool32 ShouldRecover(u32 battlerAtk, u32 battlerDef, u32 move, u32 healPercent, enum DamageCalcContext calcContext)
{
    if (move == 0xFFFF || AI_IsFaster(battlerAtk, battlerDef, move))
    {
        // using item or user going first
        s32 damage = AI_GetDamage(battlerAtk, battlerDef, AI_THINKING_STRUCT->movesetIndex, calcContext, AI_DATA);
        s32 healAmount = (healPercent * damage) / 100;
        if (gStatuses3[battlerAtk] & STATUS3_HEAL_BLOCK)
            healAmount = 0;

        if (CanTargetFaintAi(battlerDef, battlerAtk)
          && !CanTargetFaintAiWithMod(battlerDef, battlerAtk, healAmount, 0))
            return TRUE;    // target can faint attacker unless they heal
        else if (!CanTargetFaintAi(battlerDef, battlerAtk) && AI_DATA->hpPercents[battlerAtk] < 60 && (Random() % 3))
            return TRUE;    // target can't faint attacker at all, attacker health is about half, 2/3rds rate of encouraging healing
    }
    return FALSE;
}

bool32 ShouldSetScreen(u32 battlerAtk, u32 battlerDef, enum BattleMoveEffects moveEffect)
{
    u32 atkSide = GetBattlerSide(battlerAtk);

    // Don't waste a turn if screens will be broken
    if (HasMoveEffect(battlerDef, EFFECT_BRICK_BREAK)
     || HasMoveEffect(battlerDef, EFFECT_RAGING_BULL))
        return FALSE;

    switch (moveEffect)
    {
    case EFFECT_AURORA_VEIL:
        // Use only in Hail and only if AI doesn't already have Reflect, Light Screen or Aurora Veil itself active.
        if ((AI_GetWeather() & (B_WEATHER_HAIL | B_WEATHER_SNOW))
            && !(gSideStatuses[atkSide] & (SIDE_STATUS_REFLECT | SIDE_STATUS_LIGHTSCREEN | SIDE_STATUS_AURORA_VEIL)))
            return TRUE;
        break;
    case EFFECT_REFLECT:
        // Use only if the player has a physical move and AI doesn't already have Reflect itself active.
        if (HasMoveWithCategory(battlerDef, DAMAGE_CATEGORY_PHYSICAL)
            && !(gSideStatuses[atkSide] & SIDE_STATUS_REFLECT))
            return TRUE;
        break;
    case EFFECT_LIGHT_SCREEN:
        // Use only if the player has a special move and AI doesn't already have Light Screen itself active.
        if (HasMoveWithCategory(battlerDef, DAMAGE_CATEGORY_SPECIAL)
            && !(gSideStatuses[atkSide] & SIDE_STATUS_LIGHTSCREEN))
            return TRUE;
        break;
    default:
        break;
    }

    return FALSE;
}

// Partner Logic
bool32 IsValidDoubleBattle(u32 battlerAtk)
{
    if (IsDoubleBattle()
      && ((IsBattlerAlive(BATTLE_OPPOSITE(battlerAtk)) && IsBattlerAlive(BATTLE_PARTNER(BATTLE_OPPOSITE(battlerAtk)))) || IsBattlerAlive(BATTLE_PARTNER(battlerAtk))))
        return TRUE;
    return FALSE;
}

u32 GetAllyChosenMove(u32 battlerId)
{
    u32 partnerBattler = BATTLE_PARTNER(battlerId);

    if (!IsBattlerAlive(partnerBattler) || !IsAiBattlerAware(partnerBattler))
        return MOVE_NONE;
    else if (partnerBattler > battlerId) // Battler with the lower id chooses the move first.
        return gLastMoves[partnerBattler];
    else
        return gBattleMons[partnerBattler].moves[gBattleStruct->chosenMovePositions[partnerBattler]];
}

//PARTNER_MOVE_EFFECT_IS_SAME
bool32 DoesPartnerHaveSameMoveEffect(u32 battlerAtkPartner, u32 battlerDef, u32 move, u32 partnerMove)
{
    if (!IsDoubleBattle())
        return FALSE;

    if (GetMoveEffect(move) == GetMoveEffect(partnerMove)
      && partnerMove != MOVE_NONE
      && gBattleStruct->moveTarget[battlerAtkPartner] == battlerDef)
    {
        return TRUE;
    }
    return FALSE;
}

//PARTNER_MOVE_EFFECT_IS_SAME_NO_TARGET
bool32 PartnerHasSameMoveEffectWithoutTarget(u32 battlerAtkPartner, u32 move, u32 partnerMove)
{
    if (!IsDoubleBattle())
        return FALSE;

    if (GetMoveEffect(move) == GetMoveEffect(partnerMove)
      && partnerMove != MOVE_NONE)
        return TRUE;
    return FALSE;
}

//PARTNER_MOVE_EFFECT_IS_STATUS_SAME_TARGET
bool32 PartnerMoveEffectIsStatusSameTarget(u32 battlerAtkPartner, u32 battlerDef, u32 partnerMove)
{
    if (!IsDoubleBattle())
        return FALSE;

    enum BattleMoveEffects partnerEffect = GetMoveEffect(partnerMove);
    if (partnerMove != MOVE_NONE
     && gBattleStruct->moveTarget[battlerAtkPartner] == battlerDef
     && (partnerEffect == EFFECT_SLEEP
       || partnerEffect == EFFECT_POISON
       || partnerEffect == EFFECT_TOXIC
       || partnerEffect == EFFECT_PARALYZE
       || partnerEffect == EFFECT_WILL_O_WISP
       || partnerEffect == EFFECT_YAWN))
        return TRUE;
    return FALSE;
}

bool32 IsMoveEffectWeather(u32 move)
{
    enum BattleMoveEffects effect = GetMoveEffect(move);
    if (move != MOVE_NONE
     && (effect == EFFECT_SUNNY_DAY
      || effect == EFFECT_RAIN_DANCE
      || effect == EFFECT_SANDSTORM
      || effect == EFFECT_HAIL
      || effect == EFFECT_SNOWSCAPE
      || effect == EFFECT_CHILLY_RECEPTION))
        return TRUE;
    return FALSE;
}

//PARTNER_MOVE_EFFECT_IS_TERRAIN
bool32 PartnerMoveEffectIsTerrain(u32 battlerAtkPartner, u32 partnerMove)
{
    if (!IsDoubleBattle())
        return FALSE;

    enum BattleMoveEffects partnerEffect = GetMoveEffect(partnerMove);
    if (partnerMove != MOVE_NONE
     && (partnerEffect == EFFECT_GRASSY_TERRAIN
      || partnerEffect == EFFECT_MISTY_TERRAIN
      || partnerEffect == EFFECT_ELECTRIC_TERRAIN
      || partnerEffect == EFFECT_PSYCHIC_TERRAIN))
        return TRUE;

    return FALSE;
}

//PARTNER_MOVE_EFFECT_IS
bool32 PartnerMoveEffectIs(u32 battlerAtkPartner, u32 partnerMove, enum BattleMoveEffects effectCheck)
{
    if (!IsDoubleBattle())
        return FALSE;

    if (partnerMove != MOVE_NONE && GetMoveEffect(partnerMove) == effectCheck)
        return TRUE;

    return FALSE;
}

//PARTNER_MOVE_IS_TAILWIND_TRICKROOM
bool32 PartnerMoveIs(u32 battlerAtkPartner, u32 partnerMove, u32 moveCheck)
{
    if (!IsDoubleBattle())
        return FALSE;

    if (partnerMove != MOVE_NONE && partnerMove == moveCheck)
        return TRUE;
    return FALSE;
}

//PARTNER_MOVE_IS_SAME
bool32 PartnerMoveIsSameAsAttacker(u32 battlerAtkPartner, u32 battlerDef, u32 move, u32 partnerMove)
{
    if (!IsDoubleBattle())
        return FALSE;

    if (partnerMove != MOVE_NONE && move == partnerMove && gBattleStruct->moveTarget[battlerAtkPartner] == battlerDef)
        return TRUE;
    return FALSE;
}

//PARTNER_MOVE_IS_SAME_NO_TARGET
bool32 PartnerMoveIsSameNoTarget(u32 battlerAtkPartner, u32 move, u32 partnerMove)
{
    if (!IsDoubleBattle())
        return FALSE;
    if (partnerMove != MOVE_NONE && move == partnerMove)
        return TRUE;
    return FALSE;
}

bool32 PartnerMoveActivatesSleepClause(u32 partnerMove)
{
    if (!IsDoubleBattle() || !IsSleepClauseEnabled())
        return FALSE;
    return IsMoveSleepClauseTrigger(partnerMove);
}

bool32 ShouldUseWishAromatherapy(u32 battlerAtk, u32 battlerDef, u32 move)
{
    u32 i;
    s32 firstId, lastId;
    struct Pokemon* party;
    bool32 hasStatus = AnyPartyMemberStatused(battlerAtk, IsSoundMove(move));
    bool32 needHealing = FALSE;

    GetAIPartyIndexes(battlerAtk, &firstId, &lastId);
    party = GetBattlerParty(battlerAtk);

    if (CountUsablePartyMons(battlerAtk) == 0
      && (CanTargetFaintAi(battlerDef, battlerAtk) || BattlerWillFaintFromSecondaryDamage(battlerAtk, AI_DATA->abilities[battlerAtk])))
        return FALSE; // Don't heal if last mon and will faint

    for (i = 0; i < PARTY_SIZE; i++)
    {
        u32 currHp = GetMonData(&party[i], MON_DATA_HP);
        u32 maxHp = GetMonData(&party[i], MON_DATA_MAX_HP);

        if (!GetMonData(&party[i], MON_DATA_IS_EGG, NULL) && currHp > 0)
        {
            if ((currHp * 100) / maxHp < 65 // Less than 65% health remaining
              && i >= firstId && i < lastId) // Can only switch to mon on your team
            {
                needHealing = TRUE;
            }
        }
    }

    if (!IsDoubleBattle())
    {
        switch (GetMoveEffect(move))
        {
        case EFFECT_WISH:
            if (needHealing)
                return TRUE;
            break;
        case EFFECT_HEAL_BELL:
            if (hasStatus)
                return TRUE;
            break;
        default:
            break;
        }
    }
    else
    {
        switch (GetMoveEffect(move))
        {
        case EFFECT_WISH:
            return ShouldRecover(battlerAtk, battlerDef, move, 50, AI_DEFENDING); // Switch recovery isn't good idea in doubles
        case EFFECT_HEAL_BELL:
            if (hasStatus)
                return TRUE;
            break;
        default:
            break;
        }
    }

    return FALSE;
}

#define SIZE_G_BATTLE_MONS (sizeof(struct BattlePokemon) * MAX_BATTLERS_COUNT)

struct BattlePokemon *AllocSaveBattleMons(void)
{
    struct BattlePokemon *savedBattleMons = Alloc(SIZE_G_BATTLE_MONS);
    memcpy(savedBattleMons, gBattleMons, SIZE_G_BATTLE_MONS);
    return savedBattleMons;
}

void FreeRestoreBattleMons(struct BattlePokemon *savedBattleMons)
{
    memcpy(gBattleMons, savedBattleMons, SIZE_G_BATTLE_MONS);
    Free(savedBattleMons);
}

// party logic
s32 AI_CalcPartyMonDamage(u32 move, u32 battlerAtk, u32 battlerDef, struct BattlePokemon switchinCandidate, bool32 isPartyMonAttacker)
{
    struct SimulatedDamage dmg;
    uq4_12_t effectiveness;
    struct BattlePokemon *savedBattleMons = AllocSaveBattleMons();

    if (isPartyMonAttacker)
    {
        gBattleMons[battlerAtk] = switchinCandidate;
        AI_THINKING_STRUCT->saved[battlerDef].saved = TRUE;
        SetBattlerAiData(battlerAtk, AI_DATA); // set known opposing battler data
        AI_THINKING_STRUCT->saved[battlerDef].saved = FALSE;
    }
    else
    {
        gBattleMons[battlerDef] = switchinCandidate;
        AI_THINKING_STRUCT->saved[battlerAtk].saved = TRUE;
        SetBattlerAiData(battlerDef, AI_DATA); // set known opposing battler data
        AI_THINKING_STRUCT->saved[battlerAtk].saved = FALSE;
    }

    dmg = AI_CalcDamage(move, battlerAtk, battlerDef, &effectiveness, FALSE, AI_GetWeather());
    // restores original gBattleMon struct
    FreeRestoreBattleMons(savedBattleMons);

    if (isPartyMonAttacker)
        SetBattlerAiData(battlerAtk, AI_DATA);
    else
        SetBattlerAiData(battlerDef, AI_DATA);

    return dmg.median;
}

u32 AI_WhoStrikesFirstPartyMon(u32 battlerAtk, u32 battlerDef, struct BattlePokemon switchinCandidate, u32 moveConsidered)
{
    struct BattlePokemon *savedBattleMons = AllocSaveBattleMons();
    gBattleMons[battlerAtk] = switchinCandidate;

    SetBattlerAiData(battlerAtk, AI_DATA);
    u32 aiMonFaster = AI_IsFaster(battlerAtk, battlerDef, moveConsidered);
    FreeRestoreBattleMons(savedBattleMons);
    SetBattlerAiData(battlerAtk, AI_DATA);

    return aiMonFaster;
}

s32 CountUsablePartyMons(u32 battlerId)
{
    s32 battlerOnField1, battlerOnField2, i, ret;
    struct Pokemon *party;
    party = GetBattlerParty(battlerId);

    if (IsDoubleBattle())
    {
        battlerOnField1 = gBattlerPartyIndexes[battlerId];
        battlerOnField2 = gBattlerPartyIndexes[GetPartnerBattler(battlerId)];
    }
    else // In singles there's only one battlerId by side.
    {
        battlerOnField1 = gBattlerPartyIndexes[battlerId];
        battlerOnField2 = gBattlerPartyIndexes[battlerId];
    }

    ret = 0;
    for (i = 0; i < PARTY_SIZE; i++)
    {
        if (i != battlerOnField1 && i != battlerOnField2
         && GetMonData(&party[i], MON_DATA_HP) != 0
         && GetMonData(&party[i], MON_DATA_SPECIES_OR_EGG) != SPECIES_NONE
         && GetMonData(&party[i], MON_DATA_SPECIES_OR_EGG) != SPECIES_EGG)
        {
            ret++;
        }
    }

    return ret;
}

bool32 IsPartyFullyHealedExceptBattler(u32 battlerId)
{
    struct Pokemon *party;
    u32 i;
    party = GetBattlerParty(battlerId);

    for (i = 0; i < PARTY_SIZE; i++)
    {
        if (i != gBattlerPartyIndexes[battlerId]
         && GetMonData(&party[i], MON_DATA_HP) != 0
         && GetMonData(&party[i], MON_DATA_SPECIES_OR_EGG) != SPECIES_NONE
         && GetMonData(&party[i], MON_DATA_SPECIES_OR_EGG) != SPECIES_EGG
         && GetMonData(&party[i], MON_DATA_HP) < GetMonData(&party[i], MON_DATA_MAX_HP))
            return FALSE;
    }
    return TRUE;
}

bool32 PartyHasMoveCategory(u32 battlerId, u32 category)
{
    struct Pokemon *party = GetBattlerParty(battlerId);
    u32 i, j;

    for (i = 0; i < PARTY_SIZE; i++)
    {
        if (GetMonData(&party[i], MON_DATA_HP, NULL) == 0)
            continue;

        for (j = 0; j < MAX_MON_MOVES; j++)
        {
            u32 move = GetMonData(&party[i], MON_DATA_MOVE1 + j, NULL);
            u32 pp = GetMonData(&party[i], MON_DATA_PP1 + j, NULL);

            if (pp > 0 && move != MOVE_NONE)
            {
                //TODO - handle photon geyser, light that burns the sky
                if (GetMoveCategory(move) == category)
                    return TRUE;
            }
        }
    }

    return FALSE;
}

bool32 SideHasMoveCategory(u32 battlerId, u32 category)
{
    if (IsDoubleBattle())
    {
        if (HasMoveWithCategory(battlerId, category) || HasMoveWithCategory(BATTLE_PARTNER(battlerId), category))
            return TRUE;
    }
    else
    {
        if (HasMoveWithCategory(battlerId, category))
            return TRUE;
    }
    return FALSE;
}

bool32 IsAbilityOfRating(u32 ability, s8 rating)
{
    if (gAbilitiesInfo[ability].aiRating >= rating)
        return TRUE;
    return FALSE;
}

static const u16 sRecycleEncouragedItems[] =
{
    ITEM_CHESTO_BERRY,
    ITEM_LUM_BERRY,
    ITEM_STARF_BERRY,
    ITEM_SITRUS_BERRY,
    ITEM_MICLE_BERRY,
    ITEM_CUSTAP_BERRY,
    ITEM_MENTAL_HERB,
    ITEM_FOCUS_SASH,
    ITEM_SALAC_BERRY,
    ITEM_LIECHI_BERRY,
    ITEM_AGUAV_BERRY,
    ITEM_FIGY_BERRY,
    ITEM_IAPAPA_BERRY,
    ITEM_MAGO_BERRY,
    ITEM_WIKI_BERRY,
    ITEM_MENTAL_HERB,
    ITEM_POWER_HERB,
    ITEM_BERRY_JUICE,
    ITEM_WEAKNESS_POLICY,
    ITEM_BLUNDER_POLICY,
    ITEM_KEE_BERRY,
    ITEM_MARANGA_BERRY,
    // TODO expand this
};

// Its assumed that the berry is strategically given, so no need to check benefits of the berry
bool32 IsStatBoostingBerry(u32 item)
{
    switch (item)
    {
    case ITEM_LIECHI_BERRY:
    case ITEM_GANLON_BERRY:
    case ITEM_SALAC_BERRY:
    case ITEM_PETAYA_BERRY:
    case ITEM_APICOT_BERRY:
    //case ITEM_LANSAT_BERRY:
    case ITEM_STARF_BERRY:
    case ITEM_MICLE_BERRY:
        return TRUE;
    default:
        return FALSE;
    }
}

bool32 ShouldRestoreHpBerry(u32 battlerAtk, u32 item)
{
    switch (item)
    {
    case ITEM_ORAN_BERRY:
        if (gBattleMons[battlerAtk].maxHP <= 50)
            return TRUE;    // Only worth it in the early game
        return FALSE;
    case ITEM_SITRUS_BERRY:
    case ITEM_FIGY_BERRY:
    case ITEM_WIKI_BERRY:
    case ITEM_MAGO_BERRY:
    case ITEM_AGUAV_BERRY:
    case ITEM_IAPAPA_BERRY:
        return TRUE;
    default:
        return FALSE;
    }
}

bool32 IsRecycleEncouragedItem(u32 item)
{
    u32 i;
    for (i = 0; i < ARRAY_COUNT(sRecycleEncouragedItems); i++)
    {
        if (item == sRecycleEncouragedItems[i])
            return TRUE;
    }
    return FALSE;
}

static enum AIScore IncreaseStatUpScoreInternal(u32 battlerAtk, u32 battlerDef, enum StatChange statId, bool32 considerContrary)
{
    enum AIScore tempScore = NO_INCREASE;
    u32 noOfHitsToFaint = NoOfHitsForTargetToFaintAI(battlerDef, battlerAtk);
    u32 aiIsFaster = AI_IsFaster(battlerAtk, battlerDef, TRUE);
    u32 shouldSetUp = ((noOfHitsToFaint >= 2 && aiIsFaster) || (noOfHitsToFaint >= 3 && !aiIsFaster) || noOfHitsToFaint == UNKNOWN_NO_OF_HITS);
    u32 i;

    if (considerContrary && AI_DATA->abilities[battlerAtk] == ABILITY_CONTRARY)
        return NO_INCREASE;

    // Don't increase stats if opposing battler has Unaware
    if (HasBattlerSideAbility(battlerDef, ABILITY_UNAWARE, AI_DATA))
        return NO_INCREASE;

    // Don't increase stat if AI is at +4
    if (gBattleMons[battlerAtk].statStages[statId] >= MAX_STAT_STAGE - 2)
        return NO_INCREASE;

    // Don't increase stat if AI has less then 70% HP and number of hits isn't known
    if (AI_DATA->hpPercents[battlerAtk] < 70 && noOfHitsToFaint == UNKNOWN_NO_OF_HITS)
        return NO_INCREASE;

    // Don't set up if AI is dead to residual damage from weather
    if (GetBattlerSecondaryDamage(battlerAtk) >= gBattleMons[battlerAtk].hp)
        return NO_INCREASE;

    // Don't increase stats if opposing battler has Opportunist
    if (AI_DATA->abilities[battlerDef] == ABILITY_OPPORTUNIST)
        return NO_INCREASE;

    // Don't increase stats if opposing battler has Encore
    if (HasMoveEffect(battlerDef, EFFECT_ENCORE))
        return NO_INCREASE;

    if (IsDoubleBattle() && HasMoveEffect(GetPartnerBattler(battlerDef), EFFECT_ENCORE))
        return NO_INCREASE;

    // Predicting switch
    if (IsBattlerPredictedToSwitch(battlerDef))
    {
        struct Pokemon *playerParty = GetBattlerParty(battlerDef);
        // If expected switchin outspeeds and has Encore, don't increase
        for (i = 0; i < MAX_MON_MOVES; i++)
        {
            if (GetMoveEffect(GetMonData(&playerParty[AI_DATA->mostSuitableMonId[battlerDef]], MON_DATA_MOVE1 + i, NULL)) == EFFECT_ENCORE
                && GetMonData(&playerParty[AI_DATA->mostSuitableMonId[battlerDef]], MON_DATA_PP1 + i, NULL) > 0);
            {
                if (GetMonData(&playerParty[AI_DATA->mostSuitableMonId[battlerDef]], MON_DATA_SPEED, NULL) > gBattleMons[battlerAtk].speed)
                    return NO_INCREASE;
            }
        }
        // Otherwise if predicting switch, stat increases are great momentum
        tempScore += WEAK_EFFECT;
    }

    switch (statId)
    {
    case STAT_CHANGE_ATK:
        if (HasMoveWithCategory(battlerAtk, DAMAGE_CATEGORY_PHYSICAL) && shouldSetUp)
            tempScore += DECENT_EFFECT;
        break;
    case STAT_CHANGE_DEF:
        if (HasMoveWithCategory(battlerDef, DAMAGE_CATEGORY_PHYSICAL) || !HasMoveWithCategory(battlerDef, DAMAGE_CATEGORY_SPECIAL))
        {
            if (AI_THINKING_STRUCT->aiFlags[battlerAtk] & AI_FLAG_STALL)
                tempScore += DECENT_EFFECT;
            else
                tempScore += WEAK_EFFECT;
        }
        break;
    case STAT_CHANGE_SPEED:
        if ((noOfHitsToFaint >= 3 && !aiIsFaster) || noOfHitsToFaint == UNKNOWN_NO_OF_HITS)
            tempScore += DECENT_EFFECT;
        break;
    case STAT_CHANGE_SPATK:
        if (HasMoveWithCategory(battlerAtk, DAMAGE_CATEGORY_SPECIAL) && shouldSetUp)
            tempScore += DECENT_EFFECT;
        break;
    case STAT_CHANGE_SPDEF:
        if (HasMoveWithCategory(battlerDef, DAMAGE_CATEGORY_SPECIAL) || !HasMoveWithCategory(battlerDef, DAMAGE_CATEGORY_PHYSICAL))
        {
            if (AI_THINKING_STRUCT->aiFlags[battlerAtk] & AI_FLAG_STALL)
                tempScore += DECENT_EFFECT;
            else
                tempScore += WEAK_EFFECT;
        }
        break;
    case STAT_CHANGE_ATK_2:
        if (HasMoveWithCategory(battlerAtk, DAMAGE_CATEGORY_PHYSICAL) && shouldSetUp)
            tempScore += GOOD_EFFECT;
        break;
    case STAT_CHANGE_DEF_2:
        if (HasMoveWithCategory(battlerDef, DAMAGE_CATEGORY_PHYSICAL) || !HasMoveWithCategory(battlerDef, DAMAGE_CATEGORY_SPECIAL))
        {
            if (AI_THINKING_STRUCT->aiFlags[battlerAtk] & AI_FLAG_STALL)
                tempScore += GOOD_EFFECT;
            else
                tempScore += DECENT_EFFECT;
        }
        break;
    case STAT_CHANGE_SPEED_2:
        if ((noOfHitsToFaint >= 3 && !aiIsFaster) || noOfHitsToFaint == UNKNOWN_NO_OF_HITS)
            tempScore += GOOD_EFFECT;
        break;
    case STAT_CHANGE_SPATK_2:
        if (HasMoveWithCategory(battlerAtk, DAMAGE_CATEGORY_SPECIAL) && shouldSetUp)
            tempScore += GOOD_EFFECT;
        break;
    case STAT_CHANGE_SPDEF_2:
        if (HasMoveWithCategory(battlerDef, DAMAGE_CATEGORY_SPECIAL) || !HasMoveWithCategory(battlerDef, DAMAGE_CATEGORY_PHYSICAL))
        {
            if (AI_THINKING_STRUCT->aiFlags[battlerAtk] & AI_FLAG_STALL)
                tempScore += GOOD_EFFECT;
            else
                tempScore += DECENT_EFFECT;
        }
        break;
    case STAT_CHANGE_ACC:
        if (gBattleMons[battlerAtk].statStages[STAT_ACC] <= 3) // Increase only if necessary
            tempScore += DECENT_EFFECT;
        break;
    case STAT_CHANGE_EVASION:
        if (noOfHitsToFaint > 3 || noOfHitsToFaint == UNKNOWN_NO_OF_HITS)
            tempScore += GOOD_EFFECT;
        else
            tempScore += DECENT_EFFECT;
        break;
    }

    return tempScore;
}

u32 IncreaseStatUpScore(u32 battlerAtk, u32 battlerDef, enum StatChange statId)
{
    return IncreaseStatUpScoreInternal(battlerAtk, battlerDef, statId, TRUE);
}

u32 IncreaseStatUpScoreContrary(u32 battlerAtk, u32 battlerDef, enum StatChange statId)
{
    return IncreaseStatUpScoreInternal(battlerAtk, battlerDef, statId, FALSE);
}

void IncreasePoisonScore(u32 battlerAtk, u32 battlerDef, u32 move, s32 *score)
{
    if (((AI_THINKING_STRUCT->aiFlags[battlerAtk] & AI_FLAG_TRY_TO_FAINT) && CanAIFaintTarget(battlerAtk, battlerDef, 0))
            || AI_DATA->holdEffects[battlerDef] == HOLD_EFFECT_CURE_PSN || AI_DATA->holdEffects[battlerDef] == HOLD_EFFECT_CURE_STATUS)
        return;

    if (AI_CanPoison(battlerAtk, battlerDef, AI_DATA->abilities[battlerDef], move, AI_DATA->partnerMove) && AI_DATA->hpPercents[battlerDef] > 20)
    {
        if (!HasDamagingMove(battlerDef))
            ADJUST_SCORE_PTR(DECENT_EFFECT);

        if (AI_THINKING_STRUCT->aiFlags[battlerAtk] & AI_FLAG_STALL && HasMoveEffect(battlerAtk, EFFECT_PROTECT))
            ADJUST_SCORE_PTR(WEAK_EFFECT);    // stall tactic

        if (IsPowerBasedOnStatus(battlerAtk, EFFECT_DOUBLE_POWER_ON_ARG_STATUS, STATUS1_PSN_ANY)
          || HasMoveEffect(battlerAtk, EFFECT_VENOM_DRENCH)
          || AI_DATA->abilities[battlerAtk] == ABILITY_MERCILESS)
            ADJUST_SCORE_PTR(DECENT_EFFECT);
        else
            ADJUST_SCORE_PTR(WEAK_EFFECT);
    }
}

void IncreaseBurnScore(u32 battlerAtk, u32 battlerDef, u32 move, s32 *score)
{
    if (((AI_THINKING_STRUCT->aiFlags[battlerAtk] & AI_FLAG_TRY_TO_FAINT) && CanAIFaintTarget(battlerAtk, battlerDef, 0))
            || AI_DATA->holdEffects[battlerDef] == HOLD_EFFECT_CURE_BRN || AI_DATA->holdEffects[battlerDef] == HOLD_EFFECT_CURE_STATUS)
        return;

    if (AI_CanBurn(battlerAtk, battlerDef, AI_DATA->abilities[battlerDef], BATTLE_PARTNER(battlerAtk), move, AI_DATA->partnerMove))
    {
        if (HasMoveWithCategory(battlerDef, DAMAGE_CATEGORY_PHYSICAL)
            || (!(AI_THINKING_STRUCT->aiFlags[battlerAtk] & AI_FLAG_OMNISCIENT) // Not Omniscient but expects physical attacker
                && gSpeciesInfo[gBattleMons[battlerDef].species].baseAttack >= gSpeciesInfo[gBattleMons[battlerDef].species].baseSpAttack + 10))
        {
            if (GetMoveCategory(GetBestDmgMoveFromBattler(battlerDef, battlerAtk, AI_DEFENDING)) == DAMAGE_CATEGORY_PHYSICAL)
                ADJUST_SCORE_PTR(DECENT_EFFECT);
            else
                ADJUST_SCORE_PTR(WEAK_EFFECT);
        }

        if (IsPowerBasedOnStatus(battlerAtk, EFFECT_DOUBLE_POWER_ON_ARG_STATUS, STATUS1_BURN)
          || IsPowerBasedOnStatus(BATTLE_PARTNER(battlerAtk), EFFECT_DOUBLE_POWER_ON_ARG_STATUS, STATUS1_BURN))
            ADJUST_SCORE_PTR(WEAK_EFFECT);
    }
}

void IncreaseParalyzeScore(u32 battlerAtk, u32 battlerDef, u32 move, s32 *score)
{
    if (((AI_THINKING_STRUCT->aiFlags[battlerAtk] & AI_FLAG_TRY_TO_FAINT) && CanAIFaintTarget(battlerAtk, battlerDef, 0))
            || AI_DATA->holdEffects[battlerDef] == HOLD_EFFECT_CURE_PAR || AI_DATA->holdEffects[battlerDef] == HOLD_EFFECT_CURE_STATUS)
        return;

    if (AI_CanParalyze(battlerAtk, battlerDef, AI_DATA->abilities[battlerDef], move, AI_DATA->partnerMove))
    {
        u32 atkSpeed = AI_DATA->speedStats[battlerAtk];
        u32 defSpeed = AI_DATA->speedStats[battlerDef];

        if ((defSpeed >= atkSpeed && defSpeed / 2 < atkSpeed) // You'll go first after paralyzing foe
          || IsPowerBasedOnStatus(battlerAtk, EFFECT_DOUBLE_POWER_ON_ARG_STATUS, STATUS1_PARALYSIS)
          || (HasMoveWithMoveEffectExcept(battlerAtk, MOVE_EFFECT_FLINCH, EFFECT_FIRST_TURN_ONLY)) // filter out Fake Out
          || gBattleMons[battlerDef].status2 & STATUS2_INFATUATION
          || gBattleMons[battlerDef].status2 & STATUS2_CONFUSION)
            ADJUST_SCORE_PTR(GOOD_EFFECT);
        else
            ADJUST_SCORE_PTR(DECENT_EFFECT);
    }
}

void IncreaseSleepScore(u32 battlerAtk, u32 battlerDef, u32 move, s32 *score)
{
    if (((AI_THINKING_STRUCT->aiFlags[battlerAtk] & AI_FLAG_TRY_TO_FAINT) && CanAIFaintTarget(battlerAtk, battlerDef, 0) && GetMoveEffect(GetBestDmgMoveFromBattler(battlerAtk, battlerDef, AI_ATTACKING)) != EFFECT_FOCUS_PUNCH)
            || AI_DATA->holdEffects[battlerDef] == HOLD_EFFECT_CURE_SLP || AI_DATA->holdEffects[battlerDef] == HOLD_EFFECT_CURE_STATUS)
        return;

    if (AI_CanPutToSleep(battlerAtk, battlerDef, AI_DATA->abilities[battlerDef], move, AI_DATA->partnerMove))
        ADJUST_SCORE_PTR(DECENT_EFFECT);
    else
        return;

    if ((HasMoveEffect(battlerAtk, EFFECT_DREAM_EATER) || HasMoveEffect(battlerAtk, EFFECT_NIGHTMARE))
      && !(HasMoveEffect(battlerDef, EFFECT_SNORE) || HasMoveEffect(battlerDef, EFFECT_SLEEP_TALK)))
        ADJUST_SCORE_PTR(WEAK_EFFECT);

    if (IsPowerBasedOnStatus(battlerAtk, EFFECT_DOUBLE_POWER_ON_ARG_STATUS, STATUS1_SLEEP)
      || IsPowerBasedOnStatus(BATTLE_PARTNER(battlerAtk), EFFECT_DOUBLE_POWER_ON_ARG_STATUS, STATUS1_SLEEP))
        ADJUST_SCORE_PTR(WEAK_EFFECT);
}

void IncreaseConfusionScore(u32 battlerAtk, u32 battlerDef, u32 move, s32 *score)
{
    if (((AI_THINKING_STRUCT->aiFlags[battlerAtk] & AI_FLAG_TRY_TO_FAINT) && CanAIFaintTarget(battlerAtk, battlerDef, 0))
            || AI_DATA->holdEffects[battlerDef] == HOLD_EFFECT_CURE_CONFUSION || AI_DATA->holdEffects[battlerDef] == HOLD_EFFECT_CURE_STATUS)
        return;

    if (AI_CanConfuse(battlerAtk, battlerDef, AI_DATA->abilities[battlerDef], BATTLE_PARTNER(battlerAtk), move, AI_DATA->partnerMove)
      && AI_DATA->holdEffects[battlerDef] != HOLD_EFFECT_CURE_CONFUSION
      && AI_DATA->holdEffects[battlerDef] != HOLD_EFFECT_CURE_STATUS)
    {
        if (gBattleMons[battlerDef].status1 & STATUS1_PARALYSIS
          || gBattleMons[battlerDef].status2 & STATUS2_INFATUATION
          || (AI_DATA->abilities[battlerAtk] == ABILITY_SERENE_GRACE && HasMoveWithMoveEffectExcept(battlerAtk, MOVE_EFFECT_FLINCH, EFFECT_FIRST_TURN_ONLY)))
            ADJUST_SCORE_PTR(GOOD_EFFECT);
        else
            ADJUST_SCORE_PTR(DECENT_EFFECT);
    }
}

void IncreaseFrostbiteScore(u32 battlerAtk, u32 battlerDef, u32 move, s32 *score)
{
    if ((AI_THINKING_STRUCT->aiFlags[battlerAtk] & AI_FLAG_TRY_TO_FAINT) && CanAIFaintTarget(battlerAtk, battlerDef, 0))
        return;

    if (AI_CanGiveFrostbite(battlerAtk, battlerDef, AI_DATA->abilities[battlerDef], BATTLE_PARTNER(battlerAtk), move, AI_DATA->partnerMove))
    {
        if (HasMoveWithCategory(battlerDef, DAMAGE_CATEGORY_SPECIAL)
            || (!(AI_THINKING_STRUCT->aiFlags[battlerAtk] & AI_FLAG_OMNISCIENT) // Not Omniscient but expects special attacker
                && gSpeciesInfo[gBattleMons[battlerDef].species].baseSpAttack >= gSpeciesInfo[gBattleMons[battlerDef].species].baseAttack + 10))
        {
            if (GetMoveCategory(GetBestDmgMoveFromBattler(battlerDef, battlerAtk, AI_DEFENDING)) == DAMAGE_CATEGORY_SPECIAL)
                ADJUST_SCORE_PTR(DECENT_EFFECT);
            else
                ADJUST_SCORE_PTR(WEAK_EFFECT);
        }

        if (IsPowerBasedOnStatus(battlerAtk, EFFECT_DOUBLE_POWER_ON_ARG_STATUS, STATUS1_FROSTBITE)
          || IsPowerBasedOnStatus(BATTLE_PARTNER(battlerAtk), EFFECT_DOUBLE_POWER_ON_ARG_STATUS, STATUS1_FROSTBITE))
            ADJUST_SCORE_PTR(WEAK_EFFECT);
    }
}

bool32 AI_MoveMakesContact(u32 ability, enum ItemHoldEffect holdEffect, u32 move)
{
    if (MoveMakesContact(move)
      && ability != ABILITY_LONG_REACH
      && holdEffect != HOLD_EFFECT_PROTECTIVE_PADS)
        return TRUE;
    return FALSE;
}

//TODO - this could use some more sophisticated logic
bool32 ShouldUseZMove(u32 battlerAtk, u32 battlerDef, u32 chosenMove)
{
    // simple logic. just upgrades chosen move to z move if possible, unless regular move would kill opponent
    if ((IsDoubleBattle()) && battlerDef == BATTLE_PARTNER(battlerAtk))
        return FALSE;   // don't use z move on partner
    if (HasTrainerUsedGimmick(battlerAtk, GIMMICK_Z_MOVE))
        return FALSE;   // can't use z move twice

    if (IsViableZMove(battlerAtk, chosenMove))
    {
        uq4_12_t effectiveness;
        u32 zMove = GetUsableZMove(battlerAtk, chosenMove);
        struct SimulatedDamage dmg;

        if (gBattleMons[battlerDef].ability == ABILITY_DISGUISE
            && !MoveIgnoresTargetAbility(zMove)
            && (gBattleMons[battlerDef].species == SPECIES_MIMIKYU_DISGUISED || gBattleMons[battlerDef].species == SPECIES_MIMIKYU_TOTEM_DISGUISED))
            return FALSE; // Don't waste a Z-Move busting disguise
        if (gBattleMons[battlerDef].ability == ABILITY_ICE_FACE
            && !MoveIgnoresTargetAbility(zMove)
            && gBattleMons[battlerDef].species == SPECIES_EISCUE_ICE && IsBattleMovePhysical(chosenMove))
            return FALSE; // Don't waste a Z-Move busting Ice Face

        if (IsBattleMoveStatus(chosenMove) && !IsBattleMoveStatus(zMove))
            return FALSE;
        else if (!IsBattleMoveStatus(chosenMove) && IsBattleMoveStatus(zMove))
            return FALSE;

        dmg = AI_CalcDamageSaveBattlers(chosenMove, battlerAtk, battlerDef, &effectiveness, FALSE);

        if (!IsBattleMoveStatus(chosenMove) && dmg.minimum >= gBattleMons[battlerDef].hp)
            return FALSE;   // don't waste damaging z move if can otherwise faint target

        return TRUE;
    }

    return FALSE;
}

bool32 AI_IsBattlerAsleepOrComatose(u32 battlerId)
{
    return (gBattleMons[battlerId].status1 & STATUS1_SLEEP) || AI_DATA->abilities[battlerId] == ABILITY_COMATOSE;
}

s32 AI_TryToClearStats(u32 battlerAtk, u32 battlerDef, bool32 isDoubleBattle)
{
    if (isDoubleBattle)
        return min(CountPositiveStatStages(battlerDef) + CountPositiveStatStages(BATTLE_PARTNER(battlerDef)), 7);
    else
        return min(CountPositiveStatStages(battlerDef), 4);
}

bool32 AI_ShouldCopyStatChanges(u32 battlerAtk, u32 battlerDef)
{
    u8 i;
    // Want to copy positive stat changes
    for (i = STAT_ATK; i < NUM_BATTLE_STATS; i++)
    {
        if (gBattleMons[battlerDef].statStages[i] > gBattleMons[battlerAtk].statStages[i])
        {
            switch (i)
            {
            case STAT_ATK:
                return (HasMoveWithCategory(battlerAtk, DAMAGE_CATEGORY_PHYSICAL));
            case STAT_SPATK:
                return (HasMoveWithCategory(battlerAtk, DAMAGE_CATEGORY_SPECIAL));
            case STAT_ACC:
                return (HasLowAccuracyMove(battlerAtk, battlerDef));
            case STAT_EVASION:
            case STAT_SPEED:
                return TRUE;
            case STAT_DEF:
            case STAT_SPDEF:
                return (AI_THINKING_STRUCT->aiFlags[battlerAtk] & AI_FLAG_STALL);
            }
        }
    }

    return FALSE;
}

//TODO - track entire opponent party data to determine hazard effectiveness
bool32 AI_ShouldSetUpHazards(u32 battlerAtk, u32 battlerDef, struct AiLogicData *aiData)
{
    if (aiData->abilities[battlerDef] == ABILITY_MAGIC_BOUNCE
     || CountUsablePartyMons(battlerDef) == 0
     || HasMoveEffect(battlerDef, EFFECT_RAPID_SPIN)
     || HasMoveEffect(battlerDef, EFFECT_TIDY_UP)
     || HasMoveEffect(battlerDef, EFFECT_DEFOG)
     || HasMoveWithAdditionalEffect(battlerDef, MOVE_EFFECT_DEFOG)
     || HasMoveEffect(battlerDef, EFFECT_MAGIC_COAT))
        return FALSE;

    return TRUE;
}

void IncreaseTidyUpScore(u32 battlerAtk, u32 battlerDef, u32 move, s32 *score)
{
    if (gSideStatuses[GetBattlerSide(battlerAtk)] & SIDE_STATUS_HAZARDS_ANY && CountUsablePartyMons(battlerAtk) != 0)
        ADJUST_SCORE_PTR(GOOD_EFFECT);
    if (gSideStatuses[GetBattlerSide(battlerDef)] & SIDE_STATUS_HAZARDS_ANY && CountUsablePartyMons(battlerDef) != 0)
        ADJUST_SCORE_PTR(-2);

    if (gBattleMons[battlerAtk].status2 & STATUS2_SUBSTITUTE && AI_IsFaster(battlerAtk, battlerDef, move))
        ADJUST_SCORE_PTR(-10);
    if (gBattleMons[battlerDef].status2 & STATUS2_SUBSTITUTE)
        ADJUST_SCORE_PTR(GOOD_EFFECT);

    if (gStatuses3[battlerAtk] & STATUS3_LEECHSEED)
        ADJUST_SCORE_PTR(DECENT_EFFECT);
    if (gStatuses3[battlerDef] & STATUS3_LEECHSEED)
        ADJUST_SCORE_PTR(-2);
}

bool32 AI_ShouldSpicyExtract(u32 battlerAtk, u32 battlerAtkPartner, u32 move, struct AiLogicData *aiData)
{
    u32 preventsStatLoss;
    u32 partnerAbility;
    u32 partnerHoldEffect = aiData->holdEffects[battlerAtkPartner];

    if (DoesBattlerIgnoreAbilityChecks(battlerAtk, aiData->abilities[battlerAtk], move))
        partnerAbility = ABILITY_NONE;
    else
        partnerAbility = aiData->abilities[battlerAtkPartner];

    if (gBattleMons[battlerAtkPartner].statStages[STAT_ATK] == MAX_STAT_STAGE
     || partnerAbility == ABILITY_CONTRARY
     || partnerAbility == ABILITY_GOOD_AS_GOLD
     || HasMoveEffect(BATTLE_OPPOSITE(battlerAtk), EFFECT_FOUL_PLAY)
     || HasMoveEffect(BATTLE_OPPOSITE(battlerAtkPartner), EFFECT_FOUL_PLAY))
        return FALSE;

    preventsStatLoss = (partnerAbility == ABILITY_CLEAR_BODY
                     || partnerAbility == ABILITY_FULL_METAL_BODY
                     || partnerAbility == ABILITY_WHITE_SMOKE
                     || partnerHoldEffect == HOLD_EFFECT_CLEAR_AMULET);

    switch (GetMoveEffect(aiData->partnerMove))
    {
    case EFFECT_DEFENSE_UP:
    case EFFECT_DEFENSE_UP_2:
    case EFFECT_DEFENSE_UP_3:
    case EFFECT_BULK_UP:
    case EFFECT_STOCKPILE:
        if (!preventsStatLoss)
            return FALSE;
    default:
        break;
    }

    return (preventsStatLoss
         && AI_IsFaster(battlerAtk, battlerAtkPartner, TRUE)
         && HasMoveWithCategory(battlerAtkPartner, DAMAGE_CATEGORY_PHYSICAL));
}

u32 IncreaseSubstituteMoveScore(u32 battlerAtk, u32 battlerDef, u32 move)
{
    enum BattleMoveEffects effect = GetMoveEffect(move);
    u32 scoreIncrease = 0;
    if (effect == EFFECT_SUBSTITUTE) // Substitute specific
    {
        if (HasAnyKnownMove(battlerDef) && GetBestDmgFromBattler(battlerDef, battlerAtk, AI_DEFENDING) < gBattleMons[battlerAtk].maxHP / 4)
            scoreIncrease += GOOD_EFFECT;
    }
    else if (effect == EFFECT_SHED_TAIL) // Shed Tail specific
    {
        if ((ShouldPivot(battlerAtk, battlerDef, AI_DATA->abilities[battlerDef], move, AI_THINKING_STRUCT->movesetIndex))
        && (HasAnyKnownMove(battlerDef) && (GetBestDmgFromBattler(battlerDef, battlerAtk, AI_DEFENDING) < gBattleMons[battlerAtk].maxHP / 2)))
            scoreIncrease += BEST_EFFECT;
    }

    if (gStatuses3[battlerDef] & STATUS3_PERISH_SONG)
        scoreIncrease += GOOD_EFFECT;

    if (gBattleMons[battlerDef].status1 & STATUS1_SLEEP)
        scoreIncrease += GOOD_EFFECT;
    else if (gBattleMons[battlerDef].status1 & (STATUS1_BURN | STATUS1_PSN_ANY | STATUS1_FROSTBITE))
        scoreIncrease += DECENT_EFFECT;

    if (IsBattlerPredictedToSwitch(battlerDef))
        scoreIncrease += DECENT_EFFECT;

    if (HasMoveEffect(battlerDef, EFFECT_SLEEP)
     || HasMoveEffect(battlerDef, EFFECT_TOXIC)
     || HasMoveEffect(battlerDef, EFFECT_POISON)
     || HasMoveEffect(battlerDef, EFFECT_PARALYZE)
     || HasMoveEffect(battlerDef, EFFECT_WILL_O_WISP)
     || HasMoveEffect(battlerDef, EFFECT_CONFUSE)
     || HasMoveEffect(battlerDef, EFFECT_LEECH_SEED))
        scoreIncrease += GOOD_EFFECT;

    if (AI_DATA->hpPercents[battlerAtk] > 70)
        scoreIncrease += WEAK_EFFECT;
    return scoreIncrease;
}

bool32 HasLowAccuracyMove(u32 battlerAtk, u32 battlerDef)
{
    int i;
    for (i = 0; i < MAX_MON_MOVES; i++)
    {
        if (AI_DATA->moveAccuracy[battlerAtk][battlerDef][i] <= LOW_ACCURACY_THRESHOLD)
            return TRUE;
    }
    return FALSE;
}

bool32 IsBattlerItemEnabled(u32 battler)
{
    if (AI_THINKING_STRUCT->aiFlags[battler] & AI_FLAG_NEGATE_UNAWARE)
        return TRUE;
    if (gFieldStatuses & STATUS_FIELD_MAGIC_ROOM)
        return FALSE;
    if (gStatuses3[battler] & STATUS3_EMBARGO)
        return FALSE;
    if (gBattleMons[battler].ability == ABILITY_KLUTZ && !(gStatuses3[battler] & STATUS3_GASTRO_ACID))
        return FALSE;
    return TRUE;
}

bool32 HasBattlerSideAbility(u32 battler, u32 ability, struct AiLogicData *aiData)
{
    if (aiData->abilities[battler] == ability)
        return TRUE;
    if (IsDoubleBattle() && AI_DATA->abilities[BATTLE_PARTNER(battler)] == ability)
        return TRUE;
    return FALSE;
}
