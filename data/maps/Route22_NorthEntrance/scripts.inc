# 1 "data/maps/Route22_NorthEntrance/scripts.pory"

# 2 "data/maps/Route22_NorthEntrance/scripts.pory"
Route22_NorthEntrance_MapScripts::
# 3 "data/maps/Route22_NorthEntrance/scripts.pory"
	.byte 0
# 4 "data/maps/Route22_NorthEntrance/scripts.pory"

# 5 "data/maps/Route22_NorthEntrance/scripts.pory"
Route22_NorthEntrance_EventScript_BoulderBadgeGuard::
# 6 "data/maps/Route22_NorthEntrance/scripts.pory"
	lock
# 7 "data/maps/Route22_NorthEntrance/scripts.pory"
	faceplayer
# 8 "data/maps/Route22_NorthEntrance/scripts.pory"
	setvar VAR_TEMP_1, 1
# 9 "data/maps/Route22_NorthEntrance/scripts.pory"
	bufferstdstring STR_VAR_1, STDSTRING_BOULDER_BADGE
# 10 "data/maps/Route22_NorthEntrance/scripts.pory"
	goto Route22_NorthEntrance_EventScript_BadgeGuard
# 11 "data/maps/Route22_NorthEntrance/scripts.pory"
	end
# 12 "data/maps/Route22_NorthEntrance/scripts.pory"

# 13 "data/maps/Route22_NorthEntrance/scripts.pory"
Route22_NorthEntrance_EventScript_BoulderBadgeGuardTrigger::
# 14 "data/maps/Route22_NorthEntrance/scripts.pory"
	lockall
# 15 "data/maps/Route22_NorthEntrance/scripts.pory"
	setvar VAR_TEMP_1, 1
# 16 "data/maps/Route22_NorthEntrance/scripts.pory"
	setvar VAR_0x8009, 1
# 17 "data/maps/Route22_NorthEntrance/scripts.pory"
	bufferstdstring STR_VAR_1, STDSTRING_BOULDER_BADGE
# 18 "data/maps/Route22_NorthEntrance/scripts.pory"
	goto Route23_EventScript_BadgeGuardTrigger
# 19 "data/maps/Route22_NorthEntrance/scripts.pory"
	end
