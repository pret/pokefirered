	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_811E06C
sub_811E06C: @ 811E06C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r3, r0, 0
	adds r5, r1, 0
	lsls r2, 24
	lsrs r2, 24
	mov r8, r2
	cmp r2, 0x3
	bne _0811E088
	movs r0, 0x78
	strh r0, [r5, 0x20]
	ldrh r0, [r3, 0x8]
	b _0811E08E
_0811E088:
	movs r0, 0x78
	strh r0, [r5, 0x20]
	ldrh r0, [r3, 0x6]
_0811E08E:
	strh r0, [r5, 0x22]
	ldrh r0, [r5, 0x20]
	adds r0, 0x4
	strh r0, [r5, 0x20]
	ldrh r0, [r5, 0x22]
	adds r0, 0x4
	strh r0, [r5, 0x22]
	bl sub_811D110
	lsls r0, 16
	lsrs r6, r0, 16
	bl sub_811D120
	adds r7, r0, 0
	bl sub_811D100
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bne _0811E0CC
	adds r0, r6, 0
	adds r1, r7, 0
	movs r2, 0
	bl sub_812EA78
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r6, 0
	adds r1, r7, 0
	movs r2, 0x1
	b _0811E0E0
_0811E0CC:
	adds r0, r6, 0
	adds r1, r7, 0
	movs r2, 0x3
	bl sub_812EA78
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r6, 0
	adds r1, r7, 0
	movs r2, 0x4
_0811E0E0:
	bl sub_812EA78
	lsls r0, 24
	lsrs r0, 24
	cmp r4, 0xFF
	bne _0811E0EE
	movs r4, 0
_0811E0EE:
	cmp r0, 0xFF
	bne _0811E0F4
	movs r0, 0
_0811E0F4:
	strh r4, [r5, 0x3A]
	strh r0, [r5, 0x3C]
	adds r0, r5, 0
	mov r1, r8
	bl sub_811DB48
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_811E06C

	thumb_func_start sub_811E10C
sub_811E10C: @ 811E10C
	push {r4,lr}
	bl sub_811D0A8
	adds r4, r0, 0
	ldr r0, [r4, 0xC]
	bl sub_811E128
	ldr r0, [r4, 0x10]
	bl sub_811E128
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_811E10C

	thumb_func_start sub_811E128
sub_811E128: @ 811E128
	movs r1, 0
	strh r1, [r0, 0x2E]
	strh r1, [r0, 0x30]
	ldr r1, _0811E134 @ =sub_811E154
	str r1, [r0, 0x1C]
	bx lr
	.align 2, 0
_0811E134: .4byte sub_811E154
	thumb_func_end sub_811E128

	thumb_func_start sub_811E138
sub_811E138: @ 811E138
	push {lr}
	bl sub_811D0A8
	ldr r0, [r0, 0xC]
	ldr r1, [r0, 0x1C]
	ldr r0, _0811E150 @ =SpriteCallbackDummy
	eors r1, r0
	negs r0, r1
	orrs r0, r1
	lsrs r0, 31
	pop {r1}
	bx r1
	.align 2, 0
_0811E150: .4byte SpriteCallbackDummy
	thumb_func_end sub_811E138

	thumb_func_start sub_811E154
sub_811E154: @ 811E154
	push {lr}
	adds r1, r0, 0
	movs r2, 0x2E
	ldrsh r0, [r1, r2]
	cmp r0, 0
	beq _0811E166
	cmp r0, 0x1
	beq _0811E174
	b _0811E18C
_0811E166:
	ldrh r0, [r1, 0x20]
	adds r0, 0x3
	strh r0, [r1, 0x20]
	ldrh r0, [r1, 0x2E]
	adds r0, 0x1
	strh r0, [r1, 0x2E]
	b _0811E18C
_0811E174:
	ldrh r0, [r1, 0x30]
	adds r0, 0x1
	strh r0, [r1, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1E
	ble _0811E18C
	ldrh r0, [r1, 0x20]
	subs r0, 0x3
	strh r0, [r1, 0x20]
	ldr r0, _0811E190 @ =SpriteCallbackDummy
	str r0, [r1, 0x1C]
_0811E18C:
	pop {r0}
	bx r0
	.align 2, 0
_0811E190: .4byte SpriteCallbackDummy
	thumb_func_end sub_811E154

	thumb_func_start sub_811E194
sub_811E194: @ 811E194
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	bl sub_811D0A8
	adds r5, r0, 0
	ldrb r0, [r5, 0xA]
	cmp r6, r0
	beq _0811E1F8
	ldr r0, _0811E1EC @ =sub_811D9BC
	movs r1, 0x1
	bl CreateTask
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r2, [r5, 0xC]
	adds r0, r4, 0
	movs r1, 0x6
	bl SetWordTaskArg
	ldr r2, [r5, 0x10]
	adds r0, r4, 0
	movs r1, 0x9
	bl SetWordTaskArg
	ldr r1, _0811E1F0 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r1, r0, r1
	ldrb r0, [r5, 0xA]
	strh r0, [r1, 0xA]
	strh r6, [r1, 0xC]
	movs r2, 0x1
	strh r2, [r1, 0x18]
	movs r0, 0x6
	strh r0, [r1, 0x12]
	ldrb r5, [r5, 0xA]
	cmp r6, r5
	bls _0811E1F4
	strh r2, [r1, 0xE]
	b _0811E1F8
	.align 2, 0
_0811E1EC: .4byte sub_811D9BC
_0811E1F0: .4byte gTasks
_0811E1F4:
	ldr r0, _0811E200 @ =0x0000ffff
	strh r0, [r1, 0xE]
_0811E1F8:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0811E200: .4byte 0x0000ffff
	thumb_func_end sub_811E194

	thumb_func_start sub_811E204
sub_811E204: @ 811E204
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	mov r10, r0
	ldr r0, _0811E2E0 @ =gUnknown_84599B8
	bl LoadCompressedSpriteSheet
	ldr r0, _0811E2E4 @ =gUnknown_84599C0
	bl LoadSpritePalette
	movs r0, 0
	mov r1, r10
	strh r0, [r1, 0x2]
	ldr r0, _0811E2E8 @ =gUnknown_84599B2
	str r0, [sp, 0x4]
	movs r1, 0x2
	str r1, [sp]
_0811E22C:
	ldr r0, [sp, 0x4]
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	mov r9, r0
	mov r1, r9
	adds r1, 0x78
	ldr r0, [sp, 0x4]
	ldrb r0, [r0, 0x1]
	lsls r0, 24
	asrs r0, 24
	mov r8, r0
	mov r0, r10
	ldrh r2, [r0, 0x8]
	add r2, r8
	lsls r2, 16
	asrs r2, 16
	ldr r0, _0811E2EC @ =gUnknown_8459AEC
	movs r3, 0x2
	bl CreateSprite
	lsls r0, 24
	lsrs r7, r0, 24
	cmp r7, 0x40
	beq _0811E2C0
	bl sub_811D110
	adds r5, r0, 0
	lsls r5, 16
	lsrs r5, 16
	bl sub_811D120
	adds r6, r0, 0
	ldr r0, _0811E2F0 @ =gSprites
	lsls r4, r7, 4
	adds r4, r7
	lsls r4, 2
	adds r4, r0
	mov r1, r9
	lsls r0, r1, 3
	strh r0, [r4, 0x34]
	mov r1, r8
	lsls r0, r1, 3
	strh r0, [r4, 0x36]
	adds r0, r5, 0
	adds r1, r6, 0
	movs r2, 0
	bl sub_812EAE4
	lsls r0, 24
	asrs r0, 24
	movs r1, 0x3
	bl sub_811DAC0
	ldrh r1, [r4, 0x20]
	adds r0, r1
	strh r0, [r4, 0x20]
	adds r0, r5, 0
	adds r1, r6, 0
	movs r2, 0x1
	bl sub_812EAE4
	lsls r0, 24
	asrs r0, 24
	movs r1, 0x3
	bl sub_811DAC0
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x22]
	mov r1, r10
	ldrh r0, [r1, 0x2]
	adds r0, 0x1
	strh r0, [r1, 0x2]
_0811E2C0:
	ldr r0, [sp, 0x4]
	adds r0, 0x2
	str r0, [sp, 0x4]
	ldr r1, [sp]
	subs r1, 0x1
	str r1, [sp]
	cmp r1, 0
	bge _0811E22C
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0811E2E0: .4byte gUnknown_84599B8
_0811E2E4: .4byte gUnknown_84599C0
_0811E2E8: .4byte gUnknown_84599B2
_0811E2EC: .4byte gUnknown_8459AEC
_0811E2F0: .4byte gSprites
	thumb_func_end sub_811E204

	thumb_func_start sub_811E2F4
sub_811E2F4: @ 811E2F4
	push {lr}
	bl sub_811D0A8
	ldrb r0, [r0, 0x2]
	pop {r1}
	bx r1
	thumb_func_end sub_811E2F4

	thumb_func_start sub_811E300
sub_811E300: @ 811E300
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x9
	bgt _0811E330
	ldrh r0, [r4, 0x34]
	ldrh r1, [r4, 0x30]
	adds r0, r1
	strh r0, [r4, 0x30]
	ldrh r1, [r4, 0x36]
	ldrh r2, [r4, 0x32]
	adds r1, r2
	strh r1, [r4, 0x32]
	lsls r0, 16
	asrs r0, 20
	strh r0, [r4, 0x24]
	lsls r1, 16
	asrs r1, 20
	strh r1, [r4, 0x26]
	b _0811E340
_0811E330:
	bl sub_811D0A8
	ldrh r1, [r0, 0x2]
	subs r1, 0x1
	strh r1, [r0, 0x2]
	adds r0, r4, 0
	bl DestroySprite
_0811E340:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_811E300

	thumb_func_start sub_811E348
sub_811E348: @ 811E348
	push {r4,lr}
	bl sub_811E588
	ldr r0, _0811E37C @ =sub_811E3B4
	movs r1, 0x1
	bl CreateTask
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r2, _0811E380 @ =0x78865321
	adds r0, r4, 0
	movs r1, 0x3
	bl SetWordTaskArg
	ldr r1, _0811E384 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	movs r1, 0xE0
	strh r1, [r0, 0x12]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0811E37C: .4byte sub_811E3B4
_0811E380: .4byte 0x78865321
_0811E384: .4byte gTasks
	thumb_func_end sub_811E348

	thumb_func_start sub_811E388
sub_811E388: @ 811E388
	push {lr}
	ldr r0, _0811E3AC @ =sub_811E3B4
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0xFF
	beq _0811E3A6
	ldr r0, _0811E3B0 @ =gTasks
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 3
	adds r1, r0
	movs r0, 0x1
	strh r0, [r1, 0x8]
_0811E3A6:
	pop {r0}
	bx r0
	.align 2, 0
_0811E3AC: .4byte sub_811E3B4
_0811E3B0: .4byte gTasks
	thumb_func_end sub_811E388

	thumb_func_start sub_811E3B4
sub_811E3B4: @ 811E3B4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	ldr r1, _0811E3DC @ =gTasks+0x8
	adds r5, r0, r1
	movs r1, 0
	ldrsh r0, [r5, r1]
	cmp r0, 0
	beq _0811E3E0
	cmp r0, 0x1
	beq _0811E4CE
	b _0811E4DC
	.align 2, 0
_0811E3DC: .4byte gTasks+0x8
_0811E3E0:
	ldrh r0, [r5, 0x2]
	movs r3, 0x2
	ldrsh r2, [r5, r3]
	mov r9, r2
	cmp r2, 0
	bne _0811E4C8
	bl sub_811D0A8
	ldr r0, [r0, 0x10]
	movs r4, 0x20
	ldrsh r2, [r0, r4]
	movs r3, 0x24
	ldrsh r1, [r0, r3]
	adds r2, r1
	str r2, [sp]
	movs r4, 0x22
	ldrsh r1, [r0, r4]
	movs r2, 0x26
	ldrsh r0, [r0, r2]
	adds r1, r0
	mov r10, r1
	adds r0, r6, 0
	bl sub_811E4EC
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x15
	bl __umodsi3
	lsls r0, 16
	lsrs r0, 16
	adds r0, 0x46
	ldr r3, _0811E4BC @ =gSineTable
	movs r4, 0xA
	ldrsh r2, [r5, r4]
	adds r1, r2, 0
	adds r1, 0x40
	lsls r1, 1
	adds r1, r3
	movs r4, 0
	ldrsh r1, [r1, r4]
	muls r1, r0
	lsrs r1, 8
	ldr r4, [sp]
	adds r4, r1
	mov r8, r4
	lsls r2, 1
	adds r2, r3
	movs r3, 0
	ldrsh r1, [r2, r3]
	muls r0, r1
	lsrs r0, 8
	mov r4, r10
	adds r7, r4, r0
	ldrh r0, [r5, 0xA]
	adds r0, 0x4C
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r5, 0xA]
	ldr r0, _0811E4C0 @ =gUnknown_8459B30
	mov r2, r8
	lsls r1, r2, 16
	asrs r1, 16
	lsls r2, r7, 16
	asrs r2, 16
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x40
	beq _0811E4A4
	ldr r0, _0811E4C4 @ =gSprites
	lsls r4, r1, 4
	adds r4, r1
	lsls r4, 2
	adds r4, r0
	mov r3, r9
	strh r3, [r4, 0x2E]
	adds r0, r6, 0
	bl sub_811E4EC
	movs r1, 0x1
	ands r1, r0
	adds r1, 0x6
	strh r1, [r4, 0x30]
	mov r0, r8
	strh r0, [r4, 0x32]
	strh r7, [r4, 0x34]
	mov r1, sp
	ldrh r1, [r1]
	strh r1, [r4, 0x36]
	mov r2, r10
	strh r2, [r4, 0x38]
	strh r6, [r4, 0x3A]
	ldrh r0, [r5, 0x4]
	adds r0, 0x1
	strh r0, [r5, 0x4]
_0811E4A4:
	ldrh r0, [r5, 0xC]
	adds r0, 0x1
	strh r0, [r5, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x2F
	ble _0811E4DC
	ldrh r0, [r5]
	adds r0, 0x1
	strh r0, [r5]
	b _0811E4DC
	.align 2, 0
_0811E4BC: .4byte gSineTable
_0811E4C0: .4byte gUnknown_8459B30
_0811E4C4: .4byte gSprites
_0811E4C8:
	subs r0, 0x1
	strh r0, [r5, 0x2]
	b _0811E4DC
_0811E4CE:
	movs r3, 0x4
	ldrsh r0, [r5, r3]
	cmp r0, 0
	bne _0811E4DC
	adds r0, r6, 0
	bl DestroyTask
_0811E4DC:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_811E3B4

	thumb_func_start sub_811E4EC
sub_811E4EC: @ 811E4EC
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	movs r1, 0x3
	bl GetWordTaskArg
	adds r5, r0, 0
	ldr r0, _0811E518 @ =0x41c64e6d
	muls r0, r5
	ldr r1, _0811E51C @ =0x00006073
	adds r5, r0, r1
	adds r0, r4, 0
	movs r1, 0x3
	adds r2, r5, 0
	bl SetWordTaskArg
	lsrs r0, r5, 16
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0811E518: .4byte 0x41c64e6d
_0811E51C: .4byte 0x00006073
	thumb_func_end sub_811E4EC

	thumb_func_start sub_811E520
sub_811E520: @ 811E520
	push {r4,r5,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x30]
	ldrh r1, [r4, 0x2E]
	adds r0, r1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xFF
	ble _0811E554
	ldr r2, _0811E550 @ =gTasks
	movs r5, 0x3A
	ldrsh r1, [r4, r5]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldrh r1, [r0, 0xC]
	subs r1, 0x1
	strh r1, [r0, 0xC]
	adds r0, r4, 0
	bl DestroySprite
	b _0811E582
	.align 2, 0
_0811E550: .4byte gTasks
_0811E554:
	movs r1, 0x36
	ldrsh r0, [r4, r1]
	movs r2, 0x32
	ldrsh r1, [r4, r2]
	subs r0, r1
	movs r5, 0x2E
	ldrsh r3, [r4, r5]
	adds r2, r0, 0
	muls r2, r3
	movs r1, 0x38
	ldrsh r0, [r4, r1]
	movs r5, 0x34
	ldrsh r1, [r4, r5]
	subs r0, r1
	muls r0, r3
	asrs r2, 8
	ldrh r1, [r4, 0x32]
	adds r2, r1
	strh r2, [r4, 0x20]
	asrs r0, 8
	ldrh r2, [r4, 0x34]
	adds r0, r2
	strh r0, [r4, 0x22]
_0811E582:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_811E520

	thumb_func_start sub_811E588
sub_811E588: @ 811E588
	push {lr}
	ldr r0, _0811E59C @ =gUnknown_84599C8
	bl LoadCompressedSpriteSheet
	ldr r0, _0811E5A0 @ =gUnknown_84599D0
	bl LoadSpritePalette
	pop {r0}
	bx r0
	.align 2, 0
_0811E59C: .4byte gUnknown_84599C8
_0811E5A0: .4byte gUnknown_84599D0
	thumb_func_end sub_811E588

	thumb_func_start sub_811E5A4
sub_811E5A4: @ 811E5A4
	push {lr}
	ldr r0, _0811E5B4 @ =sub_811E3B4
	bl FuncIsActiveTask
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_0811E5B4: .4byte sub_811E3B4
	thumb_func_end sub_811E5A4

	thumb_func_start sub_811E5B8
sub_811E5B8: @ 811E5B8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	adds r5, r0, 0
	adds r6, r1, 0
	mov r8, r2
	mov r9, r3
	ldr r0, [sp, 0x20]
	mov r10, r0
	ldr r0, [sp, 0x24]
	lsls r5, 16
	lsrs r5, 16
	lsls r6, 16
	lsrs r6, 16
	mov r1, r8
	lsls r1, 16
	lsrs r1, 16
	mov r8, r1
	mov r1, r9
	lsls r1, 16
	lsrs r1, 16
	mov r9, r1
	mov r1, r10
	lsls r1, 16
	lsrs r1, 16
	mov r10, r1
	lsls r0, 16
	lsrs r7, r0, 16
	ldr r0, _0811E664 @ =gUnknown_3002030
	mov r1, r8
	strh r1, [r0, 0x6]
	ldr r1, _0811E668 @ =gUnknown_8459888
	str r1, [r0]
	ldr r1, [r1]
	lsrs r1, 8
	strh r1, [r0, 0x4]
	ldr r4, _0811E66C @ =gUnknown_3002038
	ldr r1, _0811E670 @ =gUnknown_8459868
	str r1, [r4]
	mov r1, r9
	strh r1, [r4, 0x4]
	bl LoadCompressedSpriteSheet
	adds r0, r4, 0
	bl LoadSpritePalette
	ldr r0, _0811E674 @ =sub_811E694
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0811E678 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	subs r5, 0x20
	strh r5, [r1, 0x10]
	adds r6, 0x20
	strh r6, [r1, 0x12]
	mov r0, r8
	strh r0, [r1, 0x14]
	mov r0, r9
	strh r0, [r1, 0x16]
	mov r0, r10
	strh r0, [r1, 0x18]
	strh r7, [r1, 0x1A]
	movs r1, 0xFC
	lsls r1, 6
	movs r0, 0x50
	bl SetGpuReg
	ldr r1, _0811E67C @ =0x0000060c
	movs r0, 0x52
	bl SetGpuReg
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0811E664: .4byte gUnknown_3002030
_0811E668: .4byte gUnknown_8459888
_0811E66C: .4byte gUnknown_3002038
_0811E670: .4byte gUnknown_8459868
_0811E674: .4byte sub_811E694
_0811E678: .4byte gTasks
_0811E67C: .4byte 0x0000060c
	thumb_func_end sub_811E5B8

	thumb_func_start sub_811E680
sub_811E680: @ 811E680
	push {lr}
	ldr r0, _0811E690 @ =sub_811E694
	bl FuncIsActiveTask
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_0811E690: .4byte sub_811E694
	thumb_func_end sub_811E680

	thumb_func_start sub_811E694
sub_811E694: @ 811E694
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _0811E6B4 @ =gTasks+0x8
	adds r4, r0, r1
	movs r0, 0
	ldrsh r1, [r4, r0]
	cmp r1, 0
	beq _0811E6B8
	cmp r1, 0x1
	beq _0811E6EE
	b _0811E708
	.align 2, 0
_0811E6B4: .4byte gTasks+0x8
_0811E6B8:
	ldrh r2, [r4, 0x6]
	movs r3, 0x6
	ldrsh r0, [r4, r3]
	cmp r0, 0
	bne _0811E6DE
	adds r0, r2, 0x1
	strh r0, [r4, 0x6]
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_811E710
	movs r1, 0x4
	ldrsh r0, [r4, r1]
	cmp r0, 0x11
	ble _0811E708
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	b _0811E708
_0811E6DE:
	adds r0, r2, 0x1
	strh r0, [r4, 0x6]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x2
	bne _0811E708
	strh r1, [r4, 0x6]
	b _0811E708
_0811E6EE:
	movs r3, 0x2
	ldrsh r0, [r4, r3]
	cmp r0, 0
	bne _0811E708
	ldrh r0, [r4, 0xC]
	bl FreeSpriteTilesByTag
	ldrh r0, [r4, 0xE]
	bl FreeSpritePaletteByTag
	adds r0, r5, 0
	bl DestroyTask
_0811E708:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_811E694

	thumb_func_start sub_811E710
sub_811E710: @ 811E710
	push {r4-r6,lr}
	sub sp, 0x18
	adds r4, r1, 0
	lsls r0, 24
	lsrs r6, r0, 24
	mov r1, sp
	ldr r0, _0811E7A4 @ =gUnknown_8459ACC
	ldm r0!, {r2,r3,r5}
	stm r1!, {r2,r3,r5}
	ldm r0!, {r2,r3,r5}
	stm r1!, {r2,r3,r5}
	mov r1, sp
	ldrh r0, [r4, 0xC]
	strh r0, [r1]
	ldrh r0, [r4, 0xE]
	strh r0, [r1, 0x2]
	ldrh r0, [r4, 0x4]
	adds r0, 0x1
	strh r0, [r4, 0x4]
	movs r0, 0x4
	ldrsh r1, [r4, r0]
	movs r0, 0xDB
	muls r1, r0
	movs r5, 0x3F
	ands r1, r5
	ldrh r2, [r4, 0x8]
	adds r1, r2
	lsls r1, 16
	asrs r1, 16
	movs r3, 0xA
	ldrsh r2, [r4, r3]
	ldrb r3, [r4, 0x12]
	mov r0, sp
	bl CreateSprite
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x40
	beq _0811E79A
	ldr r0, _0811E7A8 @ =gSprites
	lsls r2, r1, 4
	adds r2, r1
	lsls r2, 2
	adds r2, r0
	movs r0, 0x3
	ldrb r1, [r4, 0x10]
	ands r1, r0
	lsls r1, 2
	ldrb r3, [r2, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, 0x5]
	movs r0, 0
	strh r0, [r2, 0x30]
	movs r0, 0x4
	ldrsh r1, [r4, r0]
	ldr r0, _0811E7AC @ =0x41c64e6d
	muls r0, r1
	ldr r1, _0811E7B0 @ =0x00006073
	adds r0, r1
	ands r0, r5
	adds r0, 0x20
	strh r0, [r2, 0x32]
	strh r6, [r2, 0x3C]
	ldrh r0, [r4, 0x2]
	adds r0, 0x1
	strh r0, [r4, 0x2]
_0811E79A:
	add sp, 0x18
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0811E7A4: .4byte gUnknown_8459ACC
_0811E7A8: .4byte gSprites
_0811E7AC: .4byte 0x41c64e6d
_0811E7B0: .4byte 0x00006073
	thumb_func_end sub_811E710

	thumb_func_start sub_811E7B4
sub_811E7B4: @ 811E7B4
	push {lr}
	adds r3, r0, 0
	ldrh r0, [r3, 0x30]
	ldrh r1, [r3, 0x32]
	subs r0, r1
	strh r0, [r3, 0x30]
	lsls r0, 16
	asrs r0, 20
	strh r0, [r3, 0x26]
	movs r1, 0x40
	negs r1, r1
	cmp r0, r1
	bge _0811E7E8
	ldr r2, _0811E7EC @ =gTasks
	movs r0, 0x3C
	ldrsh r1, [r3, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldrh r1, [r0, 0xA]
	subs r1, 0x1
	strh r1, [r0, 0xA]
	adds r0, r3, 0
	bl DestroySprite
_0811E7E8:
	pop {r0}
	bx r0
	.align 2, 0
_0811E7EC: .4byte gTasks
	thumb_func_end sub_811E7B4

	thumb_func_start DrawLevelUpWindowPg1
DrawLevelUpWindowPg1: @ 811E7F0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x30
	mov r8, r0
	adds r6, r1, 0
	adds r5, r2, 0
	adds r4, r3, 0
	ldr r3, [sp, 0x50]
	ldr r0, [sp, 0x54]
	mov r9, r0
	lsls r4, 24
	lsrs r4, 24
	lsls r3, 24
	lsrs r3, 24
	mov r1, r9
	lsls r1, 24
	lsrs r1, 24
	mov r9, r1
	mov r0, r8
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r1, r4, 4
	orrs r1, r4
	lsls r1, 24
	lsrs r1, 24
	str r3, [sp, 0x2C]
	bl FillWindowPixelBuffer
	add r2, sp, 0xC
	ldrh r0, [r5]
	ldrh r1, [r6]
	subs r0, r1
	strh r0, [r2]
	ldrh r0, [r5, 0x2]
	ldrh r1, [r6, 0x2]
	subs r0, r1
	strh r0, [r2, 0x2]
	ldrh r0, [r5, 0x4]
	ldrh r1, [r6, 0x4]
	subs r0, r1
	strh r0, [r2, 0x4]
	ldrh r0, [r5, 0x8]
	ldrh r1, [r6, 0x8]
	subs r0, r1
	strh r0, [r2, 0x6]
	ldrh r0, [r5, 0xA]
	ldrh r1, [r6, 0xA]
	subs r0, r1
	strh r0, [r2, 0x8]
	ldrh r0, [r5, 0x6]
	ldrh r1, [r6, 0x6]
	subs r0, r1
	strh r0, [r2, 0xA]
	add r0, sp, 0x24
	strb r4, [r0]
	ldr r3, [sp, 0x2C]
	strb r3, [r0, 0x1]
	mov r1, r9
	strb r1, [r0, 0x2]
	movs r7, 0
	mov r1, sp
	adds r1, 0x19
	str r1, [sp, 0x28]
	mov r10, r0
	movs r0, 0x1
	negs r0, r0
	mov r9, r0
	add r6, sp, 0x18
_0811E880:
	lsls r0, r7, 4
	subs r0, r7
	lsls r0, 24
	lsrs r5, r0, 24
	mov r1, r10
	str r1, [sp]
	mov r0, r9
	str r0, [sp, 0x4]
	ldr r1, _0811E930 @ =gUnknown_8459B48
	lsls r0, r7, 2
	adds r0, r1
	ldr r0, [r0]
	str r0, [sp, 0x8]
	mov r0, r8
	movs r1, 0x2
	movs r2, 0
	adds r3, r5, 0
	bl AddTextPrinterParameterized3
	lsls r0, r7, 1
	mov r4, sp
	adds r4, r0
	adds r4, 0xC
	movs r1, 0
	ldrsh r0, [r4, r1]
	ldr r1, _0811E934 @ =gUnknown_841B2E5
	cmp r0, 0
	blt _0811E8BA
	ldr r1, _0811E938 @ =gUnknown_841B2DC
_0811E8BA:
	adds r0, r6, 0
	bl StringCopy
	mov r0, r10
	str r0, [sp]
	mov r1, r9
	str r1, [sp, 0x4]
	str r6, [sp, 0x8]
	mov r0, r8
	movs r1, 0x2
	movs r2, 0x38
	adds r3, r5, 0
	bl AddTextPrinterParameterized3
	movs r0, 0
	strb r0, [r6]
	movs r0, 0
	ldrsh r1, [r4, r0]
	adds r0, r1, 0
	cmp r1, 0
	bge _0811E8E6
	negs r0, r1
_0811E8E6:
	movs r4, 0x6
	cmp r0, 0x9
	bgt _0811E8EE
	movs r4, 0xC
_0811E8EE:
	cmp r1, 0
	bge _0811E8F4
	negs r1, r1
_0811E8F4:
	ldr r0, [sp, 0x28]
	movs r2, 0
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	adds r2, r4, 0
	adds r2, 0x38
	mov r1, r10
	str r1, [sp]
	mov r0, r9
	str r0, [sp, 0x4]
	str r6, [sp, 0x8]
	mov r0, r8
	movs r1, 0x2
	adds r3, r5, 0
	bl AddTextPrinterParameterized3
	adds r0, r7, 0x1
	lsls r0, 16
	lsrs r7, r0, 16
	cmp r7, 0x5
	bls _0811E880
	add sp, 0x30
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0811E930: .4byte gUnknown_8459B48
_0811E934: .4byte gUnknown_841B2E5
_0811E938: .4byte gUnknown_841B2DC
	thumb_func_end DrawLevelUpWindowPg1

	thumb_func_start DrawLevelUpWindowPg2
DrawLevelUpWindowPg2: @ 811E93C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x2C
	mov r8, r0
	adds r5, r1, 0
	adds r4, r2, 0
	adds r6, r3, 0
	ldr r2, [sp, 0x4C]
	lsls r4, 24
	lsrs r4, 24
	lsls r6, 24
	lsrs r6, 24
	lsls r2, 24
	lsrs r2, 24
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r1, r4, 4
	orrs r1, r4
	lsls r1, 24
	lsrs r1, 24
	str r2, [sp, 0x28]
	bl FillWindowPixelBuffer
	add r1, sp, 0xC
	ldrh r0, [r5]
	strh r0, [r1]
	ldrh r0, [r5, 0x2]
	strh r0, [r1, 0x2]
	ldrh r0, [r5, 0x4]
	strh r0, [r1, 0x4]
	ldrh r0, [r5, 0x8]
	strh r0, [r1, 0x6]
	ldrh r0, [r5, 0xA]
	strh r0, [r1, 0x8]
	ldrh r0, [r5, 0x6]
	strh r0, [r1, 0xA]
	add r0, sp, 0x24
	strb r4, [r0]
	strb r6, [r0, 0x1]
	ldr r2, [sp, 0x28]
	strb r2, [r0, 0x2]
	movs r6, 0
	add r1, sp, 0x18
	mov r9, r1
	mov r7, r8
	mov r10, r0
	movs r2, 0x1
	negs r2, r2
	mov r8, r2
_0811E9A6:
	lsls r1, r6, 1
	mov r0, sp
	adds r0, r1
	adds r0, 0xC
	movs r2, 0
	ldrsh r0, [r0, r2]
	movs r4, 0x3
	cmp r0, 0x63
	bgt _0811E9C0
	movs r4, 0x1
	cmp r0, 0x9
	ble _0811E9C0
	movs r4, 0x2
_0811E9C0:
	mov r0, sp
	adds r0, r1
	adds r0, 0xC
	movs r2, 0
	ldrsh r1, [r0, r2]
	mov r0, r9
	movs r2, 0
	adds r3, r4, 0
	bl ConvertIntToDecimalStringN
	movs r0, 0x4
	subs r0, r4
	lsls r4, r0, 1
	adds r4, r0
	lsls r4, 17
	lsrs r4, 16
	lsls r5, r6, 4
	subs r5, r6
	lsls r5, 24
	lsrs r5, 24
	mov r0, r10
	str r0, [sp]
	mov r1, r8
	str r1, [sp, 0x4]
	ldr r1, _0811EA40 @ =gUnknown_8459B48
	lsls r0, r6, 2
	adds r0, r1
	ldr r0, [r0]
	str r0, [sp, 0x8]
	adds r0, r7, 0
	movs r1, 0x2
	movs r2, 0
	adds r3, r5, 0
	bl AddTextPrinterParameterized3
	adds r4, 0x38
	lsls r4, 24
	lsrs r4, 24
	mov r2, r10
	str r2, [sp]
	mov r0, r8
	str r0, [sp, 0x4]
	mov r1, r9
	str r1, [sp, 0x8]
	adds r0, r7, 0
	movs r1, 0x2
	adds r2, r4, 0
	adds r3, r5, 0
	bl AddTextPrinterParameterized3
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r6, 0x5
	bls _0811E9A6
	add sp, 0x2C
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0811EA40: .4byte gUnknown_8459B48
	thumb_func_end DrawLevelUpWindowPg2

	.align 2, 0 @ Don't pad with nop.
