FiveIsland_RocketWarehouse_MapScripts:: @ 8163F2E
	map_script 1, FiveIsland_RocketWarehouse_MapScript1_163F3D
	map_script 3, FiveIsland_RocketWarehouse_MapScript2_163F39
	.byte 0

FiveIsland_RocketWarehouse_MapScript2_163F39:: @ 8163F39
	setworldmapflag FLAG_WORLD_MAP_FIVE_ISLAND_ROCKET_WAREHOUSE
	end

FiveIsland_RocketWarehouse_MapScript1_163F3D:: @ 8163F3D
	checktrainerflag TRAINER_TEAM_ROCKET_ADMIN
	call_if eq, EventScript_163F47
	end

EventScript_163F47:: @ 8163F47
	setmetatile 26, 20, 672, 0
	setmetatile 27, 20, 672, 0
	return

FiveIsland_RocketWarehouse_EventScript_163F5A:: @ 8163F5A
	lockall
	checkflag FLAG_DEFEATED_ROCKETS_IN_WAREHOUSE
	goto_if TRUE, EventScript_163F6E
	msgbox gUnknown_817B4E3
	releaseall
	end

EventScript_163F6E:: @ 8163F6E
	msgbox gUnknown_817B512
	releaseall
	end

FiveIsland_RocketWarehouse_EventScript_163F78:: @ 8163F78
	msgbox gUnknown_817BB15, 3
	end

FiveIsland_RocketWarehouse_EventScript_163F81:: @ 8163F81
	lockall
	applymovement 4, Movement_1A75E7
	waitmovement 0
	setvar VAR_MAP_SCENE_ROCKET_WAREHOUSE, 1
	releaseall
	end

FiveIsland_RocketWarehouse_EventScript_163F93:: @ 8163F93
	trainerbattle 2, TRAINER_SCIENTIST_GIDEON, 0, Text_17BBAF, Text_17BC55, EventScript_163FCD
	checkflag FLAG_SYS_CAN_LINK_WITH_RS
	goto_if TRUE, EventScript_163FB7
	msgbox gUnknown_817BCA3, 6
	end

EventScript_163FB7:: @ 8163FB7
	famechecker FAMECHECKER_GIOVANNI, 5
	msgbox gUnknown_817BCD7, 6
	end

EventScript_163FCD:: @ 8163FCD
	msgbox gUnknown_817BC6C
	setflag FLAG_RECOVERED_SAPPHIRE
	giveitem ITEM_SAPPHIRE
	release
	end

FiveIsland_RocketWarehouse_EventScript_163FE6:: @ 8163FE6
	trainerbattle 0, TRAINER_TEAM_ROCKET_GRUNT_47, 0, Text_17B54D, Text_17B585
	msgbox gUnknown_817B5A6, 6
	end

FiveIsland_RocketWarehouse_EventScript_163FFD:: @ 8163FFD
	trainerbattle 0, TRAINER_TEAM_ROCKET_GRUNT_48, 0, Text_17B677, Text_17B6D9
	msgbox gUnknown_817B6EF, 6
	end

FiveIsland_RocketWarehouse_EventScript_164014:: @ 8164014
	trainerbattle 2, TRAINER_TEAM_ROCKET_ADMIN_2, 0, Text_17B8DA, Text_17B9FB, EventScript_16402F
	msgbox gUnknown_817BA64, 6
	end

EventScript_16402F:: @ 816402F
	getplayerxy VAR_0x8004, VAR_0x8005
	compare_var_to_value VAR_0x8004, 24
	call_if le, EventScript_164065
	msgbox gUnknown_817BA64
	closemessage
	fadescreen 1
	removeobject 1
	removeobject 2
	removeobject 4
	removeobject 3
	setflag FLAG_HIDE_FIVE_ISLAND_ROCKETS
	fadescreen 0
	setvar VAR_MAP_SCENE_ROCKET_WAREHOUSE, 1
	setflag FLAG_DEFEATED_ROCKETS_IN_WAREHOUSE
	release
	end

EventScript_164065:: @ 8164065
	applymovement 255, Movement_1A75EB
	waitmovement 0
	return

FiveIsland_RocketWarehouse_EventScript_164070:: @ 8164070
	trainerbattle 0, TRAINER_TEAM_ROCKET_GRUNT_42, 0, Text_17B5D6, Text_17B62F
	msgbox gUnknown_817B642, 6
	end

FiveIsland_RocketWarehouse_EventScript_164087:: @ 8164087
	trainerbattle 2, TRAINER_TEAM_ROCKET_ADMIN, 0, Text_17B72D, Text_17B79C, EventScript_1640A2
	msgbox gUnknown_817B7FA, 6
	end

EventScript_1640A2:: @ 81640A2
	getplayerxy VAR_0x8004, VAR_0x8005
	specialvar VAR_RESULT, GetPlayerFacingDirection
	compare_var_to_value VAR_RESULT, 2
	call_if eq, EventScript_16412E
	msgbox gUnknown_817B7AE
	closemessage
	compare_var_to_value VAR_0x8004, 24
	call_if le, EventScript_164144
	compare_var_to_value VAR_0x8004, 25
	call_if eq, EventScript_16414F
	compare_var_to_value VAR_0x8004, 26
	call_if eq, EventScript_16415A
	compare_var_to_value VAR_0x8004, 27
	call_if eq, EventScript_16415A
	playse SE_PIN
	call EventScript_163F47
	special DrawWholeMapView
	waitse
	compare_var_to_value VAR_0x8004, 24
	call_if le, EventScript_164165
	compare_var_to_value VAR_0x8004, 25
	call_if eq, EventScript_164165
	compare_var_to_value VAR_0x8004, 26
	call_if eq, EventScript_164165
	compare_var_to_value VAR_0x8004, 27
	call_if eq, EventScript_164170
	msgbox gUnknown_817B7FA
	release
	end

EventScript_16412E:: @ 816412E
	compare_var_to_value VAR_0x8004, 27
	goto_if eq, EventScript_1A77A9
	applymovement 255, Movement_1A75EB
	waitmovement 0
	return

EventScript_164144:: @ 8164144
	applymovement 3, Movement_16417B
	waitmovement 0
	return

EventScript_16414F:: @ 816414F
	applymovement 3, Movement_16417F
	waitmovement 0
	return

EventScript_16415A:: @ 816415A
	applymovement 3, Movement_1A75E9
	waitmovement 0
	return

EventScript_164165:: @ 8164165
	applymovement 3, Movement_1A75E7
	waitmovement 0
	return

EventScript_164170:: @ 8164170
	applymovement 3, Movement_1A75ED
	waitmovement 0
	return

Movement_16417B:: @ 816417B
	step_13
	step_13
	step_2e
	step_end

Movement_16417F:: @ 816417F
	step_13
	step_2e
	step_end
