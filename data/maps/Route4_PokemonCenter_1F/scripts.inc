.equ MAGIKARP_PRICE, 500

Route4_PokemonCenter_1F_MapScripts:: @ 816F739
	map_script MAP_SCRIPT_ON_TRANSITION, Route4_PokemonCenter_1F_OnTransition
	map_script MAP_SCRIPT_ON_RESUME, CableClub_OnResume
	.byte 0

Route4_PokemonCenter_1F_OnTransition:: @ 816F744
	setworldmapflag FLAG_WORLD_MAP_ROUTE4_POKEMON_CENTER_1F
	setrespawn SPAWN_ROUTE4
	end

Route4_PokemonCenter_1F_EventScript_Boy:: @ 816F74B
	msgbox Route4_PokemonCenter_1F_Text_CanHaveSixMonsWithYou, MSGBOX_NPC
	end

Route4_PokemonCenter_1F_EventScript_Gentleman:: @ 816F754
	lock
	msgbox Route4_PokemonCenter_1F_Text_TeamRocketAttacksCerulean
	release
	end

Route4_PokemonCenter_1F_EventScript_MagikarpSalesman:: @ 816F75F
	lock
	faceplayer
	goto_if_set FLAG_BOUGHT_MAGIKARP, Route4_PokemonCenter_1F_EventScript_AlreadyBoughtMagikarp
	showmoneybox 0, 0, 0
	checkplayergender
	compare VAR_RESULT, MALE
	goto_if_eq Route4_PokemonCenter_1F_EventScript_AskBuyMagikarpMale
	compare VAR_RESULT, FEMALE
	goto_if_eq Route4_PokemonCenter_1F_EventScript_AskBuyMagikarpFemale
	end

Route4_PokemonCenter_1F_EventScript_AskBuyMagikarpMale:: @ 816F786
	msgbox Route4_PokemonCenter_1F_Text_LaddieBuyMagikarpForJust500, MSGBOX_YESNO
	goto Route4_PokemonCenter_1F_EventScript_TryBuyMagikarp
	end

Route4_PokemonCenter_1F_EventScript_AskBuyMagikarpFemale:: @ 816F794
	msgbox Route4_PokemonCenter_1F_Text_SweetieBuyMagikarpForJust500, MSGBOX_YESNO
	goto Route4_PokemonCenter_1F_EventScript_TryBuyMagikarp
	end

Route4_PokemonCenter_1F_EventScript_TryBuyMagikarp:: @ 816F7A2
	compare VAR_RESULT, NO
	goto_if_eq Route4_PokemonCenter_1F_EventScript_DeclineMagikarp
	checkmoney MAGIKARP_PRICE, 0
	compare VAR_RESULT, FALSE
	goto_if_eq Route4_PokemonCenter_1F_EventScript_NotEnoughMoney
	textcolor 3
	setvar VAR_TEMP_1, SPECIES_MAGIKARP
	givemon SPECIES_MAGIKARP, 5, ITEM_NONE
	compare VAR_RESULT, 0
	goto_if_eq Route4_PokemonCenter_1F_EventScript_BuyMagikarpParty
	compare VAR_RESULT, 1
	goto_if_eq Route4_PokemonCenter_1F_EventScript_BuyMagikarpPC
	compare VAR_RESULT, 2
	goto_if_eq Route4_PokemonCenter_1F_EventScript_NoRoomForMagikarp
	end

Route4_PokemonCenter_1F_EventScript_BuyMagikarpParty:: @ 816F7F6
	call Route4_PokemonCenter_1F_EventScript_PayForMagikarp
	msgbox Text_GiveNicknameToThisMon, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq Route4_PokemonCenter_1F_EventScript_EndPurchaseMagikarp
	call EventScript_GetGiftMonPartySlot
	fadescreen FADE_TO_BLACK
	hidemoneybox 0, 0
	special ChangePokemonNickname
	waitstate
	goto Route4_PokemonCenter_1F_EventScript_BoughtMagikarp
	end

Route4_PokemonCenter_1F_EventScript_BuyMagikarpPC:: @ 816F822
	call Route4_PokemonCenter_1F_EventScript_PayForMagikarp
	msgbox Text_GiveNicknameToThisMon, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq Route4_PokemonCenter_1F_EventScript_TransferMagikarpCloseMoneyBox
	fadescreen FADE_TO_BLACK
	hidemoneybox 0, 0
	special ChangeBoxPokemonNickname
	waitstate
	lock
	faceplayer
	goto Route4_PokemonCenter_1F_EventScript_TransferMagikarp
	end

Route4_PokemonCenter_1F_EventScript_TransferMagikarpCloseMoneyBox:: @ 816F84B
	call EventScript_TransferredToPC
	goto Route4_PokemonCenter_1F_EventScript_EndPurchaseMagikarp
	end

Route4_PokemonCenter_1F_EventScript_TransferMagikarp:: @ 816F856
	call EventScript_TransferredToPC
	goto Route4_PokemonCenter_1F_EventScript_BoughtMagikarp
	end

Route4_PokemonCenter_1F_EventScript_EndPurchaseMagikarp:: @ 816F861
	hidemoneybox 0, 0
	goto Route4_PokemonCenter_1F_EventScript_BoughtMagikarp
	end

Route4_PokemonCenter_1F_EventScript_BoughtMagikarp:: @ 816F86A
	setflag FLAG_BOUGHT_MAGIKARP
	release
	end

Route4_PokemonCenter_1F_EventScript_PayForMagikarp:: @ 816F86F
	removemoney MAGIKARP_PRICE, 0
	updatemoneybox 0, 0, 0
	playfanfare MUS_LEVEL_UP
	message Route4_PokemonCenter_1F_Text_PaidOutrageouslyForMagikarp
	waitmessage
	waitfanfare
	getspeciesname 0, SPECIES_MAGIKARP
	return

Route4_PokemonCenter_1F_EventScript_DeclineMagikarp:: @ 816F888
	msgbox Route4_PokemonCenter_1F_Text_OnlyDoingThisAsFavorToYou
	hidemoneybox 0, 0
	release
	end

Route4_PokemonCenter_1F_EventScript_NotEnoughMoney:: @ 816F895
	msgbox Route4_PokemonCenter_1F_Text_YoullNeedMoreMoney
	hidemoneybox 0, 0
	release
	end

Route4_PokemonCenter_1F_EventScript_AlreadyBoughtMagikarp:: @ 816F8A2
	msgbox Route4_PokemonCenter_1F_Text_IDontGiveRefunds
	release
	end

Route4_PokemonCenter_1F_EventScript_NoRoomForMagikarp:: @ 816F8AC
	textcolor 0
	msgbox Route4_PokemonCenter_1F_Text_NoRoomForMorePokemon
	hidemoneybox 0, 0
	release
	end

Route4_PokemonCenter_1F_EventScript_Nurse:: @ 816F8BB
	lock
	faceplayer
	call EventScript_PkmnCenterNurse
	release
	end

Route4_PokemonCenter_1F_EventScript_Youngster:: @ 816F8C4
	msgbox Route4_PokemonCenter_1F_Text_ShouldStoreMonsUsingPC, MSGBOX_NPC
	end

Route4_PokemonCenter_1F_EventScript_Newspaper:: @ 816F8CD
	lock
	msgbox Route4_PokemonCenter_1F_Text_ItsANewspaper
	release
	end
