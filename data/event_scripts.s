	.include "asm/macros.inc"
	.include "asm/macros/event.inc"
	.include "constants/constants.inc"

	.section script_data, "aw", %progbits

    .include "data/script_cmd_table.inc"

    .align 2
gSpecialVars:: @ 815FD0C
	.4byte gSpecialVar_0x8000
	.4byte gSpecialVar_0x8001
	.4byte gSpecialVar_0x8002
	.4byte gSpecialVar_0x8003
	.4byte gSpecialVar_0x8004
	.4byte gSpecialVar_0x8005
	.4byte gSpecialVar_0x8006
	.4byte gSpecialVar_0x8007
	.4byte gSpecialVar_0x8008
	.4byte gSpecialVar_0x8009
	.4byte gSpecialVar_0x800A
	.4byte gSpecialVar_0x800B
	.4byte gSpecialVar_Facing
	.4byte gSpecialVar_Result
	.4byte gSpecialVar_ItemId
	.4byte gSpecialVar_LastTalked
	.4byte gSpecialVar_MonBoxId
	.4byte gSpecialVar_MonBoxPos
	.4byte gUnknown_20370DA
	.4byte gUnknown_20370DC
	.4byte gUnknown_20370DE

    .include "data/specials.inc"

    .align 2
gStdScripts:: @ 8160450
	.4byte gStdScript_81A667B
	.4byte gStdScript_81A67B3
	.4byte gStdScript_81A4E3F
	.4byte gStdScript_81A4E4A
	.4byte gStdScript_81A4E54
	.4byte gStdScript_81A4E5C
	.4byte gStdScript_81A501F
	.4byte gStdScript_81A676C
	.4byte gStdScript_81A8E58
	.4byte gStdScript_81A4E66
gStdScriptsEnd::

	.include "data/map_event_scripts.inc"
