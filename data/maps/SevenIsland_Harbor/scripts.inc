SevenIsland_Harbor_MapScripts:: @ 8170BE4
	.byte 0

SevenIsland_Harbor_EventScript_Sailor:: @ 8170BE5
	lock
	faceplayer
	message Text_WhereDoYouWantToSail
	waitmessage
	setvar VAR_0x8004, SEAGALLOP_SEVEN_ISLAND
	goto EventScript_ChooseDestFromIsland
	end
