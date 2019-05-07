CeruleanCity_BikeShop_MapScripts:: @ 816ABBC
    .byte 0

CeruleanCity_BikeShop_EventScript_16ABBD:: @ 816ABBD
    lock
    faceplayer
    checkflag FLAG_0x271
    goto_if 1, EventScript_16AC58
    checkflag FLAG_0x241
    goto_if 1, EventScript_16AC22
    showmoneybox 0, 0, 0
    message Text_192755
    waitmessage
    multichoice 11, 0, 13, 0
    copyvar VAR_0x8000, VAR_RESULT
    compare_var_to_value VAR_0x8000, 0
    goto_if 1, EventScript_16AC07
    compare_var_to_value VAR_0x8000, 1
    goto_if 1, EventScript_16AC15
    compare_var_to_value VAR_0x8000, 127
    goto_if 1, EventScript_16AC15
    end

EventScript_16AC07:: @ 816AC07
    loadword 0, gUnknown_8192796
    callstd 4
    goto EventScript_16AC15
    end

EventScript_16AC15:: @ 816AC15
    loadword 0, gUnknown_819280E
    callstd 4
    hidemoneybox
    .byte 0
    .byte 0
    release
    end

EventScript_16AC22:: @ 816AC22
    loadword 0, gUnknown_81927B2
    callstd 4
    loadword 0, gUnknown_81927E1
    setorcopyvar VAR_0x8000, 360
    setorcopyvar VAR_0x8001, 1
    setorcopyvar VAR_0x8002, 318
    callstd 9
    setflag FLAG_0x271
    additem ITEM_BICYCLE, 1
    removeitem ITEM_BIKE_VOUCHER, 1
    loadword 0, gUnknown_819280E
    callstd 4
    release
    end

EventScript_16AC58:: @ 816AC58
    loadword 0, gUnknown_8192833
    callstd 4
    release
    end

EventScript_16AC62:: @ 816AC62
    loadword 0, gUnknown_81928A8
    callstd 4
    release
    end

CeruleanCity_BikeShop_EventScript_16AC6C:: @ 816AC6C
    loadword 0, gUnknown_81928CF
    callstd 2
    end

CeruleanCity_BikeShop_EventScript_16AC75:: @ 816AC75
    lock
    faceplayer
    checkflag FLAG_0x271
    goto_if 1, EventScript_16AC8A
    loadword 0, gUnknown_8192937
    callstd 4
    release
    end

EventScript_16AC8A:: @ 816AC8A
    loadword 0, gUnknown_8192968
    callstd 4
    release
    end

CeruleanCity_BikeShop_EventScript_16AC94:: @ 816AC94
CeruleanCity_EventScript_16AC94:: @ 816AC94
    loadword 0, gUnknown_81929AD
    callstd 3
    end
