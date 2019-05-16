SevenIsland_PokemonCenter_1F_MapScripts:: @ 8170B89
	map_script 3, SevenIsland_PokemonCenter_1F_MapScript1_170B94
	map_script 5, SevenIsland_PokemonCenter_1F_MapScript2_1BC05C
	.byte 0

SevenIsland_PokemonCenter_1F_MapScript1_170B94:: @ 8170B94
	setrespawn SPAWN_SEVEN_ISLAND
	end

SevenIsland_PokemonCenter_1F_EventScript_170B98:: @ 8170B98
	lock
	faceplayer
	call EventScript_1A6578
	release
	end

SevenIsland_PokemonCenter_1F_EventScript_170BA1:: @ 8170BA1
	msgbox gUnknown_81A0B98, 2
	end

SevenIsland_PokemonCenter_1F_EventScript_170BAA:: @ 8170BAA
	msgbox gUnknown_81A0C1F, 2
	end

SevenIsland_PokemonCenter_1F_EventScript_170BB3:: @ 8170BB3
	msgbox gUnknown_81A0CA5, 2
	end
