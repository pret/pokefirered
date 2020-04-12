#include "constants/battle.h"
#include "constants/battle_ai.h"
#include "constants/abilities.h"
#include "constants/items.h"
#include "constants/moves.h"
#include "constants/battle_move_effects.h"
#include "constants/hold_effects.h"
#include "constants/pokemon.h"
	.include "asm/macros/battle_ai_script.inc"

	.section script_data, "aw", %progbits

@ The FRLG scripts are improved subtly by Emerald in a few places
@ To make adding these improvements easier they are commented and tagged with "Improvement in Emerald"
@ Emerald also adds a few entirely new AI commands (mostly to expand Double Battle AI), which are not included

	.align 2
gBattleAI_ScriptsTable:: @ 81D9BF4
	.4byte AI_CheckBadMove
	.4byte AI_CheckViability
	.4byte AI_TryToFaint
	.4byte AI_SetupFirstTurn
	.4byte AI_Risky
	.4byte AI_PreferStrongestMove
	.4byte AI_PreferBatonPass
	.4byte AI_DoubleBattle
	.4byte AI_HPAware
	.4byte AI_Unknown
	.4byte AI_Ret
	.4byte AI_Ret
	.4byte AI_Ret
	.4byte AI_Ret
	.4byte AI_Ret
	.4byte AI_Ret
	.4byte AI_Ret
	.4byte AI_Ret
	.4byte AI_Ret
	.4byte AI_Ret
	.4byte AI_Ret
	.4byte AI_Ret
	.4byte AI_Ret
	.4byte AI_Ret
	.4byte AI_Ret
	.4byte AI_Ret
	.4byte AI_Ret
	.4byte AI_Ret
	.4byte AI_Ret
	.4byte AI_Roaming
	.4byte AI_Safari
	.4byte AI_FirstBattle

AI_CheckBadMove:: @ 81D9C74
@	if_move MOVE_FISSURE, AI_CBM_CheckIfNegatesType  @ Improvement in Emerald
@	if_move MOVE_HORN_DRILL, AI_CBM_CheckIfNegatesType
	get_how_powerful_move_is
	if_equal MOVE_POWER_DISCOURAGED, AI_CheckBadMove_CheckSoundproof

AI_CBM_CheckIfNegatesType::
	if_type_effectiveness AI_EFFECTIVENESS_x0, Score_Minus10
	get_ability AI_TARGET
	if_equal ABILITY_VOLT_ABSORB, CheckIfVoltAbsorbCancelsElectric
	if_equal ABILITY_WATER_ABSORB, CheckIfWaterAbsorbCancelsWater
	if_equal ABILITY_FLASH_FIRE, CheckIfFlashFireCancelsFire
	if_equal ABILITY_WONDER_GUARD, CheckIfWonderGuardCancelsMove
	if_equal ABILITY_LEVITATE, CheckIfLevitateCancelsGroundMove
	goto AI_CheckBadMove_CheckSoundproof

CheckIfVoltAbsorbCancelsElectric:: @ 81D9CA6
	get_curr_move_type
	if_equal_ TYPE_ELECTRIC, Score_Minus12
	goto AI_CheckBadMove_CheckSoundproof

CheckIfWaterAbsorbCancelsWater:: @ 81D9CB3
	get_curr_move_type
	if_equal_ TYPE_WATER, Score_Minus12
	goto AI_CheckBadMove_CheckSoundproof

CheckIfFlashFireCancelsFire:: @ 81D9CC0
	get_curr_move_type
	if_equal_ TYPE_FIRE, Score_Minus12
	goto AI_CheckBadMove_CheckSoundproof

CheckIfWonderGuardCancelsMove:: @ 81D9CCD
	if_type_effectiveness AI_EFFECTIVENESS_x2, AI_CheckBadMove_CheckSoundproof
	goto Score_Minus10

CheckIfLevitateCancelsGroundMove:: @ 81D9CD8
	get_curr_move_type
	if_equal_ TYPE_GROUND, Score_Minus10

AI_CheckBadMove_CheckSoundproof:: @ 81D9CE0
	get_ability AI_TARGET
	if_not_equal ABILITY_SOUNDPROOF, AI_CheckBadMove_CheckEffect
	if_move MOVE_GROWL, Score_Minus10
	if_move MOVE_ROAR, Score_Minus10
	if_move MOVE_SING, Score_Minus10
	if_move MOVE_SUPERSONIC, Score_Minus10
	if_move MOVE_SCREECH, Score_Minus10
	if_move MOVE_SNORE, Score_Minus10
	if_move MOVE_UPROAR, Score_Minus10
	if_move MOVE_METAL_SOUND, Score_Minus10
	if_move MOVE_GRASS_WHISTLE, Score_Minus10

AI_CheckBadMove_CheckEffect:: @ 81D9D27
	if_effect EFFECT_SLEEP, AI_CBM_Sleep
	if_effect EFFECT_EXPLOSION, AI_CBM_Explosion
	if_effect EFFECT_DREAM_EATER, AI_CBM_DreamEater
	if_effect EFFECT_ATTACK_UP, AI_CBM_AttackUp
	if_effect EFFECT_DEFENSE_UP, AI_CBM_DefenseUp
	if_effect EFFECT_SPEED_UP, AI_CBM_SpeedUp
	if_effect EFFECT_SPECIAL_ATTACK_UP, AI_CBM_SpAtkUp
	if_effect EFFECT_SPECIAL_DEFENSE_UP, AI_CBM_SpDefUp
	if_effect EFFECT_ACCURACY_UP, AI_CBM_AccUp
	if_effect EFFECT_EVASION_UP, AI_CBM_EvasionUp
	if_effect EFFECT_ATTACK_DOWN, AI_CBM_AttackDown
	if_effect EFFECT_DEFENSE_DOWN, AI_CBM_DefenseDown
	if_effect EFFECT_SPEED_DOWN, AI_CBM_SpeedDown
	if_effect EFFECT_SPECIAL_ATTACK_DOWN, AI_CBM_SpAtkDown
	if_effect EFFECT_SPECIAL_DEFENSE_DOWN, AI_CBM_SpDefDown
	if_effect EFFECT_ACCURACY_DOWN, AI_CBM_AccDown
	if_effect EFFECT_EVASION_DOWN, AI_CBM_EvasionDown
	if_effect EFFECT_HAZE, AI_CBM_Haze
	if_effect EFFECT_BIDE, AI_CBM_HighRiskForDamage
	if_effect EFFECT_ROAR, AI_CBM_Roar
	if_effect EFFECT_TOXIC, AI_CBM_Poison
	if_effect EFFECT_LIGHT_SCREEN, AI_CBM_LightScreen
	if_effect EFFECT_OHKO, AI_CBM_OneHitKO
	if_effect EFFECT_RAZOR_WIND, AI_CBM_HighRiskForDamage
	if_effect EFFECT_SUPER_FANG, AI_CBM_HighRiskForDamage
	if_effect EFFECT_MIST, AI_CBM_Mist
	if_effect EFFECT_FOCUS_ENERGY, AI_CBM_FocusEnergy
	if_effect EFFECT_CONFUSE, AI_CBM_Confuse
	if_effect EFFECT_ATTACK_UP_2, AI_CBM_AttackUp
	if_effect EFFECT_DEFENSE_UP_2, AI_CBM_DefenseUp
	if_effect EFFECT_SPEED_UP_2, AI_CBM_SpeedUp
	if_effect EFFECT_SPECIAL_ATTACK_UP_2, AI_CBM_SpAtkUp
	if_effect EFFECT_SPECIAL_DEFENSE_UP_2, AI_CBM_SpDefUp
	if_effect EFFECT_ACCURACY_UP_2, AI_CBM_AccUp
	if_effect EFFECT_EVASION_UP_2, AI_CBM_EvasionUp
	if_effect EFFECT_ATTACK_DOWN_2, AI_CBM_AttackDown
	if_effect EFFECT_DEFENSE_DOWN_2, AI_CBM_DefenseDown
	if_effect EFFECT_SPEED_DOWN_2, AI_CBM_SpeedDown
	if_effect EFFECT_SPECIAL_ATTACK_DOWN_2, AI_CBM_SpAtkDown
	if_effect EFFECT_SPECIAL_DEFENSE_DOWN_2, AI_CBM_SpDefDown
	if_effect EFFECT_ACCURACY_DOWN_2, AI_CBM_AccDown
	if_effect EFFECT_EVASION_DOWN_2, AI_CBM_EvasionDown
	if_effect EFFECT_REFLECT, AI_CBM_Reflect
	if_effect EFFECT_POISON, AI_CBM_Poison
	if_effect EFFECT_PARALYZE, AI_CBM_Paralyze
	if_effect EFFECT_SUBSTITUTE, AI_CBM_Substitute
	if_effect EFFECT_RECHARGE, AI_CBM_HighRiskForDamage
	if_effect EFFECT_LEECH_SEED, AI_CBM_LeechSeed
	if_effect EFFECT_DISABLE, AI_CBM_Disable
	if_effect EFFECT_LEVEL_DAMAGE, AI_CBM_HighRiskForDamage
	if_effect EFFECT_PSYWAVE, AI_CBM_HighRiskForDamage
	if_effect EFFECT_COUNTER, AI_CBM_HighRiskForDamage
	if_effect EFFECT_ENCORE, AI_CBM_Encore
	if_effect EFFECT_SNORE, AI_CBM_DamageDuringSleep
	if_effect EFFECT_SLEEP_TALK, AI_CBM_DamageDuringSleep
	if_effect EFFECT_FLAIL, AI_CBM_HighRiskForDamage
	if_effect EFFECT_MEAN_LOOK, AI_CBM_CantEscape
	if_effect EFFECT_NIGHTMARE, AI_CBM_Nightmare
	if_effect EFFECT_MINIMIZE, AI_CBM_EvasionUp
	if_effect EFFECT_CURSE, AI_CBM_Curse
	if_effect EFFECT_SPIKES, AI_CBM_Spikes
	if_effect EFFECT_FORESIGHT, AI_CBM_Foresight
	if_effect EFFECT_PERISH_SONG, AI_CBM_PerishSong
	if_effect EFFECT_SANDSTORM, AI_CBM_Sandstorm
	if_effect EFFECT_SWAGGER, AI_CBM_Confuse
	if_effect EFFECT_ATTRACT, AI_CBM_Attract
	if_effect EFFECT_RETURN, AI_CBM_HighRiskForDamage
	if_effect EFFECT_PRESENT, AI_CBM_HighRiskForDamage
	if_effect EFFECT_FRUSTRATION, AI_CBM_HighRiskForDamage
	if_effect EFFECT_SAFEGUARD, AI_CBM_Safeguard
	if_effect EFFECT_MAGNITUDE, AI_CBM_Magnitude
	if_effect EFFECT_BATON_PASS, AI_CBM_BatonPass
	if_effect EFFECT_SONICBOOM, AI_CBM_HighRiskForDamage
	if_effect EFFECT_RAIN_DANCE, AI_CBM_RainDance
	if_effect EFFECT_SUNNY_DAY, AI_CBM_SunnyDay
	if_effect EFFECT_BELLY_DRUM, AI_CBM_BellyDrum
	if_effect EFFECT_PSYCH_UP, AI_CBM_Haze
	if_effect EFFECT_MIRROR_COAT, AI_CBM_HighRiskForDamage
	if_effect EFFECT_SKULL_BASH, AI_CBM_HighRiskForDamage
	if_effect EFFECT_FUTURE_SIGHT, AI_CBM_FutureSight
	if_effect EFFECT_TELEPORT, Score_Minus10
	if_effect EFFECT_DEFENSE_CURL, AI_CBM_DefenseUp
	if_effect EFFECT_FAKE_OUT, AI_CBM_FakeOut
	if_effect EFFECT_STOCKPILE, AI_CBM_Stockpile
	if_effect EFFECT_SPIT_UP, AI_CBM_SpitUpAndSwallow
	if_effect EFFECT_SWALLOW, AI_CBM_SpitUpAndSwallow
	if_effect EFFECT_HAIL, AI_CBM_Hail
	if_effect EFFECT_TORMENT, AI_CBM_Torment
	if_effect EFFECT_FLATTER, AI_CBM_Confuse
	if_effect EFFECT_WILL_O_WISP, AI_CBM_WillOWisp
	if_effect EFFECT_MEMENTO, AI_CBM_Memento
	if_effect EFFECT_FOCUS_PUNCH, AI_CBM_HighRiskForDamage
	if_effect EFFECT_HELPING_HAND, AI_CBM_HelpingHand
	if_effect EFFECT_TRICK, AI_CBM_TrickAndKnockOff
	if_effect EFFECT_INGRAIN, AI_CBM_Ingrain
	if_effect EFFECT_SUPERPOWER, AI_CBM_HighRiskForDamage
	if_effect EFFECT_RECYCLE, AI_CBM_Recycle
	if_effect EFFECT_KNOCK_OFF, AI_CBM_TrickAndKnockOff
	if_effect EFFECT_ENDEAVOR, AI_CBM_HighRiskForDamage
	if_effect EFFECT_IMPRISON, AI_CBM_Imprison
	if_effect EFFECT_REFRESH, AI_CBM_Refresh
	if_effect EFFECT_LOW_KICK, AI_CBM_HighRiskForDamage
	if_effect EFFECT_MUD_SPORT, AI_CBM_MudSport
	if_effect EFFECT_TICKLE, AI_CBM_Tickle
	if_effect EFFECT_COSMIC_POWER, AI_CBM_CosmicPower
	if_effect EFFECT_BULK_UP, AI_CBM_BulkUp
	if_effect EFFECT_WATER_SPORT, AI_CBM_WaterSport
	if_effect EFFECT_CALM_MIND, AI_CBM_CalmMind
	if_effect EFFECT_DRAGON_DANCE, AI_CBM_DragonDance
	end

AI_CBM_Sleep:: @ 81D9FB6
	get_ability AI_TARGET
	if_equal ABILITY_INSOMNIA, Score_Minus10
	if_equal ABILITY_VITAL_SPIRIT, Score_Minus10
	if_status AI_TARGET, STATUS1_ANY, Score_Minus10
@	if_side_affecting AI_TARGET, SIDE_STATUS_SAFEGUARD, Score_Minus10  @ Improvement in Emerald
	end

AI_CBM_Explosion:: @ 81D9FCF
	if_type_effectiveness AI_EFFECTIVENESS_x0, Score_Minus10
	get_ability AI_TARGET
	if_equal ABILITY_DAMP, Score_Minus10
	count_alive_pokemon AI_USER
	if_not_equal 0, AI_CBM_Explosion_End
	count_alive_pokemon AI_TARGET
	if_not_equal 0, Score_Minus10
	goto Score_Minus1

AI_CBM_Explosion_End:: @ 81D9FF2
	end

AI_CBM_Nightmare:: @ 81D9FF3
	if_status2 AI_TARGET, STATUS2_NIGHTMARE, Score_Minus10
	if_not_status AI_TARGET, STATUS1_SLEEP, Score_Minus8
	end

AI_CBM_DreamEater:: @ 81DA008
	if_not_status AI_TARGET, STATUS1_SLEEP, Score_Minus8
	if_type_effectiveness AI_EFFECTIVENESS_x0, Score_Minus10
	end

AI_CBM_BellyDrum:: @ 81DA019
	if_hp_less_than AI_USER, 51, Score_Minus10

AI_CBM_AttackUp:: @ 81DA020
	if_stat_level_equal AI_USER, STAT_ATK, 12, Score_Minus10
	end

AI_CBM_DefenseUp:: @ 81DA029
	if_stat_level_equal AI_USER, STAT_DEF, 12, Score_Minus10
	end

AI_CBM_SpeedUp:: @ 81DA032
	if_stat_level_equal AI_USER, STAT_SPEED, 12, Score_Minus10
	end

AI_CBM_SpAtkUp:: @ 81DA03B
	if_stat_level_equal AI_USER, STAT_SPATK, 12, Score_Minus10
	end

AI_CBM_SpDefUp:: @ 81DA044
	if_stat_level_equal AI_USER, STAT_SPDEF, 12, Score_Minus10
	end

AI_CBM_AccUp:: @ 81DA04D
	if_stat_level_equal AI_USER, STAT_ACC, 12, Score_Minus10
	end

AI_CBM_EvasionUp:: @ 81DA056
	if_stat_level_equal AI_USER, STAT_EVASION, 12, Score_Minus10
	end

AI_CBM_AttackDown:: @ 81DA05F
	if_stat_level_equal AI_TARGET, STAT_ATK, 0, Score_Minus10
	get_ability AI_TARGET
	if_equal ABILITY_HYPER_CUTTER, Score_Minus10
	goto CheckIfAbilityBlocksStatChange

AI_CBM_DefenseDown:: @ 81DA074
	if_stat_level_equal AI_TARGET, STAT_DEF, 0, Score_Minus10
	goto CheckIfAbilityBlocksStatChange

AI_CBM_SpeedDown:: @ 81DA081
	if_stat_level_equal AI_TARGET, STAT_SPEED, 0, Score_Minus10
@	get_ability AI_TARGET  @ Improvement in Emerald
@	if_equal ABILITY_SPEED_BOOST, Score_Minus10
	goto CheckIfAbilityBlocksStatChange

AI_CBM_SpAtkDown:: @ 81DA08E
	if_stat_level_equal AI_TARGET, STAT_SPATK, 0, Score_Minus10
	goto CheckIfAbilityBlocksStatChange

AI_CBM_SpDefDown:: @ 81DA09B
	if_stat_level_equal AI_TARGET, STAT_SPDEF, 0, Score_Minus10
	goto CheckIfAbilityBlocksStatChange

AI_CBM_AccDown:: @ 81DA0A8
	if_stat_level_equal AI_TARGET, STAT_ACC, 0, Score_Minus10
	get_ability AI_TARGET
	if_equal ABILITY_KEEN_EYE, Score_Minus10
	goto CheckIfAbilityBlocksStatChange

AI_CBM_EvasionDown:: @ 81DA0BD
	if_stat_level_equal AI_TARGET, STAT_EVASION, 0, Score_Minus10

CheckIfAbilityBlocksStatChange:: @ 81DA0C5
	get_ability AI_TARGET
	if_equal ABILITY_CLEAR_BODY, Score_Minus10
	if_equal ABILITY_WHITE_SMOKE, Score_Minus10
	end

AI_CBM_Haze:: @ 81DA0D4
	if_stat_level_less_than AI_USER, STAT_ATK, 6, AI_CBM_Haze_End
	if_stat_level_less_than AI_USER, STAT_DEF, 6, AI_CBM_Haze_End
	if_stat_level_less_than AI_USER, STAT_SPEED, 6, AI_CBM_Haze_End
	if_stat_level_less_than AI_USER, STAT_SPATK, 6, AI_CBM_Haze_End
	if_stat_level_less_than AI_USER, STAT_SPDEF, 6, AI_CBM_Haze_End
	if_stat_level_less_than AI_USER, STAT_ACC, 6, AI_CBM_Haze_End
	if_stat_level_less_than AI_USER, STAT_EVASION, 6, AI_CBM_Haze_End
	if_stat_level_more_than AI_TARGET, STAT_ATK, 6, AI_CBM_Haze_End
	if_stat_level_more_than AI_TARGET, STAT_DEF, 6, AI_CBM_Haze_End
	if_stat_level_more_than AI_TARGET, STAT_SPEED, 6, AI_CBM_Haze_End
	if_stat_level_more_than AI_TARGET, STAT_SPATK, 6, AI_CBM_Haze_End
	if_stat_level_more_than AI_TARGET, STAT_SPDEF, 6, AI_CBM_Haze_End
	if_stat_level_more_than AI_TARGET, STAT_ACC, 6, AI_CBM_Haze_End
	if_stat_level_more_than AI_TARGET, STAT_EVASION, 6, AI_CBM_Haze_End
	goto Score_Minus10

AI_CBM_Haze_End:: @ 81DA149
	end

AI_CBM_Roar:: @ 81DA14A
	count_alive_pokemon AI_TARGET
	if_equal 0, Score_Minus10
	get_ability AI_TARGET
	if_equal ABILITY_SUCTION_CUPS, Score_Minus10
	end

AI_CBM_Poison:: @ 81DA15B
	get_target_type1
	if_equal TYPE_STEEL, Score_Minus10
	if_equal TYPE_POISON, Score_Minus10
	get_target_type2
	if_equal TYPE_STEEL, Score_Minus10
	if_equal TYPE_POISON, Score_Minus10
	get_ability AI_TARGET
	if_equal ABILITY_IMMUNITY, Score_Minus10
	if_status AI_TARGET, STATUS1_ANY, Score_Minus10
@	if_side_affecting AI_TARGET, SIDE_STATUS_SAFEGUARD, Score_Minus10  @ Improvement in Emerald
	end

AI_CBM_LightScreen:: @ 81DA18A
	if_side_affecting AI_USER, SIDE_STATUS_LIGHTSCREEN, Score_Minus8
	end

AI_CBM_OneHitKO:: @ 81DA195
	if_type_effectiveness AI_EFFECTIVENESS_x0, Score_Minus10
	get_ability AI_TARGET
	if_equal ABILITY_STURDY, Score_Minus10
	if_level_cond 1, Score_Minus10
	end

AI_CBM_Magnitude:: @ 81DA1AA
	get_ability AI_TARGET
	if_equal ABILITY_LEVITATE, Score_Minus10

AI_CBM_HighRiskForDamage:: @ 81DA1B2
	if_type_effectiveness AI_EFFECTIVENESS_x0, Score_Minus10
	get_ability AI_TARGET
	if_not_equal ABILITY_WONDER_GUARD, AI_CBM_HighRiskForDamage_End
	if_type_effectiveness AI_EFFECTIVENESS_x2, AI_CBM_HighRiskForDamage_End
	goto Score_Minus10

AI_CBM_HighRiskForDamage_End:: @ 81DA1CB
	end

AI_CBM_Mist:: @ 81DA1CC
	if_side_affecting AI_USER, SIDE_STATUS_MIST, Score_Minus8
	end

AI_CBM_FocusEnergy:: @ 81DA1D7
	if_status2 AI_USER, STATUS2_FOCUS_ENERGY, Score_Minus10
	end

AI_CBM_Confuse:: @ 81DA1E2
	if_status2 AI_TARGET, STATUS2_CONFUSION, Score_Minus5
	get_ability AI_TARGET
	if_equal ABILITY_OWN_TEMPO, Score_Minus10
@	if_side_affecting AI_TARGET, SIDE_STATUS_SAFEGUARD, Score_Minus10  @ Improvement in Emerald
	end

AI_CBM_Reflect:: @ 81DA1F5
	if_side_affecting AI_USER, SIDE_STATUS_REFLECT, Score_Minus8
	end

AI_CBM_Paralyze:: @ 81DA200
	if_type_effectiveness AI_EFFECTIVENESS_x0, Score_Minus10
	get_ability AI_TARGET
	if_equal ABILITY_LIMBER, Score_Minus10
	if_status AI_TARGET, STATUS1_ANY, Score_Minus10
@	if_side_affecting AI_TARGET, SIDE_STATUS_SAFEGUARD, Score_Minus10  @ Improvement in Emerald
	end

AI_CBM_Substitute:: @ 81DA219
	if_status2 AI_USER, STATUS2_SUBSTITUTE, Score_Minus8
	if_hp_less_than AI_USER, 26, Score_Minus10
	end

AI_CBM_LeechSeed:: @ 81DA22B
	if_status3 AI_TARGET, STATUS3_LEECHSEED, Score_Minus10
	get_target_type1
	if_equal TYPE_GRASS, Score_Minus10
	get_target_type2
	if_equal TYPE_GRASS, Score_Minus10
	end

AI_CBM_Disable:: @ 81DA246
	if_any_move_disabled AI_TARGET, Score_Minus8
	end

AI_CBM_Encore:: @ 81DA24E
	if_any_move_encored AI_TARGET, Score_Minus8
	end

AI_CBM_DamageDuringSleep:: @ 81DA256
	if_not_status AI_USER, STATUS1_SLEEP, Score_Minus8
	end

AI_CBM_CantEscape:: @ 81DA261
	if_status2 AI_TARGET, STATUS2_ESCAPE_PREVENTION, Score_Minus10
	end

AI_CBM_Curse:: @ 81DA26C
	if_stat_level_equal AI_USER, STAT_ATK, 12, Score_Minus10
	if_stat_level_equal AI_USER, STAT_DEF, 12, Score_Minus8
	end

AI_CBM_Spikes:: @ 81DA27D
	if_side_affecting AI_TARGET, SIDE_STATUS_SPIKES, Score_Minus10
	end

AI_CBM_Foresight:: @ 81DA288
	if_status2 AI_TARGET, STATUS2_FORESIGHT, Score_Minus10
	end

AI_CBM_PerishSong:: @ 81DA293
	if_status3 AI_TARGET, STATUS3_PERISH_SONG, Score_Minus10
	end

AI_CBM_Sandstorm:: @ 81DA29E
	get_weather
	if_equal AI_WEATHER_SANDSTORM, Score_Minus8
	end

AI_CBM_Attract:: @ 81DA2A6
	if_status2 AI_TARGET, STATUS2_INFATUATION, Score_Minus10
	get_ability AI_TARGET
	if_equal ABILITY_OBLIVIOUS, Score_Minus10
	get_gender AI_USER
	if_equal MON_MALE, AI_CBM_Attract_CheckIfTargetIsFemale
	if_equal MON_FEMALE, AI_CBM_Attract_CheckIfTargetIsMale
	goto Score_Minus10

AI_CBM_Attract_CheckIfTargetIsFemale:: @ 81DA2CB
	get_gender AI_TARGET
	if_equal MON_FEMALE, AI_CBM_Attract_End
	goto Score_Minus10

AI_CBM_Attract_CheckIfTargetIsMale:: @ 81DA2D8
	get_gender AI_TARGET
	if_equal MON_MALE, AI_CBM_Attract_End
	goto Score_Minus10

AI_CBM_Attract_End:: @ 81DA2E5
	end

AI_CBM_Safeguard:: @ 81DA2E6
	if_side_affecting AI_USER, SIDE_STATUS_SAFEGUARD, Score_Minus8
	end

AI_CBM_Memento:: @ 81DA2F1
	if_stat_level_equal AI_TARGET, STAT_ATK, 0, Score_Minus10
	if_stat_level_equal AI_TARGET, STAT_SPATK, 0, Score_Minus8

AI_CBM_BatonPass:: @ 81DA301
	count_alive_pokemon AI_USER
	if_equal 0, Score_Minus10
	end

AI_CBM_RainDance:: @ 81DA30A
	get_weather
	if_equal AI_WEATHER_RAIN, Score_Minus8
	end

AI_CBM_SunnyDay:: @ 81DA312
	get_weather
	if_equal AI_WEATHER_SUN, Score_Minus8
	end

AI_CBM_FutureSight:: @ 81DA31A
	if_side_affecting AI_TARGET, SIDE_STATUS_FUTUREATTACK, Score_Minus10
@	if_side_affecting AI_USER, SIDE_STATUS_FUTUREATTACK, Score_Minus12  @ Improvement in Emerald
	end

AI_CBM_FakeOut:: @ 81DA325
	is_first_turn_for AI_USER
	if_equal 0, Score_Minus10
	end

AI_CBM_Stockpile:: @ 81DA32E
	get_stockpile_count AI_USER
	if_equal 3, Score_Minus10
	end

AI_CBM_SpitUpAndSwallow:: @ 81DA337
	if_type_effectiveness AI_EFFECTIVENESS_x0, Score_Minus10
	get_stockpile_count AI_USER
	if_equal 0, Score_Minus10
	end

AI_CBM_Hail:: @ 81DA346
	get_weather
	if_equal AI_WEATHER_HAIL, Score_Minus8
	end

AI_CBM_Torment:: @ 81DA34E
	if_status2 AI_TARGET, STATUS2_TORMENT, Score_Minus10
	end

AI_CBM_WillOWisp:: @ 81DA359
	get_ability AI_TARGET
	if_equal ABILITY_WATER_VEIL, Score_Minus10
	if_status AI_TARGET, STATUS1_ANY, Score_Minus10
	if_type_effectiveness AI_EFFECTIVENESS_x0, Score_Minus10
	if_type_effectiveness AI_EFFECTIVENESS_x0_5, Score_Minus10
	if_type_effectiveness AI_EFFECTIVENESS_x0_25, Score_Minus10
@	if_side_affecting AI_TARGET, SIDE_STATUS_SAFEGUARD, Score_Minus10  @ Improvement in Emerald
	end

AI_CBM_HelpingHand:: @ 81DA37E
	if_not_double_battle Score_Minus10
	end

AI_CBM_TrickAndKnockOff:: @ 81DA386
	get_ability AI_TARGET
	if_equal ABILITY_STICKY_HOLD, Score_Minus10
	end

AI_CBM_Ingrain:: @ 81DA38F
	if_status3 AI_USER, STATUS3_ROOTED, Score_Minus10
	end

AI_CBM_Recycle:: @ 81DA39A
	get_used_held_item AI_USER
	if_equal ITEM_NONE, Score_Minus10
	end

AI_CBM_Imprison:: @ 81DA3A3
	if_status3 AI_USER, STATUS3_IMPRISONED_OTHERS, Score_Minus10
	end

AI_CBM_Refresh:: @ 81DA3AE
	if_not_status AI_USER, STATUS1_POISON | STATUS1_BURN | STATUS1_PARALYSIS | STATUS1_TOXIC_POISON, Score_Minus10
	end

AI_CBM_MudSport:: @ 81DA3B9
	if_status3 AI_USER, STATUS3_MUDSPORT, Score_Minus10
	end

AI_CBM_Tickle:: @ 81DA3C4
	if_stat_level_equal AI_TARGET, STAT_ATK, 0, Score_Minus10
	if_stat_level_equal AI_TARGET, STAT_DEF, 0, Score_Minus8
	end

AI_CBM_CosmicPower:: @ 81DA3D5
	if_stat_level_equal AI_USER, STAT_DEF, 12, Score_Minus10
	if_stat_level_equal AI_USER, STAT_SPDEF, 12, Score_Minus8
	end

AI_CBM_BulkUp:: @ 81DA3E6
	if_stat_level_equal AI_USER, STAT_ATK, 12, Score_Minus10
	if_stat_level_equal AI_USER, STAT_DEF, 12, Score_Minus8
	end

AI_CBM_WaterSport:: @ 81DA3F7
	if_status3 AI_USER, STATUS3_WATERSPORT, Score_Minus10
	end

AI_CBM_CalmMind:: @ 81DA402
	if_stat_level_equal AI_USER, STAT_SPATK, 12, Score_Minus10
	if_stat_level_equal AI_USER, STAT_SPDEF, 12, Score_Minus8
	end

AI_CBM_DragonDance:: @ 81DA413
	if_stat_level_equal AI_USER, STAT_ATK, 12, Score_Minus10
	if_stat_level_equal AI_USER, STAT_SPEED, 12, Score_Minus8
	end

Score_Minus1:: @ 81DA424
	score -1
	end

Score_Minus2:: @ 81DA427
	score -2
	end

Score_Minus3:: @ 81DA42A
	score -3
	end

Score_Minus5:: @ 81DA42D
	score -5
	end

Score_Minus8:: @ 81DA430
	score -8
	end

Score_Minus10:: @ 81DA433
	score -10
	end

Score_Minus12:: @ 81DA436
	score -12
	end

Score_Plus1::
	score +1
	end

Score_Plus2::
	score +2
	end

Score_Plus3::
	score +3
	end

Score_Plus5::
	score +5
	end

@ Improvement in Emerald
@Score_Plus10::
@	score +10
@	end

AI_CheckViability:: @ 81DA445
	if_effect EFFECT_SLEEP, AI_CV_Sleep
	if_effect EFFECT_ABSORB, AI_CV_Absorb
	if_effect EFFECT_EXPLOSION, AI_CV_SelfKO
	if_effect EFFECT_DREAM_EATER, AI_CV_DreamEater
	if_effect EFFECT_MIRROR_MOVE, AI_CV_MirrorMove
	if_effect EFFECT_ATTACK_UP, AI_CV_AttackUp
	if_effect EFFECT_DEFENSE_UP, AI_CV_DefenseUp
	if_effect EFFECT_SPEED_UP, AI_CV_SpeedUp
	if_effect EFFECT_SPECIAL_ATTACK_UP, AI_CV_SpAtkUp
	if_effect EFFECT_SPECIAL_DEFENSE_UP, AI_CV_SpDefUp
	if_effect EFFECT_ACCURACY_UP, AI_CV_AccuracyUp
	if_effect EFFECT_EVASION_UP, AI_CV_EvasionUp
	if_effect EFFECT_ALWAYS_HIT, AI_CV_AlwaysHit
	if_effect EFFECT_ATTACK_DOWN, AI_CV_AttackDown
	if_effect EFFECT_DEFENSE_DOWN, AI_CV_DefenseDown
	if_effect EFFECT_SPEED_DOWN, AI_CV_SpeedDown
	if_effect EFFECT_SPECIAL_ATTACK_DOWN, AI_CV_SpAtkDown
	if_effect EFFECT_SPECIAL_DEFENSE_DOWN, AI_CV_SpDefDown
	if_effect EFFECT_ACCURACY_DOWN, AI_CV_AccuracyDown
	if_effect EFFECT_EVASION_DOWN, AI_CV_EvasionDown
	if_effect EFFECT_HAZE, AI_CV_Haze
	if_effect EFFECT_BIDE, AI_CV_Bide
	if_effect EFFECT_ROAR, AI_CV_Roar
	if_effect EFFECT_CONVERSION, AI_CV_Conversion
	if_effect EFFECT_RESTORE_HP, AI_CV_Heal
	if_effect EFFECT_TOXIC, AI_CV_Toxic
	if_effect EFFECT_LIGHT_SCREEN, AI_CV_LightScreen
	if_effect EFFECT_REST, AI_CV_Rest
	if_effect EFFECT_OHKO, AI_CV_OneHitKO
	if_effect EFFECT_RAZOR_WIND, AI_CV_ChargeUpMove
	if_effect EFFECT_SUPER_FANG, AI_CV_SuperFang
	if_effect EFFECT_TRAP, AI_CV_Trap
	if_effect EFFECT_HIGH_CRITICAL, AI_CV_HighCrit
	if_effect EFFECT_CONFUSE, AI_CV_Confuse
	if_effect EFFECT_ATTACK_UP_2, AI_CV_AttackUp
	if_effect EFFECT_DEFENSE_UP_2, AI_CV_DefenseUp
	if_effect EFFECT_SPEED_UP_2, AI_CV_SpeedUp
	if_effect EFFECT_SPECIAL_ATTACK_UP_2, AI_CV_SpAtkUp
	if_effect EFFECT_SPECIAL_DEFENSE_UP_2, AI_CV_SpDefUp
	if_effect EFFECT_ACCURACY_UP_2, AI_CV_AccuracyUp
	if_effect EFFECT_EVASION_UP_2, AI_CV_EvasionUp
	if_effect EFFECT_ATTACK_DOWN_2, AI_CV_AttackDown
	if_effect EFFECT_DEFENSE_DOWN_2, AI_CV_DefenseDown
	if_effect EFFECT_SPEED_DOWN_2, AI_CV_SpeedDown
	if_effect EFFECT_SPECIAL_ATTACK_DOWN_2, AI_CV_SpAtkDown
	if_effect EFFECT_SPECIAL_DEFENSE_DOWN_2, AI_CV_SpDefDown
	if_effect EFFECT_ACCURACY_DOWN_2, AI_CV_AccuracyDown
	if_effect EFFECT_EVASION_DOWN_2, AI_CV_EvasionDown
	if_effect EFFECT_REFLECT, AI_CV_Reflect
	if_effect EFFECT_POISON, AI_CV_Poison
	if_effect EFFECT_PARALYZE, AI_CV_Paralyze
	@ if_effect EFFECT_SWAGGER, AI_CV_Swagger  @ Improvement in Emerald
	if_effect EFFECT_SPEED_DOWN_HIT, AI_CV_SpeedDownFromChance
	if_effect EFFECT_SKY_ATTACK, AI_CV_ChargeUpMove
	if_effect EFFECT_VITAL_THROW, AI_CV_VitalThrow
	if_effect EFFECT_SUBSTITUTE, AI_CV_Substitute
	if_effect EFFECT_RECHARGE, AI_CV_Recharge
	if_effect EFFECT_LEECH_SEED, AI_CV_Toxic
	if_effect EFFECT_DISABLE, AI_CV_Disable
	if_effect EFFECT_COUNTER, AI_CV_Counter
	if_effect EFFECT_ENCORE, AI_CV_Encore
	if_effect EFFECT_PAIN_SPLIT, AI_CV_PainSplit
	if_effect EFFECT_SNORE, AI_CV_Snore
	if_effect EFFECT_LOCK_ON, AI_CV_LockOn
	if_effect EFFECT_SLEEP_TALK, AI_CV_SleepTalk
	if_effect EFFECT_DESTINY_BOND, AI_CV_DestinyBond
	if_effect EFFECT_FLAIL, AI_CV_Flail
	if_effect EFFECT_HEAL_BELL, AI_CV_HealBell
	if_effect EFFECT_THIEF, AI_CV_Thief
	if_effect EFFECT_MEAN_LOOK, AI_CV_Trap
	if_effect EFFECT_MINIMIZE, AI_CV_EvasionUp
	if_effect EFFECT_CURSE, AI_CV_Curse
	if_effect EFFECT_PROTECT, AI_CV_Protect
	if_effect EFFECT_FORESIGHT, AI_CV_Foresight
	if_effect EFFECT_ENDURE, AI_CV_Endure
	if_effect EFFECT_BATON_PASS, AI_CV_BatonPass
	if_effect EFFECT_PURSUIT, AI_CV_Pursuit
	if_effect EFFECT_MORNING_SUN, AI_CV_HealWeather
	if_effect EFFECT_SYNTHESIS, AI_CV_HealWeather
	if_effect EFFECT_MOONLIGHT, AI_CV_HealWeather
	if_effect EFFECT_RAIN_DANCE, AI_CV_RainDance
	if_effect EFFECT_SUNNY_DAY, AI_CV_SunnyDay
	if_effect EFFECT_BELLY_DRUM, AI_CV_BellyDrum
	if_effect EFFECT_PSYCH_UP, AI_CV_PsychUp
	if_effect EFFECT_MIRROR_COAT, AI_CV_MirrorCoat
	if_effect EFFECT_SKULL_BASH, AI_CV_ChargeUpMove
	if_effect EFFECT_SOLARBEAM, AI_CV_ChargeUpMove
	if_effect EFFECT_SEMI_INVULNERABLE, AI_CV_SemiInvulnerable
	if_effect EFFECT_SOFTBOILED, AI_CV_Heal
	if_effect EFFECT_FAKE_OUT, AI_CV_FakeOut
	if_effect EFFECT_SPIT_UP, AI_CV_SpitUp
	if_effect EFFECT_SWALLOW, AI_CV_Heal
	if_effect EFFECT_HAIL, AI_CV_Hail
	if_effect EFFECT_FLATTER, AI_CV_Flatter
	if_effect EFFECT_MEMENTO, AI_CV_SelfKO
	if_effect EFFECT_FACADE, AI_CV_Facade
	if_effect EFFECT_FOCUS_PUNCH, AI_CV_FocusPunch
	if_effect EFFECT_SMELLINGSALT, AI_CV_SmellingSalt
	if_effect EFFECT_TRICK, AI_CV_Trick
	if_effect EFFECT_ROLE_PLAY, AI_CV_ChangeSelfAbility
	if_effect EFFECT_SUPERPOWER, AI_CV_Superpower
	if_effect EFFECT_MAGIC_COAT, AI_CV_MagicCoat
	if_effect EFFECT_RECYCLE, AI_CV_Recycle
	if_effect EFFECT_REVENGE, AI_CV_Revenge
	if_effect EFFECT_BRICK_BREAK, AI_CV_BrickBreak
	if_effect EFFECT_KNOCK_OFF, AI_CV_KnockOff
	if_effect EFFECT_ENDEAVOR, AI_CV_Endeavor
	if_effect EFFECT_ERUPTION, AI_CV_Eruption
	if_effect EFFECT_SKILL_SWAP, AI_CV_ChangeSelfAbility
	if_effect EFFECT_IMPRISON, AI_CV_Imprison
	if_effect EFFECT_REFRESH, AI_CV_Refresh
	if_effect EFFECT_SNATCH, AI_CV_Snatch
	if_effect EFFECT_BLAZE_KICK, AI_CV_HighCrit
	if_effect EFFECT_MUD_SPORT, AI_CV_MudSport
	if_effect EFFECT_OVERHEAT, AI_CV_Overheat
	if_effect EFFECT_TICKLE, AI_CV_DefenseDown
	if_effect EFFECT_COSMIC_POWER, AI_CV_SpDefUp
	if_effect EFFECT_BULK_UP, AI_CV_DefenseUp
	if_effect EFFECT_POISON_TAIL, AI_CV_HighCrit
	if_effect EFFECT_WATER_SPORT, AI_CV_WaterSport
	if_effect EFFECT_CALM_MIND, AI_CV_SpDefUp
	if_effect EFFECT_DRAGON_DANCE, AI_CV_DragonDance
	end

AI_CV_Sleep:: @ 81DA71C
	if_has_move_with_effect AI_TARGET, EFFECT_DREAM_EATER, AI_CV_SleepEncourageSlpDamage
	if_has_move_with_effect AI_TARGET, EFFECT_NIGHTMARE, AI_CV_SleepEncourageSlpDamage
	goto AI_CV_Sleep_End

AI_CV_SleepEncourageSlpDamage:: @ 81DA72F
	if_random_less_than 128, AI_CV_Sleep_End
	score +1

AI_CV_Sleep_End:: @ 81DA737
	end

AI_CV_Absorb:: @ 81DA738
	if_type_effectiveness AI_EFFECTIVENESS_x0_5, AI_CV_AbsorbEncourageMaybe
	if_type_effectiveness AI_EFFECTIVENESS_x0_25, AI_CV_AbsorbEncourageMaybe
	goto AI_CV_Absorb_End

AI_CV_AbsorbEncourageMaybe:: @ 81DA749
	if_random_less_than 50, AI_CV_Absorb_End
	score -3

AI_CV_Absorb_End:: @ 81DA751
	end

AI_CV_SelfKO:: @ 81DA752
	if_stat_level_less_than AI_TARGET, STAT_EVASION, 7, AI_CV_SelfKO_Encourage1
	score -1
	if_stat_level_less_than AI_TARGET, STAT_EVASION, 10, AI_CV_SelfKO_Encourage1
	if_random_less_than 128, AI_CV_SelfKO_Encourage1
	score -1

AI_CV_SelfKO_Encourage1:: @ 81DA76C
	if_hp_less_than AI_USER, 80, AI_CV_SelfKO_Encourage2
	if_target_faster AI_CV_SelfKO_Encourage2
	if_random_less_than 50, AI_CV_SelfKO_End
	goto Score_Minus3

AI_CV_SelfKO_Encourage2:: @ 81DA784
	if_hp_more_than AI_USER, 50, AI_CV_SelfKO_Encourage4
	if_random_less_than 128, AI_CV_SelfKO_Encourage3
	score +1

AI_CV_SelfKO_Encourage3:: @ 81DA793
	if_hp_more_than AI_USER, 30, AI_CV_SelfKO_End
	if_random_less_than 50, AI_CV_SelfKO_End
	score +1
	goto AI_CV_SelfKO_End

AI_CV_SelfKO_Encourage4:: @ 81DA7A7
	if_random_less_than 50, AI_CV_SelfKO_End
	score -1

AI_CV_SelfKO_End:: @ 81DA7AF
	end

AI_CV_DreamEater:: @ 81DA7B0
	if_type_effectiveness AI_EFFECTIVENESS_x0_25, AI_CV_DreamEater_ScoreDown1
	if_type_effectiveness AI_EFFECTIVENESS_x0_5, AI_CV_DreamEater_ScoreDown1
	goto AI_CV_DreamEater_End

AI_CV_DreamEater_ScoreDown1:: @ 81DA7C1
	score -1

AI_CV_DreamEater_End:: @ 81DA7C3
	end

AI_CV_MirrorMove:: @ 81DA7C4
	if_target_faster AI_CV_MirrorMove2
	get_last_used_move AI_TARGET
	if_not_in_hwords AI_CV_MirrorMove_EncouragedMovesToMirror, AI_CV_MirrorMove2
	if_random_less_than 128, AI_CV_MirrorMove_End
	score +2
	goto AI_CV_MirrorMove_End

AI_CV_MirrorMove2:: @ 81DA7E2
	get_last_used_move AI_TARGET
	if_in_hwords AI_CV_MirrorMove_EncouragedMovesToMirror, AI_CV_MirrorMove_End
	if_random_less_than 80, AI_CV_MirrorMove_End
	score -1

AI_CV_MirrorMove_End:: @ 81DA7F5
	end

	.space 2
AI_CV_MirrorMove_EncouragedMovesToMirror:: @ 81DA7F8
	.align 1
	.2byte MOVE_SLEEP_POWDER
	.2byte MOVE_LOVELY_KISS
	.2byte MOVE_SPORE
	.2byte MOVE_HYPNOSIS
	.2byte MOVE_SING
	.2byte MOVE_GRASS_WHISTLE
	.2byte MOVE_SHADOW_PUNCH
	.2byte MOVE_SAND_ATTACK
	.2byte MOVE_SMOKESCREEN
	.2byte MOVE_TOXIC
	.2byte MOVE_GUILLOTINE
	.2byte MOVE_HORN_DRILL
	.2byte MOVE_FISSURE
	.2byte MOVE_SHEER_COLD
	.2byte MOVE_CROSS_CHOP
	.2byte MOVE_AEROBLAST
	.2byte MOVE_CONFUSE_RAY
	.2byte MOVE_SWEET_KISS
	.2byte MOVE_SCREECH
	.2byte MOVE_COTTON_SPORE
	.2byte MOVE_SCARY_FACE
	.2byte MOVE_FAKE_TEARS
	.2byte MOVE_METAL_SOUND
	.2byte MOVE_THUNDER_WAVE
	.2byte MOVE_GLARE
	.2byte MOVE_POISON_POWDER
	.2byte MOVE_SHADOW_BALL
	.2byte MOVE_DYNAMIC_PUNCH
	.2byte MOVE_HYPER_BEAM
	.2byte MOVE_EXTREME_SPEED
	.2byte MOVE_THIEF
	.2byte MOVE_COVET
	.2byte MOVE_ATTRACT
	.2byte MOVE_SWAGGER
	.2byte MOVE_TORMENT
	.2byte MOVE_FLATTER
	.2byte MOVE_TRICK
	.2byte MOVE_SUPERPOWER
	.2byte MOVE_SKILL_SWAP
	.2byte -1

AI_CV_AttackUp:: @ 81DA848
	if_stat_level_less_than AI_USER, STAT_ATK, 9, AI_CV_AttackUp2
	if_random_less_than 100, AI_CV_AttackUp3
	score -1
	goto AI_CV_AttackUp3

AI_CV_AttackUp2:: @ 81DA85D
	if_hp_not_equal AI_USER, 100, AI_CV_AttackUp3
	if_random_less_than 128, AI_CV_AttackUp3
	score +2

AI_CV_AttackUp3:: @ 81DA86C
	if_hp_more_than AI_USER, 70, AI_CV_AttackUp_End
	if_hp_less_than AI_USER, 40, AI_CV_AttackUp_ScoreDown2
	if_random_less_than 40, AI_CV_AttackUp_End

AI_CV_AttackUp_ScoreDown2:: @ 81DA880
	score -2

AI_CV_AttackUp_End:: @ 81DA882
	end

AI_CV_DefenseUp:: @ 81DA883
	if_stat_level_less_than AI_USER, STAT_DEF, 9, AI_CV_DefenseUp2
	if_random_less_than 100, AI_CV_DefenseUp3
	score -1
	goto AI_CV_DefenseUp3

AI_CV_DefenseUp2:: @ 81DA898
	if_hp_not_equal AI_USER, 100, AI_CV_DefenseUp3
	if_random_less_than 128, AI_CV_DefenseUp3
	score +2

AI_CV_DefenseUp3:: @ 81DA8A7
	if_hp_less_than AI_USER, 70, AI_CV_DefenseUp4
	if_random_less_than 200, AI_CV_DefenseUp_End

AI_CV_DefenseUp4:: @ 81DA8B4
	if_hp_less_than AI_USER, 40, AI_CV_DefenseUp_ScoreDown2
	get_last_used_move AI_TARGET
	get_move_power_from_result
	if_equal 0, AI_CV_DefenseUp5
	get_last_used_move AI_TARGET
	get_move_type_from_result
	if_not_in_bytes AI_CV_DefenseUp_PhysicalTypes, AI_CV_DefenseUp_ScoreDown2
	if_random_less_than 60, AI_CV_DefenseUp_End

AI_CV_DefenseUp5:: @ 81DA8D6
	if_random_less_than 60, AI_CV_DefenseUp_End

AI_CV_DefenseUp_ScoreDown2:: @ 81DA8DC
	score -2

AI_CV_DefenseUp_End:: @ 81DA8DE
	end

AI_CV_DefenseUp_PhysicalTypes:: @ 81DA8DF
	.byte TYPE_NORMAL
	.byte TYPE_FIGHTING
	.byte TYPE_POISON
	.byte TYPE_GROUND
	.byte TYPE_FLYING
	.byte TYPE_ROCK
	.byte TYPE_BUG
	.byte TYPE_GHOST
	.byte TYPE_STEEL
	.byte -1

AI_CV_SpeedUp:: @ 81DA8E9
	if_target_faster AI_CV_SpeedUp2
	score -3
	goto AI_CV_SpeedUp_End

AI_CV_SpeedUp2:: @ 81DA8F6
	if_random_less_than 70, AI_CV_SpeedUp_End
	score +3

AI_CV_SpeedUp_End:: @ 81DA8FE
	end

AI_CV_SpAtkUp:: @ 81DA8FF
	if_stat_level_less_than AI_USER, STAT_SPATK, 9, AI_CV_SpAtkUp2
	if_random_less_than 100, AI_CV_SpAtkUp3
	score -1
	goto AI_CV_SpAtkUp3

AI_CV_SpAtkUp2:: @ 81DA914
	if_hp_not_equal AI_USER, 100, AI_CV_SpAtkUp3
	if_random_less_than 128, AI_CV_SpAtkUp3
	score +2

AI_CV_SpAtkUp3:: @ 81DA923
	if_hp_more_than AI_USER, 70, AI_CV_SpAtkUp_End
	if_hp_less_than AI_USER, 40, AI_CV_SpAtkUp_ScoreDown2
	if_random_less_than 70, AI_CV_SpAtkUp_End

AI_CV_SpAtkUp_ScoreDown2:: @ 81DA937
	score -2

AI_CV_SpAtkUp_End:: @ 81DA939
	end

AI_CV_SpDefUp:: @ 81DA93A
	if_stat_level_less_than AI_USER, STAT_SPDEF, 9, AI_CV_SpDefUp2
	if_random_less_than 100, AI_CV_SpDefUp3
	score -1
	goto AI_CV_SpDefUp3

AI_CV_SpDefUp2:: @ 81DA94F
	if_hp_not_equal AI_USER, 100, AI_CV_SpDefUp3
	if_random_less_than 128, AI_CV_SpDefUp3
	score +2

AI_CV_SpDefUp3:: @ 81DA95E
	if_hp_less_than AI_USER, 70, AI_CV_SpDefUp4
	if_random_less_than 200, AI_CV_SpDefUp_End

AI_CV_SpDefUp4:: @ 81DA96B
	if_hp_less_than AI_USER, 40, AI_CV_SpDefUp_ScoreDown2
	get_last_used_move AI_TARGET
	get_move_power_from_result
	if_equal 0, AI_CV_SpDefUp5
	get_last_used_move AI_TARGET
	get_move_type_from_result
	if_in_bytes AI_CV_SpDefUp_PhysicalTypes, AI_CV_SpDefUp_ScoreDown2
	if_random_less_than 60, AI_CV_SpDefUp_End

AI_CV_SpDefUp5:: @ 81DA98D
	if_random_less_than 60, AI_CV_SpDefUp_End

AI_CV_SpDefUp_ScoreDown2:: @ 81DA993
	score -2

AI_CV_SpDefUp_End:: @ 81DA995
	end

AI_CV_SpDefUp_PhysicalTypes:: @ 81DA996
	.byte TYPE_NORMAL
	.byte TYPE_FIGHTING
	.byte TYPE_POISON
	.byte TYPE_GROUND
	.byte TYPE_FLYING
	.byte TYPE_ROCK
	.byte TYPE_BUG
	.byte TYPE_GHOST
	.byte TYPE_STEEL
	.byte -1

AI_CV_AccuracyUp:: @ 81DA9A0
	if_stat_level_less_than AI_USER, STAT_ACC, 9, AI_CV_AccuracyUp2
	if_random_less_than 50, AI_CV_AccuracyUp2
	score -2

AI_CV_AccuracyUp2:: @ 81DA9B0
	if_hp_more_than AI_USER, 70, AI_CV_AccuracyUp_End
	score -2

AI_CV_AccuracyUp_End:: @ 81DA9B9
	end

AI_CV_EvasionUp:: @ 81DA9BA
	if_hp_less_than AI_USER, 90, AI_CV_EvasionUp2
	if_random_less_than 100, AI_CV_EvasionUp2
	score +3

AI_CV_EvasionUp2:: @ 81DA9C9
	if_stat_level_less_than AI_USER, STAT_EVASION, 9, AI_CV_EvasionUp3
	if_random_less_than 128, AI_CV_EvasionUp3
	score -1

AI_CV_EvasionUp3:: @ 81DA9D9
	if_not_status AI_TARGET, STATUS1_TOXIC_POISON, AI_CV_EvasionUp5
	if_hp_more_than AI_USER, 50, AI_CV_EvasionUp4
	if_random_less_than 80, AI_CV_EvasionUp5

AI_CV_EvasionUp4:: @ 81DA9F0
	if_random_less_than 50, AI_CV_EvasionUp5
	score +3

AI_CV_EvasionUp5:: @ 81DA9F8
	if_not_status3 AI_TARGET, STATUS3_LEECHSEED, AI_CV_EvasionUp6
	if_random_less_than 70, AI_CV_EvasionUp6
	score +3

AI_CV_EvasionUp6:: @ 81DAA0A
	if_not_status3 AI_USER, STATUS3_ROOTED, AI_CV_EvasionUp7
	if_random_less_than 128, AI_CV_EvasionUp7
	score +2

AI_CV_EvasionUp7:: @ 81DAA1C
	if_not_status2 AI_TARGET, STATUS2_CURSED, AI_CV_EvasionUp8
	if_random_less_than 70, AI_CV_EvasionUp8
	score +3

AI_CV_EvasionUp8:: @ 81DAA2E
	if_hp_more_than AI_USER, 70, AI_CV_EvasionUp_End
	if_stat_level_equal AI_USER, STAT_EVASION, 6, AI_CV_EvasionUp_End
	if_hp_less_than AI_USER, 40, AI_CV_EvasionUp_ScoreDown2
	if_hp_less_than AI_TARGET, 40, AI_CV_EvasionUp_ScoreDown2
	if_random_less_than 70, AI_CV_EvasionUp_End

AI_CV_EvasionUp_ScoreDown2:: @ 81DAA51
	score -2

AI_CV_EvasionUp_End:: @ 81DAA53
	end

AI_CV_AlwaysHit:: @ 81DAA54
	if_stat_level_more_than AI_TARGET, STAT_EVASION, 10, AI_CV_AlwaysHit_ScoreUp1
	if_stat_level_less_than AI_USER, STAT_ACC, 2, AI_CV_AlwaysHit_ScoreUp1
	if_stat_level_more_than AI_TARGET, STAT_EVASION, 8, AI_CV_AlwaysHit2
	if_stat_level_less_than AI_USER, STAT_ACC, 4, AI_CV_AlwaysHit2
	goto AI_CV_AlwaysHit_End

AI_CV_AlwaysHit_ScoreUp1:: @ 81DAA79
	score +1

AI_CV_AlwaysHit2:: @ 81DAA7B
	if_random_less_than 100, AI_CV_AlwaysHit_End
	score +1

AI_CV_AlwaysHit_End:: @ 81DAA83
	end

AI_CV_AttackDown:: @ 81DAA84
	if_stat_level_equal AI_TARGET, STAT_ATK, 6, AI_CV_AttackDown3
	score -1
	if_hp_more_than AI_USER, 90, AI_CV_AttackDown2
	score -1

AI_CV_AttackDown2:: @ 81DAA97
	if_stat_level_more_than AI_TARGET, STAT_ATK, 3, AI_CV_AttackDown3
	if_random_less_than 50, AI_CV_AttackDown3
	score -2

AI_CV_AttackDown3:: @ 81DAAA7
	if_hp_more_than AI_TARGET, 70, AI_CV_AttackDown4
	score -2

AI_CV_AttackDown4:: @ 81DAAB0
	get_target_type1
	if_in_bytes AI_CV_AttackDown_PhysicalTypeList, AI_CV_AttackDown_End
	get_target_type2
	if_in_bytes AI_CV_AttackDown_PhysicalTypeList, AI_CV_AttackDown_End
	if_random_less_than 50, AI_CV_AttackDown_End
	score -2

AI_CV_AttackDown_End:: @ 81DAACE
	end

@ Missing Poison, Flying, and Ghost for unknown reason
AI_CV_AttackDown_PhysicalTypeList:: @ 81DAACF
	.byte TYPE_NORMAL
	.byte TYPE_FIGHTING
	.byte TYPE_GROUND
	.byte TYPE_ROCK
	.byte TYPE_BUG
	.byte TYPE_STEEL
	.byte -1

AI_CV_DefenseDown:: @ 81DAAD6
	if_hp_less_than AI_USER, 70, AI_CV_DefenseDown2
	if_stat_level_more_than AI_TARGET, STAT_DEF, 3, AI_CV_DefenseDown3

AI_CV_DefenseDown2:: @ 81DAAE5
	if_random_less_than 50, AI_CV_DefenseDown3
	score -2

AI_CV_DefenseDown3:: @ 81DAAED
	if_hp_more_than AI_TARGET, 70, AI_CV_DefenseDown_End
	score -2

AI_CV_DefenseDown_End:: @ 81DAAF6
	end

AI_CV_SpeedDownFromChance:: @ 81DAAF7
	if_move MOVE_ICY_WIND, AI_CV_SpeedDown
	if_move MOVE_ROCK_TOMB, AI_CV_SpeedDown
	if_move MOVE_MUD_SHOT, AI_CV_SpeedDown
	end

AI_CV_SpeedDown:: @ 81DAB0D
	if_target_faster AI_CV_SpeedDown2
	score -3
	goto AI_CV_SpeedDown_End

AI_CV_SpeedDown2:: @ 81DAB1A
	if_random_less_than 70, AI_CV_SpeedDown_End
	score +2

AI_CV_SpeedDown_End:: @ 81DAB22
	end

AI_CV_SpAtkDown:: @ 81DAB23
	if_stat_level_equal AI_TARGET, STAT_ATK, 6, AI_CV_SpAtkDown3
	score -1
	if_hp_more_than AI_USER, 90, AI_CV_SpAtkDown2
	score -1

AI_CV_SpAtkDown2:: @ 81DAB36
	if_stat_level_more_than AI_TARGET, STAT_SPATK, 3, AI_CV_SpAtkDown3
	if_random_less_than 50, AI_CV_SpAtkDown3
	score -2

AI_CV_SpAtkDown3:: @ 81DAB46
	if_hp_more_than AI_TARGET, 70, AI_CV_SpAtkDown4
	score -2

AI_CV_SpAtkDown4:: @ 81DAB4F
	get_target_type1
	if_in_bytes AI_CV_SpAtkDown_SpecialTypeList, AI_CV_SpAtkDown_End
	get_target_type2
	if_in_bytes AI_CV_SpAtkDown_SpecialTypeList, AI_CV_SpAtkDown_End
	if_random_less_than 50, AI_CV_SpAtkDown_End
	score -2

AI_CV_SpAtkDown_End:: @ 81DAB6D
	end

AI_CV_SpAtkDown_SpecialTypeList:: @ 81DAB6E
	.byte TYPE_FIRE
	.byte TYPE_WATER
	.byte TYPE_GRASS
	.byte TYPE_ELECTRIC
	.byte TYPE_PSYCHIC
	.byte TYPE_ICE
	.byte TYPE_DRAGON
	.byte TYPE_DARK
	.byte -1

AI_CV_SpDefDown:: @ 81DAB77
	if_hp_less_than AI_USER, 70, AI_CV_SpDefDown2
	if_stat_level_more_than AI_TARGET, STAT_SPDEF, 3, AI_CV_SpDefDown3

AI_CV_SpDefDown2:: @ 81DAB86
	if_random_less_than 50, AI_CV_SpDefDown3
	score -2

AI_CV_SpDefDown3:: @ 81DAB8E
	if_hp_more_than AI_TARGET, 70, AI_CV_SpDefDown_End
	score -2

AI_CV_SpDefDown_End:: @ 81DAB97
	end

AI_CV_AccuracyDown:: @ 81DAB98
	if_hp_less_than AI_USER, 70, AI_CV_AccuracyDown2
	if_hp_more_than AI_TARGET, 70, AI_CV_AccuracyDown3

AI_CV_AccuracyDown2:: @ 81DABA6
	if_random_less_than 100, AI_CV_AccuracyDown3
	score -1

AI_CV_AccuracyDown3:: @ 81DABAE
	if_stat_level_more_than AI_USER, STAT_ACC, 4, AI_CV_AccuracyDown4
	if_random_less_than 80, AI_CV_AccuracyDown4
	score -2

AI_CV_AccuracyDown4:: @ 81DABBE
	if_not_status AI_TARGET, STATUS1_TOXIC_POISON, AI_CV_AccuracyDown5
	if_random_less_than 70, AI_CV_AccuracyDown5
	score +2

AI_CV_AccuracyDown5:: @ 81DABD0
	if_not_status3 AI_TARGET, STATUS3_LEECHSEED, AI_CV_AccuracyDown6
	if_random_less_than 70, AI_CV_AccuracyDown6
	score +2

AI_CV_AccuracyDown6:: @ 81DABE2
	if_not_status3 AI_USER, STATUS3_ROOTED, AI_CV_AccuracyDown7
	if_random_less_than 128, AI_CV_AccuracyDown7
	score +1

AI_CV_AccuracyDown7:: @ 81DABF4
	if_not_status2 AI_TARGET, STATUS2_CURSED, AI_CV_AccuracyDown8
	if_random_less_than 70, AI_CV_AccuracyDown8
	score +2

AI_CV_AccuracyDown8:: @ 81DAC06
	if_hp_more_than AI_USER, 70, AI_CV_AccuracyDown_End
	if_stat_level_equal AI_TARGET, STAT_ACC, 6, AI_CV_AccuracyDown_End
	if_hp_less_than AI_USER, 40, AI_CV_AccuracyDown_ScoreDown2
	if_hp_less_than AI_TARGET, 40, AI_CV_AccuracyDown_ScoreDown2
	if_random_less_than 70, AI_CV_AccuracyDown_End

AI_CV_AccuracyDown_ScoreDown2:: @ 81DAC29
	score -2

AI_CV_AccuracyDown_End:: @ 81DAC2B
	end

AI_CV_EvasionDown:: @ 81DAC2C
	if_hp_less_than AI_USER, 70, AI_CV_EvasionDown2
	if_stat_level_more_than AI_TARGET, STAT_EVASION, 3, AI_CV_EvasionDown3

AI_CV_EvasionDown2:: @ 81DAC3B
	if_random_less_than 50, AI_CV_EvasionDown3
	score -2

AI_CV_EvasionDown3:: @ 81DAC43
	if_hp_more_than AI_TARGET, 70, AI_CV_EvasionDown_End
	score -2

AI_CV_EvasionDown_End:: @ 81DAC4C
	end

AI_CV_Haze:: @ 81DAC4D
	if_stat_level_more_than AI_USER, STAT_ATK, 8, AI_CV_Haze2
	if_stat_level_more_than AI_USER, STAT_DEF, 8, AI_CV_Haze2
	if_stat_level_more_than AI_USER, STAT_SPATK, 8, AI_CV_Haze2
	if_stat_level_more_than AI_USER, STAT_SPDEF, 8, AI_CV_Haze2
	if_stat_level_more_than AI_USER, STAT_EVASION, 8, AI_CV_Haze2
	if_stat_level_less_than AI_TARGET, STAT_ATK, 4, AI_CV_Haze2
	if_stat_level_less_than AI_TARGET, STAT_DEF, 4, AI_CV_Haze2
	if_stat_level_less_than AI_TARGET, STAT_SPATK, 4, AI_CV_Haze2
	if_stat_level_less_than AI_TARGET, STAT_SPDEF, 4, AI_CV_Haze2
	if_stat_level_less_than AI_TARGET, STAT_ACC, 4, AI_CV_Haze2
	goto AI_CV_Haze3

AI_CV_Haze2:: @ 81DACA2
	if_random_less_than 50, AI_CV_Haze3
	score -3

AI_CV_Haze3:: @ 81DACAA
	if_stat_level_more_than AI_TARGET, STAT_ATK, 8, AI_CV_Haze4
	if_stat_level_more_than AI_TARGET, STAT_DEF, 8, AI_CV_Haze4
	if_stat_level_more_than AI_TARGET, STAT_SPATK, 8, AI_CV_Haze4
	if_stat_level_more_than AI_TARGET, STAT_SPDEF, 8, AI_CV_Haze4
	if_stat_level_more_than AI_TARGET, STAT_EVASION, 8, AI_CV_Haze4
	if_stat_level_less_than AI_USER, STAT_ATK, 4, AI_CV_Haze4
	if_stat_level_less_than AI_USER, STAT_DEF, 4, AI_CV_Haze4
	if_stat_level_less_than AI_USER, STAT_SPATK, 4, AI_CV_Haze4
	if_stat_level_less_than AI_USER, STAT_SPDEF, 4, AI_CV_Haze4
	if_stat_level_less_than AI_USER, STAT_ACC, 4, AI_CV_Haze4
	if_random_less_than 50, AI_CV_Haze_End
	score -1
	goto AI_CV_Haze_End

AI_CV_Haze4:: @ 81DAD07
	if_random_less_than 50, AI_CV_Haze_End
	score +3

AI_CV_Haze_End:: @ 81DAD0F
	end

AI_CV_Bide:: @ 81DAD10
	if_hp_more_than AI_USER, 90, AI_CV_Bide_End
	score -2

AI_CV_Bide_End:: @ 81DAD19
	end

AI_CV_Roar:: @ 81DAD1A
	if_stat_level_more_than AI_TARGET, STAT_ATK, 8, AI_CV_Roar2
	if_stat_level_more_than AI_TARGET, STAT_DEF, 8, AI_CV_Roar2
	if_stat_level_more_than AI_TARGET, STAT_SPATK, 8, AI_CV_Roar2
	if_stat_level_more_than AI_TARGET, STAT_SPDEF, 8, AI_CV_Roar2
	if_stat_level_more_than AI_TARGET, STAT_EVASION, 8, AI_CV_Roar2
	score -3
	goto AI_CV_Roar_End

AI_CV_Roar2:: @ 81DAD49
	if_random_less_than 128, AI_CV_Roar_End
	score +2

AI_CV_Roar_End:: @ 81DAD51
	end

AI_CV_Conversion:: @ 81DAD52
	if_hp_more_than AI_USER, 90, AI_CV_Conversion2
	score -2

AI_CV_Conversion2:: @ 81DAD5B
	get_turn_count
	if_equal 0, AI_CV_Conversion_End
	if_random_less_than 200, Score_Minus2

AI_CV_Conversion_End:: @ 81DAD68
	end

AI_CV_HealWeather:: @ 81DAD69
	get_weather
	if_equal AI_WEATHER_HAIL, AI_CV_HealWeather_ScoreDown2
	if_equal AI_WEATHER_RAIN, AI_CV_HealWeather_ScoreDown2
	if_equal AI_WEATHER_SANDSTORM, AI_CV_HealWeather_ScoreDown2
	goto AI_CV_Heal

AI_CV_HealWeather_ScoreDown2:: @ 81DAD81
	score -2

AI_CV_Heal:: @ 81DAD83
	if_hp_equal AI_USER, 100, AI_CV_Heal3
	if_target_faster AI_CV_Heal4
	score -8
	goto AI_CV_Heal_End

@ Never reached
AI_CV_Heal2:
	if_hp_less_than AI_USER, 50, AI_CV_Heal5
	if_hp_more_than AI_USER, 80, AI_CV_Heal3
	if_random_less_than 70, AI_CV_Heal5

AI_CV_Heal3:: @ 81DADAB
	score -3
	goto AI_CV_Heal_End

AI_CV_Heal4:: @ 81DADB2
	if_hp_less_than AI_USER, 70, AI_CV_Heal5
	if_random_less_than 30, AI_CV_Heal5
	score -3
	goto AI_CV_Heal_End

AI_CV_Heal5:: @ 81DADC6
	if_doesnt_have_move_with_effect AI_TARGET, EFFECT_SNATCH, AI_CV_Heal6
	if_random_less_than 100, AI_CV_Heal_End

AI_CV_Heal6:: @ 81DADD3
	if_random_less_than 20, AI_CV_Heal_End
	score +2

AI_CV_Heal_End:: @ 81DADDB
	end

AI_CV_Toxic:: @ 81DADDC
	if_user_has_no_attacking_moves AI_CV_Toxic3
	if_hp_more_than AI_USER, 50, AI_CV_Toxic2
	if_random_less_than 50, AI_CV_Toxic2
	score -3

AI_CV_Toxic2:: @ 81DADF0
	if_hp_more_than AI_TARGET, 50, AI_CV_Toxic3
	if_random_less_than 50, AI_CV_Toxic3
	score -3

AI_CV_Toxic3:: @ 81DADFF
	if_has_move_with_effect AI_USER, EFFECT_SPECIAL_DEFENSE_UP, AI_CV_Toxic4
	if_has_move_with_effect AI_USER, EFFECT_PROTECT, AI_CV_Toxic4
	goto AI_CV_Toxic_End

AI_CV_Toxic4:: @ 81DAE12
	if_random_less_than 60, AI_CV_Toxic_End
	score +2

AI_CV_Toxic_End:: @ 81DAE1A
	end

AI_CV_LightScreen:: @ 81DAE1B
	if_hp_less_than AI_USER, 50, AI_CV_LightScreen_ScoreDown2
	get_target_type1
	if_in_bytes AI_CV_LightScreen_SpecialTypeList, AI_CV_LightScreen_End
	get_target_type2
	if_in_bytes AI_CV_LightScreen_SpecialTypeList, AI_CV_LightScreen_End
	if_random_less_than 50, AI_CV_LightScreen_End

AI_CV_LightScreen_ScoreDown2:: @ 81DAE3E
	score -2

AI_CV_LightScreen_End:: @ 81DAE40
	end

AI_CV_LightScreen_SpecialTypeList:: @ 81DAE41
	.byte TYPE_FIRE
	.byte TYPE_WATER
	.byte TYPE_GRASS
	.byte TYPE_ELECTRIC
	.byte TYPE_PSYCHIC
	.byte TYPE_ICE
	.byte TYPE_DRAGON
	.byte TYPE_DARK
	.byte -1

AI_CV_Rest:: @ 81DAE4A
	if_target_faster AI_CV_Rest4
	if_hp_not_equal AI_USER, 100, AI_CV_Rest2
	score -8
	goto AI_CV_Rest_End

AI_CV_Rest2:: @ 81DAE5E
	if_hp_less_than AI_USER, 40, AI_CV_Rest6
	if_hp_more_than AI_USER, 50, AI_CV_Rest3
	if_random_less_than 70, AI_CV_Rest6

AI_CV_Rest3:: @ 81DAE72
	score -3
	goto AI_CV_Rest_End

AI_CV_Rest4:: @ 81DAE79
	if_hp_less_than AI_USER, 60, AI_CV_Rest6
	if_hp_more_than AI_USER, 70, AI_CV_Rest5
	if_random_less_than 50, AI_CV_Rest6

AI_CV_Rest5:: @ 81DAE8D
	score -3
	goto AI_CV_Rest_End

AI_CV_Rest6:: @ 81DAE94
	if_doesnt_have_move_with_effect AI_TARGET, EFFECT_SNATCH, AI_CV_Rest7
	if_random_less_than 50, AI_CV_Rest_End

AI_CV_Rest7:: @ 81DAEA1
	if_random_less_than 10, AI_CV_Rest_End
	score +3

AI_CV_Rest_End:: @ 81DAEA9
	end

AI_CV_OneHitKO:: @ 81DAEAA
	end

AI_CV_SuperFang:: @ 81DAEAB
	if_hp_more_than AI_TARGET, 50, AI_CV_SuperFang_End
	score -1

AI_CV_SuperFang_End:: @ 81DAEB4
	end

AI_CV_Trap:: @ 81DAEB5
	if_status AI_TARGET, STATUS1_TOXIC_POISON, AI_CV_Trap2
	if_status2 AI_TARGET, STATUS2_CURSED, AI_CV_Trap2
	if_status3 AI_TARGET, STATUS3_PERISH_SONG, AI_CV_Trap2
	if_status2 AI_TARGET, STATUS2_INFATUATION, AI_CV_Trap2
	goto AI_CV_Trap_End

AI_CV_Trap2:: @ 81DAEE2
	if_random_less_than 128, AI_CV_Trap_End
	score +1

AI_CV_Trap_End:: @ 81DAEEA
	end

AI_CV_HighCrit:: @ 81DAEEB
	if_type_effectiveness AI_EFFECTIVENESS_x0_25, AI_CV_HighCrit_End
	if_type_effectiveness AI_EFFECTIVENESS_x0_5, AI_CV_HighCrit_End
	if_type_effectiveness AI_EFFECTIVENESS_x2, AI_CV_HighCrit2
	if_type_effectiveness AI_EFFECTIVENESS_x4, AI_CV_HighCrit2
	if_random_less_than 128, AI_CV_HighCrit_End

AI_CV_HighCrit2:: @ 81DAF09
	if_random_less_than 128, AI_CV_HighCrit_End
	score +1

AI_CV_HighCrit_End:: @ 81DAF11
	end

@ Improvement in Emerald
@AI_CV_Swagger:
@	if_has_move AI_USER, MOVE_PSYCH_UP, AI_CV_SwaggerHasPsychUp

AI_CV_Flatter:: @ 81DAF12
	if_random_less_than 128, AI_CV_Confuse
	score +1

AI_CV_Confuse:: @ 81DAF1A
	if_hp_more_than AI_TARGET, 70, AI_CV_Confuse_End
	if_random_less_than 128, AI_CV_Confuse2
	score -1

AI_CV_Confuse2:: @ 81DAF29
	if_hp_more_than AI_TARGET, 50, AI_CV_Confuse_End
	score -1
	if_hp_more_than AI_TARGET, 30, AI_CV_Confuse_End
	score -1

AI_CV_Confuse_End:: @ 81DAF3B
	end

@ Improvement in Emerald
@AI_CV_SwaggerHasPsychUp:
@	if_stat_level_more_than AI_TARGET, STAT_ATK, 3, AI_CV_SwaggerHasPsychUp_Minus5
@	score +3
@	get_turn_count
@	if_not_equal 0, AI_CV_SwaggerHasPsychUp_End
@	score +2
@	goto AI_CV_SwaggerHasPsychUp_End
@
@AI_CV_SwaggerHasPsychUp_Minus5:
@	score -5
@
@AI_CV_SwaggerHasPsychUp_End:
@	end

AI_CV_Reflect:: @ 81DAF3C
	if_hp_less_than AI_USER, 50, AI_CV_Reflect_ScoreDown2
	get_target_type1
	if_in_bytes AI_CV_Reflect_PhysicalTypeList, AI_CV_Reflect_End
	get_target_type2
	if_in_bytes AI_CV_Reflect_PhysicalTypeList, AI_CV_Reflect_End
	if_random_less_than 50, AI_CV_Reflect_End

AI_CV_Reflect_ScoreDown2:: @ 81DAF5F
	score -2

AI_CV_Reflect_End:: @ 81DAF61
	end

AI_CV_Reflect_PhysicalTypeList:: @ 81DAF62
	.byte TYPE_NORMAL
	.byte TYPE_FIGHTING
	.byte TYPE_FLYING
	.byte TYPE_POISON
	.byte TYPE_GROUND
	.byte TYPE_ROCK
	.byte TYPE_BUG
	.byte TYPE_GHOST
	.byte TYPE_STEEL
	.byte -1

AI_CV_Poison:: @ 81DAF6C
	if_hp_less_than AI_USER, 50, AI_CV_Poison_ScoreDown1
	if_hp_more_than AI_TARGET, 50, AI_CV_Poison_End

AI_CV_Poison_ScoreDown1:: @ 81DAF7A
	score -1

AI_CV_Poison_End:: @ 81DAF7C
	end

AI_CV_Paralyze:: @ 81DAF7D
	if_target_faster AI_CV_Paralyze2
	if_hp_more_than AI_USER, 70, AI_CV_Paralyze_End
	score -1
	goto AI_CV_Paralyze_End

AI_CV_Paralyze2:: @ 81DAF91
	if_random_less_than 20, AI_CV_Paralyze_End
	score +3

AI_CV_Paralyze_End:: @ 81DAF99
	end

AI_CV_VitalThrow:: @ 81DAF9A
	if_target_faster AI_CV_VitalThrow_End
	if_hp_more_than AI_USER, 60, AI_CV_VitalThrow_End
	if_hp_less_than AI_USER, 40, AI_CV_VitalThrow2
	if_random_less_than 180, AI_CV_VitalThrow_End

AI_CV_VitalThrow2:: @ 81DAFB4
	if_random_less_than 50, AI_CV_VitalThrow_End
	score -1

AI_CV_VitalThrow_End:: @ 81DAFBC
	end

AI_CV_Substitute:: @ 81DAFBD
	if_hp_more_than AI_USER, 90, AI_CV_Substitute4
	if_hp_more_than AI_USER, 70, AI_CV_Substitute3
	if_hp_more_than AI_USER, 50, AI_CV_Substitute2
	if_random_less_than 100, AI_CV_Substitute2
	score -1

AI_CV_Substitute2:: @ 81DAFDA
	if_random_less_than 100, AI_CV_Substitute3
	score -1

AI_CV_Substitute3:: @ 81DAFE2
	if_random_less_than 100, AI_CV_Substitute4
	score -1

AI_CV_Substitute4:: @ 81DAFEA
	if_target_faster AI_CV_Substitute_End
	get_last_used_move AI_TARGET
	get_move_effect_from_result
	if_equal EFFECT_SLEEP, AI_CV_Substitute5
	if_equal EFFECT_TOXIC, AI_CV_Substitute5
	if_equal EFFECT_POISON, AI_CV_Substitute5
	if_equal EFFECT_PARALYZE, AI_CV_Substitute5
	if_equal EFFECT_WILL_O_WISP, AI_CV_Substitute5
	if_equal EFFECT_CONFUSE, AI_CV_Substitute6
	if_equal EFFECT_LEECH_SEED, AI_CV_Substitute7
	goto AI_CV_Substitute_End

AI_CV_Substitute5:: @ 81DB022
	if_not_status AI_TARGET, STATUS1_ANY, AI_CV_Substitute8
	goto AI_CV_Substitute_End

AI_CV_Substitute6:: @ 81DB031
	if_not_status2 AI_TARGET, STATUS2_CONFUSION, AI_CV_Substitute8
	goto AI_CV_Substitute_End

AI_CV_Substitute7:: @ 81DB040
	if_status3 AI_TARGET, STATUS3_LEECHSEED, AI_CV_Substitute_End

AI_CV_Substitute8:: @ 81DB04A
	if_random_less_than 100, AI_CV_Substitute_End
	score +1

AI_CV_Substitute_End:: @ 81DB052
	end

AI_CV_Recharge:: @ 81DB053
	if_type_effectiveness AI_EFFECTIVENESS_x0_25, AI_CV_Recharge_ScoreDown1
	if_type_effectiveness AI_EFFECTIVENESS_x0_5, AI_CV_Recharge_ScoreDown1
	if_target_faster AI_CV_Recharge2
	if_hp_more_than AI_USER, 40, AI_CV_Recharge_ScoreDown1
	goto AI_CV_Recharge_End

AI_CV_Recharge2:: @ 81DB071
	if_hp_less_than AI_USER, 60, AI_CV_Recharge_End

AI_CV_Recharge_ScoreDown1:: @ 81DB078
	score -1

AI_CV_Recharge_End:: @ 81DB07A
	end

AI_CV_Disable:: @ 81DB07B
	if_target_faster AI_CV_Disable_End
	get_last_used_move AI_TARGET
	get_move_power_from_result
	if_equal 0, AI_CV_Disable2
	score +1
	goto AI_CV_Disable_End

AI_CV_Disable2:: @ 81DB091
	if_random_less_than 100, AI_CV_Disable_End
	score -1

AI_CV_Disable_End:: @ 81DB099
	end

AI_CV_Counter:: @ 81DB09A
	if_status AI_TARGET, STATUS1_SLEEP, AI_CV_Counter_ScoreDown1
	if_status2 AI_TARGET, STATUS2_INFATUATION, AI_CV_Counter_ScoreDown1
	if_status2 AI_TARGET, STATUS2_CONFUSION, AI_CV_Counter_ScoreDown1
	if_hp_more_than AI_USER, 30, AI_CV_Counter2
	if_random_less_than 10, AI_CV_Counter2
	score -1

AI_CV_Counter2:: @ 81DB0C7
	if_hp_more_than AI_USER, 50, AI_CV_Counter3
	if_random_less_than 100, AI_CV_Counter3
	score -1

AI_CV_Counter3:: @ 81DB0D6
@	if_has_move AI_USER, MOVE_MIRROR_COAT, AI_CV_Counter7  @ Improvement in Emerald
	get_last_used_move AI_TARGET
	get_move_power_from_result
	if_equal 0, AI_CV_Counter5
	if_target_not_taunted AI_CV_Counter4
	if_random_less_than 100, AI_CV_Counter4
	score +1

AI_CV_Counter4:: @ 81DB0EC
	get_last_used_move AI_TARGET
	get_move_type_from_result
	if_not_in_bytes AI_CV_Counter_PhysicalTypeList, AI_CV_Counter_ScoreDown1
	if_random_less_than 100, AI_CV_Counter_End
	score +1
	goto AI_CV_Counter_End

AI_CV_Counter5:: @ 81DB105
	if_target_not_taunted AI_CV_Counter6
	if_random_less_than 100, AI_CV_Counter6
	score +1

AI_CV_Counter6:: @ 81DB112
	get_target_type1
	if_in_bytes AI_CV_Counter_PhysicalTypeList, AI_CV_Counter_End
	get_target_type2
	if_in_bytes AI_CV_Counter_PhysicalTypeList, AI_CV_Counter_End
	if_random_less_than 50, AI_CV_Counter_End

@ Improvement in Emerald
@AI_CV_Counter7:
@	if_random_less_than 100, AI_CV_Counter8
@	score +4
@
@AI_CV_Counter8:
@	end

AI_CV_Counter_ScoreDown1:: @ 81DB12E
	score -1

AI_CV_Counter_End:: @ 81DB130
	end

AI_CV_Counter_PhysicalTypeList:: @ 81DB131
	.byte TYPE_NORMAL
	.byte TYPE_FIGHTING
	.byte TYPE_FLYING
	.byte TYPE_POISON
	.byte TYPE_GROUND
	.byte TYPE_ROCK
	.byte TYPE_BUG
	.byte TYPE_GHOST
	.byte TYPE_STEEL
	.byte -1

AI_CV_Encore:: @ 81DB13B
	if_any_move_disabled AI_TARGET, AI_CV_Encore2
	if_target_faster AI_CV_Encore_ScoreDown2
	get_last_used_move AI_TARGET
	get_move_effect_from_result
	if_not_in_bytes AI_CV_Encore_EncouragedMovesToEncore, AI_CV_Encore_ScoreDown2

AI_CV_Encore2:: @ 81DB154
	if_random_less_than 30, AI_CV_Encore_End
	score +3
	goto AI_CV_Encore_End

AI_CV_Encore_ScoreDown2:: @ 81DB161
	score -2

AI_CV_Encore_End:: @ 81DB163
	end

AI_CV_Encore_EncouragedMovesToEncore:: @ 81DB164
	.byte EFFECT_DREAM_EATER
	.byte EFFECT_ATTACK_UP
	.byte EFFECT_DEFENSE_UP
	.byte EFFECT_SPEED_UP
	.byte EFFECT_SPECIAL_ATTACK_UP
	.byte EFFECT_HAZE
	.byte EFFECT_ROAR
	.byte EFFECT_CONVERSION
	.byte EFFECT_TOXIC
	.byte EFFECT_LIGHT_SCREEN
	.byte EFFECT_REST
	.byte EFFECT_SUPER_FANG
	.byte EFFECT_SPECIAL_DEFENSE_UP_2
	.byte EFFECT_CONFUSE
	.byte EFFECT_POISON
	.byte EFFECT_PARALYZE
	.byte EFFECT_LEECH_SEED
	.byte EFFECT_SPLASH
	.byte EFFECT_ATTACK_UP_2
	.byte EFFECT_ENCORE
	.byte EFFECT_CONVERSION_2
	.byte EFFECT_LOCK_ON
	.byte EFFECT_HEAL_BELL
	.byte EFFECT_MEAN_LOOK
	.byte EFFECT_NIGHTMARE
	.byte EFFECT_PROTECT
	.byte EFFECT_SKILL_SWAP
	.byte EFFECT_FORESIGHT
	.byte EFFECT_PERISH_SONG
	.byte EFFECT_SANDSTORM
	.byte EFFECT_ENDURE
	.byte EFFECT_SWAGGER
	.byte EFFECT_ATTRACT
	.byte EFFECT_SAFEGUARD
	.byte EFFECT_RAIN_DANCE
	.byte EFFECT_SUNNY_DAY
	.byte EFFECT_BELLY_DRUM
	.byte EFFECT_PSYCH_UP
	.byte EFFECT_FUTURE_SIGHT
	.byte EFFECT_FAKE_OUT
	.byte EFFECT_STOCKPILE
	.byte EFFECT_SPIT_UP
	.byte EFFECT_SWALLOW
	.byte EFFECT_HAIL
	.byte EFFECT_TORMENT
	.byte EFFECT_WILL_O_WISP
	.byte EFFECT_FOLLOW_ME
	.byte EFFECT_CHARGE
	.byte EFFECT_TRICK
	.byte EFFECT_ROLE_PLAY
	.byte EFFECT_INGRAIN
	.byte EFFECT_RECYCLE
	.byte EFFECT_KNOCK_OFF
	.byte EFFECT_SKILL_SWAP
	.byte EFFECT_IMPRISON
	.byte EFFECT_REFRESH
	.byte EFFECT_GRUDGE
	.byte EFFECT_TEETER_DANCE
	.byte EFFECT_MUD_SPORT
	.byte EFFECT_WATER_SPORT
	.byte EFFECT_DRAGON_DANCE
	.byte EFFECT_CAMOUFLAGE
	.byte -1

AI_CV_PainSplit:: @ 81DB1A3
	if_hp_less_than AI_TARGET, 80, AI_CV_PainSplit_ScoreDown1
	if_target_faster AI_CV_PainSplit2
	if_hp_more_than AI_USER, 40, AI_CV_PainSplit_ScoreDown1
	score +1
	goto AI_CV_PainSplit_End

AI_CV_PainSplit2:: @ 81DB1BE
	if_hp_more_than AI_USER, 60, AI_CV_PainSplit_ScoreDown1
	score +1
	goto AI_CV_PainSplit_End

AI_CV_PainSplit_ScoreDown1:: @ 81DB1CC
	score -1

AI_CV_PainSplit_End:: @ 81DB1CE
	end

AI_CV_Snore:: @ 81DB1CF
	score +2
	end

AI_CV_LockOn:: @ 81DB1D2
	if_random_less_than 128, AI_CV_LockOn_End
	score +2

AI_CV_LockOn_End:: @ 81DB1DA
	end

AI_CV_SleepTalk:: @ 81DB1DB
@	if_status AI_USER, STATUS1_SLEEP, Score_Plus10  @ Improvement in Emerald
	score +2   @ Change to -5
	end

AI_CV_DestinyBond:: @ 81DB1DE
	score -1
	if_target_faster AI_CV_DestinyBond_End
	if_hp_more_than AI_USER, 70, AI_CV_DestinyBond_End
	if_random_less_than 128, AI_CV_DestinyBond2
	score +1

AI_CV_DestinyBond2:: @ 81DB1F5
	if_hp_more_than AI_USER, 50, AI_CV_DestinyBond_End
	if_random_less_than 128, AI_CV_DestinyBond3
	score +1

AI_CV_DestinyBond3:: @ 81DB204
	if_hp_more_than AI_USER, 30, AI_CV_DestinyBond_End
	if_random_less_than 100, AI_CV_DestinyBond_End
	score +2

AI_CV_DestinyBond_End:: @ 81DB213
	end

AI_CV_Flail:: @ 81DB214
	if_target_faster AI_CV_Flail2
	if_hp_more_than AI_USER, 33, AI_CV_Flail_ScoreDown1
	if_hp_more_than AI_USER, 20, AI_CV_Flail_End
	if_hp_less_than AI_USER, 8, AI_CV_Flail_ScoreUp1
	goto AI_CV_Flail3

AI_CV_Flail2:: @ 81DB234
	if_hp_more_than AI_USER, 60, AI_CV_Flail_ScoreDown1
	if_hp_more_than AI_USER, 40, AI_CV_Flail_End
	goto AI_CV_Flail3

AI_CV_Flail_ScoreUp1:: @ 81DB247
	score +1

AI_CV_Flail3:: @ 81DB249
	if_random_less_than 100, AI_CV_Flail_End
	score +1
	goto AI_CV_Flail_End

AI_CV_Flail_ScoreDown1:: @ 81DB256
	score -1

AI_CV_Flail_End:: @ 81DB258
	end

AI_CV_HealBell:: @ 81DB259
	if_status AI_TARGET, STATUS1_ANY, AI_CV_HealBell_End
	if_status_in_party AI_TARGET, STATUS1_ANY, AI_CV_HealBell_End
	score -5

AI_CV_HealBell_End:: @ 81DB26F
	end

AI_CV_Thief:: @ 81DB270
	get_hold_effect AI_TARGET
	if_not_in_bytes AI_CV_Thief_EncourageItemsToSteal, AI_CV_Thief_ScoreDown2
	if_random_less_than 50, AI_CV_Thief_End
	score +1
	goto AI_CV_Thief_End

AI_CV_Thief_ScoreDown2:: @ 81DB288
	score -2

AI_CV_Thief_End:: @ 81DB28A
	end

AI_CV_Thief_EncourageItemsToSteal:: @ 81DB28B
	.byte HOLD_EFFECT_CURE_SLP
	.byte HOLD_EFFECT_CURE_STATUS
	.byte HOLD_EFFECT_RESTORE_HP
	.byte HOLD_EFFECT_EVASION_UP
	.byte HOLD_EFFECT_LEFTOVERS
	.byte HOLD_EFFECT_LIGHT_BALL
	.byte HOLD_EFFECT_THICK_CLUB
	.byte -1

AI_CV_Curse:: @ 81DB293
	get_user_type1
	if_equal TYPE_GHOST, AI_CV_Curse4
	get_user_type2
	if_equal TYPE_GHOST, AI_CV_Curse4
	if_stat_level_more_than AI_USER, STAT_DEF, 9, AI_CV_Curse_End
	if_random_less_than 128, AI_CV_Curse2
	score +1

AI_CV_Curse2:: @ 81DB2B3
	if_stat_level_more_than AI_USER, STAT_DEF, 7, AI_CV_Curse_End
	if_random_less_than 128, AI_CV_Curse3
	score +1

AI_CV_Curse3:: @ 81DB2C3
	if_stat_level_more_than AI_USER, STAT_DEF, 6, AI_CV_Curse_End
	if_random_less_than 128, AI_CV_Curse_End
	score +1
	goto AI_CV_Curse_End

AI_CV_Curse4:: @ 81DB2D8
	if_hp_more_than AI_USER, 80, AI_CV_Curse_End
	score -1

AI_CV_Curse_End:: @ 81DB2E1
	end

AI_CV_Protect:: @ 81DB2E2
	get_protect_count AI_USER
	if_more_than 1, AI_CV_Protect_ScoreDown2
	if_status AI_USER, STATUS1_TOXIC_POISON, AI_CV_Protect3
	if_status2 AI_USER, STATUS2_CURSED, AI_CV_Protect3
	if_status3 AI_USER, STATUS3_PERISH_SONG, AI_CV_Protect3
	if_status2 AI_USER, STATUS2_INFATUATION, AI_CV_Protect3
	if_status3 AI_USER, STATUS3_LEECHSEED, AI_CV_Protect3
	if_status3 AI_USER, STATUS3_YAWN, AI_CV_Protect3
	if_has_move_with_effect AI_TARGET, EFFECT_RESTORE_HP, AI_CV_Protect3
	if_has_move_with_effect AI_TARGET, EFFECT_DEFENSE_CURL, AI_CV_Protect3
	if_status AI_TARGET, STATUS1_TOXIC_POISON, AI_CV_Protect_ScoreUp2
	if_status2 AI_TARGET, STATUS2_CURSED, AI_CV_Protect_ScoreUp2
	if_status3 AI_TARGET, STATUS3_PERISH_SONG, AI_CV_Protect_ScoreUp2
	if_status2 AI_TARGET, STATUS2_INFATUATION, AI_CV_Protect_ScoreUp2
	if_status3 AI_TARGET, STATUS3_LEECHSEED, AI_CV_Protect_ScoreUp2
	if_status3 AI_TARGET, STATUS3_YAWN, AI_CV_Protect_ScoreUp2
	get_last_used_move AI_TARGET
	get_move_effect_from_result
	if_not_equal EFFECT_LOCK_ON, AI_CV_Protect_ScoreUp2
	goto AI_CV_Protect2

AI_CV_Protect_ScoreUp2:: @ 81DB37E
	score +2

AI_CV_Protect2:: @ 81DB380
@	if_random_less_than 128, AI_CV_Protect4  @ Improvement in Emerald
@	score -1

AI_CV_Protect4::
	get_protect_count AI_USER
	if_equal 0, AI_CV_Protect_End
	score -1
	if_random_less_than 128, AI_CV_Protect_End
	score -1
	goto AI_CV_Protect_End

AI_CV_Protect3:: @ 81DB397
	get_last_used_move AI_TARGET
	get_move_effect_from_result
	if_not_equal EFFECT_LOCK_ON, AI_CV_Protect_End

AI_CV_Protect_ScoreDown2:: @ 81DB3A0
	score -2

AI_CV_Protect_End:: @ 81DB3A2
	end

AI_CV_Foresight:: @ 81DB3A3
	get_user_type1
	if_equal TYPE_GHOST, AI_CV_Foresight2
	get_user_type2
	if_equal TYPE_GHOST, AI_CV_Foresight2
	if_stat_level_more_than AI_USER, STAT_EVASION, 8, AI_CV_Foresight3
	score -2
	goto AI_CV_Foresight_End

AI_CV_Foresight2:: @ 81DB3C2
	if_random_less_than 80, AI_CV_Foresight_End

AI_CV_Foresight3:: @ 81DB3C8
	if_random_less_than 80, AI_CV_Foresight_End
	score +2

AI_CV_Foresight_End:: @ 81DB3D0
	end

AI_CV_Endure:: @ 81DB3D1
	if_hp_less_than AI_USER, 4, AI_CV_Endure2
	if_hp_less_than AI_USER, 35, AI_CV_Endure3

AI_CV_Endure2:: @ 81DB3DF
	score -1
	goto AI_CV_Endure_End

AI_CV_Endure3:: @ 81DB3E6
	if_random_less_than 70, AI_CV_Endure_End
	score +1

AI_CV_Endure_End:: @ 81DB3EE
	end

AI_CV_BatonPass:: @ 81DB3EF
	if_stat_level_more_than AI_USER, STAT_ATK, 8, AI_CV_BatonPass2
	if_stat_level_more_than AI_USER, STAT_DEF, 8, AI_CV_BatonPass2
	if_stat_level_more_than AI_USER, STAT_SPATK, 8, AI_CV_BatonPass2
	if_stat_level_more_than AI_USER, STAT_SPDEF, 8, AI_CV_BatonPass2
	if_stat_level_more_than AI_USER, STAT_EVASION, 8, AI_CV_BatonPass2
	goto AI_CV_BatonPass5

AI_CV_BatonPass2:: @ 81DB41C
	if_target_faster AI_CV_BatonPass3
	if_hp_more_than AI_USER, 60, AI_CV_BatonPass_End
	goto AI_CV_BatonPass4

AI_CV_BatonPass3:: @ 81DB42E
	if_hp_more_than AI_USER, 70, AI_CV_BatonPass_End

AI_CV_BatonPass4:: @ 81DB435
	if_random_less_than 80, AI_CV_BatonPass_End
	score +2
	goto AI_CV_BatonPass_End

AI_CV_BatonPass5:: @ 81DB442
	if_stat_level_more_than AI_USER, STAT_ATK, 7, AI_CV_BatonPass7
	if_stat_level_more_than AI_USER, STAT_DEF, 7, AI_CV_BatonPass7
	if_stat_level_more_than AI_USER, STAT_SPATK, 7, AI_CV_BatonPass7
	if_stat_level_more_than AI_USER, STAT_SPDEF, 7, AI_CV_BatonPass7
	if_stat_level_more_than AI_USER, STAT_EVASION, 7, AI_CV_BatonPass7
	goto AI_CV_BatonPass_ScoreDown2

AI_CV_BatonPass7:: @ 81DB46F
	if_target_faster AI_CV_BatonPass8
	if_hp_more_than AI_USER, 60, AI_CV_BatonPass_ScoreDown2
	goto AI_CV_BatonPass_End

AI_CV_BatonPass8:: @ 81DB481
	if_hp_less_than AI_USER, 70, AI_CV_BatonPass_End

AI_CV_BatonPass_ScoreDown2:: @ 81DB488
	score -2

AI_CV_BatonPass_End:: @ 81DB48A
	end

AI_CV_Pursuit:: @ 81DB48B
	is_first_turn_for AI_USER
	if_not_equal 0, AI_CV_Pursuit_End
	get_target_type1
	if_equal TYPE_GHOST, AI_CV_Pursuit2
	get_target_type1
	if_equal TYPE_PSYCHIC, AI_CV_Pursuit2
	get_target_type2
	if_equal TYPE_GHOST, AI_CV_Pursuit2
	get_target_type2
	if_equal TYPE_PSYCHIC, AI_CV_Pursuit2
	goto AI_CV_Pursuit_End

AI_CV_Pursuit2:: @ 81DB4B8
	if_random_less_than 128, AI_CV_Pursuit_End
	score +1

AI_CV_Pursuit_End:: @ 81DB4C0
	end

AI_CV_RainDance:: @ 81DB4C1
	if_user_faster AI_CV_RainDance2
	get_ability AI_USER
	if_equal ABILITY_SWIFT_SWIM, AI_CV_RainDance3

AI_CV_RainDance2:: @ 81DB4CF
	if_hp_less_than AI_USER, 40, AI_CV_RainDance_ScoreDown1
	get_weather
	if_equal AI_WEATHER_HAIL, AI_CV_RainDance3
	if_equal AI_WEATHER_SUN, AI_CV_RainDance3
	if_equal AI_WEATHER_SANDSTORM, AI_CV_RainDance3
	get_ability AI_USER
	if_equal ABILITY_RAIN_DISH, AI_CV_RainDance3
	goto AI_CV_RainDance_End

AI_CV_RainDance3:: @ 81DB4F6
	score +1
	goto AI_CV_RainDance_End

AI_CV_RainDance_ScoreDown1:: @ 81DB4FD
	score -1

AI_CV_RainDance_End:: @ 81DB4FF
	end

AI_CV_SunnyDay:: @ 81DB500
	if_hp_less_than AI_USER, 40, AI_CV_SunnyDay_ScoreDown1
	get_weather
	if_equal AI_WEATHER_HAIL, AI_CV_SunnyDay2
	if_equal AI_WEATHER_RAIN, AI_CV_SunnyDay2
	if_equal AI_WEATHER_SANDSTORM, AI_CV_SunnyDay2
	goto AI_CV_SunnyDay_End

AI_CV_SunnyDay2:: @ 81DB51F
	score +1
	goto AI_CV_SunnyDay_End

AI_CV_SunnyDay_ScoreDown1:: @ 81DB526
	score -1

AI_CV_SunnyDay_End:: @ 81DB528
	end

AI_CV_BellyDrum:: @ 81DB529
	if_hp_less_than AI_USER, 90, AI_CV_BellyDrum_ScoreDown2
	goto AI_CV_BellyDrum_End

AI_CV_BellyDrum_ScoreDown2:: @ 81DB535
	score -2

AI_CV_BellyDrum_End:: @ 81DB537
	end

AI_CV_PsychUp:: @ 81DB538
	if_stat_level_more_than AI_TARGET, STAT_ATK, 8, AI_CV_PsychUp2
	if_stat_level_more_than AI_TARGET, STAT_DEF, 8, AI_CV_PsychUp2
	if_stat_level_more_than AI_TARGET, STAT_SPATK, 8, AI_CV_PsychUp2
	if_stat_level_more_than AI_TARGET, STAT_SPDEF, 8, AI_CV_PsychUp2
	if_stat_level_more_than AI_TARGET, STAT_EVASION, 8, AI_CV_PsychUp2
	goto AI_CV_PsychUp_ScoreDown2

AI_CV_PsychUp2:: @ 81DB565
	if_stat_level_less_than AI_USER, STAT_ATK, 7, AI_CV_PsychUp3
	if_stat_level_less_than AI_USER, STAT_DEF, 7, AI_CV_PsychUp3
	if_stat_level_less_than AI_USER, STAT_SPATK, 7, AI_CV_PsychUp3
	if_stat_level_less_than AI_USER, STAT_SPDEF, 7, AI_CV_PsychUp3
	if_stat_level_less_than AI_USER, STAT_EVASION, 7, AI_CV_PsychUp_ScoreUp1
	if_random_less_than 50, AI_CV_PsychUp_End
	goto AI_CV_PsychUp_ScoreDown2

AI_CV_PsychUp_ScoreUp1:: @ 81DB598
	score +1

AI_CV_PsychUp3:: @ 81DB59A
	if_random_less_than 128, AI_CV_PsychUp_End  @ Remove this line
	score +1
@	end  @ Improvement in Emerald

AI_CV_PsychUp_ScoreDown2:: @ 81DB5A2
	score -2

AI_CV_PsychUp_End:: @ 81DB5A4
	end

AI_CV_MirrorCoat:: @ 81DB5A5
	if_status AI_TARGET, STATUS1_SLEEP, AI_CV_MirrorCoat_ScoreDown1
	if_status2 AI_TARGET, STATUS2_INFATUATION, AI_CV_MirrorCoat_ScoreDown1
	if_status2 AI_TARGET, STATUS2_CONFUSION, AI_CV_MirrorCoat_ScoreDown1
	if_hp_more_than AI_USER, 30, AI_CV_MirrorCoat2
	if_random_less_than 10, AI_CV_MirrorCoat2
	score -1

AI_CV_MirrorCoat2:: @ 81DB5D2
	if_hp_more_than AI_USER, 50, AI_CV_MirrorCoat3
	if_random_less_than 100, AI_CV_MirrorCoat3
	score -1

AI_CV_MirrorCoat3:: @ 81DB5E1
@	if_has_move AI_USER, MOVE_COUNTER, AI_CV_MirrorCoat_ScoreUp4  @ Improvement in Emerald
	get_last_used_move AI_TARGET
	get_move_power_from_result
	if_equal 0, AI_CV_MirrorCoat5
	if_target_not_taunted AI_CV_MirrorCoat4
	if_random_less_than 100, AI_CV_MirrorCoat4
	score +1

AI_CV_MirrorCoat4:: @ 81DB5F7
	get_last_used_move AI_TARGET
	get_move_type_from_result
	if_not_in_bytes AI_CV_MirrorCoat_SpecialTypeList, AI_CV_MirrorCoat_ScoreDown1
	if_random_less_than 100, AI_CV_MirrorCoat_End
	score +1
	goto AI_CV_MirrorCoat_End

AI_CV_MirrorCoat5:: @ 81DB610
	if_target_not_taunted AI_CV_MirrorCoat6
	if_random_less_than 100, AI_CV_MirrorCoat6
	score +1

AI_CV_MirrorCoat6:: @ 81DB61D
	get_target_type1
	if_in_bytes AI_CV_MirrorCoat_SpecialTypeList, AI_CV_MirrorCoat_End
	get_target_type2
	if_in_bytes AI_CV_MirrorCoat_SpecialTypeList, AI_CV_MirrorCoat_End
	if_random_less_than 50, AI_CV_MirrorCoat_End

@ Improvement in Emerald
@AI_CV_MirrorCoat_ScoreUp4:
@	if_random_less_than 100, AI_CV_MirrorCoat_ScoreUp4_End
@	score +4
@
@AI_CV_MirrorCoat_ScoreUp4_End:
@	end

AI_CV_MirrorCoat_ScoreDown1:: @ 81DB639
	score -1

AI_CV_MirrorCoat_End:: @ 81DB63B
	end

AI_CV_MirrorCoat_SpecialTypeList:: @ 81DB63C
	.byte TYPE_FIRE
	.byte TYPE_WATER
	.byte TYPE_GRASS
	.byte TYPE_ELECTRIC
	.byte TYPE_PSYCHIC
	.byte TYPE_ICE
	.byte TYPE_DRAGON
	.byte TYPE_DARK
	.byte -1

AI_CV_ChargeUpMove:: @ 81DB645
	if_type_effectiveness AI_EFFECTIVENESS_x0_25, AI_CV_ChargeUpMove_ScoreDown2
	if_type_effectiveness AI_EFFECTIVENESS_x0_5, AI_CV_ChargeUpMove_ScoreDown2
	if_has_move_with_effect AI_TARGET, EFFECT_PROTECT, AI_CV_ChargeUpMove_ScoreDown2
	if_hp_more_than AI_USER, 38, AI_CV_ChargeUpMove_End
	score -1
	goto AI_CV_ChargeUpMove_End

AI_CV_ChargeUpMove_ScoreDown2:: @ 81DB666
	score -2

AI_CV_ChargeUpMove_End:: @ 81DB668
	end

AI_CV_SemiInvulnerable:: @ 81DB669
	if_doesnt_have_move_with_effect AI_TARGET, EFFECT_PROTECT, AI_CV_SemiInvulnerable2
	score -1
	goto AI_CV_SemiInvulnerable_End

@ BUG: The scripts for checking type-resistance to weather for semi-invulnerable moves are swapped
@	  The result is that the AI is encouraged to stall while taking damage from weather
@	  To fix, swap _CheckSandstormTypes/_CheckIceType in the below script
AI_CV_SemiInvulnerable2:: @ 81DB677
	if_status AI_TARGET, STATUS1_TOXIC_POISON, AI_CV_SemiInvulnerable_TryEncourage
	if_status2 AI_TARGET, STATUS2_CURSED, AI_CV_SemiInvulnerable_TryEncourage
	if_status3 AI_TARGET, STATUS3_LEECHSEED, AI_CV_SemiInvulnerable_TryEncourage
	get_weather
	if_equal AI_WEATHER_HAIL, AI_CV_SemiInvulnerable_CheckSandstormTypes
	if_equal AI_WEATHER_SANDSTORM, AI_CV_SemiInvulnerable_CheckIceType
	goto AI_CV_SemiInvulnerable5

AI_CV_SemiInvulnerable_CheckSandstormTypes:: @ 81DB6A7
	get_user_type1
	if_in_bytes AI_CV_SandstormResistantTypes, AI_CV_SemiInvulnerable_TryEncourage
	get_user_type2
	if_in_bytes AI_CV_SandstormResistantTypes, AI_CV_SemiInvulnerable_TryEncourage
	goto AI_CV_SemiInvulnerable5

AI_CV_SemiInvulnerable_CheckIceType:: @ 81DB6C2
	get_user_type1
	if_equal TYPE_ICE, AI_CV_SemiInvulnerable_TryEncourage
	get_user_type2
	if_equal TYPE_ICE, AI_CV_SemiInvulnerable_TryEncourage

AI_CV_SemiInvulnerable5:: @ 81DB6D2
	if_target_faster AI_CV_SemiInvulnerable_End
	get_last_used_move AI_TARGET
	get_move_effect_from_result
	if_not_equal EFFECT_LOCK_ON, AI_CV_SemiInvulnerable_TryEncourage
	goto AI_CV_SemiInvulnerable_End

AI_CV_SemiInvulnerable_TryEncourage:: @ 81DB6E6
	if_random_less_than 80, AI_CV_SemiInvulnerable_End
	score +1

AI_CV_SemiInvulnerable_End:: @ 81DB6EE
	end

AI_CV_SandstormResistantTypes:: @ 81DB6EF
	.byte TYPE_GROUND
	.byte TYPE_ROCK
	.byte TYPE_STEEL
	.byte -1

AI_CV_FakeOut:: @ 81DB6F3
	score +2
	end

AI_CV_SpitUp:: @ 81DB6F6
	get_stockpile_count AI_USER
	if_less_than 2, AI_CV_SpitUp_End
	if_random_less_than 80, AI_CV_SpitUp_End
	score +2

AI_CV_SpitUp_End:: @ 81DB706
	end

AI_CV_Hail:: @ 81DB707
	if_hp_less_than AI_USER, 40, AI_CV_Hail_ScoreDown1
	get_weather
	if_equal AI_WEATHER_SUN, AI_CV_Hail2
	if_equal AI_WEATHER_RAIN, AI_CV_Hail2
	if_equal AI_WEATHER_SANDSTORM, AI_CV_Hail2
	goto AI_CV_Hail_End

AI_CV_Hail2:: @ 81DB726
	score +1
	goto AI_CV_Hail_End

AI_CV_Hail_ScoreDown1:: @ 81DB72D
	score -1

AI_CV_Hail_End:: @ 81DB72F
	end

@ BUG: Facade score is increased if the target is statused, but should be if the user is. Replace AI_TARGET with AI_USER
AI_CV_Facade:: @ 81DB730
	if_not_status AI_TARGET, STATUS1_POISON | STATUS1_BURN | STATUS1_PARALYSIS | STATUS1_TOXIC_POISON, AI_CV_Facade_End
	score +1

AI_CV_Facade_End:: @ 81DB73C
	end

AI_CV_FocusPunch:: @ 81DB73D
	if_type_effectiveness AI_EFFECTIVENESS_x0_25, AI_CV_FocusPunch2
	if_type_effectiveness AI_EFFECTIVENESS_x0_5, AI_CV_FocusPunch2
	if_status AI_TARGET, STATUS1_SLEEP, AI_CV_FocusPunch_ScoreUp1
	if_status2 AI_TARGET, STATUS2_INFATUATION, AI_CV_FocusPunch3
	if_status2 AI_TARGET, STATUS2_CONFUSION, AI_CV_FocusPunch3
	is_first_turn_for AI_USER
	if_not_equal 0, AI_CV_FocusPunch_End
	if_random_less_than 100, AI_CV_FocusPunch_End
	score +1
	goto AI_CV_FocusPunch_End

AI_CV_FocusPunch2:: @ 81DB77C
	score -1
	goto AI_CV_FocusPunch_End

AI_CV_FocusPunch3:: @ 81DB783
	if_random_less_than 100, AI_CV_FocusPunch_End

AI_CV_FocusPunch_ScoreUp1:: @ 81DB789
	score +1

AI_CV_FocusPunch_End:: @ 81DB78B
	end

AI_CV_SmellingSalt:: @ 81DB78C
	if_status AI_TARGET, STATUS1_PARALYSIS, AI_CV_SmellingSalt_ScoreUp1
	goto AI_CV_SmellingSalt_End

AI_CV_SmellingSalt_ScoreUp1:: @ 81DB79B
	score +1

AI_CV_SmellingSalt_End:: @ 81DB79D
	end

AI_CV_Trick:: @ 81DB79E
	get_hold_effect AI_USER
	if_in_bytes AI_CV_Trick_ChoiceEffects, AI_CV_Trick3
	if_in_bytes AI_CV_Trick_EffectsToEncourage, AI_CV_Trick4

AI_CV_Trick2:: @ 81DB7B2
	score -3
	goto AI_CV_Trick_End

AI_CV_Trick3:: @ 81DB7B9
	get_hold_effect AI_TARGET
	if_in_bytes AI_CV_Trick_ChoiceEffects, AI_CV_Trick2
	score +5
	goto AI_CV_Trick_End

AI_CV_Trick4:: @ 81DB7CB
	get_hold_effect AI_TARGET
	if_in_bytes AI_CV_Trick_EffectsToEncourage, AI_CV_Trick2
	if_random_less_than 50, AI_CV_Trick_End
	score +2

AI_CV_Trick_End:: @ 81DB7DE
	end

AI_CV_Trick_EffectsToEncourage:: @ 81DB7DF
	.byte HOLD_EFFECT_CONFUSE_SPICY
	.byte HOLD_EFFECT_CONFUSE_DRY
	.byte HOLD_EFFECT_CONFUSE_SWEET
	.byte HOLD_EFFECT_CONFUSE_BITTER
	.byte HOLD_EFFECT_CONFUSE_SOUR
	.byte HOLD_EFFECT_MACHO_BRACE
	.byte HOLD_EFFECT_CHOICE_BAND
	.byte -1

AI_CV_Trick_ChoiceEffects:: @ 81DB7E7
	.byte HOLD_EFFECT_CHOICE_BAND
	.byte -1

AI_CV_ChangeSelfAbility:: @ 81DB7E9
	get_ability AI_USER
	if_in_bytes AI_CV_ChangeSelfAbility_AbilitiesToEncourage, AI_CV_ChangeSelfAbility2
	get_ability AI_TARGET
	if_in_bytes AI_CV_ChangeSelfAbility_AbilitiesToEncourage, AI_CV_ChangeSelfAbility3

AI_CV_ChangeSelfAbility2:: @ 81DB7FF
	score -1
	goto AI_CV_ChangeSelfAbility_End

AI_CV_ChangeSelfAbility3:: @ 81DB806
	if_random_less_than 50, AI_CV_ChangeSelfAbility_End
	score +2

AI_CV_ChangeSelfAbility_End:: @ 81DB80E
	end

AI_CV_ChangeSelfAbility_AbilitiesToEncourage:: @ 81DB80F
	.byte ABILITY_SPEED_BOOST
	.byte ABILITY_BATTLE_ARMOR
	.byte ABILITY_SAND_VEIL
	.byte ABILITY_STATIC
	.byte ABILITY_FLASH_FIRE
	.byte ABILITY_WONDER_GUARD
	.byte ABILITY_EFFECT_SPORE
	.byte ABILITY_SWIFT_SWIM
	.byte ABILITY_HUGE_POWER
	.byte ABILITY_RAIN_DISH
	.byte ABILITY_CUTE_CHARM
	.byte ABILITY_SHED_SKIN
	.byte ABILITY_MARVEL_SCALE
	.byte ABILITY_PURE_POWER
	.byte ABILITY_CHLOROPHYLL
	.byte ABILITY_SHIELD_DUST
	.byte -1

AI_CV_Superpower:: @ 81DB820
	if_type_effectiveness AI_EFFECTIVENESS_x0_25, AI_CV_Superpower_ScoreDown1
	if_type_effectiveness AI_EFFECTIVENESS_x0_5, AI_CV_Superpower_ScoreDown1
	if_stat_level_less_than AI_USER, STAT_ATK, 6, AI_CV_Superpower_ScoreDown1
	if_target_faster AI_CV_Superpower2
	if_hp_more_than AI_USER, 40, AI_CV_Superpower_ScoreDown1
	goto AI_CV_Superpower_End

AI_CV_Superpower2:: @ 81DB846
	if_hp_less_than AI_USER, 60, AI_CV_Superpower_End

AI_CV_Superpower_ScoreDown1:: @ 81DB84D
	score -1

AI_CV_Superpower_End:: @ 81DB84F
	end

AI_CV_MagicCoat:: @ 81DB850
	if_hp_more_than AI_TARGET, 30, AI_CV_MagicCoat2
	if_random_less_than 100, AI_CV_MagicCoat2
	score -1

AI_CV_MagicCoat2::
	is_first_turn_for AI_USER
	if_equal 0, AI_CV_MagicCoat4
	if_random_less_than 150, AI_CV_MagicCoat_End
	score +1
	goto AI_CV_MagicCoat_End
	if_random_less_than 50, AI_CV_MagicCoat_End

AI_CV_MagicCoat3::
@	if_random_less_than 50, AI_CV_MagicCoat_End  @ Improvement in Emerald

AI_CV_MagicCoat4:: @ 81DB87A
	if_random_less_than 30, AI_CV_MagicCoat_End
	score -1

AI_CV_MagicCoat_End:: @ 81DB882
	end

AI_CV_Recycle:: @ 81DB883
	get_used_held_item AI_USER
	if_not_in_bytes AI_CV_Recycle_ItemsToEncourage, AI_CV_Recycle_ScoreDown2
	if_random_less_than 50, AI_CV_Recycle_End
	score +1
	goto AI_CV_Recycle_End

AI_CV_Recycle_ScoreDown2:: @ 81DB89B
	score -2

AI_CV_Recycle_End:: @ 81DB89D
	end

AI_CV_Recycle_ItemsToEncourage:: @ 81DB89E
	.byte ITEM_CHESTO_BERRY
	.byte ITEM_LUM_BERRY
	.byte ITEM_STARF_BERRY
	.byte -1

AI_CV_Revenge:: @ 81DB8A2
	if_status AI_TARGET, STATUS1_SLEEP, AI_CV_Revenge_ScoreDown2
	if_status2 AI_TARGET, STATUS2_INFATUATION, AI_CV_Revenge_ScoreDown2
	if_status2 AI_TARGET, STATUS2_CONFUSION, AI_CV_Revenge_ScoreDown2
	if_random_less_than 180, AI_CV_Revenge_ScoreDown2
	score +2
	goto AI_CV_Revenge_End

AI_CV_Revenge_ScoreDown2:: @ 81DB8CD
	score -2

AI_CV_Revenge_End:: @ 81DB8CF
	end

AI_CV_BrickBreak:: @ 81DB8D0
	if_side_affecting AI_TARGET, SIDE_STATUS_REFLECT, AI_CV_BrickBreak_ScoreUp1
	goto AI_CV_BrickBreak_End

AI_CV_BrickBreak_ScoreUp1:: @ 81DB8DF
	score +1

AI_CV_BrickBreak_End:: @ 81DB8E1
	end

AI_CV_KnockOff:: @ 81DB8E2
	if_hp_less_than AI_TARGET, 30, AI_CV_KnockOff_End
	is_first_turn_for AI_USER
	if_more_than 0, AI_CV_KnockOff_End
	if_random_less_than 180, AI_CV_KnockOff_End
	score +1

AI_CV_KnockOff_End:: @ 81DB8F9
	end

AI_CV_Endeavor:: @ 81DB8FA
	if_hp_less_than AI_TARGET, 70, AI_CV_Endeavor_ScoreDown1
	if_target_faster AI_CV_Endeavor2
	if_hp_more_than AI_USER, 40, AI_CV_Endeavor_ScoreDown1
	score +1
	goto AI_CV_Endeavor_End

AI_CV_Endeavor2:: @ 81DB915
	if_hp_more_than AI_USER, 50, AI_CV_Endeavor_ScoreDown1
	score +1
	goto AI_CV_Endeavor_End

AI_CV_Endeavor_ScoreDown1:: @ 81DB923
	score -1

AI_CV_Endeavor_End:: @ 81DB925
	end

AI_CV_Eruption:: @ 81DB926
	if_type_effectiveness AI_EFFECTIVENESS_x0_25, AI_CV_Eruption_ScoreDown1
	if_type_effectiveness AI_EFFECTIVENESS_x0_5, AI_CV_Eruption_ScoreDown1
	if_target_faster AI_CV_Eruption2
	if_hp_more_than AI_TARGET, 50, AI_CV_Eruption_End
	goto AI_CV_Eruption_ScoreDown1

AI_CV_Eruption2:: @ 81DB944
	if_hp_more_than AI_TARGET, 70, AI_CV_Eruption_End

AI_CV_Eruption_ScoreDown1:: @ 81DB94B
	score -1

AI_CV_Eruption_End:: @ 81DB94D
	end

AI_CV_Imprison:: @ 81DB94E
	is_first_turn_for AI_USER
	if_more_than 0, AI_CV_Imprison_End
	if_random_less_than 100, AI_CV_Imprison_End
	score +2

AI_CV_Imprison_End:: @ 81DB95E
	end

AI_CV_Refresh:: @ 81DB95F
	if_hp_less_than AI_TARGET, 50, AI_CV_Refresh_ScoreDown1
	goto AI_CV_Refresh_End

AI_CV_Refresh_ScoreDown1:: @ 81DB96B
	score -1

AI_CV_Refresh_End:: @ 81DB96D
	end

AI_CV_Snatch:: @ 81DB96E
	is_first_turn_for AI_USER
	if_equal 1, AI_CV_Snatch3
	if_random_less_than 30, AI_CV_Snatch_End
	if_target_faster AI_CV_Snatch2
	if_hp_not_equal AI_USER, 100, AI_CV_Snatch5
	if_hp_less_than AI_TARGET, 70, AI_CV_Snatch5
	if_random_less_than 60, AI_CV_Snatch_End
	goto AI_CV_Snatch5

AI_CV_Snatch2:: @ 81DB99B
	if_hp_more_than AI_TARGET, 25, AI_CV_Snatch5
	if_has_move_with_effect AI_TARGET, EFFECT_RESTORE_HP, AI_CV_Snatch3
	if_has_move_with_effect AI_TARGET, EFFECT_DEFENSE_CURL, AI_CV_Snatch3
	goto AI_CV_Snatch4

AI_CV_Snatch3:: @ 81DB9B5
	if_random_less_than 150, AI_CV_Snatch_End
	score +2
	goto AI_CV_Snatch_End

AI_CV_Snatch4:: @ 81DB9C2
	if_random_less_than 230, AI_CV_Snatch5
	score +1
	goto AI_CV_Snatch_End

AI_CV_Snatch5:: @ 81DB9CF
	if_random_less_than 30, AI_CV_Snatch_End
	score -2

AI_CV_Snatch_End:: @ 81DB9D7
	end

AI_CV_MudSport:: @ 81DB9D8
	if_hp_less_than AI_USER, 50, AI_CV_MudSport_ScoreDown1
	get_target_type1
	if_equal TYPE_ELECTRIC, AI_CV_MudSport2
	get_target_type2
	if_equal TYPE_ELECTRIC, AI_CV_MudSport2
	goto AI_CV_MudSport_ScoreDown1

AI_CV_MudSport2:: @ 81DB9F4
	score +1
	goto AI_CV_MudSport_End

AI_CV_MudSport_ScoreDown1:: @ 81DB9FB
	score -1

AI_CV_MudSport_End:: @ 81DB9FD
	end

AI_CV_Overheat:: @ 81DB9FE
	if_type_effectiveness AI_EFFECTIVENESS_x0_25, AI_CV_Overheat_ScoreDown1
	if_type_effectiveness AI_EFFECTIVENESS_x0_5, AI_CV_Overheat_ScoreDown1
	if_target_faster AI_CV_Overheat2
	if_hp_more_than AI_USER, 60, AI_CV_Overheat_End
	goto AI_CV_Overheat_ScoreDown1

AI_CV_Overheat2:: @ 81DBA1C
	if_hp_more_than AI_USER, 80, AI_CV_Overheat_End

AI_CV_Overheat_ScoreDown1:: @ 81DBA23
	score -1

AI_CV_Overheat_End:: @ 81DBA25
	end

AI_CV_WaterSport:: @ 81DBA26
	if_hp_less_than AI_USER, 50, AI_CV_WaterSport_ScoreDown1
	get_target_type1
	if_equal TYPE_FIRE, AI_CV_WaterSport2
	get_target_type2
	if_equal TYPE_FIRE, AI_CV_WaterSport2
	goto AI_CV_WaterSport_ScoreDown1

AI_CV_WaterSport2:: @ 81DBA42
	score +1
	goto AI_CV_WaterSport_End

AI_CV_WaterSport_ScoreDown1:: @ 81DBA49
	score -1

AI_CV_WaterSport_End:: @ 81DBA4B
	end

AI_CV_DragonDance:: @ 81DBA4C
	if_target_faster AI_CV_DragonDance2
	if_hp_more_than AI_USER, 50, AI_CV_DragonDance_End
	if_random_less_than 70, AI_CV_DragonDance_End
	score -1
	goto AI_CV_DragonDance_End

AI_CV_DragonDance2:: @ 81DBA66
	if_random_less_than 128, AI_CV_DragonDance_End
	score +1

AI_CV_DragonDance_End:: @ 81DBA6E
	end

AI_TryToFaint:: @ 81DBA6F
	if_can_faint AI_TryToFaint_TryToEncourageQuickAttack
	get_how_powerful_move_is
	if_equal MOVE_NOT_MOST_POWERFUL, Score_Minus1
@	if_type_effectiveness AI_EFFECTIVENESS_x4, AI_TryToFaint_DoubleSuperEffective  @ Improvement in Emerald
	end

@ Improvement in Emerald
@AI_TryToFaint_DoubleSuperEffective:
@	if_random_less_than 80, AI_TryToFaint_End
@	score +2
@	end

AI_TryToFaint_TryToEncourageQuickAttack:: @ 81DBA7C
	if_effect EFFECT_EXPLOSION, AI_TryToFaint_End
	if_not_effect EFFECT_QUICK_ATTACK, AI_TryToFaint_ScoreUp4
	score +2

AI_TryToFaint_ScoreUp4:: @ 81DBA8A
	score +4

AI_TryToFaint_End:: @ 81DBA8C
	end

AI_SetupFirstTurn:: @ 81DBA8D
	get_turn_count
	if_not_equal 0, AI_SetupFirstTurn_End
	get_considered_move_effect
	if_not_in_bytes AI_SetupFirstTurn_SetupEffectsToEncourage, AI_SetupFirstTurn_End
	if_random_less_than 80, AI_SetupFirstTurn_End
	score +2

AI_SetupFirstTurn_End:: @ 81DBAA6
	end

AI_SetupFirstTurn_SetupEffectsToEncourage:: @ 81DBAA7
	.byte EFFECT_ATTACK_UP
	.byte EFFECT_DEFENSE_UP
	.byte EFFECT_SPEED_UP
	.byte EFFECT_SPECIAL_ATTACK_UP
	.byte EFFECT_SPECIAL_DEFENSE_UP
	.byte EFFECT_ACCURACY_UP
	.byte EFFECT_EVASION_UP
	.byte EFFECT_ATTACK_DOWN
	.byte EFFECT_DEFENSE_DOWN
	.byte EFFECT_SPEED_DOWN
	.byte EFFECT_SPECIAL_ATTACK_DOWN
	.byte EFFECT_SPECIAL_DEFENSE_DOWN
	.byte EFFECT_ACCURACY_DOWN
	.byte EFFECT_EVASION_DOWN
	.byte EFFECT_CONVERSION
	.byte EFFECT_LIGHT_SCREEN
	.byte EFFECT_SPECIAL_DEFENSE_UP_2
	.byte EFFECT_FOCUS_ENERGY
	.byte EFFECT_CONFUSE
	.byte EFFECT_ATTACK_UP_2
	.byte EFFECT_DEFENSE_UP_2
	.byte EFFECT_SPEED_UP_2
	.byte EFFECT_SPECIAL_ATTACK_UP_2
	.byte EFFECT_SPECIAL_DEFENSE_UP_2
	.byte EFFECT_ACCURACY_UP_2
	.byte EFFECT_EVASION_UP_2
	.byte EFFECT_ATTACK_DOWN_2
	.byte EFFECT_DEFENSE_DOWN_2
	.byte EFFECT_SPEED_DOWN_2
	.byte EFFECT_SPECIAL_ATTACK_DOWN_2
	.byte EFFECT_SPECIAL_DEFENSE_DOWN_2
	.byte EFFECT_ACCURACY_DOWN_2
	.byte EFFECT_EVASION_DOWN_2
	.byte EFFECT_REFLECT
	.byte EFFECT_POISON
	.byte EFFECT_PARALYZE
	.byte EFFECT_SUBSTITUTE
	.byte EFFECT_LEECH_SEED
	.byte EFFECT_MINIMIZE
	.byte EFFECT_CURSE
	.byte EFFECT_SWAGGER
	.byte EFFECT_CAMOUFLAGE
	.byte EFFECT_YAWN
	.byte EFFECT_DEFENSE_CURL
	.byte EFFECT_TORMENT
	.byte EFFECT_FLATTER
	.byte EFFECT_WILL_O_WISP
	.byte EFFECT_INGRAIN
	.byte EFFECT_IMPRISON
	.byte EFFECT_TEETER_DANCE
	.byte EFFECT_TICKLE
	.byte EFFECT_COSMIC_POWER
	.byte EFFECT_BULK_UP
	.byte EFFECT_CALM_MIND
	.byte EFFECT_CAMOUFLAGE
	.byte -1

AI_PreferStrongestMove:: @ 81DBADF
	get_how_powerful_move_is
	if_not_equal MOVE_POWER_DISCOURAGED, AI_PreferStrongestMove_End
	if_random_less_than 100, AI_PreferStrongestMove_End
	score +2

AI_PreferStrongestMove_End:: @ 81DBAEE
	end

AI_Risky:: @ 81DBAEF
	get_considered_move_effect
	if_not_in_bytes AI_Risky_EffectsToEncourage, AI_Risky_End
	if_random_less_than 128, AI_Risky_End
	score +2

AI_Risky_End:: @ 81DBB01
	end

AI_Risky_EffectsToEncourage:: @ 81DBB02
	.byte EFFECT_SLEEP
	.byte EFFECT_EXPLOSION
	.byte EFFECT_MIRROR_MOVE
	.byte EFFECT_OHKO
	.byte EFFECT_HIGH_CRITICAL
	.byte EFFECT_CONFUSE
	.byte EFFECT_METRONOME
	.byte EFFECT_PSYWAVE
	.byte EFFECT_COUNTER
	.byte EFFECT_DESTINY_BOND
	.byte EFFECT_SWAGGER
	.byte EFFECT_ATTRACT
	.byte EFFECT_PRESENT
	.byte EFFECT_ALL_STATS_UP_HIT
	.byte EFFECT_BELLY_DRUM
	.byte EFFECT_MIRROR_COAT
	.byte EFFECT_FOCUS_PUNCH
	.byte EFFECT_REVENGE
	.byte EFFECT_TEETER_DANCE
	.byte -1

AI_PreferBatonPass:: @ 81DBB16
	count_alive_pokemon AI_USER
	if_equal 0, AI_PreferBatonPass_End
	get_how_powerful_move_is
	if_not_equal MOVE_POWER_DISCOURAGED, AI_PreferBatonPass_End
	if_has_move_with_effect AI_USER, EFFECT_BATON_PASS, AI_PreferBatonPass_GoForBatonPass
	if_random_less_than 80, AI_Risky_End

@ Improvement in Emerald (several below)
AI_PreferBatonPass_GoForBatonPass:: @ 81DBB32
@	if_move MOVE_SWORDS_DANCE, AI_PreferBatonPass2
@	if_move MOVE_DRAGON_DANCE, AI_PreferBatonPass2
@	if_move MOVE_CALM_MIND, AI_PreferBatonPass2
@	if_effect EFFECT_PROTECT, AI_PreferBatonPass3
@	if_move MOVE_BATON_PASS, AI_PreferBatonPass_EncourageIfHighStats
	if_random_less_than 20, AI_Risky_End
	score +3

@AI_PreferBatonPass2:
@	get_turn_count
@	if_equal 0, Score_Plus5
@	if_hp_less_than AI_USER, 60, Score_Minus10
@	goto Score_Plus1
@
@AI_PreferBatonPass3::
@	get_last_used_move AI_USER
@	if_in_hwords AI_PreferBatonPass_ProtectMoves, Score_Minus2
@	score +2
@	end
@
@AI_PreferBatonPass_ProtectMoves:
@   .2byte MOVE_PROTECT
@   .2byte MOVE_DETECT
@   .2byte -1
@
@AI_PreferBatonPass_EncourageIfHighStats:
@	get_turn_count
@	if_equal 0, Score_Minus2
@	if_stat_level_more_than AI_USER, STAT_ATK, 8, Score_Plus3
@	if_stat_level_more_than AI_USER, STAT_ATK, 7, Score_Plus2
@	if_stat_level_more_than AI_USER, STAT_ATK, 6, Score_Plus1
@	if_stat_level_more_than AI_USER, STAT_SPATK, 8, Score_Plus3
@	if_stat_level_more_than AI_USER, STAT_SPATK, 7, Score_Plus2
@	if_stat_level_more_than AI_USER, STAT_SPATK, 6, Score_Plus1
@	end

AI_PreferBatonPass_End:: @ 81DBB3A
	end

@ Empty. Expanded in Emerald
AI_DoubleBattle:: @ 81DBB3B
	end

AI_HPAware:: @ 81DBB3C
	if_hp_more_than AI_USER, 70, AI_HPAware_UserHasHighHP
	if_hp_more_than AI_USER, 30, AI_HPAware_UserHasMediumHP
	get_considered_move_effect
	if_in_bytes AI_HPAware_DiscouragedEffectsWhenLowHP, AI_HPAware_TryToDiscourage
	goto AI_HPAware_ConsiderTarget

AI_HPAware_UserHasHighHP:: @ 81DBB59
	get_considered_move_effect
	if_in_bytes AI_HPAware_DiscouragedEffectsWhenHighHP, AI_HPAware_TryToDiscourage
	goto AI_HPAware_ConsiderTarget

AI_HPAware_UserHasMediumHP:: @ 81DBB68
	get_considered_move_effect
	if_in_bytes AI_HPAware_DiscouragedEffectsWhenMediumHP, AI_HPAware_TryToDiscourage
	goto AI_HPAware_ConsiderTarget

AI_HPAware_TryToDiscourage:: @ 81DBB77
	if_random_less_than 50, AI_HPAware_ConsiderTarget
	score -2

AI_HPAware_ConsiderTarget:: @ 81DBB7F
	if_hp_more_than AI_TARGET, 70, AI_HPAware_TargetHasHighHP
	if_hp_more_than AI_TARGET, 30, AI_HPAware_TargetHasMediumHP
	get_considered_move_effect
	if_in_bytes AI_HPAware_DiscouragedEffectsWhenTargetLowHP, AI_HPAware_TargetTryToDiscourage
	goto AI_HPAware_End

AI_HPAware_TargetHasHighHP:: @ 81DBB9C
	get_considered_move_effect
	if_in_bytes AI_HPAware_DiscouragedEffectsWhenTargetHighHP, AI_HPAware_TargetTryToDiscourage
	goto AI_HPAware_End

AI_HPAware_TargetHasMediumHP:: @ 81DBBAB
	get_considered_move_effect
	if_in_bytes AI_HPAware_DiscouragedEffectsWhenTargetMediumHP, AI_HPAware_TargetTryToDiscourage
	goto AI_HPAware_End

AI_HPAware_TargetTryToDiscourage:: @ 81DBBBA
	if_random_less_than 50, AI_HPAware_End
	score -2

AI_HPAware_End:: @ 81DBBC2
	end

AI_HPAware_DiscouragedEffectsWhenHighHP:: @ 81DBBC3
	.byte EFFECT_EXPLOSION
	.byte EFFECT_RESTORE_HP
	.byte EFFECT_REST
	.byte EFFECT_DESTINY_BOND
	.byte EFFECT_FLAIL
	.byte EFFECT_ENDURE
	.byte EFFECT_MORNING_SUN
	.byte EFFECT_SYNTHESIS
	.byte EFFECT_MOONLIGHT
	.byte EFFECT_SOFTBOILED
	.byte EFFECT_MEMENTO
	.byte EFFECT_GRUDGE
	.byte EFFECT_OVERHEAT
	.byte -1

AI_HPAware_DiscouragedEffectsWhenMediumHP:: @ 81DBBD1
	.byte EFFECT_EXPLOSION
	.byte EFFECT_ATTACK_UP
	.byte EFFECT_DEFENSE_UP
	.byte EFFECT_SPEED_UP
	.byte EFFECT_SPECIAL_ATTACK_UP
	.byte EFFECT_SPECIAL_DEFENSE_UP
	.byte EFFECT_ACCURACY_UP
	.byte EFFECT_EVASION_UP
	.byte EFFECT_ATTACK_DOWN
	.byte EFFECT_DEFENSE_DOWN
	.byte EFFECT_SPEED_DOWN
	.byte EFFECT_SPECIAL_ATTACK_DOWN
	.byte EFFECT_SPECIAL_DEFENSE_DOWN
	.byte EFFECT_ACCURACY_DOWN
	.byte EFFECT_EVASION_DOWN
	.byte EFFECT_BIDE
	.byte EFFECT_CONVERSION
	.byte EFFECT_LIGHT_SCREEN
	.byte EFFECT_MIST
	.byte EFFECT_FOCUS_ENERGY
	.byte EFFECT_ATTACK_UP_2
	.byte EFFECT_DEFENSE_UP_2
	.byte EFFECT_SPEED_UP_2
	.byte EFFECT_SPECIAL_ATTACK_UP_2
	.byte EFFECT_SPECIAL_DEFENSE_UP_2
	.byte EFFECT_ACCURACY_UP_2
	.byte EFFECT_EVASION_UP_2
	.byte EFFECT_ATTACK_DOWN_2
	.byte EFFECT_DEFENSE_DOWN_2
	.byte EFFECT_SPEED_DOWN_2
	.byte EFFECT_SPECIAL_ATTACK_DOWN_2
	.byte EFFECT_SPECIAL_DEFENSE_DOWN_2
	.byte EFFECT_ACCURACY_DOWN_2
	.byte EFFECT_EVASION_DOWN_2
	.byte EFFECT_CONVERSION_2
	.byte EFFECT_SAFEGUARD
	.byte EFFECT_BELLY_DRUM
	.byte EFFECT_TICKLE
	.byte EFFECT_COSMIC_POWER
	.byte EFFECT_BULK_UP
	.byte EFFECT_CALM_MIND
	.byte EFFECT_DRAGON_DANCE
	.byte -1

AI_HPAware_DiscouragedEffectsWhenLowHP:: @ 81DBBFC
	.byte EFFECT_ATTACK_UP
	.byte EFFECT_DEFENSE_UP
	.byte EFFECT_SPEED_UP
	.byte EFFECT_SPECIAL_ATTACK_UP
	.byte EFFECT_SPECIAL_DEFENSE_UP
	.byte EFFECT_ACCURACY_UP
	.byte EFFECT_EVASION_UP
	.byte EFFECT_ATTACK_DOWN
	.byte EFFECT_DEFENSE_DOWN
	.byte EFFECT_SPEED_DOWN
	.byte EFFECT_SPECIAL_ATTACK_DOWN
	.byte EFFECT_SPECIAL_DEFENSE_DOWN
	.byte EFFECT_ACCURACY_DOWN
	.byte EFFECT_EVASION_DOWN
	.byte EFFECT_BIDE
	.byte EFFECT_CONVERSION
	.byte EFFECT_LIGHT_SCREEN
	.byte EFFECT_MIST
	.byte EFFECT_FOCUS_ENERGY
	.byte EFFECT_ATTACK_UP_2
	.byte EFFECT_DEFENSE_UP_2
	.byte EFFECT_SPEED_UP_2
	.byte EFFECT_SPECIAL_ATTACK_UP_2
	.byte EFFECT_SPECIAL_DEFENSE_UP_2
	.byte EFFECT_ACCURACY_UP_2
	.byte EFFECT_EVASION_UP_2
	.byte EFFECT_ATTACK_DOWN_2
	.byte EFFECT_DEFENSE_DOWN_2
	.byte EFFECT_SPEED_DOWN_2
	.byte EFFECT_SPECIAL_ATTACK_DOWN_2
	.byte EFFECT_SPECIAL_DEFENSE_DOWN_2
	.byte EFFECT_ACCURACY_DOWN_2
	.byte EFFECT_EVASION_DOWN_2
	.byte EFFECT_RAGE
	.byte EFFECT_CONVERSION_2
	.byte EFFECT_LOCK_ON
	.byte EFFECT_SAFEGUARD
	.byte EFFECT_BELLY_DRUM
	.byte EFFECT_PSYCH_UP
	.byte EFFECT_MIRROR_COAT
	.byte EFFECT_SOLARBEAM
	.byte EFFECT_ERUPTION
	.byte EFFECT_TICKLE
	.byte EFFECT_COSMIC_POWER
	.byte EFFECT_BULK_UP
	.byte EFFECT_CALM_MIND
	.byte EFFECT_DRAGON_DANCE
	.byte -1

AI_HPAware_DiscouragedEffectsWhenTargetHighHP:: @ 81DBC2C
	.byte -1

AI_HPAware_DiscouragedEffectsWhenTargetMediumHP:: @ 81DBC2D
	.byte EFFECT_ATTACK_UP
	.byte EFFECT_DEFENSE_UP
	.byte EFFECT_SPEED_UP
	.byte EFFECT_SPECIAL_ATTACK_UP
	.byte EFFECT_SPECIAL_DEFENSE_UP
	.byte EFFECT_ACCURACY_UP
	.byte EFFECT_EVASION_UP
	.byte EFFECT_ATTACK_DOWN
	.byte EFFECT_DEFENSE_DOWN
	.byte EFFECT_SPEED_DOWN
	.byte EFFECT_SPECIAL_ATTACK_DOWN
	.byte EFFECT_SPECIAL_DEFENSE_DOWN
	.byte EFFECT_ACCURACY_DOWN
	.byte EFFECT_EVASION_DOWN
	.byte EFFECT_MIST
	.byte EFFECT_FOCUS_ENERGY
	.byte EFFECT_ATTACK_UP_2
	.byte EFFECT_DEFENSE_UP_2
	.byte EFFECT_SPEED_UP_2
	.byte EFFECT_SPECIAL_ATTACK_UP_2
	.byte EFFECT_SPECIAL_DEFENSE_UP_2
	.byte EFFECT_ACCURACY_UP_2
	.byte EFFECT_EVASION_UP_2
	.byte EFFECT_ATTACK_DOWN_2
	.byte EFFECT_DEFENSE_DOWN_2
	.byte EFFECT_SPEED_DOWN_2
	.byte EFFECT_SPECIAL_ATTACK_DOWN_2
	.byte EFFECT_SPECIAL_DEFENSE_DOWN_2
	.byte EFFECT_ACCURACY_DOWN_2
	.byte EFFECT_EVASION_DOWN_2
	.byte EFFECT_POISON
	.byte EFFECT_PAIN_SPLIT
	.byte EFFECT_PERISH_SONG
	.byte EFFECT_SAFEGUARD
	.byte EFFECT_TICKLE
	.byte EFFECT_COSMIC_POWER
	.byte EFFECT_BULK_UP
	.byte EFFECT_CALM_MIND
	.byte EFFECT_DRAGON_DANCE
	.byte -1

AI_HPAware_DiscouragedEffectsWhenTargetLowHP:: @ 81DBC55
	.byte EFFECT_SLEEP
	.byte EFFECT_EXPLOSION
	.byte EFFECT_ATTACK_UP
	.byte EFFECT_DEFENSE_UP
	.byte EFFECT_SPEED_UP
	.byte EFFECT_SPECIAL_ATTACK_UP
	.byte EFFECT_SPECIAL_DEFENSE_UP
	.byte EFFECT_ACCURACY_UP
	.byte EFFECT_EVASION_UP
	.byte EFFECT_ATTACK_DOWN
	.byte EFFECT_DEFENSE_DOWN
	.byte EFFECT_SPEED_DOWN
	.byte EFFECT_SPECIAL_ATTACK_DOWN
	.byte EFFECT_SPECIAL_DEFENSE_DOWN
	.byte EFFECT_ACCURACY_DOWN
	.byte EFFECT_EVASION_DOWN
	.byte EFFECT_BIDE
	.byte EFFECT_CONVERSION
	.byte EFFECT_TOXIC
	.byte EFFECT_LIGHT_SCREEN
	.byte EFFECT_OHKO
	.byte EFFECT_SUPER_FANG  @ Maybe supposed to be EFFECT_RAZOR_WIND
	.byte EFFECT_SUPER_FANG
	.byte EFFECT_MIST
	.byte EFFECT_FOCUS_ENERGY
	.byte EFFECT_CONFUSE
	.byte EFFECT_ATTACK_UP_2
	.byte EFFECT_DEFENSE_UP_2
	.byte EFFECT_SPEED_UP_2
	.byte EFFECT_SPECIAL_ATTACK_UP_2
	.byte EFFECT_SPECIAL_DEFENSE_UP_2
	.byte EFFECT_ACCURACY_UP_2
	.byte EFFECT_EVASION_UP_2
	.byte EFFECT_ATTACK_DOWN_2
	.byte EFFECT_DEFENSE_DOWN_2
	.byte EFFECT_SPEED_DOWN_2
	.byte EFFECT_SPECIAL_ATTACK_DOWN_2
	.byte EFFECT_SPECIAL_DEFENSE_DOWN_2
	.byte EFFECT_ACCURACY_DOWN_2
	.byte EFFECT_EVASION_DOWN_2
	.byte EFFECT_POISON
	.byte EFFECT_PARALYZE
	.byte EFFECT_PAIN_SPLIT
	.byte EFFECT_CONVERSION_2
	.byte EFFECT_LOCK_ON
	.byte EFFECT_SPITE
	.byte EFFECT_PERISH_SONG
	.byte EFFECT_SWAGGER
	.byte EFFECT_FURY_CUTTER
	.byte EFFECT_ATTRACT
	.byte EFFECT_SAFEGUARD
	.byte EFFECT_PSYCH_UP
	.byte EFFECT_MIRROR_COAT
	.byte EFFECT_WILL_O_WISP
	.byte EFFECT_TICKLE
	.byte EFFECT_COSMIC_POWER
	.byte EFFECT_BULK_UP
	.byte EFFECT_CALM_MIND
	.byte EFFECT_DRAGON_DANCE
	.byte -1

AI_Unknown:: @ 81DBC91
	if_not_effect EFFECT_SUNNY_DAY, AI_Unknown_End
	if_equal 0, AI_Unknown_End
	is_first_turn_for AI_USER
	if_equal 0, AI_Unknown_End
	score +5

AI_Unknown_End:: @ 81DBCA7
	end

AI_Roaming:: @ 81DBCA8
	if_status2 AI_USER, STATUS2_WRAPPED, AI_Roaming_End
	if_status2 AI_USER, STATUS2_ESCAPE_PREVENTION, AI_Roaming_End
	get_ability AI_TARGET
	if_equal ABILITY_SHADOW_TAG, AI_Roaming_End
	get_ability AI_USER
	if_equal ABILITY_LEVITATE, AI_Roaming_Flee
	get_ability AI_TARGET
	if_equal ABILITY_ARENA_TRAP, AI_Roaming_End

AI_Roaming_Flee:: @ 81DBCD4
	flee

AI_Roaming_End:: @ 81DBCD5
	end

AI_Safari:: @ 81DBCD6
	if_random_safari_flee AI_Safari_Flee
	watch

AI_Safari_Flee:: @ 81DBCDC
	flee

@ From Hoenns Poochyena fight (Zigzagoon in Emerald)
AI_FirstBattle:: @ 81DBCDD
	if_hp_equal AI_TARGET, 20, AI_FirstBattle_Flee
	if_hp_less_than AI_TARGET, 20, AI_FirstBattle_Flee
	end

AI_FirstBattle_Flee:: @ 81DBCEC
	flee

AI_Ret:: @ 81DBCED
	end
