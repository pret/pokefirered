	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_815F6E0
sub_815F6E0: @ 815F6E0
	push {r4-r6,lr}
	movs r6, 0x80
	lsls r6, 19
	movs r2, 0
	strh r2, [r6]
	ldr r1, _0815F73C @ =0x04000010
	strh r2, [r1]
	adds r1, 0x2
	strh r2, [r1]
	adds r1, 0x3E
	strh r2, [r1]
	ldr r5, _0815F740 @ =gUnknown_847A890
	lsls r4, r0, 1
	adds r4, r0
	lsls r4, 2
	adds r0, r4, r5
	ldr r0, [r0]
	movs r1, 0xC0
	lsls r1, 19
	bl LZ77UnCompVram
	adds r0, r5, 0x4
	adds r0, r4, r0
	ldr r0, [r0]
	ldr r1, _0815F744 @ =0x0600f800
	bl LZ77UnCompVram
	adds r5, 0x8
	adds r4, r5
	ldr r0, [r4]
	movs r1, 0xA0
	lsls r1, 19
	movs r4, 0x80
	lsls r4, 1
	adds r2, r4, 0
	bl CpuSet
	ldr r1, _0815F748 @ =0x04000008
	movs r2, 0xF8
	lsls r2, 5
	adds r0, r2, 0
	strh r0, [r1]
	strh r4, [r6]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0815F73C: .4byte 0x04000010
_0815F740: .4byte gUnknown_847A890
_0815F744: .4byte 0x0600f800
_0815F748: .4byte 0x04000008
	thumb_func_end sub_815F6E0

	thumb_func_start sub_815F74C
sub_815F74C: @ 815F74C
	push {r4,lr}
	sub sp, 0x4
	ldr r0, _0815F7C4 @ =0x0000ffff
	bl sub_8000B94
	movs r0, 0x1
	bl sub_8000B68
	bl m4aSoundVSyncOff
	movs r0, 0
	bl sub_80006F4
	movs r4, 0
	str r4, [sp]
	ldr r0, _0815F7C8 @ =0x040000d4
	mov r1, sp
	str r1, [r0]
	movs r1, 0xC0
	lsls r1, 19
	str r1, [r0, 0x4]
	ldr r1, _0815F7CC @ =0x85006000
	str r1, [r0, 0x8]
	ldr r1, [r0, 0x8]
	str r4, [sp]
	mov r1, sp
	str r1, [r0]
	movs r1, 0xA0
	lsls r1, 19
	str r1, [r0, 0x4]
	ldr r1, _0815F7D0 @ =0x85000100
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
	bl sub_8006B10
	bl sub_80773BC
	bl sub_8087E64
	ldr r0, _0815F7D4 @ =gUnknown_3005ECC
	strb r4, [r0]
	ldr r0, _0815F7D8 @ =sub_815F7F0
	movs r1, 0
	bl sub_807741C
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0815F7DC @ =gUnknown_3005090
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r4, [r1, 0x8]
	ldr r0, _0815F7E0 @ =sub_815F7E4
	bl sub_8000544
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0815F7C4: .4byte 0x0000ffff
_0815F7C8: .4byte 0x040000d4
_0815F7CC: .4byte 0x85006000
_0815F7D0: .4byte 0x85000100
_0815F7D4: .4byte gUnknown_3005ECC
_0815F7D8: .4byte sub_815F7F0
_0815F7DC: .4byte gUnknown_3005090
_0815F7E0: .4byte sub_815F7E4
	thumb_func_end sub_815F74C

	thumb_func_start sub_815F7E4
sub_815F7E4: @ 815F7E4
	push {lr}
	bl sub_8077578
	pop {r0}
	bx r0
	thumb_func_end sub_815F7E4

	thumb_func_start sub_815F7F0
sub_815F7F0: @ 815F7F0
	push {r4-r6,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r1, _0815F818 @ =gUnknown_3005098
	adds r5, r0, r1
	movs r1, 0
	ldrsh r0, [r5, r1]
	cmp r0, 0xA
	bls _0815F80C
	b _0815F9A6
_0815F80C:
	lsls r0, 2
	ldr r1, _0815F81C @ =_0815F820
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0815F818: .4byte gUnknown_3005098
_0815F81C: .4byte _0815F820
	.align 2, 0
_0815F820:
	.4byte _0815F84C
	.4byte _0815F856
	.4byte _0815F874
	.4byte _0815F9A6
	.4byte _0815F890
	.4byte _0815F8C8
	.4byte _0815F934
	.4byte _0815F96A
	.4byte _0815F96E
	.4byte _0815F98C
	.4byte _0815F996
_0815F84C:
	movs r0, 0x5
	bl sub_815F6E0
	movs r0, 0x1
	b _0815F9A4
_0815F856:
	ldr r0, _0815F870 @ =gUnknown_30030F0
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _0815F864
	b _0815F9A6
_0815F864:
	movs r0, 0
	bl sub_815F6E0
	movs r0, 0x2
	b _0815F9A4
	.align 2, 0
_0815F870: .4byte gUnknown_30030F0
_0815F874:
	ldr r0, _0815F88C @ =gUnknown_30030F0
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _0815F882
	b _0815F9A6
_0815F882:
	movs r0, 0x1
	bl sub_815F6E0
	movs r0, 0x4
	b _0815F9A4
	.align 2, 0
_0815F88C: .4byte gUnknown_30030F0
_0815F890:
	ldr r0, _0815F8B4 @ =gUnknown_3005EF0
	ldr r1, _0815F8B8 @ =gMultiBootProgram_BerryGlitchFix_Start
	str r1, [r0]
	ldr r2, _0815F8BC @ =gUnknown_3005EF8
	ldr r0, _0815F8C0 @ =gMultiBootProgram_BerryGlitchFix_End
	subs r0, r1
	str r0, [r2]
	ldr r0, _0815F8C4 @ =gUnknown_3005F00
	str r1, [r0, 0x28]
	adds r1, r0, 0
	adds r1, 0x4B
	movs r4, 0
	strb r4, [r1]
	bl sub_800BC20
	strh r4, [r5, 0x2]
	movs r0, 0x5
	b _0815F9A4
	.align 2, 0
_0815F8B4: .4byte gUnknown_3005EF0
_0815F8B8: .4byte gMultiBootProgram_BerryGlitchFix_Start
_0815F8BC: .4byte gUnknown_3005EF8
_0815F8C0: .4byte gMultiBootProgram_BerryGlitchFix_End
_0815F8C4: .4byte gUnknown_3005F00
_0815F8C8:
	ldr r0, _0815F910 @ =gUnknown_3005F00
	ldrb r6, [r0, 0x18]
	adds r4, r0, 0
	cmp r6, 0
	bne _0815F920
	ldr r0, [r4, 0x1C]
	ldr r1, _0815F914 @ =0x00020200
	ands r0, r1
	cmp r0, r1
	bne _0815F920
	ldrh r0, [r5, 0x2]
	adds r0, 0x1
	strh r0, [r5, 0x2]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xB4
	ble _0815F924
	movs r0, 0x2
	bl sub_815F6E0
	ldr r0, _0815F918 @ =gUnknown_3005EF0
	ldr r1, [r0]
	adds r1, 0xC0
	ldr r0, _0815F91C @ =gUnknown_3005EF8
	ldr r2, [r0]
	subs r2, 0xC0
	movs r0, 0x1
	str r0, [sp]
	adds r0, r4, 0
	movs r3, 0x4
	bl sub_800C0BC
	strh r6, [r5, 0x2]
	movs r0, 0x6
	b _0815F9A4
	.align 2, 0
_0815F910: .4byte gUnknown_3005F00
_0815F914: .4byte 0x00020200
_0815F918: .4byte gUnknown_3005EF0
_0815F91C: .4byte gUnknown_3005EF8
_0815F920:
	movs r0, 0
	strh r0, [r5, 0x2]
_0815F924:
	adds r0, r4, 0
	bl sub_800BC5C
	ldr r1, _0815F930 @ =gUnknown_3005EF4
	str r0, [r1]
	b _0815F9A6
	.align 2, 0
_0815F930: .4byte gUnknown_3005EF4
_0815F934:
	ldr r4, _0815F954 @ =gUnknown_3005F00
	adds r0, r4, 0
	bl sub_800BC5C
	ldr r1, _0815F958 @ =gUnknown_3005EF4
	str r0, [r1]
	adds r0, r4, 0
	bl sub_800C180
	cmp r0, 0
	beq _0815F95C
	movs r0, 0x3
	bl sub_815F6E0
	movs r0, 0x7
	b _0815F9A4
	.align 2, 0
_0815F954: .4byte gUnknown_3005F00
_0815F958: .4byte gUnknown_3005EF4
_0815F95C:
	ldrb r1, [r4, 0x1E]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	bne _0815F9A6
	movs r0, 0x9
	b _0815F9A4
_0815F96A:
	movs r0, 0x8
	b _0815F9A4
_0815F96E:
	ldr r0, _0815F988 @ =gUnknown_30030F0
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0815F9A6
	adds r0, r2, 0
	bl sub_8077508
	bl sub_80008D8
	b _0815F9A6
	.align 2, 0
_0815F988: .4byte gUnknown_30030F0
_0815F98C:
	movs r0, 0x4
	bl sub_815F6E0
	movs r0, 0xA
	b _0815F9A4
_0815F996:
	ldr r0, _0815F9B0 @ =gUnknown_30030F0
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0815F9A6
	movs r0, 0
_0815F9A4:
	strh r0, [r5]
_0815F9A6:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0815F9B0: .4byte gUnknown_30030F0
	thumb_func_end sub_815F7F0

	.align 2, 0 @ Don't pad with nop.
