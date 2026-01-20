#include "global.h"
#include "test/battle.h"

TO_DO_BATTLE_TEST("TODO: Write Lock-On/Mind Reader (Move Effect) test titles")

SINGLE_BATTLE_TEST("Lock-On volatile allows to hit through semi-invulnerability")
{
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(player, MOVE_LOCK_ON); MOVE(opponent, MOVE_FLY); }
        TURN { MOVE(player, MOVE_POUND); SKIP_TURN(opponent); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_LOCK_ON, player);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_FLY, opponent);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_POUND, player);
        HP_BAR(opponent); // Pound hit 
    }
}
