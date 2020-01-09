OneIsland_Harbor_MapScripts:: @ 8171378
	map_script MAP_SCRIPT_ON_WARP_INTO_MAP_TABLE, OneIsland_Harbor_OnWarp
	map_script MAP_SCRIPT_ON_FRAME_TABLE, OneIsland_Harbor_OnFrame
	.byte 0

OneIsland_Harbor_OnWarp:: @ 8171383
	map_script_2 VAR_MAP_SCENE_ONE_ISLAND_HARBOR, 1, EventScript_17138D
	.2byte 0

EventScript_17138D:: @ 817138D
	turnobject 255, 2
	end

OneIsland_Harbor_OnFrame:: @ 8171392
	map_script_2 VAR_MAP_SCENE_ONE_ISLAND_HARBOR, 1, EventScript_17139C
	.2byte 0

EventScript_17139C:: @ 817139C
	lockall
	textcolor 0
	applymovement OBJ_EVENT_ID_PLAYER, Movement_1713B9
	waitmovement 0
	setvar VAR_MAP_SCENE_ONE_ISLAND_HARBOR, 2
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
	setvar VAR_0x8004, SEAGALLOP_ONE_ISLAND
	goto EventScript_1A8EC5
	end
