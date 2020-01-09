EventScript_1A77C9:: @ 81A77C9
	msgbox Text_OnlySkilledTrainersAllowedThrough
	playse SE_BOO
	msgbox Text_CantLetYouPass
	release
	end

EventScript_1A77DE:: @ 81A77DE
	message Text_OnlyPassWithBadgeDontHaveYet
	waitmessage
	playse SE_BOO
	waitbuttonpress
	closemessage
	waitse
	release
	end

EventScript_1A77EC:: @ 81A77EC
	message Text_OhThatsBadgeGoRightAhead
	waitmessage
	playfanfare MUS_FANFA1
	waitfanfare
	waitbuttonpress
	release
	end

EventScript_1A77F9:: @ 81A77F9
	msgbox Text_OnlyPassWithBadgeOhGoAhead
	release
	end

EventScript_1A7803:: @ 81A7803
	compare VAR_MAP_SCENE_ROUTE23, VAR_TEMP_1
	goto_if ge, EventScript_1A77EC
	switch VAR_TEMP_1
	case 1, EventScript_1A78D5
	case 2, EventScript_1A78E4
	case 3, EventScript_1A78F3
	case 4, EventScript_1A7902
	case 5, EventScript_1A7911
	case 6, EventScript_1A7920
	case 7, EventScript_1A792F
	case 8, EventScript_1A793E
	end

EventScript_1A786C:: @ 81A786C
	compare VAR_MAP_SCENE_ROUTE23, VAR_TEMP_1
	goto_if ge, EventScript_1A77F9
	switch VAR_TEMP_1
	case 1, EventScript_1A78D5
	case 2, EventScript_1A78E4
	case 3, EventScript_1A78F3
	case 4, EventScript_1A7902
	case 5, EventScript_1A7911
	case 6, EventScript_1A7920
	case 7, EventScript_1A792F
	case 8, EventScript_1A793E
	end

EventScript_1A78D5:: @ 81A78D5
	checkflag FLAG_BADGE01_GET
	goto_if TRUE, EventScript_1A794D
	goto EventScript_1A77C9
	end

EventScript_1A78E4:: @ 81A78E4
	checkflag FLAG_BADGE02_GET
	goto_if TRUE, EventScript_1A795F
	goto EventScript_1A77DE
	end

EventScript_1A78F3:: @ 81A78F3
	checkflag FLAG_BADGE03_GET
	goto_if TRUE, EventScript_1A795F
	goto EventScript_1A77DE
	end

EventScript_1A7902:: @ 81A7902
	checkflag FLAG_BADGE04_GET
	goto_if TRUE, EventScript_1A795F
	goto EventScript_1A77DE
	end

EventScript_1A7911:: @ 81A7911
	checkflag FLAG_BADGE05_GET
	goto_if TRUE, EventScript_1A795F
	goto EventScript_1A77DE
	end

EventScript_1A7920:: @ 81A7920
	checkflag FLAG_BADGE06_GET
	goto_if TRUE, EventScript_1A795F
	goto EventScript_1A77DE
	end

EventScript_1A792F:: @ 81A792F
	checkflag FLAG_BADGE07_GET
	goto_if TRUE, EventScript_1A795F
	goto EventScript_1A77DE
	end

EventScript_1A793E:: @ 81A793E
	checkflag FLAG_BADGE08_GET
	goto_if TRUE, EventScript_1A795F
	goto EventScript_1A77DE
	end

EventScript_1A794D:: @ 81A794D
	message Text_OhThatsBadgeGoRightAhead
	waitmessage
	playfanfare MUS_FANFA1
	waitfanfare
	waitbuttonpress
	copyvar VAR_MAP_SCENE_ROUTE23, VAR_TEMP_1
	release
	end

EventScript_1A795F:: @ 81A795F
	msgbox Text_OnlyPassWithBadgeOhGoAhead
	copyvar VAR_MAP_SCENE_ROUTE23, VAR_TEMP_1
	release
	end

EventScript_1A796E:: @ 81A796E
	textcolor 0
	applymovement VAR_0x8009, Movement_WalkInPlaceFastestLeft
	waitmovement 0
	switch VAR_TEMP_1
	case 1, EventScript_1A79D8
	case 2, EventScript_1A79E7
	case 3, EventScript_1A79F6
	case 4, EventScript_1A7A05
	case 5, EventScript_1A7A14
	case 6, EventScript_1A7A23
	case 7, EventScript_1A7A32
	case 8, EventScript_1A7A41
	end

EventScript_1A79D8:: @ 81A79D8
	checkflag FLAG_BADGE01_GET
	goto_if TRUE, EventScript_1A7A96
	goto EventScript_1A7A50
	end

EventScript_1A79E7:: @ 81A79E7
	checkflag FLAG_BADGE02_GET
	goto_if TRUE, EventScript_1A7AA8
	goto EventScript_1A7A77
	end

EventScript_1A79F6:: @ 81A79F6
	checkflag FLAG_BADGE03_GET
	goto_if TRUE, EventScript_1A7AA8
	goto EventScript_1A7A77
	end

EventScript_1A7A05:: @ 81A7A05
	checkflag FLAG_BADGE04_GET
	goto_if TRUE, EventScript_1A7AA8
	goto EventScript_1A7A77
	end

EventScript_1A7A14:: @ 81A7A14
	checkflag FLAG_BADGE05_GET
	goto_if TRUE, EventScript_1A7AA8
	goto EventScript_1A7A77
	end

EventScript_1A7A23:: @ 81A7A23
	checkflag FLAG_BADGE06_GET
	goto_if TRUE, EventScript_1A7AA8
	goto EventScript_1A7A77
	end

EventScript_1A7A32:: @ 81A7A32
	checkflag FLAG_BADGE07_GET
	goto_if TRUE, EventScript_1A7AA8
	goto EventScript_1A7A77
	end

EventScript_1A7A41:: @ 81A7A41
	checkflag FLAG_BADGE08_GET
	goto_if TRUE, EventScript_1A7AA8
	goto EventScript_1A7A77
	end

EventScript_1A7A50:: @ 81A7A50
	msgbox Text_OnlySkilledTrainersAllowedThrough
	playse SE_BOO
	msgbox Text_CantLetYouPass
	closemessage
	applymovement OBJ_EVENT_ID_PLAYER, Movement_1A7AB7
	applymovement VAR_0x8009, Movement_WalkInPlaceFastestDown
	waitmovement 0
	releaseall
	end

EventScript_1A7A77:: @ 81A7A77
	message Text_OnlyPassWithBadgeDontHaveYet
	waitmessage
	playse SE_BOO
	waitbuttonpress
	closemessage
	waitse
	applymovement OBJ_EVENT_ID_PLAYER, Movement_1A7AB7
	applymovement VAR_0x8009, Movement_WalkInPlaceFastestDown
	waitmovement 0
	releaseall
	end

EventScript_1A7A96:: @ 81A7A96
	message Text_OhThatsBadgeGoRightAhead
	waitmessage
	playfanfare MUS_FANFA1
	waitfanfare
	waitbuttonpress
	copyvar VAR_MAP_SCENE_ROUTE23, VAR_TEMP_1
	releaseall
	end

EventScript_1A7AA8:: @ 81A7AA8
	msgbox Text_OnlyPassWithBadgeOhGoAhead
	copyvar VAR_MAP_SCENE_ROUTE23, VAR_TEMP_1
	releaseall
	end

Movement_1A7AB7:: @ 81A7AB7
	walk_down
	step_end
