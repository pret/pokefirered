Common_EventScript_SetupRedGreenGfxId::
	checkplayergender
	goto_if_eq VAR_RESULT, MALE, EventScript_SetupRedGreenGfxIdGreen
	goto_if_eq VAR_RESULT, FEMALE, EventScript_SetupRedGreenGfxIdRed
	end

EventScript_SetupRedGreenGfxIdGreen::
	setvar VAR_OBJ_GFX_ID_0, OBJ_EVENT_GFX_GREEN_NORMAL
	return

EventScript_SetupRedGreenGfxIdRed::
	setvar VAR_OBJ_GFX_ID_0, OBJ_EVENT_GFX_RED_NORMAL
	return