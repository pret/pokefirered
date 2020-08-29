Route1_MapScripts:: @ 8167EFD
	.byte 0

Route1_EventScript_MartClerk:: @ 8167EFE
	lock
	faceplayer
	goto_if_set FLAG_GOT_POTION_ON_ROUTE_1, Route1_EventScript_AlreadyGotPotion
	msgbox Route1_Text_WorkAtPokeMartTakeSample
	textcolor 3
	checkitemspace ITEM_POTION, 1
	compare VAR_RESULT, FALSE
	goto_if_eq EventScript_BagIsFull
	getitemname 1, ITEM_POTION
	playfanfare MUS_LEVEL_UP
	message Text_ObtainedTheX
	waitmessage
	waitfanfare
	additem ITEM_POTION
	msgbox Route1_Text_PutPotionAway
	call EventScript_RestorePrevTextColor
	setflag FLAG_GOT_POTION_ON_ROUTE_1
	release
	end

Route1_EventScript_AlreadyGotPotion:: @ 8167F48
	msgbox Route1_Text_ComeSeeUsIfYouNeedPokeBalls
	release
	end

Route1_EventScript_Boy:: @ 8167F52
	msgbox Route1_Text_CanJumpFromLedges, MSGBOX_NPC
	end

Route1_EventScript_RouteSign:: @ 8167F5B
	msgbox Route1_Text_RouteSign, MSGBOX_SIGN
	end
