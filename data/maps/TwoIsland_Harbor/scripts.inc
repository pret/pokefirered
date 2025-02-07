# 1 "data/maps/TwoIsland_Harbor/scripts.pory"

# 2 "data/maps/TwoIsland_Harbor/scripts.pory"
TwoIsland_Harbor_MapScripts::
# 3 "data/maps/TwoIsland_Harbor/scripts.pory"
	.byte 0
# 4 "data/maps/TwoIsland_Harbor/scripts.pory"

# 5 "data/maps/TwoIsland_Harbor/scripts.pory"
TwoIsland_Harbor_EventScript_Sailor::
# 6 "data/maps/TwoIsland_Harbor/scripts.pory"
	lock
# 7 "data/maps/TwoIsland_Harbor/scripts.pory"
	faceplayer
# 8 "data/maps/TwoIsland_Harbor/scripts.pory"
	message Text_WhereDoYouWantToSail
# 9 "data/maps/TwoIsland_Harbor/scripts.pory"
	waitmessage
# 10 "data/maps/TwoIsland_Harbor/scripts.pory"
	setvar VAR_0x8004, SEAGALLOP_TWO_ISLAND
# 11 "data/maps/TwoIsland_Harbor/scripts.pory"
	goto EventScript_ChooseDestFromTwoIsland
# 12 "data/maps/TwoIsland_Harbor/scripts.pory"
	end
