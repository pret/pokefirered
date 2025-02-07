# 1 "data/maps/FiveIsland_Meadow/scripts.pory"

# 2 "data/maps/FiveIsland_Meadow/scripts.pory"
FiveIsland_Meadow_MapScripts::
# 3 "data/maps/FiveIsland_Meadow/scripts.pory"
	map_script MAP_SCRIPT_ON_LOAD, FiveIsland_Meadow_OnLoad
# 4 "data/maps/FiveIsland_Meadow/scripts.pory"
	.byte 0
# 5 "data/maps/FiveIsland_Meadow/scripts.pory"

# 6 "data/maps/FiveIsland_Meadow/scripts.pory"
FiveIsland_Meadow_OnLoad::
# 7 "data/maps/FiveIsland_Meadow/scripts.pory"
	call_if_set FLAG_UNLOCKED_ROCKET_WAREHOUSE, FiveIsland_Meadow_EventScript_SetWarehouseDoorUnlocked
# 8 "data/maps/FiveIsland_Meadow/scripts.pory"
	end
# 9 "data/maps/FiveIsland_Meadow/scripts.pory"

# 10 "data/maps/FiveIsland_Meadow/scripts.pory"
FiveIsland_Meadow_EventScript_WarehouseDoor::
# 11 "data/maps/FiveIsland_Meadow/scripts.pory"
	lockall
# 12 "data/maps/FiveIsland_Meadow/scripts.pory"
	goto_if_set FLAG_UNLOCKED_ROCKET_WAREHOUSE, FiveIsland_Meadow_EventScript_WarehouseDoorAlreadyOpen
# 13 "data/maps/FiveIsland_Meadow/scripts.pory"
	goto_if_set FLAG_LEARNED_YES_NAH_CHANSEY, FiveIsland_Meadow_EventScript_OpenWarehouseDoor
# 14 "data/maps/FiveIsland_Meadow/scripts.pory"
	msgbox FiveIsland_Meadow_Text_EnteredPasswordAnotherNeeded
# 15 "data/maps/FiveIsland_Meadow/scripts.pory"
	releaseall
# 16 "data/maps/FiveIsland_Meadow/scripts.pory"
	end
# 17 "data/maps/FiveIsland_Meadow/scripts.pory"

# 18 "data/maps/FiveIsland_Meadow/scripts.pory"
FiveIsland_Meadow_EventScript_OpenWarehouseDoor::
# 19 "data/maps/FiveIsland_Meadow/scripts.pory"
	setflag FLAG_UNLOCKED_ROCKET_WAREHOUSE
# 20 "data/maps/FiveIsland_Meadow/scripts.pory"
	message FiveIsland_Meadow_Text_EnteredPasswordDoorOpened
# 21 "data/maps/FiveIsland_Meadow/scripts.pory"
	waitmessage
# 22 "data/maps/FiveIsland_Meadow/scripts.pory"
	delay 60
# 23 "data/maps/FiveIsland_Meadow/scripts.pory"
	call FiveIsland_Meadow_EventScript_SetWarehouseDoorUnlocked
# 24 "data/maps/FiveIsland_Meadow/scripts.pory"
	special DrawWholeMapView
# 25 "data/maps/FiveIsland_Meadow/scripts.pory"
	playse SE_PIN
# 26 "data/maps/FiveIsland_Meadow/scripts.pory"
	waitse
# 27 "data/maps/FiveIsland_Meadow/scripts.pory"
	releaseall
# 28 "data/maps/FiveIsland_Meadow/scripts.pory"
	end
# 29 "data/maps/FiveIsland_Meadow/scripts.pory"

# 30 "data/maps/FiveIsland_Meadow/scripts.pory"
FiveIsland_Meadow_EventScript_WarehouseDoorAlreadyOpen::
# 31 "data/maps/FiveIsland_Meadow/scripts.pory"
	msgbox FiveIsland_Meadow_Text_WarehouseDoorAlreadyOpen
# 32 "data/maps/FiveIsland_Meadow/scripts.pory"
	releaseall
# 33 "data/maps/FiveIsland_Meadow/scripts.pory"
	end
# 34 "data/maps/FiveIsland_Meadow/scripts.pory"

# 35 "data/maps/FiveIsland_Meadow/scripts.pory"
FiveIsland_Meadow_EventScript_SetWarehouseDoorUnlocked::
# 36 "data/maps/FiveIsland_Meadow/scripts.pory"
	setmetatile 12, 21, METATILE_SeviiIslands45_RocketWarehouseDoor_Unlocked, 1
# 37 "data/maps/FiveIsland_Meadow/scripts.pory"
	return
# 38 "data/maps/FiveIsland_Meadow/scripts.pory"

# 39 "data/maps/FiveIsland_Meadow/scripts.pory"
FiveIsland_Meadow_EventScript_Rocket1::
# 40 "data/maps/FiveIsland_Meadow/scripts.pory"
	trainerbattle_single TRAINER_TEAM_ROCKET_GRUNT_49, FiveIsland_Meadow_Text_Rocket1Intro, FiveIsland_Meadow_Text_Rocket1Defeat
# 41 "data/maps/FiveIsland_Meadow/scripts.pory"
	msgbox FiveIsland_Meadow_Text_Rocket1PostBattle, MSGBOX_AUTOCLOSE
# 42 "data/maps/FiveIsland_Meadow/scripts.pory"
	end
# 43 "data/maps/FiveIsland_Meadow/scripts.pory"

# 44 "data/maps/FiveIsland_Meadow/scripts.pory"
FiveIsland_Meadow_EventScript_Rocket2::
# 45 "data/maps/FiveIsland_Meadow/scripts.pory"
	trainerbattle_single TRAINER_TEAM_ROCKET_GRUNT_50, FiveIsland_Meadow_Text_Rocket2Intro, FiveIsland_Meadow_Text_Rocket2Defeat
# 46 "data/maps/FiveIsland_Meadow/scripts.pory"
	msgbox FiveIsland_Meadow_Text_Rocket2PostBattle, MSGBOX_AUTOCLOSE
# 47 "data/maps/FiveIsland_Meadow/scripts.pory"
	end
# 48 "data/maps/FiveIsland_Meadow/scripts.pory"

# 49 "data/maps/FiveIsland_Meadow/scripts.pory"
FiveIsland_Meadow_EventScript_Rocket3::
# 50 "data/maps/FiveIsland_Meadow/scripts.pory"
	trainerbattle_single TRAINER_TEAM_ROCKET_GRUNT_51, FiveIsland_Meadow_Text_Rocket3Intro, FiveIsland_Meadow_Text_Rocket3Defeat
# 51 "data/maps/FiveIsland_Meadow/scripts.pory"
	msgbox FiveIsland_Meadow_Text_Rocket3PostBattle, MSGBOX_AUTOCLOSE
# 52 "data/maps/FiveIsland_Meadow/scripts.pory"
	end
