# 1 "data/maps/BirthIsland_Exterior/scripts.pory"

# 2 "data/maps/BirthIsland_Exterior/scripts.pory"
.set LOCALID_DEOXYS_ROCK, 1
# 3 "data/maps/BirthIsland_Exterior/scripts.pory"
.set LOCALID_DEOXYS,      2
# 4 "data/maps/BirthIsland_Exterior/scripts.pory"

# 5 "data/maps/BirthIsland_Exterior/scripts.pory"
BirthIsland_Exterior_MapScripts::
# 6 "data/maps/BirthIsland_Exterior/scripts.pory"
	map_script MAP_SCRIPT_ON_TRANSITION, BirthIsland_Exterior_OnTransition
# 7 "data/maps/BirthIsland_Exterior/scripts.pory"
	map_script MAP_SCRIPT_ON_RESUME, BirthIsland_Exterior_OnResume
# 8 "data/maps/BirthIsland_Exterior/scripts.pory"
	map_script MAP_SCRIPT_ON_RETURN_TO_FIELD, BirthIsland_Exterior_OnReturnToField
# 9 "data/maps/BirthIsland_Exterior/scripts.pory"
	.byte 0
# 10 "data/maps/BirthIsland_Exterior/scripts.pory"

# 11 "data/maps/BirthIsland_Exterior/scripts.pory"
BirthIsland_Exterior_OnReturnToField::
# 12 "data/maps/BirthIsland_Exterior/scripts.pory"
	special SetDeoxysTrianglePalette
# 13 "data/maps/BirthIsland_Exterior/scripts.pory"
	end
# 14 "data/maps/BirthIsland_Exterior/scripts.pory"

# 15 "data/maps/BirthIsland_Exterior/scripts.pory"
BirthIsland_Exterior_OnTransition::
# 16 "data/maps/BirthIsland_Exterior/scripts.pory"
	setworldmapflag FLAG_WORLD_MAP_BIRTH_ISLAND_EXTERIOR
# 17 "data/maps/BirthIsland_Exterior/scripts.pory"
	setvar VAR_OBJ_GFX_ID_0, OBJ_EVENT_GFX_DEOXYS_N
# 18 "data/maps/BirthIsland_Exterior/scripts.pory"
	setvar VAR_DEOXYS_INTERACTION_STEP_COUNTER, 0
# 19 "data/maps/BirthIsland_Exterior/scripts.pory"
	setvar VAR_DEOXYS_INTERACTION_NUM, 0
# 20 "data/maps/BirthIsland_Exterior/scripts.pory"
	call_if_set FLAG_FOUGHT_DEOXYS, BirthIsland_Exterior_EventScript_HideDeoxysAndPuzzle
# 21 "data/maps/BirthIsland_Exterior/scripts.pory"
	call_if_unset FLAG_FOUGHT_DEOXYS, BirthIsland_Exterior_EventScript_TryShowDeoxysPuzzle
# 22 "data/maps/BirthIsland_Exterior/scripts.pory"
	end
# 23 "data/maps/BirthIsland_Exterior/scripts.pory"

# 24 "data/maps/BirthIsland_Exterior/scripts.pory"
BirthIsland_Exterior_EventScript_HideDeoxysAndPuzzle::
# 25 "data/maps/BirthIsland_Exterior/scripts.pory"
	setflag FLAG_HIDE_DEOXYS
# 26 "data/maps/BirthIsland_Exterior/scripts.pory"
	setflag FLAG_HIDE_BIRTH_ISLAND_METEORITE
# 27 "data/maps/BirthIsland_Exterior/scripts.pory"
	return
# 28 "data/maps/BirthIsland_Exterior/scripts.pory"

# 29 "data/maps/BirthIsland_Exterior/scripts.pory"
BirthIsland_Exterior_EventScript_TryShowDeoxysPuzzle::
# 30 "data/maps/BirthIsland_Exterior/scripts.pory"
	goto_if_set FLAG_DEOXYS_FLEW_AWAY, EventScript_Return
# 31 "data/maps/BirthIsland_Exterior/scripts.pory"
	clearflag FLAG_HIDE_BIRTH_ISLAND_METEORITE
# 32 "data/maps/BirthIsland_Exterior/scripts.pory"
	clearflag FLAG_SYS_DEOXYS_AWAKENED
# 33 "data/maps/BirthIsland_Exterior/scripts.pory"
	return
# 34 "data/maps/BirthIsland_Exterior/scripts.pory"

# 35 "data/maps/BirthIsland_Exterior/scripts.pory"
BirthIsland_Exterior_OnResume::
# 36 "data/maps/BirthIsland_Exterior/scripts.pory"
	call_if_set FLAG_SYS_SPECIAL_WILD_BATTLE, BirthIsland_Exterior_EventScript_TryRemoveDeoxys
# 37 "data/maps/BirthIsland_Exterior/scripts.pory"
	end
# 38 "data/maps/BirthIsland_Exterior/scripts.pory"

# 39 "data/maps/BirthIsland_Exterior/scripts.pory"
BirthIsland_Exterior_EventScript_TryRemoveDeoxys::
# 40 "data/maps/BirthIsland_Exterior/scripts.pory"
	specialvar VAR_RESULT, GetBattleOutcome
# 41 "data/maps/BirthIsland_Exterior/scripts.pory"
	goto_if_ne VAR_RESULT, B_OUTCOME_CAUGHT, EventScript_Return
# 42 "data/maps/BirthIsland_Exterior/scripts.pory"
	removeobject LOCALID_DEOXYS
# 43 "data/maps/BirthIsland_Exterior/scripts.pory"
	return
# 44 "data/maps/BirthIsland_Exterior/scripts.pory"

# 45 "data/maps/BirthIsland_Exterior/scripts.pory"
BirthIsland_Exterior_EventScript_Triangle::
# 46 "data/maps/BirthIsland_Exterior/scripts.pory"
	lock
# 47 "data/maps/BirthIsland_Exterior/scripts.pory"
	faceplayer
# 48 "data/maps/BirthIsland_Exterior/scripts.pory"
	goto_if_questlog EventScript_ReleaseEnd
# 49 "data/maps/BirthIsland_Exterior/scripts.pory"
	special QuestLog_CutRecording
# 50 "data/maps/BirthIsland_Exterior/scripts.pory"
	special DoDeoxysTriangleInteraction
# 51 "data/maps/BirthIsland_Exterior/scripts.pory"
	waitstate
# 52 "data/maps/BirthIsland_Exterior/scripts.pory"
	switch VAR_RESULT
# 53 "data/maps/BirthIsland_Exterior/scripts.pory"
	case 0, BirthIsland_Exterior_EventScript_NotSolved1
# 54 "data/maps/BirthIsland_Exterior/scripts.pory"
	case 1, BirthIsland_Exterior_EventScript_NotSolved2
# 55 "data/maps/BirthIsland_Exterior/scripts.pory"
	case 2, BirthIsland_Exterior_EventScript_Deoxys
# 56 "data/maps/BirthIsland_Exterior/scripts.pory"
	case 3, BirthIsland_Exterior_EventScript_NotSolved3
# 57 "data/maps/BirthIsland_Exterior/scripts.pory"
	end
# 58 "data/maps/BirthIsland_Exterior/scripts.pory"

# 59 "data/maps/BirthIsland_Exterior/scripts.pory"
BirthIsland_Exterior_EventScript_NotSolved1::
# 60 "data/maps/BirthIsland_Exterior/scripts.pory"
	release
# 61 "data/maps/BirthIsland_Exterior/scripts.pory"
	end
# 62 "data/maps/BirthIsland_Exterior/scripts.pory"

# 63 "data/maps/BirthIsland_Exterior/scripts.pory"
BirthIsland_Exterior_EventScript_NotSolved2::
# 64 "data/maps/BirthIsland_Exterior/scripts.pory"
	release
# 65 "data/maps/BirthIsland_Exterior/scripts.pory"
	end
# 66 "data/maps/BirthIsland_Exterior/scripts.pory"

# 67 "data/maps/BirthIsland_Exterior/scripts.pory"
BirthIsland_Exterior_EventScript_NotSolved3::
# 68 "data/maps/BirthIsland_Exterior/scripts.pory"
	release
# 69 "data/maps/BirthIsland_Exterior/scripts.pory"
	end
# 70 "data/maps/BirthIsland_Exterior/scripts.pory"

# 71 "data/maps/BirthIsland_Exterior/scripts.pory"
BirthIsland_Exterior_EventScript_Deoxys::
# 72 "data/maps/BirthIsland_Exterior/scripts.pory"
	addobject LOCALID_DEOXYS
# 73 "data/maps/BirthIsland_Exterior/scripts.pory"
	waitse
# 74 "data/maps/BirthIsland_Exterior/scripts.pory"
	setfieldeffectargument 0, LOCALID_DEOXYS_ROCK
# 75 "data/maps/BirthIsland_Exterior/scripts.pory"
	setfieldeffectargument 1, MAP_NUM(BIRTH_ISLAND_EXTERIOR)
# 76 "data/maps/BirthIsland_Exterior/scripts.pory"
	setfieldeffectargument 2, MAP_GROUP(BIRTH_ISLAND_EXTERIOR)
# 77 "data/maps/BirthIsland_Exterior/scripts.pory"
	dofieldeffect FLDEFF_DESTROY_DEOXYS_ROCK
# 78 "data/maps/BirthIsland_Exterior/scripts.pory"
	playbgm MUS_ENCOUNTER_DEOXYS, 0
# 79 "data/maps/BirthIsland_Exterior/scripts.pory"
	waitfieldeffect FLDEFF_DESTROY_DEOXYS_ROCK
# 80 "data/maps/BirthIsland_Exterior/scripts.pory"
	applymovement LOCALID_DEOXYS, Movement_DeoxysApproach
# 81 "data/maps/BirthIsland_Exterior/scripts.pory"
	waitmovement 0
# 82 "data/maps/BirthIsland_Exterior/scripts.pory"
	waitse
# 83 "data/maps/BirthIsland_Exterior/scripts.pory"
	playmoncry SPECIES_DEOXYS, CRY_MODE_ENCOUNTER
# 84 "data/maps/BirthIsland_Exterior/scripts.pory"
	delay 40
# 85 "data/maps/BirthIsland_Exterior/scripts.pory"
	waitmoncry
# 86 "data/maps/BirthIsland_Exterior/scripts.pory"
	setvar VAR_LAST_TALKED, LOCALID_DEOXYS
# 87 "data/maps/BirthIsland_Exterior/scripts.pory"
	seteventmon SPECIES_DEOXYS, 30
# 88 "data/maps/BirthIsland_Exterior/scripts.pory"
	setflag FLAG_SYS_SPECIAL_WILD_BATTLE
# 89 "data/maps/BirthIsland_Exterior/scripts.pory"
	special StartLegendaryBattle
# 90 "data/maps/BirthIsland_Exterior/scripts.pory"
	waitstate
# 91 "data/maps/BirthIsland_Exterior/scripts.pory"
	clearflag FLAG_SYS_SPECIAL_WILD_BATTLE
# 92 "data/maps/BirthIsland_Exterior/scripts.pory"
	specialvar VAR_RESULT, GetBattleOutcome
# 93 "data/maps/BirthIsland_Exterior/scripts.pory"
	goto_if_eq VAR_RESULT, B_OUTCOME_WON, BirthIsland_Exterior_EventScript_DefeatedDeoxys
# 94 "data/maps/BirthIsland_Exterior/scripts.pory"
	goto_if_eq VAR_RESULT, B_OUTCOME_RAN, BirthIsland_Exterior_EventScript_RanFromDeoxys
# 95 "data/maps/BirthIsland_Exterior/scripts.pory"
	goto_if_eq VAR_RESULT, B_OUTCOME_PLAYER_TELEPORTED, BirthIsland_Exterior_EventScript_RanFromDeoxys
# 96 "data/maps/BirthIsland_Exterior/scripts.pory"
	setflag FLAG_FOUGHT_DEOXYS
# 97 "data/maps/BirthIsland_Exterior/scripts.pory"
	release
# 98 "data/maps/BirthIsland_Exterior/scripts.pory"
	end
# 99 "data/maps/BirthIsland_Exterior/scripts.pory"

# 100 "data/maps/BirthIsland_Exterior/scripts.pory"
BirthIsland_Exterior_EventScript_DefeatedDeoxys::
# 101 "data/maps/BirthIsland_Exterior/scripts.pory"
	setflag FLAG_DEOXYS_FLEW_AWAY
# 102 "data/maps/BirthIsland_Exterior/scripts.pory"
	setvar VAR_0x8004, SPECIES_DEOXYS
# 103 "data/maps/BirthIsland_Exterior/scripts.pory"
	goto EventScript_MonFlewAway
# 104 "data/maps/BirthIsland_Exterior/scripts.pory"
	end
# 105 "data/maps/BirthIsland_Exterior/scripts.pory"

# 106 "data/maps/BirthIsland_Exterior/scripts.pory"
BirthIsland_Exterior_EventScript_RanFromDeoxys::
# 107 "data/maps/BirthIsland_Exterior/scripts.pory"
	setvar VAR_0x8004, SPECIES_DEOXYS
# 108 "data/maps/BirthIsland_Exterior/scripts.pory"
	goto EventScript_MonFlewAway
# 109 "data/maps/BirthIsland_Exterior/scripts.pory"
	end
# 110 "data/maps/BirthIsland_Exterior/scripts.pory"

# 111 "data/maps/BirthIsland_Exterior/scripts.pory"
Movement_DeoxysApproach:
# 112 "data/maps/BirthIsland_Exterior/scripts.pory"
	walk_slower_down
# 113 "data/maps/BirthIsland_Exterior/scripts.pory"
	walk_slower_down
# 114 "data/maps/BirthIsland_Exterior/scripts.pory"
	walk_slower_down
# 115 "data/maps/BirthIsland_Exterior/scripts.pory"
	walk_slower_down
# 116 "data/maps/BirthIsland_Exterior/scripts.pory"
	walk_slower_down
# 117 "data/maps/BirthIsland_Exterior/scripts.pory"
	walk_slower_down
# 118 "data/maps/BirthIsland_Exterior/scripts.pory"
	walk_slower_down
# 119 "data/maps/BirthIsland_Exterior/scripts.pory"
	step_end
