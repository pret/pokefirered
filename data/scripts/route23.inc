Route23_EventScript_MissingBoulderBadge:: @ 81A77C9
	msgbox Text_OnlySkilledTrainersAllowedThrough
	playse SE_BOO
	msgbox Text_CantLetYouPass
	release
	end

Route23_EventScript_MissingBadge:: @ 81A77DE
	message Text_OnlyPassWithBadgeDontHaveYet
	waitmessage
	playse SE_BOO
	waitbuttonpress
	closemessage
	waitse
	release
	end

Route23_EventScript_AlreadyRecognizedBoulderBadge:: @ 81A77EC
	message Text_OhThatsBadgeGoRightAhead
	waitmessage
	playfanfare MUS_LEVEL_UP
	waitfanfare
	waitbuttonpress
	release
	end

Route23_EventScript_AlreadyRecognizedBadge:: @ 81A77F9
	msgbox Text_OnlyPassWithBadgeOhGoAhead
	release
	end

@ Duplicate of the below, only used for Boulder Badge
Route22_NorthEntrance_EventScript_BadgeGuard:: @ 81A7803
	compare VAR_MAP_SCENE_ROUTE23, VAR_TEMP_1
	goto_if_ge Route23_EventScript_AlreadyRecognizedBoulderBadge
	switch VAR_TEMP_1
	case 1, Route23_EventScript_CheckBoulderBadge
	case 2, Route23_EventScript_CheckCascadeBadge
	case 3, Route23_EventScript_CheckThunderBadge
	case 4, Route23_EventScript_CheckRainbowBadge
	case 5, Route23_EventScript_CheckSoulBadge
	case 6, Route23_EventScript_CheckMarshBadge
	case 7, Route23_EventScript_CheckVolcanoBadge
	case 8, Route23_EventScript_CheckEarthBadge
	end

Route23_EventScript_BadgeGuard:: @ 81A786C
	compare VAR_MAP_SCENE_ROUTE23, VAR_TEMP_1
	goto_if_ge Route23_EventScript_AlreadyRecognizedBadge
	switch VAR_TEMP_1
	case 1, Route23_EventScript_CheckBoulderBadge
	case 2, Route23_EventScript_CheckCascadeBadge
	case 3, Route23_EventScript_CheckThunderBadge
	case 4, Route23_EventScript_CheckRainbowBadge
	case 5, Route23_EventScript_CheckSoulBadge
	case 6, Route23_EventScript_CheckMarshBadge
	case 7, Route23_EventScript_CheckVolcanoBadge
	case 8, Route23_EventScript_CheckEarthBadge
	end

Route23_EventScript_CheckBoulderBadge:: @ 81A78D5
	goto_if_set FLAG_BADGE01_GET, Route23_EventScript_RecognizeBoulderBadge
	goto Route23_EventScript_MissingBoulderBadge
	end

Route23_EventScript_CheckCascadeBadge:: @ 81A78E4
	goto_if_set FLAG_BADGE02_GET, Route23_EventScript_RecognizeBadge
	goto Route23_EventScript_MissingBadge
	end

Route23_EventScript_CheckThunderBadge:: @ 81A78F3
	goto_if_set FLAG_BADGE03_GET, Route23_EventScript_RecognizeBadge
	goto Route23_EventScript_MissingBadge
	end

Route23_EventScript_CheckRainbowBadge:: @ 81A7902
	goto_if_set FLAG_BADGE04_GET, Route23_EventScript_RecognizeBadge
	goto Route23_EventScript_MissingBadge
	end

Route23_EventScript_CheckSoulBadge:: @ 81A7911
	goto_if_set FLAG_BADGE05_GET, Route23_EventScript_RecognizeBadge
	goto Route23_EventScript_MissingBadge
	end

Route23_EventScript_CheckMarshBadge:: @ 81A7920
	goto_if_set FLAG_BADGE06_GET, Route23_EventScript_RecognizeBadge
	goto Route23_EventScript_MissingBadge
	end

Route23_EventScript_CheckVolcanoBadge:: @ 81A792F
	goto_if_set FLAG_BADGE07_GET, Route23_EventScript_RecognizeBadge
	goto Route23_EventScript_MissingBadge
	end

Route23_EventScript_CheckEarthBadge:: @ 81A793E
	goto_if_set FLAG_BADGE08_GET, Route23_EventScript_RecognizeBadge
	goto Route23_EventScript_MissingBadge
	end

Route23_EventScript_RecognizeBoulderBadge:: @ 81A794D
	message Text_OhThatsBadgeGoRightAhead
	waitmessage
	playfanfare MUS_LEVEL_UP
	waitfanfare
	waitbuttonpress
	copyvar VAR_MAP_SCENE_ROUTE23, VAR_TEMP_1
	release
	end

Route23_EventScript_RecognizeBadge:: @ 81A795F
	msgbox Text_OnlyPassWithBadgeOhGoAhead
	copyvar VAR_MAP_SCENE_ROUTE23, VAR_TEMP_1
	release
	end

Route23_EventScript_BadgeGuardTrigger:: @ 81A796E
	textcolor 0
	applymovement VAR_0x8009, Movement_WalkInPlaceFastestLeft
	waitmovement 0
	switch VAR_TEMP_1
	case 1, Route23_EventScript_CheckBoulderBadgeTrigger
	case 2, Route23_EventScript_CheckCascadeBadgeTrigger
	case 3, Route23_EventScript_CheckThunderBadgeTrigger
	case 4, Route23_EventScript_CheckRainbowBadgeTrigger
	case 5, Route23_EventScript_CheckSoulBadgeTrigger
	case 6, Route23_EventScript_CheckMarshBadgeTrigger
	case 7, Route23_EventScript_CheckVolcanoBadgeTrigger
	case 8, Route23_EventScript_CheckEarthBadgeTrigger
	end

Route23_EventScript_CheckBoulderBadgeTrigger:: @ 81A79D8
	goto_if_set FLAG_BADGE01_GET, Route23_EventScript_RecognizeBoulderBadgeTrigger
	goto Route23_EventScript_MissingBoulderBadgeTrigger
	end

Route23_EventScript_CheckCascadeBadgeTrigger:: @ 81A79E7
	goto_if_set FLAG_BADGE02_GET, Route23_EventScript_RecognizeBadgeTrigger
	goto Route23_EventScript_MissingBadgeTrigger
	end

Route23_EventScript_CheckThunderBadgeTrigger:: @ 81A79F6
	goto_if_set FLAG_BADGE03_GET, Route23_EventScript_RecognizeBadgeTrigger
	goto Route23_EventScript_MissingBadgeTrigger
	end

Route23_EventScript_CheckRainbowBadgeTrigger:: @ 81A7A05
	goto_if_set FLAG_BADGE04_GET, Route23_EventScript_RecognizeBadgeTrigger
	goto Route23_EventScript_MissingBadgeTrigger
	end

Route23_EventScript_CheckSoulBadgeTrigger:: @ 81A7A14
	goto_if_set FLAG_BADGE05_GET, Route23_EventScript_RecognizeBadgeTrigger
	goto Route23_EventScript_MissingBadgeTrigger
	end

Route23_EventScript_CheckMarshBadgeTrigger:: @ 81A7A23
	goto_if_set FLAG_BADGE06_GET, Route23_EventScript_RecognizeBadgeTrigger
	goto Route23_EventScript_MissingBadgeTrigger
	end

Route23_EventScript_CheckVolcanoBadgeTrigger:: @ 81A7A32
	goto_if_set FLAG_BADGE07_GET, Route23_EventScript_RecognizeBadgeTrigger
	goto Route23_EventScript_MissingBadgeTrigger
	end

Route23_EventScript_CheckEarthBadgeTrigger:: @ 81A7A41
	goto_if_set FLAG_BADGE08_GET, Route23_EventScript_RecognizeBadgeTrigger
	goto Route23_EventScript_MissingBadgeTrigger
	end

Route23_EventScript_MissingBoulderBadgeTrigger:: @ 81A7A50
	msgbox Text_OnlySkilledTrainersAllowedThrough
	playse SE_BOO
	msgbox Text_CantLetYouPass
	closemessage
	applymovement OBJ_EVENT_ID_PLAYER, Route23_Movement_WalkDown
	applymovement VAR_0x8009, Movement_WalkInPlaceFastestDown
	waitmovement 0
	releaseall
	end

Route23_EventScript_MissingBadgeTrigger:: @ 81A7A77
	message Text_OnlyPassWithBadgeDontHaveYet
	waitmessage
	playse SE_BOO
	waitbuttonpress
	closemessage
	waitse
	applymovement OBJ_EVENT_ID_PLAYER, Route23_Movement_WalkDown
	applymovement VAR_0x8009, Movement_WalkInPlaceFastestDown
	waitmovement 0
	releaseall
	end

Route23_EventScript_RecognizeBoulderBadgeTrigger:: @ 81A7A96
	message Text_OhThatsBadgeGoRightAhead
	waitmessage
	playfanfare MUS_LEVEL_UP
	waitfanfare
	waitbuttonpress
	copyvar VAR_MAP_SCENE_ROUTE23, VAR_TEMP_1
	releaseall
	end

Route23_EventScript_RecognizeBadgeTrigger:: @ 81A7AA8
	msgbox Text_OnlyPassWithBadgeOhGoAhead
	copyvar VAR_MAP_SCENE_ROUTE23, VAR_TEMP_1
	releaseall
	end

Route23_Movement_WalkDown:: @ 81A7AB7
	walk_down
	step_end
