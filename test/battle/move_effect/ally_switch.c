#include "global.h"
#include "test/battle.h"

ASSUMPTIONS
{
    ASSUME(GetMoveEffect(MOVE_ALLY_SWITCH) == EFFECT_ALLY_SWITCH);
}

SINGLE_BATTLE_TEST("Ally Switch fails in a single battle")
{
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(player, MOVE_ALLY_SWITCH); }
    } SCENE {
        MESSAGE("Wobbuffet used Ally Switch!");
        NOT ANIMATION(ANIM_TYPE_MOVE, MOVE_ALLY_SWITCH, player);
        MESSAGE("But it failed!");
    }
}

DOUBLE_BATTLE_TEST("Ally Switch fails if there is no partner")
{
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_WOBBUFFET) { HP(1); }
        OPPONENT(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(opponentLeft, MOVE_SCRATCH, target:playerRight); }
        TURN { MOVE(playerLeft, MOVE_ALLY_SWITCH); }
    } SCENE {
        MESSAGE("Wobbuffet fainted!");
        MESSAGE("Wobbuffet used Ally Switch!");
        NOT ANIMATION(ANIM_TYPE_MOVE, MOVE_ALLY_SWITCH, playerLeft);
        MESSAGE("But it failed!");
    }
}

DOUBLE_BATTLE_TEST("Ally Switch changes the position of battlers")
{
    GIVEN {
        ASSUME(GetMoveEffect(MOVE_SCREECH) == EFFECT_DEFENSE_DOWN_2);
        ASSUME(GetMoveTarget(MOVE_SCREECH) == MOVE_TARGET_SELECTED);
        PLAYER(SPECIES_WOBBUFFET) { Speed(5); } // Wobb is playerLeft, but it'll be Wynaut after Ally Switch
        PLAYER(SPECIES_WYNAUT) { Speed(4); }
        OPPONENT(SPECIES_KADABRA) { Speed(3); }
        OPPONENT(SPECIES_ABRA) { Speed(2); }
    } WHEN {
        TURN { MOVE(playerLeft, MOVE_ALLY_SWITCH); MOVE(opponentLeft, MOVE_SCREECH, target:playerLeft); MOVE(opponentRight, MOVE_SCREECH, target:playerLeft); }
    } SCENE {
        MESSAGE("Wobbuffet used Ally Switch!");
        ANIMATION(ANIM_TYPE_MOVE, MOVE_ALLY_SWITCH, playerLeft);
        MESSAGE("Wobbuffet and Wynaut switched places!");

        MESSAGE("The opposing Kadabra used Screech!");
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_STATS_CHANGE, playerLeft);
        MESSAGE("Wynaut's Defense harshly fell!");

        MESSAGE("The opposing Abra used Screech!");
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_STATS_CHANGE, playerLeft);
        MESSAGE("Wynaut's Defense harshly fell!");
    } THEN {
        EXPECT_EQ(playerLeft->speed, 4);
        EXPECT_EQ(playerLeft->species, SPECIES_WYNAUT);
        EXPECT_EQ(playerRight->speed, 5);
        EXPECT_EQ(playerRight->species, SPECIES_WOBBUFFET);
    }
}

DOUBLE_BATTLE_TEST("Ally Switch does not redirect the target of Snipe Shot")
{
    GIVEN {
        ASSUME(GetMoveEffect(MOVE_SNIPE_SHOT) == EFFECT_SNIPE_SHOT);
        PLAYER(SPECIES_WOBBUFFET); // Wobb is playerLeft, but it'll be Wynaut after Ally Switch
        PLAYER(SPECIES_WYNAUT);
        OPPONENT(SPECIES_KADABRA);
        OPPONENT(SPECIES_ABRA);
    } WHEN {
        TURN { MOVE(playerLeft, MOVE_ALLY_SWITCH); MOVE(opponentLeft, MOVE_SNIPE_SHOT, target:playerLeft); } // Kadabra targets Wobb and Snipe Shot ignores Ally Switch position change.
    } SCENE {
        MESSAGE("Wobbuffet used Ally Switch!");
        ANIMATION(ANIM_TYPE_MOVE, MOVE_ALLY_SWITCH, playerLeft);
        MESSAGE("Wobbuffet and Wynaut switched places!");

        MESSAGE("The opposing Kadabra used Snipe Shot!");
        ANIMATION(ANIM_TYPE_MOVE, MOVE_SNIPE_SHOT, opponentLeft);
        HP_BAR(playerRight);
    }
}

DOUBLE_BATTLE_TEST("Ally Switch does not redirect moves done by Pokémon with Stalwart and Propeller Tail")
{
    enum Ability ability;
    PARAMETRIZE { ability = ABILITY_STALWART; }
    PARAMETRIZE { ability = ABILITY_PROPELLER_TAIL; }
    PARAMETRIZE { ability = ABILITY_TELEPATHY; }

    GIVEN {
        PLAYER(SPECIES_WOBBUFFET); // Wobb is playerLeft, but it'll be Wynaut after Ally Switch
        PLAYER(SPECIES_WYNAUT);
        OPPONENT(SPECIES_KADABRA) { Ability(ability); }
        OPPONENT(SPECIES_ABRA);
    } WHEN {
        TURN { MOVE(playerLeft, MOVE_ALLY_SWITCH); MOVE(opponentLeft, MOVE_SCRATCH, target:playerRight); } // Kadabra targets playerRight Wynaut.
    } SCENE {
        MESSAGE("Wobbuffet used Ally Switch!");
        ANIMATION(ANIM_TYPE_MOVE, MOVE_ALLY_SWITCH, playerLeft);
        MESSAGE("Wobbuffet and Wynaut switched places!");

        MESSAGE("The opposing Kadabra used Scratch!");
        ANIMATION(ANIM_TYPE_MOVE, MOVE_SCRATCH, opponentLeft);
        HP_BAR((ability == ABILITY_STALWART || ability == ABILITY_PROPELLER_TAIL) ? playerLeft : playerRight);
    }
}

DOUBLE_BATTLE_TEST("Ally Switch has no effect on partner's chosen move")
{
    u16 chosenMove;
    struct BattlePokemon *chosenTarget = NULL;

    PARAMETRIZE { chosenMove = MOVE_SCRATCH; chosenTarget = opponentLeft; }
    PARAMETRIZE { chosenMove = MOVE_SCRATCH; chosenTarget = opponentRight; }
    PARAMETRIZE { chosenMove = MOVE_POUND; chosenTarget = opponentLeft; }
    PARAMETRIZE { chosenMove = MOVE_POUND; chosenTarget = opponentRight; }

    GIVEN {
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_WYNAUT) { Moves(MOVE_SCRATCH, MOVE_POUND, MOVE_CELEBRATE, MOVE_SCRATCH); }
        OPPONENT(SPECIES_KADABRA);
        OPPONENT(SPECIES_ABRA);
    } WHEN {
        TURN { MOVE(playerLeft, MOVE_ALLY_SWITCH); MOVE(playerRight, chosenMove, target:chosenTarget); }
    } SCENE {
        MESSAGE("Wobbuffet used Ally Switch!");
        ANIMATION(ANIM_TYPE_MOVE, MOVE_ALLY_SWITCH, playerLeft);
        MESSAGE("Wobbuffet and Wynaut switched places!");

        ANIMATION(ANIM_TYPE_MOVE, chosenMove, playerLeft);
        HP_BAR(chosenTarget);
    }
}

DOUBLE_BATTLE_TEST("Ally Switch - move fails if the target was ally which changed position")
{
    u32 move = MOVE_NONE;

    PARAMETRIZE { move = MOVE_COACHING; }
    PARAMETRIZE { move = MOVE_AROMATIC_MIST; }
    PARAMETRIZE { move = MOVE_HOLD_HANDS; }

    GIVEN {
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_WYNAUT);
        OPPONENT(SPECIES_KADABRA);
        OPPONENT(SPECIES_ABRA);
    } WHEN {
        TURN { MOVE(playerLeft, MOVE_ALLY_SWITCH); MOVE(playerRight, move, target:playerLeft); }
    } SCENE {
        MESSAGE("Wobbuffet used Ally Switch!");
        ANIMATION(ANIM_TYPE_MOVE, MOVE_ALLY_SWITCH, playerLeft);
        MESSAGE("Wobbuffet and Wynaut switched places!");

        NOT ANIMATION(ANIM_TYPE_MOVE, move, playerLeft);
        MESSAGE("But it failed!");
    }
}

DOUBLE_BATTLE_TEST("Ally Switch doesn't make self-targeting status moves fail")
{
    GIVEN {
        ASSUME(gMovesInfo[MOVE_HARDEN].target == MOVE_TARGET_USER);
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_WYNAUT);
        OPPONENT(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WYNAUT);
    } WHEN {
        TURN { MOVE(playerLeft, MOVE_ALLY_SWITCH); MOVE(playerRight, MOVE_HARDEN); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_ALLY_SWITCH, playerLeft);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_HARDEN, playerLeft);
    } THEN {
        EXPECT_EQ(playerLeft->statStages[STAT_DEF], DEFAULT_STAT_STAGE + 1);
    }
}

DOUBLE_BATTLE_TEST("Ally Switch doesn't increase the Protect-like moves counter (Gen5-8)")
{
    GIVEN {
        WITH_CONFIG(GEN_ALLY_SWITCH_FAIL_CHANCE, GEN_8);
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(playerLeft, MOVE_ALLY_SWITCH); }
    } THEN {
        EXPECT(gDisableStructs[B_POSITION_PLAYER_RIGHT].protectUses == 0);
    }
}

DOUBLE_BATTLE_TEST("Ally Switch increases the Protect-like moves counter (Gen9+)")
{
    GIVEN {
        WITH_CONFIG(GEN_ALLY_SWITCH_FAIL_CHANCE, GEN_9);
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(playerLeft, MOVE_ALLY_SWITCH); }
    } THEN {
        EXPECT(gDisableStructs[B_POSITION_PLAYER_RIGHT].protectUses == 1);
    }
}

DOUBLE_BATTLE_TEST("Ally Switch works if ally used two-turn move like Dig")
{
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_WYNAUT);
        OPPONENT(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(playerRight, MOVE_DIG, target:opponentRight); }
        TURN { MOVE(playerLeft, MOVE_ALLY_SWITCH); SKIP_TURN(playerRight); }
    } SCENE {
        MESSAGE("Wynaut used Dig!");
        MESSAGE("Wobbuffet used Ally Switch!");
        ANIMATION(ANIM_TYPE_MOVE, MOVE_ALLY_SWITCH, playerLeft);
        MESSAGE("Wobbuffet and Wynaut switched places!");
        NOT MESSAGE("Wynaut used -!");
        ANIMATION(ANIM_TYPE_MOVE, MOVE_DIG);
        HP_BAR(opponentRight);
    }
}

DOUBLE_BATTLE_TEST("Ally switch swaps sky drop targets if being used by partner")
{
    u8 visibility;
    GIVEN {
        ASSUME(GetMoveEffect(MOVE_SKY_DROP) == EFFECT_SKY_DROP);
        PLAYER(SPECIES_FEAROW) { Speed(100); }
        PLAYER(SPECIES_XATU)   { Speed(150); }
        OPPONENT(SPECIES_ARON) { Speed(25); Ability(ABILITY_STURDY); }
        OPPONENT(SPECIES_WYNAUT) { Speed(30); }
    } WHEN {
        TURN { MOVE(playerLeft, MOVE_SKY_DROP, target: opponentLeft); }
        TURN { MOVE(playerRight, MOVE_ALLY_SWITCH); SKIP_TURN(playerLeft); MOVE(opponentRight, MOVE_MUD_SPORT); MOVE(opponentLeft, MOVE_IRON_DEFENSE); }
    } SCENE {
        MESSAGE("Fearow used Sky Drop!");
        MESSAGE("Fearow took the opposing Aron into the sky!");
        // turn 2
        MESSAGE("Xatu used Ally Switch!");
        MESSAGE("Xatu and Fearow switched places!");
        MESSAGE("Fearow used Sky Drop!");
        HP_BAR(opponentLeft);
        MESSAGE("The opposing Wynaut used Mud Sport!");
        ANIMATION(ANIM_TYPE_MOVE, MOVE_MUD_SPORT, opponentRight);
        MESSAGE("The opposing Aron used Iron Defense!");
        ANIMATION(ANIM_TYPE_MOVE, MOVE_IRON_DEFENSE, opponentLeft);
    } THEN {
        // all battlers should be visible
        visibility = gBattleSpritesDataPtr->battlerData[0].invisible;
        EXPECT_EQ(visibility, 0);
        visibility = gBattleSpritesDataPtr->battlerData[1].invisible;
        EXPECT_EQ(visibility, 0);
        visibility = gBattleSpritesDataPtr->battlerData[2].invisible;
        EXPECT_EQ(visibility, 0);
        visibility = gBattleSpritesDataPtr->battlerData[3].invisible;
        EXPECT_EQ(visibility, 0);
    }
}

DOUBLE_BATTLE_TEST("Ally switch swaps opposing sky drop targets if partner is being held in the air")
{
    u8 visibility;
    GIVEN {
        ASSUME(GetMoveEffect(MOVE_SKY_DROP) == EFFECT_SKY_DROP);
        PLAYER(SPECIES_ARON) { Speed(25); Ability(ABILITY_STURDY); }
        PLAYER(SPECIES_WYNAUT) { Speed(30); }
        OPPONENT(SPECIES_FEAROW) { Speed(100); }
        OPPONENT(SPECIES_XATU)   { Speed(150); }
    } WHEN {
        TURN { MOVE(opponentLeft, MOVE_SKY_DROP, target: playerLeft); }
        TURN { MOVE(opponentRight, MOVE_ALLY_SWITCH); SKIP_TURN(opponentLeft); MOVE(playerRight, MOVE_MUD_SPORT); MOVE(playerLeft, MOVE_IRON_DEFENSE); }
    } SCENE {
        MESSAGE("The opposing Fearow used Sky Drop!");
        MESSAGE("The opposing Fearow took Aron into the sky!");
        // turn 2
        MESSAGE("The opposing Xatu used Ally Switch!");
        MESSAGE("The opposing Xatu and the opposing Fearow switched places!");
        MESSAGE("The opposing Fearow used Sky Drop!");
        HP_BAR(playerLeft);
        MESSAGE("Wynaut used Mud Sport!");
        ANIMATION(ANIM_TYPE_MOVE, MOVE_MUD_SPORT, playerRight);
        MESSAGE("Aron used Iron Defense!");
        ANIMATION(ANIM_TYPE_MOVE, MOVE_IRON_DEFENSE, playerLeft);
    } THEN {
        // all battlers should be visible
        visibility = gBattleSpritesDataPtr->battlerData[0].invisible;
        EXPECT_EQ(visibility, 0);
        visibility = gBattleSpritesDataPtr->battlerData[1].invisible;
        EXPECT_EQ(visibility, 0);
        visibility = gBattleSpritesDataPtr->battlerData[2].invisible;
        EXPECT_EQ(visibility, 0);
        visibility = gBattleSpritesDataPtr->battlerData[3].invisible;
        EXPECT_EQ(visibility, 0);
    }
}

DOUBLE_BATTLE_TEST("Ally Switch swaps Illusion data")
{
    GIVEN {
        ASSUME(GetMoveEffect(MOVE_ALLY_SWITCH) == EFFECT_ALLY_SWITCH);
        PLAYER(SPECIES_HOOPA);
        PLAYER(SPECIES_ZOROARK);
        PLAYER(SPECIES_MAMOSWINE); // the third member here is required for zoroark
        OPPONENT(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(playerLeft, MOVE_ALLY_SWITCH); }
    } THEN {
        EXPECT(&gPlayerParty[2] == gBattleStruct->illusion[0].mon);
    }
}

DOUBLE_BATTLE_TEST("Ally switch updates last used moves for Mimic")
{
    GIVEN {
        PLAYER(SPECIES_XATU)     { Speed(100); }
        PLAYER(SPECIES_RIOLU)    { Speed(150); }
        OPPONENT(SPECIES_FEAROW) { Speed(20); }
        OPPONENT(SPECIES_ARON)   { Speed(30); }
    } WHEN {
        TURN { MOVE(playerRight, MOVE_FAKE_OUT, target: opponentRight); MOVE(playerLeft, MOVE_ALLY_SWITCH);
               MOVE(opponentLeft, MOVE_MIMIC, target: playerLeft);
             }
    } SCENE {
        MESSAGE("Riolu used Fake Out!");
        ANIMATION(ANIM_TYPE_MOVE, MOVE_FAKE_OUT, playerRight);
        MESSAGE("Xatu used Ally Switch!");
        ANIMATION(ANIM_TYPE_MOVE, MOVE_ALLY_SWITCH, playerLeft);
        MESSAGE("Xatu and Riolu switched places!");
        MESSAGE("The opposing Fearow used Mimic!");
        MESSAGE("The opposing Fearow learned Fake Out!");
    }
}

DOUBLE_BATTLE_TEST("Ally Switch does not update leech seed battler")
{
    GIVEN {
        PLAYER(SPECIES_WYNAUT);
        PLAYER(SPECIES_SOLOSIS);
        OPPONENT(SPECIES_BULBASAUR) { HP(50); MaxHP(100); }
        OPPONENT(SPECIES_RALTS)  { HP(50); MaxHP(100); }
    } WHEN {
        TURN { MOVE(opponentLeft, MOVE_LEECH_SEED, target: playerLeft); }
        TURN { MOVE(opponentRight, MOVE_ALLY_SWITCH); }
        TURN { ; }
    } SCENE {
        // turn 1
        MESSAGE("The opposing Bulbasaur used Leech Seed!");
        ANIMATION(ANIM_TYPE_MOVE, MOVE_LEECH_SEED, opponentLeft);
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_LEECH_SEED_DRAIN, playerLeft);
        HP_BAR(playerLeft);
        HP_BAR(opponentLeft);

        MESSAGE("The opposing Ralts used Ally Switch!");
        ANIMATION(ANIM_TYPE_MOVE, MOVE_ALLY_SWITCH, opponentRight);
        MESSAGE("The opposing Ralts and the opposing Bulbasaur switched places!");
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_LEECH_SEED_DRAIN, playerLeft);
        HP_BAR(playerLeft);
        HP_BAR(opponentLeft); // Ralts now gets hp gain
    } THEN {
        EXPECT_GT(opponentLeft->hp, 50);
        EXPECT_GT(opponentRight->hp, 50);
    }
}

DOUBLE_BATTLE_TEST("Ally Switch updates attract battler")
{
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET) { Speed(100); Gender(MON_MALE); }
        PLAYER(SPECIES_SOLOSIS)   { Speed(50); }
        OPPONENT(SPECIES_CLEFAIRY) { Speed(20); Gender(MON_FEMALE); Ability(ABILITY_CUTE_CHARM); }
        OPPONENT(SPECIES_RALTS)    { Speed(30); }
    } WHEN {
        TURN { MOVE(playerLeft, MOVE_TACKLE, target: opponentLeft); }
        TURN { MOVE(opponentRight, MOVE_ALLY_SWITCH); }
        TURN { ; }
    } SCENE {
        // turn 1
        MESSAGE("Wobbuffet used Tackle!");
        HP_BAR(opponentLeft);
        ABILITY_POPUP(opponentLeft, ABILITY_CUTE_CHARM);
        ANIMATION(ANIM_TYPE_STATUS, B_ANIM_STATUS_INFATUATION, playerLeft);
        MESSAGE("The opposing Clefairy's Cute Charm infatuated Wobbuffet!");
        // turn 2
        MESSAGE("The opposing Ralts used Ally Switch!");
        ANIMATION(ANIM_TYPE_MOVE, MOVE_ALLY_SWITCH, opponentRight);
        MESSAGE("The opposing Ralts and the opposing Clefairy switched places!");
        // turn 3
        MESSAGE("Wobbuffet is in love with the opposing Clefairy!"); // tracks attract battler
    }
}

// Triple Battles required to test
//TO_DO_BATTLE_TEST("Ally Switch fails if the user is in the middle of the field in a Triple Battle");
