# 1 "data/maps/Route22/scripts.pory"

# 2 "data/maps/Route22/scripts.pory"
.set LOCALID_RIVAL, 1
# 3 "data/maps/Route22/scripts.pory"

# 4 "data/maps/Route22/scripts.pory"
Route22_MapScripts::
# 5 "data/maps/Route22/scripts.pory"
	.byte 0
# 6 "data/maps/Route22/scripts.pory"

# 7 "data/maps/Route22/scripts.pory"
Route22_EventScript_EarlyRivalTriggerTop::
# 8 "data/maps/Route22/scripts.pory"
	lockall
# 9 "data/maps/Route22/scripts.pory"
	setvar VAR_TEMP_1, 0
# 10 "data/maps/Route22/scripts.pory"
	goto Route22_EventScript_EarlyRival
# 11 "data/maps/Route22/scripts.pory"
	end
# 12 "data/maps/Route22/scripts.pory"

# 13 "data/maps/Route22/scripts.pory"
Route22_EventScript_EarlyRivalTriggerMid::
# 14 "data/maps/Route22/scripts.pory"
	lockall
# 15 "data/maps/Route22/scripts.pory"
	setvar VAR_TEMP_1, 1
# 16 "data/maps/Route22/scripts.pory"
	setobjectxyperm LOCALID_RIVAL, 25, 5
# 17 "data/maps/Route22/scripts.pory"
	goto Route22_EventScript_EarlyRival
# 18 "data/maps/Route22/scripts.pory"
	end
# 19 "data/maps/Route22/scripts.pory"

# 20 "data/maps/Route22/scripts.pory"
Route22_EventScript_EarlyRivalTriggerBottom::
# 21 "data/maps/Route22/scripts.pory"
	lockall
# 22 "data/maps/Route22/scripts.pory"
	setvar VAR_TEMP_1, 2
# 23 "data/maps/Route22/scripts.pory"
	setobjectxyperm LOCALID_RIVAL, 25, 5
# 24 "data/maps/Route22/scripts.pory"
	goto Route22_EventScript_EarlyRival
# 25 "data/maps/Route22/scripts.pory"
	end
# 26 "data/maps/Route22/scripts.pory"

# 27 "data/maps/Route22/scripts.pory"
Route22_EventScript_EarlyRival::
# 28 "data/maps/Route22/scripts.pory"
	textcolor NPC_TEXT_COLOR_MALE
# 29 "data/maps/Route22/scripts.pory"
	playbgm MUS_ENCOUNTER_RIVAL, 0
# 30 "data/maps/Route22/scripts.pory"
	addobject LOCALID_RIVAL
# 31 "data/maps/Route22/scripts.pory"
	call_if_eq VAR_TEMP_1, 0, Route22_EventScript_EarlyRivalApproach
# 32 "data/maps/Route22/scripts.pory"
	call_if_eq VAR_TEMP_1, 1, Route22_EventScript_EarlyRivalApproach
# 33 "data/maps/Route22/scripts.pory"
	call_if_eq VAR_TEMP_1, 2, Route22_EventScript_EarlyRivalApproachBottom
# 34 "data/maps/Route22/scripts.pory"
	delay 6
# 35 "data/maps/Route22/scripts.pory"
	msgbox Route22_Text_EarlyRivalIntro
# 36 "data/maps/Route22/scripts.pory"
	call_if_eq VAR_STARTER_MON, 2, Route22_EventScript_EarlyRivalSquirtle
# 37 "data/maps/Route22/scripts.pory"
	call_if_eq VAR_STARTER_MON, 1, Route22_EventScript_EarlyRivalBulbasaur
# 38 "data/maps/Route22/scripts.pory"
	call_if_eq VAR_STARTER_MON, 0, Route22_EventScript_EarlyRivalCharmander
# 39 "data/maps/Route22/scripts.pory"
	msgbox Route22_Text_EarlyRivalPostBattle
# 40 "data/maps/Route22/scripts.pory"
	closemessage
# 41 "data/maps/Route22/scripts.pory"
	delay 10
# 42 "data/maps/Route22/scripts.pory"
	playbgm MUS_RIVAL_EXIT, 0
# 43 "data/maps/Route22/scripts.pory"
	call_if_eq VAR_TEMP_1, 0, Route22_EventScript_EarlyRivalExit
# 44 "data/maps/Route22/scripts.pory"
	call_if_eq VAR_TEMP_1, 1, Route22_EventScript_EarlyRivalExit
# 45 "data/maps/Route22/scripts.pory"
	call_if_eq VAR_TEMP_1, 2, Route22_EventScript_EarlyRivalExitBottom
# 46 "data/maps/Route22/scripts.pory"
	fadedefaultbgm
# 47 "data/maps/Route22/scripts.pory"
	removeobject LOCALID_RIVAL
# 48 "data/maps/Route22/scripts.pory"
	setvar VAR_MAP_SCENE_ROUTE22, 2
# 49 "data/maps/Route22/scripts.pory"
	releaseall
# 50 "data/maps/Route22/scripts.pory"
	end
# 51 "data/maps/Route22/scripts.pory"

# 52 "data/maps/Route22/scripts.pory"
Route22_EventScript_EarlyRivalApproach::
# 53 "data/maps/Route22/scripts.pory"
	applymovement LOCALID_RIVAL, Route22_Movement_RivalApproach
# 54 "data/maps/Route22/scripts.pory"
	waitmovement 0
# 55 "data/maps/Route22/scripts.pory"
	return
# 56 "data/maps/Route22/scripts.pory"

# 57 "data/maps/Route22/scripts.pory"
Route22_EventScript_EarlyRivalApproachBottom::
# 58 "data/maps/Route22/scripts.pory"
	applymovement LOCALID_RIVAL, Route22_Movement_RivalApproachBottom
# 59 "data/maps/Route22/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, Route22_Movement_PlayerFaceRival
# 60 "data/maps/Route22/scripts.pory"
	waitmovement 0
# 61 "data/maps/Route22/scripts.pory"
	return
# 62 "data/maps/Route22/scripts.pory"

# 63 "data/maps/Route22/scripts.pory"
Route22_EventScript_EarlyRivalSquirtle::
# 64 "data/maps/Route22/scripts.pory"
	trainerbattle_earlyrival TRAINER_RIVAL_ROUTE22_EARLY_SQUIRTLE, 0, Route22_Text_EarlyRivalDefeat, Text_RivalVictory
# 65 "data/maps/Route22/scripts.pory"
	return
# 66 "data/maps/Route22/scripts.pory"

# 67 "data/maps/Route22/scripts.pory"
Route22_EventScript_EarlyRivalBulbasaur::
# 68 "data/maps/Route22/scripts.pory"
	trainerbattle_earlyrival TRAINER_RIVAL_ROUTE22_EARLY_BULBASAUR, 0, Route22_Text_EarlyRivalDefeat, Text_RivalVictory
# 69 "data/maps/Route22/scripts.pory"
	return
# 70 "data/maps/Route22/scripts.pory"

# 71 "data/maps/Route22/scripts.pory"
Route22_EventScript_EarlyRivalCharmander::
# 72 "data/maps/Route22/scripts.pory"
	trainerbattle_earlyrival TRAINER_RIVAL_ROUTE22_EARLY_CHARMANDER, 0, Route22_Text_EarlyRivalDefeat, Text_RivalVictory
# 73 "data/maps/Route22/scripts.pory"
	return
# 74 "data/maps/Route22/scripts.pory"

# 75 "data/maps/Route22/scripts.pory"
Route22_EventScript_EarlyRivalExit::
# 76 "data/maps/Route22/scripts.pory"
	applymovement LOCALID_RIVAL, Route22_Movement_EarlyRivalExit
# 77 "data/maps/Route22/scripts.pory"
	waitmovement 0
# 78 "data/maps/Route22/scripts.pory"
	return
# 79 "data/maps/Route22/scripts.pory"

# 80 "data/maps/Route22/scripts.pory"
Route22_EventScript_EarlyRivalExitBottom::
# 81 "data/maps/Route22/scripts.pory"
	applymovement LOCALID_RIVAL, Route22_Movement_EarlyRivalExitBottom
# 82 "data/maps/Route22/scripts.pory"
	waitmovement 0
# 83 "data/maps/Route22/scripts.pory"
	return
# 84 "data/maps/Route22/scripts.pory"

# 85 "data/maps/Route22/scripts.pory"
Route22_Movement_UnusedRivalExit:: @ 8
# 86 "data/maps/Route22/scripts.pory"
	walk_right
# 87 "data/maps/Route22/scripts.pory"
	walk_right
# 88 "data/maps/Route22/scripts.pory"
	walk_right
# 89 "data/maps/Route22/scripts.pory"
	walk_right
# 90 "data/maps/Route22/scripts.pory"
	walk_right
# 91 "data/maps/Route22/scripts.pory"
	walk_right
# 92 "data/maps/Route22/scripts.pory"
	walk_right
# 93 "data/maps/Route22/scripts.pory"
	step_end
# 94 "data/maps/Route22/scripts.pory"

# 95 "data/maps/Route22/scripts.pory"
Route22_Movement_EarlyRivalExit::
# 96 "data/maps/Route22/scripts.pory"
	walk_down
# 97 "data/maps/Route22/scripts.pory"
	walk_right
# 98 "data/maps/Route22/scripts.pory"
	walk_right
# 99 "data/maps/Route22/scripts.pory"
	walk_right
# 100 "data/maps/Route22/scripts.pory"
	walk_right
# 101 "data/maps/Route22/scripts.pory"
	walk_right
# 102 "data/maps/Route22/scripts.pory"
	walk_down
# 103 "data/maps/Route22/scripts.pory"
	walk_down
# 104 "data/maps/Route22/scripts.pory"
	walk_down
# 105 "data/maps/Route22/scripts.pory"
	walk_down
# 106 "data/maps/Route22/scripts.pory"
	walk_down
# 107 "data/maps/Route22/scripts.pory"
	walk_down
# 108 "data/maps/Route22/scripts.pory"
	step_end
# 109 "data/maps/Route22/scripts.pory"

# 110 "data/maps/Route22/scripts.pory"
Route22_Movement_EarlyRivalExitBottom::
# 111 "data/maps/Route22/scripts.pory"
	walk_right
# 112 "data/maps/Route22/scripts.pory"
	walk_right
# 113 "data/maps/Route22/scripts.pory"
	walk_right
# 114 "data/maps/Route22/scripts.pory"
	walk_right
# 115 "data/maps/Route22/scripts.pory"
	walk_down
# 116 "data/maps/Route22/scripts.pory"
	walk_down
# 117 "data/maps/Route22/scripts.pory"
	walk_down
# 118 "data/maps/Route22/scripts.pory"
	walk_down
# 119 "data/maps/Route22/scripts.pory"
	walk_down
# 120 "data/maps/Route22/scripts.pory"
	walk_down
# 121 "data/maps/Route22/scripts.pory"
	walk_down
# 122 "data/maps/Route22/scripts.pory"
	step_end
# 123 "data/maps/Route22/scripts.pory"

# 124 "data/maps/Route22/scripts.pory"
Route22_Movement_RivalApproach::
# 125 "data/maps/Route22/scripts.pory"
	walk_right
# 126 "data/maps/Route22/scripts.pory"
	walk_right
# 127 "data/maps/Route22/scripts.pory"
	walk_right
# 128 "data/maps/Route22/scripts.pory"
	walk_right
# 129 "data/maps/Route22/scripts.pory"
	walk_right
# 130 "data/maps/Route22/scripts.pory"
	walk_right
# 131 "data/maps/Route22/scripts.pory"
	walk_right
# 132 "data/maps/Route22/scripts.pory"
	step_end
# 133 "data/maps/Route22/scripts.pory"

# 134 "data/maps/Route22/scripts.pory"
Route22_Movement_RivalApproachBottom::
# 135 "data/maps/Route22/scripts.pory"
	walk_right
# 136 "data/maps/Route22/scripts.pory"
	walk_right
# 137 "data/maps/Route22/scripts.pory"
	walk_right
# 138 "data/maps/Route22/scripts.pory"
	walk_right
# 139 "data/maps/Route22/scripts.pory"
	walk_right
# 140 "data/maps/Route22/scripts.pory"
	walk_right
# 141 "data/maps/Route22/scripts.pory"
	walk_right
# 142 "data/maps/Route22/scripts.pory"
	walk_right
# 143 "data/maps/Route22/scripts.pory"
	walk_in_place_faster_down
# 144 "data/maps/Route22/scripts.pory"
	step_end
# 145 "data/maps/Route22/scripts.pory"

# 146 "data/maps/Route22/scripts.pory"
Route22_Movement_PlayerFaceRival::
# 147 "data/maps/Route22/scripts.pory"
	delay_16
# 148 "data/maps/Route22/scripts.pory"
	delay_16
# 149 "data/maps/Route22/scripts.pory"
	delay_16
# 150 "data/maps/Route22/scripts.pory"
	delay_16
# 151 "data/maps/Route22/scripts.pory"
	delay_16
# 152 "data/maps/Route22/scripts.pory"
	delay_16
# 153 "data/maps/Route22/scripts.pory"
	delay_16
# 154 "data/maps/Route22/scripts.pory"
	delay_8
# 155 "data/maps/Route22/scripts.pory"
	walk_in_place_faster_up
# 156 "data/maps/Route22/scripts.pory"
	step_end
# 157 "data/maps/Route22/scripts.pory"

# 158 "data/maps/Route22/scripts.pory"
Route22_EventScript_LateRivalTriggerTop::
# 159 "data/maps/Route22/scripts.pory"
	lockall
# 160 "data/maps/Route22/scripts.pory"
	setvar VAR_TEMP_1, 0
# 161 "data/maps/Route22/scripts.pory"
	goto Route22_EventScript_LateRival
# 162 "data/maps/Route22/scripts.pory"
	end
# 163 "data/maps/Route22/scripts.pory"

# 164 "data/maps/Route22/scripts.pory"
Route22_EventScript_LateRivalTriggerMid::
# 165 "data/maps/Route22/scripts.pory"
	lockall
# 166 "data/maps/Route22/scripts.pory"
	setvar VAR_TEMP_1, 1
# 167 "data/maps/Route22/scripts.pory"
	setobjectxyperm LOCALID_RIVAL, 25, 5
# 168 "data/maps/Route22/scripts.pory"
	goto Route22_EventScript_LateRival
# 169 "data/maps/Route22/scripts.pory"
	end
# 170 "data/maps/Route22/scripts.pory"

# 171 "data/maps/Route22/scripts.pory"
Route22_EventScript_LateRivalTriggerBottom::
# 172 "data/maps/Route22/scripts.pory"
	lockall
# 173 "data/maps/Route22/scripts.pory"
	setvar VAR_TEMP_1, 2
# 174 "data/maps/Route22/scripts.pory"
	setobjectxyperm LOCALID_RIVAL, 25, 5
# 175 "data/maps/Route22/scripts.pory"
	goto Route22_EventScript_LateRival
# 176 "data/maps/Route22/scripts.pory"
	end
# 177 "data/maps/Route22/scripts.pory"

# 178 "data/maps/Route22/scripts.pory"
Route22_EventScript_LateRival::
# 179 "data/maps/Route22/scripts.pory"
	textcolor NPC_TEXT_COLOR_MALE
# 180 "data/maps/Route22/scripts.pory"
	playbgm MUS_ENCOUNTER_RIVAL, 0
# 181 "data/maps/Route22/scripts.pory"
	addobject LOCALID_RIVAL
# 182 "data/maps/Route22/scripts.pory"
	call_if_eq VAR_TEMP_1, 0, Route22_EventScript_LateRivalApproach
# 183 "data/maps/Route22/scripts.pory"
	call_if_eq VAR_TEMP_1, 1, Route22_EventScript_LateRivalApproach
# 184 "data/maps/Route22/scripts.pory"
	call_if_eq VAR_TEMP_1, 2, Route22_EventScript_LateRivalApproachBottom
# 185 "data/maps/Route22/scripts.pory"
	msgbox Route22_Text_LateRivalIntro
# 186 "data/maps/Route22/scripts.pory"
	setvar VAR_LAST_TALKED, LOCALID_RIVAL
# 187 "data/maps/Route22/scripts.pory"
	call_if_eq VAR_STARTER_MON, 2, Route22_EventScript_LateRivalSquirtle
# 188 "data/maps/Route22/scripts.pory"
	call_if_eq VAR_STARTER_MON, 1, Route22_EventScript_LateRivalBulbasaur
# 189 "data/maps/Route22/scripts.pory"
	call_if_eq VAR_STARTER_MON, 0, Route22_EventScript_LateRivalCharmander
# 190 "data/maps/Route22/scripts.pory"
	msgbox Route22_Text_LateRivalPostBattle
# 191 "data/maps/Route22/scripts.pory"
	closemessage
# 192 "data/maps/Route22/scripts.pory"
	delay 10
# 193 "data/maps/Route22/scripts.pory"
	playbgm MUS_RIVAL_EXIT, 0
# 194 "data/maps/Route22/scripts.pory"
	applymovement LOCALID_RIVAL, Route22_Movement_LateRivalExit
# 195 "data/maps/Route22/scripts.pory"
	waitmovement 0
# 196 "data/maps/Route22/scripts.pory"
	fadedefaultbgm
# 197 "data/maps/Route22/scripts.pory"
	removeobject LOCALID_RIVAL
# 198 "data/maps/Route22/scripts.pory"
	setvar VAR_MAP_SCENE_ROUTE22, 4
# 199 "data/maps/Route22/scripts.pory"
	releaseall
# 200 "data/maps/Route22/scripts.pory"
	end
# 201 "data/maps/Route22/scripts.pory"

# 202 "data/maps/Route22/scripts.pory"
Route22_EventScript_LateRivalApproach::
# 203 "data/maps/Route22/scripts.pory"
	applymovement LOCALID_RIVAL, Route22_Movement_RivalApproach
# 204 "data/maps/Route22/scripts.pory"
	waitmovement 0
# 205 "data/maps/Route22/scripts.pory"
	return
# 206 "data/maps/Route22/scripts.pory"

# 207 "data/maps/Route22/scripts.pory"
Route22_EventScript_LateRivalApproachBottom::
# 208 "data/maps/Route22/scripts.pory"
	applymovement LOCALID_RIVAL, Route22_Movement_RivalApproachBottom
# 209 "data/maps/Route22/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, Route22_Movement_PlayerFaceRival
# 210 "data/maps/Route22/scripts.pory"
	waitmovement 0
# 211 "data/maps/Route22/scripts.pory"
	return
# 212 "data/maps/Route22/scripts.pory"

# 213 "data/maps/Route22/scripts.pory"
Route22_EventScript_LateRivalSquirtle::
# 214 "data/maps/Route22/scripts.pory"
	trainerbattle_no_intro TRAINER_RIVAL_ROUTE22_LATE_SQUIRTLE, Route22_Text_LateRivalDefeat
# 215 "data/maps/Route22/scripts.pory"
	return
# 216 "data/maps/Route22/scripts.pory"

# 217 "data/maps/Route22/scripts.pory"
Route22_EventScript_LateRivalBulbasaur::
# 218 "data/maps/Route22/scripts.pory"
	trainerbattle_no_intro TRAINER_RIVAL_ROUTE22_LATE_BULBASAUR, Route22_Text_LateRivalDefeat
# 219 "data/maps/Route22/scripts.pory"
	return
# 220 "data/maps/Route22/scripts.pory"

# 221 "data/maps/Route22/scripts.pory"
Route22_EventScript_LateRivalCharmander::
# 222 "data/maps/Route22/scripts.pory"
	trainerbattle_no_intro TRAINER_RIVAL_ROUTE22_LATE_CHARMANDER, Route22_Text_LateRivalDefeat
# 223 "data/maps/Route22/scripts.pory"
	return
# 224 "data/maps/Route22/scripts.pory"

# 225 "data/maps/Route22/scripts.pory"
Route22_Movement_LateRivalExit::
# 226 "data/maps/Route22/scripts.pory"
	walk_left
# 227 "data/maps/Route22/scripts.pory"
	walk_left
# 228 "data/maps/Route22/scripts.pory"
	walk_left
# 229 "data/maps/Route22/scripts.pory"
	walk_left
# 230 "data/maps/Route22/scripts.pory"
	walk_left
# 231 "data/maps/Route22/scripts.pory"
	walk_left
# 232 "data/maps/Route22/scripts.pory"
	walk_left
# 233 "data/maps/Route22/scripts.pory"
	step_end
# 234 "data/maps/Route22/scripts.pory"

# 235 "data/maps/Route22/scripts.pory"
Route22_EventScript_LeagueGateSign::
# 236 "data/maps/Route22/scripts.pory"
	msgbox Route22_Text_LeagueGateSign, MSGBOX_SIGN
# 237 "data/maps/Route22/scripts.pory"
	end
