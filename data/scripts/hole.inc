@ Unused
EventScript_CheckFallDownHole::
	map_script_2 VAR_ICE_STEP_COUNT, 0, EventScript_FallDownHole
	.2byte 0

@ Unused
EventScript_FixCrackedGround::
	copyvar VAR_ICE_STEP_COUNT, 1
	end

EventScript_FallDownHole::
	lockall
	delay 20
	applymovement OBJ_EVENT_ID_PLAYER, Movement_SetInvisible
	waitmovement 0
	playse SE_FALL
	delay 60
	warphole MAP_UNDEFINED
	waitstate
	end

@ TODO: EventScript_FallDownHoleMtPyre in pokeemerald, needs generic name
EventScript_1C1361::
	lockall
	delay 20
	applymovement OBJ_EVENT_ID_PLAYER, Movement_SetInvisible
	waitmovement 0
	playse SE_FALL
	delay 60
	special DoFallWarp
	waitstate
	end

Movement_SetInvisible:
	set_invisible
	step_end
