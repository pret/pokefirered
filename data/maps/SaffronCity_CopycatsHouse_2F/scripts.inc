# 1 "data/maps/SaffronCity_CopycatsHouse_2F/scripts.pory"

# 2 "data/maps/SaffronCity_CopycatsHouse_2F/scripts.pory"
SaffronCity_CopycatsHouse_2F_MapScripts::
# 3 "data/maps/SaffronCity_CopycatsHouse_2F/scripts.pory"
	.byte 0
# 4 "data/maps/SaffronCity_CopycatsHouse_2F/scripts.pory"

# 5 "data/maps/SaffronCity_CopycatsHouse_2F/scripts.pory"
SaffronCity_CopycatsHouse_2F_EventScript_Doduo::
# 6 "data/maps/SaffronCity_CopycatsHouse_2F/scripts.pory"
	lock
# 7 "data/maps/SaffronCity_CopycatsHouse_2F/scripts.pory"
	faceplayer
# 8 "data/maps/SaffronCity_CopycatsHouse_2F/scripts.pory"
	waitse
# 9 "data/maps/SaffronCity_CopycatsHouse_2F/scripts.pory"
	playmoncry SPECIES_DODUO, CRY_MODE_NORMAL
# 10 "data/maps/SaffronCity_CopycatsHouse_2F/scripts.pory"
	msgbox SaffronCity_CopycatsHouse_2F_Text_Doduo
# 11 "data/maps/SaffronCity_CopycatsHouse_2F/scripts.pory"
	waitmoncry
# 12 "data/maps/SaffronCity_CopycatsHouse_2F/scripts.pory"
	release
# 13 "data/maps/SaffronCity_CopycatsHouse_2F/scripts.pory"
	end
# 14 "data/maps/SaffronCity_CopycatsHouse_2F/scripts.pory"

# 15 "data/maps/SaffronCity_CopycatsHouse_2F/scripts.pory"
SaffronCity_CopycatsHouse_2F_EventScript_Doll::
# 16 "data/maps/SaffronCity_CopycatsHouse_2F/scripts.pory"
	lock
# 17 "data/maps/SaffronCity_CopycatsHouse_2F/scripts.pory"
	msgbox SaffronCity_CopycatsHouse_2F_Text_RareMonOnlyDoll
# 18 "data/maps/SaffronCity_CopycatsHouse_2F/scripts.pory"
	release
# 19 "data/maps/SaffronCity_CopycatsHouse_2F/scripts.pory"
	end
# 20 "data/maps/SaffronCity_CopycatsHouse_2F/scripts.pory"

# 21 "data/maps/SaffronCity_CopycatsHouse_2F/scripts.pory"
SaffronCity_CopycatsHouse_2F_EventScript_Copycat::
# 22 "data/maps/SaffronCity_CopycatsHouse_2F/scripts.pory"
	goto_if_questlog EventScript_ReleaseEnd
# 23 "data/maps/SaffronCity_CopycatsHouse_2F/scripts.pory"
	special QuestLog_CutRecording
# 24 "data/maps/SaffronCity_CopycatsHouse_2F/scripts.pory"
	lock
# 25 "data/maps/SaffronCity_CopycatsHouse_2F/scripts.pory"
	faceplayer
# 26 "data/maps/SaffronCity_CopycatsHouse_2F/scripts.pory"
	checkitem ITEM_POKE_DOLL
# 27 "data/maps/SaffronCity_CopycatsHouse_2F/scripts.pory"
	goto_if_eq VAR_RESULT, TRUE, EventScript_MimicTutor
# 28 "data/maps/SaffronCity_CopycatsHouse_2F/scripts.pory"
	checkplayergender
# 29 "data/maps/SaffronCity_CopycatsHouse_2F/scripts.pory"
	call_if_eq VAR_RESULT, MALE, SaffronCity_CopycatsHouse_2F_EventScript_MimicPlayerMale
# 30 "data/maps/SaffronCity_CopycatsHouse_2F/scripts.pory"
	call_if_eq VAR_RESULT, FEMALE, SaffronCity_CopycatsHouse_2F_EventScript_MimicPlayerFemale
# 31 "data/maps/SaffronCity_CopycatsHouse_2F/scripts.pory"
	release
# 32 "data/maps/SaffronCity_CopycatsHouse_2F/scripts.pory"
	end
# 33 "data/maps/SaffronCity_CopycatsHouse_2F/scripts.pory"

# 34 "data/maps/SaffronCity_CopycatsHouse_2F/scripts.pory"
SaffronCity_CopycatsHouse_2F_EventScript_MimicPlayerMale::
# 35 "data/maps/SaffronCity_CopycatsHouse_2F/scripts.pory"
	msgbox SaffronCity_CopycatsHouse_2F_Text_MimickingFavoriteHobbyMale
# 36 "data/maps/SaffronCity_CopycatsHouse_2F/scripts.pory"
	return
# 37 "data/maps/SaffronCity_CopycatsHouse_2F/scripts.pory"

# 38 "data/maps/SaffronCity_CopycatsHouse_2F/scripts.pory"
SaffronCity_CopycatsHouse_2F_EventScript_MimicPlayerFemale::
# 39 "data/maps/SaffronCity_CopycatsHouse_2F/scripts.pory"
	msgbox SaffronCity_CopycatsHouse_2F_Text_MimickingFavoriteHobbyFemale
# 40 "data/maps/SaffronCity_CopycatsHouse_2F/scripts.pory"
	return
# 41 "data/maps/SaffronCity_CopycatsHouse_2F/scripts.pory"

# 42 "data/maps/SaffronCity_CopycatsHouse_2F/scripts.pory"
SaffronCity_CopycatsHouse_2F_EventScript_Computer::
# 43 "data/maps/SaffronCity_CopycatsHouse_2F/scripts.pory"
	msgbox SaffronCity_CopycatsHouse_2F_Text_MySecrets, MSGBOX_SIGN
# 44 "data/maps/SaffronCity_CopycatsHouse_2F/scripts.pory"
	end
# 45 "data/maps/SaffronCity_CopycatsHouse_2F/scripts.pory"

# 46 "data/maps/SaffronCity_CopycatsHouse_2F/scripts.pory"
SaffronCity_CopycatsHouse_2F_EventScript_Game::
# 47 "data/maps/SaffronCity_CopycatsHouse_2F/scripts.pory"
	msgbox SaffronCity_CopycatsHouse_2F_Text_MarioWearingABucket, MSGBOX_SIGN
# 48 "data/maps/SaffronCity_CopycatsHouse_2F/scripts.pory"
	end
