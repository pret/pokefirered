SafariZone_Center_MapScripts:: @ 8162357
	map_script MAP_SCRIPT_ON_TRANSITION, SafariZone_Center_OnTransition
	.byte 0

SafariZone_Center_OnTransition:: @ 816235D
	setworldmapflag FLAG_WORLD_MAP_SAFARI_ZONE_CENTER
	end

SafariZone_Center_EventScript_RestHouseSign:: @ 8162361
	msgbox SafariZone_Center_Text_RestHouse, MSGBOX_SIGN
	end

SafariZone_Center_EventScript_TrainerTips:: @ 816236A
	msgbox SafariZone_Center_Text_PressStartToCheckTime, MSGBOX_SIGN
	end

SafariZone_Center_EventScript_AreaSign:: @ 8162373
	msgbox SafariZone_Center_Text_CenterArea, MSGBOX_SIGN
	end
