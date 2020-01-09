EventScript_1A737B:: @ 81A737B
	special sub_8110AB4
	compare VAR_RESULT, 2
	goto_if eq, EventScript_1A7AE0
	special sub_8112364
	checkflag FLAG_OAK_SAW_DEX_COMPLETION
	call_if TRUE, EventScript_1A73A4
	checkflag FLAG_OAK_SAW_DEX_COMPLETION
	call_if FALSE, EventScript_1A73AD
	call EventScript_1A73E0
	return

EventScript_1A73A4:: @ 81A73A4
	msgbox Text_1A72F2
	return

EventScript_1A73AD:: @ 81A73AD
	msgbox gUnknown_81A6C51
	return

EventScript_1A73B6:: @ 81A73B6
	copyvar VAR_0x8004, VAR_0x8009
	special Special_GetProfOaksRatingMessage
	waitmessage
	compare VAR_RESULT, 0
	call_if eq, EventScript_1A73D8
	compare VAR_RESULT, 1
	call_if eq, EventScript_1A73DC
	waitfanfare
	waitbuttonpress
	return

EventScript_1A73D8:: @ 81A73D8
	playfanfare MUS_FAN2
	return

EventScript_1A73DC:: @ 81A73DC
	playfanfare MUS_FANFA5
	return

EventScript_1A73E0:: @ 81A73E0
	setvar VAR_0x8004, 31
	special HelpSystem_BackupSomeVariable
	special Special_SetSomeVariable
	setvar VAR_0x8004, 0
	specialvar VAR_RESULT, Special_GetPokedexCount
	copyvar VAR_0x8008, VAR_0x8005
	copyvar VAR_0x8009, VAR_0x8006
	copyvar VAR_0x800A, VAR_RESULT
	getnumberstring 0, VAR_0x8008
	getnumberstring 1, VAR_0x8009
	msgbox Text_1A6CA3
	checkflag FLAG_OAKS_RATING_IS_VIA_PC
	call_if FALSE, EventScript_1A746D
	call EventScript_1A73B6
	compare VAR_0x800A, 0
	goto_if eq, EventScript_1A748F
	setvar VAR_0x8004, 1
	specialvar VAR_RESULT, Special_GetPokedexCount
	copyvar VAR_0x8008, VAR_0x8005
	copyvar VAR_0x8009, VAR_0x8006
	getnumberstring 0, VAR_0x8008
	getnumberstring 1, VAR_0x8009
	msgbox Text_1A71AA
	specialvar VAR_RESULT, HasAllMons
	compare VAR_RESULT, 0
	goto_if eq, EventScript_1A7470
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1A747E
	end

EventScript_1A746D:: @ 81A746D
	textcolor 0
	return

EventScript_1A7470:: @ 81A7470
	msgbox Text_1A71EE
	goto EventScript_1A748F
	end

EventScript_1A747E:: @ 81A747E
	setflag FLAG_OAK_SAW_DEX_COMPLETION
	msgbox Text_1A722F
	goto EventScript_1A748F
	end

EventScript_1A748F:: @ 81A748F
	special HelpSystem_RestoreSomeVariable
	return
