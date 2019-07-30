	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_814191C
sub_814191C: @ 814191C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _08141940 @ =gTasks+0x8
	adds r5, r0, r1
	movs r1, 0
	ldrsh r0, [r5, r1]
	cmp r0, 0x1
	beq _08141984
	cmp r0, 0x1
	bgt _08141944
	cmp r0, 0
	beq _08141952
	b _08141AA8
	.align 2, 0
_08141940: .4byte gTasks+0x8
_08141944:
	cmp r0, 0x2
	bne _0814194A
	b _08141A58
_0814194A:
	cmp r0, 0x3
	bne _08141950
	b _08141A98
_08141950:
	b _08141AA8
_08141952:
	ldr r0, _08141980 @ =gUnknown_84664BC
	movs r1, 0x60
	movs r2, 0x20
	bl LoadPalette
	movs r4, 0
_0814195E:
	adds r0, r4, 0
	bl sub_8140BF8
	cmp r0, 0
	beq _08141978
	movs r0, 0x2
	bl GetBgTilemapBuffer
	lsls r1, r4, 16
	lsrs r1, 16
	movs r2, 0x6
	bl sub_81418C4
_08141978:
	adds r4, 0x1
	cmp r4, 0x4
	ble _0814195E
	b _08141A84
	.align 2, 0
_08141980: .4byte gUnknown_84664BC
_08141984:
	ldrh r1, [r5, 0x2]
	movs r2, 0x2
	ldrsh r0, [r5, r2]
	cmp r0, 0
	bne _081419C4
	ldr r1, _081419BC @ =gSineTable
	movs r2, 0x4
	ldrsh r0, [r5, r2]
	lsls r0, 1
	adds r0, r1
	ldrh r0, [r0]
	lsls r0, 16
	asrs r0, 23
	lsls r0, 16
	lsrs r0, 11
	ldr r1, _081419C0 @ =gUnknown_84664DC
	adds r0, r1
	movs r1, 0x10
	movs r2, 0x20
	bl LoadPalette
	ldrh r0, [r5, 0x4]
	adds r0, 0x20
	movs r1, 0x7F
	ands r0, r1
	strh r0, [r5, 0x4]
	movs r0, 0x8
	b _081419C6
	.align 2, 0
_081419BC: .4byte gSineTable
_081419C0: .4byte gUnknown_84664DC
_081419C4:
	subs r0, r1, 0x1
_081419C6:
	strh r0, [r5, 0x2]
	movs r1, 0x6
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _08141A00
	ldrh r0, [r5, 0x8]
	adds r0, 0x8
	movs r1, 0x7F
	ands r0, r1
	strh r0, [r5, 0x8]
	ldr r1, _081419FC @ =gSineTable
	movs r2, 0x8
	ldrsh r0, [r5, r2]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	lsls r1, 16
	asrs r1, 21
	strh r1, [r5, 0xA]
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0x40
	movs r2, 0
	bl BlendPalettes
	b _08141A2C
	.align 2, 0
_081419FC: .4byte gSineTable
_08141A00:
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _08141A2C
	movs r0, 0
	strh r0, [r5, 0x8]
	ldrh r0, [r5, 0xA]
	adds r0, 0x1
	movs r1, 0x1
	ands r0, r1
	strh r0, [r5, 0xA]
	movs r0, 0xA
	ldrsh r1, [r5, r0]
	lsls r1, 27
	lsrs r1, 24
	movs r0, 0x40
	movs r2, 0
	bl BlendPalettes
_08141A2C:
	movs r4, 0
	ldr r5, _08141A4C @ =gPlttBufferFaded
	ldr r3, _08141A50 @ =gUnknown_8466C34
	ldr r2, _08141A54 @ =gPlttBufferUnfaded
_08141A34:
	adds r0, r4, r3
	ldrb r0, [r0]
	adds r0, 0x60
	lsls r0, 1
	adds r1, r0, r5
	adds r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, 0x1
	cmp r4, 0x1
	bls _08141A34
	b _08141AA8
	.align 2, 0
_08141A4C: .4byte gPlttBufferFaded
_08141A50: .4byte gUnknown_8466C34
_08141A54: .4byte gPlttBufferUnfaded
_08141A58:
	movs r4, 0
_08141A5A:
	adds r0, r4, 0
	bl sub_8140BF8
	cmp r0, 0
	beq _08141A74
	movs r0, 0x2
	bl GetBgTilemapBuffer
	lsls r1, r4, 16
	lsrs r1, 16
	movs r2, 0x4
	bl sub_81418C4
_08141A74:
	adds r4, 0x1
	cmp r4, 0x4
	ble _08141A5A
	ldr r0, _08141A94 @ =gUnknown_8465950
	movs r1, 0x10
	movs r2, 0x20
	bl LoadPalette
_08141A84:
	movs r0, 0x2
	bl CopyBgTilemapBufferToVram
	ldrh r0, [r5]
	adds r0, 0x1
	strh r0, [r5]
	b _08141AA8
	.align 2, 0
_08141A94: .4byte gUnknown_8465950
_08141A98:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _08141AA8
	adds r0, r4, 0
	bl DestroyTask
_08141AA8:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_814191C

	thumb_func_start sub_8141AB0
sub_8141AB0: @ 8141AB0
	push {lr}
	ldr r0, _08141AD0 @ =sub_814191C
	bl FindTaskIdByFunc
	ldr r2, _08141AD4 @ =gTasks
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r0, 0x2
	strh r0, [r1, 0x8]
	pop {r0}
	bx r0
	.align 2, 0
_08141AD0: .4byte sub_814191C
_08141AD4: .4byte gTasks
	thumb_func_end sub_8141AB0

	thumb_func_start sub_8141AD8
sub_8141AD8: @ 8141AD8
	push {r4,lr}
	sub sp, 0xC
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _08141B14 @ =gUnknown_8466C38
	movs r1, 0xA
	str r1, [sp]
	movs r1, 0xD
	str r1, [sp, 0x4]
	str r4, [sp, 0x8]
	movs r1, 0x2
	movs r2, 0
	movs r3, 0x2
	bl CreateYesNoMenu
	lsls r4, 24
	asrs r4, 24
	adds r0, r4, 0
	bl Menu_MoveCursorNoWrapAround
	bl sub_814112C
	movs r1, 0x1
	str r1, [r0, 0x28]
	add sp, 0xC
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08141B14: .4byte gUnknown_8466C38
	thumb_func_end sub_8141AD8

	thumb_func_start sub_8141B18
sub_8141B18: @ 8141B18
	push {r4,lr}
	bl sub_814112C
	adds r4, r0, 0
	ldr r0, [r4, 0x28]
	cmp r0, 0
	beq _08141B2E
	bl DestroyYesNoMenu
	movs r0, 0
	str r0, [r4, 0x28]
_08141B2E:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8141B18

	thumb_func_start sub_8141B34
sub_8141B34: @ 8141B34
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	bl sub_814112C
	adds r4, r0, 0
	movs r0, 0x2
	bl GetBgTilemapBuffer
	mov r12, r0
	movs r1, 0
	movs r0, 0x44
	adds r0, r4
	mov r8, r0
	adds r7, r4, 0
	adds r7, 0x2C
	ldr r0, _08141B9C @ =gUnknown_8466C40
	mov r9, r0
_08141B5A:
	movs r5, 0
	lsls r0, r1, 3
	adds r6, r1, 0x1
	mov r1, r8
	adds r4, r0, r1
	mov r1, r9
	adds r3, r0, r1
	adds r2, r0, 0
_08141B6A:
	ldrh r0, [r3]
	lsls r0, 1
	add r0, r12
	ldrh r0, [r0]
	strh r0, [r4]
	adds r1, r7, r2
	adds r0, r5, 0
	adds r0, 0xC0
	strh r0, [r1]
	adds r4, 0x2
	adds r3, 0x2
	adds r2, 0x2
	adds r5, 0x1
	cmp r5, 0x3
	ble _08141B6A
	adds r1, r6, 0
	cmp r1, 0x2
	ble _08141B5A
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08141B9C: .4byte gUnknown_8466C40
	thumb_func_end sub_8141B34

	thumb_func_start sub_8141BA0
sub_8141BA0: @ 8141BA0
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x2
	bhi _08141BD8
	bl sub_814112C
	adds r4, r0, 0
	movs r0, 0x2
	bl GetBgTilemapBuffer
	adds r6, r0, 0
	lsls r0, r5, 3
	ldr r1, _08141BE0 @ =gUnknown_8466C40
	adds r4, 0x2C
	adds r3, r0, r4
	adds r2, r0, r1
	movs r4, 0x3
_08141BC4:
	ldrh r0, [r2]
	lsls r0, 1
	adds r0, r6
	ldrh r1, [r3]
	strh r1, [r0]
	adds r3, 0x2
	adds r2, 0x2
	subs r4, 0x1
	cmp r4, 0
	bge _08141BC4
_08141BD8:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08141BE0: .4byte gUnknown_8466C40
	thumb_func_end sub_8141BA0

	thumb_func_start sub_8141BE4
sub_8141BE4: @ 8141BE4
	push {r4-r7,lr}
	bl sub_814112C
	adds r4, r0, 0
	movs r0, 0x2
	bl GetBgTilemapBuffer
	adds r6, r0, 0
	movs r1, 0
	adds r7, r4, 0
	adds r7, 0x44
	ldr r0, _08141C2C @ =gUnknown_8466C40
	mov r12, r0
_08141BFE:
	lsls r0, r1, 3
	adds r5, r1, 0x1
	adds r3, r0, r7
	mov r1, r12
	adds r2, r0, r1
	movs r4, 0x3
_08141C0A:
	ldrh r0, [r2]
	lsls r0, 1
	adds r0, r6
	ldrh r1, [r3]
	strh r1, [r0]
	adds r3, 0x2
	adds r2, 0x2
	subs r4, 0x1
	cmp r4, 0
	bge _08141C0A
	adds r1, r5, 0
	cmp r1, 0x2
	ble _08141BFE
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08141C2C: .4byte gUnknown_8466C40
	thumb_func_end sub_8141BE4

	thumb_func_start sub_8141C30
sub_8141C30: @ 8141C30
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	lsrs r5, 24
	bl sub_814112C
	adds r0, 0x20
	strb r4, [r0]
	movs r0, 0xC
	adds r1, r5, 0
	bl sub_8141148
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8141C30

	.align 2, 0 @ Don't pad with nop.
