# 1 "data/maps/SixIsland_Harbor/scripts.pory"

# 2 "data/maps/SixIsland_Harbor/scripts.pory"
SixIsland_Harbor_MapScripts::
# 3 "data/maps/SixIsland_Harbor/scripts.pory"
	.byte 0
# 4 "data/maps/SixIsland_Harbor/scripts.pory"

# 5 "data/maps/SixIsland_Harbor/scripts.pory"
SixIsland_Harbor_EventScript_Sailor::
# 6 "data/maps/SixIsland_Harbor/scripts.pory"
	lock
# 7 "data/maps/SixIsland_Harbor/scripts.pory"
	faceplayer
# 8 "data/maps/SixIsland_Harbor/scripts.pory"
	message Text_WhereDoYouWantToSail
# 9 "data/maps/SixIsland_Harbor/scripts.pory"
	waitmessage
# 10 "data/maps/SixIsland_Harbor/scripts.pory"
	setvar VAR_0x8004, SEAGALLOP_SIX_ISLAND
# 11 "data/maps/SixIsland_Harbor/scripts.pory"
	goto EventScript_ChooseDestFromIsland
# 12 "data/maps/SixIsland_Harbor/scripts.pory"
	end
