EventScript_AfterWhiteOutHeal::
	lockall
	textcolor NPC_TEXT_COLOR_FEMALE
	msgbox Text_FirstShouldRestoreMonsHealth
	call EventScript_PkmnCenterNurse_TakeAndHealPkmn
	call_if_unset FLAG_DEFEATED_BROCK, EventScript_AfterWhiteOutHealMsgPreBrock
	call_if_set FLAG_DEFEATED_BROCK, EventScript_AfterWhiteOutHealMsg
	applymovement VAR_LAST_TALKED, Movement_Bow
	waitmovement 0
	fadedefaultbgm
	releaseall
	end

EventScript_AfterWhiteOutHealMsgPreBrock::
	msgbox Text_MonsHealedShouldBuyPotions
	return

EventScript_AfterWhiteOutHealMsg::
	msgbox Text_MonsHealed
	return

@ LOCALID_MOM set by PalletTown_PlayersHouse_1F

EventScript_AfterWhiteOutMomHeal::
	lockall
	textcolor NPC_TEXT_COLOR_FEMALE
	applymovement LOCALID_MOM, Common_Movement_WalkInPlaceFasterDown
	waitmovement 0
	msgbox Text_HadQuiteAnExperienceTakeRest
	call EventScript_OutOfCenterPartyHeal
	msgbox Text_MomExplainHPGetPotions
	fadedefaultbgm
	releaseall
	end

EventScript_FieldPoison::
	lockall
	textcolor NPC_TEXT_COLOR_NEUTRAL
	special TryFieldPoisonWhiteOut
	waitstate
	goto_if_eq VAR_RESULT, TRUE, EventScript_FieldWhiteOut
	releaseall
	end

EventScript_FieldWhiteOut::
	checkmoney 1
	goto_if_eq VAR_RESULT, FALSE, EventScript_FieldWhiteOutNoMoney
	goto_if_eq VAR_RESULT, TRUE, EventScript_FieldWhiteOutHasMoney
	end

EventScript_FieldWhiteOutNoMoney::
	msgbox Text_WhitedOut
	goto EventScript_FieldWhiteOutFade
	end

EventScript_FieldWhiteOutHasMoney::
	special OverworldWhiteOutGetMoneyLoss
	msgbox Text_WhitedOutLostMoney
	goto EventScript_FieldWhiteOutFade
	end

EventScript_FieldWhiteOutFade::
	special Script_FadeOutMapMusic
	waitstate
	fadescreen FADE_TO_BLACK
	special SetCB2WhiteOut
	waitstate
	end
