# 1 "data/maps/TrainerTower_Roof/scripts.pory"

# 2 "data/maps/TrainerTower_Roof/scripts.pory"
TrainerTower_Roof_MapScripts::
# 3 "data/maps/TrainerTower_Roof/scripts.pory"
	map_script MAP_SCRIPT_ON_RESUME, TrainerTower_OnResume
# 4 "data/maps/TrainerTower_Roof/scripts.pory"
	map_script MAP_SCRIPT_ON_FRAME_TABLE, TrainerTower_OnFrame
# 5 "data/maps/TrainerTower_Roof/scripts.pory"
	.byte 0
# 6 "data/maps/TrainerTower_Roof/scripts.pory"

# 7 "data/maps/TrainerTower_Roof/scripts.pory"
@ Below script is unused, the identical version in the 1F script is used instead
# 8 "data/maps/TrainerTower_Roof/scripts.pory"

# 9 "data/maps/TrainerTower_Roof/scripts.pory"
TrainerTower_Roof_EventScript_Owner::
# 10 "data/maps/TrainerTower_Roof/scripts.pory"
	call TrainerTower_EventScript_SpeakToOwner
# 11 "data/maps/TrainerTower_Roof/scripts.pory"
	end
