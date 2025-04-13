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
        TURN { MOVE(player, MOVE_TACKLE); SEND_OUT(opponent, 1); }
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
