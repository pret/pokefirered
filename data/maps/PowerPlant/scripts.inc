# 1 "data/maps/PowerPlant/scripts.pory"

# 2 "data/maps/PowerPlant/scripts.pory"
PowerPlant_MapScripts::
# 3 "data/maps/PowerPlant/scripts.pory"
	map_script MAP_SCRIPT_ON_RESUME, PowerPlant_OnResume
# 4 "data/maps/PowerPlant/scripts.pory"
	map_script MAP_SCRIPT_ON_TRANSITION, PowerPlant_OnTransition
# 5 "data/maps/PowerPlant/scripts.pory"
	.byte 0
# 6 "data/maps/PowerPlant/scripts.pory"

# 7 "data/maps/PowerPlant/scripts.pory"
PowerPlant_OnResume::
# 8 "data/maps/PowerPlant/scripts.pory"
	call_if_set FLAG_SYS_SPECIAL_WILD_BATTLE, PowerPlant_EventScript_TryRemoveStaticMon
# 9 "data/maps/PowerPlant/scripts.pory"
	end
# 10 "data/maps/PowerPlant/scripts.pory"

# 11 "data/maps/PowerPlant/scripts.pory"
PowerPlant_EventScript_TryRemoveStaticMon::
# 12 "data/maps/PowerPlant/scripts.pory"
	specialvar VAR_RESULT, GetBattleOutcome
# 13 "data/maps/PowerPlant/scripts.pory"
	goto_if_ne VAR_RESULT, B_OUTCOME_CAUGHT, EventScript_Return
# 14 "data/maps/PowerPlant/scripts.pory"
	removeobject VAR_LAST_TALKED
# 15 "data/maps/PowerPlant/scripts.pory"
	return
# 16 "data/maps/PowerPlant/scripts.pory"

# 17 "data/maps/PowerPlant/scripts.pory"
PowerPlant_OnTransition::
# 18 "data/maps/PowerPlant/scripts.pory"
	setworldmapflag FLAG_WORLD_MAP_POWER_PLANT
# 19 "data/maps/PowerPlant/scripts.pory"
	call_if_unset FLAG_FOUGHT_ZAPDOS, PowerPlant_EventScript_ShowZapdos
# 20 "data/maps/PowerPlant/scripts.pory"
	call_if_unset FLAG_FOUGHT_POWER_PLANT_ELECTRODE_1, PowerPlant_EventScript_ShowElectrode1
# 21 "data/maps/PowerPlant/scripts.pory"
	call_if_unset FLAG_FOUGHT_POWER_PLANT_ELECTRODE_2, PowerPlant_EventScript_ShowElectrode2
# 22 "data/maps/PowerPlant/scripts.pory"
	end
# 23 "data/maps/PowerPlant/scripts.pory"

# 24 "data/maps/PowerPlant/scripts.pory"
PowerPlant_EventScript_ShowZapdos::
# 25 "data/maps/PowerPlant/scripts.pory"
	clearflag FLAG_HIDE_ZAPDOS
# 26 "data/maps/PowerPlant/scripts.pory"
	return
# 27 "data/maps/PowerPlant/scripts.pory"

# 28 "data/maps/PowerPlant/scripts.pory"
PowerPlant_EventScript_ShowElectrode1::
# 29 "data/maps/PowerPlant/scripts.pory"
	clearflag FLAG_HIDE_POWER_PLANT_ELECTRODE_1
# 30 "data/maps/PowerPlant/scripts.pory"
	return
# 31 "data/maps/PowerPlant/scripts.pory"

# 32 "data/maps/PowerPlant/scripts.pory"
PowerPlant_EventScript_ShowElectrode2::
# 33 "data/maps/PowerPlant/scripts.pory"
	clearflag FLAG_HIDE_POWER_PLANT_ELECTRODE_2
# 34 "data/maps/PowerPlant/scripts.pory"
	return
# 35 "data/maps/PowerPlant/scripts.pory"

# 36 "data/maps/PowerPlant/scripts.pory"
PowerPlant_EventScript_Zapdos::
# 37 "data/maps/PowerPlant/scripts.pory"
	goto_if_questlog EventScript_ReleaseEnd
# 38 "data/maps/PowerPlant/scripts.pory"
	special QuestLog_CutRecording
# 39 "data/maps/PowerPlant/scripts.pory"
	lock
# 40 "data/maps/PowerPlant/scripts.pory"
	faceplayer
# 41 "data/maps/PowerPlant/scripts.pory"
	setwildbattle SPECIES_ZAPDOS, 50
# 42 "data/maps/PowerPlant/scripts.pory"
	waitse
# 43 "data/maps/PowerPlant/scripts.pory"
	playmoncry SPECIES_ZAPDOS, CRY_MODE_ENCOUNTER
# 44 "data/maps/PowerPlant/scripts.pory"
	message Text_Gyaoo
# 45 "data/maps/PowerPlant/scripts.pory"
	waitmessage
# 46 "data/maps/PowerPlant/scripts.pory"
	waitmoncry
# 47 "data/maps/PowerPlant/scripts.pory"
	delay 10
# 48 "data/maps/PowerPlant/scripts.pory"
	playbgm MUS_ENCOUNTER_GYM_LEADER, 0
# 49 "data/maps/PowerPlant/scripts.pory"
	waitbuttonpress
# 50 "data/maps/PowerPlant/scripts.pory"
	setflag FLAG_SYS_SPECIAL_WILD_BATTLE
# 51 "data/maps/PowerPlant/scripts.pory"
	special StartLegendaryBattle
# 52 "data/maps/PowerPlant/scripts.pory"
	waitstate
# 53 "data/maps/PowerPlant/scripts.pory"
	clearflag FLAG_SYS_SPECIAL_WILD_BATTLE
# 54 "data/maps/PowerPlant/scripts.pory"
	specialvar VAR_RESULT, GetBattleOutcome
# 55 "data/maps/PowerPlant/scripts.pory"
	goto_if_eq VAR_RESULT, B_OUTCOME_WON, PowerPlant_EventScript_DefeatedZapdos
# 56 "data/maps/PowerPlant/scripts.pory"
	goto_if_eq VAR_RESULT, B_OUTCOME_RAN, PowerPlant_EventScript_RanFromZapdos
# 57 "data/maps/PowerPlant/scripts.pory"
	goto_if_eq VAR_RESULT, B_OUTCOME_PLAYER_TELEPORTED, PowerPlant_EventScript_RanFromZapdos
# 58 "data/maps/PowerPlant/scripts.pory"
	setflag FLAG_FOUGHT_ZAPDOS
# 59 "data/maps/PowerPlant/scripts.pory"
	release
# 60 "data/maps/PowerPlant/scripts.pory"
	end
# 61 "data/maps/PowerPlant/scripts.pory"

# 62 "data/maps/PowerPlant/scripts.pory"
PowerPlant_EventScript_DefeatedZapdos::
# 63 "data/maps/PowerPlant/scripts.pory"
	setflag FLAG_FOUGHT_ZAPDOS
# 64 "data/maps/PowerPlant/scripts.pory"
	goto EventScript_RemoveStaticMon
# 65 "data/maps/PowerPlant/scripts.pory"
	end
# 66 "data/maps/PowerPlant/scripts.pory"

# 67 "data/maps/PowerPlant/scripts.pory"
PowerPlant_EventScript_RanFromZapdos::
# 68 "data/maps/PowerPlant/scripts.pory"
	setvar VAR_0x8004, SPECIES_ZAPDOS
# 69 "data/maps/PowerPlant/scripts.pory"
	goto EventScript_MonFlewAway
# 70 "data/maps/PowerPlant/scripts.pory"
	end
# 71 "data/maps/PowerPlant/scripts.pory"

# 72 "data/maps/PowerPlant/scripts.pory"
PowerPlant_EventScript_Electrode1::
# 73 "data/maps/PowerPlant/scripts.pory"
	goto_if_questlog EventScript_ReleaseEnd
# 74 "data/maps/PowerPlant/scripts.pory"
	lock
# 75 "data/maps/PowerPlant/scripts.pory"
	faceplayer
# 76 "data/maps/PowerPlant/scripts.pory"
	setwildbattle SPECIES_ELECTRODE, 34
# 77 "data/maps/PowerPlant/scripts.pory"
	waitse
# 78 "data/maps/PowerPlant/scripts.pory"
	playmoncry SPECIES_ELECTRODE, CRY_MODE_ENCOUNTER
# 79 "data/maps/PowerPlant/scripts.pory"
	delay 40
# 80 "data/maps/PowerPlant/scripts.pory"
	waitmoncry
# 81 "data/maps/PowerPlant/scripts.pory"
	setflag FLAG_SYS_SPECIAL_WILD_BATTLE
# 82 "data/maps/PowerPlant/scripts.pory"
	dowildbattle
# 83 "data/maps/PowerPlant/scripts.pory"
	clearflag FLAG_SYS_SPECIAL_WILD_BATTLE
# 84 "data/maps/PowerPlant/scripts.pory"
	special QuestLog_CutRecording
# 85 "data/maps/PowerPlant/scripts.pory"
	specialvar VAR_RESULT, GetBattleOutcome
# 86 "data/maps/PowerPlant/scripts.pory"
	goto_if_eq VAR_RESULT, B_OUTCOME_WON, PowerPlant_EventScript_FoughtElectrode1
# 87 "data/maps/PowerPlant/scripts.pory"
	goto_if_eq VAR_RESULT, B_OUTCOME_RAN, PowerPlant_EventScript_FoughtElectrode1
# 88 "data/maps/PowerPlant/scripts.pory"
	goto_if_eq VAR_RESULT, B_OUTCOME_PLAYER_TELEPORTED, PowerPlant_EventScript_FoughtElectrode1
# 89 "data/maps/PowerPlant/scripts.pory"
	setflag FLAG_FOUGHT_POWER_PLANT_ELECTRODE_1
# 90 "data/maps/PowerPlant/scripts.pory"
	release
# 91 "data/maps/PowerPlant/scripts.pory"
	end
# 92 "data/maps/PowerPlant/scripts.pory"

# 93 "data/maps/PowerPlant/scripts.pory"
PowerPlant_EventScript_FoughtElectrode1::
# 94 "data/maps/PowerPlant/scripts.pory"
	setflag FLAG_FOUGHT_POWER_PLANT_ELECTRODE_1
# 95 "data/maps/PowerPlant/scripts.pory"
	goto EventScript_RemoveStaticMon
# 96 "data/maps/PowerPlant/scripts.pory"
	end
# 97 "data/maps/PowerPlant/scripts.pory"

# 98 "data/maps/PowerPlant/scripts.pory"
PowerPlant_EventScript_Electrode2::
# 99 "data/maps/PowerPlant/scripts.pory"
	goto_if_questlog EventScript_ReleaseEnd
# 100 "data/maps/PowerPlant/scripts.pory"
	lock
# 101 "data/maps/PowerPlant/scripts.pory"
	faceplayer
# 102 "data/maps/PowerPlant/scripts.pory"
	setwildbattle SPECIES_ELECTRODE, 34
# 103 "data/maps/PowerPlant/scripts.pory"
	waitse
# 104 "data/maps/PowerPlant/scripts.pory"
	playmoncry SPECIES_ELECTRODE, CRY_MODE_ENCOUNTER
# 105 "data/maps/PowerPlant/scripts.pory"
	delay 40
# 106 "data/maps/PowerPlant/scripts.pory"
	waitmoncry
# 107 "data/maps/PowerPlant/scripts.pory"
	setflag FLAG_SYS_SPECIAL_WILD_BATTLE
# 108 "data/maps/PowerPlant/scripts.pory"
	dowildbattle
# 109 "data/maps/PowerPlant/scripts.pory"
	clearflag FLAG_SYS_SPECIAL_WILD_BATTLE
# 110 "data/maps/PowerPlant/scripts.pory"
	special QuestLog_CutRecording
# 111 "data/maps/PowerPlant/scripts.pory"
	specialvar VAR_RESULT, GetBattleOutcome
# 112 "data/maps/PowerPlant/scripts.pory"
	goto_if_eq VAR_RESULT, B_OUTCOME_WON, PowerPlant_EventScript_FoughtElectrode2
# 113 "data/maps/PowerPlant/scripts.pory"
	goto_if_eq VAR_RESULT, B_OUTCOME_RAN, PowerPlant_EventScript_FoughtElectrode2
# 114 "data/maps/PowerPlant/scripts.pory"
	goto_if_eq VAR_RESULT, B_OUTCOME_PLAYER_TELEPORTED, PowerPlant_EventScript_FoughtElectrode2
# 115 "data/maps/PowerPlant/scripts.pory"
	setflag FLAG_FOUGHT_POWER_PLANT_ELECTRODE_2
# 116 "data/maps/PowerPlant/scripts.pory"
	release
# 117 "data/maps/PowerPlant/scripts.pory"
	end
# 118 "data/maps/PowerPlant/scripts.pory"

# 119 "data/maps/PowerPlant/scripts.pory"
PowerPlant_EventScript_FoughtElectrode2::
# 120 "data/maps/PowerPlant/scripts.pory"
	setflag FLAG_FOUGHT_POWER_PLANT_ELECTRODE_2
# 121 "data/maps/PowerPlant/scripts.pory"
	goto EventScript_RemoveStaticMon
# 122 "data/maps/PowerPlant/scripts.pory"
	end
