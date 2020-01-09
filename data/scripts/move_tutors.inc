VictoryRoad_2F_EventScript_1C47AE:: @ 81C47AE
	lock
	faceplayer
	checkflag FLAG_TUTOR_DOUBLE_EDGE
	goto_if TRUE, EventScript_1C480C
	msgbox Text_1749F9, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if eq, EventScript_1C4802
	call EventScript_1C4F37
	compare VAR_RESULT, 0
	goto_if eq, EventScript_1C4802
	msgbox Text_174AE2
	setvar VAR_0x8005, MOVETUTOR_DOUBLE_EDGE
	call EventScript_1C4F30
	compare VAR_RESULT, 0
	goto_if eq, EventScript_1C4802
	setflag FLAG_TUTOR_DOUBLE_EDGE
	goto EventScript_1C480C
	end

EventScript_1C4802:: @ 81C4802
	msgbox Text_174ABC
	release
	end

EventScript_1C480C:: @ 81C480C
	msgbox Text_174B0C
	release
	end

EventScript_1C4816:: @ 81C4816
	lock
	faceplayer
	checkflag FLAG_TUTOR_THUNDER_WAVE
	goto_if TRUE, EventScript_1C4874
	msgbox Text_175711, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if eq, EventScript_1C486A
	call EventScript_1C4F37
	compare VAR_RESULT, 0
	goto_if eq, EventScript_1C486A
	msgbox Text_1757C1
	setvar VAR_0x8005, MOVETUTOR_THUNDER_WAVE
	call EventScript_1C4F30
	compare VAR_RESULT, 0
	goto_if eq, EventScript_1C486A
	setflag FLAG_TUTOR_THUNDER_WAVE
	goto EventScript_1C4874
	end

EventScript_1C486A:: @ 81C486A
	msgbox Text_17579D
	release
	end

EventScript_1C4874:: @ 81C4874
	msgbox Text_1757EC
	release
	end

RockTunnel_B1F_EventScript_1C487E:: @ 81C487E
	lock
	faceplayer
	checkflag FLAG_TUTOR_ROCK_SLIDE
	goto_if TRUE, EventScript_1C48DC
	msgbox Text_1799E0, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if eq, EventScript_1C48D2
	call EventScript_1C4F37
	compare VAR_RESULT, 0
	goto_if eq, EventScript_1C48D2
	msgbox Text_179AE1
	setvar VAR_0x8005, MOVETUTOR_ROCK_SLIDE
	call EventScript_1C4F30
	compare VAR_RESULT, 0
	goto_if eq, EventScript_1C48D2
	setflag FLAG_TUTOR_ROCK_SLIDE
	goto EventScript_1C48DC
	end

EventScript_1C48D2:: @ 81C48D2
	msgbox Text_179AC0
	release
	end

EventScript_1C48DC:: @ 81C48DC
	msgbox Text_179B0A
	release
	end

MtEmber_Exterior_EventScript_1C48E6:: @ 81C48E6
	lock
	faceplayer
	checkflag FLAG_TUTOR_EXPLOSION
	goto_if TRUE, EventScript_1C4944
	msgbox Text_17A642, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if eq, EventScript_1C493A
	call EventScript_1C4F37
	compare VAR_RESULT, 0
	goto_if eq, EventScript_1C493A
	msgbox Text_17A717
	setvar VAR_0x8005, MOVETUTOR_EXPLOSION
	call EventScript_1C4F30
	compare VAR_RESULT, 0
	goto_if eq, EventScript_1C493A
	setflag FLAG_TUTOR_EXPLOSION
	goto EventScript_1C4944
	end

EventScript_1C493A:: @ 81C493A
	msgbox Text_17A6ED
	release
	end

EventScript_1C4944:: @ 81C4944
	msgbox Text_17A756
	release
	end

Route4_EventScript_1C494E:: @ 81C494E
	lock
	faceplayer
	checkflag FLAG_TUTOR_META_PUNCH
	goto_if TRUE, EventScript_1C49AC
	msgbox Text_1839D5, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if eq, EventScript_1C49A2
	call EventScript_1C4F37
	compare VAR_RESULT, 0
	goto_if eq, EventScript_1C49A2
	msgbox Text_183ABF
	setvar VAR_0x8005, MOVETUTOR_MEGA_PUNCH
	call EventScript_1C4F30
	compare VAR_RESULT, 0
	goto_if eq, EventScript_1C49A2
	setflag FLAG_TUTOR_META_PUNCH
	goto EventScript_1C49AC
	end

EventScript_1C49A2:: @ 81C49A2
	msgbox Text_183A83
	release
	end

EventScript_1C49AC:: @ 81C49AC
	msgbox Text_183AE2
	release
	end

Route4_EventScript_1C49B6:: @ 81C49B6
	lock
	faceplayer
	checkflag FLAG_TUTOR_MEGA_KICK
	goto_if TRUE, EventScript_1C4A14
	msgbox Text_183B74, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if eq, EventScript_1C4A0A
	call EventScript_1C4F37
	compare VAR_RESULT, 0
	goto_if eq, EventScript_1C4A0A
	msgbox Text_183C68
	setvar VAR_0x8005, MOVETUTOR_MEGA_KICK
	call EventScript_1C4F30
	compare VAR_RESULT, 0
	goto_if eq, EventScript_1C4A0A
	setflag FLAG_TUTOR_MEGA_KICK
	goto EventScript_1C4A14
	end

EventScript_1C4A0A:: @ 81C4A0A
	msgbox Text_183C25
	release
	end

EventScript_1C4A14:: @ 81C4A14
	msgbox Text_183C94
	release
	end

EventScript_1C4A1E:: @ 81C4A1E
	lock
	faceplayer
	checkflag FLAG_TUTOR_DREAM_EATER
	goto_if TRUE, EventScript_1C4A7C
	msgbox Text_17E316, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if eq, EventScript_1C4A72
	call EventScript_1C4F37
	compare VAR_RESULT, 0
	goto_if eq, EventScript_1C4A72
	msgbox Text_17E3F1
	setvar VAR_0x8005, MOVETUTOR_DREAM_EATER
	call EventScript_1C4F30
	compare VAR_RESULT, 0
	goto_if eq, EventScript_1C4A72
	setflag FLAG_TUTOR_DREAM_EATER
	goto EventScript_1C4A7C
	end

EventScript_1C4A72:: @ 81C4A72
	msgbox Text_17E3E9
	release
	end

EventScript_1C4A7C:: @ 81C4A7C
	msgbox Text_17E41B
	release
	end

EventScript_1C4A86:: @ 81C4A86
	lock
	faceplayer
	checkflag FLAG_TUTOR_SOFT_BOILED
	goto_if TRUE, EventScript_1C4AE4
	msgbox Text_180388, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if eq, EventScript_1C4ADA
	call EventScript_1C4F37
	compare VAR_RESULT, 0
	goto_if eq, EventScript_1C4ADA
	msgbox Text_180484
	setvar VAR_0x8005, MOVETUTOR_SOFT_BOILED
	call EventScript_1C4F30
	compare VAR_RESULT, 0
	goto_if eq, EventScript_1C4ADA
	setflag FLAG_TUTOR_SOFT_BOILED
	goto EventScript_1C4AE4
	end

EventScript_1C4ADA:: @ 81C4ADA
	msgbox Text_18043F
	release
	end

EventScript_1C4AE4:: @ 81C4AE4
	msgbox Text_1804C4
	release
	end

FuchsiaCity_EventScript_1C4AEE:: @ 81C4AEE
	lock
	faceplayer
	checkflag FLAG_TUTOR_SUBSTITUTE
	goto_if TRUE, EventScript_1C4B4C
	msgbox Text_180948, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if eq, EventScript_1C4B42
	call EventScript_1C4F37
	compare VAR_RESULT, 0
	goto_if eq, EventScript_1C4B42
	msgbox Text_180A57
	setvar VAR_0x8005, MOVETUTOR_SUBSTITUTE
	call EventScript_1C4F30
	compare VAR_RESULT, 0
	goto_if eq, EventScript_1C4B42
	setflag FLAG_TUTOR_SUBSTITUTE
	goto EventScript_1C4B4C
	end

EventScript_1C4B42:: @ 81C4B42
	msgbox Text_180A32
	release
	end

EventScript_1C4B4C:: @ 81C4B4C
	msgbox Text_180A80
	release
	end

SevenIsland_EventScript_1C4B56:: @ 81C4B56
	lock
	faceplayer
	checkflag FLAG_TUTOR_SWORDS_DANCE
	goto_if TRUE, EventScript_1C4BB4
	msgbox Text_182F01, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if eq, EventScript_1C4BAA
	call EventScript_1C4F37
	compare VAR_RESULT, 0
	goto_if eq, EventScript_1C4BAA
	msgbox Text_182FD9
	setvar VAR_0x8005, MOVETUTOR_SWORDS_DANCE
	call EventScript_1C4F30
	compare VAR_RESULT, 0
	goto_if eq, EventScript_1C4BAA
	setflag FLAG_TUTOR_SWORDS_DANCE
	goto EventScript_1C4BB4
	end

EventScript_1C4BAA:: @ 81C4BAA
	msgbox Text_182FC1
	release
	end

EventScript_1C4BB4:: @ 81C4BB4
	msgbox Text_18300D
	release
	end

PewterCity_Museum_1F_EventScript_1C4BBE:: @ 81C4BBE
	lock
	faceplayer
	checkflag FLAG_TUTOR_SEISMIC_TOSS
	goto_if TRUE, EventScript_1C4C1C
	msgbox Text_1909A3, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if eq, EventScript_1C4C12
	call EventScript_1C4F37
	compare VAR_RESULT, 0
	goto_if eq, EventScript_1C4C12
	msgbox Text_190AD5
	setvar VAR_0x8005, MOVETUTOR_SEISMIC_TOSS
	call EventScript_1C4F30
	compare VAR_RESULT, 0
	goto_if eq, EventScript_1C4C12
	setflag FLAG_TUTOR_SEISMIC_TOSS
	goto EventScript_1C4C1C
	end

EventScript_1C4C12:: @ 81C4C12
	msgbox Text_190AA9
	release
	end

EventScript_1C4C1C:: @ 81C4C1C
	msgbox Text_190B00
	release
	end

EventScript_1C4C26:: @ 81C4C26
	lock
	faceplayer
	checkflag FLAG_TUTOR_COUNTER
	goto_if TRUE, EventScript_1C4C84
	msgbox Text_195928, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if eq, EventScript_1C4C7A
	call EventScript_1C4F37
	compare VAR_RESULT, 0
	goto_if eq, EventScript_1C4C7A
	msgbox Text_195A08
	setvar VAR_0x8005, MOVETUTOR_COUNTER
	call EventScript_1C4F30
	compare VAR_RESULT, 0
	goto_if eq, EventScript_1C4C7A
	setflag FLAG_TUTOR_COUNTER
	goto EventScript_1C4C84
	end

EventScript_1C4C7A:: @ 81C4C7A
	msgbox Text_1959CC
	release
	end

EventScript_1C4C84:: @ 81C4C84
	msgbox Text_195A31
	release
	end

EventScript_1C4C8E:: @ 81C4C8E
	lock
	faceplayer
	checkflag FLAG_TUTOR_METRONOME
	goto_if TRUE, EventScript_1C4CEC
	msgbox Text_19A137, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if eq, EventScript_1C4CE2
	call EventScript_1C4F37
	compare VAR_RESULT, 0
	goto_if eq, EventScript_1C4CE2
	msgbox Text_19A1EA
	setvar VAR_0x8005, MOVETUTOR_METRONOME
	call EventScript_1C4F30
	compare VAR_RESULT, 0
	goto_if eq, EventScript_1C4CE2
	setflag FLAG_TUTOR_METRONOME
	goto EventScript_1C4CEC
	end

EventScript_1C4CE2:: @ 81C4CE2
	msgbox Text_19A1CB
	release
	end

EventScript_1C4CEC:: @ 81C4CEC
	msgbox Text_19A20E
	release
	end

EventScript_1C4CF6:: @ 81C4CF6
	checkflag FLAG_TUTOR_MIMIC
	goto_if TRUE, EventScript_1C4D59
	msgbox Text_19AD85, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if eq, EventScript_1C4D4F
	call EventScript_1C4F37
	compare VAR_RESULT, 0
	goto_if eq, EventScript_1C4D4F
	msgbox Text_19ADEE
	setvar VAR_0x8005, MOVETUTOR_MIMIC
	call EventScript_1C4F30
	lock
	faceplayer
	compare VAR_RESULT, 0
	goto_if eq, EventScript_1C4D4F
	removeitem ITEM_POKE_DOLL, 1
	setflag FLAG_TUTOR_MIMIC
	goto EventScript_1C4D59
	end

EventScript_1C4D4F:: @ 81C4D4F
	msgbox Text_19ADD8
	release
	end

EventScript_1C4D59:: @ 81C4D59
	checkplayergender
	compare VAR_RESULT, 0
	call_if eq, EventScript_1C4D72
	compare VAR_RESULT, 1
	call_if eq, EventScript_1C4D7B
	release
	end

EventScript_1C4D72:: @ 81C4D72
	msgbox Text_19AE1C
	return

EventScript_1C4D7B:: @ 81C4D7B
	msgbox Text_19AE90
	return

FourIsland_House1_EventScript_1C4D84:: @ 81C4D84
	lock
	faceplayer
	checkflag FLAG_TUTOR_BODY_SLAM
	goto_if TRUE, EventScript_1C4DE2
	msgbox Text_1A3505, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if eq, EventScript_1C4DD8
	call EventScript_1C4F37
	compare VAR_RESULT, 0
	goto_if eq, EventScript_1C4DD8
	msgbox Text_1A35DA
	setvar VAR_0x8005, MOVETUTOR_BODY_SLAM
	call EventScript_1C4F30
	compare VAR_RESULT, 0
	goto_if eq, EventScript_1C4DD8
	setflag FLAG_TUTOR_BODY_SLAM
	goto EventScript_1C4DE2
	end

EventScript_1C4DD8:: @ 81C4DD8
	msgbox Text_1A35C7
	release
	end

EventScript_1C4DE2:: @ 81C4DE2
	msgbox Text_1A3609
	release
	end

TwoIsland_CapeBrink_House_EventScript_1C4DEC:: @ 81C4DEC
	special sub_8110AB4
	compare VAR_RESULT, 2
	goto_if eq, EventScript_1A7AE0
	special sub_8112364
	lock
	faceplayer
	checkflag FLAG_LEARNED_ALL_MOVES_AT_CAPE_BRINK
	goto_if TRUE, EventScript_1C4EA1
	checkflag FLAG_TEMP_2
	goto_if TRUE, EventScript_1C4E97
	getfirstpartymonname 0
	msgbox Text_1A46C6
	specialvar VAR_RESULT, Special_CapeBrinkGetMoveToTeachLeadPokemon
	compare VAR_RESULT, 0
	goto_if eq, EventScript_1C4F26
	copyvar VAR_0x8009, VAR_0x8005
	compare VAR_FACING, DIR_NORTH
	call_if eq, EventScript_1C4EF0
	compare VAR_FACING, DIR_SOUTH
	call_if eq, EventScript_1C4EFB
	compare VAR_FACING, DIR_EAST
	call_if eq, EventScript_1C4F06
	compare VAR_FACING, DIR_WEST
	call_if eq, EventScript_1C4F11
	msgbox Text_1A4751, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if eq, EventScript_1C4F1C
	call EventScript_1C4F37
	compare VAR_RESULT, 0
	goto_if eq, EventScript_1C4F1C
	msgbox Text_1A4814
	closemessage
	fadescreen 1
	goto EventScript_1C4EDA

EventScript_1C4E8F:: @ 81C4E8F
	fadescreen 0
	goto EventScript_1C4EAB
	end

EventScript_1C4E97:: @ 81C4E97
	msgbox Text_1A48B3
	release
	end

EventScript_1C4EA1:: @ 81C4EA1
	msgbox Text_1A4972
	release
	end

EventScript_1C4EAB:: @ 81C4EAB
	copyvar VAR_0x8005, VAR_0x8009
	specialvar VAR_RESULT, Special_HasLearnedAllMovesFromCapeBrinkTutor
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1C4ECD
	msgbox Text_1A4865
	setflag FLAG_TEMP_2
	release
	end

EventScript_1C4ECD:: @ 81C4ECD
	msgbox Text_1A48F3
	setflag FLAG_LEARNED_ALL_MOVES_AT_CAPE_BRINK
	release
	end

EventScript_1C4EDA:: @ 81C4EDA
	call EventScript_1C4F30
	compare VAR_RESULT, 0
	goto_if eq, EventScript_1C4F1C
	goto EventScript_1C4EAB
	end

EventScript_1C4EF0:: @ 81C4EF0
	applymovement 1, Movement_1C4F4C
	waitmovement 0
	return

EventScript_1C4EFB:: @ 81C4EFB
	applymovement 1, Movement_1C4F4E
	waitmovement 0
	return

EventScript_1C4F06:: @ 81C4F06
	applymovement 1, Movement_1C4F50
	waitmovement 0
	return

EventScript_1C4F11:: @ 81C4F11
	applymovement 1, Movement_1C4F52
	waitmovement 0
	return

EventScript_1C4F1C:: @ 81C4F1C
	msgbox Text_1A47E5
	release
	end

EventScript_1C4F26:: @ 81C4F26
	msgbox Text_1A4737
	release
	end

EventScript_1C4F30:: @ 81C4F30
	special ChooseMonForMoveTutor
	waitstate
	lock
	faceplayer
	return

EventScript_1C4F37:: @ 81C4F37
	textcolor 3
	special sub_80699BC
	signmsg
	msgbox Text_1A644F, MSGBOX_YESNO
	normalmsg
	call EventScript_1A6675
	return

Movement_1C4F4C:: @ 81C4F4C
	jump_in_place_down
	step_end

Movement_1C4F4E:: @ 81C4F4E
	jump_in_place_up
	step_end

Movement_1C4F50:: @ 81C4F50
	jump_in_place_left
	step_end

Movement_1C4F52:: @ 81C4F52
	jump_in_place_right
	step_end
