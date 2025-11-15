#include "global.h"
#include "test/battle.h"

ASSUMPTIONS
{
    ASSUME(GetMoveEffect(MOVE_KNOCK_OFF) == EFFECT_KNOCK_OFF);
}

WILD_BATTLE_TEST("Knock Off does not remove item when used by Wild Pokemon (Gen 5+)")
{
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET) { Item(ITEM_LEFTOVERS); }
        OPPONENT(SPECIES_WOBBUFFET) { Item(ITEM_EVIOLITE); }
    } WHEN {
        TURN { MOVE(opponent, MOVE_KNOCK_OFF); }
        TURN { MOVE(player, MOVE_KNOCK_OFF); }
    } SCENE {
        // Turn 1
        ANIMATION(ANIM_TYPE_MOVE, MOVE_KNOCK_OFF, opponent);
        if (B_KNOCK_OFF_REMOVAL >= GEN_5)
            NOT ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_ITEM_KNOCKOFF, player);
        else
            ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_ITEM_KNOCKOFF, player);
        // Turn 2
        ANIMATION(ANIM_TYPE_MOVE, MOVE_KNOCK_OFF, player);
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_ITEM_KNOCKOFF, opponent);
    } THEN {
        EXPECT(player->item == ITEM_LEFTOVERS);
        if (B_KNOCK_OFF_REMOVAL >= GEN_5)
            EXPECT(opponent->item == ITEM_NONE);
        else
            EXPECT(opponent->item == ITEM_EVIOLITE);
    }
}

SINGLE_BATTLE_TEST("Knock Off knocks a healing berry before it has the chance to activate")
{
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET) { Item(ITEM_SITRUS_BERRY); MaxHP(500); HP(255); }
    } WHEN {
        TURN { MOVE(player, MOVE_KNOCK_OFF); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_KNOCK_OFF, player);
        NONE_OF {
            ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_HELD_ITEM_EFFECT, opponent);
            MESSAGE("The opposing Wobbuffet restored its health using its Sitrus Berry!");
        }
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_ITEM_KNOCKOFF);
        MESSAGE("Wobbuffet knocked off the opposing Wobbuffet's Sitrus Berry!");
    } THEN {
        EXPECT(opponent->item == ITEM_NONE);
    }
}

SINGLE_BATTLE_TEST("Knock Off activates after Rocky Helmet and Weakness Policy")
{
    u16 item = 0;

    PARAMETRIZE { item = ITEM_WEAKNESS_POLICY; }
    PARAMETRIZE { item = ITEM_ROCKY_HELMET; }

    GIVEN {
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET) { Item(item); }
    } WHEN {
        TURN { MOVE(player, MOVE_KNOCK_OFF); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_KNOCK_OFF, player);
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_HELD_ITEM_EFFECT, opponent);
        if (item == ITEM_WEAKNESS_POLICY) {
            ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_STATS_CHANGE);
            MESSAGE("Using Weakness Policy, the Attack of the opposing Wobbuffet sharply rose!");
            MESSAGE("Using Weakness Policy, the Sp. Atk of the opposing Wobbuffet sharply rose!");
        } else if (item == ITEM_ROCKY_HELMET) {
            HP_BAR(player);
            MESSAGE("Wobbuffet was hurt by the opposing Wobbuffet's Rocky Helmet!");
            ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_ITEM_KNOCKOFF);
            MESSAGE("Wobbuffet knocked off the opposing Wobbuffet's Rocky Helmet!");
        }
    } THEN {
        EXPECT(opponent->item == ITEM_NONE);
    }
}

SINGLE_BATTLE_TEST("Knock Off deals additional damage to opponents holding an item in Gen 6+", s16 damage)
{
    u16 item = 0;

    PARAMETRIZE { item = ITEM_NONE; }
    PARAMETRIZE { item = ITEM_LEFTOVERS; }

    GIVEN {
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET) { Item(item); };
    } WHEN {
        TURN { MOVE(player, MOVE_KNOCK_OFF); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_KNOCK_OFF, player);
        HP_BAR(opponent, captureDamage: &results[i].damage);
        if (item != ITEM_NONE)
            ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_ITEM_KNOCKOFF);
    } FINALLY {
        if (B_KNOCK_OFF_DMG >= GEN_6)
            EXPECT_MUL_EQ(results[0].damage, UQ_4_12(1.5), results[1].damage);
        else
            EXPECT_EQ(results[0].damage, results[1].damage);
    } THEN {
        EXPECT(opponent->item == ITEM_NONE);
    }
}


SINGLE_BATTLE_TEST("Knock Off does not remove items through Substitute")
{
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET) { Item(ITEM_LEFTOVERS); };
    } WHEN {
        TURN { MOVE(opponent, MOVE_SUBSTITUTE); MOVE(player, MOVE_KNOCK_OFF); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_KNOCK_OFF, player);
        NOT { ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_ITEM_KNOCKOFF); }
    } THEN {
        EXPECT(opponent->item == ITEM_LEFTOVERS);
    }
}

SINGLE_BATTLE_TEST("Knock Off does not remove items through Substitute even if it breaks it")
{
    GIVEN {
        PLAYER(SPECIES_WYNAUT);
        OPPONENT(SPECIES_WOBBUFFET) { MaxHP(4); HP(4); Item(ITEM_LEFTOVERS); };
    } WHEN {
        TURN { MOVE(opponent, MOVE_SUBSTITUTE); MOVE(player, MOVE_KNOCK_OFF); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_KNOCK_OFF, player);
        MESSAGE("The opposing Wobbuffet's substitute faded!");
        NOT { ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_ITEM_KNOCKOFF); }
    } THEN {
        EXPECT(opponent->item == ITEM_LEFTOVERS);
    }
}

SINGLE_BATTLE_TEST("Knock Off does not remove items through Protect")
{
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET) { Item(ITEM_LEFTOVERS); };
    } WHEN {
        TURN { MOVE(opponent, MOVE_PROTECT); MOVE(player, MOVE_KNOCK_OFF); }
    } SCENE {
        NONE_OF {
            ANIMATION(ANIM_TYPE_MOVE, MOVE_KNOCK_OFF, player);
            ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_ITEM_KNOCKOFF);
        }
    } THEN {
        EXPECT(opponent->item == ITEM_LEFTOVERS);
    }
}

SINGLE_BATTLE_TEST("Knock Off does not remove items if target is immune")
{
    GIVEN {
        ASSUME(GetMoveEffect(MOVE_ELECTRIFY) == EFFECT_ELECTRIFY);
        ASSUME(GetSpeciesType(SPECIES_DONPHAN, 0) == TYPE_GROUND || GetSpeciesType(SPECIES_DONPHAN, 1) == TYPE_GROUND);
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_DONPHAN) { Item(ITEM_LEFTOVERS); };
    } WHEN {
        TURN { MOVE(opponent, MOVE_ELECTRIFY); MOVE(player, MOVE_KNOCK_OFF); }
    } SCENE {
        NONE_OF {
            ANIMATION(ANIM_TYPE_MOVE, MOVE_KNOCK_OFF, player);
            ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_ITEM_KNOCKOFF);
        }
    } THEN {
        EXPECT(opponent->item == ITEM_LEFTOVERS);
    }
}

SINGLE_BATTLE_TEST("Recycle cannot recover an item removed by Knock Off")
{
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET) { Item(ITEM_LEFTOVERS); }
    } WHEN {
        TURN { MOVE(player, MOVE_KNOCK_OFF);
               MOVE(opponent, MOVE_RECYCLE); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_KNOCK_OFF, player);
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_ITEM_KNOCKOFF);
        MESSAGE("Wobbuffet knocked off the opposing Wobbuffet's Leftovers!");

        MESSAGE("The opposing Wobbuffet used Recycle!");
        MESSAGE("But it failed!");
    } THEN {
        EXPECT(opponent->item == ITEM_NONE);
    }
}

SINGLE_BATTLE_TEST("Knock Off does not prevent targets from receiving another item in Gen 5+")
{
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET) { Item(ITEM_LEFTOVERS); }
        OPPONENT(SPECIES_WOBBUFFET) { Item(ITEM_LEFTOVERS); }
    } WHEN {
        TURN { MOVE(player, MOVE_KNOCK_OFF); }
        TURN { MOVE(player, MOVE_BESTOW); }
    } SCENE {
        // turn 1
        ANIMATION(ANIM_TYPE_MOVE, MOVE_KNOCK_OFF, player);
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_ITEM_KNOCKOFF);
        MESSAGE("Wobbuffet knocked off the opposing Wobbuffet's Leftovers!");
        // turn 2
        if (B_KNOCK_OFF_REMOVAL >= GEN_5) {
            ANIMATION(ANIM_TYPE_MOVE, MOVE_BESTOW, player);
            ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_HELD_ITEM_EFFECT);
            MESSAGE("The opposing Wobbuffet restored a little HP using its Leftovers!");
        } else {
            NOT { ANIMATION(ANIM_TYPE_MOVE, MOVE_BESTOW, player); }
            MESSAGE("But it failed!");
        }
    } THEN {
        if (B_KNOCK_OFF_REMOVAL >= GEN_5)
            EXPECT(opponent->item == ITEM_LEFTOVERS);
        else
            EXPECT(opponent->item == ITEM_NONE);
    }
}

// Knock Off triggers Unburden regardless of whether the item is fully removed (Gen 5+) or not.
SINGLE_BATTLE_TEST("Knock Off triggers Unburden")
{
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET) { Speed(60); }
        OPPONENT(SPECIES_WOBBUFFET) { Ability(ABILITY_UNBURDEN); Item(ITEM_LEFTOVERS); Speed(50); }
    } WHEN {
        TURN { MOVE(player, MOVE_KNOCK_OFF); }
        TURN { MOVE(player, MOVE_CELEBRATE); }
    } SCENE {
        // turn 1
        ANIMATION(ANIM_TYPE_MOVE, MOVE_KNOCK_OFF, player);
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_ITEM_KNOCKOFF);
        MESSAGE("Wobbuffet knocked off the opposing Wobbuffet's Leftovers!");
        // turn 2
        MESSAGE("The opposing Wobbuffet used Celebrate!");
        MESSAGE("Wobbuffet used Celebrate!");
    } THEN {
        EXPECT(opponent->item == ITEM_NONE);
    }
}

DOUBLE_BATTLE_TEST("Knock Off does not trigger the opposing ally's Symbiosis")
{
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET) { Item(ITEM_LEFTOVERS); }
        PLAYER(SPECIES_FLORGES) { Item(ITEM_LEFTOVERS); }
        OPPONENT(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(opponentLeft, MOVE_KNOCK_OFF, target: playerLeft); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_KNOCK_OFF, opponentLeft);
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_ITEM_KNOCKOFF);
        MESSAGE("The opposing Wobbuffet knocked off Wobbuffet's Leftovers!");
        NONE_OF {
            ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_HELD_ITEM_EFFECT);
            MESSAGE("Wobbuffet restored its health using its Leftovers!");
        }
    } THEN {
        EXPECT(playerLeft->item == ITEM_NONE);
    }
}

SINGLE_BATTLE_TEST("Knock Off does knock off Mega Stones from Pokemon that don't actually use them")
{
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET) { Item(ITEM_ABSOLITE); }
    } WHEN {
        TURN { MOVE(opponent, MOVE_CELEBRATE); MOVE(player, MOVE_KNOCK_OFF); }
    } SCENE {
        MESSAGE("Wobbuffet knocked off the opposing Wobbuffet's Absolite!");
    }
}

SINGLE_BATTLE_TEST("Knock Off doesn't knock off Mega Stones from Pokemon that actually use them")
{
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_ABSOL) { Item(ITEM_ABSOLITE); }
    } WHEN {
        TURN { MOVE(opponent, MOVE_CELEBRATE); MOVE(player, MOVE_KNOCK_OFF); }
    } SCENE {
        NOT MESSAGE("Wobbuffet knocked off the opposing Absol's Absolite!");
    }
}

SINGLE_BATTLE_TEST("Knock Off does knock off Orbs for Primal Reversion from Pokemon that don't actually use them")
{
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET) { Item(ITEM_RED_ORB); }
    } WHEN {
        TURN { MOVE(opponent, MOVE_CELEBRATE); MOVE(player, MOVE_KNOCK_OFF); }
    } SCENE {
        MESSAGE("Wobbuffet knocked off the opposing Wobbuffet's Red Orb!");
    }
}

SINGLE_BATTLE_TEST("Knock Off doesn't knock off Orbs for Primal Reversion from Pokemon that actually use them")
{
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_GROUDON) { Item(ITEM_RED_ORB); }
    } WHEN {
        TURN { MOVE(opponent, MOVE_CELEBRATE); MOVE(player, MOVE_KNOCK_OFF); }
    } SCENE {
        NOT MESSAGE("Wobbuffet knocked off the opposing Groudon's Red Orb!");
    }
}

SINGLE_BATTLE_TEST("Knock Off doesn't knock off Z-Crystals")
{
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET) { Item(ITEM_ELECTRIUM_Z); }
    } WHEN {
        TURN { MOVE(opponent, MOVE_CELEBRATE); MOVE(player, MOVE_KNOCK_OFF); }
    } SCENE {
        NOT MESSAGE("Wobbuffet knocked off the opposing Wobbuffet's Electrium Z!");
    }
}

SINGLE_BATTLE_TEST("Knock Off doesn't knock off Ultranecrozium Z from Pokemon that actually use it")
{
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_NECROZMA_DUSK_MANE) { Item(ITEM_ULTRANECROZIUM_Z); }
    } WHEN {
        TURN { MOVE(opponent, MOVE_CELEBRATE); MOVE(player, MOVE_KNOCK_OFF); }
    } SCENE {
        NOT MESSAGE("Wobbuffet knocked off the opposing Necrozma's Ultranecrozium Z!");
    }
}

SINGLE_BATTLE_TEST("Knock Off does knock off other form-change hold items from Pokemon that don't actually use them")
{
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET) { Item(ITEM_SKY_PLATE); }
    } WHEN {
        TURN { MOVE(opponent, MOVE_CELEBRATE); MOVE(player, MOVE_KNOCK_OFF); }
    } SCENE {
        MESSAGE("Wobbuffet knocked off the opposing Wobbuffet's Sky Plate!");
    }
}

SINGLE_BATTLE_TEST("Knock Off doesn't knock off other form-change hold items from Pokemon that actually use them")
{
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_ARCEUS) { Item(ITEM_SKY_PLATE); }
    } WHEN {
        TURN { MOVE(opponent, MOVE_CELEBRATE); MOVE(player, MOVE_KNOCK_OFF); }
    } SCENE {
        NOT MESSAGE("Wobbuffet knocked off the opposing Arceus's Sky Plate!");
    }
}

SINGLE_BATTLE_TEST("Knock Off does knock off begin-battle form-change hold items from Pokemon that don't actually use them")
{
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET) { Item(ITEM_RUSTED_SHIELD); }
    } WHEN {
        TURN { MOVE(opponent, MOVE_CELEBRATE); MOVE(player, MOVE_KNOCK_OFF); }
    } SCENE {
        MESSAGE("Wobbuffet knocked off the opposing Wobbuffet's Rusted Shield!");
    }
}

SINGLE_BATTLE_TEST("Knock Off doesn't knock off begin-battle form-change hold items from Pokemon that actually use them")
{
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_ZAMAZENTA_HERO) { Item(ITEM_RUSTED_SHIELD); }
    } WHEN {
        TURN { MOVE(opponent, MOVE_CELEBRATE); MOVE(player, MOVE_KNOCK_OFF); }
    } SCENE {
        NOT MESSAGE("Wobbuffet knocked off the opposing Zamazenta's Rusted Shield!");
    }
}

SINGLE_BATTLE_TEST("Knock Off does not activate if user faints")
{
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET) { HP(1); }
        OPPONENT(SPECIES_WOBBUFFET) { Item(ITEM_ROCKY_HELMET); }
    } WHEN {
        TURN { MOVE(player, MOVE_KNOCK_OFF); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_KNOCK_OFF, player);
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_HELD_ITEM_EFFECT, opponent);
        MESSAGE("Wobbuffet was hurt by the opposing Wobbuffet's Rocky Helmet!");
        MESSAGE("Wobbuffet fainted!");
    } THEN {
        EXPECT(opponent->item == ITEM_ROCKY_HELMET);
    }
}

SINGLE_BATTLE_TEST("Knock Off doesn't remove item if it's prevented by Sticky Hold")
{
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_MUK) { MaxHP(100); HP(51); Item(ITEM_ORAN_BERRY); Ability(ABILITY_STICKY_HOLD); }
    } WHEN {
        TURN { MOVE(opponent, MOVE_CELEBRATE); MOVE(player, MOVE_KNOCK_OFF); }
    } SCENE {
        ABILITY_POPUP(opponent, ABILITY_STICKY_HOLD);
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_HELD_ITEM_EFFECT, opponent);
    }
}

SINGLE_BATTLE_TEST("Knock Off does not activate if the item was previously consumed")
{
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET) { Item(ITEM_AIR_BALLOON); }
    } WHEN {
        TURN { MOVE(player, MOVE_KNOCK_OFF); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_KNOCK_OFF, player);
        MESSAGE("The opposing Wobbuffet's Air Balloon popped!");
        NOT MESSAGE("Wobbuffet knocked off the opposing Wobbuffet's Air Balloon!");
    } THEN {
        EXPECT(opponent->item == ITEM_NONE);
    }
}
