MtEmber_Exterior_MapScripts:: @ 8163946
	map_script 3, MtEmber_Exterior_MapScript1_163951
	map_script 1, MtEmber_Exterior_MapScript2_163969
	.byte 0

MtEmber_Exterior_MapScript1_163951:: @ 8163951
	setworldmapflag 2230
	compare_var_to_value VAR_0x407F, 2
	call_if 1, EventScript_163960
	end

EventScript_163960:: @ 8163960
	setobjectmovementtype 2, 8
	setobjectmovementtype 3, 8
	return

MtEmber_Exterior_MapScript2_163969:: @ 8163969
	compare_var_to_value VAR_0x4076, 4
	call_if 4, EventScript_163975
	end

EventScript_163975:: @ 8163975
	setmetatile 42, 39, 838, 0
	return

MtEmber_Exterior_EventScript_16397F:: @ 816397F
	lock
	checktrainerflag 537
	goto_if 1, EventScript_16399E
	compare_var_to_value VAR_0x4076, 4
	goto_if 1, EventScript_1639A8
	loadword 0, gUnknown_817A82A
	callstd 4
	release
	end

EventScript_16399E:: @ 816399E
	loadword 0, gUnknown_817AA3F
	callstd 4
	release
	end

EventScript_1639A8:: @ 81639A8
	applymovement 2, Movement_1A75E1
	waitmovement 0
	playbgm BGM_FRLG_SUSPICIOUS_EYE, 0
	loadword 0, gUnknown_817AA06
	callstd 4
	trainerbattle 3, 537, 0, Text_17AA34
	loadword 0, gUnknown_817AA3F
	callstd 4
	checktrainerflag 538
	goto_if 1, EventScript_1639DB
	release
	end

EventScript_1639DB:: @ 81639DB
	loadword 0, gUnknown_817AAD7
	callstd 4
	closemessage
	fadescreen 1
	removeobject 2
	removeobject 3
	fadescreen 0
	release
	end

MtEmber_Exterior_EventScript_1639F0:: @ 81639F0
	lock
	faceplayer
	checktrainerflag 538
	goto_if 1, EventScript_163A1B
	compare_var_to_value VAR_0x4076, 4
	goto_if 1, EventScript_163A25
	loadword 0, gUnknown_817A88C
	callstd 4
	closemessage
	applymovement 3, Movement_1A75E5
	waitmovement 0
	release
	end

EventScript_163A1B:: @ 8163A1B
	loadword 0, gUnknown_817AA99
	callstd 4
	release
	end

EventScript_163A25:: @ 8163A25
	playbgm BGM_FRLG_SUSPICIOUS_EYE, 0
	loadword 0, gUnknown_817AA56
	callstd 4
	trainerbattle 3, 538, 0, Text_17AA8A
	loadword 0, gUnknown_817AA99
	callstd 4
	checktrainerflag 537
	goto_if 1, EventScript_1639DB
	release
	end

MtEmber_Exterior_EventScript_163A4E:: @ 8163A4E
	lockall
	textcolor 0
	loadword 0, gUnknown_817A8B4
	callstd 4
	message Text_17A8EE
	waitmessage
	playse SE_PIN
	applymovement 3, Movement_1A75D9
	waitmovement 0
	waitbuttonpress
	loadword 0, gUnknown_817A970
	callstd 4
	applymovement 2, Movement_1A75ED
	waitmovement 0
	playse SE_PIN
	applymovement 2, Movement_1A75DB
	waitmovement 0
	applymovement 2, Movement_1A75DD
	waitmovement 0
	applymovement 3, Movement_1A75ED
	waitmovement 0
	call EventScript_163960
	loadword 0, gUnknown_817A9E1
	callstd 4
	setvar VAR_0x407F, 2
	releaseall
	end

MtEmber_Exterior_EventScript_163AB4:: @ 8163AB4
	trainerbattle 0, 595, 0, Text_17AB73, Text_17ABAA
	loadword 0, gUnknown_817ABD8
	callstd 6
	end

MtEmber_Exterior_EventScript_163ACB:: @ 8163ACB
	trainerbattle 0, 597, 0, Text_17AC55, Text_17AC82
	loadword 0, gUnknown_817ACA2
	callstd 6
	end

MtEmber_Exterior_EventScript_163AE2:: @ 8163AE2
	trainerbattle 0, 592, 0, Text_17AD06, Text_17AD6B
	loadword 0, gUnknown_817AD89
	callstd 6
	end
