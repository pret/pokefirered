PalletTown_GarysHouse_MapScripts:: @ 8168D27
	map_script MAP_SCRIPT_ON_TRANSITION, PalletTown_GarysHouse_OnTransition
	.byte 0

PalletTown_GarysHouse_OnTransition:: @ 8168D2D
	compare VAR_MAP_SCENE_PALLET_TOWN_GARYS_HOUSE, 2
	call_if_lt EventScript_168D44
	compare VAR_MAP_SCENE_PALLET_TOWN_GARYS_HOUSE, 2
	call_if_ge EventScript_168D50
	end

EventScript_168D44:: @ 8168D44
	setobjectmovementtype 1, 10
	setobjectxyperm 1, 5, 4
	return

EventScript_168D50:: @ 8168D50
	setvar VAR_TEMP_1, 1
	return

PalletTown_GarysHouse_EventScript_168D56:: @ 8168D56
	lock
	faceplayer
	famechecker FAMECHECKER_DAISY, FCPICKSTATE_COLORED, UpdatePickStateFromSpecialVar8005
	goto_if_set FLAG_SYS_GAME_CLEAR, EventScript_168DB9
	compare VAR_TEMP_1, 1
	goto_if_eq EventScript_168EEC
	compare VAR_MAP_SCENE_PALLET_TOWN_GARYS_HOUSE, 2
	goto_if_eq EventScript_168F59
	compare VAR_MAP_SCENE_PALLET_TOWN_GARYS_HOUSE, 1
	goto_if_eq EventScript_168EF6
	compare VAR_MAP_SCENE_PALLET_TOWN_PROFESSOR_OAKS_LAB, 1
	goto_if_ge EventScript_168DAF
	msgbox gUnknown_818D58C
	closemessage
	applymovement 1, Movement_FaceOriginalDirection
	waitmovement 0
	release
	end

EventScript_168DAF:: @ 8168DAF
	msgbox gUnknown_818D5C4
	release
	end

EventScript_168DB9:: @ 8168DB9
	special sub_8110AB4
	compare VAR_RESULT, 2
	goto_if_eq EventScript_1A7AE0
	special sub_8112364
	compare VAR_MASSAGE_COOLDOWN_STEP_COUNTER, 500
	goto_if_lt EventScript_168E46
	msgbox gUnknown_818D7D3, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq EventScript_168E3C
	msgbox gUnknown_818D8B2
	special Special_ChooseMonFromParty
	waitstate
	lock
	faceplayer
	compare VAR_0x8004, 6
	goto_if_ge EventScript_168E3C
	specialvar VAR_RESULT, Special_GetSpeciesOfPartySlot_x8004
	compare VAR_RESULT, SPECIES_EGG
	goto_if_eq EventScript_168E32
	msgbox gUnknown_818D8CC
	closemessage
	fadescreen 1
	playfanfare MUS_ME_ASA
	waitfanfare
	special Special_DaisyMassageServices
	fadescreen 0
	special TV_CopyNicknameToStringVar1AndEnsureTerminated
	msgbox gUnknown_818D8FE
	release
	end

EventScript_168E32:: @ 8168E32
	msgbox gUnknown_818D97B
	release
	end

EventScript_168E3C:: @ 8168E3C
	msgbox gUnknown_818D875
	release
	end

EventScript_168E46:: @ 8168E46
	msgbox gUnknown_818D9A5
	specialvar VAR_RESULT, Special_GetLeadMonFriendship
	switch VAR_RESULT
	case 0, EventScript_168EA6
	case 1, EventScript_168EB0
	case 2, EventScript_168EBA
	case 3, EventScript_168EC4
	case 4, EventScript_168ECE
	case 5, EventScript_168ED8
	case 6, EventScript_168EE2
	end

EventScript_168EA6:: @ 8168EA6
	msgbox gUnknown_818DBDD
	release
	end

EventScript_168EB0:: @ 8168EB0
	msgbox gUnknown_818DB88
	release
	end

EventScript_168EBA:: @ 8168EBA
	msgbox gUnknown_818DB2E
	release
	end

EventScript_168EC4:: @ 8168EC4
	msgbox gUnknown_818DAF3
	release
	end

EventScript_168ECE:: @ 8168ECE
	msgbox gUnknown_818DABE
	release
	end

EventScript_168ED8:: @ 8168ED8
	msgbox gUnknown_818DA73
	release
	end

EventScript_168EE2:: @ 8168EE2
	msgbox gUnknown_818DA16
	release
	end

EventScript_168EEC:: @ 8168EEC
	msgbox gUnknown_818D701
	release
	end

EventScript_168EF6:: @ 8168EF6
	msgbox gUnknown_818D60A
	closemessage
	checkitemspace ITEM_TOWN_MAP, 1
	compare VAR_RESULT, 0
	goto_if_eq EventScript_168F4F
	applymovement 1, Movement_WalkInPlaceFastestRight
	waitmovement 0
	removeobject 2
	setvar VAR_MAP_SCENE_PALLET_TOWN_GARYS_HOUSE, 2
	delay 15
	applymovement 1, Movement_FacePlayer
	waitmovement 0
	delay 12
	giveitem_msg gUnknown_818D661, ITEM_TOWN_MAP, 1, MUS_FAN5
	release
	end

EventScript_168F4F:: @ 8168F4F
	msgbox gUnknown_818D684
	release
	end

EventScript_168F59:: @ 8168F59
	msgbox gUnknown_818D6AF
	release
	end

PalletTown_GarysHouse_EventScript_168F63:: @ 8168F63
	msgbox gUnknown_818D763, MSGBOX_NPC
	end

PalletTown_GarysHouse_EventScript_168F6C:: @ 8168F6C
	msgbox gUnknown_818D7A1, MSGBOX_SIGN
	end

PalletTown_GarysHouse_EventScript_168F75:: @ 8168F75
	msgbox gUnknown_818DC47, MSGBOX_SIGN
	end
