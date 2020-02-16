TrainerTower_8F_MapScripts:: @ 81647FA
	map_script MAP_SCRIPT_ON_RESUME, TrainerTower_OnResume
	map_script MAP_SCRIPT_ON_TRANSITION, TrainerTower_OnTransition
	map_script MAP_SCRIPT_ON_FRAME_TABLE, TrainerTower_OnFrame
	.byte 0

@ Below scripts are unused, the identical versions in the 1F script are used instead

TrainerTower_8F_EventScript_DoublesTrainer1:: @ 816480A
	call TrainerTower_EventScript_SpeakToDoublesTrainer1
	end

TrainerTower_8F_EventScript_SinglesTrainer:: @ 8164810
	call TrainerTower_EventScript_SpeakToSinglesTrainer
	end

TrainerTower_8F_EventScript_KnockoutTrainer:: @ 8164816
	call TrainerTower_EventScript_SpeakToKnockoutTrainer
	end

TrainerTower_8F_EventScript_DoublesTrainer2:: @ 816481C
	call TrainerTower_EventScript_SpeakToDoublesTrainer2
	end

TrainerTower_8F_EventScript_Owner:: @ 8164822
	call TrainerTower_EventScript_SpeakToOwner
	end
