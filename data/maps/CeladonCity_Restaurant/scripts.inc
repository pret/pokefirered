# 1 "data/maps/CeladonCity_Restaurant/scripts.pory"

# 2 "data/maps/CeladonCity_Restaurant/scripts.pory"
CeladonCity_Restaurant_MapScripts::
# 3 "data/maps/CeladonCity_Restaurant/scripts.pory"
	.byte 0
# 4 "data/maps/CeladonCity_Restaurant/scripts.pory"

# 5 "data/maps/CeladonCity_Restaurant/scripts.pory"
CeladonCity_Restaurant_EventScript_Chef::
# 6 "data/maps/CeladonCity_Restaurant/scripts.pory"
	msgbox CeladonCity_Restaurant_Text_TakingBreakRightNow, MSGBOX_NPC
# 7 "data/maps/CeladonCity_Restaurant/scripts.pory"
	end
# 8 "data/maps/CeladonCity_Restaurant/scripts.pory"

# 9 "data/maps/CeladonCity_Restaurant/scripts.pory"
CeladonCity_Restaurant_EventScript_Woman::
# 10 "data/maps/CeladonCity_Restaurant/scripts.pory"
	msgbox CeladonCity_Restaurant_Text_OftenGoToDrugstore, MSGBOX_NPC
# 11 "data/maps/CeladonCity_Restaurant/scripts.pory"
	end
# 12 "data/maps/CeladonCity_Restaurant/scripts.pory"

# 13 "data/maps/CeladonCity_Restaurant/scripts.pory"
CeladonCity_Restaurant_EventScript_CoinCaseMan::
# 14 "data/maps/CeladonCity_Restaurant/scripts.pory"
	lock
# 15 "data/maps/CeladonCity_Restaurant/scripts.pory"
	faceplayer
# 16 "data/maps/CeladonCity_Restaurant/scripts.pory"
	goto_if_set FLAG_GOT_COIN_CASE, CeladonCity_Restaurant_EventScript_AlreadyGotCoinCase
# 17 "data/maps/CeladonCity_Restaurant/scripts.pory"
	msgbox CeladonCity_Restaurant_Text_TakeThisImBusted
# 18 "data/maps/CeladonCity_Restaurant/scripts.pory"
	checkitemspace ITEM_COIN_CASE
# 19 "data/maps/CeladonCity_Restaurant/scripts.pory"
	goto_if_eq VAR_RESULT, FALSE, CeladonCity_Restaurant_EventScript_NoRoomForCoinCase
# 20 "data/maps/CeladonCity_Restaurant/scripts.pory"
	giveitem_msg CeladonCity_Restaurant_Text_ReceivedCoinCaseFromMan, ITEM_COIN_CASE
# 21 "data/maps/CeladonCity_Restaurant/scripts.pory"
	setflag FLAG_GOT_COIN_CASE
# 22 "data/maps/CeladonCity_Restaurant/scripts.pory"
	release
# 23 "data/maps/CeladonCity_Restaurant/scripts.pory"
	end
# 24 "data/maps/CeladonCity_Restaurant/scripts.pory"

# 25 "data/maps/CeladonCity_Restaurant/scripts.pory"
CeladonCity_Restaurant_EventScript_NoRoomForCoinCase::
# 26 "data/maps/CeladonCity_Restaurant/scripts.pory"
	msgbox CeladonCity_Restaurant_Text_MakeRoomForThis
# 27 "data/maps/CeladonCity_Restaurant/scripts.pory"
	release
# 28 "data/maps/CeladonCity_Restaurant/scripts.pory"
	end
# 29 "data/maps/CeladonCity_Restaurant/scripts.pory"

# 30 "data/maps/CeladonCity_Restaurant/scripts.pory"
CeladonCity_Restaurant_EventScript_AlreadyGotCoinCase::
# 31 "data/maps/CeladonCity_Restaurant/scripts.pory"
	msgbox CeladonCity_Restaurant_Text_ThoughtIdWinItBack
# 32 "data/maps/CeladonCity_Restaurant/scripts.pory"
	release
# 33 "data/maps/CeladonCity_Restaurant/scripts.pory"
	end
# 34 "data/maps/CeladonCity_Restaurant/scripts.pory"

# 35 "data/maps/CeladonCity_Restaurant/scripts.pory"
CeladonCity_Restaurant_EventScript_WorkerM::
# 36 "data/maps/CeladonCity_Restaurant/scripts.pory"
	msgbox CeladonCity_Restaurant_Text_PsstBasementUnderGameCorner, MSGBOX_NPC
# 37 "data/maps/CeladonCity_Restaurant/scripts.pory"
	end
# 38 "data/maps/CeladonCity_Restaurant/scripts.pory"

# 39 "data/maps/CeladonCity_Restaurant/scripts.pory"
CeladonCity_Restaurant_EventScript_FatMan::
# 40 "data/maps/CeladonCity_Restaurant/scripts.pory"
	msgbox CeladonCity_Restaurant_Text_ManLostItAllAtSlots, MSGBOX_NPC
# 41 "data/maps/CeladonCity_Restaurant/scripts.pory"
	end
