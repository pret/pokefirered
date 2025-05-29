#include "global.h"
#include "test/battle.h"

DOUBLE_BATTLE_TEST("Commander will activate once Dondozo switches in")
{
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_TATSUGIRI) { Ability(ABILITY_COMMANDER); }
        PLAYER(SPECIES_DONDOZO);
        OPPONENT(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { SWITCH(playerLeft, 2); }
    } SCENE {
        ABILITY_POPUP(playerRight, ABILITY_COMMANDER);
        MESSAGE("Tatsugiri was swallowed by Dondozo and became Dondozo's commander!");
    }
}

DOUBLE_BATTLE_TEST("Commander increases all stats by 2 stages once it is triggered")
{
    GIVEN {
        PLAYER(SPECIES_TATSUGIRI) { Ability(ABILITY_COMMANDER); }
        PLAYER(SPECIES_DONDOZO);
        OPPONENT(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN {  }
    } SCENE {
        ABILITY_POPUP(playerLeft, ABILITY_COMMANDER);
        MESSAGE("Tatsugiri was swallowed by Dondozo and became Dondozo's commander!");
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_STATS_CHANGE, playerRight);
        MESSAGE("Dondozo's Attack sharply rose!");
        MESSAGE("Dondozo's Defense sharply rose!");
        MESSAGE("Dondozo's Sp. Atk sharply rose!");
        MESSAGE("Dondozo's Sp. Def sharply rose!");
        MESSAGE("Dondozo's Speed sharply rose!");
    }
}

DOUBLE_BATTLE_TEST("Commander Tatsugiri avoids moves targetted towards it")
{
    GIVEN {
        PLAYER(SPECIES_TATSUGIRI) { Ability(ABILITY_COMMANDER); }
        PLAYER(SPECIES_DONDOZO);
        OPPONENT(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(opponentLeft, MOVE_SCRATCH, target: playerLeft); MOVE(opponentRight, MOVE_POUND, target: playerRight); }
    } SCENE {
        ABILITY_POPUP(playerLeft, ABILITY_COMMANDER);
        MESSAGE("Tatsugiri was swallowed by Dondozo and became Dondozo's commander!");
        NOT ANIMATION(ANIM_TYPE_MOVE, MOVE_SCRATCH, opponentLeft);
        MESSAGE("The opposing Wobbuffet's attack missed!");
        ANIMATION(ANIM_TYPE_MOVE, MOVE_POUND, opponentRight);
    }
}

DOUBLE_BATTLE_TEST("Commander Tatsugiri will still take residual damage from a field effect while inside Dondozo")
{
    GIVEN {
        PLAYER(SPECIES_TATSUGIRI) { Ability(ABILITY_COMMANDER); }
        PLAYER(SPECIES_DONDOZO);
        OPPONENT(SPECIES_TYRANITAR) { Ability(ABILITY_SAND_STREAM); }
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { }
    } SCENE {
        ABILITY_POPUP(playerLeft, ABILITY_COMMANDER);
        MESSAGE("Tatsugiri was swallowed by Dondozo and became Dondozo's commander!");
        ABILITY_POPUP(opponentLeft, ABILITY_SAND_STREAM);
        MESSAGE("Dondozo is buffeted by the sandstorm!");
        MESSAGE("Tatsugiri is buffeted by the sandstorm!");
        MESSAGE("The opposing Wobbuffet is buffeted by the sandstorm!");
    }
}

DOUBLE_BATTLE_TEST("Commander Tatsugiri will still take poison damage if while inside Dondozo")
{
    GIVEN {
        PLAYER(SPECIES_TATSUGIRI) { Ability(ABILITY_COMMANDER); Status1(STATUS1_POISON); }
        PLAYER(SPECIES_DONDOZO);
        OPPONENT(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { }
    } SCENE {
        ABILITY_POPUP(playerLeft, ABILITY_COMMANDER);
        MESSAGE("Tatsugiri was swallowed by Dondozo and became Dondozo's commander!");
        MESSAGE("Tatsugiri was hurt by its poisoning!");
    }
}

DOUBLE_BATTLE_TEST("Commander Tatsugiri still avoids moves even when the attacker has No Guard")
{
    GIVEN {
        PLAYER(SPECIES_TATSUGIRI) { Ability(ABILITY_COMMANDER); }
        PLAYER(SPECIES_DONDOZO);
        OPPONENT(SPECIES_MACHAMP) { Ability(ABILITY_NO_GUARD); }
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(opponentLeft, MOVE_SCRATCH, target: playerLeft); }
    } SCENE {
        ABILITY_POPUP(playerLeft, ABILITY_COMMANDER);
        MESSAGE("Tatsugiri was swallowed by Dondozo and became Dondozo's commander!");
        NOT ANIMATION(ANIM_TYPE_MOVE, MOVE_SCRATCH, opponentLeft);
        MESSAGE("The opposing Machamp's attack missed!");
    }
}

DOUBLE_BATTLE_TEST("Commander cannot affect a Dondozo that was previously affected by Commander until it faints and revived")
{
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_DONDOZO);
        PLAYER(SPECIES_TATSUGIRI) { HP(1); Ability(ABILITY_COMMANDER); Status1(STATUS1_POISON); }
        PLAYER(SPECIES_TATSUGIRI) { Ability(ABILITY_COMMANDER); }
        OPPONENT(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(playerRight, MOVE_CELEBRATE); SWITCH(playerLeft, 2); SEND_OUT(playerLeft, 3); }
    } SCENE {
        ABILITY_POPUP(playerLeft, ABILITY_COMMANDER);
        MESSAGE("Tatsugiri was swallowed by Dondozo and became Dondozo's commander!");
        MESSAGE("Tatsugiri was hurt by its poisoning!");
        NONE_OF {
            ABILITY_POPUP(playerLeft, ABILITY_COMMANDER);
            MESSAGE("Tatsugiri was swallowed by Dondozo and became Dondozo's commander!");
        }
    }
}

DOUBLE_BATTLE_TEST("Commander prevents Whirlwind from working against Dondozo or Tatsugiri while it's active")
{
    GIVEN {
        PLAYER(SPECIES_TATSUGIRI) { Ability(ABILITY_COMMANDER); }
        PLAYER(SPECIES_DONDOZO);
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(opponentLeft, MOVE_WHIRLWIND, target: playerLeft); }
        TURN { MOVE(opponentRight, MOVE_WHIRLWIND, target: playerRight); }
    } SCENE {
        ABILITY_POPUP(playerLeft, ABILITY_COMMANDER);
        MESSAGE("Tatsugiri was swallowed by Dondozo and became Dondozo's commander!");
        MESSAGE("The opposing Wobbuffet used Whirlwind!");
        MESSAGE("But it failed!");
        MESSAGE("The opposing Wobbuffet used Whirlwind!");
        MESSAGE("But it failed!");
    }
}

DOUBLE_BATTLE_TEST("Commander prevents Red Card from working while Commander is active")
{
    GIVEN {
        PLAYER(SPECIES_TATSUGIRI) { Ability(ABILITY_COMMANDER); }
        PLAYER(SPECIES_DONDOZO);
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET) { Item(ITEM_RED_CARD); }
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(playerRight, MOVE_SCRATCH, target: opponentLeft); }
    } SCENE {
        ABILITY_POPUP(playerLeft, ABILITY_COMMANDER);
        MESSAGE("Tatsugiri was swallowed by Dondozo and became Dondozo's commander!");
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_HELD_ITEM_EFFECT, opponentLeft);
    } THEN {
        EXPECT(opponentLeft->item == ITEM_NONE);
        EXPECT(playerRight->species == SPECIES_DONDOZO);
    }

}

DOUBLE_BATTLE_TEST("Commander Tatsugiri is not damaged by a double target move if Dondozo faints")
{
    GIVEN {
        ASSUME(GetMoveTarget(MOVE_SURF) == MOVE_TARGET_FOES_AND_ALLY);
        PLAYER(SPECIES_DONDOZO) { HP(1); };
        PLAYER(SPECIES_TATSUGIRI) { Ability(ABILITY_COMMANDER); }
        PLAYER(SPECIES_WYNAUT);
        OPPONENT(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WYNAUT);
    } WHEN {
        TURN { MOVE(opponentLeft, MOVE_SURF); SEND_OUT(playerLeft, 2); }
    } SCENE {
        ABILITY_POPUP(playerRight, ABILITY_COMMANDER);
        MESSAGE("Tatsugiri was swallowed by Dondozo and became Dondozo's commander!");
        HP_BAR(playerLeft);
        HP_BAR(opponentRight);
        NOT HP_BAR(playerRight);
        MESSAGE("Dondozo fainted!");
    }
}

DOUBLE_BATTLE_TEST("Commander Tatsugiri takes no damage from multi-target damaging moves")
{
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_TATSUGIRI) { Ability(ABILITY_COMMANDER); }
        PLAYER(SPECIES_DONDOZO);
        OPPONENT(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WYNAUT);
    } WHEN {
        TURN { MOVE(opponentLeft, MOVE_SURF); MOVE(opponentRight, MOVE_SURF); SWITCH(playerLeft, 2); }
    } SCENE {
        ABILITY_POPUP(playerRight, ABILITY_COMMANDER);
        MESSAGE("Tatsugiri was swallowed by Dondozo and became Dondozo's commander!");

        ANIMATION(ANIM_TYPE_MOVE, MOVE_SURF, opponentLeft);
        HP_BAR(playerLeft);
        NOT HP_BAR(playerRight);
        HP_BAR(opponentRight);

        ANIMATION(ANIM_TYPE_MOVE, MOVE_SURF, opponentRight);
        HP_BAR(playerLeft);
        HP_BAR(opponentLeft);
        NOT HP_BAR(playerRight);
    }
}

DOUBLE_BATTLE_TEST("Commander doesn't prevent Transform from working on a Commander Tatsugiri")
{
    GIVEN {
        PLAYER(SPECIES_DONDOZO);
        PLAYER(SPECIES_TATSUGIRI) { Ability(ABILITY_COMMANDER); }
        OPPONENT(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(opponentRight, MOVE_TRANSFORM, target: playerRight); }
    } SCENE {
        ABILITY_POPUP(playerRight, ABILITY_COMMANDER);
        MESSAGE("Tatsugiri was swallowed by Dondozo and became Dondozo's commander!");
        ANIMATION(ANIM_TYPE_MOVE, MOVE_TRANSFORM, opponentRight);
    }
}

DOUBLE_BATTLE_TEST("Commander doesn't prevent Imposter from working on a Commander Tatsugiri")
{
    GIVEN {
        PLAYER(SPECIES_DONDOZO);
        PLAYER(SPECIES_TATSUGIRI) { Ability(ABILITY_COMMANDER); }
        OPPONENT(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_DITTO) { Ability(ABILITY_IMPOSTER); }
    } WHEN {
        TURN { }
        TURN { SWITCH(opponentLeft, 2); }
    } SCENE {
        ABILITY_POPUP(playerRight, ABILITY_COMMANDER);
        MESSAGE("Tatsugiri was swallowed by Dondozo and became Dondozo's commander!");
        ABILITY_POPUP(opponentLeft, ABILITY_IMPOSTER);
        MESSAGE("The opposing Ditto transformed into Tatsugiri using Imposter!");
    }
}

DOUBLE_BATTLE_TEST("Commander Tatsugiri is still affected by Perish Song while controlling Dondozo")
{
    GIVEN {
        PLAYER(SPECIES_DONDOZO);
        PLAYER(SPECIES_TATSUGIRI) { Ability(ABILITY_COMMANDER); }
        OPPONENT(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WYNAUT);
    } WHEN {
        TURN { MOVE(opponentLeft, MOVE_PERISH_SONG); }
        TURN {}
        TURN {}
        TURN {}
    } SCENE {
        ABILITY_POPUP(playerRight, ABILITY_COMMANDER);
        MESSAGE("Tatsugiri was swallowed by Dondozo and became Dondozo's commander!");
        ANIMATION(ANIM_TYPE_MOVE, MOVE_PERISH_SONG, opponentLeft);
        MESSAGE("All Pokémon that heard the song will faint in three turns!");
        MESSAGE("Dondozo's perish count fell to 0!");
        MESSAGE("Dondozo fainted!");
        MESSAGE("The opposing Wobbuffet's perish count fell to 0!");
        MESSAGE("The opposing Wobbuffet fainted!");
        NONE_OF {
            MESSAGE("Tatsugiri's perish count fell to 0!");
            MESSAGE("Tatsugiri fainted!");
        }
        MESSAGE("The opposing Wynaut's perish count fell to 0!");
        MESSAGE("The opposing Wynaut fainted!");
    }
}

DOUBLE_BATTLE_TEST("Commander Tatsugiri is still affected by Haze while controlling Dondozo")
{
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_TATSUGIRI) { Ability(ABILITY_COMMANDER); }
        PLAYER(SPECIES_DONDOZO);
        OPPONENT(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(playerRight, MOVE_SWORDS_DANCE); }
        TURN { SWITCH(playerLeft, 2); MOVE(opponentRight, MOVE_HAZE); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_SWORDS_DANCE, playerRight);
        ABILITY_POPUP(playerRight, ABILITY_COMMANDER);
        MESSAGE("Tatsugiri was swallowed by Dondozo and became Dondozo's commander!");
        ANIMATION(ANIM_TYPE_MOVE, MOVE_HAZE, opponentRight);
    } THEN {
        EXPECT_EQ(playerRight->statStages[STAT_ATK], DEFAULT_STAT_STAGE);
    }
}

DOUBLE_BATTLE_TEST("Commander Attacker is kept (Dondozo Left Slot)")
{
    GIVEN {
        ASSUME(GetMoveTarget(MOVE_SURF) == MOVE_TARGET_FOES_AND_ALLY);
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_TATSUGIRI) { Ability(ABILITY_COMMANDER); }
        PLAYER(SPECIES_DONDOZO);
        OPPONENT(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(opponentRight, MOVE_SCRATCH, target: opponentLeft); }
        TURN { SWITCH(playerLeft, 2); MOVE(opponentLeft, MOVE_SURF); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_SCRATCH, opponentRight);
        ABILITY_POPUP(playerRight, ABILITY_COMMANDER);
        MESSAGE("Tatsugiri was swallowed by Dondozo and became Dondozo's commander!");
        ANIMATION(ANIM_TYPE_MOVE, MOVE_SURF, opponentLeft);
        HP_BAR(playerLeft);
        HP_BAR(opponentRight);
        MESSAGE("The opposing Wobbuffet's attack missed!");
    }
}

DOUBLE_BATTLE_TEST("Commander Attacker is kept (Dondozo Right Slot)")
{
    GIVEN {
        ASSUME(GetMoveTarget(MOVE_SURF) == MOVE_TARGET_FOES_AND_ALLY);
        PLAYER(SPECIES_TATSUGIRI) { Ability(ABILITY_COMMANDER); }
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_DONDOZO);
        OPPONENT(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(opponentRight, MOVE_SCRATCH, target: opponentLeft); }
        TURN { SWITCH(playerRight, 2); MOVE(opponentLeft, MOVE_SURF); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_SCRATCH, opponentRight);
        ABILITY_POPUP(playerLeft, ABILITY_COMMANDER);
        MESSAGE("Tatsugiri was swallowed by Dondozo and became Dondozo's commander!");
        MESSAGE("The opposing Wobbuffet's attack missed!");
        ANIMATION(ANIM_TYPE_MOVE, MOVE_SURF, opponentLeft);
        HP_BAR(playerRight);
        HP_BAR(opponentRight);
    }
}

DOUBLE_BATTLE_TEST("Commander Tatsugiri does not attack if Dondozo faints the same turn it's switched in")
{
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_TATSUGIRI) { Ability(ABILITY_COMMANDER); }
        PLAYER(SPECIES_DONDOZO) { HP(1); }
        OPPONENT(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN {
            SWITCH(playerLeft, 2);
            MOVE(opponentLeft, MOVE_SCRATCH, target: playerLeft);
            MOVE(opponentRight, MOVE_SCRATCH, target: playerRight);
            MOVE(playerRight, MOVE_CELEBRATE);
            SEND_OUT(playerLeft, 0);
        }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_SCRATCH, opponentLeft);
        HP_BAR(playerLeft);
        MESSAGE("Dondozo fainted!");
        ANIMATION(ANIM_TYPE_MOVE, MOVE_SCRATCH, opponentRight);
        HP_BAR(playerRight);
        NOT MESSAGE("Tatsugiri used Celebrate!");
    }
}

DOUBLE_BATTLE_TEST("Commander Tatsugiri does not get hit by Dragon Darts when a commanded Dondozo faints")
{
    GIVEN {
        ASSUME(GetMoveEffect(MOVE_DRAGON_DARTS) == EFFECT_DRAGON_DARTS);
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_DONDOZO) { HP(1); }
        PLAYER(SPECIES_TATSUGIRI) { Ability(ABILITY_COMMANDER); }
        OPPONENT(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WYNAUT);
    } WHEN {
        TURN { SWITCH(playerLeft, 2); MOVE(opponentRight, MOVE_DRAGON_DARTS, target: playerRight); SEND_OUT(playerRight, 0); }
    } SCENE {
        MESSAGE("Tatsugiri was swallowed by Dondozo and became Dondozo's commander!");
        ANIMATION(ANIM_TYPE_MOVE, MOVE_DRAGON_DARTS, opponentRight);
        MESSAGE("Dondozo fainted!");
        NOT HP_BAR(playerLeft);
    }
}

DOUBLE_BATTLE_TEST("Commander Tatsugiri does not get hit by Dragon Darts when commanding Dondozo")
{
    bool32 targetPlayerRight;
    PARAMETRIZE { targetPlayerRight = TRUE; }
    PARAMETRIZE { targetPlayerRight = FALSE; }
    GIVEN {
        ASSUME(GetMoveEffect(MOVE_DRAGON_DARTS) == EFFECT_DRAGON_DARTS);
        PLAYER(SPECIES_TATSUGIRI) { Ability(ABILITY_COMMANDER); }
        PLAYER(SPECIES_DONDOZO);
        OPPONENT(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WYNAUT);
    } WHEN {
        if (targetPlayerRight == TRUE)
            TURN { MOVE(opponentRight, MOVE_DRAGON_DARTS, target: playerRight); }
        else
            TURN { MOVE(opponentRight, MOVE_DRAGON_DARTS, target: playerLeft); }
    } SCENE {
        MESSAGE("Tatsugiri was swallowed by Dondozo and became Dondozo's commander!");
        ANIMATION(ANIM_TYPE_MOVE, MOVE_DRAGON_DARTS, opponentRight);
        HP_BAR(playerRight);
        NOT HP_BAR(playerLeft);
        HP_BAR(playerRight);
        NOT HP_BAR(playerLeft);
    }
}

DOUBLE_BATTLE_TEST("Commander will not activate if Dondozo fainted right before Tatsugiri came in")
{
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_DONDOZO) { HP(1); }
        PLAYER(SPECIES_TATSUGIRI) { Ability(ABILITY_COMMANDER); }
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(opponentRight, MOVE_SCRATCH, target: playerRight); MOVE(playerLeft, MOVE_SHED_TAIL); SEND_OUT(playerLeft, 2); SEND_OUT(playerRight, 3); }
    } SCENE {
        NOT ABILITY_POPUP(playerLeft, ABILITY_COMMANDER);
    }
}

DOUBLE_BATTLE_TEST("Commander prevent Dondozo from switch out by Dragon Tail")
{
    GIVEN {
        ASSUME(GetMoveEffect(MOVE_DRAGON_TAIL) == EFFECT_HIT_SWITCH_TARGET);
        PLAYER(SPECIES_DONDOZO);
        PLAYER(SPECIES_TATSUGIRI) { Ability(ABILITY_COMMANDER); }
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(opponentLeft, MOVE_DRAGON_TAIL, target: playerLeft); }
    } SCENE {
        ABILITY_POPUP(playerRight, ABILITY_COMMANDER);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_DRAGON_TAIL, opponentLeft);
        NOT MESSAGE("Wobbuffet was dragged out!");
    }
}
