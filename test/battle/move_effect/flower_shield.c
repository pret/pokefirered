#include "global.h"
#include "test/battle.h"

ASSUMPTIONS
{
    ASSUME(GetMoveEffect(MOVE_FLOWER_SHIELD) == EFFECT_FLOWER_SHIELD);
}

DOUBLE_BATTLE_TEST("Flower Shield raises the defense of all grass type pokemon")
{
    GIVEN {
        ASSUME(gSpeciesInfo[SPECIES_TANGELA].types[0] == TYPE_GRASS);
        ASSUME(gSpeciesInfo[SPECIES_TANGROWTH].types[0] == TYPE_GRASS);
        ASSUME(gSpeciesInfo[SPECIES_SUNKERN].types[0] == TYPE_GRASS);
        ASSUME(gSpeciesInfo[SPECIES_SUNFLORA].types[0] == TYPE_GRASS);
        PLAYER(SPECIES_TANGELA);
        PLAYER(SPECIES_TANGROWTH);
        OPPONENT(SPECIES_SUNKERN);
        OPPONENT(SPECIES_SUNFLORA);
    } WHEN {
        TURN { MOVE(playerLeft, MOVE_FLOWER_SHIELD); MOVE(playerRight, MOVE_CELEBRATE); }
    } SCENE {
        MESSAGE("Tangela used Flower Shield!");
        ANIMATION(ANIM_TYPE_MOVE, MOVE_FLOWER_SHIELD, playerLeft);
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_STATS_CHANGE, playerLeft);
        MESSAGE("Tangela's Defense rose!");
        ANIMATION(ANIM_TYPE_MOVE, MOVE_FLOWER_SHIELD, playerLeft);
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_STATS_CHANGE, opponentLeft);
        MESSAGE("The opposing Sunkern's Defense rose!");
        ANIMATION(ANIM_TYPE_MOVE, MOVE_FLOWER_SHIELD, playerLeft);
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_STATS_CHANGE, playerRight);
        MESSAGE("Tangrowth's Defense rose!");
        ANIMATION(ANIM_TYPE_MOVE, MOVE_FLOWER_SHIELD, playerLeft);
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_STATS_CHANGE, opponentRight);
        MESSAGE("The opposing Sunflora's Defense rose!");
    }
}
