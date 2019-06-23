PokemonLeague_BrunosRoom_MapScripts:: @ 8162685
	map_script 5, PokemonLeague_BrunosRoom_MapScript1_16269A
	map_script 1, PokemonLeague_BrunosRoom_MapScript2_1626A5
	map_script 4, PokemonLeague_BrunosRoom_MapScript3_1626C6
	map_script 2, PokemonLeague_BrunosRoom_MapScript4_1626D5
	.byte 0

PokemonLeague_BrunosRoom_MapScript1_16269A:: @ 816269A
	setvar VAR_0x8004, 1
	call EventScript_1A75D5
	end

PokemonLeague_BrunosRoom_MapScript2_1626A5:: @ 81626A5
	checkflag FLAG_0x4B9
	call_if 1, EventScript_1626C0
	compare_var_to_value VAR_0x4068, 2
	call_if 1, EventScript_1626BA
	end

EventScript_1626BA:: @ 81626BA
	call EventScript_1A759C
	return

EventScript_1626C0:: @ 81626C0
	call EventScript_1A7538
	return

PokemonLeague_BrunosRoom_MapScript3_1626C6:: @ 81626C6
	map_script_2 VAR_0x4001, 0, EventScript_1626D0
	.2byte 0

EventScript_1626D0:: @ 81626D0
	turnobject 255, 2
	end

PokemonLeague_BrunosRoom_MapScript4_1626D5:: @ 81626D5
	map_script_2 VAR_0x4068, 1, EventScript_1626DF
	.2byte 0

EventScript_1626DF:: @ 81626DF
	lockall
	call EventScript_1A751F
	setvar VAR_0x4068, 2
	releaseall
	end

PokemonLeague_BrunosRoom_EventScript_1626EC:: @ 81626EC
	lock
	faceplayer
	setvar VAR_0x8004, 10
	setvar VAR_0x8005, 2
	special UpdatePickStateFromSpecialVar8005
	checkflag FLAG_0x4B9
	goto_if_eq EventScript_162779
	setvar VAR_0x8004, 10
	setvar VAR_0x8005, 0
	special SetFlavorTextFlagFromSpecialVars
	setvar VAR_0x8004, 10
	setvar VAR_0x8005, 1
	special SetFlavorTextFlagFromSpecialVars
	checkflag FLAG_0x82C
	call_if 0, EventScript_162751
	checkflag FLAG_0x82C
	call_if 1, EventScript_16275A
	setflag FLAG_0x003
	setflag FLAG_0x005
	checkflag FLAG_0x844
	call_if 0, EventScript_162763
	checkflag FLAG_0x844
	call_if 1, EventScript_16276E
	clearflag FLAG_0x005
	goto EventScript_1627B0

EventScript_162750:: @ 8162750
	end

EventScript_162751:: @ 8162751
	msgbox gUnknown_817820F
	return

EventScript_16275A:: @ 816275A
	msgbox gUnknown_817830C
	return

EventScript_162763:: @ 8162763
	trainerbattle 3, 411, 0, Text_178409
	return

EventScript_16276E:: @ 816276E
	trainerbattle 3, 736, 0, Text_178409
	return

EventScript_162779:: @ 8162779
	msgbox gUnknown_8178420
	closemessage
	compare_var_to_value VAR_FACING, 2
	call_if 1, EventScript_1627FA
	compare_var_to_value VAR_FACING, 1
	call_if 1, EventScript_1627EF
	compare_var_to_value VAR_FACING, 3
	call_if 1, EventScript_162805
	compare_var_to_value VAR_FACING, 4
	call_if 1, EventScript_162805
	release
	end

EventScript_1627B0:: @ 81627B0
	setflag FLAG_0x4B9
	call EventScript_1A7506
	msgbox gUnknown_8178420
	closemessage
	compare_var_to_value VAR_FACING, 2
	call_if 1, EventScript_1627FA
	compare_var_to_value VAR_FACING, 1
	call_if 1, EventScript_1627EF
	compare_var_to_value VAR_FACING, 3
	call_if 1, EventScript_162805
	compare_var_to_value VAR_FACING, 4
	call_if 1, EventScript_162805
	release
	end

EventScript_1627EF:: @ 81627EF
	applymovement 1, Movement_1A75E7
	waitmovement 0
	return

EventScript_1627FA:: @ 81627FA
	applymovement 1, Movement_1A75EB
	waitmovement 0
	return

EventScript_162805:: @ 8162805
	applymovement 1, Movement_1A75ED
	waitmovement 0
	return
