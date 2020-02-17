Route6_NorthEntrance_MapScripts:: @ 816F9C6
	.byte 0

Route6_NorthEntrance_EventScript_Guard:: @ 816F9C7
	msgbox Route6_NorthEntrance_Text_HiHowsItGoing, MSGBOX_NPC
	end

Route6_NorthEntrance_EventScript_GuardTriggerLeft:: @ 816F9D0
	lockall
	setvar VAR_TEMP_1, 0
	goto Route6_NorthEntrance_EventScript_GuardTrigger
	end

Route6_NorthEntrance_EventScript_GuardTriggerMid:: @ 816F9DC
	lockall
	setvar VAR_TEMP_1, 1
	goto Route6_NorthEntrance_EventScript_GuardTrigger
	end

Route6_NorthEntrance_EventScript_GuardTriggerRight:: @ 816F9E8
	lockall
	setvar VAR_TEMP_1, 2
	goto Route6_NorthEntrance_EventScript_GuardTrigger
	end

Route6_NorthEntrance_EventScript_GuardTrigger:: @ 816F9F4
	textcolor 0
	applymovement OBJ_EVENT_ID_PLAYER, Movement_WalkInPlaceFastestRight
	waitmovement 0
	goto_if_set FLAG_GOT_TEA, Route6_NorthEntrance_EventScript_GiveTea
	msgbox Route6_NorthEntrance_Text_ThirstyOnGuardDuty
	closemessage
	applymovement OBJ_EVENT_ID_PLAYER, Route6_NorthEntrance_Movement_BlockPlayerEntry
	waitmovement 0
	releaseall
	end

Route6_NorthEntrance_EventScript_GiveTea:: @ 816FA1E
	removeitem ITEM_TEA, 1
	goto Route6_NorthEntrance_EventScript_GuardDrinkTea
	end

Route6_NorthEntrance_EventScript_GuardDrinkTea:: @ 816FA29
	msgbox Route6_NorthEntrance_Text_ThatTeaLooksTasty
	closemessage
	compare VAR_TEMP_1, 0
	call_if_eq Route6_NorthEntrance_EventScript_WalkToGuardLeft
	compare VAR_TEMP_1, 1
	call_if_eq Route6_NorthEntrance_EventScript_WalkToGuardMid
	compare VAR_TEMP_1, 2
	call_if_eq Route6_NorthEntrance_EventScript_WalkToGuardRight
	msgbox Route6_NorthEntrance_Text_ThanksIllShareTeaWithGuards
	setvar VAR_MAP_SCENE_ROUTE5_ROUTE6_ROUTE7_ROUTE8_GATES, 1
	releaseall
	end

Route6_NorthEntrance_EventScript_WalkToGuardLeft:: @ 816FA62
	applymovement OBJ_EVENT_ID_PLAYER, Route6_NorthEntrance_Movement_WalkToGuardLeft
	waitmovement 0
	return

Route6_NorthEntrance_EventScript_WalkToGuardMid:: @ 816FA6D
	applymovement OBJ_EVENT_ID_PLAYER, Route6_NorthEntrance_Movement_WalkToGuardMid
	waitmovement 0
	return

Route6_NorthEntrance_EventScript_WalkToGuardRight:: @ 816FA78
	applymovement OBJ_EVENT_ID_PLAYER, Route6_NorthEntrance_Movement_WalkToGuardRight
	waitmovement 0
	return

Route6_NorthEntrance_Movement_WalkToGuardLeft:: @ 816FA83
	walk_right
	walk_right
	step_end

Route6_NorthEntrance_Movement_WalkToGuardMid:: @ 816FA86
	walk_right
	step_end

Route6_NorthEntrance_Movement_WalkToGuardRight:: @ 816FA88
	walk_in_place_right
	step_end

Route6_NorthEntrance_Movement_BlockPlayerEntry:: @ 816FA8A
	walk_down
	step_end
