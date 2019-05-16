PalletTown_GarysHouse_MapScripts:: @ 8168D27
	map_script 3, PalletTown_GarysHouse_MapScript1_168D2D
	.byte 0

PalletTown_GarysHouse_MapScript1_168D2D:: @ 8168D2D
	compare_var_to_value VAR_0x4058, 2
	call_if 0, EventScript_168D44
	compare_var_to_value VAR_0x4058, 2
	call_if 4, EventScript_168D50
	end

EventScript_168D44:: @ 8168D44
	setobjectmovementtype 1, 10
	setobjectxyperm 1, 5, 4
	return

EventScript_168D50:: @ 8168D50
	setvar VAR_0x4001, 1
	return

PalletTown_GarysHouse_EventScript_168D56:: @ 8168D56
	lock
	faceplayer
	setvar VAR_0x8004, 1
	setvar VAR_0x8005, 2
	special UpdatePickStateFromSpecialVar8005
	checkflag FLAG_0x82C
	goto_if 1, EventScript_168DB9
	compare_var_to_value VAR_0x4001, 1
	goto_if 1, EventScript_168EEC
	compare_var_to_value VAR_0x4058, 2
	goto_if 1, EventScript_168F59
	compare_var_to_value VAR_0x4058, 1
	goto_if 1, EventScript_168EF6
	compare_var_to_value VAR_MAP_SCENE_PALLET_TOWN_PROFESSOR_OAKS_LAB, 1
	goto_if 4, EventScript_168DAF
	loadword 0, gUnknown_818D58C
	callstd 4
	closemessage
	applymovement 1, Movement_1A75E5
	waitmovement 0
	release
	end

EventScript_168DAF:: @ 8168DAF
	loadword 0, gUnknown_818D5C4
	callstd 4
	release
	end

EventScript_168DB9:: @ 8168DB9
	special sub_8110AB4
	compare_var_to_value VAR_RESULT, 2
	goto_if 1, EventScript_1A7AE0
	special sub_8112364
	compare_var_to_value VAR_MIRAGE_RND_L, 500
	goto_if 0, EventScript_168E46
	loadword 0, gUnknown_818D7D3
	callstd 5
	compare_var_to_value VAR_RESULT, 0
	goto_if 1, EventScript_168E3C
	loadword 0, gUnknown_818D8B2
	callstd 4
	special sub_80BF8FC
	waitstate
	lock
	faceplayer
	compare_var_to_value VAR_0x8004, 6
	goto_if 4, EventScript_168E3C
	specialvar VAR_RESULT, sub_80CAD54
	compare_var_to_value VAR_RESULT, 412
	goto_if 1, EventScript_168E32
	loadword 0, gUnknown_818D8CC
	callstd 4
	closemessage
	fadescreen 1
	playfanfare MUS_ME_ASA
	waitfanfare
	special sub_80CC948
	fadescreen 0
	special TV_CopyNicknameToStringVar1AndEnsureTerminated
	loadword 0, gUnknown_818D8FE
	callstd 4
	release
	end

EventScript_168E32:: @ 8168E32
	loadword 0, gUnknown_818D97B
	callstd 4
	release
	end

EventScript_168E3C:: @ 8168E3C
	loadword 0, gUnknown_818D875
	callstd 4
	release
	end

EventScript_168E46:: @ 8168E46
	loadword 0, gUnknown_818D9A5
	callstd 4
	specialvar VAR_RESULT, sub_80CA76C
	copyvar VAR_0x8000, VAR_RESULT
	compare_var_to_value VAR_0x8000, 0
	goto_if 1, EventScript_168EA6
	compare_var_to_value VAR_0x8000, 1
	goto_if 1, EventScript_168EB0
	compare_var_to_value VAR_0x8000, 2
	goto_if 1, EventScript_168EBA
	compare_var_to_value VAR_0x8000, 3
	goto_if 1, EventScript_168EC4
	compare_var_to_value VAR_0x8000, 4
	goto_if 1, EventScript_168ECE
	compare_var_to_value VAR_0x8000, 5
	goto_if 1, EventScript_168ED8
	compare_var_to_value VAR_0x8000, 6
	goto_if 1, EventScript_168EE2
	end

EventScript_168EA6:: @ 8168EA6
	loadword 0, gUnknown_818DBDD
	callstd 4
	release
	end

EventScript_168EB0:: @ 8168EB0
	loadword 0, gUnknown_818DB88
	callstd 4
	release
	end

EventScript_168EBA:: @ 8168EBA
	loadword 0, gUnknown_818DB2E
	callstd 4
	release
	end

EventScript_168EC4:: @ 8168EC4
	loadword 0, gUnknown_818DAF3
	callstd 4
	release
	end

EventScript_168ECE:: @ 8168ECE
	loadword 0, gUnknown_818DABE
	callstd 4
	release
	end

EventScript_168ED8:: @ 8168ED8
	loadword 0, gUnknown_818DA73
	callstd 4
	release
	end

EventScript_168EE2:: @ 8168EE2
	loadword 0, gUnknown_818DA16
	callstd 4
	release
	end

EventScript_168EEC:: @ 8168EEC
	loadword 0, gUnknown_818D701
	callstd 4
	release
	end

EventScript_168EF6:: @ 8168EF6
	loadword 0, gUnknown_818D60A
	callstd 4
	closemessage
	checkitemspace ITEM_TOWN_MAP, 1
	compare_var_to_value VAR_RESULT, 0
	goto_if 1, EventScript_168F4F
	applymovement 1, Movement_1A75EB
	waitmovement 0
	removeobject 2
	setvar VAR_0x4058, 2
	delay 15
	applymovement 1, Movement_1A75E1
	waitmovement 0
	delay 12
	additem ITEM_TOWN_MAP, 1
	giveitemfanfaremsg gUnknown_818D661, ITEM_TOWN_MAP, 1, BGM_FRLG_ME_KEYITEM
	release
	end

EventScript_168F4F:: @ 8168F4F
	loadword 0, gUnknown_818D684
	callstd 4
	release
	end

EventScript_168F59:: @ 8168F59
	loadword 0, gUnknown_818D6AF
	callstd 4
	release
	end

PalletTown_GarysHouse_EventScript_168F63:: @ 8168F63
	loadword 0, gUnknown_818D763
	callstd 2
	end

PalletTown_GarysHouse_EventScript_168F6C:: @ 8168F6C
	loadword 0, gUnknown_818D7A1
	callstd 3
	end

PalletTown_GarysHouse_EventScript_168F75:: @ 8168F75
	loadword 0, gUnknown_818DC47
	callstd 3
	end
