# 1 "data/maps/SSAnne_Kitchen/scripts.pory"

# 2 "data/maps/SSAnne_Kitchen/scripts.pory"
SSAnne_Kitchen_MapScripts::
# 3 "data/maps/SSAnne_Kitchen/scripts.pory"
	.byte 0
# 4 "data/maps/SSAnne_Kitchen/scripts.pory"

# 5 "data/maps/SSAnne_Kitchen/scripts.pory"
SSAnne_Kitchen_EventScript_Chef1::
# 6 "data/maps/SSAnne_Kitchen/scripts.pory"
	msgbox SSAnne_Kitchen_Text_BusyOutOfTheWay, MSGBOX_NPC
# 7 "data/maps/SSAnne_Kitchen/scripts.pory"
	end
# 8 "data/maps/SSAnne_Kitchen/scripts.pory"

# 9 "data/maps/SSAnne_Kitchen/scripts.pory"
SSAnne_Kitchen_EventScript_Chef2::
# 10 "data/maps/SSAnne_Kitchen/scripts.pory"
	msgbox SSAnne_Kitchen_Text_SawOddBerryInTrash, MSGBOX_NPC
# 11 "data/maps/SSAnne_Kitchen/scripts.pory"
	end
# 12 "data/maps/SSAnne_Kitchen/scripts.pory"

# 13 "data/maps/SSAnne_Kitchen/scripts.pory"
SSAnne_Kitchen_EventScript_Chef3::
# 14 "data/maps/SSAnne_Kitchen/scripts.pory"
	msgbox SSAnne_Kitchen_Text_SoBusyImDizzy, MSGBOX_NPC
# 15 "data/maps/SSAnne_Kitchen/scripts.pory"
	end
# 16 "data/maps/SSAnne_Kitchen/scripts.pory"

# 17 "data/maps/SSAnne_Kitchen/scripts.pory"
SSAnne_Kitchen_EventScript_Chef4::
# 18 "data/maps/SSAnne_Kitchen/scripts.pory"
	lock
# 19 "data/maps/SSAnne_Kitchen/scripts.pory"
	faceplayer
# 20 "data/maps/SSAnne_Kitchen/scripts.pory"
	msgbox SSAnne_Kitchen_Text_IAmLeChefMainCourseIs
# 21 "data/maps/SSAnne_Kitchen/scripts.pory"
	random 3
# 22 "data/maps/SSAnne_Kitchen/scripts.pory"
	copyvar VAR_0x8008, VAR_RESULT
# 23 "data/maps/SSAnne_Kitchen/scripts.pory"
	call_if_eq VAR_0x8008, 0, SSAnne_Kitchen_EventScript_SalmonDuSalad
# 24 "data/maps/SSAnne_Kitchen/scripts.pory"
	call_if_eq VAR_0x8008, 1, SSAnne_Kitchen_EventScript_EelsAuBarbecue
# 25 "data/maps/SSAnne_Kitchen/scripts.pory"
	call_if_eq VAR_0x8008, 2, SSAnne_Kitchen_EventScript_PrimeBeefsteak
# 26 "data/maps/SSAnne_Kitchen/scripts.pory"
	release
# 27 "data/maps/SSAnne_Kitchen/scripts.pory"
	end
# 28 "data/maps/SSAnne_Kitchen/scripts.pory"

# 29 "data/maps/SSAnne_Kitchen/scripts.pory"
SSAnne_Kitchen_EventScript_SalmonDuSalad::
# 30 "data/maps/SSAnne_Kitchen/scripts.pory"
	msgbox SSAnne_Kitchen_Text_SalmonDuSalad
# 31 "data/maps/SSAnne_Kitchen/scripts.pory"
	return
# 32 "data/maps/SSAnne_Kitchen/scripts.pory"

# 33 "data/maps/SSAnne_Kitchen/scripts.pory"
SSAnne_Kitchen_EventScript_EelsAuBarbecue::
# 34 "data/maps/SSAnne_Kitchen/scripts.pory"
	msgbox SSAnne_Kitchen_Text_EelsAuBarbecue
# 35 "data/maps/SSAnne_Kitchen/scripts.pory"
	return
# 36 "data/maps/SSAnne_Kitchen/scripts.pory"

# 37 "data/maps/SSAnne_Kitchen/scripts.pory"
SSAnne_Kitchen_EventScript_PrimeBeefsteak::
# 38 "data/maps/SSAnne_Kitchen/scripts.pory"
	msgbox SSAnne_Kitchen_Text_PrimeBeefsteak
# 39 "data/maps/SSAnne_Kitchen/scripts.pory"
	return
# 40 "data/maps/SSAnne_Kitchen/scripts.pory"

# 41 "data/maps/SSAnne_Kitchen/scripts.pory"
SSAnne_Kitchen_EventScript_Chef5::
# 42 "data/maps/SSAnne_Kitchen/scripts.pory"
	msgbox SSAnne_Kitchen_Text_PeelSpudsEveryDay, MSGBOX_NPC
# 43 "data/maps/SSAnne_Kitchen/scripts.pory"
	end
# 44 "data/maps/SSAnne_Kitchen/scripts.pory"

# 45 "data/maps/SSAnne_Kitchen/scripts.pory"
SSAnne_Kitchen_EventScript_Chef6::
# 46 "data/maps/SSAnne_Kitchen/scripts.pory"
	msgbox SSAnne_Kitchen_Text_HearAboutSnorlaxItsAGlutton, MSGBOX_NPC
# 47 "data/maps/SSAnne_Kitchen/scripts.pory"
	end
# 48 "data/maps/SSAnne_Kitchen/scripts.pory"

# 49 "data/maps/SSAnne_Kitchen/scripts.pory"
SSAnne_Kitchen_EventScript_Chef7::
# 50 "data/maps/SSAnne_Kitchen/scripts.pory"
	msgbox SSAnne_Kitchen_Text_OnlyGetToPeelOnions, MSGBOX_NPC
# 51 "data/maps/SSAnne_Kitchen/scripts.pory"
	end
