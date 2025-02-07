# 1 "data/maps/SSAnne_2F_Corridor/scripts.pory"

# 2 "data/maps/SSAnne_2F_Corridor/scripts.pory"
.set LOCALID_RIVAL, 1
# 3 "data/maps/SSAnne_2F_Corridor/scripts.pory"

# 4 "data/maps/SSAnne_2F_Corridor/scripts.pory"
SSAnne_2F_Corridor_MapScripts::
# 5 "data/maps/SSAnne_2F_Corridor/scripts.pory"
	.byte 0
# 6 "data/maps/SSAnne_2F_Corridor/scripts.pory"

# 7 "data/maps/SSAnne_2F_Corridor/scripts.pory"
SSAnne_2F_Corridor_EventScript_RivalTriggerLeft::
# 8 "data/maps/SSAnne_2F_Corridor/scripts.pory"
	lockall
# 9 "data/maps/SSAnne_2F_Corridor/scripts.pory"
	setvar VAR_TEMP_1, 0
# 10 "data/maps/SSAnne_2F_Corridor/scripts.pory"
	goto SSAnne_2F_Corridor_EventScript_RivalTrigger
# 11 "data/maps/SSAnne_2F_Corridor/scripts.pory"
	end
# 12 "data/maps/SSAnne_2F_Corridor/scripts.pory"

# 13 "data/maps/SSAnne_2F_Corridor/scripts.pory"
SSAnne_2F_Corridor_EventScript_RivalTriggerMid::
# 14 "data/maps/SSAnne_2F_Corridor/scripts.pory"
	lockall
# 15 "data/maps/SSAnne_2F_Corridor/scripts.pory"
	setvar VAR_TEMP_1, 1
# 16 "data/maps/SSAnne_2F_Corridor/scripts.pory"
	goto SSAnne_2F_Corridor_EventScript_RivalTrigger
# 17 "data/maps/SSAnne_2F_Corridor/scripts.pory"
	end
# 18 "data/maps/SSAnne_2F_Corridor/scripts.pory"

# 19 "data/maps/SSAnne_2F_Corridor/scripts.pory"
SSAnne_2F_Corridor_EventScript_RivalTriggerRight::
# 20 "data/maps/SSAnne_2F_Corridor/scripts.pory"
	lockall
# 21 "data/maps/SSAnne_2F_Corridor/scripts.pory"
	setvar VAR_TEMP_1, 2
# 22 "data/maps/SSAnne_2F_Corridor/scripts.pory"
	goto SSAnne_2F_Corridor_EventScript_RivalTrigger
# 23 "data/maps/SSAnne_2F_Corridor/scripts.pory"
	end
# 24 "data/maps/SSAnne_2F_Corridor/scripts.pory"

# 25 "data/maps/SSAnne_2F_Corridor/scripts.pory"
SSAnne_2F_Corridor_EventScript_RivalTrigger::
# 26 "data/maps/SSAnne_2F_Corridor/scripts.pory"
	textcolor NPC_TEXT_COLOR_MALE
# 27 "data/maps/SSAnne_2F_Corridor/scripts.pory"
	playse SE_EXIT
# 28 "data/maps/SSAnne_2F_Corridor/scripts.pory"
	delay 5
# 29 "data/maps/SSAnne_2F_Corridor/scripts.pory"
	playbgm MUS_ENCOUNTER_RIVAL, 0
# 30 "data/maps/SSAnne_2F_Corridor/scripts.pory"
	addobject LOCALID_RIVAL
# 31 "data/maps/SSAnne_2F_Corridor/scripts.pory"
	delay 10
# 32 "data/maps/SSAnne_2F_Corridor/scripts.pory"
	applymovement LOCALID_RIVAL, Common_Movement_WalkInPlaceFasterDown
# 33 "data/maps/SSAnne_2F_Corridor/scripts.pory"
	waitmovement 0
# 34 "data/maps/SSAnne_2F_Corridor/scripts.pory"
	delay 20
# 35 "data/maps/SSAnne_2F_Corridor/scripts.pory"
	call_if_eq VAR_TEMP_1, 0, SSAnne_2F_Corridor_EventScript_RivalApproachLeft
# 36 "data/maps/SSAnne_2F_Corridor/scripts.pory"
	call_if_eq VAR_TEMP_1, 1, SSAnne_2F_Corridor_EventScript_RivalApproachMid
# 37 "data/maps/SSAnne_2F_Corridor/scripts.pory"
	call_if_eq VAR_TEMP_1, 2, SSAnne_2F_Corridor_EventScript_RivalApproachRight
# 38 "data/maps/SSAnne_2F_Corridor/scripts.pory"
	msgbox SSAnne_2F_Corridor_Text_RivalIntro
# 39 "data/maps/SSAnne_2F_Corridor/scripts.pory"
	setvar VAR_LAST_TALKED, LOCALID_RIVAL
# 40 "data/maps/SSAnne_2F_Corridor/scripts.pory"
	call_if_eq VAR_STARTER_MON, 2, SSAnne_2F_Corridor_EventScript_RivalSquirtle
# 41 "data/maps/SSAnne_2F_Corridor/scripts.pory"
	call_if_eq VAR_STARTER_MON, 1, SSAnne_2F_Corridor_EventScript_RivalBulbasaur
# 42 "data/maps/SSAnne_2F_Corridor/scripts.pory"
	call_if_eq VAR_STARTER_MON, 0, SSAnne_2F_Corridor_EventScript_RivalCharmander
# 43 "data/maps/SSAnne_2F_Corridor/scripts.pory"
	msgbox SSAnne_2F_Corridor_Text_RivalPostBattle
# 44 "data/maps/SSAnne_2F_Corridor/scripts.pory"
	closemessage
# 45 "data/maps/SSAnne_2F_Corridor/scripts.pory"
	delay 10
# 46 "data/maps/SSAnne_2F_Corridor/scripts.pory"
	playbgm MUS_RIVAL_EXIT, 0
# 47 "data/maps/SSAnne_2F_Corridor/scripts.pory"
	call_if_eq VAR_TEMP_1, 0, SSAnne_2F_Corridor_EventScript_RivalExitLeft
# 48 "data/maps/SSAnne_2F_Corridor/scripts.pory"
	call_if_eq VAR_TEMP_1, 1, SSAnne_2F_Corridor_EventScript_RivalExitMid
# 49 "data/maps/SSAnne_2F_Corridor/scripts.pory"
	call_if_eq VAR_TEMP_1, 2, SSAnne_2F_Corridor_EventScript_RivalExitRight
# 50 "data/maps/SSAnne_2F_Corridor/scripts.pory"
	fadedefaultbgm
# 51 "data/maps/SSAnne_2F_Corridor/scripts.pory"
	removeobject LOCALID_RIVAL
# 52 "data/maps/SSAnne_2F_Corridor/scripts.pory"
	setvar VAR_MAP_SCENE_S_S_ANNE_2F_CORRIDOR, 1
# 53 "data/maps/SSAnne_2F_Corridor/scripts.pory"
	releaseall
# 54 "data/maps/SSAnne_2F_Corridor/scripts.pory"
	end
# 55 "data/maps/SSAnne_2F_Corridor/scripts.pory"

# 56 "data/maps/SSAnne_2F_Corridor/scripts.pory"
SSAnne_2F_Corridor_EventScript_RivalApproachLeft::
# 57 "data/maps/SSAnne_2F_Corridor/scripts.pory"
	applymovement LOCALID_RIVAL, SSAnne_2F_Corridor_Movement_RivalApproachLeft
# 58 "data/maps/SSAnne_2F_Corridor/scripts.pory"
	waitmovement 0
# 59 "data/maps/SSAnne_2F_Corridor/scripts.pory"
	return
# 60 "data/maps/SSAnne_2F_Corridor/scripts.pory"

# 61 "data/maps/SSAnne_2F_Corridor/scripts.pory"
SSAnne_2F_Corridor_EventScript_RivalApproachMid::
# 62 "data/maps/SSAnne_2F_Corridor/scripts.pory"
	applymovement LOCALID_RIVAL, SSAnne_2F_Corridor_Movement_RivalApproachMid
# 63 "data/maps/SSAnne_2F_Corridor/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, SSAnne_2F_Corridor_Movement_PlayerFaceRivalMid
# 64 "data/maps/SSAnne_2F_Corridor/scripts.pory"
	waitmovement 0
# 65 "data/maps/SSAnne_2F_Corridor/scripts.pory"
	return
# 66 "data/maps/SSAnne_2F_Corridor/scripts.pory"

# 67 "data/maps/SSAnne_2F_Corridor/scripts.pory"
SSAnne_2F_Corridor_EventScript_RivalApproachRight::
# 68 "data/maps/SSAnne_2F_Corridor/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, SSAnne_2F_Corridor_Movement_PlayerFaceRivalRight
# 69 "data/maps/SSAnne_2F_Corridor/scripts.pory"
	applymovement LOCALID_RIVAL, SSAnne_2F_Corridor_Movement_RivalApproachRight
# 70 "data/maps/SSAnne_2F_Corridor/scripts.pory"
	waitmovement 0
# 71 "data/maps/SSAnne_2F_Corridor/scripts.pory"
	return
# 72 "data/maps/SSAnne_2F_Corridor/scripts.pory"

# 73 "data/maps/SSAnne_2F_Corridor/scripts.pory"
SSAnne_2F_Corridor_EventScript_RivalSquirtle::
# 74 "data/maps/SSAnne_2F_Corridor/scripts.pory"
	trainerbattle_no_intro TRAINER_RIVAL_SS_ANNE_SQUIRTLE, SSAnne_2F_Corridor_Text_RivalDefeat
# 75 "data/maps/SSAnne_2F_Corridor/scripts.pory"
	return
# 76 "data/maps/SSAnne_2F_Corridor/scripts.pory"

# 77 "data/maps/SSAnne_2F_Corridor/scripts.pory"
SSAnne_2F_Corridor_EventScript_RivalBulbasaur::
# 78 "data/maps/SSAnne_2F_Corridor/scripts.pory"
	trainerbattle_no_intro TRAINER_RIVAL_SS_ANNE_BULBASAUR, SSAnne_2F_Corridor_Text_RivalDefeat
# 79 "data/maps/SSAnne_2F_Corridor/scripts.pory"
	return
# 80 "data/maps/SSAnne_2F_Corridor/scripts.pory"

# 81 "data/maps/SSAnne_2F_Corridor/scripts.pory"
SSAnne_2F_Corridor_EventScript_RivalCharmander::
# 82 "data/maps/SSAnne_2F_Corridor/scripts.pory"
	trainerbattle_no_intro TRAINER_RIVAL_SS_ANNE_CHARMANDER, SSAnne_2F_Corridor_Text_RivalDefeat
# 83 "data/maps/SSAnne_2F_Corridor/scripts.pory"
	return
# 84 "data/maps/SSAnne_2F_Corridor/scripts.pory"

# 85 "data/maps/SSAnne_2F_Corridor/scripts.pory"
SSAnne_2F_Corridor_EventScript_RivalExitLeft::
# 86 "data/maps/SSAnne_2F_Corridor/scripts.pory"
	applymovement LOCALID_RIVAL, SSAnne_2F_Corridor_Movement_RivalExitLeft
# 87 "data/maps/SSAnne_2F_Corridor/scripts.pory"
	waitmovement 0
# 88 "data/maps/SSAnne_2F_Corridor/scripts.pory"
	return
# 89 "data/maps/SSAnne_2F_Corridor/scripts.pory"

# 90 "data/maps/SSAnne_2F_Corridor/scripts.pory"
SSAnne_2F_Corridor_EventScript_RivalExitMid::
# 91 "data/maps/SSAnne_2F_Corridor/scripts.pory"
	applymovement LOCALID_RIVAL, SSAnne_2F_Corridor_Movement_RivalExitMid
# 92 "data/maps/SSAnne_2F_Corridor/scripts.pory"
	waitmovement 0
# 93 "data/maps/SSAnne_2F_Corridor/scripts.pory"
	return
# 94 "data/maps/SSAnne_2F_Corridor/scripts.pory"

# 95 "data/maps/SSAnne_2F_Corridor/scripts.pory"
SSAnne_2F_Corridor_EventScript_RivalExitRight::
# 96 "data/maps/SSAnne_2F_Corridor/scripts.pory"
	applymovement LOCALID_RIVAL, SSAnne_2F_Corridor_Movement_RivalExitRight
# 97 "data/maps/SSAnne_2F_Corridor/scripts.pory"
	waitmovement 0
# 98 "data/maps/SSAnne_2F_Corridor/scripts.pory"
	return
# 99 "data/maps/SSAnne_2F_Corridor/scripts.pory"

# 100 "data/maps/SSAnne_2F_Corridor/scripts.pory"
SSAnne_2F_Corridor_Movement_PlayerFaceRivalRight::
# 101 "data/maps/SSAnne_2F_Corridor/scripts.pory"
	delay_16
# 102 "data/maps/SSAnne_2F_Corridor/scripts.pory"
	delay_16
# 103 "data/maps/SSAnne_2F_Corridor/scripts.pory"
	delay_16
# 104 "data/maps/SSAnne_2F_Corridor/scripts.pory"
	delay_16
# 105 "data/maps/SSAnne_2F_Corridor/scripts.pory"
	walk_in_place_faster_left
# 106 "data/maps/SSAnne_2F_Corridor/scripts.pory"
	step_end
# 107 "data/maps/SSAnne_2F_Corridor/scripts.pory"

# 108 "data/maps/SSAnne_2F_Corridor/scripts.pory"
SSAnne_2F_Corridor_Movement_PlayerFaceRivalMid::
# 109 "data/maps/SSAnne_2F_Corridor/scripts.pory"
	delay_16
# 110 "data/maps/SSAnne_2F_Corridor/scripts.pory"
	delay_16
# 111 "data/maps/SSAnne_2F_Corridor/scripts.pory"
	delay_16
# 112 "data/maps/SSAnne_2F_Corridor/scripts.pory"
	delay_16
# 113 "data/maps/SSAnne_2F_Corridor/scripts.pory"
	walk_in_place_faster_left
# 114 "data/maps/SSAnne_2F_Corridor/scripts.pory"
	step_end
# 115 "data/maps/SSAnne_2F_Corridor/scripts.pory"

# 116 "data/maps/SSAnne_2F_Corridor/scripts.pory"
SSAnne_2F_Corridor_Movement_RivalApproachLeft::
# 117 "data/maps/SSAnne_2F_Corridor/scripts.pory"
	walk_down
# 118 "data/maps/SSAnne_2F_Corridor/scripts.pory"
	walk_down
# 119 "data/maps/SSAnne_2F_Corridor/scripts.pory"
	walk_down
# 120 "data/maps/SSAnne_2F_Corridor/scripts.pory"
	step_end
# 121 "data/maps/SSAnne_2F_Corridor/scripts.pory"

# 122 "data/maps/SSAnne_2F_Corridor/scripts.pory"
SSAnne_2F_Corridor_Movement_RivalApproachMid::
# 123 "data/maps/SSAnne_2F_Corridor/scripts.pory"
	walk_down
# 124 "data/maps/SSAnne_2F_Corridor/scripts.pory"
	walk_down
# 125 "data/maps/SSAnne_2F_Corridor/scripts.pory"
	walk_down
# 126 "data/maps/SSAnne_2F_Corridor/scripts.pory"
	walk_down
# 127 "data/maps/SSAnne_2F_Corridor/scripts.pory"
	walk_in_place_faster_right
# 128 "data/maps/SSAnne_2F_Corridor/scripts.pory"
	step_end
# 129 "data/maps/SSAnne_2F_Corridor/scripts.pory"

# 130 "data/maps/SSAnne_2F_Corridor/scripts.pory"
SSAnne_2F_Corridor_Movement_RivalApproachRight::
# 131 "data/maps/SSAnne_2F_Corridor/scripts.pory"
	walk_down
# 132 "data/maps/SSAnne_2F_Corridor/scripts.pory"
	walk_down
# 133 "data/maps/SSAnne_2F_Corridor/scripts.pory"
	walk_down
# 134 "data/maps/SSAnne_2F_Corridor/scripts.pory"
	walk_down
# 135 "data/maps/SSAnne_2F_Corridor/scripts.pory"
	walk_right
# 136 "data/maps/SSAnne_2F_Corridor/scripts.pory"
	delay_4
# 137 "data/maps/SSAnne_2F_Corridor/scripts.pory"
	step_end
# 138 "data/maps/SSAnne_2F_Corridor/scripts.pory"

# 139 "data/maps/SSAnne_2F_Corridor/scripts.pory"
SSAnne_2F_Corridor_Movement_RivalExitLeft::
# 140 "data/maps/SSAnne_2F_Corridor/scripts.pory"
	walk_right
# 141 "data/maps/SSAnne_2F_Corridor/scripts.pory"
	walk_down
# 142 "data/maps/SSAnne_2F_Corridor/scripts.pory"
	walk_down
# 143 "data/maps/SSAnne_2F_Corridor/scripts.pory"
	walk_down
# 144 "data/maps/SSAnne_2F_Corridor/scripts.pory"
	walk_down
# 145 "data/maps/SSAnne_2F_Corridor/scripts.pory"
	walk_down
# 146 "data/maps/SSAnne_2F_Corridor/scripts.pory"
	walk_down
# 147 "data/maps/SSAnne_2F_Corridor/scripts.pory"
	walk_down
# 148 "data/maps/SSAnne_2F_Corridor/scripts.pory"
	step_end
# 149 "data/maps/SSAnne_2F_Corridor/scripts.pory"

# 150 "data/maps/SSAnne_2F_Corridor/scripts.pory"
SSAnne_2F_Corridor_Movement_RivalExitMid::
# 151 "data/maps/SSAnne_2F_Corridor/scripts.pory"
	walk_down
# 152 "data/maps/SSAnne_2F_Corridor/scripts.pory"
	walk_down
# 153 "data/maps/SSAnne_2F_Corridor/scripts.pory"
	walk_down
# 154 "data/maps/SSAnne_2F_Corridor/scripts.pory"
	walk_down
# 155 "data/maps/SSAnne_2F_Corridor/scripts.pory"
	walk_down
# 156 "data/maps/SSAnne_2F_Corridor/scripts.pory"
	walk_down
# 157 "data/maps/SSAnne_2F_Corridor/scripts.pory"
	walk_down
# 158 "data/maps/SSAnne_2F_Corridor/scripts.pory"
	step_end
# 159 "data/maps/SSAnne_2F_Corridor/scripts.pory"

# 160 "data/maps/SSAnne_2F_Corridor/scripts.pory"
SSAnne_2F_Corridor_Movement_RivalExitRight::
# 161 "data/maps/SSAnne_2F_Corridor/scripts.pory"
	walk_down
# 162 "data/maps/SSAnne_2F_Corridor/scripts.pory"
	walk_down
# 163 "data/maps/SSAnne_2F_Corridor/scripts.pory"
	walk_down
# 164 "data/maps/SSAnne_2F_Corridor/scripts.pory"
	walk_down
# 165 "data/maps/SSAnne_2F_Corridor/scripts.pory"
	walk_down
# 166 "data/maps/SSAnne_2F_Corridor/scripts.pory"
	walk_down
# 167 "data/maps/SSAnne_2F_Corridor/scripts.pory"
	walk_down
# 168 "data/maps/SSAnne_2F_Corridor/scripts.pory"
	step_end
# 169 "data/maps/SSAnne_2F_Corridor/scripts.pory"

# 170 "data/maps/SSAnne_2F_Corridor/scripts.pory"
SSAnne_2F_Corridor_EventScript_Sailor::
# 171 "data/maps/SSAnne_2F_Corridor/scripts.pory"
	msgbox SSAnne_2F_Corridor_Text_ThisShipIsLuxuryLiner, MSGBOX_NPC
# 172 "data/maps/SSAnne_2F_Corridor/scripts.pory"
	end
