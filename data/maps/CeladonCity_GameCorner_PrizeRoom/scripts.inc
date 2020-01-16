CeladonCity_GameCorner_PrizeRoom_MapScripts:: @ 816CB75
	.byte 0

CeladonCity_GameCorner_PrizeRoom_EventScript_16CB76:: @ 816CB76
	msgbox gUnknown_8196FC1, MSGBOX_NPC
	end

CeladonCity_GameCorner_PrizeRoom_EventScript_16CB7F:: @ 816CB7F
	msgbox gUnknown_8196FFF, MSGBOX_NPC
	end

CeladonCity_GameCorner_PrizeRoom_EventScript_16CB88:: @ 816CB88
	lock
	faceplayer
	goto_if_unset FLAG_GOT_COIN_CASE, EventScript_16CD99
	goto_if_questlog EventScript_ReleaseEnd
	showcoinsbox 0, 0
	msgbox gUnknown_8197057
	goto EventScript_16CBB2
	end

EventScript_16CBB2:: @ 816CBB2
	message Text_19707A
	waitmessage
	multichoice 11, 0, MULTICHOICE_GAME_CORNER_POKEMON_PRIZES, FALSE
	switch VAR_RESULT
	case 0, EventScript_16CC15
	case 1, EventScript_16CC25
	case 2, EventScript_16CC35
	case 3, EventScript_16CC45
	case 4, EventScript_16CC55
	case 5, EventScript_16CC10
	case 127, EventScript_16CC10
	end

EventScript_16CC10:: @ 816CC10
	hidecoinsbox 0, 0
	release
	end

EventScript_16CC15:: @ 816CC15
	.ifdef FIRERED
	setvar VAR_TEMP_1, SPECIES_ABRA
	setvar VAR_TEMP_2, 180
	.else
	.ifdef LEAFGREEN
	setvar VAR_TEMP_1, SPECIES_ABRA
	setvar VAR_TEMP_2, 120
	.endif
	.endif
	goto EventScript_16CC65
	end

EventScript_16CC25:: @ 816CC25
	.ifdef FIRERED
	setvar VAR_TEMP_1, SPECIES_CLEFAIRY
	setvar VAR_TEMP_2, 500
	.else
	.ifdef LEAFGREEN
	setvar VAR_TEMP_1, SPECIES_CLEFAIRY
	setvar VAR_TEMP_2, 750
	.endif
	.endif
	goto EventScript_16CC65
	end

EventScript_16CC35:: @ 816CC35
	.ifdef FIRERED
	setvar VAR_TEMP_1, SPECIES_DRATINI
	setvar VAR_TEMP_2, 2800
	.else
	.ifdef LEAFGREEN
	setvar VAR_TEMP_1, SPECIES_PINSIR
	setvar VAR_TEMP_2, 2500
	.endif
	.endif
	goto EventScript_16CC65
	end

EventScript_16CC45:: @ 816CC45
	.ifdef FIRERED
	setvar VAR_TEMP_1, SPECIES_SCYTHER
	setvar VAR_TEMP_2, 5500
	.else
	.ifdef LEAFGREEN
	setvar VAR_TEMP_1, SPECIES_DRATINI
	setvar VAR_TEMP_2, 4600
	.endif
	.endif
	goto EventScript_16CC65
	end

EventScript_16CC55:: @ 816CC55
	.ifdef FIRERED
	setvar VAR_TEMP_1, SPECIES_PORYGON
	setvar VAR_TEMP_2, 9999
	.else
	.ifdef LEAFGREEN
	setvar VAR_TEMP_1, SPECIES_PORYGON
	setvar VAR_TEMP_2, 6500
	.endif
	.endif
	goto EventScript_16CC65
	end

EventScript_16CC65:: @ 816CC65
	getspeciesname 0, VAR_TEMP_1
	msgbox gUnknown_819709D, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq EventScript_16CC10
	checkcoins VAR_RESULT
	compare VAR_RESULT, VAR_TEMP_2
	goto_if_lt EventScript_16CDA5
	textcolor 3
	switch VAR_TEMP_1
	case SPECIES_ABRA, EventScript_16CCD4
	case SPECIES_CLEFAIRY, EventScript_16CCE9
	case SPECIES_DRATINI, EventScript_16CCFE
	case SPECIES_SCYTHER, EventScript_16CD13
	case SPECIES_PORYGON, EventScript_16CD28
	case SPECIES_PINSIR, EventScript_16CD3D
	end

EventScript_16CCD4:: @ 816CCD4
	.ifdef FIRERED
	givemon VAR_TEMP_1, 9, ITEM_NONE
	.else
	.ifdef LEAFGREEN
	givemon VAR_TEMP_1, 7, ITEM_NONE
	.endif
	.endif
	goto EventScript_16CD52
	end

EventScript_16CCE9:: @ 816CCE9
	.ifdef FIRERED
	givemon VAR_TEMP_1, 8, ITEM_NONE
	.else
	.ifdef LEAFGREEN
	givemon VAR_TEMP_1, 12, ITEM_NONE
	.endif
	.endif
	goto EventScript_16CD52
	end

EventScript_16CCFE:: @ 816CCFE
	.ifdef FIRERED
	givemon VAR_TEMP_1, 18, ITEM_NONE
	.else
	.ifdef LEAFGREEN
	givemon VAR_TEMP_1, 24, ITEM_NONE
	.endif
	.endif
	goto EventScript_16CD52
	end

EventScript_16CD13:: @ 816CD13
	givemon VAR_TEMP_1, 25, ITEM_NONE
	goto EventScript_16CD52
	end

EventScript_16CD28:: @ 816CD28
	.ifdef FIRERED
	givemon VAR_TEMP_1, 26, ITEM_NONE
	.else
	.ifdef LEAFGREEN
	givemon VAR_TEMP_1, 18, ITEM_NONE
	.endif
	.endif
	goto EventScript_16CD52
	end

EventScript_16CD3D:: @ 816CD3D
	givemon VAR_TEMP_1, 18, ITEM_NONE
	goto EventScript_16CD52
	end

EventScript_16CD52:: @ 816CD52
	compare VAR_RESULT, 0
	goto_if_eq EventScript_16CDB3
	compare VAR_RESULT, 1
	goto_if_eq EventScript_16CDE0
	compare VAR_RESULT, 2
	goto_if_eq EventScript_16CD74
	end

EventScript_16CD74:: @ 816CD74
	textcolor 3
	msgbox gUnknown_81A5E31
	hidecoinsbox 0, 0
	release
	end

EventScript_16CD83:: @ 816CD83
	getpartysize
	subvar VAR_RESULT, 1
	copyvar VAR_0x8004, VAR_RESULT
	call EventScript_ChangePokemonNickname
	goto EventScript_16CC10
	end

EventScript_16CD99:: @ 816CD99
	textcolor 3
	msgbox gUnknown_819703E
	release
	end

EventScript_16CDA5:: @ 816CDA5
	msgbox gUnknown_81970D5
	goto EventScript_16CC10
	end

EventScript_16CDB3:: @ 816CDB3
	removecoins VAR_TEMP_2
	updatecoinsbox 0, 5
	getspeciesname 0, VAR_TEMP_1
	playfanfare MUS_FANFA1
	message Text_1A5DF1
	waitmessage
	waitfanfare
	msgbox gUnknown_81A56A7, MSGBOX_YESNO
	compare VAR_RESULT, YES
	goto_if_eq EventScript_16CD83
	goto EventScript_16CC10
	end

EventScript_16CDE0:: @ 816CDE0
	removecoins VAR_TEMP_2
	updatecoinsbox 0, 5
	getspeciesname 0, VAR_TEMP_1
	playfanfare MUS_FANFA1
	message Text_1A5DF1
	waitmessage
	waitfanfare
	msgbox gUnknown_81A56A7, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq EventScript_16CE12
	call EventScript_1A8C33
	goto EventScript_16CE12
	end

EventScript_16CE12:: @ 816CE12
	call EventScript_1A8C3C
	goto EventScript_16CC10
	end

CeladonCity_GameCorner_PrizeRoom_EventScript_16CE1D:: @ 816CE1D
	lock
	faceplayer
	goto_if_unset FLAG_GOT_COIN_CASE, EventScript_16CD99
	goto_if_questlog EventScript_ReleaseEnd
	showcoinsbox 0, 0
	msgbox gUnknown_8197057
	goto EventScript_16CE47
	end

EventScript_16CE47:: @ 816CE47
	message Text_19707A
	waitmessage
	multichoice 11, 0, MULTICHOICE_GAME_CORNER_TMPRIZES, FALSE
	switch VAR_RESULT
	case 0, EventScript_16CEA5
	case 1, EventScript_16CEB9
	case 2, EventScript_16CECD
	case 3, EventScript_16CEE1
	case 4, EventScript_16CEF5
	case 5, EventScript_16CC10
	case 127, EventScript_16CC10
	end

EventScript_16CEA5:: @ 816CEA5
	setvar VAR_TEMP_1, ITEM_TM13
	setvar VAR_TEMP_2, 4000
	getmovename 1, MOVE_ICE_BEAM
	goto EventScript_16CF09
	end

EventScript_16CEB9:: @ 816CEB9
	setvar VAR_TEMP_1, ITEM_TM23
	setvar VAR_TEMP_2, 3500
	getmovename 1, MOVE_IRON_TAIL
	goto EventScript_16CF09
	end

EventScript_16CECD:: @ 816CECD
	setvar VAR_TEMP_1, ITEM_TM24
	setvar VAR_TEMP_2, 4000
	getmovename 1, MOVE_THUNDERBOLT
	goto EventScript_16CF09
	end

EventScript_16CEE1:: @ 816CEE1
	setvar VAR_TEMP_1, ITEM_TM30
	setvar VAR_TEMP_2, 4500
	getmovename 1, MOVE_SHADOW_BALL
	goto EventScript_16CF09
	end

EventScript_16CEF5:: @ 816CEF5
	setvar VAR_TEMP_1, ITEM_TM35
	setvar VAR_TEMP_2, 4000
	getmovename 1, MOVE_FLAMETHROWER
	goto EventScript_16CF09
	end

EventScript_16CF09:: @ 816CF09
	msgbox gUnknown_81970B2, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq EventScript_16CC10
	goto EventScript_16CF3F
	end

EventScript_16CF22:: @ 816CF22
	getitemname 0, VAR_TEMP_1
	msgbox gUnknown_819709D, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq EventScript_16CC10
	goto EventScript_16CF3F
	end

EventScript_16CF3F:: @ 816CF3F
	getitemname 0, VAR_TEMP_1
	checkcoins VAR_RESULT
	compare VAR_RESULT, VAR_TEMP_2
	goto_if_lt EventScript_16CDA5
	checkitemspace VAR_TEMP_1, 1
	compare VAR_RESULT, FALSE
	goto_if_eq EventScript_16CF79
	removecoins VAR_TEMP_2
	updatecoinsbox 0, 5
	giveitem VAR_TEMP_1
	goto EventScript_16CC10
	end

EventScript_16CF79:: @ 816CF79
	textcolor 3
	msgbox Text_TooBadBagFull
	hidecoinsbox 0, 0
	release
	end

CeladonCity_GameCorner_PrizeRoom_EventScript_16CF88:: @ 816CF88
	lock
	faceplayer
	goto_if_unset FLAG_GOT_COIN_CASE, EventScript_16CD99
	goto_if_questlog EventScript_ReleaseEnd
	showcoinsbox 0, 0
	msgbox gUnknown_8197057
	goto EventScript_16CFB2
	end

EventScript_16CFB2:: @ 816CFB2
	message Text_19707A
	waitmessage
	multichoice 10, 0, MULTICHOICE_GAME_CORNER_BATTLE_ITEM_PRIZES, FALSE
	switch VAR_RESULT
	case 0, EventScript_16D010
	case 1, EventScript_16D020
	case 2, EventScript_16D030
	case 3, EventScript_16D040
	case 4, EventScript_16D050
	case 5, EventScript_16CC10
	case 127, EventScript_16CC10
	end

EventScript_16D010:: @ 816D010
	setvar VAR_TEMP_1, ITEM_SMOKE_BALL
	setvar VAR_TEMP_2, 800
	goto EventScript_16CF22
	end

EventScript_16D020:: @ 816D020
	setvar VAR_TEMP_1, ITEM_MIRACLE_SEED
	setvar VAR_TEMP_2, 1000
	goto EventScript_16CF22
	end

EventScript_16D030:: @ 816D030
	setvar VAR_TEMP_1, ITEM_CHARCOAL
	setvar VAR_TEMP_2, 1000
	goto EventScript_16CF22
	end

EventScript_16D040:: @ 816D040
	setvar VAR_TEMP_1, ITEM_MYSTIC_WATER
	setvar VAR_TEMP_2, 1000
	goto EventScript_16CF22
	end

EventScript_16D050:: @ 816D050
	setvar VAR_TEMP_1, ITEM_YELLOW_FLUTE
	setvar VAR_TEMP_2, 1600
	goto EventScript_16CF22
	end
