FourIsland_IcefallCave_Back_MapScripts:: @ 8163D82
	map_script MAP_SCRIPT_ON_TRANSITION, FourIsland_IcefallCave_Back_OnTransition
	.byte 0

FourIsland_IcefallCave_Back_OnTransition:: @ 8163D88
	compare VAR_MAP_SCENE_ICEFALL_CAVE_BACK, 1
	call_if eq, EventScript_163D94
	end

EventScript_163D94:: @ 8163D94
	setflag FLAG_HIDE_ICEFALL_CAVE_LORELEI
	return

FourIsland_IcefallCave_Back_EventScript_163D98:: @ 8163D98
	lockall
	textcolor 1
	msgbox gUnknown_817B04F
	applymovement 1, Movement_163EE8
	waitmovement 0
	textcolor 0
	msgbox gUnknown_817B0B9
	closemessage
	playse SE_PIN
	applymovement 3, Movement_ExclamationMark
	waitmovement 0
	applymovement 3, Movement_WalkInPlaceFastestDown
	waitmovement 0
	applymovement 3, Movement_Delay48
	waitmovement 0
	textcolor 1
	msgbox gUnknown_817B109
	closemessage
	applymovement 3, Movement_WalkInPlaceFastestRight
	waitmovement 0
	delay 18
	applymovement 3, Movement_WalkInPlaceFastestDown
	waitmovement 0
	delay 35
	applymovement 4, Movement_163F11
	applymovement 3, Movement_163F18
	applymovement OBJ_EVENT_ID_PLAYER, Movement_163EDD
	waitmovement 0
	applymovement 2, Movement_163EE8
	waitmovement 0
	playbgm MUS_ROCKET, 0
	textcolor 0
	msgbox gUnknown_817B20B
	setvar VAR_LAST_TALKED, 4
	trainerbattle TRAINER_BATTLE_SINGLE_NO_INTRO_TEXT, TRAINER_TEAM_ROCKET_GRUNT_45, 0, Text_17B251
	applymovement 3, Movement_163F1B
	waitmovement 0
	textcolor 1
	msgbox gUnknown_817B269
	textcolor 0
	msgbox gUnknown_817B2EF
	textcolor 1
	message Text_17B313
	waitmessage
	waitse
	playmoncry SPECIES_LAPRAS, 2
	waitbuttonpress
	waitmoncry
	applymovement 1, Movement_163EEE
	waitmovement 0
	textcolor 0
	msgbox gUnknown_817B399
	closemessage
	applymovement 3, Movement_163F1D
	applymovement OBJ_EVENT_ID_PLAYER, Movement_163EE2
	applymovement 1, Movement_163EF0
	applymovement 2, Movement_163EFA
	applymovement 4, Movement_163F05
	waitmovement 0
	removeobject 1
	removeobject 2
	removeobject 4
	delay 50
	applymovement 3, Movement_163F23
	waitmovement 0
	applymovement OBJ_EVENT_ID_PLAYER, Movement_WalkInPlaceFastestLeft
	waitmovement 0
	textcolor 1
	msgbox gUnknown_817B457
	setflag FLAG_HIDE_RUIN_VALLEY_SCIENTIST
	clearflag FLAG_HIDE_LORELEI_IN_HER_HOUSE
	setvar VAR_MAP_SCENE_ICEFALL_CAVE_BACK, 1
	releaseall
	end

Movement_163EDD:: @ 8163EDD
	walk_up
	walk_up
	walk_right
	walk_up
	step_end

Movement_163EE2:: @ 8163EE2
	delay_16
	walk_in_place_fastest_left
	delay_16
	delay_16
	walk_in_place_fastest_down
	step_end

Movement_163EE8:: @ 8163EE8
	walk_in_place_down
	step_end

gUnknown_163EEA:: @ 8163EEA
	lock_facing_direction
	walk_right
	unlock_facing_direction
	step_end

Movement_163EEE:: @ 8163EEE
	walk_in_place_fast_down
	step_end

Movement_163EF0:: @ 8163EF0
	walk_right
	walk_down
	walk_fast_down
	walk_fast_down
	walk_fast_down
	walk_fast_down
	walk_fast_down
	walk_fast_down
	walk_fast_down
	step_end

Movement_163EFA:: @ 8163EFA
	delay_16
	walk_left
	walk_down
	walk_fast_down
	walk_fast_down
	walk_fast_down
	walk_fast_down
	walk_fast_down
	walk_fast_down
	walk_fast_down
	step_end

Movement_163F05:: @ 8163F05
	delay_16
	walk_down
	delay_16
	walk_down
	walk_fast_right
	walk_fast_right
	walk_fast_down
	walk_fast_down
	walk_fast_down
	walk_fast_down
	walk_fast_down
	step_end

Movement_163F11:: @ 8163F11
	delay_16
	delay_8
	walk_in_place_fastest_right
	step_end

Movement_163F15:: @ 8163F15
	walk_left
	walk_left
	step_end

Movement_163F18:: @ 8163F18
	walk_left
	walk_up
	step_end

Movement_163F1B:: @ 8163F1B
	walk_in_place_up
	step_end

Movement_163F1D:: @ 8163F1D
	delay_8
	walk_in_place_fastest_right
	delay_16
	delay_16
	walk_in_place_fastest_down
	step_end

Movement_163F23:: @ 8163F23
	walk_right
	step_end

FourIsland_IcefallCave_Back_EventScript_163F25:: @ 8163F25
	msgbox gUnknown_817B457, 2
	end
