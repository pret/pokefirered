#include "global.h"
#include "test/battle.h"

ASSUMPTIONS
{
    ASSUME(GetMoveCategory(MOVE_WATER_GUN) == DAMAGE_CATEGORY_SPECIAL);
    ASSUME(GetMoveCategory(MOVE_ROUND) == DAMAGE_CATEGORY_SPECIAL);
    ASSUME(GetMoveEffect(MOVE_ROLE_PLAY) == EFFECT_ROLE_PLAY);
}

SINGLE_BATTLE_TEST("Beads of Ruin reduces Sp. Def if opposing mon's ability doesn't match")
{
    s16 damage[2];

    GIVEN {
        PLAYER(SPECIES_CHI_YU) { Ability(ABILITY_BEADS_OF_RUIN); }
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(player, MOVE_WATER_GUN); MOVE(opponent, MOVE_ROLE_PLAY); }
        TURN { MOVE(player, MOVE_WATER_GUN); }
    } SCENE {
        ABILITY_POPUP(player, ABILITY_BEADS_OF_RUIN);
        MESSAGE("Chi-Yu's Beads of Ruin weakened the Sp. Def of all surrounding Pokémon!");
        ANIMATION(ANIM_TYPE_MOVE, MOVE_WATER_GUN, player);
        HP_BAR(opponent, captureDamage: &damage[0]);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_ROLE_PLAY, opponent);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_WATER_GUN, player);
        HP_BAR(opponent, captureDamage: &damage[1]);
    } THEN {
        EXPECT_MUL_EQ(damage[1], Q_4_12(1.33), damage[0]);
    }
}

SINGLE_BATTLE_TEST("Beads of Ruin's message displays correctly after all battlers fainted - Player")
{
    GIVEN {
        ASSUME(GetMoveEffect(MOVE_EXPLOSION) == EFFECT_EXPLOSION);
        PLAYER(SPECIES_WOBBUFFET) { HP(1);}
        PLAYER(SPECIES_CHI_YU);
        OPPONENT(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(opponent, MOVE_EXPLOSION); SEND_OUT(player, 1); SEND_OUT(opponent, 1); }
        TURN { MOVE(player, MOVE_SCRATCH); MOVE(opponent, MOVE_RUINATION); }
    } SCENE {
        HP_BAR(opponent, hp: 0);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_EXPLOSION, opponent);
        // Everyone faints.
        MESSAGE("Go! Chi-Yu!");
        MESSAGE("2 sent out Wobbuffet!");
        ABILITY_POPUP(player, ABILITY_BEADS_OF_RUIN);
        MESSAGE("Chi-Yu's Beads of Ruin weakened the Sp. Def of all surrounding Pokémon!");
    }
}

SINGLE_BATTLE_TEST("Beads of Ruin's message displays correctly after all battlers fainted - Opponent")
{
    GIVEN {
        ASSUME(GetMoveEffect(MOVE_EXPLOSION) == EFFECT_EXPLOSION);
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET) { HP(1);}
        OPPONENT(SPECIES_CHI_YU);
    } WHEN {
        TURN { MOVE(player, MOVE_EXPLOSION); SEND_OUT(player, 1); SEND_OUT(opponent, 1); }
        TURN { MOVE(player, MOVE_RUINATION); MOVE(opponent, MOVE_SCRATCH); }
    } SCENE {
        HP_BAR(player, hp: 0);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_EXPLOSION, player);
        // Everyone faints.
        SEND_IN_MESSAGE("Wobbuffet");
        MESSAGE("2 sent out Chi-Yu!");
        ABILITY_POPUP(opponent, ABILITY_BEADS_OF_RUIN);
        MESSAGE("The opposing Chi-Yu's Beads of Ruin weakened the Sp. Def of all surrounding Pokémon!");
    }
}

DOUBLE_BATTLE_TEST("Beads of Ruin increases damage taken by physical moves in Wonder Room", s16 damage)
{
    bool32 useWonderRoom;
    u32 move;

    PARAMETRIZE { useWonderRoom = FALSE; move = MOVE_SCRATCH; }
    PARAMETRIZE { useWonderRoom = FALSE; move = MOVE_ROUND;   }
    PARAMETRIZE { useWonderRoom = TRUE;  move = MOVE_SCRATCH; }
    PARAMETRIZE { useWonderRoom = TRUE;  move = MOVE_ROUND;   }

    GIVEN {
        ASSUME(GetMoveEffect(MOVE_WONDER_ROOM) == EFFECT_WONDER_ROOM);
        ASSUME(GetMoveCategory(MOVE_SCRATCH) == DAMAGE_CATEGORY_PHYSICAL);
        ASSUME(GetMoveEffect(MOVE_ROUND) != EFFECT_PSYSHOCK);
        PLAYER(SPECIES_CHI_YU) { Ability(ABILITY_BEADS_OF_RUIN); }
        PLAYER(SPECIES_WYNAUT);
        OPPONENT(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        if (useWonderRoom)
            TURN { MOVE(opponentLeft, MOVE_WONDER_ROOM); MOVE(playerRight, move, target: opponentLeft); }
        else
            TURN { MOVE(playerRight, move, target: opponentLeft); }
    } SCENE {
        ABILITY_POPUP(playerLeft, ABILITY_BEADS_OF_RUIN);
        MESSAGE("Chi-Yu's Beads of Ruin weakened the Sp. Def of all surrounding Pokémon!");
        ANIMATION(ANIM_TYPE_MOVE, move, playerRight);
        HP_BAR(opponentLeft, captureDamage: &results[i].damage);
    } FINALLY {
        EXPECT_GT(results[2].damage, results[0].damage); // In Wonder Room, physical move deals more damage
        EXPECT_LT(results[3].damage, results[1].damage); // In Wonder Room, special move deals less damage
    }
}

SINGLE_BATTLE_TEST("Beads of Ruin doesn't activate when dragged out by Mold Breaker attacker")
{
    u32 ability;

    PARAMETRIZE { ability = ABILITY_MOLD_BREAKER; }
    PARAMETRIZE { ability = ABILITY_SAND_RUSH; }

    GIVEN {
        ASSUME(GetMoveEffect(MOVE_DRAGON_TAIL) == EFFECT_HIT_SWITCH_TARGET);
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_CHI_YU) { Ability(ABILITY_BEADS_OF_RUIN); }
        OPPONENT(SPECIES_EXCADRILL) { Ability(ability); }
    } WHEN {
        TURN { MOVE(opponent, MOVE_DRAGON_TAIL); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_DRAGON_TAIL, opponent);
        if (ability == ABILITY_MOLD_BREAKER)
        {
            NONE_OF {
                ABILITY_POPUP(player, ABILITY_BEADS_OF_RUIN);
                MESSAGE("Chi-Yu's Beads of Ruin weakened the Sp. Def of all surrounding Pokémon!");
            }
        }
        else
        {
            ABILITY_POPUP(player, ABILITY_BEADS_OF_RUIN);
            MESSAGE("Chi-Yu's Beads of Ruin weakened the Sp. Def of all surrounding Pokémon!");
        }
    }
}

DOUBLE_BATTLE_TEST("Beads of Ruin's Sp. Def reduction is not ignored by Mold Breaker", s16 damage)
{
    u32 ability;

    PARAMETRIZE { ability = ABILITY_MOLD_BREAKER; }
    PARAMETRIZE { ability = ABILITY_SAND_RUSH; }

    GIVEN {
        PLAYER(SPECIES_CHI_YU) { Ability(ABILITY_BEADS_OF_RUIN); }
        PLAYER(SPECIES_WYNAUT);
        OPPONENT(SPECIES_EXCADRILL) { Ability(ability); }
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(opponentLeft, MOVE_ROUND, target: playerRight); }
    } SCENE {
        ABILITY_POPUP(playerLeft, ABILITY_BEADS_OF_RUIN);
        MESSAGE("Chi-Yu's Beads of Ruin weakened the Sp. Def of all surrounding Pokémon!");
        ANIMATION(ANIM_TYPE_MOVE, MOVE_ROUND, opponentLeft);
        HP_BAR(playerRight, captureDamage: &results[i].damage);
    } FINALLY {
        EXPECT_EQ(results[0].damage, results[1].damage);
    }
}

DOUBLE_BATTLE_TEST("Beads of Ruin's Sp. Def reduction is ignored by Gastro Acid", s16 damage)
{
    u32 move;

    PARAMETRIZE { move = MOVE_GASTRO_ACID; }
    PARAMETRIZE { move = MOVE_CELEBRATE; }

    GIVEN {
        ASSUME(GetMoveEffect(MOVE_GASTRO_ACID) == EFFECT_GASTRO_ACID);
        PLAYER(SPECIES_CHI_YU) { Ability(ABILITY_BEADS_OF_RUIN); }
        PLAYER(SPECIES_WYNAUT);
        OPPONENT(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(opponentRight, move, target: playerLeft); MOVE(opponentLeft, MOVE_ROUND, target: playerRight); }
    } SCENE {
        ABILITY_POPUP(playerLeft, ABILITY_BEADS_OF_RUIN);
        MESSAGE("Chi-Yu's Beads of Ruin weakened the Sp. Def of all surrounding Pokémon!");
        ANIMATION(ANIM_TYPE_MOVE, move, opponentRight);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_ROUND, opponentLeft);
        HP_BAR(playerRight, captureDamage: &results[i].damage);
    } FINALLY {
        EXPECT_LT(results[0].damage, results[1].damage);
    }
}
