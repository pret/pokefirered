RocketHideout_B1F_MapScripts:: @ 8161195
	map_script 1, RocketHideout_B1F_MapScript1_1611A0
	map_script 3, RocketHideout_B1F_MapScript2_1611AA
	.byte 0

RocketHideout_B1F_MapScript1_1611A0:: @ 81611A0
	checktrainerflag TRAINER_TEAM_ROCKET_GRUNT_12
	call_if 0, EventScript_161233
	end

RocketHideout_B1F_MapScript2_1611AA:: @ 81611AA
	setworldmapflag FLAG_WORLD_MAP_ROCKET_HIDEOUT_B1F
	end

RocketHideout_B1F_EventScript_1611AE:: @ 81611AE
	trainerbattle 0, TRAINER_TEAM_ROCKET_GRUNT_8, 0, Text_174ECA, Text_174EED
	msgbox gUnknown_8174EFA, 6
	end

RocketHideout_B1F_EventScript_1611C5:: @ 81611C5
	trainerbattle 0, TRAINER_TEAM_ROCKET_GRUNT_9, 0, Text_174F2C, Text_174F60
	msgbox gUnknown_8174F66, 6
	end

RocketHideout_B1F_EventScript_1611DC:: @ 81611DC
	trainerbattle 0, TRAINER_TEAM_ROCKET_GRUNT_10, 0, Text_174F94, Text_174FA4
	msgbox gUnknown_8174FB3, 6
	end

RocketHideout_B1F_EventScript_1611F3:: @ 81611F3
	trainerbattle 0, TRAINER_TEAM_ROCKET_GRUNT_11, 0, Text_174FE1, Text_174FF8
	msgbox gUnknown_8175007, 6
	end

RocketHideout_B1F_EventScript_16120A:: @ 816120A
	trainerbattle 2, TRAINER_TEAM_ROCKET_GRUNT_12, 0, Text_17503A, Text_17505A, EventScript_161225
	msgbox gUnknown_8175060, 6
	end

EventScript_161225:: @ 8161225
	call EventScript_16126A
	playse SE_KI_GASYAN
	special DrawWholeMapView
	waitse
	release
	end

EventScript_161233:: @ 8161233
	setmetatile 20, 19, 718, 1
	setmetatile 21, 19, 719, 1
	setmetatile 20, 20, 726, 1
	setmetatile 21, 20, 727, 1
	setmetatile 20, 21, 642, 0
	setmetatile 21, 21, 642, 0
	return

EventScript_16126A:: @ 816126A
	setmetatile 20, 19, 642, 0
	setmetatile 21, 19, 641, 0
	setmetatile 20, 20, 642, 0
	setmetatile 21, 20, 641, 0
	setmetatile 20, 21, 642, 0
	setmetatile 21, 21, 641, 0
	return
