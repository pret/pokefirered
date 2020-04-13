SaffronCity_CopycatsHouse_2F_MapScripts:: @ 816EB5C
	.byte 0

SaffronCity_CopycatsHouse_2F_EventScript_Doduo:: @ 816EB5D
	lock
	faceplayer
	waitse
	playmoncry SPECIES_DODUO, 0
	msgbox SaffronCity_CopycatsHouse_2F_Text_Doduo
	waitmoncry
	release
	end

SaffronCity_CopycatsHouse_2F_EventScript_Doll:: @ 816EB70
	lock
	msgbox SaffronCity_CopycatsHouse_2F_Text_RareMonOnlyDoll
	release
	end

SaffronCity_CopycatsHouse_2F_EventScript_Copycat:: @ 816EB7B
	goto_if_questlog EventScript_ReleaseEnd
	special QuestLog_CutRecording
	lock
	faceplayer
	checkitem ITEM_POKE_DOLL, 1
	compare VAR_RESULT, TRUE
	goto_if_eq EventScript_MimicTutor
	checkplayergender
	compare VAR_RESULT, MALE
	call_if_eq SaffronCity_CopycatsHouse_2F_EventScript_MimicPlayerMale
	compare VAR_RESULT, FEMALE
	call_if_eq SaffronCity_CopycatsHouse_2F_EventScript_MimicPlayerFemale
	release
	end

SaffronCity_CopycatsHouse_2F_EventScript_MimicPlayerMale:: @ 816EBB7
	msgbox SaffronCity_CopycatsHouse_2F_Text_MimickingFavoriteHobbyMale
	return

SaffronCity_CopycatsHouse_2F_EventScript_MimicPlayerFemale:: @ 816EBC0
	msgbox SaffronCity_CopycatsHouse_2F_Text_MimickingFavoriteHobbyFemale
	return

SaffronCity_CopycatsHouse_2F_EventScript_Computer:: @ 816EBC9
	msgbox SaffronCity_CopycatsHouse_2F_Text_MySecrets, MSGBOX_SIGN
	end

SaffronCity_CopycatsHouse_2F_EventScript_Game:: @ 816EBD2
	msgbox SaffronCity_CopycatsHouse_2F_Text_MarioWearingABucket, MSGBOX_SIGN
	end
