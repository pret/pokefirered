FourIsland_PokemonDayCare_MapScripts:: @ 817193F
	.byte 0

FourIsland_PokemonDayCare_EventScript_171940:: @ 8171940
	special sub_8110AB4
	compare_var_to_value VAR_RESULT, 2
	goto_if 1, EventScript_1A7AE0
	lock
	faceplayer
	specialvar VAR_RESULT, GetDaycareState
	compare_var_to_value VAR_RESULT, 1
	goto_if 1, EventScript_171A2E
	compare_var_to_value VAR_RESULT, 2
	goto_if 1, EventScript_171A52
	compare_var_to_value VAR_RESULT, 3
	goto_if 1, EventScript_171B86
	msgbox gUnknown_81BF7E4, 5
	compare_var_to_value VAR_RESULT, 1
	goto_if 1, EventScript_171993
	msgbox gUnknown_81BF916
	release
	end

EventScript_171993:: @ 8171993
	specialvar VAR_RESULT, CountPartyNonEggMons
	compare_var_to_value VAR_RESULT, 1
	goto_if 1, EventScript_171A1A
	msgbox gUnknown_81BF839
	fadescreen 1
	special ChooseSendDaycareMon
	waitstate
	compare_var_to_value VAR_0x8004, 6
	goto_if 4, EventScript_1719F7
	specialvar VAR_RESULT, CountPartyAliveNonEggMons_IgnoreVar0x8004Slot
	compare_var_to_value VAR_RESULT, 0
	goto_if 1, EventScript_171A24
	specialvar VAR_0x8005, GetSelectedMonNickAndSpecies
	waitse
	playmoncry 32773, 0
	msgbox gUnknown_81BF860
	waitmoncry
	special StoreSelectedPokemonInDaycare
	incrementgamestat 47
	specialvar VAR_RESULT, GetDaycareState
	compare_var_to_value VAR_RESULT, 2
	goto_if 1, EventScript_171A01
	release
	end

EventScript_1719F7:: @ 81719F7
	msgbox gUnknown_81BF976
	release
	end

EventScript_171A01:: @ 8171A01
	msgbox gUnknown_81BF89F, 5
	compare_var_to_value VAR_RESULT, 1
	goto_if 1, EventScript_171993
	goto EventScript_1719F7
	end

EventScript_171A1A:: @ 8171A1A
	msgbox gUnknown_81BFAAD
	release
	end

EventScript_171A24:: @ 8171A24
	msgbox gUnknown_81BFB09
	release
	end

EventScript_171A2E:: @ 8171A2E
	msgbox gUnknown_81BF8F6
	release
	end

EventScript_171A38:: @ 8171A38
	msgbox gUnknown_81BF9CC
	return

EventScript_171A41:: @ 8171A41
	specialvar VAR_RESULT, GetNumLevelsGainedFromDaycare
	compare_var_to_value VAR_RESULT, 0
	call_if 5, EventScript_171A38
	return

EventScript_171A52:: @ 8171A52
	msgbox gUnknown_81BF988
	setvar VAR_0x8004, 0
	call EventScript_171A41
	msgbox gUnknown_81BF89F, 5
	compare_var_to_value VAR_RESULT, 1
	goto_if 1, EventScript_171993
	msgbox gUnknown_81BFAE8, 5
	compare_var_to_value VAR_RESULT, 1
	goto_if 1, EventScript_171A90
	goto EventScript_1719F7
	end

EventScript_171A90:: @ 8171A90
	specialvar VAR_RESULT, CalculatePlayerPartyCount
	compare_var_to_value VAR_RESULT, 6
	goto_if 1, EventScript_171B67
	specialvar VAR_RESULT, GetDaycareState
	setvar VAR_0x8004, 0
	compare_var_to_value VAR_RESULT, 2
	goto_if 1, EventScript_171ACF
	special ShowDaycareLevelMenu
	waitstate
	copyvar VAR_0x8004, VAR_RESULT
	compare_var_to_value VAR_RESULT, 2
	goto_if 1, EventScript_1719F7
	goto EventScript_171ACF
	end

EventScript_171ACF:: @ 8171ACF
	special GetDaycareCost
	msgbox gUnknown_81BFA3B, 5
	compare_var_to_value VAR_RESULT, 1
	goto_if 1, EventScript_171AEB
	goto EventScript_1719F7
	end

EventScript_171AEB:: @ 8171AEB
	specialvar VAR_RESULT, IsEnoughForCostInVar0x8005
	compare_var_to_value VAR_RESULT, 1
	goto_if 1, EventScript_171B05
	msgbox gUnknown_81BF932
	release
	end

EventScript_171B05:: @ 8171B05
	applymovement 1, Movement_171B71
	waitmovement 0
	specialvar VAR_RESULT, TakePokemonFromDaycare
	special SubtractMoneyFromVar0x8005
	playse SE_T_KAMI2
	msgbox gUnknown_81BFA67
	waitse
	playmoncry 32781, 0
	textcolor 3
	msgbox gUnknown_81BFA85
	call EventScript_1A6675
	waitmoncry
	specialvar VAR_RESULT, GetDaycareState
	compare_var_to_value VAR_RESULT, 2
	goto_if 1, EventScript_171B4E
	goto EventScript_1719F7
	end

EventScript_171B4E:: @ 8171B4E
	msgbox gUnknown_81BF94F, 5
	compare_var_to_value VAR_RESULT, 1
	goto_if 1, EventScript_171A90
	goto EventScript_1719F7
	end

EventScript_171B67:: @ 8171B67
	msgbox gUnknown_81BF9EF
	release
	end

Movement_171B71:: @ 8171B71
	step_1c
	step_1c
	step_03
	step_1c
	step_1c
	step_02
	step_1c
	step_1c
	step_01
	step_up
	step_60
	step_1c
	step_1c
	step_1c
	step_1c
	step_1c
	step_00
	step_61
	step_down
	step_end

EventScript_171B85:: @ 8171B85
	end

EventScript_171B86:: @ 8171B86
	msgbox gUnknown_81BF988
	setvar VAR_0x8004, 0
	call EventScript_171A41
	setvar VAR_0x8004, 1
	call EventScript_171A41
	msgbox gUnknown_81BFAE8, 5
	compare_var_to_value VAR_RESULT, 1
	goto_if 1, EventScript_171A90
	msgbox gUnknown_81BF976
	release
	end

EventScript_171BBF:: @ 8171BBF
	special ShowDaycareLevelMenu
	waitstate
	compare_var_to_value VAR_RESULT, 2
	goto_if 1, EventScript_1719F7
	copyvar VAR_0x8004, VAR_RESULT
	specialvar VAR_RESULT, TakePokemonFromDaycare
	msgbox gUnknown_81BFA67
	msgbox gUnknown_81BF976
	release
	end
