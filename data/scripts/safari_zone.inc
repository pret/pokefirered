SafariZone_EventScript_OutOfBallsMidBattle:: @ 81BFB87
	setvar VAR_MAP_SCENE_FUCHSIA_CITY_SAFARI_ZONE_ENTRANCE, 3
	special ExitSafariMode
	setwarp MAP_FUCHSIA_CITY_SAFARI_ZONE_ENTRANCE, 255, 4, 1
	end

SafariZone_EventScript_Exit:: @ 81BFB98
	setvar VAR_MAP_SCENE_FUCHSIA_CITY_SAFARI_ZONE_ENTRANCE, 1
	special ExitSafariMode
	warp MAP_FUCHSIA_CITY_SAFARI_ZONE_ENTRANCE, 255, 4, 1
	waitstate
	end

SafariZone_EventScript_RetirePrompt:: @ 81BFBAA
	lockall
	msgbox SafariZone_Text_WouldYouLikeToExit, MSGBOX_YESNO
	compare VAR_RESULT, YES
	goto_if_eq SafariZone_EventScript_Retire
	releaseall
	end

SafariZone_EventScript_Retire:: @ 81BFBC0
	goto SafariZone_EventScript_Exit

SafariZone_EventScript_TimesUp:: @ 81BFBC5
	lockall
	playse SE_DING_DONG
	msgbox SafariZone_Text_TimesUp
	goto SafariZone_EventScript_Exit
	end

SafariZone_EventScript_OutOfBalls:: @ 81BFBD7
	lockall
	playse SE_DING_DONG
	msgbox SafariZone_Text_OutOfBalls
	goto SafariZone_EventScript_Exit
	end
