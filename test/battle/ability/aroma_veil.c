#include "global.h"
#include "test/battle.h"

DOUBLE_BATTLE_TEST("Aroma Veil protects the Pokémon's side from Taunt")
{
    struct BattlePokemon *moveTarget = NULL;
    PARAMETRIZE { moveTarget = playerLeft; }
    PARAMETRIZE { moveTarget = playerRight; }
    GIVEN {
        ASSUME(gMovesInfo[MOVE_TAUNT].effect == EFFECT_TAUNT);
        ASSUME(gMovesInfo[MOVE_HARDEN].category == DAMAGE_CATEGORY_STATUS);
        PLAYER(SPECIES_AROMATISSE) { Ability(ABILITY_AROMA_VEIL); }
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WYNAUT);
    } WHEN {
        TURN { MOVE(opponentLeft, MOVE_TAUNT, target: moveTarget); MOVE(moveTarget, MOVE_HARDEN); }
    } SCENE {
        NOT ANIMATION(ANIM_TYPE_MOVE, MOVE_TAUNT, opponentLeft);
        ABILITY_POPUP(playerLeft, ABILITY_AROMA_VEIL);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_HARDEN, moveTarget);
    }
}

DOUBLE_BATTLE_TEST("Aroma Veil protects the Pokémon's side from Torment")
{
    struct BattlePokemon *moveTarget = NULL;
    PARAMETRIZE { moveTarget = playerLeft; }
    PARAMETRIZE { moveTarget = playerRight; }
    GIVEN {
        ASSUME(gMovesInfo[MOVE_TORMENT].effect == EFFECT_TORMENT);
        ASSUME(gMovesInfo[MOVE_HARDEN].category == DAMAGE_CATEGORY_STATUS);
        PLAYER(SPECIES_AROMATISSE) { Ability(ABILITY_AROMA_VEIL); }
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WYNAUT);
    } WHEN {
        TURN { MOVE(opponentLeft, MOVE_TORMENT, target: moveTarget); MOVE(moveTarget, MOVE_HARDEN); }
        TURN { MOVE(moveTarget, MOVE_HARDEN); }
    } SCENE {
        NOT ANIMATION(ANIM_TYPE_MOVE, MOVE_TORMENT, opponentLeft);
        ABILITY_POPUP(playerLeft, ABILITY_AROMA_VEIL);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_HARDEN, moveTarget);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_HARDEN, moveTarget);
    }
}

DOUBLE_BATTLE_TEST("Aroma Veil protects the Pokémon's side from Encore")
{
    struct BattlePokemon *moveTarget = NULL;
    PARAMETRIZE { moveTarget = playerLeft; }
    PARAMETRIZE { moveTarget = playerRight; }
    GIVEN {
        ASSUME(gMovesInfo[MOVE_ENCORE].effect == EFFECT_ENCORE);
        ASSUME(gMovesInfo[MOVE_HARDEN].category == DAMAGE_CATEGORY_STATUS);
        PLAYER(SPECIES_AROMATISSE) { Ability(ABILITY_AROMA_VEIL); }
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WYNAUT);
    } WHEN {
        TURN { MOVE(opponentLeft, MOVE_ENCORE, target: moveTarget); MOVE(moveTarget, MOVE_HARDEN); }
        TURN { MOVE(moveTarget, MOVE_CELEBRATE); }
    } SCENE {
        NOT ANIMATION(ANIM_TYPE_MOVE, MOVE_ENCORE, opponentLeft);
        ABILITY_POPUP(playerLeft, ABILITY_AROMA_VEIL);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_HARDEN, moveTarget);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_CELEBRATE, moveTarget);
    }
}

DOUBLE_BATTLE_TEST("Aroma Veil protects the Pokémon's side from Disable")
{
    struct BattlePokemon *moveTarget = NULL;
    PARAMETRIZE { moveTarget = playerLeft; }
    PARAMETRIZE { moveTarget = playerRight; }
    GIVEN {
        ASSUME(gMovesInfo[MOVE_DISABLE].effect == EFFECT_DISABLE);
        ASSUME(gMovesInfo[MOVE_HARDEN].category == DAMAGE_CATEGORY_STATUS);
        PLAYER(SPECIES_AROMATISSE) { Ability(ABILITY_AROMA_VEIL); }
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WYNAUT);
    } WHEN {
        TURN { MOVE(opponentLeft, MOVE_DISABLE, target: moveTarget); MOVE(moveTarget, MOVE_HARDEN); }
        TURN { MOVE(moveTarget, MOVE_HARDEN); }
    } SCENE {
        NOT ANIMATION(ANIM_TYPE_MOVE, MOVE_DISABLE, opponentLeft);
        ABILITY_POPUP(playerLeft, ABILITY_AROMA_VEIL);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_HARDEN, moveTarget);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_HARDEN, moveTarget);
    }
}

DOUBLE_BATTLE_TEST("Aroma Veil protects the Pokémon's side from Cursed Body")
{
    GIVEN {
        ASSUME(gMovesInfo[MOVE_PECK].makesContact);
        PLAYER(SPECIES_AROMATISSE) { Ability(ABILITY_AROMA_VEIL); }
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_JELLICENT) { Ability(ABILITY_CURSED_BODY); }
        OPPONENT(SPECIES_WYNAUT);
    } WHEN {
        TURN { MOVE(playerLeft, MOVE_PECK, target: opponentLeft); MOVE(playerRight, MOVE_PECK, target: opponentLeft); }
        TURN { MOVE(playerLeft, MOVE_PECK, target: opponentLeft); MOVE(playerRight, MOVE_PECK, target: opponentLeft); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_PECK, playerLeft);
        NOT ABILITY_POPUP(opponentLeft, ABILITY_CURSED_BODY);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_PECK, playerRight);
        NOT ABILITY_POPUP(opponentLeft, ABILITY_CURSED_BODY);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_PECK, playerLeft);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_PECK, playerRight);
    }
}

DOUBLE_BATTLE_TEST("Aroma Veil protects the Pokémon's side from Heal Block")
{
    struct BattlePokemon *moveTarget = NULL;
    PARAMETRIZE { moveTarget = playerLeft; }
    PARAMETRIZE { moveTarget = playerRight; }
    GIVEN {
        ASSUME(gMovesInfo[MOVE_HEAL_BLOCK].effect == EFFECT_HEAL_BLOCK);
        ASSUME(gMovesInfo[MOVE_RECOVER].effect == EFFECT_RESTORE_HP);
        PLAYER(SPECIES_AROMATISSE) { Ability(ABILITY_AROMA_VEIL); HP(1); }
        PLAYER(SPECIES_WOBBUFFET) { HP(1); }
        OPPONENT(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WYNAUT);
    } WHEN {
        TURN { MOVE(opponentLeft, MOVE_HEAL_BLOCK, target: moveTarget); MOVE(moveTarget, MOVE_RECOVER); }
    } SCENE {
        NOT ANIMATION(ANIM_TYPE_MOVE, MOVE_HEAL_BLOCK, opponentLeft);
        ABILITY_POPUP(playerLeft, ABILITY_AROMA_VEIL);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_RECOVER, moveTarget);
    }
}

DOUBLE_BATTLE_TEST("Aroma Veil protects the Pokémon's side from Infatuation")
{
    struct BattlePokemon *moveTarget = NULL;
    PARAMETRIZE { moveTarget = playerLeft; }
    PARAMETRIZE { moveTarget = playerRight; }
    GIVEN {
        ASSUME(gMovesInfo[MOVE_ATTRACT].effect == EFFECT_ATTRACT);
        PLAYER(SPECIES_AROMATISSE) { Ability(ABILITY_AROMA_VEIL); }
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WYNAUT);
    } WHEN {
        TURN { MOVE(opponentLeft, MOVE_ATTRACT, target: moveTarget); MOVE(moveTarget, MOVE_CELEBRATE); }
    } SCENE {
        NOT ANIMATION(ANIM_TYPE_MOVE, MOVE_ATTRACT, opponentLeft);
        ABILITY_POPUP(playerLeft, ABILITY_AROMA_VEIL);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_CELEBRATE, moveTarget);
    }
}

DOUBLE_BATTLE_TEST("Aroma Veil does not protect the Pokémon's side from Imprison")
{
    GIVEN {
        ASSUME(gMovesInfo[MOVE_IMPRISON].effect == EFFECT_IMPRISON);
        PLAYER(SPECIES_AROMATISSE) { Ability(ABILITY_AROMA_VEIL); }
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET) {Moves(MOVE_IMPRISON, MOVE_CELEBRATE); }
        OPPONENT(SPECIES_WYNAUT);
    } WHEN {
        TURN { MOVE(opponentLeft, MOVE_IMPRISON); MOVE(playerLeft, MOVE_CELEBRATE); MOVE(playerRight, MOVE_CELEBRATE); MOVE(opponentRight, MOVE_SPLASH); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_IMPRISON, opponentLeft);
        NONE_OF {
            ABILITY_POPUP(playerLeft, ABILITY_AROMA_VEIL);
            ANIMATION(ANIM_TYPE_MOVE, MOVE_CELEBRATE, playerLeft);
            ANIMATION(ANIM_TYPE_MOVE, MOVE_CELEBRATE, playerRight);
        }
        ANIMATION(ANIM_TYPE_MOVE, MOVE_SPLASH, opponentRight);
    }
}

DOUBLE_BATTLE_TEST("Aroma Veil prevents Psychic Noise's effect")
{
    struct BattlePokemon *moveTarget = NULL;
    PARAMETRIZE { moveTarget = playerLeft; }
    PARAMETRIZE { moveTarget = playerRight; }
    GIVEN {
        ASSUME(gMovesInfo[MOVE_PSYCHIC_NOISE].additionalEffects[0].moveEffect == MOVE_EFFECT_PSYCHIC_NOISE);
        PLAYER(SPECIES_AROMATISSE) { Ability(ABILITY_AROMA_VEIL); }
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WYNAUT);
    } WHEN {
        TURN { MOVE(opponentLeft, MOVE_PSYCHIC_NOISE, target: moveTarget); MOVE(moveTarget, MOVE_RECOVER); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_PSYCHIC_NOISE, opponentLeft);
        ABILITY_POPUP(playerLeft, ABILITY_AROMA_VEIL);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_RECOVER, moveTarget);
    }
}

// Marked in Bulbapedia as need of research
//TO_DO_BATTLE_TEST("Aroma Veil prevents G-Max Meltdown's effect");
