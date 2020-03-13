ThreeIsland_House1_MapScripts:: @ 8171819
	.byte 0

ThreeIsland_House1_EventScript_Lostelle:: @ 817181A
	lock
	faceplayer
	special BufferBigGuyOrBigGirlString
	msgbox ThreeIsland_House1_Text_YoureAlwaysSoCool
	release
	end

ThreeIsland_House1_EventScript_DisplayCase:: @ 8171829
	msgbox ThreeIsland_House1_Text_RareRocksGemsDisplayed, MSGBOX_SIGN
	end
