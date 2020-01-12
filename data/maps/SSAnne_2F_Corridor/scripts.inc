SSAnne_2F_Corridor_MapScripts:: @ 81608DE
	.byte 0

SSAnne_2F_Corridor_EventScript_1608DF:: @ 81608DF
	lockall
	setvar VAR_TEMP_1, 0
	goto EventScript_160903

EventScript_1608EA:: @ 81608EA
	end

SSAnne_2F_Corridor_EventScript_1608EB:: @ 81608EB
	lockall
	setvar VAR_TEMP_1, 1
	goto EventScript_160903

EventScript_1608F6:: @ 81608F6
	end

SSAnne_2F_Corridor_EventScript_1608F7:: @ 81608F7
	lockall
	setvar VAR_TEMP_1, 2
	goto EventScript_160903

EventScript_160902:: @ 8160902
	end

EventScript_160903:: @ 8160903
	textcolor 0
	playse SE_KAIDAN
	delay 5
	playbgm MUS_RIVAL1, 0
	addobject 1
	delay 10
	applymovement 1, Movement_WalkInPlaceFastestDown
	waitmovement 0
	delay 20
	compare VAR_TEMP_1, 0
	call_if_eq EventScript_1609AD
	compare VAR_TEMP_1, 1
	call_if_eq EventScript_1609B8
	compare VAR_TEMP_1, 2
	call_if_eq EventScript_1609CA
	msgbox gUnknown_8173035
	setvar VAR_LAST_TALKED, 1
	compare VAR_STARTER_MON, 2
	call_if_eq EventScript_1609DC
	compare VAR_STARTER_MON, 1
	call_if_eq EventScript_1609E7
	compare VAR_STARTER_MON, 0
	call_if_eq EventScript_1609F2
	msgbox gUnknown_8173164
	closemessage
	delay 10
	playbgm MUS_RIVAL2, 0
	compare VAR_TEMP_1, 0
	call_if_eq EventScript_1609FD
	compare VAR_TEMP_1, 1
	call_if_eq EventScript_160A08
	compare VAR_TEMP_1, 2
	call_if_eq EventScript_160A13
	fadedefaultbgm
	removeobject 1
	setvar VAR_MAP_SCENE_S_S_ANNE_2F_CORRIDOR, 1
	releaseall
	end

EventScript_1609AD:: @ 81609AD
	applymovement 1, Movement_160A2A
	waitmovement 0
	return

EventScript_1609B8:: @ 81609B8
	applymovement 1, Movement_160A2E
	applymovement OBJ_EVENT_ID_PLAYER, Movement_160A24
	waitmovement 0
	return

EventScript_1609CA:: @ 81609CA
	applymovement OBJ_EVENT_ID_PLAYER, Movement_160A1E
	applymovement 1, Movement_160A34
	waitmovement 0
	return

EventScript_1609DC:: @ 81609DC
	trainerbattle_no_intro TRAINER_RIVAL_SS_ANNE_SQUIRTLE, Text_173110
	return

EventScript_1609E7:: @ 81609E7
	trainerbattle_no_intro TRAINER_RIVAL_SS_ANNE_BULBASAUR, Text_173110
	return

EventScript_1609F2:: @ 81609F2
	trainerbattle_no_intro TRAINER_RIVAL_SS_ANNE_CHARMANDER, Text_173110
	return

EventScript_1609FD:: @ 81609FD
	applymovement 1, Movement_160A3B
	waitmovement 0
	return

EventScript_160A08:: @ 8160A08
	applymovement 1, Movement_160A44
	waitmovement 0
	return

EventScript_160A13:: @ 8160A13
	applymovement 1, Movement_160A4C
	waitmovement 0
	return

Movement_160A1E:: @ 8160A1E
	delay_16
	delay_16
	delay_16
	delay_16
	walk_in_place_fastest_left
	step_end

Movement_160A24:: @ 8160A24
	delay_16
	delay_16
	delay_16
	delay_16
	walk_in_place_fastest_left
	step_end

Movement_160A2A:: @ 8160A2A
	walk_down
	walk_down
	walk_down
	step_end

Movement_160A2E:: @ 8160A2E
	walk_down
	walk_down
	walk_down
	walk_down
	walk_in_place_fastest_right
	step_end

Movement_160A34:: @ 8160A34
	walk_down
	walk_down
	walk_down
	walk_down
	walk_right
	delay_4
	step_end

Movement_160A3B:: @ 8160A3B
	walk_right
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	step_end

Movement_160A44:: @ 8160A44
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	step_end

Movement_160A4C:: @ 8160A4C
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	step_end

SSAnne_2F_Corridor_EventScript_160A54:: @ 8160A54
	msgbox gUnknown_8172FC3, MSGBOX_NPC
	end
