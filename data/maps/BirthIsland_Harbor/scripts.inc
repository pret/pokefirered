BirthIsland_Harbor_MapScripts:: @ 81653E6
	.byte 0

BirthIsland_Harbor_EventScript_1653E7:: @ 81653E7
	lock
	faceplayer
	message Text_181726
	waitmessage
	setvar VAR_0x8004, 10
	multichoice 20, 8, 61, 0
	switch VAR_RESULT
	case 0, EventScript_1A91D5
	case 1, EventScript_1A90F6
	case 127, EventScript_1A90F6
	end

NavelRock_Harbor_MapScripts:: @ 8165420
	.byte 0

NavelRock_Harbor_EventScript_165421:: @ 8165421
	lock
	faceplayer
	message Text_181726
	waitmessage
	setvar VAR_0x8004, 9
	multichoice 20, 8, 61, 0
	switch VAR_RESULT
	case 0, EventScript_1A91D5
	case 1, EventScript_1A90F6
	case 127, EventScript_1A90F6
	end
