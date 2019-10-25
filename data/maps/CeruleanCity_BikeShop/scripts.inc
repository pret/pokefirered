CeruleanCity_BikeShop_MapScripts:: @ 816ABBC
	.byte 0

CeruleanCity_BikeShop_EventScript_16ABBD:: @ 816ABBD
	lock
	faceplayer
	checkflag FLAG_GOT_BICYCLE
	goto_if TRUE, EventScript_16AC58
	checkflag FLAG_GOT_BIKE_VOUCHER
	goto_if TRUE, EventScript_16AC22
	showmoneybox 0, 0, 0
	message Text_192755
	waitmessage
	multichoice 11, 0, MULTICHOICE_BIKE_SHOP, FALSE
	switch VAR_RESULT
	case 0, EventScript_16AC07
	case 1, EventScript_16AC15
	case 127, EventScript_16AC15
	end

EventScript_16AC07:: @ 816AC07
	msgbox gUnknown_8192796
	goto EventScript_16AC15
	end

EventScript_16AC15:: @ 816AC15
	msgbox gUnknown_819280E
	hidemoneybox
	.byte 0
	.byte 0
	release
	end

EventScript_16AC22:: @ 816AC22
	msgbox gUnknown_81927B2
	giveitemfanfaremsg gUnknown_81927E1, ITEM_BICYCLE, 1, MUS_FAN5
	setflag FLAG_GOT_BICYCLE
	additem ITEM_BICYCLE, 1
	removeitem ITEM_BIKE_VOUCHER, 1
	msgbox gUnknown_819280E
	release
	end

EventScript_16AC58:: @ 816AC58
	msgbox gUnknown_8192833
	release
	end

EventScript_16AC62:: @ 816AC62
	msgbox gUnknown_81928A8
	release
	end

CeruleanCity_BikeShop_EventScript_16AC6C:: @ 816AC6C
	msgbox gUnknown_81928CF, 2
	end

CeruleanCity_BikeShop_EventScript_16AC75:: @ 816AC75
	lock
	faceplayer
	checkflag FLAG_GOT_BICYCLE
	goto_if TRUE, EventScript_16AC8A
	msgbox gUnknown_8192937
	release
	end

EventScript_16AC8A:: @ 816AC8A
	msgbox gUnknown_8192968
	release
	end

CeruleanCity_BikeShop_EventScript_16AC94:: @ 816AC94
CeruleanCity_EventScript_16AC94:: @ 816AC94
	msgbox gUnknown_81929AD, 3
	end
