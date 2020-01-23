TrainerTower_4F_MapScripts:: @ 8164742
	map_script MAP_SCRIPT_ON_RESUME, TrainerTower_OnResume
	map_script MAP_SCRIPT_ON_TRANSITION, TrainerTower_OnTransition
	map_script MAP_SCRIPT_ON_FRAME_TABLE, TrainerTower_OnFrame
	.byte 0

@ Below scripts are unused, the identical versions in the 1F script are used instead

TrainerTower_4F_EventScript_DoublesTrainer1:: @ 8164752
	call TrainerTower_EventScript_SpeakToDoublesTrainer1
	end

TrainerTower_4F_EventScript_SinglesTrainer:: @ 8164758
	call TrainerTower_EventScript_SpeakToSinglesTrainer
	end

TrainerTower_4F_EventScript_KnockoutTrainer:: @ 816475E
	call TrainerTower_EventScript_SpeakToKnockoutTrainer
	end

TrainerTower_4F_EventScript_DoublesTrainer2:: @ 8164764
	call TrainerTower_EventScript_SpeakToDoublesTrainer2
	end

TrainerTower_4F_EventScript_Owner:: @ 816476A
	call TrainerTower_EventScript_SpeakToOwner
	end
