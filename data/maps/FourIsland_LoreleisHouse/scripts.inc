FourIsland_LoreleisHouse_MapScripts:: @ 8171C4E
	map_script MAP_SCRIPT_ON_TRANSITION, FourIsland_LoreleisHouse_OnTransition
	.byte 0

FourIsland_LoreleisHouse_OnTransition:: @ 8171C54
	special Special_ComputeLoreleiDollCollection
	end

FourIsland_LoreleisHouse_EventScript_171C58:: @ 8171C58
	lock
	faceplayer
	goto_if_set FLAG_TALKED_TO_LORELEI_AFTER_WAREHOUSE, EventScript_171C83
	goto_if_set FLAG_DEFEATED_ROCKETS_IN_WAREHOUSE, EventScript_171C76
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
