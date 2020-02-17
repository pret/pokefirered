SixIsland_DottedHole_1F_MapScripts:: @ 8164182
	map_script MAP_SCRIPT_ON_TRANSITION, SixIsland_DottedHole_1F_OnTransition
	.byte 0

SixIsland_DottedHole_1F_OnTransition:: @ 8164188
	setworldmapflag FLAG_WORLD_MAP_SIX_ISLAND_DOTTED_HOLE_1F
	end

SixIsland_DottedHole_B1F_EventScript_BrailleUp:: @ 816418C
	lockall
	braillemessage Braille_Text_Up
	waitbuttonpress
	releaseall
	end

SixIsland_DottedHole_B4F_EventScript_BrailleDown:: @ 8164195
	lockall
	braillemessage Braille_Text_Down
	waitbuttonpress
	releaseall
	end

SixIsland_DottedHole_B3F_EventScript_BrailleRight:: @ 816419E
	lockall
	braillemessage Braille_Text_Right
	waitbuttonpress
	releaseall
	end

SixIsland_DottedHole_B2F_EventScript_BrailleLeft:: @ 81641A7
	lockall
	braillemessage Braille_Text_Left
	waitbuttonpress
	releaseall
	end
