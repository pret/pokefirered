#include "global.h"
#include "test/battle.h"

//  This test is eyes on only
SINGLE_BATTLE_TEST("Illusion can only imitate Normal Form terapagos")
{
    GIVEN {
        PLAYER(SPECIES_ZOROARK) { Moves(MOVE_CELEBRATE); }
        PLAYER(SPECIES_TERAPAGOS) { Moves(MOVE_CELEBRATE); }
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        //  Zoroark is out, should be normal form Terapagos
        //  Switch to Terapagos which enters Terastal Form
        TURN { SWITCH(player, 1); }
        //  Switch back to Zoroark, should not be Terastal Terapagos
        TURN { SWITCH(player, 0); MOVE(opponent, MOVE_SCRATCH);}
        //  Switch back to Terapagos
        TURN { SWITCH(player, 1); }
        //  Terapagos Stellar, Zoroark gets Roared in, should not be Stellar Terapagos
        TURN { MOVE(player, MOVE_CELEBRATE, gimmick: GIMMICK_TERA); MOVE(opponent, MOVE_ROAR); }
        //  Reveal the Zoroark
        TURN { MOVE(player, MOVE_CELEBRATE); MOVE(opponent, MOVE_SCRATCH); }
    }
}

SINGLE_BATTLE_TEST("Illusion breaks if the target faints")
{
    GIVEN {
        PLAYER(SPECIES_ZOROARK) { HP(1); }
        PLAYER(SPECIES_WYNAUT);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(opponent, MOVE_SCRATCH); SEND_OUT(player, 1); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_SCRATCH, opponent);
        HP_BAR(player);
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_ILLUSION_OFF, player);
        MESSAGE("Zoroark's illusion wore off!");
    }
}

SINGLE_BATTLE_TEST("Illusion breaks if the attacker faints")
{
    GIVEN {
        ASSUME(GetMoveEffect(MOVE_FINAL_GAMBIT) == EFFECT_FINAL_GAMBIT);
        PLAYER(SPECIES_ZOROARK) { HP(1); }
        PLAYER(SPECIES_WYNAUT);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(player, MOVE_FINAL_GAMBIT); SEND_OUT(player, 1); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_FINAL_GAMBIT, player);
        HP_BAR(player);
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_ILLUSION_OFF, player);
        MESSAGE("Zoroark's illusion wore off!");
    }
}

SINGLE_BATTLE_TEST("Illusion cannot imitate if the user is on the last slot")
{
    GIVEN {
        PLAYER(SPECIES_WYNAUT);
        PLAYER(SPECIES_ZOROARK);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { SWITCH(player, 1); }
    } THEN {
        EXPECT_EQ(player->species, SPECIES_ZOROARK);
        EXPECT_EQ(gBattleStruct->illusion[0].state, ILLUSION_OFF); // Battler is Zoroark and not Illusioned
    }
}

SINGLE_BATTLE_TEST("Illusion breaks in Neutralizing Gas")
{
    GIVEN {
        PLAYER(SPECIES_ZOROARK);
        PLAYER(SPECIES_WYNAUT);
        OPPONENT(SPECIES_WEEZING) { Ability(ABILITY_NEUTRALIZING_GAS); }
    } WHEN {
        TURN { }
    } SCENE {
        ABILITY_POPUP(opponent, ABILITY_NEUTRALIZING_GAS);
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_ILLUSION_OFF, player);
    }
}

SINGLE_BATTLE_TEST("Illusion breaks if affected by Gastro Acid")
{
    GIVEN {
        ASSUME(GetMoveEffect(MOVE_GASTRO_ACID) == EFFECT_GASTRO_ACID);
        PLAYER(SPECIES_ZOROARK);
        PLAYER(SPECIES_WYNAUT);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(opponent, MOVE_GASTRO_ACID); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_GASTRO_ACID, opponent);
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_ILLUSION_OFF, player);
    }
}

SINGLE_BATTLE_TEST("Illusion breaks if user loses Illusion due to Worry Seed")
{
    GIVEN {
        ASSUME(GetMoveEffect(MOVE_WORRY_SEED) == EFFECT_WORRY_SEED);
        PLAYER(SPECIES_ZOROARK);
        PLAYER(SPECIES_WYNAUT);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(opponent, MOVE_WORRY_SEED); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_WORRY_SEED, opponent);
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_ILLUSION_OFF, player);
    }
}
