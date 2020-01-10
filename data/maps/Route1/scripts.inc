Route1_MapScripts:: @ 8167EFD
	.byte 0

Route1_EventScript_167EFE:: @ 8167EFE
	lock
	faceplayer
	goto_if_set FLAG_GOT_POTION_ON_ROUTE_1, EventScript_167F48
	msgbox gUnknown_818329D
	textcolor 3
	checkitemspace ITEM_POTION, 1
	compare VAR_RESULT, 0
	goto_if_eq EventScript_1A6BF9
	getitemname 1, ITEM_POTION
	playfanfare MUS_FANFA1
	message Text_ObtainedTheX
	waitmessage
	waitfanfare
	additem ITEM_POTION
	msgbox gUnknown_8183387
	call EventScript_1A6675
	setflag FLAG_GOT_POTION_ON_ROUTE_1
	release
	end

EventScript_167F48:: @ 8167F48
	msgbox gUnknown_8183347
	release
	end

Route1_EventScript_167F52:: @ 8167F52
	msgbox gUnknown_81833B9, 2
	end

Route1_EventScript_167F5B:: @ 8167F5B
	msgbox gUnknown_818343A, 3
	end
