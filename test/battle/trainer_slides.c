#include "global.h"
#include "test/battle.h"
#include "battle_setup.h"

SINGLE_BATTLE_TEST("Trainer Slide: Before First Turn")
{
    gBattleTestRunnerState->data.recordedBattle.opponentA = TRAINER_SLIDE_BEFORE_FIRST_TURN;

    GIVEN {
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { }
    } SCENE {
        MESSAGE("This message plays before the first turn.{PAUSE_UNTIL_PRESS}");
    }
}

SINGLE_BATTLE_TEST("Trainer Slide: Player Lands First Critical Hit")
{
    gBattleTestRunnerState->data.recordedBattle.opponentA = TRAINER_SLIDE_PLAYER_LANDS_FIRST_CRITICAL_HIT;

    GIVEN {
        ASSUME(GetMoveEffect(MOVE_LASER_FOCUS) == EFFECT_LASER_FOCUS);
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(player, MOVE_LASER_FOCUS); }
        TURN { MOVE(player, MOVE_SCRATCH); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_LASER_FOCUS, player);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_SCRATCH, player);
        MESSAGE("A critical hit!");
        MESSAGE("This message plays after the player lands their first critical hit.{PAUSE_UNTIL_PRESS}");
    }
}

SINGLE_BATTLE_TEST("Trainer Slide: Enemy Lands First Critical Hit")
{
    gBattleTestRunnerState->data.recordedBattle.opponentA = TRAINER_SLIDE_ENEMY_LANDS_FIRST_CRITICAL_HIT;

    GIVEN {
        ASSUME(GetMoveEffect(MOVE_LASER_FOCUS) == EFFECT_LASER_FOCUS);
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(opponent, MOVE_LASER_FOCUS); }
        TURN { MOVE(opponent, MOVE_SCRATCH); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_LASER_FOCUS, opponent);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_SCRATCH, opponent);
        MESSAGE("A critical hit!");
        MESSAGE("This message plays after the enemy lands their first critical hit.{PAUSE_UNTIL_PRESS}");
    }
}

SINGLE_BATTLE_TEST("Trainer Slide: Player Lands First STAB Hit")
{
    gBattleTestRunnerState->data.recordedBattle.opponentA = TRAINER_SLIDE_PLAYER_LANDS_FIRST_STAB_MOVE;

    GIVEN {
        ASSUME((GetMoveType(MOVE_VINE_WHIP)) == gSpeciesInfo[SPECIES_BULBASAUR].types[0]);
        PLAYER(SPECIES_BULBASAUR);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(player, MOVE_VINE_WHIP); }
    } SCENE {
        MESSAGE("Bulbasaur used Vine Whip!");
        ANIMATION(ANIM_TYPE_MOVE, MOVE_VINE_WHIP, player);
        MESSAGE("Player lands their first STAB move.{PAUSE_UNTIL_PRESS}");
    }
}

SINGLE_BATTLE_TEST("Trainer Slide: Player Lands First Super Effective Hit")
{
    gBattleTestRunnerState->data.recordedBattle.opponentA = TRAINER_SLIDE_PLAYER_LANDS_FIRST_SUPER_EFFECTIVE_HIT;

    GIVEN {
        ASSUME(GetMoveType(MOVE_BITE) == TYPE_DARK);
        ASSUME(gSpeciesInfo[SPECIES_WOBBUFFET].types[0] == TYPE_PSYCHIC);
        ASSUME(gSpeciesInfo[SPECIES_WOBBUFFET].types[0] == TYPE_PSYCHIC);
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(player, MOVE_BITE); }
    } SCENE {
        MESSAGE("It's super effective!");
        MESSAGE("This message plays after the player lands their first super effective hit.{PAUSE_UNTIL_PRESS}");
    }
}

SINGLE_BATTLE_TEST("Trainer Slide: Player Lands First Down")
{
    gBattleTestRunnerState->data.recordedBattle.opponentA = TRAINER_SLIDE_PLAYER_LANDS_FIRST_DOWN;

    GIVEN {
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WYNAUT);
    } WHEN {
        TURN { MOVE(opponent, MOVE_HEALING_WISH); SEND_OUT(opponent,1); }
    } SCENE {
        MESSAGE("The opposing Wobbuffet fainted!");
        MESSAGE("This message plays after the player KOs one enemy mon.{PAUSE_UNTIL_PRESS}");
    }
}

SINGLE_BATTLE_TEST("Trainer Slide: Enemy Mon Unaffected")
{
    gBattleTestRunnerState->data.recordedBattle.opponentA = TRAINER_SLIDE_ENEMY_MON_UNAFFECTED;
    GIVEN {
        ASSUME(B_SHEER_COLD_IMMUNITY >= GEN_7);
        ASSUME(gSpeciesInfo[SPECIES_GLALIE].types[0] == TYPE_ICE);
        PLAYER(SPECIES_WYNAUT);
        OPPONENT(SPECIES_GLALIE);
    } WHEN {
        TURN { MOVE(player, MOVE_SHEER_COLD); }
    } SCENE {
        NOT ANIMATION(ANIM_TYPE_MOVE, MOVE_SHEER_COLD, player);
        MESSAGE("It doesn't affect the opposing Glalie…");
        MESSAGE("Player attacked enemy with ineffective move.{PAUSE_UNTIL_PRESS}");
    }
}

SINGLE_BATTLE_TEST("Trainer Slide: Last Switchin")
{
    gBattleTestRunnerState->data.recordedBattle.opponentA = TRAINER_SLIDE_LAST_SWITCHIN;
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WYNAUT);
    } WHEN {
        TURN { MOVE(opponent, MOVE_HEALING_WISH); SEND_OUT(opponent,1); }
    } SCENE {
        MESSAGE("The opposing Wobbuffet fainted!");
        MESSAGE("This message plays after the enemy switches in their last Pokemon.{PAUSE_UNTIL_PRESS}");
    }
}

SINGLE_BATTLE_TEST("Trainer Slide: Last Half Hp")
{
    gBattleTestRunnerState->data.recordedBattle.opponentA = TRAINER_SLIDE_LAST_HALF_HP;
    GIVEN {
        ASSUME(GetMoveEffect(MOVE_SUPER_FANG) == EFFECT_SUPER_FANG);
        ASSUME(gSpeciesInfo[SPECIES_WOBBUFFET].baseHP == 190);
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(player, MOVE_SUPER_FANG); }
    } SCENE {
        MESSAGE("Enemy last Mon has < 51% HP.{PAUSE_UNTIL_PRESS}");
    }
}

SINGLE_BATTLE_TEST("Trainer Slide: Last Low Hp")
{
    gBattleTestRunnerState->data.recordedBattle.opponentA = TRAINER_SLIDE_LAST_LOW_HP;
    GIVEN {
        ASSUME(GetMoveEffect(MOVE_FALSE_SWIPE) == EFFECT_FALSE_SWIPE);
        PLAYER(SPECIES_WOBBUFFET) { Attack(999);}
        OPPONENT(SPECIES_WOBBUFFET) { Defense(1);}
    } WHEN {
        TURN { MOVE(player, MOVE_FALSE_SWIPE); }
    } SCENE {
        MESSAGE("Enemy last Mon has < 26% HP.{PAUSE_UNTIL_PRESS}");
    }
}

SINGLE_BATTLE_TEST("Trainer Slide: Mega Evolution")
{
    gBattleTestRunnerState->data.recordedBattle.opponentA = TRAINER_SLIDE_MEGA_EVOLUTION;

    GIVEN {
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_LOPUNNY) {Item(ITEM_LOPUNNITE); };
    } WHEN {
        TURN { MOVE(opponent, MOVE_CELEBRATE, gimmick: GIMMICK_MEGA); }
    } SCENE {
        MESSAGE("This message plays before the enemy activates the Mega Evolution gimmick.{PAUSE_UNTIL_PRESS}");
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_MEGA_EVOLUTION, opponent);
        MESSAGE("The opposing Lopunny has Mega Evolved into Mega Lopunny!");
    }
}

SINGLE_BATTLE_TEST("Trainer Slide: Z Move")
{
    gBattleTestRunnerState->data.recordedBattle.opponentA = TRAINER_SLIDE_Z_MOVE;
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET) { Item(ITEM_NORMALIUM_Z); }
    } WHEN {
        TURN { MOVE(opponent, MOVE_QUICK_ATTACK, gimmick: GIMMICK_Z_MOVE); }
    } SCENE {
        MESSAGE("This message plays before the enemy activates the Z-Move gimmick.{PAUSE_UNTIL_PRESS}");
        MESSAGE("The opposing Wobbuffet surrounded itself with its Z-Power!");
        MESSAGE("The opposing Wobbuffet unleashes its full-force Z-Move!");
        ANIMATION(ANIM_TYPE_MOVE, MOVE_BREAKNECK_BLITZ, opponent);
    }
}

SINGLE_BATTLE_TEST("Trainer Slide: Dynamax")
{
    gBattleTestRunnerState->data.recordedBattle.opponentA = TRAINER_SLIDE_DYNAMAX;

    GIVEN {
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
            TURN { MOVE(opponent, MOVE_CELEBRATE, gimmick: GIMMICK_DYNAMAX); }
    } SCENE {
        MESSAGE("This message plays before the enemy activates the Dynamax gimmick.{PAUSE_UNTIL_PRESS}");
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_DYNAMAX_GROWTH, opponent);
    }
}
