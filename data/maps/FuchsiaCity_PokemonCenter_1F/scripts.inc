FuchsiaCity_PokemonCenter_1F_MapScripts:: @ 816D6F1
	map_script MAP_SCRIPT_ON_TRANSITION, FuchsiaCity_PokemonCenter_1F_OnTransition
	map_script MAP_SCRIPT_ON_RESUME, FuchsiaCity_PokemonCenter_1F_MapScript2_1BC05C
	.byte 0

FuchsiaCity_PokemonCenter_1F_OnTransition:: @ 816D6FC
	setrespawn SPAWN_FUCHSIA_CITY
	end

FuchsiaCity_PokemonCenter_1F_EventScript_16D700:: @ 816D700
	lock
	faceplayer
	call EventScript_1A6578
	release
	end

FuchsiaCity_PokemonCenter_1F_EventScript_16D709:: @ 816D709
	msgbox gUnknown_8198CB7, 2
	end

FuchsiaCity_PokemonCenter_1F_EventScript_16D712:: @ 816D712
	msgbox gUnknown_8198D2E, 2
	end

FuchsiaCity_PokemonCenter_1F_EventScript_16D71B:: @ 816D71B
	msgbox gUnknown_8198D9B, 2
	end
