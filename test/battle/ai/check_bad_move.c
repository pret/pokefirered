#include "global.h"
#include "test/battle.h"
#include "battle_ai_util.h"
#include "move.h"

AI_SINGLE_BATTLE_TEST("AI will not try to lower opposing stats if target is protected by it's ability")
{
    enum Ability ability;
    u32 species, move;

    PARAMETRIZE { ability = ABILITY_SPEED_BOOST;  species = SPECIES_TORCHIC; move = MOVE_SCARY_FACE; }
    PARAMETRIZE { ability = ABILITY_HYPER_CUTTER; species = SPECIES_KRABBY;  move = MOVE_GROWL; }
    PARAMETRIZE { ability = ABILITY_BIG_PECKS;    species = SPECIES_PIDGEY;  move = MOVE_SCREECH; }
    PARAMETRIZE { ability = ABILITY_ILLUMINATE;   species = SPECIES_STARYU;  move = MOVE_SAND_ATTACK; }
    PARAMETRIZE { ability = ABILITY_KEEN_EYE;     species = SPECIES_PIDGEY;  move = MOVE_SAND_ATTACK; }
    PARAMETRIZE { ability = ABILITY_CONTRARY;     species = SPECIES_SNIVY;   move = MOVE_NOBLE_ROAR; }
    PARAMETRIZE { ability = ABILITY_CLEAR_BODY;   species = SPECIES_BELDUM;  move = MOVE_NOBLE_ROAR; }

    GIVEN {
        WITH_CONFIG(CONFIG_ILLUMINATE_EFFECT, GEN_9);
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_OMNISCIENT);
        PLAYER(species) { Ability(ability); }
        OPPONENT(SPECIES_WOBBUFFET) { Moves(MOVE_TACKLE, move); }
    } WHEN {
        TURN { SCORE_LT_VAL(opponent, move, AI_SCORE_DEFAULT); }
    }
}


AI_DOUBLE_BATTLE_TEST("AI will not try to lower opposing stats if target is protected by Flower Veil")
{
    enum Move move;

    PARAMETRIZE { move = MOVE_SCARY_FACE; }
    PARAMETRIZE { move = MOVE_GROWL; }
    PARAMETRIZE { move = MOVE_SCREECH; }
    PARAMETRIZE { move = MOVE_SAND_ATTACK; }
    PARAMETRIZE { move = MOVE_SAND_ATTACK; }
    PARAMETRIZE { move = MOVE_NOBLE_ROAR; }
    PARAMETRIZE { move = MOVE_NOBLE_ROAR; }

    GIVEN {
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_OMNISCIENT);
        PLAYER(SPECIES_COMFEY) { Ability(ABILITY_FLOWER_VEIL); }
        PLAYER(SPECIES_BULBASAUR);
        OPPONENT(SPECIES_WOBBUFFET) { Moves(MOVE_TACKLE, move); }
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { SCORE_LT_VAL(opponentLeft, move, AI_SCORE_DEFAULT, target: playerRight); }
    }
}

AI_SINGLE_BATTLE_TEST("AI sees No Guard affects semi-invulnerable moves")
{
    GIVEN {
        ASSUME(GetMoveEffect(MOVE_PHANTOM_FORCE) == EFFECT_SEMI_INVULNERABLE);
        ASSUME(GetMovePower(MOVE_PHANTOM_FORCE) == GetMovePower(MOVE_SPECTRAL_THIEF));
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT | AI_FLAG_OMNISCIENT);
        PLAYER(SPECIES_GOLURK) { Ability(ABILITY_NO_GUARD); Moves(MOVE_DYNAMIC_PUNCH, MOVE_CELEBRATE); }
        OPPONENT(SPECIES_SMEARGLE) { Moves(MOVE_PHANTOM_FORCE, MOVE_SPECTRAL_THIEF); }
    } WHEN {
        TURN { EXPECT_MOVE(opponent, MOVE_SPECTRAL_THIEF); }
    }
}

AI_SINGLE_BATTLE_TEST("Protect: AI avoids Protect vs Unseen Fist contact (Single)")
{
    static const enum Move protectMoves[] =
    {
        MOVE_PROTECT,
        MOVE_DETECT,
        MOVE_SPIKY_SHIELD,
        MOVE_KINGS_SHIELD,
        MOVE_BANEFUL_BUNKER,
        MOVE_BURNING_BULWARK,
        MOVE_OBSTRUCT,
        MOVE_SILK_TRAP,
    };
    u32 species = SPECIES_NONE;
    enum Ability ability = ABILITY_NONE;
    enum Move protectMove = MOVE_NONE;
    bool32 shouldProtect = FALSE;

    for (u32 paramIdx = 0; paramIdx < ARRAY_COUNT(protectMoves); paramIdx++)
    {
        PARAMETRIZE { species = SPECIES_PIKACHU; ability = ABILITY_STATIC;      shouldProtect = TRUE;  protectMove = protectMoves[paramIdx]; }
        PARAMETRIZE { species = SPECIES_URSHIFU; ability = ABILITY_UNSEEN_FIST; shouldProtect = FALSE; protectMove = protectMoves[paramIdx]; }
    }

    PASSES_RANDOMLY(PREDICT_MOVE_CHANCE, 100, RNG_AI_PREDICT_MOVE);
    GIVEN {
        ASSUME(GetMoveEffect(protectMove) == EFFECT_PROTECT);
        ASSUME(MoveMakesContact(MOVE_TACKLE));
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT | AI_FLAG_OMNISCIENT | AI_FLAG_PREDICT_MOVE);
        PLAYER(species) { Ability(ability); Moves(MOVE_TACKLE); }
        OPPONENT(SPECIES_WOBBUFFET) { Moves(protectMove, MOVE_SCRATCH); }
    } WHEN {
        if (shouldProtect)
        {
            TURN {
                MOVE(player, MOVE_TACKLE);
                SCORE_GT(opponent, protectMove, MOVE_SCRATCH);
            }
        }
        else
        {
            TURN {
                MOVE(player, MOVE_TACKLE);
                SCORE_LT(opponent, protectMove, MOVE_SCRATCH);
            }
        }
    }
}

AI_DOUBLE_BATTLE_TEST("Protect: AI avoids Protect vs Unseen Fist contact (Doubles)")
{
    static const enum Move protectMoves[] =
    {
        MOVE_PROTECT,
        MOVE_DETECT,
        MOVE_SPIKY_SHIELD,
        MOVE_KINGS_SHIELD,
        MOVE_BANEFUL_BUNKER,
        MOVE_BURNING_BULWARK,
        MOVE_OBSTRUCT,
        MOVE_SILK_TRAP,
    };
    u32 species = SPECIES_NONE;
    enum Ability ability = ABILITY_NONE;
    enum Move protectMove = MOVE_NONE;
    bool32 shouldProtect = FALSE;

    for (u32 paramIdx = 0; paramIdx < ARRAY_COUNT(protectMoves); paramIdx++)
    {
        PARAMETRIZE { species = SPECIES_PIKACHU; ability = ABILITY_STATIC;      shouldProtect = TRUE;  protectMove = protectMoves[paramIdx]; }
        PARAMETRIZE { species = SPECIES_URSHIFU; ability = ABILITY_UNSEEN_FIST; shouldProtect = FALSE; protectMove = protectMoves[paramIdx]; }
    }

    PASSES_RANDOMLY(PREDICT_MOVE_CHANCE, 100, RNG_AI_PREDICT_MOVE);
    GIVEN {
        ASSUME(GetMoveEffect(protectMove) == EFFECT_PROTECT);
        ASSUME(MoveMakesContact(MOVE_TACKLE));
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT | AI_FLAG_OMNISCIENT | AI_FLAG_PREDICT_MOVE);
        PLAYER(species) { Ability(ability); Moves(MOVE_TACKLE); }
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET) { Moves(protectMove, MOVE_SCRATCH); }
        OPPONENT(SPECIES_WOBBUFFET) { Moves(MOVE_SCRATCH); }
    } WHEN {
        if (shouldProtect)
        {
            TURN {
                MOVE(playerLeft, MOVE_TACKLE, target: opponentLeft);
                MOVE(playerRight, MOVE_CELEBRATE);
                SCORE_GT(opponentLeft, protectMove, MOVE_SCRATCH, target: playerLeft);
            }
        }
        else
        {
            TURN {
                MOVE(playerLeft, MOVE_TACKLE, target: opponentLeft);
                MOVE(playerRight, MOVE_CELEBRATE);
                SCORE_LT(opponentLeft, protectMove, MOVE_SCRATCH, target: playerLeft);
            }
        }
    }
}

AI_SINGLE_BATTLE_TEST("Protect: AI avoids Protect vs moves that ignore protection (Single)")
{
    enum Move move = MOVE_NONE;
    bool32 shouldProtect = FALSE;

    PARAMETRIZE { move = MOVE_TACKLE; shouldProtect = TRUE; }
    PARAMETRIZE { move = MOVE_FEINT; shouldProtect = FALSE; }
    PARAMETRIZE { move = MOVE_SHADOW_FORCE; shouldProtect = FALSE; }
    PARAMETRIZE { move = MOVE_PHANTOM_FORCE; shouldProtect = FALSE; }
    PARAMETRIZE { move = MOVE_HYPERSPACE_HOLE; shouldProtect = FALSE; }
    PARAMETRIZE { move = MOVE_HYPERSPACE_FURY; shouldProtect = FALSE; }

    PASSES_RANDOMLY(PREDICT_MOVE_CHANCE, 100, RNG_AI_PREDICT_MOVE);
    GIVEN {
        if (shouldProtect)
            ASSUME(!MoveIgnoresProtect(move));
        else
            ASSUME(MoveIgnoresProtect(move));
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT | AI_FLAG_OMNISCIENT | AI_FLAG_PREDICT_MOVE);
        PLAYER(SPECIES_WOBBUFFET) { Moves(move); }
        OPPONENT(SPECIES_WOBBUFFET) { Moves(MOVE_PROTECT, MOVE_SCRATCH); }
    } WHEN {
        TURN {
            MOVE(player, move);
            if (shouldProtect)
                SCORE_GT(opponent, MOVE_PROTECT, MOVE_SCRATCH);
            else
                SCORE_LT(opponent, MOVE_PROTECT, MOVE_SCRATCH);
        }
    }
}

AI_DOUBLE_BATTLE_TEST("Protect: AI avoids Protect vs moves that ignore protection (Doubles)")
{
    enum Move move = MOVE_NONE;
    bool32 shouldProtect = FALSE;

    PARAMETRIZE { move = MOVE_TACKLE; shouldProtect = TRUE; }
    PARAMETRIZE { move = MOVE_FEINT; shouldProtect = FALSE; }
    PARAMETRIZE { move = MOVE_SHADOW_FORCE; shouldProtect = FALSE; }
    PARAMETRIZE { move = MOVE_PHANTOM_FORCE; shouldProtect = FALSE; }
    PARAMETRIZE { move = MOVE_HYPERSPACE_HOLE; shouldProtect = FALSE; }
    PARAMETRIZE { move = MOVE_HYPERSPACE_FURY; shouldProtect = FALSE; }

    PASSES_RANDOMLY(PREDICT_MOVE_CHANCE, 100, RNG_AI_PREDICT_MOVE);
    GIVEN {
        if (shouldProtect)
            ASSUME(!MoveIgnoresProtect(move));
        else
            ASSUME(MoveIgnoresProtect(move));
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT | AI_FLAG_OMNISCIENT | AI_FLAG_PREDICT_MOVE);
        PLAYER(SPECIES_WOBBUFFET) { Moves(move); }
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET) { Moves(MOVE_PROTECT, MOVE_SCRATCH); }
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN {
            MOVE(playerLeft, move, target: opponentLeft);
            MOVE(playerRight, MOVE_CELEBRATE);
            if (shouldProtect)
                SCORE_GT(opponentLeft, MOVE_PROTECT, MOVE_SCRATCH, target: playerLeft);
            else
                SCORE_LT(opponentLeft, MOVE_PROTECT, MOVE_SCRATCH, target: playerLeft);
        }
    }
}
