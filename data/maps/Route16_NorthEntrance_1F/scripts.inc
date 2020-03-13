Route16_NorthEntrance_1F_MapScripts:: @ 81701C2
	map_script MAP_SCRIPT_ON_TRANSITION, Route16_NorthEntrance_1F_OnTransition
	.byte 0

Route16_NorthEntrance_1F_OnTransition:: @ 81701C8
	clearflag FLAG_SYS_ON_CYCLING_ROAD
	call_if_set FLAG_GOT_BICYCLE, Route16_NorthEntrance_1F_EventScript_DisableNeedBikeTrigger
	end

Route16_NorthEntrance_1F_EventScript_DisableNeedBikeTrigger:: @ 81701D5
	setvar VAR_TEMP_1, 1
	return

Route16_NorthEntrance_1F_EventScript_Guard:: @ 81701DB
	msgbox Route16_NorthEntrance_1F_Text_CyclingRoadIsDownhillCourse, MSGBOX_NPC
	end

Route16_NorthEntrance_1F_EventScript_NeedBikeTriggerTop:: @ 81701E4
	lockall
	setvar VAR_0x8008, 0
	goto Route16_NorthEntrance_1F_EventScript_NeedBikeTrigger
	end

Route16_NorthEntrance_1F_EventScript_NeedBikeTriggerMidTop:: @ 81701F0
	lockall
	setvar VAR_0x8008, 1
	goto Route16_NorthEntrance_1F_EventScript_NeedBikeTrigger
	end

Route16_NorthEntrance_1F_EventScript_NeedBikeTriggerMid:: @ 81701FC
	lockall
	setvar VAR_0x8008, 2
	goto Route16_NorthEntrance_1F_EventScript_NeedBikeTrigger
	end

Route16_NorthEntrance_1F_EventScript_NeedBikeTriggerMidBottom:: @ 8170208
	lockall
	setvar VAR_0x8008, 3
	goto Route16_NorthEntrance_1F_EventScript_NeedBikeTrigger
	end

Route16_NorthEntrance_1F_EventScript_NeedBikeTriggerBottom:: @ 8170214
	lockall
	setvar VAR_0x8008, 4
	goto Route16_NorthEntrance_1F_EventScript_NeedBikeTrigger
	end

Route16_NorthEntrance_1F_EventScript_NeedBikeTrigger:: @ 8170220
	textcolor 0
	msgbox Route16_NorthEntrance_1F_Text_ExcuseMeWaitUp
	closemessage
	applymovement OBJ_EVENT_ID_PLAYER, Movement_WalkInPlaceFastestUp
	waitmovement 0
	delay 20
	compare VAR_0x8008, 1
	call_if_eq Route16_NorthEntrance_1F_EventScript_PlayerWalkToCounterMidTop
	compare VAR_0x8008, 2
	call_if_eq Route16_NorthEntrance_1F_EventScript_PlayerWalkToCounterMid
	compare VAR_0x8008, 3
	call_if_eq Route16_NorthEntrance_1F_EventScript_PlayerWalkToCounterMidBottom
	compare VAR_0x8008, 4
	call_if_eq Route16_NorthEntrance_1F_EventScript_PlayerWalkToCounterBottom
	msgbox Route16_NorthEntrance_1F_Text_NoPedestriansOnCyclingRoad
	closemessage
	applymovement OBJ_EVENT_ID_PLAYER, Route16_NorthEntrance_1F_Movement_WalkRight
	waitmovement 0
	releaseall
	end

Route16_NorthEntrance_1F_EventScript_PlayerWalkToCounterMidTop:: @ 8170279
	applymovement OBJ_EVENT_ID_PLAYER, Route16_NorthEntrance_1F_Movement_WalkUp
	waitmovement 0
	return

Route16_NorthEntrance_1F_EventScript_PlayerWalkToCounterMid:: @ 8170284
	applymovement OBJ_EVENT_ID_PLAYER, Route16_NorthEntrance_1F_Movement_WalkUp2
	waitmovement 0
	return

Route16_NorthEntrance_1F_EventScript_PlayerWalkToCounterMidBottom:: @ 817028F
	applymovement OBJ_EVENT_ID_PLAYER, Route16_NorthEntrance_1F_Movement_WalkUp3
	waitmovement 0
	return

Route16_NorthEntrance_1F_EventScript_PlayerWalkToCounterBottom:: @ 817029A
	applymovement OBJ_EVENT_ID_PLAYER, Route16_NorthEntrance_1F_Movement_WalkUp4
	waitmovement 0
	return

Route16_NorthEntrance_1F_Movement_WalkUp:: @ 81702A5
	walk_up
	step_end

Route16_NorthEntrance_1F_Movement_WalkUp2:: @ 81702A7
	walk_up
	walk_up
	step_end

Route16_NorthEntrance_1F_Movement_WalkUp3:: @ 81702AA
	walk_up
	walk_up
	walk_up
	step_end

Route16_NorthEntrance_1F_Movement_WalkUp4:: @ 81702AE
	walk_up
	walk_up
	walk_up
	walk_up
	step_end

Route16_NorthEntrance_1F_Movement_WalkRight:: @ 81702B3
	walk_right
	step_end

Route16_NorthEntrance_1F_EventScript_OldMan:: @ 81702B5
	msgbox Route16_NorthEntrance_1F_Text_HowdYouGetInGoodEffort, MSGBOX_NPC
	end
