#include "global.h"
#include "battle.h"
#include "constants/battle_ai.h"
#include "battle_ai_main.h"
#include "battle_ai_util.h"
#include "battle_util.h"
#include "battle_anim.h"
#include "battle_controllers.h"
#include "battle_main.h"
#include "constants/hold_effects.h"
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
static bool32 CanUseSuperEffectiveMoveAgainstOpponents(u32 battler);
static bool32 FindMonWithFlagsAndSuperEffective(u32 battler, u16 flags, u32 moduloPercent);
static bool32 ShouldUseItem(u32 battler);
static bool32 AiExpectsToFaintPlayer(u32 battler);
static bool32 AI_ShouldHeal(u32 battler, u32 healAmount);
static bool32 AI_OpponentCanFaintAiWithMod(u32 battler, u32 healAmount);
static u32 GetSwitchinHazardsDamage(u32 battler, struct BattlePokemon *battleMon);
static bool32 CanAbilityTrapOpponent(u16 ability, u32 opponent);
static u32 GetHPHealAmount(u8 itemEffectParam, struct Pokemon *mon);

static void InitializeSwitchinCandidate(struct Pokemon *mon)
{
    PokemonToBattleMon(mon, &gAiLogicData->switchinCandidate.battleMon);
    gAiLogicData->switchinCandidate.hypotheticalStatus = FALSE;
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
        default:
            return 100;
    }
}

static bool32 IsAceMon(u32 battler, u32 monPartyId)
{
    if (gAiThinkingStruct->aiFlags[GetThinkingBattler(battler)] & AI_FLAG_ACE_POKEMON
            && !gBattleStruct->battlerState[battler].forcedSwitch
            && monPartyId == CalculateEnemyPartyCountInSide(battler)-1)
        return TRUE;
    if (gAiThinkingStruct->aiFlags[GetThinkingBattler(battler)] & AI_FLAG_DOUBLE_ACE_POKEMON
            && !gBattleStruct->battlerState[battler].forcedSwitch
            && (monPartyId == CalculateEnemyPartyCount()-1 || monPartyId == CalculateEnemyPartyCount()-2))
        return TRUE;
    return FALSE;
}

static bool32 AreStatsRaised(u32 battler)
{
    u8 buffedStatsValue = 0;
    s32 i;

    for (i = 0; i < NUM_BATTLE_STATS; i++)
    {
        if (gBattleMons[battler].statStages[i] > DEFAULT_STAT_STAGE)
            buffedStatsValue += gBattleMons[battler].statStages[i] - DEFAULT_STAT_STAGE;
    }

    return (buffedStatsValue > STAY_IN_STATS_RAISED);
}

void GetAIPartyIndexes(u32 battler, s32 *firstId, s32 *lastId)
{
    if (BATTLE_TWO_VS_ONE_OPPONENT && (battler & BIT_SIDE) == B_SIDE_OPPONENT)
    {
        *firstId = 0, *lastId = PARTY_SIZE;
    }
    else if (gBattleTypeFlags & (BATTLE_TYPE_TWO_OPPONENTS | BATTLE_TYPE_INGAME_PARTNER | BATTLE_TYPE_TOWER_LINK_MULTI))
    {
        if ((battler & BIT_FLANK) == B_FLANK_LEFT)
            *firstId = 0, *lastId = PARTY_SIZE / 2;
        else
            *firstId = PARTY_SIZE / 2, *lastId = PARTY_SIZE;
    }
    else
    {
        *firstId = 0, *lastId = PARTY_SIZE;
    }
}

static inline bool32 SetSwitchinAndSwitch(u32 battler, u32 switchinId)
{
    gBattleStruct->AI_monToSwitchIntoId[battler] = switchinId;
    return TRUE;
}

static bool32 AI_DoesChoiceItemBlockMove(u32 battler, u32 move)
{
    // Choice locked into something else
    if (gAiLogicData->lastUsedMove[battler] != MOVE_NONE && gAiLogicData->lastUsedMove[battler] != move && HOLD_EFFECT_CHOICE(GetBattlerHoldEffect(battler, FALSE)) && IsBattlerItemEnabled(battler))
        return TRUE;
    return FALSE;
}

// Note that as many return statements as possible are INTENTIONALLY put after all of the loops;
// the function can take a max of about 0.06s to run, and this prevents the player from identifying
// whether the mon will switch or not by seeing how long the delay is before they select a move
static bool32 ShouldSwitchIfHasBadOdds(u32 battler)
{
    //Variable initialization
    u8 opposingPosition, atkType1, atkType2, defType1, defType2;
    s32 i, damageDealt = 0, maxDamageDealt = 0, damageTaken = 0, maxDamageTaken = 0;
    u32 aiMove, playerMove, aiBestMove = MOVE_NONE, aiAbility = gAiLogicData->abilities[battler], opposingBattler;
    bool32 getsOneShot = FALSE, hasStatusMove = FALSE, hasSuperEffectiveMove = FALSE;
    u16 typeEffectiveness = UQ_4_12(1.0); //baseline typing damage
    enum BattleMoveEffects aiMoveEffect;
    u32 hitsToKoPlayer = 0, hitsToKoAI = 0;

    // Only use this if AI_FLAG_SMART_SWITCHING is set for the trainer
    if (!(gAiThinkingStruct->aiFlags[GetThinkingBattler(battler)] & AI_FLAG_SMART_SWITCHING))
        return FALSE;

    // Double Battles aren't included in AI_FLAG_SMART_MON_CHOICE. Defaults to regular switch in logic
    if (IsDoubleBattle())
        return FALSE;

    opposingPosition = BATTLE_OPPOSITE(GetBattlerPosition(battler));
    opposingBattler = GetBattlerAtPosition(opposingPosition);

    // Gets types of player (opposingBattler) and computer (battler)
    atkType1 = gBattleMons[opposingBattler].types[0];
    atkType2 = gBattleMons[opposingBattler].types[1];
    defType1 = gBattleMons[battler].types[0];
    defType2 = gBattleMons[battler].types[1];

    for (i = 0; i < MAX_MON_MOVES; i++)
    {
        aiMove = gBattleMons[battler].moves[i];
        aiMoveEffect = GetMoveEffect(aiMove);
        if (aiMove != MOVE_NONE)
        {
            u32 nonVolatileStatus = GetMoveNonVolatileStatus(aiMove);
            // Check if mon has an "important" status move
            if (aiMoveEffect == EFFECT_REFLECT || aiMoveEffect == EFFECT_LIGHT_SCREEN
            || aiMoveEffect == EFFECT_SPIKES || aiMoveEffect == EFFECT_TOXIC_SPIKES || aiMoveEffect == EFFECT_STEALTH_ROCK || aiMoveEffect == EFFECT_STICKY_WEB || aiMoveEffect == EFFECT_LEECH_SEED
            || aiMoveEffect == EFFECT_EXPLOSION
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
            if (!IsBattleMoveStatus(aiMove))
            {
                // Check if mon has a super effective move
                if (AI_GetMoveEffectiveness(aiMove, battler, opposingBattler) >= UQ_4_12(2.0) && !AI_DoesChoiceItemBlockMove(battler, aiMove))
                    hasSuperEffectiveMove = TRUE;

                // Get maximum damage mon can deal
                damageDealt = AI_GetDamage(battler, opposingBattler, i, AI_ATTACKING, gAiLogicData);
                if(damageDealt > maxDamageDealt && !AI_DoesChoiceItemBlockMove(battler, aiMove))
                {
                    maxDamageDealt = damageDealt;
                    aiBestMove = aiMove;
                }
            }
        }
    }

    hitsToKoPlayer = GetNoOfHitsToKOBattlerDmg(maxDamageDealt, opposingBattler);

    // Calculate type advantage
    typeEffectiveness = uq4_12_multiply(typeEffectiveness, (GetTypeModifier(atkType1, defType1)));
    if (atkType2 != atkType1)
        typeEffectiveness = uq4_12_multiply(typeEffectiveness, (GetTypeModifier(atkType2, defType1)));
    if (defType2 != defType1)
    {
        typeEffectiveness = uq4_12_multiply(typeEffectiveness, (GetTypeModifier(atkType1, defType2)));
        if (atkType2 != atkType1)
            typeEffectiveness = uq4_12_multiply(typeEffectiveness, (GetTypeModifier(atkType2, defType2)));
    }

    // Get max damage mon could take
    for (i = 0; i < MAX_MON_MOVES; i++)
    {
        playerMove = gBattleMons[opposingBattler].moves[i];
        if (playerMove != MOVE_NONE && !IsBattleMoveStatus(playerMove) && GetMoveEffect(playerMove) != EFFECT_FOCUS_PUNCH)
        {
            damageTaken = AI_GetDamage(opposingBattler, battler, i, AI_DEFENDING, gAiLogicData);
            if (playerMove == gBattleStruct->choicedMove[opposingBattler]) // If player is choiced, only care about the choice locked move
            {
                return maxDamageTaken = damageTaken;
                break;
            }
            if (damageTaken > maxDamageTaken)
                maxDamageTaken = damageTaken;
        }
    }

    hitsToKoAI = GetNoOfHitsToKOBattlerDmg(maxDamageTaken, battler);

    // Check if mon gets one shot
    if(maxDamageTaken > gBattleMons[battler].hp
        && !(gItemsInfo[gBattleMons[battler].item].holdEffect == HOLD_EFFECT_FOCUS_SASH || (!IsMoldBreakerTypeAbility(opposingBattler, gBattleMons[opposingBattler].ability) && B_STURDY >= GEN_5 && aiAbility == ABILITY_STURDY)))
    {
        getsOneShot = TRUE;
    }

    // Check if current mon can 1v1 in spite of bad matchup, and don't switch out if it can
    if(hitsToKoPlayer < hitsToKoAI || (hitsToKoPlayer == hitsToKoAI && AI_IsFaster(battler, opposingBattler, aiBestMove)))
        return FALSE;

    // If we don't have any other viable options, don't switch out
    if (gAiLogicData->mostSuitableMonId[battler] == PARTY_SIZE)
        return FALSE;

    // Start assessing whether or not mon has bad odds
    // Jump straight to switching out in cases where mon gets OHKO'd
    if (((getsOneShot && gBattleMons[opposingBattler].speed > gBattleMons[battler].speed) // If the player OHKOs and outspeeds OR OHKOs, doesn't outspeed but isn't 2HKO'd
            || (getsOneShot && gBattleMons[opposingBattler].speed <= gBattleMons[battler].speed && maxDamageDealt < gBattleMons[opposingBattler].hp / 2))
        && (gBattleMons[battler].hp >= gBattleMons[battler].maxHP / 2 // And the current mon has at least 1/2 their HP, or 1/4 HP and Regenerator
            || (aiAbility == ABILITY_REGENERATOR
            && gBattleMons[battler].hp >= gBattleMons[battler].maxHP / 4)))
    {
        // 50% chance to stay in regardless
        if (RandomPercentage(RNG_AI_SWITCH_HASBADODDS, (100 - GetSwitchChance(SHOULD_SWITCH_HASBADODDS))) && !gAiLogicData->aiPredictionInProgress)
            return FALSE;

        // Switch mon out
        return SetSwitchinAndSwitch(battler, PARTY_SIZE);
    }

    // General bad type matchups have more wiggle room
    if (typeEffectiveness >= UQ_4_12(2.0)) // If the player has at least a 2x type advantage
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

static bool32 ShouldSwitchIfTruant(u32 battler)
{
    // Switch if mon with truant is bodied by Protect or invulnerability spam
    if (gAiLogicData->abilities[battler] == ABILITY_TRUANT
        && IsTruantMonVulnerable(battler, gBattlerTarget)
        && gDisableStructs[battler].truantCounter
        && gBattleMons[battler].hp >= gBattleMons[battler].maxHP / 2
        && gAiLogicData->mostSuitableMonId[battler] != PARTY_SIZE)
    {
        if (RandomPercentage(RNG_AI_SWITCH_TRUANT, GetSwitchChance(SHOULD_SWITCH_TRUANT)))
            return SetSwitchinAndSwitch(battler, PARTY_SIZE);
    }
    return FALSE;
}

static u32 FindMonWithMoveOfEffectiveness(u32 battler, u32 opposingBattler, uq4_12_t effectiveness)
{
    u32 move, i, j;
    s32 firstId;
    s32 lastId; // + 1
    struct Pokemon *party = NULL;

    // Get party information.
    GetAIPartyIndexes(battler, &firstId, &lastId);
    party = GetBattlerParty(battler);

    // Find a Pokémon in the party that has a super effective move.
    for (i = firstId; i < lastId; i++)
    {
        if (!IsValidForBattle(&party[i]))
            continue;
        if (i == gBattlerPartyIndexes[battler])
            continue;
        if (IsAceMon(battler, i))
            continue;

        for (j = 0; j < MAX_MON_MOVES; j++)
        {
            move = GetMonData(&party[i], MON_DATA_MOVE1 + j);
            if (move != MOVE_NONE && AI_GetMoveEffectiveness(move, battler, opposingBattler) >= effectiveness && gMovesInfo[move].power != 0)
                return SetSwitchinAndSwitch(battler, i);
        }
    }

    return FALSE; // There is not a single Pokémon in the party that has a move with this effectiveness threshold
}

static bool32 ShouldSwitchIfAllMovesBad(u32 battler)
{
    u32 moveIndex;
    u32 opposingBattler = GetOppositeBattler(battler);
    u32 aiMove;

    // Switch if no moves affect opponents
    if (IsDoubleBattle())
    {
        u32 opposingPartner = GetBattlerAtPosition(BATTLE_PARTNER(opposingBattler));
        for (moveIndex = 0; moveIndex < MAX_MON_MOVES; moveIndex++)
        {
            aiMove = gBattleMons[battler].moves[moveIndex];
            if ((AI_GetMoveEffectiveness(aiMove, battler, opposingBattler) > UQ_4_12(0.0)
                    || AI_GetMoveEffectiveness(aiMove, battler, opposingPartner) > UQ_4_12(0.0))
                    && aiMove != MOVE_NONE)
                return FALSE;
        }
    }
    else
    {
        for (moveIndex = 0; moveIndex < MAX_MON_MOVES; moveIndex++)
        {
            aiMove = gBattleMons[battler].moves[moveIndex];
            if (AI_GetMoveEffectiveness(aiMove, battler, opposingBattler) > UQ_4_12(0.0) && aiMove != MOVE_NONE
                && (!ALL_MOVES_BAD_STATUS_MOVES_BAD || gMovesInfo[aiMove].power != 0)) // If using ALL_MOVES_BAD_STATUS_MOVES_BAD, then need power to be non-zero
                return FALSE;
        }
    }

    if (RandomPercentage(RNG_AI_SWITCH_ALL_MOVES_BAD, GetSwitchChance(SHOULD_SWITCH_ALL_MOVES_BAD)))
    {
        if (gAiLogicData->mostSuitableMonId[battler] == PARTY_SIZE) // No good candidate mons, find any one that can deal damage
            return FindMonWithMoveOfEffectiveness(battler, opposingBattler, UQ_4_12(1.0));
        else // Good candidate mon, send that in
            return SetSwitchinAndSwitch(battler, PARTY_SIZE);
    }

    return FALSE;
}

static bool32 ShouldSwitchIfWonderGuard(u32 battler)
{
    u32 opposingBattler = GetOppositeBattler(battler);
    u32 i, move;

    if (IsDoubleBattle())
        return FALSE;

    if (gAiLogicData->abilities[opposingBattler] != ABILITY_WONDER_GUARD)
        return FALSE;

    // Check if Pokémon has a super effective move.
    for (i = 0; i < MAX_MON_MOVES; i++)
    {
        move = gBattleMons[battler].moves[i];
        if (move != MOVE_NONE)
        {
            if (AI_GetMoveEffectiveness(move, battler, opposingBattler) >= UQ_4_12(2.0))
                return FALSE;
        }
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

static bool32 FindMonThatAbsorbsOpponentsMove(u32 battler)
{
    u8 battlerIn1, battlerIn2;
    u8 numAbsorbingAbilities = 0;
    u16 absorbingTypeAbilities[3]; // Array size is maximum number of absorbing abilities for a single type
    s32 firstId;
    s32 lastId;
    struct Pokemon *party;
    u16 monAbility, aiMove;
    u32 opposingBattler = GetOppositeBattler(battler);
    u32 incomingMove = GetIncomingMove(battler, opposingBattler, gAiLogicData);
    u32 incomingType = GetMoveType(incomingMove);
    bool32 isOpposingBattlerChargingOrInvulnerable = (IsSemiInvulnerable(opposingBattler, incomingMove) || IsTwoTurnNotSemiInvulnerableMove(opposingBattler, incomingMove));
    s32 i, j;

    if (!(gAiThinkingStruct->aiFlags[GetThinkingBattler(battler)] & AI_FLAG_SMART_SWITCHING))
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
    for (i = 0; i < MAX_MON_MOVES; i++)
    {
        aiMove = gBattleMons[battler].moves[i];
        if (aiMove != MOVE_NONE)
        {
            // Only check damage if it's a damaging move
            if (!IsBattleMoveStatus(aiMove))
            {
                if (!AI_DoesChoiceItemBlockMove(battler, aiMove) && AI_GetDamage(battler, opposingBattler, i, AI_ATTACKING, gAiLogicData) > gBattleMons[opposingBattler].hp)
                    return FALSE;
            }
        }
    }

    if (IsDoubleBattle())
    {
        battlerIn1 = battler;
        if (gAbsentBattlerFlags & (1u << GetPartnerBattler(battler)))
            battlerIn2 = battler;
        else
            battlerIn2 = GetPartnerBattler(battler);
    }
    else
    {
        battlerIn1 = battler;
        battlerIn2 = battler;
    }

    // Create an array of possible absorb abilities so the AI considers all of them
    if (incomingType == TYPE_FIRE)
    {
        absorbingTypeAbilities[numAbsorbingAbilities++] = ABILITY_FLASH_FIRE;
    }
    else if (incomingType == TYPE_WATER || (isOpposingBattlerChargingOrInvulnerable && incomingType == TYPE_WATER))
    {
        absorbingTypeAbilities[numAbsorbingAbilities++] = ABILITY_WATER_ABSORB;
        absorbingTypeAbilities[numAbsorbingAbilities++] = ABILITY_DRY_SKIN;
        if (B_REDIRECT_ABILITY_IMMUNITY >= GEN_5)
            absorbingTypeAbilities[numAbsorbingAbilities++] = ABILITY_STORM_DRAIN;
    }
    else if (incomingType == TYPE_ELECTRIC || (isOpposingBattlerChargingOrInvulnerable && incomingType == TYPE_ELECTRIC))
    {
        absorbingTypeAbilities[numAbsorbingAbilities++] = ABILITY_VOLT_ABSORB;
        absorbingTypeAbilities[numAbsorbingAbilities++] = ABILITY_MOTOR_DRIVE;
        if (B_REDIRECT_ABILITY_IMMUNITY >= GEN_5)
            absorbingTypeAbilities[numAbsorbingAbilities++] = ABILITY_LIGHTNING_ROD;
    }
    else if (incomingType == TYPE_GRASS || (isOpposingBattlerChargingOrInvulnerable && incomingType == TYPE_GRASS))
    {
        absorbingTypeAbilities[numAbsorbingAbilities++] = ABILITY_SAP_SIPPER;
    }
    else if (incomingType == TYPE_GROUND || (isOpposingBattlerChargingOrInvulnerable && incomingType == TYPE_GROUND))
    {
        absorbingTypeAbilities[numAbsorbingAbilities++] = ABILITY_EARTH_EATER;
        absorbingTypeAbilities[numAbsorbingAbilities++] = ABILITY_LEVITATE;
    }
    else if (IsSoundMove(incomingMove) || (isOpposingBattlerChargingOrInvulnerable && IsSoundMove(incomingMove)))
    {
        absorbingTypeAbilities[numAbsorbingAbilities++] = ABILITY_SOUNDPROOF;
    }
    else if (IsBallisticMove(incomingMove) || (isOpposingBattlerChargingOrInvulnerable && IsBallisticMove(incomingMove)))
    {
        absorbingTypeAbilities[numAbsorbingAbilities++] = ABILITY_BULLETPROOF;
    }
    else if (IsWindMove(incomingMove) || (isOpposingBattlerChargingOrInvulnerable && IsWindMove(incomingMove)))
    {
        absorbingTypeAbilities[numAbsorbingAbilities++] = ABILITY_WIND_RIDER;
    }
    else
    {
        return FALSE;
    }

    // Check current mon for all absorbing abilities
    for (i = 0; i < numAbsorbingAbilities; i++)
    {
        if (gBattleMons[battler].ability == absorbingTypeAbilities[i])
            return FALSE;
    }

    // Check party for mon with ability that absorbs move
    GetAIPartyIndexes(battler, &firstId, &lastId);
    party = GetBattlerParty(battler);

    for (i = firstId; i < lastId; i++)
    {
        if (!IsValidForBattle(&party[i]))
            continue;
        if (i == gBattlerPartyIndexes[battlerIn1])
            continue;
        if (i == gBattlerPartyIndexes[battlerIn2])
            continue;
        if (i == gBattleStruct->monToSwitchIntoId[battlerIn1])
            continue;
        if (i == gBattleStruct->monToSwitchIntoId[battlerIn2])
            continue;
        if (IsAceMon(battler, i))
            continue;

        monAbility = GetMonAbility(&party[i]);

        for (j = 0; j < numAbsorbingAbilities; j++)
        {
            // Found a mon
            if (absorbingTypeAbilities[j] == monAbility && RandomPercentage(RNG_AI_SWITCH_ABSORBING, GetSwitchChance(SHOULD_SWITCH_ABSORBS_MOVE)))
                return SetSwitchinAndSwitch(battler, i);
        }
    }
    return FALSE;
}

static bool32 ShouldSwitchIfOpponentChargingOrInvulnerable(u32 battler)
{
    u32 opposingBattler = GetOppositeBattler(battler);
    u32 incomingMove = GetIncomingMove(battler, opposingBattler, gAiLogicData);

    bool32 isOpposingBattlerChargingOrInvulnerable = (IsSemiInvulnerable(opposingBattler, incomingMove) || IsTwoTurnNotSemiInvulnerableMove(opposingBattler, incomingMove));

    if (IsDoubleBattle() || !(gAiThinkingStruct->aiFlags[GetThinkingBattler(battler)] & AI_FLAG_SMART_SWITCHING))
        return FALSE;

    if (isOpposingBattlerChargingOrInvulnerable && gAiLogicData->mostSuitableMonId[battler] != PARTY_SIZE && RandomPercentage(RNG_AI_SWITCH_FREE_TURN, GetSwitchChance(SHOULD_SWITCH_FREE_TURN)))
        return SetSwitchinAndSwitch(battler, PARTY_SIZE);

    return FALSE;
}

static bool32 ShouldSwitchIfTrapperInParty(u32 battler)
{
    s32 firstId;
    s32 lastId;
    struct Pokemon *party;
    s32 i;
    u16 monAbility;
    s32 opposingBattler =  GetOppositeBattler(battler);

    // Only use this if AI_FLAG_SMART_SWITCHING is set for the trainer
    if (!(gAiThinkingStruct->aiFlags[GetThinkingBattler(battler)] & AI_FLAG_SMART_SWITCHING))
        return FALSE;

    // Check if current mon has an ability that traps opponent
    if (CanAbilityTrapOpponent(gBattleMons[battler].ability, opposingBattler))
        return FALSE;

    // Check party for mon with ability that traps opponent
    GetAIPartyIndexes(battler, &firstId, &lastId);
    party = GetBattlerParty(battler);

    for (i = firstId; i < lastId; i++)
    {
        if (IsAceMon(battler, i))
            return FALSE;

        monAbility = GetMonAbility(&party[i]);

        if (CanAbilityTrapOpponent(monAbility, opposingBattler) || (CanAbilityTrapOpponent(AI_GetBattlerAbility(opposingBattler), opposingBattler) && monAbility == ABILITY_TRACE))
        {
            // If mon in slot i is the most suitable switchin candidate, then it's a trapper than wins 1v1
            if (i == gAiLogicData->mostSuitableMonId[battler] && RandomPercentage(RNG_AI_SWITCH_FREE_TURN, GetSwitchChance(SHOULD_SWITCH_FREE_TURN)))
                return SetSwitchinAndSwitch(battler, PARTY_SIZE);
        }
    }
    return FALSE;
}

static bool32 ShouldSwitchIfBadlyStatused(u32 battler)
{
    bool32 switchMon = FALSE;
    u16 monAbility = gAiLogicData->abilities[battler];
    enum ItemHoldEffect holdEffect = gAiLogicData->holdEffects[battler];
    u8 opposingPosition = BATTLE_OPPOSITE(GetBattlerPosition(battler));
    u8 opposingBattler = GetBattlerAtPosition(opposingPosition);
    bool32 hasStatRaised = AnyStatIsRaised(battler);

    //Perish Song
    if (gStatuses3[battler] & STATUS3_PERISH_SONG
        && gDisableStructs[battler].perishSongTimer == 0
        && monAbility != ABILITY_SOUNDPROOF
        && RandomPercentage(RNG_AI_SWITCH_PERISH_SONG, GetSwitchChance(SHOULD_SWITCH_PERISH_SONG)))
        return SetSwitchinAndSwitch(battler, PARTY_SIZE);

    if (gAiThinkingStruct->aiFlags[GetThinkingBattler(battler)] & AI_FLAG_SMART_SWITCHING)
    {
        //Yawn
        if (gStatuses3[battler] & STATUS3_YAWN
            && CanBeSlept(battler, battler, monAbility, BLOCKED_BY_SLEEP_CLAUSE) // TODO: ask for help from pawwkie
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
                || HasMove(battler, MOVE_SLEEP_TALK)
                || (HasMoveWithEffect(battler, MOVE_SNORE) && AI_GetMoveEffectiveness(MOVE_SNORE, battler, opposingBattler) >= UQ_4_12(2.0))
                || (IsBattlerGrounded(battler)
                    && (HasMove(battler, MOVE_MISTY_TERRAIN) || HasMove(battler, MOVE_ELECTRIC_TERRAIN)))
                )
                switchMon = FALSE;

            // Check if Active Pokemon evasion boosted and might be able to dodge until awake
            if (gBattleMons[battler].statStages[STAT_EVASION] > (DEFAULT_STAT_STAGE + 3)
                && gAiLogicData->abilities[opposingBattler] != ABILITY_UNAWARE
                && gAiLogicData->abilities[opposingBattler] != ABILITY_KEEN_EYE
                && gAiLogicData->abilities[opposingBattler] != ABILITY_MINDS_EYE
                && (B_ILLUMINATE_EFFECT >= GEN_9 && gAiLogicData->abilities[opposingBattler] != ABILITY_ILLUMINATE)
                && !(gBattleMons[battler].status2 & STATUS2_FORESIGHT)
                && !(gStatuses3[battler] & STATUS3_MIRACLE_EYED))
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
            if (gBattleMons[battler].status2 & STATUS2_CURSED
                && (hasStatRaised ? RandomPercentage(RNG_AI_SWITCH_CURSED, GetSwitchChance(SHOULD_SWITCH_CURSED_STATS_RAISED)) : RandomPercentage(RNG_AI_SWITCH_CURSED, GetSwitchChance(SHOULD_SWITCH_CURSED))))
                return SetSwitchinAndSwitch(battler, PARTY_SIZE);

            //Nightmare
            if (gBattleMons[battler].status2 & STATUS2_NIGHTMARE
                && (hasStatRaised ? RandomPercentage(RNG_AI_SWITCH_NIGHTMARE, GetSwitchChance(SHOULD_SWITCH_NIGHTMARE_STATS_RAISED)) : RandomPercentage(RNG_AI_SWITCH_NIGHTMARE, GetSwitchChance(SHOULD_SWITCH_NIGHTMARE))))
                return SetSwitchinAndSwitch(battler, PARTY_SIZE);

            //Leech Seed
            if (gStatuses3[battler] & STATUS3_LEECHSEED
                && (hasStatRaised ? RandomPercentage(RNG_AI_SWITCH_SEEDED, GetSwitchChance(SHOULD_SWITCH_SEEDED_STATS_RAISED)) : RandomPercentage(RNG_AI_SWITCH_SEEDED, GetSwitchChance(SHOULD_SWITCH_SEEDED))))
                return SetSwitchinAndSwitch(battler, PARTY_SIZE);
        }

        // Infatuation
        if (gBattleMons[battler].status2 & STATUS2_INFATUATION
            && !AiExpectsToFaintPlayer(battler)
            && gAiLogicData->mostSuitableMonId[battler] != PARTY_SIZE
            && RandomPercentage(RNG_AI_SWITCH_INFATUATION, GetSwitchChance(SHOULD_SWITCH_INFATUATION)))
            return SetSwitchinAndSwitch(battler, PARTY_SIZE);
    }

    return FALSE;
}

static bool32 ShouldSwitchIfAbilityBenefit(u32 battler)
{
    bool32 hasStatRaised = AnyStatIsRaised(battler);

    //Check if ability is blocked
    if (gStatuses3[battler] & STATUS3_GASTRO_ACID
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
            // Want to activate Palafin-Zero at all costs
            if (gBattleMons[battler].species == SPECIES_PALAFIN_ZERO)
                break;

        default:
            return FALSE;
    }

    return SetSwitchinAndSwitch(battler, PARTY_SIZE);
}

static bool32 CanUseSuperEffectiveMoveAgainstOpponents(u32 battler)
{
    s32 i;
    u16 move;

    u32 opposingPosition = BATTLE_OPPOSITE(GetBattlerPosition(battler));
    u32 opposingBattler = GetBattlerAtPosition(opposingPosition);

    if (!(gAbsentBattlerFlags & (1u << opposingBattler)))
    {
        for (i = 0; i < MAX_MON_MOVES; i++)
        {
            move = gBattleMons[battler].moves[i];
            if (move == MOVE_NONE || AI_DoesChoiceItemBlockMove(battler, move))
                continue;

            if (AI_GetMoveEffectiveness(move, battler, opposingBattler) >= UQ_4_12(2.0))
            {
                return TRUE;
            }
        }
    }
    if (!IsDoubleBattle())
        return FALSE;

    opposingBattler = GetBattlerAtPosition(BATTLE_PARTNER(opposingPosition));

    if (!(gAbsentBattlerFlags & (1u << opposingBattler)))
    {
        for (i = 0; i < MAX_MON_MOVES; i++)
        {
            move = gBattleMons[battler].moves[i];
            if (move == MOVE_NONE || AI_DoesChoiceItemBlockMove(battler, move))
                continue;

            if (AI_GetMoveEffectiveness(move, battler, opposingBattler) >= UQ_4_12(2.0))
            {
                return TRUE;
            }
        }
    }

    return FALSE;
}

static bool32 FindMonWithFlagsAndSuperEffective(u32 battler, u16 flags, u32 percentChance)
{
    u32 battlerIn1, battlerIn2;
    s32 firstId;
    s32 lastId; // + 1
    struct Pokemon *party;
    s32 i, j;
    u16 move;

    // Similar functionality handled more thoroughly by ShouldSwitchIfHasBadOdds
    if (gAiThinkingStruct->aiFlags[GetThinkingBattler(battler)] & AI_FLAG_SMART_SWITCHING)
        return FALSE;

    if (gLastLandedMoves[battler] == MOVE_NONE)
        return FALSE;
    if (gLastLandedMoves[battler] == MOVE_UNAVAILABLE)
        return FALSE;
    if (gLastHitBy[battler] == 0xFF)
        return FALSE;
    if (IsBattleMoveStatus(gLastLandedMoves[battler]))
        return FALSE;

    if (IsDoubleBattle())
    {
        battlerIn1 = battler;
        if (gAbsentBattlerFlags & (1u << GetPartnerBattler(battler)))
            battlerIn2 = battler;
        else
            battlerIn2 = GetPartnerBattler(battler);
    }
    else
    {
        battlerIn1 = battler;
        battlerIn2 = battler;
    }

    GetAIPartyIndexes(battler, &firstId, &lastId);
    party = GetBattlerParty(battler);

    for (i = firstId; i < lastId; i++)
    {
        u16 species, monAbility;
        uq4_12_t typeMultiplier;
        u16 moveFlags = 0;

        if (!IsValidForBattle(&party[i]))
            continue;
        if (i == gBattlerPartyIndexes[battlerIn1])
            continue;
        if (i == gBattlerPartyIndexes[battlerIn2])
            continue;
        if (i == gBattleStruct->monToSwitchIntoId[battlerIn1])
            continue;
        if (i == gBattleStruct->monToSwitchIntoId[battlerIn2])
            continue;
        if (IsAceMon(battler, i))
            continue;

        species = GetMonData(&party[i], MON_DATA_SPECIES_OR_EGG);
        monAbility = GetMonAbility(&party[i]);
        typeMultiplier = CalcPartyMonTypeEffectivenessMultiplier(gLastLandedMoves[battler], species, monAbility);
        UpdateMoveResultFlags(typeMultiplier, &moveFlags);
        if (moveFlags & flags)
        {
            battlerIn1 = gLastHitBy[battler];

            for (j = 0; j < MAX_MON_MOVES; j++)
            {
                move = GetMonData(&party[i], MON_DATA_MOVE1 + j);
                if (move == 0)
                    continue;

                if (AI_GetMoveEffectiveness(move, battler, battlerIn1) >= UQ_4_12(2.0) && (RandomPercentage(RNG_AI_SWITCH_SE_DEFENSIVE, percentChance) || gAiLogicData->aiPredictionInProgress))
                    return SetSwitchinAndSwitch(battler, i);
            }
        }
    }

    return FALSE;
}

static bool32 CanMonSurviveHazardSwitchin(u32 battler)
{
    u32 battlerIn1, battlerIn2;
    u32 hazardDamage = 0, battlerHp = gBattleMons[battler].hp;
    u32 ability = gAiLogicData->abilities[battler], aiMove;
    s32 firstId, lastId, i, j;
    struct Pokemon *party;

    if (ability == ABILITY_REGENERATOR)
        battlerHp = (battlerHp * 133) / 100; // Account for Regenerator healing

    hazardDamage = GetSwitchinHazardsDamage(battler, &gBattleMons[battler]);

    // Battler will faint to hazards, check to see if another mon can clear them
    if (hazardDamage > battlerHp)
    {
        if (IsDoubleBattle())
        {
            battlerIn1 = battler;
            if (gAbsentBattlerFlags & (1u << GetPartnerBattler(battler)))
                battlerIn2 = battler;
            else
                battlerIn2 = GetPartnerBattler(battler);
        }
        else
        {
            battlerIn1 = battler;
            battlerIn2 = battler;
        }

        GetAIPartyIndexes(battler, &firstId, &lastId);
        party = GetBattlerParty(battler);

        for (i = firstId; i < lastId; i++)
        {
            if (!IsValidForBattle(&party[i]))
                continue;
            if (i == gBattlerPartyIndexes[battlerIn1])
                continue;
            if (i == gBattlerPartyIndexes[battlerIn2])
                continue;
            if (i == gBattleStruct->monToSwitchIntoId[battlerIn1])
                continue;
            if (i == gBattleStruct->monToSwitchIntoId[battlerIn2])
                continue;
            if (IsAceMon(battler, i))
                continue;

            for (j = 0; j < MAX_MON_MOVES; j++)
            {
                aiMove = GetMonData(&party[i], MON_DATA_MOVE1 + j, NULL);
                if (IsHazardClearingMove(aiMove)) // Have a mon that can clear the hazards, so switching out is okay
                    return TRUE;
            }
        }
        // Faints to hazards and party can't clear them, don't switch out
        return FALSE;
    }
    return TRUE;
}

static bool32 ShouldSwitchIfEncored(u32 battler)
{
    u32 encoredMove = gDisableStructs[battler].encoredMove;
    u32 opposingBattler = GetOppositeBattler(battler);

    // Only use this if AI_FLAG_SMART_SWITCHING is set for the trainer
    if (!(gAiThinkingStruct->aiFlags[GetThinkingBattler(battler)] & AI_FLAG_SMART_SWITCHING))
        return FALSE;

    // If not Encore'd don't switch
    if (encoredMove == MOVE_NONE)
        return FALSE;

    // Switch out if status move
    if (GetMoveCategory(encoredMove) == DAMAGE_CATEGORY_STATUS && RandomPercentage(RNG_AI_SWITCH_ENCORE, GetSwitchChance(SHOULD_SWITCH_ENCORE_STATUS)))
        return SetSwitchinAndSwitch(battler, PARTY_SIZE);

    // Stay in if effective move
    else if (AI_GetMoveEffectiveness(encoredMove, battler, opposingBattler) >= UQ_4_12(2.0))
        return FALSE;

    // Switch out 50% of the time otherwise
    else if ((RandomPercentage(RNG_AI_SWITCH_ENCORE, GetSwitchChance(SHOULD_SWITCH_ENCORE_DAMAGE)) || gAiLogicData->aiPredictionInProgress) && gAiLogicData->mostSuitableMonId[battler] != PARTY_SIZE)
        return SetSwitchinAndSwitch(battler, PARTY_SIZE);

    return FALSE;
}

static bool32 ShouldSwitchIfBadChoiceLock(u32 battler)
{
    enum ItemHoldEffect holdEffect = GetBattlerHoldEffect(battler, FALSE);
    u32 lastUsedMove = gAiLogicData->lastUsedMove[battler];
    u32 opposingBattler = GetOppositeBattler(battler);
    bool32 moveAffectsTarget = TRUE;

    if (lastUsedMove != MOVE_NONE && (AI_GetMoveEffectiveness(lastUsedMove, battler, opposingBattler) == UQ_4_12(0.0)
        || CanAbilityAbsorbMove(battler, opposingBattler, gAiLogicData->abilities[opposingBattler], lastUsedMove, GetMoveType(lastUsedMove), ABILITY_CHECK_TRIGGER)
        || CanAbilityBlockMove(battler, opposingBattler, gAiLogicData->abilities[battler], gAiLogicData->abilities[opposingBattler], lastUsedMove, ABILITY_CHECK_TRIGGER)))
        moveAffectsTarget = FALSE;

    if (HOLD_EFFECT_CHOICE(holdEffect) && IsBattlerItemEnabled(battler))
    {
        if ((GetMoveCategory(lastUsedMove) == DAMAGE_CATEGORY_STATUS || !moveAffectsTarget) && RandomPercentage(RNG_AI_SWITCH_CHOICE_LOCKED, GetSwitchChance(SHOULD_SWITCH_CHOICE_LOCKED)))
            return SetSwitchinAndSwitch(battler, PARTY_SIZE);
    }

    return FALSE;
}

// AI should switch if it's become setup fodder and has something better to switch to
static bool32 ShouldSwitchIfAttackingStatsLowered(u32 battler)
{
    s8 attackingStage = gBattleMons[battler].statStages[STAT_ATK];
    s8 spAttackingStage = gBattleMons[battler].statStages[STAT_SPATK];

    // Only use this if AI_FLAG_SMART_SWITCHING is set for the trainer
    if (!(gAiThinkingStruct->aiFlags[GetThinkingBattler(battler)] & AI_FLAG_SMART_SWITCHING))
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

bool32 ShouldSwitch(u32 battler)
{
    u32 battlerIn1, battlerIn2;
    s32 firstId;
    s32 lastId; // + 1
    struct Pokemon *party;
    s32 i;
    s32 availableToSwitch;

    if (gBattleMons[battler].status2 & (STATUS2_WRAPPED | STATUS2_ESCAPE_PREVENTION))
        return FALSE;
    if (gStatuses3[battler] & STATUS3_ROOTED)
        return FALSE;
    if (IsAbilityPreventingEscape(battler))
        return FALSE;
    if (gBattleTypeFlags & BATTLE_TYPE_ARENA)
        return FALSE;

    // Sequence Switching AI never switches mid-battle
    if (gAiThinkingStruct->aiFlags[GetThinkingBattler(battler)] & AI_FLAG_SEQUENCE_SWITCHING)
        return FALSE;

    availableToSwitch = 0;

    if (IsDoubleBattle())
    {
        u32 partner = GetBattlerAtPosition(BATTLE_PARTNER(GetBattlerAtPosition(battler)));
        battlerIn1 = battler;
        if (gAbsentBattlerFlags & (1u << partner))
            battlerIn2 = battler;
        else
            battlerIn2 = partner;
    }
    else
    {
        battlerIn1 = battler;
        battlerIn2 = battler;
    }

    GetAIPartyIndexes(battler, &firstId, &lastId);
    party = GetBattlerParty(battler);

    for (i = firstId; i < lastId; i++)
    {
        if (!IsValidForBattle(&party[i]))
            continue;
        if (i == gBattlerPartyIndexes[battlerIn1])
            continue;
        if (i == gBattlerPartyIndexes[battlerIn2])
            continue;
        if (i == gBattleStruct->monToSwitchIntoId[battlerIn1])
            continue;
        if (i == gBattleStruct->monToSwitchIntoId[battlerIn2])
            continue;
        if (IsAceMon(battler, i))
            continue;

        availableToSwitch++;
    }

    if (availableToSwitch == 0)
            return FALSE;

    // NOTE: The sequence of the below functions matter! Do not change unless you have carefully considered the outcome.
    // Since the order is sequential, and some of these functions prompt switch to specific party members.

    // FindMon functions can prompt a switch to specific party members that override GetMostSuitableMonToSwitchInto
    // The rest can prompt a switch to party member returned by GetMostSuitableMonToSwitchInto

    if (ShouldSwitchIfWonderGuard(battler))
        return TRUE;
    if ((gAiThinkingStruct->aiFlags[GetThinkingBattler(battler)] & AI_FLAG_SMART_SWITCHING) && (CanMonSurviveHazardSwitchin(battler) == FALSE))
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
    if (gAiThinkingStruct->aiFlags[GetThinkingBattler(battler)] & AI_FLAG_SMART_SWITCHING)
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

bool32 ShouldSwitchIfAllScoresBad(u32 battler)
{
    u32 i, score, opposingBattler = GetOppositeBattler(battler);
    if (!(gAiThinkingStruct->aiFlags[GetThinkingBattler(battler)] & AI_FLAG_SMART_SWITCHING))
        return FALSE;

    for (i = 0; i < MAX_MON_MOVES; i++)
    {
        score = gAiBattleData->finalScore[battler][opposingBattler][i];
        if (score > AI_BAD_SCORE_THRESHOLD)
            return FALSE;
    }
    if (RandomPercentage(RNG_AI_SWITCH_ALL_SCORES_BAD, GetSwitchChance(SHOULD_SWITCH_ALL_SCORES_BAD)))
        return TRUE;
    return FALSE;
}

bool32 ShouldStayInToUseMove(u32 battler)
{
    u32 i, aiMove, opposingBattler = GetOppositeBattler(battler);
    enum BattleMoveEffects aiMoveEffect;
    for (i = 0; i < MAX_MON_MOVES; i++)
    {
        aiMove = gBattleMons[battler].moves[i];
        aiMoveEffect = GetMoveEffect(aiMove);
        if (aiMoveEffect == EFFECT_REVIVAL_BLESSING || IsSwitchOutEffect(aiMoveEffect))
        {
            if (gAiBattleData->finalScore[battler][opposingBattler][i] > AI_GOOD_SCORE_THRESHOLD)
                return TRUE;
        }
    }
    return FALSE;
}

void ModifySwitchAfterMoveScoring(u32 battler)
{
    u32 battlerIn1, battlerIn2;
    s32 firstId;
    s32 lastId; // + 1
    struct Pokemon *party;
    s32 i;
    s32 availableToSwitch;

    if (gBattleMons[battler].status2 & (STATUS2_WRAPPED | STATUS2_ESCAPE_PREVENTION))
        return;
    if (gStatuses3[battler] & STATUS3_ROOTED)
        return;
    if (IsAbilityPreventingEscape(battler))
        return;
    if (gBattleTypeFlags & BATTLE_TYPE_ARENA)
        return;

    // Sequence Switching AI never switches mid-battle
    if (gAiThinkingStruct->aiFlags[GetThinkingBattler(battler)] & AI_FLAG_SEQUENCE_SWITCHING)
        return;

    availableToSwitch = 0;

    if (IsDoubleBattle())
    {
        u32 partner = GetBattlerAtPosition(BATTLE_PARTNER(GetBattlerAtPosition(battler)));
        battlerIn1 = battler;
        if (gAbsentBattlerFlags & (1u << partner))
            battlerIn2 = battler;
        else
            battlerIn2 = partner;
    }
    else
    {
        battlerIn1 = battler;
        battlerIn2 = battler;
    }

    GetAIPartyIndexes(battler, &firstId, &lastId);
    party = GetBattlerParty(battler);

    for (i = firstId; i < lastId; i++)
    {
        if (!IsValidForBattle(&party[i]))
            continue;
        if (i == gBattlerPartyIndexes[battlerIn1])
            continue;
        if (i == gBattlerPartyIndexes[battlerIn2])
            continue;
        if (i == gBattleStruct->monToSwitchIntoId[battlerIn1])
            continue;
        if (i == gBattleStruct->monToSwitchIntoId[battlerIn2])
            continue;
        if (IsAceMon(battler, i))
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

bool32 IsSwitchinValid(u32 battler)
{
    // Edge case: See if partner already chose to switch into the same mon
    if (IsDoubleBattle())
    {
        u32 partner = GetBattlerAtPosition(BATTLE_PARTNER(GetBattlerAtPosition(battler)));
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

void AI_TrySwitchOrUseItem(u32 battler)
{
    struct Pokemon *party;
    u8 battlerIn1, battlerIn2;
    s32 firstId;
    s32 lastId; // + 1
    u8 battlerPosition = GetBattlerPosition(battler);
    party = GetBattlerParty(battler);

    if (gBattleTypeFlags & BATTLE_TYPE_TRAINER)
    {
        if (gAiLogicData->shouldSwitch & (1u << battler) && IsSwitchinValid(battler))
        {
            BtlController_EmitTwoReturnValues(battler, 1, B_ACTION_SWITCH, 0);
            if (gBattleStruct->AI_monToSwitchIntoId[battler] == PARTY_SIZE)
            {
                s32 monToSwitchId = gAiLogicData->mostSuitableMonId[battler];
                if (monToSwitchId == PARTY_SIZE)
                {
                    if (!IsDoubleBattle())
                    {
                        battlerIn1 = GetBattlerAtPosition(battlerPosition);
                        battlerIn2 = battlerIn1;
                    }
                    else
                    {
                        battlerIn1 = GetBattlerAtPosition(battlerPosition);
                        battlerIn2 = GetBattlerAtPosition(BATTLE_PARTNER(battlerPosition));
                    }

                    GetAIPartyIndexes(battler, &firstId, &lastId);

                    for (monToSwitchId = (lastId-1); monToSwitchId >= firstId; monToSwitchId--)
                    {
                        if (!IsValidForBattle(&party[monToSwitchId]))
                            continue;
                        if (monToSwitchId == gBattlerPartyIndexes[battlerIn1])
                            continue;
                        if (monToSwitchId == gBattlerPartyIndexes[battlerIn2])
                            continue;
                        if (monToSwitchId == gBattleStruct->monToSwitchIntoId[battlerIn1])
                            continue;
                        if (monToSwitchId == gBattleStruct->monToSwitchIntoId[battlerIn2])
                            continue;
                        if (IsAceMon(battler, monToSwitchId))
                            continue;

                        break;
                    }
                }

                gBattleStruct->AI_monToSwitchIntoId[battler] = monToSwitchId;
            }

            gBattleStruct->monToSwitchIntoId[battler] = gBattleStruct->AI_monToSwitchIntoId[battler];
            gAiLogicData->monToSwitchInId[battler] = gBattleStruct->AI_monToSwitchIntoId[battler];
            return;
        }
        else if (ShouldUseItem(battler))
        {
            return;
        }
    }

    BtlController_EmitTwoReturnValues(battler, B_COMM_TO_ENGINE, B_ACTION_USE_MOVE, BATTLE_OPPOSITE(battler) << 8);
}

// If there are two(or more) mons to choose from, always choose one that has baton pass
// as most often it can't do much on its own.
static u32 GetBestMonBatonPass(struct Pokemon *party, int firstId, int lastId, u8 invalidMons, int aliveCount, u32 battler, u32 opposingBattler)
{
    int i, j, bits = 0;

    for (i = firstId; i < lastId; i++)
    {
        if (invalidMons & (1u << i))
            continue;

        for (j = 0; j < MAX_MON_MOVES; j++)
        {
            if (GetMonData(&party[i], MON_DATA_MOVE1 + j, NULL) == MOVE_BATON_PASS)
            {
                bits |= 1u << i;
                break;
            }
        }
    }

    if ((aliveCount == 2 || (aliveCount > 2 && Random() % 3 == 0)) && bits)
    {
        do
        {
            i = (Random() % (lastId - firstId)) + firstId;
        } while (!(bits & (1 << i)));
        return i;
    }

    return PARTY_SIZE;
}

static u32 GetBestMonTypeMatchup(struct Pokemon *party, int firstId, int lastId, u8 invalidMons, u32 battler, u32 opposingBattler)
{
    int i, bits = 0;

    while (bits != 0x3F) // All mons were checked.
    {
        uq4_12_t bestResist = UQ_4_12(1.0);
        int bestMonId = PARTY_SIZE;
        // Find the mon whose type is the most suitable defensively.
        for (i = firstId; i < lastId; i++)
        {
            if (!((1u << i) & invalidMons) && !((1u << i) & bits))
            {
                u16 species = GetMonData(&party[i], MON_DATA_SPECIES);
                uq4_12_t typeEffectiveness = UQ_4_12(1.0);

                u8 atkType1 = gBattleMons[opposingBattler].types[0];
                u8 atkType2 = gBattleMons[opposingBattler].types[1];
                u8 defType1 = gSpeciesInfo[species].types[0];
                u8 defType2 = gSpeciesInfo[species].types[1];

                typeEffectiveness = uq4_12_multiply(typeEffectiveness, (GetTypeModifier(atkType1, defType1)));
                if (atkType2 != atkType1)
                    typeEffectiveness = uq4_12_multiply(typeEffectiveness, (GetTypeModifier(atkType2, defType1)));
                if (defType2 != defType1)
                {
                    typeEffectiveness = uq4_12_multiply(typeEffectiveness, (GetTypeModifier(atkType1, defType2)));
                    if (atkType2 != atkType1)
                        typeEffectiveness = uq4_12_multiply(typeEffectiveness, (GetTypeModifier(atkType2, defType2)));
                }
                if (typeEffectiveness < bestResist)
                {
                    bestResist = typeEffectiveness;
                    bestMonId = i;
                }
            }
        }

        // Ok, we know the mon has the right typing but does it have at least one super effective move?
        if (bestMonId != PARTY_SIZE)
        {
            for (i = 0; i < MAX_MON_MOVES; i++)
            {
                u32 move = GetMonData(&party[bestMonId], MON_DATA_MOVE1 + i);
                if (move != MOVE_NONE && AI_GetMoveEffectiveness(move, battler, opposingBattler) >= UQ_4_12(2.0))
                    break;
            }

            if (i != MAX_MON_MOVES)
                return bestMonId; // Has both the typing and at least one super effective move.

            bits |= (1u << bestMonId); // Sorry buddy, we want something better.
        }
        else
        {
            bits = 0x3F; // No viable mon to switch.
        }
    }

    return PARTY_SIZE;
}

static u32 GetBestMonDmg(struct Pokemon *party, int firstId, int lastId, u8 invalidMons, u32 battler, u32 opposingBattler)
{
    int i, j;
    int dmg, bestDmg = 0;
    int bestMonId = PARTY_SIZE;

    u32 aiMove;

    // If we couldn't find the best mon in terms of typing, find the one that deals most damage.
    for (i = firstId; i < lastId; i++)
    {
        if ((1 << (i)) & invalidMons)
            continue;
        InitializeSwitchinCandidate(&party[i]);
        for (j = 0; j < MAX_MON_MOVES; j++)
        {
            aiMove = gAiLogicData->switchinCandidate.battleMon.moves[j];
            if (aiMove != MOVE_NONE && !IsBattleMoveStatus(aiMove))
            {
                aiMove = GetMonData(&party[i], MON_DATA_MOVE1 + j);
                dmg = AI_CalcPartyMonDamage(aiMove, battler, opposingBattler, gAiLogicData->switchinCandidate.battleMon, AI_ATTACKING);
                if (bestDmg < dmg)
                {
                    bestDmg = dmg;
                    bestMonId = i;
                }
            }
        }
    }

    return bestMonId;
}

bool32 IsMonGrounded(u16 heldItemEffect, u32 ability, u8 type1, u8 type2)
{
    // List that makes mon not grounded
    if (type1 == TYPE_FLYING || type2 == TYPE_FLYING || ability == ABILITY_LEVITATE
         || (heldItemEffect == HOLD_EFFECT_AIR_BALLOON && !(ability == ABILITY_KLUTZ || (gFieldStatuses & STATUS_FIELD_MAGIC_ROOM))))
    {
        // List that overrides being off the ground
        if ((heldItemEffect == HOLD_EFFECT_IRON_BALL && !(ability == ABILITY_KLUTZ || (gFieldStatuses & STATUS_FIELD_MAGIC_ROOM))) || (gFieldStatuses & STATUS_FIELD_GRAVITY) || (gFieldStatuses & STATUS_FIELD_MAGIC_ROOM))
            return TRUE;
        else
            return FALSE;
    }
    else
        return TRUE;
}

// Gets hazard damage
static u32 GetSwitchinHazardsDamage(u32 battler, struct BattlePokemon *battleMon)
{
    u8 defType1 = battleMon->types[0], defType2 = battleMon->types[1], tSpikesLayers;
    u16 heldItemEffect = GetItemHoldEffect(battleMon->item);
    u32 maxHP = battleMon->maxHP, ability = battleMon->ability, status = battleMon->status1;
    u32 spikesDamage = 0, tSpikesDamage = 0, hazardDamage = 0;
    u32 hazardFlags = gSideStatuses[GetBattlerSide(battler)] & (SIDE_STATUS_SPIKES | SIDE_STATUS_STEALTH_ROCK | SIDE_STATUS_STICKY_WEB | SIDE_STATUS_TOXIC_SPIKES | SIDE_STATUS_SAFEGUARD);

    // Check ways mon might avoid all hazards
    if (ability != ABILITY_MAGIC_GUARD || (heldItemEffect == HOLD_EFFECT_HEAVY_DUTY_BOOTS &&
        !((gFieldStatuses & STATUS_FIELD_MAGIC_ROOM) || ability == ABILITY_KLUTZ)))
    {
        // Stealth Rock
        if ((hazardFlags & SIDE_STATUS_STEALTH_ROCK) && heldItemEffect != HOLD_EFFECT_HEAVY_DUTY_BOOTS)
            hazardDamage += GetStealthHazardDamageByTypesAndHP(TYPE_SIDE_HAZARD_POINTED_STONES, defType1, defType2, battleMon->maxHP);
        // G-Max Steelsurge
        if ((hazardFlags & SIDE_STATUS_STEELSURGE) && heldItemEffect != HOLD_EFFECT_HEAVY_DUTY_BOOTS)
            hazardDamage += GetStealthHazardDamageByTypesAndHP(TYPE_SIDE_HAZARD_SHARP_STEEL, defType1, defType2, battleMon->maxHP);
        // Spikes
        if ((hazardFlags & SIDE_STATUS_SPIKES) && IsMonGrounded(heldItemEffect, ability, defType1, defType2))
        {
            spikesDamage = maxHP / ((5 - gSideTimers[GetBattlerSide(battler)].spikesAmount) * 2);
            if (spikesDamage == 0)
                spikesDamage = 1;
            hazardDamage += spikesDamage;
        }

        if ((hazardFlags & SIDE_STATUS_TOXIC_SPIKES) && (defType1 != TYPE_POISON && defType2 != TYPE_POISON
            && defType1 != TYPE_STEEL && defType2 != TYPE_STEEL
            && ability != ABILITY_IMMUNITY && ability != ABILITY_POISON_HEAL && ability != ABILITY_COMATOSE
            && status == 0
            && !(hazardFlags & SIDE_STATUS_SAFEGUARD)
            && !IsAbilityOnSide(battler, ABILITY_PASTEL_VEIL)
            && !IsBattlerTerrainAffected(battler, STATUS_FIELD_MISTY_TERRAIN)
            && !IsAbilityStatusProtected(battler, ability)
            && heldItemEffect != HOLD_EFFECT_CURE_PSN && heldItemEffect != HOLD_EFFECT_CURE_STATUS
            && IsMonGrounded(heldItemEffect, ability, defType1, defType2)))
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
static s32 GetSwitchinWeatherImpact(void)
{
    s32 weatherImpact = 0, maxHP = gAiLogicData->switchinCandidate.battleMon.maxHP, ability = gAiLogicData->switchinCandidate.battleMon.ability;
    enum ItemHoldEffect holdEffect = GetItemHoldEffect(gAiLogicData->switchinCandidate.battleMon.item);

    if (HasWeatherEffect())
    {
        // Damage
        if (holdEffect != HOLD_EFFECT_SAFETY_GOGGLES && ability != ABILITY_MAGIC_GUARD && ability != ABILITY_OVERCOAT)
        {
            if ((gBattleWeather & B_WEATHER_HAIL)
             && (gAiLogicData->switchinCandidate.battleMon.types[0] != TYPE_ICE || gAiLogicData->switchinCandidate.battleMon.types[1] != TYPE_ICE)
             && ability != ABILITY_SNOW_CLOAK && ability != ABILITY_ICE_BODY)
            {
                weatherImpact = maxHP / 16;
                if (weatherImpact == 0)
                    weatherImpact = 1;
            }
            else if ((gBattleWeather & B_WEATHER_SANDSTORM)
                && (gAiLogicData->switchinCandidate.battleMon.types[0] != TYPE_GROUND && gAiLogicData->switchinCandidate.battleMon.types[1] != TYPE_GROUND
                && gAiLogicData->switchinCandidate.battleMon.types[0] != TYPE_ROCK && gAiLogicData->switchinCandidate.battleMon.types[1] != TYPE_ROCK
                && gAiLogicData->switchinCandidate.battleMon.types[0] != TYPE_STEEL && gAiLogicData->switchinCandidate.battleMon.types[1] != TYPE_STEEL
                && ability != ABILITY_SAND_VEIL && ability != ABILITY_SAND_RUSH && ability != ABILITY_SAND_FORCE))
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
static u32 GetSwitchinRecurringHealing(void)
{
    u32 recurringHealing = 0, maxHP = gAiLogicData->switchinCandidate.battleMon.maxHP, ability = gAiLogicData->switchinCandidate.battleMon.ability;
    enum ItemHoldEffect holdEffect = GetItemHoldEffect(gAiLogicData->switchinCandidate.battleMon.item);

    // Items
    if (ability != ABILITY_KLUTZ)
    {
        if (holdEffect == HOLD_EFFECT_BLACK_SLUDGE && (gAiLogicData->switchinCandidate.battleMon.types[0] == TYPE_POISON || gAiLogicData->switchinCandidate.battleMon.types[1] == TYPE_POISON))
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
    if (ability == ABILITY_POISON_HEAL && (gAiLogicData->switchinCandidate.battleMon.status1 & STATUS1_POISON))
    {
        u32 healing = maxHP / 8;
        if (healing == 0)
            healing = 1;
        recurringHealing += healing;
    }
    return recurringHealing;
}

// Gets one turn of recurring damage
static u32 GetSwitchinRecurringDamage(void)
{
    u32 passiveDamage = 0, maxHP = gAiLogicData->switchinCandidate.battleMon.maxHP, ability = gAiLogicData->switchinCandidate.battleMon.ability;
    enum ItemHoldEffect holdEffect = GetItemHoldEffect(gAiLogicData->switchinCandidate.battleMon.item);

    // Items
    if (ability != ABILITY_MAGIC_GUARD && ability != ABILITY_KLUTZ)
    {
        if (holdEffect == HOLD_EFFECT_BLACK_SLUDGE && gAiLogicData->switchinCandidate.battleMon.types[0] != TYPE_POISON && gAiLogicData->switchinCandidate.battleMon.types[1] != TYPE_POISON)
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
            if(passiveDamage == 0)
                passiveDamage = 1;
        }
    }
    return passiveDamage;
}

// Gets one turn of status damage
static u32 GetSwitchinStatusDamage(u32 battler)
{
    u8 defType1 = gAiLogicData->switchinCandidate.battleMon.types[0], defType2 = gAiLogicData->switchinCandidate.battleMon.types[1];
    u8 tSpikesLayers = gSideTimers[GetBattlerSide(battler)].toxicSpikesAmount;
    u16 heldItemEffect = GetItemHoldEffect(gAiLogicData->switchinCandidate.battleMon.item);
    u32 status = gAiLogicData->switchinCandidate.battleMon.status1, ability = gAiLogicData->switchinCandidate.battleMon.ability, maxHP = gAiLogicData->switchinCandidate.battleMon.maxHP;
    u32 statusDamage = 0;

    // Status condition damage
    if ((status != 0) && gAiLogicData->switchinCandidate.battleMon.ability != ABILITY_MAGIC_GUARD)
    {
        if (status & STATUS1_BURN)
        {
            if (B_BURN_DAMAGE >= GEN_7)
                statusDamage = maxHP / 16;
            else
                statusDamage = maxHP / 8;
            if(ability == ABILITY_HEATPROOF)
                statusDamage = statusDamage / 2;
            if (statusDamage == 0)
                statusDamage = 1;
        }
        else if (status & STATUS1_FROSTBITE)
        {
            if (B_BURN_DAMAGE >= GEN_7)
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
                gAiLogicData->switchinCandidate.battleMon.status1 += STATUS1_TOXIC_TURN(1);
            statusDamage = maxHP / 16;
            if (statusDamage == 0)
                statusDamage = 1;
            statusDamage *= gAiLogicData->switchinCandidate.battleMon.status1 & STATUS1_TOXIC_COUNTER >> 8;
        }
    }

    // Apply hypothetical poisoning from Toxic Spikes, which means the first turn of damage already added in GetSwitchinHazardsDamage
    // Do this last to skip one iteration of Poison / Toxic damage, and start counting Toxic damage one turn later.
    if (tSpikesLayers != 0 && (defType1 != TYPE_POISON && defType2 != TYPE_POISON
        && ability != ABILITY_IMMUNITY && ability != ABILITY_POISON_HEAL
        && status == 0
        && !(heldItemEffect == HOLD_EFFECT_HEAVY_DUTY_BOOTS
            && (((gFieldStatuses & STATUS_FIELD_MAGIC_ROOM) || ability == ABILITY_KLUTZ)))
        && heldItemEffect != HOLD_EFFECT_CURE_PSN && heldItemEffect != HOLD_EFFECT_CURE_STATUS
        && IsMonGrounded(heldItemEffect, ability, defType1, defType2)))
    {
        if (tSpikesLayers == 1)
        {
            gAiLogicData->switchinCandidate.battleMon.status1 = STATUS1_POISON; // Assign "hypothetical" status to the switchin candidate so we can get the damage it would take from TSpikes
            gAiLogicData->switchinCandidate.hypotheticalStatus = TRUE;
        }
        if (tSpikesLayers == 2)
        {
            gAiLogicData->switchinCandidate.battleMon.status1 = STATUS1_TOXIC_POISON; // Assign "hypothetical" status to the switchin candidate so we can get the damage it would take from TSpikes
            gAiLogicData->switchinCandidate.battleMon.status1 += STATUS1_TOXIC_TURN(1);
            gAiLogicData->switchinCandidate.hypotheticalStatus = TRUE;
        }
    }
    return statusDamage;
}

// Gets number of hits to KO factoring in hazards, healing held items, status, and weather
static u32 GetSwitchinHitsToKO(s32 damageTaken, u32 battler)
{
    u32 startingHP = gAiLogicData->switchinCandidate.battleMon.hp - GetSwitchinHazardsDamage(battler, &gAiLogicData->switchinCandidate.battleMon);
    s32 weatherImpact = GetSwitchinWeatherImpact(); // Signed to handle both damage and healing in the same value
    u32 recurringDamage = GetSwitchinRecurringDamage();
    u32 recurringHealing = GetSwitchinRecurringHealing();
    u32 statusDamage = GetSwitchinStatusDamage(battler);
    u32 hitsToKO = 0, singleUseItemHeal = 0;
    u16 maxHP = gAiLogicData->switchinCandidate.battleMon.maxHP, item = gAiLogicData->switchinCandidate.battleMon.item, heldItemEffect = GetItemHoldEffect(item);
    u8 weatherDuration = gWishFutureKnock.weatherDuration, holdEffectParam = GetItemHoldEffectParam(item);
    u32 opposingBattler = GetOppositeBattler(battler);
    u32 opposingAbility = gBattleMons[opposingBattler].ability, ability = gAiLogicData->switchinCandidate.battleMon.ability;
    bool32 usedSingleUseHealingItem = FALSE, opponentCanBreakMold = IsMoldBreakerTypeAbility(opposingBattler, opposingAbility);
    s32 currentHP = startingHP;

    // No damage being dealt
    if ((damageTaken + statusDamage + recurringDamage <= recurringHealing) || damageTaken + statusDamage + recurringDamage == 0)
        return startingHP;

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
        if (damageTaken >= maxHP && startingHP == maxHP && (heldItemEffect == HOLD_EFFECT_FOCUS_SASH || (!opponentCanBreakMold && B_STURDY >= GEN_5 && ability == ABILITY_STURDY)) && hitsToKO < 1)
            currentHP = 1;

        // If mon is still alive, apply weather impact first, as it might KO the mon before it can heal with its item (order is weather -> item -> status)
        if (currentHP != 0)
            currentHP = currentHP - weatherImpact;

        // Check if we're at a single use healing item threshold
        if (gAiLogicData->switchinCandidate.battleMon.ability != ABILITY_KLUTZ && usedSingleUseHealingItem == FALSE
         && !(opposingAbility == ABILITY_UNNERVE && GetPocketByItemId(item) == POCKET_BERRIES))
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
        if (currentHP >= 0)
            currentHP = currentHP + recurringHealing - recurringDamage - statusDamage;

        // Recalculate toxic damage if needed
        if (gAiLogicData->switchinCandidate.battleMon.status1 & STATUS1_TOXIC_POISON)
            statusDamage = GetSwitchinStatusDamage(battler);

        // Reduce weather duration
        if (weatherDuration != 0)
            weatherDuration--;

        hitsToKO++;
    }

    // Disguise will always add an extra hit to KO
    if (opponentCanBreakMold && gAiLogicData->switchinCandidate.battleMon.species == SPECIES_MIMIKYU_DISGUISED)
        hitsToKO++;

    // If mon had a hypothetical status from TSpikes, clear it
    if (gAiLogicData->switchinCandidate.hypotheticalStatus == TRUE)
    {
        gAiLogicData->switchinCandidate.battleMon.status1 = 0;
        gAiLogicData->switchinCandidate.hypotheticalStatus = FALSE;
    }
    return hitsToKO;
}

static u16 GetSwitchinTypeMatchup(u32 opposingBattler, struct BattlePokemon battleMon)
{

    // Check type matchup
    u16 typeEffectiveness = UQ_4_12(1.0);
    u8 atkType1 = gSpeciesInfo[gBattleMons[opposingBattler].species].types[0], atkType2 = gSpeciesInfo[gBattleMons[opposingBattler].species].types[1],
    defType1 = battleMon.types[0], defType2 = battleMon.types[1];

    // Multiply type effectiveness by a factor depending on type matchup
    typeEffectiveness = uq4_12_multiply(typeEffectiveness, (GetTypeModifier(atkType1, defType1)));
    if (atkType2 != atkType1)
        typeEffectiveness = uq4_12_multiply(typeEffectiveness, (GetTypeModifier(atkType2, defType1)));
    if (defType2 != defType1)
    {
        typeEffectiveness = uq4_12_multiply(typeEffectiveness, (GetTypeModifier(atkType1, defType2)));
        if (atkType2 != atkType1)
            typeEffectiveness = uq4_12_multiply(typeEffectiveness, (GetTypeModifier(atkType2, defType2)));
    }
    return typeEffectiveness;
}

static int GetRandomSwitchinWithBatonPass(int aliveCount, int bits, int firstId, int lastId, int currentMonId)
{
    // Breakout early if there aren't any Baton Pass mons to save computation time
    if (bits == 0)
        return PARTY_SIZE;

    // GetBestMonBatonPass randomly chooses between all mons that met Baton Pass check
    if ((aliveCount == 2 || (aliveCount > 2 && Random() % 3 == 0)) && bits)
    {
        do
        {
            return (Random() % (lastId - firstId)) + firstId;
        } while (!(bits & (1 << (currentMonId))));
    }

    // Catch any other cases (such as only one mon alive and it has Baton Pass)
    else
        return PARTY_SIZE;
}

static s32 GetMaxDamagePlayerCouldDealToSwitchin(u32 battler, u32 opposingBattler, struct BattlePokemon battleMon)
{
    int i = 0;
    u32 playerMove;
    s32 damageTaken = 0, maxDamageTaken = 0;

    for (i = 0; i < MAX_MON_MOVES; i++)
    {
        playerMove = gBattleMons[opposingBattler].moves[i];
        if (playerMove != MOVE_NONE && !IsBattleMoveStatus(playerMove) && GetMoveEffect(playerMove) != EFFECT_FOCUS_PUNCH)
        {
            damageTaken = AI_CalcPartyMonDamage(playerMove, opposingBattler, battler, battleMon, AI_DEFENDING);
            if (playerMove == gBattleStruct->choicedMove[opposingBattler]) // If player is choiced, only care about the choice locked move
                return damageTaken;
            if (damageTaken > maxDamageTaken)
                maxDamageTaken = damageTaken;
        }
    }
    return maxDamageTaken;
}

static bool32 CanAbilityTrapOpponent(u16 ability, u32 opponent)
{
    if ((B_GHOSTS_ESCAPE >= GEN_6 && IS_BATTLER_OF_TYPE(opponent, TYPE_GHOST)))
        return FALSE;
    else if (ability == ABILITY_SHADOW_TAG)
    {
        if (B_SHADOW_TAG_ESCAPE >= GEN_4 && gAiLogicData->abilities[opponent] == ABILITY_SHADOW_TAG) // Check if ability exists in species
            return FALSE;
        else
            return TRUE;
    }
    else if (ability == ABILITY_ARENA_TRAP && IsBattlerGrounded(opponent))
        return TRUE;
    else if (ability == ABILITY_MAGNET_PULL && IS_BATTLER_OF_TYPE(opponent, TYPE_STEEL))
        return TRUE;
    else
        return FALSE;
}

static inline bool32 IsFreeSwitch(enum SwitchType switchType, u32 battlerSwitchingOut, u32 opposingBattler)
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
            u32 opposingAbility = AI_GetBattlerAbility(opposingBattler);
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
static u32 GetBestMonIntegrated(struct Pokemon *party, int firstId, int lastId, u32 battler, u32 opposingBattler, u32 battlerIn1, u32 battlerIn2, enum SwitchType switchType)
{
    int revengeKillerId = PARTY_SIZE, slowRevengeKillerId = PARTY_SIZE, fastThreatenId = PARTY_SIZE, slowThreatenId = PARTY_SIZE, damageMonId = PARTY_SIZE;
    int batonPassId = PARTY_SIZE, typeMatchupId = PARTY_SIZE, typeMatchupEffectiveId = PARTY_SIZE, defensiveMonId = PARTY_SIZE, aceMonId = PARTY_SIZE, trapperId = PARTY_SIZE;
    int i, j, aliveCount = 0, bits = 0, aceMonCount = 0;
    s32 defensiveMonHitKOThreshold = 3; // 3HKO threshold that candidate defensive mons must exceed
    s32 playerMonHP = gBattleMons[opposingBattler].hp, maxDamageDealt = 0, damageDealt = 0;
    u32 aiMove, hitsToKOAI, maxHitsToKO = 0;
    u16 bestResist = UQ_4_12(1.0), bestResistEffective = UQ_4_12(1.0), typeMatchup;
    bool32 isFreeSwitch = IsFreeSwitch(switchType, battlerIn1, opposingBattler), isSwitchinFirst, canSwitchinWin1v1;

    // Iterate through mons
    for (i = firstId; i < lastId; i++)
    {
        // Check mon validity
        if (!IsValidForBattle(&party[i])
            || gBattlerPartyIndexes[battlerIn1] == i
            || gBattlerPartyIndexes[battlerIn2] == i
            || i == gBattleStruct->monToSwitchIntoId[battlerIn1]
            || i == gBattleStruct->monToSwitchIntoId[battlerIn2])
        {
            continue;
        }
        // Save Ace Pokemon for last
        else if (IsAceMon(battler, i))
        {
            aceMonId = i;
            aceMonCount++;
            continue;
        }
        else
            aliveCount++;

        InitializeSwitchinCandidate(&party[i]);

        // While not really invalid per se, not really wise to switch into this mon
        if (gAiLogicData->switchinCandidate.battleMon.ability == ABILITY_TRUANT && IsTruantMonVulnerable(battler, opposingBattler))
            continue;

        // Get max number of hits for player to KO AI mon and type matchup for defensive switching
        hitsToKOAI = GetSwitchinHitsToKO(GetMaxDamagePlayerCouldDealToSwitchin(battler, opposingBattler, gAiLogicData->switchinCandidate.battleMon), battler);
        typeMatchup = GetSwitchinTypeMatchup(opposingBattler, gAiLogicData->switchinCandidate.battleMon);

        // Check through current mon's moves
        for (j = 0; j < MAX_MON_MOVES; j++)
        {
            aiMove = gAiLogicData->switchinCandidate.battleMon.moves[j];

            if (aiMove != MOVE_NONE && !IsBattleMoveStatus(aiMove))
                damageDealt = AI_CalcPartyMonDamage(aiMove, battler, opposingBattler, gAiLogicData->switchinCandidate.battleMon, AI_ATTACKING);

            // Offensive switchin decisions are based on which whether switchin moves first and whether it can win a 1v1
            isSwitchinFirst = AI_WhoStrikesFirstPartyMon(battler, opposingBattler, gAiLogicData->switchinCandidate.battleMon, aiMove);
            canSwitchinWin1v1 = CanSwitchinWin1v1(hitsToKOAI, GetNoOfHitsToKOBattlerDmg(damageDealt, opposingBattler), isSwitchinFirst, isFreeSwitch);

            // Check for Baton Pass; hitsToKO requirements mean mon can boost and BP without dying whether it's slower or not
            if (GetMoveEffect(aiMove) == EFFECT_BATON_PASS)
            {
                if ((isSwitchinFirst && hitsToKOAI > 1) || hitsToKOAI > 2) // Need to take an extra hit if slower
                    bits |= 1u << i;
            }

            // Check that good type matchups get at least two turns and set best type matchup mon
            if (typeMatchup < bestResist)
            {
                if (canSwitchinWin1v1)
                {
                    bestResist = typeMatchup;
                    typeMatchupId = i;
                }
            }

            // Track max hits to KO and set defensive mon
            if(hitsToKOAI > maxHitsToKO && (canSwitchinWin1v1 || gAiThinkingStruct->aiFlags[battler] & AI_FLAG_STALL))
            {
                maxHitsToKO = hitsToKOAI;
                if(maxHitsToKO > defensiveMonHitKOThreshold)
                    defensiveMonId = i;
            }

            // Check for mon with resistance and super effective move for best type matchup mon with effective move
            if (aiMove != MOVE_NONE && !IsBattleMoveStatus(aiMove))
            {
                if (typeMatchup < bestResistEffective)
                {
                    if (AI_GetMoveEffectiveness(aiMove, battler, opposingBattler) >= UQ_4_12(2.0))
                    {
                        if (canSwitchinWin1v1)
                        {
                            bestResistEffective = typeMatchup;
                            typeMatchupEffectiveId = i;
                        }
                    }
                }

                // If a self destruction move doesn't OHKO, don't factor it into revenge killing
                if (GetMoveEffect(aiMove) == EFFECT_EXPLOSION && damageDealt < playerMonHP)
                    continue;

                // Check that mon isn't one shot and set best damage mon
                if (damageDealt > maxDamageDealt)
                {
                    if((isFreeSwitch && hitsToKOAI > 1) || hitsToKOAI > 2) // This is a "default", we have uniquely low standards
                    {
                        maxDamageDealt = damageDealt;
                        damageMonId = i;
                    }
                }

                // Check if current mon can revenge kill in some capacity
                // If AI mon can one shot
                if (damageDealt > playerMonHP)
                {
                    if (canSwitchinWin1v1)
                    {
                        if (isSwitchinFirst)
                            revengeKillerId = i;
                        else
                            slowRevengeKillerId = i;
                    }
                }

                // If AI mon can two shot
                if (damageDealt > playerMonHP / 2)
                {
                    if (canSwitchinWin1v1)
                    {
                        if (isSwitchinFirst)
                            fastThreatenId = i;
                        else
                            slowThreatenId = i;
                    }
                }

                // If mon can trap
                if ((CanAbilityTrapOpponent(gAiLogicData->switchinCandidate.battleMon.ability, opposingBattler)
                    || (CanAbilityTrapOpponent(AI_GetBattlerAbility(opposingBattler), opposingBattler) && gAiLogicData->switchinCandidate.battleMon.ability == ABILITY_TRACE))
                    && CountUsablePartyMons(opposingBattler) > 0
                    && canSwitchinWin1v1)
                    trapperId = i;
            }
        }
    }

    batonPassId = GetRandomSwitchinWithBatonPass(aliveCount, bits, firstId, lastId, i);

    // Different switching priorities depending on switching mid battle vs switching after a KO or slow switch
    if (isFreeSwitch)
    {
        // Return Trapper > Revenge Killer > Type Matchup > Baton Pass > Best Damage
        if (trapperId != PARTY_SIZE)                    return trapperId;
        else if (revengeKillerId != PARTY_SIZE)         return revengeKillerId;
        else if (slowRevengeKillerId != PARTY_SIZE)     return slowRevengeKillerId;
        else if (fastThreatenId != PARTY_SIZE)          return fastThreatenId;
        else if (slowThreatenId != PARTY_SIZE)          return slowThreatenId;
        else if (typeMatchupEffectiveId != PARTY_SIZE)  return typeMatchupEffectiveId;
        else if (typeMatchupId != PARTY_SIZE)           return typeMatchupId;
        else if (batonPassId != PARTY_SIZE)             return batonPassId;
        else if (damageMonId != PARTY_SIZE)             return damageMonId;
    }
    else
    {
        // Return Trapper > Type Matchup > Best Defensive > Baton Pass
        if (trapperId != PARTY_SIZE)                    return trapperId;
        else if (typeMatchupEffectiveId != PARTY_SIZE)  return typeMatchupEffectiveId;
        else if (typeMatchupId != PARTY_SIZE)           return typeMatchupId;
        else if (defensiveMonId != PARTY_SIZE)          return defensiveMonId;
        else if (batonPassId != PARTY_SIZE)             return batonPassId;
    }
    // If ace mon is the last available Pokemon and U-Turn/Volt Switch or Eject Pack/Button was used - switch to the mon.
    if (aceMonId != PARTY_SIZE && CountUsablePartyMons(battler) <= aceMonCount
     && (IsSwitchOutEffect(GetMoveEffect(gCurrentMove)) || gAiLogicData->ejectButtonSwitch || gAiLogicData->ejectPackSwitch))
        return aceMonId;

    return PARTY_SIZE;
}

static u32 GetNextMonInParty(struct Pokemon *party, int firstId, int lastId, u32 battlerIn1, u32 battlerIn2)
{
    u32 i;
    // Iterate through mons
    for (i = firstId; i < lastId; i++)
    {
        // Check mon validity
        if (!IsValidForBattle(&party[i])
            || gBattlerPartyIndexes[battlerIn1] == i
            || gBattlerPartyIndexes[battlerIn2] == i
            || i == gBattleStruct->monToSwitchIntoId[battlerIn1]
            || i == gBattleStruct->monToSwitchIntoId[battlerIn2])
        {
            continue;
        }
        return i;
    }
    return PARTY_SIZE;
}

u32 GetMostSuitableMonToSwitchInto(u32 battler, enum SwitchType switchType)
{
    u32 opposingBattler = 0;
    u32 bestMonId = PARTY_SIZE;
    u32 battlerIn1 = 0, battlerIn2 = 0;
    s32 firstId = 0;
    s32 lastId = 0; // + 1
    struct Pokemon *party;

    if (gBattleStruct->monToSwitchIntoId[battler] != PARTY_SIZE)
        return gBattleStruct->monToSwitchIntoId[battler];
    if (gBattleTypeFlags & BATTLE_TYPE_ARENA)
        return gBattlerPartyIndexes[battler] + 1;

    if (IsDoubleBattle())
    {
        battlerIn1 = battler;
        if (gAbsentBattlerFlags & (1u << GetPartnerBattler(battler)))
            battlerIn2 = battler;
        else
            battlerIn2 = GetPartnerBattler(battler);

        opposingBattler = BATTLE_OPPOSITE(battlerIn1);
        if (gAbsentBattlerFlags & (1u << opposingBattler))
            opposingBattler ^= BIT_FLANK;
    }
    else
    {
        opposingBattler = GetOppositeBattler(battler);
        battlerIn1 = battler;
        battlerIn2 = battler;
    }

    GetAIPartyIndexes(battler, &firstId, &lastId);
    party = GetBattlerParty(battler);

    if (gAiThinkingStruct->aiFlags[GetThinkingBattler(battler)] & AI_FLAG_SEQUENCE_SWITCHING)
    {
        bestMonId = GetNextMonInParty(party, firstId, lastId, battlerIn1, battlerIn2);
        return bestMonId;
    }

    // Only use better mon selection if AI_FLAG_SMART_MON_CHOICES is set for the trainer.
    if (gAiThinkingStruct->aiFlags[GetThinkingBattler(battler)] & AI_FLAG_SMART_MON_CHOICES && !IsDoubleBattle()) // Double Battles aren't included in AI_FLAG_SMART_MON_CHOICE. Defaults to regular switch in logic
    {
        bestMonId = GetBestMonIntegrated(party, firstId, lastId, battler, opposingBattler, battlerIn1, battlerIn2, switchType);
        return bestMonId;
    }

    // This all handled by the GetBestMonIntegrated function if the AI_FLAG_SMART_MON_CHOICES flag is set
    else
    {
        s32 i, aliveCount = 0, aceMonCount = 0;
        u32 invalidMons = 0, aceMonId = PARTY_SIZE;
        // Get invalid slots ids.
        for (i = firstId; i < lastId; i++)
        {
            if (!IsValidForBattle(&party[i])
                || gBattlerPartyIndexes[battlerIn1] == i
                || gBattlerPartyIndexes[battlerIn2] == i
                || i == gBattleStruct->monToSwitchIntoId[battlerIn1]
                || i == gBattleStruct->monToSwitchIntoId[battlerIn2]
                || (GetMonAbility(&party[i]) == ABILITY_TRUANT && IsTruantMonVulnerable(battler, opposingBattler))) // While not really invalid per se, not really wise to switch into this mon.
            {
                invalidMons |= 1u << i;
            }
            else if (IsAceMon(battler, i)) // Save Ace Pokemon for last.
            {
                aceMonId = i;
                aceMonCount++;
                invalidMons |= 1u << i;
            }
            else
            {
                aliveCount++;
            }
        }
        bestMonId = GetBestMonBatonPass(party, firstId, lastId, invalidMons, aliveCount, battler, opposingBattler);
        if (bestMonId != PARTY_SIZE)
            return bestMonId;

        bestMonId = GetBestMonTypeMatchup(party, firstId, lastId, invalidMons, battler, opposingBattler);
        if (bestMonId != PARTY_SIZE)
            return bestMonId;

        bestMonId = GetBestMonDmg(party, firstId, lastId, invalidMons, battler, opposingBattler);
        if (bestMonId != PARTY_SIZE)
            return bestMonId;

        // If ace mon is the last available Pokemon and U-Turn/Volt Switch or Eject Pack/Button was used - switch to the mon.
        if (aceMonId != PARTY_SIZE && CountUsablePartyMons(battler) <= aceMonCount
        && (IsSwitchOutEffect(GetMoveEffect(gCurrentMove)) || gAiLogicData->ejectButtonSwitch || gAiLogicData->ejectPackSwitch))
            return aceMonId;

        return PARTY_SIZE;
    }
}

static bool32 AiExpectsToFaintPlayer(u32 battler)
{
    u8 target = gAiBattleData->chosenTarget[battler];

    if (gAiBattleData->actionFlee || gAiBattleData->choiceWatch)
        return FALSE; // AI not planning to use move

    if (!IsBattlerAlly(target, battler)
      && CanIndexMoveFaintTarget(battler, target, gAiBattleData->chosenMoveIndex[battler], AI_ATTACKING)
      && AI_IsFaster(battler, target, GetAIChosenMove(battler)))
    {
        // We expect to faint the target and move first -> dont use an item
        return TRUE;
    }

    return FALSE;
}

static bool32 ShouldUseItem(u32 battler)
{
    struct Pokemon *party;
    s32 i;
    u8 validMons = 0;
    bool32 shouldUse = FALSE;
    u32 healAmount = 0;

    if (IsAiVsAiBattle())
        return FALSE;

    // If teaming up with player and Pokemon is on the right, or Pokemon is currently held by Sky Drop
    if ((gBattleTypeFlags & BATTLE_TYPE_INGAME_PARTNER && GetBattlerPosition(battler) == B_POSITION_PLAYER_RIGHT)
       || gStatuses3[battler] & STATUS3_SKY_DROPPED)
        return FALSE;

    if (gStatuses3[battler] & STATUS3_EMBARGO)
        return FALSE;

    if (AiExpectsToFaintPlayer(battler))
        return FALSE;

    party = GetBattlerParty(battler);

    for (i = 0; i < PARTY_SIZE; i++)
    {
        if (IsValidForBattle(&party[i]))
        {
            validMons++;
        }
    }

    for (i = 0; i < MAX_TRAINER_ITEMS; i++)
    {
        u16 item;
        const u8 *itemEffects;
        u8 battlerSide;

        item = gBattleHistory->trainerItems[i];
        if (item == ITEM_NONE)
            continue;
        itemEffects = GetItemEffect(item);
        if (itemEffects == NULL)
            continue;

        switch (GetItemBattleUsage(item))
        {
        case EFFECT_ITEM_HEAL_AND_CURE_STATUS:
            healAmount = GetHPHealAmount(itemEffects[GetItemEffectParamOffset(battler, item, 4, ITEM4_HEAL_HP)], GetBattlerMon(battler));
            shouldUse = AI_ShouldHeal(battler, healAmount);
            break;
        case EFFECT_ITEM_RESTORE_HP:
            healAmount = GetHPHealAmount(itemEffects[GetItemEffectParamOffset(battler, item, 4, ITEM4_HEAL_HP)], GetBattlerMon(battler));
            shouldUse = AI_ShouldHeal(battler, healAmount);
            break;
        case EFFECT_ITEM_CURE_STATUS:
            if (itemEffects[3] & ITEM3_SLEEP && gBattleMons[battler].status1 & STATUS1_SLEEP)
                shouldUse = TRUE;
            if (itemEffects[3] & ITEM3_POISON && (gBattleMons[battler].status1 & STATUS1_POISON
                                               || gBattleMons[battler].status1 & STATUS1_TOXIC_POISON))
                shouldUse = TRUE;
            if (itemEffects[3] & ITEM3_BURN && gBattleMons[battler].status1 & STATUS1_BURN)
                shouldUse = TRUE;
            if (itemEffects[3] & ITEM3_FREEZE && (gBattleMons[battler].status1 & STATUS1_FREEZE || gBattleMons[battler].status1 & STATUS1_FROSTBITE))
                shouldUse = TRUE;
            if (itemEffects[3] & ITEM3_PARALYSIS && gBattleMons[battler].status1 & STATUS1_PARALYSIS)
                shouldUse = TRUE;
            if (itemEffects[3] & ITEM3_CONFUSION && gBattleMons[battler].status2 & STATUS2_CONFUSION)
                shouldUse = TRUE;
            break;
        case EFFECT_ITEM_INCREASE_STAT:
        case EFFECT_ITEM_INCREASE_ALL_STATS:
            if (!gDisableStructs[battler].isFirstTurn
                || AI_OpponentCanFaintAiWithMod(battler, 0))
                break;
            shouldUse = TRUE;
            break;
        case EFFECT_ITEM_SET_FOCUS_ENERGY:
            if (!gDisableStructs[battler].isFirstTurn
                || gBattleMons[battler].status2 & STATUS2_FOCUS_ENERGY_ANY
                || AI_OpponentCanFaintAiWithMod(battler, 0))
                break;
            shouldUse = TRUE;
            break;
        case EFFECT_ITEM_SET_MIST:
            battlerSide = GetBattlerSide(battler);
            if (gDisableStructs[battler].isFirstTurn && !(gSideStatuses[battlerSide] & SIDE_STATUS_MIST))
                shouldUse = TRUE;
            break;
        case EFFECT_ITEM_REVIVE:
            gBattleStruct->itemPartyIndex[battler] = GetFirstFaintedPartyIndex(battler);
            if (gBattleStruct->itemPartyIndex[battler] != PARTY_SIZE) // Revive if possible.
                shouldUse = TRUE;
            break;
        case EFFECT_ITEM_USE_POKE_FLUTE:
            if (gBattleMons[battler].status1 & STATUS1_SLEEP)
                shouldUse = TRUE;
            break;
        default:
            return FALSE;
        }
        if (shouldUse)
        {
            // Set selected party ID to current battler if none chosen.
            if (gBattleStruct->itemPartyIndex[battler] == PARTY_SIZE)
                gBattleStruct->itemPartyIndex[battler] = gBattlerPartyIndexes[battler];
            BtlController_EmitTwoReturnValues(battler, B_COMM_TO_ENGINE, B_ACTION_USE_ITEM, 0);
            gBattleStruct->chosenItem[battler] = item;
            gBattleHistory->trainerItems[i] = 0;
            return shouldUse;
        }
    }

    return FALSE;
}

static bool32 AI_ShouldHeal(u32 battler, u32 healAmount)
{
    bool32 shouldHeal = FALSE;
    u8 opponent;
    u32 maxDamage = 0;
    u32 dmg = 0;

    if (gBattleMons[battler].hp < gBattleMons[battler].maxHP / 4
     || gBattleMons[battler].hp == 0
     || (healAmount != 0 && gBattleMons[battler].maxHP - gBattleMons[battler].hp > healAmount))
    {
        // We have low enough HP to consider healing
        shouldHeal = !AI_OpponentCanFaintAiWithMod(battler, healAmount); // if target can kill us even after we heal, why bother
    }

    //calculate max expected damage from the opponent
    for (opponent = 0; opponent < gBattlersCount; opponent++)
    {
        if (IsOnPlayerSide(opponent))
        {
            dmg = GetBestDmgFromBattler(opponent, battler, AI_DEFENDING);

            if (dmg > maxDamage)
                maxDamage = dmg;
        }
    }

    // also heal if a 2HKO is outhealed
    if (AI_OpponentCanFaintAiWithMod(battler, 0)
      && !AI_OpponentCanFaintAiWithMod(battler, healAmount)
      && healAmount > 2*maxDamage)
        return TRUE;

    // also heal, if the expected damage is outhealed and it's the last remaining mon
    if (AI_OpponentCanFaintAiWithMod(battler, 0)
      && !AI_OpponentCanFaintAiWithMod(battler, healAmount)
      && CountUsablePartyMons(battler) == 0)
        return TRUE;

    return shouldHeal;
}

static bool32 AI_OpponentCanFaintAiWithMod(u32 battler, u32 healAmount)
{
    u32 i;
    // Check special cases to NOT heal
    for (i = 0; i < gBattlersCount; i++)
    {
        if (IsOnPlayerSide(i) && CanTargetFaintAiWithMod(i, battler, healAmount, 0))
        {
            // Target is expected to faint us
            return TRUE;
        }
    }
    return FALSE;
}

static u32 GetHPHealAmount(u8 itemEffectParam, struct Pokemon *mon)
{
    switch (itemEffectParam)
    {
    case ITEM6_HEAL_HP_FULL:
        itemEffectParam = GetMonData(mon, MON_DATA_MAX_HP, NULL) - GetMonData(mon, MON_DATA_HP, NULL);
        break;
    case ITEM6_HEAL_HP_HALF:
        itemEffectParam = GetMonData(mon, MON_DATA_MAX_HP, NULL) / 2;
        if (itemEffectParam == 0)
            itemEffectParam = 1;
        break;
    case ITEM6_HEAL_HP_LVL_UP:
        itemEffectParam = gBattleScripting.levelUpHP;
        break;
    case ITEM6_HEAL_HP_QUARTER:
        itemEffectParam = GetMonData(mon, MON_DATA_MAX_HP, NULL) / 4;
        if (itemEffectParam == 0)
            itemEffectParam = 1;
        break;
    }

    return itemEffectParam;
}
