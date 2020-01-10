EventScript_UseSurf:: @ 81A6AC8
	special sub_8110AB4
	compare VAR_RESULT, 2
	goto_if_eq EventScript_UseSurfEnd
	checkpartymove MOVE_SURF
	compare VAR_RESULT, PARTY_SIZE
	goto_if_eq EventScript_UseSurfEnd
	getpartymonname 0, VAR_RESULT
	setfieldeffectarg 0, VAR_RESULT
	lockall
	msgbox Text_1A556E, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq EventScript_UseSurfRelease
	msgbox Text_1A55A5
	dofieldeffect FLDEFF_USE_SURF
EventScript_UseSurfRelease:@ 81A6B0B
	releaseall
EventScript_UseSurfEnd: @ 81A6B0C
	end

gUnknown_81A6B0D:: @ 81A6B0D
	lockall
	msgbox Text_CurrentTooFast
	releaseall
	end
