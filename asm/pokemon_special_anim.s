	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_811C540
sub_811C540: @ 811C540
	push {r4,lr}
	adds r4, r2, 0
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 16
	lsrs r1, 16
	bl sub_811C5D4
	cmp r0, 0
	bne _0811C55C
	adds r0, r4, 0
	bl SetMainCallback2
	b _0811C560
_0811C55C:
	bl sub_811C748
_0811C560:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_811C540

	thumb_func_start sub_811C568
sub_811C568: @ 811C568
	push {r4-r6,lr}
	adds r5, r3, 0
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 16
	lsrs r1, 16
	lsls r2, 16
	lsrs r6, r2, 16
	adds r2, r5, 0
	bl sub_811C5D4
	adds r4, r0, 0
	cmp r4, 0
	bne _0811C58C
	adds r0, r5, 0
	bl SetMainCallback2
	b _0811C5A2
_0811C58C:
	adds r0, r4, 0
	adds r0, 0x77
	movs r1, 0xD
	muls r1, r6
	ldr r2, _0811C5A8 @ =gMoveNames
	adds r1, r2
	bl StringCopy
	adds r0, r4, 0
	bl sub_811C7BC
_0811C5A2:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0811C5A8: .4byte gMoveNames
	thumb_func_end sub_811C568

	thumb_func_start sub_811C5AC
sub_811C5AC: @ 811C5AC
	push {r4,lr}
	adds r4, r2, 0
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 16
	lsrs r1, 16
	bl sub_811C5D4
	cmp r0, 0
	bne _0811C5C8
	adds r0, r4, 0
	bl SetMainCallback2
	b _0811C5CC
_0811C5C8:
	bl sub_811C7FC
_0811C5CC:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_811C5AC

	thumb_func_start sub_811C5D4
sub_811C5D4: @ 811C5D4
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	adds r5, r2, 0
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r1, 16
	lsrs r6, r1, 16
	ldr r0, _0811C61C @ =gMain
	ldr r1, _0811C620 @ =0x00000439
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	bne _0811C5FC
	bl ResetTasks
_0811C5FC:
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	ldr r0, _0811C624 @ =0x000028dc
	bl Alloc
	adds r7, r0, 0
	cmp r7, 0
	bne _0811C628
	adds r0, r5, 0
	bl SetMainCallback2
	movs r0, 0
	b _0811C6D2
	.align 2, 0
_0811C61C: .4byte gMain
_0811C620: .4byte 0x00000439
_0811C624: .4byte 0x000028dc
_0811C628:
	movs r0, 0x64
	mov r4, r8
	muls r4, r0
	ldr r0, _0811C6E0 @ =gPlayerParty
	adds r4, r0
	adds r0, r7, 0
	adds r0, 0x92
	movs r1, 0
	mov r9, r1
	mov r1, r9
	strh r1, [r0]
	str r5, [r7, 0x4]
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	adds r1, r7, 0
	adds r1, 0x94
	strh r0, [r1]
	adds r0, r4, 0
	movs r1, 0x20
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	bl sub_811D058
	lsls r0, 24
	lsrs r0, 24
	adds r1, r7, 0
	adds r1, 0x9C
	strh r0, [r1]
	adds r0, r4, 0
	movs r1, 0
	bl GetMonData
	adds r1, r7, 0
	adds r1, 0xA0
	str r0, [r1]
	adds r0, r7, 0
	adds r0, 0x9A
	mov r1, r8
	strh r1, [r0]
	subs r0, 0x4
	strh r6, [r0]
	adds r0, r6, 0
	bl sub_811D018
	adds r5, r7, 0
	adds r5, 0x98
	strh r0, [r5]
	adds r0, r7, 0
	adds r0, 0x8
	adds r1, r4, 0
	movs r2, 0x64
	bl memcpy
	adds r0, r7, 0
	adds r0, 0xA4
	mov r1, r9
	str r1, [r0]
	adds r2, r7, 0
	adds r2, 0x6C
	adds r0, r4, 0
	movs r1, 0x2
	bl GetMonData
	ldrh r0, [r5]
	cmp r0, 0x4
	bne _0811C6D0
	adds r0, r6, 0
	bl ItemIdToBattleMoveId
	lsls r0, 16
	lsrs r0, 16
	adds r2, r7, 0
	adds r2, 0x84
	movs r1, 0xD
	muls r1, r0
	ldr r0, _0811C6E4 @ =gMoveNames
	adds r1, r0
	adds r0, r2, 0
	bl StringCopy
_0811C6D0:
	adds r0, r7, 0
_0811C6D2:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0811C6E0: .4byte gPlayerParty
_0811C6E4: .4byte gMoveNames
	thumb_func_end sub_811C5D4

	thumb_func_start sub_811C6E8
sub_811C6E8: @ 811C6E8
	push {lr}
	bl TransferPlttBuffer
	bl LoadOam
	bl ProcessSpriteCopyRequests
	pop {r0}
	bx r0
	thumb_func_end sub_811C6E8

	thumb_func_start sub_811C6FC
sub_811C6FC: @ 811C6FC
	push {lr}
	bl RunTextPrinters
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	thumb_func_end sub_811C6FC

	thumb_func_start sub_811C718
sub_811C718: @ 811C718
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	movs r1, 0
	bl GetWordTaskArg
	adds r0, 0x92
	movs r1, 0
	strh r1, [r0]
	ldr r1, _0811C744 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	str r5, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0811C744: .4byte gTasks
	thumb_func_end sub_811C718

	thumb_func_start sub_811C748
sub_811C748: @ 811C748
	push {r4,r5,lr}
	adds r5, r0, 0
	adds r0, 0x98
	ldrh r0, [r0]
	cmp r0, 0x3
	beq _0811C766
	cmp r0, 0x3
	ble _0811C75E
	cmp r0, 0x4
	beq _0811C770
	b _0811C784
_0811C75E:
	cmp r0, 0x1
	bgt _0811C784
	cmp r0, 0
	blt _0811C784
_0811C766:
	ldr r0, _0811C76C @ =sub_811C834
	b _0811C772
	.align 2, 0
_0811C76C: .4byte sub_811C834
_0811C770:
	ldr r0, _0811C780 @ =sub_811CD68
_0811C772:
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r4, r0, 24
	b _0811C792
	.align 2, 0
_0811C780: .4byte sub_811CD68
_0811C784:
	ldr r0, [r5, 0x4]
	bl SetMainCallback2
	adds r0, r5, 0
	bl Free
	b _0811C7AE
_0811C792:
	adds r1, r5, 0
	adds r1, 0x91
	movs r0, 0
	strb r0, [r1]
	adds r0, r4, 0
	movs r1, 0
	adds r2, r5, 0
	bl SetWordTaskArg
	ldr r0, _0811C7B4 @ =sub_811C6FC
	bl SetMainCallback2
	ldr r0, _0811C7B8 @ =gUnknown_203B094
	strb r4, [r0]
_0811C7AE:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0811C7B4: .4byte sub_811C6FC
_0811C7B8: .4byte gUnknown_203B094
	thumb_func_end sub_811C748

	thumb_func_start sub_811C7BC
sub_811C7BC: @ 811C7BC
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r0, _0811C7F0 @ =sub_811CA20
	movs r1, 0
	bl CreateTask
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	movs r1, 0
	adds r2, r5, 0
	bl SetWordTaskArg
	ldr r0, _0811C7F4 @ =sub_811C6FC
	bl SetMainCallback2
	ldr r0, _0811C7F8 @ =gUnknown_203B094
	strb r4, [r0]
	adds r5, 0x91
	movs r0, 0
	strb r0, [r5]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0811C7F0: .4byte sub_811CA20
_0811C7F4: .4byte sub_811C6FC
_0811C7F8: .4byte gUnknown_203B094
	thumb_func_end sub_811C7BC

	thumb_func_start sub_811C7FC
sub_811C7FC: @ 811C7FC
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r0, _0811C828 @ =sub_811CBE4
	movs r1, 0
	bl CreateTask
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	movs r1, 0
	adds r2, r5, 0
	bl SetWordTaskArg
	ldr r0, _0811C82C @ =sub_811C6FC
	bl SetMainCallback2
	ldr r0, _0811C830 @ =gUnknown_203B094
	strb r4, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0811C828: .4byte sub_811CBE4
_0811C82C: .4byte sub_811C6FC
_0811C830: .4byte gUnknown_203B094
	thumb_func_end sub_811C7FC

	thumb_func_start sub_811C834
sub_811C834: @ 811C834
	push {r4-r6,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r6, r0, 24
	adds r0, r6, 0
	movs r1, 0
	bl GetWordTaskArg
	adds r4, r0, 0
	adds r0, 0x91
	ldrb r0, [r0]
	cmp r0, 0
	bne _0811C870
	ldr r0, _0811C868 @ =gMain
	ldrh r1, [r0, 0x2C]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0
	beq _0811C870
	bl sub_811E040
	ldr r1, _0811C86C @ =sub_811CF88
	adds r0, r6, 0
	bl sub_811C718
	b _0811CA16
	.align 2, 0
_0811C868: .4byte gMain
_0811C86C: .4byte sub_811CF88
_0811C870:
	adds r0, r4, 0
	adds r0, 0x92
	ldrh r1, [r0]
	adds r5, r0, 0
	cmp r1, 0xE
	bls _0811C87E
	b _0811CA16
_0811C87E:
	lsls r0, r1, 2
	ldr r1, _0811C888 @ =_0811C88C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0811C888: .4byte _0811C88C
	.align 2, 0
_0811C88C:
	.4byte _0811C8C8
	.4byte _0811C8E4
	.4byte _0811C9E8
	.4byte _0811C914
	.4byte _0811C920
	.4byte _0811C934
	.4byte _0811C93C
	.4byte _0811C950
	.4byte _0811C97E
	.4byte _0811C986
	.4byte _0811C98E
	.4byte _0811C996
	.4byte _0811C9AA
	.4byte _0811C9E8
	.4byte _0811CA00
_0811C8C8:
	movs r0, 0
	bl SetVBlankCallback
	adds r0, r4, 0
	adds r0, 0xA8
	adds r1, r4, 0
	adds r1, 0x98
	ldrh r1, [r1]
	bl sub_811D184
	movs r0, 0
	bl sub_811D830
	b _0811C9F4
_0811C8E4:
	bl sub_811D280
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _0811C8F2
	b _0811CA16
_0811C8F2:
	movs r1, 0x1
	negs r1, r1
	str r0, [sp]
	adds r0, r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldrh r0, [r5]
	adds r0, 0x1
	strh r0, [r5]
	ldr r0, _0811C910 @ =sub_811C6E8
	bl SetVBlankCallback
	b _0811CA16
	.align 2, 0
_0811C910: .4byte sub_811C6E8
_0811C914:
	adds r0, r4, 0
	adds r0, 0x9C
	ldrb r0, [r0]
	bl sub_811D948
	b _0811C9F4
_0811C920:
	bl sub_811D9A8
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	bne _0811CA16
	adds r0, r4, 0
	adds r0, 0x9E
	strh r1, [r0]
	b _0811C9F4
_0811C934:
	bl sub_811D754
	lsls r0, 24
	b _0811C9F0
_0811C93C:
	adds r0, r4, 0
	adds r0, 0x96
	ldrh r0, [r0]
	adds r1, r4, 0
	adds r1, 0x9C
	ldrb r1, [r1]
	movs r2, 0x1
	bl sub_811DC54
	b _0811C9F4
_0811C950:
	bl sub_811DD90
	lsls r0, 24
	cmp r0, 0
	bne _0811CA16
	adds r1, r4, 0
	adds r1, 0x91
	movs r0, 0x1
	strb r0, [r1]
	adds r0, r4, 0
	adds r0, 0x9C
	ldrh r0, [r0]
	cmp r0, 0x3
	bne _0811C978
	adds r0, r4, 0
	adds r0, 0x94
	ldrh r0, [r0]
	movs r1, 0
	bl PlayCry1
_0811C978:
	bl sub_811D2A8
	b _0811C9F4
_0811C97E:
	movs r0, 0
	bl sub_811D2EC
	b _0811C9F4
_0811C986:
	bl sub_811D4EC
	lsls r0, 24
	b _0811C9F0
_0811C98E:
	movs r0, 0
	bl sub_811D948
	b _0811C9F4
_0811C996:
	bl sub_811D9A8
	lsls r0, 24
	cmp r0, 0
	bne _0811CA16
	adds r1, r4, 0
	adds r1, 0x91
	movs r0, 0x1
	strb r0, [r1]
	b _0811C9F4
_0811C9AA:
	ldr r0, _0811C9DC @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0
	beq _0811CA16
	adds r0, r4, 0
	adds r0, 0x96
	ldrh r0, [r0]
	bl CheckIfItemIsTMHMOrEvolutionStone
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	beq _0811C9E0
	movs r1, 0x1
	negs r1, r1
	movs r0, 0
	str r0, [sp]
	adds r0, r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	b _0811C9F4
	.align 2, 0
_0811C9DC: .4byte gMain
_0811C9E0:
	ldrh r0, [r5]
	adds r0, 0x2
	strh r0, [r5]
	b _0811CA16
_0811C9E8:
	ldr r0, _0811C9FC @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
_0811C9F0:
	cmp r0, 0
	bne _0811CA16
_0811C9F4:
	ldrh r0, [r5]
	adds r0, 0x1
	strh r0, [r5]
	b _0811CA16
	.align 2, 0
_0811C9FC: .4byte gPaletteFade
_0811CA00:
	ldr r0, [r4, 0x4]
	bl SetMainCallback2
	bl sub_811D29C
	adds r0, r4, 0
	bl Free
	adds r0, r6, 0
	bl DestroyTask
_0811CA16:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_811C834

	thumb_func_start sub_811CA20
sub_811CA20: @ 811CA20
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	movs r1, 0
	bl GetWordTaskArg
	adds r5, r0, 0
	adds r0, 0x92
	ldrh r0, [r0]
	cmp r0, 0xD
	bls _0811CA3C
	b _0811CBD6
_0811CA3C:
	lsls r0, 2
	ldr r1, _0811CA48 @ =_0811CA4C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0811CA48: .4byte _0811CA4C
	.align 2, 0
_0811CA4C:
	.4byte _0811CA84
	.4byte _0811CAA0
	.4byte _0811CAD4
	.4byte _0811CAF4
	.4byte _0811CB0C
	.4byte _0811CB14
	.4byte _0811CB2A
	.4byte _0811CB44
	.4byte _0811CB5A
	.4byte _0811CB7E
	.4byte _0811CB9A
	.4byte _0811CBA2
	.4byte _0811CBB4
	.4byte _0811CBCE
_0811CA84:
	movs r0, 0
	bl SetVBlankCallback
	adds r0, r5, 0
	adds r0, 0xA8
	adds r1, r5, 0
	adds r1, 0x98
	ldrh r1, [r1]
	bl sub_811D184
	movs r0, 0x3
	bl sub_811D830
	b _0811CBC2
_0811CAA0:
	bl sub_811D280
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _0811CAAE
	b _0811CBD6
_0811CAAE:
	movs r1, 0x1
	negs r1, r1
	str r0, [sp]
	adds r0, r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	adds r1, r5, 0
	adds r1, 0x92
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	ldr r0, _0811CAD0 @ =sub_811C6E8
	bl SetVBlankCallback
	b _0811CBD6
	.align 2, 0
_0811CAD0: .4byte sub_811C6E8
_0811CAD4:
	ldr r0, _0811CAF0 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	bne _0811CBD6
	adds r1, r5, 0
	adds r1, 0x9E
	strh r0, [r1]
	subs r1, 0xC
	b _0811CBC6
	.align 2, 0
_0811CAF0: .4byte gPaletteFade
_0811CAF4:
	adds r1, r5, 0
	adds r1, 0x9E
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1E
	bls _0811CBD6
	bl sub_811D2A8
	b _0811CBC2
_0811CB0C:
	movs r0, 0x2
	bl sub_811D2EC
	b _0811CBC2
_0811CB14:
	bl sub_811D4EC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	bne _0811CBD6
	adds r1, r5, 0
	adds r1, 0x9E
	strh r0, [r1]
	subs r1, 0xC
	b _0811CBC6
_0811CB2A:
	adds r1, r5, 0
	adds r1, 0x9E
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1E
	bls _0811CBD6
	movs r0, 0x3
	bl sub_811D2EC
	b _0811CBC2
_0811CB44:
	bl sub_811D4EC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	bne _0811CBD6
	adds r1, r5, 0
	adds r1, 0x9E
	strh r0, [r1]
	subs r1, 0xC
	b _0811CBC6
_0811CB5A:
	adds r1, r5, 0
	adds r1, 0x9E
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1E
	bls _0811CBD6
	movs r0, 0xE1
	bl PlaySE
	movs r0, 0x4
	bl sub_811D2EC
	bl sub_811D4FC
	b _0811CBC2
_0811CB7E:
	bl sub_811D530
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_811D4EC
	orrs r4, r0
	lsls r4, 24
	cmp r4, 0
	bne _0811CBD6
	bl sub_811D4D4
	b _0811CBC2
_0811CB9A:
	movs r0, 0x5
	bl sub_811D2EC
	b _0811CBC2
_0811CBA2:
	bl sub_811D4EC
	lsls r0, 24
	cmp r0, 0
	bne _0811CBD6
	movs r0, 0x6
	bl sub_811D2EC
	b _0811CBC2
_0811CBB4:
	bl sub_811D4EC
	lsls r0, 24
	cmp r0, 0
	bne _0811CBD6
	bl sub_811D2D0
_0811CBC2:
	adds r1, r5, 0
	adds r1, 0x92
_0811CBC6:
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	b _0811CBD6
_0811CBCE:
	ldr r1, _0811CBE0 @ =sub_811CE4C
	adds r0, r4, 0
	bl sub_811C718
_0811CBD6:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0811CBE0: .4byte sub_811CE4C
	thumb_func_end sub_811CA20

	thumb_func_start sub_811CBE4
sub_811CBE4: @ 811CBE4
	push {r4-r6,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r6, r0, 24
	adds r0, r6, 0
	movs r1, 0
	bl GetWordTaskArg
	adds r5, r0, 0
	adds r0, 0x91
	ldrb r0, [r0]
	cmp r0, 0
	bne _0811CC1C
	ldr r0, _0811CC14 @ =gMain
	ldrh r1, [r0, 0x2C]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0811CC1C
	ldr r1, _0811CC18 @ =sub_811CF88
	adds r0, r6, 0
	bl sub_811C718
	b _0811CD5A
	.align 2, 0
_0811CC14: .4byte gMain
_0811CC18: .4byte sub_811CF88
_0811CC1C:
	adds r0, r5, 0
	adds r0, 0x92
	ldrh r1, [r0]
	adds r4, r0, 0
	cmp r1, 0x9
	bls _0811CC2A
	b _0811CD5A
_0811CC2A:
	lsls r0, r1, 2
	ldr r1, _0811CC34 @ =_0811CC38
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0811CC34: .4byte _0811CC38
	.align 2, 0
_0811CC38:
	.4byte _0811CC60
	.4byte _0811CC7C
	.4byte _0811CCAC
	.4byte _0811CCC0
	.4byte _0811CCCC
	.4byte _0811CCE0
	.4byte _0811CCF0
	.4byte _0811CCF8
	.4byte _0811CD0C
	.4byte _0811CD38
_0811CC60:
	movs r0, 0
	bl SetVBlankCallback
	adds r0, r5, 0
	adds r0, 0xA8
	adds r1, r5, 0
	adds r1, 0x98
	ldrh r1, [r1]
	bl sub_811D184
	movs r0, 0
	bl sub_811D830
	b _0811CD2A
_0811CC7C:
	bl sub_811D280
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	bne _0811CD5A
	movs r1, 0x1
	negs r1, r1
	str r0, [sp]
	adds r0, r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	ldr r0, _0811CCA8 @ =sub_811C6E8
	bl SetVBlankCallback
	b _0811CD5A
	.align 2, 0
_0811CCA8: .4byte sub_811C6E8
_0811CCAC:
	ldr r0, _0811CCBC @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0811CD5A
	b _0811CD2A
	.align 2, 0
_0811CCBC: .4byte gPaletteFade
_0811CCC0:
	adds r0, r5, 0
	adds r0, 0x9C
	ldrb r0, [r0]
	bl sub_811D948
	b _0811CD2A
_0811CCCC:
	adds r0, r5, 0
	adds r0, 0x96
	ldrh r0, [r0]
	adds r1, r5, 0
	adds r1, 0x9C
	ldrb r1, [r1]
	movs r2, 0
	bl sub_811DC54
	b _0811CD2A
_0811CCE0:
	bl sub_811DD90
	lsls r0, 24
	cmp r0, 0
	bne _0811CD5A
	bl sub_811D2A8
	b _0811CD2A
_0811CCF0:
	movs r0, 0x8
	bl sub_811D2EC
	b _0811CD2A
_0811CCF8:
	bl sub_811D4EC
	lsls r0, 24
	cmp r0, 0
	bne _0811CD5A
	adds r1, r5, 0
	adds r1, 0x91
	movs r0, 0x1
	strb r0, [r1]
	b _0811CD2A
_0811CD0C:
	ldr r0, _0811CD34 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0
	beq _0811CD5A
	movs r1, 0x1
	negs r1, r1
	movs r0, 0
	str r0, [sp]
	adds r0, r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
_0811CD2A:
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	b _0811CD5A
	.align 2, 0
_0811CD34: .4byte gMain
_0811CD38:
	ldr r0, _0811CD64 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0811CD5A
	ldr r0, [r5, 0x4]
	bl SetMainCallback2
	bl sub_811D29C
	adds r0, r5, 0
	bl Free
	adds r0, r6, 0
	bl DestroyTask
_0811CD5A:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0811CD64: .4byte gPaletteFade
	thumb_func_end sub_811CBE4

	thumb_func_start sub_811CD68
sub_811CD68: @ 811CD68
	push {r4-r6,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r6, r0, 24
	adds r0, r6, 0
	movs r1, 0
	bl GetWordTaskArg
	adds r5, r0, 0
	ldr r0, _0811CD90 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0811CD98
	ldr r1, _0811CD94 @ =sub_811CF88
	adds r0, r6, 0
	bl sub_811C718
	b _0811CE3E
	.align 2, 0
_0811CD90: .4byte gMain
_0811CD94: .4byte sub_811CF88
_0811CD98:
	adds r4, r5, 0
	adds r4, 0x92
	ldrh r0, [r4]
	cmp r0, 0x1
	beq _0811CDD2
	cmp r0, 0x1
	bgt _0811CDAC
	cmp r0, 0
	beq _0811CDB6
	b _0811CE3E
_0811CDAC:
	cmp r0, 0x2
	beq _0811CE00
	cmp r0, 0x3
	beq _0811CE24
	b _0811CE3E
_0811CDB6:
	movs r0, 0
	bl SetVBlankCallback
	adds r0, r5, 0
	adds r0, 0xA8
	adds r1, r5, 0
	adds r1, 0x98
	ldrh r1, [r1]
	bl sub_811D184
	movs r0, 0x3
	bl sub_811D830
	b _0811CE16
_0811CDD2:
	bl sub_811D280
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	bne _0811CE3E
	movs r1, 0x1
	negs r1, r1
	str r0, [sp]
	adds r0, r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	ldr r0, _0811CDFC @ =sub_811C6E8
	bl SetVBlankCallback
	b _0811CE3E
	.align 2, 0
_0811CDFC: .4byte sub_811C6E8
_0811CE00:
	ldr r0, _0811CE20 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	bne _0811CE3E
	adds r0, r5, 0
	adds r0, 0x9E
	strh r1, [r0]
_0811CE16:
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	b _0811CE3E
	.align 2, 0
_0811CE20: .4byte gPaletteFade
_0811CE24:
	adds r1, r5, 0
	adds r1, 0x9E
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x14
	bls _0811CE3E
	ldr r1, _0811CE48 @ =sub_811CE4C
	adds r0, r6, 0
	bl sub_811C718
_0811CE3E:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0811CE48: .4byte sub_811CE4C
	thumb_func_end sub_811CD68

	thumb_func_start sub_811CE4C
sub_811CE4C: @ 811CE4C
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	adds r0, r6, 0
	movs r1, 0
	bl GetWordTaskArg
	adds r5, r0, 0
	adds r0, 0x91
	ldrb r0, [r0]
	cmp r0, 0
	bne _0811CE88
	ldr r0, _0811CE80 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0811CE88
	bl sub_811D5B0
	ldr r1, _0811CE84 @ =sub_811CF88
	adds r0, r6, 0
	bl sub_811C718
	b _0811CF7E
	.align 2, 0
_0811CE80: .4byte gMain
_0811CE84: .4byte sub_811CF88
_0811CE88:
	adds r0, r5, 0
	adds r0, 0x92
	ldrh r1, [r0]
	adds r4, r0, 0
	cmp r1, 0x9
	bhi _0811CF7E
	lsls r0, r1, 2
	ldr r1, _0811CEA0 @ =_0811CEA4
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0811CEA0: .4byte _0811CEA4
	.align 2, 0
_0811CEA4:
	.4byte _0811CECC
	.4byte _0811CEE0
	.4byte _0811CEEC
	.4byte _0811CEFC
	.4byte _0811CF02
	.4byte _0811CF0E
	.4byte _0811CF14
	.4byte _0811CF28
	.4byte _0811CF46
	.4byte _0811CF6C
_0811CECC:
	adds r0, r5, 0
	adds r0, 0x96
	ldrh r0, [r0]
	bl sub_811DCF0
	adds r1, r5, 0
	adds r1, 0x9E
	movs r0, 0
	strh r0, [r1]
	b _0811CF5E
_0811CEE0:
	bl sub_811D2A8
	movs r0, 0x7
	bl sub_811D2EC
	b _0811CF5E
_0811CEEC:
	bl sub_811D4EC
	lsls r0, 24
	cmp r0, 0
	bne _0811CF7E
	bl sub_811D2D0
	b _0811CF5E
_0811CEFC:
	bl sub_811D6EC
	b _0811CF5E
_0811CF02:
	bl sub_811D6FC
	lsls r0, 24
	cmp r0, 0
	bne _0811CF7E
	b _0811CF5E
_0811CF0E:
	bl sub_811D5A0
	b _0811CF5E
_0811CF14:
	bl sub_811D5C0
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	bne _0811CF7E
	adds r0, r5, 0
	adds r0, 0x9E
	strh r1, [r0]
	b _0811CF5E
_0811CF28:
	adds r1, r5, 0
	adds r1, 0x9E
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1E
	bls _0811CF7E
	bl sub_811D2A8
	movs r0, 0x9
	bl sub_811D2EC
	b _0811CF5E
_0811CF46:
	bl sub_811D4EC
	lsls r0, 24
	cmp r0, 0
	bne _0811CF7E
	ldr r0, _0811CF68 @ =0x00000101
	bl PlayFanfare
	adds r1, r5, 0
	adds r1, 0x91
	movs r0, 0x1
	strb r0, [r1]
_0811CF5E:
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	b _0811CF7E
	.align 2, 0
_0811CF68: .4byte 0x00000101
_0811CF6C:
	bl IsFanfareTaskInactive
	lsls r0, 24
	cmp r0, 0
	beq _0811CF7E
	ldr r1, _0811CF84 @ =sub_811CF88
	adds r0, r6, 0
	bl sub_811C718
_0811CF7E:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0811CF84: .4byte sub_811CF88
	thumb_func_end sub_811CE4C

	thumb_func_start sub_811CF88
sub_811CF88: @ 811CF88
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	adds r0, r6, 0
	movs r1, 0
	bl GetWordTaskArg
	adds r5, r0, 0
	adds r4, r5, 0
	adds r4, 0x92
	ldrh r0, [r4]
	cmp r0, 0
	beq _0811CFA8
	cmp r0, 0x1
	beq _0811CFC8
	b _0811D008
_0811CFA8:
	ldr r0, _0811CFC4 @ =sub_811C6E8
	bl SetVBlankCallback
	movs r0, 0x1
	negs r0, r0
	movs r1, 0x10
	movs r2, 0
	bl BlendPalettes
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	b _0811D008
	.align 2, 0
_0811CFC4: .4byte sub_811C6E8
_0811CFC8:
	ldr r0, _0811D010 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0811D008
	adds r0, r5, 0
	adds r0, 0xA4
	ldr r0, [r0]
	cmp r0, 0x1
	bne _0811CFE8
	bl IsCryFinished
	lsls r0, 24
	cmp r0, 0
	beq _0811D008
_0811CFE8:
	ldr r0, _0811D014 @ =gUnknown_203B090
	adds r1, r5, 0
	adds r1, 0x91
	ldrb r1, [r1]
	str r1, [r0]
	ldr r0, [r5, 0x4]
	bl SetMainCallback2
	adds r0, r6, 0
	bl DestroyTask
	bl sub_811D29C
	adds r0, r5, 0
	bl Free
_0811D008:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0811D010: .4byte gPaletteFade
_0811D014: .4byte gUnknown_203B090
	thumb_func_end sub_811CF88

	thumb_func_start sub_811D018
sub_811D018: @ 811D018
	push {r4,lr}
	lsls r0, 16
	lsrs r3, r0, 16
	movs r2, 0
	ldr r4, _0811D044 @ =gUnknown_8459634
_0811D022:
	adds r1, r4, 0
	ldrh r0, [r1]
	cmp r0, r3
	beq _0811D04C
	adds r4, r1, 0x4
	adds r2, 0x1
	cmp r2, 0x1
	bls _0811D022
	ldr r1, _0811D048 @ =0xfffffedf
	adds r0, r3, r1
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x39
	bls _0811D050
	movs r0, 0
	b _0811D052
	.align 2, 0
_0811D044: .4byte gUnknown_8459634
_0811D048: .4byte 0xfffffedf
_0811D04C:
	ldrh r0, [r4, 0x2]
	b _0811D052
_0811D050:
	movs r0, 0x4
_0811D052:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_811D018

	thumb_func_start sub_811D058
sub_811D058: @ 811D058
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	adds r1, r0, 0
	cmp r0, 0x64
	bhi _0811D068
	movs r0, 0
	b _0811D07A
_0811D068:
	cmp r0, 0x96
	bhi _0811D070
	movs r0, 0x1
	b _0811D07A
_0811D070:
	cmp r1, 0xC8
	bls _0811D078
	movs r0, 0x3
	b _0811D07A
_0811D078:
	movs r0, 0x2
_0811D07A:
	pop {r1}
	bx r1
	thumb_func_end sub_811D058

	thumb_func_start sub_811D080
sub_811D080: @ 811D080
	push {lr}
	ldr r0, _0811D090 @ =gUnknown_203B094
	ldrb r0, [r0]
	movs r1, 0
	bl GetWordTaskArg
	pop {r1}
	bx r1
	.align 2, 0
_0811D090: .4byte gUnknown_203B094
	thumb_func_end sub_811D080

	thumb_func_start sub_811D094
sub_811D094: @ 811D094
	push {lr}
	bl sub_811D080
	ldr r1, _0811D0A4 @ =gUnknown_203B098
	str r0, [r1]
	adds r0, 0x8
	pop {r1}
	bx r1
	.align 2, 0
_0811D0A4: .4byte gUnknown_203B098
	thumb_func_end sub_811D094

	thumb_func_start sub_811D0A8
sub_811D0A8: @ 811D0A8
	push {lr}
	bl sub_811D080
	adds r0, 0xA8
	pop {r1}
	bx r1
	thumb_func_end sub_811D0A8

	thumb_func_start sub_811D0B4
sub_811D0B4: @ 811D0B4
	push {lr}
	bl sub_811D080
	adds r0, 0x96
	ldrh r0, [r0]
	pop {r1}
	bx r1
	thumb_func_end sub_811D0B4

	thumb_func_start sub_811D0C4
sub_811D0C4: @ 811D0C4
	push {lr}
	bl sub_811D080
	adds r0, 0x77
	pop {r1}
	bx r1
	thumb_func_end sub_811D0C4

	thumb_func_start sub_811D0D0
sub_811D0D0: @ 811D0D0
	push {lr}
	bl sub_811D080
	adds r0, 0x84
	pop {r1}
	bx r1
	thumb_func_end sub_811D0D0

	thumb_func_start sub_811D0DC
sub_811D0DC: @ 811D0DC
	push {r4,lr}
	adds r4, r0, 0
	bl sub_811D080
	adds r1, r0, 0
	adds r1, 0x6C
	adds r0, r4, 0
	bl StringCopy
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_811D0DC

	thumb_func_start sub_811D0F4
sub_811D0F4: @ 811D0F4
	push {lr}
	bl sub_811D080
	adds r0, 0x6C
	pop {r1}
	bx r1
	thumb_func_end sub_811D0F4

	thumb_func_start sub_811D100
sub_811D100: @ 811D100
	push {lr}
	bl sub_811D080
	adds r0, 0x98
	ldrb r0, [r0]
	pop {r1}
	bx r1
	thumb_func_end sub_811D100

	thumb_func_start sub_811D110
sub_811D110: @ 811D110
	push {lr}
	bl sub_811D080
	adds r0, 0x94
	ldrh r0, [r0]
	pop {r1}
	bx r1
	thumb_func_end sub_811D110

	thumb_func_start sub_811D120
sub_811D120: @ 811D120
	push {lr}
	bl sub_811D080
	adds r0, 0xA0
	ldr r0, [r0]
	pop {r1}
	bx r1
	thumb_func_end sub_811D120

	thumb_func_start GetMonLevelUpWindowStats
GetMonLevelUpWindowStats: @ 811D130
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r1, 0x3A
	bl GetMonData
	strh r0, [r5]
	adds r0, r4, 0
	movs r1, 0x3B
	bl GetMonData
	strh r0, [r5, 0x2]
	adds r0, r4, 0
	movs r1, 0x3C
	bl GetMonData
	strh r0, [r5, 0x4]
	adds r0, r4, 0
	movs r1, 0x3D
	bl GetMonData
	strh r0, [r5, 0x6]
	adds r0, r4, 0
	movs r1, 0x3E
	bl GetMonData
	strh r0, [r5, 0x8]
	adds r0, r4, 0
	movs r1, 0x3F
	bl GetMonData
	strh r0, [r5, 0xA]
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end GetMonLevelUpWindowStats

	thumb_func_start sub_811D178
sub_811D178: @ 811D178
	ldr r0, _0811D180 @ =gUnknown_203B090
	ldr r0, [r0]
	bx lr
	.align 2, 0
_0811D180: .4byte gUnknown_203B090
	thumb_func_end sub_811D178

	thumb_func_start sub_811D184
sub_811D184: @ 811D184
	push {r4,r5,lr}
	sub sp, 0x8
	adds r4, r0, 0
	lsls r5, r1, 16
	lsrs r5, 16
	bl FreeAllWindowBuffers
	bl ResetTempTileDataBuffers
	movs r0, 0
	movs r1, 0
	bl SetGpuReg
	movs r0, 0
	bl ResetBgsAndClearDma3BusyFlags
	ldr r1, _0811D270 @ =gUnknown_8459980
	movs r0, 0
	movs r2, 0x2
	bl InitBgsFromTemplates
	ldr r0, _0811D274 @ =gUnknown_8459988
	bl InitWindows
	movs r0, 0
	movs r1, 0
	movs r2, 0
	bl ChangeBgX
	movs r0, 0
	movs r1, 0
	movs r2, 0
	bl ChangeBgY
	movs r0, 0x3
	movs r1, 0
	movs r2, 0
	bl ChangeBgX
	movs r0, 0x3
	movs r1, 0
	movs r2, 0
	bl ChangeBgY
	ldr r0, _0811D278 @ =0x00000914
	adds r1, r4, r0
	movs r0, 0
	bl SetBgTilemapBuffer
	ldr r0, _0811D27C @ =0x00001914
	adds r4, r0
	movs r0, 0x3
	adds r1, r4, 0
	bl SetBgTilemapBuffer
	movs r1, 0xC0
	lsls r1, 19
	movs r0, 0
	movs r2, 0x20
	movs r3, 0x1
	bl RequestDma3Fill
	movs r0, 0x20
	str r0, [sp]
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect_Palette0
	adds r0, r5, 0
	bl sub_811D7D4
	movs r0, 0
	movs r1, 0
	bl FillWindowPixelBuffer
	movs r0, 0
	movs r1, 0
	movs r2, 0xE0
	bl TextWindow_SetUserSelectedFrame
	movs r0, 0
	movs r1, 0x3
	bl CopyWindowToVram
	movs r0, 0
	bl ShowBg
	movs r0, 0x3
	bl ShowBg
	movs r0, 0x1
	bl HideBg
	movs r0, 0x2
	bl HideBg
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	movs r0, 0x3
	bl CopyBgTilemapBufferToVram
	movs r1, 0x82
	lsls r1, 5
	movs r0, 0
	bl SetGpuRegBits
	movs r0, 0x50
	movs r1, 0
	bl SetGpuReg
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0811D270: .4byte gUnknown_8459980
_0811D274: .4byte gUnknown_8459988
_0811D278: .4byte 0x00000914
_0811D27C: .4byte 0x00001914
	thumb_func_end sub_811D184

	thumb_func_start sub_811D280
sub_811D280: @ 811D280
	push {lr}
	bl FreeTempTileDataBuffersIfPossible
	lsls r0, 24
	cmp r0, 0
	beq _0811D290
	movs r0, 0x1
	b _0811D298
_0811D290:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	lsrs r0, 24
_0811D298:
	pop {r1}
	bx r1
	thumb_func_end sub_811D280

	thumb_func_start sub_811D29C
sub_811D29C: @ 811D29C
	push {lr}
	bl FreeAllWindowBuffers
	pop {r0}
	bx r0
	thumb_func_end sub_811D29C

	thumb_func_start sub_811D2A8
sub_811D2A8: @ 811D2A8
	push {lr}
	movs r0, 0
	bl PutWindowTilemap
	movs r0, 0
	movs r1, 0x11
	bl FillWindowPixelBuffer
	movs r0, 0
	movs r1, 0x1
	movs r2, 0xE
	bl DrawTextBorderOuter
	movs r0, 0
	movs r1, 0x3
	bl CopyWindowToVram
	pop {r0}
	bx r0
	thumb_func_end sub_811D2A8

	thumb_func_start sub_811D2D0
sub_811D2D0: @ 811D2D0
	push {lr}
	movs r0, 0
	bl ClearWindowTilemap
	movs r0, 0
	movs r1, 0
	bl ClearStdWindowAndFrameToTransparent
	movs r0, 0
	movs r1, 0x1
	bl CopyWindowToVram
	pop {r0}
	bx r0
	thumb_func_end sub_811D2D0

	thumb_func_start sub_811D2EC
sub_811D2EC: @ 811D2EC
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x14
	lsls r0, 24
	lsrs r5, r0, 24
	bl sub_811D0A8
	adds r4, r0, 0
	bl sub_811D0B4
	lsls r0, 16
	lsrs r7, r0, 16
	movs r0, 0
	mov r8, r0
	bl GetTextSpeedSetting
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	bl sub_811D094
	adds r6, r0, 0
	cmp r5, 0x9
	bls _0811D322
	b _0811D4C2
_0811D322:
	lsls r0, r5, 2
	ldr r1, _0811D32C @ =_0811D330
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0811D32C: .4byte _0811D330
	.align 2, 0
_0811D330:
	.4byte _0811D358
	.4byte _0811D38C
	.4byte _0811D42C
	.4byte _0811D418
	.4byte _0811D404
	.4byte _0811D450
	.4byte _0811D47C
	.4byte _0811D488
	.4byte _0811D498
	.4byte _0811D3DC
_0811D358:
	adds r4, 0x14
	adds r0, r7, 0
	bl ItemId_GetName
	adds r1, r0, 0
	adds r0, r4, 0
	bl StringCopy
	adds r2, r0, 0
	ldr r1, _0811D384 @ =gUnknown_841B285
	bl StringCopy
	adds r2, r0, 0
	adds r0, r6, 0
	movs r1, 0x2
	bl GetMonData
	ldr r1, _0811D388 @ =gUnknown_841B293
	adds r0, r4, 0
	bl StringAppend
	b _0811D4A2
	.align 2, 0
_0811D384: .4byte gUnknown_841B285
_0811D388: .4byte gUnknown_841B293
_0811D38C:
	adds r0, r6, 0
	movs r1, 0x38
	bl GetMonData
	lsls r0, 16
	lsrs r5, r0, 16
	adds r4, 0x14
	adds r0, r6, 0
	movs r1, 0x2
	adds r2, r4, 0
	bl GetMonData
	ldr r1, _0811D3D4 @ =gUnknown_841B295
	adds r0, r4, 0
	bl StringAppend
	adds r2, r0, 0
	cmp r5, 0x63
	bhi _0811D3B8
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
_0811D3B8:
	movs r3, 0x3
	cmp r5, 0x63
	bhi _0811D3C0
	movs r3, 0x2
_0811D3C0:
	adds r0, r2, 0
	adds r1, r5, 0
	movs r2, 0
	bl ConvertIntToDecimalStringN
	adds r2, r0, 0
	ldr r1, _0811D3D8 @ =gUnknown_841B2A7
	bl StringAppend
	b _0811D4A2
	.align 2, 0
_0811D3D4: .4byte gUnknown_841B295
_0811D3D8: .4byte gUnknown_841B2A7
_0811D3DC:
	bl DynamicPlaceholderTextUtil_Reset
	bl sub_811D0F4
	adds r1, r0, 0
	movs r0, 0
	bl DynamicPlaceholderTextUtil_SetPlaceholderPtr
	bl sub_811D0D0
	adds r1, r0, 0
	movs r0, 0x1
	bl DynamicPlaceholderTextUtil_SetPlaceholderPtr
	adds r4, 0x14
	ldr r1, _0811D400 @ =gUnknown_841B32E
	b _0811D470
	.align 2, 0
_0811D400: .4byte gUnknown_841B32E
_0811D404:
	ldr r1, _0811D444 @ =gUnknown_841B2F1
	movs r2, 0x1
	negs r2, r2
	movs r0, 0x2
	bl GetStringWidth
	add r0, r8
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
_0811D418:
	ldr r1, _0811D448 @ =gUnknown_841B2ED
	movs r2, 0x1
	negs r2, r2
	movs r0, 0x2
	bl GetStringWidth
	add r0, r8
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
_0811D42C:
	adds r4, 0x14
	ldr r1, _0811D44C @ =gUnknown_8459998
	subs r0, r5, 0x2
	lsls r0, 2
	adds r0, r1
	ldr r1, [r0]
	adds r0, r4, 0
	bl StringCopy
	movs r1, 0x1
	mov r9, r1
	b _0811D4A2
	.align 2, 0
_0811D444: .4byte gUnknown_841B2F1
_0811D448: .4byte gUnknown_841B2ED
_0811D44C: .4byte gUnknown_8459998
_0811D450:
	bl DynamicPlaceholderTextUtil_Reset
	bl sub_811D0F4
	adds r1, r0, 0
	movs r0, 0
	bl DynamicPlaceholderTextUtil_SetPlaceholderPtr
	bl sub_811D0C4
	adds r1, r0, 0
	movs r0, 0x1
	bl DynamicPlaceholderTextUtil_SetPlaceholderPtr
	adds r4, 0x14
	ldr r1, _0811D478 @ =gUnknown_841B306
_0811D470:
	adds r0, r4, 0
	bl DynamicPlaceholderTextUtil_ExpandPlaceholders
	b _0811D4A2
	.align 2, 0
_0811D478: .4byte gUnknown_841B306
_0811D47C:
	adds r4, 0x14
	ldr r1, _0811D484 @ =gUnknown_841B315
	b _0811D48C
	.align 2, 0
_0811D484: .4byte gUnknown_841B315
_0811D488:
	adds r4, 0x14
	ldr r1, _0811D494 @ =gUnknown_841B31B
_0811D48C:
	adds r0, r4, 0
	bl StringCopy
	b _0811D4A2
	.align 2, 0
_0811D494: .4byte gUnknown_841B31B
_0811D498:
	adds r4, 0x14
	ldr r1, _0811D4D0 @ =gUnknown_841B329
	adds r0, r4, 0
	bl StringCopy
_0811D4A2:
	mov r0, r8
	lsls r3, r0, 24
	lsrs r3, 24
	movs r0, 0
	str r0, [sp]
	mov r1, r9
	str r1, [sp, 0x4]
	str r0, [sp, 0x8]
	str r0, [sp, 0xC]
	movs r0, 0x4
	str r0, [sp, 0x10]
	movs r0, 0
	movs r1, 0x2
	adds r2, r4, 0
	bl AddTextPrinterParameterized5
_0811D4C2:
	add sp, 0x14
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0811D4D0: .4byte gUnknown_841B329
	thumb_func_end sub_811D2EC

	thumb_func_start sub_811D4D4
sub_811D4D4: @ 811D4D4
	push {lr}
	movs r0, 0
	movs r1, 0x11
	bl FillWindowPixelBuffer
	movs r0, 0
	movs r1, 0x2
	bl CopyWindowToVram
	pop {r0}
	bx r0
	thumb_func_end sub_811D4D4

	thumb_func_start sub_811D4EC
sub_811D4EC: @ 811D4EC
	push {lr}
	movs r0, 0
	bl IsTextPrinterActive
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end sub_811D4EC

	thumb_func_start sub_811D4FC
sub_811D4FC: @ 811D4FC
	push {r4,lr}
	bl sub_811D0A8
	adds r4, r0, 0
	movs r0, 0
	strh r0, [r4]
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x80
	lsls r1, 9
	lsls r1, r0
	movs r0, 0x4
	orrs r1, r0
	adds r0, r1, 0
	movs r1, 0x10
	movs r2, 0
	bl BlendPalettes
	adds r0, r4, 0
	bl sub_811E204
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_811D4FC

	thumb_func_start sub_811D530
sub_811D530: @ 811D530
	push {r4,r5,lr}
	sub sp, 0x4
	bl sub_811D0A8
	adds r4, r0, 0
	ldrh r0, [r4]
	cmp r0, 0
	beq _0811D546
	cmp r0, 0x1
	beq _0811D57E
	b _0811D594
_0811D546:
	bl sub_811E2F4
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0
	bne _0811D594
	movs r0, 0
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 24
	movs r2, 0x80
	lsls r2, 9
	lsls r2, r0
	movs r0, 0x4
	orrs r2, r0
	movs r1, 0x1
	negs r1, r1
	str r5, [sp]
	adds r0, r2, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	b _0811D594
_0811D57E:
	ldr r0, _0811D590 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0811D594
	movs r0, 0
	b _0811D596
	.align 2, 0
_0811D590: .4byte gPaletteFade
_0811D594:
	movs r0, 0x1
_0811D596:
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_811D530

	thumb_func_start sub_811D5A0
sub_811D5A0: @ 811D5A0
	push {lr}
	bl sub_811D0A8
	movs r1, 0
	strh r1, [r0]
	pop {r0}
	bx r0
	thumb_func_end sub_811D5A0

	thumb_func_start sub_811D5B0
sub_811D5B0: @ 811D5B0
	push {lr}
	bl sub_811E388
	bl ResetPaletteFadeControl
	pop {r0}
	bx r0
	thumb_func_end sub_811D5B0

	thumb_func_start sub_811D5C0
sub_811D5C0: @ 811D5C0
	push {r4,lr}
	sub sp, 0x4
	bl sub_811D0A8
	adds r4, r0, 0
	ldrh r0, [r4]
	cmp r0, 0x8
	bls _0811D5D2
	b _0811D6DE
_0811D5D2:
	lsls r0, 2
	ldr r1, _0811D5DC @ =_0811D5E0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0811D5DC: .4byte _0811D5E0
	.align 2, 0
_0811D5E0:
	.4byte _0811D604
	.4byte _0811D60C
	.4byte _0811D61C
	.4byte _0811D62C
	.4byte _0811D63E
	.4byte _0811D670
	.4byte _0811D6A0
	.4byte _0811D6BA
	.4byte _0811D6CA
_0811D604:
	movs r0, 0
	bl sub_811E194
	b _0811D6D6
_0811D60C:
	bl sub_811D9A8
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	bne _0811D6E2
	strh r0, [r4, 0x4]
	b _0811D6D6
_0811D61C:
	ldrh r0, [r4, 0x4]
	adds r0, 0x1
	strh r0, [r4, 0x4]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x14
	bls _0811D6E2
	b _0811D6D6
_0811D62C:
	adds r0, r4, 0
	movs r1, 0x1
	movs r2, 0
	movs r3, 0x1
	bl sub_811DB7C
	movs r0, 0
	strh r0, [r4, 0x4]
	b _0811D6D6
_0811D63E:
	ldrh r0, [r4, 0x4]
	adds r0, 0x1
	strh r0, [r4, 0x4]
	lsls r0, 16
	cmp r0, 0
	beq _0811D6E2
	movs r0, 0
	strh r0, [r4, 0x4]
	movs r0, 0x85
	bl PlaySE
	ldr r0, _0811D66C @ =0x00007da8
	str r0, [sp]
	movs r0, 0x1
	movs r1, 0x2
	movs r2, 0
	movs r3, 0xC
	bl BeginNormalPaletteFade
	adds r0, r4, 0
	bl sub_811E348
	b _0811D6D6
	.align 2, 0
_0811D66C: .4byte 0x00007da8
_0811D670:
	ldrh r0, [r4, 0x4]
	adds r0, 0x1
	strh r0, [r4, 0x4]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x46
	bls _0811D6E2
	adds r0, r4, 0
	bl sub_811DBA8
	ldr r0, _0811D69C @ =0x00007da8
	str r0, [sp]
	movs r0, 0x1
	movs r1, 0x6
	movs r2, 0xC
	movs r3, 0
	bl BeginNormalPaletteFade
	movs r0, 0
	strh r0, [r4, 0x4]
	b _0811D6D6
	.align 2, 0
_0811D69C: .4byte 0x00007da8
_0811D6A0:
	ldrh r0, [r4, 0x4]
	adds r0, 0x1
	strh r0, [r4, 0x4]
	bl sub_811E5A4
	adds r1, r0, 0
	cmp r1, 0
	bne _0811D6E2
	ldrh r0, [r4, 0x4]
	cmp r0, 0x28
	bls _0811D6E2
	strh r1, [r4, 0x4]
	b _0811D6D6
_0811D6BA:
	ldrh r0, [r4, 0x4]
	adds r0, 0x1
	strh r0, [r4, 0x4]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x14
	bls _0811D6E2
	b _0811D6D6
_0811D6CA:
	movs r0, 0x54
	bl PlaySE
	ldr r0, [r4, 0x10]
	bl DestroySprite
_0811D6D6:
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	b _0811D6E2
_0811D6DE:
	movs r0, 0
	b _0811D6E4
_0811D6E2:
	movs r0, 0x1
_0811D6E4:
	add sp, 0x4
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_811D5C0

	thumb_func_start sub_811D6EC
sub_811D6EC: @ 811D6EC
	push {lr}
	bl sub_811D0A8
	movs r1, 0
	strh r1, [r0]
	pop {r0}
	bx r0
	thumb_func_end sub_811D6EC

	thumb_func_start sub_811D6FC
sub_811D6FC: @ 811D6FC
	push {r4,lr}
	bl sub_811D0A8
	adds r4, r0, 0
	ldrh r0, [r4]
	cmp r0, 0
	beq _0811D710
	cmp r0, 0x1
	beq _0811D722
	b _0811D72C
_0811D710:
	bl sub_811E10C
	movs r0, 0x1D
	bl PlaySE
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	b _0811D72C
_0811D722:
	bl sub_811E138
	lsls r0, 24
	lsrs r0, 24
	b _0811D72E
_0811D72C:
	movs r0, 0x1
_0811D72E:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_811D6FC

	thumb_func_start sub_811D734
sub_811D734: @ 811D734
	push {lr}
	sub sp, 0x8
	movs r0, 0x2
	str r0, [sp]
	movs r0, 0
	str r0, [sp, 0x4]
	movs r0, 0x78
	movs r1, 0x38
	movs r2, 0x4
	movs r3, 0x4
	bl sub_811E5B8
	add sp, 0x8
	pop {r0}
	bx r0
	thumb_func_end sub_811D734

	thumb_func_start sub_811D754
sub_811D754: @ 811D754
	push {lr}
	bl sub_811E680
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end sub_811D754

	thumb_func_start sub_811D764
sub_811D764: @ 811D764
	push {r4,r5,lr}
	sub sp, 0x8
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x1
	movs r1, 0x1
	movs r2, 0xE
	bl DrawTextBorderOuter
	movs r0, 0x2
	str r0, [sp]
	movs r0, 0x3
	str r0, [sp, 0x4]
	movs r0, 0x1
	adds r1, r4, 0
	adds r2, r5, 0
	movs r3, 0x1
	bl DrawLevelUpWindowPg1
	movs r0, 0x1
	bl PutWindowTilemap
	movs r0, 0x1
	movs r1, 0x3
	bl CopyWindowToVram
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_811D764

	thumb_func_start sub_811D7A0
sub_811D7A0: @ 811D7A0
	push {lr}
	sub sp, 0x4
	adds r1, r0, 0
	movs r0, 0x3
	str r0, [sp]
	movs r0, 0x1
	movs r2, 0x1
	movs r3, 0x2
	bl DrawLevelUpWindowPg2
	movs r0, 0x1
	movs r1, 0x2
	bl CopyWindowToVram
	add sp, 0x4
	pop {r0}
	bx r0
	thumb_func_end sub_811D7A0

	thumb_func_start sub_811D7C4
sub_811D7C4: @ 811D7C4
	push {lr}
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end sub_811D7C4

	thumb_func_start sub_811D7D4
sub_811D7D4: @ 811D7D4
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	ldr r1, _0811D80C @ =gUnknown_845973C
	movs r0, 0x3
	movs r2, 0
	movs r3, 0
	bl CopyToBgTilemapBuffer
	ldr r1, _0811D810 @ =gUnknown_845967C
	movs r0, 0
	str r0, [sp]
	movs r0, 0x3
	movs r2, 0
	movs r3, 0
	bl DecompressAndCopyTileDataToVram
	cmp r4, 0x4
	beq _0811D818
	ldr r0, _0811D814 @ =gUnknown_845963C
	movs r1, 0
	movs r2, 0x20
	bl LoadPalette
	b _0811D822
	.align 2, 0
_0811D80C: .4byte gUnknown_845973C
_0811D810: .4byte gUnknown_845967C
_0811D814: .4byte gUnknown_845963C
_0811D818:
	ldr r0, _0811D82C @ =gUnknown_845965C
	movs r1, 0
	movs r2, 0x20
	bl LoadPalette
_0811D822:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0811D82C: .4byte gUnknown_845965C
	thumb_func_end sub_811D7D4

	thumb_func_start sub_811D830
sub_811D830: @ 811D830
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp]
	bl sub_811D0A8
	adds r5, r0, 0
	bl sub_811D094
	mov r8, r0
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r7, r0, 16
	mov r0, r8
	movs r1, 0
	bl GetMonData
	mov r10, r0
	adds r0, r7, 0
	mov r1, r10
	movs r2, 0x2
	bl sub_812EA78
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0xFF
	beq _0811D87E
	movs r0, 0x48
	strh r0, [r5, 0x6]
	adds r0, r1, 0
	adds r0, 0x30
	b _0811D884
_0811D87E:
	movs r0, 0x48
	strh r0, [r5, 0x6]
	movs r0, 0x60
_0811D884:
	strh r0, [r5, 0x8]
	movs r4, 0x80
	lsls r4, 6
	adds r0, r4, 0
	bl Alloc
	adds r6, r0, 0
	adds r0, r4, 0
	bl Alloc
	mov r9, r0
	movs r0, 0x80
	lsls r0, 1
	bl Alloc
	adds r4, r0, 0
	cmp r6, 0
	beq _0811D920
	mov r0, r9
	cmp r0, 0
	beq _0811D916
	cmp r4, 0
	beq _0811D916
	lsls r0, r7, 3
	ldr r1, _0811D900 @ =gMonFrontPicTable
	adds r0, r1
	adds r1, r6, 0
	adds r2, r7, 0
	mov r3, r10
	bl HandleLoadSpecialPokePic
	mov r0, r8
	bl GetMonFrontSpritePal
	adds r1, r4, 0
	bl LZ77UnCompWram
	adds r0, r6, 0
	adds r1, r4, 0
	bl sub_811DC14
	ldr r0, _0811D904 @ =gUnknown_8459A30
	movs r1, 0x6
	ldrsh r2, [r5, r1]
	movs r1, 0x78
	movs r3, 0x4
	bl CreateSprite
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x40
	beq _0811D90C
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0811D908 @ =gSprites
	adds r0, r1
	str r0, [r5, 0xC]
	ldr r1, [sp]
	bl sub_811DB14
	b _0811D910
	.align 2, 0
_0811D900: .4byte gMonFrontPicTable
_0811D904: .4byte gUnknown_8459A30
_0811D908: .4byte gSprites
_0811D90C:
	movs r0, 0
	str r0, [r5, 0xC]
_0811D910:
	mov r0, sp
	ldrb r0, [r0]
	strb r0, [r5, 0xA]
_0811D916:
	cmp r6, 0
	beq _0811D920
	adds r0, r6, 0
	bl Free
_0811D920:
	mov r1, r9
	cmp r1, 0
	beq _0811D92C
	mov r0, r9
	bl Free
_0811D92C:
	cmp r4, 0
	beq _0811D936
	adds r0, r4, 0
	bl Free
_0811D936:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_811D830

	thumb_func_start sub_811D948
sub_811D948: @ 811D948
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	bl sub_811D0A8
	adds r5, r0, 0
	ldrb r0, [r5, 0xA]
	cmp r6, r0
	beq _0811D99C
	ldr r0, _0811D990 @ =sub_811D9BC
	movs r1, 0x4
	bl CreateTask
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r2, [r5, 0xC]
	adds r0, r4, 0
	movs r1, 0x6
	bl SetWordTaskArg
	ldr r1, _0811D994 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r1, r0, r1
	ldrb r0, [r5, 0xA]
	strh r0, [r1, 0xA]
	strh r6, [r1, 0xC]
	movs r0, 0x6
	strh r0, [r1, 0x12]
	ldrb r5, [r5, 0xA]
	cmp r6, r5
	bls _0811D998
	movs r0, 0x1
	b _0811D99A
	.align 2, 0
_0811D990: .4byte sub_811D9BC
_0811D994: .4byte gTasks
_0811D998:
	ldr r0, _0811D9A4 @ =0x0000ffff
_0811D99A:
	strh r0, [r1, 0xE]
_0811D99C:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0811D9A4: .4byte 0x0000ffff
	thumb_func_end sub_811D948

	thumb_func_start sub_811D9A8
sub_811D9A8: @ 811D9A8
	push {lr}
	ldr r0, _0811D9B8 @ =sub_811D9BC
	bl FuncIsActiveTask
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_0811D9B8: .4byte sub_811D9BC
	thumb_func_end sub_811D9A8

	thumb_func_start sub_811D9BC
sub_811D9BC: @ 811D9BC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r6, r0, 24
	mov r8, r6
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	ldr r1, _0811D9F0 @ =gTasks+0x8
	adds r4, r0, r1
	adds r0, r6, 0
	movs r1, 0x6
	bl GetWordTaskArg
	adds r5, r0, 0
	movs r1, 0
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _0811DA26
	cmp r0, 0x1
	bgt _0811D9F4
	cmp r0, 0
	beq _0811D9FA
	b _0811DA90
	.align 2, 0
_0811D9F0: .4byte gTasks+0x8
_0811D9F4:
	cmp r0, 0x2
	beq _0811DA7A
	b _0811DA90
_0811D9FA:
	ldrb r1, [r4, 0x2]
	adds r0, r5, 0
	bl sub_811DA9C
	movs r2, 0x10
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _0811DA18
	adds r0, r6, 0
	movs r1, 0x9
	bl GetWordTaskArg
	ldrb r1, [r4, 0x2]
	bl sub_811DA9C
_0811DA18:
	ldrh r0, [r4, 0x6]
	ldrh r1, [r4, 0x2]
	adds r0, r1
	strh r0, [r4, 0x2]
	ldrh r0, [r4]
	adds r0, 0x1
	b _0811DA8E
_0811DA26:
	adds r0, r5, 0
	bl sub_811DAAC
	lsls r0, 24
	lsrs r7, r0, 24
	cmp r7, 0
	bne _0811DA90
	movs r0, 0x6D
	bl PlaySE
	ldrb r1, [r4, 0x2]
	adds r0, r5, 0
	bl sub_811DB14
	movs r2, 0x10
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _0811DA58
	adds r0, r6, 0
	movs r1, 0x9
	bl GetWordTaskArg
	ldrb r1, [r4, 0x2]
	bl sub_811DB48
_0811DA58:
	movs r0, 0x2
	ldrsh r1, [r4, r0]
	movs r2, 0x4
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bne _0811DA74
	bl sub_811D0A8
	ldrh r1, [r4, 0x4]
	strb r1, [r0, 0xA]
	mov r0, r8
	bl DestroyTask
	b _0811DA90
_0811DA74:
	strh r7, [r4, 0x8]
	movs r0, 0x2
	b _0811DA8E
_0811DA7A:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	lsls r0, 16
	asrs r0, 16
	movs r2, 0xA
	ldrsh r1, [r4, r2]
	cmp r0, r1
	ble _0811DA90
	movs r0, 0
_0811DA8E:
	strh r0, [r4]
_0811DA90:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_811D9BC

	thumb_func_start sub_811DA9C
sub_811DA9C: @ 811DA9C
	lsls r1, 24
	lsrs r1, 24
	movs r2, 0
	strh r2, [r0, 0x2E]
	strh r2, [r0, 0x30]
	strh r1, [r0, 0x32]
	bx lr
	thumb_func_end sub_811DA9C

	thumb_func_start sub_811DAAC
sub_811DAAC: @ 811DAAC
	ldr r1, [r0, 0x1C]
	ldr r0, _0811DABC @ =SpriteCallbackDummy
	eors r1, r0
	negs r0, r1
	orrs r0, r1
	lsrs r0, 31
	bx lr
	.align 2, 0
_0811DABC: .4byte SpriteCallbackDummy
	thumb_func_end sub_811DAAC

	thumb_func_start sub_811DAC0
sub_811DAC0: @ 811DAC0
	lsls r1, 24
	lsls r0, 16
	asrs r0, 16
	ldr r2, _0811DAD8 @ =gUnknown_84599AA
	lsrs r1, 23
	adds r1, r2
	ldrh r1, [r1]
	muls r0, r1
	lsls r0, 8
	asrs r0, 16
	bx lr
	.align 2, 0
_0811DAD8: .4byte gUnknown_84599AA
	thumb_func_end sub_811DAC0

	thumb_func_start sub_811DADC
sub_811DADC: @ 811DADC
	push {r4,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	bl sub_811D0A8
	ldrh r1, [r0, 0x8]
	ldrh r2, [r0, 0x6]
	subs r1, r2
	lsls r1, 16
	asrs r1, 8
	cmp r1, 0
	bge _0811DAF6
	adds r1, 0xFF
_0811DAF6:
	asrs r1, 8
	ldr r3, _0811DB10 @ =0xffffff00
	adds r0, r4, r3
	muls r0, r1
	lsls r0, 8
	asrs r0, 16
	adds r0, r2
	lsls r0, 16
	lsrs r0, 16
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0811DB10: .4byte 0xffffff00
	thumb_func_end sub_811DADC

	thumb_func_start sub_811DB14
sub_811DB14: @ 811DB14
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r1, 24
	lsrs r4, r1, 24
	cmp r4, 0x3
	bls _0811DB22
	movs r4, 0x3
_0811DB22:
	bl sub_811D0A8
	adds r0, r5, 0
	adds r1, r4, 0
	bl StartSpriteAffineAnim
	ldr r1, _0811DB44 @ =gUnknown_84599AA
	lsls r0, r4, 1
	adds r0, r1
	ldrh r0, [r0]
	bl sub_811DADC
	strh r0, [r5, 0x22]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0811DB44: .4byte gUnknown_84599AA
	thumb_func_end sub_811DB14

	thumb_func_start sub_811DB48
sub_811DB48: @ 811DB48
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r4, r1, 24
	lsrs r4, 24
	adds r1, r4, 0
	bl sub_811DB14
	ldrh r0, [r5, 0x3A]
	subs r0, 0x20
	lsls r0, 16
	asrs r0, 16
	adds r1, r4, 0
	bl sub_811DAC0
	strh r0, [r5, 0x24]
	ldrh r0, [r5, 0x3C]
	subs r0, 0x20
	lsls r0, 16
	asrs r0, 16
	adds r1, r4, 0
	bl sub_811DAC0
	strh r0, [r5, 0x26]
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_811DB48

	thumb_func_start sub_811DB7C
sub_811DB7C: @ 811DB7C
	push {r4,lr}
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r2, 24
	lsls r3, 24
	lsrs r3, 24
	ldr r4, [r0, 0xC]
	strh r1, [r4, 0x2E]
	ldr r1, [r0, 0xC]
	strh r2, [r1, 0x30]
	ldr r1, [r0, 0xC]
	strh r3, [r1, 0x32]
	ldr r1, [r0, 0xC]
	ldr r0, _0811DBA4 @ =sub_811DBBC
	str r0, [r1, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0811DBA4: .4byte sub_811DBBC
	thumb_func_end sub_811DB7C

	thumb_func_start sub_811DBA8
sub_811DBA8: @ 811DBA8
	ldr r2, [r0, 0xC]
	movs r1, 0
	strh r1, [r2, 0x24]
	ldr r1, [r0, 0xC]
	ldr r0, _0811DBB8 @ =SpriteCallbackDummy
	str r0, [r1, 0x1C]
	bx lr
	.align 2, 0
_0811DBB8: .4byte SpriteCallbackDummy
	thumb_func_end sub_811DBA8

	thumb_func_start sub_811DBBC
sub_811DBBC: @ 811DBBC
	push {r4,lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x3C]
	adds r0, 0x1
	movs r3, 0
	strh r0, [r2, 0x3C]
	lsls r0, 16
	asrs r0, 16
	movs r4, 0x2E
	ldrsh r1, [r2, r4]
	cmp r0, r1
	ble _0811DC0C
	strh r3, [r2, 0x3C]
	ldrh r0, [r2, 0x3A]
	adds r0, 0x1
	strh r0, [r2, 0x3A]
	movs r4, 0x30
	ldrsh r1, [r2, r4]
	cmp r1, 0
	beq _0811DBF8
	lsls r0, 16
	asrs r0, 16
	cmp r0, r1
	blt _0811DBF8
	strh r3, [r2, 0x24]
	ldr r0, _0811DBF4 @ =SpriteCallbackDummy
	str r0, [r2, 0x1C]
	b _0811DC0C
	.align 2, 0
_0811DBF4: .4byte SpriteCallbackDummy
_0811DBF8:
	ldrh r1, [r2, 0x3A]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0811DC06
	ldrh r0, [r2, 0x32]
	b _0811DC0A
_0811DC06:
	ldrh r0, [r2, 0x32]
	negs r0, r0
_0811DC0A:
	strh r0, [r2, 0x24]
_0811DC0C:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_811DBBC

	thumb_func_start sub_811DC14
sub_811DC14: @ 811DC14
	push {r4,lr}
	sub sp, 0x10
	str r0, [sp]
	ldr r3, _0811DC4C @ =0xffff0000
	ldr r0, [sp, 0x4]
	ands r0, r3
	movs r2, 0x80
	lsls r2, 4
	orrs r0, r2
	ldr r2, _0811DC50 @ =0x0000ffff
	ands r0, r2
	str r0, [sp, 0x4]
	str r1, [sp, 0x8]
	add r4, sp, 0x8
	ldr r0, [r4, 0x4]
	ands r0, r3
	str r0, [r4, 0x4]
	mov r0, sp
	bl LoadSpriteSheet
	adds r0, r4, 0
	bl LoadSpritePalette
	add sp, 0x10
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0811DC4C: .4byte 0xffff0000
_0811DC50: .4byte 0x0000ffff
	thumb_func_end sub_811DC14

	thumb_func_start sub_811DC54
sub_811DC54: @ 811DC54
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	mov r8, r2
	lsls r0, 16
	lsrs r7, r0, 16
	lsls r1, 24
	lsrs r6, r1, 24
	bl sub_811D0A8
	adds r5, r0, 0
	adds r0, r7, 0
	bl sub_811DD20
	adds r1, r0, 0
	str r1, [r5, 0x10]
	cmp r1, 0
	beq _0811DCD2
	adds r0, r5, 0
	adds r2, r6, 0
	bl sub_811E06C
	ldr r0, [r5, 0x10]
	adds r1, r6, 0
	bl StartSpriteAffineAnim
	ldr r1, [r5, 0x10]
	adds r1, 0x3E
	ldrb r0, [r1]
	movs r2, 0x4
	orrs r0, r2
	strb r0, [r1]
	ldr r0, _0811DCDC @ =sub_811DDA4
	movs r1, 0x2
	bl CreateTask
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r2, [r5, 0x10]
	adds r0, r4, 0
	movs r1, 0x4
	bl SetWordTaskArg
	ldr r0, _0811DCE0 @ =gTasks
	lsls r5, r4, 2
	adds r5, r4
	lsls r5, 3
	adds r5, r0
	strh r6, [r5, 0xC]
	ldr r1, _0811DCE4 @ =gUnknown_84599AA
	lsls r0, r6, 1
	adds r0, r1
	ldrh r0, [r0]
	bl sub_811DADC
	strh r0, [r5, 0xE]
	mov r0, r8
	strh r0, [r5, 0x14]
	adds r0, r7, 0
	bl sub_811DCE8
	strh r0, [r5, 0x1A]
_0811DCD2:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0811DCDC: .4byte sub_811DDA4
_0811DCE0: .4byte gTasks
_0811DCE4: .4byte gUnknown_84599AA
	thumb_func_end sub_811DC54

	thumb_func_start sub_811DCE8
sub_811DCE8: @ 811DCE8
	ldr r0, _0811DCEC @ =0x00007fff
	bx lr
	.align 2, 0
_0811DCEC: .4byte 0x00007fff
	thumb_func_end sub_811DCE8

	thumb_func_start sub_811DCF0
sub_811DCF0: @ 811DCF0
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	bl sub_811D0A8
	adds r5, r0, 0
	adds r0, r4, 0
	bl sub_811DD20
	str r0, [r5, 0x10]
	cmp r0, 0
	beq _0811DD1A
	movs r1, 0x3
	bl StartSpriteAffineAnim
	ldr r1, [r5, 0x10]
	adds r0, r5, 0
	movs r2, 0x3
	bl sub_811E06C
_0811DD1A:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_811DCF0

	thumb_func_start sub_811DD20
sub_811DD20: @ 811DD20
	push {r4,lr}
	adds r2, r0, 0
	lsls r2, 16
	lsrs r2, 16
	movs r0, 0x1
	movs r1, 0x1
	bl AddItemIconObject
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _0811DD88
	ldr r3, _0811DD7C @ =gSprites
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r4, r2, r3
	ldrb r0, [r4, 0x1]
	movs r1, 0x3
	orrs r0, r1
	strb r0, [r4, 0x1]
	ldrb r1, [r4, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r4, 0x5]
	adds r1, r4, 0
	adds r1, 0x43
	movs r0, 0x1
	strb r0, [r1]
	adds r0, r3, 0
	adds r0, 0x10
	adds r0, r2, r0
	ldr r1, _0811DD80 @ =gUnknown_8459A20
	str r1, [r0]
	adds r3, 0x1C
	adds r2, r3
	ldr r0, _0811DD84 @ =SpriteCallbackDummy
	str r0, [r2]
	adds r0, r4, 0
	bl InitSpriteAffineAnim
	adds r0, r4, 0
	b _0811DD8A
	.align 2, 0
_0811DD7C: .4byte gSprites
_0811DD80: .4byte gUnknown_8459A20
_0811DD84: .4byte SpriteCallbackDummy
_0811DD88:
	movs r0, 0
_0811DD8A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_811DD20

	thumb_func_start sub_811DD90
sub_811DD90: @ 811DD90
	push {lr}
	ldr r0, _0811DDA0 @ =sub_811DDA4
	bl FuncIsActiveTask
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_0811DDA0: .4byte sub_811DDA4
	thumb_func_end sub_811DD90

	thumb_func_start sub_811DDA4
sub_811DDA4: @ 811DDA4
	push {r4-r6,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	ldr r1, _0811DDD4 @ =gTasks+0x8
	adds r4, r0, r1
	adds r0, r6, 0
	movs r1, 0x4
	bl GetWordTaskArg
	adds r5, r0, 0
	movs r1, 0
	ldrsh r0, [r4, r1]
	cmp r0, 0x4
	bls _0811DDCA
	b _0811DF0C
_0811DDCA:
	lsls r0, 2
	ldr r1, _0811DDD8 @ =_0811DDDC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0811DDD4: .4byte gTasks+0x8
_0811DDD8: .4byte _0811DDDC
	.align 2, 0
_0811DDDC:
	.4byte _0811DDF0
	.4byte _0811DE2A
	.4byte _0811DE7C
	.4byte _0811DEA0
	.4byte _0811DEF0
_0811DDF0:
	ldrh r0, [r4, 0x2]
	adds r0, 0x1
	strh r0, [r4, 0x2]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x14
	bgt _0811DE00
	b _0811DF0C
_0811DE00:
	movs r0, 0
	strh r0, [r4, 0x2]
	movs r0, 0xBB
	bl PlaySE
	adds r2, r5, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	movs r2, 0x16
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bne _0811DE24
	bl sub_811E588
_0811DE24:
	movs r0, 0x1
	strh r0, [r4]
	b _0811DF0C
_0811DE2A:
	ldrh r0, [r4, 0x2]
	adds r0, 0x1
	strh r0, [r4, 0x2]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1E
	ble _0811DF0C
	movs r0, 0
	strh r0, [r4, 0x2]
	ldr r0, _0811DE78 @ =gUnknown_8459AA8
	str r0, [r5, 0x10]
	ldrb r1, [r4, 0x4]
	adds r0, r5, 0
	bl StartSpriteAffineAnim
	movs r0, 0x1
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 24
	movs r2, 0x80
	lsls r2, 9
	lsls r2, r0
	movs r1, 0x2
	negs r1, r1
	ldrh r0, [r4, 0x12]
	str r0, [sp]
	adds r0, r2, 0
	movs r2, 0
	movs r3, 0xC
	bl BeginNormalPaletteFade
	movs r0, 0x2
	strh r0, [r4]
	movs r0, 0xDA
	bl PlaySE
	b _0811DF0C
	.align 2, 0
_0811DE78: .4byte gUnknown_8459AA8
_0811DE7C:
	adds r0, r5, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _0811DF0C
	adds r2, r5, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	movs r0, 0x14
	strh r0, [r4, 0x14]
	movs r0, 0x3
	strh r0, [r4]
	b _0811DF0C
_0811DEA0:
	ldrh r0, [r4, 0x2]
	adds r0, 0x1
	strh r0, [r4, 0x2]
	lsls r0, 16
	asrs r0, 16
	movs r2, 0x14
	ldrsh r1, [r4, r2]
	cmp r0, r1
	ble _0811DF0C
	movs r0, 0
	strh r0, [r4, 0x2]
	movs r1, 0x16
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _0811DEC8
	adds r0, r6, 0
	adds r1, r4, 0
	adds r2, r5, 0
	bl sub_811DF14
_0811DEC8:
	movs r2, 0xE
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bne _0811DED6
	movs r0, 0xD2
	bl PlaySE
_0811DED6:
	ldrh r0, [r4, 0xE]
	adds r0, 0x1
	strh r0, [r4, 0xE]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x2
	ble _0811DEEA
	movs r0, 0x4
	strh r0, [r4]
	b _0811DF0C
_0811DEEA:
	movs r0, 0x8
	strh r0, [r4, 0x14]
	b _0811DF0C
_0811DEF0:
	movs r1, 0x10
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _0811DF0C
	movs r2, 0xC
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _0811DF06
	adds r0, r5, 0
	bl DestroySprite
_0811DF06:
	adds r0, r6, 0
	bl DestroyTask
_0811DF0C:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_811DDA4

	thumb_func_start sub_811DF14
sub_811DF14: @ 811DF14
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	adds r7, r1, 0
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	movs r0, 0x20
	ldrsh r5, [r2, r0]
	movs r1, 0x24
	ldrsh r0, [r2, r1]
	adds r5, r0
	subs r5, 0x4
	movs r0, 0x22
	ldrsh r4, [r2, r0]
	movs r1, 0x26
	ldrsh r0, [r2, r1]
	adds r4, r0
	subs r4, 0x4
	movs r0, 0x5
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x80
	lsls r1, 9
	lsls r1, r0
	ldrh r2, [r7, 0x12]
	adds r0, r1, 0
	movs r1, 0x10
	bl BlendPalettes
	movs r6, 0
	ldr r2, _0811DFB4 @ =gSprites
	mov r8, r2
	movs r0, 0x1C
	add r0, r8
	mov r10, r0
	lsls r5, 16
	lsls r4, 16
_0811DF68:
	ldr r0, _0811DFB8 @ =gUnknown_8459B30
	asrs r1, r5, 16
	asrs r2, r4, 16
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _0811DFA0
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	mov r2, r8
	adds r0, r1, r2
	lsls r2, r6, 4
	strh r2, [r0, 0x30]
	mov r2, r9
	strh r2, [r0, 0x3C]
	add r1, r10
	ldr r2, _0811DFBC @ =sub_811DFC0
	str r2, [r1]
	movs r1, 0x1
	bl StartSpriteAnim
	ldrh r0, [r7, 0x10]
	adds r0, 0x1
	strh r0, [r7, 0x10]
_0811DFA0:
	adds r6, 0x1
	cmp r6, 0xE
	ble _0811DF68
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0811DFB4: .4byte gSprites
_0811DFB8: .4byte gUnknown_8459B30
_0811DFBC: .4byte sub_811DFC0
	thumb_func_end sub_811DF14

	thumb_func_start sub_811DFC0
sub_811DFC0: @ 811DFC0
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r3, r4, 0
	adds r3, 0x2E
	ldrh r1, [r4, 0x2E]
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	cmp r0, 0xF
	bgt _0811E01C
	adds r0, r1, 0x1
	strh r0, [r4, 0x2E]
	ldrh r0, [r3, 0x2]
	adds r0, 0x7
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r3, 0x2]
	ldrh r0, [r3, 0x4]
	adds r0, 0x4
	strh r0, [r3, 0x4]
	movs r5, 0x4
	ldrsh r1, [r3, r5]
	ldr r2, _0811E018 @ =gSineTable
	movs r5, 0x2
	ldrsh r0, [r3, r5]
	adds r0, 0x40
	lsls r0, 1
	adds r0, r2
	movs r5, 0
	ldrsh r0, [r0, r5]
	muls r0, r1
	asrs r0, 8
	strh r0, [r4, 0x24]
	movs r0, 0x4
	ldrsh r1, [r3, r0]
	movs r5, 0x2
	ldrsh r0, [r3, r5]
	lsls r0, 1
	adds r0, r2
	movs r2, 0
	ldrsh r0, [r0, r2]
	muls r0, r1
	asrs r0, 8
	strh r0, [r4, 0x26]
	b _0811E036
	.align 2, 0
_0811E018: .4byte gSineTable
_0811E01C:
	ldr r2, _0811E03C @ =gTasks
	movs r5, 0xE
	ldrsh r1, [r3, r5]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldrh r1, [r0, 0x18]
	subs r1, 0x1
	strh r1, [r0, 0x18]
	adds r0, r4, 0
	bl DestroySprite
_0811E036:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0811E03C: .4byte gTasks
	thumb_func_end sub_811DFC0

	thumb_func_start sub_811E040
sub_811E040: @ 811E040
	push {lr}
	ldr r0, _0811E064 @ =sub_811DDA4
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0xFF
	beq _0811E05E
	ldr r0, _0811E068 @ =gTasks
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 3
	adds r1, r0
	movs r0, 0x1
	strh r0, [r1, 0x1E]
_0811E05E:
	pop {r0}
	bx r0
	.align 2, 0
_0811E064: .4byte sub_811DDA4
_0811E068: .4byte gTasks
	thumb_func_end sub_811E040

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
