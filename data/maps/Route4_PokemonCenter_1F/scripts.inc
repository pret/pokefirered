# 1 "data/maps/Route4_PokemonCenter_1F/scripts.pory"

# 2 "data/maps/Route4_PokemonCenter_1F/scripts.pory"
.equ MAGIKARP_PRICE, 500
# 3 "data/maps/Route4_PokemonCenter_1F/scripts.pory"

# 4 "data/maps/Route4_PokemonCenter_1F/scripts.pory"
Route4_PokemonCenter_1F_MapScripts::
# 5 "data/maps/Route4_PokemonCenter_1F/scripts.pory"
	map_script MAP_SCRIPT_ON_TRANSITION, Route4_PokemonCenter_1F_OnTransition
# 6 "data/maps/Route4_PokemonCenter_1F/scripts.pory"
	map_script MAP_SCRIPT_ON_RESUME, CableClub_OnResume
# 7 "data/maps/Route4_PokemonCenter_1F/scripts.pory"
	.byte 0
# 8 "data/maps/Route4_PokemonCenter_1F/scripts.pory"

# 9 "data/maps/Route4_PokemonCenter_1F/scripts.pory"
Route4_PokemonCenter_1F_OnTransition::
# 10 "data/maps/Route4_PokemonCenter_1F/scripts.pory"
	setworldmapflag FLAG_WORLD_MAP_ROUTE4_POKEMON_CENTER_1F
# 11 "data/maps/Route4_PokemonCenter_1F/scripts.pory"
	setrespawn SPAWN_ROUTE4
# 12 "data/maps/Route4_PokemonCenter_1F/scripts.pory"
	end
# 13 "data/maps/Route4_PokemonCenter_1F/scripts.pory"

# 14 "data/maps/Route4_PokemonCenter_1F/scripts.pory"
Route4_PokemonCenter_1F_EventScript_Boy::
# 15 "data/maps/Route4_PokemonCenter_1F/scripts.pory"
	msgbox Route4_PokemonCenter_1F_Text_CanHaveSixMonsWithYou, MSGBOX_NPC
# 16 "data/maps/Route4_PokemonCenter_1F/scripts.pory"
	end
# 17 "data/maps/Route4_PokemonCenter_1F/scripts.pory"

# 18 "data/maps/Route4_PokemonCenter_1F/scripts.pory"
Route4_PokemonCenter_1F_EventScript_Gentleman::
# 19 "data/maps/Route4_PokemonCenter_1F/scripts.pory"
	lock
# 20 "data/maps/Route4_PokemonCenter_1F/scripts.pory"
	msgbox Route4_PokemonCenter_1F_Text_TeamRocketAttacksCerulean
# 21 "data/maps/Route4_PokemonCenter_1F/scripts.pory"
	release
# 22 "data/maps/Route4_PokemonCenter_1F/scripts.pory"
	end
# 23 "data/maps/Route4_PokemonCenter_1F/scripts.pory"

# 24 "data/maps/Route4_PokemonCenter_1F/scripts.pory"
Route4_PokemonCenter_1F_EventScript_MagikarpSalesman::
# 25 "data/maps/Route4_PokemonCenter_1F/scripts.pory"
	lock
# 26 "data/maps/Route4_PokemonCenter_1F/scripts.pory"
	faceplayer
# 27 "data/maps/Route4_PokemonCenter_1F/scripts.pory"
	goto_if_set FLAG_BOUGHT_MAGIKARP, Route4_PokemonCenter_1F_EventScript_AlreadyBoughtMagikarp
# 28 "data/maps/Route4_PokemonCenter_1F/scripts.pory"
	showmoneybox 0, 0
# 29 "data/maps/Route4_PokemonCenter_1F/scripts.pory"
	checkplayergender
# 30 "data/maps/Route4_PokemonCenter_1F/scripts.pory"
	goto_if_eq VAR_RESULT, MALE, Route4_PokemonCenter_1F_EventScript_AskBuyMagikarpMale
# 31 "data/maps/Route4_PokemonCenter_1F/scripts.pory"
	goto_if_eq VAR_RESULT, FEMALE, Route4_PokemonCenter_1F_EventScript_AskBuyMagikarpFemale
# 32 "data/maps/Route4_PokemonCenter_1F/scripts.pory"
	end
# 33 "data/maps/Route4_PokemonCenter_1F/scripts.pory"

# 34 "data/maps/Route4_PokemonCenter_1F/scripts.pory"
Route4_PokemonCenter_1F_EventScript_AskBuyMagikarpMale::
# 35 "data/maps/Route4_PokemonCenter_1F/scripts.pory"
	msgbox Route4_PokemonCenter_1F_Text_LaddieBuyMagikarpForJust500, MSGBOX_YESNO
# 36 "data/maps/Route4_PokemonCenter_1F/scripts.pory"
	goto Route4_PokemonCenter_1F_EventScript_TryBuyMagikarp
# 37 "data/maps/Route4_PokemonCenter_1F/scripts.pory"
	end
# 38 "data/maps/Route4_PokemonCenter_1F/scripts.pory"

# 39 "data/maps/Route4_PokemonCenter_1F/scripts.pory"
Route4_PokemonCenter_1F_EventScript_AskBuyMagikarpFemale::
# 40 "data/maps/Route4_PokemonCenter_1F/scripts.pory"
	msgbox Route4_PokemonCenter_1F_Text_SweetieBuyMagikarpForJust500, MSGBOX_YESNO
# 41 "data/maps/Route4_PokemonCenter_1F/scripts.pory"
	goto Route4_PokemonCenter_1F_EventScript_TryBuyMagikarp
# 42 "data/maps/Route4_PokemonCenter_1F/scripts.pory"
	end
# 43 "data/maps/Route4_PokemonCenter_1F/scripts.pory"

# 44 "data/maps/Route4_PokemonCenter_1F/scripts.pory"
Route4_PokemonCenter_1F_EventScript_TryBuyMagikarp::
# 45 "data/maps/Route4_PokemonCenter_1F/scripts.pory"
	goto_if_eq VAR_RESULT, NO, Route4_PokemonCenter_1F_EventScript_DeclineMagikarp
# 46 "data/maps/Route4_PokemonCenter_1F/scripts.pory"
	checkmoney MAGIKARP_PRICE
# 47 "data/maps/Route4_PokemonCenter_1F/scripts.pory"
	goto_if_eq VAR_RESULT, FALSE, Route4_PokemonCenter_1F_EventScript_NotEnoughMoney
# 48 "data/maps/Route4_PokemonCenter_1F/scripts.pory"
	textcolor NPC_TEXT_COLOR_NEUTRAL
# 49 "data/maps/Route4_PokemonCenter_1F/scripts.pory"
	setvar VAR_TEMP_1, SPECIES_MAGIKARP
# 50 "data/maps/Route4_PokemonCenter_1F/scripts.pory"
	givemon SPECIES_MAGIKARP, 5
# 51 "data/maps/Route4_PokemonCenter_1F/scripts.pory"
	goto_if_eq VAR_RESULT, 0, Route4_PokemonCenter_1F_EventScript_BuyMagikarpParty
# 52 "data/maps/Route4_PokemonCenter_1F/scripts.pory"
	goto_if_eq VAR_RESULT, 1, Route4_PokemonCenter_1F_EventScript_BuyMagikarpPC
# 53 "data/maps/Route4_PokemonCenter_1F/scripts.pory"
	goto_if_eq VAR_RESULT, 2, Route4_PokemonCenter_1F_EventScript_NoRoomForMagikarp
# 54 "data/maps/Route4_PokemonCenter_1F/scripts.pory"
	end
# 55 "data/maps/Route4_PokemonCenter_1F/scripts.pory"

# 56 "data/maps/Route4_PokemonCenter_1F/scripts.pory"
Route4_PokemonCenter_1F_EventScript_BuyMagikarpParty::
# 57 "data/maps/Route4_PokemonCenter_1F/scripts.pory"
	call Route4_PokemonCenter_1F_EventScript_PayForMagikarp
# 58 "data/maps/Route4_PokemonCenter_1F/scripts.pory"
	msgbox Text_GiveNicknameToThisMon, MSGBOX_YESNO
# 59 "data/maps/Route4_PokemonCenter_1F/scripts.pory"
	goto_if_eq VAR_RESULT, NO, Route4_PokemonCenter_1F_EventScript_EndPurchaseMagikarp
# 60 "data/maps/Route4_PokemonCenter_1F/scripts.pory"
	call EventScript_GetGiftMonPartySlot
# 61 "data/maps/Route4_PokemonCenter_1F/scripts.pory"
	fadescreen FADE_TO_BLACK
# 62 "data/maps/Route4_PokemonCenter_1F/scripts.pory"
	hidemoneybox
# 63 "data/maps/Route4_PokemonCenter_1F/scripts.pory"
	special ChangePokemonNickname
# 64 "data/maps/Route4_PokemonCenter_1F/scripts.pory"
	waitstate
# 65 "data/maps/Route4_PokemonCenter_1F/scripts.pory"
	goto Route4_PokemonCenter_1F_EventScript_BoughtMagikarp
# 66 "data/maps/Route4_PokemonCenter_1F/scripts.pory"
	end
# 67 "data/maps/Route4_PokemonCenter_1F/scripts.pory"

# 68 "data/maps/Route4_PokemonCenter_1F/scripts.pory"
Route4_PokemonCenter_1F_EventScript_BuyMagikarpPC::
# 69 "data/maps/Route4_PokemonCenter_1F/scripts.pory"
	call Route4_PokemonCenter_1F_EventScript_PayForMagikarp
# 70 "data/maps/Route4_PokemonCenter_1F/scripts.pory"
	msgbox Text_GiveNicknameToThisMon, MSGBOX_YESNO
# 71 "data/maps/Route4_PokemonCenter_1F/scripts.pory"
	goto_if_eq VAR_RESULT, NO, Route4_PokemonCenter_1F_EventScript_TransferMagikarpCloseMoneyBox
# 72 "data/maps/Route4_PokemonCenter_1F/scripts.pory"
	fadescreen FADE_TO_BLACK
# 73 "data/maps/Route4_PokemonCenter_1F/scripts.pory"
	hidemoneybox
# 74 "data/maps/Route4_PokemonCenter_1F/scripts.pory"
	special ChangeBoxPokemonNickname
# 75 "data/maps/Route4_PokemonCenter_1F/scripts.pory"
	waitstate
# 76 "data/maps/Route4_PokemonCenter_1F/scripts.pory"
	lock
# 77 "data/maps/Route4_PokemonCenter_1F/scripts.pory"
	faceplayer
# 78 "data/maps/Route4_PokemonCenter_1F/scripts.pory"
	goto Route4_PokemonCenter_1F_EventScript_TransferMagikarp
# 79 "data/maps/Route4_PokemonCenter_1F/scripts.pory"
	end
# 80 "data/maps/Route4_PokemonCenter_1F/scripts.pory"

# 81 "data/maps/Route4_PokemonCenter_1F/scripts.pory"
Route4_PokemonCenter_1F_EventScript_TransferMagikarpCloseMoneyBox::
# 82 "data/maps/Route4_PokemonCenter_1F/scripts.pory"
	call EventScript_TransferredToPC
# 83 "data/maps/Route4_PokemonCenter_1F/scripts.pory"
	goto Route4_PokemonCenter_1F_EventScript_EndPurchaseMagikarp
# 84 "data/maps/Route4_PokemonCenter_1F/scripts.pory"
	end
# 85 "data/maps/Route4_PokemonCenter_1F/scripts.pory"

# 86 "data/maps/Route4_PokemonCenter_1F/scripts.pory"
Route4_PokemonCenter_1F_EventScript_TransferMagikarp::
# 87 "data/maps/Route4_PokemonCenter_1F/scripts.pory"
	call EventScript_TransferredToPC
# 88 "data/maps/Route4_PokemonCenter_1F/scripts.pory"
	goto Route4_PokemonCenter_1F_EventScript_BoughtMagikarp
# 89 "data/maps/Route4_PokemonCenter_1F/scripts.pory"
	end
# 90 "data/maps/Route4_PokemonCenter_1F/scripts.pory"

# 91 "data/maps/Route4_PokemonCenter_1F/scripts.pory"
Route4_PokemonCenter_1F_EventScript_EndPurchaseMagikarp::
# 92 "data/maps/Route4_PokemonCenter_1F/scripts.pory"
	hidemoneybox
# 93 "data/maps/Route4_PokemonCenter_1F/scripts.pory"
	goto Route4_PokemonCenter_1F_EventScript_BoughtMagikarp
# 94 "data/maps/Route4_PokemonCenter_1F/scripts.pory"
	end
# 95 "data/maps/Route4_PokemonCenter_1F/scripts.pory"

# 96 "data/maps/Route4_PokemonCenter_1F/scripts.pory"
Route4_PokemonCenter_1F_EventScript_BoughtMagikarp::
# 97 "data/maps/Route4_PokemonCenter_1F/scripts.pory"
	setflag FLAG_BOUGHT_MAGIKARP
# 98 "data/maps/Route4_PokemonCenter_1F/scripts.pory"
	release
# 99 "data/maps/Route4_PokemonCenter_1F/scripts.pory"
	end
# 100 "data/maps/Route4_PokemonCenter_1F/scripts.pory"

# 101 "data/maps/Route4_PokemonCenter_1F/scripts.pory"
Route4_PokemonCenter_1F_EventScript_PayForMagikarp::
# 102 "data/maps/Route4_PokemonCenter_1F/scripts.pory"
	removemoney MAGIKARP_PRICE
# 103 "data/maps/Route4_PokemonCenter_1F/scripts.pory"
	updatemoneybox
# 104 "data/maps/Route4_PokemonCenter_1F/scripts.pory"
	playfanfare MUS_LEVEL_UP
# 105 "data/maps/Route4_PokemonCenter_1F/scripts.pory"
	message Route4_PokemonCenter_1F_Text_PaidOutrageouslyForMagikarp
# 106 "data/maps/Route4_PokemonCenter_1F/scripts.pory"
	waitmessage
# 107 "data/maps/Route4_PokemonCenter_1F/scripts.pory"
	waitfanfare
# 108 "data/maps/Route4_PokemonCenter_1F/scripts.pory"
	bufferspeciesname STR_VAR_1, SPECIES_MAGIKARP
# 109 "data/maps/Route4_PokemonCenter_1F/scripts.pory"
	return
# 110 "data/maps/Route4_PokemonCenter_1F/scripts.pory"

# 111 "data/maps/Route4_PokemonCenter_1F/scripts.pory"
Route4_PokemonCenter_1F_EventScript_DeclineMagikarp::
# 112 "data/maps/Route4_PokemonCenter_1F/scripts.pory"
	msgbox Route4_PokemonCenter_1F_Text_OnlyDoingThisAsFavorToYou
# 113 "data/maps/Route4_PokemonCenter_1F/scripts.pory"
	hidemoneybox
# 114 "data/maps/Route4_PokemonCenter_1F/scripts.pory"
	release
# 115 "data/maps/Route4_PokemonCenter_1F/scripts.pory"
	end
# 116 "data/maps/Route4_PokemonCenter_1F/scripts.pory"

# 117 "data/maps/Route4_PokemonCenter_1F/scripts.pory"
Route4_PokemonCenter_1F_EventScript_NotEnoughMoney::
# 118 "data/maps/Route4_PokemonCenter_1F/scripts.pory"
	msgbox Route4_PokemonCenter_1F_Text_YoullNeedMoreMoney
# 119 "data/maps/Route4_PokemonCenter_1F/scripts.pory"
	hidemoneybox
# 120 "data/maps/Route4_PokemonCenter_1F/scripts.pory"
	release
# 121 "data/maps/Route4_PokemonCenter_1F/scripts.pory"
	end
# 122 "data/maps/Route4_PokemonCenter_1F/scripts.pory"

# 123 "data/maps/Route4_PokemonCenter_1F/scripts.pory"
Route4_PokemonCenter_1F_EventScript_AlreadyBoughtMagikarp::
# 124 "data/maps/Route4_PokemonCenter_1F/scripts.pory"
	msgbox Route4_PokemonCenter_1F_Text_IDontGiveRefunds
# 125 "data/maps/Route4_PokemonCenter_1F/scripts.pory"
	release
# 126 "data/maps/Route4_PokemonCenter_1F/scripts.pory"
	end
# 127 "data/maps/Route4_PokemonCenter_1F/scripts.pory"

# 128 "data/maps/Route4_PokemonCenter_1F/scripts.pory"
Route4_PokemonCenter_1F_EventScript_NoRoomForMagikarp::
# 129 "data/maps/Route4_PokemonCenter_1F/scripts.pory"
	textcolor NPC_TEXT_COLOR_MALE
# 130 "data/maps/Route4_PokemonCenter_1F/scripts.pory"
	msgbox Route4_PokemonCenter_1F_Text_NoRoomForMorePokemon
# 131 "data/maps/Route4_PokemonCenter_1F/scripts.pory"
	hidemoneybox
# 132 "data/maps/Route4_PokemonCenter_1F/scripts.pory"
	release
# 133 "data/maps/Route4_PokemonCenter_1F/scripts.pory"
	end
# 134 "data/maps/Route4_PokemonCenter_1F/scripts.pory"

# 135 "data/maps/Route4_PokemonCenter_1F/scripts.pory"
Route4_PokemonCenter_1F_EventScript_Nurse::
# 136 "data/maps/Route4_PokemonCenter_1F/scripts.pory"
	lock
# 137 "data/maps/Route4_PokemonCenter_1F/scripts.pory"
	faceplayer
# 138 "data/maps/Route4_PokemonCenter_1F/scripts.pory"
	call EventScript_PkmnCenterNurse
# 139 "data/maps/Route4_PokemonCenter_1F/scripts.pory"
	release
# 140 "data/maps/Route4_PokemonCenter_1F/scripts.pory"
	end
# 141 "data/maps/Route4_PokemonCenter_1F/scripts.pory"

# 142 "data/maps/Route4_PokemonCenter_1F/scripts.pory"
Route4_PokemonCenter_1F_EventScript_Youngster::
# 143 "data/maps/Route4_PokemonCenter_1F/scripts.pory"
	msgbox Route4_PokemonCenter_1F_Text_ShouldStoreMonsUsingPC, MSGBOX_NPC
# 144 "data/maps/Route4_PokemonCenter_1F/scripts.pory"
	end
# 145 "data/maps/Route4_PokemonCenter_1F/scripts.pory"

# 146 "data/maps/Route4_PokemonCenter_1F/scripts.pory"
Route4_PokemonCenter_1F_EventScript_Newspaper::
# 147 "data/maps/Route4_PokemonCenter_1F/scripts.pory"
	lock
# 148 "data/maps/Route4_PokemonCenter_1F/scripts.pory"
	msgbox Route4_PokemonCenter_1F_Text_ItsANewspaper
# 149 "data/maps/Route4_PokemonCenter_1F/scripts.pory"
	release
# 150 "data/maps/Route4_PokemonCenter_1F/scripts.pory"
	end
