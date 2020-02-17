Route7_EastEntrance_MapScripts:: @ 816FA8D
	.byte 0

Route7_EastEntrance_EventScript_Guard:: @ 816FA8E
	msgbox Route7_EastEntrance_Text_HiHowsItGoing, MSGBOX_NPC
	end

Route7_EastEntrance_EventScript_GuardTriggerTop:: @ 816FA97
	lockall
	setvar VAR_TEMP_1, 0
	goto Route7_EastEntrance_EventScript_GuardTrigger
	end

Route7_EastEntrance_EventScript_GuardTriggerMid:: @ 816FAA3
	lockall
	setvar VAR_TEMP_1, 1
	goto Route7_EastEntrance_EventScript_GuardTrigger
	end

Route7_EastEntrance_EventScript_GuardTriggerBottom:: @ 816FAAF
	lockall
	setvar VAR_TEMP_1, 2
	goto Route7_EastEntrance_EventScript_GuardTrigger
	end

Route7_EastEntrance_EventScript_GuardTrigger:: @ 816FABB
	textcolor 0
	applymovement OBJ_EVENT_ID_PLAYER, Movement_WalkInPlaceFastestUp
	waitmovement 0
	goto_if_set FLAG_GOT_TEA, Route7_EastEntrance_EventScript_GiveTea
	msgbox Route7_EastEntrance_Text_ThirstyOnGuardDuty
	closemessage
	applymovement OBJ_EVENT_ID_PLAYER, Route7_EastEntrance_Movement_BlockPlayerEntry
	waitmovement 0
	releaseall
	end

Route7_EastEntrance_EventScript_GiveTea:: @ 816FAE5
	removeitem ITEM_TEA, 1
	goto Route7_EastEntrance_EventScript_GuardDrinkTea
	end

Route7_EastEntrance_EventScript_GuardDrinkTea:: @ 816FAF0
	msgbox Route7_EastEntrance_Text_ThatTeaLooksTasty
	closemessage
	compare VAR_TEMP_1, 0
	call_if_eq Route7_EastEntrance_WalkToGuardTop
	compare VAR_TEMP_1, 1
	call_if_eq Route7_EastEntrance_WalkToGuardMid
	compare VAR_TEMP_1, 2
	call_if_eq Route7_EastEntrance_WalkToGuardBottom
	msgbox Route7_EastEntrance_Text_ThanksIllShareTeaWithGuards
	setvar VAR_MAP_SCENE_ROUTE5_ROUTE6_ROUTE7_ROUTE8_GATES, 1
	releaseall
	end

Route7_EastEntrance_WalkToGuardTop:: @ 816FB29
	applymovement OBJ_EVENT_ID_PLAYER, Route7_EastEntrance_Movement_WalkToGuardTop
	waitmovement 0
	return

Route7_EastEntrance_WalkToGuardMid:: @ 816FB34
	applymovement OBJ_EVENT_ID_PLAYER, Route7_EastEntrance_Movement_WalkToGuardMid
	waitmovement 0
	return

Route7_EastEntrance_WalkToGuardBottom:: @ 816FB3F
	applymovement OBJ_EVENT_ID_PLAYER, Route7_EastEntrance_Movement_WalkToGuardBottom
	waitmovement 0
	return

Route7_EastEntrance_Movement_WalkToGuardMid:: @ 816FB4A
	walk_up
	step_end

Route7_EastEntrance_Movement_WalkToGuardBottom:: @ 816FB4C
	walk_up
	walk_up
	step_end

Route7_EastEntrance_Movement_WalkToGuardTop:: @ 816FB4F
	walk_in_place_up
	step_end

Route7_EastEntrance_Movement_BlockPlayerEntry:: @ 816FB51
	walk_left
	step_end
