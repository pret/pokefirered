#include "global.h"
#include "test/battle.h"

TO_DO_BATTLE_TEST("Gear Up increases the Attack and Sp. Attack of the user and allies if they have Plus or Minus")

AI_DOUBLE_BATTLE_TEST("AI uses Gear Up")
{
    GIVEN {
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT | AI_FLAG_OMNISCIENT);
        PLAYER(SPECIES_WOBBUFFET) { Moves(MOVE_POUND, MOVE_CELEBRATE); }
        PLAYER(SPECIES_WOBBUFFET) { Moves(MOVE_POUND, MOVE_CELEBRATE); }
        OPPONENT(SPECIES_KLINKLANG) { Ability(ABILITY_PLUS); Moves(MOVE_GEAR_UP, MOVE_WATER_GUN, MOVE_POUND); }
        OPPONENT(SPECIES_KLINKLANG) { Ability(ABILITY_PLUS); Moves(MOVE_GEAR_UP, MOVE_WATER_GUN, MOVE_POUND); }
    } WHEN {
        TURN { EXPECT_MOVE(opponentLeft, MOVE_GEAR_UP); }
    }
}
