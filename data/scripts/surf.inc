EventScript_UseSurf::
	goto_if_questlog EventScript_UseSurfEnd
	checkpartymove MOVE_SURF
	compare VAR_RESULT, PARTY_SIZE
	goto_if_eq EventScript_UseSurfEnd
	getpartymonname 0, VAR_RESULT
	setfieldeffectarg 0, VAR_RESULT
	lockall
	msgbox Text_WantToSurf, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq EventScript_UseSurfRelease
	msgbox Text_UsedSurf
	dofieldeffect FLDEFF_USE_SURF
EventScript_UseSurfRelease:
	releaseall
EventScript_UseSurfEnd:
	end

EventScript_CurrentTooFast::
	lockall
	msgbox Text_CurrentTooFast
	releaseall
	end
