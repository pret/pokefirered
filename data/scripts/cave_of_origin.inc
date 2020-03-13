@ All unused / leftover scripts from RS
CaveOfOrigin_EventScript_Shake1:: @ 81A7493
	lockall
	setvar VAR_TEMP_1, 1
	goto CaveOfOrigin_EventScript_Shake
	end

CaveOfOrigin_EventScript_Shake2:: @ 81A749F
	lockall
	setvar VAR_TEMP_2, 1
	goto CaveOfOrigin_EventScript_Shake
	end

CaveOfOrigin_EventScript_Shake3:: @ 81A74AB
	lockall
	setvar VAR_TEMP_3, 1
	goto CaveOfOrigin_EventScript_Shake
	end

CaveOfOrigin_EventScript_Shake:: @ 81A74B7
	setvar VAR_0x8004, 1
	setvar VAR_0x8005, 1
	setvar VAR_0x8006, 8
	setvar VAR_0x8007, 5
	special ShakeScreen
	waitstate
	releaseall
	end

CaveOfOrigin_EventScript_DisableShakes:: @ 81A74D1
	setvar VAR_TEMP_1, 1
	setvar VAR_TEMP_2, 1
	setvar VAR_TEMP_3, 1
	setvar VAR_TEMP_4, 1
	setvar VAR_TEMP_5, 1
	return
