# 1 "data/maps/SevenIsland_TrainerTower/scripts.pory"

# 2 "data/maps/SevenIsland_TrainerTower/scripts.pory"
SevenIsland_TrainerTower_MapScripts::
# 3 "data/maps/SevenIsland_TrainerTower/scripts.pory"
	map_script MAP_SCRIPT_ON_TRANSITION, SevenIsland_TrainerTower_OnTransition
# 4 "data/maps/SevenIsland_TrainerTower/scripts.pory"
	.byte 0
# 5 "data/maps/SevenIsland_TrainerTower/scripts.pory"

# 6 "data/maps/SevenIsland_TrainerTower/scripts.pory"
SevenIsland_TrainerTower_OnTransition::
# 7 "data/maps/SevenIsland_TrainerTower/scripts.pory"
	setvar VAR_MAP_SCENE_TRAINER_TOWER, 0
# 8 "data/maps/SevenIsland_TrainerTower/scripts.pory"
	end
# 9 "data/maps/SevenIsland_TrainerTower/scripts.pory"

# 10 "data/maps/SevenIsland_TrainerTower/scripts.pory"
SevenIsland_TrainerTower_EventScript_TrainerTowerSign::
# 11 "data/maps/SevenIsland_TrainerTower/scripts.pory"
	msgbox SevenIsland_TrainerTower_Text_TrainerTowerSign, MSGBOX_SIGN
# 12 "data/maps/SevenIsland_TrainerTower/scripts.pory"
	end
# 13 "data/maps/SevenIsland_TrainerTower/scripts.pory"

# 14 "data/maps/SevenIsland_TrainerTower/scripts.pory"
SevenIsland_TrainerTower_EventScript_TrainerTowerAheadSign::
# 15 "data/maps/SevenIsland_TrainerTower/scripts.pory"
	msgbox SevenIsland_TrainerTower_Text_TrainerTowerAhead, MSGBOX_SIGN
# 16 "data/maps/SevenIsland_TrainerTower/scripts.pory"
	end
