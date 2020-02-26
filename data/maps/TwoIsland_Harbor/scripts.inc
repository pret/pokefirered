TwoIsland_Harbor_MapScripts:: @ 8171805
	.byte 0

TwoIsland_Harbor_EventScript_Sailor:: @ 8171806
	lock
	faceplayer
	message Text_WhereDoYouWantToSail
	waitmessage
	setvar VAR_0x8004, SEAGALLOP_TWO_ISLAND
	goto EventScript_ChooseDestFromTwoIsland
	end
