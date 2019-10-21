BirthIsland_Harbor_MapScripts:: @ 81653E6
	.byte 0

BirthIsland_Harbor_EventScript_1653E7:: @ 81653E7
	lock
	faceplayer
	message Text_181726
	waitmessage
	setvar VAR_0x8004, SEAGALLOP_BIRTH_ISLAND
	multichoice 20, 8, 61, 0
	switch VAR_RESULT
	case 0, EventScript_1A91D5
	case 1, EventScript_1A90F6
	case 127, EventScript_1A90F6
	end
