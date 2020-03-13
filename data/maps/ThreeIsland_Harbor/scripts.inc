ThreeIsland_Harbor_MapScripts:: @ 8171EA9
	.byte 0

ThreeIsland_Harbor_EventScript_Sailor:: @ 8171EAA
	lock
	faceplayer
	message Text_WhereDoYouWantToSail
	waitmessage
	setvar VAR_0x8004, SEAGALLOP_THREE_ISLAND
	goto EventScript_ChooseDestFromIsland
	end
