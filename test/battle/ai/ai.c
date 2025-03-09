#include "global.h"
#include "test/battle.h"
#include "battle_ai_util.h"

AI_SINGLE_BATTLE_TEST("AI prefers Bubble over Water Gun if it's slower")
{
    u32 speedPlayer, speedAi;

    PARAMETRIZE { speedPlayer = 200; speedAi = 10; }
    PARAMETRIZE { speedPlayer = 10; speedAi = 200; }

    GIVEN {
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT);
        PLAYER(SPECIES_SCIZOR) { Speed(speedPlayer); }
        OPPONENT(SPECIES_WOBBUFFET) { Moves(MOVE_WATER_GUN, MOVE_BUBBLE); Speed(speedAi); }
    } WHEN {
        if (speedPlayer > speedAi)
        {
            TURN { SCORE_GT(opponent, MOVE_BUBBLE, MOVE_WATER_GUN); }
            TURN { SCORE_GT(opponent, MOVE_BUBBLE, MOVE_WATER_GUN); }
        }
        else
        {
            TURN { SCORE_EQ(opponent, MOVE_BUBBLE, MOVE_WATER_GUN); }
            TURN { SCORE_EQ(opponent, MOVE_BUBBLE, MOVE_WATER_GUN); }
        }
    }
}

AI_SINGLE_BATTLE_TEST("AI prefers Water Gun over Bubble if it knows that foe has Contrary")
{
    u32 abilityAI;

    PARAMETRIZE { abilityAI = ABILITY_MOXIE; }
    PARAMETRIZE { abilityAI = ABILITY_MOLD_BREAKER; } // Mold Breaker ignores Contrary.
    GIVEN {
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT);
        PLAYER(SPECIES_SHUCKLE) { Ability(ABILITY_CONTRARY); }
        OPPONENT(SPECIES_PINSIR) { Moves(MOVE_WATER_GUN, MOVE_BUBBLE); Ability(abilityAI); }
    } WHEN {
            TURN { MOVE(player, MOVE_DEFENSE_CURL); }
            TURN { MOVE(player, MOVE_DEFENSE_CURL);
                   if (abilityAI == ABILITY_MOLD_BREAKER) { SCORE_EQ(opponent, MOVE_WATER_GUN, MOVE_BUBBLE); }
                   else { SCORE_GT(opponent, MOVE_WATER_GUN, MOVE_BUBBLE); }}
    } SCENE {
        MESSAGE("Shuckle's Defense fell!"); // Contrary activates
    } THEN {
        EXPECT(gBattleResources->aiData->abilities[B_POSITION_PLAYER_LEFT] == ABILITY_CONTRARY);
    }
}

AI_SINGLE_BATTLE_TEST("AI prefers moves with better accuracy, but only if they both require the same number of hits to ko")
{
    u16 move1 = MOVE_NONE, move2 = MOVE_NONE, move3 = MOVE_NONE, move4 = MOVE_NONE;
    u16 hp, expectedMove, turns, abilityAtk, expectedMove2;

    abilityAtk = ABILITY_NONE;
    expectedMove2 = MOVE_NONE;

    // Here it's a simple test, both Slam and Strength deal the same damage, but Strength always hits, whereas Slam often misses.
    PARAMETRIZE { move1 = MOVE_SLAM; move2 = MOVE_STRENGTH; move3 = MOVE_TACKLE; hp = 490; expectedMove = MOVE_STRENGTH; turns = 4; }
    PARAMETRIZE { move1 = MOVE_SLAM; move2 = MOVE_STRENGTH; move3 = MOVE_SWIFT; move4 = MOVE_TACKLE; hp = 365; expectedMove = MOVE_STRENGTH; turns = 3; }
    PARAMETRIZE { move1 = MOVE_SLAM; move2 = MOVE_STRENGTH; move3 = MOVE_SWIFT; move4 = MOVE_TACKLE; hp = 245; expectedMove = MOVE_STRENGTH; turns = 2; }
    PARAMETRIZE { move1 = MOVE_SLAM; move2 = MOVE_STRENGTH; move3 = MOVE_SWIFT; move4 = MOVE_TACKLE; hp = 125; expectedMove = MOVE_STRENGTH; turns = 1; }
    // Mega Kick deals more damage, but can miss more often. Here, AI should choose Mega Kick if it can faint target in less number of turns than Strength. Otherwise, it should use Strength.
    PARAMETRIZE { move1 = MOVE_MEGA_KICK; move2 = MOVE_STRENGTH; move3 = MOVE_SWIFT; move4 = MOVE_TACKLE; hp = 170; expectedMove = MOVE_MEGA_KICK; turns = 1; }
    PARAMETRIZE { move1 = MOVE_MEGA_KICK; move2 = MOVE_STRENGTH; move3 = MOVE_SWIFT; move4 = MOVE_TACKLE; hp = 245; expectedMove = MOVE_STRENGTH; turns = 2; }
    // Swift always hits and Guts has accuracy of 100%. Hustle lowers accuracy of all physical moves.
    PARAMETRIZE { abilityAtk = ABILITY_HUSTLE; move1 = MOVE_MEGA_KICK; move2 = MOVE_STRENGTH; move3 = MOVE_SWIFT; move4 = MOVE_TACKLE; hp = 5; expectedMove = MOVE_SWIFT; turns = 1; }
    PARAMETRIZE { abilityAtk = ABILITY_HUSTLE; move1 = MOVE_MEGA_KICK; move2 = MOVE_STRENGTH; move3 = MOVE_GUST; move4 = MOVE_TACKLE; hp = 5; expectedMove = MOVE_GUST; turns = 1; }
    // Mega Kick and Slam both have lower accuracy. Gust and Tackle both have 100, so AI can choose either of them.
    PARAMETRIZE { move1 = MOVE_MEGA_KICK; move2 = MOVE_SLAM; move3 = MOVE_TACKLE; move4 = MOVE_GUST; hp = 5; expectedMove = MOVE_GUST; expectedMove2 = MOVE_TACKLE; turns = 1; }
    // All moves hit with No guard ability
    PARAMETRIZE { move1 = MOVE_MEGA_KICK; move2 = MOVE_GUST; hp = 5; expectedMove = MOVE_MEGA_KICK; expectedMove2 = MOVE_GUST; turns = 1; }
    // Tests to compare move that always hits and a beneficial effect. A move with higher acc should be chosen in this case.
    PARAMETRIZE { move1 = MOVE_SHOCK_WAVE; move2 = MOVE_ICY_WIND; hp = 5; expectedMove = MOVE_SHOCK_WAVE; turns = 1; }
    PARAMETRIZE { move1 = MOVE_SHOCK_WAVE; move2 = MOVE_ICY_WIND; move3 = MOVE_THUNDERBOLT; hp = 5; expectedMove = MOVE_SHOCK_WAVE; expectedMove2 = MOVE_THUNDERBOLT; turns = 1; }

    GIVEN {
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT);
        PLAYER(SPECIES_WOBBUFFET) { HP(hp); }
        PLAYER(SPECIES_WOBBUFFET);
        ASSUME(GetMoveAccuracy(MOVE_SWIFT) == 0);
        ASSUME(GetMovePower(MOVE_SLAM) == GetMovePower(MOVE_STRENGTH));
        ASSUME(GetMovePower(MOVE_MEGA_KICK) > GetMovePower(MOVE_STRENGTH));
        ASSUME(GetMoveAccuracy(MOVE_SLAM) < GetMoveAccuracy(MOVE_STRENGTH));
        ASSUME(GetMoveAccuracy(MOVE_MEGA_KICK) < GetMoveAccuracy(MOVE_STRENGTH));
        ASSUME(GetMoveAccuracy(MOVE_TACKLE) == 100);
        ASSUME(GetMoveAccuracy(MOVE_GUST) == 100);
        ASSUME(GetMoveAccuracy(MOVE_SHOCK_WAVE) == 0);
        ASSUME(GetMoveAccuracy(MOVE_THUNDERBOLT) == 100);
        ASSUME(GetMoveAccuracy(MOVE_ICY_WIND) != 100);
        ASSUME(GetMoveCategory(MOVE_SLAM) == DAMAGE_CATEGORY_PHYSICAL);
        ASSUME(GetMoveCategory(MOVE_STRENGTH) == DAMAGE_CATEGORY_PHYSICAL);
        ASSUME(GetMoveCategory(MOVE_TACKLE) == DAMAGE_CATEGORY_PHYSICAL);
        ASSUME(GetMoveCategory(MOVE_MEGA_KICK) == DAMAGE_CATEGORY_PHYSICAL);
        ASSUME(GetMoveCategory(MOVE_SWIFT) == DAMAGE_CATEGORY_SPECIAL);
        ASSUME(GetMoveCategory(MOVE_SHOCK_WAVE) == DAMAGE_CATEGORY_SPECIAL);
        ASSUME(GetMoveCategory(MOVE_ICY_WIND) == DAMAGE_CATEGORY_SPECIAL);
        ASSUME(GetMoveCategory(MOVE_THUNDERBOLT) == DAMAGE_CATEGORY_SPECIAL);
        ASSUME(GetMoveCategory(MOVE_GUST) == DAMAGE_CATEGORY_SPECIAL);
        OPPONENT(SPECIES_EXPLOUD) { Moves(move1, move2, move3, move4); Ability(abilityAtk); SpAttack(50); } // Low Sp.Atk, so Swift deals less damage than Strength.
    } WHEN {
            switch (turns)
            {
            case 1:
                if (expectedMove2 != MOVE_NONE) {
                    TURN { EXPECT_MOVES(opponent, expectedMove, expectedMove2); SEND_OUT(player, 1); }
                }
                else {
                    TURN { EXPECT_MOVE(opponent, expectedMove); SEND_OUT(player, 1); }
                }
                break;
            case 2:
                TURN { EXPECT_MOVE(opponent, expectedMove); }
                TURN { EXPECT_MOVE(opponent, expectedMove); SEND_OUT(player, 1); }
                break;
            case 3:
                TURN { EXPECT_MOVE(opponent, expectedMove); }
                TURN { EXPECT_MOVE(opponent, expectedMove); }
                TURN { EXPECT_MOVE(opponent, expectedMove); SEND_OUT(player, 1); }
                break;
            case 4:
                TURN { EXPECT_MOVE(opponent, expectedMove); }
                TURN { EXPECT_MOVE(opponent, expectedMove); }
                TURN { EXPECT_MOVE(opponent, expectedMove); }
                TURN { EXPECT_MOVE(opponent, expectedMove); SEND_OUT(player, 1); }
                break;
            }
    } SCENE {
        MESSAGE("Wobbuffet fainted!");
    }
}

AI_SINGLE_BATTLE_TEST("AI prefers moves which deal more damage instead of moves which are super-effective but deal less damage")
{
    u8 turns = 0;
    u16 move1 = MOVE_NONE, move2 = MOVE_NONE, move3 = MOVE_NONE, move4 = MOVE_NONE;
    u16 expectedMove, abilityAtk, abilityDef;

    abilityAtk = ABILITY_NONE;

    // Scald and Poison Jab take 3 hits, Waterfall takes 2.
    PARAMETRIZE { move1 = MOVE_WATERFALL; move2 = MOVE_SCALD; move3 = MOVE_POISON_JAB; move4 = MOVE_WATER_GUN; expectedMove = MOVE_WATERFALL; turns = 2; }
    // Poison Jab takes 3 hits, Water gun 5. Immunity so there's no poison chip damage.
    PARAMETRIZE { move1 = MOVE_POISON_JAB; move2 = MOVE_WATER_GUN; expectedMove = MOVE_POISON_JAB; abilityDef = ABILITY_IMMUNITY; turns = 3; }

    GIVEN {
        ASSUME(GetMoveCategory(MOVE_WATERFALL) == DAMAGE_CATEGORY_PHYSICAL);
        ASSUME(GetMoveCategory(MOVE_SCALD) == DAMAGE_CATEGORY_SPECIAL);
        ASSUME(GetMoveCategory(MOVE_POISON_JAB) == DAMAGE_CATEGORY_PHYSICAL);
        ASSUME(GetMoveCategory(MOVE_WATER_GUN) == DAMAGE_CATEGORY_SPECIAL);
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT);
        PLAYER(SPECIES_TYPHLOSION) { Ability(abilityDef); }
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_NIDOQUEEN) { Moves(move1, move2, move3, move4); Ability(abilityAtk); }
    } WHEN {
            switch (turns)
            {
            case 2:
                TURN { EXPECT_MOVE(opponent, expectedMove); }
                TURN { EXPECT_MOVE(opponent, expectedMove); SEND_OUT(player, 1); }
                break;
            case 3:
                TURN { EXPECT_MOVE(opponent, expectedMove); }
                TURN { EXPECT_MOVE(opponent, expectedMove); }
                TURN { EXPECT_MOVE(opponent, expectedMove); SEND_OUT(player, 1); }
                break;
            }
    } SCENE {
        MESSAGE("Typhlosion fainted!");
    }
}

AI_SINGLE_BATTLE_TEST("AI prefers Earthquake over Drill Run if both require the same number of hits to ko")
{
    // Drill Run has less accuracy than E-quake, but can score a higher crit. However the chance is too small, so AI should ignore it.
    GIVEN {
        ASSUME(GetMoveCategory(MOVE_EARTHQUAKE) == DAMAGE_CATEGORY_PHYSICAL); // Added because Geodude has to KO Typhlosion
        ASSUME(GetMoveCategory(MOVE_DRILL_RUN) == DAMAGE_CATEGORY_PHYSICAL);  // Added because Geodude has to KO Typhlosion
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT);
        PLAYER(SPECIES_TYPHLOSION);
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_GEODUDE) { Moves(MOVE_EARTHQUAKE, MOVE_DRILL_RUN); }
    } WHEN {
        TURN { EXPECT_MOVE(opponent, MOVE_EARTHQUAKE); }
        TURN { EXPECT_MOVE(opponent, MOVE_EARTHQUAKE); SEND_OUT(player, 1); }
    }
    SCENE {
        MESSAGE("Typhlosion fainted!");
    }
}

AI_SINGLE_BATTLE_TEST("AI prefers a weaker move over a one with a downside effect if both require the same number of hits to ko")
{
    u16 move1 = MOVE_NONE, move2 = MOVE_NONE, move3 = MOVE_NONE, move4 = MOVE_NONE;
    u16 hp, expectedMove, turns;

    // Both moves require the same number of turns but Flamethrower will be chosen over Overheat (powerful effect)
    PARAMETRIZE { move1 = MOVE_OVERHEAT; move2 = MOVE_FLAMETHROWER; hp = 300; expectedMove = MOVE_FLAMETHROWER; turns = 2; }
    // Overheat kill in least amount of turns
    PARAMETRIZE { move1 = MOVE_OVERHEAT; move2 = MOVE_FLAMETHROWER; hp = 250; expectedMove = MOVE_OVERHEAT; turns = 1; }

    GIVEN {
        ASSUME(GetMoveCategory(MOVE_FLAMETHROWER) == DAMAGE_CATEGORY_SPECIAL); // Added because Typhlosion has to KO Wobbuffet
        ASSUME(GetMoveCategory(MOVE_OVERHEAT) == DAMAGE_CATEGORY_SPECIAL);     // Added because Typhlosion has to KO Wobbuffet
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT);
        PLAYER(SPECIES_WOBBUFFET) { HP(hp); }
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_TYPHLOSION) { Moves(move1, move2, move3, move4); }
    } WHEN {
        switch (turns)
        {
        case 1:
            TURN { EXPECT_MOVE(opponent, expectedMove); SEND_OUT(player, 1); }
            break;
        case 2:
            TURN { EXPECT_MOVE(opponent, expectedMove); }
            TURN { EXPECT_MOVE(opponent, expectedMove); SEND_OUT(player, 1); }
            break;
        }
    } SCENE {
        MESSAGE("Wobbuffet fainted!");
    }
}

AI_SINGLE_BATTLE_TEST("AI prefers moves with the best possible score, chosen randomly if tied")
{
    GIVEN {
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT);
        PLAYER(SPECIES_WOBBUFFET) { HP(5); };
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET) { Moves(MOVE_THUNDERBOLT, MOVE_SLUDGE_BOMB, MOVE_TAKE_DOWN); }
    } WHEN {
        TURN { EXPECT_MOVES(opponent, MOVE_THUNDERBOLT, MOVE_SLUDGE_BOMB); SEND_OUT(player, 1); }
    }
    SCENE {
        MESSAGE("Wobbuffet fainted!");
    }
}

AI_SINGLE_BATTLE_TEST("AI can choose a status move that boosts the attack by two")
{
    GIVEN {
        ASSUME(GetMoveCategory(MOVE_STRENGTH) == DAMAGE_CATEGORY_PHYSICAL);
        ASSUME(GetMoveCategory(MOVE_HORN_ATTACK) == DAMAGE_CATEGORY_PHYSICAL);
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT);
        PLAYER(SPECIES_WOBBUFFET) { HP(277); };
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_KANGASKHAN) { Moves(MOVE_STRENGTH, MOVE_HORN_ATTACK, MOVE_SWORDS_DANCE); }
    } WHEN {
        TURN { EXPECT_MOVES(opponent, MOVE_STRENGTH, MOVE_SWORDS_DANCE); }
        TURN { EXPECT_MOVE(opponent, MOVE_STRENGTH); SEND_OUT(player, 1); }
    }
}

AI_SINGLE_BATTLE_TEST("AI chooses the safest option to faint the target, taking into account accuracy and move effect")
{
    u16 move1 = MOVE_NONE, move2 = MOVE_NONE, move3 = MOVE_NONE, move4 = MOVE_NONE;
    u16 expectedMove, expectedMove2 = MOVE_NONE;
    u16 abilityAtk = ABILITY_NONE, holdItemAtk = ITEM_NONE;

    // Psychic is not very effective, but always hits. Solarbeam requires a charging turn, Double Edge has recoil and Focus Blast can miss;
    PARAMETRIZE { abilityAtk = ABILITY_STURDY; move1 = MOVE_FOCUS_BLAST; move2 = MOVE_SOLAR_BEAM; move3 = MOVE_PSYCHIC; move4 = MOVE_DOUBLE_EDGE; expectedMove = MOVE_PSYCHIC; }
    // Same as above, but ai mon has rock head ability, so it can use Double Edge without taking recoil damage. Psychic can also lower Special Defense,
    // but because it faints the target it doesn't matter.
    PARAMETRIZE { abilityAtk = ABILITY_ROCK_HEAD; move1 = MOVE_FOCUS_BLAST; move2 = MOVE_SOLAR_BEAM; move3 = MOVE_PSYCHIC; move4 = MOVE_DOUBLE_EDGE;
                  expectedMove = MOVE_PSYCHIC; expectedMove2 = MOVE_DOUBLE_EDGE; }
    // This time it's Solarbeam + Psychic, because the weather is sunny.
    PARAMETRIZE { abilityAtk = ABILITY_DROUGHT; move1 = MOVE_FOCUS_BLAST; move2 = MOVE_SOLAR_BEAM; move3 = MOVE_PSYCHIC; move4 = MOVE_DOUBLE_EDGE;
                  expectedMove = MOVE_PSYCHIC; expectedMove2 = MOVE_SOLAR_BEAM; }
    // Psychic and Solar Beam are chosen because user is holding Power Herb
    PARAMETRIZE { abilityAtk = ABILITY_STURDY; holdItemAtk = ITEM_POWER_HERB; move1 = MOVE_FOCUS_BLAST; move2 = MOVE_SOLAR_BEAM; move3 = MOVE_PSYCHIC; move4 = MOVE_DOUBLE_EDGE;
                  expectedMove = MOVE_PSYCHIC; expectedMove2 = MOVE_SOLAR_BEAM; }
    // Skull Bash is chosen because it's the most accurate and is holding Power Herb
    PARAMETRIZE { abilityAtk = ABILITY_STURDY; holdItemAtk = ITEM_POWER_HERB; move1 = MOVE_FOCUS_BLAST; move2 = MOVE_SKULL_BASH; move3 = MOVE_SLAM; move4 = MOVE_DOUBLE_EDGE;
                  expectedMove = MOVE_SKULL_BASH; }

    GIVEN {
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT);
        PLAYER(SPECIES_WOBBUFFET) { HP(5); }
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_GEODUDE) { Moves(move1, move2, move3, move4); Ability(abilityAtk); Item(holdItemAtk); }
    } WHEN {
        TURN {  if (expectedMove2 == MOVE_NONE) { EXPECT_MOVE(opponent, expectedMove); SEND_OUT(player, 1); }
                else {EXPECT_MOVES(opponent, expectedMove, expectedMove2); SCORE_EQ(opponent, expectedMove, expectedMove2); SEND_OUT(player, 1);}
             }
    }
    SCENE {
        MESSAGE("Wobbuffet fainted!");
    }
}

AI_SINGLE_BATTLE_TEST("AI chooses the safest option to faint the target, taking into account accuracy and move effect failing")
{
    u16 move1 = MOVE_NONE, move2 = MOVE_NONE, move3 = MOVE_NONE, move4 = MOVE_NONE;
    u16 expectedMove, expectedMove2 = MOVE_NONE;
    u16 abilityAtk = ABILITY_NONE, holdItemAtk = ITEM_NONE;

    // Fiery Dance and Skull Bash are chosen because user is holding Power Herb
    PARAMETRIZE { abilityAtk = ABILITY_STURDY; holdItemAtk = ITEM_POWER_HERB; move1 = MOVE_FOCUS_BLAST; move2 = MOVE_SKULL_BASH; move3 = MOVE_FIERY_DANCE; move4 = MOVE_DOUBLE_EDGE;
                  expectedMove = MOVE_FIERY_DANCE; expectedMove2 = MOVE_SKULL_BASH; }
    // Crabhammer is chosen even if Skull Bash is more accurate, the user has no Power Herb
    PARAMETRIZE { abilityAtk = ABILITY_STURDY; move1 = MOVE_FOCUS_BLAST; move2 = MOVE_SKULL_BASH; move3 = MOVE_SLAM; move4 = MOVE_CRABHAMMER;
                  expectedMove = MOVE_CRABHAMMER; }

    KNOWN_FAILING;
    GIVEN {
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT);
        PLAYER(SPECIES_WOBBUFFET) { HP(5); }
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_GEODUDE) { Moves(move1, move2, move3, move4); Ability(abilityAtk); Item(holdItemAtk); }
    } WHEN {
        TURN {  if (expectedMove2 == MOVE_NONE) { EXPECT_MOVE(opponent, expectedMove); SEND_OUT(player, 1); }
                else {EXPECT_MOVES(opponent, expectedMove, expectedMove2); SCORE_EQ(opponent, expectedMove, expectedMove2); SEND_OUT(player, 1);}
             }
    }
    SCENE {
        MESSAGE("Wobbuffet fainted!");
    }
}

AI_SINGLE_BATTLE_TEST("AI won't use Solar Beam if there is no Sun up or the user is not holding Power Herb")
{
    u16 abilityAtk = ABILITY_NONE;
    u16 holdItemAtk = ITEM_NONE;

    PARAMETRIZE { abilityAtk = ABILITY_DROUGHT; }
    PARAMETRIZE { holdItemAtk = ITEM_POWER_HERB; }
    PARAMETRIZE { }

    GIVEN {
        ASSUME(GetMoveCategory(MOVE_SOLAR_BEAM) == DAMAGE_CATEGORY_SPECIAL);
        ASSUME(GetMoveCategory(MOVE_GRASS_PLEDGE) == DAMAGE_CATEGORY_SPECIAL);
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT);
        PLAYER(SPECIES_WOBBUFFET) { HP(211); }
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_TYPHLOSION) { Moves(MOVE_SOLAR_BEAM, MOVE_GRASS_PLEDGE); Ability(abilityAtk); Item(holdItemAtk); }
    } WHEN {
        if (abilityAtk == ABILITY_DROUGHT) {
            TURN { EXPECT_MOVES(opponent, MOVE_SOLAR_BEAM, MOVE_GRASS_PLEDGE); }
            TURN { EXPECT_MOVES(opponent, MOVE_SOLAR_BEAM, MOVE_GRASS_PLEDGE); SEND_OUT(player, 1); }
        } else if (holdItemAtk == ITEM_POWER_HERB) {
            TURN { EXPECT_MOVES(opponent, MOVE_SOLAR_BEAM, MOVE_GRASS_PLEDGE); MOVE(player, MOVE_KNOCK_OFF); }
            TURN { EXPECT_MOVE(opponent, MOVE_GRASS_PLEDGE); SEND_OUT(player, 1); }
        } else {
            TURN { EXPECT_MOVE(opponent, MOVE_GRASS_PLEDGE); }
            TURN { EXPECT_MOVE(opponent, MOVE_GRASS_PLEDGE); SEND_OUT(player, 1); }
        }
    } SCENE {
        MESSAGE("Wobbuffet fainted!");
    }
}

AI_SINGLE_BATTLE_TEST("AI won't use ground type attacks against flying type Pokemon unless Gravity is in effect")
{
    GIVEN {
        ASSUME(GetMoveCategory(MOVE_EARTHQUAKE) == DAMAGE_CATEGORY_PHYSICAL); // Otherwise, it doesn't KO Crobat
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT);
        PLAYER(SPECIES_CROBAT);
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_NIDOQUEEN) { Moves(MOVE_EARTHQUAKE, MOVE_TACKLE, MOVE_POISON_STING, MOVE_GUST); }
    } WHEN {
        TURN { NOT_EXPECT_MOVE(opponent, MOVE_EARTHQUAKE); }
        TURN { MOVE(player, MOVE_GRAVITY); NOT_EXPECT_MOVE(opponent, MOVE_EARTHQUAKE); }
        TURN { EXPECT_MOVE(opponent, MOVE_EARTHQUAKE); SEND_OUT(player, 1); }
    } SCENE {
        MESSAGE("Gravity intensified!");
    }
}

AI_DOUBLE_BATTLE_TEST("AI won't use a Weather changing move if partner already chose such move")
{
    u32 j, k;
    static const u16 weatherMoves[] = {MOVE_SUNNY_DAY, MOVE_HAIL, MOVE_RAIN_DANCE, MOVE_SANDSTORM, MOVE_SNOWSCAPE};
    u16 weatherMoveLeft = MOVE_NONE, weatherMoveRight = MOVE_NONE;

    for (j = 0; j < ARRAY_COUNT(weatherMoves); j++)
    {
        for (k = 0; k < ARRAY_COUNT(weatherMoves); k++)
        {
            PARAMETRIZE { weatherMoveLeft = weatherMoves[j]; weatherMoveRight = weatherMoves[k]; }
        }
    }

    GIVEN {
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT);
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET) { Moves(weatherMoveLeft); }
        OPPONENT(SPECIES_WOBBUFFET) { Moves(MOVE_TACKLE, weatherMoveRight); }
    } WHEN {
            TURN {  NOT_EXPECT_MOVE(opponentRight, weatherMoveRight);
                    SCORE_LT_VAL(opponentRight, weatherMoveRight, AI_SCORE_DEFAULT, target:playerLeft);
                    SCORE_LT_VAL(opponentRight, weatherMoveRight, AI_SCORE_DEFAULT, target:playerRight);
                    SCORE_LT_VAL(opponentRight, weatherMoveRight, AI_SCORE_DEFAULT, target:opponentLeft);
                 }
    }
}

AI_DOUBLE_BATTLE_TEST("AI will not use Helping Hand if partner does not have any damage moves")
{
    u16 move1 = MOVE_NONE, move2 = MOVE_NONE, move3 = MOVE_NONE, move4 = MOVE_NONE;

    PARAMETRIZE { move1 = MOVE_LEER; move2 = MOVE_TOXIC; }
    PARAMETRIZE { move1 = MOVE_HELPING_HAND; move2 = MOVE_PROTECT; }
    PARAMETRIZE { move1 = MOVE_ACUPRESSURE; move2 = MOVE_DOUBLE_TEAM; move3 = MOVE_TOXIC; move4 = MOVE_PROTECT; }

    GIVEN {
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT);
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET) { Moves(MOVE_HELPING_HAND, MOVE_TACKLE); }
        OPPONENT(SPECIES_WOBBUFFET) { Moves(move1, move2, move3, move4); }
    } WHEN {
            TURN {  NOT_EXPECT_MOVE(opponentLeft, MOVE_HELPING_HAND);
                    SCORE_LT_VAL(opponentLeft, MOVE_HELPING_HAND, AI_SCORE_DEFAULT, target:playerLeft);
                    SCORE_LT_VAL(opponentLeft, MOVE_HELPING_HAND, AI_SCORE_DEFAULT, target:playerRight);
                    SCORE_LT_VAL(opponentLeft, MOVE_HELPING_HAND, AI_SCORE_DEFAULT, target:opponentLeft);
                 }
    } SCENE {
        NOT MESSAGE("The opposing Wobbuffet used Helping Hand!");
    }
}

AI_DOUBLE_BATTLE_TEST("AI will not use a status move if partner already chose Helping Hand")
{
    s32 j;
    u32 statusMove = MOVE_NONE;

    for (j = MOVE_NONE + 1; j < MOVES_COUNT; j++)
    {
        if (GetMoveCategory(j) == DAMAGE_CATEGORY_STATUS) {
            PARAMETRIZE { statusMove = j; }
        }
    }

    GIVEN {
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT);
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET) { Moves(MOVE_HELPING_HAND); }
        OPPONENT(SPECIES_WOBBUFFET) { Moves(MOVE_TACKLE, statusMove); }
    } WHEN {
            TURN {  NOT_EXPECT_MOVE(opponentRight, statusMove);
                    SCORE_LT_VAL(opponentRight, statusMove, AI_SCORE_DEFAULT, target:playerLeft);
                    SCORE_LT_VAL(opponentRight, statusMove, AI_SCORE_DEFAULT, target:playerRight);
                    SCORE_LT_VAL(opponentRight, statusMove, AI_SCORE_DEFAULT, target:opponentLeft);
                 }
    } SCENE {
        MESSAGE("The opposing Wobbuffet used Helping Hand!");
    }
}

AI_SINGLE_BATTLE_TEST("AI without any flags chooses moves at random - singles")
{
    GIVEN {
        AI_FLAGS(0);
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_NIDOQUEEN) { Moves(MOVE_SPLASH, MOVE_EXPLOSION, MOVE_RAGE, MOVE_HELPING_HAND); }
    } WHEN {
            TURN { EXPECT_MOVES(opponent, MOVE_SPLASH, MOVE_EXPLOSION, MOVE_RAGE, MOVE_HELPING_HAND);
                   SCORE_EQ_VAL(opponent, MOVE_SPLASH, AI_SCORE_DEFAULT);
                   SCORE_EQ_VAL(opponent, MOVE_EXPLOSION, AI_SCORE_DEFAULT);
                   SCORE_EQ_VAL(opponent, MOVE_RAGE, AI_SCORE_DEFAULT);
                   SCORE_EQ_VAL(opponent, MOVE_HELPING_HAND, AI_SCORE_DEFAULT);
                }
    }
}

AI_DOUBLE_BATTLE_TEST("AI without any flags chooses moves at random - doubles")
{
    GIVEN {
        AI_FLAGS(0);
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_NIDOQUEEN) { Moves(MOVE_SPLASH, MOVE_EXPLOSION, MOVE_RAGE, MOVE_HELPING_HAND); }
        OPPONENT(SPECIES_NIDOQUEEN) { Moves(MOVE_SPLASH, MOVE_EXPLOSION, MOVE_RAGE, MOVE_HELPING_HAND); }
    } WHEN {
            TURN { EXPECT_MOVES(opponentLeft, MOVE_SPLASH, MOVE_EXPLOSION, MOVE_RAGE, MOVE_HELPING_HAND);
                   EXPECT_MOVES(opponentRight, MOVE_SPLASH, MOVE_EXPLOSION, MOVE_RAGE, MOVE_HELPING_HAND);
                   SCORE_EQ_VAL(opponentLeft, MOVE_SPLASH, AI_SCORE_DEFAULT, target:playerLeft);
                   SCORE_EQ_VAL(opponentLeft, MOVE_EXPLOSION, AI_SCORE_DEFAULT, target:playerLeft);
                   SCORE_EQ_VAL(opponentLeft, MOVE_RAGE, AI_SCORE_DEFAULT, target:playerLeft);
                   SCORE_EQ_VAL(opponentLeft, MOVE_HELPING_HAND, AI_SCORE_DEFAULT, target:playerLeft);
                   SCORE_EQ_VAL(opponentRight, MOVE_SPLASH, AI_SCORE_DEFAULT, target:playerLeft);
                   SCORE_EQ_VAL(opponentRight, MOVE_EXPLOSION, AI_SCORE_DEFAULT, target:playerLeft);
                   SCORE_EQ_VAL(opponentRight, MOVE_RAGE, AI_SCORE_DEFAULT, target:playerLeft);
                   SCORE_EQ_VAL(opponentRight, MOVE_HELPING_HAND, AI_SCORE_DEFAULT, target:playerLeft);
                }
    }
}

AI_SINGLE_BATTLE_TEST("AI will choose either Rock Tomb or Bulldoze if Stat drop effect will activate and they kill with the same number of hits")
{
    GIVEN {
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT);
        PLAYER(SPECIES_WOBBUFFET) { HP(46); Speed(20); }
        PLAYER(SPECIES_WYNAUT) { Speed(20); }
        OPPONENT(SPECIES_WOBBUFFET) { Speed(10); Moves(MOVE_BULLDOZE, MOVE_ROCK_TOMB); }
    } WHEN {
            TURN { EXPECT_MOVES(opponent, MOVE_BULLDOZE, MOVE_ROCK_TOMB); }
            TURN { EXPECT_MOVES(opponent, MOVE_BULLDOZE, MOVE_ROCK_TOMB); SEND_OUT(player, 1); }
    } SCENE {
        MESSAGE("Wobbuffet fainted!");
    }
}

AI_SINGLE_BATTLE_TEST("First Impression is preferred on the first turn of the species if it's the best dmg move")
{
    GIVEN {
        ASSUME(GetMoveEffect(MOVE_FIRST_IMPRESSION) == EFFECT_FIRST_TURN_ONLY);
        ASSUME(GetMovePower(MOVE_FIRST_IMPRESSION) == 90);
        ASSUME(GetMovePower(MOVE_LUNGE) == 80);
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT);
        PLAYER(SPECIES_KANGASKHAN);
        OPPONENT(SPECIES_WOBBUFFET) { Moves(MOVE_FIRST_IMPRESSION, MOVE_LUNGE); }
    } WHEN {
        TURN { EXPECT_MOVE(opponent, MOVE_FIRST_IMPRESSION); }
        TURN { EXPECT_MOVE(opponent, MOVE_LUNGE); }
    }
}

AI_SINGLE_BATTLE_TEST("First Impression is not chosen if it's blocked by certain abilities")
{
    u16 species;
    u16 ability;

    PARAMETRIZE { species = SPECIES_BRUXISH; ability = ABILITY_DAZZLING; }
    PARAMETRIZE { species = SPECIES_FARIGIRAF; ability = ABILITY_ARMOR_TAIL; }
    PARAMETRIZE { species = SPECIES_TSAREENA; ability = ABILITY_QUEENLY_MAJESTY; }

    GIVEN {
        ASSUME(GetMoveEffect(MOVE_FIRST_IMPRESSION) == EFFECT_FIRST_TURN_ONLY);
        ASSUME(GetMovePower(MOVE_FIRST_IMPRESSION) == 90);
        ASSUME(GetMovePower(MOVE_LUNGE) == 80);
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT | AI_FLAG_OMNISCIENT);
        PLAYER(species) { Ability(ability); }
        OPPONENT(SPECIES_WOBBUFFET) { Moves(MOVE_FIRST_IMPRESSION, MOVE_LUNGE); }
    } WHEN {
        TURN { EXPECT_MOVE(opponent, MOVE_LUNGE); }
    }
}

AI_SINGLE_BATTLE_TEST("AI will not choose Burn Up if the user lost the Fire typing")
{
    GIVEN {
        ASSUME(GetMoveEffect(MOVE_BURN_UP) == EFFECT_FAIL_IF_NOT_ARG_TYPE);
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT);
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_CYNDAQUIL) { Moves(MOVE_BURN_UP, MOVE_EXTRASENSORY, MOVE_FLAMETHROWER); }
    } WHEN {
        TURN { EXPECT_MOVE(opponent, MOVE_BURN_UP); }
        TURN { EXPECT_MOVE(opponent, MOVE_FLAMETHROWER); }
    }
}

AI_SINGLE_BATTLE_TEST("AI will only choose Surf 1/3 times if the opposing mon has Volt Absorb")
{
    PASSES_RANDOMLY(1, 3, RNG_AI_ABILITY);
    GIVEN {
        ASSUME(GetMoveType(MOVE_THUNDERBOLT) == TYPE_ELECTRIC);
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT);
        PLAYER(SPECIES_LANTURN) { Ability(ABILITY_VOLT_ABSORB); };
        OPPONENT(SPECIES_LANTURN) { Moves(MOVE_THUNDERBOLT, MOVE_ICE_BEAM, MOVE_SURF); }
    } WHEN {
        TURN { EXPECT_MOVE(opponent, MOVE_SURF); }
        TURN { EXPECT_MOVE(opponent, MOVE_SURF); }
    } SCENE {
        MESSAGE("The opposing Lanturn used Surf!");
        MESSAGE("The opposing Lanturn used Surf!");
    }
}

AI_SINGLE_BATTLE_TEST("AI will choose Thunderbolt then Surf 2/3 times if the opposing mon has Volt Absorb")
{
    PASSES_RANDOMLY(2, 3, RNG_AI_ABILITY);
    GIVEN {
        ASSUME(GetMoveType(MOVE_THUNDERBOLT) == TYPE_ELECTRIC);
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT);
        PLAYER(SPECIES_LANTURN) { Ability(ABILITY_VOLT_ABSORB); };
        OPPONENT(SPECIES_LANTURN) { Moves(MOVE_THUNDERBOLT, MOVE_ICE_BEAM, MOVE_SURF); }
    } WHEN {
        TURN { EXPECT_MOVE(opponent, MOVE_THUNDERBOLT); }
        TURN { EXPECT_MOVE(opponent, MOVE_SURF); }
    } SCENE {
        MESSAGE("The opposing Lanturn used Thunderbolt!");
        MESSAGE("The opposing Lanturn used Surf!");
    }
}

AI_SINGLE_BATTLE_TEST("AI will choose Scratch over Power-up Punch with Contrary")
{
    u32 ability;

    PARAMETRIZE {ability = ABILITY_SUCTION_CUPS; }
    PARAMETRIZE {ability = ABILITY_CONTRARY; }
    GIVEN {
        ASSUME(GetMovePower(MOVE_SCRATCH) == 40);
        ASSUME(GetMoveType(MOVE_SCRATCH) == TYPE_NORMAL);
        ASSUME(GetMovePower(MOVE_POWER_UP_PUNCH) == 40);
        ASSUME(GetMoveType(MOVE_POWER_UP_PUNCH) == TYPE_FIGHTING);
        ASSUME(gSpeciesInfo[SPECIES_SQUIRTLE].types[0] == TYPE_WATER);
        ASSUME(gSpeciesInfo[SPECIES_SQUIRTLE].types[1] == TYPE_WATER);
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT);
        PLAYER(SPECIES_SQUIRTLE) { };
        OPPONENT(SPECIES_MALAMAR) { Ability(ability); Moves(MOVE_SCRATCH, MOVE_POWER_UP_PUNCH); }
    } WHEN {
        TURN {
            if (ability != ABILITY_CONTRARY)
                EXPECT_MOVE(opponent, MOVE_POWER_UP_PUNCH);
            else
                EXPECT_MOVE(opponent, MOVE_SCRATCH);
        }
    }
}

AI_SINGLE_BATTLE_TEST("AI will choose Superpower over Outrage with Contrary")
{
    u32 ability;

    PARAMETRIZE {ability = ABILITY_SUCTION_CUPS; }
    PARAMETRIZE {ability = ABILITY_CONTRARY; }
    GIVEN {
        ASSUME(GetMovePower(MOVE_SUPERPOWER) == 120);
        ASSUME(GetMoveType(MOVE_SUPERPOWER) == TYPE_FIGHTING);
        ASSUME(GetMovePower(MOVE_OUTRAGE) == 120);
        ASSUME(GetMoveType(MOVE_OUTRAGE) == TYPE_DRAGON);
        ASSUME(gSpeciesInfo[SPECIES_SQUIRTLE].types[0] == TYPE_WATER);
        ASSUME(gSpeciesInfo[SPECIES_SQUIRTLE].types[1] == TYPE_WATER);
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT);
        PLAYER(SPECIES_SQUIRTLE) { };
        OPPONENT(SPECIES_MALAMAR) { Ability(ability); Moves(MOVE_OUTRAGE, MOVE_SUPERPOWER); }
    } WHEN {
        TURN {
            if (ability != ABILITY_CONTRARY)
                EXPECT_MOVE(opponent, MOVE_OUTRAGE);
            else
                EXPECT_MOVE(opponent, MOVE_SUPERPOWER);
        }
    }
}

AI_DOUBLE_BATTLE_TEST("AI will not choose Earthquake if it damages the partner")
{
    u32 species;

    PARAMETRIZE { species = SPECIES_CHARIZARD; }
    PARAMETRIZE { species = SPECIES_CHARMANDER; }
    PARAMETRIZE { species = SPECIES_CHIKORITA; }

    GIVEN {
        ASSUME(GetMoveTarget(MOVE_EARTHQUAKE) == MOVE_TARGET_FOES_AND_ALLY);
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT);
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_PHANPY) { Moves(MOVE_EARTHQUAKE, MOVE_TACKLE); }
        OPPONENT(species) { Moves(MOVE_CELEBRATE); }
    } WHEN {
        if (species == SPECIES_CHARIZARD)
            TURN { EXPECT_MOVE(opponentLeft, MOVE_EARTHQUAKE); }
        else
            TURN { EXPECT_MOVE(opponentLeft, MOVE_TACKLE, target: playerLeft); }
    }
}

AI_DOUBLE_BATTLE_TEST("AI will choose Earthquake if partner is not alive")
{
    GIVEN {
        ASSUME(GetMoveTarget(MOVE_EARTHQUAKE) == MOVE_TARGET_FOES_AND_ALLY);
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT);
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET) { Moves(MOVE_EARTHQUAKE, MOVE_TACKLE); }
        OPPONENT(SPECIES_PIKACHU) { HP(1); Moves(MOVE_CELEBRATE); }
    } WHEN {
        TURN { MOVE(playerLeft, MOVE_TACKLE, target: opponentRight); }
        TURN { EXPECT_MOVE(opponentLeft, MOVE_EARTHQUAKE); }
    }
}

AI_DOUBLE_BATTLE_TEST("AI will choose Earthquake if it kill an opposing mon and does 1/3 of damage to AI")
{
    GIVEN {
        ASSUME(GetMoveTarget(MOVE_EARTHQUAKE) == MOVE_TARGET_FOES_AND_ALLY);
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT);
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_WOBBUFFET) { HP(1); }
        OPPONENT(SPECIES_WOBBUFFET) { Moves(MOVE_EARTHQUAKE, MOVE_TACKLE); }
        OPPONENT(SPECIES_PARAS) { Moves(MOVE_CELEBRATE); }
    } WHEN {
        TURN { EXPECT_MOVE(opponentLeft, MOVE_EARTHQUAKE); }
    }
}

AI_DOUBLE_BATTLE_TEST("AI will the see a corresponding absorbing ability on partner to one of its moves")
{
    u32 ability;
    PARAMETRIZE { ability = ABILITY_LIGHTNING_ROD; }
    PARAMETRIZE { ability = ABILITY_STATIC; }

    GIVEN {
        ASSUME(GetMoveTarget(MOVE_DISCHARGE) == MOVE_TARGET_FOES_AND_ALLY);
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT);
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET) { Moves(MOVE_DISCHARGE, MOVE_TACKLE); }
        OPPONENT(SPECIES_PIKACHU) { HP(1); Ability(ability); Moves(MOVE_CELEBRATE); }
    } WHEN {
        if (ability == ABILITY_LIGHTNING_ROD)
            TURN { EXPECT_MOVE(opponentLeft, MOVE_DISCHARGE); }
        else
            TURN { EXPECT_MOVE(opponentLeft, MOVE_TACKLE); }
    }
}

AI_SINGLE_BATTLE_TEST("AI calculates guaranteed criticals and detects critical immunity")
{
    u32 ability;
    PARAMETRIZE { ability = ABILITY_SWIFT_SWIM; }
    PARAMETRIZE { ability = ABILITY_SHELL_ARMOR; }

    GIVEN {
        ASSUME(MoveAlwaysCrits(MOVE_STORM_THROW));
        ASSUME(GetMovePower(MOVE_STORM_THROW) == 60);
        ASSUME(GetMovePower(MOVE_BRICK_BREAK) == 75);
        ASSUME(GetMoveType(MOVE_STORM_THROW) == GetMoveType(MOVE_BRICK_BREAK));
        ASSUME(GetMoveCategory(MOVE_STORM_THROW) == GetMoveCategory(MOVE_BRICK_BREAK));
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT | AI_FLAG_OMNISCIENT);
        PLAYER(SPECIES_OMASTAR) { Ability(ability); }
        OPPONENT(SPECIES_WOBBUFFET) { Moves(MOVE_STORM_THROW, MOVE_BRICK_BREAK); }
    } WHEN {
        if (ability == ABILITY_SHELL_ARMOR)
            TURN { EXPECT_MOVE(opponent, MOVE_BRICK_BREAK); }
        else
            TURN { EXPECT_MOVE(opponent, MOVE_STORM_THROW); }
    }
}

AI_DOUBLE_BATTLE_TEST("AI recognizes Volt Absorb received from Trace")
{
    KNOWN_FAILING; // MGriffin's PR that switched two turn charging moves in AI tests broke this test, waiting on a fix
    GIVEN {
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT);
        PLAYER(SPECIES_MAGNETON);
        PLAYER(SPECIES_GARDEVOIR) { Ability(ABILITY_TRACE); }
        OPPONENT(SPECIES_JOLTEON) { Ability(ABILITY_VOLT_ABSORB); Moves(MOVE_THUNDER_WAVE, MOVE_THUNDERSHOCK, MOVE_WATER_GUN); }
        OPPONENT(SPECIES_JOLTEON) { Ability(ABILITY_VOLT_ABSORB); Moves(MOVE_THUNDER_WAVE, MOVE_THUNDERSHOCK, MOVE_WATER_GUN); }
    } WHEN {
        TURN { NOT_EXPECT_MOVE(opponentLeft, MOVE_THUNDERSHOCK); NOT_EXPECT_MOVE(opponentLeft, MOVE_THUNDER_WAVE); NOT_EXPECT_MOVE(opponentRight, MOVE_THUNDER_WAVE); }
    } THEN {
        EXPECT(gBattleResources->aiData->abilities[B_POSITION_PLAYER_RIGHT] == ABILITY_VOLT_ABSORB);
    }
}

AI_SINGLE_BATTLE_TEST("AI avoids contact moves against rocky helmet")
{
    u32 item;

    PARAMETRIZE { item = ITEM_NONE; }
    PARAMETRIZE { item = ITEM_ROCKY_HELMET; }

    GIVEN {
        ASSUME(MoveMakesContact(MOVE_BRANCH_POKE));
        ASSUME(!MoveMakesContact(MOVE_LEAFAGE));
        ASSUME(GetMovePower(MOVE_BRANCH_POKE) == GetMovePower(MOVE_LEAFAGE));
        ASSUME(GetMoveType(MOVE_BRANCH_POKE) == GetMoveType(MOVE_LEAFAGE));
        ASSUME(GetMoveCategory(MOVE_BRANCH_POKE) == GetMoveCategory(MOVE_LEAFAGE));
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT | AI_FLAG_OMNISCIENT);
        PLAYER(SPECIES_WOBBUFFET) { Item(item); }
        OPPONENT(SPECIES_WOBBUFFET) { Moves(MOVE_BRANCH_POKE, MOVE_LEAFAGE); }
    } WHEN {
        if (item == ITEM_ROCKY_HELMET)
            TURN { EXPECT_MOVE(opponent, MOVE_LEAFAGE); }
        else
            TURN { EXPECT_MOVES(opponent, MOVE_LEAFAGE, MOVE_BRANCH_POKE); }
    }
}

AI_SINGLE_BATTLE_TEST("AI uses a guaranteed KO move instead of the move with the highest expected damage")
{
    u32 flags;

    PARAMETRIZE { flags = AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY; }
    PARAMETRIZE { flags = AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT; }

    GIVEN {
        ASSUME(GetMoveCriticalHitStage(MOVE_SLASH) == 1);
        ASSUME(GetMovePower(MOVE_SLASH) == 70);
        ASSUME(GetMovePower(MOVE_STRENGTH) == 80);
        ASSUME(GetMoveType(MOVE_SLASH) == GetMoveType(MOVE_STRENGTH));
        ASSUME(GetMoveCategory(MOVE_SLASH) == GetMoveCategory(MOVE_STRENGTH));
        AI_FLAGS(flags);
        PLAYER(SPECIES_WOBBUFFET) { HP(225); }
        OPPONENT(SPECIES_ABSOL) { Ability(ABILITY_SUPER_LUCK); Moves(MOVE_SLASH, MOVE_STRENGTH); }
    } WHEN {
        TURN { EXPECT_MOVE(opponent, MOVE_SLASH); }
        if (flags & AI_FLAG_TRY_TO_FAINT)
            TURN { EXPECT_MOVE(opponent, MOVE_STRENGTH); }
        else
            TURN { EXPECT_MOVE(opponent, MOVE_SLASH); }
    } SCENE {
        if (flags & AI_FLAG_TRY_TO_FAINT)
            MESSAGE("Wobbuffet fainted!");
        else
            NOT MESSAGE("Wobbuffet fainted!");
    }
}

AI_SINGLE_BATTLE_TEST("AI stays choice locked into moves in spite of the player's ability disabling them")
{
    u32 playerMon, ability, aiMove;
    PARAMETRIZE { ability = ABILITY_DAZZLING;          playerMon = SPECIES_BRUXISH;       aiMove = MOVE_QUICK_ATTACK; }
    PARAMETRIZE { ability = ABILITY_QUEENLY_MAJESTY;   playerMon = SPECIES_TSAREENA;      aiMove = MOVE_QUICK_ATTACK; }
    PARAMETRIZE { ability = ABILITY_ARMOR_TAIL;        playerMon = SPECIES_FARIGIRAF;     aiMove = MOVE_QUICK_ATTACK; }
    PARAMETRIZE { ability = ABILITY_SOUNDPROOF;        playerMon = SPECIES_EXPLOUD;       aiMove = MOVE_BOOMBURST; }
    PARAMETRIZE { ability = ABILITY_BULLETPROOF;       playerMon = SPECIES_CHESNAUGHT;    aiMove = MOVE_BULLET_SEED; }

    GIVEN {
        ASSUME(gItemsInfo[ITEM_CHOICE_BAND].holdEffect == HOLD_EFFECT_CHOICE_BAND);
        ASSUME(GetMovePriority(MOVE_QUICK_ATTACK) == 1);
        ASSUME(IsSoundMove(MOVE_BOOMBURST));
        ASSUME(IsBallisticMove(MOVE_BULLET_SEED));
        ASSUME(GetMoveCategory(MOVE_TAIL_WHIP) == DAMAGE_CATEGORY_STATUS);
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT);
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(playerMon) { Ability(ability); }
        OPPONENT(SPECIES_SMEARGLE) { Item(ITEM_CHOICE_BAND); Moves(aiMove, MOVE_TACKLE); }
    } WHEN {
        TURN { SWITCH(player, 1); EXPECT_MOVE(opponent, aiMove); }
        TURN { EXPECT_MOVE(opponent, aiMove); }
    }
}

AI_SINGLE_BATTLE_TEST("AI won't use Sucker Punch if it expects a move of the same priority bracket and the opponent is faster")
{
    GIVEN {
        ASSUME(gMovesInfo[MOVE_QUICK_ATTACK].priority == 1);
        ASSUME(gMovesInfo[MOVE_SUCKER_PUNCH].priority == 1);
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT);
        PLAYER(SPECIES_WOBBUFFET) { Speed(300); Moves(MOVE_QUICK_ATTACK); }
        OPPONENT(SPECIES_WOBBUFFET) { Speed(100); Moves(MOVE_SUCKER_PUNCH, MOVE_TACKLE); }
    } WHEN {
        TURN { MOVE(player, MOVE_QUICK_ATTACK); EXPECT_MOVE(opponent, MOVE_SUCKER_PUNCH); }
        TURN { MOVE(player, MOVE_QUICK_ATTACK); EXPECT_MOVE(opponent, MOVE_TACKLE); }
    }
}
