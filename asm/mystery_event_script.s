	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_80DA800
sub_80DA800: @ 80DA800
	push {r4,lr}
	lsls r0, 16
	lsrs r0, 16
	lsls r2, 16
	lsrs r2, 16
	movs r4, 0x1
	ands r0, r4
	cmp r0, 0
	beq _080DA828
	ands r1, r4
	cmp r1, 0
	beq _080DA828
	ands r2, r4
	cmp r2, 0
	beq _080DA828
	ands r3, r4
	cmp r3, 0
	beq _080DA828
	movs r0, 0x1
	b _080DA82A
_080DA828:
	movs r0, 0
_080DA82A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80DA800

	thumb_func_start sub_80DA830
sub_80DA830: @ 80DA830
	push {lr}
	ldr r0, _080DA844 @ =gUnknown_2021D18
	ldr r1, _080DA848 @ =gUnknown_8488DFD
	bl sub_8008FCC
	movs r0, 0x3
	bl sub_80DA8E8
	pop {r0}
	bx r0
	.align 2, 0
_080DA844: .4byte gUnknown_2021D18
_080DA848: .4byte gUnknown_8488DFD
	thumb_func_end sub_80DA830

	thumb_func_start sub_80DA84C
sub_80DA84C: @ 80DA84C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _080DA874 @ =gUnknown_81DBCF0
	ldr r2, _080DA878 @ =0x081dbd34
	bl sub_80697AC
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80697E8
	str r5, [r4, 0x64]
	movs r0, 0
	str r0, [r4, 0x68]
	str r0, [r4, 0x6C]
	str r0, [r4, 0x70]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080DA874: .4byte gUnknown_81DBCF0
_080DA878: .4byte 0x081dbd34
	thumb_func_end sub_80DA84C

	thumb_func_start sub_80DA87C
sub_80DA87C: @ 80DA87C
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8069804
	lsls r0, 24
	cmp r0, 0
	beq _080DA894
	ldr r0, [r4, 0x70]
	cmp r0, 0
	beq _080DA894
	movs r0, 0x1
	b _080DA896
_080DA894:
	movs r0, 0
_080DA896:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80DA87C

	thumb_func_start sub_80DA89C
sub_80DA89C: @ 80DA89C
	push {lr}
	adds r1, r0, 0
	ldr r0, _080DA8AC @ =gUnknown_203AA3C
	bl sub_80DA84C
	pop {r0}
	bx r0
	.align 2, 0
_080DA8AC: .4byte gUnknown_203AA3C
	thumb_func_end sub_80DA89C

	thumb_func_start sub_80DA8B0
sub_80DA8B0: @ 80DA8B0
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r4, _080DA8C8 @ =gUnknown_203AA3C
	adds r0, r4, 0
	bl sub_80DA87C
	ldr r1, [r4, 0x6C]
	str r1, [r5]
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080DA8C8: .4byte gUnknown_203AA3C
	thumb_func_end sub_80DA8B0

	thumb_func_start sub_80DA8CC
sub_80DA8CC: @ 80DA8CC
	push {lr}
	sub sp, 0x4
	bl sub_80DA89C
_080DA8D4:
	mov r0, sp
	bl sub_80DA8B0
	cmp r0, 0
	bne _080DA8D4
	ldr r0, [sp]
	add sp, 0x4
	pop {r1}
	bx r1
	thumb_func_end sub_80DA8CC

	thumb_func_start sub_80DA8E8
sub_80DA8E8: @ 80DA8E8
	ldr r1, _080DA8F0 @ =gUnknown_203AA3C
	str r0, [r1, 0x6C]
	bx lr
	.align 2, 0
_080DA8F0: .4byte gUnknown_203AA3C
	thumb_func_end sub_80DA8E8

	thumb_func_start sub_80DA8F4
sub_80DA8F4: @ 80DA8F4
	push {lr}
	bl sub_80697FC
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end sub_80DA8F4

	thumb_func_start sub_80DA900
sub_80DA900: @ 80DA900
	push {r4-r7,lr}
	adds r7, r0, 0
	bl sub_8069910
	str r0, [r7, 0x68]
	adds r0, r7, 0
	bl sub_80698F8
	adds r5, r0, 0
	lsls r5, 16
	lsrs r5, 16
	adds r0, r7, 0
	bl sub_8069910
	adds r6, r0, 0
	adds r0, r7, 0
	bl sub_80698F8
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r7, 0
	bl sub_8069910
	adds r3, r0, 0
	adds r0, r5, 0
	adds r1, r6, 0
	adds r2, r4, 0
	bl sub_80DA800
	cmp r0, 0x1
	bne _080DA944
	str r0, [r7, 0x70]
	b _080DA948
_080DA944:
	bl sub_80DA830
_080DA948:
	movs r0, 0x1
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80DA900

	thumb_func_start sub_80DA950
sub_80DA950: @ 80DA950
	movs r0, 0
	bx lr
	thumb_func_end sub_80DA950

	thumb_func_start sub_80DA954
sub_80DA954: @ 80DA954
	ldr r1, [r0, 0x8]
	ldrb r2, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	str r2, [r0, 0x6C]
	movs r0, 0
	bx lr
	thumb_func_end sub_80DA954

	thumb_func_start sub_80DA964
sub_80DA964: @ 80DA964
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r0, [r4, 0x8]
	ldrb r5, [r0]
	adds r0, 0x1
	str r0, [r4, 0x8]
	adds r0, r4, 0
	bl sub_8069910
	ldr r1, [r4, 0x68]
	subs r0, r1
	ldr r1, [r4, 0x64]
	adds r1, r0, r1
	cmp r5, 0xFF
	beq _080DA988
	ldr r0, [r4, 0x6C]
	cmp r5, r0
	bne _080DA98E
_080DA988:
	ldr r0, _080DA998 @ =gUnknown_2021D18
	bl sub_8008FCC
_080DA98E:
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080DA998: .4byte gUnknown_2021D18
	thumb_func_end sub_80DA964

	thumb_func_start sub_80DA99C
sub_80DA99C: @ 80DA99C
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8069910
	ldr r1, [r4, 0x68]
	subs r0, r1
	ldr r1, [r4, 0x64]
	adds r0, r1
	bl sub_8069B48
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80DA99C

	thumb_func_start sub_80DA9B8
sub_80DA9B8: @ 80DA9B8
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	adds r7, r0, 0
	bl sub_809C854
	mov r8, r0
	adds r0, r7, 0
	bl sub_8069910
	adds r4, r0, 0
	ldr r0, [r7, 0x68]
	subs r4, r0
	ldr r0, [r7, 0x64]
	adds r4, r0
	ldr r0, _080DAA0C @ =gUnknown_2021CD0
	mov r9, r0
	ldr r6, _080DAA10 @ =gUnknown_3005008
	ldr r1, [r6]
	ldr r5, _080DAA14 @ =0x000030ec
	adds r1, r5
	movs r2, 0x7
	bl sub_8008DBC
	adds r0, r4, 0
	bl sub_809C7C4
	ldr r4, _080DAA18 @ =gUnknown_2021CF0
	ldr r1, [r6]
	adds r1, r5
	adds r0, r4, 0
	movs r2, 0x7
	bl sub_8008DBC
	mov r0, r8
	cmp r0, 0
	bne _080DAA24
	ldr r0, _080DAA1C @ =gUnknown_2021D18
	ldr r1, _080DAA20 @ =gUnknown_8488C70
	b _080DAA44
	.align 2, 0
_080DAA0C: .4byte gUnknown_2021CD0
_080DAA10: .4byte gUnknown_3005008
_080DAA14: .4byte 0x000030ec
_080DAA18: .4byte gUnknown_2021CF0
_080DAA1C: .4byte gUnknown_2021D18
_080DAA20: .4byte gUnknown_8488C70
_080DAA24:
	mov r0, r9
	adds r1, r4, 0
	bl sub_8008E28
	cmp r0, 0
	beq _080DAA40
	ldr r0, _080DAA38 @ =gUnknown_2021D18
	ldr r1, _080DAA3C @ =gUnknown_8488CA2
	b _080DAA44
	.align 2, 0
_080DAA38: .4byte gUnknown_2021D18
_080DAA3C: .4byte gUnknown_8488CA2
_080DAA40:
	ldr r0, _080DAA60 @ =gUnknown_2021D18
	ldr r1, _080DAA64 @ =gUnknown_8488CCE
_080DAA44:
	bl sub_8008FCC
	movs r0, 0x2
	str r0, [r7, 0x6C]
	bl sub_809C854
	cmp r0, 0x1
	bne _080DAA6C
	ldr r0, _080DAA68 @ =0x00004033
	movs r1, 0x1
	bl sub_806E584
	b _080DAA70
	.align 2, 0
_080DAA60: .4byte gUnknown_2021D18
_080DAA64: .4byte gUnknown_8488CCE
_080DAA68: .4byte 0x00004033
_080DAA6C:
	movs r0, 0x1
	str r0, [r7, 0x6C]
_080DAA70:
	movs r0, 0
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80DA9B8

	thumb_func_start sub_80DAA80
sub_80DAA80: @ 80DAA80
	push {r4,lr}
	adds r4, r0, 0
	ldr r2, [r4, 0x8]
	ldrb r0, [r2]
	adds r2, 0x1
	str r2, [r4, 0x8]
	ldrb r1, [r2]
	adds r2, 0x1
	str r2, [r4, 0x8]
	bl sub_80A09AC
	ldr r0, _080DAAAC @ =gUnknown_2021D18
	ldr r1, _080DAAB0 @ =gUnknown_8488CF6
	bl sub_8008FCC
	movs r0, 0x2
	str r0, [r4, 0x6C]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080DAAAC: .4byte gUnknown_2021D18
_080DAAB0: .4byte gUnknown_8488CF6
	thumb_func_end sub_80DAA80

	thumb_func_start sub_80DAAB4
sub_80DAAB4: @ 80DAAB4
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	sub sp, 0x4
	adds r4, r0, 0
	ldr r0, [r4, 0x8]
	ldrb r1, [r0]
	mov r9, r1
	adds r0, 0x1
	str r0, [r4, 0x8]
	ldrb r1, [r0]
	mov r8, r1
	adds r1, r0, 0x1
	str r1, [r4, 0x8]
	ldrb r6, [r0, 0x1]
	adds r1, 0x1
	str r1, [r4, 0x8]
	adds r0, r4, 0
	bl sub_8069910
	adds r5, r0, 0
	ldr r0, [r4, 0x68]
	subs r5, r0
	ldr r0, [r4, 0x64]
	adds r5, r0
	adds r0, r4, 0
	bl sub_8069910
	adds r1, r0, 0
	ldr r0, [r4, 0x68]
	subs r1, r0
	ldr r0, [r4, 0x64]
	adds r1, r0
	subs r1, r5
	lsls r1, 16
	lsrs r1, 16
	str r6, [sp]
	adds r0, r5, 0
	mov r2, r9
	mov r3, r8
	bl sub_8069D00
	movs r0, 0
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80DAAB4

	thumb_func_start sub_80DAB1C
sub_80DAB1C: @ 80DAB1C
	push {r4,lr}
	adds r4, r0, 0
	bl sub_806E22C
	ldr r0, _080DAB38 @ =gUnknown_2021D18
	ldr r1, _080DAB3C @ =gUnknown_8488D2A
	bl sub_8008FCC
	movs r0, 0x2
	str r0, [r4, 0x6C]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080DAB38: .4byte gUnknown_2021D18
_080DAB3C: .4byte gUnknown_8488D2A
	thumb_func_end sub_80DAB1C

	thumb_func_start sub_80DAB40
sub_80DAB40: @ 80DAB40
	push {r4,lr}
	adds r4, r0, 0
	ldr r1, [r4, 0x8]
	ldrb r0, [r1]
	adds r1, 0x1
	str r1, [r4, 0x8]
	bl sub_80BDB70
	ldr r0, _080DAB64 @ =gUnknown_2021D18
	ldr r1, _080DAB68 @ =gUnknown_8488D60
	bl sub_8008FCC
	movs r0, 0x2
	str r0, [r4, 0x6C]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080DAB64: .4byte gUnknown_2021D18
_080DAB68: .4byte gUnknown_8488D60
	thumb_func_end sub_80DAB40

	thumb_func_start sub_80DAB6C
sub_80DAB6C: @ 80DAB6C
	push {r4,lr}
	adds r4, r0, 0
	bl sub_80DA830
	movs r0, 0
	str r0, [r4, 0x70]
	movs r0, 0x1
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80DAB6C

	thumb_func_start sub_80DAB80
sub_80DAB80: @ 80DAB80
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x88
	adds r6, r0, 0
	bl sub_8069910
	ldr r1, [r6, 0x68]
	subs r0, r1
	ldr r1, [r6, 0x64]
	adds r5, r0, r1
	movs r0, 0x64
	adds r0, r5
	mov r8, r0
	add r4, sp, 0x24
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x64
	bl memcpy
	adds r0, r4, 0
	movs r1, 0x41
	bl sub_803FBE8
	lsls r0, 16
	lsrs r4, r0, 16
	movs r0, 0xCE
	lsls r0, 1
	cmp r4, r0
	bne _080DABD0
	ldr r0, _080DABC8 @ =gUnknown_2021CD0
	ldr r1, _080DABCC @ =gUnknown_8415A62
	movs r2, 0xB
	bl sub_8008DBC
	b _080DABDA
	.align 2, 0
_080DABC8: .4byte gUnknown_2021CD0
_080DABCC: .4byte gUnknown_8415A62
_080DABD0:
	ldr r0, _080DABF0 @ =gUnknown_2021CD0
	ldr r1, _080DABF4 @ =gUnknown_8415A66
	movs r2, 0xB
	bl sub_8008DBC
_080DABDA:
	ldr r0, _080DABF8 @ =gUnknown_2024029
	ldrb r0, [r0]
	cmp r0, 0x6
	bne _080DAC04
	ldr r0, _080DABFC @ =gUnknown_2021D18
	ldr r1, _080DAC00 @ =gUnknown_8488D8E
	bl sub_8008FCC
	movs r0, 0x3
	b _080DAC6E
	.align 2, 0
_080DABF0: .4byte gUnknown_2021CD0
_080DABF4: .4byte gUnknown_8415A66
_080DABF8: .4byte gUnknown_2024029
_080DABFC: .4byte gUnknown_2021D18
_080DAC00: .4byte gUnknown_8488D8E
_080DAC04:
	ldr r7, _080DAC80 @ =gUnknown_2024478
	adds r0, r7, 0
	adds r1, r5, 0
	movs r2, 0x64
	bl memcpy
	mov r0, sp
	mov r1, r8
	movs r2, 0x24
	bl memcpy
	movs r0, 0xCE
	lsls r0, 1
	cmp r4, r0
	beq _080DAC3E
	adds r0, r4, 0
	bl sub_8043298
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r4, 0
	movs r1, 0x2
	bl sub_8088E74
	adds r0, r4, 0
	movs r1, 0x3
	bl sub_8088E74
_080DAC3E:
	adds r0, r7, 0
	movs r1, 0xC
	bl sub_803FBE8
	lsls r0, 16
	lsrs r0, 16
	bl sub_80980F8
	lsls r0, 24
	cmp r0, 0
	beq _080DAC5C
	adds r0, r7, 0
	mov r1, sp
	bl sub_8097F44
_080DAC5C:
	bl sub_80937DC
	bl sub_8040C3C
	ldr r0, _080DAC84 @ =gUnknown_2021D18
	ldr r1, _080DAC88 @ =gUnknown_8488D7C
	bl sub_8008FCC
	movs r0, 0x2
_080DAC6E:
	str r0, [r6, 0x6C]
	movs r0, 0
	add sp, 0x88
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080DAC80: .4byte gUnknown_2024478
_080DAC84: .4byte gUnknown_2021D18
_080DAC88: .4byte gUnknown_8488D7C
	thumb_func_end sub_80DAB80

	thumb_func_start sub_80DAC8C
sub_80DAC8C: @ 80DAC8C
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8069910
	adds r1, r0, 0
	ldr r0, [r4, 0x68]
	subs r1, r0
	ldr r0, [r4, 0x64]
	adds r1, r0
	ldr r0, _080DACC8 @ =gUnknown_300500C
	ldr r0, [r0]
	movs r2, 0x94
	lsls r2, 3
	adds r0, r2
	movs r2, 0xBC
	bl memcpy
	bl sub_80E7490
	ldr r0, _080DACCC @ =gUnknown_2021D18
	ldr r1, _080DACD0 @ =gUnknown_8488DBD
	bl sub_8008FCC
	movs r0, 0x2
	str r0, [r4, 0x6C]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080DACC8: .4byte gUnknown_300500C
_080DACCC: .4byte gUnknown_2021D18
_080DACD0: .4byte gUnknown_8488DBD
	thumb_func_end sub_80DAC8C

	thumb_func_start sub_80DACD4
sub_80DACD4: @ 80DACD4
	push {r4,lr}
	adds r4, r0, 0
	bl sub_80DA830
	movs r0, 0
	str r0, [r4, 0x70]
	movs r0, 0x1
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80DACD4

	thumb_func_start sub_80DACE8
sub_80DACE8: @ 80DACE8
	push {r4-r6,lr}
	adds r6, r0, 0
	bl sub_8069910
	adds r5, r0, 0
	adds r0, r6, 0
	bl sub_8069910
	adds r4, r0, 0
	ldr r0, [r6, 0x68]
	subs r4, r0
	ldr r0, [r6, 0x64]
	adds r4, r0
	adds r0, r6, 0
	bl sub_8069910
	adds r1, r0, 0
	ldr r0, [r6, 0x68]
	subs r1, r0
	ldr r0, [r6, 0x64]
	adds r1, r0
	subs r1, r4
	adds r0, r4, 0
	bl sub_8045254
	cmp r5, r0
	beq _080DAD26
	movs r0, 0
	str r0, [r6, 0x70]
	movs r0, 0x1
	str r0, [r6, 0x6C]
_080DAD26:
	movs r0, 0x1
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80DACE8

	thumb_func_start sub_80DAD30
sub_80DAD30: @ 80DAD30
	push {r4-r6,lr}
	adds r6, r0, 0
	bl sub_8069910
	adds r5, r0, 0
	adds r0, r6, 0
	bl sub_8069910
	adds r4, r0, 0
	ldr r0, [r6, 0x68]
	subs r4, r0
	ldr r0, [r6, 0x64]
	adds r4, r0
	adds r0, r6, 0
	bl sub_8069910
	adds r1, r0, 0
	ldr r0, [r6, 0x68]
	subs r1, r0
	ldr r0, [r6, 0x64]
	adds r1, r0
	subs r1, r4
	adds r0, r4, 0
	bl sub_80451B8
	lsls r0, 16
	lsrs r0, 16
	cmp r5, r0
	beq _080DAD72
	movs r0, 0
	str r0, [r6, 0x70]
	movs r0, 0x1
	str r0, [r6, 0x6C]
_080DAD72:
	movs r0, 0x1
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80DAD30

	.align 2, 0 @ Don't pad with nop.
