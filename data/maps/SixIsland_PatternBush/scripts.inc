SixIsland_PatternBush_MapScripts:: @ 8164559
	map_script 3, SixIsland_PatternBush_MapScript1_16455F
	.byte 0

SixIsland_PatternBush_MapScript1_16455F:: @ 816455F
	setworldmapflag FLAG_WORLD_MAP_SIX_ISLAND_PATTERN_BUSH
	getplayerxy VAR_0x4001, VAR_0x4002
	compare_var_to_value VAR_0x4001, 50
	call_if 4, EventScript_16457E
	compare_var_to_value VAR_0x4001, 49
	call_if 3, EventScript_164587
	end

EventScript_16457E:: @ 816457E
	setescapewarp MAP_SIX_ISLAND_GREEN_PATH, 255, 64, 10
	return

EventScript_164587:: @ 8164587
	setescapewarp MAP_SIX_ISLAND_GREEN_PATH, 255, 45, 10
	return

SixIsland_PatternBush_EventScript_164590:: @ 8164590
	trainerbattle 0, TRAINER_PKMN_BREEDER_BETHANY, 0, Text_17BF3A, Text_17BF66
	msgbox gUnknown_817BF97, 6
	end

SixIsland_PatternBush_EventScript_1645A7:: @ 81645A7
	trainerbattle 0, TRAINER_PKMN_BREEDER_ALLISON, 0, Text_17BFEB, Text_17C028
	msgbox gUnknown_817C056, 6
	end

SixIsland_PatternBush_EventScript_1645BE:: @ 81645BE
	trainerbattle 0, TRAINER_BUG_CATCHER_GARRET, 0, Text_17C0BE, Text_17C0F2
	msgbox gUnknown_817C113, 6
	end

SixIsland_PatternBush_EventScript_1645D5:: @ 81645D5
	trainerbattle 0, TRAINER_BUG_CATCHER_JONAH, 0, Text_17C155, Text_17C196
	msgbox gUnknown_817C1D0, 6
	end

SixIsland_PatternBush_EventScript_1645EC:: @ 81645EC
	trainerbattle 0, TRAINER_BUG_CATCHER_VANCE, 0, Text_17C246, Text_17C275
	msgbox gUnknown_817C2A4, 6
	end

SixIsland_PatternBush_EventScript_164603:: @ 8164603
	trainerbattle 0, TRAINER_YOUNGSTER_NASH, 0, Text_17C2D9, Text_17C30D
	msgbox gUnknown_817C31C, 6
	end

SixIsland_PatternBush_EventScript_16461A:: @ 816461A
	trainerbattle 0, TRAINER_YOUNGSTER_CORDELL, 0, Text_17C373, Text_17C3A5
	msgbox gUnknown_817C3CE, 6
	end

SixIsland_PatternBush_EventScript_164631:: @ 8164631
	trainerbattle 0, TRAINER_LASS_DALIA, 0, Text_17C42B, Text_17C458
	msgbox gUnknown_817C490, 6
	end

SixIsland_PatternBush_EventScript_164648:: @ 8164648
	trainerbattle 0, TRAINER_LASS_JOANA, 0, Text_17C4FE, Text_17C552
	msgbox gUnknown_817C590, 6
	end

SixIsland_PatternBush_EventScript_16465F:: @ 816465F
	trainerbattle 0, TRAINER_CAMPER_RILEY, 0, Text_17C5DB, Text_17C609
	msgbox gUnknown_817C615, 6
	end

SixIsland_PatternBush_EventScript_164676:: @ 8164676
	trainerbattle 0, TRAINER_PICNICKER_MARCY, 0, Text_17C63E, Text_17C660
	msgbox gUnknown_817C68E, 6
	end

SixIsland_PatternBush_EventScript_16468D:: @ 816468D
	trainerbattle 0, TRAINER_RUIN_MANIAC_LAYTON, 0, Text_17C6C9, Text_17C6FB
	msgbox gUnknown_817C728, 6
	end
