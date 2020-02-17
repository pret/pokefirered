CeladonCity_PokemonCenter_1F_MapScripts:: @ 816C5EC
	map_script MAP_SCRIPT_ON_TRANSITION, CeladonCity_PokemonCenter_1F_OnTransition
	map_script MAP_SCRIPT_ON_RESUME, CableClub_OnResume
	.byte 0

CeladonCity_PokemonCenter_1F_OnTransition:: @ 816C5F7
	setrespawn SPAWN_CELADON_CITY
	end

CeladonCity_PokemonCenter_1F_EventScript_Nurse:: @ 816C5FB
	lock
	faceplayer
	call EventScript_PkmnCenterNurse
	release
	end

CeladonCity_PokemonCenter_1F_EventScript_Gentleman:: @ 816C604
	msgbox CeladonCity_PokemonCenter_1F_Text_PokeFluteAwakensSleepingMons, MSGBOX_NPC
	end

CeladonCity_PokemonCenter_1F_EventScript_CooltrainerF:: @ 816C60D
	msgbox CeladonCity_PokemonCenter_1F_Text_RodeHereFromFuchsia, MSGBOX_NPC
	end

CeladonCity_PokemonCenter_1F_EventScript_Youngster:: @ 816C616
	msgbox CeladonCity_PokemonCenter_1F_Text_GoToCyclingRoadIfIHadBike, MSGBOX_NPC
	end
