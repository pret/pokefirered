FourIsland_MapScripts:: @ 8167CAE
	map_script 3, FourIsland_MapScript1_167CB9
	map_script 2, FourIsland_MapScript2_167CE2
	.byte 0

FourIsland_MapScript1_167CB9:: @ 8167CB9
	setworldmapflag 2206
	compare_var_to_value VAR_0x4086, 0
	call_if 1, EventScript_167CCD
	call EventScript_167CD1
	end

EventScript_167CCD:: @ 8167CCD
	clearflag FLAG_0x097
	return

EventScript_167CD1:: @ 8167CD1
	checkflag FLAG_PENDING_DAYCARE_EGG
	goto_if 0, EventScript_167CE1
	setobjectxyperm 1, 16, 14

EventScript_167CE1:: @ 8167CE1
	return

FourIsland_MapScript2_167CE2:: @ 8167CE2
	map_script_2 VAR_0x4086, 0, EventScript_167CEC
	.2byte 0

EventScript_167CEC:: @ 8167CEC
	lockall
	textcolor 0
	applymovement 10, Movement_1A75ED
	waitmovement 0
	playbgm BGM_FRLG_RIVAL, 0
	applymovement 10, Movement_1A75DB
	waitmovement 0
	applymovement 10, Movement_1A75DD
	waitmovement 0
	delay 25
	applymovement 10, Movement_167D49
	waitmovement 0
	loadword 0, gUnknown_8182B37
	callstd 4
	closemessage
	applymovement 255, Movement_167D52
	applymovement 10, Movement_167D4E
	waitmovement 0
	fadedefaultbgm
	playse SE_KAIDAN
	delay 35
	removeobject 10
	setvar VAR_0x4086, 1
	releaseall
	end

Movement_167D49:: @ 8167D49
	step_13
	step_13
	step_10
	step_10
	step_end

Movement_167D4E:: @ 8167D4E
	step_1c
	step_1a
	step_10
	step_end

Movement_167D52:: @ 8167D52
	step_12
	step_30
	step_end

FourIsland_EventScript_167D55:: @ 8167D55
	special sub_8110AB4
	compare_var_to_value VAR_RESULT, 2
	goto_if 1, EventScript_1A7AE0
	special sub_8112364
	lock
	faceplayer
	special GetDaycareMonNicknames
	specialvar VAR_RESULT, GetDaycareState
	compare_var_to_value VAR_RESULT, 1
	goto_if 1, EventScript_167D9B
	compare_var_to_value VAR_RESULT, 2
	goto_if 1, EventScript_167E0C
	compare_var_to_value VAR_RESULT, 3
	goto_if 1, EventScript_167E19
	loadword 0, gUnknown_81BF555
	callstd 4
	release
	end

EventScript_167D9B:: @ 8167D9B
	loadword 0, gUnknown_81BF5E3
	callstd 5
	compare_var_to_value VAR_RESULT, 1
	goto_if 1, EventScript_167DD1
	loadword 0, gUnknown_81BF7B6
	callstd 5
	compare_var_to_value VAR_RESULT, 1
	goto_if 1, EventScript_167DD1
	loadword 0, gUnknown_81BF6CF
	callstd 4
	clearflag FLAG_PENDING_DAYCARE_EGG
	special RejectEggFromDayCare
	release
	end

EventScript_167DD1:: @ 8167DD1
	specialvar VAR_RESULT, CalculatePlayerPartyCount
	compare_var_to_value VAR_RESULT, 6
	goto_if 5, EventScript_167DEB
	loadword 0, gUnknown_81BF6F0
	callstd 4
	release
	end

EventScript_167DEB:: @ 8167DEB
	textcolor 3
	message Text_1BF72A
	call EventScript_1A6675
	playfanfare MUS_FANFA1
	waitfanfare
	waitbuttonpress
	loadword 0, gUnknown_81BF755
	callstd 4
	special GiveEggFromDaycare
	clearflag FLAG_PENDING_DAYCARE_EGG
	release
	end

EventScript_167E0C:: @ 8167E0C
	special GetDaycareMonNicknames
	loadword 0, gUnknown_81BF69A
	callstd 4
	release
	end

EventScript_167E19:: @ 8167E19
	special GetDaycareMonNicknames
	loadword 0, gUnknown_81BF789
	callstd 4
	special SetDaycareCompatibilityString
	special sub_80CA68C
	waitmessage
	waitbuttonpress
	release
	end

FourIsland_EventScript_167E2E:: @ 8167E2E
	lock
	faceplayer
	checkflag 2116
	goto_if 1, EventScript_167E43
	loadword 0, gUnknown_8182A2B
	callstd 4
	release
	end

EventScript_167E43:: @ 8167E43
	setvar VAR_0x8004, 9
	setvar VAR_0x8005, 5
	special SetFlavorTextFlagFromSpecialVars
	loadword 0, gUnknown_8182A75
	callstd 4
	release
	end

FourIsland_EventScript_167E5A:: @ 8167E5A
	lock
	faceplayer
	setvar VAR_0x8004, 9
	setvar VAR_0x8005, 4
	special SetFlavorTextFlagFromSpecialVars
	loadword 0, gUnknown_8182CE3
	callstd 4
	release
	end

FourIsland_EventScript_167E73:: @ 8167E73
	loadword 0, gUnknown_8182D8E
	callstd 2
	end

FourIsland_EventScript_167E7C:: @ 8167E7C
	loadword 0, gUnknown_8182A03
	callstd 3
	end

FourIsland_EventScript_167E85:: @ 8167E85
	loadword 0, gUnknown_8182DEB
	callstd 3
	end
