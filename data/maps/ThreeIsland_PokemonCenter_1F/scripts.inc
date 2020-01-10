ThreeIsland_PokemonCenter_1F_MapScripts:: @ 8171832
	map_script MAP_SCRIPT_ON_TRANSITION, ThreeIsland_PokemonCenter_1F_OnTransition
	map_script MAP_SCRIPT_ON_RESUME, CableClub_OnResume
	.byte 0

ThreeIsland_PokemonCenter_1F_OnTransition:: @ 817183D
	setrespawn SPAWN_THREE_ISLAND
	end

ThreeIsland_PokemonCenter_1F_EventScript_171841:: @ 8171841
	lock
	faceplayer
	call EventScript_PkmnCenterNurse
	release
	end

ThreeIsland_PokemonCenter_1F_EventScript_17184A:: @ 817184A
	msgbox gUnknown_81A303B, MSGBOX_NPC
	end

ThreeIsland_PokemonCenter_1F_EventScript_171853:: @ 8171853
	msgbox gUnknown_81A30A3, MSGBOX_NPC
	end

ThreeIsland_PokemonCenter_1F_EventScript_17185C:: @ 817185C
	msgbox gUnknown_81A2FB5, MSGBOX_NPC
	end
