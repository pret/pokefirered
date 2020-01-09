FourIsland_PokemonCenter_1F_MapScripts:: @ 8171BEA
	map_script MAP_SCRIPT_ON_TRANSITION, FourIsland_PokemonCenter_1F_OnTransition
	map_script MAP_SCRIPT_ON_RESUME, FourIsland_PokemonCenter_1F_MapScript2_1BC05C
	.byte 0

FourIsland_PokemonCenter_1F_OnTransition:: @ 8171BF5
	setrespawn SPAWN_FOUR_ISLAND
	end

FourIsland_PokemonCenter_1F_EventScript_171BF9:: @ 8171BF9
	lock
	faceplayer
	call EventScript_PkmnCenterNurse
	release
	end

FourIsland_PokemonCenter_1F_EventScript_171C02:: @ 8171C02
	msgbox gUnknown_81A3627, 2
	end

FourIsland_PokemonCenter_1F_EventScript_171C0B:: @ 8171C0B
	msgbox gUnknown_81A3697, 2
	end

FourIsland_PokemonCenter_1F_EventScript_171C14:: @ 8171C14
	msgbox gUnknown_81A3734, 2
	end
