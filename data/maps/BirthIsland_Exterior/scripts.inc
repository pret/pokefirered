.set LOCALID_DEOXYS_ROCK, 1
.set LOCALID_DEOXYS,      2

BirthIsland_Exterior_MapScripts::
	map_script MAP_SCRIPT_ON_TRANSITION, BirthIsland_Exterior_OnTransition
	map_script MAP_SCRIPT_ON_RESUME, BirthIsland_Exterior_OnResume
	map_script MAP_SCRIPT_ON_RETURN_TO_FIELD, BirthIsland_Exterior_OnReturnToField
	.byte 0

BirthIsland_Exterior_OnReturnToField::
	special SetDeoxysTrianglePalette
	end

BirthIsland_Exterior_OnTransition::
	setworldmapflag FLAG_WORLD_MAP_BIRTH_ISLAND_EXTERIOR
	setvar VAR_OBJ_GFX_ID_0, OBJ_EVENT_GFX_DEOXYS_N
	setvar VAR_DEOXYS_INTERACTION_STEP_COUNTER, 0
	setvar VAR_DEOXYS_INTERACTION_NUM, 0
	call_if_set FLAG_FOUGHT_DEOXYS, BirthIsland_Exterior_EventScript_HideDeoxysAndPuzzle
	call_if_unset FLAG_FOUGHT_DEOXYS, BirthIsland_Exterior_EventScript_TryShowDeoxysPuzzle
	end

BirthIsland_Exterior_EventScript_HideDeoxysAndPuzzle::
	setflag FLAG_HIDE_DEOXYS
	setflag FLAG_HIDE_BIRTH_ISLAND_METEORITE
	return

BirthIsland_Exterior_EventScript_TryShowDeoxysPuzzle::
	goto_if_set FLAG_DEOXYS_FLEW_AWAY, EventScript_Return
	clearflag FLAG_HIDE_BIRTH_ISLAND_METEORITE
	clearflag FLAG_SYS_DEOXYS_AWAKENED
	return

BirthIsland_Exterior_OnResume::
	call_if_set FLAG_SYS_SPECIAL_WILD_BATTLE, BirthIsland_Exterior_EventScript_TryRemoveDeoxys
	end

BirthIsland_Exterior_EventScript_TryRemoveDeoxys::
	specialvar VAR_RESULT, GetBattleOutcome
	goto_if_ne VAR_RESULT, B_OUTCOME_CAUGHT, EventScript_Return
	removeobject LOCALID_DEOXYS
	return

BirthIsland_Exterior_EventScript_Triangle::
	lock
	faceplayer
	goto_if_questlog EventScript_ReleaseEnd
	special QuestLog_CutRecording
	special DoDeoxysTriangleInteraction
	waitstate
	switch VAR_RESULT
	case 0, BirthIsland_Exterior_EventScript_NotSolved1
	case 1, BirthIsland_Exterior_EventScript_NotSolved2
	case 2, BirthIsland_Exterior_EventScript_Deoxys
	case 3, BirthIsland_Exterior_EventScript_NotSolved3
	end

BirthIsland_Exterior_EventScript_NotSolved1::
	release
	end

BirthIsland_Exterior_EventScript_NotSolved2::
	release
	end

BirthIsland_Exterior_EventScript_NotSolved3::
	release
	end

BirthIsland_Exterior_EventScript_Deoxys::
	addobject LOCALID_DEOXYS
	waitse
	setfieldeffectargument 0, LOCALID_DEOXYS_ROCK
	setfieldeffectargument 1, MAP_NUM(BIRTH_ISLAND_EXTERIOR)
	setfieldeffectargument 2, MAP_GROUP(BIRTH_ISLAND_EXTERIOR)
	dofieldeffect FLDEFF_DESTROY_DEOXYS_ROCK
	playbgm MUS_ENCOUNTER_DEOXYS, 0
	waitfieldeffect FLDEFF_DESTROY_DEOXYS_ROCK
	applymovement LOCALID_DEOXYS, Movement_DeoxysApproach
	waitmovement 0
	waitse
	playmoncry SPECIES_DEOXYS, CRY_MODE_ENCOUNTER
	delay 40
	waitmoncry
	setvar VAR_LAST_TALKED, LOCALID_DEOXYS
	seteventmon SPECIES_DEOXYS, 30
	setflag FLAG_SYS_SPECIAL_WILD_BATTLE
	special StartLegendaryBattle
	waitstate
	clearflag FLAG_SYS_SPECIAL_WILD_BATTLE
	specialvar VAR_RESULT, GetBattleOutcome
	goto_if_eq VAR_RESULT, B_OUTCOME_WON, BirthIsland_Exterior_EventScript_DefeatedDeoxys
	goto_if_eq VAR_RESULT, B_OUTCOME_RAN, BirthIsland_Exterior_EventScript_RanFromDeoxys
	goto_if_eq VAR_RESULT, B_OUTCOME_PLAYER_TELEPORTED, BirthIsland_Exterior_EventScript_RanFromDeoxys
	setflag FLAG_FOUGHT_DEOXYS
	release
	end

BirthIsland_Exterior_EventScript_DefeatedDeoxys::
	setflag FLAG_DEOXYS_FLEW_AWAY
	setvar VAR_0x8004, SPECIES_DEOXYS
	goto EventScript_MonFlewAway
	end

BirthIsland_Exterior_EventScript_RanFromDeoxys::
	setvar VAR_0x8004, SPECIES_DEOXYS
	goto EventScript_MonFlewAway
	end

Movement_DeoxysApproach:
	walk_slower_down
	walk_slower_down
	walk_slower_down
	walk_slower_down
	walk_slower_down
	walk_slower_down
	walk_slower_down
	step_end
