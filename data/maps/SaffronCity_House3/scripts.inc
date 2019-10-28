SaffronCity_House3_MapScripts:: @ 816F05E
	.byte 0

SaffronCity_House3_EventScript_16F05F:: @ 816F05F
	lock
	faceplayer
	checkflag FLAG_GOT_TM29_FROM_MR_PSYCHIC
	goto_if TRUE, EventScript_16F0B5
	msgbox gUnknown_819C142
	checkitemspace ITEM_TM29, 1
	compare_var_to_value VAR_RESULT, 0
	goto_if eq, EventScript_16F0AB
	additem ITEM_TM29, 1
	giveitemfanfaremsg gUnknown_819C16C, ITEM_TM29
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
