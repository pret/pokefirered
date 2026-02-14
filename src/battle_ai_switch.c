#include "global.h"
#include "battle.h"
#include "constants/battle_ai.h"
#include "battle_ai_main.h"
#include "battle_ai_switch.h"
#include "battle_ai_util.h"
#include "battle_util.h"
#include "battle_anim.h"
#include "battle_controllers.h"
#include "battle_main.h"
#include "battle_setup.h"
#include "data.h"
#include "item.h"
#include "party_menu.h"
#include "pokemon.h"
#include "random.h"
#include "util.h"
#include "constants/abilities.h"
#include "constants/item_effects.h"
#include "constants/battle_move_effects.h"
#include "constants/items.h"
#include "constants/moves.h"

// this file's functions
struct IncomingHealInfo
{
    u16 healAmount:16;
    u16 wishCounter:8;
    u16 hasHealing:1;
    u16 healBeforeHazards:1;
    u16 healAfterHazards:1;
    u16 healEndOfTurn:1;
    u16 curesStatus:1;
};
static bool32 CanUseSuperEffectiveMoveAgainstOpponents(enum BattlerId battler);
static bool32 FindMonWithFlagsAndSuperEffective(enum BattlerId battler, u16 flags, u32 moduloPercent);
static u32 GetSwitchinHazardsDamage(enum BattlerId battler);
static bool32 AI_CanSwitchinAbilityTrapOpponent(enum Ability ability, enum BattlerId opposingBattler);
static u32 GetBattlerTypeMatchup(enum BattlerId opposingBattler, enum BattlerId battler);
static u32 GetSwitchinHitsToKO(s32 damageTaken, enum BattlerId battler, const struct IncomingHealInfo *healInfo, u32 originalHp);
static void GetIncomingHealInfo(enum BattlerId battler, struct IncomingHealInfo *healInfo);
static u32 GetWishHealAmountForBattler(enum BattlerId battler);

static void InitializeSwitchinCandidate(enum BattlerId switchinBattler, struct Pokemon *mon)
{
    PokemonToBattleMon(mon, &gBattleMons[switchinBattler]);
    // Setup switchin battler data
    gAiThinkingStruct->saved[switchinBattler].saved = TRUE;
    SetBattlerAiData(switchinBattler, gAiLogicData);
    SetBattlerFieldStatusForSwitchin(switchinBattler);
    for (enum BattlerId battlerIndex = 0; battlerIndex < gBattlersCount; battlerIndex++)
    {
        if (switchinBattler == battlerIndex || !IsBattlerAlive(battlerIndex))
            continue;

        CalcBattlerAiMovesData(gAiLogicData, switchinBattler, battlerIndex, AI_GetSwitchinWeather(switchinBattler), AI_GetSwitchinFieldStatus(switchinBattler));
        CalcBattlerAiMovesData(gAiLogicData, battlerIndex, switchinBattler, AI_GetSwitchinWeather(switchinBattler), AI_GetSwitchinFieldStatus(switchinBattler));
    }

    gAiThinkingStruct->saved[switchinBattler].saved = FALSE;
}

static u32 GetWishHealAmountForBattler(enum BattlerId battler)
{
    u32 wishHeal = 0;

    if (gBattleStruct->wish[battler].counter == 0)
        return wishHeal;

    if (B_WISH_HP_SOURCE >= GEN_5)
    {
        if (IsOnPlayerSide(battler))
            wishHeal = GetMonData(&gPlayerParty[gBattleStruct->wish[battler].partyId], MON_DATA_MAX_HP) / 2;
        else
            wishHeal = GetMonData(&gEnemyParty[gBattleStruct->wish[battler].partyId], MON_DATA_MAX_HP) / 2;
    }
    else
    {
        wishHeal = GetNonDynamaxMaxHP(battler) / 2;
    }

    return wishHeal;
}

static void GetIncomingHealInfo(enum BattlerId battler, struct IncomingHealInfo *healInfo)
{
    memset(healInfo, 0, sizeof(*healInfo));

    // Healing Wish / Lunar Dance heal to full and clear status before hazards
    if (gBattleStruct->battlerState[battler].storedHealingWish)
    {
        healInfo->hasHealing = TRUE;
        healInfo->healBeforeHazards = TRUE;
        healInfo->curesStatus = TRUE;
    }
    if (gBattleStruct->battlerState[battler].storedLunarDance)
    {
        healInfo->hasHealing = TRUE;
        healInfo->healBeforeHazards = TRUE;
        healInfo->curesStatus = TRUE;
    }

    // Z-Parting Shot / Z-Memento heal after hazards on switch-in
    if (gBattleStruct->zmove.healReplacement)
    {
        healInfo->hasHealing = TRUE;
        healInfo->healAfterHazards = TRUE;
    }

    // Wish heals at end of turn
    if (gBattleStruct->wish[battler].counter > 0)
    {
        healInfo->hasHealing = TRUE;
        healInfo->healEndOfTurn = TRUE;
        healInfo->wishCounter = gBattleStruct->wish[battler].counter;
        healInfo->healAmount = GetWishHealAmountForBattler(battler);
    }
}

u32 GetSwitchChance(enum ShouldSwitchScenario shouldSwitchScenario)
{
    // Modify these cases if you want unique behaviour based on other data (trainer class, difficulty, etc.)
    switch(shouldSwitchScenario)
    {
        case SHOULD_SWITCH_WONDER_GUARD:
            return SHOULD_SWITCH_WONDER_GUARD_PERCENTAGE;
        case SHOULD_SWITCH_ABSORBS_MOVE:
            return SHOULD_SWITCH_ABSORBS_MOVE_PERCENTAGE;
        case SHOULD_SWITCH_TRAPPER:
            return SHOULD_SWITCH_TRAPPER_PERCENTAGE;
        case SHOULD_SWITCH_FREE_TURN:
            return SHOULD_SWITCH_FREE_TURN_PERCENTAGE;
        case SHOULD_SWITCH_TRUANT:
            return SHOULD_SWITCH_TRUANT_PERCENTAGE;
        case SHOULD_SWITCH_ALL_MOVES_BAD:
            return SHOULD_SWITCH_ALL_MOVES_BAD_PERCENTAGE;
        case SHOULD_SWITCH_PERISH_SONG:
            return SHOULD_SWITCH_PERISH_SONG_PERCENTAGE;
        case SHOULD_SWITCH_YAWN:
            return SHOULD_SWITCH_YAWN_PERCENTAGE;
        case SHOULD_SWITCH_BADLY_POISONED:
            return SHOULD_SWITCH_BADLY_POISONED_PERCENTAGE;
        case SHOULD_SWITCH_BADLY_POISONED_STATS_RAISED:
            return SHOULD_SWITCH_BADLY_POISONED_STATS_RAISED_PERCENTAGE;
        case SHOULD_SWITCH_CURSED:
            return SHOULD_SWITCH_CURSED_PERCENTAGE;
        case SHOULD_SWITCH_CURSED_STATS_RAISED:
            return SHOULD_SWITCH_CURSED_STATS_RAISED_PERCENTAGE;
        case SHOULD_SWITCH_NIGHTMARE:
            return SHOULD_SWITCH_NIGHTMARE_PERCENTAGE;
        case SHOULD_SWITCH_NIGHTMARE_STATS_RAISED:
            return SHOULD_SWITCH_NIGHTMARE_STATS_RAISED_PERCENTAGE;
        case SHOULD_SWITCH_SEEDED:
            return SHOULD_SWITCH_SEEDED_PERCENTAGE;
        case SHOULD_SWITCH_SEEDED_STATS_RAISED:
            return SHOULD_SWITCH_SEEDED_STATS_RAISED_PERCENTAGE;
        case SHOULD_SWITCH_INFATUATION:
            return SHOULD_SWITCH_INFATUATION_PERCENTAGE;
        case SHOULD_SWITCH_HASBADODDS:
            return SHOULD_SWITCH_HASBADODDS_PERCENTAGE;
        case SHOULD_SWITCH_NATURAL_CURE_STRONG:
            return SHOULD_SWITCH_NATURAL_CURE_STRONG_PERCENTAGE;
        case SHOULD_SWITCH_NATURAL_CURE_STRONG_STATS_RAISED:
            return SHOULD_SWITCH_NATURAL_CURE_STRONG_STATS_RAISED_PERCENTAGE;
        case SHOULD_SWITCH_NATURAL_CURE_WEAK:
            return SHOULD_SWITCH_NATURAL_CURE_WEAK_PERCENTAGE;
        case SHOULD_SWITCH_NATURAL_CURE_WEAK_STATS_RAISED:
            return SHOULD_SWITCH_NATURAL_CURE_WEAK_STATS_RAISED_PERCENTAGE;
        case SHOULD_SWITCH_REGENERATOR:
            return SHOULD_SWITCH_REGENERATOR_PERCENTAGE;
        case SHOULD_SWITCH_REGENERATOR_STATS_RAISED:
            return SHOULD_SWITCH_REGENERATOR_STATS_RAISED_PERCENTAGE;
        case SHOULD_SWITCH_ENCORE_STATUS:
            return SHOULD_SWITCH_ENCORE_STATUS_PERCENTAGE;
        case SHOULD_SWITCH_ENCORE_DAMAGE:
            return SHOULD_SWITCH_ENCORE_DAMAGE_PERCENTAGE;
        case SHOULD_SWITCH_CHOICE_LOCKED:
            return SHOULD_SWITCH_CHOICE_LOCKED_PERCENTAGE;
        case SHOULD_SWITCH_ATTACKING_STAT_MINUS_TWO:
            return SHOULD_SWITCH_ATTACKING_STAT_MINUS_TWO_PERCENTAGE;
        case SHOULD_SWITCH_ATTACKING_STAT_MINUS_THREE_PLUS:
            return SHOULD_SWITCH_ATTACKING_STAT_MINUS_THREE_PLUS_PERCENTAGE;
        case SHOULD_SWITCH_ALL_SCORES_BAD:
            return SHOULD_SWITCH_ALL_SCORES_BAD_PERCENTAGE;
        case SHOULD_SWITCH_DYN_FUNC:
            return SHOULD_SWITCH_DYN_FUNC_PERCENTAGE;
        default:
            return 100;
    }
}

bool32 IsAceMon(enum BattlerId battler, u32 monPartyId)
{
    if (gAiThinkingStruct->aiFlags[battler] & AI_FLAG_ACE_POKEMON
     && !gProtectStructs[battler].forcedSwitch
     && monPartyId == CalculateEnemyPartyCountInSide(battler)-1)
        return TRUE;
    if (gAiThinkingStruct->aiFlags[battler] & AI_FLAG_DOUBLE_ACE_POKEMON
     && !gProtectStructs[battler].forcedSwitch
     && (monPartyId == CalculateEnemyPartyCount()-1 || monPartyId == CalculateEnemyPartyCount()-2))
        return TRUE;
    return FALSE;
}

static bool32 AreStatsRaised(enum BattlerId battler)
{
    u8 buffedStatsValue = 0;

    for (u32 statIndex = 0; statIndex < NUM_BATTLE_STATS; statIndex++)
    {
        if (gBattleMons[battler].statStages[statIndex] > DEFAULT_STAT_STAGE)
            buffedStatsValue += gBattleMons[battler].statStages[statIndex] - DEFAULT_STAT_STAGE;
    }

    return (buffedStatsValue > STAY_IN_STATS_RAISED);
}

static inline bool32 SetSwitchinAndSwitch(enum BattlerId battler, u32 switchinId)
{
    gBattleStruct->AI_monToSwitchIntoId[battler] = switchinId;
    return TRUE;
}

static bool32 AI_DoesChoiceEffectBlockMove(enum BattlerId battler, enum Move move)
{
    // Choice locked into something else
    if (gAiLogicData->lastUsedMove[battler] != MOVE_NONE && gAiLogicData->lastUsedMove[battler] != move
    && (IsHoldEffectChoice(GetBattlerHoldEffect(battler) && IsBattlerItemEnabled(battler))
        || gAiLogicData->abilities[battler] == ABILITY_GORILLA_TACTICS))
        return TRUE;
    return FALSE;
}

static inline bool32 CanBattlerWin1v1(u32 hitsToKOAI, u32 hitsToKOPlayer, bool32 isBattlerFirst)
{
    // Player's best move deals 0 damage
    if (hitsToKOAI == 0 && hitsToKOPlayer > 0)
        return TRUE;

    // AI's best move deals 0 damage
    if (hitsToKOPlayer == 0 && hitsToKOAI > 0)
        return FALSE;

    // Neither mon can damage the other
    if (hitsToKOPlayer == 0 && hitsToKOAI == 0)
        return FALSE;

    // Different KO thresholds depending on who goes first
    if (isBattlerFirst)
    {
        if (hitsToKOAI >= hitsToKOPlayer)
            return TRUE;
    }
    else
    {
        if (hitsToKOAI > hitsToKOPlayer)
            return TRUE;
    }
    return FALSE;
}

// Note that as many return statements as possible are INTENTIONALLY put after all of the loops;
// the function can take a max of about 0.06s to run, and this prevents the player from identifying
// whether the mon will switch or not by seeing how long the delay is before they select a move
static bool32 ShouldSwitchIfHasBadOdds(enum BattlerId battler)
{
    //Variable initialization
    enum BattlerPosition opposingPosition = BATTLE_OPPOSITE(GetBattlerPosition(battler));
    enum BattlerId opposingBattler = GetBattlerAtPosition(opposingPosition);
    enum Move *playerMoves = GetMovesArray(opposingBattler);
    enum Move aiMove, playerMove, bestPlayerPriorityMove = MOVE_NONE, bestPlayerMove = MOVE_NONE, expectedMove = MOVE_NONE;
    enum Ability aiAbility = gAiLogicData->abilities[battler];
    bool32 hasStatusMove = FALSE, hasSuperEffectiveMove = FALSE;
    u32 typeMatchup;
    enum BattleMoveEffects aiMoveEffect;
    u32 hitsToKOAI = 0, hitsToKOPlayer = 0, minHitsToKOAI = gBattleMons[battler].hp, minHitsToKOAIPriority = gBattleMons[battler].hp;
    bool32 canBattlerWin1v1 = FALSE, isBattlerFirst, isBattlerFirstPriority;

    // Only use this if AI_FLAG_SMART_SWITCHING is set for the trainer
    if (!(gAiThinkingStruct->aiFlags[battler] & AI_FLAG_SMART_SWITCHING))
        return FALSE;

    // Double Battles aren't included in AI_FLAG_SMART_MON_CHOICE. Defaults to regular switch in logic
    if (IsDoubleBattle())
        return FALSE;

    // Get max damage mon could take
    for (u32 moveIndex = 0; moveIndex < MAX_MON_MOVES; moveIndex++)
    {
        playerMove = SMART_SWITCHING_OMNISCIENT ? gBattleMons[opposingBattler].moves[moveIndex] : playerMoves[moveIndex];
        if (playerMove != MOVE_NONE && !IsBattleMoveStatus(playerMove) && GetMoveEffect(playerMove) != EFFECT_FOCUS_PUNCH && gBattleMons[opposingBattler].pp[moveIndex] > 0)
        {
            hitsToKOAI = GetNoOfHitsToKOBattler(opposingBattler, battler, moveIndex, AI_DEFENDING, CONSIDER_ENDURE);
            if (hitsToKOAI < minHitsToKOAI && !AI_DoesChoiceEffectBlockMove(opposingBattler, playerMove))
            {
                bestPlayerMove = playerMove;
                minHitsToKOAI = hitsToKOAI;
            }
            if (GetBattleMovePriority(opposingBattler, gAiLogicData->abilities[opposingBattler], playerMove) > 0 && hitsToKOAI < minHitsToKOAIPriority && !AI_DoesChoiceEffectBlockMove(opposingBattler, playerMove))
            {
                bestPlayerPriorityMove = playerMove;
                minHitsToKOAIPriority = hitsToKOAI;
            }
        }
    }

    expectedMove = gAiThinkingStruct->aiFlags[battler] & AI_FLAG_PREDICT_MOVE ? GetIncomingMove(battler, opposingBattler, gAiLogicData) : bestPlayerMove;

    for (u32 moveIndex = 0; moveIndex < MAX_MON_MOVES; moveIndex++)
    {
        aiMove = gBattleMons[battler].moves[moveIndex];
        aiMoveEffect = GetMoveEffect(aiMove);
        if (aiMove != MOVE_NONE && gBattleMons[battler].pp[moveIndex] > 0)
        {
            enum MoveEffect nonVolatileStatus = GetMoveNonVolatileStatus(aiMove);
            // Check if mon has an "important" status move
            if (aiMoveEffect == EFFECT_REFLECT || aiMoveEffect == EFFECT_LIGHT_SCREEN
            || aiMoveEffect == EFFECT_SPIKES || aiMoveEffect == EFFECT_TOXIC_SPIKES || aiMoveEffect == EFFECT_STEALTH_ROCK || aiMoveEffect == EFFECT_STICKY_WEB || aiMoveEffect == EFFECT_LEECH_SEED
            || IsExplosionMove(aiMove)
            || nonVolatileStatus == MOVE_EFFECT_SLEEP
            || nonVolatileStatus == MOVE_EFFECT_TOXIC
            || nonVolatileStatus == MOVE_EFFECT_PARALYSIS
            || nonVolatileStatus == MOVE_EFFECT_BURN
            || aiMoveEffect == EFFECT_YAWN
            || aiMoveEffect == EFFECT_TRICK || aiMoveEffect == EFFECT_TRICK_ROOM || aiMoveEffect== EFFECT_WONDER_ROOM || aiMoveEffect ==  EFFECT_PSYCHO_SHIFT || aiMoveEffect == EFFECT_FIRST_TURN_ONLY
            )
            {
                hasStatusMove = TRUE;
            }

            // Only check damage if it's a damaging move
            if (!IsBattleMoveStatus(aiMove) && !AI_DoesChoiceEffectBlockMove(battler, aiMove))
            {
                // Check if mon has a super effective move
                if (gAiLogicData->effectiveness[battler][opposingBattler][moveIndex] >= UQ_4_12(2.0))
                    hasSuperEffectiveMove = TRUE;

                // Check if can win 1v1
                hitsToKOPlayer = GetNoOfHitsToKOBattler(battler, opposingBattler, moveIndex, AI_ATTACKING, CONSIDER_ENDURE);
                if (!canBattlerWin1v1 ) // Once we can win a 1v1 we don't need to track this, but want to run the rest of the function to keep the runtime the same regardless of when we find the winning move
                {
                    isBattlerFirst = AI_IsFaster(battler, opposingBattler, aiMove, expectedMove, CONSIDER_PRIORITY);
                    isBattlerFirstPriority = AI_IsFaster(battler, opposingBattler, aiMove, bestPlayerPriorityMove, CONSIDER_PRIORITY);
                    canBattlerWin1v1 = CanBattlerWin1v1(minHitsToKOAI, hitsToKOPlayer, isBattlerFirst) && CanBattlerWin1v1(minHitsToKOAIPriority, hitsToKOPlayer, isBattlerFirstPriority);
                }
            }
        }
    }

    // Calculate type advantage
    typeMatchup = GetBattlerTypeMatchup(opposingBattler, battler);

    // Check if current mon can 1v1 in spite of bad matchup, and don't switch out if it can
    if (canBattlerWin1v1)
        return FALSE;

    // If we don't have any other viable options, don't switch out
    if (gAiLogicData->mostSuitableMonId[battler] == PARTY_SIZE)
        return FALSE;

    // Start assessing whether or not mon has bad odds
    // Jump straight to switching out in cases where mon gets OHKO'd
    if ((minHitsToKOAI == 1 && !canBattlerWin1v1) && (gBattleMons[battler].hp >= gBattleMons[battler].maxHP / 2 // And the current mon has at least 1/2 their HP, or 1/4 HP and Regenerator
            || (aiAbility == ABILITY_REGENERATOR && gBattleMons[battler].hp >= gBattleMons[battler].maxHP / 4)))
    {
        // 50% chance to stay in regardless
        if (RandomPercentage(RNG_AI_SWITCH_HASBADODDS, (100 - GetSwitchChance(SHOULD_SWITCH_HASBADODDS))) && !gAiLogicData->aiPredictionInProgress)
            return FALSE;

        // Switch mon out
        return SetSwitchinAndSwitch(battler, PARTY_SIZE);
    }

    // General bad type matchups have more wiggle room
    if (typeMatchup > UQ_4_12(2.0)) // If the player has favourable offensive matchup (2.0 is neutral, this must be worse)
    {
        if (!hasSuperEffectiveMove // If the AI doesn't have a super effective move
        && (gBattleMons[battler].hp >= gBattleMons[battler].maxHP / 2 // And the current mon has at least 1/2 their HP, or 1/4 HP and Regenerator
            || (aiAbility == ABILITY_REGENERATOR
            && gBattleMons[battler].hp >= gBattleMons[battler].maxHP / 4)))
        {
            // Then check if they have an important status move, which is worth using even in a bad matchup
            if (hasStatusMove)
                return FALSE;

            // 50% chance to stay in regardless
            if (RandomPercentage(RNG_AI_SWITCH_HASBADODDS, (100 - GetSwitchChance(SHOULD_SWITCH_HASBADODDS))) && !gAiLogicData->aiPredictionInProgress)
                return FALSE;

            // Switch mon out
            return SetSwitchinAndSwitch(battler, PARTY_SIZE);
        }
    }
    return FALSE;
}

static bool32 ShouldSwitchIfTruant(enum BattlerId battler)
{
    // Switch if mon with truant is bodied by Protect or invulnerability spam
    if (gAiLogicData->abilities[battler] == ABILITY_TRUANT
        && IsTruantMonVulnerable(battler, gBattlerTarget)
        && gBattleMons[battler].volatiles.truantCounter
        && gBattleMons[battler].hp >= gBattleMons[battler].maxHP / 2
        && gAiLogicData->mostSuitableMonId[battler] != PARTY_SIZE)
    {
        if (RandomPercentage(RNG_AI_SWITCH_TRUANT, GetSwitchChance(SHOULD_SWITCH_TRUANT)))
            return SetSwitchinAndSwitch(battler, PARTY_SIZE);
    }
    return FALSE;
}

static u32 FindMonWithMoveOfEffectiveness(enum BattlerId battler, enum BattlerId opposingBattler, uq4_12_t effectiveness)
{
    enum Move move;
    s32 firstId;
    s32 lastId; // + 1
    struct Pokemon *party = NULL;

    // Get party information.
    GetAIPartyIndexes(battler, &firstId, &lastId);
    party = GetBattlerParty(battler);

    // Find a Pokémon in the party that has a super effective move.
    for (u32 monIndex = firstId; monIndex < lastId; monIndex++)
    {
        if (!IsValidForBattle(&party[monIndex]))
            continue;
        if (monIndex == gBattlerPartyIndexes[battler])
            continue;
        if (IsAceMon(battler, monIndex))
            continue;

        for (u32 moveIndex = 0; moveIndex < MAX_MON_MOVES; moveIndex++)
        {
            move = GetMonData(&party[monIndex], MON_DATA_MOVE1 + moveIndex);
            if (move != MOVE_NONE && AI_GetMoveEffectiveness(move, battler, opposingBattler) >= effectiveness && GetMovePower(move) != 0)
                return SetSwitchinAndSwitch(battler, monIndex);
        }
    }

    return FALSE; // There is not a single Pokémon in the party that has a move with this effectiveness threshold
}

static bool32 CanMoveAffectTarget(struct BattleContext *ctx, u32 moveIndex)
{
    if (ctx->move != MOVE_NONE
        && gAiLogicData->effectiveness[ctx->battlerAtk][ctx->battlerDef][moveIndex] > UQ_4_12(0.0)
        && !AI_CanMoveBeBlockedByTarget(ctx))
        return TRUE;
    return FALSE;
}

static bool32 IsMoveBad(struct BattleContext *ctx, u32 moveIndex)
{
    if (CanMoveAffectTarget(ctx, moveIndex))
        return FALSE;
    if (!ALL_MOVES_BAD_STATUS_MOVES_BAD || GetMovePower(ctx->move) != 0) // If using ALL_MOVES_BAD_STATUS_MOVES_BAD, then need power to be non-zero
        return TRUE;
    return FALSE;
}

static bool32 ShouldSwitchIfAllMovesBad(enum BattlerId battler)
{
    enum BattlerId opposingBattler = GetOppositeBattler(battler);
    struct BattleContext ctx = {0};
    ctx.battlerAtk = battler;
    ctx.battlerDef = opposingBattler;
    ctx.abilityAtk = gAiLogicData->abilities[ctx.battlerAtk];
    ctx.abilityDef = gAiLogicData->abilities[ctx.battlerDef];
    ctx.holdEffectAtk = gAiLogicData->holdEffects[ctx.battlerAtk];
    ctx.holdEffectDef = gAiLogicData->holdEffects[ctx.battlerDef];

    // Switch if no moves affect opponents
    if (HasTwoOpponents(battler))
    {
        enum BattlerId opposingPartner = BATTLE_PARTNER(opposingBattler);
        for (u32 moveIndex = 0; moveIndex < MAX_MON_MOVES; moveIndex++)
        {
            ctx.move = ctx.chosenMove = gBattleMons[battler].moves[moveIndex];
            ctx.moveType = GetBattleMoveType(ctx.move);
            // Check if move is bad in the context of both opposing battlers
            if (!IsMoveBad(&ctx, moveIndex))
            {
                return FALSE;
            }
            else
            {
                // Set partner data in ctx
                ctx.battlerDef = opposingPartner;
                ctx.abilityDef = gAiLogicData->abilities[ctx.battlerDef];
                ctx.holdEffectDef = gAiLogicData->holdEffects[ctx.battlerDef];
                if (!IsMoveBad(&ctx, moveIndex))
                    return FALSE;
            }
        }
    }
    else
    {
        for (u32 moveIndex = 0; moveIndex < MAX_MON_MOVES; moveIndex++)
        {
            ctx.move = ctx.chosenMove = gBattleMons[battler].moves[moveIndex];
            ctx.moveType = GetBattleMoveType(ctx.move);
            if (!IsMoveBad(&ctx, moveIndex))
                return FALSE;
        }
    }

    if (RandomPercentage(RNG_AI_SWITCH_ALL_MOVES_BAD, GetSwitchChance(SHOULD_SWITCH_ALL_MOVES_BAD))
        && (gAiLogicData->mostSuitableMonId[battler] != PARTY_SIZE || !ALL_MOVES_BAD_NEEDS_GOOD_SWITCHIN))
    {
        if (gAiLogicData->mostSuitableMonId[battler] == PARTY_SIZE) // No good candidate mons, find any one that can deal damage
            return FindMonWithMoveOfEffectiveness(battler, opposingBattler, UQ_4_12(1.0));
        else // Good candidate mon, send that in
            return SetSwitchinAndSwitch(battler, PARTY_SIZE);
    }

    return FALSE;
}

static bool32 ShouldSwitchIfWonderGuard(enum BattlerId battler)
{
    enum BattlerId opposingBattler = GetOppositeBattler(battler);

    if (IsDoubleBattle())
        return FALSE;

    if (gAiLogicData->abilities[opposingBattler] != ABILITY_WONDER_GUARD)
        return FALSE;

    // Check if Pokémon has a super effective move.
    for (u32 moveIndex = 0; moveIndex < MAX_MON_MOVES; moveIndex++)
    {
        if (gBattleMons[battler].moves[moveIndex] != MOVE_NONE && gAiLogicData->effectiveness[battler][opposingBattler][moveIndex] >= UQ_4_12(2.0))
            return FALSE;
    }

    if (RandomPercentage(RNG_AI_SWITCH_WONDER_GUARD, GetSwitchChance(SHOULD_SWITCH_WONDER_GUARD)))
    {
        if (gAiLogicData->mostSuitableMonId[battler] == PARTY_SIZE) // No good candidate mons, find any one that can deal damage
            return FindMonWithMoveOfEffectiveness(battler, opposingBattler, UQ_4_12(2.0));
        else // Good candidate mon, send that in
            return SetSwitchinAndSwitch(battler, PARTY_SIZE);
    }

    return FALSE;
}

static bool32 FindMonThatAbsorbsOpponentsMove(enum BattlerId battler)
{
    enum BattlerId battlerIn1, battlerIn2;
    u8 numAbsorbingAbilities = 0;
    enum Ability absorbingTypeAbilities[8]; // Max needed for type + move property absorbers
    s32 firstId;
    s32 lastId;
    struct Pokemon *party;
    enum Ability monAbility;
    enum Move aiMove;
    enum BattlerId opposingBattler = GetOppositeBattler(battler);
    enum Move incomingMove = GetIncomingMove(battler, opposingBattler, gAiLogicData);
    enum Type incomingType = CheckDynamicMoveType(GetBattlerMon(opposingBattler), incomingMove, opposingBattler, MON_IN_BATTLE);
    bool32 isOpposingBattlerChargingOrInvulnerable = !BreaksThroughSemiInvulnerablity(battler, opposingBattler, gAiLogicData->abilities[battler], gAiLogicData->abilities[opposingBattler], incomingMove) || IsTwoTurnNotSemiInvulnerableMove(opposingBattler, incomingMove);

    if (!(gAiThinkingStruct->aiFlags[battler] & AI_FLAG_SMART_SWITCHING))
        return FALSE;
    if (GetMoveEffect(incomingMove) == EFFECT_HIDDEN_POWER && RandomPercentage(RNG_AI_SWITCH_ABSORBING_HIDDEN_POWER, SHOULD_SWITCH_ABSORBS_HIDDEN_POWER_PERCENTAGE))
        return FALSE;
    if (gBattleStruct->prevTurnSpecies[battler] != gBattleMons[battler].species && !(gAiThinkingStruct->aiFlags[battler] & AI_FLAG_PREDICT_MOVE)) // AI mon has changed, player's behaviour no longer reliable; override this if using AI_FLAG_PREDICT_MOVE
        return FALSE;
    if (CanUseSuperEffectiveMoveAgainstOpponents(battler) && (RandomPercentage(RNG_AI_SWITCH_ABSORBING_STAY_IN, STAY_IN_ABSORBING_PERCENTAGE) || gAiLogicData->aiPredictionInProgress))
        return FALSE;
    if (AreStatsRaised(battler))
        return FALSE;
    if (IsMoldBreakerTypeAbility(opposingBattler, gAiLogicData->abilities[opposingBattler]))
        return FALSE;

    // Don't switch if mon could OHKO
    for (u32 moveIndex = 0; moveIndex < MAX_MON_MOVES; moveIndex++)
    {
        aiMove = gBattleMons[battler].moves[moveIndex];
        if (aiMove != MOVE_NONE)
        {
            // Only check damage if it's a damaging move
            if (!IsBattleMoveStatus(aiMove))
            {
                if (!AI_DoesChoiceEffectBlockMove(battler, aiMove) && AI_GetDamage(battler, opposingBattler, moveIndex, AI_ATTACKING, gAiLogicData) > gBattleMons[opposingBattler].hp)
                    return FALSE;
            }
        }
    }

    // Create an array of possible absorb abilities so the AI considers all of them
    if (incomingType == TYPE_FIRE)
    {
        absorbingTypeAbilities[numAbsorbingAbilities++] = ABILITY_FLASH_FIRE;
    }
    if (incomingType == TYPE_WATER || (isOpposingBattlerChargingOrInvulnerable && incomingType == TYPE_WATER))
    {
        absorbingTypeAbilities[numAbsorbingAbilities++] = ABILITY_WATER_ABSORB;
        absorbingTypeAbilities[numAbsorbingAbilities++] = ABILITY_DRY_SKIN;
        if (GetConfig(CONFIG_REDIRECT_ABILITY_IMMUNITY) >= GEN_5)
            absorbingTypeAbilities[numAbsorbingAbilities++] = ABILITY_STORM_DRAIN;
    }
    if (incomingType == TYPE_ELECTRIC || (isOpposingBattlerChargingOrInvulnerable && incomingType == TYPE_ELECTRIC))
    {
        absorbingTypeAbilities[numAbsorbingAbilities++] = ABILITY_VOLT_ABSORB;
        absorbingTypeAbilities[numAbsorbingAbilities++] = ABILITY_MOTOR_DRIVE;
        if (GetConfig(CONFIG_REDIRECT_ABILITY_IMMUNITY) >= GEN_5)
            absorbingTypeAbilities[numAbsorbingAbilities++] = ABILITY_LIGHTNING_ROD;
    }
    if (incomingType == TYPE_GRASS || (isOpposingBattlerChargingOrInvulnerable && incomingType == TYPE_GRASS))
    {
        absorbingTypeAbilities[numAbsorbingAbilities++] = ABILITY_SAP_SIPPER;
    }
    if (incomingType == TYPE_GROUND || (isOpposingBattlerChargingOrInvulnerable && incomingType == TYPE_GROUND))
    {
        absorbingTypeAbilities[numAbsorbingAbilities++] = ABILITY_EARTH_EATER;
        absorbingTypeAbilities[numAbsorbingAbilities++] = ABILITY_LEVITATE;
    }
    if (IsSoundMove(incomingMove) || (isOpposingBattlerChargingOrInvulnerable && IsSoundMove(incomingMove)))
    {
        absorbingTypeAbilities[numAbsorbingAbilities++] = ABILITY_SOUNDPROOF;
    }
    if (IsBallisticMove(incomingMove) || (isOpposingBattlerChargingOrInvulnerable && IsBallisticMove(incomingMove)))
    {
        absorbingTypeAbilities[numAbsorbingAbilities++] = ABILITY_BULLETPROOF;
    }
    if (IsWindMove(incomingMove) || (isOpposingBattlerChargingOrInvulnerable && IsWindMove(incomingMove)))
    {
        absorbingTypeAbilities[numAbsorbingAbilities++] = ABILITY_WIND_RIDER;
    }
    if (IsPowderMove(incomingMove) || (isOpposingBattlerChargingOrInvulnerable && IsPowderMove(incomingMove)))
    {
        if (GetConfig(CONFIG_POWDER_OVERCOAT) >= GEN_6)
            absorbingTypeAbilities[numAbsorbingAbilities++] = ABILITY_OVERCOAT;
    }
    if (numAbsorbingAbilities == 0)
    {
        return FALSE;
    }

    // Check current mon for all absorbing abilities
    for (u32 absorbingAbilityIndex = 0; absorbingAbilityIndex < numAbsorbingAbilities; absorbingAbilityIndex++)
    {
        if (gAiLogicData->abilities[battler] == absorbingTypeAbilities[absorbingAbilityIndex])
            return FALSE;
    }

    GetActiveBattlerIds(battler, &battlerIn1, &battlerIn2);
    GetAIPartyIndexes(battler, &firstId, &lastId);
    party = GetBattlerParty(battler);

    // Check party for mon with ability that absorbs move
    for (u32 monIndex = firstId; monIndex < lastId; monIndex++)
    {
        if (!IsValidForBattle(&party[monIndex]))
            continue;
        if (monIndex == gBattlerPartyIndexes[battlerIn1])
            continue;
        if (monIndex == gBattlerPartyIndexes[battlerIn2])
            continue;
        if (monIndex == gBattleStruct->monToSwitchIntoId[battlerIn1])
            continue;
        if (monIndex == gBattleStruct->monToSwitchIntoId[battlerIn2])
            continue;
        if (IsAceMon(battler, monIndex))
            continue;

        monAbility = GetMonAbility(&party[monIndex]);

        for (u32 absorbingAbilityIndex = 0; absorbingAbilityIndex < numAbsorbingAbilities; absorbingAbilityIndex++)
        {
            // Found a mon
            if (absorbingTypeAbilities[absorbingAbilityIndex] == monAbility && RandomPercentage(RNG_AI_SWITCH_ABSORBING, GetSwitchChance(SHOULD_SWITCH_ABSORBS_MOVE)))
                return SetSwitchinAndSwitch(battler, monIndex);
        }
    }
    return FALSE;
}

static bool32 ShouldSwitchIfOpponentChargingOrInvulnerable(enum BattlerId battler)
{
    enum BattlerId opposingBattler = GetOppositeBattler(battler);
    enum Move incomingMove = GetIncomingMove(battler, opposingBattler, gAiLogicData);

    bool32 isOpposingBattlerChargingOrInvulnerable = !BreaksThroughSemiInvulnerablity(battler, opposingBattler, gAiLogicData->abilities[battler], gAiLogicData->abilities[opposingBattler], incomingMove) || IsTwoTurnNotSemiInvulnerableMove(opposingBattler, incomingMove);

    if (IsDoubleBattle() || !(gAiThinkingStruct->aiFlags[battler] & AI_FLAG_SMART_SWITCHING))
        return FALSE;

    // In a world with a unified ShouldSwitch function, also want to check whether we already win 1v1 and if we do don't switch; not worth doubling the HasBadOdds computation for now
    if (isOpposingBattlerChargingOrInvulnerable && gAiLogicData->mostSuitableMonId[battler] != PARTY_SIZE && RandomPercentage(RNG_AI_SWITCH_FREE_TURN, GetSwitchChance(SHOULD_SWITCH_FREE_TURN)))
        return SetSwitchinAndSwitch(battler, PARTY_SIZE);

    return FALSE;
}

static bool32 ShouldSwitchIfTrapperInParty(enum BattlerId battler)
{
    s32 firstId;
    s32 lastId;
    struct Pokemon *party;
    enum Ability monAbility;
    s32 opposingBattler =  GetOppositeBattler(battler);

    // Only use this if AI_FLAG_SMART_SWITCHING is set for the trainer
    if (!(gAiThinkingStruct->aiFlags[battler] & AI_FLAG_SMART_SWITCHING))
        return FALSE;

    // Check if opposing battler is already trapped
    if (IsBattlerTrapped(battler, opposingBattler))
        return FALSE;

    // Check party for mon with ability that traps opponent
    GetAIPartyIndexes(battler, &firstId, &lastId);
    party = GetBattlerParty(battler);

    for (u32 monIndex = firstId; monIndex < lastId; monIndex++)
    {
        if (IsAceMon(battler, monIndex))
            return FALSE;

        monAbility = GetMonAbility(&party[monIndex]);

        if (AI_CanSwitchinAbilityTrapOpponent(monAbility, opposingBattler) || (AI_CanSwitchinAbilityTrapOpponent(gAiLogicData->abilities[opposingBattler], opposingBattler) && monAbility == ABILITY_TRACE))
        {
            // If mon in slot i is the most suitable switchin candidate, then it's a trapper than wins 1v1
            if (monIndex == gAiLogicData->mostSuitableMonId[battler] && RandomPercentage(RNG_AI_SWITCH_TRAPPER, GetSwitchChance(SHOULD_SWITCH_TRAPPER)))
                return SetSwitchinAndSwitch(battler, PARTY_SIZE);
        }
    }
    return FALSE;
}

static bool32 ShouldSwitchIfBadlyStatused(enum BattlerId battler)
{
    bool32 switchMon = FALSE;
    enum Ability monAbility = gAiLogicData->abilities[battler];
    enum HoldEffect holdEffect = gAiLogicData->holdEffects[battler];
    enum BattlerPosition opposingPosition = BATTLE_OPPOSITE(GetBattlerPosition(battler));
    enum BattlerId opposingBattler = GetBattlerAtPosition(opposingPosition);
    bool32 hasStatRaised = AnyUsefulStatIsRaised(battler);

    //Perish Song
    if (gBattleMons[battler].volatiles.perishSong
        && gBattleMons[battler].volatiles.perishSongTimer == 0
        && monAbility != ABILITY_SOUNDPROOF
        && RandomPercentage(RNG_AI_SWITCH_PERISH_SONG, GetSwitchChance(SHOULD_SWITCH_PERISH_SONG)))
        return SetSwitchinAndSwitch(battler, PARTY_SIZE);

    if (gAiThinkingStruct->aiFlags[battler] & AI_FLAG_SMART_SWITCHING)
    {
        //Yawn
        if (gBattleMons[battler].volatiles.yawn
            && CanBeSlept(battler, battler, monAbility, BLOCKED_BY_SLEEP_CLAUSE)
            && gBattleMons[battler].hp > gBattleMons[battler].maxHP / 3
            && RandomPercentage(RNG_AI_SWITCH_YAWN, GetSwitchChance(SHOULD_SWITCH_YAWN)))
        {
            switchMon = TRUE;

            // If we don't have a good switchin, not worth switching
            if (gAiLogicData->mostSuitableMonId[battler] == PARTY_SIZE)
                switchMon = FALSE;

            // Check if Active Pokemon can KO opponent instead of switching
            // Will still fall asleep, but take out opposing Pokemon first
            if (AiExpectsToFaintPlayer(battler))
                switchMon = FALSE;

            // Checks to see if active Pokemon can do something against sleep
            if ((monAbility == ABILITY_NATURAL_CURE
                || monAbility == ABILITY_SHED_SKIN
                || monAbility == ABILITY_EARLY_BIRD)
                || holdEffect == (HOLD_EFFECT_CURE_SLP | HOLD_EFFECT_CURE_STATUS)
                || HasMoveWithEffect(battler, EFFECT_SLEEP_TALK)
                || (HasMoveWithEffect(battler, EFFECT_SNORE) && gAiLogicData->effectiveness[battler][opposingBattler][GetBattlerMoveIndexWithEffect(battler, EFFECT_SNORE)] >= UQ_4_12(1.0))
                || (IsBattlerGrounded(battler, monAbility, gAiLogicData->holdEffects[battler])
                    && (HasMove(battler, MOVE_MISTY_TERRAIN) || HasMove(battler, MOVE_ELECTRIC_TERRAIN)))
                )
                switchMon = FALSE;

            // Check if Active Pokemon evasion boosted and might be able to dodge until awake
            if (gBattleMons[battler].statStages[STAT_EVASION] > (DEFAULT_STAT_STAGE + 3)
                && gAiLogicData->abilities[opposingBattler] != ABILITY_UNAWARE
                && gAiLogicData->abilities[opposingBattler] != ABILITY_KEEN_EYE
                && gAiLogicData->abilities[opposingBattler] != ABILITY_MINDS_EYE
                && (GetConfig(CONFIG_ILLUMINATE_EFFECT) >= GEN_9 && gAiLogicData->abilities[opposingBattler] != ABILITY_ILLUMINATE)
                && !gBattleMons[battler].volatiles.foresight
                && !gBattleMons[battler].volatiles.miracleEye)
                switchMon = FALSE;

            if (switchMon)
                return SetSwitchinAndSwitch(battler, PARTY_SIZE);
        }

        // Secondary Damage
        if (monAbility != ABILITY_MAGIC_GUARD
            && !AiExpectsToFaintPlayer(battler)
            && gAiLogicData->mostSuitableMonId[battler] != PARTY_SIZE)
        {
            //Toxic
            if (((gBattleMons[battler].status1 & STATUS1_TOXIC_COUNTER) >= STATUS1_TOXIC_TURN(2))
                && gBattleMons[battler].hp >= (gBattleMons[battler].maxHP / 3)
                && gAiLogicData->mostSuitableMonId[battler] != PARTY_SIZE
                && (hasStatRaised ? RandomPercentage(RNG_AI_SWITCH_BADLY_POISONED, GetSwitchChance(SHOULD_SWITCH_BADLY_POISONED_STATS_RAISED)) : RandomPercentage(RNG_AI_SWITCH_BADLY_POISONED, GetSwitchChance(SHOULD_SWITCH_BADLY_POISONED))))
                return SetSwitchinAndSwitch(battler, PARTY_SIZE);

            //Cursed
            if (gBattleMons[battler].volatiles.cursed
                && (hasStatRaised ? RandomPercentage(RNG_AI_SWITCH_CURSED, GetSwitchChance(SHOULD_SWITCH_CURSED_STATS_RAISED)) : RandomPercentage(RNG_AI_SWITCH_CURSED, GetSwitchChance(SHOULD_SWITCH_CURSED))))
                return SetSwitchinAndSwitch(battler, PARTY_SIZE);

            //Nightmare
            if (gBattleMons[battler].volatiles.nightmare
                && (hasStatRaised ? RandomPercentage(RNG_AI_SWITCH_NIGHTMARE, GetSwitchChance(SHOULD_SWITCH_NIGHTMARE_STATS_RAISED)) : RandomPercentage(RNG_AI_SWITCH_NIGHTMARE, GetSwitchChance(SHOULD_SWITCH_NIGHTMARE))))
                return SetSwitchinAndSwitch(battler, PARTY_SIZE);

            //Leech Seed
            if (gBattleMons[battler].volatiles.leechSeed
                && (hasStatRaised ? RandomPercentage(RNG_AI_SWITCH_SEEDED, GetSwitchChance(SHOULD_SWITCH_SEEDED_STATS_RAISED)) : RandomPercentage(RNG_AI_SWITCH_SEEDED, GetSwitchChance(SHOULD_SWITCH_SEEDED))))
                return SetSwitchinAndSwitch(battler, PARTY_SIZE);
        }

        // Infatuation
        if (gBattleMons[battler].volatiles.infatuation
            && !AiExpectsToFaintPlayer(battler)
            && gAiLogicData->mostSuitableMonId[battler] != PARTY_SIZE
            && RandomPercentage(RNG_AI_SWITCH_INFATUATION, GetSwitchChance(SHOULD_SWITCH_INFATUATION)))
            return SetSwitchinAndSwitch(battler, PARTY_SIZE);
    }

    return FALSE;
}

static bool32 GetHitEscapeTransformState(enum BattlerId battlerAtk, enum Move move)
{
    u32 moveIndex;
    bool32 hasValidTarget = FALSE;
    bool32 isFasterThanAll = TRUE;
    bool32 absorberOnField = FALSE;
    enum Type moveType;

    if (gBattleMons[battlerAtk].species != SPECIES_PALAFIN_ZERO
     || gAiLogicData->abilities[battlerAtk] != ABILITY_ZERO_TO_HERO)
        return FALSE;

    if (GetMoveEffect(move) != EFFECT_HIT_ESCAPE)
        return FALSE;

    moveIndex = GetMoveIndex(battlerAtk, move);
    if (moveIndex >= MAX_MON_MOVES)
        return FALSE;

    moveType = GetBattleMoveType(move);
    if ((moveType == TYPE_WATER && (AI_GetWeather() & B_WEATHER_SUN_PRIMAL))
     || (moveType == TYPE_FIRE && (AI_GetWeather() & B_WEATHER_RAIN_PRIMAL)))
        return FALSE;

    struct BattleContext ctx = {0};
    ctx.aiCalc = TRUE;
    ctx.battlerAtk = battlerAtk;
    ctx.move = ctx.chosenMove = move;
    ctx.moveType = moveType;
    ctx.holdEffectAtk = gAiLogicData->holdEffects[battlerAtk];
    ctx.abilityAtk = gAiLogicData->abilities[battlerAtk];


    for (enum BattlerId battlerDef = 0; battlerDef < gBattlersCount; battlerDef++)
    {
        if (!IsBattlerAlive(battlerDef) || IsBattlerAlly(battlerDef, battlerAtk))
            continue;

        enum Ability abilityDef = AI_GetMoldBreakerSanitizedAbility(
            battlerAtk,
            gAiLogicData->abilities[battlerAtk],
            gAiLogicData->abilities[battlerDef],
            gAiLogicData->holdEffects[battlerDef],
            move
        );

        ctx.battlerDef = battlerDef;
        ctx.holdEffectDef = gAiLogicData->holdEffects[battlerDef];
        ctx.abilityDef = abilityDef;

        if (AI_CanMoveBeBlockedByTarget(&ctx))
        {
            if ((moveType == TYPE_WATER && abilityDef == ABILITY_STORM_DRAIN)
             || (moveType == TYPE_ELECTRIC && abilityDef == ABILITY_LIGHTNING_ROD))
                absorberOnField = TRUE;
            gAiLogicData->effectiveness[battlerAtk][battlerDef][moveIndex] = UQ_4_12(0.0);
            continue;
        }

        if (gAiLogicData->effectiveness[battlerAtk][battlerDef][moveIndex] > UQ_4_12(0.0))
        {
            enum Move predictedMoveSpeedCheck = GetIncomingMoveSpeedCheck(battlerAtk, battlerDef, gAiLogicData);

            hasValidTarget = TRUE;
            if (!AI_IsFaster(battlerAtk, battlerDef, move, predictedMoveSpeedCheck, CONSIDER_PRIORITY))
                isFasterThanAll = FALSE;
        }
    }

    if (absorberOnField || !hasValidTarget)
        return FALSE; // Can't meaningfully use a hit escape move

    return isFasterThanAll;
}

static bool32 ShouldSwitchIfAbilityBenefit(enum BattlerId battler)
{
    bool32 hasStatRaised = AnyUsefulStatIsRaised(battler);

    //Check if ability is blocked
    if (gBattleMons[battler].volatiles.gastroAcid
        || IsNeutralizingGasOnField())
        return FALSE;

    switch(gAiLogicData->abilities[battler])
    {
        case ABILITY_NATURAL_CURE:
            //Attempt to cure bad ailment
            if (gBattleMons[battler].status1 & (STATUS1_SLEEP | STATUS1_FREEZE | STATUS1_TOXIC_POISON)
                && gAiLogicData->mostSuitableMonId[battler] != PARTY_SIZE
                && (hasStatRaised ? RandomPercentage(RNG_AI_SWITCH_NATURAL_CURE, GetSwitchChance(SHOULD_SWITCH_NATURAL_CURE_STRONG_STATS_RAISED)) : RandomPercentage(RNG_AI_SWITCH_NATURAL_CURE, GetSwitchChance(SHOULD_SWITCH_NATURAL_CURE_STRONG))))
                break;
            //Attempt to cure lesser ailment
            if ((gBattleMons[battler].status1 & STATUS1_ANY)
                && (gBattleMons[battler].hp >= gBattleMons[battler].maxHP / 2)
                && gAiLogicData->mostSuitableMonId[battler] != PARTY_SIZE
                && (hasStatRaised ? RandomPercentage(RNG_AI_SWITCH_NATURAL_CURE, GetSwitchChance(SHOULD_SWITCH_NATURAL_CURE_WEAK_STATS_RAISED)) : RandomPercentage(RNG_AI_SWITCH_NATURAL_CURE, GetSwitchChance(SHOULD_SWITCH_NATURAL_CURE_WEAK))))
                break;

            return FALSE;

        case ABILITY_REGENERATOR:
            //Don't switch if ailment
            if (gBattleMons[battler].status1 & STATUS1_ANY)
                return FALSE;
            if ((gBattleMons[battler].hp <= ((gBattleMons[battler].maxHP * 2) / 3))
                 && gAiLogicData->mostSuitableMonId[battler] != PARTY_SIZE
                 && (hasStatRaised ? RandomPercentage(RNG_AI_SWITCH_REGENERATOR, GetSwitchChance(SHOULD_SWITCH_REGENERATOR_STATS_RAISED)) : RandomPercentage(RNG_AI_SWITCH_REGENERATOR, GetSwitchChance(SHOULD_SWITCH_REGENERATOR))))
                break;

            return FALSE;

        case ABILITY_ZERO_TO_HERO:
        {
            enum Move hitEscapeMove = MOVE_NONE;

            for (u32 moveIndex = 0; moveIndex < MAX_MON_MOVES; moveIndex++)
            {
                enum Move move = gBattleMons[battler].moves[moveIndex];

                if (move != MOVE_NONE && GetMoveEffect(move) == EFFECT_HIT_ESCAPE)
                {
                    hitEscapeMove = move;
                    break;
                }
            }

            // Prefer to use a hit escape move if Palafin will move first and can hit
            if (hitEscapeMove != MOVE_NONE && GetHitEscapeTransformState(battler, hitEscapeMove))
                return FALSE;
            break;
        }

        default:
            return FALSE;
    }

    return SetSwitchinAndSwitch(battler, PARTY_SIZE);
}

static bool32 CanUseSuperEffectiveMoveAgainstOpponent(enum BattlerId battler, enum BattlerId opposingBattler)
{
    enum Move move;

    if (!IsBattlerAlive(opposingBattler))
        return FALSE;

    for (u32 moveIndex = 0; moveIndex < MAX_MON_MOVES; moveIndex++)
    {
        move = gBattleMons[battler].moves[moveIndex];
        if (move == MOVE_NONE || AI_DoesChoiceEffectBlockMove(battler, move))
            continue;

        if (gAiLogicData->effectiveness[battler][opposingBattler][moveIndex] >= UQ_4_12(2.0))
            return TRUE;
    }
    return FALSE;
}

static bool32 CanUseSuperEffectiveMoveAgainstOpponents(enum BattlerId battler)
{
    enum BattlerPosition opposingPosition = GetBattlerPosition(BATTLE_OPPOSITE(battler));
    enum BattlerId opposingBattler = GetBattlerAtPosition(opposingPosition);

    if (CanUseSuperEffectiveMoveAgainstOpponent(battler, opposingBattler))
        return TRUE;

    if (HasTwoOpponents(battler) && CanUseSuperEffectiveMoveAgainstOpponent(battler, BATTLE_PARTNER(BATTLE_OPPOSITE(battler))))
        return TRUE;

    return FALSE;
}

static bool32 FindMonWithFlagsAndSuperEffective(enum BattlerId battler, u16 flags, u32 percentChance)
{
    enum BattlerId battlerIn1, battlerIn2;
    s32 firstId;
    s32 lastId; // + 1
    struct Pokemon *party;
    enum Move move;

    // Similar functionality handled more thoroughly by ShouldSwitchIfHasBadOdds
    if (gAiThinkingStruct->aiFlags[battler] & AI_FLAG_SMART_SWITCHING)
        return FALSE;

    if (gLastLandedMoves[battler] == MOVE_NONE)
        return FALSE;
    if (gLastLandedMoves[battler] == MOVE_UNAVAILABLE)
        return FALSE;
    if (gLastHitBy[battler] == 0xFF)
        return FALSE;
    if (IsBattleMoveStatus(gLastLandedMoves[battler]))
        return FALSE;

    GetActiveBattlerIds(battler, &battlerIn1, &battlerIn2);

    GetAIPartyIndexes(battler, &firstId, &lastId);
    party = GetBattlerParty(battler);

    for (u32 monIndex = firstId; monIndex < lastId; monIndex++)
    {
        u16 species;
        enum Ability monAbility;
        uq4_12_t typeMultiplier;
        u16 moveFlags = 0;

        if (!IsValidForBattle(&party[monIndex]))
            continue;
        if (IsPartyMonOnFieldOrChosenToSwitch(monIndex, battlerIn1, battlerIn2))
            continue;
        if (IsAceMon(battler, monIndex))
            continue;

        species = GetMonData(&party[monIndex], MON_DATA_SPECIES_OR_EGG);
        monAbility = GetMonAbility(&party[monIndex]);
        typeMultiplier = CalcPartyMonTypeEffectivenessMultiplier(gLastLandedMoves[battler], species, monAbility);
        UpdateMoveResultFlags(typeMultiplier, &moveFlags);
        if (moveFlags & flags)
        {
            battlerIn1 = gLastHitBy[battler];

            for (u32 moveIndex = 0; moveIndex < MAX_MON_MOVES; moveIndex++)
            {
                move = GetMonData(&party[monIndex], MON_DATA_MOVE1 + moveIndex);
                if (move == MOVE_NONE)
                    continue;

                if (AI_GetMoveEffectiveness(move, battler, battlerIn1) >= UQ_4_12(2.0) && (RandomPercentage(RNG_AI_SWITCH_SE_DEFENSIVE, percentChance) || gAiLogicData->aiPredictionInProgress))
                    return SetSwitchinAndSwitch(battler, monIndex);
            }
        }
    }

    return FALSE;
}

static bool32 CanMonSurviveHazardSwitchin(enum BattlerId battler)
{
    enum BattlerId battlerIn1, battlerIn2;
    u32 hazardDamage = 0, battlerHp = gBattleMons[battler].hp;
    enum Ability ability = gAiLogicData->abilities[battler];
    enum Move aiMove;
    s32 firstId, lastId;
    struct Pokemon *party;

    if (ability == ABILITY_REGENERATOR)
        battlerHp = (battlerHp * 133) / 100; // Account for Regenerator healing

    hazardDamage = GetSwitchinHazardsDamage(battler);

    // Battler will faint to hazards, check to see if another mon can clear them
    if (hazardDamage > battlerHp)
    {
        GetActiveBattlerIds(battler, &battlerIn1, &battlerIn2);
        GetAIPartyIndexes(battler, &firstId, &lastId);
        party = GetBattlerParty(battler);

        for (u32 monIndex = firstId; monIndex < lastId; monIndex++)
        {
            if (!IsValidForBattle(&party[monIndex]))
                continue;
            if (IsPartyMonOnFieldOrChosenToSwitch(monIndex, battlerIn1, battlerIn2))
                continue;
            if (IsAceMon(battler, monIndex))
                continue;

            for (u32 moveIndex = 0; moveIndex < MAX_MON_MOVES; moveIndex++)
            {
                aiMove = GetMonData(&party[monIndex], MON_DATA_MOVE1 + moveIndex);
                if (IsHazardClearingMove(aiMove)) // Have a mon that can clear the hazards, so switching out is okay
                    return TRUE;
            }
        }
        // Faints to hazards and party can't clear them, don't switch out
        return FALSE;
    }
    return TRUE;
}

static bool32 ShouldSwitchIfEncored(enum BattlerId battler)
{
    enum Move encoredMove = gBattleMons[battler].volatiles.encoredMove;
    enum BattlerId opposingBattler = GetOppositeBattler(battler);

    // Only use this if AI_FLAG_SMART_SWITCHING is set for the trainer
    if (!(gAiThinkingStruct->aiFlags[battler] & AI_FLAG_SMART_SWITCHING))
        return FALSE;

    // If not Encore'd don't switch
    if (encoredMove == MOVE_NONE)
        return FALSE;

    // Switch out if status move
    if (GetMoveCategory(encoredMove) == DAMAGE_CATEGORY_STATUS && RandomPercentage(RNG_AI_SWITCH_ENCORE, GetSwitchChance(SHOULD_SWITCH_ENCORE_STATUS)))
        return SetSwitchinAndSwitch(battler, PARTY_SIZE);

    // Stay in if effective move
    else if (gAiLogicData->effectiveness[battler][opposingBattler][GetMoveIndex(battler, encoredMove)] >= UQ_4_12(2.0))
        return FALSE;

    // Switch out 50% of the time otherwise
    else if ((RandomPercentage(RNG_AI_SWITCH_ENCORE, GetSwitchChance(SHOULD_SWITCH_ENCORE_DAMAGE)) || gAiLogicData->aiPredictionInProgress) && gAiLogicData->mostSuitableMonId[battler] != PARTY_SIZE)
        return SetSwitchinAndSwitch(battler, PARTY_SIZE);

    return FALSE;
}

static bool32 ShouldSwitchIfBadChoiceLock(enum BattlerId battler)
{
    enum Move choicedMove = gBattleStruct->choicedMove[battler];
    enum BattlerId opposingBattler = GetOppositeBattler(battler);

    struct BattleContext ctx = {0};
    ctx.battlerAtk = battler;
    ctx.battlerDef = opposingBattler;
    ctx.move = ctx.chosenMove = choicedMove;
    ctx.moveType = GetBattleMoveType(choicedMove);
    ctx.abilityAtk = gAiLogicData->abilities[ctx.battlerAtk];
    ctx.abilityDef = gAiLogicData->abilities[ctx.battlerDef];
    ctx.holdEffectAtk = gAiLogicData->holdEffects[ctx.battlerAtk];
    ctx.holdEffectDef = gAiLogicData->holdEffects[ctx.battlerDef];

    // Not locked in to anything yet, or not choiced
    if (choicedMove == MOVE_NONE)
        return FALSE;

    u32 moveIndex = GetMoveIndex(battler, choicedMove);

    if (HasTwoOpponents(battler))
    {
        enum BattlerId opposingPartner = BATTLE_PARTNER(opposingBattler);
        if (IsHoldEffectChoice(ctx.holdEffectAtk) && IsBattlerItemEnabled(battler))
        {
            if (GetMoveCategory(choicedMove) == DAMAGE_CATEGORY_STATUS || !CanMoveAffectTarget(&ctx, moveIndex))
            {
                // Set partner data in ctx
                ctx.battlerDef = opposingPartner;
                ctx.abilityDef = gAiLogicData->abilities[ctx.battlerDef];
                ctx.holdEffectDef = gAiLogicData->holdEffects[ctx.battlerDef];
                if (!CanMoveAffectTarget(&ctx, moveIndex) && RandomPercentage(RNG_AI_SWITCH_CHOICE_LOCKED, GetSwitchChance(SHOULD_SWITCH_CHOICE_LOCKED)))
                    return SetSwitchinAndSwitch(battler, PARTY_SIZE);
            }
        }
    }
    else if (IsHoldEffectChoice(ctx.holdEffectAtk) && IsBattlerItemEnabled(battler))
    {
        if ((GetMoveCategory(choicedMove) == DAMAGE_CATEGORY_STATUS || !CanMoveAffectTarget(&ctx, moveIndex)) && RandomPercentage(RNG_AI_SWITCH_CHOICE_LOCKED, GetSwitchChance(SHOULD_SWITCH_CHOICE_LOCKED)))
            return SetSwitchinAndSwitch(battler, PARTY_SIZE);
    }

    return FALSE;
}

// AI should switch if it's become setup fodder and has something better to switch to
static bool32 ShouldSwitchIfAttackingStatsLowered(enum BattlerId battler)
{
    s8 attackingStage = gBattleMons[battler].statStages[STAT_ATK];
    s8 spAttackingStage = gBattleMons[battler].statStages[STAT_SPATK];

    // Only use this if AI_FLAG_SMART_SWITCHING is set for the trainer
    if (!(gAiThinkingStruct->aiFlags[battler] & AI_FLAG_SMART_SWITCHING))
        return FALSE;

    // Physical attacker
    if (gBattleMons[battler].attack > gBattleMons[battler].spAttack)
    {
        // Don't switch if attack isn't below -1
        if (attackingStage > DEFAULT_STAT_STAGE - 2)
            return FALSE;
        // 50% chance if attack at -2 and have a good candidate mon
        else if (attackingStage == DEFAULT_STAT_STAGE - 2)
        {
            if (gAiLogicData->mostSuitableMonId[battler] != PARTY_SIZE && (RandomPercentage(RNG_AI_SWITCH_STATS_LOWERED, GetSwitchChance(SHOULD_SWITCH_ATTACKING_STAT_MINUS_TWO)) || gAiLogicData->aiPredictionInProgress))
                return SetSwitchinAndSwitch(battler, PARTY_SIZE);
        }
        // If at -3 or worse, switch out regardless
        else if ((attackingStage < DEFAULT_STAT_STAGE - 2) && RandomPercentage(RNG_AI_SWITCH_STATS_LOWERED, GetSwitchChance(SHOULD_SWITCH_ATTACKING_STAT_MINUS_THREE_PLUS)))
            return SetSwitchinAndSwitch(battler, PARTY_SIZE);
    }

    // Special attacker
    else
    {
        // Don't switch if attack isn't below -1
        if (spAttackingStage > DEFAULT_STAT_STAGE - 2)
            return FALSE;
        // 50% chance if attack at -2 and have a good candidate mon
        else if (spAttackingStage == DEFAULT_STAT_STAGE - 2)
        {
            if (gAiLogicData->mostSuitableMonId[battler] != PARTY_SIZE && (RandomPercentage(RNG_AI_SWITCH_STATS_LOWERED, GetSwitchChance(SHOULD_SWITCH_ATTACKING_STAT_MINUS_TWO)) || gAiLogicData->aiPredictionInProgress))
                return SetSwitchinAndSwitch(battler, PARTY_SIZE);
        }
        // If at -3 or worse, switch out regardless
        else if ((spAttackingStage < DEFAULT_STAT_STAGE - 2) && RandomPercentage(RNG_AI_SWITCH_STATS_LOWERED, GetSwitchChance(SHOULD_SWITCH_ATTACKING_STAT_MINUS_THREE_PLUS)))
            return SetSwitchinAndSwitch(battler, PARTY_SIZE);
    }
    return FALSE;
}

bool32 ShouldSwitchDynFuncExample(enum BattlerId battler)
{
    // Chance to switch if trainer class is Guitarist, perhaps thematic for Jugglers
    if (GetTrainerClassFromId(TRAINER_BATTLE_PARAM.opponentA) == TRAINER_CLASS_GUITARIST
        && RandomPercentage(RNG_AI_SWITCH_DYN_FUNC, GetSwitchChance(SHOULD_SWITCH_DYN_FUNC)))
    {
        return SetSwitchinAndSwitch(battler, PARTY_SIZE);
    }
    return FALSE;
}

static bool32 CanBattlerConsiderSwitch(enum BattlerId battler)
{
    if (gBattleMons[battler].volatiles.wrapped)
        return FALSE;
    if (gBattleMons[battler].volatiles.escapePrevention)
        return FALSE;
    if (gBattleMons[battler].volatiles.root)
        return FALSE;
    if (IsAbilityPreventingEscape(battler))
        return FALSE;
    if (gBattleStruct->battlerState[battler].commanderSpecies)
        return FALSE;
    if (gBattleTypeFlags & BATTLE_TYPE_ARENA)
        return FALSE;
    return TRUE;
}

bool32 ShouldSwitch(enum BattlerId battler)
{
    enum BattlerId battlerIn1, battlerIn2;
    s32 firstId;
    s32 lastId; // + 1
    struct Pokemon *party;
    s32 availableToSwitch;

    if (!CanBattlerConsiderSwitch(battler))
        return FALSE;

    // Sequence Switching AI never switches mid-battle
    if (gAiThinkingStruct->aiFlags[battler] & AI_FLAG_SEQUENCE_SWITCHING)
        return FALSE;

    availableToSwitch = 0;

    GetActiveBattlerIds(battler, &battlerIn1, &battlerIn2);
    GetAIPartyIndexes(battler, &firstId, &lastId);
    party = GetBattlerParty(battler);

    for (u32 monIndex = firstId; monIndex < lastId; monIndex++)
    {
        if (!IsValidForBattle(&party[monIndex]))
            continue;
        if (IsPartyMonOnFieldOrChosenToSwitch(monIndex, battlerIn1, battlerIn2))
            continue;
        if (IsAceMon(battler, monIndex))
            continue;

        availableToSwitch++;
    }

    if (availableToSwitch == 0)
        return FALSE;

    // custom switching logic
    // NOTE: needs to always end with `return SetSwitchinAndSwitch` or `return FALSE`
    if (gDynamicAiSwitchFunc != NULL && gDynamicAiSwitchFunc(battler)) // Create custom AI functions for specific battles via "setdynamicswitchaifunc" cmd
        return TRUE;

    // NOTE: The sequence of the below functions matter! Do not change unless you have carefully considered the outcome.
    // Since the order is sequential, and some of these functions prompt switch to specific party members.

    // FindMon functions can prompt a switch to specific party members that override GetMostSuitableMonToSwitchInto
    // The rest can prompt a switch to party member returned by GetMostSuitableMonToSwitchInto

    if (ShouldSwitchIfWonderGuard(battler))
        return TRUE;
    if ((gAiThinkingStruct->aiFlags[battler] & AI_FLAG_SMART_SWITCHING) && (CanMonSurviveHazardSwitchin(battler) == FALSE))
        return FALSE;
    if (ShouldSwitchIfTrapperInParty(battler))
        return TRUE;
    if (FindMonThatAbsorbsOpponentsMove(battler))
        return TRUE;
    if (ShouldSwitchIfOpponentChargingOrInvulnerable(battler))
        return TRUE;
    if (ShouldSwitchIfTruant(battler))
        return TRUE;
    if (ShouldSwitchIfAllMovesBad(battler))
        return TRUE;
    if (ShouldSwitchIfBadlyStatused(battler))
        return TRUE;
    if (ShouldSwitchIfAbilityBenefit(battler))
        return TRUE;
    if (ShouldSwitchIfHasBadOdds(battler))
        return TRUE;
    if (ShouldSwitchIfEncored(battler))
        return TRUE;
    if (ShouldSwitchIfBadChoiceLock(battler))
        return TRUE;
    if (ShouldSwitchIfAttackingStatsLowered(battler))
        return TRUE;

    // Removing switch capabilites under specific conditions
    // These Functions prevent the "FindMonWithFlagsAndSuperEffective" from getting out of hand.
    // We don't use FindMonWithFlagsAndSuperEffective with AI_FLAG_SMART_SWITCHING, so we can bail early.
    if (gAiThinkingStruct->aiFlags[battler] & AI_FLAG_SMART_SWITCHING)
        return FALSE;
    if (CanUseSuperEffectiveMoveAgainstOpponents(battler))
        return FALSE;
    if (AreStatsRaised(battler))
        return FALSE;

    // Default Function
    // Can prompt switch if AI has a pokemon in party that resists current opponent & has super effective move
    if (FindMonWithFlagsAndSuperEffective(battler, MOVE_RESULT_DOESNT_AFFECT_FOE, 50)
        || FindMonWithFlagsAndSuperEffective(battler, MOVE_RESULT_NOT_VERY_EFFECTIVE, 33))
        return TRUE;

    return FALSE;
}

bool32 ShouldSwitchIfAllScoresBad(enum BattlerId battler)
{
    u32 score, opposingBattler = GetOppositeBattler(battler);
    if (!(gAiThinkingStruct->aiFlags[battler] & AI_FLAG_SMART_SWITCHING))
        return FALSE;

    for (u32 moveIndex = 0; moveIndex < MAX_MON_MOVES; moveIndex++)
    {
        if (HasTwoOpponents(battler))
        {
            u32 score1 = gAiBattleData->finalScore[battler][opposingBattler][moveIndex];
            u32 score2 = gAiBattleData->finalScore[battler][BATTLE_PARTNER(opposingBattler)][moveIndex];
            if (score1 > AI_BAD_SCORE_THRESHOLD || score2 > AI_BAD_SCORE_THRESHOLD)
                return FALSE;
        }
        else
        {
            score = gAiBattleData->finalScore[battler][opposingBattler][moveIndex];
            if (score > AI_BAD_SCORE_THRESHOLD)
                return FALSE;
        }
    }
    if (RandomPercentage(RNG_AI_SWITCH_ALL_SCORES_BAD, GetSwitchChance(SHOULD_SWITCH_ALL_SCORES_BAD))
        && (gAiLogicData->mostSuitableMonId[battler] != PARTY_SIZE || !ALL_SCORES_BAD_NEEDS_GOOD_SWITCHIN))
        return TRUE;
    return FALSE;
}

bool32 ShouldStayInToUseMove(enum BattlerId battler)
{
    enum Move aiMove;
    u32 opposingBattler = GetOppositeBattler(battler);
    enum BattleMoveEffects aiMoveEffect;
    for (u32 moveIndex = 0; moveIndex < MAX_MON_MOVES; moveIndex++)
    {
        aiMove = gBattleMons[battler].moves[moveIndex];
        aiMoveEffect = GetMoveEffect(aiMove);
        if (aiMoveEffect == EFFECT_REVIVAL_BLESSING || IsSwitchOutEffect(aiMoveEffect))
        {
            // Palafin should not stay in for a hit escape move if it can't use it effectively (slower or no target)
            if (gBattleMons[battler].species == SPECIES_PALAFIN_ZERO
             && gAiLogicData->abilities[battler] == ABILITY_ZERO_TO_HERO
             && aiMoveEffect == EFFECT_HIT_ESCAPE
             && !GetHitEscapeTransformState(battler, aiMove))
                continue;

            if (gAiBattleData->finalScore[battler][opposingBattler][moveIndex] > AI_GOOD_SCORE_THRESHOLD
                || (HasTwoOpponents(battler) && gAiBattleData->finalScore[battler][BATTLE_PARTNER(opposingBattler)][moveIndex] > AI_GOOD_SCORE_THRESHOLD))
                return TRUE;
        }
    }
    return FALSE;
}

void ModifySwitchAfterMoveScoring(enum BattlerId battler)
{
    enum BattlerId battlerIn1, battlerIn2;
    s32 firstId;
    s32 lastId; // + 1
    struct Pokemon *party;
    s32 availableToSwitch;

    if (!CanBattlerConsiderSwitch(battler))
        return;

    // Sequence Switching AI never switches mid-battle
    if (gAiThinkingStruct->aiFlags[battler] & AI_FLAG_SEQUENCE_SWITCHING)
        return;

    availableToSwitch = 0;

    GetActiveBattlerIds(battler, &battlerIn1, &battlerIn2);
    GetAIPartyIndexes(battler, &firstId, &lastId);
    party = GetBattlerParty(battler);

    for (u32 monIndex = firstId; monIndex < lastId; monIndex++)
    {
        if (!IsValidForBattle(&party[monIndex]))
            continue;
        if (monIndex == gBattlerPartyIndexes[battlerIn1])
            continue;
        if (monIndex == gBattlerPartyIndexes[battlerIn2])
            continue;
        if (monIndex == gBattleStruct->monToSwitchIntoId[battlerIn1])
            continue;
        if (monIndex == gBattleStruct->monToSwitchIntoId[battlerIn2])
            continue;
        if (IsAceMon(battler, monIndex))
            continue;

        availableToSwitch++;
    }

    if (availableToSwitch == 0)
        return;

    if (ShouldSwitchIfAllScoresBad(battler))
        gAiLogicData->shouldSwitch |= (1u << battler);
    else if (ShouldStayInToUseMove(battler))
        gAiLogicData->shouldSwitch &= ~(1u << battler);
}

bool32 IsSwitchinValid(enum BattlerId battler)
{
    // Edge case: See if partner already chose to switch into the same mon
    if (IsDoubleBattle())
    {
        enum BattlerId partner = BATTLE_PARTNER(battler);
        if (gBattleStruct->AI_monToSwitchIntoId[battler] == PARTY_SIZE) // Generic switch
        {
            if ((gAiLogicData->shouldSwitch & (1u << partner)) && gAiLogicData->monToSwitchInId[partner] == gAiLogicData->mostSuitableMonId[battler])
            {
                return FALSE;
            }
        }
        else // Override switch
        {
            if ((gAiLogicData->shouldSwitch & (1u << partner)) && gAiLogicData->monToSwitchInId[partner] == gBattleStruct->AI_monToSwitchIntoId[battler])
            {
                return FALSE;
            }
        }
    }
    return TRUE;
}

// Gets hazard damage
static u32 GetSwitchinHazardsDamage(enum BattlerId battler)
{
    u8 tSpikesLayers;
    enum HoldEffect heldItemEffect = gAiLogicData->holdEffects[battler];
    u32 maxHP = gBattleMons[battler].maxHP;
    enum Ability ability = gAiLogicData->abilities[battler];
    u32 status = gBattleMons[battler].status1;
    u32 spikesDamage = 0, tSpikesDamage = 0, hazardDamage = 0;
    enum BattleSide side = GetBattlerSide(battler);

    // Check ways mon might avoid all hazards
    if (ability != ABILITY_MAGIC_GUARD || (heldItemEffect == HOLD_EFFECT_HEAVY_DUTY_BOOTS &&
        !((gFieldStatuses & STATUS_FIELD_MAGIC_ROOM) || ability == ABILITY_KLUTZ)))
    {
        // Stealth Rock
        if (IsHazardOnSide(side, HAZARDS_STEALTH_ROCK) && heldItemEffect != HOLD_EFFECT_HEAVY_DUTY_BOOTS)
            hazardDamage += GetStealthHazardDamage(TYPE_SIDE_HAZARD_POINTED_STONES, battler);
        // G-Max Steelsurge
        if (IsHazardOnSide(side, HAZARDS_STEELSURGE) && heldItemEffect != HOLD_EFFECT_HEAVY_DUTY_BOOTS)
            hazardDamage += GetStealthHazardDamage(TYPE_SIDE_HAZARD_SHARP_STEEL, battler);
        // Spikes
        if (IsHazardOnSide(side, HAZARDS_SPIKES) && AI_IsBattlerGrounded(battler))
        {
            spikesDamage = maxHP / ((5 - gSideTimers[GetBattlerSide(battler)].spikesAmount) * 2);
            if (spikesDamage == 0)
                spikesDamage = 1;
            hazardDamage += spikesDamage;
        }

        if (IsHazardOnSide(side, HAZARDS_TOXIC_SPIKES) && (!IS_BATTLER_ANY_TYPE(battler, TYPE_POISON, TYPE_STEEL)
            && ability != ABILITY_IMMUNITY && ability != ABILITY_POISON_HEAL && ability != ABILITY_COMATOSE
            && status == 0
            && !(gSideStatuses[GetBattlerSide(battler)] & SIDE_STATUS_SAFEGUARD)
            && !IsAbilityOnSide(battler, ABILITY_PASTEL_VEIL)
            && !IsMistyTerrainAffected(battler, ability, gAiLogicData->holdEffects[battler], gFieldStatuses)
            && !IsAbilityStatusProtected(battler, ability)
            && heldItemEffect != HOLD_EFFECT_CURE_PSN && heldItemEffect != HOLD_EFFECT_CURE_STATUS
            && AI_IsBattlerGrounded(battler)))
        {
            tSpikesLayers = gSideTimers[GetBattlerSide(battler)].toxicSpikesAmount;
            if (tSpikesLayers == 1)
            {
                tSpikesDamage = maxHP / 8;
                if (tSpikesDamage == 0)
                    tSpikesDamage = 1;
            }
            else if (tSpikesLayers >= 2)
            {
                tSpikesDamage = maxHP / 16;
                if (tSpikesDamage == 0)
                    tSpikesDamage = 1;
            }
            hazardDamage += tSpikesDamage;
        }
    }
    return hazardDamage;
}

// Gets damage / healing from weather
static s32 GetSwitchinWeatherImpact(enum BattlerId battler)
{
    s32 weatherImpact = 0, maxHP = gBattleMons[battler].maxHP;
    enum Ability ability = gAiLogicData->abilities[battler];
    enum HoldEffect holdEffect = gAiLogicData->holdEffects[battler];

    if (HasWeatherEffect())
    {
        // Damage
        if (holdEffect != HOLD_EFFECT_SAFETY_GOGGLES && ability != ABILITY_MAGIC_GUARD && ability != ABILITY_OVERCOAT)
        {
            if ((gBattleWeather & B_WEATHER_HAIL)
             && IS_BATTLER_OF_TYPE(battler, TYPE_ICE)
             && ability != ABILITY_SNOW_CLOAK && ability != ABILITY_ICE_BODY)
            {
                weatherImpact = maxHP / 16;
                if (weatherImpact == 0)
                    weatherImpact = 1;
            }
            else if ((gBattleWeather & B_WEATHER_SANDSTORM)
                && IS_BATTLER_ANY_TYPE(battler, TYPE_ROCK, TYPE_GROUND, TYPE_STEEL)
                && ability != ABILITY_SAND_VEIL && ability != ABILITY_SAND_RUSH && ability != ABILITY_SAND_FORCE)
            {
                weatherImpact = maxHP / 16;
                if (weatherImpact == 0)
                    weatherImpact = 1;
            }
        }
        if ((gBattleWeather & B_WEATHER_SUN) && holdEffect != HOLD_EFFECT_UTILITY_UMBRELLA
         && (ability == ABILITY_SOLAR_POWER || ability == ABILITY_DRY_SKIN))
        {
            weatherImpact = maxHP / 8;
            if (weatherImpact == 0)
                weatherImpact = 1;
        }

        // Healing
        if (gBattleWeather & B_WEATHER_RAIN && holdEffect != HOLD_EFFECT_UTILITY_UMBRELLA)
        {
            if (ability == ABILITY_DRY_SKIN)
            {
                weatherImpact = -(maxHP / 8);
                if (weatherImpact == 0)
                    weatherImpact = -1;
            }
            else if (ability == ABILITY_RAIN_DISH)
            {
                weatherImpact = -(maxHP / 16);
                if (weatherImpact == 0)
                    weatherImpact = -1;
            }
        }
        if (((gBattleWeather & B_WEATHER_HAIL) || (gBattleWeather & B_WEATHER_SNOW)) && ability == ABILITY_ICE_BODY)
        {
            weatherImpact = -(maxHP / 16);
            if (weatherImpact == 0)
                weatherImpact = -1;
        }
    }
    return weatherImpact;
}

// Gets one turn of recurring healing
static u32 GetSwitchinRecurringHealing(enum BattlerId battler)
{
    u32 recurringHealing = 0, maxHP = gBattleMons[battler].maxHP;
    enum Ability ability = gAiLogicData->abilities[battler];
    enum HoldEffect holdEffect = gAiLogicData->holdEffects[battler];

    // Items
    if (ability != ABILITY_KLUTZ)
    {
        if (holdEffect == HOLD_EFFECT_BLACK_SLUDGE && IS_BATTLER_OF_TYPE(battler, TYPE_POISON))
        {
            recurringHealing = maxHP / 16;
            if (recurringHealing == 0)
                recurringHealing = 1;
        }
        else if (holdEffect == HOLD_EFFECT_LEFTOVERS)
        {
            recurringHealing = maxHP / 16;
            if (recurringHealing == 0)
                recurringHealing = 1;
        }
    } // Intentionally omitting Shell Bell for its inconsistency

    // Abilities
    if (ability == ABILITY_POISON_HEAL && (gBattleMons[battler].status1 & STATUS1_POISON))
    {
        u32 healing = maxHP / 8;
        if (healing == 0)
            healing = 1;
        recurringHealing += healing;
    }
    return recurringHealing;
}

// Gets one turn of recurring damage
static u32 GetSwitchinRecurringDamage(enum BattlerId battler)
{
    u32 passiveDamage = 0, maxHP = gBattleMons[battler].maxHP;
    enum Ability ability = gAiLogicData->abilities[battler];
    enum HoldEffect holdEffect = gAiLogicData->holdEffects[battler];

    // Items
    if (ability != ABILITY_MAGIC_GUARD && ability != ABILITY_KLUTZ)
    {
        if (holdEffect == HOLD_EFFECT_BLACK_SLUDGE && IS_BATTLER_OF_TYPE(battler, TYPE_POISON))
        {
            passiveDamage = maxHP / 8;
            if (passiveDamage == 0)
                passiveDamage = 1;
        }
        else if (holdEffect == HOLD_EFFECT_LIFE_ORB && ability != ABILITY_SHEER_FORCE)
        {
            passiveDamage = maxHP / 10;
            if (passiveDamage == 0)
                passiveDamage = 1;
        }
        else if (holdEffect == HOLD_EFFECT_STICKY_BARB)
        {
            passiveDamage = maxHP / 8;
            if (passiveDamage == 0)
                passiveDamage = 1;
        }
    }
    return passiveDamage;
}

// Gets one turn of status damage
static u32 GetSwitchinStatusDamage(enum BattlerId battler)
{
    u8 tSpikesLayers = gSideTimers[GetBattlerSide(battler)].toxicSpikesAmount;
    enum HoldEffect heldItemEffect = gAiLogicData->holdEffects[battler];
    u32 status = gBattleMons[battler].status1;
    enum Ability ability = gAiLogicData->abilities[battler];
    u32 maxHP = gBattleMons[battler].maxHP;
    u32 statusDamage = 0;

    // Status condition damage
    if ((status != 0) && ability != ABILITY_MAGIC_GUARD)
    {
        if (status & STATUS1_BURN)
        {
            if (GetConfig(CONFIG_BURN_DAMAGE) >= GEN_7 || GetConfig(CONFIG_BURN_DAMAGE) == GEN_1)
                statusDamage = maxHP / 16;
            else
                statusDamage = maxHP / 8;
            if (ability == ABILITY_HEATPROOF)
                statusDamage = statusDamage / 2;
            if (statusDamage == 0)
                statusDamage = 1;
        }
        else if (status & STATUS1_FROSTBITE)
        {
            if (GetConfig(CONFIG_BURN_DAMAGE) >= GEN_7 || GetConfig(CONFIG_BURN_DAMAGE) == GEN_1)
                statusDamage = maxHP / 16;
            else
                statusDamage = maxHP / 8;
            if (statusDamage == 0)
                statusDamage = 1;
        }
        else if ((status & STATUS1_POISON) && ability != ABILITY_POISON_HEAL)
        {
            statusDamage = maxHP / 8;
            if (statusDamage == 0)
                statusDamage = 1;
        }
        else if ((status & STATUS1_TOXIC_POISON) && ability != ABILITY_POISON_HEAL)
        {
            if ((status & STATUS1_TOXIC_COUNTER) != STATUS1_TOXIC_TURN(15)) // not 16 turns
                gBattleMons[battler].status1 += STATUS1_TOXIC_TURN(1);
            statusDamage = maxHP / 16;
            if (statusDamage == 0)
                statusDamage = 1;
            statusDamage *= gBattleMons[battler].status1 & STATUS1_TOXIC_COUNTER >> 8;
        }
    }

    // Apply hypothetical poisoning from Toxic Spikes, which means the first turn of damage already added in GetSwitchinHazardsDamage
    // Do this last to skip one iteration of Poison / Toxic damage, and start counting Toxic damage one turn later.
    if (tSpikesLayers != 0 && (IS_BATTLER_OF_TYPE(battler, TYPE_POISON)
        && ability != ABILITY_IMMUNITY && ability != ABILITY_POISON_HEAL
        && status == 0
        && !(heldItemEffect == HOLD_EFFECT_HEAVY_DUTY_BOOTS
            && (((gFieldStatuses & STATUS_FIELD_MAGIC_ROOM) || ability == ABILITY_KLUTZ)))
        && heldItemEffect != HOLD_EFFECT_CURE_PSN && heldItemEffect != HOLD_EFFECT_CURE_STATUS
        && AI_IsBattlerGrounded(battler)))
    {
        if (tSpikesLayers == 1)
        {
            gBattleMons[battler].status1 = STATUS1_POISON; // Assign "hypothetical" status to the switchin candidate so we can get the damage it would take from TSpikes
        }
        if (tSpikesLayers == 2)
        {
            gBattleMons[battler].status1 = STATUS1_TOXIC_POISON; // Assign "hypothetical" status to the switchin candidate so we can get the damage it would take from TSpikes
            gBattleMons[battler].status1 += STATUS1_TOXIC_TURN(1);
        }
    }
    return statusDamage;
}

// Gets number of hits to KO factoring in hazards, healing held items, status, weather, and incoming heals
static u32 GetSwitchinHitsToKO(s32 damageTaken, enum BattlerId battler, const struct IncomingHealInfo *healInfo, u32 originalHp)
{
    u32 hazardDamage = GetSwitchinHazardsDamage(battler);
    u32 hazardCheckHp = healInfo->healBeforeHazards ? gBattleMons[battler].maxHP : gBattleMons[battler].hp;
    u32 startingHP;

    if (healInfo->healAfterHazards)
    {
        // Heal happens after entry damage
        if (hazardDamage >= originalHp)
            return 1;
        startingHP = gBattleMons[battler].maxHP;
    }
    else
    {
        if (hazardDamage >= hazardCheckHp)
            return 1;
        startingHP = hazardCheckHp - hazardDamage;
    }

    s32 weatherImpact = GetSwitchinWeatherImpact(battler); // Signed to handle both damage and healing in the same value
    u32 recurringDamage = GetSwitchinRecurringDamage(battler);
    u32 recurringHealing = GetSwitchinRecurringHealing(battler);
    u32 statusDamage = GetSwitchinStatusDamage(battler);
    u32 hitsToKO = 0;
    u16 maxHP = gBattleMons[battler].maxHP, item = gAiLogicData->items[battler], heldItemEffect = GetItemHoldEffect(item);
    u8 weatherDuration = gBattleStruct->weatherDuration, holdEffectParam = GetItemHoldEffectParam(item);
    enum BattlerId opposingBattler = GetOppositeBattler(battler);
    enum Ability opposingAbility = gAiLogicData->abilities[opposingBattler], ability = gAiLogicData->abilities[battler];
    bool32 usedSingleUseHealingItem = FALSE, opponentCanBreakMold = IsMoldBreakerTypeAbility(opposingBattler, opposingAbility);
    s32 currentHP = startingHP, singleUseItemHeal = 0;
    bool32 applyWishNow = healInfo->healEndOfTurn && healInfo->wishCounter == 1;

    // No damage being dealt
    if ((damageTaken + statusDamage + recurringDamage <= recurringHealing) || damageTaken + statusDamage + recurringDamage == 0)
        return hitsToKO;

    // Mon fainted to hazards
    if (startingHP == 0)
        return 1;

    // Find hits to KO
    while (currentHP > 0)
    {
        // Remove weather damage when it would run out
        if (weatherImpact != 0 && weatherDuration == 0)
            weatherImpact = 0;

        // Take attack damage for the turn
        currentHP = currentHP - damageTaken;

        // One shot prevention effects
        if (damageTaken >= maxHP && startingHP == maxHP && (heldItemEffect == HOLD_EFFECT_FOCUS_SASH || (!opponentCanBreakMold && GetConfig(CONFIG_STURDY) >= GEN_5 && ability == ABILITY_STURDY)) && hitsToKO < 1)
            currentHP = 1;

        // If mon is still alive, apply weather impact first, as it might KO the mon before it can heal with its item (order is weather -> item -> status)
        if (currentHP > 0)
            currentHP = currentHP - weatherImpact;

        // Check if we're at a single use healing item threshold
        if (currentHP > 0 && gAiLogicData->abilities[battler] != ABILITY_KLUTZ && usedSingleUseHealingItem == FALSE
         && !(opposingAbility == ABILITY_UNNERVE && GetItemPocket(item) == POCKET_BERRIES))
        {
            switch (heldItemEffect)
            {
            case HOLD_EFFECT_RESTORE_HP:
                if (currentHP < maxHP / 2)
                    singleUseItemHeal = holdEffectParam;
                break;
            case HOLD_EFFECT_RESTORE_PCT_HP:
                if (currentHP < maxHP / 2)
                {
                    singleUseItemHeal = maxHP / holdEffectParam;
                    if (singleUseItemHeal == 0)
                        singleUseItemHeal = 1;
                }
                break;
            case HOLD_EFFECT_CONFUSE_SPICY:
            case HOLD_EFFECT_CONFUSE_DRY:
            case HOLD_EFFECT_CONFUSE_SWEET:
            case HOLD_EFFECT_CONFUSE_BITTER:
            case HOLD_EFFECT_CONFUSE_SOUR:
                if (currentHP < maxHP / CONFUSE_BERRY_HP_FRACTION)
                {
                    singleUseItemHeal = maxHP / holdEffectParam;
                    if (singleUseItemHeal == 0)
                        singleUseItemHeal = 1;
                }
                break;
            }

            // If we used one, apply it without overcapping our maxHP
            if (singleUseItemHeal > 0)
            {
                if ((currentHP + singleUseItemHeal) > maxHP)
                    currentHP = maxHP;
                else
                    currentHP = currentHP + singleUseItemHeal;
                usedSingleUseHealingItem = TRUE;
            }
        }

        // Healing from items occurs before status so we can do the rest in one line
        if (currentHP > 0)
            currentHP = currentHP + recurringHealing - recurringDamage - statusDamage;

        // Wish healing happens at the end of the turn when it is due this turn.
        if (applyWishNow && currentHP > 0)
        {
            currentHP += healInfo->healAmount;
            if (currentHP > maxHP)
                currentHP = maxHP;
            applyWishNow = FALSE;
        }

        // Recalculate toxic damage if needed
        if (gBattleMons[battler].status1 & STATUS1_TOXIC_POISON)
            statusDamage = GetSwitchinStatusDamage(battler);

        // Reduce weather duration
        if (weatherDuration != 0)
            weatherDuration--;

        hitsToKO++;
    }

    // Disguise will always add an extra hit to KO
    if (!opponentCanBreakMold && IsMimikyuDisguised(battler))
        hitsToKO++;

    return hitsToKO;
}

static u32 GetBattlerTypeMatchup(enum BattlerId opposingBattler, enum BattlerId battler)
{
    // Check type matchup
    uq4_12_t typeEffectiveness1 = UQ_4_12(1.0), typeEffectiveness2 = UQ_4_12(1.0);
    enum Type atkType1 = gBattleMons[opposingBattler].types[0], atkType2 = gBattleMons[opposingBattler].types[1];
    enum Type defType1 = gBattleMons[battler].types[0], defType2 = gBattleMons[battler].types[1];

    // Add each independent defensive type matchup together
    typeEffectiveness1 = uq4_12_multiply(typeEffectiveness1, (GetTypeModifier(atkType1, defType1)));
    if (defType2 != defType1)
        typeEffectiveness1 = uq4_12_multiply(typeEffectiveness1, (GetTypeModifier(atkType1, defType2)));
    if (typeEffectiveness1 == 0) // Immunity
        typeEffectiveness1 = UQ_4_12(0.1);

    if (atkType2 != atkType1)
    {
        typeEffectiveness2 = uq4_12_multiply(typeEffectiveness2, (GetTypeModifier(atkType2, defType1)));
        if (defType2 != defType1)
            typeEffectiveness2 = uq4_12_multiply(typeEffectiveness2, (GetTypeModifier(atkType2, defType2)));
        if (typeEffectiveness2 == 0) // Immunity
            typeEffectiveness2 = UQ_4_12(0.1);
    }
    else
    {
        typeEffectiveness2 = typeEffectiveness1;
    }

    return typeEffectiveness1 + typeEffectiveness2;
}

static u32 GetSwitchinCandidate(u32 switchinCategory, enum BattlerId battler, int firstId, int lastId, enum SwitchType switchType)
{
    if (switchinCategory == 0)
        return PARTY_SIZE;

    // Randomize between eligible mons
    if (gAiThinkingStruct->aiFlags[battler] & AI_FLAG_RANDOMIZE_SWITCHIN)
    {
        // This split is necessary because the test system can't handle multiple calls with the same random tag in the same turn
        if (switchType == SWITCH_AFTER_KO)
            return RandomBitIndex(RNG_AI_RANDOM_SWITCHIN_POST_KO, switchinCategory); // Can't pass this anything with no set bits
        else
            return RandomBitIndex(RNG_AI_RANDOM_SWITCHIN_MID_BATTLE, switchinCategory); // Can't pass this anything with no set bits
    }

    // Pick last eligible mon in party order
    for (s32 monIndex = (lastId-1); monIndex >= firstId; monIndex--)
    {
        if (switchinCategory & (1 << monIndex))
            return monIndex;
    }

    return PARTY_SIZE;
}

static u32 GetValidSwitchinCandidate(u32 validMonIds, enum BattlerId battler, u32 firstId, u32 lastId, enum SwitchType switchType)
{
    if (validMonIds == 0)
        return PARTY_SIZE;

    // Randomize between valid mons
    if ((gAiThinkingStruct->aiFlags[battler] & AI_FLAG_RANDOMIZE_SWITCHIN) && RANDOMIZE_SWITCHIN_ANY_VALID)
    {
        // This split is necessary because the test system can't handle multiple calls with the same random tag in the same turn
        if (switchType == SWITCH_AFTER_KO)
            return RandomBitIndex(RNG_AI_RANDOM_VALID_SWITCHIN_POST_KO, validMonIds); // Can't pass this anything with no set bits
        else
            return RandomBitIndex(RNG_AI_RANDOM_VALID_SWITCHIN_MID_BATTLE, validMonIds); // Can't pass this anything with no set bits
    }

    // Pick last valid mon in party order
    for (s32 monIndex = (lastId-1); monIndex > firstId; monIndex--)
    {
        if (validMonIds & (1 << monIndex))
            return monIndex;
    }

    return PARTY_SIZE;
}

static s32 GetMaxDamagePlayerCouldDealToSwitchin(enum BattlerId battler, enum BattlerId opposingBattler, enum Move *bestPlayerMove)
{
    enum Move playerMove;
    enum Move *playerMoves = GetMovesArray(opposingBattler);
    s32 damageTaken = 0, maxDamageTaken = 0;

    for (u32 moveIndex = 0; moveIndex < MAX_MON_MOVES; moveIndex++)
    {
        playerMove = SMART_SWITCHING_OMNISCIENT ? gBattleMons[opposingBattler].moves[moveIndex] : playerMoves[moveIndex];
        if (playerMove != MOVE_NONE && !IsBattleMoveStatus(playerMove) && GetMoveEffect(playerMove) != EFFECT_FOCUS_PUNCH && gBattleMons[opposingBattler].pp[moveIndex] > 0)
        {
            damageTaken = AI_GetDamage(opposingBattler, battler, moveIndex, AI_DEFENDING, gAiLogicData);
            if (playerMove == gBattleStruct->choicedMove[opposingBattler]) // If player is choiced, only care about the choice locked move
            {
                *bestPlayerMove = playerMove;
                return damageTaken;
            }
            if (damageTaken > maxDamageTaken)
            {
                maxDamageTaken = damageTaken;
                *bestPlayerMove = playerMove;
            }
        }
    }
    return maxDamageTaken;
}

static s32 GetMaxPriorityDamagePlayerCouldDealToSwitchin(enum BattlerId battler, enum BattlerId opposingBattler, enum Move *bestPlayerPriorityMove)
{
    enum Move playerMove;
    enum Move *playerMoves = GetMovesArray(opposingBattler);
    s32 damageTaken = 0, maxDamageTaken = 0;

    for (u32 moveIndex = 0; moveIndex < MAX_MON_MOVES; moveIndex++)
    {
        // If player is choiced into a non-priority move, AI understands that it can't deal priority damage
        if (gBattleStruct->choicedMove[opposingBattler] != MOVE_NONE && GetMovePriority(gBattleStruct->choicedMove[opposingBattler]) < 1)
            break;
        playerMove = SMART_SWITCHING_OMNISCIENT ? gBattleMons[opposingBattler].moves[moveIndex] : playerMoves[moveIndex];
        if (GetBattleMovePriority(opposingBattler, gAiLogicData->abilities[opposingBattler], playerMove) > 0
            && playerMove != MOVE_NONE && !IsBattleMoveStatus(playerMove) && GetMoveEffect(playerMove) != EFFECT_FOCUS_PUNCH && gBattleMons[opposingBattler].pp[moveIndex] > 0)
        {
            damageTaken = AI_GetDamage(opposingBattler, battler, moveIndex, AI_DEFENDING, gAiLogicData);
            if (playerMove == gBattleStruct->choicedMove[opposingBattler]) // If player is choiced, only care about the choice locked move
            {
                *bestPlayerPriorityMove = playerMove;
                return damageTaken;
            }
            if (damageTaken > maxDamageTaken)
            {
                maxDamageTaken = damageTaken;
                *bestPlayerPriorityMove = playerMove;
            }
        }
    }
    return maxDamageTaken;
}

static bool32 AI_CanSwitchinAbilityTrapOpponent(enum Ability ability, enum BattlerId opposingBattler)
{
    if (AI_CanBattlerEscape(opposingBattler))
        return FALSE;
    if (gBattleTypeFlags & BATTLE_TYPE_TRAINER && CountUsablePartyMons(opposingBattler) == 0)
        return FALSE;
    else if (ability == ABILITY_SHADOW_TAG)
    {
        if (B_SHADOW_TAG_ESCAPE >= GEN_4 && gAiLogicData->abilities[opposingBattler] == ABILITY_SHADOW_TAG)
            return FALSE;
        else
            return TRUE;
    }
    else if (ability == ABILITY_ARENA_TRAP && IsBattlerGrounded(opposingBattler, gAiLogicData->abilities[opposingBattler], gAiLogicData->holdEffects[opposingBattler]))
        return TRUE;
    else if (ability == ABILITY_MAGNET_PULL && IS_BATTLER_OF_TYPE(opposingBattler, TYPE_STEEL))
        return TRUE;
    else
        return FALSE;
}

static inline bool32 IsFreeSwitch(enum SwitchType switchType, enum BattlerId battlerSwitchingOut, enum BattlerId opposingBattler)
{
    bool32 movedSecond = GetBattlerTurnOrderNum(battlerSwitchingOut) > GetBattlerTurnOrderNum(opposingBattler) ? TRUE : FALSE;

    // Switch out effects
    if (!IsDoubleBattle()) // Not handling doubles' additional complexity
    {
        if (IsSwitchOutEffect(GetMoveEffect(gCurrentMove)) && movedSecond)
            return TRUE;
        if (gAiLogicData->ejectButtonSwitch)
            return TRUE;
        if (gAiLogicData->ejectPackSwitch)
        {
            enum Ability opposingAbility = GetBattlerAbilityIgnoreMoldBreaker(opposingBattler);
            // If faster, not a free switch; likely lowered own stats
            if (!movedSecond && opposingAbility != ABILITY_INTIMIDATE && opposingAbility != ABILITY_SUPERSWEET_SYRUP) // Intimidate triggers switches before turn starts
                return FALSE;
            // Otherwise, free switch
            return TRUE;
        }
    }

    // Post KO check has to be last because the GetMostSuitableMonToSwitchInto call in OpponentHandleChoosePokemon assumes a KO rather than a forced switch choice
    if (switchType == SWITCH_AFTER_KO)
        return TRUE;
    else
        return FALSE;
}

static inline bool32 CanSwitchinWin1v1(u32 hitsToKOAI, u32 hitsToKOPlayer, bool32 isSwitchinFirst, bool32 isFreeSwitch)
{
    // Player's best move deals 0 damage
    if (hitsToKOAI == 0 && hitsToKOPlayer > 0)
        return TRUE;

    // AI's best move deals 0 damage
    if (hitsToKOPlayer == 0 && hitsToKOAI > 0)
        return FALSE;

    // Neither mon can damage the other
    if (hitsToKOPlayer == 0 && hitsToKOAI == 0)
        return FALSE;

    // Free switch, need to outspeed or take 1 extra hit
    if (isFreeSwitch)
    {
        if (hitsToKOAI > hitsToKOPlayer || (hitsToKOAI == hitsToKOPlayer && isSwitchinFirst))
            return TRUE;
    }
    // Mid battle switch, need to take 1 or 2 extra hits depending on speed
    if (hitsToKOAI > hitsToKOPlayer + 1 || (hitsToKOAI == hitsToKOPlayer + 1 && isSwitchinFirst))
        return TRUE;
    return FALSE;
}

// This function splits switching behaviour depending on whether the switch is free.
// Everything runs in the same loop to minimize computation time. This makes it harder to read, but hopefully the comments can guide you!
static u32 GetBestMonIntegrated(struct Pokemon *party, int firstId, int lastId, enum BattlerId battler, enum BattlerId opposingBattler, enum BattlerId battlerIn1, enum BattlerId battlerIn2, enum SwitchType switchType)
{
    struct IncomingHealInfo healInfoData;
    const struct IncomingHealInfo *healInfo = &healInfoData;
    u32 revengeKillerIds = 0, slowRevengeKillerIds = 0, fastThreatenIds = 0, slowThreatenIds = 0, damageMonIds = 0, generic1v1MonIds = 0;
    u32 batonPassIds = 0, typeMatchupIds = 0, typeMatchupEffectiveIds = 0, defensiveMonIds = 0, trapperIds = 0, healingCandidateIds = 0;
    u32 aceMonId = PARTY_SIZE, aceMonCount = 0;
    s32 defensiveMonHitKOThreshold = 3; // 3HKO threshold that candidate defensive mons must exceed
    s32 playerMonHP = gBattleMons[opposingBattler].hp, maxDamageDealt = 0, damageDealt = 0, bestHealGain = 0;
    enum Move aiMove, bestPlayerMove = MOVE_NONE, bestPlayerPriorityMove = MOVE_NONE;
    u32 hitsToKOAI, hitsToKOPlayer, hitsToKOAIPriority,  maxHitsToKO = 0;
    u32 bestResist = UQ_4_12(2.0), bestResistEffective = UQ_4_12(2.0), typeMatchup; // 2.0 is the default "Neutral" matchup from GetBattlerTypeMatchup
    bool32 isFreeSwitch = IsFreeSwitch(switchType, battlerIn1, opposingBattler), isSwitchinFirst, isSwitchinFirstPriority, canSwitchinWin1v1;
    u32 validMonIds = 0;

    GetIncomingHealInfo(battler, &healInfoData);

    // Save existing battler data
    struct AiLogicData *savedAiLogicData = AllocSaveAiLogicData();
    struct BattlePokemon *savedBattleMons = AllocSaveBattleMons();

    // Iterate through mons
    for (u32 monIndex = firstId; monIndex < lastId; monIndex++)
    {
        // Check mon validity
        if (!IsValidForBattle(&party[monIndex]) || IsPartyMonOnFieldOrChosenToSwitch(monIndex, battlerIn1, battlerIn2))
        {
            continue;
        }
        // Save Ace Pokemon for last
        else if (IsAceMon(battler, monIndex))
        {
            aceMonId = monIndex;
            aceMonCount++;
            continue;
        }
        else
        {
            validMonIds |= (1u << monIndex);
        }

        InitializeSwitchinCandidate(battler, &party[monIndex]);

        u32 originalHp = gBattleMons[battler].hp;

        if (healInfo->healBeforeHazards)
        {
            gBattleMons[battler].hp = gBattleMons[battler].maxHP;
            if (healInfo->curesStatus)
                gBattleMons[battler].status1 = 0;
        }

        // While not really invalid per se, not really wise to switch into this mon
        if (gAiLogicData->abilities[battler] == ABILITY_TRUANT && IsTruantMonVulnerable(battler, opposingBattler))
            continue;

        // Get max number of hits for player to KO AI mon and type matchup for defensive switching
        hitsToKOAI = GetSwitchinHitsToKO(GetMaxDamagePlayerCouldDealToSwitchin(battler, opposingBattler, &bestPlayerMove), battler, healInfo, originalHp);
        hitsToKOAIPriority = GetSwitchinHitsToKO(GetMaxPriorityDamagePlayerCouldDealToSwitchin(battler, opposingBattler, &bestPlayerPriorityMove), battler, healInfo, originalHp);
        typeMatchup = GetBattlerTypeMatchup(opposingBattler, battler);
        canSwitchinWin1v1 = FALSE;
        bool32 anyMoveCanWin1v1 = FALSE;

        // Check through current mon's moves
        for (u32 moveIndex = 0; moveIndex < MAX_MON_MOVES; moveIndex++)
        {
            // Check that move has PP remaining before running calcs
            if (gBattleMons[battler].pp[moveIndex] < 1)
                continue;

            aiMove = gBattleMons[battler].moves[moveIndex];
            damageDealt = AI_GetDamage(battler, opposingBattler, moveIndex, AI_ATTACKING, gAiLogicData);
            hitsToKOPlayer = GetNoOfHitsToKOBattler(battler, opposingBattler, moveIndex, AI_ATTACKING, CONSIDER_ENDURE);

            // Offensive switchin decisions are based on which whether switchin moves first and whether it can win a 1v1
            isSwitchinFirst = AI_IsFaster(battler, opposingBattler, aiMove, bestPlayerMove, CONSIDER_PRIORITY);
            isSwitchinFirstPriority = AI_IsFaster(battler, opposingBattler, aiMove, bestPlayerPriorityMove, CONSIDER_PRIORITY);
            canSwitchinWin1v1 = CanSwitchinWin1v1(hitsToKOAI, hitsToKOPlayer, isSwitchinFirst, isFreeSwitch) && CanSwitchinWin1v1(hitsToKOAIPriority, hitsToKOPlayer, isSwitchinFirstPriority, isFreeSwitch); // AI must successfully 1v1 with and without priority to be considered a good option
            anyMoveCanWin1v1 |= canSwitchinWin1v1;

            // Check for Baton Pass; hitsToKO requirements mean mon can boost and BP without dying whether it's slower or not
            if (GetMoveEffect(aiMove) == EFFECT_BATON_PASS)
            {
                if ((isSwitchinFirst && hitsToKOAI > 1) || hitsToKOAI > 2) // Need to take an extra hit if slower
                    batonPassIds |= (1u << monIndex);
            }

            // Check that good type matchups get at least two turns and set best type matchup mon
            if (typeMatchup < bestResist)
            {
                if (canSwitchinWin1v1)
                {
                    bestResist = typeMatchup;
                    typeMatchupIds |= (1u << monIndex);
                }
            }

            // Track max hits to KO and set defensive mon
            if (hitsToKOAI > maxHitsToKO && (canSwitchinWin1v1 || gAiThinkingStruct->aiFlags[battler] & AI_FLAG_STALL))
            {
                maxHitsToKO = hitsToKOAI;
                if (maxHitsToKO > defensiveMonHitKOThreshold)
                    defensiveMonIds |= (1u << monIndex);
            }

            if (canSwitchinWin1v1)
                generic1v1MonIds |= (1u << monIndex);

            // Check for mon with resistance and super effective move for best type matchup mon with effective move
            if (aiMove != MOVE_NONE && !IsBattleMoveStatus(aiMove))
            {
                if (typeMatchup < bestResistEffective)
                {
                    if (gAiLogicData->effectiveness[battler][opposingBattler][moveIndex] >= UQ_4_12(2.0))
                    {
                        if (canSwitchinWin1v1)
                        {
                            bestResistEffective = typeMatchup;
                            typeMatchupEffectiveIds |= (1u << monIndex);
                        }
                    }
                }

                // If a self destruction move doesn't OHKO, don't factor it into revenge killing
                if (IsExplosionMove(aiMove) && damageDealt < playerMonHP)
                    continue;

                // Check that mon isn't one shot and set best damage mon
                if (damageDealt > maxDamageDealt)
                {
                    if ((isFreeSwitch && hitsToKOAI > 1) || hitsToKOAI > 2) // This is a "default", we have uniquely low standards
                    {
                        maxDamageDealt = damageDealt;
                        damageMonIds |= (1u << monIndex);
                    }
                }

                // Check if current mon can revenge kill in some capacity
                // If AI mon can one shot
                if (damageDealt >= playerMonHP)
                {
                    if (canSwitchinWin1v1)
                    {
                        if (isSwitchinFirst)
                            revengeKillerIds |= (1u << monIndex);
                        else
                            slowRevengeKillerIds |= (1u << monIndex);
                    }
                }

                // If AI mon can two shot
                if (damageDealt >= (playerMonHP / 2 + playerMonHP % 2)) // Modulo to handle odd numbers in non-decimal division
                {
                    if (canSwitchinWin1v1)
                    {
                        if (isSwitchinFirst)
                            fastThreatenIds |= (1u << monIndex);
                        else
                            slowThreatenIds |= (1u << monIndex);
                    }
                }

                // If mon can trap
                if ((AI_CanSwitchinAbilityTrapOpponent(gAiLogicData->abilities[battler], opposingBattler)
                    || (AI_CanSwitchinAbilityTrapOpponent(gAiLogicData->abilities[opposingBattler], opposingBattler) && gAiLogicData->abilities[battler] == ABILITY_TRACE))
                    && canSwitchinWin1v1)
                    trapperIds |= (1u << monIndex);
            }
        }

        // Check for healing candidate - mon that benefits significantly from incoming heal
        if (healInfo->hasHealing)
        {
            u32 maxHP = gBattleMons[battler].maxHP;
            s32 healGain = (s32)maxHP - (s32)originalHp;

            // For Wish, heal gain is the wish amount (capped at what can actually be gained)
            if (healInfo->healEndOfTurn && !healInfo->healBeforeHazards && !healInfo->healAfterHazards)
            {
                healGain = healInfo->healAmount;
                if (healGain > (s32)(maxHP - originalHp))
                    healGain = (s32)(maxHP - originalHp);
            }

            // Require significant heal gain (at least 25% of max HP), must win 1v1 with at least one move, and pick the best
            if (anyMoveCanWin1v1 && healGain > (s32)(maxHP / 4) && healGain > bestHealGain)
            {
                bestHealGain = healGain;
                healingCandidateIds |= (1u << monIndex);
            }
        }
    }

    // Restore battler data
    FreeRestoreAiLogicData(savedAiLogicData);
    FreeRestoreBattleMons(savedBattleMons);
    SetBattlerAiData(battler, gAiLogicData);

    // Different switching priorities depending on switching mid battle vs switching after a KO or slow switch
    if (isFreeSwitch)
    {
        // Return Trapper > Revenge Killer > Type Matchup > Healing Candidate > Baton Pass > Best Damage
        if (trapperIds != 0)                    return GetSwitchinCandidate(trapperIds, battler, firstId, lastId, switchType);
        else if (revengeKillerIds != 0)         return GetSwitchinCandidate(revengeKillerIds, battler, firstId, lastId, switchType);
        else if (slowRevengeKillerIds != 0)     return GetSwitchinCandidate(slowRevengeKillerIds, battler, firstId, lastId, switchType);
        else if (fastThreatenIds != 0)          return GetSwitchinCandidate(fastThreatenIds, battler, firstId, lastId, switchType);
        else if (slowThreatenIds != 0)          return GetSwitchinCandidate(slowThreatenIds, battler, firstId, lastId, switchType);
        else if (typeMatchupEffectiveIds != 0)  return GetSwitchinCandidate(typeMatchupEffectiveIds, battler, firstId, lastId, switchType);
        else if (typeMatchupIds != 0)           return GetSwitchinCandidate(typeMatchupIds, battler, firstId, lastId, switchType);
        else if (healingCandidateIds != 0)      return GetSwitchinCandidate(healingCandidateIds, battler, firstId, lastId, switchType);
        else if (batonPassIds != 0)             return GetSwitchinCandidate(batonPassIds, battler, firstId, lastId, switchType);
        else if (generic1v1MonIds != 0)         return GetSwitchinCandidate(generic1v1MonIds, battler, firstId, lastId, switchType);
        else if (damageMonIds != 0)             return GetSwitchinCandidate(damageMonIds, battler, firstId, lastId, switchType);
    }
    else
    {
        // Return Trapper > Type Matchup > Best Defensive > Healing Candidate > Baton Pass
        if (trapperIds != 0)                    return GetSwitchinCandidate(trapperIds, battler, firstId, lastId, switchType);
        else if (typeMatchupEffectiveIds != 0)  return GetSwitchinCandidate(typeMatchupEffectiveIds, battler, firstId, lastId, switchType);
        else if (typeMatchupIds != 0)           return GetSwitchinCandidate(typeMatchupIds, battler, firstId, lastId, switchType);
        else if (defensiveMonIds != 0)          return GetSwitchinCandidate(defensiveMonIds, battler, firstId, lastId, switchType);
        else if (healingCandidateIds != 0)      return GetSwitchinCandidate(healingCandidateIds, battler, firstId, lastId, switchType);
        else if (batonPassIds != 0)             return GetSwitchinCandidate(batonPassIds, battler, firstId, lastId, switchType);
        else if (generic1v1MonIds != 0)         return GetSwitchinCandidate(generic1v1MonIds, battler, firstId, lastId, switchType);
    }

    // Not required to switch here and no good candidates, bail
    if (switchType == SWITCH_MID_BATTLE_OPTIONAL)
        return PARTY_SIZE;

    // Fallback
    if (validMonIds != 0)
        return GetValidSwitchinCandidate(validMonIds, battler, firstId, lastId, switchType);

    // If ace mon is the last available Pokemon and U-Turn/Volt Switch or Eject Pack/Button was used - switch to the mon.
    if (aceMonId != PARTY_SIZE && CountUsablePartyMons(battler) <= aceMonCount)
        return aceMonId;

    return PARTY_SIZE;
}

static u32 GetBestMonVanilla(struct Pokemon *party, int firstId, int lastId, enum BattlerId battler, enum BattlerId opposingBattler, enum BattlerId battlerIn1, enum BattlerId battlerIn2, enum SwitchType switchType)
{
    s32 aceMonCount = 0;
    u32 validMonIds = 0, batonPassIds = 0, typeMatchupIds = 0, bestDamageId = PARTY_SIZE, aceMonId = PARTY_SIZE;
    u32 bestResist = UQ_4_12(2.0), typeMatchup, bestDamage = 0;

    // Save existing battler data
    struct AiLogicData *savedAiLogicData = AllocSaveAiLogicData();
    struct BattlePokemon *savedBattleMons = AllocSaveBattleMons();

    // Iterate through mons
    for (u32 monIndex = firstId; monIndex < lastId; monIndex++)
    {
        // Check mon validity
        if (!IsValidForBattle(&party[monIndex]) || IsPartyMonOnFieldOrChosenToSwitch(monIndex, battlerIn1, battlerIn2))
        {
            continue;
        }
        // Save Ace Pokemon for last
        else if (IsAceMon(battler, monIndex))
        {
            aceMonId = monIndex;
            aceMonCount++;
            continue;
        }
        else
        {
            validMonIds |= (1u << monIndex);
        }
        InitializeSwitchinCandidate(battler, &party[monIndex]);

        // While not really invalid per se, not really wise to switch into this mon
        if (gAiLogicData->abilities[battler] == ABILITY_TRUANT && IsTruantMonVulnerable(battler, opposingBattler))
            continue;

        typeMatchup = GetBattlerTypeMatchup(opposingBattler, battler);

        for (u32 moveIndex = 0; moveIndex < MAX_MON_MOVES; moveIndex++)
        {
            // Check that move has PP remaining before running calcs
            if (gBattleMons[battler].pp[moveIndex] < 1)
                continue;

            enum Move aiMove = gBattleMons[battler].moves[moveIndex];

            // Baton Pass
            if (GetMoveEffect(aiMove) == EFFECT_BATON_PASS)
            {
                batonPassIds |= (1u << monIndex);
            }

            // Type Matchup
            if (typeMatchup < bestResist && gAiLogicData->effectiveness[battler][opposingBattler][moveIndex] >= UQ_4_12(2.0))
            {
                bestResist = typeMatchup;
                typeMatchupIds |= (1u << monIndex);
            }

            // Best damage
            if (aiMove != MOVE_NONE && !IsBattleMoveStatus(aiMove))
            {
                u32 aiDmg = AI_GetDamage(battler, opposingBattler, moveIndex, AI_ATTACKING, gAiLogicData);
                if (aiDmg > bestDamage)
                {
                    bestDamage = aiDmg;
                    bestDamageId = monIndex;
                }
            }
        }
    }

    // Restore battler data
    FreeRestoreAiLogicData(savedAiLogicData);
    FreeRestoreBattleMons(savedBattleMons);
    SetBattlerAiData(battler, gAiLogicData);

    // Baton Pass > Type Matchup > Best Damage
    if (batonPassIds != 0)                  return GetSwitchinCandidate(batonPassIds, battler, firstId, lastId, switchType);
    else if (typeMatchupIds != 0)           return GetSwitchinCandidate(typeMatchupIds, battler, firstId, lastId, switchType);
    else if (bestDamageId != PARTY_SIZE)    return bestDamageId;

    // Not required to switch here and no good candidates, bail
    if (switchType == SWITCH_MID_BATTLE_OPTIONAL)
        return PARTY_SIZE;

    // Fallback
    if (validMonIds != 0)
        return GetValidSwitchinCandidate(validMonIds, battler, firstId, lastId, switchType);

    if (aceMonId != PARTY_SIZE && CountUsablePartyMons(battler) <= aceMonCount)
        return aceMonId;

    return PARTY_SIZE;
}

static u32 GetNextMonInParty(struct Pokemon *party, int firstId, int lastId, enum BattlerId battlerIn1, enum BattlerId battlerIn2)
{
    // Iterate through mons
    for (u32 monIndex = firstId; monIndex < lastId; monIndex++)
    {
        // Check mon validity
        if (!IsValidForBattle(&party[monIndex]) || IsPartyMonOnFieldOrChosenToSwitch(monIndex, battlerIn1, battlerIn2))
        {
            continue;
        }
        return monIndex;
    }
    return PARTY_SIZE;
}

u32 GetMostSuitableMonToSwitchInto(enum BattlerId battler, enum SwitchType switchType)
{
    enum BattlerId opposingBattler = 0;
    u32 bestMonId = PARTY_SIZE;
    enum BattlerId battlerIn1 = 0, battlerIn2 = 0;
    s32 firstId = 0;
    s32 lastId = 0; // + 1
    struct Pokemon *party;

    if (gBattleStruct->monToSwitchIntoId[battler] != PARTY_SIZE)
        return gBattleStruct->monToSwitchIntoId[battler];
    if (gBattleTypeFlags & BATTLE_TYPE_ARENA)
        return gBattlerPartyIndexes[battler] + 1;

    opposingBattler = GetActiveBattlerIds(battler, &battlerIn1, &battlerIn2);
    GetAIPartyIndexes(battler, &firstId, &lastId);
    party = GetBattlerParty(battler);

    if (gAiThinkingStruct->aiFlags[battler] & AI_FLAG_SEQUENCE_SWITCHING)
    {
        bestMonId = GetNextMonInParty(party, firstId, lastId, battlerIn1, battlerIn2);
        return bestMonId;
    }

    // Only use better mon selection if AI_FLAG_SMART_MON_CHOICES is set for the trainer.
    if (gAiThinkingStruct->aiFlags[battler] & AI_FLAG_SMART_MON_CHOICES && !IsDoubleBattle()) // Double Battles aren't included in AI_FLAG_SMART_MON_CHOICE. Defaults to regular switch in logic
    {
        bestMonId = GetBestMonIntegrated(party, firstId, lastId, battler, opposingBattler, battlerIn1, battlerIn2, switchType);
        return bestMonId;
    }

    // This all handled by the GetBestMonIntegrated function if the AI_FLAG_SMART_MON_CHOICES flag is set
    else
    {
        bestMonId = GetBestMonVanilla(party, firstId, lastId, battler, opposingBattler, battlerIn1, battlerIn2, switchType);
        return bestMonId;
    }
}

u32 AI_SelectRevivalBlessingMon(enum BattlerId battler)
{
    s32 firstId = 0, lastId = 0;
    enum BattlerId opposingBattler = 0;
    struct Pokemon *party = GetBattlerParty(battler);
    u32 bestMonId = PARTY_SIZE;
    s32 bestScore = -1;

    if (IsDoubleBattle())
    {
        opposingBattler = BATTLE_OPPOSITE(battler);
        if (gAbsentBattlerFlags & (1u << opposingBattler))
            opposingBattler ^= BIT_FLANK;
    }
    else
    {
        opposingBattler = GetOppositeBattler(battler);
    }

    // Save existing battler data
    struct AiLogicData *savedAiLogicData = AllocSaveAiLogicData();
    struct BattlePokemon *savedBattleMons = AllocSaveBattleMons();

    GetAIPartyIndexes(battler, &firstId, &lastId);

    for (u32 monIndex = firstId; monIndex < lastId; monIndex++)
    {
        if (GetMonData(&party[monIndex], MON_DATA_HP) != 0)
            continue; // Only consider fainted mons

        bool32 isAceMon = IsAceMon(battler, monIndex);

        InitializeSwitchinCandidate(battler, &party[monIndex]);
        gBattleMons[battler].hp = gBattleMons[battler].maxHP / 2; // Revival Blessing restores half HP
        gBattleMons[battler].status1 = 0;

        // Avoid reviving something that will immediately faint to hazards
        if (GetSwitchinHazardsDamage(battler) >= gBattleMons[battler].hp)
            continue;

        s32 bestDamage = 0;
        for (u32 moveIndex = 0; moveIndex < MAX_MON_MOVES; moveIndex++)
        {
            enum Move aiMove = gBattleMons[battler].moves[moveIndex];
            if (aiMove == MOVE_NONE || gBattleMons[battler].pp[moveIndex] == 0)
                continue;

            s32 damage = AI_GetDamage(battler, opposingBattler, moveIndex, AI_ATTACKING, gAiLogicData);
            if (damage > bestDamage)
                bestDamage = damage;
        }

        u32 typeMatchup = GetBattlerTypeMatchup(opposingBattler, battler);
        s32 score = bestDamage + gBattleMons[battler].maxHP;

        // Reviving the ace is usually high value. give it a small bonus but still let matchup/coverage decide
        if (isAceMon)
            score += gBattleMons[battler].maxHP / 3;

        // Prefer mons that don't face a terrible defensive matchup on entry
        if (typeMatchup < UQ_4_12(1.0))
            score += gBattleMons[battler].maxHP / 4;
        else if (typeMatchup > UQ_4_12(4.0))
            score -= gBattleMons[battler].maxHP / 4;

        if (score > bestScore)
        {
            bestScore = score;
            bestMonId = monIndex;
        }
    }

    // Restore battler data
    FreeRestoreAiLogicData(savedAiLogicData);
    FreeRestoreBattleMons(savedBattleMons);
    SetBattlerAiData(battler, gAiLogicData);

    if (bestMonId == PARTY_SIZE)
        bestMonId = GetFirstFaintedPartyIndex(battler);

    return bestMonId;
}
