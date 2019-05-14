RocketHideout_Elevator_MapScripts:: @ 81614D8
	.byte 0

RocketHideout_Elevator_EventScript_1614D9:: @ 81614D9
	lockall
	checkflag FLAG_0x2A5
	goto_if 0, EventScript_16161B
	setvar VAR_0x8004, 2
	checkflag FLAG_0x002
	call_if 0, EventScript_1A7AB9
	copyvar VAR_0x8005, VAR_0x403A
	special sub_80CB580
	message Text_1A535C
	waitmessage
	setvar VAR_0x8004, 2
	specialvar VAR_RESULT, sub_80CB328
	copyvar VAR_0x8000, VAR_RESULT
	compare_var_to_value VAR_0x8000, 0
	goto_if 1, EventScript_161530
	compare_var_to_value VAR_0x8000, 1
	goto_if 1, EventScript_16153C
	compare_var_to_value VAR_0x8000, 2
	goto_if 1, EventScript_161548
	end

EventScript_161530:: @ 8161530
	multichoicedefault 0, 0, 42, 0, 0
	goto EventScript_161554

EventScript_16153B:: @ 816153B
	end

EventScript_16153C:: @ 816153C
	multichoicedefault 0, 0, 42, 1, 0
	goto EventScript_161554

EventScript_161547:: @ 8161547
	end

EventScript_161548:: @ 8161548
	multichoicedefault 0, 0, 42, 2, 0
	goto EventScript_161554

EventScript_161553:: @ 8161553
	end

EventScript_161554:: @ 8161554
	copyvar VAR_0x8000, VAR_RESULT
	compare_var_to_value VAR_0x8000, 0
	goto_if 1, EventScript_161591
	compare_var_to_value VAR_0x8000, 1
	goto_if 1, EventScript_1615B9
	compare_var_to_value VAR_0x8000, 2
	goto_if 1, EventScript_1615E1
	compare_var_to_value VAR_0x8000, 3
	goto_if 1, EventScript_161609
	compare_var_to_value VAR_0x8000, 127
	goto_if 1, EventScript_161609
	end

EventScript_161591:: @ 8161591
	setvar VAR_0x8006, 3
	setdynamicwarp MAP_ROCKET_HIDEOUT_B1F, 255, 24, 25
	compare_var_to_value VAR_0x403A, 3
	goto_if 1, EventScript_161609
	call EventScript_16160E
	setvar VAR_0x403A, 3
	goto EventScript_161609

EventScript_1615B8:: @ 81615B8
	end

EventScript_1615B9:: @ 81615B9
	setvar VAR_0x8006, 2
	setdynamicwarp MAP_ROCKET_HIDEOUT_B2F, 255, 28, 16
	compare_var_to_value VAR_0x403A, 2
	goto_if 1, EventScript_161609
	call EventScript_16160E
	setvar VAR_0x403A, 2
	goto EventScript_161609

EventScript_1615E0:: @ 81615E0
	end

EventScript_1615E1:: @ 81615E1
	setvar VAR_0x8006, 0
	setdynamicwarp MAP_ROCKET_HIDEOUT_B4F, 255, 20, 23
	compare_var_to_value VAR_0x403A, 0
	goto_if 1, EventScript_161609
	call EventScript_16160E
	setvar VAR_0x403A, 0
	goto EventScript_161609

EventScript_161608:: @ 8161608
	end

EventScript_161609:: @ 8161609
	special sub_80CB63C
	releaseall
	end

EventScript_16160E:: @ 816160E
	special sub_80CB63C
	closemessage
	waitse
	special sub_80CB498
	waitstate
	setflag FLAG_0x002
	return

EventScript_16161B:: @ 816161B
	loadword 0, gUnknown_81754DD
	callstd 4
	releaseall
	end
