# 1 "data/maps/SafariZone_Center/scripts.pory"

# 2 "data/maps/SafariZone_Center/scripts.pory"
SafariZone_Center_MapScripts::
# 3 "data/maps/SafariZone_Center/scripts.pory"
	map_script MAP_SCRIPT_ON_TRANSITION, SafariZone_Center_OnTransition
# 4 "data/maps/SafariZone_Center/scripts.pory"
	.byte 0
# 5 "data/maps/SafariZone_Center/scripts.pory"

# 6 "data/maps/SafariZone_Center/scripts.pory"
SafariZone_Center_OnTransition::
# 7 "data/maps/SafariZone_Center/scripts.pory"
	setworldmapflag FLAG_WORLD_MAP_SAFARI_ZONE_CENTER
# 8 "data/maps/SafariZone_Center/scripts.pory"
	end
# 9 "data/maps/SafariZone_Center/scripts.pory"

# 10 "data/maps/SafariZone_Center/scripts.pory"
SafariZone_Center_EventScript_RestHouseSign::
# 11 "data/maps/SafariZone_Center/scripts.pory"
	msgbox SafariZone_Center_Text_RestHouse, MSGBOX_SIGN
# 12 "data/maps/SafariZone_Center/scripts.pory"
	end
# 13 "data/maps/SafariZone_Center/scripts.pory"

# 14 "data/maps/SafariZone_Center/scripts.pory"
SafariZone_Center_EventScript_TrainerTips::
# 15 "data/maps/SafariZone_Center/scripts.pory"
	msgbox SafariZone_Center_Text_PressStartToCheckTime, MSGBOX_SIGN
# 16 "data/maps/SafariZone_Center/scripts.pory"
	end
# 17 "data/maps/SafariZone_Center/scripts.pory"

# 18 "data/maps/SafariZone_Center/scripts.pory"
SafariZone_Center_EventScript_AreaSign::
# 19 "data/maps/SafariZone_Center/scripts.pory"
	msgbox SafariZone_Center_Text_CenterArea, MSGBOX_SIGN
# 20 "data/maps/SafariZone_Center/scripts.pory"
	end
