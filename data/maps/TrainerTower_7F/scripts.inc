TrainerTower_7F_MapScripts:: @ 81647CC
	map_script MAP_SCRIPT_ON_RESUME, TrainerTower_OnResume
	map_script MAP_SCRIPT_ON_TRANSITION, TrainerTower_OnTransition
	map_script MAP_SCRIPT_ON_FRAME_TABLE, TrainerTower_OnFrame
	.byte 0

@ Below scripts are unused, the identical versions in the 1F script are used instead

TrainerTower_7F_EventScript_DoublesTrainer1:: @ 81647DC
	call TrainerTower_EventScript_SpeakToDoublesTrainer1
	end

TrainerTower_7F_EventScript_SinglesTrainer:: @ 81647E2
	call TrainerTower_EventScript_SpeakToSinglesTrainer
	end

TrainerTower_7F_EventScript_KnockoutTrainer:: @ 81647E8
	call TrainerTower_EventScript_SpeakToKnockoutTrainer
	end

TrainerTower_7F_EventScript_DoublesTrainer2:: @ 81647EE
	call TrainerTower_EventScript_SpeakToDoublesTrainer2
	end

TrainerTower_7F_EventScript_Owner:: @ 81647F4
	call TrainerTower_EventScript_SpeakToOwner
	end
