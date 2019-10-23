ViridianCity_MapScripts:: @ 81658D3
	map_script 3, ViridianCity_MapScript1_1658D9
	.byte 0

ViridianCity_MapScript1_1658D9:: @ 81658D9
	setworldmapflag FLAG_WORLD_MAP_VIRIDIAN_CITY
	compare_var_to_value VAR_MAP_SCENE_VIRIDIAN_CITY_OLD_MAN, 0
	call_if eq, EventScript_165920
	compare_var_to_value VAR_MAP_SCENE_VIRIDIAN_CITY_OLD_MAN, 1
	call_if eq, EventScript_16590F
	compare_var_to_value VAR_MAP_SCENE_VIRIDIAN_CITY_OLD_MAN, 2
	call_if ge, EventScript_165909
	compare_var_to_value VAR_MAP_SCENE_VIRIDIAN_CITY_GYM_DOOR, 0
	call_if eq, EventScript_165931
	end

EventScript_165909:: @ 8165909
	setvar VAR_OBJ_GFX_ID_0, MAP_OBJ_GFX_OLD_MAN_1
	return

EventScript_16590F:: @ 816590F
	setvar VAR_OBJ_GFX_ID_0, MAP_OBJ_GFX_OLD_MAN_1
	setobjectxyperm 4, 21, 8
	setobjectmovementtype 4, 1
	return

EventScript_165920:: @ 8165920
	setvar VAR_OBJ_GFX_ID_0, MAP_OBJ_GFX_VIRIDIAN_DRUNK
	setobjectxyperm 4, 21, 11
	setobjectmovementtype 4, 8
	return

EventScript_165931:: @ 8165931
	checkflag FLAG_BADGE02_GET
	goto_if FALSE, EventScript_1A77A9
	checkflag FLAG_BADGE03_GET
	goto_if FALSE, EventScript_1A77A9
	checkflag FLAG_BADGE04_GET
	goto_if FALSE, EventScript_1A77A9
	checkflag FLAG_BADGE05_GET
	goto_if FALSE, EventScript_1A77A9
	checkflag FLAG_BADGE06_GET
	goto_if FALSE, EventScript_1A77A9
	checkflag FLAG_BADGE07_GET
	goto_if FALSE, EventScript_1A77A9
	setvar VAR_MAP_SCENE_VIRIDIAN_CITY_GYM_DOOR, 1
	return

ViridianCity_EventScript_16596D:: @ 816596D
	lockall
	textcolor 3
	applymovement 255, Movement_1A75E9
	waitmovement 0
	delay 20
	msgbox gUnknown_817E2F5
	closemessage
	applymovement 255, Movement_165992
	waitmovement 0
	releaseall
	end

Movement_165992:: @ 8165992
	step_14
	step_end

ViridianCity_EventScript_165994:: @ 8165994
	msgbox gUnknown_817E1BB, 3
	end

ViridianCity_EventScript_16599D:: @ 816599D
	msgbox gUnknown_817E1E7, 3
	end

ViridianCity_EventScript_1659A6:: @ 81659A6
	msgbox gUnknown_817E24D, 3
	end

ViridianCity_EventScript_1659AF:: @ 81659AF
	msgbox gUnknown_817E2DB, 3
	end

ViridianCity_EventScript_1659B8:: @ 81659B8
	msgbox gUnknown_817E2F5, 3
	end

ViridianCity_EventScript_1659C1:: @ 81659C1
	msgbox gUnknown_817DABB, 2
	end

ViridianCity_EventScript_1659CA:: @ 81659CA
	lock
	faceplayer
	compare_var_to_value VAR_MAP_SCENE_VIRIDIAN_CITY_GYM_DOOR, 1
	goto_if eq, EventScript_1659EC
	msgbox gUnknown_817DB39
	closemessage
	applymovement 3, Movement_1A75E5
	waitmovement 0
	release
	end

EventScript_1659EC:: @ 81659EC
	msgbox gUnknown_817DB78
	release
	end

ViridianCity_EventScript_1659F6:: @ 81659F6
	lock
	faceplayer
	checkflag FLAG_BADGE01_GET
	goto_if TRUE, EventScript_165A23
	compare_var_to_value VAR_MAP_SCENE_VIRIDIAN_CITY_OLD_MAN, 2
	goto_if ge, EventScript_165A4A
	compare_var_to_value VAR_MAP_SCENE_VIRIDIAN_CITY_OLD_MAN, 1
	goto_if eq, EventScript_165A54
	compare_var_to_value VAR_MAP_SCENE_VIRIDIAN_CITY_OLD_MAN, 0
	goto_if eq, EventScript_165A84
	end

EventScript_165A23:: @ 8165A23
	msgbox gUnknown_817E046, MSGBOX_YESNO
	compare_var_to_value VAR_RESULT, 0
	goto_if eq, EventScript_165A40
	msgbox gUnknown_817E0EA
	release
	end

EventScript_165A40:: @ 8165A40
	msgbox gUnknown_817E14E
	release
	end

EventScript_165A4A:: @ 8165A4A
	msgbox gUnknown_817DF61
	release
	end

EventScript_165A54:: @ 8165A54
	call EventScript_165B4C
	release
	end

EventScript_165A5B:: @ 8165A5B
	msgbox gUnknown_817DEEB
	release
	end

EventScript_165A65:: @ 8165A65
	msgbox gUnknown_817DE9B
	special sub_8110AB4
	compare_var_to_value VAR_RESULT, 2
	goto_if eq, EventScript_1A7AE0
	special sub_8112364
	special sub_807F888
	waitstate
	release
	end

EventScript_165A84:: @ 8165A84
	msgbox gUnknown_817DD03
	closemessage
	release
	end

ViridianCity_EventScript_165A8F:: @ 8165A8F
	lock
	faceplayer
	msgbox gUnknown_817DB98, MSGBOX_YESNO
	compare_var_to_value VAR_RESULT, 1
	goto_if eq, EventScript_165AB0
	compare_var_to_value VAR_RESULT, 0
	goto_if eq, EventScript_165ABA
	end

EventScript_165AB0:: @ 8165AB0
	msgbox gUnknown_817DBE4
	release
	end

EventScript_165ABA:: @ 8165ABA
	msgbox gUnknown_817DBD5
	release
	end

ViridianCity_EventScript_165AC4:: @ 8165AC4
	lock
	faceplayer
	compare_var_to_value VAR_MAP_SCENE_VIRIDIAN_CITY_OLD_MAN, 0
	goto_if eq, EventScript_165ADB
	msgbox gUnknown_817DC99
	release
	end

EventScript_165ADB:: @ 8165ADB
	msgbox gUnknown_817DC4E
	closemessage
	applymovement 5, Movement_1A75E5
	waitmovement 0
	release
	end

ViridianCity_EventScript_165AF0:: @ 8165AF0
	goto EventScript_1C4A1E
	end

ViridianCity_EventScript_165AF6:: @ 8165AF6
	lockall
	textcolor 0
	msgbox gUnknown_817DD03
	closemessage
	applymovement 255, Movement_165B0E
	waitmovement 0
	releaseall
	end

Movement_165B0E:: @ 8165B0E
	step_10
	step_end

ViridianCity_EventScript_165B10:: @ 8165B10
	lockall
	textcolor 0
	applymovement 4, Movement_1A75E7
	waitmovement 0
	applymovement 255, Movement_1A75EB
	waitmovement 0
	call EventScript_165B4C
	release
	end

ViridianCity_EventScript_165B2E:: @ 8165B2E
	lockall
	textcolor 0
	applymovement 4, Movement_1A75EB
	waitmovement 0
	applymovement 255, Movement_1A75E7
	waitmovement 0
	call EventScript_165B4C
	release
	end

EventScript_165B4C:: @ 8165B4C
	msgbox gUnknown_817DD4E
	closemessage
	special sub_8110AB4
	compare_var_to_value VAR_RESULT, 2
	goto_if eq, EventScript_1A7AE0
	special sub_8112364
	special sub_807F888
	waitstate
	lock
	faceplayer
	msgbox gUnknown_817DE9B
	setvar VAR_MAP_SCENE_VIRIDIAN_CITY_OLD_MAN, 2
	giveitem ITEM_TEACHY_TV
	msgbox gUnknown_817DEEB
	return
