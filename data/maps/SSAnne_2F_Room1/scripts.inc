# 1 "data/maps/SSAnne_2F_Room1/scripts.pory"

# 2 "data/maps/SSAnne_2F_Room1/scripts.pory"
SSAnne_2F_Room1_MapScripts::
# 3 "data/maps/SSAnne_2F_Room1/scripts.pory"
	.byte 0
# 4 "data/maps/SSAnne_2F_Room1/scripts.pory"

# 5 "data/maps/SSAnne_2F_Room1/scripts.pory"
SSAnne_2F_Room1_EventScript_Gentleman::
# 6 "data/maps/SSAnne_2F_Room1/scripts.pory"
	lock
# 7 "data/maps/SSAnne_2F_Room1/scripts.pory"
	faceplayer
# 8 "data/maps/SSAnne_2F_Room1/scripts.pory"
	message SSAnne_2F_Room1_Text_SleepingMonLookedLikeThis
# 9 "data/maps/SSAnne_2F_Room1/scripts.pory"
	waitmessage
# 10 "data/maps/SSAnne_2F_Room1/scripts.pory"
	setvar VAR_0x8004, SPECIES_SNORLAX
# 11 "data/maps/SSAnne_2F_Room1/scripts.pory"
	special SetSeenMon
# 12 "data/maps/SSAnne_2F_Room1/scripts.pory"
	showmonpic SPECIES_SNORLAX, 10, 3
# 13 "data/maps/SSAnne_2F_Room1/scripts.pory"
	waitbuttonpress
# 14 "data/maps/SSAnne_2F_Room1/scripts.pory"
	hidemonpic
# 15 "data/maps/SSAnne_2F_Room1/scripts.pory"
	release
# 16 "data/maps/SSAnne_2F_Room1/scripts.pory"
	end
