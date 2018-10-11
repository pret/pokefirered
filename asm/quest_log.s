	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_8110E68
sub_8110E68: @ 8110E68
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r7, r0, 0
	ldr r0, _08110EA0 @ =gUnknown_203ADFC
	ldrh r5, [r0]
	ldr r0, _08110EA4 @ =gUnknown_203AF98
	mov r8, r0
	ldrh r0, [r0]
	cmp r5, r0
	bcs _08110ECA
	ldr r6, _08110EA8 @ =gUnknown_203AE08
_08110E80:
	ldr r4, [r6]
	cmp r4, 0
	beq _08110F02
	lsls r0, r5, 3
	adds r1, r0, r7
	ldrb r2, [r1, 0x6]
	adds r3, r0, 0
	cmp r2, 0x1
	bgt _08110EAC
	cmp r2, 0
	blt _08110EAC
	adds r0, r4, 0
	bl sub_8113D48
	b _08110EB4
	.align 2, 0
_08110EA0: .4byte gUnknown_203ADFC
_08110EA4: .4byte gUnknown_203AF98
_08110EA8: .4byte gUnknown_203AE08
_08110EAC:
	ldr r0, [r6]
	adds r1, r7, r3
	bl sub_8113CC8
_08110EB4:
	str r0, [r6]
	ldr r1, [r6]
	cmp r1, 0
	beq _08110EEC
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	ldr r0, _08110EE0 @ =gUnknown_203AF98
	ldrh r0, [r0]
	cmp r5, r0
	bcc _08110E80
_08110ECA:
	ldr r0, _08110EE4 @ =gUnknown_3005E88
	ldrb r0, [r0]
	cmp r0, 0
	beq _08110EF8
	ldr r1, _08110EE8 @ =gUnknown_203ADFC
	mov r2, r8
	ldrh r0, [r2]
	strh r0, [r1]
	movs r0, 0x1
	b _08110F04
	.align 2, 0
_08110EE0: .4byte gUnknown_203AF98
_08110EE4: .4byte gUnknown_3005E88
_08110EE8: .4byte gUnknown_203ADFC
_08110EEC:
	ldr r0, _08110EF4 @ =gUnknown_3005E88
	strb r1, [r0]
	b _08110F02
	.align 2, 0
_08110EF4: .4byte gUnknown_3005E88
_08110EF8:
	ldr r4, _08110F10 @ =gUnknown_203AE08
	ldr r0, [r4]
	bl sub_8113BF4
	str r0, [r4]
_08110F02:
	movs r0, 0
_08110F04:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08110F10: .4byte gUnknown_203AE08
	thumb_func_end sub_8110E68

	thumb_func_start sub_8110F14
sub_8110F14: @ 8110F14
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_811381C
	ldr r1, _08110F6C @ =gUnknown_203ADF9
	movs r0, 0
	strb r0, [r1]
	movs r2, 0
	ldr r0, _08110F70 @ =gSaveBlock1Ptr
	ldr r5, [r0]
	movs r7, 0xCD
	lsls r7, 3
	movs r6, 0x98
	lsls r6, 5
_08110F32:
	adds r0, r2, 0
	muls r0, r7
	adds r0, r5, r0
	adds r0, r6
	ldrb r0, [r0]
	ldr r3, _08110F6C @ =gUnknown_203ADF9
	cmp r0, 0
	beq _08110F48
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_08110F48:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x3
	bls _08110F32
	ldrb r0, [r3]
	cmp r0, 0
	beq _08110F78
	ldr r1, _08110F74 @ =gUnknown_3005ECC
	movs r0, 0
	strb r0, [r1]
	adds r0, r4, 0
	bl sub_8110F90
	adds r0, r4, 0
	bl DestroyTask
	b _08110F84
	.align 2, 0
_08110F6C: .4byte gUnknown_203ADF9
_08110F70: .4byte gSaveBlock1Ptr
_08110F74: .4byte gUnknown_3005ECC
_08110F78:
	ldr r0, _08110F8C @ =sub_8056938
	bl SetMainCallback2
	adds r0, r4, 0
	bl DestroyTask
_08110F84:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08110F8C: .4byte sub_8056938
	thumb_func_end sub_8110F14

	thumb_func_start sub_8110F90
sub_8110F90: @ 8110F90
	push {lr}
	ldr r1, _08110FC0 @ =gSaveBlock1Ptr
	ldr r2, [r1]
	movs r3, 0
	movs r0, 0x3
	strb r0, [r2, 0x4]
	ldr r2, [r1]
	movs r0, 0x13
	strb r0, [r2, 0x5]
	ldr r1, [r1]
	movs r0, 0xFF
	strb r0, [r1, 0x6]
	ldr r0, _08110FC4 @ =gUnknown_203ADF8
	strb r3, [r0]
	ldr r1, _08110FC8 @ =gUnknown_2031DD8
	movs r0, 0x1
	strb r0, [r1]
	movs r0, 0x1
	bl sub_8082740
	bl sub_8111368
	pop {r0}
	bx r0
	.align 2, 0
_08110FC0: .4byte gSaveBlock1Ptr
_08110FC4: .4byte gUnknown_203ADF8
_08110FC8: .4byte gUnknown_2031DD8
	thumb_func_end sub_8110F90

	thumb_func_start sub_8110FCC
sub_8110FCC: @ 8110FCC
	push {r4,r5,lr}
	ldr r5, _08110FF8 @ =gUnknown_203ADF8
	ldrb r0, [r5]
	ldr r4, _08110FFC @ =gUnknown_203AE98
	adds r1, r4, 0
	bl sub_811175C
	bl sub_8113B88
	movs r2, 0x80
	lsls r2, 1
	movs r0, 0x1
	adds r1, r4, 0
	bl sub_8112940
	ldrb r0, [r5]
	bl sub_8111150
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08110FF8: .4byte gUnknown_203ADF8
_08110FFC: .4byte gUnknown_203AE98
	thumb_func_end sub_8110FCC

	thumb_func_start sub_8111000
sub_8111000: @ 8111000
	push {lr}
	movs r0, 0x4
	bl stdpal_get
	movs r1, 0xF0
	movs r2, 0x20
	bl LoadPalette
	movs r0, 0x2
	bl sub_81109CC
	bl sub_807DF64
	ldr r2, _08111034 @ =gUnknown_203AE94
	movs r0, 0
	str r0, [r2]
	ldrb r1, [r2]
	subs r0, 0x10
	ands r0, r1
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r2]
	movs r0, 0x1
	pop {r1}
	bx r1
	.align 2, 0
_08111034: .4byte gUnknown_203AE94
	thumb_func_end sub_8111000

	thumb_func_start sub_8111038
sub_8111038: @ 8111038
	push {lr}
	movs r0, 0x4
	bl stdpal_get
	movs r1, 0xF0
	movs r2, 0x20
	bl LoadPalette
	movs r0, 0x2
	bl sub_81109CC
	bl sub_807DF7C
	ldr r2, _0811106C @ =gUnknown_203AE94
	movs r0, 0
	str r0, [r2]
	ldrb r1, [r2]
	subs r0, 0x10
	ands r0, r1
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r2]
	movs r0, 0x1
	pop {r1}
	bx r1
	.align 2, 0
_0811106C: .4byte gUnknown_203AE94
	thumb_func_end sub_8111038

	thumb_func_start sub_8111070
sub_8111070: @ 8111070
	push {r4-r7,lr}
	sub sp, 0x14
	lsls r0, 24
	lsrs r7, r0, 24
	movs r5, 0
_0811107A:
	lsls r4, r5, 3
	ldr r0, _0811111C @ =gUnknown_845661C
	adds r4, r0
	adds r0, r4, 0
	bl AddWindow
	ldr r6, _08111120 @ =gUnknown_203ADFE
	adds r1, r5, r6
	strb r0, [r1]
	ldrb r0, [r1]
	ldrb r1, [r4, 0x3]
	lsls r1, 3
	str r1, [sp]
	ldrb r1, [r4, 0x4]
	lsls r1, 3
	str r1, [sp, 0x4]
	movs r1, 0xF
	movs r2, 0
	movs r3, 0
	bl FillWindowPixelRect
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x2
	bls _0811107A
	ldr r5, _08111124 @ =gStringVar4
	ldr r1, _08111128 @ =gUnknown_841A155
	adds r0, r5, 0
	bl StringExpandPlaceholders
	cmp r7, 0
	beq _081110D2
	ldr r4, _0811112C @ =gStringVar1
	adds r0, r4, 0
	adds r1, r7, 0
	movs r2, 0
	movs r3, 0x1
	bl ConvertIntToDecimalStringN
	adds r0, r5, 0
	adds r1, r4, 0
	bl StringAppend
_081110D2:
	ldrb r0, [r6]
	movs r1, 0x1
	str r1, [sp]
	movs r1, 0x2
	str r1, [sp, 0x4]
	ldr r1, _08111130 @ =gUnknown_8456634
	str r1, [sp, 0x8]
	movs r1, 0
	str r1, [sp, 0xC]
	str r5, [sp, 0x10]
	movs r1, 0x2
	movs r2, 0x2
	movs r3, 0x2
	bl AddTextPrinterParametrized2
	ldrb r0, [r6]
	bl PutWindowTilemap
	ldrb r0, [r6, 0x1]
	bl PutWindowTilemap
	ldrb r0, [r6]
	movs r1, 0x2
	bl CopyWindowToVram
	ldrb r0, [r6, 0x2]
	movs r1, 0x2
	bl CopyWindowToVram
	ldrb r0, [r6, 0x1]
	movs r1, 0x3
	bl CopyWindowToVram
	add sp, 0x14
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0811111C: .4byte gUnknown_845661C
_08111120: .4byte gUnknown_203ADFE
_08111124: .4byte gStringVar4
_08111128: .4byte gUnknown_841A155
_0811112C: .4byte gStringVar1
_08111130: .4byte gUnknown_8456634
	thumb_func_end sub_8111070

	thumb_func_start sub_8111134
sub_8111134: @ 8111134
	push {r4,lr}
	ldr r4, _0811114C @ =gUnknown_203ADFE
	ldrb r0, [r4, 0x1]
	bl PutWindowTilemap
	ldrb r0, [r4, 0x1]
	movs r1, 0x1
	bl CopyWindowToVram
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0811114C: .4byte gUnknown_203ADFE
	thumb_func_end sub_8111134

	thumb_func_start sub_8111150
sub_8111150: @ 8111150
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _081111A8 @ =gSaveBlock1Ptr
	movs r1, 0xCD
	lsls r1, 3
	muls r0, r1
	movs r1, 0x98
	lsls r1, 5
	adds r0, r1
	ldr r1, [r2]
	adds r5, r1, r0
	movs r4, 0
	mov r9, r2
	mov r6, r9
	movs r2, 0x8D
	lsls r2, 3
	mov r12, r2
	ldr r7, _081111AC @ =0x000008e4
	mov r8, r7
_08111180:
	lsls r0, r4, 2
	adds r3, r5, r0
	ldr r2, _081111B0 @ =0x00000469
	adds r1, r3, r2
	ldrb r1, [r1]
	lsls r1, 31
	mov r10, r0
	cmp r1, 0
	beq _081111B4
	ldr r1, [r6]
	lsls r2, r4, 1
	adds r0, r2, r4
	lsls r0, 3
	adds r1, r0
	mov r7, r12
	adds r0, r3, r7
	ldrb r0, [r0]
	negs r0, r0
	b _081111C4
	.align 2, 0
_081111A8: .4byte gSaveBlock1Ptr
_081111AC: .4byte 0x000008e4
_081111B0: .4byte 0x00000469
_081111B4:
	ldr r1, [r6]
	lsls r2, r4, 1
	adds r0, r2, r4
	lsls r0, 3
	adds r1, r0
	mov r7, r12
	adds r0, r3, r7
	ldrb r0, [r0]
_081111C4:
	add r1, r8
	strh r0, [r1]
	adds r3, r2, 0
	mov r0, r10
	adds r2, r5, r0
	ldr r1, _081111F0 @ =0x0000046a
	adds r0, r2, r1
	ldrb r0, [r0]
	lsls r0, 30
	cmp r0, 0
	bge _081111F4
	ldr r1, [r6]
	adds r0, r3, r4
	lsls r0, 3
	adds r1, r0
	mov r7, r12
	adds r0, r2, r7
	ldr r0, [r0]
	lsls r0, 15
	lsrs r0, 24
	negs r0, r0
	b _08111206
	.align 2, 0
_081111F0: .4byte 0x0000046a
_081111F4:
	ldr r1, [r6]
	adds r0, r3, r4
	lsls r0, 3
	adds r1, r0
	mov r7, r12
	adds r0, r2, r7
	ldr r0, [r0]
	lsls r0, 15
	lsrs r0, 24
_08111206:
	ldr r2, _08111260 @ =0x000008e6
	adds r1, r2
	strh r0, [r1]
	ldr r1, [r6]
	adds r3, r4
	lsls r3, 3
	adds r1, r3
	mov r7, r10
	adds r2, r5, r7
	ldr r7, _08111264 @ =0x0000046a
	adds r0, r2, r7
	ldrb r0, [r0]
	lsrs r0, 2
	ldr r7, _08111268 @ =0x000008e8
	adds r1, r7
	strb r0, [r1]
	ldr r0, [r6]
	adds r0, r3
	ldr r1, _0811126C @ =0x0000046b
	adds r2, r1
	ldrb r1, [r2]
	ldr r2, _08111270 @ =0x000008e9
	adds r0, r2
	strb r1, [r0]
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x3F
	bls _08111180
	mov r7, r9
	ldr r1, [r7]
	movs r0, 0x8E
	lsls r0, 4
	adds r1, r0
	adds r0, r5, 0
	bl sub_815A1F8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08111260: .4byte 0x000008e6
_08111264: .4byte 0x0000046a
_08111268: .4byte 0x000008e8
_0811126C: .4byte 0x0000046b
_08111270: .4byte 0x000008e9
	thumb_func_end sub_8111150

	thumb_func_start sub_8111274
sub_8111274: @ 8111274
	push {r4,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 24
	cmp r1, 0
	bne _081112D4
	ldr r3, _081112C8 @ =gSaveBlock1Ptr
	ldr r2, [r3]
	movs r0, 0xCD
	lsls r0, 3
	adds r1, r4, 0
	muls r1, r0
	adds r0, r2, r1
	ldr r4, _081112CC @ =0x00001301
	adds r0, r4
	ldrb r0, [r0]
	strb r0, [r2, 0x4]
	ldr r2, [r3]
	adds r0, r2, r1
	adds r4, 0x1
	adds r0, r4
	ldrb r0, [r0]
	strb r0, [r2, 0x5]
	ldr r2, [r3]
	adds r0, r2, r1
	adds r4, 0x1
	adds r0, r4
	ldrb r0, [r0]
	strb r0, [r2, 0x6]
	ldr r2, [r3]
	adds r1, r2, r1
	ldr r3, _081112D0 @ =0x00001304
	adds r0, r1, r3
	ldrh r0, [r0]
	strh r0, [r2]
	adds r4, 0x3
	adds r1, r4
	ldrh r0, [r1]
	strh r0, [r2, 0x2]
	b _08111336
	.align 2, 0
_081112C8: .4byte gSaveBlock1Ptr
_081112CC: .4byte 0x00001301
_081112D0: .4byte 0x00001304
_081112D4:
	ldr r0, _08111340 @ =gSaveBlock1Ptr
	ldr r3, [r0]
	movs r0, 0xCD
	lsls r0, 3
	muls r0, r4
	adds r3, r0
	ldr r1, _08111344 @ =0x00001301
	adds r0, r3, r1
	ldrb r2, [r0]
	ldr r0, _08111348 @ =0xffffff00
	ldr r1, [sp]
	ands r1, r0
	orrs r1, r2
	str r1, [sp]
	ldr r2, _0811134C @ =0x00001302
	adds r0, r3, r2
	ldrb r0, [r0]
	lsls r0, 8
	ldr r2, _08111350 @ =0xffff00ff
	ands r2, r1
	orrs r2, r0
	str r2, [sp]
	ldr r4, _08111354 @ =0x00001303
	adds r0, r3, r4
	ldrb r1, [r0]
	lsls r1, 16
	ldr r0, _08111358 @ =0xff00ffff
	ands r0, r2
	orrs r0, r1
	str r0, [sp]
	ldr r1, _0811135C @ =0x00001304
	adds r0, r3, r1
	ldrh r1, [r0]
	ldr r0, _08111360 @ =0xffff0000
	ldr r2, [sp, 0x4]
	ands r2, r0
	orrs r2, r1
	str r2, [sp, 0x4]
	adds r4, 0x3
	adds r3, r4
	ldrh r1, [r3]
	lsls r1, 16
	ldr r0, _08111364 @ =0x0000ffff
	ands r0, r2
	orrs r0, r1
	str r0, [sp, 0x4]
	mov r0, sp
	bl sub_8055D5C
_08111336:
	add sp, 0x8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08111340: .4byte gSaveBlock1Ptr
_08111344: .4byte 0x00001301
_08111348: .4byte 0xffffff00
_0811134C: .4byte 0x00001302
_08111350: .4byte 0xffff00ff
_08111354: .4byte 0x00001303
_08111358: .4byte 0xff00ffff
_0811135C: .4byte 0x00001304
_08111360: .4byte 0xffff0000
_08111364: .4byte 0x0000ffff
	thumb_func_end sub_8111274

	thumb_func_start sub_8111368
sub_8111368: @ 8111368
	push {lr}
	ldr r1, _081113A0 @ =gUnknown_203ADFA
	movs r0, 0x2
	strb r0, [r1]
	bl sub_806E6FC
	bl sub_809A2DC
	bl sub_809A2A4
	bl sub_8110AC8
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _081113B4
	ldr r0, _081113A4 @ =gUnknown_203ADF8
	ldrb r0, [r0]
	movs r1, 0
	bl sub_8111274
	ldr r1, _081113A8 @ =gUnknown_3005024
	ldr r0, _081113AC @ =sub_8111038
	str r0, [r1]
	ldr r0, _081113B0 @ =sub_80572A8
	bl SetMainCallback2
	b _081113CE
	.align 2, 0
_081113A0: .4byte gUnknown_203ADFA
_081113A4: .4byte gUnknown_203ADF8
_081113A8: .4byte gUnknown_3005024
_081113AC: .4byte sub_8111038
_081113B0: .4byte sub_80572A8
_081113B4:
	ldr r0, _081113D4 @ =gUnknown_203ADF8
	ldrb r0, [r0]
	movs r1, 0x1
	bl sub_8111274
	bl warp_in
	ldr r1, _081113D8 @ =gUnknown_3005024
	ldr r0, _081113DC @ =sub_8111000
	str r0, [r1]
	ldr r0, _081113E0 @ =sub_805726C
	bl SetMainCallback2
_081113CE:
	pop {r0}
	bx r0
	.align 2, 0
_081113D4: .4byte gUnknown_203ADF8
_081113D8: .4byte gUnknown_3005024
_081113DC: .4byte sub_8111000
_081113E0: .4byte sub_805726C
	thumb_func_end sub_8111368

	thumb_func_start sub_81113E4
sub_81113E4: @ 81113E4
	push {r4,r5,lr}
	ldr r4, _08111430 @ =gSaveBlock1Ptr
	ldr r0, _08111434 @ =gUnknown_203ADF8
	ldrb r1, [r0]
	movs r0, 0xCD
	lsls r0, 3
	muls r0, r1
	movs r1, 0x98
	lsls r1, 5
	adds r0, r1
	ldr r1, [r4]
	adds r5, r1, r0
	movs r2, 0xA4
	lsls r2, 1
	adds r0, r5, r2
	movs r2, 0xEE
	lsls r2, 4
	adds r1, r2
	movs r2, 0x90
	bl CpuSet
	movs r1, 0x9A
	lsls r1, 2
	adds r0, r5, r1
	ldr r1, [r4]
	movs r2, 0x80
	lsls r2, 5
	adds r1, r2
	movs r2, 0x80
	lsls r2, 1
	bl CpuSet
	bl sub_8111688
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08111430: .4byte gSaveBlock1Ptr
_08111434: .4byte gUnknown_203ADF8
	thumb_func_end sub_81113E4

	thumb_func_start sub_8111438
sub_8111438: @ 8111438
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x14
	movs r0, 0x68
	bl AllocZeroed
	mov r9, r0
	movs r0, 0
	str r0, [sp]
	str r0, [sp, 0x4]
	str r0, [sp, 0x8]
	str r0, [sp, 0xC]
	mov r0, r9
	movs r1, 0x13
	movs r2, 0x1
	movs r3, 0x20
	bl CreateMon
	ldr r0, _081114BC @ =0x00004027
	bl VarGet
	lsls r0, 16
	lsrs r1, r0, 28
	mov r6, r9
	adds r6, 0x64
	strh r1, [r6]
	lsls r0, 4
	lsrs r0, 20
	mov r4, r9
	adds r4, 0x66
	strh r0, [r4]
	bl sub_8111618
	lsls r0, 16
	lsrs r5, r0, 16
	ldrh r0, [r6]
	cmp r5, r0
	bls _081114C4
	movs r3, 0
	subs r0, r5, r0
	mov r8, r4
	cmp r3, r0
	bge _0811150E
_08111492:
	movs r0, 0x5
	subs r0, r3
	movs r1, 0x64
	muls r0, r1
	ldr r1, _081114C0 @ =gPlayerParty
	adds r0, r1
	str r3, [sp, 0x10]
	bl ZeroMonData
	ldr r3, [sp, 0x10]
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	mov r0, r9
	adds r0, 0x64
	ldrh r0, [r0]
	subs r0, r5, r0
	cmp r3, r0
	blt _08111492
	b _0811150E
	.align 2, 0
_081114BC: .4byte 0x00004027
_081114C0: .4byte gPlayerParty
_081114C4:
	mov r8, r4
	cmp r5, r0
	bcs _0811150E
	movs r3, 0
	adds r4, r6, 0
_081114CE:
	lsls r1, r3, 24
	lsrs r1, 24
	movs r0, 0
	str r3, [sp, 0x10]
	bl sub_808BCB4
	ldr r3, [sp, 0x10]
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0x4
	bls _081114CE
	adds r3, r5, 0
	ldrh r0, [r4]
	cmp r3, r0
	bcs _0811150E
_081114EE:
	movs r0, 0x64
	muls r0, r3
	ldr r1, _08111574 @ =gPlayerParty
	adds r0, r1
	mov r1, r9
	movs r2, 0x64
	str r3, [sp, 0x10]
	bl CopyMon
	ldr r3, [sp, 0x10]
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	ldrh r1, [r4]
	cmp r3, r1
	bcc _081114EE
_0811150E:
	bl sub_811164C
	lsls r0, 16
	lsrs r5, r0, 16
	mov r1, r8
	ldrh r0, [r1]
	cmp r5, r0
	bls _08111578
	movs r3, 0
_08111520:
	movs r6, 0
	lsls r7, r3, 24
	lsrs r7, 24
_08111526:
	lsls r0, r6, 24
	lsrs r4, r0, 24
	adds r0, r7, 0
	adds r1, r4, 0
	movs r2, 0x5
	str r3, [sp, 0x10]
	bl GetBoxMonDataFromAnyBox
	ldr r3, [sp, 0x10]
	cmp r0, 0
	beq _08111554
	adds r0, r7, 0
	adds r1, r4, 0
	bl sub_808BCB4
	subs r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	ldr r3, [sp, 0x10]
	mov r0, r8
	ldrh r0, [r0]
	cmp r5, r0
	beq _081115D2
_08111554:
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r6, 0x1D
	bls _08111526
	mov r1, r8
	ldrh r1, [r1]
	cmp r5, r1
	beq _081115D2
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0xD
	bls _08111520
	b _081115D2
	.align 2, 0
_08111574: .4byte gPlayerParty
_08111578:
	cmp r5, r0
	bcs _081115D2
	movs r3, 0
_0811157E:
	movs r6, 0
	lsls r7, r3, 24
_08111582:
	lsls r1, r6, 24
	lsrs r1, 24
	lsrs r0, r7, 24
	str r3, [sp, 0x10]
	bl GetBoxedMonPtr
	adds r4, r0, 0
	movs r1, 0x5
	bl GetBoxMonData
	ldr r3, [sp, 0x10]
	cmp r0, 0
	bne _081115B6
	adds r0, r4, 0
	mov r1, r9
	movs r2, 0x50
	bl CopyMon
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	ldr r3, [sp, 0x10]
	mov r0, r8
	ldrh r0, [r0]
	cmp r5, r0
	beq _081115D2
_081115B6:
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r6, 0x1D
	bls _08111582
	mov r1, r8
	ldrh r1, [r1]
	cmp r5, r1
	beq _081115D2
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0xD
	bls _0811157E
_081115D2:
	mov r0, r9
	bl Free
	add sp, 0x14
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8111438

	thumb_func_start sub_81115E8
sub_81115E8: @ 81115E8
	push {r4,lr}
	bl sub_8111618
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	bl sub_811164C
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	ldr r0, _08111614 @ =0x00004027
	lsls r4, 12
	adds r1, r4
	lsls r1, 16
	lsrs r1, 16
	bl VarSet
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08111614: .4byte 0x00004027
	thumb_func_end sub_81115E8

	thumb_func_start sub_8111618
sub_8111618: @ 8111618
	push {r4,r5,lr}
	movs r5, 0
	movs r4, 0
_0811161E:
	movs r0, 0x64
	muls r0, r4
	ldr r1, _08111648 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x5
	bl GetMonData
	cmp r0, 0
	beq _08111636
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
_08111636:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x5
	bls _0811161E
	adds r0, r5, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08111648: .4byte gPlayerParty
	thumb_func_end sub_8111618

	thumb_func_start sub_811164C
sub_811164C: @ 811164C
	push {r4-r7,lr}
	movs r6, 0
	movs r0, 0
_08111652:
	movs r4, 0
	lsls r5, r0, 24
	adds r7, r0, 0x1
_08111658:
	lsls r1, r4, 24
	lsrs r1, 24
	lsrs r0, r5, 24
	movs r2, 0x5
	bl GetBoxMonDataFromAnyBox
	cmp r0, 0
	beq _0811166E
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
_0811166E:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x1D
	bls _08111658
	lsls r0, r7, 16
	lsrs r0, 16
	cmp r0, 0xD
	bls _08111652
	adds r0, r6, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_811164C

	thumb_func_start sub_8111688
sub_8111688: @ 8111688
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x8
	movs r5, 0
	ldr r0, _081116CC @ =gSaveBlock1Ptr
	mov r8, r0
	ldr r7, _081116D0 @ =0x0000063a
_08111698:
	ldr r1, _081116D4 @ =0x000040aa
	adds r0, r5, r1
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r1, r5, 1
	add r1, sp
	strh r0, [r1]
	movs r4, 0
	adds r6, r5, 0x1
	adds r3, r1, 0
	lsls r5, 4
_081116B2:
	ldrh r0, [r3]
	movs r2, 0x1
	ands r2, r0
	cmp r2, 0
	beq _081116D8
	mov r1, r8
	ldr r0, [r1]
	adds r1, r5, r4
	adds r0, r7
	adds r0, r1
	movs r1, 0x1E
	strb r1, [r0]
	b _081116E4
	.align 2, 0
_081116CC: .4byte gSaveBlock1Ptr
_081116D0: .4byte 0x0000063a
_081116D4: .4byte 0x000040aa
_081116D8:
	mov r1, r8
	ldr r0, [r1]
	adds r1, r5, r4
	adds r0, r7
	adds r0, r1
	strb r2, [r0]
_081116E4:
	ldrh r0, [r3]
	lsrs r0, 1
	strh r0, [r3]
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0xF
	bls _081116B2
	lsls r0, r6, 16
	lsrs r5, r0, 16
	cmp r5, 0x3
	bls _08111698
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8111688

	thumb_func_start sub_8111708
sub_8111708: @ 8111708
	push {r4,r5,lr}
	sub sp, 0x1C
	ldr r0, _08111754 @ =0x000040ae
	bl VarGet
	ldr r4, _08111758 @ =gSaveBlock1Ptr
	ldr r1, [r4]
	strh r0, [r1, 0x32]
	lsls r0, 16
	cmp r0, 0
	bne _0811174A
	movs r0, 0x4
	ldrsb r0, [r1, r0]
	lsls r0, 16
	lsrs r0, 16
	ldrb r1, [r1, 0x5]
	lsls r1, 24
	asrs r1, 24
	lsls r1, 16
	lsrs r1, 16
	bl get_mapheader_by_bank_and_number
	mov r1, sp
	ldm r0!, {r2,r3,r5}
	stm r1!, {r2,r3,r5}
	ldm r0!, {r2,r3,r5}
	stm r1!, {r2,r3,r5}
	ldr r0, [r0]
	str r0, [r1]
	ldr r1, [r4]
	mov r0, sp
	ldrh r0, [r0, 0x12]
	strh r0, [r1, 0x32]
_0811174A:
	add sp, 0x1C
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08111754: .4byte 0x000040ae
_08111758: .4byte gSaveBlock1Ptr
	thumb_func_end sub_8111708

	thumb_func_start sub_811175C
sub_811175C: @ 811175C
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	mov r8, r1
	lsls r0, 24
	lsrs r4, r0, 24
	movs r6, 0
	mov r9, r6
	movs r2, 0x80
	lsls r2, 1
	mov r0, r8
	movs r1, 0
	bl memset
	movs r7, 0
	ldr r2, _081117B8 @ =gUnknown_203AE0C
	movs r1, 0
_08111780:
	lsls r0, r7, 2
	adds r0, r2
	str r1, [r0]
	adds r0, r7, 0x1
	lsls r0, 16
	lsrs r7, r0, 16
	cmp r7, 0x1F
	bls _08111780
	ldr r1, _081117BC @ =gSaveBlock1Ptr
	movs r0, 0xCD
	lsls r0, 3
	muls r0, r4
	ldr r1, [r1]
	adds r0, r1
	ldr r1, _081117C0 @ =0x00001868
	adds r4, r0, r1
	movs r7, 0
_081117A2:
	ldrh r0, [r4]
	ldr r1, _081117C4 @ =0x00000fff
	ands r1, r0
	cmp r1, 0x29
	bls _081117AE
	b _081118AC
_081117AE:
	lsls r0, r1, 2
	ldr r1, _081117C8 @ =_081117CC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081117B8: .4byte gUnknown_203AE0C
_081117BC: .4byte gSaveBlock1Ptr
_081117C0: .4byte 0x00001868
_081117C4: .4byte 0x00000fff
_081117C8: .4byte _081117CC
	.align 2, 0
_081117CC:
	.4byte _08111874
	.4byte _08111880
	.4byte _08111880
	.4byte _081118AC
	.4byte _081118AC
	.4byte _081118AC
	.4byte _081118AC
	.4byte _081118AC
	.4byte _081118AC
	.4byte _081118AC
	.4byte _081118AC
	.4byte _081118AC
	.4byte _081118AC
	.4byte _081118AC
	.4byte _081118AC
	.4byte _081118AC
	.4byte _081118AC
	.4byte _081118AC
	.4byte _081118AC
	.4byte _081118AC
	.4byte _081118AC
	.4byte _081118AC
	.4byte _081118AC
	.4byte _081118AC
	.4byte _081118AC
	.4byte _081118AC
	.4byte _081118AC
	.4byte _081118AC
	.4byte _081118AC
	.4byte _081118AC
	.4byte _081118AC
	.4byte _081118AC
	.4byte _081118AC
	.4byte _081118AC
	.4byte _081118AC
	.4byte _081118AC
	.4byte _081118AC
	.4byte _081118AC
	.4byte _081118AC
	.4byte _0811188C
	.4byte _081118AC
	.4byte _08111898
_08111874:
	lsls r1, r6, 3
	add r1, r8
	adds r0, r4, 0
	bl sub_8113D08
	b _081118A2
_08111880:
	lsls r1, r6, 3
	add r1, r8
	adds r0, r4, 0
	bl sub_8113D94
	b _081118A2
_0811188C:
	lsls r1, r6, 3
	add r1, r8
	adds r0, r4, 0
	bl sub_8113C20
	b _081118A2
_08111898:
	lsls r1, r6, 3
	add r1, r8
	adds r0, r4, 0
	bl sub_8113C8C
_081118A2:
	adds r4, r0, 0
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	b _081118D2
_081118AC:
	mov r0, r9
	lsls r1, r0, 2
	ldr r5, _081118F0 @ =gUnknown_203AE0C
	adds r1, r5
	adds r0, r4, 0
	bl sub_8113A78
	adds r4, r0, 0
	mov r1, r9
	cmp r1, 0
	bne _081118C8
	ldr r0, [r5]
	bl sub_8113ABC
_081118C8:
	mov r0, r9
	adds r0, 0x1
	lsls r0, 16
	lsrs r0, 16
	mov r9, r0
_081118D2:
	cmp r4, 0
	beq _081118E2
	adds r0, r7, 0x1
	lsls r0, 16
	lsrs r7, r0, 16
	cmp r7, 0x1F
	bhi _081118E2
	b _081117A2
_081118E2:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081118F0: .4byte gUnknown_203AE0C
	thumb_func_end sub_811175C

	thumb_func_start sub_81118F4
sub_81118F4: @ 81118F4
	push {lr}
	adds r1, r0, 0
	lsls r1, 24
	asrs r1, 24
	movs r0, 0x1
	bl fade_screen
	ldr r1, _0811190C @ =gUnknown_203AE8C
	ldr r0, _08111910 @ =sub_8111914
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0811190C: .4byte gUnknown_203AE8C
_08111910: .4byte sub_8111914
	thumb_func_end sub_81118F4

	thumb_func_start sub_8111914
sub_8111914: @ 8111914
	push {lr}
	ldr r0, _08111960 @ =gUnknown_2037AB8
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0811197A
	bl ScriptContext2_Enable
	ldr r1, _08111964 @ =gUnknown_203ADF8
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	bhi _08111970
	ldr r0, _08111968 @ =gSaveBlock1Ptr
	ldr r0, [r0]
	ldrb r2, [r1]
	movs r1, 0xCD
	lsls r1, 3
	muls r1, r2
	adds r0, r1
	movs r1, 0x98
	lsls r1, 5
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _08111970
	ldr r1, _0811196C @ =gUnknown_203ADF9
	ldrb r0, [r1]
	subs r0, 0x1
	strb r0, [r1]
	bl sub_8111368
	b _0811197A
	.align 2, 0
_08111960: .4byte gUnknown_2037AB8
_08111964: .4byte gUnknown_203ADF8
_08111968: .4byte gSaveBlock1Ptr
_0811196C: .4byte gUnknown_203ADF9
_08111970:
	ldr r1, _08111980 @ =gUnknown_3005E88
	movs r0, 0
	strb r0, [r1]
	bl sub_8111984
_0811197A:
	pop {r0}
	bx r0
	.align 2, 0
_08111980: .4byte gUnknown_3005E88
	thumb_func_end sub_8111914

	thumb_func_start sub_8111984
sub_8111984: @ 8111984
	push {lr}
	bl sub_806E6FC
	bl ResetSaveCounters
	movs r0, 0
	bl sub_80DA4FC
	ldr r0, _081119B4 @ =sub_8057430
	bl SetMainCallback2
	ldr r1, _081119B8 @ =gUnknown_3005024
	ldr r0, _081119BC @ =sub_8111F60
	str r0, [r1]
	bl FreeAllWindowBuffers
	ldr r1, _081119C0 @ =gUnknown_203ADFA
	movs r0, 0x3
	strb r0, [r1]
	ldr r1, _081119C4 @ =gUnknown_203AE8C
	movs r0, 0
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_081119B4: .4byte sub_8057430
_081119B8: .4byte gUnknown_3005024
_081119BC: .4byte sub_8111F60
_081119C0: .4byte gUnknown_203ADFA
_081119C4: .4byte gUnknown_203AE8C
	thumb_func_end sub_8111984

	thumb_func_start sub_81119C8
sub_81119C8: @ 81119C8
	push {lr}
	bl sub_8111914
	pop {r0}
	bx r0
	thumb_func_end sub_81119C8

	thumb_func_start sub_81119D4
sub_81119D4: @ 81119D4
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _081119E8 @ =gUnknown_203ADFA
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _081119EC
	cmp r0, 0x2
	beq _081119F2
	b _08111A2C
	.align 2, 0
_081119E8: .4byte gUnknown_203ADFA
_081119EC:
	bl sub_8112364
	b _08111A2C
_081119F2:
	ldr r1, _08111A20 @ =gUnknown_3005E88
	movs r0, 0x3
	strb r0, [r1]
	ldr r0, _08111A24 @ =sub_8111A34
	movs r1, 0x50
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08111A28 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r2, 0
	strh r2, [r1, 0x8]
	strh r2, [r1, 0xA]
	movs r1, 0xE
	adds r2, r4, 0
	bl SetWordTaskArg
	movs r0, 0x1
	b _08111A2E
	.align 2, 0
_08111A20: .4byte gUnknown_3005E88
_08111A24: .4byte sub_8111A34
_08111A28: .4byte gTasks
_08111A2C:
	movs r0, 0
_08111A2E:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_81119D4

	thumb_func_start sub_8111A34
sub_8111A34: @ 8111A34
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _08111A54 @ =gTasks+0x8
	adds r4, r0, r1
	movs r0, 0x2
	ldrsh r1, [r4, r0]
	cmp r1, 0
	beq _08111A58
	cmp r1, 0x1
	beq _08111A90
	b _08111AC0
	.align 2, 0
_08111A54: .4byte gTasks+0x8
_08111A58:
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x7F
	bne _08111AC0
	movs r0, 0x1
	negs r0, r0
	str r1, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r2, _08111A8C @ =gUnknown_203AE94
	ldrb r1, [r2]
	movs r0, 0x3F
	ands r0, r1
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2]
	ldrh r0, [r4, 0x2]
	adds r0, 0x1
	strh r0, [r4, 0x2]
	b _08111AC0
	.align 2, 0
_08111A8C: .4byte gUnknown_203AE94
_08111A90:
	ldr r0, _08111AC8 @ =gUnknown_2037AB8
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	bne _08111AC0
	ldr r0, _08111ACC @ =gUnknown_3005E88
	strb r1, [r0]
	adds r0, r5, 0
	movs r1, 0xE
	bl GetWordTaskArg
	cmp r0, 0
	beq _08111AB4
	bl _call_via_r0
_08111AB4:
	adds r0, r5, 0
	bl DestroyTask
	ldr r1, _08111AD0 @ =gUnknown_203AE8C
	ldr r0, _08111AD4 @ =sub_8111914
	str r0, [r1]
_08111AC0:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08111AC8: .4byte gUnknown_2037AB8
_08111ACC: .4byte gUnknown_3005E88
_08111AD0: .4byte gUnknown_203AE8C
_08111AD4: .4byte sub_8111914
	thumb_func_end sub_8111A34

	thumb_func_start sub_8111AD8
sub_8111AD8: @ 8111AD8
	push {r4,r5,lr}
	ldr r4, _08111B58 @ =gUnknown_203AE94
	ldrb r1, [r4]
	movs r0, 0xF
	ands r0, r1
	cmp r0, 0x1
	bne _08111B0A
	ldrb r0, [r4, 0x2]
	subs r0, 0x1
	strb r0, [r4, 0x2]
	lsls r0, 24
	cmp r0, 0
	bne _08111B78
	movs r0, 0x10
	negs r0, r0
	ands r0, r1
	movs r1, 0x31
	negs r1, r1
	ands r0, r1
	movs r1, 0x10
	orrs r0, r1
	strb r0, [r4]
	movs r0, 0x2
	bl sub_8112888
_08111B0A:
	ldrb r1, [r4]
	movs r0, 0x30
	ands r0, r1
	cmp r0, 0x10
	bne _08111B34
	ldrb r0, [r4, 0x3]
	adds r0, 0x1
	strb r0, [r4, 0x3]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xF
	bls _08111B34
	bl sub_8111E20
	ldrb r0, [r4]
	movs r1, 0x31
	negs r1, r1
	ands r1, r0
	strb r1, [r4]
	movs r0, 0
	strb r0, [r4, 0x3]
_08111B34:
	ldr r4, _08111B58 @ =gUnknown_203AE94
	ldrb r0, [r4, 0x1]
	cmp r0, 0x1F
	bhi _08111B78
	ldr r5, _08111B5C @ =gUnknown_203AE0C
	lsls r0, 2
	adds r0, r5
	ldr r0, [r0]
	bl sub_8113B44
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08111B60
	bl sub_8111B80
	b _08111B78
	.align 2, 0
_08111B58: .4byte gUnknown_203AE94
_08111B5C: .4byte gUnknown_203AE0C
_08111B60:
	ldrb r0, [r4, 0x1]
	lsls r0, 2
	adds r0, r5
	ldr r0, [r0]
	bl sub_8113AE8
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08111B78
	bl sub_8111B80
_08111B78:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8111AD8

	thumb_func_start sub_8111B80
sub_8111B80: @ 8111B80
	push {r4,lr}
	ldr r4, _08111BCC @ =gUnknown_203AE94
	ldrb r1, [r4]
	movs r2, 0xF
	ands r2, r1
	cmp r2, 0
	bne _08111BC0
	movs r0, 0x10
	negs r0, r0
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	movs r1, 0x31
	negs r1, r1
	ands r0, r1
	strb r0, [r4]
	strb r2, [r4, 0x3]
	bl sub_8111BD4
	strb r0, [r4, 0x2]
	ldr r0, _08111BD0 @ =gUnknown_203B044
	ldrh r0, [r0, 0x2]
	cmp r0, 0
	bne _08111BB6
	ldrb r0, [r4, 0x1]
	adds r0, 0x1
	strb r0, [r4, 0x1]
_08111BB6:
	ldrb r0, [r4, 0x1]
	cmp r0, 0x20
	bhi _08111BC6
	bl sub_8111D10
_08111BC0:
	movs r0, 0x1
	bl sub_8112888
_08111BC6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08111BCC: .4byte gUnknown_203AE94
_08111BD0: .4byte gUnknown_203B044
	thumb_func_end sub_8111B80

	thumb_func_start sub_8111BD4
sub_8111BD4: @ 8111BD4
	push {r4,lr}
	movs r2, 0
	movs r1, 0
	ldr r3, _08111C0C @ =gStringVar4
	ldrb r0, [r3]
	cmp r0, 0xFF
	beq _08111C04
	ldr r4, _08111C10 @ =0x000003ff
_08111BE4:
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, 0xFE
	beq _08111BF2
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
_08111BF2:
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, r4
	bhi _08111C04
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, 0xFF
	bne _08111BE4
_08111C04:
	cmp r2, 0x13
	bhi _08111C14
	movs r0, 0x5F
	b _08111C26
	.align 2, 0
_08111C0C: .4byte gStringVar4
_08111C10: .4byte 0x000003ff
_08111C14:
	cmp r2, 0x23
	bhi _08111C1C
	movs r0, 0x7F
	b _08111C26
_08111C1C:
	cmp r2, 0x2D
	bls _08111C24
	movs r0, 0xFF
	b _08111C26
_08111C24:
	movs r0, 0xBF
_08111C26:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8111BD4

	thumb_func_start sub_8111C2C
sub_8111C2C: @ 8111C2C
	push {lr}
	ldr r0, _08111C54 @ =gUnknown_203ADFA
	ldrb r0, [r0]
	cmp r0, 0x2
	bne _08111C60
	ldr r0, _08111C58 @ =gUnknown_3005E88
	ldrb r0, [r0]
	cmp r0, 0
	beq _08111C4E
	ldr r0, _08111C5C @ =gUnknown_203AE94
	ldrb r0, [r0]
	movs r1, 0xF
	ands r1, r0
	cmp r1, 0x1
	beq _08111C4E
	cmp r1, 0x2
	bne _08111C60
_08111C4E:
	movs r0, 0x1
	b _08111C62
	.align 2, 0
_08111C54: .4byte gUnknown_203ADFA
_08111C58: .4byte gUnknown_3005E88
_08111C5C: .4byte gUnknown_203AE94
_08111C60:
	movs r0, 0
_08111C62:
	pop {r1}
	bx r1
	thumb_func_end sub_8111C2C

	thumb_func_start sub_8111C68
sub_8111C68: @ 8111C68
	push {r4,r5,lr}
	ldr r5, _08111C9C @ =gUnknown_203AE94
	ldrb r2, [r5]
	movs r4, 0xC0
	ands r4, r2
	cmp r4, 0
	bne _08111CC6
	ldr r0, _08111CA0 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r3, 0x1
	ands r3, r1
	cmp r3, 0
	beq _08111CA8
	movs r0, 0x3F
	ands r0, r2
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r5]
	ldr r0, _08111CA4 @ =gUnknown_3005E88
	strb r4, [r0]
	movs r0, 0x3
	negs r0, r0
	bl sub_81118F4
	b _08111CC6
	.align 2, 0
_08111C9C: .4byte gUnknown_203AE94
_08111CA0: .4byte gMain
_08111CA4: .4byte gUnknown_3005E88
_08111CA8:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08111CC6
	movs r0, 0x3F
	ands r0, r2
	movs r1, 0x40
	orrs r0, r1
	strb r0, [r5]
	ldr r0, _08111CCC @ =gUnknown_3005E88
	strb r3, [r0]
	movs r0, 0x3
	negs r0, r0
	bl sub_8111E64
_08111CC6:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08111CCC: .4byte gUnknown_3005E88
	thumb_func_end sub_8111C68

	thumb_func_start sub_8111CD0
sub_8111CD0: @ 8111CD0
	push {lr}
	ldr r0, _08111CE4 @ =gUnknown_203AE94
	ldrb r1, [r0]
	movs r0, 0xC0
	ands r0, r1
	cmp r0, 0
	bne _08111CE8
	movs r0, 0
	b _08111CEA
	.align 2, 0
_08111CE4: .4byte gUnknown_203AE94
_08111CE8:
	movs r0, 0x1
_08111CEA:
	pop {r1}
	bx r1
	thumb_func_end sub_8111CD0

	thumb_func_start sub_8111CF0
sub_8111CF0: @ 8111CF0
	push {lr}
	ldr r0, _08111D08 @ =gUnknown_203ADFA
	ldrb r0, [r0]
	cmp r0, 0x2
	bne _08111D02
	ldr r0, _08111D0C @ =gUnknown_203ADF9
	ldrb r0, [r0]
	bl sub_8111070
_08111D02:
	pop {r0}
	bx r0
	.align 2, 0
_08111D08: .4byte gUnknown_203ADFA
_08111D0C: .4byte gUnknown_203ADF9
	thumb_func_end sub_8111CF0

	thumb_func_start sub_8111D10
sub_8111D10: @ 8111D10
	push {r4,r5,lr}
	sub sp, 0x14
	movs r4, 0
	movs r1, 0
	ldr r2, _08111D80 @ =gStringVar4
	ldrb r0, [r2]
	ldr r5, _08111D84 @ =gUnknown_203ADFE
	cmp r0, 0xFF
	beq _08111D42
_08111D22:
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0xFE
	bne _08111D30
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
_08111D30:
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0xFF
	bhi _08111D42
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0xFF
	bne _08111D22
_08111D42:
	ldrb r0, [r5, 0x2]
	bl PutWindowTilemap
	ldrb r0, [r5, 0x2]
	bl sub_8111D90
	ldrb r0, [r5, 0x2]
	ldr r1, _08111D88 @ =gUnknown_8456698
	adds r1, r4, r1
	ldrb r3, [r1]
	movs r1, 0x1
	str r1, [sp]
	movs r2, 0
	str r2, [sp, 0x4]
	ldr r1, _08111D8C @ =gUnknown_8456634
	str r1, [sp, 0x8]
	str r2, [sp, 0xC]
	ldr r1, _08111D80 @ =gStringVar4
	str r1, [sp, 0x10]
	movs r1, 0x2
	movs r2, 0x2
	bl AddTextPrinterParametrized2
	movs r0, 0
	bl schedule_bg_copy_tilemap_to_vram
	add sp, 0x14
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08111D80: .4byte gStringVar4
_08111D84: .4byte gUnknown_203ADFE
_08111D88: .4byte gUnknown_8456698
_08111D8C: .4byte gUnknown_8456634
	thumb_func_end sub_8111D10

	thumb_func_start sub_8111D90
sub_8111D90: @ 8111D90
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	ldr r0, _08111DC0 @ =gUnknown_8456638
	mov r9, r0
	movs r0, 0xB4
	lsls r0, 5
	bl Alloc
	mov r8, r0
	cmp r0, 0
	beq _08111E0C
	movs r1, 0
_08111DB4:
	cmp r1, 0
	beq _08111DC4
	cmp r1, 0x5
	beq _08111DC8
	movs r0, 0x1
	b _08111DCA
	.align 2, 0
_08111DC0: .4byte gUnknown_8456638
_08111DC4:
	movs r0, 0
	b _08111DCA
_08111DC8:
	movs r0, 0x2
_08111DCA:
	movs r4, 0
	lsls r6, r0, 5
	lsls r0, r1, 4
	adds r7, r1, 0x1
	subs r0, r1
	lsls r5, r0, 1
_08111DD6:
	adds r1, r5, r4
	lsls r1, 5
	add r1, r8
	mov r2, r9
	adds r0, r2, r6
	ldr r2, _08111E1C @ =0x04000008
	bl CpuSet
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x1D
	bls _08111DD6
	lsls r0, r7, 24
	lsrs r1, r0, 24
	cmp r1, 0x5
	bls _08111DB4
	movs r2, 0xB4
	lsls r2, 5
	mov r0, r10
	mov r1, r8
	movs r3, 0
	bl CopyToWindowPixelBuffer
	mov r0, r8
	bl Free
_08111E0C:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08111E1C: .4byte 0x04000008
	thumb_func_end sub_8111D90

	thumb_func_start sub_8111E20
sub_8111E20: @ 8111E20
	push {r4,lr}
	sub sp, 0x8
	ldr r4, _08111E60 @ =gUnknown_203ADFE
	ldrb r0, [r4, 0x2]
	bl ClearWindowTilemap
	ldrb r0, [r4, 0x2]
	movs r1, 0xF0
	str r1, [sp]
	movs r1, 0x30
	str r1, [sp, 0x4]
	movs r1, 0xF
	movs r2, 0
	movs r3, 0
	bl FillWindowPixelRect
	ldrb r0, [r4, 0x2]
	movs r1, 0x2
	bl CopyWindowToVram
	ldrb r0, [r4, 0x1]
	bl PutWindowTilemap
	ldrb r0, [r4, 0x1]
	movs r1, 0x1
	bl CopyWindowToVram
	add sp, 0x8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08111E60: .4byte gUnknown_203ADFE
	thumb_func_end sub_8111E20

	thumb_func_start sub_8111E64
sub_8111E64: @ 8111E64
	push {lr}
	adds r1, r0, 0
	lsls r1, 24
	asrs r1, 24
	movs r0, 0x1
	bl fade_screen
	ldr r1, _08111E7C @ =gUnknown_203AE8C
	ldr r0, _08111E80 @ =sub_8111E84
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08111E7C: .4byte gUnknown_203AE8C
_08111E80: .4byte sub_8111E84
	thumb_func_end sub_8111E64

	thumb_func_start sub_8111E84
sub_8111E84: @ 8111E84
	push {r4,lr}
	ldr r0, _08111F00 @ =gUnknown_2037AB8
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08111EF8
	bl ScriptContext2_Enable
	ldr r3, _08111F04 @ =gUnknown_203ADF8
	ldrb r0, [r3]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	bhi _08111EEE
	ldr r0, _08111F08 @ =gSaveBlock1Ptr
	ldr r0, [r0]
	ldrb r2, [r3]
	movs r1, 0xCD
	lsls r1, 3
	muls r1, r2
	adds r0, r1
	movs r1, 0x98
	lsls r1, 5
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _08111EEE
	adds r4, r3, 0
_08111EBE:
	ldrb r0, [r4]
	ldr r1, _08111F0C @ =gUnknown_203AE98
	bl sub_811175C
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	bhi _08111EEE
	ldr r0, _08111F08 @ =gSaveBlock1Ptr
	ldr r1, [r0]
	ldrb r2, [r4]
	movs r0, 0xCD
	lsls r0, 3
	muls r0, r2
	adds r1, r0
	movs r0, 0x98
	lsls r0, 5
	adds r1, r0
	ldrb r0, [r1]
	cmp r0, 0
	bne _08111EBE
_08111EEE:
	ldr r1, _08111F10 @ =gUnknown_3005E88
	movs r0, 0
	strb r0, [r1]
	bl sub_8111984
_08111EF8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08111F00: .4byte gUnknown_2037AB8
_08111F04: .4byte gUnknown_203ADF8
_08111F08: .4byte gSaveBlock1Ptr
_08111F0C: .4byte gUnknown_203AE98
_08111F10: .4byte gUnknown_3005E88
	thumb_func_end sub_8111E84

	thumb_func_start sub_8111F14
sub_8111F14: @ 8111F14
	push {r4,lr}
	ldr r0, _08111F30 @ =gUnknown_203ADFA
	ldrb r0, [r0]
	cmp r0, 0x3
	bne _08111F2A
	ldr r4, _08111F34 @ =gUnknown_203AE90
	movs r0, 0x80
	lsls r0, 3
	bl AllocZeroed
	str r0, [r4]
_08111F2A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08111F30: .4byte gUnknown_203ADFA
_08111F34: .4byte gUnknown_203AE90
	thumb_func_end sub_8111F14

	thumb_func_start sub_8111F38
sub_8111F38: @ 8111F38
	push {lr}
	adds r3, r0, 0
	adds r2, r1, 0
	lsls r3, 16
	lsls r2, 16
	lsrs r2, 16
	lsrs r3, 15
	ldr r0, _08111F58 @ =gUnknown_20371F8
	adds r0, r3, r0
	ldr r1, _08111F5C @ =gUnknown_203AE90
	ldr r1, [r1]
	adds r1, r3
	bl CpuSet
	pop {r0}
	bx r0
	.align 2, 0
_08111F58: .4byte gUnknown_20371F8
_08111F5C: .4byte gUnknown_203AE90
	thumb_func_end sub_8111F38

	thumb_func_start sub_8111F60
sub_8111F60: @ 8111F60
	push {lr}
	movs r0, 0x4
	bl stdpal_get
	movs r1, 0xF0
	movs r2, 0x20
	bl LoadPalette
	movs r0, 0
	bl sub_8111070
	bl sub_807DF7C
	ldr r0, _08111F88 @ =sub_8111F8C
	movs r1, 0xFF
	bl CreateTask
	movs r0, 0x1
	pop {r1}
	bx r1
	.align 2, 0
_08111F88: .4byte sub_8111F8C
	thumb_func_end sub_8111F60

	thumb_func_start sub_8111F8C
sub_8111F8C: @ 8111F8C
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _08111FC4 @ =gTasks
	adds r4, r1, r0
	bl ScriptContext2_IsEnabled
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08111FBC
	bl player_bitmagic
	bl sub_805C270
	bl sub_805C780
	bl ScriptContext2_Enable
	ldr r0, _08111FC8 @ =sub_8111FCC
	str r0, [r4]
_08111FBC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08111FC4: .4byte gTasks
_08111FC8: .4byte sub_8111FCC
	thumb_func_end sub_8111F8C

	thumb_func_start sub_8111FCC
sub_8111FCC: @ 8111FCC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _08112024 @ =gTasks
	adds r5, r1, r0
	ldr r0, _08112028 @ =gUnknown_2037AB8
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _0811201E
	ldr r0, _0811202C @ =gUnknown_203AE94
	ldrb r1, [r0]
	movs r0, 0xC0
	ands r0, r1
	cmp r0, 0x40
	beq _0811200E
	ldr r0, _08112030 @ =gStringVar1
	ldr r1, _08112034 @ =gMapHeader
	ldrb r1, [r1, 0x14]
	bl sub_80C4DF8
	ldr r0, _08112038 @ =gStringVar4
	ldr r1, _0811203C @ =gUnknown_841B073
	bl StringExpandPlaceholders
	bl sub_8111D10
_0811200E:
	strh r4, [r5, 0x8]
	strh r4, [r5, 0xA]
	ldr r0, _08112040 @ =sub_8112044
	str r0, [r5]
	bl player_bitmagic
	bl ScriptContext2_Enable
_0811201E:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08112024: .4byte gTasks
_08112028: .4byte gUnknown_2037AB8
_0811202C: .4byte gUnknown_203AE94
_08112030: .4byte gStringVar1
_08112034: .4byte gMapHeader
_08112038: .4byte gStringVar4
_0811203C: .4byte gUnknown_841B073
_08112040: .4byte sub_8112044
	thumb_func_end sub_8111FCC

	thumb_func_start sub_8112044
sub_8112044: @ 8112044
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _0811208C @ =gTasks
	adds r4, r1, r0
	ldr r0, _08112090 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0
	bne _08112076
	ldrh r2, [r4, 0x8]
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x7E
	bgt _08112076
	ldr r0, _08112094 @ =gUnknown_203AE94
	ldrb r1, [r0]
	movs r0, 0xC0
	ands r0, r1
	cmp r0, 0x40
	bne _081120A0
_08112076:
	bl sub_8111E20
	movs r1, 0
	movs r0, 0
	strh r0, [r4, 0x8]
	ldr r0, _08112098 @ =sub_81120AC
	str r0, [r4]
	ldr r0, _0811209C @ =gUnknown_203ADFA
	strb r1, [r0]
	b _081120A4
	.align 2, 0
_0811208C: .4byte gTasks
_08112090: .4byte gMain
_08112094: .4byte gUnknown_203AE94
_08112098: .4byte sub_81120AC
_0811209C: .4byte gUnknown_203ADFA
_081120A0:
	adds r0, r2, 0x1
	strh r0, [r4, 0x8]
_081120A4:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8112044

	thumb_func_start sub_81120AC
sub_81120AC: @ 81120AC
	push {r4-r6,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _081120D0 @ =gTasks+0x8
	adds r6, r0, r1
	movs r0, 0
	ldrsh r1, [r6, r0]
	cmp r1, 0x1
	beq _08112110
	cmp r1, 0x1
	bgt _081120D4
	cmp r1, 0
	beq _081120DA
	b _08112164
	.align 2, 0
_081120D0: .4byte gTasks+0x8
_081120D4:
	cmp r1, 0x2
	beq _0811214C
	b _08112164
_081120DA:
	ldr r0, _08112104 @ =gUnknown_2031DD8
	strb r1, [r0]
	bl sub_8055DC4
	bl sub_811229C
	ldr r0, _08112108 @ =gUnknown_203ADFE
	ldrb r0, [r0]
	ldr r2, _0811210C @ =gUnknown_845661C
	ldrb r1, [r2, 0x3]
	lsls r1, 3
	str r1, [sp]
	ldrb r1, [r2, 0x4]
	lsls r1, 3
	str r1, [sp, 0x4]
	movs r1, 0xF
	movs r2, 0
	movs r3, 0
	bl FillWindowPixelRect
	b _0811215C
	.align 2, 0
_08112104: .4byte gUnknown_2031DD8
_08112108: .4byte gUnknown_203ADFE
_0811210C: .4byte gUnknown_845661C
_08112110:
	adds r0, r5, 0
	bl sub_81121D8
	lsls r0, 24
	cmp r0, 0
	beq _081121B8
	movs r5, 0
_0811211E:
	ldr r4, _08112148 @ =gUnknown_203ADFE
	adds r4, r5, r4
	ldrb r0, [r4]
	bl ClearWindowTilemap
	ldrb r0, [r4]
	movs r1, 0x1
	bl CopyWindowToVram
	ldrb r0, [r4]
	bl RemoveWindow
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x2
	bls _0811211E
	movs r0, 0
	strh r0, [r6, 0x2]
	b _0811215C
	.align 2, 0
_08112148: .4byte gUnknown_203ADFE
_0811214C:
	ldrh r1, [r6, 0x2]
	movs r2, 0x2
	ldrsh r0, [r6, r2]
	cmp r0, 0x1F
	bgt _0811215C
	adds r0, r1, 0x1
	strh r0, [r6, 0x2]
	b _081121B8
_0811215C:
	ldrh r0, [r6]
	adds r0, 0x1
	strh r0, [r6]
	b _081121B8
_08112164:
	ldr r6, _081121C0 @ =gUnknown_203AE94
	ldrb r1, [r6]
	movs r0, 0xC0
	ands r0, r1
	cmp r0, 0x40
	bne _08112176
	movs r0, 0x1
	bl sub_8098110
_08112176:
	ldr r4, _081121C4 @ =gUnknown_203AE90
	ldr r0, [r4]
	ldr r1, _081121C8 @ =gUnknown_20371F8
	movs r2, 0x80
	lsls r2, 2
	bl CpuSet
	ldr r0, [r4]
	bl Free
	movs r4, 0
	str r4, [r6]
	bl sub_80696C0
	bl ScriptContext2_Disable
	ldr r2, _081121CC @ =gTextFlags
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	ldr r0, _081121D0 @ =gUnknown_2036E28
	strb r4, [r0]
	movs r0, 0
	bl sub_8082740
	ldr r1, _081121D4 @ =gUnknown_3005ECC
	movs r0, 0x1
	strb r0, [r1]
	adds r0, r5, 0
	bl DestroyTask
_081121B8:
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081121C0: .4byte gUnknown_203AE94
_081121C4: .4byte gUnknown_203AE90
_081121C8: .4byte gUnknown_20371F8
_081121CC: .4byte gTextFlags
_081121D0: .4byte gUnknown_2036E28
_081121D4: .4byte gUnknown_3005ECC
	thumb_func_end sub_81120AC

	thumb_func_start sub_81121D8
sub_81121D8: @ 81121D8
	push {r4-r7,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _0811227C @ =gTasks+0x8
	adds r7, r1, r0
	ldrh r1, [r7, 0x2]
	movs r2, 0x2
	ldrsh r0, [r7, r2]
	cmp r0, 0xF
	bgt _08112290
	ldr r5, _08112280 @ =gUnknown_20371FA
	ldr r6, _08112284 @ =gUnknown_20375FA
	movs r4, 0xF
	subs r3, r4, r1
	lsls r3, 24
	lsrs r3, 24
	adds r0, r5, 0
	adds r1, r6, 0
	movs r2, 0xDF
	bl sub_80716F8
	movs r0, 0xFF
	lsls r0, 1
	adds r5, r0
	adds r6, r0
	movs r2, 0x80
	lsls r2, 1
	ldrb r0, [r7, 0x2]
	subs r4, r0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r5, 0
	adds r1, r6, 0
	adds r3, r4, 0
	bl sub_80716F8
	ldr r5, _08112288 @ =gUnknown_203ADFE
	ldrb r0, [r5]
	ldr r4, _0811228C @ =gUnknown_845661C
	ldrb r3, [r4, 0x4]
	lsls r3, 3
	subs r3, 0x1
	ldrh r1, [r7, 0x2]
	subs r3, r1
	lsls r3, 16
	lsrs r3, 16
	ldrb r1, [r4, 0x3]
	lsls r1, 3
	str r1, [sp]
	movs r6, 0x1
	str r6, [sp, 0x4]
	movs r1, 0
	movs r2, 0
	bl FillWindowPixelRect
	ldrb r0, [r5, 0x1]
	ldrh r3, [r7, 0x2]
	ldrb r1, [r4, 0xB]
	lsls r1, 3
	str r1, [sp]
	str r6, [sp, 0x4]
	movs r1, 0
	movs r2, 0
	bl FillWindowPixelRect
	ldrb r0, [r5]
	movs r1, 0x2
	bl CopyWindowToVram
	ldrb r0, [r5, 0x1]
	movs r1, 0x2
	bl CopyWindowToVram
	ldrh r0, [r7, 0x2]
	adds r0, 0x1
	strh r0, [r7, 0x2]
	movs r0, 0
	b _08112292
	.align 2, 0
_0811227C: .4byte gTasks+0x8
_08112280: .4byte gUnknown_20371FA
_08112284: .4byte gUnknown_20375FA
_08112288: .4byte gUnknown_203ADFE
_0811228C: .4byte gUnknown_845661C
_08112290:
	movs r0, 0x1
_08112292:
	add sp, 0x8
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_81121D8

	thumb_func_start sub_811229C
sub_811229C: @ 811229C
	push {r4-r6,lr}
	movs r0, 0x80
	lsls r0, 3
	bl Alloc
	adds r6, r0, 0
	ldr r4, _08112314 @ =gUnknown_203AE90
	ldr r0, [r4]
	movs r5, 0x80
	lsls r5, 2
	adds r1, r6, 0
	adds r2, r5, 0
	bl CpuSet
	ldr r1, [r4]
	adds r0, r1, 0
	movs r2, 0xD0
	bl sub_807B0C4
	ldr r1, [r4]
	movs r0, 0x88
	lsls r0, 2
	adds r1, r0
	adds r0, r1, 0
	movs r2, 0x10
	bl sub_807B0C4
	ldr r1, [r4]
	movs r0, 0xB0
	lsls r0, 2
	adds r1, r0
	adds r0, r1, 0
	movs r2, 0x40
	bl sub_807B0C4
	ldr r1, [r4]
	movs r0, 0xD8
	lsls r0, 2
	adds r1, r0
	adds r0, r1, 0
	movs r2, 0x50
	bl sub_807B0C4
	ldr r0, [r4]
	ldr r1, _08112318 @ =gUnknown_20371F8
	adds r2, r5, 0
	bl CpuSet
	ldr r1, [r4]
	adds r0, r6, 0
	adds r2, r5, 0
	bl CpuSet
	adds r0, r6, 0
	bl Free
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08112314: .4byte gUnknown_203AE90
_08112318: .4byte gUnknown_20371F8
	thumb_func_end sub_811229C

	thumb_func_start sub_811231C
sub_811231C: @ 811231C
	push {r4,lr}
	ldr r4, _0811234C @ =gUnknown_203ADFA
	ldrb r0, [r4]
	cmp r0, 0x1
	bne _08112346
	ldr r0, _08112350 @ =gUnknown_203AE98
	bl sub_8110E68
	bl sub_8110E3C
	movs r0, 0
	strb r0, [r4]
	ldr r0, _08112354 @ =gUnknown_203AE8C
	movs r1, 0
	str r1, [r0]
	ldr r0, _08112358 @ =gUnknown_203AE04
	str r1, [r0]
	ldr r0, _0811235C @ =gUnknown_203AE08
	str r1, [r0]
	ldr r0, _08112360 @ =gUnknown_3005E88
	strb r1, [r0]
_08112346:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0811234C: .4byte gUnknown_203ADFA
_08112350: .4byte gUnknown_203AE98
_08112354: .4byte gUnknown_203AE8C
_08112358: .4byte gUnknown_203AE04
_0811235C: .4byte gUnknown_203AE08
_08112360: .4byte gUnknown_3005E88
	thumb_func_end sub_811231C

	thumb_func_start sub_8112364
sub_8112364: @ 8112364
	push {r4,r5,lr}
	ldr r5, _081123A4 @ =gUnknown_3005E88
	ldrb r0, [r5]
	cmp r0, 0
	beq _08112392
	ldr r4, _081123A8 @ =gUnknown_203ADFA
	ldrb r0, [r4]
	cmp r0, 0x1
	bne _08112392
	ldr r0, _081123AC @ =gUnknown_203AE98
	bl sub_8110E68
	movs r0, 0x1
	bl sub_8113A1C
	bl sub_8110E3C
	movs r0, 0
	strb r0, [r5]
	strb r0, [r4]
	ldr r1, _081123B0 @ =gUnknown_203AE8C
	movs r0, 0
	str r0, [r1]
_08112392:
	ldr r0, _081123B4 @ =gUnknown_203AE04
	movs r1, 0
	str r1, [r0]
	ldr r0, _081123B8 @ =gUnknown_203AE08
	str r1, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_081123A4: .4byte gUnknown_3005E88
_081123A8: .4byte gUnknown_203ADFA
_081123AC: .4byte gUnknown_203AE98
_081123B0: .4byte gUnknown_203AE8C
_081123B4: .4byte gUnknown_203AE04
_081123B8: .4byte gUnknown_203AE08
	thumb_func_end sub_8112364

	thumb_func_start sub_81123BC
sub_81123BC: @ 81123BC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	movs r0, 0xCD
	lsls r0, 5
	bl AllocZeroed
	mov r8, r0
	ldr r0, _08112448 @ =gUnknown_203ADF8
	ldrb r4, [r0]
	movs r5, 0
	movs r6, 0
_081123D6:
	cmp r4, 0x3
	bls _081123DC
	movs r4, 0
_081123DC:
	ldr r3, _0811244C @ =gSaveBlock1Ptr
	ldr r0, [r3]
	movs r2, 0xCD
	lsls r2, 3
	adds r1, r4, 0
	muls r1, r2
	adds r0, r1
	movs r7, 0x98
	lsls r7, 5
	adds r1, r0, r7
	ldrb r0, [r1]
	cmp r0, 0
	beq _0811240A
	adds r0, r5, 0
	muls r0, r2
	add r0, r8
	str r3, [sp]
	bl memcpy
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r3, [sp]
_0811240A:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x3
	bls _081123D6
	ldr r1, _08112448 @ =gUnknown_203ADF8
	movs r0, 0x3
	ands r5, r0
	strb r5, [r1]
	ldr r1, [r3]
	movs r0, 0x98
	lsls r0, 5
	adds r1, r0
	movs r2, 0xCD
	lsls r2, 4
	mov r0, r8
	bl CpuSet
	mov r0, r8
	bl Free
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08112448: .4byte gUnknown_203ADF8
_0811244C: .4byte gSaveBlock1Ptr
	thumb_func_end sub_81123BC

	thumb_func_start sub_8112450
sub_8112450: @ 8112450
	push {lr}
	bl sub_80BF708
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08112466
	bl sub_8112364
	bl sub_81123BC
_08112466:
	pop {r0}
	bx r0
	thumb_func_end sub_8112450

	thumb_func_start sub_811246C
sub_811246C: @ 811246C
	push {r4-r6,lr}
	adds r6, r0, 0
	movs r0, 0x2E
	ldrsh r1, [r6, r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _081124B0 @ =gUnknown_2036E38
	adds r4, r0, r1
	ldrb r0, [r4, 0x8]
	cmp r0, 0xFF
	bne _081124B8
	ldr r5, _081124B4 @ =gUnknown_203AF9A
	ldrb r0, [r5]
	cmp r0, 0xFF
	beq _08112498
	adds r1, r0, 0
	adds r0, r4, 0
	bl sub_8063CA4
	movs r0, 0xFF
	strb r0, [r5]
_08112498:
	ldrb r0, [r5, 0x1]
	cmp r0, 0xFF
	beq _081124A6
	bl sub_8150454
	movs r0, 0xFF
	strb r0, [r5, 0x1]
_081124A6:
	adds r0, r4, 0
	adds r1, r6, 0
	bl sub_8063E28
	b _081124E0
	.align 2, 0
_081124B0: .4byte gUnknown_2036E38
_081124B4: .4byte gUnknown_203AF9A
_081124B8:
	ldr r5, _081124E8 @ =gUnknown_203AF9A
	ldrb r0, [r4, 0x8]
	lsls r0, 1
	adds r1, r0, r5
	ldrb r0, [r1]
	cmp r0, 0xFF
	beq _081124D8
	adds r1, r0, 0
	adds r0, r4, 0
	bl sub_8063CA4
	ldrb r0, [r4, 0x8]
	lsls r0, 1
	adds r0, r5
	movs r1, 0xFF
	strb r1, [r0]
_081124D8:
	adds r0, r4, 0
	adds r1, r6, 0
	bl sub_8063E28
_081124E0:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081124E8: .4byte gUnknown_203AF9A
	thumb_func_end sub_811246C

	thumb_func_start sub_81124EC
sub_81124EC: @ 81124EC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 24
	lsrs r1, 24
	mov r8, r1
	lsls r2, 24
	lsrs r2, 24
	mov r9, r2
	lsls r3, 24
	lsrs r3, 24
	mov r10, r3
	bl sub_8112CEC
	lsls r0, 24
	lsrs r7, r0, 24
	cmp r7, 0
	bne _0811256E
	ldr r2, _0811257C @ =gUnknown_203AF98
	ldrh r0, [r2]
	ldr r3, _08112580 @ =gUnknown_3005E94
	ldr r5, [r3]
	lsls r0, 3
	adds r0, r5
	ldr r1, _08112584 @ =gUnknown_203B01A
	mov r12, r1
	ldrh r1, [r1]
	movs r4, 0
	strh r1, [r0, 0x4]
	ldrh r0, [r2]
	lsls r0, 3
	adds r0, r5
	strb r4, [r0, 0x6]
	ldrh r0, [r2]
	ldr r1, [r3]
	lsls r0, 3
	adds r0, r1
	strb r6, [r0]
	ldrh r0, [r2]
	ldr r1, [r3]
	lsls r0, 3
	adds r0, r1
	mov r4, r8
	strb r4, [r0, 0x1]
	ldrh r0, [r2]
	ldr r1, [r3]
	lsls r0, 3
	adds r0, r1
	mov r1, r9
	strb r1, [r0, 0x2]
	ldrh r0, [r2]
	ldr r1, [r3]
	lsls r0, 3
	adds r0, r1
	mov r4, r10
	strb r4, [r0, 0x3]
	ldrh r0, [r2]
	adds r0, 0x1
	strh r0, [r2]
	mov r0, r12
	strh r7, [r0]
_0811256E:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0811257C: .4byte gUnknown_203AF98
_08112580: .4byte gUnknown_3005E94
_08112584: .4byte gUnknown_203B01A
	thumb_func_end sub_81124EC

	thumb_func_start sub_8112588
sub_8112588: @ 8112588
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	ldr r4, [sp, 0x20]
	lsls r0, 24
	lsrs r7, r0, 24
	lsls r1, 24
	lsrs r6, r1, 24
	lsls r2, 24
	lsrs r2, 24
	mov r8, r2
	lsls r3, 24
	lsrs r3, 24
	mov r9, r3
	lsls r4, 24
	lsrs r4, 24
	mov r10, r4
	bl sub_8112D1C
	lsls r0, 24
	cmp r0, 0
	bne _0811260E
	ldr r2, _0811261C @ =gUnknown_203AF98
	ldrh r0, [r2]
	ldr r3, _08112620 @ =gUnknown_3005E94
	ldr r5, [r3]
	lsls r0, 3
	adds r0, r5
	ldr r1, _08112624 @ =gUnknown_203B01A
	mov r12, r1
	ldrh r1, [r1]
	movs r4, 0
	strh r1, [r0, 0x4]
	ldrh r0, [r2]
	lsls r0, 3
	adds r0, r5
	strb r4, [r0, 0x6]
	ldrh r0, [r2]
	ldr r1, [r3]
	lsls r0, 3
	adds r0, r1
	strb r7, [r0]
	ldrh r0, [r2]
	ldr r1, [r3]
	lsls r0, 3
	adds r0, r1
	strb r6, [r0, 0x1]
	ldrh r0, [r2]
	ldr r1, [r3]
	lsls r0, 3
	adds r0, r1
	mov r4, r8
	strb r4, [r0, 0x2]
	ldrh r0, [r2]
	ldr r1, [r3]
	lsls r0, 3
	adds r0, r1
	mov r1, r9
	strb r1, [r0, 0x3]
	ldrh r0, [r2]
	adds r0, 0x1
	strh r0, [r2]
	mov r0, r10
	mov r4, r12
	strh r0, [r4]
_0811260E:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0811261C: .4byte gUnknown_203AF98
_08112620: .4byte gUnknown_3005E94
_08112624: .4byte gUnknown_203B01A
	thumb_func_end sub_8112588

	thumb_func_start sub_8112628
sub_8112628: @ 8112628
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r4, r0, 24
	mov r8, r4
	bl sub_8112CEC
	lsls r0, 24
	lsrs r7, r0, 24
	cmp r7, 0
	bne _08112692
	ldr r0, _0811269C @ =gUnknown_203B01C
	mov r12, r0
	ldrh r0, [r0]
	ldr r6, _081126A0 @ =gUnknown_3005E94
	ldr r5, [r6]
	lsls r0, 3
	adds r0, r5
	ldrb r0, [r0, 0x3]
	cmp r4, r0
	bne _08112658
	cmp r4, 0x3
	bls _08112692
_08112658:
	ldr r2, _081126A4 @ =gUnknown_203AF98
	ldrh r0, [r2]
	lsls r0, 3
	adds r0, r5
	ldr r4, _081126A8 @ =gUnknown_203B01A
	ldrh r1, [r4]
	movs r3, 0
	strh r1, [r0, 0x4]
	ldrh r0, [r2]
	lsls r0, 3
	adds r0, r5
	strb r3, [r0, 0x6]
	ldrh r0, [r2]
	ldr r1, [r6]
	lsls r0, 3
	adds r0, r1
	strb r3, [r0]
	ldrh r0, [r2]
	ldr r1, [r6]
	lsls r0, 3
	adds r0, r1
	mov r1, r8
	strb r1, [r0, 0x3]
	ldrh r0, [r2]
	mov r1, r12
	strh r0, [r1]
	adds r0, 0x1
	strh r0, [r2]
	strh r7, [r4]
_08112692:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0811269C: .4byte gUnknown_203B01C
_081126A0: .4byte gUnknown_3005E94
_081126A4: .4byte gUnknown_203AF98
_081126A8: .4byte gUnknown_203B01A
	thumb_func_end sub_8112628

	thumb_func_start sub_81126AC
sub_81126AC: @ 81126AC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r7, r0, 24
	lsls r1, 24
	lsrs r1, 24
	mov r8, r1
	bl sub_8112D1C
	lsls r0, 24
	cmp r0, 0
	bne _08112704
	ldr r2, _08112710 @ =gUnknown_203AF98
	ldrh r0, [r2]
	ldr r3, _08112714 @ =gUnknown_3005E94
	ldr r4, [r3]
	lsls r0, 3
	adds r0, r4
	ldr r6, _08112718 @ =gUnknown_203B01A
	ldrh r1, [r6]
	movs r5, 0
	strh r1, [r0, 0x4]
	ldrh r0, [r2]
	lsls r0, 3
	adds r0, r4
	strb r5, [r0, 0x6]
	ldrh r0, [r2]
	ldr r1, [r3]
	lsls r0, 3
	adds r0, r1
	strb r5, [r0]
	ldrh r0, [r2]
	ldr r1, [r3]
	lsls r0, 3
	adds r0, r1
	strb r7, [r0, 0x3]
	ldr r1, _0811271C @ =gUnknown_203B01C
	ldrh r0, [r2]
	strh r0, [r1]
	adds r0, 0x1
	strh r0, [r2]
	mov r0, r8
	strh r0, [r6]
_08112704:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08112710: .4byte gUnknown_203AF98
_08112714: .4byte gUnknown_3005E94
_08112718: .4byte gUnknown_203B01A
_0811271C: .4byte gUnknown_203B01C
	thumb_func_end sub_81126AC

	thumb_func_start sub_8112720
sub_8112720: @ 8112720
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	bl sub_8112D1C
	lsls r0, 24
	lsrs r7, r0, 24
	cmp r7, 0
	bne _08112774
	ldr r2, _08112780 @ =gUnknown_203AF98
	ldrh r0, [r2]
	ldr r3, _08112784 @ =gUnknown_3005E94
	ldr r4, [r3]
	lsls r0, 3
	adds r0, r4
	ldr r6, _08112788 @ =gUnknown_203B01A
	ldrh r1, [r6]
	movs r5, 0
	strh r1, [r0, 0x4]
	ldrh r0, [r2]
	lsls r0, 3
	adds r0, r4
	movs r1, 0x1
	strb r1, [r0, 0x6]
	ldrh r0, [r2]
	ldr r1, [r3]
	lsls r0, 3
	adds r0, r1
	strb r5, [r0]
	ldrh r0, [r2]
	ldr r1, [r3]
	lsls r0, 3
	adds r0, r1
	mov r1, r8
	strb r1, [r0, 0x3]
	ldrh r0, [r2]
	adds r0, 0x1
	strh r0, [r2]
	strh r7, [r6]
_08112774:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08112780: .4byte gUnknown_203AF98
_08112784: .4byte gUnknown_3005E94
_08112788: .4byte gUnknown_203B01A
	thumb_func_end sub_8112720

	thumb_func_start sub_811278C
sub_811278C: @ 811278C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r7, r0, 24
	lsls r1, 24
	lsrs r1, 24
	mov r8, r1
	bl sub_8112D1C
	lsls r0, 24
	cmp r0, 0
	bne _081127E2
	ldr r2, _081127EC @ =gUnknown_203AF98
	ldrh r0, [r2]
	ldr r3, _081127F0 @ =gUnknown_3005E94
	ldr r4, [r3]
	lsls r0, 3
	adds r0, r4
	ldr r6, _081127F4 @ =gUnknown_203B01A
	ldrh r1, [r6]
	movs r5, 0
	strh r1, [r0, 0x4]
	ldrh r0, [r2]
	lsls r0, 3
	adds r0, r4
	movs r1, 0x1
	strb r1, [r0, 0x6]
	ldrh r0, [r2]
	ldr r1, [r3]
	lsls r0, 3
	adds r0, r1
	strb r5, [r0]
	ldrh r0, [r2]
	ldr r1, [r3]
	lsls r0, 3
	adds r0, r1
	strb r7, [r0, 0x3]
	ldrh r0, [r2]
	adds r0, 0x1
	strh r0, [r2]
	mov r0, r8
	strh r0, [r6]
_081127E2:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081127EC: .4byte gUnknown_203AF98
_081127F0: .4byte gUnknown_3005E94
_081127F4: .4byte gUnknown_203B01A
	thumb_func_end sub_811278C

	thumb_func_start sub_81127F8
sub_81127F8: @ 81127F8
	push {r4-r6,lr}
	adds r2, r0, 0
	ldr r5, _08112874 @ =gUnknown_203AF98
	ldr r1, _08112878 @ =gUnknown_3005E8C
	ldrh r0, [r5]
	ldrh r1, [r1]
	cmp r0, r1
	bcs _0811286C
	ldr r2, [r2]
	ldr r0, _0811287C @ =0x00ff00f3
	ands r2, r0
	ldrh r1, [r5]
	ldr r3, _08112880 @ =gUnknown_3005E94
	ldr r4, [r3]
	lsls r1, 3
	adds r1, r4
	ldr r6, _08112884 @ =gUnknown_203B01A
	ldrh r0, [r6]
	strh r0, [r1, 0x4]
	ldrh r0, [r5]
	lsls r0, 3
	adds r0, r4
	movs r1, 0x2
	strb r1, [r0, 0x6]
	ldrh r0, [r5]
	ldr r1, [r3]
	lsls r0, 3
	adds r0, r1
	strb r2, [r0]
	ldrh r0, [r5]
	ldr r1, [r3]
	lsls r0, 3
	adds r0, r1
	lsrs r1, r2, 8
	strb r1, [r0, 0x1]
	ldrh r0, [r5]
	ldr r1, [r3]
	lsls r0, 3
	adds r0, r1
	lsrs r1, r2, 16
	strb r1, [r0, 0x2]
	ldrh r0, [r5]
	ldr r1, [r3]
	lsls r0, 3
	adds r0, r1
	lsrs r2, 24
	strb r2, [r0, 0x3]
	ldrh r0, [r5]
	adds r0, 0x1
	strh r0, [r5]
	bl ScriptContext2_IsEnabled
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _0811286A
	movs r0, 0x1
_0811286A:
	strh r0, [r6]
_0811286C:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08112874: .4byte gUnknown_203AF98
_08112878: .4byte gUnknown_3005E8C
_0811287C: .4byte 0x00ff00f3
_08112880: .4byte gUnknown_3005E94
_08112884: .4byte gUnknown_203B01A
	thumb_func_end sub_81127F8

	thumb_func_start sub_8112888
sub_8112888: @ 8112888
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08112898
	cmp r0, 0x2
	beq _081128A8
	b _081128B4
_08112898:
	ldr r1, _081128A4 @ =gUnknown_3005E88
	ldrb r0, [r1]
	cmp r0, 0x1
	bne _081128B4
	movs r0, 0x3
	b _081128B2
	.align 2, 0
_081128A4: .4byte gUnknown_3005E88
_081128A8:
	ldr r1, _081128B8 @ =gUnknown_3005E88
	ldrb r0, [r1]
	cmp r0, 0x3
	bne _081128B4
	movs r0, 0x1
_081128B2:
	strb r0, [r1]
_081128B4:
	pop {r0}
	bx r0
	.align 2, 0
_081128B8: .4byte gUnknown_3005E88
	thumb_func_end sub_8112888

	thumb_func_start sub_81128BC
sub_81128BC: @ 81128BC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_8112CAC
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r4, 0x1
	beq _081128D4
	cmp r4, 0x2
	beq _08112928
	b _08112934
_081128D4:
	cmp r1, 0x1
	bne _081128E4
	ldr r1, _081128E0 @ =gUnknown_3005E88
	movs r0, 0x3
	strb r0, [r1]
	b _08112934
	.align 2, 0
_081128E0: .4byte gUnknown_3005E88
_081128E4:
	cmp r1, 0x2
	bne _08112934
	ldr r2, _08112918 @ =gUnknown_203AF98
	ldrh r1, [r2]
	ldr r0, _0811291C @ =gUnknown_3005E94
	ldr r3, [r0]
	lsls r1, 3
	adds r1, r3
	ldr r4, _08112920 @ =gUnknown_203B01A
	ldrh r0, [r4]
	movs r5, 0
	strh r0, [r1, 0x4]
	ldrh r0, [r2]
	lsls r0, 3
	adds r0, r3
	movs r1, 0x3
	strb r1, [r0, 0x6]
	ldrh r0, [r2]
	adds r0, 0x1
	strh r0, [r2]
	strh r5, [r4]
	ldr r1, _08112924 @ =gUnknown_3005E88
	movs r0, 0x4
	strb r0, [r1]
	b _08112934
	.align 2, 0
_08112918: .4byte gUnknown_203AF98
_0811291C: .4byte gUnknown_3005E94
_08112920: .4byte gUnknown_203B01A
_08112924: .4byte gUnknown_3005E88
_08112928:
	cmp r1, 0x1
	beq _08112930
	cmp r1, 0x2
	bne _08112934
_08112930:
	ldr r0, _0811293C @ =gUnknown_3005E88
	strb r1, [r0]
_08112934:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0811293C: .4byte gUnknown_3005E88
	thumb_func_end sub_81128BC

	thumb_func_start sub_8112940
sub_8112940: @ 8112940
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	adds r3, r1, 0
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r2, 16
	cmp r0, 0x1
	beq _08112964
	cmp r0, 0x2
	beq _081129E0
	ldr r1, _08112960 @ =gUnknown_3005E88
	movs r0, 0
	strb r0, [r1]
	b _08112B20
	.align 2, 0
_08112960: .4byte gUnknown_3005E88
_08112964:
	ldr r2, _081129C0 @ =gUnknown_3005E94
	str r3, [r2]
	ldr r1, _081129C4 @ =gUnknown_3005E8C
	lsrs r0, r4, 19
	strh r0, [r1]
	ldr r0, _081129C8 @ =gUnknown_3005E88
	mov r9, r0
	adds r1, r2, 0
	ldr r6, _081129CC @ =gUnknown_203AF9A
	ldr r2, _081129D0 @ =gUnknown_203AF98
	ldr r7, _081129D4 @ =gUnknown_203B01C
	ldr r0, _081129D8 @ =gUnknown_3005E90
	mov r12, r0
	ldr r0, _081129DC @ =gUnknown_203B01A
	mov r8, r0
	movs r5, 0xFF
	adds r3, r6, 0
	movs r4, 0x3F
_08112988:
	ldrb r0, [r3]
	orrs r0, r5
	strb r0, [r3]
	ldrb r0, [r3, 0x1]
	orrs r0, r5
	strb r0, [r3, 0x1]
	adds r3, 0x2
	subs r4, 0x1
	cmp r4, 0
	bge _08112988
	movs r0, 0
	strh r0, [r2]
	strh r0, [r7]
	movs r0, 0
	mov r2, r12
	str r0, [r2]
	ldr r1, [r1]
	ldrh r0, [r1, 0x4]
	mov r2, r8
	strh r0, [r2]
	ldrb r0, [r1, 0x3]
	strb r0, [r6]
	movs r0, 0xFF
	strb r0, [r6, 0x1]
	movs r0, 0x1
	mov r1, r9
	strb r0, [r1]
	b _08112B20
	.align 2, 0
_081129C0: .4byte gUnknown_3005E94
_081129C4: .4byte gUnknown_3005E8C
_081129C8: .4byte gUnknown_3005E88
_081129CC: .4byte gUnknown_203AF9A
_081129D0: .4byte gUnknown_203AF98
_081129D4: .4byte gUnknown_203B01C
_081129D8: .4byte gUnknown_3005E90
_081129DC: .4byte gUnknown_203B01A
_081129E0:
	ldr r1, _08112A44 @ =gUnknown_3005E94
	str r3, [r1]
	ldr r5, _08112A48 @ =gUnknown_3005E8C
	lsrs r0, r4, 19
	strh r0, [r5]
	movs r4, 0
	ldr r2, _08112A4C @ =gUnknown_203B01A
	mov r8, r2
	cmp r4, r0
	bge _08112A0E
	adds r6, r1, 0
	ldr r0, _08112A50 @ =gUnknown_845669C
	ldr r2, [r0]
	ldr r3, [r0, 0x4]
_081129FC:
	ldr r1, [r6]
	lsls r0, r4, 3
	adds r0, r1
	str r2, [r0]
	str r3, [r0, 0x4]
	adds r4, 0x1
	ldrh r0, [r5]
	cmp r4, r0
	blt _081129FC
_08112A0E:
	ldr r4, _08112A54 @ =gUnknown_203AF98
	movs r2, 0
	strh r2, [r4]
	mov r1, r8
	strh r2, [r1]
	movs r1, 0
	ldr r3, _08112A44 @ =gUnknown_3005E94
	ldr r0, [r3]
	strh r1, [r0, 0x4]
	strb r2, [r0, 0x6]
	ldrh r0, [r4]
	ldr r1, [r3]
	lsls r0, 3
	adds r0, r1
	strb r2, [r0]
	bl player_get_direction_lower_nybble
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bhi _08112AC8
	lsls r0, 2
	ldr r1, _08112A58 @ =_08112A5C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08112A44: .4byte gUnknown_3005E94
_08112A48: .4byte gUnknown_3005E8C
_08112A4C: .4byte gUnknown_203B01A
_08112A50: .4byte gUnknown_845669C
_08112A54: .4byte gUnknown_203AF98
_08112A58: .4byte _08112A5C
	.align 2, 0
_08112A5C:
	.4byte _08112A70
	.4byte _08112A70
	.4byte _08112AA0
	.4byte _08112AB8
	.4byte _08112A88
_08112A70:
	ldr r0, _08112A80 @ =gUnknown_203AF98
	ldrh r0, [r0]
	ldr r1, _08112A84 @ =gUnknown_3005E94
	ldr r1, [r1]
	lsls r0, 3
	adds r0, r1
	movs r1, 0
	b _08112AC6
	.align 2, 0
_08112A80: .4byte gUnknown_203AF98
_08112A84: .4byte gUnknown_3005E94
_08112A88:
	ldr r0, _08112A98 @ =gUnknown_203AF98
	ldrh r0, [r0]
	ldr r1, _08112A9C @ =gUnknown_3005E94
	ldr r1, [r1]
	lsls r0, 3
	adds r0, r1
	movs r1, 0x3
	b _08112AC6
	.align 2, 0
_08112A98: .4byte gUnknown_203AF98
_08112A9C: .4byte gUnknown_3005E94
_08112AA0:
	ldr r0, _08112AB0 @ =gUnknown_203AF98
	ldrh r0, [r0]
	ldr r1, _08112AB4 @ =gUnknown_3005E94
	ldr r1, [r1]
	lsls r0, 3
	adds r0, r1
	movs r1, 0x1
	b _08112AC6
	.align 2, 0
_08112AB0: .4byte gUnknown_203AF98
_08112AB4: .4byte gUnknown_3005E94
_08112AB8:
	ldr r0, _08112B2C @ =gUnknown_203AF98
	ldrh r0, [r0]
	ldr r1, _08112B30 @ =gUnknown_3005E94
	ldr r1, [r1]
	lsls r0, 3
	adds r0, r1
	movs r1, 0x2
_08112AC6:
	strb r1, [r0, 0x3]
_08112AC8:
	ldr r0, _08112B34 @ =gUnknown_203B01C
	movs r5, 0
	strh r5, [r0]
	ldr r2, _08112B2C @ =gUnknown_203AF98
	ldrh r0, [r2]
	adds r0, 0x1
	strh r0, [r2]
	ldrh r0, [r2]
	ldr r3, _08112B30 @ =gUnknown_3005E94
	ldr r4, [r3]
	lsls r0, 3
	adds r0, r4
	movs r1, 0
	strh r1, [r0, 0x4]
	ldrh r0, [r2]
	lsls r0, 3
	adds r0, r4
	movs r4, 0x2
	strb r4, [r0, 0x6]
	ldrh r0, [r2]
	ldr r1, [r3]
	lsls r0, 3
	adds r0, r1
	strb r5, [r0]
	ldrh r0, [r2]
	ldr r1, [r3]
	lsls r0, 3
	adds r0, r1
	strb r5, [r0, 0x1]
	ldrh r0, [r2]
	ldr r1, [r3]
	lsls r0, 3
	adds r0, r1
	strb r5, [r0, 0x2]
	ldrh r0, [r2]
	ldr r1, [r3]
	lsls r0, 3
	adds r0, r1
	strb r5, [r0, 0x3]
	ldrh r0, [r2]
	adds r0, 0x1
	strh r0, [r2]
	ldr r0, _08112B38 @ =gUnknown_3005E88
	strb r4, [r0]
_08112B20:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08112B2C: .4byte gUnknown_203AF98
_08112B30: .4byte gUnknown_3005E94
_08112B34: .4byte gUnknown_203B01C
_08112B38: .4byte gUnknown_3005E88
	thumb_func_end sub_8112940

	thumb_func_start sub_8112B3C
sub_8112B3C: @ 8112B3C
	push {r4-r7,lr}
	ldr r0, _08112B54 @ =gUnknown_3005E88
	ldrb r0, [r0]
	cmp r0, 0x4
	bls _08112B48
	b _08112C84
_08112B48:
	lsls r0, 2
	ldr r1, _08112B58 @ =_08112B5C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08112B54: .4byte gUnknown_3005E88
_08112B58: .4byte _08112B5C
	.align 2, 0
_08112B5C:
	.4byte _08112C84
	.4byte _08112B70
	.4byte _08112C5E
	.4byte _08112C84
	.4byte _08112C84
_08112B70:
	bl sub_8112CEC
	lsls r0, 24
	cmp r0, 0
	beq _08112B7C
	b _08112C72
_08112B7C:
	ldr r0, _08112B8C @ =gUnknown_203B01A
	ldrh r1, [r0]
	adds r7, r0, 0
	cmp r1, 0
	beq _08112B90
	subs r0, r1, 0x1
	strh r0, [r7]
	b _08112C84
	.align 2, 0
_08112B8C: .4byte gUnknown_203B01A
_08112B90:
	ldr r5, _08112B98 @ =gUnknown_3005E88
	ldr r4, _08112B9C @ =gUnknown_203AF98
	ldr r6, _08112BA0 @ =gUnknown_3005E94
	b _08112BD4
	.align 2, 0
_08112B98: .4byte gUnknown_3005E88
_08112B9C: .4byte gUnknown_203AF98
_08112BA0: .4byte gUnknown_3005E94
_08112BA4:
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	ldr r1, _08112BF0 @ =gUnknown_3005E8C
	lsls r0, 16
	lsrs r0, 16
	ldrh r1, [r1]
	cmp r0, r1
	bcs _08112C58
	ldrh r0, [r4]
	ldr r1, [r6]
	lsls r0, 3
	adds r0, r1
	ldrh r0, [r0, 0x4]
	strh r0, [r7]
	cmp r2, 0x3
	beq _08112C84
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0
	beq _08112BD4
	ldr r0, _08112BF4 @ =0x0000ffff
	cmp r1, r0
	bne _08112C84
_08112BD4:
	ldrh r0, [r4]
	ldr r1, [r6]
	lsls r0, 3
	adds r3, r0, r1
	ldrb r0, [r3, 0x6]
	cmp r0, 0x2
	beq _08112C2C
	cmp r0, 0x2
	bgt _08112BF8
	cmp r0, 0
	beq _08112C0C
	cmp r0, 0x1
	beq _08112C18
	b _08112C50
	.align 2, 0
_08112BF0: .4byte gUnknown_3005E8C
_08112BF4: .4byte 0x0000ffff
_08112BF8:
	cmp r0, 0xFE
	beq _08112C50
	cmp r0, 0xFE
	bgt _08112C06
	cmp r0, 0x3
	beq _08112C4E
	b _08112C50
_08112C06:
	cmp r0, 0xFF
	beq _08112C4C
	b _08112C50
_08112C0C:
	ldr r0, _08112C14 @ =gUnknown_203AF9A
	ldrb r1, [r3]
	lsls r1, 1
	b _08112C20
	.align 2, 0
_08112C14: .4byte gUnknown_203AF9A
_08112C18:
	ldr r0, _08112C28 @ =gUnknown_203AF9A
	ldrb r1, [r3]
	lsls r1, 1
	adds r0, 0x1
_08112C20:
	adds r1, r0
	ldrb r0, [r3, 0x3]
	strb r0, [r1]
	b _08112C50
	.align 2, 0
_08112C28: .4byte gUnknown_203AF9A
_08112C2C:
	ldr r2, _08112C48 @ =gUnknown_3005E90
	ldrb r1, [r3, 0x3]
	lsls r1, 24
	ldrb r0, [r3, 0x2]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r3, 0x1]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r3]
	orrs r1, r0
	str r1, [r2]
	b _08112C50
	.align 2, 0
_08112C48: .4byte gUnknown_3005E90
_08112C4C:
	movs r0, 0
_08112C4E:
	strb r0, [r5]
_08112C50:
	ldrb r2, [r5]
	cmp r2, 0
	bne _08112BA4
	b _08112C84
_08112C58:
	movs r0, 0
	strb r0, [r5]
	b _08112C84
_08112C5E:
	bl ScriptContext2_IsEnabled
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08112C84
	ldr r1, _08112C8C @ =gUnknown_203B01A
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_08112C72:
	ldr r0, _08112C90 @ =gUnknown_203AF98
	ldr r1, _08112C94 @ =gUnknown_3005E8C
	ldrh r0, [r0]
	ldrh r1, [r1]
	cmp r0, r1
	bcc _08112C84
	ldr r1, _08112C98 @ =gUnknown_3005E88
	movs r0, 0
	strb r0, [r1]
_08112C84:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08112C8C: .4byte gUnknown_203B01A
_08112C90: .4byte gUnknown_203AF98
_08112C94: .4byte gUnknown_3005E8C
_08112C98: .4byte gUnknown_3005E88
	thumb_func_end sub_8112B3C

	thumb_func_start sub_8112C9C
sub_8112C9C: @ 8112C9C
	ldr r1, _08112CA8 @ =gUnknown_203B01A
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	bx lr
	.align 2, 0
_08112CA8: .4byte gUnknown_203B01A
	thumb_func_end sub_8112C9C

	thumb_func_start sub_8112CAC
sub_8112CAC: @ 8112CAC
	push {lr}
	ldr r0, _08112CC0 @ =gUnknown_3005E88
	ldrb r0, [r0]
	cmp r0, 0x4
	bhi _08112CDC
	lsls r0, 2
	ldr r1, _08112CC4 @ =_08112CC8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08112CC0: .4byte gUnknown_3005E88
_08112CC4: .4byte _08112CC8
	.align 2, 0
_08112CC8:
	.4byte _08112CDC
	.4byte _08112CE0
	.4byte _08112CE4
	.4byte _08112CE0
	.4byte _08112CE4
_08112CDC:
	movs r0, 0
	b _08112CE6
_08112CE0:
	movs r0, 0x1
	b _08112CE6
_08112CE4:
	movs r0, 0x2
_08112CE6:
	pop {r1}
	bx r1
	thumb_func_end sub_8112CAC

	thumb_func_start sub_8112CEC
sub_8112CEC: @ 8112CEC
	push {lr}
	ldr r0, _08112D0C @ =gUnknown_203AF98
	ldr r1, _08112D10 @ =gUnknown_3005E8C
	ldrh r0, [r0]
	ldrh r1, [r1]
	cmp r0, r1
	bcs _08112D06
	bl ScriptContext2_IsEnabled
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08112D14
_08112D06:
	movs r0, 0x1
	b _08112D16
	.align 2, 0
_08112D0C: .4byte gUnknown_203AF98
_08112D10: .4byte gUnknown_3005E8C
_08112D14:
	movs r0, 0
_08112D16:
	pop {r1}
	bx r1
	thumb_func_end sub_8112CEC

	thumb_func_start sub_8112D1C
sub_8112D1C: @ 8112D1C
	push {lr}
	ldr r0, _08112D30 @ =gUnknown_203AF98
	ldr r1, _08112D34 @ =gUnknown_3005E8C
	ldrh r0, [r0]
	ldrh r1, [r1]
	cmp r0, r1
	bcs _08112D38
	movs r0, 0
	b _08112D3A
	.align 2, 0
_08112D30: .4byte gUnknown_203AF98
_08112D34: .4byte gUnknown_3005E8C
_08112D38:
	movs r0, 0x1
_08112D3A:
	pop {r1}
	bx r1
	thumb_func_end sub_8112D1C

	thumb_func_start sub_8112D40
sub_8112D40: @ 8112D40
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 16
	lsrs r5, r1, 16
	ldr r0, _08112D6C @ =gUnknown_203AF98
	ldrh r1, [r0]
	cmp r1, 0
	beq _08112D66
	ldr r0, _08112D70 @ =gUnknown_3005E8C
	ldrh r0, [r0]
	cmp r1, r0
	bcs _08112D66
	ldr r4, _08112D74 @ =gUnknown_203B01E
	ldr r1, _08112D78 @ =gUnknown_3002020
	ldrh r0, [r4]
	ldrh r1, [r1]
	cmp r0, r1
	bcc _08112D7C
_08112D66:
	movs r0, 0
	b _08112DA8
	.align 2, 0
_08112D6C: .4byte gUnknown_203AF98
_08112D70: .4byte gUnknown_3005E8C
_08112D74: .4byte gUnknown_203B01E
_08112D78: .4byte gUnknown_3002020
_08112D7C:
	ldrh r3, [r4]
	ldr r0, _08112DA0 @ =gUnknown_300201C
	ldr r1, [r0]
	lsls r0, r3, 2
	adds r2, r0, r1
	ldr r1, [r2]
	lsls r0, r1, 17
	lsrs r0, 17
	cmp r0, r5
	bne _08112DA4
	lsls r0, r1, 16
	lsrs r0, 31
	cmp r0, r6
	bne _08112DA4
	adds r1, r2, 0x2
	adds r0, r3, 0x1
	strh r0, [r4]
	b _08112DA6
	.align 2, 0
_08112DA0: .4byte gUnknown_300201C
_08112DA4:
	movs r1, 0
_08112DA6:
	adds r0, r1, 0
_08112DA8:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_8112D40

	thumb_func_start sub_8112DB0
sub_8112DB0: @ 8112DB0
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r7, r0, 24
	lsls r1, 16
	lsrs r3, r1, 16
	lsls r2, 16
	lsrs r2, 16
	mov r12, r2
	ldr r0, _08112E20 @ =gUnknown_203AF98
	ldrh r1, [r0]
	cmp r1, 0
	beq _08112E18
	ldr r0, _08112E24 @ =gUnknown_3005E8C
	ldrh r0, [r0]
	cmp r1, r0
	bcs _08112E18
	ldr r6, _08112E28 @ =gUnknown_203B01E
	ldr r1, _08112E2C @ =gUnknown_3002020
	ldrh r0, [r6]
	ldrh r1, [r1]
	cmp r0, r1
	bcs _08112E18
	adds r2, r0, 0
	ldr r5, _08112E30 @ =gUnknown_300201C
	ldr r4, [r5]
	lsls r2, 2
	adds r2, r4
	ldr r1, _08112E34 @ =0x00007fff
	ands r1, r3
	ldrh r3, [r2]
	ldr r0, _08112E38 @ =0xffff8000
	ands r0, r3
	orrs r0, r1
	strh r0, [r2]
	ldrh r1, [r6]
	lsls r1, 2
	adds r1, r4
	lsls r3, r7, 7
	ldrb r2, [r1, 0x1]
	movs r0, 0x7F
	ands r0, r2
	orrs r0, r3
	strb r0, [r1, 0x1]
	ldrh r0, [r6]
	ldr r1, [r5]
	lsls r0, 2
	adds r0, r1
	mov r1, r12
	strh r1, [r0, 0x2]
	ldrh r0, [r6]
	adds r0, 0x1
	strh r0, [r6]
_08112E18:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08112E20: .4byte gUnknown_203AF98
_08112E24: .4byte gUnknown_3005E8C
_08112E28: .4byte gUnknown_203B01E
_08112E2C: .4byte gUnknown_3002020
_08112E30: .4byte gUnknown_300201C
_08112E34: .4byte 0x00007fff
_08112E38: .4byte 0xffff8000
	thumb_func_end sub_8112DB0

	thumb_func_start sub_8112E3C
sub_8112E3C: @ 8112E3C
	push {r4,r5,lr}
	lsls r0, 24
	lsls r2, 16
	lsrs r3, r0, 24
	movs r4, 0xFF
	lsls r4, 24
	adds r0, r4
	lsrs r0, 24
	cmp r0, 0x1
	bls _08112E5C
	ldr r1, _08112E58 @ =gUnknown_3005E88
	movs r0, 0
	strb r0, [r1]
	b _08112E8E
	.align 2, 0
_08112E58: .4byte gUnknown_3005E88
_08112E5C:
	ldr r5, _08112E94 @ =gUnknown_300201C
	str r1, [r5]
	ldr r1, _08112E98 @ =gUnknown_3002020
	lsrs r0, r2, 18
	strh r0, [r1]
	ldr r1, _08112E9C @ =gUnknown_203B01E
	movs r0, 0
	strh r0, [r1]
	cmp r3, 0x2
	bne _08112E8E
	movs r2, 0
	ldr r4, _08112EA0 @ =gUnknown_3005E8C
	ldrh r0, [r4]
	cmp r2, r0
	bge _08112E8E
	ldr r0, _08112EA4 @ =gUnknown_84566A4
	ldr r3, [r0]
_08112E7E:
	ldr r1, [r5]
	lsls r0, r2, 2
	adds r0, r1
	str r3, [r0]
	adds r2, 0x1
	ldrh r0, [r4]
	cmp r2, r0
	blt _08112E7E
_08112E8E:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08112E94: .4byte gUnknown_300201C
_08112E98: .4byte gUnknown_3002020
_08112E9C: .4byte gUnknown_203B01E
_08112EA0: .4byte gUnknown_3005E8C
_08112EA4: .4byte gUnknown_84566A4
	thumb_func_end sub_8112E3C

	thumb_func_start sub_8112EA8
sub_8112EA8: @ 8112EA8
	ldr r1, _08112EB0 @ =gUnknown_203B020
	movs r0, 0xFF
	strb r0, [r1]
	bx lr
	.align 2, 0
_08112EB0: .4byte gUnknown_203B020
	thumb_func_end sub_8112EA8

	thumb_func_start sub_8112EB4
sub_8112EB4: @ 8112EB4
	push {r4,lr}
	ldr r4, _08112ED4 @ =gUnknown_203B020
	ldrb r0, [r4]
	cmp r0, 0xFF
	bne _08112ECC
	ldr r0, _08112ED8 @ =gUnknown_8456928
	bl AddWindow
	strb r0, [r4]
	ldrb r0, [r4]
	bl PutWindowTilemap
_08112ECC:
	ldrb r0, [r4]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08112ED4: .4byte gUnknown_203B020
_08112ED8: .4byte gUnknown_8456928
	thumb_func_end sub_8112EB4

	thumb_func_start sub_8112EDC
sub_8112EDC: @ 8112EDC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r4, _08112F14 @ =gUnknown_203B020
	ldrb r0, [r4]
	cmp r0, 0xFF
	beq _08112F0C
	movs r1, 0
	bl FillWindowPixelBuffer
	ldrb r0, [r4]
	bl ClearWindowTilemap
	cmp r5, 0
	beq _08112F02
	ldrb r0, [r4]
	adds r1, r5, 0
	bl CopyWindowToVram
_08112F02:
	ldrb r0, [r4]
	bl RemoveWindow
	movs r0, 0xFF
	strb r0, [r4]
_08112F0C:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08112F14: .4byte gUnknown_203B020
	thumb_func_end sub_8112EDC

	thumb_func_start sub_8112F18
sub_8112F18: @ 8112F18
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	movs r1, 0x3
	bl GetWindowAttribute
	lsls r0, 24
	lsrs r6, r0, 24
	mov r0, r10
	movs r1, 0x4
	bl GetWindowAttribute
	lsls r0, 24
	lsrs r7, r0, 24
	lsls r0, r7, 5
	muls r0, r6
	bl Alloc
	mov r8, r0
	cmp r0, 0
	beq _08112FB8
	movs r5, 0
	adds r0, r6, 0
	muls r0, r7
	str r0, [sp]
	cmp r5, r7
	bcs _08112FA2
_08112F5A:
	movs r4, 0
	adds r1, r5, 0x1
	mov r9, r1
	cmp r4, r6
	bcs _08112F98
	subs r3, r7, 0x1
_08112F66:
	movs r0, 0
	cmp r5, 0
	beq _08112F74
	movs r0, 0x5
	cmp r5, r3
	bne _08112F74
	movs r0, 0xE
_08112F74:
	lsls r0, 5
	ldr r1, _08112FC8 @ =gUnknown_84566A8
	adds r0, r1, r0
	adds r1, r5, 0
	muls r1, r6
	adds r1, r4
	lsls r1, 5
	add r1, r8
	ldr r2, _08112FCC @ =0x04000008
	str r3, [sp, 0x4]
	bl CpuSet
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r3, [sp, 0x4]
	cmp r4, r6
	bcc _08112F66
_08112F98:
	mov r1, r9
	lsls r0, r1, 24
	lsrs r5, r0, 24
	cmp r5, r7
	bcc _08112F5A
_08112FA2:
	ldr r0, [sp]
	lsls r2, r0, 21
	lsrs r2, 16
	mov r0, r10
	mov r1, r8
	movs r3, 0
	bl CopyToWindowPixelBuffer
	mov r0, r8
	bl Free
_08112FB8:
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08112FC8: .4byte gUnknown_84566A8
_08112FCC: .4byte 0x04000008
	thumb_func_end sub_8112F18

	thumb_func_start sub_8112FD0
sub_8112FD0: @ 8112FD0
	push {lr}
	ldr r0, _08112FE0 @ =gUnknown_203B020
	ldrb r0, [r0]
	bl sub_8112F18
	pop {r0}
	bx r0
	.align 2, 0
_08112FE0: .4byte gUnknown_203B020
	thumb_func_end sub_8112FD0

	thumb_func_start sub_8112FE4
sub_8112FE4: @ 8112FE4
	push {lr}
	sub sp, 0x14
	adds r2, r0, 0
	ldr r0, _08113010 @ =gUnknown_203B020
	ldrb r0, [r0]
	movs r1, 0x1
	str r1, [sp]
	str r1, [sp, 0x4]
	ldr r1, _08113014 @ =gUnknown_8456930
	str r1, [sp, 0x8]
	movs r1, 0x1
	negs r1, r1
	str r1, [sp, 0xC]
	str r2, [sp, 0x10]
	movs r1, 0x2
	movs r2, 0x2
	movs r3, 0x5
	bl AddTextPrinterParametrized2
	add sp, 0x14
	pop {r0}
	bx r0
	.align 2, 0
_08113010: .4byte gUnknown_203B020
_08113014: .4byte gUnknown_8456930
	thumb_func_end sub_8112FE4

	thumb_func_start sub_8113018
sub_8113018: @ 8113018
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r1, 24
	lsrs r5, r1, 24
	bl sub_8112FD0
	adds r0, r4, 0
	bl sub_8112FE4
	cmp r5, 0
	beq _08113038
	ldr r0, _08113040 @ =gUnknown_203B020
	ldrb r0, [r0]
	adds r1, r5, 0
	bl CopyWindowToVram
_08113038:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08113040: .4byte gUnknown_203B020
	thumb_func_end sub_8113018

	thumb_func_start sub_8113044
sub_8113044: @ 8113044
	push {lr}
	ldr r0, _0811305C @ =0x00004038
	movs r1, 0
	bl VarSet
	ldr r0, _08113060 @ =0x00004039
	movs r1, 0
	bl VarSet
	pop {r0}
	bx r0
	.align 2, 0
_0811305C: .4byte 0x00004038
_08113060: .4byte 0x00004039
	thumb_func_end sub_8113044

	thumb_func_start sub_8113064
sub_8113064: @ 8113064
	push {lr}
	ldr r0, _08113074 @ =0x00004038
	bl sub_806E454
	bl sub_8113078
	pop {r0}
	bx r0
	.align 2, 0
_08113074: .4byte 0x00004038
	thumb_func_end sub_8113064

	thumb_func_start sub_8113078
sub_8113078: @ 8113078
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8113508
	lsls r0, 24
	cmp r0, 0
	beq _08113098
	adds r0, r4, 0
	bl sub_81132E0
	ldr r0, _081130A0 @ =0x00004039
	ldr r1, _081130A4 @ =gSaveBlock2Ptr
	ldr r1, [r1]
	ldrh r1, [r1, 0xE]
	bl VarSet
_08113098:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081130A0: .4byte 0x00004039
_081130A4: .4byte gSaveBlock2Ptr
	thumb_func_end sub_8113078

	thumb_func_start sub_81130A8
sub_81130A8: @ 81130A8
	push {lr}
	ldr r0, _081130B8 @ =0x00004038
	bl sub_806E454
	bl sub_81130BC
	pop {r0}
	bx r0
	.align 2, 0
_081130B8: .4byte 0x00004038
	thumb_func_end sub_81130A8

	thumb_func_start sub_81130BC
sub_81130BC: @ 81130BC
	push {r4,lr}
	adds r4, r0, 0
	ldrb r1, [r4]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08113102
	adds r0, r4, 0
	bl sub_8113524
	adds r0, r4, 0
	bl sub_8113390
	ldr r0, _08113108 @ =0x00004039
	ldr r1, _0811310C @ =gSaveBlock2Ptr
	ldr r1, [r1]
	ldrh r1, [r1, 0xE]
	bl VarSet
	movs r0, 0x6C
	bl FlagClear
	movs r0, 0x6D
	bl FlagClear
	movs r0, 0x6E
	bl FlagClear
	movs r0, 0x6F
	bl FlagClear
	ldr r0, _08113110 @ =0x00004073
	movs r1, 0x1
	bl VarSet
_08113102:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08113108: .4byte 0x00004039
_0811310C: .4byte gSaveBlock2Ptr
_08113110: .4byte 0x00004073
	thumb_func_end sub_81130BC

	thumb_func_start sub_8113114
sub_8113114: @ 8113114
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r1, 24
	lsrs r5, r1, 24
	ldr r0, _0811315C @ =0x00004073
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x2
	bne _08113188
	ldr r0, [r4]
	lsls r2, r0, 25
	lsrs r1, r2, 25
	ldr r0, _08113160 @ =gUnknown_8456934
	adds r0, r5, r0
	ldrb r0, [r0]
	adds r1, r0
	cmp r1, 0x13
	ble _08113174
	adds r0, r4, 0
	bl sub_81132A0
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x2
	bhi _08113164
	adds r0, r4, 0
	bl sub_8113194
	ldrb r1, [r4]
	movs r0, 0x80
	negs r0, r0
	ands r0, r1
	b _08113186
	.align 2, 0
_0811315C: .4byte 0x00004073
_08113160: .4byte gUnknown_8456934
_08113164:
	ldrb r0, [r4]
	movs r1, 0x80
	negs r1, r1
	ands r1, r0
	movs r0, 0x14
	orrs r1, r0
	strb r1, [r4]
	b _08113188
_08113174:
	lsrs r1, r2, 25
	adds r1, r0
	movs r0, 0x7F
	ands r1, r0
	ldrb r2, [r4]
	movs r0, 0x80
	negs r0, r0
	ands r0, r2
	orrs r0, r1
_08113186:
	strb r0, [r4]
_08113188:
	ldr r0, [r4]
	lsls r0, 25
	lsrs r0, 25
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8113114

	thumb_func_start sub_8113194
sub_8113194: @ 8113194
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r5, r0, 0
	movs r0, 0
	mov r8, r0
	movs r6, 0
	movs r7, 0x1
_081131A4:
	ldrb r1, [r5, 0x1]
	ldr r0, _081131D0 @ =gUnknown_8456938
	adds r0, r6, r0
	ldrb r4, [r0]
	asrs r1, r4
	ands r1, r7
	cmp r1, 0
	bne _081131D4
	mov r8, r6
	bl Random
	adds r1, r7, 0
	ands r1, r0
	cmp r1, 0
	beq _081131D4
	adds r0, r7, 0
	lsls r0, r4
	ldrb r1, [r5, 0x1]
	orrs r0, r1
	strb r0, [r5, 0x1]
	adds r0, r4, 0
	b _081131EE
	.align 2, 0
_081131D0: .4byte gUnknown_8456938
_081131D4:
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x7
	bls _081131A4
	ldr r0, _081131F8 @ =gUnknown_8456938
	add r0, r8
	ldrb r0, [r0]
	movs r1, 0x1
	lsls r1, r0
	ldrb r2, [r5, 0x1]
	orrs r1, r2
	strb r1, [r5, 0x1]
_081131EE:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_081131F8: .4byte gUnknown_8456938
	thumb_func_end sub_8113194

	thumb_func_start sub_81131FC
sub_81131FC: @ 81131FC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	adds r7, r0, 0
	movs r0, 0
	mov r8, r0
	adds r0, r7, 0
	bl sub_81132A0
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	bne _08113228
	movs r0, 0
	b _08113276
_0811321C:
	lsls r4, r6
	ldrb r0, [r7, 0x1]
	eors r4, r0
	strb r4, [r7, 0x1]
	adds r0, r6, 0
	b _08113276
_08113228:
	movs r5, 0
	movs r4, 0x1
_0811322C:
	ldrb r1, [r7, 0x1]
	ldr r2, _08113284 @ =gUnknown_8456940
	adds r0, r5, r2
	ldrb r6, [r0]
	asrs r1, r6
	ands r1, r4
	cmp r1, 0
	beq _0811324E
	mov r8, r5
	str r2, [sp]
	bl Random
	adds r1, r4, 0
	ands r1, r0
	ldr r2, [sp]
	cmp r1, 0
	bne _0811321C
_0811324E:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x7
	bls _0811322C
	ldrb r1, [r7, 0x1]
	mov r3, r8
	adds r0, r3, r2
	ldrb r2, [r0]
	adds r0, r1, 0
	asrs r0, r2
	movs r3, 0x1
	ands r0, r3
	cmp r0, 0
	beq _08113274
	adds r0, r3, 0
	lsls r0, r2
	eors r1, r0
	strb r1, [r7, 0x1]
_08113274:
	adds r0, r2, 0
_08113276:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08113284: .4byte gUnknown_8456940
	thumb_func_end sub_81131FC

	thumb_func_start sub_8113288
sub_8113288: @ 8113288
	push {lr}
	ldr r0, _0811329C @ =0x00004038
	bl sub_806E454
	bl sub_81132A0
	lsls r0, 16
	lsrs r0, 16
	pop {r1}
	bx r1
	.align 2, 0
_0811329C: .4byte 0x00004038
	thumb_func_end sub_8113288

	thumb_func_start sub_81132A0
sub_81132A0: @ 81132A0
	push {r4,lr}
	movs r2, 0
	movs r1, 0
	ldrb r3, [r0, 0x1]
	movs r4, 0x1
_081132AA:
	adds r0, r3, 0
	asrs r0, r1
	ands r0, r4
	cmp r0, 0
	beq _081132BA
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
_081132BA:
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x7
	bls _081132AA
	adds r0, r2, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_81132A0

	thumb_func_start sub_81132CC
sub_81132CC: @ 81132CC
	push {lr}
	ldr r0, _081132DC @ =0x00004038
	bl sub_806E454
	bl sub_81132E0
	pop {r0}
	bx r0
	.align 2, 0
_081132DC: .4byte 0x00004038
	thumb_func_end sub_81132CC

	thumb_func_start sub_81132E0
sub_81132E0: @ 81132E0
	push {r4-r6,lr}
	adds r4, r0, 0
	movs r5, 0
	ldr r2, _081132F8 @ =gSaveBlock2Ptr
	ldr r0, [r2]
	ldrh r1, [r0, 0xE]
	ldr r0, _081132FC @ =0x000003e6
	cmp r1, r0
	bhi _0811335C
	adds r6, r2, 0
	b _08113338
	.align 2, 0
_081132F8: .4byte gSaveBlock2Ptr
_081132FC: .4byte 0x000003e6
_08113300:
	ldr r0, _08113354 @ =0x00004039
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	ldr r1, [r6]
	ldrh r1, [r1, 0xE]
	subs r1, r0
	cmp r1, 0xB
	ble _0811335C
	adds r0, r4, 0
	bl sub_81131FC
	ldr r0, _08113354 @ =0x00004039
	bl VarGet
	adds r1, r0, 0
	lsls r1, 16
	movs r0, 0xC0
	lsls r0, 12
	adds r1, r0
	lsrs r1, 16
	ldr r0, _08113354 @ =0x00004039
	bl VarSet
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
_08113338:
	adds r0, r4, 0
	bl sub_81132A0
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x4
	bhi _08113358
	ldr r0, [r6]
	ldrh r1, [r0, 0xE]
	ldr r0, _08113354 @ =0x00004039
	bl VarSet
	b _0811335C
	.align 2, 0
_08113354: .4byte 0x00004039
_08113358:
	cmp r5, 0x8
	bne _08113300
_0811335C:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_81132E0

	thumb_func_start sub_8113364
sub_8113364: @ 8113364
	push {lr}
	ldr r0, _08113378 @ =0x00004038
	bl sub_806E454
	bl sub_811337C
	lsls r0, 16
	lsrs r0, 16
	pop {r1}
	bx r1
	.align 2, 0
_08113378: .4byte 0x00004038
	thumb_func_end sub_8113364

	thumb_func_start sub_811337C
sub_811337C: @ 811337C
	ldrb r0, [r0, 0x1]
	ldr r1, _0811338C @ =gUnknown_20370C0
	ldrh r1, [r1]
	asrs r0, r1
	movs r1, 0x1
	ands r0, r1
	bx lr
	.align 2, 0
_0811338C: .4byte gUnknown_20370C0
	thumb_func_end sub_811337C

	thumb_func_start sub_8113390
sub_8113390: @ 8113390
	ldrb r2, [r0, 0x1]
	movs r1, 0x1
	orrs r1, r2
	movs r2, 0x2
	orrs r1, r2
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0, 0x1]
	bx lr
	thumb_func_end sub_8113390

	thumb_func_start sub_81133A4
sub_81133A4: @ 81133A4
	push {lr}
	movs r3, 0
	movs r2, 0
	ldr r0, _081133BC @ =gUnknown_20370C0
	ldrh r0, [r0]
	cmp r0, 0x7
	bhi _081133F8
	lsls r0, 2
	ldr r1, _081133C0 @ =_081133C4
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081133BC: .4byte gUnknown_20370C0
_081133C0: .4byte _081133C4
	.align 2, 0
_081133C4:
	.4byte _081133E4
	.4byte _081133F8
	.4byte _081133F8
	.4byte _081133F8
	.4byte _081133EA
	.4byte _081133F0
	.4byte _081133F4
	.4byte _081133F8
_081133E4:
	movs r2, 0
	movs r3, 0
	b _081133F8
_081133EA:
	movs r2, 0x1
	movs r3, 0
	b _081133F8
_081133F0:
	movs r2, 0
	b _081133F6
_081133F4:
	movs r2, 0x2
_081133F6:
	movs r3, 0x1
_081133F8:
	ldr r0, _0811340C @ =gSaveBlock2Ptr
	ldr r0, [r0]
	ldr r1, _08113410 @ =0x00000a98
	adds r0, r1
	adds r1, r3, 0
	bl sub_8113414
	pop {r0}
	bx r0
	.align 2, 0
_0811340C: .4byte gSaveBlock2Ptr
_08113410: .4byte 0x00000a98
	thumb_func_end sub_81133A4

	thumb_func_start sub_8113414
sub_8113414: @ 8113414
	push {r4,lr}
	lsls r1, 24
	lsls r2, 24
	lsrs r2, 24
	adds r3, r2, 0
	lsrs r1, 20
	adds r1, r0, r1
	ldrb r0, [r1]
	cmp r0, 0xFF
	bne _08113478
	cmp r2, 0x1
	beq _08113436
	cmp r2, 0x1
	ble _0811345C
	cmp r3, 0x2
	beq _08113448
	b _0811345C
_08113436:
	ldr r0, _08113440 @ =gStringVar1
	ldr r1, _08113444 @ =gUnknown_84178D0
	bl StringCopy
	b _081134B2
	.align 2, 0
_08113440: .4byte gStringVar1
_08113444: .4byte gUnknown_84178D0
_08113448:
	ldr r0, _08113454 @ =gStringVar1
	ldr r1, _08113458 @ =gUnknown_84178DA
	bl StringCopy
	b _081134B2
	.align 2, 0
_08113454: .4byte gStringVar1
_08113458: .4byte gUnknown_84178DA
_0811345C:
	ldr r0, _0811346C @ =gStringVar1
	ldr r1, _08113470 @ =gSaveBlock1Ptr
	ldr r1, [r1]
	ldr r2, _08113474 @ =0x00003a4c
	adds r1, r2
	bl StringCopy
	b _081134B2
	.align 2, 0
_0811346C: .4byte gStringVar1
_08113470: .4byte gSaveBlock1Ptr
_08113474: .4byte 0x00003a4c
_08113478:
	ldr r4, _08113498 @ =gStringVar1
	adds r0, r4, 0
	movs r2, 0x7
	bl StringCopyN
	movs r0, 0xFF
	strb r0, [r4, 0x7]
	ldrb r0, [r4]
	cmp r0, 0xFC
	bne _081134B2
	ldrb r0, [r4, 0x1]
	cmp r0, 0x15
	bne _081134B2
	adds r4, 0x2
	b _0811349E
	.align 2, 0
_08113498: .4byte gStringVar1
_0811349C:
	adds r4, 0x1
_0811349E:
	ldrb r0, [r4]
	cmp r0, 0xFF
	bne _0811349C
	movs r0, 0xFC
	strb r0, [r4]
	adds r4, 0x1
	movs r0, 0x16
	strb r0, [r4]
	movs r0, 0xFF
	strb r0, [r4, 0x1]
_081134B2:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8113414

	thumb_func_start sub_81134B8
sub_81134B8: @ 81134B8
	push {lr}
	ldr r0, _081134C8 @ =0x00004038
	bl sub_806E454
	bl sub_81134CC
	pop {r0}
	bx r0
	.align 2, 0
_081134C8: .4byte 0x00004038
	thumb_func_end sub_81134B8

	thumb_func_start sub_81134CC
sub_81134CC: @ 81134CC
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _081134F4 @ =0x00004073
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x2
	bne _08113502
	adds r0, r4, 0
	bl sub_8113078
	ldr r0, _081134F8 @ =gUnknown_2023E8A
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _081134FC
	adds r0, r4, 0
	bl sub_8113194
	b _08113502
	.align 2, 0
_081134F4: .4byte 0x00004073
_081134F8: .4byte gUnknown_2023E8A
_081134FC:
	adds r0, r4, 0
	bl sub_81131FC
_08113502:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_81134CC

	thumb_func_start sub_8113508
sub_8113508: @ 8113508
	ldr r0, [r0]
	lsls r0, 24
	lsrs r0, 31
	bx lr
	thumb_func_end sub_8113508

	thumb_func_start sub_8113510
sub_8113510: @ 8113510
	push {lr}
	ldr r0, _08113520 @ =0x00004038
	bl sub_806E454
	bl sub_8113524
	pop {r0}
	bx r0
	.align 2, 0
_08113520: .4byte 0x00004038
	thumb_func_end sub_8113510

	thumb_func_start sub_8113524
sub_8113524: @ 8113524
	ldrb r1, [r0]
	movs r2, 0x80
	orrs r1, r2
	strb r1, [r0]
	bx lr
	thumb_func_end sub_8113524

	thumb_func_start sub_8113530
sub_8113530: @ 8113530
	push {lr}
	ldr r0, _08113548 @ =0x00004038
	bl sub_806E454
	ldr r1, _0811354C @ =gUnknown_20370C0
	ldrb r1, [r1]
	bl sub_8113114
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_08113548: .4byte 0x00004038
_0811354C: .4byte gUnknown_20370C0
	thumb_func_end sub_8113530

	thumb_func_start sub_8113550
sub_8113550: @ 8113550
	push {r4,r5,lr}
	adds r5, r1, 0
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x23
	bne _08113570
	ldr r0, _0811356C @ =gUnknown_203B048
	ldrb r0, [r0]
	cmp r0, 0x2
	bne _08113570
	bl sub_811381C
	b _081136BC
	.align 2, 0
_0811356C: .4byte gUnknown_203B048
_08113570:
	bl sub_811381C
	ldr r0, _0811362C @ =gUnknown_203ADFA
	ldrb r0, [r0]
	cmp r0, 0x2
	bne _0811357E
	b _081136BC
_0811357E:
	subs r0, r4, 0x3
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x27
	bls _0811358A
	b _081136BC
_0811358A:
	bl sub_81136D4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08113598
	b _081136BC
_08113598:
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_81138A0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _081135AA
	b _081136BC
_081135AA:
	bl sub_80BF708
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _081135B8
	b _081136BC
_081135B8:
	bl InUnionRoom
	cmp r0, 0x1
	bne _081135C2
	b _081136BC
_081135C2:
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8113954
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _081136BC
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8113A44
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _081136BC
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_81153E4
	lsls r0, 24
	cmp r0, 0
	beq _081136BC
	ldr r0, _08113630 @ =gUnknown_3005E88
	ldrb r0, [r0]
	cmp r0, 0
	bne _08113638
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8113778
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _081136BC
	cmp r4, 0x1F
	bne _08113614
	ldr r0, _08113634 @ =gUnknown_203AE04
	ldr r0, [r0]
	cmp r0, 0
	bne _0811363C
_08113614:
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_81153A8
	lsls r0, 24
	cmp r0, 0
	beq _081136BC
	adds r0, r4, 0
	bl sub_8110AEC
	b _0811363C
	.align 2, 0
_0811362C: .4byte gUnknown_203ADFA
_08113630: .4byte gUnknown_3005E88
_08113634: .4byte gUnknown_203AE04
_08113638:
	cmp r4, 0x28
	beq _081136BC
_0811363C:
	adds r0, r4, 0
	bl sub_8113B94
	cmp r4, 0x1F
	bne _0811367C
	ldr r2, _0811365C @ =gUnknown_203AE04
	ldr r1, [r2]
	cmp r1, 0
	bne _08113668
	ldr r0, _08113660 @ =gUnknown_203AE08
	ldr r0, [r0]
	str r0, [r2]
	ldr r1, _08113664 @ =gUnknown_8456948
	ldr r2, [r1, 0x7C]
	b _0811368E
	.align 2, 0
_0811365C: .4byte gUnknown_203AE04
_08113660: .4byte gUnknown_203AE08
_08113664: .4byte gUnknown_8456948
_08113668:
	ldr r0, _08113678 @ =gUnknown_8456948
	ldr r2, [r0, 0x7C]
	adds r0, r1, 0
	adds r1, r5, 0
	bl _call_via_r2
	b _081136BC
	.align 2, 0
_08113678: .4byte gUnknown_8456948
_0811367C:
	ldr r1, _081136C4 @ =gUnknown_203AE04
	movs r0, 0
	str r0, [r1]
	ldr r0, _081136C8 @ =gUnknown_8456948
	lsls r1, r4, 2
	adds r1, r0
	ldr r0, _081136CC @ =gUnknown_203AE08
	ldr r0, [r0]
	ldr r2, [r1]
_0811368E:
	adds r1, r5, 0
	bl _call_via_r2
	adds r1, r0, 0
	cmp r1, 0
	bne _081136AC
	bl sub_811231C
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8113828
	adds r1, r0, 0
	cmp r1, 0
	beq _081136BC
_081136AC:
	ldr r0, _081136CC @ =gUnknown_203AE08
	str r1, [r0]
	ldr r0, _081136D0 @ =gUnknown_203B048
	ldrb r0, [r0]
	cmp r0, 0
	beq _081136BC
	bl sub_811231C
_081136BC:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_081136C4: .4byte gUnknown_203AE04
_081136C8: .4byte gUnknown_8456948
_081136CC: .4byte gUnknown_203AE08
_081136D0: .4byte gUnknown_203B048
	thumb_func_end sub_8113550

	thumb_func_start sub_81136D4
sub_81136D4: @ 81136D4
	push {lr}
	ldr r0, _08113728 @ =gSaveBlock1Ptr
	ldr r2, [r0]
	movs r1, 0x4
	ldrsb r1, [r2, r1]
	adds r3, r0, 0
	cmp r1, 0x2
	bne _081136F0
	ldrb r0, [r2, 0x5]
	subs r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xA
	bls _08113724
_081136F0:
	ldr r2, [r3]
	ldrh r1, [r2, 0x4]
	ldr r0, _0811372C @ =0x0000090e
	cmp r1, r0
	beq _08113724
	movs r0, 0x4
	ldrsb r0, [r2, r0]
	cmp r0, 0x1F
	bne _08113708
	ldrb r0, [r2, 0x5]
	cmp r0, 0x1
	bls _08113724
_08113708:
	ldr r0, [r3]
	ldrh r1, [r0, 0x4]
	ldr r0, _08113730 @ =0x00002e01
	cmp r1, r0
	beq _08113724
	ldr r0, _08113734 @ =0x00003a01
	cmp r1, r0
	beq _08113724
	ldr r0, _08113738 @ =0x00000b02
	cmp r1, r0
	beq _08113724
	ldr r0, _0811373C @ =0x0000060a
	cmp r1, r0
	bne _08113740
_08113724:
	movs r0, 0x1
	b _08113742
	.align 2, 0
_08113728: .4byte gSaveBlock1Ptr
_0811372C: .4byte 0x0000090e
_08113730: .4byte 0x00002e01
_08113734: .4byte 0x00003a01
_08113738: .4byte 0x00000b02
_0811373C: .4byte 0x0000060a
_08113740:
	movs r0, 0
_08113742:
	pop {r1}
	bx r1
	thumb_func_end sub_81136D4

	thumb_func_start sub_8113748
sub_8113748: @ 8113748
	push {lr}
	bl sub_81136D4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08113770
	ldr r0, _08113764 @ =gUnknown_203ADFA
	ldrb r0, [r0]
	cmp r0, 0x2
	bne _08113768
	movs r0, 0x1
	b _08113772
	.align 2, 0
_08113764: .4byte gUnknown_203ADFA
_08113768:
	cmp r0, 0x1
	bne _08113770
	bl sub_8112364
_08113770:
	movs r0, 0
_08113772:
	pop {r1}
	bx r1
	thumb_func_end sub_8113748

	thumb_func_start sub_8113778
sub_8113778: @ 8113778
	push {r4,r5,lr}
	adds r5, r1, 0
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x24
	beq _081137CE
	cmp r4, 0xB
	beq _081137CE
	ldr r0, _081137D4 @ =0x0000082c
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	bne _081137AC
	cmp r4, 0x3
	beq _081137CE
	cmp r4, 0x1F
	beq _081137CE
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_81137E4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _081137CE
_081137AC:
	ldr r0, _081137D8 @ =0x00000844
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	bne _081137DC
	subs r0, r4, 0x4
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x6
	bls _081137CE
	cmp r4, 0x16
	beq _081137CE
	cmp r4, 0x19
	beq _081137CE
	cmp r4, 0x1A
	bne _081137DC
_081137CE:
	movs r0, 0x1
	b _081137DE
	.align 2, 0
_081137D4: .4byte 0x0000082c
_081137D8: .4byte 0x00000844
_081137DC:
	movs r0, 0
_081137DE:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8113778

	thumb_func_start sub_81137E4
sub_81137E4: @ 81137E4
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x22
	bne _08113814
	ldr r2, _08113810 @ =gTrainers
	ldrh r1, [r1]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldrb r1, [r0, 0x1]
	cmp r1, 0x51
	beq _08113814
	cmp r1, 0x59
	beq _08113814
	cmp r1, 0x5A
	beq _08113814
	cmp r1, 0x53
	beq _08113814
	movs r0, 0x1
	b _08113816
	.align 2, 0
_08113810: .4byte gTrainers
_08113814:
	movs r0, 0
_08113816:
	pop {r1}
	bx r1
	thumb_func_end sub_81137E4

	thumb_func_start sub_811381C
sub_811381C: @ 811381C
	ldr r1, _08113824 @ =gUnknown_203B048
	movs r0, 0
	strb r0, [r1]
	bx lr
	.align 2, 0
_08113824: .4byte gUnknown_203B048
	thumb_func_end sub_811381C

	thumb_func_start sub_8113828
sub_8113828: @ 8113828
	push {r4,r5,lr}
	adds r5, r1, 0
	lsls r0, 16
	lsrs r4, r0, 16
	adds r0, r4, 0
	bl sub_8113778
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0811384C
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_81153A8
	lsls r0, 24
	cmp r0, 0
	bne _08113850
_0811384C:
	movs r0, 0
	b _0811388C
_08113850:
	adds r0, r4, 0
	bl sub_8110AEC
	adds r0, r4, 0
	bl sub_8113B94
	cmp r4, 0x1F
	bne _08113874
	ldr r2, _0811386C @ =gUnknown_203AE04
	ldr r1, _08113870 @ =gUnknown_203AE08
	ldr r0, [r1]
	str r0, [r2]
	adds r2, r1, 0
	b _0811387C
	.align 2, 0
_0811386C: .4byte gUnknown_203AE04
_08113870: .4byte gUnknown_203AE08
_08113874:
	ldr r1, _08113894 @ =gUnknown_203AE04
	movs r0, 0
	str r0, [r1]
	ldr r2, _08113898 @ =gUnknown_203AE08
_0811387C:
	ldr r0, _0811389C @ =gUnknown_8456948
	lsls r1, r4, 2
	adds r1, r0
	ldr r0, [r2]
	ldr r2, [r1]
	adds r1, r5, 0
	bl _call_via_r2
_0811388C:
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08113894: .4byte gUnknown_203AE04
_08113898: .4byte gUnknown_203AE08
_0811389C: .4byte gUnknown_8456948
	thumb_func_end sub_8113828

	thumb_func_start sub_81138A0
sub_81138A0: @ 81138A0
	push {r4,r5,lr}
	adds r5, r1, 0
	lsls r0, 16
	lsrs r0, 16
	adds r4, r0, 0
	subs r0, 0xC
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x7
	bls _081138B8
	movs r0, 0
	b _081138F0
_081138B8:
	bl sub_81138F8
	ldr r1, _081138E0 @ =gUnknown_203B024
	strh r4, [r1]
	adds r0, r4, 0
	subs r0, 0x10
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	bls _081138EE
	cmp r4, 0xC
	beq _081138D4
	cmp r4, 0x12
	bne _081138E4
_081138D4:
	adds r0, r1, 0x4
	adds r1, r5, 0
	movs r2, 0xC
	bl memcpy
	b _081138EE
	.align 2, 0
_081138E0: .4byte gUnknown_203B024
_081138E4:
	adds r0, r1, 0x4
	adds r1, r5, 0
	movs r2, 0x18
	bl memcpy
_081138EE:
	movs r0, 0x1
_081138F0:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_81138A0

	thumb_func_start sub_81138F8
sub_81138F8: @ 81138F8
	push {lr}
	ldr r0, _08113908 @ =gUnknown_203B024
	movs r1, 0
	movs r2, 0x20
	bl memset
	pop {r0}
	bx r0
	.align 2, 0
_08113908: .4byte gUnknown_203B024
	thumb_func_end sub_81138F8

	thumb_func_start sub_811390C
sub_811390C: @ 811390C
	push {r4,r5,lr}
	ldr r5, _08113944 @ =gUnknown_203B024
	ldrh r0, [r5]
	cmp r0, 0
	beq _0811393C
	ldr r1, _08113948 @ =gUnknown_203B04A
	movs r0, 0
	strb r0, [r1]
	ldrh r0, [r5]
	bl sub_8110AEC
	ldr r0, _0811394C @ =gUnknown_8456948
	ldrh r2, [r5]
	lsls r2, 2
	adds r2, r0
	ldr r4, _08113950 @ =gUnknown_203AE08
	ldr r0, [r4]
	adds r1, r5, 0x4
	ldr r2, [r2]
	bl _call_via_r2
	str r0, [r4]
	bl sub_81138F8
_0811393C:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08113944: .4byte gUnknown_203B024
_08113948: .4byte gUnknown_203B04A
_0811394C: .4byte gUnknown_8456948
_08113950: .4byte gUnknown_203AE08
	thumb_func_end sub_811390C

	thumb_func_start sub_8113954
sub_8113954: @ 8113954
	push {r4,r5,lr}
	adds r5, r1, 0
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x22
	beq _08113970
	cmp r4, 0x1E
	beq _08113970
	cmp r4, 0x20
	beq _08113970
	cmp r4, 0x21
	beq _08113970
	movs r0, 0
	b _081139A8
_08113970:
	bl sub_81138F8
	ldr r0, _081139B0 @ =gUnknown_3005E88
	ldrb r0, [r0]
	cmp r0, 0
	bne _08113998
	ldr r0, _081139B4 @ =0x0000082c
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	bne _08113998
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_81137E4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _081139A6
_08113998:
	ldr r0, _081139B8 @ =gUnknown_203B024
	strh r4, [r0]
	adds r0, 0x4
	adds r1, r5, 0
	movs r2, 0x8
	bl memcpy
_081139A6:
	movs r0, 0x1
_081139A8:
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_081139B0: .4byte gUnknown_3005E88
_081139B4: .4byte 0x0000082c
_081139B8: .4byte gUnknown_203B024
	thumb_func_end sub_8113954

	thumb_func_start sub_81139BC
sub_81139BC: @ 81139BC
	push {r4,r5,lr}
	ldr r5, _08113A08 @ =gUnknown_203B024
	ldrh r0, [r5]
	cmp r0, 0
	beq _08113A02
	ldr r0, _08113A0C @ =gUnknown_3005E88
	ldrb r1, [r0]
	cmp r1, 0
	bne _081139D8
	ldr r0, _08113A10 @ =gUnknown_203B04A
	strb r1, [r0]
	ldrh r0, [r5]
	bl sub_8110AEC
_081139D8:
	ldrh r0, [r5]
	bl sub_8113B94
	ldr r0, _08113A14 @ =gUnknown_8456948
	ldrh r2, [r5]
	lsls r2, 2
	adds r2, r0
	ldr r4, _08113A18 @ =gUnknown_203AE08
	ldr r0, [r4]
	adds r1, r5, 0x4
	ldr r2, [r2]
	bl _call_via_r2
	str r0, [r4]
	movs r0, 0x1
	bl sub_8113A1C
	bl sub_81138F8
	bl sub_811231C
_08113A02:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08113A08: .4byte gUnknown_203B024
_08113A0C: .4byte gUnknown_3005E88
_08113A10: .4byte gUnknown_203B04A
_08113A14: .4byte gUnknown_8456948
_08113A18: .4byte gUnknown_203AE08
	thumb_func_end sub_81139BC

	thumb_func_start sub_8113A1C
sub_8113A1C: @ 8113A1C
	push {r4,lr}
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	ldr r4, _08113A3C @ =gUnknown_203AE08
	ldr r0, [r4]
	bl sub_8113C5C
	str r0, [r4]
	ldr r1, _08113A40 @ =gUnknown_203AF98
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08113A3C: .4byte gUnknown_203AE08
_08113A40: .4byte gUnknown_203AF98
	thumb_func_end sub_8113A1C

	thumb_func_start sub_8113A44
sub_8113A44: @ 8113A44
	push {r4,lr}
	adds r4, r1, 0
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1F
	bne _08113A6C
	ldrh r0, [r4]
	bl sub_8114FBC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08113A70
	ldrh r0, [r4, 0x2]
	bl sub_8114FBC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08113A70
_08113A6C:
	movs r0, 0
	b _08113A72
_08113A70:
	movs r0, 0x1
_08113A72:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8113A44

	thumb_func_start sub_8113A78
sub_8113A78: @ 8113A78
	push {r4,r5,lr}
	adds r3, r0, 0
	adds r5, r1, 0
	ldrh r1, [r3]
	ldr r0, _08113AAC @ =0x00000fff
	ands r0, r1
	adds r2, r0, 0
	lsrs r4, r1, 12
	cmp r2, 0x21
	bne _08113A8E
	movs r4, 0
_08113A8E:
	subs r0, r2, 0x3
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x27
	bhi _08113AB4
	str r3, [r5]
	ldr r0, _08113AB0 @ =gUnknown_8456AA0
	adds r0, r2, r0
	ldrb r0, [r0]
	subs r1, r0, 0x4
	muls r1, r4
	adds r0, r1
	adds r0, r3, r0
	b _08113AB6
	.align 2, 0
_08113AAC: .4byte 0x00000fff
_08113AB0: .4byte gUnknown_8456AA0
_08113AB4:
	movs r0, 0
_08113AB6:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8113A78

	thumb_func_start sub_8113ABC
sub_8113ABC: @ 8113ABC
	push {lr}
	adds r2, r0, 0x4
	ldrh r1, [r0]
	ldr r0, _08113AD0 @ =0x00000fff
	ands r0, r1
	cmp r0, 0x23
	beq _08113AD8
	ldr r1, _08113AD4 @ =gUnknown_203B04A
	movs r0, 0
	b _08113ADE
	.align 2, 0
_08113AD0: .4byte 0x00000fff
_08113AD4: .4byte gUnknown_203B04A
_08113AD8:
	ldr r1, _08113AE4 @ =gUnknown_203B04A
	ldrb r0, [r2, 0x1]
	adds r0, 0x1
_08113ADE:
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08113AE4: .4byte gUnknown_203B04A
	thumb_func_end sub_8113ABC

	thumb_func_start sub_8113AE8
sub_8113AE8: @ 8113AE8
	push {r4,lr}
	adds r4, r0, 0
	cmp r0, 0
	beq _08113AFA
	ldr r1, _08113B00 @ =gUnknown_203AF98
	ldrh r0, [r0, 0x2]
	ldrh r1, [r1]
	cmp r0, r1
	bls _08113B04
_08113AFA:
	movs r0, 0
	b _08113B32
	.align 2, 0
_08113B00: .4byte gUnknown_203AF98
_08113B04:
	ldr r2, _08113B38 @ =gUnknown_84569F4
	ldrh r1, [r4]
	ldr r0, _08113B3C @ =0x00000fff
	ands r0, r1
	lsls r0, 2
	adds r0, r2
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
	ldr r2, _08113B40 @ =gUnknown_203B044
	ldrh r1, [r4]
	strb r1, [r2]
	movs r0, 0xF0
	lsls r0, 8
	ands r0, r1
	lsrs r0, 12
	strb r0, [r2, 0x1]
	cmp r0, 0
	beq _08113B30
	movs r0, 0x1
	strh r0, [r2, 0x2]
_08113B30:
	movs r0, 0x1
_08113B32:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08113B38: .4byte gUnknown_84569F4
_08113B3C: .4byte 0x00000fff
_08113B40: .4byte gUnknown_203B044
	thumb_func_end sub_8113AE8

	thumb_func_start sub_8113B44
sub_8113B44: @ 8113B44
	push {r4,lr}
	adds r2, r0, 0
	ldr r4, _08113B54 @ =gUnknown_203B044
	ldrh r0, [r4, 0x2]
	cmp r0, 0
	bne _08113B58
	movs r0, 0
	b _08113B7E
	.align 2, 0
_08113B54: .4byte gUnknown_203B044
_08113B58:
	ldr r1, _08113B84 @ =gUnknown_84569F4
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, [r0]
	adds r0, r2, 0
	bl _call_via_r1
	ldrh r0, [r4, 0x2]
	adds r0, 0x1
	strh r0, [r4, 0x2]
	lsls r0, 16
	lsrs r0, 16
	ldrb r4, [r4, 0x1]
	cmp r0, r4
	bls _08113B7C
	bl sub_8113B88
_08113B7C:
	movs r0, 0x1
_08113B7E:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08113B84: .4byte gUnknown_84569F4
	thumb_func_end sub_8113B44

	thumb_func_start sub_8113B88
sub_8113B88: @ 8113B88
	ldr r1, _08113B90 @ =gUnknown_203B044
	movs r0, 0
	str r0, [r1]
	bx lr
	.align 2, 0
_08113B90: .4byte gUnknown_203B044
	thumb_func_end sub_8113B88

	thumb_func_start sub_8113B94
sub_8113B94: @ 8113B94
	push {r4,lr}
	lsls r0, 16
	lsrs r0, 16
	adds r4, r0, 0
	ldr r2, _08113BC0 @ =gUnknown_203B044
	ldrb r1, [r2]
	lsls r0, r4, 24
	lsrs r0, 24
	ldr r3, _08113BC4 @ =gUnknown_203AF98
	cmp r1, r0
	bne _08113BB2
	ldrh r1, [r2, 0x2]
	ldrh r0, [r3]
	cmp r1, r0
	beq _08113BC8
_08113BB2:
	movs r0, 0
	strb r4, [r2]
	strb r0, [r2, 0x1]
	ldrh r0, [r3]
	strh r0, [r2, 0x2]
	b _08113BD2
	.align 2, 0
_08113BC0: .4byte gUnknown_203B044
_08113BC4: .4byte gUnknown_203AF98
_08113BC8:
	ldrb r0, [r2, 0x1]
	cmp r0, 0x4
	bhi _08113BD2
	adds r0, 0x1
	strb r0, [r2, 0x1]
_08113BD2:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8113B94

	thumb_func_start sub_8113BD8
sub_8113BD8: @ 8113BD8
	ldr r0, _08113BE8 @ =gUnknown_203B049
	movs r1, 0
	strb r1, [r0]
	ldr r0, _08113BEC @ =gUnknown_203B04A
	strb r1, [r0]
	ldr r0, _08113BF0 @ =gUnknown_203B04B
	strb r1, [r0]
	bx lr
	.align 2, 0
_08113BE8: .4byte gUnknown_203B049
_08113BEC: .4byte gUnknown_203B04A
_08113BF0: .4byte gUnknown_203B04B
	thumb_func_end sub_8113BD8

	thumb_func_start sub_8113BF4
sub_8113BF4: @ 8113BF4
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _08113C14 @ =gUnknown_8456AA0
	adds r0, 0x27
	ldrb r1, [r0]
	adds r0, r4, 0
	bl sub_8110988
	lsls r0, 24
	cmp r0, 0
	beq _08113C18
	movs r0, 0x27
	strh r0, [r4]
	adds r0, r4, 0x2
	b _08113C1A
	.align 2, 0
_08113C14: .4byte gUnknown_8456AA0
_08113C18:
	movs r0, 0
_08113C1A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8113BF4

	thumb_func_start sub_8113C20
sub_8113C20: @ 8113C20
	push {r4,r5,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	ldr r0, _08113C50 @ =gUnknown_8456AA0
	adds r0, 0x27
	ldrb r1, [r0]
	adds r0, r5, 0
	bl sub_8110988
	lsls r0, 24
	cmp r0, 0
	beq _08113C54
	movs r0, 0xFF
	strb r0, [r4, 0x6]
	movs r1, 0
	movs r0, 0
	strh r0, [r4, 0x4]
	strb r1, [r4]
	strb r1, [r4, 0x1]
	strb r1, [r4, 0x2]
	strb r1, [r4, 0x3]
	adds r0, r5, 0x2
	b _08113C56
	.align 2, 0
_08113C50: .4byte gUnknown_8456AA0
_08113C54:
	movs r0, 0
_08113C56:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8113C20

	thumb_func_start sub_8113C5C
sub_8113C5C: @ 8113C5C
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r1, 16
	lsrs r5, r1, 16
	ldr r0, _08113C80 @ =gUnknown_8456AA0
	adds r0, 0x29
	ldrb r1, [r0]
	adds r0, r4, 0
	bl sub_8110988
	lsls r0, 24
	cmp r0, 0
	beq _08113C84
	movs r0, 0x29
	strh r0, [r4]
	strh r5, [r4, 0x2]
	adds r0, r4, 0x4
	b _08113C86
	.align 2, 0
_08113C80: .4byte gUnknown_8456AA0
_08113C84:
	movs r0, 0
_08113C86:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8113C5C

	thumb_func_start sub_8113C8C
sub_8113C8C: @ 8113C8C
	push {r4,r5,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	ldr r0, _08113CBC @ =gUnknown_8456AA0
	adds r0, 0x29
	ldrb r1, [r0]
	adds r0, r5, 0
	bl sub_8110988
	lsls r0, 24
	cmp r0, 0
	beq _08113CC0
	movs r0, 0xFE
	strb r0, [r4, 0x6]
	ldrh r1, [r5, 0x2]
	movs r0, 0
	strh r1, [r4, 0x4]
	strb r0, [r4]
	strb r0, [r4, 0x1]
	strb r0, [r4, 0x2]
	strb r0, [r4, 0x3]
	adds r0, r5, 0x4
	b _08113CC2
	.align 2, 0
_08113CBC: .4byte gUnknown_8456AA0
_08113CC0:
	movs r0, 0
_08113CC2:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8113C8C

	thumb_func_start sub_8113CC8
sub_8113CC8: @ 8113CC8
	push {r4-r6,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r6, r4, 0x4
	ldr r0, _08113CFC @ =gUnknown_8456AA0
	ldrb r1, [r0]
	adds r0, r4, 0
	bl sub_8110988
	lsls r0, 24
	cmp r0, 0
	beq _08113D00
	movs r0, 0
	strh r0, [r4]
	ldrh r0, [r5, 0x4]
	strh r0, [r4, 0x2]
	ldrb r0, [r5]
	strb r0, [r4, 0x4]
	ldrb r0, [r5, 0x1]
	strb r0, [r6, 0x1]
	ldrb r0, [r5, 0x2]
	strb r0, [r6, 0x2]
	ldrb r0, [r5, 0x3]
	strb r0, [r6, 0x3]
	adds r0, r6, 0x4
	b _08113D02
	.align 2, 0
_08113CFC: .4byte gUnknown_8456AA0
_08113D00:
	movs r0, 0
_08113D02:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_8113CC8

	thumb_func_start sub_8113D08
sub_8113D08: @ 8113D08
	push {r4-r6,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	adds r6, r5, 0x4
	ldr r0, _08113D3C @ =gUnknown_8456AA0
	ldrb r1, [r0]
	adds r0, r5, 0
	bl sub_8110988
	lsls r0, 24
	cmp r0, 0
	beq _08113D40
	movs r0, 0x2
	strb r0, [r4, 0x6]
	ldrh r0, [r5, 0x2]
	strh r0, [r4, 0x4]
	ldrb r0, [r5, 0x4]
	strb r0, [r4]
	ldrb r0, [r6, 0x1]
	strb r0, [r4, 0x1]
	ldrb r0, [r6, 0x2]
	strb r0, [r4, 0x2]
	ldrb r0, [r6, 0x3]
	strb r0, [r4, 0x3]
	adds r0, r6, 0x4
	b _08113D42
	.align 2, 0
_08113D3C: .4byte gUnknown_8456AA0
_08113D40:
	movs r0, 0
_08113D42:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_8113D08

	thumb_func_start sub_8113D48
sub_8113D48: @ 8113D48
	push {r4-r6,lr}
	adds r5, r1, 0
	adds r4, r0, 0
	adds r6, r4, 0x4
	ldr r0, _08113D64 @ =gUnknown_8456AA0
	ldrb r1, [r0, 0x2]
	adds r0, r4, 0
	bl sub_8110988
	lsls r0, 24
	cmp r0, 0
	bne _08113D68
	movs r0, 0
	b _08113D8C
	.align 2, 0
_08113D64: .4byte gUnknown_8456AA0
_08113D68:
	ldrb r0, [r5, 0x6]
	cmp r0, 0
	bne _08113D72
	movs r0, 0x2
	b _08113D74
_08113D72:
	movs r0, 0x1
_08113D74:
	strh r0, [r4]
	ldrh r0, [r5, 0x4]
	strh r0, [r4, 0x2]
	ldrb r0, [r5]
	strb r0, [r6]
	ldrb r0, [r5, 0x1]
	strb r0, [r6, 0x1]
	ldrb r0, [r5, 0x2]
	strb r0, [r6, 0x2]
	ldrb r0, [r5, 0x3]
	strb r0, [r6, 0x3]
	adds r0, r6, 0x4
_08113D8C:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_8113D48

	thumb_func_start sub_8113D94
sub_8113D94: @ 8113D94
	push {r4-r6,lr}
	adds r4, r1, 0
	adds r5, r0, 0
	adds r6, r5, 0x4
	ldr r0, _08113DB0 @ =gUnknown_8456AA0
	ldrb r1, [r0, 0x2]
	adds r0, r5, 0
	bl sub_8110988
	lsls r0, 24
	cmp r0, 0
	bne _08113DB4
	movs r0, 0
	b _08113DD8
	.align 2, 0
_08113DB0: .4byte gUnknown_8456AA0
_08113DB4:
	ldrh r0, [r5]
	cmp r0, 0x2
	bne _08113DBE
	movs r0, 0
	b _08113DC0
_08113DBE:
	movs r0, 0x1
_08113DC0:
	strb r0, [r4, 0x6]
	ldrh r0, [r5, 0x2]
	strh r0, [r4, 0x4]
	ldrb r0, [r6]
	strb r0, [r4]
	ldrb r0, [r6, 0x1]
	strb r0, [r4, 0x1]
	ldrb r0, [r6, 0x2]
	strb r0, [r4, 0x2]
	ldrb r0, [r6, 0x3]
	strb r0, [r4, 0x3]
	adds r0, r6, 0x4
_08113DD8:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_8113D94

	thumb_func_start sub_8113DE0
sub_8113DE0: @ 8113DE0
	push {r4-r7,lr}
	adds r4, r1, 0
	lsls r0, 16
	lsrs r7, r0, 16
	ldr r0, _08113DF8 @ =gUnknown_203B044
	ldrb r0, [r0, 0x1]
	cmp r0, 0
	bne _08113E00
	ldr r0, _08113DFC @ =gUnknown_8456AA0
	adds r0, r7, r0
	ldrb r6, [r0]
	b _08113E0C
	.align 2, 0
_08113DF8: .4byte gUnknown_203B044
_08113DFC: .4byte gUnknown_8456AA0
_08113E00:
	ldr r0, _08113E20 @ =gUnknown_8456AA0
	adds r0, r7, r0
	ldrb r0, [r0]
	subs r0, 0x4
	lsls r0, 24
	lsrs r6, r0, 24
_08113E0C:
	adds r0, r4, 0
	adds r1, r6, 0
	bl sub_8110944
	lsls r0, 24
	cmp r0, 0
	bne _08113E24
	movs r0, 0
	b _08113E7C
	.align 2, 0
_08113E20: .4byte gUnknown_8456AA0
_08113E24:
	adds r5, r4, 0
	ldr r2, _08113E60 @ =gUnknown_203B044
	ldrb r1, [r2, 0x1]
	cmp r1, 0
	beq _08113E36
	adds r0, r1, 0
	muls r0, r6
	adds r0, 0x4
	subs r5, r0
_08113E36:
	cmp r1, 0x5
	bne _08113E64
	movs r4, 0
_08113E3C:
	adds r0, r4, 0
	muls r0, r6
	adds r0, r5
	adds r0, 0x4
	adds r4, 0x1
	adds r1, r4, 0
	muls r1, r6
	adds r1, r5
	adds r1, 0x4
	adds r2, r6, 0
	bl memcpy
	lsls r4, 24
	lsrs r4, 24
	cmp r4, 0x3
	bls _08113E3C
	movs r1, 0x4
	b _08113E66
	.align 2, 0
_08113E60: .4byte gUnknown_203B044
_08113E64:
	ldrb r1, [r2, 0x1]
_08113E66:
	lsls r0, r1, 12
	adds r0, r7, r0
	strh r0, [r5]
	ldr r0, _08113E84 @ =gUnknown_203AF98
	ldrh r0, [r0]
	strh r0, [r5, 0x2]
	adds r0, r1, 0
	muls r0, r6
	adds r0, 0x4
	adds r5, r0
	adds r0, r5, 0
_08113E7C:
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08113E84: .4byte gUnknown_203AF98
	thumb_func_end sub_8113DE0

	thumb_func_start sub_8113E88
sub_8113E88: @ 8113E88
	lsls r0, 16
	lsrs r0, 16
	ldr r2, _08113EA4 @ =gUnknown_203B044
	ldrh r3, [r2, 0x2]
	ldr r2, _08113EA8 @ =gUnknown_8456AA0
	adds r0, r2
	ldrb r0, [r0]
	subs r0, 0x4
	muls r0, r3
	adds r0, 0x4
	adds r1, r0
	adds r0, r1, 0
	bx lr
	.align 2, 0
_08113EA4: .4byte gUnknown_203B044
_08113EA8: .4byte gUnknown_8456AA0
	thumb_func_end sub_8113E88

	thumb_func_start sub_8113EAC
sub_8113EAC: @ 8113EAC
	push {r4,r5,lr}
	adds r3, r1, 0
	lsls r0, 16
	lsrs r1, r0, 16
	adds r4, r1, 0
	lsls r2, 24
	lsrs r2, 24
	adds r5, r2, 0
	cmp r3, 0
	beq _08113EE0
	movs r0, 0xCE
	lsls r0, 1
	cmp r1, r0
	beq _08113ED0
	adds r0, r3, 0
	bl GetSpeciesName
	b _08113F08
_08113ED0:
	ldr r1, _08113EDC @ =gUnknown_8415A62
	adds r0, r3, 0
	bl StringCopy
	b _08113F08
	.align 2, 0
_08113EDC: .4byte gUnknown_8415A62
_08113EE0:
	movs r0, 0xCE
	lsls r0, 1
	cmp r4, r0
	beq _08113F00
	movs r0, 0xB
	adds r1, r4, 0
	muls r1, r0
	ldr r0, _08113EFC @ =gUnknown_8245EE0
	adds r1, r0
	adds r0, r2, 0
	bl UnkTextUtil_SetPtrI
	b _08113F08
	.align 2, 0
_08113EFC: .4byte gUnknown_8245EE0
_08113F00:
	ldr r1, _08113F10 @ =gUnknown_8415A62
	adds r0, r5, 0
	bl UnkTextUtil_SetPtrI
_08113F08:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08113F10: .4byte gUnknown_8415A62
	thumb_func_end sub_8113EAC

	thumb_func_start sub_8113F14
sub_8113F14: @ 8113F14
	push {r4,lr}
	adds r2, r0, 0
	adds r4, r1, 0
	movs r0, 0x3
	adds r1, r2, 0
	bl sub_8113DE0
	adds r2, r0, 0
	cmp r2, 0
	beq _08113F34
	ldrh r0, [r4]
	strh r0, [r2]
	ldrh r0, [r4, 0x2]
	strh r0, [r2, 0x2]
	adds r0, r2, 0x4
	b _08113F36
_08113F34:
	movs r0, 0
_08113F36:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8113F14

	thumb_func_start sub_8113F3C
sub_8113F3C: @ 8113F3C
	push {r4,lr}
	adds r1, r0, 0
	movs r0, 0x3
	bl sub_8113E88
	adds r4, r0, 0
	ldrh r0, [r4]
	ldr r1, _08113F70 @ =gStringVar1
	movs r2, 0
	bl sub_8113EAC
	ldrh r0, [r4, 0x2]
	ldr r1, _08113F74 @ =gStringVar2
	movs r2, 0
	bl sub_8113EAC
	ldr r0, _08113F78 @ =gStringVar4
	ldr r1, _08113F7C @ =gUnknown_841A16F
	bl StringExpandPlaceholders
	adds r4, 0x4
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08113F70: .4byte gStringVar1
_08113F74: .4byte gStringVar2
_08113F78: .4byte gStringVar4
_08113F7C: .4byte gUnknown_841A16F
	thumb_func_end sub_8113F3C

	thumb_func_start sub_8113F80
sub_8113F80: @ 8113F80
	push {r4,lr}
	adds r2, r0, 0
	adds r4, r1, 0
	movs r0, 0x4
	adds r1, r2, 0
	bl sub_8113DE0
	adds r2, r0, 0
	cmp r2, 0
	bne _08113F98
	movs r0, 0
	b _08113FB2
_08113F98:
	ldrh r0, [r4]
	strh r0, [r2]
	ldrh r0, [r4, 0x4]
	strh r0, [r2, 0x2]
	ldrh r0, [r4, 0x6]
	strh r0, [r2, 0x4]
	ldrh r0, [r4]
	cmp r0, 0x55
	bne _08113FB0
	ldr r1, _08113FB8 @ =gUnknown_203B048
	movs r0, 0x2
	strb r0, [r1]
_08113FB0:
	adds r0, r2, 0x6
_08113FB2:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08113FB8: .4byte gUnknown_203B048
	thumb_func_end sub_8113F80

	thumb_func_start sub_8113FBC
sub_8113FBC: @ 8113FBC
	push {r4-r7,lr}
	adds r1, r0, 0
	movs r0, 0x4
	bl sub_8113E88
	adds r5, r0, 0
	ldrh r0, [r5]
	bl ItemId_GetPocket
	lsls r0, 24
	lsrs r0, 24
	subs r0, 0x1
	cmp r0, 0x4
	bls _08113FDA
	b _0811413C
_08113FDA:
	lsls r0, 2
	ldr r1, _08113FE4 @ =_08113FE8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08113FE4: .4byte _08113FE8
	.align 2, 0
_08113FE8:
	.4byte _08113FFC
	.4byte _08114074
	.4byte _08113FFC
	.4byte _0811409C
	.4byte _08113FFC
_08113FFC:
	ldr r4, _08114024 @ =gStringVar1
	ldrh r0, [r5]
	bl ItemId_GetItem
	adds r1, r0, 0
	adds r0, r4, 0
	bl StringCopy
	ldrh r0, [r5]
	cmp r0, 0x55
	bne _08114034
	ldr r0, _08114028 @ =gStringVar2
	ldrb r1, [r5, 0x4]
	bl sub_80C4DF8
	ldr r0, _0811402C @ =gStringVar4
	ldr r1, _08114030 @ =gUnknown_841AFA6
	bl StringExpandPlaceholders
	b _0811413C
	.align 2, 0
_08114024: .4byte gStringVar1
_08114028: .4byte gStringVar2
_0811402C: .4byte gStringVar4
_08114030: .4byte gUnknown_841AFA6
_08114034:
	ldrh r1, [r5, 0x2]
	ldr r0, _08114050 @ =0x0000ffff
	cmp r1, r0
	beq _08114060
	adds r0, r1, 0
	ldr r1, _08114054 @ =gStringVar2
	movs r2, 0
	bl sub_8113EAC
	ldr r0, _08114058 @ =gStringVar4
	ldr r1, _0811405C @ =gUnknown_841A1E7
	bl StringExpandPlaceholders
	b _0811413C
	.align 2, 0
_08114050: .4byte 0x0000ffff
_08114054: .4byte gStringVar2
_08114058: .4byte gStringVar4
_0811405C: .4byte gUnknown_841A1E7
_08114060:
	ldr r0, _0811406C @ =gStringVar4
	ldr r1, _08114070 @ =gUnknown_841A210
	bl StringExpandPlaceholders
	b _0811413C
	.align 2, 0
_0811406C: .4byte gStringVar4
_08114070: .4byte gUnknown_841A210
_08114074:
	ldr r4, _08114090 @ =gStringVar1
	ldrh r0, [r5]
	bl ItemId_GetItem
	adds r1, r0, 0
	adds r0, r4, 0
	bl StringCopy
	ldr r0, _08114094 @ =gStringVar4
	ldr r1, _08114098 @ =gUnknown_841A220
	bl StringExpandPlaceholders
	b _0811413C
	.align 2, 0
_08114090: .4byte gStringVar1
_08114094: .4byte gStringVar4
_08114098: .4byte gUnknown_841A220
_0811409C:
	ldrh r0, [r5, 0x2]
	ldr r1, _081140E8 @ =gStringVar1
	movs r2, 0
	bl sub_8113EAC
	ldr r4, _081140EC @ =gStringVar2
	ldrh r0, [r5]
	bl ItemIdToBattleMoveId
	lsls r0, 16
	lsrs r0, 16
	movs r7, 0xD
	adds r1, r0, 0
	muls r1, r7
	ldr r6, _081140F0 @ =gUnknown_8247094
	adds r1, r6
	adds r0, r4, 0
	bl StringCopy
	ldrh r1, [r5, 0x4]
	ldr r0, _081140F4 @ =0x0000ffff
	cmp r1, r0
	beq _08114118
	ldr r0, _081140F8 @ =gStringVar3
	muls r1, r7
	adds r1, r6
	bl StringCopy
	ldrh r1, [r5]
	movs r0, 0xA9
	lsls r0, 1
	cmp r1, r0
	bls _08114104
	ldr r0, _081140FC @ =gStringVar4
	ldr r1, _08114100 @ =gUnknown_841A965
	bl StringExpandPlaceholders
	b _0811413C
	.align 2, 0
_081140E8: .4byte gStringVar1
_081140EC: .4byte gStringVar2
_081140F0: .4byte gUnknown_8247094
_081140F4: .4byte 0x0000ffff
_081140F8: .4byte gStringVar3
_081140FC: .4byte gStringVar4
_08114100: .4byte gUnknown_841A965
_08114104:
	ldr r0, _08114110 @ =gStringVar4
	ldr r1, _08114114 @ =gUnknown_841A277
	bl StringExpandPlaceholders
	b _0811413C
	.align 2, 0
_08114110: .4byte gStringVar4
_08114114: .4byte gUnknown_841A277
_08114118:
	ldrh r1, [r5]
	movs r0, 0xA9
	lsls r0, 1
	cmp r1, r0
	bls _08114134
	ldr r0, _0811412C @ =gStringVar4
	ldr r1, _08114130 @ =gUnknown_841A938
	bl StringExpandPlaceholders
	b _0811413C
	.align 2, 0
_0811412C: .4byte gStringVar4
_08114130: .4byte gUnknown_841A938
_08114134:
	ldr r0, _08114144 @ =gStringVar4
	ldr r1, _08114148 @ =gUnknown_841A255
	bl StringExpandPlaceholders
_0811413C:
	adds r0, r5, 0x6
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08114144: .4byte gStringVar4
_08114148: .4byte gUnknown_841A255
	thumb_func_end sub_8113FBC

	thumb_func_start sub_811414C
sub_811414C: @ 811414C
	push {r4,lr}
	adds r4, r2, 0
	lsls r0, 16
	lsrs r0, 16
	bl sub_8113DE0
	adds r1, r0, 0
	cmp r1, 0
	beq _0811416A
	ldrh r0, [r4]
	strh r0, [r1]
	ldrh r0, [r4, 0x4]
	strh r0, [r1, 0x2]
	adds r0, r1, 0x4
	b _0811416C
_0811416A:
	movs r0, 0
_0811416C:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_811414C

	thumb_func_start sub_8114174
sub_8114174: @ 8114174
	push {lr}
	adds r3, r0, 0
	adds r2, r1, 0
	movs r0, 0x5
	adds r1, r3, 0
	bl sub_811414C
	pop {r1}
	bx r1
	thumb_func_end sub_8114174

	thumb_func_start sub_8114188
sub_8114188: @ 8114188
	push {r4,r5,lr}
	adds r1, r0, 0
	movs r0, 0x5
	bl sub_8113E88
	adds r4, r0, 0
	ldrh r0, [r4, 0x2]
	ldr r1, _081141C0 @ =gStringVar1
	movs r2, 0
	bl sub_8113EAC
	ldr r5, _081141C4 @ =gStringVar2
	ldrh r0, [r4]
	bl ItemId_GetItem
	adds r1, r0, 0
	adds r0, r5, 0
	bl StringCopy
	ldr r0, _081141C8 @ =gStringVar4
	ldr r1, _081141CC @ =gUnknown_841AB74
	bl StringExpandPlaceholders
	adds r4, 0x4
	adds r0, r4, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_081141C0: .4byte gStringVar1
_081141C4: .4byte gStringVar2
_081141C8: .4byte gStringVar4
_081141CC: .4byte gUnknown_841AB74
	thumb_func_end sub_8114188

	thumb_func_start sub_81141D0
sub_81141D0: @ 81141D0
	push {lr}
	adds r3, r0, 0
	adds r2, r1, 0
	movs r0, 0x6
	adds r1, r3, 0
	bl sub_811414C
	pop {r1}
	bx r1
	thumb_func_end sub_81141D0

	thumb_func_start sub_81141E4
sub_81141E4: @ 81141E4
	push {r4,r5,lr}
	adds r1, r0, 0
	movs r0, 0x6
	bl sub_8113E88
	adds r4, r0, 0
	ldrh r0, [r4, 0x2]
	ldr r1, _0811421C @ =gStringVar1
	movs r2, 0
	bl sub_8113EAC
	ldr r5, _08114220 @ =gStringVar2
	ldrh r0, [r4]
	bl ItemId_GetItem
	adds r1, r0, 0
	adds r0, r5, 0
	bl StringCopy
	ldr r0, _08114224 @ =gStringVar4
	ldr r1, _08114228 @ =gUnknown_841AB8E
	bl StringExpandPlaceholders
	adds r4, 0x4
	adds r0, r4, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0811421C: .4byte gStringVar1
_08114220: .4byte gStringVar2
_08114224: .4byte gStringVar4
_08114228: .4byte gUnknown_841AB8E
	thumb_func_end sub_81141E4

	thumb_func_start sub_811422C
sub_811422C: @ 811422C
	push {lr}
	adds r3, r0, 0
	adds r2, r1, 0
	movs r0, 0x7
	adds r1, r3, 0
	bl sub_811414C
	pop {r1}
	bx r1
	thumb_func_end sub_811422C

	thumb_func_start sub_8114240
sub_8114240: @ 8114240
	push {r4,r5,lr}
	adds r1, r0, 0
	movs r0, 0x7
	bl sub_8113E88
	adds r4, r0, 0
	ldrh r0, [r4, 0x2]
	ldr r1, _08114278 @ =gStringVar2
	movs r2, 0
	bl sub_8113EAC
	ldr r5, _0811427C @ =gStringVar1
	ldrh r0, [r4]
	bl ItemId_GetItem
	adds r1, r0, 0
	adds r0, r5, 0
	bl StringCopy
	ldr r0, _08114280 @ =gStringVar4
	ldr r1, _08114284 @ =gUnknown_841A6A5
	bl StringExpandPlaceholders
	adds r4, 0x4
	adds r0, r4, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08114278: .4byte gStringVar2
_0811427C: .4byte gStringVar1
_08114280: .4byte gStringVar4
_08114284: .4byte gUnknown_841A6A5
	thumb_func_end sub_8114240

	thumb_func_start sub_8114288
sub_8114288: @ 8114288
	push {lr}
	adds r3, r0, 0
	adds r2, r1, 0
	movs r0, 0x8
	adds r1, r3, 0
	bl sub_811414C
	pop {r1}
	bx r1
	thumb_func_end sub_8114288

	thumb_func_start sub_811429C
sub_811429C: @ 811429C
	push {r4,r5,lr}
	adds r1, r0, 0
	movs r0, 0x8
	bl sub_8113E88
	adds r4, r0, 0
	ldrh r0, [r4, 0x2]
	ldr r1, _081142D4 @ =gStringVar1
	movs r2, 0
	bl sub_8113EAC
	ldr r5, _081142D8 @ =gStringVar2
	ldrh r0, [r4]
	bl ItemId_GetItem
	adds r1, r0, 0
	adds r0, r5, 0
	bl StringCopy
	ldr r0, _081142DC @ =gStringVar4
	ldr r1, _081142E0 @ =gUnknown_841A1CD
	bl StringExpandPlaceholders
	adds r4, 0x4
	adds r0, r4, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_081142D4: .4byte gStringVar1
_081142D8: .4byte gStringVar2
_081142DC: .4byte gStringVar4
_081142E0: .4byte gUnknown_841A1CD
	thumb_func_end sub_811429C

	thumb_func_start sub_81142E4
sub_81142E4: @ 81142E4
	push {r4,lr}
	adds r4, r2, 0
	lsls r0, 16
	lsrs r0, 16
	bl sub_8113DE0
	adds r1, r0, 0
	cmp r1, 0
	beq _08114306
	ldrh r0, [r4]
	strh r0, [r1]
	ldrh r0, [r4, 0x2]
	strh r0, [r1, 0x2]
	ldrh r0, [r4, 0x4]
	strh r0, [r1, 0x4]
	adds r0, r1, 0x6
	b _08114308
_08114306:
	movs r0, 0
_08114308:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_81142E4

	thumb_func_start sub_8114310
sub_8114310: @ 8114310
	push {lr}
	adds r3, r0, 0
	adds r2, r1, 0
	movs r0, 0x9
	adds r1, r3, 0
	bl sub_81142E4
	pop {r1}
	bx r1
	thumb_func_end sub_8114310

	thumb_func_start sub_8114324
sub_8114324: @ 8114324
	push {r4,r5,lr}
	adds r1, r0, 0
	movs r0, 0x9
	bl sub_8113E88
	adds r4, r0, 0
	ldrh r0, [r4, 0x4]
	ldr r1, _0811436C @ =gStringVar1
	movs r2, 0
	bl sub_8113EAC
	ldr r5, _08114370 @ =gStringVar2
	ldrh r0, [r4]
	bl ItemId_GetItem
	adds r1, r0, 0
	adds r0, r5, 0
	bl StringCopy
	ldr r5, _08114374 @ =gStringVar3
	ldrh r0, [r4, 0x2]
	bl ItemId_GetItem
	adds r1, r0, 0
	adds r0, r5, 0
	bl StringCopy
	ldr r0, _08114378 @ =gStringVar4
	ldr r1, _0811437C @ =gUnknown_841A193
	bl StringExpandPlaceholders
	adds r4, 0x6
	adds r0, r4, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0811436C: .4byte gStringVar1
_08114370: .4byte gStringVar2
_08114374: .4byte gStringVar3
_08114378: .4byte gStringVar4
_0811437C: .4byte gUnknown_841A193
	thumb_func_end sub_8114324

	thumb_func_start sub_8114380
sub_8114380: @ 8114380
	push {lr}
	adds r3, r0, 0
	adds r2, r1, 0
	movs r0, 0xA
	adds r1, r3, 0
	bl sub_81142E4
	pop {r1}
	bx r1
	thumb_func_end sub_8114380

	thumb_func_start sub_8114394
sub_8114394: @ 8114394
	push {r4,r5,lr}
	adds r1, r0, 0
	movs r0, 0xA
	bl sub_8113E88
	adds r4, r0, 0
	ldrh r0, [r4, 0x4]
	ldr r1, _081143DC @ =gStringVar2
	movs r2, 0
	bl sub_8113EAC
	ldr r5, _081143E0 @ =gStringVar3
	ldrh r0, [r4]
	bl ItemId_GetItem
	adds r1, r0, 0
	adds r0, r5, 0
	bl StringCopy
	ldr r5, _081143E4 @ =gStringVar1
	ldrh r0, [r4, 0x2]
	bl ItemId_GetItem
	adds r1, r0, 0
	adds r0, r5, 0
	bl StringCopy
	ldr r0, _081143E8 @ =gStringVar4
	ldr r1, _081143EC @ =gUnknown_841A6E1
	bl StringExpandPlaceholders
	adds r4, 0x6
	adds r0, r4, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_081143DC: .4byte gStringVar2
_081143E0: .4byte gStringVar3
_081143E4: .4byte gStringVar1
_081143E8: .4byte gStringVar4
_081143EC: .4byte gUnknown_841A6E1
	thumb_func_end sub_8114394

	thumb_func_start sub_81143F0
sub_81143F0: @ 81143F0
	push {r4,lr}
	adds r4, r0, 0
	adds r2, r4, 0
	ldr r1, _08114408 @ =gUnknown_203B044
	ldrb r0, [r1]
	cmp r0, 0xB
	bne _0811440C
	ldrb r0, [r1, 0x1]
	cmp r0, 0
	beq _0811440C
	adds r0, r4, 0
	b _08114436
	.align 2, 0
_08114408: .4byte gUnknown_203B044
_0811440C:
	ldr r0, _0811442C @ =gUnknown_8456AA0
	ldrb r1, [r0, 0xB]
	adds r0, r2, 0
	bl sub_8110944
	lsls r0, 24
	cmp r0, 0
	beq _08114434
	movs r0, 0xB
	strh r0, [r4]
	ldr r0, _08114430 @ =gUnknown_203AF98
	ldrh r0, [r0]
	strh r0, [r4, 0x2]
	adds r0, r4, 0x4
	b _08114436
	.align 2, 0
_0811442C: .4byte gUnknown_8456AA0
_08114430: .4byte gUnknown_203AF98
_08114434:
	movs r0, 0
_08114436:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_81143F0

	thumb_func_start sub_811443C
sub_811443C: @ 811443C
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _08114454 @ =gStringVar4
	ldr r1, _08114458 @ =gUnknown_841A2B0
	bl StringExpandPlaceholders
	adds r4, 0x4
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08114454: .4byte gStringVar4
_08114458: .4byte gUnknown_841A2B0
	thumb_func_end sub_811443C

	thumb_func_start sub_811445C
sub_811445C: @ 811445C
	push {r4,lr}
	adds r4, r0, 0
	adds r4, 0x8
	movs r2, 0xC
	strh r2, [r0]
	ldr r2, _08114488 @ =gUnknown_203AF98
	ldrh r2, [r2]
	strh r2, [r0, 0x2]
	ldrh r2, [r1]
	strh r2, [r0, 0x4]
	ldrh r2, [r1, 0x2]
	strh r2, [r0, 0x6]
	adds r1, 0x4
	adds r0, r4, 0
	movs r2, 0x7
	bl memcpy
	adds r4, 0x8
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08114488: .4byte gUnknown_203AF98
	thumb_func_end sub_811445C

	thumb_func_start sub_811448C
sub_811448C: @ 811448C
	push {r4-r6,lr}
	adds r5, r0, 0
	adds r6, r5, 0
	adds r6, 0x8
	ldr r4, _081144D8 @ =gStringVar1
	adds r0, r4, 0
	movs r1, 0xFF
	movs r2, 0x8
	bl memset
	adds r0, r4, 0
	adds r1, r6, 0
	movs r2, 0x7
	bl memcpy
	adds r0, r4, 0
	bl sub_8115834
	ldrh r0, [r5, 0x6]
	ldr r1, _081144DC @ =gStringVar2
	movs r2, 0
	bl sub_8113EAC
	ldrh r0, [r5, 0x4]
	ldr r1, _081144E0 @ =gStringVar3
	movs r2, 0
	bl sub_8113EAC
	ldr r0, _081144E4 @ =gStringVar4
	ldr r1, _081144E8 @ =gUnknown_841A3FF
	bl StringExpandPlaceholders
	adds r6, 0x8
	adds r0, r6, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_081144D8: .4byte gStringVar1
_081144DC: .4byte gStringVar2
_081144E0: .4byte gStringVar3
_081144E4: .4byte gStringVar4
_081144E8: .4byte gUnknown_841A3FF
	thumb_func_end sub_811448C

	thumb_func_start sub_81144EC
sub_81144EC: @ 81144EC
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0xD
	strh r0, [r4]
	ldr r0, _08114514 @ =gUnknown_203AF98
	ldrh r0, [r0]
	strh r0, [r4, 0x2]
	ldrb r0, [r1]
	strb r0, [r4, 0x4]
	adds r0, r4, 0x5
	adds r1, 0x1
	movs r2, 0x7
	bl memcpy
	adds r4, 0xC
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08114514: .4byte gUnknown_203AF98
	thumb_func_end sub_81144EC

	thumb_func_start sub_8114518
sub_8114518: @ 8114518
	push {r4,r5,lr}
	adds r5, r0, 0
	bl UnkTextUtil_Reset
	ldr r4, _08114568 @ =gStringVar1
	adds r0, r4, 0
	movs r1, 0xFF
	movs r2, 0x8
	bl memset
	adds r1, r5, 0x5
	adds r0, r4, 0
	movs r2, 0x7
	bl memcpy
	adds r0, r4, 0
	bl sub_8115834
	movs r0, 0
	adds r1, r4, 0
	bl UnkTextUtil_SetPtrI
	ldr r1, _0811456C @ =gUnknown_8456AE4
	ldrb r0, [r5, 0x4]
	lsls r0, 2
	adds r0, r1
	ldr r1, [r0]
	movs r0, 0x1
	bl UnkTextUtil_SetPtrI
	ldr r0, _08114570 @ =gStringVar4
	ldr r1, _08114574 @ =gUnknown_841A422
	bl UnkTextUtil_StringExpandPlaceholders
	adds r5, 0xC
	adds r0, r5, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08114568: .4byte gStringVar1
_0811456C: .4byte gUnknown_8456AE4
_08114570: .4byte gStringVar4
_08114574: .4byte gUnknown_841A422
	thumb_func_end sub_8114518

	thumb_func_start sub_8114578
sub_8114578: @ 8114578
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0xE
	strh r0, [r4]
	ldr r0, _081145A0 @ =gUnknown_203AF98
	ldrh r0, [r0]
	strh r0, [r4, 0x2]
	ldrb r0, [r1]
	strb r0, [r4, 0x4]
	adds r0, r4, 0x5
	adds r1, 0x1
	movs r2, 0x7
	bl memcpy
	adds r4, 0xC
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_081145A0: .4byte gUnknown_203AF98
	thumb_func_end sub_8114578

	thumb_func_start sub_81145A4
sub_81145A4: @ 81145A4
	push {r4,r5,lr}
	adds r5, r0, 0
	bl UnkTextUtil_Reset
	ldr r4, _081145F4 @ =gStringVar1
	adds r0, r4, 0
	movs r1, 0xFF
	movs r2, 0x8
	bl memset
	adds r1, r5, 0x5
	adds r0, r4, 0
	movs r2, 0x7
	bl memcpy
	adds r0, r4, 0
	bl sub_8115834
	movs r0, 0
	adds r1, r4, 0
	bl UnkTextUtil_SetPtrI
	ldr r1, _081145F8 @ =gUnknown_8456AE4
	ldrb r0, [r5, 0x4]
	lsls r0, 2
	adds r0, r1
	ldr r1, [r0]
	movs r0, 0x1
	bl UnkTextUtil_SetPtrI
	ldr r0, _081145FC @ =gStringVar4
	ldr r1, _08114600 @ =gUnknown_841A477
	bl UnkTextUtil_StringExpandPlaceholders
	adds r5, 0xC
	adds r0, r5, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_081145F4: .4byte gStringVar1
_081145F8: .4byte gUnknown_8456AE4
_081145FC: .4byte gStringVar4
_08114600: .4byte gUnknown_841A477
	thumb_func_end sub_81145A4

	thumb_func_start sub_8114604
sub_8114604: @ 8114604
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0xF
	strh r0, [r4]
	ldr r0, _08114648 @ =gUnknown_203AF98
	ldrh r0, [r0]
	strh r0, [r4, 0x2]
	ldrb r0, [r5]
	strb r0, [r4, 0x4]
	adds r0, r4, 0x5
	adds r1, r5, 0x1
	movs r2, 0x7
	bl memcpy
	adds r0, r4, 0
	adds r0, 0xC
	adds r1, r5, 0
	adds r1, 0x8
	movs r2, 0x7
	bl memcpy
	adds r0, r4, 0
	adds r0, 0x13
	adds r5, 0xF
	adds r1, r5, 0
	movs r2, 0x7
	bl memcpy
	adds r4, 0x1A
	adds r0, r4, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08114648: .4byte gUnknown_203AF98
	thumb_func_end sub_8114604

	thumb_func_start sub_811464C
sub_811464C: @ 811464C
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	adds r4, r0, 0
	bl UnkTextUtil_Reset
	ldr r0, _081146F4 @ =gStringVar1
	mov r8, r0
	movs r1, 0xFF
	movs r2, 0x8
	bl memset
	ldr r6, _081146F8 @ =gStringVar2
	adds r0, r6, 0
	movs r1, 0xFF
	movs r2, 0x8
	bl memset
	ldr r5, _081146FC @ =gStringVar3
	adds r0, r5, 0
	movs r1, 0xFF
	movs r2, 0x8
	bl memset
	adds r1, r4, 0x5
	mov r0, r8
	bl StringCopy7
	adds r1, r4, 0
	adds r1, 0xC
	adds r0, r6, 0
	bl StringCopy7
	adds r1, r4, 0
	adds r1, 0x13
	adds r0, r5, 0
	bl StringCopy7
	mov r0, r8
	bl sub_8115834
	adds r0, r6, 0
	bl sub_8115834
	adds r0, r5, 0
	bl sub_8115834
	ldr r0, _08114700 @ =gSaveBlock2Ptr
	ldr r1, [r0]
	movs r0, 0
	bl UnkTextUtil_SetPtrI
	movs r0, 0x1
	mov r1, r8
	bl UnkTextUtil_SetPtrI
	movs r0, 0x2
	adds r1, r6, 0
	bl UnkTextUtil_SetPtrI
	movs r0, 0x3
	adds r1, r5, 0
	bl UnkTextUtil_SetPtrI
	ldr r1, _08114704 @ =gUnknown_8456AE4
	ldrb r0, [r4, 0x4]
	lsls r0, 2
	adds r0, r1
	ldr r1, [r0]
	movs r0, 0x4
	bl UnkTextUtil_SetPtrI
	ldr r0, _08114708 @ =gStringVar4
	ldr r1, _0811470C @ =gUnknown_841A4C6
	bl UnkTextUtil_StringExpandPlaceholders
	adds r4, 0x1A
	adds r0, r4, 0
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_081146F4: .4byte gStringVar1
_081146F8: .4byte gStringVar2
_081146FC: .4byte gStringVar3
_08114700: .4byte gSaveBlock2Ptr
_08114704: .4byte gUnknown_8456AE4
_08114708: .4byte gStringVar4
_0811470C: .4byte gUnknown_841A4C6
	thumb_func_end sub_811464C

	thumb_func_start sub_8114710
sub_8114710: @ 8114710
	movs r1, 0x10
	strh r1, [r0]
	ldr r1, _08114720 @ =gUnknown_203AF98
	ldrh r1, [r1]
	strh r1, [r0, 0x2]
	adds r0, 0x4
	bx lr
	.align 2, 0
_08114720: .4byte gUnknown_203AF98
	thumb_func_end sub_8114710

	thumb_func_start sub_8114724
sub_8114724: @ 8114724
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _0811473C @ =gStringVar4
	ldr r1, _08114740 @ =gUnknown_841A50B
	bl StringExpandPlaceholders
	adds r4, 0x4
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0811473C: .4byte gStringVar4
_08114740: .4byte gUnknown_841A50B
	thumb_func_end sub_8114724

	thumb_func_start sub_8114744
sub_8114744: @ 8114744
	movs r1, 0x11
	strh r1, [r0]
	ldr r1, _08114754 @ =gUnknown_203AF98
	ldrh r1, [r1]
	strh r1, [r0, 0x2]
	adds r0, 0x4
	bx lr
	.align 2, 0
_08114754: .4byte gUnknown_203AF98
	thumb_func_end sub_8114744

	thumb_func_start sub_8114758
sub_8114758: @ 8114758
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _08114770 @ =gStringVar4
	ldr r1, _08114774 @ =gUnknown_841A732
	bl StringExpandPlaceholders
	adds r4, 0x4
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08114770: .4byte gStringVar4
_08114774: .4byte gUnknown_841A732
	thumb_func_end sub_8114758

	thumb_func_start sub_8114778
sub_8114778: @ 8114778
	push {r4,lr}
	adds r4, r0, 0
	adds r4, 0x8
	movs r2, 0x12
	strh r2, [r0]
	ldr r2, _081147A4 @ =gUnknown_203AF98
	ldrh r2, [r2]
	strh r2, [r0, 0x2]
	ldrh r2, [r1]
	strh r2, [r0, 0x4]
	ldrh r2, [r1, 0x2]
	strh r2, [r0, 0x6]
	adds r1, 0x4
	adds r0, r4, 0
	movs r2, 0x7
	bl memcpy
	adds r4, 0x8
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_081147A4: .4byte gUnknown_203AF98
	thumb_func_end sub_8114778

	thumb_func_start sub_81147A8
sub_81147A8: @ 81147A8
	push {r4-r6,lr}
	adds r5, r0, 0
	adds r6, r5, 0
	adds r6, 0x8
	ldr r4, _081147F4 @ =gStringVar1
	adds r0, r4, 0
	movs r1, 0xFF
	movs r2, 0x8
	bl memset
	adds r0, r4, 0
	adds r1, r6, 0
	movs r2, 0x7
	bl memcpy
	adds r0, r4, 0
	bl sub_8115834
	ldrh r0, [r5, 0x6]
	ldr r1, _081147F8 @ =gStringVar2
	movs r2, 0
	bl sub_8113EAC
	ldrh r0, [r5, 0x4]
	ldr r1, _081147FC @ =gStringVar3
	movs r2, 0
	bl sub_8113EAC
	ldr r0, _08114800 @ =gStringVar4
	ldr r1, _08114804 @ =gUnknown_841A76A
	bl StringExpandPlaceholders
	adds r6, 0x8
	adds r0, r6, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_081147F4: .4byte gStringVar1
_081147F8: .4byte gStringVar2
_081147FC: .4byte gStringVar3
_08114800: .4byte gStringVar4
_08114804: .4byte gUnknown_841A76A
	thumb_func_end sub_81147A8

	thumb_func_start sub_8114808
sub_8114808: @ 8114808
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0x13
	strh r0, [r4]
	ldr r0, _08114830 @ =gUnknown_203AF98
	ldrh r0, [r0]
	strh r0, [r4, 0x2]
	ldrb r0, [r1]
	strb r0, [r4, 0x4]
	adds r0, r4, 0x5
	adds r1, 0x1
	movs r2, 0x7
	bl memcpy
	adds r4, 0xC
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08114830: .4byte gUnknown_203AF98
	thumb_func_end sub_8114808

	thumb_func_start sub_8114834
sub_8114834: @ 8114834
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r4, _08114878 @ =gStringVar1
	adds r0, r4, 0
	movs r1, 0xFF
	movs r2, 0x8
	bl memset
	adds r1, r5, 0x5
	adds r0, r4, 0
	movs r2, 0x7
	bl memcpy
	adds r0, r4, 0
	bl sub_8115834
	ldr r0, _0811487C @ =gStringVar2
	ldr r2, _08114880 @ =gUnknown_8456AE4
	ldrb r1, [r5, 0x4]
	lsls r1, 2
	adds r1, r2
	ldr r1, [r1]
	bl StringCopy
	ldr r0, _08114884 @ =gStringVar4
	ldr r1, _08114888 @ =gUnknown_841A7B0
	bl StringExpandPlaceholders
	adds r5, 0xC
	adds r0, r5, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08114878: .4byte gStringVar1
_0811487C: .4byte gStringVar2
_08114880: .4byte gUnknown_8456AE4
_08114884: .4byte gStringVar4
_08114888: .4byte gUnknown_841A7B0
	thumb_func_end sub_8114834

	thumb_func_start sub_811488C
sub_811488C: @ 811488C
	push {r4,lr}
	adds r2, r0, 0
	adds r4, r1, 0
	movs r0, 0x14
	adds r1, r2, 0
	bl sub_8113DE0
	adds r2, r0, 0
	cmp r2, 0
	beq _081148B4
	ldrh r0, [r4]
	strh r0, [r2]
	ldrh r0, [r4, 0x2]
	strh r0, [r2, 0x2]
	ldrb r0, [r4, 0x4]
	strb r0, [r2, 0x4]
	ldrb r0, [r4, 0x5]
	strb r0, [r2, 0x5]
	adds r0, r2, 0x6
	b _081148B6
_081148B4:
	movs r0, 0
_081148B6:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_811488C

	thumb_func_start sub_81148BC
sub_81148BC: @ 81148BC
	push {r4,r5,lr}
	adds r1, r0, 0
	movs r0, 0x14
	bl sub_8113E88
	adds r4, r0, 0
	adds r5, r4, 0x4
	bl UnkTextUtil_Reset
	ldrb r0, [r4, 0x4]
	bl GetBoxNamePtr
	adds r1, r0, 0
	movs r0, 0
	bl UnkTextUtil_SetPtrI
	ldrh r0, [r4]
	movs r1, 0
	movs r2, 0x1
	bl sub_8113EAC
	ldrb r0, [r5, 0x1]
	bl GetBoxNamePtr
	adds r1, r0, 0
	movs r0, 0x2
	bl UnkTextUtil_SetPtrI
	ldrh r0, [r4, 0x2]
	movs r1, 0
	movs r2, 0x3
	bl sub_8113EAC
	ldr r0, _08114910 @ =gStringVar4
	ldr r1, _08114914 @ =gUnknown_841A566
	bl UnkTextUtil_StringExpandPlaceholders
	adds r4, 0x6
	adds r0, r4, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08114910: .4byte gStringVar4
_08114914: .4byte gUnknown_841A566
	thumb_func_end sub_81148BC

	thumb_func_start sub_8114918
sub_8114918: @ 8114918
	push {r4,lr}
	adds r2, r0, 0
	adds r4, r1, 0
	movs r0, 0x15
	adds r1, r2, 0
	bl sub_8113DE0
	adds r2, r0, 0
	cmp r2, 0
	beq _0811493C
	ldrh r0, [r4]
	strh r0, [r2]
	ldrh r0, [r4, 0x2]
	strh r0, [r2, 0x2]
	ldrb r0, [r4, 0x4]
	strb r0, [r2, 0x4]
	adds r0, r2, 0x6
	b _0811493E
_0811493C:
	movs r0, 0
_0811493E:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8114918

	thumb_func_start sub_8114944
sub_8114944: @ 8114944
	push {r4,lr}
	adds r1, r0, 0
	movs r0, 0x15
	bl sub_8113E88
	adds r4, r0, 0
	bl UnkTextUtil_Reset
	ldrb r0, [r4, 0x4]
	bl GetBoxNamePtr
	adds r1, r0, 0
	movs r0, 0
	bl UnkTextUtil_SetPtrI
	ldrh r0, [r4]
	movs r1, 0
	movs r2, 0x1
	bl sub_8113EAC
	ldrh r0, [r4, 0x2]
	movs r1, 0
	movs r2, 0x2
	bl sub_8113EAC
	ldr r0, _08114988 @ =gStringVar4
	ldr r1, _0811498C @ =gUnknown_841A5D9
	bl UnkTextUtil_StringExpandPlaceholders
	adds r4, 0x6
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08114988: .4byte gStringVar4
_0811498C: .4byte gUnknown_841A5D9
	thumb_func_end sub_8114944

	thumb_func_start sub_8114990
sub_8114990: @ 8114990
	push {r4,lr}
	adds r2, r0, 0
	adds r4, r1, 0
	movs r0, 0x16
	adds r1, r2, 0
	bl sub_8113DE0
	adds r2, r0, 0
	cmp r2, 0
	bne _081149A8
	movs r0, 0
	b _081149CA
_081149A8:
	adds r1, r2, 0x4
	ldrb r0, [r4, 0x4]
	cmp r0, 0xE
	bne _081149BC
	ldrh r0, [r4, 0x2]
	strh r0, [r2]
	ldrh r0, [r4]
	strh r0, [r2, 0x2]
	ldrb r0, [r4, 0x5]
	b _081149C6
_081149BC:
	ldrh r0, [r4]
	strh r0, [r2]
	ldrh r0, [r4, 0x2]
	strh r0, [r2, 0x2]
	ldrb r0, [r4, 0x4]
_081149C6:
	strb r0, [r2, 0x4]
	adds r0, r1, 0x2
_081149CA:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8114990

	thumb_func_start sub_81149D0
sub_81149D0: @ 81149D0
	push {r4,lr}
	adds r1, r0, 0
	movs r0, 0x16
	bl sub_8113E88
	adds r4, r0, 0
	bl UnkTextUtil_Reset
	ldrb r0, [r4, 0x4]
	bl GetBoxNamePtr
	adds r1, r0, 0
	movs r0, 0
	bl UnkTextUtil_SetPtrI
	ldrh r0, [r4]
	movs r1, 0
	movs r2, 0x1
	bl sub_8113EAC
	ldrh r0, [r4, 0x2]
	movs r1, 0
	movs r2, 0x2
	bl sub_8113EAC
	ldr r0, _08114A14 @ =gStringVar4
	ldr r1, _08114A18 @ =gUnknown_841A60A
	bl UnkTextUtil_StringExpandPlaceholders
	adds r4, 0x6
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08114A14: .4byte gStringVar4
_08114A18: .4byte gUnknown_841A60A
	thumb_func_end sub_81149D0

	thumb_func_start sub_8114A1C
sub_8114A1C: @ 8114A1C
	push {r4,lr}
	adds r2, r0, 0
	adds r4, r1, 0
	movs r0, 0x17
	adds r1, r2, 0
	bl sub_8113DE0
	adds r2, r0, 0
	cmp r2, 0
	beq _08114A42
	ldrh r0, [r4]
	strh r0, [r2]
	adds r0, r2, 0x2
	ldrb r1, [r4, 0x4]
	strb r1, [r2, 0x2]
	ldrb r1, [r4, 0x5]
	strb r1, [r0, 0x1]
	adds r0, 0x2
	b _08114A44
_08114A42:
	movs r0, 0
_08114A44:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8114A1C

	thumb_func_start sub_8114A4C
sub_8114A4C: @ 8114A4C
	push {r4,r5,lr}
	adds r1, r0, 0
	movs r0, 0x17
	bl sub_8113E88
	adds r4, r0, 0
	adds r5, r4, 0x2
	bl UnkTextUtil_Reset
	ldrb r0, [r4, 0x2]
	bl GetBoxNamePtr
	adds r1, r0, 0
	movs r0, 0
	bl UnkTextUtil_SetPtrI
	ldrh r0, [r4]
	movs r1, 0
	movs r2, 0x1
	bl sub_8113EAC
	ldrb r0, [r5, 0x1]
	bl GetBoxNamePtr
	adds r1, r0, 0
	movs r0, 0x2
	bl UnkTextUtil_SetPtrI
	ldr r0, _08114A98 @ =gStringVar4
	ldr r1, _08114A9C @ =gUnknown_841A59C
	bl UnkTextUtil_StringExpandPlaceholders
	adds r5, 0x2
	adds r0, r5, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08114A98: .4byte gStringVar4
_08114A9C: .4byte gUnknown_841A59C
	thumb_func_end sub_8114A4C

	thumb_func_start sub_8114AA0
sub_8114AA0: @ 8114AA0
	push {r4,lr}
	adds r2, r0, 0
	adds r4, r1, 0
	movs r0, 0x18
	adds r1, r2, 0
	bl sub_8113DE0
	adds r2, r0, 0
	cmp r2, 0
	beq _08114AC0
	ldrh r0, [r4]
	strh r0, [r2]
	ldrb r0, [r4, 0x4]
	strb r0, [r2, 0x2]
	adds r0, r2, 0x4
	b _08114AC2
_08114AC0:
	movs r0, 0
_08114AC2:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8114AA0

	thumb_func_start sub_8114AC8
sub_8114AC8: @ 8114AC8
	push {r4,r5,lr}
	adds r1, r0, 0
	movs r0, 0x18
	bl sub_8113E88
	adds r4, r0, 0
	adds r5, r4, 0x2
	bl UnkTextUtil_Reset
	ldrb r0, [r4, 0x2]
	bl GetBoxNamePtr
	adds r1, r0, 0
	movs r0, 0
	bl UnkTextUtil_SetPtrI
	ldrh r0, [r4]
	movs r1, 0
	movs r2, 0x1
	bl sub_8113EAC
	ldr r0, _08114B04 @ =gStringVar4
	ldr r1, _08114B08 @ =gUnknown_841A5FA
	bl UnkTextUtil_StringExpandPlaceholders
	adds r5, 0x2
	adds r0, r5, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08114B04: .4byte gStringVar4
_08114B08: .4byte gUnknown_841A5FA
	thumb_func_end sub_8114AC8

	thumb_func_start sub_8114B0C
sub_8114B0C: @ 8114B0C
	push {r4,lr}
	adds r2, r0, 0
	adds r4, r1, 0
	movs r0, 0x19
	adds r1, r2, 0
	bl sub_8113DE0
	adds r2, r0, 0
	cmp r2, 0
	beq _08114B2C
	ldrh r0, [r4]
	strh r0, [r2]
	ldrb r0, [r4, 0x4]
	strb r0, [r2, 0x2]
	adds r0, r2, 0x4
	b _08114B2E
_08114B2C:
	movs r0, 0
_08114B2E:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8114B0C

	thumb_func_start sub_8114B34
sub_8114B34: @ 8114B34
	push {r4,r5,lr}
	adds r1, r0, 0
	movs r0, 0x19
	bl sub_8113E88
	adds r4, r0, 0
	adds r5, r4, 0x2
	bl UnkTextUtil_Reset
	ldrb r0, [r4, 0x2]
	bl GetBoxNamePtr
	adds r1, r0, 0
	movs r0, 0
	bl UnkTextUtil_SetPtrI
	ldrh r0, [r4]
	movs r1, 0
	movs r2, 0x1
	bl sub_8113EAC
	ldr r0, _08114B70 @ =gStringVar4
	ldr r1, _08114B74 @ =gUnknown_841A632
	bl UnkTextUtil_StringExpandPlaceholders
	adds r5, 0x2
	adds r0, r5, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08114B70: .4byte gStringVar4
_08114B74: .4byte gUnknown_841A632
	thumb_func_end sub_8114B34

	thumb_func_start sub_8114B78
sub_8114B78: @ 8114B78
	push {r4,lr}
	adds r2, r0, 0
	adds r4, r1, 0
	movs r0, 0x1A
	adds r1, r2, 0
	bl sub_8113DE0
	adds r2, r0, 0
	cmp r2, 0
	beq _08114B98
	ldrh r0, [r4]
	strh r0, [r2]
	ldrb r0, [r4, 0x4]
	strb r0, [r2, 0x2]
	adds r0, r2, 0x4
	b _08114B9A
_08114B98:
	movs r0, 0
_08114B9A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8114B78

	thumb_func_start sub_8114BA0
sub_8114BA0: @ 8114BA0
	push {r4,r5,lr}
	adds r1, r0, 0
	movs r0, 0x1A
	bl sub_8113E88
	adds r4, r0, 0
	adds r5, r4, 0x2
	bl UnkTextUtil_Reset
	ldrh r0, [r4]
	movs r1, 0
	movs r2, 0
	bl sub_8113EAC
	ldrb r0, [r4, 0x2]
	bl GetBoxNamePtr
	adds r1, r0, 0
	movs r0, 0x1
	bl UnkTextUtil_SetPtrI
	ldr r0, _08114BDC @ =gStringVar4
	ldr r1, _08114BE0 @ =gUnknown_841A64F
	bl UnkTextUtil_StringExpandPlaceholders
	adds r5, 0x2
	adds r0, r5, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08114BDC: .4byte gStringVar4
_08114BE0: .4byte gUnknown_841A64F
	thumb_func_end sub_8114BA0

	thumb_func_start sub_8114BE4
sub_8114BE4: @ 8114BE4
	push {r4,lr}
	adds r2, r0, 0
	adds r4, r1, 0
	movs r0, 0x1B
	adds r1, r2, 0
	bl sub_8113DE0
	adds r2, r0, 0
	cmp r2, 0
	beq _08114C04
	ldrb r0, [r4, 0x4]
	strb r0, [r2]
	ldrb r0, [r4, 0x5]
	strb r0, [r2, 0x1]
	adds r0, r2, 0x2
	b _08114C06
_08114C04:
	movs r0, 0
_08114C06:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8114BE4

	thumb_func_start sub_8114C0C
sub_8114C0C: @ 8114C0C
	push {r4,lr}
	adds r1, r0, 0
	movs r0, 0x1B
	bl sub_8113E88
	adds r4, r0, 0
	bl UnkTextUtil_Reset
	ldrb r0, [r4]
	bl GetBoxNamePtr
	adds r1, r0, 0
	movs r0, 0
	bl UnkTextUtil_SetPtrI
	ldrb r0, [r4]
	ldrb r1, [r4, 0x1]
	cmp r0, r1
	bne _08114C40
	ldr r1, _08114C3C @ =gUnknown_841A694
	movs r0, 0x1
	bl UnkTextUtil_SetPtrI
	b _08114C4E
	.align 2, 0
_08114C3C: .4byte gUnknown_841A694
_08114C40:
	ldrb r0, [r4, 0x1]
	bl GetBoxNamePtr
	adds r1, r0, 0
	movs r0, 0x1
	bl UnkTextUtil_SetPtrI
_08114C4E:
	ldr r0, _08114C60 @ =gStringVar4
	ldr r1, _08114C64 @ =gUnknown_841A66E
	bl UnkTextUtil_StringExpandPlaceholders
	adds r0, r4, 0x2
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08114C60: .4byte gStringVar4
_08114C64: .4byte gUnknown_841A66E
	thumb_func_end sub_8114C0C

	thumb_func_start sub_8114C68
sub_8114C68: @ 8114C68
	push {r4,lr}
	adds r2, r0, 0
	adds r4, r1, 0
	movs r0, 0x1C
	adds r1, r2, 0
	bl sub_8113DE0
	adds r2, r0, 0
	cmp r2, 0
	beq _08114C84
	ldrh r0, [r4]
	strh r0, [r2]
	adds r0, r2, 0x2
	b _08114C86
_08114C84:
	movs r0, 0
_08114C86:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8114C68

	thumb_func_start sub_8114C8C
sub_8114C8C: @ 8114C8C
	push {r4,lr}
	adds r1, r0, 0
	movs r0, 0x1C
	bl sub_8113E88
	adds r4, r0, 0
	ldrh r0, [r4]
	ldr r1, _08114CB4 @ =gStringVar1
	bl sub_8099E90
	ldr r0, _08114CB8 @ =gStringVar4
	ldr r1, _08114CBC @ =gUnknown_841A391
	bl StringExpandPlaceholders
	adds r4, 0x2
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08114CB4: .4byte gStringVar1
_08114CB8: .4byte gStringVar4
_08114CBC: .4byte gUnknown_841A391
	thumb_func_end sub_8114C8C

	thumb_func_start sub_8114CC0
sub_8114CC0: @ 8114CC0
	push {r4,lr}
	adds r2, r0, 0
	adds r4, r1, 0
	movs r0, 0x1D
	adds r1, r2, 0
	bl sub_8113DE0
	adds r2, r0, 0
	cmp r2, 0
	beq _08114CDC
	ldrh r0, [r4]
	strh r0, [r2]
	adds r0, r2, 0x2
	b _08114CDE
_08114CDC:
	movs r0, 0
_08114CDE:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8114CC0

	thumb_func_start sub_8114CE4
sub_8114CE4: @ 8114CE4
	push {r4,lr}
	adds r1, r0, 0
	movs r0, 0x1D
	bl sub_8113E88
	adds r4, r0, 0
	ldrh r0, [r4]
	ldr r1, _08114D0C @ =gStringVar1
	bl sub_8099E90
	ldr r0, _08114D10 @ =gStringVar4
	ldr r1, _08114D14 @ =gUnknown_841A3DA
	bl StringExpandPlaceholders
	adds r4, 0x2
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08114D0C: .4byte gStringVar1
_08114D10: .4byte gStringVar4
_08114D14: .4byte gUnknown_841A3DA
	thumb_func_end sub_8114CE4

	thumb_func_start sub_8114D18
sub_8114D18: @ 8114D18
	push {r4,lr}
	adds r4, r2, 0
	lsls r0, 16
	lsrs r0, 16
	bl sub_8113DE0
	adds r1, r0, 0
	cmp r1, 0
	beq _08114D44
	ldrh r0, [r4, 0x2]
	strh r0, [r1]
	ldrh r0, [r4, 0x4]
	strh r0, [r1, 0x2]
	ldrh r0, [r4]
	strh r0, [r1, 0x4]
	ldrb r0, [r4, 0x7]
	strb r0, [r1, 0x6]
	ldrb r0, [r4, 0x6]
	strb r0, [r1, 0x7]
	adds r0, r1, 0
	adds r0, 0x8
	b _08114D46
_08114D44:
	movs r0, 0
_08114D46:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8114D18

	thumb_func_start sub_8114D4C
sub_8114D4C: @ 8114D4C
	push {lr}
	adds r3, r0, 0
	adds r2, r1, 0
	ldr r1, _08114D64 @ =gUnknown_203B048
	movs r0, 0x1
	strb r0, [r1]
	movs r0, 0x1E
	adds r1, r3, 0
	bl sub_8114D18
	pop {r1}
	bx r1
	.align 2, 0
_08114D64: .4byte gUnknown_203B048
	thumb_func_end sub_8114D4C

	thumb_func_start sub_8114D68
sub_8114D68: @ 8114D68
	push {r4-r6,lr}
	adds r1, r0, 0
	movs r0, 0x1E
	bl sub_8113E88
	adds r4, r0, 0
	adds r6, r4, 0x6
	bl UnkTextUtil_Reset
	ldr r5, _08114DD4 @ =gStringVar1
	ldrb r1, [r4, 0x6]
	adds r0, r5, 0
	bl sub_80C4DF8
	movs r0, 0
	adds r1, r5, 0
	bl UnkTextUtil_SetPtrI
	ldrh r0, [r4, 0x4]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _08114DD8 @ =gTrainers+0x4
	adds r1, r0
	movs r0, 0x1
	bl UnkTextUtil_SetPtrI
	ldrh r0, [r4]
	movs r1, 0
	movs r2, 0x2
	bl sub_8113EAC
	ldrh r0, [r4, 0x2]
	movs r1, 0
	movs r2, 0x3
	bl sub_8113EAC
	ldr r1, _08114DDC @ =gUnknown_8456ACC
	ldrb r0, [r6, 0x1]
	lsls r0, 2
	adds r0, r1
	ldr r1, [r0]
	movs r0, 0x4
	bl UnkTextUtil_SetPtrI
	ldr r0, _08114DE0 @ =gStringVar4
	ldr r1, _08114DE4 @ =gUnknown_841AF0C
	bl UnkTextUtil_StringExpandPlaceholders
	adds r4, 0x8
	adds r0, r4, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08114DD4: .4byte gStringVar1
_08114DD8: .4byte gTrainers+0x4
_08114DDC: .4byte gUnknown_8456ACC
_08114DE0: .4byte gStringVar4
_08114DE4: .4byte gUnknown_841AF0C
	thumb_func_end sub_8114D68

	thumb_func_start sub_8114DE8
sub_8114DE8: @ 8114DE8
	push {r4-r6,lr}
	adds r6, r1, 0
	adds r4, r0, 0
	adds r5, r4, 0
	adds r5, 0x8
	ldr r0, _08114E08 @ =gUnknown_8456AA0
	ldrb r1, [r0, 0x1F]
	adds r0, r4, 0
	bl sub_8110944
	lsls r0, 24
	cmp r0, 0
	bne _08114E0C
	movs r0, 0
	b _08114E5E
	.align 2, 0
_08114E08: .4byte gUnknown_8456AA0
_08114E0C:
	ldrb r0, [r4, 0x8]
	cmp r0, 0
	bne _08114E22
	ldrb r0, [r5, 0x1]
	cmp r0, 0
	bne _08114E22
	movs r0, 0x1F
	strh r0, [r4]
	ldr r0, _08114E64 @ =gUnknown_203AF98
	ldrh r0, [r0]
	strh r0, [r4, 0x2]
_08114E22:
	ldrh r0, [r6]
	adds r2, r0, 0
	cmp r2, 0
	beq _08114E2C
	strh r0, [r4, 0x4]
_08114E2C:
	ldrh r0, [r6, 0x2]
	adds r1, r0, 0
	cmp r1, 0
	beq _08114E36
	strh r1, [r4, 0x6]
_08114E36:
	cmp r2, 0
	beq _08114E46
	ldrb r2, [r5]
	adds r0, r2, 0
	cmp r0, 0xFF
	beq _08114E46
	adds r0, r2, 0x1
	strb r0, [r5]
_08114E46:
	lsls r0, r1, 16
	cmp r0, 0
	beq _08114E58
	ldrb r1, [r5, 0x1]
	adds r0, r1, 0
	cmp r0, 0xFF
	beq _08114E58
	adds r0, r1, 0x1
	strb r0, [r5, 0x1]
_08114E58:
	ldrb r0, [r6, 0x4]
	strb r0, [r5, 0x2]
	adds r0, r5, 0x4
_08114E5E:
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08114E64: .4byte gUnknown_203AF98
	thumb_func_end sub_8114DE8

	thumb_func_start sub_8114E68
sub_8114E68: @ 8114E68
	push {r4-r6,lr}
	adds r5, r0, 0
	ldr r0, _08114E80 @ =gUnknown_8456AA0
	ldrb r1, [r0, 0x1F]
	adds r0, r5, 0
	bl sub_8110944
	lsls r0, 24
	cmp r0, 0
	bne _08114E84
	movs r0, 0
	b _08114FAE
	.align 2, 0
_08114E80: .4byte gUnknown_8456AA0
_08114E84:
	adds r6, r5, 0
	adds r6, 0x8
	bl UnkTextUtil_Reset
	ldr r4, _08114F00 @ =gStringVar1
	ldrb r1, [r6, 0x2]
	adds r0, r4, 0
	bl sub_80C4DF8
	movs r0, 0
	adds r1, r4, 0
	bl UnkTextUtil_SetPtrI
	ldrh r0, [r5, 0x4]
	movs r1, 0
	movs r2, 0x1
	bl sub_8113EAC
	ldr r4, _08114F04 @ =gStringVar2
	ldrb r1, [r5, 0x8]
	adds r0, r4, 0
	movs r2, 0
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	movs r0, 0x2
	adds r1, r4, 0
	bl UnkTextUtil_SetPtrI
	ldrh r0, [r5, 0x6]
	movs r1, 0
	movs r2, 0x3
	bl sub_8113EAC
	ldr r4, _08114F08 @ =gStringVar3
	ldrb r1, [r6, 0x1]
	adds r0, r4, 0
	movs r2, 0
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	movs r0, 0x4
	adds r1, r4, 0
	bl UnkTextUtil_SetPtrI
	ldr r0, _08114F0C @ =gSaveBlock2Ptr
	ldr r1, [r0]
	movs r0, 0x5
	bl UnkTextUtil_SetPtrI
	ldrb r0, [r5, 0x8]
	cmp r0, 0
	bne _08114F2C
	ldrb r0, [r6, 0x1]
	cmp r0, 0x1
	bne _08114F18
	ldr r0, _08114F10 @ =gStringVar4
	ldr r1, _08114F14 @ =gUnknown_841AA01
	bl UnkTextUtil_StringExpandPlaceholders
	b _08114FAC
	.align 2, 0
_08114F00: .4byte gStringVar1
_08114F04: .4byte gStringVar2
_08114F08: .4byte gStringVar3
_08114F0C: .4byte gSaveBlock2Ptr
_08114F10: .4byte gStringVar4
_08114F14: .4byte gUnknown_841AA01
_08114F18:
	ldr r0, _08114F24 @ =gStringVar4
	ldr r1, _08114F28 @ =gUnknown_841AA2B
	bl UnkTextUtil_StringExpandPlaceholders
	b _08114FAC
	.align 2, 0
_08114F24: .4byte gStringVar4
_08114F28: .4byte gUnknown_841AA2B
_08114F2C:
	ldrb r1, [r6, 0x1]
	cmp r1, 0
	bne _08114F5C
	cmp r0, 0x1
	bne _08114F48
	ldr r0, _08114F40 @ =gStringVar4
	ldr r1, _08114F44 @ =gUnknown_841A9A9
	bl UnkTextUtil_StringExpandPlaceholders
	b _08114FAC
	.align 2, 0
_08114F40: .4byte gStringVar4
_08114F44: .4byte gUnknown_841A9A9
_08114F48:
	ldr r0, _08114F54 @ =gStringVar4
	ldr r1, _08114F58 @ =gUnknown_841A9D4
	bl UnkTextUtil_StringExpandPlaceholders
	b _08114FAC
	.align 2, 0
_08114F54: .4byte gStringVar4
_08114F58: .4byte gUnknown_841A9D4
_08114F5C:
	cmp r0, 0x1
	bne _08114F8C
	cmp r1, 0x1
	bne _08114F78
	ldr r0, _08114F70 @ =gStringVar4
	ldr r1, _08114F74 @ =gUnknown_841AA76
	bl UnkTextUtil_StringExpandPlaceholders
	b _08114FAC
	.align 2, 0
_08114F70: .4byte gStringVar4
_08114F74: .4byte gUnknown_841AA76
_08114F78:
	ldr r0, _08114F84 @ =gStringVar4
	ldr r1, _08114F88 @ =gUnknown_841AAAA
	bl UnkTextUtil_StringExpandPlaceholders
	b _08114FAC
	.align 2, 0
_08114F84: .4byte gStringVar4
_08114F88: .4byte gUnknown_841AAAA
_08114F8C:
	cmp r1, 0x1
	bne _08114FA4
	ldr r0, _08114F9C @ =gStringVar4
	ldr r1, _08114FA0 @ =gUnknown_841AAEC
	bl UnkTextUtil_StringExpandPlaceholders
	b _08114FAC
	.align 2, 0
_08114F9C: .4byte gStringVar4
_08114FA0: .4byte gUnknown_841AAEC
_08114FA4:
	ldr r0, _08114FB4 @ =gStringVar4
	ldr r1, _08114FB8 @ =gUnknown_841AB29
	bl UnkTextUtil_StringExpandPlaceholders
_08114FAC:
	adds r0, r6, 0x4
_08114FAE:
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08114FB4: .4byte gStringVar4
_08114FB8: .4byte gUnknown_841AB29
	thumb_func_end sub_8114E68

	thumb_func_start sub_8114FBC
sub_8114FBC: @ 8114FBC
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	adds r1, r0, 0
	cmp r0, 0x96
	beq _08114FE6
	cmp r0, 0x96
	bgt _08114FD6
	cmp r0, 0x92
	bgt _08114FEA
	cmp r0, 0x8F
	blt _08114FEA
	b _08114FE6
_08114FD6:
	cmp r1, 0xF9
	blt _08114FEA
	cmp r1, 0xFA
	ble _08114FE6
	movs r0, 0xCD
	lsls r0, 1
	cmp r1, r0
	bne _08114FEA
_08114FE6:
	movs r0, 0x1
	b _08114FEC
_08114FEA:
	movs r0, 0
_08114FEC:
	pop {r1}
	bx r1
	thumb_func_end sub_8114FBC

	thumb_func_start sub_8114FF0
sub_8114FF0: @ 8114FF0
	push {lr}
	adds r3, r0, 0
	adds r2, r1, 0
	ldr r1, _08115008 @ =gUnknown_203B048
	movs r0, 0x1
	strb r0, [r1]
	movs r0, 0x20
	adds r1, r3, 0
	bl sub_8114D18
	pop {r1}
	bx r1
	.align 2, 0
_08115008: .4byte gUnknown_203B048
	thumb_func_end sub_8114FF0

	thumb_func_start sub_811500C
sub_811500C: @ 811500C
	push {r4,r5,lr}
	adds r1, r0, 0
	movs r0, 0x20
	bl sub_8113E88
	adds r4, r0, 0
	adds r5, r4, 0x6
	bl UnkTextUtil_Reset
	ldrh r0, [r4, 0x4]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _08115068 @ =gTrainers+0x4
	adds r1, r0
	movs r0, 0
	bl UnkTextUtil_SetPtrI
	ldrh r0, [r4]
	movs r1, 0
	movs r2, 0x1
	bl sub_8113EAC
	ldrh r0, [r4, 0x2]
	movs r1, 0
	movs r2, 0x2
	bl sub_8113EAC
	ldr r1, _0811506C @ =gUnknown_8456ACC
	ldrb r0, [r5, 0x1]
	lsls r0, 2
	adds r0, r1
	ldr r1, [r0]
	movs r0, 0x3
	bl UnkTextUtil_SetPtrI
	ldr r0, _08115070 @ =gStringVar4
	ldr r1, _08115074 @ =gUnknown_841AF3E
	bl UnkTextUtil_StringExpandPlaceholders
	adds r4, 0x8
	adds r0, r4, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08115068: .4byte gTrainers+0x4
_0811506C: .4byte gUnknown_8456ACC
_08115070: .4byte gStringVar4
_08115074: .4byte gUnknown_841AF3E
	thumb_func_end sub_811500C

	thumb_func_start sub_8115078
sub_8115078: @ 8115078
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r0, _081150B4 @ =gUnknown_8456AA0
	adds r0, 0x21
	ldrb r1, [r0]
	adds r0, r4, 0
	bl sub_8110944
	lsls r0, 24
	cmp r0, 0
	beq _081150C4
	ldr r1, _081150B8 @ =0x00002021
	adds r0, r1, 0
	strh r0, [r4]
	ldr r0, _081150BC @ =gUnknown_203AF98
	ldrh r0, [r0]
	strh r0, [r4, 0x2]
	ldrh r0, [r5, 0x2]
	strh r0, [r4, 0x4]
	ldrh r0, [r5, 0x4]
	strh r0, [r4, 0x6]
	ldrb r0, [r5, 0x6]
	strb r0, [r4, 0x8]
	ldr r1, _081150C0 @ =gUnknown_203B048
	movs r0, 0x1
	strb r0, [r1]
	adds r0, r4, 0
	adds r0, 0xA
	b _081150C6
	.align 2, 0
_081150B4: .4byte gUnknown_8456AA0
_081150B8: .4byte 0x00002021
_081150BC: .4byte gUnknown_203AF98
_081150C0: .4byte gUnknown_203B048
_081150C4:
	movs r0, 0
_081150C6:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8115078

	thumb_func_start sub_81150CC
sub_81150CC: @ 81150CC
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r0, _081150E8 @ =gUnknown_8456AA0
	adds r0, 0x21
	ldrb r1, [r0]
	adds r0, r4, 0
	bl sub_8110944
	lsls r0, 24
	cmp r0, 0
	bne _081150EC
	movs r0, 0
	b _081151AE
	.align 2, 0
_081150E8: .4byte gUnknown_8456AA0
_081150EC:
	adds r5, r4, 0
	adds r5, 0x8
	bl UnkTextUtil_Reset
	ldr r0, _08115108 @ =gUnknown_203B044
	ldrh r0, [r0, 0x2]
	cmp r0, 0x1
	beq _08115148
	cmp r0, 0x1
	bgt _0811510C
	cmp r0, 0
	beq _08115112
	b _081151AC
	.align 2, 0
_08115108: .4byte gUnknown_203B044
_0811510C:
	cmp r0, 0x2
	beq _08115194
	b _081151AC
_08115112:
	ldr r0, _08115134 @ =gSaveBlock2Ptr
	ldr r1, [r0]
	movs r0, 0
	bl UnkTextUtil_SetPtrI
	ldr r0, _08115138 @ =gSaveBlock1Ptr
	ldr r1, [r0]
	ldr r0, _0811513C @ =0x00003a4c
	adds r1, r0
	movs r0, 0x1
	bl UnkTextUtil_SetPtrI
	ldr r0, _08115140 @ =gStringVar4
	ldr r1, _08115144 @ =gUnknown_841A2E1
	bl UnkTextUtil_StringExpandPlaceholders
	b _081151AC
	.align 2, 0
_08115134: .4byte gSaveBlock2Ptr
_08115138: .4byte gSaveBlock1Ptr
_0811513C: .4byte 0x00003a4c
_08115140: .4byte gStringVar4
_08115144: .4byte gUnknown_841A2E1
_08115148:
	ldr r0, _08115180 @ =gSaveBlock1Ptr
	ldr r1, [r0]
	ldr r0, _08115184 @ =0x00003a4c
	adds r1, r0
	movs r0, 0
	bl UnkTextUtil_SetPtrI
	ldrh r0, [r4, 0x4]
	movs r1, 0
	movs r2, 0x1
	bl sub_8113EAC
	ldr r0, _08115188 @ =gSaveBlock2Ptr
	ldr r1, [r0]
	movs r0, 0x2
	bl UnkTextUtil_SetPtrI
	ldrh r0, [r4, 0x6]
	movs r1, 0
	movs r2, 0x3
	bl sub_8113EAC
	ldr r0, _0811518C @ =gStringVar4
	ldr r1, _08115190 @ =gUnknown_841A312
	bl UnkTextUtil_StringExpandPlaceholders
	b _081151AC
	.align 2, 0
_08115180: .4byte gSaveBlock1Ptr
_08115184: .4byte 0x00003a4c
_08115188: .4byte gSaveBlock2Ptr
_0811518C: .4byte gStringVar4
_08115190: .4byte gUnknown_841A312
_08115194:
	ldr r1, _081151B4 @ =gUnknown_8456AD8
	ldrb r0, [r4, 0x8]
	lsls r0, 2
	adds r0, r1
	ldr r1, [r0]
	movs r0, 0
	bl UnkTextUtil_SetPtrI
	ldr r0, _081151B8 @ =gStringVar4
	ldr r1, _081151BC @ =gUnknown_841A349
	bl UnkTextUtil_StringExpandPlaceholders
_081151AC:
	adds r0, r5, 0x2
_081151AE:
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_081151B4: .4byte gUnknown_8456AD8
_081151B8: .4byte gStringVar4
_081151BC: .4byte gUnknown_841A349
	thumb_func_end sub_81150CC

	thumb_func_start sub_81151C0
sub_81151C0: @ 81151C0
	push {lr}
	adds r3, r0, 0
	adds r2, r1, 0
	ldr r1, _081151D8 @ =gUnknown_203B048
	movs r0, 0x1
	strb r0, [r1]
	movs r0, 0x22
	adds r1, r3, 0
	bl sub_8114D18
	pop {r1}
	bx r1
	.align 2, 0
_081151D8: .4byte gUnknown_203B048
	thumb_func_end sub_81151C0

	thumb_func_start sub_81151DC
sub_81151DC: @ 81151DC
	push {r4-r6,lr}
	adds r1, r0, 0
	movs r0, 0x22
	bl sub_8113E88
	adds r5, r0, 0
	adds r6, r5, 0x6
	bl UnkTextUtil_Reset
	ldr r4, _0811522C @ =gStringVar1
	ldrb r1, [r5, 0x6]
	adds r0, r4, 0
	bl sub_80C4DF8
	movs r0, 0
	adds r1, r4, 0
	bl UnkTextUtil_SetPtrI
	ldr r3, _08115230 @ =gTrainers
	ldrh r1, [r5, 0x4]
	lsls r0, r1, 2
	adds r0, r1
	lsls r2, r0, 3
	adds r0, r2, r3
	ldrb r0, [r0, 0x1]
	cmp r0, 0x51
	beq _0811521A
	cmp r0, 0x59
	beq _0811521A
	cmp r0, 0x5A
	bne _08115234
_0811521A:
	movs r0, 0x6
	bl GetExpandedPlaceholder
	adds r1, r0, 0
	movs r0, 0x1
	bl UnkTextUtil_SetPtrI
	b _0811523E
	.align 2, 0
_0811522C: .4byte gStringVar1
_08115230: .4byte gTrainers
_08115234:
	adds r1, r3, 0x4
	adds r1, r2, r1
	movs r0, 0x1
	bl UnkTextUtil_SetPtrI
_0811523E:
	ldrh r0, [r5]
	movs r1, 0
	movs r2, 0x2
	bl sub_8113EAC
	ldrh r0, [r5, 0x2]
	movs r1, 0
	movs r2, 0x3
	bl sub_8113EAC
	ldr r1, _08115274 @ =gUnknown_8456ACC
	ldrb r0, [r6, 0x1]
	lsls r0, 2
	adds r0, r1
	ldr r1, [r0]
	movs r0, 0x4
	bl UnkTextUtil_SetPtrI
	ldr r0, _08115278 @ =gStringVar4
	ldr r1, _0811527C @ =gUnknown_841AF6D
	bl UnkTextUtil_StringExpandPlaceholders
	adds r0, r6, 0x2
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08115274: .4byte gUnknown_8456ACC
_08115278: .4byte gStringVar4
_0811527C: .4byte gUnknown_841AF6D
	thumb_func_end sub_81151DC

	thumb_func_start sub_8115280
sub_8115280: @ 8115280
	push {r4,lr}
	adds r2, r0, 0
	adds r4, r1, 0
	movs r0, 0x23
	adds r1, r2, 0
	bl sub_8113DE0
	adds r2, r0, 0
	cmp r2, 0
	bne _08115298
	movs r0, 0
	b _081152B0
_08115298:
	ldrb r0, [r4]
	strb r0, [r2]
	ldrb r0, [r4, 0x1]
	strb r0, [r2, 0x1]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x24
	bne _081152AE
	ldr r1, _081152B8 @ =gUnknown_203B048
	movs r0, 0x1
	strb r0, [r1]
_081152AE:
	adds r0, r2, 0x2
_081152B0:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_081152B8: .4byte gUnknown_203B048
	thumb_func_end sub_8115280

	thumb_func_start sub_81152BC
sub_81152BC: @ 81152BC
	push {r4-r7,lr}
	adds r1, r0, 0
	movs r0, 0x23
	bl sub_8113E88
	adds r5, r0, 0
	ldrb r6, [r5, 0x1]
	ldr r0, _08115318 @ =gStringVar1
	ldrb r1, [r5]
	bl sub_80C4DF8
	ldr r0, _0811531C @ =gStringVar2
	ldr r2, _08115320 @ =gUnknown_8456AF0
	lsls r1, r6, 2
	adds r1, r2
	ldr r1, [r1]
	bl StringCopy
	ldr r0, _08115324 @ =gUnknown_8456BE4
	adds r1, r6, r0
	ldrb r0, [r1]
	cmp r0, 0x5
	bne _08115378
	movs r4, 0
	ldr r2, _08115328 @ =gUnknown_8456C17
	adds r7, r5, 0x2
	ldrb r1, [r5]
_081152F2:
	adds r0, r4, r2
	ldrb r0, [r0]
	cmp r1, r0
	bne _08115334
	movs r1, 0x82
	lsls r1, 4
	adds r0, r4, r1
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08115364
	ldr r0, _0811532C @ =gStringVar4
	ldr r1, _08115330 @ =gUnknown_841AE48
	bl StringExpandPlaceholders
	b _0811533E
	.align 2, 0
_08115318: .4byte gStringVar1
_0811531C: .4byte gStringVar2
_08115320: .4byte gUnknown_8456AF0
_08115324: .4byte gUnknown_8456BE4
_08115328: .4byte gUnknown_8456C17
_0811532C: .4byte gStringVar4
_08115330: .4byte gUnknown_841AE48
_08115334:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x7
	bls _081152F2
_0811533E:
	cmp r4, 0x8
	bne _0811538A
	ldr r0, _08115358 @ =gStringVar4
	ldr r2, _0811535C @ =gUnknown_8456BBC
	ldr r1, _08115360 @ =gUnknown_8456BE4
	adds r1, r6, r1
	ldrb r1, [r1]
	lsls r1, 2
	adds r1, r2
	ldr r1, [r1]
	bl StringExpandPlaceholders
	b _0811538A
	.align 2, 0
_08115358: .4byte gStringVar4
_0811535C: .4byte gUnknown_8456BBC
_08115360: .4byte gUnknown_8456BE4
_08115364:
	ldr r0, _08115370 @ =gStringVar4
	ldr r1, _08115374 @ =gUnknown_841AE8F
	bl StringExpandPlaceholders
	b _0811533E
	.align 2, 0
_08115370: .4byte gStringVar4
_08115374: .4byte gUnknown_841AE8F
_08115378:
	ldr r0, _08115394 @ =gStringVar4
	ldr r2, _08115398 @ =gUnknown_8456BBC
	ldrb r1, [r1]
	lsls r1, 2
	adds r1, r2
	ldr r1, [r1]
	bl StringExpandPlaceholders
	adds r7, r5, 0x2
_0811538A:
	adds r0, r7, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08115394: .4byte gStringVar4
_08115398: .4byte gUnknown_8456BBC
	thumb_func_end sub_81152BC

	thumb_func_start sub_811539C
sub_811539C: @ 811539C
	ldr r1, _081153A4 @ =gUnknown_203B04B
	movs r0, 0x1
	strb r0, [r1]
	bx lr
	.align 2, 0
_081153A4: .4byte gUnknown_203B04B
	thumb_func_end sub_811539C

	thumb_func_start sub_81153A8
sub_81153A8: @ 81153A8
	push {lr}
	adds r2, r1, 0
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x23
	beq _081153C4
	ldr r1, _081153C0 @ =gUnknown_203B04A
	movs r0, 0
	strb r0, [r1]
	movs r0, 0x1
	b _081153DE
	.align 2, 0
_081153C0: .4byte gUnknown_203B04A
_081153C4:
	ldr r3, _081153D8 @ =gUnknown_203B04A
	ldrb r1, [r3]
	ldrb r0, [r2, 0x1]
	adds r0, 0x1
	cmp r1, r0
	beq _081153DC
	strb r0, [r3]
	movs r0, 0x1
	b _081153DE
	.align 2, 0
_081153D8: .4byte gUnknown_203B04A
_081153DC:
	movs r0, 0
_081153DE:
	pop {r1}
	bx r1
	thumb_func_end sub_81153A8

	thumb_func_start sub_81153E4
sub_81153E4: @ 81153E4
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x23
	bne _08115408
	ldrb r0, [r1, 0x1]
	ldr r1, _08115400 @ =gUnknown_203B04B
	cmp r0, 0x20
	bne _08115404
	ldrb r0, [r1]
	cmp r0, 0
	bne _08115404
	movs r0, 0
	b _0811540A
	.align 2, 0
_08115400: .4byte gUnknown_203B04B
_08115404:
	movs r0, 0
	strb r0, [r1]
_08115408:
	movs r0, 0x1
_0811540A:
	pop {r1}
	bx r1
	thumb_func_end sub_81153E4

	thumb_func_start sub_8115410
sub_8115410: @ 8115410
	push {r4,lr}
	adds r2, r0, 0
	adds r4, r1, 0
	movs r0, 0x24
	adds r1, r2, 0
	bl sub_8113DE0
	adds r2, r0, 0
	cmp r2, 0
	bne _08115428
	movs r0, 0
	b _08115454
_08115428:
	ldrh r0, [r4]
	strh r0, [r2]
	adds r3, r2, 0x2
	ldrb r0, [r4, 0x2]
	strb r0, [r2, 0x2]
	ldrb r0, [r4, 0x3]
	strb r0, [r3, 0x1]
	ldrb r0, [r2, 0x2]
	subs r0, 0x7
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bhi _0811544C
	ldr r1, _08115448 @ =gUnknown_203B048
	movs r0, 0x2
	b _08115450
	.align 2, 0
_08115448: .4byte gUnknown_203B048
_0811544C:
	ldr r1, _0811545C @ =gUnknown_203B048
	movs r0, 0x1
_08115450:
	strb r0, [r1]
	adds r0, r3, 0x2
_08115454:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0811545C: .4byte gUnknown_203B048
	thumb_func_end sub_8115410

	thumb_func_start sub_8115460
sub_8115460: @ 8115460
	push {r4,r5,lr}
	adds r1, r0, 0
	movs r0, 0x24
	bl sub_8113E88
	adds r4, r0, 0
	adds r5, r4, 0x2
	ldrh r0, [r4]
	ldr r1, _0811549C @ =gStringVar1
	movs r2, 0
	bl sub_8113EAC
	ldrb r0, [r5, 0x1]
	cmp r0, 0xFF
	beq _08115486
	ldr r0, _081154A0 @ =gStringVar2
	ldrb r1, [r5, 0x1]
	bl sub_80C4DF8
_08115486:
	ldrb r0, [r4, 0x2]
	cmp r0, 0x7
	bne _081154B4
	ldrb r0, [r5, 0x1]
	cmp r0, 0x58
	bne _081154AC
	ldr r0, _081154A4 @ =gStringVar3
	ldr r1, _081154A8 @ =gUnknown_841B09F
	bl StringCopy
	b _081154B4
	.align 2, 0
_0811549C: .4byte gStringVar1
_081154A0: .4byte gStringVar2
_081154A4: .4byte gStringVar3
_081154A8: .4byte gUnknown_841B09F
_081154AC:
	ldr r0, _081154CC @ =gStringVar3
	ldr r1, _081154D0 @ =gUnknown_8418C1B
	bl StringCopy
_081154B4:
	ldr r0, _081154D4 @ =gStringVar4
	ldr r2, _081154D8 @ =gUnknown_8456C20
	ldrb r1, [r5]
	lsls r1, 2
	adds r1, r2
	ldr r1, [r1]
	bl StringExpandPlaceholders
	adds r0, r5, 0x2
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_081154CC: .4byte gStringVar3
_081154D0: .4byte gUnknown_8418C1B
_081154D4: .4byte gStringVar4
_081154D8: .4byte gUnknown_8456C20
	thumb_func_end sub_8115460

	thumb_func_start sub_81154DC
sub_81154DC: @ 81154DC
	push {r4,lr}
	adds r2, r0, 0
	adds r4, r1, 0
	movs r0, 0x25
	adds r1, r2, 0
	bl sub_8113DE0
	adds r2, r0, 0
	cmp r2, 0
	beq _0811550E
	ldrh r0, [r4, 0x4]
	strh r0, [r2]
	ldrh r0, [r4, 0x6]
	strh r0, [r2, 0x2]
	ldr r1, [r4]
	lsrs r0, r1, 16
	strh r0, [r2, 0x4]
	strh r1, [r2, 0x6]
	ldrb r0, [r4, 0x8]
	strb r0, [r2, 0x8]
	movs r0, 0x1
	strb r0, [r2, 0x9]
	adds r0, r2, 0
	adds r0, 0xA
	b _08115510
_0811550E:
	movs r0, 0
_08115510:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_81154DC

	thumb_func_start sub_8115518
sub_8115518: @ 8115518
	push {r4-r7,lr}
	adds r1, r0, 0
	movs r0, 0x25
	bl sub_8113E88
	adds r4, r0, 0
	adds r7, r4, 0
	adds r7, 0x8
	ldrh r0, [r4, 0x4]
	lsls r0, 16
	ldrh r1, [r4, 0x6]
	adds r6, r0, r1
	bl UnkTextUtil_Reset
	ldr r5, _08115564 @ =gStringVar1
	ldrb r1, [r4, 0x8]
	adds r0, r5, 0
	bl sub_80C4DF8
	movs r0, 0
	adds r1, r5, 0
	bl UnkTextUtil_SetPtrI
	ldrh r0, [r4]
	bl ItemId_GetItem
	adds r1, r0, 0
	movs r0, 0x1
	bl UnkTextUtil_SetPtrI
	ldrh r0, [r4, 0x2]
	cmp r0, 0x1
	bhi _08115570
	ldr r0, _08115568 @ =gStringVar4
	ldr r1, _0811556C @ =gUnknown_841A7DD
	bl UnkTextUtil_StringExpandPlaceholders
	b _0811558E
	.align 2, 0
_08115564: .4byte gStringVar1
_08115568: .4byte gStringVar4
_0811556C: .4byte gUnknown_841A7DD
_08115570:
	ldr r4, _08115598 @ =gStringVar2
	adds r0, r4, 0
	adds r1, r6, 0
	movs r2, 0
	movs r3, 0x6
	bl ConvertIntToDecimalStringN
	movs r0, 0x2
	adds r1, r4, 0
	bl UnkTextUtil_SetPtrI
	ldr r0, _0811559C @ =gStringVar4
	ldr r1, _081155A0 @ =gUnknown_841A810
	bl UnkTextUtil_StringExpandPlaceholders
_0811558E:
	adds r0, r7, 0x2
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08115598: .4byte gStringVar2
_0811559C: .4byte gStringVar4
_081155A0: .4byte gUnknown_841A810
	thumb_func_end sub_8115518

	thumb_func_start sub_81155A4
sub_81155A4: @ 81155A4
	push {r4,lr}
	adds r2, r0, 0
	adds r4, r1, 0
	movs r0, 0x26
	adds r1, r2, 0
	bl sub_8113DE0
	adds r2, r0, 0
	cmp r2, 0
	beq _081155D6
	ldrh r0, [r4, 0x4]
	strh r0, [r2]
	ldrh r0, [r4, 0x6]
	strh r0, [r2, 0x2]
	ldr r1, [r4]
	lsrs r0, r1, 16
	strh r0, [r2, 0x4]
	strh r1, [r2, 0x6]
	ldrb r0, [r4, 0x8]
	strb r0, [r2, 0x8]
	ldrb r0, [r4, 0x9]
	strb r0, [r2, 0x9]
	adds r0, r2, 0
	adds r0, 0xA
	b _081155D8
_081155D6:
	movs r0, 0
_081155D8:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_81155A4

	thumb_func_start sub_81155E0
sub_81155E0: @ 81155E0
	push {r4-r7,lr}
	adds r1, r0, 0
	movs r0, 0x26
	bl sub_8113E88
	adds r5, r0, 0
	adds r7, r5, 0
	adds r7, 0x8
	ldrh r0, [r5, 0x4]
	lsls r0, 16
	ldrh r1, [r5, 0x6]
	adds r6, r0, r1
	bl UnkTextUtil_Reset
	ldr r4, _0811563C @ =gStringVar1
	ldrb r1, [r5, 0x8]
	adds r0, r4, 0
	bl sub_80C4DF8
	ldrb r0, [r7, 0x1]
	cmp r0, 0
	bne _08115690
	ldr r0, _08115640 @ =gSaveBlock2Ptr
	ldr r1, [r0]
	movs r0, 0
	bl UnkTextUtil_SetPtrI
	movs r0, 0x1
	adds r1, r4, 0
	bl UnkTextUtil_SetPtrI
	ldrh r0, [r5]
	bl ItemId_GetItem
	adds r1, r0, 0
	movs r0, 0x2
	bl UnkTextUtil_SetPtrI
	ldrh r0, [r5, 0x2]
	cmp r0, 0x1
	bne _08115648
	ldr r1, _08115644 @ =gUnknown_841A8D4
	movs r0, 0x3
	bl UnkTextUtil_SetPtrI
	b _08115670
	.align 2, 0
_0811563C: .4byte gStringVar1
_08115640: .4byte gSaveBlock2Ptr
_08115644: .4byte gUnknown_841A8D4
_08115648:
	ldr r4, _0811567C @ =gStringVar2
	ldrh r1, [r5, 0x2]
	adds r0, r4, 0
	movs r2, 0
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	movs r0, 0x4
	adds r1, r4, 0
	bl UnkTextUtil_SetPtrI
	ldr r4, _08115680 @ =gStringVar3
	ldr r1, _08115684 @ =gUnknown_841A8DD
	adds r0, r4, 0
	bl UnkTextUtil_StringExpandPlaceholders
	movs r0, 0x3
	adds r1, r4, 0
	bl UnkTextUtil_SetPtrI
_08115670:
	ldr r0, _08115688 @ =gStringVar4
	ldr r1, _0811568C @ =gUnknown_841A858
	bl UnkTextUtil_StringExpandPlaceholders
	b _081156C4
	.align 2, 0
_0811567C: .4byte gStringVar2
_08115680: .4byte gStringVar3
_08115684: .4byte gUnknown_841A8DD
_08115688: .4byte gStringVar4
_0811568C: .4byte gUnknown_841A858
_08115690:
	movs r0, 0
	adds r1, r4, 0
	bl UnkTextUtil_SetPtrI
	ldrh r0, [r5]
	bl ItemId_GetItem
	adds r1, r0, 0
	movs r0, 0x1
	bl UnkTextUtil_SetPtrI
	ldr r4, _081156CC @ =gStringVar2
	adds r0, r4, 0
	adds r1, r6, 0
	movs r2, 0
	movs r3, 0x6
	bl ConvertIntToDecimalStringN
	movs r0, 0x2
	adds r1, r4, 0
	bl UnkTextUtil_SetPtrI
	ldr r0, _081156D0 @ =gStringVar4
	ldr r1, _081156D4 @ =gUnknown_841A896
	bl UnkTextUtil_StringExpandPlaceholders
_081156C4:
	adds r0, r7, 0x2
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_081156CC: .4byte gStringVar2
_081156D0: .4byte gStringVar4
_081156D4: .4byte gUnknown_841A896
	thumb_func_end sub_81155E0

	thumb_func_start sub_81156D8
sub_81156D8: @ 81156D8
	push {r4,lr}
	adds r2, r0, 0
	adds r4, r1, 0
	movs r0, 0x28
	adds r1, r2, 0
	bl sub_8113DE0
	adds r2, r0, 0
	cmp r2, 0
	beq _081156F8
	ldrh r0, [r4]
	strh r0, [r2]
	ldrb r0, [r4, 0x2]
	strb r0, [r2, 0x2]
	adds r0, r2, 0x4
	b _081156FA
_081156F8:
	movs r0, 0
_081156FA:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_81156D8

	thumb_func_start sub_8115700
sub_8115700: @ 8115700
	push {r4-r6,lr}
	adds r1, r0, 0
	movs r0, 0x28
	bl sub_8113E88
	adds r4, r0, 0
	adds r5, r4, 0x2
	ldr r0, _08115738 @ =gStringVar1
	ldrb r1, [r4, 0x2]
	bl sub_80C4DF8
	ldr r6, _0811573C @ =gStringVar2
	ldrh r0, [r4]
	bl ItemId_GetItem
	adds r1, r0, 0
	adds r0, r6, 0
	bl StringCopy
	ldr r0, _08115740 @ =gStringVar4
	ldr r1, _08115744 @ =gUnknown_841B03F
	bl StringExpandPlaceholders
	adds r5, 0x2
	adds r0, r5, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08115738: .4byte gStringVar1
_0811573C: .4byte gStringVar2
_08115740: .4byte gStringVar4
_08115744: .4byte gUnknown_841B03F
	thumb_func_end sub_8115700

	thumb_func_start sub_8115748
sub_8115748: @ 8115748
	push {r4,lr}
	lsls r0, 16
	lsrs r2, r0, 16
	ldr r0, _08115764 @ =gUnknown_203ADFA
	ldrb r0, [r0]
	subs r0, 0x2
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bls _08115792
	movs r1, 0
	ldr r4, _08115768 @ =gUnknown_203B049
	ldr r0, _0811576C @ =gUnknown_8456C50
	b _08115778
	.align 2, 0
_08115764: .4byte gUnknown_203ADFA
_08115768: .4byte gUnknown_203B049
_0811576C: .4byte gUnknown_8456C50
_08115770:
	movs r0, 0
	b _08115790
_08115774:
	adds r0, 0x2
	adds r1, 0x1
_08115778:
	cmp r1, 0x10
	bgt _08115792
	ldrh r3, [r0]
	cmp r2, r3
	bne _08115774
	adds r0, r2, 0
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	bne _08115770
	movs r0, 0x1
_08115790:
	strb r0, [r4]
_08115792:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8115748

	thumb_func_start sub_8115798
sub_8115798: @ 8115798
	push {r4,lr}
	sub sp, 0x4
	ldr r0, _081157D0 @ =gUnknown_203ADFA
	ldrb r0, [r0]
	subs r0, 0x2
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bls _081157C6
	ldr r4, _081157D4 @ =gUnknown_203B049
	ldrb r0, [r4]
	cmp r0, 0
	beq _081157C6
	ldr r0, _081157D8 @ =gMapHeader
	ldrb r1, [r0, 0x14]
	mov r0, sp
	strh r1, [r0]
	movs r0, 0x2A
	mov r1, sp
	bl sub_8113550
	movs r0, 0
	strb r0, [r4]
_081157C6:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081157D0: .4byte gUnknown_203ADFA
_081157D4: .4byte gUnknown_203B049
_081157D8: .4byte gMapHeader
	thumb_func_end sub_8115798

	thumb_func_start sub_81157DC
sub_81157DC: @ 81157DC
	push {r4,lr}
	adds r2, r0, 0
	adds r4, r1, 0
	movs r0, 0x2A
	adds r1, r2, 0
	bl sub_8113DE0
	adds r2, r0, 0
	cmp r2, 0
	beq _081157F8
	ldrh r0, [r4]
	strh r0, [r2]
	adds r0, r2, 0x2
	b _081157FA
_081157F8:
	movs r0, 0
_081157FA:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_81157DC

	thumb_func_start sub_8115800
sub_8115800: @ 8115800
	push {r4,lr}
	adds r1, r0, 0
	movs r0, 0x2A
	bl sub_8113E88
	adds r4, r0, 0
	ldr r0, _08115828 @ =gStringVar1
	ldrb r1, [r4]
	bl sub_80C4DF8
	ldr r0, _0811582C @ =gStringVar4
	ldr r1, _08115830 @ =gUnknown_841B064
	bl StringExpandPlaceholders
	adds r4, 0x2
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08115828: .4byte gStringVar1
_0811582C: .4byte gStringVar4
_08115830: .4byte gUnknown_841B064
	thumb_func_end sub_8115800

	thumb_func_start sub_8115834
sub_8115834: @ 8115834
	push {lr}
	adds r1, r0, 0
	ldrb r0, [r1]
	adds r1, 0x1
	cmp r0, 0xFC
	bne _08115868
	ldrb r0, [r1]
	adds r1, 0x1
	cmp r0, 0x15
	bne _08115868
	movs r2, 0
	b _08115854
_0811584C:
	adds r1, 0x1
	adds r2, 0x1
	cmp r2, 0x4
	bgt _0811585A
_08115854:
	ldrb r0, [r1]
	cmp r0, 0xFC
	bne _0811584C
_0811585A:
	movs r0, 0xFC
	strb r0, [r1]
	adds r1, 0x1
	movs r0, 0x16
	strb r0, [r1]
	movs r0, 0xFF
	strb r0, [r1, 0x1]
_08115868:
	pop {r0}
	bx r0
	thumb_func_end sub_8115834

	.align 2, 0 @ Don't pad with nop.
