ViridianCity_MapScripts:: @ 81658D3
	map_script MAP_SCRIPT_ON_TRANSITION, ViridianCity_OnTransition
	.byte 0

ViridianCity_OnTransition:: @ 81658D9
	setworldmapflag FLAG_WORLD_MAP_VIRIDIAN_CITY
	compare VAR_MAP_SCENE_VIRIDIAN_CITY_OLD_MAN, 0
	call_if_eq EventScript_165920
	compare VAR_MAP_SCENE_VIRIDIAN_CITY_OLD_MAN, 1
	call_if_eq EventScript_16590F
	compare VAR_MAP_SCENE_VIRIDIAN_CITY_OLD_MAN, 2
	call_if_ge EventScript_165909
	compare VAR_MAP_SCENE_VIRIDIAN_CITY_GYM_DOOR, 0
	call_if_eq EventScript_165931
	end

EventScript_165909:: @ 8165909
	setvar VAR_OBJ_GFX_ID_0, OBJECT_EVENT_GFX_OLD_MAN_1
	return

EventScript_16590F:: @ 816590F
	setvar VAR_OBJ_GFX_ID_0, OBJECT_EVENT_GFX_OLD_MAN_1
	setobjectxyperm 4, 21, 8
	setobjectmovementtype 4, 1
	return

EventScript_165920:: @ 8165920
	setvar VAR_OBJ_GFX_ID_0, OBJECT_EVENT_GFX_VIRIDIAN_DRUNK
	setobjectxyperm 4, 21, 11
	setobjectmovementtype 4, 8
	return

EventScript_165931:: @ 8165931
	goto_if_unset FLAG_BADGE02_GET, EventScript_1A77A9
	goto_if_unset FLAG_BADGE03_GET, EventScript_1A77A9
	goto_if_unset FLAG_BADGE04_GET, EventScript_1A77A9
	goto_if_unset FLAG_BADGE05_GET, EventScript_1A77A9
	goto_if_unset FLAG_BADGE06_GET, EventScript_1A77A9
	goto_if_unset FLAG_BADGE07_GET, EventScript_1A77A9
	setvar VAR_MAP_SCENE_VIRIDIAN_CITY_GYM_DOOR, 1
	return

ViridianCity_EventScript_16596D:: @ 816596D
	lockall
	textcolor 3
	applymovement OBJ_EVENT_ID_PLAYER, Movement_WalkInPlaceFastestUp
	waitmovement 0
	delay 20
	msgbox gUnknown_817E2F5
	closemessage
	applymovement OBJ_EVENT_ID_PLAYER, Movement_165992
	waitmovement 0
	releaseall
	end

Movement_165992:: @ 8165992
	jump_2_down
	step_end

ViridianCity_EventScript_165994:: @ 8165994
	msgbox gUnknown_817E1BB, MSGBOX_SIGN
	end

ViridianCity_EventScript_16599D:: @ 816599D
	msgbox gUnknown_817E1E7, MSGBOX_SIGN
	end

ViridianCity_EventScript_1659A6:: @ 81659A6
	msgbox gUnknown_817E24D, MSGBOX_SIGN
	end

ViridianCity_EventScript_1659AF:: @ 81659AF
	msgbox gUnknown_817E2DB, MSGBOX_SIGN
	end

ViridianCity_EventScript_1659B8:: @ 81659B8
	msgbox gUnknown_817E2F5, MSGBOX_SIGN
	end

ViridianCity_EventScript_1659C1:: @ 81659C1
	msgbox gUnknown_817DABB, MSGBOX_NPC
	end

ViridianCity_EventScript_1659CA:: @ 81659CA
	lock
	faceplayer
	compare VAR_MAP_SCENE_VIRIDIAN_CITY_GYM_DOOR, 1
	goto_if_eq EventScript_1659EC
	msgbox gUnknown_817DB39
	closemessage
	applymovement 3, Movement_FaceOriginalDirection
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
	goto_if_set FLAG_BADGE01_GET, EventScript_165A23
	compare VAR_MAP_SCENE_VIRIDIAN_CITY_OLD_MAN, 2
	goto_if_ge EventScript_165A4A
	compare VAR_MAP_SCENE_VIRIDIAN_CITY_OLD_MAN, 1
	goto_if_eq EventScript_165A54
	compare VAR_MAP_SCENE_VIRIDIAN_CITY_OLD_MAN, 0
	goto_if_eq EventScript_165A84
	end

EventScript_165A23:: @ 8165A23
	msgbox gUnknown_817E046, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq EventScript_165A40
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
	compare VAR_RESULT, 2
	goto_if_eq EventScript_1A7AE0
	special sub_8112364
	special ScrSpecial_StartOldManTutorialBattle
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
	compare VAR_RESULT, YES
	goto_if_eq EventScript_165AB0
	compare VAR_RESULT, NO
	goto_if_eq EventScript_165ABA
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
	compare VAR_MAP_SCENE_VIRIDIAN_CITY_OLD_MAN, 0
	goto_if_eq EventScript_165ADB
	msgbox gUnknown_817DC99
	release
	end

EventScript_165ADB:: @ 8165ADB
	msgbox gUnknown_817DC4E
	closemessage
	applymovement 5, Movement_FaceOriginalDirection
	waitmovement 0
	release
	end

ViridianCity_EventScript_DreamEaterTutor:: @ 8165AF0
	goto EventScript_DreamEaterTutor
	end

ViridianCity_EventScript_165AF6:: @ 8165AF6
	lockall
	textcolor 0
	msgbox gUnknown_817DD03
	closemessage
	applymovement OBJ_EVENT_ID_PLAYER, Movement_165B0E
	waitmovement 0
	releaseall
	end

Movement_165B0E:: @ 8165B0E
	walk_down
	step_end

ViridianCity_EventScript_165B10:: @ 8165B10
	lockall
	textcolor 0
	applymovement 4, Movement_WalkInPlaceFastestLeft
	waitmovement 0
	applymovement OBJ_EVENT_ID_PLAYER, Movement_WalkInPlaceFastestRight
	waitmovement 0
	call EventScript_165B4C
	release
	end

ViridianCity_EventScript_165B2E:: @ 8165B2E
	lockall
	textcolor 0
	applymovement 4, Movement_WalkInPlaceFastestRight
	waitmovement 0
	applymovement OBJ_EVENT_ID_PLAYER, Movement_WalkInPlaceFastestLeft
	waitmovement 0
	call EventScript_165B4C
	release
	end

EventScript_165B4C:: @ 8165B4C
	msgbox gUnknown_817DD4E
	closemessage
	special sub_8110AB4
	compare VAR_RESULT, 2
	goto_if_eq EventScript_1A7AE0
	special sub_8112364
	special ScrSpecial_StartOldManTutorialBattle
	waitstate
	lock
	faceplayer
	msgbox gUnknown_817DE9B
	setvar VAR_MAP_SCENE_VIRIDIAN_CITY_OLD_MAN, 2
	giveitem ITEM_TEACHY_TV
	msgbox gUnknown_817DEEB
	return
