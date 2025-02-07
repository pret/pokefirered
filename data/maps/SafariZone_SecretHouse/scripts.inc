# 1 "data/maps/SafariZone_SecretHouse/scripts.pory"

# 2 "data/maps/SafariZone_SecretHouse/scripts.pory"
SafariZone_SecretHouse_MapScripts::
# 3 "data/maps/SafariZone_SecretHouse/scripts.pory"
	.byte 0
# 4 "data/maps/SafariZone_SecretHouse/scripts.pory"

# 5 "data/maps/SafariZone_SecretHouse/scripts.pory"
SafariZone_SecretHouse_EventScript_Attendant::
# 6 "data/maps/SafariZone_SecretHouse/scripts.pory"
	lock
# 7 "data/maps/SafariZone_SecretHouse/scripts.pory"
	faceplayer
# 8 "data/maps/SafariZone_SecretHouse/scripts.pory"
	goto_if_set FLAG_GOT_HM03, SafariZone_SecretHouse_EventScript_ExplainSurf
# 9 "data/maps/SafariZone_SecretHouse/scripts.pory"
	msgbox SafariZone_SecretHouse_Text_CongratsYouveWon
# 10 "data/maps/SafariZone_SecretHouse/scripts.pory"
	checkitemspace ITEM_HM03
# 11 "data/maps/SafariZone_SecretHouse/scripts.pory"
	goto_if_eq VAR_RESULT, FALSE, SafariZone_SecretHouse_EventScript_NoRoomForHM03
# 12 "data/maps/SafariZone_SecretHouse/scripts.pory"
	giveitem_msg SafariZone_SecretHouse_Text_ReceivedHM03FromAttendant, ITEM_HM03
# 13 "data/maps/SafariZone_SecretHouse/scripts.pory"
	msgbox SafariZone_SecretHouse_Text_ExplainSurf
# 14 "data/maps/SafariZone_SecretHouse/scripts.pory"
	setflag FLAG_GOT_HM03
# 15 "data/maps/SafariZone_SecretHouse/scripts.pory"
	release
# 16 "data/maps/SafariZone_SecretHouse/scripts.pory"
	end
# 17 "data/maps/SafariZone_SecretHouse/scripts.pory"

# 18 "data/maps/SafariZone_SecretHouse/scripts.pory"
SafariZone_SecretHouse_EventScript_NoRoomForHM03::
# 19 "data/maps/SafariZone_SecretHouse/scripts.pory"
	msgbox SafariZone_SecretHouse_Text_DontHaveRoomForPrize
# 20 "data/maps/SafariZone_SecretHouse/scripts.pory"
	release
# 21 "data/maps/SafariZone_SecretHouse/scripts.pory"
	end
# 22 "data/maps/SafariZone_SecretHouse/scripts.pory"

# 23 "data/maps/SafariZone_SecretHouse/scripts.pory"
SafariZone_SecretHouse_EventScript_ExplainSurf::
# 24 "data/maps/SafariZone_SecretHouse/scripts.pory"
	msgbox SafariZone_SecretHouse_Text_ExplainSurf
# 25 "data/maps/SafariZone_SecretHouse/scripts.pory"
	release
# 26 "data/maps/SafariZone_SecretHouse/scripts.pory"
	end
