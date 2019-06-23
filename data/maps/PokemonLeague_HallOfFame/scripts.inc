PokemonLeague_HallOfFame_MapScripts:: @ 8162D4C
	map_script 2, PokemonLeague_HallOfFame_MapScript1_162D66
	map_script 4, PokemonLeague_HallOfFame_MapScript2_162D57
	.byte 0

PokemonLeague_HallOfFame_MapScript2_162D57:: @ 8162D57
	map_script_2 VAR_0x4001, 0, EventScript_162D61
	.2byte 0

EventScript_162D61:: @ 8162D61
	turnobject 255, 2
	end

PokemonLeague_HallOfFame_MapScript1_162D66:: @ 8162D66
	map_script_2 VAR_0x4001, 0, EventScript_162D70
	.2byte 0

EventScript_162D70:: @ 8162D70
	lockall
	textcolor 0
	applymovement 255, Movement_162DCD
	waitmovement 0
	applymovement 1, Movement_1A75E7
	applymovement 255, Movement_1A75EB
	waitmovement 0
	delay 18
	msgbox gUnknown_817922F
	closemessage
	applymovement 1, Movement_1A75E9
	applymovement 255, Movement_1A75E9
	waitmovement 0
	delay 20
	dofieldeffect 62
	waitfieldeffect 62
	delay 40
	setvar VAR_0x4001, 1
	call EventScript_1A651A
	setrespawn SPAWN_PALLET_TOWN
	fadescreenspeed 1, 24
	special sub_80CA2E4
	waitstate
	releaseall
	end

Movement_162DCD:: @ 8162DCD
	step_11
	step_11
	step_11
	step_11
	step_11
	step_11
	step_11
	step_11
	step_end
