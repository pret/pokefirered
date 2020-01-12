Route10_PokemonCenter_1F_MapScripts:: @ 816FC2F
	map_script MAP_SCRIPT_ON_TRANSITION, Route10_PokemonCenter_1F_OnTransition
	map_script MAP_SCRIPT_ON_RESUME, CableClub_OnResume
	.byte 0

Route10_PokemonCenter_1F_OnTransition:: @ 816FC3A
	setworldmapflag FLAG_WORLD_MAP_ROUTE10_POKEMON_CENTER_1F
	setrespawn SPAWN_ROUTE10
	end

Route10_PokemonCenter_1F_EventScript_16FC41:: @ 816FC41
	lock
	faceplayer
	call EventScript_PkmnCenterNurse
	release
	end

Route10_PokemonCenter_1F_EventScript_16FC4A:: @ 816FC4A
	msgbox gUnknown_819E59D, MSGBOX_NPC
	end

Route10_PokemonCenter_1F_EventScript_16FC53:: @ 816FC53
	msgbox gUnknown_819E523, MSGBOX_NPC
	end

Route10_PokemonCenter_1F_EventScript_16FC5C:: @ 816FC5C
	msgbox gUnknown_819E5D2, MSGBOX_NPC
	end

Route10_PokemonCenter_1F_EventScript_16FC65:: @ 816FC65
	lock
	faceplayer
	call EventScript_16FCF1
	goto_if_set FLAG_GOT_EVERSTONE_FROM_OAKS_AIDE, EventScript_16FCE7
	msgbox gUnknown_819E5FB, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq EventScript_1A7AD1
	setvar VAR_0x8004, 0
	specialvar VAR_RESULT, Special_GetPokedexCount
	getnumberstring 2, VAR_0x8006
	call EventScript_16FCF1
	compare VAR_0x8006, 20
	goto_if_lt EventScript_1A7ABD
	msgbox gUnknown_819E733
	checkitemspace ITEM_EVERSTONE, 1
	compare VAR_RESULT, FALSE
	goto_if_eq EventScript_1A7AC7
	giveitem_msg gUnknown_819E786, ITEM_EVERSTONE
	setflag FLAG_GOT_EVERSTONE_FROM_OAKS_AIDE
	msgbox gUnknown_819E7AF
	release
	end

EventScript_16FCE7:: @ 816FCE7
	msgbox gUnknown_819E7AF
	release
	end

EventScript_16FCF1:: @ 816FCF1
	getnumberstring 0, 20
	getitemname 1, ITEM_EVERSTONE
	return
