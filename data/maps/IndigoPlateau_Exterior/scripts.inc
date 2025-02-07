# 1 "data/maps/IndigoPlateau_Exterior/scripts.pory"

# 2 "data/maps/IndigoPlateau_Exterior/scripts.pory"
.equ LOCALID_RIVAL,    1
# 3 "data/maps/IndigoPlateau_Exterior/scripts.pory"
.equ LOCALID_PROF_OAK, 2
# 4 "data/maps/IndigoPlateau_Exterior/scripts.pory"

# 5 "data/maps/IndigoPlateau_Exterior/scripts.pory"
IndigoPlateau_Exterior_MapScripts::
# 6 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	map_script MAP_SCRIPT_ON_TRANSITION, IndigoPlateau_Exterior_OnTransition
# 7 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	map_script MAP_SCRIPT_ON_FRAME_TABLE, IndigoPlateau_Exterior_OnFrame
# 8 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	.byte 0
# 9 "data/maps/IndigoPlateau_Exterior/scripts.pory"

# 10 "data/maps/IndigoPlateau_Exterior/scripts.pory"
IndigoPlateau_Exterior_OnTransition::
# 11 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	setworldmapflag FLAG_WORLD_MAP_INDIGO_PLATEAU_EXTERIOR
# 12 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	call_if_eq VAR_MAP_SCENE_INDIGO_PLATEAU_EXTERIOR, 1, IndigoPlateau_Exterior_EventScript_PlayCreditsMusic
# 13 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	end
# 14 "data/maps/IndigoPlateau_Exterior/scripts.pory"

# 15 "data/maps/IndigoPlateau_Exterior/scripts.pory"
IndigoPlateau_Exterior_EventScript_PlayCreditsMusic::
# 16 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	playbgm MUS_CREDITS, 0
# 17 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	return
# 18 "data/maps/IndigoPlateau_Exterior/scripts.pory"

# 19 "data/maps/IndigoPlateau_Exterior/scripts.pory"
IndigoPlateau_Exterior_OnFrame::
# 20 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	map_script_2 VAR_MAP_SCENE_INDIGO_PLATEAU_EXTERIOR, 1, IndigoPlateau_Exterior_EventScript_Credits
# 21 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	.2byte 0
# 22 "data/maps/IndigoPlateau_Exterior/scripts.pory"

# 23 "data/maps/IndigoPlateau_Exterior/scripts.pory"

# 24 "data/maps/IndigoPlateau_Exterior/scripts.pory"
@ After beating the champion, you are warped to the main
# 25 "data/maps/IndigoPlateau_Exterior/scripts.pory"
@ entrance of Indigo Plateau. This script starts running
# 26 "data/maps/IndigoPlateau_Exterior/scripts.pory"
@ immediately after your walking animation.
# 27 "data/maps/IndigoPlateau_Exterior/scripts.pory"
@ The script is timed to the music.
# 28 "data/maps/IndigoPlateau_Exterior/scripts.pory"
IndigoPlateau_Exterior_EventScript_Credits::
# 29 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	lockall
# 30 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	delay 105
# 31 "data/maps/IndigoPlateau_Exterior/scripts.pory"

# 32 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	@ Rival exits building. Spawn a dummy object to lock the camera.
# 33 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	opendoor 11, 6
# 34 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	waitdooranim
# 35 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	special SpawnCameraObject
# 36 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	addobject LOCALID_RIVAL
# 37 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	applymovement LOCALID_RIVAL, IndigoPlateau_Exterior_Movement_RivalExitBuilding
# 38 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, IndigoPlateau_Exterior_Movement_PushPlayerOutOfWay
# 39 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	waitmovement 0
# 40 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	closedoor 11, 6
# 41 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	waitdooranim
# 42 "data/maps/IndigoPlateau_Exterior/scripts.pory"

# 43 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	@ Rival runs off
# 44 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, IndigoPlateau_Exterior_Movement_PlayerWatchRivalLeave
# 45 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	applymovement LOCALID_RIVAL, IndigoPlateau_Exterior_Movement_RivalLeave
# 46 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	waitmovement 0
# 47 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	delay 100
# 48 "data/maps/IndigoPlateau_Exterior/scripts.pory"

# 49 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	@ Oak exits building
# 50 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	opendoor 11, 6
# 51 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	waitdooranim
# 52 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	addobject LOCALID_PROF_OAK
# 53 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	applymovement LOCALID_PROF_OAK, IndigoPlateau_Exterior_Movement_OakExitBuilding
# 54 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	waitmovement 0
# 55 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	closedoor 11, 6
# 56 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	waitdooranim
# 57 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	delay 160
# 58 "data/maps/IndigoPlateau_Exterior/scripts.pory"

# 59 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	@ Oak looks at player, then walks off
# 60 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, IndigoPlateau_Exterior_Movement_PlayerWatchOakLeave
# 61 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	applymovement LOCALID_PROF_OAK, IndigoPlateau_Exterior_Movement_OakLeave
# 62 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	waitmovement 0
# 63 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	delay 100
# 64 "data/maps/IndigoPlateau_Exterior/scripts.pory"

# 65 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	@ Player begin to leave
# 66 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, IndigoPlateau_Exterior_Movement_PlayerBeginLeave
# 67 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	waitmovement 0
# 68 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	delay 155
# 69 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, IndigoPlateau_Exterior_Movement_PlayerFaceLeague
# 70 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	waitmovement 0
# 71 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	delay 90
# 72 "data/maps/IndigoPlateau_Exterior/scripts.pory"

# 73 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	@ Player runs off
# 74 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, IndigoPlateau_Exterior_Movement_PlayerTurnAround
# 75 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	waitmovement 0
# 76 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, IndigoPlateau_Exterior_Movement_PlayerLeave
# 77 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	waitmovement 0
# 78 "data/maps/IndigoPlateau_Exterior/scripts.pory"

# 79 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	@ Reset the map state and roll the credits
# 80 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	special RemoveCameraObject
# 81 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	setvar VAR_MAP_SCENE_INDIGO_PLATEAU_EXTERIOR, 0
# 82 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	removeobject LOCALID_RIVAL
# 83 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	removeobject LOCALID_PROF_OAK
# 84 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	special DoCredits
# 85 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	waitstate
# 86 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	releaseall
# 87 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	end
# 88 "data/maps/IndigoPlateau_Exterior/scripts.pory"

# 89 "data/maps/IndigoPlateau_Exterior/scripts.pory"
IndigoPlateau_Exterior_Movement_PlayerLeave::
# 90 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	player_run_down
# 91 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	player_run_down
# 92 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	player_run_down
# 93 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	player_run_down
# 94 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	player_run_down
# 95 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	player_run_down
# 96 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	step_end
# 97 "data/maps/IndigoPlateau_Exterior/scripts.pory"

# 98 "data/maps/IndigoPlateau_Exterior/scripts.pory"
@ Unused
# 99 "data/maps/IndigoPlateau_Exterior/scripts.pory"
IndigoPlateau_Exterior_Movement_PlayerExitBuilding::
# 100 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	walk_down
# 101 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	walk_down
# 102 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	step_end
# 103 "data/maps/IndigoPlateau_Exterior/scripts.pory"

# 104 "data/maps/IndigoPlateau_Exterior/scripts.pory"
IndigoPlateau_Exterior_Movement_PlayerWatchRivalLeave::
# 105 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	delay_16
# 106 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	delay_4
# 107 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	walk_in_place_faster_down
# 108 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	step_end
# 109 "data/maps/IndigoPlateau_Exterior/scripts.pory"

# 110 "data/maps/IndigoPlateau_Exterior/scripts.pory"
IndigoPlateau_Exterior_Movement_PlayerWatchOakLeave::
# 111 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	delay_8
# 112 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	walk_in_place_faster_right
# 113 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	delay_16
# 114 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	delay_16
# 115 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	delay_16
# 116 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	delay_16
# 117 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	delay_16
# 118 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	delay_16
# 119 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	delay_16
# 120 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	delay_16
# 121 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	delay_16
# 122 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	delay_16
# 123 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	delay_16
# 124 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	walk_in_place_faster_down
# 125 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	step_end
# 126 "data/maps/IndigoPlateau_Exterior/scripts.pory"

# 127 "data/maps/IndigoPlateau_Exterior/scripts.pory"
IndigoPlateau_Exterior_Movement_PlayerBeginLeave::
# 128 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	walk_right
# 129 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	delay_16
# 130 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	walk_down
# 131 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	walk_down
# 132 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	delay_16
# 133 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	delay_16
# 134 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	step_end
# 135 "data/maps/IndigoPlateau_Exterior/scripts.pory"

# 136 "data/maps/IndigoPlateau_Exterior/scripts.pory"
IndigoPlateau_Exterior_Movement_PlayerTurnAround::
# 137 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	walk_in_place_faster_down
# 138 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	step_end
# 139 "data/maps/IndigoPlateau_Exterior/scripts.pory"

# 140 "data/maps/IndigoPlateau_Exterior/scripts.pory"
IndigoPlateau_Exterior_Movement_PushPlayerOutOfWay::
# 141 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	face_right
# 142 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	lock_facing_direction
# 143 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	walk_left
# 144 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	unlock_facing_direction
# 145 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	step_end
# 146 "data/maps/IndigoPlateau_Exterior/scripts.pory"

# 147 "data/maps/IndigoPlateau_Exterior/scripts.pory"
IndigoPlateau_Exterior_Movement_PlayerFaceLeague::
# 148 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	walk_in_place_faster_up
# 149 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	step_end
# 150 "data/maps/IndigoPlateau_Exterior/scripts.pory"

# 151 "data/maps/IndigoPlateau_Exterior/scripts.pory"
IndigoPlateau_Exterior_Movement_RivalLeave::
# 152 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	walk_fast_down
# 153 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	walk_fast_down
# 154 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	walk_fast_down
# 155 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	walk_fast_down
# 156 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	walk_fast_down
# 157 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	walk_fast_down
# 158 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	walk_fast_down
# 159 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	step_end
# 160 "data/maps/IndigoPlateau_Exterior/scripts.pory"

# 161 "data/maps/IndigoPlateau_Exterior/scripts.pory"
IndigoPlateau_Exterior_Movement_RivalExitBuilding::
# 162 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	walk_fast_down
# 163 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	step_end
# 164 "data/maps/IndigoPlateau_Exterior/scripts.pory"

# 165 "data/maps/IndigoPlateau_Exterior/scripts.pory"
IndigoPlateau_Exterior_Movement_OakLeave::
# 166 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	walk_in_place_faster_left
# 167 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	delay_16
# 168 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	delay_16
# 169 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	delay_16
# 170 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	delay_16
# 171 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	delay_16
# 172 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	delay_16
# 173 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	delay_16
# 174 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	delay_16
# 175 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	delay_16
# 176 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	delay_16
# 177 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	walk_in_place_faster_down
# 178 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	delay_16
# 179 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	walk_down
# 180 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	walk_down
# 181 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	walk_down
# 182 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	walk_down
# 183 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	walk_down
# 184 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	walk_down
# 185 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	walk_down
# 186 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	step_end
# 187 "data/maps/IndigoPlateau_Exterior/scripts.pory"

# 188 "data/maps/IndigoPlateau_Exterior/scripts.pory"
IndigoPlateau_Exterior_Movement_OakExitBuilding::
# 189 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	walk_down
# 190 "data/maps/IndigoPlateau_Exterior/scripts.pory"
	step_end
