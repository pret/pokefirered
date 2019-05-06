	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_81475C0
sub_81475C0: @ 81475C0
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	lsls r1, 24
	lsrs r1, 24
	ldr r0, _08147600 @ =sub_8147654
	bl CreateTask
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _08147604 @ =gTasks
	adds r0, r1
	movs r1, 0x1
	strh r1, [r0, 0x8]
	strh r5, [r0, 0xA]
	ldr r0, _08147608 @ =gUnknown_846B4AC
	lsls r5, 4
	adds r5, r0
	ldr r1, [r5]
	adds r0, r4, 0
	bl _call_via_r1
	adds r0, r4, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08147600: .4byte sub_8147654
_08147604: .4byte gTasks
_08147608: .4byte gUnknown_846B4AC
	thumb_func_end sub_81475C0

	thumb_func_start sub_814760C
sub_814760C: @ 814760C
	push {lr}
	ldr r0, _08147630 @ =sub_8147654
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0xFF
	beq _08147638
	ldr r0, _08147634 @ =gTasks
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 3
	adds r1, r0
	movs r0, 0x2
	strh r0, [r1, 0x8]
	movs r0, 0x1
	b _0814763A
	.align 2, 0
_08147630: .4byte sub_8147654
_08147634: .4byte gTasks
_08147638:
	movs r0, 0
_0814763A:
	pop {r1}
	bx r1
	thumb_func_end sub_814760C

	thumb_func_start sub_8147640
sub_8147640: @ 8147640
	push {lr}
	ldr r0, _08147650 @ =sub_8147654
	bl FuncIsActiveTask
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_08147650: .4byte sub_8147654
	thumb_func_end sub_8147640

	thumb_func_start sub_8147654
sub_8147654: @ 8147654
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _08147678 @ =gTasks+0x8
	adds r4, r0, r1
	movs r1, 0
	ldrsh r0, [r4, r1]
	cmp r0, 0x3
	beq _081476A0
	cmp r0, 0x3
	bgt _0814767C
	cmp r0, 0x2
	beq _08147682
	b _081476D6
	.align 2, 0
_08147678: .4byte gTasks+0x8
_0814767C:
	cmp r0, 0x4
	beq _081476BC
	b _081476D6
_08147682:
	ldr r1, _0814769C @ =gUnknown_846B4AC
	movs r2, 0x2
	ldrsh r0, [r4, r2]
	lsls r0, 4
	adds r1, 0x8
	adds r0, r1
	ldr r1, [r0]
	adds r0, r5, 0
	bl _call_via_r1
	movs r0, 0x3
	strh r0, [r4]
	b _081476D6
	.align 2, 0
_0814769C: .4byte gUnknown_846B4AC
_081476A0:
	ldr r0, _081476B8 @ =gUnknown_846B4AC
	movs r2, 0x2
	ldrsh r1, [r4, r2]
	lsls r1, 4
	adds r0, 0xC
	adds r1, r0
	ldr r1, [r1]
	adds r0, r5, 0
	bl _call_via_r1
	b _081476D6
	.align 2, 0
_081476B8: .4byte gUnknown_846B4AC
_081476BC:
	ldr r0, _081476DC @ =gUnknown_846B4AC
	movs r2, 0x2
	ldrsh r1, [r4, r2]
	lsls r1, 4
	adds r0, 0x4
	adds r1, r0
	ldr r1, [r1]
	adds r0, r5, 0
	bl _call_via_r1
	adds r0, r5, 0
	bl DestroyTask
_081476D6:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_081476DC: .4byte gUnknown_846B4AC
	thumb_func_end sub_8147654

	thumb_func_start sub_81476E0
sub_81476E0: @ 81476E0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r4, r1, 0
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	movs r1, 0x6
	ldrsh r0, [r4, r1]
	lsls r0, 3
	ldr r1, _081477B0 @ =gUnknown_846B42C
	adds r0, r1
	bl LoadCompressedObjectPic
	movs r2, 0x8
	ldrsh r0, [r4, r2]
	lsls r0, 3
	ldr r1, _081477B4 @ =gUnknown_846B43C
	adds r0, r1
	bl LoadSpritePalette
	movs r5, 0
	movs r3, 0x10
	ldrsh r0, [r4, r3]
	cmp r5, r0
	bge _08147748
_08147714:
	movs r0, 0x4
	ldrsh r1, [r4, r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 3
	ldr r1, _081477B8 @ =gUnknown_846B494
	adds r0, r1
	movs r2, 0x12
	ldrsh r1, [r4, r2]
	movs r3, 0x14
	ldrsh r2, [r4, r3]
	ldrb r3, [r4, 0xE]
	bl CreateSprite
	lsls r1, r5, 1
	adds r1, r4
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r1, 0x1A]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	movs r1, 0x10
	ldrsh r0, [r4, r1]
	cmp r5, r0
	blt _08147714
_08147748:
	movs r5, 0
	movs r2, 0x10
	ldrsh r0, [r4, r2]
	cmp r5, r0
	bge _081477A4
	movs r7, 0x3
	movs r3, 0xD
	negs r3, r3
	mov r12, r3
	ldr r6, _081477BC @ =gSprites
_0814775C:
	lsls r0, r5, 1
	adds r0, r4
	movs r1, 0x1A
	ldrsh r0, [r0, r1]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r6
	ldrb r1, [r4, 0xC]
	ands r1, r7
	lsls r1, 2
	ldrb r3, [r2, 0x5]
	mov r0, r12
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, 0x5]
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r0, [r3]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r3]
	ldrh r0, [r4, 0xA]
	strh r0, [r2, 0x30]
	mov r3, r8
	strh r3, [r2, 0x34]
	strh r5, [r2, 0x36]
	ldrh r0, [r4, 0x1A]
	strh r0, [r2, 0x38]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	movs r1, 0x10
	ldrsh r0, [r4, r1]
	cmp r5, r0
	blt _0814775C
_081477A4:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081477B0: .4byte gUnknown_846B42C
_081477B4: .4byte gUnknown_846B43C
_081477B8: .4byte gUnknown_846B494
_081477BC: .4byte gSprites
	thumb_func_end sub_81476E0

	thumb_func_start sub_81477C0
sub_81477C0: @ 81477C0
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	ldr r1, _08147840 @ =gTasks+0x8
	adds r4, r1
	movs r5, 0
	strh r5, [r4, 0x4]
	strh r5, [r4, 0x6]
	strh r5, [r4, 0x8]
	movs r1, 0x3C
	strh r1, [r4, 0xA]
	strh r5, [r4, 0xC]
	strh r5, [r4, 0xE]
	movs r1, 0x3
	strh r1, [r4, 0x10]
	movs r1, 0x78
	strh r1, [r4, 0x12]
	movs r1, 0x58
	strh r1, [r4, 0x14]
	adds r1, r4, 0
	bl sub_81476E0
	movs r0, 0x1C
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r5, _08147844 @ =gSprites
	adds r0, r5
	movs r1, 0x4
	bl StartSpriteAnim
	movs r0, 0x1C
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldr r1, _08147848 @ =0x0000ffe0
	strh r1, [r0, 0x24]
	movs r0, 0x1E
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	movs r1, 0x5
	bl StartSpriteAnim
	movs r0, 0x1E
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	movs r1, 0x20
	strh r1, [r0, 0x24]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08147840: .4byte gTasks+0x8
_08147844: .4byte gSprites
_08147848: .4byte 0x0000ffe0
	thumb_func_end sub_81477C0

	thumb_func_start sub_814784C
sub_814784C: @ 814784C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	movs r5, 0
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _08147860 @ =gTasks+0x8
	adds r4, r1, r0
	b _08147880
	.align 2, 0
_08147860: .4byte gTasks+0x8
_08147864:
	lsls r0, r5, 1
	adds r0, r4
	movs r2, 0x1A
	ldrsh r1, [r0, r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _081478B0 @ =gSprites
	adds r0, r1
	bl DestroySprite
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
_08147880:
	movs r1, 0x10
	ldrsh r0, [r4, r1]
	cmp r5, r0
	blt _08147864
	ldr r1, _081478B4 @ =gUnknown_846B42C
	movs r2, 0x6
	ldrsh r0, [r4, r2]
	lsls r0, 3
	adds r0, r1
	ldrh r0, [r0, 0x6]
	bl FreeSpriteTilesByTag
	ldr r1, _081478B8 @ =gUnknown_846B43C
	movs r2, 0x8
	ldrsh r0, [r4, r2]
	lsls r0, 3
	adds r0, r1
	ldrh r0, [r0, 0x4]
	bl FreeSpritePaletteByTag
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_081478B0: .4byte gSprites
_081478B4: .4byte gUnknown_846B42C
_081478B8: .4byte gUnknown_846B43C
	thumb_func_end sub_814784C

	thumb_func_start sub_81478BC
sub_81478BC: @ 81478BC
	push {r4-r6,lr}
	adds r6, r0, 0
	movs r0, 0x34
	ldrsh r1, [r6, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	ldr r1, _08147900 @ =gTasks+0x8
	adds r5, r0, r1
	movs r1, 0x16
	ldrsh r0, [r5, r1]
	movs r2, 0xA
	ldrsh r1, [r5, r2]
	bl __modsi3
	cmp r0, 0
	bne _081479CE
	ldrh r2, [r5, 0x16]
	movs r3, 0x16
	ldrsh r1, [r5, r3]
	movs r3, 0x14
	ldrsh r0, [r5, r3]
	cmp r1, r0
	beq _081479CE
	strh r2, [r5, 0x14]
	movs r1, 0x32
	ldrsh r0, [r6, r1]
	cmp r0, 0x4
	bhi _081479C8
	lsls r0, 2
	ldr r1, _08147904 @ =_08147908
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08147900: .4byte gTasks+0x8
_08147904: .4byte _08147908
	.align 2, 0
_08147908:
	.4byte _0814791C
	.4byte _0814792A
	.4byte _0814792A
	.4byte _0814793E
	.4byte _08147988
_0814791C:
	adds r2, r6, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
_0814792A:
	movs r0, 0x31
	bl PlaySE
	ldrh r1, [r6, 0x32]
	lsls r1, 24
	lsrs r1, 24
	adds r0, r6, 0
	bl StartSpriteAnim
	b _081479C8
_0814793E:
	movs r0, 0x15
	bl PlaySE
	ldrh r1, [r6, 0x32]
	lsls r1, 24
	lsrs r1, 24
	adds r0, r6, 0
	bl StartSpriteAnim
	ldr r4, _08147984 @ =gSprites
	movs r2, 0x1C
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
	movs r3, 0x1E
	ldrsh r1, [r5, r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	adds r0, 0x3E
	ldrb r1, [r0]
	ands r2, r1
	strb r2, [r0]
	b _081479C8
	.align 2, 0
_08147984: .4byte gSprites
_08147988:
	adds r1, r6, 0
	adds r1, 0x3E
	ldrb r0, [r1]
	movs r2, 0x4
	orrs r0, r2
	strb r0, [r1]
	ldr r3, _081479C4 @ =gSprites
	movs r0, 0x1C
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	adds r0, 0x3E
	ldrb r1, [r0]
	orrs r1, r2
	strb r1, [r0]
	movs r0, 0x1E
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	adds r0, 0x3E
	ldrb r1, [r0]
	orrs r1, r2
	strb r1, [r0]
	movs r0, 0x4
	strh r0, [r5]
	b _081479CE
	.align 2, 0
_081479C4: .4byte gSprites
_081479C8:
	ldrh r0, [r6, 0x32]
	adds r0, 0x1
	strh r0, [r6, 0x32]
_081479CE:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_81478BC

	thumb_func_start sub_81479D4
sub_81479D4: @ 81479D4
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	ldr r5, _08147A28 @ =gTasks+0x8
	adds r6, r4, r5
	movs r0, 0x31
	bl PlaySE
	ldr r2, _08147A2C @ =gSprites
	movs r0, 0x1A
	ldrsh r1, [r6, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r2, 0
	adds r1, 0x1C
	adds r0, r1
	ldr r1, _08147A30 @ =sub_81478BC
	str r1, [r0]
	movs r0, 0x1A
	ldrsh r1, [r6, r0]
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
	subs r5, 0x8
	adds r4, r5
	movs r0, 0x3
	strh r0, [r4, 0x8]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08147A28: .4byte gTasks+0x8
_08147A2C: .4byte gSprites
_08147A30: .4byte sub_81478BC
	thumb_func_end sub_81479D4

	thumb_func_start sub_8147A34
sub_8147A34: @ 8147A34
	push {r4,r5,lr}
	sub sp, 0xC
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _08147A88 @ =gTasks+0x8
	adds r4, r1, r0
	ldr r0, _08147A8C @ =gReceivedRemoteLinkPlayers
	ldrb r0, [r0]
	cmp r0, 0
	beq _08147A98
	ldr r1, _08147A90 @ =gUnknown_3003ED0
	ldrh r0, [r1, 0x2]
	ldr r5, _08147A94 @ =0x00007fff
	cmp r0, r5
	bne _08147A5C
	ldrh r0, [r1, 0x4]
	strh r0, [r4, 0x16]
_08147A5C:
	bl GetMultiplayerId
	lsls r0, 24
	cmp r0, 0
	bne _08147A9E
	ldrh r0, [r4, 0x18]
	adds r0, 0x1
	strh r0, [r4, 0x18]
	mov r0, sp
	movs r1, 0
	movs r2, 0xC
	bl memset
	mov r0, sp
	strh r5, [r0]
	mov r1, sp
	ldrh r0, [r4, 0x18]
	strh r0, [r1, 0x2]
	mov r0, sp
	bl sub_80F9E2C
	b _08147A9E
	.align 2, 0
_08147A88: .4byte gTasks+0x8
_08147A8C: .4byte gReceivedRemoteLinkPlayers
_08147A90: .4byte gUnknown_3003ED0
_08147A94: .4byte 0x00007fff
_08147A98:
	ldrh r0, [r4, 0x16]
	adds r0, 0x1
	strh r0, [r4, 0x16]
_08147A9E:
	add sp, 0xC
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8147A34

	.align 2, 0 @ Don't pad with nop.
