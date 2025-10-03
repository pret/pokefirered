#include "global.h"
#include "test/battle.h"

TO_DO_BATTLE_TEST("Cheek Pouch restores 33% max HP")
TO_DO_BATTLE_TEST("Cheek Pouch restores HP after the berry's effect")
TO_DO_BATTLE_TEST("Cheek Pouch activates via Bug Bite/Pluck if it would trigger an effect")
TO_DO_BATTLE_TEST("Cheek Pouch activates when receiving from Fling if it would trigger an effect")
TO_DO_BATTLE_TEST("Cheek Pouch doesn't activate when using Natural Gift")
TO_DO_BATTLE_TEST("Cheek Pouch doesn't activate when using Fling")
TO_DO_BATTLE_TEST("Cheek Pouch doesn't activate when using a berry from the bag")
TO_DO_BATTLE_TEST("Cheek Pouch doesn't activate under Heal Block's effect")

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
