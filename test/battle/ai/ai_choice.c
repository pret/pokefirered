#include "global.h"
#include "test/battle.h"

ASSUMPTIONS
{
    ASSUME(gItemsInfo[ITEM_CHOICE_SPECS].holdEffect == HOLD_EFFECT_CHOICE_SPECS);
    ASSUME(gItemsInfo[ITEM_CHOICE_BAND].holdEffect == HOLD_EFFECT_CHOICE_BAND);
    ASSUME(gItemsInfo[ITEM_CHOICE_SCARF].holdEffect == HOLD_EFFECT_CHOICE_SCARF);
}

AI_SINGLE_BATTLE_TEST("Choiced Pokémon switch out after using a status move once")
{
    u32 j, ability = ABILITY_NONE, heldItem = ITEM_NONE;

    static const u32 choiceItems[] = {
        ITEM_CHOICE_SPECS,
        ITEM_CHOICE_BAND,
        ITEM_CHOICE_SCARF,
    };

    for (j = 0; j < ARRAY_COUNT(choiceItems); j++)
    {
        PARAMETRIZE { ability = ABILITY_NONE;    heldItem = choiceItems[j]; }
        PARAMETRIZE { ability = ABILITY_KLUTZ;   heldItem = choiceItems[j]; }
    }

    PASSES_RANDOMLY(SHOULD_SWITCH_CHOICE_LOCKED_PERCENTAGE, 100, RNG_AI_SWITCH_CHOICE_LOCKED);

    GIVEN {
        ASSUME(GetMoveCategory(MOVE_YAWN) == DAMAGE_CATEGORY_STATUS);
        ASSUME(GetMoveEffect(MOVE_YAWN) == EFFECT_YAWN);
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT);
        PLAYER(SPECIES_RHYDON)
        OPPONENT(SPECIES_LOPUNNY) { Moves(MOVE_YAWN, MOVE_SCRATCH); Item(heldItem); Ability(ability); }
        OPPONENT(SPECIES_SWAMPERT) { Moves(MOVE_WATERFALL); }
    } WHEN {
        TURN { EXPECT_MOVE(opponent, MOVE_YAWN); }
        if (ability == ABILITY_KLUTZ) { // Klutz ignores item
            TURN { EXPECT_MOVE(opponent, MOVE_SCRATCH); }
        }
        else {
            TURN { EXPECT_SWITCH(opponent, 1); }
        }
    }
}

AI_SINGLE_BATTLE_TEST("Choiced Pokémon only consider their own status moves when determining if they should switch")
{
    GIVEN 
    {
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_TRY_TO_FAINT | AI_FLAG_CHECK_VIABILITY | AI_FLAG_RISKY | AI_FLAG_SMART_SWITCHING | AI_FLAG_OMNISCIENT | AI_FLAG_SMART_MON_CHOICES);
        PLAYER(SPECIES_ZIGZAGOON) { Speed(4); Moves(MOVE_TAIL_WHIP, MOVE_SCRATCH); }
        OPPONENT(SPECIES_ZIGZAGOON) { Speed(5); Moves(MOVE_SCRATCH); Item(ITEM_CHOICE_BAND); }
        OPPONENT(SPECIES_ZIGZAGOON) { Speed(5); Moves(MOVE_SCRATCH); }
    } WHEN {
        TURN { EXPECT_MOVE(opponent, MOVE_SCRATCH); MOVE(player, MOVE_TAIL_WHIP); }
        TURN { EXPECT_MOVE(opponent, MOVE_SCRATCH); MOVE(player, MOVE_TAIL_WHIP); }
    }
}

AI_SINGLE_BATTLE_TEST("Choiced Pokémon won't use stat boosting moves")
{
    // Moves defined by MOVE_TARGET_USER (with exceptions?)
    u32 j, ability = ABILITY_NONE, heldItem = ITEM_NONE;

    static const u32 choiceItems[] = {
        ITEM_CHOICE_SPECS,
        ITEM_CHOICE_BAND,
        ITEM_CHOICE_SCARF,
    };

    for (j = 0; j < ARRAY_COUNT(choiceItems); j++)
    {
        PARAMETRIZE { ability = ABILITY_NONE;    heldItem = choiceItems[j]; }
        PARAMETRIZE { ability = ABILITY_KLUTZ;   heldItem = choiceItems[j]; }
    }

    GIVEN {
        ASSUME(GetMoveTarget(MOVE_SWORDS_DANCE) == MOVE_TARGET_USER);
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT);
        PLAYER(SPECIES_RHYDON)
        OPPONENT(SPECIES_LOPUNNY) { Moves(MOVE_SWORDS_DANCE, MOVE_SCRATCH); Item(heldItem); Ability(ability); }
        OPPONENT(SPECIES_SWAMPERT) { Moves(MOVE_WATERFALL); }
    } WHEN {
        if (ability == ABILITY_KLUTZ) { // Klutz ignores item
            TURN { EXPECT_MOVE(opponent, MOVE_SWORDS_DANCE); }
        }
        else {
            TURN { EXPECT_MOVE(opponent, MOVE_SCRATCH); }
        }
    }
}

AI_SINGLE_BATTLE_TEST("Choiced Pokémon won't use status move if they are the only party member")
{
    u32 j, ability = ABILITY_NONE, isAlive = 0, heldItem = ITEM_NONE;

    static const u32 choiceItems[] = {
        ITEM_CHOICE_SPECS,
        ITEM_CHOICE_BAND,
        ITEM_CHOICE_SCARF,
    };

    for (j = 0; j < ARRAY_COUNT(choiceItems); j++)
    {
        PARAMETRIZE { ability = ABILITY_NONE;    heldItem = choiceItems[j]; isAlive = 0; }
        PARAMETRIZE { ability = ABILITY_KLUTZ;   heldItem = choiceItems[j]; isAlive = 0; }
        PARAMETRIZE { ability = ABILITY_NONE;    heldItem = choiceItems[j]; isAlive = 1; }
        PARAMETRIZE { ability = ABILITY_KLUTZ;   heldItem = choiceItems[j]; isAlive = 1; }
    }

    GIVEN {
        ASSUME(GetMoveCategory(MOVE_YAWN) == DAMAGE_CATEGORY_STATUS);
        ASSUME(GetMoveEffect(MOVE_YAWN) == EFFECT_YAWN);
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT);
        PLAYER(SPECIES_RHYDON)
        OPPONENT(SPECIES_LOPUNNY) { Moves(MOVE_YAWN, MOVE_SCRATCH); Item(heldItem); Ability(ability); }
        OPPONENT(SPECIES_SWAMPERT) { HP(isAlive); Moves(MOVE_WATERFALL); }
    } WHEN {
        if (isAlive == 1 || ability == ABILITY_KLUTZ) {
            TURN { EXPECT_MOVE(opponent, MOVE_YAWN); }
        }
        else {
            TURN { EXPECT_MOVE(opponent, MOVE_SCRATCH); }
        }
    }
}

AI_SINGLE_BATTLE_TEST("Choiced Pokémon won't use status move if they don't have a good switchin")
{
    u32 j, ability = ABILITY_NONE, move = MOVE_NONE, species = SPECIES_NONE, heldItem = ITEM_NONE;

    static const u32 choiceItems[] = {
        ITEM_CHOICE_SPECS,
        ITEM_CHOICE_BAND,
        ITEM_CHOICE_SCARF,
    };

    for (j = 0; j < ARRAY_COUNT(choiceItems); j++)
    {
        PARAMETRIZE { ability = ABILITY_NONE;    heldItem = choiceItems[j]; species = SPECIES_SWAMPERT; move = MOVE_WATERFALL; }
        PARAMETRIZE { ability = ABILITY_KLUTZ;   heldItem = choiceItems[j]; species = SPECIES_SWAMPERT; move = MOVE_WATERFALL; }
        PARAMETRIZE { ability = ABILITY_NONE;    heldItem = choiceItems[j]; species = SPECIES_ELEKID; move = MOVE_THUNDER_WAVE; }
        PARAMETRIZE { ability = ABILITY_KLUTZ;   heldItem = choiceItems[j]; species = SPECIES_ELEKID; move = MOVE_THUNDER_WAVE; }
    }

    GIVEN {
        ASSUME(GetMoveCategory(MOVE_YAWN) == DAMAGE_CATEGORY_STATUS);
        ASSUME(GetMoveEffect(MOVE_YAWN) == EFFECT_YAWN);
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT);
        PLAYER(SPECIES_RHYDON)
        OPPONENT(SPECIES_LOPUNNY) { Moves(MOVE_YAWN, MOVE_SCRATCH); Item(heldItem); Ability(ability); }
        OPPONENT(species) { Moves(move); }
    } WHEN {
        if (species == SPECIES_SWAMPERT || ability == ABILITY_KLUTZ) {
            TURN { EXPECT_MOVE(opponent, MOVE_YAWN); }
        }
        else {
            TURN { EXPECT_MOVE(opponent, MOVE_SCRATCH); }
        }
    }
}

AI_SINGLE_BATTLE_TEST("Choiced Pokémon won't use status move if they are trapped")
{
    u32 j, aiAbility = ABILITY_NONE, playerAbility = MOVE_NONE, species = SPECIES_NONE, heldItem = ITEM_NONE;

    static const u32 choiceItems[] = {
        ITEM_CHOICE_SPECS,
        ITEM_CHOICE_BAND,
        ITEM_CHOICE_SCARF,
    };

    for (j = 0; j < ARRAY_COUNT(choiceItems); j++)
    {
        PARAMETRIZE { aiAbility = ABILITY_NONE;    heldItem = choiceItems[j]; species = SPECIES_RHYDON; playerAbility = ABILITY_LIGHTNING_ROD; }
        PARAMETRIZE { aiAbility = ABILITY_KLUTZ;   heldItem = choiceItems[j]; species = SPECIES_RHYDON; playerAbility = ABILITY_LIGHTNING_ROD; }
        PARAMETRIZE { aiAbility = ABILITY_NONE;    heldItem = choiceItems[j]; species = SPECIES_DUGTRIO; playerAbility = ABILITY_ARENA_TRAP; }
        PARAMETRIZE { aiAbility = ABILITY_KLUTZ;   heldItem = choiceItems[j]; species = SPECIES_DUGTRIO; playerAbility = ABILITY_ARENA_TRAP; }
    }

    GIVEN {
        ASSUME(GetMoveCategory(MOVE_YAWN) == DAMAGE_CATEGORY_STATUS);
        ASSUME(GetMoveEffect(MOVE_YAWN) == EFFECT_YAWN);
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT);
        PLAYER(species) { Ability(playerAbility); }
        OPPONENT(SPECIES_LOPUNNY) { Moves(MOVE_YAWN, MOVE_SCRATCH); Item(heldItem); Ability(aiAbility); }
        OPPONENT(SPECIES_SWAMPERT) { Moves(MOVE_WATERFALL); }
    } WHEN {
        if (playerAbility != ABILITY_ARENA_TRAP || aiAbility == ABILITY_KLUTZ) {
            TURN { EXPECT_MOVE(opponent, MOVE_YAWN); }
        }
        else {
            TURN { EXPECT_MOVE(opponent, MOVE_SCRATCH); }
        }
    }
}

AI_SINGLE_BATTLE_TEST("Choiced Pokémon will switch if locked into a move the player is immune to")
{
    GIVEN {
        ASSUME(gSpeciesInfo[SPECIES_GASTLY].types[0] == TYPE_GHOST);
        ASSUME(GetMoveType(MOVE_SURF) == TYPE_WATER);
        ASSUME(GetMoveType(MOVE_BODY_SLAM) == TYPE_NORMAL);
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT | AI_FLAG_OMNISCIENT);
        PLAYER(SPECIES_GASTLY) { Level(1); Moves(MOVE_CELEBRATE); }
        PLAYER(SPECIES_VAPOREON) { Ability(ABILITY_WATER_ABSORB); Moves(MOVE_SURF); }
        OPPONENT(SPECIES_ZIGZAGOON) { Item(ITEM_CHOICE_BAND); Moves(MOVE_SURF, MOVE_BODY_SLAM); }
        OPPONENT(SPECIES_ZIGZAGOON) { Item(ITEM_CHOICE_BAND); Moves(MOVE_SURF, MOVE_BODY_SLAM); }
    } WHEN {
        TURN { MOVE(player, MOVE_CELEBRATE); EXPECT_MOVE(opponent, MOVE_SURF); SEND_OUT(player, 1); }
        TURN { MOVE(player, MOVE_SURF); EXPECT_SWITCH(opponent, 1); }
    }
}

AI_SINGLE_BATTLE_TEST("Choiced Pokémon will only see choiced moves when considering switching with ShouldSwitchIfHasBadOdds")
{
    PASSES_RANDOMLY(SHOULD_SWITCH_HASBADODDS_PERCENTAGE, 100, RNG_AI_SWITCH_HASBADODDS);
    GIVEN {
        ASSUME(gSpeciesInfo[SPECIES_GASTLY].types[0] == TYPE_GHOST);
        ASSUME(GetMoveType(MOVE_SURF) == TYPE_WATER);
        ASSUME(GetMoveType(MOVE_BODY_SLAM) == TYPE_NORMAL);
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT | AI_FLAG_OMNISCIENT | AI_FLAG_SMART_SWITCHING | AI_FLAG_SMART_MON_CHOICES);
        PLAYER(SPECIES_GASTLY) { Level(1); Moves(MOVE_CELEBRATE); }
        PLAYER(SPECIES_ZIGZAGOON) { Item(ITEM_CHOICE_BAND); Moves(MOVE_CLOSE_COMBAT); }
        OPPONENT(SPECIES_ZIGZAGOON) { Item(ITEM_CHOICE_BAND); Moves(MOVE_SURF, MOVE_CLOSE_COMBAT); }
        OPPONENT(SPECIES_BRONZONG) { Moves(MOVE_CLOSE_COMBAT); }
    } WHEN {
        TURN { MOVE(player, MOVE_CELEBRATE); EXPECT_MOVE(opponent, MOVE_SURF); SEND_OUT(player, 1); }
        TURN { MOVE(player, MOVE_CLOSE_COMBAT); EXPECT_SWITCH(opponent, 1); }
    }
}

AI_SINGLE_BATTLE_TEST("Choiced Pokémon will only see choiced moves when considering switching with FindMonThatAbsorbsMove")
{
    PASSES_RANDOMLY(SHOULD_SWITCH_ABSORBS_MOVE_PERCENTAGE, 100, RNG_AI_SWITCH_ABSORBING);
    GIVEN {
        ASSUME(gSpeciesInfo[SPECIES_SANDSHREW].types[0] == TYPE_GROUND);
        ASSUME(GetMoveType(MOVE_SCRATCH) == TYPE_NORMAL);
        ASSUME(GetMoveType(MOVE_THUNDERBOLT) == TYPE_ELECTRIC);
        ASSUME(GetMoveType(MOVE_WATER_GUN) == TYPE_WATER);
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT | AI_FLAG_OMNISCIENT | AI_FLAG_SMART_SWITCHING | AI_FLAG_SMART_MON_CHOICES);
        PLAYER(SPECIES_WOOPER) { Ability(ABILITY_WATER_ABSORB); Moves(MOVE_CELEBRATE); }
        PLAYER(SPECIES_DWEBBLE) { Moves(MOVE_WATER_GUN); }
        OPPONENT(SPECIES_MUDKIP) { Item(ITEM_CHOICE_SCARF); Moves(MOVE_SCRATCH, MOVE_WATER_GUN); }
        OPPONENT(SPECIES_WOOPER) { Ability(ABILITY_WATER_ABSORB); Moves(MOVE_SCRATCH); }
    } WHEN {
        TURN { SWITCH(player, 1); EXPECT_MOVE(opponent, MOVE_SCRATCH); }
        TURN { MOVE(player, MOVE_WATER_GUN); EXPECT_MOVE(opponent, MOVE_SCRATCH); }
        TURN { MOVE(player, MOVE_WATER_GUN); EXPECT_SWITCH(opponent, 1); }
    }
}
