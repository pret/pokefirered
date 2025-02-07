# 1 "data/maps/TrainerTower_4F/scripts.pory"

# 2 "data/maps/TrainerTower_4F/scripts.pory"
TrainerTower_4F_MapScripts::
# 3 "data/maps/TrainerTower_4F/scripts.pory"
	map_script MAP_SCRIPT_ON_RESUME, TrainerTower_OnResume
# 4 "data/maps/TrainerTower_4F/scripts.pory"
	map_script MAP_SCRIPT_ON_TRANSITION, TrainerTower_OnTransition
# 5 "data/maps/TrainerTower_4F/scripts.pory"
	map_script MAP_SCRIPT_ON_FRAME_TABLE, TrainerTower_OnFrame
# 6 "data/maps/TrainerTower_4F/scripts.pory"
	.byte 0
# 7 "data/maps/TrainerTower_4F/scripts.pory"

# 8 "data/maps/TrainerTower_4F/scripts.pory"
@ Below scripts are unused, the identical versions in the 1F script are used instead
# 9 "data/maps/TrainerTower_4F/scripts.pory"

# 10 "data/maps/TrainerTower_4F/scripts.pory"
TrainerTower_4F_EventScript_DoublesTrainer1::
# 11 "data/maps/TrainerTower_4F/scripts.pory"
	call TrainerTower_EventScript_SpeakToDoublesTrainer1
# 12 "data/maps/TrainerTower_4F/scripts.pory"
	end
# 13 "data/maps/TrainerTower_4F/scripts.pory"

# 14 "data/maps/TrainerTower_4F/scripts.pory"
TrainerTower_4F_EventScript_SinglesTrainer::
# 15 "data/maps/TrainerTower_4F/scripts.pory"
	call TrainerTower_EventScript_SpeakToSinglesTrainer
# 16 "data/maps/TrainerTower_4F/scripts.pory"
	end
# 17 "data/maps/TrainerTower_4F/scripts.pory"

# 18 "data/maps/TrainerTower_4F/scripts.pory"
TrainerTower_4F_EventScript_KnockoutTrainer::
# 19 "data/maps/TrainerTower_4F/scripts.pory"
	call TrainerTower_EventScript_SpeakToKnockoutTrainer
# 20 "data/maps/TrainerTower_4F/scripts.pory"
	end
# 21 "data/maps/TrainerTower_4F/scripts.pory"

# 22 "data/maps/TrainerTower_4F/scripts.pory"
TrainerTower_4F_EventScript_DoublesTrainer2::
# 23 "data/maps/TrainerTower_4F/scripts.pory"
	call TrainerTower_EventScript_SpeakToDoublesTrainer2
# 24 "data/maps/TrainerTower_4F/scripts.pory"
	end
# 25 "data/maps/TrainerTower_4F/scripts.pory"

# 26 "data/maps/TrainerTower_4F/scripts.pory"
TrainerTower_4F_EventScript_Owner::
# 27 "data/maps/TrainerTower_4F/scripts.pory"
	call TrainerTower_EventScript_SpeakToOwner
# 28 "data/maps/TrainerTower_4F/scripts.pory"
	end
