# 1 "data/maps/SaffronCity_CopycatsHouse_1F/scripts.pory"

# 2 "data/maps/SaffronCity_CopycatsHouse_1F/scripts.pory"
SaffronCity_CopycatsHouse_1F_MapScripts::
# 3 "data/maps/SaffronCity_CopycatsHouse_1F/scripts.pory"
	.byte 0
# 4 "data/maps/SaffronCity_CopycatsHouse_1F/scripts.pory"

# 5 "data/maps/SaffronCity_CopycatsHouse_1F/scripts.pory"
SaffronCity_CopycatsHouse_1F_EventScript_CopycatsMom::
# 6 "data/maps/SaffronCity_CopycatsHouse_1F/scripts.pory"
	msgbox SaffronCity_CopycatsHouse_1F_Text_DaughterIsSelfCentered, MSGBOX_NPC
# 7 "data/maps/SaffronCity_CopycatsHouse_1F/scripts.pory"
	end
# 8 "data/maps/SaffronCity_CopycatsHouse_1F/scripts.pory"

# 9 "data/maps/SaffronCity_CopycatsHouse_1F/scripts.pory"
SaffronCity_CopycatsHouse_1F_EventScript_CopycatsDad::
# 10 "data/maps/SaffronCity_CopycatsHouse_1F/scripts.pory"
	msgbox SaffronCity_CopycatsHouse_1F_Text_DaughterLikesToMimicPeople, MSGBOX_NPC
# 11 "data/maps/SaffronCity_CopycatsHouse_1F/scripts.pory"
	end
# 12 "data/maps/SaffronCity_CopycatsHouse_1F/scripts.pory"

# 13 "data/maps/SaffronCity_CopycatsHouse_1F/scripts.pory"
SaffronCity_CopycatsHouse_1F_EventScript_Chansey::
# 14 "data/maps/SaffronCity_CopycatsHouse_1F/scripts.pory"
	lock
# 15 "data/maps/SaffronCity_CopycatsHouse_1F/scripts.pory"
	faceplayer
# 16 "data/maps/SaffronCity_CopycatsHouse_1F/scripts.pory"
	waitse
# 17 "data/maps/SaffronCity_CopycatsHouse_1F/scripts.pory"
	playmoncry SPECIES_CHANSEY, CRY_MODE_NORMAL
# 18 "data/maps/SaffronCity_CopycatsHouse_1F/scripts.pory"
	msgbox SaffronCity_CopycatsHouse_1F_Text_Chansey
# 19 "data/maps/SaffronCity_CopycatsHouse_1F/scripts.pory"
	waitmoncry
# 20 "data/maps/SaffronCity_CopycatsHouse_1F/scripts.pory"
	release
# 21 "data/maps/SaffronCity_CopycatsHouse_1F/scripts.pory"
	end
