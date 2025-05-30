#include "global.h"
#include "test/battle.h"
#include "battle_ai_util.h"

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
        OPPONENT(SPECIES_WOBBUFFET) { Moves(MOVE_SCRATCH, weatherMoveRight); }
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
        OPPONENT(SPECIES_WOBBUFFET) { Moves(MOVE_HELPING_HAND, MOVE_SCRATCH); }
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
        OPPONENT(SPECIES_WOBBUFFET) { Moves(MOVE_SCRATCH, statusMove); }
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

AI_DOUBLE_BATTLE_TEST("AI will not choose Earthquake if it damages the partner without a positive effect")
{
    ASSUME(GetMoveTarget(MOVE_EARTHQUAKE) == MOVE_TARGET_FOES_AND_ALLY);

    u32 species;

    PARAMETRIZE { species = SPECIES_CHARIZARD; }
    PARAMETRIZE { species = SPECIES_CHARMANDER; }
    PARAMETRIZE { species = SPECIES_CHIKORITA; }

    GIVEN {
        ASSUME(GetMoveTarget(MOVE_EARTHQUAKE) == MOVE_TARGET_FOES_AND_ALLY);
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT);
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_PHANPY) { Moves(MOVE_EARTHQUAKE, MOVE_SCRATCH); }
        OPPONENT(species) { Moves(MOVE_CELEBRATE); }
    } WHEN {
        if (species == SPECIES_CHARIZARD)
            TURN { EXPECT_MOVE(opponentLeft, MOVE_EARTHQUAKE); }
        else
            TURN { EXPECT_MOVE(opponentLeft, MOVE_SCRATCH, target: playerLeft); }
    }
}

AI_DOUBLE_BATTLE_TEST("AI recognizes its ally's Telepathy")
{
    ASSUME(GetMoveTarget(MOVE_EARTHQUAKE) == MOVE_TARGET_FOES_AND_ALLY);

    GIVEN {
        ASSUME(GetMoveTarget(MOVE_EARTHQUAKE) == MOVE_TARGET_FOES_AND_ALLY);
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT);
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_PHANPY) { Moves(MOVE_EARTHQUAKE, MOVE_SCRATCH); }
        OPPONENT(SPECIES_ELGYEM) { Level(1); Ability(ABILITY_TELEPATHY); }
    } WHEN {
        TURN { EXPECT_MOVE(opponentLeft, MOVE_EARTHQUAKE); }
    }
}

AI_DOUBLE_BATTLE_TEST("AI will choose Bulldoze if it triggers its ally's ability but will not KO the ally needlessly")
{
    ASSUME(GetMoveTarget(MOVE_BULLDOZE) == MOVE_TARGET_FOES_AND_ALLY);
    ASSUME(GetMoveType(MOVE_BULLDOZE) == TYPE_GROUND);
    ASSUME(MoveHasAdditionalEffect(MOVE_BULLDOZE, MOVE_EFFECT_SPD_MINUS_1));

    u32 species, ability, currentHP;

    PARAMETRIZE { species = SPECIES_KINGAMBIT; ability = ABILITY_DEFIANT;  currentHP = 400; }
    PARAMETRIZE { species = SPECIES_SHUCKLE;   ability = ABILITY_CONTRARY; currentHP = 400; }
    PARAMETRIZE { species = SPECIES_PAWNIARD;  ability = ABILITY_PRESSURE; currentHP = 1; }
    PARAMETRIZE { species = SPECIES_PAWNIARD;  ability = ABILITY_DEFIANT;  currentHP = 1; }
    PARAMETRIZE { species = SPECIES_SHUCKLE;   ability = ABILITY_CONTRARY; currentHP = 1; }

    GIVEN {
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT);
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_PHANPY) { Moves(MOVE_BULLDOZE, MOVE_HIGH_HORSEPOWER); }
        OPPONENT(species) { Moves(MOVE_CELEBRATE, MOVE_POUND); HP(currentHP); Ability(ability); }
    } WHEN {
        if (currentHP != 1)
            TURN { EXPECT_MOVE(opponentLeft, MOVE_BULLDOZE); }
        else
            TURN { EXPECT_MOVE(opponentLeft, MOVE_HIGH_HORSEPOWER); }
    }
}

AI_DOUBLE_BATTLE_TEST("AI will choose Beat Up on an ally with Justified if it will benefit the ally")
{
    ASSUME(GetMoveEffect(MOVE_BEAT_UP) == EFFECT_BEAT_UP);
    ASSUME(GetMoveType(MOVE_BEAT_UP) == TYPE_DARK);

    u32 defAbility, atkAbility, currentHP;

    PARAMETRIZE { defAbility = ABILITY_FLASH_FIRE; atkAbility = ABILITY_SCRAPPY;        currentHP = 400; }
    PARAMETRIZE { defAbility = ABILITY_JUSTIFIED;  atkAbility = ABILITY_SCRAPPY;        currentHP = 400; }
    PARAMETRIZE { defAbility = ABILITY_JUSTIFIED;  atkAbility = ABILITY_MOLD_BREAKER;   currentHP = 400; }
    PARAMETRIZE { defAbility = ABILITY_JUSTIFIED;  atkAbility = ABILITY_SCRAPPY;        currentHP = 1; }

    GIVEN {
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT);
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_CLEFABLE);
        OPPONENT(SPECIES_PANGORO)   { Ability(atkAbility); Moves(MOVE_BEAT_UP); }
        OPPONENT(SPECIES_GROWLITHE) { Moves(MOVE_CELEBRATE, MOVE_TACKLE); HP(currentHP); Ability(defAbility); }
    } WHEN {
        if (!(currentHP == 1) && (defAbility == ABILITY_JUSTIFIED) && (atkAbility != ABILITY_MOLD_BREAKER))
            TURN { EXPECT_MOVE(opponentLeft, MOVE_BEAT_UP, target: opponentRight); }
        else
            TURN { EXPECT_MOVE(opponentLeft, MOVE_BEAT_UP, target: playerLeft); }
    }
}

AI_DOUBLE_BATTLE_TEST("AI will choose Earthquake if partner is not alive")
{
    ASSUME(GetMoveTarget(MOVE_EARTHQUAKE) == MOVE_TARGET_FOES_AND_ALLY);
    ASSUME(GetMoveType(MOVE_EARTHQUAKE) == TYPE_GROUND);

    GIVEN {
        ASSUME(GetMoveTarget(MOVE_EARTHQUAKE) == MOVE_TARGET_FOES_AND_ALLY);
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT);
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET) { Moves(MOVE_EARTHQUAKE, MOVE_SCRATCH); }
        OPPONENT(SPECIES_PIKACHU) { HP(1); Moves(MOVE_CELEBRATE); }
    } WHEN {
        TURN { MOVE(playerLeft, MOVE_SCRATCH, target: opponentRight); }
        TURN { EXPECT_MOVE(opponentLeft, MOVE_EARTHQUAKE); }
    }
}

AI_DOUBLE_BATTLE_TEST("AI will choose Earthquake if it kills one opposing mon and does not kill the partner needlessly")
{
    ASSUME(GetMoveTarget(MOVE_EARTHQUAKE) == MOVE_TARGET_FOES_AND_ALLY);
    ASSUME(GetMoveType(MOVE_EARTHQUAKE) == TYPE_GROUND);

    u32 currentHP;
    PARAMETRIZE { currentHP = 1; }
    PARAMETRIZE { currentHP = 200; }

    GIVEN {
        ASSUME(GetMoveTarget(MOVE_EARTHQUAKE) == MOVE_TARGET_FOES_AND_ALLY);
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT);
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_WOBBUFFET) { HP(1); }
        OPPONENT(SPECIES_WOBBUFFET) { Moves(MOVE_EARTHQUAKE, MOVE_SCRATCH); }
        OPPONENT(SPECIES_PARAS) { Moves(MOVE_CELEBRATE); HP(currentHP); }
    } WHEN {
        if (currentHP == 1)
            TURN { EXPECT_MOVE(opponentLeft, MOVE_SCRATCH); }
        else
            TURN { EXPECT_MOVE(opponentLeft, MOVE_EARTHQUAKE); }
    }
}

AI_DOUBLE_BATTLE_TEST("AI will choose Earthquake if it kills one opposing mon and a partner it believes is about to die")
{
    ASSUME(GetMoveTarget(MOVE_EARTHQUAKE) == MOVE_TARGET_FOES_AND_ALLY);
    ASSUME(GetMoveType(MOVE_EARTHQUAKE) == TYPE_GROUND);

    GIVEN {
        ASSUME(GetMoveTarget(MOVE_EARTHQUAKE) == MOVE_TARGET_FOES_AND_ALLY);
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT | AI_FLAG_OMNISCIENT);
        PLAYER(SPECIES_WOBBUFFET) { Moves(MOVE_CELEBRATE, MOVE_SCRATCH); }
        PLAYER(SPECIES_WOBBUFFET) { HP(1); Moves(MOVE_CELEBRATE, MOVE_SCRATCH); }
        OPPONENT(SPECIES_WOBBUFFET) { Moves(MOVE_EARTHQUAKE, MOVE_SCRATCH); }
        OPPONENT(SPECIES_PARAS) { Moves(MOVE_CELEBRATE); HP(1); }
    } WHEN {
        TURN { MOVE(playerLeft, MOVE_SCRATCH); }
        TURN { MOVE(playerRight, MOVE_SCRATCH); }
        TURN { EXPECT_MOVE(opponentLeft, MOVE_EARTHQUAKE); }
    }
}

AI_DOUBLE_BATTLE_TEST("AI will choose Earthquake if it kills both opposing mons")
{
    ASSUME(GetMoveTarget(MOVE_EARTHQUAKE) == MOVE_TARGET_FOES_AND_ALLY);
    ASSUME(GetMoveType(MOVE_EARTHQUAKE) == TYPE_GROUND);

    GIVEN {
        ASSUME(GetMoveTarget(MOVE_EARTHQUAKE) == MOVE_TARGET_FOES_AND_ALLY);
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT);
        PLAYER(SPECIES_WOBBUFFET) { HP(1); }
        PLAYER(SPECIES_WOBBUFFET) { HP(1); }
        OPPONENT(SPECIES_WOBBUFFET) { Moves(MOVE_EARTHQUAKE, MOVE_SCRATCH); }
        OPPONENT(SPECIES_PARAS) { Moves(MOVE_CELEBRATE); HP(1);  }
    } WHEN {
        TURN { EXPECT_MOVE(opponentLeft, MOVE_EARTHQUAKE); }
    }
}

AI_DOUBLE_BATTLE_TEST("AI will trigger its ally's Weakness Policy")
{
    ASSUME(gItemsInfo[ITEM_WEAKNESS_POLICY].holdEffect == HOLD_EFFECT_WEAKNESS_POLICY);
    ASSUME(GetMoveTarget(MOVE_EARTHQUAKE) == MOVE_TARGET_FOES_AND_ALLY);
    ASSUME(GetMoveType(MOVE_EARTHQUAKE) == TYPE_GROUND);

    u32 species;
    PARAMETRIZE { species = SPECIES_INCINEROAR; }
    PARAMETRIZE { species = SPECIES_CLEFFA; }

    GIVEN {
        ASSUME(GetMoveTarget(MOVE_EARTHQUAKE) == MOVE_TARGET_FOES_AND_ALLY);
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT);
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET) { Moves(MOVE_EARTHQUAKE, MOVE_STOMPING_TANTRUM); }
        OPPONENT(species) { Moves(MOVE_CELEBRATE); Item(ITEM_WEAKNESS_POLICY);  }
    } WHEN {
        if (species == SPECIES_INCINEROAR)
            TURN { EXPECT_MOVE(opponentLeft, MOVE_EARTHQUAKE); }
        else
            TURN { NOT_EXPECT_MOVE(opponentLeft, MOVE_EARTHQUAKE); }
    }
}

AI_DOUBLE_BATTLE_TEST("AI will only explode and kill everything on the field with Risky or Will Suicide")
{
    ASSUME(GetMoveTarget(MOVE_EXPLOSION) == MOVE_TARGET_FOES_AND_ALLY);
    ASSUME(GetMoveEffect(MOVE_EXPLOSION) == EFFECT_EXPLOSION);

    u32 aiFlags;

    PARAMETRIZE { aiFlags = AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT; }
    PARAMETRIZE { aiFlags = AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT | AI_FLAG_RISKY; }
    PARAMETRIZE { aiFlags = AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT | AI_FLAG_WILL_SUICIDE; }

    GIVEN {
        AI_FLAGS(aiFlags);
        PLAYER(SPECIES_WOBBUFFET) { HP(1); }
        PLAYER(SPECIES_WOBBUFFET) { HP(1); }
        OPPONENT(SPECIES_ELECTRODE) { Moves(MOVE_EXPLOSION, MOVE_ELECTRO_BALL); }
        OPPONENT(SPECIES_ELECTRODE) { Moves(MOVE_CELEBRATE); HP(1); }
    } WHEN {
        if (aiFlags == (AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT))
            TURN { EXPECT_MOVE(opponentLeft, MOVE_ELECTRO_BALL); }
        else
            TURN { EXPECT_MOVE(opponentLeft, MOVE_EXPLOSION); }
    }
}

AI_DOUBLE_BATTLE_TEST("AI sees corresponding absorbing abilities on partners")
{
    ASSUME(GetMoveTarget(MOVE_DISCHARGE) == MOVE_TARGET_FOES_AND_ALLY);
    ASSUME(GetMoveType(MOVE_DISCHARGE) == TYPE_ELECTRIC);
    ASSUME(GetMoveTarget(MOVE_LAVA_PLUME) == MOVE_TARGET_FOES_AND_ALLY);
    ASSUME(GetMoveType(MOVE_LAVA_PLUME) == TYPE_FIRE);
    ASSUME(GetMoveTarget(MOVE_SURF) == MOVE_TARGET_FOES_AND_ALLY);
    ASSUME(GetMoveType(MOVE_SURF) == TYPE_WATER);
    ASSUME(GetMoveTarget(MOVE_EARTHQUAKE) == MOVE_TARGET_FOES_AND_ALLY);
    ASSUME(GetMoveType(MOVE_EARTHQUAKE) == TYPE_GROUND);

    u32 ability, move, species;

    PARAMETRIZE { species = SPECIES_PSYDUCK;    ability = ABILITY_CLOUD_NINE;         move = MOVE_DISCHARGE; }
    PARAMETRIZE { species = SPECIES_PIKACHU;    ability = ABILITY_LIGHTNING_ROD;      move = MOVE_DISCHARGE; }
    PARAMETRIZE { species = SPECIES_LANTURN;    ability = ABILITY_VOLT_ABSORB;        move = MOVE_DISCHARGE; }
    PARAMETRIZE { species = SPECIES_EMOLGA;     ability = ABILITY_MOTOR_DRIVE;        move = MOVE_DISCHARGE; }
    PARAMETRIZE { species = SPECIES_SEAKING;    ability = ABILITY_LIGHTNING_ROD;      move = MOVE_DISCHARGE; }
    PARAMETRIZE { species = SPECIES_GROWLITHE;  ability = ABILITY_FLASH_FIRE;         move = MOVE_LAVA_PLUME; }
    PARAMETRIZE { species = SPECIES_DACHSBUN;   ability = ABILITY_WELL_BAKED_BODY;    move = MOVE_LAVA_PLUME; }
    PARAMETRIZE { species = SPECIES_QUAGSIRE;   ability = ABILITY_WATER_ABSORB;       move = MOVE_SURF; }
    PARAMETRIZE { species = SPECIES_SHELLOS;    ability = ABILITY_STORM_DRAIN;        move = MOVE_SURF; }
    PARAMETRIZE { species = SPECIES_UNOWN;      ability = ABILITY_LEVITATE;           move = MOVE_EARTHQUAKE; }
    PARAMETRIZE { species = SPECIES_ORTHWORM;   ability = ABILITY_EARTH_EATER;        move = MOVE_EARTHQUAKE; }

    GIVEN {
        ASSUME(GetMoveTarget(MOVE_DISCHARGE) == MOVE_TARGET_FOES_AND_ALLY);
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT | AI_FLAG_HP_AWARE);
        PLAYER(SPECIES_ZIGZAGOON);
        PLAYER(SPECIES_ZIGZAGOON);
        OPPONENT(SPECIES_SLAKING) { Moves(move, MOVE_SCRATCH); }
        OPPONENT(species) { HP(1); Ability(ability); Moves(MOVE_POUND, MOVE_EMBER, MOVE_ROUND); }
    } WHEN {
        if (ability != ABILITY_CLOUD_NINE)
            TURN { EXPECT_MOVE(opponentLeft, move); }
        else
            TURN { EXPECT_MOVE(opponentLeft, MOVE_SCRATCH); }
    }
}

AI_DOUBLE_BATTLE_TEST("AI knows if redirection abilities provide immunity to allies")
{
    KNOWN_FAILING;
    ASSUME(GetMoveTarget(MOVE_DISCHARGE) == MOVE_TARGET_FOES_AND_ALLY);
    ASSUME(GetMoveType(MOVE_DISCHARGE) == TYPE_ELECTRIC);
    ASSUME(GetMoveTarget(MOVE_SURF) == MOVE_TARGET_FOES_AND_ALLY);
    ASSUME(GetMoveType(MOVE_SURF) == TYPE_WATER);

    u32 ability, move, species, config;

    PARAMETRIZE { species = SPECIES_SEAKING;    ability = ABILITY_LIGHTNING_ROD;    move = MOVE_DISCHARGE;  config = GEN_4; }
    PARAMETRIZE { species = SPECIES_SEAKING;    ability = ABILITY_LIGHTNING_ROD;    move = MOVE_DISCHARGE;  config = GEN_5; }
    PARAMETRIZE { species = SPECIES_SHELLOS;    ability = ABILITY_STORM_DRAIN;      move = MOVE_SURF;       config = GEN_4; }
    PARAMETRIZE { species = SPECIES_SHELLOS;    ability = ABILITY_STORM_DRAIN;      move = MOVE_SURF;       config = GEN_5; }

    GIVEN {
        ASSUME(GetMoveTarget(MOVE_DISCHARGE) == MOVE_TARGET_FOES_AND_ALLY);
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT | AI_FLAG_HP_AWARE);
        WITH_CONFIG(B_REDIRECT_ABILITY_IMMUNITY, config);
        PLAYER(SPECIES_ZIGZAGOON);
        PLAYER(SPECIES_ZIGZAGOON);
        OPPONENT(SPECIES_SLAKING) { Moves(move, MOVE_SCRATCH); }
        OPPONENT(species) { HP(1); Ability(ability); Moves(MOVE_ROUND); }
    } WHEN {
        if (config == GEN_5)
            TURN { EXPECT_MOVE(opponentLeft, move); }
        else
            TURN { EXPECT_MOVE(opponentLeft, MOVE_SCRATCH); }
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
        EXPECT(gAiLogicData->abilities[B_POSITION_PLAYER_RIGHT] == ABILITY_VOLT_ABSORB);
    }
}

AI_DOUBLE_BATTLE_TEST("AI prioritizes Skill Swapping Contrary to allied mons that would benefit from it")
{
    GIVEN {
        ASSUME(GetMoveEffect(MOVE_SKILL_SWAP) == EFFECT_SKILL_SWAP);
        ASSUME(GetMoveAdditionalEffectById(MOVE_OVERHEAT, 0)->moveEffect == MOVE_EFFECT_SP_ATK_MINUS_2);
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_TRY_TO_FAINT | AI_FLAG_CHECK_VIABILITY | AI_FLAG_DOUBLE_BATTLE);
        PLAYER(SPECIES_WOBBUFFET) { Speed(3); }
        PLAYER(SPECIES_WOBBUFFET) { Speed(3); }
        OPPONENT(SPECIES_SPINDA) { Ability(ABILITY_CONTRARY); Speed(5); Moves(MOVE_SKILL_SWAP, MOVE_ENCORE, MOVE_FAKE_TEARS, MOVE_SWAGGER); }
        OPPONENT(SPECIES_ARCANINE) { Ability(ABILITY_INTIMIDATE); Speed(4); Moves (MOVE_OVERHEAT); }
    } WHEN {
        TURN { EXPECT_MOVE(opponentLeft, MOVE_SKILL_SWAP, target:opponentRight); EXPECT_MOVE(opponentRight, MOVE_OVERHEAT); }
    }
}

