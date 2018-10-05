	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_80F80E4
sub_80F80E4: @ 80F80E4
	push {lr}
	lsls r0, 24
	lsrs r3, r0, 24
	movs r1, 0
	ldr r2, _080F80FC @ =gUnknown_843E9E8
_080F80EE:
	ldrb r0, [r2]
	cmp r0, r3
	bne _080F8100
	lsls r0, r1, 24
	lsrs r0, 24
	b _080F810A
	.align 2, 0
_080F80FC: .4byte gUnknown_843E9E8
_080F8100:
	adds r2, 0x10
	adds r1, 0x1
	cmp r1, 0x1B
	bls _080F80EE
	movs r0, 0x1C
_080F810A:
	pop {r1}
	bx r1
	thumb_func_end sub_80F80E4

	thumb_func_start sub_80F8110
sub_80F8110: @ 80F8110
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r4, r1, 24
	adds r5, r4, 0
	bl sub_80F80E4
	lsls r0, 24
	lsrs r0, 24
	adds r1, r0, 0
	cmp r1, 0x1C
	beq _080F814C
	cmp r4, 0x2
	bne _080F8132
	movs r0, 0x1
	b _080F814E
_080F8132:
	movs r2, 0
	ldr r0, _080F8148 @ =gUnknown_843E9E8
	lsls r1, 4
	adds r1, r0
	ldrb r0, [r1, 0x1]
	cmp r0, r5
	bne _080F8142
	movs r2, 0x1
_080F8142:
	adds r0, r2, 0
	b _080F814E
	.align 2, 0
_080F8148: .4byte gUnknown_843E9E8
_080F814C:
	movs r0, 0
_080F814E:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80F8110

	thumb_func_start sub_80F8154
sub_80F8154: @ 80F8154
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r1, 24
	lsrs r1, 24
	ldr r0, _080F8174 @ =gUnknown_203ADFA
	ldrb r0, [r0]
	cmp r0, 0x2
	beq _080F8178
	adds r0, r2, 0
	bl sub_80F8110
	lsls r0, 24
	lsrs r0, 24
	b _080F817A
	.align 2, 0
_080F8174: .4byte gUnknown_203ADFA
_080F8178:
	movs r0, 0
_080F817A:
	pop {r1}
	bx r1
	thumb_func_end sub_80F8154

	thumb_func_start sub_80F8180
sub_80F8180: @ 80F8180
	push {lr}
	ldr r1, _080F8198 @ =gUnknown_843EBB0
	movs r0, 0
	movs r2, 0x1
	bl InitBgsFromTemplates
	movs r0, 0
	bl ShowBg
	pop {r0}
	bx r0
	.align 2, 0
_080F8198: .4byte gUnknown_843EBB0
	thumb_func_end sub_80F8180

	thumb_func_start sub_80F819C
sub_80F819C: @ 80F819C
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	bl sub_80F80E4
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x1C
	beq _080F8224
	bl reset_temp_tile_data_buffers
	ldr r4, _080F8200 @ =gUnknown_843E9E8
	lsls r5, 4
	adds r0, r4, 0
	adds r0, 0xC
	adds r0, r5, r0
	ldr r0, [r0]
	movs r1, 0xD0
	movs r2, 0x60
	bl LoadPalette
	adds r4, 0x4
	adds r4, r5, r4
	ldr r1, [r4]
	movs r4, 0
	str r4, [sp]
	movs r0, 0
	movs r2, 0
	movs r3, 0
	bl decompress_and_copy_tile_data_to_vram
	movs r0, 0
	bl GetBgTilemapBuffer
	cmp r0, 0
	bne _080F8208
	movs r0, 0x80
	lsls r0, 4
	bl Alloc
	adds r1, r0, 0
	movs r0, 0
	bl SetBgTilemapBuffer
	ldr r1, _080F8204 @ =gUnknown_203ABED
	movs r0, 0x1
	strb r0, [r1]
	b _080F820C
	.align 2, 0
_080F8200: .4byte gUnknown_843E9E8
_080F8204: .4byte gUnknown_203ABED
_080F8208:
	ldr r0, _080F822C @ =gUnknown_203ABED
	strb r4, [r0]
_080F820C:
	ldr r0, _080F8230 @ =gUnknown_843E9E8
	adds r0, 0x8
	adds r0, r5, r0
	ldr r1, [r0]
	movs r0, 0
	movs r2, 0
	movs r3, 0
	bl CopyToBgTilemapBuffer
	movs r0, 0
	bl CopyBgTilemapBufferToVram
_080F8224:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080F822C: .4byte gUnknown_203ABED
_080F8230: .4byte gUnknown_843E9E8
	thumb_func_end sub_80F819C

	thumb_func_start sub_80F8234
sub_80F8234: @ 80F8234
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl RemoveWindow
	ldr r0, _080F8254 @ =gUnknown_203ABED
	ldrb r0, [r0]
	cmp r0, 0
	beq _080F8250
	movs r0, 0
	bl GetBgTilemapBuffer
	bl Free
_080F8250:
	pop {r0}
	bx r0
	.align 2, 0
_080F8254: .4byte gUnknown_203ABED
	thumb_func_end sub_80F8234

	thumb_func_start sub_80F8258
sub_80F8258: @ 80F8258
	push {lr}
	bl free_temp_tile_data_buffers_if_possible
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end sub_80F8258

	thumb_func_start sub_80F8268
sub_80F8268: @ 80F8268
	push {r4-r6,lr}
	adds r6, r0, 0
	lsls r6, 24
	lsrs r6, 24
	ldr r0, _080F8308 @ =sub_80F83D0
	movs r1, 0
	bl CreateTask
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0
	movs r1, 0x7
	bl GetBgAttribute
	ldr r1, _080F830C @ =gTasks
	lsls r5, r4, 2
	adds r5, r4
	lsls r5, 3
	adds r5, r1
	movs r4, 0
	strh r0, [r5, 0xC]
	movs r0, 0x50
	bl GetGpuReg
	strh r0, [r5, 0x10]
	movs r0, 0x52
	bl GetGpuReg
	strh r0, [r5, 0x12]
	movs r0, 0
	bl GetGpuReg
	strh r0, [r5, 0xE]
	movs r0, 0x48
	bl GetGpuReg
	strh r0, [r5, 0x14]
	movs r0, 0x4A
	bl GetGpuReg
	strh r0, [r5, 0x16]
	adds r0, r6, 0
	bl sub_80F856C
	strh r0, [r5, 0x1C]
	movs r0, 0x10
	strh r0, [r5, 0x18]
	strh r4, [r5, 0x1A]
	movs r0, 0
	movs r1, 0x7
	movs r2, 0
	bl SetBgAttribute
	ldr r1, _080F8310 @ =0x00003e41
	movs r0, 0x50
	bl SetGpuReg
	movs r0, 0x52
	movs r1, 0x10
	bl SetGpuReg
	ldr r1, _080F8314 @ =0x00002020
	movs r0, 0x48
	bl SetGpuRegBits
	movs r0, 0x4A
	movs r1, 0x20
	bl SetGpuRegBits
	adds r0, r6, 0
	bl sub_80F8318
	strh r0, [r5, 0x1E]
	bl ScriptContext2_Enable
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080F8308: .4byte sub_80F83D0
_080F830C: .4byte gTasks
_080F8310: .4byte 0x00003e41
_080F8314: .4byte 0x00002020
	thumb_func_end sub_80F8268

	thumb_func_start sub_80F8318
sub_80F8318: @ 80F8318
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	sub sp, 0x14
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _080F83A8 @ =gUnknown_843EBA8
	bl AddWindow
	mov r8, r0
	mov r0, r8
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	lsls r6, r0, 24
	lsrs r6, 24
	adds r0, r6, 0
	movs r1, 0x11
	bl FillWindowPixelBuffer
	adds r0, r6, 0
	bl PutWindowTilemap
	add r1, sp, 0x14
	movs r0, 0
	mov r9, r0
	movs r0, 0x1
	strb r0, [r1]
	movs r0, 0x4
	strb r0, [r1, 0x1]
	movs r0, 0x3
	strb r0, [r1, 0x2]
	ldr r5, _080F83AC @ =gStringVar4
	adds r0, r5, 0
	adds r1, r4, 0
	movs r2, 0
	bl sub_80C4D78
	movs r0, 0x2
	adds r1, r5, 0
	movs r2, 0
	bl GetStringWidth
	movs r2, 0x68
	subs r2, r0
	lsrs r2, 1
	lsls r2, 24
	lsrs r2, 24
	mov r0, r9
	str r0, [sp]
	str r0, [sp, 0x4]
	add r0, sp, 0x14
	str r0, [sp, 0x8]
	movs r0, 0x1
	negs r0, r0
	str r0, [sp, 0xC]
	str r5, [sp, 0x10]
	adds r0, r6, 0
	movs r1, 0x2
	movs r3, 0x2
	bl AddTextPrinterParametrized2
	mov r0, r8
	add sp, 0x14
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_080F83A8: .4byte gUnknown_843EBA8
_080F83AC: .4byte gStringVar4
	thumb_func_end sub_80F8318

	thumb_func_start sub_80F83B0
sub_80F83B0: @ 80F83B0
	push {lr}
	ldr r0, _080F83C4 @ =sub_80F83D0
	bl FuncIsActiveTask
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080F83C8
	movs r0, 0x1
	b _080F83CA
	.align 2, 0
_080F83C4: .4byte sub_80F83D0
_080F83C8:
	movs r0, 0
_080F83CA:
	pop {r1}
	bx r1
	thumb_func_end sub_80F83B0

	thumb_func_start sub_80F83D0
sub_80F83D0: @ 80F83D0
	push {r4,r5,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _080F83F8 @ =gTasks+0x8
	adds r4, r0, r1
	movs r1, 0
	ldrsh r0, [r4, r1]
	cmp r0, 0x5
	bls _080F83EC
	b _080F853C
_080F83EC:
	lsls r0, 2
	ldr r1, _080F83FC @ =_080F8400
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080F83F8: .4byte gTasks+0x8
_080F83FC: .4byte _080F8400
	.align 2, 0
_080F8400:
	.4byte _080F8418
	.4byte _080F8438
	.4byte _080F8448
	.4byte _080F8458
	.4byte _080F8470
	.4byte _080F84F2
_080F8418:
	bl sub_80F8258
	cmp r0, 0
	beq _080F8422
	b _080F853C
_080F8422:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	beq _080F842E
	b _080F853C
_080F842E:
	ldrb r0, [r4, 0x16]
	movs r1, 0x3
	bl CopyWindowToVram
	b _080F84EA
_080F8438:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _080F853C
	bl sub_807DC00
	b _080F84EA
_080F8448:
	bl sub_807AA70
	lsls r0, 24
	cmp r0, 0
	beq _080F853C
	bl sub_8055DC4
	b _080F84EA
_080F8458:
	ldrh r0, [r4, 0x2]
	adds r0, 0x1
	strh r0, [r4, 0x2]
	lsls r0, 16
	asrs r0, 16
	movs r2, 0x14
	ldrsh r1, [r4, r2]
	cmp r0, r1
	ble _080F853C
	movs r0, 0
	strh r0, [r4, 0x2]
	b _080F84EA
_080F8470:
	movs r1, 0x2
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080F847E
	cmp r0, 0x1
	beq _080F8492
	b _080F84A2
_080F847E:
	ldrh r0, [r4, 0x12]
	adds r0, 0x1
	strh r0, [r4, 0x12]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x10
	ble _080F84A2
	movs r0, 0x10
	strh r0, [r4, 0x12]
	b _080F84A2
_080F8492:
	ldrh r0, [r4, 0x10]
	subs r0, 0x1
	strh r0, [r4, 0x10]
	lsls r0, 16
	cmp r0, 0
	bge _080F84A2
	movs r0, 0
	strh r0, [r4, 0x10]
_080F84A2:
	movs r2, 0x2
	ldrsh r0, [r4, r2]
	adds r0, 0x1
	movs r1, 0x3
	bl __modsi3
	strh r0, [r4, 0x2]
	ldrh r1, [r4, 0x12]
	lsls r1, 8
	ldrh r0, [r4, 0x10]
	orrs r1, r0
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x52
	bl SetGpuReg
	movs r1, 0x10
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080F853C
	movs r2, 0x12
	ldrsh r0, [r4, r2]
	cmp r0, 0x10
	bne _080F853C
	movs r0, 0x20
	str r0, [sp]
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect_Palette0
	movs r0, 0
	bl CopyBgTilemapBufferToVram
_080F84EA:
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	b _080F853C
_080F84F2:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _080F853C
	movs r1, 0x16
	ldrsh r0, [r4, r1]
	bl sub_80F8234
	ldrb r2, [r4, 0x4]
	movs r0, 0
	movs r1, 0x7
	bl SetBgAttribute
	ldrh r1, [r4, 0x6]
	movs r0, 0
	bl SetGpuReg
	ldrh r1, [r4, 0x8]
	movs r0, 0x50
	bl SetGpuReg
	ldrh r1, [r4, 0xA]
	movs r0, 0x52
	bl SetGpuReg
	ldrh r1, [r4, 0xC]
	movs r0, 0x48
	bl SetGpuReg
	ldrh r1, [r4, 0xE]
	movs r0, 0x4A
	bl SetGpuReg
	adds r0, r5, 0
	bl DestroyTask
_080F853C:
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80F83D0

	thumb_func_start sub_80F8544
sub_80F8544: @ 80F8544
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl sub_80F80E4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1C
	beq _080F8564
	lsls r0, 4
	ldr r1, _080F8560 @ =gUnknown_843E9E8
	adds r0, r1
	b _080F8566
	.align 2, 0
_080F8560: .4byte gUnknown_843E9E8
_080F8564:
	movs r0, 0
_080F8566:
	pop {r1}
	bx r1
	thumb_func_end sub_80F8544

	thumb_func_start sub_80F856C
sub_80F856C: @ 80F856C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl sub_80F80E4
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x1C
	bne _080F8582
	movs r0, 0
	b _080F85B6
_080F8582:
	ldr r0, _080F85A0 @ =gUnknown_843E9E8
	lsls r1, 4
	adds r1, r0
	ldrh r2, [r1, 0x2]
	ldrb r0, [r1, 0x1]
	cmp r0, 0
	bne _080F85A4
	adds r0, r2, 0
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _080F85B4
	b _080F85AC
	.align 2, 0
_080F85A0: .4byte gUnknown_843E9E8
_080F85A4:
	ldr r0, _080F85B0 @ =gUnknown_203ABEC
	ldrb r0, [r0]
	cmp r0, 0
	bne _080F85B4
_080F85AC:
	movs r0, 0x28
	b _080F85B6
	.align 2, 0
_080F85B0: .4byte gUnknown_203ABEC
_080F85B4:
	movs r0, 0x78
_080F85B6:
	pop {r1}
	bx r1
	thumb_func_end sub_80F856C

	thumb_func_start sub_80F85BC
sub_80F85BC: @ 80F85BC
	push {r4,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	adds r0, r4, 0
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	bne _080F85D8
	ldr r1, _080F85D4 @ =gUnknown_203ABEC
	movs r0, 0x1
	b _080F85DC
	.align 2, 0
_080F85D4: .4byte gUnknown_203ABEC
_080F85D8:
	ldr r1, _080F85EC @ =gUnknown_203ABEC
	movs r0, 0
_080F85DC:
	strb r0, [r1]
	adds r0, r4, 0
	bl FlagSet
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F85EC: .4byte gUnknown_203ABEC
	thumb_func_end sub_80F85BC

	.align 2, 0 @ Don't pad with nop.
