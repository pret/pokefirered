FourIsland_PokemonCenter_1F_MapScripts:: @ 8171BEA
	map_script 3, FourIsland_PokemonCenter_1F_MapScript1_171BF5
	map_script 5, FourIsland_PokemonCenter_1F_MapScript2_1BC05C
	.byte 0

FourIsland_PokemonCenter_1F_MapScript1_171BF5:: @ 8171BF5
	setrespawn SPAWN_FOUR_ISLAND
	end

FourIsland_PokemonCenter_1F_EventScript_171BF9:: @ 8171BF9
	lock
	faceplayer
	call EventScript_1A6578
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
