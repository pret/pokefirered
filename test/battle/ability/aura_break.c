#include "global.h"
#include "test/battle.h"

DOUBLE_BATTLE_TEST("Aura Break inverts Fairy Aura's effect")
{
    s16 damage[3];

	GIVEN {
		PLAYER(SPECIES_WOBBUFFET);
		PLAYER(SPECIES_WOBBUFFET);
		PLAYER(SPECIES_XERNEAS) { Ability(ABILITY_FAIRY_AURA); }
		OPPONENT(SPECIES_WOBBUFFET);
		OPPONENT(SPECIES_WOBBUFFET);
		OPPONENT(SPECIES_ZYGARDE_50) { Ability(ABILITY_AURA_BREAK); }
	} WHEN {
		TURN { MOVE(playerLeft, MOVE_PLAY_ROUGH, target:opponentLeft); }
		TURN { MOVE(playerLeft, MOVE_PLAY_ROUGH, target:opponentLeft); SWITCH(playerRight, 2); }
		TURN { MOVE(playerLeft, MOVE_PLAY_ROUGH, target:opponentLeft); SWITCH(opponentRight, 2); }
	} SCENE {
		ANIMATION(ANIM_TYPE_MOVE, MOVE_PLAY_ROUGH, playerLeft);
		HP_BAR(opponentLeft, captureDamage: &damage[0]);

		ANIMATION(ANIM_TYPE_MOVE, MOVE_PLAY_ROUGH, playerLeft);
		HP_BAR(opponentLeft, captureDamage: &damage[1]);

		ANIMATION(ANIM_TYPE_MOVE, MOVE_PLAY_ROUGH, playerLeft);
		HP_BAR(opponentLeft, captureDamage: &damage[2]);

	} THEN {
		EXPECT_MUL_EQ(damage[0], UQ_4_12(1.33), damage[1]);
		EXPECT_MUL_EQ(damage[0], UQ_4_12(0.75), damage[2]);
	}
}

DOUBLE_BATTLE_TEST("Aura Break inverts Dark Aura's effect")
{
    s16 damage[3];

	GIVEN {
		PLAYER(SPECIES_WOBBUFFET);
		PLAYER(SPECIES_WOBBUFFET);
		PLAYER(SPECIES_YVELTAL) { Ability(ABILITY_DARK_AURA); }
		OPPONENT(SPECIES_WOBBUFFET);
		OPPONENT(SPECIES_WOBBUFFET);
		OPPONENT(SPECIES_ZYGARDE_50) { Ability(ABILITY_AURA_BREAK); }
	} WHEN {
		TURN { MOVE(playerLeft, MOVE_BITE, target:opponentLeft); }
		TURN { MOVE(playerLeft, MOVE_BITE, target:opponentLeft); SWITCH(playerRight, 2); }
		TURN { MOVE(playerLeft, MOVE_BITE, target:opponentLeft); SWITCH(opponentRight, 2); }
	} SCENE {
		ANIMATION(ANIM_TYPE_MOVE, MOVE_BITE, playerLeft);
		HP_BAR(opponentLeft, captureDamage: &damage[0]);

		ANIMATION(ANIM_TYPE_MOVE, MOVE_BITE, playerLeft);
		HP_BAR(opponentLeft, captureDamage: &damage[1]);

		ANIMATION(ANIM_TYPE_MOVE, MOVE_BITE, playerLeft);
		HP_BAR(opponentLeft, captureDamage: &damage[2]);

	} THEN {
		EXPECT_MUL_EQ(damage[0], UQ_4_12(1.33), damage[1]);
		EXPECT_MUL_EQ(damage[0], UQ_4_12(0.75), damage[2]);
	}
}

DOUBLE_BATTLE_TEST("Aura Break ignores Mold Breaker abilities")
{
    s16 damage[6];
    u32 species = SPECIES_WOBBUFFET, ability = ABILITY_NONE;

    PARAMETRIZE { species = SPECIES_WOBBUFFET, ability = ABILITY_SHADOW_TAG; }
    PARAMETRIZE { species = SPECIES_CRANIDOS, ability = ABILITY_MOLD_BREAKER; }
    PARAMETRIZE { species = SPECIES_ZEKROM, ability = ABILITY_TERAVOLT; }
    PARAMETRIZE { species = SPECIES_RESHIRAM, ability = ABILITY_TURBOBLAZE; }

	GIVEN {
		PLAYER(species) { Ability(ability); Level(50); }
		PLAYER(SPECIES_WOBBUFFET);
		PLAYER(SPECIES_YVELTAL) { Ability(ABILITY_DARK_AURA); }
		PLAYER(SPECIES_XERNEAS) { Ability(ABILITY_FAIRY_AURA); }
		OPPONENT(SPECIES_WOBBUFFET);
		OPPONENT(SPECIES_WOBBUFFET);
		OPPONENT(SPECIES_ZYGARDE_50) { Ability(ABILITY_AURA_BREAK); }
	} WHEN {
		TURN { MOVE(playerLeft, MOVE_BITE, target: opponentLeft); }
		TURN { MOVE(playerLeft, MOVE_PLAY_ROUGH, target: opponentLeft); }
		TURN { MOVE(playerLeft, MOVE_BITE, target: opponentLeft); SWITCH(playerRight, 2); }
		TURN { MOVE(playerLeft, MOVE_PLAY_ROUGH, target: opponentLeft); SWITCH(playerRight, 3); }
		TURN { MOVE(playerLeft, MOVE_BITE, target: opponentLeft); SWITCH(playerRight, 2); SWITCH(opponentRight, 2); }
		TURN { MOVE(playerLeft, MOVE_PLAY_ROUGH, target: opponentLeft); SWITCH(playerRight, 3); }
	} SCENE {
		ANIMATION(ANIM_TYPE_MOVE, MOVE_BITE, playerLeft);
		HP_BAR(opponentLeft, captureDamage: &damage[0]);

		ANIMATION(ANIM_TYPE_MOVE, MOVE_PLAY_ROUGH, playerLeft);
		HP_BAR(opponentLeft, captureDamage: &damage[1]);

		ANIMATION(ANIM_TYPE_MOVE, MOVE_BITE, playerLeft);
		HP_BAR(opponentLeft, captureDamage: &damage[2]);

		ANIMATION(ANIM_TYPE_MOVE, MOVE_PLAY_ROUGH, playerLeft);
		HP_BAR(opponentLeft, captureDamage: &damage[3]);

		ANIMATION(ANIM_TYPE_MOVE, MOVE_BITE, playerLeft);
		HP_BAR(opponentLeft, captureDamage: &damage[4]);

		ANIMATION(ANIM_TYPE_MOVE, MOVE_PLAY_ROUGH, playerLeft);
		HP_BAR(opponentLeft, captureDamage: &damage[5]);
    } THEN {
		EXPECT_MUL_EQ(damage[0], UQ_4_12(1.33), damage[2]);
		EXPECT_MUL_EQ(damage[0], UQ_4_12(0.75), damage[4]);
		EXPECT_MUL_EQ(damage[1], UQ_4_12(1.33), damage[3]);
		EXPECT_MUL_EQ(damage[1], UQ_4_12(0.75), damage[5]);
	}
}
