# 1 "data/maps/TrainerTower_1F/scripts.pory"

# 2 "data/maps/TrainerTower_1F/scripts.pory"
TrainerTower_1F_MapScripts::
# 3 "data/maps/TrainerTower_1F/scripts.pory"
	map_script MAP_SCRIPT_ON_RESUME, TrainerTower_OnResume
# 4 "data/maps/TrainerTower_1F/scripts.pory"
	map_script MAP_SCRIPT_ON_TRANSITION, TrainerTower_OnTransition
# 5 "data/maps/TrainerTower_1F/scripts.pory"
	map_script MAP_SCRIPT_ON_FRAME_TABLE, TrainerTower_OnFrame
# 6 "data/maps/TrainerTower_1F/scripts.pory"
	.byte 0
# 7 "data/maps/TrainerTower_1F/scripts.pory"

# 8 "data/maps/TrainerTower_1F/scripts.pory"
@ All Trainer Tower floors/roof share these scripts for their object events
# 9 "data/maps/TrainerTower_1F/scripts.pory"

# 10 "data/maps/TrainerTower_1F/scripts.pory"
TrainerTower_EventScript_DoublesTrainer1::
# 11 "data/maps/TrainerTower_1F/scripts.pory"
	call TrainerTower_EventScript_SpeakToDoublesTrainer1
# 12 "data/maps/TrainerTower_1F/scripts.pory"
	end
# 13 "data/maps/TrainerTower_1F/scripts.pory"

# 14 "data/maps/TrainerTower_1F/scripts.pory"
TrainerTower_EventScript_SinglesTrainer::
# 15 "data/maps/TrainerTower_1F/scripts.pory"
	call TrainerTower_EventScript_SpeakToSinglesTrainer
# 16 "data/maps/TrainerTower_1F/scripts.pory"
	end
# 17 "data/maps/TrainerTower_1F/scripts.pory"

# 18 "data/maps/TrainerTower_1F/scripts.pory"
TrainerTower_EventScript_KnockoutTrainer::
# 19 "data/maps/TrainerTower_1F/scripts.pory"
	call TrainerTower_EventScript_SpeakToKnockoutTrainer
# 20 "data/maps/TrainerTower_1F/scripts.pory"
	end
# 21 "data/maps/TrainerTower_1F/scripts.pory"

# 22 "data/maps/TrainerTower_1F/scripts.pory"
TrainerTower_EventScript_DoublesTrainer2::
# 23 "data/maps/TrainerTower_1F/scripts.pory"
	call TrainerTower_EventScript_SpeakToDoublesTrainer2
# 24 "data/maps/TrainerTower_1F/scripts.pory"
	end
# 25 "data/maps/TrainerTower_1F/scripts.pory"

# 26 "data/maps/TrainerTower_1F/scripts.pory"
TrainerTower_EventScript_Owner::
# 27 "data/maps/TrainerTower_1F/scripts.pory"
	call TrainerTower_EventScript_SpeakToOwner
# 28 "data/maps/TrainerTower_1F/scripts.pory"
	end
