#include "constants/flags.h"
#include "constants/moves.h"
#include "constants/songs.h"
#include "constants/species.h"
#include "constants/vars.h"
#include "constants/items.h"
	.include "asm/macros.inc"
	.include "asm/macros/event.inc"
	.include "constants/constants.inc"

	.section .rodata
	
	.align 2
MysteryEventScript_StampCard:: @ 8488E28
	setvaddress MysteryEventScript_StampCard
	setorcopyvar VAR_RESULT, 1
	specialvar VAR_0x8008, sub_80CC730
	setorcopyvar VAR_RESULT, 0
	specialvar VAR_0x8009, sub_80CC730
	subvar VAR_0x8008, VAR_0x8009
	getnumberstring 0, VAR_0x8008
	lock
	faceplayer
	vmessage gText_8488E55
	waitmessage
	waitbuttonpress
	release
	end

gText_8488E55:: @ 8488E55
	.string "Thank you for using the STAMP CARD\n"
	.string "System.\p"
	.string "You have {STR_VAR_1} more to collect to\n"
	.string "fill your STAMP CARD.$"

gEventScript_8488EB5:: @ 8488EB5
	setvaddress gEventScript_8488EB5
	checkflag FLAG_0x3D8
	vgoto_if 0, gEventScript_8488EC4
	gotoram
gEventScript_8488EC4:: @ 8488EC4
	specialvar VAR_0x40B5, CalculatePlayerPartyCount
	compare_var_to_value VAR_0x40B5, 6
	vgoto_if 1, gEventScript_8488EEB
	setflag FLAG_0x3D8
	vcall gEventScript_8488EF6
	lock
	faceplayer
	vmessage gText_8488F56
	waitmessage
	waitbuttonpress
	playfanfare MUS_FANFA4
	waitfanfare
	release
	end

gEventScript_8488EEB:: @ 8488EEB
	lock
	faceplayer
	vmessage gText_8488FE3
	waitmessage
	waitbuttonpress
	release
	end

gEventScript_8488EF6:: @ 8488EF6
	giveegg SPECIES_PICHU
	setmonobedient VAR_0x40B5
	setmonmetlocation VAR_0x40B5, 0xff
	compare_var_to_value VAR_0x40B5, 1
	vgoto_if 1, gEventScript_8488F38
	compare_var_to_value VAR_0x40B5, 2
	vgoto_if 1, gEventScript_8488F3E
	compare_var_to_value VAR_0x40B5, 3
	vgoto_if 1, gEventScript_8488F44
	compare_var_to_value VAR_0x40B5, 4
	vgoto_if 1, gEventScript_8488F4A
	compare_var_to_value VAR_0x40B5, 5
	vgoto_if 1, gEventScript_8488F50
	return

gEventScript_8488F38:: @ 8488F38
	setmonmove 1, 2, MOVE_SURF
	return

gEventScript_8488F3E:: @ 8488F3E
	setmonmove 2, 2, MOVE_SURF
	return

gEventScript_8488F44:: @ 8488F44
	setmonmove 3, 2, MOVE_SURF
	return

gEventScript_8488F4A:: @ 8488F4A
	setmonmove 4, 2, MOVE_SURF
	return

gEventScript_8488F50:: @ 8488F50
	setmonmove 5, 2, MOVE_SURF
	return

gText_8488F56:: @ 8488F56
	.string "Thank you for using the MYSTERY\n"
	.string "GIFT System.\p"
	.string "From the POKéMON CENTER we\n"
	.string "have a gift - a POKéMON EGG!\p"
	.string "Please raise it with love and\n"
	.string "kindness.$"

gText_8488FE3:: @ 8488FE3
	.string "Oh, your party appears to be full.\p"
	.string "Please come see me after storing\n"
	.string "a POKéMON on a PC.$"

gEventScript_848903A:: @ 848903A
	setvaddress gEventScript_848903A
	special ValidateEReaderTrainer
	compare_var_to_value VAR_RESULT, 0
	vgoto_if 1, gEventScript_8489058
	lock
	faceplayer
	vmessage gText_8489063
	waitmessage
	waitbuttonpress
	release
	end

gEventScript_8489058:: @ 8489058
	lock
	faceplayer
	vmessage gText_84891B0
	waitmessage
	waitbuttonpress
	release
	end

gText_8489063:: @ 8489063
	.string "Thank you for using the MYSTERY\n"
	.string "GIFT System.\p"
	.string "By holding this WONDER CARD, you\n"
	.string "may take part in a survey at a\l"
	.string "POKéMON MART.\p"
	.string "Use these surveys to invite\n"
	.string "TRAINERS to the SEVII ISLANDS.\p"
	.string "…Let me give you a secret\n"
	.string "password for a survey:\p"
	.string "“GIVE ME\n"
	.string "AWESOME TRAINER”\p"
	.string "Write that in on a survey and send\n"
	.string "it to the WIRELESS\l"
	.string "COMMUNICATION SYSTEM.$"

gText_84891B0:: @ 84891B0
	.string "Thank you for using the MYSTERY\n"
	.string "GIFT System.\p"
	.string "A TRAINER has arrived in the SEVII\n"
	.string "ISLANDS looking for you.\p"
	.string "We hope you will enjoy\n"
	.string "battling the visiting TRAINER.\p"
	.string "You may invite other TRAINERS by\n"
	.string "entering other passwords.\p"
	.string "Try looking for other passwords\n"
	.string "that may work.$"

gEventScript_84892B9:: @ 84892B9
	setvaddress gEventScript_84892B9
	checkflag FLAG_0x3D8
	vgoto_if 1, gEventScript_84892F6
	setorcopyvar VAR_RESULT, 2
	specialvar VAR_0x8008, sub_80CC730
	compare_var_to_value VAR_0x8008, 3
	vgoto_if 0, gEventScript_84892F6
	lock
	faceplayer
	vmessage gText_8489419
	waitmessage
	waitbuttonpress
	giveitem ITEM_POTION
	release
	setflag FLAG_0x3D8
	end

gEventScript_84892F6:: @ 84892F6
	lock
	faceplayer
	vmessage gText_8489301
	waitmessage
	waitbuttonpress
	release
	end

gText_8489301:: @ 8489301
	.string "Thank you for using the MYSTERY\n"
	.string "GIFT System.\p"
	.string "Your BATTLE COUNT CARD keeps\n"
	.string "track of your battle record against\l"
	.string "TRAINERS with the same CARD.\p"
	.string "Look for and battle TRAINERS who\n"
	.string "have the same CARD as you.\p"
	.string "You may check the overall rankings\n"
	.string "by reading the NEWS.\p"
	.string "Please do give it a try!$"

gText_8489419:: @ 8489419
	.string "Thank you for using the MYSTERY\n"
	.string "GIFT System.\p"
	.string "Congratulations!\p"
	.string "You have won a prize for winning\n"
	.string "three battles!\p"
	.string "We hope you will be inspired to\n"
	.string "battle some more.$"

gEventScript_84894B9:: @ 84894B9
	setvaddress gEventScript_84894B9
	lock
	faceplayer
	checkflag FLAG_0x2A7
	vgoto_if 1, gEventScript_848951D
	checkflag FLAG_0x2E4
	vgoto_if 1, gEventScript_848951D
	checkitem ITEM_AURORA_TICKET, 1
	compare_var_to_value VAR_RESULT, 1
	vgoto_if 1, gEventScript_848951D
	vmessage gText_8489526
	waitmessage
	waitbuttonpress
	checkitemspace ITEM_AURORA_TICKET, 1
	compare_var_to_value VAR_RESULT, 0
	vgoto_if 1, gEventScript_8489514
	giveitem ITEM_AURORA_TICKET
	setflag FLAG_0x84B
	setflag FLAG_0x2A7
	vmessage gText_8489583
	waitmessage
	waitbuttonpress
	release
	end

gEventScript_8489514:: @ 8489514
	vmessage gText_8489615
	waitmessage
	waitbuttonpress
	release
	end

gEventScript_848951D:: @ 848951D
	vmessage gText_84895E8
	waitmessage
	waitbuttonpress
	release
	end

gText_8489526:: @ 8489526
	.string "Thank you for using the MYSTERY\n"
	.string "GIFT System.\p"
	.string "You must be {PLAYER}.\n"
	.string "There is a ticket here for you.$"

gText_8489583:: @ 8489583
	.string "It appears to be for use at the\n"
	.string "VERMILION CITY port.\p"
	.string "Why not give it a try and see what\n"
	.string "it is about?$"

gText_84895E8:: @ 84895E8
	.string "Thank you for using the MYSTERY\n"
	.string "GIFT System.$"

gText_8489615:: @ 8489615
	.string "Oh, I'm sorry, {PLAYER}. Your BAG's\n"
	.string "KEY ITEMS POCKET is full.\p"
	.string "Please store something on your PC,\n"
	.string "then come back for this.$"

gEventScript_8489689:: @ 8489689
	setvaddress gEventScript_8489689
	lock
	faceplayer
	checkflag FLAG_0x2A8
	vgoto_if 1, gEventScript_84896F6
	checkflag FLAG_0x2F2
	vgoto_if 1, gEventScript_84896F6
	checkflag FLAG_0x2F3
	vgoto_if 1, gEventScript_84896F6
	checkitem ITEM_MYSTIC_TICKET, 1
	compare_var_to_value VAR_RESULT, 1
	vgoto_if 1, gEventScript_84896F6
	vmessage gText_84896FF
	waitmessage
	waitbuttonpress
	checkitemspace ITEM_MYSTIC_TICKET, 1
	compare_var_to_value VAR_RESULT, 0
	vgoto_if 1, gEventScript_84896ED
	giveitem ITEM_MYSTIC_TICKET
	setflag FLAG_0x84A
	setflag FLAG_0x2A8
	vmessage gText_848975C
	waitmessage
	waitbuttonpress
	release
	end

gEventScript_84896ED:: @ 84896ED
	vmessage gText_84897EE
	waitmessage
	waitbuttonpress
	release
	end

gEventScript_84896F6:: @ 84896F6
	vmessage gText_84897C1
	waitmessage
	waitbuttonpress
	release
	end

gText_84896FF:: @ 84896FF
	.string "Thank you for using the MYSTERY\n"
	.string "GIFT System.\p"
	.string "You must be {PLAYER}.\n"
	.string "There is a ticket here for you.$"

gText_848975C:: @ 848975C
	.string "It appears to be for use at the\n"
	.string "VERMILION CITY port.\p"
	.string "Why not give it a try and see what\n"
	.string "it is about?$"

gText_84897C1:: @ 84897C1
	.string "Thank you for using the MYSTERY\n"
	.string "GIFT System.$"

gText_84897EE:: @ 84897EE
	.string "Oh, I'm sorry, {PLAYER}. Your BAG's\n"
	.string "KEY ITEMS POCKET is full.\p"
	.string "Please store something on your PC,\n"
	.string "then come back for this.$"

gEventScript_8489862:: @ 8489862
	setvaddress gEventScript_8489862
	addvar VAR_0x4024, 1
	compare_var_to_value VAR_0x4024, 10
	vgoto_if 0, gEventScript_848987C
	setvar VAR_0x4024, 0
gEventScript_848987C:: @ 848987C
	lock
	faceplayer
	vmessage gText_8489887
	waitmessage
	waitbuttonpress
	release
	end

gText_8489887:: @ 8489887
	.string "Thank you for using the MYSTERY\n"
	.string "GIFT System.\p"
	.string "Recently, there have been rumors\n"
	.string "of rare POKéMON appearances.\p"
	.string "The rumors are about ALTERING\n"
	.string "CAVE on OUTCAST ISLAND.\p"
	.string "Why not visit there and check if\n"
	.string "the rumors are indeed true?$"
