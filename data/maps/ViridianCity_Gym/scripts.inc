ViridianCity_Gym_MapScripts:: @ 8169EC9
	.byte 0

ViridianCity_Gym_EventScript_169ECA:: @ 8169ECA
	famechecker FAMECHECKER_GIOVANNI, FCPICKSTATE_COLORED, UpdatePickStateFromSpecialVar8005
	trainerbattle 1, TRAINER_LEADER_GIOVANNI, 0, Text_18F352, Text_18F43F, EventScript_169F04
	checkflag FLAG_0x298
	goto_if FALSE, EventScript_169F2F
	msgbox gUnknown_818F4A2
	closemessage
	fadescreen 1
	removeobject 8
	fadescreen 0
	release
	end

EventScript_169F04:: @ 8169F04
	famechecker FAMECHECKER_GIOVANNI, 3
	setflag FLAG_HIDE_MISC_KANTO_ROCKETS
	setflag FLAG_DEFEATED_LEADER_GIOVANNI
	setflag FLAG_BADGE08_GET
	setvar VAR_MAP_SCENE_ROUTE22, 3
	set_gym_trainers 8
	goto EventScript_169F2F
	end

EventScript_169F2F:: @ 8169F2F
	msgbox gUnknown_818F586
	checkitemspace ITEM_TM26, 1
	compare_var_to_value VAR_RESULT, 0
	goto_if eq, EventScript_169F70
	additem ITEM_TM26, 1
	giveitemfanfaremsg gUnknown_818F675, ITEM_TM26
	setflag FLAG_0x298
	msgbox gUnknown_818F695
	release
	end

EventScript_169F70:: @ 8169F70
	msgbox gUnknown_818F71B
	release
	end

ViridianCity_Gym_EventScript_169F7A:: @ 8169F7A
	trainerbattle 0, TRAINER_TAMER_JASON, 0, Text_18F7F3, Text_18F824
	msgbox gUnknown_818F840, 6
	end

ViridianCity_Gym_EventScript_169F91:: @ 8169F91
	trainerbattle 0, TRAINER_TAMER_COLE, 0, Text_18F98A, Text_18F9BB
	msgbox gUnknown_818F9CC, 6
	end

ViridianCity_Gym_EventScript_169FA8:: @ 8169FA8
	trainerbattle 0, TRAINER_BLACK_BELT_ATSUSHI, 0, Text_18F7AD, Text_18F7D6
	msgbox gUnknown_818F7DD, 6
	end

ViridianCity_Gym_EventScript_169FBF:: @ 8169FBF
	trainerbattle 0, TRAINER_BLACK_BELT_KIYO, 0, Text_18F86C, Text_18F899
	msgbox gUnknown_818F8A0, 6
	end

ViridianCity_Gym_EventScript_169FD6:: @ 8169FD6
	trainerbattle 0, TRAINER_BLACK_BELT_TAKASHI, 0, Text_18F92C, Text_18F95A
	msgbox gUnknown_818F960, 6
	end

ViridianCity_Gym_EventScript_169FED:: @ 8169FED
	trainerbattle 0, TRAINER_COOLTRAINER_SAMUEL, 0, Text_18F9E7, Text_18FA2D
	msgbox gUnknown_818FA3B, 6
	end

ViridianCity_Gym_EventScript_16A004:: @ 816A004
	trainerbattle 0, TRAINER_COOLTRAINER_YUJI, 0, Text_18F73B, Text_18F769
	msgbox gUnknown_818F77B, 6
	end

ViridianCity_Gym_EventScript_16A01B:: @ 816A01B
	trainerbattle 0, TRAINER_COOLTRAINER_WARREN, 0, Text_18F8CB, Text_18F8EE
	msgbox gUnknown_818F8FE, 6
	end

ViridianCity_Gym_EventScript_16A032:: @ 816A032
	lock
	faceplayer
	checkflag FLAG_DEFEATED_LEADER_GIOVANNI
	goto_if TRUE, EventScript_16A047
	msgbox gUnknown_818FA81
	release
	end

EventScript_16A047:: @ 816A047
	famechecker FAMECHECKER_GIOVANNI, 4
	msgbox gUnknown_818FB56
	release
	end

ViridianCity_Gym_EventScript_16A05E:: @ 816A05E
	lockall
	checkflag FLAG_BADGE08_GET
	goto_if TRUE, EventScript_16A072
	msgbox gUnknown_818FB8D
	releaseall
	end

EventScript_16A072:: @ 816A072
	msgbox gUnknown_818FBC1
	releaseall
	end
