CinnabarIsland_PokemonLab_Lounge_MapScripts:: @ 816E2B8
	.byte 0

CinnabarIsland_PokemonLab_Lounge_EventScript_16E2B9:: @ 816E2B9
	msgbox gUnknown_8199FB3, 2
	end

CinnabarIsland_PokemonLab_Lounge_EventScript_16E2C2:: @ 816E2C2
	lock
	faceplayer
	setvar VAR_0x8008, 6
	call EventScript_1A8CAD
	goto_if_set FLAG_DID_ESPHERE_TRADE, EventScript_16E334
	msgbox gUnknown_81A59FE, MSGBOX_YESNO
	compare VAR_RESULT, 0
	goto_if_eq EventScript_16E31C
	call EventScript_1A8CBD
	compare VAR_0x8004, 6
	goto_if_ge EventScript_16E31C
	call EventScript_1A8CC9
	compare VAR_RESULT, VAR_0x8009
	goto_if_ne EventScript_16E326
	call EventScript_1A8CD9
	msgbox gUnknown_81A5A9D
	setflag FLAG_DID_ESPHERE_TRADE
	release
	end

EventScript_16E31C:: @ 816E31C
	msgbox gUnknown_81A5A4E
	release
	end

EventScript_16E326:: @ 816E326
	getspeciesname 0, VAR_0x8009
	msgbox gUnknown_81A5A6A
	release
	end

EventScript_16E334:: @ 816E334
	msgbox gUnknown_81A5AA5
	release
	end

CinnabarIsland_PokemonLab_Lounge_EventScript_16E33E:: @ 816E33E
	lock
	faceplayer
	setvar VAR_0x8008, 7
	copyvar VAR_0x8004, VAR_0x8008
	specialvar VAR_RESULT, GetInGameTradeSpeciesInfo
	copyvar VAR_0x8009, VAR_RESULT
	goto_if_set FLAG_DID_TANGENY_TRADE, EventScript_16E3D4
	msgbox gUnknown_81A5AD6, MSGBOX_YESNO
	compare VAR_RESULT, 0
	goto_if_eq EventScript_16E3BC
	special Special_ChooseMonFromParty
	waitstate
	copyvar VAR_0x800A, VAR_0x8004
	compare VAR_0x8004, 6
	goto_if_ge EventScript_16E3BC
	copyvar VAR_0x8005, VAR_0x800A
	specialvar VAR_RESULT, GetTradeSpecies
	copyvar VAR_0x800B, VAR_RESULT
	compare VAR_RESULT, VAR_0x8009
	goto_if_ne EventScript_16E3C6
	copyvar VAR_0x8004, VAR_0x8008
	copyvar VAR_0x8005, VAR_0x800A
	special CreateInGameTradePokemon
	special DoInGameTradeScene
	waitstate
	msgbox gUnknown_81A5B4A
	setflag FLAG_DID_TANGENY_TRADE
	release
	end

EventScript_16E3BC:: @ 816E3BC
	msgbox gUnknown_81A5B08
	release
	end

EventScript_16E3C6:: @ 816E3C6
	getspeciesname 0, VAR_0x8009
	msgbox gUnknown_81A5B18
	release
	end

EventScript_16E3D4:: @ 816E3D4
	msgbox gUnknown_81A5B60
	release
	end
