PewterCity_MapScripts:: @ 8165B8E
	map_script MAP_SCRIPT_ON_TRANSITION, PewterCity_OnTransition
	.byte 0

PewterCity_OnTransition:: @ 8165B94
	setworldmapflag FLAG_WORLD_MAP_PEWTER_CITY
	setvar VAR_MAP_SCENE_PEWTER_CITY_MUSEUM_1F, 0
	end

PewterCity_EventScript_165B9D:: @ 8165B9D
	lock
	faceplayer
	msgbox gUnknown_817E67E
	closemessage
	playbgm MUS_ANNAI, 0
	compare VAR_FACING, DIR_EAST
	call_if_eq EventScript_165BD3
	msgbox gUnknown_817E6C7
	closemessage
	applymovement 5, Movement_165D83
	waitmovement 0
	fadedefaultbgm
	removeobject 5
	clearflag FLAG_HIDE_PEWTER_CITY_GYM_GUIDE
	release
	end

EventScript_165BD3:: @ 8165BD3
	applymovement OBJ_EVENT_ID_PLAYER, Movement_165C3C
	applymovement 5, Movement_165CDE
	waitmovement 0
	applymovement OBJ_EVENT_ID_PLAYER, Movement_165C41
	applymovement 5, Movement_165CE3
	waitmovement 0
	return

EventScript_165BF6:: @ 8165BF6
	applymovement OBJ_EVENT_ID_PLAYER, Movement_165C80
	applymovement 5, Movement_165D23
	waitmovement 0
	applymovement OBJ_EVENT_ID_PLAYER, Movement_165C82
	applymovement 5, Movement_165D25
	waitmovement 0
	return

EventScript_165C19:: @ 8165C19
	applymovement OBJ_EVENT_ID_PLAYER, Movement_165CAF
	applymovement 5, Movement_165D53
	waitmovement 0
	applymovement OBJ_EVENT_ID_PLAYER, Movement_165CB1
	applymovement 5, Movement_165D55
	waitmovement 0
	return

Movement_165C3C:: @ 8165C3C
	delay_16
	delay_16
	delay_4
	walk_in_place_fastest_down
	step_end

Movement_165C41:: @ 8165C41
	walk_down
	walk_left
	walk_left
	walk_left
	walk_up
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	step_end

Movement_165C80:: @ 8165C80
	delay_16
	step_end

Movement_165C82:: @ 8165C82
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_right
	step_end

Movement_165CAF:: @ 8165CAF
	delay_16
	step_end

Movement_165CB1:: @ 8165CB1
	walk_up
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_right
	step_end

Movement_165CDE:: @ 8165CDE
	walk_down
	walk_left
	walk_in_place_fastest_up
	walk_in_place_up
	step_end

Movement_165CE3:: @ 8165CE3
	walk_left
	walk_left
	walk_left
	walk_up
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_in_place_fastest_left
	step_end

Movement_165D23:: @ 8165D23
	walk_in_place_right
	step_end

Movement_165D25:: @ 8165D25
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_right
	walk_right
	walk_in_place_fastest_left
	step_end

Movement_165D53:: @ 8165D53
	walk_in_place_down
	step_end

Movement_165D55:: @ 8165D55
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_right
	walk_right
	walk_in_place_fastest_left
	step_end

Movement_165D83:: @ 8165D83
	walk_down
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	step_end

PewterCity_EventScript_165D8E:: @ 8165D8E
	lockall
	setvar VAR_TEMP_1, 0
	goto EventScript_165DBE
	end

PewterCity_EventScript_165D9A:: @ 8165D9A
	lockall
	setvar VAR_TEMP_1, 1
	goto EventScript_165DBE
	end

PewterCity_EventScript_165DA6:: @ 8165DA6
	lockall
	setvar VAR_TEMP_1, 2
	goto EventScript_165DBE
	end

PewterCity_EventScript_165DB2:: @ 8165DB2
	lockall
	setvar VAR_TEMP_1, 3
	goto EventScript_165DBE
	end

EventScript_165DBE:: @ 8165DBE
	textcolor 0
	msgbox gUnknown_817E67E
	closemessage
	playbgm MUS_ANNAI, 0
	compare VAR_TEMP_1, 0
	call_if_eq EventScript_165E0A
	compare VAR_TEMP_1, 1
	call_if_eq EventScript_165E26
	compare VAR_TEMP_1, 2
	call_if_eq EventScript_165E42
	msgbox gUnknown_817E6C7
	closemessage
	applymovement 5, Movement_165D83
	waitmovement 0
	fadedefaultbgm
	removeobject 5
	clearflag FLAG_HIDE_PEWTER_CITY_GYM_GUIDE
	releaseall
	end

EventScript_165E0A:: @ 8165E0A
	applymovement 5, Movement_165F6C
	waitmovement 0
	applymovement OBJ_EVENT_ID_PLAYER, Movement_165E7A
	applymovement 5, Movement_165F7F
	waitmovement 0
	return

EventScript_165E26:: @ 8165E26
	applymovement 5, Movement_165F71
	waitmovement 0
	applymovement OBJ_EVENT_ID_PLAYER, Movement_165EB9
	applymovement 5, Movement_165FBF
	waitmovement 0
	return

EventScript_165E42:: @ 8165E42
	applymovement 5, Movement_165F74
	waitmovement 0
	applymovement OBJ_EVENT_ID_PLAYER, Movement_165EF9
	applymovement 5, Movement_166000
	waitmovement 0
	return

EventScript_165E5E:: @ 8165E5E
	applymovement 5, Movement_165F78
	waitmovement 0
	applymovement OBJ_EVENT_ID_PLAYER, Movement_165F3A
	applymovement 5, Movement_166042
	waitmovement 0
	return

Movement_165E7A:: @ 8165E7A
	walk_left
	walk_left
	walk_left
	walk_left
	walk_up
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	step_end

Movement_165EB9:: @ 8165EB9
	walk_up
	walk_left
	walk_left
	walk_left
	walk_left
	walk_up
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	step_end

Movement_165EF9:: @ 8165EF9
	walk_up
	walk_up
	walk_left
	walk_left
	walk_left
	walk_left
	walk_up
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	step_end

Movement_165F3A:: @ 8165F3A
	walk_left
	walk_left
	walk_left
	walk_left
	walk_up
	walk_left
	walk_left
	walk_left
	walk_up
	walk_up
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_right
	step_end

Movement_165F6C:: @ 8165F6C
	walk_left
	walk_down
	walk_in_place_fastest_right
	walk_in_place_right
	step_end

Movement_165F71:: @ 8165F71
	walk_down
	walk_in_place_down
	step_end

Movement_165F74:: @ 8165F74
	walk_down
	walk_down
	walk_in_place_down
	step_end

Movement_165F78:: @ 8165F78
	walk_down
	walk_down
	walk_right
	walk_down
	walk_right
	walk_in_place_right
	step_end

Movement_165F7F:: @ 8165F7F
	walk_left
	walk_left
	walk_left
	walk_up
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_in_place_fastest_left
	step_end

Movement_165FBF:: @ 8165FBF
	walk_left
	walk_left
	walk_left
	walk_left
	walk_up
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_in_place_fastest_left
	step_end

Movement_166000:: @ 8166000
	walk_up
	walk_left
	walk_left
	walk_left
	walk_left
	walk_up
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_in_place_fastest_left
	step_end

Movement_166042:: @ 8166042
	walk_left
	walk_left
	walk_left
	walk_up
	walk_left
	walk_left
	walk_left
	walk_up
	walk_up
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_right
	walk_right
	walk_in_place_fastest_left
	step_end

PewterCity_EventScript_166075:: @ 8166075
	msgbox gUnknown_817E436, MSGBOX_NPC
	end

PewterCity_EventScript_16607E:: @ 816607E
	lock
	faceplayer
	msgbox gUnknown_817E53E, MSGBOX_YESNO
	compare VAR_RESULT, YES
	goto_if_eq EventScript_166136
	msgbox gUnknown_817E589
	closemessage
	delay 10
	playbgm MUS_ANNAI, 0
	compare VAR_FACING, DIR_NORTH
	call_if_eq EventScript_1660EE
	compare VAR_FACING, DIR_SOUTH
	call_if_eq EventScript_166100
	compare VAR_FACING, DIR_WEST
	call_if_eq EventScript_166112
	compare VAR_FACING, DIR_EAST
	call_if_eq EventScript_166124
	msgbox gUnknown_817E5AC
	closemessage
	delay 10
	applymovement 2, Movement_16621C
	waitmovement 0
	fadedefaultbgm
	removeobject 2
	clearflag FLAG_HIDE_PEWTER_MUSEUM_GUIDE
	release
	end

EventScript_1660EE:: @ 81660EE
	applymovement 2, Movement_16615C
	applymovement OBJ_EVENT_ID_PLAYER, Movement_166140
	waitmovement 0
	return

EventScript_166100:: @ 8166100
	applymovement 2, Movement_166193
	applymovement OBJ_EVENT_ID_PLAYER, Movement_166177
	waitmovement 0
	return

EventScript_166112:: @ 8166112
	applymovement 2, Movement_1661CA
	applymovement OBJ_EVENT_ID_PLAYER, Movement_1661AE
	waitmovement 0
	return

EventScript_166124:: @ 8166124
	applymovement 2, Movement_166201
	applymovement OBJ_EVENT_ID_PLAYER, Movement_1661E5
	waitmovement 0
	return

EventScript_166136:: @ 8166136
	msgbox gUnknown_817E55C
	release
	end

Movement_166140:: @ 8166140
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_up
	walk_up
	walk_up
	walk_up
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	delay_8
	walk_in_place_fastest_up
	step_end

Movement_16615C:: @ 816615C
	walk_up
	walk_up
	walk_up
	walk_up
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_up
	walk_up
	walk_up
	walk_up
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_in_place_fastest_up
	step_end

Movement_166177:: @ 8166177
	delay_16
	delay_16
	walk_left
	walk_up
	walk_up
	walk_up
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_up
	walk_up
	walk_up
	walk_up
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	delay_8
	walk_in_place_fastest_up
	step_end

Movement_166193:: @ 8166193
	walk_left
	walk_up
	walk_up
	walk_up
	walk_up
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_up
	walk_up
	walk_up
	walk_up
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_in_place_fastest_up
	step_end

Movement_1661AE:: @ 81661AE
	walk_left
	walk_up
	walk_up
	walk_up
	walk_up
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_up
	walk_up
	walk_up
	walk_up
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	delay_8
	walk_in_place_fastest_up
	step_end

Movement_1661CA:: @ 81661CA
	walk_up
	walk_up
	walk_up
	walk_up
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_up
	walk_up
	walk_up
	walk_up
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_in_place_fastest_up
	step_end

Movement_1661E5:: @ 81661E5
	walk_right
	walk_up
	walk_up
	walk_up
	walk_up
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_up
	walk_up
	walk_up
	walk_up
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	delay_8
	walk_in_place_fastest_up
	step_end

Movement_166201:: @ 8166201
	walk_up
	walk_up
	walk_up
	walk_up
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_up
	walk_up
	walk_up
	walk_up
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_in_place_fastest_up
	step_end

Movement_16621C:: @ 816621C
	walk_down
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_down
	walk_down
	walk_down
	walk_right
	walk_right
	walk_right
	step_end

PewterCity_EventScript_16622B:: @ 816622B
	lock
	faceplayer
	famechecker FAMECHECKER_BROCK, 2
	msgbox gUnknown_817E49F
	release
	end

PewterCity_EventScript_166244:: @ 8166244
	lock
	faceplayer
	msgbox gUnknown_817E602, MSGBOX_YESNO
	compare VAR_RESULT, YES
	goto_if_eq EventScript_166263
	msgbox gUnknown_817E644
	release
	end

EventScript_166263:: @ 8166263
	msgbox gUnknown_817E626
	release
	end

PewterCity_EventScript_16626D:: @ 816626D
	msgbox gUnknown_817E6F6, MSGBOX_SIGN
	end

PewterCity_EventScript_166276:: @ 8166276
	msgbox gUnknown_817E748, MSGBOX_SIGN
	end

PewterCity_EventScript_16627F:: @ 816627F
	msgbox gUnknown_817E7C5, MSGBOX_SIGN
	end

PewterCity_EventScript_166288:: @ 8166288
	lockall
	famechecker FAMECHECKER_BROCK, 0
	msgbox gUnknown_817E7DE
	releaseall
	end

PewterCity_EventScript_1662A0:: @ 81662A0
	msgbox gUnknown_817E824, MSGBOX_SIGN
	end

PewterCity_EventScript_1662A9:: @ 81662A9
	lock
	faceplayer
	setvar VAR_TEMP_1, 0
	call EventScript_1662DE
	release
	end

PewterCity_EventScript_1662B7:: @ 81662B7
	lockall
	setvar VAR_TEMP_1, 1
	call EventScript_1662DE
	releaseall
	end

PewterCity_EventScript_1662C4:: @ 81662C4
	lockall
	setvar VAR_TEMP_1, 2
	call EventScript_1662DE
	releaseall
	end

PewterCity_EventScript_1662D1:: @ 81662D1
	lockall
	setvar VAR_TEMP_1, 3
	call EventScript_1662DE
	releaseall
	end

EventScript_1662DE:: @ 81662DE
	textcolor 0
	compare VAR_TEMP_1, 1
	call_if_eq EventScript_1663CA
	compare VAR_TEMP_1, 2
	call_if_eq EventScript_1663CA
	compare VAR_TEMP_1, 3
	call_if_eq EventScript_1663CA
	waitse
	playse SE_PIN
	applymovement 7, Movement_ExclamationMark
	waitmovement 0
	applymovement 7, Movement_Delay48
	waitmovement 0
	msgbox gUnknown_817E902
	compare VAR_TEMP_1, 0
	call_if_eq EventScript_1663D5
	compare VAR_TEMP_1, 1
	call_if_eq EventScript_1663DA
	compare VAR_TEMP_1, 2
	call_if_eq EventScript_1663E6
	compare VAR_TEMP_1, 3
	call_if_eq EventScript_1663FC
	msgbox gUnknown_817E90C
	textcolor 3
	playfanfare MUS_FAN5
	message Text_17E970
	waitmessage
	waitfanfare
	msgbox gUnknown_817E99D
	special sub_80699BC
	signmsg
	msgbox gUnknown_817E9C7
	normalmsg
	call EventScript_1A6675
	msgbox gUnknown_817EA06
	closemessage
	compare VAR_TEMP_1, 0
	call_if_eq EventScript_166412
	compare VAR_TEMP_1, 1
	call_if_eq EventScript_16641D
	compare VAR_TEMP_1, 2
	call_if_eq EventScript_166428
	compare VAR_TEMP_1, 3
	call_if_eq EventScript_166433
	delay 30
	textcolor 3
	msgbox gUnknown_817EA36
	closemessage
	removeobject 7
	setflag FLAG_SYS_RUNNING_SHOES
	setvar VAR_MAP_SCENE_PEWTER_CITY, 2
	return

EventScript_1663CA:: @ 81663CA
	applymovement 7, Movement_WalkInPlaceFastestDown
	waitmovement 0
	return

EventScript_1663D5:: @ 81663D5
	closemessage
	delay 20
	return

EventScript_1663DA:: @ 81663DA
	closemessage
	applymovement OBJ_EVENT_ID_PLAYER, Movement_WalkInPlaceFastestUp
	waitmovement 0
	return

EventScript_1663E6:: @ 81663E6
	closemessage
	applymovement 7, Movement_16643E
	waitmovement 0
	applymovement OBJ_EVENT_ID_PLAYER, Movement_WalkInPlaceFastestUp
	waitmovement 0
	return

EventScript_1663FC:: @ 81663FC
	closemessage
	applymovement 7, Movement_166441
	waitmovement 0
	applymovement OBJ_EVENT_ID_PLAYER, Movement_WalkInPlaceFastestUp
	waitmovement 0
	return

EventScript_166412:: @ 8166412
	applymovement 7, Movement_166445
	waitmovement 0
	return

EventScript_16641D:: @ 816641D
	applymovement 7, Movement_166450
	waitmovement 0
	return

EventScript_166428:: @ 8166428
	applymovement 7, Movement_16645B
	waitmovement 0
	return

EventScript_166433:: @ 8166433
	applymovement 7, Movement_166465
	waitmovement 0
	return

Movement_16643E:: @ 816643E
	delay_4
	walk_down
	step_end

Movement_166441:: @ 8166441
	delay_4
	walk_down
	walk_down
	step_end

Movement_166445:: @ 8166445
	walk_down
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	step_end

Movement_166450:: @ 8166450
	walk_left
	walk_down
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	step_end

Movement_16645B:: @ 816645B
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	step_end

Movement_166465:: @ 8166465
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	step_end

Movement_16646F:: @ 816646F
	walk_in_place_left
	step_end
