FiveIsland_Harbor_MapScripts:: @ 8171D42
	.byte 0

FiveIsland_Harbor_EventScript_Sailor:: @ 8171D43
	lock
	faceplayer
	message Text_WhereDoYouWantToSail
	waitmessage
	setvar VAR_0x8004, SEAGALLOP_FIVE_ISLAND
	goto EventScript_ChooseDestFromIsland
	end
