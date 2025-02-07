# 1 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"

# 2 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"
.set LOCALID_BILL, 7
# 3 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"

# 4 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"
CinnabarIsland_PokemonCenter_1F_MapScripts::
# 5 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"
	map_script MAP_SCRIPT_ON_TRANSITION, CinnabarIsland_PokemonCenter_1F_OnTransition
# 6 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"
	map_script MAP_SCRIPT_ON_RESUME, CableClub_OnResume
# 7 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"
	.byte 0
# 8 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"

# 9 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"
CinnabarIsland_PokemonCenter_1F_OnTransition::
# 10 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"
	setrespawn SPAWN_CINNABAR_ISLAND
# 11 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"
	end
# 12 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"

# 13 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"
CinnabarIsland_PokemonCenter_1F_EventScript_Nurse::
# 14 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"
	lock
# 15 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"
	faceplayer
# 16 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"
	call EventScript_PkmnCenterNurse
# 17 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"
	release
# 18 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"
	end
# 19 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"

# 20 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"
CinnabarIsland_PokemonCenter_1F_EventScript_Gentleman::
# 21 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"
	msgbox CinnabarIsland_PokemonCenter_1F_Text_VisitUnionRoom, MSGBOX_NPC
# 22 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"
	end
# 23 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"

# 24 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"
CinnabarIsland_PokemonCenter_1F_EventScript_CooltrainerF::
# 25 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"
	msgbox CinnabarIsland_PokemonCenter_1F_Text_CinnabarGymLocked, MSGBOX_NPC
# 26 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"
	end
# 27 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"

# 28 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"
CinnabarIsland_PokemonCenter_1F_EventScript_Youngster::
# 29 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"
	msgbox CinnabarIsland_PokemonCenter_1F_Text_EvolutionCanWaitForNewMoves, MSGBOX_NPC
# 30 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"
	end
# 31 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"

# 32 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"
CinnabarIsland_PokemonCenter_1F_EventScript_Bill::
# 33 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"
	lock
# 34 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"
	faceplayer
# 35 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"
	msgbox CinnabarIsland_PokemonCenter_1F_Text_ReadyToSailToOneIsland, MSGBOX_YESNO
# 36 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"
	goto_if_eq VAR_RESULT, NO, CinnabarIsland_PokemonCenter_1F_EventScript_NotReadyToSail
# 37 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"
	msgbox CinnabarIsland_PokemonCenter_1F_Text_LetsGo
# 38 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"
	closemessage
# 39 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"
	playbgm MUS_FOLLOW_ME, 1
# 40 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"
	savebgm MUS_FOLLOW_ME
# 41 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"
	setflag FLAG_DONT_TRANSITION_MUSIC
# 42 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"
	setflag FLAG_HIDE_CINNABAR_POKECENTER_BILL
# 43 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"
	delay 20
# 44 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"
	call_if_eq VAR_FACING, DIR_SOUTH, CinnabarIsland_PokemonCenter_1F_EventScript_ExitWithBillSouth
# 45 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"
	call_if_eq VAR_FACING, DIR_EAST, CinnabarIsland_PokemonCenter_1F_EventScript_ExitWithBillEast
# 46 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"
	call_if_eq VAR_FACING, DIR_WEST, CinnabarIsland_PokemonCenter_1F_EventScript_ExitWithBillWest
# 47 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"
	removeobject LOCALID_BILL
# 48 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"
	setvar VAR_MAP_SCENE_CINNABAR_ISLAND_2, 1
# 49 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"
	clearflag FLAG_HIDE_CINNABAR_BILL
# 50 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"
	warp MAP_CINNABAR_ISLAND, 14, 11
# 51 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"
	waitstate
# 52 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"
	release
# 53 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"
	end
# 54 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"

# 55 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"
CinnabarIsland_PokemonCenter_1F_EventScript_ExitWithBillSouth::
# 56 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"
	applymovement LOCALID_BILL, CinnabarIsland_PokemonCenter_1F_Movement_BillExit
# 57 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, CinnabarIsland_PokemonCenter_1F_Movement_PlayerExitSouth
# 58 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"
	waitmovement 0
# 59 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"
	return
# 60 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"

# 61 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"
CinnabarIsland_PokemonCenter_1F_EventScript_ExitWithBillEast::
# 62 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"
	applymovement LOCALID_BILL, CinnabarIsland_PokemonCenter_1F_Movement_BillExitEast
# 63 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, CinnabarIsland_PokemonCenter_1F_Movement_PlayerExitEast
# 64 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"
	waitmovement 0
# 65 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"
	return
# 66 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"

# 67 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"
CinnabarIsland_PokemonCenter_1F_EventScript_ExitWithBillWest::
# 68 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"
	applymovement LOCALID_BILL, CinnabarIsland_PokemonCenter_1F_Movement_BillExit
# 69 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, CinnabarIsland_PokemonCenter_1F_Movement_PlayerExitWest
# 70 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"
	waitmovement 0
# 71 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"
	return
# 72 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"

# 73 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"
CinnabarIsland_PokemonCenter_1F_EventScript_NotReadyToSail::
# 74 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"
	msgbox CinnabarIsland_PokemonCenter_1F_Text_OhNotDoneYet
# 75 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"
	release
# 76 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"
	end
# 77 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"

# 78 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"
CinnabarIsland_PokemonCenter_1F_Movement_BillExit::
# 79 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"
	walk_left
# 80 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"
	walk_left
# 81 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"
	walk_left
# 82 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"
	walk_left
# 83 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"
	walk_down
# 84 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"
	walk_down
# 85 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"
	walk_down
# 86 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"
	delay_8
# 87 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"
	set_invisible
# 88 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"
	step_end
# 89 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"

# 90 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"
CinnabarIsland_PokemonCenter_1F_Movement_PlayerExitSouth::
# 91 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"
	walk_down
# 92 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"
	walk_left
# 93 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"
	walk_left
# 94 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"
	walk_left
# 95 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"
	walk_left
# 96 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"
	walk_down
# 97 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"
	walk_down
# 98 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"
	delay_16
# 99 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"
	walk_down
# 100 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"
	step_end
# 101 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"

# 102 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"
CinnabarIsland_PokemonCenter_1F_Movement_BillExitEast::
# 103 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"
	walk_up
# 104 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"
	walk_left
# 105 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"
	walk_left
# 106 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"
	walk_down
# 107 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"
	walk_left
# 108 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"
	walk_left
# 109 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"
	walk_down
# 110 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"
	walk_down
# 111 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"
	walk_down
# 112 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"
	delay_8
# 113 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"
	set_invisible
# 114 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"
	step_end
# 115 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"

# 116 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"
CinnabarIsland_PokemonCenter_1F_Movement_PlayerExitEast::
# 117 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"
	delay_16
# 118 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"
	delay_16
# 119 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"
	delay_16
# 120 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"
	face_left
# 121 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"
	delay_16
# 122 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"
	walk_left
# 123 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"
	walk_left
# 124 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"
	walk_left
# 125 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"
	walk_down
# 126 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"
	walk_down
# 127 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"
	delay_8
# 128 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"
	walk_down
# 129 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"
	delay_8
# 130 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"
	set_invisible
# 131 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"
	step_end
# 132 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"

# 133 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"
CinnabarIsland_PokemonCenter_1F_Movement_PlayerExitWest::
# 134 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"
	walk_left
# 135 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"
	walk_left
# 136 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"
	walk_left
# 137 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"
	walk_left
# 138 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"
	walk_left
# 139 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"
	walk_down
# 140 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"
	walk_down
# 141 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"
	delay_16
# 142 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"
	walk_down
# 143 "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.pory"
	step_end
