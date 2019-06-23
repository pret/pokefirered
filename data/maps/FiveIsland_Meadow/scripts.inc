FiveIsland_Meadow_MapScripts:: @ 8168932
	map_script 1, FiveIsland_Meadow_MapScript1_168938
	.byte 0

FiveIsland_Meadow_MapScript1_168938:: @ 8168938
	checkflag FLAG_0x2D6
	call_if 1, EventScript_168983
	end

FiveIsland_Meadow_EventScript_168942:: @ 8168942
	lockall
	checkflag FLAG_0x2D6
	goto_if_eq EventScript_168979
	checkflag FLAG_0x2D8
	goto_if_eq EventScript_16895F
	msgbox gUnknown_818AB8E
	releaseall
	end

EventScript_16895F:: @ 816895F
	setflag FLAG_0x2D6
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
	trainerbattle 0, 567, 0, Text_18AC88, Text_18ACB3
	msgbox gUnknown_818ACC5, 6
	end

FiveIsland_Meadow_EventScript_1689A4:: @ 81689A4
	trainerbattle 0, 568, 0, Text_18ACF0, Text_18AD39
	msgbox gUnknown_818AD59, 6
	end

FiveIsland_Meadow_EventScript_1689BB:: @ 81689BB
	trainerbattle 0, 569, 0, Text_18ADC6, Text_18ADFB
	msgbox gUnknown_818AE16, 6
	end
