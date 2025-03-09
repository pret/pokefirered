#include "global.h"
#include "test/battle.h"

SINGLE_BATTLE_TEST("Innards Out deal dmg on fainting equal to the amount of dmg inflicted on the Innards Out mon")
{
    u16 hp = 0;
    PARAMETRIZE { hp = 5; }
    PARAMETRIZE { hp = 15; }
    PARAMETRIZE { hp = 50; }
    PARAMETRIZE { hp = 100; } // This takes out Wobbuffet.

    GIVEN {
        PLAYER(SPECIES_PYUKUMUKU) { HP(hp); Ability(ABILITY_INNARDS_OUT); }
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET) { HP(70); SpAttack(1000); }
        OPPONENT(SPECIES_WOBBUFFET);
        ASSUME(!IsBattleMoveStatus(MOVE_PSYCHIC));
        ASSUME(GetMoveCategory(MOVE_PSYCHIC) == DAMAGE_CATEGORY_SPECIAL);
    } WHEN {
        TURN { MOVE(opponent, MOVE_PSYCHIC); SEND_OUT(player, 1); if (hp == 100) { SEND_OUT(opponent, 1); } }
    } SCENE {
        MESSAGE("The opposing Wobbuffet used Psychic!");
        HP_BAR(player, hp);
        ABILITY_POPUP(player, ABILITY_INNARDS_OUT);
        HP_BAR(opponent, hp);
    }
}

SINGLE_BATTLE_TEST("Innards Out does not trigger after Gastro Acid has been used")
{
    GIVEN {
        PLAYER(SPECIES_PYUKUMUKU) { HP(1); Ability(ABILITY_INNARDS_OUT); }
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
        ASSUME(!IsBattleMoveStatus(MOVE_PSYCHIC));
        ASSUME(GetMoveEffect(MOVE_GASTRO_ACID) == EFFECT_GASTRO_ACID);
    } WHEN {
        TURN { MOVE(opponent, MOVE_GASTRO_ACID); }
        TURN { MOVE(opponent, MOVE_PSYCHIC); SEND_OUT(player, 1); }
    } SCENE {
        MESSAGE("The opposing Wobbuffet used Gastro Acid!");
        MESSAGE("The opposing Wobbuffet used Psychic!");
        HP_BAR(player);
        NONE_OF {
            ABILITY_POPUP(player, ABILITY_INNARDS_OUT);
            HP_BAR(opponent);
        }
    }
}

// According to Showdown Innards Out triggers, but does nothing.
SINGLE_BATTLE_TEST("Innards Out does not damage Magic Guard Pokemon")
{
    GIVEN {
        PLAYER(SPECIES_PYUKUMUKU) { HP(1); Ability(ABILITY_INNARDS_OUT); }
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_CLEFABLE) { Ability(ABILITY_MAGIC_GUARD); }
        ASSUME(!IsBattleMoveStatus(MOVE_PSYCHIC));
    } WHEN {
        TURN { MOVE(opponent, MOVE_PSYCHIC); SEND_OUT(player, 1); }
    } SCENE {
        MESSAGE("The opposing Clefable used Psychic!");
        HP_BAR(player);
        ABILITY_POPUP(player, ABILITY_INNARDS_OUT);
        NOT HP_BAR(opponent);
    }
}

SINGLE_BATTLE_TEST("Innards Out uses correct damage amount for Future Sight")
{
    GIVEN {
        ASSUME(GetMoveEffect(MOVE_FUTURE_SIGHT) == EFFECT_FUTURE_SIGHT);
        PLAYER(SPECIES_PYUKUMUKU) { HP(1); Ability(ABILITY_INNARDS_OUT); }
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WYNAUT);
    } WHEN {
        TURN { MOVE(opponent, MOVE_FUTURE_SIGHT); }
        TURN { }
        TURN { SEND_OUT(player, 1); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_FUTURE_SIGHT, opponent);
        MESSAGE("Pyukumuku took the Future Sight attack!");
        HP_BAR(player);
        ABILITY_POPUP(player, ABILITY_INNARDS_OUT);
        HP_BAR(opponent, damage: 1);
    }
}

SINGLE_BATTLE_TEST("Innards Out doesn't trigger if Future Sight user is not on field")
{
    GIVEN {
        ASSUME(GetMoveEffect(MOVE_FUTURE_SIGHT) == EFFECT_FUTURE_SIGHT);
        PLAYER(SPECIES_PYUKUMUKU) { HP(1); Ability(ABILITY_INNARDS_OUT); }
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WYNAUT);
    } WHEN {
        TURN { MOVE(opponent, MOVE_FUTURE_SIGHT); }
        TURN { SWITCH(opponent, 1); }
        TURN { SEND_OUT(player, 1); } //SEND_OUT(opponent, 0); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_FUTURE_SIGHT, opponent);
        MESSAGE("Pyukumuku took the Future Sight attack!");
        HP_BAR(player);
        NONE_OF {
         ABILITY_POPUP(player, ABILITY_INNARDS_OUT);
         HP_BAR(opponent);
        }
    }
}

SINGLE_BATTLE_TEST("Innards Out triggers if Future Sight user is back on the field")
{
    GIVEN {
        ASSUME(GetMoveEffect(MOVE_FUTURE_SIGHT) == EFFECT_FUTURE_SIGHT);
        PLAYER(SPECIES_PYUKUMUKU) { HP(1); Ability(ABILITY_INNARDS_OUT); }
        OPPONENT(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WYNAUT);
    } WHEN {
        TURN { MOVE(opponent, MOVE_FUTURE_SIGHT); }
        TURN { SWITCH(opponent, 1); }
        TURN { SWITCH(opponent, 0); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_FUTURE_SIGHT, opponent);
        MESSAGE("Pyukumuku took the Future Sight attack!");
        HP_BAR(player);
        ABILITY_POPUP(player, ABILITY_INNARDS_OUT);
        HP_BAR(opponent);
    }
}
