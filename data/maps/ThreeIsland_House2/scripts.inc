ThreeIsland_House2_MapScripts:: @ 81718DF
	.byte 0

ThreeIsland_House2_EventScript_Man:: @ 81718E0
	lock
	faceplayer
	famechecker FAMECHECKER_SABRINA, 1
	msgbox ThreeIsland_House2_Text_IAdmireSabrina
	release
	end

ThreeIsland_House2_EventScript_Rocker:: @ 81718F9
	msgbox ThreeIsland_House2_Text_CantMakeThisSpoonBend, MSGBOX_NPC
	end
