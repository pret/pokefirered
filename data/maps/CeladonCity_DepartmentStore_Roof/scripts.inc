# 1 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"

# 2 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
CeladonCity_DepartmentStore_Roof_MapScripts::
# 3 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	.byte 0
# 4 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"

# 5 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
CeladonCity_DepartmentStore_Roof_EventScript_ThirstyGirl::
# 6 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	goto_if_questlog EventScript_ReleaseEnd
# 7 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	special QuestLog_CutRecording
# 8 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	lock
# 9 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	faceplayer
# 10 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	call CeladonCity_DepartmentStore_Roof_EventScript_CheckPlayerHasDrinks
# 11 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	goto_if_eq VAR_TEMP_1, 0, CeladonCity_DepartmentStore_Roof_EventScript_IWantDrink
# 12 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	goto CeladonCity_DepartmentStore_Roof_EventScript_AskGiveDrink
# 13 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	end
# 14 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"

# 15 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
CeladonCity_DepartmentStore_Roof_EventScript_CheckPlayerHasDrinks::
# 16 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	setvar VAR_TEMP_1, 0
# 17 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	checkitem ITEM_FRESH_WATER
# 18 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	call_if_eq VAR_RESULT, TRUE, CeladonCity_DepartmentStore_Roof_EventScript_SetHasFreshWater
# 19 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	checkitem ITEM_SODA_POP
# 20 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	call_if_eq VAR_RESULT, TRUE, CeladonCity_DepartmentStore_Roof_EventScript_SetHasSodaPop
# 21 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	checkitem ITEM_LEMONADE
# 22 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	call_if_eq VAR_RESULT, TRUE, CeladonCity_DepartmentStore_Roof_EventScript_SetHasLemonade
# 23 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	return
# 24 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"

# 25 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
CeladonCity_DepartmentStore_Roof_EventScript_SetHasFreshWater::
# 26 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	addvar VAR_TEMP_1, 1
# 27 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	return
# 28 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"

# 29 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
CeladonCity_DepartmentStore_Roof_EventScript_SetHasSodaPop::
# 30 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	addvar VAR_TEMP_1, 2
# 31 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	return
# 32 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"

# 33 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
CeladonCity_DepartmentStore_Roof_EventScript_SetHasLemonade::
# 34 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	addvar VAR_TEMP_1, 4
# 35 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	return
# 36 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"

# 37 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
CeladonCity_DepartmentStore_Roof_EventScript_AskGiveDrink::
# 38 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	msgbox CeladonCity_DepartmentStore_Roof_Text_ImThirstyGiveHerDrink, MSGBOX_YESNO
# 39 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	goto_if_eq VAR_RESULT, NO, CeladonCity_DepartmentStore_Roof_EventScript_DontGiveDrink
# 40 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	textcolor NPC_TEXT_COLOR_NEUTRAL
# 41 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	message CeladonCity_DepartmentStore_Roof_Text_GiveWhichDrink
# 42 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	waitmessage
# 43 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	textcolor NPC_TEXT_COLOR_FEMALE
# 44 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	switch VAR_TEMP_1
# 45 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	case 1, CeladonCity_DepartmentStore_Roof_EventScript_AskGiveFreshWater
# 46 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	case 2, CeladonCity_DepartmentStore_Roof_EventScript_AskGiveSodaPop
# 47 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	case 3, CeladonCity_DepartmentStore_Roof_EventScript_AskGiveFreshWaterSodaPop
# 48 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	case 4, CeladonCity_DepartmentStore_Roof_EventScript_AskGiveLemonade
# 49 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	case 5, CeladonCity_DepartmentStore_Roof_EventScript_AskGiveFreshWaterLemonade
# 50 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	case 6, CeladonCity_DepartmentStore_Roof_EventScript_AskGiveSodaPopLemonade
# 51 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	case 7, CeladonCity_DepartmentStore_Roof_EventScript_AskGiveAllDrinks
# 52 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	end
# 53 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"

# 54 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
CeladonCity_DepartmentStore_Roof_EventScript_AskGiveFreshWater::
# 55 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	multichoice 0, 0, MULTICHOICE_THIRSTY_GIRL_FRESH_WATER, FALSE
# 56 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	switch VAR_RESULT
# 57 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	case 0, CeladonCity_DepartmentStore_Roof_EventScript_GiveFreshWater
# 58 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	case 1, CeladonCity_DepartmentStore_Roof_EventScript_DontGiveDrink
# 59 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	case 127, CeladonCity_DepartmentStore_Roof_EventScript_DontGiveDrink
# 60 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	end
# 61 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"

# 62 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
CeladonCity_DepartmentStore_Roof_EventScript_AskGiveSodaPop::
# 63 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	multichoice 0, 0, MULTICHOICE_THIRSTY_GIRL_SODA_POP, FALSE
# 64 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	switch VAR_RESULT
# 65 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	case 0, CeladonCity_DepartmentStore_Roof_EventScript_GiveSodaPop
# 66 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	case 1, CeladonCity_DepartmentStore_Roof_EventScript_DontGiveDrink
# 67 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	case 127, CeladonCity_DepartmentStore_Roof_EventScript_DontGiveDrink
# 68 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	end
# 69 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"

# 70 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
CeladonCity_DepartmentStore_Roof_EventScript_AskGiveFreshWaterSodaPop::
# 71 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	multichoice 0, 0, MULTICHOICE_THIRSTY_GIRL_FRESH_WATER_SODA_POP, FALSE
# 72 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	switch VAR_RESULT
# 73 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	case 0, CeladonCity_DepartmentStore_Roof_EventScript_GiveFreshWater
# 74 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	case 1, CeladonCity_DepartmentStore_Roof_EventScript_GiveSodaPop
# 75 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	case 2, CeladonCity_DepartmentStore_Roof_EventScript_DontGiveDrink
# 76 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	case 127, CeladonCity_DepartmentStore_Roof_EventScript_DontGiveDrink
# 77 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	end
# 78 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"

# 79 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
CeladonCity_DepartmentStore_Roof_EventScript_AskGiveLemonade::
# 80 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	multichoice 0, 0, MULTICHOICE_THIRSTY_GIRL_LEMONADE, FALSE
# 81 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	switch VAR_RESULT
# 82 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	case 0, CeladonCity_DepartmentStore_Roof_EventScript_GiveLemonade
# 83 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	case 1, CeladonCity_DepartmentStore_Roof_EventScript_DontGiveDrink
# 84 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	case 127, CeladonCity_DepartmentStore_Roof_EventScript_DontGiveDrink
# 85 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	end
# 86 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"

# 87 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
CeladonCity_DepartmentStore_Roof_EventScript_AskGiveFreshWaterLemonade::
# 88 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	multichoice 0, 0, MULTICHOICE_THIRSTY_GIRL_FRESH_WATER_LEMONADE, FALSE
# 89 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	switch VAR_RESULT
# 90 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	case 0, CeladonCity_DepartmentStore_Roof_EventScript_GiveFreshWater
# 91 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	case 1, CeladonCity_DepartmentStore_Roof_EventScript_GiveLemonade
# 92 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	case 2, CeladonCity_DepartmentStore_Roof_EventScript_DontGiveDrink
# 93 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	case 127, CeladonCity_DepartmentStore_Roof_EventScript_DontGiveDrink
# 94 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	end
# 95 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"

# 96 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
CeladonCity_DepartmentStore_Roof_EventScript_AskGiveSodaPopLemonade::
# 97 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	multichoice 0, 0, MULTICHOICE_THIRSTY_GIRL_SODA_POP_LEMONADE, FALSE
# 98 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	switch VAR_RESULT
# 99 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	case 0, CeladonCity_DepartmentStore_Roof_EventScript_GiveSodaPop
# 100 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	case 1, CeladonCity_DepartmentStore_Roof_EventScript_GiveLemonade
# 101 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	case 2, CeladonCity_DepartmentStore_Roof_EventScript_DontGiveDrink
# 102 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	case 127, CeladonCity_DepartmentStore_Roof_EventScript_DontGiveDrink
# 103 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	end
# 104 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"

# 105 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
CeladonCity_DepartmentStore_Roof_EventScript_AskGiveAllDrinks::
# 106 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	multichoice 0, 0, MULTICHOICE_THIRSTY_GIRL_FRESH_WATER_SODA_POP_LEMONADE, FALSE
# 107 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	switch VAR_RESULT
# 108 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	case 0, CeladonCity_DepartmentStore_Roof_EventScript_GiveFreshWater
# 109 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	case 1, CeladonCity_DepartmentStore_Roof_EventScript_GiveSodaPop
# 110 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	case 2, CeladonCity_DepartmentStore_Roof_EventScript_GiveLemonade
# 111 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	case 3, CeladonCity_DepartmentStore_Roof_EventScript_DontGiveDrink
# 112 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	case 127, CeladonCity_DepartmentStore_Roof_EventScript_DontGiveDrink
# 113 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	end
# 114 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"

# 115 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
CeladonCity_DepartmentStore_Roof_EventScript_GiveFreshWater::
# 116 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	setvar VAR_0x8008, ITEM_FRESH_WATER
# 117 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	setvar VAR_0x8009, ITEM_TM16
# 118 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	goto_if_set FLAG_GOT_TM16_FROM_THIRSTY_GIRL, CeladonCity_DepartmentStore_Roof_EventScript_NotThirstyAfterAll
# 119 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	msgbox CeladonCity_DepartmentStore_Roof_Text_YayFreshWaterHaveThis
# 120 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	goto CeladonCity_DepartmentStore_Roof_EventScript_GiveDrink
# 121 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	end
# 122 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"

# 123 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
CeladonCity_DepartmentStore_Roof_EventScript_GiveSodaPop::
# 124 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	setvar VAR_0x8008, ITEM_SODA_POP
# 125 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	setvar VAR_0x8009, ITEM_TM20
# 126 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	goto_if_set FLAG_GOT_TM20_FROM_THIRSTY_GIRL, CeladonCity_DepartmentStore_Roof_EventScript_NotThirstyAfterAll
# 127 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	msgbox CeladonCity_DepartmentStore_Roof_Text_YaySodaPopHaveThis
# 128 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	goto CeladonCity_DepartmentStore_Roof_EventScript_GiveDrink
# 129 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	end
# 130 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"

# 131 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
CeladonCity_DepartmentStore_Roof_EventScript_GiveLemonade::
# 132 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	setvar VAR_0x8008, ITEM_LEMONADE
# 133 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	setvar VAR_0x8009, ITEM_TM33
# 134 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	goto_if_set FLAG_GOT_TM33_FROM_THIRSTY_GIRL, CeladonCity_DepartmentStore_Roof_EventScript_NotThirstyAfterAll
# 135 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	msgbox CeladonCity_DepartmentStore_Roof_Text_YayLemonadeHaveThis
# 136 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	goto CeladonCity_DepartmentStore_Roof_EventScript_GiveDrink
# 137 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	end
# 138 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"

# 139 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
CeladonCity_DepartmentStore_Roof_EventScript_GiveDrink::
# 140 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	bufferitemname STR_VAR_1, VAR_0x8008
# 141 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	bufferitemname STR_VAR_2, VAR_0x8009
# 142 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	removeitem VAR_0x8008
# 143 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	checkitemspace VAR_0x8009
# 144 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	goto_if_eq VAR_RESULT, FALSE, CeladonCity_DepartmentStore_Roof_EventScript_NoRoomForReward
# 145 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	additem VAR_0x8009
# 146 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	textcolor NPC_TEXT_COLOR_NEUTRAL
# 147 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	playfanfare MUS_LEVEL_UP
# 148 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	message Text_ReceivedItemFromLittleGirl
# 149 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	waitmessage
# 150 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	waitfanfare
# 151 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	putitemaway VAR_0x8009
# 152 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	call EventScript_RestorePrevTextColor
# 153 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	call_if_eq VAR_0x8008, ITEM_FRESH_WATER, CeladonCity_DepartmentStore_Roof_EventScript_ExplainTM16
# 154 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	call_if_eq VAR_0x8008, ITEM_SODA_POP, CeladonCity_DepartmentStore_Roof_EventScript_ExplainTM20
# 155 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	call_if_eq VAR_0x8008, ITEM_LEMONADE, CeladonCity_DepartmentStore_Roof_EventScript_ExplainTM33
# 156 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	release
# 157 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	end
# 158 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"

# 159 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
CeladonCity_DepartmentStore_Roof_EventScript_ExplainTM16::
# 160 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	setflag FLAG_GOT_TM16_FROM_THIRSTY_GIRL
# 161 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	msgbox CeladonCity_DepartmentStore_Roof_Text_ExplainTM16
# 162 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	return
# 163 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"

# 164 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
CeladonCity_DepartmentStore_Roof_EventScript_ExplainTM20::
# 165 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	setflag FLAG_GOT_TM20_FROM_THIRSTY_GIRL
# 166 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	msgbox CeladonCity_DepartmentStore_Roof_Text_ExplainTM20
# 167 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	return
# 168 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"

# 169 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
CeladonCity_DepartmentStore_Roof_EventScript_ExplainTM33::
# 170 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	setflag FLAG_GOT_TM33_FROM_THIRSTY_GIRL
# 171 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	msgbox CeladonCity_DepartmentStore_Roof_Text_ExplainTM33
# 172 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	return
# 173 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"

# 174 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
CeladonCity_DepartmentStore_Roof_EventScript_NoRoomForReward::
# 175 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	msgbox CeladonCity_DepartmentStore_Roof_Text_DontHaveSpaceForThis
# 176 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	release
# 177 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	end
# 178 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"

# 179 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
CeladonCity_DepartmentStore_Roof_EventScript_DontGiveDrink::
# 180 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	release
# 181 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	end
# 182 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"

# 183 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
CeladonCity_DepartmentStore_Roof_EventScript_IWantDrink::
# 184 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	msgbox CeladonCity_DepartmentStore_Roof_Text_ImThirstyIWantDrink
# 185 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	release
# 186 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	end
# 187 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"

# 188 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
CeladonCity_DepartmentStore_Roof_EventScript_NotThirstyAfterAll::
# 189 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	msgbox CeladonCity_DepartmentStore_Roof_Text_ImNotThirstyAfterAll
# 190 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	release
# 191 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	end
# 192 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"

# 193 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
CeladonCity_DepartmentStore_Roof_EventScript_CooltrainerM::
# 194 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	msgbox CeladonCity_DepartmentStore_Roof_Text_MySisterIsImmature, MSGBOX_NPC
# 195 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	end
# 196 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"

# 197 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
CeladonCity_DepartmentStore_Roof_EventScript_FloorSign::
# 198 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	msgbox CeladonCity_DepartmentStore_Roof_Text_FloorSign, MSGBOX_SIGN
# 199 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	end
# 200 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"

# 201 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
CeladonCity_DepartmentStore_Roof_EventScript_VendingMachine::
# 202 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	lockall
# 203 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	message CeladonCity_DepartmentStore_Roof_Text_VendingMachineWhatDoesItHave
# 204 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	waitmessage
# 205 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	showmoneybox 0, 0
# 206 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	goto CeladonCity_DepartmentStore_Roof_EventScript_ChooseDrink
# 207 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	end
# 208 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"

# 209 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
CeladonCity_DepartmentStore_Roof_EventScript_ChooseDrink::
# 210 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	multichoice 12, 0, MULTICHOICE_CELADON_VENDING_MACHINE, FALSE
# 211 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	copyvar VAR_TEMP_1, VAR_RESULT
# 212 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	switch VAR_TEMP_1
# 213 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	case 0, CeladonCity_DepartmentStore_Roof_EventScript_BuyFreshWater
# 214 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	case 1, CeladonCity_DepartmentStore_Roof_EventScript_BuySodaPop
# 215 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	case 2, CeladonCity_DepartmentStore_Roof_EventScript_BuyLemonade
# 216 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	msgbox CeladonCity_DepartmentStore_Roof_Text_NotThirsty
# 217 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	goto CeladonCity_DepartmentStore_Roof_EventScript_ExitVendingMachine
# 218 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	end
# 219 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"

# 220 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
CeladonCity_DepartmentStore_Roof_EventScript_BuyFreshWater::
# 221 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	setvar VAR_TEMP_0, ITEM_FRESH_WATER
# 222 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	checkmoney 200
# 223 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	goto CeladonCity_DepartmentStore_Roof_EventScript_TryBuyDrink
# 224 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	end
# 225 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"

# 226 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
CeladonCity_DepartmentStore_Roof_EventScript_BuySodaPop::
# 227 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	setvar VAR_TEMP_0, ITEM_SODA_POP
# 228 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	checkmoney 300
# 229 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	goto CeladonCity_DepartmentStore_Roof_EventScript_TryBuyDrink
# 230 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	end
# 231 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"

# 232 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
CeladonCity_DepartmentStore_Roof_EventScript_BuyLemonade::
# 233 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	setvar VAR_TEMP_0, ITEM_LEMONADE
# 234 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	checkmoney 350
# 235 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	goto CeladonCity_DepartmentStore_Roof_EventScript_TryBuyDrink
# 236 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	end
# 237 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"

# 238 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
CeladonCity_DepartmentStore_Roof_EventScript_RemoveMoneyFreshWater::
# 239 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	removemoney 200
# 240 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	return
# 241 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"

# 242 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
CeladonCity_DepartmentStore_Roof_EventScript_RemoveMoneySodaPop::
# 243 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	removemoney 300
# 244 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	return
# 245 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"

# 246 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
CeladonCity_DepartmentStore_Roof_EventScript_RemoveMoneyLemonade::
# 247 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	removemoney 350
# 248 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	return
# 249 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"

# 250 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
CeladonCity_DepartmentStore_Roof_EventScript_TryBuyDrink::
# 251 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	goto_if_eq VAR_RESULT, FALSE, CeladonCity_DepartmentStore_Roof_EventScript_NotEnoughMoney
# 252 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	checkitemspace VAR_TEMP_0
# 253 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	goto_if_eq VAR_RESULT, FALSE, CeladonCity_DepartmentStore_Roof_EventScript_NoRoomForDrink
# 254 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	call_if_eq VAR_TEMP_1, 0, CeladonCity_DepartmentStore_Roof_EventScript_RemoveMoneyFreshWater
# 255 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	call_if_eq VAR_TEMP_1, 1, CeladonCity_DepartmentStore_Roof_EventScript_RemoveMoneySodaPop
# 256 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	call_if_eq VAR_TEMP_1, 2, CeladonCity_DepartmentStore_Roof_EventScript_RemoveMoneyLemonade
# 257 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	updatemoneybox
# 258 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	bufferitemname STR_VAR_1, VAR_TEMP_0
# 259 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	playse SE_VEND
# 260 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	msgbox CeladonCity_DepartmentStore_Roof_Text_DrinkCanPoppedOut
# 261 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	additem VAR_TEMP_0
# 262 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	goto CeladonCity_DepartmentStore_Roof_EventScript_ChooseNewDrink
# 263 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	end
# 264 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"

# 265 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
CeladonCity_DepartmentStore_Roof_EventScript_ChooseNewDrink::
# 266 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	message CeladonCity_DepartmentStore_Roof_Text_VendingMachineWhatDoesItHave
# 267 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	waitmessage
# 268 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	goto CeladonCity_DepartmentStore_Roof_EventScript_ChooseDrink
# 269 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	end
# 270 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"

# 271 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
CeladonCity_DepartmentStore_Roof_EventScript_NotEnoughMoney::
# 272 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	msgbox CeladonCity_DepartmentStore_Roof_Text_NotEnoughMoney
# 273 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	goto CeladonCity_DepartmentStore_Roof_EventScript_ExitVendingMachine
# 274 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	end
# 275 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"

# 276 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
CeladonCity_DepartmentStore_Roof_EventScript_NoRoomForDrink::
# 277 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	msgbox CeladonCity_DepartmentStore_Roof_Text_NoMoreRoomForStuff
# 278 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	goto CeladonCity_DepartmentStore_Roof_EventScript_ExitVendingMachine
# 279 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	end
# 280 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"

# 281 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
CeladonCity_DepartmentStore_Roof_EventScript_ExitVendingMachine::
# 282 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	hidemoneybox
# 283 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	releaseall
# 284 "data/maps/CeladonCity_DepartmentStore_Roof/scripts.pory"
	end
