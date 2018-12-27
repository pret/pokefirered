	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_8088E20
sub_8088E20: @ 8088E20
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08088E34 @ =gUnknown_844E850
	adds r0, r1
	bx lr
	.align 2, 0
_08088E34: .4byte gUnknown_844E850
	thumb_func_end sub_8088E20

	thumb_func_start sub_8088E38
sub_8088E38: @ 8088E38
	push {lr}
	lsls r0, 16
	lsrs r2, r0, 16
	lsls r1, 24
	lsrs r1, 24
	cmp r1, 0
	beq _08088E4E
	cmp r1, 0x1
	beq _08088E60
	movs r0, 0x1
	b _08088E6C
_08088E4E:
	ldr r0, _08088E5C @ =gUnknown_844E850
	lsls r1, r2, 3
	adds r1, r2
	lsls r1, 2
	adds r1, r0
	ldrh r0, [r1, 0xC]
	b _08088E6C
	.align 2, 0
_08088E5C: .4byte gUnknown_844E850
_08088E60:
	ldr r0, _08088E70 @ =gUnknown_844E850
	lsls r1, r2, 3
	adds r1, r2
	lsls r1, 2
	adds r1, r0
	ldrh r0, [r1, 0xE]
_08088E6C:
	pop {r1}
	bx r1
	.align 2, 0
_08088E70: .4byte gUnknown_844E850
	thumb_func_end sub_8088E38

	thumb_func_start GetSetPokedexFlag
GetSetPokedexFlag: @ 8088E74
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	lsls r1, 24
	lsrs r1, 24
	movs r2, 0
	bl sub_8104AB0
	lsls r0, 24
	asrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end GetSetPokedexFlag

	thumb_func_start pokedex_count
pokedex_count: @ 8088E8C
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	movs r5, 0
	movs r0, 0
	ldr r7, _08088EA4 @ =0x00000181
_08088E98:
	cmp r6, 0
	beq _08088EA8
	cmp r6, 0x1
	beq _08088EB2
	adds r4, r0, 0x1
	b _08088ECA
	.align 2, 0
_08088EA4: .4byte 0x00000181
_08088EA8:
	adds r4, r0, 0x1
	lsls r0, r4, 16
	lsrs r0, 16
	movs r1, 0
	b _08088EBA
_08088EB2:
	adds r4, r0, 0x1
	lsls r0, r4, 16
	lsrs r0, 16
	movs r1, 0x1
_08088EBA:
	bl GetSetPokedexFlag
	lsls r0, 24
	cmp r0, 0
	beq _08088ECA
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
_08088ECA:
	lsls r0, r4, 16
	lsrs r0, 16
	cmp r0, r7
	bls _08088E98
	adds r0, r5, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end pokedex_count

	thumb_func_start sub_8088EDC
sub_8088EDC: @ 8088EDC
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	movs r5, 0
	movs r0, 0
_08088EE6:
	cmp r6, 0
	beq _08088EF2
	cmp r6, 0x1
	beq _08088EFC
	adds r4, r0, 0x1
	b _08088F14
_08088EF2:
	adds r4, r0, 0x1
	lsls r0, r4, 16
	lsrs r0, 16
	movs r1, 0
	b _08088F04
_08088EFC:
	adds r4, r0, 0x1
	lsls r0, r4, 16
	lsrs r0, 16
	movs r1, 0x1
_08088F04:
	bl GetSetPokedexFlag
	lsls r0, 24
	cmp r0, 0
	beq _08088F14
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
_08088F14:
	lsls r0, r4, 16
	lsrs r0, 16
	cmp r0, 0x96
	bls _08088EE6
	adds r0, r5, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_8088EDC

	thumb_func_start sub_8088F24
sub_8088F24: @ 8088F24
	push {r4,lr}
	movs r0, 0
_08088F28:
	adds r0, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	adds r0, r4, 0
	bl HoennToNationalOrder
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x1
	bl GetSetPokedexFlag
	lsls r0, 24
	cmp r0, 0
	bne _08088F48
	movs r0, 0
	b _08088F50
_08088F48:
	adds r0, r4, 0
	cmp r0, 0xC7
	bls _08088F28
	movs r0, 0x1
_08088F50:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8088F24

	thumb_func_start sub_8088F58
sub_8088F58: @ 8088F58
	push {r4,lr}
	movs r0, 0
_08088F5C:
	adds r0, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	adds r0, r4, 0
	movs r1, 0x1
	bl GetSetPokedexFlag
	lsls r0, 24
	cmp r0, 0
	bne _08088F74
	movs r0, 0
	b _08088F7C
_08088F74:
	adds r0, r4, 0
	cmp r0, 0x95
	bls _08088F5C
	movs r0, 0x1
_08088F7C:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8088F58

	thumb_func_start sub_8088F84
sub_8088F84: @ 8088F84
	push {r4,r5,lr}
	movs r0, 0
_08088F88:
	adds r0, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	adds r0, r4, 0
	movs r1, 0x1
	bl GetSetPokedexFlag
	lsls r0, 24
	cmp r0, 0
	beq _08088FD6
	adds r0, r4, 0
	cmp r0, 0x95
	bls _08088F88
	movs r0, 0x97
_08088FA4:
	adds r0, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	adds r0, r4, 0
	movs r1, 0x1
	bl GetSetPokedexFlag
	lsls r0, 24
	cmp r0, 0
	beq _08088FD6
	adds r0, r4, 0
	cmp r0, 0xF7
	bls _08088FA4
	movs r0, 0xFB
	ldr r5, _08088FDC @ =0x0000017f
_08088FC2:
	adds r0, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	adds r0, r4, 0
	movs r1, 0x1
	bl GetSetPokedexFlag
	lsls r0, 24
	cmp r0, 0
	bne _08088FE0
_08088FD6:
	movs r0, 0
	b _08088FE8
	.align 2, 0
_08088FDC: .4byte 0x0000017f
_08088FE0:
	adds r0, r4, 0
	cmp r0, r5
	bls _08088FC2
	movs r0, 0x1
_08088FE8:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8088F84

	.align 2, 0 @ Don't pad with nop.
