Route18_EastEntrance_1F_MapScripts:: @ 8170378
	map_script MAP_SCRIPT_ON_TRANSITION, Route18_EastEntrance_1F_OnTransition
	.byte 0

Route18_EastEntrance_1F_OnTransition:: @ 817037E
	clearflag FLAG_SYS_ON_CYCLING_ROAD
	call_if_set FLAG_GOT_BICYCLE, Route18_EastEntrance_1F_EventScript_DisableNeedBikeTrigger
	end

Route18_EastEntrance_1F_EventScript_DisableNeedBikeTrigger:: @ 817038B
	setvar VAR_TEMP_1, 1
	return

Route18_EastEntrance_1F_EventScript_Guard:: @ 8170391
	msgbox Route18_EastEntrance_1F_Text_CyclingRoadAllUphillFromHere, MSGBOX_NPC
	end

Route18_EastEntrance_1F_EventScript_NeedBikeTriggerTop:: @ 817039A
	lockall
	setvar VAR_0x8008, 0
	goto Route18_EastEntrance_1F_EventScript_NeedBikeTrigger
	end

Route18_EastEntrance_1F_EventScript_NeedBikeTriggerMidTop:: @ 81703A6
	lockall
	setvar VAR_0x8008, 1
	goto Route18_EastEntrance_1F_EventScript_NeedBikeTrigger
	end

Route18_EastEntrance_1F_EventScript_NeedBikeTriggerMid:: @ 81703B2
	lockall
	setvar VAR_0x8008, 2
	goto Route18_EastEntrance_1F_EventScript_NeedBikeTrigger
	end

Route18_EastEntrance_1F_EventScript_NeedBikeTriggerMidBottom:: @ 81703BE
	lockall
	setvar VAR_0x8008, 3
	goto Route18_EastEntrance_1F_EventScript_NeedBikeTrigger
	end

Route18_EastEntrance_1F_EventScript_NeedBikeTriggerBottom:: @ 81703CA
	lockall
	setvar VAR_0x8008, 4
	goto Route18_EastEntrance_1F_EventScript_NeedBikeTrigger
	end

Route18_EastEntrance_1F_EventScript_NeedBikeTrigger:: @ 81703D6
	textcolor 0
	msgbox Route18_EastEntrance_1F_Text_ExcuseMe
	closemessage
	applymovement OBJ_EVENT_ID_PLAYER, Movement_WalkInPlaceFastestUp
	waitmovement 0
	delay 20
	compare VAR_0x8008, 1
	call_if_eq Route18_EastEntrance_1F_EventScript_PlayerWalkToCounterMidTop
	compare VAR_0x8008, 2
	call_if_eq Route18_EastEntrance_1F_EventScript_PlayerWalkToCounterMid
	compare VAR_0x8008, 3
	call_if_eq Route18_EastEntrance_1F_EventScript_PlayerWalkToCounterMidBottom
	compare VAR_0x8008, 4
	call_if_eq Route18_EastEntrance_1F_EventScript_PlayerWalkToCounterBottom
	msgbox Route18_EastEntrance_1F_Text_NeedBicycleForCyclingRoad
	closemessage
	applymovement OBJ_EVENT_ID_PLAYER, Route18_EastEntrance_1F_Movement_WalkRight
	waitmovement 0
	releaseall
	end

Route18_EastEntrance_1F_EventScript_PlayerWalkToCounterMidTop:: @ 817042F
	applymovement OBJ_EVENT_ID_PLAYER, Route18_EastEntrance_1F_Movement_WalkUp
	waitmovement 0
	return

Route18_EastEntrance_1F_EventScript_PlayerWalkToCounterMid:: @ 817043A
	applymovement OBJ_EVENT_ID_PLAYER, Route18_EastEntrance_1F_Movement_WalkUp2
	waitmovement 0
	return

Route18_EastEntrance_1F_EventScript_PlayerWalkToCounterMidBottom:: @ 8170445
	applymovement OBJ_EVENT_ID_PLAYER, Route18_EastEntrance_1F_Movement_WalkUp3
	waitmovement 0
	return

Route18_EastEntrance_1F_EventScript_PlayerWalkToCounterBottom:: @ 8170450
	applymovement OBJ_EVENT_ID_PLAYER, Route18_EastEntrance_1F_Movement_WalkUp4
	waitmovement 0
	return

Route18_EastEntrance_1F_Movement_WalkUp:: @ 817045B
	walk_up
	step_end

Route18_EastEntrance_1F_Movement_WalkUp2:: @ 817045D
	walk_up
	walk_up
	step_end

Route18_EastEntrance_1F_Movement_WalkUp3:: @ 8170460
	walk_up
	walk_up
	walk_up
	step_end

Route18_EastEntrance_1F_Movement_WalkUp4:: @ 8170464
	walk_up
	walk_up
	walk_up
	walk_up
	step_end

Route18_EastEntrance_1F_Movement_WalkRight:: @ 8170469
	walk_right
	step_end
