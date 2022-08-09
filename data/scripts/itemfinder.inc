EventScript_ItemfinderDigUpUnderfootItem::
	lockall
	textcolor NPC_TEXT_COLOR_NEUTRAL
	waitse
	call EventScript_TryPickUpHiddenItem
	compare VAR_0x8007, TRUE
	goto_if_eq EventScript_DigUpItemPutInPocket
	compare VAR_0x8007, FALSE
	goto_if_eq EventScript_DigUpItemBagIsFull
	end

EventScript_DigUpItemPutInPocket::
	message Text_DugUpItemFromGround
	waitfanfare
	waitmessage
	delay 60
	msgbox Text_PutItemAway
	special SetHiddenItemFlag
	releaseall
	end

EventScript_DigUpItemBagIsFull::
	msgbox Text_DugUpItemFromGround
	msgbox Text_TooBadBagFull
	setvar VAR_RESULT, 0
	releaseall
	end
