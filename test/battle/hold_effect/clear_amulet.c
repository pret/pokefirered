#include "global.h"
#include "test/battle.h"

ASSUMPTIONS
{
    ASSUME(gItemsInfo[ITEM_CLEAR_AMULET].holdEffect == HOLD_EFFECT_CLEAR_AMULET);
}

SINGLE_BATTLE_TEST("Clear Amulet prevents Intimidate")
{
    s16 turnOneHit;
    s16 turnTwoHit;

    GIVEN {
        PLAYER(SPECIES_EKANS) { Ability(ABILITY_SHED_SKIN); };
        PLAYER(SPECIES_EKANS) { Ability(ABILITY_INTIMIDATE); };
        OPPONENT(SPECIES_WOBBUFFET) { Item(ITEM_CLEAR_AMULET); };
    } WHEN {
        TURN { MOVE(opponent, MOVE_SCRATCH); }
        TURN { SWITCH(player, 1); MOVE(opponent, MOVE_SCRATCH); }
    } SCENE {
        HP_BAR(player, captureDamage: &turnOneHit);
        ABILITY_POPUP(player, ABILITY_INTIMIDATE);
        NOT ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_STATS_CHANGE, player);
        MESSAGE("The effects of the Clear Amulet held by the opposing Wobbuffet prevents its stats from being lowered!");
        HP_BAR(player, captureDamage: &turnTwoHit);
    } THEN {
        EXPECT_EQ(turnOneHit, turnTwoHit);
    }
}

SINGLE_BATTLE_TEST("Clear Amulet prevents stat reducing effects")
{
    u32 move;

    PARAMETRIZE { move = MOVE_GROWL; }
    PARAMETRIZE { move = MOVE_LEER; }
    PARAMETRIZE { move = MOVE_CONFIDE; }
    PARAMETRIZE { move = MOVE_FAKE_TEARS; }
    PARAMETRIZE { move = MOVE_SCARY_FACE; }
    PARAMETRIZE { move = MOVE_SWEET_SCENT; }
    PARAMETRIZE { move = MOVE_SAND_ATTACK; }

    GIVEN {
        ASSUME(GetMoveEffect(MOVE_GROWL) == EFFECT_ATTACK_DOWN);
        ASSUME(GetMoveEffect(MOVE_LEER) == EFFECT_DEFENSE_DOWN);
        ASSUME(GetMoveEffect(MOVE_CONFIDE) == EFFECT_SPECIAL_ATTACK_DOWN);
        ASSUME(GetMoveEffect(MOVE_FAKE_TEARS) == EFFECT_SPECIAL_DEFENSE_DOWN_2);
        ASSUME(GetMoveEffect(MOVE_SCARY_FACE) == EFFECT_SPEED_DOWN_2);
        ASSUME(GetMoveEffect(MOVE_SWEET_SCENT) == (B_UPDATED_MOVE_DATA >= GEN_6 ? EFFECT_EVASION_DOWN_2 : EFFECT_EVASION_DOWN));
        ASSUME(GetMoveEffect(MOVE_SAND_ATTACK) == EFFECT_ACCURACY_DOWN);
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET) { Item(ITEM_CLEAR_AMULET); };
    } WHEN {
        TURN { MOVE(player, move); }
    } SCENE {
        NOT ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_STATS_CHANGE, opponent);
        MESSAGE("The effects of the Clear Amulet held by the opposing Wobbuffet prevents its stats from being lowered!");
    }
}

SINGLE_BATTLE_TEST("Clear Amulet prevents secondary effects that reduce stats")
{
    u32 move;

    PARAMETRIZE { move = MOVE_AURORA_BEAM; }
    PARAMETRIZE { move = MOVE_ROCK_SMASH; }
    PARAMETRIZE { move = MOVE_SNARL; }
    PARAMETRIZE { move = MOVE_PSYCHIC; }
    PARAMETRIZE { move = MOVE_BUBBLE_BEAM; }
    PARAMETRIZE { move = MOVE_MUD_SLAP; }

    GIVEN {
        ASSUME(MoveHasAdditionalEffect(MOVE_AURORA_BEAM, MOVE_EFFECT_ATK_MINUS_1) == TRUE);
        ASSUME(MoveHasAdditionalEffect(MOVE_ROCK_SMASH, MOVE_EFFECT_DEF_MINUS_1) == TRUE);
        ASSUME(MoveHasAdditionalEffect(MOVE_BUBBLE_BEAM, MOVE_EFFECT_SPD_MINUS_1) == TRUE);
        ASSUME(MoveHasAdditionalEffect(MOVE_SNARL, MOVE_EFFECT_SP_ATK_MINUS_1) == TRUE);
        ASSUME(MoveHasAdditionalEffect(MOVE_PSYCHIC, MOVE_EFFECT_SP_DEF_MINUS_1) == TRUE);
        ASSUME(MoveHasAdditionalEffect(MOVE_MUD_SLAP, MOVE_EFFECT_ACC_MINUS_1) == TRUE);
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET) { Item(ITEM_CLEAR_AMULET); };
    } WHEN {
        TURN { MOVE(player, move); }
    } SCENE {
        NONE_OF {
            ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_STATS_CHANGE, opponent);
            MESSAGE("The effects of the Clear Amulet held by the opposing Wobbuffet prevents its stats from being lowered!");
        }
    }
}

SINGLE_BATTLE_TEST("Clear Amulet protects from Protect's secondary effects")
{
    u32 move;

    PARAMETRIZE { move = MOVE_SPIKY_SHIELD; }
    PARAMETRIZE { move = MOVE_BANEFUL_BUNKER; }
    PARAMETRIZE { move = MOVE_BURNING_BULWARK; }
    PARAMETRIZE { move = MOVE_KINGS_SHIELD; }
    PARAMETRIZE { move = MOVE_SILK_TRAP; }
    PARAMETRIZE { move = MOVE_OBSTRUCT; }

    GIVEN {
        PLAYER(SPECIES_WOBBUFFET) { Item(ITEM_CLEAR_AMULET); }
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(opponent, move); MOVE(player, MOVE_SCRATCH); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, move, opponent);
        NONE_OF {
            ANIMATION(ANIM_TYPE_MOVE, MOVE_SCRATCH, player);
            if (move == MOVE_KINGS_SHIELD) {
                MESSAGE("Wobbuffet's Attack fell!");
            } else if (move == MOVE_SILK_TRAP) {
                MESSAGE("Wobbuffet's Speed fell!");
            } else if (move == MOVE_OBSTRUCT) {
                MESSAGE("Wobbuffet's Defense harshly fell!");
            }
        }
    }
}
