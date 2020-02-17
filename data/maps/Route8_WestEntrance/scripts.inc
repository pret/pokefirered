Route8_WestEntrance_MapScripts:: @ 816FB53
	.byte 0

Route8_WestEntrance_EventScript_Guard:: @ 816FB54
	msgbox Route8_WestEntrance_Text_HiHowsItGoing, MSGBOX_NPC
	end

Route8_WestEntrance_EventScript_GuardTriggerTop:: @ 816FB5D
	lockall
	setvar VAR_TEMP_1, 0
	goto Route8_WestEntrance_EventScript_GuardTrigger
	end

Route8_WestEntrance_EventScript_GuardTriggerMid:: @ 816FB69
	lockall
	setvar VAR_TEMP_1, 1
	goto Route8_WestEntrance_EventScript_GuardTrigger
	end

Route8_WestEntrance_EventScript_GuardTriggerBottom:: @ 816FB75
	lockall
	setvar VAR_TEMP_1, 2
	goto Route8_WestEntrance_EventScript_GuardTrigger
	end

Route8_WestEntrance_EventScript_GuardTrigger:: @ 816FB81
	textcolor 0
	applymovement OBJ_EVENT_ID_PLAYER, Movement_WalkInPlaceFastestUp
	waitmovement 0
	goto_if_set FLAG_GOT_TEA, Route8_WestEntrance_EventScript_GiveTea
	msgbox Route8_WestEntrance_Text_ThirstyOnGuardDuty
	closemessage
	applymovement OBJ_EVENT_ID_PLAYER, Route8_WestEntrance_Movement_BlockPlayerEntry
	waitmovement 0
	releaseall
	end

Route8_WestEntrance_EventScript_GiveTea:: @ 816FBAB
	removeitem ITEM_TEA, 1
	goto Route8_WestEntrance_EventScript_GuardDrinkTea
	end

@ Unused
Route8_WestEntrance_EventScript_GiveSodaPop:: @ 816FBB6
	removeitem ITEM_SODA_POP, 1
	goto Route8_WestEntrance_EventScript_GuardDrinkTea
	end

@ Unused
Route8_WestEntrance_EventScript_GiveLemonade:: @ 816FBC1
	removeitem ITEM_LEMONADE, 1
	goto Route8_WestEntrance_EventScript_GuardDrinkTea
	end

Route8_WestEntrance_EventScript_GuardDrinkTea:: @ 816FBCC
	msgbox Route8_WestEntrance_Text_ThatTeaLooksTasty
	closemessage
	compare VAR_TEMP_1, 0
	call_if_eq Route8_WestEntrance_EventScript_WalkToGuardTop
	compare VAR_TEMP_1, 1
	call_if_eq Route8_WestEntrance_EventScript_WalkToGuardMid
	compare VAR_TEMP_1, 2
	call_if_eq Route8_WestEntrance_EventScript_WalkToGuardBottom
	msgbox Route8_WestEntrance_Text_ThanksIllShareTeaWithGuards
	setvar VAR_MAP_SCENE_ROUTE5_ROUTE6_ROUTE7_ROUTE8_GATES, 1
	releaseall
	end

Route8_WestEntrance_EventScript_WalkToGuardTop:: @ 816FC05
	applymovement OBJ_EVENT_ID_PLAYER, Route8_WestEntrance_Movement_WalkToGuardTop
	waitmovement 0
	return

Route8_WestEntrance_EventScript_WalkToGuardMid:: @ 816FC10
	applymovement OBJ_EVENT_ID_PLAYER, Route8_WestEntrance_Movement_WalkToGuardMid
	waitmovement 0
	return

Route8_WestEntrance_EventScript_WalkToGuardBottom:: @ 816FC1B
	applymovement OBJ_EVENT_ID_PLAYER, Route8_WestEntrance_Movement_WalkToGuardBottom
	waitmovement 0
	return

Route8_WestEntrance_Movement_WalkToGuardMid:: @ 816FC26
	walk_up
	step_end

Route8_WestEntrance_Movement_WalkToGuardBottom:: @ 816FC28
	walk_up
	walk_up
	step_end

Route8_WestEntrance_Movement_WalkToGuardTop:: @ 816FC2B
	walk_in_place_up
	step_end

Route8_WestEntrance_Movement_BlockPlayerEntry:: @ 816FC2D
	walk_right
	step_end
