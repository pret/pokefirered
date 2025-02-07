# 1 "data/maps/SSAnne_Deck/scripts.pory"

# 2 "data/maps/SSAnne_Deck/scripts.pory"
SSAnne_Deck_MapScripts::
# 3 "data/maps/SSAnne_Deck/scripts.pory"
	.byte 0
# 4 "data/maps/SSAnne_Deck/scripts.pory"

# 5 "data/maps/SSAnne_Deck/scripts.pory"
SSAnne_Deck_EventScript_Youngster::
# 6 "data/maps/SSAnne_Deck/scripts.pory"
	msgbox SSAnne_Deck_Text_ShipDepartingSoon, MSGBOX_NPC
# 7 "data/maps/SSAnne_Deck/scripts.pory"
	end
# 8 "data/maps/SSAnne_Deck/scripts.pory"

# 9 "data/maps/SSAnne_Deck/scripts.pory"
SSAnne_Deck_EventScript_BaldingMan::
# 10 "data/maps/SSAnne_Deck/scripts.pory"
	msgbox SSAnne_Deck_Text_FeelSeasick, MSGBOX_NPC
# 11 "data/maps/SSAnne_Deck/scripts.pory"
	end
# 12 "data/maps/SSAnne_Deck/scripts.pory"

# 13 "data/maps/SSAnne_Deck/scripts.pory"
SSAnne_Deck_EventScript_Sailor::
# 14 "data/maps/SSAnne_Deck/scripts.pory"
	msgbox SSAnne_Deck_Text_ScrubbingDecksHardWork, MSGBOX_NPC
# 15 "data/maps/SSAnne_Deck/scripts.pory"
	end
# 16 "data/maps/SSAnne_Deck/scripts.pory"

# 17 "data/maps/SSAnne_Deck/scripts.pory"
SSAnne_Deck_EventScript_Edmond::
# 18 "data/maps/SSAnne_Deck/scripts.pory"
	trainerbattle_single TRAINER_SAILOR_EDMOND, SSAnne_Deck_Text_EdmondIntro, SSAnne_Deck_Text_EdmondDefeat
# 19 "data/maps/SSAnne_Deck/scripts.pory"
	msgbox SSAnne_Deck_Text_EdmondPostBattle, MSGBOX_AUTOCLOSE
# 20 "data/maps/SSAnne_Deck/scripts.pory"
	end
# 21 "data/maps/SSAnne_Deck/scripts.pory"

# 22 "data/maps/SSAnne_Deck/scripts.pory"
SSAnne_Deck_EventScript_Trevor::
# 23 "data/maps/SSAnne_Deck/scripts.pory"
	trainerbattle_single TRAINER_SAILOR_TREVOR, SSAnne_Deck_Text_TrevorIntro, SSAnne_Deck_Text_TrevorDefeat
# 24 "data/maps/SSAnne_Deck/scripts.pory"
	msgbox SSAnne_Deck_Text_TrevorPostBattle, MSGBOX_AUTOCLOSE
# 25 "data/maps/SSAnne_Deck/scripts.pory"
	end
