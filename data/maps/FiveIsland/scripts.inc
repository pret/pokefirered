FiveIsland_MapScripts:: @ 8167E8E
	map_script MAP_SCRIPT_ON_TRANSITION, FiveIsland_OnTransition
	.byte 0

FiveIsland_OnTransition:: @ 8167E94
	setworldmapflag FLAG_WORLD_MAP_FIVE_ISLAND
	end

FiveIsland_EventScript_167E98:: @ 8167E98
	msgbox gUnknown_8182DFB, 3
	end

FiveIsland_EventScript_167EA1:: @ 8167EA1
	msgbox gUnknown_8182E26, 2
	end

FiveIsland_EventScript_167EAA:: @ 8167EAA
	msgbox gUnknown_8182E96, 2
	end
