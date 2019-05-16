BirthIsland_Exterior_MapScripts:: @ 8165203
	map_script 3, BirthIsland_Exterior_MapScript1_165217
	map_script 5, BirthIsland_Exterior_MapScript2_165253
	map_script 7, BirthIsland_Exterior_MapScript3_165213
	.byte 0

BirthIsland_Exterior_MapScript3_165213:: @ 8165213
	special sub_80CD008
	end

BirthIsland_Exterior_MapScript1_165217:: @ 8165217
	setworldmapflag FLAG_WORLD_MAP_BIRTH_ISLAND_EXTERIOR
	setvar VAR_0x4010, 150
	setvar VAR_SECRET_BASE_MAP, 0
	setvar VAR_ALTERING_CAVE_WILD_SET, 0
	checkflag FLAG_0x2E4
	call_if 1, EventScript_16523C
	checkflag FLAG_0x2E4
	call_if 0, EventScript_165243
	end

EventScript_16523C:: @ 816523C
	setflag FLAG_0x099
	setflag FLAG_0x09A
	return

EventScript_165243:: @ 8165243
	checkflag FLAG_0x2F7
	goto_if 1, EventScript_1A77A9
	clearflag FLAG_0x09A
	clearflag FLAG_0x848
	return

BirthIsland_Exterior_MapScript2_165253:: @ 8165253
	checkflag FLAG_0x807
	call_if 1, EventScript_16525D
	end

EventScript_16525D:: @ 816525D
	specialvar VAR_RESULT, sub_80CA74C
	compare_var_to_value VAR_RESULT, 7
	goto_if 5, EventScript_1A77A9
	removeobject 2
	return

BirthIsland_Exterior_EventScript_165271:: @ 8165271
	lock
	faceplayer
	special sub_8110AB4
	compare_var_to_value VAR_RESULT, 2
	goto_if 1, EventScript_1A7AE0
	special sub_8112364
	special sub_80CCDFC
	waitstate
	copyvar VAR_0x8000, VAR_RESULT
	compare_var_to_value VAR_0x8000, 0
	goto_if 1, EventScript_1652BA
	compare_var_to_value VAR_0x8000, 1
	goto_if 1, EventScript_1652BC
	compare_var_to_value VAR_0x8000, 2
	goto_if 1, EventScript_1652C0
	compare_var_to_value VAR_0x8000, 3
	goto_if 1, EventScript_1652BE
	end

EventScript_1652BA:: @ 81652BA
	release
	end

EventScript_1652BC:: @ 81652BC
	release
	end

EventScript_1652BE:: @ 81652BE
	release
	end

EventScript_1652C0:: @ 81652C0
	addobject 2
	waitse
	setfieldeffectarg 0, 1
	setfieldeffectarg 1, 56
	setfieldeffectarg 2, 2
	dofieldeffect 68
	playbgm BGM_FRLG_DEOXYS_EYE, 0
	waitfieldeffect 68
	applymovement 2, Movement_165353
	waitmovement 0
	waitse
	playmoncry SPECIES_DEOXYS, 2
	delay 40
	waitmoncry
	setvar VAR_LAST_TALKED, 2
	setvar VAR_0x8004, SPECIES_DEOXYS
	setvar VAR_0x8005, 30
	setvar VAR_0x8006, 0
	special sub_8044838
	setflag FLAG_0x807
	special sub_807F9D8
	waitstate
	clearflag FLAG_0x807
	specialvar VAR_RESULT, sub_80CA74C
	compare_var_to_value VAR_RESULT, 1
	goto_if 1, EventScript_16533A
	compare_var_to_value VAR_RESULT, 4
	goto_if 1, EventScript_165348
	compare_var_to_value VAR_RESULT, 5
	goto_if 1, EventScript_165348
	setflag FLAG_0x2E4
	release
	end

EventScript_16533A:: @ 816533A
	setflag FLAG_0x2F7
	setvar VAR_0x8004, SPECIES_DEOXYS
	goto EventScript_1A9236
	end

EventScript_165348:: @ 8165348
	setvar VAR_0x8004, SPECIES_DEOXYS
	goto EventScript_1A9236
	end

Movement_165353:: @ 8165353
	step_down
	step_down
	step_down
	step_down
	step_down
	step_down
	step_down
	step_end
