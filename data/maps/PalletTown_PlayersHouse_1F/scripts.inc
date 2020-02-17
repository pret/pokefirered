PalletTown_PlayersHouse_1F_MapScripts:: @ 8168C08
	.byte 0

PalletTown_PlayersHouse_1F_EventScript_168C09:: @ 8168C09
	lock
	faceplayer
	goto_if_set FLAG_BEAT_RIVAL_IN_OAKS_LAB, EventScript_168C4A
	checkplayergender
	compare VAR_RESULT, MALE
	call_if_eq EventScript_168C38
	compare VAR_RESULT, FEMALE
	call_if_eq EventScript_168C41
	closemessage
	applymovement 1, Movement_FaceOriginalDirection
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
	call EventScript_OutOfCenterPartyHeal
	msgbox gUnknown_818D3F8
	release
	end

PalletTown_PlayersHouse_1F_EventScript_168C62:: @ 8168C62
	lockall
	compare VAR_FACING, DIR_NORTH
	goto_if_eq EventScript_168C78
	msgbox gUnknown_818D4F9
	releaseall
	end

EventScript_168C78:: @ 8168C78
	checkplayergender
	compare VAR_RESULT, MALE
	call_if_eq EventScript_168C91
	compare VAR_RESULT, FEMALE
	call_if_eq EventScript_168C9A
	releaseall
	end

EventScript_168C91:: @ 8168C91
	msgbox gUnknown_818D43E
	return

EventScript_168C9A:: @ 8168C9A
	msgbox gUnknown_818D492
	return
