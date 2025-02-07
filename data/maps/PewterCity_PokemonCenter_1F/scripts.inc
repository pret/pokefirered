# 1 "data/maps/PewterCity_PokemonCenter_1F/scripts.pory"

# 2 "data/maps/PewterCity_PokemonCenter_1F/scripts.pory"
PewterCity_PokemonCenter_1F_MapScripts::
# 3 "data/maps/PewterCity_PokemonCenter_1F/scripts.pory"
	map_script MAP_SCRIPT_ON_TRANSITION, PewterCity_PokemonCenter_1F_OnTransition
# 4 "data/maps/PewterCity_PokemonCenter_1F/scripts.pory"
	map_script MAP_SCRIPT_ON_RESUME, CableClub_OnResume
# 5 "data/maps/PewterCity_PokemonCenter_1F/scripts.pory"
	.byte 0
# 6 "data/maps/PewterCity_PokemonCenter_1F/scripts.pory"

# 7 "data/maps/PewterCity_PokemonCenter_1F/scripts.pory"
PewterCity_PokemonCenter_1F_OnTransition::
# 8 "data/maps/PewterCity_PokemonCenter_1F/scripts.pory"
	setrespawn SPAWN_PEWTER_CITY
# 9 "data/maps/PewterCity_PokemonCenter_1F/scripts.pory"
	end
# 10 "data/maps/PewterCity_PokemonCenter_1F/scripts.pory"

# 11 "data/maps/PewterCity_PokemonCenter_1F/scripts.pory"
PewterCity_PokemonCenter_1F_EventScript_Nurse::
# 12 "data/maps/PewterCity_PokemonCenter_1F/scripts.pory"
	lock
# 13 "data/maps/PewterCity_PokemonCenter_1F/scripts.pory"
	faceplayer
# 14 "data/maps/PewterCity_PokemonCenter_1F/scripts.pory"
	call EventScript_PkmnCenterNurse
# 15 "data/maps/PewterCity_PokemonCenter_1F/scripts.pory"
	release
# 16 "data/maps/PewterCity_PokemonCenter_1F/scripts.pory"
	end
# 17 "data/maps/PewterCity_PokemonCenter_1F/scripts.pory"

# 18 "data/maps/PewterCity_PokemonCenter_1F/scripts.pory"
PewterCity_PokemonCenter_1F_EventScript_Gentleman::
# 19 "data/maps/PewterCity_PokemonCenter_1F/scripts.pory"
	msgbox PewterCity_PokemonCenter_1F_Text_TeamRocketMtMoonImOnPhone, MSGBOX_NPC
# 20 "data/maps/PewterCity_PokemonCenter_1F/scripts.pory"
	end
# 21 "data/maps/PewterCity_PokemonCenter_1F/scripts.pory"

# 22 "data/maps/PewterCity_PokemonCenter_1F/scripts.pory"
PewterCity_PokemonCenter_1F_EventScript_Jigglypuff::
# 23 "data/maps/PewterCity_PokemonCenter_1F/scripts.pory"
	lock
# 24 "data/maps/PewterCity_PokemonCenter_1F/scripts.pory"
	faceplayer
# 25 "data/maps/PewterCity_PokemonCenter_1F/scripts.pory"
	fadeoutbgm 0
# 26 "data/maps/PewterCity_PokemonCenter_1F/scripts.pory"
	playbgm MUS_JIGGLYPUFF, 0
# 27 "data/maps/PewterCity_PokemonCenter_1F/scripts.pory"
	message PewterCity_PokemonCenter_1F_Text_Jigglypuff
# 28 "data/maps/PewterCity_PokemonCenter_1F/scripts.pory"
	waitmessage
# 29 "data/maps/PewterCity_PokemonCenter_1F/scripts.pory"
	delay 455
# 30 "data/maps/PewterCity_PokemonCenter_1F/scripts.pory"
	playbgm MUS_POKE_CENTER, 1
# 31 "data/maps/PewterCity_PokemonCenter_1F/scripts.pory"
	release
# 32 "data/maps/PewterCity_PokemonCenter_1F/scripts.pory"
	end
# 33 "data/maps/PewterCity_PokemonCenter_1F/scripts.pory"

# 34 "data/maps/PewterCity_PokemonCenter_1F/scripts.pory"
PewterCity_PokemonCenter_1F_EventScript_Youngster::
# 35 "data/maps/PewterCity_PokemonCenter_1F/scripts.pory"
	msgbox PewterCity_PokemonCenter_1F_Text_WhenJiggylypuffSingsMonsGetDrowsy, MSGBOX_NPC
# 36 "data/maps/PewterCity_PokemonCenter_1F/scripts.pory"
	end
# 37 "data/maps/PewterCity_PokemonCenter_1F/scripts.pory"

# 38 "data/maps/PewterCity_PokemonCenter_1F/scripts.pory"
PewterCity_PokemonCenter_1F_EventScript_GBAKid1::
# 39 "data/maps/PewterCity_PokemonCenter_1F/scripts.pory"
	lock
# 40 "data/maps/PewterCity_PokemonCenter_1F/scripts.pory"
	msgbox PewterCity_PokemonCenter_1F_Text_TradingMyClefairyForPikachu
# 41 "data/maps/PewterCity_PokemonCenter_1F/scripts.pory"
	release
# 42 "data/maps/PewterCity_PokemonCenter_1F/scripts.pory"
	end
# 43 "data/maps/PewterCity_PokemonCenter_1F/scripts.pory"

# 44 "data/maps/PewterCity_PokemonCenter_1F/scripts.pory"
PewterCity_PokemonCenter_1F_EventScript_GBAKid2::
# 45 "data/maps/PewterCity_PokemonCenter_1F/scripts.pory"
	msgbox PewterCity_PokemonCenter_1F_Text_TradingPikachuWithKid, MSGBOX_NPC
# 46 "data/maps/PewterCity_PokemonCenter_1F/scripts.pory"
	end
