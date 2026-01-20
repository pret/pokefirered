#include "global.h"
#include "test/battle.h"

// Effects of strong winds are handled in test/battle/weather/strong_winds.c

//TO_DO_BATTLE_TEST("Delta Stream doesn't activate if is sent-out in a rotated-out position (Rotation)")
//TO_DO_BATTLE_TEST("Delta Stream doesn't activate if is rotated-in (Rotation)")
DOUBLE_BATTLE_TEST("Delta Stream doesn't activate if there's already strong winds")
{
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_RAYQUAZA) { Ability(ABILITY_DELTA_STREAM); }
        OPPONENT(SPECIES_RAYQUAZA) { Ability(ABILITY_DELTA_STREAM); }
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { SWITCH(playerLeft, 2); }
    } SCENE {
        ABILITY_POPUP(opponentLeft, ABILITY_DELTA_STREAM);
        MESSAGE("Mysterious strong winds are protecting Flying-type Pokémon!");
        SWITCH_OUT_MESSAGE("Wobbuffet");
        SEND_IN_MESSAGE("Rayquaza");
        NONE_OF {
            ABILITY_POPUP(playerLeft, ABILITY_DELTA_STREAM);
            MESSAGE("Mysterious strong winds are protecting Flying-type Pokémon!");
        }
    }
}

DOUBLE_BATTLE_TEST("Strong winds continue as long as there's a Pokémon with Delta Stream on the field")
{
    GIVEN {
        PLAYER(SPECIES_RAYQUAZA) { Ability(ABILITY_DELTA_STREAM); HP(1); }
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_RAYQUAZA) { Ability(ABILITY_DELTA_STREAM); }
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(opponentLeft, MOVE_SCRATCH, target: playerLeft); SEND_OUT(playerLeft, 2); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_SCRATCH, opponentLeft);
        HP_BAR(playerLeft, hp: 0);
        MESSAGE("Rayquaza fainted!");
        SEND_IN_MESSAGE("Wobbuffet");
        NOT MESSAGE("The mysterious strong winds have dissipated!");
    } THEN {
        EXPECT(gBattleWeather & B_WEATHER_STRONG_WINDS);
    }
}
