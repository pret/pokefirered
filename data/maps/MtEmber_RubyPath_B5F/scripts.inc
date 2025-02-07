# 1 "data/maps/MtEmber_RubyPath_B5F/scripts.pory"

# 2 "data/maps/MtEmber_RubyPath_B5F/scripts.pory"
MtEmber_RubyPath_B5F_MapScripts::
# 3 "data/maps/MtEmber_RubyPath_B5F/scripts.pory"
	.byte 0
# 4 "data/maps/MtEmber_RubyPath_B5F/scripts.pory"

# 5 "data/maps/MtEmber_RubyPath_B5F/scripts.pory"
MtEmber_RubyPath_B5F_EventScript_BrailleMessage::
# 6 "data/maps/MtEmber_RubyPath_B5F/scripts.pory"
	lockall
# 7 "data/maps/MtEmber_RubyPath_B5F/scripts.pory"
	setvar VAR_0x8005, 130
# 8 "data/maps/MtEmber_RubyPath_B5F/scripts.pory"
	braillemessage_wait Braille_Text_Everything
# 9 "data/maps/MtEmber_RubyPath_B5F/scripts.pory"
	braillemessage_wait Braille_Text_HasMeaning1
# 10 "data/maps/MtEmber_RubyPath_B5F/scripts.pory"
	braillemessage_wait Braille_Text_Existence
# 11 "data/maps/MtEmber_RubyPath_B5F/scripts.pory"
	braillemessage_wait Braille_Text_HasMeaning2
# 12 "data/maps/MtEmber_RubyPath_B5F/scripts.pory"
	braillemessage_wait Braille_Text_BeingAlive
# 13 "data/maps/MtEmber_RubyPath_B5F/scripts.pory"
	braillemessage_wait Braille_Text_HasMeaning3
# 14 "data/maps/MtEmber_RubyPath_B5F/scripts.pory"
	braillemessage_wait Braille_Text_HaveDreams
# 15 "data/maps/MtEmber_RubyPath_B5F/scripts.pory"
	braillemessage Braille_Text_UsePower
# 16 "data/maps/MtEmber_RubyPath_B5F/scripts.pory"
	waitbuttonpress
# 17 "data/maps/MtEmber_RubyPath_B5F/scripts.pory"
	releaseall
# 18 "data/maps/MtEmber_RubyPath_B5F/scripts.pory"
	end
