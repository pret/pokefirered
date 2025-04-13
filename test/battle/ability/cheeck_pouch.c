#include "global.h"
#include "test/battle.h"

SINGLE_BATTLE_TEST("Cheek Pouch activation doesn't mutate damage when restoring HP mid battle")
{
    s16 damage;
    s16 healing;

    GIVEN {
        PLAYER(SPECIES_GREEDENT) { Ability(ABILITY_CHEEK_POUCH); Item(ITEM_CHOPLE_BERRY); HP(100); }
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(opponent, MOVE_KARATE_CHOP); }
        ABILITY_POPUP(player, ABILITY_CHEEK_POUCH);
        HP_BAR(player, captureDamage: &healing);
        HP_BAR(player, captureDamage: &damage);
    } THEN {
        EXPECT_LT(healing, 0);
        EXPECT_GT(damage, 0);
    }
}
