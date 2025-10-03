#include "global.h"
#include "test/battle.h"

ASSUMPTIONS
{
    ASSUME(GetMoveEffect(MOVE_RAGE_FIST) == EFFECT_RAGE_FIST);
    ASSUME(GetMovePower(MOVE_RAGE_FIST) == 50);
}

SINGLE_BATTLE_TEST("Rage Fist base power is increased by 50 if the user takes damage")
{
    u8 turns;
    s16 timesGotHit[2];

    GIVEN {
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_REGIROCK);
    } WHEN {
        for (turns = 0; turns < 2; turns++) {
            TURN { MOVE(player, MOVE_RAGE_FIST); MOVE(opponent, MOVE_SCRATCH); }
        }
    } SCENE {
        for (turns = 0; turns < 2; turns++) {
            ANIMATION(ANIM_TYPE_MOVE, MOVE_RAGE_FIST, player);
            HP_BAR(opponent, captureDamage: &timesGotHit[turns]);
            ANIMATION(ANIM_TYPE_MOVE, MOVE_SCRATCH, opponent);
            HP_BAR(player);
        }
    } THEN {
        EXPECT_MUL_EQ(timesGotHit[0], Q_4_12(2.0), timesGotHit[1]);
    }
}

SINGLE_BATTLE_TEST("Rage Fist base power is increased by each multi hit")
{
    u8 turns;
    s16 timesGotHit[2];

    GIVEN {
        ASSUME(GetMoveEffect(MOVE_BULLET_SEED) == EFFECT_MULTI_HIT);
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_REGIROCK);
    } WHEN {
        for (turns = 0; turns < 2; turns++) {
            TURN { MOVE(player, MOVE_RAGE_FIST); MOVE(opponent, MOVE_BULLET_SEED); }
        }
    } SCENE {
        for (turns = 0; turns < 2; turns++) {
            ANIMATION(ANIM_TYPE_MOVE, MOVE_RAGE_FIST, player);
            HP_BAR(opponent, captureDamage: &timesGotHit[turns]);
            ANIMATION(ANIM_TYPE_MOVE, MOVE_BULLET_SEED, opponent);
            HP_BAR(player);
        }
    } THEN {
        EXPECT_MUL_EQ(timesGotHit[0], Q_4_12(6.0), timesGotHit[1]);
    }
}

SINGLE_BATTLE_TEST("Rage Fist base power is not increased by a confusion hit")
{
    s16 timesGotHit[2];

    GIVEN {
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_REGIROCK);
    } WHEN {
        TURN { MOVE(player, MOVE_RAGE_FIST); MOVE(opponent, MOVE_CONFUSE_RAY); }
        TURN {}
        TURN { MOVE(player, MOVE_RAGE_FIST, WITH_RNG(RNG_CONFUSION, FALSE)); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_RAGE_FIST, player);
        HP_BAR(opponent, captureDamage: &timesGotHit[0]);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_CONFUSE_RAY, opponent);
        ANIMATION(ANIM_TYPE_STATUS, B_ANIM_STATUS_CONFUSION, player);
        MESSAGE("Wobbuffet became confused!");
        ANIMATION(ANIM_TYPE_STATUS, B_ANIM_STATUS_CONFUSION, player);
        MESSAGE("It hurt itself in its confusion!");
        HP_BAR(player);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_RAGE_FIST, player);
        HP_BAR(opponent, captureDamage: &timesGotHit[1]);
    } THEN {
        EXPECT_EQ(timesGotHit[0], timesGotHit[1]);
    }
}

DOUBLE_BATTLE_TEST("Rage Fist maximum base power is 350")
{
    u16 turns;
    s16 timesGotHit[2];

    GIVEN {
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_WYNAUT);
        OPPONENT(SPECIES_REGIROCK);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        for (turns = 1; turns <= 3; turns++) {
            TURN {
                if (turns == 1)
                    MOVE(playerLeft, MOVE_RAGE_FIST, target: opponentLeft);

                MOVE(playerRight, MOVE_SCRATCH, target: playerLeft);
                MOVE(opponentLeft, MOVE_SCRATCH, target: playerLeft);
                MOVE(opponentRight, MOVE_SCRATCH, target: playerLeft);
            }
        }
        TURN { MOVE(playerLeft, MOVE_RAGE_FIST, target: opponentLeft); }
    } SCENE {
        for (turns = 1; turns <= 3; turns++) {
            if (turns == 1) {
                ANIMATION(ANIM_TYPE_MOVE, MOVE_RAGE_FIST, playerLeft);
                HP_BAR(opponentLeft, captureDamage: &timesGotHit[0]);
            }
            ANIMATION(ANIM_TYPE_MOVE, MOVE_SCRATCH, playerRight);
            HP_BAR(playerLeft);
            ANIMATION(ANIM_TYPE_MOVE, MOVE_SCRATCH, opponentLeft);
            HP_BAR(playerLeft);
            ANIMATION(ANIM_TYPE_MOVE, MOVE_SCRATCH, opponentRight);
            HP_BAR(playerLeft);
        }
        ANIMATION(ANIM_TYPE_MOVE, MOVE_RAGE_FIST, playerLeft);
        HP_BAR(opponentLeft, captureDamage: &timesGotHit[1]);
    } THEN {
        EXPECT_MUL_EQ(timesGotHit[0], Q_4_12(7.0), timesGotHit[1]);
    }
}

SINGLE_BATTLE_TEST("Rage Fist base power is not increased if a substitute was hit")
{
    s16 timesGotHit[2];

    GIVEN {
        ASSUME(GetMoveCategory(MOVE_CRUNCH) == DAMAGE_CATEGORY_PHYSICAL); // Substitute doesn't fade otherwise
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_REGIROCK);
    } WHEN {
        TURN { MOVE(player, MOVE_RAGE_FIST); }
        TURN { MOVE(player, MOVE_SUBSTITUTE); MOVE(opponent, MOVE_CRUNCH); }
        TURN { MOVE(player, MOVE_RAGE_FIST); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_RAGE_FIST, player);
        HP_BAR(opponent, captureDamage: &timesGotHit[0]);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_SUBSTITUTE, player);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_CRUNCH, opponent);
        MESSAGE("The substitute took damage for Wobbuffet!");
        MESSAGE("Wobbuffet's substitute faded!");
        ANIMATION(ANIM_TYPE_MOVE, MOVE_RAGE_FIST, player);
        HP_BAR(opponent, captureDamage: &timesGotHit[1]);
    } THEN {
        EXPECT_EQ(timesGotHit[0], timesGotHit[1]);
    }
}

SINGLE_BATTLE_TEST("Rage Fist base power is not lost if user switches out")
{
    s16 timesGotHit[2];

    GIVEN {
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_WYNAUT);
        OPPONENT(SPECIES_REGIROCK);
    } WHEN {
        TURN { MOVE(player, MOVE_RAGE_FIST); MOVE(opponent, MOVE_SCRATCH); }
        TURN { SWITCH(player, 1); MOVE(opponent, MOVE_SCRATCH); }
        TURN { SWITCH(player, 0); }
        TURN { MOVE(player, MOVE_RAGE_FIST); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_RAGE_FIST, player);
        HP_BAR(opponent, captureDamage: &timesGotHit[0]);
        SWITCH_OUT_MESSAGE("Wobbuffet");
        ANIMATION(ANIM_TYPE_MOVE, MOVE_SCRATCH, opponent);
        SWITCH_OUT_MESSAGE("Wynaut");
        ANIMATION(ANIM_TYPE_MOVE, MOVE_RAGE_FIST, player);
        HP_BAR(opponent, captureDamage: &timesGotHit[1]);
    } THEN {
        EXPECT_MUL_EQ(timesGotHit[0], Q_4_12(2.0), timesGotHit[1]);
    }
}

SINGLE_BATTLE_TEST("Rage Fist base power is increased by 50 even if a damaging move does no damage - False Swipe")
{
    u8 turns;
    s16 timesGotHit[2];

    GIVEN {
        PLAYER(SPECIES_WOBBUFFET) { HP(1); }
        OPPONENT(SPECIES_REGIROCK);
    } WHEN {
        for (turns = 0; turns < 2; turns++) {
            TURN { MOVE(player, MOVE_RAGE_FIST); MOVE(opponent, MOVE_FALSE_SWIPE); }
        }
    } SCENE {
        for (turns = 0; turns < 2; turns++) {
            ANIMATION(ANIM_TYPE_MOVE, MOVE_RAGE_FIST, player);
            HP_BAR(opponent, captureDamage: &timesGotHit[turns]);
            ANIMATION(ANIM_TYPE_MOVE, MOVE_FALSE_SWIPE, opponent);
            HP_BAR(player);
        }
    } THEN {
        EXPECT_MUL_EQ(timesGotHit[0], Q_4_12(2.0), timesGotHit[1]);
    }
}

SINGLE_BATTLE_TEST("Rage Fist base power is increased by 50 even if a damaging move does no damage - Endure")
{
    s16 timesGotHit[2];

    GIVEN {
        PLAYER(SPECIES_WOBBUFFET) { HP(2); }
        OPPONENT(SPECIES_REGIROCK);
    } WHEN {
        TURN { MOVE(player, MOVE_RAGE_FIST); MOVE(opponent, MOVE_FALSE_SWIPE); }
        TURN { MOVE(player, MOVE_ENDURE); MOVE(opponent, MOVE_SCRATCH); }
        TURN { MOVE(player, MOVE_RAGE_FIST); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_RAGE_FIST, player);
        HP_BAR(opponent, captureDamage: &timesGotHit[0]);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_FALSE_SWIPE, opponent);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_ENDURE, player);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_SCRATCH, opponent);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_RAGE_FIST, player);
        HP_BAR(opponent, captureDamage: &timesGotHit[1]);
    } THEN {
        EXPECT_MUL_EQ(timesGotHit[0], Q_4_12(3.0), timesGotHit[1]);
    }
}

SINGLE_BATTLE_TEST("Rage Fist base power is not increased if move had no affect")
{
    u8 turns;
    s16 timesGotHit[2];

    GIVEN {
        PLAYER(SPECIES_GASTLY);
        OPPONENT(SPECIES_REGIROCK);
    } WHEN {
        for (turns = 0; turns < 2; turns++) {
            TURN { MOVE(player, MOVE_RAGE_FIST); MOVE(opponent, MOVE_SCRATCH); }
        }
    } SCENE {
        for (turns = 0; turns < 2; turns++) {
            ANIMATION(ANIM_TYPE_MOVE, MOVE_RAGE_FIST, player);
            HP_BAR(opponent, captureDamage: &timesGotHit[turns]);
            MESSAGE("The opposing Regirock used Scratch!");
            MESSAGE("It doesn't affect Gastly…");
        }
    } THEN {
        EXPECT_EQ(timesGotHit[0], timesGotHit[1]);
    }
}

SINGLE_BATTLE_TEST("Rage Fist base power is increased if Disguise breaks (Gen7)")
{
    s16 timesGotHit[2];
    u16 species = SPECIES_NONE;

    PARAMETRIZE { species = SPECIES_MIMIKYU_DISGUISED; }
    PARAMETRIZE { species = SPECIES_MIMIKYU_TOTEM_DISGUISED; }

    GIVEN {
        WITH_CONFIG(GEN_CONFIG_DISGUISE_HP_LOSS, GEN_7);
        PLAYER(species) { Ability(ABILITY_DISGUISE); }
        OPPONENT(SPECIES_REGIROCK);
    } WHEN {
        TURN { MOVE(player, MOVE_RAGE_FIST); MOVE(opponent, MOVE_ROCK_THROW); }
        TURN { MOVE(player, MOVE_RAGE_FIST); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_RAGE_FIST, player);
        HP_BAR(opponent, captureDamage: &timesGotHit[0]);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_ROCK_THROW, opponent);
        ABILITY_POPUP(player, ABILITY_DISGUISE);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_RAGE_FIST, player);
        HP_BAR(opponent, captureDamage: &timesGotHit[1]);
    } THEN {
        EXPECT_MUL_EQ(timesGotHit[0], Q_4_12(2.0), timesGotHit[1]);
    }
}

SINGLE_BATTLE_TEST("Rage Fist base power is increased if Disguise breaks (Gen8+)")
{
    s16 timesGotHit[2];
    u16 species = SPECIES_NONE;

    PARAMETRIZE { species = SPECIES_MIMIKYU_DISGUISED; }
    PARAMETRIZE { species = SPECIES_MIMIKYU_TOTEM_DISGUISED; }

    GIVEN {
        WITH_CONFIG(GEN_CONFIG_DISGUISE_HP_LOSS, GEN_8);
        PLAYER(species) { Ability(ABILITY_DISGUISE); }
        OPPONENT(SPECIES_REGIROCK);
    } WHEN {
        TURN { MOVE(player, MOVE_RAGE_FIST); MOVE(opponent, MOVE_ROCK_THROW); }
        TURN { MOVE(player, MOVE_RAGE_FIST); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_RAGE_FIST, player);
        HP_BAR(opponent, captureDamage: &timesGotHit[0]);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_ROCK_THROW, opponent);
        ABILITY_POPUP(player, ABILITY_DISGUISE);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_RAGE_FIST, player);
        HP_BAR(opponent, captureDamage: &timesGotHit[1]);
    } THEN {
        EXPECT_MUL_EQ(timesGotHit[0], Q_4_12(2.0), timesGotHit[1]);
    }
}

SINGLE_BATTLE_TEST("Rage Fist number of hits is copied by Transform")
{
    s16 timesGotHit[2];

    GIVEN {
        PLAYER(SPECIES_REGIROCK);
        OPPONENT(SPECIES_REGIROCK) { Moves(MOVE_RAGE_FIST, MOVE_CELEBRATE); }
    } WHEN {
            TURN { MOVE(player, MOVE_RAGE_FIST); MOVE(opponent, MOVE_CELEBRATE); }
            TURN { MOVE(player, MOVE_TRANSFORM); MOVE(opponent, MOVE_CELEBRATE); }
            TURN { MOVE(player, MOVE_RAGE_FIST); MOVE(opponent, MOVE_CELEBRATE); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_RAGE_FIST, player);
        HP_BAR(opponent, captureDamage: &timesGotHit[0]);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_TRANSFORM, player);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_RAGE_FIST, player);
        HP_BAR(opponent, captureDamage: &timesGotHit[1]);
    } THEN {
        EXPECT_MUL_EQ(timesGotHit[0], Q_4_12(2.0), timesGotHit[1]);
    }
}

SINGLE_BATTLE_TEST("Rage Fist base power is increased by 50 if user was hit and forces out")
{
    s16 timesGotHit[2];

    GIVEN {
        PLAYER(SPECIES_REGIROCK);
        OPPONENT(SPECIES_REGIROCK);
        OPPONENT(SPECIES_WYNAUT);
    } WHEN {
        TURN { MOVE(opponent, MOVE_RAGE_FIST); MOVE(player, MOVE_DRAGON_TAIL); }
        TURN { MOVE(player, MOVE_CELEBRATE); SWITCH(opponent, 0); }
        TURN { MOVE(opponent, MOVE_RAGE_FIST); MOVE(player, MOVE_CELEBRATE); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_RAGE_FIST, opponent);
        HP_BAR(player, captureDamage: &timesGotHit[0]);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_DRAGON_TAIL, player);
        HP_BAR(opponent);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_RAGE_FIST, opponent);
        HP_BAR(player, captureDamage: &timesGotHit[1]);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_CELEBRATE, player);
    } THEN {
        EXPECT_MUL_EQ(timesGotHit[0], Q_4_12(2.0), timesGotHit[1]);
    }
}

SINGLE_BATTLE_TEST("Rage Fist doesn't get increased power if Substitute is hit")
{
    s16 timesGotHit[2];

    GIVEN {
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(opponent, MOVE_RAGE_FIST); MOVE(player, MOVE_CELEBRATE); }
        TURN { MOVE(opponent, MOVE_SUBSTITUTE); MOVE(player, MOVE_SCRATCH); }
        TURN { MOVE(opponent, MOVE_RAGE_FIST); MOVE(player, MOVE_CELEBRATE); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_RAGE_FIST, opponent);
        HP_BAR(player, captureDamage: &timesGotHit[0]);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_RAGE_FIST, opponent);
        HP_BAR(player, captureDamage: &timesGotHit[1]);
    } THEN {
        EXPECT_EQ(timesGotHit[0], timesGotHit[1]);
    }
}

SINGLE_BATTLE_TEST("Rage Fist counter will be updated correctly after absorb move")
{
    s16 timesGotHit[2];

    GIVEN {
        ASSUME(GetMoveEffect(MOVE_GIGA_DRAIN) == EFFECT_ABSORB);
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(player, MOVE_RAGE_FIST); MOVE(opponent, MOVE_GIGA_DRAIN); }
        TURN { MOVE(player, MOVE_RAGE_FIST); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_RAGE_FIST, player);
        HP_BAR(opponent, captureDamage: &timesGotHit[0]);

        ANIMATION(ANIM_TYPE_MOVE, MOVE_GIGA_DRAIN, opponent);
        HP_BAR(player);

        ANIMATION(ANIM_TYPE_MOVE, MOVE_RAGE_FIST, player);
        HP_BAR(opponent, captureDamage: &timesGotHit[1]);
    } THEN {
        EXPECT_MUL_EQ(timesGotHit[0], Q_4_12(2.0), timesGotHit[1]);
    }
}
