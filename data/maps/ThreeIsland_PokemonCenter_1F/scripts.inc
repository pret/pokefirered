ThreeIsland_PokemonCenter_1F_MapScripts:: @ 8171832
	map_script MAP_SCRIPT_ON_TRANSITION, ThreeIsland_PokemonCenter_1F_OnTransition
	map_script MAP_SCRIPT_ON_RESUME, CableClub_OnResume
	.byte 0

ThreeIsland_PokemonCenter_1F_OnTransition:: @ 817183D
	setrespawn SPAWN_THREE_ISLAND
	end

ThreeIsland_PokemonCenter_1F_EventScript_Nurse:: @ 8171841
	lock
	faceplayer
	call EventScript_PkmnCenterNurse
	release
	end

ThreeIsland_PokemonCenter_1F_EventScript_Sailor:: @ 817184A
	msgbox ThreeIsland_PokemonCenter_1F_Text_ImpossibleToSurfBetweenIslands, MSGBOX_NPC
	end

ThreeIsland_PokemonCenter_1F_EventScript_Lass:: @ 8171853
	msgbox ThreeIsland_PokemonCenter_1F_Text_AlwaysBerriesInBerryForest, MSGBOX_NPC
	end

ThreeIsland_PokemonCenter_1F_EventScript_Rocker:: @ 817185C
	msgbox ThreeIsland_PokemonCenter_1F_Text_PCNetworkCanLinkWithKanto, MSGBOX_NPC
	end
