# 1 "data/maps/SixIsland_WaterPath_House1/scripts.pory"

# 2 "data/maps/SixIsland_WaterPath_House1/scripts.pory"
SixIsland_WaterPath_House1_MapScripts::
# 3 "data/maps/SixIsland_WaterPath_House1/scripts.pory"
	.byte 0
# 4 "data/maps/SixIsland_WaterPath_House1/scripts.pory"

# 5 "data/maps/SixIsland_WaterPath_House1/scripts.pory"
SixIsland_WaterPath_House1_EventScript_Beauty::
# 6 "data/maps/SixIsland_WaterPath_House1/scripts.pory"
	lock
# 7 "data/maps/SixIsland_WaterPath_House1/scripts.pory"
	faceplayer
# 8 "data/maps/SixIsland_WaterPath_House1/scripts.pory"
	goto_if_questlog EventScript_ReleaseEnd
# 9 "data/maps/SixIsland_WaterPath_House1/scripts.pory"
	special QuestLog_CutRecording
# 10 "data/maps/SixIsland_WaterPath_House1/scripts.pory"
	setvar VAR_0x8004, SPECIES_HERACROSS
# 11 "data/maps/SixIsland_WaterPath_House1/scripts.pory"
	specialvar VAR_RESULT, DoesPlayerPartyContainSpecies
# 12 "data/maps/SixIsland_WaterPath_House1/scripts.pory"
	goto_if_eq VAR_RESULT, FALSE, SixIsland_WaterPath_House1_EventScript_NoHeracrossInParty
# 13 "data/maps/SixIsland_WaterPath_House1/scripts.pory"
	special GetHeracrossSizeRecordInfo
# 14 "data/maps/SixIsland_WaterPath_House1/scripts.pory"
	msgbox SixIsland_WaterPath_House1_Text_MayIMeasureHeracross
# 15 "data/maps/SixIsland_WaterPath_House1/scripts.pory"
	special ChoosePartyMon
# 16 "data/maps/SixIsland_WaterPath_House1/scripts.pory"
	waitstate
# 17 "data/maps/SixIsland_WaterPath_House1/scripts.pory"
	copyvar VAR_RESULT, VAR_0x8004
# 18 "data/maps/SixIsland_WaterPath_House1/scripts.pory"
	goto_if_ge VAR_RESULT, PARTY_SIZE, SixIsland_WaterPath_House1_EventScript_DontShowMon
# 19 "data/maps/SixIsland_WaterPath_House1/scripts.pory"
	special CompareHeracrossSize
# 20 "data/maps/SixIsland_WaterPath_House1/scripts.pory"
	goto_if_eq VAR_RESULT, 1, SixIsland_WaterPath_House1_EventScript_ShownNonHeracross
# 21 "data/maps/SixIsland_WaterPath_House1/scripts.pory"
	goto_if_eq VAR_RESULT, 2, SixIsland_WaterPath_House1_EventScript_ShownSmallHeracross
# 22 "data/maps/SixIsland_WaterPath_House1/scripts.pory"
	goto_if_eq VAR_RESULT, 3, SixIsland_WaterPath_House1_EventScript_ShownBigHeracross
# 23 "data/maps/SixIsland_WaterPath_House1/scripts.pory"
	goto_if_eq VAR_RESULT, 4, SixIsland_WaterPath_House1_EventScript_ShownTiedHeracross
# 24 "data/maps/SixIsland_WaterPath_House1/scripts.pory"
	release
# 25 "data/maps/SixIsland_WaterPath_House1/scripts.pory"
	end
# 26 "data/maps/SixIsland_WaterPath_House1/scripts.pory"

# 27 "data/maps/SixIsland_WaterPath_House1/scripts.pory"
SixIsland_WaterPath_House1_EventScript_NoHeracrossInParty::
# 28 "data/maps/SixIsland_WaterPath_House1/scripts.pory"
	msgbox SixIsland_WaterPath_House1_Text_LoveItNeedItHeracross
# 29 "data/maps/SixIsland_WaterPath_House1/scripts.pory"
	release
# 30 "data/maps/SixIsland_WaterPath_House1/scripts.pory"
	end
# 31 "data/maps/SixIsland_WaterPath_House1/scripts.pory"

# 32 "data/maps/SixIsland_WaterPath_House1/scripts.pory"
SixIsland_WaterPath_House1_EventScript_DontShowMon::
# 33 "data/maps/SixIsland_WaterPath_House1/scripts.pory"
	release
# 34 "data/maps/SixIsland_WaterPath_House1/scripts.pory"
	end
# 35 "data/maps/SixIsland_WaterPath_House1/scripts.pory"

# 36 "data/maps/SixIsland_WaterPath_House1/scripts.pory"
SixIsland_WaterPath_House1_EventScript_ShownNonHeracross::
# 37 "data/maps/SixIsland_WaterPath_House1/scripts.pory"
	msgbox SixIsland_WaterPath_House1_Text_ThisWontDo
# 38 "data/maps/SixIsland_WaterPath_House1/scripts.pory"
	release
# 39 "data/maps/SixIsland_WaterPath_House1/scripts.pory"
	end
# 40 "data/maps/SixIsland_WaterPath_House1/scripts.pory"

# 41 "data/maps/SixIsland_WaterPath_House1/scripts.pory"
SixIsland_WaterPath_House1_EventScript_ShownSmallHeracross::
# 42 "data/maps/SixIsland_WaterPath_House1/scripts.pory"
	goto_if_unset FLAG_GOT_NEST_BALL_FROM_WATER_PATH_HOUSE_1, SixIsland_WaterPath_House1_EventScript_ShownBigHeracross
# 43 "data/maps/SixIsland_WaterPath_House1/scripts.pory"
	msgbox SixIsland_WaterPath_House1_Text_ItsXInchesYInchesWasBiggest
# 44 "data/maps/SixIsland_WaterPath_House1/scripts.pory"
	release
# 45 "data/maps/SixIsland_WaterPath_House1/scripts.pory"
	end
# 46 "data/maps/SixIsland_WaterPath_House1/scripts.pory"

# 47 "data/maps/SixIsland_WaterPath_House1/scripts.pory"
SixIsland_WaterPath_House1_EventScript_ShownTiedHeracross::
# 48 "data/maps/SixIsland_WaterPath_House1/scripts.pory"
	goto_if_unset FLAG_GOT_NEST_BALL_FROM_WATER_PATH_HOUSE_1, SixIsland_WaterPath_House1_EventScript_ShownBigHeracross
# 49 "data/maps/SixIsland_WaterPath_House1/scripts.pory"
	msgbox SixIsland_WaterPath_House1_Text_ItsXInchesSameAsBefore
# 50 "data/maps/SixIsland_WaterPath_House1/scripts.pory"
	release
# 51 "data/maps/SixIsland_WaterPath_House1/scripts.pory"
	end
# 52 "data/maps/SixIsland_WaterPath_House1/scripts.pory"

# 53 "data/maps/SixIsland_WaterPath_House1/scripts.pory"
SixIsland_WaterPath_House1_EventScript_ShownBigHeracross::
# 54 "data/maps/SixIsland_WaterPath_House1/scripts.pory"
	setflag FLAG_GOT_NEST_BALL_FROM_WATER_PATH_HOUSE_1
# 55 "data/maps/SixIsland_WaterPath_House1/scripts.pory"
	msgbox SixIsland_WaterPath_House1_Text_ItsXInchesDeserveReward
# 56 "data/maps/SixIsland_WaterPath_House1/scripts.pory"
	giveitem ITEM_NEST_BALL
# 57 "data/maps/SixIsland_WaterPath_House1/scripts.pory"
	goto_if_eq VAR_RESULT, FALSE, SixIsland_WaterPath_House1_EventScript_NoRoomForNestBall
# 58 "data/maps/SixIsland_WaterPath_House1/scripts.pory"
	msgbox SixIsland_WaterPath_House1_Text_WantToSeeBiggerOne
# 59 "data/maps/SixIsland_WaterPath_House1/scripts.pory"
	release
# 60 "data/maps/SixIsland_WaterPath_House1/scripts.pory"
	end
# 61 "data/maps/SixIsland_WaterPath_House1/scripts.pory"

# 62 "data/maps/SixIsland_WaterPath_House1/scripts.pory"
SixIsland_WaterPath_House1_EventScript_NoRoomForNestBall::
# 63 "data/maps/SixIsland_WaterPath_House1/scripts.pory"
	msgbox SixIsland_WaterPath_House1_Text_YourBagIsFull
# 64 "data/maps/SixIsland_WaterPath_House1/scripts.pory"
	release
# 65 "data/maps/SixIsland_WaterPath_House1/scripts.pory"
	end
# 66 "data/maps/SixIsland_WaterPath_House1/scripts.pory"

# 67 "data/maps/SixIsland_WaterPath_House1/scripts.pory"
SixIsland_WaterPath_House1_EventScript_SizeRecord::
# 68 "data/maps/SixIsland_WaterPath_House1/scripts.pory"
	lockall
# 69 "data/maps/SixIsland_WaterPath_House1/scripts.pory"
	goto_if_set FLAG_GOT_NEST_BALL_FROM_WATER_PATH_HOUSE_1, SixIsland_WaterPath_House1_EventScript_SizeRecordNonEmpty
# 70 "data/maps/SixIsland_WaterPath_House1/scripts.pory"
	msgbox SixIsland_WaterPath_House1_Text_BlankChartOfSomeSort
# 71 "data/maps/SixIsland_WaterPath_House1/scripts.pory"
	releaseall
# 72 "data/maps/SixIsland_WaterPath_House1/scripts.pory"
	end
# 73 "data/maps/SixIsland_WaterPath_House1/scripts.pory"

# 74 "data/maps/SixIsland_WaterPath_House1/scripts.pory"
SixIsland_WaterPath_House1_EventScript_SizeRecordNonEmpty::
# 75 "data/maps/SixIsland_WaterPath_House1/scripts.pory"
	special GetHeracrossSizeRecordInfo
# 76 "data/maps/SixIsland_WaterPath_House1/scripts.pory"
	msgbox SixIsland_WaterPath_House1_Text_BiggestHeracrossIsXInches
# 77 "data/maps/SixIsland_WaterPath_House1/scripts.pory"
	releaseall
# 78 "data/maps/SixIsland_WaterPath_House1/scripts.pory"
	end
