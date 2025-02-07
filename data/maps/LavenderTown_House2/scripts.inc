# 1 "data/maps/LavenderTown_House2/scripts.pory"

# 2 "data/maps/LavenderTown_House2/scripts.pory"
LavenderTown_House2_MapScripts::
# 3 "data/maps/LavenderTown_House2/scripts.pory"
	.byte 0
# 4 "data/maps/LavenderTown_House2/scripts.pory"

# 5 "data/maps/LavenderTown_House2/scripts.pory"
LavenderTown_House2_EventScript_NameRater::
# 6 "data/maps/LavenderTown_House2/scripts.pory"
	lock
# 7 "data/maps/LavenderTown_House2/scripts.pory"
	faceplayer
# 8 "data/maps/LavenderTown_House2/scripts.pory"
	msgbox LavenderTown_House2_Text_WantMeToRateNicknames, MSGBOX_YESNO
# 9 "data/maps/LavenderTown_House2/scripts.pory"
	goto_if_eq VAR_RESULT, YES, LavenderTown_House2_EventScript_ChooseMon
# 10 "data/maps/LavenderTown_House2/scripts.pory"
	goto_if_eq VAR_RESULT, NO, LavenderTown_House2_EventScript_DontRateNickname
# 11 "data/maps/LavenderTown_House2/scripts.pory"
	end
# 12 "data/maps/LavenderTown_House2/scripts.pory"

# 13 "data/maps/LavenderTown_House2/scripts.pory"
LavenderTown_House2_EventScript_ChooseMon::
# 14 "data/maps/LavenderTown_House2/scripts.pory"
	msgbox LavenderTown_House2_Text_CritiqueWhichMonsNickname
# 15 "data/maps/LavenderTown_House2/scripts.pory"
	special ChoosePartyMon
# 16 "data/maps/LavenderTown_House2/scripts.pory"
	waitstate
# 17 "data/maps/LavenderTown_House2/scripts.pory"
	goto_if_lt VAR_0x8004, PARTY_SIZE, LavenderTown_House2_EventScript_CheckCanRateMon
# 18 "data/maps/LavenderTown_House2/scripts.pory"
	goto_if_ge VAR_0x8004, PARTY_SIZE, LavenderTown_House2_EventScript_DontRateNickname
# 19 "data/maps/LavenderTown_House2/scripts.pory"
	end
# 20 "data/maps/LavenderTown_House2/scripts.pory"

# 21 "data/maps/LavenderTown_House2/scripts.pory"
LavenderTown_House2_EventScript_DontRateNickname::
# 22 "data/maps/LavenderTown_House2/scripts.pory"
	msgbox LavenderTown_House2_Text_ISeeComeVisitAgain
# 23 "data/maps/LavenderTown_House2/scripts.pory"
	release
# 24 "data/maps/LavenderTown_House2/scripts.pory"
	end
# 25 "data/maps/LavenderTown_House2/scripts.pory"

# 26 "data/maps/LavenderTown_House2/scripts.pory"
LavenderTown_House2_EventScript_CheckCanRateMon::
# 27 "data/maps/LavenderTown_House2/scripts.pory"
	specialvar VAR_RESULT, GetPartyMonSpecies
# 28 "data/maps/LavenderTown_House2/scripts.pory"
	goto_if_eq VAR_RESULT, SPECIES_EGG, LavenderTown_House2_EventScript_CantNicknameEgg
# 29 "data/maps/LavenderTown_House2/scripts.pory"
	special BufferMonNickname
# 30 "data/maps/LavenderTown_House2/scripts.pory"
	special IsMonOTIDNotPlayers
# 31 "data/maps/LavenderTown_House2/scripts.pory"
	goto_if_eq VAR_RESULT, TRUE, LavenderTown_House2_EventScript_CantNicknameTradeMon
# 32 "data/maps/LavenderTown_House2/scripts.pory"
	specialvar VAR_RESULT, IsMonOTNameNotPlayers
# 33 "data/maps/LavenderTown_House2/scripts.pory"
	special BufferMonNickname
# 34 "data/maps/LavenderTown_House2/scripts.pory"
	goto_if_eq VAR_RESULT, TRUE, LavenderTown_House2_EventScript_CantNicknameTradeMon
# 35 "data/maps/LavenderTown_House2/scripts.pory"
	msgbox LavenderTown_House2_Text_GiveItANicerName, MSGBOX_YESNO
# 36 "data/maps/LavenderTown_House2/scripts.pory"
	goto_if_eq VAR_RESULT, YES, LavenderTown_House2_EventScript_ChooseNewNickname
# 37 "data/maps/LavenderTown_House2/scripts.pory"
	goto_if_eq VAR_RESULT, NO, LavenderTown_House2_EventScript_DontRateNickname
# 38 "data/maps/LavenderTown_House2/scripts.pory"
	end
# 39 "data/maps/LavenderTown_House2/scripts.pory"

# 40 "data/maps/LavenderTown_House2/scripts.pory"
LavenderTown_House2_EventScript_CantNicknameEgg::
# 41 "data/maps/LavenderTown_House2/scripts.pory"
	msgbox LavenderTown_House2_Text_ThatIsMerelyAnEgg
# 42 "data/maps/LavenderTown_House2/scripts.pory"
	release
# 43 "data/maps/LavenderTown_House2/scripts.pory"
	end
# 44 "data/maps/LavenderTown_House2/scripts.pory"

# 45 "data/maps/LavenderTown_House2/scripts.pory"
LavenderTown_House2_EventScript_CantNicknameTradeMon::
# 46 "data/maps/LavenderTown_House2/scripts.pory"
	msgbox LavenderTown_House2_Text_TrulyImpeccableName
# 47 "data/maps/LavenderTown_House2/scripts.pory"
	release
# 48 "data/maps/LavenderTown_House2/scripts.pory"
	end
# 49 "data/maps/LavenderTown_House2/scripts.pory"

# 50 "data/maps/LavenderTown_House2/scripts.pory"
LavenderTown_House2_EventScript_ChooseNewNickname::
# 51 "data/maps/LavenderTown_House2/scripts.pory"
	msgbox LavenderTown_House2_Text_WhatShallNewNicknameBe
# 52 "data/maps/LavenderTown_House2/scripts.pory"
	call EventScript_ChangePokemonNickname
# 53 "data/maps/LavenderTown_House2/scripts.pory"
	specialvar VAR_RESULT, NameRaterWasNicknameChanged
# 54 "data/maps/LavenderTown_House2/scripts.pory"
	special BufferMonNickname
# 55 "data/maps/LavenderTown_House2/scripts.pory"
	goto_if_eq VAR_RESULT, TRUE, LavenderTown_House2_EventScript_ChoseNewNickname
# 56 "data/maps/LavenderTown_House2/scripts.pory"
	msgbox LavenderTown_House2_Text_FromNowOnShallBeKnownAsSameName
# 57 "data/maps/LavenderTown_House2/scripts.pory"
	release
# 58 "data/maps/LavenderTown_House2/scripts.pory"
	end
# 59 "data/maps/LavenderTown_House2/scripts.pory"

# 60 "data/maps/LavenderTown_House2/scripts.pory"
LavenderTown_House2_EventScript_ChoseNewNickname::
# 61 "data/maps/LavenderTown_House2/scripts.pory"
	msgbox LavenderTown_House2_Text_FromNowOnShallBeKnownAsName
# 62 "data/maps/LavenderTown_House2/scripts.pory"
	release
# 63 "data/maps/LavenderTown_House2/scripts.pory"
	end
