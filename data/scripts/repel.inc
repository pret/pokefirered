EventScript_RepelWoreOff::
	msgbox Text_RepelWoreOff, MSGBOX_YESNO
	goto_if_eq VAR_RESULT, NO, EventScript_RepelEnd
	removeitem ITEM_REPEL
	goto_if_eq VAR_RESULT, FALSE, EventScript_AllOutOfRepel
  setvar VAR_REPEL_STEP_COUNT, 100
  goto EventScript_RepelEnd
EventScript_AllOutOfRepel::
  msgbox Text_AllOutOfRepel, MSGBOX_SIGN
EventScript_RepelEnd::
  release
	end

Text_RepelWoreOff::
	.string "REPEL's effect wore off…\n"
	.string "Use another?$"

Text_AllOutOfRepel::
	.string "You are all out of REPEL!$"
