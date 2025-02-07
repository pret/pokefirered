# 1 "data/maps/FiveIsland_LostCave_Room1/scripts.pory"

# 2 "data/maps/FiveIsland_LostCave_Room1/scripts.pory"
FiveIsland_LostCave_Room1_MapScripts::
# 3 "data/maps/FiveIsland_LostCave_Room1/scripts.pory"
	.byte 0
# 4 "data/maps/FiveIsland_LostCave_Room1/scripts.pory"

# 5 "data/maps/FiveIsland_LostCave_Room1/scripts.pory"
FiveIsland_LostCave_Room1_EventScript_Lawson::
# 6 "data/maps/FiveIsland_LostCave_Room1/scripts.pory"
	trainerbattle_single TRAINER_RUIN_MANIAC_LAWSON, FiveIsland_LostCave_Room1_Text_LawsonIntro, FiveIsland_LostCave_Room1_Text_LawsonDefeat
# 7 "data/maps/FiveIsland_LostCave_Room1/scripts.pory"
	msgbox FiveIsland_LostCave_Room1_Text_LawsonPostBattle, MSGBOX_AUTOCLOSE
# 8 "data/maps/FiveIsland_LostCave_Room1/scripts.pory"
	end
