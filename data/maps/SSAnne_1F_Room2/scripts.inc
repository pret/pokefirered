SSAnne_1F_Room2_MapScripts:: @ 8160BE5
	.byte 0

SSAnne_1F_Room2_EventScript_160BE6:: @ 8160BE6
	loadword 0, gUnknown_8173AC5
	callstd 2
	end

SSAnne_1F_Room2_EventScript_160BEF:: @ 8160BEF
	trainerbattle 0, 126, 0, Text_173A1A, Text_173A4F
	loadword 0, gUnknown_8173A7A
	callstd 6
	end

SSAnne_1F_Room2_EventScript_160C06:: @ 8160C06
	trainerbattle 0, 96, 0, Text_173999, Text_1739B1
	loadword 0, gUnknown_81739C5
	callstd 6
	end
