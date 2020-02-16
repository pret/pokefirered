SaffronCity_CopycatsHouse_1F_MapScripts:: @ 816EB36
	.byte 0

SaffronCity_CopycatsHouse_1F_EventScript_CopycatsMom:: @ 816EB37
	msgbox SaffronCity_CopycatsHouse_1F_Text_DaughterIsSelfCentered, MSGBOX_NPC
	end

SaffronCity_CopycatsHouse_1F_EventScript_CopycatsDad:: @ 816EB40
	msgbox SaffronCity_CopycatsHouse_1F_Text_DaughterLikesToMimicPeople, MSGBOX_NPC
	end

SaffronCity_CopycatsHouse_1F_EventScript_Chansey:: @ 816EB49
	lock
	faceplayer
	waitse
	playmoncry SPECIES_CHANSEY, 0
	msgbox SaffronCity_CopycatsHouse_1F_Text_Chansey
	waitmoncry
	release
	end
