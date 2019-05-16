FourIsland_LoreleisHouse_MapScripts:: @ 8171C4E
	map_script 3, FourIsland_LoreleisHouse_MapScript1_171C54
	.byte 0

FourIsland_LoreleisHouse_MapScript1_171C54:: @ 8171C54
	special sub_80CD154
	end

FourIsland_LoreleisHouse_EventScript_171C58:: @ 8171C58
	lock
	faceplayer
	checkflag FLAG_0x2D4
	goto_if_eq EventScript_171C83
	checkflag FLAG_0x2D5
	goto_if_eq EventScript_171C76
	msgbox gUnknown_81A3826
	release
	end

EventScript_171C76:: @ 8171C76
	setflag FLAG_0x2D4
	msgbox gUnknown_81A390C
	release
	end

EventScript_171C83:: @ 8171C83
	msgbox gUnknown_81A39D8
	release
	end

FourIsland_LoreleisHouse_EventScript_171C8D:: @ 8171C8D
	lock
	msgbox gUnknown_81A3A42
	release
	end
