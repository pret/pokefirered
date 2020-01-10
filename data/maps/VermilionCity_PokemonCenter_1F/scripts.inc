VermilionCity_PokemonCenter_1F_MapScripts:: @ 816B424
	map_script MAP_SCRIPT_ON_TRANSITION, VermilionCity_PokemonCenter_1F_OnTransition
	map_script MAP_SCRIPT_ON_RESUME, VermilionCity_PokemonCenter_1F_MapScript2_1BC05C
	.byte 0

VermilionCity_PokemonCenter_1F_OnTransition:: @ 816B42F
	setrespawn SPAWN_VERMILION_CITY
	end

VermilionCity_PokemonCenter_1F_EventScript_16B433:: @ 816B433
	lock
	faceplayer
	call EventScript_PkmnCenterNurse
	release
	end

VermilionCity_PokemonCenter_1F_EventScript_16B43C:: @ 816B43C
	msgbox gUnknown_8194145, MSGBOX_NPC
	end

VermilionCity_PokemonCenter_1F_EventScript_16B445:: @ 816B445
	msgbox gUnknown_81940AF, MSGBOX_NPC
	end

VermilionCity_PokemonCenter_1F_EventScript_16B44E:: @ 816B44E
	msgbox gUnknown_8194180, MSGBOX_NPC
	end
