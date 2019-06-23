FiveIsland_PokemonCenter_1F_MapScripts:: @ 8171CF1
	map_script 3, FiveIsland_PokemonCenter_1F_MapScript1_171CFC
	map_script 5, FiveIsland_PokemonCenter_1F_MapScript2_1BC05C
	.byte 0

FiveIsland_PokemonCenter_1F_MapScript1_171CFC:: @ 8171CFC
	setrespawn SPAWN_FIVE_ISLAND
	end

FiveIsland_PokemonCenter_1F_EventScript_171D00:: @ 8171D00
	lock
	faceplayer
	call EventScript_1A6578
	release
	end

FiveIsland_PokemonCenter_1F_EventScript_171D09:: @ 8171D09
	msgbox gUnknown_81A3BBA, 2
	end

FiveIsland_PokemonCenter_1F_EventScript_171D12:: @ 8171D12
	msgbox gUnknown_81A3BFD, 2
	end
