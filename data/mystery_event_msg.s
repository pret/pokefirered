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
    setorcopyvar VAR_RESULT, TRUE
    specialvar VAR_0x8008, sub_80CC730
    setorcopyvar VAR_RESULT, FALSE
    specialvar VAR_0x8009, sub_80CC730
    subvar VAR_0x8008, VAR_0x8009
    getnumberstring 0, VAR_0x8008
    lock
    faceplayer
    vmessage gUnknown_8488E55
    waitmessage
    waitbuttonpress
    release
    end

gUnknown_8488E55::
	.incbin "baserom.gba", 0x488E55, 0xB13
