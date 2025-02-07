# 1 "data/maps/PokemonLeague_LancesRoom/scripts.pory"

# 2 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
.set LOCALID_LANCE, 1
# 3 "data/maps/PokemonLeague_LancesRoom/scripts.pory"

# 4 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
PokemonLeague_LancesRoom_MapScripts::
# 5 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
	map_script MAP_SCRIPT_ON_RESUME, PokemonLeague_LancesRoom_OnResume
# 6 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
	map_script MAP_SCRIPT_ON_LOAD, PokemonLeague_LancesRoom_OnLoad
# 7 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
	map_script MAP_SCRIPT_ON_WARP_INTO_MAP_TABLE, PokemonLeague_LancesRoom_OnWarp
# 8 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
	map_script MAP_SCRIPT_ON_FRAME_TABLE, PokemonLeague_LancesRoom_OnFrame
# 9 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
	.byte 0
# 10 "data/maps/PokemonLeague_LancesRoom/scripts.pory"

# 11 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
PokemonLeague_LancesRoom_OnResume::
# 12 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
	setvar VAR_0x8004, 3
# 13 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
	call PokemonLeague_EventScript_DoLightingEffect
# 14 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
	end
# 15 "data/maps/PokemonLeague_LancesRoom/scripts.pory"

# 16 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
PokemonLeague_LancesRoom_OnLoad::
# 17 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
	call_if_eq VAR_MAP_SCENE_POKEMON_LEAGUE, 4, PokemonLeague_LancesRoom_EventScript_CloseEntry
# 18 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
	call_if_set FLAG_DEFEATED_LANCE, PokemonLeague_LancesRoom_EventScript_SetDoorOpen
# 19 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
	end
# 20 "data/maps/PokemonLeague_LancesRoom/scripts.pory"

# 21 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
PokemonLeague_LancesRoom_EventScript_CloseEntry::
# 22 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
	call PokemonLeague_LancesRoom_EventScript_SetEntryClosed
# 23 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
	return
# 24 "data/maps/PokemonLeague_LancesRoom/scripts.pory"

# 25 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
PokemonLeague_LancesRoom_EventScript_SetDoorOpen::
# 26 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
	call PokemonLeague_EventScript_SetDoorOpenLance
# 27 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
	return
# 28 "data/maps/PokemonLeague_LancesRoom/scripts.pory"

# 29 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
PokemonLeague_LancesRoom_OnWarp::
# 30 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
	map_script_2 VAR_TEMP_1, 0, PokemonLeague_LancesRoom_EventScript_TurnPlayerNorth
# 31 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
	.2byte 0
# 32 "data/maps/PokemonLeague_LancesRoom/scripts.pory"

# 33 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
PokemonLeague_LancesRoom_EventScript_TurnPlayerNorth::
# 34 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
	turnobject OBJ_EVENT_ID_PLAYER, DIR_NORTH
# 35 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
	end
# 36 "data/maps/PokemonLeague_LancesRoom/scripts.pory"

# 37 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
PokemonLeague_LancesRoom_OnFrame::
# 38 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
	map_script_2 VAR_MAP_SCENE_POKEMON_LEAGUE, 3, PokemonLeague_LancesRoom_EventScript_EnterRoom
# 39 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
	.2byte 0
# 40 "data/maps/PokemonLeague_LancesRoom/scripts.pory"

# 41 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
PokemonLeague_LancesRoom_EventScript_EnterRoom::
# 42 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
	lockall
# 43 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, PokemonLeague_LancesRoom_Movement_WalkThroughCorridor
# 44 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
	waitmovement 0
# 45 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
	setflag FLAG_TEMP_2
# 46 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
	call PokemonLeague_LancesRoom_EventScript_SetEntryClosed
# 47 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
	playse SE_UNLOCK
# 48 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
	special DrawWholeMapView
# 49 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
	waitse
# 50 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
	setvar VAR_MAP_SCENE_POKEMON_LEAGUE, 4
# 51 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
	releaseall
# 52 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
	end
# 53 "data/maps/PokemonLeague_LancesRoom/scripts.pory"

# 54 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
PokemonLeague_LancesRoom_EventScript_SetEntryClosed::
# 55 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
	setmetatile 5, 14, METATILE_PokemonLeague_Entry_TopLeft_Closed, 1
# 56 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
	setmetatile 6, 14, METATILE_PokemonLeague_Entry_TopMid_Closed, 1
# 57 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
	setmetatile 7, 14, METATILE_PokemonLeague_Entry_TopRight_Closed, 1
# 58 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
	setmetatile 5, 15, METATILE_PokemonLeague_Entry_BottomLeft_Closed, 1
# 59 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
	setmetatile 6, 15, METATILE_PokemonLeague_Entry_BottomMid_Closed, 1
# 60 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
	setmetatile 7, 15, METATILE_PokemonLeague_Entry_BottomRight_Closed, 1
# 61 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
	setmetatile 6, 16, METATILE_PokemonLeague_Floor_ShadeFull_Lance, 0
# 62 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
	setmetatile 7, 16, METATILE_PokemonLeague_Floor_ShadeFull_Lance, 0
# 63 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
	return
# 64 "data/maps/PokemonLeague_LancesRoom/scripts.pory"

# 65 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
PokemonLeague_LancesRoom_Movement_WalkThroughCorridor::
# 66 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
	walk_up
# 67 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
	walk_up
# 68 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
	walk_left
# 69 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
	walk_left
# 70 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
	walk_left
# 71 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
	walk_left
# 72 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
	walk_left
# 73 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
	walk_left
# 74 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
	walk_down
# 75 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
	walk_down
# 76 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
	walk_down
# 77 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
	walk_down
# 78 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
	walk_down
# 79 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
	walk_down
# 80 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
	walk_down
# 81 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
	walk_left
# 82 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
	walk_left
# 83 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
	walk_left
# 84 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
	walk_left
# 85 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
	walk_left
# 86 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
	walk_left
# 87 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
	walk_left
# 88 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
	walk_left
# 89 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
	walk_left
# 90 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
	walk_left
# 91 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
	walk_left
# 92 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
	walk_up
# 93 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
	walk_up
# 94 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
	walk_up
# 95 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
	walk_up
# 96 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
	walk_up
# 97 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
	walk_up
# 98 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
	walk_up
# 99 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
	walk_up
# 100 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
	step_end
# 101 "data/maps/PokemonLeague_LancesRoom/scripts.pory"

# 102 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
PokemonLeague_LancesRoom_EventScript_Lance::
# 103 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
	lock
# 104 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
	faceplayer
# 105 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
	famechecker FAMECHECKER_LANCE, FCPICKSTATE_COLORED, UpdatePickStateFromSpecialVar8005
# 106 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
	goto_if_set FLAG_DEFEATED_LANCE, PokemonLeague_LancesRoom_EventScript_PostBattle
# 107 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
	famechecker FAMECHECKER_LANCE, 0
# 108 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
	famechecker FAMECHECKER_LANCE, 1
# 109 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
	call_if_unset FLAG_SYS_GAME_CLEAR, PokemonLeague_LancesRoom_EventScript_Intro
# 110 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
	call_if_set FLAG_SYS_GAME_CLEAR, PokemonLeague_LancesRoom_EventScript_RematchIntro
# 111 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
	setflag FLAG_TEMP_3
# 112 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
	setflag FLAG_TEMP_5
# 113 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
	call_if_unset FLAG_SYS_CAN_LINK_WITH_RS, PokemonLeague_LancesRoom_EventScript_Battle
# 114 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
	call_if_set FLAG_SYS_CAN_LINK_WITH_RS, PokemonLeague_LancesRoom_EventScript_Rematch
# 115 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
	clearflag FLAG_TEMP_5
# 116 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
	goto PokemonLeague_LancesRoom_EventScript_DefeatedLance
# 117 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
	end
# 118 "data/maps/PokemonLeague_LancesRoom/scripts.pory"

# 119 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
PokemonLeague_LancesRoom_EventScript_Intro::
# 120 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
	msgbox PokemonLeague_LancesRoom_Text_Intro
# 121 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
	return
# 122 "data/maps/PokemonLeague_LancesRoom/scripts.pory"

# 123 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
PokemonLeague_LancesRoom_EventScript_RematchIntro::
# 124 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
	msgbox PokemonLeague_LancesRoom_Text_RematchIntro
# 125 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
	return
# 126 "data/maps/PokemonLeague_LancesRoom/scripts.pory"

# 127 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
PokemonLeague_LancesRoom_EventScript_Battle::
# 128 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
	trainerbattle_no_intro TRAINER_ELITE_FOUR_LANCE, PokemonLeague_LancesRoom_Text_Defeat
# 129 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
	return
# 130 "data/maps/PokemonLeague_LancesRoom/scripts.pory"

# 131 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
PokemonLeague_LancesRoom_EventScript_Rematch::
# 132 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
	trainerbattle_no_intro TRAINER_ELITE_FOUR_LANCE_2, PokemonLeague_LancesRoom_Text_Defeat
# 133 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
	return
# 134 "data/maps/PokemonLeague_LancesRoom/scripts.pory"

# 135 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
PokemonLeague_LancesRoom_EventScript_PostBattle::
# 136 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
	msgbox PokemonLeague_LancesRoom_Text_PostBattle
# 137 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
	release
# 138 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
	end
# 139 "data/maps/PokemonLeague_LancesRoom/scripts.pory"

# 140 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
PokemonLeague_LancesRoom_EventScript_DefeatedLance::
# 141 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
	setvar VAR_0x8004, 0
# 142 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
	special Script_TryGainNewFanFromCounter
# 143 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
	setflag FLAG_DEFEATED_LANCE
# 144 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
	call PokemonLeague_EventScript_OpenDoorLance
# 145 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
	msgbox PokemonLeague_LancesRoom_Text_PostBattle
# 146 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
	closemessage
# 147 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
	release
# 148 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
	end
# 149 "data/maps/PokemonLeague_LancesRoom/scripts.pory"

# 150 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
PokemonLeague_LancesRoom_EventScript_LanceMoveOutOfWayLeft::
# 151 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
	applymovement LOCALID_LANCE, PokemonLeague_LancesRoom_Movement_LanceMoveOutOfWayLeft
# 152 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
	waitmovement 0
# 153 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
	return
# 154 "data/maps/PokemonLeague_LancesRoom/scripts.pory"

# 155 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
PokemonLeague_LancesRoom_EventScript_LanceMoveOutOfWayRight::
# 156 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
	applymovement LOCALID_LANCE, PokemonLeague_LancesRoom_Movement_LanceMoveOutOfWayRight
# 157 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
	waitmovement 0
# 158 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
	return
# 159 "data/maps/PokemonLeague_LancesRoom/scripts.pory"

# 160 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
PokemonLeague_LancesRoom_Movement_LanceMoveOutOfWayLeft::
# 161 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
	walk_left
# 162 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
	walk_in_place_faster_right
# 163 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
	step_end
# 164 "data/maps/PokemonLeague_LancesRoom/scripts.pory"

# 165 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
PokemonLeague_LancesRoom_Movement_LanceMoveOutOfWayRight::
# 166 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
	walk_right
# 167 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
	walk_in_place_faster_left
# 168 "data/maps/PokemonLeague_LancesRoom/scripts.pory"
	step_end
