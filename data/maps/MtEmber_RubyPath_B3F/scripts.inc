# 1 "data/maps/MtEmber_RubyPath_B3F/scripts.pory"

# 2 "data/maps/MtEmber_RubyPath_B3F/scripts.pory"
.set LOCALID_RUBY, 1
# 3 "data/maps/MtEmber_RubyPath_B3F/scripts.pory"

# 4 "data/maps/MtEmber_RubyPath_B3F/scripts.pory"
MtEmber_RubyPath_B3F_MapScripts::
# 5 "data/maps/MtEmber_RubyPath_B3F/scripts.pory"
	.byte 0
# 6 "data/maps/MtEmber_RubyPath_B3F/scripts.pory"

# 7 "data/maps/MtEmber_RubyPath_B3F/scripts.pory"
@ Odd that this is here and not in MtEmber_RubyPath_B5F/scripts.inc
# 8 "data/maps/MtEmber_RubyPath_B3F/scripts.pory"
MtEmber_RubyPath_B5F_EventScript_Ruby::
# 9 "data/maps/MtEmber_RubyPath_B3F/scripts.pory"
	lock
# 10 "data/maps/MtEmber_RubyPath_B3F/scripts.pory"
	faceplayer
# 11 "data/maps/MtEmber_RubyPath_B3F/scripts.pory"
	setflag FLAG_GOT_RUBY
# 12 "data/maps/MtEmber_RubyPath_B3F/scripts.pory"
	removeobject LOCALID_RUBY
# 13 "data/maps/MtEmber_RubyPath_B3F/scripts.pory"
	giveitem_msg MtEmber_RubyPath_B3F_Text_FoundARuby, ITEM_RUBY, 1, MUS_OBTAIN_KEY_ITEM
# 14 "data/maps/MtEmber_RubyPath_B3F/scripts.pory"
	release
# 15 "data/maps/MtEmber_RubyPath_B3F/scripts.pory"
	end
