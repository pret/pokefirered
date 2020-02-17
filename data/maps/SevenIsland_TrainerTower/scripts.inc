SevenIsland_TrainerTower_MapScripts:: @ 8168BD5
	map_script MAP_SCRIPT_ON_TRANSITION, SevenIsland_TrainerTower_OnTransition
	.byte 0

SevenIsland_TrainerTower_OnTransition:: @ 8168BDB
	setvar VAR_MAP_SCENE_TRAINER_TOWER, 0
	end

SevenIsland_TrainerTower_EventScript_168BE1:: @ 8168BE1
	msgbox gUnknown_818C338, MSGBOX_SIGN
	end

SevenIsland_TrainerTower_EventScript_168BEA:: @ 8168BEA
	msgbox gUnknown_818C370, MSGBOX_SIGN
	end
