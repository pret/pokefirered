# 1 "data/maps/LavenderTown_House1/scripts.pory"

# 2 "data/maps/LavenderTown_House1/scripts.pory"
LavenderTown_House1_MapScripts::
# 3 "data/maps/LavenderTown_House1/scripts.pory"
	.byte 0
# 4 "data/maps/LavenderTown_House1/scripts.pory"

# 5 "data/maps/LavenderTown_House1/scripts.pory"
LavenderTown_House1_EventScript_CooltrainerF::
# 6 "data/maps/LavenderTown_House1/scripts.pory"
	lock
# 7 "data/maps/LavenderTown_House1/scripts.pory"
	faceplayer
# 8 "data/maps/LavenderTown_House1/scripts.pory"
	goto_if_set FLAG_RESCUED_MR_FUJI, LavenderTown_House1_EventScript_CooltrainerFGhostGone
# 9 "data/maps/LavenderTown_House1/scripts.pory"
	msgbox LavenderTown_House1_Text_RocketsKilledCubonesMother
# 10 "data/maps/LavenderTown_House1/scripts.pory"
	release
# 11 "data/maps/LavenderTown_House1/scripts.pory"
	end
# 12 "data/maps/LavenderTown_House1/scripts.pory"

# 13 "data/maps/LavenderTown_House1/scripts.pory"
LavenderTown_House1_EventScript_CooltrainerFGhostGone::
# 14 "data/maps/LavenderTown_House1/scripts.pory"
	msgbox LavenderTown_House1_Text_GhostOfPokemonTowerIsGone
# 15 "data/maps/LavenderTown_House1/scripts.pory"
	release
# 16 "data/maps/LavenderTown_House1/scripts.pory"
	end
# 17 "data/maps/LavenderTown_House1/scripts.pory"

# 18 "data/maps/LavenderTown_House1/scripts.pory"
LavenderTown_House1_EventScript_Cubone::
# 19 "data/maps/LavenderTown_House1/scripts.pory"
	lock
# 20 "data/maps/LavenderTown_House1/scripts.pory"
	faceplayer
# 21 "data/maps/LavenderTown_House1/scripts.pory"
	waitse
# 22 "data/maps/LavenderTown_House1/scripts.pory"
	playmoncry SPECIES_CUBONE, CRY_MODE_NORMAL
# 23 "data/maps/LavenderTown_House1/scripts.pory"
	msgbox LavenderTown_House1_Text_Cubone
# 24 "data/maps/LavenderTown_House1/scripts.pory"
	waitmoncry
# 25 "data/maps/LavenderTown_House1/scripts.pory"
	release
# 26 "data/maps/LavenderTown_House1/scripts.pory"
	end
