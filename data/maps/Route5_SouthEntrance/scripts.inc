# 1 "data/maps/Route5_SouthEntrance/scripts.pory"

# 2 "data/maps/Route5_SouthEntrance/scripts.pory"
Route5_SouthEntrance_MapScripts::
# 3 "data/maps/Route5_SouthEntrance/scripts.pory"
	.byte 0
# 4 "data/maps/Route5_SouthEntrance/scripts.pory"

# 5 "data/maps/Route5_SouthEntrance/scripts.pory"
Route5_SouthEntrance_EventScript_Guard::
# 6 "data/maps/Route5_SouthEntrance/scripts.pory"
	msgbox Route5_SouthEntrance_Text_HiHowsItGoing, MSGBOX_NPC
# 7 "data/maps/Route5_SouthEntrance/scripts.pory"
	end
# 8 "data/maps/Route5_SouthEntrance/scripts.pory"

# 9 "data/maps/Route5_SouthEntrance/scripts.pory"
Route5_SouthEntrance_EventScript_GuardTriggerLeft::
# 10 "data/maps/Route5_SouthEntrance/scripts.pory"
	lockall
# 11 "data/maps/Route5_SouthEntrance/scripts.pory"
	setvar VAR_TEMP_1, 0
# 12 "data/maps/Route5_SouthEntrance/scripts.pory"
	goto Route5_SouthEntrance_EventScript_GuardTrigger
# 13 "data/maps/Route5_SouthEntrance/scripts.pory"
	end
# 14 "data/maps/Route5_SouthEntrance/scripts.pory"

# 15 "data/maps/Route5_SouthEntrance/scripts.pory"
Route5_SouthEntrance_EventScript_GuardTriggerMid::
# 16 "data/maps/Route5_SouthEntrance/scripts.pory"
	lockall
# 17 "data/maps/Route5_SouthEntrance/scripts.pory"
	setvar VAR_TEMP_1, 1
# 18 "data/maps/Route5_SouthEntrance/scripts.pory"
	goto Route5_SouthEntrance_EventScript_GuardTrigger
# 19 "data/maps/Route5_SouthEntrance/scripts.pory"
	end
# 20 "data/maps/Route5_SouthEntrance/scripts.pory"

# 21 "data/maps/Route5_SouthEntrance/scripts.pory"
Route5_SouthEntrance_EventScript_GuardTriggerRight::
# 22 "data/maps/Route5_SouthEntrance/scripts.pory"
	lockall
# 23 "data/maps/Route5_SouthEntrance/scripts.pory"
	setvar VAR_TEMP_1, 2
# 24 "data/maps/Route5_SouthEntrance/scripts.pory"
	goto Route5_SouthEntrance_EventScript_GuardTrigger
# 25 "data/maps/Route5_SouthEntrance/scripts.pory"
	end
# 26 "data/maps/Route5_SouthEntrance/scripts.pory"

# 27 "data/maps/Route5_SouthEntrance/scripts.pory"
Route5_SouthEntrance_EventScript_GuardTrigger::
# 28 "data/maps/Route5_SouthEntrance/scripts.pory"
	textcolor NPC_TEXT_COLOR_MALE
# 29 "data/maps/Route5_SouthEntrance/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, Common_Movement_WalkInPlaceFasterLeft
# 30 "data/maps/Route5_SouthEntrance/scripts.pory"
	waitmovement 0
# 31 "data/maps/Route5_SouthEntrance/scripts.pory"
	goto_if_set FLAG_GOT_TEA, Route5_SouthEntrance_EventScript_GiveTea
# 32 "data/maps/Route5_SouthEntrance/scripts.pory"
	msgbox Route5_SouthEntrance_Text_ThirstyOnGuardDuty
# 33 "data/maps/Route5_SouthEntrance/scripts.pory"
	closemessage
# 34 "data/maps/Route5_SouthEntrance/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, Route5_SouthEntrance_Movement_BlockPlayerEntry
# 35 "data/maps/Route5_SouthEntrance/scripts.pory"
	waitmovement 0
# 36 "data/maps/Route5_SouthEntrance/scripts.pory"
	releaseall
# 37 "data/maps/Route5_SouthEntrance/scripts.pory"
	end
# 38 "data/maps/Route5_SouthEntrance/scripts.pory"

# 39 "data/maps/Route5_SouthEntrance/scripts.pory"
Route5_SouthEntrance_EventScript_GiveTea::
# 40 "data/maps/Route5_SouthEntrance/scripts.pory"
	removeitem ITEM_TEA
# 41 "data/maps/Route5_SouthEntrance/scripts.pory"
	goto Route5_SouthEntrance_EventScript_GuardDrinkTea
# 42 "data/maps/Route5_SouthEntrance/scripts.pory"
	end
# 43 "data/maps/Route5_SouthEntrance/scripts.pory"

# 44 "data/maps/Route5_SouthEntrance/scripts.pory"
Route5_SouthEntrance_EventScript_GuardDrinkTea::
# 45 "data/maps/Route5_SouthEntrance/scripts.pory"
	msgbox Route5_SouthEntrance_Text_ThatTeaLooksTasty
# 46 "data/maps/Route5_SouthEntrance/scripts.pory"
	closemessage
# 47 "data/maps/Route5_SouthEntrance/scripts.pory"
	call_if_eq VAR_TEMP_1, 0, Route5_SouthEntrance_EventScript_WalkToGuardLeft
# 48 "data/maps/Route5_SouthEntrance/scripts.pory"
	call_if_eq VAR_TEMP_1, 1, Route5_SouthEntrance_EventScript_WalkToGuardMid
# 49 "data/maps/Route5_SouthEntrance/scripts.pory"
	call_if_eq VAR_TEMP_1, 2, Route5_SouthEntrance_EventScript_WalkToGuardRight
# 50 "data/maps/Route5_SouthEntrance/scripts.pory"
	msgbox Route5_SouthEntrance_Text_ThanksIllShareTeaWithGuards
# 51 "data/maps/Route5_SouthEntrance/scripts.pory"
	setvar VAR_MAP_SCENE_ROUTE5_ROUTE6_ROUTE7_ROUTE8_GATES, 1
# 52 "data/maps/Route5_SouthEntrance/scripts.pory"
	releaseall
# 53 "data/maps/Route5_SouthEntrance/scripts.pory"
	end
# 54 "data/maps/Route5_SouthEntrance/scripts.pory"

# 55 "data/maps/Route5_SouthEntrance/scripts.pory"
Route5_SouthEntrance_EventScript_WalkToGuardLeft::
# 56 "data/maps/Route5_SouthEntrance/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, Route5_SouthEntrance_Movement_WalkToGuardLeft
# 57 "data/maps/Route5_SouthEntrance/scripts.pory"
	waitmovement 0
# 58 "data/maps/Route5_SouthEntrance/scripts.pory"
	return
# 59 "data/maps/Route5_SouthEntrance/scripts.pory"

# 60 "data/maps/Route5_SouthEntrance/scripts.pory"
Route5_SouthEntrance_EventScript_WalkToGuardMid::
# 61 "data/maps/Route5_SouthEntrance/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, Route5_SouthEntrance_Movement_WalkToGuardMid
# 62 "data/maps/Route5_SouthEntrance/scripts.pory"
	waitmovement 0
# 63 "data/maps/Route5_SouthEntrance/scripts.pory"
	return
# 64 "data/maps/Route5_SouthEntrance/scripts.pory"

# 65 "data/maps/Route5_SouthEntrance/scripts.pory"
Route5_SouthEntrance_EventScript_WalkToGuardRight::
# 66 "data/maps/Route5_SouthEntrance/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, Route5_SouthEntrance_Movement_WalkToGuardRight
# 67 "data/maps/Route5_SouthEntrance/scripts.pory"
	waitmovement 0
# 68 "data/maps/Route5_SouthEntrance/scripts.pory"
	return
# 69 "data/maps/Route5_SouthEntrance/scripts.pory"

# 70 "data/maps/Route5_SouthEntrance/scripts.pory"
Route5_SouthEntrance_Movement_WalkToGuardMid::
# 71 "data/maps/Route5_SouthEntrance/scripts.pory"
	walk_left
# 72 "data/maps/Route5_SouthEntrance/scripts.pory"
	step_end
# 73 "data/maps/Route5_SouthEntrance/scripts.pory"

# 74 "data/maps/Route5_SouthEntrance/scripts.pory"
Route5_SouthEntrance_Movement_WalkToGuardRight::
# 75 "data/maps/Route5_SouthEntrance/scripts.pory"
	walk_left
# 76 "data/maps/Route5_SouthEntrance/scripts.pory"
	walk_left
# 77 "data/maps/Route5_SouthEntrance/scripts.pory"
	step_end
# 78 "data/maps/Route5_SouthEntrance/scripts.pory"

# 79 "data/maps/Route5_SouthEntrance/scripts.pory"
Route5_SouthEntrance_Movement_WalkToGuardLeft::
# 80 "data/maps/Route5_SouthEntrance/scripts.pory"
	walk_in_place_left
# 81 "data/maps/Route5_SouthEntrance/scripts.pory"
	step_end
# 82 "data/maps/Route5_SouthEntrance/scripts.pory"

# 83 "data/maps/Route5_SouthEntrance/scripts.pory"
Route5_SouthEntrance_Movement_BlockPlayerEntry::
# 84 "data/maps/Route5_SouthEntrance/scripts.pory"
	walk_up
# 85 "data/maps/Route5_SouthEntrance/scripts.pory"
	step_end
