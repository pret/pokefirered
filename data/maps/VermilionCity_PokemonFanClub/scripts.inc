# 1 "data/maps/VermilionCity_PokemonFanClub/scripts.pory"

# 2 "data/maps/VermilionCity_PokemonFanClub/scripts.pory"
.set LOCALID_WOMAN,   5
# 3 "data/maps/VermilionCity_PokemonFanClub/scripts.pory"
.set LOCALID_FAT_MAN, 6
# 4 "data/maps/VermilionCity_PokemonFanClub/scripts.pory"

# 5 "data/maps/VermilionCity_PokemonFanClub/scripts.pory"
.set SPOKE_TO_WOMAN_LAST,   FLAG_TEMP_2
# 6 "data/maps/VermilionCity_PokemonFanClub/scripts.pory"
.set SPOKE_TO_FAT_MAN_LAST, FLAG_TEMP_3
# 7 "data/maps/VermilionCity_PokemonFanClub/scripts.pory"

# 8 "data/maps/VermilionCity_PokemonFanClub/scripts.pory"
VermilionCity_PokemonFanClub_MapScripts::
# 9 "data/maps/VermilionCity_PokemonFanClub/scripts.pory"
	.byte 0
# 10 "data/maps/VermilionCity_PokemonFanClub/scripts.pory"

# 11 "data/maps/VermilionCity_PokemonFanClub/scripts.pory"
VermilionCity_PokemonFanClub_EventScript_Chairman::
# 12 "data/maps/VermilionCity_PokemonFanClub/scripts.pory"
	lock
# 13 "data/maps/VermilionCity_PokemonFanClub/scripts.pory"
	faceplayer
# 14 "data/maps/VermilionCity_PokemonFanClub/scripts.pory"
	goto_if_set FLAG_GOT_BIKE_VOUCHER, VermilionCity_PokemonFanClub_EventScript_AlreadyHeardStory
# 15 "data/maps/VermilionCity_PokemonFanClub/scripts.pory"
	msgbox VermilionCity_PokemonFanClub_Text_DidYouComeToHearAboutMyMons, MSGBOX_YESNO
# 16 "data/maps/VermilionCity_PokemonFanClub/scripts.pory"
	goto_if_eq VAR_RESULT, YES, VermilionCity_PokemonFanClub_EventScript_ChairmanStory
# 17 "data/maps/VermilionCity_PokemonFanClub/scripts.pory"
	msgbox VermilionCity_PokemonFanClub_Text_ComeBackToHearStory
# 18 "data/maps/VermilionCity_PokemonFanClub/scripts.pory"
	release
# 19 "data/maps/VermilionCity_PokemonFanClub/scripts.pory"
	end
# 20 "data/maps/VermilionCity_PokemonFanClub/scripts.pory"

# 21 "data/maps/VermilionCity_PokemonFanClub/scripts.pory"
VermilionCity_PokemonFanClub_EventScript_AlreadyHeardStory::
# 22 "data/maps/VermilionCity_PokemonFanClub/scripts.pory"
	msgbox VermilionCity_PokemonFanClub_Text_DidntComeToSeeAboutMonsAgain
# 23 "data/maps/VermilionCity_PokemonFanClub/scripts.pory"
	release
# 24 "data/maps/VermilionCity_PokemonFanClub/scripts.pory"
	end
# 25 "data/maps/VermilionCity_PokemonFanClub/scripts.pory"

# 26 "data/maps/VermilionCity_PokemonFanClub/scripts.pory"
VermilionCity_PokemonFanClub_EventScript_ChairmanStory::
# 27 "data/maps/VermilionCity_PokemonFanClub/scripts.pory"
	msgbox VermilionCity_PokemonFanClub_Text_ChairmansStory
# 28 "data/maps/VermilionCity_PokemonFanClub/scripts.pory"
	checkitemspace ITEM_BIKE_VOUCHER
# 29 "data/maps/VermilionCity_PokemonFanClub/scripts.pory"
	goto_if_eq VAR_RESULT, FALSE, VermilionCity_PokemonFanClub_EventScript_NoRoomForBikeVoucher
# 30 "data/maps/VermilionCity_PokemonFanClub/scripts.pory"
	setflag FLAG_GOT_BIKE_VOUCHER
# 31 "data/maps/VermilionCity_PokemonFanClub/scripts.pory"
	giveitem_msg VermilionCity_PokemonFanClub_Text_ReceivedBikeVoucherFromChairman, ITEM_BIKE_VOUCHER, 1, MUS_OBTAIN_KEY_ITEM
# 32 "data/maps/VermilionCity_PokemonFanClub/scripts.pory"
	msgbox VermilionCity_PokemonFanClub_Text_ExplainBikeVoucher
# 33 "data/maps/VermilionCity_PokemonFanClub/scripts.pory"
	release
# 34 "data/maps/VermilionCity_PokemonFanClub/scripts.pory"
	end
# 35 "data/maps/VermilionCity_PokemonFanClub/scripts.pory"

# 36 "data/maps/VermilionCity_PokemonFanClub/scripts.pory"
VermilionCity_PokemonFanClub_EventScript_NoRoomForBikeVoucher::
# 37 "data/maps/VermilionCity_PokemonFanClub/scripts.pory"
	msgbox VermilionCity_PokemonFanClub_Text_MakeRoomForThis
# 38 "data/maps/VermilionCity_PokemonFanClub/scripts.pory"
	release
# 39 "data/maps/VermilionCity_PokemonFanClub/scripts.pory"
	end
# 40 "data/maps/VermilionCity_PokemonFanClub/scripts.pory"

# 41 "data/maps/VermilionCity_PokemonFanClub/scripts.pory"
VermilionCity_PokemonFanClub_EventScript_WorkerF::
# 42 "data/maps/VermilionCity_PokemonFanClub/scripts.pory"
	lock
# 43 "data/maps/VermilionCity_PokemonFanClub/scripts.pory"
	faceplayer
# 44 "data/maps/VermilionCity_PokemonFanClub/scripts.pory"
	goto_if_set FLAG_SYS_GAME_CLEAR, VermilionCity_PokemonFanClub_EventScript_WorkerFGameClear
# 45 "data/maps/VermilionCity_PokemonFanClub/scripts.pory"
	msgbox VermilionCity_PokemonFanClub_Text_ChairmanVeryVocalAboutPokemon
# 46 "data/maps/VermilionCity_PokemonFanClub/scripts.pory"
	release
# 47 "data/maps/VermilionCity_PokemonFanClub/scripts.pory"
	end
# 48 "data/maps/VermilionCity_PokemonFanClub/scripts.pory"

# 49 "data/maps/VermilionCity_PokemonFanClub/scripts.pory"
VermilionCity_PokemonFanClub_EventScript_WorkerFGameClear::
# 50 "data/maps/VermilionCity_PokemonFanClub/scripts.pory"
	famechecker FAMECHECKER_DAISY, 1
# 51 "data/maps/VermilionCity_PokemonFanClub/scripts.pory"
	msgbox VermilionCity_PokemonFanClub_Text_ChairmanReallyAdoresHisMons
# 52 "data/maps/VermilionCity_PokemonFanClub/scripts.pory"
	release
# 53 "data/maps/VermilionCity_PokemonFanClub/scripts.pory"
	end
# 54 "data/maps/VermilionCity_PokemonFanClub/scripts.pory"

# 55 "data/maps/VermilionCity_PokemonFanClub/scripts.pory"
VermilionCity_PokemonFanClub_EventScript_Woman::
# 56 "data/maps/VermilionCity_PokemonFanClub/scripts.pory"
	lock
# 57 "data/maps/VermilionCity_PokemonFanClub/scripts.pory"
	faceplayer
# 58 "data/maps/VermilionCity_PokemonFanClub/scripts.pory"
	goto_if_set SPOKE_TO_FAT_MAN_LAST, VermilionCity_PokemonFanClub_EventScript_WomanSpokeToFatMan
# 59 "data/maps/VermilionCity_PokemonFanClub/scripts.pory"
	msgbox VermilionCity_PokemonFanClub_Text_AdoreMySeel
# 60 "data/maps/VermilionCity_PokemonFanClub/scripts.pory"
	closemessage
# 61 "data/maps/VermilionCity_PokemonFanClub/scripts.pory"
	applymovement LOCALID_WOMAN, Common_Movement_FaceOriginalDirection
# 62 "data/maps/VermilionCity_PokemonFanClub/scripts.pory"
	waitmovement 0
# 63 "data/maps/VermilionCity_PokemonFanClub/scripts.pory"
	setflag SPOKE_TO_WOMAN_LAST
# 64 "data/maps/VermilionCity_PokemonFanClub/scripts.pory"
	release
# 65 "data/maps/VermilionCity_PokemonFanClub/scripts.pory"
	end
# 66 "data/maps/VermilionCity_PokemonFanClub/scripts.pory"

# 67 "data/maps/VermilionCity_PokemonFanClub/scripts.pory"
VermilionCity_PokemonFanClub_EventScript_WomanSpokeToFatMan::
# 68 "data/maps/VermilionCity_PokemonFanClub/scripts.pory"
	msgbox VermilionCity_PokemonFanClub_Text_SeelFarMoreAttractive
# 69 "data/maps/VermilionCity_PokemonFanClub/scripts.pory"
	closemessage
# 70 "data/maps/VermilionCity_PokemonFanClub/scripts.pory"
	applymovement LOCALID_WOMAN, Common_Movement_FaceOriginalDirection
# 71 "data/maps/VermilionCity_PokemonFanClub/scripts.pory"
	waitmovement 0
# 72 "data/maps/VermilionCity_PokemonFanClub/scripts.pory"
	clearflag SPOKE_TO_FAT_MAN_LAST
# 73 "data/maps/VermilionCity_PokemonFanClub/scripts.pory"
	release
# 74 "data/maps/VermilionCity_PokemonFanClub/scripts.pory"
	end
# 75 "data/maps/VermilionCity_PokemonFanClub/scripts.pory"

# 76 "data/maps/VermilionCity_PokemonFanClub/scripts.pory"
VermilionCity_PokemonFanClub_EventScript_FatMan::
# 77 "data/maps/VermilionCity_PokemonFanClub/scripts.pory"
	lock
# 78 "data/maps/VermilionCity_PokemonFanClub/scripts.pory"
	faceplayer
# 79 "data/maps/VermilionCity_PokemonFanClub/scripts.pory"
	goto_if_set SPOKE_TO_WOMAN_LAST, VermilionCity_PokemonFanClub_EventScript_FatManSpokeToWoman
# 80 "data/maps/VermilionCity_PokemonFanClub/scripts.pory"
	msgbox VermilionCity_PokemonFanClub_Text_AdmirePikachusTail
# 81 "data/maps/VermilionCity_PokemonFanClub/scripts.pory"
	closemessage
# 82 "data/maps/VermilionCity_PokemonFanClub/scripts.pory"
	applymovement LOCALID_FAT_MAN, Common_Movement_FaceOriginalDirection
# 83 "data/maps/VermilionCity_PokemonFanClub/scripts.pory"
	waitmovement 0
# 84 "data/maps/VermilionCity_PokemonFanClub/scripts.pory"
	setflag SPOKE_TO_FAT_MAN_LAST
# 85 "data/maps/VermilionCity_PokemonFanClub/scripts.pory"
	release
# 86 "data/maps/VermilionCity_PokemonFanClub/scripts.pory"
	end
# 87 "data/maps/VermilionCity_PokemonFanClub/scripts.pory"

# 88 "data/maps/VermilionCity_PokemonFanClub/scripts.pory"
VermilionCity_PokemonFanClub_EventScript_FatManSpokeToWoman::
# 89 "data/maps/VermilionCity_PokemonFanClub/scripts.pory"
	msgbox VermilionCity_PokemonFanClub_Text_PikachuTwiceAsCute
# 90 "data/maps/VermilionCity_PokemonFanClub/scripts.pory"
	closemessage
# 91 "data/maps/VermilionCity_PokemonFanClub/scripts.pory"
	applymovement LOCALID_FAT_MAN, Common_Movement_FaceOriginalDirection
# 92 "data/maps/VermilionCity_PokemonFanClub/scripts.pory"
	waitmovement 0
# 93 "data/maps/VermilionCity_PokemonFanClub/scripts.pory"
	clearflag SPOKE_TO_WOMAN_LAST
# 94 "data/maps/VermilionCity_PokemonFanClub/scripts.pory"
	release
# 95 "data/maps/VermilionCity_PokemonFanClub/scripts.pory"
	end
# 96 "data/maps/VermilionCity_PokemonFanClub/scripts.pory"

# 97 "data/maps/VermilionCity_PokemonFanClub/scripts.pory"
VermilionCity_PokemonFanClub_EventScript_Pikachu::
# 98 "data/maps/VermilionCity_PokemonFanClub/scripts.pory"
	lock
# 99 "data/maps/VermilionCity_PokemonFanClub/scripts.pory"
	faceplayer
# 100 "data/maps/VermilionCity_PokemonFanClub/scripts.pory"
	waitse
# 101 "data/maps/VermilionCity_PokemonFanClub/scripts.pory"
	playmoncry SPECIES_PIKACHU, CRY_MODE_NORMAL
# 102 "data/maps/VermilionCity_PokemonFanClub/scripts.pory"
	msgbox VermilionCity_PokemonFanClub_Text_Pikachu
# 103 "data/maps/VermilionCity_PokemonFanClub/scripts.pory"
	waitmoncry
# 104 "data/maps/VermilionCity_PokemonFanClub/scripts.pory"
	release
# 105 "data/maps/VermilionCity_PokemonFanClub/scripts.pory"
	end
# 106 "data/maps/VermilionCity_PokemonFanClub/scripts.pory"

# 107 "data/maps/VermilionCity_PokemonFanClub/scripts.pory"
VermilionCity_PokemonFanClub_EventScript_Seel::
# 108 "data/maps/VermilionCity_PokemonFanClub/scripts.pory"
	lock
# 109 "data/maps/VermilionCity_PokemonFanClub/scripts.pory"
	faceplayer
# 110 "data/maps/VermilionCity_PokemonFanClub/scripts.pory"
	waitse
# 111 "data/maps/VermilionCity_PokemonFanClub/scripts.pory"
	playmoncry SPECIES_SEEL, CRY_MODE_NORMAL
# 112 "data/maps/VermilionCity_PokemonFanClub/scripts.pory"
	msgbox VermilionCity_PokemonFanClub_Text_Seel
# 113 "data/maps/VermilionCity_PokemonFanClub/scripts.pory"
	waitmoncry
# 114 "data/maps/VermilionCity_PokemonFanClub/scripts.pory"
	release
# 115 "data/maps/VermilionCity_PokemonFanClub/scripts.pory"
	end
# 116 "data/maps/VermilionCity_PokemonFanClub/scripts.pory"

# 117 "data/maps/VermilionCity_PokemonFanClub/scripts.pory"
VermilionCity_PokemonFanClub_EventScript_RulesSign1::
# 118 "data/maps/VermilionCity_PokemonFanClub/scripts.pory"
	msgbox VermilionCity_PokemonFanClub_Text_ListenPolitelyToOtherTrainers, MSGBOX_SIGN
# 119 "data/maps/VermilionCity_PokemonFanClub/scripts.pory"
	end
# 120 "data/maps/VermilionCity_PokemonFanClub/scripts.pory"

# 121 "data/maps/VermilionCity_PokemonFanClub/scripts.pory"
VermilionCity_PokemonFanClub_EventScript_RulesSign2::
# 122 "data/maps/VermilionCity_PokemonFanClub/scripts.pory"
	msgbox VermilionCity_PokemonFanClub_Text_SomeoneBragsBragBack, MSGBOX_SIGN
# 123 "data/maps/VermilionCity_PokemonFanClub/scripts.pory"
	end
