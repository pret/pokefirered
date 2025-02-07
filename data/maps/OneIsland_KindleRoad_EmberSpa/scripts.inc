# 1 "data/maps/OneIsland_KindleRoad_EmberSpa/scripts.pory"

# 2 "data/maps/OneIsland_KindleRoad_EmberSpa/scripts.pory"
OneIsland_KindleRoad_EmberSpa_MapScripts::
# 3 "data/maps/OneIsland_KindleRoad_EmberSpa/scripts.pory"
	.byte 0
# 4 "data/maps/OneIsland_KindleRoad_EmberSpa/scripts.pory"

# 5 "data/maps/OneIsland_KindleRoad_EmberSpa/scripts.pory"
OneIsland_KindleRoad_EmberSpa_EventScript_OldMan::
# 6 "data/maps/OneIsland_KindleRoad_EmberSpa/scripts.pory"
	msgbox OneIsland_KindleRoad_EmberSpa_Text_WaterWarmsMeToCore, MSGBOX_NPC
# 7 "data/maps/OneIsland_KindleRoad_EmberSpa/scripts.pory"
	end
# 8 "data/maps/OneIsland_KindleRoad_EmberSpa/scripts.pory"

# 9 "data/maps/OneIsland_KindleRoad_EmberSpa/scripts.pory"
OneIsland_KindleRoad_EmberSpa_EventScript_BaldingMan1::
# 10 "data/maps/OneIsland_KindleRoad_EmberSpa/scripts.pory"
	msgbox OneIsland_KindleRoad_EmberSpa_Text_EnjoyBowlOfChowder, MSGBOX_NPC
# 11 "data/maps/OneIsland_KindleRoad_EmberSpa/scripts.pory"
	end
# 12 "data/maps/OneIsland_KindleRoad_EmberSpa/scripts.pory"

# 13 "data/maps/OneIsland_KindleRoad_EmberSpa/scripts.pory"
OneIsland_KindleRoad_EmberSpa_EventScript_BaldingMan2::
# 14 "data/maps/OneIsland_KindleRoad_EmberSpa/scripts.pory"
	msgbox OneIsland_KindleRoad_EmberSpa_Text_HotSpringIsTherapeutic, MSGBOX_NPC
# 15 "data/maps/OneIsland_KindleRoad_EmberSpa/scripts.pory"
	end
# 16 "data/maps/OneIsland_KindleRoad_EmberSpa/scripts.pory"

# 17 "data/maps/OneIsland_KindleRoad_EmberSpa/scripts.pory"
OneIsland_KindleRoad_EmberSpa_EventScript_OldWoman::
# 18 "data/maps/OneIsland_KindleRoad_EmberSpa/scripts.pory"
	msgbox OneIsland_KindleRoad_EmberSpa_Text_SeeHowSmoothMySkinIs, MSGBOX_NPC
# 19 "data/maps/OneIsland_KindleRoad_EmberSpa/scripts.pory"
	end
# 20 "data/maps/OneIsland_KindleRoad_EmberSpa/scripts.pory"

# 21 "data/maps/OneIsland_KindleRoad_EmberSpa/scripts.pory"
OneIsland_KindleRoad_EmberSpa_EventScript_BlackBelt::
# 22 "data/maps/OneIsland_KindleRoad_EmberSpa/scripts.pory"
	lock
# 23 "data/maps/OneIsland_KindleRoad_EmberSpa/scripts.pory"
	faceplayer
# 24 "data/maps/OneIsland_KindleRoad_EmberSpa/scripts.pory"
	famechecker FAMECHECKER_BRUNO, 3
# 25 "data/maps/OneIsland_KindleRoad_EmberSpa/scripts.pory"
	msgbox OneIsland_KindleRoad_EmberSpa_Text_BrunoVisitsSpaOnOccasion
# 26 "data/maps/OneIsland_KindleRoad_EmberSpa/scripts.pory"
	release
# 27 "data/maps/OneIsland_KindleRoad_EmberSpa/scripts.pory"
	end
# 28 "data/maps/OneIsland_KindleRoad_EmberSpa/scripts.pory"

# 29 "data/maps/OneIsland_KindleRoad_EmberSpa/scripts.pory"
OneIsland_KindleRoad_EmberSpa_EventScript_RockSmashMan::
# 30 "data/maps/OneIsland_KindleRoad_EmberSpa/scripts.pory"
	lock
# 31 "data/maps/OneIsland_KindleRoad_EmberSpa/scripts.pory"
	faceplayer
# 32 "data/maps/OneIsland_KindleRoad_EmberSpa/scripts.pory"
	goto_if_set FLAG_GOT_HM06, OneIsland_KindleRoad_EmberSpa_EventScript_AlreadyGotHM06
# 33 "data/maps/OneIsland_KindleRoad_EmberSpa/scripts.pory"
	msgbox OneIsland_KindleRoad_EmberSpa_Text_UsedThisToMakeEmberSpa
# 34 "data/maps/OneIsland_KindleRoad_EmberSpa/scripts.pory"
	giveitem ITEM_HM06
# 35 "data/maps/OneIsland_KindleRoad_EmberSpa/scripts.pory"
	setflag FLAG_GOT_HM06
# 36 "data/maps/OneIsland_KindleRoad_EmberSpa/scripts.pory"
	msgbox OneIsland_KindleRoad_EmberSpa_Text_ExplainHM06
# 37 "data/maps/OneIsland_KindleRoad_EmberSpa/scripts.pory"
	release
# 38 "data/maps/OneIsland_KindleRoad_EmberSpa/scripts.pory"
	end
# 39 "data/maps/OneIsland_KindleRoad_EmberSpa/scripts.pory"

# 40 "data/maps/OneIsland_KindleRoad_EmberSpa/scripts.pory"
OneIsland_KindleRoad_EmberSpa_EventScript_AlreadyGotHM06::
# 41 "data/maps/OneIsland_KindleRoad_EmberSpa/scripts.pory"
	msgbox OneIsland_KindleRoad_EmberSpa_Text_ExplainHM06
# 42 "data/maps/OneIsland_KindleRoad_EmberSpa/scripts.pory"
	release
# 43 "data/maps/OneIsland_KindleRoad_EmberSpa/scripts.pory"
	end
# 44 "data/maps/OneIsland_KindleRoad_EmberSpa/scripts.pory"

# 45 "data/maps/OneIsland_KindleRoad_EmberSpa/scripts.pory"
OneIsland_KindleRoad_EmberSpa_EventScript_SpaHeal::
# 46 "data/maps/OneIsland_KindleRoad_EmberSpa/scripts.pory"
	lockall
# 47 "data/maps/OneIsland_KindleRoad_EmberSpa/scripts.pory"
	fadescreen FADE_TO_WHITE
# 48 "data/maps/OneIsland_KindleRoad_EmberSpa/scripts.pory"
	special HealPlayerParty
# 49 "data/maps/OneIsland_KindleRoad_EmberSpa/scripts.pory"
	fadescreen FADE_FROM_WHITE
# 50 "data/maps/OneIsland_KindleRoad_EmberSpa/scripts.pory"
	msgbox OneIsland_KindleRoad_EmberSpa_Text_WaterExquisiteFullyRefreshed
# 51 "data/maps/OneIsland_KindleRoad_EmberSpa/scripts.pory"
	setvar VAR_TEMP_1, 1
# 52 "data/maps/OneIsland_KindleRoad_EmberSpa/scripts.pory"
	releaseall
# 53 "data/maps/OneIsland_KindleRoad_EmberSpa/scripts.pory"
	end
