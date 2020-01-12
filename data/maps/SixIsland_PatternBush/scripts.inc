SixIsland_PatternBush_MapScripts:: @ 8164559
	map_script MAP_SCRIPT_ON_TRANSITION, SixIsland_PatternBush_OnTransition
	.byte 0

SixIsland_PatternBush_OnTransition:: @ 816455F
	setworldmapflag FLAG_WORLD_MAP_SIX_ISLAND_PATTERN_BUSH
	getplayerxy VAR_TEMP_1, VAR_TEMP_2
	compare VAR_TEMP_1, 50
	call_if_ge EventScript_16457E
	compare VAR_TEMP_1, 49
	call_if_le EventScript_164587
	end

EventScript_16457E:: @ 816457E
	setescapewarp MAP_SIX_ISLAND_GREEN_PATH, 255, 64, 10
	return

EventScript_164587:: @ 8164587
	setescapewarp MAP_SIX_ISLAND_GREEN_PATH, 255, 45, 10
	return

SixIsland_PatternBush_EventScript_164590:: @ 8164590
	trainerbattle_single TRAINER_PKMN_BREEDER_BETHANY, Text_17BF3A, Text_17BF66
	msgbox gUnknown_817BF97, MSGBOX_AUTOCLOSE
	end

SixIsland_PatternBush_EventScript_1645A7:: @ 81645A7
	trainerbattle_single TRAINER_PKMN_BREEDER_ALLISON, Text_17BFEB, Text_17C028
	msgbox gUnknown_817C056, MSGBOX_AUTOCLOSE
	end

SixIsland_PatternBush_EventScript_1645BE:: @ 81645BE
	trainerbattle_single TRAINER_BUG_CATCHER_GARRET, Text_17C0BE, Text_17C0F2
	msgbox gUnknown_817C113, MSGBOX_AUTOCLOSE
	end

SixIsland_PatternBush_EventScript_1645D5:: @ 81645D5
	trainerbattle_single TRAINER_BUG_CATCHER_JONAH, Text_17C155, Text_17C196
	msgbox gUnknown_817C1D0, MSGBOX_AUTOCLOSE
	end

SixIsland_PatternBush_EventScript_1645EC:: @ 81645EC
	trainerbattle_single TRAINER_BUG_CATCHER_VANCE, Text_17C246, Text_17C275
	msgbox gUnknown_817C2A4, MSGBOX_AUTOCLOSE
	end

SixIsland_PatternBush_EventScript_164603:: @ 8164603
	trainerbattle_single TRAINER_YOUNGSTER_NASH, Text_17C2D9, Text_17C30D
	msgbox gUnknown_817C31C, MSGBOX_AUTOCLOSE
	end

SixIsland_PatternBush_EventScript_16461A:: @ 816461A
	trainerbattle_single TRAINER_YOUNGSTER_CORDELL, Text_17C373, Text_17C3A5
	msgbox gUnknown_817C3CE, MSGBOX_AUTOCLOSE
	end

SixIsland_PatternBush_EventScript_164631:: @ 8164631
	trainerbattle_single TRAINER_LASS_DALIA, Text_17C42B, Text_17C458
	msgbox gUnknown_817C490, MSGBOX_AUTOCLOSE
	end

SixIsland_PatternBush_EventScript_164648:: @ 8164648
	trainerbattle_single TRAINER_LASS_JOANA, Text_17C4FE, Text_17C552
	msgbox gUnknown_817C590, MSGBOX_AUTOCLOSE
	end

SixIsland_PatternBush_EventScript_16465F:: @ 816465F
	trainerbattle_single TRAINER_CAMPER_RILEY, Text_17C5DB, Text_17C609
	msgbox gUnknown_817C615, MSGBOX_AUTOCLOSE
	end

SixIsland_PatternBush_EventScript_164676:: @ 8164676
	trainerbattle_single TRAINER_PICNICKER_MARCY, Text_17C63E, Text_17C660
	msgbox gUnknown_817C68E, MSGBOX_AUTOCLOSE
	end

SixIsland_PatternBush_EventScript_16468D:: @ 816468D
	trainerbattle_single TRAINER_RUIN_MANIAC_LAYTON, Text_17C6C9, Text_17C6FB
	msgbox gUnknown_817C728, MSGBOX_AUTOCLOSE
	end
