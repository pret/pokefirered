#include "global.h"
#include "test/battle.h"
#include "battle_setup.h"

// SINGLES TESTS START
AI_SINGLE_BATTLE_TEST("Trainer Slide: Singles: Before First Turn")
{
    GIVEN {
        FLAG_SET(TESTING_FLAG_TRAINER_SLIDES);
        VAR_SET(TESTING_VAR_TRAINER_SLIDES, TRAINER_SLIDE_BEFORE_FIRST_TURN);
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET) { Moves(MOVE_CELEBRATE); }
    } WHEN {
        TURN {}
    } SCENE {
        MESSAGE("Trainer A: This message plays before the first turn.{PAUSE_UNTIL_PRESS}");
    }
}

AI_SINGLE_BATTLE_TEST("Trainer Slide: Singles: Player Lands First Critical Hit")
{
    GIVEN {
        FLAG_SET(TESTING_FLAG_TRAINER_SLIDES);
        VAR_SET(TESTING_VAR_TRAINER_SLIDES, TRAINER_SLIDE_PLAYER_LANDS_FIRST_CRITICAL_HIT);
        ASSUME(GetMoveEffect(MOVE_LASER_FOCUS) == EFFECT_LASER_FOCUS);
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET) { Moves(MOVE_CELEBRATE); }
    } WHEN {
        TURN { MOVE(player, MOVE_LASER_FOCUS); }
        TURN { MOVE(player, MOVE_SCRATCH); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_LASER_FOCUS, player);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_SCRATCH, player);
        MESSAGE("A critical hit!");
        MESSAGE("Trainer A: This message plays after the player lands their first critical hit.{PAUSE_UNTIL_PRESS}");
    }
}

AI_SINGLE_BATTLE_TEST("Trainer Slide: Singles: Enemy Lands First Critical Hit")
{
    GIVEN {
        FLAG_SET(TESTING_FLAG_TRAINER_SLIDES);
        VAR_SET(TESTING_VAR_TRAINER_SLIDES, TRAINER_SLIDE_ENEMY_LANDS_FIRST_CRITICAL_HIT);
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { EXPECT_MOVE(opponent, MOVE_SURGING_STRIKES); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_SURGING_STRIKES, opponent);
        MESSAGE("A critical hit!");
        MESSAGE("Trainer A: This message plays after the enemy lands their first critical hit.{PAUSE_UNTIL_PRESS}");
    }
}

AI_SINGLE_BATTLE_TEST("Trainer Slide: Singles: Player Lands First STAB Hit")
{
    GIVEN {
        FLAG_SET(TESTING_FLAG_TRAINER_SLIDES);
        VAR_SET(TESTING_VAR_TRAINER_SLIDES, TRAINER_SLIDE_PLAYER_LANDS_FIRST_STAB_MOVE);
        ASSUME((GetMoveType(MOVE_VINE_WHIP)) == GetSpeciesType(SPECIES_BULBASAUR, 0));
        PLAYER(SPECIES_BULBASAUR);
        OPPONENT(SPECIES_WOBBUFFET) { Moves(MOVE_CELEBRATE); }
    } WHEN {
        TURN { MOVE(player, MOVE_VINE_WHIP); }
    } SCENE {
        MESSAGE("Bulbasaur used Vine Whip!");
        ANIMATION(ANIM_TYPE_MOVE, MOVE_VINE_WHIP, player);
        MESSAGE("Trainer A: Player lands their first STAB move.{PAUSE_UNTIL_PRESS}");
    }
}

AI_SINGLE_BATTLE_TEST("Trainer Slide: Singles: Player Lands First Super Effective Hit")
{
    GIVEN {
        FLAG_SET(TESTING_FLAG_TRAINER_SLIDES);
        VAR_SET(TESTING_VAR_TRAINER_SLIDES, TRAINER_SLIDE_PLAYER_LANDS_FIRST_SUPER_EFFECTIVE_HIT);
        ASSUME(GetMoveType(MOVE_BITE) == TYPE_DARK);
        ASSUME(GetSpeciesType(SPECIES_WOBBUFFET, 0) == TYPE_PSYCHIC);
        ASSUME(GetSpeciesType(SPECIES_WOBBUFFET, 0) == TYPE_PSYCHIC);
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET) { Moves(MOVE_CELEBRATE); }
    } WHEN {
        TURN { MOVE(player, MOVE_BITE); }
    } SCENE {
        MESSAGE("It's super effective!");
        MESSAGE("Trainer A: This message plays after the player lands their first super effective hit.{PAUSE_UNTIL_PRESS}");
    }
}

AI_SINGLE_BATTLE_TEST("Trainer Slide: Singles: Player Lands First Down")
{
    GIVEN {
        FLAG_SET(TESTING_FLAG_TRAINER_SLIDES);
        VAR_SET(TESTING_VAR_TRAINER_SLIDES, TRAINER_SLIDE_PLAYER_LANDS_FIRST_DOWN);
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WYNAUT) { Moves(MOVE_CELEBRATE); }
    } WHEN {
        TURN { EXPECT_MOVE(opponent, MOVE_HEALING_WISH); EXPECT_SEND_OUT(opponent,1); }
    } SCENE {
        MESSAGE("The opposing Wobbuffet fainted!");
        MESSAGE("Trainer A: This message plays after the player KOs one enemy mon.{PAUSE_UNTIL_PRESS}");
    }
}

AI_SINGLE_BATTLE_TEST("Trainer Slide: Singles: Enemy Mon Unaffected")
{
    GIVEN {
        FLAG_SET(TESTING_FLAG_TRAINER_SLIDES);
        VAR_SET(TESTING_VAR_TRAINER_SLIDES, TRAINER_SLIDE_ENEMY_MON_UNAFFECTED);
        WITH_CONFIG(CONFIG_SHEER_COLD_IMMUNITY, GEN_7);
        ASSUME(GetSpeciesType(SPECIES_GLALIE, 0) == TYPE_ICE);
        PLAYER(SPECIES_WYNAUT);
        OPPONENT(SPECIES_GLALIE) { Moves(MOVE_CELEBRATE); }
    } WHEN {
        TURN { MOVE(player, MOVE_SHEER_COLD); }
    } SCENE {
        NOT ANIMATION(ANIM_TYPE_MOVE, MOVE_SHEER_COLD, player);
        MESSAGE("It doesn't affect the opposing Glalie…");
        MESSAGE("Trainer A: Player attacked enemy with ineffective move.{PAUSE_UNTIL_PRESS}");
    }
}

AI_SINGLE_BATTLE_TEST("Trainer Slide: Singles: Last Switchin")
{
    GIVEN {
        FLAG_SET(TESTING_FLAG_TRAINER_SLIDES);
        VAR_SET(TESTING_VAR_TRAINER_SLIDES, TRAINER_SLIDE_LAST_SWITCHIN);
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WYNAUT) { Moves(MOVE_CELEBRATE); }
    } WHEN {
        TURN { EXPECT_MOVE(opponent, MOVE_HEALING_WISH); EXPECT_SEND_OUT(opponent,1); }
    } SCENE {
        MESSAGE("The opposing Wobbuffet fainted!");
        MESSAGE("Trainer A: This message plays after the enemy switches in their last Pokemon.{PAUSE_UNTIL_PRESS}");
    }
}

AI_SINGLE_BATTLE_TEST("Trainer Slide: Singles: Last Half Hp")
{
    GIVEN {
        FLAG_SET(TESTING_FLAG_TRAINER_SLIDES);
        VAR_SET(TESTING_VAR_TRAINER_SLIDES, TRAINER_SLIDE_LAST_HALF_HP);
        ASSUME(GetMoveEffect(MOVE_SUPER_FANG) == EFFECT_FIXED_PERCENT_DAMAGE);
        ASSUME(GetSpeciesBaseHP(SPECIES_WOBBUFFET) == 190);
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET) { Moves(MOVE_CELEBRATE); }
    } WHEN {
        TURN { MOVE(player, MOVE_SUPER_FANG); }
    } SCENE {
        MESSAGE("Trainer A: Enemy last Mon has < 51% HP.{PAUSE_UNTIL_PRESS}");
    }
}

AI_SINGLE_BATTLE_TEST("Trainer Slide: Singles: Last Low Hp")
{
    GIVEN {
        FLAG_SET(TESTING_FLAG_TRAINER_SLIDES);
        VAR_SET(TESTING_VAR_TRAINER_SLIDES, TRAINER_SLIDE_LAST_LOW_HP);
        ASSUME(GetMoveEffect(MOVE_FALSE_SWIPE) == EFFECT_FALSE_SWIPE);
        PLAYER(SPECIES_WOBBUFFET) { Attack(999); Speed(1); }
        OPPONENT(SPECIES_WOBBUFFET) { Defense(1); Speed(2); Moves(MOVE_CELEBRATE); }
    } WHEN {
        TURN { MOVE(player, MOVE_FALSE_SWIPE); }
    } SCENE {
        MESSAGE("Trainer A: Enemy last Mon has < 26% HP.{PAUSE_UNTIL_PRESS}");
    }
}

AI_SINGLE_BATTLE_TEST("Trainer Slide: Singles: Mega Evolution")
{
    GIVEN {
        FLAG_SET(TESTING_FLAG_TRAINER_SLIDES);
        VAR_SET(TESTING_VAR_TRAINER_SLIDES, TRAINER_SLIDE_MEGA_EVOLUTION);
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_LOPUNNY) { Item(ITEM_LOPUNNITE); Moves(MOVE_CELEBRATE); }
    } WHEN {
        TURN { EXPECT_MOVE(opponent, MOVE_CELEBRATE, gimmick: GIMMICK_MEGA); }
    } SCENE {
        MESSAGE("Trainer A: This message plays before the enemy activates the Mega Evolution gimmick.{PAUSE_UNTIL_PRESS}");
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_MEGA_EVOLUTION, opponent);
        MESSAGE("The opposing Lopunny has Mega Evolved into Mega Lopunny!");
    }
}

AI_SINGLE_BATTLE_TEST("Trainer Slide: Singles: Z Move")
{
    GIVEN {
        FLAG_SET(TESTING_FLAG_TRAINER_SLIDES);
        VAR_SET(TESTING_VAR_TRAINER_SLIDES, TRAINER_SLIDE_Z_MOVE);
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET) { Item(ITEM_NORMALIUM_Z); }
    } WHEN {
        TURN { EXPECT_MOVE(opponent, MOVE_QUICK_ATTACK, gimmick: GIMMICK_Z_MOVE); }
    } SCENE {
        MESSAGE("Trainer A: This message plays before the enemy activates the Z-Move gimmick.{PAUSE_UNTIL_PRESS}");
        MESSAGE("The opposing Wobbuffet surrounded itself with its Z-Power!");
        MESSAGE("The opposing Wobbuffet unleashes its full-force Z-Move!");
        ANIMATION(ANIM_TYPE_MOVE, MOVE_BREAKNECK_BLITZ, opponent);
    }
}

AI_SINGLE_BATTLE_TEST("Trainer Slide: Singles: Dynamax")
{
    GIVEN {
        FLAG_SET(TESTING_FLAG_TRAINER_SLIDES);
        VAR_SET(TESTING_VAR_TRAINER_SLIDES, TRAINER_SLIDE_DYNAMAX);
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET) { Moves(MOVE_CELEBRATE); }
    } WHEN {
            TURN { EXPECT_MOVE(opponent, MOVE_CELEBRATE, gimmick: GIMMICK_DYNAMAX); }
    } SCENE {
        MESSAGE("Trainer A: This message plays before the enemy activates the Dynamax gimmick.{PAUSE_UNTIL_PRESS}");
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_DYNAMAX_GROWTH, opponent);
    }
}
// SINGLES TESTS END

// DOUBLES TESTS START - Tests message activation & message not activating twice
AI_DOUBLE_BATTLE_TEST("Trainer Slide: Doubles: Before First Turn")
{
    GIVEN {
        FLAG_SET(TESTING_FLAG_TRAINER_SLIDES);
        VAR_SET(TESTING_VAR_TRAINER_SLIDES, TRAINER_SLIDE_BEFORE_FIRST_TURN);
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET) { Moves(MOVE_CELEBRATE); }
        OPPONENT(SPECIES_WOBBUFFET) { Moves(MOVE_CELEBRATE); }
    } WHEN {
        TURN { }
    } SCENE {
        MESSAGE("Trainer A: This message plays before the first turn.{PAUSE_UNTIL_PRESS}");
        ANIMATION(ANIM_TYPE_MOVE, MOVE_CELEBRATE, playerLeft);
        NONE_OF {
            MESSAGE("Trainer A: This message plays before the first turn.{PAUSE_UNTIL_PRESS}");
        }
    }
}

AI_DOUBLE_BATTLE_TEST("Trainer Slide: Doubles: Player Lands First Critical Hit")
{
    GIVEN {
        FLAG_SET(TESTING_FLAG_TRAINER_SLIDES);
        VAR_SET(TESTING_VAR_TRAINER_SLIDES, TRAINER_SLIDE_PLAYER_LANDS_FIRST_CRITICAL_HIT);
        ASSUME(GetMoveEffect(MOVE_LASER_FOCUS) == EFFECT_LASER_FOCUS);
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET) { Moves(MOVE_CELEBRATE); }
        OPPONENT(SPECIES_WOBBUFFET) { Moves(MOVE_CELEBRATE); }
    } WHEN {
        TURN { MOVE(playerLeft, MOVE_LASER_FOCUS); }
        TURN { MOVE(playerLeft, MOVE_SCRATCH, target: opponentLeft); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_LASER_FOCUS, playerLeft);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_SCRATCH, playerLeft);
        MESSAGE("A critical hit!");
        MESSAGE("Trainer A: This message plays after the player lands their first critical hit.{PAUSE_UNTIL_PRESS}");
        NONE_OF {
            MESSAGE("Trainer A: This message plays after the player lands their first critical hit.{PAUSE_UNTIL_PRESS}");
        }
    }
}

AI_DOUBLE_BATTLE_TEST("Trainer Slide: Doubles: Enemy Lands First Critical Hit")
{
    GIVEN {
        FLAG_SET(TESTING_FLAG_TRAINER_SLIDES);
        VAR_SET(TESTING_VAR_TRAINER_SLIDES, TRAINER_SLIDE_ENEMY_LANDS_FIRST_CRITICAL_HIT);
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET) { Moves(MOVE_CELEBRATE); }
    } WHEN {
        TURN { EXPECT_MOVE(opponentLeft, MOVE_SURGING_STRIKES, target: playerLeft); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_SURGING_STRIKES, opponentLeft);
        MESSAGE("A critical hit!");
        MESSAGE("Trainer A: This message plays after the enemy lands their first critical hit.{PAUSE_UNTIL_PRESS}");
        NONE_OF {
            MESSAGE("Trainer A: This message plays after the enemy lands their first critical hit.{PAUSE_UNTIL_PRESS}");
        }
    }
}

AI_DOUBLE_BATTLE_TEST("Trainer Slide: Doubles: Player Lands First STAB Hit")
{
    GIVEN {
        FLAG_SET(TESTING_FLAG_TRAINER_SLIDES);
        VAR_SET(TESTING_VAR_TRAINER_SLIDES, TRAINER_SLIDE_PLAYER_LANDS_FIRST_STAB_MOVE);
        ASSUME((GetMoveType(MOVE_VINE_WHIP)) == GetSpeciesType(SPECIES_BULBASAUR, 0));
        PLAYER(SPECIES_BULBASAUR);
        PLAYER(SPECIES_BULBASAUR);
        OPPONENT(SPECIES_WOBBUFFET) { Moves(MOVE_CELEBRATE); }
        OPPONENT(SPECIES_WOBBUFFET) { Moves(MOVE_CELEBRATE); }
    } WHEN {
        TURN { MOVE(playerLeft, MOVE_VINE_WHIP, target: opponentLeft); }
    } SCENE {
        MESSAGE("Bulbasaur used Vine Whip!");
        ANIMATION(ANIM_TYPE_MOVE, MOVE_VINE_WHIP, playerLeft);
        MESSAGE("Trainer A: Player lands their first STAB move.{PAUSE_UNTIL_PRESS}");
        NONE_OF {
            MESSAGE("Trainer A: Player lands their first STAB move.{PAUSE_UNTIL_PRESS}");
        }
    }
}

AI_DOUBLE_BATTLE_TEST("Trainer Slide: Doubles: Player Lands First Super Effective Hit")
{
    GIVEN {
        FLAG_SET(TESTING_FLAG_TRAINER_SLIDES);
        VAR_SET(TESTING_VAR_TRAINER_SLIDES, TRAINER_SLIDE_PLAYER_LANDS_FIRST_SUPER_EFFECTIVE_HIT);
        ASSUME(GetMoveType(MOVE_BITE) == TYPE_DARK);
        ASSUME(GetSpeciesType(SPECIES_WOBBUFFET, 0) == TYPE_PSYCHIC);
        ASSUME(GetSpeciesType(SPECIES_WOBBUFFET, 0) == TYPE_PSYCHIC);
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET) { Moves(MOVE_CELEBRATE); }
        OPPONENT(SPECIES_WOBBUFFET) { Moves(MOVE_CELEBRATE); }
    } WHEN {
        TURN { MOVE(playerLeft, MOVE_BITE, target: opponentLeft); }
    } SCENE {
        MESSAGE("It's super effective!");
        MESSAGE("Trainer A: This message plays after the player lands their first super effective hit.{PAUSE_UNTIL_PRESS}");
        NONE_OF {
            MESSAGE("Trainer A: This message plays after the player lands their first super effective hit.{PAUSE_UNTIL_PRESS}");
        }
    }
}

AI_DOUBLE_BATTLE_TEST("Trainer Slide: Doubles: Player Lands First Down")
{
    GIVEN {
        FLAG_SET(TESTING_FLAG_TRAINER_SLIDES);
        VAR_SET(TESTING_VAR_TRAINER_SLIDES, TRAINER_SLIDE_PLAYER_LANDS_FIRST_DOWN);
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET) { Moves(MOVE_CELEBRATE); }
        OPPONENT(SPECIES_WYNAUT) { Moves(MOVE_CELEBRATE); }
    } WHEN {
        TURN { EXPECT_MOVE(opponentLeft, MOVE_HEALING_WISH); EXPECT_SEND_OUT(opponentLeft,2); }
    } SCENE {
        MESSAGE("The opposing Wobbuffet fainted!");
        MESSAGE("Trainer A: This message plays after the player KOs one enemy mon.{PAUSE_UNTIL_PRESS}");
        NONE_OF {
            MESSAGE("Trainer A: This message plays after the player KOs one enemy mon.{PAUSE_UNTIL_PRESS}");
        }
    }
}

AI_DOUBLE_BATTLE_TEST("Trainer Slide: Doubles: Enemy Mon Unaffected")
{
    GIVEN {
        FLAG_SET(TESTING_FLAG_TRAINER_SLIDES);
        VAR_SET(TESTING_VAR_TRAINER_SLIDES, TRAINER_SLIDE_ENEMY_MON_UNAFFECTED);
        WITH_CONFIG(CONFIG_SHEER_COLD_IMMUNITY, GEN_7);
        ASSUME(GetSpeciesType(SPECIES_GLALIE, 0) == TYPE_ICE);
        PLAYER(SPECIES_WYNAUT);
        PLAYER(SPECIES_WYNAUT);
        OPPONENT(SPECIES_GLALIE) { Moves(MOVE_CELEBRATE); }
        OPPONENT(SPECIES_GLALIE) { Moves(MOVE_CELEBRATE); }
    } WHEN {
        TURN { MOVE(playerLeft, MOVE_SHEER_COLD); }
    } SCENE {
        NOT ANIMATION(ANIM_TYPE_MOVE, MOVE_SHEER_COLD, playerLeft);
        MESSAGE("It doesn't affect the opposing Glalie…");
        MESSAGE("Trainer A: Player attacked enemy with ineffective move.{PAUSE_UNTIL_PRESS}");
        NONE_OF {
            MESSAGE("Trainer A: Player attacked enemy with ineffective move.{PAUSE_UNTIL_PRESS}");
        }
    }
}

AI_DOUBLE_BATTLE_TEST("Trainer Slide: Doubles: Last Switchin")
{
    GIVEN {
        FLAG_SET(TESTING_FLAG_TRAINER_SLIDES);
        VAR_SET(TESTING_VAR_TRAINER_SLIDES, TRAINER_SLIDE_LAST_SWITCHIN);
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET) { Moves(MOVE_CELEBRATE); }
        OPPONENT(SPECIES_WYNAUT);
    } WHEN {
        TURN { EXPECT_MOVE(opponentLeft, MOVE_HEALING_WISH); EXPECT_SEND_OUT(opponentLeft,2); }
    } SCENE {
        MESSAGE("The opposing Wobbuffet fainted!");
        MESSAGE("Trainer A: This message plays after the enemy switches in their last Pokemon.{PAUSE_UNTIL_PRESS}");
        NONE_OF {
            MESSAGE("Trainer A: This message plays after the enemy switches in their last Pokemon.{PAUSE_UNTIL_PRESS}");
        }
    }
}

AI_DOUBLE_BATTLE_TEST("Trainer Slide: Doubles: Last Half Hp")
{
    GIVEN {
        FLAG_SET(TESTING_FLAG_TRAINER_SLIDES);
        VAR_SET(TESTING_VAR_TRAINER_SLIDES, TRAINER_SLIDE_LAST_HALF_HP);
        ASSUME(GetMoveEffect(MOVE_SUPER_FANG) == EFFECT_FIXED_PERCENT_DAMAGE);
        ASSUME(GetSpeciesBaseHP(SPECIES_WOBBUFFET) == 190);
        PLAYER(SPECIES_WOBBUFFET) { Speed(2); }
        PLAYER(SPECIES_WOBBUFFET) { Speed(1); }
        OPPONENT(SPECIES_WOBBUFFET) { Speed(4); Moves(MOVE_MEMENTO); }
        OPPONENT(SPECIES_WOBBUFFET) { Speed(3); Moves(MOVE_CELEBRATE); }
    } WHEN {
        TURN { MOVE(playerLeft, MOVE_SUPER_FANG, target: opponentRight); }
    } SCENE {
        MESSAGE("Trainer A: Enemy last Mon has < 51% HP.{PAUSE_UNTIL_PRESS}");
        NONE_OF {
            MESSAGE("Trainer A: Enemy last Mon has < 51% HP.{PAUSE_UNTIL_PRESS}");
        }
    }
}

AI_DOUBLE_BATTLE_TEST("Trainer Slide: Doubles: Last Low Hp")
{
    GIVEN {
        FLAG_SET(TESTING_FLAG_TRAINER_SLIDES);
        VAR_SET(TESTING_VAR_TRAINER_SLIDES, TRAINER_SLIDE_LAST_LOW_HP);
        ASSUME(GetMoveEffect(MOVE_FALSE_SWIPE) == EFFECT_FALSE_SWIPE);
        PLAYER(SPECIES_WOBBUFFET) { Attack(999); Speed(2); }
        PLAYER(SPECIES_WOBBUFFET) { Attack(999); Speed(1); }
        OPPONENT(SPECIES_WOBBUFFET) { Defense(1); Speed(4); Moves(MOVE_MEMENTO);}
        OPPONENT(SPECIES_WOBBUFFET) { Defense(1); Speed(3); Moves(MOVE_CELEBRATE); }
    } WHEN {
        TURN { MOVE(playerLeft, MOVE_FALSE_SWIPE, target: opponentRight); }
    } SCENE {
        MESSAGE("Trainer A: Enemy last Mon has < 26% HP.{PAUSE_UNTIL_PRESS}");
        NONE_OF {
            MESSAGE("Trainer A: Enemy last Mon has < 26% HP.{PAUSE_UNTIL_PRESS}");
        }
    }
}

AI_DOUBLE_BATTLE_TEST("Trainer Slide: Doubles: Mega Evolution")
{
    GIVEN {
        FLAG_SET(TESTING_FLAG_TRAINER_SLIDES);
        VAR_SET(TESTING_VAR_TRAINER_SLIDES, TRAINER_SLIDE_MEGA_EVOLUTION);
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_LOPUNNY) { Item(ITEM_LOPUNNITE); };
        OPPONENT(SPECIES_LOPUNNY) { Moves(MOVE_CELEBRATE); }
    } WHEN {
        TURN { EXPECT_MOVE(opponentLeft, MOVE_CELEBRATE, gimmick: GIMMICK_MEGA); }
    } SCENE {
        MESSAGE("Trainer A: This message plays before the enemy activates the Mega Evolution gimmick.{PAUSE_UNTIL_PRESS}");
        NONE_OF {
            MESSAGE("Trainer A: This message plays before the enemy activates the Mega Evolution gimmick.{PAUSE_UNTIL_PRESS}");
        }
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_MEGA_EVOLUTION, opponentLeft);
        MESSAGE("The opposing Lopunny has Mega Evolved into Mega Lopunny!");
    }
}

AI_DOUBLE_BATTLE_TEST("Trainer Slide: Doubles: Z Move")
{
    GIVEN {
        FLAG_SET(TESTING_FLAG_TRAINER_SLIDES);
        VAR_SET(TESTING_VAR_TRAINER_SLIDES, TRAINER_SLIDE_Z_MOVE);
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET) { Item(ITEM_NORMALIUM_Z); }
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { EXPECT_MOVE(opponentLeft, MOVE_QUICK_ATTACK, gimmick: GIMMICK_Z_MOVE); }
    } SCENE {
        MESSAGE("Trainer A: This message plays before the enemy activates the Z-Move gimmick.{PAUSE_UNTIL_PRESS}");
        NONE_OF {
            MESSAGE("Trainer A: This message plays before the enemy activates the Z-Move gimmick.{PAUSE_UNTIL_PRESS}");
        }
        MESSAGE("The opposing Wobbuffet surrounded itself with its Z-Power!");
        MESSAGE("The opposing Wobbuffet unleashes its full-force Z-Move!");
        ANIMATION(ANIM_TYPE_MOVE, MOVE_BREAKNECK_BLITZ, opponentLeft);
    }
}

AI_DOUBLE_BATTLE_TEST("Trainer Slide: Doubles: Dynamax")
{
    GIVEN {
        FLAG_SET(TESTING_FLAG_TRAINER_SLIDES);
        VAR_SET(TESTING_VAR_TRAINER_SLIDES, TRAINER_SLIDE_DYNAMAX);
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET) { Moves(MOVE_CELEBRATE); }
        OPPONENT(SPECIES_WOBBUFFET) { Moves(MOVE_CELEBRATE); }
    } WHEN {
            TURN { EXPECT_MOVE(opponentLeft, MOVE_CELEBRATE, gimmick: GIMMICK_DYNAMAX); }
    } SCENE {
        MESSAGE("Trainer A: This message plays before the enemy activates the Dynamax gimmick.{PAUSE_UNTIL_PRESS}");
        NONE_OF {
            MESSAGE("Trainer A: This message plays before the enemy activates the Dynamax gimmick.{PAUSE_UNTIL_PRESS}");
        }
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_DYNAMAX_GROWTH, opponentLeft);
    }
}
// DOUBLES TESTS END

// MULTI TESTS START
AI_MULTI_BATTLE_TEST("Trainer Slide: Multi: Before First Turn")
{
    GIVEN {
        FLAG_SET(TESTING_FLAG_TRAINER_SLIDES);
        VAR_SET(TESTING_VAR_TRAINER_SLIDES, TRAINER_SLIDE_BEFORE_FIRST_TURN);
        MULTI_PLAYER(SPECIES_WOBBUFFET);
        MULTI_PARTNER(SPECIES_WOBBUFFET);
        MULTI_OPPONENT_A(SPECIES_WOBBUFFET) { Moves(MOVE_CELEBRATE); }
        MULTI_OPPONENT_B(SPECIES_WOBBUFFET) { Moves(MOVE_CELEBRATE); }
    } WHEN {
        TURN { }
    } SCENE {
        MESSAGE("Trainer A: This message plays before the first turn.{PAUSE_UNTIL_PRESS}");
        MESSAGE("Trainer B: This message plays before the first turn.{PAUSE_UNTIL_PRESS}");
        MESSAGE("Trainer Partner: This message plays before the first turn.{PAUSE_UNTIL_PRESS}");
        ANIMATION(ANIM_TYPE_MOVE, MOVE_CELEBRATE, playerLeft);
    }
}

AI_MULTI_BATTLE_TEST("Trainer Slide: Multi: Player Lands First Critical Hit")
{
    GIVEN {
        FLAG_SET(TESTING_FLAG_TRAINER_SLIDES);
        VAR_SET(TESTING_VAR_TRAINER_SLIDES, TRAINER_SLIDE_PLAYER_LANDS_FIRST_CRITICAL_HIT);
        ASSUME(GetMoveEffect(MOVE_LASER_FOCUS) == EFFECT_LASER_FOCUS);
        MULTI_PLAYER(SPECIES_WOBBUFFET);
        MULTI_PARTNER(SPECIES_WOBBUFFET) { Moves(MOVE_CELEBRATE); }
        MULTI_OPPONENT_A(SPECIES_WOBBUFFET) { Moves(MOVE_CELEBRATE); }
        MULTI_OPPONENT_B(SPECIES_WOBBUFFET) { Moves(MOVE_CELEBRATE); }
    } WHEN {
        TURN { MOVE(playerLeft, MOVE_LASER_FOCUS); }
        TURN { MOVE(playerLeft, MOVE_SURF, target: opponentLeft); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_LASER_FOCUS, playerLeft);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_SURF, playerLeft);
        MESSAGE("A critical hit!");
        MESSAGE("Trainer A: This message plays after the player lands their first critical hit.{PAUSE_UNTIL_PRESS}");
        MESSAGE("Trainer B: This message plays after the player lands their first critical hit.{PAUSE_UNTIL_PRESS}");
        // Note: Planned PR for additional slides will change slides from using "Player/Opponent" side to "Attacker/Target" side
        // MESSAGE("Trainer Partner: This message plays after the player lands their first critical hit.{PAUSE_UNTIL_PRESS}");
    }
}

AI_MULTI_BATTLE_TEST("Trainer Slide: Multi: Enemy Lands First Critical Hit")
{
    GIVEN {
        FLAG_SET(TESTING_FLAG_TRAINER_SLIDES);
        VAR_SET(TESTING_VAR_TRAINER_SLIDES, TRAINER_SLIDE_ENEMY_LANDS_FIRST_CRITICAL_HIT);
        TIE_BREAK_TARGET(TARGET_TIE_LO, 0); 
        MULTI_PLAYER(SPECIES_WOBBUFFET) { Speed(1); }
        MULTI_PARTNER(SPECIES_WOBBUFFET) { Speed(2); }
        MULTI_OPPONENT_A(SPECIES_WOBBUFFET) { Speed(4); }
        MULTI_OPPONENT_B(SPECIES_WOBBUFFET) { Speed(3); }
    } WHEN {
        TURN { MOVE(playerLeft, MOVE_ENDURE); 
            EXPECT_MOVE(opponentLeft, MOVE_SURGING_STRIKES, target: playerLeft); 
            EXPECT_MOVE(opponentRight, MOVE_SURGING_STRIKES, target: playerLeft); 
            MOVE(playerRight, MOVE_SURGING_STRIKES, target: playerLeft); 
        }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_ENDURE, playerLeft);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_SURGING_STRIKES, opponentLeft);
        MESSAGE("A critical hit!");
        MESSAGE("A critical hit!");
        MESSAGE("A critical hit!");
        ANIMATION(ANIM_TYPE_MOVE, MOVE_SURGING_STRIKES, opponentRight);
        MESSAGE("A critical hit!");
        MESSAGE("A critical hit!");
        MESSAGE("A critical hit!");
        ANIMATION(ANIM_TYPE_MOVE, MOVE_SURGING_STRIKES, playerRight);
        MESSAGE("A critical hit!");
        MESSAGE("A critical hit!");
        MESSAGE("A critical hit!");
        MESSAGE("Trainer A: This message plays after the enemy lands their first critical hit.{PAUSE_UNTIL_PRESS}");
        MESSAGE("Trainer B: This message plays after the enemy lands their first critical hit.{PAUSE_UNTIL_PRESS}");
        MESSAGE("Trainer Partner: This message plays after the enemy lands their first critical hit.{PAUSE_UNTIL_PRESS}");
    }
}

AI_MULTI_BATTLE_TEST("Trainer Slide: Multi: Player Lands First STAB Hit")
{
    GIVEN {
        FLAG_SET(TESTING_FLAG_TRAINER_SLIDES);
        VAR_SET(TESTING_VAR_TRAINER_SLIDES, TRAINER_SLIDE_PLAYER_LANDS_FIRST_STAB_MOVE);
        ASSUME((GetMoveType(MOVE_EARTHQUAKE)) == GetSpeciesType(SPECIES_SANDSHREW, 0));
        MULTI_PLAYER(SPECIES_SANDSHREW);
        MULTI_PARTNER(SPECIES_WOBBUFFET) { Moves(MOVE_CELEBRATE); }
        MULTI_OPPONENT_A(SPECIES_WOBBUFFET) { Moves(MOVE_CELEBRATE); }
        MULTI_OPPONENT_B(SPECIES_WOBBUFFET) { Moves(MOVE_CELEBRATE); }
    } WHEN {
        TURN { MOVE(playerLeft, MOVE_EARTHQUAKE); }
    } SCENE {
        MESSAGE("Sandshrew used Earthquake!");
        ANIMATION(ANIM_TYPE_MOVE, MOVE_EARTHQUAKE, playerLeft);
        MESSAGE("Trainer A: Player lands their first STAB move.{PAUSE_UNTIL_PRESS}");
        MESSAGE("Trainer B: Player lands their first STAB move.{PAUSE_UNTIL_PRESS}");
        // Note: Planned PR for additional slides will change slides from using "Player/Opponent" side to "Attacker/Target" side
        // MESSAGE("Trainer Partner: Player lands their first STAB move.{PAUSE_UNTIL_PRESS}");
    }
}

AI_MULTI_BATTLE_TEST("Trainer Slide: Multi: Player Lands First Super Effective Hit")
{
    GIVEN {
        FLAG_SET(TESTING_FLAG_TRAINER_SLIDES);
        VAR_SET(TESTING_VAR_TRAINER_SLIDES, TRAINER_SLIDE_PLAYER_LANDS_FIRST_SUPER_EFFECTIVE_HIT);
        ASSUME((GetMoveType(MOVE_EARTHQUAKE)) == GetSpeciesType(SPECIES_SANDSHREW, 0));
        ASSUME(GetSpeciesType(SPECIES_GOLEM, 0) == TYPE_ROCK);
        ASSUME(GetSpeciesType(SPECIES_GOLEM, 1) == TYPE_GROUND);
        MULTI_PLAYER(SPECIES_SANDSHREW);
        MULTI_PARTNER(SPECIES_GOLEM) { Moves(MOVE_CELEBRATE); }
        MULTI_OPPONENT_A(SPECIES_GOLEM) { Moves(MOVE_CELEBRATE); }
        MULTI_OPPONENT_B(SPECIES_GOLEM) { Moves(MOVE_CELEBRATE); }
    } WHEN {
        TURN { MOVE(playerLeft, MOVE_EARTHQUAKE); }
    } SCENE {
        MESSAGE("Sandshrew used Earthquake!");
        ANIMATION(ANIM_TYPE_MOVE, MOVE_EARTHQUAKE, playerLeft);
        MESSAGE("Trainer A: This message plays after the player lands their first super effective hit.{PAUSE_UNTIL_PRESS}");
        MESSAGE("Trainer B: This message plays after the player lands their first super effective hit.{PAUSE_UNTIL_PRESS}");
        // Note: Planned PR for additional slides will change slides from using "Player/Opponent" side to "Attacker/Target" side
        // MESSAGE("Trainer Partner: This message plays after the player lands their first super effective hit.{PAUSE_UNTIL_PRESS}");
    }
}

AI_MULTI_BATTLE_TEST("Trainer Slide: Multi: Player Lands First Down")
{
    GIVEN {
        FLAG_SET(TESTING_FLAG_TRAINER_SLIDES);
        VAR_SET(TESTING_VAR_TRAINER_SLIDES, TRAINER_SLIDE_PLAYER_LANDS_FIRST_DOWN);
        MULTI_PLAYER(SPECIES_WOBBUFFET) { Speed(1); }
        MULTI_PARTNER(SPECIES_RATICATE) { Speed(2); }
        MULTI_PARTNER(SPECIES_RATTATA) { Speed(2); }
        MULTI_OPPONENT_A(SPECIES_WOBBUFFET) { Speed(4); }
        MULTI_OPPONENT_A(SPECIES_WYNAUT) { Speed(4); Moves(MOVE_CELEBRATE); }
        MULTI_OPPONENT_B(SPECIES_WYNAUT) { Speed(3); }
        MULTI_OPPONENT_B(SPECIES_WOBBUFFET) { Speed(3); Moves(MOVE_CELEBRATE); }
    } WHEN {
        TURN { 
            EXPECT_MOVE(playerRight, MOVE_HEALING_WISH); EXPECT_SEND_OUT(playerRight,4); 
            EXPECT_MOVE(opponentLeft, MOVE_HEALING_WISH); EXPECT_SEND_OUT(opponentLeft,1); 
            EXPECT_MOVE(opponentRight, MOVE_HEALING_WISH); EXPECT_SEND_OUT(opponentRight,4); 
        }
    } SCENE {
        MESSAGE("The opposing Wobbuffet fainted!");
        MESSAGE("Trainer A: This message plays after the player KOs one enemy mon.{PAUSE_UNTIL_PRESS}");
        MESSAGE("The opposing Wynaut fainted!");
        MESSAGE("Trainer B: This message plays after the player KOs one enemy mon.{PAUSE_UNTIL_PRESS}");
        MESSAGE("Raticate fainted!");
        // Note: Planned PR for additional slides will change slides from using "Player/Opponent" side to "Attacker/Target" side
        // MESSAGE("Trainer Partner: This message plays after the player KOs one enemy mon.{PAUSE_UNTIL_PRESS}");
    }
}

AI_MULTI_BATTLE_TEST("Trainer Slide: Multi: Enemy Mon Unaffected")
{
    GIVEN {
        FLAG_SET(TESTING_FLAG_TRAINER_SLIDES);
        VAR_SET(TESTING_VAR_TRAINER_SLIDES, TRAINER_SLIDE_ENEMY_MON_UNAFFECTED);
        WITH_CONFIG(CONFIG_SHEER_COLD_IMMUNITY, GEN_7);
        ASSUME(GetSpeciesType(SPECIES_GLALIE, 0) == TYPE_ICE);
        MULTI_PLAYER(SPECIES_WYNAUT);
        MULTI_PARTNER(SPECIES_GASTLY) { Moves(MOVE_CELEBRATE); }
        MULTI_OPPONENT_A(SPECIES_GENGAR) { Moves(MOVE_CELEBRATE); }
        MULTI_OPPONENT_B(SPECIES_HAUNTER) { Moves(MOVE_CELEBRATE); }
    } WHEN {
        TURN { MOVE(playerLeft, MOVE_BOOMBURST); }
    } SCENE {
        NOT ANIMATION(ANIM_TYPE_MOVE, MOVE_BOOMBURST, playerLeft);
        MESSAGE("It doesn't affect the opposing Gengar and Haunter…");
        MESSAGE("It doesn't affect Gastly…");
        MESSAGE("Trainer A: Player attacked enemy with ineffective move.{PAUSE_UNTIL_PRESS}");
        MESSAGE("Trainer B: Player attacked enemy with ineffective move.{PAUSE_UNTIL_PRESS}");
        // Note: Planned PR for additional slides will change slides from using "Player/Opponent" side to "Attacker/Target" side
        // MESSAGE("Trainer Partner: Player attacked enemy with ineffective move.{PAUSE_UNTIL_PRESS}");
    }
}

AI_MULTI_BATTLE_TEST("Trainer Slide: Multi: Last Switchin")
{
    GIVEN {
        FLAG_SET(TESTING_FLAG_TRAINER_SLIDES);
        VAR_SET(TESTING_VAR_TRAINER_SLIDES, TRAINER_SLIDE_LAST_SWITCHIN);
        TIE_BREAK_TARGET(TARGET_TIE_HI, 0);
        MULTI_PLAYER(SPECIES_WOBBUFFET) { Speed(1); }
        MULTI_PARTNER(SPECIES_RATICATE) { Speed(3); }
        MULTI_PARTNER(SPECIES_RATTATA) { Speed(3); }
        MULTI_OPPONENT_A(SPECIES_WOBBUFFET) { Speed(4); }
        MULTI_OPPONENT_A(SPECIES_WYNAUT) { Speed(4); Moves(MOVE_CELEBRATE); }
        MULTI_OPPONENT_B(SPECIES_WYNAUT) { Speed(2); }
        MULTI_OPPONENT_B(SPECIES_WOBBUFFET) { Speed(2); Moves(MOVE_CELEBRATE); }
    } WHEN {
        TURN { 
            EXPECT_MOVE(opponentLeft, MOVE_MEMENTO, target: opponentRight); EXPECT_SEND_OUT(opponentLeft,1); 
            MOVE(playerRight, MOVE_MEMENTO, target: opponentRight); SEND_OUT(playerRight,4); 
            EXPECT_MOVE(opponentRight, MOVE_MEMENTO, target: playerRight); EXPECT_SEND_OUT(opponentRight,4); 
        }
    } SCENE {
        MESSAGE("The opposing Wobbuffet fainted!");
        MESSAGE("Raticate fainted!");
        MESSAGE("The opposing Wynaut fainted!");
        MESSAGE("Trainer A: This message plays after the enemy switches in their last Pokemon.{PAUSE_UNTIL_PRESS}");
        MESSAGE("Trainer Partner: This message plays after the enemy switches in their last Pokemon.{PAUSE_UNTIL_PRESS}");
        MESSAGE("Trainer B: This message plays after the enemy switches in their last Pokemon.{PAUSE_UNTIL_PRESS}");
    }
}

AI_MULTI_BATTLE_TEST("Trainer Slide: Multi: Last Half Hp")
{
    GIVEN {
        FLAG_SET(TESTING_FLAG_TRAINER_SLIDES);
        VAR_SET(TESTING_VAR_TRAINER_SLIDES, TRAINER_SLIDE_LAST_HALF_HP);
        ASSUME(GetMoveEffect(MOVE_SUPER_FANG) == EFFECT_FIXED_PERCENT_DAMAGE);
        ASSUME(GetSpeciesBaseHP(SPECIES_WOBBUFFET) == 190);
        MULTI_PLAYER(SPECIES_WOBBUFFET) { Speed(4); HP(1); }
        MULTI_PLAYER(SPECIES_WOBBUFFET) { Speed(4); }
        MULTI_PARTNER(SPECIES_WOBBUFFET) { Speed(3); }
        MULTI_OPPONENT_A(SPECIES_WOBBUFFET) { Speed(2); Moves(MOVE_SURF); }
        MULTI_OPPONENT_B(SPECIES_WOBBUFFET) { Speed(1); Moves(MOVE_SUPER_FANG); }
    } WHEN {
        TURN { MOVE(playerLeft, MOVE_SUPER_FANG, target: opponentLeft); SEND_OUT(playerLeft, 1);
            MOVE(playerRight, MOVE_SUPER_FANG, target: opponentRight); }
    } SCENE {
        MESSAGE("Trainer A: Enemy last Mon has < 51% HP.{PAUSE_UNTIL_PRESS}");
        MESSAGE("Trainer B: Enemy last Mon has < 51% HP.{PAUSE_UNTIL_PRESS}");
        MESSAGE("Trainer Partner: Enemy last Mon has < 51% HP.{PAUSE_UNTIL_PRESS}");
    }
}

AI_MULTI_BATTLE_TEST("Trainer Slide: Multi: Last Low Hp")
{
    GIVEN {
        FLAG_SET(TESTING_FLAG_TRAINER_SLIDES);
        VAR_SET(TESTING_VAR_TRAINER_SLIDES, TRAINER_SLIDE_LAST_LOW_HP);
        ASSUME(GetMoveEffect(MOVE_FALSE_SWIPE) == EFFECT_FALSE_SWIPE);
        MULTI_PLAYER(SPECIES_WOBBUFFET) { Speed(4); HP(1); }
        MULTI_PLAYER(SPECIES_WOBBUFFET) { Speed(4); }
        MULTI_PARTNER(SPECIES_WOBBUFFET) { Speed(3); MaxHP(400); HP(200); }
        MULTI_OPPONENT_A(SPECIES_WOBBUFFET) { Speed(2); MaxHP(400); HP(200); Moves(MOVE_SURF); }
        MULTI_OPPONENT_B(SPECIES_WOBBUFFET) { Speed(1); MaxHP(400); HP(200); Moves(MOVE_SUPER_FANG); }
    } WHEN {
        TURN { MOVE(playerLeft, MOVE_SUPER_FANG, target: opponentLeft); SEND_OUT(playerLeft, 1);
            MOVE(playerRight, MOVE_SUPER_FANG, target: opponentRight); }
    } SCENE {
        MESSAGE("Trainer A: Enemy last Mon has < 26% HP.{PAUSE_UNTIL_PRESS}");
        MESSAGE("Trainer B: Enemy last Mon has < 26% HP.{PAUSE_UNTIL_PRESS}");
        MESSAGE("Trainer Partner: Enemy last Mon has < 26% HP.{PAUSE_UNTIL_PRESS}");
    }
}

AI_MULTI_BATTLE_TEST("Trainer Slide: Multi: Mega Evolution")
{
    GIVEN {
        FLAG_SET(TESTING_FLAG_TRAINER_SLIDES);
        VAR_SET(TESTING_VAR_TRAINER_SLIDES, TRAINER_SLIDE_MEGA_EVOLUTION);
        MULTI_PLAYER(SPECIES_WOBBUFFET) { Speed(4); }
        MULTI_PARTNER(SPECIES_AERODACTYL) { Speed(2); Item(ITEM_AERODACTYLITE); }
        MULTI_OPPONENT_A(SPECIES_LOPUNNY) { Speed(3); Item(ITEM_LOPUNNITE); }
        MULTI_OPPONENT_B(SPECIES_MEDICHAM) { Speed(1); Item(ITEM_MEDICHAMITE); }
    } WHEN {
        TURN { EXPECT_MOVE(opponentLeft, MOVE_CELEBRATE, gimmick: GIMMICK_MEGA); 
            MOVE(playerRight, MOVE_CELEBRATE, gimmick: GIMMICK_MEGA);
            EXPECT_MOVE(opponentRight, MOVE_CELEBRATE, gimmick: GIMMICK_MEGA); }
    } SCENE {
        MESSAGE("Trainer A: This message plays before the enemy activates the Mega Evolution gimmick.{PAUSE_UNTIL_PRESS}");
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_MEGA_EVOLUTION, opponentLeft);
        MESSAGE("The opposing Lopunny has Mega Evolved into Mega Lopunny!");
        MESSAGE("Trainer Partner: This message plays before the enemy activates the Mega Evolution gimmick.{PAUSE_UNTIL_PRESS}");
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_MEGA_EVOLUTION, playerRight);
        MESSAGE("Aerodactyl has Mega Evolved into Mega Aerodactyl!");
        MESSAGE("Trainer B: This message plays before the enemy activates the Mega Evolution gimmick.{PAUSE_UNTIL_PRESS}");
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_MEGA_EVOLUTION, opponentRight);
        MESSAGE("The opposing Medicham has Mega Evolved into Mega Medicham!");
    }
}

AI_MULTI_BATTLE_TEST("Trainer Slide: Multi: Z Move")
{
    GIVEN {
        FLAG_SET(TESTING_FLAG_TRAINER_SLIDES);
        VAR_SET(TESTING_VAR_TRAINER_SLIDES, TRAINER_SLIDE_Z_MOVE);
        TIE_BREAK_TARGET(TARGET_TIE_LO, 0);
        MULTI_PLAYER(SPECIES_WOBBUFFET) { Speed(4); }
        MULTI_PARTNER(SPECIES_WOBBUFFET) { Speed(2); Item(ITEM_NORMALIUM_Z); }
        MULTI_OPPONENT_A(SPECIES_WOBBUFFET) { Speed(3); Item(ITEM_NORMALIUM_Z); }
        MULTI_OPPONENT_B(SPECIES_WOBBUFFET) { Speed(1); Item(ITEM_NORMALIUM_Z); }
    } WHEN {
        TURN { EXPECT_MOVE(opponentLeft, MOVE_QUICK_ATTACK, gimmick: GIMMICK_Z_MOVE, target: playerLeft); 
            MOVE(playerRight, MOVE_QUICK_ATTACK, gimmick: GIMMICK_Z_MOVE, target: opponentLeft); 
            EXPECT_MOVE(opponentRight, MOVE_QUICK_ATTACK, gimmick: GIMMICK_Z_MOVE, target: playerLeft); }
    } SCENE {
        MESSAGE("Trainer A: This message plays before the enemy activates the Z-Move gimmick.{PAUSE_UNTIL_PRESS}");
        MESSAGE("The opposing Wobbuffet surrounded itself with its Z-Power!");
        MESSAGE("The opposing Wobbuffet unleashes its full-force Z-Move!");
        ANIMATION(ANIM_TYPE_MOVE, MOVE_BREAKNECK_BLITZ, opponentLeft);
        MESSAGE("Trainer Partner: This message plays before the enemy activates the Z-Move gimmick.{PAUSE_UNTIL_PRESS}");
        MESSAGE("Wobbuffet surrounded itself with its Z-Power!");
        MESSAGE("Wobbuffet unleashes its full-force Z-Move!");
        ANIMATION(ANIM_TYPE_MOVE, MOVE_BREAKNECK_BLITZ, playerRight);
        MESSAGE("Trainer B: This message plays before the enemy activates the Z-Move gimmick.{PAUSE_UNTIL_PRESS}");
        MESSAGE("The opposing Wobbuffet surrounded itself with its Z-Power!");
        MESSAGE("The opposing Wobbuffet unleashes its full-force Z-Move!");
        ANIMATION(ANIM_TYPE_MOVE, MOVE_BREAKNECK_BLITZ, opponentRight);
    }
}

AI_MULTI_BATTLE_TEST("Trainer Slide: Multi: Dynamax")
{
    s32 dynamaxLevelA = 0, dynamaxLevelB = 0;

    PARAMETRIZE { dynamaxLevelA = 10;  dynamaxLevelB = -1;  }
    PARAMETRIZE { dynamaxLevelA = -1;   dynamaxLevelB = 10; }

    GIVEN {
        FLAG_SET(TESTING_FLAG_TRAINER_SLIDES);
        VAR_SET(TESTING_VAR_TRAINER_SLIDES, TRAINER_SLIDE_DYNAMAX);
        MULTI_PLAYER(SPECIES_WOBBUFFET) { Speed(4); }
        MULTI_PARTNER(SPECIES_WOBBUFFET) { Speed(2); DynamaxLevel(10); }
        MULTI_OPPONENT_A(SPECIES_WOBBUFFET) { Speed(3); Moves(MOVE_CELEBRATE); DynamaxLevel(dynamaxLevelA); }
        MULTI_OPPONENT_B(SPECIES_WOBBUFFET) { Speed(1); Moves(MOVE_CELEBRATE); DynamaxLevel(dynamaxLevelB); }
    } WHEN {
            TURN { 
                if (dynamaxLevelA == 10)
                    EXPECT_MOVE(opponentLeft, MOVE_CELEBRATE, gimmick: GIMMICK_DYNAMAX); 
                else
                    EXPECT_MOVE(opponentLeft, MOVE_CELEBRATE, gimmick: GIMMICK_NONE);

                MOVE(playerRight, MOVE_CELEBRATE, gimmick: GIMMICK_DYNAMAX); 

                if (dynamaxLevelB == 10)
                    EXPECT_MOVE(opponentRight, MOVE_CELEBRATE, gimmick: GIMMICK_DYNAMAX); 
                else
                    EXPECT_MOVE(opponentRight, MOVE_CELEBRATE, gimmick: GIMMICK_NONE);
            }
    } SCENE {
        if (dynamaxLevelA == 10)
        {
            MESSAGE("Trainer A: This message plays before the enemy activates the Dynamax gimmick.{PAUSE_UNTIL_PRESS}");
            ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_DYNAMAX_GROWTH, opponentLeft);
        }
        MESSAGE("Trainer Partner: This message plays before the enemy activates the Dynamax gimmick.{PAUSE_UNTIL_PRESS}");
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_DYNAMAX_GROWTH, playerRight);
        if (dynamaxLevelB == 10)
        {
            MESSAGE("Trainer B: This message plays before the enemy activates the Dynamax gimmick.{PAUSE_UNTIL_PRESS}");
            ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_DYNAMAX_GROWTH, opponentRight);
        }
    }
}
// MULTI TESTS END
