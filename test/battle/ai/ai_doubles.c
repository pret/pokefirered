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
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT | AI_FLAG_OMNISCIENT);
        PLAYER(SPECIES_WOBBUFFET) { Moves(MOVE_CELEBRATE, MOVE_SCRATCH, statusMove, MOVE_WATER_GUN); }
        PLAYER(SPECIES_WOBBUFFET) { Moves(MOVE_CELEBRATE, MOVE_SCRATCH, statusMove, MOVE_WATER_GUN); }
        OPPONENT(SPECIES_WOBBUFFET) { Moves(MOVE_HELPING_HAND, MOVE_EXPLOSION); }
        OPPONENT(SPECIES_WOBBUFFET) { Moves(MOVE_SCRATCH, statusMove, MOVE_WATER_GUN); }
    } WHEN {
            TURN {  EXPECT_MOVE(opponentLeft, MOVE_HELPING_HAND);
                    NOT_EXPECT_MOVE(opponentRight, statusMove);
                    SCORE_LT_VAL(opponentRight, statusMove, AI_SCORE_DEFAULT, target:playerLeft);
                    SCORE_LT_VAL(opponentRight, statusMove, AI_SCORE_DEFAULT, target:playerRight);
                    SCORE_LT_VAL(opponentRight, statusMove, AI_SCORE_DEFAULT, target:opponentLeft);
                 }
    } SCENE {
        MESSAGE("The opposing Wobbuffet used Helping Hand!");
    }
}

TO_DO_BATTLE_TEST("AI understands Instruct")

TO_DO_BATTLE_TEST("AI understands Quick Guard")
TO_DO_BATTLE_TEST("AI understands Wide Guard")

AI_DOUBLE_BATTLE_TEST("AI won't use the same nondamaging move as its partner for no reason")
{
    u32 move;
    PARAMETRIZE { move = MOVE_AROMATHERAPY; }
    PARAMETRIZE { move = MOVE_ELECTRIC_TERRAIN; }
    PARAMETRIZE { move = MOVE_FOLLOW_ME; }
    PARAMETRIZE { move = MOVE_GRASSY_TERRAIN; }
    PARAMETRIZE { move = MOVE_GRAVITY; }
    PARAMETRIZE { move = MOVE_HAIL; }
    PARAMETRIZE { move = MOVE_HEAL_BELL; }
    PARAMETRIZE { move = MOVE_LIGHT_SCREEN; }
    PARAMETRIZE { move = MOVE_LUCKY_CHANT; }
    PARAMETRIZE { move = MOVE_MAGIC_ROOM; }
    PARAMETRIZE { move = MOVE_MISTY_TERRAIN; }
    PARAMETRIZE { move = MOVE_MUD_SPORT; }
    PARAMETRIZE { move = MOVE_PSYCHIC_TERRAIN; }
    PARAMETRIZE { move = MOVE_RAIN_DANCE; }
    PARAMETRIZE { move = MOVE_REFLECT; }
    PARAMETRIZE { move = MOVE_SAFEGUARD; }
    PARAMETRIZE { move = MOVE_SANDSTORM; }
    PARAMETRIZE { move = MOVE_SNOWSCAPE; }
    PARAMETRIZE { move = MOVE_SPOTLIGHT; }
    PARAMETRIZE { move = MOVE_STEALTH_ROCK; }
    PARAMETRIZE { move = MOVE_SUNNY_DAY; }
    PARAMETRIZE { move = MOVE_TAILWIND; }
    PARAMETRIZE { move = MOVE_TEETER_DANCE; }
    PARAMETRIZE { move = MOVE_TRICK_ROOM; }
    PARAMETRIZE { move = MOVE_WATER_SPORT; }
    PARAMETRIZE { move = MOVE_COURT_CHANGE; }
    PARAMETRIZE { move = MOVE_PERISH_SONG; }
    PARAMETRIZE { move = MOVE_STICKY_WEB; }
    PARAMETRIZE { move = MOVE_TEATIME; }
    PARAMETRIZE { move = MOVE_WONDER_ROOM; }
    GIVEN {
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE);
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET) { Moves(move, MOVE_TACKLE); Status1(STATUS1_BURN); }
        OPPONENT(SPECIES_WOBBUFFET) { Moves(move, MOVE_TACKLE); }
        OPPONENT(SPECIES_WOBBUFFET) { Moves(move, MOVE_TACKLE); }
        OPPONENT(SPECIES_WOBBUFFET) { Moves(move, MOVE_TACKLE); }
    } WHEN {
        TURN { EXPECT_MOVE(opponentLeft, move); EXPECT_MOVE(opponentRight, MOVE_TACKLE); }
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

    u32 species, currentHP;
    enum Ability ability;

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

    enum Ability defAbility, atkAbility, currentHP;

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

AI_DOUBLE_BATTLE_TEST("AI will only explode and kill everything on the field with Risky or Will Suicide (doubles)")
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

AI_DOUBLE_BATTLE_TEST("Battler 3 has Battler 1 AI flags set correctly (doubles)")
{
    ASSUME(GetMoveTarget(MOVE_EXPLOSION) == MOVE_TARGET_FOES_AND_ALLY);
    ASSUME(GetMoveEffect(MOVE_EXPLOSION) == EFFECT_EXPLOSION);

    u32 aiFlags;
    u32 battler;

    PARAMETRIZE { aiFlags = 0; battler = 1; }
    PARAMETRIZE { aiFlags = 0; battler = 3; }
    PARAMETRIZE { aiFlags = AI_FLAG_RISKY; battler = 3; }
    PARAMETRIZE { aiFlags = AI_FLAG_RISKY; battler = 1; }
    PARAMETRIZE { aiFlags = AI_FLAG_WILL_SUICIDE; battler = 1; }
    PARAMETRIZE { aiFlags = AI_FLAG_WILL_SUICIDE; battler = 3; }

    GIVEN {
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT);
        BATTLER_AI_FLAGS(battler, aiFlags);
        PLAYER(SPECIES_WOBBUFFET) { HP(1); }
        PLAYER(SPECIES_WOBBUFFET) { HP(1); }
        OPPONENT(SPECIES_VOLTORB) { Moves(MOVE_EXPLOSION, MOVE_ELECTRO_BALL); HP(1); }
        OPPONENT(SPECIES_ELECTRODE) { Moves(MOVE_EXPLOSION, MOVE_ELECTRO_BALL); HP(1); }
    } WHEN {
        if (aiFlags == 0 || battler == 3)
            TURN { EXPECT_MOVE(opponentLeft, MOVE_ELECTRO_BALL, target: playerLeft); EXPECT_MOVE(opponentRight, MOVE_ELECTRO_BALL, target: playerLeft); }
        else
            TURN { EXPECT_MOVE(opponentLeft, MOVE_EXPLOSION, target: playerLeft); EXPECT_MOVE(opponentRight, MOVE_EXPLOSION); }
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

    enum Ability ability;
    u32 move, species;

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

AI_DOUBLE_BATTLE_TEST("AI treats an ally's redirection ability appropriately (gen 4)")
{
    KNOWN_FAILING;
    ASSUME(GetMoveTarget(MOVE_DISCHARGE) == MOVE_TARGET_FOES_AND_ALLY);
    ASSUME(GetMoveType(MOVE_DISCHARGE) == TYPE_ELECTRIC);
    ASSUME(GetMoveTarget(MOVE_SURF) == MOVE_TARGET_FOES_AND_ALLY);
    ASSUME(GetMoveType(MOVE_SURF) == TYPE_WATER);

    enum Ability ability;
    u32 move, species;

    PARAMETRIZE { species = SPECIES_SEAKING;    ability = ABILITY_LIGHTNING_ROD;    move = MOVE_DISCHARGE; }
    PARAMETRIZE { species = SPECIES_SHELLOS;    ability = ABILITY_STORM_DRAIN;      move = MOVE_SURF; }

    GIVEN {
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT | AI_FLAG_HP_AWARE);
        WITH_CONFIG(B_REDIRECT_ABILITY_IMMUNITY, GEN_4);
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET) { Moves(move, MOVE_HEADBUTT); }
        OPPONENT(species) { HP(1); Ability(ability); Moves(MOVE_ROUND); }
    } WHEN {
        TURN { EXPECT_MOVE(opponentLeft, MOVE_HEADBUTT); }
    }
}

AI_DOUBLE_BATTLE_TEST("AI treats an ally's redirection ability appropriately (gen 5+)")
{
    ASSUME(GetMoveTarget(MOVE_DISCHARGE) == MOVE_TARGET_FOES_AND_ALLY);
    ASSUME(GetMoveType(MOVE_DISCHARGE) == TYPE_ELECTRIC);
    ASSUME(GetMoveTarget(MOVE_SURF) == MOVE_TARGET_FOES_AND_ALLY);
    ASSUME(GetMoveType(MOVE_SURF) == TYPE_WATER);

    enum Ability ability;
    u32 move, species;

    PARAMETRIZE { species = SPECIES_SEAKING;    ability = ABILITY_LIGHTNING_ROD;    move = MOVE_DISCHARGE; }
    PARAMETRIZE { species = SPECIES_SHELLOS;    ability = ABILITY_STORM_DRAIN;      move = MOVE_SURF; }

    GIVEN {
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT | AI_FLAG_HP_AWARE);
        WITH_CONFIG(B_REDIRECT_ABILITY_IMMUNITY, GEN_5);
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET) { Moves(move, MOVE_HEADBUTT); }
        OPPONENT(species) { HP(1); Ability(ability); Moves(MOVE_ROUND); }
    } WHEN {
        TURN { EXPECT_MOVE(opponentLeft, move); }
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

// Sandstorm is omitted on purpose.
// Tornadus is currently not willing to set up Sandstorm for its ally, but the actual purpose of this test is to demonstrate that Tornadus or Whimsicott will perform standard VGC openers.
// Rain Dance, Sunny Day, and Snowscape are the actually important ones; setting up a good Sandstorm test + functionality is less important and will be done in later PRs.
AI_DOUBLE_BATTLE_TEST("AI sets up weather for its ally")
{
    u32 goodWeather, badWeather, weatherTrigger;
    u64 aiFlags = AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT;

    PARAMETRIZE { goodWeather = MOVE_SUNNY_DAY; badWeather = MOVE_RAIN_DANCE; weatherTrigger = MOVE_SOLAR_BEAM; }
    PARAMETRIZE { goodWeather = MOVE_RAIN_DANCE; badWeather = MOVE_SUNNY_DAY; weatherTrigger = MOVE_THUNDER; }
    PARAMETRIZE { goodWeather = MOVE_HAIL; badWeather = MOVE_SUNNY_DAY; weatherTrigger = MOVE_BLIZZARD; }
    PARAMETRIZE { goodWeather = MOVE_SNOWSCAPE; badWeather = MOVE_SUNNY_DAY; weatherTrigger = MOVE_BLIZZARD; }
    PARAMETRIZE { goodWeather = MOVE_SANDSTORM; badWeather = MOVE_SUNNY_DAY; weatherTrigger = MOVE_SHORE_UP; }
    PARAMETRIZE { aiFlags |= AI_FLAG_OMNISCIENT | AI_FLAG_SMART_SWITCHING | AI_FLAG_SMART_MON_CHOICES | AI_FLAG_PP_STALL_PREVENTION;
                  goodWeather = MOVE_SUNNY_DAY; badWeather = MOVE_RAIN_DANCE; weatherTrigger = MOVE_SOLAR_BEAM; }
    PARAMETRIZE { aiFlags |= AI_FLAG_OMNISCIENT | AI_FLAG_SMART_SWITCHING | AI_FLAG_SMART_MON_CHOICES | AI_FLAG_PP_STALL_PREVENTION;
                  goodWeather = MOVE_RAIN_DANCE; badWeather = MOVE_SUNNY_DAY; weatherTrigger = MOVE_THUNDER; }
    PARAMETRIZE { aiFlags |= AI_FLAG_OMNISCIENT | AI_FLAG_SMART_SWITCHING | AI_FLAG_SMART_MON_CHOICES | AI_FLAG_PP_STALL_PREVENTION;
                  goodWeather = MOVE_HAIL; badWeather = MOVE_SUNNY_DAY; weatherTrigger = MOVE_BLIZZARD; }
    PARAMETRIZE { aiFlags |= AI_FLAG_OMNISCIENT | AI_FLAG_SMART_SWITCHING | AI_FLAG_SMART_MON_CHOICES | AI_FLAG_PP_STALL_PREVENTION;
                  goodWeather = MOVE_SNOWSCAPE; badWeather = MOVE_SUNNY_DAY; weatherTrigger = MOVE_BLIZZARD; }
    PARAMETRIZE { aiFlags |= AI_FLAG_OMNISCIENT | AI_FLAG_SMART_SWITCHING | AI_FLAG_SMART_MON_CHOICES | AI_FLAG_PP_STALL_PREVENTION;
                  goodWeather = MOVE_SANDSTORM; badWeather = MOVE_SUNNY_DAY; weatherTrigger = MOVE_SHORE_UP; }

    GIVEN {
        AI_FLAGS(aiFlags);
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_TORNADUS) { Item(ITEM_SAFETY_GOGGLES); Ability(ABILITY_PRANKSTER); Moves(goodWeather, badWeather, MOVE_RETURN, MOVE_TAUNT); }
        OPPONENT(SPECIES_WOBBUFFET) { Item(ITEM_SAFETY_GOGGLES); Moves(weatherTrigger, MOVE_EARTH_POWER); }
    } WHEN {
        TURN { EXPECT_MOVE(opponentLeft, goodWeather); }
    }
}

AI_DOUBLE_BATTLE_TEST("AI sets up terrain for its ally")
{
    u32 goodTerrain, badTerrain, terrainTrigger;
    u64 aiFlags = AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT;

    PARAMETRIZE { goodTerrain = MOVE_ELECTRIC_TERRAIN; badTerrain = MOVE_PSYCHIC_TERRAIN; terrainTrigger = MOVE_RISING_VOLTAGE; }
    PARAMETRIZE { goodTerrain = MOVE_GRASSY_TERRAIN; badTerrain = MOVE_PSYCHIC_TERRAIN; terrainTrigger = MOVE_GRASSY_GLIDE; }
    PARAMETRIZE { goodTerrain = MOVE_MISTY_TERRAIN; badTerrain = MOVE_PSYCHIC_TERRAIN; terrainTrigger = MOVE_MISTY_EXPLOSION; }
    PARAMETRIZE { goodTerrain = MOVE_PSYCHIC_TERRAIN; badTerrain = MOVE_ELECTRIC_TERRAIN; terrainTrigger = MOVE_EXPANDING_FORCE; }
    PARAMETRIZE { aiFlags |= AI_FLAG_OMNISCIENT | AI_FLAG_SMART_SWITCHING | AI_FLAG_SMART_MON_CHOICES | AI_FLAG_PP_STALL_PREVENTION;
                  goodTerrain = MOVE_ELECTRIC_TERRAIN; badTerrain = MOVE_PSYCHIC_TERRAIN; terrainTrigger = MOVE_RISING_VOLTAGE; }
    PARAMETRIZE { aiFlags |= AI_FLAG_OMNISCIENT | AI_FLAG_SMART_SWITCHING | AI_FLAG_SMART_MON_CHOICES | AI_FLAG_PP_STALL_PREVENTION;
                  goodTerrain = MOVE_GRASSY_TERRAIN; badTerrain = MOVE_PSYCHIC_TERRAIN; terrainTrigger = MOVE_GRASSY_GLIDE; }
    PARAMETRIZE { aiFlags |= AI_FLAG_OMNISCIENT | AI_FLAG_SMART_SWITCHING | AI_FLAG_SMART_MON_CHOICES | AI_FLAG_PP_STALL_PREVENTION;
                  goodTerrain = MOVE_MISTY_TERRAIN; badTerrain = MOVE_PSYCHIC_TERRAIN; terrainTrigger = MOVE_MISTY_EXPLOSION; }
    PARAMETRIZE { aiFlags |= AI_FLAG_OMNISCIENT | AI_FLAG_SMART_SWITCHING | AI_FLAG_SMART_MON_CHOICES | AI_FLAG_PP_STALL_PREVENTION;
                  goodTerrain = MOVE_PSYCHIC_TERRAIN; badTerrain = MOVE_ELECTRIC_TERRAIN; terrainTrigger = MOVE_EXPANDING_FORCE; }

    GIVEN {
        AI_FLAGS(aiFlags);
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET) { Moves(goodTerrain, badTerrain, MOVE_RETURN, MOVE_TAUNT); }
        OPPONENT(SPECIES_WOBBUFFET) { Moves(terrainTrigger, MOVE_EARTH_POWER);  }
    } WHEN {
        TURN { EXPECT_MOVE(opponentLeft, goodTerrain); }
    }
}

AI_DOUBLE_BATTLE_TEST("AI uses After You to set up Trick Room")
{
    u32 move;

    PARAMETRIZE { move = MOVE_TRICK_ROOM; }
    PARAMETRIZE { move = MOVE_MOONBLAST; }

    GIVEN {
        ASSUME(GetMoveEffect(MOVE_AFTER_YOU) == EFFECT_AFTER_YOU);
        ASSUME(GetMoveEffect(MOVE_TRICK_ROOM) == EFFECT_TRICK_ROOM);
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_TRY_TO_FAINT | AI_FLAG_CHECK_VIABILITY | AI_FLAG_DOUBLE_BATTLE);
        PLAYER(SPECIES_WOBBUFFET) { Speed(4); }
        PLAYER(SPECIES_WOBBUFFET) { Speed(4); }
        OPPONENT(SPECIES_COMFEY) { Ability(ABILITY_TRIAGE); Speed(5); Moves(MOVE_AFTER_YOU, MOVE_DRAINING_KISS); }
        OPPONENT(SPECIES_CLEFAIRY) { Speed(3); Moves(move, MOVE_PSYCHIC); }
    } WHEN {
        if (move == MOVE_TRICK_ROOM)
            TURN { EXPECT_MOVE(opponentLeft, MOVE_AFTER_YOU, target:opponentRight); EXPECT_MOVE(opponentRight, MOVE_TRICK_ROOM); }
        else
            TURN { NOT_EXPECT_MOVE(opponentLeft, MOVE_AFTER_YOU); }
    }
}

AI_DOUBLE_BATTLE_TEST("AI uses Trick Room intelligently")
{
    u32 move, ability, speed;

    PARAMETRIZE { move = MOVE_DRAINING_KISS; ability = ABILITY_SYNCHRONIZE; speed = 4; }
    PARAMETRIZE { move = MOVE_DAZZLING_GLEAM; ability = ABILITY_SYNCHRONIZE; speed = 4; }
    PARAMETRIZE { move = MOVE_DRAINING_KISS; ability = ABILITY_PSYCHIC_SURGE; speed = 4; }
    PARAMETRIZE { move = MOVE_DRAINING_KISS; ability = ABILITY_SYNCHRONIZE; speed = 2; }
    PARAMETRIZE { move = MOVE_DAZZLING_GLEAM; ability = ABILITY_SYNCHRONIZE; speed = 2; }
    PARAMETRIZE { move = MOVE_DRAINING_KISS; ability = ABILITY_PSYCHIC_SURGE; speed = 2; }

    GIVEN {
        ASSUME(GetMoveEffect(MOVE_AFTER_YOU) == EFFECT_AFTER_YOU);
        ASSUME(GetMoveEffect(MOVE_TRICK_ROOM) == EFFECT_TRICK_ROOM);
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_TRY_TO_FAINT | AI_FLAG_CHECK_VIABILITY | AI_FLAG_DOUBLE_BATTLE);
        PLAYER(SPECIES_WOBBUFFET) { Speed(4); }
        PLAYER(SPECIES_WOBBUFFET) { Speed(speed); }
        OPPONENT(SPECIES_COMFEY) { Ability(ABILITY_TRIAGE); Speed(5); Moves(move); }
        OPPONENT(SPECIES_INDEEDEE) { Ability(ability); Speed(3); Moves(MOVE_TRICK_ROOM, MOVE_PSYCHIC); }
    } WHEN {
        if (move == MOVE_DRAINING_KISS && ability != ABILITY_PSYCHIC_SURGE && speed > 3)
            TURN { EXPECT_MOVE(opponentRight, MOVE_TRICK_ROOM); }
        else
            TURN { NOT_EXPECT_MOVE(opponentRight, MOVE_TRICK_ROOM); }
    }
}

AI_DOUBLE_BATTLE_TEST("AI uses Trick Room with both battlers on the turn it expires in line with the double Trick Room config")
{
    PASSES_RANDOMLY(DOUBLE_TRICK_ROOM_ON_LAST_TURN_CHANCE, 100, RNG_AI_REFRESH_TRICK_ROOM_ON_LAST_TURN);
    GIVEN {
        ASSUME(GetMoveEffect(MOVE_TRICK_ROOM) == EFFECT_TRICK_ROOM);
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_TRY_TO_FAINT | AI_FLAG_CHECK_VIABILITY | AI_FLAG_DOUBLE_BATTLE);
        PLAYER(SPECIES_WOBBUFFET) { Speed(4); }
        PLAYER(SPECIES_WOBBUFFET) { Speed(3); }
        OPPONENT(SPECIES_WYNAUT) { Moves(MOVE_TRICK_ROOM, MOVE_PSYCHIC); Speed(2); }
        OPPONENT(SPECIES_WOBBUFFET) { Moves(MOVE_TRICK_ROOM, MOVE_PSYCHIC); Speed(1); }
    } WHEN {
            TURN {  EXPECT_MOVE(opponentLeft, MOVE_TRICK_ROOM); NOT_EXPECT_MOVE(opponentRight, MOVE_TRICK_ROOM); }
            TURN {  NOT_EXPECT_MOVE(opponentLeft, MOVE_TRICK_ROOM); NOT_EXPECT_MOVE(opponentRight, MOVE_TRICK_ROOM); }
            TURN {  NOT_EXPECT_MOVE(opponentLeft, MOVE_TRICK_ROOM); NOT_EXPECT_MOVE(opponentRight, MOVE_TRICK_ROOM); }
            TURN {  NOT_EXPECT_MOVE(opponentLeft, MOVE_TRICK_ROOM); NOT_EXPECT_MOVE(opponentRight, MOVE_TRICK_ROOM); }
            TURN {  EXPECT_MOVE(opponentLeft, MOVE_TRICK_ROOM); EXPECT_MOVE(opponentRight, MOVE_TRICK_ROOM); }
        }
}

AI_DOUBLE_BATTLE_TEST("AI uses Helping Hand if it's about to die")
{
    u32 hp;

    PARAMETRIZE { hp = 1; }
    PARAMETRIZE { hp = 500; }

    GIVEN {
        ASSUME(GetMoveEffect(MOVE_HELPING_HAND) == EFFECT_HELPING_HAND);
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_TRY_TO_FAINT | AI_FLAG_CHECK_VIABILITY | AI_FLAG_OMNISCIENT);
        PLAYER(SPECIES_WOBBUFFET) { Moves(MOVE_TACKLE, MOVE_CELEBRATE); }
        PLAYER(SPECIES_WOBBUFFET) { Moves(MOVE_TACKLE, MOVE_CELEBRATE); }
        OPPONENT(SPECIES_WOBBUFFET) { HP(hp); Moves(MOVE_HELPING_HAND, MOVE_MUDDY_WATER); }
        OPPONENT(SPECIES_WOBBUFFET) { Moves(MOVE_MUDDY_WATER); }
    } WHEN {
    if (hp == 1)
        TURN { EXPECT_MOVE(opponentLeft, MOVE_HELPING_HAND); }
    else
        TURN { NOT_EXPECT_MOVE(opponentLeft, MOVE_HELPING_HAND); }
    }
}

AI_DOUBLE_BATTLE_TEST("AI uses Helping Hand if the ally does notably more damage")
{

    KNOWN_FAILING;  // Failure was masked by test runner issues
    GIVEN {
        ASSUME(GetMoveEffect(MOVE_HELPING_HAND) == EFFECT_HELPING_HAND);
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_TRY_TO_FAINT | AI_FLAG_CHECK_VIABILITY | AI_FLAG_OMNISCIENT);
        PLAYER(SPECIES_WOBBUFFET) { Moves(MOVE_TACKLE, MOVE_CELEBRATE); }
        PLAYER(SPECIES_WOBBUFFET) { Moves(MOVE_TACKLE, MOVE_CELEBRATE); }
        OPPONENT(SPECIES_WOBBUFFET) { Moves(MOVE_HELPING_HAND, MOVE_MUD_SLAP); }
        OPPONENT(SPECIES_WOBBUFFET) { Moves(MOVE_MUDDY_WATER); }
    } WHEN {
        TURN { EXPECT_MOVE(opponentLeft, MOVE_HELPING_HAND); }
    }
}

AI_DOUBLE_BATTLE_TEST("AI uses Tailwind")
{
    u32 speed1, speed2, speed3, speed4;

    PARAMETRIZE { speed1 = 20; speed2 = 20; speed3 = 20; speed4 = 20; }
    PARAMETRIZE { speed1 = 20; speed2 = 20; speed3 =  5; speed4 =  5; }
    PARAMETRIZE { speed1 = 20; speed2 = 20; speed3 = 15; speed4 = 15; }
    PARAMETRIZE { speed1 =  1; speed2 =  1; speed3 =  5; speed4 =  5; }
    PARAMETRIZE { speed1 =  1; speed2 = 20; speed3 = 15; speed4 = 15; }
    PARAMETRIZE { speed1 =  1; speed2 = 20; speed3 = 20; speed4 = 15; }

    GIVEN {
        ASSUME(GetMoveEffect(MOVE_AFTER_YOU) == EFFECT_AFTER_YOU);
        ASSUME(GetMoveEffect(MOVE_TRICK_ROOM) == EFFECT_TRICK_ROOM);
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_TRY_TO_FAINT | AI_FLAG_CHECK_VIABILITY | AI_FLAG_DOUBLE_BATTLE);
        PLAYER(SPECIES_WOBBUFFET) { Speed(speed1); }
        PLAYER(SPECIES_WOBBUFFET) { Speed(speed2); }
        OPPONENT(SPECIES_WOBBUFFET) { Speed(speed3); Moves(MOVE_TAILWIND, MOVE_HEADBUTT); }
        OPPONENT(SPECIES_WOBBUFFET) { Speed(speed4); Moves(MOVE_TAILWIND, MOVE_HEADBUTT); }
    } WHEN {
        if (speed3 > 10)
            TURN { EXPECT_MOVE(opponentLeft, MOVE_TAILWIND); }
        else
            TURN { NOT_EXPECT_MOVE(opponentLeft, MOVE_TAILWIND); }
    }
}

AI_DOUBLE_BATTLE_TEST("AI uses Guard Split to improve its stats")
{

    u32 player, opponent;

    PARAMETRIZE { player = SPECIES_SHUCKLE; opponent = SPECIES_PHEROMOSA; }
    PARAMETRIZE { player = SPECIES_PHEROMOSA; opponent = SPECIES_SHUCKLE; }

    GIVEN {
        ASSUME(GetMoveEffect(MOVE_GUARD_SPLIT) == EFFECT_GUARD_SPLIT);
        ASSUME(gSpeciesInfo[SPECIES_PHEROMOSA].baseDefense < gSpeciesInfo[SPECIES_WOBBUFFET].baseDefense);
        ASSUME(gSpeciesInfo[SPECIES_WOBBUFFET].baseDefense < gSpeciesInfo[SPECIES_SHUCKLE].baseDefense);
        ASSUME(gSpeciesInfo[SPECIES_PHEROMOSA].baseSpDefense < gSpeciesInfo[SPECIES_WOBBUFFET].baseSpDefense);
        ASSUME(gSpeciesInfo[SPECIES_WOBBUFFET].baseSpDefense < gSpeciesInfo[SPECIES_SHUCKLE].baseSpDefense);
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_TRY_TO_FAINT | AI_FLAG_CHECK_VIABILITY | AI_FLAG_DOUBLE_BATTLE);
        PLAYER(player);
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET) { Moves(MOVE_GUARD_SPLIT, MOVE_NIGHT_SHADE); }
        OPPONENT(opponent);
    } WHEN {
        if (player == SPECIES_SHUCKLE)
            TURN { EXPECT_MOVE(opponentLeft, MOVE_GUARD_SPLIT, target:playerLeft); }
        else
            TURN { EXPECT_MOVE(opponentLeft, MOVE_GUARD_SPLIT, target:opponentRight); }
    }
}

AI_DOUBLE_BATTLE_TEST("AI uses Power Split to improve its stats")
{

    u32 player, opponent;

    PARAMETRIZE { player = SPECIES_SHUCKLE; opponent = SPECIES_PHEROMOSA; }
    PARAMETRIZE { player = SPECIES_PHEROMOSA; opponent = SPECIES_SHUCKLE; }

    GIVEN {
        ASSUME(GetMoveEffect(MOVE_POWER_SPLIT) == EFFECT_POWER_SPLIT);
        ASSUME(gSpeciesInfo[SPECIES_PHEROMOSA].baseAttack > gSpeciesInfo[SPECIES_WOBBUFFET].baseAttack);
        ASSUME(gSpeciesInfo[SPECIES_WOBBUFFET].baseAttack > gSpeciesInfo[SPECIES_SHUCKLE].baseAttack);
        ASSUME(gSpeciesInfo[SPECIES_PHEROMOSA].baseSpAttack > gSpeciesInfo[SPECIES_WOBBUFFET].baseSpAttack);
        ASSUME(gSpeciesInfo[SPECIES_WOBBUFFET].baseSpAttack > gSpeciesInfo[SPECIES_SHUCKLE].baseSpAttack);
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_TRY_TO_FAINT | AI_FLAG_CHECK_VIABILITY | AI_FLAG_DOUBLE_BATTLE);
        PLAYER(player);
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET) { Moves(MOVE_POWER_SPLIT, MOVE_TACKLE, MOVE_ROUND); }
        OPPONENT(opponent) { Moves(MOVE_TACKLE, MOVE_ROUND); }
    } WHEN {
        if (player == SPECIES_PHEROMOSA)
            TURN { EXPECT_MOVE(opponentLeft, MOVE_POWER_SPLIT, target:playerLeft); }
        else
            TURN { EXPECT_MOVE(opponentLeft, MOVE_POWER_SPLIT, target:opponentRight); }
    }
}

AI_DOUBLE_BATTLE_TEST("AI prefers to Fake Out the opponent vulnerable to flinching.")
{

    GIVEN {
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_TRY_TO_FAINT | AI_FLAG_CHECK_VIABILITY | AI_FLAG_DOUBLE_BATTLE | AI_FLAG_OMNISCIENT);
        PLAYER(SPECIES_ZUBAT) { Ability(ABILITY_INNER_FOCUS); }
        PLAYER(SPECIES_BRAIXEN) { Ability(ABILITY_BLAZE); }
        OPPONENT(SPECIES_WOBBUFFET) { Moves(MOVE_FAKE_OUT, MOVE_BRANCH_POKE, MOVE_ROCK_SMASH); }
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { EXPECT_MOVE(opponentLeft, MOVE_FAKE_OUT, target:playerRight); }
    }
}
