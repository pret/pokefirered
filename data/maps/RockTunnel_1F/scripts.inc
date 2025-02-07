# 1 "data/maps/RockTunnel_1F/scripts.pory"

# 2 "data/maps/RockTunnel_1F/scripts.pory"
RockTunnel_1F_MapScripts::
# 3 "data/maps/RockTunnel_1F/scripts.pory"
	map_script MAP_SCRIPT_ON_TRANSITION, RockTunnel_1F_OnTransition
# 4 "data/maps/RockTunnel_1F/scripts.pory"
	.byte 0
# 5 "data/maps/RockTunnel_1F/scripts.pory"

# 6 "data/maps/RockTunnel_1F/scripts.pory"
RockTunnel_1F_OnTransition::
# 7 "data/maps/RockTunnel_1F/scripts.pory"
	setworldmapflag FLAG_WORLD_MAP_ROCK_TUNNEL_1F
# 8 "data/maps/RockTunnel_1F/scripts.pory"
	end
# 9 "data/maps/RockTunnel_1F/scripts.pory"

# 10 "data/maps/RockTunnel_1F/scripts.pory"
RockTunnel_1F_EventScript_RouteSign::
# 11 "data/maps/RockTunnel_1F/scripts.pory"
	msgbox RockTunnel_1F_Text_RouteSign, MSGBOX_SIGN
# 12 "data/maps/RockTunnel_1F/scripts.pory"
	end
# 13 "data/maps/RockTunnel_1F/scripts.pory"

# 14 "data/maps/RockTunnel_1F/scripts.pory"
RockTunnel_1F_EventScript_Lenny::
# 15 "data/maps/RockTunnel_1F/scripts.pory"
	trainerbattle_single TRAINER_HIKER_LENNY, RockTunnel_1F_Text_LennyIntro, RockTunnel_1F_Text_LennyDefeat
# 16 "data/maps/RockTunnel_1F/scripts.pory"
	msgbox RockTunnel_1F_Text_LennyPostBattle, MSGBOX_AUTOCLOSE
# 17 "data/maps/RockTunnel_1F/scripts.pory"
	end
# 18 "data/maps/RockTunnel_1F/scripts.pory"

# 19 "data/maps/RockTunnel_1F/scripts.pory"
RockTunnel_1F_EventScript_Oliver::
# 20 "data/maps/RockTunnel_1F/scripts.pory"
	trainerbattle_single TRAINER_HIKER_OLIVER, RockTunnel_1F_Text_OliverIntro, RockTunnel_1F_Text_OliverDefeat
# 21 "data/maps/RockTunnel_1F/scripts.pory"
	msgbox RockTunnel_1F_Text_OliverPostBattle, MSGBOX_AUTOCLOSE
# 22 "data/maps/RockTunnel_1F/scripts.pory"
	end
# 23 "data/maps/RockTunnel_1F/scripts.pory"

# 24 "data/maps/RockTunnel_1F/scripts.pory"
RockTunnel_1F_EventScript_Lucas::
# 25 "data/maps/RockTunnel_1F/scripts.pory"
	trainerbattle_single TRAINER_HIKER_LUCAS, RockTunnel_1F_Text_LucasIntro, RockTunnel_1F_Text_LucasDefeat
# 26 "data/maps/RockTunnel_1F/scripts.pory"
	msgbox RockTunnel_1F_Text_LucasPostBattle, MSGBOX_AUTOCLOSE
# 27 "data/maps/RockTunnel_1F/scripts.pory"
	end
# 28 "data/maps/RockTunnel_1F/scripts.pory"

# 29 "data/maps/RockTunnel_1F/scripts.pory"
RockTunnel_1F_EventScript_Ashton::
# 30 "data/maps/RockTunnel_1F/scripts.pory"
	trainerbattle_single TRAINER_POKEMANIAC_ASHTON, RockTunnel_1F_Text_AshtonIntro, RockTunnel_1F_Text_AshtonDefeat
# 31 "data/maps/RockTunnel_1F/scripts.pory"
	msgbox RockTunnel_1F_Text_AshtonPostBattle, MSGBOX_AUTOCLOSE
# 32 "data/maps/RockTunnel_1F/scripts.pory"
	end
# 33 "data/maps/RockTunnel_1F/scripts.pory"

# 34 "data/maps/RockTunnel_1F/scripts.pory"
RockTunnel_1F_EventScript_Leah::
# 35 "data/maps/RockTunnel_1F/scripts.pory"
	trainerbattle_single TRAINER_PICNICKER_LEAH, RockTunnel_1F_Text_LeahIntro, RockTunnel_1F_Text_LeahDefeat
# 36 "data/maps/RockTunnel_1F/scripts.pory"
	msgbox RockTunnel_1F_Text_LeahPostBattle, MSGBOX_AUTOCLOSE
# 37 "data/maps/RockTunnel_1F/scripts.pory"
	end
# 38 "data/maps/RockTunnel_1F/scripts.pory"

# 39 "data/maps/RockTunnel_1F/scripts.pory"
RockTunnel_1F_EventScript_Ariana::
# 40 "data/maps/RockTunnel_1F/scripts.pory"
	trainerbattle_single TRAINER_PICNICKER_ARIANA, RockTunnel_1F_Text_ArianaIntro, RockTunnel_1F_Text_ArianaDefeat
# 41 "data/maps/RockTunnel_1F/scripts.pory"
	msgbox RockTunnel_1F_Text_ArianaPostBattle, MSGBOX_AUTOCLOSE
# 42 "data/maps/RockTunnel_1F/scripts.pory"
	end
# 43 "data/maps/RockTunnel_1F/scripts.pory"

# 44 "data/maps/RockTunnel_1F/scripts.pory"
RockTunnel_1F_EventScript_Dana::
# 45 "data/maps/RockTunnel_1F/scripts.pory"
	trainerbattle_single TRAINER_PICNICKER_DANA, RockTunnel_1F_Text_DanaIntro, RockTunnel_1F_Text_DanaDefeat
# 46 "data/maps/RockTunnel_1F/scripts.pory"
	msgbox RockTunnel_1F_Text_DanaPostBattle, MSGBOX_AUTOCLOSE
# 47 "data/maps/RockTunnel_1F/scripts.pory"
	end
