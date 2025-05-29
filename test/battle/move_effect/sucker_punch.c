#include "global.h"
#include "test/battle.h"

SINGLE_BATTLE_TEST("Sucker Punch hits targets that are about to attack")
{
    GIVEN {
        ASSUME(GetMoveCategory(MOVE_SCRATCH) != DAMAGE_CATEGORY_STATUS);
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(player, MOVE_SUCKER_PUNCH); MOVE(opponent, MOVE_SCRATCH); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_SUCKER_PUNCH, player);
        HP_BAR(opponent);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_SCRATCH, opponent);
        HP_BAR(player);
    }
}

SINGLE_BATTLE_TEST("Sucker Punch doesn't hit targets using status moves")
{
    GIVEN {
        ASSUME(GetMoveCategory(MOVE_GROWL) == DAMAGE_CATEGORY_STATUS);
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(player, MOVE_SUCKER_PUNCH); MOVE(opponent, MOVE_GROWL); }
    } SCENE {
        NONE_OF {
            ANIMATION(ANIM_TYPE_MOVE, MOVE_SUCKER_PUNCH, player);
            HP_BAR(opponent);
        }
        ANIMATION(ANIM_TYPE_MOVE, MOVE_GROWL, opponent);
    }
}

SINGLE_BATTLE_TEST("Sucker Punch doesn't hit targets that has already moved")
{
    GIVEN {
        ASSUME(GetMovePriority(MOVE_QUICK_ATTACK) == GetMovePriority(MOVE_SUCKER_PUNCH));
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(opponent, MOVE_QUICK_ATTACK); MOVE(player, MOVE_SUCKER_PUNCH); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_QUICK_ATTACK, opponent);
        HP_BAR(player);
        NONE_OF {
            ANIMATION(ANIM_TYPE_MOVE, MOVE_SUCKER_PUNCH, player);
            HP_BAR(opponent);
        }
    }
}
