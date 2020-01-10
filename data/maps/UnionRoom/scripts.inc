UnionRoom_MapScripts:: @ 816047C
	map_script MAP_SCRIPT_ON_RESUME, UnionRoom_OnResume
	map_script MAP_SCRIPT_ON_TRANSITION, UnionRoom_OnTransition
	.byte 0

UnionRoom_OnResume:: @ 8160487
	setflag FLAG_HIDE_UNION_ROOM_1
	setflag FLAG_HIDE_UNION_ROOM_2
	setflag FLAG_HIDE_UNION_ROOM_3
	setflag FLAG_HIDE_UNION_ROOM_4
	setflag FLAG_HIDE_UNION_ROOM_5
	setflag FLAG_HIDE_UNION_ROOM_6
	setflag FLAG_HIDE_UNION_ROOM_7
	setflag FLAG_HIDE_UNION_ROOM_8
	removeobject 9
	removeobject 8
	removeobject 7
	removeobject 2
	removeobject 6
	removeobject 5
	removeobject 4
	removeobject 3
	special UnionRoomSpecial
	end

UnionRoom_OnTransition:: @ 81604BB
	end

UnionRoom_EventScript_1604BC:: @ 81604BC
	lock
	faceplayer
	setvar VAR_RESULT, 1
	waitstate
	release
	end

UnionRoom_EventScript_1604C6:: @ 81604C6
	lock
	faceplayer
	setvar VAR_RESULT, 2
	waitstate
	release
	end

UnionRoom_EventScript_1604D0:: @ 81604D0
	lock
	faceplayer
	setvar VAR_RESULT, 3
	waitstate
	release
	end

UnionRoom_EventScript_1604DA:: @ 81604DA
	lock
	faceplayer
	setvar VAR_RESULT, 4
	waitstate
	release
	end

UnionRoom_EventScript_1604E4:: @ 81604E4
	lock
	faceplayer
	setvar VAR_RESULT, 5
	waitstate
	release
	end

UnionRoom_EventScript_1604EE:: @ 81604EE
	lock
	faceplayer
	setvar VAR_RESULT, 6
	waitstate
	release
	end

UnionRoom_EventScript_1604F8:: @ 81604F8
	lock
	faceplayer
	setvar VAR_RESULT, 7
	waitstate
	release
	end

UnionRoom_EventScript_160502:: @ 8160502
	lock
	faceplayer
	setvar VAR_RESULT, 8
	waitstate
	release
	end

UnionRoom_EventScript_16050C:: @ 816050C
	lock
	faceplayer
	setvar VAR_RESULT, 9
	waitstate
	release
	end

UnionRoom_EventScript_160516:: @ 8160516
	lockall
	setvar VAR_RESULT, 10
	waitstate
	releaseall
	end
