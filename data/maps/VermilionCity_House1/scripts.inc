VermilionCity_House1_MapScripts:: @ 816B3A6
	.byte 0

VermilionCity_House1_EventScript_FishingGuru:: @ 816B3A7
	lock
	faceplayer
	goto_if_set FLAG_GOT_OLD_ROD, VermilionCity_House1_EventScript_AlreadyGotOldRod
	msgbox VermilionCity_House1_Text_ImFishingGuruDoYouLikeToFish, MSGBOX_YESNO
	compare VAR_RESULT, YES
	goto_if_eq VermilionCity_House1_EventScript_GiveOldRod
	msgbox VermilionCity_House1_Text_OhThatsSoDisappointing
	release
	end

VermilionCity_House1_EventScript_AlreadyGotOldRod:: @ 816B3CF
	msgbox VermilionCity_House1_Text_HowAreTheFishBiting
	release
	end

VermilionCity_House1_EventScript_GiveOldRod:: @ 816B3D9
	checkitemspace ITEM_OLD_ROD, 1
	compare VAR_RESULT, FALSE
	goto_if_eq VermilionCity_House1_EventScript_NoRoomForOldRod
	additem ITEM_OLD_ROD
	msgbox VermilionCity_House1_Text_TakeThisAndFish
	msgreceiveditem VermilionCity_House1_Text_ReceivedOldRodFromFishingGuru, ITEM_OLD_ROD
	setflag FLAG_GOT_OLD_ROD
	msgbox VermilionCity_House1_Text_FishingIsAWayOfLife
	release
	end

VermilionCity_House1_EventScript_NoRoomForOldRod:: @ 816B41A
	msgbox VermilionCity_House1_Text_NoRoomForNiceGift
	release
	end
