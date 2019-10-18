CinnabarIsland_PokemonLab_Entrance_MapScripts:: @ 816E273
	map_script 3, CinnabarIsland_PokemonLab_Entrance_MapScript1_16E279
	.byte 0

CinnabarIsland_PokemonLab_Entrance_MapScript1_16E279:: @ 816E279
	compare_var_to_value VAR_MAP_SCENE_CINNABAR_ISLAND_POKEMON_LAB_EXPERIMENT_ROOM_REVIVE_STATE, 1
	call_if 1, EventScript_16E285
	end

EventScript_16E285:: @ 816E285
	setvar VAR_MAP_SCENE_CINNABAR_ISLAND_POKEMON_LAB_EXPERIMENT_ROOM_REVIVE_STATE, 2
	return

CinnabarIsland_PokemonLab_Entrance_EventScript_16E28B:: @ 816E28B
	msgbox gUnknown_8199EE5, 2
	end

CinnabarIsland_PokemonLab_Entrance_EventScript_16E294:: @ 816E294
	msgbox gUnknown_8199F41, 3
	end

CinnabarIsland_PokemonLab_Entrance_EventScript_16E29D:: @ 816E29D
	msgbox gUnknown_8199F6A, 3
	end

CinnabarIsland_PokemonLab_Entrance_EventScript_16E2A6:: @ 816E2A6
	msgbox gUnknown_8199F83, 3
	end

CinnabarIsland_PokemonLab_Entrance_EventScript_16E2AF:: @ 816E2AF
	msgbox gUnknown_8199F9A, 3
	end
