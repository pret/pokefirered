	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_8058F1C
sub_8058F1C: @ 8058F1C
	push {lr}
	adds r2, r0, 0
	lsls r1, 24
	lsrs r3, r1, 24
	cmp r3, 0x7
	bhi _08058F3A
	ldr r1, _08058F40 @ =gUnknown_8352EF0
	lsls r0, r3, 2
	adds r0, r1
	ldr r0, [r0]
	ands r2, r0
	ldr r0, _08058F44 @ =gUnknown_8352F10
	adds r0, r3, r0
	ldrb r0, [r0]
	lsrs r2, r0
_08058F3A:
	adds r0, r2, 0
	pop {r1}
	bx r1
	.align 2, 0
_08058F40: .4byte gUnknown_8352EF0
_08058F44: .4byte gUnknown_8352F10
	thumb_func_end sub_8058F1C

	thumb_func_start sub_8058F48
sub_8058F48: @ 8058F48
	push {r4,lr}
	adds r4, r2, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r0, 16
	asrs r0, 16
	lsls r1, 16
	asrs r1, 16
	bl MapGridGetMetatileIdAt
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	ldr r0, _08058F74 @ =gMapHeader
	ldr r0, [r0]
	adds r2, r4, 0
	bl sub_8059080
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08058F74: .4byte gMapHeader
	thumb_func_end sub_8058F48

	thumb_func_start MapGridGetMetatileBehaviorAt
MapGridGetMetatileBehaviorAt: @ 8058F78
	push {lr}
	lsls r0, 16
	asrs r0, 16
	lsls r1, 16
	asrs r1, 16
	movs r2, 0
	bl sub_8058F48
	pop {r1}
	bx r1
	thumb_func_end MapGridGetMetatileBehaviorAt

	thumb_func_start sub_8058F8C
sub_8058F8C: @ 8058F8C
	push {lr}
	lsls r0, 16
	asrs r0, 16
	lsls r1, 16
	asrs r1, 16
	movs r2, 0x6
	bl sub_8058F48
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end sub_8058F8C

	thumb_func_start MapGridSetMetatileIdAt
MapGridSetMetatileIdAt: @ 8058FA4
	push {r4,r5,lr}
	adds r3, r0, 0
	lsls r2, 16
	lsrs r5, r2, 16
	cmp r3, 0
	blt _08058FDC
	ldr r2, _08058FE4 @ =VMap
	ldr r4, [r2]
	cmp r3, r4
	bge _08058FDC
	cmp r1, 0
	blt _08058FDC
	ldr r0, [r2, 0x4]
	cmp r1, r0
	bge _08058FDC
	muls r1, r4
	adds r1, r3, r1
	ldr r0, [r2, 0x8]
	lsls r1, 1
	adds r1, r0
	ldrh r0, [r1]
	movs r2, 0xF0
	lsls r2, 8
	ands r2, r0
	ldr r0, _08058FE8 @ =0x00000fff
	ands r0, r5
	orrs r2, r0
	strh r2, [r1]
_08058FDC:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08058FE4: .4byte VMap
_08058FE8: .4byte 0x00000fff
	thumb_func_end MapGridSetMetatileIdAt

	thumb_func_start MapGridSetMetatileEntryAt
MapGridSetMetatileEntryAt: @ 8058FEC
	push {r4,r5,lr}
	adds r3, r0, 0
	lsls r2, 16
	lsrs r5, r2, 16
	cmp r3, 0
	blt _08059018
	ldr r2, _08059020 @ =VMap
	ldr r4, [r2]
	cmp r3, r4
	bge _08059018
	cmp r1, 0
	blt _08059018
	ldr r0, [r2, 0x4]
	cmp r1, r0
	bge _08059018
	adds r0, r4, 0
	muls r0, r1
	adds r0, r3, r0
	ldr r1, [r2, 0x8]
	lsls r0, 1
	adds r0, r1
	strh r5, [r0]
_08059018:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08059020: .4byte VMap
	thumb_func_end MapGridSetMetatileEntryAt

	thumb_func_start sub_8059024
sub_8059024: @ 8059024
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r3, r1, 0
	adds r5, r2, 0
	cmp r4, 0
	blt _08059076
	ldr r2, _08059060 @ =VMap
	ldr r1, [r2]
	cmp r4, r1
	bge _08059076
	cmp r3, 0
	blt _08059076
	ldr r0, [r2, 0x4]
	cmp r3, r0
	bge _08059076
	cmp r5, 0
	beq _08059064
	adds r0, r1, 0
	muls r0, r3
	adds r0, r4, r0
	ldr r1, [r2, 0x8]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r3, 0xC0
	lsls r3, 4
	adds r2, r3, 0
	orrs r1, r2
	strh r1, [r0]
	b _08059076
	.align 2, 0
_08059060: .4byte VMap
_08059064:
	muls r1, r3
	adds r1, r4, r1
	ldr r0, [r2, 0x8]
	lsls r1, 1
	adds r1, r0
	ldrh r2, [r1]
	ldr r0, _0805907C @ =0x0000f3ff
	ands r0, r2
	strh r0, [r1]
_08059076:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805907C: .4byte 0x0000f3ff
	thumb_func_end sub_8059024

	thumb_func_start sub_8059080
sub_8059080: @ 8059080
	push {r4-r6,lr}
	adds r4, r0, 0
	lsls r1, 16
	lsrs r3, r1, 16
	adds r5, r3, 0
	lsls r2, 24
	lsrs r2, 24
	adds r6, r2, 0
	ldr r0, _080590A4 @ =0x0000027f
	cmp r3, r0
	bhi _080590A8
	ldr r0, [r4, 0x10]
	ldr r1, [r0, 0x14]
	lsls r0, r3, 2
	adds r0, r1
	ldr r0, [r0]
	adds r1, r2, 0
	b _080590C8
	.align 2, 0
_080590A4: .4byte 0x0000027f
_080590A8:
	ldr r0, _080590B4 @ =0x000003ff
	cmp r3, r0
	bls _080590B8
	movs r0, 0xFF
	b _080590CC
	.align 2, 0
_080590B4: .4byte 0x000003ff
_080590B8:
	ldr r0, [r4, 0x14]
	ldr r1, [r0, 0x14]
	lsls r0, r5, 2
	adds r0, r1
	ldr r1, _080590D4 @ =0xfffff600
	adds r0, r1
	ldr r0, [r0]
	adds r1, r6, 0
_080590C8:
	bl sub_8058F1C
_080590CC:
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_080590D4: .4byte 0xfffff600
	thumb_func_end sub_8059080

	thumb_func_start sub_80590D8
sub_80590D8: @ 80590D8
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	ldr r0, _08059144 @ =gSaveBlock2Ptr
	ldr r0, [r0]
	ldr r1, _08059148 @ =0x00000898
	adds r4, r0, r1
	ldr r0, _0805914C @ =VMap
	ldr r0, [r0]
	mov r8, r0
	ldr r0, _08059150 @ =gSaveBlock1Ptr
	ldr r0, [r0]
	movs r2, 0
	ldrsh r6, [r0, r2]
	movs r1, 0x2
	ldrsh r0, [r0, r1]
	adds r1, r0, 0
	adds r1, 0xE
	cmp r0, r1
	bge _08059138
	mov r12, r1
	ldr r2, _08059154 @ =gBackupMapData
	mov r9, r2
	lsls r7, r6, 1
_0805910A:
	adds r1, r6, 0
	adds r3, r1, 0
	adds r3, 0xF
	adds r5, r0, 0x1
	cmp r1, r3
	bge _08059132
	mov r2, r8
	muls r2, r0
	adds r0, r2, 0
	lsls r0, 1
	add r0, r9
	adds r2, r7, r0
	subs r1, r3, r1
_08059124:
	ldrh r0, [r2]
	strh r0, [r4]
	adds r4, 0x2
	adds r2, 0x2
	subs r1, 0x1
	cmp r1, 0
	bne _08059124
_08059132:
	adds r0, r5, 0
	cmp r0, r12
	blt _0805910A
_08059138:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08059144: .4byte gSaveBlock2Ptr
_08059148: .4byte 0x00000898
_0805914C: .4byte VMap
_08059150: .4byte gSaveBlock1Ptr
_08059154: .4byte gBackupMapData
	thumb_func_end sub_80590D8

	thumb_func_start sub_8059158
sub_8059158: @ 8059158
	push {r4,lr}
	movs r2, 0
	movs r1, 0
	ldr r0, _08059184 @ =gSaveBlock2Ptr
	ldr r0, [r0]
	ldr r4, _08059188 @ =0x00000898
	adds r3, r0, r4
	ldr r4, _0805918C @ =0x000001ff
_08059168:
	lsls r0, r1, 1
	adds r0, r3, r0
	ldrh r0, [r0]
	orrs r2, r0
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, r4
	bls _08059168
	cmp r2, 0
	beq _08059190
	movs r0, 0
	b _08059192
	.align 2, 0
_08059184: .4byte gSaveBlock2Ptr
_08059188: .4byte 0x00000898
_0805918C: .4byte 0x000001ff
_08059190:
	movs r0, 0x1
_08059192:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8059158

	thumb_func_start sub_8059198
sub_8059198: @ 8059198
	push {lr}
	sub sp, 0x4
	mov r1, sp
	movs r0, 0
	strh r0, [r1]
	ldr r0, _080591B8 @ =gSaveBlock2Ptr
	ldr r1, [r0]
	ldr r0, _080591BC @ =0x00000898
	adds r1, r0
	ldr r2, _080591C0 @ =0x01000100
	mov r0, sp
	bl CpuSet
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_080591B8: .4byte gSaveBlock2Ptr
_080591BC: .4byte 0x00000898
_080591C0: .4byte 0x01000100
	thumb_func_end sub_8059198

	thumb_func_start sub_80591C4
sub_80591C4: @ 80591C4
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	ldr r0, _0805923C @ =gSaveBlock2Ptr
	ldr r0, [r0]
	ldr r1, _08059240 @ =0x00000898
	adds r4, r0, r1
	bl sub_8059158
	cmp r0, 0
	bne _08059230
	ldr r0, _08059244 @ =VMap
	ldr r0, [r0]
	mov r8, r0
	ldr r0, _08059248 @ =gSaveBlock1Ptr
	ldr r0, [r0]
	movs r2, 0
	ldrsh r6, [r0, r2]
	movs r1, 0x2
	ldrsh r0, [r0, r1]
	adds r1, r0, 0
	adds r1, 0xE
	cmp r0, r1
	bge _0805922C
	mov r12, r1
	ldr r2, _0805924C @ =gBackupMapData
	mov r9, r2
	lsls r7, r6, 1
_080591FE:
	adds r1, r6, 0
	adds r3, r1, 0
	adds r3, 0xF
	adds r5, r0, 0x1
	cmp r1, r3
	bge _08059226
	mov r2, r8
	muls r2, r0
	adds r0, r2, 0
	lsls r0, 1
	add r0, r9
	adds r2, r7, r0
	subs r1, r3, r1
_08059218:
	ldrh r0, [r4]
	strh r0, [r2]
	adds r4, 0x2
	adds r2, 0x2
	subs r1, 0x1
	cmp r1, 0
	bne _08059218
_08059226:
	adds r0, r5, 0
	cmp r0, r12
	blt _080591FE
_0805922C:
	bl sub_8059198
_08059230:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805923C: .4byte gSaveBlock2Ptr
_08059240: .4byte 0x00000898
_08059244: .4byte VMap
_08059248: .4byte gSaveBlock1Ptr
_0805924C: .4byte gBackupMapData
	thumb_func_end sub_80591C4

	thumb_func_start sub_8059250
sub_8059250: @ 8059250
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0xC
	lsls r0, 24
	lsrs r1, r0, 24
	adds r2, r1, 0
	ldr r0, _0805929C @ =gSaveBlock2Ptr
	ldr r0, [r0]
	ldr r3, _080592A0 @ =0x00000898
	adds r3, r0, r3
	str r3, [sp, 0x4]
	ldr r0, _080592A4 @ =VMap
	ldr r0, [r0]
	str r0, [sp]
	movs r4, 0
	mov r9, r4
	mov r8, r4
	ldr r0, _080592A8 @ =gSaveBlock1Ptr
	ldr r0, [r0]
	movs r3, 0
	ldrsh r6, [r0, r3]
	str r6, [sp, 0x8]
	movs r4, 0x2
	ldrsh r5, [r0, r4]
	movs r7, 0xF
	movs r6, 0xE
	mov r12, r6
	cmp r1, 0x2
	beq _080592B6
	cmp r1, 0x2
	bgt _080592AC
	cmp r1, 0x1
	beq _080592BE
	b _080592D6
	.align 2, 0
_0805929C: .4byte gSaveBlock2Ptr
_080592A0: .4byte 0x00000898
_080592A4: .4byte VMap
_080592A8: .4byte gSaveBlock1Ptr
_080592AC:
	cmp r2, 0x3
	beq _080592C8
	cmp r2, 0x4
	beq _080592D0
	b _080592D6
_080592B6:
	adds r5, 0x1
	movs r0, 0xD
	mov r12, r0
	b _080592D6
_080592BE:
	movs r1, 0x1
	mov r8, r1
	movs r3, 0xD
	mov r12, r3
	b _080592D6
_080592C8:
	ldr r4, [sp, 0x8]
	adds r4, 0x1
	str r4, [sp, 0x8]
	b _080592D4
_080592D0:
	movs r6, 0x1
	mov r9, r6
_080592D4:
	movs r7, 0xE
_080592D6:
	movs r1, 0
	cmp r1, r12
	bge _0805931A
	ldr r0, _08059330 @ =gBackupMapData
	mov r10, r0
_080592E0:
	adds r4, r1, 0x1
	cmp r7, 0
	beq _08059314
	adds r0, r1, r5
	ldr r3, [sp]
	adds r2, r3, 0
	muls r2, r0
	add r1, r8
	lsls r0, r1, 4
	subs r0, r1
	add r0, r9
	ldr r6, [sp, 0x8]
	adds r2, r6, r2
	adds r3, r7, 0
	lsls r2, 1
	add r2, r10
	lsls r0, 1
	ldr r6, [sp, 0x4]
	adds r1, r0, r6
_08059306:
	ldrh r0, [r1]
	strh r0, [r2]
	adds r1, 0x2
	adds r2, 0x2
	subs r3, 0x1
	cmp r3, 0
	bne _08059306
_08059314:
	adds r1, r4, 0
	cmp r1, r12
	blt _080592E0
_0805931A:
	bl sub_8059198
	add sp, 0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08059330: .4byte gBackupMapData
	thumb_func_end sub_8059250

	thumb_func_start sub_8059334
sub_8059334: @ 8059334
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r7, r0, 0
	mov r8, r1
	cmp r7, 0
	blt _08059374
	ldr r1, _0805936C @ =VMap
	ldr r2, [r1]
	cmp r7, r2
	bge _08059374
	mov r0, r8
	cmp r0, 0
	blt _08059374
	ldr r0, [r1, 0x4]
	cmp r8, r0
	bge _08059374
	mov r0, r8
	muls r0, r2
	adds r0, r7, r0
	ldr r1, [r1, 0x8]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	ldr r0, _08059370 @ =0x000003ff
	cmp r1, r0
	beq _08059422
	b _080593B0
	.align 2, 0
_0805936C: .4byte VMap
_08059370: .4byte 0x000003ff
_08059374:
	ldr r0, _080593CC @ =gMapHeader
	ldr r6, [r0]
	subs r0, r7, 0x7
	ldrb r5, [r6, 0x18]
	lsls r1, r5, 3
	adds r0, r1
	adds r1, r5, 0
	bl __modsi3
	adds r4, r0, 0
	mov r0, r8
	subs r0, 0x7
	ldrb r1, [r6, 0x19]
	lsls r2, r1, 3
	adds r0, r2
	bl __modsi3
	muls r0, r5
	adds r4, r0
	ldr r0, [r6, 0x8]
	lsls r4, 1
	adds r4, r0
	ldrh r1, [r4]
	movs r2, 0xC0
	lsls r2, 4
	adds r0, r2, 0
	orrs r0, r1
	ldr r1, _080593D0 @ =0x000003ff
	cmp r0, r1
	beq _08059422
_080593B0:
	ldr r1, _080593D4 @ =VMap
	ldr r0, [r1]
	subs r0, 0x8
	cmp r7, r0
	blt _080593DC
	ldr r0, _080593D8 @ =gMapConnectionFlags
	ldrb r1, [r0]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _08059422
	movs r0, 0x4
	b _08059432
	.align 2, 0
_080593CC: .4byte gMapHeader
_080593D0: .4byte 0x000003ff
_080593D4: .4byte VMap
_080593D8: .4byte gMapConnectionFlags
_080593DC:
	cmp r7, 0x6
	bgt _080593F4
	ldr r0, _080593F0 @ =gMapConnectionFlags
	ldrb r1, [r0]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _08059422
	movs r0, 0x3
	b _08059432
	.align 2, 0
_080593F0: .4byte gMapConnectionFlags
_080593F4:
	ldr r0, [r1, 0x4]
	subs r0, 0x7
	cmp r8, r0
	blt _08059410
	ldr r0, _0805940C @ =gMapConnectionFlags
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08059422
	movs r0, 0x1
	b _08059432
	.align 2, 0
_0805940C: .4byte gMapConnectionFlags
_08059410:
	mov r0, r8
	cmp r0, 0x6
	bgt _08059430
	ldr r0, _08059428 @ =gMapConnectionFlags
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	bne _0805942C
_08059422:
	movs r0, 0x1
	negs r0, r0
	b _08059432
	.align 2, 0
_08059428: .4byte gMapConnectionFlags
_0805942C:
	movs r0, 0x2
	b _08059432
_08059430:
	movs r0, 0
_08059432:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8059334

	thumb_func_start GetPostCameraMoveMapBorderId
GetPostCameraMoveMapBorderId: @ 805943C
	push {r4,lr}
	adds r3, r1, 0
	ldr r1, _08059460 @ =gSaveBlock1Ptr
	ldr r1, [r1]
	movs r4, 0
	ldrsh r2, [r1, r4]
	adds r0, 0x7
	adds r2, r0
	movs r0, 0x2
	ldrsh r1, [r1, r0]
	adds r3, 0x7
	adds r1, r3
	adds r0, r2, 0
	bl sub_8059334
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08059460: .4byte gSaveBlock1Ptr
	thumb_func_end GetPostCameraMoveMapBorderId

	thumb_func_start CanCameraMoveInDirection
CanCameraMoveInDirection: @ 8059464
	push {r4,r5,lr}
	ldr r1, _0805949C @ =gSaveBlock1Ptr
	ldr r4, [r1]
	movs r1, 0
	ldrsh r3, [r4, r1]
	ldr r2, _080594A0 @ =gUnknown_826D2D8
	lsls r0, 3
	adds r1, r0, r2
	ldr r1, [r1]
	adds r1, 0x7
	adds r3, r1
	movs r5, 0x2
	ldrsh r1, [r4, r5]
	adds r2, 0x4
	adds r0, r2
	ldr r0, [r0]
	adds r0, 0x7
	adds r1, r0
	adds r0, r3, 0
	bl sub_8059334
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	beq _080594A4
	movs r0, 0x1
	b _080594A6
	.align 2, 0
_0805949C: .4byte gSaveBlock1Ptr
_080594A0: .4byte gUnknown_826D2D8
_080594A4:
	movs r0, 0
_080594A6:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end CanCameraMoveInDirection

	thumb_func_start sub_80594AC
sub_80594AC: @ 80594AC
	push {r4-r7,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	adds r6, r2, 0
	adds r7, r3, 0
	bl mapconnection_get_mapheader
	adds r3, r0, 0
	cmp r4, 0x2
	beq _08059514
	cmp r4, 0x2
	bgt _080594CA
	cmp r4, 0x1
	beq _08059500
	b _08059526
_080594CA:
	cmp r4, 0x3
	beq _080594E8
	cmp r4, 0x4
	bne _08059526
	ldr r0, _080594E4 @ =gSaveBlock1Ptr
	ldr r1, [r0]
	negs r0, r6
	strh r0, [r1]
	ldr r2, [r5, 0x4]
	ldrh r0, [r1, 0x2]
	subs r0, r2
	b _08059524
	.align 2, 0
_080594E4: .4byte gSaveBlock1Ptr
_080594E8:
	ldr r0, _080594FC @ =gSaveBlock1Ptr
	ldr r1, [r0]
	ldr r0, [r3]
	ldr r0, [r0]
	strh r0, [r1]
	ldr r2, [r5, 0x4]
	ldrh r0, [r1, 0x2]
	subs r0, r2
	b _08059524
	.align 2, 0
_080594FC: .4byte gSaveBlock1Ptr
_08059500:
	ldr r0, _08059510 @ =gSaveBlock1Ptr
	ldr r1, [r0]
	ldr r2, [r5, 0x4]
	ldrh r0, [r1]
	subs r0, r2
	strh r0, [r1]
	negs r0, r7
	b _08059524
	.align 2, 0
_08059510: .4byte gSaveBlock1Ptr
_08059514:
	ldr r0, _0805952C @ =gSaveBlock1Ptr
	ldr r1, [r0]
	ldr r2, [r5, 0x4]
	ldrh r0, [r1]
	subs r0, r2
	strh r0, [r1]
	ldr r0, [r3]
	ldr r0, [r0, 0x4]
_08059524:
	strh r0, [r1, 0x2]
_08059526:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805952C: .4byte gSaveBlock1Ptr
	thumb_func_end sub_80594AC

	thumb_func_start CameraMove
CameraMove: @ 8059530
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	mov r10, r0
	mov r9, r1
	ldr r1, _08059570 @ =gUnknown_2036E18
	ldrb r0, [r1]
	movs r1, 0x2
	negs r1, r1
	ands r1, r0
	ldr r2, _08059570 @ =gUnknown_2036E18
	strb r1, [r2]
	mov r0, r10
	mov r1, r9
	bl GetPostCameraMoveMapBorderId
	adds r7, r0, 0
	adds r0, r7, 0x1
	cmp r0, 0x1
	bhi _08059578
	ldr r0, _08059574 @ =gSaveBlock1Ptr
	ldr r1, [r0]
	ldrh r0, [r1]
	add r0, r10
	strh r0, [r1]
	ldrh r0, [r1, 0x2]
	add r0, r9
	strh r0, [r1, 0x2]
	b _080595E2
	.align 2, 0
_08059570: .4byte gUnknown_2036E18
_08059574: .4byte gSaveBlock1Ptr
_08059578:
	bl sub_80590D8
	ldr r1, _080595F8 @ =gSaveBlock1Ptr
	ldr r0, [r1]
	movs r2, 0
	ldrsh r5, [r0, r2]
	movs r1, 0x2
	ldrsh r6, [r0, r1]
	lsls r2, r7, 24
	lsrs r2, 24
	mov r8, r2
	mov r0, r8
	adds r1, r5, 0
	adds r2, r6, 0
	bl sub_8059600
	adds r4, r0, 0
	adds r1, r7, 0
	mov r2, r10
	mov r3, r9
	bl sub_80594AC
	ldrb r0, [r4, 0x8]
	ldrb r1, [r4, 0x9]
	bl sub_8055864
	ldr r1, _080595FC @ =gUnknown_2036E18
	ldrb r0, [r1]
	movs r1, 0x1
	orrs r0, r1
	ldr r2, _080595FC @ =gUnknown_2036E18
	strb r0, [r2]
	ldr r0, _080595F8 @ =gSaveBlock1Ptr
	ldr r1, [r0]
	movs r2, 0
	ldrsh r0, [r1, r2]
	subs r5, r0
	ldr r0, _080595FC @ =gUnknown_2036E18
	str r5, [r0, 0x4]
	movs r2, 0x2
	ldrsh r0, [r1, r2]
	subs r6, r0
	ldr r0, _080595FC @ =gUnknown_2036E18
	str r6, [r0, 0x8]
	ldrh r0, [r1]
	add r0, r10
	strh r0, [r1]
	ldrh r0, [r1, 0x2]
	add r0, r9
	strh r0, [r1, 0x2]
	mov r0, r8
	bl sub_8059250
_080595E2:
	ldr r0, _080595FC @ =gUnknown_2036E18
	ldrb r0, [r0]
	lsls r0, 31
	lsrs r0, 31
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080595F8: .4byte gSaveBlock1Ptr
_080595FC: .4byte gUnknown_2036E18
	thumb_func_end CameraMove

	thumb_func_start sub_8059600
sub_8059600: @ 8059600
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	mov r9, r1
	mov r8, r2
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r0, _0805963C @ =gMapHeader
	ldr r0, [r0, 0xC]
	ldr r7, [r0]
	ldr r4, [r0, 0x4]
	movs r5, 0
	cmp r5, r7
	bge _08059648
_0805961E:
	ldrb r0, [r4]
	cmp r0, r6
	bne _08059640
	adds r0, r6, 0
	mov r1, r9
	mov r2, r8
	adds r3, r4, 0
	bl sub_8059658
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08059640
	adds r0, r4, 0
	b _0805964A
	.align 2, 0
_0805963C: .4byte gMapHeader
_08059640:
	adds r5, 0x1
	adds r4, 0xC
	cmp r5, r7
	blt _0805961E
_08059648:
	movs r0, 0
_0805964A:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8059600

	thumb_func_start sub_8059658
sub_8059658: @ 8059658
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r7, r1, 0
	mov r8, r2
	adds r5, r3, 0
	lsls r0, 24
	lsrs r4, r0, 24
	adds r6, r4, 0
	adds r0, r5, 0
	bl mapconnection_get_mapheader
	adds r2, r0, 0
	cmp r4, 0x1
	blt _080596B0
	cmp r4, 0x2
	bgt _08059690
	ldr r0, _0805968C @ =gMapHeader
	ldr r0, [r0]
	ldr r1, [r0]
	ldr r0, [r2]
	ldr r2, [r0]
	ldr r3, [r5, 0x4]
	adds r0, r7, 0
	b _080596A2
	.align 2, 0
_0805968C: .4byte gMapHeader
_08059690:
	cmp r6, 0x4
	bgt _080596B0
	ldr r0, _080596AC @ =gMapHeader
	ldr r0, [r0]
	ldr r1, [r0, 0x4]
	ldr r0, [r2]
	ldr r2, [r0, 0x4]
	ldr r3, [r5, 0x4]
	mov r0, r8
_080596A2:
	bl sub_80596BC
	lsls r0, 24
	lsrs r0, 24
	b _080596B2
	.align 2, 0
_080596AC: .4byte gMapHeader
_080596B0:
	movs r0, 0
_080596B2:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8059658

	thumb_func_start sub_80596BC
sub_80596BC: @ 80596BC
	push {r4,lr}
	adds r4, r0, 0
	adds r0, r2, 0
	adds r2, r3, 0
	cmp r3, 0
	bge _080596CA
	movs r3, 0
_080596CA:
	adds r2, r0, r2
	cmp r2, r1
	bge _080596D2
	adds r1, r2, 0
_080596D2:
	cmp r3, r4
	bgt _080596DE
	cmp r4, r1
	bgt _080596DE
	movs r0, 0x1
	b _080596E0
_080596DE:
	movs r0, 0
_080596E0:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80596BC

	thumb_func_start sub_80596E8
sub_80596E8: @ 80596E8
	push {lr}
	cmp r0, 0
	blt _080596F6
	cmp r0, r1
	bge _080596F6
	movs r0, 0x1
	b _080596F8
_080596F6:
	movs r0, 0
_080596F8:
	pop {r1}
	bx r1
	thumb_func_end sub_80596E8

	thumb_func_start sub_80596FC
sub_80596FC: @ 80596FC
	push {r4-r6,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r6, r2, 0
	bl mapconnection_get_mapheader
	adds r1, r0, 0
	ldrb r0, [r4]
	cmp r0, 0x1
	blt _08059734
	cmp r0, 0x2
	bgt _08059722
	ldr r0, [r4, 0x4]
	subs r0, r5, r0
	ldr r1, [r1]
	ldr r1, [r1]
	bl sub_80596E8
	b _08059736
_08059722:
	cmp r0, 0x4
	bgt _08059734
	ldr r0, [r4, 0x4]
	subs r0, r6, r0
	ldr r1, [r1]
	ldr r1, [r1, 0x4]
	bl sub_80596E8
	b _08059736
_08059734:
	movs r0, 0
_08059736:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80596FC

	thumb_func_start sub_805973C
sub_805973C: @ 805973C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	lsls r1, 16
	lsrs r1, 16
	ldr r2, _0805975C @ =gMapHeader
	ldr r0, [r2, 0xC]
	cmp r0, 0
	bne _08059764
	b _080597DA
	.align 2, 0
_0805975C: .4byte gMapHeader
_08059760:
	adds r0, r4, 0
	b _080597DC
_08059764:
	ldr r7, [r0]
	ldr r4, [r0, 0x4]
	movs r6, 0
	cmp r6, r7
	bge _080597DA
	lsls r0, r1, 16
	asrs r5, r0, 16
	mov r9, r2
	mov r1, r8
	lsls r0, r1, 16
	asrs r0, 16
	mov r10, r0
_0805977C:
	ldrb r1, [r4]
	adds r3, r1, 0
	subs r0, r1, 0x5
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bls _080597D2
	cmp r1, 0x2
	bne _08059792
	cmp r5, 0x6
	bgt _080597D2
_08059792:
	cmp r1, 0x1
	bne _080597A2
	mov r2, r9
	ldr r0, [r2]
	ldr r0, [r0, 0x4]
	adds r0, 0x7
	cmp r5, r0
	blt _080597D2
_080597A2:
	mov r0, r8
	lsls r2, r0, 16
	cmp r1, 0x3
	bne _080597B0
	mov r1, r10
	cmp r1, 0x6
	bgt _080597D2
_080597B0:
	cmp r3, 0x4
	bne _080597C2
	asrs r1, r2, 16
	mov r3, r9
	ldr r0, [r3]
	ldr r0, [r0]
	adds r0, 0x7
	cmp r1, r0
	blt _080597D2
_080597C2:
	asrs r1, r2, 16
	subs r1, 0x7
	adds r0, r4, 0
	subs r2, r5, 0x7
	bl sub_80596FC
	cmp r0, 0x1
	beq _08059760
_080597D2:
	adds r6, 0x1
	adds r4, 0xC
	cmp r6, r7
	blt _0805977C
_080597DA:
	movs r0, 0
_080597DC:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_805973C

	thumb_func_start sub_80597EC
sub_80597EC: @ 80597EC
	lsls r0, 16
	lsrs r0, 16
	lsls r1, 16
	lsrs r1, 16
	ldr r2, _08059804 @ =gSaveBlock1Ptr
	ldr r2, [r2]
	subs r0, 0x7
	strh r0, [r2]
	subs r1, 0x7
	strh r1, [r2, 0x2]
	bx lr
	.align 2, 0
_08059804: .4byte gSaveBlock1Ptr
	thumb_func_end sub_80597EC

	thumb_func_start sav1_camera_get_focus_coords
sav1_camera_get_focus_coords: @ 8059808
	ldr r2, _0805981C @ =gSaveBlock1Ptr
	ldr r3, [r2]
	ldrh r2, [r3]
	adds r2, 0x7
	strh r2, [r0]
	ldrh r0, [r3, 0x2]
	adds r0, 0x7
	strh r0, [r1]
	bx lr
	.align 2, 0
_0805981C: .4byte gSaveBlock1Ptr
	thumb_func_end sav1_camera_get_focus_coords

	thumb_func_start SetCameraCoords
SetCameraCoords: @ 8059820
	ldr r2, _0805982C @ =gSaveBlock1Ptr
	ldr r2, [r2]
	strh r0, [r2]
	strh r1, [r2, 0x2]
	bx lr
	.align 2, 0
_0805982C: .4byte gSaveBlock1Ptr
	thumb_func_end SetCameraCoords

	thumb_func_start GetCameraCoords
GetCameraCoords: @ 8059830
	ldr r2, _08059840 @ =gSaveBlock1Ptr
	ldr r3, [r2]
	ldrh r2, [r3]
	strh r2, [r0]
	ldrh r0, [r3, 0x2]
	strh r0, [r1]
	bx lr
	.align 2, 0
_08059840: .4byte gSaveBlock1Ptr
	thumb_func_end GetCameraCoords

	thumb_func_start copy_tileset_patterns_to_vram
copy_tileset_patterns_to_vram: @ 8059844
	push {r4-r7,lr}
	sub sp, 0x4
	adds r3, r0, 0
	lsls r1, 16
	lsrs r4, r1, 16
	adds r6, r4, 0
	lsls r2, 16
	lsrs r5, r2, 16
	adds r7, r5, 0
	cmp r3, 0
	beq _08059880
	ldrb r0, [r3]
	cmp r0, 0
	bne _08059870
	ldr r1, [r3, 0x4]
	lsls r2, r4, 21
	lsrs r2, 16
	movs r0, 0x2
	adds r3, r5, 0
	bl LoadBgTiles
	b _08059880
_08059870:
	ldr r1, [r3, 0x4]
	lsls r2, r6, 5
	movs r0, 0
	str r0, [sp]
	movs r0, 0x2
	adds r3, r7, 0
	bl sub_80F68F0
_08059880:
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end copy_tileset_patterns_to_vram

	thumb_func_start copy_tileset_patterns_to_vram2
copy_tileset_patterns_to_vram2: @ 8059888
	push {r4-r7,lr}
	sub sp, 0x4
	adds r3, r0, 0
	lsls r1, 16
	lsrs r4, r1, 16
	adds r6, r4, 0
	lsls r2, 16
	lsrs r5, r2, 16
	adds r7, r5, 0
	cmp r3, 0
	beq _080598C4
	ldrb r0, [r3]
	cmp r0, 0
	bne _080598B4
	ldr r1, [r3, 0x4]
	lsls r2, r4, 21
	lsrs r2, 16
	movs r0, 0x2
	adds r3, r5, 0
	bl LoadBgTiles
	b _080598C4
_080598B4:
	ldr r1, [r3, 0x4]
	lsls r2, r6, 5
	movs r0, 0
	str r0, [sp]
	movs r0, 0x2
	adds r3, r7, 0
	bl sub_80F69E8
_080598C4:
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end copy_tileset_patterns_to_vram2

	thumb_func_start sub_80598CC
sub_80598CC: @ 80598CC
	push {r4,r5,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	lsls r1, 16
	lsrs r5, r1, 16
	ldr r0, _080598EC @ =gUnknown_2036E28
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _080598F0
	cmp r0, 0x1
	ble _0805993A
	cmp r0, 0x2
	beq _08059904
	cmp r0, 0x3
	beq _08059918
	b _0805993A
	.align 2, 0
_080598EC: .4byte gUnknown_2036E28
_080598F0:
	lsls r4, 1
	ldr r0, _08059900 @ =gPlttBufferUnfaded
	adds r0, r4, r0
	adds r1, r5, 0
	bl TintPalette_GrayScale
	b _0805992C
	.align 2, 0
_08059900: .4byte gPlttBufferUnfaded
_08059904:
	lsls r4, 1
	ldr r0, _08059914 @ =gPlttBufferUnfaded
	adds r0, r4, r0
	adds r1, r5, 0
	bl TintPalette_SepiaTone
	b _0805992C
	.align 2, 0
_08059914: .4byte gPlttBufferUnfaded
_08059918:
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8111F38
	lsls r4, 1
	ldr r0, _08059940 @ =gPlttBufferUnfaded
	adds r0, r4, r0
	adds r1, r5, 0
	bl TintPalette_GrayScale
_0805992C:
	ldr r0, _08059940 @ =gPlttBufferUnfaded
	adds r0, r4, r0
	ldr r1, _08059944 @ =gPlttBufferFaded
	adds r1, r4, r1
	adds r2, r5, 0
	bl CpuSet
_0805993A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08059940: .4byte gPlttBufferUnfaded
_08059944: .4byte gPlttBufferFaded
	thumb_func_end sub_80598CC

	thumb_func_start sub_8059948
sub_8059948: @ 8059948
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 24
	lsrs r6, r1, 24
	ldr r0, _08059968 @ =gUnknown_2036E28
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _0805996C
	cmp r0, 0x1
	ble _080599B8
	cmp r0, 0x2
	beq _08059980
	cmp r0, 0x3
	beq _08059994
	b _080599B8
	.align 2, 0
_08059968: .4byte gUnknown_2036E28
_0805996C:
	lsls r4, 5
	ldr r0, _0805997C @ =gPlttBufferUnfaded
	adds r0, r4, r0
	lsls r1, r6, 4
	bl TintPalette_GrayScale
	b _080599AA
	.align 2, 0
_0805997C: .4byte gPlttBufferUnfaded
_08059980:
	lsls r4, 5
	ldr r0, _08059990 @ =gPlttBufferUnfaded
	adds r0, r4, r0
	lsls r1, r6, 4
	bl TintPalette_SepiaTone
	b _080599AA
	.align 2, 0
_08059990: .4byte gPlttBufferUnfaded
_08059994:
	lsls r0, r4, 4
	lsls r5, r6, 4
	adds r1, r5, 0
	bl sub_8111F38
	lsls r4, 5
	ldr r0, _080599C0 @ =gPlttBufferUnfaded
	adds r0, r4, r0
	adds r1, r5, 0
	bl TintPalette_GrayScale
_080599AA:
	ldr r0, _080599C0 @ =gPlttBufferUnfaded
	adds r0, r4, r0
	ldr r1, _080599C4 @ =gPlttBufferFaded
	adds r1, r4, r1
	lsls r2, r6, 3
	bl CpuFastSet
_080599B8:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080599C0: .4byte gPlttBufferUnfaded
_080599C4: .4byte gPlttBufferFaded
	thumb_func_end sub_8059948

	thumb_func_start apply_map_tileset_palette
apply_map_tileset_palette: @ 80599C8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	adds r4, r0, 0
	lsls r1, 16
	lsrs r5, r1, 16
	mov r8, r5
	lsls r6, r2, 16
	lsrs r7, r6, 16
	adds r2, r7, 0
	movs r1, 0
	mov r0, sp
	strh r1, [r0]
	cmp r4, 0
	beq _08059A46
	ldrb r0, [r4, 0x1]
	cmp r0, 0
	bne _08059A1C
	mov r0, sp
	adds r1, r5, 0
	movs r2, 0x2
	bl LoadPalette
	ldr r0, [r4, 0x8]
	adds r0, 0x2
	adds r5, 0x1
	lsls r5, 16
	lsrs r5, 16
	subs r4, r7, 0x2
	lsls r2, r4, 16
	lsrs r2, 16
	adds r1, r5, 0
	bl LoadPalette
	lsls r4, 15
	lsrs r4, 16
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_80598CC
	b _08059A46
_08059A1C:
	cmp r0, 0x1
	bne _08059A36
	ldr r0, [r4, 0x8]
	adds r0, 0xE0
	adds r1, r5, 0
	adds r2, r7, 0
	bl LoadPalette
	lsrs r1, r6, 17
	adds r0, r5, 0
	bl sub_80598CC
	b _08059A46
_08059A36:
	ldr r0, [r4, 0x8]
	mov r1, r8
	bl LoadCompressedPalette
	lsrs r1, r6, 17
	mov r0, r8
	bl sub_80598CC
_08059A46:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end apply_map_tileset_palette

	thumb_func_start sub_8059A54
sub_8059A54: @ 8059A54
	push {lr}
	ldr r0, [r0, 0x10]
	movs r1, 0xA0
	lsls r1, 2
	movs r2, 0
	bl copy_tileset_patterns_to_vram
	pop {r0}
	bx r0
	thumb_func_end sub_8059A54

	thumb_func_start sub_8059A68
sub_8059A68: @ 8059A68
	push {lr}
	ldr r0, [r0, 0x14]
	movs r1, 0xC0
	lsls r1, 1
	movs r2, 0xA0
	lsls r2, 2
	bl copy_tileset_patterns_to_vram
	pop {r0}
	bx r0
	thumb_func_end sub_8059A68

	thumb_func_start copy_map_tileset2_to_vram_2
copy_map_tileset2_to_vram_2: @ 8059A7C
	push {lr}
	ldr r0, [r0, 0x14]
	movs r1, 0xC0
	lsls r1, 1
	movs r2, 0xA0
	lsls r2, 2
	bl copy_tileset_patterns_to_vram2
	pop {r0}
	bx r0
	thumb_func_end copy_map_tileset2_to_vram_2

	thumb_func_start sub_8059A90
sub_8059A90: @ 8059A90
	push {lr}
	ldr r0, [r0, 0x10]
	movs r1, 0
	movs r2, 0xE0
	bl apply_map_tileset_palette
	pop {r0}
	bx r0
	thumb_func_end sub_8059A90

	thumb_func_start sub_8059AA0
sub_8059AA0: @ 8059AA0
	push {lr}
	ldr r0, [r0, 0x14]
	movs r1, 0x70
	movs r2, 0xC0
	bl apply_map_tileset_palette
	pop {r0}
	bx r0
	thumb_func_end sub_8059AA0

	thumb_func_start copy_map_tileset1_tileset2_to_vram
copy_map_tileset1_tileset2_to_vram: @ 8059AB0
	push {r4,r5,lr}
	adds r5, r0, 0
	cmp r5, 0
	beq _08059AD2
	ldr r0, [r5, 0x10]
	movs r4, 0xA0
	lsls r4, 2
	adds r1, r4, 0
	movs r2, 0
	bl copy_tileset_patterns_to_vram2
	ldr r0, [r5, 0x14]
	movs r1, 0xC0
	lsls r1, 1
	adds r2, r4, 0
	bl copy_tileset_patterns_to_vram2
_08059AD2:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end copy_map_tileset1_tileset2_to_vram

	thumb_func_start apply_map_tileset1_tileset2_palette
apply_map_tileset1_tileset2_palette: @ 8059AD8
	push {r4,lr}
	adds r4, r0, 0
	cmp r4, 0
	beq _08059AEA
	bl sub_8059A90
	adds r0, r4, 0
	bl sub_8059AA0
_08059AEA:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end apply_map_tileset1_tileset2_palette

	.align 2, 0 @ Don't pad with nop.
