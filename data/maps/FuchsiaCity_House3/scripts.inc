FuchsiaCity_House3_MapScripts:: @ 816D894
	.byte 0

FuchsiaCity_House3_EventScript_16D895:: @ 816D895
	lock
	faceplayer
	msgbox gUnknown_81993B9, MSGBOX_YESNO
	compare_var_to_value VAR_RESULT, 1
	goto_if_eq EventScript_16D8B0
	goto EventScript_16D941
	end

EventScript_16D8B0:: @ 816D8B0
	msgbox gUnknown_8199421
	special sub_80BF8FC
	waitstate
	compare_var_to_value VAR_0x8004, 6
	goto_if 4, EventScript_16D941
	special sub_80BFC14
	compare_var_to_value VAR_RESULT, 1
	goto_if_eq EventScript_16D937
	special ScrSpecial_CountPokemonMoves
	compare_var_to_value VAR_RESULT, 1
	goto_if_eq EventScript_16D92A
	msgbox gUnknown_8199445
	fadescreen 1
	special sub_80BF9BC
	fadescreen 0
	compare_var_to_value VAR_0x8005, 4
	goto_if_eq EventScript_16D8B0
	special ScrSpecial_GetPokemonNicknameAndMoveName
	msgbox gUnknown_8199485, MSGBOX_YESNO
	compare_var_to_value VAR_RESULT, 1
	goto_if_eq EventScript_16D919
	goto EventScript_16D941
	end

EventScript_16D919:: @ 816D919
	special sub_80BFBA8
	playfanfare MUS_ME_WASURE
	waitfanfare
	msgbox gUnknown_81994B1
	release
	end

EventScript_16D92A:: @ 816D92A
	special ScrSpecial_GetPokemonNicknameAndMoveName
	msgbox gUnknown_8199465
	release
	end

EventScript_16D937:: @ 816D937
	msgbox gUnknown_819951F
	release
	end

EventScript_16D941:: @ 816D941
	msgbox gUnknown_81994EA
	release
	end
