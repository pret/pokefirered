	.include "asm/macros.inc"
	.include "constants/constants.inc"
	.include "asm/macros/battle_ai_script.inc"

	.section script_data, "aw", %progbits

BattleAIs:: @ 81D9BF4
	.4byte AI_CheckBadMove
	.4byte AI_TryToFaint
	.4byte AI_CheckViability
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
	is_most_powerful_move
	if_equal 0, AI_sub_81D9CE0
	if_damage_bonus 0, AI_sub_81DA433
	get_ability 0
	if_equal 10, AI_sub_81D9CA6
	if_equal 11, AI_sub_81D9CB3
	if_equal 18, AI_sub_81D9CC0
	if_equal 25, AI_sub_81D9CCD
	if_equal 26, AI_sub_81D9CD8
	jump AI_sub_81D9CE0

AI_sub_81D9CA6:: @ 81D9CA6
	get_type 4
	if_arg_equal 13, AI_sub_81DA436
	jump AI_sub_81D9CE0

AI_sub_81D9CB3:: @ 81D9CB3
	get_type 4
	if_arg_equal 11, AI_sub_81DA436
	jump AI_sub_81D9CE0

AI_sub_81D9CC0:: @ 81D9CC0
	get_type 4
	if_arg_equal 10, AI_sub_81DA436
	jump AI_sub_81D9CE0

AI_sub_81D9CCD:: @ 81D9CCD
	if_damage_bonus 80, AI_sub_81D9CE0
	jump AI_sub_81DA433

AI_sub_81D9CD8:: @ 81D9CD8
	get_type 4
	if_arg_equal 4, AI_sub_81DA433

AI_sub_81D9CE0:: @ 81D9CE0
	get_ability 0
	if_not_equal 43, AI_sub_81D9D27
	if_move 45, AI_sub_81DA433
	if_move 46, AI_sub_81DA433
	if_move 47, AI_sub_81DA433
	if_move 48, AI_sub_81DA433
	if_move 103, AI_sub_81DA433
	if_move 173, AI_sub_81DA433
	if_move 253, AI_sub_81DA433
	if_move 319, AI_sub_81DA433
	if_move 320, AI_sub_81DA433

AI_sub_81D9D27:: @ 81D9D27
	if_effect 1, AI_sub_81D9FB6
	if_effect 7, AI_sub_81D9FCF
	if_effect 8, AI_sub_81DA008
	if_effect 10, AI_sub_81DA020
	if_effect 11, AI_sub_81DA029
	if_effect 12, AI_sub_81DA032
	if_effect 13, AI_sub_81DA03B
	if_effect 14, AI_sub_81DA044
	if_effect 15, AI_sub_81DA04D
	if_effect 16, AI_sub_81DA056
	if_effect 18, AI_sub_81DA05F
	if_effect 19, AI_sub_81DA074
	if_effect 20, AI_sub_81DA081
	if_effect 21, AI_sub_81DA08E
	if_effect 22, AI_sub_81DA09B
	if_effect 23, AI_sub_81DA0A8
	if_effect 24, AI_sub_81DA0BD
	if_effect 25, AI_sub_81DA0D4
	if_effect 26, AI_sub_81DA1B2
	if_effect 28, AI_sub_81DA14A
	if_effect 33, AI_sub_81DA15B
	if_effect 35, AI_sub_81DA18A
	if_effect 38, AI_sub_81DA195
	if_effect 39, AI_sub_81DA1B2
	if_effect 40, AI_sub_81DA1B2
	if_effect 46, AI_sub_81DA1CC
	if_effect 47, AI_sub_81DA1D7
	if_effect 49, AI_sub_81DA1E2
	if_effect 50, AI_sub_81DA020
	if_effect 51, AI_sub_81DA029
	if_effect 52, AI_sub_81DA032
	if_effect 53, AI_sub_81DA03B
	if_effect 54, AI_sub_81DA044
	if_effect 55, AI_sub_81DA04D
	if_effect 56, AI_sub_81DA056
	if_effect 58, AI_sub_81DA05F
	if_effect 59, AI_sub_81DA074
	if_effect 60, AI_sub_81DA081
	if_effect 61, AI_sub_81DA08E
	if_effect 62, AI_sub_81DA09B
	if_effect 63, AI_sub_81DA0A8
	if_effect 64, AI_sub_81DA0BD
	if_effect 65, AI_sub_81DA1F5
	if_effect 66, AI_sub_81DA15B
	if_effect 67, AI_sub_81DA200
	if_effect 79, AI_sub_81DA219
	if_effect 80, AI_sub_81DA1B2
	if_effect 84, AI_sub_81DA22B
	if_effect 86, AI_sub_81DA246
	if_effect 87, AI_sub_81DA1B2
	if_effect 88, AI_sub_81DA1B2
	if_effect 89, AI_sub_81DA1B2
	if_effect 90, AI_sub_81DA24E
	if_effect 92, AI_sub_81DA256
	if_effect 97, AI_sub_81DA256
	if_effect 99, AI_sub_81DA1B2
	if_effect 106, AI_sub_81DA261
	if_effect 107, AI_sub_81D9FF3
	if_effect 108, AI_sub_81DA056
	if_effect 109, AI_sub_81DA26C
	if_effect 112, AI_sub_81DA27D
	if_effect 113, AI_sub_81DA288
	if_effect 114, AI_sub_81DA293
	if_effect 115, AI_sub_81DA29E
	if_effect 118, AI_sub_81DA1E2
	if_effect 120, AI_sub_81DA2A6
	if_effect 121, AI_sub_81DA1B2
	if_effect 122, AI_sub_81DA1B2
	if_effect 123, AI_sub_81DA1B2
	if_effect 124, AI_sub_81DA2E6
	if_effect 126, AI_sub_81DA1AA
	if_effect 127, AI_sub_81DA301
	if_effect -126, AI_sub_81DA1B2
	if_effect -120, AI_sub_81DA30A
	if_effect -119, AI_sub_81DA312
	if_effect -114, AI_sub_81DA019
	if_effect -113, AI_sub_81DA0D4
	if_effect -112, AI_sub_81DA1B2
	if_effect -111, AI_sub_81DA1B2
	if_effect -108, AI_sub_81DA31A
	if_effect -103, AI_sub_81DA433
	if_effect -100, AI_sub_81DA029
	if_effect -98, AI_sub_81DA325
	if_effect -96, AI_sub_81DA32E
	if_effect -95, AI_sub_81DA337
	if_effect -94, AI_sub_81DA337
	if_effect -92, AI_sub_81DA346
	if_effect -91, AI_sub_81DA34E
	if_effect -90, AI_sub_81DA1E2
	if_effect -89, AI_sub_81DA359
	if_effect -88, AI_sub_81DA2F1
	if_effect -86, AI_sub_81DA1B2
	if_effect -80, AI_sub_81DA37E
	if_effect -79, AI_sub_81DA386
	if_effect -75, AI_sub_81DA38F
	if_effect -74, AI_sub_81DA1B2
	if_effect -72, AI_sub_81DA39A
	if_effect -68, AI_sub_81DA386
	if_effect -67, AI_sub_81DA1B2
	if_effect -64, AI_sub_81DA3A3
	if_effect -63, AI_sub_81DA3AE
	if_effect -60, AI_sub_81DA1B2
	if_effect -55, AI_sub_81DA3B9
	if_effect -51, AI_sub_81DA3C4
	if_effect -50, AI_sub_81DA3D5
	if_effect -48, AI_sub_81DA3E6
	if_effect -46, AI_sub_81DA3F7
	if_effect -45, AI_sub_81DA402
	if_effect -44, AI_sub_81DA413
	end

AI_sub_81D9FB6:: @ 81D9FB6
	get_ability 0
	if_equal 15, AI_sub_81DA433
	if_equal 72, AI_sub_81DA433
	if_status 0, 255, AI_sub_81DA433
	end

AI_sub_81D9FCF:: @ 81D9FCF
	if_damage_bonus 0, AI_sub_81DA433
	get_ability 0
	if_equal 6, AI_sub_81DA433
	count_alive_pokemon 1
	if_not_equal 0, AI_sub_81D9FF2
	count_alive_pokemon 0
	if_not_equal 0, AI_sub_81DA433
	jump AI_sub_81DA424

AI_sub_81D9FF2:: @ 81D9FF2
	end

AI_sub_81D9FF3:: @ 81D9FF3
	if_status2 0, 0x8000000, AI_sub_81DA433
	if_not_status 0, 7, AI_sub_81DA430
	end

AI_sub_81DA008:: @ 81DA008
	if_not_status 0, 7, AI_sub_81DA430
	if_damage_bonus 0, AI_sub_81DA433
	end

AI_sub_81DA019:: @ 81DA019
	if_hp_less_than 1, 51, AI_sub_81DA433

AI_sub_81DA020:: @ 81DA020
	if_stat_level_equal 1, 1, 12, AI_sub_81DA433
	end

AI_sub_81DA029:: @ 81DA029
	if_stat_level_equal 1, 2, 12, AI_sub_81DA433
	end

AI_sub_81DA032:: @ 81DA032
	if_stat_level_equal 1, 3, 12, AI_sub_81DA433
	end

AI_sub_81DA03B:: @ 81DA03B
	if_stat_level_equal 1, 4, 12, AI_sub_81DA433
	end

AI_sub_81DA044:: @ 81DA044
	if_stat_level_equal 1, 5, 12, AI_sub_81DA433
	end

AI_sub_81DA04D:: @ 81DA04D
	if_stat_level_equal 1, 6, 12, AI_sub_81DA433
	end

AI_sub_81DA056:: @ 81DA056
	if_stat_level_equal 1, 7, 12, AI_sub_81DA433
	end

AI_sub_81DA05F:: @ 81DA05F
	if_stat_level_equal 0, 1, 0, AI_sub_81DA433
	get_ability 0
	if_equal 52, AI_sub_81DA433
	jump AI_sub_81DA0C5

AI_sub_81DA074:: @ 81DA074
	if_stat_level_equal 0, 2, 0, AI_sub_81DA433
	jump AI_sub_81DA0C5

AI_sub_81DA081:: @ 81DA081
	if_stat_level_equal 0, 3, 0, AI_sub_81DA433
	jump AI_sub_81DA0C5

AI_sub_81DA08E:: @ 81DA08E
	if_stat_level_equal 0, 4, 0, AI_sub_81DA433
	jump AI_sub_81DA0C5

AI_sub_81DA09B:: @ 81DA09B
	if_stat_level_equal 0, 5, 0, AI_sub_81DA433
	jump AI_sub_81DA0C5

AI_sub_81DA0A8:: @ 81DA0A8
	if_stat_level_equal 0, 6, 0, AI_sub_81DA433
	get_ability 0
	if_equal 51, AI_sub_81DA433
	jump AI_sub_81DA0C5

AI_sub_81DA0BD:: @ 81DA0BD
	if_stat_level_equal 0, 7, 0, AI_sub_81DA433

AI_sub_81DA0C5:: @ 81DA0C5
	get_ability 0
	if_equal 29, AI_sub_81DA433
	if_equal 73, AI_sub_81DA433
	end

AI_sub_81DA0D4:: @ 81DA0D4
	if_stat_level_less_than 1, 1, 6, AI_sub_81DA149
	if_stat_level_less_than 1, 2, 6, AI_sub_81DA149
	if_stat_level_less_than 1, 3, 6, AI_sub_81DA149
	if_stat_level_less_than 1, 4, 6, AI_sub_81DA149
	if_stat_level_less_than 1, 5, 6, AI_sub_81DA149
	if_stat_level_less_than 1, 6, 6, AI_sub_81DA149
	if_stat_level_less_than 1, 7, 6, AI_sub_81DA149
	if_stat_level_more_than 0, 1, 6, AI_sub_81DA149
	if_stat_level_more_than 0, 2, 6, AI_sub_81DA149
	if_stat_level_more_than 0, 3, 6, AI_sub_81DA149
	if_stat_level_more_than 0, 4, 6, AI_sub_81DA149
	if_stat_level_more_than 0, 5, 6, AI_sub_81DA149
	if_stat_level_more_than 0, 6, 6, AI_sub_81DA149
	if_stat_level_more_than 0, 7, 6, AI_sub_81DA149
	jump AI_sub_81DA433

AI_sub_81DA149:: @ 81DA149
	end

AI_sub_81DA14A:: @ 81DA14A
	count_alive_pokemon 0
	if_equal 0, AI_sub_81DA433
	get_ability 0
	if_equal 21, AI_sub_81DA433
	end

AI_sub_81DA15B:: @ 81DA15B
	get_type 0
	if_equal 8, AI_sub_81DA433
	if_equal 3, AI_sub_81DA433
	get_type 2
	if_equal 8, AI_sub_81DA433
	if_equal 3, AI_sub_81DA433
	get_ability 0
	if_equal 17, AI_sub_81DA433
	if_status 0, 255, AI_sub_81DA433
	end

AI_sub_81DA18A:: @ 81DA18A
	if_status4 1, 2, AI_sub_81DA430
	end

AI_sub_81DA195:: @ 81DA195
	if_damage_bonus 0, AI_sub_81DA433
	get_ability 0
	if_equal 5, AI_sub_81DA433
	if_level_cond 1, AI_sub_81DA433
	end

AI_sub_81DA1AA:: @ 81DA1AA
	get_ability 0
	if_equal 26, AI_sub_81DA433

AI_sub_81DA1B2:: @ 81DA1B2
	if_damage_bonus 0, AI_sub_81DA433
	get_ability 0
	if_not_equal 25, AI_sub_81DA1CB
	if_damage_bonus 80, AI_sub_81DA1CB
	jump AI_sub_81DA433

AI_sub_81DA1CB:: @ 81DA1CB
	end

AI_sub_81DA1CC:: @ 81DA1CC
	if_status4 1, 256, AI_sub_81DA430
	end

AI_sub_81DA1D7:: @ 81DA1D7
	if_status2 1, 1048576, AI_sub_81DA433
	end

AI_sub_81DA1E2:: @ 81DA1E2
	if_status2 0, 7, AI_sub_81DA42D
	get_ability 0
	if_equal 20, AI_sub_81DA433
	end

AI_sub_81DA1F5:: @ 81DA1F5
	if_status4 1, 1, AI_sub_81DA430
	end

AI_sub_81DA200:: @ 81DA200
	if_damage_bonus 0, AI_sub_81DA433
	get_ability 0
	if_equal 7, AI_sub_81DA433
	if_status 0, 255, AI_sub_81DA433
	end

AI_sub_81DA219:: @ 81DA219
	if_status2 1, 16777216, AI_sub_81DA430
	if_hp_less_than 1, 26, AI_sub_81DA433
	end

AI_sub_81DA22B:: @ 81DA22B
	if_status3 0, 4, AI_sub_81DA433
	get_type 0
	if_equal 12, AI_sub_81DA433
	get_type 2
	if_equal 12, AI_sub_81DA433
	end

AI_sub_81DA246:: @ 81DA246
	if_last_move_did_damage 0, 0, AI_sub_81DA430
	end

AI_sub_81DA24E:: @ 81DA24E
	if_last_move_did_damage 0, 1, AI_sub_81DA430
	end

AI_sub_81DA256:: @ 81DA256
	if_not_status 1, 7, AI_sub_81DA430
	end

AI_sub_81DA261:: @ 81DA261
	if_status2 0, 67108864, AI_sub_81DA433
	end

AI_sub_81DA26C:: @ 81DA26C
	if_stat_level_equal 1, 1, 12, AI_sub_81DA433
	if_stat_level_equal 1, 2, 12, AI_sub_81DA430
	end

AI_sub_81DA27D:: @ 81DA27D
	if_status4 0, 16, AI_sub_81DA433
	end

AI_sub_81DA288:: @ 81DA288
	if_status2 0, 536870912, AI_sub_81DA433
	end

AI_sub_81DA293:: @ 81DA293
	if_status3 0, 32, AI_sub_81DA433
	end

AI_sub_81DA29E:: @ 81DA29E
	get_weather
	if_equal 2, AI_sub_81DA430
	end

AI_sub_81DA2A6:: @ 81DA2A6
	if_status2 0, 983040, AI_sub_81DA433
	get_ability 0
	if_equal 12, AI_sub_81DA433
	get_gender 1
	if_equal 0, AI_sub_81DA2CB
	if_equal -2, AI_sub_81DA2D8
	jump AI_sub_81DA433

AI_sub_81DA2CB:: @ 81DA2CB
	get_gender 0
	if_equal -2, AI_sub_81DA2E5
	jump AI_sub_81DA433

AI_sub_81DA2D8:: @ 81DA2D8
	get_gender 0
	if_equal 0, AI_sub_81DA2E5
	jump AI_sub_81DA433

AI_sub_81DA2E5:: @ 81DA2E5
	end

AI_sub_81DA2E6:: @ 81DA2E6
	if_status4 1, 32, AI_sub_81DA430
	end

AI_sub_81DA2F1:: @ 81DA2F1
	if_stat_level_equal 0, 1, 0, AI_sub_81DA433
	if_stat_level_equal 0, 4, 0, AI_sub_81DA430

AI_sub_81DA301:: @ 81DA301
	count_alive_pokemon 1
	if_equal 0, AI_sub_81DA433
	end

AI_sub_81DA30A:: @ 81DA30A
	get_weather
	if_equal 1, AI_sub_81DA430
	end

AI_sub_81DA312:: @ 81DA312
	get_weather
	if_equal 0, AI_sub_81DA430
	end

AI_sub_81DA31A:: @ 81DA31A
	if_status4 0, 64, AI_sub_81DA433
	end

AI_sub_81DA325:: @ 81DA325
	is_first_turn 1
	if_equal 0, AI_sub_81DA433
	end

AI_sub_81DA32E:: @ 81DA32E
	get_stockpile_count 1
	if_equal 3, AI_sub_81DA433
	end

AI_sub_81DA337:: @ 81DA337
	if_damage_bonus 0, AI_sub_81DA433
	get_stockpile_count 1
	if_equal 0, AI_sub_81DA433
	end

AI_sub_81DA346:: @ 81DA346
	get_weather
	if_equal 3, AI_sub_81DA430
	end

AI_sub_81DA34E:: @ 81DA34E
	if_status2 0, -2147483648, AI_sub_81DA433
	end

AI_sub_81DA359:: @ 81DA359
	get_ability 0
	if_equal 41, AI_sub_81DA433
	if_status 0, 255, AI_sub_81DA433
	if_damage_bonus 0, AI_sub_81DA433
	if_damage_bonus 20, AI_sub_81DA433
	if_damage_bonus 10, AI_sub_81DA433
	end

AI_sub_81DA37E:: @ 81DA37E
	is_double_battle
	if_equal 0, AI_sub_81DA433
	end

AI_sub_81DA386:: @ 81DA386
	get_ability 0
	if_equal 60, AI_sub_81DA433
	end

AI_sub_81DA38F:: @ 81DA38F
	if_status3 1, 1024, AI_sub_81DA433
	end

AI_sub_81DA39A:: @ 81DA39A
	get_item 1
	if_equal 0, AI_sub_81DA433
	end

AI_sub_81DA3A3:: @ 81DA3A3
	if_status3 1, 8192, AI_sub_81DA433
	end

AI_sub_81DA3AE:: @ 81DA3AE
	if_not_status 1, 216, AI_sub_81DA433
	end

AI_sub_81DA3B9:: @ 81DA3B9
	if_status3 1, 65536, AI_sub_81DA433
	end

AI_sub_81DA3C4:: @ 81DA3C4
	if_stat_level_equal 0, 1, 0, AI_sub_81DA433
	if_stat_level_equal 0, 2, 0, AI_sub_81DA430
	end

AI_sub_81DA3D5:: @ 81DA3D5
	if_stat_level_equal 1, 2, 12, AI_sub_81DA433
	if_stat_level_equal 1, 5, 12, AI_sub_81DA430
	end

AI_sub_81DA3E6:: @ 81DA3E6
	if_stat_level_equal 1, 1, 12, AI_sub_81DA433
	if_stat_level_equal 1, 2, 12, AI_sub_81DA430
	end

AI_sub_81DA3F7:: @ 81DA3F7
	if_status3 1, 131072, AI_sub_81DA433
	end

AI_sub_81DA402:: @ 81DA402
	if_stat_level_equal 1, 4, 12, AI_sub_81DA433
	if_stat_level_equal 1, 5, 12, AI_sub_81DA430
	end

AI_sub_81DA413:: @ 81DA413
	if_stat_level_equal 1, 1, 12, AI_sub_81DA433
	if_stat_level_equal 1, 3, 12, AI_sub_81DA430
	end

AI_sub_81DA424:: @ 81DA424
	score -1
	end

AI_sub_81DA427:: @ 81DA427
	score -2
	end

AI_sub_81DA42A:: @ 81DA42A
	score -3
	end

AI_sub_81DA42D:: @ 81DA42D
	score -5
	end

AI_sub_81DA430:: @ 81DA430
	score -8
	end

AI_sub_81DA433:: @ 81DA433
	score -10
	end

AI_sub_81DA436:: @ 81DA436
	score -12
	end
	score 1
	end
	score 2
	end
	score 3
	end
	score 5
	end

AI_TryToFaint:: @ 81DA445
	if_effect 1, AI_sub_81DA71C
	if_effect 3, AI_sub_81DA738
	if_effect 7, AI_sub_81DA752
	if_effect 8, AI_sub_81DA7B0
	if_effect 9, AI_sub_81DA7C4
	if_effect 10, AI_sub_81DA848
	if_effect 11, AI_sub_81DA883
	if_effect 12, AI_sub_81DA8E9
	if_effect 13, AI_sub_81DA8FF
	if_effect 14, AI_sub_81DA93A
	if_effect 15, AI_sub_81DA9A0
	if_effect 16, AI_sub_81DA9BA
	if_effect 17, AI_sub_81DAA54
	if_effect 18, AI_sub_81DAA84
	if_effect 19, AI_sub_81DAAD6
	if_effect 20, AI_sub_81DAB0D
	if_effect 21, AI_sub_81DAB23
	if_effect 22, AI_sub_81DAB77
	if_effect 23, AI_sub_81DAB98
	if_effect 24, AI_sub_81DAC2C
	if_effect 25, AI_sub_81DAC4D
	if_effect 26, AI_sub_81DAD10
	if_effect 28, AI_sub_81DAD1A
	if_effect 30, AI_sub_81DAD52
	if_effect 32, AI_sub_81DAD83
	if_effect 33, AI_sub_81DADDC
	if_effect 35, AI_sub_81DAE1B
	if_effect 37, AI_sub_81DAE4A
	if_effect 38, AI_sub_81DAEAA
	if_effect 39, AI_sub_81DB645
	if_effect 40, AI_sub_81DAEAB
	if_effect 42, AI_sub_81DAEB5
	if_effect 43, AI_sub_81DAEEB
	if_effect 49, AI_sub_81DAF1A
	if_effect 50, AI_sub_81DA848
	if_effect 51, AI_sub_81DA883
	if_effect 52, AI_sub_81DA8E9
	if_effect 53, AI_sub_81DA8FF
	if_effect 54, AI_sub_81DA93A
	if_effect 55, AI_sub_81DA9A0
	if_effect 56, AI_sub_81DA9BA
	if_effect 58, AI_sub_81DAA84
	if_effect 59, AI_sub_81DAAD6
	if_effect 60, AI_sub_81DAB0D
	if_effect 61, AI_sub_81DAB23
	if_effect 62, AI_sub_81DAB77
	if_effect 63, AI_sub_81DAB98
	if_effect 64, AI_sub_81DAC2C
	if_effect 65, AI_sub_81DAF3C
	if_effect 66, AI_sub_81DAF6C
	if_effect 67, AI_sub_81DAF7D
	if_effect 70, AI_sub_81DAAF7
	if_effect 75, AI_sub_81DB645
	if_effect 78, AI_sub_81DAF9A
	if_effect 79, AI_sub_81DAFBD
	if_effect 80, AI_sub_81DB053
	if_effect 84, AI_sub_81DADDC
	if_effect 86, AI_sub_81DB07B
	if_effect 89, AI_sub_81DB09A
	if_effect 90, AI_sub_81DB13B
	if_effect 91, AI_sub_81DB1A3
	if_effect 92, AI_sub_81DB1CF
	if_effect 94, AI_sub_81DB1D2
	if_effect 97, AI_sub_81DB1DB
	if_effect 98, AI_sub_81DB1DE
	if_effect 99, AI_sub_81DB214
	if_effect 102, AI_sub_81DB259
	if_effect 105, AI_sub_81DB270
	if_effect 106, AI_sub_81DAEB5
	if_effect 108, AI_sub_81DA9BA
	if_effect 109, AI_sub_81DB293
	if_effect 111, AI_sub_81DB2E2
	if_effect 113, AI_sub_81DB3A3
	if_effect 116, AI_sub_81DB3D1
	if_effect 127, AI_sub_81DB3EF
	if_effect -128, AI_sub_81DB48B
	if_effect -124, AI_sub_81DAD69
	if_effect -123, AI_sub_81DAD69
	if_effect -122, AI_sub_81DAD69
	if_effect -120, AI_sub_81DB4C1
	if_effect -119, AI_sub_81DB500
	if_effect -114, AI_sub_81DB529
	if_effect -113, AI_sub_81DB538
	if_effect -112, AI_sub_81DB5A5
	if_effect -111, AI_sub_81DB645
	if_effect -105, AI_sub_81DB645
	if_effect -101, AI_sub_81DB669
	if_effect -99, AI_sub_81DAD83
	if_effect -98, AI_sub_81DB6F3
	if_effect -95, AI_sub_81DB6F6
	if_effect -94, AI_sub_81DAD83
	if_effect -92, AI_sub_81DB707
	if_effect -90, AI_sub_81DAF12
	if_effect -88, AI_sub_81DA752
	if_effect -87, AI_sub_81DB730
	if_effect -86, AI_sub_81DB73D
	if_effect -85, AI_sub_81DB78C
	if_effect -79, AI_sub_81DB79E
	if_effect -78, AI_sub_81DB7E9
	if_effect -74, AI_sub_81DB820
	if_effect -73, AI_sub_81DB850
	if_effect -72, AI_sub_81DB883
	if_effect -71, AI_sub_81DB8A2
	if_effect -70, AI_sub_81DB8D0
	if_effect -68, AI_sub_81DB8E2
	if_effect -67, AI_sub_81DB8FA
	if_effect -66, AI_sub_81DB926
	if_effect -65, AI_sub_81DB7E9
	if_effect -64, AI_sub_81DB94E
	if_effect -63, AI_sub_81DB95F
	if_effect -61, AI_sub_81DB96E
	if_effect -56, AI_sub_81DAEEB
	if_effect -55, AI_sub_81DB9D8
	if_effect -52, AI_sub_81DB9FE
	if_effect -51, AI_sub_81DAAD6
	if_effect -50, AI_sub_81DA93A
	if_effect -48, AI_sub_81DA883
	if_effect -47, AI_sub_81DAEEB
	if_effect -46, AI_sub_81DBA26
	if_effect -45, AI_sub_81DA93A
	if_effect -44, AI_sub_81DBA4C
	end

AI_sub_81DA71C:: @ 81DA71C
	if_move_effect 0, 8, AI_sub_81DA72F
	if_move_effect 0, 107, AI_sub_81DA72F
	jump AI_sub_81DA737

AI_sub_81DA72F:: @ 81DA72F
	if_random_less_than -128, AI_sub_81DA737
	score 1

AI_sub_81DA737:: @ 81DA737
	end

AI_sub_81DA738:: @ 81DA738
	if_damage_bonus 20, AI_sub_81DA749
	if_damage_bonus 10, AI_sub_81DA749
	jump AI_sub_81DA751

AI_sub_81DA749:: @ 81DA749
	if_random_less_than 50, AI_sub_81DA751
	score -3

AI_sub_81DA751:: @ 81DA751
	end

AI_sub_81DA752:: @ 81DA752
	if_stat_level_less_than 0, 7, 7, AI_sub_81DA76C
	score -1
	if_stat_level_less_than 0, 7, 10, AI_sub_81DA76C
	if_random_less_than -128, AI_sub_81DA76C
	score -1

AI_sub_81DA76C:: @ 81DA76C
	if_hp_less_than 1, 80, AI_sub_81DA784
	if_would_go_first 1, AI_sub_81DA784
	if_random_less_than 50, AI_sub_81DA7AF
	jump AI_sub_81DA42A

AI_sub_81DA784:: @ 81DA784
	if_hp_more_than 1, 50, AI_sub_81DA7A7
	if_random_less_than -128, AI_sub_81DA793
	score 1

AI_sub_81DA793:: @ 81DA793
	if_hp_more_than 1, 30, AI_sub_81DA7AF
	if_random_less_than 50, AI_sub_81DA7AF
	score 1
	jump AI_sub_81DA7AF

AI_sub_81DA7A7:: @ 81DA7A7
	if_random_less_than 50, AI_sub_81DA7AF
	score -1

AI_sub_81DA7AF:: @ 81DA7AF
	end

AI_sub_81DA7B0:: @ 81DA7B0
	if_damage_bonus 10, AI_sub_81DA7C1
	if_damage_bonus 20, AI_sub_81DA7C1
	jump AI_sub_81DA7C3

AI_sub_81DA7C1:: @ 81DA7C1
	score -1

AI_sub_81DA7C3:: @ 81DA7C3
	end

AI_sub_81DA7C4:: @ 81DA7C4
	if_would_go_first 1, AI_sub_81DA7E2
	get_move 0
	if_not_in_words AI_words_81DA7F8, AI_sub_81DA7E2
	if_random_less_than -128, AI_sub_81DA7F5
	score 2
	jump AI_sub_81DA7F5

AI_sub_81DA7E2:: @ 81DA7E2
	get_move 0
	if_in_words AI_words_81DA7F8, AI_sub_81DA7F5
	if_random_less_than 80, AI_sub_81DA7F5
	score -1

AI_sub_81DA7F5:: @ 81DA7F5
	end
	.space 2

AI_words_81DA7F8:: @ 81DA7F8
	.align 1
	.2byte 0x4F
	.2byte 0x8E
	.2byte 0x93
	.2byte 0x5F
	.2byte 0x2F
	.2byte 0x140
	.2byte 0x145
	.2byte 0x1C
	.2byte 0x6C
	.2byte 0x5C
	.2byte 0xC
	.2byte 0x20
	.2byte 0x5A
	.2byte 0x149
	.2byte 0xEE
	.2byte 0xB1
	.2byte 0x6D
	.2byte 0xBA
	.2byte 0x67
	.2byte 0xB2
	.2byte 0xB8
	.2byte 0x139
	.2byte 0x13F
	.2byte 0x56
	.2byte 0x89
	.2byte 0x4D
	.2byte 0xF7
	.2byte 0xDF
	.2byte 0x3F
	.2byte 0xF5
	.2byte 0xA8
	.2byte 0x157
	.2byte 0xD5
	.2byte 0xCF
	.2byte 0x103
	.2byte 0x104
	.2byte 0x10F
	.2byte 0x114
	.2byte 0x11D
	.2byte 0xFFFF

AI_sub_81DA848:: @ 81DA848
	if_stat_level_less_than 1, 1, 9, AI_sub_81DA85D
	if_random_less_than 100, AI_sub_81DA86C
	score -1
	jump AI_sub_81DA86C

AI_sub_81DA85D:: @ 81DA85D
	if_hp_not_equal 1, 100, AI_sub_81DA86C
	if_random_less_than -128, AI_sub_81DA86C
	score 2

AI_sub_81DA86C:: @ 81DA86C
	if_hp_more_than 1, 70, AI_sub_81DA882
	if_hp_less_than 1, 40, AI_sub_81DA880
	if_random_less_than 40, AI_sub_81DA882

AI_sub_81DA880:: @ 81DA880
	score -2

AI_sub_81DA882:: @ 81DA882
	end

AI_sub_81DA883:: @ 81DA883
	if_stat_level_less_than 1, 2, 9, AI_sub_81DA898
	if_random_less_than 100, AI_sub_81DA8A7
	score -1
	jump AI_sub_81DA8A7

AI_sub_81DA898:: @ 81DA898
	if_hp_not_equal 1, 100, AI_sub_81DA8A7
	if_random_less_than -128, AI_sub_81DA8A7
	score 2

AI_sub_81DA8A7:: @ 81DA8A7
	if_hp_less_than 1, 70, AI_sub_81DA8B4
	if_random_less_than -56, AI_sub_81DA8DE

AI_sub_81DA8B4:: @ 81DA8B4
	if_hp_less_than 1, 40, AI_sub_81DA8DC
	get_move 0
	get_move_power_from_result
	if_equal 0, AI_sub_81DA8D6
	get_move 0
	get_move_type_from_result
	if_not_in_bytes AI_bytes_81DA8DF, AI_sub_81DA8DC
	if_random_less_than 60, AI_sub_81DA8DE

AI_sub_81DA8D6:: @ 81DA8D6
	if_random_less_than 60, AI_sub_81DA8DE

AI_sub_81DA8DC:: @ 81DA8DC
	score -2

AI_sub_81DA8DE:: @ 81DA8DE
	end

AI_bytes_81DA8DF:: @ 81DA8DF
	.byte 0
	.byte 1
	.byte 3
	.byte 4
	.byte 2
	.byte 5
	.byte 6
	.byte 7
	.byte 8
	.byte 0xFF

AI_sub_81DA8E9:: @ 81DA8E9
	if_would_go_first 1, AI_sub_81DA8F6
	score -3
	jump AI_sub_81DA8FE

AI_sub_81DA8F6:: @ 81DA8F6
	if_random_less_than 70, AI_sub_81DA8FE
	score 3

AI_sub_81DA8FE:: @ 81DA8FE
	end

AI_sub_81DA8FF:: @ 81DA8FF
	if_stat_level_less_than 1, 4, 9, AI_sub_81DA914
	if_random_less_than 100, AI_sub_81DA923
	score -1
	jump AI_sub_81DA923

AI_sub_81DA914:: @ 81DA914
	if_hp_not_equal 1, 100, AI_sub_81DA923
	if_random_less_than -128, AI_sub_81DA923
	score 2

AI_sub_81DA923:: @ 81DA923
	if_hp_more_than 1, 70, AI_sub_81DA939
	if_hp_less_than 1, 40, AI_sub_81DA937
	if_random_less_than 70, AI_sub_81DA939

AI_sub_81DA937:: @ 81DA937
	score -2

AI_sub_81DA939:: @ 81DA939
	end

AI_sub_81DA93A:: @ 81DA93A
	if_stat_level_less_than 1, 5, 9, AI_sub_81DA94F
	if_random_less_than 100, AI_sub_81DA95E
	score -1
	jump AI_sub_81DA95E

AI_sub_81DA94F:: @ 81DA94F
	if_hp_not_equal 1, 100, AI_sub_81DA95E
	if_random_less_than -128, AI_sub_81DA95E
	score 2

AI_sub_81DA95E:: @ 81DA95E
	if_hp_less_than 1, 70, AI_sub_81DA96B
	if_random_less_than -56, AI_sub_81DA995

AI_sub_81DA96B:: @ 81DA96B
	if_hp_less_than 1, 40, AI_sub_81DA993
	get_move 0
	get_move_power_from_result
	if_equal 0, AI_sub_81DA98D
	get_move 0
	get_move_type_from_result
	if_in_bytes AI_bytes_81DA996, AI_sub_81DA993
	if_random_less_than 60, AI_sub_81DA995

AI_sub_81DA98D:: @ 81DA98D
	if_random_less_than 60, AI_sub_81DA995

AI_sub_81DA993:: @ 81DA993
	score -2

AI_sub_81DA995:: @ 81DA995
	end

AI_bytes_81DA996:: @ 81DA996
	.byte 0
	.byte 1
	.byte 3
	.byte 4
	.byte 2
	.byte 5
	.byte 6
	.byte 7
	.byte 8
	.byte 0xFF

AI_sub_81DA9A0:: @ 81DA9A0
	if_stat_level_less_than 1, 6, 9, AI_sub_81DA9B0
	if_random_less_than 50, AI_sub_81DA9B0
	score -2

AI_sub_81DA9B0:: @ 81DA9B0
	if_hp_more_than 1, 70, AI_sub_81DA9B9
	score -2

AI_sub_81DA9B9:: @ 81DA9B9
	end

AI_sub_81DA9BA:: @ 81DA9BA
	if_hp_less_than 1, 90, AI_sub_81DA9C9
	if_random_less_than 100, AI_sub_81DA9C9
	score 3

AI_sub_81DA9C9:: @ 81DA9C9
	if_stat_level_less_than 1, 7, 9, AI_sub_81DA9D9
	if_random_less_than -128, AI_sub_81DA9D9
	score -1

AI_sub_81DA9D9:: @ 81DA9D9
	if_not_status 0, 128, AI_sub_81DA9F8
	if_hp_more_than 1, 50, AI_sub_81DA9F0
	if_random_less_than 80, AI_sub_81DA9F8

AI_sub_81DA9F0:: @ 81DA9F0
	if_random_less_than 50, AI_sub_81DA9F8
	score 3

AI_sub_81DA9F8:: @ 81DA9F8
	if_not_status3 0, 4, AI_sub_81DAA0A
	if_random_less_than 70, AI_sub_81DAA0A
	score 3

AI_sub_81DAA0A:: @ 81DAA0A
	if_not_status3 1, 1024, AI_sub_81DAA1C
	if_random_less_than -128, AI_sub_81DAA1C
	score 2

AI_sub_81DAA1C:: @ 81DAA1C
	if_not_status2 0, 268435456, AI_sub_81DAA2E
	if_random_less_than 70, AI_sub_81DAA2E
	score 3

AI_sub_81DAA2E:: @ 81DAA2E
	if_hp_more_than 1, 70, AI_sub_81DAA53
	if_stat_level_equal 1, 7, 6, AI_sub_81DAA53
	if_hp_less_than 1, 40, AI_sub_81DAA51
	if_hp_less_than 0, 40, AI_sub_81DAA51
	if_random_less_than 70, AI_sub_81DAA53

AI_sub_81DAA51:: @ 81DAA51
	score -2

AI_sub_81DAA53:: @ 81DAA53
	end

AI_sub_81DAA54:: @ 81DAA54
	if_stat_level_more_than 0, 7, 10, AI_sub_81DAA79
	if_stat_level_less_than 1, 6, 2, AI_sub_81DAA79
	if_stat_level_more_than 0, 7, 8, AI_sub_81DAA7B
	if_stat_level_less_than 1, 6, 4, AI_sub_81DAA7B
	jump AI_sub_81DAA83

AI_sub_81DAA79:: @ 81DAA79
	score 1

AI_sub_81DAA7B:: @ 81DAA7B
	if_random_less_than 100, AI_sub_81DAA83
	score 1

AI_sub_81DAA83:: @ 81DAA83
	end

AI_sub_81DAA84:: @ 81DAA84
	if_stat_level_equal 0, 1, 6, AI_sub_81DAAA7
	score -1
	if_hp_more_than 1, 90, AI_sub_81DAA97
	score -1

AI_sub_81DAA97:: @ 81DAA97
	if_stat_level_more_than 0, 1, 3, AI_sub_81DAAA7
	if_random_less_than 50, AI_sub_81DAAA7
	score -2

AI_sub_81DAAA7:: @ 81DAAA7
	if_hp_more_than 0, 70, AI_sub_81DAAB0
	score -2

AI_sub_81DAAB0:: @ 81DAAB0
	get_type 0
	if_in_bytes AI_bytes_81DAACF, AI_sub_81DAACE
	get_type 2
	if_in_bytes AI_bytes_81DAACF, AI_sub_81DAACE
	if_random_less_than 50, AI_sub_81DAACE
	score -2

AI_sub_81DAACE:: @ 81DAACE
	end

AI_bytes_81DAACF:: @ 81DAACF
	.byte 0
	.byte 1
	.byte 4
	.byte 5
	.byte 6
	.byte 8
	.byte 0xFF

AI_sub_81DAAD6:: @ 81DAAD6
	if_hp_less_than 1, 70, AI_sub_81DAAE5
	if_stat_level_more_than 0, 2, 3, AI_sub_81DAAED

AI_sub_81DAAE5:: @ 81DAAE5
	if_random_less_than 50, AI_sub_81DAAED
	score -2

AI_sub_81DAAED:: @ 81DAAED
	if_hp_more_than 0, 70, AI_sub_81DAAF6
	score -2

AI_sub_81DAAF6:: @ 81DAAF6
	end

AI_sub_81DAAF7:: @ 81DAAF7
	if_move 196, AI_sub_81DAB0D
	if_move 317, AI_sub_81DAB0D
	if_move 341, AI_sub_81DAB0D
	end

AI_sub_81DAB0D:: @ 81DAB0D
	if_would_go_first 1, AI_sub_81DAB1A
	score -3
	jump AI_sub_81DAB22

AI_sub_81DAB1A:: @ 81DAB1A
	if_random_less_than 70, AI_sub_81DAB22
	score 2

AI_sub_81DAB22:: @ 81DAB22
	end

AI_sub_81DAB23:: @ 81DAB23
	if_stat_level_equal 0, 1, 6, AI_sub_81DAB46
	score -1
	if_hp_more_than 1, 90, AI_sub_81DAB36
	score -1

AI_sub_81DAB36:: @ 81DAB36
	if_stat_level_more_than 0, 4, 3, AI_sub_81DAB46
	if_random_less_than 50, AI_sub_81DAB46
	score -2

AI_sub_81DAB46:: @ 81DAB46
	if_hp_more_than 0, 70, AI_sub_81DAB4F
	score -2

AI_sub_81DAB4F:: @ 81DAB4F
	get_type 0
	if_in_bytes AI_bytes_81DAB6E, AI_sub_81DAB6D
	get_type 2
	if_in_bytes AI_bytes_81DAB6E, AI_sub_81DAB6D
	if_random_less_than 50, AI_sub_81DAB6D
	score -2

AI_sub_81DAB6D:: @ 81DAB6D
	end

AI_bytes_81DAB6E:: @ 81DAB6E
	.byte 10
	.byte 11
	.byte 12
	.byte 13
	.byte 14
	.byte 15
	.byte 16
	.byte 17
	.byte 0xFF

AI_sub_81DAB77:: @ 81DAB77
	if_hp_less_than 1, 70, AI_sub_81DAB86
	if_stat_level_more_than 0, 5, 3, AI_sub_81DAB8E

AI_sub_81DAB86:: @ 81DAB86
	if_random_less_than 50, AI_sub_81DAB8E
	score -2

AI_sub_81DAB8E:: @ 81DAB8E
	if_hp_more_than 0, 70, AI_sub_81DAB97
	score -2

AI_sub_81DAB97:: @ 81DAB97
	end

AI_sub_81DAB98:: @ 81DAB98
	if_hp_less_than 1, 70, AI_sub_81DABA6
	if_hp_more_than 0, 70, AI_sub_81DABAE

AI_sub_81DABA6:: @ 81DABA6
	if_random_less_than 100, AI_sub_81DABAE
	score -1

AI_sub_81DABAE:: @ 81DABAE
	if_stat_level_more_than 1, 6, 4, AI_sub_81DABBE
	if_random_less_than 80, AI_sub_81DABBE
	score -2

AI_sub_81DABBE:: @ 81DABBE
	if_not_status 0, 128, AI_sub_81DABD0
	if_random_less_than 70, AI_sub_81DABD0
	score 2

AI_sub_81DABD0:: @ 81DABD0
	if_not_status3 0, 4, AI_sub_81DABE2
	if_random_less_than 70, AI_sub_81DABE2
	score 2

AI_sub_81DABE2:: @ 81DABE2
	if_not_status3 1, 1024, AI_sub_81DABF4
	if_random_less_than -128, AI_sub_81DABF4
	score 1

AI_sub_81DABF4:: @ 81DABF4
	if_not_status2 0, 268435456, AI_sub_81DAC06
	if_random_less_than 70, AI_sub_81DAC06
	score 2

AI_sub_81DAC06:: @ 81DAC06
	if_hp_more_than 1, 70, AI_sub_81DAC2B
	if_stat_level_equal 0, 6, 6, AI_sub_81DAC2B
	if_hp_less_than 1, 40, AI_sub_81DAC29
	if_hp_less_than 0, 40, AI_sub_81DAC29
	if_random_less_than 70, AI_sub_81DAC2B

AI_sub_81DAC29:: @ 81DAC29
	score -2

AI_sub_81DAC2B:: @ 81DAC2B
	end

AI_sub_81DAC2C:: @ 81DAC2C
	if_hp_less_than 1, 70, AI_sub_81DAC3B
	if_stat_level_more_than 0, 7, 3, AI_sub_81DAC43

AI_sub_81DAC3B:: @ 81DAC3B
	if_random_less_than 50, AI_sub_81DAC43
	score -2

AI_sub_81DAC43:: @ 81DAC43
	if_hp_more_than 0, 70, AI_sub_81DAC4C
	score -2

AI_sub_81DAC4C:: @ 81DAC4C
	end

AI_sub_81DAC4D:: @ 81DAC4D
	if_stat_level_more_than 1, 1, 8, AI_sub_81DACA2
	if_stat_level_more_than 1, 2, 8, AI_sub_81DACA2
	if_stat_level_more_than 1, 4, 8, AI_sub_81DACA2
	if_stat_level_more_than 1, 5, 8, AI_sub_81DACA2
	if_stat_level_more_than 1, 7, 8, AI_sub_81DACA2
	if_stat_level_less_than 0, 1, 4, AI_sub_81DACA2
	if_stat_level_less_than 0, 2, 4, AI_sub_81DACA2
	if_stat_level_less_than 0, 4, 4, AI_sub_81DACA2
	if_stat_level_less_than 0, 5, 4, AI_sub_81DACA2
	if_stat_level_less_than 0, 6, 4, AI_sub_81DACA2
	jump AI_sub_81DACAA

AI_sub_81DACA2:: @ 81DACA2
	if_random_less_than 50, AI_sub_81DACAA
	score -3

AI_sub_81DACAA:: @ 81DACAA
	if_stat_level_more_than 0, 1, 8, AI_sub_81DAD07
	if_stat_level_more_than 0, 2, 8, AI_sub_81DAD07
	if_stat_level_more_than 0, 4, 8, AI_sub_81DAD07
	if_stat_level_more_than 0, 5, 8, AI_sub_81DAD07
	if_stat_level_more_than 0, 7, 8, AI_sub_81DAD07
	if_stat_level_less_than 1, 1, 4, AI_sub_81DAD07
	if_stat_level_less_than 1, 2, 4, AI_sub_81DAD07
	if_stat_level_less_than 1, 4, 4, AI_sub_81DAD07
	if_stat_level_less_than 1, 5, 4, AI_sub_81DAD07
	if_stat_level_less_than 1, 6, 4, AI_sub_81DAD07
	if_random_less_than 50, AI_sub_81DAD0F
	score -1
	jump AI_sub_81DAD0F

AI_sub_81DAD07:: @ 81DAD07
	if_random_less_than 50, AI_sub_81DAD0F
	score 3

AI_sub_81DAD0F:: @ 81DAD0F
	end

AI_sub_81DAD10:: @ 81DAD10
	if_hp_more_than 1, 90, AI_sub_81DAD19
	score -2

AI_sub_81DAD19:: @ 81DAD19
	end

AI_sub_81DAD1A:: @ 81DAD1A
	if_stat_level_more_than 0, 1, 8, AI_sub_81DAD49
	if_stat_level_more_than 0, 2, 8, AI_sub_81DAD49
	if_stat_level_more_than 0, 4, 8, AI_sub_81DAD49
	if_stat_level_more_than 0, 5, 8, AI_sub_81DAD49
	if_stat_level_more_than 0, 7, 8, AI_sub_81DAD49
	score -3
	jump AI_sub_81DAD51

AI_sub_81DAD49:: @ 81DAD49
	if_random_less_than -128, AI_sub_81DAD51
	score 2

AI_sub_81DAD51:: @ 81DAD51
	end

AI_sub_81DAD52:: @ 81DAD52
	if_hp_more_than 1, 90, AI_sub_81DAD5B
	score -2

AI_sub_81DAD5B:: @ 81DAD5B
	get_turn_count
	if_equal 0, AI_sub_81DAD68
	if_random_less_than -56, AI_sub_81DA427

AI_sub_81DAD68:: @ 81DAD68
	end

AI_sub_81DAD69:: @ 81DAD69
	get_weather
	if_equal 3, AI_sub_81DAD81
	if_equal 1, AI_sub_81DAD81
	if_equal 2, AI_sub_81DAD81
	jump AI_sub_81DAD83

AI_sub_81DAD81:: @ 81DAD81
	score -2

AI_sub_81DAD83:: @ 81DAD83
	if_hp_equal 1, 100, AI_sub_81DADAB
	if_would_go_first 1, AI_sub_81DADB2
	score -8
	jump AI_sub_81DADDB
	if_hp_less_than 1, 50, AI_sub_81DADC6
	if_hp_more_than 1, 80, AI_sub_81DADAB
	if_random_less_than 70, AI_sub_81DADC6

AI_sub_81DADAB:: @ 81DADAB
	score -3
	jump AI_sub_81DADDB

AI_sub_81DADB2:: @ 81DADB2
	if_hp_less_than 1, 70, AI_sub_81DADC6
	if_random_less_than 30, AI_sub_81DADC6
	score -3
	jump AI_sub_81DADDB

AI_sub_81DADC6:: @ 81DADC6
	if_not_move_effect 0, -61, AI_sub_81DADD3
	if_random_less_than 100, AI_sub_81DADDB

AI_sub_81DADD3:: @ 81DADD3
	if_random_less_than 20, AI_sub_81DADDB
	score 2

AI_sub_81DADDB:: @ 81DADDB
	end

AI_sub_81DADDC:: @ 81DADDC
	if_user_cant_damage AI_sub_81DADFF
	if_hp_more_than 1, 50, AI_sub_81DADF0
	if_random_less_than 50, AI_sub_81DADF0
	score -3

AI_sub_81DADF0:: @ 81DADF0
	if_hp_more_than 0, 50, AI_sub_81DADFF
	if_random_less_than 50, AI_sub_81DADFF
	score -3

AI_sub_81DADFF:: @ 81DADFF
	if_move_effect 1, 14, AI_sub_81DAE12
	if_move_effect 1, 111, AI_sub_81DAE12
	jump AI_sub_81DAE1A

AI_sub_81DAE12:: @ 81DAE12
	if_random_less_than 60, AI_sub_81DAE1A
	score 2

AI_sub_81DAE1A:: @ 81DAE1A
	end

AI_sub_81DAE1B:: @ 81DAE1B
	if_hp_less_than 1, 50, AI_sub_81DAE3E
	get_type 0
	if_in_bytes AI_bytes_81DAE41, AI_sub_81DAE40
	get_type 2
	if_in_bytes AI_bytes_81DAE41, AI_sub_81DAE40
	if_random_less_than 50, AI_sub_81DAE40

AI_sub_81DAE3E:: @ 81DAE3E
	score -2

AI_sub_81DAE40:: @ 81DAE40
	end

AI_bytes_81DAE41:: @ 81DAE41
	.byte 10
	.byte 11
	.byte 12
	.byte 13
	.byte 14
	.byte 15
	.byte 16
	.byte 17
	.byte 0xFF

AI_sub_81DAE4A:: @ 81DAE4A
	if_would_go_first 1, AI_sub_81DAE79
	if_hp_not_equal 1, 100, AI_sub_81DAE5E
	score -8
	jump AI_sub_81DAEA9

AI_sub_81DAE5E:: @ 81DAE5E
	if_hp_less_than 1, 40, AI_sub_81DAE94
	if_hp_more_than 1, 50, AI_sub_81DAE72
	if_random_less_than 70, AI_sub_81DAE94

AI_sub_81DAE72:: @ 81DAE72
	score -3
	jump AI_sub_81DAEA9

AI_sub_81DAE79:: @ 81DAE79
	if_hp_less_than 1, 60, AI_sub_81DAE94
	if_hp_more_than 1, 70, AI_sub_81DAE8D
	if_random_less_than 50, AI_sub_81DAE94

AI_sub_81DAE8D:: @ 81DAE8D
	score -3
	jump AI_sub_81DAEA9

AI_sub_81DAE94:: @ 81DAE94
	if_not_move_effect 0, -61, AI_sub_81DAEA1
	if_random_less_than 50, AI_sub_81DAEA9

AI_sub_81DAEA1:: @ 81DAEA1
	if_random_less_than 10, AI_sub_81DAEA9
	score 3

AI_sub_81DAEA9:: @ 81DAEA9
	end

AI_sub_81DAEAA:: @ 81DAEAA
	end

AI_sub_81DAEAB:: @ 81DAEAB
	if_hp_more_than 0, 50, AI_sub_81DAEB4
	score -1

AI_sub_81DAEB4:: @ 81DAEB4
	end

AI_sub_81DAEB5:: @ 81DAEB5
	if_status 0, 128, AI_sub_81DAEE2
	if_status2 0, 268435456, AI_sub_81DAEE2
	if_status3 0, 32, AI_sub_81DAEE2
	if_status2 0, 983040, AI_sub_81DAEE2
	jump AI_sub_81DAEEA

AI_sub_81DAEE2:: @ 81DAEE2
	if_random_less_than -128, AI_sub_81DAEEA
	score 1

AI_sub_81DAEEA:: @ 81DAEEA
	end

AI_sub_81DAEEB:: @ 81DAEEB
	if_damage_bonus 10, AI_sub_81DAF11
	if_damage_bonus 20, AI_sub_81DAF11
	if_damage_bonus 80, AI_sub_81DAF09
	if_damage_bonus -96, AI_sub_81DAF09
	if_random_less_than -128, AI_sub_81DAF11

AI_sub_81DAF09:: @ 81DAF09
	if_random_less_than -128, AI_sub_81DAF11
	score 1

AI_sub_81DAF11:: @ 81DAF11
	end

AI_sub_81DAF12:: @ 81DAF12
	if_random_less_than -128, AI_sub_81DAF1A
	score 1

AI_sub_81DAF1A:: @ 81DAF1A
	if_hp_more_than 0, 70, AI_sub_81DAF3B
	if_random_less_than -128, AI_sub_81DAF29
	score -1

AI_sub_81DAF29:: @ 81DAF29
	if_hp_more_than 0, 50, AI_sub_81DAF3B
	score -1
	if_hp_more_than 0, 30, AI_sub_81DAF3B
	score -1

AI_sub_81DAF3B:: @ 81DAF3B
	end

AI_sub_81DAF3C:: @ 81DAF3C
	if_hp_less_than 1, 50, AI_sub_81DAF5F
	get_type 0
	if_in_bytes AI_bytes_81DAF62, AI_sub_81DAF61
	get_type 2
	if_in_bytes AI_bytes_81DAF62, AI_sub_81DAF61
	if_random_less_than 50, AI_sub_81DAF61

AI_sub_81DAF5F:: @ 81DAF5F
	score -2

AI_sub_81DAF61:: @ 81DAF61
	end

AI_bytes_81DAF62:: @ 81DAF62
	.byte 0
	.byte 1
	.byte 2
	.byte 3
	.byte 4
	.byte 5
	.byte 6
	.byte 7
	.byte 8
	.byte 0xFF

AI_sub_81DAF6C:: @ 81DAF6C
	if_hp_less_than 1, 50, AI_sub_81DAF7A
	if_hp_more_than 0, 50, AI_sub_81DAF7C

AI_sub_81DAF7A:: @ 81DAF7A
	score -1

AI_sub_81DAF7C:: @ 81DAF7C
	end

AI_sub_81DAF7D:: @ 81DAF7D
	if_would_go_first 1, AI_sub_81DAF91
	if_hp_more_than 1, 70, AI_sub_81DAF99
	score -1
	jump AI_sub_81DAF99

AI_sub_81DAF91:: @ 81DAF91
	if_random_less_than 20, AI_sub_81DAF99
	score 3

AI_sub_81DAF99:: @ 81DAF99
	end

AI_sub_81DAF9A:: @ 81DAF9A
	if_would_go_first 1, AI_sub_81DAFBC
	if_hp_more_than 1, 60, AI_sub_81DAFBC
	if_hp_less_than 1, 40, AI_sub_81DAFB4
	if_random_less_than -76, AI_sub_81DAFBC

AI_sub_81DAFB4:: @ 81DAFB4
	if_random_less_than 50, AI_sub_81DAFBC
	score -1

AI_sub_81DAFBC:: @ 81DAFBC
	end

AI_sub_81DAFBD:: @ 81DAFBD
	if_hp_more_than 1, 90, AI_sub_81DAFEA
	if_hp_more_than 1, 70, AI_sub_81DAFE2
	if_hp_more_than 1, 50, AI_sub_81DAFDA
	if_random_less_than 100, AI_sub_81DAFDA
	score -1

AI_sub_81DAFDA:: @ 81DAFDA
	if_random_less_than 100, AI_sub_81DAFE2
	score -1

AI_sub_81DAFE2:: @ 81DAFE2
	if_random_less_than 100, AI_sub_81DAFEA
	score -1

AI_sub_81DAFEA:: @ 81DAFEA
	if_would_go_first 1, AI_sub_81DB052
	get_move 0
	get_move_effect_from_result
	if_equal 1, AI_sub_81DB022
	if_equal 33, AI_sub_81DB022
	if_equal 66, AI_sub_81DB022
	if_equal 67, AI_sub_81DB022
	if_equal -89, AI_sub_81DB022
	if_equal 49, AI_sub_81DB031
	if_equal 84, AI_sub_81DB040
	jump AI_sub_81DB052

AI_sub_81DB022:: @ 81DB022
	if_not_status 0, 255, AI_sub_81DB04A
	jump AI_sub_81DB052

AI_sub_81DB031:: @ 81DB031
	if_not_status2 0, 7, AI_sub_81DB04A
	jump AI_sub_81DB052

AI_sub_81DB040:: @ 81DB040
	if_status3 0, 4, AI_sub_81DB052

AI_sub_81DB04A:: @ 81DB04A
	if_random_less_than 100, AI_sub_81DB052
	score 1

AI_sub_81DB052:: @ 81DB052
	end

AI_sub_81DB053:: @ 81DB053
	if_damage_bonus 10, AI_sub_81DB078
	if_damage_bonus 20, AI_sub_81DB078
	if_would_go_first 1, AI_sub_81DB071
	if_hp_more_than 1, 40, AI_sub_81DB078
	jump AI_sub_81DB07A

AI_sub_81DB071:: @ 81DB071
	if_hp_less_than 1, 60, AI_sub_81DB07A

AI_sub_81DB078:: @ 81DB078
	score -1

AI_sub_81DB07A:: @ 81DB07A
	end

AI_sub_81DB07B:: @ 81DB07B
	if_would_go_first 1, AI_sub_81DB099
	get_move 0
	get_move_power_from_result
	if_equal 0, AI_sub_81DB091
	score 1
	jump AI_sub_81DB099

AI_sub_81DB091:: @ 81DB091
	if_random_less_than 100, AI_sub_81DB099
	score -1

AI_sub_81DB099:: @ 81DB099
	end

AI_sub_81DB09A:: @ 81DB09A
	if_status 0, 7, AI_sub_81DB12E
	if_status2 0, 983040, AI_sub_81DB12E
	if_status2 0, 7, AI_sub_81DB12E
	if_hp_more_than 1, 30, AI_sub_81DB0C7
	if_random_less_than 10, AI_sub_81DB0C7
	score -1

AI_sub_81DB0C7:: @ 81DB0C7
	if_hp_more_than 1, 50, AI_sub_81DB0D6
	if_random_less_than 100, AI_sub_81DB0D6
	score -1

AI_sub_81DB0D6:: @ 81DB0D6
	get_move 0
	get_move_power_from_result
	if_equal 0, AI_sub_81DB105
	if_not_taunted AI_sub_81DB0EC
	if_random_less_than 100, AI_sub_81DB0EC
	score 1

AI_sub_81DB0EC:: @ 81DB0EC
	get_move 0
	get_move_type_from_result
	if_not_in_bytes AI_bytes_81DB131, AI_sub_81DB12E
	if_random_less_than 100, AI_sub_81DB130
	score 1
	jump AI_sub_81DB130

AI_sub_81DB105:: @ 81DB105
	if_not_taunted AI_sub_81DB112
	if_random_less_than 100, AI_sub_81DB112
	score 1

AI_sub_81DB112:: @ 81DB112
	get_type 0
	if_in_bytes AI_bytes_81DB131, AI_sub_81DB130
	get_type 2
	if_in_bytes AI_bytes_81DB131, AI_sub_81DB130
	if_random_less_than 50, AI_sub_81DB130

AI_sub_81DB12E:: @ 81DB12E
	score -1

AI_sub_81DB130:: @ 81DB130
	end

AI_bytes_81DB131:: @ 81DB131
	.byte 0
	.byte 1
	.byte 2
	.byte 3
	.byte 4
	.byte 5
	.byte 6
	.byte 7
	.byte 8
	.byte 0xFF

AI_sub_81DB13B:: @ 81DB13B
	if_last_move_did_damage 0, 0, AI_sub_81DB154
	if_would_go_first 1, AI_sub_81DB161
	get_move 0
	get_move_effect_from_result
	if_not_in_bytes AI_bytes_81DB164, AI_sub_81DB161

AI_sub_81DB154:: @ 81DB154
	if_random_less_than 30, AI_sub_81DB163
	score 3
	jump AI_sub_81DB163

AI_sub_81DB161:: @ 81DB161
	score -2

AI_sub_81DB163:: @ 81DB163
	end

AI_bytes_81DB164:: @ 81DB164
	.byte 8
	.byte 10
	.byte 11
	.byte 12
	.byte 13
	.byte 25
	.byte 28
	.byte 30
	.byte 33
	.byte 35
	.byte 37
	.byte 40
	.byte 54
	.byte 49
	.byte 66
	.byte 67
	.byte 84
	.byte 85
	.byte 50
	.byte 90
	.byte 93
	.byte 94
	.byte 102
	.byte 106
	.byte 107
	.byte 111
	.byte 191
	.byte 113
	.byte 114
	.byte 115
	.byte 116
	.byte 118
	.byte 120
	.byte 124
	.byte 136
	.byte 137
	.byte 142
	.byte 143
	.byte 148
	.byte 158
	.byte 160
	.byte 161
	.byte 162
	.byte 164
	.byte 165
	.byte 167
	.byte 172
	.byte 174
	.byte 177
	.byte 178
	.byte 181
	.byte 184
	.byte 188
	.byte 191
	.byte 192
	.byte 193
	.byte 194
	.byte 199
	.byte 201
	.byte 210
	.byte 212
	.byte 213
	.byte 0xFF

AI_sub_81DB1A3:: @ 81DB1A3
	if_hp_less_than 0, 80, AI_sub_81DB1CC
	if_would_go_first 1, AI_sub_81DB1BE
	if_hp_more_than 1, 40, AI_sub_81DB1CC
	score 1
	jump AI_sub_81DB1CE

AI_sub_81DB1BE:: @ 81DB1BE
	if_hp_more_than 1, 60, AI_sub_81DB1CC
	score 1
	jump AI_sub_81DB1CE

AI_sub_81DB1CC:: @ 81DB1CC
	score -1

AI_sub_81DB1CE:: @ 81DB1CE
	end

AI_sub_81DB1CF:: @ 81DB1CF
	score 2
	end

AI_sub_81DB1D2:: @ 81DB1D2
	if_random_less_than -128, AI_sub_81DB1DA
	score 2

AI_sub_81DB1DA:: @ 81DB1DA
	end

AI_sub_81DB1DB:: @ 81DB1DB
	score 2
	end

AI_sub_81DB1DE:: @ 81DB1DE
	score -1
	if_would_go_first 1, AI_sub_81DB213
	if_hp_more_than 1, 70, AI_sub_81DB213
	if_random_less_than -128, AI_sub_81DB1F5
	score 1

AI_sub_81DB1F5:: @ 81DB1F5
	if_hp_more_than 1, 50, AI_sub_81DB213
	if_random_less_than -128, AI_sub_81DB204
	score 1

AI_sub_81DB204:: @ 81DB204
	if_hp_more_than 1, 30, AI_sub_81DB213
	if_random_less_than 100, AI_sub_81DB213
	score 2

AI_sub_81DB213:: @ 81DB213
	end

AI_sub_81DB214:: @ 81DB214
	if_would_go_first 1, AI_sub_81DB234
	if_hp_more_than 1, 33, AI_sub_81DB256
	if_hp_more_than 1, 20, AI_sub_81DB258
	if_hp_less_than 1, 8, AI_sub_81DB247
	jump AI_sub_81DB249

AI_sub_81DB234:: @ 81DB234
	if_hp_more_than 1, 60, AI_sub_81DB256
	if_hp_more_than 1, 40, AI_sub_81DB258
	jump AI_sub_81DB249

AI_sub_81DB247:: @ 81DB247
	score 1

AI_sub_81DB249:: @ 81DB249
	if_random_less_than 100, AI_sub_81DB258
	score 1
	jump AI_sub_81DB258

AI_sub_81DB256:: @ 81DB256
	score -1

AI_sub_81DB258:: @ 81DB258
	end

AI_sub_81DB259:: @ 81DB259
	if_status 0, 255, AI_sub_81DB26F
	if_status_in_party 0, 255, AI_sub_81DB26F
	score -5

AI_sub_81DB26F:: @ 81DB26F
	end

AI_sub_81DB270:: @ 81DB270
	get_hold_effect 0
	if_not_in_bytes AI_bytes_81DB28B, AI_sub_81DB288
	if_random_less_than 50, AI_sub_81DB28A
	score 1
	jump AI_sub_81DB28A

AI_sub_81DB288:: @ 81DB288
	score -2

AI_sub_81DB28A:: @ 81DB28A
	end

AI_bytes_81DB28B:: @ 81DB28B
	.byte 3
	.byte 9
	.byte 1
	.byte 22
	.byte 43
	.byte 45
	.byte 65
	.byte 0xFF

AI_sub_81DB293:: @ 81DB293
	get_type 1
	if_equal 7, AI_sub_81DB2D8
	get_type 3
	if_equal 7, AI_sub_81DB2D8
	if_stat_level_more_than 1, 2, 9, AI_sub_81DB2E1
	if_random_less_than -128, AI_sub_81DB2B3
	score 1

AI_sub_81DB2B3:: @ 81DB2B3
	if_stat_level_more_than 1, 2, 7, AI_sub_81DB2E1
	if_random_less_than -128, AI_sub_81DB2C3
	score 1

AI_sub_81DB2C3:: @ 81DB2C3
	if_stat_level_more_than 1, 2, 6, AI_sub_81DB2E1
	if_random_less_than -128, AI_sub_81DB2E1
	score 1
	jump AI_sub_81DB2E1

AI_sub_81DB2D8:: @ 81DB2D8
	if_hp_more_than 1, 80, AI_sub_81DB2E1
	score -1

AI_sub_81DB2E1:: @ 81DB2E1
	end

AI_sub_81DB2E2:: @ 81DB2E2
	get_protect_count 1
	if_more_than 1, AI_sub_81DB3A0
	if_status 1, 128, AI_sub_81DB397
	if_status2 1, 268435456, AI_sub_81DB397
	if_status3 1, 32, AI_sub_81DB397
	if_status2 1, 983040, AI_sub_81DB397
	if_status3 1, 4, AI_sub_81DB397
	if_status3 1, 6144, AI_sub_81DB397
	if_move_effect 0, 32, AI_sub_81DB397
	if_move_effect 0, -100, AI_sub_81DB397
	if_status 0, 128, AI_sub_81DB37E
	if_status2 0, 268435456, AI_sub_81DB37E
	if_status3 0, 32, AI_sub_81DB37E
	if_status2 0, 983040, AI_sub_81DB37E
	if_status3 0, 4, AI_sub_81DB37E
	if_status3 0, 6144, AI_sub_81DB37E
	get_move 0
	get_move_effect_from_result
	if_not_equal 94, AI_sub_81DB37E
	jump AI_sub_81DB380

AI_sub_81DB37E:: @ 81DB37E
	score 2

AI_sub_81DB380:: @ 81DB380
	get_protect_count 1
	if_equal 0, AI_sub_81DB3A2
	score -1
	if_random_less_than -128, AI_sub_81DB3A2
	score -1
	jump AI_sub_81DB3A2

AI_sub_81DB397:: @ 81DB397
	get_move 0
	get_move_effect_from_result
	if_not_equal 94, AI_sub_81DB3A2

AI_sub_81DB3A0:: @ 81DB3A0
	score -2

AI_sub_81DB3A2:: @ 81DB3A2
	end

AI_sub_81DB3A3:: @ 81DB3A3
	get_type 1
	if_equal 7, AI_sub_81DB3C2
	get_type 3
	if_equal 7, AI_sub_81DB3C2
	if_stat_level_more_than 1, 7, 8, AI_sub_81DB3C8
	score -2
	jump AI_sub_81DB3D0

AI_sub_81DB3C2:: @ 81DB3C2
	if_random_less_than 80, AI_sub_81DB3D0

AI_sub_81DB3C8:: @ 81DB3C8
	if_random_less_than 80, AI_sub_81DB3D0
	score 2

AI_sub_81DB3D0:: @ 81DB3D0
	end

AI_sub_81DB3D1:: @ 81DB3D1
	if_hp_less_than 1, 4, AI_sub_81DB3DF
	if_hp_less_than 1, 35, AI_sub_81DB3E6

AI_sub_81DB3DF:: @ 81DB3DF
	score -1
	jump AI_sub_81DB3EE

AI_sub_81DB3E6:: @ 81DB3E6
	if_random_less_than 70, AI_sub_81DB3EE
	score 1

AI_sub_81DB3EE:: @ 81DB3EE
	end

AI_sub_81DB3EF:: @ 81DB3EF
	if_stat_level_more_than 1, 1, 8, AI_sub_81DB41C
	if_stat_level_more_than 1, 2, 8, AI_sub_81DB41C
	if_stat_level_more_than 1, 4, 8, AI_sub_81DB41C
	if_stat_level_more_than 1, 5, 8, AI_sub_81DB41C
	if_stat_level_more_than 1, 7, 8, AI_sub_81DB41C
	jump AI_sub_81DB442

AI_sub_81DB41C:: @ 81DB41C
	if_would_go_first 1, AI_sub_81DB42E
	if_hp_more_than 1, 60, AI_sub_81DB48A
	jump AI_sub_81DB435

AI_sub_81DB42E:: @ 81DB42E
	if_hp_more_than 1, 70, AI_sub_81DB48A

AI_sub_81DB435:: @ 81DB435
	if_random_less_than 80, AI_sub_81DB48A
	score 2
	jump AI_sub_81DB48A

AI_sub_81DB442:: @ 81DB442
	if_stat_level_more_than 1, 1, 7, AI_sub_81DB46F
	if_stat_level_more_than 1, 2, 7, AI_sub_81DB46F
	if_stat_level_more_than 1, 4, 7, AI_sub_81DB46F
	if_stat_level_more_than 1, 5, 7, AI_sub_81DB46F
	if_stat_level_more_than 1, 7, 7, AI_sub_81DB46F
	jump AI_sub_81DB488

AI_sub_81DB46F:: @ 81DB46F
	if_would_go_first 1, AI_sub_81DB481
	if_hp_more_than 1, 60, AI_sub_81DB488
	jump AI_sub_81DB48A

AI_sub_81DB481:: @ 81DB481
	if_hp_less_than 1, 70, AI_sub_81DB48A

AI_sub_81DB488:: @ 81DB488
	score -2

AI_sub_81DB48A:: @ 81DB48A
	end

AI_sub_81DB48B:: @ 81DB48B
	is_first_turn 1
	if_not_equal 0, AI_sub_81DB4C0
	get_type 0
	if_equal 7, AI_sub_81DB4B8
	get_type 0
	if_equal 14, AI_sub_81DB4B8
	get_type 2
	if_equal 7, AI_sub_81DB4B8
	get_type 2
	if_equal 14, AI_sub_81DB4B8
	jump AI_sub_81DB4C0

AI_sub_81DB4B8:: @ 81DB4B8
	if_random_less_than -128, AI_sub_81DB4C0
	score 1

AI_sub_81DB4C0:: @ 81DB4C0
	end

AI_sub_81DB4C1:: @ 81DB4C1
	if_would_go_first 0, AI_sub_81DB4CF
	get_ability 1
	if_equal 33, AI_sub_81DB4F6

AI_sub_81DB4CF:: @ 81DB4CF
	if_hp_less_than 1, 40, AI_sub_81DB4FD
	get_weather
	if_equal 3, AI_sub_81DB4F6
	if_equal 0, AI_sub_81DB4F6
	if_equal 2, AI_sub_81DB4F6
	get_ability 1
	if_equal 44, AI_sub_81DB4F6
	jump AI_sub_81DB4FF

AI_sub_81DB4F6:: @ 81DB4F6
	score 1
	jump AI_sub_81DB4FF

AI_sub_81DB4FD:: @ 81DB4FD
	score -1

AI_sub_81DB4FF:: @ 81DB4FF
	end

AI_sub_81DB500:: @ 81DB500
	if_hp_less_than 1, 40, AI_sub_81DB526
	get_weather
	if_equal 3, AI_sub_81DB51F
	if_equal 1, AI_sub_81DB51F
	if_equal 2, AI_sub_81DB51F
	jump AI_sub_81DB528

AI_sub_81DB51F:: @ 81DB51F
	score 1
	jump AI_sub_81DB528

AI_sub_81DB526:: @ 81DB526
	score -1

AI_sub_81DB528:: @ 81DB528
	end

AI_sub_81DB529:: @ 81DB529
	if_hp_less_than 1, 90, AI_sub_81DB535
	jump AI_sub_81DB537

AI_sub_81DB535:: @ 81DB535
	score -2

AI_sub_81DB537:: @ 81DB537
	end

AI_sub_81DB538:: @ 81DB538
	if_stat_level_more_than 0, 1, 8, AI_sub_81DB565
	if_stat_level_more_than 0, 2, 8, AI_sub_81DB565
	if_stat_level_more_than 0, 4, 8, AI_sub_81DB565
	if_stat_level_more_than 0, 5, 8, AI_sub_81DB565
	if_stat_level_more_than 0, 7, 8, AI_sub_81DB565
	jump AI_sub_81DB5A2

AI_sub_81DB565:: @ 81DB565
	if_stat_level_less_than 1, 1, 7, AI_sub_81DB59A
	if_stat_level_less_than 1, 2, 7, AI_sub_81DB59A
	if_stat_level_less_than 1, 4, 7, AI_sub_81DB59A
	if_stat_level_less_than 1, 5, 7, AI_sub_81DB59A
	if_stat_level_less_than 1, 7, 7, AI_sub_81DB598
	if_random_less_than 50, AI_sub_81DB5A4
	jump AI_sub_81DB5A2

AI_sub_81DB598:: @ 81DB598
	score 1

AI_sub_81DB59A:: @ 81DB59A
	if_random_less_than -128, AI_sub_81DB5A4
	score 1

AI_sub_81DB5A2:: @ 81DB5A2
	score -2

AI_sub_81DB5A4:: @ 81DB5A4
	end

AI_sub_81DB5A5:: @ 81DB5A5
	if_status 0, 7, AI_sub_81DB639
	if_status2 0, 983040, AI_sub_81DB639
	if_status2 0, 7, AI_sub_81DB639
	if_hp_more_than 1, 30, AI_sub_81DB5D2
	if_random_less_than 10, AI_sub_81DB5D2
	score -1

AI_sub_81DB5D2:: @ 81DB5D2
	if_hp_more_than 1, 50, AI_sub_81DB5E1
	if_random_less_than 100, AI_sub_81DB5E1
	score -1

AI_sub_81DB5E1:: @ 81DB5E1
	get_move 0
	get_move_power_from_result
	if_equal 0, AI_sub_81DB610
	if_not_taunted AI_sub_81DB5F7
	if_random_less_than 100, AI_sub_81DB5F7
	score 1

AI_sub_81DB5F7:: @ 81DB5F7
	get_move 0
	get_move_type_from_result
	if_not_in_bytes AI_bytes_81DB63C, AI_sub_81DB639
	if_random_less_than 100, AI_sub_81DB63B
	score 1
	jump AI_sub_81DB63B

AI_sub_81DB610:: @ 81DB610
	if_not_taunted AI_sub_81DB61D
	if_random_less_than 100, AI_sub_81DB61D
	score 1

AI_sub_81DB61D:: @ 81DB61D
	get_type 0
	if_in_bytes AI_bytes_81DB63C, AI_sub_81DB63B
	get_type 2
	if_in_bytes AI_bytes_81DB63C, AI_sub_81DB63B
	if_random_less_than 50, AI_sub_81DB63B

AI_sub_81DB639:: @ 81DB639
	score -1

AI_sub_81DB63B:: @ 81DB63B
	end

AI_bytes_81DB63C:: @ 81DB63C
	.byte 10
	.byte 11
	.byte 12
	.byte 13
	.byte 14
	.byte 15
	.byte 16
	.byte 17
	.byte 0xFF

AI_sub_81DB645:: @ 81DB645
	if_damage_bonus 10, AI_sub_81DB666
	if_damage_bonus 20, AI_sub_81DB666
	if_move_effect 0, 111, AI_sub_81DB666
	if_hp_more_than 1, 38, AI_sub_81DB668
	score -1
	jump AI_sub_81DB668

AI_sub_81DB666:: @ 81DB666
	score -2

AI_sub_81DB668:: @ 81DB668
	end

AI_sub_81DB669:: @ 81DB669
	if_not_move_effect 0, 111, AI_sub_81DB677
	score -1
	jump AI_sub_81DB6EE

AI_sub_81DB677:: @ 81DB677
	if_status 0, 128, AI_sub_81DB6E6
	if_status2 0, 268435456, AI_sub_81DB6E6
	if_status3 0, 4, AI_sub_81DB6E6
	get_weather
	if_equal 3, AI_sub_81DB6A7
	if_equal 2, AI_sub_81DB6C2
	jump AI_sub_81DB6D2

AI_sub_81DB6A7:: @ 81DB6A7
	get_type 1
	if_in_bytes AI_bytes_81DB6EF, AI_sub_81DB6E6
	get_type 3
	if_in_bytes AI_bytes_81DB6EF, AI_sub_81DB6E6
	jump AI_sub_81DB6D2

AI_sub_81DB6C2:: @ 81DB6C2
	get_type 1
	if_equal 15, AI_sub_81DB6E6
	get_type 3
	if_equal 15, AI_sub_81DB6E6

AI_sub_81DB6D2:: @ 81DB6D2
	if_would_go_first 1, AI_sub_81DB6EE
	get_move 0
	get_move_effect_from_result
	if_not_equal 94, AI_sub_81DB6E6
	jump AI_sub_81DB6EE

AI_sub_81DB6E6:: @ 81DB6E6
	if_random_less_than 80, AI_sub_81DB6EE
	score 1

AI_sub_81DB6EE:: @ 81DB6EE
	end

AI_bytes_81DB6EF:: @ 81DB6EF
	.byte 4
	.byte 5
	.byte 8
	.byte 0xFF

AI_sub_81DB6F3:: @ 81DB6F3
	score 2
	end

AI_sub_81DB6F6:: @ 81DB6F6
	get_stockpile_count 1
	if_less_than 2, AI_sub_81DB706
	if_random_less_than 80, AI_sub_81DB706
	score 2

AI_sub_81DB706:: @ 81DB706
	end

AI_sub_81DB707:: @ 81DB707
	if_hp_less_than 1, 40, AI_sub_81DB72D
	get_weather
	if_equal 0, AI_sub_81DB726
	if_equal 1, AI_sub_81DB726
	if_equal 2, AI_sub_81DB726
	jump AI_sub_81DB72F

AI_sub_81DB726:: @ 81DB726
	score 1
	jump AI_sub_81DB72F

AI_sub_81DB72D:: @ 81DB72D
	score -1

AI_sub_81DB72F:: @ 81DB72F
	end

AI_sub_81DB730:: @ 81DB730
	if_not_status 0, 216, AI_sub_81DB73C
	score 1

AI_sub_81DB73C:: @ 81DB73C
	end

AI_sub_81DB73D:: @ 81DB73D
	if_damage_bonus 10, AI_sub_81DB77C
	if_damage_bonus 20, AI_sub_81DB77C
	if_status 0, 7, AI_sub_81DB789
	if_status2 0, 983040, AI_sub_81DB783
	if_status2 0, 7, AI_sub_81DB783
	is_first_turn 1
	if_not_equal 0, AI_sub_81DB78B
	if_random_less_than 100, AI_sub_81DB78B
	score 1
	jump AI_sub_81DB78B

AI_sub_81DB77C:: @ 81DB77C
	score -1
	jump AI_sub_81DB78B

AI_sub_81DB783:: @ 81DB783
	if_random_less_than 100, AI_sub_81DB78B

AI_sub_81DB789:: @ 81DB789
	score 1

AI_sub_81DB78B:: @ 81DB78B
	end

AI_sub_81DB78C:: @ 81DB78C
	if_status 0, 64, AI_sub_81DB79B
	jump AI_sub_81DB79D

AI_sub_81DB79B:: @ 81DB79B
	score 1

AI_sub_81DB79D:: @ 81DB79D
	end

AI_sub_81DB79E:: @ 81DB79E
	get_hold_effect 1
	if_in_bytes AI_bytes_81DB7E7, AI_sub_81DB7B9
	if_in_bytes AI_bytes_81DB7DF, AI_sub_81DB7CB

AI_sub_81DB7B2:: @ 81DB7B2
	score -3
	jump AI_sub_81DB7DE

AI_sub_81DB7B9:: @ 81DB7B9
	get_hold_effect 0
	if_in_bytes AI_bytes_81DB7E7, AI_sub_81DB7B2
	score 5
	jump AI_sub_81DB7DE

AI_sub_81DB7CB:: @ 81DB7CB
	get_hold_effect 0
	if_in_bytes AI_bytes_81DB7DF, AI_sub_81DB7B2
	if_random_less_than 50, AI_sub_81DB7DE
	score 2

AI_sub_81DB7DE:: @ 81DB7DE
	end

AI_bytes_81DB7DF:: @ 81DB7DF
	.byte 10
	.byte 11
	.byte 12
	.byte 13
	.byte 14
	.byte 24
	.byte 29
	.byte 0xFF

AI_bytes_81DB7E7:: @ 81DB7E7
	.byte 29
	.byte 0xFF

AI_sub_81DB7E9:: @ 81DB7E9
	get_ability 1
	if_in_bytes AI_bytes_81DB80F, AI_sub_81DB7FF
	get_ability 0
	if_in_bytes AI_bytes_81DB80F, AI_sub_81DB806

AI_sub_81DB7FF:: @ 81DB7FF
	score -1
	jump AI_sub_81DB80E

AI_sub_81DB806:: @ 81DB806
	if_random_less_than 50, AI_sub_81DB80E
	score 2

AI_sub_81DB80E:: @ 81DB80E
	end

AI_bytes_81DB80F:: @ 81DB80F
	.byte 3
	.byte 4
	.byte 8
	.byte 9
	.byte 18
	.byte 25
	.byte 27
	.byte 33
	.byte 37
	.byte 44
	.byte 56
	.byte 61
	.byte 63
	.byte 74
	.byte 34
	.byte 19
	.byte 0xFF

AI_sub_81DB820:: @ 81DB820
	if_damage_bonus 10, AI_sub_81DB84D
	if_damage_bonus 20, AI_sub_81DB84D
	if_stat_level_less_than 1, 1, 6, AI_sub_81DB84D
	if_would_go_first 1, AI_sub_81DB846
	if_hp_more_than 1, 40, AI_sub_81DB84D
	jump AI_sub_81DB84F

AI_sub_81DB846:: @ 81DB846
	if_hp_less_than 1, 60, AI_sub_81DB84F

AI_sub_81DB84D:: @ 81DB84D
	score -1

AI_sub_81DB84F:: @ 81DB84F
	end

AI_sub_81DB850:: @ 81DB850
	if_hp_more_than 0, 30, AI_sub_81DB85F
	if_random_less_than 100, AI_sub_81DB85F
	score -1

AI_sub_81DB85F:: @ 81DB85F
	is_first_turn 1
	if_equal 0, AI_sub_81DB87A
	if_random_less_than -106, AI_sub_81DB882
	score 1
	jump AI_sub_81DB882
	if_random_less_than 50, AI_sub_81DB882

AI_sub_81DB87A:: @ 81DB87A
	if_random_less_than 30, AI_sub_81DB882
	score -1

AI_sub_81DB882:: @ 81DB882
	end

AI_sub_81DB883:: @ 81DB883
	get_item 1
	if_not_in_bytes AI_bytes_81DB89E, AI_sub_81DB89B
	if_random_less_than 50, AI_sub_81DB89D
	score 1
	jump AI_sub_81DB89D

AI_sub_81DB89B:: @ 81DB89B
	score -2

AI_sub_81DB89D:: @ 81DB89D
	end

AI_bytes_81DB89E:: @ 81DB89E
	.byte 134
	.byte 141
	.byte 174
	.byte 0xFF

AI_sub_81DB8A2:: @ 81DB8A2
	if_status 0, 7, AI_sub_81DB8CD
	if_status2 0, 983040, AI_sub_81DB8CD
	if_status2 0, 7, AI_sub_81DB8CD
	if_random_less_than -76, AI_sub_81DB8CD
	score 2
	jump AI_sub_81DB8CF

AI_sub_81DB8CD:: @ 81DB8CD
	score -2

AI_sub_81DB8CF:: @ 81DB8CF
	end

AI_sub_81DB8D0:: @ 81DB8D0
	if_status4 0, 1, AI_sub_81DB8DF
	jump AI_sub_81DB8E1

AI_sub_81DB8DF:: @ 81DB8DF
	score 1

AI_sub_81DB8E1:: @ 81DB8E1
	end

AI_sub_81DB8E2:: @ 81DB8E2
	if_hp_less_than 0, 30, AI_sub_81DB8F9
	is_first_turn 1
	if_more_than 0, AI_sub_81DB8F9
	if_random_less_than -76, AI_sub_81DB8F9
	score 1

AI_sub_81DB8F9:: @ 81DB8F9
	end

AI_sub_81DB8FA:: @ 81DB8FA
	if_hp_less_than 0, 70, AI_sub_81DB923
	if_would_go_first 1, AI_sub_81DB915
	if_hp_more_than 1, 40, AI_sub_81DB923
	score 1
	jump AI_sub_81DB925

AI_sub_81DB915:: @ 81DB915
	if_hp_more_than 1, 50, AI_sub_81DB923
	score 1
	jump AI_sub_81DB925

AI_sub_81DB923:: @ 81DB923
	score -1

AI_sub_81DB925:: @ 81DB925
	end

AI_sub_81DB926:: @ 81DB926
	if_damage_bonus 10, AI_sub_81DB94B
	if_damage_bonus 20, AI_sub_81DB94B
	if_would_go_first 1, AI_sub_81DB944
	if_hp_more_than 0, 50, AI_sub_81DB94D
	jump AI_sub_81DB94B

AI_sub_81DB944:: @ 81DB944
	if_hp_more_than 0, 70, AI_sub_81DB94D

AI_sub_81DB94B:: @ 81DB94B
	score -1

AI_sub_81DB94D:: @ 81DB94D
	end

AI_sub_81DB94E:: @ 81DB94E
	is_first_turn 1
	if_more_than 0, AI_sub_81DB95E
	if_random_less_than 100, AI_sub_81DB95E
	score 2

AI_sub_81DB95E:: @ 81DB95E
	end

AI_sub_81DB95F:: @ 81DB95F
	if_hp_less_than 0, 50, AI_sub_81DB96B
	jump AI_sub_81DB96D

AI_sub_81DB96B:: @ 81DB96B
	score -1

AI_sub_81DB96D:: @ 81DB96D
	end

AI_sub_81DB96E:: @ 81DB96E
	is_first_turn 1
	if_equal 1, AI_sub_81DB9B5
	if_random_less_than 30, AI_sub_81DB9D7
	if_would_go_first 1, AI_sub_81DB99B
	if_hp_not_equal 1, 100, AI_sub_81DB9CF
	if_hp_less_than 0, 70, AI_sub_81DB9CF
	if_random_less_than 60, AI_sub_81DB9D7
	jump AI_sub_81DB9CF

AI_sub_81DB99B:: @ 81DB99B
	if_hp_more_than 0, 25, AI_sub_81DB9CF
	if_move_effect 0, 32, AI_sub_81DB9B5
	if_move_effect 0, -100, AI_sub_81DB9B5
	jump AI_sub_81DB9C2

AI_sub_81DB9B5:: @ 81DB9B5
	if_random_less_than -106, AI_sub_81DB9D7
	score 2
	jump AI_sub_81DB9D7

AI_sub_81DB9C2:: @ 81DB9C2
	if_random_less_than -26, AI_sub_81DB9CF
	score 1
	jump AI_sub_81DB9D7

AI_sub_81DB9CF:: @ 81DB9CF
	if_random_less_than 30, AI_sub_81DB9D7
	score -2

AI_sub_81DB9D7:: @ 81DB9D7
	end

AI_sub_81DB9D8:: @ 81DB9D8
	if_hp_less_than 1, 50, AI_sub_81DB9FB
	get_type 0
	if_equal 13, AI_sub_81DB9F4
	get_type 2
	if_equal 13, AI_sub_81DB9F4
	jump AI_sub_81DB9FB

AI_sub_81DB9F4:: @ 81DB9F4
	score 1
	jump AI_sub_81DB9FD

AI_sub_81DB9FB:: @ 81DB9FB
	score -1

AI_sub_81DB9FD:: @ 81DB9FD
	end

AI_sub_81DB9FE:: @ 81DB9FE
	if_damage_bonus 10, AI_sub_81DBA23
	if_damage_bonus 20, AI_sub_81DBA23
	if_would_go_first 1, AI_sub_81DBA1C
	if_hp_more_than 1, 60, AI_sub_81DBA25
	jump AI_sub_81DBA23

AI_sub_81DBA1C:: @ 81DBA1C
	if_hp_more_than 1, 80, AI_sub_81DBA25

AI_sub_81DBA23:: @ 81DBA23
	score -1

AI_sub_81DBA25:: @ 81DBA25
	end

AI_sub_81DBA26:: @ 81DBA26
	if_hp_less_than 1, 50, AI_sub_81DBA49
	get_type 0
	if_equal 10, AI_sub_81DBA42
	get_type 2
	if_equal 10, AI_sub_81DBA42
	jump AI_sub_81DBA49

AI_sub_81DBA42:: @ 81DBA42
	score 1
	jump AI_sub_81DBA4B

AI_sub_81DBA49:: @ 81DBA49
	score -1

AI_sub_81DBA4B:: @ 81DBA4B
	end

AI_sub_81DBA4C:: @ 81DBA4C
	if_would_go_first 1, AI_sub_81DBA66
	if_hp_more_than 1, 50, AI_sub_81DBA6E
	if_random_less_than 70, AI_sub_81DBA6E
	score -1
	jump AI_sub_81DBA6E

AI_sub_81DBA66:: @ 81DBA66
	if_random_less_than -128, AI_sub_81DBA6E
	score 1

AI_sub_81DBA6E:: @ 81DBA6E
	end

AI_CheckViability:: @ 81DBA6F
	if_can_faint AI_sub_81DBA7C
	is_most_powerful_move
	if_equal 1, AI_sub_81DA424
	end

AI_sub_81DBA7C:: @ 81DBA7C
	if_effect 7, AI_sub_81DBA8C
	if_not_effect 103, AI_sub_81DBA8A
	score 2

AI_sub_81DBA8A:: @ 81DBA8A
	score 4

AI_sub_81DBA8C:: @ 81DBA8C
	end

AI_SetupFirstTurn:: @ 81DBA8D
	get_turn_count
	if_not_equal 0, AI_sub_81DBAA6
	get_effect
	if_not_in_bytes AI_bytes_81DBAA7, AI_sub_81DBAA6
	if_random_less_than 80, AI_sub_81DBAA6
	score 2

AI_sub_81DBAA6:: @ 81DBAA6
	end

AI_bytes_81DBAA7:: @ 81DBAA7
	.byte 10
	.byte 11
	.byte 12
	.byte 13
	.byte 14
	.byte 15
	.byte 16
	.byte 18
	.byte 19
	.byte 20
	.byte 21
	.byte 22
	.byte 23
	.byte 24
	.byte 30
	.byte 35
	.byte 54
	.byte 47
	.byte 49
	.byte 50
	.byte 51
	.byte 52
	.byte 53
	.byte 54
	.byte 55
	.byte 56
	.byte 58
	.byte 59
	.byte 60
	.byte 61
	.byte 62
	.byte 63
	.byte 64
	.byte 65
	.byte 66
	.byte 67
	.byte 79
	.byte 84
	.byte 108
	.byte 109
	.byte 118
	.byte 213
	.byte 187
	.byte 156
	.byte 165
	.byte 166
	.byte 167
	.byte 181
	.byte 192
	.byte 199
	.byte 205
	.byte 206
	.byte 208
	.byte 211
	.byte 213
	.byte 0xFF

AI_PreferStrongestMove:: @ 81DBADF
	is_most_powerful_move
	if_not_equal 0, AI_sub_81DBAEE
	if_random_less_than 100, AI_sub_81DBAEE
	score 2

AI_sub_81DBAEE:: @ 81DBAEE
	end

AI_Risky:: @ 81DBAEF
	get_effect
	if_not_in_bytes AI_bytes_81DBB02, AI_sub_81DBB01
	if_random_less_than -128, AI_sub_81DBB01
	score 2

AI_sub_81DBB01:: @ 81DBB01
	end

AI_bytes_81DBB02:: @ 81DBB02
	.byte 1
	.byte 7
	.byte 9
	.byte 38
	.byte 43
	.byte 49
	.byte 83
	.byte 88
	.byte 89
	.byte 98
	.byte 118
	.byte 120
	.byte 122
	.byte 140
	.byte 142
	.byte 144
	.byte 170
	.byte 185
	.byte 199
	.byte 0xFF

AI_PreferBatonPass:: @ 81DBB16
	count_alive_pokemon 1
	if_equal 0, AI_sub_81DBB3A
	is_most_powerful_move
	if_not_equal 0, AI_sub_81DBB3A
	if_move_effect 1, 127, AI_sub_81DBB32
	if_random_less_than 80, AI_sub_81DBB01

AI_sub_81DBB32:: @ 81DBB32
	if_random_less_than 20, AI_sub_81DBB01
	score 3

AI_sub_81DBB3A:: @ 81DBB3A
	end

AI_DoubleBattle:: @ 81DBB3B
	end

AI_HPAware:: @ 81DBB3C
	if_hp_more_than 1, 70, AI_sub_81DBB59
	if_hp_more_than 1, 30, AI_sub_81DBB68
	get_effect
	if_in_bytes AI_bytes_81DBBFC, AI_sub_81DBB77
	jump AI_sub_81DBB7F

AI_sub_81DBB59:: @ 81DBB59
	get_effect
	if_in_bytes AI_bytes_81DBBC3, AI_sub_81DBB77
	jump AI_sub_81DBB7F

AI_sub_81DBB68:: @ 81DBB68
	get_effect
	if_in_bytes AI_bytes_81DBBD1, AI_sub_81DBB77
	jump AI_sub_81DBB7F

AI_sub_81DBB77:: @ 81DBB77
	if_random_less_than 50, AI_sub_81DBB7F
	score -2

AI_sub_81DBB7F:: @ 81DBB7F
	if_hp_more_than 0, 70, AI_sub_81DBB9C
	if_hp_more_than 0, 30, AI_sub_81DBBAB
	get_effect
	if_in_bytes AI_bytes_81DBC55, AI_sub_81DBBBA
	jump AI_sub_81DBBC2

AI_sub_81DBB9C:: @ 81DBB9C
	get_effect
	if_in_bytes AI_bytes_81DBC2C, AI_sub_81DBBBA
	jump AI_sub_81DBBC2

AI_sub_81DBBAB:: @ 81DBBAB
	get_effect
	if_in_bytes AI_bytes_81DBC2D, AI_sub_81DBBBA
	jump AI_sub_81DBBC2

AI_sub_81DBBBA:: @ 81DBBBA
	if_random_less_than 50, AI_sub_81DBBC2
	score -2

AI_sub_81DBBC2:: @ 81DBBC2
	end

AI_bytes_81DBBC3:: @ 81DBBC3
	.byte 7
	.byte 32
	.byte 37
	.byte 98
	.byte 99
	.byte 116
	.byte 132
	.byte 133
	.byte 134
	.byte 157
	.byte 168
	.byte 194
	.byte 204
	.byte 0xFF

AI_bytes_81DBBD1:: @ 81DBBD1
	.byte 7
	.byte 10
	.byte 11
	.byte 12
	.byte 13
	.byte 14
	.byte 15
	.byte 16
	.byte 18
	.byte 19
	.byte 20
	.byte 21
	.byte 22
	.byte 23
	.byte 24
	.byte 26
	.byte 30
	.byte 35
	.byte 46
	.byte 47
	.byte 50
	.byte 51
	.byte 52
	.byte 53
	.byte 54
	.byte 55
	.byte 56
	.byte 58
	.byte 59
	.byte 60
	.byte 61
	.byte 62
	.byte 63
	.byte 64
	.byte 93
	.byte 124
	.byte 142
	.byte 205
	.byte 206
	.byte 208
	.byte 211
	.byte 212
	.byte 0xFF

AI_bytes_81DBBFC:: @ 81DBBFC
	.byte 10
	.byte 11
	.byte 12
	.byte 13
	.byte 14
	.byte 15
	.byte 16
	.byte 18
	.byte 19
	.byte 20
	.byte 21
	.byte 22
	.byte 23
	.byte 24
	.byte 26
	.byte 30
	.byte 35
	.byte 46
	.byte 47
	.byte 50
	.byte 51
	.byte 52
	.byte 53
	.byte 54
	.byte 55
	.byte 56
	.byte 58
	.byte 59
	.byte 60
	.byte 61
	.byte 62
	.byte 63
	.byte 64
	.byte 81
	.byte 93
	.byte 94
	.byte 124
	.byte 142
	.byte 143
	.byte 144
	.byte 151
	.byte 190
	.byte 205
	.byte 206
	.byte 208
	.byte 211
	.byte 212
	.byte 0xFF

AI_bytes_81DBC2C:: @ 81DBC2C
	.byte 0xFF

AI_bytes_81DBC2D:: @ 81DBC2D
	.byte 10
	.byte 11
	.byte 12
	.byte 13
	.byte 14
	.byte 15
	.byte 16
	.byte 18
	.byte 19
	.byte 20
	.byte 21
	.byte 22
	.byte 23
	.byte 24
	.byte 46
	.byte 47
	.byte 50
	.byte 51
	.byte 52
	.byte 53
	.byte 54
	.byte 55
	.byte 56
	.byte 58
	.byte 59
	.byte 60
	.byte 61
	.byte 62
	.byte 63
	.byte 64
	.byte 66
	.byte 91
	.byte 114
	.byte 124
	.byte 205
	.byte 206
	.byte 208
	.byte 211
	.byte 212
	.byte 0xFF

AI_bytes_81DBC55:: @ 81DBC55
	.byte 1
	.byte 7
	.byte 10
	.byte 11
	.byte 12
	.byte 13
	.byte 14
	.byte 15
	.byte 16
	.byte 18
	.byte 19
	.byte 20
	.byte 21
	.byte 22
	.byte 23
	.byte 24
	.byte 26
	.byte 30
	.byte 33
	.byte 35
	.byte 38
	.byte 40
	.byte 40
	.byte 46
	.byte 47
	.byte 49
	.byte 50
	.byte 51
	.byte 52
	.byte 53
	.byte 54
	.byte 55
	.byte 56
	.byte 58
	.byte 59
	.byte 60
	.byte 61
	.byte 62
	.byte 63
	.byte 64
	.byte 66
	.byte 67
	.byte 91
	.byte 93
	.byte 94
	.byte 100
	.byte 114
	.byte 118
	.byte 119
	.byte 120
	.byte 124
	.byte 143
	.byte 144
	.byte 167
	.byte 205
	.byte 206
	.byte 208
	.byte 211
	.byte 212
	.byte 0xFF

AI_Unknown:: @ 81DBC91
	if_not_effect -119, AI_sub_81DBCA7
	if_equal 0, AI_sub_81DBCA7
	is_first_turn 1
	if_equal 0, AI_sub_81DBCA7
	score 5

AI_sub_81DBCA7:: @ 81DBCA7
	end

AI_Roaming:: @ 81DBCA8
	if_status2 1, 57344, AI_sub_81DBCD5
	if_status2 1, 67108864, AI_sub_81DBCD5
	get_ability 0
	if_equal 23, AI_sub_81DBCD5
	get_ability 1
	if_equal 26, AI_sub_81DBCD4
	get_ability 0
	if_equal 71, AI_sub_81DBCD5

AI_sub_81DBCD4:: @ 81DBCD4
	flee

AI_sub_81DBCD5:: @ 81DBCD5
	end

AI_Safari:: @ 81DBCD6
	if_random_100 AI_sub_81DBCDC
	watch

AI_sub_81DBCDC:: @ 81DBCDC
	flee

AI_FirstBattle:: @ 81DBCDD
	if_hp_equal 0, 20, AI_sub_81DBCEC
	if_hp_less_than 0, 20, AI_sub_81DBCEC
	end

AI_sub_81DBCEC:: @ 81DBCEC
	flee

AI_Ret:: @ 81DBCED
	end
