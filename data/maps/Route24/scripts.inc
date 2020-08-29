.equ LOCALID_ROCKET, 1

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
	call Route24_EventScript_BattleRocket
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
	call_if_eq Route24_EventScript_RocketApproachPlayer
	compare VAR_TEMP_1, 1
	call_if_eq Route24_EventScript_RocketMotionToPlayer
	applymovement OBJ_EVENT_ID_PLAYER, Movement_WalkInPlaceFastestRight
	waitmovement 0
	msgbox Route24_Text_JustEarnedFabulousPrize
	checkitemspace ITEM_NUGGET, 1
	compare VAR_RESULT, FALSE
	goto_if_eq Route24_EventScript_NoRoomForNuggetTrigger
	call Route24_EventScript_BattleRocket
	releaseall
	end

Route24_EventScript_BattleRocket:: @ 81686B9
	giveitem_msg Route24_Text_ReceivedNuggetFromMysteryTrainer, ITEM_NUGGET
	message Route24_Text_JoinTeamRocket
	waitmessage
	playbgm MUS_ENCOUNTER_ROCKET, 0
	waitbuttonpress
	setvar VAR_LAST_TALKED, LOCALID_ROCKET
	trainerbattle_no_intro TRAINER_TEAM_ROCKET_GRUNT_6, Route24_Text_RocketDefeat
	msgbox Route24_Text_YoudBecomeTopRocketLeader
	setvar VAR_MAP_SCENE_ROUTE24, 1
	return

Route24_EventScript_RocketApproachPlayer:: @ 81686FD
	applymovement LOCALID_ROCKET, Route24_Movement_RocketApproachPlayer
	waitmovement 0
	return

Route24_EventScript_RocketMotionToPlayer:: @ 8168708
	applymovement LOCALID_ROCKET, Movement_WalkInPlaceFastestLeft
	waitmovement 0
	return

Route24_EventScript_NoRoomForNuggetTrigger:: @ 8168713
	msgbox Route24_Text_YouDontHaveAnyRoom
	closemessage
	applymovement OBJ_EVENT_ID_PLAYER, Route24_Movement_WalkDown
	waitmovement 0
	compare VAR_TEMP_1, 0
	call_if_eq Route24_EventScript_RocketWalkBackToPos
	release
	end

Route24_EventScript_RocketWalkBackToPos:: @ 8168733
	applymovement LOCALID_ROCKET, Route24_Movement_RocketWalkBackToPos
	waitmovement 0
	return

Route24_Movement_RocketApproachPlayer:: @ 816873E
	walk_left
	step_end

Route24_Movement_RocketWalkBackToPos:: @ 8168740
	walk_right
	walk_in_place_fastest_left
	step_end

Route24_Movement_WalkDown:: @ 8168743
	walk_down
	step_end
