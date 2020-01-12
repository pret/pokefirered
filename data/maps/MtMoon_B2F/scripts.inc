MtMoon_B2F_MapScripts:: @ 8160699
	map_script MAP_SCRIPT_ON_TRANSITION, MtMoon_B2F_OnTransition
	.byte 0

MtMoon_B2F_OnTransition:: @ 816069F
	call_if_unset FLAG_GOT_FOSSIL_FROM_MT_MOON, EventScript_1606A9
	end

EventScript_1606A9:: @ 81606A9
	clearflag FLAG_HIDE_DOME_FOSSIL
	clearflag FLAG_HIDE_HELIX_FOSSIL
	return

MtMoon_B2F_EventScript_1606B0:: @ 81606B0
	lockall
	applymovement 3, Movement_WalkInPlaceFastestRight
	waitmovement 0
	call EventScript_1606DD
	releaseall
	end

MtMoon_B2F_EventScript_1606C2:: @ 81606C2
	lock
	faceplayer
	goto_if_set FLAG_GOT_FOSSIL_FROM_MT_MOON, EventScript_160707
	goto_if_defeated TRAINER_SUPER_NERD_MIGUEL, EventScript_160711
	call EventScript_1606DD
	release
	end

EventScript_1606DD:: @ 81606DD
	textcolor 0
	message Text_172B64
	waitmessage
	playbgm MUS_EXEYE, 0
	waitbuttonpress
	setvar VAR_LAST_TALKED, 3
	trainerbattle_no_intro TRAINER_SUPER_NERD_MIGUEL, Text_172B99
	setvar VAR_MAP_SCENE_MT_MOON_B2F, 1
	msgbox gUnknown_8172BAB
	return

EventScript_160707:: @ 8160707
	msgbox gUnknown_8172BFB
	release
	end

EventScript_160711:: @ 8160711
	msgbox gUnknown_8172BAB
	release
	end

MtMoon_B2F_EventScript_16071B:: @ 816071B
	lock
	faceplayer
	msgbox gUnknown_8172E77, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq EventScript_1607DE
	removeobject 1
	giveitem_msg gUnknown_8172ECD, ITEM_DOME_FOSSIL, 1, MUS_FAN5
	closemessage
	special sub_8112364
	delay 10
	applymovement 3, Movement_16077A
	waitmovement 0
	moveobjectoffscreen 3
	textcolor 0
	playfanfare MUS_FAN5
	message Text_172BD6
	waitmessage
	waitfanfare
	removeobject 2
	setflag FLAG_GOT_DOME_FOSSIL
	setflag FLAG_GOT_FOSSIL_FROM_MT_MOON
	release
	end

Movement_16077A:: @ 816077A
	walk_right
	walk_up
	walk_up
	walk_up
	step_end

MtMoon_B2F_EventScript_16077F:: @ 816077F
	lock
	faceplayer
	msgbox gUnknown_8172E94, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq EventScript_1607DE
	removeobject 2
	giveitem_msg gUnknown_8172EB2, ITEM_HELIX_FOSSIL, 1, MUS_FAN5
	closemessage
	special sub_8112364
	delay 10
	applymovement 3, Movement_1607E0
	waitmovement 0
	moveobjectoffscreen 3
	textcolor 0
	playfanfare MUS_FAN5
	message Text_172BD6
	waitmessage
	waitfanfare
	removeobject 1
	setflag FLAG_GOT_HELIX_FOSSIL
	setflag FLAG_GOT_FOSSIL_FROM_MT_MOON
	release
	end

EventScript_1607DE:: @ 81607DE
	release
	end

Movement_1607E0:: @ 81607E0
	walk_up
	walk_up
	walk_up
	step_end

MtMoon_B2F_EventScript_1607E4:: @ 81607E4
	trainerbattle_single TRAINER_TEAM_ROCKET_GRUNT, Text_172C5A, Text_172CB8
	msgbox gUnknown_8172CCB, MSGBOX_AUTOCLOSE
	end

MtMoon_B2F_EventScript_1607FB:: @ 81607FB
	trainerbattle_single TRAINER_TEAM_ROCKET_GRUNT_2, Text_172CFC, Text_172D46
	msgbox gUnknown_8172D51, MSGBOX_AUTOCLOSE
	end

MtMoon_B2F_EventScript_160812:: @ 8160812
	trainerbattle_single TRAINER_TEAM_ROCKET_GRUNT_3, Text_172D82, Text_172DAF
	msgbox gUnknown_8172DC1, MSGBOX_AUTOCLOSE
	end

MtMoon_B2F_EventScript_160829:: @ 8160829
	trainerbattle_single TRAINER_TEAM_ROCKET_GRUNT_4, Text_172DF0, Text_172E3E
	msgbox gUnknown_8172E4B, MSGBOX_AUTOCLOSE
	end
