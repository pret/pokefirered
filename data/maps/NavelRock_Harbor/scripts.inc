
NavelRock_Harbor_MapScripts:: @ 8165420
	.byte 0

NavelRock_Harbor_EventScript_165421:: @ 8165421
	lock
	faceplayer
	message Text_181726
	waitmessage
	setvar VAR_0x8004, SEAGALLOP_NAVEL_ROCK
	multichoice 20, 8, MULTICHOICE_SEAGALLOP_VERMILION, FALSE
	switch VAR_RESULT
	case 0, EventScript_1A91D5
	case 1, EventScript_1A90F6
	case 127, EventScript_1A90F6
	end
