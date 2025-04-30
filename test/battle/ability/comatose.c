#include "global.h"
#include "test/battle.h"

SINGLE_BATTLE_TEST("Comatose prevents status-inducing moves")
{
    u32 move;

    PARAMETRIZE { move = MOVE_TOXIC; }
    PARAMETRIZE { move = MOVE_POISONPOWDER; }
    PARAMETRIZE { move = MOVE_SLEEP_POWDER; }
    PARAMETRIZE { move = MOVE_THUNDER_WAVE; }

    GIVEN {
        PLAYER(SPECIES_KOMALA) { Ability(ABILITY_COMATOSE); }
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(opponent, move); }
    } SCENE {
        MESSAGE("Komala is drowsing!");

        NOT ANIMATION(ANIM_TYPE_MOVE, move, opponent);
        ABILITY_POPUP(player, ABILITY_COMATOSE);
        MESSAGE("It doesn't affect Komala…");
    }
}

SINGLE_BATTLE_TEST("Comatose may be suppressed if pokemon transformed into a pokemon with Comatose ability and was under the effects of Gastro Acid")
{
    u32 move;

    PARAMETRIZE { move = MOVE_TOXIC; }
    PARAMETRIZE { move = MOVE_POISONPOWDER; }
    PARAMETRIZE { move = MOVE_SLEEP_POWDER; }
    PARAMETRIZE { move = MOVE_THUNDER_WAVE; }

    GIVEN {
        // FIXME: Explicit moves currently required here because Ditto
        // expects to find Celebrate in slot 1 during the second turn
        // (after transforming).
        PLAYER(SPECIES_KOMALA) { Ability(ABILITY_COMATOSE); Speed(30); Moves(MOVE_CELEBRATE, MOVE_GASTRO_ACID, move); }
        OPPONENT(SPECIES_DITTO) { Speed(20); }
    } WHEN {
        TURN { MOVE(player, MOVE_GASTRO_ACID); MOVE(opponent, MOVE_TRANSFORM); }
        TURN { MOVE(player, move); }
    } SCENE {
        MESSAGE("Komala is drowsing!");
        MESSAGE("Komala used Gastro Acid!");
        MESSAGE("The opposing Ditto used Transform!");
        MESSAGE("The opposing Ditto transformed into Komala!");

        ANIMATION(ANIM_TYPE_MOVE, move, player);
        if (move == MOVE_POISONPOWDER)      { STATUS_ICON(opponent, poison: TRUE); }
        else if (move == MOVE_TOXIC)        { STATUS_ICON(opponent, badPoison: TRUE); }
        else if (move == MOVE_THUNDER_WAVE) { STATUS_ICON(opponent, paralysis: TRUE); }
        else if (move == MOVE_SLEEP_POWDER) { STATUS_ICON(opponent, sleep: TRUE); }
    }
}

SINGLE_BATTLE_TEST("Comatose pokemon doesn't get poisoned by Toxic Spikes on switch-in")
{
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_KOMALA) { Ability(ABILITY_COMATOSE); }
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(opponent, MOVE_TOXIC_SPIKES); }
        TURN { SWITCH(player, 1); }
    } SCENE {
        NOT STATUS_ICON(player, STATUS1_POISON);
        ABILITY_POPUP(player, ABILITY_COMATOSE);
        NOT HP_BAR(player);
    }
}

SINGLE_BATTLE_TEST("Comatose pokemon don't get poisoned by Toxic Spikes on switch-in if forced in by phazing with Mold Breaker")
{
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_KOMALA) { Ability(ABILITY_COMATOSE); }
        OPPONENT(SPECIES_PINSIR) { Ability(ABILITY_MOLD_BREAKER); }
    } WHEN {
        TURN { MOVE(opponent, MOVE_TOXIC_SPIKES); }
        TURN { MOVE(opponent, MOVE_DRAGON_TAIL); }
    } SCENE {
        NOT STATUS_ICON(player, STATUS1_POISON);
        ABILITY_POPUP(player, ABILITY_COMATOSE);
        NOT HP_BAR(player);
    }
}
