#include "global.h"
#include "test/battle.h"

SINGLE_BATTLE_TEST("Life Orb activates when users attack is succesful")
{
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET) { Item(ITEM_LIFE_ORB); }
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(player, MOVE_POUND); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_POUND, player);
        HP_BAR(opponent);
        HP_BAR(player);
        MESSAGE("Wobbuffet was hurt by the Life Orb!");
    }
}

SINGLE_BATTLE_TEST("Life Orb activates if it hits a Substitute")
{
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET) { Item(ITEM_LIFE_ORB); }
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(opponent, MOVE_SUBSTITUTE); MOVE(player, MOVE_TACKLE); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_SUBSTITUTE, opponent);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_TACKLE, player);
        HP_BAR(player);
        MESSAGE("Wobbuffet was hurt by the Life Orb!");
    }
}

SINGLE_BATTLE_TEST("Life Orb does not activate if using status move on a Substitute")
{
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET) { Item(ITEM_LIFE_ORB); }
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(opponent, MOVE_SUBSTITUTE); MOVE(player, MOVE_GROWL); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_SUBSTITUTE, opponent);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_GROWL, player);
        NONE_OF {
            HP_BAR(player);
            MESSAGE("Wobbuffet was hurt by the Life Orb!");
        }
    }
}

SINGLE_BATTLE_TEST("Life Orb does not activate if using a status move")
{
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET) { Item(ITEM_LIFE_ORB); }
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(player, MOVE_GROWL); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_GROWL, player);
        NONE_OF {
            HP_BAR(player);
            MESSAGE("Wobbuffet was hurt by the Life Orb!");
        }
    }
}

SINGLE_BATTLE_TEST("Life Orb doesn't cause any HP loss if user is unable to attack")
{
    PASSES_RANDOMLY(25, 100, RNG_PARALYSIS);
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET) { Item(ITEM_LIFE_ORB); Status1(STATUS1_PARALYSIS); }
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(player, MOVE_POUND); }
    } SCENE {
        NONE_OF {
            ANIMATION(ANIM_TYPE_MOVE, MOVE_TACKLE, player);
            HP_BAR(opponent);
            HP_BAR(player);
            MESSAGE("Wobbuffet was hurt by the Life Orb!");
        }
    }
}

SINGLE_BATTLE_TEST("Life Orb does not activate if on a confusion hit")
{
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET) { Item(ITEM_LIFE_ORB); }
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(opponent, MOVE_CONFUSE_RAY); MOVE(player, MOVE_POUND, WITH_RNG(RNG_CONFUSION, TRUE)); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_CONFUSE_RAY, opponent);
        HP_BAR(player);
        NONE_OF {
            ANIMATION(ANIM_TYPE_MOVE, MOVE_POUND, player);
            HP_BAR(opponent);
            HP_BAR(player);
            MESSAGE("Wobbuffet was hurt by the Life Orb!");
        }
    }
}

SINGLE_BATTLE_TEST("Life Orb does not activate if move was absorbed by target")
{
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET) { Item(ITEM_LIFE_ORB); }
        OPPONENT(SPECIES_RAICHU) { Ability(ABILITY_LIGHTNING_ROD); }
    } WHEN {
        TURN { MOVE(player, MOVE_SHOCK_WAVE); }
    } SCENE {
        NONE_OF {
            ANIMATION(ANIM_TYPE_MOVE, MOVE_SHOCK_WAVE, player);
            HP_BAR(opponent);
            HP_BAR(player);
            MESSAGE("Wobbuffet was hurt by the Life Orb!");
        }
    }
}

SINGLE_BATTLE_TEST("Life Orb activates if move connected but no damage was dealt")
{
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET) { Item(ITEM_LIFE_ORB); }
        OPPONENT(SPECIES_WOBBUFFET) { HP(1); }
    } WHEN {
        TURN { MOVE(player, MOVE_FALSE_SWIPE); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_FALSE_SWIPE, player);
        HP_BAR(player);
        MESSAGE("Wobbuffet was hurt by the Life Orb!");
    }
}

SINGLE_BATTLE_TEST("Life Orb does not activate on a charge turn")
{
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET) { Item(ITEM_LIFE_ORB); }
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(player, MOVE_FLY); }
        TURN { SKIP_TURN(player); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_FLY, player);
        NONE_OF {
            HP_BAR(player);
            MESSAGE("Wobbuffet was hurt by the Life Orb!");
        }
        HP_BAR(opponent);
        HP_BAR(player); // Lief Orb
    }
}
