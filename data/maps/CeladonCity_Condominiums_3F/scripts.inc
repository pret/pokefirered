# 1 "data/maps/CeladonCity_Condominiums_3F/scripts.pory"

# 2 "data/maps/CeladonCity_Condominiums_3F/scripts.pory"
CeladonCity_Condominiums_3F_MapScripts::
# 3 "data/maps/CeladonCity_Condominiums_3F/scripts.pory"
	.byte 0
# 4 "data/maps/CeladonCity_Condominiums_3F/scripts.pory"

# 5 "data/maps/CeladonCity_Condominiums_3F/scripts.pory"
CeladonCity_Condominiums_3F_EventScript_Programmer::
# 6 "data/maps/CeladonCity_Condominiums_3F/scripts.pory"
	msgbox CeladonCity_Condominiums_3F_Text_ImTheProgrammer, MSGBOX_NPC
# 7 "data/maps/CeladonCity_Condominiums_3F/scripts.pory"
	end
# 8 "data/maps/CeladonCity_Condominiums_3F/scripts.pory"

# 9 "data/maps/CeladonCity_Condominiums_3F/scripts.pory"
CeladonCity_Condominiums_3F_EventScript_GraphicArtist::
# 10 "data/maps/CeladonCity_Condominiums_3F/scripts.pory"
	msgbox CeladonCity_Condominiums_3F_Text_ImTheGraphicArtist, MSGBOX_NPC
# 11 "data/maps/CeladonCity_Condominiums_3F/scripts.pory"
	end
# 12 "data/maps/CeladonCity_Condominiums_3F/scripts.pory"

# 13 "data/maps/CeladonCity_Condominiums_3F/scripts.pory"
CeladonCity_Condominiums_3F_EventScript_Writer::
# 14 "data/maps/CeladonCity_Condominiums_3F/scripts.pory"
	msgbox CeladonCity_Condominiums_3F_Text_IWroteTheStory, MSGBOX_NPC
# 15 "data/maps/CeladonCity_Condominiums_3F/scripts.pory"
	end
# 16 "data/maps/CeladonCity_Condominiums_3F/scripts.pory"

# 17 "data/maps/CeladonCity_Condominiums_3F/scripts.pory"
CeladonCity_Condominiums_3F_EventScript_Designer::
# 18 "data/maps/CeladonCity_Condominiums_3F/scripts.pory"
	lock
# 19 "data/maps/CeladonCity_Condominiums_3F/scripts.pory"
	faceplayer
# 20 "data/maps/CeladonCity_Condominiums_3F/scripts.pory"
	specialvar VAR_RESULT, HasAllKantoMons
# 21 "data/maps/CeladonCity_Condominiums_3F/scripts.pory"
	goto_if_eq VAR_RESULT, TRUE, CeladonCity_Condominiums_3F_EventScript_CompletedPokedex
# 22 "data/maps/CeladonCity_Condominiums_3F/scripts.pory"
	msgbox CeladonCity_Condominiums_3F_Text_ImGameDesignerShowMeFinishedPokedex
# 23 "data/maps/CeladonCity_Condominiums_3F/scripts.pory"
	release
# 24 "data/maps/CeladonCity_Condominiums_3F/scripts.pory"
	end
# 25 "data/maps/CeladonCity_Condominiums_3F/scripts.pory"

# 26 "data/maps/CeladonCity_Condominiums_3F/scripts.pory"
CeladonCity_Condominiums_3F_EventScript_CompletedPokedex::
# 27 "data/maps/CeladonCity_Condominiums_3F/scripts.pory"
	goto CeladonCity_Condominiums_3F_EventScript_ShowDiploma
# 28 "data/maps/CeladonCity_Condominiums_3F/scripts.pory"
	end
# 29 "data/maps/CeladonCity_Condominiums_3F/scripts.pory"

# 30 "data/maps/CeladonCity_Condominiums_3F/scripts.pory"
CeladonCity_Condominiums_3F_EventScript_ShowDiploma::
# 31 "data/maps/CeladonCity_Condominiums_3F/scripts.pory"
	message CeladonCity_Condominiums_3F_Text_CompletedPokedexCongratulations
# 32 "data/maps/CeladonCity_Condominiums_3F/scripts.pory"
	waitmessage
# 33 "data/maps/CeladonCity_Condominiums_3F/scripts.pory"
	delay 60
# 34 "data/maps/CeladonCity_Condominiums_3F/scripts.pory"
	goto_if_questlog EventScript_ReleaseEnd
# 35 "data/maps/CeladonCity_Condominiums_3F/scripts.pory"
	special ShowDiploma
# 36 "data/maps/CeladonCity_Condominiums_3F/scripts.pory"
	waitstate
# 37 "data/maps/CeladonCity_Condominiums_3F/scripts.pory"
	release
# 38 "data/maps/CeladonCity_Condominiums_3F/scripts.pory"
	end
# 39 "data/maps/CeladonCity_Condominiums_3F/scripts.pory"

# 40 "data/maps/CeladonCity_Condominiums_3F/scripts.pory"
CeladonCity_Condominiums_3F_EventScript_DevelopmentRoomSign::
# 41 "data/maps/CeladonCity_Condominiums_3F/scripts.pory"
	msgbox CeladonCity_Condominiums_3F_Text_GameFreakDevelopmentRoom, MSGBOX_SIGN
# 42 "data/maps/CeladonCity_Condominiums_3F/scripts.pory"
	end
# 43 "data/maps/CeladonCity_Condominiums_3F/scripts.pory"

# 44 "data/maps/CeladonCity_Condominiums_3F/scripts.pory"
CeladonCity_Condominiums_3F_EventScript_Computer1::
# 45 "data/maps/CeladonCity_Condominiums_3F/scripts.pory"
	msgbox CeladonCity_Condominiums_3F_Text_ItsTheGameProgram, MSGBOX_SIGN
# 46 "data/maps/CeladonCity_Condominiums_3F/scripts.pory"
	end
# 47 "data/maps/CeladonCity_Condominiums_3F/scripts.pory"

# 48 "data/maps/CeladonCity_Condominiums_3F/scripts.pory"
CeladonCity_Condominiums_3F_EventScript_Computer2::
# 49 "data/maps/CeladonCity_Condominiums_3F/scripts.pory"
	msgbox CeladonCity_Condominiums_3F_Text_SomeonesPlayingGame, MSGBOX_SIGN
# 50 "data/maps/CeladonCity_Condominiums_3F/scripts.pory"
	end
# 51 "data/maps/CeladonCity_Condominiums_3F/scripts.pory"

# 52 "data/maps/CeladonCity_Condominiums_3F/scripts.pory"
CeladonCity_Condominiums_3F_EventScript_Computer3::
# 53 "data/maps/CeladonCity_Condominiums_3F/scripts.pory"
	msgbox CeladonCity_Condominiums_3F_Text_ItsScriptBetterNotLookAtEnding, MSGBOX_SIGN
# 54 "data/maps/CeladonCity_Condominiums_3F/scripts.pory"
	end
