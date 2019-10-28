FourIsland_LoreleisHouse_MapScripts:: @ 8171C4E
	map_script 3, FourIsland_LoreleisHouse_MapScript1_171C54
	.byte 0

FourIsland_LoreleisHouse_MapScript1_171C54:: @ 8171C54
	special Special_ComputeLoreleiDollCollection
	end

FourIsland_LoreleisHouse_EventScript_171C58:: @ 8171C58
	lock
	faceplayer
	checkflag FLAG_TALKED_TO_LORELEI_AFTER_WAREHOUSE
	goto_if TRUE, EventScript_171C83
	checkflag FLAG_DEFEATED_ROCKETS_IN_WAREHOUSE
	goto_if TRUE, EventScript_171C76
	msgbox gUnknown_81A3826
	release
	end

EventScript_171C76:: @ 8171C76
	setflag FLAG_TALKED_TO_LORELEI_AFTER_WAREHOUSE
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
