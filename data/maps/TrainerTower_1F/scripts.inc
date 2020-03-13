TrainerTower_1F_MapScripts:: @ 81646B8
	map_script MAP_SCRIPT_ON_RESUME, TrainerTower_OnResume
	map_script MAP_SCRIPT_ON_TRANSITION, TrainerTower_OnTransition
	map_script MAP_SCRIPT_ON_FRAME_TABLE, TrainerTower_OnFrame
	.byte 0

@ All Trainer Tower floors/roof share these scripts for their object events

TrainerTower_EventScript_DoublesTrainer1:: @ 81646C8
	call TrainerTower_EventScript_SpeakToDoublesTrainer1
	end

TrainerTower_EventScript_SinglesTrainer:: @ 81646CE
	call TrainerTower_EventScript_SpeakToSinglesTrainer
	end

TrainerTower_EventScript_KnockoutTrainer:: @ 81646D4
	call TrainerTower_EventScript_SpeakToKnockoutTrainer
	end

TrainerTower_EventScript_DoublesTrainer2:: @ 81646DA
	call TrainerTower_EventScript_SpeakToDoublesTrainer2
	end

TrainerTower_EventScript_Owner:: @ 81646E0
	call TrainerTower_EventScript_SpeakToOwner
	end
