	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_80CA2E4
sub_80CA2E4: @ 80CA2E4
	push {r4-r7,lr}
	sub sp, 0x4
	bl sp000_heal_pokemon
	ldr r4, _080CA304 @ =0x0000082c
	adds r0, r4, 0
	bl FlagGet
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x1
	bne _080CA30C
	ldr r0, _080CA308 @ =gUnknown_203AB44
	strb r1, [r0]
	b _080CA318
	.align 2, 0
_080CA304: .4byte 0x0000082c
_080CA308: .4byte gUnknown_203AB44
_080CA30C:
	ldr r1, _080CA3B0 @ =gUnknown_203AB44
	movs r0, 0
	strb r0, [r1]
	adds r0, r4, 0
	bl FlagSet
_080CA318:
	movs r0, 0x1
	bl GetGameStat
	cmp r0, 0
	bne _080CA33A
	ldr r0, _080CA3B4 @ =gSaveBlock2Ptr
	ldr r2, [r0]
	ldrh r1, [r2, 0xE]
	lsls r1, 16
	ldrb r0, [r2, 0x10]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x11]
	orrs r1, r0
	movs r0, 0x1
	bl sub_8054F00
_080CA33A:
	bl sub_804C1AC
	movs r0, 0x1
	bl sub_8055738
	movs r6, 0
	movs r5, 0
	mov r7, sp
_080CA34A:
	movs r0, 0x64
	adds r1, r5, 0
	muls r1, r0
	ldr r0, _080CA3B8 @ =gUnknown_2024284
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0x5
	bl GetMonData
	cmp r0, 0
	beq _080CA388
	adds r0, r4, 0
	movs r1, 0x6
	bl GetMonData
	cmp r0, 0
	bne _080CA388
	adds r0, r4, 0
	movs r1, 0x43
	bl GetMonData
	cmp r0, 0
	bne _080CA388
	movs r0, 0x1
	strb r0, [r7]
	adds r0, r4, 0
	movs r1, 0x43
	mov r2, sp
	bl sub_804037C
	movs r6, 0x1
_080CA388:
	adds r5, 0x1
	cmp r5, 0x5
	ble _080CA34A
	cmp r6, 0x1
	bne _080CA39E
	movs r0, 0x2A
	bl IncrementGameStat
	ldr r0, _080CA3BC @ =0x0000083b
	bl FlagSet
_080CA39E:
	ldr r0, _080CA3C0 @ =CB2_DoHallOfFameScreen
	bl SetMainCallback2
	movs r0, 0
	add sp, 0x4
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080CA3B0: .4byte gUnknown_203AB44
_080CA3B4: .4byte gSaveBlock2Ptr
_080CA3B8: .4byte gUnknown_2024284
_080CA3BC: .4byte 0x0000083b
_080CA3C0: .4byte CB2_DoHallOfFameScreen
	thumb_func_end sub_80CA2E4

	thumb_func_start sub_80CA3C4
sub_80CA3C4: @ 80CA3C4
	push {lr}
	ldr r0, _080CA3D4 @ =c2_whiteout
	bl SetMainCallback2
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_080CA3D4: .4byte c2_whiteout
	thumb_func_end sub_80CA3C4

	.align 2, 0 @ Don't pad with nop.
