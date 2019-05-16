#include "constants/flags.h"
#include "constants/decorations.h"
#include "constants/items.h"
#include "constants/layouts.h"
#include "constants/maps.h"
#include "constants/moves.h"
#include "constants/songs.h"
#include "constants/species.h"
#include "constants/trainer_classes.h"
#include "constants/vars.h"
#include "constants/battle.h"
#include "constants/spawn_points.h"
	.include "asm/macros.inc"
	.include "asm/macros/event.inc"
@	.include "constants/constants.inc"

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
	.4byte gStdScript_0
	.4byte gStdScript_1
	.4byte gStdScript_2
	.4byte gStdScript_3
	.4byte gStdScript_4
	.4byte gStdScript_5
	.4byte gStdScript_Message_WaitButton_AndRelease
	.4byte gStdScript_7
	.4byte gStdScript_8
	.4byte gStdScript_ItemMessageAndFanfare
gStdScriptsEnd::

	.include "data/map_event_scripts.inc"
