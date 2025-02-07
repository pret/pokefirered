# 1 "data/maps/FiveIsland_MemorialPillar/scripts.pory"

# 2 "data/maps/FiveIsland_MemorialPillar/scripts.pory"
.set LOCALID_MEMORIAL_MAN, 1
# 3 "data/maps/FiveIsland_MemorialPillar/scripts.pory"

# 4 "data/maps/FiveIsland_MemorialPillar/scripts.pory"
FiveIsland_MemorialPillar_MapScripts::
# 5 "data/maps/FiveIsland_MemorialPillar/scripts.pory"
	.byte 0
# 6 "data/maps/FiveIsland_MemorialPillar/scripts.pory"

# 7 "data/maps/FiveIsland_MemorialPillar/scripts.pory"
FiveIsland_MemorialPillar_EventScript_MemorialMan::
# 8 "data/maps/FiveIsland_MemorialPillar/scripts.pory"
	lock
# 9 "data/maps/FiveIsland_MemorialPillar/scripts.pory"
	goto_if_set FLAG_GOT_TM42_AT_MEMORIAL_PILLAR, FiveIsland_MemorialPillar_EventScript_AlreadyGotTM42
# 10 "data/maps/FiveIsland_MemorialPillar/scripts.pory"
	goto_if_set FLAG_NO_ROOM_FOR_TM42_AT_MEMORIAL_PILLAR, FiveIsland_MemorialPillar_EventScript_ReturnedForTM42
# 11 "data/maps/FiveIsland_MemorialPillar/scripts.pory"
	msgbox FiveIsland_MemorialPillar_Text_ScrubScrub
# 12 "data/maps/FiveIsland_MemorialPillar/scripts.pory"
	closemessage
# 13 "data/maps/FiveIsland_MemorialPillar/scripts.pory"
	applymovement LOCALID_MEMORIAL_MAN, Common_Movement_FacePlayer
# 14 "data/maps/FiveIsland_MemorialPillar/scripts.pory"
	waitmovement 0
# 15 "data/maps/FiveIsland_MemorialPillar/scripts.pory"
	delay 45
# 16 "data/maps/FiveIsland_MemorialPillar/scripts.pory"
	msgbox FiveIsland_MemorialPillar_Text_YourMonsLookHealthy
# 17 "data/maps/FiveIsland_MemorialPillar/scripts.pory"
	applymovement LOCALID_MEMORIAL_MAN, Common_Movement_WalkInPlaceFasterUp
# 18 "data/maps/FiveIsland_MemorialPillar/scripts.pory"
	waitmovement 0
# 19 "data/maps/FiveIsland_MemorialPillar/scripts.pory"
	msgbox FiveIsland_MemorialPillar_Text_ThisIsWhereIBuriedMyOnix
# 20 "data/maps/FiveIsland_MemorialPillar/scripts.pory"
	release
# 21 "data/maps/FiveIsland_MemorialPillar/scripts.pory"
	end
# 22 "data/maps/FiveIsland_MemorialPillar/scripts.pory"

# 23 "data/maps/FiveIsland_MemorialPillar/scripts.pory"
FiveIsland_MemorialPillar_EventScript_AlreadyGotTM42::
# 24 "data/maps/FiveIsland_MemorialPillar/scripts.pory"
	msgbox FiveIsland_MemorialPillar_Text_ScrubScrubTectonix
# 25 "data/maps/FiveIsland_MemorialPillar/scripts.pory"
	release
# 26 "data/maps/FiveIsland_MemorialPillar/scripts.pory"
	end
# 27 "data/maps/FiveIsland_MemorialPillar/scripts.pory"

# 28 "data/maps/FiveIsland_MemorialPillar/scripts.pory"
FiveIsland_MemorialPillar_EventScript_ReturnedForTM42::
# 29 "data/maps/FiveIsland_MemorialPillar/scripts.pory"
	msgbox FiveIsland_MemorialPillar_Text_StillHaveThingAsMyThanks
# 30 "data/maps/FiveIsland_MemorialPillar/scripts.pory"
	giveitem ITEM_TM42
# 31 "data/maps/FiveIsland_MemorialPillar/scripts.pory"
	goto_if_eq VAR_RESULT, FALSE, FiveIsland_MemorialPillar_EventScript_NoRoomForTM42
# 32 "data/maps/FiveIsland_MemorialPillar/scripts.pory"
	call FiveIsland_MemorialPillar_EventScript_ReceivedTM42
# 33 "data/maps/FiveIsland_MemorialPillar/scripts.pory"
	release
# 34 "data/maps/FiveIsland_MemorialPillar/scripts.pory"
	end
# 35 "data/maps/FiveIsland_MemorialPillar/scripts.pory"

# 36 "data/maps/FiveIsland_MemorialPillar/scripts.pory"
FiveIsland_MemorialPillar_EventScript_Memorial::
# 37 "data/maps/FiveIsland_MemorialPillar/scripts.pory"
	goto_if_questlog EventScript_ReleaseEnd
# 38 "data/maps/FiveIsland_MemorialPillar/scripts.pory"
	special QuestLog_CutRecording
# 39 "data/maps/FiveIsland_MemorialPillar/scripts.pory"
	lockall
# 40 "data/maps/FiveIsland_MemorialPillar/scripts.pory"
	goto_if_set FLAG_GOT_TM42_AT_MEMORIAL_PILLAR, FiveIsland_MemorialPillar_EventScript_MemorialLemonadeAlreadyPlaced
# 41 "data/maps/FiveIsland_MemorialPillar/scripts.pory"
	goto_if_set FLAG_NO_ROOM_FOR_TM42_AT_MEMORIAL_PILLAR, FiveIsland_MemorialPillar_EventScript_MemorialLemonadeAlreadyPlaced
# 42 "data/maps/FiveIsland_MemorialPillar/scripts.pory"
	msgbox FiveIsland_MemorialPillar_Text_HereLiesTectonixLemonadeOffering
# 43 "data/maps/FiveIsland_MemorialPillar/scripts.pory"
	checkitem ITEM_LEMONADE
# 44 "data/maps/FiveIsland_MemorialPillar/scripts.pory"
	goto_if_eq VAR_RESULT, TRUE, FiveIsland_MemorialPillar_EventScript_AskPlaceLemonade
# 45 "data/maps/FiveIsland_MemorialPillar/scripts.pory"
	releaseall
# 46 "data/maps/FiveIsland_MemorialPillar/scripts.pory"
	end
# 47 "data/maps/FiveIsland_MemorialPillar/scripts.pory"

# 48 "data/maps/FiveIsland_MemorialPillar/scripts.pory"
FiveIsland_MemorialPillar_EventScript_AskPlaceLemonade::
# 49 "data/maps/FiveIsland_MemorialPillar/scripts.pory"
	msgbox FiveIsland_MemorialPillar_Text_LeaveAnotherLemonadeOffering, MSGBOX_YESNO
# 50 "data/maps/FiveIsland_MemorialPillar/scripts.pory"
	goto_if_eq VAR_RESULT, YES, FiveIsland_MemorialPillar_EventScript_PlaceLemonade
# 51 "data/maps/FiveIsland_MemorialPillar/scripts.pory"
	releaseall
# 52 "data/maps/FiveIsland_MemorialPillar/scripts.pory"
	end
# 53 "data/maps/FiveIsland_MemorialPillar/scripts.pory"

# 54 "data/maps/FiveIsland_MemorialPillar/scripts.pory"
FiveIsland_MemorialPillar_EventScript_PlaceLemonade::
# 55 "data/maps/FiveIsland_MemorialPillar/scripts.pory"
	removeitem ITEM_LEMONADE
# 56 "data/maps/FiveIsland_MemorialPillar/scripts.pory"
	msgbox FiveIsland_MemorialPillar_Text_PlacedCanOfLemonade
# 57 "data/maps/FiveIsland_MemorialPillar/scripts.pory"
	closemessage
# 58 "data/maps/FiveIsland_MemorialPillar/scripts.pory"
	applymovement LOCALID_MEMORIAL_MAN, Common_Movement_WalkInPlaceFasterRight
# 59 "data/maps/FiveIsland_MemorialPillar/scripts.pory"
	waitmovement 0
# 60 "data/maps/FiveIsland_MemorialPillar/scripts.pory"
	delay 45
# 61 "data/maps/FiveIsland_MemorialPillar/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, Common_Movement_WalkInPlaceFasterLeft
# 62 "data/maps/FiveIsland_MemorialPillar/scripts.pory"
	waitmovement 0
# 63 "data/maps/FiveIsland_MemorialPillar/scripts.pory"
	textcolor NPC_TEXT_COLOR_MALE
# 64 "data/maps/FiveIsland_MemorialPillar/scripts.pory"
	msgbox FiveIsland_MemorialPillar_Text_ThankYouPleaseTakeThis
# 65 "data/maps/FiveIsland_MemorialPillar/scripts.pory"
	giveitem ITEM_TM42
# 66 "data/maps/FiveIsland_MemorialPillar/scripts.pory"
	goto_if_eq VAR_RESULT, FALSE, FiveIsland_MemorialPillar_EventScript_NoRoomForTM42
# 67 "data/maps/FiveIsland_MemorialPillar/scripts.pory"
	call FiveIsland_MemorialPillar_EventScript_ReceivedTM42
# 68 "data/maps/FiveIsland_MemorialPillar/scripts.pory"
	releaseall
# 69 "data/maps/FiveIsland_MemorialPillar/scripts.pory"
	end
# 70 "data/maps/FiveIsland_MemorialPillar/scripts.pory"

# 71 "data/maps/FiveIsland_MemorialPillar/scripts.pory"
FiveIsland_MemorialPillar_EventScript_ReceivedTM42::
# 72 "data/maps/FiveIsland_MemorialPillar/scripts.pory"
	msgbox FiveIsland_MemorialPillar_Text_BeGoodToYourMonsToo
# 73 "data/maps/FiveIsland_MemorialPillar/scripts.pory"
	applymovement LOCALID_MEMORIAL_MAN, Common_Movement_WalkInPlaceFasterUp
# 74 "data/maps/FiveIsland_MemorialPillar/scripts.pory"
	waitmovement 0
# 75 "data/maps/FiveIsland_MemorialPillar/scripts.pory"
	setflag FLAG_GOT_TM42_AT_MEMORIAL_PILLAR
# 76 "data/maps/FiveIsland_MemorialPillar/scripts.pory"
	return
# 77 "data/maps/FiveIsland_MemorialPillar/scripts.pory"

# 78 "data/maps/FiveIsland_MemorialPillar/scripts.pory"
FiveIsland_MemorialPillar_EventScript_NoRoomForTM42::
# 79 "data/maps/FiveIsland_MemorialPillar/scripts.pory"
	setflag FLAG_NO_ROOM_FOR_TM42_AT_MEMORIAL_PILLAR
# 80 "data/maps/FiveIsland_MemorialPillar/scripts.pory"
	msgbox FiveIsland_MemorialPillar_Text_DontHaveRoomForIt
# 81 "data/maps/FiveIsland_MemorialPillar/scripts.pory"
	releaseall
# 82 "data/maps/FiveIsland_MemorialPillar/scripts.pory"
	end
# 83 "data/maps/FiveIsland_MemorialPillar/scripts.pory"

# 84 "data/maps/FiveIsland_MemorialPillar/scripts.pory"
FiveIsland_MemorialPillar_EventScript_MemorialLemonadeAlreadyPlaced::
# 85 "data/maps/FiveIsland_MemorialPillar/scripts.pory"
	msgbox FiveIsland_MemorialPillar_Text_HereLiesTectonix
# 86 "data/maps/FiveIsland_MemorialPillar/scripts.pory"
	releaseall
# 87 "data/maps/FiveIsland_MemorialPillar/scripts.pory"
	end
