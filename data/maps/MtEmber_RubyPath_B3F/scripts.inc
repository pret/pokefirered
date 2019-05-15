MtEmber_RubyPath_B3F_MapScripts:: @ 8163C48
	.byte 0

MtEmber_RubyPath_B3F_EventScript_163C49:: @ 8163C49
MtEmber_RubyPath_B5F_EventScript_163C49:: @ 8163C49
	lock
	faceplayer
	setflag FLAG_0x2DD
	removeobject 1
	additem ITEM_RUBY, 1
	loadword 0, gUnknown_817ADC5
	setorcopyvar VAR_0x8000, 373
	setorcopyvar VAR_0x8001, 1
	setorcopyvar VAR_0x8002, 318
	callstd 9 @ gStdScript_ItemMessageAndFanfare
	release
	end
