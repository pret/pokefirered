# 1 "data/maps/SSAnne_CaptainsOffice/scripts.pory"

# 2 "data/maps/SSAnne_CaptainsOffice/scripts.pory"
.set LOCALID_CAPTAIN, 1
# 3 "data/maps/SSAnne_CaptainsOffice/scripts.pory"

# 4 "data/maps/SSAnne_CaptainsOffice/scripts.pory"
SSAnne_CaptainsOffice_MapScripts::
# 5 "data/maps/SSAnne_CaptainsOffice/scripts.pory"
	.byte 0
# 6 "data/maps/SSAnne_CaptainsOffice/scripts.pory"

# 7 "data/maps/SSAnne_CaptainsOffice/scripts.pory"
SSAnne_CaptainsOffice_EventScript_Captain::
# 8 "data/maps/SSAnne_CaptainsOffice/scripts.pory"
	lock
# 9 "data/maps/SSAnne_CaptainsOffice/scripts.pory"
	goto_if_set FLAG_GOT_HM01, SSAnne_CaptainsOffice_EventScript_AlreadyGotCut
# 10 "data/maps/SSAnne_CaptainsOffice/scripts.pory"
	msgbox SSAnne_CaptainsOffice_Text_CaptainIFeelSeasick
# 11 "data/maps/SSAnne_CaptainsOffice/scripts.pory"
	textcolor NPC_TEXT_COLOR_NEUTRAL
# 12 "data/maps/SSAnne_CaptainsOffice/scripts.pory"
	message SSAnne_CaptainsOffice_Text_RubbedCaptainsBack
# 13 "data/maps/SSAnne_CaptainsOffice/scripts.pory"
	waitmessage
# 14 "data/maps/SSAnne_CaptainsOffice/scripts.pory"
	playfanfare MUS_HEAL
# 15 "data/maps/SSAnne_CaptainsOffice/scripts.pory"
	waitfanfare
# 16 "data/maps/SSAnne_CaptainsOffice/scripts.pory"
	call EventScript_RestorePrevTextColor
# 17 "data/maps/SSAnne_CaptainsOffice/scripts.pory"
	delay 50
# 18 "data/maps/SSAnne_CaptainsOffice/scripts.pory"
	applymovement LOCALID_CAPTAIN, Common_Movement_FacePlayer
# 19 "data/maps/SSAnne_CaptainsOffice/scripts.pory"
	waitmovement 0
# 20 "data/maps/SSAnne_CaptainsOffice/scripts.pory"
	msgbox SSAnne_CaptainsOffice_Text_ThankYouHaveHMForCut
# 21 "data/maps/SSAnne_CaptainsOffice/scripts.pory"
	giveitem_msg SSAnne_CaptainsOffice_Text_ObtainedHM01FromCaptain, ITEM_HM01, 1, MUS_OBTAIN_KEY_ITEM
# 22 "data/maps/SSAnne_CaptainsOffice/scripts.pory"
	msgbox SSAnne_CaptainsOffice_Text_ExplainCut
# 23 "data/maps/SSAnne_CaptainsOffice/scripts.pory"
	setflag FLAG_GOT_HM01
# 24 "data/maps/SSAnne_CaptainsOffice/scripts.pory"
	setvar VAR_MAP_SCENE_VERMILION_CITY, 1
# 25 "data/maps/SSAnne_CaptainsOffice/scripts.pory"
	release
# 26 "data/maps/SSAnne_CaptainsOffice/scripts.pory"
	end
# 27 "data/maps/SSAnne_CaptainsOffice/scripts.pory"

# 28 "data/maps/SSAnne_CaptainsOffice/scripts.pory"
@ Unused
# 29 "data/maps/SSAnne_CaptainsOffice/scripts.pory"
SSAnne_CaptainsOffice_EventScript_NoRoomForCut::
# 30 "data/maps/SSAnne_CaptainsOffice/scripts.pory"
	msgbox SSAnne_CaptainsOffice_Text_YouHaveNoRoomForThis
# 31 "data/maps/SSAnne_CaptainsOffice/scripts.pory"
	closemessage
# 32 "data/maps/SSAnne_CaptainsOffice/scripts.pory"
	applymovement LOCALID_CAPTAIN, Common_Movement_FaceOriginalDirection
# 33 "data/maps/SSAnne_CaptainsOffice/scripts.pory"
	waitmovement 0
# 34 "data/maps/SSAnne_CaptainsOffice/scripts.pory"
	release
# 35 "data/maps/SSAnne_CaptainsOffice/scripts.pory"
	end
# 36 "data/maps/SSAnne_CaptainsOffice/scripts.pory"

# 37 "data/maps/SSAnne_CaptainsOffice/scripts.pory"
SSAnne_CaptainsOffice_EventScript_AlreadyGotCut::
# 38 "data/maps/SSAnne_CaptainsOffice/scripts.pory"
	applymovement LOCALID_CAPTAIN, Common_Movement_FacePlayer
# 39 "data/maps/SSAnne_CaptainsOffice/scripts.pory"
	waitmovement 0
# 40 "data/maps/SSAnne_CaptainsOffice/scripts.pory"
	msgbox SSAnne_CaptainsOffice_Text_SSAnneWillSetSailSoon
# 41 "data/maps/SSAnne_CaptainsOffice/scripts.pory"
	release
# 42 "data/maps/SSAnne_CaptainsOffice/scripts.pory"
	end
# 43 "data/maps/SSAnne_CaptainsOffice/scripts.pory"

# 44 "data/maps/SSAnne_CaptainsOffice/scripts.pory"
SSAnne_CaptainsOffice_EventScript_TrashCan::
# 45 "data/maps/SSAnne_CaptainsOffice/scripts.pory"
	msgbox SSAnne_CaptainsOffice_Text_YuckShouldntHaveLooked, MSGBOX_SIGN
# 46 "data/maps/SSAnne_CaptainsOffice/scripts.pory"
	end
# 47 "data/maps/SSAnne_CaptainsOffice/scripts.pory"

# 48 "data/maps/SSAnne_CaptainsOffice/scripts.pory"
SSAnne_CaptainsOffice_EventScript_Book::
# 49 "data/maps/SSAnne_CaptainsOffice/scripts.pory"
	msgbox SSAnne_CaptainsOffice_Text_HowToConquerSeasickness, MSGBOX_SIGN
# 50 "data/maps/SSAnne_CaptainsOffice/scripts.pory"
	end
