TwoIsland_Harbor_MapScripts:: @ 8171805
	.byte 0

TwoIsland_Harbor_EventScript_171806:: @ 8171806
	lock
	faceplayer
	message Text_181726
	waitmessage
	setvar VAR_0x8004, SEAGALLOP_TWO_ISLAND
	goto EventScript_1A8F54
	end
