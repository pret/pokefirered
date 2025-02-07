# 1 "data/maps/Route8_WestEntrance/scripts.pory"

# 2 "data/maps/Route8_WestEntrance/scripts.pory"
Route8_WestEntrance_MapScripts::
# 3 "data/maps/Route8_WestEntrance/scripts.pory"
	.byte 0
# 4 "data/maps/Route8_WestEntrance/scripts.pory"

# 5 "data/maps/Route8_WestEntrance/scripts.pory"
Route8_WestEntrance_EventScript_Guard::
# 6 "data/maps/Route8_WestEntrance/scripts.pory"
	msgbox Route8_WestEntrance_Text_HiHowsItGoing, MSGBOX_NPC
# 7 "data/maps/Route8_WestEntrance/scripts.pory"
	end
# 8 "data/maps/Route8_WestEntrance/scripts.pory"

# 9 "data/maps/Route8_WestEntrance/scripts.pory"
Route8_WestEntrance_EventScript_GuardTriggerTop::
# 10 "data/maps/Route8_WestEntrance/scripts.pory"
	lockall
# 11 "data/maps/Route8_WestEntrance/scripts.pory"
	setvar VAR_TEMP_1, 0
# 12 "data/maps/Route8_WestEntrance/scripts.pory"
	goto Route8_WestEntrance_EventScript_GuardTrigger
# 13 "data/maps/Route8_WestEntrance/scripts.pory"
	end
# 14 "data/maps/Route8_WestEntrance/scripts.pory"

# 15 "data/maps/Route8_WestEntrance/scripts.pory"
Route8_WestEntrance_EventScript_GuardTriggerMid::
# 16 "data/maps/Route8_WestEntrance/scripts.pory"
	lockall
# 17 "data/maps/Route8_WestEntrance/scripts.pory"
	setvar VAR_TEMP_1, 1
# 18 "data/maps/Route8_WestEntrance/scripts.pory"
	goto Route8_WestEntrance_EventScript_GuardTrigger
# 19 "data/maps/Route8_WestEntrance/scripts.pory"
	end
# 20 "data/maps/Route8_WestEntrance/scripts.pory"

# 21 "data/maps/Route8_WestEntrance/scripts.pory"
Route8_WestEntrance_EventScript_GuardTriggerBottom::
# 22 "data/maps/Route8_WestEntrance/scripts.pory"
	lockall
# 23 "data/maps/Route8_WestEntrance/scripts.pory"
	setvar VAR_TEMP_1, 2
# 24 "data/maps/Route8_WestEntrance/scripts.pory"
	goto Route8_WestEntrance_EventScript_GuardTrigger
# 25 "data/maps/Route8_WestEntrance/scripts.pory"
	end
# 26 "data/maps/Route8_WestEntrance/scripts.pory"

# 27 "data/maps/Route8_WestEntrance/scripts.pory"
Route8_WestEntrance_EventScript_GuardTrigger::
# 28 "data/maps/Route8_WestEntrance/scripts.pory"
	textcolor NPC_TEXT_COLOR_MALE
# 29 "data/maps/Route8_WestEntrance/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, Common_Movement_WalkInPlaceFasterUp
# 30 "data/maps/Route8_WestEntrance/scripts.pory"
	waitmovement 0
# 31 "data/maps/Route8_WestEntrance/scripts.pory"
	goto_if_set FLAG_GOT_TEA, Route8_WestEntrance_EventScript_GiveTea
# 32 "data/maps/Route8_WestEntrance/scripts.pory"
	msgbox Route8_WestEntrance_Text_ThirstyOnGuardDuty
# 33 "data/maps/Route8_WestEntrance/scripts.pory"
	closemessage
# 34 "data/maps/Route8_WestEntrance/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, Route8_WestEntrance_Movement_BlockPlayerEntry
# 35 "data/maps/Route8_WestEntrance/scripts.pory"
	waitmovement 0
# 36 "data/maps/Route8_WestEntrance/scripts.pory"
	releaseall
# 37 "data/maps/Route8_WestEntrance/scripts.pory"
	end
# 38 "data/maps/Route8_WestEntrance/scripts.pory"

# 39 "data/maps/Route8_WestEntrance/scripts.pory"
Route8_WestEntrance_EventScript_GiveTea::
# 40 "data/maps/Route8_WestEntrance/scripts.pory"
	removeitem ITEM_TEA
# 41 "data/maps/Route8_WestEntrance/scripts.pory"
	goto Route8_WestEntrance_EventScript_GuardDrinkTea
# 42 "data/maps/Route8_WestEntrance/scripts.pory"
	end
# 43 "data/maps/Route8_WestEntrance/scripts.pory"

# 44 "data/maps/Route8_WestEntrance/scripts.pory"
@ Unused
# 45 "data/maps/Route8_WestEntrance/scripts.pory"
Route8_WestEntrance_EventScript_GiveSodaPop::
# 46 "data/maps/Route8_WestEntrance/scripts.pory"
	removeitem ITEM_SODA_POP
# 47 "data/maps/Route8_WestEntrance/scripts.pory"
	goto Route8_WestEntrance_EventScript_GuardDrinkTea
# 48 "data/maps/Route8_WestEntrance/scripts.pory"
	end
# 49 "data/maps/Route8_WestEntrance/scripts.pory"

# 50 "data/maps/Route8_WestEntrance/scripts.pory"
@ Unused
# 51 "data/maps/Route8_WestEntrance/scripts.pory"
Route8_WestEntrance_EventScript_GiveLemonade::
# 52 "data/maps/Route8_WestEntrance/scripts.pory"
	removeitem ITEM_LEMONADE
# 53 "data/maps/Route8_WestEntrance/scripts.pory"
	goto Route8_WestEntrance_EventScript_GuardDrinkTea
# 54 "data/maps/Route8_WestEntrance/scripts.pory"
	end
# 55 "data/maps/Route8_WestEntrance/scripts.pory"

# 56 "data/maps/Route8_WestEntrance/scripts.pory"
Route8_WestEntrance_EventScript_GuardDrinkTea::
# 57 "data/maps/Route8_WestEntrance/scripts.pory"
	msgbox Route8_WestEntrance_Text_ThatTeaLooksTasty
# 58 "data/maps/Route8_WestEntrance/scripts.pory"
	closemessage
# 59 "data/maps/Route8_WestEntrance/scripts.pory"
	call_if_eq VAR_TEMP_1, 0, Route8_WestEntrance_EventScript_WalkToGuardTop
# 60 "data/maps/Route8_WestEntrance/scripts.pory"
	call_if_eq VAR_TEMP_1, 1, Route8_WestEntrance_EventScript_WalkToGuardMid
# 61 "data/maps/Route8_WestEntrance/scripts.pory"
	call_if_eq VAR_TEMP_1, 2, Route8_WestEntrance_EventScript_WalkToGuardBottom
# 62 "data/maps/Route8_WestEntrance/scripts.pory"
	msgbox Route8_WestEntrance_Text_ThanksIllShareTeaWithGuards
# 63 "data/maps/Route8_WestEntrance/scripts.pory"
	setvar VAR_MAP_SCENE_ROUTE5_ROUTE6_ROUTE7_ROUTE8_GATES, 1
# 64 "data/maps/Route8_WestEntrance/scripts.pory"
	releaseall
# 65 "data/maps/Route8_WestEntrance/scripts.pory"
	end
# 66 "data/maps/Route8_WestEntrance/scripts.pory"

# 67 "data/maps/Route8_WestEntrance/scripts.pory"
Route8_WestEntrance_EventScript_WalkToGuardTop::
# 68 "data/maps/Route8_WestEntrance/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, Route8_WestEntrance_Movement_WalkToGuardTop
# 69 "data/maps/Route8_WestEntrance/scripts.pory"
	waitmovement 0
# 70 "data/maps/Route8_WestEntrance/scripts.pory"
	return
# 71 "data/maps/Route8_WestEntrance/scripts.pory"

# 72 "data/maps/Route8_WestEntrance/scripts.pory"
Route8_WestEntrance_EventScript_WalkToGuardMid::
# 73 "data/maps/Route8_WestEntrance/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, Route8_WestEntrance_Movement_WalkToGuardMid
# 74 "data/maps/Route8_WestEntrance/scripts.pory"
	waitmovement 0
# 75 "data/maps/Route8_WestEntrance/scripts.pory"
	return
# 76 "data/maps/Route8_WestEntrance/scripts.pory"

# 77 "data/maps/Route8_WestEntrance/scripts.pory"
Route8_WestEntrance_EventScript_WalkToGuardBottom::
# 78 "data/maps/Route8_WestEntrance/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, Route8_WestEntrance_Movement_WalkToGuardBottom
# 79 "data/maps/Route8_WestEntrance/scripts.pory"
	waitmovement 0
# 80 "data/maps/Route8_WestEntrance/scripts.pory"
	return
# 81 "data/maps/Route8_WestEntrance/scripts.pory"

# 82 "data/maps/Route8_WestEntrance/scripts.pory"
Route8_WestEntrance_Movement_WalkToGuardMid::
# 83 "data/maps/Route8_WestEntrance/scripts.pory"
	walk_up
# 84 "data/maps/Route8_WestEntrance/scripts.pory"
	step_end
# 85 "data/maps/Route8_WestEntrance/scripts.pory"

# 86 "data/maps/Route8_WestEntrance/scripts.pory"
Route8_WestEntrance_Movement_WalkToGuardBottom::
# 87 "data/maps/Route8_WestEntrance/scripts.pory"
	walk_up
# 88 "data/maps/Route8_WestEntrance/scripts.pory"
	walk_up
# 89 "data/maps/Route8_WestEntrance/scripts.pory"
	step_end
# 90 "data/maps/Route8_WestEntrance/scripts.pory"

# 91 "data/maps/Route8_WestEntrance/scripts.pory"
Route8_WestEntrance_Movement_WalkToGuardTop::
# 92 "data/maps/Route8_WestEntrance/scripts.pory"
	walk_in_place_up
# 93 "data/maps/Route8_WestEntrance/scripts.pory"
	step_end
# 94 "data/maps/Route8_WestEntrance/scripts.pory"

# 95 "data/maps/Route8_WestEntrance/scripts.pory"
Route8_WestEntrance_Movement_BlockPlayerEntry::
# 96 "data/maps/Route8_WestEntrance/scripts.pory"
	walk_right
# 97 "data/maps/Route8_WestEntrance/scripts.pory"
	step_end
