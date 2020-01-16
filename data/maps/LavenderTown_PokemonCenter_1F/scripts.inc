LavenderTown_PokemonCenter_1F_MapScripts:: @ 816B0EF
	map_script MAP_SCRIPT_ON_TRANSITION, LavenderTown_PokemonCenter_1F_OnTransition
	map_script MAP_SCRIPT_ON_RESUME, CableClub_OnResume
	.byte 0

LavenderTown_PokemonCenter_1F_OnTransition:: @ 816B0FA
	setrespawn SPAWN_LAVENDER_TOWN
	end

LavenderTown_PokemonCenter_1F_EventScript_Nurse:: @ 816B0FE
	lock
	faceplayer
	call EventScript_PkmnCenterNurse
	release
	end

LavenderTown_PokemonCenter_1F_EventScript_Gentleman:: @ 816B107
	msgbox LavenderTown_PokemonCenter_1F_Text_RocketsDoAnythingForMoney, MSGBOX_NPC
	end

LavenderTown_PokemonCenter_1F_EventScript_Lass:: @ 816B110
	msgbox LavenderTown_PokemonCenter_1F_Text_CubonesMotherKilledByRockets, MSGBOX_NPC
	end

LavenderTown_PokemonCenter_1F_EventScript_Youngster:: @ 816B119
	msgbox LavenderTown_PokemonCenter_1F_Text_PeoplePayForCuboneSkulls, MSGBOX_NPC
	end
