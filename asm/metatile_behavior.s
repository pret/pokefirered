	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_8059AF0
sub_8059AF0: @ 8059AF0
	movs r0, 0x1
	bx lr
	thumb_func_end sub_8059AF0

	thumb_func_start MetatileBehavior_IsJumpEast
MetatileBehavior_IsJumpEast: @ 8059AF4
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x38
	beq _08059B02
	movs r0, 0
	b _08059B04
_08059B02:
	movs r0, 0x1
_08059B04:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsJumpEast

	thumb_func_start MetatileBehavior_IsJumpWest
MetatileBehavior_IsJumpWest: @ 8059B08
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x39
	beq _08059B16
	movs r0, 0
	b _08059B18
_08059B16:
	movs r0, 0x1
_08059B18:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsJumpWest

	thumb_func_start MetatileBehavior_IsJumpNorth
MetatileBehavior_IsJumpNorth: @ 8059B1C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3A
	beq _08059B2A
	movs r0, 0
	b _08059B2C
_08059B2A:
	movs r0, 0x1
_08059B2C:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsJumpNorth

	thumb_func_start MetatileBehavior_IsJumpSouth
MetatileBehavior_IsJumpSouth: @ 8059B30
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3B
	beq _08059B3E
	movs r0, 0
	b _08059B40
_08059B3E:
	movs r0, 0x1
_08059B40:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsJumpSouth

	thumb_func_start sub_8059B44
sub_8059B44: @ 8059B44
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	beq _08059B52
	cmp r0, 0xD1
	bne _08059B56
_08059B52:
	movs r0, 0x1
	b _08059B58
_08059B56:
	movs r0, 0
_08059B58:
	pop {r1}
	bx r1
	thumb_func_end sub_8059B44

	thumb_func_start sub_8059B5C
sub_8059B5C: @ 8059B5C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x21
	beq _08059B6A
	cmp r0, 0x2B
	bne _08059B6E
_08059B6A:
	movs r0, 0x1
	b _08059B70
_08059B6E:
	movs r0, 0
_08059B70:
	pop {r1}
	bx r1
	thumb_func_end sub_8059B5C

	thumb_func_start sub_8059B74
sub_8059B74: @ 8059B74
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x21
	beq _08059B82
	cmp r0, 0x17
	bne _08059B86
_08059B82:
	movs r0, 0x1
	b _08059B88
_08059B86:
	movs r0, 0
_08059B88:
	pop {r1}
	bx r1
	thumb_func_end sub_8059B74

	thumb_func_start sub_8059B8C
sub_8059B8C: @ 8059B8C
	movs r0, 0
	bx lr
	thumb_func_end sub_8059B8C

	thumb_func_start sub_8059B90
sub_8059B90: @ 8059B90
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x10
	beq _08059BAA
	cmp r0, 0x16
	beq _08059BAA
	cmp r0, 0x1A
	beq _08059BAA
	cmp r0, 0x1B
	beq _08059BAA
	cmp r0, 0x23
	bne _08059BAE
_08059BAA:
	movs r0, 0x1
	b _08059BB0
_08059BAE:
	movs r0, 0
_08059BB0:
	pop {r1}
	bx r1
	thumb_func_end sub_8059B90

	thumb_func_start MetatileBehavior_IsIce
MetatileBehavior_IsIce: @ 8059BB4
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x23
	beq _08059BC2
	movs r0, 0
	b _08059BC4
_08059BC2:
	movs r0, 0x1
_08059BC4:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsIce

	thumb_func_start MetatileBehavior_IsWarpDoor
MetatileBehavior_IsWarpDoor: @ 8059BC8
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x69
	beq _08059BD6
	movs r0, 0
	b _08059BD8
_08059BD6:
	movs r0, 0x1
_08059BD8:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsWarpDoor

	thumb_func_start sub_8059BDC
sub_8059BDC: @ 8059BDC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x69
	beq _08059BEA
	movs r0, 0
	b _08059BEC
_08059BEA:
	movs r0, 0x1
_08059BEC:
	pop {r1}
	bx r1
	thumb_func_end sub_8059BDC

	thumb_func_start sub_8059BF0
sub_8059BF0: @ 8059BF0
	push {lr}
	lsls r0, 24
	movs r1, 0x96
	lsls r1, 24
	adds r0, r1
	lsrs r0, 24
	cmp r0, 0x1
	bls _08059C04
	movs r0, 0
	b _08059C06
_08059C04:
	movs r0, 0x1
_08059C06:
	pop {r1}
	bx r1
	thumb_func_end sub_8059BF0

	thumb_func_start sub_8059C0C
sub_8059C0C: @ 8059C0C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	cmp r0, 0x6C
	bne _08059C1A
	movs r1, 0x1
_08059C1A:
	adds r0, r1, 0
	pop {r1}
	bx r1
	thumb_func_end sub_8059C0C

	thumb_func_start sub_8059C20
sub_8059C20: @ 8059C20
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	cmp r0, 0x6D
	bne _08059C2E
	movs r1, 0x1
_08059C2E:
	adds r0, r1, 0
	pop {r1}
	bx r1
	thumb_func_end sub_8059C20

	thumb_func_start sub_8059C34
sub_8059C34: @ 8059C34
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	cmp r0, 0x6E
	bne _08059C42
	movs r1, 0x1
_08059C42:
	adds r0, r1, 0
	pop {r1}
	bx r1
	thumb_func_end sub_8059C34

	thumb_func_start sub_8059C48
sub_8059C48: @ 8059C48
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	cmp r0, 0x6F
	bne _08059C56
	movs r1, 0x1
_08059C56:
	adds r0, r1, 0
	pop {r1}
	bx r1
	thumb_func_end sub_8059C48

	thumb_func_start sub_8059C5C
sub_8059C5C: @ 8059C5C
	push {lr}
	lsls r0, 24
	movs r1, 0
	movs r2, 0x94
	lsls r2, 24
	adds r0, r2
	lsrs r0, 24
	cmp r0, 0x3
	bhi _08059C70
	movs r1, 0x1
_08059C70:
	adds r0, r1, 0
	pop {r1}
	bx r1
	thumb_func_end sub_8059C5C

	thumb_func_start sub_8059C78
sub_8059C78: @ 8059C78
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x61
	beq _08059C86
	movs r0, 0
	b _08059C88
_08059C86:
	movs r0, 0x1
_08059C88:
	pop {r1}
	bx r1
	thumb_func_end sub_8059C78

	thumb_func_start sub_8059C8C
sub_8059C8C: @ 8059C8C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x60
	beq _08059C9A
	movs r0, 0
	b _08059C9C
_08059C9A:
	movs r0, 0x1
_08059C9C:
	pop {r1}
	bx r1
	thumb_func_end sub_8059C8C

	thumb_func_start sub_8059CA0
sub_8059CA0: @ 8059CA0
	movs r0, 0
	bx lr
	thumb_func_end sub_8059CA0

	thumb_func_start sub_8059CA4
sub_8059CA4: @ 8059CA4
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08059CBC @ =gUnknown_8352F78
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _08059CC0
	movs r0, 0
	b _08059CC2
	.align 2, 0
_08059CBC: .4byte gUnknown_8352F78
_08059CC0:
	movs r0, 0x1
_08059CC2:
	pop {r1}
	bx r1
	thumb_func_end sub_8059CA4

	thumb_func_start sub_8059CC8
sub_8059CC8: @ 8059CC8
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x11
	beq _08059CD6
	movs r0, 0
	b _08059CD8
_08059CD6:
	movs r0, 0x1
_08059CD8:
	pop {r1}
	bx r1
	thumb_func_end sub_8059CC8

	thumb_func_start MetatileBehavior_IsEastArrowWarp
MetatileBehavior_IsEastArrowWarp: @ 8059CDC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x62
	beq _08059CEA
	movs r0, 0
	b _08059CEC
_08059CEA:
	movs r0, 0x1
_08059CEC:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsEastArrowWarp

	thumb_func_start MetatileBehavior_IsWestArrowWarp
MetatileBehavior_IsWestArrowWarp: @ 8059CF0
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x63
	beq _08059CFE
	movs r0, 0
	b _08059D00
_08059CFE:
	movs r0, 0x1
_08059D00:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsWestArrowWarp

	thumb_func_start sub_8059D04
sub_8059D04: @ 8059D04
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x64
	beq _08059D12
	movs r0, 0
	b _08059D14
_08059D12:
	movs r0, 0x1
_08059D14:
	pop {r1}
	bx r1
	thumb_func_end sub_8059D04

	thumb_func_start sub_8059D18
sub_8059D18: @ 8059D18
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x65
	beq _08059D26
	movs r0, 0
	b _08059D28
_08059D26:
	movs r0, 0x1
_08059D28:
	pop {r1}
	bx r1
	thumb_func_end sub_8059D18

	thumb_func_start sub_8059D2C
sub_8059D2C: @ 8059D2C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	movs r5, 0
	adds r0, r4, 0
	bl MetatileBehavior_IsEastArrowWarp
	lsls r0, 24
	cmp r0, 0
	bne _08059D64
	adds r0, r4, 0
	bl MetatileBehavior_IsWestArrowWarp
	lsls r0, 24
	cmp r0, 0
	bne _08059D64
	adds r0, r4, 0
	bl sub_8059D04
	lsls r0, 24
	cmp r0, 0
	bne _08059D64
	adds r0, r4, 0
	bl sub_8059D18
	lsls r0, 24
	cmp r0, 0
	beq _08059D66
_08059D64:
	movs r5, 0x1
_08059D66:
	adds r0, r5, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8059D2C

	thumb_func_start sub_8059D70
sub_8059D70: @ 8059D70
	push {lr}
	lsls r0, 24
	lsrs r1, r0, 24
	movs r2, 0xC0
	lsls r2, 24
	adds r0, r2
	lsrs r0, 24
	cmp r0, 0x8
	bls _08059DA2
	adds r0, r1, 0
	subs r0, 0x50
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	bls _08059DA2
	cmp r1, 0x13
	beq _08059DA2
	cmp r1, 0x23
	beq _08059DA2
	adds r0, r1, 0
	subs r0, 0x54
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	bhi _08059DA6
_08059DA2:
	movs r0, 0x1
	b _08059DA8
_08059DA6:
	movs r0, 0
_08059DA8:
	pop {r1}
	bx r1
	thumb_func_end sub_8059D70

	thumb_func_start sub_8059DAC
sub_8059DAC: @ 8059DAC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x23
	beq _08059DBA
	movs r0, 0
	b _08059DBC
_08059DBA:
	movs r0, 0x1
_08059DBC:
	pop {r1}
	bx r1
	thumb_func_end sub_8059DAC

	thumb_func_start sub_8059DC0
sub_8059DC0: @ 8059DC0
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x48
	beq _08059DCE
	movs r0, 0
	b _08059DD0
_08059DCE:
	movs r0, 0x1
_08059DD0:
	pop {r1}
	bx r1
	thumb_func_end sub_8059DC0

	thumb_func_start MetatileBehavior_IsWalkNorth
MetatileBehavior_IsWalkNorth: @ 8059DD4
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x42
	beq _08059DE2
	movs r0, 0
	b _08059DE4
_08059DE2:
	movs r0, 0x1
_08059DE4:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsWalkNorth

	thumb_func_start MetatileBehavior_IsWalkSouth
MetatileBehavior_IsWalkSouth: @ 8059DE8
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x43
	beq _08059DF6
	movs r0, 0
	b _08059DF8
_08059DF6:
	movs r0, 0x1
_08059DF8:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsWalkSouth

	thumb_func_start MetatileBehavior_IsWalkWest
MetatileBehavior_IsWalkWest: @ 8059DFC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x41
	beq _08059E0A
	movs r0, 0
	b _08059E0C
_08059E0A:
	movs r0, 0x1
_08059E0C:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsWalkWest

	thumb_func_start MetatileBehavior_IsWalkEast
MetatileBehavior_IsWalkEast: @ 8059E10
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _08059E1E
	movs r0, 0
	b _08059E20
_08059E1E:
	movs r0, 0x1
_08059E20:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsWalkEast

	thumb_func_start MetatileBehavior_IsNorthwardCurrent
MetatileBehavior_IsNorthwardCurrent: @ 8059E24
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x52
	beq _08059E32
	movs r0, 0
	b _08059E34
_08059E32:
	movs r0, 0x1
_08059E34:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsNorthwardCurrent

	thumb_func_start MetatileBehavior_IsSouthwardCurrent
MetatileBehavior_IsSouthwardCurrent: @ 8059E38
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x53
	beq _08059E46
	movs r0, 0
	b _08059E48
_08059E46:
	movs r0, 0x1
_08059E48:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsSouthwardCurrent

	thumb_func_start MetatileBehavior_IsWestwardCurrent
MetatileBehavior_IsWestwardCurrent: @ 8059E4C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x51
	beq _08059E5A
	movs r0, 0
	b _08059E5C
_08059E5A:
	movs r0, 0x1
_08059E5C:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsWestwardCurrent

	thumb_func_start MetatileBehavior_IsEastwardCurrent
MetatileBehavior_IsEastwardCurrent: @ 8059E60
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x50
	beq _08059E6E
	movs r0, 0
	b _08059E70
_08059E6E:
	movs r0, 0x1
_08059E70:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsEastwardCurrent

	thumb_func_start MetatileBehavior_IsSlideNorth
MetatileBehavior_IsSlideNorth: @ 8059E74
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x46
	beq _08059E82
	movs r0, 0
	b _08059E84
_08059E82:
	movs r0, 0x1
_08059E84:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsSlideNorth

	thumb_func_start MetatileBehavior_IsSlideSouth
MetatileBehavior_IsSlideSouth: @ 8059E88
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x47
	beq _08059E96
	movs r0, 0
	b _08059E98
_08059E96:
	movs r0, 0x1
_08059E98:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsSlideSouth

	thumb_func_start MetatileBehavior_IsSlideWest
MetatileBehavior_IsSlideWest: @ 8059E9C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x45
	beq _08059EAA
	movs r0, 0
	b _08059EAC
_08059EAA:
	movs r0, 0x1
_08059EAC:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsSlideWest

	thumb_func_start MetatileBehavior_IsSlideEast
MetatileBehavior_IsSlideEast: @ 8059EB0
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x44
	beq _08059EBE
	movs r0, 0
	b _08059EC0
_08059EBE:
	movs r0, 0x1
_08059EC0:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsSlideEast

	thumb_func_start MetatileBehavior_IsCounter
MetatileBehavior_IsCounter: @ 8059EC4
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x80
	beq _08059ED2
	movs r0, 0
	b _08059ED4
_08059ED2:
	movs r0, 0x1
_08059ED4:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsCounter

	thumb_func_start MetatileBehavior_IsPlayerFacingTVScreen
MetatileBehavior_IsPlayerFacingTVScreen: @ 8059ED8
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	cmp r1, 0x2
	bne _08059EEA
	cmp r0, 0x86
	beq _08059EEE
_08059EEA:
	movs r0, 0
	b _08059EF0
_08059EEE:
	movs r0, 0x1
_08059EF0:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsPlayerFacingTVScreen

	thumb_func_start MetatileBehavior_IsPC
MetatileBehavior_IsPC: @ 8059EF4
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x83
	beq _08059F02
	movs r0, 0
	b _08059F04
_08059F02:
	movs r0, 0x1
_08059F04:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsPC

	thumb_func_start sub_8059F08
sub_8059F08: @ 8059F08
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x10
	beq _08059F16
	cmp r0, 0x16
	bne _08059F1A
_08059F16:
	movs r0, 0x1
	b _08059F1C
_08059F1A:
	movs r0, 0
_08059F1C:
	pop {r1}
	bx r1
	thumb_func_end sub_8059F08

	thumb_func_start sub_8059F20
sub_8059F20: @ 8059F20
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x16
	beq _08059F2E
	movs r0, 0
	b _08059F30
_08059F2E:
	movs r0, 0x1
_08059F30:
	pop {r1}
	bx r1
	thumb_func_end sub_8059F20

	thumb_func_start sub_8059F34
sub_8059F34: @ 8059F34
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	beq _08059F42
	cmp r0, 0xD1
	bne _08059F46
_08059F42:
	movs r0, 0x1
	b _08059F48
_08059F46:
	movs r0, 0
_08059F48:
	pop {r1}
	bx r1
	thumb_func_end sub_8059F34

	thumb_func_start sub_8059F4C
sub_8059F4C: @ 8059F4C
	movs r0, 0
	bx lr
	thumb_func_end sub_8059F4C

	thumb_func_start sub_8059F50
sub_8059F50: @ 8059F50
	movs r0, 0
	bx lr
	thumb_func_end sub_8059F50

	thumb_func_start sub_8059F54
sub_8059F54: @ 8059F54
	movs r0, 0
	bx lr
	thumb_func_end sub_8059F54

	thumb_func_start sub_8059F58
sub_8059F58: @ 8059F58
	movs r0, 0
	bx lr
	thumb_func_end sub_8059F58

	thumb_func_start sub_8059F5C
sub_8059F5C: @ 8059F5C
	movs r0, 0
	bx lr
	thumb_func_end sub_8059F5C

	thumb_func_start sub_8059F60
sub_8059F60: @ 8059F60
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08059F6E
	movs r0, 0
	b _08059F70
_08059F6E:
	movs r0, 0x1
_08059F70:
	pop {r1}
	bx r1
	thumb_func_end sub_8059F60

	thumb_func_start sub_8059F74
sub_8059F74: @ 8059F74
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	beq _08059F82
	movs r0, 0
	b _08059F84
_08059F82:
	movs r0, 0x1
_08059F84:
	pop {r1}
	bx r1
	thumb_func_end sub_8059F74

	thumb_func_start MetatileBehavior_IsMB_0B
MetatileBehavior_IsMB_0B: @ 8059F88
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xB
	beq _08059F96
	movs r0, 0
	b _08059F98
_08059F96:
	movs r0, 0x1
_08059F98:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsMB_0B

	thumb_func_start MetatileBehavior_IsMountain
MetatileBehavior_IsMountain: @ 8059F9C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xC
	beq _08059FAA
	movs r0, 0
	b _08059FAC
_08059FAA:
	movs r0, 0x1
_08059FAC:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsMountain

	thumb_func_start sub_8059FB0
sub_8059FB0: @ 8059FB0
	push {lr}
	lsls r0, 24
	movs r1, 0xEF
	lsls r1, 24
	adds r0, r1
	lsrs r0, 24
	cmp r0, 0x1
	bls _08059FC4
	movs r0, 0
	b _08059FC6
_08059FC4:
	movs r0, 0x1
_08059FC6:
	pop {r1}
	bx r1
	thumb_func_end sub_8059FB0

	thumb_func_start sub_8059FCC
sub_8059FCC: @ 8059FCC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x19
	beq _08059FDA
	movs r0, 0
	b _08059FDC
_08059FDA:
	movs r0, 0x1
_08059FDC:
	pop {r1}
	bx r1
	thumb_func_end sub_8059FCC

	thumb_func_start sub_8059FE0
sub_8059FE0: @ 8059FE0
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x17
	beq _08059FEE
	movs r0, 0
	b _08059FF0
_08059FEE:
	movs r0, 0x1
_08059FF0:
	pop {r1}
	bx r1
	thumb_func_end sub_8059FE0

	thumb_func_start MetatileBehavior_IsThinIce
MetatileBehavior_IsThinIce: @ 8059FF4
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x26
	beq _0805A002
	movs r0, 0
	b _0805A004
_0805A002:
	movs r0, 0x1
_0805A004:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsThinIce

	thumb_func_start MetatileBehavior_IsCrackedIce
MetatileBehavior_IsCrackedIce: @ 805A008
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x27
	beq _0805A016
	movs r0, 0
	b _0805A018
_0805A016:
	movs r0, 0x1
_0805A018:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsCrackedIce

	thumb_func_start sub_805A01C
sub_805A01C: @ 805A01C
	push {lr}
	lsls r0, 24
	lsrs r1, r0, 24
	movs r2, 0xEF
	lsls r2, 24
	adds r0, r2
	lsrs r0, 24
	cmp r0, 0x1
	bls _0805A032
	cmp r1, 0x15
	bne _0805A036
_0805A032:
	movs r0, 0x1
	b _0805A038
_0805A036:
	movs r0, 0
_0805A038:
	pop {r1}
	bx r1
	thumb_func_end sub_805A01C

	thumb_func_start sub_805A03C
sub_805A03C: @ 805A03C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1A
	beq _0805A04A
	movs r0, 0
	b _0805A04C
_0805A04A:
	movs r0, 0x1
_0805A04C:
	pop {r1}
	bx r1
	thumb_func_end sub_805A03C

	thumb_func_start MetatileBehavior_IsSurfableAndNotWaterfall
MetatileBehavior_IsSurfableAndNotWaterfall: @ 805A050
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl sub_8059CA4
	lsls r0, 24
	cmp r0, 0
	beq _0805A072
	adds r0, r4, 0
	bl MetatileBehavior_IsWaterfall
	lsls r0, 24
	cmp r0, 0
	bne _0805A072
	movs r0, 0x1
	b _0805A074
_0805A072:
	movs r0, 0
_0805A074:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsSurfableAndNotWaterfall

	thumb_func_start sub_805A07C
sub_805A07C: @ 805A07C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x30
	beq _0805A08E
	cmp r0, 0x34
	beq _0805A08E
	cmp r0, 0x36
	bne _0805A092
_0805A08E:
	movs r0, 0x1
	b _0805A094
_0805A092:
	movs r0, 0
_0805A094:
	pop {r1}
	bx r1
	thumb_func_end sub_805A07C

	thumb_func_start sub_805A098
sub_805A098: @ 805A098
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x31
	beq _0805A0AA
	cmp r0, 0x35
	beq _0805A0AA
	cmp r0, 0x37
	bne _0805A0AE
_0805A0AA:
	movs r0, 0x1
	b _0805A0B0
_0805A0AE:
	movs r0, 0
_0805A0B0:
	pop {r1}
	bx r1
	thumb_func_end sub_805A098

	thumb_func_start sub_805A0B4
sub_805A0B4: @ 805A0B4
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x32
	beq _0805A0C6
	cmp r0, 0x34
	beq _0805A0C6
	cmp r0, 0x35
	bne _0805A0CA
_0805A0C6:
	movs r0, 0x1
	b _0805A0CC
_0805A0CA:
	movs r0, 0
_0805A0CC:
	pop {r1}
	bx r1
	thumb_func_end sub_805A0B4

	thumb_func_start sub_805A0D0
sub_805A0D0: @ 805A0D0
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x33
	beq _0805A0E2
	cmp r0, 0x36
	beq _0805A0E2
	cmp r0, 0x37
	bne _0805A0E6
_0805A0E2:
	movs r0, 0x1
	b _0805A0E8
_0805A0E6:
	movs r0, 0
_0805A0E8:
	pop {r1}
	bx r1
	thumb_func_end sub_805A0D0

	thumb_func_start sub_805A0EC
sub_805A0EC: @ 805A0EC
	movs r0, 0
	bx lr
	thumb_func_end sub_805A0EC

	thumb_func_start MetatileBehavior_IsHotSprings
MetatileBehavior_IsHotSprings: @ 805A0F0
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x28
	beq _0805A0FE
	movs r0, 0
	b _0805A100
_0805A0FE:
	movs r0, 0x1
_0805A100:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsHotSprings

	thumb_func_start MetatileBehavior_IsWaterfall
MetatileBehavior_IsWaterfall: @ 805A104
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x13
	beq _0805A112
	movs r0, 0
	b _0805A114
_0805A112:
	movs r0, 0x1
_0805A114:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsWaterfall

	thumb_func_start sub_805A118
sub_805A118: @ 805A118
	movs r0, 0
	bx lr
	thumb_func_end sub_805A118

	thumb_func_start sub_805A11C
sub_805A11C: @ 805A11C
	movs r0, 0
	bx lr
	thumb_func_end sub_805A11C

	thumb_func_start sub_805A120
sub_805A120: @ 805A120
	movs r0, 0
	bx lr
	thumb_func_end sub_805A120

	thumb_func_start sub_805A124
sub_805A124: @ 805A124
	movs r0, 0
	bx lr
	thumb_func_end sub_805A124

	thumb_func_start sub_805A128
sub_805A128: @ 805A128
	movs r0, 0
	bx lr
	thumb_func_end sub_805A128

	thumb_func_start sub_805A12C
sub_805A12C: @ 805A12C
	movs r0, 0
	bx lr
	thumb_func_end sub_805A12C

	thumb_func_start sub_805A130
sub_805A130: @ 805A130
	movs r0, 0
	bx lr
	thumb_func_end sub_805A130

	thumb_func_start sub_805A134
sub_805A134: @ 805A134
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x85
	beq _0805A142
	movs r0, 0
	b _0805A144
_0805A142:
	movs r0, 0x1
_0805A144:
	pop {r1}
	bx r1
	thumb_func_end sub_805A134

	thumb_func_start sub_805A148
sub_805A148: @ 805A148
	movs r0, 0
	bx lr
	thumb_func_end sub_805A148

	thumb_func_start sub_805A14C
sub_805A14C: @ 805A14C
	movs r0, 0
	bx lr
	thumb_func_end sub_805A14C

	thumb_func_start sub_805A150
sub_805A150: @ 805A150
	movs r0, 0
	bx lr
	thumb_func_end sub_805A150

	thumb_func_start sub_805A154
sub_805A154: @ 805A154
	movs r0, 0
	bx lr
	thumb_func_end sub_805A154

	thumb_func_start sub_805A158
sub_805A158: @ 805A158
	movs r0, 0
	bx lr
	thumb_func_end sub_805A158

	thumb_func_start MetatileBehavior_IsLavaridge1FWarp
MetatileBehavior_IsLavaridge1FWarp: @ 805A15C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x68
	beq _0805A16A
	movs r0, 0
	b _0805A16C
_0805A16A:
	movs r0, 0x1
_0805A16C:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsLavaridge1FWarp

	thumb_func_start MetatileBehavior_IsAquaHideoutWarp
MetatileBehavior_IsAquaHideoutWarp: @ 805A170
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x67
	beq _0805A17E
	movs r0, 0
	b _0805A180
_0805A17E:
	movs r0, 0x1
_0805A180:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsAquaHideoutWarp

	thumb_func_start sub_805A184
sub_805A184: @ 805A184
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x71
	beq _0805A192
	movs r0, 0
	b _0805A194
_0805A192:
	movs r0, 0x1
_0805A194:
	pop {r1}
	bx r1
	thumb_func_end sub_805A184

	thumb_func_start sub_805A198
sub_805A198: @ 805A198
	push {lr}
	lsls r0, 24
	lsrs r1, r0, 24
	movs r2, 0xF0
	lsls r2, 24
	adds r0, r2
	lsrs r0, 24
	cmp r0, 0x2
	bls _0805A1BA
	cmp r1, 0x15
	beq _0805A1BA
	adds r0, r1, 0
	subs r0, 0x50
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	bhi _0805A1BE
_0805A1BA:
	movs r0, 0x1
	b _0805A1C0
_0805A1BE:
	movs r0, 0
_0805A1C0:
	pop {r1}
	bx r1
	thumb_func_end sub_805A198

	thumb_func_start sub_805A1C4
sub_805A1C4: @ 805A1C4
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x66
	beq _0805A1D2
	movs r0, 0
	b _0805A1D4
_0805A1D2:
	movs r0, 0x1
_0805A1D4:
	pop {r1}
	bx r1
	thumb_func_end sub_805A1C4

	thumb_func_start sub_805A1D8
sub_805A1D8: @ 805A1D8
	movs r0, 0
	bx lr
	thumb_func_end sub_805A1D8

	thumb_func_start sub_805A1DC
sub_805A1DC: @ 805A1DC
	push {lr}
	lsls r0, 24
	movs r1, 0xC0
	lsls r1, 22
	adds r0, r1
	lsrs r0, 24
	cmp r0, 0x1
	bls _0805A1F0
	movs r0, 0
	b _0805A1F2
_0805A1F0:
	movs r0, 0x1
_0805A1F2:
	pop {r1}
	bx r1
	thumb_func_end sub_805A1DC

	thumb_func_start sub_805A1F8
sub_805A1F8: @ 805A1F8
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	cmp r0, 0xD1
	bne _0805A206
	movs r1, 0x1
_0805A206:
	adds r0, r1, 0
	pop {r1}
	bx r1
	thumb_func_end sub_805A1F8

	thumb_func_start sub_805A20C
sub_805A20C: @ 805A20C
	movs r0, 0
	bx lr
	thumb_func_end sub_805A20C

	thumb_func_start sub_805A210
sub_805A210: @ 805A210
	movs r0, 0
	bx lr
	thumb_func_end sub_805A210

	thumb_func_start sub_805A214
sub_805A214: @ 805A214
	movs r0, 0
	bx lr
	thumb_func_end sub_805A214

	thumb_func_start sub_805A218
sub_805A218: @ 805A218
	movs r0, 0
	bx lr
	thumb_func_end sub_805A218

	thumb_func_start sub_805A21C
sub_805A21C: @ 805A21C
	movs r0, 0
	bx lr
	thumb_func_end sub_805A21C

	thumb_func_start sub_805A220
sub_805A220: @ 805A220
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x22
	beq _0805A22E
	movs r0, 0
	b _0805A230
_0805A22E:
	movs r0, 0x1
_0805A230:
	pop {r1}
	bx r1
	thumb_func_end sub_805A220

	thumb_func_start sub_805A234
sub_805A234: @ 805A234
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xA
	beq _0805A242
	movs r0, 0
	b _0805A244
_0805A242:
	movs r0, 0x1
_0805A244:
	pop {r1}
	bx r1
	thumb_func_end sub_805A234

	thumb_func_start sub_805A248
sub_805A248: @ 805A248
	movs r0, 0
	bx lr
	thumb_func_end sub_805A248

	thumb_func_start sub_805A24C
sub_805A24C: @ 805A24C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x81
	beq _0805A25A
	movs r0, 0
	b _0805A25C
_0805A25A:
	movs r0, 0x1
_0805A25C:
	pop {r1}
	bx r1
	thumb_func_end sub_805A24C

	thumb_func_start sub_805A260
sub_805A260: @ 805A260
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x82
	beq _0805A26E
	movs r0, 0
	b _0805A270
_0805A26E:
	movs r0, 0x1
_0805A270:
	pop {r1}
	bx r1
	thumb_func_end sub_805A260

	thumb_func_start sub_805A274
sub_805A274: @ 805A274
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	cmp r1, 0x2
	bne _0805A286
	cmp r0, 0x87
	beq _0805A28A
_0805A286:
	movs r0, 0
	b _0805A28C
_0805A28A:
	movs r0, 0x1
_0805A28C:
	pop {r1}
	bx r1
	thumb_func_end sub_805A274

	thumb_func_start sub_805A290
sub_805A290: @ 805A290
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	cmp r1, 0x2
	bne _0805A2A2
	cmp r0, 0x88
	beq _0805A2A6
_0805A2A2:
	movs r0, 0
	b _0805A2A8
_0805A2A6:
	movs r0, 0x1
_0805A2A8:
	pop {r1}
	bx r1
	thumb_func_end sub_805A290

	thumb_func_start sub_805A2AC
sub_805A2AC: @ 805A2AC
	movs r0, 0
	bx lr
	thumb_func_end sub_805A2AC

	thumb_func_start sub_805A2B0
sub_805A2B0: @ 805A2B0
	movs r0, 0
	bx lr
	thumb_func_end sub_805A2B0

	thumb_func_start sub_805A2B4
sub_805A2B4: @ 805A2B4
	movs r0, 0
	bx lr
	thumb_func_end sub_805A2B4

	thumb_func_start sub_805A2B8
sub_805A2B8: @ 805A2B8
	movs r0, 0
	bx lr
	thumb_func_end sub_805A2B8

	thumb_func_start sub_805A2BC
sub_805A2BC: @ 805A2BC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0805A2D4 @ =gUnknown_8353068
	adds r0, r2
	ldrb r0, [r0]
	ands r0, r1
	cmp r0, 0
	bne _0805A2D8
	movs r0, 0
	b _0805A2DA
	.align 2, 0
_0805A2D4: .4byte gUnknown_8353068
_0805A2D8:
	movs r0, 0x1
_0805A2DA:
	pop {r1}
	bx r1
	thumb_func_end sub_805A2BC

	thumb_func_start sub_805A2E0
sub_805A2E0: @ 805A2E0
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x54
	beq _0805A2EE
	movs r0, 0
	b _0805A2F0
_0805A2EE:
	movs r0, 0x1
_0805A2F0:
	pop {r1}
	bx r1
	thumb_func_end sub_805A2E0

	thumb_func_start sub_805A2F4
sub_805A2F4: @ 805A2F4
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x55
	beq _0805A302
	movs r0, 0
	b _0805A304
_0805A302:
	movs r0, 0x1
_0805A304:
	pop {r1}
	bx r1
	thumb_func_end sub_805A2F4

	thumb_func_start sub_805A308
sub_805A308: @ 805A308
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x56
	beq _0805A316
	movs r0, 0
	b _0805A318
_0805A316:
	movs r0, 0x1
_0805A318:
	pop {r1}
	bx r1
	thumb_func_end sub_805A308

	thumb_func_start sub_805A31C
sub_805A31C: @ 805A31C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x57
	beq _0805A32A
	movs r0, 0
	b _0805A32C
_0805A32A:
	movs r0, 0x1
_0805A32C:
	pop {r1}
	bx r1
	thumb_func_end sub_805A31C

	thumb_func_start sub_805A330
sub_805A330: @ 805A330
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x58
	beq _0805A33E
	movs r0, 0
	b _0805A340
_0805A33E:
	movs r0, 0x1
_0805A340:
	pop {r1}
	bx r1
	thumb_func_end sub_805A330

	thumb_func_start sub_805A344
sub_805A344: @ 805A344
	push {lr}
	lsls r0, 24
	movs r1, 0
	movs r2, 0xAC
	lsls r2, 24
	adds r0, r2
	lsrs r0, 24
	cmp r0, 0x3
	bhi _0805A358
	movs r1, 0x1
_0805A358:
	adds r0, r1, 0
	pop {r1}
	bx r1
	thumb_func_end sub_805A344

	thumb_func_start sub_805A360
sub_805A360: @ 805A360
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x84
	beq _0805A36E
	movs r0, 0
	b _0805A370
_0805A36E:
	movs r0, 0x1
_0805A370:
	pop {r1}
	bx r1
	thumb_func_end sub_805A360

	thumb_func_start sub_805A374
sub_805A374: @ 805A374
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x89
	beq _0805A382
	movs r0, 0
	b _0805A384
_0805A382:
	movs r0, 0x1
_0805A384:
	pop {r1}
	bx r1
	thumb_func_end sub_805A374

	thumb_func_start sub_805A388
sub_805A388: @ 805A388
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x8A
	beq _0805A396
	movs r0, 0
	b _0805A398
_0805A396:
	movs r0, 0x1
_0805A398:
	pop {r1}
	bx r1
	thumb_func_end sub_805A388

	thumb_func_start sub_805A39C
sub_805A39C: @ 805A39C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x8B
	beq _0805A3AA
	movs r0, 0
	b _0805A3AC
_0805A3AA:
	movs r0, 0x1
_0805A3AC:
	pop {r1}
	bx r1
	thumb_func_end sub_805A39C

	thumb_func_start sub_805A3B0
sub_805A3B0: @ 805A3B0
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x8C
	beq _0805A3BE
	movs r0, 0
	b _0805A3C0
_0805A3BE:
	movs r0, 0x1
_0805A3C0:
	pop {r1}
	bx r1
	thumb_func_end sub_805A3B0

	thumb_func_start sub_805A3C4
sub_805A3C4: @ 805A3C4
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x20
	beq _0805A3D2
	movs r0, 0
	b _0805A3D4
_0805A3D2:
	movs r0, 0x1
_0805A3D4:
	pop {r1}
	bx r1
	thumb_func_end sub_805A3C4

	thumb_func_start sub_805A3D8
sub_805A3D8: @ 805A3D8
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	cmp r1, 0x2
	bne _0805A3EA
	cmp r0, 0x8D
	beq _0805A3EE
_0805A3EA:
	movs r0, 0
	b _0805A3F0
_0805A3EE:
	movs r0, 0x1
_0805A3F0:
	pop {r1}
	bx r1
	thumb_func_end sub_805A3D8

	thumb_func_start sub_805A3F4
sub_805A3F4: @ 805A3F4
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	cmp r1, 0x2
	bne _0805A406
	cmp r0, 0x8E
	beq _0805A40A
_0805A406:
	movs r0, 0
	b _0805A40C
_0805A40A:
	movs r0, 0x1
_0805A40C:
	pop {r1}
	bx r1
	thumb_func_end sub_805A3F4

	thumb_func_start sub_805A410
sub_805A410: @ 805A410
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x8F
	beq _0805A41E
	movs r0, 0
	b _0805A420
_0805A41E:
	movs r0, 0x1
_0805A420:
	pop {r1}
	bx r1
	thumb_func_end sub_805A410

	thumb_func_start sub_805A424
sub_805A424: @ 805A424
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x91
	beq _0805A432
	movs r0, 0
	b _0805A434
_0805A432:
	movs r0, 0x1
_0805A434:
	pop {r1}
	bx r1
	thumb_func_end sub_805A424

	thumb_func_start sub_805A438
sub_805A438: @ 805A438
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x92
	beq _0805A446
	movs r0, 0
	b _0805A448
_0805A446:
	movs r0, 0x1
_0805A448:
	pop {r1}
	bx r1
	thumb_func_end sub_805A438

	thumb_func_start sub_805A44C
sub_805A44C: @ 805A44C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x90
	beq _0805A45A
	movs r0, 0
	b _0805A45C
_0805A45A:
	movs r0, 0x1
_0805A45C:
	pop {r1}
	bx r1
	thumb_func_end sub_805A44C

	thumb_func_start sub_805A460
sub_805A460: @ 805A460
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	cmp r0, 0x2A
	bne _0805A46E
	movs r1, 0x1
_0805A46E:
	adds r0, r1, 0
	pop {r1}
	bx r1
	thumb_func_end sub_805A460

	thumb_func_start sub_805A474
sub_805A474: @ 805A474
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x93
	beq _0805A482
	movs r0, 0
	b _0805A484
_0805A482:
	movs r0, 0x1
_0805A484:
	pop {r1}
	bx r1
	thumb_func_end sub_805A474

	thumb_func_start sub_805A488
sub_805A488: @ 805A488
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x94
	beq _0805A496
	movs r0, 0
	b _0805A498
_0805A496:
	movs r0, 0x1
_0805A498:
	pop {r1}
	bx r1
	thumb_func_end sub_805A488

	thumb_func_start sub_805A49C
sub_805A49C: @ 805A49C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x95
	beq _0805A4AA
	movs r0, 0
	b _0805A4AC
_0805A4AA:
	movs r0, 0x1
_0805A4AC:
	pop {r1}
	bx r1
	thumb_func_end sub_805A49C

	thumb_func_start sub_805A4B0
sub_805A4B0: @ 805A4B0
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x96
	beq _0805A4BE
	movs r0, 0
	b _0805A4C0
_0805A4BE:
	movs r0, 0x1
_0805A4C0:
	pop {r1}
	bx r1
	thumb_func_end sub_805A4B0

	thumb_func_start sub_805A4C4
sub_805A4C4: @ 805A4C4
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x97
	beq _0805A4D2
	movs r0, 0
	b _0805A4D4
_0805A4D2:
	movs r0, 0x1
_0805A4D4:
	pop {r1}
	bx r1
	thumb_func_end sub_805A4C4

	thumb_func_start sub_805A4D8
sub_805A4D8: @ 805A4D8
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x98
	beq _0805A4E6
	movs r0, 0
	b _0805A4E8
_0805A4E6:
	movs r0, 0x1
_0805A4E8:
	pop {r1}
	bx r1
	thumb_func_end sub_805A4D8

	thumb_func_start sub_805A4EC
sub_805A4EC: @ 805A4EC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x99
	beq _0805A4FA
	movs r0, 0
	b _0805A4FC
_0805A4FA:
	movs r0, 0x1
_0805A4FC:
	pop {r1}
	bx r1
	thumb_func_end sub_805A4EC

	thumb_func_start sub_805A500
sub_805A500: @ 805A500
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x9A
	beq _0805A50E
	movs r0, 0
	b _0805A510
_0805A50E:
	movs r0, 0x1
_0805A510:
	pop {r1}
	bx r1
	thumb_func_end sub_805A500

	thumb_func_start sub_805A514
sub_805A514: @ 805A514
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x9B
	beq _0805A522
	movs r0, 0
	b _0805A524
_0805A522:
	movs r0, 0x1
_0805A524:
	pop {r1}
	bx r1
	thumb_func_end sub_805A514

	thumb_func_start sub_805A528
sub_805A528: @ 805A528
	movs r0, 0
	bx lr
	thumb_func_end sub_805A528

	thumb_func_start sub_805A52C
sub_805A52C: @ 805A52C
	movs r0, 0
	bx lr
	thumb_func_end sub_805A52C

	thumb_func_start sub_805A530
sub_805A530: @ 805A530
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x9E
	beq _0805A53E
	movs r0, 0
	b _0805A540
_0805A53E:
	movs r0, 0x1
_0805A540:
	pop {r1}
	bx r1
	thumb_func_end sub_805A530

	thumb_func_start sub_805A544
sub_805A544: @ 805A544
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x9F
	beq _0805A552
	movs r0, 0
	b _0805A554
_0805A552:
	movs r0, 0x1
_0805A554:
	pop {r1}
	bx r1
	thumb_func_end sub_805A544

	thumb_func_start sub_805A558
sub_805A558: @ 805A558
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xA0
	beq _0805A566
	movs r0, 0
	b _0805A568
_0805A566:
	movs r0, 0x1
_0805A568:
	pop {r1}
	bx r1
	thumb_func_end sub_805A558

	thumb_func_start sub_805A56C
sub_805A56C: @ 805A56C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xA1
	beq _0805A57A
	movs r0, 0
	b _0805A57C
_0805A57A:
	movs r0, 0x1
_0805A57C:
	pop {r1}
	bx r1
	thumb_func_end sub_805A56C

	thumb_func_start sub_805A580
sub_805A580: @ 805A580
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xA2
	beq _0805A58E
	movs r0, 0
	b _0805A590
_0805A58E:
	movs r0, 0x1
_0805A590:
	pop {r1}
	bx r1
	thumb_func_end sub_805A580

	thumb_func_start sub_805A594
sub_805A594: @ 805A594
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xA3
	beq _0805A5A2
	movs r0, 0
	b _0805A5A4
_0805A5A2:
	movs r0, 0x1
_0805A5A4:
	pop {r1}
	bx r1
	thumb_func_end sub_805A594

	.align 2, 0 @ Don't pad with nop.
