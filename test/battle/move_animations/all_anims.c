#include "global.h"
#include "test/battle.h"

// These tests are very heavy computationally. Only use them to review animation PRs.

#if T_SHOULD_RUN_MOVE_ANIM

#define ANIM_TEST_START_MOVE 1              //  First move to test
#define ANIM_TEST_END_MOVE   MOVES_COUNT-1  //  Last move to test


static void ParametrizeMovesAndSpecies(u32 j, u32 *pMove, u32 *pSpecies, u32 variation)
{
    if (gMovesInfo[j].effect == EFFECT_DARK_VOID) // User needs to be Darkrai
    {
        *pMove = j;
        *pSpecies = SPECIES_DARKRAI;
    }
    else if (gMovesInfo[j].effect == EFFECT_HYPERSPACE_FURY) // User needs to be Hoopa Unbound
    {
        *pMove = j;
        *pSpecies = SPECIES_HOOPA_UNBOUND;
    }
    else if (gMovesInfo[j].effect == EFFECT_AURA_WHEEL) // User needs to be Morpeko
    {
        *pMove = j;
        *pSpecies = SPECIES_MORPEKO_FULL_BELLY;
    }
    else if (gMovesInfo[j].effect == EFFECT_ROTOTILLER || gMovesInfo[j].effect == EFFECT_FLOWER_SHIELD) // User needs to be Grass-type
    {
        *pMove = j;
        *pSpecies = SPECIES_TANGELA;
    }
    else if (gMovesInfo[j].effect == EFFECT_FAIL_IF_NOT_ARG_TYPE && gMovesInfo[j].argument.type == TYPE_FIRE) // User needs to be Fire-type
    {
        *pMove = j;
        *pSpecies = SPECIES_FLAREON;
    }
    else if (gMovesInfo[j].effect == EFFECT_FAIL_IF_NOT_ARG_TYPE && gMovesInfo[j].argument.type == TYPE_ELECTRIC) // User needs to be Electric-type
    {
        *pMove = j;
        *pSpecies = SPECIES_JOLTEON;
    }
    else if (gMovesInfo[j].effect == EFFECT_CURSE && variation == 1) // User needs to be Ghost-type
    {
        *pMove = j;
        *pSpecies = SPECIES_GASTLY;
    }
    else if (gMovesInfo[j].effect == EFFECT_MAGNETIC_FLUX || gMovesInfo[j].effect == EFFECT_GEAR_UP) // User needs to have Plus
    {
        *pMove = j;
        *pSpecies = SPECIES_KLINKLANG;
    }
    else if (gMovesInfo[j].effect == EFFECT_IVY_CUDGEL && variation > 0)
    {
        *pMove = j;
        if (variation == 1)
            *pSpecies = SPECIES_OGERPON_WELLSPRING;
        else if (variation == 2)
            *pSpecies = SPECIES_OGERPON_HEARTHFLAME;
        else
            *pSpecies = SPECIES_OGERPON_CORNERSTONE;
    }
    else if (gMovesInfo[j].effect == EFFECT_DRAGON_DARTS && variation > 0)
    {
        *pMove = j;
        *pSpecies = SPECIES_DRAGAPULT;
    }
    else if (gMovesInfo[j].effect == EFFECT_TERA_STARSTORM && variation == 1)
    {
        *pMove = j;
        *pSpecies = SPECIES_TERAPAGOS_STELLAR;
    }
    else if (gMovesInfo[j].effect == EFFECT_PLACEHOLDER) // Ignore placeholder *pMoves
    {
        *pMove = MOVE_POUND;
        *pSpecies = SPECIES_WOBBUFFET;
    }
    else // Everything else
    {
        *pMove = j;
        *pSpecies = SPECIES_WOBBUFFET;
    }
}

static u32 ParametrizeFriendship(u32 move, u32 variation)
{
    if (gMovesInfo[move].effect == EFFECT_FRUSTRATION
        || gMovesInfo[move].effect == EFFECT_RETURN
        )
    {
        if (variation == 0)
           return 1;
        else if (variation == 1)
            return 61;
        else if (variation == 2)
            return 101;
        else if (variation == 3)
            return 201;
    }
    return 0;
}

static u32 GetParametrizedHP(u32 move, u32 variation)
{
    if (gMovesInfo[move].effect == EFFECT_POWER_BASED_ON_USER_HP && variation > 0)
    {
        if (variation == 1)
            return 6000;
        else if (variation == 2)
            return 4000;
        else if (variation == 3)
            return 2000;
    }
    return 9997;
}

static u32 GetParametrizedItem(u32 move, u32 variation)
{
    if ((move == MOVE_TECHNO_BLAST) && variation > 0)
    {
        if (variation == 1)
            return ITEM_DOUSE_DRIVE;
        else if (variation == 2)
            return ITEM_SHOCK_DRIVE;
        else if (variation == 3)
            return ITEM_BURN_DRIVE;
        else if (variation == 4)
            return ITEM_CHILL_DRIVE;
    }
    return ITEM_ORAN_BERRY;
}

static u32 GetParametrizedLevel(u32 move, u32 variation)
{
    if (gMovesInfo[move].effect == EFFECT_LEVEL_DAMAGE && variation > 0)
    {
        if (variation == 1)
            return 50;
        else if (variation == 2)
            return 20;
    }
    return 100;
}

static bool32 GetParametrizedShinyness(u32 move, u32 variation)
{
    if ((gMovesInfo[move].effect == EFFECT_DRAGON_DARTS && variation == 2)
        || (move == MOVE_SYRUP_BOMB && variation == 1)
        )
        return TRUE;
    return FALSE;
}

static bool32 TargetHasToMove(u32 move) // Opponent needs to hit the player first
{
    if (gMovesInfo[move].effect == EFFECT_COUNTER
     || gMovesInfo[move].effect == EFFECT_MIRROR_MOVE
     || gMovesInfo[move].effect == EFFECT_CONVERSION_2
     || gMovesInfo[move].effect == EFFECT_MIRROR_COAT
     || gMovesInfo[move].effect == EFFECT_METAL_BURST
     || gMovesInfo[move].effect == EFFECT_COPYCAT
     || gMovesInfo[move].effect == EFFECT_SUCKER_PUNCH
     || gMovesInfo[move].effect == EFFECT_INSTRUCT)
        return TRUE;
    return FALSE;
}

static bool32 AttackerHasToSwitch(u32 move) // User needs to send out a different team member
{
    if (gMovesInfo[move].effect == EFFECT_TELEPORT
     || gMovesInfo[move].effect == EFFECT_EXPLOSION
     || gMovesInfo[move].effect == EFFECT_MISTY_EXPLOSION
     || gMovesInfo[move].effect == EFFECT_BATON_PASS
     || gMovesInfo[move].effect == EFFECT_MEMENTO
     || gMovesInfo[move].effect == EFFECT_HEALING_WISH
     || gMovesInfo[move].effect == EFFECT_HIT_ESCAPE
     || gMovesInfo[move].effect == EFFECT_FINAL_GAMBIT
     || gMovesInfo[move].effect == EFFECT_PARTING_SHOT
     || gMovesInfo[move].effect == EFFECT_SHED_TAIL
     || gMovesInfo[move].effect == EFFECT_CHILLY_RECEPTION)
        return TRUE;
    return FALSE;
}

static bool32 UserHasToGoFirst(u32 move) // Player needs to go first
{
    if (gMovesInfo[move].effect == EFFECT_PROTECT
     || gMovesInfo[move].effect == EFFECT_ENDURE
     || gMovesInfo[move].effect == EFFECT_FOLLOW_ME
     || gMovesInfo[move].effect == EFFECT_MAGIC_COAT
     || gMovesInfo[move].effect == EFFECT_ME_FIRST
     || gMovesInfo[move].effect == EFFECT_QUASH
     || gMovesInfo[move].effect == EFFECT_MAT_BLOCK
     || gMovesInfo[move].effect == EFFECT_ELECTRIFY
     || gMovesInfo[move].effect == EFFECT_SHELL_TRAP)
        return TRUE;
    return FALSE;
}

static u32 GetVariationsNumber(u32 move, bool8 isDouble)
{
    u32 variationsNumber;

    if (gMovesInfo[move].effect == EFFECT_WEATHER_BALL
     || gMovesInfo[move].effect == EFFECT_TERRAIN_PULSE
     || move == MOVE_TECHNO_BLAST)
        variationsNumber = 5;
    else if (gMovesInfo[move].effect == EFFECT_FRUSTRATION
          || gMovesInfo[move].effect == EFFECT_RETURN
          || gMovesInfo[move].effect == EFFECT_IVY_CUDGEL
          || move == MOVE_WATER_SPOUT) //we don't use the effect because other moves with the water spout effect don't have animation variations
        variationsNumber = 4;
    else if (gMovesInfo[move].effect == EFFECT_SPIT_UP
          || gMovesInfo[move].effect == EFFECT_SWALLOW
          || gMovesInfo[move].effect == EFFECT_DRAGON_DARTS
          || move == MOVE_SEISMIC_TOSS)
        variationsNumber = 3;
    else if (gMovesInfo[move].effect == EFFECT_CURSE
          || gMovesInfo[move].effect == EFFECT_PRESENT
          || gMovesInfo[move].effect == EFFECT_SHELL_SIDE_ARM
          || gMovesInfo[move].effect == EFFECT_FICKLE_BEAM
          || gMovesInfo[move].effect == EFFECT_MAGNITUDE
          || (isDouble && gMovesInfo[move].effect == EFFECT_TERA_STARSTORM)
          || move == MOVE_SYRUP_BOMB)
        variationsNumber = 2;
    else
        variationsNumber = 1;
    return variationsNumber;
}
static void WhenSingles(u32 move, struct BattlePokemon *attacker, struct BattlePokemon *defender, u32 variation)
{
    // Setup turn
    if (gMovesInfo[move].effect == EFFECT_SNORE
     || gMovesInfo[move].effect == EFFECT_SLEEP_TALK)
    {  // attacker needs to be asleep
        TURN { MOVE(attacker, MOVE_REST); }
    }
    else if (gMovesInfo[move].effect == EFFECT_SPIT_UP
          || gMovesInfo[move].effect == EFFECT_SWALLOW)
    { // attacker needs to have used Stockpile
        for (u32 i = 0; i <= variation; i++)
        {
            TURN { MOVE(attacker, MOVE_STOCKPILE); }
        }
    }
    else if ((gMovesInfo[move].effect == EFFECT_DOUBLE_POWER_ON_ARG_STATUS && gMovesInfo[move].argument.status == STATUS1_PARALYSIS))
    { // defender needs to be paralyzed
        TURN { MOVE(attacker, MOVE_THUNDER_WAVE); }
    }
    else if (gMovesInfo[move].effect == EFFECT_RECYCLE
          || gMovesInfo[move].effect == EFFECT_BELCH)
    { // attacker needs to have eaten its Berry
        TURN { MOVE(attacker, MOVE_STUFF_CHEEKS); }
    }
    else if (gMovesInfo[move].effect == EFFECT_REFRESH
          || gMovesInfo[move].effect == EFFECT_PSYCHO_SHIFT)
    { // attacker needs to be paralyzed
        TURN { MOVE(defender, MOVE_THUNDER_WAVE); }
    }
    else if (gMovesInfo[move].effect == EFFECT_LAST_RESORT)
    { // attacker needs to have used all other moves
        TURN { MOVE(attacker, MOVE_POUND); }
    }
    else if (gMovesInfo[move].effect == EFFECT_DREAM_EATER
          || gMovesInfo[move].effect == EFFECT_NIGHTMARE)
    { // defender needs to be asleep
        TURN { MOVE(defender, MOVE_REST); }
    }
    else if (gMovesInfo[move].effect == EFFECT_VENOM_DRENCH
          || gMovesInfo[move].effect == EFFECT_PURIFY)
    { // defender needs to be poisoned
        TURN { MOVE(attacker, MOVE_POISON_POWDER); }
    }
    else if (gMovesInfo[move].effect == EFFECT_TOPSY_TURVY)
    { // defender needs to have its stats buffed
        TURN { MOVE(defender, MOVE_SWORDS_DANCE); }
    }
    else if (gMovesInfo[move].effect == EFFECT_AURORA_VEIL)
    { // Has to be hailing
        TURN { MOVE(attacker, MOVE_HAIL); }
    }
    else if (gMovesInfo[move].effect == EFFECT_STEEL_ROLLER)
    { // Needs a terrain
        TURN { MOVE(attacker, MOVE_ELECTRIC_TERRAIN); }
    }
    else if (gMovesInfo[move].effect == EFFECT_WEATHER_BALL && variation > 0)
    {
        if (variation == 1)
            TURN { MOVE(attacker, MOVE_SUNNY_DAY); }
        else if (variation == 2)
            TURN { MOVE(attacker, MOVE_RAIN_DANCE); }
        else if (variation == 3)
            TURN { MOVE(attacker, MOVE_SANDSTORM); }
        else
            TURN { MOVE(attacker, MOVE_HAIL); }
    }
    else if (gMovesInfo[move].effect == EFFECT_TERRAIN_PULSE && variation > 0)
    {
        if (variation == 1)
            TURN { MOVE(attacker, MOVE_ELECTRIC_TERRAIN); }
        else if (variation == 2)
            TURN { MOVE(attacker, MOVE_GRASSY_TERRAIN); }
        else if (variation == 3)
            TURN { MOVE(attacker, MOVE_PSYCHIC_TERRAIN); }
        else if (variation == 4)
            TURN { MOVE(attacker, MOVE_MISTY_TERRAIN); }
    }
    else if (gBattleMoveEffects[gMovesInfo[move].effect].twoTurnEffect)
    {
        TURN { MOVE(attacker, move); }
    }
    // Effective turn
    TURN {
        if (TargetHasToMove(move))
        {
            MOVE(defender, gMovesInfo[move].effect == EFFECT_MIRROR_COAT ? MOVE_SWIFT : MOVE_POUND);
            MOVE(attacker, move);
        }
        else if (gMovesInfo[move].effect == EFFECT_SNATCH)
        { // defender needs to steal the defender's buffing move
            MOVE(attacker, move);
            MOVE(defender, MOVE_SWORDS_DANCE);
        }
        else if (gMovesInfo[move].effect == EFFECT_OHKO || gMovesInfo[move].effect == EFFECT_SHEER_COLD)
        { // defender needs to send out a different team member
            MOVE(attacker, move);
            SEND_OUT(defender, 1);
        }
        else if (AttackerHasToSwitch(move))
        { // attacker needs to send out a different team member
            MOVE(attacker, move);
            SEND_OUT(attacker, 1);
        }
        else if (UserHasToGoFirst(move))
        { // attacker needs to go first
            MOVE(attacker, move);
            MOVE(defender, MOVE_POUND);
        }
        else if (gMovesInfo[move].effect == EFFECT_REVIVAL_BLESSING)
        { // attacker selects party member
            MOVE(attacker, move, partyIndex: 1);
            MOVE(defender, MOVE_HELPING_HAND);
        }
        else if (gMovesInfo[move].effect == EFFECT_UPPER_HAND)
        { // defender needs to choose priority move
            MOVE(attacker, move);
            MOVE(defender, MOVE_QUICK_ATTACK);
        }
        else if (gMovesInfo[move].effect == EFFECT_ACUPRESSURE)
        {
            MOVE(attacker, move, target: attacker);
        }
        else if (gBattleMoveEffects[gMovesInfo[move].effect].twoTurnEffect)
        {
            MOVE(defender, MOVE_HELPING_HAND);
            SKIP_TURN(attacker);
        }
        else if (gMovesInfo[move].effect == EFFECT_PRESENT)
        {
            if (variation == 0)
                MOVE(attacker, move, WITH_RNG(RNG_PRESENT, 1));
            else if (variation == 1)
                MOVE(attacker, move, WITH_RNG(RNG_PRESENT, 254));
        }
        else if (gMovesInfo[move].effect == EFFECT_MAGNITUDE)
        {
            if (variation == 0)
                MOVE(attacker, move, WITH_RNG(RNG_MAGNITUDE, 50));
            else if (variation == 1)
                MOVE(attacker, move, WITH_RNG(RNG_MAGNITUDE, 99));
        }
        else if (gMovesInfo[move].effect == EFFECT_FICKLE_BEAM)
        {
            if (variation == 0)
                MOVE(attacker, move, WITH_RNG(RNG_FICKLE_BEAM, FALSE));
            else if (variation == 1)
                MOVE(attacker, move, WITH_RNG(RNG_FICKLE_BEAM, TRUE));
        }
        else if (gMovesInfo[move].effect == EFFECT_SHELL_SIDE_ARM)
        {
            if (variation == 0)
                MOVE(attacker, move, WITH_RNG(RNG_SHELL_SIDE_ARM, FALSE));
            else if (variation == 1)
                MOVE(attacker, move, WITH_RNG(RNG_SHELL_SIDE_ARM, TRUE));
        }
        else
        { // All other moves
            MOVE(defender, MOVE_HELPING_HAND); // Helping Hand, so there's no anim on the defender's side.
            MOVE(attacker, move);
        }
    }
    if (gMovesInfo[move].effect == EFFECT_WISH)
    {
        TURN {};
    }
    else if (gMovesInfo[move].effect == EFFECT_FUTURE_SIGHT)
    {
        TURN {};
        TURN {};
    }
    else if (gMovesInfo[move].effect == EFFECT_ROLLOUT)
    {
        TURN {MOVE(attacker, move);};
        TURN {MOVE(attacker, move);};
        TURN {MOVE(attacker, move);};
        TURN {MOVE(attacker, move);};
        TURN {MOVE(attacker, MOVE_HELPING_HAND);};
    }
}

static void SceneSingles(u32 move, struct BattlePokemon *mon)
{
    if (gMovesInfo[move].effect == EFFECT_FOLLOW_ME
     || gMovesInfo[move].effect == EFFECT_HELPING_HAND
     || gMovesInfo[move].effect == EFFECT_AFTER_YOU
     || gMovesInfo[move].effect == EFFECT_ALLY_SWITCH
     || gMovesInfo[move].effect == EFFECT_AROMATIC_MIST
     || move == MOVE_HOLD_HANDS // Hack here because it shares its effect with Splash and Celebrate
     || gMovesInfo[move].effect == EFFECT_COACHING
     || gMovesInfo[move].effect == EFFECT_DRAGON_CHEER)
    {
        // Moves that fail in Single Battles
    }
    else if (gMovesInfo[move].effect == EFFECT_MIRROR_MOVE) // Copy the opponent's move
    {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_POUND, mon);
    }
    else if (gMovesInfo[move].effect == EFFECT_NATURE_POWER) // Recorded battles always use BATTLE_ENVIRONMENT_BUILDING
    {
        ANIMATION(ANIM_TYPE_MOVE, B_NATURE_POWER_MOVES >= GEN_4 ? MOVE_TRI_ATTACK : MOVE_SWIFT, mon);
    }
    else // All other moves
    {
        ANIMATION(ANIM_TYPE_MOVE, move, mon);
    }
}

static void DoublesWhen(u32 move, struct BattlePokemon *attacker, struct BattlePokemon *target, struct BattlePokemon *ignore1, struct BattlePokemon *ignore2, u32 variation)
{
    // Setup turn
    if (gMovesInfo[move].effect == EFFECT_SNORE
     || gMovesInfo[move].effect == EFFECT_SLEEP_TALK)
    {  // Player needs to be asleep
        TURN { MOVE(attacker, MOVE_REST); }
    }
    else if (gMovesInfo[move].effect == EFFECT_SPIT_UP
            || gMovesInfo[move].effect == EFFECT_SWALLOW)
    { // Player needs to have used Stockpile
        for (u32 i = 0; i <= variation; i++)
        {
            TURN { MOVE(attacker, MOVE_STOCKPILE); }
        }
    }
    else if ((gMovesInfo[move].effect == EFFECT_DOUBLE_POWER_ON_ARG_STATUS && gMovesInfo[move].argument.status == STATUS1_PARALYSIS))
    { // Opponent needs to be paralyzed
        TURN { MOVE(attacker, MOVE_THUNDER_WAVE, target: target); }
    }
    else if (gMovesInfo[move].effect == EFFECT_RECYCLE
          || gMovesInfo[move].effect == EFFECT_BELCH)
    { // Player needs to have eaten its Berry
        TURN { MOVE(attacker, MOVE_STUFF_CHEEKS); }
    }
    else if (gMovesInfo[move].effect == EFFECT_REFRESH
          || gMovesInfo[move].effect == EFFECT_PSYCHO_SHIFT)
    { // Player needs to be paralyzed
        TURN { MOVE(target, MOVE_THUNDER_WAVE, target: attacker); }
    }
    else if (gMovesInfo[move].effect == EFFECT_LAST_RESORT)
    { // Player needs to have used all other moves
        TURN { MOVE(attacker, MOVE_POUND, target: target); }
    }
    else if (gMovesInfo[move].effect == EFFECT_DREAM_EATER
          || gMovesInfo[move].effect == EFFECT_NIGHTMARE)
    { // Opponent needs to be asleep
        TURN { MOVE(target, MOVE_REST); }
    }
    else if (gMovesInfo[move].effect == EFFECT_VENOM_DRENCH
          || gMovesInfo[move].effect == EFFECT_PURIFY)
    { // Opponent needs to be poisoned
        TURN { MOVE(attacker, MOVE_POISON_POWDER, target: target); }
    }
    else if (gMovesInfo[move].effect == EFFECT_TOPSY_TURVY)
    { // Opponent needs to have its stats buffed
        TURN { MOVE(target, MOVE_SWORDS_DANCE); }
    }
    else if (gMovesInfo[move].effect == EFFECT_AURORA_VEIL)
    { // Has to be hailing
        TURN { MOVE(attacker, MOVE_HAIL); }
    }
    else if (gMovesInfo[move].effect == EFFECT_STEEL_ROLLER)
    { // Needs a terrain
        TURN { MOVE(attacker, MOVE_ELECTRIC_TERRAIN); }
    }
    else if (gMovesInfo[move].effect == EFFECT_WEATHER_BALL && variation > 0)
    {
        if (variation == 1)
            TURN { MOVE(attacker, MOVE_SUNNY_DAY); }
        else if (variation == 2)
            TURN { MOVE(attacker, MOVE_RAIN_DANCE); }
        else if (variation == 3)
            TURN { MOVE(attacker, MOVE_SANDSTORM); }
        else
            TURN { MOVE(attacker, MOVE_HAIL); }
    }
    else if (gMovesInfo[move].effect == EFFECT_TERRAIN_PULSE && variation > 0)
    {
        if (variation == 1)
            TURN { MOVE(attacker, MOVE_ELECTRIC_TERRAIN); }
        else if (variation == 2)
            TURN { MOVE(attacker, MOVE_GRASSY_TERRAIN); }
        else if (variation == 3)
            TURN { MOVE(attacker, MOVE_PSYCHIC_TERRAIN); }
        else if (variation == 4)
            TURN { MOVE(attacker, MOVE_MISTY_TERRAIN); }
    }
    else if (gBattleMoveEffects[gMovesInfo[move].effect].twoTurnEffect)
    {
        TURN { MOVE(attacker, move, target: target); }
    }
    // Effective turn
    TURN {
        if (TargetHasToMove(move))
        { // Opponent needs to hit the player first
            MOVE(target, gMovesInfo[move].effect == EFFECT_MIRROR_COAT ? MOVE_SWIFT : MOVE_POUND, target: attacker);
            MOVE(attacker, move, target: target);
        }
        else if (gMovesInfo[move].effect == EFFECT_SNATCH)
        { // Opponent needs to steal the opponent's buffing move
            MOVE(attacker, move, target: target);
            MOVE(target, MOVE_SWORDS_DANCE);
        }
        else if (gMovesInfo[move].effect == EFFECT_OHKO || gMovesInfo[move].effect == EFFECT_SHEER_COLD)
        { // Opponent needs to send out a different team member
            MOVE(attacker, move, target: target);
            SEND_OUT(target, 2);
        }
        else if (AttackerHasToSwitch(move))
        { // Player needs to send out a different team member
            MOVE(attacker, move, target: target);
            SEND_OUT(attacker, 2);
        }
        else if (UserHasToGoFirst(move))
        { // Player needs to go first
            MOVE(attacker, move, target: target);
            MOVE(target, MOVE_POUND, target: attacker);
        }
        else if (gMovesInfo[move].effect == EFFECT_AFTER_YOU)
        { // Player goes first, opponent third
            MOVE(attacker, move, target: target);
            MOVE(ignore1, MOVE_CELEBRATE);
            MOVE(target, MOVE_POUND, target: attacker);
            MOVE(ignore2, MOVE_CELEBRATE);
        }
        else if (gMovesInfo[move].effect == EFFECT_REVIVAL_BLESSING)
        { // Player selects party member
            MOVE(attacker, move, partyIndex: 2);
            MOVE(target, MOVE_LAST_RESORT, target: attacker); // Last Resort, so there's no anim on the opponent's side.
        }
        else if (gMovesInfo[move].effect == EFFECT_UPPER_HAND)
        { // Opponent needs to choose priority move
            MOVE(attacker, move, target: target);
            MOVE(target, MOVE_QUICK_ATTACK, target: attacker);
        }
        else if (gBattleMoveEffects[gMovesInfo[move].effect].twoTurnEffect)
        {
            MOVE(target, MOVE_LAST_RESORT, target: attacker);
            SKIP_TURN(attacker);
        }
        else if (gMovesInfo[move].effect == EFFECT_PRESENT)
        {
            if (variation == 0)
                MOVE(attacker, move, target: target, WITH_RNG(RNG_PRESENT, 1));
            else if (variation == 1)
                MOVE(attacker, move, target: target, WITH_RNG(RNG_PRESENT, 254));
        }
        else if (gMovesInfo[move].effect == EFFECT_MAGNITUDE)
        {
            if (variation == 0)
                MOVE(attacker, move, WITH_RNG(RNG_MAGNITUDE, 50));
            else if (variation == 1)
                MOVE(attacker, move, WITH_RNG(RNG_MAGNITUDE, 99));
        }
        else if (gMovesInfo[move].effect == EFFECT_FICKLE_BEAM)
        {
            if (variation == 0)
                MOVE(attacker, move, target: target, WITH_RNG(RNG_FICKLE_BEAM, FALSE));
            else if (variation == 1)
                MOVE(attacker, move, target: target, WITH_RNG(RNG_FICKLE_BEAM, TRUE));
        }
        else if (gMovesInfo[move].effect == EFFECT_SHELL_SIDE_ARM)
        {
            if (variation == 0)
                MOVE(attacker, move, target: target, WITH_RNG(RNG_SHELL_SIDE_ARM, FALSE));
            else if (variation == 1)
                MOVE(attacker, move, target: target, WITH_RNG(RNG_SHELL_SIDE_ARM, TRUE));
        }
        else
        { // All other moves
            MOVE(target, MOVE_LAST_RESORT, target: attacker); // Last Resort, so there's no anim on the opponent's side.
            MOVE(attacker, move, target: target);
        }
        if (gMovesInfo[move].effect != EFFECT_AFTER_YOU)
        {
            // Actions for the remaining battlers
            MOVE(ignore1, MOVE_CELEBRATE);
            MOVE(ignore2, MOVE_CELEBRATE);
        }
    }
    if (gMovesInfo[move].effect == EFFECT_WISH)
    {
        TURN {};
    }
    else if (gMovesInfo[move].effect == EFFECT_FUTURE_SIGHT)
    {
        TURN {};
        TURN {};
    }
    else if (gMovesInfo[move].effect == EFFECT_ROLLOUT)
    {
        TURN {MOVE(attacker, move, target: target);};
        TURN {MOVE(attacker, move, target: target);};
        TURN {MOVE(attacker, move, target: target);};
        TURN {MOVE(attacker, move, target: target);};
        TURN {MOVE(attacker, MOVE_LAST_RESORT, target: attacker);};
    }
}

static void DoublesScene(u32 move, struct BattlePokemon *attacker)
{
    if (gMovesInfo[move].effect == EFFECT_MAGNETIC_FLUX || gMovesInfo[move].effect == EFFECT_GEAR_UP) // For some reason, Magnetic Flux and Gear Up are failing in Double Battles here
    {
        // Moves that fail in Double Battles
    }
    else if (gMovesInfo[move].effect == EFFECT_MIRROR_MOVE)
    { // Copy the opponent's move
        ANIMATION(ANIM_TYPE_MOVE, MOVE_POUND, attacker);
    }
    else if (gMovesInfo[move].effect == EFFECT_NATURE_POWER)
    { // Recorded battles always use BATTLE_ENVIRONMENT_BUILDING
        ANIMATION(ANIM_TYPE_MOVE, B_NATURE_POWER_MOVES >= GEN_4 ? MOVE_TRI_ATTACK : MOVE_SWIFT, attacker);
    }
    else
    { // All other moves
        ANIMATION(ANIM_TYPE_MOVE, move, attacker);
    }
}

//static void SameSideTargeting(u32 move, struct BattlePokemon *attacker)
//{
//    //  Don't know how to make sure this is correct, some moves don't display
//}

SINGLE_BATTLE_TEST("Move Animations don't leak when used - Singles (player to opponent)")
{
    u32 j = ANIM_TEST_START_MOVE, move = 0, species = 0;
    u32 k = 0, variation = 0, variationsNumber;
    u32 friendship = 0, tempFriendship;
    u32 tempMove, tempSpecies;
    FORCE_MOVE_ANIM(TRUE);
    for (; j <= ANIM_TEST_END_MOVE; j++) {
        variationsNumber = GetVariationsNumber(j, FALSE);
        for (k = 0; k < variationsNumber; k++) {
            ParametrizeMovesAndSpecies(j, &tempMove, &tempSpecies, k);
            tempFriendship = ParametrizeFriendship(j, k);
            PARAMETRIZE { move = tempMove; species = tempSpecies; variation = k; friendship = tempFriendship;}
        }
    }
    GIVEN {
        PLAYER(species) {
            Level(GetParametrizedLevel(move, variation));
            HP(GetParametrizedHP(move, variation)); MaxHP(9999); Item(GetParametrizedItem(move, variation));
            if (species == SPECIES_WOBBUFFET) Gender(MON_FEMALE);
            if (gMovesInfo[move].effect == EFFECT_LAST_RESORT) Moves(move, MOVE_POUND);
            if (species == SPECIES_KLINKLANG) Ability(ABILITY_PLUS);
            if (friendship) Friendship(friendship);
            if (GetParametrizedShinyness(move, variation)) Shiny(TRUE);
        }
        PLAYER(SPECIES_WOBBUFFET)   {
            Gender(MON_MALE); MaxHP(9999); Moves(MOVE_POUND);
            HP(gMovesInfo[move].effect == EFFECT_REVIVAL_BLESSING ? 0 : 9998);
        }
        OPPONENT(SPECIES_WOBBUFFET) {
            Gender(MON_MALE); HP(9998); MaxHP(9999); SpDefense(9999); Defense(9999); Ability(ABILITY_TELEPATHY);
            if (gMovesInfo[move].effect != EFFECT_BESTOW)
                Item(ITEM_ORAN_BERRY);
        }
        OPPONENT(SPECIES_WOBBUFFET) { Gender(MON_FEMALE); HP(9998); MaxHP(9999); SpDefense(9999); Defense(9999); }
    } WHEN {
        WhenSingles(move, player, opponent, variation);
    } SCENE {
        SceneSingles(move, player);
    } THEN {
        FORCE_MOVE_ANIM(FALSE);
        if (gLoadFail)
            DebugPrintf("Move failed: %S (%u)", gMovesInfo[move].name, move);
        EXPECT_EQ(gLoadFail, FALSE);
    }
}

SINGLE_BATTLE_TEST("Move Animations don't leak when used - Singles (opponent to player)")
{
    u32 j = ANIM_TEST_START_MOVE, move = 0, species = 0;
    u32 k = 0, variation = 0, variationsNumber;
    u32 friendship = 0, tempFriendship;
    u32 tempMove, tempSpecies;
    FORCE_MOVE_ANIM(TRUE);
    for (; j <= ANIM_TEST_END_MOVE; j++) {
        variationsNumber = GetVariationsNumber(j, FALSE);
        for (k = 0; k < variationsNumber; k++) {
            ParametrizeMovesAndSpecies(j, &tempMove, &tempSpecies, k);
            tempFriendship = ParametrizeFriendship(j, k);
            PARAMETRIZE { move = tempMove; species = tempSpecies; variation = k; friendship = tempFriendship;}
        }
    }
    GIVEN {
        OPPONENT(species) {
            Level(GetParametrizedLevel(move, variation));
            HP(GetParametrizedHP(move, variation)); MaxHP(9999); Item(GetParametrizedItem(move, variation));
            if (species == SPECIES_WOBBUFFET) Gender(MON_FEMALE);
            if (gMovesInfo[move].effect == EFFECT_LAST_RESORT) Moves(move, MOVE_POUND);
            if (species == SPECIES_KLINKLANG) Ability(ABILITY_PLUS);
            if (friendship) Friendship(friendship);
            if (GetParametrizedShinyness(move, variation)) Shiny(TRUE);
        }
        OPPONENT(SPECIES_WOBBUFFET)   {
            Gender(MON_MALE); MaxHP(9999); Moves(MOVE_POUND);
            HP(gMovesInfo[move].effect == EFFECT_REVIVAL_BLESSING ? 0 : 9998);
        }
        PLAYER(SPECIES_WOBBUFFET) {
            Gender(MON_MALE); HP(9998); MaxHP(9999); SpDefense(9999); Defense(9999); Ability(ABILITY_TELEPATHY);
            if (gMovesInfo[move].effect != EFFECT_BESTOW)
                Item(ITEM_ORAN_BERRY);
        }
        PLAYER(SPECIES_WOBBUFFET) { Gender(MON_FEMALE); HP(9998); MaxHP(9999); SpDefense(9999); Defense(9999); }
    } WHEN {
        WhenSingles(move, opponent, player, variation);
    } SCENE {
        SceneSingles(move, opponent);
    } THEN {
        FORCE_MOVE_ANIM(FALSE);
        if (gLoadFail)
            DebugPrintf("Move failed: %S (%u)", gMovesInfo[move].name, move);
        EXPECT_EQ(gLoadFail, FALSE);
    }
}

DOUBLE_BATTLE_TEST("Move Animations don't leak when used - Doubles (playerLeft to opponentLeft)")
{
    u32 j = ANIM_TEST_START_MOVE, move = 0, species = 0;
    u32 k = 0, variation = 0, variationsNumber;
    u32 friendship = 0, tempFriendship;
    u32 tempMove, tempSpecies;
    FORCE_MOVE_ANIM(TRUE);
    struct BattlePokemon *attacker = playerLeft;
    struct BattlePokemon *target = opponentLeft;
    struct BattlePokemon *ignore1 = playerRight;
    struct BattlePokemon *ignore2 = opponentRight;
    for (; j <= ANIM_TEST_END_MOVE; j++) {
        variationsNumber = GetVariationsNumber(j, TRUE);
        for (k = 0; k < variationsNumber; k++) {
            ParametrizeMovesAndSpecies(j, &tempMove, &tempSpecies, k);
            tempFriendship = ParametrizeFriendship(j, k);
            PARAMETRIZE { move = tempMove; species = tempSpecies; variation = k; friendship = tempFriendship;}
        }
    }
    GIVEN {
        PLAYER(species) {
            Level(GetParametrizedLevel(move, variation));
            HP(GetParametrizedHP(move, variation)); MaxHP(9999); Item(GetParametrizedItem(move, variation));
            if (attacker == playerLeft) {
                if (species == SPECIES_WOBBUFFET) Gender(MON_FEMALE);
                if (gMovesInfo[move].effect == EFFECT_LAST_RESORT) Moves(move, MOVE_POUND);
                if (species == SPECIES_KLINKLANG) Ability(ABILITY_PLUS);
                if (friendship) Friendship(friendship);
                if (GetParametrizedShinyness(move, variation)) Shiny(TRUE);
            }
        }
        PLAYER(species) {
            Level(GetParametrizedLevel(move, variation));
            HP(GetParametrizedHP(move, variation)); MaxHP(9999); Item(GetParametrizedItem(move, variation));
            if (attacker == playerRight)
            {
                if (species == SPECIES_WOBBUFFET) Gender(MON_FEMALE);
                if (gMovesInfo[move].effect == EFFECT_LAST_RESORT) Moves(move, MOVE_POUND);
                if (species == SPECIES_KLINKLANG) Ability(ABILITY_PLUS);
                if (friendship) Friendship(friendship);
                if (GetParametrizedShinyness(move, variation)) Shiny(TRUE);
            }
        }
        PLAYER(SPECIES_WOBBUFFET) {
            Gender(MON_MALE); MaxHP(9999); Moves(MOVE_POUND, MOVE_CELEBRATE);
            HP(gMovesInfo[move].effect == EFFECT_REVIVAL_BLESSING ? 0 : 9998);
        }
        OPPONENT(SPECIES_WOBBUFFET) {
            Gender(MON_MALE); HP(9998); MaxHP(9999); SpDefense(9999); Defense(9999); Ability(ABILITY_TELEPATHY);
            if (gMovesInfo[move].effect != EFFECT_BESTOW)
                Item(ITEM_ORAN_BERRY);
        }
        OPPONENT(SPECIES_WOBBUFFET) {
            Gender(MON_MALE); HP(9998); MaxHP(9999); SpDefense(9999); Defense(9999); Ability(ABILITY_TELEPATHY);
            if (gMovesInfo[move].effect != EFFECT_BESTOW)
                Item(ITEM_ORAN_BERRY);
        }
        OPPONENT(SPECIES_WOBBUFFET) { Gender(MON_FEMALE); HP(9998); MaxHP(9999); SpDefense(9999); Defense(9999); }
    } WHEN {
        DoublesWhen(move, attacker, target, ignore1, ignore2, variation);
    } SCENE {
        DoublesScene(move, attacker);
    } THEN {
        FORCE_MOVE_ANIM(FALSE);
        if (gLoadFail)
            DebugPrintf("Move failed: %S (%u)", gMovesInfo[move].name, move);
        EXPECT_EQ(gLoadFail, FALSE);
    }
}

DOUBLE_BATTLE_TEST("Move Animations don't leak when used - Doubles (opponentLeft to playerLeft)")
{
    u32 j = ANIM_TEST_START_MOVE, move = 0, species = 0;
    u32 k = 0, variation = 0, variationsNumber;
    u32 friendship = 0, tempFriendship;
    u32 tempMove, tempSpecies;
    FORCE_MOVE_ANIM(TRUE);
    struct BattlePokemon *attacker = opponentLeft;
    struct BattlePokemon *target = playerLeft;
    struct BattlePokemon *ignore1 = opponentRight;
    struct BattlePokemon *ignore2 = playerRight;
    for (; j <= ANIM_TEST_END_MOVE; j++) {
        variationsNumber = GetVariationsNumber(j, TRUE);
        for (k = 0; k < variationsNumber; k++) {
            ParametrizeMovesAndSpecies(j, &tempMove, &tempSpecies, k);
            tempFriendship = ParametrizeFriendship(j, k);
            PARAMETRIZE { move = tempMove; species = tempSpecies; variation = k; friendship = tempFriendship;}
        }
    }
    GIVEN {
        OPPONENT(species) {
            Level(GetParametrizedLevel(move, variation));
            HP(GetParametrizedHP(move, variation)); MaxHP(9999); Item(GetParametrizedItem(move, variation));
            if (attacker == opponentLeft) {
                if (species == SPECIES_WOBBUFFET) Gender(MON_FEMALE);
                if (gMovesInfo[move].effect == EFFECT_LAST_RESORT) Moves(move, MOVE_POUND);
                if (species == SPECIES_KLINKLANG) Ability(ABILITY_PLUS);
                if (friendship) Friendship(friendship);
                if (GetParametrizedShinyness(move, variation)) Shiny(TRUE);
            }
        }
        OPPONENT(species) {
            Level(GetParametrizedLevel(move, variation));
            HP(GetParametrizedHP(move, variation)); MaxHP(9999); Item(GetParametrizedItem(move, variation));
            if (attacker == opponentRight) {
                if (species == SPECIES_WOBBUFFET) Gender(MON_FEMALE);
                if (gMovesInfo[move].effect == EFFECT_LAST_RESORT) Moves(move, MOVE_POUND);
                if (species == SPECIES_KLINKLANG) Ability(ABILITY_PLUS);
                if (friendship) Friendship(friendship);
                if (GetParametrizedShinyness(move, variation)) Shiny(TRUE);
            }
        }
        OPPONENT(SPECIES_WOBBUFFET) {
            Gender(MON_MALE); MaxHP(9999); Moves(MOVE_POUND, MOVE_CELEBRATE);
            HP(gMovesInfo[move].effect == EFFECT_REVIVAL_BLESSING ? 0 : 9998);
        }
        PLAYER(SPECIES_WOBBUFFET) {
            Gender(MON_MALE); HP(9998); MaxHP(9999); SpDefense(9999); Defense(9999); Ability(ABILITY_TELEPATHY);
            if (gMovesInfo[move].effect != EFFECT_BESTOW) {
                Item(ITEM_ORAN_BERRY);
            }
        }
        PLAYER(SPECIES_WOBBUFFET) {
            Gender(MON_MALE); HP(9998); MaxHP(9999); SpDefense(9999); Defense(9999); Ability(ABILITY_TELEPATHY);
            if (gMovesInfo[move].effect != EFFECT_BESTOW) {
                Item(ITEM_ORAN_BERRY);
            }
        }
        PLAYER(SPECIES_WOBBUFFET) { Gender(MON_FEMALE); HP(9998); MaxHP(9999); SpDefense(9999); Defense(9999); }
    } WHEN {
        DoublesWhen(move, attacker, target, ignore1, ignore2, variation);
    } SCENE {
        DoublesScene(move, attacker);
    } THEN {
        FORCE_MOVE_ANIM(FALSE);
        if (gLoadFail)
            DebugPrintf("Move failed: %S (%u)", gMovesInfo[move].name, move);
        EXPECT_EQ(gLoadFail, FALSE);
    }
}

DOUBLE_BATTLE_TEST("Move Animations don't leak when used - Doubles (playerLeft to opponentRight)")
{
    u32 j = ANIM_TEST_START_MOVE, move = 0, species = 0;
    u32 k = 0, variation = 0, variationsNumber;
    u32 friendship = 0, tempFriendship;
    u32 tempMove, tempSpecies;
    FORCE_MOVE_ANIM(TRUE);
    struct BattlePokemon *attacker = playerLeft;
    struct BattlePokemon *target = opponentRight;
    struct BattlePokemon *ignore1 = playerRight;
    struct BattlePokemon *ignore2 = opponentLeft;
    for (; j <= ANIM_TEST_END_MOVE; j++) {
        variationsNumber = GetVariationsNumber(j, TRUE);
        for (k = 0; k < variationsNumber; k++) {
            ParametrizeMovesAndSpecies(j, &tempMove, &tempSpecies, k);
            tempFriendship = ParametrizeFriendship(j, k);
            PARAMETRIZE { move = tempMove; species = tempSpecies; variation = k; friendship = tempFriendship;}
        }
    }
    GIVEN {
        PLAYER(species) {
            Level(GetParametrizedLevel(move, variation));
            HP(GetParametrizedHP(move, variation)); MaxHP(9999); Item(GetParametrizedItem(move, variation));
            if (attacker == playerLeft) {
                if (species == SPECIES_WOBBUFFET) Gender(MON_FEMALE);
                if (gMovesInfo[move].effect == EFFECT_LAST_RESORT) Moves(move, MOVE_POUND);
                if (species == SPECIES_KLINKLANG) Ability(ABILITY_PLUS);
                if (friendship) Friendship(friendship);
                if (GetParametrizedShinyness(move, variation)) Shiny(TRUE);
            }
        }
        PLAYER(species) {
            Level(GetParametrizedLevel(move, variation));
            HP(GetParametrizedHP(move, variation)); MaxHP(9999); Item(GetParametrizedItem(move, variation));
            if (attacker == playerRight) {
                if (species == SPECIES_WOBBUFFET) Gender(MON_FEMALE);
                if (gMovesInfo[move].effect == EFFECT_LAST_RESORT) Moves(move, MOVE_POUND);
                if (species == SPECIES_KLINKLANG) Ability(ABILITY_PLUS);
                if (friendship) Friendship(friendship);
                if (GetParametrizedShinyness(move, variation)) Shiny(TRUE);
            }
        }
        PLAYER(SPECIES_WOBBUFFET) {
            Gender(MON_MALE); MaxHP(9999); Moves(MOVE_POUND, MOVE_CELEBRATE);
            HP(gMovesInfo[move].effect == EFFECT_REVIVAL_BLESSING ? 0 : 9998);
        }
        OPPONENT(SPECIES_WOBBUFFET) {
            Gender(MON_MALE); HP(9998); MaxHP(9999); SpDefense(9999); Defense(9999); Ability(ABILITY_TELEPATHY);
            if (gMovesInfo[move].effect != EFFECT_BESTOW) {
                Item(ITEM_ORAN_BERRY);
            }
        }
        OPPONENT(SPECIES_WOBBUFFET) {
            Gender(MON_MALE); HP(9998); MaxHP(9999); SpDefense(9999); Defense(9999); Ability(ABILITY_TELEPATHY);
            if (gMovesInfo[move].effect != EFFECT_BESTOW) {
                Item(ITEM_ORAN_BERRY);
            }
        }
        OPPONENT(SPECIES_WOBBUFFET) { Gender(MON_FEMALE); HP(9998); MaxHP(9999); SpDefense(9999); Defense(9999); }
    } WHEN {
        DoublesWhen(move, attacker, target, ignore1, ignore2, variation);
    } SCENE {
        DoublesScene(move, attacker);
    } THEN {
        FORCE_MOVE_ANIM(FALSE);
        if (gLoadFail)
            DebugPrintf("Move failed: %S (%u)", gMovesInfo[move].name, move);
        EXPECT_EQ(gLoadFail, FALSE);
    }
}

DOUBLE_BATTLE_TEST("Move Animations don't leak when used - Doubles (opponentRight to playerLeft)")
{
    u32 j = ANIM_TEST_START_MOVE, move = 0, species = 0;
    u32 k = 0, variation = 0, variationsNumber;
    u32 friendship = 0, tempFriendship;
    u32 tempMove, tempSpecies;
    FORCE_MOVE_ANIM(TRUE);
    struct BattlePokemon *attacker = opponentRight;
    struct BattlePokemon *target = playerLeft;
    struct BattlePokemon *ignore1 = opponentLeft;
    struct BattlePokemon *ignore2 = playerRight;
    for (; j <= ANIM_TEST_END_MOVE; j++) {
        variationsNumber = GetVariationsNumber(j, TRUE);
        for (k = 0; k < variationsNumber; k++) {
            ParametrizeMovesAndSpecies(j, &tempMove, &tempSpecies, k);
            tempFriendship = ParametrizeFriendship(j, k);
            PARAMETRIZE { move = tempMove; species = tempSpecies; variation = k; friendship = tempFriendship;}
        }
    }
    GIVEN {
        OPPONENT(species) {
            Level(GetParametrizedLevel(move, variation));
            HP(GetParametrizedHP(move, variation)); MaxHP(9999); Item(GetParametrizedItem(move, variation));
            if (attacker == opponentLeft) {
                if (species == SPECIES_WOBBUFFET) Gender(MON_FEMALE);
                if (gMovesInfo[move].effect == EFFECT_LAST_RESORT) Moves(move, MOVE_POUND);
                if (species == SPECIES_KLINKLANG) Ability(ABILITY_PLUS);
                if (friendship) Friendship(friendship);
                if (GetParametrizedShinyness(move, variation)) Shiny(TRUE);
            }
        }
        OPPONENT(species) {
            Level(GetParametrizedLevel(move, variation));
            HP(GetParametrizedHP(move, variation)); MaxHP(9999); Item(GetParametrizedItem(move, variation));
            if (attacker == opponentRight) {
                if (species == SPECIES_WOBBUFFET) Gender(MON_FEMALE);
                if (gMovesInfo[move].effect == EFFECT_LAST_RESORT) Moves(move, MOVE_POUND);
                if (species == SPECIES_KLINKLANG) Ability(ABILITY_PLUS);
                if (friendship) Friendship(friendship);
                if (GetParametrizedShinyness(move, variation)) Shiny(TRUE);
            }
        }
        OPPONENT(SPECIES_WOBBUFFET) {
            Gender(MON_MALE); MaxHP(9999); Moves(MOVE_POUND, MOVE_CELEBRATE);
            HP(gMovesInfo[move].effect == EFFECT_REVIVAL_BLESSING ? 0 : 9998);
        }
        PLAYER(SPECIES_WOBBUFFET) {
            Gender(MON_MALE); HP(9998); MaxHP(9999); SpDefense(9999); Defense(9999); Ability(ABILITY_TELEPATHY);
            if (gMovesInfo[move].effect != EFFECT_BESTOW) {
                Item(ITEM_ORAN_BERRY);
            }
        }
        PLAYER(SPECIES_WOBBUFFET) {
            Gender(MON_MALE); HP(9998); MaxHP(9999); SpDefense(9999); Defense(9999); Ability(ABILITY_TELEPATHY);
            if (gMovesInfo[move].effect != EFFECT_BESTOW) {
                Item(ITEM_ORAN_BERRY);
            }
        }
        PLAYER(SPECIES_WOBBUFFET) { Gender(MON_FEMALE); HP(9998); MaxHP(9999); SpDefense(9999); Defense(9999); }
    } WHEN {
        DoublesWhen(move, attacker, target, ignore1, ignore2, variation);
    } SCENE {
        DoublesScene(move, attacker);
    } THEN {
        FORCE_MOVE_ANIM(FALSE);
        if (gLoadFail)
            DebugPrintf("Move failed: %S (%u)", gMovesInfo[move].name, move);
        EXPECT_EQ(gLoadFail, FALSE);
    }
}

DOUBLE_BATTLE_TEST("Move Animations don't leak when used - Doubles (playerRight to opponentLeft)")
{
    u32 j = ANIM_TEST_START_MOVE, move = 0, species = 0;
    u32 k = 0, variation = 0, variationsNumber;
    u32 friendship = 0, tempFriendship;
    u32 tempMove, tempSpecies;
    FORCE_MOVE_ANIM(TRUE);
    struct BattlePokemon *attacker = playerRight;
    struct BattlePokemon *target = opponentLeft;
    struct BattlePokemon *ignore1 = playerLeft;
    struct BattlePokemon *ignore2 = opponentRight;
    for (; j <= ANIM_TEST_END_MOVE; j++) {
        variationsNumber = GetVariationsNumber(j, TRUE);
        for (k = 0; k < variationsNumber; k++) {
            ParametrizeMovesAndSpecies(j, &tempMove, &tempSpecies, k);
            tempFriendship = ParametrizeFriendship(j, k);
            PARAMETRIZE { move = tempMove; species = tempSpecies; variation = k; friendship = tempFriendship;}
        }
    }
    GIVEN {
        PLAYER(species) {
            Level(GetParametrizedLevel(move, variation));
            HP(GetParametrizedHP(move, variation)); MaxHP(9999); Item(GetParametrizedItem(move, variation));
            if (attacker == playerLeft) {
                if (species == SPECIES_WOBBUFFET) Gender(MON_FEMALE);
                if (gMovesInfo[move].effect == EFFECT_LAST_RESORT) Moves(move, MOVE_POUND);
                if (species == SPECIES_KLINKLANG) Ability(ABILITY_PLUS);
                if (friendship) Friendship(friendship);
                if (GetParametrizedShinyness(move, variation)) Shiny(TRUE);
            }
        }
        PLAYER(species) {
            Level(GetParametrizedLevel(move, variation));
            HP(GetParametrizedHP(move, variation)); MaxHP(9999); Item(GetParametrizedItem(move, variation));
            if (attacker == playerRight) {
                if (species == SPECIES_WOBBUFFET) Gender(MON_FEMALE);
                if (gMovesInfo[move].effect == EFFECT_LAST_RESORT) Moves(move, MOVE_POUND);
                if (species == SPECIES_KLINKLANG) Ability(ABILITY_PLUS);
                if (friendship) Friendship(friendship);
                if (GetParametrizedShinyness(move, variation)) Shiny(TRUE);
            }
        }
        PLAYER(SPECIES_WOBBUFFET) {
            Gender(MON_MALE); MaxHP(9999); Moves(MOVE_POUND, MOVE_CELEBRATE);
            HP(gMovesInfo[move].effect == EFFECT_REVIVAL_BLESSING ? 0 : 9998);
        }
        OPPONENT(SPECIES_WOBBUFFET) {
            Gender(MON_MALE); HP(9998); MaxHP(9999); SpDefense(9999); Defense(9999); Ability(ABILITY_TELEPATHY);
            if (gMovesInfo[move].effect != EFFECT_BESTOW) {
                Item(ITEM_ORAN_BERRY);
            }
        }
        OPPONENT(SPECIES_WOBBUFFET) {
            Gender(MON_MALE); HP(9998); MaxHP(9999); SpDefense(9999); Defense(9999); Ability(ABILITY_TELEPATHY);
            if (gMovesInfo[move].effect != EFFECT_BESTOW) {
                Item(ITEM_ORAN_BERRY);
            }
        }
        OPPONENT(SPECIES_WOBBUFFET) { Gender(MON_FEMALE); HP(9998); MaxHP(9999); SpDefense(9999); Defense(9999); }
    } WHEN {
        DoublesWhen(move, attacker, target, ignore1, ignore2, variation);
    } SCENE {
        DoublesScene(move, attacker);
    } THEN {
        FORCE_MOVE_ANIM(FALSE);
        if (gLoadFail)
            DebugPrintf("Move failed: %S (%u)", gMovesInfo[move].name, move);
        EXPECT_EQ(gLoadFail, FALSE);
    }
}

DOUBLE_BATTLE_TEST("Move Animations don't leak when used - Doubles (opponentLeft to playerRight)")
{
    u32 j = ANIM_TEST_START_MOVE, move = 0, species = 0;
    u32 k = 0, variation = 0, variationsNumber;
    u32 friendship = 0, tempFriendship;
    u32 tempMove, tempSpecies;
    FORCE_MOVE_ANIM(TRUE);
    struct BattlePokemon *attacker = opponentLeft;
    struct BattlePokemon *target = playerRight;
    struct BattlePokemon *ignore1 = playerLeft;
    struct BattlePokemon *ignore2 = opponentRight;
    for (; j <= ANIM_TEST_END_MOVE; j++) {
        variationsNumber = GetVariationsNumber(j, TRUE);
        for (k = 0; k < variationsNumber; k++) {
            ParametrizeMovesAndSpecies(j, &tempMove, &tempSpecies, k);
            tempFriendship = ParametrizeFriendship(j, k);
            PARAMETRIZE { move = tempMove; species = tempSpecies; variation = k; friendship = tempFriendship;}
        }
    }
    GIVEN {
        OPPONENT(species) {
            Level(GetParametrizedLevel(move, variation));
            HP(GetParametrizedHP(move, variation)); MaxHP(9999); Item(GetParametrizedItem(move, variation));
            if (attacker == opponentLeft) {
                if (species == SPECIES_WOBBUFFET) Gender(MON_FEMALE);
                if (gMovesInfo[move].effect == EFFECT_LAST_RESORT) Moves(move, MOVE_POUND);
                if (species == SPECIES_KLINKLANG) Ability(ABILITY_PLUS);
                if (friendship) Friendship(friendship);
                if (GetParametrizedShinyness(move, variation)) Shiny(TRUE);
            }
        }
        OPPONENT(species) {
            Level(GetParametrizedLevel(move, variation));
            HP(GetParametrizedHP(move, variation)); MaxHP(9999); Item(GetParametrizedItem(move, variation));
            if (attacker == opponentRight) {
                if (species == SPECIES_WOBBUFFET) Gender(MON_FEMALE);
                if (gMovesInfo[move].effect == EFFECT_LAST_RESORT) Moves(move, MOVE_POUND);
                if (species == SPECIES_KLINKLANG) Ability(ABILITY_PLUS);
                if (friendship) Friendship(friendship);
                if (GetParametrizedShinyness(move, variation)) Shiny(TRUE);
            }
        }
        OPPONENT(SPECIES_WOBBUFFET) {
            Gender(MON_MALE); MaxHP(9999); Moves(MOVE_POUND, MOVE_CELEBRATE);
            HP(gMovesInfo[move].effect == EFFECT_REVIVAL_BLESSING ? 0 : 9998);
        }
        PLAYER(SPECIES_WOBBUFFET) {
            Gender(MON_MALE); HP(9998); MaxHP(9999); SpDefense(9999); Defense(9999); Ability(ABILITY_TELEPATHY);
            if (gMovesInfo[move].effect != EFFECT_BESTOW) {
                Item(ITEM_ORAN_BERRY);
            }
        }
        PLAYER(SPECIES_WOBBUFFET) {
            Gender(MON_MALE); HP(9998); MaxHP(9999); SpDefense(9999); Defense(9999); Ability(ABILITY_TELEPATHY);
            if (gMovesInfo[move].effect != EFFECT_BESTOW) {
                Item(ITEM_ORAN_BERRY);
            }
        }
        PLAYER(SPECIES_WOBBUFFET) { Gender(MON_FEMALE); HP(9998); MaxHP(9999); SpDefense(9999); Defense(9999); }
    } WHEN {
        DoublesWhen(move, attacker, target, ignore1, ignore2, variation);
    } SCENE {
        DoublesScene(move, attacker);
    } THEN {
        FORCE_MOVE_ANIM(FALSE);
        if (gLoadFail)
            DebugPrintf("Move failed: %S (%u)", gMovesInfo[move].name, move);
        EXPECT_EQ(gLoadFail, FALSE);
    }
}

DOUBLE_BATTLE_TEST("Move Animations don't leak when used - Doubles (playerRight to opponentRight)")
{
    u32 j = ANIM_TEST_START_MOVE, move = 0, species = 0;
    u32 k = 0, variation = 0, variationsNumber;
    u32 friendship = 0, tempFriendship;
    u32 tempMove, tempSpecies;
    FORCE_MOVE_ANIM(TRUE);
    struct BattlePokemon *attacker = playerRight;
    struct BattlePokemon *target = opponentRight;
    struct BattlePokemon *ignore1 = playerLeft;
    struct BattlePokemon *ignore2 = opponentLeft;
    for (; j <= ANIM_TEST_END_MOVE; j++) {
        variationsNumber = GetVariationsNumber(j, TRUE);
        for (k = 0; k < variationsNumber; k++) {
            ParametrizeMovesAndSpecies(j, &tempMove, &tempSpecies, k);
            tempFriendship = ParametrizeFriendship(j, k);
            PARAMETRIZE { move = tempMove; species = tempSpecies; variation = k; friendship = tempFriendship;}
        }
    }
    GIVEN {
        PLAYER(species) {
            Level(GetParametrizedLevel(move, variation));
            HP(GetParametrizedHP(move, variation)); MaxHP(9999); Item(GetParametrizedItem(move, variation));
            if (attacker == playerLeft) {
                if (species == SPECIES_WOBBUFFET) Gender(MON_FEMALE);
                if (gMovesInfo[move].effect == EFFECT_LAST_RESORT) Moves(move, MOVE_POUND);
                if (species == SPECIES_KLINKLANG) Ability(ABILITY_PLUS);
                if (friendship) Friendship(friendship);
                if (GetParametrizedShinyness(move, variation)) Shiny(TRUE);
            }
        }
        PLAYER(species) {
            Level(GetParametrizedLevel(move, variation));
            HP(GetParametrizedHP(move, variation)); MaxHP(9999); Item(GetParametrizedItem(move, variation));
            if (attacker == playerRight) {
                if (species == SPECIES_WOBBUFFET) Gender(MON_FEMALE);
                if (gMovesInfo[move].effect == EFFECT_LAST_RESORT) Moves(move, MOVE_POUND);
                if (species == SPECIES_KLINKLANG) Ability(ABILITY_PLUS);
                if (friendship) Friendship(friendship);
                if (GetParametrizedShinyness(move, variation)) Shiny(TRUE);
            }
        }
        PLAYER(SPECIES_WOBBUFFET) {
            Gender(MON_MALE); MaxHP(9999); Moves(MOVE_POUND, MOVE_CELEBRATE);
            HP(gMovesInfo[move].effect == EFFECT_REVIVAL_BLESSING ? 0 : 9998);
        }
        OPPONENT(SPECIES_WOBBUFFET) {
            Gender(MON_MALE); HP(9998); MaxHP(9999); SpDefense(9999); Defense(9999); Ability(ABILITY_TELEPATHY);
            if (gMovesInfo[move].effect != EFFECT_BESTOW) {
                Item(ITEM_ORAN_BERRY);
            }
        }
        OPPONENT(SPECIES_WOBBUFFET) {
            Gender(MON_MALE); HP(9998); MaxHP(9999); SpDefense(9999); Defense(9999); Ability(ABILITY_TELEPATHY);
            if (gMovesInfo[move].effect != EFFECT_BESTOW) {
                Item(ITEM_ORAN_BERRY);
            }
        }
        OPPONENT(SPECIES_WOBBUFFET) { Gender(MON_FEMALE); HP(9998); MaxHP(9999); SpDefense(9999); Defense(9999); }
    } WHEN {
        DoublesWhen(move, attacker, target, ignore1, ignore2, variation);
    } SCENE {
        DoublesScene(move, attacker);
    } THEN {
        FORCE_MOVE_ANIM(FALSE);
        if (gLoadFail)
            DebugPrintf("Move failed: %S (%u)", gMovesInfo[move].name, move);
        EXPECT_EQ(gLoadFail, FALSE);
    }
}

DOUBLE_BATTLE_TEST("Move Animations don't leak when used - Doubles (opponentRight to playerRight)")
{
    u32 j = ANIM_TEST_START_MOVE, move = 0, species = 0;
    u32 k = 0, variation = 0, variationsNumber;
    u32 friendship = 0, tempFriendship;
    u32 tempMove, tempSpecies;
    FORCE_MOVE_ANIM(TRUE);
    struct BattlePokemon *attacker = opponentRight;
    struct BattlePokemon *target = playerRight;
    struct BattlePokemon *ignore1 = playerLeft;
    struct BattlePokemon *ignore2 = opponentLeft;
    for (; j <= ANIM_TEST_END_MOVE; j++) {
        variationsNumber = GetVariationsNumber(j, TRUE);
        for (k = 0; k < variationsNumber; k++) {
            ParametrizeMovesAndSpecies(j, &tempMove, &tempSpecies, k);
            tempFriendship = ParametrizeFriendship(j, k);
            PARAMETRIZE { move = tempMove; species = tempSpecies; variation = k; friendship = tempFriendship;}
        }
    }
    GIVEN {
        OPPONENT(species) {
            Level(GetParametrizedLevel(move, variation));
            HP(GetParametrizedHP(move, variation)); MaxHP(9999); Item(GetParametrizedItem(move, variation));
            if (attacker == opponentLeft) {
                if (species == SPECIES_WOBBUFFET) Gender(MON_FEMALE);
                if (gMovesInfo[move].effect == EFFECT_LAST_RESORT) Moves(move, MOVE_POUND);
                if (species == SPECIES_KLINKLANG) Ability(ABILITY_PLUS);
                if (friendship) Friendship(friendship);
                if (GetParametrizedShinyness(move, variation)) Shiny(TRUE);
            }
        }
        OPPONENT(species) {
            Level(GetParametrizedLevel(move, variation));
            HP(GetParametrizedHP(move, variation)); MaxHP(9999); Item(GetParametrizedItem(move, variation));
            if (attacker == opponentRight) {
                if (species == SPECIES_WOBBUFFET) Gender(MON_FEMALE);
                if (gMovesInfo[move].effect == EFFECT_LAST_RESORT) Moves(move, MOVE_POUND);
                if (species == SPECIES_KLINKLANG) Ability(ABILITY_PLUS);
                if (friendship) Friendship(friendship);
                if (GetParametrizedShinyness(move, variation)) Shiny(TRUE);
            }
        }
        OPPONENT(SPECIES_WOBBUFFET) {
            Gender(MON_MALE); MaxHP(9999); Moves(MOVE_POUND, MOVE_CELEBRATE);
            HP(gMovesInfo[move].effect == EFFECT_REVIVAL_BLESSING ? 0 : 9998);
        }
        PLAYER(SPECIES_WOBBUFFET) {
            Gender(MON_MALE); HP(9998); MaxHP(9999); SpDefense(9999); Defense(9999); Ability(ABILITY_TELEPATHY);
            if (gMovesInfo[move].effect != EFFECT_BESTOW) {
                Item(ITEM_ORAN_BERRY);
            }
        }
        PLAYER(SPECIES_WOBBUFFET) {
            Gender(MON_MALE); HP(9998); MaxHP(9999); SpDefense(9999); Defense(9999); Ability(ABILITY_TELEPATHY);
            if (gMovesInfo[move].effect != EFFECT_BESTOW) {
                Item(ITEM_ORAN_BERRY);
            }
        }
        PLAYER(SPECIES_WOBBUFFET) { Gender(MON_FEMALE); HP(9998); MaxHP(9999); SpDefense(9999); Defense(9999); }
    } WHEN {
        DoublesWhen(move, attacker, target, ignore1, ignore2, variation);
    } SCENE {
        DoublesScene(move, attacker);
    } THEN {
        FORCE_MOVE_ANIM(FALSE);
        if (gLoadFail)
            DebugPrintf("Move failed: %S (%u)", gMovesInfo[move].name, move);
        EXPECT_EQ(gLoadFail, FALSE);
    }
}

/*
DOUBLE_BATTLE_TEST("Move Animations don't leak when used - Doubles (playerLeft to playerRight)")
{
    u32 j = ANIM_TEST_START_MOVE, move = 0, species = 0;
    u32 tempMove, tempSpecies;
    FORCE_MOVE_ANIM(TRUE);
    struct BattlePokemon *attacker = playerLeft;
    struct BattlePokemon *target = playerRight;
    struct BattlePokemon *ignore1 = opponentRight;
    struct BattlePokemon *ignore2 = opponentLeft;
    for (; j <= ANIM_TEST_END_MOVE; j++) {
        ParametrizeMovesAndSpecies(j, &tempMove, &tempSpecies, 0);
        PARAMETRIZE { move = tempMove; species = tempSpecies; }
    }
    GIVEN {
        OPPONENT(species) {
            HP(9997); MaxHP(9999); Item(ITEM_ORAN_BERRY);
            if (attacker == opponentLeft) {
                if (species == SPECIES_WOBBUFFET) Gender(MON_FEMALE);
                if (gMovesInfo[move].effect == EFFECT_LAST_RESORT) Moves(move, MOVE_POUND);
                if (species == SPECIES_KLINKLANG) Ability(ABILITY_PLUS);
            }
        }
        OPPONENT(species) {
            HP(9997); MaxHP(9999); Item(ITEM_ORAN_BERRY);
            if (attacker == opponentRight) {
                if (species == SPECIES_WOBBUFFET) Gender(MON_FEMALE);
                if (gMovesInfo[move].effect == EFFECT_LAST_RESORT) Moves(move, MOVE_POUND);
                if (species == SPECIES_KLINKLANG) Ability(ABILITY_PLUS);
            }
        }
        OPPONENT(SPECIES_WOBBUFFET) {
            Gender(MON_MALE); MaxHP(9999); Moves(MOVE_POUND, MOVE_CELEBRATE);
            HP(gMovesInfo[move].effect == EFFECT_REVIVAL_BLESSING ? 0 : 9998);
        }
        PLAYER(SPECIES_WOBBUFFET) {
            Gender(MON_MALE); HP(9998); MaxHP(9999); SpDefense(9999); Defense(9999); Ability(ABILITY_TELEPATHY);
            if (gMovesInfo[move].effect != EFFECT_BESTOW) {
                Item(ITEM_ORAN_BERRY);
            }
        }
        PLAYER(SPECIES_WOBBUFFET) {
            Gender(MON_MALE); HP(9998); MaxHP(9999); SpDefense(9999); Defense(9999); Ability(ABILITY_TELEPATHY);
            if (gMovesInfo[move].effect != EFFECT_BESTOW) {
                Item(ITEM_ORAN_BERRY);
            }
        }
        PLAYER(SPECIES_WOBBUFFET) { Gender(MON_FEMALE); HP(9998); MaxHP(9999); SpDefense(9999); Defense(9999); }
    } WHEN {
        DoublesWhen(move, attacker, target, ignore1, ignore2);
    } SCENE {
        SameSideTargeting(move, attacker);
    } THEN {
        FORCE_MOVE_ANIM(FALSE);
        if (gLoadFail)
            DebugPrintf("Move failed: %S (%u)", gMovesInfo[move].name, move);
        EXPECT_EQ(gLoadFail, FALSE);
    }
}

DOUBLE_BATTLE_TEST("Move Animations don't leak when used - Doubles (playerRight to playerLeft)")
{
    u32 j = ANIM_TEST_START_MOVE, move = 0, species = 0;
    u32 tempMove, tempSpecies;
    FORCE_MOVE_ANIM(TRUE);
    struct BattlePokemon *attacker = playerRight;
    struct BattlePokemon *target = playerLeft;
    struct BattlePokemon *ignore1 = opponentRight;
    struct BattlePokemon *ignore2 = opponentLeft;
    for (; j <= ANIM_TEST_END_MOVE; j++) {
        ParametrizeMovesAndSpecies(j, &tempMove, &tempSpecies, 0);
        PARAMETRIZE { move = tempMove; species = tempSpecies; }
    }
    GIVEN {
        OPPONENT(species) {
            HP(9997); MaxHP(9999); Item(ITEM_ORAN_BERRY);
            if (attacker == opponentLeft) {
                if (species == SPECIES_WOBBUFFET) Gender(MON_FEMALE);
                if (gMovesInfo[move].effect == EFFECT_LAST_RESORT) Moves(move, MOVE_POUND);
                if (species == SPECIES_KLINKLANG) Ability(ABILITY_PLUS);
            }
        }
        OPPONENT(species) {
            HP(9997); MaxHP(9999); Item(ITEM_ORAN_BERRY);
            if (attacker == opponentRight) {
                if (species == SPECIES_WOBBUFFET) Gender(MON_FEMALE);
                if (gMovesInfo[move].effect == EFFECT_LAST_RESORT) Moves(move, MOVE_POUND);
                if (species == SPECIES_KLINKLANG) Ability(ABILITY_PLUS);
            }
        }
        OPPONENT(SPECIES_WOBBUFFET) {
            Gender(MON_MALE); MaxHP(9999); Moves(MOVE_POUND, MOVE_CELEBRATE);
            HP(gMovesInfo[move].effect == EFFECT_REVIVAL_BLESSING ? 0 : 9998);
        }
        PLAYER(SPECIES_WOBBUFFET) {
            Gender(MON_MALE); HP(9998); MaxHP(9999); SpDefense(9999); Defense(9999); Ability(ABILITY_TELEPATHY);
            if (gMovesInfo[move].effect != EFFECT_BESTOW) {
                Item(ITEM_ORAN_BERRY);
            }
        }
        PLAYER(SPECIES_WOBBUFFET) {
            Gender(MON_MALE); HP(9998); MaxHP(9999); SpDefense(9999); Defense(9999); Ability(ABILITY_TELEPATHY);
            if (gMovesInfo[move].effect != EFFECT_BESTOW) {
                Item(ITEM_ORAN_BERRY);
            }
        }
        PLAYER(SPECIES_WOBBUFFET) { Gender(MON_FEMALE); HP(9998); MaxHP(9999); SpDefense(9999); Defense(9999); }
    } WHEN {
        DoublesWhen(move, attacker, target, ignore1, ignore2);
    } SCENE {
        SameSideTargeting(move, attacker);
    } THEN {
        FORCE_MOVE_ANIM(FALSE);
        if (gLoadFail)
            DebugPrintf("Move failed: %S (%u)", gMovesInfo[move].name, move);
        EXPECT_EQ(gLoadFail, FALSE);
    }
}

DOUBLE_BATTLE_TEST("Move Animations don't leak when used - Doubles (opponentleft to opponentRight)")
{
    u32 j = ANIM_TEST_START_MOVE, move = 0, species = 0;
    u32 tempMove, tempSpecies;
    FORCE_MOVE_ANIM(TRUE);
    struct BattlePokemon *attacker = opponentLeft;
    struct BattlePokemon *target = opponentRight;
    struct BattlePokemon *ignore1 = playerLeft;
    struct BattlePokemon *ignore2 = playerRight;
    for (; j <= ANIM_TEST_END_MOVE; j++) {
        ParametrizeMovesAndSpecies(j, &tempMove, &tempSpecies, 0);
        PARAMETRIZE { move = tempMove; species = tempSpecies; }
    }
    GIVEN {
        OPPONENT(species) {
            HP(9997); MaxHP(9999); Item(ITEM_ORAN_BERRY);
            if (attacker == opponentLeft) {
                if (species == SPECIES_WOBBUFFET) Gender(MON_FEMALE);
                if (gMovesInfo[move].effect == EFFECT_LAST_RESORT) Moves(move, MOVE_POUND);
                if (species == SPECIES_KLINKLANG) Ability(ABILITY_PLUS);
            }
        }
        OPPONENT(species) {
            HP(9997); MaxHP(9999); Item(ITEM_ORAN_BERRY);
            if (attacker == opponentRight) {
                if (species == SPECIES_WOBBUFFET) Gender(MON_FEMALE);
                if (gMovesInfo[move].effect == EFFECT_LAST_RESORT) Moves(move, MOVE_POUND);
                if (species == SPECIES_KLINKLANG) Ability(ABILITY_PLUS);
            }
        }
        OPPONENT(SPECIES_WOBBUFFET) {
            Gender(MON_MALE); MaxHP(9999); Moves(MOVE_POUND, MOVE_CELEBRATE);
            HP(gMovesInfo[move].effect == EFFECT_REVIVAL_BLESSING ? 0 : 9998);
        }
        PLAYER(SPECIES_WOBBUFFET) {
            Gender(MON_MALE); HP(9998); MaxHP(9999); SpDefense(9999); Defense(9999); Ability(ABILITY_TELEPATHY);
            if (gMovesInfo[move].effect != EFFECT_BESTOW) {
                Item(ITEM_ORAN_BERRY);
            }
        }
        PLAYER(SPECIES_WOBBUFFET) {
            Gender(MON_MALE); HP(9998); MaxHP(9999); SpDefense(9999); Defense(9999); Ability(ABILITY_TELEPATHY);
            if (gMovesInfo[move].effect != EFFECT_BESTOW) {
                Item(ITEM_ORAN_BERRY);
            }
        }
        PLAYER(SPECIES_WOBBUFFET) { Gender(MON_FEMALE); HP(9998); MaxHP(9999); SpDefense(9999); Defense(9999); }
    } WHEN {
        DoublesWhen(move, attacker, target, ignore1, ignore2);
    } SCENE {
        SameSideTargeting(move, attacker);
    } THEN {
        FORCE_MOVE_ANIM(FALSE);
        if (gLoadFail)
            DebugPrintf("Move failed: %S (%u)", gMovesInfo[move].name, move);
        EXPECT_EQ(gLoadFail, FALSE);
    }
}

DOUBLE_BATTLE_TEST("Move Animations don't leak when used - Doubles (opponentRight to opponentLeft)")
{
    u32 j = ANIM_TEST_START_MOVE, move = 0, species = 0;
    u32 tempMove, tempSpecies;
    FORCE_MOVE_ANIM(TRUE);
    struct BattlePokemon *attacker = opponentRight;
    struct BattlePokemon *target = opponentLeft;
    struct BattlePokemon *ignore1 = playerLeft;
    struct BattlePokemon *ignore2 = playerRight;
    for (; j <= ANIM_TEST_END_MOVE; j++) {
        ParametrizeMovesAndSpecies(j, &tempMove, &tempSpecies, 0);
        PARAMETRIZE { move = tempMove; species = tempSpecies; }
    }
    GIVEN {
        OPPONENT(species) {
            HP(9997); MaxHP(9999); Item(ITEM_ORAN_BERRY);
            if (attacker == opponentLeft) {
                if (species == SPECIES_WOBBUFFET) Gender(MON_FEMALE);
                if (gMovesInfo[move].effect == EFFECT_LAST_RESORT) Moves(move, MOVE_POUND);
                if (species == SPECIES_KLINKLANG) Ability(ABILITY_PLUS);
            }
        }
        OPPONENT(species) {
            HP(9997); MaxHP(9999); Item(ITEM_ORAN_BERRY);
            if (attacker == opponentRight) {
                if (species == SPECIES_WOBBUFFET) Gender(MON_FEMALE);
                if (gMovesInfo[move].effect == EFFECT_LAST_RESORT) Moves(move, MOVE_POUND);
                if (species == SPECIES_KLINKLANG) Ability(ABILITY_PLUS);
            }
        }
        OPPONENT(SPECIES_WOBBUFFET) {
            Gender(MON_MALE); MaxHP(9999); Moves(MOVE_POUND, MOVE_CELEBRATE);
            HP(gMovesInfo[move].effect == EFFECT_REVIVAL_BLESSING ? 0 : 9998);
        }
        PLAYER(SPECIES_WOBBUFFET) {
            Gender(MON_MALE); HP(9998); MaxHP(9999); SpDefense(9999); Defense(9999); Ability(ABILITY_TELEPATHY);
            if (gMovesInfo[move].effect != EFFECT_BESTOW) {
                Item(ITEM_ORAN_BERRY);
            }
        }
        PLAYER(SPECIES_WOBBUFFET) {
            Gender(MON_MALE); HP(9998); MaxHP(9999); SpDefense(9999); Defense(9999); Ability(ABILITY_TELEPATHY);
            if (gMovesInfo[move].effect != EFFECT_BESTOW) {
                Item(ITEM_ORAN_BERRY);
            }
        }
        PLAYER(SPECIES_WOBBUFFET) { Gender(MON_FEMALE); HP(9998); MaxHP(9999); SpDefense(9999); Defense(9999); }
    } WHEN {
        DoublesWhen(move, attacker, target, ignore1, ignore2);
    } SCENE {
        SameSideTargeting(move, attacker);
    } THEN {
        FORCE_MOVE_ANIM(FALSE);
        if (gLoadFail)
            DebugPrintf("Move failed: %S (%u)", gMovesInfo[move].name, move);
        EXPECT_EQ(gLoadFail, FALSE);
    }
}
*/

SINGLE_BATTLE_TEST("Move Animations occur before their stat change animations - Singles (player to opponent)")
{
    u32 j = ANIM_TEST_START_MOVE, move = 0, species = 0;
    u32 k = 0, variation = 0, variationsNumber;
    u32 friendship = 0, tempFriendship;
    u32 tempMove, tempSpecies;
    FORCE_MOVE_ANIM(TRUE);
    for (; j <= ANIM_TEST_END_MOVE; j++) {
        variationsNumber = GetVariationsNumber(j, FALSE);
        for (k = 0; k < variationsNumber; k++) {
            ParametrizeMovesAndSpecies(j, &tempMove, &tempSpecies, k);
            tempFriendship = ParametrizeFriendship(j, k);
            PARAMETRIZE { move = tempMove; species = tempSpecies; variation = k; friendship = tempFriendship;}
        }
    }
    GIVEN {
        PLAYER(species) {
            Level(GetParametrizedLevel(move, variation));
            HP(GetParametrizedHP(move, variation)); MaxHP(9999); Item(GetParametrizedItem(move, variation));
            if (species == SPECIES_WOBBUFFET) Gender(MON_FEMALE);
            if (gMovesInfo[move].effect == EFFECT_LAST_RESORT) Moves(move, MOVE_POUND);
            if (species == SPECIES_KLINKLANG) Ability(ABILITY_PLUS);
            if (friendship) Friendship(friendship);
            if (GetParametrizedShinyness(move, variation)) Shiny(TRUE);
        }
        PLAYER(SPECIES_WOBBUFFET)   {
            Gender(MON_MALE); MaxHP(9999); Moves(MOVE_POUND);
            HP(gMovesInfo[move].effect == EFFECT_REVIVAL_BLESSING ? 0 : 9998);
        }
        OPPONENT(SPECIES_WOBBUFFET) {
            Gender(MON_MALE); HP(9998); MaxHP(9999); SpDefense(9999); Defense(9999); Ability(ABILITY_TELEPATHY);
            if (gMovesInfo[move].effect != EFFECT_BESTOW)
                Item(ITEM_ORAN_BERRY);
        }
        OPPONENT(SPECIES_WOBBUFFET) { Gender(MON_FEMALE); HP(9998); MaxHP(9999); SpDefense(9999); Defense(9999); }
    } WHEN {
        WhenSingles(move, player, opponent, variation);
    } SCENE {
        if (!(gMovesInfo[move].effect == EFFECT_RECYCLE
          || gMovesInfo[move].effect == EFFECT_BELCH
          || gMovesInfo[move].effect == EFFECT_SPIT_UP
          || gMovesInfo[move].effect == EFFECT_SWALLOW
          || gMovesInfo[move].effect == EFFECT_TOPSY_TURVY)) // require a move that boosts stats before using this move
        {
            NONE_OF {
                ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_STATS_CHANGE, opponent);
                ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_STATS_CHANGE, player);
            }
        }
        SceneSingles(move, player);
    } THEN {
        FORCE_MOVE_ANIM(FALSE);
        if (gLoadFail)
            DebugPrintf("Move failed: %S (%u)", gMovesInfo[move].name, move);
        EXPECT_EQ(gLoadFail, FALSE);
    }
}

//  Z-Moves
#define Z_MOVE_PARAMETERS PARAMETRIZE { zmove = MOVE_BREAKNECK_BLITZ; species = SPECIES_WOBBUFFET; move = MOVE_TACKLE; item = ITEM_NORMALIUM_Z; } \
    PARAMETRIZE { zmove = MOVE_INFERNO_OVERDRIVE; species = SPECIES_WOBBUFFET; move = MOVE_EMBER; item = ITEM_FIRIUM_Z; } \
    PARAMETRIZE { zmove = MOVE_HYDRO_VORTEX; species = SPECIES_WOBBUFFET; move = MOVE_BUBBLE; item = ITEM_WATERIUM_Z; } \
    PARAMETRIZE { zmove = MOVE_GIGAVOLT_HAVOC; species = SPECIES_WOBBUFFET; move = MOVE_THUNDERBOLT; item = ITEM_ELECTRIUM_Z; } \
    PARAMETRIZE { zmove = MOVE_BLOOM_DOOM; species = SPECIES_WOBBUFFET; move = MOVE_RAZOR_LEAF; item = ITEM_GRASSIUM_Z; } \
    PARAMETRIZE { zmove = MOVE_SUBZERO_SLAMMER; species = SPECIES_WOBBUFFET; move = MOVE_ICE_BEAM; item = ITEM_ICIUM_Z; } \
    PARAMETRIZE { zmove = MOVE_ALL_OUT_PUMMELING; species = SPECIES_WOBBUFFET; move = MOVE_KARATE_CHOP; item = ITEM_FIGHTINIUM_Z; } \
    PARAMETRIZE { zmove = MOVE_ACID_DOWNPOUR; species = SPECIES_WOBBUFFET; move = MOVE_SLUDGE_BOMB; item = ITEM_POISONIUM_Z; } \
    PARAMETRIZE { zmove = MOVE_TECTONIC_RAGE; species = SPECIES_WOBBUFFET; move = MOVE_MUD_SLAP; item = ITEM_GROUNDIUM_Z; } \
    PARAMETRIZE { zmove = MOVE_SUPERSONIC_SKYSTRIKE; species = SPECIES_WOBBUFFET; move = MOVE_AERIAL_ACE; item = ITEM_FLYINIUM_Z; } \
    PARAMETRIZE { zmove = MOVE_SHATTERED_PSYCHE; species = SPECIES_WOBBUFFET; move = MOVE_CONFUSION; item = ITEM_PSYCHIUM_Z; } \
    PARAMETRIZE { zmove = MOVE_SAVAGE_SPIN_OUT; species = SPECIES_WOBBUFFET; move = MOVE_BUG_BUZZ; item = ITEM_BUGINIUM_Z; } \
    PARAMETRIZE { zmove = MOVE_CONTINENTAL_CRUSH; species = SPECIES_WOBBUFFET; move = MOVE_ROCK_SLIDE; item = ITEM_ROCKIUM_Z; } \
    PARAMETRIZE { zmove = MOVE_NEVER_ENDING_NIGHTMARE; species = SPECIES_WOBBUFFET; move = MOVE_SHADOW_BALL; item = ITEM_GHOSTIUM_Z; } \
    PARAMETRIZE { zmove = MOVE_DEVASTATING_DRAKE; species = SPECIES_WOBBUFFET; move = MOVE_DRAGON_PULSE; item = ITEM_DRAGONIUM_Z; } \
    PARAMETRIZE { zmove = MOVE_BLACK_HOLE_ECLIPSE; species = SPECIES_WOBBUFFET; move = MOVE_BITE; item = ITEM_DARKINIUM_Z; } \
    PARAMETRIZE { zmove = MOVE_CORKSCREW_CRASH; species = SPECIES_WOBBUFFET; move = MOVE_METAL_CLAW; item = ITEM_STEELIUM_Z; } \
    PARAMETRIZE { zmove = MOVE_TWINKLE_TACKLE; species = SPECIES_WOBBUFFET; move = MOVE_MOONBLAST; item = ITEM_FAIRIUM_Z; } \
    PARAMETRIZE { zmove = MOVE_CATASTROPIKA; species = SPECIES_PIKACHU; move = MOVE_VOLT_TACKLE; item = ITEM_PIKANIUM_Z; } \
    PARAMETRIZE { zmove = MOVE_EXTREME_EVOBOOST; species = SPECIES_EEVEE; move = MOVE_LAST_RESORT; item = ITEM_EEVIUM_Z; } \
    PARAMETRIZE { zmove = MOVE_PULVERIZING_PANCAKE; species = SPECIES_SNORLAX; move = MOVE_GIGA_IMPACT; item = ITEM_SNORLIUM_Z; } \
    PARAMETRIZE { zmove = MOVE_GENESIS_SUPERNOVA; species = SPECIES_MEW; move = MOVE_PSYCHIC; item = ITEM_MEWNIUM_Z; } \
    PARAMETRIZE { zmove = MOVE_SINISTER_ARROW_RAID; species = SPECIES_DECIDUEYE; move = MOVE_SPIRIT_SHACKLE; item = ITEM_DECIDIUM_Z; } \
    PARAMETRIZE { zmove = MOVE_MALICIOUS_MOONSAULT; species = SPECIES_INCINEROAR; move = MOVE_DARKEST_LARIAT; item = ITEM_INCINIUM_Z; } \
    PARAMETRIZE { zmove = MOVE_OCEANIC_OPERETTA; species = SPECIES_PRIMARINA; move = MOVE_SPARKLING_ARIA; item = ITEM_PRIMARIUM_Z; } \
    PARAMETRIZE { zmove = MOVE_SPLINTERED_STORMSHARDS; species = SPECIES_LYCANROC_MIDNIGHT; move = MOVE_STONE_EDGE; item = ITEM_LYCANIUM_Z; } \
    PARAMETRIZE { zmove = MOVE_SPLINTERED_STORMSHARDS; species = SPECIES_LYCANROC_MIDDAY; move = MOVE_STONE_EDGE; item = ITEM_LYCANIUM_Z; } \
    PARAMETRIZE { zmove = MOVE_SPLINTERED_STORMSHARDS; species = SPECIES_LYCANROC_DUSK; move = MOVE_STONE_EDGE; item = ITEM_LYCANIUM_Z; } \
    PARAMETRIZE { zmove = MOVE_LETS_SNUGGLE_FOREVER; species = SPECIES_MIMIKYU; move = MOVE_PLAY_ROUGH; item = ITEM_MIMIKIUM_Z; } \
    PARAMETRIZE { zmove = MOVE_CLANGOROUS_SOULBLAZE; species = SPECIES_KOMMO_O; move = MOVE_CLANGING_SCALES; item = ITEM_KOMMONIUM_Z; } \
    PARAMETRIZE { zmove = MOVE_GUARDIAN_OF_ALOLA; species = SPECIES_TAPU_KOKO; move = MOVE_NATURES_MADNESS; item = ITEM_TAPUNIUM_Z; } \
    PARAMETRIZE { zmove = MOVE_SEARING_SUNRAZE_SMASH; species = SPECIES_SOLGALEO; move = MOVE_SUNSTEEL_STRIKE; item = ITEM_SOLGANIUM_Z; } \
    PARAMETRIZE { zmove = MOVE_MENACING_MOONRAZE_MAELSTROM; species = SPECIES_LUNALA; move = MOVE_MOONGEIST_BEAM; item = ITEM_LUNALIUM_Z; } \
    PARAMETRIZE { zmove = MOVE_SOUL_STEALING_7_STAR_STRIKE; species = SPECIES_MARSHADOW; move = MOVE_SPECTRAL_THIEF; item = ITEM_MARSHADIUM_Z; } \
    PARAMETRIZE { zmove = MOVE_STOKED_SPARKSURFER; species = SPECIES_RAICHU_ALOLA; move = MOVE_THUNDERBOLT; item = ITEM_ALORAICHIUM_Z; } \
    PARAMETRIZE { zmove = MOVE_10_000_000_VOLT_THUNDERBOLT; species = SPECIES_PIKACHU_ALOLA; move = MOVE_THUNDERBOLT; item = ITEM_PIKASHUNIUM_Z; } \
    PARAMETRIZE { zmove = MOVE_LIGHT_THAT_BURNS_THE_SKY; species = SPECIES_NECROZMA_DAWN_WINGS; move = MOVE_PHOTON_GEYSER; item = ITEM_ULTRANECROZIUM_Z; }

SINGLE_BATTLE_TEST("Z-Moves don't leak when used - Singles (player to opponent)")
{
    FORCE_MOVE_ANIM(TRUE);
    u32 species, move, item, zmove;
    Z_MOVE_PARAMETERS;
    GIVEN {
        PLAYER(species) { Item(item); }
        OPPONENT(SPECIES_WOBBUFFET) { Item(ITEM_FOCUS_SASH); }
    } WHEN {
        if (species == SPECIES_NECROZMA_DAWN_WINGS)
        {
            TURN { MOVE(player, MOVE_CELEBRATE, gimmick: GIMMICK_ULTRA_BURST); }
            TURN { MOVE(player, move, gimmick: GIMMICK_Z_MOVE); }
        }
        else
        {
            TURN { MOVE(player, move, gimmick: GIMMICK_Z_MOVE); }
        }
    } SCENE {
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_ZMOVE_ACTIVATE, player);
        ANIMATION(ANIM_TYPE_MOVE, zmove, player);
    } THEN {
        FORCE_MOVE_ANIM(FALSE);
        if (gLoadFail)
            DebugPrintf("Move failed: %S (%u)", gMovesInfo[move].name, move);
        EXPECT_EQ(gLoadFail, FALSE);
    }
}

SINGLE_BATTLE_TEST("Z-Moves don't leak when used - Singles (opponent to player)")
{
    FORCE_MOVE_ANIM(TRUE);
    u32 species, move, item, zmove;
    Z_MOVE_PARAMETERS;
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET) { Item(ITEM_FOCUS_SASH); }
        OPPONENT(species) { Item(item); }
    } WHEN {
        if (species == SPECIES_NECROZMA_DAWN_WINGS)
        {
            TURN { MOVE(opponent, MOVE_CELEBRATE, gimmick: GIMMICK_ULTRA_BURST); }
            TURN { MOVE(opponent, move, gimmick: GIMMICK_Z_MOVE); }
        }
        else
        {
            TURN { MOVE(opponent, move, gimmick: GIMMICK_Z_MOVE); }
        }
    } SCENE {
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_ZMOVE_ACTIVATE, opponent);
        ANIMATION(ANIM_TYPE_MOVE, zmove, opponent);
    } THEN {
        FORCE_MOVE_ANIM(FALSE);
        if (gLoadFail)
            DebugPrintf("Move failed: %S (%u)", gMovesInfo[move].name, move);
        EXPECT_EQ(gLoadFail, FALSE);
    }
}

DOUBLE_BATTLE_TEST("Z-Moves don't leak when used - Doubles (playerLeft to opponentLeft)")
{
    FORCE_MOVE_ANIM(TRUE);
    u32 species, move, item, zmove;
    Z_MOVE_PARAMETERS;
    GIVEN {
        PLAYER(species) { Item(item); }
        PLAYER(SPECIES_WYNAUT);
        OPPONENT(SPECIES_WOBBUFFET) { Item(ITEM_FOCUS_SASH); }
        OPPONENT(SPECIES_WYNAUT) { Item(ITEM_FOCUS_SASH); }
    } WHEN {
        if (species == SPECIES_NECROZMA_DAWN_WINGS)
        {
            TURN { MOVE(playerLeft, MOVE_CELEBRATE, gimmick: GIMMICK_ULTRA_BURST); }
            TURN { MOVE(playerLeft, move, gimmick: GIMMICK_Z_MOVE, target: opponentLeft); }
        }
        else
        {
            TURN { MOVE(playerLeft, move, gimmick: GIMMICK_Z_MOVE, target: opponentLeft); }
        }
    } SCENE {
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_ZMOVE_ACTIVATE, playerLeft);
        ANIMATION(ANIM_TYPE_MOVE, zmove, playerLeft);
    } THEN {
        FORCE_MOVE_ANIM(FALSE);
        if (gLoadFail)
            DebugPrintf("Move failed: %S (%u)", gMovesInfo[move].name, move);
        EXPECT_EQ(gLoadFail, FALSE);
    }
}

DOUBLE_BATTLE_TEST("Z-Moves don't leak when used - Doubles (playerLeft to opponentRight)")
{
    FORCE_MOVE_ANIM(TRUE);
    u32 species, move, item, zmove;
    Z_MOVE_PARAMETERS;
    GIVEN {
        PLAYER(species) { Item(item); }
        PLAYER(SPECIES_WYNAUT);
        OPPONENT(SPECIES_WOBBUFFET) { Item(ITEM_FOCUS_SASH); }
        OPPONENT(SPECIES_WYNAUT) { Item(ITEM_FOCUS_SASH); }
    } WHEN {
        if (species == SPECIES_NECROZMA_DAWN_WINGS)
        {
            TURN { MOVE(playerLeft, MOVE_CELEBRATE, gimmick: GIMMICK_ULTRA_BURST); }
            TURN { MOVE(playerLeft, move, gimmick: GIMMICK_Z_MOVE, target: opponentRight); }
        }
        else
        {
            TURN { MOVE(playerLeft, move, gimmick: GIMMICK_Z_MOVE, target: opponentRight); }
        }
    } SCENE {
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_ZMOVE_ACTIVATE, playerLeft);
        ANIMATION(ANIM_TYPE_MOVE, zmove, playerLeft);
    } THEN {
        FORCE_MOVE_ANIM(FALSE);
        if (gLoadFail)
            DebugPrintf("Move failed: %S (%u)", gMovesInfo[move].name, move);
        EXPECT_EQ(gLoadFail, FALSE);
    }
}

DOUBLE_BATTLE_TEST("Z-Moves don't leak when used - Doubles (playerRight to opponentLeft)")
{
    FORCE_MOVE_ANIM(TRUE);
    u32 species, move, item, zmove;
    Z_MOVE_PARAMETERS;
    GIVEN {
        PLAYER(SPECIES_WYNAUT);
        PLAYER(species) { Item(item); }
        OPPONENT(SPECIES_WOBBUFFET) { Item(ITEM_FOCUS_SASH); }
        OPPONENT(SPECIES_WYNAUT) { Item(ITEM_FOCUS_SASH); }
    } WHEN {
        if (species == SPECIES_NECROZMA_DAWN_WINGS)
        {
            TURN { MOVE(playerRight, MOVE_CELEBRATE, gimmick: GIMMICK_ULTRA_BURST); }
            TURN { MOVE(playerRight, move, gimmick: GIMMICK_Z_MOVE, target: opponentLeft); }
        }
        else
        {
            TURN { MOVE(playerRight, move, gimmick: GIMMICK_Z_MOVE, target: opponentLeft); }
        }
    } SCENE {
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_ZMOVE_ACTIVATE, playerRight);
        ANIMATION(ANIM_TYPE_MOVE, zmove, playerRight);
    } THEN {
        FORCE_MOVE_ANIM(FALSE);
        if (gLoadFail)
            DebugPrintf("Move failed: %S (%u)", gMovesInfo[move].name, move);
        EXPECT_EQ(gLoadFail, FALSE);
    }
}

DOUBLE_BATTLE_TEST("Z-Moves don't leak when used - Doubles (playerRight to opponentRight)")
{
    FORCE_MOVE_ANIM(TRUE);
    u32 species, move, item, zmove;
    Z_MOVE_PARAMETERS;
    GIVEN {
        PLAYER(SPECIES_WYNAUT);
        PLAYER(species) { Item(item); }
        OPPONENT(SPECIES_WOBBUFFET) { Item(ITEM_FOCUS_SASH); }
        OPPONENT(SPECIES_WYNAUT) { Item(ITEM_FOCUS_SASH); }
    } WHEN {
        if (species == SPECIES_NECROZMA_DAWN_WINGS)
        {
            TURN { MOVE(playerRight, MOVE_CELEBRATE, gimmick: GIMMICK_ULTRA_BURST); }
            TURN { MOVE(playerRight, move, gimmick: GIMMICK_Z_MOVE, target: opponentRight); }
        }
        else
        {
            TURN { MOVE(playerRight, move, gimmick: GIMMICK_Z_MOVE, target: opponentRight); }
        }
    } SCENE {
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_ZMOVE_ACTIVATE, playerRight);
        ANIMATION(ANIM_TYPE_MOVE, zmove, playerRight);
    } THEN {
        FORCE_MOVE_ANIM(FALSE);
        if (gLoadFail)
            DebugPrintf("Move failed: %S (%u)", gMovesInfo[move].name, move);
        EXPECT_EQ(gLoadFail, FALSE);
    }
}

DOUBLE_BATTLE_TEST("Z-Moves don't leak when used - Doubles (opponentLeft to playerLeft)")
{
    FORCE_MOVE_ANIM(TRUE);
    u32 species, move, item, zmove;
    Z_MOVE_PARAMETERS;
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET) { Item(ITEM_FOCUS_SASH); }
        PLAYER(SPECIES_WYNAUT) { Item(ITEM_FOCUS_SASH); }
        OPPONENT(species) { Item(item); }
        OPPONENT(SPECIES_WYNAUT);
    } WHEN {
        if (species == SPECIES_NECROZMA_DAWN_WINGS)
        {
            TURN { MOVE(opponentLeft, MOVE_CELEBRATE, gimmick: GIMMICK_ULTRA_BURST); }
            TURN { MOVE(opponentLeft, move, gimmick: GIMMICK_Z_MOVE, target: playerLeft); }
        }
        else
        {
            TURN { MOVE(opponentLeft, move, gimmick: GIMMICK_Z_MOVE, target: playerLeft); }
        }
    } SCENE {
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_ZMOVE_ACTIVATE, opponentLeft);
        ANIMATION(ANIM_TYPE_MOVE, zmove, opponentLeft);
    } THEN {
        FORCE_MOVE_ANIM(FALSE);
        if (gLoadFail)
            DebugPrintf("Move failed: %S (%u)", gMovesInfo[move].name, move);
        EXPECT_EQ(gLoadFail, FALSE);
    }
}

DOUBLE_BATTLE_TEST("Z-Moves don't leak when used - Doubles (opponentLeft to playerRight)")
{
    FORCE_MOVE_ANIM(TRUE);
    u32 species, move, item, zmove;
    Z_MOVE_PARAMETERS;
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET) { Item(ITEM_FOCUS_SASH); }
        PLAYER(SPECIES_WYNAUT) { Item(ITEM_FOCUS_SASH); }
        OPPONENT(species) { Item(item); }
        OPPONENT(SPECIES_WYNAUT);
    } WHEN {
        if (species == SPECIES_NECROZMA_DAWN_WINGS)
        {
            TURN { MOVE(opponentLeft, MOVE_CELEBRATE, gimmick: GIMMICK_ULTRA_BURST); }
            TURN { MOVE(opponentLeft, move, gimmick: GIMMICK_Z_MOVE, target: playerRight); }
        }
        else
        {
            TURN { MOVE(opponentLeft, move, gimmick: GIMMICK_Z_MOVE, target: playerRight); }
        }
    } SCENE {
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_ZMOVE_ACTIVATE, opponentLeft);
        ANIMATION(ANIM_TYPE_MOVE, zmove, opponentLeft);
    } THEN {
        FORCE_MOVE_ANIM(FALSE);
        if (gLoadFail)
            DebugPrintf("Move failed: %S (%u)", gMovesInfo[move].name, move);
        EXPECT_EQ(gLoadFail, FALSE);
    }
}

DOUBLE_BATTLE_TEST("Z-Moves don't leak when used - Doubles (opponentRight to playerLeft)")
{
    FORCE_MOVE_ANIM(TRUE);
    u32 species, move, item, zmove;
    Z_MOVE_PARAMETERS;
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET) { Item(ITEM_FOCUS_SASH); }
        PLAYER(SPECIES_WYNAUT) { Item(ITEM_FOCUS_SASH); }
        OPPONENT(SPECIES_WYNAUT);
        OPPONENT(species) { Item(item); }
    } WHEN {
        if (species == SPECIES_NECROZMA_DAWN_WINGS)
        {
            TURN { MOVE(opponentRight, MOVE_CELEBRATE, gimmick: GIMMICK_ULTRA_BURST); }
            TURN { MOVE(opponentRight, move, gimmick: GIMMICK_Z_MOVE, target: playerLeft); }
        }
        else
        {
            TURN { MOVE(opponentRight, move, gimmick: GIMMICK_Z_MOVE, target: playerLeft); }
        }
    } SCENE {
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_ZMOVE_ACTIVATE, opponentRight);
        ANIMATION(ANIM_TYPE_MOVE, zmove, opponentRight);
    } THEN {
        FORCE_MOVE_ANIM(FALSE);
        if (gLoadFail)
            DebugPrintf("Move failed: %S (%u)", gMovesInfo[move].name, move);
        EXPECT_EQ(gLoadFail, FALSE);
    }
}

DOUBLE_BATTLE_TEST("Z-Moves don't leak when used - Doubles (opponentRight to playerRight)")
{
    FORCE_MOVE_ANIM(TRUE);
    u32 species, move, item, zmove;
    Z_MOVE_PARAMETERS;
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET) { Item(ITEM_FOCUS_SASH); }
        PLAYER(SPECIES_WYNAUT) { Item(ITEM_FOCUS_SASH); }
        OPPONENT(SPECIES_WYNAUT);
        OPPONENT(species) { Item(item); }
    } WHEN {
        if (species == SPECIES_NECROZMA_DAWN_WINGS)
        {
            TURN { MOVE(opponentRight, MOVE_CELEBRATE, gimmick: GIMMICK_ULTRA_BURST); }
            TURN { MOVE(opponentRight, move, gimmick: GIMMICK_Z_MOVE, target: playerRight); }
        }
        else
        {
            TURN { MOVE(opponentRight, move, gimmick: GIMMICK_Z_MOVE, target: playerRight); }
        }
    } SCENE {
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_ZMOVE_ACTIVATE, opponentRight);
        ANIMATION(ANIM_TYPE_MOVE, zmove, opponentRight);
    } THEN {
        FORCE_MOVE_ANIM(FALSE);
        if (gLoadFail)
            DebugPrintf("Move failed: %S (%u)", gMovesInfo[move].name, move);
        EXPECT_EQ(gLoadFail, FALSE);
    }
}

//  Max Moves

// Tera Blast and all type variants
#define TERA_BLAST_PARAMETERS PARAMETRIZE { species = SPECIES_WOBBUFFET; move = MOVE_TERA_BLAST; type = TYPE_NORMAL; } \
    PARAMETRIZE { species = SPECIES_WOBBUFFET; move = MOVE_TERA_BLAST; type = TYPE_FIGHTING; } \
    PARAMETRIZE { species = SPECIES_WOBBUFFET; move = MOVE_TERA_BLAST; type = TYPE_FLYING; } \
    PARAMETRIZE { species = SPECIES_WOBBUFFET; move = MOVE_TERA_BLAST; type = TYPE_POISON; } \
    PARAMETRIZE { species = SPECIES_WOBBUFFET; move = MOVE_TERA_BLAST; type = TYPE_GROUND; } \
    PARAMETRIZE { species = SPECIES_WOBBUFFET; move = MOVE_TERA_BLAST; type = TYPE_ROCK; } \
    PARAMETRIZE { species = SPECIES_WOBBUFFET; move = MOVE_TERA_BLAST; type = TYPE_BUG; } \
    PARAMETRIZE { species = SPECIES_WOBBUFFET; move = MOVE_TERA_BLAST; type = TYPE_GHOST; } \
    PARAMETRIZE { species = SPECIES_WOBBUFFET; move = MOVE_TERA_BLAST; type = TYPE_STEEL; } \
    PARAMETRIZE { species = SPECIES_WOBBUFFET; move = MOVE_TERA_BLAST; type = TYPE_WATER; } \
    PARAMETRIZE { species = SPECIES_WOBBUFFET; move = MOVE_TERA_BLAST; type = TYPE_FIRE; } \
    PARAMETRIZE { species = SPECIES_WOBBUFFET; move = MOVE_TERA_BLAST; type = TYPE_GRASS; } \
    PARAMETRIZE { species = SPECIES_WOBBUFFET; move = MOVE_TERA_BLAST; type = TYPE_ELECTRIC; } \
    PARAMETRIZE { species = SPECIES_WOBBUFFET; move = MOVE_TERA_BLAST; type = TYPE_PSYCHIC; } \
    PARAMETRIZE { species = SPECIES_WOBBUFFET; move = MOVE_TERA_BLAST; type = TYPE_ICE; } \
    PARAMETRIZE { species = SPECIES_WOBBUFFET; move = MOVE_TERA_BLAST; type = TYPE_DRAGON; } \
    PARAMETRIZE { species = SPECIES_WOBBUFFET; move = MOVE_TERA_BLAST; type = TYPE_DARK; } \
    PARAMETRIZE { species = SPECIES_WOBBUFFET; move = MOVE_TERA_BLAST; type = TYPE_FAIRY; } \
    PARAMETRIZE { species = SPECIES_WOBBUFFET; move = MOVE_TERA_BLAST; type = TYPE_STELLAR; }

SINGLE_BATTLE_TEST("Tera Blast doesn't leak when used - Singles (player to opponent)")
{
    FORCE_MOVE_ANIM(TRUE);
    u32 species, move, type;
    TERA_BLAST_PARAMETERS;
    GIVEN {
        PLAYER(species) { TeraType(type); }
        OPPONENT(SPECIES_WOBBUFFET) { Item(ITEM_FOCUS_SASH); }
    } WHEN {
        TURN { MOVE(player, move, gimmick: GIMMICK_TERA); }
    } SCENE {
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_TERA_CHARGE, player);
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_TERA_ACTIVATE, player);
        ANIMATION(ANIM_TYPE_MOVE, move, player);
    } THEN {
        FORCE_MOVE_ANIM(FALSE);
        if (gLoadFail)
            DebugPrintf("Move failed: %S (%u)", gMovesInfo[move].name, move);
        EXPECT_EQ(gLoadFail, FALSE);
    }
}

SINGLE_BATTLE_TEST("Tera Blast doesn't leak when used - Singles (opponent to player)")
{
    FORCE_MOVE_ANIM(TRUE);
    u32 species, move, type;
    TERA_BLAST_PARAMETERS;
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET) { Item(ITEM_FOCUS_SASH); }
        OPPONENT(species) { TeraType(type); }
    } WHEN {
        TURN { MOVE(opponent, move, gimmick: GIMMICK_TERA); }
    } SCENE {
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_TERA_CHARGE, opponent);
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_TERA_ACTIVATE, opponent);
        ANIMATION(ANIM_TYPE_MOVE, move, opponent);
    } THEN {
        FORCE_MOVE_ANIM(FALSE);
        if (gLoadFail)
            DebugPrintf("Move failed: %S (%u)", gMovesInfo[move].name, move);
        EXPECT_EQ(gLoadFail, FALSE);
    }
}

DOUBLE_BATTLE_TEST("Tera Blast doesn't leak when used - Doubles (playerLeft to opponentLeft)")
{
    FORCE_MOVE_ANIM(TRUE);
    u32 species, move, type;
    TERA_BLAST_PARAMETERS;
    GIVEN {
        PLAYER(species) { TeraType(type); }
        PLAYER(SPECIES_WYNAUT);
        OPPONENT(SPECIES_WOBBUFFET) { Item(ITEM_FOCUS_SASH); }
        OPPONENT(SPECIES_WYNAUT) { Item(ITEM_FOCUS_SASH); }
    } WHEN {
        TURN { MOVE(playerLeft, move, gimmick: GIMMICK_TERA, target: opponentLeft); }
    } SCENE {
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_TERA_CHARGE, playerLeft);
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_TERA_ACTIVATE, playerLeft);
        ANIMATION(ANIM_TYPE_MOVE, move, playerLeft);
    } THEN {
        FORCE_MOVE_ANIM(FALSE);
        if (gLoadFail)
            DebugPrintf("Move failed: %S (%u)", gMovesInfo[move].name, move);
        EXPECT_EQ(gLoadFail, FALSE);
    }
}

DOUBLE_BATTLE_TEST("Tera Blast doesn't leak when used - Doubles (playerLeft to opponentRight)")
{
    FORCE_MOVE_ANIM(TRUE);
    u32 species, move, type;
    TERA_BLAST_PARAMETERS;
    GIVEN {
        PLAYER(species) { TeraType(type); }
        PLAYER(SPECIES_WYNAUT);
        OPPONENT(SPECIES_WOBBUFFET) { Item(ITEM_FOCUS_SASH); }
        OPPONENT(SPECIES_WYNAUT) { Item(ITEM_FOCUS_SASH); }
    } WHEN {
        TURN { MOVE(playerLeft, move, gimmick: GIMMICK_TERA, target: opponentRight); }
    } SCENE {
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_TERA_CHARGE, playerLeft);
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_TERA_ACTIVATE, playerLeft);
        ANIMATION(ANIM_TYPE_MOVE, move, playerLeft);
    } THEN {
        FORCE_MOVE_ANIM(FALSE);
        if (gLoadFail)
            DebugPrintf("Move failed: %S (%u)", gMovesInfo[move].name, move);
        EXPECT_EQ(gLoadFail, FALSE);
    }
}

DOUBLE_BATTLE_TEST("Tera Blast doesn't leak when used - Doubles (playerRight to opponentLeft)")
{
    FORCE_MOVE_ANIM(TRUE);
    u32 species, move, type;
    TERA_BLAST_PARAMETERS;
    GIVEN {
        PLAYER(SPECIES_WYNAUT);
        PLAYER(species) { TeraType(type); }
        OPPONENT(SPECIES_WOBBUFFET) { Item(ITEM_FOCUS_SASH); }
        OPPONENT(SPECIES_WYNAUT) { Item(ITEM_FOCUS_SASH); }
    } WHEN {
        TURN { MOVE(playerRight, move, gimmick: GIMMICK_TERA, target: opponentLeft); }
    } SCENE {
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_TERA_CHARGE, playerRight);
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_TERA_ACTIVATE, playerRight);
        ANIMATION(ANIM_TYPE_MOVE, move, playerRight);
    } THEN {
        FORCE_MOVE_ANIM(FALSE);
        if (gLoadFail)
            DebugPrintf("Move failed: %S (%u)", gMovesInfo[move].name, move);
        EXPECT_EQ(gLoadFail, FALSE);
    }
}

DOUBLE_BATTLE_TEST("Tera Blast doesn't leak when used - Doubles (playerRight to opponentRight)")
{
    FORCE_MOVE_ANIM(TRUE);
    u32 species, move, type;
    TERA_BLAST_PARAMETERS;
    GIVEN {
        PLAYER(SPECIES_WYNAUT);
        PLAYER(species) { TeraType(type); }
        OPPONENT(SPECIES_WOBBUFFET) { Item(ITEM_FOCUS_SASH); }
        OPPONENT(SPECIES_WYNAUT) { Item(ITEM_FOCUS_SASH); }
    } WHEN {
        TURN { MOVE(playerRight, move, gimmick: GIMMICK_TERA, target: opponentRight); }
    } SCENE {
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_TERA_CHARGE, playerRight);
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_TERA_ACTIVATE, playerRight);
        ANIMATION(ANIM_TYPE_MOVE, move, playerRight);
    } THEN {
        FORCE_MOVE_ANIM(FALSE);
        if (gLoadFail)
            DebugPrintf("Move failed: %S (%u)", gMovesInfo[move].name, move);
        EXPECT_EQ(gLoadFail, FALSE);
    }
}

DOUBLE_BATTLE_TEST("Tera Blast doesn't leak when used - Doubles (opponentLeft to playerLeft)")
{
    FORCE_MOVE_ANIM(TRUE);
    u32 species, move, type;
    TERA_BLAST_PARAMETERS;
    GIVEN {
        PLAYER(species) { Item(ITEM_FOCUS_SASH); }
        PLAYER(SPECIES_WYNAUT) { Item(ITEM_FOCUS_SASH); }
        OPPONENT(SPECIES_WOBBUFFET) { TeraType(type); }
        OPPONENT(SPECIES_WYNAUT);
    } WHEN {
        TURN { MOVE(opponentLeft, move, gimmick: GIMMICK_TERA, target: playerLeft); }
    } SCENE {
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_TERA_CHARGE, opponentLeft);
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_TERA_ACTIVATE, opponentLeft);
        ANIMATION(ANIM_TYPE_MOVE, move, opponentLeft);
    } THEN {
        FORCE_MOVE_ANIM(FALSE);
        if (gLoadFail)
            DebugPrintf("Move failed: %S (%u)", gMovesInfo[move].name, move);
        EXPECT_EQ(gLoadFail, FALSE);
    }
}

DOUBLE_BATTLE_TEST("Tera Blast doesn't leak when used - Doubles (opponentLeft to playerRight)")
{
    FORCE_MOVE_ANIM(TRUE);
    u32 species, move, type;
    TERA_BLAST_PARAMETERS;
    GIVEN {
        PLAYER(species) { Item(ITEM_FOCUS_SASH); }
        PLAYER(SPECIES_WYNAUT) { Item(ITEM_FOCUS_SASH); }
        OPPONENT(SPECIES_WOBBUFFET) { TeraType(type); }
        OPPONENT(SPECIES_WYNAUT);
    } WHEN {
        TURN { MOVE(opponentLeft, move, gimmick: GIMMICK_TERA, target: playerRight); }
    } SCENE {
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_TERA_CHARGE, opponentLeft);
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_TERA_ACTIVATE, opponentLeft);
        ANIMATION(ANIM_TYPE_MOVE, move, opponentLeft);
    } THEN {
        FORCE_MOVE_ANIM(FALSE);
        if (gLoadFail)
            DebugPrintf("Move failed: %S (%u)", gMovesInfo[move].name, move);
        EXPECT_EQ(gLoadFail, FALSE);
    }
}

DOUBLE_BATTLE_TEST("Tera Blast doesn't leak when used - Doubles (opponentRight to playerLeft)")
{
    FORCE_MOVE_ANIM(TRUE);
    u32 species, move, type;
    TERA_BLAST_PARAMETERS;
    GIVEN {
        PLAYER(species) { Item(ITEM_FOCUS_SASH); }
        PLAYER(SPECIES_WYNAUT) { Item(ITEM_FOCUS_SASH); }
        OPPONENT(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WYNAUT) { TeraType(type); }
    } WHEN {
        TURN { MOVE(opponentRight, move, gimmick: GIMMICK_TERA, target: playerLeft); }
    } SCENE {
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_TERA_CHARGE, opponentRight);
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_TERA_ACTIVATE, opponentRight);
        ANIMATION(ANIM_TYPE_MOVE, move, opponentRight);
    } THEN {
        FORCE_MOVE_ANIM(FALSE);
        if (gLoadFail)
            DebugPrintf("Move failed: %S (%u)", gMovesInfo[move].name, move);
        EXPECT_EQ(gLoadFail, FALSE);
    }
}

DOUBLE_BATTLE_TEST("Tera Blast doesn't leak when used - Doubles (opponentRight to playerRight)")
{
    FORCE_MOVE_ANIM(TRUE);
    u32 species, move, type;
    TERA_BLAST_PARAMETERS;
    GIVEN {
        PLAYER(species) { Item(ITEM_FOCUS_SASH); }
        PLAYER(SPECIES_WYNAUT) { Item(ITEM_FOCUS_SASH); }
        OPPONENT(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WYNAUT) { TeraType(type); }
    } WHEN {
        TURN { MOVE(opponentRight, move, gimmick: GIMMICK_TERA, target: playerRight); }
    } SCENE {
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_TERA_CHARGE, opponentRight);
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_TERA_ACTIVATE, opponentRight);
        ANIMATION(ANIM_TYPE_MOVE, move, opponentRight);
    } THEN {
        FORCE_MOVE_ANIM(FALSE);
        if (gLoadFail)
            DebugPrintf("Move failed: %S (%u)", gMovesInfo[move].name, move);
        EXPECT_EQ(gLoadFail, FALSE);
    }
}

#endif
