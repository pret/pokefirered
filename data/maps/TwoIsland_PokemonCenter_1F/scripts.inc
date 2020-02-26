TwoIsland_PokemonCenter_1F_MapScripts:: @ 81717B4
	map_script MAP_SCRIPT_ON_TRANSITION, TwoIsland_PokemonCenter_1F_OnTransition
	map_script MAP_SCRIPT_ON_RESUME, CableClub_OnResume
	.byte 0

TwoIsland_PokemonCenter_1F_OnTransition:: @ 81717BF
	setrespawn SPAWN_TWO_ISLAND
	end

TwoIsland_PokemonCenter_1F_EventScript_Nurse:: @ 81717C3
	lock
	faceplayer
	call EventScript_PkmnCenterNurse
	release
	end

TwoIsland_PokemonCenter_1F_EventScript_GBAKid:: @ 81717CC
	msgbox TwoIsland_PokemonCenter_1F_Text_HaveYouVisitedGameCorner, MSGBOX_NPC
	end

TwoIsland_PokemonCenter_1F_EventScript_BugCatcher:: @ 81717D5
	msgbox TwoIsland_PokemonCenter_1F_Text_OldLadyLivesOutOnCape, MSGBOX_NPC
	end
