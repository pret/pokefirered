# 1 "data/maps/VermilionCity_House1/scripts.pory"

# 2 "data/maps/VermilionCity_House1/scripts.pory"
VermilionCity_House1_MapScripts::
# 3 "data/maps/VermilionCity_House1/scripts.pory"
	.byte 0
# 4 "data/maps/VermilionCity_House1/scripts.pory"

# 5 "data/maps/VermilionCity_House1/scripts.pory"
VermilionCity_House1_EventScript_FishingGuru::
# 6 "data/maps/VermilionCity_House1/scripts.pory"
	lock
# 7 "data/maps/VermilionCity_House1/scripts.pory"
	faceplayer
# 8 "data/maps/VermilionCity_House1/scripts.pory"
	goto_if_set FLAG_GOT_OLD_ROD, VermilionCity_House1_EventScript_AlreadyGotOldRod
# 9 "data/maps/VermilionCity_House1/scripts.pory"
	msgbox VermilionCity_House1_Text_ImFishingGuruDoYouLikeToFish, MSGBOX_YESNO
# 10 "data/maps/VermilionCity_House1/scripts.pory"
	goto_if_eq VAR_RESULT, YES, VermilionCity_House1_EventScript_GiveOldRod
# 11 "data/maps/VermilionCity_House1/scripts.pory"
	msgbox VermilionCity_House1_Text_OhThatsSoDisappointing
# 12 "data/maps/VermilionCity_House1/scripts.pory"
	release
# 13 "data/maps/VermilionCity_House1/scripts.pory"
	end
# 14 "data/maps/VermilionCity_House1/scripts.pory"

# 15 "data/maps/VermilionCity_House1/scripts.pory"
VermilionCity_House1_EventScript_AlreadyGotOldRod::
# 16 "data/maps/VermilionCity_House1/scripts.pory"
	msgbox VermilionCity_House1_Text_HowAreTheFishBiting
# 17 "data/maps/VermilionCity_House1/scripts.pory"
	release
# 18 "data/maps/VermilionCity_House1/scripts.pory"
	end
# 19 "data/maps/VermilionCity_House1/scripts.pory"

# 20 "data/maps/VermilionCity_House1/scripts.pory"
VermilionCity_House1_EventScript_GiveOldRod::
# 21 "data/maps/VermilionCity_House1/scripts.pory"
	checkitemspace ITEM_OLD_ROD
# 22 "data/maps/VermilionCity_House1/scripts.pory"
	goto_if_eq VAR_RESULT, FALSE, VermilionCity_House1_EventScript_NoRoomForOldRod
# 23 "data/maps/VermilionCity_House1/scripts.pory"
	additem ITEM_OLD_ROD
# 24 "data/maps/VermilionCity_House1/scripts.pory"
	msgbox VermilionCity_House1_Text_TakeThisAndFish
# 25 "data/maps/VermilionCity_House1/scripts.pory"
	msgreceiveditem VermilionCity_House1_Text_ReceivedOldRodFromFishingGuru, ITEM_OLD_ROD
# 26 "data/maps/VermilionCity_House1/scripts.pory"
	setflag FLAG_GOT_OLD_ROD
# 27 "data/maps/VermilionCity_House1/scripts.pory"
	msgbox VermilionCity_House1_Text_FishingIsAWayOfLife
# 28 "data/maps/VermilionCity_House1/scripts.pory"
	release
# 29 "data/maps/VermilionCity_House1/scripts.pory"
	end
# 30 "data/maps/VermilionCity_House1/scripts.pory"

# 31 "data/maps/VermilionCity_House1/scripts.pory"
VermilionCity_House1_EventScript_NoRoomForOldRod::
# 32 "data/maps/VermilionCity_House1/scripts.pory"
	msgbox VermilionCity_House1_Text_NoRoomForNiceGift
# 33 "data/maps/VermilionCity_House1/scripts.pory"
	release
# 34 "data/maps/VermilionCity_House1/scripts.pory"
	end
