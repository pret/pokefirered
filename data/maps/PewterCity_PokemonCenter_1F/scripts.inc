PewterCity_PokemonCenter_1F_MapScripts:: @ 816A760
	map_script 3, PewterCity_PokemonCenter_1F_MapScript1_16A76B
	map_script 5, PewterCity_PokemonCenter_1F_MapScript2_1BC05C
	.byte 0

PewterCity_PokemonCenter_1F_MapScript1_16A76B:: @ 816A76B
	setrespawn 3
	end

PewterCity_PokemonCenter_1F_EventScript_16A76F:: @ 816A76F
	lock
	faceplayer
	call EventScript_1A6578
	release
	end

PewterCity_PokemonCenter_1F_EventScript_16A778:: @ 816A778
	loadword 0, gUnknown_81916A9
	callstd 2
	end

PewterCity_PokemonCenter_1F_EventScript_16A781:: @ 816A781
	lock
	faceplayer
	fadeoutbgm 0
	playbgm BGM_FRLG_JIGGLYPUFF, 0
	message Text_1916EA
	waitmessage
	delay 455
	playbgm BGM_FRLG_POKEMON_CENTER, 1
	release
	end

PewterCity_PokemonCenter_1F_EventScript_16A798:: @ 816A798
	loadword 0, gUnknown_8191701
	callstd 2
	end

PewterCity_PokemonCenter_1F_EventScript_16A7A1:: @ 816A7A1
	lock
	loadword 0, gUnknown_8191743
	callstd 4
	release
	end

PewterCity_PokemonCenter_1F_EventScript_16A7AC:: @ 816A7AC
	loadword 0, gUnknown_8191780
	callstd 2
	end
