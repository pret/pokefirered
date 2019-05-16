ViridianCity_PokemonCenter_1F_MapScripts:: @ 816A2C0
	map_script 3, ViridianCity_PokemonCenter_1F_MapScript1_16A2CB
	map_script 5, ViridianCity_PokemonCenter_1F_MapScript2_1BC05C
	.byte 0

ViridianCity_PokemonCenter_1F_MapScript1_16A2CB:: @ 816A2CB
	setrespawn SPAWN_VIRIDIAN_CITY
	end

ViridianCity_PokemonCenter_1F_EventScript_16A2CF:: @ 816A2CF
	lock
	faceplayer
	call EventScript_1A6578
	release
	end

ViridianCity_PokemonCenter_1F_EventScript_16A2D8:: @ 816A2D8
	msgbox gUnknown_81903E5, 2
	end

ViridianCity_PokemonCenter_1F_EventScript_16A2E1:: @ 816A2E1
	msgbox gUnknown_8190384, 2
	end

ViridianCity_PokemonCenter_1F_EventScript_16A2EA:: @ 816A2EA
	msgbox gUnknown_8190450, 2
	end
