VermilionCity_PokemonCenter_1F_MapScripts:: @ 816B424
	map_script 3, VermilionCity_PokemonCenter_1F_MapScript1_16B42F
	map_script 5, VermilionCity_PokemonCenter_1F_MapScript2_1BC05C
	.byte 0

VermilionCity_PokemonCenter_1F_MapScript1_16B42F:: @ 816B42F
	setrespawn 6
	end

VermilionCity_PokemonCenter_1F_EventScript_16B433:: @ 816B433
	lock
	faceplayer
	call EventScript_1A6578
	release
	end

VermilionCity_PokemonCenter_1F_EventScript_16B43C:: @ 816B43C
	msgbox gUnknown_8194145, 2
	end

VermilionCity_PokemonCenter_1F_EventScript_16B445:: @ 816B445
	msgbox gUnknown_81940AF, 2
	end

VermilionCity_PokemonCenter_1F_EventScript_16B44E:: @ 816B44E
	msgbox gUnknown_8194180, 2
	end
