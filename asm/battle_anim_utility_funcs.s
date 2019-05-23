	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_80BA7F8
sub_80BA7F8: @ 80BA7F8
	push {r4-r6,lr}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldr r4, _080BA838 @ =gBattleAnimArgs
	movs r1, 0
	ldrsh r0, [r4, r1]
	bl sub_80B9A14
	adds r6, r0, 0
	ldrh r3, [r4]
	lsls r3, 16
	asrs r0, r3, 23
	movs r4, 0x1
	ands r0, r4
	asrs r1, r3, 24
	ands r1, r4
	asrs r2, r3, 25
	ands r2, r4
	asrs r3, 26
	ands r3, r4
	bl sub_8075CB8
	orrs r6, r0
	adds r0, r5, 0
	adds r1, r6, 0
	bl sub_80BAA4C
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BA838: .4byte gBattleAnimArgs
	thumb_func_end sub_80BA7F8

	thumb_func_start sub_80BA83C
sub_80BA83C: @ 80BA83C
	push {r4-r7,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r7, r0, 24
	mov r1, sp
	movs r0, 0xFF
	strb r0, [r1, 0x1]
	movs r0, 0x1
	bl sub_80B9A14
	adds r5, r0, 0
	ldr r0, _080BA868 @ =gBattleAnimArgs
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0x7
	bhi _080BA8E6
	lsls r0, 2
	ldr r1, _080BA86C @ =_080BA870
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080BA868: .4byte gBattleAnimArgs
_080BA86C: .4byte _080BA870
	.align 2, 0
_080BA870:
	.4byte _080BA892
	.4byte _080BA89E
	.4byte _080BA890
	.4byte _080BA89C
	.4byte _080BA8AC
	.4byte _080BA8C4
	.4byte _080BA8CC
	.4byte _080BA8D8
_080BA890:
	movs r5, 0
_080BA892:
	mov r0, sp
	ldr r1, _080BA898 @ =gBattleAnimAttacker
	b _080BA8A2
	.align 2, 0
_080BA898: .4byte gBattleAnimAttacker
_080BA89C:
	movs r5, 0
_080BA89E:
	mov r0, sp
	ldr r1, _080BA8A8 @ =gBattleAnimTarget
_080BA8A2:
	ldrb r1, [r1]
	strb r1, [r0]
	b _080BA8E6
	.align 2, 0
_080BA8A8: .4byte gBattleAnimTarget
_080BA8AC:
	mov r1, sp
	ldr r0, _080BA8BC @ =gBattleAnimAttacker
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _080BA8C0 @ =gBattleAnimTarget
	ldrb r0, [r0]
	strb r0, [r1, 0x1]
	b _080BA8E6
	.align 2, 0
_080BA8BC: .4byte gBattleAnimAttacker
_080BA8C0: .4byte gBattleAnimTarget
_080BA8C4:
	mov r1, sp
	movs r0, 0xFF
	strb r0, [r1]
	b _080BA8E6
_080BA8CC:
	movs r5, 0
	mov r2, sp
	ldr r0, _080BA8D4 @ =gBattleAnimAttacker
	b _080BA8DE
	.align 2, 0
_080BA8D4: .4byte gBattleAnimAttacker
_080BA8D8:
	movs r5, 0
	mov r2, sp
	ldr r0, _080BA930 @ =gBattleAnimTarget
_080BA8DE:
	ldrb r0, [r0]
	movs r1, 0x2
	eors r0, r1
	strb r0, [r2]
_080BA8E6:
	movs r4, 0
	mov r6, sp
_080BA8EA:
	ldrb r0, [r6]
	cmp r4, r0
	beq _080BA914
	ldrb r0, [r6, 0x1]
	cmp r4, r0
	beq _080BA914
	adds r0, r4, 0
	bl sub_8072DF0
	lsls r0, 24
	cmp r0, 0
	beq _080BA914
	adds r0, r4, 0
	bl sub_8075D80
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x80
	lsls r1, 9
	lsls r1, r0
	orrs r5, r1
_080BA914:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x3
	bls _080BA8EA
	adds r0, r7, 0
	adds r1, r5, 0
	bl sub_80BAA4C
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BA930: .4byte gBattleAnimTarget
	thumb_func_end sub_80BA83C

	thumb_func_start sub_80BA934
sub_80BA934: @ 80BA934
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080BA958 @ =gBattleAnimArgs
	movs r1, 0
	ldrsh r0, [r0, r1]
	bl sub_80B9A14
	adds r2, r0, 0
	ldr r0, _080BA95C @ =gUnknown_2022B50
	ldrb r0, [r0]
	cmp r0, 0x9
	bhi _080BAA0A
	lsls r0, 2
	ldr r1, _080BA960 @ =_080BA964
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080BA958: .4byte gBattleAnimArgs
_080BA95C: .4byte gUnknown_2022B50
_080BA960: .4byte _080BA964
	.align 2, 0
_080BA964:
	.4byte _080BA98C
	.4byte _080BA99C
	.4byte _080BA9A8
	.4byte _080BA9B8
	.4byte _080BA9C4
	.4byte _080BA9D4
	.4byte _080BA9E4
	.4byte _080BA9F4
	.4byte _080BAA04
	.4byte _080BAA04
_080BA98C:
	ldr r1, _080BA994 @ =gBattleAnimArgs
	ldr r0, _080BA998 @ =0x00000b0c
	b _080BAA08
	.align 2, 0
_080BA994: .4byte gBattleAnimArgs
_080BA998: .4byte 0x00000b0c
_080BA99C:
	ldr r1, _080BA9A4 @ =gBattleAnimArgs
	movs r0, 0x9E
	lsls r0, 4
	b _080BAA08
	.align 2, 0
_080BA9A4: .4byte gBattleAnimArgs
_080BA9A8:
	ldr r1, _080BA9B0 @ =gBattleAnimArgs
	ldr r0, _080BA9B4 @ =0x00002f1e
	b _080BAA08
	.align 2, 0
_080BA9B0: .4byte gBattleAnimArgs
_080BA9B4: .4byte 0x00002f1e
_080BA9B8:
	ldr r1, _080BA9C0 @ =gBattleAnimArgs
	movs r0, 0x90
	lsls r0, 7
	b _080BAA08
	.align 2, 0
_080BA9C0: .4byte gBattleAnimArgs
_080BA9C4:
	ldr r1, _080BA9CC @ =gBattleAnimArgs
	ldr r0, _080BA9D0 @ =0x00007ecb
	b _080BAA08
	.align 2, 0
_080BA9CC: .4byte gBattleAnimArgs
_080BA9D0: .4byte 0x00007ecb
_080BA9D4:
	ldr r1, _080BA9DC @ =gBattleAnimArgs
	ldr r0, _080BA9E0 @ =0x00007ecb
	b _080BAA08
	.align 2, 0
_080BA9DC: .4byte gBattleAnimArgs
_080BA9E0: .4byte 0x00007ecb
_080BA9E4:
	ldr r1, _080BA9EC @ =gBattleAnimArgs
	ldr r0, _080BA9F0 @ =0x00002a16
	b _080BAA08
	.align 2, 0
_080BA9EC: .4byte gBattleAnimArgs
_080BA9F0: .4byte 0x00002a16
_080BA9F4:
	ldr r1, _080BA9FC @ =gBattleAnimArgs
	ldr r0, _080BAA00 @ =0x00000d2e
	b _080BAA08
	.align 2, 0
_080BA9FC: .4byte gBattleAnimArgs
_080BAA00: .4byte 0x00000d2e
_080BAA04:
	ldr r1, _080BAA18 @ =gBattleAnimArgs
	ldr r0, _080BAA1C @ =0x00007fff
_080BAA08:
	strh r0, [r1, 0x8]
_080BAA0A:
	adds r0, r4, 0
	adds r1, r2, 0
	bl sub_80BAA4C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BAA18: .4byte gBattleAnimArgs
_080BAA1C: .4byte 0x00007fff
	thumb_func_end sub_80BA934

	thumb_func_start sub_80BAA20
sub_80BAA20: @ 80BAA20
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _080BAA48 @ =gBattleAnimArgs
	ldrh r0, [r0]
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 24
	adds r0, 0x10
	movs r1, 0x1
	lsls r1, r0
	adds r0, r4, 0
	bl sub_80BAA4C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BAA48: .4byte gBattleAnimArgs
	thumb_func_end sub_80BAA20

	thumb_func_start sub_80BAA4C
sub_80BAA4C: @ 80BAA4C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _080BAA84 @ =gTasks
	lsls r2, r0, 2
	adds r2, r0
	lsls r2, 3
	adds r2, r3
	strh r1, [r2, 0x8]
	lsrs r1, 16
	strh r1, [r2, 0xA]
	ldr r3, _080BAA88 @ =gBattleAnimArgs
	ldrh r1, [r3, 0x2]
	strh r1, [r2, 0xC]
	ldrh r1, [r3, 0x4]
	strh r1, [r2, 0xE]
	ldrh r1, [r3, 0x6]
	strh r1, [r2, 0x10]
	ldrh r1, [r3, 0x8]
	strh r1, [r2, 0x12]
	ldrh r1, [r3, 0x4]
	strh r1, [r2, 0x1C]
	ldr r1, _080BAA8C @ =sub_80BAA90
	str r1, [r2]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_080BAA84: .4byte gTasks
_080BAA88: .4byte gBattleAnimArgs
_080BAA8C: .4byte sub_80BAA90
	thumb_func_end sub_80BAA4C

	thumb_func_start sub_80BAA90
sub_80BAA90: @ 80BAA90
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r7, r0, 24
	movs r6, 0
	ldr r2, _080BAB10 @ =gTasks
	lsls r5, r7, 2
	adds r0, r5, r7
	lsls r0, 3
	adds r3, r0, r2
	ldrh r0, [r3, 0x1A]
	mov r8, r0
	movs r4, 0x1A
	ldrsh r1, [r3, r4]
	movs r4, 0xC
	ldrsh r0, [r3, r4]
	mov r9, r2
	cmp r1, r0
	bne _080BAB26
	strh r6, [r3, 0x1A]
	movs r0, 0x8
	ldrsh r4, [r3, r0]
	movs r1, 0xA
	ldrsh r0, [r3, r1]
	lsls r0, 16
	orrs r4, r0
	mov r8, r5
	cmp r4, 0
	beq _080BAAF2
	adds r5, r3, 0
_080BAAD0:
	movs r0, 0x1
	ands r0, r4
	cmp r0, 0
	beq _080BAAE4
	ldrb r2, [r5, 0x1C]
	ldrh r3, [r5, 0x12]
	adds r0, r6, 0
	movs r1, 0x10
	bl BlendPalette
_080BAAE4:
	adds r0, r6, 0
	adds r0, 0x10
	lsls r0, 16
	lsrs r6, r0, 16
	lsrs r4, 1
	cmp r4, 0
	bne _080BAAD0
_080BAAF2:
	mov r4, r8
	adds r0, r4, r7
	lsls r0, 3
	mov r1, r9
	adds r2, r0, r1
	ldrh r0, [r2, 0x1C]
	movs r4, 0x1C
	ldrsh r3, [r2, r4]
	movs r4, 0x10
	ldrsh r1, [r2, r4]
	cmp r3, r1
	bge _080BAB14
	adds r0, 0x1
	strh r0, [r2, 0x1C]
	b _080BAB2C
	.align 2, 0
_080BAB10: .4byte gTasks
_080BAB14:
	cmp r3, r1
	ble _080BAB1E
	subs r0, 0x1
	strh r0, [r2, 0x1C]
	b _080BAB2C
_080BAB1E:
	adds r0, r7, 0
	bl DestroyAnimVisualTask
	b _080BAB2C
_080BAB26:
	mov r0, r8
	adds r0, 0x1
	strh r0, [r3, 0x1A]
_080BAB2C:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80BAA90

	thumb_func_start sub_80BAB38
sub_80BAB38: @ 80BAB38
	push {r4,r5,lr}
	sub sp, 0x4
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldr r4, _080BAB6C @ =gBattleAnimArgs
	ldrb r0, [r4]
	ldrb r1, [r4, 0x2]
	ldrb r2, [r4, 0x4]
	ldrb r3, [r4, 0x6]
	ldrb r4, [r4, 0x8]
	str r4, [sp]
	bl BeginHardwarePaletteFade
	ldr r1, _080BAB70 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldr r1, _080BAB74 @ =sub_80BAB78
	str r1, [r0]
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BAB6C: .4byte gBattleAnimArgs
_080BAB70: .4byte gTasks
_080BAB74: .4byte sub_80BAB78
	thumb_func_end sub_80BAB38

	thumb_func_start sub_80BAB78
sub_80BAB78: @ 80BAB78
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _080BAB94 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080BAB90
	adds r0, r2, 0
	bl DestroyAnimVisualTask
_080BAB90:
	pop {r0}
	bx r0
	.align 2, 0
_080BAB94: .4byte gPaletteFade
	thumb_func_end sub_80BAB78

	thumb_func_start sub_80BAB98
sub_80BAB98: @ 80BAB98
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _080BABC4 @ =gTasks
	adds r1, r0
	ldr r2, _080BABC8 @ =gBattleAnimArgs
	ldrh r0, [r2]
	movs r3, 0
	strh r0, [r1, 0x8]
	strh r3, [r1, 0xA]
	ldrh r0, [r2, 0x2]
	strh r0, [r1, 0xC]
	ldrh r0, [r2, 0x4]
	strh r0, [r1, 0xE]
	ldrh r0, [r2, 0x6]
	strh r0, [r1, 0x10]
	strh r3, [r1, 0x12]
	ldr r0, _080BABCC @ =sub_80BABD0
	str r0, [r1]
	bx lr
	.align 2, 0
_080BABC4: .4byte gTasks
_080BABC8: .4byte gBattleAnimArgs
_080BABCC: .4byte sub_80BABD0
	thumb_func_end sub_80BAB98

	thumb_func_start sub_80BABD0
sub_80BABD0: @ 80BABD0
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	adds r2, r5, 0
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _080BABFC @ =gTasks
	adds r4, r0, r1
	movs r1, 0x10
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080BAC94
	ldrh r1, [r4, 0xA]
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _080BAC00
	subs r0, r1, 0x1
	strh r0, [r4, 0xA]
	b _080BACA2
	.align 2, 0
_080BABFC: .4byte gTasks
_080BAC00:
	ldrb r0, [r4, 0x8]
	bl duplicate_obj_of_side_rel2move_in_transparent_mode
	strh r0, [r4, 0x14]
	lsls r0, 16
	cmp r0, 0
	blt _080BAC7E
	ldr r6, _080BAC8C @ =gSprites
	movs r1, 0x14
	ldrsh r0, [r4, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r3, r1, r6
	movs r2, 0x8
	ldrsh r0, [r4, r2]
	movs r2, 0x2
	cmp r0, 0
	beq _080BAC28
	movs r2, 0x1
_080BAC28:
	lsls r2, 2
	ldrb r1, [r3, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	orrs r0, r2
	strb r0, [r3, 0x5]
	movs r0, 0x14
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	ldrh r1, [r4, 0xE]
	strh r1, [r0, 0x2E]
	movs r2, 0x14
	ldrsh r1, [r4, r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	strh r5, [r0, 0x30]
	movs r0, 0x14
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	movs r1, 0x5
	strh r1, [r0, 0x32]
	movs r2, 0x14
	ldrsh r1, [r4, r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r6, 0
	adds r1, 0x1C
	adds r0, r1
	ldr r1, _080BAC90 @ =sub_80BACA8
	str r1, [r0]
	ldrh r0, [r4, 0x12]
	adds r0, 0x1
	strh r0, [r4, 0x12]
_080BAC7E:
	ldrh r0, [r4, 0x10]
	subs r0, 0x1
	strh r0, [r4, 0x10]
	ldrh r0, [r4, 0xC]
	strh r0, [r4, 0xA]
	b _080BACA2
	.align 2, 0
_080BAC8C: .4byte gSprites
_080BAC90: .4byte sub_80BACA8
_080BAC94:
	movs r1, 0x12
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080BACA2
	adds r0, r2, 0
	bl DestroyAnimVisualTask
_080BACA2:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80BABD0

	thumb_func_start sub_80BACA8
sub_80BACA8: @ 80BACA8
	push {r4,lr}
	adds r4, r0, 0
	ldrh r1, [r4, 0x2E]
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _080BACBC
	subs r0, r1, 0x1
	strh r0, [r4, 0x2E]
	b _080BACE0
_080BACBC:
	ldr r3, _080BACE8 @ =gTasks
	movs r0, 0x32
	ldrsh r1, [r4, r0]
	lsls r1, 1
	movs r0, 0x30
	ldrsh r2, [r4, r0]
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r1, r0
	adds r3, 0x8
	adds r1, r3
	ldrh r0, [r1]
	subs r0, 0x1
	strh r0, [r1]
	adds r0, r4, 0
	bl obj_delete_but_dont_free_vram
_080BACE0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BACE8: .4byte gTasks
	thumb_func_end sub_80BACA8

	thumb_func_start sub_80BACEC
sub_80BACEC: @ 80BACEC
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x14
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	movs r7, 0
	ldr r0, _080BAE20 @ =gUnknown_2022984
	strh r7, [r0]
	ldr r0, _080BAE24 @ =gUnknown_2022986
	strh r7, [r0]
	ldr r1, _080BAE28 @ =0x00003f3f
	movs r0, 0x48
	bl SetGpuReg
	ldr r1, _080BAE2C @ =0x00003f3d
	movs r0, 0x4A
	bl SetGpuReg
	movs r1, 0x80
	lsls r1, 8
	movs r0, 0
	bl SetGpuRegBits
	ldr r1, _080BAE30 @ =0x00003f42
	movs r0, 0x50
	bl SetGpuReg
	ldr r1, _080BAE34 @ =0x00000c08
	movs r0, 0x52
	bl SetGpuReg
	movs r0, 0xA
	bl GetGpuReg
	add r4, sp, 0x10
	strh r0, [r4]
	ldrb r1, [r4]
	movs r0, 0x4
	negs r0, r0
	mov r8, r0
	ands r0, r1
	strb r0, [r4]
	mov r2, sp
	adds r2, 0x11
	ldrb r1, [r2]
	movs r0, 0x3F
	ands r0, r1
	strb r0, [r2]
	ldrh r1, [r4]
	movs r0, 0xA
	bl SetGpuReg
	bl sub_8073788
	lsls r0, 24
	cmp r0, 0
	bne _080BAD7A
	ldrb r1, [r4]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r4]
	ldrh r1, [r4]
	movs r0, 0xA
	bl SetGpuReg
_080BAD7A:
	bl sub_8075290
	lsls r0, 24
	cmp r0, 0
	beq _080BADFE
	bl sub_8073788
	lsls r0, 24
	cmp r0, 0
	bne _080BADFE
	ldr r5, _080BAE38 @ =gBattleAnimAttacker
	ldrb r0, [r5]
	bl GetBattlerPosition
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	beq _080BADAA
	ldrb r0, [r5]
	bl GetBattlerPosition
	lsls r0, 24
	cmp r0, 0
	bne _080BADFE
_080BADAA:
	ldrb r0, [r5]
	movs r6, 0x2
	eors r0, r6
	bl sub_8072DF0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080BADFE
	ldr r3, _080BAE3C @ =gSprites
	ldr r1, _080BAE40 @ =gUnknown_2023D44
	ldrb r0, [r5]
	eors r0, r6
	adds r0, r1
	ldrb r0, [r0]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r3
	ldrb r3, [r2, 0x5]
	lsls r1, r3, 28
	lsrs r1, 30
	subs r1, 0x1
	movs r0, 0x3
	ands r1, r0
	lsls r1, 2
	movs r0, 0xD
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, 0x5]
	ldrb r1, [r4]
	mov r0, r8
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r4]
	ldrh r1, [r4]
	movs r0, 0xA
	bl SetGpuReg
	movs r7, 0x1
_080BADFE:
	ldr r4, _080BAE38 @ =gBattleAnimAttacker
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080BAE4C
	ldr r1, _080BAE44 @ =gBattlerPartyIndexes
	ldrb r0, [r4]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080BAE48 @ =gEnemyParty
	b _080BAE5C
	.align 2, 0
_080BAE20: .4byte gUnknown_2022984
_080BAE24: .4byte gUnknown_2022986
_080BAE28: .4byte 0x00003f3f
_080BAE2C: .4byte 0x00003f3d
_080BAE30: .4byte 0x00003f42
_080BAE34: .4byte 0x00000c08
_080BAE38: .4byte gBattleAnimAttacker
_080BAE3C: .4byte gSprites
_080BAE40: .4byte gUnknown_2023D44
_080BAE44: .4byte gBattlerPartyIndexes
_080BAE48: .4byte gEnemyParty
_080BAE4C:
	ldr r1, _080BAF0C @ =gBattlerPartyIndexes
	ldrb r0, [r4]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080BAF10 @ =gPlayerParty
_080BAE5C:
	adds r0, r1
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r4, r0, 16
	movs r0, 0
	bl GetAnimBankSpriteId
	lsls r0, 24
	lsrs r0, 24
	adds r5, r0, 0
	ldr r0, _080BAF14 @ =gBattleAnimAttacker
	ldrb r0, [r0]
	adds r1, r5, 0
	adds r2, r4, 0
	bl sub_8076E34
	lsls r0, 24
	lsrs r4, r0, 24
	mov r0, sp
	bl sub_80752A0
	mov r0, sp
	ldrb r0, [r0, 0x9]
	ldr r1, _080BAF18 @ =gFile_graphics_battle_anims_masks_curse_tilemap
	bl sub_807543C
	bl sub_8073788
	lsls r0, 24
	cmp r0, 0
	beq _080BAEAC
	mov r0, sp
	ldrb r0, [r0, 0x8]
	ldr r1, [sp, 0x4]
	movs r2, 0
	movs r3, 0
	bl sub_80730C0
_080BAEAC:
	mov r0, sp
	ldrb r0, [r0, 0x9]
	ldr r1, _080BAF1C @ =gFile_graphics_battle_anims_masks_curse_sheet
	mov r2, sp
	ldrh r2, [r2, 0xA]
	bl sub_80753B4
	ldr r0, _080BAF20 @ =gUnknown_83E7CC8
	mov r1, sp
	ldrb r1, [r1, 0x8]
	lsls r1, 4
	adds r1, 0x1
	movs r2, 0x2
	bl LoadPalette
	ldr r2, _080BAF24 @ =gBattle_BG1_X
	ldr r0, _080BAF28 @ =gSprites
	lsls r1, r5, 4
	adds r1, r5
	lsls r1, 2
	adds r1, r0
	ldrh r0, [r1, 0x20]
	negs r0, r0
	adds r0, 0x20
	strh r0, [r2]
	ldr r2, _080BAF2C @ =gBattle_BG1_Y
	ldrh r0, [r1, 0x22]
	negs r0, r0
	adds r0, 0x20
	strh r0, [r2]
	ldr r1, _080BAF30 @ =gTasks
	mov r2, r9
	lsls r0, r2, 2
	add r0, r9
	lsls r0, 3
	adds r0, r1
	strh r4, [r0, 0x8]
	strh r7, [r0, 0x14]
	ldr r1, _080BAF34 @ =sub_80BAF38
	str r1, [r0]
	add sp, 0x14
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BAF0C: .4byte gBattlerPartyIndexes
_080BAF10: .4byte gPlayerParty
_080BAF14: .4byte gBattleAnimAttacker
_080BAF18: .4byte gFile_graphics_battle_anims_masks_curse_tilemap
_080BAF1C: .4byte gFile_graphics_battle_anims_masks_curse_sheet
_080BAF20: .4byte gUnknown_83E7CC8
_080BAF24: .4byte gBattle_BG1_X
_080BAF28: .4byte gSprites
_080BAF2C: .4byte gBattle_BG1_Y
_080BAF30: .4byte gTasks
_080BAF34: .4byte sub_80BAF38
	thumb_func_end sub_80BACEC

	thumb_func_start sub_80BAF38
sub_80BAF38: @ 80BAF38
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x14
	lsls r0, 24
	lsrs r0, 24
	adds r6, r0, 0
	ldr r1, _080BB068 @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r5, r0, r1
	ldrh r0, [r5, 0x1C]
	adds r0, 0x4
	movs r1, 0
	mov r8, r1
	strh r0, [r5, 0x1C]
	ldr r7, _080BB06C @ =gBattle_BG1_Y
	ldrh r2, [r7]
	subs r1, r2, 0x4
	strh r1, [r7]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x40
	bne _080BB05A
	mov r0, r8
	strh r0, [r5, 0x1C]
	adds r0, r2, 0
	adds r0, 0x3C
	strh r0, [r7]
	ldrh r0, [r5, 0x1E]
	adds r0, 0x1
	strh r0, [r5, 0x1E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	bne _080BB05A
	movs r0, 0
	bl sub_8073128
	ldr r0, _080BB070 @ =gUnknown_2022984
	mov r1, r8
	strh r1, [r0]
	ldr r0, _080BB074 @ =gUnknown_2022986
	strh r1, [r0]
	ldr r4, _080BB078 @ =0x00003f3f
	movs r0, 0x48
	adds r1, r4, 0
	bl SetGpuReg
	movs r0, 0x4A
	adds r1, r4, 0
	bl SetGpuReg
	bl sub_8073788
	lsls r0, 24
	cmp r0, 0
	bne _080BAFCA
	movs r0, 0xA
	bl GetGpuReg
	add r1, sp, 0x10
	strh r0, [r1]
	ldrb r2, [r1]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	strb r0, [r1]
	ldrh r1, [r1]
	movs r0, 0xA
	bl SetGpuReg
_080BAFCA:
	movs r0, 0
	bl GetGpuReg
	adds r1, r0, 0
	movs r2, 0x80
	lsls r2, 8
	adds r0, r2, 0
	eors r1, r0
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0
	bl SetGpuReg
	movs r0, 0x50
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x52
	movs r1, 0
	bl SetGpuReg
	movs r0, 0
	bl GetAnimBankSpriteId
	ldr r4, _080BB07C @ =gSprites
	movs r0, 0x8
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl DestroySprite
	mov r0, sp
	bl sub_80752A0
	mov r0, sp
	ldrb r0, [r0, 0x9]
	bl sub_8075358
	movs r1, 0x14
	ldrsh r0, [r5, r1]
	cmp r0, 0x1
	bne _080BB050
	ldr r2, _080BB080 @ =gUnknown_2023D44
	ldr r0, _080BB084 @ =gBattleAnimAttacker
	ldrb r1, [r0]
	movs r0, 0x2
	eors r0, r1
	adds r0, r2
	ldrb r0, [r0]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r4
	ldrb r3, [r2, 0x5]
	lsls r1, r3, 28
	lsrs r1, 30
	adds r1, 0x1
	movs r0, 0x3
	ands r1, r0
	lsls r1, 2
	movs r0, 0xD
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, 0x5]
_080BB050:
	mov r2, r8
	strh r2, [r7]
	adds r0, r6, 0
	bl DestroyAnimVisualTask
_080BB05A:
	add sp, 0x14
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BB068: .4byte gTasks
_080BB06C: .4byte gBattle_BG1_Y
_080BB070: .4byte gUnknown_2022984
_080BB074: .4byte gUnknown_2022986
_080BB078: .4byte 0x00003f3f
_080BB07C: .4byte gSprites
_080BB080: .4byte gUnknown_2023D44
_080BB084: .4byte gBattleAnimAttacker
	thumb_func_end sub_80BAF38

	thumb_func_start sub_80BB088
sub_80BB088: @ 80BB088
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r4, _080BB0C8 @ =gUnknown_20399B4
	movs r0, 0x18
	bl AllocZeroed
	str r0, [r4]
	movs r2, 0
	ldr r3, _080BB0CC @ =gBattleAnimArgs
_080BB09C:
	ldr r1, [r4]
	lsls r0, r2, 1
	adds r1, 0x4
	adds r1, r0
	adds r0, r3
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x7
	bls _080BB09C
	ldr r0, _080BB0D0 @ =gTasks
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	ldr r0, _080BB0D4 @ =sub_80BB0D8
	str r0, [r1]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BB0C8: .4byte gUnknown_20399B4
_080BB0CC: .4byte gBattleAnimArgs
_080BB0D0: .4byte gTasks
_080BB0D4: .4byte sub_80BB0D8
	thumb_func_end sub_80BB088

	thumb_func_start sub_80BB0D8
sub_80BB0D8: @ 80BB0D8
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r0, _080BB0F0 @ =gUnknown_20399B4
	ldr r1, [r0]
	movs r2, 0x8
	ldrsh r0, [r1, r2]
	cmp r0, 0
	bne _080BB0F8
	ldr r0, _080BB0F4 @ =gBattleAnimAttacker
	b _080BB0FA
	.align 2, 0
_080BB0F0: .4byte gUnknown_20399B4
_080BB0F4: .4byte gBattleAnimAttacker
_080BB0F8:
	ldr r0, _080BB230 @ =gBattleAnimTarget
_080BB0FA:
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r4, _080BB234 @ =gUnknown_20399B4
	ldr r2, [r4]
	ldrb r0, [r2]
	movs r1, 0x2
	eors r0, r1
	strb r0, [r2, 0x1]
	bl sub_8073788
	lsls r0, 24
	cmp r0, 0
	bne _080BB12A
	ldr r1, [r4]
	movs r2, 0xA
	ldrsh r0, [r1, r2]
	cmp r0, 0
	beq _080BB130
	ldrb r0, [r1, 0x1]
	bl sub_8072DF0
	lsls r0, 24
	cmp r0, 0
	bne _080BB130
_080BB12A:
	ldr r1, [r4]
	movs r0, 0
	strh r0, [r1, 0xA]
_080BB130:
	ldr r0, _080BB238 @ =gUnknown_2022984
	movs r1, 0
	strh r1, [r0]
	ldr r0, _080BB23C @ =gUnknown_2022986
	strh r1, [r0]
	ldr r1, _080BB240 @ =0x00003f3f
	movs r0, 0x48
	bl SetGpuReg
	ldr r1, _080BB244 @ =0x00003f3d
	movs r0, 0x4A
	bl SetGpuReg
	movs r1, 0x80
	lsls r1, 8
	movs r0, 0
	bl SetGpuRegBits
	ldr r1, _080BB248 @ =0x00003f42
	movs r0, 0x50
	bl SetGpuReg
	movs r1, 0x80
	lsls r1, 5
	movs r0, 0x52
	bl SetGpuReg
	movs r0, 0x1
	movs r1, 0x4
	movs r2, 0
	bl SetAnimBgAttribute
	movs r0, 0x1
	movs r1, 0
	movs r2, 0
	bl SetAnimBgAttribute
	bl sub_8073788
	lsls r0, 24
	cmp r0, 0
	bne _080BB18E
	movs r0, 0x1
	movs r1, 0x3
	movs r2, 0x1
	bl SetAnimBgAttribute
_080BB18E:
	bl sub_8075290
	lsls r0, 24
	cmp r0, 0
	beq _080BB20A
	ldr r4, _080BB234 @ =gUnknown_20399B4
	ldr r1, [r4]
	movs r2, 0xA
	ldrsh r0, [r1, r2]
	cmp r0, 0
	bne _080BB20A
	ldrb r0, [r1]
	bl GetBattlerPosition
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	beq _080BB1C0
	ldr r0, [r4]
	ldrb r0, [r0]
	bl GetBattlerPosition
	lsls r0, 24
	cmp r0, 0
	bne _080BB20A
_080BB1C0:
	ldr r0, [r4]
	ldrb r0, [r0, 0x1]
	bl sub_8072DF0
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x1
	bne _080BB20A
	ldr r3, _080BB24C @ =gSprites
	ldr r1, _080BB250 @ =gUnknown_2023D44
	ldr r0, [r4]
	ldrb r0, [r0, 0x1]
	adds r0, r1
	ldrb r0, [r0]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r3
	ldrb r3, [r2, 0x5]
	lsls r1, r3, 28
	lsrs r1, 30
	subs r1, 0x1
	movs r0, 0x3
	ands r1, r0
	lsls r1, 2
	movs r0, 0xD
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, 0x5]
	movs r0, 0x1
	movs r1, 0x4
	movs r2, 0x1
	bl SetAnimBgAttribute
	ldr r0, [r4]
	strb r5, [r0, 0x2]
_080BB20A:
	ldr r4, _080BB234 @ =gUnknown_20399B4
	ldr r0, [r4]
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080BB25C
	ldr r1, _080BB254 @ =gBattlerPartyIndexes
	ldr r0, [r4]
	ldrb r0, [r0]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080BB258 @ =gEnemyParty
	b _080BB26E
	.align 2, 0
_080BB230: .4byte gBattleAnimTarget
_080BB234: .4byte gUnknown_20399B4
_080BB238: .4byte gUnknown_2022984
_080BB23C: .4byte gUnknown_2022986
_080BB240: .4byte 0x00003f3f
_080BB244: .4byte 0x00003f3d
_080BB248: .4byte 0x00003f42
_080BB24C: .4byte gSprites
_080BB250: .4byte gUnknown_2023D44
_080BB254: .4byte gBattlerPartyIndexes
_080BB258: .4byte gEnemyParty
_080BB25C:
	ldr r1, _080BB290 @ =gBattlerPartyIndexes
	ldr r0, [r4]
	ldrb r0, [r0]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080BB294 @ =gPlayerParty
_080BB26E:
	adds r0, r1
	movs r1, 0xB
	bl GetMonData
	ldr r1, [r4]
	strh r0, [r1, 0x14]
	ldr r0, _080BB298 @ =gTasks
	lsls r1, r6, 2
	adds r1, r6
	lsls r1, 3
	adds r1, r0
	ldr r0, _080BB29C @ =sub_80BB2A0
	str r0, [r1]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BB290: .4byte gBattlerPartyIndexes
_080BB294: .4byte gPlayerParty
_080BB298: .4byte gTasks
_080BB29C: .4byte sub_80BB2A0
	thumb_func_end sub_80BB0D8

	thumb_func_start sub_80BB2A0
sub_80BB2A0: @ 80BB2A0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x10
	lsls r0, 24
	lsrs r5, r0, 24
	movs r0, 0
	mov r8, r0
	ldr r6, _080BB300 @ =gUnknown_2023D44
	ldr r4, _080BB304 @ =gUnknown_20399B4
	ldr r2, [r4]
	ldrb r0, [r2]
	adds r1, r0, r6
	ldrb r1, [r1]
	ldrh r2, [r2, 0x14]
	bl sub_8076E34
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r2, [r4]
	movs r1, 0xA
	ldrsh r0, [r2, r1]
	cmp r0, 0
	beq _080BB2E2
	ldrb r0, [r2, 0x1]
	adds r1, r0, r6
	ldrb r1, [r1]
	ldrh r2, [r2, 0x14]
	bl sub_8076E34
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
_080BB2E2:
	mov r0, sp
	bl sub_80752A0
	ldr r0, [r4]
	movs r4, 0x4
	ldrsh r0, [r0, r4]
	cmp r0, 0
	bne _080BB30C
	mov r0, sp
	ldrb r0, [r0, 0x9]
	ldr r1, _080BB308 @ =gFile_graphics_battle_anims_masks_stat_tilemap_1_tilemap
	bl sub_807543C
	b _080BB316
	.align 2, 0
_080BB300: .4byte gUnknown_2023D44
_080BB304: .4byte gUnknown_20399B4
_080BB308: .4byte gFile_graphics_battle_anims_masks_stat_tilemap_1_tilemap
_080BB30C:
	mov r0, sp
	ldrb r0, [r0, 0x9]
	ldr r1, _080BB354 @ =gFile_graphics_battle_anims_masks_stat_tilemap_2_tilemap
	bl sub_807543C
_080BB316:
	bl sub_8073788
	lsls r0, 24
	cmp r0, 0
	beq _080BB32E
	mov r0, sp
	ldrb r0, [r0, 0x8]
	ldr r1, [sp, 0x4]
	movs r2, 0
	movs r3, 0
	bl sub_80730C0
_080BB32E:
	mov r0, sp
	ldrb r0, [r0, 0x9]
	ldr r1, _080BB358 @ =gFile_graphics_battle_anims_masks_stat_sheet
	mov r2, sp
	ldrh r2, [r2, 0xA]
	bl sub_80753B4
	ldr r0, _080BB35C @ =gUnknown_20399B4
	ldr r0, [r0]
	movs r1, 0x6
	ldrsh r0, [r0, r1]
	cmp r0, 0x6
	bhi _080BB3C4
	lsls r0, 2
	ldr r1, _080BB360 @ =_080BB364
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080BB354: .4byte gFile_graphics_battle_anims_masks_stat_tilemap_2_tilemap
_080BB358: .4byte gFile_graphics_battle_anims_masks_stat_sheet
_080BB35C: .4byte gUnknown_20399B4
_080BB360: .4byte _080BB364
	.align 2, 0
_080BB364:
	.4byte _080BB380
	.4byte _080BB388
	.4byte _080BB390
	.4byte _080BB398
	.4byte _080BB3A0
	.4byte _080BB3A8
	.4byte _080BB3B0
_080BB380:
	ldr r0, _080BB384 @ =gFile_graphics_battle_anims_masks_stat2_palette
	b _080BB3B2
	.align 2, 0
_080BB384: .4byte gFile_graphics_battle_anims_masks_stat2_palette
_080BB388:
	ldr r0, _080BB38C @ =gFile_graphics_battle_anims_masks_stat1_palette
	b _080BB3B2
	.align 2, 0
_080BB38C: .4byte gFile_graphics_battle_anims_masks_stat1_palette
_080BB390:
	ldr r0, _080BB394 @ =gFile_graphics_battle_anims_masks_stat3_palette
	b _080BB3B2
	.align 2, 0
_080BB394: .4byte gFile_graphics_battle_anims_masks_stat3_palette
_080BB398:
	ldr r0, _080BB39C @ =gFile_graphics_battle_anims_masks_stat4_palette
	b _080BB3B2
	.align 2, 0
_080BB39C: .4byte gFile_graphics_battle_anims_masks_stat4_palette
_080BB3A0:
	ldr r0, _080BB3A4 @ =gFile_graphics_battle_anims_masks_stat6_palette
	b _080BB3B2
	.align 2, 0
_080BB3A4: .4byte gFile_graphics_battle_anims_masks_stat6_palette
_080BB3A8:
	ldr r0, _080BB3AC @ =gFile_graphics_battle_anims_masks_stat7_palette
	b _080BB3B2
	.align 2, 0
_080BB3AC: .4byte gFile_graphics_battle_anims_masks_stat7_palette
_080BB3B0:
	ldr r0, _080BB3C0 @ =gFile_graphics_battle_anims_masks_stat8_palette
_080BB3B2:
	mov r1, sp
	ldrb r1, [r1, 0x8]
	lsls r1, 4
	movs r2, 0x20
	bl LoadCompressedPalette
	b _080BB3D2
	.align 2, 0
_080BB3C0: .4byte gFile_graphics_battle_anims_masks_stat8_palette
_080BB3C4:
	ldr r0, _080BB3FC @ =gFile_graphics_battle_anims_masks_stat5_palette
	mov r1, sp
	ldrb r1, [r1, 0x8]
	lsls r1, 4
	movs r2, 0x20
	bl LoadCompressedPalette
_080BB3D2:
	ldr r3, _080BB400 @ =gBattle_BG1_X
	movs r2, 0
	strh r2, [r3]
	ldr r0, _080BB404 @ =gBattle_BG1_Y
	strh r2, [r0]
	ldr r1, _080BB408 @ =gUnknown_20399B4
	ldr r0, [r1]
	movs r4, 0x4
	ldrsh r0, [r0, r4]
	adds r4, r1, 0
	cmp r0, 0x1
	bne _080BB414
	movs r0, 0x40
	strh r0, [r3]
	ldr r2, _080BB40C @ =gTasks
	lsls r3, r5, 2
	adds r0, r3, r5
	lsls r0, 3
	adds r0, r2
	ldr r1, _080BB410 @ =0x0000fffd
	b _080BB420
	.align 2, 0
_080BB3FC: .4byte gFile_graphics_battle_anims_masks_stat5_palette
_080BB400: .4byte gBattle_BG1_X
_080BB404: .4byte gBattle_BG1_Y
_080BB408: .4byte gUnknown_20399B4
_080BB40C: .4byte gTasks
_080BB410: .4byte 0x0000fffd
_080BB414:
	ldr r2, _080BB43C @ =gTasks
	lsls r3, r5, 2
	adds r0, r3, r5
	lsls r0, 3
	adds r0, r2
	movs r1, 0x3
_080BB420:
	strh r1, [r0, 0xA]
	ldr r0, [r4]
	movs r1, 0xC
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080BB440
	adds r0, r3, r5
	lsls r0, 3
	adds r0, r2
	movs r1, 0xA
	strh r1, [r0, 0x10]
	movs r1, 0x14
	b _080BB44C
	.align 2, 0
_080BB43C: .4byte gTasks
_080BB440:
	adds r0, r3, r5
	lsls r0, 3
	adds r0, r2
	movs r1, 0xD
	strh r1, [r0, 0x10]
	movs r1, 0x1E
_080BB44C:
	strh r1, [r0, 0x12]
	adds r1, r3, r5
	lsls r1, 3
	adds r1, r2
	strh r7, [r1, 0x8]
	ldr r3, [r4]
	ldrh r0, [r3, 0xA]
	strh r0, [r1, 0xC]
	mov r4, r8
	strh r4, [r1, 0xE]
	ldrb r0, [r3, 0x2]
	strh r0, [r1, 0x14]
	ldr r2, _080BB490 @ =gUnknown_2023D44
	ldrb r0, [r3, 0x1]
	adds r0, r2
	ldrb r0, [r0]
	strh r0, [r1, 0x16]
	ldr r0, _080BB494 @ =sub_80BB4B8
	str r0, [r1]
	movs r1, 0x4
	ldrsh r0, [r3, r1]
	cmp r0, 0
	bne _080BB498
	movs r0, 0x40
	negs r0, r0
	bl sub_8073B08
	adds r1, r0, 0
	lsls r1, 24
	asrs r1, 24
	movs r0, 0xE8
	bl PlaySE12WithPanning
	b _080BB4AC
	.align 2, 0
_080BB490: .4byte gUnknown_2023D44
_080BB494: .4byte sub_80BB4B8
_080BB498:
	movs r0, 0x40
	negs r0, r0
	bl sub_8073B08
	adds r1, r0, 0
	lsls r1, 24
	asrs r1, 24
	movs r0, 0xEE
	bl PlaySE12WithPanning
_080BB4AC:
	add sp, 0x10
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80BB2A0

	thumb_func_start sub_80BB4B8
sub_80BB4B8: @ 80BB4B8
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r2, _080BB4E4 @ =gBattle_BG1_Y
	ldr r1, _080BB4E8 @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r5, r0, r1
	ldrh r0, [r5, 0xA]
	ldrh r1, [r2]
	adds r0, r1
	strh r0, [r2]
	movs r0, 0x26
	ldrsh r2, [r5, r0]
	cmp r2, 0x1
	beq _080BB52E
	cmp r2, 0x1
	bgt _080BB4EC
	cmp r2, 0
	beq _080BB4F6
	b _080BB644
	.align 2, 0
_080BB4E4: .4byte gBattle_BG1_Y
_080BB4E8: .4byte gTasks
_080BB4EC:
	cmp r2, 0x2
	beq _080BB544
	cmp r2, 0x3
	beq _080BB582
	b _080BB644
_080BB4F6:
	ldrh r0, [r5, 0x1E]
	adds r1, r0, 0x1
	strh r1, [r5, 0x1E]
	lsls r0, 16
	cmp r0, 0
	bgt _080BB504
	b _080BB644
_080BB504:
	strh r2, [r5, 0x1E]
	ldrh r1, [r5, 0x20]
	adds r1, 0x1
	strh r1, [r5, 0x20]
	movs r0, 0x10
	subs r0, r1
	lsls r0, 8
	orrs r1, r0
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x52
	bl SetGpuReg
	movs r2, 0x20
	ldrsh r1, [r5, r2]
	movs r2, 0x10
	ldrsh r0, [r5, r2]
	cmp r1, r0
	beq _080BB52C
	b _080BB644
_080BB52C:
	b _080BB57A
_080BB52E:
	ldrh r0, [r5, 0x1C]
	adds r0, 0x1
	strh r0, [r5, 0x1C]
	lsls r0, 16
	asrs r0, 16
	movs r2, 0x12
	ldrsh r1, [r5, r2]
	cmp r0, r1
	beq _080BB542
	b _080BB644
_080BB542:
	b _080BB57A
_080BB544:
	ldrh r0, [r5, 0x1E]
	adds r1, r0, 0x1
	strh r1, [r5, 0x1E]
	lsls r0, 16
	cmp r0, 0
	ble _080BB644
	movs r0, 0
	strh r0, [r5, 0x1E]
	ldrh r1, [r5, 0x20]
	subs r1, 0x1
	strh r1, [r5, 0x20]
	movs r0, 0x10
	subs r0, r1
	lsls r0, 8
	orrs r1, r0
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x52
	bl SetGpuReg
	movs r1, 0x20
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _080BB644
	movs r0, 0
	bl sub_8073128
_080BB57A:
	ldrh r0, [r5, 0x26]
	adds r0, 0x1
	strh r0, [r5, 0x26]
	b _080BB644
_080BB582:
	ldr r0, _080BB64C @ =gUnknown_2022984
	movs r1, 0
	strh r1, [r0]
	ldr r0, _080BB650 @ =gUnknown_2022986
	strh r1, [r0]
	ldr r4, _080BB654 @ =0x00003f3f
	movs r0, 0x48
	adds r1, r4, 0
	bl SetGpuReg
	movs r0, 0x4A
	adds r1, r4, 0
	bl SetGpuReg
	bl sub_8073788
	lsls r0, 24
	cmp r0, 0
	bne _080BB5B2
	movs r0, 0x1
	movs r1, 0x3
	movs r2, 0
	bl SetAnimBgAttribute
_080BB5B2:
	movs r0, 0
	bl GetGpuReg
	adds r1, r0, 0
	movs r2, 0x80
	lsls r2, 8
	adds r0, r2, 0
	eors r1, r0
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0
	bl SetGpuReg
	movs r0, 0x50
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x52
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x8
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r4, _080BB658 @ =gSprites
	adds r0, r4
	bl DestroySprite
	movs r1, 0xC
	ldrsh r0, [r5, r1]
	cmp r0, 0
	beq _080BB606
	movs r2, 0xE
	ldrsh r1, [r5, r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl DestroySprite
_080BB606:
	movs r1, 0x14
	ldrsh r0, [r5, r1]
	cmp r0, 0x1
	bne _080BB632
	movs r2, 0x16
	ldrsh r0, [r5, r2]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r4
	ldrb r3, [r2, 0x5]
	lsls r1, r3, 28
	lsrs r1, 30
	adds r1, 0x1
	movs r0, 0x3
	ands r1, r0
	lsls r1, 2
	movs r0, 0xD
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, 0x5]
_080BB632:
	ldr r4, _080BB65C @ =gUnknown_20399B4
	ldr r0, [r4]
	bl Free
	movs r0, 0
	str r0, [r4]
	adds r0, r6, 0
	bl DestroyAnimVisualTask
_080BB644:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BB64C: .4byte gUnknown_2022984
_080BB650: .4byte gUnknown_2022986
_080BB654: .4byte 0x00003f3f
_080BB658: .4byte gSprites
_080BB65C: .4byte gUnknown_20399B4
	thumb_func_end sub_80BB4B8

	thumb_func_start sub_80BB660
sub_80BB660: @ 80BB660
	push {r4-r6,lr}
	sub sp, 0xC
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	movs r0, 0x1
	movs r1, 0x1
	movs r2, 0x1
	movs r3, 0x1
	bl sub_8075CB8
	adds r6, r0, 0
	movs r1, 0
	bl sub_80BB790
	ldr r0, _080BB6C0 @ =gTasks
	lsls r4, r5, 2
	adds r4, r5
	lsls r4, 3
	adds r4, r0
	lsrs r0, r6, 16
	movs r5, 0
	strh r0, [r4, 0x24]
	str r5, [sp]
	str r5, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r0, 0x1
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl sub_8075BE8
	adds r6, r0, 0
	ldr r1, _080BB6C4 @ =0x0000ffff
	ands r6, r1
	adds r0, r6, 0
	bl sub_80BB790
	strh r6, [r4, 0x26]
	strh r5, [r4, 0x8]
	strh r5, [r4, 0xA]
	ldr r0, _080BB6C8 @ =sub_80BB6CC
	str r0, [r4]
	add sp, 0xC
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BB6C0: .4byte gTasks
_080BB6C4: .4byte 0x0000ffff
_080BB6C8: .4byte sub_80BB6CC
	thumb_func_end sub_80BB660

	thumb_func_start sub_80BB6CC
sub_80BB6CC: @ 80BB6CC
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r1, _080BB6F0 @ =gTasks
	adds r4, r0, r1
	movs r0, 0x8
	ldrsh r1, [r4, r0]
	cmp r1, 0x1
	beq _080BB710
	cmp r1, 0x1
	bgt _080BB6F4
	cmp r1, 0
	beq _080BB6FA
	b _080BB78A
	.align 2, 0
_080BB6F0: .4byte gTasks
_080BB6F4:
	cmp r1, 0x2
	beq _080BB784
	b _080BB78A
_080BB6FA:
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x6
	ble _080BB78A
	strh r1, [r4, 0xA]
	movs r0, 0x10
	strh r0, [r4, 0xC]
	b _080BB778
_080BB710:
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080BB78A
	movs r0, 0
	strh r0, [r4, 0xA]
	ldrh r0, [r4, 0xC]
	subs r0, 0x1
	strh r0, [r4, 0xC]
	movs r5, 0
	movs r6, 0x1
_080BB72C:
	movs r1, 0x26
	ldrsh r0, [r4, r1]
	asrs r0, r5
	ands r0, r6
	cmp r0, 0
	beq _080BB746
	lsls r0, r5, 20
	lsrs r0, 16
	ldrb r2, [r4, 0xC]
	movs r1, 0x10
	ldr r3, _080BB780 @ =0x0000ffff
	bl BlendPalette
_080BB746:
	movs r1, 0x24
	ldrsh r0, [r4, r1]
	asrs r0, r5
	ands r0, r6
	cmp r0, 0
	beq _080BB766
	lsls r0, r5, 20
	movs r1, 0x80
	lsls r1, 17
	adds r0, r1
	lsrs r0, 16
	ldrb r2, [r4, 0xC]
	movs r1, 0x10
	movs r3, 0
	bl BlendPalette
_080BB766:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0xF
	bls _080BB72C
	movs r1, 0xC
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080BB78A
_080BB778:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080BB78A
	.align 2, 0
_080BB780: .4byte 0x0000ffff
_080BB784:
	adds r0, r2, 0
	bl DestroyAnimVisualTask
_080BB78A:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80BB6CC

	thumb_func_start sub_80BB790
sub_80BB790: @ 80BB790
	push {r4-r6,lr}
	adds r3, r0, 0
	lsls r1, 16
	lsrs r6, r1, 16
	movs r2, 0
_080BB79A:
	movs r0, 0x1
	ands r0, r3
	lsrs r4, r3, 1
	adds r5, r2, 0x1
	cmp r0, 0
	beq _080BB7C6
	lsls r0, r2, 20
	lsrs r2, r0, 16
	adds r0, r2, 0
	adds r0, 0x10
	cmp r2, r0
	bge _080BB7C6
	ldr r1, _080BB7D8 @ =gPlttBufferFaded
	adds r3, r0, 0
_080BB7B6:
	lsls r0, r2, 1
	adds r0, r1
	strh r6, [r0]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, r3
	blt _080BB7B6
_080BB7C6:
	adds r3, r4, 0
	lsls r0, r5, 16
	lsrs r2, r0, 16
	cmp r2, 0x1F
	bls _080BB79A
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BB7D8: .4byte gPlttBufferFaded
	thumb_func_end sub_80BB790

	thumb_func_start sub_80BB7DC
sub_80BB7DC: @ 80BB7DC
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	movs r4, 0
	movs r2, 0
	ldr r0, _080BB824 @ =gBattleAnimAttacker
	ldrb r3, [r0]
	movs r5, 0x1
_080BB7EC:
	cmp r3, r2
	beq _080BB7FA
	adds r1, r2, 0
	adds r1, 0x10
	adds r0, r5, 0
	lsls r0, r1
	orrs r4, r0
_080BB7FA:
	adds r2, 0x1
	cmp r2, 0x3
	bls _080BB7EC
	movs r2, 0x5
	ldr r0, _080BB828 @ =gBattleAnimArgs
	adds r1, r0, 0
	adds r1, 0x8
_080BB808:
	ldrh r0, [r1]
	strh r0, [r1, 0x2]
	subs r1, 0x2
	subs r2, 0x1
	cmp r2, 0
	bne _080BB808
	adds r0, r6, 0
	adds r1, r4, 0
	bl sub_80BAA4C
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BB824: .4byte gBattleAnimAttacker
_080BB828: .4byte gBattleAnimArgs
	thumb_func_end sub_80BB7DC

	thumb_func_start sub_80BB82C
sub_80BB82C: @ 80BB82C
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	movs r0, 0
	bl sub_8075458
	ldr r0, _080BB894 @ =sub_80BB8A4
	movs r1, 0x5
	bl CreateTask
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r4, _080BB898 @ =gBattleAnimArgs
	movs r1, 0x4
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080BB868
	ldr r0, _080BB89C @ =gBattleAnimAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080BB868
	ldrh r0, [r4]
	negs r0, r0
	strh r0, [r4]
	ldrh r0, [r4, 0x2]
	negs r0, r0
	strh r0, [r4, 0x2]
_080BB868:
	ldr r0, _080BB8A0 @ =gTasks
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	ldr r2, _080BB898 @ =gBattleAnimArgs
	ldrh r0, [r2]
	strh r0, [r1, 0xA]
	ldrh r0, [r2, 0x2]
	strh r0, [r1, 0xC]
	ldrh r0, [r2, 0x6]
	strh r0, [r1, 0xE]
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	adds r0, r6, 0
	bl DestroyAnimVisualTask
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BB894: .4byte sub_80BB8A4
_080BB898: .4byte gBattleAnimArgs
_080BB89C: .4byte gBattleAnimAttacker
_080BB8A0: .4byte gTasks
	thumb_func_end sub_80BB82C

	thumb_func_start sub_80BB8A4
sub_80BB8A4: @ 80BB8A4
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _080BB910 @ =gTasks
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	ldrh r3, [r1, 0xA]
	ldrh r0, [r1, 0x1C]
	adds r3, r0
	movs r4, 0
	mov r12, r4
	strh r3, [r1, 0x1C]
	ldrh r2, [r1, 0xC]
	ldrh r7, [r1, 0x1E]
	adds r2, r7
	strh r2, [r1, 0x1E]
	ldr r6, _080BB914 @ =gBattle_BG3_X
	lsls r0, r3, 16
	asrs r0, 24
	ldrh r4, [r6]
	adds r0, r4
	strh r0, [r6]
	ldr r4, _080BB918 @ =gBattle_BG3_Y
	lsls r0, r2, 16
	asrs r0, 24
	ldrh r7, [r4]
	adds r0, r7
	strh r0, [r4]
	movs r0, 0xFF
	ands r3, r0
	strh r3, [r1, 0x1C]
	ands r2, r0
	strh r2, [r1, 0x1E]
	ldr r0, _080BB91C @ =gBattleAnimArgs
	movs r3, 0xE
	ldrsh r2, [r0, r3]
	movs r7, 0xE
	ldrsh r0, [r1, r7]
	cmp r2, r0
	bne _080BB90A
	mov r0, r12
	strh r0, [r6]
	strh r0, [r4]
	movs r0, 0x1
	bl sub_8075458
	adds r0, r5, 0
	bl DestroyTask
_080BB90A:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BB910: .4byte gTasks
_080BB914: .4byte gBattle_BG3_X
_080BB918: .4byte gBattle_BG3_Y
_080BB91C: .4byte gBattleAnimArgs
	thumb_func_end sub_80BB8A4

	thumb_func_start sub_80BB920
sub_80BB920: @ 80BB920
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _080BB944 @ =gBattleAnimAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	ldr r1, _080BB948 @ =gBattleAnimArgs
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r1, 0xE]
	adds r0, r4, 0
	bl DestroyAnimVisualTask
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BB944: .4byte gBattleAnimAttacker
_080BB948: .4byte gBattleAnimArgs
	thumb_func_end sub_80BB920

	thumb_func_start sub_80BB94C
sub_80BB94C: @ 80BB94C
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _080BB970 @ =gBattleAnimTarget
	ldrb r0, [r0]
	bl GetBattlerSide
	ldr r1, _080BB974 @ =gBattleAnimArgs
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r1, 0xE]
	adds r0, r4, 0
	bl DestroyAnimVisualTask
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BB970: .4byte gBattleAnimTarget
_080BB974: .4byte gBattleAnimArgs
	thumb_func_end sub_80BB94C

	thumb_func_start sub_80BB978
sub_80BB978: @ 80BB978
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r5, _080BB9A4 @ =gBattleAnimArgs
	movs r4, 0
	ldr r0, _080BB9A8 @ =gBattleAnimAttacker
	ldrb r2, [r0]
	movs r0, 0x2
	ldr r1, _080BB9AC @ =gBattleAnimTarget
	eors r0, r2
	ldrb r1, [r1]
	cmp r0, r1
	bne _080BB994
	movs r4, 0x1
_080BB994:
	strh r4, [r5, 0xE]
	adds r0, r3, 0
	bl DestroyAnimVisualTask
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BB9A4: .4byte gBattleAnimArgs
_080BB9A8: .4byte gBattleAnimAttacker
_080BB9AC: .4byte gBattleAnimTarget
	thumb_func_end sub_80BB978

	thumb_func_start sub_80BB9B0
sub_80BB9B0: @ 80BB9B0
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	movs r4, 0
	ldr r6, _080BBA10 @ =gSprites
_080BB9BA:
	ldr r0, _080BBA14 @ =gBattleAnimAttacker
	ldrb r0, [r0]
	cmp r4, r0
	beq _080BB9F8
	lsls r0, r4, 24
	lsrs r0, 24
	bl sub_8072DF0
	lsls r0, 24
	cmp r0, 0
	beq _080BB9F8
	ldr r0, _080BBA18 @ =gUnknown_2023D44
	adds r0, r4, r0
	ldrb r0, [r0]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r6
	ldr r1, _080BBA1C @ =gBattleAnimArgs
	adds r2, 0x3E
	movs r0, 0x1
	ldrb r3, [r1]
	ands r3, r0
	lsls r3, 2
	ldrb r0, [r2]
	movs r7, 0x5
	negs r7, r7
	adds r1, r7, 0
	ands r0, r1
	orrs r0, r3
	strb r0, [r2]
_080BB9F8:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x3
	bls _080BB9BA
	adds r0, r5, 0
	bl DestroyAnimVisualTask
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BBA10: .4byte gSprites
_080BBA14: .4byte gBattleAnimAttacker
_080BBA18: .4byte gUnknown_2023D44
_080BBA1C: .4byte gBattleAnimArgs
	thumb_func_end sub_80BB9B0

	thumb_func_start sub_80BBA20
sub_80BBA20: @ 80BBA20
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x24
	ldr r1, [sp, 0x44]
	ldr r4, [sp, 0x48]
	ldr r5, [sp, 0x4C]
	ldr r6, [sp, 0x50]
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	lsls r2, 16
	lsrs r2, 16
	str r2, [sp, 0x14]
	lsls r3, 24
	lsrs r7, r3, 24
	lsls r1, 24
	lsrs r1, 24
	mov r8, r1
	lsls r4, 24
	lsrs r4, 24
	str r4, [sp, 0x18]
	lsls r5, 24
	lsrs r5, 24
	str r5, [sp, 0x1C]
	lsls r6, 24
	lsrs r6, 24
	mov r10, r6
	movs r0, 0
	str r0, [sp, 0x20]
	movs r0, 0x2
	adds r6, r7, 0
	eors r6, r0
	bl sub_8073788
	lsls r0, 24
	cmp r0, 0
	bne _080BBA82
	mov r1, r8
	cmp r1, 0
	beq _080BBA86
	adds r0, r6, 0
	bl sub_8072DF0
	lsls r0, 24
	cmp r0, 0
	bne _080BBA86
_080BBA82:
	movs r2, 0
	mov r8, r2
_080BBA86:
	ldr r0, _080BBB20 @ =gUnknown_2022984
	movs r1, 0
	strh r1, [r0]
	ldr r0, _080BBB24 @ =gUnknown_2022986
	strh r1, [r0]
	ldr r1, _080BBB28 @ =0x00003f3f
	movs r0, 0x48
	bl SetGpuReg
	ldr r1, _080BBB2C @ =0x00003f3d
	movs r0, 0x4A
	bl SetGpuReg
	movs r1, 0x80
	lsls r1, 8
	movs r0, 0
	bl SetGpuRegBits
	ldr r1, _080BBB30 @ =0x00003f42
	movs r0, 0x50
	bl SetGpuReg
	movs r1, 0x80
	lsls r1, 5
	movs r0, 0x52
	bl SetGpuReg
	movs r0, 0xA
	bl GetGpuReg
	add r4, sp, 0x10
	strh r0, [r4]
	ldrb r1, [r4]
	movs r0, 0x4
	negs r0, r0
	ands r0, r1
	strb r0, [r4]
	mov r2, sp
	adds r2, 0x11
	ldrb r1, [r2]
	movs r0, 0x3F
	ands r0, r1
	strb r0, [r2]
	ldrb r0, [r2]
	movs r1, 0x20
	orrs r0, r1
	strb r0, [r2]
	bl sub_8073788
	lsls r0, 24
	cmp r0, 0
	bne _080BBAFC
	ldrb r0, [r4]
	movs r1, 0xD
	negs r1, r1
	ands r1, r0
	movs r0, 0x4
	orrs r1, r0
	strb r1, [r4]
_080BBAFC:
	ldrh r1, [r4]
	movs r0, 0xA
	bl SetGpuReg
	adds r0, r7, 0
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080BBB3C
	ldr r1, _080BBB34 @ =gBattlerPartyIndexes
	lsls r0, r7, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080BBB38 @ =gEnemyParty
	b _080BBB4A
	.align 2, 0
_080BBB20: .4byte gUnknown_2022984
_080BBB24: .4byte gUnknown_2022986
_080BBB28: .4byte 0x00003f3f
_080BBB2C: .4byte 0x00003f3d
_080BBB30: .4byte 0x00003f42
_080BBB34: .4byte gBattlerPartyIndexes
_080BBB38: .4byte gEnemyParty
_080BBB3C:
	ldr r1, _080BBC10 @ =gBattlerPartyIndexes
	lsls r0, r7, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080BBC14 @ =gPlayerParty
_080BBB4A:
	adds r0, r1
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r4, r0, 16
	ldr r5, _080BBC18 @ =gUnknown_2023D44
	adds r0, r7, r5
	ldrb r1, [r0]
	adds r0, r7, 0
	adds r2, r4, 0
	bl sub_8076E34
	lsls r0, 24
	lsrs r7, r0, 24
	mov r0, r8
	cmp r0, 0
	beq _080BBB80
	adds r0, r6, r5
	ldrb r1, [r0]
	adds r0, r6, 0
	adds r2, r4, 0
	bl sub_8076E34
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x20]
_080BBB80:
	mov r0, sp
	bl sub_80752A0
	mov r0, sp
	ldrb r0, [r0, 0x9]
	ldr r1, [sp, 0x58]
	bl sub_807543C
	bl sub_8073788
	lsls r0, 24
	cmp r0, 0
	beq _080BBBA8
	mov r0, sp
	ldrb r0, [r0, 0x8]
	ldr r1, [sp, 0x4]
	movs r2, 0
	movs r3, 0
	bl sub_80730C0
_080BBBA8:
	mov r0, sp
	ldrb r0, [r0, 0x9]
	mov r1, sp
	ldrh r2, [r1, 0xA]
	ldr r1, [sp, 0x54]
	bl sub_80753B4
	mov r0, sp
	ldrb r1, [r0, 0x8]
	lsls r1, 4
	ldr r0, [sp, 0x5C]
	movs r2, 0x20
	bl LoadCompressedPalette
	ldr r0, _080BBC1C @ =gBattle_BG1_X
	movs r1, 0
	strh r1, [r0]
	ldr r0, _080BBC20 @ =gBattle_BG1_Y
	strh r1, [r0]
	ldr r1, _080BBC24 @ =gTasks
	mov r2, r9
	lsls r0, r2, 2
	add r0, r9
	lsls r0, 3
	adds r0, r1
	mov r1, sp
	ldrh r1, [r1, 0x14]
	strh r1, [r0, 0xA]
	mov r2, sp
	ldrh r2, [r2, 0x18]
	strh r2, [r0, 0x10]
	mov r1, r10
	strh r1, [r0, 0x12]
	mov r2, sp
	ldrh r2, [r2, 0x1C]
	strh r2, [r0, 0x14]
	strh r7, [r0, 0x8]
	mov r1, r8
	strh r1, [r0, 0xC]
	mov r2, sp
	ldrh r2, [r2, 0x20]
	strh r2, [r0, 0xE]
	ldr r1, _080BBC28 @ =sub_80BBC2C
	str r1, [r0]
	add sp, 0x24
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BBC10: .4byte gBattlerPartyIndexes
_080BBC14: .4byte gPlayerParty
_080BBC18: .4byte gUnknown_2023D44
_080BBC1C: .4byte gBattle_BG1_X
_080BBC20: .4byte gBattle_BG1_Y
_080BBC24: .4byte gTasks
_080BBC28: .4byte sub_80BBC2C
	thumb_func_end sub_80BBA20

	thumb_func_start sub_80BBC2C
sub_80BBC2C: @ 80BBC2C
	push {r4-r6,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r1, _080BBC68 @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r3, r0, r1
	movs r0, 0xA
	ldrsh r2, [r3, r0]
	adds r5, r1, 0
	cmp r2, 0
	bge _080BBC4A
	negs r2, r2
_080BBC4A:
	ldrh r0, [r3, 0x22]
	adds r4, r0, r2
	strh r4, [r3, 0x22]
	movs r1, 0xA
	ldrsh r0, [r3, r1]
	cmp r0, 0
	bge _080BBC70
	ldr r2, _080BBC6C @ =gBattle_BG1_Y
	lsls r1, r4, 16
	asrs r1, 24
	ldrh r0, [r2]
	subs r0, r1
	strh r0, [r2]
	b _080BBC7C
	.align 2, 0
_080BBC68: .4byte gTasks
_080BBC6C: .4byte gBattle_BG1_Y
_080BBC70:
	ldr r1, _080BBCA0 @ =gBattle_BG1_Y
	lsls r0, r4, 16
	asrs r0, 24
	ldrh r2, [r1]
	adds r0, r2
	strh r0, [r1]
_080BBC7C:
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r5, r0, r5
	ldrh r1, [r5, 0x22]
	movs r0, 0xFF
	ands r0, r1
	movs r2, 0
	strh r0, [r5, 0x22]
	movs r3, 0x26
	ldrsh r0, [r5, r3]
	cmp r0, 0x1
	beq _080BBCE6
	cmp r0, 0x1
	bgt _080BBCA4
	cmp r0, 0
	beq _080BBCAA
	b _080BBDD8
	.align 2, 0
_080BBCA0: .4byte gBattle_BG1_Y
_080BBCA4:
	cmp r0, 0x2
	beq _080BBD00
	b _080BBDD8
_080BBCAA:
	ldrh r0, [r5, 0x1E]
	adds r1, r0, 0x1
	strh r1, [r5, 0x1E]
	lsls r0, 16
	asrs r0, 16
	movs r3, 0x14
	ldrsh r1, [r5, r3]
	cmp r0, r1
	bge _080BBCBE
	b _080BBDD8
_080BBCBE:
	strh r2, [r5, 0x1E]
	ldrh r1, [r5, 0x20]
	adds r1, 0x1
	strh r1, [r5, 0x20]
	movs r0, 0x10
	subs r0, r1
	lsls r0, 8
	orrs r1, r0
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x52
	bl SetGpuReg
	movs r0, 0x20
	ldrsh r1, [r5, r0]
	movs r2, 0x10
	ldrsh r0, [r5, r2]
	cmp r1, r0
	bne _080BBDD8
	b _080BBCF8
_080BBCE6:
	ldrh r0, [r5, 0x1C]
	adds r0, 0x1
	strh r0, [r5, 0x1C]
	lsls r0, 16
	asrs r0, 16
	movs r3, 0x12
	ldrsh r1, [r5, r3]
	cmp r0, r1
	bne _080BBDD8
_080BBCF8:
	ldrh r0, [r5, 0x26]
	adds r0, 0x1
	strh r0, [r5, 0x26]
	b _080BBDD8
_080BBD00:
	ldrh r0, [r5, 0x1E]
	adds r1, r0, 0x1
	strh r1, [r5, 0x1E]
	lsls r0, 16
	asrs r0, 16
	movs r3, 0x14
	ldrsh r1, [r5, r3]
	cmp r0, r1
	blt _080BBDD8
	strh r2, [r5, 0x1E]
	ldrh r1, [r5, 0x20]
	subs r1, 0x1
	strh r1, [r5, 0x20]
	movs r0, 0x10
	subs r0, r1
	lsls r0, 8
	orrs r1, r0
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x52
	bl SetGpuReg
	movs r0, 0x20
	ldrsh r4, [r5, r0]
	cmp r4, 0
	bne _080BBDD8
	movs r0, 0
	bl sub_8073128
	ldr r0, _080BBDE0 @ =gUnknown_2022984
	strh r4, [r0]
	ldr r0, _080BBDE4 @ =gUnknown_2022986
	strh r4, [r0]
	ldr r4, _080BBDE8 @ =0x00003f3f
	movs r0, 0x48
	adds r1, r4, 0
	bl SetGpuReg
	movs r0, 0x4A
	adds r1, r4, 0
	bl SetGpuReg
	bl sub_8073788
	lsls r0, 24
	cmp r0, 0
	bne _080BBD7E
	movs r0, 0xA
	bl GetGpuReg
	mov r1, sp
	strh r0, [r1]
	mov r2, sp
	ldrb r1, [r2]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	mov r0, sp
	ldrh r1, [r0]
	movs r0, 0xA
	bl SetGpuReg
_080BBD7E:
	movs r0, 0
	bl GetGpuReg
	adds r1, r0, 0
	movs r2, 0x80
	lsls r2, 8
	adds r0, r2, 0
	eors r1, r0
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0
	bl SetGpuReg
	movs r0, 0x50
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x52
	movs r1, 0
	bl SetGpuReg
	movs r3, 0x8
	ldrsh r1, [r5, r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r4, _080BBDEC @ =gSprites
	adds r0, r4
	bl DestroySprite
	movs r1, 0xC
	ldrsh r0, [r5, r1]
	cmp r0, 0
	beq _080BBDD2
	movs r2, 0xE
	ldrsh r1, [r5, r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl DestroySprite
_080BBDD2:
	adds r0, r6, 0
	bl DestroyAnimVisualTask
_080BBDD8:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BBDE0: .4byte gUnknown_2022984
_080BBDE4: .4byte gUnknown_2022986
_080BBDE8: .4byte 0x00003f3f
_080BBDEC: .4byte gSprites
	thumb_func_end sub_80BBC2C

	thumb_func_start sub_80BBDF0
sub_80BBDF0: @ 80BBDF0
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080BBE08 @ =gBattleAnimArgs
	ldr r1, _080BBE0C @ =gUnknown_2022B50
	ldrb r1, [r1]
	strh r1, [r2]
	bl DestroyAnimVisualTask
	pop {r0}
	bx r0
	.align 2, 0
_080BBE08: .4byte gBattleAnimArgs
_080BBE0C: .4byte gUnknown_2022B50
	thumb_func_end sub_80BBDF0

	thumb_func_start sub_80BBE10
sub_80BBE10: @ 80BBE10
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x80
	lsls r0, 6
	bl AllocZeroed
	ldr r1, _080BBE38 @ =gMonSpritesGfxPtr
	ldr r1, [r1]
	movs r2, 0xBE
	lsls r2, 1
	adds r1, r2
	str r0, [r1]
	adds r0, r4, 0
	bl DestroyAnimVisualTask
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BBE38: .4byte gMonSpritesGfxPtr
	thumb_func_end sub_80BBE10

	thumb_func_start sub_80BBE3C
sub_80BBE3C: @ 80BBE3C
	push {r4-r6,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r6, _080BBE68 @ =gMonSpritesGfxPtr
	ldr r0, [r6]
	movs r5, 0xBE
	lsls r5, 1
	adds r0, r5
	ldr r0, [r0]
	bl Free
	ldr r0, [r6]
	adds r0, r5
	movs r1, 0
	str r1, [r0]
	adds r0, r4, 0
	bl DestroyAnimVisualTask
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BBE68: .4byte gMonSpritesGfxPtr
	thumb_func_end sub_80BBE3C

	thumb_func_start sub_80BBE6C
sub_80BBE6C: @ 80BBE6C
	push {r4,r5,lr}
	sub sp, 0xC
	lsls r0, 24
	lsrs r5, r0, 24
	movs r4, 0
	ldr r0, _080BBEAC @ =gBattleAnimArgs
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080BBEB0
	str r4, [sp]
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	movs r0, 0x1
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl sub_8075BE8
	adds r1, r0, 0
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _080BBEC8
	movs r2, 0x1
_080BBE9E:
	lsrs r1, 1
	adds r4, 0x1
	adds r0, r1, 0
	ands r0, r2
	cmp r0, 0
	beq _080BBE9E
	b _080BBEC8
	.align 2, 0
_080BBEAC: .4byte gBattleAnimArgs
_080BBEB0:
	cmp r0, 0x1
	bne _080BBEBC
	ldr r0, _080BBEB8 @ =gBattleAnimAttacker
	b _080BBEC2
	.align 2, 0
_080BBEB8: .4byte gBattleAnimAttacker
_080BBEBC:
	cmp r0, 0x2
	bne _080BBEC8
	ldr r0, _080BBEF8 @ =gBattleAnimTarget
_080BBEC2:
	ldrb r0, [r0]
	adds r4, r0, 0
	adds r4, 0x10
_080BBEC8:
	ldr r0, _080BBEFC @ =gMonSpritesGfxPtr
	ldr r1, [r0]
	ldr r0, _080BBF00 @ =gBattleAnimArgs
	movs r2, 0x2
	ldrsh r0, [r0, r2]
	movs r2, 0xBE
	lsls r2, 1
	adds r1, r2
	ldr r1, [r1]
	lsls r0, 5
	adds r0, r1
	lsls r1, r4, 5
	ldr r2, _080BBF04 @ =gPlttBufferUnfaded
	adds r1, r2
	movs r2, 0x20
	bl memcpy
	adds r0, r5, 0
	bl DestroyAnimVisualTask
	add sp, 0xC
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BBEF8: .4byte gBattleAnimTarget
_080BBEFC: .4byte gMonSpritesGfxPtr
_080BBF00: .4byte gBattleAnimArgs
_080BBF04: .4byte gPlttBufferUnfaded
	thumb_func_end sub_80BBE6C

	thumb_func_start sub_80BBF08
sub_80BBF08: @ 80BBF08
	push {r4,r5,lr}
	sub sp, 0xC
	lsls r0, 24
	lsrs r5, r0, 24
	movs r4, 0
	ldr r0, _080BBF48 @ =gBattleAnimArgs
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080BBF4C
	str r4, [sp]
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	movs r0, 0x1
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl sub_8075BE8
	adds r1, r0, 0
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _080BBF64
	movs r2, 0x1
_080BBF3A:
	lsrs r1, 1
	adds r4, 0x1
	adds r0, r1, 0
	ands r0, r2
	cmp r0, 0
	beq _080BBF3A
	b _080BBF64
	.align 2, 0
_080BBF48: .4byte gBattleAnimArgs
_080BBF4C:
	cmp r0, 0x1
	bne _080BBF58
	ldr r0, _080BBF54 @ =gBattleAnimAttacker
	b _080BBF5E
	.align 2, 0
_080BBF54: .4byte gBattleAnimAttacker
_080BBF58:
	cmp r0, 0x2
	bne _080BBF64
	ldr r0, _080BBF94 @ =gBattleAnimTarget
_080BBF5E:
	ldrb r0, [r0]
	adds r4, r0, 0
	adds r4, 0x10
_080BBF64:
	lsls r0, r4, 5
	ldr r1, _080BBF98 @ =gPlttBufferUnfaded
	adds r0, r1
	ldr r1, _080BBF9C @ =gMonSpritesGfxPtr
	ldr r2, [r1]
	ldr r1, _080BBFA0 @ =gBattleAnimArgs
	movs r3, 0x2
	ldrsh r1, [r1, r3]
	movs r3, 0xBE
	lsls r3, 1
	adds r2, r3
	ldr r2, [r2]
	lsls r1, 5
	adds r1, r2
	movs r2, 0x20
	bl memcpy
	adds r0, r5, 0
	bl DestroyAnimVisualTask
	add sp, 0xC
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BBF94: .4byte gBattleAnimTarget
_080BBF98: .4byte gPlttBufferUnfaded
_080BBF9C: .4byte gMonSpritesGfxPtr
_080BBFA0: .4byte gBattleAnimArgs
	thumb_func_end sub_80BBF08

	thumb_func_start sub_80BBFA4
sub_80BBFA4: @ 80BBFA4
	push {r4,r5,lr}
	sub sp, 0xC
	lsls r0, 24
	lsrs r5, r0, 24
	movs r4, 0
	ldr r0, _080BBFE4 @ =gBattleAnimArgs
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080BBFE8
	str r4, [sp]
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	movs r0, 0x1
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl sub_8075BE8
	adds r1, r0, 0
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _080BC000
	movs r2, 0x1
_080BBFD6:
	lsrs r1, 1
	adds r4, 0x1
	adds r0, r1, 0
	ands r0, r2
	cmp r0, 0
	beq _080BBFD6
	b _080BC000
	.align 2, 0
_080BBFE4: .4byte gBattleAnimArgs
_080BBFE8:
	cmp r0, 0x1
	bne _080BBFF4
	ldr r0, _080BBFF0 @ =gBattleAnimAttacker
	b _080BBFFA
	.align 2, 0
_080BBFF0: .4byte gBattleAnimAttacker
_080BBFF4:
	cmp r0, 0x2
	bne _080BC000
	ldr r0, _080BC020 @ =gBattleAnimTarget
_080BBFFA:
	ldrb r0, [r0]
	adds r4, r0, 0
	adds r4, 0x10
_080BC000:
	lsls r1, r4, 5
	ldr r0, _080BC024 @ =gPlttBufferUnfaded
	adds r0, r1, r0
	ldr r2, _080BC028 @ =gPlttBufferFaded
	adds r1, r2
	movs r2, 0x20
	bl memcpy
	adds r0, r5, 0
	bl DestroyAnimVisualTask
	add sp, 0xC
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BC020: .4byte gBattleAnimTarget
_080BC024: .4byte gPlttBufferUnfaded
_080BC028: .4byte gPlttBufferFaded
	thumb_func_end sub_80BBFA4

	thumb_func_start sub_80BC02C
sub_80BC02C: @ 80BC02C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_8073788
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	beq _080BC04C
	ldr r1, _080BC048 @ =gBattleAnimArgs
	movs r0, 0x1
	strh r0, [r1, 0xE]
	b _080BC050
	.align 2, 0
_080BC048: .4byte gBattleAnimArgs
_080BC04C:
	ldr r0, _080BC05C @ =gBattleAnimArgs
	strh r1, [r0, 0xE]
_080BC050:
	adds r0, r4, 0
	bl DestroyAnimVisualTask
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BC05C: .4byte gBattleAnimArgs
	thumb_func_end sub_80BC02C

	thumb_func_start sub_80BC060
sub_80BC060: @ 80BC060
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080BC080 @ =gBattleAnimAttacker
	ldr r1, _080BC084 @ =gBattlerTarget
	ldrb r1, [r1]
	strb r1, [r2]
	ldr r2, _080BC088 @ =gBattleAnimTarget
	ldr r1, _080BC08C @ =gUnknown_2023D6E
	ldrb r1, [r1]
	strb r1, [r2]
	bl DestroyAnimVisualTask
	pop {r0}
	bx r0
	.align 2, 0
_080BC080: .4byte gBattleAnimAttacker
_080BC084: .4byte gBattlerTarget
_080BC088: .4byte gBattleAnimTarget
_080BC08C: .4byte gUnknown_2023D6E
	thumb_func_end sub_80BC060

	thumb_func_start sub_80BC090
sub_80BC090: @ 80BC090
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _080BC0B8 @ =gBattleAnimAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	adds r4, r0, 0
	ldr r0, _080BC0BC @ =gBattleAnimTarget
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r4, 24
	lsls r0, 24
	cmp r4, r0
	bne _080BC0C4
	ldr r1, _080BC0C0 @ =gBattleAnimArgs
	movs r0, 0x1
	b _080BC0C8
	.align 2, 0
_080BC0B8: .4byte gBattleAnimAttacker
_080BC0BC: .4byte gBattleAnimTarget
_080BC0C0: .4byte gBattleAnimArgs
_080BC0C4:
	ldr r1, _080BC0D8 @ =gBattleAnimArgs
	movs r0, 0
_080BC0C8:
	strh r0, [r1, 0xE]
	adds r0, r5, 0
	bl DestroyAnimVisualTask
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BC0D8: .4byte gBattleAnimArgs
	thumb_func_end sub_80BC090

	thumb_func_start sub_80BC0DC
sub_80BC0DC: @ 80BC0DC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080BC0F4 @ =gBattleAnimTarget
	ldr r1, _080BC0F8 @ =gBattlerTarget
	ldrb r1, [r1]
	strb r1, [r2]
	bl DestroyAnimVisualTask
	pop {r0}
	bx r0
	.align 2, 0
_080BC0F4: .4byte gBattleAnimTarget
_080BC0F8: .4byte gBattlerTarget
	thumb_func_end sub_80BC0DC

	thumb_func_start sub_80BC0FC
sub_80BC0FC: @ 80BC0FC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080BC11C @ =gBattleAnimAttacker
	ldr r1, _080BC120 @ =sBattler_AI
	ldrb r1, [r1]
	strb r1, [r2]
	ldr r2, _080BC124 @ =gBattleAnimTarget
	ldr r1, _080BC128 @ =gUnknown_2023D6E
	ldrb r1, [r1]
	strb r1, [r2]
	bl DestroyAnimVisualTask
	pop {r0}
	bx r0
	.align 2, 0
_080BC11C: .4byte gBattleAnimAttacker
_080BC120: .4byte sBattler_AI
_080BC124: .4byte gBattleAnimTarget
_080BC128: .4byte gUnknown_2023D6E
	thumb_func_end sub_80BC0FC

	thumb_func_start sub_80BC12C
sub_80BC12C: @ 80BC12C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_8073788
	lsls r0, 24
	cmp r0, 0
	beq _080BC144
	adds r0, r4, 0
	bl DestroyAnimVisualTask
	b _080BC180
_080BC144:
	ldr r0, _080BC188 @ =gTasks
	lsls r3, r4, 2
	adds r3, r4
	lsls r3, 3
	adds r3, r0
	ldr r0, _080BC18C @ =gUnknown_2024018
	ldr r4, [r0]
	ldr r2, _080BC190 @ =gBattleAnimAttacker
	ldrb r0, [r2]
	ldr r1, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	lsls r0, 31
	lsrs r0, 31
	strh r0, [r3, 0x8]
	ldrb r1, [r2]
	ldr r0, [r4]
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1]
	movs r2, 0x1
	orrs r0, r2
	strb r0, [r1]
	ldr r0, _080BC194 @ =sub_80BC19C
	str r0, [r3]
	ldr r1, _080BC198 @ =gUnknown_2037EE2
	ldrb r0, [r1]
	subs r0, 0x1
	strb r0, [r1]
_080BC180:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BC188: .4byte gTasks
_080BC18C: .4byte gUnknown_2024018
_080BC190: .4byte gBattleAnimAttacker
_080BC194: .4byte sub_80BC19C
_080BC198: .4byte gUnknown_2037EE2
	thumb_func_end sub_80BC12C

	thumb_func_start sub_80BC19C
sub_80BC19C: @ 80BC19C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080BC1E8 @ =gBattleAnimArgs
	movs r2, 0xE
	ldrsh r1, [r0, r2]
	movs r0, 0x80
	lsls r0, 5
	cmp r1, r0
	bne _080BC1E0
	ldr r0, _080BC1EC @ =gUnknown_2024018
	ldr r1, [r0]
	ldr r0, _080BC1F0 @ =gBattleAnimAttacker
	ldrb r3, [r0]
	ldr r0, [r1]
	lsls r3, 2
	adds r3, r0
	ldr r1, _080BC1F4 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldrb r0, [r0, 0x8]
	movs r1, 0x1
	ands r1, r0
	ldrb r2, [r3]
	movs r0, 0x2
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	adds r0, r4, 0
	bl DestroyTask
_080BC1E0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BC1E8: .4byte gBattleAnimArgs
_080BC1EC: .4byte gUnknown_2024018
_080BC1F0: .4byte gBattleAnimAttacker
_080BC1F4: .4byte gTasks
	thumb_func_end sub_80BC19C

	thumb_func_start SetAnimBgAttribute
SetAnimBgAttribute: @ 80BC1F8
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 24
	lsrs r5, r1, 24
	lsls r2, 24
	lsrs r4, r2, 24
	cmp r6, 0x3
	bls _080BC20C
	b _080BC2FE
_080BC20C:
	ldr r0, _080BC228 @ =gUnknown_83E7CCA
	adds r0, r6, r0
	ldrb r0, [r0]
	bl GetGpuReg
	ldr r1, _080BC22C @ =gUnknown_20399B8
	strh r0, [r1]
	cmp r5, 0x6
	bhi _080BC2F0
	lsls r0, r5, 2
	ldr r1, _080BC230 @ =_080BC234
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080BC228: .4byte gUnknown_83E7CCA
_080BC22C: .4byte gUnknown_20399B8
_080BC230: .4byte _080BC234
	.align 2, 0
_080BC234:
	.4byte _080BC250
	.4byte _080BC264
	.4byte _080BC27C
	.4byte _080BC294
	.4byte _080BC2AC
	.4byte _080BC2C8
	.4byte _080BC2DC
_080BC250:
	ldr r2, _080BC260 @ =gUnknown_20399B8
	lsls r3, r4, 6
	ldrb r1, [r2, 0x1]
	movs r0, 0x3F
	ands r0, r1
	orrs r0, r3
	strb r0, [r2, 0x1]
	b _080BC2F0
	.align 2, 0
_080BC260: .4byte gUnknown_20399B8
_080BC264:
	ldr r3, _080BC278 @ =gUnknown_20399B8
	movs r0, 0x1
	adds r1, r4, 0
	ands r1, r0
	lsls r1, 5
	ldrb r2, [r3, 0x1]
	movs r0, 0x21
	negs r0, r0
	b _080BC2EA
	.align 2, 0
_080BC278: .4byte gUnknown_20399B8
_080BC27C:
	ldr r3, _080BC290 @ =gUnknown_20399B8
	movs r0, 0x1
	adds r1, r4, 0
	ands r1, r0
	lsls r1, 6
	ldrb r2, [r3]
	movs r0, 0x41
	negs r0, r0
	b _080BC2BA
	.align 2, 0
_080BC290: .4byte gUnknown_20399B8
_080BC294:
	ldr r3, _080BC2A8 @ =gUnknown_20399B8
	movs r0, 0x3
	adds r1, r4, 0
	ands r1, r0
	lsls r1, 2
	ldrb r2, [r3]
	movs r0, 0xD
	negs r0, r0
	b _080BC2BA
	.align 2, 0
_080BC2A8: .4byte gUnknown_20399B8
_080BC2AC:
	ldr r3, _080BC2C4 @ =gUnknown_20399B8
	movs r0, 0x3
	adds r1, r4, 0
	ands r1, r0
	ldrb r2, [r3]
	movs r0, 0x4
	negs r0, r0
_080BC2BA:
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	b _080BC2F0
	.align 2, 0
_080BC2C4: .4byte gUnknown_20399B8
_080BC2C8:
	ldr r2, _080BC2D8 @ =gUnknown_20399B8
	lsls r3, r4, 7
	ldrb r1, [r2]
	movs r0, 0x7F
	ands r0, r1
	orrs r0, r3
	strb r0, [r2]
	b _080BC2F0
	.align 2, 0
_080BC2D8: .4byte gUnknown_20399B8
_080BC2DC:
	ldr r3, _080BC304 @ =gUnknown_20399B8
	movs r0, 0x1F
	adds r1, r4, 0
	ands r1, r0
	ldrb r2, [r3, 0x1]
	movs r0, 0x20
	negs r0, r0
_080BC2EA:
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, 0x1]
_080BC2F0:
	ldr r0, _080BC308 @ =gUnknown_83E7CCA
	adds r0, r6, r0
	ldrb r0, [r0]
	ldr r1, _080BC304 @ =gUnknown_20399B8
	ldrh r1, [r1]
	bl SetGpuReg
_080BC2FE:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BC304: .4byte gUnknown_20399B8
_080BC308: .4byte gUnknown_83E7CCA
	thumb_func_end SetAnimBgAttribute

	thumb_func_start sub_80BC30C
sub_80BC30C: @ 80BC30C
	push {r4,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r1, 24
	lsrs r4, r1, 24
	cmp r2, 0x3
	bhi _080BC394
	ldr r0, _080BC338 @ =gUnknown_83E7CCE
	adds r0, r2, r0
	ldrb r0, [r0]
	bl GetGpuReg
	mov r1, sp
	strh r0, [r1]
	cmp r4, 0x6
	bhi _080BC394
	lsls r0, r4, 2
	ldr r1, _080BC33C @ =_080BC340
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080BC338: .4byte gUnknown_83E7CCE
_080BC33C: .4byte _080BC340
	.align 2, 0
_080BC340:
	.4byte _080BC35C
	.4byte _080BC364
	.4byte _080BC36C
	.4byte _080BC374
	.4byte _080BC37C
	.4byte _080BC384
	.4byte _080BC38C
_080BC35C:
	ldr r0, [sp]
	lsls r0, 16
	lsrs r0, 30
	b _080BC396
_080BC364:
	ldr r0, [sp]
	lsls r0, 18
	lsrs r0, 31
	b _080BC396
_080BC36C:
	ldr r0, [sp]
	lsls r0, 25
	lsrs r0, 31
	b _080BC396
_080BC374:
	ldr r0, [sp]
	lsls r0, 28
	lsrs r0, 30
	b _080BC396
_080BC37C:
	ldr r0, [sp]
	lsls r0, 30
	lsrs r0, 30
	b _080BC396
_080BC384:
	ldr r0, [sp]
	lsls r0, 24
	lsrs r0, 31
	b _080BC396
_080BC38C:
	ldr r0, [sp]
	lsls r0, 19
	lsrs r0, 27
	b _080BC396
_080BC394:
	movs r0, 0
_080BC396:
	add sp, 0x4
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80BC30C

	thumb_func_start sub_80BC3A0
sub_80BC3A0: @ 80BC3A0
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080BC3B8 @ =gBattleTypeFlags
	ldr r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080BC3C0
	ldr r0, _080BC3BC @ =sub_80BCC4C
	b _080BC3E8
	.align 2, 0
_080BC3B8: .4byte gBattleTypeFlags
_080BC3BC: .4byte sub_80BCC4C
_080BC3C0:
	movs r0, 0x80
	lsls r0, 5
	ands r1, r0
	cmp r1, 0
	beq _080BC3E0
	ldr r0, _080BC3D8 @ =gGameVersion
	ldrb r0, [r0]
	cmp r0, 0x2
	beq _080BC3E0
	movs r4, 0x3
	ldr r0, _080BC3DC @ =task00_battle_intro_80BC6C8
	b _080BC3E8
	.align 2, 0
_080BC3D8: .4byte gGameVersion
_080BC3DC: .4byte task00_battle_intro_80BC6C8
_080BC3E0:
	ldr r1, _080BC414 @ =gUnknown_83E7CD4
	lsls r0, r4, 2
	adds r0, r1
	ldr r0, [r0]
_080BC3E8:
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _080BC418 @ =gTasks
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 3
	adds r1, r0
	movs r0, 0
	strh r0, [r1, 0x8]
	strh r4, [r1, 0xA]
	strh r0, [r1, 0xC]
	strh r0, [r1, 0xE]
	strh r0, [r1, 0x10]
	strh r0, [r1, 0x12]
	strh r0, [r1, 0x14]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BC414: .4byte gUnknown_83E7CD4
_080BC418: .4byte gTasks
	thumb_func_end sub_80BC3A0

	thumb_func_start sub_80BC41C
sub_80BC41C: @ 80BC41C
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
	ldr r0, _080BC468 @ =gBattle_BG1_X
	movs r1, 0
	strh r1, [r0]
	ldr r0, _080BC46C @ =gBattle_BG1_Y
	strh r1, [r0]
	ldr r0, _080BC470 @ =gBattle_BG2_X
	strh r1, [r0]
	ldr r0, _080BC474 @ =gBattle_BG2_Y
	strh r1, [r0]
	movs r0, 0x50
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x52
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x54
	movs r1, 0
	bl SetGpuReg
	ldr r4, _080BC478 @ =0x00003f3f
	movs r0, 0x48
	adds r1, r4, 0
	bl SetGpuReg
	movs r0, 0x4A
	adds r1, r4, 0
	bl SetGpuReg
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BC468: .4byte gBattle_BG1_X
_080BC46C: .4byte gBattle_BG1_Y
_080BC470: .4byte gBattle_BG2_X
_080BC474: .4byte gBattle_BG2_Y
_080BC478: .4byte 0x00003f3f
	thumb_func_end sub_80BC41C

	thumb_func_start task_battle_intro_80BC47C
task_battle_intro_80BC47C: @ 80BC47C
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _080BC4B4 @ =gBattle_BG1_X
	ldrh r0, [r1]
	adds r0, 0x6
	strh r0, [r1]
	ldr r1, _080BC4B8 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	movs r2, 0x8
	ldrsh r0, [r0, r2]
	mov r8, r1
	cmp r0, 0x4
	bls _080BC4A8
	b _080BC6BA
_080BC4A8:
	lsls r0, 2
	ldr r1, _080BC4BC @ =_080BC4C0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080BC4B4: .4byte gBattle_BG1_X
_080BC4B8: .4byte gTasks
_080BC4BC: .4byte _080BC4C0
	.align 2, 0
_080BC4C0:
	.4byte _080BC4D4
	.4byte _080BC504
	.4byte _080BC52C
	.4byte _080BC574
	.4byte _080BC6B4
_080BC4D4:
	ldr r0, _080BC4EC @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080BC4F0
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	add r0, r8
	movs r1, 0x10
	b _080BC4FA
	.align 2, 0
_080BC4EC: .4byte gBattleTypeFlags
_080BC4F0:
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	add r0, r8
	movs r1, 0x1
_080BC4FA:
	strh r1, [r0, 0xC]
	ldrh r1, [r0, 0x8]
	adds r1, 0x1
	strh r1, [r0, 0x8]
	b _080BC6BA
_080BC504:
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	mov r3, r8
	adds r1, r0, r3
	ldrh r0, [r1, 0xC]
	subs r0, 0x1
	strh r0, [r1, 0xC]
	lsls r0, 16
	cmp r0, 0
	beq _080BC51C
	b _080BC6BA
_080BC51C:
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	movs r0, 0x48
	movs r1, 0x3F
	bl SetGpuReg
	b _080BC6BA
_080BC52C:
	ldr r1, _080BC568 @ =gUnknown_2022986
	ldrh r0, [r1]
	subs r0, 0xFF
	strh r0, [r1]
	movs r1, 0xFF
	lsls r1, 8
	ands r0, r1
	movs r1, 0xC0
	lsls r1, 6
	cmp r0, r1
	beq _080BC544
	b _080BC6BA
_080BC544:
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	add r1, r8
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	movs r0, 0xF0
	strh r0, [r1, 0xC]
	movs r0, 0x20
	strh r0, [r1, 0xE]
	ldr r2, _080BC56C @ =gUnknown_2023F4C
	ldrh r1, [r2]
	ldr r0, _080BC570 @ =0x0000fffe
	ands r0, r1
	strh r0, [r2]
	b _080BC6BA
	.align 2, 0
_080BC568: .4byte gUnknown_2022986
_080BC56C: .4byte gUnknown_2023F4C
_080BC570: .4byte 0x0000fffe
_080BC574:
	lsls r0, r4, 2
	adds r1, r0, r4
	lsls r1, 3
	mov r5, r8
	adds r2, r1, r5
	ldrh r3, [r2, 0xE]
	movs r5, 0xE
	ldrsh r1, [r2, r5]
	mov r12, r0
	cmp r1, 0
	beq _080BC590
	subs r0, r3, 0x1
	strh r0, [r2, 0xE]
	b _080BC5BE
_080BC590:
	movs r1, 0xA
	ldrsh r0, [r2, r1]
	cmp r0, 0x1
	bne _080BC5B0
	ldr r2, _080BC5A8 @ =gBattle_BG1_Y
	ldrh r1, [r2]
	ldr r0, _080BC5AC @ =0x0000ffb0
	cmp r1, r0
	beq _080BC5BE
	subs r0, r1, 0x2
	b _080BC5BC
	.align 2, 0
_080BC5A8: .4byte gBattle_BG1_Y
_080BC5AC: .4byte 0x0000ffb0
_080BC5B0:
	ldr r2, _080BC690 @ =gBattle_BG1_Y
	ldrh r1, [r2]
	ldr r0, _080BC694 @ =0x0000ffc8
	cmp r1, r0
	beq _080BC5BE
	subs r0, r1, 0x1
_080BC5BC:
	strh r0, [r2]
_080BC5BE:
	ldr r2, _080BC698 @ =gUnknown_2022986
	ldrh r1, [r2]
	movs r0, 0xFF
	lsls r0, 8
	ands r0, r1
	cmp r0, 0
	beq _080BC5D2
	ldr r3, _080BC69C @ =0xfffffc04
	adds r0, r1, r3
	strh r0, [r2]
_080BC5D2:
	mov r5, r12
	adds r0, r5, r4
	lsls r0, 3
	mov r2, r8
	adds r1, r0, r2
	ldrh r2, [r1, 0xC]
	movs r3, 0xC
	ldrsh r0, [r1, r3]
	cmp r0, 0
	beq _080BC5EA
	subs r0, r2, 0x2
	strh r0, [r1, 0xC]
_080BC5EA:
	movs r3, 0
	ldr r5, _080BC6A0 @ =gScanlineEffect
	mov r9, r5
	ldr r7, _080BC6A4 @ =gScanlineEffectRegBuffers
	mov r6, r9
	adds r5, r1, 0
_080BC5F6:
	lsls r2, r3, 1
	ldrb r1, [r6, 0x14]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 7
	adds r2, r0
	adds r2, r7
	ldrh r0, [r5, 0xC]
	strh r0, [r2]
	adds r3, 0x1
	cmp r3, 0x4F
	ble _080BC5F6
	cmp r3, 0x9F
	bgt _080BC63A
	ldr r7, _080BC6A4 @ =gScanlineEffectRegBuffers
	ldr r6, _080BC6A0 @ =gScanlineEffect
	ldr r1, _080BC6A8 @ =gTasks
	mov r2, r12
	adds r0, r2, r4
	lsls r0, 3
	adds r5, r0, r1
_080BC620:
	lsls r2, r3, 1
	ldrb r1, [r6, 0x14]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 7
	adds r2, r0
	adds r2, r7
	ldrh r0, [r5, 0xC]
	negs r0, r0
	strh r0, [r2]
	adds r3, 0x1
	cmp r3, 0x9F
	ble _080BC620
_080BC63A:
	mov r3, r12
	adds r0, r3, r4
	lsls r0, 3
	mov r5, r8
	adds r1, r0, r5
	movs r0, 0xC
	ldrsh r2, [r1, r0]
	cmp r2, 0
	bne _080BC6BA
	movs r0, 0x3
	mov r3, r9
	strb r0, [r3, 0x15]
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	str r2, [sp]
	ldr r1, _080BC6AC @ =0x0600e000
	ldr r2, _080BC6B0 @ =0x05000200
	mov r0, sp
	bl CpuSet
	movs r0, 0x1
	movs r1, 0x1
	movs r2, 0
	bl SetBgAttribute
	movs r0, 0x2
	movs r1, 0x1
	movs r2, 0
	bl SetBgAttribute
	movs r1, 0x9C
	lsls r1, 8
	movs r0, 0xA
	bl SetGpuReg
	movs r1, 0xBC
	lsls r1, 7
	movs r0, 0xC
	bl SetGpuReg
	b _080BC6BA
	.align 2, 0
_080BC690: .4byte gBattle_BG1_Y
_080BC694: .4byte 0x0000ffc8
_080BC698: .4byte gUnknown_2022986
_080BC69C: .4byte 0xfffffc04
_080BC6A0: .4byte gScanlineEffect
_080BC6A4: .4byte gScanlineEffectRegBuffers
_080BC6A8: .4byte gTasks
_080BC6AC: .4byte 0x0600e000
_080BC6B0: .4byte 0x05000200
_080BC6B4:
	adds r0, r4, 0
	bl sub_80BC41C
_080BC6BA:
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end task_battle_intro_80BC47C

	thumb_func_start task00_battle_intro_80BC6C8
task00_battle_intro_80BC6C8: @ 80BC6C8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _080BC6F4 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	movs r2, 0xA
	ldrsh r0, [r0, r2]
	adds r2, r1, 0
	cmp r0, 0x3
	beq _080BC708
	cmp r0, 0x3
	bgt _080BC6F8
	cmp r0, 0x2
	beq _080BC6FC
	b _080BC710
	.align 2, 0
_080BC6F4: .4byte gTasks
_080BC6F8:
	cmp r0, 0x4
	bne _080BC710
_080BC6FC:
	ldr r1, _080BC704 @ =gBattle_BG1_X
	ldrh r0, [r1]
	adds r0, 0x8
	b _080BC70E
	.align 2, 0
_080BC704: .4byte gBattle_BG1_X
_080BC708:
	ldr r1, _080BC74C @ =gBattle_BG1_X
	ldrh r0, [r1]
	adds r0, 0x6
_080BC70E:
	strh r0, [r1]
_080BC710:
	lsls r0, r5, 2
	adds r1, r0, r5
	lsls r1, 3
	adds r4, r1, r2
	movs r3, 0xA
	ldrsh r1, [r4, r3]
	adds r6, r0, 0
	cmp r1, 0x4
	bne _080BC774
	ldr r7, _080BC750 @ =gBattle_BG1_Y
	ldrh r0, [r4, 0x14]
	bl Cos2
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0
	bge _080BC736
	ldr r1, _080BC754 @ =0x000001ff
	adds r0, r1
_080BC736:
	asrs r0, 9
	subs r0, 0x8
	strh r0, [r7]
	ldrh r1, [r4, 0x14]
	movs r2, 0x14
	ldrsh r0, [r4, r2]
	cmp r0, 0xB3
	bgt _080BC758
	adds r0, r1, 0x4
	b _080BC75A
	.align 2, 0
_080BC74C: .4byte gBattle_BG1_X
_080BC750: .4byte gBattle_BG1_Y
_080BC754: .4byte 0x000001ff
_080BC758:
	adds r0, r1, 0x6
_080BC75A:
	strh r0, [r4, 0x14]
	ldr r2, _080BC790 @ =gTasks
	adds r0, r6, r5
	lsls r0, 3
	adds r3, r0, r2
	movs r0, 0x14
	ldrsh r1, [r3, r0]
	movs r0, 0xB4
	lsls r0, 1
	cmp r1, r0
	bne _080BC774
	movs r0, 0
	strh r0, [r3, 0x14]
_080BC774:
	adds r0, r6, r5
	lsls r0, 3
	adds r0, r2
	movs r1, 0x8
	ldrsh r0, [r0, r1]
	cmp r0, 0x4
	bls _080BC784
	b _080BC9AA
_080BC784:
	lsls r0, 2
	ldr r1, _080BC794 @ =_080BC798
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080BC790: .4byte gTasks
_080BC794: .4byte _080BC798
	.align 2, 0
_080BC798:
	.4byte _080BC7AC
	.4byte _080BC7DC
	.4byte _080BC808
	.4byte _080BC858
	.4byte _080BC9A4
_080BC7AC:
	ldr r1, _080BC7C8 @ =gTasks
	adds r0, r6, r5
	lsls r0, 3
	adds r2, r0, r1
	movs r3, 0x10
	strh r3, [r2, 0x10]
	ldr r0, _080BC7CC @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080BC7D0
	strh r3, [r2, 0xC]
	b _080BC7D4
	.align 2, 0
_080BC7C8: .4byte gTasks
_080BC7CC: .4byte gBattleTypeFlags
_080BC7D0:
	movs r0, 0x1
	strh r0, [r2, 0xC]
_080BC7D4:
	ldrh r0, [r2, 0x8]
	adds r0, 0x1
	strh r0, [r2, 0x8]
	b _080BC9AA
_080BC7DC:
	ldr r0, _080BC804 @ =gTasks
	adds r1, r6, r5
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0xC]
	subs r0, 0x1
	strh r0, [r1, 0xC]
	lsls r0, 16
	cmp r0, 0
	beq _080BC7F2
	b _080BC9AA
_080BC7F2:
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	movs r0, 0x48
	movs r1, 0x3F
	bl SetGpuReg
	b _080BC9AA
	.align 2, 0
_080BC804: .4byte gTasks
_080BC808:
	ldr r1, _080BC848 @ =gUnknown_2022986
	ldrh r0, [r1]
	subs r0, 0xFF
	strh r0, [r1]
	movs r1, 0xFF
	lsls r1, 8
	ands r0, r1
	movs r1, 0xC0
	lsls r1, 6
	cmp r0, r1
	beq _080BC820
	b _080BC9AA
_080BC820:
	ldr r0, _080BC84C @ =gTasks
	adds r1, r6, r5
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	movs r0, 0xF0
	strh r0, [r1, 0xC]
	movs r0, 0x20
	strh r0, [r1, 0xE]
	movs r0, 0x1
	strh r0, [r1, 0x12]
	ldr r2, _080BC850 @ =gUnknown_2023F4C
	ldrh r1, [r2]
	ldr r0, _080BC854 @ =0x0000fffe
	ands r0, r1
	strh r0, [r2]
	b _080BC9AA
	.align 2, 0
_080BC848: .4byte gUnknown_2022986
_080BC84C: .4byte gTasks
_080BC850: .4byte gUnknown_2023F4C
_080BC854: .4byte 0x0000fffe
_080BC858:
	ldr r0, _080BC890 @ =gTasks
	adds r1, r6, r5
	lsls r1, 3
	adds r1, r0
	ldrh r2, [r1, 0xE]
	movs r3, 0xE
	ldrsh r0, [r1, r3]
	cmp r0, 0
	beq _080BC898
	subs r0, r2, 0x1
	strh r0, [r1, 0xE]
	lsls r0, 16
	cmp r0, 0
	bne _080BC8B8
	ldr r1, _080BC894 @ =0x00001842
	movs r0, 0x50
	bl SetGpuReg
	movs r0, 0x52
	movs r1, 0xF
	bl SetGpuReg
	movs r0, 0x54
	movs r1, 0
	bl SetGpuReg
	b _080BC8B8
	.align 2, 0
_080BC890: .4byte gTasks
_080BC894: .4byte 0x00001842
_080BC898:
	ldrh r2, [r1, 0x10]
	movs r0, 0x1F
	ands r0, r2
	cmp r0, 0
	beq _080BC8B8
	ldrh r0, [r1, 0x12]
	subs r0, 0x1
	strh r0, [r1, 0x12]
	lsls r0, 16
	cmp r0, 0
	bne _080BC8B8
	adds r0, r2, 0
	adds r0, 0xFF
	strh r0, [r1, 0x10]
	movs r0, 0x4
	strh r0, [r1, 0x12]
_080BC8B8:
	ldr r2, _080BC988 @ =gUnknown_2022986
	ldrh r1, [r2]
	movs r0, 0xFF
	lsls r0, 8
	ands r0, r1
	cmp r0, 0
	beq _080BC8CC
	ldr r3, _080BC98C @ =0xfffffc04
	adds r0, r1, r3
	strh r0, [r2]
_080BC8CC:
	ldr r0, _080BC990 @ =gTasks
	adds r1, r6, r5
	lsls r1, 3
	adds r1, r0
	ldrh r2, [r1, 0xC]
	movs r3, 0xC
	ldrsh r0, [r1, r3]
	cmp r0, 0
	beq _080BC8E2
	subs r0, r2, 0x2
	strh r0, [r1, 0xC]
_080BC8E2:
	movs r3, 0
	ldr r0, _080BC994 @ =gScanlineEffect
	mov r8, r0
	ldr r2, _080BC998 @ =gScanlineEffectRegBuffers
	mov r12, r2
	mov r7, r8
	adds r4, r1, 0
_080BC8F0:
	lsls r2, r3, 1
	ldrb r1, [r7, 0x14]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 7
	adds r2, r0
	add r2, r12
	ldrh r0, [r4, 0xC]
	strh r0, [r2]
	adds r3, 0x1
	cmp r3, 0x4F
	ble _080BC8F0
	cmp r3, 0x9F
	bgt _080BC934
	ldr r0, _080BC998 @ =gScanlineEffectRegBuffers
	mov r12, r0
	ldr r7, _080BC994 @ =gScanlineEffect
	ldr r1, _080BC990 @ =gTasks
	adds r0, r6, r5
	lsls r0, 3
	adds r4, r0, r1
_080BC91A:
	lsls r2, r3, 1
	ldrb r1, [r7, 0x14]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 7
	adds r2, r0
	add r2, r12
	ldrh r0, [r4, 0xC]
	negs r0, r0
	strh r0, [r2]
	adds r3, 0x1
	cmp r3, 0x9F
	ble _080BC91A
_080BC934:
	ldr r1, _080BC990 @ =gTasks
	adds r0, r6, r5
	lsls r0, 3
	adds r1, r0, r1
	movs r3, 0xC
	ldrsh r2, [r1, r3]
	cmp r2, 0
	bne _080BC9AA
	movs r0, 0x3
	mov r3, r8
	strb r0, [r3, 0x15]
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	str r2, [sp]
	ldr r1, _080BC99C @ =0x0600e000
	ldr r2, _080BC9A0 @ =0x05000200
	mov r0, sp
	bl CpuSet
	movs r0, 0x1
	movs r1, 0x1
	movs r2, 0
	bl SetBgAttribute
	movs r0, 0x2
	movs r1, 0x1
	movs r2, 0
	bl SetBgAttribute
	movs r1, 0x9C
	lsls r1, 8
	movs r0, 0xA
	bl SetGpuReg
	movs r1, 0xBC
	lsls r1, 7
	movs r0, 0xC
	bl SetGpuReg
	b _080BC9AA
	.align 2, 0
_080BC988: .4byte gUnknown_2022986
_080BC98C: .4byte 0xfffffc04
_080BC990: .4byte gTasks
_080BC994: .4byte gScanlineEffect
_080BC998: .4byte gScanlineEffectRegBuffers
_080BC99C: .4byte 0x0600e000
_080BC9A0: .4byte 0x05000200
_080BC9A4:
	adds r0, r5, 0
	bl sub_80BC41C
_080BC9AA:
	ldr r0, _080BC9D0 @ =gTasks
	adds r1, r6, r5
	lsls r1, 3
	adds r1, r0
	movs r2, 0x8
	ldrsh r0, [r1, r2]
	cmp r0, 0x4
	beq _080BC9C2
	ldrh r1, [r1, 0x10]
	movs r0, 0x52
	bl SetGpuReg
_080BC9C2:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BC9D0: .4byte gTasks
	thumb_func_end task00_battle_intro_80BC6C8

	thumb_func_start task_battle_intro_anim
task_battle_intro_anim: @ 80BC9D4
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _080BCA08 @ =gBattle_BG1_X
	ldrh r0, [r1]
	adds r0, 0x8
	strh r0, [r1]
	ldr r1, _080BCA0C @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	movs r2, 0x8
	ldrsh r0, [r0, r2]
	adds r4, r1, 0
	cmp r0, 0x4
	bls _080BC9FE
	b _080BCC22
_080BC9FE:
	lsls r0, 2
	ldr r1, _080BCA10 @ =_080BCA14
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080BCA08: .4byte gBattle_BG1_X
_080BCA0C: .4byte gTasks
_080BCA10: .4byte _080BCA14
	.align 2, 0
_080BCA14:
	.4byte _080BCA28
	.4byte _080BCA7C
	.4byte _080BCAA8
	.4byte _080BCAF8
	.4byte _080BCC1C
_080BCA28:
	ldr r1, _080BCA60 @ =0x00001842
	movs r0, 0x50
	bl SetGpuReg
	ldr r4, _080BCA64 @ =0x00000808
	movs r0, 0x52
	adds r1, r4, 0
	bl SetGpuReg
	movs r0, 0x54
	movs r1, 0
	bl SetGpuReg
	ldr r1, _080BCA68 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r2, r0, r1
	strh r4, [r2, 0x10]
	ldr r0, _080BCA6C @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080BCA70
	movs r0, 0x10
	b _080BCA72
	.align 2, 0
_080BCA60: .4byte 0x00001842
_080BCA64: .4byte 0x00000808
_080BCA68: .4byte gTasks
_080BCA6C: .4byte gBattleTypeFlags
_080BCA70:
	movs r0, 0x1
_080BCA72:
	strh r0, [r2, 0xC]
	ldrh r0, [r2, 0x8]
	adds r0, 0x1
	strh r0, [r2, 0x8]
	b _080BCC22
_080BCA7C:
	ldr r0, _080BCAA4 @ =gTasks
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0xC]
	subs r0, 0x1
	strh r0, [r1, 0xC]
	lsls r0, 16
	cmp r0, 0
	beq _080BCA94
	b _080BCC22
_080BCA94:
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	movs r0, 0x48
	movs r1, 0x3F
	bl SetGpuReg
	b _080BCC22
	.align 2, 0
_080BCAA4: .4byte gTasks
_080BCAA8:
	ldr r1, _080BCAE8 @ =gUnknown_2022986
	ldrh r0, [r1]
	subs r0, 0xFF
	strh r0, [r1]
	movs r1, 0xFF
	lsls r1, 8
	ands r0, r1
	movs r1, 0xC0
	lsls r1, 6
	cmp r0, r1
	beq _080BCAC0
	b _080BCC22
_080BCAC0:
	ldr r0, _080BCAEC @ =gTasks
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	movs r0, 0xF0
	strh r0, [r1, 0xC]
	movs r0, 0x20
	strh r0, [r1, 0xE]
	movs r0, 0x1
	strh r0, [r1, 0x12]
	ldr r2, _080BCAF0 @ =gUnknown_2023F4C
	ldrh r1, [r2]
	ldr r0, _080BCAF4 @ =0x0000fffe
	ands r0, r1
	strh r0, [r2]
	b _080BCC22
	.align 2, 0
_080BCAE8: .4byte gUnknown_2022986
_080BCAEC: .4byte gTasks
_080BCAF0: .4byte gUnknown_2023F4C
_080BCAF4: .4byte 0x0000fffe
_080BCAF8:
	lsls r0, r5, 2
	adds r1, r0, r5
	lsls r1, 3
	adds r2, r1, r4
	ldrh r3, [r2, 0xE]
	movs r6, 0xE
	ldrsh r1, [r2, r6]
	mov r12, r0
	cmp r1, 0
	beq _080BCB12
	subs r0, r3, 0x1
	strh r0, [r2, 0xE]
	b _080BCB32
_080BCB12:
	ldrh r1, [r2, 0x10]
	movs r0, 0xF
	ands r0, r1
	cmp r0, 0
	beq _080BCB32
	ldrh r0, [r2, 0x12]
	subs r0, 0x1
	strh r0, [r2, 0x12]
	lsls r0, 16
	cmp r0, 0
	bne _080BCB32
	adds r0, r1, 0
	adds r0, 0xFF
	strh r0, [r2, 0x10]
	movs r0, 0x6
	strh r0, [r2, 0x12]
_080BCB32:
	ldr r2, _080BCC00 @ =gUnknown_2022986
	ldrh r1, [r2]
	movs r0, 0xFF
	lsls r0, 8
	ands r0, r1
	cmp r0, 0
	beq _080BCB46
	ldr r3, _080BCC04 @ =0xfffffc04
	adds r0, r1, r3
	strh r0, [r2]
_080BCB46:
	mov r6, r12
	adds r0, r6, r5
	lsls r0, 3
	adds r1, r0, r4
	ldrh r2, [r1, 0xC]
	movs r3, 0xC
	ldrsh r0, [r1, r3]
	cmp r0, 0
	beq _080BCB5C
	subs r0, r2, 0x2
	strh r0, [r1, 0xC]
_080BCB5C:
	movs r3, 0
	ldr r6, _080BCC08 @ =gScanlineEffect
	mov r8, r6
	ldr r7, _080BCC0C @ =gScanlineEffectRegBuffers
	adds r4, r1, 0
_080BCB66:
	lsls r2, r3, 1
	ldrb r1, [r6, 0x14]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 7
	adds r2, r0
	adds r2, r7
	ldrh r0, [r4, 0xC]
	strh r0, [r2]
	adds r3, 0x1
	cmp r3, 0x4F
	ble _080BCB66
	cmp r3, 0x9F
	bgt _080BCBAA
	ldr r7, _080BCC0C @ =gScanlineEffectRegBuffers
	ldr r6, _080BCC08 @ =gScanlineEffect
	ldr r1, _080BCC10 @ =gTasks
	mov r2, r12
	adds r0, r2, r5
	lsls r0, 3
	adds r4, r0, r1
_080BCB90:
	lsls r2, r3, 1
	ldrb r1, [r6, 0x14]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 7
	adds r2, r0
	adds r2, r7
	ldrh r0, [r4, 0xC]
	negs r0, r0
	strh r0, [r2]
	adds r3, 0x1
	cmp r3, 0x9F
	ble _080BCB90
_080BCBAA:
	ldr r1, _080BCC10 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r1, r0, r1
	movs r3, 0xC
	ldrsh r2, [r1, r3]
	cmp r2, 0
	bne _080BCC22
	movs r0, 0x3
	mov r6, r8
	strb r0, [r6, 0x15]
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	str r2, [sp]
	ldr r1, _080BCC14 @ =0x0600e000
	ldr r2, _080BCC18 @ =0x05000200
	mov r0, sp
	bl CpuSet
	movs r0, 0x1
	movs r1, 0x1
	movs r2, 0
	bl SetBgAttribute
	movs r0, 0x2
	movs r1, 0x1
	movs r2, 0
	bl SetBgAttribute
	movs r1, 0x9C
	lsls r1, 8
	movs r0, 0xA
	bl SetGpuReg
	movs r1, 0xBC
	lsls r1, 7
	movs r0, 0xC
	bl SetGpuReg
	b _080BCC22
	.align 2, 0
_080BCC00: .4byte gUnknown_2022986
_080BCC04: .4byte 0xfffffc04
_080BCC08: .4byte gScanlineEffect
_080BCC0C: .4byte gScanlineEffectRegBuffers
_080BCC10: .4byte gTasks
_080BCC14: .4byte 0x0600e000
_080BCC18: .4byte 0x05000200
_080BCC1C:
	adds r0, r5, 0
	bl sub_80BC41C
_080BCC22:
	ldr r0, _080BCC48 @ =gTasks
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	movs r2, 0x8
	ldrsh r0, [r1, r2]
	cmp r0, 0x4
	beq _080BCC3C
	ldrh r1, [r1, 0x10]
	movs r0, 0x52
	bl SetGpuReg
_080BCC3C:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BCC48: .4byte gTasks
	thumb_func_end task_battle_intro_anim

	thumb_func_start sub_80BCC4C
sub_80BCC4C: @ 80BCC4C
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x8
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r1, _080BCC98 @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r7, r0, r1
	movs r1, 0x8
	ldrsh r0, [r7, r1]
	cmp r0, 0x1
	ble _080BCCC2
	movs r2, 0x10
	ldrsh r0, [r7, r2]
	cmp r0, 0
	bne _080BCCC2
	ldr r2, _080BCC9C @ =gBattle_BG1_X
	ldrh r1, [r2]
	movs r0, 0x80
	lsls r0, 8
	ands r0, r1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0
	bne _080BCC8A
	cmp r1, 0x4F
	bhi _080BCCA4
_080BCC8A:
	adds r0, r1, 0x3
	strh r0, [r2]
	ldr r1, _080BCCA0 @ =gBattle_BG2_X
	ldrh r0, [r1]
	subs r0, 0x3
	strh r0, [r1]
	b _080BCCC2
	.align 2, 0
_080BCC98: .4byte gTasks
_080BCC9C: .4byte gBattle_BG1_X
_080BCCA0: .4byte gBattle_BG2_X
_080BCCA4:
	str r5, [sp]
	ldr r1, _080BCCE4 @ =0x0600e000
	ldr r4, _080BCCE8 @ =0x05000200
	mov r0, sp
	adds r2, r4, 0
	bl CpuSet
	str r5, [sp, 0x4]
	add r0, sp, 0x4
	ldr r1, _080BCCEC @ =0x0600f000
	adds r2, r4, 0
	bl CpuSet
	movs r0, 0x1
	strh r0, [r7, 0x10]
_080BCCC2:
	ldr r0, _080BCCF0 @ =gTasks
	lsls r2, r6, 2
	adds r1, r2, r6
	lsls r1, 3
	adds r1, r0
	movs r3, 0x8
	ldrsh r1, [r1, r3]
	mov r9, r0
	adds r5, r2, 0
	cmp r1, 0x4
	bls _080BCCDA
	b _080BCEE6
_080BCCDA:
	lsls r0, r1, 2
	ldr r1, _080BCCF4 @ =_080BCCF8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080BCCE4: .4byte 0x0600e000
_080BCCE8: .4byte 0x05000200
_080BCCEC: .4byte 0x0600f000
_080BCCF0: .4byte gTasks
_080BCCF4: .4byte _080BCCF8
	.align 2, 0
_080BCCF8:
	.4byte _080BCD0C
	.4byte _080BCD1E
	.4byte _080BCDC4
	.4byte _080BCE08
	.4byte _080BCEE0
_080BCD0C:
	adds r0, r5, r6
	lsls r0, 3
	add r0, r9
	movs r1, 0x20
	strh r1, [r0, 0xC]
	ldrh r1, [r0, 0x8]
	adds r1, 0x1
	strh r1, [r0, 0x8]
	b _080BCEE6
_080BCD1E:
	adds r0, r5, r6
	lsls r0, 3
	mov r2, r9
	adds r1, r0, r2
	ldrh r0, [r1, 0xC]
	subs r0, 0x1
	strh r0, [r1, 0xC]
	lsls r0, 16
	cmp r0, 0
	beq _080BCD34
	b _080BCEE6
_080BCD34:
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	ldr r4, _080BCDB4 @ =gSprites
	ldr r5, _080BCDB8 @ =gBattleStruct
	ldr r0, [r5]
	adds r0, 0x7D
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	ldrb r3, [r1, 0x1]
	movs r2, 0xD
	negs r2, r2
	adds r0, r2, 0
	ands r0, r3
	movs r3, 0x8
	mov r9, r3
	mov r3, r9
	orrs r0, r3
	strb r0, [r1, 0x1]
	ldr r3, [r5]
	adds r0, r3, 0
	adds r0, 0x7D
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	movs r1, 0x1C
	adds r1, r4
	mov r8, r1
	add r0, r8
	ldr r6, _080BCDBC @ =sub_801182C
	str r6, [r0]
	adds r3, 0x7E
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrb r1, [r0, 0x1]
	ands r2, r1
	mov r3, r9
	orrs r2, r3
	strb r2, [r0, 0x1]
	ldr r0, [r5]
	adds r0, 0x7E
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	add r0, r8
	str r6, [r0]
	movs r0, 0x48
	movs r1, 0x3F
	bl SetGpuReg
	ldr r1, _080BCDC0 @ =0x00003f06
	movs r0, 0x4A
	bl SetGpuReg
	b _080BCEE6
	.align 2, 0
_080BCDB4: .4byte gSprites
_080BCDB8: .4byte gBattleStruct
_080BCDBC: .4byte sub_801182C
_080BCDC0: .4byte 0x00003f06
_080BCDC4:
	ldr r1, _080BCDFC @ =gUnknown_2022986
	ldrh r0, [r1]
	subs r0, 0xFF
	strh r0, [r1]
	movs r1, 0xFF
	lsls r1, 8
	ands r0, r1
	movs r1, 0xC0
	lsls r1, 6
	cmp r0, r1
	beq _080BCDDC
	b _080BCEE6
_080BCDDC:
	adds r1, r5, r6
	lsls r1, 3
	add r1, r9
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	movs r0, 0xF0
	strh r0, [r1, 0xC]
	movs r0, 0x20
	strh r0, [r1, 0xE]
	ldr r2, _080BCE00 @ =gUnknown_2023F4C
	ldrh r1, [r2]
	ldr r0, _080BCE04 @ =0x0000fffe
	ands r0, r1
	strh r0, [r2]
	b _080BCEE6
	.align 2, 0
_080BCDFC: .4byte gUnknown_2022986
_080BCE00: .4byte gUnknown_2023F4C
_080BCE04: .4byte 0x0000fffe
_080BCE08:
	ldr r2, _080BCECC @ =gUnknown_2022986
	ldrh r1, [r2]
	movs r0, 0xFF
	lsls r0, 8
	ands r0, r1
	cmp r0, 0
	beq _080BCE1C
	ldr r3, _080BCED0 @ =0xfffffc04
	adds r0, r1, r3
	strh r0, [r2]
_080BCE1C:
	adds r0, r5, r6
	lsls r0, 3
	mov r2, r9
	adds r1, r0, r2
	ldrh r2, [r1, 0xC]
	movs r3, 0xC
	ldrsh r0, [r1, r3]
	cmp r0, 0
	beq _080BCE32
	subs r0, r2, 0x2
	strh r0, [r1, 0xC]
_080BCE32:
	movs r3, 0
	ldr r0, _080BCED4 @ =gScanlineEffect
	mov r12, r0
	ldr r2, _080BCED8 @ =gScanlineEffectRegBuffers
	mov r8, r2
	mov r7, r12
	adds r4, r1, 0
_080BCE40:
	lsls r2, r3, 1
	ldrb r1, [r7, 0x14]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 7
	adds r2, r0
	add r2, r8
	ldrh r0, [r4, 0xC]
	strh r0, [r2]
	adds r3, 0x1
	cmp r3, 0x4F
	ble _080BCE40
	cmp r3, 0x9F
	bgt _080BCE84
	ldr r0, _080BCED8 @ =gScanlineEffectRegBuffers
	mov r8, r0
	ldr r7, _080BCED4 @ =gScanlineEffect
	ldr r1, _080BCEDC @ =gTasks
	adds r0, r5, r6
	lsls r0, 3
	adds r4, r0, r1
_080BCE6A:
	lsls r2, r3, 1
	ldrb r1, [r7, 0x14]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 7
	adds r2, r0
	add r2, r8
	ldrh r0, [r4, 0xC]
	negs r0, r0
	strh r0, [r2]
	adds r3, 0x1
	cmp r3, 0x9F
	ble _080BCE6A
_080BCE84:
	adds r0, r5, r6
	lsls r0, 3
	mov r2, r9
	adds r1, r0, r2
	movs r3, 0xC
	ldrsh r0, [r1, r3]
	cmp r0, 0
	bne _080BCEE6
	movs r0, 0x3
	mov r2, r12
	strb r0, [r2, 0x15]
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	movs r0, 0x1
	movs r1, 0x1
	movs r2, 0
	bl SetBgAttribute
	movs r0, 0x2
	movs r1, 0x1
	movs r2, 0
	bl SetBgAttribute
	movs r1, 0x9C
	lsls r1, 8
	movs r0, 0xA
	bl SetGpuReg
	movs r1, 0xBC
	lsls r1, 7
	movs r0, 0xC
	bl SetGpuReg
	b _080BCEE6
	.align 2, 0
_080BCECC: .4byte gUnknown_2022986
_080BCED0: .4byte 0xfffffc04
_080BCED4: .4byte gScanlineEffect
_080BCED8: .4byte gScanlineEffectRegBuffers
_080BCEDC: .4byte gTasks
_080BCEE0:
	adds r0, r6, 0
	bl sub_80BC41C
_080BCEE6:
	add sp, 0x8
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80BCC4C

	thumb_func_start sub_80BCEF4
sub_80BCEF4: @ 80BCEF4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	str r0, [sp]
	adds r6, r2, 0
	adds r4, r3, 0
	ldr r0, [sp, 0x24]
	ldr r7, [sp, 0x28]
	ldr r2, [sp, 0x2C]
	mov r9, r2
	ldr r5, [sp, 0x30]
	lsls r1, 24
	lsrs r1, 24
	mov r8, r1
	lsls r6, 24
	lsrs r6, 24
	lsls r4, 24
	lsrs r4, 24
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	lsls r5, 16
	lsrs r5, 16
	adds r0, r4, 0
	bl GetBattlerAtPosition
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080BCFC4 @ =gMonSpritesGfxPtr
	ldr r2, [r1]
	lsls r4, 2
	adds r2, 0x4
	adds r2, r4
	ldr r1, _080BCFC8 @ =gBattleMonForms
	adds r0, r1
	ldrb r1, [r0]
	lsls r1, 11
	ldr r0, [r2]
	adds r0, r1
	movs r2, 0x80
	lsls r2, 3
	adds r1, r7, 0
	bl CpuSet
	ldr r1, [sp]
	lsls r0, r1, 24
	lsrs r0, 24
	movs r2, 0x80
	lsls r2, 5
	adds r1, r7, 0
	adds r3, r5, 0
	bl LoadBgTiles
	adds r0, r6, 0
	adds r0, 0x8
	cmp r6, r0
	bge _080BCFA0
	mov r12, r0
	mov r2, r8
	lsls r7, r2, 1
_080BCF72:
	mov r1, r8
	adds r2, r1, 0
	adds r2, 0x8
	adds r4, r6, 0x1
	cmp r1, r2
	bge _080BCF9A
	mov r0, r10
	lsls r3, r0, 12
	lsls r0, r6, 6
	add r0, r9
	adds r6, r7, r0
	subs r1, r2, r1
_080BCF8A:
	adds r0, r5, 0
	orrs r0, r3
	strh r0, [r6]
	adds r5, 0x1
	adds r6, 0x2
	subs r1, 0x1
	cmp r1, 0
	bne _080BCF8A
_080BCF9A:
	adds r6, r4, 0
	cmp r6, r12
	blt _080BCF72
_080BCFA0:
	ldr r1, [sp]
	lsls r0, r1, 24
	lsrs r0, 24
	movs r2, 0x80
	lsls r2, 4
	mov r1, r9
	movs r3, 0
	bl LoadBgTilemap
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BCFC4: .4byte gMonSpritesGfxPtr
_080BCFC8: .4byte gBattleMonForms
	thumb_func_end sub_80BCEF4

	thumb_func_start sub_80BCFCC
sub_80BCFCC: @ 80BCFCC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	ldr r4, [sp, 0x24]
	ldr r5, [sp, 0x28]
	mov r8, r5
	ldr r5, [sp, 0x2C]
	ldr r6, [sp, 0x30]
	mov r9, r6
	lsls r0, 24
	lsrs r0, 24
	mov r12, r0
	lsls r1, 24
	lsls r2, 24
	lsls r3, 24
	lsls r4, 24
	lsrs r4, 24
	mov r10, r4
	mov r7, r8
	lsls r7, 16
	lsrs r6, r7, 16
	lsls r5, 24
	lsrs r5, 24
	mov r0, r9
	lsls r0, 24
	mov r9, r0
	ldr r4, _080BD090 @ =0x040000d4
	ldr r0, _080BD094 @ =gMonSpritesGfxPtr
	ldr r0, [r0]
	lsrs r2, 22
	adds r0, 0x4
	adds r0, r2
	lsrs r3, 13
	ldr r0, [r0]
	adds r0, r3
	str r0, [r4]
	movs r0, 0xC0
	lsls r0, 19
	adds r6, r0
	str r6, [r4, 0x4]
	ldr r0, _080BD098 @ =0x80000400
	str r0, [r4, 0x8]
	ldr r0, [r4, 0x8]
	adds r2, r7, 0
	lsrs r2, 21
	mov r6, r9
	lsrs r6, 15
	subs r4, r2, r6
	lsrs r0, r1, 24
	adds r1, r0, 0
	adds r1, 0x8
	cmp r0, r1
	bge _080BD080
	mov r9, r1
	mov r7, r12
	lsls r7, 1
	mov r8, r7
	lsls r5, 11
	str r5, [sp]
_080BD048:
	mov r2, r12
	adds r3, r2, 0
	adds r3, 0x8
	adds r5, r0, 0x1
	cmp r2, r3
	bge _080BD07A
	mov r1, r10
	lsls r6, r1, 12
	lsls r0, 6
	movs r7, 0xC0
	lsls r7, 19
	adds r0, r7
	ldr r1, [sp]
	adds r0, r1, r0
	mov r7, r8
	adds r1, r7, r0
	subs r2, r3, r2
_080BD06A:
	adds r0, r4, 0
	orrs r0, r6
	strh r0, [r1]
	adds r4, 0x1
	adds r1, 0x2
	subs r2, 0x1
	cmp r2, 0
	bne _080BD06A
_080BD07A:
	adds r0, r5, 0
	cmp r0, r9
	blt _080BD048
_080BD080:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BD090: .4byte 0x040000d4
_080BD094: .4byte gMonSpritesGfxPtr
_080BD098: .4byte 0x80000400
	thumb_func_end sub_80BCFCC

	.align 2, 0 @ Don't pad with nop.
