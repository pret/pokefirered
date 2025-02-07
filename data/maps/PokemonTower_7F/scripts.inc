# 1 "data/maps/PokemonTower_7F/scripts.pory"

# 2 "data/maps/PokemonTower_7F/scripts.pory"
.set LOCALID_GRUNT1, 2
# 3 "data/maps/PokemonTower_7F/scripts.pory"
.set LOCALID_GRUNT2, 3
# 4 "data/maps/PokemonTower_7F/scripts.pory"
.set LOCALID_GRUNT3, 4
# 5 "data/maps/PokemonTower_7F/scripts.pory"

# 6 "data/maps/PokemonTower_7F/scripts.pory"
PokemonTower_7F_MapScripts::
# 7 "data/maps/PokemonTower_7F/scripts.pory"
	.byte 0
# 8 "data/maps/PokemonTower_7F/scripts.pory"

# 9 "data/maps/PokemonTower_7F/scripts.pory"
PokemonTower_7F_EventScript_MrFuji::
# 10 "data/maps/PokemonTower_7F/scripts.pory"
	lock
# 11 "data/maps/PokemonTower_7F/scripts.pory"
	faceplayer
# 12 "data/maps/PokemonTower_7F/scripts.pory"
	famechecker FAMECHECKER_MRFUJI, FCPICKSTATE_COLORED, UpdatePickStateFromSpecialVar8005
# 13 "data/maps/PokemonTower_7F/scripts.pory"
	setflag FLAG_HIDE_TOWER_FUJI
# 14 "data/maps/PokemonTower_7F/scripts.pory"
	clearflag FLAG_HIDE_POKEHOUSE_FUJI
# 15 "data/maps/PokemonTower_7F/scripts.pory"
	setflag FLAG_RESCUED_MR_FUJI
# 16 "data/maps/PokemonTower_7F/scripts.pory"
	msgbox PokemonTower_7F_Text_MrFujiThankYouFollowMe
# 17 "data/maps/PokemonTower_7F/scripts.pory"
	closemessage
# 18 "data/maps/PokemonTower_7F/scripts.pory"
	warp MAP_LAVENDER_TOWN_VOLUNTEER_POKEMON_HOUSE, 4, 7
# 19 "data/maps/PokemonTower_7F/scripts.pory"
	waitstate
# 20 "data/maps/PokemonTower_7F/scripts.pory"
	release
# 21 "data/maps/PokemonTower_7F/scripts.pory"
	end
# 22 "data/maps/PokemonTower_7F/scripts.pory"

# 23 "data/maps/PokemonTower_7F/scripts.pory"
PokemonTower_7F_EventScript_Grunt1::
# 24 "data/maps/PokemonTower_7F/scripts.pory"
	trainerbattle_single TRAINER_TEAM_ROCKET_GRUNT_19, PokemonTower_7F_Text_Grunt1Intro, PokemonTower_7F_Text_Grunt1Defeat, PokemonTower_7F_EventScript_DefeatedGrunt1
# 25 "data/maps/PokemonTower_7F/scripts.pory"
	msgbox PokemonTower_7F_Text_Grunt1PostBattle, MSGBOX_AUTOCLOSE
# 26 "data/maps/PokemonTower_7F/scripts.pory"
	end
# 27 "data/maps/PokemonTower_7F/scripts.pory"

# 28 "data/maps/PokemonTower_7F/scripts.pory"
PokemonTower_7F_EventScript_DefeatedGrunt1::
# 29 "data/maps/PokemonTower_7F/scripts.pory"
	msgbox PokemonTower_7F_Text_Grunt1PostBattle
# 30 "data/maps/PokemonTower_7F/scripts.pory"
	closemessage
# 31 "data/maps/PokemonTower_7F/scripts.pory"
	getplayerxy VAR_0x8004, VAR_0x8005
# 32 "data/maps/PokemonTower_7F/scripts.pory"
	goto_if_eq VAR_0x8004, 10, PokemonTower_7F_EventScript_Grunt1ExitMid
# 33 "data/maps/PokemonTower_7F/scripts.pory"
	goto_if_eq VAR_0x8004, 11, PokemonTower_7F_EventScript_Grunt1ExitRight
# 34 "data/maps/PokemonTower_7F/scripts.pory"
	goto_if_eq VAR_0x8004, 9, PokemonTower_7F_EventScript_Grunt1ExitLeft
# 35 "data/maps/PokemonTower_7F/scripts.pory"
	applymovement LOCALID_GRUNT1, PokemonTower_7F_Movement_Grunt1Exit
# 36 "data/maps/PokemonTower_7F/scripts.pory"
	waitmovement 0
# 37 "data/maps/PokemonTower_7F/scripts.pory"
	goto PokemonTower_7F_EventScript_RemoveGrunt1
# 38 "data/maps/PokemonTower_7F/scripts.pory"
	end
# 39 "data/maps/PokemonTower_7F/scripts.pory"

# 40 "data/maps/PokemonTower_7F/scripts.pory"
PokemonTower_7F_EventScript_Grunt1ExitMid::
# 41 "data/maps/PokemonTower_7F/scripts.pory"
	applymovement LOCALID_GRUNT1, PokemonTower_7F_Movement_Grunt1ExitMid
# 42 "data/maps/PokemonTower_7F/scripts.pory"
	waitmovement 0
# 43 "data/maps/PokemonTower_7F/scripts.pory"
	goto PokemonTower_7F_EventScript_RemoveGrunt1
# 44 "data/maps/PokemonTower_7F/scripts.pory"
	end
# 45 "data/maps/PokemonTower_7F/scripts.pory"

# 46 "data/maps/PokemonTower_7F/scripts.pory"
PokemonTower_7F_EventScript_Grunt1ExitRight::
# 47 "data/maps/PokemonTower_7F/scripts.pory"
	applymovement LOCALID_GRUNT1, PokemonTower_7F_Movement_Grunt1ExitRight
# 48 "data/maps/PokemonTower_7F/scripts.pory"
	waitmovement 0
# 49 "data/maps/PokemonTower_7F/scripts.pory"
	goto PokemonTower_7F_EventScript_RemoveGrunt1
# 50 "data/maps/PokemonTower_7F/scripts.pory"
	end
# 51 "data/maps/PokemonTower_7F/scripts.pory"

# 52 "data/maps/PokemonTower_7F/scripts.pory"
PokemonTower_7F_EventScript_Grunt1ExitLeft::
# 53 "data/maps/PokemonTower_7F/scripts.pory"
	applymovement LOCALID_GRUNT1, PokemonTower_7F_Movement_Grunt1ExitLeft
# 54 "data/maps/PokemonTower_7F/scripts.pory"
	waitmovement 0
# 55 "data/maps/PokemonTower_7F/scripts.pory"
	playse SE_EXIT
# 56 "data/maps/PokemonTower_7F/scripts.pory"
	delay 25
# 57 "data/maps/PokemonTower_7F/scripts.pory"
	goto PokemonTower_7F_EventScript_RemoveGrunt1
# 58 "data/maps/PokemonTower_7F/scripts.pory"
	end
# 59 "data/maps/PokemonTower_7F/scripts.pory"

# 60 "data/maps/PokemonTower_7F/scripts.pory"
PokemonTower_7F_EventScript_RemoveGrunt1::
# 61 "data/maps/PokemonTower_7F/scripts.pory"
	removeobject LOCALID_GRUNT1
# 62 "data/maps/PokemonTower_7F/scripts.pory"
	release
# 63 "data/maps/PokemonTower_7F/scripts.pory"
	end
# 64 "data/maps/PokemonTower_7F/scripts.pory"

# 65 "data/maps/PokemonTower_7F/scripts.pory"
PokemonTower_7F_Movement_Grunt1ExitMid::
# 66 "data/maps/PokemonTower_7F/scripts.pory"
	walk_down
# 67 "data/maps/PokemonTower_7F/scripts.pory"
	walk_right
# 68 "data/maps/PokemonTower_7F/scripts.pory"
	walk_down
# 69 "data/maps/PokemonTower_7F/scripts.pory"
	walk_down
# 70 "data/maps/PokemonTower_7F/scripts.pory"
	walk_down
# 71 "data/maps/PokemonTower_7F/scripts.pory"
	walk_right
# 72 "data/maps/PokemonTower_7F/scripts.pory"
	walk_down
# 73 "data/maps/PokemonTower_7F/scripts.pory"
	walk_down
# 74 "data/maps/PokemonTower_7F/scripts.pory"
	step_end
# 75 "data/maps/PokemonTower_7F/scripts.pory"

# 76 "data/maps/PokemonTower_7F/scripts.pory"
PokemonTower_7F_Movement_Grunt1ExitRight::
# 77 "data/maps/PokemonTower_7F/scripts.pory"
	walk_down
# 78 "data/maps/PokemonTower_7F/scripts.pory"
	walk_down
# 79 "data/maps/PokemonTower_7F/scripts.pory"
	walk_down
# 80 "data/maps/PokemonTower_7F/scripts.pory"
	walk_down
# 81 "data/maps/PokemonTower_7F/scripts.pory"
	walk_right
# 82 "data/maps/PokemonTower_7F/scripts.pory"
	walk_down
# 83 "data/maps/PokemonTower_7F/scripts.pory"
	walk_down
# 84 "data/maps/PokemonTower_7F/scripts.pory"
	step_end
# 85 "data/maps/PokemonTower_7F/scripts.pory"

# 86 "data/maps/PokemonTower_7F/scripts.pory"
PokemonTower_7F_Movement_Grunt1Exit::
# 87 "data/maps/PokemonTower_7F/scripts.pory"
	walk_down
# 88 "data/maps/PokemonTower_7F/scripts.pory"
	walk_down
# 89 "data/maps/PokemonTower_7F/scripts.pory"
	walk_down
# 90 "data/maps/PokemonTower_7F/scripts.pory"
	walk_down
# 91 "data/maps/PokemonTower_7F/scripts.pory"
	walk_down
# 92 "data/maps/PokemonTower_7F/scripts.pory"
	walk_down
# 93 "data/maps/PokemonTower_7F/scripts.pory"
	step_end
# 94 "data/maps/PokemonTower_7F/scripts.pory"

# 95 "data/maps/PokemonTower_7F/scripts.pory"
PokemonTower_7F_Movement_Grunt1ExitLeft::
# 96 "data/maps/PokemonTower_7F/scripts.pory"
	walk_right
# 97 "data/maps/PokemonTower_7F/scripts.pory"
	walk_down
# 98 "data/maps/PokemonTower_7F/scripts.pory"
	walk_down
# 99 "data/maps/PokemonTower_7F/scripts.pory"
	walk_down
# 100 "data/maps/PokemonTower_7F/scripts.pory"
	walk_down
# 101 "data/maps/PokemonTower_7F/scripts.pory"
	walk_right
# 102 "data/maps/PokemonTower_7F/scripts.pory"
	walk_down
# 103 "data/maps/PokemonTower_7F/scripts.pory"
	walk_down
# 104 "data/maps/PokemonTower_7F/scripts.pory"
	walk_in_place_faster_left
# 105 "data/maps/PokemonTower_7F/scripts.pory"
	step_end
# 106 "data/maps/PokemonTower_7F/scripts.pory"

# 107 "data/maps/PokemonTower_7F/scripts.pory"
PokemonTower_7F_EventScript_Grunt2::
# 108 "data/maps/PokemonTower_7F/scripts.pory"
	trainerbattle_single TRAINER_TEAM_ROCKET_GRUNT_20, PokemonTower_7F_Text_Grunt2Intro, PokemonTower_7F_Text_Grunt2Defeat, PokemonTower_7F_EventScript_DefeatedGrunt2
# 109 "data/maps/PokemonTower_7F/scripts.pory"
	msgbox PokemonTower_7F_Text_Grunt2PostBattle, MSGBOX_AUTOCLOSE
# 110 "data/maps/PokemonTower_7F/scripts.pory"
	end
# 111 "data/maps/PokemonTower_7F/scripts.pory"

# 112 "data/maps/PokemonTower_7F/scripts.pory"
PokemonTower_7F_EventScript_DefeatedGrunt2::
# 113 "data/maps/PokemonTower_7F/scripts.pory"
	famechecker FAMECHECKER_MRFUJI, 1
# 114 "data/maps/PokemonTower_7F/scripts.pory"
	msgbox PokemonTower_7F_Text_Grunt2PostBattle
# 115 "data/maps/PokemonTower_7F/scripts.pory"
	closemessage
# 116 "data/maps/PokemonTower_7F/scripts.pory"
	getplayerxy VAR_0x8004, VAR_0x8005
# 117 "data/maps/PokemonTower_7F/scripts.pory"
	goto_if_eq VAR_0x8004, 12, PokemonTower_7F_EventScript_Grunt2ExitLeft
# 118 "data/maps/PokemonTower_7F/scripts.pory"
	goto_if_eq VAR_0x8004, 13, PokemonTower_7F_EventScript_Grunt2ExitRight
# 119 "data/maps/PokemonTower_7F/scripts.pory"
	applymovement LOCALID_GRUNT2, PokemonTower_7F_Movement_Grunt2Exit
# 120 "data/maps/PokemonTower_7F/scripts.pory"
	waitmovement 0
# 121 "data/maps/PokemonTower_7F/scripts.pory"
	goto PokemonTower_7F_EventScript_RemoveGrunt2
# 122 "data/maps/PokemonTower_7F/scripts.pory"
	end
# 123 "data/maps/PokemonTower_7F/scripts.pory"

# 124 "data/maps/PokemonTower_7F/scripts.pory"
PokemonTower_7F_EventScript_Grunt2ExitLeft::
# 125 "data/maps/PokemonTower_7F/scripts.pory"
	applymovement LOCALID_GRUNT2, PokemonTower_7F_Movement_Grunt2ExitLeft
# 126 "data/maps/PokemonTower_7F/scripts.pory"
	waitmovement 0
# 127 "data/maps/PokemonTower_7F/scripts.pory"
	goto PokemonTower_7F_EventScript_RemoveGrunt2
# 128 "data/maps/PokemonTower_7F/scripts.pory"
	end
# 129 "data/maps/PokemonTower_7F/scripts.pory"

# 130 "data/maps/PokemonTower_7F/scripts.pory"
PokemonTower_7F_EventScript_Grunt2ExitRight::
# 131 "data/maps/PokemonTower_7F/scripts.pory"
	applymovement LOCALID_GRUNT2, PokemonTower_7F_Movement_Grunt2ExitRight
# 132 "data/maps/PokemonTower_7F/scripts.pory"
	waitmovement 0
# 133 "data/maps/PokemonTower_7F/scripts.pory"
	goto PokemonTower_7F_EventScript_RemoveGrunt2
# 134 "data/maps/PokemonTower_7F/scripts.pory"
	end
# 135 "data/maps/PokemonTower_7F/scripts.pory"

# 136 "data/maps/PokemonTower_7F/scripts.pory"
PokemonTower_7F_EventScript_RemoveGrunt2::
# 137 "data/maps/PokemonTower_7F/scripts.pory"
	removeobject LOCALID_GRUNT2
# 138 "data/maps/PokemonTower_7F/scripts.pory"
	release
# 139 "data/maps/PokemonTower_7F/scripts.pory"
	end
# 140 "data/maps/PokemonTower_7F/scripts.pory"

# 141 "data/maps/PokemonTower_7F/scripts.pory"
PokemonTower_7F_Movement_Grunt2ExitLeft::
# 142 "data/maps/PokemonTower_7F/scripts.pory"
	walk_down
# 143 "data/maps/PokemonTower_7F/scripts.pory"
	walk_down
# 144 "data/maps/PokemonTower_7F/scripts.pory"
	walk_down
# 145 "data/maps/PokemonTower_7F/scripts.pory"
	walk_left
# 146 "data/maps/PokemonTower_7F/scripts.pory"
	walk_down
# 147 "data/maps/PokemonTower_7F/scripts.pory"
	walk_down
# 148 "data/maps/PokemonTower_7F/scripts.pory"
	walk_down
# 149 "data/maps/PokemonTower_7F/scripts.pory"
	step_end
# 150 "data/maps/PokemonTower_7F/scripts.pory"

# 151 "data/maps/PokemonTower_7F/scripts.pory"
PokemonTower_7F_Movement_Grunt2Exit::
# 152 "data/maps/PokemonTower_7F/scripts.pory"
	walk_down
# 153 "data/maps/PokemonTower_7F/scripts.pory"
	walk_down
# 154 "data/maps/PokemonTower_7F/scripts.pory"
	walk_down
# 155 "data/maps/PokemonTower_7F/scripts.pory"
	walk_down
# 156 "data/maps/PokemonTower_7F/scripts.pory"
	walk_down
# 157 "data/maps/PokemonTower_7F/scripts.pory"
	walk_down
# 158 "data/maps/PokemonTower_7F/scripts.pory"
	step_end
# 159 "data/maps/PokemonTower_7F/scripts.pory"

# 160 "data/maps/PokemonTower_7F/scripts.pory"
PokemonTower_7F_Movement_Grunt2ExitRight::
# 161 "data/maps/PokemonTower_7F/scripts.pory"
	walk_left
# 162 "data/maps/PokemonTower_7F/scripts.pory"
	walk_down
# 163 "data/maps/PokemonTower_7F/scripts.pory"
	walk_down
# 164 "data/maps/PokemonTower_7F/scripts.pory"
	walk_down
# 165 "data/maps/PokemonTower_7F/scripts.pory"
	walk_down
# 166 "data/maps/PokemonTower_7F/scripts.pory"
	walk_down
# 167 "data/maps/PokemonTower_7F/scripts.pory"
	walk_down
# 168 "data/maps/PokemonTower_7F/scripts.pory"
	walk_down
# 169 "data/maps/PokemonTower_7F/scripts.pory"
	step_end
# 170 "data/maps/PokemonTower_7F/scripts.pory"

# 171 "data/maps/PokemonTower_7F/scripts.pory"
PokemonTower_7F_EventScript_Grunt3::
# 172 "data/maps/PokemonTower_7F/scripts.pory"
	trainerbattle_single TRAINER_TEAM_ROCKET_GRUNT_21, PokemonTower_7F_Text_Grunt3Intro, PokemonTower_7F_Text_Grunt3Defeat, PokemonTower_7F_EventScript_DefeatedGrunt3
# 173 "data/maps/PokemonTower_7F/scripts.pory"
	msgbox PokemonTower_7F_Text_Grunt3PostBattle, MSGBOX_AUTOCLOSE
# 174 "data/maps/PokemonTower_7F/scripts.pory"
	end
# 175 "data/maps/PokemonTower_7F/scripts.pory"

# 176 "data/maps/PokemonTower_7F/scripts.pory"
PokemonTower_7F_EventScript_DefeatedGrunt3::
# 177 "data/maps/PokemonTower_7F/scripts.pory"
	msgbox PokemonTower_7F_Text_Grunt3PostBattle
# 178 "data/maps/PokemonTower_7F/scripts.pory"
	closemessage
# 179 "data/maps/PokemonTower_7F/scripts.pory"
	getplayerxy VAR_0x8004, VAR_0x8005
# 180 "data/maps/PokemonTower_7F/scripts.pory"
	goto_if_eq VAR_0x8004, 10, PokemonTower_7F_EventScript_Grunt3ExitRight
# 181 "data/maps/PokemonTower_7F/scripts.pory"
	goto_if_eq VAR_0x8004, 9, PokemonTower_7F_EventScript_Grunt3ExitLeft
# 182 "data/maps/PokemonTower_7F/scripts.pory"
	applymovement LOCALID_GRUNT3, PokemonTower_7F_Movement_Grunt3Exit
# 183 "data/maps/PokemonTower_7F/scripts.pory"
	waitmovement 0
# 184 "data/maps/PokemonTower_7F/scripts.pory"
	goto PokemonTower_7F_EventScript_RemoveGrunt3
# 185 "data/maps/PokemonTower_7F/scripts.pory"
	end
# 186 "data/maps/PokemonTower_7F/scripts.pory"

# 187 "data/maps/PokemonTower_7F/scripts.pory"
PokemonTower_7F_EventScript_Grunt3ExitRight::
# 188 "data/maps/PokemonTower_7F/scripts.pory"
	applymovement LOCALID_GRUNT3, PokemonTower_7F_Movement_Grunt3ExitRight
# 189 "data/maps/PokemonTower_7F/scripts.pory"
	waitmovement 0
# 190 "data/maps/PokemonTower_7F/scripts.pory"
	goto PokemonTower_7F_EventScript_RemoveGrunt3
# 191 "data/maps/PokemonTower_7F/scripts.pory"
	end
# 192 "data/maps/PokemonTower_7F/scripts.pory"

# 193 "data/maps/PokemonTower_7F/scripts.pory"
PokemonTower_7F_EventScript_Grunt3ExitLeft::
# 194 "data/maps/PokemonTower_7F/scripts.pory"
	applymovement LOCALID_GRUNT3, PokemonTower_7F_Movement_Grunt3ExitLeft
# 195 "data/maps/PokemonTower_7F/scripts.pory"
	waitmovement 0
# 196 "data/maps/PokemonTower_7F/scripts.pory"
	goto PokemonTower_7F_EventScript_RemoveGrunt3
# 197 "data/maps/PokemonTower_7F/scripts.pory"
	end
# 198 "data/maps/PokemonTower_7F/scripts.pory"

# 199 "data/maps/PokemonTower_7F/scripts.pory"
PokemonTower_7F_EventScript_RemoveGrunt3::
# 200 "data/maps/PokemonTower_7F/scripts.pory"
	removeobject LOCALID_GRUNT3
# 201 "data/maps/PokemonTower_7F/scripts.pory"
	release
# 202 "data/maps/PokemonTower_7F/scripts.pory"
	end
# 203 "data/maps/PokemonTower_7F/scripts.pory"

# 204 "data/maps/PokemonTower_7F/scripts.pory"
PokemonTower_7F_EventScript_Unused::
# 205 "data/maps/PokemonTower_7F/scripts.pory"
	release
# 206 "data/maps/PokemonTower_7F/scripts.pory"
	end
# 207 "data/maps/PokemonTower_7F/scripts.pory"

# 208 "data/maps/PokemonTower_7F/scripts.pory"
PokemonTower_7F_Movement_Grunt3ExitRight::
# 209 "data/maps/PokemonTower_7F/scripts.pory"
	walk_down
# 210 "data/maps/PokemonTower_7F/scripts.pory"
	walk_down
# 211 "data/maps/PokemonTower_7F/scripts.pory"
	walk_down
# 212 "data/maps/PokemonTower_7F/scripts.pory"
	walk_down
# 213 "data/maps/PokemonTower_7F/scripts.pory"
	walk_down
# 214 "data/maps/PokemonTower_7F/scripts.pory"
	walk_right
# 215 "data/maps/PokemonTower_7F/scripts.pory"
	walk_down
# 216 "data/maps/PokemonTower_7F/scripts.pory"
	step_end
# 217 "data/maps/PokemonTower_7F/scripts.pory"

# 218 "data/maps/PokemonTower_7F/scripts.pory"
PokemonTower_7F_Movement_Grunt3Exit::
# 219 "data/maps/PokemonTower_7F/scripts.pory"
	walk_down
# 220 "data/maps/PokemonTower_7F/scripts.pory"
	walk_down
# 221 "data/maps/PokemonTower_7F/scripts.pory"
	walk_down
# 222 "data/maps/PokemonTower_7F/scripts.pory"
	walk_down
# 223 "data/maps/PokemonTower_7F/scripts.pory"
	walk_down
# 224 "data/maps/PokemonTower_7F/scripts.pory"
	walk_down
# 225 "data/maps/PokemonTower_7F/scripts.pory"
	step_end
# 226 "data/maps/PokemonTower_7F/scripts.pory"

# 227 "data/maps/PokemonTower_7F/scripts.pory"
PokemonTower_7F_Movement_Grunt3ExitLeft::
# 228 "data/maps/PokemonTower_7F/scripts.pory"
	walk_right
# 229 "data/maps/PokemonTower_7F/scripts.pory"
	walk_down
# 230 "data/maps/PokemonTower_7F/scripts.pory"
	walk_down
# 231 "data/maps/PokemonTower_7F/scripts.pory"
	walk_down
# 232 "data/maps/PokemonTower_7F/scripts.pory"
	walk_down
# 233 "data/maps/PokemonTower_7F/scripts.pory"
	walk_down
# 234 "data/maps/PokemonTower_7F/scripts.pory"
	walk_down
# 235 "data/maps/PokemonTower_7F/scripts.pory"
	walk_down
# 236 "data/maps/PokemonTower_7F/scripts.pory"
	step_end
