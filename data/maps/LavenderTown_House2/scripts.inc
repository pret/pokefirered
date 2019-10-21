LavenderTown_House2_MapScripts:: @ 816B265
	.byte 0

LavenderTown_House2_EventScript_16B266:: @ 816B266
	lock
	faceplayer
	msgbox gUnknown_8193A4B, MSGBOX_YESNO
	compare_var_to_value VAR_RESULT, 1
	goto_if eq, EventScript_16B287
	compare_var_to_value VAR_RESULT, 0
	goto_if eq, EventScript_16B2AA
	end

EventScript_16B287:: @ 816B287
	msgbox gUnknown_8193AA6
	special Special_ChooseMonToDeleteMove
	waitstate
	compare_var_to_value VAR_0x8004, 6
	goto_if lt, EventScript_16B2B4
	compare_var_to_value VAR_0x8004, 6
	goto_if ge, EventScript_16B2AA
	end

EventScript_16B2AA:: @ 816B2AA
	msgbox gUnknown_8193BD4
	release
	end

EventScript_16B2B4:: @ 816B2B4
	specialvar VAR_RESULT, sub_80CAD54
	compare_var_to_value VAR_RESULT, SPECIES_EGG
	goto_if eq, EventScript_16B307
	special TV_CopyNicknameToStringVar1AndEnsureTerminated
	special TV_CheckMonOTIDEqualsPlayerID
	compare_var_to_value VAR_RESULT, 1
	goto_if eq, EventScript_16B311
	specialvar VAR_RESULT, sub_80CAD7C
	special TV_CopyNicknameToStringVar1AndEnsureTerminated
	compare_var_to_value VAR_RESULT, 1
	goto_if eq, EventScript_16B311
	msgbox gUnknown_8193AD2, MSGBOX_YESNO
	compare_var_to_value VAR_RESULT, 1
	goto_if eq, EventScript_16B31B
	compare_var_to_value VAR_RESULT, 0
	goto_if eq, EventScript_16B2AA
	end

EventScript_16B307:: @ 816B307
	msgbox gUnknown_8193CC4
	release
	end

EventScript_16B311:: @ 816B311
	msgbox gUnknown_8193C82
	release
	end

EventScript_16B31B:: @ 816B31B
	msgbox gUnknown_8193B36
	call EventScript_1A74EB
	specialvar VAR_RESULT, sub_80CBFA0
	special TV_CopyNicknameToStringVar1AndEnsureTerminated
	compare_var_to_value VAR_RESULT, 1
	goto_if eq, EventScript_16B345
	msgbox gUnknown_8193BF0
	release
	end

EventScript_16B345:: @ 816B345
	msgbox gUnknown_8193B66
	release
	end
