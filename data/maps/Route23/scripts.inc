# 1 "data/maps/Route23/scripts.pory"

# 2 "data/maps/Route23/scripts.pory"
.set LOCALID_CASCADE_BADGE_GUARD, 1
# 3 "data/maps/Route23/scripts.pory"
.set LOCALID_THUNDER_BADGE_GUARD, 2
# 4 "data/maps/Route23/scripts.pory"
.set LOCALID_RAINBOW_BADGE_GUARD, 3
# 5 "data/maps/Route23/scripts.pory"
.set LOCALID_SOUL_BADGE_GUARD,    4
# 6 "data/maps/Route23/scripts.pory"
.set LOCALID_MARSH_BADGE_GUARD,   5
# 7 "data/maps/Route23/scripts.pory"
.set LOCALID_VOLCANO_BADGE_GUARD, 6
# 8 "data/maps/Route23/scripts.pory"
.set LOCALID_EARTH_BADGE_GUARD,   7
# 9 "data/maps/Route23/scripts.pory"

# 10 "data/maps/Route23/scripts.pory"
Route23_MapScripts::
# 11 "data/maps/Route23/scripts.pory"
	map_script MAP_SCRIPT_ON_TRANSITION, Route23_OnTransition
# 12 "data/maps/Route23/scripts.pory"
	.byte 0
# 13 "data/maps/Route23/scripts.pory"

# 14 "data/maps/Route23/scripts.pory"
Route23_OnTransition::
# 15 "data/maps/Route23/scripts.pory"
	clearflag FLAG_HIDE_VICTORY_ROAD_3F_BOULDER
# 16 "data/maps/Route23/scripts.pory"
	setflag FLAG_HIDE_VICTORY_ROAD_2F_BOULDER
# 17 "data/maps/Route23/scripts.pory"
	setvar VAR_MAP_SCENE_VICTORY_ROAD_1F, 0
# 18 "data/maps/Route23/scripts.pory"
	setvar VAR_MAP_SCENE_VICTORY_ROAD_2F_BOULDER1, 0
# 19 "data/maps/Route23/scripts.pory"
	setvar VAR_MAP_SCENE_VICTORY_ROAD_2F_BOULDER2, 0
# 20 "data/maps/Route23/scripts.pory"
	setvar VAR_MAP_SCENE_VICTORY_ROAD_3F, 0
# 21 "data/maps/Route23/scripts.pory"
	end
# 22 "data/maps/Route23/scripts.pory"

# 23 "data/maps/Route23/scripts.pory"
Route23_EventScript_CascadeBadgeGuard::
# 24 "data/maps/Route23/scripts.pory"
	lock
# 25 "data/maps/Route23/scripts.pory"
	faceplayer
# 26 "data/maps/Route23/scripts.pory"
	setvar VAR_TEMP_1, 2
# 27 "data/maps/Route23/scripts.pory"
	bufferstdstring STR_VAR_1, STDSTRING_CASCADE_BADGE
# 28 "data/maps/Route23/scripts.pory"
	goto Route23_EventScript_BadgeGuard
# 29 "data/maps/Route23/scripts.pory"
	end
# 30 "data/maps/Route23/scripts.pory"

# 31 "data/maps/Route23/scripts.pory"
Route23_EventScript_ThunderBadgeGuard::
# 32 "data/maps/Route23/scripts.pory"
	lock
# 33 "data/maps/Route23/scripts.pory"
	faceplayer
# 34 "data/maps/Route23/scripts.pory"
	setvar VAR_TEMP_1, 3
# 35 "data/maps/Route23/scripts.pory"
	bufferstdstring STR_VAR_1, STDSTRING_THUNDER_BADGE
# 36 "data/maps/Route23/scripts.pory"
	goto Route23_EventScript_BadgeGuard
# 37 "data/maps/Route23/scripts.pory"
	end
# 38 "data/maps/Route23/scripts.pory"

# 39 "data/maps/Route23/scripts.pory"
Route23_EventScript_RainbowBadgeGuard::
# 40 "data/maps/Route23/scripts.pory"
	lock
# 41 "data/maps/Route23/scripts.pory"
	faceplayer
# 42 "data/maps/Route23/scripts.pory"
	setvar VAR_TEMP_1, 4
# 43 "data/maps/Route23/scripts.pory"
	bufferstdstring STR_VAR_1, STDSTRING_RAINBOW_BADGE
# 44 "data/maps/Route23/scripts.pory"
	goto Route23_EventScript_BadgeGuard
# 45 "data/maps/Route23/scripts.pory"
	end
# 46 "data/maps/Route23/scripts.pory"

# 47 "data/maps/Route23/scripts.pory"
Route23_EventScript_SoulBadgeGuard::
# 48 "data/maps/Route23/scripts.pory"
	lock
# 49 "data/maps/Route23/scripts.pory"
	faceplayer
# 50 "data/maps/Route23/scripts.pory"
	setvar VAR_TEMP_1, 5
# 51 "data/maps/Route23/scripts.pory"
	bufferstdstring STR_VAR_1, STDSTRING_SOUL_BADGE
# 52 "data/maps/Route23/scripts.pory"
	goto Route23_EventScript_BadgeGuard
# 53 "data/maps/Route23/scripts.pory"
	end
# 54 "data/maps/Route23/scripts.pory"

# 55 "data/maps/Route23/scripts.pory"
Route23_EventScript_MarshBadgeGuard::
# 56 "data/maps/Route23/scripts.pory"
	lock
# 57 "data/maps/Route23/scripts.pory"
	faceplayer
# 58 "data/maps/Route23/scripts.pory"
	setvar VAR_TEMP_1, 6
# 59 "data/maps/Route23/scripts.pory"
	bufferstdstring STR_VAR_1, STDSTRING_MARSH_BADGE
# 60 "data/maps/Route23/scripts.pory"
	goto Route23_EventScript_BadgeGuard
# 61 "data/maps/Route23/scripts.pory"
	end
# 62 "data/maps/Route23/scripts.pory"

# 63 "data/maps/Route23/scripts.pory"
Route23_EventScript_VolcanoBadgeGuard::
# 64 "data/maps/Route23/scripts.pory"
	lock
# 65 "data/maps/Route23/scripts.pory"
	faceplayer
# 66 "data/maps/Route23/scripts.pory"
	setvar VAR_TEMP_1, 7
# 67 "data/maps/Route23/scripts.pory"
	bufferstdstring STR_VAR_1, STDSTRING_VOLCANO_BADGE
# 68 "data/maps/Route23/scripts.pory"
	goto Route23_EventScript_BadgeGuard
# 69 "data/maps/Route23/scripts.pory"
	end
# 70 "data/maps/Route23/scripts.pory"

# 71 "data/maps/Route23/scripts.pory"
Route23_EventScript_EarthBadgeGuard::
# 72 "data/maps/Route23/scripts.pory"
	lock
# 73 "data/maps/Route23/scripts.pory"
	faceplayer
# 74 "data/maps/Route23/scripts.pory"
	setvar VAR_TEMP_1, 8
# 75 "data/maps/Route23/scripts.pory"
	bufferstdstring STR_VAR_1, STDSTRING_EARTH_BADGE
# 76 "data/maps/Route23/scripts.pory"
	goto Route23_EventScript_BadgeGuard
# 77 "data/maps/Route23/scripts.pory"
	end
# 78 "data/maps/Route23/scripts.pory"

# 79 "data/maps/Route23/scripts.pory"
Route23_EventScript_CascadeBadgeGuardTrigger::
# 80 "data/maps/Route23/scripts.pory"
	lockall
# 81 "data/maps/Route23/scripts.pory"
	setvar VAR_TEMP_1, 2
# 82 "data/maps/Route23/scripts.pory"
	setvar VAR_0x8009, LOCALID_CASCADE_BADGE_GUARD
# 83 "data/maps/Route23/scripts.pory"
	bufferstdstring STR_VAR_1, STDSTRING_CASCADE_BADGE
# 84 "data/maps/Route23/scripts.pory"
	goto Route23_EventScript_BadgeGuardTrigger
# 85 "data/maps/Route23/scripts.pory"
	end
# 86 "data/maps/Route23/scripts.pory"

# 87 "data/maps/Route23/scripts.pory"
Route23_EventScript_ThunderBadgeGuardTrigger::
# 88 "data/maps/Route23/scripts.pory"
	lockall
# 89 "data/maps/Route23/scripts.pory"
	setvar VAR_TEMP_1, 3
# 90 "data/maps/Route23/scripts.pory"
	setvar VAR_0x8009, LOCALID_THUNDER_BADGE_GUARD
# 91 "data/maps/Route23/scripts.pory"
	bufferstdstring STR_VAR_1, STDSTRING_THUNDER_BADGE
# 92 "data/maps/Route23/scripts.pory"
	goto Route23_EventScript_BadgeGuardTrigger
# 93 "data/maps/Route23/scripts.pory"
	end
# 94 "data/maps/Route23/scripts.pory"

# 95 "data/maps/Route23/scripts.pory"
Route23_EventScript_RainbowBadgeGuardTrigger::
# 96 "data/maps/Route23/scripts.pory"
	lockall
# 97 "data/maps/Route23/scripts.pory"
	setvar VAR_TEMP_1, 4
# 98 "data/maps/Route23/scripts.pory"
	setvar VAR_0x8009, LOCALID_RAINBOW_BADGE_GUARD
# 99 "data/maps/Route23/scripts.pory"
	bufferstdstring STR_VAR_1, STDSTRING_RAINBOW_BADGE
# 100 "data/maps/Route23/scripts.pory"
	goto Route23_EventScript_BadgeGuardTrigger
# 101 "data/maps/Route23/scripts.pory"
	end
# 102 "data/maps/Route23/scripts.pory"

# 103 "data/maps/Route23/scripts.pory"
Route23_EventScript_SoulBadgeGuardTrigger::
# 104 "data/maps/Route23/scripts.pory"
	lockall
# 105 "data/maps/Route23/scripts.pory"
	setvar VAR_TEMP_1, 5
# 106 "data/maps/Route23/scripts.pory"
	setvar VAR_0x8009, LOCALID_SOUL_BADGE_GUARD
# 107 "data/maps/Route23/scripts.pory"
	bufferstdstring STR_VAR_1, STDSTRING_SOUL_BADGE
# 108 "data/maps/Route23/scripts.pory"
	goto Route23_EventScript_BadgeGuardTrigger
# 109 "data/maps/Route23/scripts.pory"
	end
# 110 "data/maps/Route23/scripts.pory"

# 111 "data/maps/Route23/scripts.pory"
Route23_EventScript_MarshBadgeGuardTrigger::
# 112 "data/maps/Route23/scripts.pory"
	lockall
# 113 "data/maps/Route23/scripts.pory"
	setvar VAR_TEMP_1, 6
# 114 "data/maps/Route23/scripts.pory"
	setvar VAR_0x8009, LOCALID_MARSH_BADGE_GUARD
# 115 "data/maps/Route23/scripts.pory"
	bufferstdstring STR_VAR_1, STDSTRING_MARSH_BADGE
# 116 "data/maps/Route23/scripts.pory"
	goto Route23_EventScript_BadgeGuardTrigger
# 117 "data/maps/Route23/scripts.pory"
	end
# 118 "data/maps/Route23/scripts.pory"

# 119 "data/maps/Route23/scripts.pory"
Route23_EventScript_VolcanoBadgeGuardTrigger::
# 120 "data/maps/Route23/scripts.pory"
	lockall
# 121 "data/maps/Route23/scripts.pory"
	setvar VAR_TEMP_1, 7
# 122 "data/maps/Route23/scripts.pory"
	setvar VAR_0x8009, LOCALID_VOLCANO_BADGE_GUARD
# 123 "data/maps/Route23/scripts.pory"
	bufferstdstring STR_VAR_1, STDSTRING_VOLCANO_BADGE
# 124 "data/maps/Route23/scripts.pory"
	goto Route23_EventScript_BadgeGuardTrigger
# 125 "data/maps/Route23/scripts.pory"
	end
# 126 "data/maps/Route23/scripts.pory"

# 127 "data/maps/Route23/scripts.pory"
Route23_EventScript_EarthBadgeGuardTrigger::
# 128 "data/maps/Route23/scripts.pory"
	lockall
# 129 "data/maps/Route23/scripts.pory"
	setvar VAR_TEMP_1, 8
# 130 "data/maps/Route23/scripts.pory"
	setvar VAR_0x8009, LOCALID_EARTH_BADGE_GUARD
# 131 "data/maps/Route23/scripts.pory"
	bufferstdstring STR_VAR_1, STDSTRING_EARTH_BADGE
# 132 "data/maps/Route23/scripts.pory"
	goto Route23_EventScript_BadgeGuardTrigger
# 133 "data/maps/Route23/scripts.pory"
	end
# 134 "data/maps/Route23/scripts.pory"

# 135 "data/maps/Route23/scripts.pory"
Route23_EventScript_VictoryRoadGateSign::
# 136 "data/maps/Route23/scripts.pory"
	msgbox Route23_Text_VictoryRoadGateSign, MSGBOX_SIGN
# 137 "data/maps/Route23/scripts.pory"
	end
