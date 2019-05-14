PalletTown_PlayersHouse_1F_MapScripts:: @ 8168C08
	.byte 0

PalletTown_PlayersHouse_1F_EventScript_168C09:: @ 8168C09
	lock
	faceplayer
	checkflag FLAG_0x258
	goto_if 1, EventScript_168C4A
	checkplayergender
	compare_var_to_value VAR_RESULT, 0
	call_if 1, EventScript_168C38
	compare_var_to_value VAR_RESULT, 1
	call_if 1, EventScript_168C41
	closemessage
	applymovement 1, Movement_1A75E5
	waitmovement 0
	release
	end

EventScript_168C38:: @ 8168C38
	loadword 0, gUnknown_818D2F0
	callstd 4
	return

EventScript_168C41:: @ 8168C41
	loadword 0, gUnknown_818D360
	callstd 4
	return

EventScript_168C4A:: @ 8168C4A
	loadword 0, gUnknown_818D3D1
	callstd 4
	closemessage
	call EventScript_1A6C26
	loadword 0, gUnknown_818D3F8
	callstd 4
	release
	end

PalletTown_PlayersHouse_1F_EventScript_168C62:: @ 8168C62
	lockall
	compare_var_to_value VAR_FACING, 2
	goto_if 1, EventScript_168C78
	loadword 0, gUnknown_818D4F9
	callstd 4
	releaseall
	end

EventScript_168C78:: @ 8168C78
	checkplayergender
	compare_var_to_value VAR_RESULT, 0
	call_if 1, EventScript_168C91
	compare_var_to_value VAR_RESULT, 1
	call_if 1, EventScript_168C9A
	releaseall
	end

EventScript_168C91:: @ 8168C91
	loadword 0, gUnknown_818D43E
	callstd 4
	return

EventScript_168C9A:: @ 8168C9A
	loadword 0, gUnknown_818D492
	callstd 4
	return
