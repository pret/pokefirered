# 1 "data/maps/CeladonCity_GameCorner/scripts.pory"

# 2 "data/maps/CeladonCity_GameCorner/scripts.pory"
.set LOCALID_GRUNT, 11
# 3 "data/maps/CeladonCity_GameCorner/scripts.pory"

# 4 "data/maps/CeladonCity_GameCorner/scripts.pory"
CeladonCity_GameCorner_MapScripts::
# 5 "data/maps/CeladonCity_GameCorner/scripts.pory"
	map_script MAP_SCRIPT_ON_LOAD, CeladonCity_GameCorner_OnLoad
# 6 "data/maps/CeladonCity_GameCorner/scripts.pory"
	.byte 0
# 7 "data/maps/CeladonCity_GameCorner/scripts.pory"

# 8 "data/maps/CeladonCity_GameCorner/scripts.pory"
CeladonCity_GameCorner_OnLoad::
# 9 "data/maps/CeladonCity_GameCorner/scripts.pory"
	call_if_unset FLAG_OPENED_ROCKET_HIDEOUT, CeladonCity_GameCorner_EventScript_HideRocketHideout
# 10 "data/maps/CeladonCity_GameCorner/scripts.pory"
	end
# 11 "data/maps/CeladonCity_GameCorner/scripts.pory"

# 12 "data/maps/CeladonCity_GameCorner/scripts.pory"
CeladonCity_GameCorner_EventScript_HideRocketHideout::
# 13 "data/maps/CeladonCity_GameCorner/scripts.pory"
	setmetatile 15, 2, METATILE_GameCorner_Floor_ShadeFull, 0
# 14 "data/maps/CeladonCity_GameCorner/scripts.pory"
	setmetatile 16, 2, METATILE_GameCorner_Floor_ShadeFull, 0
# 15 "data/maps/CeladonCity_GameCorner/scripts.pory"
	setmetatile 17, 2, METATILE_GameCorner_Floor_ShadeFull, 0
# 16 "data/maps/CeladonCity_GameCorner/scripts.pory"
	setmetatile 16, 3, METATILE_GameCorner_PurpleWall_Floor, 1
# 17 "data/maps/CeladonCity_GameCorner/scripts.pory"
	setmetatile 17, 3, METATILE_GameCorner_PurpleWall_Floor, 1
# 18 "data/maps/CeladonCity_GameCorner/scripts.pory"
	return
# 19 "data/maps/CeladonCity_GameCorner/scripts.pory"

# 20 "data/maps/CeladonCity_GameCorner/scripts.pory"
CeladonCity_GameCorner_EventScript_InfoClerk::
# 21 "data/maps/CeladonCity_GameCorner/scripts.pory"
	msgbox CeladonCity_GameCorner_Text_CanExchangeCoinsNextDoor, MSGBOX_NPC
# 22 "data/maps/CeladonCity_GameCorner/scripts.pory"
	end
# 23 "data/maps/CeladonCity_GameCorner/scripts.pory"

# 24 "data/maps/CeladonCity_GameCorner/scripts.pory"
CeladonCity_GameCorner_EventScript_CoinsClerk::
# 25 "data/maps/CeladonCity_GameCorner/scripts.pory"
	goto_if_questlog EventScript_ReleaseEnd
# 26 "data/maps/CeladonCity_GameCorner/scripts.pory"
	lock
# 27 "data/maps/CeladonCity_GameCorner/scripts.pory"
	faceplayer
# 28 "data/maps/CeladonCity_GameCorner/scripts.pory"
	showmoneybox 0, 0
# 29 "data/maps/CeladonCity_GameCorner/scripts.pory"
	showcoinsbox 0, 5
# 30 "data/maps/CeladonCity_GameCorner/scripts.pory"
	message CeladonCity_GameCorner_Text_WelcomeBuySomeCoins
# 31 "data/maps/CeladonCity_GameCorner/scripts.pory"
	waitmessage
# 32 "data/maps/CeladonCity_GameCorner/scripts.pory"
	multichoice 13, 0, MULTICHOICE_GAME_CORNER_COIN_PURCHASE_COUNTER, FALSE
# 33 "data/maps/CeladonCity_GameCorner/scripts.pory"
	copyvar VAR_0x8009, VAR_RESULT
# 34 "data/maps/CeladonCity_GameCorner/scripts.pory"
	switch VAR_RESULT
# 35 "data/maps/CeladonCity_GameCorner/scripts.pory"
	case 0, CeladonCity_GameCorner_EventScript_BuyCoins
# 36 "data/maps/CeladonCity_GameCorner/scripts.pory"
	case 1, CeladonCity_GameCorner_EventScript_BuyCoins
# 37 "data/maps/CeladonCity_GameCorner/scripts.pory"
	case 2, CeladonCity_GameCorner_EventScript_ClerkDeclineBuy
# 38 "data/maps/CeladonCity_GameCorner/scripts.pory"
	case 127, CeladonCity_GameCorner_EventScript_ClerkDeclineBuy
# 39 "data/maps/CeladonCity_GameCorner/scripts.pory"
	end
# 40 "data/maps/CeladonCity_GameCorner/scripts.pory"

# 41 "data/maps/CeladonCity_GameCorner/scripts.pory"
CeladonCity_GameCorner_EventScript_BuyCoins::
# 42 "data/maps/CeladonCity_GameCorner/scripts.pory"
	goto_if_unset FLAG_GOT_COIN_CASE, CeladonCity_GameCorner_EventScript_ClerkNoCoinCase
# 43 "data/maps/CeladonCity_GameCorner/scripts.pory"
	goto_if_eq VAR_0x8009, 0, CeladonCity_GameCorner_EventScript_Buy50Coins
# 44 "data/maps/CeladonCity_GameCorner/scripts.pory"
	goto_if_eq VAR_0x8009, 1, CeladonCity_GameCorner_EventScript_Buy500Coins
# 45 "data/maps/CeladonCity_GameCorner/scripts.pory"
	end
# 46 "data/maps/CeladonCity_GameCorner/scripts.pory"

# 47 "data/maps/CeladonCity_GameCorner/scripts.pory"
CeladonCity_GameCorner_EventScript_Buy500Coins::
# 48 "data/maps/CeladonCity_GameCorner/scripts.pory"
	checkcoins VAR_TEMP_1
# 49 "data/maps/CeladonCity_GameCorner/scripts.pory"
	goto_if_ge VAR_TEMP_1, (MAX_COINS + 1) - 500, CeladonCity_GameCorner_EventScript_ClerkNoRoomForCoins
# 50 "data/maps/CeladonCity_GameCorner/scripts.pory"
	checkmoney 10000
# 51 "data/maps/CeladonCity_GameCorner/scripts.pory"
	goto_if_eq VAR_RESULT, FALSE, CeladonCity_GameCorner_EventScript_ClerkNotEnoughMoney
# 52 "data/maps/CeladonCity_GameCorner/scripts.pory"
	addcoins 500
# 53 "data/maps/CeladonCity_GameCorner/scripts.pory"
	removemoney 10000
# 54 "data/maps/CeladonCity_GameCorner/scripts.pory"
	goto CeladonCity_GameCorner_EventScript_BoughtCoins
# 55 "data/maps/CeladonCity_GameCorner/scripts.pory"
	end
# 56 "data/maps/CeladonCity_GameCorner/scripts.pory"

# 57 "data/maps/CeladonCity_GameCorner/scripts.pory"
CeladonCity_GameCorner_EventScript_Buy50Coins::
# 58 "data/maps/CeladonCity_GameCorner/scripts.pory"
	checkcoins VAR_TEMP_1
# 59 "data/maps/CeladonCity_GameCorner/scripts.pory"
	goto_if_ge VAR_TEMP_1, (MAX_COINS + 1) - 50, CeladonCity_GameCorner_EventScript_ClerkNoRoomForCoins
# 60 "data/maps/CeladonCity_GameCorner/scripts.pory"
	checkmoney 1000
# 61 "data/maps/CeladonCity_GameCorner/scripts.pory"
	goto_if_eq VAR_RESULT, FALSE, CeladonCity_GameCorner_EventScript_ClerkNotEnoughMoney
# 62 "data/maps/CeladonCity_GameCorner/scripts.pory"
	addcoins 50
# 63 "data/maps/CeladonCity_GameCorner/scripts.pory"
	removemoney 1000
# 64 "data/maps/CeladonCity_GameCorner/scripts.pory"
	goto CeladonCity_GameCorner_EventScript_BoughtCoins
# 65 "data/maps/CeladonCity_GameCorner/scripts.pory"
	end
# 66 "data/maps/CeladonCity_GameCorner/scripts.pory"

# 67 "data/maps/CeladonCity_GameCorner/scripts.pory"
CeladonCity_GameCorner_EventScript_BoughtCoins::
# 68 "data/maps/CeladonCity_GameCorner/scripts.pory"
	updatemoneybox
# 69 "data/maps/CeladonCity_GameCorner/scripts.pory"
	updatecoinsbox 0, 5
# 70 "data/maps/CeladonCity_GameCorner/scripts.pory"
	playse SE_SHOP
# 71 "data/maps/CeladonCity_GameCorner/scripts.pory"
	msgbox CeladonCity_GameCorner_Text_HereAreYourCoins
# 72 "data/maps/CeladonCity_GameCorner/scripts.pory"
	goto CeladonCity_GameCorner_EventScript_ClerkEnd
# 73 "data/maps/CeladonCity_GameCorner/scripts.pory"
	end
# 74 "data/maps/CeladonCity_GameCorner/scripts.pory"

# 75 "data/maps/CeladonCity_GameCorner/scripts.pory"
CeladonCity_GameCorner_EventScript_ClerkEnd::
# 76 "data/maps/CeladonCity_GameCorner/scripts.pory"
	hidemoneybox
# 77 "data/maps/CeladonCity_GameCorner/scripts.pory"
	hidecoinsbox 0, 5
# 78 "data/maps/CeladonCity_GameCorner/scripts.pory"
	release
# 79 "data/maps/CeladonCity_GameCorner/scripts.pory"
	end
# 80 "data/maps/CeladonCity_GameCorner/scripts.pory"

# 81 "data/maps/CeladonCity_GameCorner/scripts.pory"
CeladonCity_GameCorner_EventScript_ClerkDeclineBuy::
# 82 "data/maps/CeladonCity_GameCorner/scripts.pory"
	msgbox CeladonCity_GameCorner_Text_ComePlaySometime
# 83 "data/maps/CeladonCity_GameCorner/scripts.pory"
	goto CeladonCity_GameCorner_EventScript_ClerkEnd
# 84 "data/maps/CeladonCity_GameCorner/scripts.pory"
	end
# 85 "data/maps/CeladonCity_GameCorner/scripts.pory"

# 86 "data/maps/CeladonCity_GameCorner/scripts.pory"
CeladonCity_GameCorner_EventScript_ClerkNoCoinCase::
# 87 "data/maps/CeladonCity_GameCorner/scripts.pory"
	msgbox CeladonCity_GameCorner_Text_SorryDontHaveCoinCase
# 88 "data/maps/CeladonCity_GameCorner/scripts.pory"
	goto CeladonCity_GameCorner_EventScript_ClerkEnd
# 89 "data/maps/CeladonCity_GameCorner/scripts.pory"
	end
# 90 "data/maps/CeladonCity_GameCorner/scripts.pory"

# 91 "data/maps/CeladonCity_GameCorner/scripts.pory"
CeladonCity_GameCorner_EventScript_ClerkNoRoomForCoins::
# 92 "data/maps/CeladonCity_GameCorner/scripts.pory"
	msgbox CeladonCity_GameCorner_Text_CoinCaseIsFull
# 93 "data/maps/CeladonCity_GameCorner/scripts.pory"
	goto CeladonCity_GameCorner_EventScript_ClerkEnd
# 94 "data/maps/CeladonCity_GameCorner/scripts.pory"
	end
# 95 "data/maps/CeladonCity_GameCorner/scripts.pory"

# 96 "data/maps/CeladonCity_GameCorner/scripts.pory"
CeladonCity_GameCorner_EventScript_ClerkNotEnoughMoney::
# 97 "data/maps/CeladonCity_GameCorner/scripts.pory"
	msgbox CeladonCity_GameCorner_Text_CantAffordCoins
# 98 "data/maps/CeladonCity_GameCorner/scripts.pory"
	goto CeladonCity_GameCorner_EventScript_ClerkEnd
# 99 "data/maps/CeladonCity_GameCorner/scripts.pory"
	end
# 100 "data/maps/CeladonCity_GameCorner/scripts.pory"

# 101 "data/maps/CeladonCity_GameCorner/scripts.pory"
CeladonCity_GameCorner_EventScript_BaldingMan::
# 102 "data/maps/CeladonCity_GameCorner/scripts.pory"
	lock
# 103 "data/maps/CeladonCity_GameCorner/scripts.pory"
	faceplayer
# 104 "data/maps/CeladonCity_GameCorner/scripts.pory"
	msgbox CeladonCity_GameCorner_Text_RumoredTeamRocketRunsThisPlace
# 105 "data/maps/CeladonCity_GameCorner/scripts.pory"
	goto CeladonCity_GameCorner_EventScript_FaceSlotMachine
# 106 "data/maps/CeladonCity_GameCorner/scripts.pory"
	end
# 107 "data/maps/CeladonCity_GameCorner/scripts.pory"

# 108 "data/maps/CeladonCity_GameCorner/scripts.pory"
CeladonCity_GameCorner_EventScript_FaceSlotMachine::
# 109 "data/maps/CeladonCity_GameCorner/scripts.pory"
	closemessage
# 110 "data/maps/CeladonCity_GameCorner/scripts.pory"
	applymovement VAR_LAST_TALKED, Common_Movement_FaceOriginalDirection
# 111 "data/maps/CeladonCity_GameCorner/scripts.pory"
	waitmovement 0
# 112 "data/maps/CeladonCity_GameCorner/scripts.pory"
	release
# 113 "data/maps/CeladonCity_GameCorner/scripts.pory"
	end
# 114 "data/maps/CeladonCity_GameCorner/scripts.pory"

# 115 "data/maps/CeladonCity_GameCorner/scripts.pory"
CeladonCity_GameCorner_EventScript_Woman1::
# 116 "data/maps/CeladonCity_GameCorner/scripts.pory"
	lock
# 117 "data/maps/CeladonCity_GameCorner/scripts.pory"
	faceplayer
# 118 "data/maps/CeladonCity_GameCorner/scripts.pory"
	msgbox CeladonCity_GameCorner_Text_ThinkMachinesHaveDifferentOdds
# 119 "data/maps/CeladonCity_GameCorner/scripts.pory"
	goto CeladonCity_GameCorner_EventScript_FaceSlotMachine
# 120 "data/maps/CeladonCity_GameCorner/scripts.pory"
	end
# 121 "data/maps/CeladonCity_GameCorner/scripts.pory"

# 122 "data/maps/CeladonCity_GameCorner/scripts.pory"
CeladonCity_GameCorner_EventScript_Fisher::
# 123 "data/maps/CeladonCity_GameCorner/scripts.pory"
	lock
# 124 "data/maps/CeladonCity_GameCorner/scripts.pory"
	faceplayer
# 125 "data/maps/CeladonCity_GameCorner/scripts.pory"
	goto_if_set FLAG_GOT_10_COINS_FROM_GAMBLER, CeladonCity_GameCorner_EventScript_FisherAlreadyGotCoins
# 126 "data/maps/CeladonCity_GameCorner/scripts.pory"
	msgbox CeladonCity_GameCorner_Text_DoYouWantToPlay
# 127 "data/maps/CeladonCity_GameCorner/scripts.pory"
	goto_if_unset FLAG_GOT_COIN_CASE, CeladonCity_GameCorner_EventScript_GamblerNoCoinCase
# 128 "data/maps/CeladonCity_GameCorner/scripts.pory"
	checkcoins VAR_TEMP_1
# 129 "data/maps/CeladonCity_GameCorner/scripts.pory"
	goto_if_ge VAR_TEMP_1, (MAX_COINS + 1) - 10, CeladonCity_GameCorner_EventScript_FisherNoRoomForCoins
# 130 "data/maps/CeladonCity_GameCorner/scripts.pory"
	addcoins 10
# 131 "data/maps/CeladonCity_GameCorner/scripts.pory"
	textcolor NPC_TEXT_COLOR_NEUTRAL
# 132 "data/maps/CeladonCity_GameCorner/scripts.pory"
	msgbox CeladonCity_GameCorner_Text_Received10CoinsFromMan
# 133 "data/maps/CeladonCity_GameCorner/scripts.pory"
	playse SE_SHOP
# 134 "data/maps/CeladonCity_GameCorner/scripts.pory"
	waitse
# 135 "data/maps/CeladonCity_GameCorner/scripts.pory"
	setflag FLAG_GOT_10_COINS_FROM_GAMBLER
# 136 "data/maps/CeladonCity_GameCorner/scripts.pory"
	goto CeladonCity_GameCorner_EventScript_FaceSlotMachine
# 137 "data/maps/CeladonCity_GameCorner/scripts.pory"
	end
# 138 "data/maps/CeladonCity_GameCorner/scripts.pory"

# 139 "data/maps/CeladonCity_GameCorner/scripts.pory"
CeladonCity_GameCorner_EventScript_FisherNoRoomForCoins::
# 140 "data/maps/CeladonCity_GameCorner/scripts.pory"
	msgbox CeladonCity_GameCorner_Text_DontNeedMyCoins
# 141 "data/maps/CeladonCity_GameCorner/scripts.pory"
	goto CeladonCity_GameCorner_EventScript_FaceSlotMachine
# 142 "data/maps/CeladonCity_GameCorner/scripts.pory"
	end
# 143 "data/maps/CeladonCity_GameCorner/scripts.pory"

# 144 "data/maps/CeladonCity_GameCorner/scripts.pory"
CeladonCity_GameCorner_EventScript_GamblerNoCoinCase::
# 145 "data/maps/CeladonCity_GameCorner/scripts.pory"
	textcolor NPC_TEXT_COLOR_NEUTRAL
# 146 "data/maps/CeladonCity_GameCorner/scripts.pory"
	msgbox CeladonCity_GameCorner_Text_DontHaveCoinCase
# 147 "data/maps/CeladonCity_GameCorner/scripts.pory"
	goto CeladonCity_GameCorner_EventScript_FaceSlotMachine
# 148 "data/maps/CeladonCity_GameCorner/scripts.pory"
	end
# 149 "data/maps/CeladonCity_GameCorner/scripts.pory"

# 150 "data/maps/CeladonCity_GameCorner/scripts.pory"
CeladonCity_GameCorner_EventScript_FisherAlreadyGotCoins::
# 151 "data/maps/CeladonCity_GameCorner/scripts.pory"
	msgbox CeladonCity_GameCorner_Text_WinsComeAndGo
# 152 "data/maps/CeladonCity_GameCorner/scripts.pory"
	goto CeladonCity_GameCorner_EventScript_FaceSlotMachine
# 153 "data/maps/CeladonCity_GameCorner/scripts.pory"
	end
# 154 "data/maps/CeladonCity_GameCorner/scripts.pory"

# 155 "data/maps/CeladonCity_GameCorner/scripts.pory"
CeladonCity_GameCorner_EventScript_GymGuy::
# 156 "data/maps/CeladonCity_GameCorner/scripts.pory"
	lock
# 157 "data/maps/CeladonCity_GameCorner/scripts.pory"
	faceplayer
# 158 "data/maps/CeladonCity_GameCorner/scripts.pory"
	goto_if_set FLAG_DEFEATED_ERIKA, CeladonCity_GameCorner_EventScript_GymGuyPostVictory
# 159 "data/maps/CeladonCity_GameCorner/scripts.pory"
	msgbox CeladonCity_GameCorner_Text_GymGuyAdvice
# 160 "data/maps/CeladonCity_GameCorner/scripts.pory"
	goto CeladonCity_GameCorner_EventScript_FaceSlotMachine
# 161 "data/maps/CeladonCity_GameCorner/scripts.pory"
	end
# 162 "data/maps/CeladonCity_GameCorner/scripts.pory"

# 163 "data/maps/CeladonCity_GameCorner/scripts.pory"
CeladonCity_GameCorner_EventScript_GymGuyPostVictory::
# 164 "data/maps/CeladonCity_GameCorner/scripts.pory"
	msgbox CeladonCity_GameCorner_Text_RareMonsForCoins
# 165 "data/maps/CeladonCity_GameCorner/scripts.pory"
	goto CeladonCity_GameCorner_EventScript_FaceSlotMachine
# 166 "data/maps/CeladonCity_GameCorner/scripts.pory"
	end
# 167 "data/maps/CeladonCity_GameCorner/scripts.pory"

# 168 "data/maps/CeladonCity_GameCorner/scripts.pory"
CeladonCity_GameCorner_EventScript_Woman2::
# 169 "data/maps/CeladonCity_GameCorner/scripts.pory"
	lock
# 170 "data/maps/CeladonCity_GameCorner/scripts.pory"
	faceplayer
# 171 "data/maps/CeladonCity_GameCorner/scripts.pory"
	msgbox CeladonCity_GameCorner_Text_WinOrLoseItsOnlyLuck
# 172 "data/maps/CeladonCity_GameCorner/scripts.pory"
	goto CeladonCity_GameCorner_EventScript_FaceSlotMachine
# 173 "data/maps/CeladonCity_GameCorner/scripts.pory"
	end
# 174 "data/maps/CeladonCity_GameCorner/scripts.pory"

# 175 "data/maps/CeladonCity_GameCorner/scripts.pory"
CeladonCity_GameCorner_EventScript_OldMan::
# 176 "data/maps/CeladonCity_GameCorner/scripts.pory"
	lock
# 177 "data/maps/CeladonCity_GameCorner/scripts.pory"
	faceplayer
# 178 "data/maps/CeladonCity_GameCorner/scripts.pory"
	msgbox CeladonCity_GameCorner_Text_SoEasyToGetHooked
# 179 "data/maps/CeladonCity_GameCorner/scripts.pory"
	goto CeladonCity_GameCorner_EventScript_FaceSlotMachine
# 180 "data/maps/CeladonCity_GameCorner/scripts.pory"
	end
# 181 "data/maps/CeladonCity_GameCorner/scripts.pory"

# 182 "data/maps/CeladonCity_GameCorner/scripts.pory"
CeladonCity_GameCorner_EventScript_Scientist::
# 183 "data/maps/CeladonCity_GameCorner/scripts.pory"
	lock
# 184 "data/maps/CeladonCity_GameCorner/scripts.pory"
	faceplayer
# 185 "data/maps/CeladonCity_GameCorner/scripts.pory"
	goto_if_set FLAG_GOT_20_COINS_FROM_GAMBLER, CeladonCity_GameCorner_EventScript_ScientistAlreadyGotCoins
# 186 "data/maps/CeladonCity_GameCorner/scripts.pory"
	msgbox CeladonCity_GameCorner_Text_WantSomeCoins
# 187 "data/maps/CeladonCity_GameCorner/scripts.pory"
	goto_if_unset FLAG_GOT_COIN_CASE, CeladonCity_GameCorner_EventScript_GamblerNoCoinCase
# 188 "data/maps/CeladonCity_GameCorner/scripts.pory"
	checkcoins VAR_TEMP_1
# 189 "data/maps/CeladonCity_GameCorner/scripts.pory"
	goto_if_ge VAR_TEMP_1, (MAX_COINS + 1) - 20, CeladonCity_GameCorner_EventScript_ScientistNoRoomForCoins
# 190 "data/maps/CeladonCity_GameCorner/scripts.pory"
	addcoins 20
# 191 "data/maps/CeladonCity_GameCorner/scripts.pory"
	textcolor NPC_TEXT_COLOR_NEUTRAL
# 192 "data/maps/CeladonCity_GameCorner/scripts.pory"
	msgbox CeladonCity_GameCorner_Text_Received20CoinsFromNiceGuy
# 193 "data/maps/CeladonCity_GameCorner/scripts.pory"
	playse SE_SHOP
# 194 "data/maps/CeladonCity_GameCorner/scripts.pory"
	waitse
# 195 "data/maps/CeladonCity_GameCorner/scripts.pory"
	setflag FLAG_GOT_20_COINS_FROM_GAMBLER
# 196 "data/maps/CeladonCity_GameCorner/scripts.pory"
	goto CeladonCity_GameCorner_EventScript_FaceSlotMachine
# 197 "data/maps/CeladonCity_GameCorner/scripts.pory"
	end
# 198 "data/maps/CeladonCity_GameCorner/scripts.pory"

# 199 "data/maps/CeladonCity_GameCorner/scripts.pory"
CeladonCity_GameCorner_EventScript_ScientistNoRoomForCoins::
# 200 "data/maps/CeladonCity_GameCorner/scripts.pory"
	msgbox CeladonCity_GameCorner_Text_YouHaveLotsOfCoins
# 201 "data/maps/CeladonCity_GameCorner/scripts.pory"
	goto CeladonCity_GameCorner_EventScript_FaceSlotMachine
# 202 "data/maps/CeladonCity_GameCorner/scripts.pory"
	end
# 203 "data/maps/CeladonCity_GameCorner/scripts.pory"

# 204 "data/maps/CeladonCity_GameCorner/scripts.pory"
CeladonCity_GameCorner_EventScript_ScientistAlreadyGotCoins::
# 205 "data/maps/CeladonCity_GameCorner/scripts.pory"
	msgbox CeladonCity_GameCorner_Text_NeedMoreCoinsForMonIWant
# 206 "data/maps/CeladonCity_GameCorner/scripts.pory"
	goto CeladonCity_GameCorner_EventScript_FaceSlotMachine
# 207 "data/maps/CeladonCity_GameCorner/scripts.pory"
	end
# 208 "data/maps/CeladonCity_GameCorner/scripts.pory"

# 209 "data/maps/CeladonCity_GameCorner/scripts.pory"
CeladonCity_GameCorner_EventScript_Gentleman::
# 210 "data/maps/CeladonCity_GameCorner/scripts.pory"
	lock
# 211 "data/maps/CeladonCity_GameCorner/scripts.pory"
	faceplayer
# 212 "data/maps/CeladonCity_GameCorner/scripts.pory"
	goto_if_set FLAG_GOT_20_COINS_FROM_GAMBLER_2, CeladonCity_GameCorner_EventScript_GentlemanAlreadyGotCoins
# 213 "data/maps/CeladonCity_GameCorner/scripts.pory"
	msgbox CeladonCity_GameCorner_Text_HereAreSomeCoinsShoo
# 214 "data/maps/CeladonCity_GameCorner/scripts.pory"
	goto_if_unset FLAG_GOT_COIN_CASE, CeladonCity_GameCorner_EventScript_GamblerNoCoinCase
# 215 "data/maps/CeladonCity_GameCorner/scripts.pory"
	checkcoins VAR_TEMP_1
# 216 "data/maps/CeladonCity_GameCorner/scripts.pory"
	goto_if_ge VAR_TEMP_1, (MAX_COINS + 1) - 20, CeladonCity_GameCorner_EventScript_GentlemanNoRoomForCoins
# 217 "data/maps/CeladonCity_GameCorner/scripts.pory"
	addcoins 20
# 218 "data/maps/CeladonCity_GameCorner/scripts.pory"
	textcolor NPC_TEXT_COLOR_NEUTRAL
# 219 "data/maps/CeladonCity_GameCorner/scripts.pory"
	msgbox CeladonCity_GameCorner_Text_Received20CoinsFromMan
# 220 "data/maps/CeladonCity_GameCorner/scripts.pory"
	playse SE_SHOP
# 221 "data/maps/CeladonCity_GameCorner/scripts.pory"
	waitse
# 222 "data/maps/CeladonCity_GameCorner/scripts.pory"
	setflag FLAG_GOT_20_COINS_FROM_GAMBLER_2
# 223 "data/maps/CeladonCity_GameCorner/scripts.pory"
	goto CeladonCity_GameCorner_EventScript_FaceSlotMachine
# 224 "data/maps/CeladonCity_GameCorner/scripts.pory"
	end
# 225 "data/maps/CeladonCity_GameCorner/scripts.pory"

# 226 "data/maps/CeladonCity_GameCorner/scripts.pory"
CeladonCity_GameCorner_EventScript_GentlemanNoRoomForCoins::
# 227 "data/maps/CeladonCity_GameCorner/scripts.pory"
	msgbox CeladonCity_GameCorner_Text_YouveGotPlentyCoins
# 228 "data/maps/CeladonCity_GameCorner/scripts.pory"
	goto CeladonCity_GameCorner_EventScript_FaceSlotMachine
# 229 "data/maps/CeladonCity_GameCorner/scripts.pory"
	end
# 230 "data/maps/CeladonCity_GameCorner/scripts.pory"

# 231 "data/maps/CeladonCity_GameCorner/scripts.pory"
CeladonCity_GameCorner_EventScript_GentlemanAlreadyGotCoins::
# 232 "data/maps/CeladonCity_GameCorner/scripts.pory"
	msgbox CeladonCity_GameCorner_Text_WatchReelsClosely
# 233 "data/maps/CeladonCity_GameCorner/scripts.pory"
	goto CeladonCity_GameCorner_EventScript_FaceSlotMachine
# 234 "data/maps/CeladonCity_GameCorner/scripts.pory"
	end
# 235 "data/maps/CeladonCity_GameCorner/scripts.pory"

# 236 "data/maps/CeladonCity_GameCorner/scripts.pory"
CeladonCity_GameCorner_EventScript_SlotMachine0::
# 237 "data/maps/CeladonCity_GameCorner/scripts.pory"
	lockall
# 238 "data/maps/CeladonCity_GameCorner/scripts.pory"
	setvar VAR_0x8004, 0
# 239 "data/maps/CeladonCity_GameCorner/scripts.pory"
	goto CeladonCity_GameCorner_EventScript_SlotMachine
# 240 "data/maps/CeladonCity_GameCorner/scripts.pory"
	end
# 241 "data/maps/CeladonCity_GameCorner/scripts.pory"

# 242 "data/maps/CeladonCity_GameCorner/scripts.pory"
CeladonCity_GameCorner_EventScript_DontPlaySlotMachine::
# 243 "data/maps/CeladonCity_GameCorner/scripts.pory"
	releaseall
# 244 "data/maps/CeladonCity_GameCorner/scripts.pory"
	end
# 245 "data/maps/CeladonCity_GameCorner/scripts.pory"

# 246 "data/maps/CeladonCity_GameCorner/scripts.pory"
CeladonCity_GameCorner_EventScript_SlotMachine::
# 247 "data/maps/CeladonCity_GameCorner/scripts.pory"
	goto_if_unset FLAG_GOT_COIN_CASE, CeladonCity_GameCorner_EventScript_SlotMachineNoCoinCase
# 248 "data/maps/CeladonCity_GameCorner/scripts.pory"
	msgbox CeladonCity_GameCorner_Text_SlotMachineWantToPlay, MSGBOX_YESNO
# 249 "data/maps/CeladonCity_GameCorner/scripts.pory"
	goto_if_eq VAR_RESULT, NO, CeladonCity_GameCorner_EventScript_DontPlaySlotMachine
# 250 "data/maps/CeladonCity_GameCorner/scripts.pory"
	setfieldeffectargument 0, OBJ_EVENT_ID_PLAYER
# 251 "data/maps/CeladonCity_GameCorner/scripts.pory"
.ifdef BUGFIX
# 252 "data/maps/CeladonCity_GameCorner/scripts.pory"
	setfieldeffectargument 1, MAP_NUM(CELADON_CITY_GAME_CORNER)
# 253 "data/maps/CeladonCity_GameCorner/scripts.pory"
	setfieldeffectargument 2, MAP_GROUP(CELADON_CITY_GAME_CORNER)
# 254 "data/maps/CeladonCity_GameCorner/scripts.pory"
.else
# 255 "data/maps/CeladonCity_GameCorner/scripts.pory"
	@ Map num/group were provided in the wrong order
# 256 "data/maps/CeladonCity_GameCorner/scripts.pory"
	setfieldeffectargument 1, MAP_GROUP(CELADON_CITY_GAME_CORNER)
# 257 "data/maps/CeladonCity_GameCorner/scripts.pory"
	setfieldeffectargument 2, MAP_NUM(CELADON_CITY_GAME_CORNER)
# 258 "data/maps/CeladonCity_GameCorner/scripts.pory"
.endif
# 259 "data/maps/CeladonCity_GameCorner/scripts.pory"
	dofieldeffect FLDEFF_SMILEY_FACE_ICON
# 260 "data/maps/CeladonCity_GameCorner/scripts.pory"
	waitfieldeffect FLDEFF_SMILEY_FACE_ICON
# 261 "data/maps/CeladonCity_GameCorner/scripts.pory"
	specialvar VAR_RESULT, GetRandomSlotMachineId
# 262 "data/maps/CeladonCity_GameCorner/scripts.pory"
	playslotmachine VAR_RESULT
# 263 "data/maps/CeladonCity_GameCorner/scripts.pory"
	releaseall
# 264 "data/maps/CeladonCity_GameCorner/scripts.pory"
	end
# 265 "data/maps/CeladonCity_GameCorner/scripts.pory"

# 266 "data/maps/CeladonCity_GameCorner/scripts.pory"
CeladonCity_GameCorner_EventScript_SlotMachine1::
# 267 "data/maps/CeladonCity_GameCorner/scripts.pory"
	lockall
# 268 "data/maps/CeladonCity_GameCorner/scripts.pory"
	setvar VAR_0x8004, 1
# 269 "data/maps/CeladonCity_GameCorner/scripts.pory"
	goto CeladonCity_GameCorner_EventScript_SlotMachine
# 270 "data/maps/CeladonCity_GameCorner/scripts.pory"
	end
# 271 "data/maps/CeladonCity_GameCorner/scripts.pory"

# 272 "data/maps/CeladonCity_GameCorner/scripts.pory"
CeladonCity_GameCorner_EventScript_SlotMachine2::
# 273 "data/maps/CeladonCity_GameCorner/scripts.pory"
	lockall
# 274 "data/maps/CeladonCity_GameCorner/scripts.pory"
	setvar VAR_0x8004, 2
# 275 "data/maps/CeladonCity_GameCorner/scripts.pory"
	goto CeladonCity_GameCorner_EventScript_SlotMachine
# 276 "data/maps/CeladonCity_GameCorner/scripts.pory"
	end
# 277 "data/maps/CeladonCity_GameCorner/scripts.pory"

# 278 "data/maps/CeladonCity_GameCorner/scripts.pory"
CeladonCity_GameCorner_EventScript_SlotMachine3::
# 279 "data/maps/CeladonCity_GameCorner/scripts.pory"
	lockall
# 280 "data/maps/CeladonCity_GameCorner/scripts.pory"
	setvar VAR_0x8004, 3
# 281 "data/maps/CeladonCity_GameCorner/scripts.pory"
	goto CeladonCity_GameCorner_EventScript_SlotMachine
# 282 "data/maps/CeladonCity_GameCorner/scripts.pory"
	end
# 283 "data/maps/CeladonCity_GameCorner/scripts.pory"

# 284 "data/maps/CeladonCity_GameCorner/scripts.pory"
CeladonCity_GameCorner_EventScript_SlotMachine4::
# 285 "data/maps/CeladonCity_GameCorner/scripts.pory"
	lockall
# 286 "data/maps/CeladonCity_GameCorner/scripts.pory"
	setvar VAR_0x8004, 4
# 287 "data/maps/CeladonCity_GameCorner/scripts.pory"
	goto CeladonCity_GameCorner_EventScript_SlotMachine
# 288 "data/maps/CeladonCity_GameCorner/scripts.pory"
	end
# 289 "data/maps/CeladonCity_GameCorner/scripts.pory"

# 290 "data/maps/CeladonCity_GameCorner/scripts.pory"
CeladonCity_GameCorner_EventScript_SlotMachine5::
# 291 "data/maps/CeladonCity_GameCorner/scripts.pory"
	lockall
# 292 "data/maps/CeladonCity_GameCorner/scripts.pory"
	setvar VAR_0x8004, 5
# 293 "data/maps/CeladonCity_GameCorner/scripts.pory"
	goto CeladonCity_GameCorner_EventScript_SlotMachine
# 294 "data/maps/CeladonCity_GameCorner/scripts.pory"
	end
# 295 "data/maps/CeladonCity_GameCorner/scripts.pory"

# 296 "data/maps/CeladonCity_GameCorner/scripts.pory"
CeladonCity_GameCorner_EventScript_SlotMachine6::
# 297 "data/maps/CeladonCity_GameCorner/scripts.pory"
	lockall
# 298 "data/maps/CeladonCity_GameCorner/scripts.pory"
	setvar VAR_0x8004, 6
# 299 "data/maps/CeladonCity_GameCorner/scripts.pory"
	goto CeladonCity_GameCorner_EventScript_SlotMachine
# 300 "data/maps/CeladonCity_GameCorner/scripts.pory"
	end
# 301 "data/maps/CeladonCity_GameCorner/scripts.pory"

# 302 "data/maps/CeladonCity_GameCorner/scripts.pory"
CeladonCity_GameCorner_EventScript_SlotMachine7::
# 303 "data/maps/CeladonCity_GameCorner/scripts.pory"
	lockall
# 304 "data/maps/CeladonCity_GameCorner/scripts.pory"
	setvar VAR_0x8004, 7
# 305 "data/maps/CeladonCity_GameCorner/scripts.pory"
	goto CeladonCity_GameCorner_EventScript_SlotMachine
# 306 "data/maps/CeladonCity_GameCorner/scripts.pory"
	end
# 307 "data/maps/CeladonCity_GameCorner/scripts.pory"

# 308 "data/maps/CeladonCity_GameCorner/scripts.pory"
CeladonCity_GameCorner_EventScript_SlotMachine8::
# 309 "data/maps/CeladonCity_GameCorner/scripts.pory"
	lockall
# 310 "data/maps/CeladonCity_GameCorner/scripts.pory"
	setvar VAR_0x8004, 8
# 311 "data/maps/CeladonCity_GameCorner/scripts.pory"
	goto CeladonCity_GameCorner_EventScript_SlotMachine
# 312 "data/maps/CeladonCity_GameCorner/scripts.pory"
	end
# 313 "data/maps/CeladonCity_GameCorner/scripts.pory"

# 314 "data/maps/CeladonCity_GameCorner/scripts.pory"
CeladonCity_GameCorner_EventScript_SlotMachine9::
# 315 "data/maps/CeladonCity_GameCorner/scripts.pory"
	lockall
# 316 "data/maps/CeladonCity_GameCorner/scripts.pory"
	setvar VAR_0x8004, 9
# 317 "data/maps/CeladonCity_GameCorner/scripts.pory"
	goto CeladonCity_GameCorner_EventScript_SlotMachine
# 318 "data/maps/CeladonCity_GameCorner/scripts.pory"
	end
# 319 "data/maps/CeladonCity_GameCorner/scripts.pory"

# 320 "data/maps/CeladonCity_GameCorner/scripts.pory"
CeladonCity_GameCorner_EventScript_SlotMachine10::
# 321 "data/maps/CeladonCity_GameCorner/scripts.pory"
	lockall
# 322 "data/maps/CeladonCity_GameCorner/scripts.pory"
	setvar VAR_0x8004, 10
# 323 "data/maps/CeladonCity_GameCorner/scripts.pory"
	goto CeladonCity_GameCorner_EventScript_SlotMachine
# 324 "data/maps/CeladonCity_GameCorner/scripts.pory"
	end
# 325 "data/maps/CeladonCity_GameCorner/scripts.pory"

# 326 "data/maps/CeladonCity_GameCorner/scripts.pory"
CeladonCity_GameCorner_EventScript_SlotMachine11::
# 327 "data/maps/CeladonCity_GameCorner/scripts.pory"
	lockall
# 328 "data/maps/CeladonCity_GameCorner/scripts.pory"
	setvar VAR_0x8004, 11
# 329 "data/maps/CeladonCity_GameCorner/scripts.pory"
	goto CeladonCity_GameCorner_EventScript_SlotMachine
# 330 "data/maps/CeladonCity_GameCorner/scripts.pory"
	end
# 331 "data/maps/CeladonCity_GameCorner/scripts.pory"

# 332 "data/maps/CeladonCity_GameCorner/scripts.pory"
CeladonCity_GameCorner_EventScript_SlotMachine12::
# 333 "data/maps/CeladonCity_GameCorner/scripts.pory"
	lockall
# 334 "data/maps/CeladonCity_GameCorner/scripts.pory"
	setvar VAR_0x8004, 12
# 335 "data/maps/CeladonCity_GameCorner/scripts.pory"
	goto CeladonCity_GameCorner_EventScript_SlotMachine
# 336 "data/maps/CeladonCity_GameCorner/scripts.pory"
	end
# 337 "data/maps/CeladonCity_GameCorner/scripts.pory"

# 338 "data/maps/CeladonCity_GameCorner/scripts.pory"
CeladonCity_GameCorner_EventScript_SlotMachine13::
# 339 "data/maps/CeladonCity_GameCorner/scripts.pory"
	lockall
# 340 "data/maps/CeladonCity_GameCorner/scripts.pory"
	setvar VAR_0x8004, 13
# 341 "data/maps/CeladonCity_GameCorner/scripts.pory"
	goto CeladonCity_GameCorner_EventScript_SlotMachine
# 342 "data/maps/CeladonCity_GameCorner/scripts.pory"
	end
# 343 "data/maps/CeladonCity_GameCorner/scripts.pory"

# 344 "data/maps/CeladonCity_GameCorner/scripts.pory"
CeladonCity_GameCorner_EventScript_SlotMachine14::
# 345 "data/maps/CeladonCity_GameCorner/scripts.pory"
	lockall
# 346 "data/maps/CeladonCity_GameCorner/scripts.pory"
	setvar VAR_0x8004, 14
# 347 "data/maps/CeladonCity_GameCorner/scripts.pory"
	goto CeladonCity_GameCorner_EventScript_SlotMachine
# 348 "data/maps/CeladonCity_GameCorner/scripts.pory"
	end
# 349 "data/maps/CeladonCity_GameCorner/scripts.pory"

# 350 "data/maps/CeladonCity_GameCorner/scripts.pory"
CeladonCity_GameCorner_EventScript_SlotMachine15::
# 351 "data/maps/CeladonCity_GameCorner/scripts.pory"
	lockall
# 352 "data/maps/CeladonCity_GameCorner/scripts.pory"
	setvar VAR_0x8004, 15
# 353 "data/maps/CeladonCity_GameCorner/scripts.pory"
	goto CeladonCity_GameCorner_EventScript_SlotMachine
# 354 "data/maps/CeladonCity_GameCorner/scripts.pory"
	end
# 355 "data/maps/CeladonCity_GameCorner/scripts.pory"

# 356 "data/maps/CeladonCity_GameCorner/scripts.pory"
CeladonCity_GameCorner_EventScript_SlotMachine16::
# 357 "data/maps/CeladonCity_GameCorner/scripts.pory"
	lockall
# 358 "data/maps/CeladonCity_GameCorner/scripts.pory"
	setvar VAR_0x8004, 16
# 359 "data/maps/CeladonCity_GameCorner/scripts.pory"
	goto CeladonCity_GameCorner_EventScript_SlotMachine
# 360 "data/maps/CeladonCity_GameCorner/scripts.pory"
	end
# 361 "data/maps/CeladonCity_GameCorner/scripts.pory"

# 362 "data/maps/CeladonCity_GameCorner/scripts.pory"
CeladonCity_GameCorner_EventScript_SlotMachine17::
# 363 "data/maps/CeladonCity_GameCorner/scripts.pory"
	lockall
# 364 "data/maps/CeladonCity_GameCorner/scripts.pory"
	setvar VAR_0x8004, 17
# 365 "data/maps/CeladonCity_GameCorner/scripts.pory"
	goto CeladonCity_GameCorner_EventScript_SlotMachine
# 366 "data/maps/CeladonCity_GameCorner/scripts.pory"
	end
# 367 "data/maps/CeladonCity_GameCorner/scripts.pory"

# 368 "data/maps/CeladonCity_GameCorner/scripts.pory"
CeladonCity_GameCorner_EventScript_SlotMachine18::
# 369 "data/maps/CeladonCity_GameCorner/scripts.pory"
	lockall
# 370 "data/maps/CeladonCity_GameCorner/scripts.pory"
	setvar VAR_0x8004, 18
# 371 "data/maps/CeladonCity_GameCorner/scripts.pory"
	goto CeladonCity_GameCorner_EventScript_SlotMachine
# 372 "data/maps/CeladonCity_GameCorner/scripts.pory"
	end
# 373 "data/maps/CeladonCity_GameCorner/scripts.pory"

# 374 "data/maps/CeladonCity_GameCorner/scripts.pory"
CeladonCity_GameCorner_EventScript_SlotMachine19::
# 375 "data/maps/CeladonCity_GameCorner/scripts.pory"
	lockall
# 376 "data/maps/CeladonCity_GameCorner/scripts.pory"
	setvar VAR_0x8004, 19
# 377 "data/maps/CeladonCity_GameCorner/scripts.pory"
	goto CeladonCity_GameCorner_EventScript_SlotMachine
# 378 "data/maps/CeladonCity_GameCorner/scripts.pory"
	end
# 379 "data/maps/CeladonCity_GameCorner/scripts.pory"

# 380 "data/maps/CeladonCity_GameCorner/scripts.pory"
CeladonCity_GameCorner_EventScript_SlotMachine20::
# 381 "data/maps/CeladonCity_GameCorner/scripts.pory"
	lockall
# 382 "data/maps/CeladonCity_GameCorner/scripts.pory"
	setvar VAR_0x8004, 20
# 383 "data/maps/CeladonCity_GameCorner/scripts.pory"
	goto CeladonCity_GameCorner_EventScript_SlotMachine
# 384 "data/maps/CeladonCity_GameCorner/scripts.pory"
	end
# 385 "data/maps/CeladonCity_GameCorner/scripts.pory"

# 386 "data/maps/CeladonCity_GameCorner/scripts.pory"
CeladonCity_GameCorner_EventScript_SlotMachine21::
# 387 "data/maps/CeladonCity_GameCorner/scripts.pory"
	lockall
# 388 "data/maps/CeladonCity_GameCorner/scripts.pory"
	setvar VAR_0x8004, 21
# 389 "data/maps/CeladonCity_GameCorner/scripts.pory"
	goto CeladonCity_GameCorner_EventScript_SlotMachine
# 390 "data/maps/CeladonCity_GameCorner/scripts.pory"
	end
# 391 "data/maps/CeladonCity_GameCorner/scripts.pory"

# 392 "data/maps/CeladonCity_GameCorner/scripts.pory"
CeladonCity_GameCorner_EventScript_SlotMachineNoCoinCase::
# 393 "data/maps/CeladonCity_GameCorner/scripts.pory"
	msgbox CeladonCity_GameCorner_Text_CoinCaseIsRequired
# 394 "data/maps/CeladonCity_GameCorner/scripts.pory"
	releaseall
# 395 "data/maps/CeladonCity_GameCorner/scripts.pory"
	end
# 396 "data/maps/CeladonCity_GameCorner/scripts.pory"

# 397 "data/maps/CeladonCity_GameCorner/scripts.pory"
CeladonCity_GameCorner_EventScript_Poster::
# 398 "data/maps/CeladonCity_GameCorner/scripts.pory"
	lockall
# 399 "data/maps/CeladonCity_GameCorner/scripts.pory"
	msgbox CeladonCity_GameCorner_Text_SwitchBehindPosterPushIt
# 400 "data/maps/CeladonCity_GameCorner/scripts.pory"
	call_if_unset FLAG_OPENED_ROCKET_HIDEOUT, CeladonCity_GameCorner_EventScript_OpenRocketHideout
# 401 "data/maps/CeladonCity_GameCorner/scripts.pory"
	releaseall
# 402 "data/maps/CeladonCity_GameCorner/scripts.pory"
	end
# 403 "data/maps/CeladonCity_GameCorner/scripts.pory"

# 404 "data/maps/CeladonCity_GameCorner/scripts.pory"
CeladonCity_GameCorner_EventScript_OpenRocketHideout::
# 405 "data/maps/CeladonCity_GameCorner/scripts.pory"
	playse SE_UNLOCK
# 406 "data/maps/CeladonCity_GameCorner/scripts.pory"
	setmetatile 15, 2, METATILE_GameCorner_Floor_StairsTop, 0
# 407 "data/maps/CeladonCity_GameCorner/scripts.pory"
	setmetatile 16, 2, METATILE_GameCorner_StairsTop, 1
# 408 "data/maps/CeladonCity_GameCorner/scripts.pory"
	setmetatile 17, 2, METATILE_GameCorner_StairsBottom, 1
# 409 "data/maps/CeladonCity_GameCorner/scripts.pory"
	setmetatile 16, 3, METATILE_GameCorner_PurpleWall_StairsTop, 1
# 410 "data/maps/CeladonCity_GameCorner/scripts.pory"
	setmetatile 17, 3, METATILE_GameCorner_PurpleWall_stairsBottom, 1
# 411 "data/maps/CeladonCity_GameCorner/scripts.pory"
	special DrawWholeMapView
# 412 "data/maps/CeladonCity_GameCorner/scripts.pory"
	setflag FLAG_OPENED_ROCKET_HIDEOUT
# 413 "data/maps/CeladonCity_GameCorner/scripts.pory"
	return
# 414 "data/maps/CeladonCity_GameCorner/scripts.pory"

# 415 "data/maps/CeladonCity_GameCorner/scripts.pory"
CeladonCity_GameCorner_EventScript_RocketGrunt::
# 416 "data/maps/CeladonCity_GameCorner/scripts.pory"
	trainerbattle_single TRAINER_TEAM_ROCKET_GRUNT_7, CeladonCity_GameCorner_Text_GruntIntro, CeladonCity_GameCorner_Text_GruntDefeat, CeladonCity_GameCorner_Text_DefeatedGrunt
# 417 "data/maps/CeladonCity_GameCorner/scripts.pory"
	msgbox CeladonCity_GameCorner_Text_GruntPostBattle, MSGBOX_AUTOCLOSE
# 418 "data/maps/CeladonCity_GameCorner/scripts.pory"
	end
# 419 "data/maps/CeladonCity_GameCorner/scripts.pory"

# 420 "data/maps/CeladonCity_GameCorner/scripts.pory"
CeladonCity_GameCorner_Text_DefeatedGrunt::
# 421 "data/maps/CeladonCity_GameCorner/scripts.pory"
	msgbox CeladonCity_GameCorner_Text_GruntPostBattle
# 422 "data/maps/CeladonCity_GameCorner/scripts.pory"
	closemessage
# 423 "data/maps/CeladonCity_GameCorner/scripts.pory"
	call_if_eq VAR_FACING, DIR_WEST, CeladonCity_GameCorner_Text_GruntExitWest
# 424 "data/maps/CeladonCity_GameCorner/scripts.pory"
	call_if_ne VAR_FACING, DIR_WEST, CeladonCity_GameCorner_Text_GruntExit
# 425 "data/maps/CeladonCity_GameCorner/scripts.pory"
	removeobject LOCALID_GRUNT
# 426 "data/maps/CeladonCity_GameCorner/scripts.pory"
	release
# 427 "data/maps/CeladonCity_GameCorner/scripts.pory"
	end
# 428 "data/maps/CeladonCity_GameCorner/scripts.pory"

# 429 "data/maps/CeladonCity_GameCorner/scripts.pory"
CeladonCity_GameCorner_Text_GruntExitWest::
# 430 "data/maps/CeladonCity_GameCorner/scripts.pory"
	applymovement LOCALID_GRUNT, CeladonCity_GameCorner_Movement_GruntExitWest
# 431 "data/maps/CeladonCity_GameCorner/scripts.pory"
	waitmovement 0
# 432 "data/maps/CeladonCity_GameCorner/scripts.pory"
	return
# 433 "data/maps/CeladonCity_GameCorner/scripts.pory"

# 434 "data/maps/CeladonCity_GameCorner/scripts.pory"
CeladonCity_GameCorner_Text_GruntExit::
# 435 "data/maps/CeladonCity_GameCorner/scripts.pory"
	applymovement LOCALID_GRUNT, CeladonCity_GameCorner_Movement_GruntExit
# 436 "data/maps/CeladonCity_GameCorner/scripts.pory"
	waitmovement 0
# 437 "data/maps/CeladonCity_GameCorner/scripts.pory"
	return
# 438 "data/maps/CeladonCity_GameCorner/scripts.pory"

# 439 "data/maps/CeladonCity_GameCorner/scripts.pory"
CeladonCity_GameCorner_Movement_GruntExitWest::
# 440 "data/maps/CeladonCity_GameCorner/scripts.pory"
	walk_down
# 441 "data/maps/CeladonCity_GameCorner/scripts.pory"
	walk_right
# 442 "data/maps/CeladonCity_GameCorner/scripts.pory"
	walk_right
# 443 "data/maps/CeladonCity_GameCorner/scripts.pory"
	walk_up
# 444 "data/maps/CeladonCity_GameCorner/scripts.pory"
	walk_right
# 445 "data/maps/CeladonCity_GameCorner/scripts.pory"
	walk_right
# 446 "data/maps/CeladonCity_GameCorner/scripts.pory"
	walk_right
# 447 "data/maps/CeladonCity_GameCorner/scripts.pory"
	walk_right
# 448 "data/maps/CeladonCity_GameCorner/scripts.pory"
	step_end
# 449 "data/maps/CeladonCity_GameCorner/scripts.pory"

# 450 "data/maps/CeladonCity_GameCorner/scripts.pory"
CeladonCity_GameCorner_Movement_GruntExit::
# 451 "data/maps/CeladonCity_GameCorner/scripts.pory"
	walk_right
# 452 "data/maps/CeladonCity_GameCorner/scripts.pory"
	walk_right
# 453 "data/maps/CeladonCity_GameCorner/scripts.pory"
	walk_right
# 454 "data/maps/CeladonCity_GameCorner/scripts.pory"
	walk_right
# 455 "data/maps/CeladonCity_GameCorner/scripts.pory"
	walk_right
# 456 "data/maps/CeladonCity_GameCorner/scripts.pory"
	walk_right
# 457 "data/maps/CeladonCity_GameCorner/scripts.pory"
	step_end
# 458 "data/maps/CeladonCity_GameCorner/scripts.pory"

# 459 "data/maps/CeladonCity_GameCorner/scripts.pory"
CeladonCity_GameCorner_EventScript_UnusableSlotMachine1::
# 460 "data/maps/CeladonCity_GameCorner/scripts.pory"
	msgbox CeladonCity_GameCorner_Text_OutOfOrder, MSGBOX_SIGN
# 461 "data/maps/CeladonCity_GameCorner/scripts.pory"
	end
# 462 "data/maps/CeladonCity_GameCorner/scripts.pory"

# 463 "data/maps/CeladonCity_GameCorner/scripts.pory"
CeladonCity_GameCorner_EventScript_UnusableSlotMachine2::
# 464 "data/maps/CeladonCity_GameCorner/scripts.pory"
	msgbox CeladonCity_GameCorner_Text_OutToLunch, MSGBOX_SIGN
# 465 "data/maps/CeladonCity_GameCorner/scripts.pory"
	end
# 466 "data/maps/CeladonCity_GameCorner/scripts.pory"

# 467 "data/maps/CeladonCity_GameCorner/scripts.pory"
CeladonCity_GameCorner_EventScript_UnusableSlotMachine3::
# 468 "data/maps/CeladonCity_GameCorner/scripts.pory"
	msgbox CeladonCity_GameCorner_Text_SomeonesKeys, MSGBOX_SIGN
# 469 "data/maps/CeladonCity_GameCorner/scripts.pory"
	end
