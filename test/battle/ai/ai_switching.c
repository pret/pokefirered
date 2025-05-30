#include "global.h"
#include "test/battle.h"

AI_SINGLE_BATTLE_TEST("AI gets baited by Protect Switch tactics") // This behavior is to be fixed.
{
    GIVEN {
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT | AI_FLAG_SMART_SWITCHING);
        PLAYER(SPECIES_STUNFISK);
        PLAYER(SPECIES_PELIPPER);
        OPPONENT(SPECIES_DARKRAI) { Moves(MOVE_SCRATCH, MOVE_PECK, MOVE_EARTHQUAKE, MOVE_THUNDERBOLT); }
        OPPONENT(SPECIES_SCIZOR) { Moves(MOVE_HYPER_BEAM, MOVE_FACADE, MOVE_GIGA_IMPACT, MOVE_EXTREME_SPEED); }
    } WHEN {

        TURN { MOVE(player, MOVE_PROTECT);  EXPECT_MOVE(opponent, MOVE_EARTHQUAKE); } // E-quake
        TURN { SWITCH(player, 1);           EXPECT_MOVE(opponent, MOVE_EARTHQUAKE); } // E-quake
        TURN { MOVE(player, MOVE_PROTECT);  EXPECT_MOVE(opponent, MOVE_THUNDERBOLT); } // T-Bolt
        TURN { SWITCH(player, 0);           EXPECT_MOVE(opponent, MOVE_THUNDERBOLT); } // T-Bolt
        TURN { MOVE(player, MOVE_PROTECT);  EXPECT_MOVE(opponent, MOVE_EARTHQUAKE); } // E-quake
        TURN { SWITCH(player, 1);           EXPECT_MOVE(opponent, MOVE_EARTHQUAKE);} // E-quake
        TURN { MOVE(player, MOVE_PROTECT);  EXPECT_MOVE(opponent, MOVE_THUNDERBOLT); } // T-Bolt
    }
}

// General switching behaviour
AI_SINGLE_BATTLE_TEST("AI switches if Perish Song is about to kill")
{
    PASSES_RANDOMLY(SHOULD_SWITCH_PERISH_SONG_PERCENTAGE, 100, RNG_AI_SWITCH_PERISH_SONG);
    GIVEN {
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT);
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET) {Moves(MOVE_SCRATCH); }
        OPPONENT(SPECIES_CROBAT) {Moves(MOVE_SCRATCH); }
    } WHEN {
            TURN { MOVE(player, MOVE_PERISH_SONG); }
            TURN { ; }
            TURN { ; }
            TURN { EXPECT_SWITCH(opponent, 1); }
    } SCENE {
        MESSAGE(AI_TRAINER_NAME " sent out Crobat!");
    }
}

AI_DOUBLE_BATTLE_TEST("AI will not try to switch for the same pokemon for 2 spots in a double battle (all bad moves)")
{
    u32 flags;

    PARAMETRIZE {flags = AI_FLAG_SMART_SWITCHING; }
    PARAMETRIZE {flags = 0; }

    PASSES_RANDOMLY(SHOULD_SWITCH_ALL_MOVES_BAD_PERCENTAGE, 100, RNG_AI_SWITCH_ALL_MOVES_BAD);
    GIVEN {
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT | flags);
        PLAYER(SPECIES_RATTATA);
        PLAYER(SPECIES_RATTATA);
        // No moves to damage player.
        OPPONENT(SPECIES_GENGAR) { Moves(MOVE_SHADOW_BALL); }
        OPPONENT(SPECIES_HAUNTER) { Moves(MOVE_SHADOW_BALL); }
        OPPONENT(SPECIES_GENGAR) { Moves(MOVE_SHADOW_BALL); }
        OPPONENT(SPECIES_RATICATE) { Moves(MOVE_HEADBUTT); }
    } WHEN {
        TURN { EXPECT_SWITCH(opponentLeft, 3); };
    } SCENE {
        MESSAGE(AI_TRAINER_NAME " withdrew Gengar!");
        MESSAGE(AI_TRAINER_NAME " sent out Raticate!");
        NONE_OF {
            MESSAGE(AI_TRAINER_NAME " withdrew Haunter!");
            MESSAGE(AI_TRAINER_NAME " sent out Raticate!");
        }
    }
}

AI_SINGLE_BATTLE_TEST("AI will switch out if it has no move that affects the player")
{
    PASSES_RANDOMLY(SHOULD_SWITCH_ALL_MOVES_BAD_PERCENTAGE, 100, RNG_AI_SWITCH_ALL_MOVES_BAD);
    GIVEN {
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT);
        PLAYER(SPECIES_RATTATA);
        OPPONENT(SPECIES_GENGAR) { Moves(MOVE_SHADOW_BALL); }
        OPPONENT(SPECIES_RATTATA) { Moves(MOVE_SCRATCH); }
    } WHEN {
        TURN { EXPECT_SWITCH(opponent, 1); }
    }
}

AI_SINGLE_BATTLE_TEST("When AI switches out due to having no move that affects the player, AI will send in a mon that can hit the player, even if not ideal")
{
    GIVEN {
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT | AI_FLAG_SMART_MON_CHOICES);
        PLAYER(SPECIES_GENGAR) { Moves(MOVE_SHADOW_BALL, MOVE_CELEBRATE); }
        OPPONENT(SPECIES_ABRA) { Moves(MOVE_TACKLE); }
        OPPONENT(SPECIES_ABRA) { Moves(MOVE_TACKLE); }
        OPPONENT(SPECIES_ABRA) { Level(5); Moves(MOVE_CONFUSION); }
        OPPONENT(SPECIES_ABRA) { Moves(MOVE_TACKLE); }
        OPPONENT(SPECIES_ABRA) { Moves(MOVE_TACKLE); }
    } WHEN {
        TURN { MOVE(player, MOVE_SHADOW_BALL); EXPECT_SWITCH(opponent, 2); EXPECT_SEND_OUT(opponent, 4); }
        TURN { MOVE(player, MOVE_SHADOW_BALL); EXPECT_MOVE(opponent, MOVE_TACKLE); }
    }
}

AI_DOUBLE_BATTLE_TEST("AI will not try to switch for the same pokemon for 2 spots in a double battle (Wonder Guard)")
{
    PASSES_RANDOMLY(SHOULD_SWITCH_WONDER_GUARD_PERCENTAGE, 100, RNG_AI_SWITCH_WONDER_GUARD);
    GIVEN {
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT | AI_FLAG_OMNISCIENT | AI_FLAG_SMART_SWITCHING);
        PLAYER(SPECIES_SHEDINJA);
        PLAYER(SPECIES_SHEDINJA);
        // No moves to damage player.
        OPPONENT(SPECIES_LINOONE) { Moves(MOVE_SCRATCH); }
        OPPONENT(SPECIES_ZIGZAGOON) { Moves(MOVE_SCRATCH); }
        OPPONENT(SPECIES_LINOONE) { Moves(MOVE_SCRATCH); }
        OPPONENT(SPECIES_GENGAR) { Moves(MOVE_SHADOW_BALL); }
    } WHEN {
        TURN { EXPECT_SWITCH(opponentLeft, 3); };
    } SCENE {
        MESSAGE(AI_TRAINER_NAME " withdrew Linoone!");
        MESSAGE(AI_TRAINER_NAME " sent out Gengar!");
        NONE_OF {
            MESSAGE(AI_TRAINER_NAME " withdrew Zigzagoon!");
            MESSAGE(AI_TRAINER_NAME " sent out Gengar!");
        }
    }
}

AI_SINGLE_BATTLE_TEST("AI_FLAG_SMART_MON_CHOICES: Switch effect moves will send out Ace Mon if it's the only one remaining")
{
    u32 aiMove = 0;
    // Moves testing all effects in IsSwitchOutEffect
    PARAMETRIZE { aiMove = MOVE_U_TURN; }
    PARAMETRIZE { aiMove = MOVE_TELEPORT; }
    PARAMETRIZE { aiMove = MOVE_PARTING_SHOT; }
    PARAMETRIZE { aiMove = MOVE_BATON_PASS; }
    PARAMETRIZE { aiMove = MOVE_CHILLY_RECEPTION; }
    PARAMETRIZE { aiMove = MOVE_SHED_TAIL; }
    GIVEN {
        ASSUME(GetMoveEffect(MOVE_U_TURN) == EFFECT_HIT_ESCAPE);
        ASSUME(GetMoveEffect(MOVE_TELEPORT) == EFFECT_TELEPORT);
        ASSUME(GetMoveEffect(MOVE_PARTING_SHOT) == EFFECT_PARTING_SHOT);
        ASSUME(GetMoveEffect(MOVE_BATON_PASS) == EFFECT_BATON_PASS);
        ASSUME(GetMoveEffect(MOVE_CHILLY_RECEPTION) == EFFECT_CHILLY_RECEPTION);
        ASSUME(GetMoveEffect(MOVE_SHED_TAIL) == EFFECT_SHED_TAIL);
        WITH_CONFIG(GEN_CONFIG_TELEPORT_BEHAVIOR, GEN_8);
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT | AI_FLAG_SMART_MON_CHOICES | AI_FLAG_ACE_POKEMON);
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET) { Moves(aiMove); }
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { EXPECT_MOVE(opponent, aiMove); EXPECT_SEND_OUT(opponent, 1); }
    }
}

AI_SINGLE_BATTLE_TEST("AI_FLAG_SMART_MON_CHOICES: Eject Button will send out Ace Mon if it's the only one remaining")
{
    u32 aiSmartMonChoicesFlag;
    PARAMETRIZE { aiSmartMonChoicesFlag = 0; }
    PARAMETRIZE { aiSmartMonChoicesFlag = AI_FLAG_SMART_MON_CHOICES; }
    GIVEN {
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT | aiSmartMonChoicesFlag | AI_FLAG_ACE_POKEMON);
        PLAYER(SPECIES_ZIGZAGOON) { Moves(MOVE_SCRATCH); }
        OPPONENT(SPECIES_ZIGZAGOON) { Item(ITEM_EJECT_BUTTON); };
        OPPONENT(SPECIES_LINOONE);
    } WHEN {
        TURN { MOVE(player, MOVE_SCRATCH); EXPECT_MOVE(opponent, MOVE_SCRATCH); EXPECT_SEND_OUT(opponent, 1); }
    }
}

AI_SINGLE_BATTLE_TEST("AI_FLAG_SMART_MON_CHOICES: Eject Pack will send out Ace Mon if it's the only one remaining")
{
    u32 aiSmartMonChoicesFlag;
    PARAMETRIZE { aiSmartMonChoicesFlag = 0; }
    PARAMETRIZE { aiSmartMonChoicesFlag = AI_FLAG_SMART_MON_CHOICES; }
    GIVEN {
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT | aiSmartMonChoicesFlag | AI_FLAG_ACE_POKEMON);
        PLAYER(SPECIES_ZIGZAGOON) { Moves(MOVE_SCRATCH); }
        PLAYER(SPECIES_ARCANINE) { Ability(ABILITY_INTIMIDATE); Moves(MOVE_SCRATCH); }
        OPPONENT(SPECIES_ZIGZAGOON) { Item(ITEM_EJECT_PACK); Moves(MOVE_SCRATCH); }
        OPPONENT(SPECIES_LINOONE) { Moves(MOVE_HEADBUTT); }
    } WHEN {
        TURN { SWITCH(player, 1); EXPECT_MOVE(opponent, MOVE_SCRATCH); EXPECT_SEND_OUT(opponent, 1); }
    }
}

// General AI_FLAG_SMART_MON_CHOICES behaviour
AI_SINGLE_BATTLE_TEST("AI_FLAG_SMART_MON_CHOICES: Number of hits to KO calculation checks whether incoming damage is less than recurring healing to avoid an infinite loop")
{
    GIVEN {
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_TRY_TO_FAINT | AI_FLAG_CHECK_VIABILITY | AI_FLAG_SMART_SWITCHING | AI_FLAG_SMART_MON_CHOICES);
        PLAYER(SPECIES_VENUSAUR) { Level(30); Moves(MOVE_SCRATCH); }
        // Opponent party courtesy of Skolgrahd, who triggered the bug in the first place
        OPPONENT(SPECIES_PIKACHU) { Level(100); Moves(MOVE_ZIPPY_ZAP, MOVE_EXTREME_SPEED, MOVE_IRON_TAIL, MOVE_KNOCK_OFF); }
        OPPONENT(SPECIES_NINETALES_ALOLA) { Level(100); Moves(MOVE_AURORA_VEIL, MOVE_BLIZZARD, MOVE_MOONBLAST, MOVE_DISABLE); }
        OPPONENT(SPECIES_WEAVILE) { Level(100); Moves(MOVE_NIGHT_SLASH, MOVE_TRIPLE_AXEL, MOVE_ICE_SHARD, MOVE_FAKE_OUT); }
        OPPONENT(SPECIES_DITTO) { Level(100); Moves(MOVE_TRANSFORM); }
        OPPONENT(SPECIES_TYPHLOSION) { Level(100); Moves(MOVE_ERUPTION, MOVE_HEAT_WAVE, MOVE_FOCUS_BLAST, MOVE_EXTRASENSORY); }
        OPPONENT(SPECIES_UMBREON) { Level(100); Item(ITEM_LEFTOVERS); Moves(MOVE_FOUL_PLAY, MOVE_SNARL, MOVE_HELPING_HAND, MOVE_THUNDER_WAVE); }
    } WHEN {
            TURN { MOVE(player, MOVE_SCRATCH); EXPECT_MOVES(opponent, MOVE_ZIPPY_ZAP, MOVE_EXTREME_SPEED, MOVE_IRON_TAIL, MOVE_KNOCK_OFF); }
    } SCENE {
        MESSAGE("Venusaur fainted!");
    }
}

AI_SINGLE_BATTLE_TEST("AI_FLAG_SMART_MON_CHOICES: Number of hits to KO calculation checks whether incoming damage is zero to avoid an infinite loop")
{
    GIVEN {
        ASSUME(gItemsInfo[ITEM_LEFTOVERS].holdEffect == HOLD_EFFECT_LEFTOVERS);
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_TRY_TO_FAINT | AI_FLAG_CHECK_VIABILITY | AI_FLAG_SMART_SWITCHING | AI_FLAG_SMART_MON_CHOICES);
        PLAYER(SPECIES_BULBASAUR) { Level(5); Moves(MOVE_SWORDS_DANCE, MOVE_WHIRLWIND, MOVE_SAND_ATTACK, MOVE_TAIL_WHIP); }
        // Scenario courtesy of Duke, who triggered the bug in the first place
        OPPONENT(SPECIES_GEODUDE) { Level(100); Moves(MOVE_SCRATCH); }
        OPPONENT(SPECIES_GEODUDE) { Level(100); Moves(MOVE_SCRATCH); }
        OPPONENT(SPECIES_NOSEPASS) { Level(100); Moves(MOVE_SCRATCH); }
    } WHEN {
            TURN { MOVE(player, MOVE_SWORDS_DANCE); EXPECT_MOVES(opponent, MOVE_SCRATCH); }
    } SCENE {
        MESSAGE("Bulbasaur fainted!");
    }
}

AI_SINGLE_BATTLE_TEST("AI_FLAG_SMART_MON_CHOICES: Avoid infinite loop if damage taken is equal to recurring healing")
{
    GIVEN {
        ASSUME(gItemsInfo[ITEM_LEFTOVERS].holdEffect == HOLD_EFFECT_LEFTOVERS);
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_TRY_TO_FAINT | AI_FLAG_CHECK_VIABILITY | AI_FLAG_SMART_MON_CHOICES);
        PLAYER(SPECIES_MEOWTH_GALAR) { Level(100); Moves(MOVE_GROWL, MOVE_FAKE_OUT, MOVE_HONE_CLAWS); }
        // Scenario courtesy of Duke, who triggered the bug in the first place
        OPPONENT(SPECIES_MEOWTH_GALAR) { Level(5); Moves(MOVE_GROWL, MOVE_FAKE_OUT, MOVE_HONE_CLAWS); }
        OPPONENT(SPECIES_GEODUDE) { Level(5); Moves(MOVE_DOUBLE_EDGE); }
        OPPONENT(SPECIES_GEODUDE) { Level(5); Moves(MOVE_DOUBLE_EDGE); }
        OPPONENT(SPECIES_NOSEPASS) { Level(5); Moves(MOVE_DOUBLE_EDGE); }
        OPPONENT(SPECIES_HOUNDSTONE) { Level(5); Moves(MOVE_NIGHT_SHADE, MOVE_BODY_PRESS, MOVE_WILL_O_WISP, MOVE_PROTECT); Item(ITEM_LEFTOVERS); }
    } WHEN {
            TURN { MOVE(player, MOVE_FAKE_OUT); EXPECT_MOVES(opponent, MOVE_FAKE_OUT); }
    }
}

AI_SINGLE_BATTLE_TEST("AI_FLAG_SMART_MON_CHOICES: AI will not switch in a Pokemon which is slower and gets 1HKOed after fainting")
{
    bool32 alakazamFirst;
    u32 speedAlakazm;
    u32 aiSmartSwitchFlags = 0;

    PARAMETRIZE { speedAlakazm = 200; alakazamFirst = TRUE; } // AI will always send out Alakazan as it sees a KO with Focus Blast, even if Alakazam dies before it can get it off
    PARAMETRIZE { speedAlakazm = 200; alakazamFirst = FALSE; aiSmartSwitchFlags = AI_FLAG_SMART_SWITCHING | AI_FLAG_SMART_MON_CHOICES; } // AI_FLAG_SMART_MON_CHOICES lets AI see that Alakazam would be KO'd before it can KO, and won't switch it in
    PARAMETRIZE { speedAlakazm = 400; alakazamFirst = TRUE; aiSmartSwitchFlags = AI_FLAG_SMART_SWITCHING | AI_FLAG_SMART_MON_CHOICES; } // AI_FLAG_SMART_MON_CHOICES recognizes that Alakazam is faster and can KO, and will switch it in

    GIVEN {
        ASSUME(GetMoveCategory(MOVE_PSYCHIC) == DAMAGE_CATEGORY_SPECIAL);
        ASSUME(GetMoveCategory(MOVE_FOCUS_BLAST) == DAMAGE_CATEGORY_SPECIAL);
        ASSUME(GetMoveCategory(MOVE_BUBBLE_BEAM) == DAMAGE_CATEGORY_SPECIAL);
        ASSUME(GetMoveCategory(MOVE_WATER_GUN) == DAMAGE_CATEGORY_SPECIAL);
        ASSUME(GetMoveCategory(MOVE_STRENGTH) == DAMAGE_CATEGORY_PHYSICAL);
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT | aiSmartSwitchFlags);
        PLAYER(SPECIES_WEAVILE) { Speed(300); Ability(ABILITY_SHADOW_TAG); } // Weavile has Shadow Tag, so AI can't switch on the first turn, but has to do it after fainting.
        OPPONENT(SPECIES_KADABRA) { Speed(200); Moves(MOVE_PSYCHIC, MOVE_DISABLE, MOVE_TAUNT, MOVE_CALM_MIND); }
        OPPONENT(SPECIES_ALAKAZAM) { Speed(speedAlakazm); Moves(MOVE_FOCUS_BLAST, MOVE_PSYCHIC); } // Alakazam has a move which OHKOes Weavile, but it doesn't matter if he's getting KO-ed first.
        OPPONENT(SPECIES_BLASTOISE) { Speed(200); Moves(MOVE_BUBBLE_BEAM, MOVE_WATER_GUN, MOVE_LEER, MOVE_STRENGTH); } // Can't OHKO, but survives a hit from Weavile's Night Slash.
    } WHEN {
            TURN { MOVE(player, MOVE_NIGHT_SLASH) ; EXPECT_SEND_OUT(opponent, alakazamFirst ? 1 : 2); } // AI doesn't send out Alakazam if it gets outsped
    } SCENE {
        MESSAGE("The opposing Kadabra fainted!");
        if (alakazamFirst) {
            MESSAGE(AI_TRAINER_NAME " sent out Alakazam!");
        } else {
            MESSAGE(AI_TRAINER_NAME " sent out Blastoise!");
        }
    }
}

AI_SINGLE_BATTLE_TEST("AI_FLAG_SMART_MON_CHOICES: AI considers hazard damage when choosing which Pokemon to switch in")
{
    u32 aiIsSmart = 0;
    u32 aiSmartSwitchFlags = 0;

    PARAMETRIZE { aiIsSmart = 0; aiSmartSwitchFlags = 0; } // AI doesn't care about hazard damage resulting in Pokemon being KO'd
    PARAMETRIZE { aiIsSmart = 1; aiSmartSwitchFlags = AI_FLAG_SMART_MON_CHOICES; } // AI_FLAG_SMART_MON_CHOICES avoids being KO'd as a result of hazards damage

    GIVEN {
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT | aiSmartSwitchFlags);
        PLAYER(SPECIES_MEGANIUM) { Speed(100); SpDefense(328); SpAttack(265); Moves(MOVE_STEALTH_ROCK, MOVE_SURF); } // Meganium does ~56% minimum ~66% maximum, enough to KO Charizard after rocks and never KO Typhlosion after rocks
        OPPONENT(SPECIES_PONYTA) { Level(5); Speed(5); Moves(MOVE_SCRATCH); }
        OPPONENT(SPECIES_CHARIZARD) { Speed(200); Moves(MOVE_FLAMETHROWER); SpAttack(317); SpDefense(207); MaxHP(297); } // Outspeends and 2HKOs Meganium
        OPPONENT(SPECIES_TYPHLOSION) { Speed(200); Moves(MOVE_FLAMETHROWER); SpAttack(317); SpDefense(207); MaxHP(297); } // Outspeends and 2HKOs Meganium
    } WHEN {
            TURN { MOVE(player, MOVE_STEALTH_ROCK) ;}
            TURN { MOVE(player, MOVE_SURF); EXPECT_SEND_OUT(opponent, aiIsSmart ? 2 : 1); } // AI sends out Typhlosion to get the KO with the flag rather than Charizard
    }
}

AI_SINGLE_BATTLE_TEST("AI_FLAG_SMART_MON_CHOICES: Mid-battle switches prioritize type matchup + SE move, then type matchup")
{
    u32 aiSmartSwitchFlags = 0;
    u32 move1;
    u32 move2;
    u32 expectedIndex;

    PARAMETRIZE { expectedIndex = 3; move1 = MOVE_SCRATCH; move2 = MOVE_SCRATCH; aiSmartSwitchFlags = 0; } // When not smart, AI will only switch in a defensive mon if it has a SE move, otherwise will just default to damage
    PARAMETRIZE { expectedIndex = 1; move1 = MOVE_GIGA_DRAIN; move2 = MOVE_SCRATCH; aiSmartSwitchFlags = 0; }
    PARAMETRIZE { expectedIndex = 2; move1 = MOVE_SCRATCH; move2 = MOVE_WATER_PULSE; aiSmartSwitchFlags = AI_FLAG_SMART_MON_CHOICES; } // When smart, AI will prioritize SE move, but still switch in good type matchup without SE move
    PARAMETRIZE { expectedIndex = 1; move1 = MOVE_GIGA_DRAIN; move2 = MOVE_SCRATCH; aiSmartSwitchFlags = AI_FLAG_SMART_MON_CHOICES; }

    GIVEN {
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT | aiSmartSwitchFlags);
        PLAYER(SPECIES_MARSHTOMP) { Level(30); Moves(MOVE_MUD_BOMB, MOVE_WATER_GUN, MOVE_GROWL, MOVE_MUD_SHOT); Speed(5); }
        OPPONENT(SPECIES_PONYTA) { Level(1); Moves(MOVE_NONE); Speed(6); } // Forces switchout
        OPPONENT(SPECIES_TANGELA) { Level(30); Moves(move1); Speed(4); }
        OPPONENT(SPECIES_LOMBRE) { Level(30); Moves(move2); Speed(4); }
        OPPONENT(SPECIES_HARIYAMA) { Level(30); Moves(MOVE_VITAL_THROW); Speed(4); }
    } WHEN {
            TURN { MOVE(player, MOVE_GROWL); EXPECT_SWITCH(opponent, expectedIndex); }
    }
}

AI_SINGLE_BATTLE_TEST("AI_FLAG_SMART_MON_CHOICES: Mid-battle switches prioritize defensive options")
{
    GIVEN {
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT | AI_FLAG_SMART_MON_CHOICES);
        PLAYER(SPECIES_SWELLOW) { Level(30); Moves(MOVE_WING_ATTACK, MOVE_BOOMBURST); Speed(5); SpAttack(50); }
        OPPONENT(SPECIES_PONYTA) { Level(1); Moves(MOVE_NONE); Speed(4); } // Forces switchout
        OPPONENT(SPECIES_ARON) { Level(30); Moves(MOVE_IRON_HEAD); Speed(4); SpDefense(50); } // Mid battle, AI sends out Aron
        OPPONENT(SPECIES_ELECTRODE) { Level(30); Ability(ABILITY_STATIC); Moves(MOVE_CHARGE_BEAM); Speed(6); SpDefense(53);}
    } WHEN {
            TURN { MOVE(player, MOVE_WING_ATTACK); EXPECT_SWITCH(opponent, 1); }
    }
}

AI_SINGLE_BATTLE_TEST("AI_FLAG_SMART_MON_CHOICES: Mid-battle switches prioritize offensive options after slow U-Turn")
{
    GIVEN {
        ASSUME(GetMoveEffect(MOVE_FALSE_SWIPE) == EFFECT_FALSE_SWIPE);
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT | AI_FLAG_SMART_MON_CHOICES);
        PLAYER(SPECIES_SWELLOW) { Level(30); Moves(MOVE_FALSE_SWIPE, MOVE_BOOMBURST); Speed(5); SpAttack(50); }
        OPPONENT(SPECIES_PONYTA) { Level(1); Moves(MOVE_U_TURN); Speed(4); } // Forces switchout
        OPPONENT(SPECIES_ARON) { Level(30); Moves(MOVE_IRON_HEAD); Speed(4); SpDefense(50); }
        OPPONENT(SPECIES_ELECTRODE) { Level(30); Ability(ABILITY_STATIC); Moves(MOVE_CHARGE_BEAM); Speed(6); SpDefense(53); }
    } WHEN {
            TURN { MOVE(player, MOVE_FALSE_SWIPE); EXPECT_SEND_OUT(opponent, 2); }
    }
}

AI_SINGLE_BATTLE_TEST("AI_FLAG_SMART_MON_CHOICES: Mid-battle switches prioritize offensive options after Eject Button")
{
    GIVEN {
        ASSUME(gItemsInfo[ITEM_EJECT_BUTTON].holdEffect == HOLD_EFFECT_EJECT_BUTTON);
        ASSUME(GetMoveEffect(MOVE_FALSE_SWIPE) == EFFECT_FALSE_SWIPE);
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT | AI_FLAG_SMART_MON_CHOICES);
        PLAYER(SPECIES_SWELLOW) { Level(30); Moves(MOVE_FALSE_SWIPE, MOVE_BOOMBURST); Speed(5); SpAttack(50); }
        OPPONENT(SPECIES_PONYTA) { Level(1); Item(ITEM_EJECT_BUTTON); Moves(MOVE_SCRATCH); Speed(4); } // Forces switchout
        OPPONENT(SPECIES_ARON) { Level(30); Moves(MOVE_IRON_HEAD); Speed(4); SpDefense(50); }
        OPPONENT(SPECIES_ELECTRODE) { Level(30); Ability(ABILITY_STATIC); Moves(MOVE_CHARGE_BEAM); Speed(6); SpDefense(53); }
    } WHEN {
            TURN { MOVE(player, MOVE_FALSE_SWIPE); EXPECT_SEND_OUT(opponent, 2); }
    }
}

AI_SINGLE_BATTLE_TEST("AI_FLAG_SMART_MON_CHOICES: Mid-battle switches prioritize offensive options after Eject Pack")
{
    GIVEN {
        ASSUME(gItemsInfo[ITEM_EJECT_PACK].holdEffect == HOLD_EFFECT_EJECT_PACK);
        ASSUME(GetMoveEffect(MOVE_GROWL) == EFFECT_ATTACK_DOWN);
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT | AI_FLAG_SMART_MON_CHOICES);
        PLAYER(SPECIES_SWELLOW) { Level(30); Moves(MOVE_GROWL, MOVE_BOOMBURST); Speed(5); SpAttack(50); }
        OPPONENT(SPECIES_PONYTA) { Level(1); Item(ITEM_EJECT_PACK); Moves(MOVE_SCRATCH); Speed(4); } // Forces switchout
        OPPONENT(SPECIES_ARON) { Level(30); Moves(MOVE_IRON_HEAD); Speed(4); SpDefense(50); }
        OPPONENT(SPECIES_ELECTRODE) { Level(30); Ability(ABILITY_STATIC); Moves(MOVE_CHARGE_BEAM); Speed(6); SpDefense(53); }
    } WHEN {
            TURN { MOVE(player, MOVE_GROWL); EXPECT_SEND_OUT(opponent, 2); }
    }
}

AI_SINGLE_BATTLE_TEST("AI_FLAG_SMART_MON_CHOICES: Mid-battle switches prioritize defensive options after Eject Pack if mon outspeeds")
{
    GIVEN {
        ASSUME(gItemsInfo[ITEM_EJECT_PACK].holdEffect == HOLD_EFFECT_EJECT_PACK);
        ASSUME(MoveHasAdditionalEffectSelf(MOVE_OVERHEAT, MOVE_EFFECT_SP_ATK_MINUS_2) == TRUE);
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT | AI_FLAG_SMART_MON_CHOICES);
        PLAYER(SPECIES_SWELLOW) { Level(30); Moves(MOVE_WING_ATTACK, MOVE_BOOMBURST); Speed(5); SpAttack(50); }
        OPPONENT(SPECIES_PONYTA) { Level(1); Item(ITEM_EJECT_PACK); Moves(MOVE_OVERHEAT); Speed(6); } // Forces switchout
        OPPONENT(SPECIES_ARON) { Level(30); Moves(MOVE_IRON_HEAD); Speed(4); SpDefense(50); }
        OPPONENT(SPECIES_ELECTRODE) { Level(30); Ability(ABILITY_STATIC); Moves(MOVE_CHARGE_BEAM); Speed(6); SpDefense(53); }
    } WHEN {
            TURN { MOVE(player, MOVE_WING_ATTACK); EXPECT_SEND_OUT(opponent, 1); }
    }
}

AI_SINGLE_BATTLE_TEST("AI_FLAG_SMART_MON_CHOICES: Mid-battle switches prioritize offensive options after Eject Pack if mon outspeeds but was Intimidate'd")
{
    GIVEN {
        ASSUME(gItemsInfo[ITEM_EJECT_PACK].holdEffect == HOLD_EFFECT_EJECT_PACK);
        ASSUME(MoveHasAdditionalEffectSelf(MOVE_OVERHEAT, MOVE_EFFECT_SP_ATK_MINUS_2) == TRUE);
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT | AI_FLAG_SMART_MON_CHOICES);
        PLAYER(SPECIES_STARAPTOR) { Level(30); Ability(ABILITY_INTIMIDATE); Moves(MOVE_WING_ATTACK, MOVE_BOOMBURST); Speed(5); SpAttack(50); }
        OPPONENT(SPECIES_PONYTA) { Level(1); Item(ITEM_EJECT_PACK); Moves(MOVE_OVERHEAT); Speed(6); } // Forces switchout
        OPPONENT(SPECIES_ARON) { Level(30); Moves(MOVE_IRON_HEAD); Speed(4); SpDefense(50); }
        OPPONENT(SPECIES_ELECTRODE) { Level(30); Ability(ABILITY_STATIC); Moves(MOVE_CHARGE_BEAM); Speed(6); SpDefense(53); }
    } WHEN {
            TURN { MOVE(player, MOVE_WING_ATTACK); EXPECT_SWITCH(opponent, 2); }
    }
}

AI_SINGLE_BATTLE_TEST("AI_FLAG_SMART_MON_CHOICES: Post-KO switches prioritize offensive options")
{
    GIVEN {
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT | AI_FLAG_SMART_MON_CHOICES);
        PLAYER(SPECIES_SWELLOW) { Level(30); Moves(MOVE_WING_ATTACK, MOVE_BOOMBURST); Speed(5); }
        OPPONENT(SPECIES_PONYTA) { Level(1); Moves(MOVE_SCRATCH); Speed(4); }
        OPPONENT(SPECIES_ARON) { Level(30); Moves(MOVE_IRON_HEAD); Speed(4); } // Mid battle, AI sends out Aron
        OPPONENT(SPECIES_ELECTRODE) { Level(30); Ability(ABILITY_STATIC); Moves(MOVE_CHARGE_BEAM); Speed(6); }
    } WHEN {
            TURN { MOVE(player, MOVE_WING_ATTACK); EXPECT_SEND_OUT(opponent, 2); }
    }
}

AI_SINGLE_BATTLE_TEST("AI_FLAG_SMART_MON_CHOICES: Post-KO switches factor in Trick Room for revenge killing")
{
    GIVEN {
        ASSUME(GetMoveEffect(MOVE_TRICK_ROOM) == EFFECT_TRICK_ROOM);
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT | AI_FLAG_SMART_MON_CHOICES);
        PLAYER(SPECIES_SWELLOW) { Level(30); Speed(10); Moves(MOVE_WING_ATTACK, MOVE_GROWL); }
        OPPONENT(SPECIES_BALTOY) { Level(1); Speed(10); Moves(MOVE_TRICK_ROOM); }
        OPPONENT(SPECIES_ELECTRODE) { Level(30); Speed(5); Moves(MOVE_THUNDERBOLT); }
        OPPONENT(SPECIES_ELECTRODE) { Level(30); Speed(15); Moves(MOVE_THUNDERBOLT); }
    } WHEN {
            TURN { EXPECT_MOVE(opponent, MOVE_TRICK_ROOM); MOVE(player, MOVE_GROWL); }
            TURN { MOVE(player, MOVE_WING_ATTACK); EXPECT_SEND_OUT(opponent, 1); }
    }
}

// General AI_FLAG_SMART_SWITCHING behaviour
AI_SINGLE_BATTLE_TEST("AI_FLAG_SMART_SWITCHING: AI switches out after sufficient stat drops")
{
    GIVEN {
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT | AI_FLAG_SMART_SWITCHING);
        PLAYER(SPECIES_HITMONTOP) { Level(30); Moves(MOVE_CHARM, MOVE_SCRATCH); Ability(ABILITY_INTIMIDATE); Speed(5); }
        OPPONENT(SPECIES_GRIMER) { Level(30); Moves(MOVE_SCRATCH); Speed(4); }
        OPPONENT(SPECIES_PONYTA) { Level(30); Moves(MOVE_HEADBUTT); Speed(4); }
    } WHEN {
        TURN { MOVE(player, MOVE_CHARM); }
        TURN { MOVE(player, MOVE_SCRATCH); EXPECT_SWITCH(opponent, 1); }
    }
}

AI_SINGLE_BATTLE_TEST("AI_FLAG_SMART_SWITCHING: AI will not switch out if Pokemon would faint to hazards unless party member can clear them")
{
    u32 move1;

    PARAMETRIZE { move1 = MOVE_SCRATCH; }
    PARAMETRIZE { move1 = MOVE_RAPID_SPIN; }

    GIVEN {
        ASSUME(GetMoveCategory(MOVE_SCRATCH) == DAMAGE_CATEGORY_PHYSICAL);
        ASSUME(GetMoveCategory(MOVE_RAPID_SPIN) == DAMAGE_CATEGORY_PHYSICAL);
        ASSUME(GetMoveCategory(MOVE_EARTHQUAKE) == DAMAGE_CATEGORY_PHYSICAL);
        ASSUME(GetMoveCategory(MOVE_HEADBUTT) == DAMAGE_CATEGORY_PHYSICAL);
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT | AI_FLAG_SMART_SWITCHING);
        PLAYER(SPECIES_HITMONTOP) { Level(30); Moves(MOVE_CHARM, MOVE_SCRATCH, MOVE_STEALTH_ROCK, MOVE_EARTHQUAKE); Ability(ABILITY_INTIMIDATE); Speed(5); }
        OPPONENT(SPECIES_GRIMER) { Level(30); Moves(MOVE_SCRATCH); Item(ITEM_FOCUS_SASH); Speed(4); }
        OPPONENT(SPECIES_PONYTA) { Level(30); Moves(MOVE_HEADBUTT, move1); Speed(4); }
    } WHEN {
        TURN { MOVE(player, MOVE_STEALTH_ROCK); }
        TURN { MOVE(player, MOVE_EARTHQUAKE); }
        TURN { MOVE(player, MOVE_CHARM); }
        TURN { // If the AI has a mon that can remove hazards, don't prevent them switching out
            MOVE(player, MOVE_CHARM);
            if (move1 == MOVE_RAPID_SPIN)
                EXPECT_SWITCH(opponent, 1);
            else if (move1 == MOVE_SCRATCH)
                EXPECT_MOVE(opponent, MOVE_SCRATCH);
        }
    }
}

// Trapping behaviour
AI_SINGLE_BATTLE_TEST("AI_FLAG_SMART_SWITCHING: AI will switch in trapping mon mid battle")
{
    u32 aiSmartSwitchingFlag = 0;
    PARAMETRIZE { aiSmartSwitchingFlag = 0; }
    PARAMETRIZE { aiSmartSwitchingFlag = AI_FLAG_SMART_SWITCHING; }
    PASSES_RANDOMLY(SHOULD_SWITCH_TRAPPER_PERCENTAGE, 100, RNG_AI_SWITCH_TRAPPER);
    GIVEN {
        ASSUME(gSpeciesInfo[SPECIES_GOLURK].types[0] == TYPE_GROUND);
        ASSUME(gSpeciesInfo[SPECIES_GOLURK].types[1] == TYPE_GHOST);
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT | aiSmartSwitchingFlag);
        PLAYER(SPECIES_ELECTRODE) { Speed(4); Moves(MOVE_THUNDERBOLT, MOVE_AURA_SPHERE, MOVE_PROTECT); }
        PLAYER(SPECIES_WOBBUFFET) { Speed(1); };
        OPPONENT(SPECIES_SNORLAX) { Speed(1); Moves(MOVE_HEADBUTT); }
        OPPONENT(SPECIES_DUGTRIO) { Speed(3); Ability(ABILITY_ARENA_TRAP); Moves(MOVE_EARTHQUAKE); }
        OPPONENT(SPECIES_GOLURK) { Speed(5); Moves(MOVE_EARTHQUAKE); }
    } WHEN {
        if (aiSmartSwitchingFlag == AI_FLAG_SMART_SWITCHING)
            TURN { MOVE(player, MOVE_AURA_SPHERE) ; EXPECT_SWITCH(opponent, 1); }
        else
            TURN { MOVE(player, MOVE_AURA_SPHERE) ; EXPECT_MOVE(opponent, MOVE_HEADBUTT); }
    }
}

AI_SINGLE_BATTLE_TEST("AI_FLAG_SMART_MON_CHOICES: AI will switch in trapping mon after KO")
{
    u32 aiSmartMonChoicesFlag = 0; // Enables trapping behaviour after KOs
    PARAMETRIZE { aiSmartMonChoicesFlag = 0; } // No trapping behaviour
    PARAMETRIZE { aiSmartMonChoicesFlag = AI_FLAG_SMART_MON_CHOICES; } // Traps with mid battle switches
    GIVEN {
        ASSUME(gSpeciesInfo[SPECIES_MAWILE].types[0] == TYPE_STEEL);
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT | aiSmartMonChoicesFlag);
        PLAYER(SPECIES_MAWILE) { Speed(2); Moves(MOVE_PROTECT, MOVE_SCRATCH); }
        PLAYER(SPECIES_WOBBUFFET) { Speed(1); }
        OPPONENT(SPECIES_SNORLAX) { Speed(3); Moves(MOVE_SELF_DESTRUCT); }
        OPPONENT(SPECIES_MAGNEZONE) { Speed(1); Ability(ABILITY_MAGNET_PULL); Moves(MOVE_SHOCK_WAVE); }
        OPPONENT(SPECIES_MEGANIUM) { Speed(3); Moves(MOVE_EARTH_POWER); }
    } WHEN {
        if (aiSmartMonChoicesFlag == AI_FLAG_SMART_MON_CHOICES)
            TURN{ MOVE(player, MOVE_PROTECT); EXPECT_MOVE(opponent, MOVE_SELF_DESTRUCT); EXPECT_SEND_OUT(opponent, 1); }
        else
            TURN{ MOVE(player, MOVE_PROTECT); EXPECT_MOVE(opponent, MOVE_SELF_DESTRUCT); EXPECT_SEND_OUT(opponent, 2); }
    }
}

AI_SINGLE_BATTLE_TEST("AI won't use trapping behaviour if player only has 1 mon left")
{
    u32 aiSmartMonChoicesFlag = 0; // Enables trapping behaviour after KOs
    PARAMETRIZE { aiSmartMonChoicesFlag = 0; } // No trapping behaviour
    PARAMETRIZE { aiSmartMonChoicesFlag = AI_FLAG_SMART_MON_CHOICES; } // Traps with mid battle switches
    GIVEN {
        ASSUME(gSpeciesInfo[SPECIES_MAWILE].types[0] == TYPE_STEEL);
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT | aiSmartMonChoicesFlag);
        PLAYER(SPECIES_MAWILE) { Speed(2); Moves(MOVE_PROTECT, MOVE_SCRATCH); }
        OPPONENT(SPECIES_SNORLAX) { Speed(3); Moves(MOVE_SELF_DESTRUCT); }
        OPPONENT(SPECIES_MAGNEZONE) { Speed(1); Ability(ABILITY_MAGNET_PULL); Moves(MOVE_SHOCK_WAVE); }
        OPPONENT(SPECIES_MEGANIUM) { Speed(3); Moves(MOVE_EARTH_POWER); }
    } WHEN {
        TURN{ MOVE(player, MOVE_PROTECT); EXPECT_MOVE(opponent, MOVE_SELF_DESTRUCT); EXPECT_SEND_OUT(opponent, 2); }
    }
}

AI_SINGLE_BATTLE_TEST("AI will trap player using Trace if player has a trapper")
{
    PASSES_RANDOMLY(SHOULD_SWITCH_TRAPPER_PERCENTAGE, 100, RNG_AI_SWITCH_TRAPPER);
    GIVEN {
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT | AI_FLAG_OMNISCIENT | AI_FLAG_SMART_SWITCHING);
        PLAYER(SPECIES_DUGTRIO) { Ability(ABILITY_ARENA_TRAP); Moves(MOVE_ROCK_TOMB); }
        PLAYER(SPECIES_DUGTRIO);
        OPPONENT(SPECIES_GENGAR);
        OPPONENT(SPECIES_PORYGON2) { Ability(ABILITY_TRACE); Item(ITEM_EVIOLITE); Moves(MOVE_ICE_BEAM); }
    } WHEN {
        TURN { MOVE(player, MOVE_ROCK_TOMB); EXPECT_SWITCH(opponent, 1); }
    }
}

AI_SINGLE_BATTLE_TEST("AI_FLAG_SMART_SWITCHING: AI will switch out if mon would be OKHO'd and they have a good switchin 50% of the time")
{
    PASSES_RANDOMLY(SHOULD_SWITCH_HASBADODDS_PERCENTAGE, 100, RNG_AI_SWITCH_HASBADODDS);
    GIVEN {
        ASSUME(gSpeciesInfo[SPECIES_RHYDON].types[0] == TYPE_GROUND);
        ASSUME(gSpeciesInfo[SPECIES_PELIPPER].types[0] == TYPE_WATER);
        ASSUME(gSpeciesInfo[SPECIES_PELIPPER].types[1] == TYPE_FLYING);
        ASSUME(GetMoveType(MOVE_THUNDERBOLT) == TYPE_ELECTRIC);
        ASSUME(GetMoveType(MOVE_EARTHQUAKE) == TYPE_GROUND);

        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT | AI_FLAG_SMART_SWITCHING | AI_FLAG_SMART_MON_CHOICES | AI_FLAG_OMNISCIENT);
        PLAYER(SPECIES_ELECTRODE) { Moves(MOVE_THUNDERBOLT, MOVE_THUNDER_WAVE, MOVE_THUNDER_SHOCK); }
        OPPONENT(SPECIES_PELIPPER) { Moves(MOVE_EARTHQUAKE); };
        OPPONENT(SPECIES_RHYDON) { Moves(MOVE_EARTHQUAKE); Ability(ABILITY_ROCK_HEAD); }
    } WHEN {
        TURN { MOVE(player, MOVE_THUNDERBOLT) ; EXPECT_SWITCH(opponent, 1); }
    }
}

AI_SINGLE_BATTLE_TEST("Switch AI: AI will switch out if it can't deal damage to a mon with Wonder Guard")
{
    PASSES_RANDOMLY(SHOULD_SWITCH_WONDER_GUARD_PERCENTAGE, 100, RNG_AI_SWITCH_WONDER_GUARD);
    GIVEN {
        ASSUME(gSpeciesInfo[SPECIES_SHEDINJA].types[0] == TYPE_BUG);
        ASSUME(gSpeciesInfo[SPECIES_SHEDINJA].types[1] == TYPE_GHOST);
        ASSUME(gSpeciesInfo[SPECIES_SHEDINJA].abilities[0] == ABILITY_WONDER_GUARD);
        ASSUME(gSpeciesInfo[SPECIES_SHEDINJA].abilities[1] == ABILITY_NONE);
        ASSUME(gSpeciesInfo[SPECIES_SHEDINJA].abilities[2] == ABILITY_NONE);
        ASSUME(GetMoveType(MOVE_SCRATCH) == TYPE_NORMAL);
        ASSUME(GetMoveType(MOVE_SHADOW_BALL) == TYPE_GHOST);
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT);
        PLAYER(SPECIES_SHEDINJA) { Moves(MOVE_SCRATCH); }
        OPPONENT(SPECIES_ZIGZAGOON) { Moves(MOVE_SCRATCH); }
        OPPONENT(SPECIES_ZIGZAGOON) { Moves(MOVE_SHADOW_BALL); }
    } WHEN {
        TURN { MOVE(player, MOVE_SCRATCH) ; EXPECT_SWITCH(opponent, 1); }
    }
}

AI_SINGLE_BATTLE_TEST("AI_FLAG_SMART_SWITCHING: AI will switch out if it can't deal damage to a mon with Wonder Guard")
{
    PASSES_RANDOMLY(SHOULD_SWITCH_WONDER_GUARD_PERCENTAGE, 100, RNG_AI_SWITCH_WONDER_GUARD);
    GIVEN {
        ASSUME(gSpeciesInfo[SPECIES_SHEDINJA].types[0] == TYPE_BUG);
        ASSUME(gSpeciesInfo[SPECIES_SHEDINJA].types[1] == TYPE_GHOST);
        ASSUME(gSpeciesInfo[SPECIES_SHEDINJA].abilities[0] == ABILITY_WONDER_GUARD);
        ASSUME(gSpeciesInfo[SPECIES_SHEDINJA].abilities[1] == ABILITY_NONE);
        ASSUME(gSpeciesInfo[SPECIES_SHEDINJA].abilities[2] == ABILITY_NONE);
        ASSUME(GetMoveType(MOVE_SCRATCH) == TYPE_NORMAL);
        ASSUME(GetMoveType(MOVE_SHADOW_BALL) == TYPE_GHOST);
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT | AI_FLAG_SMART_SWITCHING);
        PLAYER(SPECIES_SHEDINJA) { Moves(MOVE_SCRATCH); }
        OPPONENT(SPECIES_ZIGZAGOON) { Moves(MOVE_SCRATCH); }
        OPPONENT(SPECIES_ZIGZAGOON) { Moves(MOVE_SHADOW_BALL); }
    } WHEN {
        TURN { MOVE(player, MOVE_SCRATCH) ; EXPECT_SWITCH(opponent, 1); }
    }
}

AI_SINGLE_BATTLE_TEST("AI_FLAG_SMART_SWITCHING: AI will switch out if it has been Toxic'd for at least two turns 50% of the time with more than 1/3 HP remaining with good switchin")
{
    u32 species = SPECIES_NONE, odds = 0;
    PARAMETRIZE { species = SPECIES_ZIGZAGOON, odds = 0; }
    PARAMETRIZE { species = SPECIES_HARIYAMA, odds = SHOULD_SWITCH_BADLY_POISONED_PERCENTAGE; }
    PASSES_RANDOMLY(odds, 100, RNG_AI_SWITCH_BADLY_POISONED);
    GIVEN {
        ASSUME(GetMoveEffect(MOVE_TOXIC) == EFFECT_NON_VOLATILE_STATUS);
        ASSUME(GetMoveNonVolatileStatus(MOVE_TOXIC) == MOVE_EFFECT_TOXIC);
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT | AI_FLAG_SMART_SWITCHING);
        PLAYER(SPECIES_ZIGZAGOON) { Moves(MOVE_SCRATCH, MOVE_CELEBRATE, MOVE_TOXIC, MOVE_AURA_SPHERE); }
        OPPONENT(SPECIES_ZIGZAGOON) { Moves(MOVE_SCRATCH); }
        OPPONENT(species) { Moves(MOVE_ROCK_SMASH); }
    } WHEN {
        TURN { MOVE(player, MOVE_TOXIC); EXPECT_MOVE(opponent, MOVE_SCRATCH); }
        TURN { MOVE(player, MOVE_AURA_SPHERE); EXPECT_MOVE(opponent, MOVE_SCRATCH); }
        TURN { MOVE(player, MOVE_AURA_SPHERE); EXPECT_SWITCH(opponent, 1); }
    }
}

AI_SINGLE_BATTLE_TEST("AI_FLAG_SMART_SWITCHING: AI will switch out if it has been Curse'd 50% of the time")
{
    PASSES_RANDOMLY(SHOULD_SWITCH_CURSED_PERCENTAGE, 100, RNG_AI_SWITCH_CURSED);
    GIVEN {
        ASSUME(GetMoveEffect(MOVE_CURSE) == EFFECT_CURSE);
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT | AI_FLAG_SMART_SWITCHING);
        PLAYER(SPECIES_DUSCLOPS) { Moves(MOVE_FIRE_PUNCH, MOVE_CURSE); }
        PLAYER(SPECIES_MILOTIC) { Moves(MOVE_WATER_GUN); }
        OPPONENT(SPECIES_DUSCLOPS) { Moves(MOVE_SHADOW_BALL); }
        OPPONENT(SPECIES_DUSCLOPS) { Moves(MOVE_SHADOW_BALL); }
    } WHEN {
        TURN { MOVE(player, MOVE_CURSE) ; EXPECT_MOVE(opponent, MOVE_SHADOW_BALL); }
        TURN { MOVE(player, MOVE_FIRE_PUNCH); EXPECT_SWITCH(opponent, 1); }
    }
}

AI_SINGLE_BATTLE_TEST("AI_FLAG_SMART_SWITCHING: AI will switch out if it has been Nightmare'd 33% of the time")
{
    PASSES_RANDOMLY(SHOULD_SWITCH_NIGHTMARE_PERCENTAGE, 100, RNG_AI_SWITCH_NIGHTMARE);
    GIVEN {
        ASSUME(GetMoveEffect(MOVE_NIGHTMARE) == EFFECT_NIGHTMARE);
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT | AI_FLAG_SMART_SWITCHING);
        PLAYER(SPECIES_GENGAR) { Moves(MOVE_NIGHTMARE); }
        OPPONENT(SPECIES_DUSCLOPS) { Moves(MOVE_SHADOW_BALL); Status1(STATUS1_SLEEP); }
        OPPONENT(SPECIES_DUSCLOPS) { Moves(MOVE_SHADOW_BALL); }
    } WHEN {
        TURN { MOVE(player, MOVE_NIGHTMARE) ; EXPECT_MOVE(opponent, MOVE_SHADOW_BALL); }
        TURN { MOVE(player, MOVE_NIGHTMARE) ; EXPECT_SWITCH(opponent, 1); }
    }
}

AI_SINGLE_BATTLE_TEST("AI_FLAG_SMART_SWITCHING: AI will switch out if it has been Leech Seed'd 25% of the time")
{
    PASSES_RANDOMLY(SHOULD_SWITCH_SEEDED_PERCENTAGE, 100, RNG_AI_SWITCH_SEEDED);
    GIVEN {
        ASSUME(GetMoveEffect(MOVE_LEECH_SEED) == EFFECT_LEECH_SEED);
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT | AI_FLAG_SMART_SWITCHING);
        PLAYER(SPECIES_WHIMSICOTT) { Moves(MOVE_LEECH_SEED); }
        OPPONENT(SPECIES_ZIGZAGOON) { Moves(MOVE_SCRATCH); }
        OPPONENT(SPECIES_ZIGZAGOON) { Moves(MOVE_SCRATCH); }
    } WHEN {
        TURN { MOVE(player, MOVE_LEECH_SEED) ; EXPECT_MOVE(opponent, MOVE_SCRATCH); }
        TURN { MOVE(player, MOVE_LEECH_SEED); EXPECT_SWITCH(opponent, 1); }
    }
}

AI_SINGLE_BATTLE_TEST("AI_FLAG_SMART_SWITCHING: AI will switch out if it has been infatuated")
{
    PASSES_RANDOMLY(SHOULD_SWITCH_INFATUATION_PERCENTAGE, 100, RNG_AI_SWITCH_INFATUATION);
    GIVEN {
        ASSUME(GetMoveEffect(MOVE_ATTRACT) == EFFECT_ATTRACT);
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT | AI_FLAG_SMART_SWITCHING);
        PLAYER(SPECIES_LUVDISC) { Moves(MOVE_ATTRACT); Gender(MON_FEMALE); }
        OPPONENT(SPECIES_ZIGZAGOON) { Moves(MOVE_SCRATCH); Gender(MON_MALE); }
        OPPONENT(SPECIES_ZIGZAGOON) { Moves(MOVE_SCRATCH); Gender(MON_MALE); }
    } WHEN {
        TURN { MOVE(player, MOVE_ATTRACT) ; EXPECT_MOVE(opponent, MOVE_SCRATCH); }
        TURN { MOVE(player, MOVE_ATTRACT) ; EXPECT_SWITCH(opponent, 1); }
    }
}

AI_SINGLE_BATTLE_TEST("AI_FLAG_SMART_SWITCHING: AI will switch out if it has been Yawn'd with more than 1/3 HP remaining and it has a good switchin")
{
    u32 hp;
    PARAMETRIZE { hp = 30; }
    PARAMETRIZE { hp = 10; }
    PASSES_RANDOMLY(SHOULD_SWITCH_YAWN_PERCENTAGE, 100, RNG_AI_SWITCH_YAWN);
    GIVEN {
        ASSUME(GetMoveEffect(MOVE_YAWN) == EFFECT_YAWN);
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT | AI_FLAG_SMART_SWITCHING);
        PLAYER(SPECIES_SLAKOTH) { Moves(MOVE_SCRATCH, MOVE_YAWN); }
        OPPONENT(SPECIES_SLAKOTH) { Moves(MOVE_SCRATCH); HP(hp); MaxHP(30); }
        OPPONENT(SPECIES_SLAKOTH) { Moves(MOVE_HEADBUTT); }
    } WHEN {
        TURN { MOVE(player, MOVE_YAWN) ; EXPECT_MOVE(opponent, MOVE_SCRATCH); }
        if (hp == 30)
            TURN { MOVE(player, MOVE_YAWN) ; EXPECT_SWITCH(opponent, 1); }
        else
            TURN { MOVE(player, MOVE_YAWN) ; EXPECT_MOVE(opponent, MOVE_SCRATCH); }
    }
}

AI_SINGLE_BATTLE_TEST("AI_FLAG_SMART_SWITCHING: AI will not switch out if it has been Yawn'd with more than 1/3 HP remaining and it does not have a good switchin")
{
    u32 hp;
    PARAMETRIZE { hp = 30; }
    PARAMETRIZE { hp = 10; }
    GIVEN {
        ASSUME(GetMoveEffect(MOVE_YAWN) == EFFECT_YAWN);
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT | AI_FLAG_SMART_SWITCHING);
        PLAYER(SPECIES_SLAKOTH) { Moves(MOVE_SCRATCH, MOVE_YAWN); }
        OPPONENT(SPECIES_SLAKOTH) { Moves(MOVE_SCRATCH); HP(hp); MaxHP(30); }
        OPPONENT(SPECIES_SLAKOTH) { Level(1); Moves(MOVE_HEADBUTT); }
    } WHEN {
        TURN { MOVE(player, MOVE_YAWN) ; EXPECT_MOVE(opponent, MOVE_SCRATCH); }
        TURN { MOVE(player, MOVE_SCRATCH) ; EXPECT_MOVE(opponent, MOVE_SCRATCH); }
    }
}

AI_DOUBLE_BATTLE_TEST("AI_FLAG_SMART_SWITCHING: AI will switch out if it has been Yawn'd with more than 1/3 HP remaining (Doubles)")
{
    u32 hp;
    PARAMETRIZE { hp = 30; }
    PARAMETRIZE { hp = 10; }
    PASSES_RANDOMLY(SHOULD_SWITCH_YAWN_PERCENTAGE, 100, RNG_AI_SWITCH_YAWN);
    GIVEN {
        ASSUME(GetMoveEffect(MOVE_YAWN) == EFFECT_YAWN);
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT | AI_FLAG_SMART_SWITCHING);
        PLAYER(SPECIES_SLAKOTH) { Moves(MOVE_SCRATCH, MOVE_CELEBRATE, MOVE_YAWN); }
        PLAYER(SPECIES_SLAKOTH) { Moves(MOVE_SCRATCH, MOVE_CELEBRATE, MOVE_YAWN); }
        OPPONENT(SPECIES_ZIGZAGOON) { Moves(MOVE_SCRATCH); HP(hp); MaxHP(30); }
        OPPONENT(SPECIES_ZIGZAGOON) { Moves(MOVE_SCRATCH); }
        OPPONENT(SPECIES_ZIGZAGOON) { Moves(MOVE_SCRATCH); }
        OPPONENT(SPECIES_ZIGZAGOON) { Moves(MOVE_SCRATCH); }
    } WHEN {
        TURN { MOVE(playerLeft, MOVE_YAWN, target: opponentLeft); MOVE(playerRight, MOVE_CELEBRATE, target: opponentLeft); }
        if (hp == 30)
            TURN { MOVE(playerLeft, MOVE_YAWN, target: opponentLeft); MOVE(playerRight, MOVE_CELEBRATE, target: opponentLeft); EXPECT_SWITCH(opponentLeft, 2); }
        else
            TURN { MOVE(playerLeft, MOVE_YAWN, target: opponentLeft); MOVE(playerRight, MOVE_CELEBRATE, target: opponentLeft); EXPECT_MOVE(opponentLeft, MOVE_SCRATCH); }
    }
}

AI_SINGLE_BATTLE_TEST("AI_FLAG_SMART_SWITCHING: AI will switch out if player's mon is semi-invulnerable and it has an absorber")
{
    PASSES_RANDOMLY(SHOULD_SWITCH_FREE_TURN_PERCENTAGE, 100, RNG_AI_SWITCH_FREE_TURN);
    GIVEN {
        ASSUME(GetMoveType(MOVE_DIVE) == TYPE_WATER);
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT | AI_FLAG_SMART_SWITCHING);
        PLAYER(SPECIES_LUVDISC) { Moves(MOVE_DIVE); }
        OPPONENT(SPECIES_ZIGZAGOON) { Moves(MOVE_SCRATCH); }
        OPPONENT(SPECIES_MANTINE) { Moves(MOVE_SCRATCH); Ability(ABILITY_WATER_ABSORB); }
    } WHEN {
        TURN { MOVE(player, MOVE_DIVE) ; EXPECT_MOVE(opponent, MOVE_SCRATCH); }
        TURN { SKIP_TURN(player); EXPECT_SWITCH(opponent, 1); }
    }
}

AI_SINGLE_BATTLE_TEST("AI_FLAG_SMART_SWITCHING: AI will switch out if it has an absorber but current mon has SE move 33% of the time")
{
    PASSES_RANDOMLY(33, 100, RNG_AI_SWITCH_ABSORBING_STAY_IN);
    GIVEN {
        ASSUME(GetMoveType(MOVE_WATER_GUN) == TYPE_WATER);
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT | AI_FLAG_SMART_SWITCHING);
        PLAYER(SPECIES_LUVDISC) { Moves(MOVE_WATER_GUN); }
        OPPONENT(SPECIES_ZIGZAGOON) { Moves(MOVE_SHOCK_WAVE); }
        OPPONENT(SPECIES_MANTINE) { Moves(MOVE_SCRATCH); Ability(ABILITY_WATER_ABSORB); }
    } WHEN {
        TURN { MOVE(player, MOVE_WATER_GUN) ; EXPECT_MOVE(opponent, MOVE_SHOCK_WAVE); }
        TURN { MOVE(player, MOVE_WATER_GUN) ; EXPECT_SWITCH(opponent, 1); }
    }
}

AI_SINGLE_BATTLE_TEST("AI_FLAG_SMART_SWITCHING: AI will switch out if player's mon is charging and it has an absorber")
{
    PASSES_RANDOMLY(SHOULD_SWITCH_ABSORBS_MOVE_PERCENTAGE, 100, RNG_AI_SWITCH_ABSORBING);
    GIVEN {
        ASSUME(GetMoveType(MOVE_SOLAR_BEAM) == TYPE_GRASS);
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT | AI_FLAG_SMART_SWITCHING);
        PLAYER(SPECIES_BELLOSSOM) { Moves(MOVE_SOLAR_BEAM, MOVE_THUNDERBOLT); }
        OPPONENT(SPECIES_ZIGZAGOON) { Moves(MOVE_SCRATCH); }
        OPPONENT(SPECIES_AZUMARILL) { Moves(MOVE_PLAY_ROUGH); Ability(ABILITY_SAP_SIPPER); }
    } WHEN {
        TURN { MOVE(player, MOVE_SOLAR_BEAM) ; EXPECT_MOVE(opponent, MOVE_SCRATCH); }
        TURN { SKIP_TURN(player); EXPECT_SWITCH(opponent, 1); }
    }
}

AI_SINGLE_BATTLE_TEST("AI_FLAG_SMART_SWITCHING: AI will switch out if player's mon is charging and it has a good switchin immunity (type)")
{
    PASSES_RANDOMLY(SHOULD_SWITCH_FREE_TURN_PERCENTAGE, 100, RNG_AI_SWITCH_FREE_TURN);
    GIVEN {
        ASSUME(GetMoveType(MOVE_DIG) == TYPE_GROUND);
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT | AI_FLAG_SMART_SWITCHING);
        PLAYER(SPECIES_SANDSHREW) { Moves(MOVE_DIG); }
        OPPONENT(SPECIES_ZIGZAGOON) { Moves(MOVE_SCRATCH); }
        OPPONENT(SPECIES_SWELLOW) { Moves(MOVE_WING_ATTACK); }
    } WHEN {
        TURN { MOVE(player, MOVE_DIG) ; EXPECT_MOVE(opponent, MOVE_SCRATCH); }
        TURN { SKIP_TURN(player); EXPECT_SWITCH(opponent, 1); }
    }
}

AI_SINGLE_BATTLE_TEST("AI_FLAG_SMART_SWITCHING: AI will switch out if player's mon is charging and it has a good switchin immunity (ability)")
{
    PASSES_RANDOMLY(SHOULD_SWITCH_FREE_TURN_PERCENTAGE, 100, RNG_AI_SWITCH_FREE_TURN);
    GIVEN {
        ASSUME(GetMoveType(MOVE_DIG) == TYPE_GROUND);
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT | AI_FLAG_SMART_SWITCHING);
        PLAYER(SPECIES_SANDSHREW) { Moves(MOVE_DIG); }
        OPPONENT(SPECIES_ZIGZAGOON) { Moves(MOVE_SCRATCH); }
        OPPONENT(SPECIES_BRONZONG) { Moves(MOVE_PSYCHIC); Ability(ABILITY_LEVITATE); }
    } WHEN {
        TURN { MOVE(player, MOVE_DIG) ; EXPECT_MOVE(opponent, MOVE_SCRATCH); }
        TURN { SKIP_TURN(player); EXPECT_SWITCH(opponent, 1); }
    }
}

AI_SINGLE_BATTLE_TEST("AI_FLAG_SMART_SWITCHING: AI will switch out if it has an absorber")
{
    u32 aiMon; u32 move; u32 absorbingAbility;
    PARAMETRIZE { aiMon = SPECIES_NINETALES; absorbingAbility = ABILITY_FLASH_FIRE; move = MOVE_FLAMETHROWER;}
    PARAMETRIZE { aiMon = SPECIES_MANTINE;   absorbingAbility = ABILITY_WATER_ABSORB; move = MOVE_SURF;}
    PARAMETRIZE { aiMon = SPECIES_TOXICROAK; absorbingAbility = ABILITY_DRY_SKIN; move = MOVE_SURF;}
    PARAMETRIZE { aiMon = SPECIES_GASTRODON; absorbingAbility = ABILITY_STORM_DRAIN; move = MOVE_SURF;}
    PARAMETRIZE { aiMon = SPECIES_JOLTEON; absorbingAbility = ABILITY_VOLT_ABSORB; move = MOVE_THUNDERBOLT;}
    PARAMETRIZE { aiMon = SPECIES_ELECTIVIRE; absorbingAbility = ABILITY_MOTOR_DRIVE; move = MOVE_THUNDERBOLT;}
    PARAMETRIZE { aiMon = SPECIES_MANECTRIC; absorbingAbility = ABILITY_LIGHTNING_ROD; move = MOVE_THUNDERBOLT;}
    PARAMETRIZE { aiMon = SPECIES_ELECTIVIRE; absorbingAbility = ABILITY_MOTOR_DRIVE; move = MOVE_THUNDERBOLT;}
    PARAMETRIZE { aiMon = SPECIES_AZUMARILL; absorbingAbility = ABILITY_SAP_SIPPER; move = MOVE_GIGA_DRAIN;}
    PARAMETRIZE { aiMon = SPECIES_ORTHWORM; absorbingAbility = ABILITY_EARTH_EATER; move = MOVE_EARTHQUAKE;}
    PARAMETRIZE { aiMon = SPECIES_BRONZONG; absorbingAbility = ABILITY_LEVITATE; move = MOVE_EARTHQUAKE;}
    PARAMETRIZE { aiMon = SPECIES_ELECTRODE; absorbingAbility = ABILITY_SOUNDPROOF; move = MOVE_HYPER_VOICE;}
    PARAMETRIZE { aiMon = SPECIES_CHESNAUGHT; absorbingAbility = ABILITY_BULLETPROOF; move = MOVE_SLUDGE_BOMB;}
    PARAMETRIZE { aiMon = SPECIES_SHIFTRY; absorbingAbility = ABILITY_WIND_RIDER; move = MOVE_HURRICANE;}
    GIVEN {
        ASSUME(B_REDIRECT_ABILITY_IMMUNITY >= GEN_5);
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT | AI_FLAG_SMART_SWITCHING);
        PLAYER(SPECIES_ZIGZAGOON) { Moves(move); }
        OPPONENT(SPECIES_ZIGZAGOON) { Moves(MOVE_SCRATCH); }
        OPPONENT(aiMon) { Moves(MOVE_SCRATCH); Ability(absorbingAbility); }
    } WHEN {
        TURN { MOVE(player, move); EXPECT_MOVE(opponent, MOVE_SCRATCH); }
        TURN { MOVE(player, move); EXPECT_SWITCH(opponent, 1); }
    }
}

AI_SINGLE_BATTLE_TEST("AI_FLAG_SMART_SWITCHING: AI will switch out if opponent uses two-turn move and it has a switchin that wins 1v1")
{
    u32 move;
    PARAMETRIZE { move = MOVE_SKY_ATTACK; }
    PARAMETRIZE { move = MOVE_FLY; }

    GIVEN {
        ASSUME(GetMoveEffect(MOVE_FLY) == EFFECT_SEMI_INVULNERABLE);
        ASSUME(GetMoveEffect(MOVE_SKY_ATTACK) == EFFECT_TWO_TURNS_ATTACK);
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT | AI_FLAG_SMART_SWITCHING);
        PLAYER(SPECIES_SWELLOW) { Moves(move); }
        OPPONENT(SPECIES_MILOTIC) { Moves(MOVE_SURF); }
        OPPONENT(SPECIES_LAIRON) { Moves(MOVE_ROCK_SLIDE); }
    } WHEN {
        TURN { MOVE(player, move); EXPECT_MOVE(opponent, MOVE_SURF); }
        TURN { SKIP_TURN(player); EXPECT_SWITCH(opponent, 1); }
    }
}

AI_SINGLE_BATTLE_TEST("Switch AI: AI will switch out if badly statused with >= 50% HP remaining and has Natural Cure and a good switchin 66% of the time")
{
    PASSES_RANDOMLY(SHOULD_SWITCH_NATURAL_CURE_STRONG_PERCENTAGE, 100, RNG_AI_SWITCH_NATURAL_CURE);
    GIVEN {
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT);
        PLAYER(SPECIES_ODDISH) { Moves(MOVE_TOXIC, MOVE_SCRATCH); }
        OPPONENT(SPECIES_SWABLU) { Ability(ABILITY_NATURAL_CURE); Moves(MOVE_SCRATCH, MOVE_PECK); }
        OPPONENT(SPECIES_SWABLU) { Ability(ABILITY_NATURAL_CURE); Moves(MOVE_SCRATCH); }
    } WHEN {
        TURN { MOVE(player, MOVE_TOXIC); EXPECT_MOVE(opponent, MOVE_PECK); }
        TURN { MOVE(player, MOVE_SCRATCH); EXPECT_SWITCH(opponent, 1); }
    }
}

AI_SINGLE_BATTLE_TEST("Switch AI: AI will switch out if it has <= 66% HP remaining and has Regenerator and a good switchin 50% of the time")
{
    PASSES_RANDOMLY(SHOULD_SWITCH_REGENERATOR_PERCENTAGE, 100, RNG_AI_SWITCH_REGENERATOR);
    GIVEN {
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT);
        PLAYER(SPECIES_ZIGZAGOON) { Moves(MOVE_SCRATCH); }
        OPPONENT(SPECIES_SLOWBRO) { MaxHP(100); HP(65); Ability(ABILITY_REGENERATOR); Moves(MOVE_SCRATCH); }
        OPPONENT(SPECIES_SLOWBRO) { Ability(ABILITY_REGENERATOR); Moves(MOVE_SCRATCH); }
    } WHEN {
        TURN { MOVE(player, MOVE_SCRATCH); EXPECT_SWITCH(opponent, 1); }
    }
}

AI_SINGLE_BATTLE_TEST("AI_FLAG_SMART_SWITCHING: AI will switch out if it has been Encore'd into a status move")
{
    PASSES_RANDOMLY(SHOULD_SWITCH_ENCORE_STATUS_PERCENTAGE, 100, RNG_AI_SWITCH_ENCORE);
    GIVEN {
        ASSUME(GetMoveEffect(MOVE_ENCORE) == EFFECT_ENCORE);
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT | AI_FLAG_SMART_SWITCHING);
        PLAYER(SPECIES_AZURILL) { Moves(MOVE_SCRATCH, MOVE_ENCORE); }
        OPPONENT(SPECIES_ODDISH) { Moves(MOVE_TOXIC, MOVE_SWEET_SCENT, MOVE_INGRAIN, MOVE_SCRATCH); }
        OPPONENT(SPECIES_ARON) { Moves(MOVE_METAL_CLAW); }
    } WHEN {
        TURN { EXPECT_MOVE(opponent, MOVE_TOXIC); MOVE(player, MOVE_ENCORE); }
        TURN { MOVE(player, MOVE_ENCORE); EXPECT_SWITCH(opponent, 1); }
    }
}

AI_SINGLE_BATTLE_TEST("AI_FLAG_SMART_SWITCHING: AI will stay in if Encore'd into super effective move")
{
    GIVEN {
        ASSUME(GetMoveEffect(MOVE_ENCORE) == EFFECT_ENCORE);
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT | AI_FLAG_SMART_SWITCHING);
        PLAYER(SPECIES_AZURILL) { Moves(MOVE_SCRATCH, MOVE_ENCORE); }
        OPPONENT(SPECIES_ODDISH) { Moves(MOVE_ACID); }
        OPPONENT(SPECIES_ARON) { Moves(MOVE_METAL_CLAW); }
    } WHEN {
        TURN { EXPECT_MOVE(opponent, MOVE_ACID); MOVE(player, MOVE_ENCORE); }
        TURN { EXPECT_MOVE(opponent, MOVE_ACID); MOVE(player, MOVE_SCRATCH); }
    }
}

AI_SINGLE_BATTLE_TEST("AI_FLAG_SMART_SWITCHING: AI will switch out if Encore'd into neutral move with good switchin 50% of the time")
{
    KNOWN_FAILING; // AI still switches even if ShouldSwitch is set to immediately return FALSE, something external seems to be triggering this
    PASSES_RANDOMLY(SHOULD_SWITCH_ENCORE_DAMAGE_PERCENTAGE, 100, RNG_AI_SWITCH_ENCORE);
    GIVEN {
        ASSUME(GetMoveEffect(MOVE_ENCORE) == EFFECT_ENCORE);
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT | AI_FLAG_SMART_SWITCHING);
        PLAYER(SPECIES_AZURILL) { Moves(MOVE_SCRATCH, MOVE_ENCORE); }
        OPPONENT(SPECIES_ODDISH) { Moves(MOVE_SCRATCH); }
        OPPONENT(SPECIES_ARON) { Moves(MOVE_METAL_CLAW); }
    } WHEN {
        TURN { EXPECT_MOVE(opponent, MOVE_SCRATCH); MOVE(player, MOVE_ENCORE); }
        TURN { MOVE(player, MOVE_SCRATCH); EXPECT_SWITCH(opponent, 1); }
    }
}

AI_SINGLE_BATTLE_TEST("Switch AI: AI will switch out if mon has Truant and opponent has Protect")
{
    PASSES_RANDOMLY(SHOULD_SWITCH_TRUANT_PERCENTAGE, 100, RNG_AI_SWITCH_TRUANT);
    GIVEN {
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT | AI_FLAG_OMNISCIENT);
        PLAYER(SPECIES_ARON) { Moves(MOVE_SCRATCH, MOVE_PROTECT); }
        OPPONENT(SPECIES_SLAKING) { Ability(ABILITY_TRUANT); Moves(MOVE_BRICK_BREAK); }
        OPPONENT(SPECIES_ARON) { Moves(MOVE_SCRATCH); }
    } WHEN {
        TURN { EXPECT_MOVE(opponent, MOVE_BRICK_BREAK); MOVE(player, MOVE_PROTECT); }
        TURN { EXPECT_SWITCH(opponent, 1); MOVE(player, MOVE_SCRATCH); }
    }
}

AI_SINGLE_BATTLE_TEST("Switch AI: AI will switch out if mon has Truant and opponent has invulnerability move and is faster")
{
    PASSES_RANDOMLY(SHOULD_SWITCH_TRUANT_PERCENTAGE, 100, RNG_AI_SWITCH_TRUANT);
    GIVEN {
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT | AI_FLAG_OMNISCIENT);
        PLAYER(SPECIES_SWELLOW) { Speed(5); Moves(MOVE_FLY); }
        OPPONENT(SPECIES_SLAKING) { Speed(4); Ability(ABILITY_TRUANT); Moves(MOVE_ROCK_SLIDE); }
        OPPONENT(SPECIES_ARON) { Speed(4); Moves(MOVE_SCRATCH); }
    } WHEN {
        TURN { MOVE(player, MOVE_FLY); EXPECT_MOVE(opponent, MOVE_ROCK_SLIDE); }
        TURN { SKIP_TURN(player); EXPECT_SWITCH(opponent, 1); }
    }
}

AI_SINGLE_BATTLE_TEST("AI_FLAG_SMART_SWITCHING: AI will switch out if main attacking stat lowered by 2 stages with good switchin candidate 50% of the time")
{
    u32 aiSpecies = SPECIES_NONE, aiMove = MOVE_NONE, move = MOVE_NONE;

    PASSES_RANDOMLY(SHOULD_SWITCH_ATTACKING_STAT_MINUS_TWO_PERCENTAGE, 100, RNG_AI_SWITCH_STATS_LOWERED);
    PARAMETRIZE {move = MOVE_CHARM; aiSpecies = SPECIES_FLAREON; aiMove = MOVE_FIRE_FANG; };
    PARAMETRIZE {move = MOVE_EERIE_IMPULSE; aiSpecies = SPECIES_ESPEON; aiMove = MOVE_CONFUSION; };

    GIVEN {
        ASSUME(GetMoveEffect(MOVE_CHARM) == EFFECT_ATTACK_DOWN_2);
        ASSUME(GetMoveEffect(MOVE_EERIE_IMPULSE) == EFFECT_SPECIAL_ATTACK_DOWN_2);
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT | AI_FLAG_SMART_SWITCHING);
        PLAYER(SPECIES_ARON) { Moves(move, MOVE_SCRATCH); }
        OPPONENT(aiSpecies) { Moves(aiMove); }
        OPPONENT(SPECIES_MILOTIC) { Moves(MOVE_SURF); }
    } WHEN {
        TURN { MOVE(player, move); EXPECT_MOVE(opponent, aiMove); }
        TURN { MOVE(player, MOVE_SCRATCH); EXPECT_SWITCH(opponent, 1); }
    }
}

AI_SINGLE_BATTLE_TEST("AI_FLAG_SMART_SWITCHING: AI will switch out if main attacking stat lowered by 3+ stages")
{
    u32 aiSpecies = SPECIES_NONE, aiMove = MOVE_NONE, move = MOVE_NONE, move2 = MOVE_NONE;

    PASSES_RANDOMLY(SHOULD_SWITCH_ATTACKING_STAT_MINUS_THREE_PLUS_PERCENTAGE, 100, RNG_AI_SWITCH_STATS_LOWERED);
    PARAMETRIZE {move = MOVE_GROWL; move2 = MOVE_CHARM; aiSpecies = SPECIES_FLAREON; aiMove = MOVE_FIRE_FANG; };
    PARAMETRIZE {move = MOVE_CONFIDE; move2 = MOVE_EERIE_IMPULSE; aiSpecies = SPECIES_ESPEON; aiMove = MOVE_STORED_POWER; };

    GIVEN {
        ASSUME(GetMoveEffect(MOVE_CHARM) == EFFECT_ATTACK_DOWN_2);
        ASSUME(GetMoveEffect(MOVE_EERIE_IMPULSE) == EFFECT_SPECIAL_ATTACK_DOWN_2);
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT | AI_FLAG_SMART_SWITCHING);
        PLAYER(SPECIES_ARON) { Moves(move, move2, MOVE_SCRATCH); }
        OPPONENT(aiSpecies) { Moves(aiMove); }
        OPPONENT(SPECIES_MILOTIC) { Moves(MOVE_SURF); }
    } WHEN {
        TURN { MOVE(player, move); EXPECT_MOVE(opponent, aiMove); }
        TURN { MOVE(player, move2); EXPECT_MOVE(opponent, aiMove); }
        TURN { MOVE(player, MOVE_SCRATCH); EXPECT_SWITCH(opponent, 1); }
    }
}

AI_SINGLE_BATTLE_TEST("Switch AI: AI will switch into mon with good type matchup and SE move if current mon has no SE move and no stats raised")
{
    KNOWN_FAILING; // Either remove or replace the function
    u32 odds = 0, species = SPECIES_NONE, move = MOVE_NONE;
    PARAMETRIZE { odds = 33; species = SPECIES_SCIZOR; move = MOVE_X_SCISSOR; }
    PARAMETRIZE { odds = 50; species = SPECIES_DUSCLOPS; move = MOVE_SHADOW_BALL; }
    PASSES_RANDOMLY(odds, 100, RNG_AI_SWITCH_SE_DEFENSIVE);
    GIVEN {
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT);
        PLAYER(SPECIES_MUNNA) { Moves(MOVE_SCRATCH); }
        OPPONENT(SPECIES_MUNNA) { Moves(MOVE_SCRATCH); }
        OPPONENT(species) { Moves(move); }
    } WHEN {
        TURN { MOVE(player, MOVE_SCRATCH); EXPECT_MOVE(opponent, MOVE_SCRATCH); }
        TURN { MOVE(player, MOVE_SCRATCH); EXPECT_SWITCH(opponent, 1); }
    }
}

AI_SINGLE_BATTLE_TEST("AI_FLAG_SMART_MON_CHOICES: AI correctly handles abilities when scoring moves")
{
    GIVEN {
        ASSUME(B_PRANKSTER_DARK_TYPES >= GEN_7);
        ASSUME(gSpeciesInfo[SPECIES_GRENINJA].types[1] == TYPE_DARK);
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_TRY_TO_FAINT | AI_FLAG_CHECK_VIABILITY | AI_FLAG_OMNISCIENT | AI_FLAG_SMART_MON_CHOICES);
        PLAYER(SPECIES_GRENINJA) { Moves(MOVE_WATER_GUN); }
        OPPONENT(SPECIES_WHIMSICOTT) { Ability(ABILITY_PRANKSTER); Moves(MOVE_LEECH_SEED, MOVE_STUN_SPORE, MOVE_ABSORB); }
        OPPONENT(SPECIES_WHIMSICOTT) { Ability(ABILITY_INFILTRATOR); }
    } WHEN {
        TURN { MOVE(player, MOVE_WATER_GUN); EXPECT_MOVE(opponent, MOVE_ABSORB); }
    }
}

AI_SINGLE_BATTLE_TEST("AI_FLAG_SMART_SWITCHING: AI won't switch out if Yawn'd with only Ace mon remaining")
{
    u32 aceFlag;
    PARAMETRIZE{ aceFlag = 0; }
    PARAMETRIZE{ aceFlag = AI_FLAG_ACE_POKEMON; }
    GIVEN {
        ASSUME(GetMoveEffect(MOVE_YAWN) == EFFECT_YAWN);
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_TRY_TO_FAINT | aceFlag | AI_FLAG_CHECK_VIABILITY | AI_FLAG_OMNISCIENT | AI_FLAG_SMART_MON_CHOICES | AI_FLAG_SMART_SWITCHING);
        PLAYER(SPECIES_SLAKOTH) { Moves(MOVE_SCRATCH, MOVE_YAWN); }
        OPPONENT(SPECIES_SLAKOTH) { Moves(MOVE_SCRATCH); }
        OPPONENT(SPECIES_SLAKOTH) { Moves(MOVE_HEADBUTT); }
    } WHEN {
        TURN { MOVE(player, MOVE_YAWN); EXPECT_MOVE(opponent, MOVE_SCRATCH); }
        if (aceFlag)
            TURN { MOVE(player, MOVE_SCRATCH); EXPECT_MOVE(opponent, MOVE_SCRATCH); }
        else
            TURN { MOVE(player, MOVE_SCRATCH); EXPECT_SWITCH(opponent, 1); }
    }
}

AI_SINGLE_BATTLE_TEST("AI_FLAG_SMART_SWITCHING: AI won't switch in ace mon after U-Turn if other options available")
{
    u32 aceFlag;
    PARAMETRIZE{ aceFlag = 0; }
    PARAMETRIZE{ aceFlag = AI_FLAG_ACE_POKEMON; }
    GIVEN {
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_TRY_TO_FAINT | aceFlag | AI_FLAG_CHECK_VIABILITY | AI_FLAG_OMNISCIENT | AI_FLAG_SMART_MON_CHOICES | AI_FLAG_SMART_SWITCHING);
        PLAYER(SPECIES_WOBBUFFET) { Moves(MOVE_SURF); }
        OPPONENT(SPECIES_WOBBUFFET) { Moves(MOVE_U_TURN); }
        OPPONENT(SPECIES_NUMEL) { Level(5); Moves(MOVE_SPLASH); }
        OPPONENT(SPECIES_SCIZOR) { Moves(MOVE_BUG_BITE); }
    } WHEN {
        if (aceFlag)
            TURN { EXPECT_MOVE(opponent, MOVE_U_TURN); EXPECT_SEND_OUT(opponent, 1); MOVE(player, MOVE_SURF); }
        else
            TURN { EXPECT_MOVE(opponent, MOVE_U_TURN); EXPECT_SEND_OUT(opponent, 2); MOVE(player, MOVE_SURF); }
    }
}

AI_SINGLE_BATTLE_TEST("Switch AI: AI won't switch in ace mon after U-Turn if other options available")
{
    u32 aceFlag;
    PARAMETRIZE{ aceFlag = 0; }
    PARAMETRIZE{ aceFlag = AI_FLAG_ACE_POKEMON; }
    GIVEN {
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_TRY_TO_FAINT | aceFlag | AI_FLAG_CHECK_VIABILITY | AI_FLAG_OMNISCIENT);
        PLAYER(SPECIES_WOBBUFFET) { Moves(MOVE_SURF); }
        OPPONENT(SPECIES_WOBBUFFET) { Moves(MOVE_U_TURN); }
        OPPONENT(SPECIES_NUMEL) { Level(5); Moves(MOVE_SPLASH); }
        OPPONENT(SPECIES_SCIZOR) { Moves(MOVE_BUG_BITE); }
    } WHEN {
        if (aceFlag)
            TURN { EXPECT_MOVE(opponent, MOVE_U_TURN); EXPECT_SEND_OUT(opponent, 1); MOVE(player, MOVE_SURF); }
        else
            TURN { EXPECT_MOVE(opponent, MOVE_U_TURN); EXPECT_SEND_OUT(opponent, 2); MOVE(player, MOVE_SURF); }
    }
}

AI_SINGLE_BATTLE_TEST("AI_FLAG_SMART_SWITCHING: AI won't switch in absorbing mon immediately after sending out new mon")
{
    GIVEN {
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_TRY_TO_FAINT | AI_FLAG_CHECK_VIABILITY | AI_FLAG_SMART_SWITCHING | AI_FLAG_SMART_MON_CHOICES | AI_FLAG_OMNISCIENT);
        PLAYER(SPECIES_BLAZIKEN) { Moves(MOVE_FLAMETHROWER, MOVE_CLOSE_COMBAT); }
        OPPONENT(SPECIES_FERROTHORN) { Moves(MOVE_GYRO_BALL); }
        OPPONENT(SPECIES_DIALGA) { Moves(MOVE_DRACO_METEOR); }
        OPPONENT(SPECIES_HEATRAN) { Moves(MOVE_EARTH_POWER, MOVE_FLAMETHROWER); }
    } WHEN {
        TURN { MOVE(player, MOVE_FLAMETHROWER); EXPECT_SEND_OUT(opponent, 1); }
        TURN { MOVE(player, MOVE_CLOSE_COMBAT); EXPECT_MOVE(opponent, MOVE_DRACO_METEOR); }
    }
}

AI_SINGLE_BATTLE_TEST("AI_FLAG_SMART_MON_CHOICES: AI will consider choice-locked player when determining which mon to send out")
{
    u32 item;
    PARAMETRIZE { item = ITEM_NONE; }
    PARAMETRIZE { item = ITEM_CHOICE_BAND; }
    GIVEN {
        ASSUME(gItemsInfo[ITEM_CHOICE_BAND].holdEffect == HOLD_EFFECT_CHOICE_BAND);
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_TRY_TO_FAINT | AI_FLAG_CHECK_VIABILITY | AI_FLAG_SMART_SWITCHING | AI_FLAG_SMART_MON_CHOICES | AI_FLAG_OMNISCIENT);
        PLAYER(SPECIES_JOLTEON) { Speed(5); Moves(MOVE_EARTHQUAKE, MOVE_THUNDERBOLT); Item(item); }
        OPPONENT(SPECIES_WOBBUFFET) { Speed(4); HP(1); Moves(MOVE_TACKLE); }
        OPPONENT(SPECIES_MACHAMP) { Speed(4); Moves(MOVE_REVENGE); }
        OPPONENT(SPECIES_GYARADOS) { Speed(4); Moves(MOVE_EARTHQUAKE); }
    } WHEN {
        TURN { MOVE(player, MOVE_EARTHQUAKE); EXPECT_MOVE(opponent, MOVE_TACKLE); item == ITEM_NONE ? EXPECT_SEND_OUT(opponent, 1) : EXPECT_SEND_OUT(opponent, 2); }
    }
}

AI_SINGLE_BATTLE_TEST("AI_FLAG_SMART_SWITCHING: AI will switch out if all moves deal zero damage")
{
    PASSES_RANDOMLY(SHOULD_SWITCH_ALL_SCORES_BAD_PERCENTAGE, 100, RNG_AI_SWITCH_ALL_SCORES_BAD);
    GIVEN {
        ASSUME(GetMoveEffect(MOVE_WILL_O_WISP) == EFFECT_NON_VOLATILE_STATUS);
        ASSUME(GetMoveNonVolatileStatus(MOVE_WILL_O_WISP) == MOVE_EFFECT_BURN);
        ASSUME(GetMoveEffect(MOVE_POLTERGEIST) == EFFECT_POLTERGEIST);
        ASSUME(GetMoveType(MOVE_SCALD) == TYPE_WATER);
        ASSUME(GetMoveType(MOVE_EARTHQUAKE) == TYPE_GROUND);
        ASSUME(gSpeciesInfo[SPECIES_MANTINE].types[1] == TYPE_FLYING);
        ASSUME(GetItemHoldEffect(ITEM_WATER_GEM) == HOLD_EFFECT_GEMS);
        ASSUME(GetItemSecondaryId(ITEM_WATER_GEM) == TYPE_WATER);
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_TRY_TO_FAINT | AI_FLAG_CHECK_VIABILITY | AI_FLAG_SMART_SWITCHING | AI_FLAG_OMNISCIENT);
        PLAYER(SPECIES_MANTINE) { Speed(5); Moves(MOVE_ROOST, MOVE_SCALD); Ability(ABILITY_WATER_VEIL); Item(ITEM_WATER_GEM); }
        OPPONENT(SPECIES_DUSKNOIR) { Speed(6); Moves(MOVE_WILL_O_WISP, MOVE_POLTERGEIST, MOVE_EARTHQUAKE); }
        OPPONENT(SPECIES_ZIGZAGOON) { Speed(6); Moves(MOVE_TACKLE); }
    } WHEN {
        TURN { EXPECT_MOVE(opponent, MOVE_POLTERGEIST); MOVE(player, MOVE_SCALD); }
        TURN { EXPECT_SWITCH(opponent, 1); MOVE(player, MOVE_ROOST); }
    }
}

AI_SINGLE_BATTLE_TEST("Switch AI: AI will switch out if Palafin-Zero isn't transformed yet")
{
    GIVEN {
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT);
        PLAYER(SPECIES_FINIZEN);
        OPPONENT(SPECIES_PALAFIN_ZERO);
        OPPONENT(SPECIES_FINIZEN);
    } WHEN {
        TURN { MOVE(player, MOVE_CELEBRATE); EXPECT_SWITCH(opponent, 1); }
    }
}

AI_SINGLE_BATTLE_TEST("Switch AI: AI will use pivot move to activate Palafin's Zero to Hero rather than hard switching")
{
    GIVEN {
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT);
        PLAYER(SPECIES_FINIZEN);
        OPPONENT(SPECIES_PALAFIN_ZERO) { Moves(MOVE_FLIP_TURN); }
        OPPONENT(SPECIES_FINIZEN);
    } WHEN {
        TURN { MOVE(player, MOVE_CELEBRATE); EXPECT_MOVE(opponent, MOVE_FLIP_TURN); EXPECT_SEND_OUT(opponent, 1); }
    }
}

AI_SINGLE_BATTLE_TEST("AI_FLAG_SMART_SWITCHING: AI won't send out defensive mon that can lose 1v1, or switch out a mon that can win 1v1 even with bad type matchup")
{
    PASSES_RANDOMLY(100, 100, RNG_AI_SWITCH_HASBADODDS);
    GIVEN {
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT | AI_FLAG_SMART_SWITCHING | AI_FLAG_SMART_MON_CHOICES | AI_FLAG_OMNISCIENT);
        PLAYER(SPECIES_PANPOUR) {
            Level(15);
            Moves(MOVE_WATER_PULSE, MOVE_PLAY_NICE, MOVE_FURY_SWIPES, MOVE_LICK);
            Item(ITEM_MYSTIC_WATER);
            Ability(ABILITY_GLUTTONY);
            Nature(NATURE_MODEST);
            HPIV(31);
            AttackIV(31);
            DefenseIV(31);
            SpAttackIV(31);
            SpDefenseIV(31);
            SpeedIV(31); }
        OPPONENT(SPECIES_RHYHORN) {
            Level(14);
            Moves(MOVE_ROCK_TOMB, MOVE_HORN_ATTACK, MOVE_BULLDOZE, MOVE_ROCK_SMASH);
            Item(ITEM_RINDO_BERRY);
            Ability(ABILITY_LIGHTNING_ROD);
            Nature(NATURE_ADAMANT);
            HPIV(31);
            AttackIV(31);
            DefenseIV(31);
            SpAttackIV(31);
            SpDefenseIV(31);
            SpeedIV(31); }
        OPPONENT(SPECIES_GLIGAR) {
            Level(15);
            Moves(MOVE_WING_ATTACK, MOVE_QUICK_ATTACK, MOVE_BULLDOZE);
            Item(ITEM_ORAN_BERRY);
            Ability(ABILITY_SAND_VEIL);
            Nature(NATURE_ADAMANT);
            HPIV(31);
            AttackIV(31);
            DefenseIV(31);
            SpAttackIV(31);
            SpDefenseIV(31);
            SpeedIV(31); }
        OPPONENT(SPECIES_WOOPER_PALDEA) {
            Level(15);
            Moves(MOVE_MUD_SHOT, MOVE_ACID_SPRAY, MOVE_YAWN, MOVE_SANDSTORM);
            Item(ITEM_ORAN_BERRY);
            Ability(ABILITY_WATER_ABSORB);
            Nature(NATURE_MODEST);
            HPIV(31);
            AttackIV(31);
            DefenseIV(31);
            SpAttackIV(31);
            SpDefenseIV(31);
            SpeedIV(31); }
    } WHEN {
        TURN { MOVE(player, MOVE_WATER_PULSE); EXPECT_MOVE(opponent, MOVE_BULLDOZE); EXPECT_SEND_OUT(opponent, 1); }
        TURN { MOVE(player, MOVE_WATER_PULSE); EXPECT_MOVE(opponent, MOVE_BULLDOZE); }
    }
}
