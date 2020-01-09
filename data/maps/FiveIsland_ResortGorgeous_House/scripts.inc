FiveIsland_ResortGorgeous_House_MapScripts:: @ 8171EBD
	.byte 0

FiveIsland_ResortGorgeous_House_EventScript_171EBE:: @ 8171EBE
	special sub_8110AB4
	compare VAR_RESULT, 2
	goto_if eq, EventScript_1A7AE0
	special sub_8112364
	lock
	faceplayer
	checkflag FLAG_TEMP_2
	goto_if TRUE, EventScript_172043
	compare VAR_RESORT_GORGEOUS_REQUESTED_MON, 0xFFFF
	goto_if eq, EventScript_171F0B
	compare VAR_RESORT_GORGEOUS_REQUESTED_MON, SPECIES_NONE
	goto_if ne, EventScript_171F19
	msgbox gUnknown_81A42A0
	goto EventScript_171EFE
	end

EventScript_171EFE:: @ 8171EFE
	special Special_SampleResortGorgeousMonAndReward
	msgbox gUnknown_81A4315
	release
	end

EventScript_171F0B:: @ 8171F0B
	msgbox gUnknown_81A437A
	goto EventScript_171EFE
	end

EventScript_171F19:: @ 8171F19
	copyvar VAR_0x8004, VAR_RESORT_GORGEOUS_REQUESTED_MON
	specialvar VAR_RESULT, Special_PlayerPartyContainsSpecies
	compare VAR_RESULT, 1
	goto_if eq, EventScript_171F34
	goto EventScript_171EFE
	end

EventScript_171F34:: @ 8171F34
	special Special_SampleResortGorgeousMonAndReward
	msgbox gUnknown_81A43F7
	addobject 2
	applymovement 2, Movement_172060
	waitmovement 0
	textcolor 0
	msgbox gUnknown_81A450B
	applymovement 1, Movement_WalkInPlaceFastestUp
	waitmovement 0
	textcolor 1
	msgbox gUnknown_81A4521
	textcolor 0
	msgbox gUnknown_81A4566
	closemessage
	compare VAR_FACING, 2
	call_if eq, EventScript_171FCD
	compare VAR_FACING, 1
	call_if eq, EventScript_171FE9
	compare VAR_FACING, 4
	call_if eq, EventScript_171FFE
	compare VAR_FACING, 3
	call_if eq, EventScript_17201A
	moveobjectoffscreen 2
	msgbox gUnknown_81A458E
	giveitem VAR_RESORT_GORGEOUS_REWARD
	compare VAR_RESULT, 0
	goto_if eq, EventScript_172025
	setflag FLAG_TEMP_2
	setvar VAR_RESORT_GORGEOUS_REQUESTED_MON, 0
	release
	end

EventScript_171FCD:: @ 8171FCD
	applymovement 1, Movement_WalkInPlaceFastestDown
	applymovement 2, Movement_17204D
	waitmovement 0
	applymovement OBJ_EVENT_ID_PLAYER, Movement_WalkInPlaceFastestLeft
	waitmovement 0
	return

EventScript_171FE9:: @ 8171FE9
	applymovement 2, Movement_172055
	waitmovement 0
	applymovement OBJ_EVENT_ID_PLAYER, Movement_WalkInPlaceFastestUp
	waitmovement 0
	return

EventScript_171FFE:: @ 8171FFE
	applymovement 1, Movement_WalkInPlaceFastestLeft
	applymovement 2, Movement_172059
	waitmovement 0
	applymovement OBJ_EVENT_ID_PLAYER, Movement_WalkInPlaceFastestUp
	waitmovement 0
	return

EventScript_17201A:: @ 817201A
	applymovement 2, Movement_17205E
	waitmovement 0
	return

EventScript_172025:: @ 8172025
	textcolor 0
	msgbox gUnknown_81A45E8
	textcolor 1
	msgbox gUnknown_81A461B
	setflag FLAG_TEMP_2
	setvar VAR_RESORT_GORGEOUS_REQUESTED_MON, 0
	release
	end

EventScript_172043:: @ 8172043
	msgbox gUnknown_81A4632
	release
	end

Movement_17204D:: @ 817204D
	walk_left
	walk_left
	walk_left
	walk_down
	walk_down
	walk_down
	walk_in_place_fastest_right
	step_end

Movement_172055:: @ 8172055
	walk_left
	walk_left
	walk_in_place_fastest_down
	step_end

Movement_172059:: @ 8172059
	walk_left
	walk_left
	walk_left
	walk_down
	step_end

Movement_17205E:: @ 817205E
	walk_up
	step_end

Movement_172060:: @ 8172060
	walk_in_place_down
	step_end

FiveIsland_ResortGorgeous_House_EventScript_172062:: @ 8172062
	msgbox gUnknown_81A4657, 2
	end
