	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_812DBC0
sub_812DBC0: @ 812DBC0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0xC
	adds r7, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r0, _0812DC68 @ =gUnknown_203B104
	mov r10, r0
	movs r2, 0
	mov r8, r2
	str r2, [r0]
	ldr r6, _0812DC6C @ =gUnknown_203B0FC
	ldr r0, [r6]
	ldrb r2, [r0, 0xA]
	ldrb r0, [r0, 0xB]
	adds r2, r0
	mov r9, r2
	adds r0, r7, 0
	bl sub_812DDF0
	ldr r0, _0812DC70 @ =sub_812C694
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0xFF
	bne _0812DBFE
	b _0812DD3A
_0812DBFE:
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _0812DC74 @ =gTasks
	adds r5, r0, r1
	movs r0, 0x5
	bl PlaySE
	mov r0, r8
	strh r0, [r5, 0xA]
	ldr r0, [r6]
	ldrb r0, [r0, 0x8]
	add r1, sp, 0x8
	movs r2, 0
	bl get_coro_args_x18_x1A
	ldr r1, [r6]
	add r0, sp, 0x8
	ldrh r0, [r0]
	strh r0, [r1, 0x4]
	ldrb r0, [r1, 0x7]
	lsrs r0, 2
	subs r0, 0x1
	cmp r7, r0
	beq _0812DCD8
	bl sub_812D174
	lsls r0, r7, 24
	lsrs r0, 24
	bl sub_812D1A8
	ldr r2, [r6]
	ldrb r1, [r2, 0x7]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0812DCBC
	adds r0, r2, 0
	adds r0, 0x23
	ldrb r1, [r0]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	bne _0812DC7C
	adds r0, r4, 0
	mov r1, r9
	bl sub_812D9A8
	mov r1, r10
	str r7, [r1]
	ldr r0, _0812DC78 @ =sub_812DD50
	str r0, [r5]
	b _0812DD3A
	.align 2, 0
_0812DC68: .4byte gUnknown_203B104
_0812DC6C: .4byte gUnknown_203B0FC
_0812DC70: .4byte sub_812C694
_0812DC74: .4byte gTasks
_0812DC78: .4byte sub_812DD50
_0812DC7C:
	ldr r4, _0812DCB8 @ =gSprites
	movs r2, 0xC
	ldrsh r0, [r5, r2]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	adds r1, 0x3E
	ldrb r3, [r1]
	movs r2, 0x5
	negs r2, r2
	adds r0, r2, 0
	ands r0, r3
	strb r0, [r1]
	ldr r0, [r6]
	adds r0, 0x23
	ldrb r1, [r0]
	ands r2, r1
	strb r2, [r0]
	movs r0, 0xC
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	mov r1, r8
	strh r1, [r0, 0x2E]
	bl sub_812CD3C
	b _0812DD3A
	.align 2, 0
_0812DCB8: .4byte gSprites
_0812DCBC:
	movs r0, 0xD0
	str r0, [sp]
	movs r0, 0x20
	str r0, [sp, 0x4]
	movs r0, 0x2
	movs r1, 0x11
	movs r2, 0
	movs r3, 0
	bl FillWindowPixelRect
	movs r0, 0x2
	bl sub_812CEE0
	b _0812DD3A
_0812DCD8:
	bl sub_812DDAC
	ldr r0, [r6]
	ldrb r1, [r0, 0x7]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0812DD10
	ldr r2, _0812DD0C @ =gSprites
	movs r0, 0xC
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	ldr r1, [r6]
	adds r1, 0x23
	ldrb r0, [r1]
	orrs r0, r2
	strb r0, [r1]
	b _0812DD3A
	.align 2, 0
_0812DD0C: .4byte gSprites
_0812DD10:
	movs r2, 0
	ldr r5, _0812DD4C @ =gSprites
	adds r4, r6, 0
	movs r3, 0x4
_0812DD18:
	ldr r0, [r4]
	adds r0, 0x1D
	adds r0, r2
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	adds r0, 0x3E
	ldrb r1, [r0]
	orrs r1, r3
	strb r1, [r0]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x5
	bls _0812DD18
_0812DD3A:
	add sp, 0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0812DD4C: .4byte gSprites
	thumb_func_end sub_812DBC0

	thumb_func_start sub_812DD50
sub_812DD50: @ 812DD50
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	ldr r0, _0812DD98 @ =gTasks
	adds r4, r0
	ldr r0, _0812DD9C @ =gUnknown_203B0FC
	ldr r0, [r0]
	ldr r1, _0812DDA0 @ =gUnknown_203B104
	adds r0, 0xC
	ldr r1, [r1]
	adds r0, r1
	ldrb r0, [r0]
	bl sub_812D888
	lsls r0, 24
	lsrs r0, 24
	movs r3, 0
	strh r0, [r4, 0xC]
	ldr r2, _0812DDA4 @ =gSprites
	movs r0, 0xC
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	strh r3, [r0, 0x2E]
	bl sub_812CD3C
	ldr r0, _0812DDA8 @ =sub_812C694
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812DD98: .4byte gTasks
_0812DD9C: .4byte gUnknown_203B0FC
_0812DDA0: .4byte gUnknown_203B104
_0812DDA4: .4byte gSprites
_0812DDA8: .4byte sub_812C694
	thumb_func_end sub_812DD50

	thumb_func_start sub_812DDAC
sub_812DDAC: @ 812DDAC
	push {lr}
	sub sp, 0x10
	movs r0, 0xD0
	str r0, [sp]
	movs r0, 0x20
	str r0, [sp, 0x4]
	movs r0, 0x2
	movs r1, 0x11
	movs r2, 0
	movs r3, 0
	bl FillWindowPixelRect
	ldr r2, _0812DDEC @ =gUnknown_84181C3
	movs r0, 0
	str r0, [sp]
	movs r0, 0x2
	str r0, [sp, 0x4]
	movs r0, 0x1
	str r0, [sp, 0x8]
	movs r0, 0x3
	str r0, [sp, 0xC]
	movs r0, 0x2
	movs r1, 0x2
	movs r3, 0
	bl AddTextPrinterParametrized
	movs r0, 0x2
	bl sub_812CEE0
	add sp, 0x10
	pop {r0}
	bx r0
	.align 2, 0
_0812DDEC: .4byte gUnknown_84181C3
	thumb_func_end sub_812DDAC

	thumb_func_start sub_812DDF0
sub_812DDF0: @ 812DDF0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x18
	mov r8, r0
	lsls r5, r1, 24
	lsrs r5, 24
	ldr r7, _0812DE68 @ =gUnknown_203B0FC
	ldr r0, [r7]
	ldrb r0, [r0, 0x8]
	mov r4, sp
	adds r4, 0x16
	add r1, sp, 0x14
	adds r2, r4, 0
	bl get_coro_args_x18_x1A
	add r1, sp, 0x14
	ldrh r0, [r4]
	ldrh r1, [r1]
	adds r0, r1
	lsls r0, 16
	lsrs r6, r0, 16
	ldrh r0, [r4]
	lsls r3, r0, 3
	subs r3, r0
	lsls r3, 25
	movs r0, 0x80
	lsls r0, 19
	adds r3, r0
	lsrs r3, 24
	movs r1, 0
	str r1, [sp]
	str r1, [sp, 0x4]
	ldr r0, _0812DE6C @ =gUnknown_845F5E6
	str r0, [sp, 0x8]
	str r1, [sp, 0xC]
	ldr r0, _0812DE70 @ =gUnknown_203B100
	ldr r1, [r0]
	mov r2, r8
	lsls r0, r2, 3
	adds r0, r1
	ldr r0, [r0]
	str r0, [sp, 0x10]
	movs r0, 0
	movs r1, 0x2
	movs r2, 0x8
	bl AddTextPrinterParametrized2
	cmp r5, 0
	bne _0812DEC0
	add r0, sp, 0x14
	ldr r1, [r7]
	ldrh r2, [r0]
	ldrb r0, [r1, 0xA]
	cmp r2, r0
	bcs _0812DE74
	ldrb r0, [r1, 0xB]
	adds r0, 0x1
	b _0812DE86
	.align 2, 0
_0812DE68: .4byte gUnknown_203B0FC
_0812DE6C: .4byte gUnknown_845F5E6
_0812DE70: .4byte gUnknown_203B100
_0812DE74:
	cmp r2, r0
	bls _0812DE88
	ldrb r0, [r1, 0x7]
	lsrs r0, 2
	subs r0, 0x1
	cmp r6, r0
	beq _0812DE88
	ldrb r0, [r1, 0xB]
	subs r0, 0x1
_0812DE86:
	strb r0, [r1, 0xB]
_0812DE88:
	ldr r0, _0812DEE4 @ =gUnknown_203B0FC
	ldr r2, [r0]
	ldrb r0, [r2, 0xB]
	lsls r3, r0, 3
	subs r3, r0
	lsls r3, 25
	movs r0, 0x80
	lsls r0, 19
	adds r3, r0
	lsrs r3, 24
	movs r1, 0
	str r1, [sp]
	str r1, [sp, 0x4]
	ldr r0, _0812DEE8 @ =gUnknown_845F5E3
	str r0, [sp, 0x8]
	str r1, [sp, 0xC]
	ldrb r0, [r2, 0x9]
	ldr r1, _0812DEEC @ =gUnknown_203B100
	ldr r1, [r1]
	lsls r0, 3
	adds r0, r1
	ldr r0, [r0]
	str r0, [sp, 0x10]
	movs r0, 0
	movs r1, 0x2
	movs r2, 0x8
	bl AddTextPrinterParametrized2
_0812DEC0:
	ldr r1, _0812DEE4 @ =gUnknown_203B0FC
	ldr r0, [r1]
	mov r2, r8
	strb r2, [r0, 0x9]
	ldr r2, [r1]
	ldrh r0, [r4]
	strb r0, [r2, 0xB]
	ldr r1, [r1]
	add r0, sp, 0x14
	ldrh r0, [r0]
	strb r0, [r1, 0xA]
	add sp, 0x18
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0812DEE4: .4byte gUnknown_203B0FC
_0812DEE8: .4byte gUnknown_845F5E3
_0812DEEC: .4byte gUnknown_203B100
	thumb_func_end sub_812DDF0

	thumb_func_start sub_812DEF0
sub_812DEF0: @ 812DEF0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	movs r4, 0
	movs r6, 0
	ldr r0, _0812DF44 @ =0x0000fdff
	mov r8, r0
	ldr r7, _0812DF48 @ =gUnknown_845F60C
_0812DF00:
	adds r0, r6, 0
	bl sub_812D0C0
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _0812DF4C @ =gSaveBlock1Ptr
	ldr r0, [r0]
	lsls r1, r5, 2
	adds r0, r1
	ldr r1, _0812DF50 @ =0x00003a54
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 30
	cmp r0, 0
	beq _0812DF88
	ldr r0, _0812DF54 @ =gUnknown_845F5EA
	lsls r1, r5, 1
	adds r3, r1, r0
	ldrh r0, [r3]
	cmp r0, r8
	bhi _0812DF60
	ldr r0, _0812DF58 @ =gUnknown_203B100
	ldr r0, [r0]
	lsls r2, r4, 3
	adds r2, r0
	ldrh r1, [r3]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	ldr r1, _0812DF5C @ =gTrainers+0x4
	adds r0, r1
	str r0, [r2]
	str r4, [r2, 0x4]
	b _0812DF78
	.align 2, 0
_0812DF44: .4byte 0x0000fdff
_0812DF48: .4byte gUnknown_845F60C
_0812DF4C: .4byte gSaveBlock1Ptr
_0812DF50: .4byte 0x00003a54
_0812DF54: .4byte gUnknown_845F5EA
_0812DF58: .4byte gUnknown_203B100
_0812DF5C: .4byte gTrainers+0x4
_0812DF60:
	ldr r0, _0812DFC0 @ =gUnknown_203B100
	ldr r0, [r0]
	lsls r1, r4, 3
	adds r1, r0
	ldrh r0, [r3]
	ldr r2, _0812DFC4 @ =0xffff0200
	adds r0, r2
	lsls r0, 2
	adds r0, r7
	ldr r0, [r0]
	str r0, [r1]
	str r4, [r1, 0x4]
_0812DF78:
	ldr r0, _0812DFC8 @ =gUnknown_203B0FC
	ldr r0, [r0]
	adds r0, 0xC
	adds r0, r4
	strb r5, [r0]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
_0812DF88:
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0xF
	bls _0812DF00
	ldr r0, _0812DFC0 @ =gUnknown_203B100
	ldr r1, [r0]
	lsls r0, r4, 3
	adds r0, r1
	ldr r1, _0812DFCC @ =gUnknown_84161C1
	str r1, [r0]
	str r4, [r0, 0x4]
	ldr r0, _0812DFC8 @ =gUnknown_203B0FC
	ldr r0, [r0]
	adds r0, 0xC
	adds r0, r4
	movs r1, 0xFF
	strb r1, [r0]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _0812DFD0 @ =gUnknown_3005EB0
	strh r4, [r1, 0xC]
	cmp r4, 0x4
	bhi _0812DFD4
	strh r4, [r1, 0xE]
	b _0812DFD8
	.align 2, 0
_0812DFC0: .4byte gUnknown_203B100
_0812DFC4: .4byte 0xffff0200
_0812DFC8: .4byte gUnknown_203B0FC
_0812DFCC: .4byte gUnknown_84161C1
_0812DFD0: .4byte gUnknown_3005EB0
_0812DFD4:
	movs r0, 0x5
	strh r0, [r1, 0xE]
_0812DFD8:
	adds r0, r4, 0
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_812DEF0

	thumb_func_start sub_812DFE4
sub_812DFE4: @ 812DFE4
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	bl PutWindowTilemap
	adds r0, r4, 0
	movs r1, 0x3
	bl CopyWindowToVram
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_812DFE4

	thumb_func_start sub_812E000
sub_812E000: @ 812E000
	push {r4,lr}
	sub sp, 0x10
	mov r1, sp
	ldr r0, _0812E040 @ =gUnknown_845FD44
	ldm r0!, {r2-r4}
	stm r1!, {r2-r4}
	ldr r0, [r0]
	str r0, [r1]
	ldr r4, _0812E044 @ =gUnknown_203B0FC
	ldr r2, [r4]
	ldrb r0, [r2, 0x7]
	lsrs r0, 2
	cmp r0, 0x5
	bls _0812E036
	mov r1, sp
	movs r0, 0
	strh r0, [r1, 0x6]
	ldrb r0, [r2, 0x7]
	lsrs r0, 2
	subs r0, 0x5
	strh r0, [r1, 0x8]
	adds r1, r2, 0x4
	mov r0, sp
	bl AddScrollIndicatorArrowPair
	ldr r1, [r4]
	strb r0, [r1, 0x6]
_0812E036:
	add sp, 0x10
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812E040: .4byte gUnknown_845FD44
_0812E044: .4byte gUnknown_203B0FC
	thumb_func_end sub_812E000

	thumb_func_start sub_812E048
sub_812E048: @ 812E048
	push {lr}
	ldr r0, _0812E060 @ =gUnknown_203B0FC
	ldr r1, [r0]
	ldrb r0, [r1, 0x7]
	lsrs r0, 2
	cmp r0, 0x5
	bls _0812E05C
	ldrb r0, [r1, 0x6]
	bl RemoveScrollIndicatorArrowPair
_0812E05C:
	pop {r0}
	bx r0
	.align 2, 0
_0812E060: .4byte gUnknown_203B0FC
	thumb_func_end sub_812E048

	thumb_func_start sub_812E064
sub_812E064: @ 812E064
	push {r4,lr}
	sub sp, 0x4
	ldr r0, _0812E090 @ =gUnknown_203B0FC
	ldr r0, [r0]
	ldrb r0, [r0, 0x8]
	mov r4, sp
	adds r4, 0x2
	mov r1, sp
	adds r2, r4, 0
	bl get_coro_args_x18_x1A
	mov r1, sp
	ldrh r0, [r4]
	ldrh r1, [r1]
	adds r0, r1
	lsls r0, 16
	lsrs r0, 16
	add sp, 0x4
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0812E090: .4byte gUnknown_203B0FC
	thumb_func_end sub_812E064

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
