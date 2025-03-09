#include "global.h"
#include "test/battle.h"

ASSUMPTIONS
{
    ASSUME(GetMoveEffect(MOVE_HEAL_BELL) == EFFECT_HEAL_BELL);
}

DOUBLE_BATTLE_TEST("Heal Bell/Aromatherapy cures the entire party of the user from primary status effects")
{
    u32 j, move, status;
    PARAMETRIZE { move = MOVE_HEAL_BELL;    status = STATUS1_SLEEP; }
    PARAMETRIZE { move = MOVE_AROMATHERAPY; status = STATUS1_SLEEP; }
    PARAMETRIZE { move = MOVE_HEAL_BELL;    status = STATUS1_POISON; }
    PARAMETRIZE { move = MOVE_AROMATHERAPY; status = STATUS1_POISON; }
    PARAMETRIZE { move = MOVE_HEAL_BELL;    status = STATUS1_BURN; }
    PARAMETRIZE { move = MOVE_AROMATHERAPY; status = STATUS1_BURN; }
    PARAMETRIZE { move = MOVE_HEAL_BELL;    status = STATUS1_FREEZE; }
    PARAMETRIZE { move = MOVE_AROMATHERAPY; status = STATUS1_FREEZE; }
    PARAMETRIZE { move = MOVE_HEAL_BELL;    status = STATUS1_PARALYSIS; }
    PARAMETRIZE { move = MOVE_AROMATHERAPY; status = STATUS1_PARALYSIS; }
    PARAMETRIZE { move = MOVE_HEAL_BELL;    status = STATUS1_TOXIC_POISON; }
    PARAMETRIZE { move = MOVE_AROMATHERAPY; status = STATUS1_TOXIC_POISON; }
    PARAMETRIZE { move = MOVE_HEAL_BELL;    status = STATUS1_FROSTBITE; }
    PARAMETRIZE { move = MOVE_AROMATHERAPY; status = STATUS1_FROSTBITE; }

    GIVEN {
        ASSUME(GetMoveEffect(MOVE_AROMATHERAPY) == EFFECT_HEAL_BELL);
        PLAYER(SPECIES_WOBBUFFET) {
            if (status != STATUS1_SLEEP && status != STATUS1_FREEZE)
                Status1(status);
        }
        PLAYER(SPECIES_WOBBUFFET) { Status1(status); }
        PLAYER(SPECIES_WOBBUFFET) { Status1(status); }
        PLAYER(SPECIES_WOBBUFFET) { Status1(status); }
        PLAYER(SPECIES_WOBBUFFET) { Status1(status); }
        PLAYER(SPECIES_WOBBUFFET) { Status1(status); }
        OPPONENT(SPECIES_WYNAUT);
        OPPONENT(SPECIES_WYNAUT);
    } WHEN {
        TURN { MOVE(playerLeft, move, target: playerLeft); }
        TURN { SWITCH(playerLeft, 2); SWITCH(playerRight, 3); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, move, playerLeft);
        switch(status)
        {
        case STATUS1_SLEEP:        STATUS_ICON(playerLeft, sleep: FALSE);     STATUS_ICON(playerRight, sleep: FALSE);     break;
        case STATUS1_POISON:       STATUS_ICON(playerLeft, poison: FALSE);    STATUS_ICON(playerRight, poison: FALSE);    break;
        case STATUS1_BURN:         STATUS_ICON(playerLeft, burn: FALSE);      STATUS_ICON(playerRight, burn: FALSE);      break;
        case STATUS1_PARALYSIS:    STATUS_ICON(playerLeft, paralysis: FALSE); STATUS_ICON(playerRight, paralysis: FALSE); break;
        case STATUS1_TOXIC_POISON: STATUS_ICON(playerLeft, badPoison: FALSE); STATUS_ICON(playerRight, badPoison: FALSE); break;
        case STATUS1_FROSTBITE:    STATUS_ICON(playerLeft, frostbite: FALSE); STATUS_ICON(playerRight, frostbite: FALSE); break;
        }
        for (j = 0; j < PARTY_SIZE; j++)
            EXPECT_EQ(GetMonData(&gPlayerParty[0], MON_DATA_STATUS), STATUS1_NONE);
    }
}

DOUBLE_BATTLE_TEST("Heal Bell does not cure Soundproof partners (Gen 4, Gen 6+)")
{
    u32 ability, config;

    PARAMETRIZE { ability = ABILITY_SCRAPPY;    config = GEN_4; }
    PARAMETRIZE { ability = ABILITY_SOUNDPROOF; config = GEN_4; }
    PARAMETRIZE { ability = ABILITY_SOUNDPROOF; config = GEN_5; }
    PARAMETRIZE { ability = ABILITY_SOUNDPROOF; config = GEN_6; }

    GIVEN {
        ASSUME(IsSoundMove(MOVE_HEAL_BELL));
        WITH_CONFIG(GEN_CONFIG_HEAL_BELL_SOUNDPROOF, config);
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_EXPLOUD) { Ability(ability); Status1(STATUS1_POISON); }
        OPPONENT(SPECIES_WYNAUT);
        OPPONENT(SPECIES_WYNAUT);
    } WHEN {
        TURN { MOVE(playerLeft, MOVE_HEAL_BELL, target: playerLeft); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_HEAL_BELL, playerLeft);
        if (ability == ABILITY_SOUNDPROOF && config != GEN_5) {
            MESSAGE("Exploud was hurt by its poisoning!");
        } else {
            NOT MESSAGE("Exploud was hurt by its poisoning!");
        }
    }
}

SINGLE_BATTLE_TEST("Heal Bell cures inactive Soundproof Pokemon (Gen5+)")
{
    u32 config, ability;

    PARAMETRIZE { config = GEN_4, ability = ABILITY_SCRAPPY; }
    PARAMETRIZE { config = GEN_4, ability = ABILITY_SOUNDPROOF; }
    PARAMETRIZE { config = GEN_5, ability = ABILITY_SOUNDPROOF; }

    GIVEN {
        ASSUME(IsSoundMove(MOVE_HEAL_BELL));
        WITH_CONFIG(GEN_CONFIG_HEAL_BELL_SOUNDPROOF, config);
        PLAYER(SPECIES_WOBBUFFET) { Status1(STATUS1_POISON); }
        PLAYER(SPECIES_EXPLOUD) { Ability(ability); Status1(STATUS1_POISON); }
        OPPONENT(SPECIES_WYNAUT);
    } WHEN {
        TURN { MOVE(player, MOVE_HEAL_BELL, target: player); }
        TURN { SWITCH(player, 1); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_HEAL_BELL, player);
        SEND_IN_MESSAGE("Exploud");
        if (ability == ABILITY_SCRAPPY || config >= GEN_5) {
            NOT MESSAGE("Exploud was hurt by its poisoning!");
        } else {
            MESSAGE("Exploud was hurt by its poisoning!");
        }
    }
}


SINGLE_BATTLE_TEST("Heal Bell cures a Soundproof user (Gen5, Gen8+)")
{
    u32 config;
    PARAMETRIZE { config = GEN_4; }
    PARAMETRIZE { config = GEN_5; }
    PARAMETRIZE { config = GEN_6; }
    PARAMETRIZE { config = GEN_8; }
    GIVEN {
        ASSUME(IsSoundMove(MOVE_HEAL_BELL));
        WITH_CONFIG(GEN_CONFIG_HEAL_BELL_SOUNDPROOF, config);
        PLAYER(SPECIES_EXPLOUD) { Ability(ABILITY_SOUNDPROOF); Status1(STATUS1_POISON); }
        OPPONENT(SPECIES_WYNAUT);
    } WHEN {
        TURN { MOVE(player, MOVE_HEAL_BELL, target: player); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_HEAL_BELL, player);
        if (config == GEN_5 || config >= GEN_8) {
            NOT MESSAGE("Exploud was hurt by its poisoning!");
        } else {
            MESSAGE("Exploud was hurt by its poisoning!");
        }
    }
}
