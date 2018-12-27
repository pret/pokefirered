	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_810EB6C
sub_810EB6C: @ 810EB6C
	push {r4,lr}
	lsls r0, 24
	ldr r4, _0810EB84 @ =gUnknown_203ADE0
	lsrs r0, 21
	adds r0, 0x8
	bl Alloc
	str r0, [r4]
	cmp r0, 0
	bne _0810EB88
	movs r0, 0
	b _0810EBA2
	.align 2, 0
_0810EB84: .4byte gUnknown_203ADE0
_0810EB88:
	movs r2, 0
	ldr r4, _0810EBA8 @ =gUnknown_203ADDC
	movs r3, 0xFF
_0810EB8E:
	adds r0, r2, r4
	ldrb r1, [r0]
	orrs r1, r3
	strb r1, [r0]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x2
	bls _0810EB8E
	movs r0, 0x1
_0810EBA2:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0810EBA8: .4byte gUnknown_203ADDC
	thumb_func_end sub_810EB6C

	thumb_func_start sub_810EBAC
sub_810EBAC: @ 810EBAC
	push {r4,lr}
	lsls r0, 24
	lsrs r1, r0, 24
	ldr r0, _0810EBD8 @ =gUnknown_203ADDC
	adds r4, r1, r0
	ldrb r0, [r4]
	cmp r0, 0xFF
	bne _0810EBD0
	lsls r0, r1, 3
	ldr r1, _0810EBDC @ =gUnknown_8453FE8
	adds r0, r1
	bl AddWindow
	strb r0, [r4]
	ldrb r0, [r4]
	movs r1, 0
	bl sub_80F7750
_0810EBD0:
	ldrb r0, [r4]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0810EBD8: .4byte gUnknown_203ADDC
_0810EBDC: .4byte gUnknown_8453FE8
	thumb_func_end sub_810EBAC

	thumb_func_start sub_810EBE0
sub_810EBE0: @ 810EBE0
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _0810EC0C @ =gUnknown_203ADDC
	adds r4, r0
	ldrb r0, [r4]
	movs r1, 0
	bl sub_810F4D8
	ldrb r0, [r4]
	bl ClearWindowTilemap
	ldrb r0, [r4]
	bl RemoveWindow
	movs r0, 0xFF
	strb r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810EC0C: .4byte gUnknown_203ADDC
	thumb_func_end sub_810EBE0

	thumb_func_start sub_810EC10
sub_810EC10: @ 810EC10
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0810EC1C @ =gUnknown_203ADDC
	adds r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_0810EC1C: .4byte gUnknown_203ADDC
	thumb_func_end sub_810EC10

	thumb_func_start sub_810EC20
sub_810EC20: @ 810EC20
	push {r4,r5,lr}
	sub sp, 0x34
	adds r3, r1, 0
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r2, 24
	lsrs r5, r2, 24
	movs r0, 0x2
	negs r0, r0
	cmp r3, r0
	beq _0810EC82
	ldr r0, _0810EC8C @ =gSaveBlock1Ptr
	lsls r1, r3, 3
	adds r1, r3
	lsls r1, 2
	ldr r0, [r0]
	adds r1, r0
	ldr r0, _0810EC90 @ =0x00002dba
	adds r1, r0
	add r0, sp, 0x14
	bl StringCopy
	add r0, sp, 0x14
	bl StringLength
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x5
	bhi _0810EC62
	add r0, sp, 0x14
	movs r1, 0x1
	bl ConvertInternationalString
_0810EC62:
	movs r0, 0
	str r0, [sp]
	str r0, [sp, 0x4]
	ldr r0, _0810EC94 @ =gUnknown_8454000
	str r0, [sp, 0x8]
	movs r0, 0x1
	negs r0, r0
	str r0, [sp, 0xC]
	add r0, sp, 0x14
	str r0, [sp, 0x10]
	adds r0, r4, 0
	movs r1, 0x2
	movs r2, 0x8
	adds r3, r5, 0
	bl AddTextPrinterParametrized2
_0810EC82:
	add sp, 0x34
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810EC8C: .4byte gSaveBlock1Ptr
_0810EC90: .4byte 0x00002dba
_0810EC94: .4byte gUnknown_8454000
	thumb_func_end sub_810EC20

	thumb_func_start sub_810EC98
sub_810EC98: @ 810EC98
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r6, r0, 0
	movs r3, 0
	ldr r7, _0810ED50 @ =gUnknown_203ADE0
	ldr r0, _0810ED54 @ =gFameCheckerText_Cancel
	mov r12, r0
	ldr r5, _0810ED58 @ =gUnknown_3005E70
	ldr r1, _0810ED5C @ =gUnknown_203ADDC
	mov r8, r1
	ldrb r0, [r6, 0x5]
	cmp r3, r0
	bcs _0810ECCE
	adds r2, r7, 0
	ldr r4, _0810ED60 @ =gUnknown_8454003
_0810ECB8:
	ldr r1, [r2]
	lsls r0, r3, 3
	adds r0, r1
	str r4, [r0]
	str r3, [r0, 0x4]
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	ldrb r1, [r6, 0x5]
	cmp r3, r1
	bcc _0810ECB8
_0810ECCE:
	ldr r2, [r7]
	lsls r0, r3, 3
	adds r0, r2
	mov r1, r12
	str r1, [r0]
	movs r1, 0x2
	negs r1, r1
	str r1, [r0, 0x4]
	str r2, [r5]
	ldrb r0, [r6, 0x5]
	adds r0, 0x1
	movs r4, 0
	strh r0, [r5, 0xC]
	mov r1, r8
	ldrb r0, [r1, 0x1]
	strb r0, [r5, 0x10]
	strb r4, [r5, 0x11]
	movs r0, 0x2
	movs r1, 0
	bl GetMenuCursorDimensionByFont
	strb r0, [r5, 0x12]
	strb r4, [r5, 0x13]
	ldrb r0, [r5, 0x16]
	movs r2, 0x8
	negs r2, r2
	ands r2, r0
	movs r0, 0x39
	negs r0, r0
	ands r2, r0
	movs r0, 0x10
	orrs r2, r0
	movs r0, 0x8
	strh r0, [r5, 0xE]
	ldrb r0, [r5, 0x17]
	movs r1, 0x40
	negs r1, r1
	ands r1, r0
	movs r0, 0x2
	orrs r1, r0
	movs r0, 0x2A
	strb r0, [r5, 0x14]
	movs r0, 0x31
	strb r0, [r5, 0x15]
	ldr r0, _0810ED64 @ =sub_810ED6C
	str r0, [r5, 0x4]
	ldr r0, _0810ED68 @ =sub_810EC20
	str r0, [r5, 0x8]
	movs r0, 0x3F
	ands r1, r0
	strb r1, [r5, 0x17]
	ands r2, r0
	strb r2, [r5, 0x16]
	ldrh r1, [r6, 0x2]
	ldrh r2, [r6]
	adds r0, r5, 0
	bl ListMenuInit
	lsls r0, 24
	lsrs r0, 24
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0810ED50: .4byte gUnknown_203ADE0
_0810ED54: .4byte gFameCheckerText_Cancel
_0810ED58: .4byte gUnknown_3005E70
_0810ED5C: .4byte gUnknown_203ADDC
_0810ED60: .4byte gUnknown_8454003
_0810ED64: .4byte sub_810ED6C
_0810ED68: .4byte sub_810EC20
	thumb_func_end sub_810EC98

	thumb_func_start sub_810ED6C
sub_810ED6C: @ 810ED6C
	push {lr}
	lsls r1, 24
	lsrs r1, 24
	cmp r1, 0x1
	beq _0810ED7C
	movs r0, 0x5
	bl PlaySE
_0810ED7C:
	pop {r0}
	bx r0
	thumb_func_end sub_810ED6C

	thumb_func_start sub_810ED80
sub_810ED80: @ 810ED80
	push {r4,lr}
	sub sp, 0x10
	adds r4, r0, 0
	ldrb r0, [r4, 0x5]
	ldrb r1, [r4, 0x4]
	subs r0, r1
	adds r0, 0x1
	str r0, [sp]
	movs r0, 0x6E
	str r0, [sp, 0x4]
	str r0, [sp, 0x8]
	adds r0, r4, 0x2
	str r0, [sp, 0xC]
	movs r0, 0x2
	movs r1, 0xC2
	movs r2, 0xC
	movs r3, 0x94
	bl AddScrollIndicatorArrowPairParametrized
	strb r0, [r4, 0xA]
	add sp, 0x10
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_810ED80

	thumb_func_start sub_810EDB0
sub_810EDB0: @ 810EDB0
	push {lr}
	ldr r0, _0810EDC0 @ =gUnknown_203ADE0
	ldr r0, [r0]
	bl Free
	pop {r0}
	bx r0
	.align 2, 0
_0810EDC0: .4byte gUnknown_203ADE0
	thumb_func_end sub_810EDB0

	.align 2, 0 @ Don't pad with nop.
