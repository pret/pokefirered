	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_813C5D4
sub_813C5D4: @ 813C5D4
	push {lr}
	sub sp, 0x4
	mov r1, sp
	ldr r2, _0813C5F0 @ =0x0000ffff
	adds r0, r2, 0
	strh r0, [r1]
	ldr r1, _0813C5F4 @ =gDecompressionBuffer + 0x3D00
	ldr r2, _0813C5F8 @ =0x010000e0
	mov r0, sp
	bl CpuSet
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_0813C5F0: .4byte 0x0000ffff
_0813C5F4: .4byte gDecompressionBuffer + 0x3D00
_0813C5F8: .4byte 0x010000e0
	thumb_func_end sub_813C5D4

	thumb_func_start sub_813C5FC
sub_813C5FC: @ 813C5FC
	push {lr}
	sub sp, 0x4
	mov r1, sp
	ldr r2, _0813C618 @ =0x0000ffff
	adds r0, r2, 0
	strh r0, [r1]
	ldr r1, _0813C61C @ =gDecompressionBuffer + 0x3400
	ldr r2, _0813C620 @ =0x01000200
	mov r0, sp
	bl CpuSet
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_0813C618: .4byte 0x0000ffff
_0813C61C: .4byte gDecompressionBuffer + 0x3400
_0813C620: .4byte 0x01000200
	thumb_func_end sub_813C5FC

	thumb_func_start sub_813C624
sub_813C624: @ 813C624
	push {lr}
	sub sp, 0x4
	mov r1, sp
	ldr r2, _0813C640 @ =0x0000ffff
	adds r0, r2, 0
	strh r0, [r1]
	ldr r1, _0813C644 @ =gDecompressionBuffer
	ldr r2, _0813C648 @ =0x01001a00
	mov r0, sp
	bl CpuSet
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_0813C640: .4byte 0x0000ffff
_0813C644: .4byte gDecompressionBuffer
_0813C648: .4byte 0x01001a00
	thumb_func_end sub_813C624

	thumb_func_start sub_813C64C
sub_813C64C: @ 813C64C
	push {r4-r7,lr}
	ldr r4, _0813C680 @ =gUnknown_203F190
	adds r3, r4, 0
	ldm r0!, {r5-r7}
	stm r3!, {r5-r7}
	movs r0, 0
	strb r1, [r4, 0xC]
	strb r2, [r4, 0xD]
	strb r0, [r4, 0xE]
	ldrh r0, [r4, 0x4]
	ldrh r1, [r4, 0x6]
	cmp r0, r1
	bcs _0813C668
	strh r0, [r4, 0x6]
_0813C668:
	movs r0, 0
	bl sub_813BDA4
	bl sub_813C624
	bl sub_813C7CC
	bl sub_813C828
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0813C680: .4byte gUnknown_203F190
	thumb_func_end sub_813C64C

	thumb_func_start sub_813C684
sub_813C684: @ 813C684
	ldr r1, _0813C68C @ =gUnknown_203F176
	strb r0, [r1]
	bx lr
	.align 2, 0
_0813C68C: .4byte gUnknown_203F176
	thumb_func_end sub_813C684

	thumb_func_start sub_813C690
sub_813C690: @ 813C690
	push {lr}
	ldr r1, _0813C6A0 @ =gUnknown_203F176
	ldrb r0, [r1]
	cmp r0, 0
	beq _0813C6A4
	subs r0, 0x1
	strb r0, [r1]
	b _0813C752
	.align 2, 0
_0813C6A0: .4byte gUnknown_203F176
_0813C6A4:
	ldr r2, _0813C6C8 @ =gMain
	ldrh r1, [r2, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0813C6D0
	movs r0, 0x5
	bl PlaySE
	ldr r1, _0813C6CC @ =gUnknown_203F190
	ldrb r0, [r1, 0xC]
	ldrb r2, [r1, 0xD]
	adds r0, r2
	ldr r1, [r1]
	lsls r0, 3
	adds r0, r1
	ldr r0, [r0, 0x4]
	b _0813C756
	.align 2, 0
_0813C6C8: .4byte gMain
_0813C6CC: .4byte gUnknown_203F190
_0813C6D0:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0813C6E4
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x2
	negs r0, r0
	b _0813C756
_0813C6E4:
	movs r0, 0xC0
	lsls r0, 2
	ands r0, r1
	cmp r0, 0
	beq _0813C6F4
	movs r0, 0x6
	negs r0, r0
	b _0813C756
_0813C6F4:
	ldrh r1, [r2, 0x30]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _0813C702
	movs r0, 0x1
	b _0813C718
_0813C702:
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0813C70E
	movs r0, 0x1
	b _0813C73A
_0813C70E:
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _0813C730
	movs r0, 0x7
_0813C718:
	movs r1, 0
	bl sub_813C944
	lsls r0, 24
	cmp r0, 0
	bne _0813C72A
	movs r0, 0x5
	bl PlaySE
_0813C72A:
	movs r0, 0x4
	negs r0, r0
	b _0813C756
_0813C730:
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _0813C752
	movs r0, 0x7
_0813C73A:
	movs r1, 0x1
	bl sub_813C944
	lsls r0, 24
	cmp r0, 0
	bne _0813C74C
	movs r0, 0x5
	bl PlaySE
_0813C74C:
	movs r0, 0x5
	negs r0, r0
	b _0813C756
_0813C752:
	movs r0, 0x1
	negs r0, r0
_0813C756:
	pop {r1}
	bx r1
	thumb_func_end sub_813C690

	thumb_func_start sub_813C75C
sub_813C75C: @ 813C75C
	push {r4-r6,lr}
	ldr r5, _0813C784 @ =gUnknown_203F190
	ldrh r1, [r5, 0x4]
	subs r0, r1, 0x7
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r1, 0x7
	bls _0813C7C4
	ldrb r4, [r5, 0xC]
	ldrb r0, [r5, 0xD]
	adds r4, r0
	movs r0, 0
	movs r1, 0
	bl sub_813C004
	cmp r4, 0
	bne _0813C788
	movs r0, 0x1
	b _0813C7A2
	.align 2, 0
_0813C784: .4byte gUnknown_203F190
_0813C788:
	ldrb r0, [r5, 0xC]
	cmp r0, 0
	bne _0813C798
	ldrb r0, [r5, 0xD]
	cmp r0, 0
	beq _0813C798
	movs r0, 0x1
	b _0813C7A2
_0813C798:
	ldr r0, _0813C7AC @ =gUnknown_203F190
	ldrb r0, [r0, 0xC]
	cmp r0, r6
	bne _0813C7B0
	movs r0, 0
_0813C7A2:
	movs r1, 0x1
	bl sub_813C004
	b _0813C7C4
	.align 2, 0
_0813C7AC: .4byte gUnknown_203F190
_0813C7B0:
	cmp r0, 0
	beq _0813C7C4
	movs r0, 0
	movs r1, 0x1
	bl sub_813C004
	movs r0, 0x1
	movs r1, 0x1
	bl sub_813C004
_0813C7C4:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_813C75C

	thumb_func_start sub_813C7CC
sub_813C7CC: @ 813C7CC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	movs r0, 0x2
	movs r1, 0x1
	bl GetFontAttribute
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r3, _0813C824 @ =gUnknown_203F190
	ldrb r5, [r3, 0xC]
	movs r6, 0
	ldrh r0, [r3, 0x6]
	cmp r6, r0
	bge _0813C81A
	adds r4, r3, 0
	movs r7, 0
_0813C7F2:
	ldrb r1, [r4, 0x8]
	adds r1, 0x8
	lsls r1, 24
	lsrs r1, 24
	ldrb r2, [r4, 0x9]
	adds r2, r7
	lsls r2, 24
	lsrs r2, 24
	ldr r3, [r4]
	lsls r0, r5, 3
	adds r0, r3
	ldr r0, [r0]
	bl sub_813C4CC
	adds r5, 0x1
	add r7, r8
	adds r6, 0x1
	ldrh r0, [r4, 0x6]
	cmp r6, r0
	blt _0813C7F2
_0813C81A:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0813C824: .4byte gUnknown_203F190
	thumb_func_end sub_813C7CC

	thumb_func_start sub_813C828
sub_813C828: @ 813C828
	push {r4,lr}
	movs r0, 0x2
	movs r1, 0x1
	bl GetFontAttribute
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _0813C858 @ =gUnknown_203F190
	ldrb r1, [r3, 0x8]
	ldrb r2, [r3, 0xD]
	adds r4, r2, 0
	muls r4, r0
	adds r2, r4, 0
	ldrb r3, [r3, 0x9]
	adds r2, r3
	lsls r2, 24
	lsrs r2, 24
	ldr r0, _0813C85C @ =gFameCheckerText_ListMenuCursor
	bl sub_813C4CC
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813C858: .4byte gUnknown_203F190
_0813C85C: .4byte gFameCheckerText_ListMenuCursor
	thumb_func_end sub_813C828

	thumb_func_start sub_813C860
sub_813C860: @ 813C860
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x2
	movs r1, 0x1
	bl GetFontAttribute
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _0813C894 @ =gUnknown_203F190
	ldrb r1, [r3, 0x8]
	adds r2, r4, 0
	muls r2, r0
	ldrb r3, [r3, 0x9]
	adds r2, r3
	lsls r2, 24
	lsrs r2, 24
	ldr r0, _0813C898 @ =gUnknown_841CB4E
	bl sub_813C4CC
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813C894: .4byte gUnknown_203F190
_0813C898: .4byte gUnknown_841CB4E
	thumb_func_end sub_813C860

	thumb_func_start sub_813C89C
sub_813C89C: @ 813C89C
	push {r4,r5,lr}
	lsls r0, 24
	cmp r0, 0
	bne _0813C8EC
	ldr r0, _0813C8B4 @ =gUnknown_203F190
	ldrh r1, [r0, 0x6]
	adds r5, r0, 0
	cmp r1, 0x1
	bne _0813C8B8
	movs r4, 0
	b _0813C8CA
	.align 2, 0
_0813C8B4: .4byte gUnknown_203F190
_0813C8B8:
	ldrh r0, [r5, 0x6]
	lsrs r2, r0, 1
	movs r1, 0x1
	ands r1, r0
	adds r2, r1
	subs r0, r2
	subs r0, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
_0813C8CA:
	ldrb r1, [r5, 0xC]
	cmp r1, 0
	bne _0813C8DA
	ldrb r0, [r5, 0xD]
	cmp r0, 0
	beq _0813C926
	subs r0, 0x1
	b _0813C93A
_0813C8DA:
	ldrb r0, [r5, 0xD]
	cmp r0, r4
	bls _0813C8E4
	subs r0, 0x1
	b _0813C93A
_0813C8E4:
	subs r0, r1, 0x1
	strb r0, [r5, 0xC]
	movs r0, 0x2
	b _0813C93E
_0813C8EC:
	ldr r0, _0813C8FC @ =gUnknown_203F190
	ldrh r1, [r0, 0x6]
	adds r5, r0, 0
	cmp r1, 0x1
	bne _0813C900
	movs r4, 0
	b _0813C90A
	.align 2, 0
_0813C8FC: .4byte gUnknown_203F190
_0813C900:
	ldrh r0, [r5, 0x6]
	lsrs r2, r0, 1
	movs r1, 0x1
	ands r0, r1
	adds r4, r2, r0
_0813C90A:
	adds r1, r5, 0
	ldrb r2, [r1, 0xC]
	ldrh r0, [r1, 0x4]
	ldrh r3, [r1, 0x6]
	subs r0, r3
	cmp r2, r0
	bne _0813C92A
	ldrb r2, [r1, 0xD]
	subs r0, r3, 0x1
	cmp r2, r0
	bge _0813C926
	adds r0, r2, 0x1
	strb r0, [r1, 0xD]
	b _0813C93C
_0813C926:
	movs r0, 0
	b _0813C93E
_0813C92A:
	ldrb r0, [r1, 0xD]
	cmp r0, r4
	bcc _0813C938
	adds r0, r2, 0x1
	strb r0, [r1, 0xC]
	movs r0, 0x2
	b _0813C93E
_0813C938:
	adds r0, 0x1
_0813C93A:
	strb r0, [r5, 0xD]
_0813C93C:
	movs r0, 0x1
_0813C93E:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_813C89C

	thumb_func_start sub_813C944
sub_813C944: @ 813C944
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r1, 24
	lsrs r6, r1, 24
	ldr r0, _0813C97C @ =gUnknown_203F190
	ldrb r7, [r0, 0xD]
	movs r5, 0
	cmp r5, r2
	bge _0813C96C
	adds r4, r2, 0
_0813C95A:
	adds r0, r6, 0
	bl sub_813C89C
	orrs r5, r0
	lsls r0, r5, 24
	lsrs r5, r0, 24
	subs r4, 0x1
	cmp r4, 0
	bne _0813C95A
_0813C96C:
	cmp r5, 0x1
	beq _0813C980
	cmp r5, 0x1
	ble _0813C978
	cmp r5, 0x3
	ble _0813C990
_0813C978:
	movs r0, 0x1
	b _0813C9D6
	.align 2, 0
_0813C97C: .4byte gUnknown_203F190
_0813C980:
	adds r0, r7, 0
	bl sub_813C860
	bl sub_813C828
	bl sub_813BC5C
	b _0813C9D4
_0813C990:
	bl sub_812BF88
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0813C9B8
	movs r0, 0x2
	bl sub_813C684
	bl sub_813C624
	bl sub_813C7CC
	bl sub_813C828
	bl sub_812BDEC
	bl sub_813C75C
	b _0813C9D0
_0813C9B8:
	movs r0, 0
	bl sub_813BDA4
	bl sub_813C624
	bl sub_813C7CC
	bl sub_813C828
	movs r0, 0x1
	bl sub_813BDA4
_0813C9D0:
	bl sub_813BC5C
_0813C9D4:
	movs r0, 0
_0813C9D6:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_813C944

	.align 2, 0 @ Don't pad with nop.
