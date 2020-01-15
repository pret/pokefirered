SixIsland_WaterPath_House1_MapScripts:: @ 817206C
	.byte 0

SixIsland_WaterPath_House1_EventScript_17206D:: @ 817206D
	lock
	faceplayer
	goto_if_questlog EventScript_ReleaseEnd
	special sub_8112364
	setvar VAR_0x8004, SPECIES_HERACROSS
	specialvar VAR_RESULT, Special_PlayerPartyContainsSpecies
	compare VAR_RESULT, 0
	goto_if_eq EventScript_1720E5
	special GetHeracrossSizeRecordInfo
	msgbox gUnknown_81A4A3F
	special Special_ChooseMonFromParty
	waitstate
	copyvar VAR_RESULT, VAR_0x8004
	compare VAR_RESULT, 6
	goto_if_ge EventScript_1720EF
	special CompareHeracrossSize
	compare VAR_RESULT, 1
	goto_if_eq EventScript_1720F1
	compare VAR_RESULT, 2
	goto_if_eq EventScript_1720FB
	compare VAR_RESULT, 3
	goto_if_eq EventScript_172121
	compare VAR_RESULT, 4
	goto_if_eq EventScript_17210E
	release
	end

EventScript_1720E5:: @ 81720E5
	msgbox gUnknown_81A49E9
	release
	end

EventScript_1720EF:: @ 81720EF
	release
	end

EventScript_1720F1:: @ 81720F1
	msgbox gUnknown_81A4BEF
	release
	end

EventScript_1720FB:: @ 81720FB
	goto_if_unset FLAG_GOT_NEST_BALL_FROM_WATER_PATH_HOUSE_1, EventScript_172121
	msgbox gUnknown_81A4B7A
	release
	end

EventScript_17210E:: @ 817210E
	goto_if_unset FLAG_GOT_NEST_BALL_FROM_WATER_PATH_HOUSE_1, EventScript_172121
	msgbox gUnknown_81A4B39
	release
	end

EventScript_172121:: @ 8172121
	setflag FLAG_GOT_NEST_BALL_FROM_WATER_PATH_HOUSE_1
	msgbox gUnknown_81A4A88
	giveitem ITEM_NEST_BALL
	compare VAR_RESULT, 0
	goto_if_eq EventScript_17214D
	msgbox gUnknown_81A4AD9
	release
	end

EventScript_17214D:: @ 817214D
	msgbox gUnknown_81A4C47
	release
	end

SixIsland_WaterPath_House1_EventScript_172157:: @ 8172157
	lockall
	goto_if_set FLAG_GOT_NEST_BALL_FROM_WATER_PATH_HOUSE_1, EventScript_17216B
	msgbox gUnknown_81A4CB9
	releaseall
	end

EventScript_17216B:: @ 817216B
	special GetHeracrossSizeRecordInfo
	msgbox gUnknown_81A4C6E
	releaseall
	end
