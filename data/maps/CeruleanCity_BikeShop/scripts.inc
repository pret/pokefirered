# 1 "data/maps/CeruleanCity_BikeShop/scripts.pory"

# 2 "data/maps/CeruleanCity_BikeShop/scripts.pory"
CeruleanCity_BikeShop_MapScripts::
# 3 "data/maps/CeruleanCity_BikeShop/scripts.pory"
	.byte 0
# 4 "data/maps/CeruleanCity_BikeShop/scripts.pory"

# 5 "data/maps/CeruleanCity_BikeShop/scripts.pory"
CeruleanCity_BikeShop_EventScript_Clerk::
# 6 "data/maps/CeruleanCity_BikeShop/scripts.pory"
	lock
# 7 "data/maps/CeruleanCity_BikeShop/scripts.pory"
	faceplayer
# 8 "data/maps/CeruleanCity_BikeShop/scripts.pory"
	goto_if_set FLAG_GOT_BICYCLE, CeruleanCity_BikeShop_EventScript_AlreadyGotBicycle
# 9 "data/maps/CeruleanCity_BikeShop/scripts.pory"
	goto_if_set FLAG_GOT_BIKE_VOUCHER, CeruleanCity_BikeShop_EventScript_ExchangeBikeVoucher
# 10 "data/maps/CeruleanCity_BikeShop/scripts.pory"
	showmoneybox 0, 0
# 11 "data/maps/CeruleanCity_BikeShop/scripts.pory"
	message CeruleanCity_BikeShop_Text_WelcomeToBikeShop
# 12 "data/maps/CeruleanCity_BikeShop/scripts.pory"
	waitmessage
# 13 "data/maps/CeruleanCity_BikeShop/scripts.pory"
	multichoice 11, 0, MULTICHOICE_BIKE_SHOP, FALSE
# 14 "data/maps/CeruleanCity_BikeShop/scripts.pory"
	switch VAR_RESULT
# 15 "data/maps/CeruleanCity_BikeShop/scripts.pory"
	case 0, CeruleanCity_BikeShop_EventScript_TryPurchaseBicycle
# 16 "data/maps/CeruleanCity_BikeShop/scripts.pory"
	case 1, CeruleanCity_BikeShop_EventScript_ClerkGoodbye
# 17 "data/maps/CeruleanCity_BikeShop/scripts.pory"
	case 127, CeruleanCity_BikeShop_EventScript_ClerkGoodbye
# 18 "data/maps/CeruleanCity_BikeShop/scripts.pory"
	end
# 19 "data/maps/CeruleanCity_BikeShop/scripts.pory"

# 20 "data/maps/CeruleanCity_BikeShop/scripts.pory"
@ The Bicycle price / players money is never actually checked
# 21 "data/maps/CeruleanCity_BikeShop/scripts.pory"
CeruleanCity_BikeShop_EventScript_TryPurchaseBicycle::
# 22 "data/maps/CeruleanCity_BikeShop/scripts.pory"
	msgbox CeruleanCity_BikeShop_Text_SorryYouCantAffordIt
# 23 "data/maps/CeruleanCity_BikeShop/scripts.pory"
	goto CeruleanCity_BikeShop_EventScript_ClerkGoodbye
# 24 "data/maps/CeruleanCity_BikeShop/scripts.pory"
	end
# 25 "data/maps/CeruleanCity_BikeShop/scripts.pory"

# 26 "data/maps/CeruleanCity_BikeShop/scripts.pory"
CeruleanCity_BikeShop_EventScript_ClerkGoodbye::
# 27 "data/maps/CeruleanCity_BikeShop/scripts.pory"
	msgbox CeruleanCity_BikeShop_Text_ThankYouComeAgain
# 28 "data/maps/CeruleanCity_BikeShop/scripts.pory"
	hidemoneybox
# 29 "data/maps/CeruleanCity_BikeShop/scripts.pory"
	release
# 30 "data/maps/CeruleanCity_BikeShop/scripts.pory"
	end
# 31 "data/maps/CeruleanCity_BikeShop/scripts.pory"

# 32 "data/maps/CeruleanCity_BikeShop/scripts.pory"
CeruleanCity_BikeShop_EventScript_ExchangeBikeVoucher::
# 33 "data/maps/CeruleanCity_BikeShop/scripts.pory"
	msgbox CeruleanCity_BikeShop_Text_OhBikeVoucherHereYouGo
# 34 "data/maps/CeruleanCity_BikeShop/scripts.pory"
	msgreceiveditem CeruleanCity_BikeShop_Text_ExchangedVoucherForBicycle, ITEM_BICYCLE, 1, MUS_OBTAIN_KEY_ITEM
# 35 "data/maps/CeruleanCity_BikeShop/scripts.pory"
	setflag FLAG_GOT_BICYCLE
# 36 "data/maps/CeruleanCity_BikeShop/scripts.pory"
	additem ITEM_BICYCLE
# 37 "data/maps/CeruleanCity_BikeShop/scripts.pory"
	removeitem ITEM_BIKE_VOUCHER
# 38 "data/maps/CeruleanCity_BikeShop/scripts.pory"
	msgbox CeruleanCity_BikeShop_Text_ThankYouComeAgain
# 39 "data/maps/CeruleanCity_BikeShop/scripts.pory"
	release
# 40 "data/maps/CeruleanCity_BikeShop/scripts.pory"
	end
# 41 "data/maps/CeruleanCity_BikeShop/scripts.pory"

# 42 "data/maps/CeruleanCity_BikeShop/scripts.pory"
CeruleanCity_BikeShop_EventScript_AlreadyGotBicycle::
# 43 "data/maps/CeruleanCity_BikeShop/scripts.pory"
	msgbox CeruleanCity_BikeShop_Text_HowDoYouLikeNewBicycle
# 44 "data/maps/CeruleanCity_BikeShop/scripts.pory"
	release
# 45 "data/maps/CeruleanCity_BikeShop/scripts.pory"
	end
# 46 "data/maps/CeruleanCity_BikeShop/scripts.pory"

# 47 "data/maps/CeruleanCity_BikeShop/scripts.pory"
@ Unused
# 48 "data/maps/CeruleanCity_BikeShop/scripts.pory"
CeruleanCity_BikeShop_EventScript_NoRoomForBicycle::
# 49 "data/maps/CeruleanCity_BikeShop/scripts.pory"
	msgbox CeruleanCity_BikeShop_Text_MakeRoomForBicycle
# 50 "data/maps/CeruleanCity_BikeShop/scripts.pory"
	release
# 51 "data/maps/CeruleanCity_BikeShop/scripts.pory"
	end
# 52 "data/maps/CeruleanCity_BikeShop/scripts.pory"

# 53 "data/maps/CeruleanCity_BikeShop/scripts.pory"
CeruleanCity_BikeShop_EventScript_Woman::
# 54 "data/maps/CeruleanCity_BikeShop/scripts.pory"
	msgbox CeruleanCity_BikeShop_Text_CityBikeGoodEnoughForMe, MSGBOX_NPC
# 55 "data/maps/CeruleanCity_BikeShop/scripts.pory"
	end
# 56 "data/maps/CeruleanCity_BikeShop/scripts.pory"

# 57 "data/maps/CeruleanCity_BikeShop/scripts.pory"
CeruleanCity_BikeShop_EventScript_Youngster::
# 58 "data/maps/CeruleanCity_BikeShop/scripts.pory"
	lock
# 59 "data/maps/CeruleanCity_BikeShop/scripts.pory"
	faceplayer
# 60 "data/maps/CeruleanCity_BikeShop/scripts.pory"
	goto_if_set FLAG_GOT_BICYCLE, CeruleanCity_BikeShop_EventScript_YoungsterHaveBike
# 61 "data/maps/CeruleanCity_BikeShop/scripts.pory"
	msgbox CeruleanCity_BikeShop_Text_BikesCoolButExpensive
# 62 "data/maps/CeruleanCity_BikeShop/scripts.pory"
	release
# 63 "data/maps/CeruleanCity_BikeShop/scripts.pory"
	end
# 64 "data/maps/CeruleanCity_BikeShop/scripts.pory"

# 65 "data/maps/CeruleanCity_BikeShop/scripts.pory"
CeruleanCity_BikeShop_EventScript_YoungsterHaveBike::
# 66 "data/maps/CeruleanCity_BikeShop/scripts.pory"
	msgbox CeruleanCity_BikeShop_Text_WowYourBikeIsCool
# 67 "data/maps/CeruleanCity_BikeShop/scripts.pory"
	release
# 68 "data/maps/CeruleanCity_BikeShop/scripts.pory"
	end
# 69 "data/maps/CeruleanCity_BikeShop/scripts.pory"

# 70 "data/maps/CeruleanCity_BikeShop/scripts.pory"
CeruleanCity_BikeShop_EventScript_Bicycle::
# 71 "data/maps/CeruleanCity_BikeShop/scripts.pory"
	msgbox CeruleanCity_BikeShop_Text_ShinyNewBicycle, MSGBOX_SIGN
# 72 "data/maps/CeruleanCity_BikeShop/scripts.pory"
	end
