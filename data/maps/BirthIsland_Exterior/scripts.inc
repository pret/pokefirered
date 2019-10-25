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
	setvar VAR_OBJ_GFX_ID_0, MAP_OBJ_GFX_DEOXYS_N
	setvar VAR_DEOXYS_INTERACTION_STEP_COUNTER, 0
	setvar VAR_DEOXYS_INTERACTION_NUM, 0
	checkflag FLAG_FOUGHT_DEOXYS
	call_if TRUE, EventScript_16523C
	checkflag FLAG_FOUGHT_DEOXYS
	call_if FALSE, EventScript_165243
	end

EventScript_16523C:: @ 816523C
	setflag FLAG_HIDE_DEOXYS
	setflag FLAG_HIDE_BIRTH_ISLAND_METEORITE
	return

EventScript_165243:: @ 8165243
	checkflag FLAG_DEOXYS_FLEW_AWAY
	goto_if TRUE, EventScript_1A77A9
	clearflag FLAG_HIDE_BIRTH_ISLAND_METEORITE
	clearflag FLAG_SYS_DEOXYS_AWAKENED
	return

BirthIsland_Exterior_MapScript2_165253:: @ 8165253
	checkflag FLAG_SYS_SPECIAL_WILD_BATTLE
	call_if TRUE, EventScript_16525D
	end

EventScript_16525D:: @ 816525D
	specialvar VAR_RESULT, Special_GetBattleOutcome
	compare_var_to_value VAR_RESULT, B_OUTCOME_CAUGHT
	goto_if ne, EventScript_1A77A9
	removeobject 2
	return

BirthIsland_Exterior_EventScript_165271:: @ 8165271
	lock
	faceplayer
	special sub_8110AB4
	compare_var_to_value VAR_RESULT, 2
	goto_if eq, EventScript_1A7AE0
	special sub_8112364
	special sub_80CCDFC
	waitstate
	switch VAR_RESULT
	case 0, EventScript_1652BA
	case 1, EventScript_1652BC
	case 2, EventScript_1652C0
	case 3, EventScript_1652BE
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
	playbgm MUS_DEOEYE, 0
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
	special CreateObedientEnemyMon
	setflag FLAG_SYS_SPECIAL_WILD_BATTLE
	special Special_StartLegendaryBattle
	waitstate
	clearflag FLAG_SYS_SPECIAL_WILD_BATTLE
	specialvar VAR_RESULT, Special_GetBattleOutcome
	compare_var_to_value VAR_RESULT, B_OUTCOME_WON
	goto_if eq, EventScript_16533A
	compare_var_to_value VAR_RESULT, B_OUTCOME_RAN
	goto_if eq, EventScript_165348
	compare_var_to_value VAR_RESULT, B_OUTCOME_PLAYER_TELEPORTED
	goto_if eq, EventScript_165348
	setflag FLAG_FOUGHT_DEOXYS
	release
	end

EventScript_16533A:: @ 816533A
	setflag FLAG_DEOXYS_FLEW_AWAY
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
