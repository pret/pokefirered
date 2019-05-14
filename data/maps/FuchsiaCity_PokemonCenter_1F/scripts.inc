FuchsiaCity_PokemonCenter_1F_MapScripts:: @ 816D6F1
	map_script 3, FuchsiaCity_PokemonCenter_1F_MapScript1_16D6FC
	map_script 5, FuchsiaCity_PokemonCenter_1F_MapScript2_1BC05C
	.byte 0

FuchsiaCity_PokemonCenter_1F_MapScript1_16D6FC:: @ 816D6FC
	setrespawn 8
	end

FuchsiaCity_PokemonCenter_1F_EventScript_16D700:: @ 816D700
	lock
	faceplayer
	call EventScript_1A6578
	release
	end

FuchsiaCity_PokemonCenter_1F_EventScript_16D709:: @ 816D709
	loadword 0, gUnknown_8198CB7
	callstd 2
	end

FuchsiaCity_PokemonCenter_1F_EventScript_16D712:: @ 816D712
	loadword 0, gUnknown_8198D2E
	callstd 2
	end

FuchsiaCity_PokemonCenter_1F_EventScript_16D71B:: @ 816D71B
	loadword 0, gUnknown_8198D9B
	callstd 2
	end
