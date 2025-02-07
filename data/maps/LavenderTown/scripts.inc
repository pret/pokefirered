# 1 "data/maps/LavenderTown/scripts.pory"

# 2 "data/maps/LavenderTown/scripts.pory"
LavenderTown_MapScripts::
# 3 "data/maps/LavenderTown/scripts.pory"
	map_script MAP_SCRIPT_ON_TRANSITION, LavenderTown_OnTransition
# 4 "data/maps/LavenderTown/scripts.pory"
	.byte 0
# 5 "data/maps/LavenderTown/scripts.pory"

# 6 "data/maps/LavenderTown/scripts.pory"
LavenderTown_OnTransition::
# 7 "data/maps/LavenderTown/scripts.pory"
	setworldmapflag FLAG_WORLD_MAP_LAVENDER_TOWN
# 8 "data/maps/LavenderTown/scripts.pory"
	setvar VAR_MAP_SCENE_S_S_ANNE_2F_CORRIDOR, 1
# 9 "data/maps/LavenderTown/scripts.pory"
	setflag FLAG_HIDE_SS_ANNE_RIVAL
# 10 "data/maps/LavenderTown/scripts.pory"
	end
# 11 "data/maps/LavenderTown/scripts.pory"

# 12 "data/maps/LavenderTown/scripts.pory"
LavenderTown_EventScript_LittleGirl::
# 13 "data/maps/LavenderTown/scripts.pory"
	lock
# 14 "data/maps/LavenderTown/scripts.pory"
	faceplayer
# 15 "data/maps/LavenderTown/scripts.pory"
	msgbox LavenderTown_Text_DoYouBelieveInGhosts, MSGBOX_YESNO
# 16 "data/maps/LavenderTown/scripts.pory"
	goto_if_eq VAR_RESULT, YES, LavenderTown_EventScript_LittleGirlBelieve
# 17 "data/maps/LavenderTown/scripts.pory"
	msgbox LavenderTown_Text_JustImaginingWhiteHand
# 18 "data/maps/LavenderTown/scripts.pory"
	release
# 19 "data/maps/LavenderTown/scripts.pory"
	end
# 20 "data/maps/LavenderTown/scripts.pory"

# 21 "data/maps/LavenderTown/scripts.pory"
LavenderTown_EventScript_LittleGirlBelieve::
# 22 "data/maps/LavenderTown/scripts.pory"
	msgbox LavenderTown_Text_SoThereAreBelievers
# 23 "data/maps/LavenderTown/scripts.pory"
	release
# 24 "data/maps/LavenderTown/scripts.pory"
	end
# 25 "data/maps/LavenderTown/scripts.pory"

# 26 "data/maps/LavenderTown/scripts.pory"
LavenderTown_EventScript_WorkerM::
# 27 "data/maps/LavenderTown/scripts.pory"
	msgbox LavenderTown_Text_TownKnownAsMonGraveSite, MSGBOX_NPC
# 28 "data/maps/LavenderTown/scripts.pory"
	end
# 29 "data/maps/LavenderTown/scripts.pory"

# 30 "data/maps/LavenderTown/scripts.pory"
LavenderTown_EventScript_Boy::
# 31 "data/maps/LavenderTown/scripts.pory"
	msgbox LavenderTown_Text_GhostsAppearedInTower, MSGBOX_NPC
# 32 "data/maps/LavenderTown/scripts.pory"
	end
# 33 "data/maps/LavenderTown/scripts.pory"

# 34 "data/maps/LavenderTown/scripts.pory"
LavenderTown_EventScript_TownSign::
# 35 "data/maps/LavenderTown/scripts.pory"
	msgbox LavenderTown_Text_TownSign, MSGBOX_SIGN
# 36 "data/maps/LavenderTown/scripts.pory"
	end
# 37 "data/maps/LavenderTown/scripts.pory"

# 38 "data/maps/LavenderTown/scripts.pory"
LavenderTown_EventScript_SilphScopeNotice::
# 39 "data/maps/LavenderTown/scripts.pory"
	msgbox LavenderTown_Text_SilphScopeNotice, MSGBOX_SIGN
# 40 "data/maps/LavenderTown/scripts.pory"
	end
# 41 "data/maps/LavenderTown/scripts.pory"

# 42 "data/maps/LavenderTown/scripts.pory"
LavenderTown_EventScript_VolunteerHouseSign::
# 43 "data/maps/LavenderTown/scripts.pory"
	msgbox LavenderTown_Text_VolunteerPokemonHouse, MSGBOX_SIGN
# 44 "data/maps/LavenderTown/scripts.pory"
	end
# 45 "data/maps/LavenderTown/scripts.pory"

# 46 "data/maps/LavenderTown/scripts.pory"
LavenderTown_EventScript_PokemonTowerSign::
# 47 "data/maps/LavenderTown/scripts.pory"
	msgbox LavenderTown_Text_PokemonTowerSign, MSGBOX_SIGN
# 48 "data/maps/LavenderTown/scripts.pory"
	end
