FiveIsland_Meadow_MapScripts:: @ 8168932
	map_script MAP_SCRIPT_ON_LOAD, FiveIsland_Meadow_OnLoad
	.byte 0

FiveIsland_Meadow_OnLoad:: @ 8168938
	checkflag FLAG_UNLOCKED_ROCKET_WAREHOUSE
	call_if TRUE, EventScript_168983
	end

FiveIsland_Meadow_EventScript_168942:: @ 8168942
	lockall
	checkflag FLAG_UNLOCKED_ROCKET_WAREHOUSE
	goto_if TRUE, EventScript_168979
	checkflag FLAG_LEARNED_YES_NAH_CHANSEY
	goto_if TRUE, EventScript_16895F
	msgbox gUnknown_818AB8E
	releaseall
	end

EventScript_16895F:: @ 816895F
	setflag FLAG_UNLOCKED_ROCKET_WAREHOUSE
	message Text_18ABF4
	waitmessage
	delay 60
	call EventScript_168983
	special DrawWholeMapView
	playse SE_PIN
	waitse
	releaseall
	end

EventScript_168979:: @ 8168979
	msgbox gUnknown_818AC62
	releaseall
	end

EventScript_168983:: @ 8168983
	setmetatile 12, 21, 687, 1
	return

FiveIsland_Meadow_EventScript_16898D:: @ 816898D
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_TEAM_ROCKET_GRUNT_49, 0, Text_18AC88, Text_18ACB3
	msgbox gUnknown_818ACC5, 6
	end

FiveIsland_Meadow_EventScript_1689A4:: @ 81689A4
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_TEAM_ROCKET_GRUNT_50, 0, Text_18ACF0, Text_18AD39
	msgbox gUnknown_818AD59, 6
	end

FiveIsland_Meadow_EventScript_1689BB:: @ 81689BB
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_TEAM_ROCKET_GRUNT_51, 0, Text_18ADC6, Text_18ADFB
	msgbox gUnknown_818AE16, 6
	end
