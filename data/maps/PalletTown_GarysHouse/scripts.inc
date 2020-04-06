.equ LOCALID_DAISY,    1
.equ LOCALID_TOWN_MAP, 2

.equ RECEIVED_TOWN_MAP, VAR_TEMP_1

PalletTown_GarysHouse_MapScripts:: @ 8168D27
	map_script MAP_SCRIPT_ON_TRANSITION, PalletTown_GarysHouse_OnTransition
	.byte 0

PalletTown_GarysHouse_OnTransition:: @ 8168D2D
	compare VAR_MAP_SCENE_PALLET_TOWN_GARYS_HOUSE, 2
	call_if_lt PalletTown_GarysHouse_EventScript_MoveDaisyToTable
	compare VAR_MAP_SCENE_PALLET_TOWN_GARYS_HOUSE, 2
	call_if_ge PalletTown_GarysHouse_EventScript_AlreadyReceivedTownMap
	end

PalletTown_GarysHouse_EventScript_MoveDaisyToTable:: @ 8168D44
	setobjectmovementtype LOCALID_DAISY, MOVEMENT_TYPE_FACE_RIGHT
	setobjectxyperm LOCALID_DAISY, 5, 4
	return

PalletTown_GarysHouse_EventScript_AlreadyReceivedTownMap:: @ 8168D50
	setvar RECEIVED_TOWN_MAP, TRUE
	return

PalletTown_GarysHouse_EventScript_Daisy:: @ 8168D56
	lock
	faceplayer
	famechecker FAMECHECKER_DAISY, FCPICKSTATE_COLORED, UpdatePickStateFromSpecialVar8005
	goto_if_set FLAG_SYS_GAME_CLEAR, PalletTown_GarysHouse_EventScript_GroomMon
	compare RECEIVED_TOWN_MAP, TRUE
	goto_if_eq PalletTown_GarysHouse_EventScript_PleaseGiveMonsRest
	compare VAR_MAP_SCENE_PALLET_TOWN_GARYS_HOUSE, 2
	goto_if_eq PalletTown_GarysHouse_EventScript_ExplainTownMap
	compare VAR_MAP_SCENE_PALLET_TOWN_GARYS_HOUSE, 1
	goto_if_eq PalletTown_GarysHouse_EventScript_GiveTownMap
	compare VAR_MAP_SCENE_PALLET_TOWN_PROFESSOR_OAKS_LAB, 1
	goto_if_ge PalletTown_GarysHouse_EventScript_HeardBattledRival
	msgbox PalletTown_GarysHouse_Text_HiBrothersAtLab
	closemessage
	applymovement LOCALID_DAISY, Movement_FaceOriginalDirection
	waitmovement 0
	release
	end

PalletTown_GarysHouse_EventScript_HeardBattledRival:: @ 8168DAF
	msgbox PalletTown_GarysHouse_Text_HeardYouBattledRival
	release
	end

PalletTown_GarysHouse_EventScript_GroomMon:: @ 8168DB9
	goto_if_questlog EventScript_ReleaseEnd
	special QuestLog_CutRecording
	compare VAR_MASSAGE_COOLDOWN_STEP_COUNTER, 500
	goto_if_lt PalletTown_GarysHouse_EventScript_RateMonFriendship
	msgbox PalletTown_GarysHouse_Text_LikeMeToGroomMon, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq PalletTown_GarysHouse_EventScript_DeclineGrooming
	msgbox PalletTown_GarysHouse_Text_GroomWhichOne
	special ChoosePartyMon
	waitstate
	lock
	faceplayer
	compare VAR_0x8004, PARTY_SIZE
	goto_if_ge PalletTown_GarysHouse_EventScript_DeclineGrooming
	specialvar VAR_RESULT, GetPartyMonSpecies
	compare VAR_RESULT, SPECIES_EGG
	goto_if_eq PalletTown_GarysHouse_EventScript_CantGroomEgg
	msgbox PalletTown_GarysHouse_Text_LookingNiceInNoTime
	closemessage
	fadescreen FADE_TO_BLACK
	playfanfare MUS_ME_ASA
	waitfanfare
	special DaisyMassageServices
	fadescreen FADE_FROM_BLACK
	special BufferMonNickname
	msgbox PalletTown_GarysHouse_Text_ThereYouGoAllDone
	release
	end

PalletTown_GarysHouse_EventScript_CantGroomEgg:: @ 8168E32
	msgbox PalletTown_GarysHouse_Text_CantGroomAnEgg
	release
	end

PalletTown_GarysHouse_EventScript_DeclineGrooming:: @ 8168E3C
	msgbox PalletTown_GarysHouse_Text_DontNeedAnyGrooming
	release
	end

PalletTown_GarysHouse_EventScript_RateMonFriendship:: @ 8168E46
	msgbox PalletTown_GarysHouse_Text_MayISeeFirstMon
	specialvar VAR_RESULT, GetLeadMonFriendship
	switch VAR_RESULT
	case 0, PalletTown_GarysHouse_EventScript_MonFriendshipLowest
	case 1, PalletTown_GarysHouse_EventScript_MonFriendshipLower
	case 2, PalletTown_GarysHouse_EventScript_MonFriendshipLow
	case 3, PalletTown_GarysHouse_EventScript_MonFriendshipMid
	case 4, PalletTown_GarysHouse_EventScript_MonFriendshipHigh
	case 5, PalletTown_GarysHouse_EventScript_MonFriendshipHigher
	case 6, PalletTown_GarysHouse_EventScript_MonFriendshipHighest
	end

PalletTown_GarysHouse_EventScript_MonFriendshipLowest:: @ 8168EA6
	msgbox PalletTown_GarysHouse_Text_WhyWouldMonHateYouSoMuch
	release
	end

PalletTown_GarysHouse_EventScript_MonFriendshipLower:: @ 8168EB0
	msgbox PalletTown_GarysHouse_Text_DontLikeWayItGlaresAtYou
	release
	end

PalletTown_GarysHouse_EventScript_MonFriendshipLow:: @ 8168EBA
	msgbox PalletTown_GarysHouse_Text_NotFamiliarWithYouYet
	release
	end

PalletTown_GarysHouse_EventScript_MonFriendshipMid:: @ 8168EC4
	msgbox PalletTown_GarysHouse_Text_ItsWarmingUpToYou
	release
	end

PalletTown_GarysHouse_EventScript_MonFriendshipHigh:: @ 8168ECE
	msgbox PalletTown_GarysHouse_Text_ItsQuiteFriendly
	release
	end

PalletTown_GarysHouse_EventScript_MonFriendshipHigher:: @ 8168ED8
	msgbox PalletTown_GarysHouse_Text_ItLooksVeryHappy
	release
	end

PalletTown_GarysHouse_EventScript_MonFriendshipHighest:: @ 8168EE2
	msgbox PalletTown_GarysHouse_Text_CouldntLoveYouMore
	release
	end

PalletTown_GarysHouse_EventScript_PleaseGiveMonsRest:: @ 8168EEC
	msgbox PalletTown_GarysHouse_Text_PleaseGiveMonsRest
	release
	end

PalletTown_GarysHouse_EventScript_GiveTownMap:: @ 8168EF6
	msgbox PalletTown_GarysHouse_Text_ErrandForGrandpaThisWillHelp
	closemessage
	checkitemspace ITEM_TOWN_MAP, 1
	compare VAR_RESULT, FALSE
	goto_if_eq PalletTown_GarysHouse_EventScript_NoRoomForTownMap
	applymovement LOCALID_DAISY, Movement_WalkInPlaceFastestRight
	waitmovement 0
	removeobject LOCALID_TOWN_MAP
	setvar VAR_MAP_SCENE_PALLET_TOWN_GARYS_HOUSE, 2
	delay 15
	applymovement LOCALID_DAISY, Movement_FacePlayer
	waitmovement 0
	delay 12
	giveitem_msg PalletTown_GarysHouse_Text_ReceivedTownMapFromDaisy, ITEM_TOWN_MAP, 1, MUS_FAN5
	release
	end

PalletTown_GarysHouse_EventScript_NoRoomForTownMap:: @ 8168F4F
	msgbox PalletTown_GarysHouse_Text_DontHaveSpaceForThis
	release
	end

PalletTown_GarysHouse_EventScript_ExplainTownMap:: @ 8168F59
	msgbox PalletTown_GarysHouse_Text_ExplainTownMap
	release
	end

PalletTown_GarysHouse_EventScript_TownMap:: @ 8168F63
	msgbox PalletTown_GarysHouse_Text_ItsBigMapOfKanto, MSGBOX_NPC
	end

PalletTown_GarysHouse_EventScript_Bookshelf:: @ 8168F6C
	msgbox PalletTown_GarysHouse_Text_ShelvesCrammedFullOfBooks, MSGBOX_SIGN
	end

PalletTown_GarysHouse_EventScript_Picture:: @ 8168F75
	msgbox PalletTown_GarysHouse_Text_LovelyAndSweetClefairy, MSGBOX_SIGN
	end
