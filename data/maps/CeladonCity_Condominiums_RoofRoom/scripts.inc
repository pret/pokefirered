CeladonCity_Condominiums_RoofRoom_MapScripts:: @ 816C463
	.byte 0

CeladonCity_Condominiums_RoofRoom_EventScript_16C464:: @ 816C464
	msgbox gUnknown_81964D7, 2
	end

CeladonCity_Condominiums_RoofRoom_EventScript_16C46D:: @ 816C46D
	lock
	faceplayer
	setvar VAR_0x4001, SPECIES_EEVEE
	givemon SPECIES_EEVEE, 25, ITEM_NONE, 0, 0, 0
	compare_var_to_value VAR_RESULT, 0
	goto_if 1, EventScript_16C4A6
	compare_var_to_value VAR_RESULT, 1
	goto_if 1, EventScript_16C4DA
	compare_var_to_value VAR_RESULT, 2
	goto_if 1, EventScript_1A927C
	release
	end

EventScript_16C4A6:: @ 816C4A6
	removeobject 2
	playfanfare MUS_FANFA1
	message Text_196591
	waitmessage
	waitfanfare
	getspeciesname 0, SPECIES_EEVEE
	msgbox gUnknown_81A56A7, MSGBOX_YESNO
	compare_var_to_value VAR_RESULT, 0
	goto_if 1, EventScript_16C514
	call EventScript_1A8C27
	call EventScript_1A74EB
	goto EventScript_16C514
	end

EventScript_16C4DA:: @ 816C4DA
	removeobject 2
	playfanfare MUS_FANFA1
	message Text_196591
	waitmessage
	waitfanfare
	getspeciesname 0, SPECIES_EEVEE
	msgbox gUnknown_81A56A7, MSGBOX_YESNO
	compare_var_to_value VAR_RESULT, 0
	goto_if 1, EventScript_16C509
	call EventScript_1A8C33
	goto EventScript_16C509
	end

EventScript_16C509:: @ 816C509
	call EventScript_1A8C3C
	goto EventScript_16C514
	end

EventScript_16C514:: @ 816C514
	setflag FLAG_0x263
	release
	end

CeladonCity_Condominiums_RoofRoom_EventScript_16C519:: @ 816C519
	msgbox gUnknown_81967E3, 3
	end

CeladonCity_Condominiums_RoofRoom_EventScript_16C522:: @ 816C522
	lockall
	msgbox gUnknown_81965C2
	message Text_1965F4
	waitmessage
	setvar VAR_0x8004, 4
	multichoice 0, 0, 43, 0
	copyvar VAR_0x8000, VAR_RESULT
	compare_var_to_value VAR_0x8000, 0
	goto_if 1, EventScript_16C5C0
	compare_var_to_value VAR_0x8000, 1
	goto_if 1, EventScript_16C5CE
	compare_var_to_value VAR_0x8000, 2
	goto_if 1, EventScript_16C5DC
	compare_var_to_value VAR_0x8000, 3
	goto_if 1, EventScript_16C5EA
	compare_var_to_value VAR_0x8000, 127
	goto_if 1, EventScript_16C5EA
	end

EventScript_16C578:: @ 816C578
	message Text_1965F4
	waitmessage
	multichoice 0, 0, 43, 0
	copyvar VAR_0x8000, VAR_RESULT
	compare_var_to_value VAR_0x8000, 0
	goto_if 1, EventScript_16C5C0
	compare_var_to_value VAR_0x8000, 1
	goto_if 1, EventScript_16C5CE
	compare_var_to_value VAR_0x8000, 2
	goto_if 1, EventScript_16C5DC
	compare_var_to_value VAR_0x8000, 3
	goto_if 1, EventScript_16C5EA
	compare_var_to_value VAR_0x8000, 127
	goto_if 1, EventScript_16C5EA
	end

EventScript_16C5C0:: @ 816C5C0
	msgbox gUnknown_8196617
	goto EventScript_16C578
	end

EventScript_16C5CE:: @ 816C5CE
	msgbox gUnknown_8196695
	goto EventScript_16C578
	end

EventScript_16C5DC:: @ 816C5DC
	msgbox gUnknown_819673C
	goto EventScript_16C578
	end

EventScript_16C5EA:: @ 816C5EA
	releaseall
	end
