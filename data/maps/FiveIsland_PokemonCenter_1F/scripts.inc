FiveIsland_PokemonCenter_1F_MapScripts:: @ 8171CF1
	map_script MAP_SCRIPT_ON_TRANSITION, FiveIsland_PokemonCenter_1F_OnTransition
	map_script MAP_SCRIPT_ON_RESUME, CableClub_OnResume
	.byte 0

FiveIsland_PokemonCenter_1F_OnTransition:: @ 8171CFC
	setrespawn SPAWN_FIVE_ISLAND
	end

FiveIsland_PokemonCenter_1F_EventScript_171D00:: @ 8171D00
	lock
	faceplayer
	call EventScript_PkmnCenterNurse
	release
	end

FiveIsland_PokemonCenter_1F_EventScript_171D09:: @ 8171D09
	msgbox gUnknown_81A3BBA, MSGBOX_NPC
	end

FiveIsland_PokemonCenter_1F_EventScript_171D12:: @ 8171D12
	msgbox gUnknown_81A3BFD, MSGBOX_NPC
	end
