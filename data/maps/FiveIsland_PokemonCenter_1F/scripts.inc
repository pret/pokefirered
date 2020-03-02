FiveIsland_PokemonCenter_1F_MapScripts:: @ 8171CF1
	map_script MAP_SCRIPT_ON_TRANSITION, FiveIsland_PokemonCenter_1F_OnTransition
	map_script MAP_SCRIPT_ON_RESUME, CableClub_OnResume
	.byte 0

FiveIsland_PokemonCenter_1F_OnTransition:: @ 8171CFC
	setrespawn SPAWN_FIVE_ISLAND
	end

FiveIsland_PokemonCenter_1F_EventScript_Nurse:: @ 8171D00
	lock
	faceplayer
	call EventScript_PkmnCenterNurse
	release
	end

FiveIsland_PokemonCenter_1F_EventScript_Chef:: @ 8171D09
	msgbox FiveIsland_PokemonCenter_1F_Text_OnMyWayToPrepareMeal, MSGBOX_NPC
	end

FiveIsland_PokemonCenter_1F_EventScript_CooltrainerF:: @ 8171D12
	msgbox FiveIsland_PokemonCenter_1F_Text_YoureOnQuestToCatchEveryMon, MSGBOX_NPC
	end
