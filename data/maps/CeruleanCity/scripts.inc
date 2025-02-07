# 1 "data/maps/CeruleanCity/scripts.pory"

# 2 "data/maps/CeruleanCity/scripts.pory"
.set LOCALID_POLICEMAN, 1
# 3 "data/maps/CeruleanCity/scripts.pory"
.set LOCALID_GRUNT,     2
# 4 "data/maps/CeruleanCity/scripts.pory"
.set LOCALID_SLOWBRO,   5
# 5 "data/maps/CeruleanCity/scripts.pory"
.set LOCALID_LASS,      6
# 6 "data/maps/CeruleanCity/scripts.pory"
.set LOCALID_RIVAL,     8
# 7 "data/maps/CeruleanCity/scripts.pory"
.set LOCALID_WOMAN,     11
# 8 "data/maps/CeruleanCity/scripts.pory"

# 9 "data/maps/CeruleanCity/scripts.pory"
CeruleanCity_MapScripts::
# 10 "data/maps/CeruleanCity/scripts.pory"
	map_script MAP_SCRIPT_ON_TRANSITION, CeruleanCity_OnTransition
# 11 "data/maps/CeruleanCity/scripts.pory"
	.byte 0
# 12 "data/maps/CeruleanCity/scripts.pory"

# 13 "data/maps/CeruleanCity/scripts.pory"
CeruleanCity_OnTransition::
# 14 "data/maps/CeruleanCity/scripts.pory"
	setworldmapflag FLAG_WORLD_MAP_CERULEAN_CITY
# 15 "data/maps/CeruleanCity/scripts.pory"
	call_if_unset FLAG_GOT_SS_TICKET, CeruleanCity_EventScript_BlockExits
# 16 "data/maps/CeruleanCity/scripts.pory"
	end
# 17 "data/maps/CeruleanCity/scripts.pory"

# 18 "data/maps/CeruleanCity/scripts.pory"
CeruleanCity_EventScript_BlockExits::
# 19 "data/maps/CeruleanCity/scripts.pory"
	setobjectxyperm LOCALID_POLICEMAN, 30, 12
# 20 "data/maps/CeruleanCity/scripts.pory"
	setobjectxyperm LOCALID_SLOWBRO, 26, 31
# 21 "data/maps/CeruleanCity/scripts.pory"
	setobjectxyperm LOCALID_LASS, 27, 31
# 22 "data/maps/CeruleanCity/scripts.pory"
	return
# 23 "data/maps/CeruleanCity/scripts.pory"

# 24 "data/maps/CeruleanCity/scripts.pory"
CeruleanCity_EventScript_RivalTriggerLeft::
# 25 "data/maps/CeruleanCity/scripts.pory"
	lockall
# 26 "data/maps/CeruleanCity/scripts.pory"
	setvar VAR_TEMP_1, 0
# 27 "data/maps/CeruleanCity/scripts.pory"
	goto CeruleanCity_EventScript_Rival
# 28 "data/maps/CeruleanCity/scripts.pory"
	end
# 29 "data/maps/CeruleanCity/scripts.pory"

# 30 "data/maps/CeruleanCity/scripts.pory"
CeruleanCity_EventScript_RivalTriggerMid::
# 31 "data/maps/CeruleanCity/scripts.pory"
	lockall
# 32 "data/maps/CeruleanCity/scripts.pory"
	setvar VAR_TEMP_1, 1
# 33 "data/maps/CeruleanCity/scripts.pory"
	setobjectxyperm LOCALID_RIVAL, 23, 0
# 34 "data/maps/CeruleanCity/scripts.pory"
	goto CeruleanCity_EventScript_Rival
# 35 "data/maps/CeruleanCity/scripts.pory"
	end
# 36 "data/maps/CeruleanCity/scripts.pory"

# 37 "data/maps/CeruleanCity/scripts.pory"
CeruleanCity_EventScript_RivalTriggerRight::
# 38 "data/maps/CeruleanCity/scripts.pory"
	lockall
# 39 "data/maps/CeruleanCity/scripts.pory"
	setvar VAR_TEMP_1, 2
# 40 "data/maps/CeruleanCity/scripts.pory"
	setobjectxyperm LOCALID_RIVAL, 24, 0
# 41 "data/maps/CeruleanCity/scripts.pory"
	goto CeruleanCity_EventScript_Rival
# 42 "data/maps/CeruleanCity/scripts.pory"
	end
# 43 "data/maps/CeruleanCity/scripts.pory"

# 44 "data/maps/CeruleanCity/scripts.pory"
CeruleanCity_EventScript_Rival::
# 45 "data/maps/CeruleanCity/scripts.pory"
	textcolor NPC_TEXT_COLOR_MALE
# 46 "data/maps/CeruleanCity/scripts.pory"
	setvar VAR_MAP_SCENE_ROUTE22, 2
# 47 "data/maps/CeruleanCity/scripts.pory"
	playbgm MUS_ENCOUNTER_RIVAL, 0
# 48 "data/maps/CeruleanCity/scripts.pory"
	addobject LOCALID_RIVAL
# 49 "data/maps/CeruleanCity/scripts.pory"
	applymovement LOCALID_RIVAL, CeruleanCity_Movement_RivalEnter
# 50 "data/maps/CeruleanCity/scripts.pory"
	waitmovement 0
# 51 "data/maps/CeruleanCity/scripts.pory"
	msgbox CeruleanCity_Text_RivalIntro
# 52 "data/maps/CeruleanCity/scripts.pory"
	setvar VAR_LAST_TALKED, LOCALID_RIVAL
# 53 "data/maps/CeruleanCity/scripts.pory"
	call_if_eq VAR_STARTER_MON, 2, CeruleanCity_EventScript_RivalSquirtle
# 54 "data/maps/CeruleanCity/scripts.pory"
	call_if_eq VAR_STARTER_MON, 1, CeruleanCity_EventScript_RivalBulbasaur
# 55 "data/maps/CeruleanCity/scripts.pory"
	call_if_eq VAR_STARTER_MON, 0, CeruleanCity_EventScript_RivalCharmander
# 56 "data/maps/CeruleanCity/scripts.pory"
	famechecker FAMECHECKER_BILL, 0
# 57 "data/maps/CeruleanCity/scripts.pory"
	msgbox CeruleanCity_Text_RivalPostBattle
# 58 "data/maps/CeruleanCity/scripts.pory"
	closemessage
# 59 "data/maps/CeruleanCity/scripts.pory"
	playbgm MUS_RIVAL_EXIT, 0
# 60 "data/maps/CeruleanCity/scripts.pory"
	call_if_eq VAR_TEMP_1, 0, CeruleanCity_EventScript_RivalStartExit
# 61 "data/maps/CeruleanCity/scripts.pory"
	call_if_eq VAR_TEMP_1, 1, CeruleanCity_EventScript_RivalStartExit
# 62 "data/maps/CeruleanCity/scripts.pory"
	call_if_eq VAR_TEMP_1, 2, CeruleanCity_EventScript_RivalStartExitRight
# 63 "data/maps/CeruleanCity/scripts.pory"
	msgbox CeruleanCity_Text_OhRightLittlePresentAsFavor
# 64 "data/maps/CeruleanCity/scripts.pory"
	setvar VAR_MAP_SCENE_CERULEAN_CITY_RIVAL, 1
# 65 "data/maps/CeruleanCity/scripts.pory"
	setflag FLAG_GOT_FAME_CHECKER
# 66 "data/maps/CeruleanCity/scripts.pory"
	giveitem ITEM_FAME_CHECKER
# 67 "data/maps/CeruleanCity/scripts.pory"
	msgbox CeruleanCity_Text_ExplainFameCheckerSmellYa
# 68 "data/maps/CeruleanCity/scripts.pory"
	closemessage
# 69 "data/maps/CeruleanCity/scripts.pory"
	applymovement LOCALID_RIVAL, CeruleanCity_Movement_RivalExit
# 70 "data/maps/CeruleanCity/scripts.pory"
	waitmovement 0
# 71 "data/maps/CeruleanCity/scripts.pory"
	fadedefaultbgm
# 72 "data/maps/CeruleanCity/scripts.pory"
	removeobject LOCALID_RIVAL
# 73 "data/maps/CeruleanCity/scripts.pory"
	releaseall
# 74 "data/maps/CeruleanCity/scripts.pory"
	end
# 75 "data/maps/CeruleanCity/scripts.pory"

# 76 "data/maps/CeruleanCity/scripts.pory"
CeruleanCity_EventScript_RivalSquirtle::
# 77 "data/maps/CeruleanCity/scripts.pory"
	trainerbattle_no_intro TRAINER_RIVAL_CERULEAN_SQUIRTLE, CeruleanCity_Text_RivalDefeat
# 78 "data/maps/CeruleanCity/scripts.pory"
	return
# 79 "data/maps/CeruleanCity/scripts.pory"

# 80 "data/maps/CeruleanCity/scripts.pory"
CeruleanCity_EventScript_RivalBulbasaur::
# 81 "data/maps/CeruleanCity/scripts.pory"
	trainerbattle_no_intro TRAINER_RIVAL_CERULEAN_BULBASAUR, CeruleanCity_Text_RivalDefeat
# 82 "data/maps/CeruleanCity/scripts.pory"
	return
# 83 "data/maps/CeruleanCity/scripts.pory"

# 84 "data/maps/CeruleanCity/scripts.pory"
CeruleanCity_EventScript_RivalCharmander::
# 85 "data/maps/CeruleanCity/scripts.pory"
	trainerbattle_no_intro TRAINER_RIVAL_CERULEAN_CHARMANDER, CeruleanCity_Text_RivalDefeat
# 86 "data/maps/CeruleanCity/scripts.pory"
	return
# 87 "data/maps/CeruleanCity/scripts.pory"

# 88 "data/maps/CeruleanCity/scripts.pory"
CeruleanCity_EventScript_RivalStartExit::
# 89 "data/maps/CeruleanCity/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, CeruleanCity_Movement_PlayerWatchRivalExit
# 90 "data/maps/CeruleanCity/scripts.pory"
	applymovement LOCALID_RIVAL, CeruleanCity_Movement_RivalStartExit
# 91 "data/maps/CeruleanCity/scripts.pory"
	waitmovement 0
# 92 "data/maps/CeruleanCity/scripts.pory"
	return
# 93 "data/maps/CeruleanCity/scripts.pory"

# 94 "data/maps/CeruleanCity/scripts.pory"
CeruleanCity_EventScript_RivalStartExitRight::
# 95 "data/maps/CeruleanCity/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, CeruleanCity_Movement_PlayerWatchRivalExitRight
# 96 "data/maps/CeruleanCity/scripts.pory"
	applymovement LOCALID_RIVAL, CeruleanCity_Movement_RivalStartExitRight
# 97 "data/maps/CeruleanCity/scripts.pory"
	waitmovement 0
# 98 "data/maps/CeruleanCity/scripts.pory"
	return
# 99 "data/maps/CeruleanCity/scripts.pory"

# 100 "data/maps/CeruleanCity/scripts.pory"
CeruleanCity_Movement_PlayerWatchRivalExit::
# 101 "data/maps/CeruleanCity/scripts.pory"
	delay_16
# 102 "data/maps/CeruleanCity/scripts.pory"
	delay_8
# 103 "data/maps/CeruleanCity/scripts.pory"
	walk_in_place_faster_right
# 104 "data/maps/CeruleanCity/scripts.pory"
	delay_16
# 105 "data/maps/CeruleanCity/scripts.pory"
	walk_in_place_faster_down
# 106 "data/maps/CeruleanCity/scripts.pory"
	step_end
# 107 "data/maps/CeruleanCity/scripts.pory"

# 108 "data/maps/CeruleanCity/scripts.pory"
CeruleanCity_Movement_PlayerWatchRivalExitRight::
# 109 "data/maps/CeruleanCity/scripts.pory"
	delay_16
# 110 "data/maps/CeruleanCity/scripts.pory"
	delay_8
# 111 "data/maps/CeruleanCity/scripts.pory"
	walk_in_place_faster_left
# 112 "data/maps/CeruleanCity/scripts.pory"
	delay_16
# 113 "data/maps/CeruleanCity/scripts.pory"
	walk_in_place_faster_down
# 114 "data/maps/CeruleanCity/scripts.pory"
	step_end
# 115 "data/maps/CeruleanCity/scripts.pory"

# 116 "data/maps/CeruleanCity/scripts.pory"
CeruleanCity_Movement_RivalEnter::
# 117 "data/maps/CeruleanCity/scripts.pory"
	walk_down
# 118 "data/maps/CeruleanCity/scripts.pory"
	walk_down
# 119 "data/maps/CeruleanCity/scripts.pory"
	walk_down
# 120 "data/maps/CeruleanCity/scripts.pory"
	walk_down
# 121 "data/maps/CeruleanCity/scripts.pory"
	walk_down
# 122 "data/maps/CeruleanCity/scripts.pory"
	step_end
# 123 "data/maps/CeruleanCity/scripts.pory"

# 124 "data/maps/CeruleanCity/scripts.pory"
CeruleanCity_Movement_RivalStartExit::
# 125 "data/maps/CeruleanCity/scripts.pory"
	walk_right
# 126 "data/maps/CeruleanCity/scripts.pory"
	walk_down
# 127 "data/maps/CeruleanCity/scripts.pory"
	walk_down
# 128 "data/maps/CeruleanCity/scripts.pory"
	walk_down
# 129 "data/maps/CeruleanCity/scripts.pory"
	walk_down
# 130 "data/maps/CeruleanCity/scripts.pory"
	walk_down
# 131 "data/maps/CeruleanCity/scripts.pory"
	walk_down
# 132 "data/maps/CeruleanCity/scripts.pory"
	walk_down
# 133 "data/maps/CeruleanCity/scripts.pory"
	delay_16
# 134 "data/maps/CeruleanCity/scripts.pory"
	delay_16
# 135 "data/maps/CeruleanCity/scripts.pory"
	walk_left
# 136 "data/maps/CeruleanCity/scripts.pory"
	walk_up
# 137 "data/maps/CeruleanCity/scripts.pory"
	walk_up
# 138 "data/maps/CeruleanCity/scripts.pory"
	walk_up
# 139 "data/maps/CeruleanCity/scripts.pory"
	walk_up
# 140 "data/maps/CeruleanCity/scripts.pory"
	walk_up
# 141 "data/maps/CeruleanCity/scripts.pory"
	step_end
# 142 "data/maps/CeruleanCity/scripts.pory"

# 143 "data/maps/CeruleanCity/scripts.pory"
CeruleanCity_Movement_RivalStartExitRight::
# 144 "data/maps/CeruleanCity/scripts.pory"
	walk_left
# 145 "data/maps/CeruleanCity/scripts.pory"
	walk_down
# 146 "data/maps/CeruleanCity/scripts.pory"
	walk_down
# 147 "data/maps/CeruleanCity/scripts.pory"
	walk_down
# 148 "data/maps/CeruleanCity/scripts.pory"
	walk_down
# 149 "data/maps/CeruleanCity/scripts.pory"
	walk_down
# 150 "data/maps/CeruleanCity/scripts.pory"
	walk_down
# 151 "data/maps/CeruleanCity/scripts.pory"
	walk_down
# 152 "data/maps/CeruleanCity/scripts.pory"
	delay_16
# 153 "data/maps/CeruleanCity/scripts.pory"
	delay_16
# 154 "data/maps/CeruleanCity/scripts.pory"
	walk_right
# 155 "data/maps/CeruleanCity/scripts.pory"
	walk_up
# 156 "data/maps/CeruleanCity/scripts.pory"
	walk_up
# 157 "data/maps/CeruleanCity/scripts.pory"
	walk_up
# 158 "data/maps/CeruleanCity/scripts.pory"
	walk_up
# 159 "data/maps/CeruleanCity/scripts.pory"
	walk_up
# 160 "data/maps/CeruleanCity/scripts.pory"
	step_end
# 161 "data/maps/CeruleanCity/scripts.pory"

# 162 "data/maps/CeruleanCity/scripts.pory"
CeruleanCity_Movement_RivalExit::
# 163 "data/maps/CeruleanCity/scripts.pory"
	walk_down
# 164 "data/maps/CeruleanCity/scripts.pory"
	walk_down
# 165 "data/maps/CeruleanCity/scripts.pory"
	walk_down
# 166 "data/maps/CeruleanCity/scripts.pory"
	walk_down
# 167 "data/maps/CeruleanCity/scripts.pory"
	walk_down
# 168 "data/maps/CeruleanCity/scripts.pory"
	walk_down
# 169 "data/maps/CeruleanCity/scripts.pory"
	walk_down
# 170 "data/maps/CeruleanCity/scripts.pory"
	step_end
# 171 "data/maps/CeruleanCity/scripts.pory"

# 172 "data/maps/CeruleanCity/scripts.pory"
CeruleanCity_EventScript_Grunt::
# 173 "data/maps/CeruleanCity/scripts.pory"
	lock
# 174 "data/maps/CeruleanCity/scripts.pory"
	faceplayer
# 175 "data/maps/CeruleanCity/scripts.pory"
	goto_if_defeated TRAINER_TEAM_ROCKET_GRUNT_5, CeruleanCity_EventScript_GruntDefeated
# 176 "data/maps/CeruleanCity/scripts.pory"
	message CeruleanCity_Text_GruntIntro
# 177 "data/maps/CeruleanCity/scripts.pory"
	waitmessage
# 178 "data/maps/CeruleanCity/scripts.pory"
	playbgm MUS_ENCOUNTER_ROCKET, 0
# 179 "data/maps/CeruleanCity/scripts.pory"
	waitbuttonpress
# 180 "data/maps/CeruleanCity/scripts.pory"
	trainerbattle_no_intro TRAINER_TEAM_ROCKET_GRUNT_5, CeruleanCity_Text_GruntDefeat
# 181 "data/maps/CeruleanCity/scripts.pory"
	setvar VAR_MAP_SCENE_CERULEAN_CITY_ROCKET, 1
# 182 "data/maps/CeruleanCity/scripts.pory"
	goto CeruleanCity_EventScript_GruntDefeated
# 183 "data/maps/CeruleanCity/scripts.pory"
	end
# 184 "data/maps/CeruleanCity/scripts.pory"

# 185 "data/maps/CeruleanCity/scripts.pory"
CeruleanCity_EventScript_GruntDefeated::
# 186 "data/maps/CeruleanCity/scripts.pory"
	msgbox CeruleanCity_Text_OkayIllReturnStolenTM
# 187 "data/maps/CeruleanCity/scripts.pory"
	checkitemspace ITEM_TM28
# 188 "data/maps/CeruleanCity/scripts.pory"
	goto_if_eq VAR_RESULT, FALSE, CeruleanCity_EventScript_NoRoomForTM28
# 189 "data/maps/CeruleanCity/scripts.pory"
	giveitem_msg CeruleanCity_Text_RecoveredTM28FromGrunt, ITEM_TM28
# 190 "data/maps/CeruleanCity/scripts.pory"
	msgbox CeruleanCity_Text_BetterGetMovingBye
# 191 "data/maps/CeruleanCity/scripts.pory"
	closemessage
# 192 "data/maps/CeruleanCity/scripts.pory"
	fadescreen FADE_TO_BLACK
# 193 "data/maps/CeruleanCity/scripts.pory"
	removeobject LOCALID_GRUNT
# 194 "data/maps/CeruleanCity/scripts.pory"
	fadescreen FADE_FROM_BLACK
# 195 "data/maps/CeruleanCity/scripts.pory"
	setflag FLAG_GOT_TM28_FROM_ROCKET
# 196 "data/maps/CeruleanCity/scripts.pory"
	release
# 197 "data/maps/CeruleanCity/scripts.pory"
	end
# 198 "data/maps/CeruleanCity/scripts.pory"

# 199 "data/maps/CeruleanCity/scripts.pory"
CeruleanCity_EventScript_NoRoomForTM28::
# 200 "data/maps/CeruleanCity/scripts.pory"
	textcolor NPC_TEXT_COLOR_MALE
# 201 "data/maps/CeruleanCity/scripts.pory"
	msgbox CeruleanCity_Text_MakeRoomForThisCantRun
# 202 "data/maps/CeruleanCity/scripts.pory"
	release
# 203 "data/maps/CeruleanCity/scripts.pory"
	end
# 204 "data/maps/CeruleanCity/scripts.pory"

# 205 "data/maps/CeruleanCity/scripts.pory"
CeruleanCity_EventScript_GruntTriggerTop::
# 206 "data/maps/CeruleanCity/scripts.pory"
	lockall
# 207 "data/maps/CeruleanCity/scripts.pory"
	setvar VAR_TEMP_1, 0
# 208 "data/maps/CeruleanCity/scripts.pory"
	applymovement LOCALID_GRUNT, Common_Movement_WalkInPlaceFasterUp
# 209 "data/maps/CeruleanCity/scripts.pory"
	waitmovement 0
# 210 "data/maps/CeruleanCity/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, Common_Movement_WalkInPlaceFasterDown
# 211 "data/maps/CeruleanCity/scripts.pory"
	waitmovement 0
# 212 "data/maps/CeruleanCity/scripts.pory"
	goto CeruleanCity_EventScript_GruntTrigger
# 213 "data/maps/CeruleanCity/scripts.pory"
	end
# 214 "data/maps/CeruleanCity/scripts.pory"

# 215 "data/maps/CeruleanCity/scripts.pory"
CeruleanCity_EventScript_GruntTriggerBottom::
# 216 "data/maps/CeruleanCity/scripts.pory"
	lockall
# 217 "data/maps/CeruleanCity/scripts.pory"
	setvar VAR_TEMP_1, 1
# 218 "data/maps/CeruleanCity/scripts.pory"
	applymovement LOCALID_GRUNT, Common_Movement_WalkInPlaceFasterDown
# 219 "data/maps/CeruleanCity/scripts.pory"
	waitmovement 0
# 220 "data/maps/CeruleanCity/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, Common_Movement_WalkInPlaceFasterUp
# 221 "data/maps/CeruleanCity/scripts.pory"
	waitmovement 0
# 222 "data/maps/CeruleanCity/scripts.pory"
	goto CeruleanCity_EventScript_GruntTrigger
# 223 "data/maps/CeruleanCity/scripts.pory"
	end
# 224 "data/maps/CeruleanCity/scripts.pory"

# 225 "data/maps/CeruleanCity/scripts.pory"
CeruleanCity_EventScript_GruntTrigger::
# 226 "data/maps/CeruleanCity/scripts.pory"
	textcolor NPC_TEXT_COLOR_MALE
# 227 "data/maps/CeruleanCity/scripts.pory"
	msgbox CeruleanCity_Text_GruntIntro
# 228 "data/maps/CeruleanCity/scripts.pory"
	setvar VAR_LAST_TALKED, LOCALID_GRUNT
# 229 "data/maps/CeruleanCity/scripts.pory"
	trainerbattle_no_intro TRAINER_TEAM_ROCKET_GRUNT_5, CeruleanCity_Text_GruntDefeat
# 230 "data/maps/CeruleanCity/scripts.pory"
	setvar VAR_MAP_SCENE_CERULEAN_CITY_ROCKET, 1
# 231 "data/maps/CeruleanCity/scripts.pory"
	goto CeruleanCity_EventScript_GruntDefeated
# 232 "data/maps/CeruleanCity/scripts.pory"
	end
# 233 "data/maps/CeruleanCity/scripts.pory"

# 234 "data/maps/CeruleanCity/scripts.pory"
CeruleanCity_EventScript_Policeman::
# 235 "data/maps/CeruleanCity/scripts.pory"
	lock
# 236 "data/maps/CeruleanCity/scripts.pory"
	faceplayer
# 237 "data/maps/CeruleanCity/scripts.pory"
	msgbox CeruleanCity_Text_PeopleHereWereRobbed
# 238 "data/maps/CeruleanCity/scripts.pory"
	closemessage
# 239 "data/maps/CeruleanCity/scripts.pory"
	applymovement LOCALID_POLICEMAN, Common_Movement_FaceOriginalDirection
# 240 "data/maps/CeruleanCity/scripts.pory"
	waitmovement 0
# 241 "data/maps/CeruleanCity/scripts.pory"
	release
# 242 "data/maps/CeruleanCity/scripts.pory"
	end
# 243 "data/maps/CeruleanCity/scripts.pory"

# 244 "data/maps/CeruleanCity/scripts.pory"
CeruleanCity_EventScript_LittleBoy::
# 245 "data/maps/CeruleanCity/scripts.pory"
	lock
# 246 "data/maps/CeruleanCity/scripts.pory"
	faceplayer
# 247 "data/maps/CeruleanCity/scripts.pory"
	goto_if_set FLAG_GOT_SS_TICKET, CeruleanCity_EventScript_LittleBoySlowbroMoved
# 248 "data/maps/CeruleanCity/scripts.pory"
	msgbox CeruleanCity_Text_IfSlowbroWasntThereCouldCutTree
# 249 "data/maps/CeruleanCity/scripts.pory"
	release
# 250 "data/maps/CeruleanCity/scripts.pory"
	end
# 251 "data/maps/CeruleanCity/scripts.pory"

# 252 "data/maps/CeruleanCity/scripts.pory"
CeruleanCity_EventScript_LittleBoySlowbroMoved::
# 253 "data/maps/CeruleanCity/scripts.pory"
	msgbox CeruleanCity_Text_YouCanCutDownSmallTrees
# 254 "data/maps/CeruleanCity/scripts.pory"
	release
# 255 "data/maps/CeruleanCity/scripts.pory"
	end
# 256 "data/maps/CeruleanCity/scripts.pory"

# 257 "data/maps/CeruleanCity/scripts.pory"
CeruleanCity_EventScript_BaldingMan::
# 258 "data/maps/CeruleanCity/scripts.pory"
	msgbox CeruleanCity_Text_PokemonEncyclopediaAmusing, MSGBOX_NPC
# 259 "data/maps/CeruleanCity/scripts.pory"
	end
# 260 "data/maps/CeruleanCity/scripts.pory"

# 261 "data/maps/CeruleanCity/scripts.pory"
CeruleanCity_EventScript_Youngster::
# 262 "data/maps/CeruleanCity/scripts.pory"
	msgbox CeruleanCity_Text_TrainerLifeIsToughIsntIt, MSGBOX_NPC
# 263 "data/maps/CeruleanCity/scripts.pory"
	end
# 264 "data/maps/CeruleanCity/scripts.pory"

# 265 "data/maps/CeruleanCity/scripts.pory"
CeruleanCity_EventScript_CeruleanCaveGuard::
# 266 "data/maps/CeruleanCity/scripts.pory"
	msgbox CeruleanCity_Text_ThisIsCeruleanCave, MSGBOX_NPC
# 267 "data/maps/CeruleanCity/scripts.pory"
	end
# 268 "data/maps/CeruleanCity/scripts.pory"

# 269 "data/maps/CeruleanCity/scripts.pory"
CeruleanCity_EventScript_Woman::
# 270 "data/maps/CeruleanCity/scripts.pory"
	lock
# 271 "data/maps/CeruleanCity/scripts.pory"
	faceplayer
# 272 "data/maps/CeruleanCity/scripts.pory"
	msgbox CeruleanCity_Text_WantBrightRedBicycle
# 273 "data/maps/CeruleanCity/scripts.pory"
	closemessage
# 274 "data/maps/CeruleanCity/scripts.pory"
	applymovement LOCALID_WOMAN, Common_Movement_FaceOriginalDirection
# 275 "data/maps/CeruleanCity/scripts.pory"
	waitmovement 0
# 276 "data/maps/CeruleanCity/scripts.pory"
	release
# 277 "data/maps/CeruleanCity/scripts.pory"
	end
# 278 "data/maps/CeruleanCity/scripts.pory"

# 279 "data/maps/CeruleanCity/scripts.pory"
CeruleanCity_EventScript_Lass::
# 280 "data/maps/CeruleanCity/scripts.pory"
	lock
# 281 "data/maps/CeruleanCity/scripts.pory"
	random 3
# 282 "data/maps/CeruleanCity/scripts.pory"
	copyvar VAR_0x8008, VAR_RESULT
# 283 "data/maps/CeruleanCity/scripts.pory"
	call_if_eq VAR_0x8008, 0, CeruleanCity_EventScript_SlowbroCommand1
# 284 "data/maps/CeruleanCity/scripts.pory"
	call_if_eq VAR_0x8008, 1, CeruleanCity_EventScript_SlowbroCommand2
# 285 "data/maps/CeruleanCity/scripts.pory"
	call_if_eq VAR_0x8008, 2, CeruleanCity_EventScript_SlowbroCommand3
# 286 "data/maps/CeruleanCity/scripts.pory"
	waitmessage
# 287 "data/maps/CeruleanCity/scripts.pory"
	delay 40
# 288 "data/maps/CeruleanCity/scripts.pory"
	playse SE_PIN
# 289 "data/maps/CeruleanCity/scripts.pory"
	applymovement LOCALID_SLOWBRO, Common_Movement_QuestionMark
# 290 "data/maps/CeruleanCity/scripts.pory"
	waitmovement 0
# 291 "data/maps/CeruleanCity/scripts.pory"
	delay 30
# 292 "data/maps/CeruleanCity/scripts.pory"
	call_if_eq VAR_0x8008, 0, CeruleanCity_EventScript_SlowbroFailed1
# 293 "data/maps/CeruleanCity/scripts.pory"
	call_if_eq VAR_0x8008, 1, CeruleanCity_EventScript_SlowbroFailed2
# 294 "data/maps/CeruleanCity/scripts.pory"
	call_if_eq VAR_0x8008, 2, CeruleanCity_EventScript_SlowbroFailed3
# 295 "data/maps/CeruleanCity/scripts.pory"
	release
# 296 "data/maps/CeruleanCity/scripts.pory"
	end
# 297 "data/maps/CeruleanCity/scripts.pory"

# 298 "data/maps/CeruleanCity/scripts.pory"
CeruleanCity_EventScript_SlowbroCommand1::
# 299 "data/maps/CeruleanCity/scripts.pory"
	message CeruleanCity_Text_SlowbroUseSonicboom
# 300 "data/maps/CeruleanCity/scripts.pory"
	return
# 301 "data/maps/CeruleanCity/scripts.pory"

# 302 "data/maps/CeruleanCity/scripts.pory"
CeruleanCity_EventScript_SlowbroCommand2::
# 303 "data/maps/CeruleanCity/scripts.pory"
	message CeruleanCity_Text_SlowbroPunch
# 304 "data/maps/CeruleanCity/scripts.pory"
	return
# 305 "data/maps/CeruleanCity/scripts.pory"

# 306 "data/maps/CeruleanCity/scripts.pory"
CeruleanCity_EventScript_SlowbroCommand3::
# 307 "data/maps/CeruleanCity/scripts.pory"
	message CeruleanCity_Text_SlowbroWithdraw
# 308 "data/maps/CeruleanCity/scripts.pory"
	return
# 309 "data/maps/CeruleanCity/scripts.pory"

# 310 "data/maps/CeruleanCity/scripts.pory"
CeruleanCity_EventScript_SlowbroFailed1::
# 311 "data/maps/CeruleanCity/scripts.pory"
	msgbox CeruleanCity_Text_SlowbroPayAttention
# 312 "data/maps/CeruleanCity/scripts.pory"
	return
# 313 "data/maps/CeruleanCity/scripts.pory"

# 314 "data/maps/CeruleanCity/scripts.pory"
CeruleanCity_EventScript_SlowbroFailed2::
# 315 "data/maps/CeruleanCity/scripts.pory"
	msgbox CeruleanCity_Text_NoYouBlewItAgain
# 316 "data/maps/CeruleanCity/scripts.pory"
	return
# 317 "data/maps/CeruleanCity/scripts.pory"

# 318 "data/maps/CeruleanCity/scripts.pory"
CeruleanCity_EventScript_SlowbroFailed3::
# 319 "data/maps/CeruleanCity/scripts.pory"
	msgbox CeruleanCity_Text_HardToControlMonsObedience
# 320 "data/maps/CeruleanCity/scripts.pory"
	return
# 321 "data/maps/CeruleanCity/scripts.pory"

# 322 "data/maps/CeruleanCity/scripts.pory"
CeruleanCity_EventScript_Slowbro::
# 323 "data/maps/CeruleanCity/scripts.pory"
	lock
# 324 "data/maps/CeruleanCity/scripts.pory"
	random 4
# 325 "data/maps/CeruleanCity/scripts.pory"
	copyvar VAR_0x8008, VAR_RESULT
# 326 "data/maps/CeruleanCity/scripts.pory"
	call_if_eq VAR_0x8008, 0, CeruleanCity_EventScript_SlowbroText1
# 327 "data/maps/CeruleanCity/scripts.pory"
	call_if_eq VAR_0x8008, 1, CeruleanCity_EventScript_SlowbroText2
# 328 "data/maps/CeruleanCity/scripts.pory"
	call_if_eq VAR_0x8008, 2, CeruleanCity_EventScript_SlowbroText3
# 329 "data/maps/CeruleanCity/scripts.pory"
	call_if_eq VAR_0x8008, 3, CeruleanCity_EventScript_SlowbroText4
# 330 "data/maps/CeruleanCity/scripts.pory"
	release
# 331 "data/maps/CeruleanCity/scripts.pory"
	end
# 332 "data/maps/CeruleanCity/scripts.pory"

# 333 "data/maps/CeruleanCity/scripts.pory"
CeruleanCity_EventScript_SlowbroText1::
# 334 "data/maps/CeruleanCity/scripts.pory"
	msgbox CeruleanCity_Text_SlowbroTookSnooze
# 335 "data/maps/CeruleanCity/scripts.pory"
	return
# 336 "data/maps/CeruleanCity/scripts.pory"

# 337 "data/maps/CeruleanCity/scripts.pory"
CeruleanCity_EventScript_SlowbroText2::
# 338 "data/maps/CeruleanCity/scripts.pory"
	msgbox CeruleanCity_Text_SlowbroLoafingAround
# 339 "data/maps/CeruleanCity/scripts.pory"
	return
# 340 "data/maps/CeruleanCity/scripts.pory"

# 341 "data/maps/CeruleanCity/scripts.pory"
CeruleanCity_EventScript_SlowbroText3::
# 342 "data/maps/CeruleanCity/scripts.pory"
	msgbox CeruleanCity_Text_SlowbroTurnedAway
# 343 "data/maps/CeruleanCity/scripts.pory"
	return
# 344 "data/maps/CeruleanCity/scripts.pory"

# 345 "data/maps/CeruleanCity/scripts.pory"
CeruleanCity_EventScript_SlowbroText4::
# 346 "data/maps/CeruleanCity/scripts.pory"
	msgbox CeruleanCity_Text_SlowbroIgnoredOrders
# 347 "data/maps/CeruleanCity/scripts.pory"
	return
# 348 "data/maps/CeruleanCity/scripts.pory"

# 349 "data/maps/CeruleanCity/scripts.pory"
CeruleanCity_EventScript_CitySign::
# 350 "data/maps/CeruleanCity/scripts.pory"
	msgbox CeruleanCity_Text_CitySign, MSGBOX_SIGN
# 351 "data/maps/CeruleanCity/scripts.pory"
	end
# 352 "data/maps/CeruleanCity/scripts.pory"

# 353 "data/maps/CeruleanCity/scripts.pory"
CeruleanCity_EventScript_TrainerTips::
# 354 "data/maps/CeruleanCity/scripts.pory"
	msgbox CeruleanCity_Text_TrainerTipsHeldItems, MSGBOX_SIGN
# 355 "data/maps/CeruleanCity/scripts.pory"
	end
# 356 "data/maps/CeruleanCity/scripts.pory"

# 357 "data/maps/CeruleanCity/scripts.pory"
CeruleanCity_EventScript_BikeShopSign::
# 358 "data/maps/CeruleanCity/scripts.pory"
	msgbox CeruleanCity_Text_BikeShopSign, MSGBOX_SIGN
# 359 "data/maps/CeruleanCity/scripts.pory"
	end
# 360 "data/maps/CeruleanCity/scripts.pory"

# 361 "data/maps/CeruleanCity/scripts.pory"
CeruleanCity_EventScript_GymSign::
# 362 "data/maps/CeruleanCity/scripts.pory"
	lockall
# 363 "data/maps/CeruleanCity/scripts.pory"
	famechecker FAMECHECKER_MISTY, 0
# 364 "data/maps/CeruleanCity/scripts.pory"
	msgbox CeruleanCity_Text_GymSign
# 365 "data/maps/CeruleanCity/scripts.pory"
	releaseall
# 366 "data/maps/CeruleanCity/scripts.pory"
	end
