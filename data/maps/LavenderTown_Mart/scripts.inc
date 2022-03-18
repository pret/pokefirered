LavenderTown_Mart_MapScripts:: @ 816B34F
	.byte 0

LavenderTown_Mart_EventScript_BaldingMan:: @ 816B350
	msgbox LavenderTown_Mart_Text_SearchingForStatRaiseItems, MSGBOX_NPC
	end

LavenderTown_Mart_EventScript_Rocker:: @ 816B359
	msgbox LavenderTown_Mart_Text_DidYouBuyRevives, MSGBOX_NPC
	end

LavenderTown_Mart_EventScript_Youngster:: @ 816B362
	msgbox LavenderTown_Mart_Text_TrainerDuosCanChallengeYou, MSGBOX_NPC
	end

LavenderTown_Mart_EventScript_Clerk:: @ 816B36B
	goto_if_questlog EventScript_ReleaseEnd
	lock
	faceplayer
	message Text_MayIHelpYou
	waitmessage
	pokemart 0
	msgbox Text_PleaseComeAgain
	release
	end
