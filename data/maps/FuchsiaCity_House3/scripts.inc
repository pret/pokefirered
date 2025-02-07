# 1 "data/maps/FuchsiaCity_House3/scripts.pory"

# 2 "data/maps/FuchsiaCity_House3/scripts.pory"
FuchsiaCity_House3_MapScripts::
# 3 "data/maps/FuchsiaCity_House3/scripts.pory"
	.byte 0
# 4 "data/maps/FuchsiaCity_House3/scripts.pory"

# 5 "data/maps/FuchsiaCity_House3/scripts.pory"
FuchsiaCity_House3_EventScript_MoveDeleter::
# 6 "data/maps/FuchsiaCity_House3/scripts.pory"
	lock
# 7 "data/maps/FuchsiaCity_House3/scripts.pory"
	faceplayer
# 8 "data/maps/FuchsiaCity_House3/scripts.pory"
	msgbox FuchsiaCity_House3_Text_WouldYouLikeToForgetMove, MSGBOX_YESNO
# 9 "data/maps/FuchsiaCity_House3/scripts.pory"
	goto_if_eq VAR_RESULT, YES, FuchsiaCity_House3_EventScript_ChooseMonForMoveDeleter
# 10 "data/maps/FuchsiaCity_House3/scripts.pory"
	goto FuchsiaCity_House3_EventScript_CancelForgetMove
# 11 "data/maps/FuchsiaCity_House3/scripts.pory"
	end
# 12 "data/maps/FuchsiaCity_House3/scripts.pory"

# 13 "data/maps/FuchsiaCity_House3/scripts.pory"
FuchsiaCity_House3_EventScript_ChooseMonForMoveDeleter::
# 14 "data/maps/FuchsiaCity_House3/scripts.pory"
	msgbox FuchsiaCity_House3_Text_WhichMonShouldForgetMove
# 15 "data/maps/FuchsiaCity_House3/scripts.pory"
	special ChoosePartyMon
# 16 "data/maps/FuchsiaCity_House3/scripts.pory"
	waitstate
# 17 "data/maps/FuchsiaCity_House3/scripts.pory"
	goto_if_ge VAR_0x8004, PARTY_SIZE, FuchsiaCity_House3_EventScript_CancelForgetMove
# 18 "data/maps/FuchsiaCity_House3/scripts.pory"
	special IsSelectedMonEgg
# 19 "data/maps/FuchsiaCity_House3/scripts.pory"
	goto_if_eq VAR_RESULT, TRUE, FuchsiaCity_House3_EventScript_CantForgetMoveEgg
# 20 "data/maps/FuchsiaCity_House3/scripts.pory"
	special GetNumMovesSelectedMonHas
# 21 "data/maps/FuchsiaCity_House3/scripts.pory"
	goto_if_eq VAR_RESULT, 1, FuchsiaCity_House3_EventScript_CantForgetOnlyMove
# 22 "data/maps/FuchsiaCity_House3/scripts.pory"
	msgbox FuchsiaCity_House3_Text_WhichMoveShouldBeForgotten
# 23 "data/maps/FuchsiaCity_House3/scripts.pory"
	fadescreen FADE_TO_BLACK
# 24 "data/maps/FuchsiaCity_House3/scripts.pory"
	special SelectMoveDeleterMove
# 25 "data/maps/FuchsiaCity_House3/scripts.pory"
	fadescreen FADE_FROM_BLACK
# 26 "data/maps/FuchsiaCity_House3/scripts.pory"
	goto_if_eq VAR_0x8005, MAX_MON_MOVES, FuchsiaCity_House3_EventScript_ChooseMonForMoveDeleter
# 27 "data/maps/FuchsiaCity_House3/scripts.pory"
	special BufferMoveDeleterNicknameAndMove
# 28 "data/maps/FuchsiaCity_House3/scripts.pory"
	msgbox FuchsiaCity_House3_Text_MonsMoveShouldBeForgotten, MSGBOX_YESNO
# 29 "data/maps/FuchsiaCity_House3/scripts.pory"
	goto_if_eq VAR_RESULT, YES, FuchsiaCity_House3_EventScript_ForgetMove
# 30 "data/maps/FuchsiaCity_House3/scripts.pory"
	goto FuchsiaCity_House3_EventScript_CancelForgetMove
# 31 "data/maps/FuchsiaCity_House3/scripts.pory"
	end
# 32 "data/maps/FuchsiaCity_House3/scripts.pory"

# 33 "data/maps/FuchsiaCity_House3/scripts.pory"
FuchsiaCity_House3_EventScript_ForgetMove::
# 34 "data/maps/FuchsiaCity_House3/scripts.pory"
	special MoveDeleterForgetMove
# 35 "data/maps/FuchsiaCity_House3/scripts.pory"
	playfanfare MUS_MOVE_DELETED
# 36 "data/maps/FuchsiaCity_House3/scripts.pory"
	waitfanfare
# 37 "data/maps/FuchsiaCity_House3/scripts.pory"
	msgbox FuchsiaCity_House3_Text_MonHasForgottenMoveCompletely
# 38 "data/maps/FuchsiaCity_House3/scripts.pory"
	release
# 39 "data/maps/FuchsiaCity_House3/scripts.pory"
	end
# 40 "data/maps/FuchsiaCity_House3/scripts.pory"

# 41 "data/maps/FuchsiaCity_House3/scripts.pory"
FuchsiaCity_House3_EventScript_CantForgetOnlyMove::
# 42 "data/maps/FuchsiaCity_House3/scripts.pory"
	special BufferMoveDeleterNicknameAndMove
# 43 "data/maps/FuchsiaCity_House3/scripts.pory"
	msgbox FuchsiaCity_House3_Text_MonOnlyKnowsOneMove
# 44 "data/maps/FuchsiaCity_House3/scripts.pory"
	release
# 45 "data/maps/FuchsiaCity_House3/scripts.pory"
	end
# 46 "data/maps/FuchsiaCity_House3/scripts.pory"

# 47 "data/maps/FuchsiaCity_House3/scripts.pory"
FuchsiaCity_House3_EventScript_CantForgetMoveEgg::
# 48 "data/maps/FuchsiaCity_House3/scripts.pory"
	msgbox FuchsiaCity_House3_Text_NoEggShouldKnowMoves
# 49 "data/maps/FuchsiaCity_House3/scripts.pory"
	release
# 50 "data/maps/FuchsiaCity_House3/scripts.pory"
	end
# 51 "data/maps/FuchsiaCity_House3/scripts.pory"

# 52 "data/maps/FuchsiaCity_House3/scripts.pory"
FuchsiaCity_House3_EventScript_CancelForgetMove::
# 53 "data/maps/FuchsiaCity_House3/scripts.pory"
	msgbox FuchsiaCity_House3_Text_ComeAgainToForgetOtherMoves
# 54 "data/maps/FuchsiaCity_House3/scripts.pory"
	release
# 55 "data/maps/FuchsiaCity_House3/scripts.pory"
	end
