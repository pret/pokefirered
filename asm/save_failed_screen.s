	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_80F50F4
sub_80F50F4: @ 80F50F4
	ldr r1, _080F50FC @ =gUnknown_3005430
	movs r0, 0
	str r0, [r1]
	bx lr
	.align 2, 0
_080F50FC: .4byte gUnknown_3005430
	thumb_func_end sub_80F50F4

	thumb_func_start sub_80F5100
sub_80F5100: @ 80F5100
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080F5110 @ =gUnknown_203AB4C
	strh r0, [r1]
	ldr r1, _080F5114 @ =gUnknown_3005430
	movs r0, 0x1
	str r0, [r1]
	bx lr
	.align 2, 0
_080F5110: .4byte gUnknown_203AB4C
_080F5114: .4byte gUnknown_3005430
	thumb_func_end sub_80F5100

	thumb_func_start sub_80F5118
sub_80F5118: @ 80F5118
	push {lr}
	ldr r0, _080F5130 @ =gUnknown_203AB50
	ldrb r1, [r0]
	adds r2, r0, 0
	cmp r1, 0x8
	bls _080F5126
	b _080F52D6
_080F5126:
	lsls r0, r1, 2
	ldr r1, _080F5134 @ =_080F5138
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080F5130: .4byte gUnknown_203AB50
_080F5134: .4byte _080F5138
	.align 2, 0
_080F5138:
	.4byte _080F515C
	.4byte _080F5190
	.4byte _080F51B4
	.4byte _080F51E4
	.4byte _080F5204
	.4byte _080F5240
	.4byte _080F5280
	.4byte _080F5298
	.4byte _080F52B4
_080F515C:
	ldr r0, _080F5168 @ =gUnknown_3005430
	ldr r0, [r0]
	cmp r0, 0
	bne _080F516C
	movs r0, 0
	b _080F52D8
	.align 2, 0
_080F5168: .4byte gUnknown_3005430
_080F516C:
	ldr r0, _080F5184 @ =gMPlay_BGM
	ldr r1, _080F5188 @ =0x0000ffff
	movs r2, 0x80
	bl m4aMPlayVolumeControl
	bl sub_813BB38
	ldr r1, _080F518C @ =gUnknown_203AB50
	movs r0, 0x1
	strb r0, [r1]
	b _080F52D6
	.align 2, 0
_080F5184: .4byte gMPlay_BGM
_080F5188: .4byte 0x0000ffff
_080F518C: .4byte gUnknown_203AB50
_080F5190:
	bl sub_813BBAC
	bl sub_813BB74
	bl sub_813BBC8
	bl sub_80F52EC
	movs r0, 0
	movs r1, 0
	bl SetGpuReg
	ldr r1, _080F51B0 @ =gUnknown_203AB50
	movs r0, 0x2
	strb r0, [r1]
	b _080F52D6
	.align 2, 0
_080F51B0: .4byte gUnknown_203AB50
_080F51B4:
	ldr r1, _080F51D8 @ =0x0600c000
	movs r2, 0x80
	lsls r2, 7
	movs r0, 0
	movs r3, 0
	bl RequestDma3Fill
	ldr r0, _080F51DC @ =gUnknown_841EE44
	movs r1, 0xA0
	lsls r1, 19
	movs r2, 0x20
	movs r3, 0
	bl RequestDma3Copy
	ldr r1, _080F51E0 @ =gUnknown_203AB50
	movs r0, 0x3
	strb r0, [r1]
	b _080F52D6
	.align 2, 0
_080F51D8: .4byte 0x0600c000
_080F51DC: .4byte gUnknown_841EE44
_080F51E0: .4byte gUnknown_203AB50
_080F51E4:
	bl sub_80F53E8
	ldr r0, _080F51FC @ =gUnknown_8418C83
	bl sub_80F5404
	bl sub_80F53CC
	ldr r1, _080F5200 @ =gUnknown_203AB50
	movs r0, 0x4
	strb r0, [r1]
	b _080F52D6
	.align 2, 0
_080F51FC: .4byte gUnknown_8418C83
_080F5200: .4byte gUnknown_203AB50
_080F5204:
	movs r0, 0x50
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x10
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x12
	movs r1, 0
	bl SetGpuReg
	ldr r1, _080F5238 @ =0x00001f0c
	movs r0, 0x8
	bl SetGpuReg
	movs r1, 0x80
	lsls r1, 1
	movs r0, 0
	bl SetGpuReg
	ldr r1, _080F523C @ =gUnknown_203AB50
	movs r0, 0x5
	strb r0, [r1]
	b _080F52D6
	.align 2, 0
_080F5238: .4byte 0x00001f0c
_080F523C: .4byte gUnknown_203AB50
_080F5240:
	bl sub_80F5458
	adds r1, r0, 0
	cmp r1, 0x1
	bne _080F5260
	ldr r0, _080F5258 @ =gUnknown_3005420
	strh r1, [r0]
	ldr r0, _080F525C @ =gUnknown_8418E09
	bl sub_80F5404
	b _080F526C
	.align 2, 0
_080F5258: .4byte gUnknown_3005420
_080F525C: .4byte gUnknown_8418E09
_080F5260:
	ldr r0, _080F5274 @ =gUnknown_3005420
	movs r1, 0xFF
	strh r1, [r0]
	ldr r0, _080F5278 @ =gUnknown_8418CD9
	bl sub_80F5404
_080F526C:
	ldr r1, _080F527C @ =gUnknown_203AB50
	movs r0, 0x6
	strb r0, [r1]
	b _080F52D6
	.align 2, 0
_080F5274: .4byte gUnknown_3005420
_080F5278: .4byte gUnknown_8418CD9
_080F527C: .4byte gUnknown_203AB50
_080F5280:
	ldr r0, _080F5294 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080F52D6
	movs r0, 0x7
	strb r0, [r2]
	b _080F52D6
	.align 2, 0
_080F5294: .4byte gMain
_080F5298:
	movs r0, 0
	movs r1, 0
	bl SetGpuReg
	bl sub_813BC2C
	bl sub_80F52EC
	ldr r1, _080F52B0 @ =gUnknown_203AB50
	movs r0, 0x8
	strb r0, [r1]
	b _080F52D6
	.align 2, 0
_080F52B0: .4byte gUnknown_203AB50
_080F52B4:
	ldr r0, _080F52DC @ =gMPlay_BGM
	ldr r1, _080F52E0 @ =0x0000ffff
	movs r2, 0x80
	lsls r2, 1
	bl m4aMPlayVolumeControl
	bl sub_813BC48
	bl sub_813BBF4
	bl sub_813BBDC
	ldr r0, _080F52E4 @ =gUnknown_3005430
	movs r1, 0
	str r1, [r0]
	ldr r0, _080F52E8 @ =gUnknown_203AB50
	strb r1, [r0]
_080F52D6:
	movs r0, 0x1
_080F52D8:
	pop {r1}
	bx r1
	.align 2, 0
_080F52DC: .4byte gMPlay_BGM
_080F52E0: .4byte 0x0000ffff
_080F52E4: .4byte gUnknown_3005430
_080F52E8: .4byte gUnknown_203AB50
	thumb_func_end sub_80F5118

	thumb_func_start sub_80F52EC
sub_80F52EC: @ 80F52EC
	push {r4,r5,lr}
	movs r1, 0
	ldr r5, _080F5310 @ =0x000001ff
	movs r4, 0xA0
	lsls r4, 19
	movs r2, 0
	ldr r3, _080F5314 @ =0x05000200
_080F52FA:
	adds r0, r1, r4
	strh r2, [r0]
	adds r0, r1, r3
	strh r2, [r0]
	adds r1, 0x2
	cmp r1, r5
	ble _080F52FA
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080F5310: .4byte 0x000001ff
_080F5314: .4byte 0x05000200
	thumb_func_end sub_80F52EC

	thumb_func_start sub_80F5318
sub_80F5318: @ 80F5318
	push {lr}
	ldr r0, _080F532C @ =gUnknown_201F800
	ldr r1, _080F5330 @ =0x0600f800
	movs r2, 0xA0
	lsls r2, 3
	movs r3, 0
	bl RequestDma3Copy
	pop {r0}
	bx r0
	.align 2, 0
_080F532C: .4byte gUnknown_201F800
_080F5330: .4byte 0x0600f800
	thumb_func_end sub_80F5318

	thumb_func_start sub_80F5334
sub_80F5334: @ 80F5334
	push {lr}
	ldr r0, _080F5348 @ =gUnknown_201C020
	ldr r1, _080F534C @ =0x0600c020
	movs r2, 0x8C
	lsls r2, 6
	movs r3, 0
	bl RequestDma3Copy
	pop {r0}
	bx r0
	.align 2, 0
_080F5348: .4byte gUnknown_201C020
_080F534C: .4byte 0x0600c020
	thumb_func_end sub_80F5334

	thumb_func_start sub_80F5350
sub_80F5350: @ 80F5350
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	ldr r4, [sp, 0x20]
	ldr r5, [sp, 0x24]
	lsls r0, 16
	lsrs r6, r0, 16
	lsls r1, 24
	lsrs r1, 24
	mov r9, r1
	lsls r2, 24
	lsls r3, 24
	lsrs r3, 24
	mov r8, r3
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 16
	lsrs r7, r5, 16
	lsrs r0, r2, 24
	adds r2, r0, r4
	cmp r0, r2
	bge _080F53B6
	mov r12, r2
	ldr r1, _080F53C8 @ =gUnknown_201F800
	mov r10, r1
_080F5386:
	mov r4, r9
	mov r2, r8
	adds r1, r4, r2
	adds r3, r0, 0x1
	cmp r4, r1
	bge _080F53AE
	lsls r2, r0, 6
	mov r5, r10
_080F5396:
	lsls r0, r4, 1
	adds r0, r2, r0
	adds r0, r5
	strh r6, [r0]
	adds r0, r6, r7
	lsls r0, 16
	lsrs r6, r0, 16
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, r1
	blt _080F5396
_080F53AE:
	lsls r0, r3, 16
	lsrs r0, 16
	cmp r0, r12
	blt _080F5386
_080F53B6:
	bl sub_80F5318
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F53C8: .4byte gUnknown_201F800
	thumb_func_end sub_80F5350

	thumb_func_start sub_80F53CC
sub_80F53CC: @ 80F53CC
	push {lr}
	sub sp, 0x8
	movs r0, 0xA
	str r0, [sp]
	movs r0, 0x1
	str r0, [sp, 0x4]
	movs r1, 0x1
	movs r2, 0x5
	movs r3, 0x1C
	bl sub_80F5350
	add sp, 0x8
	pop {r0}
	bx r0
	thumb_func_end sub_80F53CC

	thumb_func_start sub_80F53E8
sub_80F53E8: @ 80F53E8
	push {lr}
	sub sp, 0x8
	movs r0, 0x14
	str r0, [sp]
	movs r0, 0
	str r0, [sp, 0x4]
	movs r1, 0
	movs r2, 0
	movs r3, 0x1E
	bl sub_80F5350
	add sp, 0x8
	pop {r0}
	bx r0
	thumb_func_end sub_80F53E8

	thumb_func_start sub_80F5404
sub_80F5404: @ 80F5404
	push {r4,r5,lr}
	sub sp, 0x10
	adds r5, r0, 0
	movs r0, 0x2
	movs r1, 0x1
	movs r2, 0x3
	bl GenerateFontHalfRowLookupTable
	add r1, sp, 0xC
	ldr r2, _080F544C @ =0x00001111
	adds r0, r2, 0
	strh r0, [r1]
	ldr r4, _080F5450 @ =gUnknown_201C020
	ldr r2, _080F5454 @ =0x01001180
	adds r0, r1, 0
	adds r1, r4, 0
	bl CpuSet
	movs r0, 0x2
	str r0, [sp]
	movs r0, 0x1C
	str r0, [sp, 0x4]
	movs r0, 0xA
	str r0, [sp, 0x8]
	movs r0, 0x2
	adds r1, r4, 0
	adds r2, r5, 0
	movs r3, 0x2
	bl sub_813C078
	bl sub_80F5334
	add sp, 0x10
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080F544C: .4byte 0x00001111
_080F5450: .4byte gUnknown_201C020
_080F5454: .4byte 0x01001180
	thumb_func_end sub_80F5404

	thumb_func_start sub_80F5458
sub_80F5458: @ 80F5458
	push {r4,r5,lr}
	movs r5, 0
	ldr r0, _080F5490 @ =gUnknown_300538C
	ldr r1, [r0]
	adds r4, r0, 0
	cmp r1, 0
	beq _080F548C
_080F5466:
	ldr r0, [r4]
	bl sub_80F5540
	cmp r0, 0
	bne _080F5498
	ldr r0, _080F5494 @ =gUnknown_203AB4C
	ldrb r0, [r0]
	bl sub_80DA248
	adds r5, 0x1
	ldr r0, [r4]
	cmp r0, 0
	beq _080F548C
	ldr r4, _080F5490 @ =gUnknown_300538C
	cmp r5, 0x2
	ble _080F5466
	ldr r0, [r4]
	cmp r0, 0
	bne _080F5498
_080F548C:
	movs r0, 0x1
	b _080F549A
	.align 2, 0
_080F5490: .4byte gUnknown_300538C
_080F5494: .4byte gUnknown_203AB4C
_080F5498:
	movs r0, 0
_080F549A:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80F5458

	thumb_func_start VerifySectorWipe
VerifySectorWipe: @ 80F54A0
	push {r4,lr}
	lsls r0, 16
	lsrs r0, 16
	ldr r4, _080F54C4 @ =gUnknown_2039A38
	movs r3, 0x80
	lsls r3, 5
	movs r1, 0
	adds r2, r4, 0
	bl ReadFlash
	movs r1, 0
	ldr r2, _080F54C8 @ =0x000003ff
_080F54B8:
	ldr r0, [r4]
	cmp r0, 0
	beq _080F54CC
	movs r0, 0x1
	b _080F54DA
	.align 2, 0
_080F54C4: .4byte gUnknown_2039A38
_080F54C8: .4byte 0x000003ff
_080F54CC:
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	adds r4, 0x4
	cmp r1, r2
	bls _080F54B8
	movs r0, 0
_080F54DA:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end VerifySectorWipe

	thumb_func_start WipeSector
WipeSector: @ 80F54E0
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	adds r7, r0, 0
	movs r0, 0
	lsls r6, r7, 16
	ldr r1, _080F5538 @ =ProgramFlashByte
	mov r9, r1
	ldr r1, _080F553C @ =0x00000fff
	mov r8, r1
_080F54F6:
	movs r4, 0
	adds r5, r0, 0x1
_080F54FA:
	mov r0, r9
	ldr r3, [r0]
	lsrs r0, r6, 16
	adds r1, r4, 0
	movs r2, 0
	bl _call_via_r3
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, r8
	bls _080F54FA
	adds r0, r7, 0
	bl VerifySectorWipe
	lsls r0, 16
	lsrs r1, r0, 16
	lsls r0, r5, 16
	lsrs r0, 16
	cmp r1, 0
	beq _080F5528
	cmp r0, 0x81
	bls _080F54F6
_080F5528:
	adds r0, r1, 0
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080F5538: .4byte ProgramFlashByte
_080F553C: .4byte 0x00000fff
	thumb_func_end WipeSector

	thumb_func_start sub_80F5540
sub_80F5540: @ 80F5540
	push {r4-r6,lr}
	adds r5, r0, 0
	movs r6, 0
_080F5546:
	movs r4, 0x1
	lsls r4, r6
	adds r0, r5, 0
	ands r0, r4
	cmp r0, 0
	beq _080F555E
	adds r0, r6, 0
	bl WipeSector
	cmp r0, 0
	bne _080F555E
	bics r5, r4
_080F555E:
	adds r6, 0x1
	cmp r6, 0x1F
	ble _080F5546
	cmp r5, 0
	beq _080F556C
	movs r0, 0x1
	b _080F556E
_080F556C:
	movs r0, 0
_080F556E:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80F5540

	.align 2, 0 @ Don't pad with nop.
