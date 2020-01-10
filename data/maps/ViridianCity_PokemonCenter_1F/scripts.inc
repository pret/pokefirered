ViridianCity_PokemonCenter_1F_MapScripts:: @ 816A2C0
	map_script MAP_SCRIPT_ON_TRANSITION, ViridianCity_PokemonCenter_1F_OnTransition
	map_script MAP_SCRIPT_ON_RESUME, ViridianCity_PokemonCenter_1F_MapScript2_1BC05C
	.byte 0

ViridianCity_PokemonCenter_1F_OnTransition:: @ 816A2CB
	setrespawn SPAWN_VIRIDIAN_CITY
	end

ViridianCity_PokemonCenter_1F_EventScript_16A2CF:: @ 816A2CF
	lock
	faceplayer
	call EventScript_PkmnCenterNurse
	release
	end

ViridianCity_PokemonCenter_1F_EventScript_16A2D8:: @ 816A2D8
	msgbox gUnknown_81903E5, MSGBOX_NPC
	end

ViridianCity_PokemonCenter_1F_EventScript_16A2E1:: @ 816A2E1
	msgbox gUnknown_8190384, MSGBOX_NPC
	end

ViridianCity_PokemonCenter_1F_EventScript_16A2EA:: @ 816A2EA
	msgbox gUnknown_8190450, MSGBOX_NPC
	end
