#include "global.h"
#include "test/battle.h"

SINGLE_BATTLE_TEST("Beast Boost boosts the most proficient stat when knocking out a target")
{
    u8 stats[] = {1, 1, 1, 1, 1};
    PARAMETRIZE { stats[0] = 255; }
    PARAMETRIZE { stats[1] = 255; }
    PARAMETRIZE { stats[2] = 255; }
    PARAMETRIZE { stats[3] = 255; }
    PARAMETRIZE { stats[4] = 255; }
    GIVEN {
        PLAYER(SPECIES_NIHILEGO) { Ability(ABILITY_BEAST_BOOST); Attack(stats[0]); Defense(stats[1]); SpAttack(stats[2]); SpDefense(stats[3]); Speed(stats[4]); }
        OPPONENT(SPECIES_WOBBUFFET) { HP(1); Speed(1); }
        OPPONENT(SPECIES_WOBBUFFET) { Speed(1); }
    } WHEN {
        TURN { MOVE(player, MOVE_SCRATCH); SEND_OUT(opponent, 1); }
    } SCENE {
        ABILITY_POPUP(player, ABILITY_BEAST_BOOST);
        switch(i) {
            case 0:
                MESSAGE("Nihilego's Attack rose!");
                break;
            case 1:
                MESSAGE("Nihilego's Defense rose!");
                break;
            case 2:
                MESSAGE("Nihilego's Sp. Atk rose!");
                break;
            case 3:
                MESSAGE("Nihilego's Sp. Def rose!");
                break;
            case 4:
                MESSAGE("Nihilego's Speed rose!");
                break;
        }
    }
}

SINGLE_BATTLE_TEST("Beast Boost doesn't trigger if user is fainted")
{
    GIVEN {
        ASSUME(GetMoveEffect(MOVE_DESTINY_BOND) == EFFECT_DESTINY_BOND);
        ASSUME(GetMovePower(MOVE_SCRATCH) > 0);
        PLAYER(SPECIES_WOBBUFFET) { HP(1); }
        PLAYER(SPECIES_WYNAUT);
        OPPONENT(SPECIES_KARTANA) { Ability(ABILITY_BEAST_BOOST); }
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(player, MOVE_DESTINY_BOND); MOVE(opponent, MOVE_SCRATCH); SEND_OUT(player, 1); SEND_OUT(opponent, 1); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_DESTINY_BOND, player);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_SCRATCH, opponent);
        NOT ABILITY_POPUP(opponent, ABILITY_BEAST_BOOST);
        SEND_IN_MESSAGE("Wynaut");
        MESSAGE("2 sent out Wobbuffet!");
    }
}

SINGLE_BATTLE_TEST("Beast Boost prioritizes stats in the case of a tie in the following order: Atk, Def, Sp.Atk, Sp.Def, Speed")
{
    u8 stats[] = {1, 1, 1, 1, 1};

    PARAMETRIZE { stats[4] = 255; stats[3] = 255; stats[2] = 255; stats[1] = 255; stats[0] = 255; }
    PARAMETRIZE { stats[4] = 255; stats[3] = 255; stats[2] = 255; stats[1] = 255; }
    PARAMETRIZE { stats[4] = 255; stats[3] = 255; stats[2] = 255; }
    PARAMETRIZE { stats[4] = 255; stats[3] = 255; }
    GIVEN {
        PLAYER(SPECIES_NIHILEGO) { Ability(ABILITY_BEAST_BOOST); Attack(stats[0]); Defense(stats[1]); SpAttack(stats[2]); SpDefense(stats[3]); Speed(stats[4]); }
        OPPONENT(SPECIES_WOBBUFFET) { HP(1); Speed(1); }
        OPPONENT(SPECIES_WOBBUFFET) { Speed(1); }
    } WHEN {
        TURN { MOVE(player, MOVE_SCRATCH); SEND_OUT(opponent, 1); }
    } SCENE {
        ABILITY_POPUP(player, ABILITY_BEAST_BOOST);
        switch(i) {
            case 0:
                MESSAGE("Nihilego's Attack rose!");
                break;
            case 1:
                MESSAGE("Nihilego's Defense rose!");
                break;
            case 2:
                MESSAGE("Nihilego's Sp. Atk rose!");
                break;
            case 3:
                MESSAGE("Nihilego's Sp. Def rose!");
                break;
        }
    }
}

TO_DO_BATTLE_TEST("Beast Boost considers Power Split");
TO_DO_BATTLE_TEST("Beast Boost considers Guard Split");
TO_DO_BATTLE_TEST("Beast Boost considers Power Trick");
TO_DO_BATTLE_TEST("Beast Boost considers Wonder Room");
TO_DO_BATTLE_TEST("Beast Boost considers Speed Swap");
TO_DO_BATTLE_TEST("Beast Boost doesn't consider stat stages");
TO_DO_BATTLE_TEST("Beast Boost doesn't consider held items");
TO_DO_BATTLE_TEST("Beast Boost doesn't consider status condition reductions");
