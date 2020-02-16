CeladonCity_GameCorner_EventScript_PhotoPrinter:: @ 81B2867
	lockall
	showmoneybox 0, 0, 0
	msgbox gUnknown_81B1D7D, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq EventScript_1B2926
	checkmoney 50, 0
	compare VAR_RESULT, FALSE
	goto_if_eq EventScript_1B292B
	playse SE_SHOP
	removemoney 50, 0
	updatemoneybox 0, 0, 0
	waitse
	message gUnknown_81B1E24
	waitmessage
	multichoice 21, 0, MULTICHOICE_TRAINER_CARD_ICON_TINT, TRUE
	switch VAR_RESULT
	case 0, EventScript_1B28DB
	case 1, EventScript_1B28E6
	case 2, EventScript_1B28F1
	case 3, EventScript_1B28FC
	end

EventScript_1B28DB:: @ 81B28DB
	setvar VAR_0x8004, 0
	goto EventScript_1B2907
	end

EventScript_1B28E6:: @ 81B28E6
	setvar VAR_0x8004, 1
	goto EventScript_1B2907
	end

EventScript_1B28F1:: @ 81B28F1
	setvar VAR_0x8004, 2
	goto EventScript_1B2907
	end

EventScript_1B28FC:: @ 81B28FC
	setvar VAR_0x8004, 3
	goto EventScript_1B2907
	end

EventScript_1B2907:: @ 81B2907
	message gUnknown_81B1E42
	waitmessage
	playse MUS_ME_PHOTO
	dofieldeffect FLDEFF_UNK_45
	delay 60
	special Special_UpdateTrainerCardPhotoIcons
	msgbox gUnknown_81B1E7D
	hidemoneybox 0, 0
	releaseall
	end

EventScript_1B2926:: @ 81B2926
	hidemoneybox 0, 0
	releaseall
	end

EventScript_1B292B:: @ 81B292B
	msgbox gUnknown_81B1E07
	hidemoneybox 0, 0
	releaseall
	end

FourIsland_House2_EventScript_1B2938:: @ 81B2938
	lock
	specialvar VAR_0x8008, Special_StickerLadyGetBragFlags
	goto_if_unset FLAG_MET_STICKER_LADY, EventScript_1B2951
	goto_if_set FLAG_MET_STICKER_LADY, EventScript_1B2994
	end

EventScript_1B2951:: @ 81B2951
	setflag FLAG_MET_STICKER_LADY
	msgbox gUnknown_81B1EB3
	applymovement 1, Movement_FacePlayer
	waitmovement 0
	playse SE_PIN
	applymovement 1, Movement_ExclamationMark
	waitmovement 0
	applymovement 1, Movement_Delay48
	waitmovement 0
	compare VAR_0x8008, 0
	goto_if_eq EventScript_1B2B8E
	message gUnknown_81B1EF8
	waitmessage
	goto EventScript_1B29D0
	end

EventScript_1B2994:: @ 81B2994
	applymovement 1, Movement_FacePlayer
	waitmovement 0
	goto_if_questlog EventScript_ReleaseEnd
	special sub_8112364
	compare VAR_0x8008, 0
	goto_if_eq EventScript_1B29C6
	message gUnknown_81B2025
	waitmessage
	goto EventScript_1B29D0
	end

EventScript_1B29C6:: @ 81B29C6
	msgbox gUnknown_81B1FEF
	release
	end

EventScript_1B29D0:: @ 81B29D0
	switch VAR_0x8008
	case 1, EventScript_1B2A23
	case 2, EventScript_1B2A4F
	case 4, EventScript_1B2A7B
	case 3, EventScript_1B2AA7
	case 5, EventScript_1B2ADE
	case 6, EventScript_1B2B15
	case 7, EventScript_1B2B4C
	end

EventScript_1B2A23:: @ 81B2A23
	multichoice 15, 8, MULTICHOICE_HOF_QUIT, FALSE
	switch VAR_RESULT
	case 0, EventScript_1B2B98
	case 1, EventScript_1B2DF6
	case SCR_MENU_CANCEL, EventScript_1B2DF6
	end

EventScript_1B2A4F:: @ 81B2A4F
	multichoice 16, 8, MULTICHOICE_EGGS_QUIT, FALSE
	switch VAR_RESULT
	case 0, EventScript_1B2C62
	case 1, EventScript_1B2DF6
	case SCR_MENU_CANCEL, EventScript_1B2DF6
	end

EventScript_1B2A7B:: @ 81B2A7B
	multichoice 15, 8, MULTICHOICE_VICTORIES_QUIT, FALSE
	switch VAR_RESULT
	case 0, EventScript_1B2D2C
	case 1, EventScript_1B2DF6
	case SCR_MENU_CANCEL, EventScript_1B2DF6
	end

EventScript_1B2AA7:: @ 81B2AA7
	multichoice 15, 6, MULTICHOICE_HOF_EGGS_QUIT, FALSE
	switch VAR_RESULT
	case 0, EventScript_1B2B98
	case 1, EventScript_1B2C62
	case 2, EventScript_1B2DF6
	case SCR_MENU_CANCEL, EventScript_1B2DF6
	end

EventScript_1B2ADE:: @ 81B2ADE
	multichoice 15, 6, MULTICHOICE_HOF_VICTORIES_QUIT, FALSE
	switch VAR_RESULT
	case 0, EventScript_1B2B98
	case 1, EventScript_1B2D2C
	case 2, EventScript_1B2DF6
	case SCR_MENU_CANCEL, EventScript_1B2DF6
	end

EventScript_1B2B15:: @ 81B2B15
	multichoice 15, 6, MULTICHOICE_EGGS_VICTORIES_QUIT, FALSE
	switch VAR_RESULT
	case 0, EventScript_1B2C62
	case 1, EventScript_1B2D2C
	case 2, EventScript_1B2DF6
	case SCR_MENU_CANCEL, EventScript_1B2DF6
	end

EventScript_1B2B4C:: @ 81B2B4C
	multichoice 15, 5, MULTICHOICE_HOF_EGGS_VICTORIES_QUIT, FALSE
	switch VAR_RESULT
	case 0, EventScript_1B2B98
	case 1, EventScript_1B2C62
	case 2, EventScript_1B2D2C
	case 3, EventScript_1B2DF6
	case SCR_MENU_CANCEL, EventScript_1B2DF6
	end

EventScript_1B2B8E:: @ 81B2B8E
	msgbox gUnknown_81B1EF8
	release
	end

EventScript_1B2B98:: @ 81B2B98
	compare VAR_0x8004, 39
	goto_if_le EventScript_1B2BC5
	compare VAR_0x8004, 99
	goto_if_le EventScript_1B2BE3
	compare VAR_0x8004, 199
	goto_if_le EventScript_1B2C01
	compare VAR_0x8004, 200
	goto_if_ge EventScript_1B2C1F
	end

EventScript_1B2BC5:: @ 81B2BC5
	compare VAR_HOF_BRAG_STATE, 1
	goto_if_eq EventScript_1B2C3D
	setvar VAR_HOF_BRAG_STATE, 1
	msgbox gUnknown_81B206E
	goto EventScript_1B2C51

EventScript_1B2BE2:: @ 81B2BE2
	end

EventScript_1B2BE3:: @ 81B2BE3
	compare VAR_HOF_BRAG_STATE, 2
	goto_if_eq EventScript_1B2C3D
	setvar VAR_HOF_BRAG_STATE, 2
	msgbox gUnknown_81B20CF
	goto EventScript_1B2C51

EventScript_1B2C00:: @ 81B2C00
	end

EventScript_1B2C01:: @ 81B2C01
	compare VAR_HOF_BRAG_STATE, 3
	goto_if_eq EventScript_1B2C3D
	setvar VAR_HOF_BRAG_STATE, 3
	msgbox gUnknown_81B2133
	goto EventScript_1B2C51

EventScript_1B2C1E:: @ 81B2C1E
	end

EventScript_1B2C1F:: @ 81B2C1F
	compare VAR_HOF_BRAG_STATE, 4
	goto_if_eq EventScript_1B2C47
	setvar VAR_HOF_BRAG_STATE, 4
	msgbox gUnknown_81B21C4
	goto EventScript_1B2C51

EventScript_1B2C3C:: @ 81B2C3C
	end

EventScript_1B2C3D:: @ 81B2C3D
	msgbox gUnknown_81B227C
	release
	end

EventScript_1B2C47:: @ 81B2C47
	msgbox gUnknown_81B22B0
	release
	end

EventScript_1B2C51:: @ 81B2C51
	textcolor 3
	playfanfare MUS_FANFA1
	message gUnknown_81B2242
	waitmessage
	waitfanfare
	delay 90
	release
	end

EventScript_1B2C62:: @ 81B2C62
	compare VAR_0x8005, 99
	goto_if_le EventScript_1B2C8F
	compare VAR_0x8005, 199
	goto_if_le EventScript_1B2CAD
	compare VAR_0x8005, 299
	goto_if_le EventScript_1B2CCB
	compare VAR_0x8005, 300
	goto_if_ge EventScript_1B2CE9
	end

EventScript_1B2C8F:: @ 81B2C8F
	compare VAR_EGG_BRAG_STATE, 1
	goto_if_eq EventScript_1B2D07
	setvar VAR_EGG_BRAG_STATE, 1
	msgbox gUnknown_81B2308
	goto EventScript_1B2D1B
	end

EventScript_1B2CAD:: @ 81B2CAD
	compare VAR_EGG_BRAG_STATE, 2
	goto_if_eq EventScript_1B2D07
	setvar VAR_EGG_BRAG_STATE, 2
	msgbox gUnknown_81B2372
	goto EventScript_1B2D1B
	end

EventScript_1B2CCB:: @ 81B2CCB
	compare VAR_EGG_BRAG_STATE, 3
	goto_if_eq EventScript_1B2D07
	setvar VAR_EGG_BRAG_STATE, 3
	msgbox gUnknown_81B23E0
	goto EventScript_1B2D1B
	end

EventScript_1B2CE9:: @ 81B2CE9
	compare VAR_EGG_BRAG_STATE, 4
	goto_if_eq EventScript_1B2D11
	setvar VAR_EGG_BRAG_STATE, 4
	msgbox gUnknown_81B2448
	goto EventScript_1B2D1B
	end

EventScript_1B2D07:: @ 81B2D07
	msgbox gUnknown_81B251B
	release
	end

EventScript_1B2D11:: @ 81B2D11
	msgbox gUnknown_81B254F
	release
	end

EventScript_1B2D1B:: @ 81B2D1B
	textcolor 3
	playfanfare MUS_FANFA1
	message gUnknown_81B24EA
	waitmessage
	waitfanfare
	delay 90
	release
	end

EventScript_1B2D2C:: @ 81B2D2C
	compare VAR_0x8006, 19
	goto_if_le EventScript_1B2D59
	compare VAR_0x8006, 49
	goto_if_le EventScript_1B2D77
	compare VAR_0x8006, 99
	goto_if_le EventScript_1B2D95
	compare VAR_0x8006, 100
	goto_if_ge EventScript_1B2DB3
	end

EventScript_1B2D59:: @ 81B2D59
	compare VAR_LINK_WIN_BRAG_STATE, 1
	goto_if_eq EventScript_1B2DD1
	setvar VAR_LINK_WIN_BRAG_STATE, 1
	msgbox gUnknown_81B25A7
	goto EventScript_1B2DE5
	end

EventScript_1B2D77:: @ 81B2D77
	compare VAR_LINK_WIN_BRAG_STATE, 2
	goto_if_eq EventScript_1B2DD1
	setvar VAR_LINK_WIN_BRAG_STATE, 2
	msgbox gUnknown_81B2609
	goto EventScript_1B2DE5
	end

EventScript_1B2D95:: @ 81B2D95
	compare VAR_LINK_WIN_BRAG_STATE, 3
	goto_if_eq EventScript_1B2DD1
	setvar VAR_LINK_WIN_BRAG_STATE, 3
	msgbox gUnknown_81B267B
	goto EventScript_1B2DE5
	end

EventScript_1B2DB3:: @ 81B2DB3
	compare VAR_LINK_WIN_BRAG_STATE, 4
	goto_if_eq EventScript_1B2DDB
	setvar VAR_LINK_WIN_BRAG_STATE, 4
	msgbox gUnknown_81B26F6
	goto EventScript_1B2DE5
	end

EventScript_1B2DD1:: @ 81B2DD1
	msgbox gUnknown_81B27DB
	release
	end

EventScript_1B2DDB:: @ 81B2DDB
	msgbox gUnknown_81B280F
	release
	end

EventScript_1B2DE5:: @ 81B2DE5
	textcolor 3
	playfanfare MUS_FANFA1
	message gUnknown_81B27A6
	waitmessage
	waitfanfare
	delay 90
	release
	end

EventScript_1B2DF6:: @ 81B2DF6
	release
	end
