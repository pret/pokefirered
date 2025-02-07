# 1 "data/maps/FourIsland_LoreleisHouse/scripts.pory"

# 2 "data/maps/FourIsland_LoreleisHouse/scripts.pory"
FourIsland_LoreleisHouse_MapScripts::
# 3 "data/maps/FourIsland_LoreleisHouse/scripts.pory"
	map_script MAP_SCRIPT_ON_TRANSITION, FourIsland_LoreleisHouse_OnTransition
# 4 "data/maps/FourIsland_LoreleisHouse/scripts.pory"
	.byte 0
# 5 "data/maps/FourIsland_LoreleisHouse/scripts.pory"

# 6 "data/maps/FourIsland_LoreleisHouse/scripts.pory"
FourIsland_LoreleisHouse_OnTransition::
# 7 "data/maps/FourIsland_LoreleisHouse/scripts.pory"
	special UpdateLoreleiDollCollection
# 8 "data/maps/FourIsland_LoreleisHouse/scripts.pory"
	end
# 9 "data/maps/FourIsland_LoreleisHouse/scripts.pory"

# 10 "data/maps/FourIsland_LoreleisHouse/scripts.pory"
FourIsland_LoreleisHouse_EventScript_Lorelei::
# 11 "data/maps/FourIsland_LoreleisHouse/scripts.pory"
	lock
# 12 "data/maps/FourIsland_LoreleisHouse/scripts.pory"
	faceplayer
# 13 "data/maps/FourIsland_LoreleisHouse/scripts.pory"
	goto_if_set FLAG_TALKED_TO_LORELEI_AFTER_WAREHOUSE, FourIsland_LoreleisHouse_EventScript_Lorelei3
# 14 "data/maps/FourIsland_LoreleisHouse/scripts.pory"
	goto_if_set FLAG_DEFEATED_ROCKETS_IN_WAREHOUSE, FourIsland_LoreleisHouse_EventScript_Lorelei2
# 15 "data/maps/FourIsland_LoreleisHouse/scripts.pory"
	msgbox FourIsland_LoreleisHouse_Text_IfAnythingWereToHappenToIsland
# 16 "data/maps/FourIsland_LoreleisHouse/scripts.pory"
	release
# 17 "data/maps/FourIsland_LoreleisHouse/scripts.pory"
	end
# 18 "data/maps/FourIsland_LoreleisHouse/scripts.pory"

# 19 "data/maps/FourIsland_LoreleisHouse/scripts.pory"
FourIsland_LoreleisHouse_EventScript_Lorelei2::
# 20 "data/maps/FourIsland_LoreleisHouse/scripts.pory"
	setflag FLAG_TALKED_TO_LORELEI_AFTER_WAREHOUSE
# 21 "data/maps/FourIsland_LoreleisHouse/scripts.pory"
	msgbox FourIsland_LoreleisHouse_Text_IllReturnToLeagueInShortWhile
# 22 "data/maps/FourIsland_LoreleisHouse/scripts.pory"
	release
# 23 "data/maps/FourIsland_LoreleisHouse/scripts.pory"
	end
# 24 "data/maps/FourIsland_LoreleisHouse/scripts.pory"

# 25 "data/maps/FourIsland_LoreleisHouse/scripts.pory"
FourIsland_LoreleisHouse_EventScript_Lorelei3::
# 26 "data/maps/FourIsland_LoreleisHouse/scripts.pory"
	msgbox FourIsland_LoreleisHouse_Text_WillDoWhatICanHereAndNow
# 27 "data/maps/FourIsland_LoreleisHouse/scripts.pory"
	release
# 28 "data/maps/FourIsland_LoreleisHouse/scripts.pory"
	end
# 29 "data/maps/FourIsland_LoreleisHouse/scripts.pory"

# 30 "data/maps/FourIsland_LoreleisHouse/scripts.pory"
FourIsland_LoreleisHouse_EventScript_Doll::
# 31 "data/maps/FourIsland_LoreleisHouse/scripts.pory"
	lock
# 32 "data/maps/FourIsland_LoreleisHouse/scripts.pory"
	msgbox FourIsland_LoreleisHouse_Text_StuffedMonDollsGalore
# 33 "data/maps/FourIsland_LoreleisHouse/scripts.pory"
	release
# 34 "data/maps/FourIsland_LoreleisHouse/scripts.pory"
	end
