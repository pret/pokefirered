TwoIsland_PokemonCenter_1F_MapScripts:: @ 81717B4
	map_script MAP_SCRIPT_ON_TRANSITION, TwoIsland_PokemonCenter_1F_OnTransition
	map_script MAP_SCRIPT_ON_RESUME, TwoIsland_PokemonCenter_1F_MapScript2_1BC05C
	.byte 0

TwoIsland_PokemonCenter_1F_OnTransition:: @ 81717BF
	setrespawn SPAWN_TWO_ISLAND
	end

TwoIsland_PokemonCenter_1F_EventScript_1717C3:: @ 81717C3
	lock
	faceplayer
	call EventScript_PkmnCenterNurse
	release
	end

TwoIsland_PokemonCenter_1F_EventScript_1717CC:: @ 81717CC
	msgbox gUnknown_81A2E59, MSGBOX_NPC
	end

TwoIsland_PokemonCenter_1F_EventScript_1717D5:: @ 81717D5
	msgbox gUnknown_81A2EBE, MSGBOX_NPC
	end
