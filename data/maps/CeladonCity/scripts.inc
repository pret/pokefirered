# 1 "data/maps/CeladonCity/scripts.pory"

# 2 "data/maps/CeladonCity/scripts.pory"
.set LOCALID_FAT_MAN,   2
# 3 "data/maps/CeladonCity/scripts.pory"
.set LOCALID_POLIWRATH, 3
# 4 "data/maps/CeladonCity/scripts.pory"

# 5 "data/maps/CeladonCity/scripts.pory"
CeladonCity_MapScripts::
# 6 "data/maps/CeladonCity/scripts.pory"
	map_script MAP_SCRIPT_ON_TRANSITION, CeladonCity_OnTransition
# 7 "data/maps/CeladonCity/scripts.pory"
	.byte 0
# 8 "data/maps/CeladonCity/scripts.pory"

# 9 "data/maps/CeladonCity/scripts.pory"
CeladonCity_OnTransition::
# 10 "data/maps/CeladonCity/scripts.pory"
	setworldmapflag FLAG_WORLD_MAP_CELADON_CITY
# 11 "data/maps/CeladonCity/scripts.pory"
	end
# 12 "data/maps/CeladonCity/scripts.pory"

# 13 "data/maps/CeladonCity/scripts.pory"
CeladonCity_EventScript_LittleGirl::
# 14 "data/maps/CeladonCity/scripts.pory"
	msgbox CeladonCity_Text_GotMyKoffingInCinnabar, MSGBOX_NPC
# 15 "data/maps/CeladonCity/scripts.pory"
	end
# 16 "data/maps/CeladonCity/scripts.pory"

# 17 "data/maps/CeladonCity/scripts.pory"
CeladonCity_EventScript_OldMan1::
# 18 "data/maps/CeladonCity/scripts.pory"
	lock
# 19 "data/maps/CeladonCity/scripts.pory"
	msgbox CeladonCity_Text_GymIsGreatFullOfWomen
# 20 "data/maps/CeladonCity/scripts.pory"
	release
# 21 "data/maps/CeladonCity/scripts.pory"
	end
# 22 "data/maps/CeladonCity/scripts.pory"

# 23 "data/maps/CeladonCity/scripts.pory"
CeladonCity_EventScript_Woman::
# 24 "data/maps/CeladonCity/scripts.pory"
	msgbox CeladonCity_Text_GameCornerIsBadForCitysImage, MSGBOX_NPC
# 25 "data/maps/CeladonCity/scripts.pory"
	end
# 26 "data/maps/CeladonCity/scripts.pory"

# 27 "data/maps/CeladonCity/scripts.pory"
CeladonCity_EventScript_OldMan2::
# 28 "data/maps/CeladonCity/scripts.pory"
	msgbox CeladonCity_Text_BlewItAllAtSlots, MSGBOX_NPC
# 29 "data/maps/CeladonCity/scripts.pory"
	end
# 30 "data/maps/CeladonCity/scripts.pory"

# 31 "data/maps/CeladonCity/scripts.pory"
CeladonCity_EventScript_SoftboiledTutor::
# 32 "data/maps/CeladonCity/scripts.pory"
	goto EventScript_SoftboiledTutor
# 33 "data/maps/CeladonCity/scripts.pory"
	end
# 34 "data/maps/CeladonCity/scripts.pory"

# 35 "data/maps/CeladonCity/scripts.pory"
CeladonCity_EventScript_FatMan::
# 36 "data/maps/CeladonCity/scripts.pory"
	lock
# 37 "data/maps/CeladonCity/scripts.pory"
	faceplayer
# 38 "data/maps/CeladonCity/scripts.pory"
	msgbox CeladonCity_Text_MyTrustedPalPoliwrath
# 39 "data/maps/CeladonCity/scripts.pory"
	closemessage
# 40 "data/maps/CeladonCity/scripts.pory"
	applymovement LOCALID_FAT_MAN, Common_Movement_FaceOriginalDirection
# 41 "data/maps/CeladonCity/scripts.pory"
	waitmovement 0
# 42 "data/maps/CeladonCity/scripts.pory"
	release
# 43 "data/maps/CeladonCity/scripts.pory"
	end
# 44 "data/maps/CeladonCity/scripts.pory"

# 45 "data/maps/CeladonCity/scripts.pory"
CeladonCity_EventScript_Poliwrath::
# 46 "data/maps/CeladonCity/scripts.pory"
	lock
# 47 "data/maps/CeladonCity/scripts.pory"
	faceplayer
# 48 "data/maps/CeladonCity/scripts.pory"
	waitse
# 49 "data/maps/CeladonCity/scripts.pory"
	playmoncry SPECIES_POLIWRATH, CRY_MODE_NORMAL
# 50 "data/maps/CeladonCity/scripts.pory"
	msgbox CeladonCity_Text_Poliwrath
# 51 "data/maps/CeladonCity/scripts.pory"
	closemessage
# 52 "data/maps/CeladonCity/scripts.pory"
	waitmoncry
# 53 "data/maps/CeladonCity/scripts.pory"
	applymovement LOCALID_POLIWRATH, Common_Movement_FaceOriginalDirection
# 54 "data/maps/CeladonCity/scripts.pory"
	waitmovement 0
# 55 "data/maps/CeladonCity/scripts.pory"
	release
# 56 "data/maps/CeladonCity/scripts.pory"
	end
# 57 "data/maps/CeladonCity/scripts.pory"

# 58 "data/maps/CeladonCity/scripts.pory"
CeladonCity_EventScript_RocketGrunt1::
# 59 "data/maps/CeladonCity/scripts.pory"
	msgbox CeladonCity_Text_KeepOutOfTeamRocketsWay, MSGBOX_NPC
# 60 "data/maps/CeladonCity/scripts.pory"
	end
# 61 "data/maps/CeladonCity/scripts.pory"

# 62 "data/maps/CeladonCity/scripts.pory"
CeladonCity_EventScript_RocketGrunt2::
# 63 "data/maps/CeladonCity/scripts.pory"
	msgbox CeladonCity_Text_GetLostOrIllPunchYou, MSGBOX_NPC
# 64 "data/maps/CeladonCity/scripts.pory"
	end
# 65 "data/maps/CeladonCity/scripts.pory"

# 66 "data/maps/CeladonCity/scripts.pory"
CeladonCity_EventScript_Boy::
# 67 "data/maps/CeladonCity/scripts.pory"
	msgbox CeladonCity_Text_ScaldedTongueOnTea, MSGBOX_NPC
# 68 "data/maps/CeladonCity/scripts.pory"
	end
# 69 "data/maps/CeladonCity/scripts.pory"

# 70 "data/maps/CeladonCity/scripts.pory"
CeladonCity_EventScript_SilphCoScientist::
# 71 "data/maps/CeladonCity/scripts.pory"
	msgbox CeladonCity_Text_SomeoneStoleSilphScope, MSGBOX_NPC
# 72 "data/maps/CeladonCity/scripts.pory"
	end
# 73 "data/maps/CeladonCity/scripts.pory"

# 74 "data/maps/CeladonCity/scripts.pory"
CeladonCity_EventScript_TrainerTips1::
# 75 "data/maps/CeladonCity/scripts.pory"
	msgbox CeladonCity_Text_ExplainXAccuracyDireHit, MSGBOX_SIGN
# 76 "data/maps/CeladonCity/scripts.pory"
	end
# 77 "data/maps/CeladonCity/scripts.pory"

# 78 "data/maps/CeladonCity/scripts.pory"
CeladonCity_EventScript_CitySign::
# 79 "data/maps/CeladonCity/scripts.pory"
	msgbox CeladonCity_Text_CitySign, MSGBOX_SIGN
# 80 "data/maps/CeladonCity/scripts.pory"
	end
# 81 "data/maps/CeladonCity/scripts.pory"

# 82 "data/maps/CeladonCity/scripts.pory"
CeladonCity_EventScript_GymSign::
# 83 "data/maps/CeladonCity/scripts.pory"
	lockall
# 84 "data/maps/CeladonCity/scripts.pory"
	famechecker FAMECHECKER_ERIKA, 0
# 85 "data/maps/CeladonCity/scripts.pory"
	msgbox CeladonCity_Text_GymSign
# 86 "data/maps/CeladonCity/scripts.pory"
	releaseall
# 87 "data/maps/CeladonCity/scripts.pory"
	end
# 88 "data/maps/CeladonCity/scripts.pory"

# 89 "data/maps/CeladonCity/scripts.pory"
CeladonCity_EventScript_MansionSign::
# 90 "data/maps/CeladonCity/scripts.pory"
	msgbox CeladonCity_Text_MansionSign, MSGBOX_SIGN
# 91 "data/maps/CeladonCity/scripts.pory"
	end
# 92 "data/maps/CeladonCity/scripts.pory"

# 93 "data/maps/CeladonCity/scripts.pory"
CeladonCity_EventScript_DeptStoreSign::
# 94 "data/maps/CeladonCity/scripts.pory"
	msgbox CeladonCity_Text_DeptStoreSign, MSGBOX_SIGN
# 95 "data/maps/CeladonCity/scripts.pory"
	end
# 96 "data/maps/CeladonCity/scripts.pory"

# 97 "data/maps/CeladonCity/scripts.pory"
CeladonCity_EventScript_TrainerTips2::
# 98 "data/maps/CeladonCity/scripts.pory"
	msgbox CeladonCity_Text_GuardSpecProtectsFromStatus, MSGBOX_SIGN
# 99 "data/maps/CeladonCity/scripts.pory"
	end
# 100 "data/maps/CeladonCity/scripts.pory"

# 101 "data/maps/CeladonCity/scripts.pory"
CeladonCity_EventScript_PrizeExchangeSign::
# 102 "data/maps/CeladonCity/scripts.pory"
	msgbox CeladonCity_Text_PrizeExchangeSign, MSGBOX_SIGN
# 103 "data/maps/CeladonCity/scripts.pory"
	end
# 104 "data/maps/CeladonCity/scripts.pory"

# 105 "data/maps/CeladonCity/scripts.pory"
CeladonCity_EventScript_GameCornerSign::
# 106 "data/maps/CeladonCity/scripts.pory"
	msgbox CeladonCity_Text_GameCornerSign, MSGBOX_SIGN
# 107 "data/maps/CeladonCity/scripts.pory"
	end
