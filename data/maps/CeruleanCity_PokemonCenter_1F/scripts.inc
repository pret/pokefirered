CeruleanCity_PokemonCenter_1F_MapScripts:: @ 816AA2D
	map_script MAP_SCRIPT_ON_TRANSITION, CeruleanCity_PokemonCenter_1F_OnTransition
	map_script MAP_SCRIPT_ON_RESUME, CableClub_OnResume
	.byte 0

CeruleanCity_PokemonCenter_1F_OnTransition:: @ 816AA38
	setrespawn SPAWN_CERULEAN_CITY
	end

CeruleanCity_PokemonCenter_1F_EventScript_Nurse:: @ 816AA3C
	lock
	faceplayer
	call EventScript_PkmnCenterNurse
	release
	end

CeruleanCity_PokemonCenter_1F_EventScript_Gentleman:: @ 816AA45
	msgbox CeruleanCity_PokemonCenter_1F_Text_EveryoneCallsBillPokemaniac, MSGBOX_NPC
	end

CeruleanCity_PokemonCenter_1F_EventScript_Rocker:: @ 816AA4E
	msgbox CeruleanCity_PokemonCenter_1F_Text_BillDoesWhateverForRareMons, MSGBOX_NPC
	end

CeruleanCity_PokemonCenter_1F_EventScript_Youngster:: @ 816AA57
	lock
	faceplayer
	famechecker FAMECHECKER_BILL, 1
	msgbox CeruleanCity_PokemonCenter_1F_Text_BillCollectsRareMons
	release
	end

CeruleanCity_PokemonCenter_1F_EventScript_Lass:: @ 816AA70
	msgbox CeruleanCity_PokemonCenter_1F_Text_TryTradingUpstairs, MSGBOX_NPC
	end
