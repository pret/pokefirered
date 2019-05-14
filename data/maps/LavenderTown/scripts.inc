LavenderTown_MapScripts:: @ 816686B
	map_script 3, LavenderTown_MapScript1_166871
	.byte 0

LavenderTown_MapScript1_166871:: @ 8166871
	setworldmapflag FLAG_WORLD_MAP_LAVENDER_TOWN
	setvar VAR_0x405B, 1
	setflag FLAG_0x03D
	end

LavenderTown_EventScript_16687D:: @ 816687D
	lock
	faceplayer
	loadword 0, gUnknown_817F52E
	callstd 5
	compare_var_to_value VAR_RESULT, 1
	goto_if 1, EventScript_16689C
	loadword 0, gUnknown_817F568
	callstd 4
	release
	end

EventScript_16689C:: @ 816689C
	loadword 0, gUnknown_817F548
	callstd 4
	release
	end

LavenderTown_EventScript_1668A6:: @ 81668A6
	loadword 0, gUnknown_817F5B6
	callstd 2
	end

LavenderTown_EventScript_1668AF:: @ 81668AF
	loadword 0, gUnknown_817F614
	callstd 2
	end

LavenderTown_EventScript_1668B8:: @ 81668B8
	loadword 0, gUnknown_817F676
	callstd 3
	end

LavenderTown_EventScript_1668C1:: @ 81668C1
	loadword 0, gUnknown_817F69A
	callstd 3
	end

LavenderTown_EventScript_1668CA:: @ 81668CA
	loadword 0, gUnknown_817F6D6
	callstd 3
	end

LavenderTown_EventScript_1668D3:: @ 81668D3
	loadword 0, gUnknown_817F6F7
	callstd 3
	end
