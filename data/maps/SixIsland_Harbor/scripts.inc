SixIsland_Harbor_MapScripts:: @ 8171E47
	.byte 0

SixIsland_Harbor_EventScript_Sailor:: @ 8171E48
	lock
	faceplayer
	message Text_WhereDoYouWantToSail
	waitmessage
	setvar VAR_0x8004, SEAGALLOP_SIX_ISLAND
	goto EventScript_ChooseDestFromIsland
	end
