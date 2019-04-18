LavenderTown_VolunteerPokemonHouse_EventObjects:
	object_event 1, 78, 0, 3, 0, 3, 0, 3, 8, 17, 0, 0, 0, 0, 0, LavenderTown_VolunteerPokemonHouse_EventScript_16B14A, 53, 0, 0
	object_event 2, 124, 0, 1, 0, 4, 0, 3, 1, 17, 0, 0, 0, 0, 0, LavenderTown_VolunteerPokemonHouse_EventScript_16B1EB, 0, 0, 0
	object_event 3, 121, 0, 9, 0, 6, 0, 3, 7, 17, 0, 0, 0, 0, 0, LavenderTown_VolunteerPokemonHouse_EventScript_16B1FE, 0, 0, 0
	object_event 4, 16, 0, 9, 0, 5, 0, 3, 8, 17, 0, 0, 0, 0, 0, LavenderTown_VolunteerPokemonHouse_EventScript_16B1C3, 0, 0, 0
	object_event 5, 18, 0, 3, 0, 5, 0, 3, 1, 17, 0, 0, 0, 0, 0, LavenderTown_VolunteerPokemonHouse_EventScript_16B1CC, 0, 0, 0
	object_event 6, 17, 0, 7, 0, 2, 0, 3, 1, 17, 0, 0, 0, 0, 0, LavenderTown_VolunteerPokemonHouse_EventScript_16B1AA, 0, 0, 0

LavenderTown_VolunteerPokemonHouse_MapWarps:
	warp_def 3, 7, 3, 2, 772
	warp_def 4, 7, 3, 2, 772
	warp_def 5, 7, 3, 2, 772

LavenderTown_VolunteerPokemonHouse_MapBGEvents:
	bg_event 5, 4, 0, 0, 0, LavenderTown_VolunteerPokemonHouse_EventScript_16B211
	bg_event 3, 1, 0, 0, 0, LavenderTown_VolunteerPokemonHouse_EventScript_16B229
	bg_event 4, 1, 0, 0, 0, LavenderTown_VolunteerPokemonHouse_EventScript_16B229

LavenderTown_VolunteerPokemonHouse_MapEvents::
	map_events LavenderTown_VolunteerPokemonHouse_EventObjects, LavenderTown_VolunteerPokemonHouse_MapWarps, 0x0, LavenderTown_VolunteerPokemonHouse_MapBGEvents
