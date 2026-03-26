Route8_WestEntrance_MapScripts::
	.byte 0

Route8_WestEntrance_EventScript_Guard::
	msgbox Route8_WestEntrance_Text_HiHowsItGoing, MSGBOX_NPC
	end

Route8_WestEntrance_EventScript_GuardTriggerTop::
	lockall
	setvar VAR_TEMP_1, 0
	goto Route8_WestEntrance_EventScript_GuardTrigger
	end

Route8_WestEntrance_EventScript_GuardTriggerMid::
	lockall
	setvar VAR_TEMP_1, 1
	goto Route8_WestEntrance_EventScript_GuardTrigger
	end

Route8_WestEntrance_EventScript_GuardTriggerBottom::
	lockall
	setvar VAR_TEMP_1, 2
	goto Route8_WestEntrance_EventScript_GuardTrigger
	end

Route8_WestEntrance_EventScript_GuardTrigger::
	textcolor NPC_TEXT_COLOR_MALE
	applymovement OBJ_EVENT_ID_PLAYER, Common_Movement_WalkInPlaceFasterUp
	waitmovement 0
	goto_if_set FLAG_GOT_TEA, Route8_WestEntrance_EventScript_GiveTea
	msgbox Route8_WestEntrance_Text_ThirstyOnGuardDuty
	closemessage
	applymovement OBJ_EVENT_ID_PLAYER, Route8_WestEntrance_Movement_BlockPlayerEntry
	waitmovement 0
	releaseall
	end

Route8_WestEntrance_EventScript_GiveTea::
	removeitem ITEM_TEA
	goto Route8_WestEntrance_EventScript_GuardDrinkTea
	end

@ Unused
Route8_WestEntrance_EventScript_GiveSodaPop::
	removeitem ITEM_SODA_POP
	goto Route8_WestEntrance_EventScript_GuardDrinkTea
	end

@ Unused
Route8_WestEntrance_EventScript_GiveLemonade::
	removeitem ITEM_LEMONADE
	goto Route8_WestEntrance_EventScript_GuardDrinkTea
	end

Route8_WestEntrance_EventScript_GuardDrinkTea::
	msgbox Route8_WestEntrance_Text_ThatTeaLooksTasty
	closemessage
	call_if_eq VAR_TEMP_1, 0, Route8_WestEntrance_EventScript_WalkToGuardTop
	call_if_eq VAR_TEMP_1, 1, Route8_WestEntrance_EventScript_WalkToGuardMid
	call_if_eq VAR_TEMP_1, 2, Route8_WestEntrance_EventScript_WalkToGuardBottom
	msgbox Route8_WestEntrance_Text_ThanksIllShareTeaWithGuards
	setvar VAR_MAP_SCENE_ROUTE5_ROUTE6_ROUTE7_ROUTE8_GATES, 1
	releaseall
	end

Route8_WestEntrance_EventScript_WalkToGuardTop::
	applymovement OBJ_EVENT_ID_PLAYER, Route8_WestEntrance_Movement_WalkToGuardTop
	waitmovement 0
	return

Route8_WestEntrance_EventScript_WalkToGuardMid::
	applymovement OBJ_EVENT_ID_PLAYER, Route8_WestEntrance_Movement_WalkToGuardMid
	waitmovement 0
	return

Route8_WestEntrance_EventScript_WalkToGuardBottom::
	applymovement OBJ_EVENT_ID_PLAYER, Route8_WestEntrance_Movement_WalkToGuardBottom
	waitmovement 0
	return

Route8_WestEntrance_Movement_WalkToGuardMid::
	walk_up
	step_end

Route8_WestEntrance_Movement_WalkToGuardBottom::
	walk_up
	walk_up
	step_end

Route8_WestEntrance_Movement_WalkToGuardTop::
	walk_in_place_up
	step_end

Route8_WestEntrance_Movement_BlockPlayerEntry::
	walk_right
	step_end
