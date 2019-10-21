VermilionCity_House2_MapScripts:: @ 816B5D6
	.byte 0

VermilionCity_House2_EventScript_16B5D7:: @ 816B5D7
	lock
	faceplayer
	setvar VAR_0x8008, 3
	call EventScript_1A8CAD
	checkflag FLAG_DID_CH_DING_TRADE
	goto_if TRUE, EventScript_16B649
	msgbox gUnknown_81949CB, MSGBOX_YESNO
	compare_var_to_value VAR_RESULT, 0
	goto_if eq, EventScript_16B631
	call EventScript_1A8CBD
	compare_var_to_value VAR_0x8004, 6
	goto_if ge, EventScript_16B631
	call EventScript_1A8CC9
	compare_var_to_var VAR_RESULT, VAR_0x8009
	goto_if ne, EventScript_16B63B
	call EventScript_1A8CD9
	msgbox gUnknown_8194A44
	setflag FLAG_DID_CH_DING_TRADE
	release
	end

EventScript_16B631:: @ 816B631
	msgbox gUnknown_81949FD
	release
	end

EventScript_16B63B:: @ 816B63B
	getspeciesname 0, VAR_0x8009
	msgbox gUnknown_8194A0D
	release
	end

EventScript_16B649:: @ 816B649
	msgbox gUnknown_8194A4F
	release
	end
