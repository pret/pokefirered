FuchsiaCity_House3_MapScripts:: @ 816D894
	.byte 0

FuchsiaCity_House3_EventScript_16D895:: @ 816D895
	lock
	faceplayer
	msgbox gUnknown_81993B9, MSGBOX_YESNO
	compare VAR_RESULT, YES
	goto_if_eq EventScript_16D8B0
	goto EventScript_16D941
	end

EventScript_16D8B0:: @ 816D8B0
	msgbox gUnknown_8199421
	special Special_ChooseMonFromParty
	waitstate
	compare VAR_0x8004, 6
	goto_if_ge EventScript_16D941
	special Special_IsSelectedMonEgg
	compare VAR_RESULT, 1
	goto_if_eq EventScript_16D937
	special Special_GetNumMovesSelectedMonHas
	compare VAR_RESULT, 1
	goto_if_eq EventScript_16D92A
	msgbox gUnknown_8199445
	fadescreen FADE_TO_BLACK
	special Special_SelectMove
	fadescreen FADE_FROM_BLACK
	compare VAR_0x8005, 4
	goto_if_eq EventScript_16D8B0
	special Special_BufferMoveDeleterNicknameAndMove
	msgbox gUnknown_8199485, MSGBOX_YESNO
	compare VAR_RESULT, YES
	goto_if_eq EventScript_16D919
	goto EventScript_16D941
	end

EventScript_16D919:: @ 816D919
	special Special_MoveDeleterForgetMove
	playfanfare MUS_ME_WASURE
	waitfanfare
	msgbox gUnknown_81994B1
	release
	end

EventScript_16D92A:: @ 816D92A
	special Special_BufferMoveDeleterNicknameAndMove
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
