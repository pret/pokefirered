FourIsland_MapScripts:: @ 8167CAE
	map_script MAP_SCRIPT_ON_TRANSITION, FourIsland_OnTransition
	map_script MAP_SCRIPT_ON_FRAME_TABLE, FourIsland_OnFrame
	.byte 0

FourIsland_OnTransition:: @ 8167CB9
	setworldmapflag FLAG_WORLD_MAP_FOUR_ISLAND
	compare VAR_MAP_SCENE_FOUR_ISLAND, 0
	call_if_eq EventScript_167CCD
	call EventScript_167CD1
	end

EventScript_167CCD:: @ 8167CCD
	clearflag FLAG_HIDE_FOUR_ISLAND_RIVAL
	return

EventScript_167CD1:: @ 8167CD1
	goto_if_unset FLAG_PENDING_DAYCARE_EGG, EventScript_167CE1
	setobjectxyperm 1, 16, 14

EventScript_167CE1:: @ 8167CE1
	return

FourIsland_OnFrame:: @ 8167CE2
	map_script_2 VAR_MAP_SCENE_FOUR_ISLAND, 0, EventScript_167CEC
	.2byte 0

EventScript_167CEC:: @ 8167CEC
	lockall
	textcolor 0
	applymovement 10, Movement_WalkInPlaceFastestDown
	waitmovement 0
	playbgm MUS_RIVAL1, 0
	applymovement 10, Movement_ExclamationMark
	waitmovement 0
	applymovement 10, Movement_Delay48
	waitmovement 0
	delay 25
	applymovement 10, Movement_167D49
	waitmovement 0
	msgbox gUnknown_8182B37
	closemessage
	applymovement OBJ_EVENT_ID_PLAYER, Movement_167D52
	applymovement 10, Movement_167D4E
	waitmovement 0
	fadedefaultbgm
	playse SE_KAIDAN
	delay 35
	removeobject 10
	setvar VAR_MAP_SCENE_FOUR_ISLAND, 1
	releaseall
	end

Movement_167D49:: @ 8167D49
	walk_right
	walk_right
	walk_down
	walk_down
	step_end

Movement_167D4E:: @ 8167D4E
	delay_16
	delay_4
	walk_down
	step_end

Movement_167D52:: @ 8167D52
	walk_left
	walk_in_place_fastest_right
	step_end

FourIsland_EventScript_167D55:: @ 8167D55
	special sub_8110AB4
	compare VAR_RESULT, 2
	goto_if_eq EventScript_1A7AE0
	special sub_8112364
	lock
	faceplayer
	special GetDaycareMonNicknames
	specialvar VAR_RESULT, GetDaycareState
	compare VAR_RESULT, 1
	goto_if_eq EventScript_167D9B
	compare VAR_RESULT, 2
	goto_if_eq EventScript_167E0C
	compare VAR_RESULT, 3
	goto_if_eq EventScript_167E19
	msgbox gUnknown_81BF555
	release
	end

EventScript_167D9B:: @ 8167D9B
	msgbox gUnknown_81BF5E3, MSGBOX_YESNO
	compare VAR_RESULT, YES
	goto_if_eq EventScript_167DD1
	msgbox gUnknown_81BF7B6, MSGBOX_YESNO
	compare VAR_RESULT, YES
	goto_if_eq EventScript_167DD1
	msgbox gUnknown_81BF6CF
	clearflag FLAG_PENDING_DAYCARE_EGG
	special RejectEggFromDayCare
	release
	end

EventScript_167DD1:: @ 8167DD1
	specialvar VAR_RESULT, CalculatePlayerPartyCount
	compare VAR_RESULT, 6
	goto_if_ne EventScript_167DEB
	msgbox gUnknown_81BF6F0
	release
	end

EventScript_167DEB:: @ 8167DEB
	textcolor 3
	message Text_1BF72A
	call EventScript_1A6675
	playfanfare MUS_FANFA1
	waitfanfare
	waitbuttonpress
	msgbox gUnknown_81BF755
	special GiveEggFromDaycare
	clearflag FLAG_PENDING_DAYCARE_EGG
	release
	end

EventScript_167E0C:: @ 8167E0C
	special GetDaycareMonNicknames
	msgbox gUnknown_81BF69A
	release
	end

EventScript_167E19:: @ 8167E19
	special GetDaycareMonNicknames
	msgbox gUnknown_81BF789
	special SetDaycareCompatibilityString
	special Special_ShowStringVar4AsFieldMessage
	waitmessage
	waitbuttonpress
	release
	end

FourIsland_EventScript_167E2E:: @ 8167E2E
	lock
	faceplayer
	goto_if_set FLAG_SYS_CAN_LINK_WITH_RS, EventScript_167E43
	msgbox gUnknown_8182A2B
	release
	end

EventScript_167E43:: @ 8167E43
	famechecker FAMECHECKER_LORELEI, 5
	msgbox gUnknown_8182A75
	release
	end

FourIsland_EventScript_167E5A:: @ 8167E5A
	lock
	faceplayer
	famechecker FAMECHECKER_LORELEI, 4
	msgbox gUnknown_8182CE3
	release
	end

FourIsland_EventScript_167E73:: @ 8167E73
	msgbox gUnknown_8182D8E, MSGBOX_NPC
	end

FourIsland_EventScript_167E7C:: @ 8167E7C
	msgbox gUnknown_8182A03, MSGBOX_SIGN
	end

FourIsland_EventScript_167E85:: @ 8167E85
	msgbox gUnknown_8182DEB, MSGBOX_SIGN
	end
