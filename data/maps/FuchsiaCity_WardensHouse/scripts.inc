# 1 "data/maps/FuchsiaCity_WardensHouse/scripts.pory"

# 2 "data/maps/FuchsiaCity_WardensHouse/scripts.pory"
FuchsiaCity_WardensHouse_MapScripts::
# 3 "data/maps/FuchsiaCity_WardensHouse/scripts.pory"
	.byte 0
# 4 "data/maps/FuchsiaCity_WardensHouse/scripts.pory"

# 5 "data/maps/FuchsiaCity_WardensHouse/scripts.pory"
FuchsiaCity_WardensHouse_EventScript_Warden::
# 6 "data/maps/FuchsiaCity_WardensHouse/scripts.pory"
	lock
# 7 "data/maps/FuchsiaCity_WardensHouse/scripts.pory"
	faceplayer
# 8 "data/maps/FuchsiaCity_WardensHouse/scripts.pory"
	goto_if_set FLAG_GOT_HM04, FuchsiaCity_WardensHouse_EventScript_ExplainStrength
# 9 "data/maps/FuchsiaCity_WardensHouse/scripts.pory"
	goto_if_set FLAG_HIDE_SAFARI_ZONE_WEST_GOLD_TEETH, FuchsiaCity_WardensHouse_EventScript_GiveGoldTeeth
# 10 "data/maps/FuchsiaCity_WardensHouse/scripts.pory"
	msgbox FuchsiaCity_WardensHouse_Text_HifFuffHefifoo, MSGBOX_YESNO
# 11 "data/maps/FuchsiaCity_WardensHouse/scripts.pory"
	call_if_eq VAR_RESULT, YES, FuchsiaCity_WardensHouse_EventScript_WardenYes
# 12 "data/maps/FuchsiaCity_WardensHouse/scripts.pory"
	call_if_eq VAR_RESULT, NO, FuchsiaCity_WardensHouse_EventScript_WardenNo
# 13 "data/maps/FuchsiaCity_WardensHouse/scripts.pory"
	release
# 14 "data/maps/FuchsiaCity_WardensHouse/scripts.pory"
	end
# 15 "data/maps/FuchsiaCity_WardensHouse/scripts.pory"

# 16 "data/maps/FuchsiaCity_WardensHouse/scripts.pory"
FuchsiaCity_WardensHouse_EventScript_GiveGoldTeeth::
# 17 "data/maps/FuchsiaCity_WardensHouse/scripts.pory"
	textcolor NPC_TEXT_COLOR_NEUTRAL
# 18 "data/maps/FuchsiaCity_WardensHouse/scripts.pory"
	playfanfare MUS_OBTAIN_TMHM
# 19 "data/maps/FuchsiaCity_WardensHouse/scripts.pory"
	message FuchsiaCity_WardensHouse_Text_GaveGoldTeethToWarden
# 20 "data/maps/FuchsiaCity_WardensHouse/scripts.pory"
	waitmessage
# 21 "data/maps/FuchsiaCity_WardensHouse/scripts.pory"
	waitfanfare
# 22 "data/maps/FuchsiaCity_WardensHouse/scripts.pory"
	msgbox FuchsiaCity_WardensHouse_Text_WardenPoppedInHisTeeth
# 23 "data/maps/FuchsiaCity_WardensHouse/scripts.pory"
	call EventScript_RestorePrevTextColor
# 24 "data/maps/FuchsiaCity_WardensHouse/scripts.pory"
	checkplayergender
# 25 "data/maps/FuchsiaCity_WardensHouse/scripts.pory"
	call_if_eq VAR_RESULT, MALE, FuchsiaCity_WardensHouse_EventScript_WardenThanksMale
# 26 "data/maps/FuchsiaCity_WardensHouse/scripts.pory"
	call_if_eq VAR_RESULT, FEMALE, FuchsiaCity_WardensHouse_EventScript_WardenThanksFemale
# 27 "data/maps/FuchsiaCity_WardensHouse/scripts.pory"
	giveitem_msg FuchsiaCity_WardensHouse_Text_ReceivedHM04FromWarden, ITEM_HM04
# 28 "data/maps/FuchsiaCity_WardensHouse/scripts.pory"
	setflag FLAG_GOT_HM04
# 29 "data/maps/FuchsiaCity_WardensHouse/scripts.pory"
	removeitem ITEM_GOLD_TEETH
# 30 "data/maps/FuchsiaCity_WardensHouse/scripts.pory"
	release
# 31 "data/maps/FuchsiaCity_WardensHouse/scripts.pory"
	end
# 32 "data/maps/FuchsiaCity_WardensHouse/scripts.pory"

# 33 "data/maps/FuchsiaCity_WardensHouse/scripts.pory"
FuchsiaCity_WardensHouse_EventScript_WardenThanksMale::
# 34 "data/maps/FuchsiaCity_WardensHouse/scripts.pory"
	msgbox FuchsiaCity_WardensHouse_Text_ThanksSonGiveYouSomething
# 35 "data/maps/FuchsiaCity_WardensHouse/scripts.pory"
	return
# 36 "data/maps/FuchsiaCity_WardensHouse/scripts.pory"

# 37 "data/maps/FuchsiaCity_WardensHouse/scripts.pory"
FuchsiaCity_WardensHouse_EventScript_WardenThanksFemale::
# 38 "data/maps/FuchsiaCity_WardensHouse/scripts.pory"
	msgbox FuchsiaCity_WardensHouse_Text_ThanksLassieGiveYouSomething
# 39 "data/maps/FuchsiaCity_WardensHouse/scripts.pory"
	return
# 40 "data/maps/FuchsiaCity_WardensHouse/scripts.pory"

# 41 "data/maps/FuchsiaCity_WardensHouse/scripts.pory"
FuchsiaCity_WardensHouse_EventScript_WardenYes::
# 42 "data/maps/FuchsiaCity_WardensHouse/scripts.pory"
	msgbox FuchsiaCity_WardensHouse_Text_AhHowheeHoHoo
# 43 "data/maps/FuchsiaCity_WardensHouse/scripts.pory"
	return
# 44 "data/maps/FuchsiaCity_WardensHouse/scripts.pory"

# 45 "data/maps/FuchsiaCity_WardensHouse/scripts.pory"
FuchsiaCity_WardensHouse_EventScript_WardenNo::
# 46 "data/maps/FuchsiaCity_WardensHouse/scripts.pory"
	msgbox FuchsiaCity_WardensHouse_Text_HeOhayHeHaHoo
# 47 "data/maps/FuchsiaCity_WardensHouse/scripts.pory"
	return
# 48 "data/maps/FuchsiaCity_WardensHouse/scripts.pory"

# 49 "data/maps/FuchsiaCity_WardensHouse/scripts.pory"
FuchsiaCity_WardensHouse_EventScript_ExplainStrength::
# 50 "data/maps/FuchsiaCity_WardensHouse/scripts.pory"
	msgbox FuchsiaCity_WardensHouse_Text_ExplainStrength
# 51 "data/maps/FuchsiaCity_WardensHouse/scripts.pory"
	release
# 52 "data/maps/FuchsiaCity_WardensHouse/scripts.pory"
	end
# 53 "data/maps/FuchsiaCity_WardensHouse/scripts.pory"

# 54 "data/maps/FuchsiaCity_WardensHouse/scripts.pory"
FuchsiaCity_WardensHouse_EventScript_DisplaySign1::
# 55 "data/maps/FuchsiaCity_WardensHouse/scripts.pory"
	msgbox FuchsiaCity_WardensHouse_Text_MonPhotosFossilsOnDisplay, MSGBOX_SIGN
# 56 "data/maps/FuchsiaCity_WardensHouse/scripts.pory"
	end
# 57 "data/maps/FuchsiaCity_WardensHouse/scripts.pory"

# 58 "data/maps/FuchsiaCity_WardensHouse/scripts.pory"
FuchsiaCity_WardensHouse_EventScript_DisplaySign2::
# 59 "data/maps/FuchsiaCity_WardensHouse/scripts.pory"
	msgbox FuchsiaCity_WardensHouse_Text_OldMonMerchandiseOnDisplay, MSGBOX_SIGN
# 60 "data/maps/FuchsiaCity_WardensHouse/scripts.pory"
	end
