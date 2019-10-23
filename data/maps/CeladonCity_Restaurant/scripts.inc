CeladonCity_Restaurant_MapScripts:: @ 816D1EA
	.byte 0

CeladonCity_Restaurant_EventScript_16D1EB:: @ 816D1EB
	msgbox gUnknown_81978E6, 2
	end

CeladonCity_Restaurant_EventScript_16D1F4:: @ 816D1F4
	msgbox gUnknown_8197915, 2
	end

CeladonCity_Restaurant_EventScript_16D1FD:: @ 816D1FD
	lock
	faceplayer
	checkflag FLAG_GOT_COIN_CASE
	goto_if TRUE, EventScript_16D24B
	msgbox gUnknown_81979C1
	checkitemspace ITEM_COIN_CASE, 1
	compare_var_to_value VAR_RESULT, 0
	goto_if eq, EventScript_16D241
	additem ITEM_COIN_CASE, 1
	giveitemfanfaremsg gUnknown_8197A38, ITEM_COIN_CASE
	setflag FLAG_GOT_COIN_CASE
	release
	end

EventScript_16D241:: @ 816D241
	msgbox gUnknown_8197A5E
	release
	end

EventScript_16D24B:: @ 816D24B
	msgbox gUnknown_8197A72
	release
	end

CeladonCity_Restaurant_EventScript_16D255:: @ 816D255
	msgbox gUnknown_8197952, 2
	end

CeladonCity_Restaurant_EventScript_16D25E:: @ 816D25E
	msgbox gUnknown_819798A, 2
	end
