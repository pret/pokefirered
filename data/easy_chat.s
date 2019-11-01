#include "constants/maps.h"
#include "constants/species.h"
#include "constants/moves.h"
	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata
	.align 2
	.incbin "baserom.gba", 0x3E7D24, 0x70

	.include "data/easy_chat_groups.inc"

gUnknown_83ECF84:: @ 83ECF84
	.incbin "baserom.gba", 0x3ECF84, 0xF3C

gUnknown_83EDEC0:: @ 83EDEC0
	.incbin "baserom.gba", 0x3EDEC0, 0xD8

gEasyChatGroupNames:: @ 83EDF98
	.4byte gEasyChatGroupName_Pokemon2
	.4byte gEasyChatGroupName_Trainer
	.4byte gEasyChatGroupName_Status
	.4byte gEasyChatGroupName_Battle
	.4byte gEasyChatGroupName_Greetings
	.4byte gEasyChatGroupName_People
	.4byte gEasyChatGroupName_Voices
	.4byte gEasyChatGroupName_Speech
	.4byte gEasyChatGroupName_Endings
	.4byte gEasyChatGroupName_Feelings
	.4byte gEasyChatGroupName_Conditions
	.4byte gEasyChatGroupName_Actions
	.4byte gEasyChatGroupName_Lifestyle
	.4byte gEasyChatGroupName_Hobbies
	.4byte gEasyChatGroupName_Time
	.4byte gEasyChatGroupName_Misc
	.4byte gEasyChatGroupName_Adjectives
	.4byte gEasyChatGroupName_Events
	.4byte gEasyChatGroupName_Move1
	.4byte gEasyChatGroupName_Move2
	.4byte gEasyChatGroupName_TrendySaying
	.4byte gEasyChatGroupName_Pokemon

gUnknown_83EDFF0:: @ 83EDFF0
	.incbin "baserom.gba", 0x3EDFF0, 0x8

gUnknown_83EDFF8:: @ 83EDFF8
	.incbin "baserom.gba", 0x3EDFF8, 0xC

gUnknown_83EE004:: @ 83EE004
	.incbin "baserom.gba", 0x3EE004, 0x4
