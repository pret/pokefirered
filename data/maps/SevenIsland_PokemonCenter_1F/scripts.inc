SevenIsland_PokemonCenter_1F_MapScripts:: @ 8170B89
	map_script MAP_SCRIPT_ON_TRANSITION, SevenIsland_PokemonCenter_1F_OnTransition
	map_script MAP_SCRIPT_ON_RESUME, CableClub_OnResume
	.byte 0

SevenIsland_PokemonCenter_1F_OnTransition:: @ 8170B94
	setrespawn SPAWN_SEVEN_ISLAND
	end

SevenIsland_PokemonCenter_1F_EventScript_170B98:: @ 8170B98
	lock
	faceplayer
	call EventScript_PkmnCenterNurse
	release
	end

SevenIsland_PokemonCenter_1F_EventScript_170BA1:: @ 8170BA1
	msgbox gUnknown_81A0B98, MSGBOX_NPC
	end

SevenIsland_PokemonCenter_1F_EventScript_170BAA:: @ 8170BAA
	msgbox gUnknown_81A0C1F, MSGBOX_NPC
	end

SevenIsland_PokemonCenter_1F_EventScript_170BB3:: @ 8170BB3
	msgbox gUnknown_81A0CA5, MSGBOX_NPC
	end
