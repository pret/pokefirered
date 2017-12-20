	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_8134200
sub_8134200: @ 8134200
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _08134228 @ =gUnknown_3005098
	adds r1, r0
	ldr r2, _0813422C @ =gSprites
	ldrb r1, [r1, 0xD]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x3E
	ldrb r2, [r0]
	movs r1, 0x5
	negs r1, r1
	ands r1, r2
	strb r1, [r0]
	bx lr
	.align 2, 0
_08134228: .4byte gUnknown_3005098
_0813422C: .4byte gSprites
	thumb_func_end sub_8134200

	thumb_func_start sub_8134230
sub_8134230: @ 8134230
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x28
	mov r9, r0
	mov r8, r2
	adds r6, r3, 0
	lsls r0, 16
	lsrs r0, 16
	mov r9, r0
	lsls r1, 16
	lsls r2, 24
	lsrs r2, 24
	mov r8, r2
	lsls r6, 24
	lsrs r6, 24
	ldr r0, _081343C4 @ =gUnknown_846343C
	str r0, [sp, 0x20]
	ldr r3, _081343C8 @ =0xffff0000
	add r0, sp, 0x20
	ldr r2, [r0, 0x4]
	ands r2, r3
	movs r3, 0x94
	lsls r3, 3
	orrs r2, r3
	lsrs r7, r1, 16
	ldr r5, _081343CC @ =0x0000ffff
	ands r2, r5
	orrs r2, r1
	str r2, [r0, 0x4]
	bl LoadCompressedObjectPic
	ldr r0, _081343D0 @ =gUnknown_846341C
	mov r3, r8
	lsls r3, 4
	mov r8, r3
	movs r1, 0x80
	lsls r1, 1
	add r1, r8
	movs r2, 0x20
	bl LoadPalette
	ldr r0, _081343D4 @ =sub_8134200
	movs r1, 0
	bl CreateTask
	mov r10, r0
	mov r0, r10
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	lsls r4, r0, 2
	add r4, r10
	lsls r4, 3
	ldr r0, _081343D8 @ =gUnknown_3005098
	adds r4, r0
	movs r0, 0
	strb r0, [r4, 0xC]
	strh r7, [r4, 0xE]
	ldrh r0, [r4, 0x10]
	orrs r5, r0
	strh r5, [r4, 0x10]
	movs r0, 0xF0
	lsls r0, 1
	bl Alloc
	adds r1, r0, 0
	str r1, [r4, 0x8]
	str r1, [r4, 0x4]
	mov r0, r9
	bl sub_813C9DC
	strb r0, [r4]
	movs r1, 0x80
	lsls r1, 8
	movs r0, 0
	bl SetGpuRegBits
	ldr r1, _081343DC @ =0x00002f42
	movs r0, 0x50
	bl SetGpuReg
	ldr r1, _081343E0 @ =0x0000080c
	movs r0, 0x52
	bl SetGpuReg
	movs r0, 0x54
	movs r1, 0
	bl SetGpuReg
	ldr r1, _081343E4 @ =0x00001f1f
	movs r0, 0x48
	bl SetGpuReg
	ldr r1, _081343E8 @ =0x00002f3d
	movs r0, 0x4A
	bl SetGpuReg
	add r1, sp, 0x8
	ldr r0, _081343EC @ =gDummySpriteTemplate
	ldm r0!, {r2,r3,r5}
	stm r1!, {r2,r3,r5}
	ldm r0!, {r2,r3,r5}
	stm r1!, {r2,r3,r5}
	add r0, sp, 0x8
	strh r7, [r0]
	adds r6, 0x20
	movs r1, 0x68
	adds r2, r6, 0
	movs r3, 0
	bl CreateSprite
	strb r0, [r4, 0xD]
	ldrb r1, [r4, 0xD]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r5, _081343F0 @ =gSprites
	adds r0, r5
	adds r1, r4, 0
	bl SetSubspriteTables
	ldrb r1, [r4, 0xD]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldrb r2, [r0, 0x1]
	movs r1, 0xD
	negs r1, r1
	ands r1, r2
	movs r2, 0x8
	orrs r1, r2
	strb r1, [r0, 0x1]
	ldrb r0, [r4, 0xD]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	ldrb r2, [r1, 0x5]
	movs r0, 0xF
	ands r0, r2
	mov r2, r8
	orrs r0, r2
	strb r0, [r1, 0x5]
	ldrb r1, [r4, 0xD]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	adds r0, 0x42
	ldrb r2, [r0]
	movs r1, 0x40
	negs r1, r1
	ands r1, r2
	strb r1, [r0]
	ldrb r1, [r4, 0xD]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	movs r0, 0x1
	bl HideBg
	movs r0, 0x1
	movs r1, 0x1
	movs r2, 0
	bl SetBgAttribute
	movs r0, 0x1E
	str r0, [sp]
	movs r0, 0x14
	str r0, [sp, 0x4]
	movs r0, 0x1
	movs r1, 0xF
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect_Palette0
	movs r0, 0x1
	bl CopyBgTilemapBufferToVram
	movs r0, 0x1
	bl ShowBg
	mov r0, r10
	add sp, 0x28
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_081343C4: .4byte gUnknown_846343C
_081343C8: .4byte 0xffff0000
_081343CC: .4byte 0x0000ffff
_081343D0: .4byte gUnknown_846341C
_081343D4: .4byte sub_8134200
_081343D8: .4byte gUnknown_3005098
_081343DC: .4byte 0x00002f42
_081343E0: .4byte 0x0000080c
_081343E4: .4byte 0x00001f1f
_081343E8: .4byte 0x00002f3d
_081343EC: .4byte gDummySpriteTemplate
_081343F0: .4byte gSprites
	thumb_func_end sub_8134230

	thumb_func_start sub_81343F4
sub_81343F4: @ 81343F4
	push {r4,r5,lr}
	sub sp, 0x8
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	lsls r4, r5, 2
	adds r4, r5
	lsls r4, 3
	ldr r0, _08134498 @ =gUnknown_3005098
	adds r4, r0
	ldrh r0, [r4, 0xE]
	bl FreeSpriteTilesByTag
	ldrb r1, [r4, 0xD]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0813449C @ =gSprites
	adds r0, r1
	bl DestroySprite
	ldr r0, [r4, 0x8]
	bl Free
	movs r0, 0x50
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x52
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x54
	movs r1, 0
	bl SetGpuReg
	ldr r4, _081344A0 @ =0x00001f1f
	movs r0, 0x48
	adds r1, r4, 0
	bl SetGpuReg
	movs r0, 0x4A
	adds r1, r4, 0
	bl SetGpuReg
	movs r1, 0x80
	lsls r1, 8
	movs r0, 0
	bl ClearGpuRegBits
	movs r0, 0x1
	bl HideBg
	movs r0, 0x1
	movs r1, 0x1
	movs r2, 0x2
	bl SetBgAttribute
	movs r0, 0x1E
	str r0, [sp]
	movs r0, 0x14
	str r0, [sp, 0x4]
	movs r0, 0x1
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect_Palette0
	movs r0, 0x1
	bl CopyBgTilemapBufferToVram
	movs r0, 0x1
	bl ShowBg
	adds r0, r5, 0
	bl DestroyTask
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08134498: .4byte gUnknown_3005098
_0813449C: .4byte gSprites
_081344A0: .4byte 0x00001f1f
	thumb_func_end sub_81343F4

	thumb_func_start sub_81344A4
sub_81344A4: @ 81344A4
	push {r4,lr}
	lsls r0, 2
	adds r0, r2
	ldr r4, _081344D8 @ =gUnknown_8463564
	ldr r3, _081344DC @ =gUnknown_8463580
	lsls r1, 2
	adds r2, r1, r3
	ldrb r2, [r2]
	lsls r2, 24
	asrs r2, 24
	lsls r2, 2
	adds r2, r4
	ldr r2, [r2]
	ldr r2, [r2]
	str r2, [r0]
	adds r2, r3, 0x1
	adds r2, r1, r2
	ldrb r2, [r2]
	strb r2, [r0]
	adds r3, 0x2
	adds r1, r3
	ldrb r1, [r1]
	strb r1, [r0, 0x1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081344D8: .4byte gUnknown_8463564
_081344DC: .4byte gUnknown_8463580
	thumb_func_end sub_81344A4

	thumb_func_start sub_81344E0
sub_81344E0: @ 81344E0
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _081344F4 @ =gUnknown_3005098
	adds r1, r0
	ldrb r0, [r1]
	bx lr
	.align 2, 0
_081344F4: .4byte gUnknown_3005098
	thumb_func_end sub_81344E0

	.align 2, 0 @ Don't pad with nop.
