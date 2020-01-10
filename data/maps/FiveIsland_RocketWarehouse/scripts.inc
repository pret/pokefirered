FiveIsland_RocketWarehouse_MapScripts:: @ 8163F2E
	map_script MAP_SCRIPT_ON_LOAD, FiveIsland_RocketWarehouse_OnLoad
	map_script MAP_SCRIPT_ON_TRANSITION, FiveIsland_RocketWarehouse_OnTransition
	.byte 0

FiveIsland_RocketWarehouse_OnTransition:: @ 8163F39
	setworldmapflag FLAG_WORLD_MAP_FIVE_ISLAND_ROCKET_WAREHOUSE
	end

FiveIsland_RocketWarehouse_OnLoad:: @ 8163F3D
	checktrainerflag TRAINER_TEAM_ROCKET_ADMIN
	call_if_eq EventScript_163F47
	end

EventScript_163F47:: @ 8163F47
	setmetatile 26, 20, 672, 0
	setmetatile 27, 20, 672, 0
	return

FiveIsland_RocketWarehouse_EventScript_163F5A:: @ 8163F5A
	lockall
	goto_if_set FLAG_DEFEATED_ROCKETS_IN_WAREHOUSE, EventScript_163F6E
	msgbox gUnknown_817B4E3
	releaseall
	end

EventScript_163F6E:: @ 8163F6E
	msgbox gUnknown_817B512
	releaseall
	end

FiveIsland_RocketWarehouse_EventScript_163F78:: @ 8163F78
	msgbox gUnknown_817BB15, MSGBOX_SIGN
	end

FiveIsland_RocketWarehouse_EventScript_163F81:: @ 8163F81
	lockall
	applymovement 4, Movement_WalkInPlaceFastestLeft
	waitmovement 0
	setvar VAR_MAP_SCENE_ROCKET_WAREHOUSE, 1
	releaseall
	end

FiveIsland_RocketWarehouse_EventScript_163F93:: @ 8163F93
	trainerbattle_single TRAINER_SCIENTIST_GIDEON, Text_17BBAF, Text_17BC55, EventScript_163FCD
	goto_if_set FLAG_SYS_CAN_LINK_WITH_RS, EventScript_163FB7
	msgbox gUnknown_817BCA3, MSGBOX_AUTOCLOSE
	end

EventScript_163FB7:: @ 8163FB7
	famechecker FAMECHECKER_GIOVANNI, 5
	msgbox gUnknown_817BCD7, MSGBOX_AUTOCLOSE
	end

EventScript_163FCD:: @ 8163FCD
	msgbox gUnknown_817BC6C
	setflag FLAG_RECOVERED_SAPPHIRE
	giveitem ITEM_SAPPHIRE
	release
	end

FiveIsland_RocketWarehouse_EventScript_163FE6:: @ 8163FE6
	trainerbattle_single TRAINER_TEAM_ROCKET_GRUNT_47, Text_17B54D, Text_17B585
	msgbox gUnknown_817B5A6, MSGBOX_AUTOCLOSE
	end

FiveIsland_RocketWarehouse_EventScript_163FFD:: @ 8163FFD
	trainerbattle_single TRAINER_TEAM_ROCKET_GRUNT_48, Text_17B677, Text_17B6D9
	msgbox gUnknown_817B6EF, MSGBOX_AUTOCLOSE
	end

FiveIsland_RocketWarehouse_EventScript_164014:: @ 8164014
	trainerbattle_single TRAINER_TEAM_ROCKET_ADMIN_2, Text_17B8DA, Text_17B9FB, EventScript_16402F
	msgbox gUnknown_817BA64, MSGBOX_AUTOCLOSE
	end

EventScript_16402F:: @ 816402F
	getplayerxy VAR_0x8004, VAR_0x8005
	compare VAR_0x8004, 24
	call_if_le EventScript_164065
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
	applymovement OBJ_EVENT_ID_PLAYER, Movement_WalkInPlaceFastestRight
	waitmovement 0
	return

FiveIsland_RocketWarehouse_EventScript_164070:: @ 8164070
	trainerbattle_single TRAINER_TEAM_ROCKET_GRUNT_42, Text_17B5D6, Text_17B62F
	msgbox gUnknown_817B642, MSGBOX_AUTOCLOSE
	end

FiveIsland_RocketWarehouse_EventScript_164087:: @ 8164087
	trainerbattle_single TRAINER_TEAM_ROCKET_ADMIN, Text_17B72D, Text_17B79C, EventScript_1640A2
	msgbox gUnknown_817B7FA, MSGBOX_AUTOCLOSE
	end

EventScript_1640A2:: @ 81640A2
	getplayerxy VAR_0x8004, VAR_0x8005
	specialvar VAR_RESULT, GetPlayerFacingDirection
	compare VAR_RESULT, DIR_NORTH
	call_if_eq EventScript_16412E
	msgbox gUnknown_817B7AE
	closemessage
	compare VAR_0x8004, 24
	call_if_le EventScript_164144
	compare VAR_0x8004, 25
	call_if_eq EventScript_16414F
	compare VAR_0x8004, 26
	call_if_eq EventScript_16415A
	compare VAR_0x8004, 27
	call_if_eq EventScript_16415A
	playse SE_PIN
	call EventScript_163F47
	special DrawWholeMapView
	waitse
	compare VAR_0x8004, 24
	call_if_le EventScript_164165
	compare VAR_0x8004, 25
	call_if_eq EventScript_164165
	compare VAR_0x8004, 26
	call_if_eq EventScript_164165
	compare VAR_0x8004, 27
	call_if_eq EventScript_164170
	msgbox gUnknown_817B7FA
	release
	end

EventScript_16412E:: @ 816412E
	compare VAR_0x8004, 27
	goto_if_eq EventScript_1A77A9
	applymovement OBJ_EVENT_ID_PLAYER, Movement_WalkInPlaceFastestRight
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
	applymovement 3, Movement_WalkInPlaceFastestUp
	waitmovement 0
	return

EventScript_164165:: @ 8164165
	applymovement 3, Movement_WalkInPlaceFastestLeft
	waitmovement 0
	return

EventScript_164170:: @ 8164170
	applymovement 3, Movement_WalkInPlaceFastestDown
	waitmovement 0
	return

Movement_16417B:: @ 816417B
	walk_right
	walk_right
	walk_in_place_fastest_up
	step_end

Movement_16417F:: @ 816417F
	walk_right
	walk_in_place_fastest_up
	step_end
