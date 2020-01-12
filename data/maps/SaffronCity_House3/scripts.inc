SaffronCity_House3_MapScripts:: @ 816F05E
	.byte 0

SaffronCity_House3_EventScript_16F05F:: @ 816F05F
	lock
	faceplayer
	goto_if_set FLAG_GOT_TM29_FROM_MR_PSYCHIC, EventScript_16F0B5
	msgbox gUnknown_819C142
	checkitemspace ITEM_TM29, 1
	compare VAR_RESULT, FALSE
	goto_if_eq EventScript_16F0AB
	giveitem_msg gUnknown_819C16C, ITEM_TM29
	msgbox gUnknown_819C18F
	setflag FLAG_GOT_TM29_FROM_MR_PSYCHIC
	release
	end

EventScript_16F0AB:: @ 816F0AB
	msgbox gUnknown_819C1FC
	release
	end

EventScript_16F0B5:: @ 816F0B5
	msgbox gUnknown_819C18F
	release
	end
