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
	call_if_set FLAG_FOUGHT_DEOXYS, BirthIsland_Exterior_EventScript_HideDeoxysAndPuzzle
	call_if_unset FLAG_FOUGHT_DEOXYS, BirthIsland_Exterior_EventScript_TryShowDeoxysPuzzle
	end

BirthIsland_Exterior_EventScript_HideDeoxysAndPuzzle:: @ 816523C
	setflag FLAG_HIDE_DEOXYS
	setflag FLAG_HIDE_BIRTH_ISLAND_METEORITE
	return

BirthIsland_Exterior_EventScript_TryShowDeoxysPuzzle:: @ 8165243
	goto_if_set FLAG_DEOXYS_FLEW_AWAY, EventScript_Return
	clearflag FLAG_HIDE_BIRTH_ISLAND_METEORITE
	clearflag FLAG_SYS_DEOXYS_AWAKENED
	return

BirthIsland_Exterior_OnResume:: @ 8165253
	call_if_set FLAG_SYS_SPECIAL_WILD_BATTLE, BirthIsland_Exterior_EventScript_TryRemoveDeoxys
	end

BirthIsland_Exterior_EventScript_TryRemoveDeoxys:: @ 816525D
	specialvar VAR_RESULT, Special_GetBattleOutcome
	compare VAR_RESULT, B_OUTCOME_CAUGHT
	goto_if_ne EventScript_Return
	removeobject 2
	return

BirthIsland_Exterior_EventScript_Triangle:: @ 8165271
	lock
	faceplayer
	goto_if_questlog EventScript_ReleaseEnd
	special sub_8112364
	special DoDeoxysRockInteraction
	waitstate
	switch VAR_RESULT
	case 0, BirthIsland_Exterior_EventScript_NotSolved1
	case 1, BirthIsland_Exterior_EventScript_NotSolved2
	case 2, BirthIsland_Exterior_EventScript_Deoxys
	case 3, BirthIsland_Exterior_EventScript_NotSolved3
	end

BirthIsland_Exterior_EventScript_NotSolved1:: @ 81652BA
	release
	end

BirthIsland_Exterior_EventScript_NotSolved2:: @ 81652BC
	release
	end

BirthIsland_Exterior_EventScript_NotSolved3:: @ 81652BE
	release
	end

BirthIsland_Exterior_EventScript_Deoxys:: @ 81652C0
	addobject 2
	waitse
	setfieldeffectarg 0, 1
	setfieldeffectarg 1, 56
	setfieldeffectarg 2, 2
	dofieldeffect 68
	playbgm MUS_DEOEYE, 0
	waitfieldeffect 68
	applymovement 2, Movement_DeoxysApproach
	waitmovement 0
	waitse
	playmoncry SPECIES_DEOXYS, 2
	delay 40
	waitmoncry
	setvar VAR_LAST_TALKED, 2
	setvar VAR_0x8004, SPECIES_DEOXYS
	setvar VAR_0x8005, 30  @ Level
	setvar VAR_0x8006, ITEM_NONE
	special CreateObedientEnemyMon
	setflag FLAG_SYS_SPECIAL_WILD_BATTLE
	special Special_StartLegendaryBattle
	waitstate
	clearflag FLAG_SYS_SPECIAL_WILD_BATTLE
	specialvar VAR_RESULT, Special_GetBattleOutcome
	compare VAR_RESULT, B_OUTCOME_WON
	goto_if_eq BirthIsland_Exterior_EventScript_DefeatedDeoxys
	compare VAR_RESULT, B_OUTCOME_RAN
	goto_if_eq BirthIsland_Exterior_EventScript_RanFromDeoxys
	compare VAR_RESULT, B_OUTCOME_PLAYER_TELEPORTED
	goto_if_eq BirthIsland_Exterior_EventScript_RanFromDeoxys
	setflag FLAG_FOUGHT_DEOXYS
	release
	end

BirthIsland_Exterior_EventScript_DefeatedDeoxys:: @ 816533A
	setflag FLAG_DEOXYS_FLEW_AWAY
	setvar VAR_0x8004, SPECIES_DEOXYS
	goto EventScript_MonFlewAway
	end

BirthIsland_Exterior_EventScript_RanFromDeoxys:: @ 8165348
	setvar VAR_0x8004, SPECIES_DEOXYS
	goto EventScript_MonFlewAway
	end

Movement_DeoxysApproach: @ 8165353
	walk_slowest_down
	walk_slowest_down
	walk_slowest_down
	walk_slowest_down
	walk_slowest_down
	walk_slowest_down
	walk_slowest_down
	step_end
