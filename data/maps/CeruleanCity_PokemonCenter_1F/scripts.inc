CeruleanCity_PokemonCenter_1F_MapScripts:: @ 816AA2D
	map_script MAP_SCRIPT_ON_TRANSITION, CeruleanCity_PokemonCenter_1F_OnTransition
	map_script MAP_SCRIPT_ON_RESUME, CeruleanCity_PokemonCenter_1F_MapScript2_1BC05C
	.byte 0

CeruleanCity_PokemonCenter_1F_OnTransition:: @ 816AA38
	setrespawn SPAWN_CERULEAN_CITY
	end

CeruleanCity_PokemonCenter_1F_EventScript_16AA3C:: @ 816AA3C
	lock
	faceplayer
	call EventScript_PkmnCenterNurse
	release
	end

CeruleanCity_PokemonCenter_1F_EventScript_16AA45:: @ 816AA45
	msgbox gUnknown_8192079, MSGBOX_NPC
	end

CeruleanCity_PokemonCenter_1F_EventScript_16AA4E:: @ 816AA4E
	msgbox gUnknown_8191FFB, MSGBOX_NPC
	end

CeruleanCity_PokemonCenter_1F_EventScript_16AA57:: @ 816AA57
	lock
	faceplayer
	famechecker FAMECHECKER_BILL, 1
	msgbox gUnknown_8192116
	release
	end

CeruleanCity_PokemonCenter_1F_EventScript_16AA70:: @ 816AA70
	msgbox gUnknown_819214C, MSGBOX_NPC
	end
