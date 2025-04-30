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
        TURN { SWITCH(player, 0); MOVE(opponent, MOVE_TACKLE);}
        // Switch back to Terapagos
        TURN { SWITCH(player, 1); }
        //  Terapagos Stellar, Zoroark gets Roared in, should not be Stellar Terapagos
        TURN { MOVE(player, MOVE_CELEBRATE, gimmick: GIMMICK_TERA); MOVE(opponent, MOVE_ROAR); }
        //  Reveal the Zoroark
        TURN { MOVE(player, MOVE_CELEBRATE); MOVE(opponent, MOVE_TACKLE); }
    }
}

SINGLE_BATTLE_TEST("Illusion breaks if the target faints")
{
    GIVEN {
        PLAYER(SPECIES_ZOROARK) { HP(1); }
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(opponent, MOVE_TACKLE); SEND_OUT(player, 1); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_TACKLE, opponent);
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
        PLAYER(SPECIES_WOBBUFFET);
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
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_ZOROARK);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { SWITCH(player, 1); }
    } THEN {
        EXPECT_EQ(player->species, SPECIES_ZOROARK);
        EXPECT_EQ(gBattleStruct->illusion[0].on, FALSE); // Battler is Zoroark and not Illusioned
    }
}
