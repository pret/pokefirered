# 1 "data/maps/Route2_EastBuilding/scripts.pory"

# 2 "data/maps/Route2_EastBuilding/scripts.pory"
.equ REQUIRED_SEEN_MONS, 10
# 3 "data/maps/Route2_EastBuilding/scripts.pory"

# 4 "data/maps/Route2_EastBuilding/scripts.pory"
Route2_EastBuilding_MapScripts::
# 5 "data/maps/Route2_EastBuilding/scripts.pory"
	.byte 0
# 6 "data/maps/Route2_EastBuilding/scripts.pory"

# 7 "data/maps/Route2_EastBuilding/scripts.pory"
Route2_EastBuilding_EventScript_Aide::
# 8 "data/maps/Route2_EastBuilding/scripts.pory"
	lock
# 9 "data/maps/Route2_EastBuilding/scripts.pory"
	faceplayer
# 10 "data/maps/Route2_EastBuilding/scripts.pory"
	call Route2_EastBuilding_EventScript_GetAideRequestInfo
# 11 "data/maps/Route2_EastBuilding/scripts.pory"
	goto_if_set FLAG_GOT_HM05, Route2_EastBuilding_EventScript_AlreadyGotHM05
# 12 "data/maps/Route2_EastBuilding/scripts.pory"
	msgbox Route2_EastBuilding_Text_GiveHM05IfSeen10Mons, MSGBOX_YESNO
# 13 "data/maps/Route2_EastBuilding/scripts.pory"
	goto_if_eq VAR_RESULT, NO, Aide_EventScript_DeclineCheckMons
# 14 "data/maps/Route2_EastBuilding/scripts.pory"
	setvar VAR_0x8004, 0
# 15 "data/maps/Route2_EastBuilding/scripts.pory"
	specialvar VAR_RESULT, GetPokedexCount
# 16 "data/maps/Route2_EastBuilding/scripts.pory"
	buffernumberstring STR_VAR_3, VAR_0x8006
# 17 "data/maps/Route2_EastBuilding/scripts.pory"
	call Route2_EastBuilding_EventScript_GetAideRequestInfo
# 18 "data/maps/Route2_EastBuilding/scripts.pory"
	goto_if_lt VAR_0x8006, REQUIRED_SEEN_MONS, Aide_EventScript_HaventCaughtEnough
# 19 "data/maps/Route2_EastBuilding/scripts.pory"
	msgbox Route2_EastBuilding_Text_GreatHereYouGo
# 20 "data/maps/Route2_EastBuilding/scripts.pory"
	checkitemspace ITEM_HM05
# 21 "data/maps/Route2_EastBuilding/scripts.pory"
	goto_if_eq VAR_RESULT, FALSE, Aide_EventScript_NoRoomForItem
# 22 "data/maps/Route2_EastBuilding/scripts.pory"
	giveitem_msg Route2_EastBuilding_Text_ReceivedHM05FromAide, ITEM_HM05
# 23 "data/maps/Route2_EastBuilding/scripts.pory"
	setflag FLAG_GOT_HM05
# 24 "data/maps/Route2_EastBuilding/scripts.pory"
	msgbox Route2_EastBuilding_Text_ExplainHM05
# 25 "data/maps/Route2_EastBuilding/scripts.pory"
	release
# 26 "data/maps/Route2_EastBuilding/scripts.pory"
	end
# 27 "data/maps/Route2_EastBuilding/scripts.pory"

# 28 "data/maps/Route2_EastBuilding/scripts.pory"
Route2_EastBuilding_EventScript_AlreadyGotHM05::
# 29 "data/maps/Route2_EastBuilding/scripts.pory"
	msgbox Route2_EastBuilding_Text_ExplainHM05
# 30 "data/maps/Route2_EastBuilding/scripts.pory"
	release
# 31 "data/maps/Route2_EastBuilding/scripts.pory"
	end
# 32 "data/maps/Route2_EastBuilding/scripts.pory"

# 33 "data/maps/Route2_EastBuilding/scripts.pory"
Route2_EastBuilding_EventScript_GetAideRequestInfo::
# 34 "data/maps/Route2_EastBuilding/scripts.pory"
	buffernumberstring STR_VAR_1, REQUIRED_SEEN_MONS
# 35 "data/maps/Route2_EastBuilding/scripts.pory"
	bufferitemname STR_VAR_2, ITEM_HM05
# 36 "data/maps/Route2_EastBuilding/scripts.pory"
	return
# 37 "data/maps/Route2_EastBuilding/scripts.pory"

# 38 "data/maps/Route2_EastBuilding/scripts.pory"
Route2_EastBuilding_EventScript_Rocker::
# 39 "data/maps/Route2_EastBuilding/scripts.pory"
	msgbox Route2_EastBuilding_Text_CanGetThroughRockTunnel, MSGBOX_NPC
# 40 "data/maps/Route2_EastBuilding/scripts.pory"
	end
