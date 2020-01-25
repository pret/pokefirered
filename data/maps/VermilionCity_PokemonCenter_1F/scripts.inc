VermilionCity_PokemonCenter_1F_MapScripts:: @ 816B424
	map_script MAP_SCRIPT_ON_TRANSITION, VermilionCity_PokemonCenter_1F_OnTransition
	map_script MAP_SCRIPT_ON_RESUME, CableClub_OnResume
	.byte 0

VermilionCity_PokemonCenter_1F_OnTransition:: @ 816B42F
	setrespawn SPAWN_VERMILION_CITY
	end

VermilionCity_PokemonCenter_1F_EventScript_Nurse:: @ 816B433
	lock
	faceplayer
	call EventScript_PkmnCenterNurse
	release
	end

VermilionCity_PokemonCenter_1F_EventScript_Man:: @ 816B43C
	msgbox VermilionCity_PokemonCenter_1F_Text_PoisonedMonFaintedWhileWalking, MSGBOX_NPC
	end

VermilionCity_PokemonCenter_1F_EventScript_Hiker:: @ 816B445
	msgbox VermilionCity_PokemonCenter_1F_Text_TrainerMonsStrongerThanWild, MSGBOX_NPC
	end

VermilionCity_PokemonCenter_1F_EventScript_Youngster:: @ 816B44E
	msgbox VermilionCity_PokemonCenter_1F_Text_AllMonWeakToSpecificTypes, MSGBOX_NPC
	end
