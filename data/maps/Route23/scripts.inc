.set LOCALID_CASCADE_BADGE_GUARD, 1
.set LOCALID_THUNDER_BADGE_GUARD, 2
.set LOCALID_RAINBOW_BADGE_GUARD, 3
.set LOCALID_SOUL_BADGE_GUARD,    4
.set LOCALID_MARSH_BADGE_GUARD,   5
.set LOCALID_VOLCANO_BADGE_GUARD, 6
.set LOCALID_EARTH_BADGE_GUARD,   7

Route23_MapScripts:: @ 81684EB
	map_script MAP_SCRIPT_ON_TRANSITION, Route23_OnTransition
	.byte 0

Route23_OnTransition:: @ 81684F1
	clearflag FLAG_HIDE_VICTORY_ROAD_3F_BOULDER
	setflag FLAG_HIDE_VICTORY_ROAD_2F_BOULDER
	setvar VAR_MAP_SCENE_VICTORY_ROAD_1F, 0
	setvar VAR_MAP_SCENE_VICTORY_ROAD_2F_BOULDER1, 0
	setvar VAR_MAP_SCENE_VICTORY_ROAD_2F_BOULDER2, 0
	setvar VAR_MAP_SCENE_VICTORY_ROAD_3F, 0
	end

Route23_EventScript_CascadeBadgeGuard:: @ 816850C
	lock
	faceplayer
	setvar VAR_TEMP_1, 2
	getstdstring 0, STDSTRING_CASCADE_BADGE
	goto Route23_EventScript_BadgeGuard
	end

Route23_EventScript_ThunderBadgeGuard:: @ 816851D
	lock
	faceplayer
	setvar VAR_TEMP_1, 3
	getstdstring 0, STDSTRING_THUNDER_BADGE
	goto Route23_EventScript_BadgeGuard
	end

Route23_EventScript_RainbowBadgeGuard:: @ 816852E
	lock
	faceplayer
	setvar VAR_TEMP_1, 4
	getstdstring 0, STDSTRING_RAINBOW_BADGE
	goto Route23_EventScript_BadgeGuard
	end

Route23_EventScript_SoulBadgeGuard:: @ 816853F
	lock
	faceplayer
	setvar VAR_TEMP_1, 5
	getstdstring 0, STDSTRING_SOUL_BADGE
	goto Route23_EventScript_BadgeGuard
	end

Route23_EventScript_MarshBadgeGuard:: @ 8168550
	lock
	faceplayer
	setvar VAR_TEMP_1, 6
	getstdstring 0, STDSTRING_MARSH_BADGE
	goto Route23_EventScript_BadgeGuard
	end

Route23_EventScript_VolcanoBadgeGuard:: @ 8168561
	lock
	faceplayer
	setvar VAR_TEMP_1, 7
	getstdstring 0, STDSTRING_VOLCANO_BADGE
	goto Route23_EventScript_BadgeGuard
	end

Route23_EventScript_EarthBadgeGuard:: @ 8168572
	lock
	faceplayer
	setvar VAR_TEMP_1, 8
	getstdstring 0, STDSTRING_EARTH_BADGE
	goto Route23_EventScript_BadgeGuard
	end

Route23_EventScript_CascadeBadgeGuardTrigger:: @ 8168583
	lockall
	setvar VAR_TEMP_1, 2
	setvar VAR_0x8009, LOCALID_CASCADE_BADGE_GUARD
	getstdstring 0, STDSTRING_CASCADE_BADGE
	goto Route23_EventScript_BadgeGuardTrigger
	end

Route23_EventScript_ThunderBadgeGuardTrigger:: @ 8168598
	lockall
	setvar VAR_TEMP_1, 3
	setvar VAR_0x8009, LOCALID_THUNDER_BADGE_GUARD
	getstdstring 0, STDSTRING_THUNDER_BADGE
	goto Route23_EventScript_BadgeGuardTrigger
	end

Route23_EventScript_RainbowBadgeGuardTrigger:: @ 81685AD
	lockall
	setvar VAR_TEMP_1, 4
	setvar VAR_0x8009, LOCALID_RAINBOW_BADGE_GUARD
	getstdstring 0, STDSTRING_RAINBOW_BADGE
	goto Route23_EventScript_BadgeGuardTrigger
	end

Route23_EventScript_SoulBadgeGuardTrigger:: @ 81685C2
	lockall
	setvar VAR_TEMP_1, 5
	setvar VAR_0x8009, LOCALID_SOUL_BADGE_GUARD
	getstdstring 0, STDSTRING_SOUL_BADGE
	goto Route23_EventScript_BadgeGuardTrigger
	end

Route23_EventScript_MarshBadgeGuardTrigger:: @ 81685D7
	lockall
	setvar VAR_TEMP_1, 6
	setvar VAR_0x8009, LOCALID_MARSH_BADGE_GUARD
	getstdstring 0, STDSTRING_MARSH_BADGE
	goto Route23_EventScript_BadgeGuardTrigger
	end

Route23_EventScript_VolcanoBadgeGuardTrigger:: @ 81685EC
	lockall
	setvar VAR_TEMP_1, 7
	setvar VAR_0x8009, LOCALID_VOLCANO_BADGE_GUARD
	getstdstring 0, STDSTRING_VOLCANO_BADGE
	goto Route23_EventScript_BadgeGuardTrigger
	end

Route23_EventScript_EarthBadgeGuardTrigger:: @ 8168601
	lockall
	setvar VAR_TEMP_1, 8
	setvar VAR_0x8009, LOCALID_EARTH_BADGE_GUARD
	getstdstring 0, STDSTRING_EARTH_BADGE
	goto Route23_EventScript_BadgeGuardTrigger
	end

Route23_EventScript_VictoryRoadGateSign:: @ 8168616
	msgbox Route23_Text_VictoryRoadGateSign, MSGBOX_SIGN
	end
