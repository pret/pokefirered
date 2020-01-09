Route4_PokemonCenter_1F_MapScripts:: @ 816F739
	map_script MAP_SCRIPT_ON_TRANSITION, Route4_PokemonCenter_1F_OnTransition
	map_script MAP_SCRIPT_ON_RESUME, Route4_PokemonCenter_1F_MapScript2_1BC05C
	.byte 0

Route4_PokemonCenter_1F_OnTransition:: @ 816F744
	setworldmapflag FLAG_WORLD_MAP_ROUTE4_POKEMON_CENTER_1F
	setrespawn SPAWN_ROUTE4
	end

Route4_PokemonCenter_1F_EventScript_16F74B:: @ 816F74B
	msgbox gUnknown_819D9D4, 2
	end

Route4_PokemonCenter_1F_EventScript_16F754:: @ 816F754
	lock
	msgbox gUnknown_819DA3A
	release
	end

Route4_PokemonCenter_1F_EventScript_16F75F:: @ 816F75F
	lock
	faceplayer
	checkflag FLAG_BOUGHT_MAGIKARP
	goto_if TRUE, EventScript_16F8A2
	showmoneybox 0, 0, 0
	checkplayergender
	compare VAR_RESULT, 0
	goto_if eq, EventScript_16F786
	compare VAR_RESULT, 1
	goto_if eq, EventScript_16F794
	end

EventScript_16F786:: @ 816F786
	msgbox gUnknown_819DA9A, MSGBOX_YESNO
	goto EventScript_16F7A2
	end

EventScript_16F794:: @ 816F794
	msgbox gUnknown_819DB34, MSGBOX_YESNO
	goto EventScript_16F7A2
	end

EventScript_16F7A2:: @ 816F7A2
	compare VAR_RESULT, 0
	goto_if eq, EventScript_16F888
	checkmoney 500, 0
	compare VAR_RESULT, 0
	goto_if eq, EventScript_16F895
	textcolor 3
	setvar VAR_0x4001, 129
	givemon SPECIES_MAGIKARP, 5, ITEM_NONE, 0, 0, 0
	compare VAR_RESULT, 0
	goto_if eq, EventScript_16F7F6
	compare VAR_RESULT, 1
	goto_if eq, EventScript_16F822
	compare VAR_RESULT, 2
	goto_if eq, EventScript_16F8AC
	end

EventScript_16F7F6:: @ 816F7F6
	call EventScript_16F86F
	msgbox gUnknown_81A56A7, MSGBOX_YESNO
	compare VAR_RESULT, 0
	goto_if eq, EventScript_16F861
	call EventScript_1A8C27
	fadescreen 1
	hidemoneybox 0, 0
	special ChangePokemonNickname
	waitstate
	goto EventScript_16F86A
	end

EventScript_16F822:: @ 816F822
	call EventScript_16F86F
	msgbox gUnknown_81A56A7, MSGBOX_YESNO
	compare VAR_RESULT, 0
	goto_if eq, EventScript_16F84B
	fadescreen 1
	hidemoneybox 0, 0
	special ChangeBoxPokemonNickname
	waitstate
	lock
	faceplayer
	goto EventScript_16F856
	end

EventScript_16F84B:: @ 816F84B
	call EventScript_1A8C3C
	goto EventScript_16F861
	end

EventScript_16F856:: @ 816F856
	call EventScript_1A8C3C
	goto EventScript_16F86A
	end

EventScript_16F861:: @ 816F861
	hidemoneybox 0, 0
	goto EventScript_16F86A
	end

EventScript_16F86A:: @ 816F86A
	setflag FLAG_BOUGHT_MAGIKARP
	release
	end

EventScript_16F86F:: @ 816F86F
	takemoney 500, 0
	updatemoneybox 0, 0, 0
	playfanfare MUS_FANFA1
	message Text_19DBD3
	waitmessage
	waitfanfare
	getspeciesname 0, SPECIES_MAGIKARP
	return

EventScript_16F888:: @ 816F888
	msgbox gUnknown_819DC07
	hidemoneybox 0, 0
	release
	end

EventScript_16F895:: @ 816F895
	msgbox gUnknown_819DC78
	hidemoneybox 0, 0
	release
	end

EventScript_16F8A2:: @ 816F8A2
	msgbox gUnknown_819DC9A
	release
	end

EventScript_16F8AC:: @ 816F8AC
	textcolor 0
	msgbox gUnknown_819DC3E
	hidemoneybox 0, 0
	release
	end

Route4_PokemonCenter_1F_EventScript_16F8BB:: @ 816F8BB
	lock
	faceplayer
	call EventScript_PkmnCenterNurse
	release
	end

Route4_PokemonCenter_1F_EventScript_16F8C4:: @ 816F8C4
	msgbox gUnknown_819DCDB, 2
	end

Route4_PokemonCenter_1F_EventScript_16F8CD:: @ 816F8CD
	lock
	msgbox gUnknown_819DD54
	release
	end
