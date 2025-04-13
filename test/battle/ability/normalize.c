#include "global.h"
#include "test/battle.h"

ASSUMPTIONS
{
    ASSUME(GetMoveType(MOVE_TACKLE) == TYPE_NORMAL);
    ASSUME(GetMovePower(MOVE_TACKLE) > 0);
    ASSUME(GetMoveType(MOVE_WATER_GUN) == TYPE_WATER);
    ASSUME(GetMovePower(MOVE_WATER_GUN) > 0);
}

SINGLE_BATTLE_TEST("Normalize turns a move into a Normal-type move")
{
    u16 ability;
    PARAMETRIZE { ability = ABILITY_CUTE_CHARM; }
    PARAMETRIZE { ability = ABILITY_NORMALIZE; }
    GIVEN {
        ASSUME(gSpeciesInfo[SPECIES_GASTLY].types[0] == TYPE_GHOST);
        PLAYER(SPECIES_GASTLY);
        OPPONENT(SPECIES_SKITTY) { Ability(ability); Moves(MOVE_WATER_GUN);}
    } WHEN {
        TURN { MOVE(opponent, MOVE_WATER_GUN); }
    } SCENE {
        if (ability == ABILITY_CUTE_CHARM)
        {
            ANIMATION(ANIM_TYPE_MOVE, MOVE_WATER_GUN, opponent);
            NOT { MESSAGE("It doesn't affect Gastly…"); }
        }
        else
        {
            NOT { ANIMATION(ANIM_TYPE_MOVE, MOVE_WATER_GUN, opponent); }
            MESSAGE("It doesn't affect Gastly…");
        }
    }
}

SINGLE_BATTLE_TEST("Normalize affects status moves")
{
    u16 ability;
    PARAMETRIZE { ability = ABILITY_CUTE_CHARM; }
    PARAMETRIZE { ability = ABILITY_NORMALIZE; }
    GIVEN {
        ASSUME(GetMoveType(MOVE_THUNDER_WAVE) == TYPE_ELECTRIC);
        ASSUME(gSpeciesInfo[SPECIES_DRILBUR].types[0] == TYPE_GROUND);
        PLAYER(SPECIES_DRILBUR);
        OPPONENT(SPECIES_SKITTY) { Ability(ability); Moves(MOVE_THUNDER_WAVE);}
    } WHEN {
        TURN { MOVE(opponent, MOVE_THUNDER_WAVE); }
    } SCENE {
        if (ability == ABILITY_CUTE_CHARM)
        {
            NOT { ANIMATION(ANIM_TYPE_MOVE, MOVE_THUNDER_WAVE, opponent); }
            MESSAGE("But it failed!");
        }
        else
        {
            ANIMATION(ANIM_TYPE_MOVE, MOVE_THUNDER_WAVE, opponent);
            NOT { MESSAGE("But it failed!"); }
        }
    }
}

SINGLE_BATTLE_TEST("Normalize still makes Freeze-Dry do super effective damage to Water-type Pokémon", s16 damage)
{
    u16 ability;
    PARAMETRIZE { ability = ABILITY_CUTE_CHARM; }
    PARAMETRIZE { ability = ABILITY_NORMALIZE; }
    GIVEN {
        ASSUME(GetMoveType(MOVE_FREEZE_DRY) == TYPE_ICE);
        ASSUME(GetMoveEffect(MOVE_FREEZE_DRY) == EFFECT_SUPER_EFFECTIVE_ON_ARG);
        ASSUME(gSpeciesInfo[SPECIES_MUDKIP].types[0] == TYPE_WATER);
        PLAYER(SPECIES_MUDKIP);
        OPPONENT(SPECIES_SKITTY) { Ability(ability); Moves(MOVE_FREEZE_DRY);}
    } WHEN {
        TURN { MOVE(opponent, MOVE_FREEZE_DRY); }
    } SCENE {
        MESSAGE("It's super effective!");
    } FINALLY {
        EXPECT_MUL_EQ(results[0].damage, Q_4_12(1.8), results[1].damage); // STAB + Ate
    }
}

SINGLE_BATTLE_TEST("Normalize boosts power of unaffected moves by 20% (Gen7+)", s16 damage)
{
    u32 ability, genConfig;
    PARAMETRIZE { ability = ABILITY_CUTE_CHARM;     genConfig = GEN_7; }
    PARAMETRIZE { ability = ABILITY_CUTE_CHARM;     genConfig = GEN_6; }
    PARAMETRIZE { ability = ABILITY_NORMALIZE;      genConfig = GEN_7; }
    PARAMETRIZE { ability = ABILITY_NORMALIZE;      genConfig = GEN_6; }

    GIVEN {
        WITH_CONFIG(GEN_CONFIG_ATE_MULTIPLIER, genConfig);
        PLAYER(SPECIES_SKITTY) { Ability(ability); Moves(MOVE_TACKLE); }
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(player, MOVE_TACKLE); }
    } SCENE {
        HP_BAR(opponent, captureDamage: &results[i].damage);
    } FINALLY {
        if (genConfig >= GEN_7)
            EXPECT_MUL_EQ(results[0].damage, Q_4_12(1.2), results[2].damage); // Ate
        else
            EXPECT_EQ(results[1].damage, results[3].damage); // No boost
    }
}

SINGLE_BATTLE_TEST("Normalize boosts power of affected moves by 20% (Gen7+)", s16 damage)
{
    u32 ability, genConfig;
    PARAMETRIZE { ability = ABILITY_CUTE_CHARM;     genConfig = GEN_7; }
    PARAMETRIZE { ability = ABILITY_CUTE_CHARM;     genConfig = GEN_6; }
    PARAMETRIZE { ability = ABILITY_NORMALIZE;      genConfig = GEN_7; }
    PARAMETRIZE { ability = ABILITY_NORMALIZE;      genConfig = GEN_6; }

    GIVEN {
        WITH_CONFIG(GEN_CONFIG_ATE_MULTIPLIER, genConfig);
        PLAYER(SPECIES_SKITTY) { Ability(ability); Moves(MOVE_WATER_GUN); }
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(player, MOVE_WATER_GUN); }
    } SCENE {
        HP_BAR(opponent, captureDamage: &results[i].damage);
    } FINALLY {
        if (genConfig >= GEN_7)
            EXPECT_MUL_EQ(results[0].damage, Q_4_12(1.8), results[2].damage); // STAB + ate
        else
            EXPECT_MUL_EQ(results[1].damage, Q_4_12(1.5), results[3].damage); // STAB + no ate
    }
}

SINGLE_BATTLE_TEST("Normalize-affected moves become Electric-type under Electrify's effect", s16 damage)
{
    u32 ability, genConfig;
    PARAMETRIZE { ability = ABILITY_CUTE_CHARM;     genConfig = GEN_7; }
    PARAMETRIZE { ability = ABILITY_CUTE_CHARM;     genConfig = GEN_6; }
    PARAMETRIZE { ability = ABILITY_NORMALIZE;      genConfig = GEN_7; }
    PARAMETRIZE { ability = ABILITY_NORMALIZE;      genConfig = GEN_6; }

    GIVEN {
        ASSUME(GetMoveEffect(MOVE_ELECTRIFY) == EFFECT_ELECTRIFY);
        WITH_CONFIG(GEN_CONFIG_ATE_MULTIPLIER, genConfig);
        PLAYER(SPECIES_SKITTY) { Ability(ability); Moves(MOVE_WATER_GUN); }
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(opponent, MOVE_ELECTRIFY); MOVE(player, MOVE_WATER_GUN); }
    } SCENE {
        HP_BAR(opponent, captureDamage: &results[i].damage);
    } FINALLY {
        if (genConfig >= GEN_7)
            EXPECT_EQ(results[0].damage, results[2].damage);
        else
            EXPECT_EQ(results[1].damage, results[3].damage);
    }
}

SINGLE_BATTLE_TEST("Normalize-affected moves become Electric-type under Ion Deluge's effect", s16 damage)
{
    u32 ability, genConfig;
    PARAMETRIZE { ability = ABILITY_CUTE_CHARM;     genConfig = GEN_7; }
    PARAMETRIZE { ability = ABILITY_CUTE_CHARM;     genConfig = GEN_6; }
    PARAMETRIZE { ability = ABILITY_NORMALIZE;      genConfig = GEN_7; }
    PARAMETRIZE { ability = ABILITY_NORMALIZE;      genConfig = GEN_6; }

    GIVEN {
        ASSUME(GetMoveEffect(MOVE_ION_DELUGE) == EFFECT_ION_DELUGE);
        WITH_CONFIG(GEN_CONFIG_ATE_MULTIPLIER, genConfig);
        PLAYER(SPECIES_SKITTY) { Ability(ability); Moves(MOVE_WATER_GUN); }
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(opponent, MOVE_ION_DELUGE); MOVE(player, MOVE_WATER_GUN); }
    } SCENE {
        HP_BAR(opponent, captureDamage: &results[i].damage);
    } FINALLY {
        if (genConfig >= GEN_7)
            EXPECT_EQ(results[0].damage, results[2].damage);
        else
            EXPECT_EQ(results[1].damage, results[3].damage);
    }
}

SINGLE_BATTLE_TEST("Normalize doesn't affect Weather Ball's type", s16 damage)
{
    u16 move, ability;
    PARAMETRIZE { move = MOVE_CELEBRATE; ability = ABILITY_CUTE_CHARM; }
    PARAMETRIZE { move = MOVE_SUNNY_DAY; ability = ABILITY_CUTE_CHARM; }
    PARAMETRIZE { move = MOVE_CELEBRATE; ability = ABILITY_NORMALIZE; }
    PARAMETRIZE { move = MOVE_SUNNY_DAY; ability = ABILITY_NORMALIZE; }
    GIVEN {
        ASSUME(GetMoveEffect(MOVE_WEATHER_BALL) == EFFECT_WEATHER_BALL);
        ASSUME(GetMoveType(MOVE_WEATHER_BALL) == TYPE_NORMAL);
        ASSUME(gSpeciesInfo[SPECIES_MEGANIUM].types[0] == TYPE_GRASS);
        PLAYER(SPECIES_SKITTY) { Ability(ability); }
        OPPONENT(SPECIES_MEGANIUM);
    } WHEN {
        TURN { MOVE(player, move); }
        TURN { MOVE(player, MOVE_WEATHER_BALL); }
    } SCENE {
        HP_BAR(opponent, captureDamage: &results[i].damage);
        if (move == MOVE_SUNNY_DAY)
            MESSAGE("It's super effective!");
    } FINALLY {
        EXPECT_MUL_EQ(results[0].damage, Q_4_12(4.0), results[1].damage); // double base power + type effectiveness + sun 50% boost - STAB
        EXPECT_MUL_EQ(results[2].damage, Q_4_12(4.0), results[3].damage);
        EXPECT_EQ(results[0].damage, results[2].damage);
        EXPECT_EQ(results[1].damage, results[3].damage);
    }
}

SINGLE_BATTLE_TEST("Normalize doesn't affect Natural Gift's type")
{
    u16 ability;
    PARAMETRIZE { ability = ABILITY_CUTE_CHARM; }
    PARAMETRIZE { ability = ABILITY_NORMALIZE; }
    GIVEN {
        ASSUME(GetMoveEffect(MOVE_NATURAL_GIFT) == EFFECT_NATURAL_GIFT);
        ASSUME(gNaturalGiftTable[ITEM_TO_BERRY(ITEM_ORAN_BERRY)].type == TYPE_POISON);
        ASSUME(gSpeciesInfo[SPECIES_BELDUM].types[0] == TYPE_STEEL);
        PLAYER(SPECIES_SKITTY) { Ability(ability); Item(ITEM_ORAN_BERRY); }
        OPPONENT(SPECIES_BELDUM);
    } WHEN {
        TURN { MOVE(player, MOVE_NATURAL_GIFT); }
    } SCENE {
        NOT { ANIMATION(ANIM_TYPE_MOVE, MOVE_NATURAL_GIFT, player); }
        MESSAGE("It doesn't affect the opposing Beldum…");
    }
}

SINGLE_BATTLE_TEST("Normalize doesn't affect Judgment / Techno Blast / Multi-Attack's type")
{
    u16 move, item;
    PARAMETRIZE { move = MOVE_JUDGMENT; item = ITEM_ZAP_PLATE; }
    PARAMETRIZE { move = MOVE_TECHNO_BLAST; item = ITEM_SHOCK_DRIVE; }
    PARAMETRIZE { move = MOVE_MULTI_ATTACK; item = ITEM_ELECTRIC_MEMORY; }
    GIVEN {
        ASSUME(GetMoveEffect(MOVE_JUDGMENT) == EFFECT_CHANGE_TYPE_ON_ITEM);
        ASSUME(GetMoveEffect(MOVE_TECHNO_BLAST) == EFFECT_CHANGE_TYPE_ON_ITEM);
        ASSUME(GetMoveEffect(MOVE_MULTI_ATTACK) == EFFECT_CHANGE_TYPE_ON_ITEM);
        ASSUME(gItemsInfo[ITEM_ZAP_PLATE].holdEffect == HOLD_EFFECT_PLATE);
        ASSUME(gItemsInfo[ITEM_ZAP_PLATE].secondaryId == TYPE_ELECTRIC);
        ASSUME(gItemsInfo[ITEM_SHOCK_DRIVE].holdEffect == HOLD_EFFECT_DRIVE);
        ASSUME(gItemsInfo[ITEM_SHOCK_DRIVE].secondaryId == TYPE_ELECTRIC);
        ASSUME(gItemsInfo[ITEM_ELECTRIC_MEMORY].holdEffect == HOLD_EFFECT_MEMORY);
        ASSUME(gItemsInfo[ITEM_ELECTRIC_MEMORY].secondaryId == TYPE_ELECTRIC);
        ASSUME(gSpeciesInfo[SPECIES_DIGLETT].types[0] == TYPE_GROUND);
        PLAYER(SPECIES_SKITTY) { Ability(ABILITY_NORMALIZE); Item(item); }
        OPPONENT(SPECIES_DIGLETT);
    } WHEN {
        TURN { MOVE(player, move); }
    } SCENE {
        NOT { ANIMATION(ANIM_TYPE_MOVE, move, player); }
        MESSAGE("It doesn't affect the opposing Diglett…");
    }
}

SINGLE_BATTLE_TEST("Normalize doesn't affect Hidden Power's type")
{
    GIVEN {
        ASSUME(GetMoveEffect(MOVE_HIDDEN_POWER) == EFFECT_HIDDEN_POWER);
        ASSUME(gTypesInfo[TYPE_ELECTRIC].isHiddenPowerType == TRUE);
        ASSUME(gSpeciesInfo[SPECIES_DIGLETT].types[0] == TYPE_GROUND);
        PLAYER(SPECIES_SKITTY) { Ability(ABILITY_NORMALIZE); HPIV(31); AttackIV(31); DefenseIV(31); SpAttackIV(30); SpDefenseIV(31); SpeedIV(31); } // HP Electric
        OPPONENT(SPECIES_DIGLETT);
    } WHEN {
        TURN { MOVE(player, MOVE_HIDDEN_POWER); }
    } SCENE {
        NOT { ANIMATION(ANIM_TYPE_MOVE, MOVE_HIDDEN_POWER, player); }
        MESSAGE("It doesn't affect the opposing Diglett…");
    }
}

TO_DO_BATTLE_TEST("Aerilate doesn't affect Tera Starstorm's type");
TO_DO_BATTLE_TEST("Normalize makes Flying Press do Normal/Flying damage");
TO_DO_BATTLE_TEST("Normalize doesn't affect Terrain Pulse's type");
TO_DO_BATTLE_TEST("Normalize doesn't affect damaging Z-Move types");
