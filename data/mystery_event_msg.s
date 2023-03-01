@ These are event scripts. They should not be moved to C.

#include "constants/global.h"
#include "constants/flags.h"
#include "constants/moves.h"
#include "constants/songs.h"
#include "constants/species.h"
#include "constants/vars.h"
#include "constants/items.h"
#include "constants/region_map_sections.h"
	.include "asm/macros.inc"
	.include "asm/macros/event.inc"
	.include "constants/constants.inc"

	.section .rodata
	
	.align 2
MysteryEventScript_StampCard::
	setvaddress MysteryEventScript_StampCard
	setorcopyvar VAR_RESULT, 1
	specialvar VAR_0x8008, GetMysteryGiftCardStat
	setorcopyvar VAR_RESULT, 0
	specialvar VAR_0x8009, GetMysteryGiftCardStat
	subvar VAR_0x8008, VAR_0x8009
	buffernumberstring STR_VAR_1, VAR_0x8008
	lock
	faceplayer
	vmessage sText_MysteryGiftStampCard
	waitmessage
	waitbuttonpress
	release
	end

sText_MysteryGiftStampCard:
	.string "Thank you for using the STAMP CARD\n"
	.string "System.\p"
	.string "You have {STR_VAR_1} more to collect to\n"
	.string "fill your STAMP CARD.$"

MysteryEventScript_SurfPichu::
	setvaddress MysteryEventScript_SurfPichu
	vgoto_if_unset FLAG_MYSTERY_GIFT_DONE, SurfPichu_GiveIfPossible
	returnram

SurfPichu_GiveIfPossible:
	specialvar VAR_EVENT_PICHU_SLOT, CalculatePlayerPartyCount
	vgoto_if_eq VAR_EVENT_PICHU_SLOT, PARTY_SIZE, SurfPichu_FullParty
	setflag FLAG_MYSTERY_GIFT_DONE
	vcall SurfPichu_GiveEgg
	lock
	faceplayer
	vmessage sText_MysteryGiftEgg
	waitmessage
	waitbuttonpress
	playfanfare MUS_OBTAIN_ITEM
	waitfanfare
	release
	end

SurfPichu_FullParty:
	lock
	faceplayer
	vmessage sText_FullParty
	waitmessage
	waitbuttonpress
	release
	end

SurfPichu_GiveEgg:
	giveegg SPECIES_PICHU
	setmonmodernfatefulencounter VAR_EVENT_PICHU_SLOT
	setmonmetlocation VAR_EVENT_PICHU_SLOT, METLOC_FATEFUL_ENCOUNTER
	vgoto_if_eq VAR_EVENT_PICHU_SLOT, 1, SurfPichu_Slot1
	vgoto_if_eq VAR_EVENT_PICHU_SLOT, 2, SurfPichu_Slot2
	vgoto_if_eq VAR_EVENT_PICHU_SLOT, 3, SurfPichu_Slot3
	vgoto_if_eq VAR_EVENT_PICHU_SLOT, 4, SurfPichu_Slot4
	vgoto_if_eq VAR_EVENT_PICHU_SLOT, 5, SurfPichu_Slot5
	return

SurfPichu_Slot1:
	setmonmove 1, 2, MOVE_SURF
	return

SurfPichu_Slot2:
	setmonmove 2, 2, MOVE_SURF
	return

SurfPichu_Slot3:
	setmonmove 3, 2, MOVE_SURF
	return

SurfPichu_Slot4:
	setmonmove 4, 2, MOVE_SURF
	return

SurfPichu_Slot5:
	setmonmove 5, 2, MOVE_SURF
	return

sText_MysteryGiftEgg:
	.string "Thank you for using the MYSTERY\n"
	.string "GIFT System.\p"
	.string "From the POKéMON CENTER we\n"
	.string "have a gift - a POKéMON EGG!\p"
	.string "Please raise it with love and\n"
	.string "kindness.$"

sText_FullParty:
	.string "Oh, your party appears to be full.\p"
	.string "Please come see me after storing\n"
	.string "a POKéMON on a PC.$"

MysteryEventScript_VisitingTrainer::
	setvaddress MysteryEventScript_VisitingTrainer
	special ValidateEReaderTrainer
	vgoto_if_eq VAR_RESULT, 0, MysteryEventScript_VisitingTrainerArrived
	lock
	faceplayer
	vmessage sText_MysteryGiftVisitingTrainer
	waitmessage
	waitbuttonpress
	release
	end

MysteryEventScript_VisitingTrainerArrived:
	lock
	faceplayer
	vmessage sText_MysteryGiftVisitingTrainer_2
	waitmessage
	waitbuttonpress
	release
	end

sText_MysteryGiftVisitingTrainer:
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

sText_MysteryGiftVisitingTrainer_2:
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

MysteryEventScript_BattleCard::
	setvaddress MysteryEventScript_BattleCard
	vgoto_if_set FLAG_MYSTERY_GIFT_DONE, MysteryEventScript_BattleCardInfo
	setorcopyvar VAR_RESULT, 2
	specialvar VAR_0x8008, GetMysteryGiftCardStat
	vgoto_if_ne VAR_0x8008, 3, MysteryEventScript_BattleCardInfo
	lock
	faceplayer
	vmessage sText_MysteryGiftBattleCountCard_2
	waitmessage
	waitbuttonpress
	giveitem ITEM_POTION
	release
	setflag FLAG_MYSTERY_GIFT_DONE
	end

MysteryEventScript_BattleCardInfo:
	lock
	faceplayer
	vmessage sText_MysteryGiftBattleCountCard
	waitmessage
	waitbuttonpress
	release
	end

sText_MysteryGiftBattleCountCard:
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

sText_MysteryGiftBattleCountCard_2:
	.string "Thank you for using the MYSTERY\n"
	.string "GIFT System.\p"
	.string "Congratulations!\p"
	.string "You have won a prize for winning\n"
	.string "three battles!\p"
	.string "We hope you will be inspired to\n"
	.string "battle some more.$"

MysteryEventScript_AuroraTicket::
	setvaddress MysteryEventScript_AuroraTicket
	lock
	faceplayer
	vgoto_if_set FLAG_RECEIVED_AURORA_TICKET, AuroraTicket_Obtained
	vgoto_if_set FLAG_FOUGHT_DEOXYS, AuroraTicket_Obtained
	checkitem ITEM_AURORA_TICKET, 1
	vgoto_if_eq VAR_RESULT, TRUE, AuroraTicket_Obtained
	vmessage sText_AuroraTicket1
	waitmessage
	waitbuttonpress
	checkitemspace ITEM_AURORA_TICKET, 1
	vgoto_if_eq VAR_RESULT, FALSE, AuroraTicket_NoBagSpace
	giveitem ITEM_AURORA_TICKET
	setflag FLAG_ENABLE_SHIP_BIRTH_ISLAND
	setflag FLAG_RECEIVED_AURORA_TICKET
	vmessage sText_AuroraTicket2
	waitmessage
	waitbuttonpress
	release
	end

AuroraTicket_NoBagSpace:
	vmessage sText_AuroraTicketNoPlace
	waitmessage
	waitbuttonpress
	release
	end

AuroraTicket_Obtained:
	vmessage sText_AuroraTicketGot
	waitmessage
	waitbuttonpress
	release
	end

sText_AuroraTicket1:
	.string "Thank you for using the MYSTERY\n"
	.string "GIFT System.\p"
	.string "You must be {PLAYER}.\n"
	.string "There is a ticket here for you.$"

sText_AuroraTicket2:
	.string "It appears to be for use at the\n"
	.string "VERMILION CITY port.\p"
	.string "Why not give it a try and see what\n"
	.string "it is about?$"

sText_AuroraTicketGot:
	.string "Thank you for using the MYSTERY\n"
	.string "GIFT System.$"

sText_AuroraTicketNoPlace:
	.string "Oh, I'm sorry, {PLAYER}. Your BAG's\n"
	.string "KEY ITEMS POCKET is full.\p"
	.string "Please store something on your PC,\n"
	.string "then come back for this.$"

MysteryEventScript_MysticTicket::
	setvaddress MysteryEventScript_MysticTicket
	lock
	faceplayer
	vgoto_if_set FLAG_RECEIVED_MYSTIC_TICKET, MysticTicket_Obtained
	vgoto_if_set FLAG_FOUGHT_LUGIA, MysticTicket_Obtained
	vgoto_if_set FLAG_FOUGHT_HO_OH, MysticTicket_Obtained
	checkitem ITEM_MYSTIC_TICKET, 1
	vgoto_if_eq VAR_RESULT, TRUE, MysticTicket_Obtained
	vmessage sText_MysticTicket2
	waitmessage
	waitbuttonpress
	checkitemspace ITEM_MYSTIC_TICKET, 1
	vgoto_if_eq VAR_RESULT, FALSE, MysticTicket_NoBagSpace
	giveitem ITEM_MYSTIC_TICKET
	setflag FLAG_ENABLE_SHIP_NAVEL_ROCK
	setflag FLAG_RECEIVED_MYSTIC_TICKET
	vmessage sText_MysticTicket1
	waitmessage
	waitbuttonpress
	release
	end

MysticTicket_NoBagSpace:
	vmessage sText_MysticTicketNoPlace
	waitmessage
	waitbuttonpress
	release
	end

MysticTicket_Obtained:
	vmessage sText_MysticTicketGot
	waitmessage
	waitbuttonpress
	release
	end

sText_MysticTicket2:
	.string "Thank you for using the MYSTERY\n"
	.string "GIFT System.\p"
	.string "You must be {PLAYER}.\n"
	.string "There is a ticket here for you.$"

sText_MysticTicket1:
	.string "It appears to be for use at the\n"
	.string "VERMILION CITY port.\p"
	.string "Why not give it a try and see what\n"
	.string "it is about?$"

sText_MysticTicketGot:
	.string "Thank you for using the MYSTERY\n"
	.string "GIFT System.$"

sText_MysticTicketNoPlace:
	.string "Oh, I'm sorry, {PLAYER}. Your BAG's\n"
	.string "KEY ITEMS POCKET is full.\p"
	.string "Please store something on your PC,\n"
	.string "then come back for this.$"

MysteryEventScript_AlteringCave::
	setvaddress MysteryEventScript_AlteringCave
	addvar VAR_ALTERING_CAVE_WILD_SET, 1
	vgoto_if_ne VAR_ALTERING_CAVE_WILD_SET, 10, MysteryEventScript_AlteringCave_
	setvar VAR_ALTERING_CAVE_WILD_SET, 0
MysteryEventScript_AlteringCave_:
	lock
	faceplayer
	vmessage sText_MysteryGiftAlteringCave
	waitmessage
	waitbuttonpress
	release
	end

sText_MysteryGiftAlteringCave:
	.string "Thank you for using the MYSTERY\n"
	.string "GIFT System.\p"
	.string "Recently, there have been rumors\n"
	.string "of rare POKéMON appearances.\p"
	.string "The rumors are about ALTERING\n"
	.string "CAVE on OUTCAST ISLAND.\p"
	.string "Why not visit there and check if\n"
	.string "the rumors are indeed true?$"
