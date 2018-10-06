	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_8147AA8
sub_8147AA8: @ 8147AA8
	push {r4-r7,lr}
	adds r6, r1, 0
	lsls r0, 16
	lsrs r7, r0, 16
	ldr r0, _08147B20 @ =gUnknown_3003F64
	ldrb r0, [r0]
	cmp r0, 0
	beq _08147B3C
	ldr r5, _08147B24 @ =gUnknown_203F3D4
	ldr r0, _08147B28 @ =0x000083b0
	bl Alloc
	str r0, [r5]
	cmp r0, 0
	beq _08147B3C
	bl ResetTasks
	ldr r0, _08147B2C @ =sub_8147DA0
	movs r1, 0x1
	bl CreateTask
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, [r5]
	movs r1, 0
	strh r1, [r0, 0x8]
	str r6, [r0]
	strb r4, [r0, 0x4]
	bl GetMultiplayerId
	ldr r1, [r5]
	strb r0, [r1, 0x6]
	ldr r0, [r5]
	ldrb r2, [r0, 0x6]
	lsls r1, r2, 1
	adds r1, r2
	lsls r1, 2
	ldr r2, _08147B30 @ =0x000082a8
	adds r1, r2
	adds r0, r1
	movs r1, 0x64
	muls r1, r7
	ldr r2, _08147B34 @ =gPlayerParty
	adds r1, r2
	bl sub_8147D2C
	ldr r0, [r5]
	bl sub_8147B60
	ldr r2, [r5]
	adds r0, r4, 0
	movs r1, 0x2
	bl SetWordTaskArg
	ldr r0, _08147B38 @ =sub_8147D6C
	bl SetMainCallback2
	b _08147B42
	.align 2, 0
_08147B20: .4byte gUnknown_3003F64
_08147B24: .4byte gUnknown_203F3D4
_08147B28: .4byte 0x000083b0
_08147B2C: .4byte sub_8147DA0
_08147B30: .4byte 0x000082a8
_08147B34: .4byte gPlayerParty
_08147B38: .4byte sub_8147D6C
_08147B3C:
	adds r0, r6, 0
	bl SetMainCallback2
_08147B42:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8147AA8

	thumb_func_start sub_8147B48
sub_8147B48: @ 8147B48
	push {lr}
	bl sub_8149D24
	ldr r0, _08147B5C @ =gUnknown_203F3D4
	ldr r0, [r0]
	bl Free
	pop {r0}
	bx r0
	.align 2, 0
_08147B5C: .4byte gUnknown_203F3D4
	thumb_func_end sub_8147B48

	thumb_func_start sub_8147B60
sub_8147B60: @ 8147B60
	push {r4,lr}
	adds r4, r0, 0
	bl GetLinkPlayerCount
	movs r2, 0
	strb r0, [r4, 0x5]
	adds r1, r4, 0
	adds r1, 0x70
	movs r0, 0x5
	strb r0, [r1]
	adds r0, r4, 0
	adds r0, 0x72
	strh r2, [r0]
	bl sub_8147C20
	adds r0, r4, 0
	bl sub_8147B94
	ldrb r0, [r4, 0x5]
	cmp r0, 0x5
	bne _08147B8E
	bl sub_814B4E8
_08147B8E:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8147B60

	thumb_func_start sub_8147B94
sub_8147B94: @ 8147B94
	push {r4-r6,lr}
	adds r4, r0, 0
	movs r0, 0x6
	str r0, [r4, 0x14]
	str r0, [r4, 0x18]
	adds r0, r4, 0
	adds r0, 0x4A
	movs r6, 0
	movs r5, 0
	strh r5, [r0]
	str r5, [r4, 0x1C]
	str r5, [r4, 0x5C]
	bl GetMultiplayerId
	movs r1, 0
	lsls r0, 24
	cmp r0, 0
	bne _08147BBA
	movs r1, 0x1
_08147BBA:
	adds r0, r4, 0
	adds r0, 0x47
	strb r1, [r0]
	strh r5, [r4, 0x8]
	strh r5, [r4, 0xA]
	strh r5, [r4, 0xC]
	strh r5, [r4, 0xE]
	str r5, [r4, 0x58]
	strh r5, [r4, 0x3A]
	subs r0, 0x3
	strb r6, [r0]
	str r5, [r4, 0x54]
	adds r0, 0x2
	strb r6, [r0]
	adds r0, 0x3
	strb r6, [r0]
	subs r0, 0x1
	movs r1, 0x1
	strb r1, [r0]
	str r5, [r4, 0x78]
	adds r0, 0x29
	strb r6, [r0]
	adds r0, 0x3
	strh r5, [r0]
	str r1, [r4, 0x60]
	subs r0, 0x27
	strb r6, [r0]
	str r5, [r4, 0x68]
	str r5, [r4, 0x64]
	str r5, [r4, 0x2C]
	str r5, [r4, 0x30]
	bl sub_8147C98
	bl sub_81491E4
	movs r2, 0
	adds r5, r4, 0
	adds r5, 0x7C
	movs r3, 0
	adds r1, r4, 0
	adds r1, 0x9A
_08147C0C:
	adds r0, r5, r2
	strb r3, [r0]
	strh r3, [r1]
	adds r1, 0x2
	adds r2, 0x1
	cmp r2, 0x4
	ble _08147C0C
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8147B94

	thumb_func_start sub_8147C20
sub_8147C20: @ 8147C20
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r7, _08147C80 @ =gUnknown_203F3D4
	movs r6, 0
	movs r5, 0
	ldr r0, _08147C84 @ =gUnknown_846B4BC
	mov r8, r0
	movs r4, 0x4
_08147C32:
	ldr r0, [r7]
	adds r0, r5
	ldr r1, _08147C88 @ =0x000082a8
	adds r0, r1
	ldrh r0, [r0]
	bl sub_8147D00
	lsls r0, 16
	ldr r1, [r7]
	adds r1, r6
	asrs r0, 14
	add r0, r8
	ldrh r0, [r0, 0x2]
	ldr r2, _08147C8C @ =0x000082f0
	adds r1, r2
	strh r0, [r1]
	adds r6, 0x28
	adds r5, 0xC
	subs r4, 0x1
	cmp r4, 0
	bge _08147C32
	ldr r0, _08147C80 @ =gUnknown_203F3D4
	ldr r1, [r0]
	ldr r0, _08147C90 @ =0x000083ac
	adds r3, r1, r0
	ldrb r2, [r1, 0x6]
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r2, _08147C94 @ =0x000082e4
	adds r0, r2
	adds r1, r0
	str r1, [r3]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08147C80: .4byte gUnknown_203F3D4
_08147C84: .4byte gUnknown_846B4BC
_08147C88: .4byte 0x000082a8
_08147C8C: .4byte 0x000082f0
_08147C90: .4byte 0x000083ac
_08147C94: .4byte 0x000082e4
	thumb_func_end sub_8147C20

	thumb_func_start sub_8147C98
sub_8147C98: @ 8147C98
	push {r4-r7,lr}
	movs r5, 0
	ldr r6, _08147CE8 @ =gUnknown_203F3D4
	movs r4, 0
	movs r3, 0
_08147CA2:
	ldr r2, [r6]
	adds r1, r2, r3
	ldr r7, _08147CEC @ =0x000082f2
	adds r0, r1, r7
	strh r4, [r0]
	adds r7, 0x2
	adds r0, r1, r7
	strh r4, [r0]
	ldr r0, _08147CF0 @ =0x000082f6
	adds r1, r0
	strh r4, [r1]
	ldr r1, _08147CF4 @ =0x000082e4
	adds r0, r2, r1
	adds r0, r3
	str r4, [r0]
	subs r7, 0xC
	adds r0, r2, r7
	adds r0, r3
	ldr r1, _08147CF8 @ =0x7fffffff
	str r1, [r0]
	ldr r1, _08147CFC @ =0x000082f8
	adds r0, r2, r1
	adds r0, r3
	str r4, [r0]
	adds r2, 0x8B
	adds r2, r5
	movs r0, 0x9
	strb r0, [r2]
	adds r3, 0x28
	adds r5, 0x1
	cmp r5, 0x4
	ble _08147CA2
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08147CE8: .4byte gUnknown_203F3D4
_08147CEC: .4byte 0x000082f2
_08147CF0: .4byte 0x000082f6
_08147CF4: .4byte 0x000082e4
_08147CF8: .4byte 0x7fffffff
_08147CFC: .4byte 0x000082f8
	thumb_func_end sub_8147C98

	thumb_func_start sub_8147D00
sub_8147D00: @ 8147D00
	push {lr}
	lsls r0, 16
	lsrs r3, r0, 16
	movs r1, 0
	ldr r2, _08147D18 @ =gUnknown_846B4BC
_08147D0A:
	ldrh r0, [r2]
	cmp r0, r3
	bne _08147D1C
	lsls r0, r1, 16
	asrs r0, 16
	b _08147D28
	.align 2, 0
_08147D18: .4byte gUnknown_846B4BC
_08147D1C:
	adds r2, 0x4
	adds r1, 0x1
	cmp r1, 0x63
	bls _08147D0A
	movs r0, 0x1
	negs r0, r0
_08147D28:
	pop {r1}
	bx r1
	thumb_func_end sub_8147D00

	thumb_func_start sub_8147D2C
sub_8147D2C: @ 8147D2C
	push {r4,r5,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	strh r0, [r5]
	adds r0, r4, 0
	movs r1, 0x1
	bl GetMonData
	str r0, [r5, 0x4]
	adds r0, r4, 0
	movs r1, 0
	bl GetMonData
	str r0, [r5, 0x8]
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8147D2C

	thumb_func_start sub_8147D58
sub_8147D58: @ 8147D58
	push {lr}
	bl TransferPlttBuffer
	bl LoadOam
	bl ProcessSpriteCopyRequests
	pop {r0}
	bx r0
	thumb_func_end sub_8147D58

	thumb_func_start sub_8147D6C
sub_8147D6C: @ 8147D6C
	push {lr}
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	thumb_func_end sub_8147D6C

	thumb_func_start sub_8147D84
sub_8147D84: @ 8147D84
	push {lr}
	movs r1, 0x1
	bl CreateTask
	ldr r2, _08147D9C @ =gUnknown_203F3D4
	ldr r1, [r2]
	movs r3, 0
	strb r0, [r1, 0x4]
	ldr r0, [r2]
	strh r3, [r0, 0x8]
	pop {r0}
	bx r0
	.align 2, 0
_08147D9C: .4byte gUnknown_203F3D4
	thumb_func_end sub_8147D84

	thumb_func_start sub_8147DA0
sub_8147DA0: @ 8147DA0
	push {r4,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _08147DC0 @ =gUnknown_203F3D4
	ldr r0, [r1]
	ldrh r0, [r0, 0x8]
	adds r2, r1, 0
	cmp r0, 0x5
	bls _08147DB6
	b _08147F04
_08147DB6:
	lsls r0, 2
	ldr r1, _08147DC4 @ =_08147DC8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08147DC0: .4byte gUnknown_203F3D4
_08147DC4: .4byte _08147DC8
	.align 2, 0
_08147DC8:
	.4byte _08147DE0
	.4byte _08147E0C
	.4byte _08147E3C
	.4byte _08147E64
	.4byte _08147EA0
	.4byte _08147ECC
_08147DE0:
	movs r0, 0
	bl SetVBlankCallback
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	ldr r0, _08147E04 @ =sub_8148E80
	movs r1, 0x5
	bl sub_8148F5C
	movs r0, 0x4
	bl FadeOutMapMusic
	ldr r0, _08147E08 @ =gUnknown_203F3D4
	ldr r1, [r0]
	b _08147EBC
	.align 2, 0
_08147E04: .4byte sub_8148E80
_08147E08: .4byte gUnknown_203F3D4
_08147E0C:
	ldr r0, _08147E34 @ =sub_8148E80
	bl FuncIsActiveTask
	lsls r0, 24
	cmp r0, 0
	bne _08147F04
	ldr r4, _08147E38 @ =gUnknown_203F3D4
	ldr r0, [r4]
	adds r0, 0xA4
	bl sub_8149CEC
	bl sub_80FCEA8
	movs r0, 0
	movs r1, 0
	bl sub_80FCD74
	ldr r1, [r4]
	b _08147EBC
	.align 2, 0
_08147E34: .4byte sub_8148E80
_08147E38: .4byte gUnknown_203F3D4
_08147E3C:
	bl sub_8149D68
	cmp r0, 0
	bne _08147F04
	bl IsNotWaitingForBGMStop
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08147F04
	movs r0, 0xA3
	lsls r0, 1
	movs r1, 0x8
	bl FadeOutAndPlayNewMapMusic
	ldr r0, _08147E60 @ =gUnknown_203F3D4
	ldr r1, [r0]
	b _08147EBC
	.align 2, 0
_08147E60: .4byte gUnknown_203F3D4
_08147E64:
	bl sub_800A4BC
	lsls r0, 24
	cmp r0, 0
	beq _08147F04
	movs r4, 0x1
	negs r4, r4
	adds r0, r4, 0
	movs r1, 0x10
	movs r2, 0
	bl BlendPalettes
	movs r0, 0
	str r0, [sp]
	adds r0, r4, 0
	adds r1, r4, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r0, _08147E98 @ =sub_8147D58
	bl SetVBlankCallback
	ldr r0, _08147E9C @ =gUnknown_203F3D4
	ldr r1, [r0]
	b _08147EBC
	.align 2, 0
_08147E98: .4byte sub_8147D58
_08147E9C: .4byte gUnknown_203F3D4
_08147EA0:
	bl UpdatePaletteFade
	ldr r0, _08147EC4 @ =gUnknown_2037AB8
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0
	bne _08147F04
	ldr r1, _08147EC8 @ =gUnknown_203F3D4
	ldr r0, [r1]
	strb r2, [r0, 0x7]
	ldr r1, [r1]
_08147EBC:
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	b _08147F04
	.align 2, 0
_08147EC4: .4byte gUnknown_2037AB8
_08147EC8: .4byte gUnknown_203F3D4
_08147ECC:
	ldr r0, [r2]
	ldrb r1, [r0, 0x7]
	adds r1, 0x1
	strb r1, [r0, 0x7]
	ldr r1, [r2]
	ldrb r0, [r1, 0x7]
	cmp r0, 0x13
	bls _08147F04
	adds r0, r1, 0
	adds r0, 0x47
	ldrb r0, [r0]
	cmp r0, 0
	beq _08147EF4
	ldr r0, _08147EF0 @ =sub_814807C
	bl sub_8147D84
	b _08147EFA
	.align 2, 0
_08147EF0: .4byte sub_814807C
_08147EF4:
	ldr r0, _08147F0C @ =sub_8148290
	bl sub_8147D84
_08147EFA:
	bl sub_8148F7C
	adds r0, r4, 0
	bl DestroyTask
_08147F04:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08147F0C: .4byte sub_8148290
	thumb_func_end sub_8147DA0

	thumb_func_start sub_8147F10
sub_8147F10: @ 8147F10
	push {lr}
	adds r1, r0, 0
	cmp r1, 0
	bne _08147F30
	ldr r0, _08147F28 @ =gUnknown_203F3D4
	ldr r1, [r0]
	ldr r0, _08147F2C @ =0x00001111
	str r0, [r1, 0x30]
	movs r0, 0x1
	str r0, [r1, 0x2C]
	b _08147F42
	.align 2, 0
_08147F28: .4byte gUnknown_203F3D4
_08147F2C: .4byte 0x00001111
_08147F30:
	ldr r0, _08147F48 @ =gUnknown_203F3D4
	ldr r2, [r0]
	subs r1, 0x1
	movs r0, 0x1
	lsls r0, r1
	subs r0, 0x1
	str r0, [r2, 0x30]
	movs r0, 0
	str r0, [r2, 0x2C]
_08147F42:
	pop {r0}
	bx r0
	.align 2, 0
_08147F48: .4byte gUnknown_203F3D4
	thumb_func_end sub_8147F10

	thumb_func_start sub_8147F4C
sub_8147F4C: @ 8147F4C
	push {r4-r6,lr}
	ldr r4, _08147F98 @ =gUnknown_203F3D4
	ldr r1, [r4]
	adds r1, 0x70
	movs r2, 0
	strb r0, [r1]
	ldr r0, [r4]
	movs r3, 0
	strh r2, [r0, 0x8]
	strh r2, [r0, 0xA]
	adds r0, 0x48
	movs r1, 0x1
	strb r1, [r0]
	ldr r0, [r4]
	adds r0, 0x49
	strb r3, [r0]
	movs r3, 0x1
	ldr r0, [r4]
	ldrb r0, [r0, 0x5]
	cmp r3, r0
	bge _08147F90
	adds r6, r4, 0
	ldr r5, _08147F9C @ =0x000082fc
	movs r4, 0
	movs r2, 0x28
_08147F7E:
	ldr r1, [r6]
	adds r0, r1, r5
	adds r0, r2
	str r4, [r0]
	adds r2, 0x28
	adds r3, 0x1
	ldrb r1, [r1, 0x5]
	cmp r3, r1
	blt _08147F7E
_08147F90:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08147F98: .4byte gUnknown_203F3D4
_08147F9C: .4byte 0x000082fc
	thumb_func_end sub_8147F4C

	thumb_func_start sub_8147FA0
sub_8147FA0: @ 8147FA0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	movs r4, 0x1
	movs r0, 0
	str r0, [sp, 0x4]
	ldr r7, _08148068 @ =gUnknown_203F3D4
	ldr r0, [r7]
	ldrb r0, [r0, 0x5]
	cmp r4, r0
	bge _08148044
	adds r1, r7, 0
	mov r10, r1
	movs r2, 0x2
	add r2, sp
	mov r8, r2
	ldr r3, _0814806C @ =0x0000830c
	mov r9, r3
	movs r6, 0x28
_08147FCC:
	mov r1, r10
	ldr r0, [r1]
	adds r1, r0, r6
	ldr r2, _08148070 @ =0x000082f4
	adds r1, r2
	ldrh r5, [r1]
	add r0, r9
	adds r1, r4, 0
	mov r2, sp
	mov r3, r8
	bl sub_8149C24
	cmp r0, 0
	beq _0814800C
	ldr r2, [r7]
	lsls r1, r4, 1
	adds r0, r2, 0
	adds r0, 0x90
	adds r0, r1
	mov r3, r8
	ldrh r1, [r3]
	strh r1, [r0]
	adds r2, 0x8B
	adds r2, r4
	mov r0, sp
	ldrb r0, [r0]
	strb r0, [r2]
	ldr r0, [r7]
	adds r0, r6
	ldr r1, _08148074 @ =0x000082f6
	adds r0, r1
	strh r5, [r0]
_0814800C:
	mov r2, r10
	ldr r1, [r2]
	ldr r3, _08148078 @ =0x000082fc
	adds r0, r1, r3
	adds r0, r6
	ldr r0, [r0]
	cmp r0, 0
	beq _08148032
	adds r0, r1, 0
	adds r0, 0x8B
	adds r0, r4
	adds r1, 0x70
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	bne _08148032
	ldr r0, [sp, 0x4]
	adds r0, 0x1
	str r0, [sp, 0x4]
_08148032:
	movs r1, 0x28
	add r9, r1
	adds r6, 0x28
	adds r4, 0x1
	ldr r7, _08148068 @ =gUnknown_203F3D4
	ldr r0, [r7]
	ldrb r0, [r0, 0x5]
	cmp r4, r0
	blt _08147FCC
_08148044:
	ldr r2, _08148068 @ =gUnknown_203F3D4
	ldr r1, [r2]
	ldrb r0, [r1, 0x5]
	subs r0, 0x1
	ldr r3, [sp, 0x4]
	cmp r3, r0
	bne _08148058
	adds r1, 0x49
	movs r0, 0x1
	strb r0, [r1]
_08148058:
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08148068: .4byte gUnknown_203F3D4
_0814806C: .4byte 0x0000830c
_08148070: .4byte 0x000082f4
_08148074: .4byte 0x000082f6
_08148078: .4byte 0x000082fc
	thumb_func_end sub_8147FA0

	thumb_func_start sub_814807C
sub_814807C: @ 814807C
	push {r4,r5,lr}
	bl sub_8147FA0
	bl sub_8149534
	ldr r0, _081480F8 @ =gUnknown_203F3D4
	ldr r1, [r0]
	adds r0, r1, 0
	adds r0, 0x48
	ldrb r0, [r0]
	cmp r0, 0
	bne _081480AE
	adds r0, r1, 0
	adds r0, 0x49
	ldrb r0, [r0]
	cmp r0, 0
	beq _081480AE
	adds r0, r1, 0
	adds r0, 0x4C
	ldrb r0, [r0]
	bl sub_8147F4C
	movs r0, 0x3
	bl sub_8147F10
_081480AE:
	ldr r4, _081480F8 @ =gUnknown_203F3D4
	ldr r2, [r4]
	adds r0, r2, 0
	adds r0, 0x48
	ldrb r5, [r0]
	cmp r5, 0x1
	bne _081480EA
	ldr r1, _081480FC @ =gUnknown_846B64C
	adds r0, 0x28
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	bl _call_via_r0
	adds r1, r0, 0
	cmp r1, 0
	bne _081480EA
	ldr r0, [r4]
	adds r0, 0x48
	strb r1, [r0]
	ldr r1, [r4]
	ldrb r2, [r1, 0x6]
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r2, _08148100 @ =0x000082fc
	adds r1, r2
	adds r1, r0
	str r5, [r1]
_081480EA:
	bl sub_81492D8
	bl sub_8148104
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_081480F8: .4byte gUnknown_203F3D4
_081480FC: .4byte gUnknown_846B64C
_08148100: .4byte 0x000082fc
	thumb_func_end sub_814807C

	thumb_func_start sub_8148104
sub_8148104: @ 8148104
	push {r4,lr}
	ldr r4, _08148134 @ =gUnknown_203F3D4
	ldr r1, [r4]
	ldr r0, [r1, 0x2C]
	cmp r0, 0
	bne _0814811A
	ldr r2, _08148138 @ =0x000082e4
	adds r0, r1, r2
	adds r1, 0x70
	bl sub_8149AF8
_0814811A:
	ldr r1, [r4]
	ldr r2, [r1, 0x30]
	ldr r0, _0814813C @ =0x00001111
	cmp r2, r0
	beq _0814812C
	ldr r0, [r1, 0x2C]
	adds r0, 0x1
	ands r0, r2
	str r0, [r1, 0x2C]
_0814812C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08148134: .4byte gUnknown_203F3D4
_08148138: .4byte 0x000082e4
_0814813C: .4byte 0x00001111
	thumb_func_end sub_8148104

	thumb_func_start sub_8148140
sub_8148140: @ 8148140
	ldr r2, _0814816C @ =gUnknown_203F3D4
	ldr r1, [r2]
	adds r1, 0x70
	movs r3, 0
	strb r0, [r1]
	ldr r0, [r2]
	strh r3, [r0, 0x8]
	strh r3, [r0, 0xA]
	adds r0, 0x48
	movs r1, 0x1
	strb r1, [r0]
	ldr r1, [r2]
	ldrb r2, [r1, 0x6]
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r2, _08148170 @ =0x000082fc
	adds r1, r2
	adds r1, r0
	str r3, [r1]
	bx lr
	.align 2, 0
_0814816C: .4byte gUnknown_203F3D4
_08148170: .4byte 0x000082fc
	thumb_func_end sub_8148140

	thumb_func_start sub_8148174
sub_8148174: @ 8148174
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x10
	ldr r4, _081481F0 @ =gUnknown_203F3D4
	ldr r0, [r4]
	ldr r2, _081481F4 @ =0x000082f4
	adds r1, r0, r2
	ldrh r1, [r1]
	mov r8, r1
	ldr r3, _081481F8 @ =0x000082e4
	adds r0, r3
	mov r1, sp
	bl sub_8149B7C
	cmp r0, 0
	beq _08148224
	ldr r2, [r4]
	ldrb r0, [r2, 0x6]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r3, _081481FC @ =0x000082fc
	adds r0, r2, r3
	adds r0, r1
	ldr r0, [r0]
	cmp r0, 0x1
	bne _081481C2
	mov r0, sp
	adds r1, r2, 0
	adds r1, 0x70
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	beq _081481C2
	mov r0, sp
	ldrb r0, [r0]
	bl sub_8148140
_081481C2:
	ldr r3, _081481F0 @ =gUnknown_203F3D4
	ldr r2, [r3]
	ldr r0, [r2, 0x78]
	ldr r1, [sp, 0x8]
	cmp r0, r1
	beq _08148204
	str r1, [r2, 0x78]
	movs r4, 0x1
	str r4, [r2, 0x5C]
	mov r0, sp
	ldrb r1, [r0, 0x1]
	adds r0, r2, 0
	adds r0, 0x71
	strb r1, [r0]
	ldr r0, [r3]
	adds r1, r0, 0
	adds r1, 0x71
	ldrb r1, [r1]
	cmp r1, 0
	beq _08148200
	adds r0, 0x4D
	strb r4, [r0]
	b _08148204
	.align 2, 0
_081481F0: .4byte gUnknown_203F3D4
_081481F4: .4byte 0x000082f4
_081481F8: .4byte 0x000082e4
_081481FC: .4byte 0x000082fc
_08148200:
	adds r0, 0x4D
	strb r1, [r0]
_08148204:
	ldr r0, _08148280 @ =gUnknown_203F3D4
	ldr r1, [r0]
	mov r0, sp
	ldrh r0, [r0, 0x2]
	adds r2, r1, 0
	adds r2, 0x72
	strh r0, [r2]
	mov r0, sp
	ldrh r2, [r0, 0x4]
	adds r0, r1, 0
	adds r0, 0x74
	strh r2, [r0]
	ldr r0, _08148284 @ =0x000082f6
	adds r1, r0
	mov r2, r8
	strh r2, [r1]
_08148224:
	movs r4, 0x1
	ldr r2, _08148280 @ =gUnknown_203F3D4
	ldr r0, [r2]
	ldrb r0, [r0, 0x5]
	cmp r4, r0
	bge _08148272
	adds r7, r2, 0
	ldr r6, _08148288 @ =0x0000830c
	movs r5, 0x28
_08148236:
	ldr r1, [r7]
	ldrb r3, [r1, 0x6]
	cmp r4, r3
	beq _08148264
	adds r0, r1, r5
	ldr r3, _0814828C @ =0x000082f4
	adds r0, r3
	ldrh r0, [r0]
	mov r8, r0
	adds r0, r1, r6
	adds r1, r4, 0
	str r2, [sp, 0xC]
	bl sub_8149C90
	ldr r2, [sp, 0xC]
	cmp r0, 0
	beq _08148264
	ldr r0, [r7]
	adds r0, r5
	ldr r1, _08148284 @ =0x000082f6
	adds r0, r1
	mov r3, r8
	strh r3, [r0]
_08148264:
	adds r6, 0x28
	adds r5, 0x28
	adds r4, 0x1
	ldr r0, [r2]
	ldrb r0, [r0, 0x5]
	cmp r4, r0
	blt _08148236
_08148272:
	add sp, 0x10
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08148280: .4byte gUnknown_203F3D4
_08148284: .4byte 0x000082f6
_08148288: .4byte 0x0000830c
_0814828C: .4byte 0x000082f4
	thumb_func_end sub_8148174

	thumb_func_start sub_8148290
sub_8148290: @ 8148290
	push {r4,lr}
	bl sub_8148174
	ldr r4, _081482EC @ =gUnknown_203F3D4
	ldr r2, [r4]
	adds r0, r2, 0
	adds r0, 0x48
	ldrb r0, [r0]
	cmp r0, 0
	beq _081482DC
	ldr r1, _081482F0 @ =gUnknown_846B670
	adds r0, r2, 0
	adds r0, 0x70
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	bl _call_via_r0
	adds r1, r0, 0
	cmp r1, 0
	bne _081482DC
	ldr r0, [r4]
	adds r0, 0x48
	strb r1, [r0]
	ldr r1, [r4]
	ldrb r2, [r1, 0x6]
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r2, _081482F4 @ =0x000082fc
	adds r1, r2
	adds r1, r0
	movs r0, 0x1
	str r0, [r1]
	movs r0, 0x3
	bl sub_8147F10
_081482DC:
	bl sub_81492D8
	bl sub_81482F8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081482EC: .4byte gUnknown_203F3D4
_081482F0: .4byte gUnknown_846B670
_081482F4: .4byte 0x000082fc
	thumb_func_end sub_8148290

	thumb_func_start sub_81482F8
sub_81482F8: @ 81482F8
	push {r4,lr}
	ldr r4, _08148338 @ =gUnknown_203F3D4
	ldr r2, [r4]
	ldr r0, [r2, 0x2C]
	cmp r0, 0
	bne _08148320
	ldrb r1, [r2, 0x6]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	ldr r1, _0814833C @ =0x000082e4
	adds r0, r1
	adds r0, r2, r0
	adds r1, r2, 0
	adds r1, 0x70
	ldrb r1, [r1]
	adds r2, 0x42
	ldrh r2, [r2]
	bl sub_8149BF4
_08148320:
	ldr r1, [r4]
	ldr r2, [r1, 0x30]
	ldr r0, _08148340 @ =0x00001111
	cmp r2, r0
	beq _08148332
	ldr r0, [r1, 0x2C]
	adds r0, 0x1
	ands r0, r2
	str r0, [r1, 0x2C]
_08148332:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08148338: .4byte gUnknown_203F3D4
_0814833C: .4byte 0x000082e4
_08148340: .4byte 0x00001111
	thumb_func_end sub_81482F8

	thumb_func_start sub_8148344
sub_8148344: @ 8148344
	push {r4,lr}
	ldr r4, _08148358 @ =gUnknown_203F3D4
	ldr r0, [r4]
	ldrh r0, [r0, 0x8]
	cmp r0, 0
	beq _0814835C
	cmp r0, 0x1
	beq _0814836A
	b _08148390
	.align 2, 0
_08148358: .4byte gUnknown_203F3D4
_0814835C:
	movs r0, 0x3
	bl sub_8147F10
	ldr r1, [r4]
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
_0814836A:
	bl sub_81488DC
	cmp r0, 0
	bne _08148390
	ldr r0, _0814838C @ =gUnknown_203F3D4
	ldr r1, [r0]
	adds r0, r1, 0
	adds r0, 0x4A
	ldrh r0, [r0]
	adds r2, r1, 0
	adds r2, 0x72
	strh r0, [r2]
	adds r1, 0x4C
	movs r0, 0x1
	strb r0, [r1]
	movs r0, 0
	b _08148392
	.align 2, 0
_0814838C: .4byte gUnknown_203F3D4
_08148390:
	movs r0, 0x1
_08148392:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8148344

	thumb_func_start sub_8148398
sub_8148398: @ 8148398
	push {r4,lr}
	ldr r4, _081483AC @ =gUnknown_203F3D4
	ldr r0, [r4]
	ldrh r0, [r0, 0x8]
	cmp r0, 0
	beq _081483B0
	cmp r0, 0x1
	beq _081483C6
	movs r0, 0x1
	b _081483CA
	.align 2, 0
_081483AC: .4byte gUnknown_203F3D4
_081483B0:
	movs r0, 0
	bl sub_8147F10
	ldr r1, [r4]
	adds r0, r1, 0
	adds r0, 0x72
	ldrh r0, [r0]
	str r0, [r1, 0x24]
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
_081483C6:
	bl sub_81488DC
_081483CA:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8148398

	thumb_func_start sub_81483D0
sub_81483D0: @ 81483D0
	push {r4,lr}
	ldr r4, _081483E4 @ =gUnknown_203F3D4
	ldr r1, [r4]
	ldrh r0, [r1, 0x8]
	cmp r0, 0
	beq _081483E8
	cmp r0, 0x1
	beq _081483FC
	b _08148410
	.align 2, 0
_081483E4: .4byte gUnknown_203F3D4
_081483E8:
	bl sub_81491E4
	movs r0, 0x5
	bl sub_8147F10
	ldr r1, [r4]
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	b _08148410
_081483FC:
	adds r0, r1, 0
	adds r0, 0x49
	ldrb r0, [r0]
	cmp r0, 0
	beq _08148410
	adds r1, 0x4C
	movs r0, 0x2
	strb r0, [r1]
	movs r0, 0
	b _08148412
_08148410:
	movs r0, 0x1
_08148412:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_81483D0

	thumb_func_start sub_8148418
sub_8148418: @ 8148418
	push {r4,lr}
	ldr r4, _0814842C @ =gUnknown_203F3D4
	ldr r0, [r4]
	ldrh r0, [r0, 0x8]
	cmp r0, 0
	beq _08148430
	cmp r0, 0x1
	beq _0814844E
	b _0814845A
	.align 2, 0
_0814842C: .4byte gUnknown_203F3D4
_08148430:
	bl sub_81491E4
	movs r0, 0
	bl sub_8147F10
	ldr r1, [r4]
	adds r0, r1, 0
	adds r0, 0x72
	ldrh r0, [r0]
	adds r2, r1, 0
	adds r2, 0x4A
	strh r0, [r2]
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
_0814844E:
	bl sub_8149804
	cmp r0, 0
	beq _0814845A
	movs r0, 0
	b _0814845C
_0814845A:
	movs r0, 0x1
_0814845C:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8148418

	thumb_func_start sub_8148464
sub_8148464: @ 8148464
	push {lr}
	bl sub_81489C8
	cmp r0, 0
	bne _0814848C
	ldr r0, _08148488 @ =gUnknown_203F3D4
	ldr r1, [r0]
	adds r0, r1, 0
	adds r0, 0x4A
	ldrh r0, [r0]
	adds r2, r1, 0
	adds r2, 0x72
	strh r0, [r2]
	adds r1, 0x4C
	movs r0, 0x1
	strb r0, [r1]
	b _081484A6
	.align 2, 0
_08148488: .4byte gUnknown_203F3D4
_0814848C:
	bl sub_8149630
	cmp r0, 0
	beq _08148498
	movs r0, 0x1
	b _081484A8
_08148498:
	bl sub_81491B4
	ldr r0, _081484AC @ =gUnknown_203F3D4
	ldr r0, [r0]
	adds r0, 0x4C
	movs r1, 0x3
	strb r1, [r0]
_081484A6:
	movs r0, 0
_081484A8:
	pop {r1}
	bx r1
	.align 2, 0
_081484AC: .4byte gUnknown_203F3D4
	thumb_func_end sub_8148464

	thumb_func_start sub_81484B0
sub_81484B0: @ 81484B0
	push {lr}
	bl sub_81489C8
	cmp r0, 0
	beq _081484CA
	bl sub_8149630
	cmp r0, 0
	beq _081484C6
	movs r0, 0x1
	b _081484CC
_081484C6:
	bl sub_81491B4
_081484CA:
	movs r0, 0
_081484CC:
	pop {r1}
	bx r1
	thumb_func_end sub_81484B0

	thumb_func_start sub_81484D0
sub_81484D0: @ 81484D0
	push {r4,lr}
	ldr r4, _081484E8 @ =gUnknown_203F3D4
	ldr r0, [r4]
	ldrh r0, [r0, 0x8]
	cmp r0, 0x1
	beq _08148508
	cmp r0, 0x1
	bgt _081484EC
	cmp r0, 0
	beq _081484F2
	b _08148564
	.align 2, 0
_081484E8: .4byte gUnknown_203F3D4
_081484EC:
	cmp r0, 0x2
	beq _0814855C
	b _08148564
_081484F2:
	bl sub_8149630
	bl sub_81496D4
	cmp r0, 0
	beq _08148564
	ldr r1, [r4]
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	b _08148564
_08148508:
	bl sub_8148A60
	cmp r0, 0
	bne _08148564
	bl sub_81498B4
	cmp r0, 0
	beq _0814852A
	bl sub_81498D8
	ldr r1, [r4]
	adds r2, r1, 0
	adds r2, 0x72
	strh r0, [r2]
	adds r1, 0x4C
	movs r0, 0x7
	b _08148550
_0814852A:
	ldr r1, [r4]
	adds r0, r1, 0
	adds r0, 0x74
	ldrh r0, [r0]
	cmp r0, 0xC7
	bls _08148544
	ldrh r0, [r1, 0xE]
	adds r2, r1, 0
	adds r2, 0x72
	strh r0, [r2]
	adds r1, 0x4C
	movs r0, 0x8
	b _08148550
_08148544:
	ldrh r0, [r1, 0xE]
	adds r2, r1, 0
	adds r2, 0x72
	strh r0, [r2]
	adds r1, 0x4C
	movs r0, 0x4
_08148550:
	strb r0, [r1]
	ldr r0, _08148560 @ =gUnknown_203F3D4
	ldr r1, [r0]
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
_0814855C:
	movs r0, 0
	b _08148566
	.align 2, 0
_08148560: .4byte gUnknown_203F3D4
_08148564:
	movs r0, 0x1
_08148566:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_81484D0

	thumb_func_start sub_814856C
sub_814856C: @ 814856C
	push {r4,lr}
	ldr r4, _08148584 @ =gUnknown_203F3D4
	ldr r0, [r4]
	ldrh r0, [r0, 0x8]
	cmp r0, 0x1
	beq _081485AC
	cmp r0, 0x1
	bgt _08148588
	cmp r0, 0
	beq _0814858E
	b _081485C0
	.align 2, 0
_08148584: .4byte gUnknown_203F3D4
_08148588:
	cmp r0, 0x2
	beq _081485BC
	b _081485C0
_0814858E:
	bl sub_8149630
	cmp r0, 0
	bne _0814859A
	bl sub_81491B4
_0814859A:
	bl sub_81496D4
	cmp r0, 0
	beq _081485C0
	ldr r1, [r4]
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	b _081485C0
_081485AC:
	bl sub_8148A60
	cmp r0, 0
	bne _081485C0
	ldr r1, [r4]
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
_081485BC:
	movs r0, 0
	b _081485C2
_081485C0:
	movs r0, 0x1
_081485C2:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_814856C

	thumb_func_start sub_81485C8
sub_81485C8: @ 81485C8
	push {r4,lr}
	ldr r4, _081485E0 @ =gUnknown_203F3D4
	ldr r0, [r4]
	ldrh r1, [r0, 0x8]
	cmp r1, 0x1
	beq _081485FC
	cmp r1, 0x1
	bgt _081485E4
	cmp r1, 0
	beq _081485EE
	b _0814865C
	.align 2, 0
_081485E0: .4byte gUnknown_203F3D4
_081485E4:
	cmp r1, 0x2
	beq _08148628
	cmp r1, 0x3
	beq _08148652
	b _0814865C
_081485EE:
	movs r0, 0x4
	bl sub_8147F10
	ldr r1, [r4]
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
_081485FC:
	bl sub_8148C80
	cmp r0, 0
	bne _0814865C
	ldr r4, _08148624 @ =gUnknown_203F3D4
	ldr r2, [r4]
	ldr r0, [r2, 0x78]
	adds r1, r2, 0
	adds r1, 0x74
	ldrh r1, [r1]
	adds r2, 0x72
	ldrh r2, [r2]
	bl sub_814B494
	ldr r1, [r4]
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	b _0814865C
	.align 2, 0
_08148624: .4byte gUnknown_203F3D4
_08148628:
	adds r0, 0x49
	ldrb r0, [r0]
	cmp r0, 0
	beq _0814865C
	bl sub_8149748
	cmp r0, 0
	beq _08148640
	ldr r0, [r4]
	adds r0, 0x4C
	movs r1, 0x5
	b _08148646
_08148640:
	ldr r0, [r4]
	adds r0, 0x4C
	movs r1, 0x6
_08148646:
	strb r1, [r0]
	ldr r0, _08148658 @ =gUnknown_203F3D4
	ldr r1, [r0]
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
_08148652:
	movs r0, 0
	b _0814865E
	.align 2, 0
_08148658: .4byte gUnknown_203F3D4
_0814865C:
	movs r0, 0x1
_0814865E:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_81485C8

	thumb_func_start sub_8148664
sub_8148664: @ 8148664
	push {r4,lr}
	ldr r4, _08148678 @ =gUnknown_203F3D4
	ldr r0, [r4]
	ldrh r0, [r0, 0x8]
	cmp r0, 0
	beq _0814867C
	cmp r0, 0x1
	beq _0814868A
	b _081486BC
	.align 2, 0
_08148678: .4byte gUnknown_203F3D4
_0814867C:
	movs r0, 0
	bl sub_8147F10
	ldr r1, [r4]
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
_0814868A:
	bl sub_8148C80
	cmp r0, 0
	bne _081486BC
	ldr r4, _081486B8 @ =gUnknown_203F3D4
	ldr r2, [r4]
	ldr r0, [r2, 0x78]
	adds r1, r2, 0
	adds r1, 0x74
	ldrh r1, [r1]
	adds r2, 0x72
	ldrh r2, [r2]
	bl sub_814B494
	ldr r0, [r4]
	adds r1, r0, 0
	adds r1, 0x45
	ldrb r1, [r1]
	adds r0, 0x42
	strh r1, [r0]
	movs r0, 0
	b _081486BE
	.align 2, 0
_081486B8: .4byte gUnknown_203F3D4
_081486BC:
	movs r0, 0x1
_081486BE:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8148664

	thumb_func_start sub_81486C4
sub_81486C4: @ 81486C4
	push {r4,lr}
	ldr r4, _081486D8 @ =gUnknown_203F3D4
	ldr r1, [r4]
	ldrh r0, [r1, 0x8]
	cmp r0, 0
	beq _081486DC
	cmp r0, 0x1
	beq _081486EE
	b _0814871A
	.align 2, 0
_081486D8: .4byte gUnknown_203F3D4
_081486DC:
	bl sub_8148E2C
	cmp r0, 0
	bne _0814871A
	ldr r1, [r4]
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	b _0814871A
_081486EE:
	adds r0, r1, 0
	adds r0, 0x49
	ldrb r0, [r0]
	cmp r0, 0
	beq _0814871A
	adds r0, r1, 0
	bl sub_8147B94
	bl Random
	ldr r1, [r4]
	lsls r0, 16
	lsrs r0, 16
	str r0, [r1, 0x24]
	adds r3, r1, 0
	adds r3, 0x72
	movs r2, 0
	strh r0, [r3]
	adds r1, 0x4C
	strb r2, [r1]
	movs r0, 0
	b _0814871C
_0814871A:
	movs r0, 0x1
_0814871C:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_81486C4

	thumb_func_start sub_8148724
sub_8148724: @ 8148724
	push {r4,lr}
	ldr r4, _08148738 @ =gUnknown_203F3D4
	ldr r0, [r4]
	ldrh r0, [r0, 0x8]
	cmp r0, 0
	beq _0814873C
	cmp r0, 0x1
	beq _08148752
	b _08148756
	.align 2, 0
_08148738: .4byte gUnknown_203F3D4
_0814873C:
	bl sub_8148E2C
	cmp r0, 0
	bne _08148756
	ldr r0, [r4]
	bl sub_8147B94
	ldr r1, [r4]
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
_08148752:
	movs r0, 0
	b _08148758
_08148756:
	movs r0, 0x1
_08148758:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8148724

	thumb_func_start sub_8148760
sub_8148760: @ 8148760
	push {r4,lr}
	ldr r4, _08148778 @ =gUnknown_203F3D4
	ldr r1, [r4]
	ldrh r0, [r1, 0x8]
	cmp r0, 0x1
	beq _08148788
	cmp r0, 0x1
	bgt _0814877C
	cmp r0, 0
	beq _08148782
	b _081487AC
	.align 2, 0
_08148778: .4byte gUnknown_203F3D4
_0814877C:
	cmp r0, 0x2
	beq _08148798
	b _081487AC
_08148782:
	movs r0, 0x1
	strh r0, [r1, 0x8]
	b _081487AC
_08148788:
	movs r0, 0
	bl sub_8147F10
	ldr r1, [r4]
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	b _081487AC
_08148798:
	bl sub_8148D5C
	cmp r0, 0
	bne _081487AC
	ldr r0, [r4]
	ldr r0, [r0]
	bl SetMainCallback2
	bl sub_8147B48
_081487AC:
	movs r0, 0x1
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8148760

	thumb_func_start sub_81487B4
sub_81487B4: @ 81487B4
	push {r4,lr}
	ldr r4, _081487C8 @ =gUnknown_203F3D4
	ldr r0, [r4]
	ldrh r0, [r0, 0x8]
	cmp r0, 0
	beq _081487CC
	cmp r0, 0x1
	beq _081487DC
	b _081487F8
	.align 2, 0
_081487C8: .4byte gUnknown_203F3D4
_081487CC:
	movs r0, 0x4
	bl sub_8147F10
	ldr r1, [r4]
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	b _081487F8
_081487DC:
	bl sub_8148B54
	cmp r0, 0
	bne _081487F8
	ldr r0, [r4]
	ldrh r1, [r0, 0xE]
	adds r2, r0, 0
	adds r2, 0x72
	strh r1, [r2]
	adds r0, 0x4C
	movs r1, 0x8
	strb r1, [r0]
	movs r0, 0
	b _081487FA
_081487F8:
	movs r0, 0x1
_081487FA:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_81487B4

	thumb_func_start sub_8148800
sub_8148800: @ 8148800
	push {lr}
	movs r0, 0
	bl sub_8147F10
	bl sub_8148B54
	cmp r0, 0
	beq _08148814
	movs r0, 0x1
	b _08148816
_08148814:
	movs r0, 0
_08148816:
	pop {r1}
	bx r1
	thumb_func_end sub_8148800

	thumb_func_start sub_814881C
sub_814881C: @ 814881C
	push {r4,lr}
	ldr r1, _08148834 @ =gUnknown_203F3D4
	ldr r0, [r1]
	ldrh r0, [r0, 0x8]
	adds r4, r1, 0
	cmp r0, 0x4
	bhi _081488D4
	lsls r0, 2
	ldr r1, _08148838 @ =_0814883C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08148834: .4byte gUnknown_203F3D4
_08148838: .4byte _0814883C
	.align 2, 0
_0814883C:
	.4byte _08148850
	.4byte _0814886C
	.4byte _0814887C
	.4byte _08148894
	.4byte _081488B8
_08148850:
	ldr r2, [r4]
	ldr r0, [r2, 0x78]
	adds r1, r2, 0
	adds r1, 0x74
	ldrh r1, [r1]
	adds r2, 0x72
	ldrh r2, [r2]
	bl sub_814B494
	movs r0, 0x5
	bl sub_8149D40
	ldr r1, [r4]
	b _081488A8
_0814886C:
	bl sub_8149D68
	cmp r0, 0
	bne _081488D4
	movs r0, 0
	bl sub_8147F10
	b _081488A4
_0814887C:
	bl sub_8149804
	cmp r0, 0
	beq _081488D4
	ldr r0, _08148890 @ =sub_80DA634
	movs r1, 0x6
	bl CreateTask
	b _081488A4
	.align 2, 0
_08148890: .4byte sub_80DA634
_08148894:
	ldr r0, _081488B0 @ =sub_80DA634
	bl FuncIsActiveTask
	lsls r0, 24
	cmp r0, 0
	bne _081488D4
	bl sub_814A6CC
_081488A4:
	ldr r0, _081488B4 @ =gUnknown_203F3D4
	ldr r1, [r0]
_081488A8:
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	b _081488D4
	.align 2, 0
_081488B0: .4byte sub_80DA634
_081488B4: .4byte gUnknown_203F3D4
_081488B8:
	bl sub_814A6FC
	cmp r0, 0
	bne _081488D4
	ldr r0, _081488D0 @ =gUnknown_203F3D4
	ldr r0, [r0]
	adds r0, 0x4C
	movs r1, 0x4
	strb r1, [r0]
	movs r0, 0
	b _081488D6
	.align 2, 0
_081488D0: .4byte gUnknown_203F3D4
_081488D4:
	movs r0, 0x1
_081488D6:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_814881C

	thumb_func_start sub_81488DC
sub_81488DC: @ 81488DC
	push {r4,r5,lr}
	ldr r1, _081488F4 @ =gUnknown_203F3D4
	ldr r0, [r1]
	ldrh r0, [r0, 0xA]
	adds r4, r1, 0
	cmp r0, 0x7
	bhi _081489C0
	lsls r0, 2
	ldr r1, _081488F8 @ =_081488FC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081488F4: .4byte gUnknown_203F3D4
_081488F8: .4byte _081488FC
	.align 2, 0
_081488FC:
	.4byte _0814891C
	.4byte _08148928
	.4byte _08148948
	.4byte _08148962
	.4byte _08148974
	.4byte _0814897C
	.4byte _0814899C
	.4byte _081489B6
_0814891C:
	movs r0, 0x2
	bl sub_8149D40
	bl sub_814AAA0
	b _0814898C
_08148928:
	bl sub_8149D68
	adds r5, r0, 0
	cmp r5, 0
	bne _081489C0
	ldr r4, _08148944 @ =gUnknown_203F3D4
	ldr r0, [r4]
	ldrb r0, [r0, 0x6]
	bl sub_814AAB4
	ldr r1, [r4]
	strh r5, [r1, 0x3C]
	b _08148990
	.align 2, 0
_08148944: .4byte gUnknown_203F3D4
_08148948:
	ldr r1, [r4]
	ldrh r0, [r1, 0x3C]
	adds r0, 0x1
	strh r0, [r1, 0x3C]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x78
	bls _081489C0
	movs r0, 0x3
	bl sub_8149D40
	ldr r1, [r4]
	b _08148990
_08148962:
	bl sub_8149D68
	cmp r0, 0x1
	beq _081489C0
	bl sub_814AAC8
	cmp r0, 0x1
	beq _081489C0
	b _0814898C
_08148974:
	movs r0, 0x9
	bl sub_8149D40
	b _0814898C
_0814897C:
	bl sub_8149D68
	cmp r0, 0
	bne _081489C0
	bl sub_814935C
	bl sub_814A3E4
_0814898C:
	ldr r0, _08148998 @ =gUnknown_203F3D4
	ldr r1, [r0]
_08148990:
	ldrh r0, [r1, 0xA]
	adds r0, 0x1
	strh r0, [r1, 0xA]
	b _081489C0
	.align 2, 0
_08148998: .4byte gUnknown_203F3D4
_0814899C:
	bl sub_814A408
	cmp r0, 0
	bne _081489C0
	bl sub_814936C
	bl sub_8148F9C
	ldr r0, _081489BC @ =gUnknown_203F3D4
	ldr r1, [r0]
	ldrh r0, [r1, 0xA]
	adds r0, 0x1
	strh r0, [r1, 0xA]
_081489B6:
	movs r0, 0
	b _081489C2
	.align 2, 0
_081489BC: .4byte gUnknown_203F3D4
_081489C0:
	movs r0, 0x1
_081489C2:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_81488DC

	thumb_func_start sub_81489C8
sub_81489C8: @ 81489C8
	push {r4,r5,lr}
	bl sub_8148FE0
	ldr r5, _081489E0 @ =gUnknown_203F3D4
	ldr r1, [r5]
	ldrh r4, [r1, 0x36]
	cmp r4, 0
	beq _081489E4
	movs r0, 0
	strh r0, [r1, 0x36]
	b _08148A58
	.align 2, 0
_081489E0: .4byte gUnknown_203F3D4
_081489E4:
	ldrh r0, [r1, 0xA]
	cmp r0, 0x1
	beq _08148A10
	cmp r0, 0x1
	bgt _081489F4
	cmp r0, 0
	beq _081489FE
	b _08148A56
_081489F4:
	cmp r0, 0x2
	beq _08148A34
	cmp r0, 0x3
	beq _08148A48
	b _08148A56
_081489FE:
	movs r0, 0
	bl sub_814922C
	cmp r0, 0
	beq _08148A56
	ldr r1, [r5]
	ldrh r0, [r1, 0xA]
	adds r0, 0x1
	strh r0, [r1, 0xA]
_08148A10:
	ldr r0, _08148A2C @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08148A56
	bl sub_8149260
	movs r0, 0x3
	bl sub_8147F10
	ldr r0, _08148A30 @ =gUnknown_203F3D4
	ldr r1, [r0]
	b _08148A40
	.align 2, 0
_08148A2C: .4byte gMain
_08148A30: .4byte gUnknown_203F3D4
_08148A34:
	movs r0, 0x1
	bl sub_814922C
	cmp r0, 0x1
	bne _08148A56
	ldr r1, [r5]
_08148A40:
	ldrh r0, [r1, 0xA]
	adds r0, 0x1
	strh r0, [r1, 0xA]
	b _08148A56
_08148A48:
	movs r0, 0
	bl sub_814922C
	cmp r0, 0x1
	bne _08148A56
	ldr r0, [r5]
	strh r4, [r0, 0xA]
_08148A56:
	movs r0, 0x1
_08148A58:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_81489C8

	thumb_func_start sub_8148A60
sub_8148A60: @ 8148A60
	push {r4-r6,lr}
	ldr r1, _08148A78 @ =gUnknown_203F3D4
	ldr r0, [r1]
	ldrh r0, [r0, 0xA]
	adds r5, r1, 0
	cmp r0, 0x4
	bhi _08148B4C
	lsls r0, 2
	ldr r1, _08148A7C @ =_08148A80
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08148A78: .4byte gUnknown_203F3D4
_08148A7C: .4byte _08148A80
	.align 2, 0
_08148A80:
	.4byte _08148A94
	.4byte _08148AB8
	.4byte _08148AFC
	.4byte _08148B20
	.4byte _08148B42
_08148A94:
	movs r4, 0
	ldr r0, [r5]
	ldrb r0, [r0, 0x5]
	cmp r4, r0
	bge _08148AB4
	adds r6, r5, 0
_08148AA0:
	adds r0, r4, 0
	bl sub_814AA78
	cmp r0, 0x1
	beq _08148B4C
	adds r4, 0x1
	ldr r0, [r6]
	ldrb r0, [r0, 0x5]
	cmp r4, r0
	blt _08148AA0
_08148AB4:
	ldr r1, [r5]
	b _08148B18
_08148AB8:
	movs r4, 0
	ldr r0, [r5]
	ldrb r0, [r0, 0x5]
	cmp r4, r0
	bge _08148AE8
	adds r6, r5, 0
	movs r5, 0
_08148AC6:
	ldr r0, [r6]
	adds r0, r5
	ldr r1, _08148AF4 @ =0x000082f4
	adds r0, r1
	ldrh r0, [r0]
	cmp r0, 0x2
	bne _08148ADC
	lsls r0, r4, 24
	lsrs r0, 24
	bl sub_814AA60
_08148ADC:
	adds r5, 0x28
	adds r4, 0x1
	ldr r0, [r6]
	ldrb r0, [r0, 0x5]
	cmp r4, r0
	blt _08148AC6
_08148AE8:
	movs r0, 0x1
	bl sub_8149D40
	ldr r0, _08148AF8 @ =gUnknown_203F3D4
	ldr r1, [r0]
	b _08148B14
	.align 2, 0
_08148AF4: .4byte 0x000082f4
_08148AF8: .4byte gUnknown_203F3D4
_08148AFC:
	ldr r1, [r5]
	ldrh r0, [r1, 0x3C]
	adds r0, 0x1
	strh r0, [r1, 0x3C]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x64
	bls _08148B4C
	movs r0, 0x3
	bl sub_8149D40
	ldr r1, [r5]
_08148B14:
	movs r0, 0
	strh r0, [r1, 0x3C]
_08148B18:
	ldrh r0, [r1, 0xA]
	adds r0, 0x1
	strh r0, [r1, 0xA]
	b _08148B4C
_08148B20:
	bl sub_8149D68
	adds r5, r0, 0
	cmp r5, 0
	bne _08148B4C
	bl sub_814AA8C
	ldr r4, _08148B48 @ =gUnknown_203F3D4
	ldr r0, [r4]
	adds r0, 0x71
	strb r5, [r0]
	bl sub_8149210
	ldr r1, [r4]
	ldrh r0, [r1, 0xA]
	adds r0, 0x1
	strh r0, [r1, 0xA]
_08148B42:
	movs r0, 0
	b _08148B4E
	.align 2, 0
_08148B48: .4byte gUnknown_203F3D4
_08148B4C:
	movs r0, 0x1
_08148B4E:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_8148A60

	thumb_func_start sub_8148B54
sub_8148B54: @ 8148B54
	push {r4,lr}
	ldr r1, _08148B70 @ =gUnknown_203F3D4
	ldr r0, [r1]
	ldrh r0, [r0, 0xA]
	adds r4, r1, 0
	cmp r0, 0x6
	bls _08148B64
	b _08148C78
_08148B64:
	lsls r0, 2
	ldr r1, _08148B74 @ =_08148B78
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08148B70: .4byte gUnknown_203F3D4
_08148B74: .4byte _08148B78
	.align 2, 0
_08148B78:
	.4byte _08148B94
	.4byte _08148BB4
	.4byte _08148BCC
	.4byte _08148BFC
	.4byte _08148BB4
	.4byte _08148BCC
	.4byte _08148C6C
_08148B94:
	ldr r2, [r4]
	adds r0, r2, 0
	adds r0, 0x72
	ldrh r0, [r0]
	adds r1, r2, 0
	adds r1, 0x3E
	adds r2, 0x40
	bl sub_8149900
	ldr r1, [r4]
	ldrh r0, [r1, 0x3E]
	adds r1, 0x40
	ldrh r1, [r1]
	bl sub_814A468
	b _08148BEC
_08148BB4:
	bl sub_814A62C
	adds r2, r0, 0
	cmp r2, 0
	bne _08148C78
	ldr r0, _08148BC8 @ =gUnknown_203F3D4
	ldr r1, [r0]
	strh r2, [r1, 0x3C]
	b _08148BEE
	.align 2, 0
_08148BC8: .4byte gUnknown_203F3D4
_08148BCC:
	ldr r1, [r4]
	ldrh r0, [r1, 0x3C]
	adds r2, r0, 0x1
	strh r2, [r1, 0x3C]
	ldr r0, _08148BF8 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0
	bne _08148BE8
	lsls r0, r2, 16
	lsrs r0, 16
	cmp r0, 0xB4
	bls _08148C78
_08148BE8:
	bl sub_814A6CC
_08148BEC:
	ldr r1, [r4]
_08148BEE:
	ldrh r0, [r1, 0xA]
	adds r0, 0x1
	strh r0, [r1, 0xA]
	b _08148C78
	.align 2, 0
_08148BF8: .4byte gMain
_08148BFC:
	bl sub_814A6FC
	cmp r0, 0
	bne _08148C78
	ldr r4, _08148C48 @ =gUnknown_203F3D4
	ldr r1, [r4]
	ldrh r0, [r1, 0x3E]
	adds r1, 0x40
	ldrh r1, [r1]
	bl sub_8149978
	ldr r1, [r4]
	adds r2, r1, 0
	adds r2, 0x40
	strh r0, [r2]
	lsls r0, 16
	cmp r0, 0
	beq _08148C54
	ldrh r0, [r1, 0x3E]
	ldrh r1, [r2]
	bl sub_809A084
	lsls r0, 24
	cmp r0, 0
	beq _08148C54
	ldr r0, [r4]
	ldrh r0, [r0, 0x3E]
	movs r1, 0x1
	bl sub_809A000
	lsls r0, 24
	cmp r0, 0
	bne _08148C4C
	ldr r0, [r4]
	ldrh r0, [r0, 0x3E]
	bl sub_814A53C
	b _08148C5E
	.align 2, 0
_08148C48: .4byte gUnknown_203F3D4
_08148C4C:
	ldr r1, [r4]
	movs r0, 0x6
	strh r0, [r1, 0xA]
	b _08148C78
_08148C54:
	ldr r4, _08148C68 @ =gUnknown_203F3D4
	ldr r0, [r4]
	ldrh r0, [r0, 0x3E]
	bl sub_814A5B4
_08148C5E:
	ldr r1, [r4]
	movs r0, 0x4
	strh r0, [r1, 0xA]
	b _08148C78
	.align 2, 0
_08148C68: .4byte gUnknown_203F3D4
_08148C6C:
	bl sub_814A6FC
	cmp r0, 0
	bne _08148C78
	movs r0, 0
	b _08148C7A
_08148C78:
	movs r0, 0x1
_08148C7A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8148B54

	thumb_func_start sub_8148C80
sub_8148C80: @ 8148C80
	push {r4,lr}
	ldr r0, _08148C98 @ =gUnknown_203F3D4
	ldr r0, [r0]
	ldrh r0, [r0, 0xA]
	cmp r0, 0x6
	bhi _08148D54
	lsls r0, 2
	ldr r1, _08148C9C @ =_08148CA0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08148C98: .4byte gUnknown_203F3D4
_08148C9C: .4byte _08148CA0
	.align 2, 0
_08148CA0:
	.4byte _08148CBC
	.4byte _08148CC0
	.4byte _08148CCA
	.4byte _08148D18
	.4byte _08148D22
	.4byte _08148D38
	.4byte _08148D4A
_08148CBC:
	movs r0, 0x4
	b _08148D24
_08148CC0:
	bl sub_8149D68
	cmp r0, 0
	bne _08148D54
	b _08148D28
_08148CCA:
	bl sub_814A744
	lsls r0, 24
	asrs r1, r0, 24
	cmp r1, 0
	beq _08148D00
	cmp r1, 0
	bgt _08148CE4
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _08148CE8
	b _08148D54
_08148CE4:
	cmp r1, 0x1
	bne _08148D54
_08148CE8:
	ldr r4, _08148CFC @ =gUnknown_203F3D4
	ldr r0, [r4]
	adds r0, 0x45
	movs r1, 0x1
	strb r1, [r0]
	movs r0, 0x6
	bl sub_8149D40
	ldr r1, [r4]
	b _08148D2C
	.align 2, 0
_08148CFC: .4byte gUnknown_203F3D4
_08148D00:
	ldr r4, _08148D14 @ =gUnknown_203F3D4
	ldr r0, [r4]
	adds r0, 0x45
	movs r1, 0x2
	strb r1, [r0]
	movs r0, 0x6
	bl sub_8149D40
	ldr r1, [r4]
	b _08148D2C
	.align 2, 0
_08148D14: .4byte gUnknown_203F3D4
_08148D18:
	bl sub_8149D68
	cmp r0, 0
	bne _08148D54
	b _08148D28
_08148D22:
	movs r0, 0x8
_08148D24:
	bl sub_8149D40
_08148D28:
	ldr r0, _08148D34 @ =gUnknown_203F3D4
	ldr r1, [r0]
_08148D2C:
	ldrh r0, [r1, 0xA]
	adds r0, 0x1
	strh r0, [r1, 0xA]
	b _08148D54
	.align 2, 0
_08148D34: .4byte gUnknown_203F3D4
_08148D38:
	bl sub_8149D68
	cmp r0, 0
	bne _08148D54
	ldr r0, _08148D50 @ =gUnknown_203F3D4
	ldr r1, [r0]
	ldrh r0, [r1, 0xA]
	adds r0, 0x1
	strh r0, [r1, 0xA]
_08148D4A:
	movs r0, 0
	b _08148D56
	.align 2, 0
_08148D50: .4byte gUnknown_203F3D4
_08148D54:
	movs r0, 0x1
_08148D56:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8148C80

	thumb_func_start sub_8148D5C
sub_8148D5C: @ 8148D5C
	push {r4,lr}
	sub sp, 0x4
	ldr r1, _08148D78 @ =gUnknown_203F3D4
	ldr r0, [r1]
	ldrh r0, [r0, 0xA]
	adds r4, r1, 0
	cmp r0, 0x5
	bhi _08148E20
	lsls r0, 2
	ldr r1, _08148D7C @ =_08148D80
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08148D78: .4byte gUnknown_203F3D4
_08148D7C: .4byte _08148D80
	.align 2, 0
_08148D80:
	.4byte _08148D98
	.4byte _08148D9E
	.4byte _08148DAE
	.4byte _08148DC4
	.4byte _08148DEA
	.4byte _08148E10
_08148D98:
	bl sub_814A6CC
	b _08148DFA
_08148D9E:
	bl sub_814A6FC
	cmp r0, 0
	bne _08148E20
	movs r0, 0x7
	bl sub_8149D40
	b _08148DFA
_08148DAE:
	bl sub_8149D68
	adds r2, r0, 0
	cmp r2, 0
	bne _08148E20
	ldr r0, _08148DC0 @ =gUnknown_203F3D4
	ldr r1, [r0]
	strh r2, [r1, 0x3C]
	b _08148DFE
	.align 2, 0
_08148DC0: .4byte gUnknown_203F3D4
_08148DC4:
	ldr r1, [r4]
	ldrh r0, [r1, 0x3C]
	adds r0, 0x1
	strh r0, [r1, 0x3C]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x78
	bls _08148E20
	movs r1, 0x1
	negs r1, r1
	movs r0, 0
	str r0, [sp]
	adds r0, r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, [r4]
	b _08148DFE
_08148DEA:
	ldr r0, _08148E08 @ =gUnknown_2037AB8
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08148E20
	bl sub_800AAC0
_08148DFA:
	ldr r0, _08148E0C @ =gUnknown_203F3D4
	ldr r1, [r0]
_08148DFE:
	ldrh r0, [r1, 0xA]
	adds r0, 0x1
	strh r0, [r1, 0xA]
	b _08148E20
	.align 2, 0
_08148E08: .4byte gUnknown_2037AB8
_08148E0C: .4byte gUnknown_203F3D4
_08148E10:
	ldr r0, _08148E1C @ =gUnknown_3003F64
	ldrb r0, [r0]
	cmp r0, 0
	bne _08148E20
	movs r0, 0
	b _08148E22
	.align 2, 0
_08148E1C: .4byte gUnknown_3003F64
_08148E20:
	movs r0, 0x1
_08148E22:
	add sp, 0x4
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8148D5C

	thumb_func_start sub_8148E2C
sub_8148E2C: @ 8148E2C
	push {r4,lr}
	ldr r4, _08148E44 @ =gUnknown_203F3D4
	ldr r0, [r4]
	ldrh r0, [r0, 0xA]
	cmp r0, 0x1
	beq _08148E62
	cmp r0, 0x1
	bgt _08148E48
	cmp r0, 0
	beq _08148E4E
	b _08148E76
	.align 2, 0
_08148E44: .4byte gUnknown_203F3D4
_08148E48:
	cmp r0, 0x2
	beq _08148E72
	b _08148E76
_08148E4E:
	bl sub_814A6CC
	movs r0, 0
	bl sub_814AA24
	ldr r1, [r4]
	ldrh r0, [r1, 0xA]
	adds r0, 0x1
	strh r0, [r1, 0xA]
	b _08148E76
_08148E62:
	bl sub_814A6FC
	cmp r0, 0
	bne _08148E76
	ldr r1, [r4]
	ldrh r0, [r1, 0xA]
	adds r0, 0x1
	strh r0, [r1, 0xA]
_08148E72:
	movs r0, 0
	b _08148E78
_08148E76:
	movs r0, 0x1
_08148E78:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8148E2C

	thumb_func_start sub_8148E80
sub_8148E80: @ 8148E80
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	lsls r0, 2
	add r0, r10
	lsls r0, 3
	ldr r1, _08148EB4 @ =gTasks+0x8
	adds r6, r0, r1
	mov r0, r10
	movs r1, 0xE
	bl GetWordTaskArg
	mov r8, r0
	movs r1, 0
	ldrsh r0, [r6, r1]
	cmp r0, 0
	beq _08148EC4
	cmp r0, 0x1
	beq _08148ED8
	b _08148F44
	.align 2, 0
_08148EB4: .4byte gTasks+0x8
_08148EB8:
	bl sub_8147C20
	mov r0, r10
	bl DestroyTask
	b _08148F44
_08148EC4:
	movs r1, 0
	adds r0, r6, 0
	adds r0, 0x8
_08148ECA:
	strh r1, [r0, 0x4]
	subs r0, 0x2
	cmp r0, r6
	bge _08148ECA
	ldrh r0, [r6]
	adds r0, 0x1
	strh r0, [r6]
_08148ED8:
	mov r3, r8
	ldrb r1, [r3, 0x6]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r4, _08148F54 @ =0x000082a8
	adds r0, r4
	add r0, r8
	bl sub_8149A6C
	movs r2, 0
	adds r5, r6, 0x4
	mov r9, r2
	movs r7, 0x83
	lsls r7, 8
	add r7, r8
	add r4, r8
_08148EFA:
	movs r1, 0
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _08148F34
	adds r0, r2, 0
	adds r1, r4, 0
	str r2, [sp]
	bl sub_8149A90
	ldr r2, [sp]
	cmp r0, 0
	beq _08148F34
	ldr r1, _08148F58 @ =gUnknown_2022744
	add r1, r9
	adds r0, r7, 0
	bl StringCopy
	movs r0, 0x1
	strh r0, [r5]
	ldrh r0, [r6, 0x2]
	adds r0, 0x1
	strh r0, [r6, 0x2]
	movs r3, 0x2
	ldrsh r0, [r6, r3]
	ldr r2, [sp]
	mov r1, r8
	ldrb r1, [r1, 0x5]
	cmp r0, r1
	beq _08148EB8
_08148F34:
	adds r5, 0x2
	movs r3, 0x1C
	add r9, r3
	adds r7, 0x28
	adds r4, 0xC
	adds r2, 0x1
	cmp r2, 0x4
	ble _08148EFA
_08148F44:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08148F54: .4byte 0x000082a8
_08148F58: .4byte gUnknown_2022744
	thumb_func_end sub_8148E80

	thumb_func_start sub_8148F5C
sub_8148F5C: @ 8148F5C
	push {lr}
	lsls r1, 24
	lsrs r1, 24
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08148F78 @ =gUnknown_203F3D4
	ldr r2, [r1]
	movs r1, 0xE
	bl SetWordTaskArg
	pop {r0}
	bx r0
	.align 2, 0
_08148F78: .4byte gUnknown_203F3D4
	thumb_func_end sub_8148F5C

	thumb_func_start sub_8148F7C
sub_8148F7C: @ 8148F7C
	ldr r0, _08148F98 @ =gUnknown_203F3D4
	ldr r2, [r0]
	adds r0, r2, 0
	adds r0, 0x4A
	movs r1, 0
	strh r1, [r0]
	movs r0, 0x6
	str r0, [r2, 0x14]
	strh r1, [r2, 0x34]
	str r1, [r2, 0x1C]
	strh r1, [r2, 0x36]
	str r1, [r2, 0x10]
	bx lr
	.align 2, 0
_08148F98: .4byte gUnknown_203F3D4
	thumb_func_end sub_8148F7C

	thumb_func_start sub_8148F9C
sub_8148F9C: @ 8148F9C
	push {r4,lr}
	ldr r3, _08148FD8 @ =gUnknown_203F3D4
	ldr r0, [r3]
	adds r1, r0, 0
	adds r1, 0x4A
	movs r4, 0
	movs r2, 0
	strh r2, [r1]
	ldr r1, _08148FDC @ =0x000006ff
	strh r1, [r0, 0x34]
	movs r1, 0x7
	str r1, [r0, 0x14]
	strh r2, [r0, 0x36]
	str r2, [r0, 0x10]
	adds r0, 0x51
	strb r4, [r0]
	ldr r0, [r3]
	adds r0, 0x50
	strb r4, [r0]
	ldr r0, [r3]
	str r2, [r0, 0x20]
	adds r1, r0, 0
	adds r1, 0x4E
	strh r2, [r1]
	str r2, [r0, 0x6C]
	bl sub_8149078
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08148FD8: .4byte gUnknown_203F3D4
_08148FDC: .4byte 0x000006ff
	thumb_func_end sub_8148F9C

	thumb_func_start sub_8148FE0
sub_8148FE0: @ 8148FE0
	push {r4,lr}
	ldr r4, _08149038 @ =gUnknown_203F3D4
	ldr r1, [r4]
	adds r0, r1, 0
	adds r0, 0x46
	ldrb r0, [r0]
	cmp r0, 0
	beq _08149030
	adds r1, 0x4A
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	bl sub_8149044
	ldr r3, [r4]
	ldrh r1, [r3, 0x34]
	adds r2, r1, r0
	strh r2, [r3, 0x34]
	lsls r1, r2, 16
	ldr r0, _0814903C @ =0x09fe0000
	cmp r1, r0
	bls _08149012
	ldr r1, _08149040 @ =0xfffff601
	adds r0, r2, r1
	strh r0, [r3, 0x34]
_08149012:
	ldr r1, [r4]
	ldr r2, [r1, 0x14]
	str r2, [r1, 0x18]
	ldrh r0, [r1, 0x34]
	lsrs r0, 8
	str r0, [r1, 0x14]
	cmp r0, 0x6
	bls _08149030
	cmp r2, 0x6
	bhi _08149030
	ldrh r0, [r1, 0x36]
	adds r0, 0x1
	strh r0, [r1, 0x36]
	bl sub_8149078
_08149030:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08149038: .4byte gUnknown_203F3D4
_0814903C: .4byte 0x09fe0000
_08149040: .4byte 0xfffff601
	thumb_func_end sub_8148FE0

	thumb_func_start sub_8149044
sub_8149044: @ 8149044
	push {lr}
	ldr r0, _08149054 @ =gUnknown_203F3D4
	ldr r2, [r0]
	ldr r0, [r2, 0x10]
	cmp r0, 0
	beq _08149058
	movs r0, 0
	b _0814906E
	.align 2, 0
_08149054: .4byte gUnknown_203F3D4
_08149058:
	ldr r3, [r2, 0x1C]
	ldrh r1, [r2, 0x34]
	ldr r0, _08149074 @ =0x000005ff
	cmp r1, r0
	bhi _0814906C
	ldr r0, [r2, 0x20]
	adds r0, 0x50
	str r0, [r2, 0x20]
	lsrs r0, 8
	adds r3, r0
_0814906C:
	adds r0, r3, 0
_0814906E:
	pop {r1}
	bx r1
	.align 2, 0
_08149074: .4byte 0x000005ff
	thumb_func_end sub_8149044

	thumb_func_start sub_8149078
sub_8149078: @ 8149078
	push {r4,lr}
	ldr r4, _081490A8 @ =gUnknown_203F3D4
	ldr r3, [r4]
	movs r0, 0
	str r0, [r3, 0x20]
	adds r1, r3, 0
	adds r1, 0x4E
	ldrh r0, [r1]
	cmp r0, 0
	beq _081490BC
	subs r0, 0x1
	strh r0, [r1]
	ldr r0, [r3, 0x6C]
	cmp r0, 0
	beq _08149186
	bl sub_8149194
	movs r1, 0x3
	ands r1, r0
	cmp r1, 0
	beq _081490AC
	ldr r1, [r4]
	b _08149182
	.align 2, 0
_081490A8: .4byte gUnknown_203F3D4
_081490AC:
	ldr r1, [r4]
	ldr r0, [r1, 0x28]
	cmp r0, 0x36
	bls _081490B8
	movs r0, 0x1E
	b _08149184
_081490B8:
	movs r0, 0x52
	b _08149184
_081490BC:
	adds r2, r3, 0
	adds r2, 0x50
	ldrb r1, [r2]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	bne _08149110
	ldr r0, _08149108 @ =gUnknown_846B694
	ldrb r1, [r2]
	lsls r1, 1
	adds r1, r0
	adds r0, r3, 0
	adds r0, 0x51
	ldrb r2, [r0]
	lsls r0, r2, 3
	subs r0, r2
	ldrh r1, [r1]
	adds r0, r1
	str r0, [r3, 0x28]
	bl sub_8149194
	ldr r2, [r4]
	ldr r3, _0814910C @ =gUnknown_846B6A4
	movs r1, 0x3
	ands r1, r0
	lsls r1, 1
	adds r1, r3
	ldrh r0, [r1]
	adds r0, 0x2
	adds r1, r2, 0
	adds r1, 0x4E
	strh r0, [r1]
	adds r2, 0x50
	ldrb r0, [r2]
	adds r0, 0x1
	strb r0, [r2]
	b _0814917E
	.align 2, 0
_08149108: .4byte gUnknown_846B694
_0814910C: .4byte gUnknown_846B6A4
_08149110:
	lsls r0, r1, 24
	lsrs r0, 24
	cmp r0, 0x8
	bne _0814912C
	adds r1, r3, 0
	adds r1, 0x51
	ldrb r0, [r1]
	cmp r0, 0x2
	bhi _08149128
	adds r0, 0x1
	strb r0, [r1]
	b _0814912C
_08149128:
	movs r0, 0x1
	str r0, [r3, 0x6C]
_0814912C:
	ldr r2, _0814918C @ =gUnknown_846B694
	ldr r4, _08149190 @ =gUnknown_203F3D4
	ldr r0, [r4]
	mov r12, r0
	mov r3, r12
	adds r3, 0x50
	ldrb r0, [r3]
	movs r1, 0xF
	subs r1, r0
	lsls r1, 1
	adds r1, r2
	mov r0, r12
	adds r0, 0x51
	ldrb r2, [r0]
	lsls r0, r2, 3
	subs r0, r2
	ldrh r1, [r1]
	adds r0, r1
	mov r1, r12
	str r0, [r1, 0x28]
	ldrb r0, [r3]
	adds r0, 0x1
	strb r0, [r3]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xF
	bls _0814917E
	bl sub_8149194
	movs r1, 0x3
	ands r1, r0
	cmp r1, 0
	bne _08149176
	ldr r1, [r4]
	ldr r0, [r1, 0x28]
	subs r0, 0x5
	str r0, [r1, 0x28]
_08149176:
	ldr r0, [r4]
	adds r0, 0x50
	movs r1, 0
	strb r1, [r0]
_0814917E:
	ldr r0, _08149190 @ =gUnknown_203F3D4
	ldr r1, [r0]
_08149182:
	ldr r0, [r1, 0x28]
_08149184:
	str r0, [r1, 0x1C]
_08149186:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0814918C: .4byte gUnknown_846B694
_08149190: .4byte gUnknown_203F3D4
	thumb_func_end sub_8149078

	thumb_func_start sub_8149194
sub_8149194: @ 8149194
	ldr r0, _081491A8 @ =gUnknown_203F3D4
	ldr r2, [r0]
	ldr r1, [r2, 0x24]
	ldr r0, _081491AC @ =0x41c64e6d
	muls r0, r1
	ldr r1, _081491B0 @ =0x00006073
	adds r0, r1
	str r0, [r2, 0x24]
	lsrs r0, 16
	bx lr
	.align 2, 0
_081491A8: .4byte gUnknown_203F3D4
_081491AC: .4byte 0x41c64e6d
_081491B0: .4byte 0x00006073
	thumb_func_end sub_8149194

	thumb_func_start sub_81491B4
sub_81491B4: @ 81491B4
	push {lr}
	ldr r0, _081491D0 @ =gUnknown_203F3D4
	ldr r1, [r0]
	movs r0, 0x1
	str r0, [r1, 0x10]
	movs r0, 0x6
	str r0, [r1, 0x14]
	ldr r0, _081491D4 @ =0x000005ff
	strh r0, [r1, 0x34]
	bl sub_814936C
	pop {r0}
	bx r0
	.align 2, 0
_081491D0: .4byte gUnknown_203F3D4
_081491D4: .4byte 0x000005ff
	thumb_func_end sub_81491B4

	thumb_func_start sub_81491D8
sub_81491D8: @ 81491D8
	ldr r0, _081491E0 @ =gUnknown_203F3D4
	ldr r0, [r0]
	ldr r0, [r0, 0x10]
	bx lr
	.align 2, 0
_081491E0: .4byte gUnknown_203F3D4
	thumb_func_end sub_81491D8

	thumb_func_start sub_81491E4
sub_81491E4: @ 81491E4
	push {r4,r5,lr}
	ldr r5, _08149208 @ =gUnknown_203F3D4
	ldr r4, _0814920C @ =0x000082f8
	movs r3, 0
	movs r2, 0
	movs r1, 0x4
_081491F0:
	ldr r0, [r5]
	adds r0, r4
	adds r0, r2
	str r3, [r0]
	adds r2, 0x28
	subs r1, 0x1
	cmp r1, 0
	bge _081491F0
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08149208: .4byte gUnknown_203F3D4
_0814920C: .4byte 0x000082f8
	thumb_func_end sub_81491E4

	thumb_func_start sub_8149210
sub_8149210: @ 8149210
	ldr r0, _08149224 @ =gUnknown_203F3D4
	ldr r0, [r0]
	ldr r1, _08149228 @ =0x000083ac
	adds r0, r1
	ldr r1, [r0]
	movs r2, 0
	strh r2, [r1, 0x10]
	ldr r0, [r0]
	strh r2, [r0, 0x12]
	bx lr
	.align 2, 0
_08149224: .4byte gUnknown_203F3D4
_08149228: .4byte 0x000083ac
	thumb_func_end sub_8149210

	thumb_func_start sub_814922C
sub_814922C: @ 814922C
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	ldr r1, _08149250 @ =gUnknown_203F3D4
	ldr r2, [r1]
	ldrb r3, [r2, 0x6]
	lsls r1, r3, 2
	adds r1, r3
	lsls r1, 3
	adds r2, r1
	ldr r1, _08149254 @ =0x000082f4
	adds r2, r1
	ldrh r1, [r2]
	cmp r1, r0
	beq _08149258
	movs r0, 0
	b _0814925A
	.align 2, 0
_08149250: .4byte gUnknown_203F3D4
_08149254: .4byte 0x000082f4
_08149258:
	movs r0, 0x1
_0814925A:
	pop {r1}
	bx r1
	thumb_func_end sub_814922C

	thumb_func_start sub_8149260
sub_8149260: @ 8149260
	ldr r0, _08149280 @ =gUnknown_203F3D4
	ldr r0, [r0]
	ldr r1, _08149284 @ =0x000083ac
	adds r2, r0, r1
	ldr r1, [r2]
	adds r0, 0x4A
	ldrh r0, [r0]
	strh r0, [r1, 0xE]
	ldr r1, [r2]
	ldrh r0, [r1, 0x10]
	strh r0, [r1, 0x12]
	ldr r1, [r2]
	movs r0, 0x1
	strh r0, [r1, 0x10]
	bx lr
	.align 2, 0
_08149280: .4byte gUnknown_203F3D4
_08149284: .4byte 0x000083ac
	thumb_func_end sub_8149260

	thumb_func_start sub_8149288
sub_8149288: @ 8149288
	push {r4,lr}
	ldr r0, _081492B0 @ =gUnknown_203F3D4
	ldr r2, [r0]
	ldr r0, _081492B4 @ =0x000083ac
	adds r3, r2, r0
	ldr r1, [r3]
	ldrh r0, [r1, 0x10]
	strh r0, [r1, 0x12]
	ldr r0, [r3]
	movs r4, 0x2
	strh r4, [r0, 0x10]
	ldr r1, [r3]
	adds r2, 0x4A
	ldrh r0, [r2]
	strh r0, [r1, 0xE]
	ldr r0, [r3]
	str r4, [r0, 0x14]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081492B0: .4byte gUnknown_203F3D4
_081492B4: .4byte 0x000083ac
	thumb_func_end sub_8149288

	thumb_func_start sub_81492B8
sub_81492B8: @ 81492B8
	ldr r0, _081492D0 @ =gUnknown_203F3D4
	ldr r0, [r0]
	ldr r1, _081492D4 @ =0x000083ac
	adds r0, r1
	ldr r1, [r0]
	ldrh r2, [r1, 0x10]
	movs r3, 0
	strh r2, [r1, 0x12]
	ldr r0, [r0]
	strh r3, [r0, 0x10]
	bx lr
	.align 2, 0
_081492D0: .4byte gUnknown_203F3D4
_081492D4: .4byte 0x000083ac
	thumb_func_end sub_81492B8

	thumb_func_start sub_81492D8
sub_81492D8: @ 81492D8
	push {r4,r5,lr}
	ldr r4, _08149334 @ =gUnknown_203F3D4
	ldr r1, [r4]
	ldr r0, [r1, 0x5C]
	cmp r0, 0
	beq _08149318
	ldr r0, [r1, 0x78]
	bl sub_814AA24
	ldr r1, [r4]
	movs r5, 0
	str r5, [r1, 0x5C]
	adds r0, r1, 0
	adds r0, 0x4D
	ldrb r0, [r0]
	cmp r0, 0
	beq _08149318
	adds r0, r1, 0
	adds r0, 0x71
	ldrb r0, [r0]
	bl sub_814A98C
	ldr r1, _08149338 @ =gUnknown_846B6AC
	subs r0, 0x2
	lsls r0, 1
	adds r0, r1
	ldrh r0, [r0]
	bl PlaySE
	ldr r0, [r4]
	adds r0, 0x4D
	strb r5, [r0]
_08149318:
	ldr r0, _08149334 @ =gUnknown_203F3D4
	ldr r0, [r0]
	adds r0, 0x74
	ldrh r0, [r0]
	bl sub_814AA34
	bl sub_814937C
	bl sub_814933C
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08149334: .4byte gUnknown_203F3D4
_08149338: .4byte gUnknown_846B6AC
	thumb_func_end sub_81492D8

	thumb_func_start sub_814933C
sub_814933C: @ 814933C
	push {lr}
	ldr r0, _08149358 @ =gUnknown_203F3D4
	ldr r1, [r0]
	adds r0, r1, 0
	adds r0, 0x46
	ldrb r0, [r0]
	cmp r0, 0
	beq _08149352
	ldr r0, [r1, 0x14]
	bl sub_814A95C
_08149352:
	pop {r0}
	bx r0
	.align 2, 0
_08149358: .4byte gUnknown_203F3D4
	thumb_func_end sub_814933C

	thumb_func_start sub_814935C
sub_814935C: @ 814935C
	ldr r0, _08149368 @ =gUnknown_203F3D4
	ldr r0, [r0]
	adds r0, 0x46
	movs r1, 0
	strb r1, [r0]
	bx lr
	.align 2, 0
_08149368: .4byte gUnknown_203F3D4
	thumb_func_end sub_814935C

	thumb_func_start sub_814936C
sub_814936C: @ 814936C
	ldr r0, _08149378 @ =gUnknown_203F3D4
	ldr r0, [r0]
	adds r0, 0x46
	movs r1, 0x1
	strb r1, [r0]
	bx lr
	.align 2, 0
_08149378: .4byte gUnknown_203F3D4
	thumb_func_end sub_814936C

	thumb_func_start sub_814937C
sub_814937C: @ 814937C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	movs r6, 0
	ldr r2, _081493B8 @ =gUnknown_203F3D4
	ldr r0, [r2]
	ldrb r0, [r0, 0x5]
	mov r9, r0
	movs r5, 0
	cmp r6, r9
	bge _0814945C
	mov r10, r2
	mov r8, r5
	movs r7, 0
_0814939E:
	mov r0, r10
	ldr r3, [r0]
	adds r1, r3, r7
	ldr r2, _081493BC @ =0x000082f4
	adds r0, r1, r2
	ldrh r2, [r0]
	cmp r2, 0x1
	beq _081493D0
	cmp r2, 0x1
	bgt _081493C0
	cmp r2, 0
	beq _081493C6
	b _08149450
	.align 2, 0
_081493B8: .4byte gUnknown_203F3D4
_081493BC: .4byte 0x000082f4
_081493C0:
	cmp r2, 0x2
	beq _08149434
	b _08149450
_081493C6:
	adds r0, r5, 0
	movs r1, 0
	bl sub_814A940
	b _08149450
_081493D0:
	ldr r0, _08149424 @ =0x000082f6
	adds r4, r1, r0
	ldrh r0, [r4]
	cmp r0, 0x1
	bne _081493F2
	ldr r0, _08149428 @ =0x000082f2
	adds r0, r1
	adds r1, r3, 0
	adds r1, 0x9A
	add r1, r8
	str r1, [sp]
	ldrh r1, [r0]
	mov r12, r1
	ldr r0, [sp]
	ldrh r0, [r0]
	cmp r12, r0
	beq _0814941A
_081493F2:
	ldrb r3, [r3, 0x6]
	cmp r5, r3
	bne _081493FA
	strh r2, [r4]
_081493FA:
	orrs r6, r2
	mov r1, r10
	ldr r2, [r1]
	ldr r1, _0814942C @ =0x000082e8
	adds r0, r2, r1
	adds r0, r7
	ldr r1, _08149430 @ =0x7fffffff
	str r1, [r0]
	adds r1, r2, 0
	adds r1, 0x9A
	add r1, r8
	adds r2, r7
	ldr r0, _08149428 @ =0x000082f2
	adds r2, r0
	ldrh r0, [r2]
	strh r0, [r1]
_0814941A:
	adds r0, r5, 0
	bl sub_8149490
	b _08149450
	.align 2, 0
_08149424: .4byte 0x000082f6
_08149428: .4byte 0x000082f2
_0814942C: .4byte 0x000082e8
_08149430: .4byte 0x7fffffff
_08149434:
	ldr r0, _0814946C @ =0x000082f6
	adds r1, r0
	ldrh r0, [r1]
	cmp r0, 0x2
	beq _08149450
	ldrb r3, [r3, 0x6]
	cmp r5, r3
	bne _08149446
	strh r2, [r1]
_08149446:
	orrs r6, r2
	lsls r0, r5, 24
	lsrs r0, 24
	bl sub_814AA48
_08149450:
	movs r1, 0x2
	add r8, r1
	adds r7, 0x28
	adds r5, 0x1
	cmp r5, r9
	blt _0814939E
_0814945C:
	movs r0, 0x2
	ands r0, r6
	cmp r0, 0
	beq _08149470
	movs r0, 0xFF
	bl PlaySE
	b _0814947E
	.align 2, 0
_0814946C: .4byte 0x000082f6
_08149470:
	movs r0, 0x1
	ands r6, r0
	cmp r6, 0
	beq _0814947E
	movs r0, 0xA
	bl PlaySE
_0814947E:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_814937C

	thumb_func_start sub_8149490
sub_8149490: @ 8149490
	push {r4-r6,lr}
	adds r6, r0, 0
	ldr r0, _081494BC @ =gUnknown_203F3D4
	ldr r2, [r0]
	ldr r0, [r2, 0x68]
	cmp r0, 0
	bne _0814952A
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	ldr r1, _081494C0 @ =0x000082e4
	adds r0, r1
	adds r5, r2, r0
	ldr r1, [r5, 0x4]
	ldr r0, _081494C4 @ =0x7fffffff
	cmp r1, r0
	beq _081494C8
	adds r0, r1, 0x1
	str r0, [r5, 0x4]
	adds r3, r0, 0
	b _081494E0
	.align 2, 0
_081494BC: .4byte gUnknown_203F3D4
_081494C0: .4byte 0x000082e4
_081494C4: .4byte 0x7fffffff
_081494C8:
	adds r0, r2, 0
	adds r0, 0x4A
	ldrh r1, [r0]
	ldrh r0, [r5, 0xE]
	subs r3, r1, r0
	ldr r0, _08149500 @ =0x0000fde7
	cmp r3, r0
	ble _081494DE
	ldr r0, _08149504 @ =0xffff0218
	adds r3, r0
	adds r3, r1
_081494DE:
	str r3, [r5, 0x4]
_081494E0:
	cmp r3, 0x3
	ble _0814952A
	subs r3, 0x4
	cmp r3, 0x2F
	bgt _0814950C
	ldr r2, _08149508 @ =gUnknown_846B6B4
	ldrh r1, [r5, 0xC]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 4
	adds r0, r3, r0
	adds r0, r2
	movs r4, 0
	ldrsb r4, [r0, r4]
	b _0814950E
	.align 2, 0
_08149500: .4byte 0x0000fde7
_08149504: .4byte 0xffff0218
_08149508: .4byte gUnknown_846B6B4
_0814950C:
	movs r4, 0
_0814950E:
	adds r1, r4, 0
	adds r0, r6, 0
	bl sub_814A940
	cmp r4, 0
	bne _08149528
	ldr r0, _08149530 @ =gUnknown_203F3D4
	ldr r0, [r0]
	ldrb r0, [r0, 0x6]
	cmp r6, r0
	bne _08149528
	bl sub_81492B8
_08149528:
	str r4, [r5]
_0814952A:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08149530: .4byte gUnknown_203F3D4
	thumb_func_end sub_8149490

	thumb_func_start sub_8149534
sub_8149534: @ 8149534
	push {r4,r5,lr}
	ldr r5, _08149560 @ =gUnknown_203F3D4
	ldr r1, [r5]
	ldr r0, [r1, 0x14]
	cmp r0, 0x8
	bne _081495C6
	ldr r0, [r1, 0x18]
	cmp r0, 0x7
	bne _081495C6
	ldr r4, [r1, 0x58]
	cmp r4, 0
	bne _08149564
	bl sub_8149878
	ldr r0, [r5]
	str r4, [r0, 0x54]
	movs r1, 0x1
	str r1, [r0, 0x58]
	adds r0, 0x71
	strb r4, [r0]
	b _081495C6
	.align 2, 0
_08149560: .4byte gUnknown_203F3D4
_08149564:
	ldr r0, [r1, 0x54]
	cmp r0, 0x5
	bne _08149578
	ldrh r0, [r1, 0xC]
	adds r0, 0x1
	strh r0, [r1, 0xC]
	ldrh r0, [r1, 0xC]
	bl sub_8149898
	b _0814957C
_08149578:
	movs r0, 0
	strh r0, [r1, 0xC]
_0814957C:
	ldr r4, _08149628 @ =gUnknown_203F3D4
	ldr r1, [r4]
	ldr r0, [r1, 0x54]
	cmp r0, 0x1
	ble _08149596
	movs r0, 0x1
	str r0, [r1, 0x64]
	adds r0, r1, 0
	adds r0, 0x86
	adds r1, 0x81
	movs r2, 0x5
	bl memcpy
_08149596:
	bl sub_8149878
	ldr r0, [r4]
	movs r2, 0
	str r2, [r0, 0x54]
	movs r1, 0x1
	str r1, [r0, 0x58]
	adds r0, 0x71
	strb r2, [r0]
	ldr r0, [r4]
	adds r2, r0, 0
	adds r2, 0x74
	ldrh r1, [r2]
	ldr r0, _0814962C @ =0x0000270e
	cmp r1, r0
	bhi _081495BA
	adds r0, r1, 0x1
	strh r0, [r2]
_081495BA:
	movs r0, 0xA
	bl sub_8149780
	movs r0, 0x3
	bl sub_8147F10
_081495C6:
	ldr r4, _08149628 @ =gUnknown_203F3D4
	ldr r0, [r4]
	ldr r0, [r0, 0x64]
	cmp r0, 0
	beq _081495FC
	bl sub_8149710
	cmp r0, 0x1
	beq _081495E0
	ldr r0, [r4]
	ldr r0, [r0, 0x14]
	cmp r0, 0
	bne _081495FC
_081495E0:
	ldr r0, [r4]
	adds r0, 0x86
	bl sub_8149834
	bl sub_8149888
	bl sub_8149780
	movs r0, 0x3
	bl sub_8147F10
	ldr r1, [r4]
	movs r0, 0
	str r0, [r1, 0x64]
_081495FC:
	ldr r4, _08149628 @ =gUnknown_203F3D4
	ldr r0, [r4]
	ldr r0, [r0, 0x58]
	cmp r0, 0
	beq _08149622
	bl sub_81497A8
	adds r2, r0, 0
	ldr r1, [r4]
	ldr r0, [r1, 0x54]
	cmp r2, r0
	ble _08149622
	str r2, [r1, 0x54]
	adds r0, r1, 0
	adds r0, 0x81
	adds r1, 0x7C
	movs r2, 0x5
	bl memcpy
_08149622:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08149628: .4byte gUnknown_203F3D4
_0814962C: .4byte 0x0000270e
	thumb_func_end sub_8149534

	thumb_func_start sub_8149630
sub_8149630: @ 8149630
	push {r4,r5,lr}
	ldr r5, _08149664 @ =gUnknown_203F3D4
	ldr r1, [r5]
	ldr r0, [r1, 0x14]
	cmp r0, 0x6
	bne _0814967A
	ldr r4, _08149668 @ =0x000083ac
	adds r0, r1, r4
	ldr r1, [r0]
	ldr r0, [r1]
	cmp r0, 0
	bne _0814967A
	ldrh r0, [r1, 0x12]
	cmp r0, 0x1
	bne _08149670
	bl sub_81491D8
	adds r1, r0, 0
	cmp r1, 0x1
	bne _08149670
	ldr r0, [r5]
	adds r0, r4
	ldr r0, [r0]
	str r1, [r0, 0x14]
	b _0814967A
	.align 2, 0
_08149664: .4byte gUnknown_203F3D4
_08149668: .4byte 0x000083ac
_0814966C:
	movs r0, 0
	b _081496C2
_08149670:
	bl sub_8149288
	movs r0, 0x3
	bl sub_8147F10
_0814967A:
	ldr r0, _081496C8 @ =gUnknown_203F3D4
	ldr r1, [r0]
	ldr r0, [r1, 0x14]
	cmp r0, 0x7
	bne _081496A0
	ldr r0, [r1, 0x18]
	cmp r0, 0x6
	bne _081496A0
	ldr r2, _081496CC @ =0x000083ac
	adds r0, r1, r2
	ldr r1, [r0]
	ldrh r0, [r1, 0x10]
	cmp r0, 0x2
	beq _081496A0
	movs r0, 0x1
	str r0, [r1, 0x14]
	movs r0, 0x3
	bl sub_8147F10
_081496A0:
	movs r2, 0
	ldr r0, _081496C8 @ =gUnknown_203F3D4
	ldr r0, [r0]
	ldrb r1, [r0, 0x5]
	cmp r2, r1
	bge _081496C0
	adds r3, r1, 0
	ldr r4, _081496D0 @ =0x000082f4
	adds r1, r0, r4
_081496B2:
	ldrh r0, [r1]
	cmp r0, 0x2
	beq _0814966C
	adds r1, 0x28
	adds r2, 0x1
	cmp r2, r3
	blt _081496B2
_081496C0:
	movs r0, 0x1
_081496C2:
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_081496C8: .4byte gUnknown_203F3D4
_081496CC: .4byte 0x000083ac
_081496D0: .4byte 0x000082f4
	thumb_func_end sub_8149630

	thumb_func_start sub_81496D4
sub_81496D4: @ 81496D4
	push {r4,lr}
	ldr r0, _08149708 @ =gUnknown_203F3D4
	ldr r0, [r0]
	ldrb r3, [r0, 0x5]
	movs r4, 0
	cmp r4, r3
	bge _081496F8
	ldr r1, _0814970C @ =0x000082f8
	adds r2, r0, r1
	adds r1, r3, 0
_081496E8:
	ldr r0, [r2]
	cmp r0, 0
	beq _081496F0
	adds r4, 0x1
_081496F0:
	adds r2, 0x28
	subs r1, 0x1
	cmp r1, 0
	bne _081496E8
_081496F8:
	movs r0, 0
	cmp r4, r3
	bne _08149700
	movs r0, 0x1
_08149700:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08149708: .4byte gUnknown_203F3D4
_0814970C: .4byte 0x000082f8
	thumb_func_end sub_81496D4

	thumb_func_start sub_8149710
sub_8149710: @ 8149710
	push {r4,lr}
	movs r2, 0
	ldr r0, _08149730 @ =gUnknown_203F3D4
	ldr r0, [r0]
	ldrb r1, [r0, 0x5]
	cmp r2, r1
	bge _08149740
	adds r3, r1, 0
	ldr r4, _08149734 @ =0x000082f8
	adds r1, r0, r4
_08149724:
	ldr r0, [r1]
	cmp r0, 0x1
	beq _08149738
	movs r0, 0
	b _08149742
	.align 2, 0
_08149730: .4byte gUnknown_203F3D4
_08149734: .4byte 0x000082f8
_08149738:
	adds r1, 0x28
	adds r2, 0x1
	cmp r2, r3
	blt _08149724
_08149740:
	movs r0, 0x1
_08149742:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8149710

	thumb_func_start sub_8149748
sub_8149748: @ 8149748
	push {lr}
	ldr r0, _0814975C @ =gUnknown_203F3D4
	ldr r1, [r0]
	adds r0, r1, 0
	adds r0, 0x45
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _08149760
_08149758:
	movs r0, 0
	b _0814977C
	.align 2, 0
_0814975C: .4byte gUnknown_203F3D4
_08149760:
	movs r2, 0x1
	ldrb r0, [r1, 0x5]
	cmp r2, r0
	bge _0814977A
	adds r3, r0, 0
	adds r1, 0x92
_0814976C:
	ldrh r0, [r1]
	cmp r0, 0x1
	beq _08149758
	adds r1, 0x2
	adds r2, 0x1
	cmp r2, r3
	blt _0814976C
_0814977A:
	movs r0, 0x1
_0814977C:
	pop {r1}
	bx r1
	thumb_func_end sub_8149748

	thumb_func_start sub_8149780
sub_8149780: @ 8149780
	push {lr}
	ldr r1, _081497A0 @ =gUnknown_203F3D4
	ldr r2, [r1]
	ldr r1, [r2, 0x78]
	adds r1, r0
	str r1, [r2, 0x78]
	movs r0, 0x1
	str r0, [r2, 0x5C]
	ldr r0, _081497A4 @ =0x00018695
	cmp r1, r0
	bls _0814979A
	adds r0, 0x1
	str r0, [r2, 0x78]
_0814979A:
	pop {r0}
	bx r0
	.align 2, 0
_081497A0: .4byte gUnknown_203F3D4
_081497A4: .4byte 0x00018695
	thumb_func_end sub_8149780

	thumb_func_start sub_81497A8
sub_81497A8: @ 81497A8
	push {r4-r7,lr}
	movs r5, 0
	ldr r1, _081497E0 @ =gUnknown_203F3D4
	ldr r0, [r1]
	ldrb r4, [r0, 0x5]
	movs r2, 0
	cmp r5, r4
	bge _081497FA
	mov r12, r1
	movs r3, 0
	ldr r7, _081497E4 @ =0x000082e4
	movs r6, 0x1E
	negs r6, r6
_081497C2:
	mov r0, r12
	ldr r1, [r0]
	adds r0, r1, r7
	adds r0, r3
	ldr r0, [r0]
	cmp r0, r6
	bne _081497E8
	adds r0, r1, 0
	adds r0, 0x7C
	adds r0, r2
	movs r1, 0x1
	strb r1, [r0]
	adds r5, 0x1
	b _081497F2
	.align 2, 0
_081497E0: .4byte gUnknown_203F3D4
_081497E4: .4byte 0x000082e4
_081497E8:
	adds r0, r1, 0
	adds r0, 0x7C
	adds r0, r2
	movs r1, 0
	strb r1, [r0]
_081497F2:
	adds r3, 0x28
	adds r2, 0x1
	cmp r2, r4
	blt _081497C2
_081497FA:
	adds r0, r5, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_81497A8

	thumb_func_start sub_8149804
sub_8149804: @ 8149804
	push {lr}
	movs r2, 0
	ldr r1, _08149828 @ =gUnknown_3005450
	ldr r3, _0814982C @ =0x0000069e
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, 0
	bne _08149820
	ldr r3, _08149830 @ =0x000008d2
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, 0
	bne _08149820
	movs r2, 0x1
_08149820:
	adds r0, r2, 0
	pop {r1}
	bx r1
	.align 2, 0
_08149828: .4byte gUnknown_3005450
_0814982C: .4byte 0x0000069e
_08149830: .4byte 0x000008d2
	thumb_func_end sub_8149804

	thumb_func_start sub_8149834
sub_8149834: @ 8149834
	push {r4-r6,lr}
	adds r4, r0, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0
	ldr r6, _08149874 @ =gUnknown_203F3D4
	movs r5, 0x1
_08149842:
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _08149852
	adds r0, r5, 0
	lsls r0, r1
	orrs r2, r0
	adds r3, 0x1
_08149852:
	adds r1, 0x1
	cmp r1, 0x4
	ble _08149842
	ldr r0, [r6]
	adds r0, 0x71
	strb r2, [r0]
	cmp r2, 0
	beq _0814986A
	ldr r0, [r6]
	adds r0, 0x4D
	movs r1, 0x1
	strb r1, [r0]
_0814986A:
	adds r0, r3, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08149874: .4byte gUnknown_203F3D4
	thumb_func_end sub_8149834

	thumb_func_start sub_8149878
sub_8149878: @ 8149878
	ldr r0, _08149884 @ =gUnknown_203F3D4
	ldr r0, [r0]
	adds r0, 0x44
	movs r1, 0
	strb r1, [r0]
	bx lr
	.align 2, 0
_08149884: .4byte gUnknown_203F3D4
	thumb_func_end sub_8149878

	thumb_func_start sub_8149888
sub_8149888: @ 8149888
	ldr r1, _08149894 @ =gUnknown_846B744
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	bx lr
	.align 2, 0
_08149894: .4byte gUnknown_846B744
	thumb_func_end sub_8149888

	thumb_func_start sub_8149898
sub_8149898: @ 8149898
	push {lr}
	lsls r0, 16
	lsrs r1, r0, 16
	ldr r0, _081498B0 @ =gUnknown_203F3D4
	ldr r0, [r0]
	ldrh r2, [r0, 0xE]
	cmp r1, r2
	bls _081498AA
	strh r1, [r0, 0xE]
_081498AA:
	pop {r0}
	bx r0
	.align 2, 0
_081498B0: .4byte gUnknown_203F3D4
	thumb_func_end sub_8149898

	thumb_func_start sub_81498B4
sub_81498B4: @ 81498B4
	push {lr}
	ldr r0, _081498C8 @ =gUnknown_203F3D4
	ldr r0, [r0]
	ldr r1, _081498CC @ =gUnknown_846B76C
	ldr r2, [r0, 0x78]
	ldr r0, [r1]
	cmp r2, r0
	bcs _081498D0
	movs r0, 0
	b _081498D2
	.align 2, 0
_081498C8: .4byte gUnknown_203F3D4
_081498CC: .4byte gUnknown_846B76C
_081498D0:
	movs r0, 0x1
_081498D2:
	pop {r1}
	bx r1
	thumb_func_end sub_81498B4

	thumb_func_start sub_81498D8
sub_81498D8: @ 81498D8
	push {r4,lr}
	bl sub_8149910
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	bl sub_8149930
	lsls r0, 16
	lsrs r0, 4
	ldr r1, _081498FC @ =0x00000fff
	ands r4, r1
	orrs r0, r4
	lsls r0, 16
	lsrs r0, 16
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_081498FC: .4byte 0x00000fff
	thumb_func_end sub_81498D8

	thumb_func_start sub_8149900
sub_8149900: @ 8149900
	lsls r0, 16
	lsrs r3, r0, 28
	strh r3, [r2]
	lsls r0, 4
	lsrs r0, 20
	strh r0, [r1]
	bx lr
	thumb_func_end sub_8149900

	thumb_func_start sub_8149910
sub_8149910: @ 8149910
	push {lr}
	bl Random
	lsls r0, 16
	movs r1, 0xE0
	lsls r1, 11
	ands r1, r0
	ldr r0, _0814992C @ =gUnknown_846B75C
	lsrs r1, 15
	adds r1, r0
	ldrh r0, [r1]
	pop {r1}
	bx r1
	.align 2, 0
_0814992C: .4byte gUnknown_846B75C
	thumb_func_end sub_8149910

	thumb_func_start sub_8149930
sub_8149930: @ 8149930
	push {r4-r6,lr}
	movs r5, 0
	movs r4, 0
	ldr r3, _08149964 @ =gUnknown_203F3D4
	ldr r0, [r3]
	ldr r2, _08149968 @ =gUnknown_846B76C
	ldr r1, [r0, 0x78]
	ldr r0, [r2]
	cmp r1, r0
	bcc _0814996C
	ldr r5, [r2, 0x4]
	adds r6, r3, 0
	adds r3, r2, 0x4
_0814994A:
	adds r3, 0x8
	adds r2, 0x8
	adds r4, 0x1
	cmp r4, 0x4
	bhi _0814996C
	ldr r0, [r6]
	ldr r1, [r0, 0x78]
	ldr r0, [r2]
	cmp r1, r0
	bcc _0814996C
	ldr r5, [r3]
	b _0814994A
	.align 2, 0
_08149964: .4byte gUnknown_203F3D4
_08149968: .4byte gUnknown_846B76C
_0814996C:
	lsls r0, r5, 16
	lsrs r0, 16
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_8149930

	thumb_func_start sub_8149978
sub_8149978: @ 8149978
	push {r4,r5,lr}
	lsls r0, 16
	lsrs r5, r0, 16
	lsls r1, 16
	lsrs r4, r1, 16
	b _0814998A
_08149984:
	subs r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
_0814998A:
	cmp r4, 0
	beq _0814999C
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_809A000
	lsls r0, 24
	cmp r0, 0
	beq _08149984
_0814999C:
	adds r0, r4, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8149978

	thumb_func_start sub_81499A4
sub_81499A4: @ 81499A4
	push {lr}
	bl GetLinkPlayerCount
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end sub_81499A4

	thumb_func_start sub_81499B4
sub_81499B4: @ 81499B4
	ldr r0, _081499BC @ =gUnknown_203F3D4
	ldr r0, [r0]
	ldrb r0, [r0, 0x6]
	bx lr
	.align 2, 0
_081499BC: .4byte gUnknown_203F3D4
	thumb_func_end sub_81499B4

	thumb_func_start sub_81499C0
sub_81499C0: @ 81499C0
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _081499D8 @ =gUnknown_203F3D4
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	ldr r0, _081499DC @ =0x000082a8
	adds r1, r0
	ldr r0, [r2]
	adds r0, r1
	bx lr
	.align 2, 0
_081499D8: .4byte gUnknown_203F3D4
_081499DC: .4byte 0x000082a8
	thumb_func_end sub_81499C0

	thumb_func_start sub_81499E0
sub_81499E0: @ 81499E0
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r2, _081499FC @ =gUnknown_203F3D4
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	ldr r1, [r2]
	adds r0, r1
	movs r1, 0x83
	lsls r1, 8
	adds r0, r1
	bx lr
	.align 2, 0
_081499FC: .4byte gUnknown_203F3D4
	thumb_func_end sub_81499E0

	thumb_func_start sub_8149A00
sub_8149A00: @ 8149A00
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	bl sub_8147D00
	lsls r0, 16
	asrs r0, 16
	mvns r0, r0
	lsrs r0, 31
	pop {r1}
	bx r1
	thumb_func_end sub_8149A00

	thumb_func_start sub_8149A18
sub_8149A18: @ 8149A18
	push {r4,r5,lr}
	movs r5, 0
_08149A1C:
	movs r0, 0x64
	adds r1, r5, 0
	muls r1, r0
	ldr r0, _08149A4C @ =gPlayerParty
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0x5
	bl GetMonData
	cmp r0, 0
	beq _08149A54
	adds r0, r4, 0
	movs r1, 0x41
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	bl sub_8149A00
	cmp r0, 0
	beq _08149A54
	ldr r1, _08149A50 @ =gUnknown_20370D0
	movs r0, 0x1
	b _08149A5E
	.align 2, 0
_08149A4C: .4byte gPlayerParty
_08149A50: .4byte gUnknown_20370D0
_08149A54:
	adds r5, 0x1
	cmp r5, 0x5
	ble _08149A1C
	ldr r1, _08149A68 @ =gUnknown_20370D0
	movs r0, 0
_08149A5E:
	strh r0, [r1]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08149A68: .4byte gUnknown_20370D0
	thumb_func_end sub_8149A18

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
	bl sub_80F9E2C
	add sp, 0xC
	pop {r0}
	bx r0
	thumb_func_end sub_8149A6C

	thumb_func_start sub_8149A90
sub_8149A90: @ 8149A90
	push {r4,lr}
	sub sp, 0xC
	adds r4, r1, 0
	ldr r3, _08149AC4 @ =gUnknown_3003ED0
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
_08149AC4: .4byte gUnknown_3003ED0
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
	bl sub_80F9E2C
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
	bl sub_80F9E2C
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
	ldr r2, _08149BE4 @ =gUnknown_3003ED0
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
_08149BE4: .4byte gUnknown_3003ED0
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
	bl sub_80F9E2C
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
	ldr r3, _08149C80 @ =gUnknown_3003ED0
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
_08149C80: .4byte gUnknown_3003ED0
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
	ldr r3, _08149CDC @ =gUnknown_3003ED0
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
_08149CDC: .4byte gUnknown_3003ED0
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
	bl sub_815C9F4
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
	bl sub_80F6C14
	bl reset_temp_tile_data_buffers
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
	bl decompress_and_copy_tile_data_to_vram
	ldr r1, _08149EF8 @ =gUnknown_846BA00
	movs r4, 0x1
	str r4, [sp]
	movs r0, 0x3
	movs r2, 0
	movs r3, 0
	bl decompress_and_copy_tile_data_to_vram
	ldr r0, _08149EFC @ =gUnknown_846BBB0
	movs r1, 0x30
	movs r2, 0x20
	bl LoadPalette
	ldr r1, _08149F00 @ =gUnknown_846BBD0
	str r5, [sp]
	movs r0, 0x2
	movs r2, 0
	movs r3, 0
	bl decompress_and_copy_tile_data_to_vram
	ldr r1, _08149F04 @ =gUnknown_846C520
	str r4, [sp]
	movs r0, 0x2
	movs r2, 0
	movs r3, 0
	bl decompress_and_copy_tile_data_to_vram
	ldr r0, _08149F08 @ =gUnknown_846C8D8
	movs r1, 0x10
	movs r2, 0x20
	bl LoadPalette
	ldr r1, _08149F0C @ =gUnknown_846C8F8
	str r5, [sp]
	movs r0, 0x1
	movs r2, 0
	movs r3, 0
	bl decompress_and_copy_tile_data_to_vram
	ldr r1, _08149F10 @ =gUnknown_846D3A8
	str r4, [sp]
	movs r0, 0x1
	movs r2, 0
	movs r3, 0
	bl decompress_and_copy_tile_data_to_vram
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
	bl sub_814FE40
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
	bl free_temp_tile_data_buffers_if_possible
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
	bl PrintTextOnWindow
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
	bl sub_8150048
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
	bl PrintTextOnWindow
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
	bl sub_8150048
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
	bl sub_81100E8
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
	bl PrintTextOnWindow
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
	bl sub_8150048
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
	bl PrintTextOnWindow
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
	bl sub_8150048
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
	bl sub_8099E90
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
	bl UnkTextUtil_Reset
	ldr r4, _0814A52C @ =gUnknown_203F3D8
	ldr r1, [r4]
	adds r1, 0x26
	movs r0, 0
	bl UnkTextUtil_SetPtrI
	ldr r1, [r4]
	adds r1, 0x66
	movs r0, 0x1
	bl UnkTextUtil_SetPtrI
	ldr r0, [r4]
	adds r0, 0xA6
	ldr r1, _0814A534 @ =gUnknown_841CBA9
	bl UnkTextUtil_StringExpandPlaceholders
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
	bl PrintTextOnWindow
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
	bl sub_8099E90
	bl UnkTextUtil_Reset
	ldr r1, [r4]
	adds r1, 0x26
	movs r0, 0
	bl UnkTextUtil_SetPtrI
	ldr r0, [r4]
	adds r0, 0xA6
	ldr r1, _0814A5B0 @ =gUnknown_841CBCA
	bl UnkTextUtil_StringExpandPlaceholders
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
	bl PrintTextOnWindow
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
	bl sub_8099E90
	bl UnkTextUtil_Reset
	ldr r1, [r4]
	adds r1, 0x26
	movs r0, 0
	bl UnkTextUtil_SetPtrI
	ldr r0, [r4]
	adds r0, 0xA6
	ldr r1, _0814A628 @ =gUnknown_841CBE4
	bl UnkTextUtil_StringExpandPlaceholders
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
	bl PrintTextOnWindow
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
	bl sub_8150048
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
	bl ProcessMenuInputNoWrap_
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
	bl sub_810FF60
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
	bl box_print
	add r0, sp, 0xC
	str r0, [sp]
	str r4, [sp, 0x4]
	ldr r0, _0814A8B4 @ =gUnknown_841CB5A
	str r0, [sp, 0x8]
	movs r0, 0x1
	movs r1, 0
	movs r2, 0
	movs r3, 0x2
	bl box_print
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
	ldr r0, _0814A938 @ =gUnknown_82349CC
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
_0814A938: .4byte gUnknown_82349CC
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
	movs r0, 0x40
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
	bl sub_815C980
	movs r0, 0
	movs r1, 0
	mov r2, sp
	bl sub_815CA40
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
	bl sub_815CA40
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
	bl sub_815CD70
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
	bl sub_815CD70
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
	bl box_print
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
	bl LoadCompressedObjectPic
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
	ldr r1, _0814AED8 @ =gUnknown_82350AC
	adds r0, r1
	ldr r3, [r7, 0x8]
	mov r1, r8
	bl sub_800ECC4
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
	bl GetFrontSpritePalFromSpeciesAndPersonality
	str r0, [sp, 0x20]
	add r0, sp, 0x20
	ldr r1, [r0, 0x4]
	ands r1, r5
	orrs r1, r4
	str r1, [r0, 0x4]
	bl LoadCompressedObjectPalette
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
_0814AED8: .4byte gUnknown_82350AC
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
	ldr r1, _0814B22C @ =gUnknown_825E074
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
_0814B22C: .4byte gUnknown_825E074
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
	bl sub_815F138
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
	bl sub_815F198
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

	thumb_func_start sub_814B504
sub_814B504: @ 814B504
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
	thumb_func_end sub_814B504

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
	bl sub_814FF2C
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0xD
	bl sub_8150048
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
	bl sub_812E62C
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
	bl sub_812E62C
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
	bl sub_812E62C
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
