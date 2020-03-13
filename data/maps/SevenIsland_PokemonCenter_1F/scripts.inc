SevenIsland_PokemonCenter_1F_MapScripts:: @ 8170B89
	map_script MAP_SCRIPT_ON_TRANSITION, SevenIsland_PokemonCenter_1F_OnTransition
	map_script MAP_SCRIPT_ON_RESUME, CableClub_OnResume
	.byte 0

SevenIsland_PokemonCenter_1F_OnTransition:: @ 8170B94
	setrespawn SPAWN_SEVEN_ISLAND
	end

SevenIsland_PokemonCenter_1F_EventScript_Nurse:: @ 8170B98
	lock
	faceplayer
	call EventScript_PkmnCenterNurse
	release
	end

SevenIsland_PokemonCenter_1F_EventScript_OldMan:: @ 8170BA1
	msgbox SevenIsland_PokemonCenter_1F_Text_EventsDependingOnConnections, MSGBOX_NPC
	end

SevenIsland_PokemonCenter_1F_EventScript_Sailor:: @ 8170BAA
	msgbox SevenIsland_PokemonCenter_1F_Text_DidYouRideSeagallopHere, MSGBOX_NPC
	end

SevenIsland_PokemonCenter_1F_EventScript_Beauty:: @ 8170BB3
	msgbox SevenIsland_PokemonCenter_1F_Text_CheckOutTrainerTower, MSGBOX_NPC
	end
