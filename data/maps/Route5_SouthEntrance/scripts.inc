Route5_SouthEntrance_MapScripts:: @ 816F900
	.byte 0

Route5_SouthEntrance_EventScript_Guard:: @ 816F901
	msgbox Route5_SouthEntrance_Text_HiHowsItGoing, MSGBOX_NPC
	end

Route5_SouthEntrance_EventScript_GuardTriggerLeft:: @ 816F90A
	lockall
	setvar VAR_TEMP_1, 0
	goto Route5_SouthEntrance_EventScript_GuardTrigger
	end

Route5_SouthEntrance_EventScript_GuardTriggerMid:: @ 816F916
	lockall
	setvar VAR_TEMP_1, 1
	goto Route5_SouthEntrance_EventScript_GuardTrigger
	end

Route5_SouthEntrance_EventScript_GuardTriggerRight:: @ 816F922
	lockall
	setvar VAR_TEMP_1, 2
	goto Route5_SouthEntrance_EventScript_GuardTrigger
	end

Route5_SouthEntrance_EventScript_GuardTrigger:: @ 816F92E
	textcolor 0
	applymovement OBJ_EVENT_ID_PLAYER, Movement_WalkInPlaceFastestLeft
	waitmovement 0
	goto_if_set FLAG_GOT_TEA, Route5_SouthEntrance_EventScript_GiveTea
	msgbox Route5_SouthEntrance_Text_ThirstyOnGuardDuty
	closemessage
	applymovement OBJ_EVENT_ID_PLAYER, Route5_SouthEntrance_Movement_BlockPlayerEntry
	waitmovement 0
	releaseall
	end

Route5_SouthEntrance_EventScript_GiveTea:: @ 816F958
	removeitem ITEM_TEA, 1
	goto Route5_SouthEntrance_EventScript_GuardDrinkTea
	end

Route5_SouthEntrance_EventScript_GuardDrinkTea:: @ 816F963
	msgbox Route5_SouthEntrance_Text_ThatTeaLooksTasty
	closemessage
	compare VAR_TEMP_1, 0
	call_if_eq Route5_SouthEntrance_EventScript_WalkToGuardLeft
	compare VAR_TEMP_1, 1
	call_if_eq Route5_SouthEntrance_EventScript_WalkToGuardMid
	compare VAR_TEMP_1, 2
	call_if_eq Route5_SouthEntrance_EventScript_WalkToGuardRight
	msgbox Route5_SouthEntrance_Text_ThanksIllShareTeaWithGuards
	setvar VAR_MAP_SCENE_ROUTE5_ROUTE6_ROUTE7_ROUTE8_GATES, 1
	releaseall
	end

Route5_SouthEntrance_EventScript_WalkToGuardLeft:: @ 816F99C
	applymovement OBJ_EVENT_ID_PLAYER, Route5_SouthEntrance_Movement_WalkToGuardLeft
	waitmovement 0
	return

Route5_SouthEntrance_EventScript_WalkToGuardMid:: @ 816F9A7
	applymovement OBJ_EVENT_ID_PLAYER, Route5_SouthEntrance_Movement_WalkToGuardMid
	waitmovement 0
	return

Route5_SouthEntrance_EventScript_WalkToGuardRight:: @ 816F9B2
	applymovement OBJ_EVENT_ID_PLAYER, Route5_SouthEntrance_Movement_WalkToGuardRight
	waitmovement 0
	return

Route5_SouthEntrance_Movement_WalkToGuardMid:: @ 816F9BD
	walk_left
	step_end

Route5_SouthEntrance_Movement_WalkToGuardRight:: @ 816F9BF
	walk_left
	walk_left
	step_end

Route5_SouthEntrance_Movement_WalkToGuardLeft:: @ 816F9C2
	walk_in_place_left
	step_end

Route5_SouthEntrance_Movement_BlockPlayerEntry:: @ 816F9C4
	walk_up
	step_end
