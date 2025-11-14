#include "global.h"
#include "test/battle.h"

#if B_UPDATED_MOVE_DATA >= GEN_6
    #define FUTURE_SIGHT_EQUIVALENT MOVE_SEED_FLARE /* 120 power */
#elif B_UPDATED_MOVE_DATA >= GEN_5
    #define FUTURE_SIGHT_EQUIVALENT MOVE_DYNAMAX_CANNON /* 100 power */
#else
    #define FUTURE_SIGHT_EQUIVALENT MOVE_EXTRASENSORY /* 80 power */
#endif

ASSUMPTIONS
{
    ASSUME(GetMovePower(FUTURE_SIGHT_EQUIVALENT) == GetMovePower(MOVE_FUTURE_SIGHT));
    ASSUME(GetMoveCategory(FUTURE_SIGHT_EQUIVALENT) == GetMoveCategory(MOVE_FUTURE_SIGHT));
    ASSUME(GetMoveEffect(MOVE_FUTURE_SIGHT) == EFFECT_FUTURE_SIGHT);
    ASSUME(GetMovePower(MOVE_FUTURE_SIGHT) > 0);
}

SINGLE_BATTLE_TEST("Future Sight uses Sp. Atk stat of the original user without modifiers")
{
    u32 item;
    s16 seedFlareDmg;
    s16 futureSightDmg;

    PARAMETRIZE { item = ITEM_TWISTED_SPOON; }
    PARAMETRIZE { item = ITEM_PSYCHIC_GEM; }

    GIVEN {
        PLAYER(SPECIES_PIKACHU) { Item(item); }
        PLAYER(SPECIES_RAICHU) { Item(item); }
        OPPONENT(SPECIES_REGICE);
    } WHEN {
        TURN { MOVE(player, FUTURE_SIGHT_EQUIVALENT, WITH_RNG(RNG_SECONDARY_EFFECT, FALSE)); }
        TURN { MOVE(player, MOVE_FUTURE_SIGHT); }
        TURN { SWITCH(player, 1); }
        TURN { }
        TURN { }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, FUTURE_SIGHT_EQUIVALENT, player);
        HP_BAR(opponent, captureDamage: &seedFlareDmg);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_FUTURE_SIGHT, player);
        MESSAGE("The opposing Regice took the Future Sight attack!");
        HP_BAR(opponent, captureDamage: &futureSightDmg);
    } THEN {
        EXPECT_EQ(seedFlareDmg, futureSightDmg);
    }
}

SINGLE_BATTLE_TEST("Future Sight is not boosted by Life Orb is original user if not on the field")
{
    s16 seedFlareDmg;
    s16 futureSightDmg;

    GIVEN {
        PLAYER(SPECIES_PIKACHU);
        PLAYER(SPECIES_RAICHU) { Item(ITEM_LIFE_ORB); }
        OPPONENT(SPECIES_REGICE);
    } WHEN {
        TURN { MOVE(player, FUTURE_SIGHT_EQUIVALENT, WITH_RNG(RNG_SECONDARY_EFFECT, FALSE)); }
        TURN { MOVE(player, MOVE_FUTURE_SIGHT); }
        TURN { SWITCH(player, 1); }
        TURN { }
        TURN { }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, FUTURE_SIGHT_EQUIVALENT, player);
        HP_BAR(opponent, captureDamage: &seedFlareDmg);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_FUTURE_SIGHT, player);
        MESSAGE("The opposing Regice took the Future Sight attack!");
        HP_BAR(opponent, captureDamage: &futureSightDmg);
        NOT HP_BAR(player);
    } THEN {
        EXPECT_EQ(seedFlareDmg, futureSightDmg);
    }
}

TO_DO_BATTLE_TEST("Future Sight does not receive STAB from party mon (Gen 2-4)")
SINGLE_BATTLE_TEST("Future Sight receives STAB from party mon (Gen 5+)")
{
    s16 seedFlareDmg;
    s16 futureSightDmg;

    GIVEN {
        PLAYER(SPECIES_RALTS);
        PLAYER(SPECIES_RAICHU);
        OPPONENT(SPECIES_REGICE);
    } WHEN {
        TURN { MOVE(player, FUTURE_SIGHT_EQUIVALENT, WITH_RNG(RNG_SECONDARY_EFFECT, FALSE)); }
        TURN { MOVE(player, MOVE_FUTURE_SIGHT); }
        TURN { SWITCH(player, 1); }
        TURN { }
        TURN { }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, FUTURE_SIGHT_EQUIVALENT, player);
        HP_BAR(opponent, captureDamage: &seedFlareDmg);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_FUTURE_SIGHT, player);
        HP_BAR(opponent, captureDamage: &futureSightDmg);
    } THEN {
        EXPECT_MUL_EQ(seedFlareDmg, Q_4_12(1.5), futureSightDmg);
    }
}

TO_DO_BATTLE_TEST("Future Sight is not affected by type effectiveness (Gen 2-4)")
SINGLE_BATTLE_TEST("Future Sight is affected by type effectiveness (Gen 5+)")
{
    GIVEN {
        PLAYER(SPECIES_PIKACHU);
        PLAYER(SPECIES_RAICHU);
        OPPONENT(SPECIES_HOUNDOOM);
    } WHEN {
        TURN { MOVE(player, FUTURE_SIGHT_EQUIVALENT, WITH_RNG(RNG_SECONDARY_EFFECT, FALSE)); }
        TURN { MOVE(player, MOVE_FUTURE_SIGHT); }
        TURN { SWITCH(player, 1); }
        TURN { }
        TURN { }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, FUTURE_SIGHT_EQUIVALENT, player);
        HP_BAR(opponent);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_FUTURE_SIGHT, player);
        MESSAGE("The opposing Houndoom took the Future Sight attack!");
        MESSAGE("It doesn't affect the opposing Houndoom…");
        NOT HP_BAR(opponent);
    }
}

TO_DO_BATTLE_TEST("Future Sight ignores Wonder Guard (Gen 2-4)")
TO_DO_BATTLE_TEST("Future Sight doesn't ignore Wonder Guard (Gen 5+)")

SINGLE_BATTLE_TEST("Future Sight will miss timing if target faints before it is about to get hit")
{
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WYNAUT);
    } WHEN {
        TURN { MOVE(player, MOVE_FUTURE_SIGHT); }
        TURN { MOVE(player, MOVE_CELEBRATE); }
        TURN { MOVE(player, MOVE_CELEBRATE); MOVE(opponent, MOVE_MEMENTO); SEND_OUT(opponent, 1); }
        TURN { }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_FUTURE_SIGHT, player);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_CELEBRATE, player);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_CELEBRATE, player);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_MEMENTO, opponent);
        MESSAGE("The opposing Wobbuffet fainted!");
        MESSAGE("2 sent out Wynaut!");
        NOT MESSAGE("The opposing Wynaut took the Future Sight attack!");
    }
}

SINGLE_BATTLE_TEST("Future Sight will miss timing if target faints by residual damage")
{
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET) { HP(10); }
        OPPONENT(SPECIES_WYNAUT);
    } WHEN {
        TURN { MOVE(player, MOVE_FUTURE_SIGHT); }
        TURN { MOVE(player, MOVE_CELEBRATE); }
        TURN { MOVE(player, MOVE_WRAP); SEND_OUT(opponent, 1); }
        TURN { }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_FUTURE_SIGHT, player);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_CELEBRATE, player);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_WRAP, player);
        MESSAGE("The opposing Wobbuffet fainted!");
        MESSAGE("2 sent out Wynaut!");
        NOT MESSAGE("The opposing Wynaut took the Future Sight attack!");
    }
}

SINGLE_BATTLE_TEST("Future Sight breaks Focus Sash and doesn't make the holder endure another move")
{
    GIVEN {
        ASSUME(GetMovePower(MOVE_PSYCHIC) > 0);
        ASSUME(gItemsInfo[ITEM_FOCUS_SASH].holdEffect == HOLD_EFFECT_FOCUS_SASH);
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_PIDGEY) { Level(1); Item(ITEM_FOCUS_SASH); }
    } WHEN {
        TURN { MOVE(player, MOVE_FUTURE_SIGHT); }
        TURN { }
        TURN { }
        TURN { MOVE(player, MOVE_PSYCHIC); }
    } SCENE {
        MESSAGE("The opposing Pidgey hung on using its Focus Sash!");
        ANIMATION(ANIM_TYPE_MOVE, MOVE_PSYCHIC, player);
        MESSAGE("The opposing Pidgey fainted!");
    }
}
