# 1 "data/maps/CeladonCity_Condominiums_RoofRoom/scripts.pory"

# 2 "data/maps/CeladonCity_Condominiums_RoofRoom/scripts.pory"
.set LOCALID_EEVEE_POKEBALL, 2
# 3 "data/maps/CeladonCity_Condominiums_RoofRoom/scripts.pory"

# 4 "data/maps/CeladonCity_Condominiums_RoofRoom/scripts.pory"
CeladonCity_Condominiums_RoofRoom_MapScripts::
# 5 "data/maps/CeladonCity_Condominiums_RoofRoom/scripts.pory"
	.byte 0
# 6 "data/maps/CeladonCity_Condominiums_RoofRoom/scripts.pory"

# 7 "data/maps/CeladonCity_Condominiums_RoofRoom/scripts.pory"
CeladonCity_Condominiums_RoofRoom_EventScript_BlackBelt::
# 8 "data/maps/CeladonCity_Condominiums_RoofRoom/scripts.pory"
	msgbox CeladonCity_Condominiums_RoofRoom_Text_TheresNothingIDontKnow, MSGBOX_NPC
# 9 "data/maps/CeladonCity_Condominiums_RoofRoom/scripts.pory"
	end
# 10 "data/maps/CeladonCity_Condominiums_RoofRoom/scripts.pory"

# 11 "data/maps/CeladonCity_Condominiums_RoofRoom/scripts.pory"
CeladonCity_Condominiums_RoofRoom_EventScript_EeveeBall::
# 12 "data/maps/CeladonCity_Condominiums_RoofRoom/scripts.pory"
	lock
# 13 "data/maps/CeladonCity_Condominiums_RoofRoom/scripts.pory"
	faceplayer
# 14 "data/maps/CeladonCity_Condominiums_RoofRoom/scripts.pory"
	setvar VAR_TEMP_1, SPECIES_EEVEE
# 15 "data/maps/CeladonCity_Condominiums_RoofRoom/scripts.pory"
	givemon SPECIES_EEVEE, 25
# 16 "data/maps/CeladonCity_Condominiums_RoofRoom/scripts.pory"
	goto_if_eq VAR_RESULT, 0, CeladonCity_Condominiums_RoofRoom_EventScript_GetEeveeParty
# 17 "data/maps/CeladonCity_Condominiums_RoofRoom/scripts.pory"
	goto_if_eq VAR_RESULT, 1, CeladonCity_Condominiums_RoofRoom_EventScript_GetEeveePC
# 18 "data/maps/CeladonCity_Condominiums_RoofRoom/scripts.pory"
	goto_if_eq VAR_RESULT, 2, EventScript_NoMoreRoomForPokemon
# 19 "data/maps/CeladonCity_Condominiums_RoofRoom/scripts.pory"
	release
# 20 "data/maps/CeladonCity_Condominiums_RoofRoom/scripts.pory"
	end
# 21 "data/maps/CeladonCity_Condominiums_RoofRoom/scripts.pory"

# 22 "data/maps/CeladonCity_Condominiums_RoofRoom/scripts.pory"
CeladonCity_Condominiums_RoofRoom_EventScript_GetEeveeParty::
# 23 "data/maps/CeladonCity_Condominiums_RoofRoom/scripts.pory"
	removeobject LOCALID_EEVEE_POKEBALL
# 24 "data/maps/CeladonCity_Condominiums_RoofRoom/scripts.pory"
	playfanfare MUS_LEVEL_UP
# 25 "data/maps/CeladonCity_Condominiums_RoofRoom/scripts.pory"
	message CeladonCity_Condominiums_RoofRoom_Text_ObtainedAnEevee
# 26 "data/maps/CeladonCity_Condominiums_RoofRoom/scripts.pory"
	waitmessage
# 27 "data/maps/CeladonCity_Condominiums_RoofRoom/scripts.pory"
	waitfanfare
# 28 "data/maps/CeladonCity_Condominiums_RoofRoom/scripts.pory"
	bufferspeciesname STR_VAR_1, SPECIES_EEVEE
# 29 "data/maps/CeladonCity_Condominiums_RoofRoom/scripts.pory"
	msgbox Text_GiveNicknameToThisMon, MSGBOX_YESNO
# 30 "data/maps/CeladonCity_Condominiums_RoofRoom/scripts.pory"
	goto_if_eq VAR_RESULT, NO, CeladonCity_Condominiums_RoofRoom_EventScript_SetGotEevee
# 31 "data/maps/CeladonCity_Condominiums_RoofRoom/scripts.pory"
	call EventScript_GetGiftMonPartySlot
# 32 "data/maps/CeladonCity_Condominiums_RoofRoom/scripts.pory"
	call EventScript_ChangePokemonNickname
# 33 "data/maps/CeladonCity_Condominiums_RoofRoom/scripts.pory"
	goto CeladonCity_Condominiums_RoofRoom_EventScript_SetGotEevee
# 34 "data/maps/CeladonCity_Condominiums_RoofRoom/scripts.pory"
	end
# 35 "data/maps/CeladonCity_Condominiums_RoofRoom/scripts.pory"

# 36 "data/maps/CeladonCity_Condominiums_RoofRoom/scripts.pory"
CeladonCity_Condominiums_RoofRoom_EventScript_GetEeveePC::
# 37 "data/maps/CeladonCity_Condominiums_RoofRoom/scripts.pory"
	removeobject LOCALID_EEVEE_POKEBALL
# 38 "data/maps/CeladonCity_Condominiums_RoofRoom/scripts.pory"
	playfanfare MUS_LEVEL_UP
# 39 "data/maps/CeladonCity_Condominiums_RoofRoom/scripts.pory"
	message CeladonCity_Condominiums_RoofRoom_Text_ObtainedAnEevee
# 40 "data/maps/CeladonCity_Condominiums_RoofRoom/scripts.pory"
	waitmessage
# 41 "data/maps/CeladonCity_Condominiums_RoofRoom/scripts.pory"
	waitfanfare
# 42 "data/maps/CeladonCity_Condominiums_RoofRoom/scripts.pory"
	bufferspeciesname STR_VAR_1, SPECIES_EEVEE
# 43 "data/maps/CeladonCity_Condominiums_RoofRoom/scripts.pory"
	msgbox Text_GiveNicknameToThisMon, MSGBOX_YESNO
# 44 "data/maps/CeladonCity_Condominiums_RoofRoom/scripts.pory"
	goto_if_eq VAR_RESULT, NO, CeladonCity_Condominiums_RoofRoom_EventScript_TransferEeveeToPC
# 45 "data/maps/CeladonCity_Condominiums_RoofRoom/scripts.pory"
	call EventScript_NameReceivedBoxMon
# 46 "data/maps/CeladonCity_Condominiums_RoofRoom/scripts.pory"
	goto CeladonCity_Condominiums_RoofRoom_EventScript_TransferEeveeToPC
# 47 "data/maps/CeladonCity_Condominiums_RoofRoom/scripts.pory"
	end
# 48 "data/maps/CeladonCity_Condominiums_RoofRoom/scripts.pory"

# 49 "data/maps/CeladonCity_Condominiums_RoofRoom/scripts.pory"
CeladonCity_Condominiums_RoofRoom_EventScript_TransferEeveeToPC::
# 50 "data/maps/CeladonCity_Condominiums_RoofRoom/scripts.pory"
	call EventScript_TransferredToPC
# 51 "data/maps/CeladonCity_Condominiums_RoofRoom/scripts.pory"
	goto CeladonCity_Condominiums_RoofRoom_EventScript_SetGotEevee
# 52 "data/maps/CeladonCity_Condominiums_RoofRoom/scripts.pory"
	end
# 53 "data/maps/CeladonCity_Condominiums_RoofRoom/scripts.pory"

# 54 "data/maps/CeladonCity_Condominiums_RoofRoom/scripts.pory"
CeladonCity_Condominiums_RoofRoom_EventScript_SetGotEevee::
# 55 "data/maps/CeladonCity_Condominiums_RoofRoom/scripts.pory"
	setflag FLAG_GOT_EEVEE
# 56 "data/maps/CeladonCity_Condominiums_RoofRoom/scripts.pory"
	release
# 57 "data/maps/CeladonCity_Condominiums_RoofRoom/scripts.pory"
	end
# 58 "data/maps/CeladonCity_Condominiums_RoofRoom/scripts.pory"

# 59 "data/maps/CeladonCity_Condominiums_RoofRoom/scripts.pory"
CeladonCity_Condominiums_RoofRoom_EventScript_TMsPamphlet::
# 60 "data/maps/CeladonCity_Condominiums_RoofRoom/scripts.pory"
	msgbox CeladonCity_Condominiums_RoofRoom_Text_PamphletOnTMs, MSGBOX_SIGN
# 61 "data/maps/CeladonCity_Condominiums_RoofRoom/scripts.pory"
	end
# 62 "data/maps/CeladonCity_Condominiums_RoofRoom/scripts.pory"

# 63 "data/maps/CeladonCity_Condominiums_RoofRoom/scripts.pory"
CeladonCity_Condominiums_RoofRoom_EventScript_Blackboard::
# 64 "data/maps/CeladonCity_Condominiums_RoofRoom/scripts.pory"
	lockall
# 65 "data/maps/CeladonCity_Condominiums_RoofRoom/scripts.pory"
	msgbox CeladonCity_Condominiums_RoofRoom_Text_WirelessAdapterLecture
# 66 "data/maps/CeladonCity_Condominiums_RoofRoom/scripts.pory"
	message CeladonCity_Condominiums_RoofRoom_Text_ReadWhichHeading
# 67 "data/maps/CeladonCity_Condominiums_RoofRoom/scripts.pory"
	waitmessage
# 68 "data/maps/CeladonCity_Condominiums_RoofRoom/scripts.pory"
	setvar VAR_0x8004, 4
# 69 "data/maps/CeladonCity_Condominiums_RoofRoom/scripts.pory"
	multichoice 0, 0, MULTICHOICE_LINKED_DIRECT_UNION, FALSE
# 70 "data/maps/CeladonCity_Condominiums_RoofRoom/scripts.pory"
	switch VAR_RESULT
# 71 "data/maps/CeladonCity_Condominiums_RoofRoom/scripts.pory"
	case 0, CeladonCity_Condominiums_RoofRoom_EventScript_WirelessClub
# 72 "data/maps/CeladonCity_Condominiums_RoofRoom/scripts.pory"
	case 1, CeladonCity_Condominiums_RoofRoom_EventScript_DirectCorner
# 73 "data/maps/CeladonCity_Condominiums_RoofRoom/scripts.pory"
	case 2, CeladonCity_Condominiums_RoofRoom_EventScript_UnionRoom
# 74 "data/maps/CeladonCity_Condominiums_RoofRoom/scripts.pory"
	case 3, CeladonCity_Condominiums_RoofRoom_EventScript_ExitBlackboard
# 75 "data/maps/CeladonCity_Condominiums_RoofRoom/scripts.pory"
	case 127, CeladonCity_Condominiums_RoofRoom_EventScript_ExitBlackboard
# 76 "data/maps/CeladonCity_Condominiums_RoofRoom/scripts.pory"
	end
# 77 "data/maps/CeladonCity_Condominiums_RoofRoom/scripts.pory"

# 78 "data/maps/CeladonCity_Condominiums_RoofRoom/scripts.pory"
CeladonCity_Condominiums_RoofRoom_EventScript_ReadAnotherHeading::
# 79 "data/maps/CeladonCity_Condominiums_RoofRoom/scripts.pory"
	message CeladonCity_Condominiums_RoofRoom_Text_ReadWhichHeading
# 80 "data/maps/CeladonCity_Condominiums_RoofRoom/scripts.pory"
	waitmessage
# 81 "data/maps/CeladonCity_Condominiums_RoofRoom/scripts.pory"
	multichoice 0, 0, MULTICHOICE_LINKED_DIRECT_UNION, FALSE
# 82 "data/maps/CeladonCity_Condominiums_RoofRoom/scripts.pory"
	switch VAR_RESULT
# 83 "data/maps/CeladonCity_Condominiums_RoofRoom/scripts.pory"
	case 0, CeladonCity_Condominiums_RoofRoom_EventScript_WirelessClub
# 84 "data/maps/CeladonCity_Condominiums_RoofRoom/scripts.pory"
	case 1, CeladonCity_Condominiums_RoofRoom_EventScript_DirectCorner
# 85 "data/maps/CeladonCity_Condominiums_RoofRoom/scripts.pory"
	case 2, CeladonCity_Condominiums_RoofRoom_EventScript_UnionRoom
# 86 "data/maps/CeladonCity_Condominiums_RoofRoom/scripts.pory"
	case 3, CeladonCity_Condominiums_RoofRoom_EventScript_ExitBlackboard
# 87 "data/maps/CeladonCity_Condominiums_RoofRoom/scripts.pory"
	case 127, CeladonCity_Condominiums_RoofRoom_EventScript_ExitBlackboard
# 88 "data/maps/CeladonCity_Condominiums_RoofRoom/scripts.pory"
	end
# 89 "data/maps/CeladonCity_Condominiums_RoofRoom/scripts.pory"

# 90 "data/maps/CeladonCity_Condominiums_RoofRoom/scripts.pory"
CeladonCity_Condominiums_RoofRoom_EventScript_WirelessClub::
# 91 "data/maps/CeladonCity_Condominiums_RoofRoom/scripts.pory"
	msgbox CeladonCity_Condominiums_RoofRoom_Text_ExplainWirelessClub
# 92 "data/maps/CeladonCity_Condominiums_RoofRoom/scripts.pory"
	goto CeladonCity_Condominiums_RoofRoom_EventScript_ReadAnotherHeading
# 93 "data/maps/CeladonCity_Condominiums_RoofRoom/scripts.pory"
	end
# 94 "data/maps/CeladonCity_Condominiums_RoofRoom/scripts.pory"

# 95 "data/maps/CeladonCity_Condominiums_RoofRoom/scripts.pory"
CeladonCity_Condominiums_RoofRoom_EventScript_DirectCorner::
# 96 "data/maps/CeladonCity_Condominiums_RoofRoom/scripts.pory"
	msgbox CeladonCity_Condominiums_RoofRoom_Text_ExplainDirectCorner
# 97 "data/maps/CeladonCity_Condominiums_RoofRoom/scripts.pory"
	goto CeladonCity_Condominiums_RoofRoom_EventScript_ReadAnotherHeading
# 98 "data/maps/CeladonCity_Condominiums_RoofRoom/scripts.pory"
	end
# 99 "data/maps/CeladonCity_Condominiums_RoofRoom/scripts.pory"

# 100 "data/maps/CeladonCity_Condominiums_RoofRoom/scripts.pory"
CeladonCity_Condominiums_RoofRoom_EventScript_UnionRoom::
# 101 "data/maps/CeladonCity_Condominiums_RoofRoom/scripts.pory"
	msgbox CeladonCity_Condominiums_RoofRoom_Text_ExplainUnionRoom
# 102 "data/maps/CeladonCity_Condominiums_RoofRoom/scripts.pory"
	goto CeladonCity_Condominiums_RoofRoom_EventScript_ReadAnotherHeading
# 103 "data/maps/CeladonCity_Condominiums_RoofRoom/scripts.pory"
	end
# 104 "data/maps/CeladonCity_Condominiums_RoofRoom/scripts.pory"

# 105 "data/maps/CeladonCity_Condominiums_RoofRoom/scripts.pory"
CeladonCity_Condominiums_RoofRoom_EventScript_ExitBlackboard::
# 106 "data/maps/CeladonCity_Condominiums_RoofRoom/scripts.pory"
	releaseall
# 107 "data/maps/CeladonCity_Condominiums_RoofRoom/scripts.pory"
	end
