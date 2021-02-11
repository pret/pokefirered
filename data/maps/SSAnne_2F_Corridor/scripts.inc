.set LOCALID_RIVAL, 1

SSAnne_2F_Corridor_MapScripts:: @ 81608DE
	.byte 0

SSAnne_2F_Corridor_EventScript_RivalTriggerLeft:: @ 81608DF
	lockall
	setvar VAR_TEMP_1, 0
	goto SSAnne_2F_Corridor_EventScript_RivalTrigger
	end

SSAnne_2F_Corridor_EventScript_RivalTriggerMid:: @ 81608EB
	lockall
	setvar VAR_TEMP_1, 1
	goto SSAnne_2F_Corridor_EventScript_RivalTrigger
	end

SSAnne_2F_Corridor_EventScript_RivalTriggerRight:: @ 81608F7
	lockall
	setvar VAR_TEMP_1, 2
	goto SSAnne_2F_Corridor_EventScript_RivalTrigger
	end

SSAnne_2F_Corridor_EventScript_RivalTrigger:: @ 8160903
	textcolor 0
	playse SE_EXIT
	delay 5
	playbgm MUS_ENCOUNTER_RIVAL, 0
	addobject LOCALID_RIVAL
	delay 10
	applymovement LOCALID_RIVAL, Movement_WalkInPlaceFastestDown
	waitmovement 0
	delay 20
	compare VAR_TEMP_1, 0
	call_if_eq SSAnne_2F_Corridor_EventScript_RivalApproachLeft
	compare VAR_TEMP_1, 1
	call_if_eq SSAnne_2F_Corridor_EventScript_RivalApproachMid
	compare VAR_TEMP_1, 2
	call_if_eq SSAnne_2F_Corridor_EventScript_RivalApproachRight
	msgbox SSAnne_2F_Corridor_Text_RivalIntro
	setvar VAR_LAST_TALKED, LOCALID_RIVAL
	compare VAR_STARTER_MON, 2
	call_if_eq SSAnne_2F_Corridor_EventScript_RivalSquirtle
	compare VAR_STARTER_MON, 1
	call_if_eq SSAnne_2F_Corridor_EventScript_RivalBulbasaur
	compare VAR_STARTER_MON, 0
	call_if_eq SSAnne_2F_Corridor_EventScript_RivalCharmander
	msgbox SSAnne_2F_Corridor_Text_RivalPostBattle
	closemessage
	delay 10
	playbgm MUS_RIVAL_EXIT, 0
	compare VAR_TEMP_1, 0
	call_if_eq SSAnne_2F_Corridor_EventScript_RivalExitLeft
	compare VAR_TEMP_1, 1
	call_if_eq SSAnne_2F_Corridor_EventScript_RivalExitMid
	compare VAR_TEMP_1, 2
	call_if_eq SSAnne_2F_Corridor_EventScript_RivalExitRight
	fadedefaultbgm
	removeobject LOCALID_RIVAL
	setvar VAR_MAP_SCENE_S_S_ANNE_2F_CORRIDOR, 1
	releaseall
	end

SSAnne_2F_Corridor_EventScript_RivalApproachLeft:: @ 81609AD
	applymovement LOCALID_RIVAL, SSAnne_2F_Corridor_Movement_RivalApproachLeft
	waitmovement 0
	return

SSAnne_2F_Corridor_EventScript_RivalApproachMid:: @ 81609B8
	applymovement LOCALID_RIVAL, SSAnne_2F_Corridor_Movement_RivalApproachMid
	applymovement OBJ_EVENT_ID_PLAYER, SSAnne_2F_Corridor_Movement_PlayerFaceRivalMid
	waitmovement 0
	return

SSAnne_2F_Corridor_EventScript_RivalApproachRight:: @ 81609CA
	applymovement OBJ_EVENT_ID_PLAYER, SSAnne_2F_Corridor_Movement_PlayerFaceRivalRight
	applymovement LOCALID_RIVAL, SSAnne_2F_Corridor_Movement_RivalApproachRight
	waitmovement 0
	return

SSAnne_2F_Corridor_EventScript_RivalSquirtle:: @ 81609DC
	trainerbattle_no_intro TRAINER_RIVAL_SS_ANNE_SQUIRTLE, SSAnne_2F_Corridor_Text_RivalDefeat
	return

SSAnne_2F_Corridor_EventScript_RivalBulbasaur:: @ 81609E7
	trainerbattle_no_intro TRAINER_RIVAL_SS_ANNE_BULBASAUR, SSAnne_2F_Corridor_Text_RivalDefeat
	return

SSAnne_2F_Corridor_EventScript_RivalCharmander:: @ 81609F2
	trainerbattle_no_intro TRAINER_RIVAL_SS_ANNE_CHARMANDER, SSAnne_2F_Corridor_Text_RivalDefeat
	return

SSAnne_2F_Corridor_EventScript_RivalExitLeft:: @ 81609FD
	applymovement LOCALID_RIVAL, SSAnne_2F_Corridor_Movement_RivalExitLeft
	waitmovement 0
	return

SSAnne_2F_Corridor_EventScript_RivalExitMid:: @ 8160A08
	applymovement LOCALID_RIVAL, SSAnne_2F_Corridor_Movement_RivalExitMid
	waitmovement 0
	return

SSAnne_2F_Corridor_EventScript_RivalExitRight:: @ 8160A13
	applymovement LOCALID_RIVAL, SSAnne_2F_Corridor_Movement_RivalExitRight
	waitmovement 0
	return

SSAnne_2F_Corridor_Movement_PlayerFaceRivalRight:: @ 8160A1E
	delay_16
	delay_16
	delay_16
	delay_16
	walk_in_place_fastest_left
	step_end

SSAnne_2F_Corridor_Movement_PlayerFaceRivalMid:: @ 8160A24
	delay_16
	delay_16
	delay_16
	delay_16
	walk_in_place_fastest_left
	step_end

SSAnne_2F_Corridor_Movement_RivalApproachLeft:: @ 8160A2A
	walk_down
	walk_down
	walk_down
	step_end

SSAnne_2F_Corridor_Movement_RivalApproachMid:: @ 8160A2E
	walk_down
	walk_down
	walk_down
	walk_down
	walk_in_place_fastest_right
	step_end

SSAnne_2F_Corridor_Movement_RivalApproachRight:: @ 8160A34
	walk_down
	walk_down
	walk_down
	walk_down
	walk_right
	delay_4
	step_end

SSAnne_2F_Corridor_Movement_RivalExitLeft:: @ 8160A3B
	walk_right
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	step_end

SSAnne_2F_Corridor_Movement_RivalExitMid:: @ 8160A44
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	step_end

SSAnne_2F_Corridor_Movement_RivalExitRight:: @ 8160A4C
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	step_end

SSAnne_2F_Corridor_EventScript_Sailor:: @ 8160A54
	msgbox SSAnne_2F_Corridor_Text_ThisShipIsLuxuryLiner, MSGBOX_NPC
	end
