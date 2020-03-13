TrainerTower_5F_MapScripts:: @ 8164770
	map_script MAP_SCRIPT_ON_RESUME, TrainerTower_OnResume
	map_script MAP_SCRIPT_ON_TRANSITION, TrainerTower_OnTransition
	map_script MAP_SCRIPT_ON_FRAME_TABLE, TrainerTower_OnFrame
	.byte 0

@ Below scripts are unused, the identical versions in the 1F script are used instead

TrainerTower_5F_EventScript_DoublesTrainer1:: @ 8164780
	call TrainerTower_EventScript_SpeakToDoublesTrainer1
	end

TrainerTower_5F_EventScript_SinglesTrainer:: @ 8164786
	call TrainerTower_EventScript_SpeakToSinglesTrainer
	end

TrainerTower_5F_EventScript_KnockoutTrainer:: @ 816478C
	call TrainerTower_EventScript_SpeakToKnockoutTrainer
	end

TrainerTower_5F_EventScript_DoublesTrainer2:: @ 8164792
	call TrainerTower_EventScript_SpeakToDoublesTrainer2
	end

TrainerTower_5F_EventScript_Owner:: @ 8164798
	call TrainerTower_EventScript_SpeakToOwner
	end
