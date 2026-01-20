#include "global.h"
#include "test/battle.h"

DOUBLE_BATTLE_TEST("Strong winds remove Flying-type weaknesses of all battlers") // Electric, Ice, Rock
{
    enum Move move;
    bool32 targetPlayer;

    PARAMETRIZE { move = MOVE_THUNDER_SHOCK; targetPlayer = TRUE; }
    PARAMETRIZE { move = MOVE_ICE_BEAM; targetPlayer = TRUE; }
    PARAMETRIZE { move = MOVE_ROCK_THROW; targetPlayer = TRUE; }
    PARAMETRIZE { move = MOVE_THUNDER_SHOCK; targetPlayer = FALSE; }
    PARAMETRIZE { move = MOVE_ICE_BEAM; targetPlayer = FALSE; }
    PARAMETRIZE { move = MOVE_ROCK_THROW; targetPlayer = FALSE; }

    GIVEN {
        ASSUME(GetMoveType(MOVE_THUNDER_SHOCK) == TYPE_ELECTRIC);
        ASSUME(GetMoveType(MOVE_ICE_BEAM) == TYPE_ICE);
        ASSUME(GetMoveType(MOVE_ROCK_THROW) == TYPE_ROCK);
        ASSUME(GetSpeciesType(SPECIES_PIDGEY, 0) == TYPE_NORMAL);
        ASSUME(GetSpeciesType(SPECIES_PIDGEY, 1) == TYPE_FLYING);
        PLAYER(SPECIES_RAYQUAZA) { Ability(ABILITY_DELTA_STREAM); }
        PLAYER(SPECIES_PIDGEY);
        OPPONENT(SPECIES_PIDGEY);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        if (targetPlayer)
            TURN { MOVE(opponentLeft, move, target: playerRight); }
        else
            TURN { MOVE(playerRight, move, target: opponentLeft); }
    } SCENE {
        if (targetPlayer) {
            if (move == MOVE_THUNDER_SHOCK)
                MESSAGE("The opposing Pidgey used Thunder Shock!");
            else if (move == MOVE_ICE_BEAM)
                MESSAGE("The opposing Pidgey used Ice Beam!");
            else
                MESSAGE("The opposing Pidgey used Rock Throw!");
            MESSAGE("The mysterious strong winds weakened the attack!");
            ANIMATION(ANIM_TYPE_MOVE, move, opponentLeft);
        } else {
            if (move == MOVE_THUNDER_SHOCK)
                MESSAGE("Pidgey used Thunder Shock!");
            else if (move == MOVE_ICE_BEAM)
                MESSAGE("Pidgey used Ice Beam!");
            else
                MESSAGE("Pidgey used Rock Throw!");
            MESSAGE("The mysterious strong winds weakened the attack!");
            ANIMATION(ANIM_TYPE_MOVE, move, playerRight);
        }
    }
}

DOUBLE_BATTLE_TEST("Strong winds remove Flying-type weaknesses of all battlers - Inverse Battle", s16 damagePlayer, s16 damageOpponent) // Bug, Fighting, Grass
{
    enum Move move;
    bool32 strongWinds;

    PARAMETRIZE { move = MOVE_BUG_BITE; strongWinds = FALSE; }
    PARAMETRIZE { move = MOVE_BUG_BITE; strongWinds = TRUE; }
    PARAMETRIZE { move = MOVE_KARATE_CHOP; strongWinds = FALSE; }
    PARAMETRIZE { move = MOVE_KARATE_CHOP; strongWinds = TRUE; }
    PARAMETRIZE { move = MOVE_VINE_WHIP; strongWinds = FALSE; }
    PARAMETRIZE { move = MOVE_VINE_WHIP; strongWinds = TRUE; }

    GIVEN {
        FLAG_SET(B_FLAG_INVERSE_BATTLE);
        ASSUME(GetMoveType(MOVE_BUG_BITE) == TYPE_BUG);
        ASSUME(GetMoveType(MOVE_KARATE_CHOP) == TYPE_FIGHTING);
        ASSUME(GetMoveType(MOVE_VINE_WHIP) == TYPE_GRASS);
        ASSUME(GetSpeciesType(SPECIES_TORNADUS, 0) == TYPE_FLYING);
        ASSUME(GetSpeciesType(SPECIES_TORNADUS, 1) == TYPE_FLYING);
        if (strongWinds)
            PLAYER(SPECIES_RAYQUAZA) { Ability(ABILITY_DELTA_STREAM); }
        else
            PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_TORNADUS);
        OPPONENT(SPECIES_TORNADUS);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN {
            MOVE(opponentLeft, move, target: playerRight);
            MOVE(playerRight, move, target: opponentLeft);
        }
    } SCENE {
        HP_BAR(playerRight, captureDamage: &results[i].damagePlayer);
        HP_BAR(opponentLeft, captureDamage: &results[i].damageOpponent);
    } FINALLY {
        EXPECT_GT(results[0].damagePlayer, results[1].damagePlayer);
        EXPECT_GT(results[0].damageOpponent, results[1].damageOpponent);
        EXPECT_GT(results[2].damagePlayer, results[3].damagePlayer);
        EXPECT_GT(results[2].damageOpponent, results[3].damageOpponent);
        EXPECT_GT(results[4].damagePlayer, results[5].damagePlayer);
        EXPECT_GT(results[4].damageOpponent, results[5].damageOpponent);
    }
}

SINGLE_BATTLE_TEST("Strong winds prevent Weakness Policy from activating on Flying-type weaknesses")
{
    GIVEN {
        ASSUME(GetItemHoldEffect(ITEM_WEAKNESS_POLICY) == HOLD_EFFECT_WEAKNESS_POLICY);
        ASSUME(GetMoveType(MOVE_THUNDER_SHOCK) == TYPE_ELECTRIC);
        ASSUME(GetSpeciesType(SPECIES_PIDGEY, 0) == TYPE_NORMAL);
        ASSUME(GetSpeciesType(SPECIES_PIDGEY, 1) == TYPE_FLYING);
        PLAYER(SPECIES_RAYQUAZA) { Ability(ABILITY_DELTA_STREAM); Moves(MOVE_THUNDER_SHOCK); }
        OPPONENT(SPECIES_PIDGEY) { Item(ITEM_WEAKNESS_POLICY); }
    } WHEN {
        TURN { MOVE(player, MOVE_THUNDER_SHOCK); }
    } SCENE {
        MESSAGE("Rayquaza used Thunder Shock!");
        MESSAGE("The mysterious strong winds weakened the attack!");
        ANIMATION(ANIM_TYPE_MOVE, MOVE_THUNDER_SHOCK, player);
        HP_BAR(opponent);
        NOT ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_HELD_ITEM_EFFECT, opponent);
    }
}

SINGLE_BATTLE_TEST("Anticipation still triggers with Strong Winds active")
{
    GIVEN {
        ASSUME(GetMoveType(MOVE_THUNDER_SHOCK) == TYPE_ELECTRIC);
        ASSUME(GetSpeciesType(SPECIES_PIDGEY, 0) == TYPE_NORMAL);
        ASSUME(GetSpeciesType(SPECIES_PIDGEY, 1) == TYPE_FLYING);
        PLAYER(SPECIES_RAYQUAZA) { Ability(ABILITY_DELTA_STREAM); Moves(MOVE_THUNDER_SHOCK, MOVE_CELEBRATE); }
        OPPONENT(SPECIES_PIDGEY) { Ability(ABILITY_ANTICIPATION); Moves(MOVE_CELEBRATE); }
    } WHEN {
        TURN { MOVE(player, MOVE_CELEBRATE); MOVE(opponent, MOVE_CELEBRATE); }
    } SCENE {
        ABILITY_POPUP(opponent, ABILITY_ANTICIPATION);
        MESSAGE("Rayquaza used Celebrate!");
        MESSAGE("The opposing Pidgey used Celebrate!");
    }
}

SINGLE_BATTLE_TEST("Anticipation still triggers with Strong Winds active in Inverse Battle")
{
    GIVEN {
        FLAG_SET(B_FLAG_INVERSE_BATTLE);
        ASSUME(GetMoveType(MOVE_VINE_WHIP) == TYPE_GRASS);
        ASSUME(GetSpeciesType(SPECIES_TORNADUS, 0) == TYPE_FLYING);
        ASSUME(GetSpeciesType(SPECIES_TORNADUS, 1) == TYPE_FLYING);
        PLAYER(SPECIES_RAYQUAZA) { Ability(ABILITY_DELTA_STREAM); Moves(MOVE_VINE_WHIP, MOVE_CELEBRATE); }
        OPPONENT(SPECIES_TORNADUS) { Ability(ABILITY_ANTICIPATION); Moves(MOVE_CELEBRATE); }
    } WHEN {
        TURN { MOVE(player, MOVE_CELEBRATE); MOVE(opponent, MOVE_CELEBRATE); }
    } SCENE {
        ABILITY_POPUP(opponent, ABILITY_ANTICIPATION);
        MESSAGE("Rayquaza used Celebrate!");
        MESSAGE("The opposing Tornadus used Celebrate!");
    }
}

SINGLE_BATTLE_TEST("Strong winds don't affect Stealth Rock's damage")
{
    GIVEN {
        ASSUME(GetMoveEffect(MOVE_STEALTH_ROCK) == EFFECT_STEALTH_ROCK);
        ASSUME(GetSpeciesType(SPECIES_PIDGEY, 0) == TYPE_NORMAL);
        ASSUME(GetSpeciesType(SPECIES_PIDGEY, 1) == TYPE_FLYING);
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_PIDGEY);
        OPPONENT(SPECIES_RAYQUAZA) { Ability(ABILITY_DELTA_STREAM); }
    } WHEN {
        TURN { MOVE(opponent, MOVE_STEALTH_ROCK); }
        TURN { SWITCH(player, 1); }
    } SCENE {
        s32 maxHP = GetMonData(&PLAYER_PARTY[1], MON_DATA_MAX_HP);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_STEALTH_ROCK, opponent);
        HP_BAR(player, damage: maxHP / 4);
    }
}

SINGLE_BATTLE_TEST("Strong winds block weather-setting moves")
{
    enum Move move;
    PARAMETRIZE { move = MOVE_SUNNY_DAY; }
    PARAMETRIZE { move = MOVE_RAIN_DANCE; }
    PARAMETRIZE { move = MOVE_SANDSTORM; }
    PARAMETRIZE { move = MOVE_HAIL; }
    PARAMETRIZE { move = MOVE_SNOWSCAPE; }

    GIVEN {
        ASSUME(GetMoveEffect(move) == EFFECT_WEATHER);
        ASSUME(GetMoveWeatherType(MOVE_SUNNY_DAY) == BATTLE_WEATHER_SUN);
        ASSUME(GetMoveWeatherType(MOVE_RAIN_DANCE) == BATTLE_WEATHER_RAIN);
        ASSUME(GetMoveWeatherType(MOVE_SANDSTORM) == BATTLE_WEATHER_SANDSTORM);
        ASSUME(GetMoveWeatherType(MOVE_HAIL) == BATTLE_WEATHER_HAIL);
        ASSUME(GetMoveWeatherType(MOVE_SNOWSCAPE) == BATTLE_WEATHER_SNOW);
        PLAYER(SPECIES_RAYQUAZA) { Ability(ABILITY_DELTA_STREAM); }
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(opponent, move); }
    } SCENE {
        NOT ANIMATION(ANIM_TYPE_MOVE, move, opponent);
    } THEN {
        EXPECT(gBattleWeather & B_WEATHER_STRONG_WINDS);
    }
}

SINGLE_BATTLE_TEST("Strong winds prevent other weather abilities")
{
    u16 ability, species;
    PARAMETRIZE { ability = ABILITY_DROUGHT;      species = SPECIES_NINETALES; }
    PARAMETRIZE { ability = ABILITY_DRIZZLE;      species = SPECIES_POLITOED; }
    PARAMETRIZE { ability = ABILITY_SAND_STREAM;  species = SPECIES_HIPPOWDON; }
    PARAMETRIZE { ability = ABILITY_SNOW_WARNING; species = SPECIES_ABOMASNOW; }

    GIVEN {
        PLAYER(SPECIES_RAYQUAZA) { Ability(ABILITY_DELTA_STREAM); }
        OPPONENT(SPECIES_WOBBUFFET);
        OPPONENT(species) { Ability(ability); }
    } WHEN {
        TURN { SWITCH(opponent, 1); }
    } SCENE {
        ABILITY_POPUP(opponent, ability);
    } THEN {
        EXPECT(gBattleWeather & B_WEATHER_STRONG_WINDS);
    }
}

SINGLE_BATTLE_TEST("Strong winds can be replaced by Desolate Land")
{
    GIVEN {
        PLAYER(SPECIES_RAYQUAZA) { Ability(ABILITY_DELTA_STREAM); }
        OPPONENT(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_GROUDON) { Item(ITEM_RED_ORB); }
    } WHEN {
        TURN { SWITCH(opponent, 1); }
    } SCENE {
        ABILITY_POPUP(opponent, ABILITY_DESOLATE_LAND);
        MESSAGE("The sunlight turned extremely harsh!");
    } THEN {
        EXPECT(gBattleWeather & B_WEATHER_SUN_PRIMAL);
    }
}

SINGLE_BATTLE_TEST("Strong winds can be replaced by Primordial Sea")
{
    GIVEN {
        PLAYER(SPECIES_RAYQUAZA) { Ability(ABILITY_DELTA_STREAM); }
        OPPONENT(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_KYOGRE) { Item(ITEM_BLUE_ORB); }
    } WHEN {
        TURN { SWITCH(opponent, 1); }
    } SCENE {
        ABILITY_POPUP(opponent, ABILITY_PRIMORDIAL_SEA);
        MESSAGE("A heavy rain began to fall!");
    } THEN {
        EXPECT(gBattleWeather & B_WEATHER_RAIN_PRIMAL);
    }
}
