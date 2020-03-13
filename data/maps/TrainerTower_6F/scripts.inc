TrainerTower_6F_MapScripts:: @ 816479E
	map_script MAP_SCRIPT_ON_RESUME, TrainerTower_OnResume
	map_script MAP_SCRIPT_ON_TRANSITION, TrainerTower_OnTransition
	map_script MAP_SCRIPT_ON_FRAME_TABLE, TrainerTower_OnFrame
	.byte 0

@ Below scripts are unused, the identical versions in the 1F script are used instead

TrainerTower_6F_EventScript_DoublesTrainer1:: @ 81647AE
	call TrainerTower_EventScript_SpeakToDoublesTrainer1
	end

TrainerTower_6F_EventScript_SinglesTrainer:: @ 81647B4
	call TrainerTower_EventScript_SpeakToSinglesTrainer
	end

TrainerTower_6F_EventScript_KnockoutTrainer:: @ 81647BA
	call TrainerTower_EventScript_SpeakToKnockoutTrainer
	end

TrainerTower_6F_EventScript_DoublesTrainer2:: @ 81647C0
	call TrainerTower_EventScript_SpeakToDoublesTrainer2
	end

TrainerTower_6F_EventScript_Owner:: @ 81647C6
	call TrainerTower_EventScript_SpeakToOwner
	end
