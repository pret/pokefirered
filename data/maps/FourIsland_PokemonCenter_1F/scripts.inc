FourIsland_PokemonCenter_1F_MapScripts:: @ 8171BEA
	map_script MAP_SCRIPT_ON_TRANSITION, FourIsland_PokemonCenter_1F_OnTransition
	map_script MAP_SCRIPT_ON_RESUME, CableClub_OnResume
	.byte 0

FourIsland_PokemonCenter_1F_OnTransition:: @ 8171BF5
	setrespawn SPAWN_FOUR_ISLAND
	end

FourIsland_PokemonCenter_1F_EventScript_Nurse:: @ 8171BF9
	lock
	faceplayer
	call EventScript_PkmnCenterNurse
	release
	end

FourIsland_PokemonCenter_1F_EventScript_Man:: @ 8171C02
	msgbox FourIsland_PokemonCenter_1F_Text_RareIceMonsInCave, MSGBOX_NPC
	end

FourIsland_PokemonCenter_1F_EventScript_Woman:: @ 8171C0B
	msgbox FourIsland_PokemonCenter_1F_Text_DayCarePeopleFoundEggBefore, MSGBOX_NPC
	end

FourIsland_PokemonCenter_1F_EventScript_Gentleman:: @ 8171C14
	msgbox FourIsland_PokemonCenter_1F_Text_NewPokemonJournalHasntArrived, MSGBOX_NPC
	end
