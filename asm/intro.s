	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_80ED188
sub_80ED188: @ 80ED188
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	adds r7, r0, 0
	ldrb r0, [r7, 0x4]
	cmp r0, 0x6
	bls _080ED19A
	b _080ED3F6
_080ED19A:
	lsls r0, 2
	ldr r1, _080ED1A4 @ =_080ED1A8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080ED1A4: .4byte _080ED1A8
	.align 2, 0
_080ED1A8:
	.4byte _080ED1C4
	.4byte _080ED214
	.4byte _080ED32C
	.4byte _080ED350
	.4byte _080ED360
	.4byte _080ED3BC
	.4byte _080ED3D2
_080ED1C4:
	movs r0, 0x2
	negs r0, r0
	ldr r2, _080ED204 @ =0x00007fff
	movs r1, 0x10
	bl BlendPalettes
	ldr r1, _080ED208 @ =gUnknown_840BB90
	movs r0, 0
	movs r2, 0x4
	bl InitBgsFromTemplates
	ldr r1, _080ED20C @ =gUnknown_8405414
	movs r0, 0
	str r0, [sp]
	movs r0, 0x3
	movs r2, 0
	movs r3, 0
	bl DecompressAndCopyTileDataToVram
	ldr r1, _080ED210 @ =gUnknown_8405890
	movs r0, 0x1
	str r0, [sp]
	movs r0, 0x3
	movs r2, 0
	movs r3, 0
	bl DecompressAndCopyTileDataToVram
	movs r0, 0x3
	bl ShowBg
	b _080ED3CA
	.align 2, 0
_080ED204: .4byte 0x00007fff
_080ED208: .4byte gUnknown_840BB90
_080ED20C: .4byte gUnknown_8405414
_080ED210: .4byte gUnknown_8405890
_080ED214:
	bl FreeTempTileDataBuffersIfPossible
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0
	beq _080ED222
	b _080ED3F6
_080ED222:
	movs r0, 0
	bl SetVBlankCallback
	ldr r0, _080ED2FC @ =gUnknown_84053B4
	movs r1, 0x10
	movs r2, 0x60
	bl LoadPalette
	ldr r0, _080ED300 @ =gUnknown_8405DA4
	movs r1, 0x50
	movs r2, 0x20
	bl LoadPalette
	ldr r0, _080ED304 @ =gUnknown_8406634
	movs r1, 0x60
	movs r2, 0x20
	bl LoadPalette
	movs r5, 0x2
	negs r5, r5
	ldr r0, _080ED308 @ =0x00007fff
	mov r8, r0
	adds r0, r5, 0
	movs r1, 0x10
	mov r2, r8
	bl BlendPalettes
	ldr r1, _080ED30C @ =gUnknown_8405B28
	str r6, [sp]
	movs r0, 0
	movs r2, 0
	movs r3, 0
	bl DecompressAndCopyTileDataToVram
	ldr r1, _080ED310 @ =gUnknown_8405CDC
	movs r4, 0x1
	str r4, [sp]
	movs r0, 0
	movs r2, 0
	movs r3, 0
	bl DecompressAndCopyTileDataToVram
	ldr r1, _080ED314 @ =gUnknown_8406654
	str r6, [sp]
	movs r0, 0x1
	movs r2, 0
	movs r3, 0
	bl DecompressAndCopyTileDataToVram
	ldr r1, _080ED318 @ =gUnknown_84071D0
	str r4, [sp]
	movs r0, 0x1
	movs r2, 0
	movs r3, 0
	bl DecompressAndCopyTileDataToVram
	ldr r1, _080ED31C @ =gUnknown_8405DC4
	str r6, [sp]
	movs r0, 0x2
	movs r2, 0
	movs r3, 0
	bl DecompressAndCopyTileDataToVram
	ldr r1, _080ED320 @ =gUnknown_840644C
	str r4, [sp]
	movs r0, 0x2
	movs r2, 0
	movs r3, 0
	bl DecompressAndCopyTileDataToVram
	bl ResetBgPositions
	movs r0, 0
	bl ShowBg
	movs r0, 0x1
	bl HideBg
	movs r0, 0x2
	bl HideBg
	movs r1, 0xE7
	lsls r1, 9
	movs r0, 0x2
	movs r2, 0
	bl ChangeBgY
	movs r1, 0xA0
	lsls r1, 6
	movs r0, 0x1
	movs r2, 0
	bl ChangeBgY
	ldr r0, _080ED324 @ =sub_80ED40C
	movs r1, 0
	bl CreateTask
	adds r0, r7, 0
	bl sub_80ED444
	adds r0, r5, 0
	movs r1, 0x10
	mov r2, r8
	bl BlendPalettes
	ldr r0, _080ED328 @ =sub_80EC9EC
	bl SetVBlankCallback
	b _080ED3CA
	.align 2, 0
_080ED2FC: .4byte gUnknown_84053B4
_080ED300: .4byte gUnknown_8405DA4
_080ED304: .4byte gUnknown_8406634
_080ED308: .4byte 0x00007fff
_080ED30C: .4byte gUnknown_8405B28
_080ED310: .4byte gUnknown_8405CDC
_080ED314: .4byte gUnknown_8406654
_080ED318: .4byte gUnknown_84071D0
_080ED31C: .4byte gUnknown_8405DC4
_080ED320: .4byte gUnknown_840644C
_080ED324: .4byte sub_80ED40C
_080ED328: .4byte sub_80EC9EC
_080ED32C:
	bl FreeTempTileDataBuffersIfPossible
	lsls r0, 24
	cmp r0, 0
	bne _080ED3F6
	movs r1, 0x2
	negs r1, r1
	ldr r0, _080ED34C @ =0x00007fff
	str r0, [sp]
	adds r0, r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	b _080ED3CA
	.align 2, 0
_080ED34C: .4byte 0x00007fff
_080ED350:
	ldr r0, _080ED35C @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	b _080ED3C0
	.align 2, 0
_080ED35C: .4byte gPaletteFade
_080ED360:
	ldrh r0, [r7, 0x12]
	adds r0, 0x1
	strh r0, [r7, 0x12]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x3B
	bls _080ED3F6
	movs r0, 0
	strh r0, [r7, 0x12]
	ldr r0, _080ED3B4 @ =sub_80ED40C
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
	adds r0, r7, 0
	bl sub_80ED4A0
	ldr r0, _080ED3B8 @ =sub_80ED428
	movs r1, 0
	bl CreateTask
	movs r1, 0x80
	lsls r1, 9
	movs r0, 0x3
	movs r2, 0
	bl ChangeBgY
	movs r0, 0
	bl HideBg
	movs r0, 0x3
	bl ShowBg
	movs r0, 0x1
	bl ShowBg
	movs r0, 0x2
	bl ShowBg
	b _080ED3CA
	.align 2, 0
_080ED3B4: .4byte sub_80ED40C
_080ED3B8: .4byte sub_80ED428
_080ED3BC:
	bl IsDma3ManagerBusyWithBgCopy
_080ED3C0:
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	bne _080ED3F6
	strh r0, [r7, 0x12]
_080ED3CA:
	ldrb r0, [r7, 0x4]
	adds r0, 0x1
	strb r0, [r7, 0x4]
	b _080ED3F6
_080ED3D2:
	ldrh r0, [r7, 0x12]
	adds r0, 0x1
	strh r0, [r7, 0x12]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x3B
	bls _080ED3F6
	ldr r0, _080ED404 @ =sub_80ED428
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
	ldr r1, _080ED408 @ =sub_80ED4C0
	adds r0, r7, 0
	bl sub_80ECAA8
_080ED3F6:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080ED404: .4byte sub_80ED428
_080ED408: .4byte sub_80ED4C0
	thumb_func_end sub_80ED188

	thumb_func_start sub_80ED40C
sub_80ED40C: @ 80ED40C
	push {lr}
	movs r0, 0x3
	movs r1, 0xE0
	movs r2, 0x2
	bl ChangeBgX
	movs r1, 0x88
	lsls r1, 1
	movs r0, 0
	movs r2, 0x1
	bl ChangeBgX
	pop {r0}
	bx r0
	thumb_func_end sub_80ED40C

	thumb_func_start sub_80ED428
sub_80ED428: @ 80ED428
	push {lr}
	movs r0, 0x2
	movs r1, 0x20
	movs r2, 0x1
	bl ChangeBgY
	movs r0, 0x1
	movs r1, 0x24
	movs r2, 0x2
	bl ChangeBgY
	pop {r0}
	bx r0
	thumb_func_end sub_80ED428

	thumb_func_start sub_80ED444
sub_80ED444: @ 80ED444
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0
	str r0, [r4, 0x1C]
	str r0, [r4, 0x20]
	ldr r0, _080ED494 @ =gUnknown_840BDA8
	movs r1, 0xA8
	movs r2, 0x50
	movs r3, 0xB
	bl CreateSprite
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x40
	beq _080ED46E
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080ED498 @ =gSprites
	adds r0, r1
	str r0, [r4, 0x20]
_080ED46E:
	ldr r0, _080ED49C @ =gUnknown_840BDC0
	movs r1, 0x48
	movs r2, 0x50
	movs r3, 0xC
	bl CreateSprite
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x40
	beq _080ED48E
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080ED498 @ =gSprites
	adds r0, r1
	str r0, [r4, 0x1C]
_080ED48E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080ED494: .4byte gUnknown_840BDA8
_080ED498: .4byte gSprites
_080ED49C: .4byte gUnknown_840BDC0
	thumb_func_end sub_80ED444

	thumb_func_start sub_80ED4A0
sub_80ED4A0: @ 80ED4A0
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, [r4, 0x1C]
	cmp r0, 0
	beq _080ED4AE
	bl DestroySprite
_080ED4AE:
	ldr r0, [r4, 0x20]
	cmp r0, 0
	beq _080ED4B8
	bl DestroySprite
_080ED4B8:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80ED4A0

	thumb_func_start sub_80ED4C0
sub_80ED4C0: @ 80ED4C0
	push {r4,r5,lr}
	sub sp, 0x4
	adds r5, r0, 0
	ldrb r4, [r5, 0x4]
	cmp r4, 0x1
	beq _080ED59C
	cmp r4, 0x1
	bgt _080ED4D6
	cmp r4, 0
	beq _080ED4E4
	b _080ED68A
_080ED4D6:
	cmp r4, 0x2
	bne _080ED4DC
	b _080ED5FC
_080ED4DC:
	cmp r4, 0x3
	bne _080ED4E2
	b _080ED658
_080ED4E2:
	b _080ED68A
_080ED4E4:
	ldr r0, _080ED584 @ =gUnknown_8407430
	movs r1, 0x10
	movs r2, 0x40
	bl LoadPalette
	ldr r0, _080ED588 @ =gUnknown_8405DA4
	movs r1, 0x50
	movs r2, 0x20
	bl LoadPalette
	movs r0, 0x2
	negs r0, r0
	ldr r2, _080ED58C @ =0x00007fff
	movs r1, 0x10
	bl BlendPalettes
	ldr r1, _080ED590 @ =gUnknown_840BBA0
	movs r0, 0
	movs r2, 0x2
	bl InitBgsFromTemplates
	ldr r1, _080ED594 @ =gUnknown_8407470
	str r4, [sp]
	movs r0, 0x1
	movs r2, 0
	movs r3, 0
	bl DecompressAndCopyTileDataToVram
	ldr r1, _080ED598 @ =gUnknown_8407A50
	movs r0, 0x1
	str r0, [sp]
	movs r2, 0
	movs r3, 0
	bl DecompressAndCopyTileDataToVram
	movs r0, 0x1
	bl ShowBg
	movs r0, 0
	bl HideBg
	movs r0, 0x2
	bl HideBg
	movs r0, 0x3
	bl HideBg
	bl ResetBgPositions
	ldrb r0, [r5, 0x4]
	adds r0, 0x1
	strb r0, [r5, 0x4]
	movs r1, 0x80
	lsls r1, 6
	movs r0, 0
	bl SetGpuRegBits
	movs r0, 0x48
	movs r1, 0x12
	bl SetGpuRegBits
	movs r0, 0x48
	movs r1, 0x1
	bl ClearGpuRegBits
	movs r0, 0x4A
	movs r1, 0
	bl SetGpuRegBits
	movs r1, 0x82
	lsls r1, 6
	movs r0, 0x44
	bl SetGpuReg
	movs r0, 0x40
	movs r1, 0x78
	bl SetGpuReg
	b _080ED68A
	.align 2, 0
_080ED584: .4byte gUnknown_8407430
_080ED588: .4byte gUnknown_8405DA4
_080ED58C: .4byte 0x00007fff
_080ED590: .4byte gUnknown_840BBA0
_080ED594: .4byte gUnknown_8407470
_080ED598: .4byte gUnknown_8407A50
_080ED59C:
	bl FreeTempTileDataBuffersIfPossible
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	bne _080ED68A
	ldr r1, _080ED5EC @ =gUnknown_8407B9C
	str r0, [sp]
	movs r0, 0
	movs r2, 0
	movs r3, 0
	bl DecompressAndCopyTileDataToVram
	ldr r1, _080ED5F0 @ =gUnknown_8408D98
	str r4, [sp]
	movs r0, 0
	movs r2, 0
	movs r3, 0
	bl DecompressAndCopyTileDataToVram
	ldr r1, _080ED5F4 @ =gUnknown_203AB00
	movs r0, 0x4
	strh r0, [r1]
	ldr r1, _080ED5F8 @ =gUnknown_203AB02
	movs r0, 0x34
	strh r0, [r1]
	movs r1, 0xC0
	lsls r1, 5
	movs r0, 0
	movs r2, 0
	bl ChangeBgX
	movs r1, 0xF8
	lsls r1, 9
	movs r0, 0
	movs r2, 0
	bl ChangeBgY
	b _080ED642
	.align 2, 0
_080ED5EC: .4byte gUnknown_8407B9C
_080ED5F0: .4byte gUnknown_8408D98
_080ED5F4: .4byte gUnknown_203AB00
_080ED5F8: .4byte gUnknown_203AB02
_080ED5FC:
	bl FreeTempTileDataBuffersIfPossible
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _080ED68A
	movs r0, 0x2
	negs r0, r0
	ldr r2, _080ED64C @ =0x00007fff
	movs r1, 0
	bl BlendPalettes
	movs r0, 0
	bl ShowBg
	ldr r0, _080ED650 @ =sub_80ED714
	movs r1, 0
	bl CreateTask
	adds r0, r5, 0
	bl sub_80EE4F8
	ldr r0, [r5, 0x18]
	movs r1, 0
	movs r2, 0xB4
	movs r3, 0x34
	bl sub_80EE528
	ldr r0, _080ED654 @ =sub_80EE200
	movs r1, 0
	bl CreateTask
	bl sub_80ED6D8
	strh r4, [r5, 0x12]
_080ED642:
	ldrb r0, [r5, 0x4]
	adds r0, 0x1
	strb r0, [r5, 0x4]
	b _080ED68A
	.align 2, 0
_080ED64C: .4byte 0x00007fff
_080ED650: .4byte sub_80ED714
_080ED654: .4byte sub_80EE200
_080ED658:
	ldrh r0, [r5, 0x12]
	adds r0, 0x1
	strh r0, [r5, 0x12]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x10
	bne _080ED66C
	adds r0, r5, 0
	bl sub_80ED7D4
_080ED66C:
	adds r0, r5, 0
	bl sub_80EE5C8
	cmp r0, 0
	bne _080ED68A
	ldr r0, _080ED694 @ =sub_80EE200
	bl FuncIsActiveTask
	lsls r0, 24
	cmp r0, 0
	bne _080ED68A
	ldr r1, _080ED698 @ =sub_80ED898
	adds r0, r5, 0
	bl sub_80ECAA8
_080ED68A:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080ED694: .4byte sub_80EE200
_080ED698: .4byte sub_80ED898
	thumb_func_end sub_80ED4C0

	thumb_func_start sub_80ED69C
sub_80ED69C: @ 80ED69C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080ED6C4 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r2, 0x8
	ldrsh r0, [r1, r2]
	cmp r0, 0
	bne _080ED6C8
	movs r1, 0x80
	lsls r1, 3
	movs r0, 0x1
	movs r2, 0x2
	bl ChangeBgX
	b _080ED6D2
	.align 2, 0
_080ED6C4: .4byte gTasks
_080ED6C8:
	movs r0, 0x1
	movs r1, 0x20
	movs r2, 0x2
	bl ChangeBgX
_080ED6D2:
	pop {r0}
	bx r0
	thumb_func_end sub_80ED69C

	thumb_func_start sub_80ED6D8
sub_80ED6D8: @ 80ED6D8
	push {lr}
	ldr r0, _080ED6E8 @ =sub_80ED69C
	movs r1, 0
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_080ED6E8: .4byte sub_80ED69C
	thumb_func_end sub_80ED6D8

	thumb_func_start sub_80ED6EC
sub_80ED6EC: @ 80ED6EC
	push {lr}
	ldr r0, _080ED70C @ =sub_80ED69C
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080ED710 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r0, 0x1
	strh r0, [r1, 0x8]
	pop {r0}
	bx r0
	.align 2, 0
_080ED70C: .4byte sub_80ED69C
_080ED710: .4byte gTasks
	thumb_func_end sub_80ED6EC

	thumb_func_start sub_80ED714
sub_80ED714: @ 80ED714
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _080ED75C @ =gTasks+0x8
	adds r2, r1, r0
	movs r0, 0
	ldrsh r1, [r2, r0]
	cmp r1, 0
	bne _080ED758
	ldrh r0, [r2, 0x2]
	adds r0, 0x1
	strh r0, [r2, 0x2]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1D
	ble _080ED758
	strh r1, [r2, 0x2]
	ldrh r0, [r2, 0x4]
	movs r1, 0x1
	eors r0, r1
	strh r0, [r2, 0x4]
	movs r0, 0x4
	ldrsh r1, [r2, r0]
	lsls r1, 15
	movs r0, 0xF8
	lsls r0, 9
	adds r1, r0
	movs r0, 0
	movs r2, 0
	bl ChangeBgY
_080ED758:
	pop {r0}
	bx r0
	.align 2, 0
_080ED75C: .4byte gTasks+0x8
	thumb_func_end sub_80ED714

	thumb_func_start sub_80ED760
sub_80ED760: @ 80ED760
	push {lr}
	ldr r0, _080ED780 @ =sub_80ED714
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080ED784 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r0, 0x1
	strh r0, [r1, 0x8]
	pop {r0}
	bx r0
	.align 2, 0
_080ED780: .4byte sub_80ED714
_080ED784: .4byte gTasks
	thumb_func_end sub_80ED760

	thumb_func_start sub_80ED788
sub_80ED788: @ 80ED788
	push {lr}
	ldr r0, _080ED7A8 @ =sub_80ED714
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080ED7AC @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r0, 0
	strh r0, [r1, 0x8]
	pop {r0}
	bx r0
	.align 2, 0
_080ED7A8: .4byte sub_80ED714
_080ED7AC: .4byte gTasks
	thumb_func_end sub_80ED788

	thumb_func_start sub_80ED7B0
sub_80ED7B0: @ 80ED7B0
	push {lr}
	ldr r0, _080ED7CC @ =sub_80ED714
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080ED7D0 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldrb r0, [r1, 0xC]
	pop {r1}
	bx r1
	.align 2, 0
_080ED7CC: .4byte sub_80ED714
_080ED7D0: .4byte gTasks
	thumb_func_end sub_80ED7B0

	thumb_func_start sub_80ED7D4
sub_80ED7D4: @ 80ED7D4
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _080ED800 @ =gUnknown_840BDFC
	movs r1, 0x94
	lsls r1, 1
	movs r2, 0x70
	movs r3, 0x7
	bl CreateSprite
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x40
	beq _080ED80C
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080ED804 @ =gSprites
	adds r0, r1
	str r0, [r4, 0x24]
	ldr r1, _080ED808 @ =sub_80ED818
	str r1, [r0, 0x1C]
	b _080ED810
	.align 2, 0
_080ED800: .4byte gUnknown_840BDFC
_080ED804: .4byte gSprites
_080ED808: .4byte sub_80ED818
_080ED80C:
	movs r0, 0
	str r0, [r4, 0x24]
_080ED810:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80ED7D4

	thumb_func_start sub_80ED818
sub_80ED818: @ 80ED818
	push {r4,lr}
	adds r2, r0, 0
	adds r4, r2, 0
	adds r4, 0x2E
	movs r1, 0x2E
	ldrsh r0, [r2, r1]
	cmp r0, 0x1
	beq _080ED848
	cmp r0, 0x1
	bgt _080ED832
	cmp r0, 0
	beq _080ED838
	b _080ED892
_080ED832:
	cmp r0, 0x2
	beq _080ED866
	b _080ED892
_080ED838:
	ldrh r0, [r2, 0x20]
	lsls r0, 5
	strh r0, [r4, 0x2]
	movs r0, 0xA0
	strh r0, [r4, 0x4]
	ldrh r0, [r2, 0x2E]
	adds r0, 0x1
	strh r0, [r2, 0x2E]
_080ED848:
	ldrh r0, [r4, 0x2]
	ldrh r1, [r4, 0x4]
	subs r0, r1
	strh r0, [r4, 0x2]
	lsls r0, 16
	asrs r0, 21
	strh r0, [r2, 0x20]
	cmp r0, 0x34
	bgt _080ED892
	bl sub_80ED6EC
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	b _080ED892
_080ED866:
	ldrh r0, [r4, 0x2]
	subs r0, 0x20
	strh r0, [r4, 0x2]
	lsls r0, 16
	asrs r0, 21
	strh r0, [r2, 0x20]
	movs r1, 0x20
	negs r1, r1
	cmp r0, r1
	bgt _080ED892
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r0, [r3]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r3]
	ldrh r0, [r2, 0x2E]
	adds r0, 0x1
	strh r0, [r2, 0x2E]
	adds r0, r2, 0
	bl DestroySprite
_080ED892:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80ED818

	thumb_func_start sub_80ED898
sub_80ED898: @ 80ED898
	push {r4,r5,lr}
	sub sp, 0x8
	adds r4, r0, 0
	ldrb r0, [r4, 0x4]
	cmp r0, 0xF
	bls _080ED8A6
	b _080EDA98
_080ED8A6:
	lsls r0, 2
	ldr r1, _080ED8B0 @ =_080ED8B4
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080ED8B0: .4byte _080ED8B4
	.align 2, 0
_080ED8B4:
	.4byte _080ED8F4
	.4byte _080ED8F8
	.4byte _080ED910
	.4byte _080ED918
	.4byte _080ED936
	.4byte _080ED946
	.4byte _080ED95E
	.4byte _080ED97C
	.4byte _080ED998
	.4byte _080ED9A0
	.4byte _080ED9BA
	.4byte _080ED9D2
	.4byte _080ED9DC
	.4byte _080EDA1C
	.4byte _080EDA5C
	.4byte _080EDA7C
_080ED8F4:
	movs r0, 0
	b _080EDA6C
_080ED8F8:
	ldrh r0, [r4, 0x12]
	adds r0, 0x1
	strh r0, [r4, 0x12]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1E
	bhi _080ED908
	b _080EDAC4
_080ED908:
	adds r0, r4, 0
	bl sub_80EE5E4
	b _080EDA6E
_080ED910:
	adds r0, r4, 0
	bl sub_80EE850
	b _080EDA64
_080ED918:
	ldrh r0, [r4, 0x12]
	adds r0, 0x1
	strh r0, [r4, 0x12]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1E
	bhi _080ED928
	b _080EDAC4
_080ED928:
	bl sub_80ED760
	adds r0, r4, 0
	bl sub_80EDF94
	movs r0, 0
	b _080EDA6C
_080ED936:
	ldrb r0, [r4, 0x6]
	cmp r0, 0
	bne _080ED93E
	b _080EDAC4
_080ED93E:
	adds r0, r4, 0
	bl sub_80EE6A4
	b _080EDA6E
_080ED946:
	adds r0, r4, 0
	bl sub_80EE850
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0
	beq _080ED956
	b _080EDAC4
_080ED956:
	bl sub_80ED788
	strh r5, [r4, 0x12]
	b _080EDA6E
_080ED95E:
	ldrh r0, [r4, 0x12]
	adds r0, 0x1
	strh r0, [r4, 0x12]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x10
	bhi _080ED96E
	b _080EDAC4
_080ED96E:
	ldr r0, [r4, 0x18]
	movs r1, 0x8
	movs r2, 0xC
	movs r3, 0x5
	bl sub_80EE970
	b _080EDA6E
_080ED97C:
	adds r0, r4, 0
	bl sub_80EE850
	lsls r0, 24
	cmp r0, 0
	beq _080ED98A
	b _080EDAC4
_080ED98A:
	ldr r0, [r4, 0x18]
	movs r1, 0x8
	movs r2, 0xC
	movs r3, 0x5
	bl sub_80EE970
	b _080EDA6E
_080ED998:
	adds r0, r4, 0
	bl sub_80EE850
	b _080EDA64
_080ED9A0:
	ldrh r0, [r4, 0x12]
	adds r0, 0x1
	strh r0, [r4, 0x12]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x14
	bhi _080ED9B0
	b _080EDAC4
_080ED9B0:
	adds r0, r4, 0
	bl sub_80EEA94
	movs r0, 0
	b _080EDA6C
_080ED9BA:
	bl sub_80ED7B0
	lsls r0, 24
	cmp r0, 0
	beq _080ED9C6
	b _080EDAC4
_080ED9C6:
	bl sub_80ED760
	adds r0, r4, 0
	bl sub_80EDAF0
	b _080EDA6E
_080ED9D2:
	movs r0, 0
	bl HideBg
	movs r0, 0
	b _080EDA6C
_080ED9DC:
	ldrh r0, [r4, 0x12]
	adds r0, 0x1
	strh r0, [r4, 0x12]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x30
	bne _080ED9FA
	ldr r0, _080EDA18 @ =0x00007fff
	str r0, [sp]
	movs r0, 0x6
	movs r1, 0x2
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
_080ED9FA:
	ldrh r0, [r4, 0x12]
	cmp r0, 0x78
	bls _080EDAC4
	adds r0, r4, 0
	bl sub_80EDB70
	adds r0, r4, 0
	bl sub_80EDBAC
	ldrb r0, [r4, 0x4]
	adds r0, 0x1
	strb r0, [r4, 0x4]
	movs r0, 0
	b _080EDAC2
	.align 2, 0
_080EDA18: .4byte 0x00007fff
_080EDA1C:
	ldrh r0, [r4, 0x12]
	adds r0, 0x1
	strh r0, [r4, 0x12]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x8
	bls _080EDAC4
	add r1, sp, 0x4
	ldr r2, _080EDA50 @ =0x00007fff
	adds r0, r2, 0
	strh r0, [r1]
	ldr r1, _080EDA54 @ =gPlttBufferUnfaded + 0x20
	ldr r2, _080EDA58 @ =0x01000020
	add r0, sp, 0x4
	bl CpuSet
	movs r1, 0x2
	negs r1, r1
	movs r0, 0
	str r0, [sp]
	adds r0, r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	b _080EDA6E
	.align 2, 0
_080EDA50: .4byte 0x00007fff
_080EDA54: .4byte gPlttBufferUnfaded + 0x20
_080EDA58: .4byte 0x01000020
_080EDA5C:
	ldr r0, _080EDA78 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
_080EDA64:
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	bne _080EDAC4
_080EDA6C:
	strh r0, [r4, 0x12]
_080EDA6E:
	ldrb r0, [r4, 0x4]
	adds r0, 0x1
	strb r0, [r4, 0x4]
	b _080EDAC4
	.align 2, 0
_080EDA78: .4byte gPaletteFade
_080EDA7C:
	ldrh r0, [r4, 0x12]
	adds r0, 0x1
	strh r0, [r4, 0x12]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x3C
	bls _080EDAC4
	ldr r1, _080EDA94 @ =sub_80EDBE8
	adds r0, r4, 0
	bl sub_80ECAA8
	b _080EDAC4
	.align 2, 0
_080EDA94: .4byte sub_80EDBE8
_080EDA98:
	ldr r0, _080EDACC @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x80
	lsls r0, 1
	ands r0, r1
	cmp r0, 0
	beq _080EDAC4
	ldr r0, _080EDAD0 @ =0xffff0064
	ldr r2, _080EDAD4 @ =0x00007fff
	movs r1, 0
	bl BlendPalettes
	ldr r1, [r4, 0x18]
	movs r0, 0
	strh r0, [r1, 0x24]
	ldr r1, [r4, 0x18]
	movs r0, 0xB4
	strh r0, [r1, 0x20]
	movs r0, 0x1
	strb r0, [r4, 0x4]
	movs r0, 0x1E
_080EDAC2:
	strh r0, [r4, 0x12]
_080EDAC4:
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080EDACC: .4byte gMain
_080EDAD0: .4byte 0xffff0064
_080EDAD4: .4byte 0x00007fff
	thumb_func_end sub_80ED898

	thumb_func_start sub_80EDAD8
sub_80EDAD8: @ 80EDAD8
	push {lr}
	ldrb r3, [r0, 0x1]
	lsrs r1, r3, 6
	ldrb r2, [r0, 0x3]
	lsrs r2, 6
	lsls r3, 30
	lsrs r3, 30
	bl CalcCenterToCornerVec
	pop {r0}
	bx r0
	thumb_func_end sub_80EDAD8

	thumb_func_start sub_80EDAF0
sub_80EDAF0: @ 80EDAF0
	push {r4-r7,lr}
	adds r7, r0, 0
	movs r5, 0
_080EDAF6:
	movs r6, 0x1
	ands r6, r5
	lsls r1, r6, 1
	adds r1, r6
	lsls r1, 20
	lsrs r2, r5, 31
	adds r2, r5, r2
	asrs r2, 1
	lsls r2, 22
	movs r0, 0xC4
	lsls r0, 14
	adds r1, r0
	asrs r1, 16
	movs r0, 0x90
	lsls r0, 15
	adds r2, r0
	asrs r2, 16
	ldr r0, _080EDB68 @ =gUnknown_840BE4C
	movs r3, 0x8
	bl CreateSprite
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x40
	beq _080EDB5C
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080EDB6C @ =gSprites
	adds r4, r0, r1
	lsls r1, r5, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl StartSpriteAnim
	lsls r1, r5, 2
	adds r0, r7, 0
	adds r0, 0x28
	adds r2, r0, r1
	str r4, [r2]
	cmp r6, 0
	beq _080EDB56
	ldrb r0, [r4, 0x1]
	movs r1, 0x3F
	ands r1, r0
	movs r0, 0x80
	orrs r1, r0
	strb r1, [r4, 0x1]
_080EDB56:
	ldr r0, [r2]
	bl sub_80EDAD8
_080EDB5C:
	adds r5, 0x1
	cmp r5, 0x3
	ble _080EDAF6
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080EDB68: .4byte gUnknown_840BE4C
_080EDB6C: .4byte gSprites
	thumb_func_end sub_80EDAF0

	thumb_func_start sub_80EDB70
sub_80EDB70: @ 80EDB70
	push {r4,lr}
	adds r4, r0, 0
	ldr r1, [r4, 0x18]
	ldrh r0, [r1, 0x24]
	ldrh r2, [r1, 0x20]
	adds r0, r2
	strh r0, [r1, 0x20]
	ldr r1, [r4, 0x18]
	ldrh r0, [r1, 0x26]
	ldrh r2, [r1, 0x22]
	adds r0, r2
	strh r0, [r1, 0x22]
	ldr r0, [r4, 0x18]
	movs r1, 0
	movs r2, 0x2A
	bl sub_8007FFC
	ldr r0, [r4, 0x18]
	ldr r1, _080EDBA4 @ =SpriteCallbackDummy
	str r1, [r0, 0x1C]
	movs r1, 0x1
	bl StartSpriteAffineAnim
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080EDBA4: .4byte SpriteCallbackDummy
	thumb_func_end sub_80EDB70

	thumb_func_start nullsub_83
nullsub_83: @ 80EDBA8
	bx lr
	thumb_func_end nullsub_83

	thumb_func_start sub_80EDBAC
sub_80EDBAC: @ 80EDBAC
	push {r4-r7,lr}
	adds r7, r0, 0
	movs r6, 0
	ldr r5, _080EDBE0 @ =gUnknown_840BBB8
_080EDBB4:
	lsls r0, r6, 2
	adds r4, r7, 0
	adds r4, 0x28
	adds r4, r0
	ldr r0, [r4]
	movs r1, 0x1
	bl StartSpriteAffineAnim
	ldr r0, [r4]
	ldr r1, _080EDBE4 @ =nullsub_83
	str r1, [r0, 0x1C]
	ldrb r1, [r5]
	ldrb r2, [r5, 0x1]
	bl sub_8007FFC
	adds r5, 0x2
	adds r6, 0x1
	cmp r6, 0x3
	ble _080EDBB4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080EDBE0: .4byte gUnknown_840BBB8
_080EDBE4: .4byte nullsub_83
	thumb_func_end sub_80EDBAC

	thumb_func_start sub_80EDBE8
sub_80EDBE8: @ 80EDBE8
	push {r4,lr}
	adds r4, r0, 0
	ldrb r0, [r4, 0x4]
	cmp r0, 0
	beq _080EDBF8
	cmp r0, 0x1
	beq _080EDC0C
	b _080EDC34
_080EDBF8:
	movs r2, 0x80
	lsls r2, 3
	movs r0, 0
	movs r1, 0
	bl FillPalette
	ldrb r0, [r4, 0x4]
	adds r0, 0x1
	strb r0, [r4, 0x4]
	b _080EDC34
_080EDC0C:
	bl FreeTempTileDataBuffersIfPossible
	lsls r0, 24
	cmp r0, 0
	bne _080EDC34
	ldrb r0, [r4, 0x5]
	bl DestroyTask
	adds r0, r4, 0
	bl Free
	movs r0, 0x2
	bl DisableInterrupts
	movs r0, 0
	bl SetHBlankCallback
	ldr r0, _080EDC3C @ =CB2_InitTitleScreen
	bl SetMainCallback2
_080EDC34:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080EDC3C: .4byte CB2_InitTitleScreen
	thumb_func_end sub_80EDBE8

	thumb_func_start sub_80EDC40
sub_80EDC40: @ 80EDC40
	push {r4-r6,lr}
	movs r5, 0
	ldr r4, _080EDCE4 @ =gUnknown_840BBC0
_080EDC46:
	adds r0, r4, 0
	bl LoadCompressedSpriteSheet
	adds r4, 0x8
	adds r5, 0x1
	cmp r5, 0x4
	bls _080EDC46
	ldr r0, _080EDCE8 @ =gUnknown_840BBE8
	bl LoadSpritePalettes
	ldr r6, _080EDCEC @ =gUnknown_203AB0E
	movs r0, 0x60
	strh r0, [r6]
	ldr r5, _080EDCF0 @ =gUnknown_203AB10
	movs r0, 0x10
	strh r0, [r5]
	ldr r1, _080EDCF4 @ =gUnknown_203AB12
	movs r0, 0x7
	strh r0, [r1]
	ldr r0, _080EDCF8 @ =gUnknown_203AB14
	movs r2, 0x5
	strh r2, [r0]
	ldr r1, _080EDCFC @ =gUnknown_203AB16
	movs r0, 0x8
	strh r0, [r1]
	ldr r1, _080EDD00 @ =gUnknown_203AB18
	movs r0, 0x5A
	strh r0, [r1]
	ldr r1, _080EDD04 @ =gUnknown_203AB1A
	movs r0, 0x78
	strh r0, [r1]
	ldr r0, _080EDD08 @ =gUnknown_203AB1E
	movs r1, 0x1
	strh r1, [r0]
	ldr r0, _080EDD0C @ =gUnknown_203AB20
	strh r1, [r0]
	ldr r0, _080EDD10 @ =gUnknown_203AB22
	strh r2, [r0]
	ldr r0, _080EDD14 @ =gUnknown_203AB24
	strh r2, [r0]
	ldr r4, _080EDD18 @ =gUnknown_203AB28
	ldr r0, [r4]
	cmp r0, 0
	bne _080EDCA2
	ldr r0, _080EDD1C @ =0x151b9245
	str r0, [r4]
_080EDCA2:
	ldr r0, _080EDD20 @ =gUnknown_840BC6C
	movs r1, 0xF8
	movs r2, 0x37
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x40
	beq _080EDCDE
	ldr r0, _080EDD24 @ =gSprites
	lsls r3, r1, 4
	adds r3, r1
	lsls r3, 2
	adds r2, r3, r0
	movs r1, 0xF8
	lsls r1, 4
	strh r1, [r2, 0x2E]
	movs r1, 0xDC
	lsls r1, 2
	strh r1, [r2, 0x30]
	ldrh r1, [r6]
	strh r1, [r2, 0x32]
	ldrh r1, [r5]
	strh r1, [r2, 0x34]
	adds r0, r3
	adds r0, 0x3A
	ldr r1, [r4]
	bl StoreWordInTwoHalfwords
_080EDCDE:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080EDCE4: .4byte gUnknown_840BBC0
_080EDCE8: .4byte gUnknown_840BBE8
_080EDCEC: .4byte gUnknown_203AB0E
_080EDCF0: .4byte gUnknown_203AB10
_080EDCF4: .4byte gUnknown_203AB12
_080EDCF8: .4byte gUnknown_203AB14
_080EDCFC: .4byte gUnknown_203AB16
_080EDD00: .4byte gUnknown_203AB18
_080EDD04: .4byte gUnknown_203AB1A
_080EDD08: .4byte gUnknown_203AB1E
_080EDD0C: .4byte gUnknown_203AB20
_080EDD10: .4byte gUnknown_203AB22
_080EDD14: .4byte gUnknown_203AB24
_080EDD18: .4byte gUnknown_203AB28
_080EDD1C: .4byte 0x151b9245
_080EDD20: .4byte gUnknown_840BC6C
_080EDD24: .4byte gSprites
	thumb_func_end sub_80EDC40

	thumb_func_start sub_80EDD28
sub_80EDD28: @ 80EDD28
	push {r4-r7,lr}
	lsls r0, 16
	lsrs r5, r0, 16
	lsls r1, 16
	lsrs r3, r1, 16
	lsls r2, 16
	lsrs r2, 16
	ldr r0, _080EDDCC @ =gUnknown_203AB12
	ldrh r0, [r0]
	ands r2, r0
	adds r2, 0x2
	lsls r2, 16
	lsrs r4, r2, 16
	ldr r1, _080EDDD0 @ =gUnknown_203AB2C
	ldrh r0, [r1]
	adds r2, r0, 0
	adds r0, r2, 0x1
	strh r0, [r1]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3
	ble _080EDD5C
	movs r6, 0x3
	negs r6, r6
	adds r0, r6, 0
	strh r0, [r1]
_080EDD5C:
	lsls r1, r5, 16
	asrs r1, 16
	lsls r0, r4, 16
	asrs r7, r0, 16
	adds r1, r7
	lsls r0, r3, 16
	asrs r0, 16
	lsls r2, 16
	asrs r6, r2, 16
	adds r0, r6
	lsls r0, 16
	lsrs r3, r0, 16
	lsls r1, 16
	asrs r4, r1, 16
	ldr r0, _080EDDD4 @ =0xffff0000
	adds r1, r0
	lsrs r1, 16
	cmp r1, 0xEE
	bhi _080EDDC6
	ldr r0, _080EDDD8 @ =gUnknown_840BC84
	lsls r1, r3, 16
	asrs r5, r1, 16
	adds r1, r4, 0
	adds r2, r5, 0
	movs r3, 0x1
	bl CreateSprite
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x40
	beq _080EDDC6
	ldr r0, _080EDDDC @ =gSprites
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r0
	ldr r0, _080EDDE0 @ =gUnknown_203AB22
	ldrh r0, [r0]
	lsls r4, r0
	strh r4, [r1, 0x2E]
	ldr r2, _080EDDE4 @ =gUnknown_203AB24
	adds r0, r5, 0
	ldrh r2, [r2]
	lsls r0, r2
	strh r0, [r1, 0x30]
	ldr r0, _080EDDE8 @ =gUnknown_203AB1E
	ldrh r0, [r0]
	muls r0, r7
	strh r0, [r1, 0x32]
	ldr r0, _080EDDEC @ =gUnknown_203AB20
	ldrh r0, [r0]
	muls r0, r6
	strh r0, [r1, 0x34]
_080EDDC6:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080EDDCC: .4byte gUnknown_203AB12
_080EDDD0: .4byte gUnknown_203AB2C
_080EDDD4: .4byte 0xffff0000
_080EDDD8: .4byte gUnknown_840BC84
_080EDDDC: .4byte gSprites
_080EDDE0: .4byte gUnknown_203AB22
_080EDDE4: .4byte gUnknown_203AB24
_080EDDE8: .4byte gUnknown_203AB1E
_080EDDEC: .4byte gUnknown_203AB20
	thumb_func_end sub_80EDD28

	thumb_func_start sub_80EDDF0
sub_80EDDF0: @ 80EDDF0
	push {lr}
	ldr r0, _080EDE00 @ =sub_80EDE04
	movs r1, 0x1
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_080EDE00: .4byte sub_80EDE04
	thumb_func_end sub_80EDDF0

	thumb_func_start sub_80EDE04
sub_80EDE04: @ 80EDE04
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	lsls r0, 2
	add r0, r9
	lsls r0, 3
	ldr r1, _080EDEB0 @ =gTasks+0x8
	adds r0, r1
	mov r8, r0
	ldrh r1, [r0, 0x4]
	adds r1, 0x1
	strh r1, [r0, 0x4]
	ldrh r0, [r0, 0x6]
	adds r0, 0x1
	mov r2, r8
	strh r0, [r2, 0x6]
	lsls r1, 16
	asrs r1, 16
	cmp r1, 0x6
	ble _080EDECA
	movs r0, 0
	strh r0, [r2, 0x4]
	ldrb r6, [r2]
	ldr r0, _080EDEB4 @ =gUnknown_840BC84
	ldr r1, _080EDEB8 @ =gUnknown_840BC08
	lsls r6, 2
	adds r6, r1
	movs r3, 0
	ldrsh r1, [r6, r3]
	movs r3, 0x2
	ldrsh r2, [r6, r3]
	movs r3, 0x2
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r5, _080EDEBC @ =gSprites
	adds r7, r4, r5
	adds r0, r7, 0
	movs r1, 0x1
	bl StartSpriteAnim
	adds r5, 0x1C
	adds r4, r5
	ldr r0, _080EDEC0 @ =sub_80EE40C
	str r0, [r4]
	ldrh r0, [r6, 0x2]
	lsls r0, 4
	strh r0, [r7, 0x30]
	movs r0, 0x78
	strh r0, [r7, 0x32]
	mov r1, r8
	ldrh r0, [r1, 0x2]
	strh r0, [r7, 0x34]
	lsls r0, 16
	cmp r0, 0
	bge _080EDE88
	movs r0, 0x1
	strh r0, [r7, 0x34]
_080EDE88:
	mov r2, r8
	ldrh r0, [r2]
	adds r0, 0x1
	strh r0, [r2]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x8
	bls _080EDECA
	ldrh r0, [r2, 0x2]
	adds r0, 0x1
	strh r0, [r2, 0x2]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080EDEC4
	mov r0, r9
	bl DestroyTask
	b _080EDECA
	.align 2, 0
_080EDEB0: .4byte gTasks+0x8
_080EDEB4: .4byte gUnknown_840BC84
_080EDEB8: .4byte gUnknown_840BC08
_080EDEBC: .4byte gSprites
_080EDEC0: .4byte sub_80EE40C
_080EDEC4:
	movs r0, 0
	mov r3, r8
	strh r0, [r3]
_080EDECA:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80EDE04

	thumb_func_start sub_80EDED8
sub_80EDED8: @ 80EDED8
	push {lr}
	ldr r0, _080EDEE8 @ =sub_80EDEEC
	movs r1, 0x2
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_080EDEE8: .4byte sub_80EDEEC
	thumb_func_end sub_80EDED8

	thumb_func_start sub_80EDEEC
sub_80EDEEC: @ 80EDEEC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r5, r0, 0
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _080EDF5C @ =gTasks+0x8
	adds r4, r0, r1
	movs r1, 0
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080EDF44
	ldrh r1, [r4, 0x2]
	ldrb r2, [r4, 0x2]
	adds r0, r1, 0x4
	strh r0, [r4, 0x2]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x8
	bls _080EDF1A
	subs r0, r1, 0x5
	strh r0, [r4, 0x2]
_080EDF1A:
	ldr r0, _080EDF60 @ =gUnknown_840BCBC
	ldr r1, _080EDF64 @ =gUnknown_840BC08
	lsls r2, 2
	adds r2, r1
	movs r3, 0
	ldrsh r1, [r2, r3]
	movs r3, 0x2
	ldrsh r2, [r2, r3]
	movs r3, 0x3
	bl CreateSprite
	ldrh r0, [r4, 0x4]
	adds r0, 0x1
	strh r0, [r4, 0x4]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x8
	ble _080EDF44
	adds r0, r5, 0
	bl DestroyTask
_080EDF44:
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x9
	ble _080EDF56
	movs r0, 0
	strh r0, [r4]
_080EDF56:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080EDF5C: .4byte gTasks+0x8
_080EDF60: .4byte gUnknown_840BCBC
_080EDF64: .4byte gUnknown_840BC08
	thumb_func_end sub_80EDEEC

	thumb_func_start sub_80EDF68
sub_80EDF68: @ 80EDF68
	push {lr}
	ldr r0, _080EDF8C @ =gUnknown_840BCDC
	movs r1, 0x78
	movs r2, 0x46
	movs r3, 0x4
	bl CreateSprite
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080EDF90 @ =gSprites
	adds r0, r1
	pop {r1}
	bx r1
	.align 2, 0
_080EDF8C: .4byte gUnknown_840BCDC
_080EDF90: .4byte gSprites
	thumb_func_end sub_80EDF68

	thumb_func_start sub_80EDF94
sub_80EDF94: @ 80EDF94
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r0, 0
	strb r0, [r4, 0x6]
	ldr r0, _080EDFD0 @ =sub_80EE024
	movs r1, 0x4
	bl CreateTask
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	adds r0, r5, 0
	movs r1, 0x5
	adds r2, r4, 0
	bl SetWordTaskArg
	ldr r0, _080EDFD4 @ =gTasks
	lsls r4, r5, 2
	adds r4, r5
	lsls r4, 3
	adds r4, r0
	movs r0, 0x40
	strh r0, [r4, 0xE]
	movs r0, 0
	bl GetBgX
	strh r0, [r4, 0x10]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080EDFD0: .4byte sub_80EE024
_080EDFD4: .4byte gTasks
	thumb_func_end sub_80EDF94

	thumb_func_start sub_80EDFD8
sub_80EDFD8: @ 80EDFD8
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r6, r2, 0
	mov r8, r3
	lsls r4, 15
	movs r0, 0xF8
	lsls r0, 9
	adds r4, r0
	movs r0, 0
	adds r1, r4, 0
	movs r2, 0
	bl ChangeBgY
	movs r0, 0
	mov r1, r8
	movs r2, 0
	bl ChangeBgX
	lsls r5, 8
	movs r0, 0
	adds r1, r5, 0
	movs r2, 0x2
	bl ChangeBgX
	lsls r6, 8
	movs r0, 0
	adds r1, r6, 0
	movs r2, 0x2
	bl ChangeBgY
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80EDFD8

	thumb_func_start sub_80EE024
sub_80EE024: @ 80EE024
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r1, _080EE048 @ =gTasks+0x8
	adds r5, r0, r1
	movs r1, 0
	ldrsh r0, [r5, r1]
	cmp r0, 0x5
	bhi _080EE11C
	lsls r0, 2
	ldr r1, _080EE04C @ =_080EE050
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080EE048: .4byte gTasks+0x8
_080EE04C: .4byte _080EE050
	.align 2, 0
_080EE050:
	.4byte _080EE068
	.4byte _080EE07A
	.4byte _080EE094
	.4byte _080EE0BC
	.4byte _080EE0EE
	.4byte _080EE114
_080EE068:
	movs r0, 0x2
	strh r0, [r5, 0xE]
	movs r0, 0
	strh r0, [r5, 0x2]
	movs r0, 0x6
	strh r0, [r5, 0x10]
	movs r0, 0x20
	strh r0, [r5, 0x12]
	b _080EE10C
_080EE07A:
	ldrh r0, [r5, 0x6]
	subs r0, 0x2
	strh r0, [r5, 0x6]
	ldrh r0, [r5, 0x2]
	adds r0, 0x1
	strh r0, [r5, 0x2]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xF
	ble _080EE11C
	movs r0, 0
	strh r0, [r5, 0x2]
	b _080EE10C
_080EE094:
	ldrh r0, [r5, 0x2]
	adds r0, 0x1
	strh r0, [r5, 0x2]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xE
	bne _080EE0AE
	adds r0, r2, 0
	movs r1, 0x5
	bl GetWordTaskArg
	movs r1, 0x1
	strb r1, [r0, 0x6]
_080EE0AE:
	movs r2, 0x2
	ldrsh r0, [r5, r2]
	cmp r0, 0xF
	ble _080EE11C
	movs r0, 0
	strh r0, [r5, 0x2]
	b _080EE10C
_080EE0BC:
	ldrh r0, [r5, 0x6]
	adds r0, 0x8
	strh r0, [r5, 0x6]
	ldrh r0, [r5, 0x2]
	adds r0, 0x1
	strh r0, [r5, 0x2]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	bne _080EE0E0
	bl sub_80EE160
	movs r0, 0x20
	strh r0, [r5, 0x10]
	movs r0, 0x30
	strh r0, [r5, 0x12]
	movs r0, 0x3
	strh r0, [r5, 0xE]
_080EE0E0:
	movs r3, 0x2
	ldrsh r0, [r5, r3]
	cmp r0, 0x7
	ble _080EE11C
	movs r0, 0
	strh r0, [r5, 0x2]
	b _080EE10C
_080EE0EE:
	ldrh r0, [r5, 0x6]
	subs r0, 0x8
	strh r0, [r5, 0x6]
	ldrh r0, [r5, 0x2]
	adds r0, 0x1
	strh r0, [r5, 0x2]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3
	ble _080EE11C
	movs r1, 0
	strh r1, [r5, 0xE]
	movs r0, 0x40
	strh r0, [r5, 0x6]
	strh r1, [r5, 0x2]
_080EE10C:
	ldrh r0, [r5]
	adds r0, 0x1
	strh r0, [r5]
	b _080EE11C
_080EE114:
	adds r0, r2, 0
	bl DestroyTask
	b _080EE156
_080EE11C:
	movs r4, 0x6
	ldrsh r3, [r5, r4]
	ldr r4, _080EE15C @ =gSineTable
	adds r0, r3, 0
	adds r0, 0x40
	lsls r0, 1
	adds r0, r4
	movs r2, 0
	ldrsh r1, [r0, r2]
	movs r2, 0x12
	ldrsh r0, [r5, r2]
	muls r1, r0
	asrs r1, 8
	negs r1, r1
	movs r0, 0x10
	ldrsh r2, [r5, r0]
	lsls r3, 1
	adds r3, r4
	movs r4, 0
	ldrsh r0, [r3, r4]
	muls r0, r2
	asrs r0, 8
	subs r2, r0
	movs r3, 0xE
	ldrsh r0, [r5, r3]
	movs r4, 0x8
	ldrsh r3, [r5, r4]
	bl sub_80EDFD8
_080EE156:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080EE15C: .4byte gSineTable
	thumb_func_end sub_80EE024

	thumb_func_start sub_80EE160
sub_80EE160: @ 80EE160
	push {r4,lr}
	ldr r4, _080EE1BC @ =gUnknown_840BE8C
	adds r0, r4, 0
	movs r1, 0x84
	movs r2, 0x4E
	movs r3, 0x6
	bl CreateSprite
	adds r0, r4, 0
	movs r1, 0x84
	movs r2, 0x76
	movs r3, 0x6
	bl CreateSprite
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x40
	beq _080EE1B4
	ldr r0, _080EE1C0 @ =gSprites
	lsls r4, r1, 4
	adds r4, r1
	lsls r4, 2
	adds r4, r0
	ldrb r2, [r4, 0x1]
	movs r1, 0x3F
	adds r0, r1, 0
	ands r0, r2
	movs r2, 0x40
	orrs r0, r2
	strb r0, [r4, 0x1]
	ldrb r0, [r4, 0x3]
	ands r1, r0
	movs r0, 0x80
	orrs r1, r0
	strb r1, [r4, 0x3]
	adds r0, r4, 0
	bl sub_80EDAD8
	adds r0, r4, 0
	movs r1, 0x1
	bl StartSpriteAnim
_080EE1B4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080EE1BC: .4byte gUnknown_840BE8C
_080EE1C0: .4byte gSprites
	thumb_func_end sub_80EE160

	thumb_func_start sub_80EE1C4
sub_80EE1C4: @ 80EE1C4
	push {lr}
	adds r3, r0, 0
	movs r0, 0x3E
	adds r0, r3
	mov r12, r0
	ldrb r2, [r0]
	lsls r0, r2, 29
	lsrs r0, 31
	movs r1, 0x1
	eors r1, r0
	lsls r1, 2
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	mov r1, r12
	strb r0, [r1]
	adds r0, r3, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080EE1FA
	adds r0, r3, 0
	bl DestroySprite
_080EE1FA:
	pop {r0}
	bx r0
	thumb_func_end sub_80EE1C4

	thumb_func_start sub_80EE200
sub_80EE200: @ 80EE200
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _080EE220 @ =gTasks+0x8
	adds r1, r0, r1
	movs r2, 0
	ldrsh r0, [r1, r2]
	cmp r0, 0
	beq _080EE224
	cmp r0, 0x1
	beq _080EE232
	b _080EE28A
	.align 2, 0
_080EE220: .4byte gTasks+0x8
_080EE224:
	movs r3, 0x80
	lsls r3, 3
	adds r0, r3, 0
	strh r0, [r1, 0x2]
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_080EE232:
	ldrh r0, [r1, 0x4]
	adds r0, 0x1
	strh r0, [r1, 0x4]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x27
	ble _080EE250
	ldrh r2, [r1, 0x2]
	movs r3, 0x2
	ldrsh r0, [r1, r3]
	cmp r0, 0x10
	ble _080EE250
	adds r0, r2, 0
	subs r0, 0x10
	strh r0, [r1, 0x2]
_080EE250:
	movs r0, 0x2
	ldrsh r1, [r1, r0]
	movs r0, 0
	movs r2, 0x1
	bl ChangeBgX
	ldr r5, _080EE290 @ =gUnknown_203AB30
	str r0, [r5]
	ldr r1, _080EE294 @ =0x00007fff
	cmp r0, r1
	bls _080EE270
	movs r1, 0x80
	lsls r1, 6
	movs r0, 0
	bl ClearGpuRegBits
_080EE270:
	ldr r1, [r5]
	ldr r0, _080EE298 @ =0x0000eeff
	cmp r1, r0
	bls _080EE28A
	movs r1, 0xEF
	lsls r1, 8
	movs r0, 0
	movs r2, 0
	bl ChangeBgX
	adds r0, r4, 0
	bl DestroyTask
_080EE28A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080EE290: .4byte gUnknown_203AB30
_080EE294: .4byte 0x00007fff
_080EE298: .4byte 0x0000eeff
	thumb_func_end sub_80EE200

	thumb_func_start sub_80EE29C
sub_80EE29C: @ 80EE29C
	push {r4,r5,lr}
	sub sp, 0x4
	adds r5, r0, 0
	ldrh r2, [r5, 0x2E]
	ldrh r0, [r5, 0x32]
	subs r2, r0
	strh r2, [r5, 0x2E]
	ldrh r1, [r5, 0x34]
	ldrh r0, [r5, 0x30]
	adds r1, r0
	strh r1, [r5, 0x30]
	ldrh r0, [r5, 0x36]
	adds r0, 0x30
	strh r0, [r5, 0x36]
	lsls r2, 16
	asrs r2, 20
	strh r2, [r5, 0x20]
	lsls r1, 16
	asrs r1, 20
	strh r1, [r5, 0x22]
	ldr r1, _080EE340 @ =gSineTable
	lsls r0, 16
	asrs r0, 20
	adds r0, 0x40
	lsls r0, 1
	adds r0, r1
	ldrh r0, [r0]
	lsls r0, 16
	asrs r0, 21
	strh r0, [r5, 0x26]
	ldrh r0, [r5, 0x38]
	adds r0, 0x1
	strh r0, [r5, 0x38]
	movs r1, 0x38
	ldrsh r0, [r5, r1]
	ldr r1, _080EE344 @ =gUnknown_203AB16
	ldrh r1, [r1]
	bl __modsi3
	cmp r0, 0
	beq _080EE324
	adds r4, r5, 0
	adds r4, 0x3A
	adds r0, r4, 0
	mov r1, sp
	bl LoadWordFromTwoHalfwords
	ldr r1, [sp]
	ldr r0, _080EE348 @ =0x41c64e6d
	muls r1, r0
	ldr r3, _080EE34C @ =0x00006073
	adds r1, r3
	str r1, [sp]
	adds r0, r4, 0
	bl StoreWordInTwoHalfwords
	ldr r2, [sp]
	lsrs r2, 16
	str r2, [sp]
	movs r1, 0x20
	ldrsh r0, [r5, r1]
	ldrh r1, [r5, 0x26]
	ldrh r3, [r5, 0x22]
	adds r1, r3
	lsls r1, 16
	asrs r1, 16
	bl sub_80EDD28
_080EE324:
	movs r0, 0x20
	ldrsh r1, [r5, r0]
	movs r0, 0x8
	negs r0, r0
	cmp r1, r0
	bge _080EE336
	adds r0, r5, 0
	bl DestroySprite
_080EE336:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080EE340: .4byte gSineTable
_080EE344: .4byte gUnknown_203AB16
_080EE348: .4byte 0x41c64e6d
_080EE34C: .4byte 0x00006073
	thumb_func_end sub_80EE29C

	thumb_func_start sub_80EE350
sub_80EE350: @ 80EE350
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x32]
	ldrh r1, [r4, 0x2E]
	adds r0, r1
	strh r0, [r4, 0x2E]
	ldrh r2, [r4, 0x34]
	ldrh r1, [r4, 0x30]
	adds r0, r2, r1
	strh r0, [r4, 0x30]
	ldrh r1, [r4, 0x36]
	adds r1, 0x1
	strh r1, [r4, 0x36]
	ldrh r0, [r4, 0x38]
	adds r0, r1
	strh r0, [r4, 0x38]
	ldrh r0, [r4, 0x3C]
	adds r0, 0x1
	strh r0, [r4, 0x3C]
	ldrh r0, [r4, 0x2E]
	ldr r1, _080EE3F8 @ =gUnknown_203AB22
	ldrh r1, [r1]
	asrs r0, r1
	strh r0, [r4, 0x20]
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	ldr r1, _080EE3FC @ =gUnknown_203AB24
	ldrh r1, [r1]
	asrs r0, r1
	strh r0, [r4, 0x22]
	ldr r1, _080EE400 @ =gUnknown_203AB1C
	ldrh r0, [r1]
	cmp r0, 0
	beq _080EE3A4
	lsls r0, r2, 16
	cmp r0, 0
	bge _080EE3A4
	movs r2, 0x38
	ldrsh r0, [r4, r2]
	ldrh r1, [r1]
	asrs r0, r1
	strh r0, [r4, 0x26]
_080EE3A4:
	movs r0, 0x3C
	ldrsh r1, [r4, r0]
	ldr r0, _080EE404 @ =gUnknown_203AB18
	ldrh r0, [r0]
	cmp r1, r0
	ble _080EE3DC
	adds r3, r4, 0
	adds r3, 0x3E
	ldrb r2, [r3]
	lsrs r1, r2, 2
	movs r0, 0x1
	eors r1, r0
	ands r1, r0
	lsls r1, 2
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	movs r2, 0x3C
	ldrsh r1, [r4, r2]
	ldr r0, _080EE408 @ =gUnknown_203AB1A
	ldrh r0, [r0]
	cmp r1, r0
	ble _080EE3DC
	adds r0, r4, 0
	bl DestroySprite
_080EE3DC:
	movs r1, 0x22
	ldrsh r0, [r4, r1]
	movs r2, 0x26
	ldrsh r1, [r4, r2]
	adds r0, r1
	cmp r0, 0xA0
	bls _080EE3F0
	adds r0, r4, 0
	bl DestroySprite
_080EE3F0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080EE3F8: .4byte gUnknown_203AB22
_080EE3FC: .4byte gUnknown_203AB24
_080EE400: .4byte gUnknown_203AB1C
_080EE404: .4byte gUnknown_203AB18
_080EE408: .4byte gUnknown_203AB1A
	thumb_func_end sub_80EE350

	thumb_func_start sub_80EE40C
sub_80EE40C: @ 80EE40C
	push {r4,lr}
	adds r4, r0, 0
	ldrh r1, [r4, 0x32]
	movs r2, 0x32
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _080EE490
	subs r0, r1, 0x1
	strh r0, [r4, 0x32]
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 20
	strh r0, [r4, 0x22]
	cmp r0, 0x56
	ble _080EE438
	movs r0, 0x4A
	strh r0, [r4, 0x22]
	movs r0, 0x94
	lsls r0, 3
	strh r0, [r4, 0x30]
_080EE438:
	adds r0, r4, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080EE4D4
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080EE46C
	ldrh r0, [r4, 0x20]
	adds r1, r0, 0
	adds r1, 0x1A
	strh r1, [r4, 0x20]
	lsls r0, r1, 16
	asrs r0, 16
	cmp r0, 0xBC
	ble _080EE486
	movs r2, 0xBC
	lsls r2, 1
	adds r0, r2, 0
	subs r0, r1
	strh r0, [r4, 0x20]
	movs r0, 0x1
	b _080EE484
_080EE46C:
	ldrh r0, [r4, 0x20]
	adds r1, r0, 0
	subs r1, 0x1A
	strh r1, [r4, 0x20]
	lsls r0, r1, 16
	asrs r0, 16
	cmp r0, 0x33
	bgt _080EE486
	movs r0, 0x68
	subs r0, r1
	strh r0, [r4, 0x20]
	movs r0, 0
_080EE484:
	strh r0, [r4, 0x2E]
_080EE486:
	adds r0, r4, 0
	movs r1, 0x1
	bl StartSpriteAnim
	b _080EE4D4
_080EE490:
	movs r1, 0x34
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080EE49E
	adds r0, r4, 0
	bl DestroySprite
_080EE49E:
	adds r0, r4, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080EE4B4
	adds r0, r4, 0
	movs r1, 0
	bl StartSpriteAnim
_080EE4B4:
	ldrh r0, [r4, 0x30]
	adds r0, 0x4
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 20
	strh r0, [r4, 0x22]
	ldrh r0, [r4, 0x36]
	adds r0, 0x1
	strh r0, [r4, 0x36]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x32
	ble _080EE4D4
	adds r0, r4, 0
	bl DestroySprite
_080EE4D4:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80EE40C

	thumb_func_start sub_80EE4DC
sub_80EE4DC: @ 80EE4DC
	push {lr}
	adds r2, r0, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080EE4F2
	adds r0, r2, 0
	bl DestroySprite
_080EE4F2:
	pop {r0}
	bx r0
	thumb_func_end sub_80EE4DC

	thumb_func_start sub_80EE4F8
sub_80EE4F8: @ 80EE4F8
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _080EE520 @ =gUnknown_840BD88
	movs r1, 0
	movs r2, 0
	movs r3, 0x9
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r0, _080EE524 @ =gSprites
	adds r1, r0
	str r1, [r4, 0x18]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080EE520: .4byte gUnknown_840BD88
_080EE524: .4byte gSprites
	thumb_func_end sub_80EE4F8

	thumb_func_start sub_80EE528
sub_80EE528: @ 80EE528
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	adds r4, r0, 0
	adds r0, r2, 0
	adds r5, r3, 0
	lsls r1, 16
	lsls r0, 16
	lsls r5, 16
	lsrs r5, 16
	lsrs r2, r1, 16
	mov r9, r2
	asrs r1, 16
	lsls r2, r1, 4
	movs r3, 0
	mov r8, r3
	strh r2, [r4, 0x2E]
	lsrs r6, r0, 16
	asrs r0, 16
	subs r0, r1
	lsls r0, 4
	adds r1, r5, 0
	bl __divsi3
	strh r0, [r4, 0x30]
	strh r5, [r4, 0x32]
	strh r6, [r4, 0x34]
	mov r0, r8
	strh r0, [r4, 0x36]
	mov r2, r9
	strh r2, [r4, 0x20]
	movs r0, 0x64
	strh r0, [r4, 0x22]
	ldr r0, _080EE57C @ =sub_80EE580
	str r0, [r4, 0x1C]
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080EE57C: .4byte sub_80EE580
	thumb_func_end sub_80EE528

	thumb_func_start sub_80EE580
sub_80EE580: @ 80EE580
	push {r4,lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x36]
	adds r0, 0x1
	strh r0, [r2, 0x36]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x27
	ble _080EE5A0
	ldrh r1, [r2, 0x30]
	movs r3, 0x30
	ldrsh r0, [r2, r3]
	cmp r0, 0x1
	ble _080EE5A0
	subs r0, r1, 0x1
	strh r0, [r2, 0x30]
_080EE5A0:
	ldrh r0, [r2, 0x30]
	ldrh r4, [r2, 0x2E]
	adds r0, r4
	strh r0, [r2, 0x2E]
	lsls r0, 16
	asrs r0, 20
	strh r0, [r2, 0x20]
	ldrh r3, [r2, 0x34]
	movs r4, 0x34
	ldrsh r1, [r2, r4]
	cmp r0, r1
	blt _080EE5BE
	strh r3, [r2, 0x20]
	ldr r0, _080EE5C4 @ =SpriteCallbackDummy
	str r0, [r2, 0x1C]
_080EE5BE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080EE5C4: .4byte SpriteCallbackDummy
	thumb_func_end sub_80EE580

	thumb_func_start sub_80EE5C8
sub_80EE5C8: @ 80EE5C8
	push {lr}
	movs r2, 0
	ldr r0, [r0, 0x18]
	ldr r1, [r0, 0x1C]
	ldr r0, _080EE5E0 @ =sub_80EE580
	cmp r1, r0
	bne _080EE5D8
	movs r2, 0x1
_080EE5D8:
	adds r0, r2, 0
	pop {r1}
	bx r1
	.align 2, 0
_080EE5E0: .4byte sub_80EE580
	thumb_func_end sub_80EE5C8

	thumb_func_start sub_80EE5E4
sub_80EE5E4: @ 80EE5E4
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, [r4, 0x18]
	movs r1, 0x2
	bl StartSpriteAnim
	ldr r0, [r4, 0x18]
	movs r1, 0
	strh r1, [r0, 0x2E]
	ldr r0, [r4, 0x18]
	strh r1, [r0, 0x30]
	ldr r1, [r4, 0x18]
	movs r0, 0x3
	strh r0, [r1, 0x26]
	ldr r1, [r4, 0x18]
	ldr r0, _080EE60C @ =sub_80EE610
	str r0, [r1, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080EE60C: .4byte sub_80EE610
	thumb_func_end sub_80EE5E4

	thumb_func_start sub_80EE610
sub_80EE610: @ 80EE610
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r0, 0x2E
	ldrsh r5, [r4, r0]
	cmp r5, 0x1
	beq _080EE646
	cmp r5, 0x1
	bgt _080EE626
	cmp r5, 0
	beq _080EE62C
	b _080EE69A
_080EE626:
	cmp r5, 0x2
	beq _080EE65C
	b _080EE69A
_080EE62C:
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x8
	ble _080EE69A
	adds r0, r4, 0
	movs r1, 0x1
	bl StartSpriteAnim
	strh r5, [r4, 0x26]
	b _080EE654
_080EE646:
	movs r0, 0x21
	movs r1, 0x3F
	movs r2, 0x1
	bl PlayCry3
	movs r0, 0
	strh r0, [r4, 0x30]
_080EE654:
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	b _080EE69A
_080EE65C:
	ldrh r0, [r4, 0x32]
	adds r0, 0x1
	strh r0, [r4, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080EE67C
	movs r0, 0
	strh r0, [r4, 0x32]
	movs r1, 0
	movs r2, 0x26
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bne _080EE67A
	movs r1, 0x1
_080EE67A:
	strh r1, [r4, 0x26]
_080EE67C:
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x30
	ble _080EE69A
	adds r0, r4, 0
	movs r1, 0
	bl StartSpriteAnim
	movs r0, 0
	strh r0, [r4, 0x26]
	ldr r0, _080EE6A0 @ =SpriteCallbackDummy
	str r0, [r4, 0x1C]
_080EE69A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080EE6A0: .4byte SpriteCallbackDummy
	thumb_func_end sub_80EE610

	thumb_func_start sub_80EE6A4
sub_80EE6A4: @ 80EE6A4
	push {r4,lr}
	adds r4, r0, 0
	ldr r1, _080EE6F0 @ =gUnknown_203AB0A
	movs r0, 0x10
	strh r0, [r1]
	ldr r1, _080EE6F4 @ =gUnknown_203AB04
	movs r0, 0x3
	strh r0, [r1]
	ldr r1, _080EE6F8 @ =gUnknown_203AB08
	movs r0, 0x5
	strh r0, [r1]
	ldr r1, _080EE6FC @ =gUnknown_203AB06
	movs r0, 0
	strh r0, [r1]
	ldr r0, [r4, 0x18]
	movs r1, 0x2
	bl StartSpriteAnim
	ldr r0, [r4, 0x18]
	movs r1, 0
	strh r1, [r0, 0x2E]
	ldr r0, [r4, 0x18]
	strh r1, [r0, 0x30]
	ldr r0, [r4, 0x18]
	strh r1, [r0, 0x32]
	ldr r0, [r4, 0x18]
	strh r1, [r0, 0x34]
	ldr r0, [r4, 0x18]
	strh r1, [r0, 0x36]
	ldr r1, [r4, 0x18]
	movs r0, 0x28
	strh r0, [r1, 0x3C]
	ldr r1, [r4, 0x18]
	ldr r0, _080EE700 @ =sub_80EE704
	str r0, [r1, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080EE6F0: .4byte gUnknown_203AB0A
_080EE6F4: .4byte gUnknown_203AB04
_080EE6F8: .4byte gUnknown_203AB08
_080EE6FC: .4byte gUnknown_203AB06
_080EE700: .4byte sub_80EE704
	thumb_func_end sub_80EE6A4

	thumb_func_start sub_80EE704
sub_80EE704: @ 80EE704
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _080EE740
	cmp r0, 0x1
	bgt _080EE71A
	cmp r0, 0
	beq _080EE726
	b _080EE846
_080EE71A:
	cmp r0, 0x2
	beq _080EE7C4
	cmp r0, 0x3
	bne _080EE724
	b _080EE824
_080EE724:
	b _080EE846
_080EE726:
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	bgt _080EE736
	b _080EE846
_080EE736:
	adds r0, r4, 0
	movs r1, 0x3
	bl StartSpriteAnim
	b _080EE818
_080EE740:
	ldrh r2, [r4, 0x3C]
	ldrh r3, [r4, 0x32]
	adds r1, r2, r3
	movs r5, 0
	strh r1, [r4, 0x32]
	ldrh r0, [r4, 0x34]
	adds r0, 0x8
	strh r0, [r4, 0x34]
	lsls r1, 16
	asrs r1, 20
	strh r1, [r4, 0x24]
	ldr r1, _080EE7B0 @ =gSineTable
	movs r3, 0x34
	ldrsh r0, [r4, r3]
	lsls r0, 1
	adds r0, r1
	movs r3, 0
	ldrsh r1, [r0, r3]
	ldr r0, _080EE7B4 @ =gUnknown_203AB04
	ldrh r0, [r0]
	muls r0, r1
	ldr r1, _080EE7B8 @ =gUnknown_203AB08
	ldrh r1, [r1]
	asrs r0, r1
	negs r0, r0
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x38]
	adds r0, 0x1
	strh r0, [r4, 0x38]
	movs r0, 0x38
	ldrsh r1, [r4, r0]
	ldr r0, _080EE7BC @ =gUnknown_203AB06
	ldrh r0, [r0]
	cmp r1, r0
	ble _080EE78C
	strh r5, [r4, 0x38]
	subs r0, r2, 0x1
	strh r0, [r4, 0x3C]
_080EE78C:
	ldrh r0, [r4, 0x36]
	adds r0, 0x1
	strh r0, [r4, 0x36]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xF
	ble _080EE846
	adds r0, r4, 0
	movs r1, 0x2
	bl StartSpriteAnim
	strh r5, [r4, 0x30]
	ldr r0, _080EE7C0 @ =0x00004757
	strh r0, [r4, 0x3A]
	movs r0, 0x1C
	strh r0, [r4, 0x3C]
	b _080EE818
	.align 2, 0
_080EE7B0: .4byte gSineTable
_080EE7B4: .4byte gUnknown_203AB04
_080EE7B8: .4byte gUnknown_203AB08
_080EE7BC: .4byte gUnknown_203AB06
_080EE7C0: .4byte 0x00004757
_080EE7C4:
	ldrh r0, [r4, 0x3C]
	ldrh r1, [r4, 0x32]
	adds r0, r1
	strh r0, [r4, 0x32]
	lsls r0, 16
	asrs r1, r0, 20
	strh r1, [r4, 0x24]
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x6
	ble _080EE804
	ldrh r0, [r4, 0x20]
	adds r0, r1
	lsls r0, 16
	asrs r0, 16
	ldrh r1, [r4, 0x26]
	ldrh r2, [r4, 0x22]
	adds r1, r2
	lsls r1, 16
	asrs r1, 16
	movs r3, 0x3A
	ldrsh r2, [r4, r3]
	bl sub_80EE864
	movs r0, 0x3A
	ldrsh r1, [r4, r0]
	ldr r0, _080EE820 @ =0x41c64e6d
	muls r0, r1
	strh r0, [r4, 0x3A]
_080EE804:
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	cmp r0, 0xC
	ble _080EE846
	adds r0, r4, 0
	movs r1, 0
	bl StartSpriteAnim
	movs r0, 0
	strh r0, [r4, 0x30]
_080EE818:
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	b _080EE846
	.align 2, 0
_080EE820: .4byte 0x41c64e6d
_080EE824:
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x10
	ble _080EE846
	ldr r0, _080EE84C @ =gUnknown_203AB0A
	ldrh r1, [r0]
	ldrh r2, [r4, 0x24]
	negs r2, r2
	lsls r2, 16
	asrs r2, 16
	adds r0, r4, 0
	movs r3, 0x4
	bl sub_80EE970
_080EE846:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080EE84C: .4byte gUnknown_203AB0A
	thumb_func_end sub_80EE704

	thumb_func_start sub_80EE850
sub_80EE850: @ 80EE850
	ldr r0, [r0, 0x18]
	ldr r1, [r0, 0x1C]
	ldr r0, _080EE860 @ =SpriteCallbackDummy
	eors r1, r0
	negs r0, r1
	orrs r0, r1
	lsrs r0, 31
	bx lr
	.align 2, 0
_080EE860: .4byte SpriteCallbackDummy
	thumb_func_end sub_80EE850

	thumb_func_start sub_80EE864
sub_80EE864: @ 80EE864
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r2, 16
	lsrs r5, r2, 16
	movs r6, 0
	lsls r0, 16
	ldr r2, _080EE8D4 @ =0xffea0000
	adds r2, r0
	mov r8, r2
	lsls r1, 16
	movs r0, 0xC0
	lsls r0, 13
	adds r7, r1, r0
_080EE880:
	ldr r0, _080EE8D8 @ =gUnknown_840BEC4
	mov r2, r8
	asrs r1, r2, 16
	asrs r2, r7, 16
	movs r3, 0xA
	bl CreateSprite
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x40
	beq _080EE8C4
	ldr r0, _080EE8DC @ =gSprites
	lsls r4, r1, 4
	adds r4, r1
	lsls r4, 2
	adds r4, r0
	lsls r5, 16
	asrs r5, 16
	adds r0, r5, 0
	movs r1, 0xD
	bl __modsi3
	adds r0, 0x8
	strh r0, [r4, 0x34]
	adds r0, r5, 0
	movs r1, 0x3
	bl __modsi3
	strh r0, [r4, 0x36]
	strh r6, [r4, 0x3C]
	ldr r0, _080EE8E0 @ =0x41c64e6d
	muls r0, r5
	lsls r0, 16
	lsrs r5, r0, 16
_080EE8C4:
	adds r6, 0x1
	cmp r6, 0x1
	ble _080EE880
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080EE8D4: .4byte 0xffea0000
_080EE8D8: .4byte gUnknown_840BEC4
_080EE8DC: .4byte gSprites
_080EE8E0: .4byte 0x41c64e6d
	thumb_func_end sub_80EE864

	thumb_func_start sub_80EE8E4
sub_80EE8E4: @ 80EE8E4
	push {r4,r5,lr}
	adds r5, r0, 0
	adds r4, r5, 0
	adds r4, 0x2E
	movs r1, 0x2E
	ldrsh r0, [r5, r1]
	cmp r0, 0
	beq _080EE8FA
	cmp r0, 0x1
	beq _080EE90C
	b _080EE93E
_080EE8FA:
	ldrh r0, [r5, 0x20]
	lsls r0, 4
	strh r0, [r4, 0x2]
	ldrh r0, [r5, 0x22]
	lsls r0, 4
	strh r0, [r4, 0x4]
	ldrh r0, [r5, 0x2E]
	adds r0, 0x1
	strh r0, [r5, 0x2E]
_080EE90C:
	ldrh r1, [r4, 0x2]
	ldrh r0, [r4, 0x6]
	subs r1, r0
	strh r1, [r4, 0x2]
	ldrh r0, [r4, 0x8]
	ldrh r2, [r4, 0x4]
	adds r0, r2
	strh r0, [r4, 0x4]
	lsls r1, 16
	asrs r1, 20
	strh r1, [r5, 0x20]
	ldrh r0, [r4, 0x4]
	lsls r0, 16
	asrs r0, 20
	strh r0, [r5, 0x22]
	adds r0, r5, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080EE93E
	adds r0, r5, 0
	bl DestroySprite
_080EE93E:
	ldrh r0, [r4, 0xE]
	adds r0, 0x1
	strh r0, [r4, 0xE]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080EE96A
	movs r0, 0
	strh r0, [r4, 0xE]
	adds r3, r5, 0
	adds r3, 0x3E
	ldrb r2, [r3]
	lsls r0, r2, 29
	lsrs r0, 31
	movs r1, 0x1
	eors r1, r0
	lsls r1, 2
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
_080EE96A:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80EE8E4

	thumb_func_start sub_80EE970
sub_80EE970: @ 80EE970
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r0, r2, 0
	adds r6, r3, 0
	lsls r5, 16
	lsrs r5, 16
	lsls r6, 24
	lsrs r6, 24
	movs r1, 0
	mov r8, r1
	mov r1, r8
	strh r1, [r4, 0x2E]
	strh r5, [r4, 0x30]
	ldrh r1, [r4, 0x24]
	lsls r1, 4
	strh r1, [r4, 0x32]
	lsls r0, 16
	asrs r0, 12
	adds r1, r5, 0
	bl __divsi3
	strh r0, [r4, 0x34]
	mov r0, r8
	strh r0, [r4, 0x36]
	movs r0, 0x80
	lsls r0, 4
	adds r1, r5, 0
	bl __divsi3
	strh r0, [r4, 0x38]
	mov r1, r8
	strh r1, [r4, 0x3A]
	strh r6, [r4, 0x3C]
	adds r0, r4, 0
	movs r1, 0x2
	bl StartSpriteAnim
	ldr r0, _080EE9D0 @ =sub_80EE9D4
	str r0, [r4, 0x1C]
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080EE9D0: .4byte sub_80EE9D4
	thumb_func_end sub_80EE970

	thumb_func_start sub_80EE9D4
sub_80EE9D4: @ 80EE9D4
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r0, 0x2E
	ldrsh r5, [r4, r0]
	cmp r5, 0x1
	beq _080EEA08
	cmp r5, 0x1
	bgt _080EE9EA
	cmp r5, 0
	beq _080EE9F0
	b _080EEA88
_080EE9EA:
	cmp r5, 0x2
	beq _080EEA6E
	b _080EEA88
_080EE9F0:
	ldrh r0, [r4, 0x3A]
	adds r0, 0x1
	strh r0, [r4, 0x3A]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	ble _080EEA88
	adds r0, r4, 0
	movs r1, 0x3
	bl StartSpriteAnim
	b _080EEA64
_080EEA08:
	ldrh r0, [r4, 0x30]
	subs r0, 0x1
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r5, r0, 16
	cmp r5, 0
	beq _080EEA4C
	ldrh r1, [r4, 0x34]
	ldrh r2, [r4, 0x32]
	adds r1, r2
	strh r1, [r4, 0x32]
	ldrh r0, [r4, 0x38]
	ldrh r2, [r4, 0x36]
	adds r0, r2
	strh r0, [r4, 0x36]
	lsls r1, 16
	asrs r1, 20
	strh r1, [r4, 0x24]
	ldr r1, _080EEA48 @ =gSineTable
	lsls r0, 16
	asrs r0, 20
	lsls r0, 1
	adds r0, r1
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0x3C
	ldrsh r1, [r4, r2]
	asrs r0, r1
	negs r0, r0
	strh r0, [r4, 0x26]
	b _080EEA88
	.align 2, 0
_080EEA48: .4byte gSineTable
_080EEA4C:
	ldrh r0, [r4, 0x32]
	lsrs r0, 4
	strh r0, [r4, 0x24]
	strh r5, [r4, 0x26]
	adds r0, r4, 0
	movs r1, 0x2
	bl StartSpriteAnim
	movs r1, 0x3C
	ldrsh r0, [r4, r1]
	cmp r0, 0x5
	beq _080EEA84
_080EEA64:
	strh r5, [r4, 0x3A]
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	b _080EEA88
_080EEA6E:
	ldrh r0, [r4, 0x3A]
	adds r0, 0x1
	strh r0, [r4, 0x3A]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	ble _080EEA88
	adds r0, r4, 0
	movs r1, 0
	bl StartSpriteAnim
_080EEA84:
	ldr r0, _080EEA90 @ =SpriteCallbackDummy
	str r0, [r4, 0x1C]
_080EEA88:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080EEA90: .4byte SpriteCallbackDummy
	thumb_func_end sub_80EE9D4

	thumb_func_start sub_80EEA94
sub_80EEA94: @ 80EEA94
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, [r4, 0x18]
	movs r2, 0
	strh r2, [r0, 0x2E]
	ldr r0, [r4, 0x18]
	strh r2, [r0, 0x30]
	ldr r0, [r4, 0x18]
	strh r2, [r0, 0x32]
	ldr r0, [r4, 0x18]
	strh r2, [r0, 0x34]
	ldr r0, [r4, 0x18]
	strh r2, [r0, 0x36]
	ldr r0, [r4, 0x18]
	strh r2, [r0, 0x38]
	ldr r1, [r4, 0x18]
	ldrh r0, [r1, 0x24]
	ldrh r3, [r1, 0x20]
	adds r0, r3
	strh r0, [r1, 0x20]
	ldr r0, [r4, 0x18]
	strh r2, [r0, 0x24]
	ldr r1, _080EEAF4 @ =gUnknown_203AB0C
	movs r0, 0x24
	strh r0, [r1]
	ldr r1, _080EEAF8 @ =gUnknown_203AB06
	movs r0, 0x28
	strh r0, [r1]
	ldr r1, _080EEAFC @ =gUnknown_203AB04
	movs r0, 0x3
	strh r0, [r1]
	ldr r1, _080EEB00 @ =gUnknown_203AB08
	movs r0, 0x4
	strh r0, [r1]
	ldr r1, [r4, 0x18]
	movs r0, 0x24
	strh r0, [r1, 0x3C]
	ldr r0, [r4, 0x18]
	movs r1, 0x2
	bl StartSpriteAnim
	ldr r1, [r4, 0x18]
	ldr r0, _080EEB04 @ =sub_80EEB08
	str r0, [r1, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080EEAF4: .4byte gUnknown_203AB0C
_080EEAF8: .4byte gUnknown_203AB06
_080EEAFC: .4byte gUnknown_203AB04
_080EEB00: .4byte gUnknown_203AB08
_080EEB04: .4byte sub_80EEB08
	thumb_func_end sub_80EEA94

	thumb_func_start sub_80EEB08
sub_80EEB08: @ 80EEB08
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _080EEB58
	cmp r0, 0x1
	bgt _080EEB1E
	cmp r0, 0
	beq _080EEB24
	b _080EEBCE
_080EEB1E:
	cmp r0, 0x2
	beq _080EEB84
	b _080EEBCE
_080EEB24:
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080EEB4A
	ldrh r0, [r4, 0x32]
	adds r0, 0x1
	strh r0, [r4, 0x32]
	ands r0, r1
	cmp r0, 0
	beq _080EEB44
	ldrh r0, [r4, 0x24]
	adds r0, 0x1
	b _080EEB48
_080EEB44:
	ldrh r0, [r4, 0x24]
	subs r0, 0x1
_080EEB48:
	strh r0, [r4, 0x24]
_080EEB4A:
	movs r3, 0x30
	ldrsh r0, [r4, r3]
	cmp r0, 0x11
	ble _080EEBCE
	movs r0, 0
	strh r0, [r4, 0x30]
	b _080EEB78
_080EEB58:
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	movs r5, 0
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	ldr r1, _080EEB80 @ =gUnknown_203AB06
	ldrh r1, [r1]
	cmp r0, r1
	blt _080EEBCE
	adds r0, r4, 0
	movs r1, 0x4
	bl StartSpriteAnim
	strh r5, [r4, 0x30]
	strh r5, [r4, 0x32]
_080EEB78:
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	b _080EEBCE
	.align 2, 0
_080EEB80: .4byte gUnknown_203AB06
_080EEB84:
	ldrh r2, [r4, 0x3C]
	ldrh r1, [r4, 0x30]
	adds r0, r2, r1
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 20
	negs r1, r0
	strh r1, [r4, 0x24]
	ldr r1, _080EEBD4 @ =gSineTable
	lsls r0, 1
	adds r0, r1
	movs r3, 0
	ldrsh r1, [r0, r3]
	ldr r0, _080EEBD8 @ =gUnknown_203AB04
	ldrh r0, [r0]
	muls r0, r1
	ldr r1, _080EEBDC @ =gUnknown_203AB08
	ldrh r1, [r1]
	asrs r0, r1
	negs r0, r0
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x32]
	adds r0, 0x1
	strh r0, [r4, 0x32]
	lsls r0, r2, 16
	asrs r0, 16
	cmp r0, 0xC
	ble _080EEBC0
	subs r0, r2, 0x1
	strh r0, [r4, 0x3C]
_080EEBC0:
	ldrh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 20
	cmp r0, 0x3F
	ble _080EEBCE
	ldr r0, _080EEBE0 @ =SpriteCallbackDummy
	str r0, [r4, 0x1C]
_080EEBCE:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080EEBD4: .4byte gSineTable
_080EEBD8: .4byte gUnknown_203AB04
_080EEBDC: .4byte gUnknown_203AB08
_080EEBE0: .4byte SpriteCallbackDummy
	thumb_func_end sub_80EEB08

	thumb_func_start sub_80EEBE4
sub_80EEBE4: @ 80EEBE4
	push {r4,r5,lr}
	movs r5, 0
	ldr r4, _080EEC04 @ =gUnknown_840BEDC
_080EEBEA:
	adds r0, r4, 0
	bl LoadCompressedSpriteSheet
	adds r4, 0x8
	adds r5, 0x1
	cmp r5, 0x6
	bls _080EEBEA
	ldr r0, _080EEC08 @ =gUnknown_840BF14
	bl LoadSpritePalettes
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080EEC04: .4byte gUnknown_840BEDC
_080EEC08: .4byte gUnknown_840BF14
	thumb_func_end sub_80EEBE4

	.align 2, 0 @ Don't pad with nop.
