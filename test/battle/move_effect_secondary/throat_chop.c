#include "global.h"
#include "test/battle.h"

ASSUMPTIONS
{
    ASSUME(MoveHasAdditionalEffect(MOVE_THROAT_CHOP, MOVE_EFFECT_THROAT_CHOP) == TRUE);
}

SINGLE_BATTLE_TEST("Throat Chop prevents the usage of sound moves")
{
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET) { Speed(100); };
        OPPONENT(SPECIES_WOBBUFFET) { Speed(50); };
    } WHEN {
        TURN { MOVE(player, MOVE_THROAT_CHOP); MOVE(opponent, MOVE_HYPER_VOICE); }
        TURN {}
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_THROAT_CHOP, player);
        HP_BAR(opponent);
        MESSAGE("The effects of Throat Chop prevent the opposing Wobbuffet from using certain moves!");
        NONE_OF {
            ANIMATION(ANIM_TYPE_MOVE, MOVE_HYPER_VOICE, opponent);
        }
    }
}

SINGLE_BATTLE_TEST("Throat Chop prevents sound base moves for 2 turns")
{
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET) { Moves(MOVE_HYPER_VOICE, MOVE_ALLURING_VOICE, MOVE_OVERDRIVE, MOVE_ROUND); }
    } WHEN {
        TURN { MOVE(opponent, MOVE_HYPER_VOICE); MOVE(player, MOVE_THROAT_CHOP); }
        TURN { FORCED_MOVE(opponent); }
        TURN { MOVE(opponent, MOVE_HYPER_VOICE); MOVE(player, MOVE_THROAT_CHOP); }
        TURN { FORCED_MOVE(opponent); }
        TURN { MOVE(opponent, MOVE_HYPER_VOICE); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_HYPER_VOICE, opponent);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_THROAT_CHOP, player);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_STRUGGLE, opponent);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_HYPER_VOICE, opponent);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_THROAT_CHOP, player);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_STRUGGLE, opponent);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_HYPER_VOICE, opponent);
    }
}
