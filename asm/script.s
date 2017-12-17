	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_80697AC
sub_80697AC: @ 80697AC
	push {lr}
	adds r3, r0, 0
	movs r0, 0
	strb r0, [r3, 0x1]
	str r0, [r3, 0x8]
	strb r0, [r3]
	str r0, [r3, 0x4]
	str r1, [r3, 0x5C]
	str r2, [r3, 0x60]
	movs r2, 0
	movs r1, 0x3
	adds r0, r3, 0
	adds r0, 0x70
_080697C6:
	str r2, [r0]
	subs r0, 0x4
	subs r1, 0x1
	cmp r1, 0
	bge _080697C6
	adds r1, r3, 0
	adds r1, 0xC
	movs r2, 0
	adds r0, r3, 0
	adds r0, 0x58
_080697DA:
	str r2, [r0]
	subs r0, 0x4
	cmp r0, r1
	bge _080697DA
	pop {r0}
	bx r0
	thumb_func_end sub_80697AC

	thumb_func_start sub_80697E8
sub_80697E8: @ 80697E8
	str r1, [r0, 0x8]
	movs r1, 0x1
	strb r1, [r0, 0x1]
	movs r0, 0x1
	bx lr
	thumb_func_end sub_80697E8

	thumb_func_start sub_80697F4
sub_80697F4: @ 80697F4
	movs r2, 0x2
	strb r2, [r0, 0x1]
	str r1, [r0, 0x4]
	bx lr
	thumb_func_end sub_80697F4

	thumb_func_start sub_80697FC
sub_80697FC: @ 80697FC
	movs r1, 0
	strb r1, [r0, 0x1]
	str r1, [r0, 0x8]
	bx lr
	thumb_func_end sub_80697FC

	thumb_func_start sub_8069804
sub_8069804: @ 8069804
	push {r4,lr}
	adds r4, r0, 0
	ldrb r0, [r4, 0x1]
	cmp r0, 0x1
	beq _08069842
	cmp r0, 0x1
	bgt _08069818
	cmp r0, 0
	beq _08069834
	b _0806987A
_08069818:
	cmp r0, 0x2
	bne _0806987A
	ldr r0, [r4, 0x4]
	cmp r0, 0
	beq _0806983E
	bl _call_via_r0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806987A
	strb r0, [r4, 0x1]
	b _0806987A
_08069832:
	strb r2, [r4, 0x1]
_08069834:
	movs r0, 0
	b _0806987C
_08069838:
	movs r0, 0
	strb r0, [r4, 0x1]
	b _0806987C
_0806983E:
	movs r0, 0x1
	strb r0, [r4, 0x1]
_08069842:
	ldr r2, [r4, 0x8]
	cmp r2, 0
	beq _08069832
	ldr r0, _08069854 @ =gUnknown_83A7244
	ldr r0, [r0]
	cmp r2, r0
	bne _08069858
_08069850:
	swi 0x2
	b _08069850
	.align 2, 0
_08069854: .4byte gUnknown_83A7244
_08069858:
	ldrb r1, [r2]
	adds r0, r2, 0x1
	str r0, [r4, 0x8]
	lsls r1, 2
	ldr r0, [r4, 0x5C]
	adds r1, r0, r1
	ldr r0, [r4, 0x60]
	cmp r1, r0
	bcs _08069838
	ldr r1, [r1]
	adds r0, r4, 0
	bl _call_via_r1
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08069842
_0806987A:
	movs r0, 0x1
_0806987C:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8069804

	thumb_func_start sub_8069884
sub_8069884: @ 8069884
	push {lr}
	adds r2, r0, 0
	adds r3, r1, 0
	ldrb r1, [r2]
	adds r0, r1, 0x1
	cmp r0, 0x13
	bgt _080698A6
	lsls r0, r1, 2
	adds r1, r2, 0
	adds r1, 0xC
	adds r1, r0
	str r3, [r1]
	ldrb r0, [r2]
	adds r0, 0x1
	strb r0, [r2]
	movs r0, 0
	b _080698A8
_080698A6:
	movs r0, 0x1
_080698A8:
	pop {r1}
	bx r1
	thumb_func_end sub_8069884

	thumb_func_start sub_80698AC
sub_80698AC: @ 80698AC
	push {lr}
	adds r2, r0, 0
	ldrb r0, [r2]
	cmp r0, 0
	beq _080698C8
	subs r0, 0x1
	strb r0, [r2]
	ldrb r1, [r2]
	lsls r1, 2
	adds r0, r2, 0
	adds r0, 0xC
	adds r0, r1
	ldr r0, [r0]
	b _080698CA
_080698C8:
	movs r0, 0
_080698CA:
	pop {r1}
	bx r1
	thumb_func_end sub_80698AC

	thumb_func_start sub_80698D0
sub_80698D0: @ 80698D0
	str r1, [r0, 0x8]
	bx lr
	thumb_func_end sub_80698D0

	thumb_func_start sub_80698D4
sub_80698D4: @ 80698D4
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, [r4, 0x8]
	bl sub_8069884
	str r5, [r4, 0x8]
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80698D4

	thumb_func_start sub_80698E8
sub_80698E8: @ 80698E8
	push {r4,lr}
	adds r4, r0, 0
	bl sub_80698AC
	str r0, [r4, 0x8]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80698E8

	thumb_func_start sub_80698F8
sub_80698F8: @ 80698F8
	adds r3, r0, 0
	ldr r2, [r3, 0x8]
	ldrb r0, [r2]
	adds r2, 0x1
	str r2, [r3, 0x8]
	ldrb r1, [r2]
	lsls r1, 8
	orrs r0, r1
	adds r2, 0x1
	str r2, [r3, 0x8]
	bx lr
	thumb_func_end sub_80698F8

	thumb_func_start sub_8069910
sub_8069910: @ 8069910
	push {r4-r6,lr}
	adds r3, r0, 0
	ldr r0, [r3, 0x8]
	ldrb r6, [r0]
	adds r0, 0x1
	str r0, [r3, 0x8]
	ldrb r5, [r0]
	adds r2, r0, 0x1
	str r2, [r3, 0x8]
	ldrb r4, [r0, 0x1]
	adds r1, r2, 0x1
	str r1, [r3, 0x8]
	ldrb r0, [r2, 0x1]
	adds r1, 0x1
	str r1, [r3, 0x8]
	lsls r0, 8
	adds r0, r4
	lsls r0, 8
	adds r0, r5
	lsls r0, 8
	adds r0, r6
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_8069910

	thumb_func_start sub_8069940
sub_8069940: @ 8069940
	ldr r1, _08069948 @ =gUnknown_3000F9C
	movs r0, 0x1
	strb r0, [r1]
	bx lr
	.align 2, 0
_08069948: .4byte gUnknown_3000F9C
	thumb_func_end sub_8069940

	thumb_func_start sub_806994C
sub_806994C: @ 806994C
	ldr r1, _08069954 @ =gUnknown_3000F9C
	movs r0, 0
	strb r0, [r1]
	bx lr
	.align 2, 0
_08069954: .4byte gUnknown_3000F9C
	thumb_func_end sub_806994C

	thumb_func_start sub_8069958
sub_8069958: @ 8069958
	ldr r0, _08069960 @ =gUnknown_3000F9C
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_08069960: .4byte gUnknown_3000F9C
	thumb_func_end sub_8069958

	thumb_func_start sub_8069964
sub_8069964: @ 8069964
	ldr r1, _0806996C @ =gUnknown_3000FA0
	movs r0, 0x1
	strb r0, [r1]
	bx lr
	.align 2, 0
_0806996C: .4byte gUnknown_3000FA0
	thumb_func_end sub_8069964

	thumb_func_start sub_8069970
sub_8069970: @ 8069970
	ldr r1, _08069978 @ =gUnknown_3000FA0
	movs r0, 0
	strb r0, [r1]
	bx lr
	.align 2, 0
_08069978: .4byte gUnknown_3000FA0
	thumb_func_end sub_8069970

	thumb_func_start sub_806997C
sub_806997C: @ 806997C
	push {lr}
	ldr r0, _0806998C @ =gUnknown_3000FA0
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _08069990
	movs r0, 0
	b _08069992
	.align 2, 0
_0806998C: .4byte gUnknown_3000FA0
_08069990:
	movs r0, 0x1
_08069992:
	pop {r1}
	bx r1
	thumb_func_end sub_806997C

	thumb_func_start sub_8069998
sub_8069998: @ 8069998
	ldr r1, _080699A0 @ =gUnknown_3000F9F
	strb r0, [r1]
	bx lr
	.align 2, 0
_080699A0: .4byte gUnknown_3000F9F
	thumb_func_end sub_8069998

	thumb_func_start sub_80699A4
sub_80699A4: @ 80699A4
	ldr r1, _080699AC @ =gUnknown_3000F9F
	movs r0, 0
	strb r0, [r1]
	bx lr
	.align 2, 0
_080699AC: .4byte gUnknown_3000F9F
	thumb_func_end sub_80699A4

	thumb_func_start sub_80699B0
sub_80699B0: @ 80699B0
	ldr r0, _080699B8 @ =gUnknown_3000F9F
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_080699B8: .4byte gUnknown_3000F9F
	thumb_func_end sub_80699B0

	thumb_func_start sub_80699BC
sub_80699BC: @ 80699BC
	ldr r1, _080699C4 @ =gUnknown_3000F9D
	movs r0, 0x1
	strb r0, [r1]
	bx lr
	.align 2, 0
_080699C4: .4byte gUnknown_3000F9D
	thumb_func_end sub_80699BC

	thumb_func_start sub_80699C8
sub_80699C8: @ 80699C8
	ldr r1, _080699D0 @ =gUnknown_3000F9D
	movs r0, 0
	strb r0, [r1]
	bx lr
	.align 2, 0
_080699D0: .4byte gUnknown_3000F9D
	thumb_func_end sub_80699C8

	thumb_func_start sub_80699D4
sub_80699D4: @ 80699D4
	ldr r0, _080699DC @ =gUnknown_3000F9D
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_080699DC: .4byte gUnknown_3000F9D
	thumb_func_end sub_80699D4

	thumb_func_start sub_80699E0
sub_80699E0: @ 80699E0
	ldr r1, _080699F0 @ =gUnknown_20370A0
	movs r0, 0x6
	strb r0, [r1]
	ldr r1, _080699F4 @ =gUnknown_3000F9E
	movs r0, 0x1
	strb r0, [r1]
	bx lr
	.align 2, 0
_080699F0: .4byte gUnknown_20370A0
_080699F4: .4byte gUnknown_3000F9E
	thumb_func_end sub_80699E0

	thumb_func_start sub_80699F8
sub_80699F8: @ 80699F8
	ldr r1, _08069A00 @ =gUnknown_3000F9E
	movs r0, 0
	strb r0, [r1]
	bx lr
	.align 2, 0
_08069A00: .4byte gUnknown_3000F9E
	thumb_func_end sub_80699F8

	thumb_func_start sub_8069A04
sub_8069A04: @ 8069A04
	push {lr}
	ldr r0, _08069A14 @ =gUnknown_3000F9E
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _08069A18
	movs r0, 0
	b _08069A1A
	.align 2, 0
_08069A14: .4byte gUnknown_3000F9E
_08069A18:
	movs r0, 0x1
_08069A1A:
	pop {r1}
	bx r1
	thumb_func_end sub_8069A04

	thumb_func_start sub_8069A20
sub_8069A20: @ 8069A20
	ldr r1, _08069A28 @ =gUnknown_3000FA1
	movs r0, 0x1
	strb r0, [r1]
	bx lr
	.align 2, 0
_08069A28: .4byte gUnknown_3000FA1
	thumb_func_end sub_8069A20

	thumb_func_start sub_8069A2C
sub_8069A2C: @ 8069A2C
	ldr r1, _08069A34 @ =gUnknown_3000FA1
	movs r0, 0
	strb r0, [r1]
	bx lr
	.align 2, 0
_08069A34: .4byte gUnknown_3000FA1
	thumb_func_end sub_8069A2C

	thumb_func_start sub_8069A38
sub_8069A38: @ 8069A38
	push {lr}
	ldr r0, _08069A48 @ =gUnknown_3000FA1
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _08069A4C
	movs r0, 0
	b _08069A4E
	.align 2, 0
_08069A48: .4byte gUnknown_3000FA1
_08069A4C:
	movs r0, 0x1
_08069A4E:
	pop {r1}
	bx r1
	thumb_func_end sub_8069A38

	thumb_func_start sub_8069A54
sub_8069A54: @ 8069A54
	push {lr}
	bl sub_80CBDE8
	bl sub_8069A2C
	pop {r0}
	bx r0
	thumb_func_end sub_8069A54

	thumb_func_start sub_8069A64
sub_8069A64: @ 8069A64
	push {lr}
	ldr r0, _08069A74 @ =gUnknown_3000EA8
	ldrb r0, [r0]
	cmp r0, 0
	beq _08069A78
	movs r0, 0
	b _08069A7A
	.align 2, 0
_08069A74: .4byte gUnknown_3000EA8
_08069A78:
	movs r0, 0x1
_08069A7A:
	pop {r1}
	bx r1
	thumb_func_end sub_8069A64

	thumb_func_start sub_8069A80
sub_8069A80: @ 8069A80
	push {lr}
	ldr r0, _08069A98 @ =gUnknown_3000EB0
	ldr r1, _08069A9C @ =gUnknown_815F9B4
	ldr r2, _08069AA0 @ =gUnknown_815FD08
	bl sub_80697AC
	ldr r1, _08069AA4 @ =gUnknown_3000EA8
	movs r0, 0x2
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08069A98: .4byte gUnknown_3000EB0
_08069A9C: .4byte gUnknown_815F9B4
_08069AA0: .4byte gUnknown_815FD08
_08069AA4: .4byte gUnknown_3000EA8
	thumb_func_end sub_8069A80

	thumb_func_start sub_8069AA8
sub_8069AA8: @ 8069AA8
	push {r4,lr}
	ldr r4, _08069ACC @ =gUnknown_3000EA8
	ldrb r0, [r4]
	cmp r0, 0x2
	beq _08069ADC
	cmp r0, 0x1
	beq _08069ADC
	bl sub_8069940
	ldr r0, _08069AD0 @ =gUnknown_3000EB0
	bl sub_8069804
	lsls r0, 24
	cmp r0, 0
	beq _08069AD4
	movs r0, 0x1
	b _08069ADE
	.align 2, 0
_08069ACC: .4byte gUnknown_3000EA8
_08069AD0: .4byte gUnknown_3000EB0
_08069AD4:
	movs r0, 0x2
	strb r0, [r4]
	bl sub_806994C
_08069ADC:
	movs r0, 0
_08069ADE:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8069AA8

	thumb_func_start sub_8069AE4
sub_8069AE4: @ 8069AE4
	push {r4,r5,lr}
	adds r5, r0, 0
	bl sub_80699F8
	bl sub_80699C8
	bl sub_8069970
	ldr r4, _08069B18 @ =gUnknown_3000EB0
	ldr r1, _08069B1C @ =gUnknown_815F9B4
	ldr r2, _08069B20 @ =gUnknown_815FD08
	adds r0, r4, 0
	bl sub_80697AC
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80697E8
	bl sub_8069940
	ldr r1, _08069B24 @ =gUnknown_3000EA8
	movs r0, 0
	strb r0, [r1]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08069B18: .4byte gUnknown_3000EB0
_08069B1C: .4byte gUnknown_815F9B4
_08069B20: .4byte gUnknown_815FD08
_08069B24: .4byte gUnknown_3000EA8
	thumb_func_end sub_8069AE4

	thumb_func_start sub_8069B28
sub_8069B28: @ 8069B28
	ldr r1, _08069B30 @ =gUnknown_3000EA8
	movs r0, 0x1
	strb r0, [r1]
	bx lr
	.align 2, 0
_08069B30: .4byte gUnknown_3000EA8
	thumb_func_end sub_8069B28

	thumb_func_start sub_8069B34
sub_8069B34: @ 8069B34
	push {lr}
	ldr r1, _08069B44 @ =gUnknown_3000EA8
	movs r0, 0
	strb r0, [r1]
	bl sub_8069940
	pop {r0}
	bx r0
	.align 2, 0
_08069B44: .4byte gUnknown_3000EA8
	thumb_func_end sub_8069B34

	thumb_func_start sub_8069B48
sub_8069B48: @ 8069B48
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r4, _08069B74 @ =gUnknown_3000F28
	ldr r1, _08069B78 @ =gUnknown_815F9B4
	ldr r2, _08069B7C @ =gUnknown_815FD08
	adds r0, r4, 0
	bl sub_80697AC
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80697E8
_08069B60:
	ldr r0, _08069B74 @ =gUnknown_3000F28
	bl sub_8069804
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08069B60
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08069B74: .4byte gUnknown_3000F28
_08069B78: .4byte gUnknown_815F9B4
_08069B7C: .4byte gUnknown_815FD08
	thumb_func_end sub_8069B48

	thumb_func_start sub_8069B80
sub_8069B80: @ 8069B80
	push {lr}
	lsls r0, 24
	lsrs r1, r0, 24
	ldr r0, _08069B98 @ =gUnknown_2036DFC
	ldr r2, [r0, 0x8]
	cmp r2, 0
	beq _08069B94
_08069B8E:
	ldrb r0, [r2]
	cmp r0, 0
	bne _08069B9C
_08069B94:
	movs r0, 0
	b _08069BBA
	.align 2, 0
_08069B98: .4byte gUnknown_2036DFC
_08069B9C:
	cmp r0, r1
	beq _08069BA4
	adds r2, 0x5
	b _08069B8E
_08069BA4:
	adds r2, 0x1
	ldrb r0, [r2]
	ldrb r1, [r2, 0x1]
	lsls r1, 8
	adds r0, r1
	ldrb r1, [r2, 0x2]
	lsls r1, 16
	adds r0, r1
	ldrb r1, [r2, 0x3]
	lsls r1, 24
	adds r0, r1
_08069BBA:
	pop {r1}
	bx r1
	thumb_func_end sub_8069B80

	thumb_func_start sub_8069BC0
sub_8069BC0: @ 8069BC0
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl sub_8069B80
	cmp r0, 0
	beq _08069BD2
	bl sub_8069B48
_08069BD2:
	pop {r0}
	bx r0
	thumb_func_end sub_8069BC0

	thumb_func_start sub_8069BD8
sub_8069BD8: @ 8069BD8
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	bl sub_8069B80
	adds r6, r0, 0
	cmp r6, 0
	beq _08069BF4
_08069BE8:
	ldrb r1, [r6]
	ldrb r0, [r6, 0x1]
	lsls r0, 8
	orrs r1, r0
	cmp r1, 0
	bne _08069BF8
_08069BF4:
	movs r0, 0
	b _08069C32
_08069BF8:
	adds r6, 0x2
	ldrb r5, [r6]
	ldrb r0, [r6, 0x1]
	lsls r0, 8
	orrs r5, r0
	adds r6, 0x2
	adds r0, r1, 0
	bl sub_806E568
	adds r4, r0, 0
	adds r0, r5, 0
	bl sub_806E568
	lsls r4, 16
	lsls r0, 16
	cmp r4, r0
	beq _08069C1E
	adds r6, 0x4
	b _08069BE8
_08069C1E:
	ldrb r0, [r6]
	ldrb r1, [r6, 0x1]
	lsls r1, 8
	adds r0, r1
	ldrb r1, [r6, 0x2]
	lsls r1, 16
	adds r0, r1
	ldrb r1, [r6, 0x3]
	lsls r1, 24
	adds r0, r1
_08069C32:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_8069BD8

	thumb_func_start sub_8069C38
sub_8069C38: @ 8069C38
	push {lr}
	movs r0, 0x1
	bl sub_8069BC0
	pop {r0}
	bx r0
	thumb_func_end sub_8069C38

	thumb_func_start sub_8069C44
sub_8069C44: @ 8069C44
	push {lr}
	movs r0, 0x3
	bl sub_8069BC0
	pop {r0}
	bx r0
	thumb_func_end sub_8069C44

	thumb_func_start sub_8069C50
sub_8069C50: @ 8069C50
	push {lr}
	movs r0, 0x5
	bl sub_8069BC0
	pop {r0}
	bx r0
	thumb_func_end sub_8069C50

	thumb_func_start sub_8069C5C
sub_8069C5C: @ 8069C5C
	push {lr}
	movs r0, 0x7
	bl sub_8069BC0
	pop {r0}
	bx r0
	thumb_func_end sub_8069C5C

	thumb_func_start sub_8069C68
sub_8069C68: @ 8069C68
	push {lr}
	movs r0, 0x6
	bl sub_8069BC0
	pop {r0}
	bx r0
	thumb_func_end sub_8069C68

	thumb_func_start sub_8069C74
sub_8069C74: @ 8069C74
	push {lr}
	ldr r0, _08069C90 @ =gUnknown_203ADFA
	ldrb r0, [r0]
	cmp r0, 0x3
	beq _08069C94
	movs r0, 0x2
	bl sub_8069BD8
	cmp r0, 0
	beq _08069C94
	bl sub_8069AE4
	movs r0, 0x1
	b _08069C96
	.align 2, 0
_08069C90: .4byte gUnknown_203ADFA
_08069C94:
	movs r0, 0
_08069C96:
	pop {r1}
	bx r1
	thumb_func_end sub_8069C74

	thumb_func_start sub_8069C9C
sub_8069C9C: @ 8069C9C
	push {lr}
	movs r0, 0x4
	bl sub_8069BD8
	cmp r0, 0
	beq _08069CAC
	bl sub_8069B48
_08069CAC:
	pop {r0}
	bx r0
	thumb_func_end sub_8069C9C

	thumb_func_start sub_8069CB0
sub_8069CB0: @ 8069CB0
	push {lr}
	ldr r0, _08069CCC @ =gUnknown_3005008
	ldr r0, [r0]
	ldr r1, _08069CD0 @ =0x00003620
	adds r0, r1
	movs r1, 0xFA
	lsls r1, 2
	bl sub_8045210
	lsls r0, 16
	lsrs r0, 16
	pop {r1}
	bx r1
	.align 2, 0
_08069CCC: .4byte gUnknown_3005008
_08069CD0: .4byte 0x00003620
	thumb_func_end sub_8069CB0

	thumb_func_start sub_8069CD4
sub_8069CD4: @ 8069CD4
	push {lr}
	sub sp, 0x4
	movs r0, 0
	str r0, [sp]
	ldr r0, _08069CF4 @ =gUnknown_3005008
	ldr r1, [r0]
	ldr r0, _08069CF8 @ =0x0000361c
	adds r1, r0
	ldr r2, _08069CFC @ =0x050000fb
	mov r0, sp
	bl CpuSet
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_08069CF4: .4byte gUnknown_3005008
_08069CF8: .4byte 0x0000361c
_08069CFC: .4byte 0x050000fb
	thumb_func_end sub_8069CD4

	thumb_func_start sub_8069D00
sub_8069D00: @ 8069D00
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	str r0, [sp]
	ldr r0, [sp, 0x24]
	lsls r1, 16
	lsrs r1, 16
	mov r8, r1
	lsls r2, 24
	lsrs r2, 24
	mov r9, r2
	lsls r3, 24
	lsrs r7, r3, 24
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r0, _08069D64 @ =gUnknown_3005008
	mov r10, r0
	ldr r5, [r0]
	ldr r1, _08069D68 @ =0x00003620
	adds r4, r5, r1
	bl sub_8069CD4
	ldr r0, _08069D6C @ =0x000003e3
	cmp r8, r0
	bhi _08069D78
	movs r0, 0x33
	strb r0, [r4]
	mov r2, r9
	strb r2, [r4, 0x1]
	strb r7, [r4, 0x2]
	strb r6, [r4, 0x3]
	ldr r1, _08069D70 @ =0x00003624
	adds r0, r5, r1
	ldr r1, [sp]
	mov r2, r8
	bl memcpy
	bl sub_8069CB0
	mov r2, r10
	ldr r1, [r2]
	ldr r2, _08069D74 @ =0x0000361c
	adds r1, r2
	str r0, [r1]
	movs r0, 0x1
	b _08069D7A
	.align 2, 0
_08069D64: .4byte gUnknown_3005008
_08069D68: .4byte 0x00003620
_08069D6C: .4byte 0x000003e3
_08069D70: .4byte 0x00003624
_08069D74: .4byte 0x0000361c
_08069D78:
	movs r0, 0
_08069D7A:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8069D00

	thumb_func_start sub_8069D8C
sub_8069D8C: @ 8069D8C
	push {r4-r7,lr}
	adds r4, r1, 0
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r6, _08069DDC @ =gUnknown_3005008
	ldr r5, [r6]
	ldr r0, _08069DE0 @ =0x00003620
	adds r2, r5, r0
	ldr r7, _08069DE4 @ =gUnknown_20370A4
	movs r0, 0
	str r0, [r7]
	ldrb r0, [r2]
	cmp r0, 0x33
	bne _08069DF4
	ldrb r1, [r2, 0x1]
	movs r0, 0x4
	ldrsb r0, [r5, r0]
	cmp r1, r0
	bne _08069DF4
	ldrb r1, [r2, 0x2]
	movs r0, 0x5
	ldrsb r0, [r5, r0]
	cmp r1, r0
	bne _08069DF4
	ldrb r0, [r2, 0x3]
	cmp r0, r3
	bne _08069DF4
	bl sub_8069CB0
	ldr r1, [r6]
	ldr r2, _08069DE8 @ =0x0000361c
	adds r1, r2
	ldr r1, [r1]
	cmp r0, r1
	bne _08069DF0
	str r4, [r7]
	ldr r1, _08069DEC @ =0x00003624
	adds r0, r5, r1
	b _08069DF6
	.align 2, 0
_08069DDC: .4byte gUnknown_3005008
_08069DE0: .4byte 0x00003620
_08069DE4: .4byte gUnknown_20370A4
_08069DE8: .4byte 0x0000361c
_08069DEC: .4byte 0x00003624
_08069DF0:
	bl sub_8069CD4
_08069DF4:
	adds r0, r4, 0
_08069DF6:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8069D8C

	thumb_func_start sub_8069DFC
sub_8069DFC: @ 8069DFC
	push {r4,lr}
	ldr r4, _08069E34 @ =gUnknown_3005008
	ldr r0, [r4]
	ldr r2, _08069E38 @ =0x00003620
	adds r1, r0, r2
	ldrb r0, [r1]
	cmp r0, 0x33
	bne _08069E40
	ldrb r0, [r1, 0x1]
	cmp r0, 0xFF
	bne _08069E40
	ldrb r0, [r1, 0x2]
	cmp r0, 0xFF
	bne _08069E40
	ldrb r0, [r1, 0x3]
	cmp r0, 0xFF
	bne _08069E40
	bl sub_8069CB0
	ldr r1, [r4]
	ldr r2, _08069E3C @ =0x0000361c
	adds r1, r2
	ldr r1, [r1]
	cmp r0, r1
	bne _08069E40
	movs r0, 0x1
	b _08069E42
	.align 2, 0
_08069E34: .4byte gUnknown_3005008
_08069E38: .4byte 0x00003620
_08069E3C: .4byte 0x0000361c
_08069E40:
	movs r0, 0
_08069E42:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8069DFC

	thumb_func_start sub_8069E48
sub_8069E48: @ 8069E48
	push {r4-r6,lr}
	ldr r6, _08069E88 @ =gUnknown_3005008
	ldr r5, [r6]
	ldr r0, _08069E8C @ =0x00003620
	adds r4, r5, r0
	bl sub_8143FC8
	cmp r0, 0
	beq _08069E9C
	ldrb r0, [r4]
	cmp r0, 0x33
	bne _08069E9C
	ldrb r0, [r4, 0x1]
	cmp r0, 0xFF
	bne _08069E9C
	ldrb r0, [r4, 0x2]
	cmp r0, 0xFF
	bne _08069E9C
	ldrb r0, [r4, 0x3]
	cmp r0, 0xFF
	bne _08069E9C
	bl sub_8069CB0
	ldr r1, [r6]
	ldr r2, _08069E90 @ =0x0000361c
	adds r1, r2
	ldr r1, [r1]
	cmp r0, r1
	bne _08069E98
	ldr r1, _08069E94 @ =0x00003624
	adds r0, r5, r1
	b _08069E9E
	.align 2, 0
_08069E88: .4byte gUnknown_3005008
_08069E8C: .4byte 0x00003620
_08069E90: .4byte 0x0000361c
_08069E94: .4byte 0x00003624
_08069E98:
	bl sub_8069CD4
_08069E9C:
	movs r0, 0
_08069E9E:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_8069E48

	thumb_func_start sub_8069EA4
sub_8069EA4: @ 8069EA4
	push {lr}
	sub sp, 0x4
	adds r2, r0, 0
	lsls r1, 16
	lsrs r1, 16
	ldr r0, _08069ECC @ =0x000003e3
	cmp r1, r0
	bls _08069EB6
	adds r1, r0, 0
_08069EB6:
	movs r0, 0xFF
	str r0, [sp]
	adds r0, r2, 0
	movs r2, 0xFF
	movs r3, 0xFF
	bl sub_8069D00
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_08069ECC: .4byte 0x000003e3
	thumb_func_end sub_8069EA4

	.align 2, 0 @ Don't pad with nop.
