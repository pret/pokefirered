#include "global.h"
#include "test/battle.h"

SINGLE_BATTLE_TEST("Magician gets self-damage recoil after stealing Life Orb")
{
    GIVEN {
        ASSUME(gItemsInfo[ITEM_LIFE_ORB].holdEffect == HOLD_EFFECT_LIFE_ORB);
        ASSUME(!IsBattleMoveStatus(MOVE_SCRATCH));
        PLAYER(SPECIES_DELPHOX) { Ability(ABILITY_MAGICIAN); Item(ITEM_NONE); }
        OPPONENT(SPECIES_WOBBUFFET) { Item(ITEM_LIFE_ORB); }
    } WHEN {
        TURN { MOVE(player, MOVE_SCRATCH); }
        TURN { MOVE(player, MOVE_SCRATCH); }
    } SCENE {
        // 1st turn
        MESSAGE("Delphox used Scratch!");
        ABILITY_POPUP(player, ABILITY_MAGICIAN);
        MESSAGE("Delphox stole the opposing Wobbuffet's Life Orb!");
        HP_BAR(player);
        MESSAGE("Delphox was hurt by the Life Orb!");
        // 2nd turn - Life Orb recoil happens now
        MESSAGE("Delphox used Scratch!");
        HP_BAR(player);
        MESSAGE("Delphox was hurt by the Life Orb!");
    }
}

