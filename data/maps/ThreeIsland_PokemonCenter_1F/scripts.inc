ThreeIsland_PokemonCenter_1F_MapScripts:: @ 8171832
	map_script 3, ThreeIsland_PokemonCenter_1F_MapScript1_17183D
	map_script 5, ThreeIsland_PokemonCenter_1F_MapScript2_1BC05C
	.byte 0

ThreeIsland_PokemonCenter_1F_MapScript1_17183D:: @ 817183D
	setrespawn 16
	end

ThreeIsland_PokemonCenter_1F_EventScript_171841:: @ 8171841
	lock
	faceplayer
	call EventScript_1A6578
	release
	end

ThreeIsland_PokemonCenter_1F_EventScript_17184A:: @ 817184A
	loadword 0, gUnknown_81A303B
	callstd 2
	end

ThreeIsland_PokemonCenter_1F_EventScript_171853:: @ 8171853
	loadword 0, gUnknown_81A30A3
	callstd 2
	end

ThreeIsland_PokemonCenter_1F_EventScript_17185C:: @ 817185C
	loadword 0, gUnknown_81A2FB5
	callstd 2
	end
