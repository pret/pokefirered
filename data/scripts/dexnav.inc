SystemScript_StartDexNavBattle::
	lock
	playse 0x15
// falta exclamacion
	waitmovement 0
	waitse
	dowildbattle    
	release
	end

SystemScript_DexNav_CannotBeFound::
	lockall
    msgbox gText_CannotBeFound MSGBOX_DEFAULT
	closemessage
	releaseall
	end

SystemScript_DexNav_NotFoundNearby::
	lockall
    msgbox gText_NotFoundNearby MSGBOX_DEFAULT
	closemessage
	releaseall
	end

SystemScript_DexNav_TooDarkForDexNav::
	lockall
    msgbox gText_TooDarkForDexNav MSGBOX_DEFAULT
	closemessage
	releaseall
	end

SystemScript_DexNav_GotAway::
	lockall
    msgbox gText_GotAway MSGBOX_DEFAULT
	closemessage
	releaseall
	end

SystemScript_DexNav_LostSignal::
	lockall
    msgbox gText_LostSignal MSGBOX_DEFAULT
	closemessage
	releaseall
	end

SystemScript_DexNav_GotAwayShouldSneak::
	lockall
    msgbox gText_GotAwayShouldSneak MSGBOX_DEFAULT
	closemessage
	releaseall
	end
