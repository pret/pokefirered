# 1 "data/maps/LavenderTown_VolunteerPokemonHouse/scripts.pory"

# 2 "data/maps/LavenderTown_VolunteerPokemonHouse/scripts.pory"
LavenderTown_VolunteerPokemonHouse_MapScripts::
# 3 "data/maps/LavenderTown_VolunteerPokemonHouse/scripts.pory"
	.byte 0
# 4 "data/maps/LavenderTown_VolunteerPokemonHouse/scripts.pory"

# 5 "data/maps/LavenderTown_VolunteerPokemonHouse/scripts.pory"
LavenderTown_VolunteerPokemonHouse_EventScript_MrFuji::
# 6 "data/maps/LavenderTown_VolunteerPokemonHouse/scripts.pory"
	lock
# 7 "data/maps/LavenderTown_VolunteerPokemonHouse/scripts.pory"
	faceplayer
# 8 "data/maps/LavenderTown_VolunteerPokemonHouse/scripts.pory"
	goto_if_set FLAG_GOT_POKE_FLUTE, LavenderTown_VolunteerPokemonHouse_EventScript_AlreadyHavePokeFlute
# 9 "data/maps/LavenderTown_VolunteerPokemonHouse/scripts.pory"
	msgbox LavenderTown_VolunteerPokemonHouse_Text_IdLikeYouToHaveThis
# 10 "data/maps/LavenderTown_VolunteerPokemonHouse/scripts.pory"
	checkitemspace ITEM_POKE_FLUTE
# 11 "data/maps/LavenderTown_VolunteerPokemonHouse/scripts.pory"
	goto_if_eq VAR_RESULT, FALSE, LavenderTown_VolunteerPokemonHouse_EventScript_NoRoomForPokeFlute
# 12 "data/maps/LavenderTown_VolunteerPokemonHouse/scripts.pory"
	setflag FLAG_GOT_POKE_FLUTE
# 13 "data/maps/LavenderTown_VolunteerPokemonHouse/scripts.pory"
	giveitem_msg LavenderTown_VolunteerPokemonHouse_Text_ReceivedPokeFluteFromMrFuji, ITEM_POKE_FLUTE, 1, MUS_OBTAIN_KEY_ITEM
# 14 "data/maps/LavenderTown_VolunteerPokemonHouse/scripts.pory"
	msgbox LavenderTown_VolunteerPokemonHouse_Text_ExplainPokeFlute
# 15 "data/maps/LavenderTown_VolunteerPokemonHouse/scripts.pory"
	release
# 16 "data/maps/LavenderTown_VolunteerPokemonHouse/scripts.pory"
	end
# 17 "data/maps/LavenderTown_VolunteerPokemonHouse/scripts.pory"

# 18 "data/maps/LavenderTown_VolunteerPokemonHouse/scripts.pory"
LavenderTown_VolunteerPokemonHouse_EventScript_AlreadyHavePokeFlute::
# 19 "data/maps/LavenderTown_VolunteerPokemonHouse/scripts.pory"
	msgbox LavenderTown_VolunteerPokemonHouse_Text_HasPokeFluteHelpedYou
# 20 "data/maps/LavenderTown_VolunteerPokemonHouse/scripts.pory"
	release
# 21 "data/maps/LavenderTown_VolunteerPokemonHouse/scripts.pory"
	end
# 22 "data/maps/LavenderTown_VolunteerPokemonHouse/scripts.pory"

# 23 "data/maps/LavenderTown_VolunteerPokemonHouse/scripts.pory"
LavenderTown_VolunteerPokemonHouse_EventScript_NoRoomForPokeFlute::
# 24 "data/maps/LavenderTown_VolunteerPokemonHouse/scripts.pory"
	msgbox LavenderTown_VolunteerPokemonHouse_Text_MustMakeRoomForThis
# 25 "data/maps/LavenderTown_VolunteerPokemonHouse/scripts.pory"
	release
# 26 "data/maps/LavenderTown_VolunteerPokemonHouse/scripts.pory"
	end
# 27 "data/maps/LavenderTown_VolunteerPokemonHouse/scripts.pory"

# 28 "data/maps/LavenderTown_VolunteerPokemonHouse/scripts.pory"
LavenderTown_VolunteerPokemonHouse_EventScript_LittleGirl::
# 29 "data/maps/LavenderTown_VolunteerPokemonHouse/scripts.pory"
	lock
# 30 "data/maps/LavenderTown_VolunteerPokemonHouse/scripts.pory"
	faceplayer
# 31 "data/maps/LavenderTown_VolunteerPokemonHouse/scripts.pory"
	famechecker FAMECHECKER_MRFUJI, 0
# 32 "data/maps/LavenderTown_VolunteerPokemonHouse/scripts.pory"
	msgbox LavenderTown_VolunteerPokemonHouse_Text_MrFujiLooksAfterOrphanedMons
# 33 "data/maps/LavenderTown_VolunteerPokemonHouse/scripts.pory"
	release
# 34 "data/maps/LavenderTown_VolunteerPokemonHouse/scripts.pory"
	end
# 35 "data/maps/LavenderTown_VolunteerPokemonHouse/scripts.pory"

# 36 "data/maps/LavenderTown_VolunteerPokemonHouse/scripts.pory"
LavenderTown_VolunteerPokemonHouse_EventScript_LittleBoy::
# 37 "data/maps/LavenderTown_VolunteerPokemonHouse/scripts.pory"
	msgbox LavenderTown_VolunteerPokemonHouse_Text_MonsNiceToHug, MSGBOX_NPC
# 38 "data/maps/LavenderTown_VolunteerPokemonHouse/scripts.pory"
	end
# 39 "data/maps/LavenderTown_VolunteerPokemonHouse/scripts.pory"

# 40 "data/maps/LavenderTown_VolunteerPokemonHouse/scripts.pory"
LavenderTown_VolunteerPokemonHouse_EventScript_Youngster::
# 41 "data/maps/LavenderTown_VolunteerPokemonHouse/scripts.pory"
	lock
# 42 "data/maps/LavenderTown_VolunteerPokemonHouse/scripts.pory"
	faceplayer
# 43 "data/maps/LavenderTown_VolunteerPokemonHouse/scripts.pory"
	goto_if_set FLAG_RESCUED_MR_FUJI, LavenderTown_VolunteerPokemonHouse_EventScript_YoungsterFujiBack
# 44 "data/maps/LavenderTown_VolunteerPokemonHouse/scripts.pory"
	msgbox LavenderTown_VolunteerPokemonHouse_Text_WhereDidMrFujiGo
# 45 "data/maps/LavenderTown_VolunteerPokemonHouse/scripts.pory"
	release
# 46 "data/maps/LavenderTown_VolunteerPokemonHouse/scripts.pory"
	end
# 47 "data/maps/LavenderTown_VolunteerPokemonHouse/scripts.pory"

# 48 "data/maps/LavenderTown_VolunteerPokemonHouse/scripts.pory"
LavenderTown_VolunteerPokemonHouse_EventScript_YoungsterFujiBack::
# 49 "data/maps/LavenderTown_VolunteerPokemonHouse/scripts.pory"
	msgbox LavenderTown_VolunteerPokemonHouse_Text_MrFujiWasPrayingForCubonesMother
# 50 "data/maps/LavenderTown_VolunteerPokemonHouse/scripts.pory"
	release
# 51 "data/maps/LavenderTown_VolunteerPokemonHouse/scripts.pory"
	end
# 52 "data/maps/LavenderTown_VolunteerPokemonHouse/scripts.pory"

# 53 "data/maps/LavenderTown_VolunteerPokemonHouse/scripts.pory"
LavenderTown_VolunteerPokemonHouse_EventScript_Nidorino::
# 54 "data/maps/LavenderTown_VolunteerPokemonHouse/scripts.pory"
	lock
# 55 "data/maps/LavenderTown_VolunteerPokemonHouse/scripts.pory"
	faceplayer
# 56 "data/maps/LavenderTown_VolunteerPokemonHouse/scripts.pory"
	waitse
# 57 "data/maps/LavenderTown_VolunteerPokemonHouse/scripts.pory"
	playmoncry SPECIES_NIDORINO, CRY_MODE_NORMAL
# 58 "data/maps/LavenderTown_VolunteerPokemonHouse/scripts.pory"
	msgbox LavenderTown_VolunteerPokemonHouse_Text_Nidorino
# 59 "data/maps/LavenderTown_VolunteerPokemonHouse/scripts.pory"
	waitmoncry
# 60 "data/maps/LavenderTown_VolunteerPokemonHouse/scripts.pory"
	release
# 61 "data/maps/LavenderTown_VolunteerPokemonHouse/scripts.pory"
	end
# 62 "data/maps/LavenderTown_VolunteerPokemonHouse/scripts.pory"

# 63 "data/maps/LavenderTown_VolunteerPokemonHouse/scripts.pory"
LavenderTown_VolunteerPokemonHouse_EventScript_Psyduck::
# 64 "data/maps/LavenderTown_VolunteerPokemonHouse/scripts.pory"
	lock
# 65 "data/maps/LavenderTown_VolunteerPokemonHouse/scripts.pory"
	faceplayer
# 66 "data/maps/LavenderTown_VolunteerPokemonHouse/scripts.pory"
	waitse
# 67 "data/maps/LavenderTown_VolunteerPokemonHouse/scripts.pory"
	playmoncry SPECIES_PSYDUCK, CRY_MODE_NORMAL
# 68 "data/maps/LavenderTown_VolunteerPokemonHouse/scripts.pory"
	msgbox LavenderTown_VolunteerPokemonHouse_Text_Psyduck
# 69 "data/maps/LavenderTown_VolunteerPokemonHouse/scripts.pory"
	waitmoncry
# 70 "data/maps/LavenderTown_VolunteerPokemonHouse/scripts.pory"
	release
# 71 "data/maps/LavenderTown_VolunteerPokemonHouse/scripts.pory"
	end
# 72 "data/maps/LavenderTown_VolunteerPokemonHouse/scripts.pory"

# 73 "data/maps/LavenderTown_VolunteerPokemonHouse/scripts.pory"
LavenderTown_VolunteerPokemonHouse_EventScript_PokemonFanMagazine::
# 74 "data/maps/LavenderTown_VolunteerPokemonHouse/scripts.pory"
	lockall
# 75 "data/maps/LavenderTown_VolunteerPokemonHouse/scripts.pory"
	famechecker FAMECHECKER_MRFUJI, 2
# 76 "data/maps/LavenderTown_VolunteerPokemonHouse/scripts.pory"
	msgbox LavenderTown_VolunteerPokemonHouse_Text_GrandPrizeDrawingClipped
# 77 "data/maps/LavenderTown_VolunteerPokemonHouse/scripts.pory"
	releaseall
# 78 "data/maps/LavenderTown_VolunteerPokemonHouse/scripts.pory"
	end
# 79 "data/maps/LavenderTown_VolunteerPokemonHouse/scripts.pory"

# 80 "data/maps/LavenderTown_VolunteerPokemonHouse/scripts.pory"
LavenderTown_VolunteerPokemonHouse_EventScript_Bookshelf::
# 81 "data/maps/LavenderTown_VolunteerPokemonHouse/scripts.pory"
	msgbox LavenderTown_VolunteerPokemonHouse_Text_PokemonMagazinesLineShelf, MSGBOX_SIGN
# 82 "data/maps/LavenderTown_VolunteerPokemonHouse/scripts.pory"
	end
