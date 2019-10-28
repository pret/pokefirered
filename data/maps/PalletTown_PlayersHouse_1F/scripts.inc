PalletTown_PlayersHouse_1F_MapScripts:: @ 8168C08
	.byte 0

PalletTown_PlayersHouse_1F_EventScript_168C09:: @ 8168C09
	lock
	faceplayer
	checkflag FLAG_BEAT_RIVAL_IN_OAKS_LAB
	goto_if TRUE, EventScript_168C4A
	checkplayergender
	compare_var_to_value VAR_RESULT, 0
	call_if eq, EventScript_168C38
	compare_var_to_value VAR_RESULT, 1
	call_if eq, EventScript_168C41
	closemessage
	applymovement 1, Movement_1A75E5
	waitmovement 0
	release
	end

EventScript_168C38:: @ 8168C38
	msgbox gUnknown_818D2F0
	return

EventScript_168C41:: @ 8168C41
	msgbox gUnknown_818D360
	return

EventScript_168C4A:: @ 8168C4A
	msgbox gUnknown_818D3D1
	closemessage
	call EventScript_FadeOut_Heal_FadeIn
	msgbox gUnknown_818D3F8
	release
	end

PalletTown_PlayersHouse_1F_EventScript_168C62:: @ 8168C62
	lockall
	compare_var_to_value VAR_FACING, 2
	goto_if eq, EventScript_168C78
	msgbox gUnknown_818D4F9
	releaseall
	end

EventScript_168C78:: @ 8168C78
	checkplayergender
	compare_var_to_value VAR_RESULT, 0
	call_if eq, EventScript_168C91
	compare_var_to_value VAR_RESULT, 1
	call_if eq, EventScript_168C9A
	releaseall
	end

EventScript_168C91:: @ 8168C91
	msgbox gUnknown_818D43E
	return

EventScript_168C9A:: @ 8168C9A
	msgbox gUnknown_818D492
	return
