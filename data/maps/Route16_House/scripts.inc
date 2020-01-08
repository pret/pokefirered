Route16_House_MapScripts:: @ 817014E
	.byte 0

Route16_House_EventScript_17014F:: @ 817014F
	lock
	faceplayer
	checkflag FLAG_GOT_HM02
	goto_if TRUE, EventScript_1701A5
	msgbox gUnknown_819F851
	checkitemspace ITEM_HM02, 1
	compare VAR_RESULT, 0
	goto_if eq, EventScript_17019B
	additem ITEM_HM02, 1
	giveitemfanfaremsg gUnknown_819F8C0, ITEM_HM02
	msgbox gUnknown_819F8E0
	setflag FLAG_GOT_HM02
	release
	end

EventScript_17019B:: @ 817019B
	msgbox gUnknown_819F92D
	release
	end

EventScript_1701A5:: @ 81701A5
	msgbox gUnknown_819F8E0
	release
	end

Route16_House_EventScript_1701AF:: @ 81701AF
	lock
	faceplayer
	waitse
	playmoncry SPECIES_FEAROW, 0
	msgbox gUnknown_819F94F
	waitmoncry
	release
	end
