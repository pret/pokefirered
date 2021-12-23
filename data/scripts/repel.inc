EventScript_RepelWoreOff:: @ 81BFB65
	msgbox Text_RepelWoreOff, MSGBOX_SIGN
	end

EventScript_Honey::
        callnative FldEff_TryStartWildBattle
	compare VAR_0x8000, FALSE
	goto_if_eq EventScript_HoneyFail
	release
	end
	
EventScript_HoneyFail::
        msgbox Text_NoMonHere, MSGBOX_AUTOCLOSE
	release
	end

Text_RepelWoreOff:: @ 81BFB6E
	.string "REPEL's effect wore off…$"
	
Text_NoMonHere::
        .string "Theres no mon in this place…$"
