	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_804A76C
sub_804A76C: @ 804A76C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 16
	lsrs r6, r0, 16
	lsls r1, 16
	lsrs r7, r1, 16
	lsls r2, 24
	lsrs r4, r2, 24
	ldr r5, _0804A8A4 @ =gUnknown_825098C
	ldrh r0, [r5, 0x6]
	bl sub_8008804
	lsls r0, 16
	ldr r1, _0804A8A8 @ =0xffff0000
	cmp r0, r1
	bne _0804A79E
	adds r0, r5, 0
	bl sub_800F034
	ldr r0, _0804A8AC @ =gUnknown_8250994
	bl sub_800F078
_0804A79E:
	ldr r0, _0804A8B0 @ =sub_804A8C0
	bl sub_8044EF8
	mov r8, r0
	mov r0, r8
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r5, r0, 4
	add r5, r8
	lsls r5, 2
	ldr r0, _0804A8B4 @ =gUnknown_202063C
	adds r5, r0
	strh r4, [r5, 0x30]
	ldr r0, _0804A8B8 @ =gUnknown_82509F4
	mov r9, r0
	lsls r6, 16
	asrs r0, r6, 16
	mov r10, r0
	ldr r0, _0804A8BC @ =0xfff00000
	adds r6, r0
	asrs r6, 16
	lsls r4, r7, 16
	asrs r7, r4, 16
	adds r4, r0
	asrs r4, 16
	mov r0, r9
	adds r1, r6, 0
	adds r2, r4, 0
	movs r3, 0x2
	bl sub_8006F8C
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r0, _0804A8B4 @ =gUnknown_202063C
	adds r1, r0
	mov r0, r8
	strh r0, [r1, 0x2E]
	ldrh r0, [r5, 0x2E]
	adds r0, 0x1
	strh r0, [r5, 0x2E]
	adds r0, r1, 0
	bl sub_8007824
	mov r0, r9
	mov r1, r10
	adds r2, r4, 0
	movs r3, 0x2
	bl sub_8006F8C
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r0, _0804A8B4 @ =gUnknown_202063C
	adds r4, r0
	mov r0, r8
	strh r0, [r4, 0x2E]
	ldrh r0, [r5, 0x2E]
	adds r0, 0x1
	strh r0, [r5, 0x2E]
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_800838C
	adds r0, r4, 0
	bl sub_8007824
	mov r0, r9
	adds r1, r6, 0
	adds r2, r7, 0
	movs r3, 0x2
	bl sub_8006F8C
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r0, _0804A8B4 @ =gUnknown_202063C
	adds r4, r0
	mov r0, r8
	strh r0, [r4, 0x2E]
	ldrh r0, [r5, 0x2E]
	adds r0, 0x1
	strh r0, [r5, 0x2E]
	adds r0, r4, 0
	movs r1, 0x2
	bl sub_800838C
	adds r0, r4, 0
	bl sub_8007824
	mov r0, r9
	mov r1, r10
	adds r2, r7, 0
	movs r3, 0x2
	bl sub_8006F8C
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r0, _0804A8B4 @ =gUnknown_202063C
	adds r4, r0
	mov r0, r8
	strh r0, [r4, 0x2E]
	ldrh r0, [r5, 0x2E]
	adds r0, 0x1
	strh r0, [r5, 0x2E]
	adds r0, r4, 0
	movs r1, 0x3
	bl sub_800838C
	adds r0, r4, 0
	bl sub_8007824
	mov r0, r8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0804A8A4: .4byte gUnknown_825098C
_0804A8A8: .4byte 0xffff0000
_0804A8AC: .4byte gUnknown_8250994
_0804A8B0: .4byte sub_804A8C0
_0804A8B4: .4byte gUnknown_202063C
_0804A8B8: .4byte gUnknown_82509F4
_0804A8BC: .4byte 0xfff00000
	thumb_func_end sub_804A76C

	thumb_func_start sub_804A8C0
sub_804A8C0: @ 804A8C0
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _0804A8F8
	ldr r0, _0804A8EC @ =gUnknown_825098C
	ldrh r0, [r0, 0x6]
	bl sub_800874C
	ldr r0, _0804A8F0 @ =gUnknown_8250994
	ldrh r0, [r0, 0x4]
	bl sub_8008A30
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _0804A8F4
	adds r0, r4, 0
	bl sub_8007280
	b _0804A8F8
	.align 2, 0
_0804A8EC: .4byte gUnknown_825098C
_0804A8F0: .4byte gUnknown_8250994
_0804A8F4:
	ldr r0, _0804A900 @ =nullsub_8
	str r0, [r4, 0x1C]
_0804A8F8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804A900: .4byte nullsub_8
	thumb_func_end sub_804A8C0

	thumb_func_start sub_804A904
sub_804A904: @ 804A904
	push {lr}
	adds r3, r0, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _0804A92E
	ldr r2, _0804A934 @ =gUnknown_202063C
	movs r0, 0x2E
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r0, 0x2E]
	subs r1, 0x1
	strh r1, [r0, 0x2E]
	adds r0, r3, 0
	bl sub_8007280
_0804A92E:
	pop {r0}
	bx r0
	.align 2, 0
_0804A934: .4byte gUnknown_202063C
	thumb_func_end sub_804A904

	.align 2, 0 @ Don't pad with nop.
