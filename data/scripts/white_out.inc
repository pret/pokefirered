EventScript_AfterWhiteOutHeal::
	lockall
	textcolor 1
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
	textcolor 1
	applymovement LOCALID_MOM, Movement_WalkInPlaceFastestDown
	waitmovement 0
	msgbox Text_HadQuiteAnExperienceTakeRest
	call EventScript_OutOfCenterPartyHeal
	msgbox Text_MomExplainHPGetPotions
	fadedefaultbgm
	releaseall
	end

EventScript_FieldPoison::
	lockall
	textcolor 3
	special TryFieldPoisonWhiteOut
	waitstate
	compare VAR_RESULT, TRUE
	goto_if_eq EventScript_FieldWhiteOut
	releaseall
	end

EventScript_FieldWhiteOut::
	checkmoney 1, 0
	compare VAR_RESULT, FALSE
	goto_if_eq EventScript_FieldWhiteOutNoMoney
	compare VAR_RESULT, TRUE
	goto_if_eq EventScript_FieldWhiteOutHasMoney
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
