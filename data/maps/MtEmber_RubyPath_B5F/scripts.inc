MtEmber_RubyPath_B5F_MapScripts:: @ 8163BAA
	.byte 0

MtEmber_RubyPath_B5F_EventScript_BrailleMessage:: @ 8163BAB
	lockall
	setvar VAR_0x8005, 130
	braillemessage_wait Braille_Text_Everything
	braillemessage_wait Braille_Text_HasMeaning1
	braillemessage_wait Braille_Text_Existence
	braillemessage_wait Braille_Text_HasMeaning2
	braillemessage_wait Braille_Text_BeingAlive
	braillemessage_wait Braille_Text_HasMeaning3
	braillemessage_wait Braille_Text_HaveDreams
	braillemessage Braille_Text_UsePower
	waitbuttonpress
	releaseall
	end
