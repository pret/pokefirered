# 1 "data/maps/Route16_NorthEntrance_1F/scripts.pory"

# 2 "data/maps/Route16_NorthEntrance_1F/scripts.pory"
Route16_NorthEntrance_1F_MapScripts::
# 3 "data/maps/Route16_NorthEntrance_1F/scripts.pory"
	map_script MAP_SCRIPT_ON_TRANSITION, Route16_NorthEntrance_1F_OnTransition
# 4 "data/maps/Route16_NorthEntrance_1F/scripts.pory"
	.byte 0
# 5 "data/maps/Route16_NorthEntrance_1F/scripts.pory"

# 6 "data/maps/Route16_NorthEntrance_1F/scripts.pory"
Route16_NorthEntrance_1F_OnTransition::
# 7 "data/maps/Route16_NorthEntrance_1F/scripts.pory"
	clearflag FLAG_SYS_ON_CYCLING_ROAD
# 8 "data/maps/Route16_NorthEntrance_1F/scripts.pory"
	call_if_set FLAG_GOT_BICYCLE, Route16_NorthEntrance_1F_EventScript_DisableNeedBikeTrigger
# 9 "data/maps/Route16_NorthEntrance_1F/scripts.pory"
	end
# 10 "data/maps/Route16_NorthEntrance_1F/scripts.pory"

# 11 "data/maps/Route16_NorthEntrance_1F/scripts.pory"
Route16_NorthEntrance_1F_EventScript_DisableNeedBikeTrigger::
# 12 "data/maps/Route16_NorthEntrance_1F/scripts.pory"
	setvar VAR_TEMP_1, 1
# 13 "data/maps/Route16_NorthEntrance_1F/scripts.pory"
	return
# 14 "data/maps/Route16_NorthEntrance_1F/scripts.pory"

# 15 "data/maps/Route16_NorthEntrance_1F/scripts.pory"
Route16_NorthEntrance_1F_EventScript_Guard::
# 16 "data/maps/Route16_NorthEntrance_1F/scripts.pory"
	msgbox Route16_NorthEntrance_1F_Text_CyclingRoadIsDownhillCourse, MSGBOX_NPC
# 17 "data/maps/Route16_NorthEntrance_1F/scripts.pory"
	end
# 18 "data/maps/Route16_NorthEntrance_1F/scripts.pory"

# 19 "data/maps/Route16_NorthEntrance_1F/scripts.pory"
Route16_NorthEntrance_1F_EventScript_NeedBikeTriggerTop::
# 20 "data/maps/Route16_NorthEntrance_1F/scripts.pory"
	lockall
# 21 "data/maps/Route16_NorthEntrance_1F/scripts.pory"
	setvar VAR_0x8008, 0
# 22 "data/maps/Route16_NorthEntrance_1F/scripts.pory"
	goto Route16_NorthEntrance_1F_EventScript_NeedBikeTrigger
# 23 "data/maps/Route16_NorthEntrance_1F/scripts.pory"
	end
# 24 "data/maps/Route16_NorthEntrance_1F/scripts.pory"

# 25 "data/maps/Route16_NorthEntrance_1F/scripts.pory"
Route16_NorthEntrance_1F_EventScript_NeedBikeTriggerMidTop::
# 26 "data/maps/Route16_NorthEntrance_1F/scripts.pory"
	lockall
# 27 "data/maps/Route16_NorthEntrance_1F/scripts.pory"
	setvar VAR_0x8008, 1
# 28 "data/maps/Route16_NorthEntrance_1F/scripts.pory"
	goto Route16_NorthEntrance_1F_EventScript_NeedBikeTrigger
# 29 "data/maps/Route16_NorthEntrance_1F/scripts.pory"
	end
# 30 "data/maps/Route16_NorthEntrance_1F/scripts.pory"

# 31 "data/maps/Route16_NorthEntrance_1F/scripts.pory"
Route16_NorthEntrance_1F_EventScript_NeedBikeTriggerMid::
# 32 "data/maps/Route16_NorthEntrance_1F/scripts.pory"
	lockall
# 33 "data/maps/Route16_NorthEntrance_1F/scripts.pory"
	setvar VAR_0x8008, 2
# 34 "data/maps/Route16_NorthEntrance_1F/scripts.pory"
	goto Route16_NorthEntrance_1F_EventScript_NeedBikeTrigger
# 35 "data/maps/Route16_NorthEntrance_1F/scripts.pory"
	end
# 36 "data/maps/Route16_NorthEntrance_1F/scripts.pory"

# 37 "data/maps/Route16_NorthEntrance_1F/scripts.pory"
Route16_NorthEntrance_1F_EventScript_NeedBikeTriggerMidBottom::
# 38 "data/maps/Route16_NorthEntrance_1F/scripts.pory"
	lockall
# 39 "data/maps/Route16_NorthEntrance_1F/scripts.pory"
	setvar VAR_0x8008, 3
# 40 "data/maps/Route16_NorthEntrance_1F/scripts.pory"
	goto Route16_NorthEntrance_1F_EventScript_NeedBikeTrigger
# 41 "data/maps/Route16_NorthEntrance_1F/scripts.pory"
	end
# 42 "data/maps/Route16_NorthEntrance_1F/scripts.pory"

# 43 "data/maps/Route16_NorthEntrance_1F/scripts.pory"
Route16_NorthEntrance_1F_EventScript_NeedBikeTriggerBottom::
# 44 "data/maps/Route16_NorthEntrance_1F/scripts.pory"
	lockall
# 45 "data/maps/Route16_NorthEntrance_1F/scripts.pory"
	setvar VAR_0x8008, 4
# 46 "data/maps/Route16_NorthEntrance_1F/scripts.pory"
	goto Route16_NorthEntrance_1F_EventScript_NeedBikeTrigger
# 47 "data/maps/Route16_NorthEntrance_1F/scripts.pory"
	end
# 48 "data/maps/Route16_NorthEntrance_1F/scripts.pory"

# 49 "data/maps/Route16_NorthEntrance_1F/scripts.pory"
Route16_NorthEntrance_1F_EventScript_NeedBikeTrigger::
# 50 "data/maps/Route16_NorthEntrance_1F/scripts.pory"
	textcolor NPC_TEXT_COLOR_MALE
# 51 "data/maps/Route16_NorthEntrance_1F/scripts.pory"
	msgbox Route16_NorthEntrance_1F_Text_ExcuseMeWaitUp
# 52 "data/maps/Route16_NorthEntrance_1F/scripts.pory"
	closemessage
# 53 "data/maps/Route16_NorthEntrance_1F/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, Common_Movement_WalkInPlaceFasterUp
# 54 "data/maps/Route16_NorthEntrance_1F/scripts.pory"
	waitmovement 0
# 55 "data/maps/Route16_NorthEntrance_1F/scripts.pory"
	delay 20
# 56 "data/maps/Route16_NorthEntrance_1F/scripts.pory"
	call_if_eq VAR_0x8008, 1, Route16_NorthEntrance_1F_EventScript_PlayerWalkToCounterMidTop
# 57 "data/maps/Route16_NorthEntrance_1F/scripts.pory"
	call_if_eq VAR_0x8008, 2, Route16_NorthEntrance_1F_EventScript_PlayerWalkToCounterMid
# 58 "data/maps/Route16_NorthEntrance_1F/scripts.pory"
	call_if_eq VAR_0x8008, 3, Route16_NorthEntrance_1F_EventScript_PlayerWalkToCounterMidBottom
# 59 "data/maps/Route16_NorthEntrance_1F/scripts.pory"
	call_if_eq VAR_0x8008, 4, Route16_NorthEntrance_1F_EventScript_PlayerWalkToCounterBottom
# 60 "data/maps/Route16_NorthEntrance_1F/scripts.pory"
	msgbox Route16_NorthEntrance_1F_Text_NoPedestriansOnCyclingRoad
# 61 "data/maps/Route16_NorthEntrance_1F/scripts.pory"
	closemessage
# 62 "data/maps/Route16_NorthEntrance_1F/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, Route16_NorthEntrance_1F_Movement_WalkRight
# 63 "data/maps/Route16_NorthEntrance_1F/scripts.pory"
	waitmovement 0
# 64 "data/maps/Route16_NorthEntrance_1F/scripts.pory"
	releaseall
# 65 "data/maps/Route16_NorthEntrance_1F/scripts.pory"
	end
# 66 "data/maps/Route16_NorthEntrance_1F/scripts.pory"

# 67 "data/maps/Route16_NorthEntrance_1F/scripts.pory"
Route16_NorthEntrance_1F_EventScript_PlayerWalkToCounterMidTop::
# 68 "data/maps/Route16_NorthEntrance_1F/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, Route16_NorthEntrance_1F_Movement_WalkUp
# 69 "data/maps/Route16_NorthEntrance_1F/scripts.pory"
	waitmovement 0
# 70 "data/maps/Route16_NorthEntrance_1F/scripts.pory"
	return
# 71 "data/maps/Route16_NorthEntrance_1F/scripts.pory"

# 72 "data/maps/Route16_NorthEntrance_1F/scripts.pory"
Route16_NorthEntrance_1F_EventScript_PlayerWalkToCounterMid::
# 73 "data/maps/Route16_NorthEntrance_1F/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, Route16_NorthEntrance_1F_Movement_WalkUp2
# 74 "data/maps/Route16_NorthEntrance_1F/scripts.pory"
	waitmovement 0
# 75 "data/maps/Route16_NorthEntrance_1F/scripts.pory"
	return
# 76 "data/maps/Route16_NorthEntrance_1F/scripts.pory"

# 77 "data/maps/Route16_NorthEntrance_1F/scripts.pory"
Route16_NorthEntrance_1F_EventScript_PlayerWalkToCounterMidBottom::
# 78 "data/maps/Route16_NorthEntrance_1F/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, Route16_NorthEntrance_1F_Movement_WalkUp3
# 79 "data/maps/Route16_NorthEntrance_1F/scripts.pory"
	waitmovement 0
# 80 "data/maps/Route16_NorthEntrance_1F/scripts.pory"
	return
# 81 "data/maps/Route16_NorthEntrance_1F/scripts.pory"

# 82 "data/maps/Route16_NorthEntrance_1F/scripts.pory"
Route16_NorthEntrance_1F_EventScript_PlayerWalkToCounterBottom::
# 83 "data/maps/Route16_NorthEntrance_1F/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, Route16_NorthEntrance_1F_Movement_WalkUp4
# 84 "data/maps/Route16_NorthEntrance_1F/scripts.pory"
	waitmovement 0
# 85 "data/maps/Route16_NorthEntrance_1F/scripts.pory"
	return
# 86 "data/maps/Route16_NorthEntrance_1F/scripts.pory"

# 87 "data/maps/Route16_NorthEntrance_1F/scripts.pory"
Route16_NorthEntrance_1F_Movement_WalkUp::
# 88 "data/maps/Route16_NorthEntrance_1F/scripts.pory"
	walk_up
# 89 "data/maps/Route16_NorthEntrance_1F/scripts.pory"
	step_end
# 90 "data/maps/Route16_NorthEntrance_1F/scripts.pory"

# 91 "data/maps/Route16_NorthEntrance_1F/scripts.pory"
Route16_NorthEntrance_1F_Movement_WalkUp2::
# 92 "data/maps/Route16_NorthEntrance_1F/scripts.pory"
	walk_up
# 93 "data/maps/Route16_NorthEntrance_1F/scripts.pory"
	walk_up
# 94 "data/maps/Route16_NorthEntrance_1F/scripts.pory"
	step_end
# 95 "data/maps/Route16_NorthEntrance_1F/scripts.pory"

# 96 "data/maps/Route16_NorthEntrance_1F/scripts.pory"
Route16_NorthEntrance_1F_Movement_WalkUp3::
# 97 "data/maps/Route16_NorthEntrance_1F/scripts.pory"
	walk_up
# 98 "data/maps/Route16_NorthEntrance_1F/scripts.pory"
	walk_up
# 99 "data/maps/Route16_NorthEntrance_1F/scripts.pory"
	walk_up
# 100 "data/maps/Route16_NorthEntrance_1F/scripts.pory"
	step_end
# 101 "data/maps/Route16_NorthEntrance_1F/scripts.pory"

# 102 "data/maps/Route16_NorthEntrance_1F/scripts.pory"
Route16_NorthEntrance_1F_Movement_WalkUp4::
# 103 "data/maps/Route16_NorthEntrance_1F/scripts.pory"
	walk_up
# 104 "data/maps/Route16_NorthEntrance_1F/scripts.pory"
	walk_up
# 105 "data/maps/Route16_NorthEntrance_1F/scripts.pory"
	walk_up
# 106 "data/maps/Route16_NorthEntrance_1F/scripts.pory"
	walk_up
# 107 "data/maps/Route16_NorthEntrance_1F/scripts.pory"
	step_end
# 108 "data/maps/Route16_NorthEntrance_1F/scripts.pory"

# 109 "data/maps/Route16_NorthEntrance_1F/scripts.pory"
Route16_NorthEntrance_1F_Movement_WalkRight::
# 110 "data/maps/Route16_NorthEntrance_1F/scripts.pory"
	walk_right
# 111 "data/maps/Route16_NorthEntrance_1F/scripts.pory"
	step_end
# 112 "data/maps/Route16_NorthEntrance_1F/scripts.pory"

# 113 "data/maps/Route16_NorthEntrance_1F/scripts.pory"
Route16_NorthEntrance_1F_EventScript_OldMan::
# 114 "data/maps/Route16_NorthEntrance_1F/scripts.pory"
	msgbox Route16_NorthEntrance_1F_Text_HowdYouGetInGoodEffort, MSGBOX_NPC
# 115 "data/maps/Route16_NorthEntrance_1F/scripts.pory"
	end
