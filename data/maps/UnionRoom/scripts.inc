# 1 "data/maps/UnionRoom/scripts.pory"

# 2 "data/maps/UnionRoom/scripts.pory"
UnionRoom_MapScripts::
# 3 "data/maps/UnionRoom/scripts.pory"
	map_script MAP_SCRIPT_ON_RESUME, UnionRoom_OnResume
# 4 "data/maps/UnionRoom/scripts.pory"
	map_script MAP_SCRIPT_ON_TRANSITION, UnionRoom_OnTransition
# 5 "data/maps/UnionRoom/scripts.pory"
	.byte 0
# 6 "data/maps/UnionRoom/scripts.pory"

# 7 "data/maps/UnionRoom/scripts.pory"
UnionRoom_OnResume::
# 8 "data/maps/UnionRoom/scripts.pory"
	setflag FLAG_HIDE_UNION_ROOM_PLAYER_1
# 9 "data/maps/UnionRoom/scripts.pory"
	setflag FLAG_HIDE_UNION_ROOM_PLAYER_2
# 10 "data/maps/UnionRoom/scripts.pory"
	setflag FLAG_HIDE_UNION_ROOM_PLAYER_3
# 11 "data/maps/UnionRoom/scripts.pory"
	setflag FLAG_HIDE_UNION_ROOM_PLAYER_4
# 12 "data/maps/UnionRoom/scripts.pory"
	setflag FLAG_HIDE_UNION_ROOM_PLAYER_5
# 13 "data/maps/UnionRoom/scripts.pory"
	setflag FLAG_HIDE_UNION_ROOM_PLAYER_6
# 14 "data/maps/UnionRoom/scripts.pory"
	setflag FLAG_HIDE_UNION_ROOM_PLAYER_7
# 15 "data/maps/UnionRoom/scripts.pory"
	setflag FLAG_HIDE_UNION_ROOM_PLAYER_8
# 16 "data/maps/UnionRoom/scripts.pory"
	removeobject LOCALID_UNION_ROOM_PLAYER_1
# 17 "data/maps/UnionRoom/scripts.pory"
	removeobject LOCALID_UNION_ROOM_PLAYER_2
# 18 "data/maps/UnionRoom/scripts.pory"
	removeobject LOCALID_UNION_ROOM_PLAYER_3
# 19 "data/maps/UnionRoom/scripts.pory"
	removeobject LOCALID_UNION_ROOM_PLAYER_4
# 20 "data/maps/UnionRoom/scripts.pory"
	removeobject LOCALID_UNION_ROOM_PLAYER_5
# 21 "data/maps/UnionRoom/scripts.pory"
	removeobject LOCALID_UNION_ROOM_PLAYER_6
# 22 "data/maps/UnionRoom/scripts.pory"
	removeobject LOCALID_UNION_ROOM_PLAYER_7
# 23 "data/maps/UnionRoom/scripts.pory"
	removeobject LOCALID_UNION_ROOM_PLAYER_8
# 24 "data/maps/UnionRoom/scripts.pory"
	special RunUnionRoom
# 25 "data/maps/UnionRoom/scripts.pory"
	end
# 26 "data/maps/UnionRoom/scripts.pory"

# 27 "data/maps/UnionRoom/scripts.pory"
UnionRoom_OnTransition::
# 28 "data/maps/UnionRoom/scripts.pory"
	end
# 29 "data/maps/UnionRoom/scripts.pory"

# 30 "data/maps/UnionRoom/scripts.pory"
UnionRoom_EventScript_Player1::
# 31 "data/maps/UnionRoom/scripts.pory"
	lock
# 32 "data/maps/UnionRoom/scripts.pory"
	faceplayer
# 33 "data/maps/UnionRoom/scripts.pory"
	setvar VAR_RESULT, 1
# 34 "data/maps/UnionRoom/scripts.pory"
	waitstate
# 35 "data/maps/UnionRoom/scripts.pory"
	release
# 36 "data/maps/UnionRoom/scripts.pory"
	end
# 37 "data/maps/UnionRoom/scripts.pory"

# 38 "data/maps/UnionRoom/scripts.pory"
UnionRoom_EventScript_Player2::
# 39 "data/maps/UnionRoom/scripts.pory"
	lock
# 40 "data/maps/UnionRoom/scripts.pory"
	faceplayer
# 41 "data/maps/UnionRoom/scripts.pory"
	setvar VAR_RESULT, 2
# 42 "data/maps/UnionRoom/scripts.pory"
	waitstate
# 43 "data/maps/UnionRoom/scripts.pory"
	release
# 44 "data/maps/UnionRoom/scripts.pory"
	end
# 45 "data/maps/UnionRoom/scripts.pory"

# 46 "data/maps/UnionRoom/scripts.pory"
UnionRoom_EventScript_Player3::
# 47 "data/maps/UnionRoom/scripts.pory"
	lock
# 48 "data/maps/UnionRoom/scripts.pory"
	faceplayer
# 49 "data/maps/UnionRoom/scripts.pory"
	setvar VAR_RESULT, 3
# 50 "data/maps/UnionRoom/scripts.pory"
	waitstate
# 51 "data/maps/UnionRoom/scripts.pory"
	release
# 52 "data/maps/UnionRoom/scripts.pory"
	end
# 53 "data/maps/UnionRoom/scripts.pory"

# 54 "data/maps/UnionRoom/scripts.pory"
UnionRoom_EventScript_Player4::
# 55 "data/maps/UnionRoom/scripts.pory"
	lock
# 56 "data/maps/UnionRoom/scripts.pory"
	faceplayer
# 57 "data/maps/UnionRoom/scripts.pory"
	setvar VAR_RESULT, 4
# 58 "data/maps/UnionRoom/scripts.pory"
	waitstate
# 59 "data/maps/UnionRoom/scripts.pory"
	release
# 60 "data/maps/UnionRoom/scripts.pory"
	end
# 61 "data/maps/UnionRoom/scripts.pory"

# 62 "data/maps/UnionRoom/scripts.pory"
UnionRoom_EventScript_Player5::
# 63 "data/maps/UnionRoom/scripts.pory"
	lock
# 64 "data/maps/UnionRoom/scripts.pory"
	faceplayer
# 65 "data/maps/UnionRoom/scripts.pory"
	setvar VAR_RESULT, 5
# 66 "data/maps/UnionRoom/scripts.pory"
	waitstate
# 67 "data/maps/UnionRoom/scripts.pory"
	release
# 68 "data/maps/UnionRoom/scripts.pory"
	end
# 69 "data/maps/UnionRoom/scripts.pory"

# 70 "data/maps/UnionRoom/scripts.pory"
UnionRoom_EventScript_Player6::
# 71 "data/maps/UnionRoom/scripts.pory"
	lock
# 72 "data/maps/UnionRoom/scripts.pory"
	faceplayer
# 73 "data/maps/UnionRoom/scripts.pory"
	setvar VAR_RESULT, 6
# 74 "data/maps/UnionRoom/scripts.pory"
	waitstate
# 75 "data/maps/UnionRoom/scripts.pory"
	release
# 76 "data/maps/UnionRoom/scripts.pory"
	end
# 77 "data/maps/UnionRoom/scripts.pory"

# 78 "data/maps/UnionRoom/scripts.pory"
UnionRoom_EventScript_Player7::
# 79 "data/maps/UnionRoom/scripts.pory"
	lock
# 80 "data/maps/UnionRoom/scripts.pory"
	faceplayer
# 81 "data/maps/UnionRoom/scripts.pory"
	setvar VAR_RESULT, 7
# 82 "data/maps/UnionRoom/scripts.pory"
	waitstate
# 83 "data/maps/UnionRoom/scripts.pory"
	release
# 84 "data/maps/UnionRoom/scripts.pory"
	end
# 85 "data/maps/UnionRoom/scripts.pory"

# 86 "data/maps/UnionRoom/scripts.pory"
UnionRoom_EventScript_Player8::
# 87 "data/maps/UnionRoom/scripts.pory"
	lock
# 88 "data/maps/UnionRoom/scripts.pory"
	faceplayer
# 89 "data/maps/UnionRoom/scripts.pory"
	setvar VAR_RESULT, 8
# 90 "data/maps/UnionRoom/scripts.pory"
	waitstate
# 91 "data/maps/UnionRoom/scripts.pory"
	release
# 92 "data/maps/UnionRoom/scripts.pory"
	end
# 93 "data/maps/UnionRoom/scripts.pory"

# 94 "data/maps/UnionRoom/scripts.pory"
UnionRoom_EventScript_Attendant::
# 95 "data/maps/UnionRoom/scripts.pory"
	lock
# 96 "data/maps/UnionRoom/scripts.pory"
	faceplayer
# 97 "data/maps/UnionRoom/scripts.pory"
	setvar VAR_RESULT, 9
# 98 "data/maps/UnionRoom/scripts.pory"
	waitstate
# 99 "data/maps/UnionRoom/scripts.pory"
	release
# 100 "data/maps/UnionRoom/scripts.pory"
	end
# 101 "data/maps/UnionRoom/scripts.pory"

# 102 "data/maps/UnionRoom/scripts.pory"
UnionRoom_EventScript_Unused::
# 103 "data/maps/UnionRoom/scripts.pory"
	lockall
# 104 "data/maps/UnionRoom/scripts.pory"
	setvar VAR_RESULT, 10
# 105 "data/maps/UnionRoom/scripts.pory"
	waitstate
# 106 "data/maps/UnionRoom/scripts.pory"
	releaseall
# 107 "data/maps/UnionRoom/scripts.pory"
	end
