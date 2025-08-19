Common_EventScript_BetaNoth::
	applymovement LOCALID_PLAYER, Common_Movement_ExclamationMark
	waitmovement 0
	signmsg
	msgbox Common_Text_Beta
	closemessage
	normalmsg
	applymovement LOCALID_PLAYER, Common_Movement_WalkUp
	waitmovement 0
	release
	end

Common_EventScript_BetaSouth::
	applymovement LOCALID_PLAYER, Common_Movement_ExclamationMark
	waitmovement 0
	signmsg
	msgbox Common_Text_Beta
	closemessage
	normalmsg
	applymovement LOCALID_PLAYER, Common_Movement_WalkDown
	waitmovement 0
	release
	end

Common_EventScript_BetaEast::
	applymovement LOCALID_PLAYER, Common_Movement_ExclamationMark
	waitmovement 0
	signmsg
	msgbox Common_Text_Beta
	closemessage
	normalmsg
	applymovement LOCALID_PLAYER, Common_Movement_WalkRight
	waitmovement 0
	release
	end

Common_EventScript_BetaWest::
	applymovement LOCALID_PLAYER, Common_Movement_ExclamationMark
	waitmovement 0
	signmsg
	msgbox Common_Text_Beta
	closemessage
	normalmsg
	applymovement LOCALID_PLAYER, Common_Movement_WalkLeft
	waitmovement 0
	release
	end

Common_Text_Beta::
	.string "Esta zona aún está cerrada por\n"
	.string "mantenimiento.\p"
	.string "¡Pronto estará lista para explorarla!$"