# 1 "data/maps/NavelRock_Harbor/scripts.pory"

# 2 "data/maps/NavelRock_Harbor/scripts.pory"
NavelRock_Harbor_MapScripts::
# 3 "data/maps/NavelRock_Harbor/scripts.pory"
	.byte 0
# 4 "data/maps/NavelRock_Harbor/scripts.pory"

# 5 "data/maps/NavelRock_Harbor/scripts.pory"
NavelRock_Harbor_EventScript_Sailor::
# 6 "data/maps/NavelRock_Harbor/scripts.pory"
	lock
# 7 "data/maps/NavelRock_Harbor/scripts.pory"
	faceplayer
# 8 "data/maps/NavelRock_Harbor/scripts.pory"
	message Text_WhereDoYouWantToSail
# 9 "data/maps/NavelRock_Harbor/scripts.pory"
	waitmessage
# 10 "data/maps/NavelRock_Harbor/scripts.pory"
	setvar VAR_0x8004, SEAGALLOP_NAVEL_ROCK
# 11 "data/maps/NavelRock_Harbor/scripts.pory"
	multichoice 20, 8, MULTICHOICE_SEAGALLOP_VERMILION, FALSE
# 12 "data/maps/NavelRock_Harbor/scripts.pory"
	switch VAR_RESULT
# 13 "data/maps/NavelRock_Harbor/scripts.pory"
	case 0, EventScript_SailToVermilionCity
# 14 "data/maps/NavelRock_Harbor/scripts.pory"
	case 1, EventScript_CancelSail
# 15 "data/maps/NavelRock_Harbor/scripts.pory"
	case 127, EventScript_CancelSail
# 16 "data/maps/NavelRock_Harbor/scripts.pory"
	end
