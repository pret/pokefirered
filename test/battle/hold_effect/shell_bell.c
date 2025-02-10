#include "global.h"
#include "test/battle.h"

ASSUMPTIONS
{
    ASSUME(gItemsInfo[ITEM_SHELL_BELL].holdEffect == HOLD_EFFECT_SHELL_BELL);
}

#define HITS 5
SINGLE_BATTLE_TEST("Shell Bell recovers 1/8 of HP from after the last hit from all hits of a multi hit move")
{
    s16 multiHitDamage[HITS];
    s16 totalDamage = 0;
    s16 shellBellRecovery = 0;

    GIVEN {
        PLAYER(SPECIES_WOBBUFFET) { HP(1); Item(ITEM_SHELL_BELL); }
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(player, MOVE_BULLET_SEED); }
    } SCENE {
        for (u32 i = 0; i < HITS; i++) {
            ANIMATION(ANIM_TYPE_MOVE, MOVE_BULLET_SEED, player);
            HP_BAR(opponent, captureDamage: &multiHitDamage[i]);
            totalDamage += multiHitDamage[i];
        }
        HP_BAR(player, captureDamage: &shellBellRecovery);
    } THEN {
        EXPECT_EQ(totalDamage / 8, -1 * shellBellRecovery);
    }
}
#undef HITS

SINGLE_BATTLE_TEST("Shell Bell recovers no HP if the move did no damage")
{
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET) { HP(1); Item(ITEM_SHELL_BELL); }
        OPPONENT(SPECIES_WOBBUFFET) { HP(1); };
    } WHEN {
        TURN { MOVE(player, MOVE_FALSE_SWIPE); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_FALSE_SWIPE, player);
        HP_BAR(opponent);
        NONE_OF {
            ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_HELD_ITEM_EFFECT, player);
            HP_BAR(player);
        }
    }
}

SINGLE_BATTLE_TEST("Shell Bell activates if it hits a Substitute")
{
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET) { HP(1); Item(ITEM_SHELL_BELL); }
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(opponent, MOVE_SUBSTITUTE); MOVE(player, MOVE_TACKLE); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_SUBSTITUTE, opponent);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_TACKLE, player);
        // HP_BAR(opponent); // When you hit a sub the hp bar check doesn't work. Not sure if this is a bug
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_HELD_ITEM_EFFECT, player);
        HP_BAR(player);
    }
}

SINGLE_BATTLE_TEST("Shell Bell activates after Absorb")
{
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET) { HP(1); Item(ITEM_SHELL_BELL); }
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(player, MOVE_ABSORB); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_ABSORB, player);
        HP_BAR(opponent);
        HP_BAR(player);
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_HELD_ITEM_EFFECT, player);
        HP_BAR(player);
    }
}

SINGLE_BATTLE_TEST("Shell Bell activates after Rough Skin")
{
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET) { Item(ITEM_SHELL_BELL); }
        OPPONENT(SPECIES_GIBLE) { Ability(ABILITY_ROUGH_SKIN); }
    } WHEN {
        TURN { MOVE(player, MOVE_TACKLE); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_TACKLE, player);
        HP_BAR(opponent);
        HP_BAR(player);
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_HELD_ITEM_EFFECT, player);
        HP_BAR(player);
    }
}

SINGLE_BATTLE_TEST("Shell Bell does not activate on Future Sight if the original user is on the field")
{
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET) { HP(1); Item(ITEM_SHELL_BELL); }
        OPPONENT(SPECIES_WYNAUT);
    } WHEN {
        TURN { MOVE(player, MOVE_FUTURE_SIGHT); }
        TURN {}
        TURN {}
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_FUTURE_SIGHT, player);
        MESSAGE("The opposing Wynaut took the Future Sight attack!");
        HP_BAR(opponent);
        NONE_OF {
            ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_HELD_ITEM_EFFECT, player);
            HP_BAR(player);
        }
    }
}

SINGLE_BATTLE_TEST("Shell Bell restores 1/8 HP of damage dealt")
{
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET) { Level(16); Item(ITEM_SHELL_BELL); HP(10); }
        OPPONENT(SPECIES_WOBBUFFET) { Level(16); };
    } WHEN {
        TURN { MOVE(player, MOVE_SEISMIC_TOSS); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_SEISMIC_TOSS, player);
        HP_BAR(opponent);
        HP_BAR(player, damage: -2);
    }
}

SINGLE_BATTLE_TEST("Shell Bell doesn't restore HP for damage dealt by a foreseen move")
{
    GIVEN {
        ASSUME(gMovesInfo[MOVE_FUTURE_SIGHT].effect == EFFECT_FUTURE_SIGHT);
        PLAYER(SPECIES_WOBBUFFET) { Level(16); Item(ITEM_SHELL_BELL); HP(10); }
        OPPONENT(SPECIES_WOBBUFFET) { Level(16); };
    } WHEN {
        TURN { MOVE(player, MOVE_FUTURE_SIGHT); }
        TURN { }
        TURN { }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_FUTURE_SIGHT, player);
        MESSAGE("The opposing Wobbuffet took the Future Sight attack!");
        HP_BAR(opponent);
        NONE_OF {
            HP_BAR(player);
        }
    }
}

SINGLE_BATTLE_TEST("Shell Bell does not activate on Future Sight if the original user is not on the field")
{
    GIVEN {
        PLAYER(SPECIES_WYNAUT);
        PLAYER(SPECIES_WOBBUFFET) { HP(1); Item(ITEM_SHELL_BELL); }
        OPPONENT(SPECIES_WYNAUT);
    } WHEN {
        TURN { MOVE(player, MOVE_FUTURE_SIGHT); }
        TURN { SWITCH(player, 1); }
        TURN {}
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_FUTURE_SIGHT, player);
        MESSAGE("The opposing Wynaut took the Future Sight attack!");
        HP_BAR(opponent);
        NONE_OF {
            ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_HELD_ITEM_EFFECT, player);
            HP_BAR(player);
        }
    }
}


SINGLE_BATTLE_TEST("Shell Bell does not activate on Future Sight if the original user is on the field")
{
    s16 damage = 0;
    s16 healed = 0;

    GIVEN {
        PLAYER(SPECIES_WOBBUFFET) { HP(1); Item(ITEM_SHELL_BELL); }
        OPPONENT(SPECIES_WYNAUT);
    } WHEN {
        TURN { MOVE(player, MOVE_FUTURE_SIGHT); }
        TURN {}
        TURN {}
        TURN { MOVE(player, MOVE_DRAGON_RAGE); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_FUTURE_SIGHT, player);
        MESSAGE("The opposing Wynaut took the Future Sight attack!");
        HP_BAR(opponent);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_DRAGON_RAGE, player);
        HP_BAR(opponent, captureDamage: &damage);
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_HELD_ITEM_EFFECT, player);
        HP_BAR(player, captureDamage: &healed);
    } THEN {
        EXPECT_MUL_EQ(damage, Q_4_12(-0.25), healed);
    }
}

TO_DO_BATTLE_TEST("If a Pokémon steals a Shell Bell with Thief or Covet, it will recover HP for the use of that move that stole the Shell Bell")
TO_DO_BATTLE_TEST("If a Pokémon steals a Shell Bell with Magician, it will recover HP for the use of that move that stole the Shell Bell")
