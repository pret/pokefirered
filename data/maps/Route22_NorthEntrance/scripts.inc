Route22_NorthEntrance_MapScripts:: @ 81704FB
	.byte 0

Route22_NorthEntrance_EventScript_BoulderBadgeGuard:: @ 81704FC
	lock
	faceplayer
	setvar VAR_TEMP_1, 1
	getstdstring 0, STDSTRING_BOULDER_BADGE
	goto Route22_NorthEntrance_EventScript_BadgeGuard
	end

Route22_NorthEntrance_EventScript_BoulderBadgeGuardTrigger:: @ 817050D
	lockall
	setvar VAR_TEMP_1, 1
	setvar VAR_0x8009, 1
	getstdstring 0, STDSTRING_BOULDER_BADGE
	goto Route23_EventScript_BadgeGuardTrigger
	end
