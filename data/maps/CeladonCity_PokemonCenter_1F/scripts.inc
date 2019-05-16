CeladonCity_PokemonCenter_1F_MapScripts:: @ 816C5EC
	map_script 3, CeladonCity_PokemonCenter_1F_MapScript1_16C5F7
	map_script 5, CeladonCity_PokemonCenter_1F_MapScript2_1BC05C
	.byte 0

CeladonCity_PokemonCenter_1F_MapScript1_16C5F7:: @ 816C5F7
	setrespawn 7
	end

CeladonCity_PokemonCenter_1F_EventScript_16C5FB:: @ 816C5FB
	lock
	faceplayer
	call EventScript_1A6578
	release
	end

CeladonCity_PokemonCenter_1F_EventScript_16C604:: @ 816C604
	msgbox gUnknown_819685B, 2
	end

CeladonCity_PokemonCenter_1F_EventScript_16C60D:: @ 816C60D
	msgbox gUnknown_81968C2, 2
	end

CeladonCity_PokemonCenter_1F_EventScript_16C616:: @ 816C616
	msgbox gUnknown_8196913, 2
	end
