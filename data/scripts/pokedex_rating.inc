ProfOak_EventScript_RatePokedexInPerson:: @ 81A737B
	goto_if_questlog EventScript_ReleaseEnd
	special sub_8112364
	call_if_set FLAG_OAK_SAW_DEX_COMPLETION, ProfOak_EventScript_DexCompleteIntro
	call_if_unset FLAG_OAK_SAW_DEX_COMPLETION, ProfOak_EventScript_NormalIntro
	call ProfOak_EventScript_RatePokedex
	return

ProfOak_EventScript_DexCompleteIntro:: @ 81A73A4
	msgbox Text_LoveSeeingYourPokedex
	return

ProfOak_EventScript_NormalIntro:: @ 81A73AD
	msgbox Text_HowIsPokedexComingAlong
	return

ProfOak_EventScript_ShowRatingMsg:: @ 81A73B6
	copyvar VAR_0x8004, VAR_0x8009
	special Special_GetProfOaksRatingMessage
	waitmessage
	compare VAR_RESULT, FALSE
	call_if_eq ProfOak_EventScript_RatingFanfare
	compare VAR_RESULT, TRUE
	call_if_eq ProfOak_EventScript_DexCompleteFanfare
	waitfanfare
	waitbuttonpress
	return

ProfOak_EventScript_RatingFanfare:: @ 81A73D8
	playfanfare MUS_FAN2
	return

ProfOak_EventScript_DexCompleteFanfare:: @ 81A73DC
	playfanfare MUS_FANFA5
	return

ProfOak_EventScript_RatePokedex:: @ 81A73E0
	setvar VAR_0x8004, 31
	special HelpSystem_BackupSomeVariable
	special Special_SetSomeVariable
	setvar VAR_0x8004, 0
	specialvar VAR_RESULT, Special_GetPokedexCount
	copyvar VAR_0x8008, VAR_0x8005
	copyvar VAR_0x8009, VAR_0x8006
	copyvar VAR_0x800A, VAR_RESULT
	getnumberstring 0, VAR_0x8008 @ Num Kanto Seen
	getnumberstring 1, VAR_0x8009 @ Num Kanto Caught
	msgbox Text_YouveSeenXAndOwnedYMons
	call_if_unset FLAG_OAKS_RATING_IS_VIA_PC, ProfOak_EventScript_SetTextColor
	call ProfOak_EventScript_ShowRatingMsg
	compare VAR_0x800A, FALSE
	goto_if_eq ProfOak_EventScript_EndRatePokedex  @ National Dex not enabled
	setvar VAR_0x8004, 1
	specialvar VAR_RESULT, Special_GetPokedexCount
	copyvar VAR_0x8008, VAR_0x8005
	copyvar VAR_0x8009, VAR_0x8006
	getnumberstring 0, VAR_0x8008 @ Num National Seen
	getnumberstring 1, VAR_0x8009 @ Num National Caught
	msgbox Text_AndNationalDexSeenXOwnedY
	specialvar VAR_RESULT, HasAllMons
	compare VAR_RESULT, FALSE
	goto_if_eq ProfOak_EventScript_DexIncomplete
	compare VAR_RESULT, TRUE
	goto_if_eq ProfOak_EventScript_DexComplete
	end

ProfOak_EventScript_SetTextColor:: @ 81A746D
	textcolor 0
	return

ProfOak_EventScript_DexIncomplete:: @ 81A7470
	msgbox Text_LookForwardToFilledNationalDex
	goto ProfOak_EventScript_EndRatePokedex
	end

ProfOak_EventScript_DexComplete:: @ 81A747E
	setflag FLAG_OAK_SAW_DEX_COMPLETION
	msgbox Text_YouveCompletedDex
	goto ProfOak_EventScript_EndRatePokedex
	end

ProfOak_EventScript_EndRatePokedex:: @ 81A748F
	special HelpSystem_RestoreSomeVariable
	return
