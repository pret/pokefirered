	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_815D334
sub_815D334: @ 815D334
	push {lr}
	movs r0, 0xF9
	bl sub_80722CC
	ldr r0, _0815D35C @ =sub_815D364
	movs r1, 0x8
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0815D360 @ =gUnknown_3005090
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r0, 0x32
	strh r0, [r1, 0x8]
	pop {r0}
	bx r0
	.align 2, 0
_0815D35C: .4byte sub_815D364
_0815D360: .4byte gUnknown_3005090
	thumb_func_end sub_815D334

	thumb_func_start sub_815D364
sub_815D364: @ 815D364
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r4, r1, 3
	ldr r5, _0815D39C @ =gUnknown_3005098
	adds r1, r4, r5
	ldrh r0, [r1]
	subs r0, 0x1
	strh r0, [r1]
	lsls r0, 16
	cmp r0, 0
	bne _0815D394
	ldr r0, _0815D3A0 @ =gUnknown_8479C58
	bl LoadSpriteSheets
	bl sub_815D498
	adds r0, r5, 0
	subs r0, 0x8
	adds r0, r4, r0
	ldr r1, _0815D3A4 @ =sub_815D3A8
	str r1, [r0]
_0815D394:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0815D39C: .4byte gUnknown_3005098
_0815D3A0: .4byte gUnknown_8479C58
_0815D3A4: .4byte sub_815D3A8
	thumb_func_end sub_815D364

	thumb_func_start sub_815D3A8
sub_815D3A8: @ 815D3A8
	push {r4-r7,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r6, r1, 3
	ldr r7, _0815D424 @ =gUnknown_3005098
	adds r5, r6, r7
	ldrh r1, [r5, 0x2]
	adds r1, 0x1
	strh r1, [r5, 0x2]
	ldrh r0, [r5, 0x4]
	adds r0, 0x1
	strh r0, [r5, 0x4]
	lsls r1, 16
	asrs r1, 16
	cmp r1, 0x46
	bne _0815D3D6
	movs r0, 0
	strh r0, [r5, 0x2]
	bl sub_815D5A4
_0815D3D6:
	ldr r0, _0815D428 @ =gSaveBlock1Ptr
	ldr r0, [r0]
	ldrb r1, [r0, 0x5]
	ldrb r2, [r0, 0x4]
	movs r0, 0x1
	mov r3, sp
	bl TryGetFieldObjectIdByLocalIdAndMap
	mov r0, sp
	ldrb r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _0815D42C @ =gUnknown_2036E38
	adds r0, r1
	ldr r2, _0815D430 @ =gUnknown_202063C
	ldrb r1, [r0, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r4, r0, r2
	movs r1, 0x20
	ldrsh r0, [r4, r1]
	movs r2, 0x24
	ldrsh r1, [r4, r2]
	adds r0, r1
	movs r1, 0x78
	negs r1, r1
	cmp r0, r1
	bge _0815D438
	movs r0, 0xF9
	bl sub_80722CC
	adds r0, r7, 0
	subs r0, 0x8
	adds r0, r6, r0
	ldr r1, _0815D434 @ =sub_815D454
	str r1, [r0]
	b _0815D44A
	.align 2, 0
_0815D424: .4byte gUnknown_3005098
_0815D428: .4byte gSaveBlock1Ptr
_0815D42C: .4byte gUnknown_2036E38
_0815D430: .4byte gUnknown_202063C
_0815D434: .4byte sub_815D454
_0815D438:
	movs r1, 0x4
	ldrsh r0, [r5, r1]
	movs r1, 0x5
	bl __divsi3
	lsls r0, 16
	asrs r0, 16
	negs r0, r0
	strh r0, [r4, 0x24]
_0815D44A:
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_815D3A8

	thumb_func_start sub_815D454
sub_815D454: @ 815D454
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	ldr r0, _0815D490 @ =gUnknown_3005098
	adds r1, r0
	ldrh r0, [r1, 0x6]
	adds r0, 0x1
	strh r0, [r1, 0x6]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x28
	bne _0815D48A
	movs r0, 0xFA
	lsls r0, 4
	bl FreeSpriteTilesByTag
	ldr r0, _0815D494 @ =0x00000fa1
	bl FreeSpriteTilesByTag
	adds r0, r4, 0
	bl DestroyTask
	bl EnableBothScriptContexts
_0815D48A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0815D490: .4byte gUnknown_3005098
_0815D494: .4byte 0x00000fa1
	thumb_func_end sub_815D454

	thumb_func_start sub_815D498
sub_815D498: @ 815D498
	push {r4,lr}
	sub sp, 0x4
	ldr r0, _0815D508 @ =gSaveBlock1Ptr
	ldr r0, [r0]
	ldrb r1, [r0, 0x5]
	ldrb r2, [r0, 0x4]
	movs r0, 0x1
	mov r3, sp
	bl TryGetFieldObjectIdByLocalIdAndMap
	mov r0, sp
	ldrb r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _0815D50C @ =gUnknown_2036E38
	adds r0, r1
	ldr r4, _0815D510 @ =gUnknown_202063C
	ldrb r1, [r0, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrh r1, [r0, 0x24]
	ldrh r0, [r0, 0x20]
	adds r1, r0
	adds r1, 0x50
	ldr r0, _0815D514 @ =gUnknown_8479C88
	lsls r1, 16
	asrs r1, 16
	movs r2, 0x6D
	movs r3, 0xFF
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	ldrb r2, [r1, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	movs r2, 0x8
	orrs r0, r2
	movs r2, 0xF
	ands r0, r2
	movs r2, 0xA0
	orrs r0, r2
	strb r0, [r1, 0x5]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0815D508: .4byte gSaveBlock1Ptr
_0815D50C: .4byte gUnknown_2036E38
_0815D510: .4byte gUnknown_202063C
_0815D514: .4byte gUnknown_8479C88
	thumb_func_end sub_815D498

	thumb_func_start sub_815D518
sub_815D518: @ 815D518
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	ldr r0, _0815D598 @ =gSaveBlock1Ptr
	ldr r0, [r0]
	ldrb r1, [r0, 0x5]
	ldrb r2, [r0, 0x4]
	movs r0, 0x1
	mov r3, sp
	bl TryGetFieldObjectIdByLocalIdAndMap
	mov r0, sp
	ldrb r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _0815D59C @ =gUnknown_2036E38
	adds r0, r1
	ldr r2, _0815D5A0 @ =gUnknown_202063C
	ldrb r1, [r0, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r0, 0x24]
	ldrh r0, [r0, 0x20]
	adds r1, r0
	adds r1, 0x50
	strh r1, [r4, 0x20]
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	movs r1, 0x6
	bl __divsi3
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x15
	bgt _0815D56A
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
_0815D56A:
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	movs r1, 0x6
	bl __divsi3
	strh r0, [r4, 0x24]
	movs r1, 0x20
	ldrsh r0, [r4, r1]
	movs r2, 0x24
	ldrsh r1, [r4, r2]
	adds r0, r1
	movs r1, 0x12
	negs r1, r1
	cmp r0, r1
	bge _0815D58E
	adds r0, r4, 0
	bl DestroySprite
_0815D58E:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0815D598: .4byte gSaveBlock1Ptr
_0815D59C: .4byte gUnknown_2036E38
_0815D5A0: .4byte gUnknown_202063C
	thumb_func_end sub_815D518

	thumb_func_start sub_815D5A4
sub_815D5A4: @ 815D5A4
	push {r4,lr}
	sub sp, 0x4
	ldr r0, _0815D614 @ =gSaveBlock1Ptr
	ldr r0, [r0]
	ldrb r1, [r0, 0x5]
	ldrb r2, [r0, 0x4]
	movs r0, 0x1
	mov r3, sp
	bl TryGetFieldObjectIdByLocalIdAndMap
	mov r0, sp
	ldrb r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _0815D618 @ =gUnknown_2036E38
	adds r0, r1
	ldr r4, _0815D61C @ =gUnknown_202063C
	ldrb r0, [r0, 0x4]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	ldrh r0, [r1, 0x24]
	ldrh r1, [r1, 0x20]
	adds r0, r1
	adds r0, 0x31
	lsls r0, 16
	asrs r1, r0, 16
	movs r0, 0x20
	negs r0, r0
	cmp r1, r0
	blt _0815D60C
	ldr r0, _0815D620 @ =gUnknown_8479CC0
	movs r2, 0x4E
	movs r3, 0x8
	bl CreateSprite
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x40
	beq _0815D60C
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrb r2, [r0, 0x5]
	movs r1, 0xF
	ands r1, r2
	movs r2, 0xA0
	orrs r1, r2
	strb r1, [r0, 0x5]
_0815D60C:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0815D614: .4byte gSaveBlock1Ptr
_0815D618: .4byte gUnknown_2036E38
_0815D61C: .4byte gUnknown_202063C
_0815D620: .4byte gUnknown_8479CC0
	thumb_func_end sub_815D5A4

	thumb_func_start sub_815D624
sub_815D624: @ 815D624
	push {lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x2E]
	adds r0, 0x1
	strh r0, [r2, 0x2E]
	movs r1, 0x2E
	ldrsh r0, [r2, r1]
	cmp r0, 0
	bge _0815D638
	adds r0, 0x3
_0815D638:
	asrs r0, 2
	strh r0, [r2, 0x24]
	adds r0, r2, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _0815D650
	adds r0, r2, 0
	bl DestroySprite
_0815D650:
	pop {r0}
	bx r0
	thumb_func_end sub_815D624

	.align 2, 0 @ Don't pad with nop.
