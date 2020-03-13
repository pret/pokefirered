ThreeIsland_House5_MapScripts:: @ 817191F
	.byte 0

ThreeIsland_House5_EventScript_LittleGirl:: @ 8171920
	lock
	faceplayer
	goto_if_set FLAG_RESCUED_LOSTELLE, ThreeIsland_House5_EventScript_LittleGirlLostelleFound
	msgbox ThreeIsland_House5_Text_ImNotLostelle
	release
	end

ThreeIsland_House5_EventScript_LittleGirlLostelleFound:: @ 8171935
	msgbox ThreeIsland_House5_Text_IllGoPlayWithLostelle
	release
	end
