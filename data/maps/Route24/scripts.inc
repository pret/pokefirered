Route24_MapScripts:: @ 816861F
	.byte 0

Route24_EventScript_Rocket:: @ 8168620
	lock
	faceplayer
	compare VAR_MAP_SCENE_ROUTE24, 1
	goto_if_eq Route24_EventScript_RocketPostBattle
	msgbox Route24_Text_JustEarnedFabulousPrize
	checkitemspace ITEM_NUGGET, 1
	compare VAR_RESULT, FALSE
	goto_if_eq Route24_EventScript_NoRoomForNugget
	call Route24_EventScript_ReceiveNugget
	release
	end

Route24_EventScript_NoRoomForNugget:: @ 816864C
	msgbox Route24_Text_YouDontHaveAnyRoom
	release
	end

Route24_EventScript_RocketPostBattle:: @ 8168656
	msgbox Route24_Text_YoudBecomeTopRocketLeader
	release
	end

Route24_EventScript_RocketTriggerLeft:: @ 8168660
	lockall
	setvar VAR_TEMP_1, 0
	goto Route24_EventScript_RocketTrigger
	end

Route24_EventScript_RocketTriggerRight:: @ 816866C
	lockall
	setvar VAR_TEMP_1, 1
	goto Route24_EventScript_RocketTrigger
	end

Route24_EventScript_RocketTrigger:: @ 8168678
	textcolor 0
	compare VAR_TEMP_1, 0
	call_if_eq EventScript_1686FD
	compare VAR_TEMP_1, 1
	call_if_eq EventScript_168708
	applymovement OBJ_EVENT_ID_PLAYER, Movement_WalkInPlaceFastestRight
	waitmovement 0
	msgbox Route24_Text_JustEarnedFabulousPrize
	checkitemspace ITEM_NUGGET, 1
	compare VAR_RESULT, FALSE
	goto_if_eq EventScript_168713
	call Route24_EventScript_ReceiveNugget
	releaseall
	end

Route24_EventScript_ReceiveNugget:: @ 81686B9
	giveitem_msg Route24_Text_ReceivedNuggetFromMysteryTrainer, ITEM_NUGGET
	message Route24_Text_JoinTeamRocket
	waitmessage
	playbgm MUS_ROCKET, 0
	waitbuttonpress
	setvar VAR_LAST_TALKED, 1
	trainerbattle_no_intro TRAINER_TEAM_ROCKET_GRUNT_6, Route24_Text_RocketDefeat
	msgbox Route24_Text_YoudBecomeTopRocketLeader
	setvar VAR_MAP_SCENE_ROUTE24, 1
	return

EventScript_1686FD:: @ 81686FD
	applymovement 1, Route24_Movement_WalkLeft
	waitmovement 0
	return

EventScript_168708:: @ 8168708
	applymovement 1, Movement_WalkInPlaceFastestLeft
	waitmovement 0
	return

EventScript_168713:: @ 8168713
	msgbox Route24_Text_YouDontHaveAnyRoom
	closemessage
	applymovement OBJ_EVENT_ID_PLAYER, Route24_Movement_WalkDown
	waitmovement 0
	compare VAR_TEMP_1, 0
	call_if_eq EventScript_168733
	release
	end

EventScript_168733:: @ 8168733
	applymovement 1, Movement_168740
	waitmovement 0
	return

Route24_Movement_WalkLeft:: @ 816873E
	walk_left
	step_end

Movement_168740:: @ 8168740
	walk_right
	walk_in_place_fastest_left
	step_end

Route24_Movement_WalkDown:: @ 8168743
	walk_down
	step_end
