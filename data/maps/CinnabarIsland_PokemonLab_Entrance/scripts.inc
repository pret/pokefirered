# 1 "data/maps/CinnabarIsland_PokemonLab_Entrance/scripts.pory"

# 2 "data/maps/CinnabarIsland_PokemonLab_Entrance/scripts.pory"
CinnabarIsland_PokemonLab_Entrance_MapScripts::
# 3 "data/maps/CinnabarIsland_PokemonLab_Entrance/scripts.pory"
	map_script MAP_SCRIPT_ON_TRANSITION, CinnabarIsland_PokemonLab_Entrance_OnTransition
# 4 "data/maps/CinnabarIsland_PokemonLab_Entrance/scripts.pory"
	.byte 0
# 5 "data/maps/CinnabarIsland_PokemonLab_Entrance/scripts.pory"

# 6 "data/maps/CinnabarIsland_PokemonLab_Entrance/scripts.pory"
CinnabarIsland_PokemonLab_Entrance_OnTransition::
# 7 "data/maps/CinnabarIsland_PokemonLab_Entrance/scripts.pory"
	call_if_eq VAR_MAP_SCENE_CINNABAR_ISLAND_POKEMON_LAB_EXPERIMENT_ROOM_REVIVE_STATE, 1, CinnabarIsland_PokemonLab_Entrance_EventScript_ReadyFossil
# 8 "data/maps/CinnabarIsland_PokemonLab_Entrance/scripts.pory"
	end
# 9 "data/maps/CinnabarIsland_PokemonLab_Entrance/scripts.pory"

# 10 "data/maps/CinnabarIsland_PokemonLab_Entrance/scripts.pory"
CinnabarIsland_PokemonLab_Entrance_EventScript_ReadyFossil::
# 11 "data/maps/CinnabarIsland_PokemonLab_Entrance/scripts.pory"
	setvar VAR_MAP_SCENE_CINNABAR_ISLAND_POKEMON_LAB_EXPERIMENT_ROOM_REVIVE_STATE, 2
# 12 "data/maps/CinnabarIsland_PokemonLab_Entrance/scripts.pory"
	return
# 13 "data/maps/CinnabarIsland_PokemonLab_Entrance/scripts.pory"

# 14 "data/maps/CinnabarIsland_PokemonLab_Entrance/scripts.pory"
CinnabarIsland_PokemonLab_Entrance_EventScript_Scientist::
# 15 "data/maps/CinnabarIsland_PokemonLab_Entrance/scripts.pory"
	msgbox CinnabarIsland_PokemonLab_Entrance_Text_StudyMonsExtensively, MSGBOX_NPC
# 16 "data/maps/CinnabarIsland_PokemonLab_Entrance/scripts.pory"
	end
# 17 "data/maps/CinnabarIsland_PokemonLab_Entrance/scripts.pory"

# 18 "data/maps/CinnabarIsland_PokemonLab_Entrance/scripts.pory"
CinnabarIsland_PokemonLab_Entrance_EventScript_DrFujiPhoto::
# 19 "data/maps/CinnabarIsland_PokemonLab_Entrance/scripts.pory"
	msgbox CinnabarIsland_PokemonLab_Entrance_Text_PhotoOfLabFounderDrFuji, MSGBOX_SIGN
# 20 "data/maps/CinnabarIsland_PokemonLab_Entrance/scripts.pory"
	end
# 21 "data/maps/CinnabarIsland_PokemonLab_Entrance/scripts.pory"

# 22 "data/maps/CinnabarIsland_PokemonLab_Entrance/scripts.pory"
CinnabarIsland_PokemonLab_Entrance_EventScript_MeetingRoomSign::
# 23 "data/maps/CinnabarIsland_PokemonLab_Entrance/scripts.pory"
	msgbox CinnabarIsland_PokemonLab_Entrance_Text_MeetingRoomSign, MSGBOX_SIGN
# 24 "data/maps/CinnabarIsland_PokemonLab_Entrance/scripts.pory"
	end
# 25 "data/maps/CinnabarIsland_PokemonLab_Entrance/scripts.pory"

# 26 "data/maps/CinnabarIsland_PokemonLab_Entrance/scripts.pory"
CinnabarIsland_PokemonLab_Entrance_EventScript_RAndDRoomSign::
# 27 "data/maps/CinnabarIsland_PokemonLab_Entrance/scripts.pory"
	msgbox CinnabarIsland_PokemonLab_Entrance_Text_RAndDRoomSign, MSGBOX_SIGN
# 28 "data/maps/CinnabarIsland_PokemonLab_Entrance/scripts.pory"
	end
# 29 "data/maps/CinnabarIsland_PokemonLab_Entrance/scripts.pory"

# 30 "data/maps/CinnabarIsland_PokemonLab_Entrance/scripts.pory"
CinnabarIsland_PokemonLab_Entrance_EventScript_TestingRoomSign::
# 31 "data/maps/CinnabarIsland_PokemonLab_Entrance/scripts.pory"
	msgbox CinnabarIsland_PokemonLab_Entrance_Text_TestingRoomSign, MSGBOX_SIGN
# 32 "data/maps/CinnabarIsland_PokemonLab_Entrance/scripts.pory"
	end
