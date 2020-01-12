FourIsland_Harbor_MapScripts:: @ 8171C98
	.byte 0

FourIsland_Harbor_EventScript_171C99:: @ 8171C99
	lock
	faceplayer
	message Text_WhereDoYouWantToSail
	waitmessage
	setvar VAR_0x8004, SEAGALLOP_FOUR_ISLAND
	goto EventScript_1A900F
	end
