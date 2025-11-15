#include "global.h"
#include "test/battle.h"

SINGLE_BATTLE_TEST("Cursed Body triggers 30% of the time")
{
    PASSES_RANDOMLY(3, 10, RNG_CURSED_BODY);
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_FRILLISH) { Ability(ABILITY_CURSED_BODY); }
    } WHEN {
        TURN { MOVE(player, MOVE_AQUA_JET); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_AQUA_JET, player);
        ABILITY_POPUP(opponent, ABILITY_CURSED_BODY);
        MESSAGE("Wobbuffet's Aqua Jet was disabled by the opposing Frillish's Cursed Body!");
    }
}

SINGLE_BATTLE_TEST("Cursed Body cannot disable Struggle")
{
    GIVEN {
        ASSUME(GetItemHoldEffect(ITEM_CHOICE_SCARF) == HOLD_EFFECT_CHOICE_SCARF);
        ASSUME(GetMoveEffect(MOVE_TAUNT) == EFFECT_TAUNT);
        ASSUME(GetMoveCategory(MOVE_CELEBRATE) == DAMAGE_CATEGORY_STATUS);
        PLAYER(SPECIES_WOBBUFFET) { Item(ITEM_CHOICE_SCARF); Moves(MOVE_CELEBRATE); }
        OPPONENT(SPECIES_FRILLISH) { Ability(ABILITY_CURSED_BODY); }
    } WHEN {
        TURN { MOVE(player, MOVE_CELEBRATE); MOVE(opponent, MOVE_TAUNT); }
        TURN { FORCED_MOVE(player); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_STRUGGLE, player);
        NONE_OF {
            ABILITY_POPUP(opponent, ABILITY_CURSED_BODY);
            MESSAGE("Wobbuffet's Struggle was disabled by the opposing Frillish's Cursed Body!");
        }
    }
}

SINGLE_BATTLE_TEST("Cursed Body can trigger if the attacker is behind a Substitute")
{
    GIVEN {
        ASSUME(GetMoveEffect(MOVE_SUBSTITUTE) == EFFECT_SUBSTITUTE);
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_FRILLISH) { Ability(ABILITY_CURSED_BODY); }
    } WHEN {
        TURN { MOVE(player, MOVE_SUBSTITUTE); }
        TURN { MOVE(player, MOVE_AQUA_JET); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_AQUA_JET, player);
        ABILITY_POPUP(opponent, ABILITY_CURSED_BODY);
        MESSAGE("Wobbuffet's Aqua Jet was disabled by the opposing Frillish's Cursed Body!");
    }
}

SINGLE_BATTLE_TEST("Cursed Body cannot trigger if the target is behind a Substitute")
{
    GIVEN {
        ASSUME(GetMoveEffect(MOVE_SUBSTITUTE) == EFFECT_SUBSTITUTE);
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_FRILLISH) { Ability(ABILITY_CURSED_BODY); }
    } WHEN {
        TURN { MOVE(opponent, MOVE_SUBSTITUTE); }
        TURN { MOVE(player, MOVE_AQUA_JET); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_AQUA_JET, player);
        NONE_OF {
            ABILITY_POPUP(opponent, ABILITY_CURSED_BODY);
            MESSAGE("Wobbuffet's Aqua Jet was disabled by the opposing Frillish's Cursed Body!");
        }
    }
}

SINGLE_BATTLE_TEST("Cursed Body does not stop a multistrike move mid-execution")
{
    GIVEN {
        ASSUME(GetMoveEffect(MOVE_ROCK_BLAST) == EFFECT_MULTI_HIT);
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_FRILLISH) { Ability(ABILITY_CURSED_BODY); }
    } WHEN {
        TURN { MOVE(player, MOVE_ROCK_BLAST); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_ROCK_BLAST, player);
        HP_BAR(opponent);
        ABILITY_POPUP(opponent, ABILITY_CURSED_BODY);
        MESSAGE("Wobbuffet's Rock Blast was disabled by the opposing Frillish's Cursed Body!");
        HP_BAR(opponent);
    }
}

TO_DO_BATTLE_TEST("Cursed Body disables the move that called another move instead of the called move")
TO_DO_BATTLE_TEST("Cursed Body disables damaging Z-Moves, but not the base move") // Rotom Powers can restore Z-Moves
TO_DO_BATTLE_TEST("Cursed Body disables the base move of a status Z-Move")
