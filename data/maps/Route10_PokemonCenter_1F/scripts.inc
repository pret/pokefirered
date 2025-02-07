# 1 "data/maps/Route10_PokemonCenter_1F/scripts.pory"

# 2 "data/maps/Route10_PokemonCenter_1F/scripts.pory"
.equ REQUIRED_OWNED_MONS, 20
# 3 "data/maps/Route10_PokemonCenter_1F/scripts.pory"

# 4 "data/maps/Route10_PokemonCenter_1F/scripts.pory"
Route10_PokemonCenter_1F_MapScripts::
# 5 "data/maps/Route10_PokemonCenter_1F/scripts.pory"
	map_script MAP_SCRIPT_ON_TRANSITION, Route10_PokemonCenter_1F_OnTransition
# 6 "data/maps/Route10_PokemonCenter_1F/scripts.pory"
	map_script MAP_SCRIPT_ON_RESUME, CableClub_OnResume
# 7 "data/maps/Route10_PokemonCenter_1F/scripts.pory"
	.byte 0
# 8 "data/maps/Route10_PokemonCenter_1F/scripts.pory"

# 9 "data/maps/Route10_PokemonCenter_1F/scripts.pory"
Route10_PokemonCenter_1F_OnTransition::
# 10 "data/maps/Route10_PokemonCenter_1F/scripts.pory"
	setworldmapflag FLAG_WORLD_MAP_ROUTE10_POKEMON_CENTER_1F
# 11 "data/maps/Route10_PokemonCenter_1F/scripts.pory"
	setrespawn SPAWN_ROUTE10
# 12 "data/maps/Route10_PokemonCenter_1F/scripts.pory"
	end
# 13 "data/maps/Route10_PokemonCenter_1F/scripts.pory"

# 14 "data/maps/Route10_PokemonCenter_1F/scripts.pory"
Route10_PokemonCenter_1F_EventScript_Nurse::
# 15 "data/maps/Route10_PokemonCenter_1F/scripts.pory"
	lock
# 16 "data/maps/Route10_PokemonCenter_1F/scripts.pory"
	faceplayer
# 17 "data/maps/Route10_PokemonCenter_1F/scripts.pory"
	call EventScript_PkmnCenterNurse
# 18 "data/maps/Route10_PokemonCenter_1F/scripts.pory"
	release
# 19 "data/maps/Route10_PokemonCenter_1F/scripts.pory"
	end
# 20 "data/maps/Route10_PokemonCenter_1F/scripts.pory"

# 21 "data/maps/Route10_PokemonCenter_1F/scripts.pory"
Route10_PokemonCenter_1F_EventScript_FatMan::
# 22 "data/maps/Route10_PokemonCenter_1F/scripts.pory"
	msgbox Route10_PokemonCenter_1F_Text_NuggetUselessSoldFor5000, MSGBOX_NPC
# 23 "data/maps/Route10_PokemonCenter_1F/scripts.pory"
	end
# 24 "data/maps/Route10_PokemonCenter_1F/scripts.pory"

# 25 "data/maps/Route10_PokemonCenter_1F/scripts.pory"
Route10_PokemonCenter_1F_EventScript_Gentleman::
# 26 "data/maps/Route10_PokemonCenter_1F/scripts.pory"
	msgbox Route10_PokemonCenter_1F_Text_EveryTypeStrongerThanOthers, MSGBOX_NPC
# 27 "data/maps/Route10_PokemonCenter_1F/scripts.pory"
	end
# 28 "data/maps/Route10_PokemonCenter_1F/scripts.pory"

# 29 "data/maps/Route10_PokemonCenter_1F/scripts.pory"
Route10_PokemonCenter_1F_EventScript_Youngster::
# 30 "data/maps/Route10_PokemonCenter_1F/scripts.pory"
	msgbox Route10_PokemonCenter_1F_Text_HeardGhostsHauntLavender, MSGBOX_NPC
# 31 "data/maps/Route10_PokemonCenter_1F/scripts.pory"
	end
# 32 "data/maps/Route10_PokemonCenter_1F/scripts.pory"

# 33 "data/maps/Route10_PokemonCenter_1F/scripts.pory"
Route10_PokemonCenter_1F_EventScript_Aide::
# 34 "data/maps/Route10_PokemonCenter_1F/scripts.pory"
	lock
# 35 "data/maps/Route10_PokemonCenter_1F/scripts.pory"
	faceplayer
# 36 "data/maps/Route10_PokemonCenter_1F/scripts.pory"
	call Route10_PokemonCenter_1F_EventScript_GetAideRequestInfo
# 37 "data/maps/Route10_PokemonCenter_1F/scripts.pory"
	goto_if_set FLAG_GOT_EVERSTONE_FROM_OAKS_AIDE, Route10_PokemonCenter_1F_EventScript_AlreadyGotEverstone
# 38 "data/maps/Route10_PokemonCenter_1F/scripts.pory"
	msgbox Route10_PokemonCenter_1F_Text_GiveEverstoneIfCaught20Mons, MSGBOX_YESNO
# 39 "data/maps/Route10_PokemonCenter_1F/scripts.pory"
	goto_if_eq VAR_RESULT, NO, Aide_EventScript_DeclineCheckMons
# 40 "data/maps/Route10_PokemonCenter_1F/scripts.pory"
	setvar VAR_0x8004, 0
# 41 "data/maps/Route10_PokemonCenter_1F/scripts.pory"
	specialvar VAR_RESULT, GetPokedexCount
# 42 "data/maps/Route10_PokemonCenter_1F/scripts.pory"
	buffernumberstring STR_VAR_3, VAR_0x8006
# 43 "data/maps/Route10_PokemonCenter_1F/scripts.pory"
	call Route10_PokemonCenter_1F_EventScript_GetAideRequestInfo
# 44 "data/maps/Route10_PokemonCenter_1F/scripts.pory"
	goto_if_lt VAR_0x8006, REQUIRED_OWNED_MONS, Aide_EventScript_HaventCaughtEnough
# 45 "data/maps/Route10_PokemonCenter_1F/scripts.pory"
	msgbox Route10_PokemonCenter_1F_Text_GreatHereYouGo
# 46 "data/maps/Route10_PokemonCenter_1F/scripts.pory"
	checkitemspace ITEM_EVERSTONE
# 47 "data/maps/Route10_PokemonCenter_1F/scripts.pory"
	goto_if_eq VAR_RESULT, FALSE, Aide_EventScript_NoRoomForItem
# 48 "data/maps/Route10_PokemonCenter_1F/scripts.pory"
	giveitem_msg Route10_PokemonCenter_1F_Text_ReceivedEverstoneFromAide, ITEM_EVERSTONE
# 49 "data/maps/Route10_PokemonCenter_1F/scripts.pory"
	setflag FLAG_GOT_EVERSTONE_FROM_OAKS_AIDE
# 50 "data/maps/Route10_PokemonCenter_1F/scripts.pory"
	msgbox Route10_PokemonCenter_1F_Text_ExplainEverstone
# 51 "data/maps/Route10_PokemonCenter_1F/scripts.pory"
	release
# 52 "data/maps/Route10_PokemonCenter_1F/scripts.pory"
	end
# 53 "data/maps/Route10_PokemonCenter_1F/scripts.pory"

# 54 "data/maps/Route10_PokemonCenter_1F/scripts.pory"
Route10_PokemonCenter_1F_EventScript_AlreadyGotEverstone::
# 55 "data/maps/Route10_PokemonCenter_1F/scripts.pory"
	msgbox Route10_PokemonCenter_1F_Text_ExplainEverstone
# 56 "data/maps/Route10_PokemonCenter_1F/scripts.pory"
	release
# 57 "data/maps/Route10_PokemonCenter_1F/scripts.pory"
	end
# 58 "data/maps/Route10_PokemonCenter_1F/scripts.pory"

# 59 "data/maps/Route10_PokemonCenter_1F/scripts.pory"
Route10_PokemonCenter_1F_EventScript_GetAideRequestInfo::
# 60 "data/maps/Route10_PokemonCenter_1F/scripts.pory"
	buffernumberstring STR_VAR_1, REQUIRED_OWNED_MONS
# 61 "data/maps/Route10_PokemonCenter_1F/scripts.pory"
	bufferitemname STR_VAR_2, ITEM_EVERSTONE
# 62 "data/maps/Route10_PokemonCenter_1F/scripts.pory"
	return
