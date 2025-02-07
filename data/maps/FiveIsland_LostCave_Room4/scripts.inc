# 1 "data/maps/FiveIsland_LostCave_Room4/scripts.pory"

# 2 "data/maps/FiveIsland_LostCave_Room4/scripts.pory"
FiveIsland_LostCave_Room4_MapScripts::
# 3 "data/maps/FiveIsland_LostCave_Room4/scripts.pory"
	.byte 0
# 4 "data/maps/FiveIsland_LostCave_Room4/scripts.pory"

# 5 "data/maps/FiveIsland_LostCave_Room4/scripts.pory"
FiveIsland_LostCave_Room4_EventScript_Laura::
# 6 "data/maps/FiveIsland_LostCave_Room4/scripts.pory"
	trainerbattle_single TRAINER_PSYCHIC_LAURA, FiveIsland_LostCave_Room4_Text_LauraIntro, FiveIsland_LostCave_Room4_Text_LauraDefeat
# 7 "data/maps/FiveIsland_LostCave_Room4/scripts.pory"
	msgbox FiveIsland_LostCave_Room4_Text_LauraPostBattle, MSGBOX_AUTOCLOSE
# 8 "data/maps/FiveIsland_LostCave_Room4/scripts.pory"
	end
