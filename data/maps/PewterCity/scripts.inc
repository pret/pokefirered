# 1 "data/maps/PewterCity/scripts.pory"

# 2 "data/maps/PewterCity/scripts.pory"
.equ LOCALID_MUSEUM_GUIDE, 2
# 3 "data/maps/PewterCity/scripts.pory"
.equ LOCALID_GYM_GUIDE,    5
# 4 "data/maps/PewterCity/scripts.pory"
.equ LOCALID_AIDE,         7
# 5 "data/maps/PewterCity/scripts.pory"

# 6 "data/maps/PewterCity/scripts.pory"
PewterCity_MapScripts::
# 7 "data/maps/PewterCity/scripts.pory"
	map_script MAP_SCRIPT_ON_TRANSITION, PewterCity_OnTransition
# 8 "data/maps/PewterCity/scripts.pory"
	.byte 0
# 9 "data/maps/PewterCity/scripts.pory"

# 10 "data/maps/PewterCity/scripts.pory"
PewterCity_OnTransition::
# 11 "data/maps/PewterCity/scripts.pory"
	setworldmapflag FLAG_WORLD_MAP_PEWTER_CITY
# 12 "data/maps/PewterCity/scripts.pory"
	setvar VAR_MAP_SCENE_PEWTER_CITY_MUSEUM_1F, 0
# 13 "data/maps/PewterCity/scripts.pory"
	end
# 14 "data/maps/PewterCity/scripts.pory"

# 15 "data/maps/PewterCity/scripts.pory"
@ Impossible to speak to this NPC from a facing dir != DIR_EAST normally, so they arent checked
# 16 "data/maps/PewterCity/scripts.pory"
@ Additionally, no movement script exists for facing DIR_SOUTH, which would necessitate walking out of bounds
# 17 "data/maps/PewterCity/scripts.pory"
PewterCity_EventScript_GymGuide::
# 18 "data/maps/PewterCity/scripts.pory"
	lock
# 19 "data/maps/PewterCity/scripts.pory"
	faceplayer
# 20 "data/maps/PewterCity/scripts.pory"
	msgbox PewterCity_Text_BrocksLookingForChallengersFollowMe
# 21 "data/maps/PewterCity/scripts.pory"
	closemessage
# 22 "data/maps/PewterCity/scripts.pory"
	playbgm MUS_FOLLOW_ME, 0
# 23 "data/maps/PewterCity/scripts.pory"
	call_if_eq VAR_FACING, DIR_EAST, PewterCity_EventScript_WalkToGymEast
# 24 "data/maps/PewterCity/scripts.pory"
	msgbox PewterCity_Text_GoTakeOnBrock
# 25 "data/maps/PewterCity/scripts.pory"
	closemessage
# 26 "data/maps/PewterCity/scripts.pory"
	applymovement LOCALID_GYM_GUIDE, PewterCity_Movement_GymGuideExit
# 27 "data/maps/PewterCity/scripts.pory"
	waitmovement 0
# 28 "data/maps/PewterCity/scripts.pory"
	fadedefaultbgm
# 29 "data/maps/PewterCity/scripts.pory"
	removeobject LOCALID_GYM_GUIDE
# 30 "data/maps/PewterCity/scripts.pory"
	clearflag FLAG_HIDE_PEWTER_CITY_GYM_GUIDE
# 31 "data/maps/PewterCity/scripts.pory"
	release
# 32 "data/maps/PewterCity/scripts.pory"
	end
# 33 "data/maps/PewterCity/scripts.pory"

# 34 "data/maps/PewterCity/scripts.pory"
PewterCity_EventScript_WalkToGymEast::
# 35 "data/maps/PewterCity/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, PewterCity_Movement_PlayerWaitForGuideEast
# 36 "data/maps/PewterCity/scripts.pory"
	applymovement LOCALID_GYM_GUIDE, PewterCity_Movement_GuideMoveToLeadEast
# 37 "data/maps/PewterCity/scripts.pory"
	waitmovement 0
# 38 "data/maps/PewterCity/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, PewterCity_Movement_PlayerWalkToGymEast
# 39 "data/maps/PewterCity/scripts.pory"
	applymovement LOCALID_GYM_GUIDE, PewterCity_Movement_GuideWalkToGymEast
# 40 "data/maps/PewterCity/scripts.pory"
	waitmovement 0
# 41 "data/maps/PewterCity/scripts.pory"
	return
# 42 "data/maps/PewterCity/scripts.pory"

# 43 "data/maps/PewterCity/scripts.pory"
@ Unused
# 44 "data/maps/PewterCity/scripts.pory"
PewterCity_EventScript_WalkToGymWest::
# 45 "data/maps/PewterCity/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, PewterCity_Movement_PlayerWaitForGuideWest
# 46 "data/maps/PewterCity/scripts.pory"
	applymovement LOCALID_GYM_GUIDE, PewterCity_Movement_GuideMoveToLeadWest
# 47 "data/maps/PewterCity/scripts.pory"
	waitmovement 0
# 48 "data/maps/PewterCity/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, PewterCity_Movement_PlayerWalkToGymWest
# 49 "data/maps/PewterCity/scripts.pory"
	applymovement LOCALID_GYM_GUIDE, PewterCity_Movement_GuideWalkToGymWest
# 50 "data/maps/PewterCity/scripts.pory"
	waitmovement 0
# 51 "data/maps/PewterCity/scripts.pory"
	return
# 52 "data/maps/PewterCity/scripts.pory"

# 53 "data/maps/PewterCity/scripts.pory"
@ Unused
# 54 "data/maps/PewterCity/scripts.pory"
PewterCity_EventScript_WalkToGymNorth::
# 55 "data/maps/PewterCity/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, PewterCity_Movement_PlayerWaitForGuideNorth
# 56 "data/maps/PewterCity/scripts.pory"
	applymovement LOCALID_GYM_GUIDE, PewterCity_Movement_GuideMoveToLeadNorth
# 57 "data/maps/PewterCity/scripts.pory"
	waitmovement 0
# 58 "data/maps/PewterCity/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, PewterCity_Movement_PlayerWalkToGymNorth
# 59 "data/maps/PewterCity/scripts.pory"
	applymovement LOCALID_GYM_GUIDE, PewterCity_Movement_GuideWalkToGymNorth
# 60 "data/maps/PewterCity/scripts.pory"
	waitmovement 0
# 61 "data/maps/PewterCity/scripts.pory"
	return
# 62 "data/maps/PewterCity/scripts.pory"

# 63 "data/maps/PewterCity/scripts.pory"
.macro walk_to_gym
# 64 "data/maps/PewterCity/scripts.pory"
	walk_left
# 65 "data/maps/PewterCity/scripts.pory"
	walk_left
# 66 "data/maps/PewterCity/scripts.pory"
	walk_left
# 67 "data/maps/PewterCity/scripts.pory"
	walk_up
# 68 "data/maps/PewterCity/scripts.pory"
	walk_left
# 69 "data/maps/PewterCity/scripts.pory"
	walk_left
# 70 "data/maps/PewterCity/scripts.pory"
	walk_left
# 71 "data/maps/PewterCity/scripts.pory"
	walk_left
# 72 "data/maps/PewterCity/scripts.pory"
	walk_left
# 73 "data/maps/PewterCity/scripts.pory"
	walk_left
# 74 "data/maps/PewterCity/scripts.pory"
	walk_left
# 75 "data/maps/PewterCity/scripts.pory"
	walk_left
# 76 "data/maps/PewterCity/scripts.pory"
	walk_left
# 77 "data/maps/PewterCity/scripts.pory"
	walk_left
# 78 "data/maps/PewterCity/scripts.pory"
	walk_left
# 79 "data/maps/PewterCity/scripts.pory"
	walk_left
# 80 "data/maps/PewterCity/scripts.pory"
	walk_left
# 81 "data/maps/PewterCity/scripts.pory"
	walk_left
# 82 "data/maps/PewterCity/scripts.pory"
	walk_left
# 83 "data/maps/PewterCity/scripts.pory"
	walk_up
# 84 "data/maps/PewterCity/scripts.pory"
	walk_up
# 85 "data/maps/PewterCity/scripts.pory"
	walk_up
# 86 "data/maps/PewterCity/scripts.pory"
	walk_up
# 87 "data/maps/PewterCity/scripts.pory"
	walk_up
# 88 "data/maps/PewterCity/scripts.pory"
	walk_up
# 89 "data/maps/PewterCity/scripts.pory"
	walk_up
# 90 "data/maps/PewterCity/scripts.pory"
	walk_up
# 91 "data/maps/PewterCity/scripts.pory"
	walk_up
# 92 "data/maps/PewterCity/scripts.pory"
	walk_up
# 93 "data/maps/PewterCity/scripts.pory"
	walk_left
# 94 "data/maps/PewterCity/scripts.pory"
	walk_left
# 95 "data/maps/PewterCity/scripts.pory"
	walk_left
# 96 "data/maps/PewterCity/scripts.pory"
	walk_left
# 97 "data/maps/PewterCity/scripts.pory"
	walk_left
# 98 "data/maps/PewterCity/scripts.pory"
	walk_left
# 99 "data/maps/PewterCity/scripts.pory"
	walk_left
# 100 "data/maps/PewterCity/scripts.pory"
	walk_left
# 101 "data/maps/PewterCity/scripts.pory"
	walk_left
# 102 "data/maps/PewterCity/scripts.pory"
	walk_left
# 103 "data/maps/PewterCity/scripts.pory"
	walk_left
# 104 "data/maps/PewterCity/scripts.pory"
	walk_left
# 105 "data/maps/PewterCity/scripts.pory"
	walk_left
# 106 "data/maps/PewterCity/scripts.pory"
	walk_left
# 107 "data/maps/PewterCity/scripts.pory"
	walk_left
# 108 "data/maps/PewterCity/scripts.pory"
	walk_left
# 109 "data/maps/PewterCity/scripts.pory"
	walk_down
# 110 "data/maps/PewterCity/scripts.pory"
	walk_down
# 111 "data/maps/PewterCity/scripts.pory"
	walk_down
# 112 "data/maps/PewterCity/scripts.pory"
	walk_down
# 113 "data/maps/PewterCity/scripts.pory"
	walk_down
# 114 "data/maps/PewterCity/scripts.pory"
	walk_down
# 115 "data/maps/PewterCity/scripts.pory"
	walk_down
# 116 "data/maps/PewterCity/scripts.pory"
	walk_down
# 117 "data/maps/PewterCity/scripts.pory"
	walk_right
# 118 "data/maps/PewterCity/scripts.pory"
	walk_right
# 119 "data/maps/PewterCity/scripts.pory"
	walk_right
# 120 "data/maps/PewterCity/scripts.pory"
	walk_right
# 121 "data/maps/PewterCity/scripts.pory"
	walk_right
# 122 "data/maps/PewterCity/scripts.pory"
	walk_right
# 123 "data/maps/PewterCity/scripts.pory"
	walk_right
# 124 "data/maps/PewterCity/scripts.pory"
	walk_right
# 125 "data/maps/PewterCity/scripts.pory"
.endm
# 126 "data/maps/PewterCity/scripts.pory"

# 127 "data/maps/PewterCity/scripts.pory"
.macro walk_to_gym_alt
# 128 "data/maps/PewterCity/scripts.pory"
	walk_left
# 129 "data/maps/PewterCity/scripts.pory"
	walk_left
# 130 "data/maps/PewterCity/scripts.pory"
	walk_left
# 131 "data/maps/PewterCity/scripts.pory"
	walk_left
# 132 "data/maps/PewterCity/scripts.pory"
	walk_left
# 133 "data/maps/PewterCity/scripts.pory"
	walk_left
# 134 "data/maps/PewterCity/scripts.pory"
	walk_left
# 135 "data/maps/PewterCity/scripts.pory"
	walk_left
# 136 "data/maps/PewterCity/scripts.pory"
	walk_left
# 137 "data/maps/PewterCity/scripts.pory"
	walk_left
# 138 "data/maps/PewterCity/scripts.pory"
	walk_left
# 139 "data/maps/PewterCity/scripts.pory"
	walk_left
# 140 "data/maps/PewterCity/scripts.pory"
	walk_left
# 141 "data/maps/PewterCity/scripts.pory"
	walk_left
# 142 "data/maps/PewterCity/scripts.pory"
	walk_left
# 143 "data/maps/PewterCity/scripts.pory"
	walk_up
# 144 "data/maps/PewterCity/scripts.pory"
	walk_up
# 145 "data/maps/PewterCity/scripts.pory"
	walk_up
# 146 "data/maps/PewterCity/scripts.pory"
	walk_up
# 147 "data/maps/PewterCity/scripts.pory"
	walk_up
# 148 "data/maps/PewterCity/scripts.pory"
	walk_up
# 149 "data/maps/PewterCity/scripts.pory"
	walk_up
# 150 "data/maps/PewterCity/scripts.pory"
	walk_left
# 151 "data/maps/PewterCity/scripts.pory"
	walk_left
# 152 "data/maps/PewterCity/scripts.pory"
	walk_left
# 153 "data/maps/PewterCity/scripts.pory"
	walk_left
# 154 "data/maps/PewterCity/scripts.pory"
	walk_left
# 155 "data/maps/PewterCity/scripts.pory"
	walk_left
# 156 "data/maps/PewterCity/scripts.pory"
	walk_left
# 157 "data/maps/PewterCity/scripts.pory"
	walk_left
# 158 "data/maps/PewterCity/scripts.pory"
	walk_left
# 159 "data/maps/PewterCity/scripts.pory"
	walk_left
# 160 "data/maps/PewterCity/scripts.pory"
	walk_down
# 161 "data/maps/PewterCity/scripts.pory"
	walk_down
# 162 "data/maps/PewterCity/scripts.pory"
	walk_down
# 163 "data/maps/PewterCity/scripts.pory"
	walk_down
# 164 "data/maps/PewterCity/scripts.pory"
	walk_down
# 165 "data/maps/PewterCity/scripts.pory"
	walk_down
# 166 "data/maps/PewterCity/scripts.pory"
	walk_right
# 167 "data/maps/PewterCity/scripts.pory"
.endm
# 168 "data/maps/PewterCity/scripts.pory"

# 169 "data/maps/PewterCity/scripts.pory"
PewterCity_Movement_PlayerWaitForGuideEast::
# 170 "data/maps/PewterCity/scripts.pory"
	delay_16
# 171 "data/maps/PewterCity/scripts.pory"
	delay_16
# 172 "data/maps/PewterCity/scripts.pory"
	delay_4
# 173 "data/maps/PewterCity/scripts.pory"
	walk_in_place_faster_down
# 174 "data/maps/PewterCity/scripts.pory"
	step_end
# 175 "data/maps/PewterCity/scripts.pory"

# 176 "data/maps/PewterCity/scripts.pory"
PewterCity_Movement_PlayerWalkToGymEast::
# 177 "data/maps/PewterCity/scripts.pory"
	walk_down
# 178 "data/maps/PewterCity/scripts.pory"
	walk_to_gym
# 179 "data/maps/PewterCity/scripts.pory"
	step_end
# 180 "data/maps/PewterCity/scripts.pory"

# 181 "data/maps/PewterCity/scripts.pory"
PewterCity_Movement_PlayerWaitForGuideWest::
# 182 "data/maps/PewterCity/scripts.pory"
	delay_16
# 183 "data/maps/PewterCity/scripts.pory"
	step_end
# 184 "data/maps/PewterCity/scripts.pory"

# 185 "data/maps/PewterCity/scripts.pory"
PewterCity_Movement_PlayerWalkToGymWest::
# 186 "data/maps/PewterCity/scripts.pory"
	walk_left
# 187 "data/maps/PewterCity/scripts.pory"
	walk_left
# 188 "data/maps/PewterCity/scripts.pory"
	walk_left
# 189 "data/maps/PewterCity/scripts.pory"
	walk_left
# 190 "data/maps/PewterCity/scripts.pory"
	walk_left
# 191 "data/maps/PewterCity/scripts.pory"
	walk_to_gym_alt
# 192 "data/maps/PewterCity/scripts.pory"
	step_end
# 193 "data/maps/PewterCity/scripts.pory"

# 194 "data/maps/PewterCity/scripts.pory"
PewterCity_Movement_PlayerWaitForGuideNorth::
# 195 "data/maps/PewterCity/scripts.pory"
	delay_16
# 196 "data/maps/PewterCity/scripts.pory"
	step_end
# 197 "data/maps/PewterCity/scripts.pory"

# 198 "data/maps/PewterCity/scripts.pory"
PewterCity_Movement_PlayerWalkToGymNorth::
# 199 "data/maps/PewterCity/scripts.pory"
	walk_up
# 200 "data/maps/PewterCity/scripts.pory"
	walk_left
# 201 "data/maps/PewterCity/scripts.pory"
	walk_left
# 202 "data/maps/PewterCity/scripts.pory"
	walk_left
# 203 "data/maps/PewterCity/scripts.pory"
	walk_left
# 204 "data/maps/PewterCity/scripts.pory"
	walk_to_gym_alt
# 205 "data/maps/PewterCity/scripts.pory"
	step_end
# 206 "data/maps/PewterCity/scripts.pory"

# 207 "data/maps/PewterCity/scripts.pory"
PewterCity_Movement_GuideMoveToLeadEast::
# 208 "data/maps/PewterCity/scripts.pory"
	walk_down
# 209 "data/maps/PewterCity/scripts.pory"
	walk_left
# 210 "data/maps/PewterCity/scripts.pory"
	walk_in_place_faster_up
# 211 "data/maps/PewterCity/scripts.pory"
	walk_in_place_up
# 212 "data/maps/PewterCity/scripts.pory"
	step_end
# 213 "data/maps/PewterCity/scripts.pory"

# 214 "data/maps/PewterCity/scripts.pory"
PewterCity_Movement_GuideWalkToGymEast::
# 215 "data/maps/PewterCity/scripts.pory"
	walk_to_gym
# 216 "data/maps/PewterCity/scripts.pory"
	walk_right
# 217 "data/maps/PewterCity/scripts.pory"
	walk_in_place_faster_left
# 218 "data/maps/PewterCity/scripts.pory"
	step_end
# 219 "data/maps/PewterCity/scripts.pory"

# 220 "data/maps/PewterCity/scripts.pory"
PewterCity_Movement_GuideMoveToLeadWest::
# 221 "data/maps/PewterCity/scripts.pory"
	walk_in_place_right
# 222 "data/maps/PewterCity/scripts.pory"
	step_end
# 223 "data/maps/PewterCity/scripts.pory"

# 224 "data/maps/PewterCity/scripts.pory"
PewterCity_Movement_GuideWalkToGymWest::
# 225 "data/maps/PewterCity/scripts.pory"
	walk_left
# 226 "data/maps/PewterCity/scripts.pory"
	walk_left
# 227 "data/maps/PewterCity/scripts.pory"
	walk_left
# 228 "data/maps/PewterCity/scripts.pory"
	walk_left
# 229 "data/maps/PewterCity/scripts.pory"
	walk_to_gym_alt
# 230 "data/maps/PewterCity/scripts.pory"
	walk_right
# 231 "data/maps/PewterCity/scripts.pory"
	walk_in_place_faster_left
# 232 "data/maps/PewterCity/scripts.pory"
	step_end
# 233 "data/maps/PewterCity/scripts.pory"

# 234 "data/maps/PewterCity/scripts.pory"
PewterCity_Movement_GuideMoveToLeadNorth::
# 235 "data/maps/PewterCity/scripts.pory"
	walk_in_place_down
# 236 "data/maps/PewterCity/scripts.pory"
	step_end
# 237 "data/maps/PewterCity/scripts.pory"

# 238 "data/maps/PewterCity/scripts.pory"
PewterCity_Movement_GuideWalkToGymNorth::
# 239 "data/maps/PewterCity/scripts.pory"
	walk_left
# 240 "data/maps/PewterCity/scripts.pory"
	walk_left
# 241 "data/maps/PewterCity/scripts.pory"
	walk_left
# 242 "data/maps/PewterCity/scripts.pory"
	walk_left
# 243 "data/maps/PewterCity/scripts.pory"
	walk_to_gym_alt
# 244 "data/maps/PewterCity/scripts.pory"
	walk_right
# 245 "data/maps/PewterCity/scripts.pory"
	walk_in_place_faster_left
# 246 "data/maps/PewterCity/scripts.pory"
	step_end
# 247 "data/maps/PewterCity/scripts.pory"

# 248 "data/maps/PewterCity/scripts.pory"
PewterCity_Movement_GymGuideExit::
# 249 "data/maps/PewterCity/scripts.pory"
	walk_down
# 250 "data/maps/PewterCity/scripts.pory"
	walk_left
# 251 "data/maps/PewterCity/scripts.pory"
	walk_left
# 252 "data/maps/PewterCity/scripts.pory"
	walk_left
# 253 "data/maps/PewterCity/scripts.pory"
	walk_left
# 254 "data/maps/PewterCity/scripts.pory"
	walk_left
# 255 "data/maps/PewterCity/scripts.pory"
	walk_left
# 256 "data/maps/PewterCity/scripts.pory"
	walk_left
# 257 "data/maps/PewterCity/scripts.pory"
	walk_left
# 258 "data/maps/PewterCity/scripts.pory"
	walk_left
# 259 "data/maps/PewterCity/scripts.pory"
	step_end
# 260 "data/maps/PewterCity/scripts.pory"

# 261 "data/maps/PewterCity/scripts.pory"
PewterCity_EventScript_GymGuideTriggerTop::
# 262 "data/maps/PewterCity/scripts.pory"
	lockall
# 263 "data/maps/PewterCity/scripts.pory"
	setvar VAR_TEMP_1, 0
# 264 "data/maps/PewterCity/scripts.pory"
	goto PewterCity_EventScript_GymGuideTrigger
# 265 "data/maps/PewterCity/scripts.pory"
	end
# 266 "data/maps/PewterCity/scripts.pory"

# 267 "data/maps/PewterCity/scripts.pory"
PewterCity_EventScript_GymGuideTriggerMid::
# 268 "data/maps/PewterCity/scripts.pory"
	lockall
# 269 "data/maps/PewterCity/scripts.pory"
	setvar VAR_TEMP_1, 1
# 270 "data/maps/PewterCity/scripts.pory"
	goto PewterCity_EventScript_GymGuideTrigger
# 271 "data/maps/PewterCity/scripts.pory"
	end
# 272 "data/maps/PewterCity/scripts.pory"

# 273 "data/maps/PewterCity/scripts.pory"
PewterCity_EventScript_GymGuideTriggerBottom::
# 274 "data/maps/PewterCity/scripts.pory"
	lockall
# 275 "data/maps/PewterCity/scripts.pory"
	setvar VAR_TEMP_1, 2
# 276 "data/maps/PewterCity/scripts.pory"
	goto PewterCity_EventScript_GymGuideTrigger
# 277 "data/maps/PewterCity/scripts.pory"
	end
# 278 "data/maps/PewterCity/scripts.pory"

# 279 "data/maps/PewterCity/scripts.pory"
@ This trigger is inaccessible and its corresponding movement script isnt linked
# 280 "data/maps/PewterCity/scripts.pory"
PewterCity_EventScript_GymGuideTriggerRight::
# 281 "data/maps/PewterCity/scripts.pory"
	lockall
# 282 "data/maps/PewterCity/scripts.pory"
	setvar VAR_TEMP_1, 3
# 283 "data/maps/PewterCity/scripts.pory"
	goto PewterCity_EventScript_GymGuideTrigger
# 284 "data/maps/PewterCity/scripts.pory"
	end
# 285 "data/maps/PewterCity/scripts.pory"

# 286 "data/maps/PewterCity/scripts.pory"
PewterCity_EventScript_GymGuideTrigger::
# 287 "data/maps/PewterCity/scripts.pory"
	textcolor NPC_TEXT_COLOR_MALE
# 288 "data/maps/PewterCity/scripts.pory"
	msgbox PewterCity_Text_BrocksLookingForChallengersFollowMe
# 289 "data/maps/PewterCity/scripts.pory"
	closemessage
# 290 "data/maps/PewterCity/scripts.pory"
	playbgm MUS_FOLLOW_ME, 0
# 291 "data/maps/PewterCity/scripts.pory"
	call_if_eq VAR_TEMP_1, 0, PewterCity_EventScript_WalkToGymTop
# 292 "data/maps/PewterCity/scripts.pory"
	call_if_eq VAR_TEMP_1, 1, PewterCity_EventScript_WalkToGymMid
# 293 "data/maps/PewterCity/scripts.pory"
	call_if_eq VAR_TEMP_1, 2, PewterCity_EventScript_WalkToGymBottom
# 294 "data/maps/PewterCity/scripts.pory"
	msgbox PewterCity_Text_GoTakeOnBrock
# 295 "data/maps/PewterCity/scripts.pory"
	closemessage
# 296 "data/maps/PewterCity/scripts.pory"
	applymovement LOCALID_GYM_GUIDE, PewterCity_Movement_GymGuideExit
# 297 "data/maps/PewterCity/scripts.pory"
	waitmovement 0
# 298 "data/maps/PewterCity/scripts.pory"
	fadedefaultbgm
# 299 "data/maps/PewterCity/scripts.pory"
	removeobject LOCALID_GYM_GUIDE
# 300 "data/maps/PewterCity/scripts.pory"
	clearflag FLAG_HIDE_PEWTER_CITY_GYM_GUIDE
# 301 "data/maps/PewterCity/scripts.pory"
	releaseall
# 302 "data/maps/PewterCity/scripts.pory"
	end
# 303 "data/maps/PewterCity/scripts.pory"

# 304 "data/maps/PewterCity/scripts.pory"
PewterCity_EventScript_WalkToGymTop::
# 305 "data/maps/PewterCity/scripts.pory"
	applymovement LOCALID_GYM_GUIDE, PewterCity_Movement_GuideMoveToLeadTop
# 306 "data/maps/PewterCity/scripts.pory"
	waitmovement 0
# 307 "data/maps/PewterCity/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, PewterCity_Movement_PlayerWalkToGymTop
# 308 "data/maps/PewterCity/scripts.pory"
	applymovement LOCALID_GYM_GUIDE, PewterCity_Movement_GuideWalkToGymTop
# 309 "data/maps/PewterCity/scripts.pory"
	waitmovement 0
# 310 "data/maps/PewterCity/scripts.pory"
	return
# 311 "data/maps/PewterCity/scripts.pory"

# 312 "data/maps/PewterCity/scripts.pory"
PewterCity_EventScript_WalkToGymMid::
# 313 "data/maps/PewterCity/scripts.pory"
	applymovement LOCALID_GYM_GUIDE, PewterCity_Movement_GuideMoveToLeadMid
# 314 "data/maps/PewterCity/scripts.pory"
	waitmovement 0
# 315 "data/maps/PewterCity/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, PewterCity_Movement_PlayerWalkToGymMid
# 316 "data/maps/PewterCity/scripts.pory"
	applymovement LOCALID_GYM_GUIDE, PewterCity_Movement_GuideWalkToGymMid
# 317 "data/maps/PewterCity/scripts.pory"
	waitmovement 0
# 318 "data/maps/PewterCity/scripts.pory"
	return
# 319 "data/maps/PewterCity/scripts.pory"

# 320 "data/maps/PewterCity/scripts.pory"
PewterCity_EventScript_WalkToGymBottom::
# 321 "data/maps/PewterCity/scripts.pory"
	applymovement LOCALID_GYM_GUIDE, PewterCity_Movement_GuideMoveToLeadBottom
# 322 "data/maps/PewterCity/scripts.pory"
	waitmovement 0
# 323 "data/maps/PewterCity/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, PewterCity_Movement_PlayerWalkToGymBottom
# 324 "data/maps/PewterCity/scripts.pory"
	applymovement LOCALID_GYM_GUIDE, PewterCity_Movement_GuideWalkToGymBottom
# 325 "data/maps/PewterCity/scripts.pory"
	waitmovement 0
# 326 "data/maps/PewterCity/scripts.pory"
	return
# 327 "data/maps/PewterCity/scripts.pory"

# 328 "data/maps/PewterCity/scripts.pory"
@ Unused
# 329 "data/maps/PewterCity/scripts.pory"
PewterCity_EventScript_WalkToGymRight::
# 330 "data/maps/PewterCity/scripts.pory"
	applymovement LOCALID_GYM_GUIDE, PewterCity_Movement_GuideApproachPlayerRight
# 331 "data/maps/PewterCity/scripts.pory"
	waitmovement 0
# 332 "data/maps/PewterCity/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, PewterCity_Movement_PlayerWalkToGymRight
# 333 "data/maps/PewterCity/scripts.pory"
	applymovement LOCALID_GYM_GUIDE, PewterCity_Movement_GuideWalkToGymRight
# 334 "data/maps/PewterCity/scripts.pory"
	waitmovement 0
# 335 "data/maps/PewterCity/scripts.pory"
	return
# 336 "data/maps/PewterCity/scripts.pory"

# 337 "data/maps/PewterCity/scripts.pory"
PewterCity_Movement_PlayerWalkToGymTop::
# 338 "data/maps/PewterCity/scripts.pory"
	walk_left
# 339 "data/maps/PewterCity/scripts.pory"
	walk_to_gym
# 340 "data/maps/PewterCity/scripts.pory"
	step_end
# 341 "data/maps/PewterCity/scripts.pory"

# 342 "data/maps/PewterCity/scripts.pory"
PewterCity_Movement_PlayerWalkToGymMid::
# 343 "data/maps/PewterCity/scripts.pory"
	walk_up
# 344 "data/maps/PewterCity/scripts.pory"
	walk_left
# 345 "data/maps/PewterCity/scripts.pory"
	walk_to_gym
# 346 "data/maps/PewterCity/scripts.pory"
	step_end
# 347 "data/maps/PewterCity/scripts.pory"

# 348 "data/maps/PewterCity/scripts.pory"
PewterCity_Movement_PlayerWalkToGymBottom::
# 349 "data/maps/PewterCity/scripts.pory"
	walk_up
# 350 "data/maps/PewterCity/scripts.pory"
	walk_up
# 351 "data/maps/PewterCity/scripts.pory"
	walk_left
# 352 "data/maps/PewterCity/scripts.pory"
	walk_to_gym
# 353 "data/maps/PewterCity/scripts.pory"
	step_end
# 354 "data/maps/PewterCity/scripts.pory"

# 355 "data/maps/PewterCity/scripts.pory"
PewterCity_Movement_PlayerWalkToGymRight::
# 356 "data/maps/PewterCity/scripts.pory"
	walk_left
# 357 "data/maps/PewterCity/scripts.pory"
	walk_left
# 358 "data/maps/PewterCity/scripts.pory"
	walk_left
# 359 "data/maps/PewterCity/scripts.pory"
	walk_left
# 360 "data/maps/PewterCity/scripts.pory"
	walk_up
# 361 "data/maps/PewterCity/scripts.pory"
	walk_left
# 362 "data/maps/PewterCity/scripts.pory"
	walk_left
# 363 "data/maps/PewterCity/scripts.pory"
	walk_left
# 364 "data/maps/PewterCity/scripts.pory"
	walk_up
# 365 "data/maps/PewterCity/scripts.pory"
	walk_up
# 366 "data/maps/PewterCity/scripts.pory"
	walk_to_gym_alt
# 367 "data/maps/PewterCity/scripts.pory"
	step_end
# 368 "data/maps/PewterCity/scripts.pory"

# 369 "data/maps/PewterCity/scripts.pory"
PewterCity_Movement_GuideMoveToLeadTop::
# 370 "data/maps/PewterCity/scripts.pory"
	walk_left
# 371 "data/maps/PewterCity/scripts.pory"
	walk_down
# 372 "data/maps/PewterCity/scripts.pory"
	walk_in_place_faster_right
# 373 "data/maps/PewterCity/scripts.pory"
	walk_in_place_right
# 374 "data/maps/PewterCity/scripts.pory"
	step_end
# 375 "data/maps/PewterCity/scripts.pory"

# 376 "data/maps/PewterCity/scripts.pory"
PewterCity_Movement_GuideMoveToLeadMid::
# 377 "data/maps/PewterCity/scripts.pory"
	walk_down
# 378 "data/maps/PewterCity/scripts.pory"
	walk_in_place_down
# 379 "data/maps/PewterCity/scripts.pory"
	step_end
# 380 "data/maps/PewterCity/scripts.pory"

# 381 "data/maps/PewterCity/scripts.pory"
PewterCity_Movement_GuideMoveToLeadBottom::
# 382 "data/maps/PewterCity/scripts.pory"
	walk_down
# 383 "data/maps/PewterCity/scripts.pory"
	walk_down
# 384 "data/maps/PewterCity/scripts.pory"
	walk_in_place_down
# 385 "data/maps/PewterCity/scripts.pory"
	step_end
# 386 "data/maps/PewterCity/scripts.pory"

# 387 "data/maps/PewterCity/scripts.pory"
PewterCity_Movement_GuideApproachPlayerRight::
# 388 "data/maps/PewterCity/scripts.pory"
	walk_down
# 389 "data/maps/PewterCity/scripts.pory"
	walk_down
# 390 "data/maps/PewterCity/scripts.pory"
	walk_right
# 391 "data/maps/PewterCity/scripts.pory"
	walk_down
# 392 "data/maps/PewterCity/scripts.pory"
	walk_right
# 393 "data/maps/PewterCity/scripts.pory"
	walk_in_place_right
# 394 "data/maps/PewterCity/scripts.pory"
	step_end
# 395 "data/maps/PewterCity/scripts.pory"

# 396 "data/maps/PewterCity/scripts.pory"
PewterCity_Movement_GuideWalkToGymTop::
# 397 "data/maps/PewterCity/scripts.pory"
	walk_to_gym
# 398 "data/maps/PewterCity/scripts.pory"
	walk_right
# 399 "data/maps/PewterCity/scripts.pory"
	walk_in_place_faster_left
# 400 "data/maps/PewterCity/scripts.pory"
	step_end
# 401 "data/maps/PewterCity/scripts.pory"

# 402 "data/maps/PewterCity/scripts.pory"
PewterCity_Movement_GuideWalkToGymMid::
# 403 "data/maps/PewterCity/scripts.pory"
	walk_left
# 404 "data/maps/PewterCity/scripts.pory"
	walk_to_gym
# 405 "data/maps/PewterCity/scripts.pory"
	walk_right
# 406 "data/maps/PewterCity/scripts.pory"
	walk_in_place_faster_left
# 407 "data/maps/PewterCity/scripts.pory"
	step_end
# 408 "data/maps/PewterCity/scripts.pory"

# 409 "data/maps/PewterCity/scripts.pory"
PewterCity_Movement_GuideWalkToGymBottom::
# 410 "data/maps/PewterCity/scripts.pory"
	walk_up
# 411 "data/maps/PewterCity/scripts.pory"
	walk_left
# 412 "data/maps/PewterCity/scripts.pory"
	walk_to_gym
# 413 "data/maps/PewterCity/scripts.pory"
	walk_right
# 414 "data/maps/PewterCity/scripts.pory"
	walk_in_place_faster_left
# 415 "data/maps/PewterCity/scripts.pory"
	step_end
# 416 "data/maps/PewterCity/scripts.pory"

# 417 "data/maps/PewterCity/scripts.pory"
PewterCity_Movement_GuideWalkToGymRight::
# 418 "data/maps/PewterCity/scripts.pory"
	walk_left
# 419 "data/maps/PewterCity/scripts.pory"
	walk_left
# 420 "data/maps/PewterCity/scripts.pory"
	walk_left
# 421 "data/maps/PewterCity/scripts.pory"
	walk_up
# 422 "data/maps/PewterCity/scripts.pory"
	walk_left
# 423 "data/maps/PewterCity/scripts.pory"
	walk_left
# 424 "data/maps/PewterCity/scripts.pory"
	walk_left
# 425 "data/maps/PewterCity/scripts.pory"
	walk_up
# 426 "data/maps/PewterCity/scripts.pory"
	walk_up
# 427 "data/maps/PewterCity/scripts.pory"
	walk_to_gym_alt
# 428 "data/maps/PewterCity/scripts.pory"
	walk_right
# 429 "data/maps/PewterCity/scripts.pory"
	walk_in_place_faster_left
# 430 "data/maps/PewterCity/scripts.pory"
	step_end
# 431 "data/maps/PewterCity/scripts.pory"

# 432 "data/maps/PewterCity/scripts.pory"
PewterCity_EventScript_Lass::
# 433 "data/maps/PewterCity/scripts.pory"
	msgbox PewterCity_Text_ClefairyCameFromMoon, MSGBOX_NPC
# 434 "data/maps/PewterCity/scripts.pory"
	end
# 435 "data/maps/PewterCity/scripts.pory"

# 436 "data/maps/PewterCity/scripts.pory"
PewterCity_EventScript_MuseumGuide::
# 437 "data/maps/PewterCity/scripts.pory"
	lock
# 438 "data/maps/PewterCity/scripts.pory"
	faceplayer
# 439 "data/maps/PewterCity/scripts.pory"
	msgbox PewterCity_Text_DidYouCheckOutMuseum, MSGBOX_YESNO
# 440 "data/maps/PewterCity/scripts.pory"
	goto_if_eq VAR_RESULT, YES, PewterCity_EventScript_CheckedOutMuseum
# 441 "data/maps/PewterCity/scripts.pory"
	msgbox PewterCity_Text_ReallyYouHaveToGo
# 442 "data/maps/PewterCity/scripts.pory"
	closemessage
# 443 "data/maps/PewterCity/scripts.pory"
	delay 10
# 444 "data/maps/PewterCity/scripts.pory"
	playbgm MUS_FOLLOW_ME, 0
# 445 "data/maps/PewterCity/scripts.pory"
	call_if_eq VAR_FACING, DIR_NORTH, PewterCity_EventScript_LeadToMuseumNorth
# 446 "data/maps/PewterCity/scripts.pory"
	call_if_eq VAR_FACING, DIR_SOUTH, PewterCity_EventScript_LeadToMuseumSouth
# 447 "data/maps/PewterCity/scripts.pory"
	call_if_eq VAR_FACING, DIR_WEST, PewterCity_EventScript_LeadToMuseumWest
# 448 "data/maps/PewterCity/scripts.pory"
	call_if_eq VAR_FACING, DIR_EAST, PewterCity_EventScript_LeadToMuseumEast
# 449 "data/maps/PewterCity/scripts.pory"
	msgbox PewterCity_Text_ThisIsTheMuseum
# 450 "data/maps/PewterCity/scripts.pory"
	closemessage
# 451 "data/maps/PewterCity/scripts.pory"
	delay 10
# 452 "data/maps/PewterCity/scripts.pory"
	applymovement LOCALID_MUSEUM_GUIDE, PewterCity_Movement_MuseumGuideExit
# 453 "data/maps/PewterCity/scripts.pory"
	waitmovement 0
# 454 "data/maps/PewterCity/scripts.pory"
	fadedefaultbgm
# 455 "data/maps/PewterCity/scripts.pory"
	removeobject LOCALID_MUSEUM_GUIDE
# 456 "data/maps/PewterCity/scripts.pory"
	clearflag FLAG_HIDE_PEWTER_MUSEUM_GUIDE
# 457 "data/maps/PewterCity/scripts.pory"
	release
# 458 "data/maps/PewterCity/scripts.pory"
	end
# 459 "data/maps/PewterCity/scripts.pory"

# 460 "data/maps/PewterCity/scripts.pory"
PewterCity_EventScript_LeadToMuseumNorth::
# 461 "data/maps/PewterCity/scripts.pory"
	applymovement LOCALID_MUSEUM_GUIDE, PewterCity_Movement_GuideWalkToMuseumNorth
# 462 "data/maps/PewterCity/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, PewterCity_Movement_PlayerWalkToMuseumNorth
# 463 "data/maps/PewterCity/scripts.pory"
	waitmovement 0
# 464 "data/maps/PewterCity/scripts.pory"
	return
# 465 "data/maps/PewterCity/scripts.pory"

# 466 "data/maps/PewterCity/scripts.pory"
PewterCity_EventScript_LeadToMuseumSouth::
# 467 "data/maps/PewterCity/scripts.pory"
	applymovement LOCALID_MUSEUM_GUIDE, PewterCity_Movement_GuideWalkToMuseumSouth
# 468 "data/maps/PewterCity/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, PewterCity_Movement_PlayerWalkToMuseumSouth
# 469 "data/maps/PewterCity/scripts.pory"
	waitmovement 0
# 470 "data/maps/PewterCity/scripts.pory"
	return
# 471 "data/maps/PewterCity/scripts.pory"

# 472 "data/maps/PewterCity/scripts.pory"
PewterCity_EventScript_LeadToMuseumWest::
# 473 "data/maps/PewterCity/scripts.pory"
	applymovement LOCALID_MUSEUM_GUIDE, PewterCity_Movement_GuideWalkToMuseumWest
# 474 "data/maps/PewterCity/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, PewterCity_Movement_PlayerWalkToMuseumWest
# 475 "data/maps/PewterCity/scripts.pory"
	waitmovement 0
# 476 "data/maps/PewterCity/scripts.pory"
	return
# 477 "data/maps/PewterCity/scripts.pory"

# 478 "data/maps/PewterCity/scripts.pory"
PewterCity_EventScript_LeadToMuseumEast::
# 479 "data/maps/PewterCity/scripts.pory"
	applymovement LOCALID_MUSEUM_GUIDE, PewterCity_Movement_GuideWalkToMuseumEast
# 480 "data/maps/PewterCity/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, PewterCity_Movement_PlayerWalkToMuseumEast
# 481 "data/maps/PewterCity/scripts.pory"
	waitmovement 0
# 482 "data/maps/PewterCity/scripts.pory"
	return
# 483 "data/maps/PewterCity/scripts.pory"

# 484 "data/maps/PewterCity/scripts.pory"
PewterCity_EventScript_CheckedOutMuseum::
# 485 "data/maps/PewterCity/scripts.pory"
	msgbox PewterCity_Text_WerentThoseFossilsAmazing
# 486 "data/maps/PewterCity/scripts.pory"
	release
# 487 "data/maps/PewterCity/scripts.pory"
	end
# 488 "data/maps/PewterCity/scripts.pory"

# 489 "data/maps/PewterCity/scripts.pory"
.macro walk_to_museum
# 490 "data/maps/PewterCity/scripts.pory"
	walk_up
# 491 "data/maps/PewterCity/scripts.pory"
	walk_up
# 492 "data/maps/PewterCity/scripts.pory"
	walk_up
# 493 "data/maps/PewterCity/scripts.pory"
	walk_up
# 494 "data/maps/PewterCity/scripts.pory"
	walk_left
# 495 "data/maps/PewterCity/scripts.pory"
	walk_left
# 496 "data/maps/PewterCity/scripts.pory"
	walk_left
# 497 "data/maps/PewterCity/scripts.pory"
	walk_left
# 498 "data/maps/PewterCity/scripts.pory"
	walk_left
# 499 "data/maps/PewterCity/scripts.pory"
	walk_left
# 500 "data/maps/PewterCity/scripts.pory"
	walk_left
# 501 "data/maps/PewterCity/scripts.pory"
	walk_left
# 502 "data/maps/PewterCity/scripts.pory"
	walk_left
# 503 "data/maps/PewterCity/scripts.pory"
	walk_left
# 504 "data/maps/PewterCity/scripts.pory"
	walk_up
# 505 "data/maps/PewterCity/scripts.pory"
	walk_up
# 506 "data/maps/PewterCity/scripts.pory"
	walk_up
# 507 "data/maps/PewterCity/scripts.pory"
	walk_up
# 508 "data/maps/PewterCity/scripts.pory"
	walk_left
# 509 "data/maps/PewterCity/scripts.pory"
	walk_left
# 510 "data/maps/PewterCity/scripts.pory"
	walk_left
# 511 "data/maps/PewterCity/scripts.pory"
	walk_left
# 512 "data/maps/PewterCity/scripts.pory"
	walk_left
# 513 "data/maps/PewterCity/scripts.pory"
	walk_left
# 514 "data/maps/PewterCity/scripts.pory"
.endm
# 515 "data/maps/PewterCity/scripts.pory"

# 516 "data/maps/PewterCity/scripts.pory"
.macro walk_to_museum_south
# 517 "data/maps/PewterCity/scripts.pory"
	walk_up
# 518 "data/maps/PewterCity/scripts.pory"
	walk_up
# 519 "data/maps/PewterCity/scripts.pory"
	walk_up
# 520 "data/maps/PewterCity/scripts.pory"
	walk_left
# 521 "data/maps/PewterCity/scripts.pory"
	walk_left
# 522 "data/maps/PewterCity/scripts.pory"
	walk_left
# 523 "data/maps/PewterCity/scripts.pory"
	walk_left
# 524 "data/maps/PewterCity/scripts.pory"
	walk_left
# 525 "data/maps/PewterCity/scripts.pory"
	walk_left
# 526 "data/maps/PewterCity/scripts.pory"
	walk_left
# 527 "data/maps/PewterCity/scripts.pory"
	walk_left
# 528 "data/maps/PewterCity/scripts.pory"
	walk_left
# 529 "data/maps/PewterCity/scripts.pory"
	walk_up
# 530 "data/maps/PewterCity/scripts.pory"
	walk_up
# 531 "data/maps/PewterCity/scripts.pory"
	walk_up
# 532 "data/maps/PewterCity/scripts.pory"
	walk_up
# 533 "data/maps/PewterCity/scripts.pory"
	walk_left
# 534 "data/maps/PewterCity/scripts.pory"
	walk_left
# 535 "data/maps/PewterCity/scripts.pory"
	walk_left
# 536 "data/maps/PewterCity/scripts.pory"
	walk_left
# 537 "data/maps/PewterCity/scripts.pory"
	walk_left
# 538 "data/maps/PewterCity/scripts.pory"
	walk_left
# 539 "data/maps/PewterCity/scripts.pory"
.endm
# 540 "data/maps/PewterCity/scripts.pory"

# 541 "data/maps/PewterCity/scripts.pory"
PewterCity_Movement_PlayerWalkToMuseumNorth::
# 542 "data/maps/PewterCity/scripts.pory"
	walk_up
# 543 "data/maps/PewterCity/scripts.pory"
	walk_to_museum
# 544 "data/maps/PewterCity/scripts.pory"
	delay_8
# 545 "data/maps/PewterCity/scripts.pory"
	walk_in_place_faster_up
# 546 "data/maps/PewterCity/scripts.pory"
	step_end
# 547 "data/maps/PewterCity/scripts.pory"

# 548 "data/maps/PewterCity/scripts.pory"
PewterCity_Movement_GuideWalkToMuseumNorth::
# 549 "data/maps/PewterCity/scripts.pory"
	walk_to_museum
# 550 "data/maps/PewterCity/scripts.pory"
	walk_left
# 551 "data/maps/PewterCity/scripts.pory"
	walk_in_place_faster_up
# 552 "data/maps/PewterCity/scripts.pory"
	step_end
# 553 "data/maps/PewterCity/scripts.pory"

# 554 "data/maps/PewterCity/scripts.pory"
PewterCity_Movement_PlayerWalkToMuseumSouth::
# 555 "data/maps/PewterCity/scripts.pory"
	delay_16
# 556 "data/maps/PewterCity/scripts.pory"
	delay_16
# 557 "data/maps/PewterCity/scripts.pory"
	walk_left
# 558 "data/maps/PewterCity/scripts.pory"
	walk_to_museum_south
# 559 "data/maps/PewterCity/scripts.pory"
	delay_8
# 560 "data/maps/PewterCity/scripts.pory"
	walk_in_place_faster_up
# 561 "data/maps/PewterCity/scripts.pory"
	step_end
# 562 "data/maps/PewterCity/scripts.pory"

# 563 "data/maps/PewterCity/scripts.pory"
PewterCity_Movement_GuideWalkToMuseumSouth::
# 564 "data/maps/PewterCity/scripts.pory"
	walk_left
# 565 "data/maps/PewterCity/scripts.pory"
	walk_up
# 566 "data/maps/PewterCity/scripts.pory"
	walk_to_museum_south
# 567 "data/maps/PewterCity/scripts.pory"
	walk_left
# 568 "data/maps/PewterCity/scripts.pory"
	walk_in_place_faster_up
# 569 "data/maps/PewterCity/scripts.pory"
	step_end
# 570 "data/maps/PewterCity/scripts.pory"

# 571 "data/maps/PewterCity/scripts.pory"
PewterCity_Movement_PlayerWalkToMuseumWest::
# 572 "data/maps/PewterCity/scripts.pory"
	walk_left
# 573 "data/maps/PewterCity/scripts.pory"
	walk_to_museum
# 574 "data/maps/PewterCity/scripts.pory"
	delay_8
# 575 "data/maps/PewterCity/scripts.pory"
	walk_in_place_faster_up
# 576 "data/maps/PewterCity/scripts.pory"
	step_end
# 577 "data/maps/PewterCity/scripts.pory"

# 578 "data/maps/PewterCity/scripts.pory"
PewterCity_Movement_GuideWalkToMuseumWest::
# 579 "data/maps/PewterCity/scripts.pory"
	walk_to_museum
# 580 "data/maps/PewterCity/scripts.pory"
	walk_left
# 581 "data/maps/PewterCity/scripts.pory"
	walk_in_place_faster_up
# 582 "data/maps/PewterCity/scripts.pory"
	step_end
# 583 "data/maps/PewterCity/scripts.pory"

# 584 "data/maps/PewterCity/scripts.pory"
PewterCity_Movement_PlayerWalkToMuseumEast::
# 585 "data/maps/PewterCity/scripts.pory"
	walk_right
# 586 "data/maps/PewterCity/scripts.pory"
	walk_to_museum
# 587 "data/maps/PewterCity/scripts.pory"
	delay_8
# 588 "data/maps/PewterCity/scripts.pory"
	walk_in_place_faster_up
# 589 "data/maps/PewterCity/scripts.pory"
	step_end
# 590 "data/maps/PewterCity/scripts.pory"

# 591 "data/maps/PewterCity/scripts.pory"
PewterCity_Movement_GuideWalkToMuseumEast::
# 592 "data/maps/PewterCity/scripts.pory"
	walk_to_museum
# 593 "data/maps/PewterCity/scripts.pory"
	walk_left
# 594 "data/maps/PewterCity/scripts.pory"
	walk_in_place_faster_up
# 595 "data/maps/PewterCity/scripts.pory"
	step_end
# 596 "data/maps/PewterCity/scripts.pory"

# 597 "data/maps/PewterCity/scripts.pory"
PewterCity_Movement_MuseumGuideExit::
# 598 "data/maps/PewterCity/scripts.pory"
	walk_down
# 599 "data/maps/PewterCity/scripts.pory"
	walk_right
# 600 "data/maps/PewterCity/scripts.pory"
	walk_right
# 601 "data/maps/PewterCity/scripts.pory"
	walk_right
# 602 "data/maps/PewterCity/scripts.pory"
	walk_right
# 603 "data/maps/PewterCity/scripts.pory"
	walk_right
# 604 "data/maps/PewterCity/scripts.pory"
	walk_right
# 605 "data/maps/PewterCity/scripts.pory"
	walk_right
# 606 "data/maps/PewterCity/scripts.pory"
	walk_down
# 607 "data/maps/PewterCity/scripts.pory"
	walk_down
# 608 "data/maps/PewterCity/scripts.pory"
	walk_down
# 609 "data/maps/PewterCity/scripts.pory"
	walk_right
# 610 "data/maps/PewterCity/scripts.pory"
	walk_right
# 611 "data/maps/PewterCity/scripts.pory"
	walk_right
# 612 "data/maps/PewterCity/scripts.pory"
	step_end
# 613 "data/maps/PewterCity/scripts.pory"

# 614 "data/maps/PewterCity/scripts.pory"
PewterCity_EventScript_FatMan::
# 615 "data/maps/PewterCity/scripts.pory"
	lock
# 616 "data/maps/PewterCity/scripts.pory"
	faceplayer
# 617 "data/maps/PewterCity/scripts.pory"
	famechecker FAMECHECKER_BROCK, 2
# 618 "data/maps/PewterCity/scripts.pory"
	msgbox PewterCity_Text_BrockOnlySeriousTrainerHere
# 619 "data/maps/PewterCity/scripts.pory"
	release
# 620 "data/maps/PewterCity/scripts.pory"
	end
# 621 "data/maps/PewterCity/scripts.pory"

# 622 "data/maps/PewterCity/scripts.pory"
PewterCity_EventScript_BugCatcher::
# 623 "data/maps/PewterCity/scripts.pory"
	lock
# 624 "data/maps/PewterCity/scripts.pory"
	faceplayer
# 625 "data/maps/PewterCity/scripts.pory"
	msgbox PewterCity_Text_DoYouKnowWhatImDoing, MSGBOX_YESNO
# 626 "data/maps/PewterCity/scripts.pory"
	goto_if_eq VAR_RESULT, YES, PewterCity_EventScript_KnowWhatTheyreDoing
# 627 "data/maps/PewterCity/scripts.pory"
	msgbox PewterCity_Text_SprayingRepelToKeepWildMonsOut
# 628 "data/maps/PewterCity/scripts.pory"
	release
# 629 "data/maps/PewterCity/scripts.pory"
	end
# 630 "data/maps/PewterCity/scripts.pory"

# 631 "data/maps/PewterCity/scripts.pory"
PewterCity_EventScript_KnowWhatTheyreDoing::
# 632 "data/maps/PewterCity/scripts.pory"
	msgbox PewterCity_Text_ThatsRightItsHardWork
# 633 "data/maps/PewterCity/scripts.pory"
	release
# 634 "data/maps/PewterCity/scripts.pory"
	end
# 635 "data/maps/PewterCity/scripts.pory"

# 636 "data/maps/PewterCity/scripts.pory"
PewterCity_EventScript_TrainerTips::
# 637 "data/maps/PewterCity/scripts.pory"
	msgbox PewterCity_Text_TrainerTipsEarningEXP, MSGBOX_SIGN
# 638 "data/maps/PewterCity/scripts.pory"
	end
# 639 "data/maps/PewterCity/scripts.pory"

# 640 "data/maps/PewterCity/scripts.pory"
PewterCity_EventScript_PoliceNotice::
# 641 "data/maps/PewterCity/scripts.pory"
	msgbox PewterCity_Text_CallPoliceIfInfoOnThieves, MSGBOX_SIGN
# 642 "data/maps/PewterCity/scripts.pory"
	end
# 643 "data/maps/PewterCity/scripts.pory"

# 644 "data/maps/PewterCity/scripts.pory"
PewterCity_EventScript_MuseumSign::
# 645 "data/maps/PewterCity/scripts.pory"
	msgbox PewterCity_Text_MuseumOfScience, MSGBOX_SIGN
# 646 "data/maps/PewterCity/scripts.pory"
	end
# 647 "data/maps/PewterCity/scripts.pory"

# 648 "data/maps/PewterCity/scripts.pory"
PewterCity_EventScript_GymSign::
# 649 "data/maps/PewterCity/scripts.pory"
	lockall
# 650 "data/maps/PewterCity/scripts.pory"
	famechecker FAMECHECKER_BROCK, 0
# 651 "data/maps/PewterCity/scripts.pory"
	msgbox PewterCity_Text_GymSign
# 652 "data/maps/PewterCity/scripts.pory"
	releaseall
# 653 "data/maps/PewterCity/scripts.pory"
	end
# 654 "data/maps/PewterCity/scripts.pory"

# 655 "data/maps/PewterCity/scripts.pory"
PewterCity_EventScript_CitySign::
# 656 "data/maps/PewterCity/scripts.pory"
	msgbox PewterCity_Text_CitySign, MSGBOX_SIGN
# 657 "data/maps/PewterCity/scripts.pory"
	end
# 658 "data/maps/PewterCity/scripts.pory"

# 659 "data/maps/PewterCity/scripts.pory"
PewterCity_EventScript_RunningShoesAide::
# 660 "data/maps/PewterCity/scripts.pory"
	lock
# 661 "data/maps/PewterCity/scripts.pory"
	faceplayer
# 662 "data/maps/PewterCity/scripts.pory"
	setvar VAR_TEMP_1, 0
# 663 "data/maps/PewterCity/scripts.pory"
	call PewterCity_EventScript_AideGiveRunningShoes
# 664 "data/maps/PewterCity/scripts.pory"
	release
# 665 "data/maps/PewterCity/scripts.pory"
	end
# 666 "data/maps/PewterCity/scripts.pory"

# 667 "data/maps/PewterCity/scripts.pory"
PewterCity_EventScript_RunningShoesAideTriggerTop::
# 668 "data/maps/PewterCity/scripts.pory"
	lockall
# 669 "data/maps/PewterCity/scripts.pory"
	setvar VAR_TEMP_1, 1
# 670 "data/maps/PewterCity/scripts.pory"
	call PewterCity_EventScript_AideGiveRunningShoes
# 671 "data/maps/PewterCity/scripts.pory"
	releaseall
# 672 "data/maps/PewterCity/scripts.pory"
	end
# 673 "data/maps/PewterCity/scripts.pory"

# 674 "data/maps/PewterCity/scripts.pory"
PewterCity_EventScript_RunningShoesAideTriggerMid::
# 675 "data/maps/PewterCity/scripts.pory"
	lockall
# 676 "data/maps/PewterCity/scripts.pory"
	setvar VAR_TEMP_1, 2
# 677 "data/maps/PewterCity/scripts.pory"
	call PewterCity_EventScript_AideGiveRunningShoes
# 678 "data/maps/PewterCity/scripts.pory"
	releaseall
# 679 "data/maps/PewterCity/scripts.pory"
	end
# 680 "data/maps/PewterCity/scripts.pory"

# 681 "data/maps/PewterCity/scripts.pory"
PewterCity_EventScript_RunningShoesAideTriggerBottom::
# 682 "data/maps/PewterCity/scripts.pory"
	lockall
# 683 "data/maps/PewterCity/scripts.pory"
	setvar VAR_TEMP_1, 3
# 684 "data/maps/PewterCity/scripts.pory"
	call PewterCity_EventScript_AideGiveRunningShoes
# 685 "data/maps/PewterCity/scripts.pory"
	releaseall
# 686 "data/maps/PewterCity/scripts.pory"
	end
# 687 "data/maps/PewterCity/scripts.pory"

# 688 "data/maps/PewterCity/scripts.pory"
PewterCity_EventScript_AideGiveRunningShoes::
# 689 "data/maps/PewterCity/scripts.pory"
	textcolor NPC_TEXT_COLOR_MALE
# 690 "data/maps/PewterCity/scripts.pory"
	call_if_eq VAR_TEMP_1, 1, PewterCity_EventScript_AideNoticePlayer
# 691 "data/maps/PewterCity/scripts.pory"
	call_if_eq VAR_TEMP_1, 2, PewterCity_EventScript_AideNoticePlayer
# 692 "data/maps/PewterCity/scripts.pory"
	call_if_eq VAR_TEMP_1, 3, PewterCity_EventScript_AideNoticePlayer
# 693 "data/maps/PewterCity/scripts.pory"
	waitse
# 694 "data/maps/PewterCity/scripts.pory"
	playse SE_PIN
# 695 "data/maps/PewterCity/scripts.pory"
	applymovement LOCALID_AIDE, Common_Movement_ExclamationMark
# 696 "data/maps/PewterCity/scripts.pory"
	waitmovement 0
# 697 "data/maps/PewterCity/scripts.pory"
	applymovement LOCALID_AIDE, Common_Movement_Delay48
# 698 "data/maps/PewterCity/scripts.pory"
	waitmovement 0
# 699 "data/maps/PewterCity/scripts.pory"
	msgbox PewterCity_Text_OhPlayer
# 700 "data/maps/PewterCity/scripts.pory"
	call_if_eq VAR_TEMP_1, 0, PewterCity_EventScript_AideApproachPlayer0
# 701 "data/maps/PewterCity/scripts.pory"
	call_if_eq VAR_TEMP_1, 1, PewterCity_EventScript_AideApproachPlayer1
# 702 "data/maps/PewterCity/scripts.pory"
	call_if_eq VAR_TEMP_1, 2, PewterCity_EventScript_AideApproachPlayer2
# 703 "data/maps/PewterCity/scripts.pory"
	call_if_eq VAR_TEMP_1, 3, PewterCity_EventScript_AideApproachPlayer3
# 704 "data/maps/PewterCity/scripts.pory"
	msgbox PewterCity_Text_AskedToDeliverThis
# 705 "data/maps/PewterCity/scripts.pory"
	textcolor NPC_TEXT_COLOR_NEUTRAL
# 706 "data/maps/PewterCity/scripts.pory"
	playfanfare MUS_OBTAIN_KEY_ITEM
# 707 "data/maps/PewterCity/scripts.pory"
	message PewterCity_Text_ReceivedRunningShoesFromAide
# 708 "data/maps/PewterCity/scripts.pory"
	waitmessage
# 709 "data/maps/PewterCity/scripts.pory"
	waitfanfare
# 710 "data/maps/PewterCity/scripts.pory"
	msgbox PewterCity_Text_SwitchedShoesWithRunningShoes
# 711 "data/maps/PewterCity/scripts.pory"
	special DisableMsgBoxWalkaway
# 712 "data/maps/PewterCity/scripts.pory"
	signmsg
# 713 "data/maps/PewterCity/scripts.pory"
	msgbox PewterCity_Text_ExplainRunningShoes
# 714 "data/maps/PewterCity/scripts.pory"
	normalmsg
# 715 "data/maps/PewterCity/scripts.pory"
	call EventScript_RestorePrevTextColor
# 716 "data/maps/PewterCity/scripts.pory"
	msgbox PewterCity_Text_MustBeGoingBackToLab
# 717 "data/maps/PewterCity/scripts.pory"
	closemessage
# 718 "data/maps/PewterCity/scripts.pory"
	call_if_eq VAR_TEMP_1, 0, PewterCity_EventScript_AideExit0
# 719 "data/maps/PewterCity/scripts.pory"
	call_if_eq VAR_TEMP_1, 1, PewterCity_EventScript_AideExit1
# 720 "data/maps/PewterCity/scripts.pory"
	call_if_eq VAR_TEMP_1, 2, PewterCity_EventScript_AideExit2
# 721 "data/maps/PewterCity/scripts.pory"
	call_if_eq VAR_TEMP_1, 3, PewterCity_EventScript_AideExit3
# 722 "data/maps/PewterCity/scripts.pory"
	delay 30
# 723 "data/maps/PewterCity/scripts.pory"
	textcolor NPC_TEXT_COLOR_NEUTRAL
# 724 "data/maps/PewterCity/scripts.pory"
	msgbox PewterCity_Text_RunningShoesLetterFromMom
# 725 "data/maps/PewterCity/scripts.pory"
	closemessage
# 726 "data/maps/PewterCity/scripts.pory"
	removeobject LOCALID_AIDE
# 727 "data/maps/PewterCity/scripts.pory"
	setflag FLAG_SYS_B_DASH
# 728 "data/maps/PewterCity/scripts.pory"
	setvar VAR_MAP_SCENE_PEWTER_CITY, 2
# 729 "data/maps/PewterCity/scripts.pory"
	return
# 730 "data/maps/PewterCity/scripts.pory"

# 731 "data/maps/PewterCity/scripts.pory"
PewterCity_EventScript_AideNoticePlayer::
# 732 "data/maps/PewterCity/scripts.pory"
	applymovement LOCALID_AIDE, Common_Movement_WalkInPlaceFasterDown
# 733 "data/maps/PewterCity/scripts.pory"
	waitmovement 0
# 734 "data/maps/PewterCity/scripts.pory"
	return
# 735 "data/maps/PewterCity/scripts.pory"

# 736 "data/maps/PewterCity/scripts.pory"
@ Aide already at player
# 737 "data/maps/PewterCity/scripts.pory"
PewterCity_EventScript_AideApproachPlayer0::
# 738 "data/maps/PewterCity/scripts.pory"
	closemessage
# 739 "data/maps/PewterCity/scripts.pory"
	delay 20
# 740 "data/maps/PewterCity/scripts.pory"
	return
# 741 "data/maps/PewterCity/scripts.pory"

# 742 "data/maps/PewterCity/scripts.pory"
PewterCity_EventScript_AideApproachPlayer1::
# 743 "data/maps/PewterCity/scripts.pory"
	closemessage
# 744 "data/maps/PewterCity/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, Common_Movement_WalkInPlaceFasterUp
# 745 "data/maps/PewterCity/scripts.pory"
	waitmovement 0
# 746 "data/maps/PewterCity/scripts.pory"
	return
# 747 "data/maps/PewterCity/scripts.pory"

# 748 "data/maps/PewterCity/scripts.pory"
PewterCity_EventScript_AideApproachPlayer2::
# 749 "data/maps/PewterCity/scripts.pory"
	closemessage
# 750 "data/maps/PewterCity/scripts.pory"
	applymovement LOCALID_AIDE, PewterCity_Movement_AideApproachPlayerMid
# 751 "data/maps/PewterCity/scripts.pory"
	waitmovement 0
# 752 "data/maps/PewterCity/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, Common_Movement_WalkInPlaceFasterUp
# 753 "data/maps/PewterCity/scripts.pory"
	waitmovement 0
# 754 "data/maps/PewterCity/scripts.pory"
	return
# 755 "data/maps/PewterCity/scripts.pory"

# 756 "data/maps/PewterCity/scripts.pory"
PewterCity_EventScript_AideApproachPlayer3::
# 757 "data/maps/PewterCity/scripts.pory"
	closemessage
# 758 "data/maps/PewterCity/scripts.pory"
	applymovement LOCALID_AIDE, PewterCity_Movement_AideApproachPlayerBottom
# 759 "data/maps/PewterCity/scripts.pory"
	waitmovement 0
# 760 "data/maps/PewterCity/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, Common_Movement_WalkInPlaceFasterUp
# 761 "data/maps/PewterCity/scripts.pory"
	waitmovement 0
# 762 "data/maps/PewterCity/scripts.pory"
	return
# 763 "data/maps/PewterCity/scripts.pory"

# 764 "data/maps/PewterCity/scripts.pory"
PewterCity_EventScript_AideExit0::
# 765 "data/maps/PewterCity/scripts.pory"
	applymovement LOCALID_AIDE, PewterCity_Movement_AideExit0
# 766 "data/maps/PewterCity/scripts.pory"
	waitmovement 0
# 767 "data/maps/PewterCity/scripts.pory"
	return
# 768 "data/maps/PewterCity/scripts.pory"

# 769 "data/maps/PewterCity/scripts.pory"
PewterCity_EventScript_AideExit1::
# 770 "data/maps/PewterCity/scripts.pory"
	applymovement LOCALID_AIDE, PewterCity_Movement_AideExit1
# 771 "data/maps/PewterCity/scripts.pory"
	waitmovement 0
# 772 "data/maps/PewterCity/scripts.pory"
	return
# 773 "data/maps/PewterCity/scripts.pory"

# 774 "data/maps/PewterCity/scripts.pory"
PewterCity_EventScript_AideExit2::
# 775 "data/maps/PewterCity/scripts.pory"
	applymovement LOCALID_AIDE, PewterCity_Movement_AideExit2
# 776 "data/maps/PewterCity/scripts.pory"
	waitmovement 0
# 777 "data/maps/PewterCity/scripts.pory"
	return
# 778 "data/maps/PewterCity/scripts.pory"

# 779 "data/maps/PewterCity/scripts.pory"
PewterCity_EventScript_AideExit3::
# 780 "data/maps/PewterCity/scripts.pory"
	applymovement LOCALID_AIDE, PewterCity_Movement_AideExit3
# 781 "data/maps/PewterCity/scripts.pory"
	waitmovement 0
# 782 "data/maps/PewterCity/scripts.pory"
	return
# 783 "data/maps/PewterCity/scripts.pory"

# 784 "data/maps/PewterCity/scripts.pory"
PewterCity_Movement_AideApproachPlayerMid::
# 785 "data/maps/PewterCity/scripts.pory"
	delay_4
# 786 "data/maps/PewterCity/scripts.pory"
	walk_down
# 787 "data/maps/PewterCity/scripts.pory"
	step_end
# 788 "data/maps/PewterCity/scripts.pory"

# 789 "data/maps/PewterCity/scripts.pory"
PewterCity_Movement_AideApproachPlayerBottom::
# 790 "data/maps/PewterCity/scripts.pory"
	delay_4
# 791 "data/maps/PewterCity/scripts.pory"
	walk_down
# 792 "data/maps/PewterCity/scripts.pory"
	walk_down
# 793 "data/maps/PewterCity/scripts.pory"
	step_end
# 794 "data/maps/PewterCity/scripts.pory"

# 795 "data/maps/PewterCity/scripts.pory"
PewterCity_Movement_AideExit0::
# 796 "data/maps/PewterCity/scripts.pory"
	walk_down
# 797 "data/maps/PewterCity/scripts.pory"
	walk_left
# 798 "data/maps/PewterCity/scripts.pory"
	walk_left
# 799 "data/maps/PewterCity/scripts.pory"
	walk_left
# 800 "data/maps/PewterCity/scripts.pory"
	walk_left
# 801 "data/maps/PewterCity/scripts.pory"
	walk_left
# 802 "data/maps/PewterCity/scripts.pory"
	walk_left
# 803 "data/maps/PewterCity/scripts.pory"
	walk_left
# 804 "data/maps/PewterCity/scripts.pory"
	walk_left
# 805 "data/maps/PewterCity/scripts.pory"
	walk_left
# 806 "data/maps/PewterCity/scripts.pory"
	step_end
# 807 "data/maps/PewterCity/scripts.pory"

# 808 "data/maps/PewterCity/scripts.pory"
PewterCity_Movement_AideExit1::
# 809 "data/maps/PewterCity/scripts.pory"
	walk_left
# 810 "data/maps/PewterCity/scripts.pory"
	walk_down
# 811 "data/maps/PewterCity/scripts.pory"
	walk_left
# 812 "data/maps/PewterCity/scripts.pory"
	walk_left
# 813 "data/maps/PewterCity/scripts.pory"
	walk_left
# 814 "data/maps/PewterCity/scripts.pory"
	walk_left
# 815 "data/maps/PewterCity/scripts.pory"
	walk_left
# 816 "data/maps/PewterCity/scripts.pory"
	walk_left
# 817 "data/maps/PewterCity/scripts.pory"
	walk_left
# 818 "data/maps/PewterCity/scripts.pory"
	walk_left
# 819 "data/maps/PewterCity/scripts.pory"
	step_end
# 820 "data/maps/PewterCity/scripts.pory"

# 821 "data/maps/PewterCity/scripts.pory"
PewterCity_Movement_AideExit2::
# 822 "data/maps/PewterCity/scripts.pory"
	walk_left
# 823 "data/maps/PewterCity/scripts.pory"
	walk_left
# 824 "data/maps/PewterCity/scripts.pory"
	walk_left
# 825 "data/maps/PewterCity/scripts.pory"
	walk_left
# 826 "data/maps/PewterCity/scripts.pory"
	walk_left
# 827 "data/maps/PewterCity/scripts.pory"
	walk_left
# 828 "data/maps/PewterCity/scripts.pory"
	walk_left
# 829 "data/maps/PewterCity/scripts.pory"
	walk_left
# 830 "data/maps/PewterCity/scripts.pory"
	walk_left
# 831 "data/maps/PewterCity/scripts.pory"
	step_end
# 832 "data/maps/PewterCity/scripts.pory"

# 833 "data/maps/PewterCity/scripts.pory"
PewterCity_Movement_AideExit3::
# 834 "data/maps/PewterCity/scripts.pory"
	walk_left
# 835 "data/maps/PewterCity/scripts.pory"
	walk_left
# 836 "data/maps/PewterCity/scripts.pory"
	walk_left
# 837 "data/maps/PewterCity/scripts.pory"
	walk_left
# 838 "data/maps/PewterCity/scripts.pory"
	walk_left
# 839 "data/maps/PewterCity/scripts.pory"
	walk_left
# 840 "data/maps/PewterCity/scripts.pory"
	walk_left
# 841 "data/maps/PewterCity/scripts.pory"
	walk_left
# 842 "data/maps/PewterCity/scripts.pory"
	walk_left
# 843 "data/maps/PewterCity/scripts.pory"
	step_end
# 844 "data/maps/PewterCity/scripts.pory"

# 845 "data/maps/PewterCity/scripts.pory"
@ Unused
# 846 "data/maps/PewterCity/scripts.pory"
PewterCity_Movement_WalkInPlaceLeft::
# 847 "data/maps/PewterCity/scripts.pory"
	walk_in_place_left
# 848 "data/maps/PewterCity/scripts.pory"
	step_end
