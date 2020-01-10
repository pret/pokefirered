SafariZone_SecretHouse_MapScripts:: @ 8162452
	.byte 0

SafariZone_SecretHouse_EventScript_162453:: @ 8162453
	lock
	faceplayer
	goto_if_set FLAG_GOT_HM03, EventScript_1624A9
	msgbox gUnknown_8177DC1
	checkitemspace ITEM_HM03, 1
	compare VAR_RESULT, FALSE
	goto_if_eq EventScript_16249F
	giveitem_msg gUnknown_8177E92, ITEM_HM03
	msgbox gUnknown_8177EB7
	setflag FLAG_GOT_HM03
	release
	end

EventScript_16249F:: @ 816249F
	msgbox gUnknown_8177F72
	release
	end

EventScript_1624A9:: @ 81624A9
	msgbox gUnknown_8177EB7
	release
	end
