OneIsland_Harbor_MapScripts:: @ 8171378
	map_script 4, OneIsland_Harbor_MapScript1_171383
	map_script 2, OneIsland_Harbor_MapScript2_171392
	.byte 0

OneIsland_Harbor_MapScript1_171383:: @ 8171383
	map_script_2 VAR_0x4075, 1, EventScript_17138D
	.2byte 0

EventScript_17138D:: @ 817138D
	turnobject 255, 2
	end

OneIsland_Harbor_MapScript2_171392:: @ 8171392
	map_script_2 VAR_0x4075, 1, EventScript_17139C
	.2byte 0

EventScript_17139C:: @ 817139C
	lockall
	textcolor 0
	applymovement 255, Movement_1713B9
	waitmovement 0
	setvar VAR_0x4075, 2
	warp MAP_ONE_ISLAND, 255, 12, 18
	waitstate
	releaseall
	end

Movement_1713B9:: @ 81713B9
	step_11
	step_11
	step_11
	step_end

OneIsland_Harbor_EventScript_1713BD:: @ 81713BD
	lock
	faceplayer
	message Text_181726
	waitmessage
	setvar VAR_0x8004, 1
	goto EventScript_1A8EC5
	end
