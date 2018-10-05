	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start LoadCompressedPalette
LoadCompressedPalette: @ 80703A8
	push {r4-r6,lr}
	adds r4, r1, 0
	adds r5, r2, 0
	lsls r4, 16
	lsrs r4, 16
	lsls r5, 16
	ldr r6, _080703E0 @ =gUnknown_2037ACC
	adds r1, r6, 0
	bl LZDecompressWram
	lsls r4, 1
	ldr r1, _080703E4 @ =gUnknown_20371F8
	adds r1, r4, r1
	lsrs r5, 17
	adds r0, r6, 0
	adds r2, r5, 0
	bl CpuSet
	ldr r0, _080703E8 @ =gUnknown_20375F8
	adds r4, r0
	adds r0, r6, 0
	adds r1, r4, 0
	adds r2, r5, 0
	bl CpuSet
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080703E0: .4byte gUnknown_2037ACC
_080703E4: .4byte gUnknown_20371F8
_080703E8: .4byte gUnknown_20375F8
	thumb_func_end LoadCompressedPalette

	thumb_func_start LoadPalette
LoadPalette: @ 80703EC
	push {r4-r6,lr}
	adds r6, r0, 0
	adds r4, r1, 0
	adds r5, r2, 0
	lsls r4, 16
	lsls r5, 16
	lsrs r4, 15
	ldr r1, _0807041C @ =gUnknown_20371F8
	adds r1, r4, r1
	lsrs r5, 17
	adds r2, r5, 0
	bl CpuSet
	ldr r0, _08070420 @ =gUnknown_20375F8
	adds r4, r0
	adds r0, r6, 0
	adds r1, r4, 0
	adds r2, r5, 0
	bl CpuSet
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807041C: .4byte gUnknown_20371F8
_08070420: .4byte gUnknown_20375F8
	thumb_func_end LoadPalette

	thumb_func_start FillPalette
FillPalette: @ 8070424
	push {r4-r6,lr}
	sub sp, 0x4
	adds r6, r0, 0
	adds r4, r1, 0
	adds r5, r2, 0
	lsls r6, 16
	lsrs r6, 16
	lsls r4, 16
	lsls r5, 16
	mov r0, sp
	strh r6, [r0]
	lsrs r4, 15
	ldr r1, _0807046C @ =gUnknown_20371F8
	adds r1, r4, r1
	lsrs r5, 17
	movs r0, 0x80
	lsls r0, 17
	orrs r5, r0
	mov r0, sp
	adds r2, r5, 0
	bl CpuSet
	mov r0, sp
	adds r0, 0x2
	strh r6, [r0]
	ldr r1, _08070470 @ =gUnknown_20375F8
	adds r4, r1
	adds r1, r4, 0
	adds r2, r5, 0
	bl CpuSet
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807046C: .4byte gUnknown_20371F8
_08070470: .4byte gUnknown_20375F8
	thumb_func_end FillPalette

	thumb_func_start TransferPlttBuffer
TransferPlttBuffer: @ 8070474
	push {r4,r5,lr}
	ldr r4, _080704BC @ =gUnknown_2037AB8
	ldrb r1, [r4, 0x8]
	movs r5, 0x80
	adds r0, r5, 0
	ands r0, r1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0
	bne _080704B6
	ldr r1, _080704C0 @ =gUnknown_20375F8
	movs r2, 0xA0
	lsls r2, 19
	ldr r0, _080704C4 @ =0x040000d4
	str r1, [r0]
	str r2, [r0, 0x4]
	ldr r1, _080704C8 @ =0x80000200
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
	ldr r0, _080704CC @ =gUnknown_2037AC8
	str r3, [r0]
	ldrb r1, [r4, 0x9]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0x2
	bne _080704B6
	ldrb r1, [r4, 0x7]
	adds r0, r5, 0
	ands r0, r1
	cmp r0, 0
	beq _080704B6
	bl UpdateBlendRegisters
_080704B6:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080704BC: .4byte gUnknown_2037AB8
_080704C0: .4byte gUnknown_20375F8
_080704C4: .4byte 0x040000d4
_080704C8: .4byte 0x80000200
_080704CC: .4byte gUnknown_2037AC8
	thumb_func_end TransferPlttBuffer

	thumb_func_start UpdatePaletteFade
UpdatePaletteFade: @ 80704D0
	push {lr}
	ldr r0, _080704E0 @ =gUnknown_2037AC8
	ldr r0, [r0]
	cmp r0, 0
	beq _080704E4
	movs r0, 0xFF
	b _0807051C
	.align 2, 0
_080704E0: .4byte gUnknown_2037AC8
_080704E4:
	ldr r0, _080704F8 @ =gUnknown_2037AB8
	ldrb r0, [r0, 0x9]
	movs r1, 0x3
	ands r1, r0
	cmp r1, 0
	bne _080704FC
	bl UpdateNormalPaletteFade
	b _0807050A
	.align 2, 0
_080704F8: .4byte gUnknown_2037AB8
_080704FC:
	cmp r1, 0x1
	bne _08070506
	bl UpdateFastPaletteFade
	b _0807050A
_08070506:
	bl UpdateHardwarePaletteFade
_0807050A:
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r2, _08070520 @ =gUnknown_2037AC8
	ldr r0, _08070524 @ =gUnknown_2037AB8
	ldr r0, [r0]
	movs r1, 0
	orrs r0, r1
	str r0, [r2]
	adds r0, r3, 0
_0807051C:
	pop {r1}
	bx r1
	.align 2, 0
_08070520: .4byte gUnknown_2037AC8
_08070524: .4byte gUnknown_2037AB8
	thumb_func_end UpdatePaletteFade

	thumb_func_start ResetPaletteFade
ResetPaletteFade: @ 8070528
	push {r4,lr}
	movs r4, 0
_0807052C:
	adds r0, r4, 0
	bl ResetPaletteStruct
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0xF
	bls _0807052C
	bl ResetPaletteFadeControl
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end ResetPaletteFade

	thumb_func_start ReadPlttIntoBuffers
ReadPlttIntoBuffers: @ 8070548
	push {r4-r7,lr}
	movs r0, 0xA0
	lsls r0, 19
	mov r12, r0
	movs r4, 0
	ldr r7, _0807057C @ =gUnknown_20371F8
	ldr r6, _08070580 @ =gUnknown_20375F8
	ldr r5, _08070584 @ =0x000001ff
_08070558:
	lsls r1, r4, 1
	adds r3, r1, r7
	mov r0, r12
	adds r2, r1, r0
	ldrh r0, [r2]
	strh r0, [r3]
	adds r1, r6
	ldrh r0, [r2]
	strh r0, [r1]
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, r5
	bls _08070558
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807057C: .4byte gUnknown_20371F8
_08070580: .4byte gUnknown_20375F8
_08070584: .4byte 0x000001ff
	thumb_func_end ReadPlttIntoBuffers

	thumb_func_start BeginNormalPaletteFade
BeginNormalPaletteFade: @ 8070588
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r4, r0, 0
	ldr r0, [sp, 0x18]
	lsls r1, 24
	lsrs r6, r1, 24
	lsls r2, 24
	lsrs r2, 24
	mov r12, r2
	lsls r3, 24
	lsrs r7, r3, 24
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	ldr r5, _080705B8 @ =gUnknown_2037AB8
	ldrb r1, [r5, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080705BC
	movs r0, 0
	b _080706B4
	.align 2, 0
_080705B8: .4byte gUnknown_2037AB8
_080705BC:
	ldrb r0, [r5, 0xA]
	movs r3, 0x79
	negs r3, r3
	adds r2, r3, 0
	ands r2, r0
	movs r0, 0x10
	orrs r2, r0
	strb r2, [r5, 0xA]
	lsls r0, r6, 24
	asrs r1, r0, 24
	cmp r1, 0
	bge _080705EA
	lsls r0, r2, 25
	lsrs r0, 28
	negs r1, r1
	adds r0, r1
	movs r1, 0xF
	ands r0, r1
	lsls r0, 3
	ands r2, r3
	orrs r2, r0
	strb r2, [r5, 0xA]
	movs r6, 0
_080705EA:
	str r4, [r5]
	movs r4, 0x3F
	adds r1, r6, 0
	ands r1, r4
	ldrb r2, [r5, 0x4]
	movs r3, 0x40
	negs r3, r3
	adds r0, r3, 0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, 0x4]
	ands r6, r4
	ldrb r0, [r5, 0x8]
	ands r3, r0
	orrs r3, r6
	strb r3, [r5, 0x8]
	movs r0, 0x1F
	mov r1, r12
	ands r1, r0
	lsls r1, 6
	ldrh r2, [r5, 0x4]
	ldr r0, _08070658 @ =0xfffff83f
	ands r0, r2
	orrs r0, r1
	strh r0, [r5, 0x4]
	lsls r2, r7, 3
	ldrb r1, [r5, 0x5]
	movs r0, 0x7
	ands r0, r1
	orrs r0, r2
	strb r0, [r5, 0x5]
	ldr r1, _0807065C @ =0x00007fff
	mov r0, r8
	ands r1, r0
	ldrh r2, [r5, 0x6]
	ldr r0, _08070660 @ =0xffff8000
	ands r0, r2
	orrs r0, r1
	strh r0, [r5, 0x6]
	ldrb r0, [r5, 0x7]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r5, 0x7]
	ldrb r1, [r5, 0x9]
	movs r0, 0x4
	negs r0, r0
	ands r0, r1
	strb r0, [r5, 0x9]
	cmp r12, r7
	bcs _08070664
	movs r0, 0x41
	negs r0, r0
	ands r3, r0
	b _08070668
	.align 2, 0
_08070658: .4byte 0xfffff83f
_0807065C: .4byte 0x00007fff
_08070660: .4byte 0xffff8000
_08070664:
	movs r0, 0x40
	orrs r3, r0
_08070668:
	strb r3, [r5, 0x8]
	bl UpdatePaletteFade
	ldr r4, _080706C0 @ =gUnknown_2037AB8
	ldrb r1, [r4, 0x8]
	lsrs r5, r1, 7
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r4, 0x8]
	ldr r0, _080706C4 @ =gUnknown_20375F8
	movs r1, 0xA0
	lsls r1, 19
	ldr r2, _080706C8 @ =0x04000100
	bl CpuSet
	ldr r1, _080706CC @ =gUnknown_2037AC8
	movs r0, 0
	str r0, [r1]
	ldrb r1, [r4, 0x9]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0x2
	bne _080706A4
	ldrb r1, [r4, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080706A4
	bl UpdateBlendRegisters
_080706A4:
	ldr r2, _080706C0 @ =gUnknown_2037AB8
	lsls r3, r5, 7
	ldrb r1, [r2, 0x8]
	movs r0, 0x7F
	ands r0, r1
	orrs r0, r3
	strb r0, [r2, 0x8]
	movs r0, 0x1
_080706B4:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080706C0: .4byte gUnknown_2037AB8
_080706C4: .4byte gUnknown_20375F8
_080706C8: .4byte 0x04000100
_080706CC: .4byte gUnknown_2037AC8
	thumb_func_end BeginNormalPaletteFade

	thumb_func_start unref_sub_80A1C1C
unref_sub_80A1C1C: @ 80706D0
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0x8
	mov r8, r0
	adds r4, r1, 0
	adds r6, r2, 0
	ldr r5, [sp, 0x1C]
	lsls r4, 24
	lsrs r4, 24
	lsls r6, 24
	lsrs r6, 24
	lsls r3, 24
	lsrs r3, 24
	lsls r5, 16
	lsrs r5, 16
	str r3, [sp, 0x4]
	bl ReadPlttIntoBuffers
	lsls r4, 24
	asrs r4, 24
	str r5, [sp]
	mov r0, r8
	adds r1, r4, 0
	adds r2, r6, 0
	ldr r3, [sp, 0x4]
	bl BeginNormalPaletteFade
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end unref_sub_80A1C1C

	thumb_func_start unref_sub_80A1C64
unref_sub_80A1C64: @ 8070718
	push {r4-r7,lr}
	adds r6, r1, 0
	lsls r0, 24
	lsrs r7, r0, 24
	movs r5, 0
_08070722:
	lsls r0, r5, 1
	adds r0, r5
	lsls r0, 2
	ldr r1, _08070770 @ =gUnknown_20379F8
	adds r4, r0, r1
	ldrb r0, [r4, 0x4]
	lsls r0, 31
	cmp r0, 0
	beq _08070780
	ldr r2, [r4]
	ldrb r0, [r2, 0x8]
	lsls r0, 31
	lsrs r0, 31
	cmp r0, r7
	bne _08070780
	ldrh r1, [r4, 0x6]
	lsls r1, 20
	lsrs r1, 25
	ldrb r0, [r2, 0xB]
	lsls r0, 27
	lsrs r0, 27
	cmp r1, r0
	bne _0807075E
	adds r0, r4, 0
	bl unused_sub_80A1F00
	ldrb r0, [r4, 0x4]
	lsls r0, 31
	cmp r0, 0
	beq _08070780
_0807075E:
	ldrb r0, [r4, 0x8]
	cmp r0, 0
	bne _08070774
	adds r0, r4, 0
	adds r1, r6, 0
	bl unused_sub_80A1CDC
	b _08070778
	.align 2, 0
_08070770: .4byte gUnknown_20379F8
_08070774:
	subs r0, 0x1
	strb r0, [r4, 0x8]
_08070778:
	adds r0, r4, 0
	adds r1, r6, 0
	bl unused_sub_80A1E40
_08070780:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0xF
	bls _08070722
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end unref_sub_80A1C64

	thumb_func_start unused_sub_80A1CDC
unused_sub_80A1CDC: @ 8070790
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r4, r0, 0
	mov r8, r1
	movs r6, 0
	ldrh r1, [r4, 0x6]
	lsls r1, 20
	lsrs r1, 25
	ldr r3, [r4]
	ldrb r0, [r3, 0x9]
	lsls r2, r0, 25
	lsrs r0, r2, 27
	adds r5, r1, 0
	muls r5, r0
	ldrb r1, [r3, 0x8]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _0807082C
	lsrs r0, r2, 27
	cmp r6, r0
	bcs _08070878
	ldr r0, _0807081C @ =gUnknown_20371F8
	mov r12, r0
	ldr r7, _08070820 @ =gUnknown_20375F8
_080707C4:
	ldr r0, [r4, 0x4]
	lsls r0, 11
	lsrs r0, 22
	lsls r0, 1
	add r0, r12
	ldr r1, [r3, 0x4]
	lsls r2, r5, 1
	adds r1, r2, r1
	ldrh r1, [r1]
	strh r1, [r0]
	ldr r0, [r4, 0x4]
	lsls r0, 11
	lsrs r0, 22
	lsls r0, 1
	adds r0, r7
	ldr r1, [r4]
	ldr r1, [r1, 0x4]
	adds r2, r1
	ldrh r1, [r2]
	strh r1, [r0]
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r2, [r4, 0x4]
	lsls r1, r2, 11
	lsrs r1, 22
	adds r1, 0x1
	ldr r0, _08070824 @ =0x000003ff
	ands r1, r0
	lsls r1, 11
	ldr r0, _08070828 @ =0xffe007ff
	ands r0, r2
	orrs r0, r1
	str r0, [r4, 0x4]
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	ldr r3, [r4]
	ldrb r0, [r3, 0x9]
	lsls r0, 25
	lsrs r0, 27
	cmp r6, r0
	bcc _080707C4
	b _08070878
	.align 2, 0
_0807081C: .4byte gUnknown_20371F8
_08070820: .4byte gUnknown_20375F8
_08070824: .4byte 0x000003ff
_08070828: .4byte 0xffe007ff
_0807082C:
	lsrs r0, r2, 27
	cmp r6, r0
	bcs _08070878
	ldr r3, _080708E4 @ =gUnknown_20375F8
_08070834:
	ldr r1, [r4, 0x4]
	lsls r1, 11
	lsrs r1, 22
	lsls r1, 1
	adds r1, r3
	ldr r0, [r4]
	ldr r2, [r0, 0x4]
	lsls r0, r5, 1
	adds r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r2, [r4, 0x4]
	lsls r1, r2, 11
	lsrs r1, 22
	adds r1, 0x1
	ldr r0, _080708E8 @ =0x000003ff
	ands r1, r0
	lsls r1, 11
	ldr r0, _080708EC @ =0xffe007ff
	ands r0, r2
	orrs r0, r1
	str r0, [r4, 0x4]
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	ldr r0, [r4]
	ldrb r0, [r0, 0x9]
	lsls r0, 25
	lsrs r0, 27
	cmp r6, r0
	bcc _08070834
_08070878:
	ldrh r0, [r4, 0x4]
	lsls r0, 21
	lsrs r0, 23
	lsls r0, 11
	ldr r1, [r4, 0x4]
	ldr r2, _080708EC @ =0xffe007ff
	ands r1, r2
	orrs r1, r0
	str r1, [r4, 0x4]
	ldr r3, [r4]
	ldrb r0, [r3, 0xA]
	strb r0, [r4, 0x8]
	ldrh r2, [r4, 0x6]
	lsls r0, r2, 20
	lsrs r0, 25
	adds r0, 0x1
	movs r1, 0x7F
	ands r0, r1
	lsls r0, 5
	ldr r5, _080708F0 @ =0xfffff01f
	adds r1, r5, 0
	ands r1, r2
	orrs r1, r0
	strh r1, [r4, 0x6]
	lsls r1, 20
	lsrs r1, 25
	ldrb r0, [r3, 0xB]
	lsls r0, 27
	lsrs r0, 27
	cmp r1, r0
	blt _080708C8
	ldrb r0, [r4, 0x9]
	cmp r0, 0
	beq _080708C0
	subs r0, 0x1
	strb r0, [r4, 0x9]
_080708C0:
	ldrh r1, [r4, 0x6]
	adds r0, r5, 0
	ands r0, r1
	strh r0, [r4, 0x6]
_080708C8:
	ldrh r0, [r4, 0x4]
	lsls r0, 21
	lsrs r0, 27
	movs r1, 0x1
	lsls r1, r0
	mov r2, r8
	ldr r0, [r2]
	orrs r0, r1
	str r0, [r2]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080708E4: .4byte gUnknown_20375F8
_080708E8: .4byte 0x000003ff
_080708EC: .4byte 0xffe007ff
_080708F0: .4byte 0xfffff01f
	thumb_func_end unused_sub_80A1CDC

	thumb_func_start unused_sub_80A1E40
unused_sub_80A1E40: @ 80708F4
	push {r4-r6,lr}
	adds r4, r0, 0
	ldr r3, _0807094C @ =gUnknown_2037AB8
	ldrb r1, [r3, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080709A8
	ldrh r0, [r4, 0x4]
	lsls r0, 21
	lsrs r6, r0, 23
	asrs r1, r6, 4
	movs r5, 0x1
	adds r0, r5, 0
	lsls r0, r1
	ldr r1, [r3]
	ands r0, r1
	cmp r0, 0
	beq _080709A8
	ldr r2, [r4]
	ldrb r1, [r2, 0x8]
	adds r0, r5, 0
	ands r0, r1
	cmp r0, 0
	bne _08070950
	ldrb r1, [r3, 0x4]
	lsls r1, 26
	ldrb r0, [r3, 0x8]
	lsls r0, 26
	cmp r1, r0
	beq _080709A8
	adds r0, r6, 0
	ldrb r1, [r2, 0x9]
	lsls r1, 25
	lsrs r1, 27
	ldrh r2, [r3, 0x4]
	lsls r2, 21
	lsrs r2, 27
	ldrh r3, [r3, 0x6]
	lsls r3, 17
	lsrs r3, 17
	bl BlendPalette
	b _080709A8
	.align 2, 0
_0807094C: .4byte gUnknown_2037AB8
_08070950:
	ldrb r1, [r3, 0x4]
	movs r0, 0x3F
	ands r0, r1
	cmp r0, 0
	bne _080709A8
	ldrb r0, [r4, 0x8]
	ldrb r1, [r2, 0xA]
	cmp r0, r1
	beq _080709A8
	ldrh r0, [r4, 0x6]
	lsls r0, 20
	lsrs r0, 25
	ldrb r1, [r2, 0x9]
	lsls r1, 25
	lsrs r2, r1, 27
	adds r5, r0, 0
	muls r5, r2
	movs r3, 0
	adds r1, r2, 0
	cmp r3, r1
	bcs _080709A8
	ldr r6, _080709B0 @ =gUnknown_20375F8
_0807097C:
	ldrh r1, [r4, 0x4]
	lsls r1, 21
	lsrs r1, 23
	adds r1, r3
	lsls r1, 1
	adds r1, r6
	ldr r2, [r4]
	adds r0, r5, r3
	ldr r2, [r2, 0x4]
	lsls r0, 1
	adds r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r0, [r4]
	ldrb r0, [r0, 0x9]
	lsls r0, 25
	lsrs r0, 27
	cmp r3, r0
	bcc _0807097C
_080709A8:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080709B0: .4byte gUnknown_20375F8
	thumb_func_end unused_sub_80A1E40

	thumb_func_start unused_sub_80A1F00
unused_sub_80A1F00: @ 80709B4
	push {lr}
	adds r3, r0, 0
	ldrb r0, [r3, 0x9]
	cmp r0, 0
	bne _08070A04
	ldr r2, [r3]
	ldrb r0, [r2, 0xB]
	lsrs r0, 5
	cmp r0, 0
	bne _080709F4
	ldrh r1, [r3, 0x6]
	ldr r0, _080709EC @ =0xfffff01f
	ands r0, r1
	strh r0, [r3, 0x6]
	ldrb r0, [r2, 0xA]
	strb r0, [r3, 0x8]
	ldrb r0, [r2, 0xC]
	strb r0, [r3, 0x9]
	ldrh r0, [r3, 0x4]
	lsls r0, 21
	lsrs r0, 23
	lsls r0, 11
	ldr r1, [r3, 0x4]
	ldr r2, _080709F0 @ =0xffe007ff
	ands r1, r2
	orrs r1, r0
	str r1, [r3, 0x4]
	b _08070A08
	.align 2, 0
_080709EC: .4byte 0xfffff01f
_080709F0: .4byte 0xffe007ff
_080709F4:
	cmp r0, 0
	blt _08070A08
	cmp r0, 0x2
	bgt _08070A08
	ldrh r0, [r2]
	bl ResetPaletteStructByUid
	b _08070A08
_08070A04:
	subs r0, 0x1
	strb r0, [r3, 0x9]
_08070A08:
	pop {r0}
	bx r0
	thumb_func_end unused_sub_80A1F00

	thumb_func_start ResetPaletteStructByUid
ResetPaletteStructByUid: @ 8070A0C
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	bl GetPaletteNumByUid
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x10
	beq _08070A22
	bl ResetPaletteStruct
_08070A22:
	pop {r0}
	bx r0
	thumb_func_end ResetPaletteStructByUid

	thumb_func_start ResetPaletteStruct
ResetPaletteStruct: @ 8070A28
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08070A70 @ =gUnknown_20379F8
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldr r0, _08070A74 @ =gUnknown_83AC960
	str r0, [r1]
	ldrb r2, [r1, 0x4]
	movs r0, 0x2
	negs r0, r0
	ands r0, r2
	strb r0, [r1, 0x4]
	ldrh r2, [r1, 0x4]
	ldr r0, _08070A78 @ =0xfffff803
	ands r0, r2
	strh r0, [r1, 0x4]
	ldr r0, [r1, 0x4]
	ldr r2, _08070A7C @ =0xffe007ff
	ands r0, r2
	str r0, [r1, 0x4]
	ldrh r2, [r1, 0x6]
	ldr r0, _08070A80 @ =0xfffff01f
	ands r0, r2
	strh r0, [r1, 0x6]
	ldrb r2, [r1, 0x4]
	movs r0, 0x3
	negs r0, r0
	ands r0, r2
	strb r0, [r1, 0x4]
	movs r0, 0
	strb r0, [r1, 0x8]
	strb r0, [r1, 0x9]
	bx lr
	.align 2, 0
_08070A70: .4byte gUnknown_20379F8
_08070A74: .4byte gUnknown_83AC960
_08070A78: .4byte 0xfffff803
_08070A7C: .4byte 0xffe007ff
_08070A80: .4byte 0xfffff01f
	thumb_func_end ResetPaletteStruct

	thumb_func_start ResetPaletteFadeControl
ResetPaletteFadeControl: @ 8070A84
	ldr r2, _08070AEC @ =gUnknown_2037AB8
	movs r0, 0
	str r0, [r2]
	subs r0, 0x40
	ldrb r1, [r2, 0x4]
	ands r0, r1
	strb r0, [r2, 0x4]
	ldrh r1, [r2, 0x4]
	ldr r0, _08070AF0 @ =0xfffff83f
	ands r0, r1
	strh r0, [r2, 0x4]
	ldrb r1, [r2, 0x5]
	movs r0, 0x7
	ands r0, r1
	strb r0, [r2, 0x5]
	ldrh r1, [r2, 0x6]
	ldr r0, _08070AF4 @ =0xffff8000
	ands r0, r1
	strh r0, [r2, 0x6]
	ldrb r1, [r2, 0x7]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r2, 0x7]
	movs r0, 0
	strb r0, [r2, 0x8]
	ldrb r1, [r2, 0x9]
	movs r3, 0x5
	negs r3, r3
	adds r0, r3, 0
	ands r0, r1
	movs r1, 0x9
	negs r1, r1
	ands r0, r1
	strb r0, [r2, 0x9]
	ldrb r1, [r2, 0xA]
	movs r0, 0x3
	negs r0, r0
	ands r0, r1
	strb r0, [r2, 0xA]
	ldr r0, [r2, 0x8]
	ldr r1, _08070AF8 @ =0xfffe0fff
	ands r0, r1
	str r0, [r2, 0x8]
	ldrb r0, [r2, 0xA]
	ands r3, r0
	movs r0, 0x79
	negs r0, r0
	ands r3, r0
	movs r0, 0x10
	orrs r3, r0
	strb r3, [r2, 0xA]
	bx lr
	.align 2, 0
_08070AEC: .4byte gUnknown_2037AB8
_08070AF0: .4byte 0xfffff83f
_08070AF4: .4byte 0xffff8000
_08070AF8: .4byte 0xfffe0fff
	thumb_func_end ResetPaletteFadeControl

	thumb_func_start unref_sub_80A2048
unref_sub_80A2048: @ 8070AFC
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	bl GetPaletteNumByUid
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x10
	beq _08070B20
	ldr r1, _08070B24 @ =gUnknown_20379F8
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0, 0x4]
	movs r2, 0x2
	orrs r1, r2
	strb r1, [r0, 0x4]
_08070B20:
	pop {r0}
	bx r0
	.align 2, 0
_08070B24: .4byte gUnknown_20379F8
	thumb_func_end unref_sub_80A2048

	thumb_func_start unref_sub_80A2074
unref_sub_80A2074: @ 8070B28
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	bl GetPaletteNumByUid
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x10
	beq _08070B4E
	ldr r0, _08070B54 @ =gUnknown_20379F8
	lsls r1, r2, 1
	adds r1, r2
	lsls r1, 2
	adds r1, r0
	ldrb r2, [r1, 0x4]
	movs r0, 0x3
	negs r0, r0
	ands r0, r2
	strb r0, [r1, 0x4]
_08070B4E:
	pop {r0}
	bx r0
	.align 2, 0
_08070B54: .4byte gUnknown_20379F8
	thumb_func_end unref_sub_80A2074

	thumb_func_start GetPaletteNumByUid
GetPaletteNumByUid: @ 8070B58
	push {lr}
	lsls r0, 16
	lsrs r2, r0, 16
	movs r1, 0
	ldr r3, _08070B78 @ =gUnknown_20379F8
_08070B62:
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldr r0, [r0]
	ldrh r0, [r0]
	cmp r0, r2
	bne _08070B7C
	adds r0, r1, 0
	b _08070B88
	.align 2, 0
_08070B78: .4byte gUnknown_20379F8
_08070B7C:
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0xF
	bls _08070B62
	movs r0, 0x10
_08070B88:
	pop {r1}
	bx r1
	thumb_func_end GetPaletteNumByUid

	thumb_func_start UpdateNormalPaletteFade
UpdateNormalPaletteFade: @ 8070B8C
	push {r4-r7,lr}
	ldr r4, _08070BA0 @ =gUnknown_2037AB8
	ldrb r1, [r4, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08070BA4
	movs r0, 0
	b _08070CC0
	.align 2, 0
_08070BA0: .4byte gUnknown_2037AB8
_08070BA4:
	bl IsSoftwarePaletteFadeFinishing
	lsls r0, 24
	cmp r0, 0
	beq _08070BB2
	ldrb r0, [r4, 0x7]
	b _08070CBE
_08070BB2:
	ldrb r1, [r4, 0xA]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	bne _08070BE6
	ldrb r2, [r4, 0x4]
	lsls r1, r2, 26
	ldrb r0, [r4, 0x8]
	lsls r0, 26
	cmp r1, r0
	bcs _08070BDE
	lsrs r0, r1, 26
	adds r0, 0x1
	movs r1, 0x3F
	ands r0, r1
	movs r1, 0x40
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r4, 0x4]
	movs r0, 0x2
	b _08070CC0
_08070BDE:
	movs r0, 0x40
	negs r0, r0
	ands r0, r2
	strb r0, [r4, 0x4]
_08070BE6:
	movs r5, 0
	ldr r2, _08070BFC @ =gUnknown_2037AB8
	ldrb r1, [r2, 0xA]
	movs r0, 0x4
	ands r0, r1
	adds r7, r2, 0
	cmp r0, 0
	bne _08070C00
	ldrh r4, [r7]
	b _08070C06
	.align 2, 0
_08070BFC: .4byte gUnknown_2037AB8
_08070C00:
	ldrh r4, [r7, 0x2]
	movs r5, 0x80
	lsls r5, 1
_08070C06:
	cmp r4, 0
	beq _08070C38
	ldr r7, _08070C74 @ =gUnknown_2037AB8
	adds r6, r7, 0
_08070C0E:
	movs r0, 0x1
	ands r0, r4
	cmp r0, 0
	beq _08070C2A
	ldrh r2, [r6, 0x4]
	lsls r2, 21
	lsrs r2, 27
	ldrh r3, [r6, 0x6]
	lsls r3, 17
	lsrs r3, 17
	adds r0, r5, 0
	movs r1, 0x10
	bl BlendPalette
_08070C2A:
	lsrs r4, 1
	adds r0, r5, 0
	adds r0, 0x10
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r4, 0
	bne _08070C0E
_08070C38:
	ldrb r2, [r7, 0xA]
	lsls r0, r2, 29
	lsrs r0, 31
	movs r1, 0x1
	eors r1, r0
	lsls r1, 2
	movs r4, 0x5
	negs r4, r4
	ands r4, r2
	orrs r4, r1
	strb r4, [r7, 0xA]
	movs r0, 0x4
	ands r0, r4
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0
	bne _08070CBC
	ldrh r6, [r7, 0x4]
	lsls r2, r6, 21
	ldrb r0, [r7, 0x5]
	lsls r5, r0, 24
	lsrs r1, r2, 27
	lsrs r0, r5, 27
	cmp r1, r0
	bne _08070C78
	str r3, [r7]
	movs r0, 0x2
	orrs r4, r0
	strb r4, [r7, 0xA]
	b _08070CBC
	.align 2, 0
_08070C74: .4byte gUnknown_2037AB8
_08070C78:
	ldrb r1, [r7, 0x8]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	bne _08070C94
	lsrs r3, r2, 27
	lsls r0, r4, 25
	lsrs r0, 28
	adds r3, r0, r3
	lsrs r0, r5, 27
	cmp r3, r0
	ble _08070CAA
	adds r3, r0, 0
	b _08070CAA
_08070C94:
	lsrs r3, r2, 27
	lsls r0, r4, 25
	lsrs r0, 28
	subs r0, r3, r0
	lsls r0, 24
	lsrs r3, r0, 24
	asrs r0, 24
	lsrs r1, r5, 27
	cmp r0, r1
	bge _08070CAA
	adds r3, r1, 0
_08070CAA:
	lsls r0, r3, 24
	asrs r0, 24
	movs r1, 0x1F
	ands r0, r1
	lsls r0, 6
	ldr r1, _08070CC8 @ =0xfffff83f
	ands r1, r6
	orrs r1, r0
	strh r1, [r7, 0x4]
_08070CBC:
	ldrb r0, [r7, 0x7]
_08070CBE:
	lsrs r0, 7
_08070CC0:
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08070CC8: .4byte 0xfffff83f
	thumb_func_end UpdateNormalPaletteFade

	thumb_func_start InvertPlttBuffer
InvertPlttBuffer: @ 8070CCC
	push {r4-r7,lr}
	adds r1, r0, 0
	movs r3, 0
	cmp r1, 0
	beq _08070D0A
	ldr r7, _08070D10 @ =gUnknown_20375F8
_08070CD8:
	movs r0, 0x1
	ands r0, r1
	lsrs r4, r1, 1
	adds r5, r3, 0
	adds r5, 0x10
	cmp r0, 0
	beq _08070D00
	movs r2, 0
	adds r6, r7, 0
_08070CEA:
	adds r0, r3, r2
	lsls r0, 1
	adds r0, r6
	ldrh r1, [r0]
	mvns r1, r1
	strh r1, [r0]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0xF
	bls _08070CEA
_08070D00:
	adds r1, r4, 0
	lsls r0, r5, 16
	lsrs r3, r0, 16
	cmp r1, 0
	bne _08070CD8
_08070D0A:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08070D10: .4byte gUnknown_20375F8
	thumb_func_end InvertPlttBuffer

	thumb_func_start TintPlttBuffer
TintPlttBuffer: @ 8070D14
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x10
	adds r4, r0, 0
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r2, 24
	str r2, [sp]
	lsls r3, 24
	lsrs r3, 24
	str r3, [sp, 0x4]
	movs r0, 0
	mov r9, r0
	cmp r4, 0
	beq _08070DD0
	lsls r1, 24
	str r1, [sp, 0x8]
_08070D3E:
	movs r0, 0x1
	ands r0, r4
	lsrs r4, 1
	str r4, [sp, 0xC]
	movs r1, 0x10
	add r1, r9
	mov r10, r1
	cmp r0, 0
	beq _08070DC2
	movs r4, 0
	ldr r2, _08070DE0 @ =gUnknown_20375F8
	mov r8, r2
	ldr r1, [sp]
	lsls r0, r1, 24
	ldr r2, [sp, 0x4]
	lsls r1, r2, 24
	ldr r2, [sp, 0x8]
	asrs r2, 24
	mov r12, r2
	movs r5, 0x1F
	asrs r7, r0, 24
	asrs r6, r1, 24
_08070D6A:
	mov r0, r9
	adds r2, r0, r4
	lsls r2, 1
	add r2, r8
	ldr r1, [r2]
	lsls r1, 27
	lsrs r1, 27
	add r1, r12
	ands r1, r5
	ldrb r3, [r2]
	movs r0, 0x20
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
	ldr r1, [r2]
	lsls r1, 22
	lsrs r1, 27
	adds r1, r7
	movs r0, 0x1F
	ands r1, r0
	lsls r1, 5
	ldrh r3, [r2]
	ldr r0, _08070DE4 @ =0xfffffc1f
	ands r0, r3
	orrs r0, r1
	strh r0, [r2]
	ldr r1, [r2]
	lsls r1, 17
	lsrs r1, 27
	adds r1, r6
	ands r1, r5
	lsls r1, 2
	ldrb r3, [r2, 0x1]
	movs r0, 0x7D
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, 0x1]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0xF
	bls _08070D6A
_08070DC2:
	ldr r4, [sp, 0xC]
	mov r1, r10
	lsls r0, r1, 16
	lsrs r0, 16
	mov r9, r0
	cmp r4, 0
	bne _08070D3E
_08070DD0:
	add sp, 0x10
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08070DE0: .4byte gUnknown_20375F8
_08070DE4: .4byte 0xfffffc1f
	thumb_func_end TintPlttBuffer

	thumb_func_start UnfadePlttBuffer
UnfadePlttBuffer: @ 8070DE8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r1, r0, 0
	movs r3, 0
	cmp r1, 0
	beq _08070E32
	ldr r0, _08070E3C @ =gUnknown_20375F8
	mov r8, r0
	ldr r0, _08070E40 @ =gUnknown_20371F8
	mov r12, r0
_08070DFE:
	movs r0, 0x1
	ands r0, r1
	lsrs r4, r1, 1
	adds r5, r3, 0
	adds r5, 0x10
	cmp r0, 0
	beq _08070E28
	movs r2, 0
	mov r7, r8
	mov r6, r12
_08070E12:
	adds r0, r3, r2
	lsls r0, 1
	adds r1, r0, r7
	adds r0, r6
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0xF
	bls _08070E12
_08070E28:
	adds r1, r4, 0
	lsls r0, r5, 16
	lsrs r3, r0, 16
	cmp r1, 0
	bne _08070DFE
_08070E32:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08070E3C: .4byte gUnknown_20375F8
_08070E40: .4byte gUnknown_20371F8
	thumb_func_end UnfadePlttBuffer

	thumb_func_start BeginFastPaletteFade
BeginFastPaletteFade: @ 8070E44
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _08070E64 @ =gUnknown_2037AB8
	ldrb r2, [r3, 0xA]
	movs r1, 0x79
	negs r1, r1
	ands r1, r2
	movs r2, 0x10
	orrs r1, r2
	strb r1, [r3, 0xA]
	bl BeginFastPaletteFadeInternal
	pop {r0}
	bx r0
	.align 2, 0
_08070E64: .4byte gUnknown_2037AB8
	thumb_func_end BeginFastPaletteFade

	thumb_func_start BeginFastPaletteFadeInternal
BeginFastPaletteFadeInternal: @ 8070E68
	push {r4,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	adds r4, r0, 0
	ldr r2, _08070EDC @ =gUnknown_2037AB8
	ldrh r0, [r2, 0x4]
	movs r3, 0xF8
	lsls r3, 3
	adds r1, r3, 0
	orrs r0, r1
	strh r0, [r2, 0x4]
	movs r1, 0x3F
	ands r1, r4
	ldrb r3, [r2, 0x8]
	movs r0, 0x40
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, 0x8]
	ldrb r0, [r2, 0x7]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2, 0x7]
	ldrb r1, [r2, 0x9]
	movs r0, 0x4
	negs r0, r0
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2, 0x9]
	cmp r4, 0x2
	bne _08070EBA
	mov r1, sp
	movs r0, 0
	strh r0, [r1]
	ldr r1, _08070EE0 @ =gUnknown_20375F8
	ldr r2, _08070EE4 @ =0x01000200
	mov r0, sp
	bl CpuSet
_08070EBA:
	cmp r4, 0
	bne _08070ED0
	mov r0, sp
	adds r0, 0x2
	ldr r2, _08070EE8 @ =0x00007fff
	adds r1, r2, 0
	strh r1, [r0]
	ldr r1, _08070EE0 @ =gUnknown_20375F8
	ldr r2, _08070EE4 @ =0x01000200
	bl CpuSet
_08070ED0:
	bl UpdatePaletteFade
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08070EDC: .4byte gUnknown_2037AB8
_08070EE0: .4byte gUnknown_20375F8
_08070EE4: .4byte 0x01000200
_08070EE8: .4byte 0x00007fff
	thumb_func_end BeginFastPaletteFadeInternal

	thumb_func_start UpdateFastPaletteFade
UpdateFastPaletteFade: @ 8070EEC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	ldr r4, _08070F08 @ =gUnknown_2037AB8
	ldrb r1, [r4, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08070F0C
	movs r0, 0
	b _08071246
	.align 2, 0
_08070F08: .4byte gUnknown_2037AB8
_08070F0C:
	bl IsSoftwarePaletteFadeFinishing
	lsls r0, 24
	cmp r0, 0
	beq _08070F1A
	ldrb r0, [r4, 0x7]
	b _08071244
_08070F1A:
	ldrb r1, [r4, 0xA]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _08070F30
	movs r2, 0x80
	lsls r2, 1
	movs r0, 0x80
	lsls r0, 2
	mov r10, r0
	b _08070F38
_08070F30:
	movs r2, 0
	movs r1, 0x80
	lsls r1, 1
	mov r10, r1
_08070F38:
	ldr r1, _08070F50 @ =gUnknown_2037AB8
	ldrb r0, [r1, 0x8]
	lsls r0, 26
	lsrs r0, 26
	cmp r0, 0x1
	beq _08070FF8
	cmp r0, 0x1
	bgt _08070F54
	cmp r0, 0
	beq _08070F62
	b _08071148
	.align 2, 0
_08070F50: .4byte gUnknown_2037AB8
_08070F54:
	cmp r0, 0x2
	bne _08070F5A
	b _0807105C
_08070F5A:
	cmp r0, 0x3
	bne _08070F60
	b _080710E4
_08070F60:
	b _08071148
_08070F62:
	adds r7, r2, 0
	cmp r7, r10
	bcc _08070F6A
	b _08071148
_08070F6A:
	lsls r2, r7, 1
	ldr r0, _08070FF0 @ =gUnknown_20371F8
	adds r0, r2, r0
	ldr r1, [r0]
	lsls r3, r1, 27
	lsls r0, r1, 22
	lsrs r0, 27
	mov r12, r0
	lsls r1, 17
	lsrs r1, 27
	mov r8, r1
	ldr r0, _08070FF4 @ =gUnknown_20375F8
	adds r2, r0
	mov r9, r2
	ldr r1, [r2]
	lsls r2, r1, 27
	lsrs r2, 3
	movs r4, 0xFE
	lsls r4, 24
	adds r2, r4
	lsls r0, r1, 22
	lsrs r0, 27
	subs r0, 0x2
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r1, 17
	lsrs r1, 27
	subs r1, 0x2
	lsls r1, 24
	lsrs r4, r1, 24
	lsrs r6, r2, 24
	asrs r2, 24
	lsrs r3, 3
	asrs r0, r3, 24
	cmp r2, r0
	bge _08070FB4
	lsrs r6, r3, 24
_08070FB4:
	lsls r0, r5, 24
	asrs r0, 24
	mov r2, r12
	lsls r1, r2, 24
	cmp r0, r12
	bge _08070FC2
	lsrs r5, r1, 24
_08070FC2:
	lsls r0, r4, 24
	asrs r0, 24
	mov r3, r8
	lsls r1, r3, 24
	cmp r0, r8
	bge _08070FD0
	lsrs r4, r1, 24
_08070FD0:
	lsls r1, r6, 24
	asrs r1, 24
	lsls r0, r5, 24
	asrs r0, 19
	orrs r1, r0
	lsls r0, r4, 24
	asrs r0, 14
	orrs r1, r0
	mov r4, r9
	strh r1, [r4]
	adds r0, r7, 0x1
	lsls r0, 16
	lsrs r7, r0, 16
	cmp r7, r10
	bcc _08070F6A
	b _08071148
	.align 2, 0
_08070FF0: .4byte gUnknown_20371F8
_08070FF4: .4byte gUnknown_20375F8
_08070FF8:
	adds r7, r2, 0
	cmp r7, r10
	bcc _08071000
	b _08071148
_08071000:
	lsls r1, r7, 1
	ldr r0, _08071058 @ =gUnknown_20375F8
	adds r2, r1, r0
	ldr r1, [r2]
	lsls r0, r1, 27
	lsrs r0, 3
	movs r3, 0x80
	lsls r3, 18
	adds r0, r3
	lsrs r6, r0, 24
	lsls r0, r1, 22
	lsrs r0, 27
	adds r5, r0, 0x2
	lsls r1, 17
	lsrs r1, 27
	adds r4, r1, 0x2
	cmp r6, 0x1F
	ble _08071026
	movs r6, 0x1F
_08071026:
	lsls r0, r5, 24
	asrs r0, 24
	cmp r0, 0x1F
	ble _08071030
	movs r5, 0x1F
_08071030:
	lsls r0, r4, 24
	asrs r0, 24
	cmp r0, 0x1F
	ble _0807103A
	movs r4, 0x1F
_0807103A:
	lsls r1, r6, 24
	asrs r1, 24
	lsls r0, r5, 24
	asrs r0, 19
	orrs r1, r0
	lsls r0, r4, 24
	asrs r0, 14
	orrs r1, r0
	strh r1, [r2]
	adds r0, r7, 0x1
	lsls r0, 16
	lsrs r7, r0, 16
	cmp r7, r10
	bcc _08071000
	b _08071148
	.align 2, 0
_08071058: .4byte gUnknown_20375F8
_0807105C:
	adds r7, r2, 0
	cmp r7, r10
	bcs _08071148
_08071062:
	lsls r2, r7, 1
	ldr r0, _080710DC @ =gUnknown_20371F8
	adds r0, r2, r0
	ldr r1, [r0]
	lsls r3, r1, 27
	lsls r0, r1, 22
	lsrs r0, 27
	mov r12, r0
	lsls r1, 17
	lsrs r1, 27
	mov r8, r1
	ldr r0, _080710E0 @ =gUnknown_20375F8
	adds r2, r0
	ldr r1, [r2]
	lsls r0, r1, 27
	lsrs r0, 3
	movs r4, 0x80
	lsls r4, 18
	adds r0, r4
	lsrs r6, r0, 24
	lsls r0, r1, 22
	lsrs r0, 27
	adds r5, r0, 0x2
	lsls r1, 17
	lsrs r1, 27
	adds r4, r1, 0x2
	lsrs r3, 3
	asrs r0, r3, 24
	cmp r6, r0
	ble _080710A0
	lsrs r6, r3, 24
_080710A0:
	lsls r0, r5, 24
	asrs r0, 24
	mov r3, r12
	lsls r1, r3, 24
	cmp r0, r12
	ble _080710AE
	lsrs r5, r1, 24
_080710AE:
	lsls r0, r4, 24
	asrs r0, 24
	mov r3, r8
	lsls r1, r3, 24
	cmp r0, r8
	ble _080710BC
	lsrs r4, r1, 24
_080710BC:
	lsls r1, r6, 24
	asrs r1, 24
	lsls r0, r5, 24
	asrs r0, 19
	orrs r1, r0
	lsls r0, r4, 24
	asrs r0, 14
	orrs r1, r0
	strh r1, [r2]
	adds r0, r7, 0x1
	lsls r0, 16
	lsrs r7, r0, 16
	cmp r7, r10
	bcc _08071062
	b _08071148
	.align 2, 0
_080710DC: .4byte gUnknown_20371F8
_080710E0: .4byte gUnknown_20375F8
_080710E4:
	adds r7, r2, 0
	cmp r7, r10
	bcs _08071148
	ldr r4, _08071170 @ =gUnknown_20375F8
	mov r8, r4
_080710EE:
	lsls r0, r7, 1
	mov r1, r8
	adds r3, r0, r1
	ldr r1, [r3]
	lsls r2, r1, 27
	lsrs r2, 3
	movs r4, 0xFE
	lsls r4, 24
	adds r2, r4
	lsls r0, r1, 22
	lsrs r0, 27
	subs r0, 0x2
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r1, 17
	lsrs r1, 27
	subs r1, 0x2
	lsls r1, 24
	lsrs r4, r1, 24
	lsrs r6, r2, 24
	cmp r2, 0
	bge _0807111C
	movs r6, 0
_0807111C:
	lsls r0, r5, 24
	cmp r0, 0
	bge _08071124
	movs r5, 0
_08071124:
	lsls r0, r4, 24
	cmp r0, 0
	bge _0807112C
	movs r4, 0
_0807112C:
	lsls r1, r6, 24
	asrs r1, 24
	lsls r0, r5, 24
	asrs r0, 19
	orrs r1, r0
	lsls r0, r4, 24
	asrs r0, 14
	orrs r1, r0
	strh r1, [r3]
	adds r0, r7, 0x1
	lsls r0, 16
	lsrs r7, r0, 16
	cmp r7, r10
	bcc _080710EE
_08071148:
	ldr r0, _08071174 @ =gUnknown_2037AB8
	ldrb r2, [r0, 0xA]
	lsls r0, r2, 29
	lsrs r0, 31
	movs r1, 0x1
	eors r1, r0
	lsls r1, 2
	movs r3, 0x5
	negs r3, r3
	ands r3, r2
	orrs r3, r1
	ldr r1, _08071174 @ =gUnknown_2037AB8
	strb r3, [r1, 0xA]
	movs r0, 0x4
	ands r0, r3
	cmp r0, 0
	beq _08071178
	ldrb r0, [r1, 0x7]
	b _08071244
	.align 2, 0
_08071170: .4byte gUnknown_20375F8
_08071174: .4byte gUnknown_2037AB8
_08071178:
	ldr r2, _08071194 @ =gUnknown_2037AB8
	ldrh r4, [r2, 0x4]
	lsls r5, r4, 21
	lsrs r0, r5, 27
	lsls r2, r3, 25
	lsrs r1, r2, 28
	subs r0, r1
	cmp r0, 0
	bge _0807119C
	ldr r0, _08071198 @ =0xfffff83f
	ands r0, r4
	ldr r3, _08071194 @ =gUnknown_2037AB8
	strh r0, [r3, 0x4]
	b _080711B2
	.align 2, 0
_08071194: .4byte gUnknown_2037AB8
_08071198: .4byte 0xfffff83f
_0807119C:
	lsrs r1, r5, 27
	lsrs r0, r2, 28
	subs r1, r0
	movs r0, 0x1F
	ands r1, r0
	lsls r1, 6
	ldr r0, _080711D8 @ =0xfffff83f
	ands r0, r4
	orrs r0, r1
	ldr r4, _080711DC @ =gUnknown_2037AB8
	strh r0, [r4, 0x4]
_080711B2:
	ldr r1, _080711DC @ =gUnknown_2037AB8
	ldrh r0, [r1, 0x4]
	movs r1, 0xF8
	lsls r1, 3
	ands r1, r0
	cmp r1, 0
	bne _08071240
	ldr r2, _080711DC @ =gUnknown_2037AB8
	ldrb r0, [r2, 0x8]
	lsls r0, 26
	lsrs r0, 26
	cmp r0, 0x1
	beq _08071204
	cmp r0, 0x1
	bgt _080711E0
	cmp r0, 0
	beq _080711EA
	b _0807122C
	.align 2, 0
_080711D8: .4byte 0xfffff83f
_080711DC: .4byte gUnknown_2037AB8
_080711E0:
	cmp r0, 0x2
	beq _080711EA
	cmp r0, 0x3
	beq _08071220
	b _0807122C
_080711EA:
	ldr r0, _080711F8 @ =gUnknown_20371F8
	ldr r1, _080711FC @ =gUnknown_20375F8
	ldr r2, _08071200 @ =0x04000100
	bl CpuSet
	b _0807122C
	.align 2, 0
_080711F8: .4byte gUnknown_20371F8
_080711FC: .4byte gUnknown_20375F8
_08071200: .4byte 0x04000100
_08071204:
	movs r0, 0x1
	negs r0, r0
	str r0, [sp]
	ldr r1, _08071218 @ =gUnknown_20375F8
	ldr r2, _0807121C @ =0x05000100
	mov r0, sp
	bl CpuSet
	b _0807122C
	.align 2, 0
_08071218: .4byte gUnknown_20375F8
_0807121C: .4byte 0x05000100
_08071220:
	str r1, [sp, 0x4]
	add r0, sp, 0x4
	ldr r1, _08071258 @ =gUnknown_20375F8
	ldr r2, _0807125C @ =0x05000100
	bl CpuSet
_0807122C:
	ldr r2, _08071260 @ =gUnknown_2037AB8
	ldrb r1, [r2, 0x9]
	movs r0, 0x4
	negs r0, r0
	ands r0, r1
	strb r0, [r2, 0x9]
	ldrb r0, [r2, 0xA]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r2, 0xA]
_08071240:
	ldr r3, _08071260 @ =gUnknown_2037AB8
	ldrb r0, [r3, 0x7]
_08071244:
	lsrs r0, 7
_08071246:
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08071258: .4byte gUnknown_20375F8
_0807125C: .4byte 0x05000100
_08071260: .4byte gUnknown_2037AB8
	thumb_func_end UpdateFastPaletteFade

	thumb_func_start BeginHardwarePaletteFade
BeginHardwarePaletteFade: @ 8071264
	push {r4-r7,lr}
	ldr r5, [sp, 0x14]
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r2, 24
	lsls r3, 24
	lsrs r3, 24
	lsls r5, 24
	lsrs r5, 24
	ldr r7, _080712EC @ =gUnknown_2037AB8
	str r0, [r7]
	movs r0, 0x3F
	ands r1, r0
	ldrb r4, [r7, 0x4]
	movs r6, 0x40
	negs r6, r6
	adds r0, r6, 0
	ands r0, r4
	orrs r0, r1
	strb r0, [r7, 0x4]
	ldrb r0, [r7, 0x8]
	ands r6, r0
	orrs r6, r1
	strb r6, [r7, 0x8]
	movs r0, 0x1F
	adds r1, r2, 0
	ands r1, r0
	lsls r1, 6
	ldrh r4, [r7, 0x4]
	ldr r0, _080712F0 @ =0xfffff83f
	ands r0, r4
	orrs r0, r1
	strh r0, [r7, 0x4]
	lsls r4, r3, 3
	ldrb r1, [r7, 0x5]
	movs r0, 0x7
	ands r0, r1
	orrs r0, r4
	strb r0, [r7, 0x5]
	ldrb r0, [r7, 0x7]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r7, 0x7]
	ldrb r1, [r7, 0x9]
	movs r0, 0x4
	negs r0, r0
	ands r0, r1
	movs r1, 0x2
	orrs r0, r1
	movs r1, 0x1
	ands r5, r1
	lsls r5, 2
	subs r1, 0x6
	ands r0, r1
	orrs r0, r5
	subs r1, 0x4
	ands r0, r1
	strb r0, [r7, 0x9]
	cmp r2, r3
	bcs _080712F4
	movs r0, 0x41
	negs r0, r0
	ands r6, r0
	b _080712F8
	.align 2, 0
_080712EC: .4byte gUnknown_2037AB8
_080712F0: .4byte 0xfffff83f
_080712F4:
	movs r0, 0x40
	orrs r6, r0
_080712F8:
	strb r6, [r7, 0x8]
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end BeginHardwarePaletteFade

	thumb_func_start UpdateHardwarePaletteFade
UpdateHardwarePaletteFade: @ 8071300
	push {r4-r7,lr}
	ldr r2, _08071314 @ =gUnknown_2037AB8
	ldrb r1, [r2, 0x7]
	movs r0, 0x80
	ands r0, r1
	adds r4, r2, 0
	cmp r0, 0
	bne _08071318
	movs r0, 0
	b _08071410
	.align 2, 0
_08071314: .4byte gUnknown_2037AB8
_08071318:
	ldrb r2, [r4, 0x4]
	lsls r1, r2, 26
	ldrb r3, [r4, 0x8]
	lsls r0, r3, 26
	cmp r1, r0
	bcs _0807133A
	lsrs r0, r1, 26
	adds r0, 0x1
	movs r1, 0x3F
	ands r0, r1
	movs r1, 0x40
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r4, 0x4]
	movs r0, 0x2
	b _08071410
_0807133A:
	movs r0, 0x40
	negs r0, r0
	ands r0, r2
	strb r0, [r4, 0x4]
	movs r0, 0x40
	ands r0, r3
	cmp r0, 0
	bne _08071398
	ldrh r1, [r4, 0x4]
	lsls r0, r1, 21
	lsrs r0, 27
	adds r0, 0x1
	movs r7, 0x1F
	ands r0, r7
	lsls r0, 6
	ldr r6, _08071394 @ =0xfffff83f
	adds r3, r6, 0
	ands r3, r1
	orrs r3, r0
	strh r3, [r4, 0x4]
	lsls r5, r3, 21
	ldrb r0, [r4, 0x5]
	lsrs r1, r5, 27
	lsrs r0, 3
	cmp r1, r0
	bls _080713E4
	ldrb r2, [r4, 0x9]
	lsls r1, r2, 28
	lsrs r1, 31
	adds r1, 0x1
	movs r0, 0x1
	ands r1, r0
	lsls r1, 3
	movs r0, 0x9
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, 0x9]
	lsrs r0, r5, 27
	subs r0, 0x1
	ands r0, r7
	lsls r0, 6
	ands r3, r6
	b _080713E0
	.align 2, 0
_08071394: .4byte 0xfffff83f
_08071398:
	ldrh r2, [r4, 0x4]
	lsls r1, r2, 21
	lsrs r0, r1, 27
	subs r0, 0x1
	movs r6, 0x1F
	ands r0, r6
	lsls r0, 6
	ldr r5, _08071418 @ =0xfffff83f
	adds r3, r5, 0
	ands r3, r2
	orrs r3, r0
	strh r3, [r4, 0x4]
	lsrs r1, 27
	subs r1, 0x1
	ldrb r0, [r4, 0x5]
	lsrs r0, 3
	cmp r1, r0
	bge _080713E4
	ldrb r2, [r4, 0x9]
	lsls r1, r2, 28
	lsrs r1, 31
	adds r1, 0x1
	movs r0, 0x1
	ands r1, r0
	lsls r1, 3
	movs r0, 0x9
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, 0x9]
	lsls r0, r3, 21
	lsrs r0, 27
	adds r0, 0x1
	ands r0, r6
	lsls r0, 6
	ands r3, r5
_080713E0:
	orrs r3, r0
	strh r3, [r4, 0x4]
_080713E4:
	ldrb r1, [r4, 0x9]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _0807140C
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _08071402
	movs r0, 0
	str r0, [r4]
	ldrh r1, [r4, 0x4]
	ldr r0, _08071418 @ =0xfffff83f
	ands r0, r1
	strh r0, [r4, 0x4]
_08071402:
	ldrb r1, [r4, 0x9]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r4, 0x9]
_0807140C:
	ldrb r0, [r4, 0x7]
	lsrs r0, 7
_08071410:
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08071418: .4byte 0xfffff83f
	thumb_func_end UpdateHardwarePaletteFade

	thumb_func_start UpdateBlendRegisters
UpdateBlendRegisters: @ 807141C
	push {r4,lr}
	ldr r4, _08071468 @ =gUnknown_2037AB8
	ldrh r1, [r4]
	movs r0, 0x50
	bl SetGpuReg
	ldrh r1, [r4, 0x4]
	lsls r1, 21
	lsrs r1, 27
	movs r0, 0x54
	bl SetGpuReg
	ldrb r1, [r4, 0x9]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _08071460
	movs r0, 0x9
	negs r0, r0
	ands r0, r1
	movs r1, 0x4
	negs r1, r1
	ands r0, r1
	strb r0, [r4, 0x9]
	movs r0, 0
	str r0, [r4]
	ldrh r1, [r4, 0x4]
	ldr r0, _0807146C @ =0xfffff83f
	ands r0, r1
	strh r0, [r4, 0x4]
	ldrb r1, [r4, 0x7]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r4, 0x7]
_08071460:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08071468: .4byte gUnknown_2037AB8
_0807146C: .4byte 0xfffff83f
	thumb_func_end UpdateBlendRegisters

	thumb_func_start IsSoftwarePaletteFadeFinishing
IsSoftwarePaletteFadeFinishing: @ 8071470
	push {r4,lr}
	ldr r3, _080714A8 @ =gUnknown_2037AB8
	ldrb r4, [r3, 0xA]
	movs r0, 0x2
	ands r0, r4
	cmp r0, 0
	beq _080714CC
	ldr r2, [r3, 0x8]
	movs r0, 0xF8
	lsls r0, 9
	ands r0, r2
	movs r1, 0x80
	lsls r1, 7
	cmp r0, r1
	bne _080714B0
	ldrb r1, [r3, 0x7]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r3, 0x7]
	movs r0, 0x3
	negs r0, r0
	ands r0, r4
	strb r0, [r3, 0xA]
	ldr r0, [r3, 0x8]
	ldr r1, _080714AC @ =0xfffe0fff
	ands r0, r1
	str r0, [r3, 0x8]
	b _080714C4
	.align 2, 0
_080714A8: .4byte gUnknown_2037AB8
_080714AC: .4byte 0xfffe0fff
_080714B0:
	lsls r0, r2, 15
	lsrs r0, 27
	adds r0, 0x1
	movs r1, 0x1F
	ands r0, r1
	lsls r0, 12
	ldr r1, _080714C8 @ =0xfffe0fff
	ands r1, r2
	orrs r1, r0
	str r1, [r3, 0x8]
_080714C4:
	movs r0, 0x1
	b _080714CE
	.align 2, 0
_080714C8: .4byte 0xfffe0fff
_080714CC:
	movs r0, 0
_080714CE:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end IsSoftwarePaletteFadeFinishing

	thumb_func_start BlendPalettes
BlendPalettes: @ 80714D4
	push {r4-r7,lr}
	adds r4, r0, 0
	lsls r1, 24
	lsrs r7, r1, 24
	lsls r2, 16
	lsrs r6, r2, 16
	movs r5, 0
	cmp r4, 0
	beq _08071508
_080714E6:
	movs r0, 0x1
	ands r0, r4
	cmp r0, 0
	beq _080714FA
	adds r0, r5, 0
	movs r1, 0x10
	adds r2, r7, 0
	adds r3, r6, 0
	bl BlendPalette
_080714FA:
	lsrs r4, 1
	adds r0, r5, 0
	adds r0, 0x10
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r4, 0
	bne _080714E6
_08071508:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end BlendPalettes

	thumb_func_start BlendPalettesUnfaded
BlendPalettesUnfaded: @ 8071510
	push {r4-r6,lr}
	adds r6, r0, 0
	adds r4, r1, 0
	adds r5, r2, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 16
	lsrs r5, 16
	ldr r0, _0807153C @ =gUnknown_20371F8
	ldr r1, _08071540 @ =gUnknown_20375F8
	movs r2, 0x80
	lsls r2, 1
	bl CpuFastSet
	adds r0, r6, 0
	adds r1, r4, 0
	adds r2, r5, 0
	bl BlendPalettes
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807153C: .4byte gUnknown_20371F8
_08071540: .4byte gUnknown_20375F8
	thumb_func_end BlendPalettesUnfaded

	thumb_func_start TintPalette_GrayScale
TintPalette_GrayScale: @ 8071544
	push {r4-r6,lr}
	adds r4, r0, 0
	lsls r1, 16
	lsrs r1, 16
	cmp r1, 0
	beq _0807158C
	movs r6, 0x1F
	adds r5, r1, 0
_08071554:
	ldrh r1, [r4]
	movs r2, 0x1F
	ands r2, r1
	lsls r1, 16
	lsrs r3, r1, 21
	ands r3, r6
	lsrs r1, 26
	ands r1, r6
	movs r0, 0x4C
	muls r2, r0
	movs r0, 0x97
	muls r0, r3
	adds r2, r0
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r1
	adds r2, r0
	asrs r2, 8
	lsls r0, r2, 10
	lsls r1, r2, 5
	orrs r0, r1
	orrs r0, r2
	strh r0, [r4]
	adds r4, 0x2
	subs r5, 0x1
	cmp r5, 0
	bne _08071554
_0807158C:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end TintPalette_GrayScale

	thumb_func_start TintPalette_GrayScale2
TintPalette_GrayScale2: @ 8071594
	push {r4-r7,lr}
	adds r4, r0, 0
	lsls r1, 16
	lsrs r1, 16
	cmp r1, 0
	beq _080715E8
	movs r6, 0x1F
	ldr r7, _080715F0 @ =gUnknown_83AC970
	adds r5, r1, 0
_080715A6:
	ldrh r1, [r4]
	movs r2, 0x1F
	ands r2, r1
	lsls r1, 16
	lsrs r3, r1, 21
	ands r3, r6
	lsrs r1, 26
	ands r1, r6
	movs r0, 0x4C
	muls r2, r0
	movs r0, 0x97
	muls r0, r3
	adds r2, r0
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r1
	adds r2, r0
	asrs r2, 8
	cmp r2, 0x1F
	bls _080715D2
	movs r2, 0x1F
_080715D2:
	adds r0, r2, r7
	ldrb r2, [r0]
	lsls r0, r2, 10
	lsls r1, r2, 5
	orrs r0, r1
	orrs r0, r2
	strh r0, [r4]
	adds r4, 0x2
	subs r5, 0x1
	cmp r5, 0
	bne _080715A6
_080715E8:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080715F0: .4byte gUnknown_83AC970
	thumb_func_end TintPalette_GrayScale2

	thumb_func_start TintPalette_SepiaTone
TintPalette_SepiaTone: @ 80715F4
	push {r4-r7,lr}
	adds r5, r0, 0
	lsls r1, 16
	lsrs r1, 16
	cmp r1, 0
	beq _08071656
	movs r7, 0x1F
	adds r6, r1, 0
_08071604:
	ldrh r0, [r5]
	movs r1, 0x1F
	ands r1, r0
	lsls r0, 16
	lsrs r2, r0, 21
	ands r2, r7
	lsrs r3, r0, 26
	ands r3, r7
	movs r0, 0x4C
	muls r1, r0
	movs r0, 0x97
	muls r0, r2
	adds r1, r0
	lsls r0, r3, 3
	subs r0, r3
	lsls r0, 2
	adds r0, r3
	adds r1, r0
	asrs r1, 8
	ldr r0, _0807165C @ =0x00000133
	muls r0, r1
	lsls r0, 16
	lsrs r2, r0, 24
	lsls r0, r1, 24
	lsrs r4, r0, 24
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 20
	lsrs r3, r0, 24
	cmp r2, 0x1F
	ble _08071644
	movs r2, 0x1F
_08071644:
	lsls r0, r3, 10
	lsls r1, r4, 5
	orrs r0, r1
	orrs r0, r2
	strh r0, [r5]
	adds r5, 0x2
	subs r6, 0x1
	cmp r6, 0
	bne _08071604
_08071656:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807165C: .4byte 0x00000133
	thumb_func_end TintPalette_SepiaTone

	thumb_func_start sub_8071660
sub_8071660: @ 8071660
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	adds r5, r0, 0
	ldr r0, [sp, 0x1C]
	lsls r1, 16
	lsrs r1, 16
	lsls r2, 16
	lsrs r2, 16
	mov r9, r2
	lsls r3, 16
	lsrs r3, 16
	mov r8, r3
	lsls r0, 16
	lsrs r0, 16
	mov r12, r0
	cmp r1, 0
	beq _080716EC
	movs r7, 0x1F
	adds r6, r1, 0
_0807168A:
	ldrh r0, [r5]
	movs r1, 0x1F
	ands r1, r0
	lsls r0, 16
	lsrs r2, r0, 21
	ands r2, r7
	lsrs r3, r0, 26
	ands r3, r7
	movs r0, 0x4C
	muls r1, r0
	movs r0, 0x97
	muls r0, r2
	adds r1, r0
	lsls r0, r3, 3
	subs r0, r3
	lsls r0, 2
	adds r0, r3
	adds r1, r0
	asrs r1, 8
	mov r0, r9
	muls r0, r1
	lsls r0, 16
	lsrs r4, r0, 24
	mov r0, r8
	muls r0, r1
	lsls r0, 16
	lsrs r2, r0, 24
	mov r0, r12
	muls r0, r1
	lsls r0, 16
	lsrs r3, r0, 24
	cmp r4, 0x1F
	ble _080716CE
	movs r4, 0x1F
_080716CE:
	cmp r2, 0x1F
	ble _080716D4
	movs r2, 0x1F
_080716D4:
	cmp r3, 0x1F
	ble _080716DA
	movs r3, 0x1F
_080716DA:
	lsls r0, r3, 10
	lsls r1, r2, 5
	orrs r0, r1
	orrs r0, r4
	strh r0, [r5]
	adds r5, 0x2
	subs r6, 0x1
	cmp r6, 0
	bne _0807168A
_080716EC:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8071660

	thumb_func_start sub_80716F8
sub_80716F8: @ 80716F8
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	mov r9, r0
	adds r6, r1, 0
	lsls r2, 16
	lsrs r2, 16
	lsls r3, 24
	lsrs r3, 24
	mov r12, r3
	cmp r3, 0
	bne _0807172C
	cmp r2, 0
	beq _0807179A
	adds r5, r2, 0
_08071718:
	mov r1, r9
	ldrh r0, [r1]
	strh r0, [r6]
	movs r7, 0x2
	add r9, r7
	adds r6, 0x2
	subs r5, 0x1
	cmp r5, 0
	bne _08071718
	b _0807179A
_0807172C:
	cmp r2, 0
	beq _0807179A
	movs r0, 0x1F
	mov r8, r0
	adds r5, r2, 0
_08071736:
	mov r7, r9
	ldrh r1, [r7]
	movs r4, 0x1F
	ands r4, r1
	lsls r1, 16
	lsrs r3, r1, 21
	mov r0, r8
	ands r3, r0
	lsrs r1, 26
	ands r1, r0
	movs r0, 0x4C
	adds r2, r4, 0
	muls r2, r0
	movs r0, 0x97
	muls r0, r3
	adds r2, r0
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r1
	adds r2, r0
	asrs r2, 8
	subs r0, r2, r4
	mov r7, r12
	muls r7, r0
	adds r0, r7, 0
	lsrs r0, 4
	adds r4, r0
	subs r0, r2, r3
	mov r7, r12
	muls r7, r0
	adds r0, r7, 0
	lsrs r0, 4
	adds r3, r0
	subs r2, r1
	mov r0, r12
	muls r0, r2
	lsrs r0, 4
	adds r1, r0
	lsls r1, 10
	lsls r3, 5
	orrs r1, r3
	orrs r1, r4
	strh r1, [r6]
	movs r0, 0x2
	add r9, r0
	adds r6, 0x2
	subs r5, 0x1
	cmp r5, 0
	bne _08071736
_0807179A:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80716F8

	thumb_func_start sub_80717A8
sub_80717A8: @ 80717A8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	mov r10, r0
	adds r4, r1, 0
	ldr r0, [sp, 0x20]
	ldr r1, [sp, 0x24]
	ldr r5, [sp, 0x28]
	lsls r4, 24
	lsrs r4, 24
	lsls r2, 24
	lsrs r7, r2, 24
	lsls r3, 24
	lsrs r6, r3, 24
	lsls r0, 16
	lsrs r0, 16
	mov r9, r0
	lsls r1, 24
	lsrs r1, 24
	lsls r5, 24
	lsrs r5, 24
	mov r8, r5
	ldr r0, _08071800 @ =sub_80718B8
	bl CreateTask
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _08071804 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r1, r0, r1
	strh r7, [r1, 0x8]
	strh r6, [r1, 0xA]
	lsls r4, 24
	asrs r4, 24
	cmp r4, 0
	blt _08071808
	strh r4, [r1, 0xE]
	movs r0, 0x1
	b _08071810
	.align 2, 0
_08071800: .4byte sub_80718B8
_08071804: .4byte gTasks
_08071808:
	movs r0, 0
	strh r0, [r1, 0xE]
	negs r0, r4
	adds r0, 0x1
_08071810:
	strh r0, [r1, 0xC]
	lsls r4, r5, 2
	cmp r6, r7
	bcs _08071828
	ldr r0, _08071858 @ =gTasks
	adds r1, r4, r5
	lsls r1, 3
	adds r1, r0
	movs r2, 0xC
	ldrsh r0, [r1, r2]
	negs r0, r0
	strh r0, [r1, 0xC]
_08071828:
	adds r0, r5, 0
	movs r1, 0x5
	mov r2, r10
	bl SetWordTaskArg
	ldr r0, _08071858 @ =gTasks
	adds r1, r4, r5
	lsls r1, 3
	adds r1, r0
	mov r0, r9
	strh r0, [r1, 0x16]
	mov r2, r8
	strh r2, [r1, 0x18]
	ldr r1, [r1]
	adds r0, r5, 0
	bl _call_via_r1
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08071858: .4byte gTasks
	thumb_func_end sub_80717A8

	thumb_func_start sub_807185C
sub_807185C: @ 807185C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	movs r2, 0
	ldr r4, _08071880 @ =sub_80718B8
	ldr r1, _08071884 @ =gTasks
_08071868:
	ldrb r0, [r1, 0x4]
	cmp r0, 0x1
	bne _08071888
	ldr r0, [r1]
	cmp r0, r4
	bne _08071888
	movs r5, 0x18
	ldrsh r0, [r1, r5]
	cmp r0, r3
	bne _08071888
	movs r0, 0x1
	b _08071892
	.align 2, 0
_08071880: .4byte sub_80718B8
_08071884: .4byte gTasks
_08071888:
	adds r1, 0x28
	adds r2, 0x1
	cmp r2, 0xF
	ble _08071868
	movs r0, 0
_08071892:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_807185C

	thumb_func_start sub_8071898
sub_8071898: @ 8071898
	push {lr}
	b _080718A0
_0807189C:
	bl DestroyTask
_080718A0:
	ldr r0, _080718B4 @ =sub_80718B8
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	bne _0807189C
	pop {r0}
	bx r0
	.align 2, 0
_080718B4: .4byte sub_80718B8
	thumb_func_end sub_8071898

	thumb_func_start sub_80718B8
sub_80718B8: @ 80718B8
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _0807190C @ =gTasks+0x8
	adds r4, r0, r1
	adds r0, r5, 0
	movs r1, 0x5
	bl GetWordTaskArg
	adds r3, r0, 0
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	lsls r0, 16
	asrs r0, 16
	movs r2, 0x6
	ldrsh r1, [r4, r2]
	cmp r0, r1
	ble _08071930
	movs r0, 0
	strh r0, [r4, 0x8]
	ldrb r1, [r4]
	ldrh r2, [r4, 0xE]
	adds r0, r3, 0
	bl BlendPalettes
	ldrh r1, [r4]
	movs r6, 0
	ldrsh r0, [r4, r6]
	ldrh r3, [r4, 0x2]
	movs r6, 0x2
	ldrsh r2, [r4, r6]
	cmp r0, r2
	bne _08071910
	adds r0, r5, 0
	bl DestroyTask
	b _08071930
	.align 2, 0
_0807190C: .4byte gTasks+0x8
_08071910:
	ldrh r0, [r4, 0x4]
	adds r1, r0
	strh r1, [r4]
	lsls r0, 16
	cmp r0, 0
	blt _08071926
	lsls r0, r1, 16
	asrs r0, 16
	cmp r0, r2
	blt _08071930
	b _0807192E
_08071926:
	lsls r0, r1, 16
	asrs r0, 16
	cmp r0, r2
	bgt _08071930
_0807192E:
	strh r3, [r4]
_08071930:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80718B8

	.align 2, 0 @ Don't pad with nop.
