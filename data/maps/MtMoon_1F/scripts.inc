MtMoon_1F_MapScripts:: @ 81605E4
	map_script MAP_SCRIPT_ON_TRANSITION, MtMoon_1F_OnTransition
	.byte 0

MtMoon_1F_OnTransition:: @ 81605EA
	setworldmapflag FLAG_WORLD_MAP_MT_MOON_1F
	end

MtMoon_1F_EventScript_1605EE:: @ 81605EE
	msgbox gUnknown_8172AE0, 3
	end

MtMoon_1F_EventScript_1605F7:: @ 81605F7
	trainerbattle_single TRAINER_HIKER_MARCOS, Text_17279D, Text_1727CB
	msgbox gUnknown_81727DF, 6
	end

MtMoon_1F_EventScript_16060E:: @ 816060E
	trainerbattle_single TRAINER_YOUNGSTER_JOSH, Text_17281D, Text_172844
	msgbox gUnknown_8172863, 6
	end

MtMoon_1F_EventScript_160625:: @ 8160625
	trainerbattle_single TRAINER_LASS_MIRIAM, Text_172896, Text_1728C3
	msgbox gUnknown_81728D2, 6
	end

MtMoon_1F_EventScript_16063C:: @ 816063C
	trainerbattle_single TRAINER_LASS_IRIS, Text_172972, Text_1729A4
	msgbox gUnknown_81729AC, 6
	end

MtMoon_1F_EventScript_160653:: @ 8160653
	trainerbattle_single TRAINER_SUPER_NERD_JOVAN, Text_17290B, Text_172927
	msgbox gUnknown_817293C, 6
	end

MtMoon_1F_EventScript_16066A:: @ 816066A
	trainerbattle_single TRAINER_BUG_CATCHER_KENT, Text_1729EA, Text_172A1A
	msgbox gUnknown_8172A26, 6
	end

MtMoon_1F_EventScript_160681:: @ 8160681
	trainerbattle_single TRAINER_BUG_CATCHER_ROBBY, Text_172A55, Text_172A8F
	msgbox gUnknown_8172A97, 6
	end
