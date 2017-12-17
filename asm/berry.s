	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_809C718
sub_809C718: @ 809C718
	push {r4,r5,lr}
	ldr r2, _0809C778 @ =gUnknown_3005008
	ldr r1, [r2]
	ldr r0, _0809C77C @ =gUnknown_83DF7E8
	ldr r3, _0809C780 @ =0x000030ec
	adds r1, r3
	movs r4, 0x93
	lsls r4, 3
	adds r0, r4
	ldm r0!, {r3-r5}
	stm r1!, {r3-r5}
	ldm r0!, {r3-r5}
	stm r1!, {r3-r5}
	ldr r0, [r0]
	str r0, [r1]
	movs r1, 0
	adds r4, r2, 0
	adds r5, r4, 0
	ldr r3, _0809C784 @ =0x00003108
	movs r2, 0
_0809C740:
	ldr r0, [r5]
	adds r0, r3
	adds r0, r1
	strb r2, [r0]
	adds r1, 0x1
	cmp r1, 0x11
	ble _0809C740
	ldr r0, [r4]
	ldr r5, _0809C788 @ =0x0000311a
	adds r0, r5
	movs r1, 0
	strb r1, [r0]
	ldr r0, [r4]
	ldr r2, _0809C78C @ =0x0000311b
	adds r0, r2
	strb r1, [r0]
	ldr r0, [r4]
	ldr r3, _0809C780 @ =0x000030ec
	adds r0, r3
	bl sub_809C838
	ldr r1, [r4]
	ldr r4, _0809C790 @ =0x0000311c
	adds r1, r4
	str r0, [r1]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809C778: .4byte gUnknown_3005008
_0809C77C: .4byte gUnknown_83DF7E8
_0809C780: .4byte 0x000030ec
_0809C784: .4byte 0x00003108
_0809C788: .4byte 0x0000311a
_0809C78C: .4byte 0x0000311b
_0809C790: .4byte 0x0000311c
	thumb_func_end sub_809C718

	thumb_func_start sub_809C794
sub_809C794: @ 809C794
	push {lr}
	sub sp, 0x4
	mov r1, sp
	movs r0, 0
	strh r0, [r1]
	ldr r0, _0809C7B8 @ =gUnknown_3005008
	ldr r1, [r0]
	ldr r0, _0809C7BC @ =0x000030ec
	adds r1, r0
	ldr r2, _0809C7C0 @ =0x0100001a
	mov r0, sp
	bl CpuSet
	bl sub_809C718
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_0809C7B8: .4byte gUnknown_3005008
_0809C7BC: .4byte 0x000030ec
_0809C7C0: .4byte 0x0100001a
	thumb_func_end sub_809C794

	thumb_func_start sub_809C7C4
sub_809C7C4: @ 809C7C4
	push {r4-r7,lr}
	adds r4, r0, 0
	bl sub_809C794
	adds r5, r4, 0
	ldr r0, _0809C824 @ =gUnknown_3005008
	ldr r2, [r0]
	ldr r0, _0809C828 @ =0x000030ec
	adds r4, r2, r0
	adds r1, r4, 0
	adds r0, r5, 0
	ldm r0!, {r3,r6,r7}
	stm r1!, {r3,r6,r7}
	ldm r0!, {r3,r6,r7}
	stm r1!, {r3,r6,r7}
	ldr r0, [r0]
	str r0, [r1]
	movs r3, 0
	ldr r0, _0809C82C @ =0x00003108
	adds r6, r2, r0
	ldr r1, _0809C830 @ =0x00000516
	adds r2, r5, r1
_0809C7F0:
	adds r0, r6, r3
	adds r1, r2, r3
	ldrb r1, [r1]
	strb r1, [r0]
	adds r3, 0x1
	cmp r3, 0x11
	ble _0809C7F0
	movs r3, 0xA5
	lsls r3, 3
	adds r0, r5, r3
	ldrb r0, [r0]
	adds r1, r4, 0
	adds r1, 0x2E
	strb r0, [r1]
	ldr r6, _0809C834 @ =0x00000529
	adds r0, r5, r6
	ldrb r0, [r0]
	adds r1, 0x1
	strb r0, [r1]
	adds r0, r4, 0
	bl sub_809C838
	str r0, [r4, 0x30]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809C824: .4byte gUnknown_3005008
_0809C828: .4byte 0x000030ec
_0809C82C: .4byte 0x00003108
_0809C830: .4byte 0x00000516
_0809C834: .4byte 0x00000529
	thumb_func_end sub_809C7C4

	thumb_func_start sub_809C838
sub_809C838: @ 809C838
	push {lr}
	adds r3, r0, 0
	movs r2, 0
	movs r1, 0
_0809C840:
	adds r0, r3, r1
	ldrb r0, [r0]
	adds r2, r0
	adds r1, 0x1
	cmp r1, 0x2F
	bls _0809C840
	adds r0, r2, 0
	pop {r1}
	bx r1
	thumb_func_end sub_809C838

	thumb_func_start sub_809C854
sub_809C854: @ 809C854
	push {r4,lr}
	ldr r4, _0809C888 @ =gUnknown_3005008
	ldr r1, [r4]
	movs r2, 0xC4
	lsls r2, 6
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	beq _0809C898
	ldr r2, _0809C88C @ =0x000030f6
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	beq _0809C898
	ldr r2, _0809C890 @ =0x000030ec
	adds r0, r1, r2
	bl sub_809C838
	ldr r1, [r4]
	ldr r2, _0809C894 @ =0x0000311c
	adds r1, r2
	ldr r1, [r1]
	cmp r0, r1
	bne _0809C898
	movs r0, 0x1
	b _0809C89A
	.align 2, 0
_0809C888: .4byte gUnknown_3005008
_0809C88C: .4byte 0x000030f6
_0809C890: .4byte 0x000030ec
_0809C894: .4byte 0x0000311c
_0809C898:
	movs r0, 0
_0809C89A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_809C854

	thumb_func_start sub_809C8A0
sub_809C8A0: @ 809C8A0
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x2B
	bne _0809C8C4
	bl sub_809C854
	cmp r0, 0
	beq _0809C8C4
	ldr r0, _0809C8BC @ =gUnknown_3005008
	ldr r0, [r0]
	ldr r1, _0809C8C0 @ =0x000030ec
	b _0809C8D8
	.align 2, 0
_0809C8BC: .4byte gUnknown_3005008
_0809C8C0: .4byte 0x000030ec
_0809C8C4:
	subs r0, r4, 0x1
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2A
	bls _0809C8D0
	movs r4, 0x1
_0809C8D0:
	lsls r0, r4, 3
	subs r0, r4
	lsls r0, 2
	ldr r1, _0809C8E0 @ =gUnknown_83DF7CC
_0809C8D8:
	adds r0, r1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0809C8E0: .4byte gUnknown_83DF7CC
	thumb_func_end sub_809C8A0

	thumb_func_start ItemIdToBerryType
ItemIdToBerryType: @ 809C8E4
	push {lr}
	lsls r0, 16
	lsrs r1, r0, 16
	ldr r2, _0809C900 @ =0xff7b0000
	adds r0, r2
	lsrs r0, 16
	cmp r0, 0x2A
	bhi _0809C904
	adds r0, r1, 0
	adds r0, 0x7C
	lsls r0, 24
	lsrs r0, 24
	b _0809C906
	.align 2, 0
_0809C900: .4byte 0xff7b0000
_0809C904:
	movs r0, 0x1
_0809C906:
	pop {r1}
	bx r1
	thumb_func_end ItemIdToBerryType

	thumb_func_start BerryTypeToItemId
BerryTypeToItemId: @ 809C90C
	push {lr}
	lsls r0, 16
	lsrs r1, r0, 16
	ldr r2, _0809C928 @ =0xffff0000
	adds r0, r2
	lsrs r0, 16
	cmp r0, 0x2A
	bhi _0809C92C
	adds r0, r1, 0
	adds r0, 0x84
	lsls r0, 16
	lsrs r0, 16
	b _0809C92E
	.align 2, 0
_0809C928: .4byte 0xffff0000
_0809C92C:
	movs r0, 0x85
_0809C92E:
	pop {r1}
	bx r1
	thumb_func_end BerryTypeToItemId

	thumb_func_start GetBerryNameByBerryType
GetBerryNameByBerryType: @ 809C934
	push {r4,lr}
	adds r4, r1, 0
	lsls r0, 24
	lsrs r0, 24
	bl sub_809C8A0
	adds r1, r0, 0
	adds r0, r4, 0
	movs r2, 0x6
	bl memcpy
	movs r0, 0xFF
	strb r0, [r4, 0x6]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end GetBerryNameByBerryType

	.align 2, 0 @ Don't pad with nop.
