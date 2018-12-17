	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_809C954
sub_809C954: @ 809C954
	push {lr}
	adds r1, r0, 0
	movs r0, 0x1
	movs r2, 0
	bl GetStringWidth
	adds r1, r0, 0
	adds r0, r1, 0x7
	cmp r0, 0
	bge _0809C96A
	adds r0, 0x7
_0809C96A:
	lsls r0, 13
	lsrs r0, 16
	pop {r1}
	bx r1
	thumb_func_end sub_809C954

	thumb_func_start sub_809C974
sub_809C974: @ 809C974
	push {r4-r7,lr}
	adds r7, r0, 0
	lsls r4, r1, 24
	lsrs r4, 24
	ldr r0, [r7]
	bl sub_809C954
	lsls r0, 24
	lsrs r6, r0, 24
	movs r5, 0x1
	cmp r5, r4
	bcs _0809C9AA
_0809C98C:
	lsls r0, r5, 3
	adds r0, r7
	ldr r0, [r0]
	bl sub_809C954
	lsls r0, 24
	lsrs r0, 24
	cmp r6, r0
	bcs _0809C9A0
	adds r6, r0, 0
_0809C9A0:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, r4
	bcc _0809C98C
_0809C9AA:
	adds r0, r6, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_809C974

	thumb_func_start ScriptMenu_Multichoice
ScriptMenu_Multichoice: @ 809C9B4
	push {r4-r7,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r7, r0, 24
	lsls r1, 24
	lsrs r6, r1, 24
	lsls r2, 24
	lsrs r5, r2, 24
	lsls r3, 24
	lsrs r4, r3, 24
	ldr r0, _0809C9F0 @ =sub_809CC98
	bl FuncIsActiveTask
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0809C9F8
	ldr r0, _0809C9F4 @ =gSpecialVar_Result
	movs r1, 0xFF
	strh r1, [r0]
	movs r0, 0
	str r0, [sp]
	adds r0, r7, 0
	adds r1, r6, 0
	adds r2, r5, 0
	adds r3, r4, 0
	bl sub_809CA64
	movs r0, 0x1
	b _0809C9FA
	.align 2, 0
_0809C9F0: .4byte sub_809CC98
_0809C9F4: .4byte gSpecialVar_Result
_0809C9F8:
	movs r0, 0
_0809C9FA:
	add sp, 0x4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end ScriptMenu_Multichoice

	thumb_func_start ScriptMenu_MultichoiceWithDefault
ScriptMenu_MultichoiceWithDefault: @ 809CA04
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	ldr r4, [sp, 0x1C]
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r1, 24
	lsrs r7, r1, 24
	lsls r2, 24
	lsrs r6, r2, 24
	lsls r3, 24
	lsrs r5, r3, 24
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _0809CA4C @ =sub_809CC98
	bl FuncIsActiveTask
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0809CA54
	ldr r1, _0809CA50 @ =gSpecialVar_Result
	movs r0, 0xFF
	strh r0, [r1]
	str r4, [sp]
	mov r0, r8
	adds r1, r7, 0
	adds r2, r6, 0
	adds r3, r5, 0
	bl sub_809CA64
	movs r0, 0x1
	b _0809CA56
	.align 2, 0
_0809CA4C: .4byte sub_809CC98
_0809CA50: .4byte gSpecialVar_Result
_0809CA54:
	movs r0, 0
_0809CA56:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end ScriptMenu_MultichoiceWithDefault

	thumb_func_start sub_809CA64
sub_809CA64: @ 809CA64
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x20
	ldr r4, [sp, 0x40]
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	lsls r1, 24
	lsrs r1, 24
	str r1, [sp, 0x14]
	lsls r2, 24
	lsrs r2, 24
	mov r10, r2
	lsls r3, 24
	lsrs r3, 24
	str r3, [sp, 0x18]
	lsls r4, 24
	lsrs r4, 24
	str r4, [sp, 0x1C]
	movs r0, 0x2
	ands r0, r3
	cmp r0, 0
	bne _0809CAA6
	ldr r0, _0809CB54 @ =sub_809D6D4
	bl sub_81119D4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0809CBA2
_0809CAA6:
	movs r0, 0x1
	ldr r1, [sp, 0x18]
	ands r1, r0
	str r1, [sp, 0x18]
	ldr r1, _0809CB58 @ =gUnknown_83E04B0
	mov r2, r10
	lsls r0, r2, 3
	adds r0, r1
	ldrb r7, [r0, 0x4]
	ldr r0, [r0]
	mov r8, r0
	movs r6, 0
	cmp r6, r7
	bge _0809CADE
	mov r5, r8
	adds r4, r7, 0
_0809CAC6:
	ldr r1, [r5]
	movs r0, 0x2
	movs r2, 0
	bl GetStringWidth
	cmp r0, r6
	ble _0809CAD6
	adds r6, r0, 0
_0809CAD6:
	adds r5, 0x8
	subs r4, 0x1
	cmp r4, 0
	bne _0809CAC6
_0809CADE:
	adds r0, r6, 0
	adds r0, 0x9
	cmp r0, 0
	bge _0809CAE8
	adds r0, 0x7
_0809CAE8:
	asrs r0, 3
	adds r0, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	mov r1, r9
	adds r0, r1, r5
	cmp r0, 0x1C
	ble _0809CB02
	movs r0, 0x1C
	subs r0, r5
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
_0809CB02:
	adds r0, r7, 0
	bl sub_809CBB4
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	mov r0, r9
	ldr r1, [sp, 0x14]
	adds r2, r5, 0
	bl CreateWindowFromRect
	lsls r0, 24
	lsrs r5, r0, 24
	adds r0, r5, 0
	movs r1, 0
	bl sub_80F7750
	mov r2, r10
	cmp r2, 0x1E
	beq _0809CB32
	cmp r2, 0xD
	beq _0809CB32
	cmp r2, 0x29
	bne _0809CB5C
_0809CB32:
	movs r0, 0xE
	str r0, [sp]
	str r7, [sp, 0x4]
	mov r0, r8
	str r0, [sp, 0x8]
	movs r0, 0
	str r0, [sp, 0xC]
	movs r0, 0x2
	str r0, [sp, 0x10]
	adds r0, r5, 0
	movs r1, 0x2
	movs r2, 0x8
	movs r3, 0x2
	bl sub_810FBE8
	b _0809CB7A
	.align 2, 0
_0809CB54: .4byte sub_809D6D4
_0809CB58: .4byte gUnknown_83E04B0
_0809CB5C:
	movs r0, 0xE
	str r0, [sp]
	str r7, [sp, 0x4]
	mov r1, r8
	str r1, [sp, 0x8]
	movs r0, 0
	str r0, [sp, 0xC]
	movs r0, 0x2
	str r0, [sp, 0x10]
	adds r0, r5, 0
	movs r1, 0x2
	movs r2, 0x8
	movs r3, 0x2
	bl sub_810FBE8
_0809CB7A:
	movs r0, 0xE
	str r0, [sp]
	str r7, [sp, 0x4]
	ldr r2, [sp, 0x1C]
	str r2, [sp, 0x8]
	adds r0, r5, 0
	movs r1, 0x2
	movs r2, 0
	movs r3, 0x2
	bl sub_810F7D8
	ldr r0, [sp, 0x18]
	adds r1, r7, 0
	adds r2, r5, 0
	mov r3, r10
	bl sub_809CC18
	movs r0, 0
	bl schedule_bg_copy_tilemap_to_vram
_0809CBA2:
	add sp, 0x20
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_809CA64

	thumb_func_start sub_809CBB4
sub_809CBB4: @ 809CBB4
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x8
	bhi _0809CC10
	lsls r0, 2
	ldr r1, _0809CBC8 @ =_0809CBCC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0809CBC8: .4byte _0809CBCC
	.align 2, 0
_0809CBCC:
	.4byte _0809CC10
	.4byte _0809CBF0
	.4byte _0809CBF4
	.4byte _0809CBF8
	.4byte _0809CBFC
	.4byte _0809CC00
	.4byte _0809CC04
	.4byte _0809CC08
	.4byte _0809CC0C
_0809CBF0:
	movs r0, 0x2
	b _0809CC12
_0809CBF4:
	movs r0, 0x4
	b _0809CC12
_0809CBF8:
	movs r0, 0x6
	b _0809CC12
_0809CBFC:
	movs r0, 0x7
	b _0809CC12
_0809CC00:
	movs r0, 0x9
	b _0809CC12
_0809CC04:
	movs r0, 0xB
	b _0809CC12
_0809CC08:
	movs r0, 0xD
	b _0809CC12
_0809CC0C:
	movs r0, 0xE
	b _0809CC12
_0809CC10:
	movs r0, 0x1
_0809CC12:
	pop {r1}
	bx r1
	thumb_func_end sub_809CBB4

	thumb_func_start sub_809CC18
sub_809CC18: @ 809CC18
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 24
	lsrs r5, r1, 24
	lsls r2, 24
	lsrs r7, r2, 24
	lsls r3, 24
	lsrs r4, r3, 24
	cmp r4, 0x27
	beq _0809CC36
	cmp r4, 0x2F
	beq _0809CC36
	cmp r4, 0x32
	bne _0809CC40
_0809CC36:
	ldr r1, _0809CC3C @ =gUnknown_2039988
	movs r0, 0xC
	b _0809CC44
	.align 2, 0
_0809CC3C: .4byte gUnknown_2039988
_0809CC40:
	ldr r1, _0809CC68 @ =gUnknown_2039988
	movs r0, 0
_0809CC44:
	strb r0, [r1]
	ldr r0, _0809CC6C @ =sub_809CC98
	movs r1, 0x50
	bl CreateTask
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r1, _0809CC70 @ =gTasks
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r1, r0, r1
	strh r6, [r1, 0x10]
	cmp r5, 0x3
	bls _0809CC74
	movs r0, 0x1
	b _0809CC76
	.align 2, 0
_0809CC68: .4byte gUnknown_2039988
_0809CC6C: .4byte sub_809CC98
_0809CC70: .4byte gTasks
_0809CC74:
	movs r0, 0
_0809CC76:
	strh r0, [r1, 0x12]
	ldr r1, _0809CC94 @ =gTasks
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r0, r1
	strh r7, [r0, 0x14]
	strh r4, [r0, 0x16]
	adds r0, r4, 0
	bl sub_809CD48
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809CC94: .4byte gTasks
	thumb_func_end sub_809CC18

	thumb_func_start sub_809CC98
sub_809CC98: @ 809CC98
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	ldr r1, _0809CCC4 @ =gTasks+0x8
	adds r5, r0, r1
	ldr r0, _0809CCC8 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0809CD3C
	ldr r1, _0809CCCC @ =gUnknown_2039988
	ldrb r0, [r1]
	cmp r0, 0
	beq _0809CCD0
	subs r0, 0x1
	strb r0, [r1]
	b _0809CD3C
	.align 2, 0
_0809CCC4: .4byte gTasks+0x8
_0809CCC8: .4byte gPaletteFade
_0809CCCC: .4byte gUnknown_2039988
_0809CCD0:
	movs r1, 0xA
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _0809CCDE
	bl ProcessMenuInputNoWrapAround
	b _0809CCE2
_0809CCDE:
	bl ProcessMenuInput
_0809CCE2:
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0809CD20 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0xC0
	ands r0, r1
	cmp r0, 0
	beq _0809CCF8
	ldrb r0, [r5, 0xE]
	bl sub_809CD48
_0809CCF8:
	lsls r0, r4, 24
	asrs r1, r0, 24
	movs r0, 0x2
	negs r0, r0
	cmp r1, r0
	beq _0809CD3C
	adds r0, 0x1
	cmp r1, r0
	bne _0809CD28
	movs r1, 0x8
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _0809CD3C
	movs r0, 0x5
	bl PlaySE
	ldr r1, _0809CD24 @ =gSpecialVar_Result
	movs r0, 0x7F
	strh r0, [r1]
	b _0809CD2C
	.align 2, 0
_0809CD20: .4byte gMain
_0809CD24: .4byte gSpecialVar_Result
_0809CD28:
	ldr r0, _0809CD44 @ =gSpecialVar_Result
	strh r1, [r0]
_0809CD2C:
	ldrb r0, [r5, 0xC]
	bl sub_809D6B0
	adds r0, r6, 0
	bl DestroyTask
	bl EnableBothScriptContexts
_0809CD3C:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809CD44: .4byte gSpecialVar_Result
	thumb_func_end sub_809CC98

	thumb_func_start sub_809CD48
sub_809CD48: @ 809CD48
	push {r4,lr}
	sub sp, 0x10
	lsls r0, 24
	lsrs r0, 24
	adds r1, r0, 0
	cmp r0, 0x2F
	beq _0809CD78
	cmp r0, 0x2F
	bgt _0809CD60
	cmp r0, 0x27
	beq _0809CD66
	b _0809CDE0
_0809CD60:
	cmp r1, 0x32
	beq _0809CDB0
	b _0809CDE0
_0809CD66:
	movs r0, 0
	movs r1, 0x11
	bl FillWindowPixelBuffer
	ldr r4, _0809CD74 @ =gUnknown_83E072C
	b _0809CD82
	.align 2, 0
_0809CD74: .4byte gUnknown_83E072C
_0809CD78:
	movs r0, 0
	movs r1, 0x11
	bl FillWindowPixelBuffer
	ldr r4, _0809CDAC @ =gUnknown_83E0738
_0809CD82:
	bl GetMenuCursorPos
	lsls r0, 24
	lsrs r0, 22
	adds r0, r4
	ldr r2, [r0]
	movs r0, 0
	str r0, [sp]
	movs r0, 0x2
	str r0, [sp, 0x4]
	movs r0, 0x1
	str r0, [sp, 0x8]
	movs r0, 0x3
	str r0, [sp, 0xC]
	movs r0, 0
	movs r1, 0x2
	movs r3, 0
	bl AddTextPrinterParametrized
	b _0809CDE0
	.align 2, 0
_0809CDAC: .4byte gUnknown_83E0738
_0809CDB0:
	movs r0, 0
	movs r1, 0x11
	bl FillWindowPixelBuffer
	ldr r4, _0809CDE8 @ =gUnknown_83E0748
	bl GetMenuCursorPos
	lsls r0, 24
	lsrs r0, 22
	adds r0, r4
	ldr r2, [r0]
	movs r0, 0
	str r0, [sp]
	movs r0, 0x2
	str r0, [sp, 0x4]
	movs r0, 0x1
	str r0, [sp, 0x8]
	movs r0, 0x3
	str r0, [sp, 0xC]
	movs r0, 0
	movs r1, 0x2
	movs r3, 0
	bl AddTextPrinterParametrized
_0809CDE0:
	add sp, 0x10
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809CDE8: .4byte gUnknown_83E0748
	thumb_func_end sub_809CD48

	thumb_func_start sub_809CDEC
sub_809CDEC: @ 809CDEC
	push {r4,lr}
	ldr r4, _0809CE04 @ =task_yes_no_maybe
	adds r0, r4, 0
	bl FuncIsActiveTask
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0809CE08
	movs r0, 0
	b _0809CE28
	.align 2, 0
_0809CE04: .4byte task_yes_no_maybe
_0809CE08:
	ldr r1, _0809CE30 @ =gSpecialVar_Result
	movs r0, 0xFF
	strh r0, [r1]
	ldr r0, _0809CE34 @ =sub_809D6D4
	bl sub_81119D4
	lsls r0, 24
	cmp r0, 0
	bne _0809CE26
	bl sub_80F7858
	adds r0, r4, 0
	movs r1, 0x50
	bl CreateTask
_0809CE26:
	movs r0, 0x1
_0809CE28:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0809CE30: .4byte gSpecialVar_Result
_0809CE34: .4byte sub_809D6D4
	thumb_func_end sub_809CDEC

	thumb_func_start sub_809CE38
sub_809CE38: @ 809CE38
	push {lr}
	ldr r0, _0809CE48 @ =gSpecialVar_Result
	ldrh r0, [r0]
	cmp r0, 0xFF
	beq _0809CE4C
	movs r0, 0x1
	b _0809CE4E
	.align 2, 0
_0809CE48: .4byte gSpecialVar_Result
_0809CE4C:
	movs r0, 0
_0809CE4E:
	pop {r1}
	bx r1
	thumb_func_end sub_809CE38

	thumb_func_start task_yes_no_maybe
task_yes_no_maybe: @ 809CE54
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _0809CE74 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r1, r0, r1
	ldrh r2, [r1, 0xC]
	movs r3, 0xC
	ldrsh r0, [r1, r3]
	cmp r0, 0x4
	bgt _0809CE78
	adds r0, r2, 0x1
	strh r0, [r1, 0xC]
	b _0809CEBC
	.align 2, 0
_0809CE74: .4byte gTasks
_0809CE78:
	bl ProcessMenuInputNoWrap_
	lsls r0, 24
	asrs r1, r0, 24
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _0809CE9C
	cmp r1, r0
	bgt _0809CE94
	subs r0, 0x1
	cmp r1, r0
	beq _0809CEBC
	b _0809CEB2
_0809CE94:
	cmp r1, 0
	beq _0809CEAC
	cmp r1, 0x1
	bne _0809CEB2
_0809CE9C:
	movs r0, 0x5
	bl PlaySE
	ldr r1, _0809CEA8 @ =gSpecialVar_Result
	movs r0, 0
	b _0809CEB0
	.align 2, 0
_0809CEA8: .4byte gSpecialVar_Result
_0809CEAC:
	ldr r1, _0809CEC4 @ =gSpecialVar_Result
	movs r0, 0x1
_0809CEB0:
	strh r0, [r1]
_0809CEB2:
	adds r0, r4, 0
	bl DestroyTask
	bl EnableBothScriptContexts
_0809CEBC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809CEC4: .4byte gSpecialVar_Result
	thumb_func_end task_yes_no_maybe

	thumb_func_start sub_809CEC8
sub_809CEC8: @ 809CEC8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x18
	ldr r4, [sp, 0x38]
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x10]
	lsls r1, 24
	lsrs r1, 24
	str r1, [sp, 0x14]
	lsls r2, 24
	lsrs r5, r2, 24
	lsls r3, 24
	lsrs r3, 24
	mov r10, r3
	lsls r4, 24
	lsrs r7, r4, 24
	ldr r0, _0809CF04 @ =sub_809CFDC
	mov r9, r0
	bl FuncIsActiveTask
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0809CF08
	movs r0, 0
	b _0809CFBA
	.align 2, 0
_0809CF04: .4byte sub_809CFDC
_0809CF08:
	ldr r1, _0809CFCC @ =gSpecialVar_Result
	movs r0, 0xFF
	strh r0, [r1]
	ldr r0, _0809CFD0 @ =sub_809D6D4
	bl sub_81119D4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0809CFB8
	ldr r1, _0809CFD4 @ =gUnknown_83E04B0
	lsls r0, r5, 3
	adds r0, r1
	ldr r1, [r0]
	mov r8, r1
	ldrb r4, [r0, 0x4]
	mov r0, r8
	adds r1, r4, 0
	bl sub_809C974
	adds r5, r0, 0
	adds r5, 0x1
	lsls r5, 24
	lsrs r5, 24
	adds r0, r4, 0
	adds r1, r7, 0
	bl __udivsi3
	adds r6, r0, 0
	lsls r6, 24
	lsrs r6, 24
	mov r0, r9
	movs r1, 0x50
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0809CFD8 @ =gTasks
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	adds r4, r1
	movs r0, 0
	mov r9, r0
	mov r1, r10
	strh r1, [r4, 0x10]
	adds r2, r5, 0
	muls r2, r7
	lsls r2, 24
	lsrs r2, 24
	lsls r3, r6, 25
	lsrs r3, 24
	ldr r0, [sp, 0x10]
	ldr r1, [sp, 0x14]
	bl CreateWindowFromRect
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x14]
	movs r1, 0
	bl sub_80F7750
	ldrb r0, [r4, 0x14]
	lsls r5, 27
	lsrs r5, 24
	str r7, [sp]
	str r6, [sp, 0x4]
	mov r1, r8
	str r1, [sp, 0x8]
	movs r1, 0x1
	adds r2, r5, 0
	movs r3, 0x10
	bl sub_8110104
	ldrb r0, [r4, 0x14]
	str r5, [sp]
	str r7, [sp, 0x4]
	str r6, [sp, 0x8]
	mov r1, r9
	str r1, [sp, 0xC]
	movs r1, 0x1
	movs r2, 0
	movs r3, 0x1
	bl sub_811030C
	movs r0, 0
	bl schedule_bg_copy_tilemap_to_vram
_0809CFB8:
	movs r0, 0x1
_0809CFBA:
	add sp, 0x18
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0809CFCC: .4byte gSpecialVar_Result
_0809CFD0: .4byte sub_809D6D4
_0809CFD4: .4byte gUnknown_83E04B0
_0809CFD8: .4byte gTasks
	thumb_func_end sub_809CEC8

	thumb_func_start sub_809CFDC
sub_809CFDC: @ 809CFDC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _0809D018 @ =gTasks+0x8
	adds r5, r0, r1
	bl sub_8110650
	lsls r0, 24
	asrs r1, r0, 24
	movs r0, 0x2
	negs r0, r0
	cmp r1, r0
	beq _0809D034
	adds r0, 0x1
	cmp r1, r0
	bne _0809D020
	movs r1, 0x8
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _0809D034
	movs r0, 0x5
	bl PlaySE
	ldr r1, _0809D01C @ =gSpecialVar_Result
	movs r0, 0x7F
	strh r0, [r1]
	b _0809D024
	.align 2, 0
_0809D018: .4byte gTasks+0x8
_0809D01C: .4byte gSpecialVar_Result
_0809D020:
	ldr r0, _0809D03C @ =gSpecialVar_Result
	strh r1, [r0]
_0809D024:
	ldrb r0, [r5, 0xC]
	bl sub_809D6B0
	adds r0, r4, 0
	bl DestroyTask
	bl EnableBothScriptContexts
_0809D034:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809D03C: .4byte gSpecialVar_Result
	thumb_func_end sub_809CFDC

	thumb_func_start sp109_CreatePCMenu
sp109_CreatePCMenu: @ 809D040
	push {lr}
	ldr r0, _0809D060 @ =sub_809CC98
	bl FuncIsActiveTask
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0809D068
	ldr r1, _0809D064 @ =gSpecialVar_Result
	movs r0, 0xFF
	strh r0, [r1]
	bl sub_809D070
	movs r0, 0x1
	b _0809D06A
	.align 2, 0
_0809D060: .4byte sub_809CC98
_0809D064: .4byte gSpecialVar_Result
_0809D068:
	movs r0, 0
_0809D06A:
	pop {r1}
	bx r1
	thumb_func_end sp109_CreatePCMenu

	thumb_func_start sub_809D070
sub_809D070: @ 809D070
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0xC
	movs r0, 0x2
	movs r1, 0
	bl GetMenuCursorDimensionByFont
	lsls r0, 24
	lsrs r7, r0, 24
	movs r0, 0x2
	movs r1, 0x1
	bl GetFontAttribute
	ldr r0, _0809D11C @ =gUnknown_8417BB6
	bl sub_809C954
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0xA
	bgt _0809D0A0
	cmp r0, 0x9
	bge _0809D0AE
_0809D0A0:
	ldr r0, _0809D120 @ =0x00000829
	bl FlagGet
	lsls r0, 24
	movs r4, 0xD
	cmp r0, 0
	beq _0809D0B0
_0809D0AE:
	movs r4, 0xE
_0809D0B0:
	ldr r0, _0809D124 @ =0x0000082c
	bl FlagGet
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0
	beq _0809D134
	movs r0, 0x5
	mov r9, r0
	movs r0, 0
	movs r1, 0
	adds r2, r4, 0
	movs r3, 0xA
	bl CreateWindowFromRect
	lsls r0, 24
	lsrs r6, r0, 24
	adds r0, r6, 0
	movs r1, 0
	bl sub_80F7750
	ldr r2, _0809D128 @ =gUnknown_8417BD3
	movs r0, 0x22
	str r0, [sp]
	movs r5, 0xFF
	str r5, [sp, 0x4]
	movs r4, 0
	str r4, [sp, 0x8]
	adds r0, r6, 0
	movs r1, 0x2
	adds r3, r7, 0
	bl AddTextPrinterParameterized
	ldr r2, _0809D12C @ =gUnknown_8417BBE
	movs r0, 0x32
	str r0, [sp]
	str r5, [sp, 0x4]
	str r4, [sp, 0x8]
	adds r0, r6, 0
	movs r1, 0x2
	adds r3, r7, 0
	bl AddTextPrinterParameterized
	ldr r2, _0809D130 @ =gUnknown_8417BCB
	movs r0, 0x42
	str r0, [sp]
	str r5, [sp, 0x4]
	str r4, [sp, 0x8]
	adds r0, r6, 0
	movs r1, 0x2
	adds r3, r7, 0
	bl AddTextPrinterParameterized
	b _0809D1A8
	.align 2, 0
_0809D11C: .4byte gUnknown_8417BB6
_0809D120: .4byte 0x00000829
_0809D124: .4byte 0x0000082c
_0809D128: .4byte gUnknown_8417BD3
_0809D12C: .4byte gUnknown_8417BBE
_0809D130: .4byte gUnknown_8417BCB
_0809D134:
	ldr r1, _0809D1D0 @ =0x00000829
	mov r8, r1
	mov r0, r8
	bl FlagGet
	lsls r0, 24
	movs r1, 0x3
	mov r9, r1
	cmp r0, 0
	beq _0809D14C
	movs r0, 0x4
	mov r9, r0
_0809D14C:
	mov r1, r9
	lsls r3, r1, 1
	movs r0, 0
	movs r1, 0
	adds r2, r4, 0
	bl CreateWindowFromRect
	lsls r0, 24
	lsrs r6, r0, 24
	adds r0, r6, 0
	movs r1, 0
	bl sub_80F7750
	mov r0, r8
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _0809D188
	ldr r2, _0809D1D4 @ =gUnknown_8417BD3
	movs r0, 0x22
	str r0, [sp]
	movs r0, 0xFF
	str r0, [sp, 0x4]
	str r5, [sp, 0x8]
	adds r0, r6, 0
	movs r1, 0x2
	adds r3, r7, 0
	bl AddTextPrinterParameterized
_0809D188:
	ldr r2, _0809D1D8 @ =gUnknown_8417BCB
	mov r0, r9
	subs r0, 0x1
	lsls r0, 4
	adds r0, 0x2
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp]
	movs r0, 0xFF
	str r0, [sp, 0x4]
	str r5, [sp, 0x8]
	adds r0, r6, 0
	movs r1, 0x2
	adds r3, r7, 0
	bl AddTextPrinterParameterized
_0809D1A8:
	ldr r0, _0809D1DC @ =0x00000834
	bl FlagGet
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	beq _0809D1E4
	ldr r2, _0809D1E0 @ =gUnknown_8417BAC
	movs r0, 0x2
	str r0, [sp]
	movs r0, 0xFF
	str r0, [sp, 0x4]
	movs r0, 0
	str r0, [sp, 0x8]
	adds r0, r6, 0
	movs r1, 0x2
	adds r3, r7, 0
	bl AddTextPrinterParameterized
	b _0809D1FA
	.align 2, 0
_0809D1D0: .4byte 0x00000829
_0809D1D4: .4byte gUnknown_8417BD3
_0809D1D8: .4byte gUnknown_8417BCB
_0809D1DC: .4byte 0x00000834
_0809D1E0: .4byte gUnknown_8417BAC
_0809D1E4:
	ldr r2, _0809D248 @ =gUnknown_8417B9F
	movs r0, 0x2
	str r0, [sp]
	movs r0, 0xFF
	str r0, [sp, 0x4]
	str r1, [sp, 0x8]
	adds r0, r6, 0
	movs r1, 0x2
	adds r3, r7, 0
	bl AddTextPrinterParameterized
_0809D1FA:
	ldr r4, _0809D24C @ =gStringVar4
	ldr r1, _0809D250 @ =gUnknown_8417BB6
	adds r0, r4, 0
	bl StringExpandPlaceholders
	adds r0, r6, 0
	adds r1, r4, 0
	adds r2, r7, 0
	movs r3, 0x12
	bl sub_812E6DC
	movs r0, 0x10
	str r0, [sp]
	mov r0, r9
	str r0, [sp, 0x4]
	movs r0, 0
	str r0, [sp, 0x8]
	adds r0, r6, 0
	movs r1, 0x2
	movs r2, 0
	movs r3, 0x2
	bl sub_810F7D8
	movs r0, 0
	mov r1, r9
	adds r2, r6, 0
	movs r3, 0xFF
	bl sub_809CC18
	movs r0, 0
	bl schedule_bg_copy_tilemap_to_vram
	add sp, 0xC
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809D248: .4byte gUnknown_8417B9F
_0809D24C: .4byte gStringVar4
_0809D250: .4byte gUnknown_8417BB6
	thumb_func_end sub_809D070

	thumb_func_start sub_809D254
sub_809D254: @ 809D254
	push {lr}
	sub sp, 0x10
	movs r0, 0
	movs r1, 0x1
	bl sub_80F7768
	ldr r2, _0809D284 @ =gUnknown_81A508A
	movs r0, 0
	str r0, [sp]
	movs r0, 0x2
	str r0, [sp, 0x4]
	movs r0, 0x1
	str r0, [sp, 0x8]
	movs r0, 0x3
	str r0, [sp, 0xC]
	movs r0, 0
	movs r1, 0x2
	movs r3, 0
	bl AddTextPrinterParametrized
	add sp, 0x10
	pop {r0}
	bx r0
	.align 2, 0
_0809D284: .4byte gUnknown_81A508A
	thumb_func_end sub_809D254

	thumb_func_start sub_809D288
sub_809D288: @ 809D288
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _0809D2AC @ =gTasks
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _0809D2E8
	cmp r0, 0x1
	bgt _0809D2B0
	cmp r0, 0
	beq _0809D2CE
	b _0809D2E8
	.align 2, 0
_0809D2AC: .4byte gTasks
_0809D2B0:
	cmp r0, 0x2
	beq _0809D2BA
	cmp r0, 0x3
	beq _0809D2DC
	b _0809D2E8
_0809D2BA:
	movs r0, 0xC
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0809D2D8 @ =gSprites
	adds r0, r1
	ldrb r1, [r4, 0xC]
	bl sub_8083A5C
_0809D2CE:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _0809D2E8
	.align 2, 0
_0809D2D8: .4byte gSprites
_0809D2DC:
	ldrb r0, [r4, 0x12]
	bl sub_809D6B0
	adds r0, r5, 0
	bl DestroyTask
_0809D2E8:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_809D288

	thumb_func_start sub_809D2F0
sub_809D2F0: @ 809D2F0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	lsls r1, 24
	lsrs r7, r1, 24
	lsls r2, 24
	lsrs r6, r2, 24
	ldr r0, _0809D318 @ =sub_809D6D4
	bl sub_81119D4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0809D31C
	movs r0, 0x1
	b _0809D3C2
	.align 2, 0
_0809D318: .4byte sub_809D6D4
_0809D31C:
	ldr r4, _0809D3B0 @ =sub_809D288
	adds r0, r4, 0
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	bne _0809D3C0
	lsls r1, r7, 19
	movs r0, 0xA0
	lsls r0, 14
	adds r1, r0
	asrs r1, 16
	lsls r2, r6, 19
	adds r2, r0
	asrs r2, 16
	mov r0, r8
	movs r3, 0
	bl sub_8083970
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	adds r0, r4, 0
	movs r1, 0x50
	bl CreateTask
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r7, 0
	adds r1, r6, 0
	movs r2, 0x8
	movs r3, 0x8
	bl CreateWindowFromRect
	ldr r1, _0809D3B4 @ =gTasks
	lsls r3, r4, 2
	adds r3, r4
	lsls r3, 3
	adds r3, r1
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	strh r0, [r3, 0x12]
	strh r1, [r3, 0x8]
	mov r0, r8
	strh r0, [r3, 0xA]
	strh r5, [r3, 0xC]
	ldr r4, _0809D3B8 @ =gSprites
	lsls r1, r5, 4
	adds r1, r5
	lsls r1, 2
	adds r0, r4, 0
	adds r0, 0x1C
	adds r0, r1, r0
	ldr r2, _0809D3BC @ =SpriteCallbackDummy
	str r2, [r0]
	adds r1, r4
	ldrb r2, [r1, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	strb r0, [r1, 0x5]
	ldrb r0, [r3, 0x12]
	movs r1, 0x1
	bl sub_80F7750
	movs r0, 0
	bl schedule_bg_copy_tilemap_to_vram
	movs r0, 0x1
	b _0809D3C2
	.align 2, 0
_0809D3B0: .4byte sub_809D288
_0809D3B4: .4byte gTasks
_0809D3B8: .4byte gSprites
_0809D3BC: .4byte SpriteCallbackDummy
_0809D3C0:
	movs r0, 0
_0809D3C2:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_809D2F0

	thumb_func_start sub_809D3CC
sub_809D3CC: @ 809D3CC
	push {lr}
	ldr r0, _0809D3F0 @ =sub_809D288
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0xFF
	beq _0809D3FC
	ldr r0, _0809D3F4 @ =gTasks
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	ldr r0, _0809D3F8 @ =sub_809D404
	b _0809D3FE
	.align 2, 0
_0809D3F0: .4byte sub_809D288
_0809D3F4: .4byte gTasks
_0809D3F8: .4byte sub_809D404
_0809D3FC:
	movs r0, 0
_0809D3FE:
	pop {r1}
	bx r1
	thumb_func_end sub_809D3CC

	thumb_func_start sub_809D404
sub_809D404: @ 809D404
	push {lr}
	ldr r0, _0809D418 @ =sub_809D288
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	beq _0809D41C
	movs r0, 0
	b _0809D41E
	.align 2, 0
_0809D418: .4byte sub_809D288
_0809D41C:
	movs r0, 0x1
_0809D41E:
	pop {r1}
	bx r1
	thumb_func_end sub_809D404

	thumb_func_start sub_809D424
sub_809D424: @ 809D424
	push {r4,r5,lr}
	ldr r0, _0809D450 @ =sub_809D288
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0xFF
	beq _0809D48C
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _0809D454 @ =gTasks
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0
	blt _0809D48C
	cmp r0, 0x2
	ble _0809D458
	cmp r0, 0x3
	beq _0809D480
	b _0809D48C
	.align 2, 0
_0809D450: .4byte sub_809D288
_0809D454: .4byte gTasks
_0809D458:
	movs r0, 0xC
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0809D47C @ =gSprites
	adds r0, r1
	ldrb r1, [r4, 0xC]
	bl sub_8083A5C
	ldrb r0, [r4, 0x12]
	bl sub_809D6B0
	adds r0, r5, 0
	bl DestroyTask
	b _0809D48C
	.align 2, 0
_0809D47C: .4byte gSprites
_0809D480:
	ldrb r0, [r4, 0x12]
	bl sub_809D6B0
	adds r0, r5, 0
	bl DestroyTask
_0809D48C:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_809D424

	thumb_func_start sub_809D494
sub_809D494: @ 809D494
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _0809D4B8 @ =gTasks
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _0809D4FC
	cmp r0, 0x1
	bgt _0809D4BC
	cmp r0, 0
	beq _0809D4DE
	b _0809D4FC
	.align 2, 0
_0809D4B8: .4byte gTasks
_0809D4BC:
	cmp r0, 0x2
	beq _0809D4C6
	cmp r0, 0x3
	beq _0809D4F0
	b _0809D4FC
_0809D4C6:
	movs r0, 0xC
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0809D4E8 @ =gSprites
	adds r0, r1
	bl DestroySprite
	ldr r0, _0809D4EC @ =0x00001b58
	bl FreeSpriteTilesByTag
_0809D4DE:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _0809D4FC
	.align 2, 0
_0809D4E8: .4byte gSprites
_0809D4EC: .4byte 0x00001b58
_0809D4F0:
	ldrb r0, [r4, 0x12]
	bl sub_809D6B0
	adds r0, r5, 0
	bl DestroyTask
_0809D4FC:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_809D494

	thumb_func_start sub_809D504
sub_809D504: @ 809D504
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	ldr r0, _0809D544 @ =sub_809D6D4
	bl sub_81119D4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0809D5F2
	ldr r0, _0809D548 @ =sub_809D494
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	bne _0809D55C
	ldr r0, _0809D54C @ =gSpecialVar_0x8004
	ldrh r0, [r0]
	cmp r0, 0x8D
	bne _0809D558
	ldr r0, _0809D550 @ =gUnknown_83E17C0
	bl LoadSpriteSheets
	ldr r0, _0809D554 @ =gUnknown_83E17A0
	movs r1, 0xE8
	lsls r1, 1
	movs r2, 0x20
	bl LoadPalette
	b _0809D572
	.align 2, 0
_0809D544: .4byte sub_809D6D4
_0809D548: .4byte sub_809D494
_0809D54C: .4byte gSpecialVar_0x8004
_0809D550: .4byte gUnknown_83E17C0
_0809D554: .4byte gUnknown_83E17A0
_0809D558:
	cmp r0, 0x8E
	beq _0809D560
_0809D55C:
	movs r0, 0
	b _0809D5F4
_0809D560:
	ldr r0, _0809D600 @ =gUnknown_83E17D0
	bl LoadSpriteSheets
	ldr r0, _0809D604 @ =gUnknown_83E0F80
	movs r1, 0xE8
	lsls r1, 1
	movs r2, 0x20
	bl LoadPalette
_0809D572:
	ldr r0, _0809D608 @ =gUnknown_83E0768
	ldr r1, _0809D60C @ =gSpecialVar_0x8005
	mov r8, r1
	ldrh r1, [r1]
	lsls r1, 19
	movs r2, 0xA0
	lsls r2, 14
	adds r1, r2
	asrs r1, 16
	ldr r6, _0809D610 @ =gSpecialVar_0x8006
	ldrh r2, [r6]
	lsls r2, 19
	movs r3, 0xA0
	lsls r3, 14
	adds r2, r3
	asrs r2, 16
	movs r3, 0
	bl CreateSprite
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldr r1, _0809D614 @ =gSprites
	lsls r0, r5, 4
	adds r0, r5
	lsls r0, 2
	adds r0, r1
	ldrb r2, [r0, 0x5]
	movs r1, 0xF
	ands r1, r2
	movs r2, 0xD0
	orrs r1, r2
	strb r1, [r0, 0x5]
	ldr r0, _0809D618 @ =sub_809D494
	movs r1, 0x50
	bl CreateTask
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	mov r1, r8
	ldrb r0, [r1]
	ldrb r1, [r6]
	movs r2, 0x8
	movs r3, 0x8
	bl CreateWindowFromRect
	ldr r2, _0809D61C @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r2
	lsls r0, 24
	lsrs r0, 24
	movs r2, 0
	strh r0, [r1, 0x12]
	strh r2, [r1, 0x8]
	strh r5, [r1, 0xC]
	movs r1, 0x1
	bl sub_80F7750
	movs r0, 0
	bl schedule_bg_copy_tilemap_to_vram
_0809D5F2:
	movs r0, 0x1
_0809D5F4:
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0809D600: .4byte gUnknown_83E17D0
_0809D604: .4byte gUnknown_83E0F80
_0809D608: .4byte gUnknown_83E0768
_0809D60C: .4byte gSpecialVar_0x8005
_0809D610: .4byte gSpecialVar_0x8006
_0809D614: .4byte gSprites
_0809D618: .4byte sub_809D494
_0809D61C: .4byte gTasks
	thumb_func_end sub_809D504

	thumb_func_start sub_809D620
sub_809D620: @ 809D620
	push {lr}
	ldr r0, _0809D644 @ =sub_809D494
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0xFF
	beq _0809D64C
	ldr r0, _0809D648 @ =gTasks
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	movs r0, 0x1
	b _0809D64E
	.align 2, 0
_0809D644: .4byte sub_809D494
_0809D648: .4byte gTasks
_0809D64C:
	movs r0, 0
_0809D64E:
	pop {r1}
	bx r1
	thumb_func_end sub_809D620

	thumb_func_start CreateWindowFromRect
CreateWindowFromRect: @ 809D654
	push {r4,r5,lr}
	sub sp, 0x20
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r4, 24
	lsls r5, 24
	lsls r2, 24
	lsrs r2, 24
	lsls r3, 24
	lsrs r3, 24
	movs r0, 0x80
	lsls r0, 17
	adds r4, r0
	lsrs r4, 24
	adds r5, r0
	lsrs r5, 24
	str r2, [sp]
	str r3, [sp, 0x4]
	movs r0, 0xF
	str r0, [sp, 0x8]
	movs r0, 0x38
	str r0, [sp, 0xC]
	add r0, sp, 0x10
	movs r1, 0
	adds r2, r4, 0
	adds r3, r5, 0
	bl SetWindowTemplateFields
	ldr r0, [sp, 0x10]
	ldr r1, [sp, 0x14]
	str r0, [sp, 0x18]
	str r1, [sp, 0x1C]
	add r0, sp, 0x18
	bl AddWindow
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	bl PutWindowTilemap
	adds r0, r4, 0
	add sp, 0x20
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end CreateWindowFromRect

	thumb_func_start sub_809D6B0
sub_809D6B0: @ 809D6B0
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	bl ClearWindowTilemap
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_810F4D8
	adds r0, r4, 0
	bl RemoveWindow
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_809D6B0

	thumb_func_start sub_809D6D4
sub_809D6D4: @ 809D6D4
	push {lr}
	ldr r0, _0809D74C @ =gUnknown_81A7AE0
	bl ScriptContext1_SetupScript
	ldr r0, _0809D750 @ =sub_809D288
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0xFF
	beq _0809D710
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	ldr r1, _0809D754 @ =gTasks+0x8
	adds r2, r0, r1
	movs r1, 0
	ldrsh r0, [r2, r1]
	cmp r0, 0x1
	bgt _0809D710
	movs r0, 0x4
	ldrsh r1, [r2, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0809D758 @ =gSprites
	adds r0, r1
	ldrb r1, [r2, 0x4]
	bl sub_8083A5C
_0809D710:
	ldr r0, _0809D75C @ =sub_809D494
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0xFF
	beq _0809D748
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	ldr r1, _0809D754 @ =gTasks+0x8
	adds r2, r0, r1
	movs r1, 0
	ldrsh r0, [r2, r1]
	cmp r0, 0x1
	bgt _0809D748
	movs r0, 0x4
	ldrsh r1, [r2, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0809D758 @ =gSprites
	adds r0, r1
	bl DestroySprite
	ldr r0, _0809D760 @ =0x00001b58
	bl FreeSpriteTilesByTag
_0809D748:
	pop {r0}
	bx r0
	.align 2, 0
_0809D74C: .4byte gUnknown_81A7AE0
_0809D750: .4byte sub_809D288
_0809D754: .4byte gTasks+0x8
_0809D758: .4byte gSprites
_0809D75C: .4byte sub_809D494
_0809D760: .4byte 0x00001b58
	thumb_func_end sub_809D6D4

	thumb_func_start sub_809D764
sub_809D764: @ 809D764
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0xC
	ldr r1, _0809D7A0 @ =gSpecialVar_Result
	movs r0, 0xFF
	strh r0, [r1]
	ldr r0, _0809D7A4 @ =sub_809D6D4
	bl sub_81119D4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0809D784
	b _0809D8A8
_0809D784:
	ldr r0, _0809D7A8 @ =gSpecialVar_0x8005
	ldrh r0, [r0]
	cmp r0, 0x1
	bne _0809D7B0
	ldr r0, _0809D7AC @ =gSpecialVar_0x8004
	ldrh r0, [r0]
	movs r4, 0x4
	cmp r0, 0x4
	bhi _0809D798
	movs r4, 0x5
_0809D798:
	movs r0, 0x5
	mov r9, r0
	movs r5, 0x2
	b _0809D7B8
	.align 2, 0
_0809D7A0: .4byte gSpecialVar_Result
_0809D7A4: .4byte sub_809D6D4
_0809D7A8: .4byte gSpecialVar_0x8005
_0809D7AC: .4byte gSpecialVar_0x8004
_0809D7B0:
	movs r4, 0
	movs r0, 0x6
	mov r9, r0
	movs r5, 0
_0809D7B8:
	movs r0, 0x2
	movs r1, 0
	bl GetMenuCursorDimensionByFont
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	movs r0, 0x2
	movs r1, 0x1
	bl GetFontAttribute
	mov r0, r9
	lsls r3, r0, 1
	movs r0, 0x11
	adds r1, r5, 0
	movs r2, 0xB
	bl CreateWindowFromRect
	lsls r0, 24
	lsrs r7, r0, 24
	adds r0, r7, 0
	movs r1, 0
	bl sub_80F7750
	movs r6, 0
	mov r5, r9
	subs r5, 0x2
	cmp r6, r5
	bge _0809D844
_0809D7F2:
	ldr r0, _0809D820 @ =gSpecialVar_0x8004
	ldrh r0, [r0]
	cmp r4, r0
	beq _0809D828
	ldr r1, _0809D824 @ =gUnknown_83E17E0
	lsls r0, r4, 2
	adds r0, r1
	ldr r2, [r0]
	lsls r0, r6, 4
	adds r0, 0x2
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp]
	movs r0, 0xFF
	str r0, [sp, 0x4]
	movs r0, 0
	str r0, [sp, 0x8]
	adds r0, r7, 0
	movs r1, 0x2
	mov r3, r8
	bl AddTextPrinterParameterized
	b _0809D82E
	.align 2, 0
_0809D820: .4byte gSpecialVar_0x8004
_0809D824: .4byte gUnknown_83E17E0
_0809D828:
	subs r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
_0809D82E:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x8
	bne _0809D83A
	movs r4, 0
_0809D83A:
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, r5
	blt _0809D7F2
_0809D844:
	ldr r2, _0809D8B8 @ =gUnknown_8417DED
	lsls r0, r6, 4
	adds r0, 0x2
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp]
	movs r5, 0xFF
	str r5, [sp, 0x4]
	movs r4, 0
	str r4, [sp, 0x8]
	adds r0, r7, 0
	movs r1, 0x2
	mov r3, r8
	bl AddTextPrinterParameterized
	adds r0, r6, 0x1
	lsls r0, 24
	ldr r2, _0809D8BC @ =gUnknown_84161C8
	lsrs r0, 20
	adds r0, 0x2
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp]
	str r5, [sp, 0x4]
	str r4, [sp, 0x8]
	adds r0, r7, 0
	movs r1, 0x2
	mov r3, r8
	bl AddTextPrinterParameterized
	movs r0, 0x10
	str r0, [sp]
	mov r0, r9
	str r0, [sp, 0x4]
	str r4, [sp, 0x8]
	adds r0, r7, 0
	movs r1, 0x2
	movs r2, 0
	movs r3, 0x2
	bl sub_810F7D8
	movs r0, 0
	mov r1, r9
	adds r2, r7, 0
	movs r3, 0xFF
	bl sub_809CC18
	movs r0, 0
	bl schedule_bg_copy_tilemap_to_vram
_0809D8A8:
	add sp, 0xC
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809D8B8: .4byte gUnknown_8417DED
_0809D8BC: .4byte gUnknown_84161C8
	thumb_func_end sub_809D764

	thumb_func_start sub_809D8C0
sub_809D8C0: @ 809D8C0
	push {lr}
	ldr r3, _0809D8EC @ =gSpecialVar_Result
	ldrh r2, [r3]
	adds r1, r2, 0
	cmp r1, 0x7F
	beq _0809D930
	ldr r0, _0809D8F0 @ =gSpecialVar_0x8005
	ldrh r0, [r0]
	cmp r0, 0x1
	bne _0809D924
	cmp r1, 0x3
	beq _0809D928
	cmp r1, 0x4
	beq _0809D930
	cmp r1, 0
	bne _0809D8F8
	ldr r0, _0809D8F4 @ =gSpecialVar_0x8004
	ldrh r0, [r0]
	cmp r0, 0x4
	bls _0809D904
	movs r0, 0x4
	b _0809D94E
	.align 2, 0
_0809D8EC: .4byte gSpecialVar_Result
_0809D8F0: .4byte gSpecialVar_0x8005
_0809D8F4: .4byte gSpecialVar_0x8004
_0809D8F8:
	cmp r1, 0x1
	bne _0809D90C
	ldr r0, _0809D908 @ =gSpecialVar_0x8004
	ldrh r0, [r0]
	cmp r0, 0x5
	bls _0809D918
_0809D904:
	movs r0, 0x5
	b _0809D94E
	.align 2, 0
_0809D908: .4byte gSpecialVar_0x8004
_0809D90C:
	cmp r1, 0x2
	bne _0809D94C
	ldr r0, _0809D91C @ =gSpecialVar_0x8004
	ldrh r0, [r0]
	cmp r0, 0x6
	bls _0809D920
_0809D918:
	movs r0, 0x6
	b _0809D94E
	.align 2, 0
_0809D91C: .4byte gSpecialVar_0x8004
_0809D920:
	movs r0, 0x7
	b _0809D94E
_0809D924:
	cmp r1, 0x4
	bne _0809D92C
_0809D928:
	movs r0, 0xFE
	b _0809D94E
_0809D92C:
	cmp r1, 0x5
	bne _0809D934
_0809D930:
	movs r0, 0x7F
	b _0809D94E
_0809D934:
	ldr r0, _0809D944 @ =gSpecialVar_0x8004
	ldrh r0, [r0]
	cmp r1, r0
	bcc _0809D948
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r0, 16
	b _0809D94E
	.align 2, 0
_0809D944: .4byte gSpecialVar_0x8004
_0809D948:
	ldrh r0, [r3]
	b _0809D94E
_0809D94C:
	movs r0, 0
_0809D94E:
	pop {r1}
	bx r1
	thumb_func_end sub_809D8C0

	.align 2, 0 @ Don't pad with nop.
