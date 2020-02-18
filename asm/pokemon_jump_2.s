	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_8149A6C
sub_8149A6C: @ 8149A6C
	push {lr}
	sub sp, 0xC
	mov r2, sp
	movs r1, 0x1
	strb r1, [r2]
	ldrh r1, [r0]
	strh r1, [r2, 0x2]
	ldr r1, [r0, 0x4]
	str r1, [sp, 0x8]
	ldr r0, [r0, 0x8]
	str r0, [sp, 0x4]
	mov r0, sp
	bl RfuPrepareSend0x2f00
	add sp, 0xC
	pop {r0}
	bx r0
	thumb_func_end sub_8149A6C

	thumb_func_start sub_8149A90
sub_8149A90: @ 8149A90
	push {r4,lr}
	sub sp, 0xC
	adds r4, r1, 0
	ldr r3, _08149AC4 @ =gRecvCmds
	lsls r2, r0, 4
	adds r0, r2, r3
	ldrh r1, [r0]
	movs r0, 0xFF
	lsls r0, 8
	ands r0, r1
	movs r1, 0xBC
	lsls r1, 6
	cmp r0, r1
	bne _08149AC0
	adds r1, r3, 0x2
	adds r1, r2, r1
	mov r0, sp
	movs r2, 0xC
	bl memcpy
	mov r0, sp
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _08149AC8
_08149AC0:
	movs r0, 0
	b _08149AD8
	.align 2, 0
_08149AC4: .4byte gRecvCmds
_08149AC8:
	mov r0, sp
	ldrh r0, [r0, 0x2]
	strh r0, [r4]
	ldr r0, [sp, 0x8]
	str r0, [r4, 0x4]
	ldr r0, [sp, 0x4]
	str r0, [r4, 0x8]
	movs r0, 0x1
_08149AD8:
	add sp, 0xC
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8149A90

	thumb_func_start sub_8149AE0
sub_8149AE0: @ 8149AE0
	push {lr}
	sub sp, 0xC
	mov r2, sp
	movs r1, 0x2
	strb r1, [r2]
	str r0, [sp, 0x4]
	mov r0, sp
	bl RfuPrepareSend0x2f00
	add sp, 0xC
	pop {r0}
	bx r0
	thumb_func_end sub_8149AE0

	thumb_func_start sub_8149AF8
sub_8149AF8: @ 8149AF8
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0xC
	mov r3, sp
	movs r2, 0x3
	strb r2, [r3]
	ldr r3, [r1, 0x8]
	lsls r3, 15
	ldr r2, [sp, 0x8]
	ldr r4, _08149B74 @ =0x00007fff
	mov r8, r4
	ands r2, r4
	orrs r2, r3
	str r2, [sp, 0x8]
	mov r6, sp
	ldrb r2, [r1, 0x1]
	movs r5, 0x1F
	adds r3, r5, 0
	ands r3, r2
	ldrb r4, [r6, 0x3]
	movs r2, 0x20
	negs r2, r2
	ands r2, r4
	orrs r2, r3
	strb r2, [r6, 0x3]
	mov r3, sp
	ldrb r2, [r1]
	strb r2, [r3, 0x1]
	ldrh r2, [r1, 0x2]
	strh r2, [r3, 0x6]
	mov r4, sp
	ldrh r2, [r1, 0x4]
	mov r1, r8
	ands r2, r1
	ldrh r3, [r4, 0x8]
	ldr r1, _08149B78 @ =0xffff8000
	ands r1, r3
	orrs r1, r2
	strh r1, [r4, 0x8]
	mov r2, sp
	ldrh r1, [r0, 0x10]
	strb r1, [r2, 0x2]
	mov r3, sp
	ldr r1, [r0, 0x14]
	lsls r1, 5
	ldrb r2, [r3, 0x3]
	ands r5, r2
	orrs r5, r1
	strb r5, [r3, 0x3]
	mov r1, sp
	ldrh r0, [r0, 0xE]
	strh r0, [r1, 0x4]
	mov r0, sp
	bl RfuPrepareSend0x2f00
	add sp, 0xC
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08149B74: .4byte 0x00007fff
_08149B78: .4byte 0xffff8000
	thumb_func_end sub_8149AF8

	thumb_func_start sub_8149B7C
sub_8149B7C: @ 8149B7C
	push {r4,r5,lr}
	sub sp, 0xC
	adds r5, r0, 0
	adds r4, r1, 0
	ldr r2, _08149BE4 @ =gRecvCmds
	ldrh r0, [r2]
	movs r1, 0xFF
	lsls r1, 8
	ands r1, r0
	movs r0, 0xBC
	lsls r0, 6
	cmp r1, r0
	bne _08149BE8
	adds r1, r2, 0x2
	mov r0, sp
	movs r2, 0xC
	bl memcpy
	mov r0, sp
	ldrb r0, [r0]
	cmp r0, 0x3
	bne _08149BE8
	ldr r0, [sp, 0x8]
	lsrs r0, 15
	str r0, [r4, 0x8]
	mov r0, sp
	ldrb r1, [r0, 0x3]
	lsls r0, r1, 27
	lsrs r0, 27
	strb r0, [r4, 0x1]
	mov r0, sp
	ldrb r0, [r0, 0x1]
	strb r0, [r4]
	mov r0, sp
	ldrh r0, [r0, 0x6]
	strh r0, [r4, 0x2]
	mov r0, sp
	ldrh r0, [r0, 0x8]
	lsls r0, 17
	lsrs r0, 17
	strh r0, [r4, 0x4]
	mov r0, sp
	ldrb r0, [r0, 0x2]
	strh r0, [r5, 0x10]
	lsls r1, 24
	lsrs r1, 29
	str r1, [r5, 0x14]
	mov r0, sp
	ldrh r0, [r0, 0x4]
	strh r0, [r5, 0xE]
	movs r0, 0x1
	b _08149BEA
	.align 2, 0
_08149BE4: .4byte gRecvCmds
_08149BE8:
	movs r0, 0
_08149BEA:
	add sp, 0xC
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8149B7C

	thumb_func_start sub_8149BF4
sub_8149BF4: @ 8149BF4
	push {r4,lr}
	sub sp, 0xC
	mov r4, sp
	movs r3, 0x4
	strb r3, [r4]
	ldrh r3, [r0, 0x10]
	strb r3, [r4, 0x1]
	ldr r3, [r0, 0x14]
	strb r3, [r4, 0x2]
	ldr r3, [r0, 0x18]
	strb r3, [r4, 0x3]
	mov r3, sp
	ldrh r0, [r0, 0xE]
	strh r0, [r3, 0x4]
	mov r0, sp
	strb r1, [r0, 0x6]
	strh r2, [r0, 0x8]
	bl RfuPrepareSend0x2f00
	add sp, 0xC
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8149BF4

	thumb_func_start sub_8149C24
sub_8149C24: @ 8149C24
	push {r4-r6,lr}
	sub sp, 0xC
	adds r4, r0, 0
	adds r5, r2, 0
	adds r6, r3, 0
	ldr r3, _08149C80 @ =gRecvCmds
	lsls r2, r1, 4
	adds r0, r2, r3
	ldrh r1, [r0]
	movs r0, 0xFF
	lsls r0, 8
	ands r0, r1
	movs r1, 0xBC
	lsls r1, 6
	cmp r0, r1
	bne _08149C84
	adds r1, r3, 0x2
	adds r1, r2, r1
	mov r0, sp
	movs r2, 0xC
	bl memcpy
	mov r0, sp
	ldrb r0, [r0]
	cmp r0, 0x4
	bne _08149C84
	mov r0, sp
	ldrb r0, [r0, 0x1]
	strh r0, [r4, 0x10]
	mov r0, sp
	ldrb r0, [r0, 0x2]
	str r0, [r4, 0x14]
	mov r0, sp
	ldrb r0, [r0, 0x3]
	str r0, [r4, 0x18]
	mov r0, sp
	ldrh r0, [r0, 0x4]
	strh r0, [r4, 0xE]
	mov r0, sp
	ldrb r0, [r0, 0x6]
	strb r0, [r5]
	mov r0, sp
	ldrh r0, [r0, 0x8]
	strh r0, [r6]
	movs r0, 0x1
	b _08149C86
	.align 2, 0
_08149C80: .4byte gRecvCmds
_08149C84:
	movs r0, 0
_08149C86:
	add sp, 0xC
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_8149C24

	thumb_func_start sub_8149C90
sub_8149C90: @ 8149C90
	push {r4,lr}
	sub sp, 0xC
	adds r4, r0, 0
	ldr r3, _08149CDC @ =gRecvCmds
	lsls r2, r1, 4
	adds r0, r2, r3
	ldrh r1, [r0]
	movs r0, 0xFF
	lsls r0, 8
	ands r0, r1
	movs r1, 0xBC
	lsls r1, 6
	cmp r0, r1
	bne _08149CE0
	adds r1, r3, 0x2
	adds r1, r2, r1
	mov r0, sp
	movs r2, 0xC
	bl memcpy
	mov r0, sp
	ldrb r0, [r0]
	cmp r0, 0x4
	bne _08149CE0
	mov r0, sp
	ldrb r0, [r0, 0x1]
	strh r0, [r4, 0x10]
	mov r0, sp
	ldrb r0, [r0, 0x2]
	str r0, [r4, 0x14]
	mov r0, sp
	ldrb r0, [r0, 0x3]
	str r0, [r4, 0x18]
	mov r0, sp
	ldrh r0, [r0, 0x4]
	strh r0, [r4, 0xE]
	movs r0, 0x1
	b _08149CE2
	.align 2, 0
_08149CDC: .4byte gRecvCmds
_08149CE0:
	movs r0, 0
_08149CE2:
	add sp, 0xC
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8149C90

	thumb_func_start sub_8149CEC
sub_8149CEC: @ 8149CEC
	push {r4,lr}
	ldr r4, _08149D18 @ =gUnknown_203F3D8
	str r0, [r4]
	bl sub_8149D34
	ldr r0, _08149D1C @ =sub_8149DA4
	movs r1, 0x3
	bl CreateTask
	ldr r1, [r4]
	strb r0, [r1, 0x6]
	ldr r2, [r4]
	ldrb r0, [r2, 0x6]
	movs r1, 0x2
	bl SetWordTaskArg
	ldr r0, _08149D20 @ =sub_8149DC8
	bl sub_8149D80
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08149D18: .4byte gUnknown_203F3D8
_08149D1C: .4byte sub_8149DA4
_08149D20: .4byte sub_8149DC8
	thumb_func_end sub_8149CEC

	thumb_func_start sub_8149D24
sub_8149D24: @ 8149D24
	push {lr}
	bl FreeAllWindowBuffers
	bl DigitObjUtil_Teardown
	pop {r0}
	bx r0
	thumb_func_end sub_8149D24

	thumb_func_start sub_8149D34
sub_8149D34: @ 8149D34
	movs r1, 0
	strh r1, [r0, 0x4]
	str r1, [r0]
	movs r1, 0xFF
	strh r1, [r0, 0x12]
	bx lr
	thumb_func_end sub_8149D34

	thumb_func_start sub_8149D40
sub_8149D40: @ 8149D40
	push {r4-r6,lr}
	adds r6, r0, 0
	movs r5, 0
	ldr r4, _08149D64 @ =gUnknown_846D8FC
_08149D48:
	ldr r0, [r4]
	cmp r0, r6
	bne _08149D54
	ldr r0, [r4, 0x4]
	bl sub_8149D80
_08149D54:
	adds r4, 0x8
	adds r5, 0x1
	cmp r5, 0x9
	bls _08149D48
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08149D64: .4byte gUnknown_846D8FC
	thumb_func_end sub_8149D40

	thumb_func_start sub_8149D68
sub_8149D68: @ 8149D68
	ldr r0, _08149D7C @ =gUnknown_203F3D8
	ldr r0, [r0]
	ldr r1, [r0]
	movs r0, 0x1
	eors r1, r0
	negs r0, r1
	orrs r0, r1
	lsrs r0, 31
	bx lr
	.align 2, 0
_08149D7C: .4byte gUnknown_203F3D8
	thumb_func_end sub_8149D68

	thumb_func_start sub_8149D80
sub_8149D80: @ 8149D80
	push {r4,lr}
	adds r2, r0, 0
	ldr r4, _08149DA0 @ =gUnknown_203F3D8
	ldr r0, [r4]
	ldrb r0, [r0, 0x6]
	movs r1, 0
	bl SetWordTaskArg
	ldr r1, [r4]
	movs r0, 0
	strh r0, [r1, 0x4]
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08149DA0: .4byte gUnknown_203F3D8
	thumb_func_end sub_8149D80

	thumb_func_start sub_8149DA4
sub_8149DA4: @ 8149DA4
	push {lr}
	lsls r0, 24
	lsrs r1, r0, 24
	ldr r0, _08149DC4 @ =gUnknown_203F3D8
	ldr r0, [r0]
	ldr r0, [r0]
	cmp r0, 0
	bne _08149DC0
	adds r0, r1, 0
	movs r1, 0
	bl GetWordTaskArg
	bl _call_via_r0
_08149DC0:
	pop {r0}
	bx r0
	.align 2, 0
_08149DC4: .4byte gUnknown_203F3D8
	thumb_func_end sub_8149DA4

	thumb_func_start sub_8149DC8
sub_8149DC8: @ 8149DC8
	push {r4-r6,lr}
	sub sp, 0x8
	ldr r6, _08149DE4 @ =gUnknown_203F3D8
	ldr r1, [r6]
	ldrh r5, [r1, 0x4]
	cmp r5, 0x1
	bne _08149DD8
	b _08149F18
_08149DD8:
	cmp r5, 0x1
	bgt _08149DE8
	cmp r5, 0
	beq _08149DF0
	b _08149F5A
	.align 2, 0
_08149DE4: .4byte gUnknown_203F3D8
_08149DE8:
	cmp r5, 0x2
	bne _08149DEE
	b _08149F56
_08149DEE:
	b _08149F5A
_08149DF0:
	movs r0, 0
	bl ResetBgsAndClearDma3BusyFlags
	ldr r1, _08149EE8 @ =gUnknown_846D8D4
	movs r0, 0
	movs r2, 0x4
	bl InitBgsFromTemplates
	ldr r0, _08149EEC @ =gUnknown_846D8E4
	bl InitWindows
	bl ResetBgPositions
	bl ResetTempTileDataBuffers
	ldr r0, [r6]
	bl sub_814AD6C
	bl sub_814A9C8
	ldr r0, _08149EF0 @ =gUnknown_846B7B4
	movs r1, 0
	movs r2, 0x20
	bl LoadPalette
	ldr r1, _08149EF4 @ =gUnknown_846B7D4
	str r5, [sp]
	movs r0, 0x3
	movs r2, 0
	movs r3, 0
	bl DecompressAndCopyTileDataToVram
	ldr r1, _08149EF8 @ =gUnknown_846BA00
	movs r4, 0x1
	str r4, [sp]
	movs r0, 0x3
	movs r2, 0
	movs r3, 0
	bl DecompressAndCopyTileDataToVram
	ldr r0, _08149EFC @ =gUnknown_846BBB0
	movs r1, 0x30
	movs r2, 0x20
	bl LoadPalette
	ldr r1, _08149F00 @ =gUnknown_846BBD0
	str r5, [sp]
	movs r0, 0x2
	movs r2, 0
	movs r3, 0
	bl DecompressAndCopyTileDataToVram
	ldr r1, _08149F04 @ =gUnknown_846C520
	str r4, [sp]
	movs r0, 0x2
	movs r2, 0
	movs r3, 0
	bl DecompressAndCopyTileDataToVram
	ldr r0, _08149F08 @ =gUnknown_846C8D8
	movs r1, 0x10
	movs r2, 0x20
	bl LoadPalette
	ldr r1, _08149F0C @ =gUnknown_846C8F8
	str r5, [sp]
	movs r0, 0x1
	movs r2, 0
	movs r3, 0
	bl DecompressAndCopyTileDataToVram
	ldr r1, _08149F10 @ =gUnknown_846D3A8
	str r4, [sp]
	movs r0, 0x1
	movs r2, 0
	movs r3, 0
	bl DecompressAndCopyTileDataToVram
	ldr r0, _08149F14 @ =gUnknown_846B794
	movs r1, 0x20
	movs r2, 0x20
	bl LoadPalette
	ldr r1, [r6]
	movs r0, 0xD3
	lsls r0, 1
	adds r1, r0
	movs r0, 0
	bl SetBgTilemapBuffer
	movs r0, 0x20
	str r0, [sp]
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect_Palette0
	bl sub_814A84C
	movs r0, 0
	bl sub_814AA24
	movs r0, 0
	movs r1, 0x1
	movs r2, 0xE0
	bl sub_814FDA0
	movs r0, 0
	movs r1, 0xA
	movs r2, 0xD0
	bl LoadUserWindowBorderGfx
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	movs r0, 0x2
	bl CopyBgTilemapBufferToVram
	movs r0, 0x1
	bl CopyBgTilemapBufferToVram
	b _08149F4C
	.align 2, 0
_08149EE8: .4byte gUnknown_846D8D4
_08149EEC: .4byte gUnknown_846D8E4
_08149EF0: .4byte gUnknown_846B7B4
_08149EF4: .4byte gUnknown_846B7D4
_08149EF8: .4byte gUnknown_846BA00
_08149EFC: .4byte gUnknown_846BBB0
_08149F00: .4byte gUnknown_846BBD0
_08149F04: .4byte gUnknown_846C520
_08149F08: .4byte gUnknown_846C8D8
_08149F0C: .4byte gUnknown_846C8F8
_08149F10: .4byte gUnknown_846D3A8
_08149F14: .4byte gUnknown_846B794
_08149F18:
	bl FreeTempTileDataBuffersIfPossible
	lsls r0, 24
	cmp r0, 0
	bne _08149F5A
	bl sub_814A8B8
	ldr r0, [r6]
	bl sub_814B294
	ldr r0, [r6]
	movs r1, 0x6
	bl sub_814B348
	movs r0, 0x3
	bl ShowBg
	movs r0, 0
	bl ShowBg
	movs r0, 0x2
	bl ShowBg
	movs r0, 0x1
	bl HideBg
_08149F4C:
	ldr r1, [r6]
	ldrh r0, [r1, 0x4]
	adds r0, 0x1
	strh r0, [r1, 0x4]
	b _08149F5A
_08149F56:
	movs r0, 0x1
	str r0, [r1]
_08149F5A:
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8149DC8

	thumb_func_start sub_8149F64
sub_8149F64: @ 8149F64
	push {r4,lr}
	ldr r4, _08149F7C @ =gUnknown_203F3D8
	ldr r0, [r4]
	ldrh r0, [r0, 0x4]
	cmp r0, 0x1
	beq _08149F90
	cmp r0, 0x1
	bgt _08149F80
	cmp r0, 0
	beq _08149F8A
	b _08149FCA
	.align 2, 0
_08149F7C: .4byte gUnknown_203F3D8
_08149F80:
	cmp r0, 0x2
	beq _08149FA2
	cmp r0, 0x3
	beq _08149FBA
	b _08149FCA
_08149F8A:
	bl sub_814AADC
	b _08149FB0
_08149F90:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _08149FCA
	movs r0, 0
	bl sub_814AC30
	b _08149FB0
_08149FA2:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _08149FCA
	bl sub_814AC94
_08149FB0:
	ldr r1, [r4]
	ldrh r0, [r1, 0x4]
	adds r0, 0x1
	strh r0, [r1, 0x4]
	b _08149FCA
_08149FBA:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _08149FCA
	ldr r1, [r4]
	movs r0, 0x1
	str r0, [r1]
_08149FCA:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8149F64

	thumb_func_start sub_8149FD0
sub_8149FD0: @ 8149FD0
	push {r4,lr}
	ldr r4, _08149FE8 @ =gUnknown_203F3D8
	ldr r0, [r4]
	ldrh r0, [r0, 0x4]
	cmp r0, 0x1
	beq _08149FFC
	cmp r0, 0x1
	bgt _08149FEC
	cmp r0, 0
	beq _08149FF6
	b _0814A036
	.align 2, 0
_08149FE8: .4byte gUnknown_203F3D8
_08149FEC:
	cmp r0, 0x2
	beq _0814A00E
	cmp r0, 0x3
	beq _0814A026
	b _0814A036
_08149FF6:
	bl sub_814AADC
	b _0814A01C
_08149FFC:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _0814A036
	movs r0, 0x1
	bl sub_814AC30
	b _0814A01C
_0814A00E:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _0814A036
	bl sub_814AC94
_0814A01C:
	ldr r1, [r4]
	ldrh r0, [r1, 0x4]
	adds r0, 0x1
	strh r0, [r1, 0x4]
	b _0814A036
_0814A026:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _0814A036
	ldr r1, [r4]
	movs r0, 0x1
	str r0, [r1]
_0814A036:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8149FD0

	thumb_func_start sub_814A03C
sub_814A03C: @ 814A03C
	push {r4,r5,lr}
	bl sub_81499A4
	lsls r0, 16
	lsrs r5, r0, 16
	ldr r0, _0814A058 @ =gUnknown_203F3D8
	ldr r0, [r0]
	ldrh r0, [r0, 0x4]
	cmp r0, 0
	beq _0814A05C
	cmp r0, 0x1
	beq _0814A090
	b _0814A0BE
	.align 2, 0
_0814A058: .4byte gUnknown_203F3D8
_0814A05C:
	movs r4, 0
	cmp r4, r5
	bge _0814A078
_0814A062:
	ldr r0, _0814A08C @ =gUnknown_203F3D8
	ldr r0, [r0]
	lsls r1, r4, 1
	adds r0, 0x1C
	adds r0, r1
	ldrb r0, [r0]
	bl ClearWindowTilemap
	adds r4, 0x1
	cmp r4, r5
	blt _0814A062
_0814A078:
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	ldr r0, _0814A08C @ =gUnknown_203F3D8
	ldr r1, [r0]
	ldrh r0, [r1, 0x4]
	adds r0, 0x1
	strh r0, [r1, 0x4]
	b _0814A0BE
	.align 2, 0
_0814A08C: .4byte gUnknown_203F3D8
_0814A090:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _0814A0BE
	movs r4, 0
	cmp r4, r5
	bge _0814A0B6
_0814A0A0:
	ldr r0, _0814A0C4 @ =gUnknown_203F3D8
	ldr r0, [r0]
	lsls r1, r4, 1
	adds r0, 0x1C
	adds r0, r1
	ldrb r0, [r0]
	bl RemoveWindow
	adds r4, 0x1
	cmp r4, r5
	blt _0814A0A0
_0814A0B6:
	ldr r0, _0814A0C4 @ =gUnknown_203F3D8
	ldr r1, [r0]
	movs r0, 0x1
	str r0, [r1]
_0814A0BE:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0814A0C4: .4byte gUnknown_203F3D8
	thumb_func_end sub_814A03C

	thumb_func_start sub_814A0C8
sub_814A0C8: @ 814A0C8
	push {r4,r5,lr}
	sub sp, 0xC
	ldr r5, _0814A0E0 @ =gUnknown_203F3D8
	ldr r0, [r5]
	ldrh r4, [r0, 0x4]
	cmp r4, 0x1
	beq _0814A124
	cmp r4, 0x1
	bgt _0814A0E4
	cmp r4, 0
	beq _0814A0EA
	b _0814A16C
	.align 2, 0
_0814A0E0: .4byte gUnknown_203F3D8
_0814A0E4:
	cmp r4, 0x2
	beq _0814A15C
	b _0814A16C
_0814A0EA:
	movs r0, 0x1
	movs r1, 0x8
	movs r2, 0x14
	movs r3, 0x2
	bl sub_814A754
	ldr r1, [r5]
	strh r0, [r1, 0x12]
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0814A120 @ =gUnknown_841CBFD
	movs r1, 0x2
	str r1, [sp]
	movs r1, 0xFF
	str r1, [sp, 0x4]
	str r4, [sp, 0x8]
	movs r1, 0x2
	movs r3, 0
	bl AddTextPrinterParameterized
	ldr r0, [r5]
	ldrb r0, [r0, 0x12]
	movs r1, 0x2
	bl CopyWindowToVram
	b _0814A152
	.align 2, 0
_0814A120: .4byte gUnknown_841CBFD
_0814A124:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _0814A16C
	ldr r0, [r5]
	ldrb r0, [r0, 0x12]
	bl PutWindowTilemap
	ldr r0, [r5]
	ldrb r0, [r0, 0x12]
	movs r1, 0x1
	movs r2, 0xE
	bl DrawTextBorderOuter
	movs r0, 0x17
	movs r1, 0x7
	movs r2, 0
	bl sub_814A7D0
	movs r0, 0
	bl CopyBgTilemapBufferToVram
_0814A152:
	ldr r1, [r5]
	ldrh r0, [r1, 0x4]
	adds r0, 0x1
	strh r0, [r1, 0x4]
	b _0814A16C
_0814A15C:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _0814A16C
	ldr r1, [r5]
	movs r0, 0x1
	str r0, [r1]
_0814A16C:
	add sp, 0xC
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_814A0C8

	thumb_func_start sub_814A174
sub_814A174: @ 814A174
	push {r4,r5,lr}
	sub sp, 0xC
	ldr r5, _0814A18C @ =gUnknown_203F3D8
	ldr r0, [r5]
	ldrh r4, [r0, 0x4]
	cmp r4, 0x1
	beq _0814A1D0
	cmp r4, 0x1
	bgt _0814A190
	cmp r4, 0
	beq _0814A196
	b _0814A20E
	.align 2, 0
_0814A18C: .4byte gUnknown_203F3D8
_0814A190:
	cmp r4, 0x2
	beq _0814A1FE
	b _0814A20E
_0814A196:
	movs r0, 0x2
	movs r1, 0x7
	movs r2, 0x1A
	movs r3, 0x4
	bl sub_814A754
	ldr r1, [r5]
	strh r0, [r1, 0x12]
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0814A1CC @ =gUnknown_841CC42
	movs r1, 0x2
	str r1, [sp]
	movs r1, 0xFF
	str r1, [sp, 0x4]
	str r4, [sp, 0x8]
	movs r1, 0x2
	movs r3, 0
	bl AddTextPrinterParameterized
	ldr r0, [r5]
	ldrb r0, [r0, 0x12]
	movs r1, 0x2
	bl CopyWindowToVram
	b _0814A1F4
	.align 2, 0
_0814A1CC: .4byte gUnknown_841CC42
_0814A1D0:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _0814A20E
	ldr r0, [r5]
	ldrb r0, [r0, 0x12]
	bl PutWindowTilemap
	ldr r0, [r5]
	ldrb r0, [r0, 0x12]
	movs r1, 0x1
	movs r2, 0xE
	bl DrawTextBorderOuter
	movs r0, 0
	bl CopyBgTilemapBufferToVram
_0814A1F4:
	ldr r1, [r5]
	ldrh r0, [r1, 0x4]
	adds r0, 0x1
	strh r0, [r1, 0x4]
	b _0814A20E
_0814A1FE:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _0814A20E
	ldr r1, [r5]
	movs r0, 0x1
	str r0, [r1]
_0814A20E:
	add sp, 0xC
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_814A174

	thumb_func_start sub_814A218
sub_814A218: @ 814A218
	push {r4,r5,lr}
	ldr r5, _0814A22C @ =gUnknown_203F3D8
	ldr r0, [r5]
	ldrh r4, [r0, 0x4]
	cmp r4, 0
	beq _0814A230
	cmp r4, 0x1
	beq _0814A248
	b _0814A25E
	.align 2, 0
_0814A22C: .4byte gUnknown_203F3D8
_0814A230:
	bl sub_814A6CC
	bl DestroyYesNoMenu
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	ldr r1, [r5]
	ldrh r0, [r1, 0x4]
	adds r0, 0x1
	strh r0, [r1, 0x4]
	b _0814A25E
_0814A248:
	bl sub_814A6FC
	cmp r0, 0
	bne _0814A25E
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _0814A25E
	ldr r0, [r5]
	str r4, [r0]
_0814A25E:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_814A218

	thumb_func_start sub_814A264
sub_814A264: @ 814A264
	push {r4,r5,lr}
	sub sp, 0xC
	ldr r5, _0814A27C @ =gUnknown_203F3D8
	ldr r0, [r5]
	ldrh r4, [r0, 0x4]
	cmp r4, 0x1
	beq _0814A2C0
	cmp r4, 0x1
	bgt _0814A280
	cmp r4, 0
	beq _0814A286
	b _0814A2FE
	.align 2, 0
_0814A27C: .4byte gUnknown_203F3D8
_0814A280:
	cmp r4, 0x2
	beq _0814A2EE
	b _0814A2FE
_0814A286:
	movs r0, 0x2
	movs r1, 0x8
	movs r2, 0x16
	movs r3, 0x4
	bl sub_814A754
	ldr r1, [r5]
	strh r0, [r1, 0x12]
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0814A2BC @ =gUnknown_841CC11
	movs r1, 0x2
	str r1, [sp]
	movs r1, 0xFF
	str r1, [sp, 0x4]
	str r4, [sp, 0x8]
	movs r1, 0x2
	movs r3, 0
	bl AddTextPrinterParameterized
	ldr r0, [r5]
	ldrb r0, [r0, 0x12]
	movs r1, 0x2
	bl CopyWindowToVram
	b _0814A2E4
	.align 2, 0
_0814A2BC: .4byte gUnknown_841CC11
_0814A2C0:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _0814A2FE
	ldr r0, [r5]
	ldrb r0, [r0, 0x12]
	bl PutWindowTilemap
	ldr r0, [r5]
	ldrb r0, [r0, 0x12]
	movs r1, 0x1
	movs r2, 0xE
	bl DrawTextBorderOuter
	movs r0, 0
	bl CopyBgTilemapBufferToVram
_0814A2E4:
	ldr r1, [r5]
	ldrh r0, [r1, 0x4]
	adds r0, 0x1
	strh r0, [r1, 0x4]
	b _0814A2FE
_0814A2EE:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _0814A2FE
	ldr r1, [r5]
	movs r0, 0x1
	str r0, [r1]
_0814A2FE:
	add sp, 0xC
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_814A264

	thumb_func_start sub_814A308
sub_814A308: @ 814A308
	push {r4,r5,lr}
	sub sp, 0xC
	ldr r5, _0814A320 @ =gUnknown_203F3D8
	ldr r0, [r5]
	ldrh r4, [r0, 0x4]
	cmp r4, 0x1
	beq _0814A364
	cmp r4, 0x1
	bgt _0814A324
	cmp r4, 0
	beq _0814A32A
	b _0814A3A2
	.align 2, 0
_0814A320: .4byte gUnknown_203F3D8
_0814A324:
	cmp r4, 0x2
	beq _0814A392
	b _0814A3A2
_0814A32A:
	movs r0, 0x7
	movs r1, 0xA
	movs r2, 0x10
	movs r3, 0x2
	bl sub_814A754
	ldr r1, [r5]
	strh r0, [r1, 0x12]
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0814A360 @ =gUnknown_841CC64
	movs r1, 0x2
	str r1, [sp]
	movs r1, 0xFF
	str r1, [sp, 0x4]
	str r4, [sp, 0x8]
	movs r1, 0x2
	movs r3, 0
	bl AddTextPrinterParameterized
	ldr r0, [r5]
	ldrb r0, [r0, 0x12]
	movs r1, 0x2
	bl CopyWindowToVram
	b _0814A388
	.align 2, 0
_0814A360: .4byte gUnknown_841CC64
_0814A364:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _0814A3A2
	ldr r0, [r5]
	ldrb r0, [r0, 0x12]
	bl PutWindowTilemap
	ldr r0, [r5]
	ldrb r0, [r0, 0x12]
	movs r1, 0x1
	movs r2, 0xE
	bl DrawTextBorderOuter
	movs r0, 0
	bl CopyBgTilemapBufferToVram
_0814A388:
	ldr r1, [r5]
	ldrh r0, [r1, 0x4]
	adds r0, 0x1
	strh r0, [r1, 0x4]
	b _0814A3A2
_0814A392:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _0814A3A2
	ldr r1, [r5]
	movs r0, 0x1
	str r0, [r1]
_0814A3A2:
	add sp, 0xC
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_814A308

	thumb_func_start sub_814A3AC
sub_814A3AC: @ 814A3AC
	push {r4,r5,lr}
	ldr r5, _0814A3C0 @ =gUnknown_203F3D8
	ldr r0, [r5]
	ldrh r4, [r0, 0x4]
	cmp r4, 0
	beq _0814A3C4
	cmp r4, 0x1
	beq _0814A3D2
	b _0814A3DE
	.align 2, 0
_0814A3C0: .4byte gUnknown_203F3D8
_0814A3C4:
	bl sub_814B43C
	ldr r1, [r5]
	ldrh r0, [r1, 0x4]
	adds r0, 0x1
	strh r0, [r1, 0x4]
	b _0814A3DE
_0814A3D2:
	bl sub_814B460
	cmp r0, 0
	bne _0814A3DE
	ldr r0, [r5]
	str r4, [r0]
_0814A3DE:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_814A3AC

	thumb_func_start sub_814A3E4
sub_814A3E4: @ 814A3E4
	push {lr}
	ldr r1, _0814A404 @ =gUnknown_203F3D8
	ldr r0, [r1]
	movs r2, 0
	strb r2, [r0, 0xA]
	ldr r0, [r1]
	strb r2, [r0, 0xB]
	ldr r2, [r1]
	movs r0, 0x6
	strb r0, [r2, 0xC]
	ldr r0, [r1]
	ldrb r0, [r0, 0xC]
	bl sub_814A95C
	pop {r0}
	bx r0
	.align 2, 0
_0814A404: .4byte gUnknown_203F3D8
	thumb_func_end sub_814A3E4

	thumb_func_start sub_814A408
sub_814A408: @ 814A408
	push {r4,lr}
	ldr r0, _0814A41C @ =gUnknown_203F3D8
	ldr r2, [r0]
	ldrb r3, [r2, 0xA]
	adds r4, r0, 0
	cmp r3, 0
	beq _0814A420
	cmp r3, 0x1
	beq _0814A45A
	b _0814A45E
	.align 2, 0
_0814A41C: .4byte gUnknown_203F3D8
_0814A420:
	ldrb r0, [r2, 0xB]
	adds r0, 0x1
	strb r0, [r2, 0xB]
	ldr r1, [r4]
	ldrb r0, [r1, 0xB]
	cmp r0, 0xA
	bls _0814A44A
	strb r3, [r1, 0xB]
	ldr r0, [r4]
	ldrb r1, [r0, 0xC]
	adds r1, 0x1
	strb r1, [r0, 0xC]
	ldr r1, [r4]
	ldrb r0, [r1, 0xC]
	cmp r0, 0x9
	bls _0814A44A
	strb r3, [r1, 0xC]
	ldr r1, [r4]
	ldrb r0, [r1, 0xA]
	adds r0, 0x1
	strb r0, [r1, 0xA]
_0814A44A:
	ldr r0, [r4]
	ldrb r0, [r0, 0xC]
	bl sub_814A95C
	ldr r0, [r4]
	ldrb r0, [r0, 0xC]
	cmp r0, 0x7
	bne _0814A45E
_0814A45A:
	movs r0, 0
	b _0814A460
_0814A45E:
	movs r0, 0x1
_0814A460:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_814A408

	thumb_func_start sub_814A468
sub_814A468: @ 814A468
	push {r4-r6,lr}
	sub sp, 0xC
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	lsls r1, 16
	lsrs r6, r1, 16
	ldr r5, _0814A52C @ =gUnknown_203F3D8
	ldr r1, [r5]
	adds r1, 0x26
	adds r0, r4, 0
	bl CopyItemName
	ldr r0, [r5]
	adds r0, 0x66
	adds r1, r6, 0
	movs r2, 0
	movs r3, 0x1
	bl ConvertIntToDecimalStringN
	subs r4, 0x85
	lsls r4, 16
	lsrs r4, 16
	cmp r4, 0x29
	bhi _0814A4C2
	cmp r6, 0x1
	bls _0814A4C2
	ldr r0, [r5]
	adds r0, 0x26
	bl StringLength
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0
	beq _0814A4C2
	ldr r0, [r5]
	adds r0, r1, r0
	adds r0, 0x25
	movs r1, 0xFF
	strb r1, [r0]
	ldr r0, [r5]
	adds r0, 0x26
	ldr r1, _0814A530 @ =gUnknown_846D94C
	bl StringAppend
_0814A4C2:
	bl DynamicPlaceholderTextUtil_Reset
	ldr r4, _0814A52C @ =gUnknown_203F3D8
	ldr r1, [r4]
	adds r1, 0x26
	movs r0, 0
	bl DynamicPlaceholderTextUtil_SetPlaceholderPtr
	ldr r1, [r4]
	adds r1, 0x66
	movs r0, 0x1
	bl DynamicPlaceholderTextUtil_SetPlaceholderPtr
	ldr r0, [r4]
	adds r0, 0xA6
	ldr r1, _0814A534 @ =gUnknown_841CBA9
	bl DynamicPlaceholderTextUtil_ExpandPlaceholders
	movs r0, 0x4
	movs r1, 0x8
	movs r2, 0x16
	movs r3, 0x4
	bl sub_814A754
	ldr r2, [r4]
	movs r5, 0
	movs r3, 0
	strh r0, [r2, 0x12]
	lsls r0, 24
	lsrs r0, 24
	adds r2, 0xA6
	movs r1, 0x2
	str r1, [sp]
	movs r1, 0xFF
	str r1, [sp, 0x4]
	str r3, [sp, 0x8]
	movs r1, 0x2
	bl AddTextPrinterParameterized
	ldr r0, [r4]
	ldrb r0, [r0, 0x12]
	movs r1, 0x2
	bl CopyWindowToVram
	ldr r1, [r4]
	ldr r0, _0814A538 @ =0x00000101
	strh r0, [r1, 0x14]
	strb r5, [r1, 0xD]
	add sp, 0xC
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0814A52C: .4byte gUnknown_203F3D8
_0814A530: .4byte gUnknown_846D94C
_0814A534: .4byte gUnknown_841CBA9
_0814A538: .4byte 0x00000101
	thumb_func_end sub_814A468

	thumb_func_start sub_814A53C
sub_814A53C: @ 814A53C
	push {r4-r6,lr}
	sub sp, 0xC
	lsls r0, 16
	lsrs r0, 16
	ldr r4, _0814A5AC @ =gUnknown_203F3D8
	ldr r1, [r4]
	adds r1, 0x26
	bl CopyItemName
	bl DynamicPlaceholderTextUtil_Reset
	ldr r1, [r4]
	adds r1, 0x26
	movs r0, 0
	bl DynamicPlaceholderTextUtil_SetPlaceholderPtr
	ldr r0, [r4]
	adds r0, 0xA6
	ldr r1, _0814A5B0 @ =gUnknown_841CBCA
	bl DynamicPlaceholderTextUtil_ExpandPlaceholders
	movs r0, 0x4
	movs r1, 0x8
	movs r2, 0x16
	movs r3, 0x4
	bl sub_814A754
	ldr r2, [r4]
	movs r6, 0
	movs r5, 0
	strh r0, [r2, 0x12]
	lsls r0, 24
	lsrs r0, 24
	adds r2, 0xA6
	movs r1, 0x2
	str r1, [sp]
	movs r1, 0xFF
	str r1, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r1, 0x2
	movs r3, 0
	bl AddTextPrinterParameterized
	ldr r0, [r4]
	ldrb r0, [r0, 0x12]
	movs r1, 0x2
	bl CopyWindowToVram
	ldr r0, [r4]
	strh r5, [r0, 0x14]
	strb r6, [r0, 0xD]
	add sp, 0xC
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0814A5AC: .4byte gUnknown_203F3D8
_0814A5B0: .4byte gUnknown_841CBCA
	thumb_func_end sub_814A53C

	thumb_func_start sub_814A5B4
sub_814A5B4: @ 814A5B4
	push {r4-r6,lr}
	sub sp, 0xC
	lsls r0, 16
	lsrs r0, 16
	ldr r4, _0814A624 @ =gUnknown_203F3D8
	ldr r1, [r4]
	adds r1, 0x26
	bl CopyItemName
	bl DynamicPlaceholderTextUtil_Reset
	ldr r1, [r4]
	adds r1, 0x26
	movs r0, 0
	bl DynamicPlaceholderTextUtil_SetPlaceholderPtr
	ldr r0, [r4]
	adds r0, 0xA6
	ldr r1, _0814A628 @ =gUnknown_841CBE4
	bl DynamicPlaceholderTextUtil_ExpandPlaceholders
	movs r0, 0x4
	movs r1, 0x9
	movs r2, 0x16
	movs r3, 0x2
	bl sub_814A754
	ldr r2, [r4]
	movs r6, 0
	movs r5, 0
	strh r0, [r2, 0x12]
	lsls r0, 24
	lsrs r0, 24
	adds r2, 0xA6
	movs r1, 0x2
	str r1, [sp]
	movs r1, 0xFF
	str r1, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r1, 0x2
	movs r3, 0
	bl AddTextPrinterParameterized
	ldr r0, [r4]
	ldrb r0, [r0, 0x12]
	movs r1, 0x2
	bl CopyWindowToVram
	ldr r0, [r4]
	strh r5, [r0, 0x14]
	strb r6, [r0, 0xD]
	add sp, 0xC
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0814A624: .4byte gUnknown_203F3D8
_0814A628: .4byte gUnknown_841CBE4
	thumb_func_end sub_814A5B4

	thumb_func_start sub_814A62C
sub_814A62C: @ 814A62C
	push {r4,lr}
	ldr r4, _0814A644 @ =gUnknown_203F3D8
	ldr r0, [r4]
	ldrb r0, [r0, 0xD]
	cmp r0, 0x1
	beq _0814A680
	cmp r0, 0x1
	bgt _0814A648
	cmp r0, 0
	beq _0814A652
	b _0814A6C4
	.align 2, 0
_0814A644: .4byte gUnknown_203F3D8
_0814A648:
	cmp r0, 0x2
	beq _0814A6A6
	cmp r0, 0x3
	beq _0814A6BA
	b _0814A6C4
_0814A652:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _0814A6C4
	ldr r0, [r4]
	ldrb r0, [r0, 0x12]
	bl PutWindowTilemap
	ldr r0, [r4]
	ldrb r0, [r0, 0x12]
	movs r1, 0x1
	movs r2, 0xE
	bl DrawTextBorderOuter
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	ldr r1, [r4]
	ldrb r0, [r1, 0xD]
	adds r0, 0x1
	strb r0, [r1, 0xD]
	b _0814A6C4
_0814A680:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _0814A6C4
	ldr r1, [r4]
	ldrh r0, [r1, 0x14]
	cmp r0, 0
	bne _0814A698
	ldrb r0, [r1, 0xD]
	adds r0, 0x2
	b _0814A6B8
_0814A698:
	ldrh r0, [r1, 0x14]
	bl PlayFanfare
	ldr r1, [r4]
	ldrb r0, [r1, 0xD]
	adds r0, 0x1
	strb r0, [r1, 0xD]
_0814A6A6:
	bl IsFanfareTaskInactive
	lsls r0, 24
	cmp r0, 0
	beq _0814A6C4
	ldr r0, _0814A6C0 @ =gUnknown_203F3D8
	ldr r1, [r0]
	ldrb r0, [r1, 0xD]
	adds r0, 0x1
_0814A6B8:
	strb r0, [r1, 0xD]
_0814A6BA:
	movs r0, 0
	b _0814A6C6
	.align 2, 0
_0814A6C0: .4byte gUnknown_203F3D8
_0814A6C4:
	movs r0, 0x1
_0814A6C6:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_814A62C

	thumb_func_start sub_814A6CC
sub_814A6CC: @ 814A6CC
	push {r4,lr}
	ldr r4, _0814A6F8 @ =gUnknown_203F3D8
	ldr r0, [r4]
	ldrh r0, [r0, 0x12]
	cmp r0, 0xFF
	beq _0814A6F0
	lsls r0, 24
	lsrs r0, 24
	bl rbox_fill_rectangle
	ldr r0, [r4]
	ldrb r0, [r0, 0x12]
	movs r1, 0x1
	bl CopyWindowToVram
	ldr r1, [r4]
	movs r0, 0
	strb r0, [r1, 0xD]
_0814A6F0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0814A6F8: .4byte gUnknown_203F3D8
	thumb_func_end sub_814A6CC

	thumb_func_start sub_814A6FC
sub_814A6FC: @ 814A6FC
	push {r4,lr}
	ldr r4, _0814A70C @ =gUnknown_203F3D8
	ldr r1, [r4]
	ldrh r0, [r1, 0x12]
	cmp r0, 0xFF
	bne _0814A710
_0814A708:
	movs r0, 0
	b _0814A73C
	.align 2, 0
_0814A70C: .4byte gUnknown_203F3D8
_0814A710:
	ldrb r0, [r1, 0xD]
	cmp r0, 0
	bne _0814A736
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _0814A73A
	ldr r0, [r4]
	ldrb r0, [r0, 0x12]
	bl RemoveWindow
	ldr r1, [r4]
	movs r0, 0xFF
	strh r0, [r1, 0x12]
	ldrb r0, [r1, 0xD]
	adds r0, 0x1
	strb r0, [r1, 0xD]
	b _0814A708
_0814A736:
	cmp r0, 0x1
	beq _0814A708
_0814A73A:
	movs r0, 0x1
_0814A73C:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_814A6FC

	thumb_func_start sub_814A744
sub_814A744: @ 814A744
	push {lr}
	bl Menu_ProcessInputNoWrapClearOnChoose
	lsls r0, 24
	asrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end sub_814A744

	thumb_func_start sub_814A754
sub_814A754: @ 814A754
	push {r4-r6,lr}
	sub sp, 0x8
	ldr r6, _0814A7BC @ =0xffffff00
	ldr r4, [sp]
	ands r4, r6
	lsls r0, 24
	lsrs r0, 16
	ldr r5, _0814A7C0 @ =0xffff00ff
	ands r4, r5
	orrs r4, r0
	lsls r1, 24
	lsrs r1, 8
	ldr r0, _0814A7C4 @ =0xff00ffff
	ands r4, r0
	orrs r4, r1
	lsls r2, 24
	ldr r0, _0814A7C8 @ =0x00ffffff
	ands r4, r0
	orrs r4, r2
	str r4, [sp]
	lsls r3, 24
	lsrs r3, 24
	ldr r0, [sp, 0x4]
	ands r0, r6
	orrs r0, r3
	ands r0, r5
	movs r1, 0xF0
	lsls r1, 4
	orrs r0, r1
	ldr r1, _0814A7CC @ =0x0000ffff
	ands r0, r1
	movs r1, 0x86
	lsls r1, 15
	orrs r0, r1
	str r0, [sp, 0x4]
	mov r0, sp
	bl AddWindow
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	lsls r0, r4, 24
	lsrs r0, 24
	movs r1, 0x11
	bl FillWindowPixelBuffer
	adds r0, r4, 0
	add sp, 0x8
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0814A7BC: .4byte 0xffffff00
_0814A7C0: .4byte 0xffff00ff
_0814A7C4: .4byte 0xff00ffff
_0814A7C8: .4byte 0x00ffffff
_0814A7CC: .4byte 0x0000ffff
	thumb_func_end sub_814A754

	thumb_func_start sub_814A7D0
sub_814A7D0: @ 814A7D0
	push {r4,r5,lr}
	sub sp, 0x14
	lsls r2, 24
	lsrs r2, 24
	ldr r5, _0814A838 @ =0xffffff00
	ldr r3, [sp, 0xC]
	ands r3, r5
	lsls r0, 24
	lsrs r0, 16
	ldr r4, _0814A83C @ =0xffff00ff
	ands r3, r4
	orrs r3, r0
	lsls r1, 24
	lsrs r1, 8
	ldr r0, _0814A840 @ =0xff00ffff
	ands r3, r0
	orrs r3, r1
	ldr r0, _0814A844 @ =0x00ffffff
	ands r3, r0
	movs r0, 0xC0
	lsls r0, 19
	orrs r3, r0
	str r3, [sp, 0xC]
	ldr r0, [sp, 0x10]
	ands r0, r5
	movs r1, 0x4
	orrs r0, r1
	ands r0, r4
	movs r1, 0x80
	lsls r1, 2
	orrs r0, r1
	ldr r1, _0814A848 @ =0x0000ffff
	ands r0, r1
	movs r1, 0xAC
	lsls r1, 14
	orrs r0, r1
	str r0, [sp, 0x10]
	movs r0, 0xA
	str r0, [sp]
	movs r0, 0xD
	str r0, [sp, 0x4]
	str r2, [sp, 0x8]
	add r0, sp, 0xC
	movs r1, 0x2
	movs r2, 0
	movs r3, 0x2
	bl CreateYesNoMenu
	add sp, 0x14
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0814A838: .4byte 0xffffff00
_0814A83C: .4byte 0xffff00ff
_0814A840: .4byte 0xff00ffff
_0814A844: .4byte 0x00ffffff
_0814A848: .4byte 0x0000ffff
	thumb_func_end sub_814A7D0

	thumb_func_start sub_814A84C
sub_814A84C: @ 814A84C
	push {r4,lr}
	sub sp, 0x10
	ldr r1, _0814A8AC @ =gUnknown_846D950
	add r0, sp, 0xC
	movs r2, 0x3
	bl memcpy
	movs r0, 0
	bl PutWindowTilemap
	movs r0, 0x1
	bl PutWindowTilemap
	movs r0, 0
	movs r1, 0
	bl FillWindowPixelBuffer
	movs r0, 0x1
	movs r1, 0
	bl FillWindowPixelBuffer
	add r0, sp, 0xC
	str r0, [sp]
	movs r4, 0
	str r4, [sp, 0x4]
	ldr r0, _0814A8B0 @ =gUnknown_841CB52
	str r0, [sp, 0x8]
	movs r0, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0x2
	bl AddTextPrinterParameterized3
	add r0, sp, 0xC
	str r0, [sp]
	str r4, [sp, 0x4]
	ldr r0, _0814A8B4 @ =gUnknown_841CB5A
	str r0, [sp, 0x8]
	movs r0, 0x1
	movs r1, 0
	movs r2, 0
	movs r3, 0x2
	bl AddTextPrinterParameterized3
	add sp, 0x10
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0814A8AC: .4byte gUnknown_846D950
_0814A8B0: .4byte gUnknown_841CB52
_0814A8B4: .4byte gUnknown_841CB5A
	thumb_func_end sub_814A84C

	thumb_func_start sub_814A8B8
sub_814A8B8: @ 814A8B8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	bl sub_81499A4
	lsls r0, 16
	lsrs r0, 16
	mov r10, r0
	ldr r1, _0814A934 @ =gUnknown_846D9D4
	subs r0, 0x2
	lsls r0, 2
	adds r0, r1
	ldr r5, [r0]
	movs r6, 0
	cmp r6, r10
	bge _0814A922
	ldr r0, _0814A938 @ =gMonFrontPicCoords
	mov r9, r0
	ldr r1, _0814A93C @ =gUnknown_203F3D8
	mov r8, r1
_0814A8E6:
	lsls r4, r6, 24
	lsrs r4, 24
	adds r0, r4, 0
	bl sub_81499C0
	adds r1, r0, 0
	ldrh r0, [r1]
	lsls r0, 2
	add r0, r9
	ldrb r3, [r0, 0x1]
	mov r2, r8
	ldr r0, [r2]
	movs r7, 0
	ldrsh r2, [r5, r7]
	adds r3, 0x70
	str r4, [sp]
	bl sub_814ADCC
	mov r1, r8
	ldr r0, [r1]
	movs r2, 0
	ldrsh r1, [r5, r2]
	movs r2, 0x70
	adds r3, r4, 0
	bl sub_814B240
	adds r5, 0x2
	adds r6, 0x1
	cmp r6, r10
	blt _0814A8E6
_0814A922:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0814A934: .4byte gUnknown_846D9D4
_0814A938: .4byte gMonFrontPicCoords
_0814A93C: .4byte gUnknown_203F3D8
	thumb_func_end sub_814A8B8

	thumb_func_start sub_814A940
sub_814A940: @ 814A940
	ldr r2, _0814A954 @ =gUnknown_203F3D8
	ldr r2, [r2]
	lsls r0, 2
	ldr r3, _0814A958 @ =0x000081a8
	adds r2, r3
	adds r2, r0
	ldr r0, [r2]
	strh r1, [r0, 0x26]
	bx lr
	.align 2, 0
_0814A954: .4byte gUnknown_203F3D8
_0814A958: .4byte 0x000081a8
	thumb_func_end sub_814A940

	thumb_func_start sub_814A95C
sub_814A95C: @ 814A95C
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _0814A984 @ =gUnknown_203F3D8
	ldr r0, [r0]
	adds r1, r4, 0
	bl sub_814B348
	ldr r0, _0814A988 @ =gUnknown_846D953
	adds r4, r0
	ldrb r0, [r4]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 13
	movs r0, 0x2
	movs r2, 0
	bl ChangeBgY
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0814A984: .4byte gUnknown_203F3D8
_0814A988: .4byte gUnknown_846D953
	thumb_func_end sub_814A95C

	thumb_func_start sub_814A98C
sub_814A98C: @ 814A98C
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	movs r5, 0
	movs r6, 0
_0814A996:
	movs r0, 0x1
	ands r0, r4
	cmp r0, 0
	beq _0814A9AA
	ldr r0, _0814A9C4 @ =gUnknown_203F3D8
	ldr r0, [r0]
	adds r1, r5, 0
	bl sub_814AF0C
	adds r6, 0x1
_0814A9AA:
	lsrs r4, 1
	adds r5, 0x1
	cmp r5, 0x4
	ble _0814A996
	subs r0, r6, 0x2
	lsls r0, 24
	lsrs r0, 24
	bl sub_814ACCC
	adds r0, r6, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0814A9C4: .4byte gUnknown_203F3D8
	thumb_func_end sub_814A98C

	thumb_func_start sub_814A9C8
sub_814A9C8: @ 814A9C8
	push {r4,lr}
	sub sp, 0x10
	mov r1, sp
	movs r0, 0x40 @ strConvMode = 0
	              @ shape = SPRITE_SHAPE(8x8)
	              @ size = SPRITE_SIZE(8x8)
	              @ priority = 1
	strb r0, [r1]
	movs r0, 0x5
	strb r0, [r1, 0x1]
	movs r0, 0x8
	strb r0, [r1, 0x2]
	movs r0, 0x6C
	strh r0, [r1, 0x4]
	movs r4, 0x6
	strh r4, [r1, 0x6]
	ldr r0, _0814AA1C @ =gUnknown_846D960
	str r0, [sp, 0x8]
	ldr r0, _0814AA20 @ =gUnknown_846D968
	str r0, [sp, 0xC]
	movs r0, 0x2
	bl DigitObjUtil_Init
	movs r0, 0
	movs r1, 0
	mov r2, sp
	bl DigitObjUtil_CreatePrinter
	mov r1, sp
	movs r0, 0x4
	strb r0, [r1, 0x1]
	movs r0, 0x1E
	strh r0, [r1, 0x4]
	mov r0, sp
	strh r4, [r0, 0x6]
	movs r0, 0x1
	movs r1, 0
	mov r2, sp
	bl DigitObjUtil_CreatePrinter
	add sp, 0x10
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0814AA1C: .4byte gUnknown_846D960
_0814AA20: .4byte gUnknown_846D968
	thumb_func_end sub_814A9C8

	thumb_func_start sub_814AA24
sub_814AA24: @ 814AA24
	push {lr}
	adds r1, r0, 0
	movs r0, 0
	bl DigitObjUtil_PrintNumOn
	pop {r0}
	bx r0
	thumb_func_end sub_814AA24

	thumb_func_start sub_814AA34
sub_814AA34: @ 814AA34
	push {lr}
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x1
	bl DigitObjUtil_PrintNumOn
	pop {r0}
	bx r0
	thumb_func_end sub_814AA34

	thumb_func_start sub_814AA48
sub_814AA48: @ 814AA48
	push {lr}
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r0, _0814AA5C @ =gUnknown_203F3D8
	ldr r0, [r0]
	bl sub_814AFE8
	pop {r0}
	bx r0
	.align 2, 0
_0814AA5C: .4byte gUnknown_203F3D8
	thumb_func_end sub_814AA48

	thumb_func_start sub_814AA60
sub_814AA60: @ 814AA60
	push {lr}
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r0, _0814AA74 @ =gUnknown_203F3D8
	ldr r0, [r0]
	bl sub_814B080
	pop {r0}
	bx r0
	.align 2, 0
_0814AA74: .4byte gUnknown_203F3D8
	thumb_func_end sub_814AA60

	thumb_func_start sub_814AA78
sub_814AA78: @ 814AA78
	push {lr}
	adds r1, r0, 0
	ldr r0, _0814AA88 @ =gUnknown_203F3D8
	ldr r0, [r0]
	bl sub_814B010
	pop {r1}
	bx r1
	.align 2, 0
_0814AA88: .4byte gUnknown_203F3D8
	thumb_func_end sub_814AA78

	thumb_func_start sub_814AA8C
sub_814AA8C: @ 814AA8C
	push {lr}
	ldr r0, _0814AA9C @ =gUnknown_203F3D8
	ldr r0, [r0]
	bl sub_814B0A8
	pop {r0}
	bx r0
	.align 2, 0
_0814AA9C: .4byte gUnknown_203F3D8
	thumb_func_end sub_814AA8C

	thumb_func_start sub_814AAA0
sub_814AAA0: @ 814AAA0
	push {lr}
	ldr r0, _0814AAB0 @ =gUnknown_203F3D8
	ldr r0, [r0]
	bl sub_814B134
	pop {r0}
	bx r0
	.align 2, 0
_0814AAB0: .4byte gUnknown_203F3D8
	thumb_func_end sub_814AAA0

	thumb_func_start sub_814AAB4
sub_814AAB4: @ 814AAB4
	push {lr}
	adds r1, r0, 0
	ldr r0, _0814AAC4 @ =gUnknown_203F3D8
	ldr r0, [r0]
	bl sub_814B168
	pop {r0}
	bx r0
	.align 2, 0
_0814AAC4: .4byte gUnknown_203F3D8
	thumb_func_end sub_814AAB4

	thumb_func_start sub_814AAC8
sub_814AAC8: @ 814AAC8
	push {lr}
	ldr r0, _0814AAD8 @ =gUnknown_203F3D8
	ldr r0, [r0]
	bl sub_814B190
	pop {r1}
	bx r1
	.align 2, 0
_0814AAD8: .4byte gUnknown_203F3D8
	thumb_func_end sub_814AAC8

	thumb_func_start sub_814AADC
sub_814AADC: @ 814AADC
	push {r4-r7,lr}
	sub sp, 0x8
	bl sub_81499A4
	lsls r0, 16
	lsrs r7, r0, 16
	ldr r1, _0814AB7C @ =gUnknown_846D9A8
	subs r0, r7, 0x2
	lsls r0, 2
	adds r0, r1
	ldr r4, [r0]
	ldr r2, _0814AB80 @ =0xffffff00
	ldr r0, [sp]
	ands r0, r2
	ldr r1, _0814AB84 @ =0x00ffffff
	ands r0, r1
	movs r1, 0x80
	lsls r1, 20
	orrs r0, r1
	str r0, [sp]
	ldr r0, [sp, 0x4]
	ands r0, r2
	movs r1, 0x2
	orrs r0, r1
	ldr r1, _0814AB88 @ =0xffff00ff
	ands r0, r1
	movs r1, 0x80
	lsls r1, 2
	orrs r0, r1
	ldr r1, _0814AB8C @ =0x0000ffff
	ands r0, r1
	movs r1, 0xAC
	lsls r1, 14
	orrs r0, r1
	str r0, [sp, 0x4]
	movs r5, 0
	cmp r5, r7
	bge _0814AB6C
	mov r6, sp
_0814AB2A:
	ldrb r0, [r4]
	lsls r0, 8
	ldr r2, _0814AB88 @ =0xffff00ff
	ldr r1, [sp]
	ands r1, r2
	orrs r1, r0
	str r1, [sp]
	ldrb r2, [r4, 0x2]
	lsls r2, 16
	ldr r0, _0814AB90 @ =0xff00ffff
	ands r0, r1
	orrs r0, r2
	str r0, [sp]
	mov r0, sp
	bl AddWindow
	ldr r1, _0814AB94 @ =gUnknown_203F3D8
	ldr r1, [r1]
	lsls r2, r5, 1
	adds r1, 0x1C
	adds r1, r2
	strh r0, [r1]
	lsls r0, 24
	lsrs r0, 24
	bl ClearWindowTilemap
	ldrh r0, [r6, 0x6]
	adds r0, 0x10
	strh r0, [r6, 0x6]
	adds r4, 0x4
	adds r5, 0x1
	cmp r5, r7
	blt _0814AB2A
_0814AB6C:
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	add sp, 0x8
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0814AB7C: .4byte gUnknown_846D9A8
_0814AB80: .4byte 0xffffff00
_0814AB84: .4byte 0x00ffffff
_0814AB88: .4byte 0xffff00ff
_0814AB8C: .4byte 0x0000ffff
_0814AB90: .4byte 0xff00ffff
_0814AB94: .4byte gUnknown_203F3D8
	thumb_func_end sub_814AADC

	thumb_func_start sub_814AB98
sub_814AB98: @ 814AB98
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	sub sp, 0x10
	adds r5, r0, 0
	lsls r2, 24
	lsrs r2, 24
	lsls r3, 24
	lsrs r3, 24
	add r0, sp, 0xC
	strb r1, [r0]
	strb r2, [r0, 0x1]
	strb r3, [r0, 0x2]
	ldr r6, _0814AC2C @ =gUnknown_203F3D8
	ldr r0, [r6]
	lsls r1, r5, 1
	mov r8, r1
	adds r0, 0x1C
	add r0, r8
	ldrb r0, [r0]
	movs r1, 0
	bl FillWindowPixelBuffer
	lsls r5, 24
	lsrs r5, 24
	adds r0, r5, 0
	bl sub_81499E0
	adds r1, r0, 0
	movs r2, 0x1
	negs r2, r2
	mov r9, r2
	movs r0, 0
	bl GetStringWidth
	movs r4, 0x40
	subs r4, r0
	lsrs r4, 1
	adds r0, r5, 0
	bl sub_81499E0
	adds r1, r0, 0
	ldr r0, [r6]
	adds r0, 0x1C
	add r0, r8
	ldrb r0, [r0]
	lsls r4, 24
	lsrs r4, 24
	add r2, sp, 0xC
	str r2, [sp]
	mov r2, r9
	str r2, [sp, 0x4]
	str r1, [sp, 0x8]
	movs r1, 0
	adds r2, r4, 0
	movs r3, 0x2
	bl AddTextPrinterParameterized3
	ldr r0, [r6]
	adds r0, 0x1C
	add r0, r8
	ldrb r0, [r0]
	movs r1, 0x2
	bl CopyWindowToVram
	add sp, 0x10
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0814AC2C: .4byte gUnknown_203F3D8
	thumb_func_end sub_814AB98

	thumb_func_start sub_814AC30
sub_814AC30: @ 814AC30
	push {r4-r6,lr}
	adds r4, r0, 0
	bl sub_81499A4
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r4, 0
	bne _0814AC5A
	movs r4, 0
	cmp r4, r5
	bge _0814AC8C
_0814AC46:
	adds r0, r4, 0
	movs r1, 0
	movs r2, 0x2
	movs r3, 0x3
	bl sub_814AB98
	adds r4, 0x1
	cmp r4, r5
	blt _0814AC46
	b _0814AC8C
_0814AC5A:
	bl sub_81499B4
	lsls r0, 16
	lsrs r6, r0, 16
	movs r4, 0
	cmp r4, r5
	bge _0814AC8C
_0814AC68:
	cmp r6, r4
	beq _0814AC7A
	adds r0, r4, 0
	movs r1, 0
	movs r2, 0x2
	movs r3, 0x3
	bl sub_814AB98
	b _0814AC86
_0814AC7A:
	adds r0, r4, 0
	movs r1, 0
	movs r2, 0x4
	movs r3, 0x5
	bl sub_814AB98
_0814AC86:
	adds r4, 0x1
	cmp r4, r5
	blt _0814AC68
_0814AC8C:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_814AC30

	thumb_func_start sub_814AC94
sub_814AC94: @ 814AC94
	push {r4,r5,lr}
	bl sub_81499A4
	lsls r0, 16
	lsrs r5, r0, 16
	movs r4, 0
	cmp r4, r5
	bge _0814ACBA
_0814ACA4:
	ldr r0, _0814ACC8 @ =gUnknown_203F3D8
	ldr r0, [r0]
	lsls r1, r4, 1
	adds r0, 0x1C
	adds r0, r1
	ldrb r0, [r0]
	bl PutWindowTilemap
	adds r4, 0x1
	cmp r4, r5
	blt _0814ACA4
_0814ACBA:
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0814ACC8: .4byte gUnknown_203F3D8
	thumb_func_end sub_814AC94

	thumb_func_start sub_814ACCC
sub_814ACCC: @ 814ACCC
	push {r4,lr}
	adds r1, r0, 0
	lsls r1, 24
	lsrs r4, r1, 24
	ldr r0, _0814AD10 @ =gUnknown_203F3D8
	ldr r2, [r0]
	movs r0, 0
	str r0, [r2, 0x18]
	lsrs r1, 25
	lsls r1, 16
	movs r0, 0x1
	movs r2, 0
	bl ChangeBgX
	movs r0, 0x1
	ands r4, r0
	lsls r4, 8
	subs r4, 0x28
	lsls r4, 8
	adds r1, r4, 0
	movs r2, 0
	bl ChangeBgY
	movs r0, 0x1
	bl ShowBg
	ldr r0, _0814AD14 @ =sub_814AD50
	movs r1, 0x4
	bl CreateTask
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0814AD10: .4byte gUnknown_203F3D8
_0814AD14: .4byte sub_814AD50
	thumb_func_end sub_814ACCC

	thumb_func_start sub_814AD18
sub_814AD18: @ 814AD18
	push {r4,lr}
	ldr r4, _0814AD28 @ =gUnknown_203F3D8
	ldr r0, [r4]
	ldr r0, [r0, 0x18]
	cmp r0, 0x1F
	bls _0814AD2C
	movs r0, 0
	b _0814AD4A
	.align 2, 0
_0814AD28: .4byte gUnknown_203F3D8
_0814AD2C:
	movs r0, 0x1
	movs r1, 0x80
	movs r2, 0x1
	bl ChangeBgY
	ldr r1, [r4]
	ldr r0, [r1, 0x18]
	adds r0, 0x1
	str r0, [r1, 0x18]
	cmp r0, 0x1F
	bls _0814AD48
	movs r0, 0x1
	bl HideBg
_0814AD48:
	movs r0, 0x1
_0814AD4A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_814AD18

	thumb_func_start sub_814AD50
sub_814AD50: @ 814AD50
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_814AD18
	cmp r0, 0
	bne _0814AD64
	adds r0, r4, 0
	bl DestroyTask
_0814AD64:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_814AD50

	thumb_func_start sub_814AD6C
sub_814AD6C: @ 814AD6C
	push {r4-r6,lr}
	adds r6, r0, 0
	movs r4, 0
	ldr r5, _0814ADAC @ =gUnknown_846E0B0
_0814AD74:
	adds r0, r5, 0
	bl LoadCompressedSpriteSheet
	adds r5, 0x8
	adds r4, 0x1
	cmp r4, 0x4
	bls _0814AD74
	movs r4, 0
	ldr r5, _0814ADB0 @ =gUnknown_846E0D8
_0814AD86:
	adds r0, r5, 0
	bl LoadSpritePalette
	adds r5, 0x8
	adds r4, 0x1
	cmp r4, 0x1
	bls _0814AD86
	movs r0, 0x5
	bl IndexOfSpritePaletteTag
	strb r0, [r6, 0xE]
	movs r0, 0x6
	bl IndexOfSpritePaletteTag
	strb r0, [r6, 0xF]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0814ADAC: .4byte gUnknown_846E0B0
_0814ADB0: .4byte gUnknown_846E0D8
	thumb_func_end sub_814AD6C

	thumb_func_start sub_814ADB4
sub_814ADB4: @ 814ADB4
	push {lr}
	movs r2, 0
	movs r1, 0x7
	adds r0, 0x3C
_0814ADBC:
	strh r2, [r0]
	subs r0, 0x2
	subs r1, 0x1
	cmp r1, 0
	bge _0814ADBC
	pop {r0}
	bx r0
	thumb_func_end sub_814ADB4

	thumb_func_start sub_814ADCC
sub_814ADCC: @ 814ADCC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x34
	mov r9, r0
	adds r7, r1, 0
	ldr r0, [sp, 0x54]
	lsls r2, 16
	lsrs r2, 16
	str r2, [sp, 0x28]
	lsls r3, 16
	lsrs r3, 16
	str r3, [sp, 0x2C]
	lsls r0, 24
	lsrs r6, r0, 24
	mov r1, sp
	ldr r0, _0814AE20 @ =gUnknown_846E0E8
	ldm r0!, {r2-r4}
	stm r1!, {r2-r4}
	ldm r0!, {r2-r4}
	stm r1!, {r2-r4}
	movs r0, 0x80
	lsls r0, 6
	bl Alloc
	mov r8, r0
	movs r0, 0x80
	lsls r0, 4
	bl Alloc
	mov r10, r0
	bl sub_81499B4
	lsls r0, 16
	lsrs r0, 16
	cmp r6, r0
	bne _0814AE24
	movs r0, 0x3
	b _0814AE2A
	.align 2, 0
_0814AE20: .4byte gUnknown_846E0E8
_0814AE24:
	adds r0, r6, 0x4
	lsls r0, 24
	lsrs r0, 24
_0814AE2A:
	str r0, [sp, 0x30]
	mov r1, r8
	cmp r1, 0
	beq _0814AEEC
	mov r2, r10
	cmp r2, 0
	beq _0814AEEC
	ldrh r2, [r7]
	lsls r0, r2, 3
	ldr r1, _0814AED8 @ =gMonFrontPicTable
	adds r0, r1
	ldr r3, [r7, 0x8]
	mov r1, r8
	bl HandleLoadSpecialPokePic
	mov r3, r8
	str r3, [sp, 0x18]
	adds r4, r6, 0
	add r0, sp, 0x18
	ldr r5, _0814AEDC @ =0xffff0000
	lsls r1, r4, 16
	movs r2, 0x80
	lsls r2, 4
	orrs r1, r2
	str r1, [r0, 0x4]
	bl LoadSpriteSheet
	ldrh r0, [r7]
	ldr r1, [r7, 0x4]
	ldr r2, [r7, 0x8]
	bl GetMonSpritePalFromSpeciesAndPersonality
	str r0, [sp, 0x20]
	add r0, sp, 0x20
	ldr r1, [r0, 0x4]
	ands r1, r5
	orrs r1, r4
	str r1, [r0, 0x4]
	bl LoadCompressedSpritePalette
	mov r0, r8
	bl Free
	mov r0, r10
	bl Free
	mov r1, sp
	mov r0, sp
	ldrh r0, [r0]
	adds r0, r6
	strh r0, [r1]
	mov r0, sp
	ldrh r0, [r0, 0x2]
	adds r0, r6
	strh r0, [r1, 0x2]
	ldr r4, [sp, 0x28]
	lsls r1, r4, 16
	asrs r1, 16
	ldr r0, [sp, 0x2C]
	lsls r2, r0, 16
	asrs r2, 16
	mov r0, sp
	ldr r3, [sp, 0x30]
	bl CreateSprite
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x40
	beq _0814AEEC
	lsls r0, r6, 2
	ldr r2, _0814AEE0 @ =0x000081a8
	add r2, r9
	adds r2, r0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0814AEE4 @ =gSprites
	adds r0, r1
	str r0, [r2]
	ldr r0, _0814AEE8 @ =0x000081fc
	add r0, r9
	adds r0, r6
	add r1, sp, 0x30
	ldrb r1, [r1]
	strb r1, [r0]
	b _0814AEF8
	.align 2, 0
_0814AED8: .4byte gMonFrontPicTable
_0814AEDC: .4byte 0xffff0000
_0814AEE0: .4byte 0x000081a8
_0814AEE4: .4byte gSprites
_0814AEE8: .4byte 0x000081fc
_0814AEEC:
	lsls r0, r6, 2
	ldr r1, _0814AF08 @ =0x000081a8
	add r1, r9
	adds r1, r0
	movs r0, 0
	str r0, [r1]
_0814AEF8:
	add sp, 0x34
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0814AF08: .4byte 0x000081a8
	thumb_func_end sub_814ADCC

	thumb_func_start sub_814AF0C
sub_814AF0C: @ 814AF0C
	push {r4-r6,lr}
	adds r4, r0, 0
	lsls r6, r1, 2
	ldr r0, _0814AF64 @ =0x000081bc
	adds r5, r4, r0
	adds r5, r6
	ldr r0, [r5]
	bl sub_814ADB4
	ldr r2, [r5]
	ldr r0, _0814AF68 @ =0x000081a8
	adds r4, r0
	adds r4, r6
	ldr r1, [r4]
	ldr r0, _0814AF6C @ =gSprites
	subs r1, r0
	lsls r0, r1, 4
	subs r0, r1
	lsls r1, r0, 8
	adds r0, r1
	lsls r1, r0, 16
	adds r0, r1
	negs r0, r0
	asrs r0, 2
	strh r0, [r2, 0x3C]
	ldr r1, [r5]
	adds r1, 0x3E
	ldrb r2, [r1]
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	strb r0, [r1]
	ldr r1, [r5]
	movs r0, 0x60
	strh r0, [r1, 0x22]
	ldr r0, [r5]
	ldr r1, _0814AF70 @ =sub_814AF74
	str r1, [r0, 0x1C]
	movs r1, 0x1
	bl StartSpriteAnim
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0814AF64: .4byte 0x000081bc
_0814AF68: .4byte 0x000081a8
_0814AF6C: .4byte gSprites
_0814AF70: .4byte sub_814AF74
	thumb_func_end sub_814AF0C

	thumb_func_start sub_814AF74
sub_814AF74: @ 814AF74
	push {lr}
	adds r2, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r2, r1]
	cmp r0, 0x1
	beq _0814AFA0
	cmp r0, 0x1
	bgt _0814AF8A
	cmp r0, 0
	beq _0814AF90
	b _0814AFDE
_0814AF8A:
	cmp r0, 0x2
	beq _0814AFC0
	b _0814AFDE
_0814AF90:
	adds r0, r2, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _0814AFDE
	b _0814AFCE
_0814AFA0:
	ldrh r1, [r2, 0x22]
	subs r1, 0x1
	strh r1, [r2, 0x22]
	ldrh r0, [r2, 0x30]
	adds r0, 0x1
	strh r0, [r2, 0x30]
	lsls r1, 16
	asrs r1, 16
	cmp r1, 0x48
	bgt _0814AFDE
	movs r0, 0x48
	strh r0, [r2, 0x22]
	ldrh r0, [r2, 0x2E]
	adds r0, 0x1
	strh r0, [r2, 0x2E]
	b _0814AFDE
_0814AFC0:
	ldrh r0, [r2, 0x30]
	adds r0, 0x1
	strh r0, [r2, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x2F
	ble _0814AFDE
_0814AFCE:
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r0, [r3]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r3]
	ldr r0, _0814AFE4 @ =SpriteCallbackDummy
	str r0, [r2, 0x1C]
_0814AFDE:
	pop {r0}
	bx r0
	.align 2, 0
_0814AFE4: .4byte SpriteCallbackDummy
	thumb_func_end sub_814AF74

	thumb_func_start sub_814AFE8
sub_814AFE8: @ 814AFE8
	push {lr}
	lsls r1, 2
	ldr r2, _0814B008 @ =0x000081a8
	adds r0, r2
	adds r0, r1
	ldr r2, [r0]
	ldr r1, _0814B00C @ =sub_814B038
	str r1, [r2, 0x1C]
	movs r1, 0
	strh r1, [r2, 0x26]
	ldr r0, [r0]
	bl sub_814ADB4
	pop {r0}
	bx r0
	.align 2, 0
_0814B008: .4byte 0x000081a8
_0814B00C: .4byte sub_814B038
	thumb_func_end sub_814AFE8

	thumb_func_start sub_814B010
sub_814B010: @ 814B010
	push {lr}
	movs r2, 0
	lsls r1, 2
	ldr r3, _0814B030 @ =0x000081a8
	adds r0, r3
	adds r0, r1
	ldr r0, [r0]
	ldr r1, [r0, 0x1C]
	ldr r0, _0814B034 @ =sub_814B038
	cmp r1, r0
	bne _0814B028
	movs r2, 0x1
_0814B028:
	adds r0, r2, 0
	pop {r1}
	bx r1
	.align 2, 0
_0814B030: .4byte 0x000081a8
_0814B034: .4byte sub_814B038
	thumb_func_end sub_814B010

	thumb_func_start sub_814B038
sub_814B038: @ 814B038
	push {lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x30]
	adds r0, 0x1
	strh r0, [r2, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _0814B064
	ldrh r0, [r2, 0x32]
	adds r0, 0x1
	strh r0, [r2, 0x32]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0814B05C
	movs r0, 0x2
	b _0814B05E
_0814B05C:
	ldr r0, _0814B078 @ =0x0000fffe
_0814B05E:
	strh r0, [r2, 0x26]
	movs r0, 0
	strh r0, [r2, 0x30]
_0814B064:
	movs r1, 0x32
	ldrsh r0, [r2, r1]
	cmp r0, 0xC
	ble _0814B074
	movs r0, 0
	strh r0, [r2, 0x26]
	ldr r0, _0814B07C @ =SpriteCallbackDummy
	str r0, [r2, 0x1C]
_0814B074:
	pop {r0}
	bx r0
	.align 2, 0
_0814B078: .4byte 0x0000fffe
_0814B07C: .4byte SpriteCallbackDummy
	thumb_func_end sub_814B038

	thumb_func_start sub_814B080
sub_814B080: @ 814B080
	push {r4,lr}
	adds r4, r0, 0
	lsls r1, 2
	ldr r0, _0814B0A0 @ =0x000081a8
	adds r4, r0
	adds r4, r1
	ldr r0, [r4]
	bl sub_814ADB4
	ldr r1, [r4]
	ldr r0, _0814B0A4 @ =sub_814B100
	str r0, [r1, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0814B0A0: .4byte 0x000081a8
_0814B0A4: .4byte sub_814B100
	thumb_func_end sub_814B080

	thumb_func_start sub_814B0A8
sub_814B0A8: @ 814B0A8
	push {r4-r7,lr}
	adds r4, r0, 0
	bl sub_81499A4
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0
	beq _0814B0EC
	movs r1, 0x5
	negs r1, r1
	mov r12, r1
	ldr r1, _0814B0F4 @ =0x000081a8
	adds r3, r4, r1
	ldr r7, _0814B0F8 @ =sub_814B100
	ldr r6, _0814B0FC @ =SpriteCallbackDummy
	movs r5, 0xA
	adds r4, r0, 0
_0814B0CA:
	ldr r2, [r3]
	ldr r0, [r2, 0x1C]
	cmp r0, r7
	bne _0814B0E4
	adds r2, 0x3E
	ldrb r1, [r2]
	mov r0, r12
	ands r0, r1
	strb r0, [r2]
	ldr r0, [r3]
	str r6, [r0, 0x1C]
	adds r0, 0x43
	strb r5, [r0]
_0814B0E4:
	adds r3, 0x4
	subs r4, 0x1
	cmp r4, 0
	bne _0814B0CA
_0814B0EC:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0814B0F4: .4byte 0x000081a8
_0814B0F8: .4byte sub_814B100
_0814B0FC: .4byte SpriteCallbackDummy
	thumb_func_end sub_814B0A8

	thumb_func_start sub_814B100
sub_814B100: @ 814B100
	push {lr}
	adds r3, r0, 0
	ldrh r0, [r3, 0x2E]
	adds r0, 0x1
	strh r0, [r3, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3
	ble _0814B12E
	movs r0, 0
	strh r0, [r3, 0x2E]
	adds r3, 0x3E
	ldrb r2, [r3]
	lsls r0, r2, 29
	lsrs r0, 31
	movs r1, 0x1
	eors r1, r0
	lsls r1, 2
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
_0814B12E:
	pop {r0}
	bx r0
	thumb_func_end sub_814B100

	thumb_func_start sub_814B134
sub_814B134: @ 814B134
	push {r4,r5,lr}
	adds r4, r0, 0
	bl sub_81499A4
	lsls r0, 16
	lsrs r3, r0, 16
	movs r2, 0
	cmp r2, r3
	bge _0814B15E
	ldr r0, _0814B164 @ =0x000081fc
	adds r5, r4, r0
	subs r0, 0x54
	adds r4, r0
_0814B14E:
	ldm r4!, {r0}
	adds r1, r5, r2
	ldrb r1, [r1]
	adds r0, 0x43
	strb r1, [r0]
	adds r2, 0x1
	cmp r2, r3
	blt _0814B14E
_0814B15E:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0814B164: .4byte 0x000081fc
	thumb_func_end sub_814B134

	thumb_func_start sub_814B168
sub_814B168: @ 814B168
	push {r4,lr}
	adds r4, r0, 0
	lsls r1, 2
	ldr r0, _0814B188 @ =0x000081a8
	adds r4, r0
	adds r4, r1
	ldr r0, [r4]
	bl sub_814ADB4
	ldr r1, [r4]
	ldr r0, _0814B18C @ =sub_814B1CC
	str r0, [r1, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0814B188: .4byte 0x000081a8
_0814B18C: .4byte sub_814B1CC
	thumb_func_end sub_814B168

	thumb_func_start sub_814B190
sub_814B190: @ 814B190
	push {r4,r5,lr}
	adds r4, r0, 0
	bl sub_81499A4
	lsls r0, 16
	lsrs r3, r0, 16
	movs r2, 0
	cmp r2, r3
	bge _0814B1C4
	ldr r5, _0814B1B4 @ =sub_814B1CC
	ldr r0, _0814B1B8 @ =0x000081a8
	adds r1, r4, r0
_0814B1A8:
	ldr r0, [r1]
	ldr r0, [r0, 0x1C]
	cmp r0, r5
	bne _0814B1BC
	movs r0, 0x1
	b _0814B1C6
	.align 2, 0
_0814B1B4: .4byte sub_814B1CC
_0814B1B8: .4byte 0x000081a8
_0814B1BC:
	adds r1, 0x4
	adds r2, 0x1
	cmp r2, r3
	blt _0814B1A8
_0814B1C4:
	movs r0, 0
_0814B1C6:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_814B190

	thumb_func_start sub_814B1CC
sub_814B1CC: @ 814B1CC
	push {r4,r5,lr}
	adds r5, r0, 0
	movs r0, 0x2E
	ldrsh r4, [r5, r0]
	cmp r4, 0
	beq _0814B1DE
	cmp r4, 0x1
	beq _0814B1EC
	b _0814B234
_0814B1DE:
	movs r0, 0x1C
	bl PlaySE
	strh r4, [r5, 0x30]
	ldrh r0, [r5, 0x2E]
	adds r0, 0x1
	strh r0, [r5, 0x2E]
_0814B1EC:
	ldrh r0, [r5, 0x30]
	adds r0, 0x4
	strh r0, [r5, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x7F
	ble _0814B1FE
	movs r0, 0
	strh r0, [r5, 0x30]
_0814B1FE:
	ldr r1, _0814B22C @ =gSineTable
	movs r2, 0x30
	ldrsh r0, [r5, r2]
	lsls r0, 1
	adds r0, r1
	ldrh r0, [r0]
	lsls r0, 16
	asrs r0, 19
	negs r0, r0
	strh r0, [r5, 0x26]
	movs r0, 0x30
	ldrsh r1, [r5, r0]
	cmp r1, 0
	bne _0814B234
	ldrh r0, [r5, 0x32]
	adds r0, 0x1
	strh r0, [r5, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	bgt _0814B230
	strh r1, [r5, 0x2E]
	b _0814B234
	.align 2, 0
_0814B22C: .4byte gSineTable
_0814B230:
	ldr r0, _0814B23C @ =SpriteCallbackDummy
	str r0, [r5, 0x1C]
_0814B234:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0814B23C: .4byte SpriteCallbackDummy
	thumb_func_end sub_814B1CC

	thumb_func_start sub_814B240
sub_814B240: @ 814B240
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r3, 24
	lsrs r4, r3, 24
	ldr r0, _0814B288 @ =gUnknown_846E2B4
	lsls r1, 16
	asrs r1, 16
	lsls r2, 16
	asrs r2, 16
	movs r3, 0x1
	bl CreateSprite
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x40
	beq _0814B280
	ldr r0, _0814B28C @ =gSprites
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r0
	adds r3, r1, 0
	adds r3, 0x3E
	ldrb r0, [r3]
	movs r2, 0x4
	orrs r0, r2
	strb r0, [r3]
	lsls r2, r4, 2
	ldr r3, _0814B290 @ =0x000081bc
	adds r0, r5, r3
	adds r0, r2
	str r1, [r0]
_0814B280:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0814B288: .4byte gUnknown_846E2B4
_0814B28C: .4byte gSprites
_0814B290: .4byte 0x000081bc
	thumb_func_end sub_814B240

	thumb_func_start sub_814B294
sub_814B294: @ 814B294
	push {r4-r7,lr}
	adds r7, r0, 0
	movs r5, 0
	movs r4, 0
	ldr r6, _0814B334 @ =gUnknown_846E100
_0814B29E:
	ldr r1, _0814B338 @ =gUnknown_846E160
	lsls r0, r4, 2
	adds r0, r1
	ldr r0, [r0]
	ldr r2, _0814B33C @ =gUnknown_846E150
	lsls r1, r5, 1
	adds r1, r2
	movs r2, 0
	ldrsh r1, [r1, r2]
	movs r3, 0
	ldrsh r2, [r6, r3]
	movs r3, 0x2
	bl CreateSprite
	lsls r0, 24
	lsrs r1, r0, 24
	lsls r0, r5, 2
	ldr r3, _0814B340 @ =0x000081d0
	adds r2, r7, r3
	adds r2, r0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0814B344 @ =gSprites
	adds r0, r1
	str r0, [r2]
	adds r5, 0x1
	adds r6, 0x14
	adds r4, 0x1
	cmp r4, 0x3
	ble _0814B29E
	movs r4, 0x3
	movs r6, 0x3C
_0814B2E0:
	ldr r1, _0814B338 @ =gUnknown_846E160
	lsls r0, r4, 2
	adds r0, r1
	ldr r0, [r0]
	ldr r2, _0814B33C @ =gUnknown_846E150
	lsls r1, r5, 1
	adds r1, r2
	movs r2, 0
	ldrsh r1, [r1, r2]
	ldr r2, _0814B334 @ =gUnknown_846E100
	adds r2, r6, r2
	movs r3, 0
	ldrsh r2, [r2, r3]
	movs r3, 0x2
	bl CreateSprite
	lsls r0, 24
	lsrs r1, r0, 24
	lsls r0, r5, 2
	ldr r3, _0814B340 @ =0x000081d0
	adds r2, r7, r3
	adds r2, r0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0814B344 @ =gSprites
	adds r0, r1
	str r0, [r2]
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r2, 0x1
	orrs r1, r2
	strb r1, [r0]
	adds r5, 0x1
	subs r6, 0x14
	subs r4, 0x1
	cmp r4, 0
	bge _0814B2E0
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0814B334: .4byte gUnknown_846E100
_0814B338: .4byte gUnknown_846E160
_0814B33C: .4byte gUnknown_846E150
_0814B340: .4byte 0x000081d0
_0814B344: .4byte gSprites
	thumb_func_end sub_814B294

	thumb_func_start sub_814B348
sub_814B348: @ 814B348
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0xC
	str r0, [sp, 0x8]
	cmp r1, 0x5
	ble _0814B368
	movs r0, 0xA
	subs r1, r0, r1
	movs r0, 0x3
	str r0, [sp]
	ldr r2, [sp, 0x8]
	ldrb r0, [r2, 0xF]
	b _0814B370
_0814B368:
	movs r3, 0x2
	str r3, [sp]
	ldr r7, [sp, 0x8]
	ldrb r0, [r7, 0xE]
_0814B370:
	movs r6, 0
	lsls r2, r1, 1
	str r2, [sp, 0x4]
	lsls r0, 4
	mov r9, r0
	lsls r1, 24
	mov r8, r1
	ldr r0, _0814B434 @ =gUnknown_846E100
	adds r4, r2, r0
	ldr r3, [sp]
	lsls r3, 2
	mov r10, r3
	movs r5, 0x3
_0814B38A:
	lsls r0, r6, 2
	ldr r7, [sp, 0x8]
	ldr r1, _0814B438 @ =0x000081d0
	adds r2, r7, r1
	adds r2, r0
	ldr r1, [r2]
	ldrh r0, [r4]
	strh r0, [r1, 0x22]
	ldr r3, [r2]
	ldrb r0, [r3, 0x5]
	movs r7, 0xD
	negs r7, r7
	adds r1, r7, 0
	ands r0, r1
	mov r1, r10
	orrs r0, r1
	strb r0, [r3, 0x5]
	ldr r3, [r2]
	ldrb r1, [r3, 0x5]
	movs r0, 0xF
	ands r0, r1
	mov r7, r9
	orrs r0, r7
	strb r0, [r3, 0x5]
	ldr r0, [r2]
	mov r2, r8
	lsrs r1, r2, 24
	bl StartSpriteAnim
	adds r6, 0x1
	adds r4, 0x14
	subs r5, 0x1
	cmp r5, 0
	bge _0814B38A
	movs r5, 0x3
	ldr r0, _0814B434 @ =gUnknown_846E100
	ldr r3, [sp, 0x4]
	adds r0, r3, r0
	adds r4, r0, 0
	adds r4, 0x3C
	ldr r7, [sp]
	lsls r7, 2
	mov r10, r7
_0814B3E0:
	lsls r0, r6, 2
	ldr r1, [sp, 0x8]
	ldr r3, _0814B438 @ =0x000081d0
	adds r2, r1, r3
	adds r2, r0
	ldr r1, [r2]
	ldrh r0, [r4]
	strh r0, [r1, 0x22]
	ldr r3, [r2]
	ldrb r0, [r3, 0x5]
	movs r7, 0xD
	negs r7, r7
	adds r1, r7, 0
	ands r0, r1
	mov r1, r10
	orrs r0, r1
	strb r0, [r3, 0x5]
	ldr r3, [r2]
	ldrb r1, [r3, 0x5]
	movs r0, 0xF
	ands r0, r1
	mov r7, r9
	orrs r0, r7
	strb r0, [r3, 0x5]
	ldr r0, [r2]
	mov r2, r8
	lsrs r1, r2, 24
	bl StartSpriteAnim
	adds r6, 0x1
	subs r4, 0x14
	subs r5, 0x1
	cmp r5, 0
	bge _0814B3E0
	add sp, 0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0814B434: .4byte gUnknown_846E100
_0814B438: .4byte 0x000081d0
	thumb_func_end sub_814B348

	thumb_func_start sub_814B43C
sub_814B43C: @ 814B43C
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	movs r0, 0
	str r0, [sp]
	movs r0, 0x9
	movs r1, 0x7
	movs r2, 0x78
	movs r3, 0x50
	bl StartMinigameCountdown
	adds r0, r4, 0
	bl sub_814B134
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_814B43C

	thumb_func_start sub_814B460
sub_814B460: @ 814B460
	push {lr}
	bl IsMinigameCountdownRunning
	pop {r1}
	bx r1
	thumb_func_end sub_814B460

	thumb_func_start sub_814B46C
sub_814B46C: @ 814B46C
	ldr r0, _0814B478 @ =gSaveBlock2Ptr
	ldr r0, [r0]
	movs r1, 0xB0
	lsls r1, 4
	adds r0, r1
	bx lr
	.align 2, 0
_0814B478: .4byte gSaveBlock2Ptr
	thumb_func_end sub_814B46C

	thumb_func_start ResetPokeJumpResults
ResetPokeJumpResults: @ 814B47C
	push {lr}
	bl sub_814B46C
	movs r1, 0
	strh r1, [r0]
	str r1, [r0, 0xC]
	strh r1, [r0, 0x4]
	strh r1, [r0, 0x6]
	str r1, [r0, 0x8]
	strh r1, [r0, 0x2]
	pop {r0}
	bx r0
	thumb_func_end ResetPokeJumpResults

	thumb_func_start sub_814B494
sub_814B494: @ 814B494
	push {r4-r6,lr}
	adds r4, r0, 0
	lsls r1, 16
	lsrs r5, r1, 16
	lsls r2, 16
	lsrs r6, r2, 16
	bl sub_814B46C
	adds r1, r0, 0
	movs r2, 0
	ldr r0, [r1, 0xC]
	cmp r0, r4
	bcs _0814B4B8
	ldr r0, _0814B4E0 @ =0x00018696
	cmp r4, r0
	bhi _0814B4B8
	str r4, [r1, 0xC]
	movs r2, 0x1
_0814B4B8:
	ldrh r0, [r1]
	cmp r0, r5
	bcs _0814B4C8
	ldr r0, _0814B4E4 @ =0x0000270f
	cmp r5, r0
	bhi _0814B4C8
	strh r5, [r1]
	movs r2, 0x1
_0814B4C8:
	ldrh r0, [r1, 0x4]
	cmp r0, r6
	bcs _0814B4D8
	ldr r0, _0814B4E4 @ =0x0000270f
	cmp r6, r0
	bhi _0814B4D8
	strh r6, [r1, 0x4]
	movs r2, 0x1
_0814B4D8:
	adds r0, r2, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0814B4E0: .4byte 0x00018696
_0814B4E4: .4byte 0x0000270f
	thumb_func_end sub_814B494

	thumb_func_start sub_814B4E8
sub_814B4E8: @ 814B4E8
	push {lr}
	bl sub_814B46C
	adds r2, r0, 0
	ldrh r1, [r2, 0x6]
	ldr r0, _0814B500 @ =0x0000270e
	cmp r1, r0
	bhi _0814B4FC
	adds r0, r1, 0x1
	strh r0, [r2, 0x6]
_0814B4FC:
	pop {r0}
	bx r0
	.align 2, 0
_0814B500: .4byte 0x0000270e
	thumb_func_end sub_814B4E8

	thumb_func_start ShowPokemonJumpRecords
ShowPokemonJumpRecords: @ 814B504
	push {r4,lr}
	ldr r4, _0814B520 @ =sub_814B524
	adds r0, r4, 0
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	bl _call_via_r4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0814B520: .4byte sub_814B524
	thumb_func_end ShowPokemonJumpRecords

	thumb_func_start sub_814B524
sub_814B524: @ 814B524
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _0814B548 @ =gTasks+0x8
	adds r4, r0, r1
	movs r1, 0
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _0814B570
	cmp r0, 0x1
	bgt _0814B54C
	cmp r0, 0
	beq _0814B556
	b _0814B5BE
	.align 2, 0
_0814B548: .4byte gTasks+0x8
_0814B54C:
	cmp r0, 0x2
	beq _0814B57C
	cmp r0, 0x3
	beq _0814B5A4
	b _0814B5BE
_0814B556:
	ldr r0, _0814B56C @ =gUnknown_846E2CC
	bl AddWindow
	strh r0, [r4, 0x2]
	ldrh r0, [r4, 0x2]
	bl sub_814B5C4
	ldrb r0, [r4, 0x2]
	movs r1, 0x3
	b _0814B592
	.align 2, 0
_0814B56C: .4byte gUnknown_846E2CC
_0814B570:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _0814B5BE
	b _0814B596
_0814B57C:
	ldr r0, _0814B5A0 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0
	beq _0814B5BE
	ldrb r0, [r4, 0x2]
	bl rbox_fill_rectangle
	ldrb r0, [r4, 0x2]
	movs r1, 0x1
_0814B592:
	bl CopyWindowToVram
_0814B596:
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	b _0814B5BE
	.align 2, 0
_0814B5A0: .4byte gMain
_0814B5A4:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _0814B5BE
	ldrb r0, [r4, 0x2]
	bl RemoveWindow
	adds r0, r5, 0
	bl DestroyTask
	bl EnableBothScriptContexts
_0814B5BE:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_814B524

	thumb_func_start sub_814B5C4
sub_814B5C4: @ 814B5C4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x30
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp, 0x28]
	bl sub_814B46C
	ldrh r1, [r0]
	str r1, [sp, 0x14]
	ldr r1, [r0, 0xC]
	str r1, [sp, 0x18]
	ldrh r0, [r0, 0x4]
	str r0, [sp, 0x1C]
	ldr r0, [sp, 0x28]
	lsls r4, r0, 24
	lsrs r4, 24
	ldr r5, _0814B6C8 @ =0x0000021d
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0xD0
	bl TextWindow_SetStdFrame0_WithPal
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0xD
	bl DrawTextBorderOuter
	adds r0, r4, 0
	movs r1, 0x11
	bl FillWindowPixelBuffer
	ldr r2, _0814B6CC @ =gUnknown_841CB63
	movs r1, 0
	str r1, [sp]
	movs r0, 0xFF
	str r0, [sp, 0x4]
	str r1, [sp, 0x8]
	movs r0, 0x1
	str r0, [sp, 0xC]
	str r1, [sp, 0x10]
	adds r0, r4, 0
	movs r1, 0x2
	movs r3, 0
	bl AddTextPrinterParameterized5
	movs r7, 0
	mov r8, r4
	movs r1, 0xFF
	mov r10, r1
	movs r6, 0
	mov r0, sp
	adds r0, 0x14
	str r0, [sp, 0x2C]
	movs r1, 0xA0
	lsls r1, 21
	mov r9, r1
	add r5, sp, 0x20
_0814B63E:
	ldr r1, _0814B6D0 @ =gUnknown_846E2D4
	lsls r0, r7, 2
	adds r0, r1
	ldr r2, [r0]
	mov r0, r9
	lsrs r4, r0, 24
	str r4, [sp]
	mov r1, r10
	str r1, [sp, 0x4]
	str r6, [sp, 0x8]
	movs r0, 0x1
	str r0, [sp, 0xC]
	str r6, [sp, 0x10]
	mov r0, r8
	movs r1, 0x2
	movs r3, 0
	bl AddTextPrinterParameterized5
	ldr r0, [sp, 0x2C]
	ldm r0!, {r1}
	str r0, [sp, 0x2C]
	adds r0, r5, 0
	movs r2, 0
	movs r3, 0x5
	bl ConvertIntToDecimalStringN
	adds r0, r5, 0
	bl sub_814B6D4
	movs r0, 0x2
	adds r1, r5, 0
	movs r2, 0
	bl GetStringWidth
	movs r3, 0xDE
	subs r3, r0
	lsls r3, 24
	lsrs r3, 24
	str r4, [sp]
	mov r1, r10
	str r1, [sp, 0x4]
	str r6, [sp, 0x8]
	str r6, [sp, 0xC]
	str r6, [sp, 0x10]
	mov r0, r8
	movs r1, 0x2
	adds r2, r5, 0
	bl AddTextPrinterParameterized5
	movs r0, 0xE0
	lsls r0, 20
	add r9, r0
	adds r7, 0x1
	ldr r1, [sp, 0x28]
	lsls r0, r1, 24
	cmp r7, 0x2
	bls _0814B63E
	lsrs r0, 24
	bl PutWindowTilemap
	add sp, 0x30
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0814B6C8: .4byte 0x0000021d
_0814B6CC: .4byte gUnknown_841CB63
_0814B6D0: .4byte gUnknown_846E2D4
	thumb_func_end sub_814B5C4

	thumb_func_start sub_814B6D4
sub_814B6D4: @ 814B6D4
	push {lr}
	adds r1, r0, 0
	b _0814B6DC
_0814B6DA:
	adds r1, 0x1
_0814B6DC:
	ldrb r0, [r1]
	cmp r0, 0xFF
	beq _0814B6EA
	cmp r0, 0
	bne _0814B6DA
	movs r0, 0xFF
	strb r0, [r1]
_0814B6EA:
	pop {r0}
	bx r0
	thumb_func_end sub_814B6D4

	.align 2, 0 @ Don't pad with nop.
