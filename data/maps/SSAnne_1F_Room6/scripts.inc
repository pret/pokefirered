# 1 "data/maps/SSAnne_1F_Room6/scripts.pory"

# 2 "data/maps/SSAnne_1F_Room6/scripts.pory"
SSAnne_1F_Room6_MapScripts::
# 3 "data/maps/SSAnne_1F_Room6/scripts.pory"
	.byte 0
# 4 "data/maps/SSAnne_1F_Room6/scripts.pory"

# 5 "data/maps/SSAnne_1F_Room6/scripts.pory"
SSAnne_1F_Room6_EventScript_Woman::
# 6 "data/maps/SSAnne_1F_Room6/scripts.pory"
	lock
# 7 "data/maps/SSAnne_1F_Room6/scripts.pory"
	faceplayer
# 8 "data/maps/SSAnne_1F_Room6/scripts.pory"
	msgbox SSAnne_1F_Room6_Text_TakeAShortRest, MSGBOX_YESNO
# 9 "data/maps/SSAnne_1F_Room6/scripts.pory"
	goto_if_eq VAR_RESULT, NO, SSAnne_1F_Room6_EventScript_DeclineHeal
# 10 "data/maps/SSAnne_1F_Room6/scripts.pory"
	closemessage
# 11 "data/maps/SSAnne_1F_Room6/scripts.pory"
	call EventScript_OutOfCenterPartyHeal
# 12 "data/maps/SSAnne_1F_Room6/scripts.pory"
	msgbox SSAnne_1F_Room6_Text_GladEveryoneIsRefreshed
# 13 "data/maps/SSAnne_1F_Room6/scripts.pory"
	release
# 14 "data/maps/SSAnne_1F_Room6/scripts.pory"
	end
# 15 "data/maps/SSAnne_1F_Room6/scripts.pory"

# 16 "data/maps/SSAnne_1F_Room6/scripts.pory"
SSAnne_1F_Room6_EventScript_DeclineHeal::
# 17 "data/maps/SSAnne_1F_Room6/scripts.pory"
	checkplayergender
# 18 "data/maps/SSAnne_1F_Room6/scripts.pory"
	goto_if_eq VAR_RESULT, MALE, SSAnne_1F_Room6_EventScript_DeclineHealMale
# 19 "data/maps/SSAnne_1F_Room6/scripts.pory"
	msgbox SSAnne_1F_Room6_Text_SorryYouLookLikeMySister
# 20 "data/maps/SSAnne_1F_Room6/scripts.pory"
	release
# 21 "data/maps/SSAnne_1F_Room6/scripts.pory"
	end
# 22 "data/maps/SSAnne_1F_Room6/scripts.pory"

# 23 "data/maps/SSAnne_1F_Room6/scripts.pory"
SSAnne_1F_Room6_EventScript_DeclineHealMale::
# 24 "data/maps/SSAnne_1F_Room6/scripts.pory"
	msgbox SSAnne_1F_Room6_Text_SorryYouLookLikeMyBrother
# 25 "data/maps/SSAnne_1F_Room6/scripts.pory"
	release
# 26 "data/maps/SSAnne_1F_Room6/scripts.pory"
	end
