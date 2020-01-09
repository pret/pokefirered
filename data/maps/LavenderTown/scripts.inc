LavenderTown_MapScripts:: @ 816686B
	map_script MAP_SCRIPT_ON_TRANSITION, LavenderTown_OnTransition
	.byte 0

LavenderTown_OnTransition:: @ 8166871
	setworldmapflag FLAG_WORLD_MAP_LAVENDER_TOWN
	setvar VAR_MAP_SCENE_S_S_ANNE_2F_CORRIDOR, 1
	setflag FLAG_HIDE_SS_ANNE_RIVAL
	end

LavenderTown_EventScript_16687D:: @ 816687D
	lock
	faceplayer
	msgbox gUnknown_817F52E, MSGBOX_YESNO
	compare VAR_RESULT, 1
	goto_if eq, EventScript_16689C
	msgbox gUnknown_817F568
	release
	end

EventScript_16689C:: @ 816689C
	msgbox gUnknown_817F548
	release
	end

LavenderTown_EventScript_1668A6:: @ 81668A6
	msgbox gUnknown_817F5B6, 2
	end

LavenderTown_EventScript_1668AF:: @ 81668AF
	msgbox gUnknown_817F614, 2
	end

LavenderTown_EventScript_1668B8:: @ 81668B8
	msgbox gUnknown_817F676, 3
	end

LavenderTown_EventScript_1668C1:: @ 81668C1
	msgbox gUnknown_817F69A, 3
	end

LavenderTown_EventScript_1668CA:: @ 81668CA
	msgbox gUnknown_817F6D6, 3
	end

LavenderTown_EventScript_1668D3:: @ 81668D3
	msgbox gUnknown_817F6F7, 3
	end
