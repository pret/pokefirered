#include "global.h"
#include "test/battle.h"

ASSUMPTIONS
{
    ASSUME(GetMoveType(MOVE_SCRATCH) == TYPE_NORMAL);
    ASSUME(GetMovePower(MOVE_SCRATCH) > 0);
}

SINGLE_BATTLE_TEST("Aerilate turns a Normal-type move into Flying-type move")
{
    GIVEN {
        PLAYER(SPECIES_MEGANIUM);
        OPPONENT(SPECIES_SALAMENCE) { Item(ITEM_SALAMENCITE); }
    } WHEN {
        TURN { MOVE(opponent, MOVE_SCRATCH, gimmick: GIMMICK_MEGA); }
    } SCENE {
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_MEGA_EVOLUTION, opponent);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_SCRATCH, opponent);
        MESSAGE("It's super effective!");
    }
}

SINGLE_BATTLE_TEST("Aerilate can not turn certain moves into Flying type moves")
{
    u32 move;
    PARAMETRIZE { move = MOVE_WEATHER_BALL; }
    // PARAMETRIZE { move = MOVE_NATURAL_GIFT; } TODO: handle this case via Skill Swap
    PARAMETRIZE { move = MOVE_JUDGMENT; }
    PARAMETRIZE { move = MOVE_TECHNO_BLAST; }
    PARAMETRIZE { move = MOVE_REVELATION_DANCE; }
    PARAMETRIZE { move = MOVE_MULTI_ATTACK; }
    PARAMETRIZE { move = MOVE_TERRAIN_PULSE; }
    GIVEN {
        PLAYER(SPECIES_MEGANIUM);
        OPPONENT(SPECIES_SALAMENCE) { Item(ITEM_SALAMENCITE); }
    } WHEN {
        TURN { MOVE(opponent, move, gimmick: GIMMICK_MEGA); }
    } SCENE {
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_MEGA_EVOLUTION, opponent);
        ANIMATION(ANIM_TYPE_MOVE, move, opponent);
        NONE_OF {
            MESSAGE("It's super effective!");
        }
    }
}

SINGLE_BATTLE_TEST("Aerilate boosts power of affected moves by 20% (Gen7+) or 30% (Gen1-6)", s16 damage)
{
    u32 move, genConfig;
    PARAMETRIZE { move = MOVE_CELEBRATE;   genConfig = GEN_7; }
    PARAMETRIZE { move = MOVE_CELEBRATE;   genConfig = GEN_6; }
    PARAMETRIZE { move = MOVE_SKILL_SWAP;  genConfig = GEN_7; }
    PARAMETRIZE { move = MOVE_SKILL_SWAP;  genConfig = GEN_6; }

    GIVEN {
        WITH_CONFIG(GEN_CONFIG_ATE_MULTIPLIER, genConfig);
        ASSUME(GetMoveType(MOVE_TACKLE) == TYPE_NORMAL);
        ASSUME(GetMoveEffect(MOVE_SKILL_SWAP) == EFFECT_SKILL_SWAP);
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_SALAMENCE) { Ability(ABILITY_MOXIE); Item(ITEM_SALAMENCITE); }
    } WHEN {
        TURN { MOVE(opponent, move, gimmick: GIMMICK_MEGA); MOVE(player, MOVE_TACKLE); }
    } SCENE {
        HP_BAR(opponent, captureDamage: &results[i].damage);
    } FINALLY {
        if (genConfig >= GEN_7)
            EXPECT_MUL_EQ(results[0].damage, Q_4_12(1.2), results[2].damage); // No STAB
        else
            EXPECT_MUL_EQ(results[1].damage, Q_4_12(1.3), results[3].damage); // No STAB
    }
}

SINGLE_BATTLE_TEST("Aerilate doesn't affect Weather Ball's type", s16 damage)
{
    u32 move1, move2;
    PARAMETRIZE { move1 = MOVE_CELEBRATE; move2 = MOVE_CELEBRATE; }
    PARAMETRIZE { move1 = MOVE_SUNNY_DAY; move2 = MOVE_CELEBRATE; }
    PARAMETRIZE { move1 = MOVE_CELEBRATE; move2 = MOVE_SKILL_SWAP; }
    PARAMETRIZE { move1 = MOVE_SUNNY_DAY; move2 = MOVE_SKILL_SWAP; }
    GIVEN {
        ASSUME(GetMoveEffect(MOVE_WEATHER_BALL) == EFFECT_WEATHER_BALL);
        ASSUME(GetMoveType(MOVE_WEATHER_BALL) == TYPE_NORMAL);
        ASSUME(GetMoveEffect(MOVE_SKILL_SWAP) == EFFECT_SKILL_SWAP);
        ASSUME(GetSpeciesType(SPECIES_PINSIR, 0) == TYPE_BUG);
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_PINSIR) { Ability(ABILITY_HYPER_CUTTER); Item(ITEM_PINSIRITE); }
    } WHEN {
        TURN { MOVE(opponent, move2, gimmick: GIMMICK_MEGA); MOVE(player, move1); }
        TURN { MOVE(player, MOVE_WEATHER_BALL); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, move2, opponent);
        ANIMATION(ANIM_TYPE_MOVE, move1, player);
        HP_BAR(opponent, captureDamage: &results[i].damage);
        if (move1 == MOVE_SUNNY_DAY)
            MESSAGE("It's super effective!");
    } FINALLY {
        EXPECT_MUL_EQ(results[0].damage, Q_4_12(6.0), results[1].damage); // double base power + type effectiveness + sun 50% boost
        EXPECT_MUL_EQ(results[2].damage, Q_4_12(6.0), results[3].damage);
        EXPECT_EQ(results[0].damage, results[2].damage);
        EXPECT_EQ(results[1].damage, results[3].damage);
    }
}

SINGLE_BATTLE_TEST("Aerilate doesn't affect Natural Gift's type")
{
    u16 move;
    PARAMETRIZE { move = MOVE_CELEBRATE; }
    PARAMETRIZE { move = MOVE_SKILL_SWAP; }
    GIVEN {
        ASSUME(GetMoveEffect(MOVE_NATURAL_GIFT) == EFFECT_NATURAL_GIFT);
        ASSUME(GetMoveEffect(MOVE_SKILL_SWAP) == EFFECT_SKILL_SWAP);
        ASSUME(gNaturalGiftTable[ITEM_TO_BERRY(ITEM_PERSIM_BERRY)].type == TYPE_GROUND);
        ASSUME(GetSpeciesType(SPECIES_SALAMENCE_MEGA, 0) == TYPE_FLYING || GetSpeciesType(SPECIES_SALAMENCE_MEGA, 1) == TYPE_FLYING);
        PLAYER(SPECIES_WOBBUFFET) { Item(ITEM_PERSIM_BERRY); }
        OPPONENT(SPECIES_SALAMENCE) { Item(ITEM_SALAMENCITE); }
    } WHEN {
        TURN { MOVE(opponent, move, gimmick: GIMMICK_MEGA); MOVE(player, MOVE_NATURAL_GIFT); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, move, opponent);
        NOT { ANIMATION(ANIM_TYPE_MOVE, MOVE_NATURAL_GIFT, player); }
        MESSAGE("It doesn't affect the opposing Salamence…");
    }
}

SINGLE_BATTLE_TEST("Aerilate doesn't affect Judgment / Techno Blast / Multi-Attack's type")
{
    u16 move, item;
    PARAMETRIZE { move = MOVE_JUDGMENT; item = ITEM_ZAP_PLATE; }
    PARAMETRIZE { move = MOVE_TECHNO_BLAST; item = ITEM_SHOCK_DRIVE; }
    PARAMETRIZE { move = MOVE_MULTI_ATTACK; item = ITEM_ELECTRIC_MEMORY; }
    GIVEN {
        ASSUME(GetMoveEffect(MOVE_JUDGMENT) == EFFECT_CHANGE_TYPE_ON_ITEM);
        ASSUME(GetMoveEffect(MOVE_TECHNO_BLAST) == EFFECT_CHANGE_TYPE_ON_ITEM);
        ASSUME(GetMoveEffect(MOVE_MULTI_ATTACK) == EFFECT_CHANGE_TYPE_ON_ITEM);
        ASSUME(GetMoveEffect(MOVE_SKILL_SWAP) == EFFECT_SKILL_SWAP);
        ASSUME(gItemsInfo[ITEM_ZAP_PLATE].holdEffect == HOLD_EFFECT_PLATE);
        ASSUME(gItemsInfo[ITEM_ZAP_PLATE].secondaryId == TYPE_ELECTRIC);
        ASSUME(gItemsInfo[ITEM_SHOCK_DRIVE].holdEffect == HOLD_EFFECT_DRIVE);
        ASSUME(gItemsInfo[ITEM_SHOCK_DRIVE].secondaryId == TYPE_ELECTRIC);
        ASSUME(gItemsInfo[ITEM_ELECTRIC_MEMORY].holdEffect == HOLD_EFFECT_MEMORY);
        ASSUME(gItemsInfo[ITEM_ELECTRIC_MEMORY].secondaryId == TYPE_ELECTRIC);
        ASSUME(GetSpeciesType(SPECIES_DIGLETT, 0) == TYPE_GROUND);
        PLAYER(SPECIES_WOBBUFFET) { Item(item); }
        OPPONENT(SPECIES_SALAMENCE) { Item(ITEM_SALAMENCITE); }
        OPPONENT(SPECIES_DIGLETT);
    } WHEN {
        TURN { MOVE(opponent, MOVE_SKILL_SWAP, gimmick: GIMMICK_MEGA); }
        TURN { SWITCH(opponent, 1); MOVE(player, move); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_SKILL_SWAP, opponent);
        NOT { ANIMATION(ANIM_TYPE_MOVE, move, player); }
        MESSAGE("It doesn't affect the opposing Diglett…");
    }
}

SINGLE_BATTLE_TEST("Aerilate doesn't affect Hidden Power's type")
{
    GIVEN {
        ASSUME(GetMoveEffect(MOVE_HIDDEN_POWER) == EFFECT_HIDDEN_POWER);
        ASSUME(gTypesInfo[TYPE_ELECTRIC].isHiddenPowerType == TRUE);
        ASSUME(GetSpeciesType(SPECIES_DIGLETT, 0) == TYPE_GROUND);
        PLAYER(SPECIES_PINSIR) { Ability(ABILITY_AERILATE); HPIV(31); AttackIV(31); DefenseIV(31); SpAttackIV(30); SpDefenseIV(31); SpeedIV(31); } // HP Electric
        OPPONENT(SPECIES_DIGLETT);
    } WHEN {
        TURN { MOVE(player, MOVE_HIDDEN_POWER); }
    } SCENE {
        NOT { ANIMATION(ANIM_TYPE_MOVE, MOVE_HIDDEN_POWER, player); }
        MESSAGE("It doesn't affect the opposing Diglett…");
    }
}

TO_DO_BATTLE_TEST("Aerilate doesn't override Electrify (Gen7+)"); // No mon with Aerilate exists in Gen8+, but probably behaves similar to Pixilate, which does.
TO_DO_BATTLE_TEST("Aerilate doesn't override Ion Deluge (Gen7+)"); // Ion Deluge doesn't exist in Gen 8+, but we probably could assume it behaves similar to under Electrify. TODO: Test by hacking SV.
TO_DO_BATTLE_TEST("Aerilate overrides Electrify (Gen6)")
TO_DO_BATTLE_TEST("Aerilate overrides Ion Deluge (Gen6)")
TO_DO_BATTLE_TEST("Aerilate doesn't affect Tera Starstorm's type");
TO_DO_BATTLE_TEST("Aerilate doesn't affect Max Strike's type");
TO_DO_BATTLE_TEST("Aerilate doesn't affect Terrain Pulse's type");
TO_DO_BATTLE_TEST("Aerilate doesn't affect damaging Z-Move types");
TO_DO_BATTLE_TEST("(DYNAMAX) Aerilate turns Max Strike into Max Airstream"); // All other -ate abilities do this, so interpolating this as no Aerilate mon is available in a Dynamax game
