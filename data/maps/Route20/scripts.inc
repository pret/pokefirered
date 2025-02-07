# 1 "data/maps/Route20/scripts.pory"

# 2 "data/maps/Route20/scripts.pory"
Route20_MapScripts::
# 3 "data/maps/Route20/scripts.pory"
	map_script MAP_SCRIPT_ON_TRANSITION, Route20_OnTransition
# 4 "data/maps/Route20/scripts.pory"
	.byte 0
# 5 "data/maps/Route20/scripts.pory"

# 6 "data/maps/Route20/scripts.pory"
Route20_OnTransition::
# 7 "data/maps/Route20/scripts.pory"
	call_if_unset FLAG_STOPPED_SEAFOAM_B3F_CURRENT, Route20_EventScript_ResetSeafoamBouldersForB3F
# 8 "data/maps/Route20/scripts.pory"
	call_if_unset FLAG_STOPPED_SEAFOAM_B4F_CURRENT, Route20_EventScript_ResetSeafoamBouldersForB4F
# 9 "data/maps/Route20/scripts.pory"
	end
# 10 "data/maps/Route20/scripts.pory"

# 11 "data/maps/Route20/scripts.pory"
Route20_EventScript_ResetSeafoamBouldersForB3F::
# 12 "data/maps/Route20/scripts.pory"
	clearflag FLAG_HIDE_SEAFOAM_1F_BOULDER_1
# 13 "data/maps/Route20/scripts.pory"
	clearflag FLAG_HIDE_SEAFOAM_1F_BOULDER_2
# 14 "data/maps/Route20/scripts.pory"
	setflag FLAG_HIDE_SEAFOAM_B1F_BOULDER_1
# 15 "data/maps/Route20/scripts.pory"
	setflag FLAG_HIDE_SEAFOAM_B1F_BOULDER_2
# 16 "data/maps/Route20/scripts.pory"
	setflag FLAG_HIDE_SEAFOAM_B2F_BOULDER_1
# 17 "data/maps/Route20/scripts.pory"
	setflag FLAG_HIDE_SEAFOAM_B2F_BOULDER_2
# 18 "data/maps/Route20/scripts.pory"
	setflag FLAG_HIDE_SEAFOAM_B3F_BOULDER_1
# 19 "data/maps/Route20/scripts.pory"
	setflag FLAG_HIDE_SEAFOAM_B3F_BOULDER_2
# 20 "data/maps/Route20/scripts.pory"
	return
# 21 "data/maps/Route20/scripts.pory"

# 22 "data/maps/Route20/scripts.pory"
Route20_EventScript_ResetSeafoamBouldersForB4F::
# 23 "data/maps/Route20/scripts.pory"
	clearflag FLAG_HIDE_SEAFOAM_B3F_BOULDER_3
# 24 "data/maps/Route20/scripts.pory"
	clearflag FLAG_HIDE_SEAFOAM_B3F_BOULDER_4
# 25 "data/maps/Route20/scripts.pory"
	clearflag FLAG_HIDE_SEAFOAM_B3F_BOULDER_5
# 26 "data/maps/Route20/scripts.pory"
	clearflag FLAG_HIDE_SEAFOAM_B3F_BOULDER_6
# 27 "data/maps/Route20/scripts.pory"
	setflag FLAG_HIDE_SEAFOAM_B4F_BOULDER_1
# 28 "data/maps/Route20/scripts.pory"
	setflag FLAG_HIDE_SEAFOAM_B4F_BOULDER_2
# 29 "data/maps/Route20/scripts.pory"
	return
# 30 "data/maps/Route20/scripts.pory"

# 31 "data/maps/Route20/scripts.pory"
Route20_EventScript_SeafoamIslandsSign::
# 32 "data/maps/Route20/scripts.pory"
	msgbox Route20_Text_SeafoamIslands, MSGBOX_SIGN
# 33 "data/maps/Route20/scripts.pory"
	end
