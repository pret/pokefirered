CeladonCity_Condominiums_3F_MapScripts:: @ 816C3DA
	.byte 0

CeladonCity_Condominiums_3F_EventScript_16C3DB:: @ 816C3DB
	msgbox gUnknown_81962BF, 2
	end

CeladonCity_Condominiums_3F_EventScript_16C3E4:: @ 816C3E4
	msgbox gUnknown_81962D7, 2
	end

CeladonCity_Condominiums_3F_EventScript_16C3ED:: @ 816C3ED
	msgbox gUnknown_81962FB, 2
	end

CeladonCity_Condominiums_3F_EventScript_16C3F6:: @ 816C3F6
	lock
	faceplayer
	specialvar VAR_RESULT, sub_8088F58
	compare_var_to_value VAR_RESULT, 1
	goto_if 1, EventScript_16C412
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
	special sub_8110AB4
	compare_var_to_value VAR_RESULT, 2
	goto_if 1, EventScript_1A7AE0
	special sub_80CA618
	waitstate
	release
	end

CeladonCity_Condominiums_3F_EventScript_16C435:: @ 816C435
	msgbox gUnknown_81964A8, 3
	end

CeladonCity_Condominiums_3F_EventScript_16C43E:: @ 816C43E
	msgbox gUnknown_819640C, 3
	end

CeladonCity_Condominiums_3F_EventScript_16C447:: @ 816C447
	msgbox gUnknown_819644B, 3
	end

CeladonCity_Condominiums_3F_EventScript_16C450:: @ 816C450
	msgbox gUnknown_8196478, 3
	end
