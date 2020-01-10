RocketHideout_B4F_MapScripts:: @ 81612E8
	map_script MAP_SCRIPT_ON_LOAD, RocketHideout_B4F_OnLoad
	.byte 0

RocketHideout_B4F_OnLoad:: @ 81612EE
	setvar VAR_TEMP_1, 0
	call_if_defeated TRAINER_TEAM_ROCKET_GRUNT_16, EventScript_161311
	call_if_defeated TRAINER_TEAM_ROCKET_GRUNT_17, EventScript_161311
	compare VAR_TEMP_1, 2
	call_if_ne EventScript_16146A
	end

EventScript_161311:: @ 8161311
	addvar VAR_TEMP_1, 1
	return

RocketHideout_B4F_EventScript_161317:: @ 8161317
	lock
	faceplayer
	famechecker FAMECHECKER_GIOVANNI, 0
	message Text_175226
	waitmessage
	playbgm MUS_ROCKET, 0
	waitbuttonpress
	trainerbattle_no_intro TRAINER_BOSS_GIOVANNI, Text_175318
	msgbox gUnknown_817532D
	fadescreen FADE_TO_BLACK
	closemessage
	removeobject 1
	addobject 2
	clearflag FLAG_HIDE_SILPH_SCOPE
	setflag FLAG_HIDE_CELADON_ROCKETS
	famechecker FAMECHECKER_GIOVANNI, FCPICKSTATE_COLORED, UpdatePickStateFromSpecialVar8005
	fadescreen FADE_FROM_BLACK
	release
	end

RocketHideout_B4F_EventScript_161363:: @ 8161363
	lock
	faceplayer
	removeobject 2
	giveitem ITEM_SILPH_SCOPE
	compare VAR_RESULT, FALSE
	goto_if_eq EventScript_BagIsFull
	release
	end

RocketHideout_B4F_EventScript_161381:: @ 8161381
	trainerbattle_single TRAINER_TEAM_ROCKET_GRUNT_18, Text_175488, Text_1754B9, EventScript_16139D
	msgbox gUnknown_81754BD
	release
	end

EventScript_16139D:: @ 816139D
	msgbox gUnknown_81754BD
	addobject 4
	clearflag FLAG_HIDE_LIFT_KEY
	release
	end

RocketHideout_B4F_EventScript_1613AD:: @ 81613AD
	lock
	faceplayer
	setflag FLAG_CAN_USE_ROCKET_HIDEOUT_LIFT
	removeobject 4
	giveitem ITEM_LIFT_KEY
	compare VAR_RESULT, FALSE
	goto_if_eq EventScript_BagIsFull
	release
	end

RocketHideout_B4F_EventScript_1613CE:: @ 81613CE
	trainerbattle_single TRAINER_TEAM_ROCKET_GRUNT_16, Text_1753D0, Text_1753FE, EventScript_1613E9
	msgbox gUnknown_817540C, MSGBOX_AUTOCLOSE
	end

EventScript_1613E9:: @ 81613E9
	setvar VAR_TEMP_1, 0
	call_if_defeated TRAINER_TEAM_ROCKET_GRUNT_16, EventScript_161311
	call_if_defeated TRAINER_TEAM_ROCKET_GRUNT_17, EventScript_161311
	compare VAR_TEMP_1, 2
	call_if_eq EventScript_1614A1
	compare VAR_TEMP_1, 2
	call_if_eq EventScript_161462
	release
	end

RocketHideout_B4F_EventScript_161418:: @ 8161418
	trainerbattle_single TRAINER_TEAM_ROCKET_GRUNT_17, Text_175437, Text_175463, EventScript_161433
	msgbox gUnknown_817546A, MSGBOX_AUTOCLOSE
	end

EventScript_161433:: @ 8161433
	setvar VAR_TEMP_1, 0
	call_if_defeated TRAINER_TEAM_ROCKET_GRUNT_16, EventScript_161311
	call_if_defeated TRAINER_TEAM_ROCKET_GRUNT_17, EventScript_161311
	compare VAR_TEMP_1, 2
	call_if_eq EventScript_1614A1
	compare VAR_TEMP_1, 2
	call_if_eq EventScript_161462
	release
	end

EventScript_161462:: @ 8161462
	playse SE_KI_GASYAN
	special DrawWholeMapView
	waitse
	return

EventScript_16146A:: @ 816146A
	setmetatile 17, 12, 718, 1
	setmetatile 18, 12, 719, 1
	setmetatile 17, 13, 726, 1
	setmetatile 18, 13, 727, 1
	setmetatile 17, 14, 642, 0
	setmetatile 18, 14, 642, 0
	return

EventScript_1614A1:: @ 81614A1
	setmetatile 17, 12, 642, 0
	setmetatile 18, 12, 641, 0
	setmetatile 17, 13, 642, 0
	setmetatile 18, 13, 641, 0
	setmetatile 17, 14, 642, 0
	setmetatile 18, 14, 641, 0
	return
