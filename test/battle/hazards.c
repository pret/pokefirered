#include "global.h"
#include "test/battle.h"

SINGLE_BATTLE_TEST("Hazards are applied based on order of set up")
{
    GIVEN {
        PLAYER(SPECIES_WYNAUT);
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_GRIMER);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(opponent, MOVE_TOXIC_SPIKES); }
        TURN { MOVE(opponent, MOVE_STEALTH_ROCK); }
        TURN { MOVE(opponent, MOVE_STICKY_WEB); }
        TURN { MOVE(opponent, MOVE_SPIKES); }
        TURN { MOVE(opponent, MOVE_STEALTH_ROCK); SWITCH(player, 1); }
        TURN { MOVE(opponent, MOVE_STEALTH_ROCK); SWITCH(player, 2); }
        TURN { MOVE(opponent, MOVE_STEALTH_ROCK); SWITCH(player, 0); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_TOXIC_SPIKES, opponent);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_STEALTH_ROCK, opponent);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_STICKY_WEB, opponent);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_SPIKES, opponent);
        MESSAGE("Wobbuffet was poisoned!");
        MESSAGE("Pointed stones dug into Wobbuffet!");
        MESSAGE("Wobbuffet was caught in a sticky web!");
        MESSAGE("Wobbuffet was hurt by the spikes!");
        MESSAGE("The poison spikes disappeared from the ground around your team!");
        MESSAGE("Pointed stones dug into Wynaut!");
        MESSAGE("Wynaut was caught in a sticky web!");
        MESSAGE("Wynaut was hurt by the spikes!");
    } THEN {
        EXPECT_EQ(gBattleStruct->hazardsQueue[0][0], HAZARDS_STEALTH_ROCK);
        EXPECT_EQ(gBattleStruct->hazardsQueue[0][1], HAZARDS_STICKY_WEB);
        EXPECT_EQ(gBattleStruct->hazardsQueue[0][2], HAZARDS_SPIKES);
        EXPECT_EQ(gBattleStruct->hazardsQueue[0][3], HAZARDS_NONE);
        EXPECT_EQ(gBattleStruct->hazardsQueue[0][4], HAZARDS_NONE);
        EXPECT_EQ(gBattleStruct->hazardsQueue[0][5], HAZARDS_NONE);
    }
}
