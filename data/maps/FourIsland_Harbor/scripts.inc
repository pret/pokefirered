FourIsland_Harbor_MapScripts:: @ 8171C98
	.byte 0

FourIsland_Harbor_EventScript_Sailor:: @ 8171C99
	lock
	faceplayer
	message Text_WhereDoYouWantToSail
	waitmessage
	setvar VAR_0x8004, SEAGALLOP_FOUR_ISLAND
	goto EventScript_ChooseDestFromIsland
	end
