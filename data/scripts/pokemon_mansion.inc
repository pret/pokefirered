EventScript_1A7AE2:: @ 81A7AE2
	msgbox Text_177460, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq EventScript_1A7B70
	msgbox Text_17747B
	goto_if_set FLAG_POKEMON_MANSION_SWITCH_STATE, EventScript_1A7B3B
	setflag FLAG_POKEMON_MANSION_SWITCH_STATE
	switch VAR_0x8004
	case 0, EventScript_1A7B7A
	case 1, EventScript_1A7D3E
	case 2, EventScript_1A7E72
	case 3, EventScript_1A7F4C
	end

EventScript_1A7B3B:: @ 81A7B3B
	clearflag FLAG_POKEMON_MANSION_SWITCH_STATE
	switch VAR_0x8004
	case 0, EventScript_1A7C5C
	case 1, EventScript_1A7DD8
	case 2, EventScript_1A7EDF
	case 3, EventScript_1A8025
	end

EventScript_1A7B70:: @ 81A7B70
	msgbox Text_177489
	releaseall
	end

EventScript_1A7B7A:: @ 81A7B7A
	setmetatile 22, 10, 645, 0
	setmetatile 23, 10, 644, 0
	setmetatile 24, 10, 644, 0
	setmetatile 22, 11, 645, 0
	setmetatile 23, 11, 644, 0
	setmetatile 24, 11, 644, 0
	setmetatile 27, 25, 645, 0
	setmetatile 28, 25, 644, 0
	setmetatile 29, 25, 644, 0
	setmetatile 27, 26, 645, 0
	setmetatile 28, 26, 644, 0
	setmetatile 29, 26, 644, 0
	setmetatile 32, 25, 645, 0
	setmetatile 33, 25, 644, 0
	setmetatile 34, 25, 644, 0
	setmetatile 32, 26, 645, 0
	setmetatile 33, 26, 644, 0
	setmetatile 34, 26, 644, 0
	setmetatile 31, 18, 760, 1
	setmetatile 32, 18, 761, 1
	setmetatile 33, 18, 762, 1
	setmetatile 31, 19, 768, 1
	setmetatile 32, 19, 769, 1
	setmetatile 33, 19, 770, 1
	setmetatile 5, 4, 845, 0
	return

EventScript_1A7C5C:: @ 81A7C5C
	setmetatile 22, 10, 760, 1
	setmetatile 23, 10, 761, 1
	setmetatile 24, 10, 762, 1
	setmetatile 22, 11, 768, 1
	setmetatile 23, 11, 769, 1
	setmetatile 24, 11, 770, 1
	setmetatile 27, 25, 760, 1
	setmetatile 28, 25, 761, 1
	setmetatile 29, 25, 762, 1
	setmetatile 27, 26, 768, 1
	setmetatile 28, 26, 769, 1
	setmetatile 29, 26, 770, 1
	setmetatile 32, 25, 760, 1
	setmetatile 33, 25, 761, 1
	setmetatile 34, 25, 762, 1
	setmetatile 32, 26, 768, 1
	setmetatile 33, 26, 769, 1
	setmetatile 34, 26, 770, 1
	setmetatile 31, 18, 645, 0
	setmetatile 32, 18, 644, 0
	setmetatile 33, 18, 644, 0
	setmetatile 31, 19, 645, 0
	setmetatile 32, 19, 644, 0
	setmetatile 33, 19, 644, 0
	setmetatile 5, 4, 788, 0
	return

EventScript_1A7D3E:: @ 81A7D3E
	setmetatile 24, 14, 645, 0
	setmetatile 25, 14, 644, 0
	setmetatile 26, 14, 644, 0
	setmetatile 24, 15, 645, 0
	setmetatile 25, 15, 644, 0
	setmetatile 26, 15, 644, 0
	setmetatile 10, 28, 677, 1
	setmetatile 10, 29, 685, 1
	setmetatile 10, 30, 645, 0
	setmetatile 10, 31, 644, 0
	setmetatile 10, 32, 693, 0
	setmetatile 12, 4, 848, 1
	setmetatile 12, 5, 856, 1
	setmetatile 12, 6, 864, 1
	setmetatile 12, 7, 872, 1
	setmetatile 12, 8, 880, 1
	setmetatile 2, 15, 845, 0
	return

EventScript_1A7DD8:: @ 81A7DD8
	setmetatile 24, 14, 760, 1
	setmetatile 25, 14, 761, 1
	setmetatile 26, 14, 762, 1
	setmetatile 24, 15, 768, 1
	setmetatile 25, 15, 769, 1
	setmetatile 26, 15, 770, 1
	setmetatile 10, 28, 848, 1
	setmetatile 10, 29, 856, 1
	setmetatile 10, 30, 864, 1
	setmetatile 10, 31, 872, 1
	setmetatile 10, 32, 880, 1
	setmetatile 12, 4, 677, 1
	setmetatile 12, 5, 685, 1
	setmetatile 12, 6, 645, 0
	setmetatile 12, 7, 644, 0
	setmetatile 12, 8, 693, 0
	setmetatile 2, 15, 788, 0
	return

EventScript_1A7E72:: @ 81A7E72
	setmetatile 17, 11, 645, 0
	setmetatile 18, 11, 644, 0
	setmetatile 19, 11, 644, 0
	setmetatile 17, 12, 645, 0
	setmetatile 18, 12, 644, 0
	setmetatile 19, 12, 644, 0
	setmetatile 21, 4, 848, 1
	setmetatile 21, 5, 856, 1
	setmetatile 21, 6, 864, 1
	setmetatile 21, 7, 872, 1
	setmetatile 21, 8, 880, 1
	setmetatile 12, 4, 845, 0
	return

EventScript_1A7EDF:: @ 81A7EDF
	setmetatile 17, 11, 760, 1
	setmetatile 18, 11, 761, 1
	setmetatile 19, 11, 762, 1
	setmetatile 17, 12, 768, 1
	setmetatile 18, 12, 769, 1
	setmetatile 19, 12, 770, 1
	setmetatile 21, 4, 677, 1
	setmetatile 21, 5, 685, 1
	setmetatile 21, 6, 645, 0
	setmetatile 21, 7, 644, 0
	setmetatile 21, 8, 693, 0
	setmetatile 12, 4, 788, 0
	return

EventScript_1A7F4C:: @ 81A7F4C
	setmetatile 33, 20, 760, 1
	setmetatile 34, 20, 761, 1
	setmetatile 35, 20, 762, 1
	setmetatile 33, 21, 852, 1
	setmetatile 34, 21, 853, 1
	setmetatile 35, 21, 854, 1
	setmetatile 16, 26, 848, 1
	setmetatile 16, 27, 856, 1
	setmetatile 16, 28, 866, 1
	setmetatile 16, 29, 874, 1
	setmetatile 16, 30, 882, 1
	setmetatile 12, 8, 677, 1
	setmetatile 12, 9, 685, 1
	setmetatile 12, 10, 647, 0
	setmetatile 12, 11, 646, 0
	setmetatile 12, 12, 688, 0
	setmetatile 20, 22, 647, 0
	setmetatile 21, 22, 646, 0
	setmetatile 22, 22, 646, 0
	setmetatile 20, 23, 647, 0
	setmetatile 21, 23, 646, 0
	setmetatile 22, 23, 646, 0
	setmetatile 24, 28, 847, 0
	setmetatile 27, 4, 847, 0
	return

EventScript_1A8025:: @ 81A8025
	setmetatile 33, 20, 647, 0
	setmetatile 34, 20, 646, 0
	setmetatile 35, 20, 646, 0
	setmetatile 33, 21, 647, 0
	setmetatile 34, 21, 646, 0
	setmetatile 35, 21, 646, 0
	setmetatile 16, 26, 677, 1
	setmetatile 16, 27, 685, 1
	setmetatile 16, 28, 647, 0
	setmetatile 16, 29, 646, 0
	setmetatile 16, 30, 688, 0
	setmetatile 12, 8, 848, 1
	setmetatile 12, 9, 856, 1
	setmetatile 12, 10, 866, 1
	setmetatile 12, 11, 874, 1
	setmetatile 12, 12, 882, 1
	setmetatile 20, 22, 760, 1
	setmetatile 21, 22, 761, 1
	setmetatile 22, 22, 762, 1
	setmetatile 20, 23, 852, 1
	setmetatile 21, 23, 853, 1
	setmetatile 22, 23, 854, 1
	setmetatile 24, 28, 790, 0
	setmetatile 27, 4, 790, 0
	return
