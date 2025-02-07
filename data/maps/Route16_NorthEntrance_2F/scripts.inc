# 1 "data/maps/Route16_NorthEntrance_2F/scripts.pory"

# 2 "data/maps/Route16_NorthEntrance_2F/scripts.pory"
.equ REQUIRED_CAUGHT_MONS, 40
# 3 "data/maps/Route16_NorthEntrance_2F/scripts.pory"

# 4 "data/maps/Route16_NorthEntrance_2F/scripts.pory"
Route16_NorthEntrance_2F_MapScripts::
# 5 "data/maps/Route16_NorthEntrance_2F/scripts.pory"
	.byte 0
# 6 "data/maps/Route16_NorthEntrance_2F/scripts.pory"

# 7 "data/maps/Route16_NorthEntrance_2F/scripts.pory"
Route16_NorthEntrance_2F_EventScript_LittleBoy::
# 8 "data/maps/Route16_NorthEntrance_2F/scripts.pory"
	msgbox Route16_NorthEntrance_2F_Text_OnBikeRideWithGirlfriend, MSGBOX_NPC
# 9 "data/maps/Route16_NorthEntrance_2F/scripts.pory"
	end
# 10 "data/maps/Route16_NorthEntrance_2F/scripts.pory"

# 11 "data/maps/Route16_NorthEntrance_2F/scripts.pory"
Route16_NorthEntrance_2F_EventScript_LittleGirl::
# 12 "data/maps/Route16_NorthEntrance_2F/scripts.pory"
	msgbox Route16_NorthEntrance_2F_Text_RidingTogetherOnNewBikes, MSGBOX_NPC
# 13 "data/maps/Route16_NorthEntrance_2F/scripts.pory"
	end
# 14 "data/maps/Route16_NorthEntrance_2F/scripts.pory"

# 15 "data/maps/Route16_NorthEntrance_2F/scripts.pory"
Route16_NorthEntrance_2F_EventScript_LeftBinoculars::
# 16 "data/maps/Route16_NorthEntrance_2F/scripts.pory"
	msgbox Route16_NorthEntrance_2F_Text_ItsCeladonDeptStore, MSGBOX_SIGN
# 17 "data/maps/Route16_NorthEntrance_2F/scripts.pory"
	end
# 18 "data/maps/Route16_NorthEntrance_2F/scripts.pory"

# 19 "data/maps/Route16_NorthEntrance_2F/scripts.pory"
Route16_NorthEntrance_2F_EventScript_RightBinoculars::
# 20 "data/maps/Route16_NorthEntrance_2F/scripts.pory"
	msgbox Route16_NorthEntrance_2F_Text_LongPathOverWater, MSGBOX_SIGN
# 21 "data/maps/Route16_NorthEntrance_2F/scripts.pory"
	end
# 22 "data/maps/Route16_NorthEntrance_2F/scripts.pory"

# 23 "data/maps/Route16_NorthEntrance_2F/scripts.pory"
Route16_NorthEntrance_2F_EventScript_Aide::
# 24 "data/maps/Route16_NorthEntrance_2F/scripts.pory"
	lock
# 25 "data/maps/Route16_NorthEntrance_2F/scripts.pory"
	faceplayer
# 26 "data/maps/Route16_NorthEntrance_2F/scripts.pory"
	call Route16_NorthEntrance_2F_EventScript_GetAideRequestInfo
# 27 "data/maps/Route16_NorthEntrance_2F/scripts.pory"
	goto_if_set FLAG_GOT_AMULET_COIN_FROM_OAKS_AIDE, Route16_NorthEntrance_2F_EventScript_AlreadyGotAmuletCoin
# 28 "data/maps/Route16_NorthEntrance_2F/scripts.pory"
	msgbox Route16_NorthEntrance_2F_Text_GiveAmuletCoinIfCaught40, MSGBOX_YESNO
# 29 "data/maps/Route16_NorthEntrance_2F/scripts.pory"
	goto_if_eq VAR_RESULT, NO, Aide_EventScript_DeclineCheckMons
# 30 "data/maps/Route16_NorthEntrance_2F/scripts.pory"
	setvar VAR_0x8004, 0
# 31 "data/maps/Route16_NorthEntrance_2F/scripts.pory"
	specialvar VAR_RESULT, GetPokedexCount
# 32 "data/maps/Route16_NorthEntrance_2F/scripts.pory"
	buffernumberstring STR_VAR_3, VAR_0x8006
# 33 "data/maps/Route16_NorthEntrance_2F/scripts.pory"
	call Route16_NorthEntrance_2F_EventScript_GetAideRequestInfo
# 34 "data/maps/Route16_NorthEntrance_2F/scripts.pory"
	goto_if_lt VAR_0x8006, REQUIRED_CAUGHT_MONS, Aide_EventScript_HaventCaughtEnough
# 35 "data/maps/Route16_NorthEntrance_2F/scripts.pory"
	msgbox Route16_NorthEntrance_2F_Text_GreatHereYouGo
# 36 "data/maps/Route16_NorthEntrance_2F/scripts.pory"
	checkitemspace ITEM_AMULET_COIN
# 37 "data/maps/Route16_NorthEntrance_2F/scripts.pory"
	goto_if_eq VAR_RESULT, FALSE, Aide_EventScript_NoRoomForItem
# 38 "data/maps/Route16_NorthEntrance_2F/scripts.pory"
	giveitem_msg Route16_NorthEntrance_2F_Text_ReceivedAmuletCoinFromAide, ITEM_AMULET_COIN
# 39 "data/maps/Route16_NorthEntrance_2F/scripts.pory"
	setflag FLAG_GOT_AMULET_COIN_FROM_OAKS_AIDE
# 40 "data/maps/Route16_NorthEntrance_2F/scripts.pory"
	msgbox Route16_NorthEntrance_2F_Text_ExplainAmuletCoin
# 41 "data/maps/Route16_NorthEntrance_2F/scripts.pory"
	release
# 42 "data/maps/Route16_NorthEntrance_2F/scripts.pory"
	end
# 43 "data/maps/Route16_NorthEntrance_2F/scripts.pory"

# 44 "data/maps/Route16_NorthEntrance_2F/scripts.pory"
Route16_NorthEntrance_2F_EventScript_AlreadyGotAmuletCoin::
# 45 "data/maps/Route16_NorthEntrance_2F/scripts.pory"
	msgbox Route16_NorthEntrance_2F_Text_ExplainAmuletCoin
# 46 "data/maps/Route16_NorthEntrance_2F/scripts.pory"
	release
# 47 "data/maps/Route16_NorthEntrance_2F/scripts.pory"
	end
# 48 "data/maps/Route16_NorthEntrance_2F/scripts.pory"

# 49 "data/maps/Route16_NorthEntrance_2F/scripts.pory"
Route16_NorthEntrance_2F_EventScript_GetAideRequestInfo::
# 50 "data/maps/Route16_NorthEntrance_2F/scripts.pory"
	buffernumberstring STR_VAR_1, REQUIRED_CAUGHT_MONS
# 51 "data/maps/Route16_NorthEntrance_2F/scripts.pory"
	bufferitemname STR_VAR_2, ITEM_AMULET_COIN
# 52 "data/maps/Route16_NorthEntrance_2F/scripts.pory"
	return
