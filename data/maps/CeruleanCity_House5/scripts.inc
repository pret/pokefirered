# 1 "data/maps/CeruleanCity_House5/scripts.pory"

# 2 "data/maps/CeruleanCity_House5/scripts.pory"
CeruleanCity_House5_MapScripts::
# 3 "data/maps/CeruleanCity_House5/scripts.pory"
	.byte 0
# 4 "data/maps/CeruleanCity_House5/scripts.pory"

# 5 "data/maps/CeruleanCity_House5/scripts.pory"
CeruleanCity_House5_EventScript_BerryPowderMan::
# 6 "data/maps/CeruleanCity_House5/scripts.pory"
	lock
# 7 "data/maps/CeruleanCity_House5/scripts.pory"
	faceplayer
# 8 "data/maps/CeruleanCity_House5/scripts.pory"
	goto_if_set FLAG_GOT_POWDER_JAR, CeruleanCity_House5_EventScript_AskToExchangePowder
# 9 "data/maps/CeruleanCity_House5/scripts.pory"
	msgbox CeruleanCity_House1_Text_AnyInterestInBerries, MSGBOX_YESNO
# 10 "data/maps/CeruleanCity_House5/scripts.pory"
	goto_if_eq VAR_RESULT, NO, CeruleanCity_House5_EventScript_NoInterestInBerries
# 11 "data/maps/CeruleanCity_House5/scripts.pory"
	goto_if_unset FLAG_SYS_GOT_BERRY_POUCH, CeruleanCity_House5_EventScript_NoBerries
# 12 "data/maps/CeruleanCity_House5/scripts.pory"
	msgbox CeruleanCity_House1_Text_HaveJustTheThing
# 13 "data/maps/CeruleanCity_House5/scripts.pory"
	setflag FLAG_GOT_POWDER_JAR
# 14 "data/maps/CeruleanCity_House5/scripts.pory"
	giveitem ITEM_POWDER_JAR
# 15 "data/maps/CeruleanCity_House5/scripts.pory"
	goto_if_eq VAR_RESULT, FALSE, EventScript_BagIsFull
# 16 "data/maps/CeruleanCity_House5/scripts.pory"
	msgbox CeruleanCity_House1_Text_GoCrushBerriesAtDirectCorner
# 17 "data/maps/CeruleanCity_House5/scripts.pory"
	release
# 18 "data/maps/CeruleanCity_House5/scripts.pory"
	end
# 19 "data/maps/CeruleanCity_House5/scripts.pory"

# 20 "data/maps/CeruleanCity_House5/scripts.pory"
CeruleanCity_House5_EventScript_NoBerries::
# 21 "data/maps/CeruleanCity_House5/scripts.pory"
	msgbox CeruleanCity_House1_Text_WhyMustYouLieNoBerries
# 22 "data/maps/CeruleanCity_House5/scripts.pory"
	release
# 23 "data/maps/CeruleanCity_House5/scripts.pory"
	end
# 24 "data/maps/CeruleanCity_House5/scripts.pory"

# 25 "data/maps/CeruleanCity_House5/scripts.pory"
CeruleanCity_House5_EventScript_NoInterestInBerries::
# 26 "data/maps/CeruleanCity_House5/scripts.pory"
	msgbox CeruleanCity_House1_Text_TakeInterestInAllSortsOfThings
# 27 "data/maps/CeruleanCity_House5/scripts.pory"
	release
# 28 "data/maps/CeruleanCity_House5/scripts.pory"
	end
# 29 "data/maps/CeruleanCity_House5/scripts.pory"

# 30 "data/maps/CeruleanCity_House5/scripts.pory"
CeruleanCity_House5_EventScript_AskToExchangePowder::
# 31 "data/maps/CeruleanCity_House5/scripts.pory"
	special DisplayBerryPowderVendorMenu
# 32 "data/maps/CeruleanCity_House5/scripts.pory"
	msgbox CeruleanCity_House1_Text_HaveYouBroughtBerryPowder
# 33 "data/maps/CeruleanCity_House5/scripts.pory"
	goto CeruleanCity_House5_EventScript_ChooseExchangeItem
# 34 "data/maps/CeruleanCity_House5/scripts.pory"
	end
# 35 "data/maps/CeruleanCity_House5/scripts.pory"

# 36 "data/maps/CeruleanCity_House5/scripts.pory"
CeruleanCity_House5_EventScript_ChooseExchangeItem::
# 37 "data/maps/CeruleanCity_House5/scripts.pory"
	message CeruleanCity_House5_Text_ExchangeWithWhat
# 38 "data/maps/CeruleanCity_House5/scripts.pory"
	waitmessage
# 39 "data/maps/CeruleanCity_House5/scripts.pory"
	setvar VAR_0x8004, LISTMENU_BERRY_POWDER
# 40 "data/maps/CeruleanCity_House5/scripts.pory"
	special ListMenu
# 41 "data/maps/CeruleanCity_House5/scripts.pory"
	waitstate
# 42 "data/maps/CeruleanCity_House5/scripts.pory"
	switch VAR_RESULT
# 43 "data/maps/CeruleanCity_House5/scripts.pory"
	case 0, CeruleanCity_House5_EventScript_EnergyPowder
# 44 "data/maps/CeruleanCity_House5/scripts.pory"
	case 1, CeruleanCity_House5_EventScript_EnergyRoot
# 45 "data/maps/CeruleanCity_House5/scripts.pory"
	case 2, CeruleanCity_House5_EventScript_HealPowder
# 46 "data/maps/CeruleanCity_House5/scripts.pory"
	case 3, CeruleanCity_House5_EventScript_RevivalHerb
# 47 "data/maps/CeruleanCity_House5/scripts.pory"
	case 4, CeruleanCity_House5_EventScript_Protein
# 48 "data/maps/CeruleanCity_House5/scripts.pory"
	case 5, CeruleanCity_House5_EventScript_Iron
# 49 "data/maps/CeruleanCity_House5/scripts.pory"
	case 6, CeruleanCity_House5_EventScript_Carbos
# 50 "data/maps/CeruleanCity_House5/scripts.pory"
	case 7, CeruleanCity_House5_EventScript_Calcium
# 51 "data/maps/CeruleanCity_House5/scripts.pory"
	case 8, CeruleanCity_House5_EventScript_Zinc
# 52 "data/maps/CeruleanCity_House5/scripts.pory"
	case 9, CeruleanCity_House5_EventScript_HPUp
# 53 "data/maps/CeruleanCity_House5/scripts.pory"
	case 10, CeruleanCity_House5_EventScript_PPUp
# 54 "data/maps/CeruleanCity_House5/scripts.pory"
	case 11, CeruleanCity_House5_EventScript_ExitMenu
# 55 "data/maps/CeruleanCity_House5/scripts.pory"
	case 127, CeruleanCity_House5_EventScript_ExitMenu
# 56 "data/maps/CeruleanCity_House5/scripts.pory"
	end
# 57 "data/maps/CeruleanCity_House5/scripts.pory"

# 58 "data/maps/CeruleanCity_House5/scripts.pory"
CeruleanCity_House5_EventScript_EnergyPowder::
# 59 "data/maps/CeruleanCity_House5/scripts.pory"
	bufferitemname STR_VAR_1, ITEM_ENERGY_POWDER
# 60 "data/maps/CeruleanCity_House5/scripts.pory"
	setvar VAR_0x8008, ITEM_ENERGY_POWDER
# 61 "data/maps/CeruleanCity_House5/scripts.pory"
	setvar VAR_0x8009, 50
# 62 "data/maps/CeruleanCity_House5/scripts.pory"
	goto CeruleanCity_House5_EventScript_ExchangePowderForItem
# 63 "data/maps/CeruleanCity_House5/scripts.pory"
	end
# 64 "data/maps/CeruleanCity_House5/scripts.pory"

# 65 "data/maps/CeruleanCity_House5/scripts.pory"
CeruleanCity_House5_EventScript_EnergyRoot::
# 66 "data/maps/CeruleanCity_House5/scripts.pory"
	bufferitemname STR_VAR_1, ITEM_ENERGY_ROOT
# 67 "data/maps/CeruleanCity_House5/scripts.pory"
	setvar VAR_0x8008, ITEM_ENERGY_ROOT
# 68 "data/maps/CeruleanCity_House5/scripts.pory"
	setvar VAR_0x8009, 80
# 69 "data/maps/CeruleanCity_House5/scripts.pory"
	goto CeruleanCity_House5_EventScript_ExchangePowderForItem
# 70 "data/maps/CeruleanCity_House5/scripts.pory"
	end
# 71 "data/maps/CeruleanCity_House5/scripts.pory"

# 72 "data/maps/CeruleanCity_House5/scripts.pory"
CeruleanCity_House5_EventScript_HealPowder::
# 73 "data/maps/CeruleanCity_House5/scripts.pory"
	bufferitemname STR_VAR_1, ITEM_HEAL_POWDER
# 74 "data/maps/CeruleanCity_House5/scripts.pory"
	setvar VAR_0x8008, ITEM_HEAL_POWDER
# 75 "data/maps/CeruleanCity_House5/scripts.pory"
	setvar VAR_0x8009, 50
# 76 "data/maps/CeruleanCity_House5/scripts.pory"
	goto CeruleanCity_House5_EventScript_ExchangePowderForItem
# 77 "data/maps/CeruleanCity_House5/scripts.pory"
	end
# 78 "data/maps/CeruleanCity_House5/scripts.pory"

# 79 "data/maps/CeruleanCity_House5/scripts.pory"
CeruleanCity_House5_EventScript_RevivalHerb::
# 80 "data/maps/CeruleanCity_House5/scripts.pory"
	bufferitemname STR_VAR_1, ITEM_REVIVAL_HERB
# 81 "data/maps/CeruleanCity_House5/scripts.pory"
	setvar VAR_0x8008, ITEM_REVIVAL_HERB
# 82 "data/maps/CeruleanCity_House5/scripts.pory"
	setvar VAR_0x8009, 300
# 83 "data/maps/CeruleanCity_House5/scripts.pory"
	goto CeruleanCity_House5_EventScript_ExchangePowderForItem
# 84 "data/maps/CeruleanCity_House5/scripts.pory"
	end
# 85 "data/maps/CeruleanCity_House5/scripts.pory"

# 86 "data/maps/CeruleanCity_House5/scripts.pory"
CeruleanCity_House5_EventScript_Protein::
# 87 "data/maps/CeruleanCity_House5/scripts.pory"
	bufferitemname STR_VAR_1, ITEM_PROTEIN
# 88 "data/maps/CeruleanCity_House5/scripts.pory"
	setvar VAR_0x8008, ITEM_PROTEIN
# 89 "data/maps/CeruleanCity_House5/scripts.pory"
	setvar VAR_0x8009, 1000
# 90 "data/maps/CeruleanCity_House5/scripts.pory"
	goto CeruleanCity_House5_EventScript_ExchangePowderForItem
# 91 "data/maps/CeruleanCity_House5/scripts.pory"
	end
# 92 "data/maps/CeruleanCity_House5/scripts.pory"

# 93 "data/maps/CeruleanCity_House5/scripts.pory"
CeruleanCity_House5_EventScript_Iron::
# 94 "data/maps/CeruleanCity_House5/scripts.pory"
	bufferitemname STR_VAR_1, ITEM_IRON
# 95 "data/maps/CeruleanCity_House5/scripts.pory"
	setvar VAR_0x8008, ITEM_IRON
# 96 "data/maps/CeruleanCity_House5/scripts.pory"
	setvar VAR_0x8009, 1000
# 97 "data/maps/CeruleanCity_House5/scripts.pory"
	goto CeruleanCity_House5_EventScript_ExchangePowderForItem
# 98 "data/maps/CeruleanCity_House5/scripts.pory"
	end
# 99 "data/maps/CeruleanCity_House5/scripts.pory"

# 100 "data/maps/CeruleanCity_House5/scripts.pory"
CeruleanCity_House5_EventScript_Carbos::
# 101 "data/maps/CeruleanCity_House5/scripts.pory"
	bufferitemname STR_VAR_1, ITEM_CARBOS
# 102 "data/maps/CeruleanCity_House5/scripts.pory"
	setvar VAR_0x8008, ITEM_CARBOS
# 103 "data/maps/CeruleanCity_House5/scripts.pory"
	setvar VAR_0x8009, 1000
# 104 "data/maps/CeruleanCity_House5/scripts.pory"
	goto CeruleanCity_House5_EventScript_ExchangePowderForItem
# 105 "data/maps/CeruleanCity_House5/scripts.pory"
	end
# 106 "data/maps/CeruleanCity_House5/scripts.pory"

# 107 "data/maps/CeruleanCity_House5/scripts.pory"
CeruleanCity_House5_EventScript_Calcium::
# 108 "data/maps/CeruleanCity_House5/scripts.pory"
	bufferitemname STR_VAR_1, ITEM_CALCIUM
# 109 "data/maps/CeruleanCity_House5/scripts.pory"
	setvar VAR_0x8008, ITEM_CALCIUM
# 110 "data/maps/CeruleanCity_House5/scripts.pory"
	setvar VAR_0x8009, 1000
# 111 "data/maps/CeruleanCity_House5/scripts.pory"
	goto CeruleanCity_House5_EventScript_ExchangePowderForItem
# 112 "data/maps/CeruleanCity_House5/scripts.pory"
	end
# 113 "data/maps/CeruleanCity_House5/scripts.pory"

# 114 "data/maps/CeruleanCity_House5/scripts.pory"
CeruleanCity_House5_EventScript_Zinc::
# 115 "data/maps/CeruleanCity_House5/scripts.pory"
	bufferitemname STR_VAR_1, ITEM_ZINC
# 116 "data/maps/CeruleanCity_House5/scripts.pory"
	setvar VAR_0x8008, ITEM_ZINC
# 117 "data/maps/CeruleanCity_House5/scripts.pory"
	setvar VAR_0x8009, 1000
# 118 "data/maps/CeruleanCity_House5/scripts.pory"
	goto CeruleanCity_House5_EventScript_ExchangePowderForItem
# 119 "data/maps/CeruleanCity_House5/scripts.pory"
	end
# 120 "data/maps/CeruleanCity_House5/scripts.pory"

# 121 "data/maps/CeruleanCity_House5/scripts.pory"
CeruleanCity_House5_EventScript_HPUp::
# 122 "data/maps/CeruleanCity_House5/scripts.pory"
	bufferitemname STR_VAR_1, ITEM_HP_UP
# 123 "data/maps/CeruleanCity_House5/scripts.pory"
	setvar VAR_0x8008, ITEM_HP_UP
# 124 "data/maps/CeruleanCity_House5/scripts.pory"
	setvar VAR_0x8009, 1000
# 125 "data/maps/CeruleanCity_House5/scripts.pory"
	goto CeruleanCity_House5_EventScript_ExchangePowderForItem
# 126 "data/maps/CeruleanCity_House5/scripts.pory"
	end
# 127 "data/maps/CeruleanCity_House5/scripts.pory"

# 128 "data/maps/CeruleanCity_House5/scripts.pory"
CeruleanCity_House5_EventScript_PPUp::
# 129 "data/maps/CeruleanCity_House5/scripts.pory"
	bufferitemname STR_VAR_1, ITEM_PP_UP
# 130 "data/maps/CeruleanCity_House5/scripts.pory"
	setvar VAR_0x8008, ITEM_PP_UP
# 131 "data/maps/CeruleanCity_House5/scripts.pory"
	setvar VAR_0x8009, 3000
# 132 "data/maps/CeruleanCity_House5/scripts.pory"
	goto CeruleanCity_House5_EventScript_ExchangePowderForItem
# 133 "data/maps/CeruleanCity_House5/scripts.pory"
	end
# 134 "data/maps/CeruleanCity_House5/scripts.pory"

# 135 "data/maps/CeruleanCity_House5/scripts.pory"
CeruleanCity_House5_EventScript_ExitMenu::
# 136 "data/maps/CeruleanCity_House5/scripts.pory"
	msgbox CeruleanCity_House1_Text_SeeMeIfYoudLikeToTradePowder
# 137 "data/maps/CeruleanCity_House5/scripts.pory"
	special RemoveBerryPowderVendorMenu
# 138 "data/maps/CeruleanCity_House5/scripts.pory"
	release
# 139 "data/maps/CeruleanCity_House5/scripts.pory"
	end
# 140 "data/maps/CeruleanCity_House5/scripts.pory"

# 141 "data/maps/CeruleanCity_House5/scripts.pory"
CeruleanCity_House5_EventScript_ExchangePowderForItem::
# 142 "data/maps/CeruleanCity_House5/scripts.pory"
	msgbox CeruleanCity_House1_Text_YoullExchangeBerryPowderForItem, MSGBOX_YESNO
# 143 "data/maps/CeruleanCity_House5/scripts.pory"
	goto_if_eq VAR_RESULT, NO, CeruleanCity_House5_EventScript_ChooseExchangeItem
# 144 "data/maps/CeruleanCity_House5/scripts.pory"
	copyvar VAR_0x8004, VAR_0x8009
# 145 "data/maps/CeruleanCity_House5/scripts.pory"
	specialvar VAR_RESULT, Script_HasEnoughBerryPowder
# 146 "data/maps/CeruleanCity_House5/scripts.pory"
	goto_if_eq VAR_RESULT, FALSE, CeruleanCity_House5_EventScript_NotEnoughBerryPowder
# 147 "data/maps/CeruleanCity_House5/scripts.pory"
	giveitem VAR_0x8008
# 148 "data/maps/CeruleanCity_House5/scripts.pory"
	goto_if_eq VAR_RESULT, FALSE, CeruleanCity_House5_EventScript_BagIsFull
# 149 "data/maps/CeruleanCity_House5/scripts.pory"
	copyvar VAR_0x8004, VAR_0x8009
# 150 "data/maps/CeruleanCity_House5/scripts.pory"
	special Script_TakeBerryPowder
# 151 "data/maps/CeruleanCity_House5/scripts.pory"
	special PrintPlayerBerryPowderAmount
# 152 "data/maps/CeruleanCity_House5/scripts.pory"
	msgbox CeruleanCity_House1_Text_TradeMoreBerryPowder, MSGBOX_YESNO
# 153 "data/maps/CeruleanCity_House5/scripts.pory"
	goto_if_eq VAR_RESULT, YES, CeruleanCity_House5_EventScript_ChooseExchangeItem
# 154 "data/maps/CeruleanCity_House5/scripts.pory"
	msgbox CeruleanCity_House1_Text_HopeToSeeYouAgain
# 155 "data/maps/CeruleanCity_House5/scripts.pory"
	special RemoveBerryPowderVendorMenu
# 156 "data/maps/CeruleanCity_House5/scripts.pory"
	release
# 157 "data/maps/CeruleanCity_House5/scripts.pory"
	end
# 158 "data/maps/CeruleanCity_House5/scripts.pory"

# 159 "data/maps/CeruleanCity_House5/scripts.pory"
CeruleanCity_House5_EventScript_BagIsFull::
# 160 "data/maps/CeruleanCity_House5/scripts.pory"
	msgbox Text_BagIsFull
# 161 "data/maps/CeruleanCity_House5/scripts.pory"
	special RemoveBerryPowderVendorMenu
# 162 "data/maps/CeruleanCity_House5/scripts.pory"
	release
# 163 "data/maps/CeruleanCity_House5/scripts.pory"
	end
# 164 "data/maps/CeruleanCity_House5/scripts.pory"

# 165 "data/maps/CeruleanCity_House5/scripts.pory"
CeruleanCity_House5_EventScript_NotEnoughBerryPowder::
# 166 "data/maps/CeruleanCity_House5/scripts.pory"
	msgbox CeruleanCity_House1_Text_DontHaveEnoughBerryPowder
# 167 "data/maps/CeruleanCity_House5/scripts.pory"
	goto CeruleanCity_House5_EventScript_ChooseExchangeItem
# 168 "data/maps/CeruleanCity_House5/scripts.pory"
	end
# 169 "data/maps/CeruleanCity_House5/scripts.pory"

# 170 "data/maps/CeruleanCity_House5/scripts.pory"
CeruleanCity_House5_EventScript_BerryCrushRankings::
# 171 "data/maps/CeruleanCity_House5/scripts.pory"
	lockall
# 172 "data/maps/CeruleanCity_House5/scripts.pory"
	goto_if_questlog EventScript_ReleaseEnd
# 173 "data/maps/CeruleanCity_House5/scripts.pory"
	special ShowBerryCrushRankings
# 174 "data/maps/CeruleanCity_House5/scripts.pory"
	waitstate
# 175 "data/maps/CeruleanCity_House5/scripts.pory"
	releaseall
# 176 "data/maps/CeruleanCity_House5/scripts.pory"
	end
