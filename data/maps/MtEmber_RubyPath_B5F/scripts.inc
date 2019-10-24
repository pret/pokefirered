MtEmber_RubyPath_B5F_MapScripts:: @ 8163BAA
	.byte 0

MtEmber_RubyPath_B5F_EventScript_163BAB:: @ 8163BAB
	lockall
	setvar VAR_0x8005, 130
	setvar VAR_0x8006, 0
	braillemessage gUnknown_81A92C5
	getbraillestringwidth gUnknown_81A92C5
	call EventScript_BrailleCursorWaitButton
	setvar VAR_0x8006, 0
	braillemessage gUnknown_81A92D0
	getbraillestringwidth gUnknown_81A92D0
	call EventScript_BrailleCursorWaitButton
	setvar VAR_0x8006, 0
	braillemessage gUnknown_81A92DC
	getbraillestringwidth gUnknown_81A92DC
	call EventScript_BrailleCursorWaitButton
	setvar VAR_0x8006, 0
	braillemessage gUnknown_81A92E6
	getbraillestringwidth gUnknown_81A92E6
	call EventScript_BrailleCursorWaitButton
	setvar VAR_0x8006, 0
	braillemessage gUnknown_81A92F2
	getbraillestringwidth gUnknown_81A92F2
	call EventScript_BrailleCursorWaitButton
	setvar VAR_0x8006, 0
	braillemessage gUnknown_81A92FE
	getbraillestringwidth gUnknown_81A92FE
	call EventScript_BrailleCursorWaitButton
	setvar VAR_0x8006, 0
	braillemessage gUnknown_81A930A
	getbraillestringwidth gUnknown_81A930A
	call EventScript_BrailleCursorWaitButton
	braillemessage gUnknown_81A9316
	waitbuttonpress
	releaseall
	end
