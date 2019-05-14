FuchsiaCity_House3_MapScripts:: @ 816D894
	.byte 0

FuchsiaCity_House3_EventScript_16D895:: @ 816D895
	lock
	faceplayer
	loadword 0, gUnknown_81993B9
	callstd 5
	compare_var_to_value VAR_RESULT, 1
	goto_if 1, EventScript_16D8B0
	goto EventScript_16D941
	end

EventScript_16D8B0:: @ 816D8B0
	loadword 0, gUnknown_8199421
	callstd 4
	special sub_80BF8FC
	waitstate
	compare_var_to_value VAR_0x8004, 6
	goto_if 4, EventScript_16D941
	special sub_80BFC14
	compare_var_to_value VAR_RESULT, 1
	goto_if 1, EventScript_16D937
	special ScrSpecial_CountPokemonMoves
	compare_var_to_value VAR_RESULT, 1
	goto_if 1, EventScript_16D92A
	loadword 0, gUnknown_8199445
	callstd 4
	fadescreen 1
	special sub_80BF9BC
	fadescreen 0
	compare_var_to_value VAR_0x8005, 4
	goto_if 1, EventScript_16D8B0
	special ScrSpecial_GetPokemonNicknameAndMoveName
	loadword 0, gUnknown_8199485
	callstd 5
	compare_var_to_value VAR_RESULT, 1
	goto_if 1, EventScript_16D919
	goto EventScript_16D941
	end

EventScript_16D919:: @ 816D919
	special sub_80BFBA8
	playfanfare MUS_ME_WASURE
	waitfanfare
	loadword 0, gUnknown_81994B1
	callstd 4
	release
	end

EventScript_16D92A:: @ 816D92A
	special ScrSpecial_GetPokemonNicknameAndMoveName
	loadword 0, gUnknown_8199465
	callstd 4
	release
	end

EventScript_16D937:: @ 816D937
	loadword 0, gUnknown_819951F
	callstd 4
	release
	end

EventScript_16D941:: @ 816D941
	loadword 0, gUnknown_81994EA
	callstd 4
	release
	end
