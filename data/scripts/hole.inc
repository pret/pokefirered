EventScript_1C1338:: @ 81C1338
	map_script_2 VAR_0x4030, 0, EventScript_1C1348
	.2byte 0
	copyvar VAR_0x4030, 1
	end

EventScript_1C1348:: @ 81C1348
	lockall
	delay 20
	applymovement 255, Movement_1C137A
	waitmovement 0
	playse SE_RU_HYUU
	delay 60
	warphole 0xFFFF
	waitstate
	end

EventScript_1C1361:: @ 81C1361
	lockall
	delay 20
	applymovement 255, Movement_1C137A
	waitmovement 0
	playse SE_RU_HYUU
	delay 60
	special DoFallWarp
	waitstate
	end

Movement_1C137A:: @ 81C137A
	set_invisible
	step_end
