BirthIsland_Exterior_MapScripts:: @ 8165203
	map_script MAP_SCRIPT_ON_TRANSITION, BirthIsland_Exterior_OnTransition
	map_script MAP_SCRIPT_ON_RESUME, BirthIsland_Exterior_OnResume
	map_script MAP_SCRIPT_ON_RETURN_TO_FIELD, BirthIsland_Exterior_OnReturnToField
	.byte 0

BirthIsland_Exterior_OnReturnToField:: @ 8165213
	special Special_SetDeoxysTriangleObjectPal
	end

BirthIsland_Exterior_OnTransition:: @ 8165217
	setworldmapflag FLAG_WORLD_MAP_BIRTH_ISLAND_EXTERIOR
	setvar VAR_OBJ_GFX_ID_0, OBJECT_EVENT_GFX_DEOXYS_N
	setvar VAR_DEOXYS_INTERACTION_STEP_COUNTER, 0
	setvar VAR_DEOXYS_INTERACTION_NUM, 0
	call_if_set FLAG_FOUGHT_DEOXYS, EventScript_16523C
	call_if_unset FLAG_FOUGHT_DEOXYS, EventScript_165243
	end

EventScript_16523C:: @ 816523C
	setflag FLAG_HIDE_DEOXYS
	setflag FLAG_HIDE_BIRTH_ISLAND_METEORITE
	return

EventScript_165243:: @ 8165243
	goto_if_set FLAG_DEOXYS_FLEW_AWAY, EventScript_1A77A9
	clearflag FLAG_HIDE_BIRTH_ISLAND_METEORITE
	clearflag FLAG_SYS_DEOXYS_AWAKENED
	return

BirthIsland_Exterior_OnResume:: @ 8165253
	call_if_set FLAG_SYS_SPECIAL_WILD_BATTLE, EventScript_16525D
	end

EventScript_16525D:: @ 816525D
	specialvar VAR_RESULT, Special_GetBattleOutcome
	compare VAR_RESULT, B_OUTCOME_CAUGHT
	goto_if_ne EventScript_1A77A9
	removeobject 2
	return

BirthIsland_Exterior_EventScript_165271:: @ 8165271
	lock
	faceplayer
	special sub_8110AB4
	compare VAR_RESULT, 2
	goto_if_eq EventScript_1A7AE0
	special sub_8112364
	special Special_DeoxysSound
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
	compare VAR_RESULT, B_OUTCOME_WON
	goto_if_eq EventScript_16533A
	compare VAR_RESULT, B_OUTCOME_RAN
	goto_if_eq EventScript_165348
	compare VAR_RESULT, B_OUTCOME_PLAYER_TELEPORTED
	goto_if_eq EventScript_165348
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
	walk_slowest_down
	walk_slowest_down
	walk_slowest_down
	walk_slowest_down
	walk_slowest_down
	walk_slowest_down
	walk_slowest_down
	step_end
