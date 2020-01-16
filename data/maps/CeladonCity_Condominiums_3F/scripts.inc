CeladonCity_Condominiums_3F_MapScripts:: @ 816C3DA
	.byte 0

CeladonCity_Condominiums_3F_EventScript_16C3DB:: @ 816C3DB
	msgbox gUnknown_81962BF, MSGBOX_NPC
	end

CeladonCity_Condominiums_3F_EventScript_16C3E4:: @ 816C3E4
	msgbox gUnknown_81962D7, MSGBOX_NPC
	end

CeladonCity_Condominiums_3F_EventScript_16C3ED:: @ 816C3ED
	msgbox gUnknown_81962FB, MSGBOX_NPC
	end

CeladonCity_Condominiums_3F_EventScript_16C3F6:: @ 816C3F6
	lock
	faceplayer
	specialvar VAR_RESULT, HasAllKantoMons
	compare VAR_RESULT, 1
	goto_if_eq EventScript_16C412
	msgbox gUnknown_8196356
	release
	end

EventScript_16C412:: @ 816C412
	goto EventScript_16C418
	end

EventScript_16C418:: @ 816C418
	message Text_1963CD
	waitmessage
	delay 60
	goto_if_questlog EventScript_ReleaseEnd
	special Special_ShowDiploma
	waitstate
	release
	end

CeladonCity_Condominiums_3F_EventScript_16C435:: @ 816C435
	msgbox gUnknown_81964A8, MSGBOX_SIGN
	end

CeladonCity_Condominiums_3F_EventScript_16C43E:: @ 816C43E
	msgbox gUnknown_819640C, MSGBOX_SIGN
	end

CeladonCity_Condominiums_3F_EventScript_16C447:: @ 816C447
	msgbox gUnknown_819644B, MSGBOX_SIGN
	end

CeladonCity_Condominiums_3F_EventScript_16C450:: @ 816C450
	msgbox gUnknown_8196478, MSGBOX_SIGN
	end
