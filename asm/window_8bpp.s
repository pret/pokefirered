	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start nullsub_7
nullsub_7: @ 8005034
	bx lr
	thumb_func_end nullsub_7

	thumb_func_start AddWindow8Bit
AddWindow8Bit: @ 8005038
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	mov r9, r0
	movs r6, 0
	ldr r1, _08005100 @ =gWindows
	ldrb r0, [r1]
	cmp r0, 0xFF
	beq _08005066
_0800504E:
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r6, 0x1F
	bhi _08005066
	lsls r0, r6, 1
	adds r0, r6
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0xFF
	bne _0800504E
_08005066:
	cmp r6, 0x20
	beq _080050FA
	mov r0, r9
	ldrb r7, [r0]
	ldr r1, _08005104 @ =gUnknown_3003E40
	mov r10, r1
	lsls r2, r7, 2
	mov r8, r2
	mov r0, r8
	add r0, r10
	ldr r0, [r0]
	cmp r0, 0
	bne _080050C2
	adds r0, r7, 0
	movs r1, 0x8
	bl GetBgAttribute
	lsls r0, 16
	lsrs r5, r0, 16
	ldr r0, _08005108 @ =0x0000ffff
	cmp r5, r0
	beq _080050C2
	adds r0, r5, 0
	bl Alloc
	adds r4, r0, 0
	cmp r4, 0
	beq _080050FA
	movs r1, 0
	mov r12, r10
	mov r3, r8
	cmp r1, r5
	bge _080050B4
	movs r2, 0
_080050AA:
	adds r0, r4, r1
	strb r2, [r0]
	adds r1, 0x1
	cmp r1, r5
	blt _080050AA
_080050B4:
	mov r1, r12
	adds r0, r3, r1
	str r4, [r0]
	adds r0, r7, 0
	adds r1, r4, 0
	bl SetBgTilemapBuffer
_080050C2:
	mov r2, r9
	ldrb r1, [r2, 0x3]
	ldrb r0, [r2, 0x4]
	muls r0, r1
	lsls r0, 22
	lsrs r0, 16
	bl Alloc
	adds r4, r0, 0
	cmp r4, 0
	bne _08005110
	adds r0, r7, 0
	bl GetNumActiveWindowsOnBg8Bit
	lsls r0, 24
	cmp r0, 0
	bne _080050FA
	ldr r0, _08005104 @ =gUnknown_3003E40
	lsls r1, r7, 2
	adds r5, r1, r0
	ldr r1, [r5]
	ldr r0, _0800510C @ =nullsub_7
	cmp r1, r0
	beq _080050FA
	adds r0, r1, 0
	bl Free
	str r4, [r5]
_080050FA:
	movs r0, 0xFF
	b _0800512E
	.align 2, 0
_08005100: .4byte gWindows
_08005104: .4byte gUnknown_3003E40
_08005108: .4byte 0x0000ffff
_0800510C: .4byte nullsub_7
_08005110:
	ldr r1, _0800513C @ =gWindows
	lsls r2, r6, 1
	adds r2, r6
	lsls r2, 2
	adds r0, r1, 0
	adds r0, 0x8
	adds r0, r2, r0
	str r4, [r0]
	adds r2, r1
	mov r3, r9
	ldr r0, [r3]
	ldr r1, [r3, 0x4]
	str r0, [r2]
	str r1, [r2, 0x4]
	adds r0, r6, 0
_0800512E:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0800513C: .4byte gWindows
	thumb_func_end AddWindow8Bit

	thumb_func_start FillWindowPixelBuffer8Bit
FillWindowPixelBuffer8Bit: @ 8005140
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r5, r1, 24
	ldr r6, _0800517C @ =gWindows
	lsls r1, r0, 1
	adds r1, r0
	lsls r4, r1, 2
	adds r0, r4, r6
	ldrb r1, [r0, 0x3]
	ldrb r0, [r0, 0x4]
	muls r0, r1
	lsls r0, 22
	lsrs r3, r0, 16
	movs r2, 0
	cmp r2, r3
	bge _08005176
	adds r0, r6, 0
	adds r0, 0x8
	adds r1, r4, r0
_0800516A:
	ldr r0, [r1]
	adds r0, r2
	strb r5, [r0]
	adds r2, 0x1
	cmp r2, r3
	blt _0800516A
_08005176:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800517C: .4byte gWindows
	thumb_func_end FillWindowPixelBuffer8Bit

	thumb_func_start FillWindowPixelRect8Bit
FillWindowPixelRect8Bit: @ 8005180
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	sub sp, 0x10
	mov r9, r3
	ldr r3, [sp, 0x28]
	ldr r4, [sp, 0x2C]
	mov r8, r4
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 16
	lsrs r2, 16
	mov r4, r9
	lsls r4, 16
	lsrs r4, 16
	mov r9, r4
	lsls r3, 16
	lsrs r3, 16
	mov r4, r8
	lsls r4, 16
	lsrs r4, 16
	mov r8, r4
	ldr r5, _08005200 @ =gWindows
	lsls r4, r0, 1
	adds r4, r0
	lsls r4, 2
	adds r0, r5, 0
	adds r0, 0x8
	adds r0, r4, r0
	ldr r0, [r0]
	str r0, [sp, 0x8]
	adds r4, r5
	ldrb r0, [r4, 0x3]
	lsls r0, 3
	ldr r6, _08005204 @ =0xffff0000
	ldr r5, [sp, 0xC]
	ands r5, r6
	orrs r5, r0
	str r5, [sp, 0xC]
	ldrb r4, [r4, 0x4]
	lsls r4, 19
	ldr r0, _08005208 @ =0x0000ffff
	ands r0, r5
	orrs r0, r4
	str r0, [sp, 0xC]
	mov r0, r8
	str r0, [sp]
	str r1, [sp, 0x4]
	add r0, sp, 0x8
	adds r1, r2, 0
	mov r2, r9
	bl FillBitmapRect8Bit
	add sp, 0x10
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08005200: .4byte gWindows
_08005204: .4byte 0xffff0000
_08005208: .4byte 0x0000ffff
	thumb_func_end FillWindowPixelRect8Bit

	thumb_func_start BlitBitmapRectToWindow4BitTo8Bit
BlitBitmapRectToWindow4BitTo8Bit: @ 800520C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x2C
	ldr r4, [sp, 0x4C]
	ldr r5, [sp, 0x50]
	ldr r6, [sp, 0x54]
	mov r8, r6
	ldr r7, [sp, 0x58]
	mov r9, r7
	ldr r6, [sp, 0x5C]
	mov r10, r6
	ldr r7, [sp, 0x60]
	mov r12, r7
	ldr r6, [sp, 0x64]
	lsls r0, 24
	lsrs r0, 24
	lsls r2, 16
	lsrs r2, 16
	lsls r3, 16
	lsrs r3, 16
	lsls r4, 16
	mov r7, r8
	lsls r7, 16
	lsrs r7, 16
	mov r8, r7
	mov r7, r9
	lsls r7, 16
	lsrs r7, 16
	mov r9, r7
	mov r7, r10
	lsls r7, 16
	lsrs r7, 16
	mov r10, r7
	mov r7, r12
	lsls r7, 16
	lsrs r7, 16
	mov r12, r7
	lsls r6, 24
	lsrs r6, 24
	str r6, [sp, 0x28]
	str r1, [sp, 0x18]
	lsls r5, 16
	ldr r6, _080052CC @ =0x0000ffff
	lsrs r4, 16
	orrs r4, r5
	str r4, [sp, 0x1C]
	ldr r1, _080052D0 @ =gWindows
	lsls r5, r0, 1
	adds r5, r0
	lsls r5, 2
	adds r0, r1, 0
	adds r0, 0x8
	adds r0, r5, r0
	ldr r0, [r0]
	str r0, [sp, 0x20]
	adds r5, r1
	ldrb r0, [r5, 0x3]
	lsls r0, 3
	add r1, sp, 0x20
	ldr r4, [r1, 0x4]
	ldr r7, _080052D4 @ =0xffff0000
	ands r4, r7
	orrs r4, r0
	str r4, [r1, 0x4]
	ldrb r0, [r5, 0x4]
	lsls r0, 19
	ands r6, r4
	orrs r6, r0
	str r6, [r1, 0x4]
	mov r0, r8
	str r0, [sp]
	mov r6, r9
	str r6, [sp, 0x4]
	mov r7, r10
	str r7, [sp, 0x8]
	mov r0, r12
	str r0, [sp, 0xC]
	movs r0, 0
	str r0, [sp, 0x10]
	ldr r6, [sp, 0x28]
	str r6, [sp, 0x14]
	add r0, sp, 0x18
	bl BlitBitmapRect4BitTo8Bit
	add sp, 0x2C
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080052CC: .4byte 0x0000ffff
_080052D0: .4byte gWindows
_080052D4: .4byte 0xffff0000
	thumb_func_end BlitBitmapRectToWindow4BitTo8Bit

	thumb_func_start CopyWindowToVram8Bit
CopyWindowToVram8Bit: @ 80052D8
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r2, r1, 24
	adds r5, r2, 0
	ldr r6, _0800530C @ =gUnknown_2020634
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	ldr r0, _08005310 @ =gWindows
	adds r3, r1, r0
	str r3, [r6]
	ldr r4, _08005314 @ =gUnknown_2020638
	ldrb r1, [r3, 0x3]
	ldrb r0, [r3, 0x4]
	muls r0, r1
	lsls r0, 6
	strh r0, [r4]
	cmp r2, 0x2
	beq _08005326
	cmp r2, 0x2
	bgt _08005318
	cmp r2, 0x1
	beq _0800531E
	b _08005348
	.align 2, 0
_0800530C: .4byte gUnknown_2020634
_08005310: .4byte gWindows
_08005314: .4byte gUnknown_2020638
_08005318:
	cmp r5, 0x3
	beq _08005334
	b _08005348
_0800531E:
	ldrb r0, [r3]
	bl CopyBgTilemapBufferToVram
	b _08005348
_08005326:
	ldrb r0, [r3]
	ldr r1, [r3, 0x8]
	ldrh r2, [r4]
	ldrh r3, [r3, 0x6]
	bl LoadBgTiles
	b _08005348
_08005334:
	ldrb r0, [r3]
	ldr r1, [r3, 0x8]
	ldrh r2, [r4]
	ldrh r3, [r3, 0x6]
	bl LoadBgTiles
	ldr r0, [r6]
	ldrb r0, [r0]
	bl CopyBgTilemapBufferToVram
_08005348:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end CopyWindowToVram8Bit

	thumb_func_start GetNumActiveWindowsOnBg8Bit
GetNumActiveWindowsOnBg8Bit: @ 8005350
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	movs r3, 0
	ldr r2, _08005378 @ =gWindows
	movs r1, 0x1F
_0800535C:
	ldrb r0, [r2]
	cmp r0, r4
	bne _08005368
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
_08005368:
	adds r2, 0xC
	subs r1, 0x1
	cmp r1, 0
	bge _0800535C
	adds r0, r3, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08005378: .4byte gWindows
	thumb_func_end GetNumActiveWindowsOnBg8Bit

	.align 2, 0 @ Don't pad with nop.
