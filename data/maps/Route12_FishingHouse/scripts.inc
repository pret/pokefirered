# 1 "data/maps/Route12_FishingHouse/scripts.pory"

# 2 "data/maps/Route12_FishingHouse/scripts.pory"
Route12_FishingHouse_MapScripts::
# 3 "data/maps/Route12_FishingHouse/scripts.pory"
	.byte 0
# 4 "data/maps/Route12_FishingHouse/scripts.pory"

# 5 "data/maps/Route12_FishingHouse/scripts.pory"
Route12_FishingHouse_EventScript_FishingGuruBrother::
# 6 "data/maps/Route12_FishingHouse/scripts.pory"
	lock
# 7 "data/maps/Route12_FishingHouse/scripts.pory"
	faceplayer
# 8 "data/maps/Route12_FishingHouse/scripts.pory"
	goto_if_set FLAG_GOT_SUPER_ROD, Route12_FishingHouse_EventScript_CheckMagikarpRecord
# 9 "data/maps/Route12_FishingHouse/scripts.pory"
	msgbox Route12_FishingHouse_Text_DoYouLikeToFish, MSGBOX_YESNO
# 10 "data/maps/Route12_FishingHouse/scripts.pory"
	goto_if_eq VAR_RESULT, YES, Route12_FishingHouse_EventScript_GiveSuperRod
# 11 "data/maps/Route12_FishingHouse/scripts.pory"
	msgbox Route12_FishingHouse_Text_OhThatsDisappointing
# 12 "data/maps/Route12_FishingHouse/scripts.pory"
	release
# 13 "data/maps/Route12_FishingHouse/scripts.pory"
	end
# 14 "data/maps/Route12_FishingHouse/scripts.pory"

# 15 "data/maps/Route12_FishingHouse/scripts.pory"
Route12_FishingHouse_EventScript_GiveSuperRod::
# 16 "data/maps/Route12_FishingHouse/scripts.pory"
	checkitemspace ITEM_SUPER_ROD
# 17 "data/maps/Route12_FishingHouse/scripts.pory"
	goto_if_eq VAR_RESULT, FALSE, Route12_FishingHouse_EventScript_NoRoomForSuperRod
# 18 "data/maps/Route12_FishingHouse/scripts.pory"
	additem ITEM_SUPER_ROD
# 19 "data/maps/Route12_FishingHouse/scripts.pory"
	msgbox Route12_FishingHouse_Text_TakeThisAndFish
# 20 "data/maps/Route12_FishingHouse/scripts.pory"
	msgreceiveditem Route12_FishingHouse_Text_ReceivedSuperRod, ITEM_SUPER_ROD
# 21 "data/maps/Route12_FishingHouse/scripts.pory"
	setflag FLAG_GOT_SUPER_ROD
# 22 "data/maps/Route12_FishingHouse/scripts.pory"
	msgbox Route12_FishingHouse_Text_IfYouCatchBigMagikarpShowMe
# 23 "data/maps/Route12_FishingHouse/scripts.pory"
	release
# 24 "data/maps/Route12_FishingHouse/scripts.pory"
	end
# 25 "data/maps/Route12_FishingHouse/scripts.pory"

# 26 "data/maps/Route12_FishingHouse/scripts.pory"
Route12_FishingHouse_EventScript_NoRoomForSuperRod::
# 27 "data/maps/Route12_FishingHouse/scripts.pory"
	msgbox Route12_FishingHouse_Text_NoRoomForGift
# 28 "data/maps/Route12_FishingHouse/scripts.pory"
	release
# 29 "data/maps/Route12_FishingHouse/scripts.pory"
	end
# 30 "data/maps/Route12_FishingHouse/scripts.pory"

# 31 "data/maps/Route12_FishingHouse/scripts.pory"
Route12_FishingHouse_EventScript_CheckMagikarpRecord::
# 32 "data/maps/Route12_FishingHouse/scripts.pory"
	goto_if_questlog EventScript_ReleaseEnd
# 33 "data/maps/Route12_FishingHouse/scripts.pory"
	special QuestLog_CutRecording
# 34 "data/maps/Route12_FishingHouse/scripts.pory"
	setvar VAR_0x8004, SPECIES_MAGIKARP
# 35 "data/maps/Route12_FishingHouse/scripts.pory"
	specialvar VAR_RESULT, DoesPlayerPartyContainSpecies
# 36 "data/maps/Route12_FishingHouse/scripts.pory"
	goto_if_eq VAR_RESULT, FALSE, Route12_FishingHouse_EventScript_NoMagikarpInParty
# 37 "data/maps/Route12_FishingHouse/scripts.pory"
	special GetMagikarpSizeRecordInfo
# 38 "data/maps/Route12_FishingHouse/scripts.pory"
	msgbox Route12_FishingHouse_Text_OhMagikarpAllowMeToSee
# 39 "data/maps/Route12_FishingHouse/scripts.pory"
	special ChoosePartyMon
# 40 "data/maps/Route12_FishingHouse/scripts.pory"
	waitstate
# 41 "data/maps/Route12_FishingHouse/scripts.pory"
	copyvar VAR_RESULT, VAR_0x8004
# 42 "data/maps/Route12_FishingHouse/scripts.pory"
	goto_if_ge VAR_RESULT, PARTY_SIZE, Route12_FishingHouse_EventScript_CancelShowMon
# 43 "data/maps/Route12_FishingHouse/scripts.pory"
	special CompareMagikarpSize
# 44 "data/maps/Route12_FishingHouse/scripts.pory"
	goto_if_eq VAR_RESULT, 1, Route12_FishingHouse_EventScript_NotMagikarp
# 45 "data/maps/Route12_FishingHouse/scripts.pory"
	goto_if_eq VAR_RESULT, 2, Route12_FishingHouse_EventScript_NotRecordMagikarp
# 46 "data/maps/Route12_FishingHouse/scripts.pory"
	goto_if_eq VAR_RESULT, 3, Route12_FishingHouse_EventScript_NewRecordMagikarp
# 47 "data/maps/Route12_FishingHouse/scripts.pory"
	goto_if_eq VAR_RESULT, 4, Route12_FishingHouse_EventScript_TieRecordMagikarp
# 48 "data/maps/Route12_FishingHouse/scripts.pory"
	release
# 49 "data/maps/Route12_FishingHouse/scripts.pory"
	end
# 50 "data/maps/Route12_FishingHouse/scripts.pory"

# 51 "data/maps/Route12_FishingHouse/scripts.pory"
Route12_FishingHouse_EventScript_NoMagikarpInParty::
# 52 "data/maps/Route12_FishingHouse/scripts.pory"
	msgbox Route12_FishingHouse_Text_TryFishingBringMeMagikarp
# 53 "data/maps/Route12_FishingHouse/scripts.pory"
	release
# 54 "data/maps/Route12_FishingHouse/scripts.pory"
	end
# 55 "data/maps/Route12_FishingHouse/scripts.pory"

# 56 "data/maps/Route12_FishingHouse/scripts.pory"
Route12_FishingHouse_EventScript_CancelShowMon::
# 57 "data/maps/Route12_FishingHouse/scripts.pory"
	release
# 58 "data/maps/Route12_FishingHouse/scripts.pory"
	end
# 59 "data/maps/Route12_FishingHouse/scripts.pory"

# 60 "data/maps/Route12_FishingHouse/scripts.pory"
Route12_FishingHouse_EventScript_NotMagikarp::
# 61 "data/maps/Route12_FishingHouse/scripts.pory"
	msgbox Route12_FishingHouse_Text_DoesntLookLikeMagikarp
# 62 "data/maps/Route12_FishingHouse/scripts.pory"
	release
# 63 "data/maps/Route12_FishingHouse/scripts.pory"
	end
# 64 "data/maps/Route12_FishingHouse/scripts.pory"

# 65 "data/maps/Route12_FishingHouse/scripts.pory"
Route12_FishingHouse_EventScript_NotRecordMagikarp::
# 66 "data/maps/Route12_FishingHouse/scripts.pory"
	goto_if_unset FLAG_GOT_RECORD_SETTING_MAGIKARP, Route12_FishingHouse_EventScript_NewRecordMagikarp
# 67 "data/maps/Route12_FishingHouse/scripts.pory"
	msgbox Route12_FishingHouse_Text_HmmXInchesDoesntMeasureUp
# 68 "data/maps/Route12_FishingHouse/scripts.pory"
	release
# 69 "data/maps/Route12_FishingHouse/scripts.pory"
	end
# 70 "data/maps/Route12_FishingHouse/scripts.pory"

# 71 "data/maps/Route12_FishingHouse/scripts.pory"
Route12_FishingHouse_EventScript_TieRecordMagikarp::
# 72 "data/maps/Route12_FishingHouse/scripts.pory"
	goto_if_unset FLAG_GOT_RECORD_SETTING_MAGIKARP, Route12_FishingHouse_EventScript_NewRecordMagikarp
# 73 "data/maps/Route12_FishingHouse/scripts.pory"
	msgbox Route12_FishingHouse_Text_HuhXInchesSameSizeAsLast
# 74 "data/maps/Route12_FishingHouse/scripts.pory"
	release
# 75 "data/maps/Route12_FishingHouse/scripts.pory"
	end
# 76 "data/maps/Route12_FishingHouse/scripts.pory"

# 77 "data/maps/Route12_FishingHouse/scripts.pory"
Route12_FishingHouse_EventScript_NewRecordMagikarp::
# 78 "data/maps/Route12_FishingHouse/scripts.pory"
	setflag FLAG_GOT_RECORD_SETTING_MAGIKARP
# 79 "data/maps/Route12_FishingHouse/scripts.pory"
	msgbox Route12_FishingHouse_Text_WhoaXInchesTakeThis
# 80 "data/maps/Route12_FishingHouse/scripts.pory"
	giveitem ITEM_NET_BALL
# 81 "data/maps/Route12_FishingHouse/scripts.pory"
	goto_if_eq VAR_RESULT, FALSE, Route12_FishingHouse_EventScript_NoRoomForNetBall
# 82 "data/maps/Route12_FishingHouse/scripts.pory"
	msgbox Route12_FishingHouse_Text_LookForwardToGreaterRecords
# 83 "data/maps/Route12_FishingHouse/scripts.pory"
	release
# 84 "data/maps/Route12_FishingHouse/scripts.pory"
	end
# 85 "data/maps/Route12_FishingHouse/scripts.pory"

# 86 "data/maps/Route12_FishingHouse/scripts.pory"
Route12_FishingHouse_EventScript_NoRoomForNetBall::
# 87 "data/maps/Route12_FishingHouse/scripts.pory"
	msgbox Route12_FishingHouse_Text_NoRoomForGift
# 88 "data/maps/Route12_FishingHouse/scripts.pory"
	release
# 89 "data/maps/Route12_FishingHouse/scripts.pory"
	end
# 90 "data/maps/Route12_FishingHouse/scripts.pory"

# 91 "data/maps/Route12_FishingHouse/scripts.pory"
Route12_FishingHouse_EventScript_MagikarpRecordSign::
# 92 "data/maps/Route12_FishingHouse/scripts.pory"
	lockall
# 93 "data/maps/Route12_FishingHouse/scripts.pory"
	goto_if_set FLAG_GOT_RECORD_SETTING_MAGIKARP, Route12_FishingHouse_EventScript_MagikarpRecordSignRecordSet
# 94 "data/maps/Route12_FishingHouse/scripts.pory"
	msgbox Route12_FishingHouse_Text_BlankChartOfSomeSort
# 95 "data/maps/Route12_FishingHouse/scripts.pory"
	releaseall
# 96 "data/maps/Route12_FishingHouse/scripts.pory"
	end
# 97 "data/maps/Route12_FishingHouse/scripts.pory"

# 98 "data/maps/Route12_FishingHouse/scripts.pory"
Route12_FishingHouse_EventScript_MagikarpRecordSignRecordSet::
# 99 "data/maps/Route12_FishingHouse/scripts.pory"
	special GetMagikarpSizeRecordInfo
# 100 "data/maps/Route12_FishingHouse/scripts.pory"
	msgbox Route12_FishingHouse_Text_MostGiganticMagikarpXInches
# 101 "data/maps/Route12_FishingHouse/scripts.pory"
	releaseall
# 102 "data/maps/Route12_FishingHouse/scripts.pory"
	end
