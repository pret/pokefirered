	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start CopyGlyphToWindow
CopyGlyphToWindow: @ 8003014
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x6C
	adds r6, r0, 0
	ldr r0, _08003084 @ =gWindows
	mov r9, r0
	ldrb r1, [r6, 0x4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	mov r1, r9
	adds r2, r0, r1
	ldrb r0, [r2, 0x3]
	lsls r0, 3
	ldrb r1, [r6, 0x8]
	subs r1, r0, r1
	ldr r3, _08003088 @ =gGlyphBuffer1
	mov r8, r3
	mov r0, r8
	adds r0, 0x80
	ldrb r7, [r0]
	cmp r1, r7
	bge _0800304A
	adds r7, r1, 0
_0800304A:
	ldrb r0, [r2, 0x4]
	lsls r0, 3
	ldrb r4, [r6, 0x9]
	subs r0, r4
	adds r1, r3, 0
	adds r1, 0x81
	ldrb r1, [r1]
	mov r10, r1
	adds r5, r4, 0
	cmp r0, r10
	bge _08003062
	mov r10, r0
_08003062:
	movs r1, 0
	cmp r7, 0x8
	ble _0800306A
	movs r1, 0x1
_0800306A:
	mov r0, r10
	cmp r0, 0x8
	ble _08003074
	movs r0, 0x2
	orrs r1, r0
_08003074:
	cmp r1, 0x1
	beq _08003134
	cmp r1, 0x1
	bgt _0800308C
	cmp r1, 0
	beq _0800309A
	b _080035FC
	.align 2, 0
_08003084: .4byte gWindows
_08003088: .4byte gGlyphBuffer1
_0800308C:
	cmp r1, 0x2
	bne _08003092
	b _08003268
_08003092:
	cmp r1, 0x3
	bne _08003098
	b _080033A0
_08003098:
	b _080035FC
_0800309A:
	adds r2, r3, 0
	movs r1, 0
	adds r0, r5, 0
	cmp r1, r10
	blt _080030A6
	b _080035FC
_080030A6:
	ldm r2!, {r3}
	str r3, [sp]
	movs r5, 0
	ldrb r4, [r6, 0x8]
	str r2, [sp, 0x28]
	adds r1, 0x1
	str r1, [sp, 0x20]
	adds r1, r0, 0x1
	str r1, [sp, 0x24]
	cmp r5, r7
	bge _08003124
	ldr r2, _08003130 @ =gWindows
	mov r12, r2
	asrs r3, r0, 3
	mov r9, r3
	lsls r0, 29
	lsrs r0, 27
	mov r8, r0
_080030CA:
	ldrb r0, [r6, 0x4]
	lsls r3, r0, 1
	adds r3, r0
	lsls r3, 2
	mov r1, r12
	adds r1, 0x8
	adds r1, r3, r1
	asrs r2, r4, 1
	movs r0, 0x3
	ands r2, r0
	ldr r1, [r1]
	adds r1, r2
	asrs r0, r4, 3
	lsls r0, 5
	adds r1, r0
	add r3, r12
	ldrb r0, [r3, 0x3]
	mov r2, r9
	muls r2, r0
	adds r0, r2, 0
	lsls r0, 5
	adds r1, r0
	mov r0, r8
	adds r3, r1, r0
	lsls r0, r5, 2
	ldr r2, [sp]
	lsrs r2, r0
	movs r0, 0xF
	ands r2, r0
	cmp r2, 0
	beq _0800311C
	movs r0, 0x1
	ands r0, r4
	lsls r0, 2
	lsls r2, r0
	movs r1, 0xF0
	asrs r1, r0
	ldrb r0, [r3]
	ands r1, r0
	orrs r2, r1
	strb r2, [r3]
_0800311C:
	adds r5, 0x1
	adds r4, 0x1
	cmp r5, r7
	blt _080030CA
_08003124:
	ldr r2, [sp, 0x28]
	ldr r1, [sp, 0x20]
	ldr r0, [sp, 0x24]
	cmp r1, r10
	blt _080030A6
	b _080035FC
	.align 2, 0
_08003130: .4byte gWindows
_08003134:
	movs r2, 0
	adds r1, r5, 0
	cmp r2, r10
	bge _080031BE
_0800313C:
	ldm r3!, {r0}
	mov r9, r0
	movs r5, 0
	ldrb r4, [r6, 0x8]
	lsls r0, r1, 29
	str r3, [sp, 0x38]
	adds r2, 0x1
	str r2, [sp, 0x30]
	adds r2, r1, 0x1
	str r2, [sp, 0x34]
	asrs r1, 3
	mov r12, r1
	lsrs r0, 27
	mov r8, r0
_08003158:
	ldrb r0, [r6, 0x4]
	lsls r3, r0, 1
	adds r3, r0
	lsls r3, 2
	ldr r1, _08003260 @ =gWindows
	adds r1, 0x8
	adds r1, r3, r1
	asrs r2, r4, 1
	movs r0, 0x3
	ands r2, r0
	ldr r1, [r1]
	adds r1, r2
	asrs r0, r4, 3
	lsls r0, 5
	adds r1, r0
	ldr r0, _08003260 @ =gWindows
	adds r3, r0
	ldrb r0, [r3, 0x3]
	mov r2, r12
	muls r2, r0
	adds r0, r2, 0
	lsls r0, 5
	adds r1, r0
	mov r0, r8
	adds r3, r1, r0
	lsls r0, r5, 2
	mov r2, r9
	lsrs r2, r0
	movs r0, 0xF
	ands r2, r0
	cmp r2, 0
	beq _080031AC
	movs r0, 0x1
	ands r0, r4
	lsls r0, 2
	lsls r2, r0
	movs r1, 0xF0
	asrs r1, r0
	ldrb r0, [r3]
	ands r1, r0
	orrs r2, r1
	strb r2, [r3]
_080031AC:
	adds r5, 0x1
	adds r4, 0x1
	cmp r5, 0x7
	ble _08003158
	ldr r3, [sp, 0x38]
	ldr r2, [sp, 0x30]
	ldr r1, [sp, 0x34]
	cmp r2, r10
	blt _0800313C
_080031BE:
	ldr r3, _08003264 @ =gGlyphBuffer2
	movs r2, 0
	ldrb r1, [r6, 0x9]
	cmp r2, r10
	blt _080031CA
	b _080035FC
_080031CA:
	subs r7, 0x8
	str r7, [sp, 0x64]
	str r7, [sp, 0x4]
_080031D0:
	ldm r3!, {r0}
	mov r12, r0
	movs r5, 0
	ldrb r0, [r6, 0x8]
	adds r4, r0, 0
	adds r4, 0x8
	str r3, [sp, 0x50]
	adds r2, 0x1
	str r2, [sp, 0x48]
	adds r2, r1, 0x1
	str r2, [sp, 0x4C]
	ldr r3, [sp, 0x4]
	cmp r5, r3
	bge _08003254
	ldr r7, _08003260 @ =gWindows
	asrs r0, r1, 3
	mov r9, r0
	lsls r0, r1, 29
	lsrs r0, 27
	mov r8, r0
_080031F8:
	ldrb r0, [r6, 0x4]
	lsls r3, r0, 1
	adds r3, r0
	lsls r3, 2
	adds r1, r7, 0
	adds r1, 0x8
	adds r1, r3, r1
	asrs r2, r4, 1
	movs r0, 0x3
	ands r2, r0
	ldr r1, [r1]
	adds r1, r2
	asrs r0, r4, 3
	lsls r0, 5
	adds r1, r0
	adds r3, r7
	ldrb r0, [r3, 0x3]
	mov r2, r9
	muls r2, r0
	adds r0, r2, 0
	lsls r0, 5
	adds r1, r0
	mov r0, r8
	adds r3, r1, r0
	lsls r0, r5, 2
	mov r2, r12
	lsrs r2, r0
	movs r0, 0xF
	ands r2, r0
	cmp r2, 0
	beq _0800324A
	movs r0, 0x1
	ands r0, r4
	lsls r0, 2
	lsls r2, r0
	movs r1, 0xF0
	asrs r1, r0
	ldrb r0, [r3]
	ands r1, r0
	orrs r2, r1
	strb r2, [r3]
_0800324A:
	adds r5, 0x1
	adds r4, 0x1
	ldr r1, [sp, 0x64]
	cmp r5, r1
	blt _080031F8
_08003254:
	ldr r3, [sp, 0x50]
	ldr r2, [sp, 0x48]
	ldr r1, [sp, 0x4C]
	cmp r2, r10
	blt _080031D0
	b _080035FC
	.align 2, 0
_08003260: .4byte gWindows
_08003264: .4byte gGlyphBuffer2
_08003268:
	adds r1, r3, 0
	movs r2, 0
	adds r0, r5, 0
	mov r3, r10
	subs r3, 0x8
	str r3, [sp, 0x68]
_08003274:
	ldm r1!, {r3}
	mov r10, r3
	movs r5, 0
	ldrb r4, [r6, 0x8]
	str r1, [sp, 0x60]
	adds r2, 0x1
	str r2, [sp, 0x58]
	adds r1, r0, 0x1
	str r1, [sp, 0x5C]
	cmp r5, r7
	bge _080032F2
	ldr r2, _08003398 @ =gWindows
	mov r12, r2
	asrs r3, r0, 3
	mov r9, r3
	lsls r0, 29
	lsrs r0, 27
	mov r8, r0
_08003298:
	ldrb r0, [r6, 0x4]
	lsls r3, r0, 1
	adds r3, r0
	lsls r3, 2
	mov r1, r12
	adds r1, 0x8
	adds r1, r3, r1
	asrs r2, r4, 1
	movs r0, 0x3
	ands r2, r0
	ldr r1, [r1]
	adds r1, r2
	asrs r0, r4, 3
	lsls r0, 5
	adds r1, r0
	add r3, r12
	ldrb r0, [r3, 0x3]
	mov r2, r9
	muls r2, r0
	adds r0, r2, 0
	lsls r0, 5
	adds r1, r0
	mov r0, r8
	adds r3, r1, r0
	lsls r0, r5, 2
	mov r2, r10
	lsrs r2, r0
	movs r0, 0xF
	ands r2, r0
	cmp r2, 0
	beq _080032EA
	movs r0, 0x1
	ands r0, r4
	lsls r0, 2
	lsls r2, r0
	movs r1, 0xF0
	asrs r1, r0
	ldrb r0, [r3]
	ands r1, r0
	orrs r2, r1
	strb r2, [r3]
_080032EA:
	adds r5, 0x1
	adds r4, 0x1
	cmp r5, r7
	blt _08003298
_080032F2:
	ldr r1, [sp, 0x60]
	ldr r2, [sp, 0x58]
	ldr r0, [sp, 0x5C]
	cmp r2, 0x7
	ble _08003274
	ldr r2, _0800339C @ =gGlyphBuffer3
	movs r1, 0
	ldrb r0, [r6, 0x9]
	adds r0, 0x8
	ldr r3, [sp, 0x68]
	cmp r1, r3
	blt _0800330C
	b _080035FC
_0800330C:
	ldm r2!, {r3}
	mov r10, r3
	movs r5, 0
	ldrb r4, [r6, 0x8]
	str r2, [sp, 0x1C]
	adds r1, 0x1
	str r1, [sp, 0x14]
	adds r1, r0, 0x1
	str r1, [sp, 0x18]
	cmp r5, r7
	bge _0800338A
	ldr r2, _08003398 @ =gWindows
	mov r12, r2
	asrs r3, r0, 3
	mov r9, r3
	lsls r0, 29
	lsrs r0, 27
	mov r8, r0
_08003330:
	ldrb r0, [r6, 0x4]
	lsls r3, r0, 1
	adds r3, r0
	lsls r3, 2
	mov r1, r12
	adds r1, 0x8
	adds r1, r3, r1
	asrs r2, r4, 1
	movs r0, 0x3
	ands r2, r0
	ldr r1, [r1]
	adds r1, r2
	asrs r0, r4, 3
	lsls r0, 5
	adds r1, r0
	add r3, r12
	ldrb r0, [r3, 0x3]
	mov r2, r9
	muls r2, r0
	adds r0, r2, 0
	lsls r0, 5
	adds r1, r0
	mov r0, r8
	adds r3, r1, r0
	lsls r0, r5, 2
	mov r2, r10
	lsrs r2, r0
	movs r0, 0xF
	ands r2, r0
	cmp r2, 0
	beq _08003382
	movs r0, 0x1
	ands r0, r4
	lsls r0, 2
	lsls r2, r0
	movs r1, 0xF0
	asrs r1, r0
	ldrb r0, [r3]
	ands r1, r0
	orrs r2, r1
	strb r2, [r3]
_08003382:
	adds r5, 0x1
	adds r4, 0x1
	cmp r5, r7
	blt _08003330
_0800338A:
	ldr r2, [sp, 0x1C]
	ldr r1, [sp, 0x14]
	ldr r0, [sp, 0x18]
	ldr r3, [sp, 0x68]
	cmp r1, r3
	blt _0800330C
	b _080035FC
	.align 2, 0
_08003398: .4byte gWindows
_0800339C: .4byte gGlyphBuffer3
_080033A0:
	mov r2, r8
	movs r3, 0
	adds r1, r4, 0
	subs r7, 0x8
	str r7, [sp, 0x64]
	mov r0, r10
	subs r0, 0x8
	str r0, [sp, 0x68]
_080033B0:
	ldm r2!, {r0}
	mov r9, r0
	movs r5, 0
	ldrb r4, [r6, 0x8]
	lsls r0, r1, 29
	str r2, [sp, 0x2C]
	adds r3, 0x1
	mov r10, r3
	adds r2, r1, 0x1
	mov r12, r2
	asrs r1, 3
	mov r8, r1
	lsrs r7, r0, 27
_080033CA:
	ldrb r0, [r6, 0x4]
	lsls r3, r0, 1
	adds r3, r0
	lsls r3, 2
	ldr r1, _080034D0 @ =gWindows
	adds r1, 0x8
	adds r1, r3, r1
	asrs r2, r4, 1
	movs r0, 0x3
	ands r2, r0
	ldr r1, [r1]
	adds r1, r2
	asrs r0, r4, 3
	lsls r0, 5
	adds r1, r0
	ldr r0, _080034D0 @ =gWindows
	adds r3, r0
	ldrb r0, [r3, 0x3]
	mov r2, r8
	muls r2, r0
	adds r0, r2, 0
	lsls r0, 5
	adds r1, r0
	adds r3, r1, r7
	lsls r0, r5, 2
	mov r2, r9
	lsrs r2, r0
	movs r0, 0xF
	ands r2, r0
	cmp r2, 0
	beq _0800341C
	movs r0, 0x1
	ands r0, r4
	lsls r0, 2
	lsls r2, r0
	movs r1, 0xF0
	asrs r1, r0
	ldrb r0, [r3]
	ands r1, r0
	orrs r2, r1
	strb r2, [r3]
_0800341C:
	adds r5, 0x1
	adds r4, 0x1
	cmp r5, 0x7
	ble _080033CA
	ldr r2, [sp, 0x2C]
	mov r3, r10
	mov r1, r12
	cmp r3, 0x7
	ble _080033B0
	ldr r3, _080034D4 @ =gGlyphBuffer2
	movs r2, 0
	ldrb r1, [r6, 0x9]
	ldr r0, [sp, 0x64]
	mov r12, r0
_08003438:
	ldm r3!, {r0}
	mov r10, r0
	movs r5, 0
	ldrb r0, [r6, 0x8]
	adds r4, r0, 0
	adds r4, 0x8
	str r3, [sp, 0x44]
	adds r2, 0x1
	str r2, [sp, 0x3C]
	adds r2, r1, 0x1
	str r2, [sp, 0x40]
	cmp r5, r12
	bge _080034B8
	ldr r7, _080034D0 @ =gWindows
	asrs r3, r1, 3
	mov r9, r3
	lsls r0, r1, 29
	lsrs r0, 27
	mov r8, r0
_0800345E:
	ldrb r0, [r6, 0x4]
	lsls r3, r0, 1
	adds r3, r0
	lsls r3, 2
	adds r1, r7, 0
	adds r1, 0x8
	adds r1, r3, r1
	asrs r2, r4, 1
	movs r0, 0x3
	ands r2, r0
	ldr r1, [r1]
	adds r1, r2
	asrs r0, r4, 3
	lsls r0, 5
	adds r1, r0
	adds r3, r7
	ldrb r0, [r3, 0x3]
	mov r2, r9
	muls r2, r0
	adds r0, r2, 0
	lsls r0, 5
	adds r1, r0
	mov r0, r8
	adds r3, r1, r0
	lsls r0, r5, 2
	mov r2, r10
	lsrs r2, r0
	movs r0, 0xF
	ands r2, r0
	cmp r2, 0
	beq _080034B0
	movs r0, 0x1
	ands r0, r4
	lsls r0, 2
	lsls r2, r0
	movs r1, 0xF0
	asrs r1, r0
	ldrb r0, [r3]
	ands r1, r0
	orrs r2, r1
	strb r2, [r3]
_080034B0:
	adds r5, 0x1
	adds r4, 0x1
	cmp r5, r12
	blt _0800345E
_080034B8:
	ldr r3, [sp, 0x44]
	ldr r2, [sp, 0x3C]
	ldr r1, [sp, 0x40]
	cmp r2, 0x7
	ble _08003438
	ldr r3, _080034D8 @ =gGlyphBuffer3
	movs r2, 0
	ldrb r0, [r6, 0x9]
	adds r1, r0, 0
	adds r1, 0x8
	b _08003556
	.align 2, 0
_080034D0: .4byte gWindows
_080034D4: .4byte gGlyphBuffer2
_080034D8: .4byte gGlyphBuffer3
_080034DC:
	ldm r3!, {r0}
	mov r9, r0
	movs r5, 0
	ldrb r4, [r6, 0x8]
	lsls r0, r1, 29
	str r3, [sp, 0x54]
	adds r2, 0x1
	mov r10, r2
	adds r2, r1, 0x1
	mov r12, r2
	asrs r1, 3
	mov r8, r1
	lsrs r7, r0, 27
_080034F6:
	ldrb r0, [r6, 0x4]
	lsls r3, r0, 1
	adds r3, r0
	lsls r3, 2
	ldr r1, _0800360C @ =gWindows
	adds r1, 0x8
	adds r1, r3, r1
	asrs r2, r4, 1
	movs r0, 0x3
	ands r2, r0
	ldr r1, [r1]
	adds r1, r2
	asrs r0, r4, 3
	lsls r0, 5
	adds r1, r0
	ldr r0, _0800360C @ =gWindows
	adds r3, r0
	ldrb r0, [r3, 0x3]
	mov r2, r8
	muls r2, r0
	adds r0, r2, 0
	lsls r0, 5
	adds r1, r0
	adds r3, r1, r7
	lsls r0, r5, 2
	mov r2, r9
	lsrs r2, r0
	movs r0, 0xF
	ands r2, r0
	cmp r2, 0
	beq _08003548
	movs r0, 0x1
	ands r0, r4
	lsls r0, 2
	lsls r2, r0
	movs r1, 0xF0
	asrs r1, r0
	ldrb r0, [r3]
	ands r1, r0
	orrs r2, r1
	strb r2, [r3]
_08003548:
	adds r5, 0x1
	adds r4, 0x1
	cmp r5, 0x7
	ble _080034F6
	ldr r3, [sp, 0x54]
	mov r2, r10
	mov r1, r12
_08003556:
	ldr r0, [sp, 0x68]
	cmp r2, r0
	blt _080034DC
	ldr r3, _08003610 @ =gGlyphBuffer4
	movs r2, 0
	ldrb r0, [r6, 0x9]
	adds r1, r0, 0
	adds r1, 0x8
	ldr r0, [sp, 0x68]
	cmp r2, r0
	bge _080035FC
	ldr r0, [sp, 0x64]
	mov r10, r0
_08003570:
	ldm r3!, {r0}
	mov r12, r0
	movs r5, 0
	ldrb r0, [r6, 0x8]
	adds r4, r0, 0
	adds r4, 0x8
	str r3, [sp, 0x10]
	adds r2, 0x1
	str r2, [sp, 0x8]
	adds r2, r1, 0x1
	str r2, [sp, 0xC]
	cmp r5, r10
	bge _080035F0
	ldr r7, _0800360C @ =gWindows
	asrs r3, r1, 3
	mov r9, r3
	lsls r0, r1, 29
	lsrs r0, 27
	mov r8, r0
_08003596:
	ldrb r0, [r6, 0x4]
	lsls r3, r0, 1
	adds r3, r0
	lsls r3, 2
	adds r1, r7, 0
	adds r1, 0x8
	adds r1, r3, r1
	asrs r2, r4, 1
	movs r0, 0x3
	ands r2, r0
	ldr r1, [r1]
	adds r1, r2
	asrs r0, r4, 3
	lsls r0, 5
	adds r1, r0
	adds r3, r7
	ldrb r0, [r3, 0x3]
	mov r2, r9
	muls r2, r0
	adds r0, r2, 0
	lsls r0, 5
	adds r1, r0
	mov r0, r8
	adds r3, r1, r0
	lsls r0, r5, 2
	mov r2, r12
	lsrs r2, r0
	movs r0, 0xF
	ands r2, r0
	cmp r2, 0
	beq _080035E8
	movs r0, 0x1
	ands r0, r4
	lsls r0, 2
	lsls r2, r0
	movs r1, 0xF0
	asrs r1, r0
	ldrb r0, [r3]
	ands r1, r0
	orrs r2, r1
	strb r2, [r3]
_080035E8:
	adds r5, 0x1
	adds r4, 0x1
	cmp r5, r10
	blt _08003596
_080035F0:
	ldr r3, [sp, 0x10]
	ldr r2, [sp, 0x8]
	ldr r1, [sp, 0xC]
	ldr r0, [sp, 0x68]
	cmp r2, r0
	blt _08003570
_080035FC:
	add sp, 0x6C
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800360C: .4byte gWindows
_08003610: .4byte gGlyphBuffer4
	thumb_func_end CopyGlyphToWindow

	thumb_func_start sub_8003614
sub_8003614: @ 8003614
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x40
	str r0, [sp]
	ldr r0, [sp, 0x60]
	lsls r1, 16
	lsrs r1, 16
	str r1, [sp, 0x4]
	lsls r2, 16
	lsrs r2, 16
	str r2, [sp, 0x8]
	lsls r3, 16
	lsrs r3, 16
	lsls r0, 16
	lsrs r4, r0, 16
	subs r1, r3, r1
	ldr r5, _08003688 @ =gGlyphBuffer1
	adds r0, r5, 0
	adds r0, 0x80
	ldrb r7, [r0]
	adds r2, r5, 0
	cmp r1, r7
	bge _0800364A
	adds r7, r1, 0
_0800364A:
	ldr r1, [sp, 0x8]
	subs r0, r4, r1
	adds r1, r2, 0
	adds r1, 0x81
	ldrb r1, [r1]
	str r1, [sp, 0xC]
	cmp r0, r1
	bge _0800365C
	str r0, [sp, 0xC]
_0800365C:
	movs r1, 0
	movs r0, 0x7
	ands r0, r3
	adds r0, r3, r0
	lsrs r0, 3
	str r0, [sp, 0x10]
	cmp r7, 0x8
	ble _0800366E
	movs r1, 0x1
_0800366E:
	ldr r3, [sp, 0xC]
	cmp r3, 0x8
	ble _08003678
	movs r0, 0x2
	orrs r1, r0
_08003678:
	cmp r1, 0x1
	beq _08003718
	cmp r1, 0x1
	bgt _0800368C
	cmp r1, 0
	beq _0800369A
	b _08003B00
	.align 2, 0
_08003688: .4byte gGlyphBuffer1
_0800368C:
	cmp r1, 0x2
	bne _08003692
	b _0800381C
_08003692:
	cmp r1, 0x3
	bne _08003698
	b _0800391C
_08003698:
	b _08003B00
_0800369A:
	adds r1, r2, 0
	movs r0, 0
	ldr r2, [sp, 0x8]
	ldr r3, [sp, 0xC]
	cmp r0, r3
	blt _080036A8
	b _08003B00
_080036A8:
	ldm r1!, {r3}
	mov r8, r3
	movs r5, 0
	ldr r3, [sp, 0x4]
	str r1, [sp, 0x28]
	adds r0, 0x1
	mov r9, r0
	adds r0, r2, 0x1
	mov r10, r0
	cmp r5, r7
	bge _0800370A
	asrs r0, r2, 3
	ldr r1, [sp, 0x10]
	muls r0, r1
	lsls r0, 5
	mov r12, r0
	lsls r0, r2, 29
	lsrs r6, r0, 27
_080036CC:
	asrs r1, r3, 1
	movs r0, 0x3
	ands r1, r0
	ldr r2, [sp]
	adds r1, r2, r1
	asrs r0, r3, 3
	lsls r0, 5
	adds r1, r0
	add r1, r12
	adds r4, r1, r6
	lsls r0, r5, 2
	mov r2, r8
	lsrs r2, r0
	movs r0, 0xF
	ands r2, r0
	cmp r2, 0
	beq _08003702
	movs r0, 0x1
	ands r0, r3
	lsls r0, 2
	lsls r2, r0
	movs r1, 0xF0
	asrs r1, r0
	ldrb r0, [r4]
	ands r1, r0
	orrs r2, r1
	strb r2, [r4]
_08003702:
	adds r5, 0x1
	adds r3, 0x1
	cmp r5, r7
	blt _080036CC
_0800370A:
	ldr r1, [sp, 0x28]
	mov r0, r9
	mov r2, r10
	ldr r3, [sp, 0xC]
	cmp r0, r3
	blt _080036A8
	b _08003B00
_08003718:
	adds r5, r2, 0
	movs r4, 0
	ldr r2, [sp, 0x8]
	ldr r0, [sp, 0xC]
	cmp r4, r0
	bge _0800378E
_08003724:
	ldm r5!, {r1}
	mov r8, r1
	movs r6, 0
	ldr r3, [sp, 0x4]
	asrs r0, r2, 3
	lsls r1, r2, 29
	str r5, [sp, 0x2C]
	adds r4, 0x1
	mov r9, r4
	adds r2, 0x1
	mov r10, r2
	ldr r2, [sp, 0x10]
	muls r0, r2
	lsls r0, 5
	mov r12, r0
	lsrs r5, r1, 27
_08003744:
	asrs r1, r3, 1
	movs r0, 0x3
	ands r1, r0
	ldr r0, [sp]
	adds r1, r0, r1
	asrs r0, r3, 3
	lsls r0, 5
	adds r1, r0
	add r1, r12
	adds r4, r1, r5
	lsls r0, r6, 2
	mov r2, r8
	lsrs r2, r0
	movs r0, 0xF
	ands r2, r0
	cmp r2, 0
	beq _0800377A
	movs r0, 0x1
	ands r0, r3
	lsls r0, 2
	lsls r2, r0
	movs r1, 0xF0
	asrs r1, r0
	ldrb r0, [r4]
	ands r1, r0
	orrs r2, r1
	strb r2, [r4]
_0800377A:
	adds r6, 0x1
	adds r3, 0x1
	cmp r6, 0x7
	ble _08003744
	ldr r5, [sp, 0x2C]
	mov r4, r9
	mov r2, r10
	ldr r1, [sp, 0xC]
	cmp r4, r1
	blt _08003724
_0800378E:
	ldr r1, _08003818 @ =gGlyphBuffer2
	movs r0, 0
	ldr r2, [sp, 0x8]
	ldr r3, [sp, 0xC]
	cmp r0, r3
	blt _0800379C
	b _08003B00
_0800379C:
	subs r7, 0x8
	str r7, [sp, 0x18]
	str r7, [sp, 0x14]
_080037A2:
	ldm r1!, {r3}
	mov r8, r3
	movs r5, 0
	ldr r3, [sp, 0x4]
	adds r3, 0x8
	mov r12, r1
	adds r0, 0x1
	mov r9, r0
	adds r0, r2, 0x1
	mov r10, r0
	ldr r1, [sp, 0x14]
	cmp r5, r1
	bge _08003808
	asrs r0, r2, 3
	ldr r1, [sp, 0x10]
	muls r0, r1
	lsls r7, r0, 5
	lsls r0, r2, 29
	lsrs r6, r0, 27
_080037C8:
	asrs r1, r3, 1
	movs r0, 0x3
	ands r1, r0
	ldr r2, [sp]
	adds r1, r2, r1
	asrs r0, r3, 3
	lsls r0, 5
	adds r1, r0
	adds r1, r7
	adds r4, r1, r6
	lsls r0, r5, 2
	mov r2, r8
	lsrs r2, r0
	movs r0, 0xF
	ands r2, r0
	cmp r2, 0
	beq _080037FE
	movs r0, 0x1
	ands r0, r3
	lsls r0, 2
	lsls r2, r0
	movs r1, 0xF0
	asrs r1, r0
	ldrb r0, [r4]
	ands r1, r0
	orrs r2, r1
	strb r2, [r4]
_080037FE:
	adds r5, 0x1
	adds r3, 0x1
	ldr r0, [sp, 0x18]
	cmp r5, r0
	blt _080037C8
_08003808:
	mov r1, r12
	mov r0, r9
	mov r2, r10
	ldr r3, [sp, 0xC]
	cmp r0, r3
	blt _080037A2
	b _08003B00
	.align 2, 0
_08003818: .4byte gGlyphBuffer2
_0800381C:
	adds r0, r2, 0
	movs r1, 0
	ldr r2, [sp, 0x8]
	adds r3, r2, 0
	adds r3, 0x8
	str r3, [sp, 0x1C]
	ldr r3, [sp, 0xC]
	subs r3, 0x8
	str r3, [sp, 0x20]
_0800382E:
	ldm r0!, {r3}
	mov r8, r3
	movs r5, 0
	ldr r3, [sp, 0x4]
	str r0, [sp, 0x34]
	adds r1, 0x1
	mov r9, r1
	adds r0, r2, 0x1
	mov r10, r0
	cmp r5, r7
	bge _08003890
	asrs r0, r2, 3
	ldr r1, [sp, 0x10]
	muls r0, r1
	lsls r0, 5
	mov r12, r0
	lsls r0, r2, 29
	lsrs r6, r0, 27
_08003852:
	asrs r1, r3, 1
	movs r0, 0x3
	ands r1, r0
	ldr r2, [sp]
	adds r1, r2, r1
	asrs r0, r3, 3
	lsls r0, 5
	adds r1, r0
	add r1, r12
	adds r4, r1, r6
	lsls r0, r5, 2
	mov r2, r8
	lsrs r2, r0
	movs r0, 0xF
	ands r2, r0
	cmp r2, 0
	beq _08003888
	movs r0, 0x1
	ands r0, r3
	lsls r0, 2
	lsls r2, r0
	movs r1, 0xF0
	asrs r1, r0
	ldrb r0, [r4]
	ands r1, r0
	orrs r2, r1
	strb r2, [r4]
_08003888:
	adds r5, 0x1
	adds r3, 0x1
	cmp r5, r7
	blt _08003852
_08003890:
	ldr r0, [sp, 0x34]
	mov r1, r9
	mov r2, r10
	cmp r1, 0x7
	ble _0800382E
	ldr r2, _08003918 @ =gGlyphBuffer3
	movs r0, 0
	ldr r1, [sp, 0x1C]
	ldr r3, [sp, 0x20]
	cmp r0, r3
	blt _080038A8
	b _08003B00
_080038A8:
	ldm r2!, {r3}
	mov r8, r3
	movs r5, 0
	ldr r3, [sp, 0x4]
	str r2, [sp, 0x38]
	adds r0, 0x1
	mov r9, r0
	adds r0, r1, 0x1
	mov r10, r0
	cmp r5, r7
	bge _0800390A
	asrs r0, r1, 3
	ldr r2, [sp, 0x10]
	muls r0, r2
	lsls r0, 5
	mov r12, r0
	lsls r0, r1, 29
	lsrs r6, r0, 27
_080038CC:
	asrs r1, r3, 1
	movs r0, 0x3
	ands r1, r0
	ldr r0, [sp]
	adds r1, r0, r1
	asrs r0, r3, 3
	lsls r0, 5
	adds r1, r0
	add r1, r12
	adds r4, r1, r6
	lsls r0, r5, 2
	mov r2, r8
	lsrs r2, r0
	movs r0, 0xF
	ands r2, r0
	cmp r2, 0
	beq _08003902
	movs r0, 0x1
	ands r0, r3
	lsls r0, 2
	lsls r2, r0
	movs r1, 0xF0
	asrs r1, r0
	ldrb r0, [r4]
	ands r1, r0
	orrs r2, r1
	strb r2, [r4]
_08003902:
	adds r5, 0x1
	adds r3, 0x1
	cmp r5, r7
	blt _080038CC
_0800390A:
	ldr r2, [sp, 0x38]
	mov r0, r9
	mov r1, r10
	ldr r3, [sp, 0x20]
	cmp r0, r3
	blt _080038A8
	b _08003B00
	.align 2, 0
_08003918: .4byte gGlyphBuffer3
_0800391C:
	movs r2, 0
	ldr r4, [sp, 0x8]
	ldr r0, [sp, 0x4]
	adds r0, 0x8
	str r0, [sp, 0x3C]
	subs r7, 0x8
	str r7, [sp, 0x18]
	adds r1, r4, 0
	adds r1, 0x8
	str r1, [sp, 0x1C]
	ldr r3, [sp, 0xC]
	subs r3, 0x8
	str r3, [sp, 0x20]
_08003936:
	ldm r5!, {r0}
	mov r8, r0
	movs r6, 0
	ldr r3, [sp, 0x4]
	asrs r0, r4, 3
	lsls r1, r4, 29
	mov r10, r5
	adds r2, 0x1
	mov r12, r2
	adds r4, 0x1
	mov r9, r4
	ldr r2, [sp, 0x10]
	muls r0, r2
	lsls r7, r0, 5
	lsrs r5, r1, 27
_08003954:
	asrs r1, r3, 1
	movs r0, 0x3
	ands r1, r0
	ldr r0, [sp]
	adds r1, r0, r1
	asrs r0, r3, 3
	lsls r0, 5
	adds r1, r0
	adds r1, r7
	adds r4, r1, r5
	lsls r0, r6, 2
	mov r2, r8
	lsrs r2, r0
	movs r0, 0xF
	ands r2, r0
	cmp r2, 0
	beq _0800398A
	movs r0, 0x1
	ands r0, r3
	lsls r0, 2
	lsls r2, r0
	movs r1, 0xF0
	asrs r1, r0
	ldrb r0, [r4]
	ands r1, r0
	orrs r2, r1
	strb r2, [r4]
_0800398A:
	adds r6, 0x1
	adds r3, 0x1
	cmp r6, 0x7
	ble _08003954
	mov r5, r10
	mov r2, r12
	mov r4, r9
	cmp r2, 0x7
	ble _08003936
	ldr r1, _08003B10 @ =gGlyphBuffer2
	movs r0, 0
	ldr r2, [sp, 0x8]
	ldr r3, [sp, 0x18]
	mov r12, r3
_080039A6:
	ldm r1!, {r3}
	mov r8, r3
	movs r5, 0
	ldr r3, [sp, 0x3C]
	str r1, [sp, 0x24]
	adds r0, 0x1
	mov r9, r0
	adds r0, r2, 0x1
	mov r10, r0
	cmp r5, r12
	bge _08003A06
	asrs r0, r2, 3
	ldr r1, [sp, 0x10]
	muls r0, r1
	lsls r7, r0, 5
	lsls r0, r2, 29
	lsrs r6, r0, 27
_080039C8:
	asrs r1, r3, 1
	movs r0, 0x3
	ands r1, r0
	ldr r2, [sp]
	adds r1, r2, r1
	asrs r0, r3, 3
	lsls r0, 5
	adds r1, r0
	adds r1, r7
	adds r4, r1, r6
	lsls r0, r5, 2
	mov r2, r8
	lsrs r2, r0
	movs r0, 0xF
	ands r2, r0
	cmp r2, 0
	beq _080039FE
	movs r0, 0x1
	ands r0, r3
	lsls r0, 2
	lsls r2, r0
	movs r1, 0xF0
	asrs r1, r0
	ldrb r0, [r4]
	ands r1, r0
	orrs r2, r1
	strb r2, [r4]
_080039FE:
	adds r5, 0x1
	adds r3, 0x1
	cmp r5, r12
	blt _080039C8
_08003A06:
	ldr r1, [sp, 0x24]
	mov r0, r9
	mov r2, r10
	cmp r0, 0x7
	ble _080039A6
	ldr r6, _08003B14 @ =gGlyphBuffer3
	movs r4, 0
	ldr r2, [sp, 0x1C]
	ldr r3, [sp, 0x20]
	cmp r4, r3
	bge _08003A84
_08003A1C:
	ldm r6!, {r0}
	mov r8, r0
	movs r5, 0
	ldr r3, [sp, 0x4]
	asrs r0, r2, 3
	lsls r1, r2, 29
	mov r12, r6
	adds r4, 0x1
	mov r9, r4
	adds r2, 0x1
	mov r10, r2
	ldr r2, [sp, 0x10]
	muls r0, r2
	lsls r7, r0, 5
	lsrs r6, r1, 27
_08003A3A:
	asrs r1, r3, 1
	movs r0, 0x3
	ands r1, r0
	ldr r0, [sp]
	adds r1, r0, r1
	asrs r0, r3, 3
	lsls r0, 5
	adds r1, r0
	adds r1, r7
	adds r4, r1, r6
	lsls r0, r5, 2
	mov r2, r8
	lsrs r2, r0
	movs r0, 0xF
	ands r2, r0
	cmp r2, 0
	beq _08003A70
	movs r0, 0x1
	ands r0, r3
	lsls r0, 2
	lsls r2, r0
	movs r1, 0xF0
	asrs r1, r0
	ldrb r0, [r4]
	ands r1, r0
	orrs r2, r1
	strb r2, [r4]
_08003A70:
	adds r5, 0x1
	adds r3, 0x1
	cmp r5, 0x7
	ble _08003A3A
	mov r6, r12
	mov r4, r9
	mov r2, r10
	ldr r1, [sp, 0x20]
	cmp r4, r1
	blt _08003A1C
_08003A84:
	ldr r2, _08003B18 @ =gGlyphBuffer4
	movs r0, 0
	ldr r1, [sp, 0x1C]
	ldr r3, [sp, 0x20]
	cmp r0, r3
	bge _08003B00
	ldr r3, [sp, 0x18]
	mov r12, r3
_08003A94:
	ldm r2!, {r3}
	mov r8, r3
	movs r5, 0
	ldr r3, [sp, 0x3C]
	str r2, [sp, 0x30]
	adds r0, 0x1
	mov r9, r0
	adds r0, r1, 0x1
	mov r10, r0
	cmp r5, r12
	bge _08003AF4
	asrs r0, r1, 3
	ldr r2, [sp, 0x10]
	muls r0, r2
	lsls r7, r0, 5
	lsls r0, r1, 29
	lsrs r6, r0, 27
_08003AB6:
	asrs r1, r3, 1
	movs r0, 0x3
	ands r1, r0
	ldr r0, [sp]
	adds r1, r0, r1
	asrs r0, r3, 3
	lsls r0, 5
	adds r1, r0
	adds r1, r7
	adds r4, r1, r6
	lsls r0, r5, 2
	mov r2, r8
	lsrs r2, r0
	movs r0, 0xF
	ands r2, r0
	cmp r2, 0
	beq _08003AEC
	movs r0, 0x1
	ands r0, r3
	lsls r0, 2
	lsls r2, r0
	movs r1, 0xF0
	asrs r1, r0
	ldrb r0, [r4]
	ands r1, r0
	orrs r2, r1
	strb r2, [r4]
_08003AEC:
	adds r5, 0x1
	adds r3, 0x1
	cmp r5, r12
	blt _08003AB6
_08003AF4:
	ldr r2, [sp, 0x30]
	mov r0, r9
	mov r1, r10
	ldr r3, [sp, 0x20]
	cmp r0, r3
	blt _08003A94
_08003B00:
	add sp, 0x40
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08003B10: .4byte gGlyphBuffer2
_08003B14: .4byte gGlyphBuffer3
_08003B18: .4byte gGlyphBuffer4
	thumb_func_end sub_8003614

	thumb_func_start ClearTextSpan
ClearTextSpan: @ 8003B1C
	bx lr
	thumb_func_end ClearTextSpan

	.align 2, 0 @ Don't pad with nop.
