PewterCity_Gym_MapScripts::
	.byte 0

PewterCity_Gym_EventScript_Brock::
	lock
	faceplayer
	goto_if_set FLAG_DEFEATED_BROCK, PewterCity_Gym_Text_BrockDerrotado
	random 2
	copyvar VAR_0x8008, VAR_RESULT
	call_if_eq VAR_0x8008, 0, PewterCity_Gym_EventScript_Brockv1
	call_if_eq VAR_0x8008, 1, PewterCity_Gym_EventScript_Brockv2
	msgbox PewterCity_Gym_Text_BrockPostBattle
	release
	end

PewterCity_Gym_EventScript_Bonsly::
	lock
	faceplayer
	playmoncry SPECIES_BONSLY, CRY_MODE_ENCOUNTER
	applymovement 5, PewterCity_Gym_Movement_Bonsly
	waitmovement 0
	releaseall
	end
	release
	end

PewterCity_Gym_Movement_Bonsly::
	emote_exclamation_mark
	jump_in_place_down
	step_end


@equipo 1 de brock
PewterCity_Gym_EventScript_Brockv1::
	famechecker FAMECHECKER_BROCK, FCPICKSTATE_COLORED, UpdatePickStateFromSpecialVar8005
	trainerbattle_single TRAINER_LEADER_BROCK, PewterCity_Gym_Text_BrockIntro, PewterCity_Gym_Text_BrockDefeat, PewterCity_Gym_EventScript_DefeatedBrock
	goto_if_unset FLAG_GOT_TM39_FROM_BROCK, PewterCity_Gym_EventScript_GiveTM39
	msgbox PewterCity_Gym_Text_BrockPostBattle
	setflag FLAG_HIDE_PEWTER_CITY_GYM_GUIDE
	setvar VAR_MAP_SCENE_PEWTER_CITY, 1
	release
	end

@equipo 2 de brock
PewterCity_Gym_EventScript_Brockv2::
	famechecker FAMECHECKER_BROCK, FCPICKSTATE_COLORED, UpdatePickStateFromSpecialVar8005
	trainerbattle_single TRAINER_LEADER_BROCK2, PewterCity_Gym_Text_BrockIntro, PewterCity_Gym_Text_BrockDefeat, PewterCity_Gym_EventScript_DefeatedBrock
	goto_if_unset FLAG_GOT_TM39_FROM_BROCK, PewterCity_Gym_EventScript_GiveTM39
	msgbox PewterCity_Gym_Text_BrockPostBattle
	setflag FLAG_HIDE_PEWTER_CITY_GYM_GUIDE
	setvar VAR_MAP_SCENE_PEWTER_CITY, 1
	release
	end

PewterCity_Gym_Text_BrockDerrotado::
	lock
	faceplayer
	msgbox PewterCity_Gym_Text_BrockPostBattle
	release
	end

PewterCity_Gym_EventScript_DefeatedBrock::
	famechecker FAMECHECKER_BROCK, 1
	setflag FLAG_DEFEATED_BROCK
	setflag FLAG_BADGE01_GET
	setflag FLAG_HIDE_PEWTER_CITY_GYM_GUIDE
	set_gym_trainers 1
	goto PewterCity_Gym_EventScript_GiveTM39
	end

PewterCity_Gym_EventScript_GiveTM39::
	msgbox PewterCity_Gym_Text_TakeThisWithYou
	checkitemspace ITEM_TM39
	goto_if_eq VAR_RESULT, FALSE, PewterCity_Gym_EventScript_NoRoomForTM39
	signmsg
	giveitem_msg PewterCity_Gym_Text_ReceivedTM39FromBrock, ITEM_TM39
	normalmsg
	setflag FLAG_GOT_TM39_FROM_BROCK
	msgbox PewterCity_Gym_Text_ExplainTM39
	release
	end

PewterCity_Gym_EventScript_NoRoomForTM39::
	msgbox PewterCity_Gym_Text_DontHaveRoomForThis
	release
	end

PewterCity_Gym_EventScript_Liam::
	trainerbattle_single TRAINER_CAMPER_LIAM, PewterCity_Gym_Text_LiamIntro, PewterCity_Gym_Text_LiamDefeat
	msgbox PewterCity_Gym_Text_LiamPostBattle, MSGBOX_AUTOCLOSE
	end

PewterCity_Gym_EventScript_Gustavo::
	trainerbattle_single TRAINER_HIKER_GUSTAVO, PewterCity_Gym_Text_GustavoIntro, PewterCity_Gym_Text_GustavoDefeat
	msgbox PewterCity_Gym_Text_GustavoPostBattle, MSGBOX_AUTOCLOSE
	end

PewterCity_Gym_EventScript_BrockNoEsta::
	applymovement 3, PewterCity_Museum_1F_Move_BrockNoEsta1
	waitmovement 0
	applymovement LOCALID_PLAYER, PewterCity_Museum_1F_Move_BrockNoEsta2
	waitmovement 0
	msgbox PewterCity_Gym_Text_BrockNoEsta
	closemessage
	applymovement LOCALID_PLAYER, PewterCity_Museum_1F_Move_BrockNoEsta3
	waitmovement 0
	applymovement 3, Common_Movement_FaceOriginalDirection
	waitmovement 0
	release
	end

PewterCity_Museum_1F_Move_BrockNoEsta1::
	face_left
	emote_exclamation_mark
	step_end

PewterCity_Museum_1F_Move_BrockNoEsta2::
	jump_in_place_right
	step_end

PewterCity_Museum_1F_Move_BrockNoEsta3::
	walk_down
	step_end

PewterCity_Gym_EventScript_GymGuy::
	textcolor NPC_TEXT_COLOR_NEUTRAL
	lock
	faceplayer
	goto_if_set FLAG_DEFEATED_BROCK, PewterCity_Gym_EventScript_GymGuyPostVictory
	msgbox PewterCity_Gym_Text_LetMeTakeYouToTheTop, MSGBOX_YESNO
	goto_if_eq VAR_RESULT, YES, PewterCity_Gym_EventScript_GymGuyTakeMeToTop
	goto_if_eq VAR_RESULT, NO, PewterCity_Gym_EventScript_GymGuyDontTakeMeToTop
	end

PewterCity_Gym_EventScript_GymGuyPostVictory::
	msgbox PewterCity_Gym_Text_YoureChampMaterial
	release
	end

PewterCity_Gym_EventScript_GymGuyTakeMeToTop::
	msgbox PewterCity_Gym_Text_LetsGetHappening
	goto PewterCity_Gym_EventScript_GymGuyAdvice
	end

PewterCity_Gym_EventScript_GymGuyDontTakeMeToTop::
	msgbox PewterCity_Gym_Text_ItsFreeLetsGetHappening
	goto PewterCity_Gym_EventScript_GymGuyAdvice
	end

PewterCity_Gym_EventScript_GymGuyAdvice::
	msgbox PewterCity_Gym_Text_TryDifferentPartyOrders
	release
	end

PewterCity_Gym_EventScript_GymStatue::
	lockall
	goto_if_set FLAG_BADGE01_GET, PewterCity_Gym_EventScript_GymStatuePostVictory
	msgbox PewterCity_Gym_Text_GymStatue
	releaseall
	end

PewterCity_Gym_EventScript_GymStatuePostVictory::
	msgbox PewterCity_Gym_Text_GymStatuePlayerWon
	releaseall
	end


Pruebas_Textos::
	msgbox TXT_Pruebas_Textos
	releaseall
	end

TXT_Pruebas_Textos::
    .string "POKéRADAR$"
