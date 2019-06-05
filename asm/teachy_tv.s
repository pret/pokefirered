	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start TeachyTvGrassAnimationObjCallback
TeachyTvGrassAnimationObjCallback: @ 815BB6C
	push {r4,r5,lr}
	adds r3, r0, 0
	movs r0, 0x2E
	ldrsh r1, [r3, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	ldr r1, _0815BBA4 @ =gTasks+0x8
	adds r4, r0, r1
	movs r2, 0x2
	ldrsh r1, [r4, r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0815BBA8 @ =gSprites
	adds r5, r0, r1
	ldr r0, _0815BBAC @ =gUnknown_203F450
	ldr r0, [r0]
	ldr r1, _0815BBB0 @ =0x00004006
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _0815BBB4
	adds r0, r3, 0
	bl DestroySprite
	b _0815BC3A
	.align 2, 0
_0815BBA4: .4byte gTasks+0x8
_0815BBA8: .4byte gSprites
_0815BBAC: .4byte gUnknown_203F450
_0815BBB0: .4byte 0x00004006
_0815BBB4:
	adds r0, r3, 0
	adds r0, 0x2B
	ldrb r0, [r0]
	cmp r0, 0
	bne _0815BBD2
	adds r2, r3, 0
	adds r2, 0x42
	ldrb r0, [r2]
	movs r1, 0x40
	negs r1, r1
	ands r1, r0
	movs r0, 0x1
	orrs r1, r0
	strb r1, [r2]
	b _0815BBE0
_0815BBD2:
	adds r2, r3, 0
	adds r2, 0x42
	ldrb r1, [r2]
	movs r0, 0x40
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
_0815BBE0:
	ldrh r0, [r4, 0x8]
	ldrh r2, [r3, 0x24]
	adds r0, r2
	strh r0, [r3, 0x24]
	ldrh r0, [r4, 0xA]
	ldrh r1, [r3, 0x26]
	adds r0, r1
	strh r0, [r3, 0x26]
	adds r0, r3, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _0815BC3A
	adds r1, r3, 0
	adds r1, 0x43
	movs r0, 0
	strb r0, [r1]
	ldrh r1, [r3, 0x24]
	ldrh r0, [r5, 0x24]
	subs r1, r0
	ldrh r0, [r3, 0x26]
	ldrh r2, [r5, 0x26]
	subs r0, r2
	lsls r0, 16
	lsrs r0, 16
	lsls r1, 16
	movs r2, 0xF0
	lsls r2, 12
	adds r1, r2
	lsrs r1, 16
	cmp r1, 0x1E
	bhi _0815BC34
	lsls r0, 16
	asrs r1, r0, 16
	movs r0, 0x10
	negs r0, r0
	cmp r1, r0
	ble _0815BC34
	cmp r1, 0x17
	ble _0815BC3A
_0815BC34:
	adds r0, r3, 0
	bl DestroySprite
_0815BC3A:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end TeachyTvGrassAnimationObjCallback

	thumb_func_start TeachyTvGrassAnimationCheckIfNeedsToGenerateGrassObj
TeachyTvGrassAnimationCheckIfNeedsToGenerateGrassObj: @ 815BC40
	push {r4,r5,lr}
	lsls r1, 16
	lsrs r1, 16
	lsls r4, r0, 16
	cmp r4, 0
	blt _0815BC52
	lsls r1, 16
	cmp r1, 0
	bge _0815BC56
_0815BC52:
	movs r0, 0
	b _0815BC78
_0815BC56:
	ldr r3, _0815BC80 @ =gUnknown_84795C8
	ldr r0, _0815BC84 @ =gUnknown_203F450
	ldr r2, [r0]
	ldr r5, _0815BC88 @ =0x00004005
	adds r0, r2, r5
	asrs r1, 20
	ldrb r0, [r0]
	adds r1, r0
	lsls r1, 4
	ldr r0, _0815BC8C @ =0x00004004
	adds r2, r0
	asrs r0, r4, 20
	ldrb r2, [r2]
	adds r0, r2
	adds r1, r0
	adds r1, r3
	ldrb r0, [r1]
_0815BC78:
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0815BC80: .4byte gUnknown_84795C8
_0815BC84: .4byte gUnknown_203F450
_0815BC88: .4byte 0x00004005
_0815BC8C: .4byte 0x00004004
	thumb_func_end TeachyTvGrassAnimationCheckIfNeedsToGenerateGrassObj

	thumb_func_start TeachyTvPrepBattle
TeachyTvPrepBattle: @ 815BC90
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	ldr r1, _0815BCCC @ =gTasks+0x8
	adds r5, r0, r1
	bl TeachyTvFree
	ldr r1, _0815BCD0 @ =gSpecialVar_0x8004
	ldr r4, _0815BCD4 @ =gTeachyTV_StaticResources
	ldrb r0, [r4, 0x5]
	strh r0, [r1]
	ldr r1, _0815BCD8 @ =gMain
	ldr r0, _0815BCDC @ =sub_815BD58
	str r0, [r1, 0x8]
	bl SavePlayerParty
	bl sub_8159F40
	movs r0, 0
	bl PlayMapChosenOrBattleBGM
	ldrb r0, [r4, 0x5]
	cmp r0, 0
	bne _0815BCE0
	movs r0, 0x9
	b _0815BCE2
	.align 2, 0
_0815BCCC: .4byte gTasks+0x8
_0815BCD0: .4byte gSpecialVar_0x8004
_0815BCD4: .4byte gTeachyTV_StaticResources
_0815BCD8: .4byte gMain
_0815BCDC: .4byte sub_815BD58
_0815BCE0:
	movs r0, 0x8
_0815BCE2:
	strh r0, [r5, 0xC]
	movs r0, 0
	strh r0, [r5, 0xE]
	ldr r1, _0815BCFC @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r0, r1
	ldr r1, _0815BD00 @ =sub_815BD04
	str r1, [r0]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0815BCFC: .4byte gTasks
_0815BD00: .4byte sub_815BD04
	thumb_func_end TeachyTvPrepBattle

	thumb_func_start sub_815BD04
sub_815BD04: @ 815BD04
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _0815BD24 @ =gTasks+0x8
	adds r4, r0, r1
	movs r1, 0xE
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _0815BD28
	cmp r0, 0x1
	beq _0815BD36
	b _0815BD4C
	.align 2, 0
_0815BD24: .4byte gTasks+0x8
_0815BD28:
	ldrb r0, [r4, 0xC]
	bl sub_80D08B8
	ldrh r0, [r4, 0xE]
	adds r0, 0x1
	strh r0, [r4, 0xE]
	b _0815BD4C
_0815BD36:
	bl sub_80D08F8
	lsls r0, 24
	cmp r0, 0
	beq _0815BD4C
	ldr r0, _0815BD54 @ =sub_800FD9C
	bl SetMainCallback2
	adds r0, r5, 0
	bl DestroyTask
_0815BD4C:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0815BD54: .4byte sub_800FD9C
	thumb_func_end sub_815BD04

	thumb_func_start sub_815BD58
sub_815BD58: @ 815BD58
	push {lr}
	bl LoadPlayerParty
	ldr r0, _0815BD6C @ =gUnknown_2023E8A
	ldrb r0, [r0]
	cmp r0, 0x3
	bne _0815BD70
	bl sub_815AC20
	b _0815BD78
	.align 2, 0
_0815BD6C: .4byte gUnknown_2023E8A
_0815BD70:
	movs r0, 0x88
	lsls r0, 1
	bl PlayNewMapMusic
_0815BD78:
	bl sub_815ABFC
	pop {r0}
	bx r0
	thumb_func_end sub_815BD58

	thumb_func_start TeachyTvLoadBg3Map
TeachyTvLoadBg3Map: @ 815BD80
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x1C
	str r0, [sp, 0x4]
	movs r0, 0
	str r0, [sp, 0x10]
	ldr r1, _0815BE1C @ =Route1_Layout
	mov r8, r1
	movs r0, 0x80
	lsls r0, 4
	bl AllocZeroed
	adds r6, r0, 0
	movs r0, 0x80
	lsls r0, 8
	bl AllocZeroed
	str r0, [sp, 0x8]
	movs r0, 0x10
	bl Alloc
	str r0, [sp, 0xC]
	movs r1, 0xFF
	movs r2, 0x10
	bl memset
	mov r2, r8
	ldr r0, [r2, 0x10]
	movs r2, 0xA0
	lsls r2, 2
	ldr r1, [sp, 0x8]
	bl sub_815BF48
	mov r3, r8
	ldr r0, [r3, 0x14]
	ldr r2, [sp, 0x8]
	movs r3, 0xA0
	lsls r3, 7
	adds r1, r2, r3
	movs r2, 0xC0
	lsls r2, 1
	bl sub_815BF48
	movs r4, 0
_0815BDDE:
	movs r2, 0
	adds r0, r4, 0x6
	str r0, [sp, 0x18]
	lsls r1, r4, 4
	mov r10, r1
	lsls r3, r4, 6
	mov r9, r3
	adds r4, 0x1
	str r4, [sp, 0x14]
_0815BDF0:
	mov r1, r8
	ldr r0, [r1]
	ldr r3, [sp, 0x18]
	muls r0, r3
	ldr r1, [r1, 0xC]
	adds r0, r2, r0
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0, 0x10]
	ldr r3, _0815BE20 @ =0x000003ff
	adds r0, r3, 0
	adds r4, r0, 0
	ands r4, r1
	movs r3, 0
	mov r0, r10
	adds r1, r0, r2
	lsls r5, r2, 1
	adds r7, r2, 0x1
	cmp r3, r1
	bge _0815BE3C
	ldrh r0, [r6]
	b _0815BE34
	.align 2, 0
_0815BE1C: .4byte Route1_Layout
_0815BE20: .4byte 0x000003ff
_0815BE24:
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, r1
	bge _0815BE3C
	lsls r0, r3, 1
	adds r0, r6
	ldrh r0, [r0]
_0815BE34:
	cmp r0, 0
	beq _0815BE46
	cmp r0, r4
	bne _0815BE24
_0815BE3C:
	lsls r0, r3, 1
	adds r0, r6
	ldrh r0, [r0]
	cmp r0, 0
	bne _0815BE56
_0815BE46:
	lsls r0, r3, 1
	adds r0, r6
	strh r4, [r0]
	ldr r0, [sp, 0x10]
	adds r0, 0x1
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp, 0x10]
_0815BE56:
	mov r2, r9
	adds r1, r2, r5
	lsls r1, 1
	ldr r0, [sp, 0x4]
	adds r1, r0, r1
	str r3, [sp]
	mov r0, r8
	ldr r2, [sp, 0xC]
	adds r3, r4, 0
	bl sub_815BF70
	lsls r0, r7, 16
	lsrs r2, r0, 16
	cmp r2, 0xF
	bls _0815BDF0
	ldr r1, [sp, 0x14]
	lsls r0, r1, 16
	lsrs r4, r0, 16
	cmp r4, 0x8
	bls _0815BDDE
	ldr r2, [sp, 0x10]
	lsls r0, r2, 7
	bl Alloc
	adds r7, r0, 0
	movs r0, 0x80
	bl Alloc
	adds r5, r0, 0
	movs r4, 0
	ldr r3, [sp, 0x10]
	lsls r3, 23
	mov r9, r3
	ldr r0, [sp, 0x10]
	cmp r4, r0
	bcs _0815BF00
	ldr r1, _0815BECC @ =0x0000027f
	mov r10, r1
_0815BEA2:
	adds r0, r5, 0
	movs r1, 0
	movs r2, 0x80
	bl memset
	lsls r0, r4, 1
	adds r1, r0, r6
	ldrh r0, [r1]
	cmp r0, r10
	bhi _0815BED0
	mov r2, r8
	ldr r0, [r2, 0x10]
	ldrh r1, [r1]
	lsls r1, 4
	ldr r0, [r0, 0xC]
	adds r0, r1
	adds r1, r5, 0
	ldr r2, [sp, 0x8]
	bl sub_815BFF0
	b _0815BEE8
	.align 2, 0
_0815BECC: .4byte 0x0000027f
_0815BED0:
	mov r3, r8
	ldr r0, [r3, 0x14]
	ldrh r1, [r1]
	ldr r2, _0815BF44 @ =0xfffffd80
	adds r1, r2
	lsls r1, 4
	ldr r0, [r0, 0xC]
	adds r0, r1
	adds r1, r5, 0
	ldr r2, [sp, 0x8]
	bl sub_815BFF0
_0815BEE8:
	lsls r1, r4, 7
	adds r1, r7, r1
	adds r0, r5, 0
	movs r2, 0x20
	bl CpuFastSet
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	ldr r3, [sp, 0x10]
	cmp r4, r3
	bcc _0815BEA2
_0815BF00:
	mov r0, r9
	lsrs r2, r0, 16
	movs r0, 0x3
	adds r1, r7, 0
	movs r3, 0
	bl LoadBgTiles
	mov r0, r8
	ldr r1, [sp, 0xC]
	bl sub_815C230
	adds r0, r5, 0
	bl Free
	adds r0, r7, 0
	bl Free
	ldr r0, [sp, 0xC]
	bl Free
	ldr r0, [sp, 0x8]
	bl Free
	adds r0, r6, 0
	bl Free
	add sp, 0x1C
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0815BF44: .4byte 0xfffffd80
	thumb_func_end TeachyTvLoadBg3Map

	thumb_func_start sub_815BF48
sub_815BF48: @ 815BF48
	push {lr}
	adds r3, r0, 0
	lsls r2, 16
	lsrs r2, 16
	cmp r3, 0
	beq _0815BF6A
	ldrb r0, [r3]
	cmp r0, 0
	bne _0815BF64
	ldr r0, [r3, 0x4]
	lsls r2, 3
	bl CpuFastSet
	b _0815BF6A
_0815BF64:
	ldr r0, [r3, 0x4]
	bl LZDecompressWram
_0815BF6A:
	pop {r0}
	bx r0
	thumb_func_end sub_815BF48

	thumb_func_start sub_815BF70
sub_815BF70: @ 815BF70
	push {r4-r7,lr}
	adds r5, r0, 0
	adds r7, r1, 0
	adds r6, r2, 0
	ldr r0, [sp, 0x14]
	lsls r3, 16
	lsrs r1, r3, 16
	lsls r0, 16
	lsrs r4, r0, 16
	ldr r0, _0815BF8C @ =0x0000027f
	cmp r1, r0
	bhi _0815BF90
	ldr r0, [r5, 0x10]
	b _0815BF96
	.align 2, 0
_0815BF8C: .4byte 0x0000027f
_0815BF90:
	ldr r0, [r5, 0x14]
	ldr r2, _0815BFEC @ =0xfffffd80
	adds r1, r2
_0815BF96:
	lsls r1, 4
	ldr r0, [r0, 0xC]
	adds r5, r0, r1
	ldrh r1, [r5]
	adds r0, r6, 0
	bl sub_815C1F0
	lsls r0, 12
	lsls r4, 2
	adds r0, r4
	strh r0, [r7]
	ldrh r1, [r5, 0x2]
	adds r0, r6, 0
	bl sub_815C1F0
	lsls r0, 12
	adds r0, r4
	adds r0, 0x1
	strh r0, [r7, 0x2]
	ldrh r1, [r5, 0x4]
	adds r0, r6, 0
	bl sub_815C1F0
	adds r1, r7, 0
	adds r1, 0x40
	lsls r0, 12
	adds r0, r4
	adds r0, 0x2
	strh r0, [r1]
	ldrh r1, [r5, 0x6]
	adds r0, r6, 0
	bl sub_815C1F0
	adds r1, r7, 0
	adds r1, 0x42
	lsls r0, 12
	adds r0, r4
	adds r0, 0x3
	strh r0, [r1]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0815BFEC: .4byte 0xfffffd80
	thumb_func_end sub_815BF70

	thumb_func_start sub_815BFF0
sub_815BFF0: @ 815BFF0
	push {r4-r6,lr}
	mov r6, r10
	mov r5, r9
	mov r4, r8
	push {r4-r6}
	mov r8, r0
	mov r9, r1
	adds r5, r2, 0
	ldrh r2, [r0]
	ldr r4, _0815C0D0 @ =0x000003ff
	adds r1, r4, 0
	ands r1, r2
	lsls r1, 5
	adds r1, r5, r1
	lsrs r2, 10
	movs r6, 0x3
	ands r2, r6
	mov r0, r9
	bl sub_815C0D4
	mov r0, r8
	ldrh r2, [r0, 0x8]
	adds r1, r4, 0
	ands r1, r2
	lsls r1, 5
	adds r1, r5, r1
	lsrs r2, 10
	ands r2, r6
	mov r0, r9
	bl sub_815C0D4
	movs r0, 0x20
	add r0, r9
	mov r10, r0
	mov r0, r8
	ldrh r2, [r0, 0x2]
	adds r1, r4, 0
	ands r1, r2
	lsls r1, 5
	adds r1, r5, r1
	lsrs r2, 10
	ands r2, r6
	mov r0, r10
	bl sub_815C0D4
	mov r0, r8
	ldrh r2, [r0, 0xA]
	adds r1, r4, 0
	ands r1, r2
	lsls r1, 5
	adds r1, r5, r1
	lsrs r2, 10
	ands r2, r6
	mov r0, r10
	bl sub_815C0D4
	movs r0, 0x40
	add r0, r9
	mov r10, r0
	mov r0, r8
	ldrh r2, [r0, 0x4]
	adds r1, r4, 0
	ands r1, r2
	lsls r1, 5
	adds r1, r5, r1
	lsrs r2, 10
	ands r2, r6
	mov r0, r10
	bl sub_815C0D4
	mov r0, r8
	ldrh r2, [r0, 0xC]
	adds r1, r4, 0
	ands r1, r2
	lsls r1, 5
	adds r1, r5, r1
	lsrs r2, 10
	ands r2, r6
	mov r0, r10
	bl sub_815C0D4
	movs r0, 0x60
	add r9, r0
	mov r0, r8
	ldrh r2, [r0, 0x6]
	adds r1, r4, 0
	ands r1, r2
	lsls r1, 5
	adds r1, r5, r1
	lsrs r2, 10
	ands r2, r6
	mov r0, r9
	bl sub_815C0D4
	mov r0, r8
	ldrh r2, [r0, 0xE]
	ands r4, r2
	lsls r4, 5
	adds r5, r4
	lsrs r2, 10
	ands r2, r6
	mov r0, r9
	adds r1, r5, 0
	bl sub_815C0D4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0815C0D0: .4byte 0x000003ff
	thumb_func_end sub_815BFF0

	thumb_func_start sub_815C0D4
sub_815C0D4: @ 815C0D4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	mov r9, r0
	adds r4, r1, 0
	lsls r2, 24
	lsrs r2, 24
	mov r10, r2
	movs r0, 0x20
	bl AllocZeroed
	adds r6, r0, 0
	movs r0, 0x20
	bl AllocZeroed
	str r0, [sp]
	adds r0, r4, 0
	adds r1, r6, 0
	movs r2, 0x8
	bl CpuFastSet
	movs r0, 0x1
	mov r1, r10
	ands r0, r1
	cmp r0, 0
	beq _0815C15A
	movs r5, 0
	movs r7, 0xF
	mov r12, r7
	movs r0, 0xF0
	mov r8, r0
_0815C118:
	movs r3, 0
	lsls r4, r5, 2
_0815C11C:
	subs r0, r3, 0x3
	subs r0, r4, r0
	adds r0, r6, r0
	ldrb r1, [r0]
	adds r2, r4, r3
	ldr r7, [sp]
	adds r2, r7, r2
	adds r0, r1, 0
	mov r7, r12
	ands r0, r7
	lsls r0, 4
	mov r7, r8
	ands r1, r7
	lsrs r1, 4
	adds r0, r1
	strb r0, [r2]
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x3
	bls _0815C11C
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x7
	bls _0815C118
	ldr r0, [sp]
	adds r1, r6, 0
	movs r2, 0x8
	bl CpuFastSet
_0815C15A:
	movs r0, 0x2
	mov r1, r10
	ands r0, r1
	cmp r0, 0
	beq _0815C18E
	movs r5, 0
_0815C166:
	lsls r0, r5, 2
	ldr r7, [sp]
	adds r0, r7
	movs r1, 0x7
	subs r1, r5
	lsls r1, 2
	adds r1, r6
	movs r2, 0x4
	bl memcpy
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x7
	bls _0815C166
	ldr r0, [sp]
	adds r1, r6, 0
	movs r2, 0x8
	bl CpuFastSet
_0815C18E:
	movs r5, 0
	movs r0, 0xF0
	mov r8, r0
	movs r1, 0xF
	mov r12, r1
_0815C198:
	adds r4, r6, r5
	ldrb r0, [r4]
	mov r3, r8
	ands r3, r0
	cmp r3, 0
	beq _0815C1B2
	mov r7, r9
	adds r2, r7, r5
	ldrb r1, [r2]
	mov r0, r12
	ands r0, r1
	adds r0, r3
	strb r0, [r2]
_0815C1B2:
	ldrb r0, [r4]
	mov r3, r12
	ands r3, r0
	cmp r3, 0
	beq _0815C1CA
	mov r0, r9
	adds r2, r0, r5
	ldrb r1, [r2]
	mov r0, r8
	ands r0, r1
	adds r0, r3
	strb r0, [r2]
_0815C1CA:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x1F
	bls _0815C198
	ldr r0, [sp]
	bl Free
	adds r0, r6, 0
	bl Free
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_815C0D4

	thumb_func_start sub_815C1F0
sub_815C1F0: @ 815C1F0
	push {r4,lr}
	adds r4, r0, 0
	lsls r1, 16
	lsrs r1, 28
	movs r3, 0
	ldrb r0, [r4]
	cmp r0, r1
	beq _0815C220
	cmp r0, 0xFF
	bne _0815C208
	strb r1, [r4]
	b _0815C220
_0815C208:
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0xF
	bhi _0815C220
	adds r2, r4, r3
	ldrb r0, [r2]
	cmp r0, r1
	beq _0815C220
	cmp r0, 0xFF
	bne _0815C208
	strb r1, [r2]
_0815C220:
	movs r0, 0xF
	subs r0, r3
	lsls r0, 16
	lsrs r0, 16
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_815C1F0

	thumb_func_start sub_815C230
sub_815C230: @ 815C230
	push {r4-r6,lr}
	adds r6, r0, 0
	adds r5, r1, 0
	movs r4, 0
	ldrb r0, [r5]
	cmp r0, 0xFF
	beq _0815C274
_0815C23E:
	adds r1, r5, r4
	ldrb r0, [r1]
	cmp r0, 0x6
	bls _0815C24A
	ldr r0, [r6, 0x14]
	b _0815C24C
_0815C24A:
	ldr r0, [r6, 0x10]
_0815C24C:
	ldrb r1, [r1]
	lsls r1, 5
	ldr r0, [r0, 0x8]
	adds r0, r1
	movs r1, 0xF
	subs r1, r4
	lsls r1, 20
	lsrs r1, 16
	movs r2, 0x20
	bl LoadPalette
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0xF
	bhi _0815C274
	adds r0, r5, r4
	ldrb r0, [r0]
	cmp r0, 0xFF
	bne _0815C23E
_0815C274:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_815C230

	.align 2, 0 @ Don't pad with nop.
