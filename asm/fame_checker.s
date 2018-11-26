	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_812E094
sub_812E094: @ 812E094
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r4, r0, 0
	ldr r6, _0812E0EC @ =gUnknown_203B0FC
	ldr r0, [r6]
	adds r0, 0x23
	ldrb r0, [r0]
	lsls r0, 31
	lsrs r0, 31
	cmp r0, r4
	beq _0812E108
	ldr r5, _0812E0F0 @ =sub_812E110
	adds r0, r5, 0
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0xFF
	bne _0812E0C8
	adds r0, r5, 0
	movs r1, 0x8
	bl CreateTask
	lsls r0, 24
	lsrs r2, r0, 24
_0812E0C8:
	ldr r0, _0812E0F4 @ =gTasks
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 3
	adds r1, r0
	movs r0, 0
	strh r0, [r1, 0x8]
	movs r0, 0x4
	strh r0, [r1, 0xA]
	cmp r4, 0x1
	bne _0812E0F8
	strh r4, [r1, 0xC]
	ldr r0, [r6]
	adds r0, 0x23
	ldrb r1, [r0]
	movs r2, 0x1
	orrs r1, r2
	b _0812E106
	.align 2, 0
_0812E0EC: .4byte gUnknown_203B0FC
_0812E0F0: .4byte sub_812E110
_0812E0F4: .4byte gTasks
_0812E0F8:
	strh r0, [r1, 0xC]
	ldr r0, [r6]
	adds r0, 0x23
	ldrb r2, [r0]
	movs r1, 0x2
	negs r1, r1
	ands r1, r2
_0812E106:
	strb r1, [r0]
_0812E108:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_812E094

	thumb_func_start sub_812E110
sub_812E110: @ 812E110
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _0812E130 @ =gTasks
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _0812E134
	cmp r0, 0x1
	beq _0812E154
	b _0812E170
	.align 2, 0
_0812E130: .4byte gTasks
_0812E134:
	ldrh r0, [r4, 0xA]
	subs r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	cmp r0, 0
	bne _0812E170
	movs r0, 0x1
	movs r1, 0
	bl sub_812E178
	movs r0, 0x4
	strh r0, [r4, 0xA]
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _0812E170
_0812E154:
	ldrh r0, [r4, 0xA]
	subs r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	cmp r0, 0
	bne _0812E170
	movs r0, 0xC
	ldrsh r1, [r4, r0]
	movs r0, 0x1
	bl sub_812E178
	adds r0, r5, 0
	bl DestroyTask
_0812E170:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_812E110

	thumb_func_start sub_812E178
sub_812E178: @ 812E178
	push {r4-r6,lr}
	sub sp, 0xC
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 16
	asrs r5, r1, 16
	cmp r5, 0
	beq _0812E18C
	cmp r5, 0x3
	bne _0812E252
_0812E18C:
	movs r4, 0x1
	str r4, [sp]
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	adds r0, r6, 0
	movs r1, 0x8C
	movs r2, 0xE
	movs r3, 0xA
	bl FillBgTilemapBufferRect
	movs r5, 0xA
	str r5, [sp]
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	adds r0, r6, 0
	movs r1, 0xA1
	movs r2, 0xF
	movs r3, 0xA
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	adds r0, r6, 0
	movs r1, 0x8D
	movs r2, 0x19
	movs r3, 0xA
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	adds r0, r6, 0
	movs r1, 0x8E
	movs r2, 0x1A
	movs r3, 0xA
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	adds r0, r6, 0
	movs r1, 0x8F
	movs r2, 0xE
	movs r3, 0xB
	bl FillBgTilemapBufferRect
	movs r0, 0xB
	str r0, [sp]
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	adds r0, r6, 0
	movs r1, 0
	movs r2, 0xF
	movs r3, 0xB
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	adds r0, r6, 0
	movs r1, 0x90
	movs r2, 0x1A
	movs r3, 0xB
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	adds r0, r6, 0
	movs r1, 0x91
	movs r2, 0xE
	movs r3, 0xC
	bl FillBgTilemapBufferRect
	str r5, [sp]
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	adds r0, r6, 0
	movs r1, 0xA3
	movs r2, 0xF
	movs r3, 0xC
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	adds r0, r6, 0
	movs r1, 0x92
	movs r2, 0x19
	movs r3, 0xC
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	adds r0, r6, 0
	movs r1, 0x93
	b _0812E470
_0812E252:
	cmp r5, 0x1
	bne _0812E2F4
	str r5, [sp]
	str r5, [sp, 0x4]
	str r5, [sp, 0x8]
	adds r0, r6, 0
	movs r1, 0x9B
	movs r2, 0xE
	movs r3, 0xA
	bl FillBgTilemapBufferRect
	movs r4, 0xB
	str r4, [sp]
	str r5, [sp, 0x4]
	str r5, [sp, 0x8]
	adds r0, r6, 0
	movs r1, 0x9C
	movs r2, 0xF
	movs r3, 0xA
	bl FillBgTilemapBufferRect
	str r5, [sp]
	str r5, [sp, 0x4]
	str r5, [sp, 0x8]
	adds r0, r6, 0
	movs r1, 0x96
	movs r2, 0x1A
	movs r3, 0xA
	bl FillBgTilemapBufferRect
	str r5, [sp]
	str r5, [sp, 0x4]
	str r5, [sp, 0x8]
	adds r0, r6, 0
	movs r1, 0x9D
	movs r2, 0xE
	movs r3, 0xB
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r5, [sp, 0x4]
	str r5, [sp, 0x8]
	adds r0, r6, 0
	movs r1, 0
	movs r2, 0xF
	movs r3, 0xB
	bl FillBgTilemapBufferRect
	str r5, [sp]
	str r5, [sp, 0x4]
	str r5, [sp, 0x8]
	adds r0, r6, 0
	movs r1, 0x90
	movs r2, 0x1A
	movs r3, 0xB
	bl FillBgTilemapBufferRect
	str r5, [sp]
	str r5, [sp, 0x4]
	str r5, [sp, 0x8]
	adds r0, r6, 0
	movs r1, 0x9E
	movs r2, 0xE
	movs r3, 0xC
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r5, [sp, 0x4]
	str r5, [sp, 0x8]
	adds r0, r6, 0
	movs r1, 0x9F
	movs r2, 0xF
	movs r3, 0xC
	bl FillBgTilemapBufferRect
	str r5, [sp]
	str r5, [sp, 0x4]
	str r5, [sp, 0x8]
	adds r0, r6, 0
	movs r1, 0x99
	b _0812E470
_0812E2F4:
	cmp r5, 0x2
	bne _0812E398
	movs r4, 0x1
	str r4, [sp]
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	adds r0, r6, 0
	movs r1, 0x94
	movs r2, 0xE
	movs r3, 0xA
	bl FillBgTilemapBufferRect
	movs r5, 0xB
	str r5, [sp]
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	adds r0, r6, 0
	movs r1, 0x95
	movs r2, 0xF
	movs r3, 0xA
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	adds r0, r6, 0
	movs r1, 0x96
	movs r2, 0x1A
	movs r3, 0xA
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	adds r0, r6, 0
	movs r1, 0x8F
	movs r2, 0xE
	movs r3, 0xB
	bl FillBgTilemapBufferRect
	str r5, [sp]
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	adds r0, r6, 0
	movs r1, 0x9A
	movs r2, 0xF
	movs r3, 0xB
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	adds r0, r6, 0
	movs r1, 0x90
	movs r2, 0x1A
	movs r3, 0xB
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	adds r0, r6, 0
	movs r1, 0x97
	movs r2, 0xE
	movs r3, 0xC
	bl FillBgTilemapBufferRect
	str r5, [sp]
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	adds r0, r6, 0
	movs r1, 0x98
	movs r2, 0xF
	movs r3, 0xC
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	adds r0, r6, 0
	movs r1, 0x99
	b _0812E470
_0812E398:
	cmp r5, 0x4
	bne _0812E47A
	movs r4, 0x1
	str r4, [sp]
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	adds r0, r6, 0
	movs r1, 0x83
	movs r2, 0xE
	movs r3, 0xA
	bl FillBgTilemapBufferRect
	movs r5, 0xA
	str r5, [sp]
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	adds r0, r6, 0
	movs r1, 0xA0
	movs r2, 0xF
	movs r3, 0xA
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	adds r0, r6, 0
	movs r1, 0x84
	movs r2, 0x19
	movs r3, 0xA
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	adds r0, r6, 0
	movs r1, 0x85
	movs r2, 0x1A
	movs r3, 0xA
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	adds r0, r6, 0
	movs r1, 0x86
	movs r2, 0xE
	movs r3, 0xB
	bl FillBgTilemapBufferRect
	str r5, [sp]
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	adds r0, r6, 0
	movs r1, 0xA2
	movs r2, 0xF
	movs r3, 0xB
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	adds r0, r6, 0
	movs r1, 0x87
	movs r2, 0x19
	movs r3, 0xB
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	adds r0, r6, 0
	movs r1, 0x88
	movs r2, 0x1A
	movs r3, 0xB
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	adds r0, r6, 0
	movs r1, 0x83
	movs r2, 0xE
	movs r3, 0xC
	bl FillBgTilemapBufferRect
	str r5, [sp]
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	adds r0, r6, 0
	movs r1, 0xA0
	movs r2, 0xF
	movs r3, 0xC
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	adds r0, r6, 0
	movs r1, 0x84
	movs r2, 0x19
	movs r3, 0xC
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	adds r0, r6, 0
	movs r1, 0x85
_0812E470:
	movs r2, 0x1A
	movs r3, 0xC
	bl FillBgTilemapBufferRect
	b _0812E496
_0812E47A:
	cmp r5, 0x5
	bne _0812E496
	movs r0, 0xD
	str r0, [sp]
	movs r0, 0x3
	str r0, [sp, 0x4]
	movs r0, 0x1
	str r0, [sp, 0x8]
	adds r0, r6, 0
	movs r1, 0
	movs r2, 0xE
	movs r3, 0xA
	bl FillBgTilemapBufferRect
_0812E496:
	adds r0, r6, 0
	bl CopyBgTilemapBufferToVram
	add sp, 0xC
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_812E178

	thumb_func_start sub_812E4A4
sub_812E4A4: @ 812E4A4
	push {r4,lr}
	sub sp, 0x14
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _0812E4E0 @ =gUnknown_203B0FC
	ldr r0, [r0]
	ldrb r0, [r0, 0x8]
	bl ListMenuGetYCoordForPrintingArrowCursor
	lsls r0, 16
	lsrs r0, 16
	cmp r4, 0x1
	bne _0812E4EC
	lsls r3, r0, 24
	lsrs r3, 24
	movs r1, 0
	str r1, [sp]
	str r1, [sp, 0x4]
	ldr r0, _0812E4E4 @ =gUnknown_845F5E3
	str r0, [sp, 0x8]
	str r1, [sp, 0xC]
	ldr r0, _0812E4E8 @ =gUnknown_841623B
	str r0, [sp, 0x10]
	movs r0, 0
	movs r1, 0x2
	movs r2, 0
	bl AddTextPrinterParametrized2
	b _0812E50A
	.align 2, 0
_0812E4E0: .4byte gUnknown_203B0FC
_0812E4E4: .4byte gUnknown_845F5E3
_0812E4E8: .4byte gUnknown_841623B
_0812E4EC:
	lsls r3, r0, 24
	lsrs r3, 24
	movs r1, 0
	str r1, [sp]
	str r1, [sp, 0x4]
	ldr r0, _0812E514 @ =gUnknown_845F5E0
	str r0, [sp, 0x8]
	str r1, [sp, 0xC]
	ldr r0, _0812E518 @ =gUnknown_841623B
	str r0, [sp, 0x10]
	movs r0, 0
	movs r1, 0x2
	movs r2, 0
	bl AddTextPrinterParametrized2
_0812E50A:
	add sp, 0x14
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812E514: .4byte gUnknown_845F5E0
_0812E518: .4byte gUnknown_841623B
	thumb_func_end sub_812E4A4

	.align 2, 0 @ Don't pad with nop.
