@ Unused
EventScript_CheckFallDownHole:: @ 81C1338
	map_script_2 VAR_ICE_STEP_COUNT, 0, EventScript_FallDownHole
	.2byte 0

@ Unused
EventScript_FixCrackedGround::
	copyvar VAR_ICE_STEP_COUNT, 1
	end

EventScript_FallDownHole:: @ 81C1348
	lockall
	delay 20
	applymovement OBJ_EVENT_ID_PLAYER, Movement_SetInvisible
	waitmovement 0
	playse SE_FALL
	delay 60
	warphole 0xFFFF
	waitstate
	end

@ TODO: EventScript_FallDownHoleMtPyre in pokeemerald, needs generic name
EventScript_1C1361:: @ 81C1361
	lockall
	delay 20
	applymovement OBJ_EVENT_ID_PLAYER, Movement_SetInvisible
	waitmovement 0
	playse SE_FALL
	delay 60
	special DoFallWarp
	waitstate
	end

Movement_SetInvisible: @ 81C137A
	set_invisible
	step_end
