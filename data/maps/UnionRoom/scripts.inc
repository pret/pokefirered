.set LOCALID_UNION_ROOM_PLAYER_4, 2
.set LOCALID_UNION_ROOM_PLAYER_8, 3
.set LOCALID_UNION_ROOM_PLAYER_7, 4
.set LOCALID_UNION_ROOM_PLAYER_6, 5
.set LOCALID_UNION_ROOM_PLAYER_5, 6
.set LOCALID_UNION_ROOM_PLAYER_3, 7
.set LOCALID_UNION_ROOM_PLAYER_2, 8
.set LOCALID_UNION_ROOM_PLAYER_1, 9

UnionRoom_MapScripts:: @ 816047C
	map_script MAP_SCRIPT_ON_RESUME, UnionRoom_OnResume
	map_script MAP_SCRIPT_ON_TRANSITION, UnionRoom_OnTransition
	.byte 0

UnionRoom_OnResume:: @ 8160487
	setflag FLAG_HIDE_UNION_ROOM_PLAYER_1
	setflag FLAG_HIDE_UNION_ROOM_PLAYER_2
	setflag FLAG_HIDE_UNION_ROOM_PLAYER_3
	setflag FLAG_HIDE_UNION_ROOM_PLAYER_4
	setflag FLAG_HIDE_UNION_ROOM_PLAYER_5
	setflag FLAG_HIDE_UNION_ROOM_PLAYER_6
	setflag FLAG_HIDE_UNION_ROOM_PLAYER_7
	setflag FLAG_HIDE_UNION_ROOM_PLAYER_8
	removeobject LOCALID_UNION_ROOM_PLAYER_1
	removeobject LOCALID_UNION_ROOM_PLAYER_2
	removeobject LOCALID_UNION_ROOM_PLAYER_3
	removeobject LOCALID_UNION_ROOM_PLAYER_4
	removeobject LOCALID_UNION_ROOM_PLAYER_5
	removeobject LOCALID_UNION_ROOM_PLAYER_6
	removeobject LOCALID_UNION_ROOM_PLAYER_7
	removeobject LOCALID_UNION_ROOM_PLAYER_8
	special UnionRoomSpecial
	end

UnionRoom_OnTransition:: @ 81604BB
	end

UnionRoom_EventScript_Player1:: @ 81604BC
	lock
	faceplayer
	setvar VAR_RESULT, 1
	waitstate
	release
	end

UnionRoom_EventScript_Player2:: @ 81604C6
	lock
	faceplayer
	setvar VAR_RESULT, 2
	waitstate
	release
	end

UnionRoom_EventScript_Player3:: @ 81604D0
	lock
	faceplayer
	setvar VAR_RESULT, 3
	waitstate
	release
	end

UnionRoom_EventScript_Player4:: @ 81604DA
	lock
	faceplayer
	setvar VAR_RESULT, 4
	waitstate
	release
	end

UnionRoom_EventScript_Player5:: @ 81604E4
	lock
	faceplayer
	setvar VAR_RESULT, 5
	waitstate
	release
	end

UnionRoom_EventScript_Player6:: @ 81604EE
	lock
	faceplayer
	setvar VAR_RESULT, 6
	waitstate
	release
	end

UnionRoom_EventScript_Player7:: @ 81604F8
	lock
	faceplayer
	setvar VAR_RESULT, 7
	waitstate
	release
	end

UnionRoom_EventScript_Player8:: @ 8160502
	lock
	faceplayer
	setvar VAR_RESULT, 8
	waitstate
	release
	end

UnionRoom_EventScript_Attendant:: @ 816050C
	lock
	faceplayer
	setvar VAR_RESULT, 9
	waitstate
	release
	end

UnionRoom_EventScript_Unused:: @ 8160516
	lockall
	setvar VAR_RESULT, 10
	waitstate
	releaseall
	end
