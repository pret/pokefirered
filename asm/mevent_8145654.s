	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_8145654
sub_8145654: @ 8145654
	push {r4-r7,lr}
	adds r5, r0, 0
	adds r6, r1, 0
	cmp r5, 0
	beq _08145670
	cmp r6, 0
	beq _08145670
	ldr r7, _08145674 @ =gUnknown_203F3C8
	ldr r0, _08145678 @ =0x0000145c
	bl AllocZeroed
	str r0, [r7]
	cmp r0, 0
	bne _0814567C
_08145670:
	movs r0, 0
	b _081456E6
	.align 2, 0
_08145674: .4byte gUnknown_203F3C8
_08145678: .4byte 0x0000145c
_0814567C:
	movs r4, 0xA6
	lsls r4, 1
	adds r1, r5, 0
	adds r2, r4, 0
	bl memcpy
	ldr r1, [r7]
	adds r1, r4
	adds r0, r6, 0
	ldm r0!, {r2-r4}
	stm r1!, {r2-r4}
	ldm r0!, {r2-r4}
	stm r1!, {r2-r4}
	ldm r0!, {r2-r4}
	stm r1!, {r2-r4}
	ldr r2, [r7]
	ldrb r1, [r2, 0x8]
	lsls r0, r1, 26
	lsrs r0, 28
	cmp r0, 0x7
	bls _081456AE
	movs r0, 0x3D
	negs r0, r0
	ands r0, r1
	strb r0, [r2, 0x8]
_081456AE:
	ldr r2, [r7]
	ldrb r1, [r2, 0x8]
	lsls r0, r1, 30
	lsrs r0, 30
	cmp r0, 0x2
	bls _081456C2
	movs r0, 0x4
	negs r0, r0
	ands r0, r1
	strb r0, [r2, 0x8]
_081456C2:
	ldr r1, [r7]
	ldrb r0, [r1, 0x9]
	cmp r0, 0x7
	bls _081456CE
	movs r0, 0
	strb r0, [r1, 0x9]
_081456CE:
	ldr r0, [r7]
	movs r1, 0xB8
	lsls r1, 1
	adds r2, r0, r1
	ldrb r0, [r0, 0x8]
	lsls r0, 26
	lsrs r0, 28
	lsls r0, 4
	ldr r1, _081456EC @ =gUnknown_8467FB8
	adds r0, r1
	str r0, [r2]
	movs r0, 0x1
_081456E6:
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_081456EC: .4byte gUnknown_8467FB8
	thumb_func_end sub_8145654

	thumb_func_start sub_81456F0
sub_81456F0: @ 81456F0
	push {r4,lr}
	ldr r4, _08145714 @ =gUnknown_203F3C8
	ldr r0, [r4]
	cmp r0, 0
	beq _0814570C
	ldr r2, _08145718 @ =0x0000145c
	movs r1, 0
	bl memset
	ldr r0, [r4]
	bl Free
	movs r0, 0
	str r0, [r4]
_0814570C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08145714: .4byte gUnknown_203F3C8
_08145718: .4byte 0x0000145c
	thumb_func_end sub_81456F0

	thumb_func_start sub_814571C
sub_814571C: @ 814571C
	push {r4-r6,lr}
	sub sp, 0x24
	ldr r5, _08145730 @ =gUnknown_203F3C8
	ldr r0, [r5]
	cmp r0, 0
	bne _08145734
	movs r0, 0x1
	negs r0, r0
	b _08145930
	.align 2, 0
_08145730: .4byte gUnknown_203F3C8
_08145734:
	movs r4, 0xBA
	lsls r4, 1
	adds r0, r4
	ldrb r0, [r0]
	cmp r0, 0x7
	bls _08145742
	b _08145908
_08145742:
	lsls r0, 2
	ldr r1, _0814574C @ =_08145750
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0814574C: .4byte _08145750
	.align 2, 0
_08145750:
	.4byte _08145770
	.4byte _08145782
	.4byte _08145790
	.4byte _08145834
	.4byte _081458AC
	.4byte _081458B2
	.4byte _081458CC
	.4byte _081458D2
_08145770:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	b _0814591E
_08145782:
	bl UpdatePaletteFade
	lsls r0, 24
	cmp r0, 0
	bne _0814578E
	b _0814591E
_0814578E:
	b _0814592E
_08145790:
	movs r5, 0x1E
	str r5, [sp]
	movs r4, 0x14
	str r4, [sp, 0x4]
	movs r0, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect_Palette0
	str r5, [sp]
	str r4, [sp, 0x4]
	movs r0, 0x1
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect_Palette0
	str r5, [sp]
	str r4, [sp, 0x4]
	movs r0, 0x2
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect_Palette0
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	movs r0, 0x1
	bl CopyBgTilemapBufferToVram
	movs r0, 0x2
	bl CopyBgTilemapBufferToVram
	ldr r5, _0814582C @ =gUnknown_203F3C8
	ldr r0, [r5]
	movs r1, 0xB8
	lsls r1, 1
	adds r0, r1
	ldr r0, [r0]
	ldr r1, [r0, 0x4]
	movs r0, 0
	str r0, [sp]
	movs r0, 0x2
	movs r2, 0
	movs r3, 0x8
	bl decompress_and_copy_tile_data_to_vram
	ldr r4, _08145830 @ =gUnknown_8467074
	adds r0, r4, 0
	bl AddWindow
	ldr r1, [r5]
	movs r2, 0xBB
	lsls r2, 1
	adds r1, r2
	strh r0, [r1]
	adds r0, r4, 0
	adds r0, 0x8
	bl AddWindow
	ldr r1, [r5]
	movs r2, 0xBC
	lsls r2, 1
	adds r1, r2
	strh r0, [r1]
	adds r4, 0x10
	adds r0, r4, 0
	bl AddWindow
	ldr r1, [r5]
	movs r2, 0xBD
	lsls r2, 1
	adds r1, r2
	strh r0, [r1]
	b _0814591E
	.align 2, 0
_0814582C: .4byte gUnknown_203F3C8
_08145830: .4byte gUnknown_8467074
_08145834:
	bl free_temp_tile_data_buffers_if_possible
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0
	bne _0814592E
	ldr r2, _081458A0 @ =gUnknown_2037AB8
	ldrb r0, [r2, 0x8]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2, 0x8]
	ldr r5, _081458A4 @ =gUnknown_203F3C8
	ldr r0, [r5]
	movs r4, 0xB8
	lsls r4, 1
	adds r0, r4
	ldr r0, [r0]
	ldr r0, [r0, 0xC]
	movs r1, 0x10
	movs r2, 0x20
	bl LoadPalette
	ldr r1, [r5]
	adds r4, r1, r4
	ldr r0, [r4]
	ldr r0, [r0, 0x8]
	ldr r4, _081458A8 @ =0x0000045c
	adds r1, r4
	bl LZ77UnCompWram
	ldr r1, [r5]
	adds r1, r4
	movs r2, 0x1E
	str r2, [sp]
	movs r0, 0x14
	str r0, [sp, 0x4]
	str r6, [sp, 0x8]
	str r6, [sp, 0xC]
	str r2, [sp, 0x10]
	str r0, [sp, 0x14]
	movs r0, 0x1
	str r0, [sp, 0x18]
	movs r0, 0x8
	str r0, [sp, 0x1C]
	str r6, [sp, 0x20]
	movs r0, 0x2
	movs r2, 0
	movs r3, 0
	bl CopyRectToBgTilemapBufferRect
	movs r0, 0x2
	bl CopyBgTilemapBufferToVram
	b _0814591E
	.align 2, 0
_081458A0: .4byte gUnknown_2037AB8
_081458A4: .4byte gUnknown_203F3C8
_081458A8: .4byte 0x0000045c
_081458AC:
	bl sub_8145A98
	b _0814591E
_081458B2:
	movs r0, 0
	bl sub_8145D18
	movs r0, 0x1
	bl sub_8145D18
	movs r0, 0x2
	bl sub_8145D18
	movs r0, 0x1
	bl CopyBgTilemapBufferToVram
	b _0814591E
_081458CC:
	bl sub_809707C
	b _0814591E
_081458D2:
	movs r0, 0x1
	bl ShowBg
	movs r0, 0x2
	bl ShowBg
	ldr r2, _08145904 @ =gUnknown_2037AB8
	ldrb r1, [r2, 0x8]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r2, 0x8]
	bl sub_8146060
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	bl UpdatePaletteFade
	b _0814591E
	.align 2, 0
_08145904: .4byte gUnknown_2037AB8
_08145908:
	bl UpdatePaletteFade
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	bne _0814592E
	ldr r0, [r5]
	adds r0, r4
	strb r1, [r0]
	movs r0, 0x1
	b _08145930
_0814591E:
	ldr r0, _08145938 @ =gUnknown_203F3C8
	ldr r1, [r0]
	movs r0, 0xBA
	lsls r0, 1
	adds r1, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_0814592E:
	movs r0, 0
_08145930:
	add sp, 0x24
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08145938: .4byte gUnknown_203F3C8
	thumb_func_end sub_814571C

	thumb_func_start sub_814593C
sub_814593C: @ 814593C
	push {r4,r5,lr}
	sub sp, 0x8
	adds r2, r0, 0
	ldr r5, _08145950 @ =gUnknown_203F3C8
	ldr r0, [r5]
	cmp r0, 0
	bne _08145954
	movs r0, 0x1
	negs r0, r0
	b _08145A8C
	.align 2, 0
_08145950: .4byte gUnknown_203F3C8
_08145954:
	movs r4, 0xBA
	lsls r4, 1
	adds r0, r4
	ldrb r0, [r0]
	cmp r0, 0x6
	bls _08145962
	b _08145A64
_08145962:
	lsls r0, 2
	ldr r1, _0814596C @ =_08145970
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0814596C: .4byte _08145970
	.align 2, 0
_08145970:
	.4byte _0814598C
	.4byte _0814599E
	.4byte _081459AA
	.4byte _081459F2
	.4byte _08145A30
	.4byte _08145A3A
	.4byte _08145A4C
_0814598C:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	b _08145A7A
_0814599E:
	bl UpdatePaletteFade
	lsls r0, 24
	cmp r0, 0
	beq _08145A7A
	b _08145A8A
_081459AA:
	movs r5, 0x1E
	str r5, [sp]
	movs r4, 0x14
	str r4, [sp, 0x4]
	movs r0, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect_Palette0
	str r5, [sp]
	str r4, [sp, 0x4]
	movs r0, 0x1
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect_Palette0
	str r5, [sp]
	str r4, [sp, 0x4]
	movs r0, 0x2
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect_Palette0
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	movs r0, 0x1
	bl CopyBgTilemapBufferToVram
	movs r0, 0x2
	bl CopyBgTilemapBufferToVram
	b _08145A7A
_081459F2:
	movs r0, 0x1
	bl HideBg
	movs r0, 0x2
	bl HideBg
	ldr r4, _08145A2C @ =gUnknown_203F3C8
	ldr r0, [r4]
	movs r1, 0xBD
	lsls r1, 1
	adds r0, r1
	ldrb r0, [r0]
	bl RemoveWindow
	ldr r0, [r4]
	movs r1, 0xBC
	lsls r1, 1
	adds r0, r1
	ldrb r0, [r0]
	bl RemoveWindow
	ldr r0, [r4]
	movs r1, 0xBB
	lsls r1, 1
	adds r0, r1
	ldrb r0, [r0]
	bl RemoveWindow
	b _08145A7A
	.align 2, 0
_08145A2C: .4byte gUnknown_203F3C8
_08145A30:
	bl sub_81461D8
	bl sub_8097114
	b _08145A7A
_08145A3A:
	ldr r0, _08145A48 @ =gUnknown_203F3B8
	ldrb r0, [r0]
	adds r1, r2, 0
	bl sub_8142344
	b _08145A7A
	.align 2, 0
_08145A48: .4byte gUnknown_203F3B8
_08145A4C:
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	b _08145A7A
_08145A64:
	bl UpdatePaletteFade
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	bne _08145A8A
	ldr r0, [r5]
	adds r0, r4
	strb r1, [r0]
	movs r0, 0x1
	b _08145A8C
_08145A7A:
	ldr r0, _08145A94 @ =gUnknown_203F3C8
	ldr r1, [r0]
	movs r0, 0xBA
	lsls r0, 1
	adds r1, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_08145A8A:
	movs r0, 0
_08145A8C:
	add sp, 0x8
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08145A94: .4byte gUnknown_203F3C8
	thumb_func_end sub_814593C

	thumb_func_start sub_8145A98
sub_8145A98: @ 8145A98
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	movs r5, 0
	mov r0, sp
	movs r1, 0
	movs r2, 0x6
	bl memset
	ldr r4, _08145B7C @ =gUnknown_203F3C8
	ldr r1, [r4]
	ldr r2, _08145B80 @ =0x0000018b
	adds r0, r1, r2
	adds r1, 0xA
	movs r2, 0x28
	bl memcpy
	ldr r0, [r4]
	ldr r3, _08145B84 @ =0x000001b3
	adds r1, r0, r3
	movs r0, 0xFF
	strb r0, [r1]
	ldr r1, [r4]
	movs r2, 0xDA
	lsls r2, 1
	adds r0, r1, r2
	adds r1, 0x32
	movs r2, 0x28
	bl memcpy
	ldr r0, [r4]
	movs r3, 0xEE
	lsls r3, 1
	adds r0, r3
	movs r1, 0x1
	negs r1, r1
	strb r1, [r0]
	ldr r1, [r4]
	ldr r0, [r1, 0x4]
	ldr r2, _08145B88 @ =0x000f423f
	cmp r0, r2
	bls _08145AF4
	str r2, [r1, 0x4]
_08145AF4:
	ldr r1, [r4]
	ldr r2, _08145B8C @ =0x000001dd
	adds r0, r1, r2
	ldr r1, [r1, 0x4]
	movs r2, 0
	movs r3, 0x6
	bl sub_8008E78
	adds r6, r4, 0
_08145B06:
	ldr r2, [r6]
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r4, r1, r5
	adds r0, r4, r2
	movs r3, 0xF2
	lsls r3, 1
	adds r0, r3
	adds r1, r2
	adds r1, 0x5A
	movs r2, 0x28
	bl memcpy
	ldr r1, [r6]
	movs r0, 0x83
	lsls r0, 2
	adds r1, r0
	adds r1, r4
	movs r2, 0x1
	negs r2, r2
	adds r7, r2, 0
	movs r0, 0xFF
	strb r0, [r1]
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x3
	bls _08145B06
	ldr r6, _08145B7C @ =gUnknown_203F3C8
	ldr r1, [r6]
	movs r3, 0xA2
	lsls r3, 2
	adds r0, r1, r3
	adds r1, 0xFA
	movs r2, 0x28
	bl memcpy
	ldr r0, [r6]
	movs r4, 0xAC
	lsls r4, 2
	adds r0, r4
	movs r1, 0x1
	negs r1, r1
	adds r4, r1, 0
	movs r1, 0xFF
	strb r1, [r0]
	ldr r1, [r6]
	ldrb r0, [r1, 0x8]
	lsls r0, 30
	lsrs r0, 30
	cmp r0, 0x1
	beq _08145BB8
	cmp r0, 0x1
	bgt _08145B90
	cmp r0, 0
	beq _08145B96
	b _08145D08
	.align 2, 0
_08145B7C: .4byte gUnknown_203F3C8
_08145B80: .4byte 0x0000018b
_08145B84: .4byte 0x000001b3
_08145B88: .4byte 0x000f423f
_08145B8C: .4byte 0x000001dd
_08145B90:
	cmp r0, 0x2
	beq _08145BC8
	b _08145D08
_08145B96:
	ldr r2, _08145BB0 @ =0x000002b1
	adds r0, r1, r2
	movs r3, 0x91
	lsls r3, 1
	adds r1, r3
	movs r2, 0x28
	bl memcpy
	ldr r1, [r6]
	ldr r0, _08145BB4 @ =0x000002d9
	adds r1, r0
	b _08145BBC
	.align 2, 0
_08145BB0: .4byte 0x000002b1
_08145BB4: .4byte 0x000002d9
_08145BB8:
	ldr r2, _08145BC4 @ =0x000002b1
	adds r1, r2
_08145BBC:
	ldrb r0, [r1]
	orrs r0, r4
	strb r0, [r1]
	b _08145D08
	.align 2, 0
_08145BC4: .4byte 0x000002b1
_08145BC8:
	ldr r3, _08145C84 @ =0x000002b1
	adds r0, r1, r3
	ldrb r1, [r0]
	orrs r1, r7
	strb r1, [r0]
	mov r3, sp
	ldr r1, [r6]
	movs r4, 0xA6
	lsls r4, 1
	adds r0, r1, r4
	ldrh r0, [r0]
	ldr r2, _08145C88 @ =0x000003e7
	cmp r0, r2
	bls _08145BE6
	adds r0, r2, 0
_08145BE6:
	strh r0, [r3]
	mov r3, sp
	movs r4, 0xA7
	lsls r4, 1
	adds r0, r1, r4
	ldrh r0, [r0]
	cmp r0, r2
	bls _08145BF8
	adds r0, r2, 0
_08145BF8:
	strh r0, [r3, 0x2]
	mov r3, sp
	movs r4, 0xA8
	lsls r4, 1
	adds r0, r1, r4
	ldrh r0, [r0]
	cmp r0, r2
	bls _08145C0A
	adds r0, r2, 0
_08145C0A:
	strh r0, [r3, 0x4]
	movs r5, 0
_08145C0E:
	lsls r4, r5, 1
	adds r4, r5
	lsls r4, 4
	movs r0, 0xB7
	lsls r0, 2
	adds r4, r0
	ldr r0, [r6]
	adds r0, r4
	adds r0, 0x2A
	movs r1, 0xFF
	movs r2, 0x4
	bl memset
	ldr r0, [r6]
	adds r0, r4
	adds r0, 0x1
	movs r1, 0xFF
	movs r2, 0x29
	bl memset
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x7
	bls _08145C0E
	movs r5, 0
	movs r6, 0
	ldr r1, _08145C8C @ =gUnknown_203F3C8
	mov r8, r1
	movs r2, 0x91
	lsls r2, 1
	mov r10, r2
	ldr r7, _08145C90 @ =0x00000175
	movs r3, 0xB7
	lsls r3, 2
	mov r9, r3
_08145C56:
	mov r4, r8
	ldr r2, [r4]
	mov r0, r10
	adds r1, r2, r0
	adds r0, r1, r5
	ldrb r3, [r0]
	cmp r3, 0xF7
	beq _08145C98
	ldr r1, _08145C90 @ =0x00000175
	adds r0, r2, r1
	ldrb r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 4
	adds r0, r6, r0
	ldr r4, _08145C94 @ =0x000002dd
	adds r1, r2, r4
	adds r1, r0
	strb r3, [r1]
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	b _08145CFE
	.align 2, 0
_08145C84: .4byte 0x000002b1
_08145C88: .4byte 0x000003e7
_08145C8C: .4byte gUnknown_203F3C8
_08145C90: .4byte 0x00000175
_08145C94: .4byte 0x000002dd
_08145C98:
	adds r0, r5, 0x1
	adds r0, r1, r0
	ldrb r3, [r0]
	cmp r3, 0x2
	bls _08145CA8
	adds r0, r5, 0x2
	lsls r0, 16
	b _08145CFC
_08145CA8:
	adds r0, r2, r7
	ldrb r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 4
	add r0, r9
	adds r0, r2, r0
	adds r0, 0x2A
	lsls r1, r3, 1
	add r1, sp
	ldrh r1, [r1]
	movs r2, 0x2
	movs r3, 0x3
	bl sub_8008E78
	mov r0, r8
	ldr r1, [r0]
	adds r0, r1, r7
	ldrb r2, [r0]
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 4
	adds r0, r1, r0
	adds r4, r5, 0x2
	add r1, r10
	adds r1, r4
	ldrb r1, [r1]
	add r0, r9
	strb r1, [r0]
	mov r2, r8
	ldr r1, [r2]
	adds r1, r7
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	ldr r0, [r2]
	adds r0, r7
	ldrb r0, [r0]
	cmp r0, 0x7
	bhi _08145D08
	movs r6, 0
	lsls r0, r4, 16
_08145CFC:
	lsrs r5, r0, 16
_08145CFE:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x27
	bls _08145C56
_08145D08:
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8145A98

	thumb_func_start sub_8145D18
sub_8145D18: @ 8145D18
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x18
	lsls r0, 24
	lsrs r4, r0, 24
	mov r8, r4
	movs r0, 0
	str r0, [sp, 0xC]
	ldr r7, _08145D60 @ =gUnknown_203F3C8
	ldr r0, [r7]
	lsls r1, r4, 1
	movs r2, 0xBB
	lsls r2, 1
	adds r0, r2
	adds r0, r1
	ldrh r0, [r0]
	lsls r6, r0, 24
	lsrs r5, r6, 24
	adds r0, r5, 0
	bl PutWindowTilemap
	adds r0, r5, 0
	movs r1, 0
	bl FillWindowPixelBuffer
	cmp r4, 0x1
	beq _08145E40
	cmp r4, 0x1
	bgt _08145D64
	cmp r4, 0
	beq _08145D70
	mov r9, r6
	b _08146038
	.align 2, 0
_08145D60: .4byte gUnknown_203F3C8
_08145D64:
	mov r0, r8
	cmp r0, 0x2
	bne _08145D6C
	b _08145EA4
_08145D6C:
	mov r9, r6
	b _08146038
_08145D70:
	ldr r2, [r7]
	movs r1, 0xB8
	lsls r1, 1
	mov r10, r1
	adds r0, r2, r1
	ldr r0, [r0]
	ldrb r0, [r0]
	lsls r0, 28
	lsrs r0, 28
	lsls r1, r0, 1
	adds r1, r0
	ldr r0, _08145E34 @ =gUnknown_8467068
	mov r8, r0
	add r1, r8
	str r1, [sp]
	ldr r1, [sp, 0xC]
	str r1, [sp, 0x4]
	ldr r0, _08145E38 @ =0x0000018b
	adds r2, r0
	str r2, [sp, 0x8]
	adds r0, r5, 0
	movs r1, 0x3
	movs r2, 0
	movs r3, 0x1
	bl box_print
	ldr r4, [r7]
	movs r1, 0xDA
	lsls r1, 1
	mov r9, r1
	add r4, r9
	movs r0, 0x3
	movs r1, 0x2
	bl GetFontAttribute
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	movs r0, 0x3
	adds r1, r4, 0
	bl sub_8005ED4
	movs r1, 0xA0
	subs r1, r0
	cmp r1, 0
	bge _08145DCE
	movs r1, 0
_08145DCE:
	lsls r2, r1, 24
	lsrs r2, 24
	ldr r3, [r7]
	mov r1, r10
	adds r0, r3, r1
	ldr r0, [r0]
	ldrb r1, [r0]
	lsls r1, 28
	lsrs r1, 28
	lsls r0, r1, 1
	adds r0, r1
	add r0, r8
	str r0, [sp]
	ldr r0, [sp, 0xC]
	str r0, [sp, 0x4]
	add r3, r9
	str r3, [sp, 0x8]
	adds r0, r5, 0
	movs r1, 0x3
	movs r3, 0x11
	bl box_print
	ldr r2, [r7]
	ldr r0, [r2, 0x4]
	mov r9, r6
	cmp r0, 0
	bne _08145E06
	b _08146038
_08145E06:
	mov r1, r10
	adds r0, r2, r1
	ldr r0, [r0]
	ldrb r1, [r0]
	lsls r1, 28
	lsrs r1, 28
	lsls r0, r1, 1
	adds r0, r1
	add r0, r8
	str r0, [sp]
	ldr r0, [sp, 0xC]
	str r0, [sp, 0x4]
	ldr r1, _08145E3C @ =0x000001dd
	adds r0, r2, r1
	str r0, [sp, 0x8]
	adds r0, r5, 0
	movs r1, 0x2
	movs r2, 0xA6
	movs r3, 0x11
	bl box_print
	b _08146038
	.align 2, 0
_08145E34: .4byte gUnknown_8467068
_08145E38: .4byte 0x0000018b
_08145E3C: .4byte 0x000001dd
_08145E40:
	mov r9, r6
_08145E42:
	ldr r2, [sp, 0xC]
	lsls r4, r2, 24
	asrs r4, 24
	lsls r3, r4, 4
	adds r3, 0x2
	lsls r3, 24
	lsrs r3, 24
	ldr r0, _08145E9C @ =gUnknown_203F3C8
	ldr r2, [r0]
	movs r1, 0xB8
	lsls r1, 1
	adds r0, r2, r1
	ldr r0, [r0]
	ldrb r0, [r0]
	lsrs r0, 4
	lsls r1, r0, 1
	adds r1, r0
	ldr r0, _08145EA0 @ =gUnknown_8467068
	adds r1, r0
	str r1, [sp]
	movs r0, 0
	str r0, [sp, 0x4]
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r4
	movs r1, 0xF2
	lsls r1, 1
	adds r0, r1
	adds r2, r0
	str r2, [sp, 0x8]
	mov r2, r9
	lsrs r0, r2, 24
	movs r1, 0x3
	movs r2, 0
	bl box_print
	adds r4, 0x1
	lsls r4, 24
	lsrs r0, r4, 24
	str r0, [sp, 0xC]
	asrs r4, 24
	cmp r4, 0x3
	ble _08145E42
	b _08146038
	.align 2, 0
_08145E9C: .4byte gUnknown_203F3C8
_08145EA0: .4byte gUnknown_8467068
_08145EA4:
	ldr r4, _08145F2C @ =gUnknown_8467070
	ldr r2, [r7]
	ldrb r0, [r2, 0x8]
	lsls r0, 30
	lsrs r0, 30
	adds r0, r4
	ldrb r3, [r0]
	movs r1, 0xB8
	lsls r1, 1
	adds r0, r2, r1
	ldr r0, [r0]
	ldrb r0, [r0, 0x1]
	lsls r0, 28
	lsrs r0, 28
	lsls r1, r0, 1
	adds r1, r0
	ldr r0, _08145F30 @ =gUnknown_8467068
	mov r10, r0
	add r1, r10
	str r1, [sp]
	ldr r1, [sp, 0xC]
	str r1, [sp, 0x4]
	movs r1, 0xA2
	lsls r1, 2
	adds r0, r2, r1
	str r0, [sp, 0x8]
	adds r0, r5, 0
	movs r1, 0x3
	movs r2, 0
	bl box_print
	ldr r2, [r7]
	ldrb r1, [r2, 0x8]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0x2
	beq _08145F38
	lsls r0, r1, 30
	lsrs r0, 30
	adds r0, r4
	ldrb r3, [r0]
	adds r3, 0x10
	lsls r3, 24
	lsrs r3, 24
	movs r1, 0xB8
	lsls r1, 1
	adds r0, r2, r1
	ldr r0, [r0]
	ldrb r1, [r0, 0x1]
	lsls r1, 28
	lsrs r1, 28
	lsls r0, r1, 1
	adds r0, r1
	add r0, r10
	str r0, [sp]
	ldr r0, [sp, 0xC]
	str r0, [sp, 0x4]
	ldr r1, _08145F34 @ =0x000002b1
	adds r0, r2, r1
	str r0, [sp, 0x8]
	adds r0, r5, 0
	movs r1, 0x3
	movs r2, 0
	bl box_print
	mov r9, r6
	b _08146038
	.align 2, 0
_08145F2C: .4byte gUnknown_8467070
_08145F30: .4byte gUnknown_8467068
_08145F34: .4byte 0x000002b1
_08145F38:
	movs r2, 0
	mov r8, r2
	lsls r0, r1, 30
	lsrs r0, 30
	adds r0, r4
	ldrb r0, [r0]
	adds r4, r0, 0
	adds r4, 0x10
	movs r0, 0x3
	movs r1, 0x2
	bl GetFontAttribute
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, [r7]
	ldr r1, _08146054 @ =0x00000175
	adds r0, r1
	mov r9, r6
	ldr r1, [sp, 0xC]
	ldrb r0, [r0]
	cmp r1, r0
	bge _08146038
	str r5, [sp, 0x10]
	lsls r0, r4, 24
	lsrs r0, 24
	str r0, [sp, 0x14]
	mov r10, r2
_08145F6E:
	mov r0, r8
	lsls r2, r0, 24
	lsrs r2, 24
	ldr r3, [r7]
	movs r1, 0xB8
	lsls r1, 1
	adds r0, r3, r1
	ldr r0, [r0]
	ldrb r1, [r0, 0x1]
	lsls r1, 28
	lsrs r1, 28
	lsls r0, r1, 1
	adds r0, r1
	ldr r1, _08146058 @ =gUnknown_8467068
	adds r0, r1
	str r0, [sp]
	movs r0, 0
	str r0, [sp, 0x4]
	ldr r1, [sp, 0xC]
	lsls r0, r1, 24
	asrs r6, r0, 24
	lsls r0, r6, 1
	adds r0, r6
	lsls r5, r0, 4
	movs r0, 0xB7
	lsls r0, 2
	adds r4, r5, r0
	adds r3, r4
	adds r3, 0x1
	str r3, [sp, 0x8]
	ldr r0, [sp, 0x10]
	movs r1, 0x3
	ldr r3, [sp, 0x14]
	bl box_print
	ldr r1, [r7]
	adds r0, r1, r5
	ldr r2, _0814605C @ =0x00000306
	adds r0, r2
	ldrb r0, [r0]
	cmp r0, 0xFF
	beq _08146022
	adds r1, r4
	adds r1, 0x1
	movs r0, 0x3
	mov r2, r10
	bl sub_8005ED4
	add r8, r0
	mov r0, r8
	lsls r2, r0, 24
	lsrs r2, 24
	ldr r3, [r7]
	movs r1, 0xB8
	lsls r1, 1
	adds r0, r3, r1
	ldr r0, [r0]
	ldrb r1, [r0, 0x1]
	lsls r1, 28
	lsrs r1, 28
	lsls r0, r1, 1
	adds r0, r1
	ldr r1, _08146058 @ =gUnknown_8467068
	adds r0, r1
	str r0, [sp]
	movs r0, 0
	str r0, [sp, 0x4]
	adds r3, r4
	adds r3, 0x2A
	str r3, [sp, 0x8]
	ldr r0, [sp, 0x10]
	movs r1, 0x2
	ldr r3, [sp, 0x14]
	bl box_print
	ldr r1, [r7]
	adds r1, r4
	adds r1, 0x2A
	movs r0, 0x3
	mov r2, r10
	bl sub_8005ED4
	ldr r1, [r7]
	adds r1, r5
	movs r2, 0xB7
	lsls r2, 2
	adds r1, r2
	ldrb r1, [r1]
	adds r0, r1
	add r8, r0
_08146022:
	adds r1, r6, 0x1
	lsls r1, 24
	lsrs r0, r1, 24
	str r0, [sp, 0xC]
	asrs r1, 24
	ldr r0, [r7]
	ldr r2, _08146054 @ =0x00000175
	adds r0, r2
	ldrb r0, [r0]
	cmp r1, r0
	blt _08145F6E
_08146038:
	mov r1, r9
	lsrs r0, r1, 24
	movs r1, 0x3
	bl CopyWindowToVram
	add sp, 0x18
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08146054: .4byte 0x00000175
_08146058: .4byte gUnknown_8467068
_0814605C: .4byte 0x00000306
	thumb_func_end sub_8145D18

	thumb_func_start sub_8146060
sub_8146060: @ 8146060
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	movs r7, 0
	ldr r4, _081461BC @ =gUnknown_203F3C8
	ldr r0, [r4]
	movs r1, 0xBE
	lsls r1, 1
	adds r0, r1
	movs r1, 0xFF
	strb r1, [r0]
	ldr r0, [r4]
	movs r2, 0xA9
	lsls r2, 1
	adds r1, r0, r2
	ldrh r0, [r1]
	cmp r0, 0
	beq _081460C8
	bl sub_8096FD4
	lsls r0, 16
	lsrs r0, 16
	ldr r1, _081461C0 @ =nullsub_8
	str r7, [sp]
	str r7, [sp, 0x4]
	movs r2, 0xDC
	movs r3, 0x14
	bl sub_8096ECC
	ldr r1, [r4]
	movs r3, 0xBE
	lsls r3, 1
	adds r1, r3
	strb r0, [r1]
	ldr r2, _081461C4 @ =gUnknown_202063C
	ldr r0, [r4]
	adds r0, r3
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r2, [r0, 0x5]
	movs r1, 0xD
	negs r1, r1
	ands r1, r2
	movs r2, 0x8
	orrs r1, r2
	strb r1, [r0, 0x5]
_081460C8:
	ldr r1, [r4]
	ldrb r0, [r1, 0x9]
	cmp r0, 0
	beq _081461AC
	ldrb r1, [r1, 0x8]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0x1
	bne _081461AC
	ldr r0, _081461C8 @ =gUnknown_8467F58
	bl sub_800F034
	ldr r0, [r4]
	movs r1, 0xB8
	lsls r1, 1
	adds r0, r1
	ldr r0, [r0]
	ldrb r0, [r0, 0x1]
	lsrs r0, 4
	lsls r0, 3
	ldr r1, _081461CC @ =gUnknown_8467F60
	adds r0, r1
	bl LoadSpritePalette
	ldr r0, [r4]
	ldrb r0, [r0, 0x9]
	cmp r7, r0
	bcs _081461AC
	adds r6, r4, 0
	ldr r2, _081461D0 @ =0x0000017d
	mov r10, r2
	movs r3, 0
	mov r9, r3
	movs r0, 0xFF
	mov r8, r0
_0814610E:
	ldr r1, [r6]
	lsls r4, r7, 1
	add r1, r10
	adds r1, r4
	ldrb r0, [r1]
	mov r2, r8
	orrs r0, r2
	strb r0, [r1]
	ldr r1, [r6]
	movs r3, 0xBF
	lsls r3, 1
	adds r1, r3
	adds r1, r4
	ldrb r0, [r1]
	orrs r0, r2
	strb r0, [r1]
	lsls r1, r7, 5
	movs r0, 0xD8
	subs r5, r0, r1
	ldr r0, _081461D4 @ =gUnknown_8467FA0
	adds r1, r5, 0
	movs r2, 0x90
	movs r3, 0x8
	bl CreateSprite
	ldr r1, [r6]
	add r1, r10
	adds r1, r4
	strb r0, [r1]
	ldr r0, [r6]
	movs r1, 0xAA
	lsls r1, 1
	adds r0, r1
	adds r1, r0, r4
	ldrh r0, [r1]
	cmp r0, 0
	beq _0814619E
	bl sub_8096FD4
	lsls r0, 16
	lsrs r0, 16
	mov r2, r9
	str r2, [sp]
	str r2, [sp, 0x4]
	ldr r1, _081461C0 @ =nullsub_8
	adds r2, r5, 0
	movs r3, 0x88
	bl sub_8096ECC
	ldr r1, [r6]
	movs r3, 0xBF
	lsls r3, 1
	adds r1, r3
	adds r1, r4
	strb r0, [r1]
	ldr r0, [r6]
	adds r0, r3
	adds r0, r4
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _081461C4 @ =gUnknown_202063C
	adds r0, r1
	ldrb r2, [r0, 0x5]
	movs r3, 0xD
	negs r3, r3
	adds r1, r3, 0
	ands r2, r1
	movs r1, 0x8
	orrs r2, r1
	strb r2, [r0, 0x5]
_0814619E:
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r0, [r6]
	ldrb r0, [r0, 0x9]
	cmp r7, r0
	bcc _0814610E
_081461AC:
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081461BC: .4byte gUnknown_203F3C8
_081461C0: .4byte nullsub_8
_081461C4: .4byte gUnknown_202063C
_081461C8: .4byte gUnknown_8467F58
_081461CC: .4byte gUnknown_8467F60
_081461D0: .4byte 0x0000017d
_081461D4: .4byte gUnknown_8467FA0
	thumb_func_end sub_8146060

	thumb_func_start sub_81461D8
sub_81461D8: @ 81461D8
	push {r4-r7,lr}
	movs r6, 0
	ldr r4, _0814627C @ =gUnknown_203F3C8
	ldr r0, [r4]
	movs r2, 0xBE
	lsls r2, 1
	adds r1, r0, r2
	ldrb r0, [r1]
	cmp r0, 0xFF
	beq _081461FC
	adds r1, r0, 0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08146280 @ =gUnknown_202063C
	adds r0, r1
	bl sub_8097070
_081461FC:
	ldr r0, [r4]
	ldrb r2, [r0, 0x9]
	cmp r2, 0
	beq _08146274
	ldrb r1, [r0, 0x8]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0x1
	bne _08146274
	cmp r6, r2
	bcs _08146264
	adds r7, r4, 0
_08146214:
	ldr r0, [r7]
	lsls r4, r6, 1
	ldr r1, _08146284 @ =0x0000017d
	adds r0, r1
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, 0xFF
	beq _08146256
	adds r1, r0, 0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r5, _08146280 @ =gUnknown_202063C
	adds r0, r5
	bl DestroySprite
	ldr r1, [r7]
	ldr r2, _08146284 @ =0x0000017d
	adds r0, r1, r2
	adds r0, r4
	ldrb r0, [r0]
	cmp r0, 0xFF
	beq _08146256
	adds r2, 0x1
	adds r0, r1, r2
	adds r0, r4
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	bl sub_8097070
_08146256:
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r0, [r7]
	ldrb r0, [r0, 0x9]
	cmp r6, r0
	bcc _08146214
_08146264:
	movs r4, 0x80
	lsls r4, 8
	adds r0, r4, 0
	bl FreeSpriteTilesByTag
	adds r0, r4, 0
	bl FreeSpritePaletteByTag
_08146274:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0814627C: .4byte gUnknown_203F3C8
_08146280: .4byte gUnknown_202063C
_08146284: .4byte 0x0000017d
	thumb_func_end sub_81461D8

	thumb_func_start sub_8146288
sub_8146288: @ 8146288
	push {r4-r6,lr}
	adds r4, r0, 0
	cmp r4, 0
	beq _0814629E
	ldr r5, _081462A4 @ =gUnknown_203F3CC
	ldr r0, _081462A8 @ =0x000013a4
	bl AllocZeroed
	str r0, [r5]
	cmp r0, 0
	bne _081462AC
_0814629E:
	movs r0, 0
	b _081462DC
	.align 2, 0
_081462A4: .4byte gUnknown_203F3CC
_081462A8: .4byte 0x000013a4
_081462AC:
	movs r6, 0xDE
	lsls r6, 1
	adds r1, r4, 0
	adds r2, r6, 0
	bl memcpy
	ldr r1, [r5]
	ldrb r0, [r1, 0x3]
	cmp r0, 0x7
	bls _081462C4
	movs r0, 0
	strb r0, [r1, 0x3]
_081462C4:
	ldr r2, [r5]
	adds r3, r2, r6
	ldrb r0, [r2, 0x3]
	lsls r0, 4
	ldr r1, _081462E4 @ =gUnknown_8468720
	adds r0, r1
	str r0, [r3]
	ldr r0, _081462E8 @ =0x000001c1
	adds r1, r2, r0
	movs r0, 0xFF
	strb r0, [r1]
	movs r0, 0x1
_081462DC:
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_081462E4: .4byte gUnknown_8468720
_081462E8: .4byte 0x000001c1
	thumb_func_end sub_8146288

	thumb_func_start sub_81462EC
sub_81462EC: @ 81462EC
	push {r4,lr}
	ldr r4, _08146310 @ =gUnknown_203F3CC
	ldr r0, [r4]
	cmp r0, 0
	beq _08146308
	ldr r2, _08146314 @ =0x000013a4
	movs r1, 0
	bl memset
	ldr r0, [r4]
	bl Free
	movs r0, 0
	str r0, [r4]
_08146308:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08146310: .4byte gUnknown_203F3CC
_08146314: .4byte 0x000013a4
	thumb_func_end sub_81462EC

	thumb_func_start sub_8146318
sub_8146318: @ 8146318
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x24
	ldr r5, _08146334 @ =gUnknown_203F3CC
	ldr r0, [r5]
	cmp r0, 0
	bne _08146338
	movs r0, 0x1
	negs r0, r0
	b _081465EE
	.align 2, 0
_08146334: .4byte gUnknown_203F3CC
_08146338:
	movs r4, 0xE0
	lsls r4, 1
	adds r0, r4
	ldrb r0, [r0]
	lsrs r0, 1
	cmp r0, 0x6
	bls _08146348
	b _081465B8
_08146348:
	lsls r0, 2
	ldr r1, _08146354 @ =_08146358
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08146354: .4byte _08146358
	.align 2, 0
_08146358:
	.4byte _08146374
	.4byte _08146386
	.4byte _081463EC
	.4byte _08146494
	.4byte _08146544
	.4byte _0814654A
	.4byte _0814655C
_08146374:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	b _081465D2
_08146386:
	bl UpdatePaletteFade
	lsls r0, 24
	cmp r0, 0
	beq _08146392
	b _081465EC
_08146392:
	movs r0, 0
	movs r1, 0
	movs r2, 0
	bl ChangeBgY
	movs r0, 0x1
	movs r1, 0
	movs r2, 0
	bl ChangeBgY
	movs r0, 0x2
	movs r1, 0
	movs r2, 0
	bl ChangeBgY
	movs r0, 0x3
	movs r1, 0
	movs r2, 0
	bl ChangeBgY
	movs r0, 0x40
	movs r1, 0xF0
	bl SetGpuReg
	ldr r1, _081463E8 @ =0x00001a98
	movs r0, 0x44
	bl SetGpuReg
	movs r0, 0x48
	movs r1, 0x1F
	bl SetGpuReg
	movs r0, 0x4A
	movs r1, 0x1B
	bl SetGpuReg
	movs r1, 0x80
	lsls r1, 6
	movs r0, 0
	bl SetGpuRegBits
	b _081465D2
	.align 2, 0
_081463E8: .4byte 0x00001a98
_081463EC:
	movs r5, 0x1E
	str r5, [sp]
	movs r4, 0x14
	str r4, [sp, 0x4]
	movs r0, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect_Palette0
	str r5, [sp]
	str r4, [sp, 0x4]
	movs r0, 0x1
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect_Palette0
	str r5, [sp]
	str r4, [sp, 0x4]
	movs r0, 0x2
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect_Palette0
	str r5, [sp]
	str r4, [sp, 0x4]
	movs r0, 0x3
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect_Palette0
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	movs r0, 0x1
	bl CopyBgTilemapBufferToVram
	movs r0, 0x2
	bl CopyBgTilemapBufferToVram
	movs r0, 0x3
	bl CopyBgTilemapBufferToVram
	ldr r5, _0814648C @ =gUnknown_203F3CC
	ldr r0, [r5]
	movs r1, 0xDE
	lsls r1, 1
	adds r0, r1
	ldr r0, [r0]
	ldr r1, [r0, 0x4]
	movs r0, 0
	str r0, [sp]
	movs r0, 0x3
	movs r2, 0
	movs r3, 0x8
	bl decompress_and_copy_tile_data_to_vram
	ldr r4, _08146490 @ =gUnknown_8468040
	adds r0, r4, 0
	bl AddWindow
	ldr r1, [r5]
	movs r2, 0xE4
	lsls r2, 1
	adds r1, r2
	strh r0, [r1]
	adds r4, 0x8
	adds r0, r4, 0
	bl AddWindow
	ldr r1, [r5]
	movs r3, 0xE5
	lsls r3, 1
	adds r1, r3
	strh r0, [r1]
	b _081465D2
	.align 2, 0
_0814648C: .4byte gUnknown_203F3CC
_08146490: .4byte gUnknown_8468040
_08146494:
	bl free_temp_tile_data_buffers_if_possible
	lsls r0, 24
	lsrs r7, r0, 24
	cmp r7, 0
	beq _081464A2
	b _081465EC
_081464A2:
	ldr r2, _0814653C @ =gUnknown_2037AB8
	ldrb r0, [r2, 0x8]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2, 0x8]
	ldr r0, _08146540 @ =gUnknown_203F3CC
	mov r8, r0
	ldr r0, [r0]
	movs r4, 0xDE
	lsls r4, 1
	adds r0, r4
	ldr r0, [r0]
	ldr r0, [r0, 0xC]
	movs r1, 0x10
	movs r2, 0x20
	bl LoadPalette
	mov r2, r8
	ldr r1, [r2]
	adds r4, r1, r4
	ldr r0, [r4]
	ldr r0, [r0, 0x8]
	movs r6, 0xE9
	lsls r6, 2
	adds r1, r6
	bl LZ77UnCompWram
	mov r3, r8
	ldr r1, [r3]
	adds r1, r6
	movs r4, 0x1E
	str r4, [sp]
	movs r5, 0x3
	str r5, [sp, 0x4]
	str r7, [sp, 0x8]
	str r7, [sp, 0xC]
	str r4, [sp, 0x10]
	str r5, [sp, 0x14]
	movs r0, 0x1
	mov r10, r0
	str r0, [sp, 0x18]
	movs r2, 0x8
	mov r9, r2
	str r2, [sp, 0x1C]
	str r7, [sp, 0x20]
	movs r2, 0
	movs r3, 0
	bl CopyRectToBgTilemapBufferRect
	mov r3, r8
	ldr r1, [r3]
	adds r1, r6
	str r4, [sp]
	movs r0, 0x17
	str r0, [sp, 0x4]
	str r7, [sp, 0x8]
	str r5, [sp, 0xC]
	str r4, [sp, 0x10]
	str r0, [sp, 0x14]
	mov r0, r10
	str r0, [sp, 0x18]
	mov r2, r9
	str r2, [sp, 0x1C]
	str r7, [sp, 0x20]
	movs r0, 0x3
	movs r2, 0
	movs r3, 0x3
	bl CopyRectToBgTilemapBufferRect
	movs r0, 0x1
	bl CopyBgTilemapBufferToVram
	movs r0, 0x3
	bl CopyBgTilemapBufferToVram
	b _081465D2
	.align 2, 0
_0814653C: .4byte gUnknown_2037AB8
_08146540: .4byte gUnknown_203F3CC
_08146544:
	bl sub_8146980
	b _081465D2
_0814654A:
	bl sub_8146A30
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	movs r0, 0x2
	bl CopyBgTilemapBufferToVram
	b _081465D2
_0814655C:
	movs r0, 0x1
	bl ShowBg
	movs r0, 0x2
	bl ShowBg
	movs r0, 0x3
	bl ShowBg
	ldr r2, _081465AC @ =gUnknown_2037AB8
	ldrb r1, [r2, 0x8]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r2, 0x8]
	ldr r4, _081465B0 @ =gUnknown_203F3CC
	ldr r1, [r4]
	movs r3, 0xE5
	lsls r3, 2
	adds r0, r1, r3
	movs r2, 0xE3
	lsls r2, 1
	adds r1, r2
	bl AddScrollIndicatorArrowPair
	ldr r1, [r4]
	ldr r3, _081465B4 @ =0x000001c1
	adds r2, r1, r3
	movs r1, 0
	strb r0, [r2]
	movs r0, 0x1
	negs r0, r0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	bl UpdatePaletteFade
	b _081465D2
	.align 2, 0
_081465AC: .4byte gUnknown_2037AB8
_081465B0: .4byte gUnknown_203F3CC
_081465B4: .4byte 0x000001c1
_081465B8:
	bl UpdatePaletteFade
	lsls r0, 24
	cmp r0, 0
	bne _081465EC
	ldr r0, [r5]
	adds r0, r4
	ldrb r2, [r0]
	movs r1, 0x1
	ands r1, r2
	strb r1, [r0]
	movs r0, 0x1
	b _081465EE
_081465D2:
	ldr r0, _08146600 @ =gUnknown_203F3CC
	ldr r2, [r0]
	movs r0, 0xE0
	lsls r0, 1
	adds r2, r0
	ldrb r3, [r2]
	lsrs r1, r3, 1
	adds r1, 0x1
	lsls r1, 1
	movs r0, 0x1
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
_081465EC:
	movs r0, 0
_081465EE:
	add sp, 0x24
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08146600: .4byte gUnknown_203F3CC
	thumb_func_end sub_8146318

	thumb_func_start sub_8146604
sub_8146604: @ 8146604
	push {r4,r5,lr}
	sub sp, 0x8
	adds r2, r0, 0
	ldr r5, _08146618 @ =gUnknown_203F3CC
	ldr r0, [r5]
	cmp r0, 0
	bne _0814661C
	movs r0, 0x1
	negs r0, r0
	b _081467E0
	.align 2, 0
_08146618: .4byte gUnknown_203F3CC
_0814661C:
	movs r4, 0xE0
	lsls r4, 1
	adds r0, r4
	ldrb r0, [r0]
	lsrs r0, 1
	cmp r0, 0x6
	bls _0814662C
	b _081467AA
_0814662C:
	lsls r0, 2
	ldr r1, _08146638 @ =_0814663C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08146638: .4byte _0814663C
	.align 2, 0
_0814663C:
	.4byte _08146658
	.4byte _0814666A
	.4byte _081466AC
	.4byte _0814670C
	.4byte _0814673C
	.4byte _08146778
	.4byte _08146788
_08146658:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	b _081467C4
_0814666A:
	bl UpdatePaletteFade
	lsls r0, 24
	cmp r0, 0
	beq _08146676
	b _081467DE
_08146676:
	movs r0, 0x2
	movs r1, 0
	movs r2, 0
	bl ChangeBgY
	movs r0, 0x40
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x44
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x48
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x4A
	movs r1, 0
	bl SetGpuReg
	movs r1, 0x80
	lsls r1, 6
	movs r0, 0
	bl ClearGpuRegBits
	b _081467C4
_081466AC:
	movs r4, 0x1E
	str r4, [sp]
	movs r5, 0x14
	str r5, [sp, 0x4]
	movs r0, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect_Palette0
	str r4, [sp]
	str r5, [sp, 0x4]
	movs r0, 0x1
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect_Palette0
	str r4, [sp]
	movs r5, 0x18
	str r5, [sp, 0x4]
	movs r0, 0x2
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect_Palette0
	str r4, [sp]
	str r5, [sp, 0x4]
	movs r0, 0x3
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect_Palette0
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	movs r0, 0x1
	bl CopyBgTilemapBufferToVram
	movs r0, 0x2
	bl CopyBgTilemapBufferToVram
	movs r0, 0x3
	bl CopyBgTilemapBufferToVram
	b _081467C4
_0814670C:
	movs r0, 0x1
	bl HideBg
	movs r0, 0x2
	bl HideBg
	ldr r4, _08146738 @ =gUnknown_203F3CC
	ldr r0, [r4]
	movs r1, 0xE5
	lsls r1, 1
	adds r0, r1
	ldrb r0, [r0]
	bl RemoveWindow
	ldr r0, [r4]
	movs r2, 0xE4
	lsls r2, 1
	adds r0, r2
	ldrb r0, [r0]
	bl RemoveWindow
	b _081467C4
	.align 2, 0
_08146738: .4byte gUnknown_203F3CC
_0814673C:
	movs r0, 0x2
	movs r1, 0
	movs r2, 0
	bl ChangeBgY
	movs r0, 0x3
	movs r1, 0
	movs r2, 0
	bl ChangeBgY
	ldr r4, _08146770 @ =gUnknown_203F3CC
	ldr r0, [r4]
	ldr r2, _08146774 @ =0x000001c1
	adds r1, r0, r2
	ldrb r0, [r1]
	cmp r0, 0xFF
	beq _081467C4
	bl RemoveScrollIndicatorArrowPair
	ldr r0, [r4]
	ldr r2, _08146774 @ =0x000001c1
	adds r1, r0, r2
	movs r0, 0xFF
	strb r0, [r1]
	b _081467C4
	.align 2, 0
_08146770: .4byte gUnknown_203F3CC
_08146774: .4byte 0x000001c1
_08146778:
	ldr r0, _08146784 @ =gUnknown_203F3B8
	ldrb r0, [r0]
	adds r1, r2, 0
	bl sub_8142344
	b _081467C4
	.align 2, 0
_08146784: .4byte gUnknown_203F3B8
_08146788:
	bl sub_8142420
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	movs r0, 0x3
	bl CopyBgTilemapBufferToVram
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	b _081467C4
_081467AA:
	bl UpdatePaletteFade
	lsls r0, 24
	cmp r0, 0
	bne _081467DE
	ldr r0, [r5]
	adds r0, r4
	ldrb r2, [r0]
	movs r1, 0x1
	ands r1, r2
	strb r1, [r0]
	movs r0, 0x1
	b _081467E0
_081467C4:
	ldr r0, _081467E8 @ =gUnknown_203F3CC
	ldr r2, [r0]
	movs r0, 0xE0
	lsls r0, 1
	adds r2, r0
	ldrb r3, [r2]
	lsrs r1, r3, 1
	adds r1, 0x1
	lsls r1, 1
	movs r0, 0x1
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
_081467DE:
	movs r0, 0
_081467E0:
	add sp, 0x8
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_081467E8: .4byte gUnknown_203F3CC
	thumb_func_end sub_8146604

	thumb_func_start sub_81467EC
sub_81467EC: @ 81467EC
	push {r4,r5,lr}
	ldr r4, _0814682C @ =gUnknown_203F3CC
	ldr r2, [r4]
	movs r5, 0xE0
	lsls r5, 1
	adds r0, r2, r5
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _08146826
	ldr r0, _08146830 @ =0x000001c1
	adds r1, r2, r0
	ldrb r0, [r1]
	cmp r0, 0xFF
	beq _08146826
	bl RemoveScrollIndicatorArrowPair
	ldr r0, [r4]
	ldr r2, _08146830 @ =0x000001c1
	adds r1, r0, r2
	movs r0, 0xFF
	strb r0, [r1]
	ldr r1, [r4]
	adds r1, r5
	ldrb r0, [r1]
	movs r2, 0x1
	orrs r0, r2
	strb r0, [r1]
_08146826:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0814682C: .4byte gUnknown_203F3CC
_08146830: .4byte 0x000001c1
	thumb_func_end sub_81467EC

	thumb_func_start sub_8146834
sub_8146834: @ 8146834
	push {r4,lr}
	ldr r4, _0814687C @ =gUnknown_203F3CC
	ldr r2, [r4]
	movs r1, 0xE0
	lsls r1, 1
	adds r0, r2, r1
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08146874
	movs r3, 0xE5
	lsls r3, 2
	adds r0, r2, r3
	movs r3, 0xE3
	lsls r3, 1
	adds r1, r2, r3
	bl AddScrollIndicatorArrowPair
	ldr r1, [r4]
	ldr r2, _08146880 @ =0x000001c1
	adds r1, r2
	strb r0, [r1]
	ldr r1, [r4]
	movs r3, 0xE0
	lsls r3, 1
	adds r1, r3
	ldrb r2, [r1]
	movs r0, 0x2
	negs r0, r0
	ands r0, r2
	strb r0, [r1]
_08146874:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0814687C: .4byte gUnknown_203F3CC
_08146880: .4byte 0x000001c1
	thumb_func_end sub_8146834

	thumb_func_start sub_8146884
sub_8146884: @ 8146884
	push {r4-r6,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	adds r3, r4, 0
	ldr r2, _081468B0 @ =gUnknown_203F3CC
	ldr r0, [r2]
	mov r12, r0
	movs r0, 0xE1
	lsls r0, 1
	add r0, r12
	ldrb r1, [r0]
	movs r5, 0x1
	adds r0, r5, 0
	ands r0, r1
	adds r6, r2, 0
	cmp r0, 0
	beq _081468B4
	bl sub_8146B58
_081468AA:
	movs r0, 0xFF
	b _0814697A
	.align 2, 0
_081468B0: .4byte gUnknown_203F3CC
_081468B4:
	cmp r4, 0x2
	beq _081468D0
	cmp r4, 0x2
	bgt _081468C2
	cmp r4, 0x1
	beq _081468CC
	b _081468AA
_081468C2:
	cmp r3, 0x40
	beq _081468D4
	cmp r3, 0x80
	beq _08146904
	b _081468AA
_081468CC:
	movs r0, 0
	b _0814697A
_081468D0:
	movs r0, 0x1
	b _0814697A
_081468D4:
	movs r0, 0xE3
	lsls r0, 1
	add r0, r12
	ldrh r0, [r0]
	cmp r0, 0
	beq _081468AA
	movs r0, 0xE0
	lsls r0, 1
	add r0, r12
	ldrb r1, [r0]
	adds r0, r5, 0
	ands r0, r1
	cmp r0, 0
	bne _081468AA
	ldr r2, _08146900 @ =0x000001c3
	add r2, r12
	ldrb r1, [r2]
	movs r0, 0x2
	negs r0, r0
	ands r0, r1
	b _08146932
	.align 2, 0
_08146900: .4byte 0x000001c3
_08146904:
	movs r0, 0xE3
	lsls r0, 1
	add r0, r12
	movs r1, 0xE2
	lsls r1, 1
	add r1, r12
	ldrh r0, [r0]
	ldrh r1, [r1]
	cmp r0, r1
	beq _081468AA
	movs r0, 0xE0
	lsls r0, 1
	add r0, r12
	ldrb r1, [r0]
	adds r0, r5, 0
	ands r0, r1
	cmp r0, 0
	bne _081468AA
	ldr r2, _08146974 @ =0x000001c3
	add r2, r12
	ldrb r0, [r2]
	movs r1, 0x1
	orrs r0, r1
_08146932:
	strb r0, [r2]
	ldr r2, [r6]
	movs r4, 0xE1
	lsls r4, 1
	adds r2, r4
	ldrb r0, [r2]
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2]
	ldr r3, [r6]
	adds r3, r4
	ldrb r1, [r3]
	movs r2, 0x1
	adds r0, r2, 0
	ands r0, r1
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r3]
	ldr r1, [r6]
	adds r4, 0x1
	adds r1, r4
	ldrb r3, [r1]
	adds r0, r2, 0
	ands r0, r3
	strb r0, [r1]
	ldr r0, [r6]
	adds r0, r4
	ldrb r0, [r0]
	ands r2, r0
	cmp r2, 0
	beq _08146978
	movs r0, 0x3
	b _0814697A
	.align 2, 0
_08146974: .4byte 0x000001c3
_08146978:
	movs r0, 0x2
_0814697A:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_8146884

	thumb_func_start sub_8146980
sub_8146980: @ 8146980
	push {r4-r6,lr}
	movs r5, 0
	ldr r4, _08146A20 @ =gUnknown_203F3CC
	ldr r1, [r4]
	movs r2, 0xE7
	lsls r2, 1
	adds r0, r1, r2
	adds r1, 0x4
	movs r2, 0x28
	bl memcpy
	ldr r0, [r4]
	movs r3, 0xFB
	lsls r3, 1
	adds r1, r0, r3
	movs r0, 0xFF
	strb r0, [r1]
	adds r6, r4, 0
_081469A4:
	ldr r2, [r6]
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r4, r1, r5
	adds r0, r4, r2
	ldr r3, _08146A24 @ =0x000001f7
	adds r0, r3
	adds r1, r2
	adds r1, 0x2C
	movs r2, 0x28
	bl memcpy
	ldr r0, [r6]
	ldr r1, _08146A28 @ =0x0000021f
	adds r0, r1
	adds r0, r4
	movs r1, 0xFF
	strb r1, [r0]
	cmp r5, 0x7
	bls _081469E8
	ldr r1, [r6]
	ldr r2, _08146A24 @ =0x000001f7
	adds r0, r1, r2
	adds r0, r4
	ldrb r0, [r0]
	cmp r0, 0xFF
	beq _081469E8
	movs r3, 0xE2
	lsls r3, 1
	adds r1, r3
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_081469E8:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x9
	bls _081469A4
	ldr r2, _08146A20 @ =gUnknown_203F3CC
	ldr r1, [r2]
	movs r4, 0xE5
	lsls r4, 2
	adds r1, r4
	ldr r0, _08146A2C @ =gUnknown_8468050
	ldm r0!, {r3-r5}
	stm r1!, {r3-r5}
	ldr r0, [r0]
	str r0, [r1]
	ldr r2, [r2]
	movs r5, 0xE2
	lsls r5, 1
	adds r0, r2, r5
	ldrh r1, [r0]
	movs r3, 0xE7
	lsls r3, 2
	adds r0, r2, r3
	strh r1, [r0]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08146A20: .4byte gUnknown_203F3CC
_08146A24: .4byte 0x000001f7
_08146A28: .4byte 0x0000021f
_08146A2C: .4byte gUnknown_8468050
	thumb_func_end sub_8146980

	thumb_func_start sub_8146A30
sub_8146A30: @ 8146A30
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0xC
	movs r5, 0
	ldr r6, _08146B4C @ =gUnknown_203F3CC
	ldr r0, [r6]
	movs r7, 0xE4
	lsls r7, 1
	adds r0, r7
	ldrb r0, [r0]
	bl PutWindowTilemap
	ldr r0, [r6]
	movs r4, 0xE5
	lsls r4, 1
	adds r0, r4
	ldrb r0, [r0]
	bl PutWindowTilemap
	ldr r0, [r6]
	adds r0, r7
	ldrb r0, [r0]
	movs r1, 0
	bl FillWindowPixelBuffer
	ldr r0, [r6]
	adds r0, r4
	ldrb r0, [r0]
	movs r1, 0
	bl FillWindowPixelBuffer
	ldr r4, [r6]
	movs r0, 0xE7
	lsls r0, 1
	mov r8, r0
	add r4, r8
	movs r0, 0x3
	movs r1, 0x2
	bl GetFontAttribute
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	movs r0, 0x3
	adds r1, r4, 0
	bl sub_8005ED4
	movs r1, 0xE0
	subs r1, r0
	lsrs r0, r1, 31
	adds r1, r0
	asrs r1, 1
	cmp r1, 0
	bge _08146AA0
	movs r1, 0
_08146AA0:
	ldr r4, [r6]
	adds r0, r4, r7
	ldrb r0, [r0]
	lsls r2, r1, 24
	lsrs r2, 24
	movs r3, 0xDE
	lsls r3, 1
	adds r1, r4, r3
	ldr r1, [r1]
	ldrb r1, [r1]
	lsls r1, 28
	lsrs r1, 28
	lsls r3, r1, 1
	adds r3, r1
	ldr r1, _08146B50 @ =gUnknown_8468038
	adds r3, r1
	str r3, [sp]
	str r5, [sp, 0x4]
	add r4, r8
	str r4, [sp, 0x8]
	movs r1, 0x3
	movs r3, 0x6
	bl box_print
_08146AD0:
	ldr r6, _08146B4C @ =gUnknown_203F3CC
	ldr r4, [r6]
	movs r1, 0xE5
	lsls r1, 1
	adds r0, r4, r1
	ldrb r0, [r0]
	lsls r3, r5, 4
	adds r3, 0x2
	lsls r3, 24
	lsrs r3, 24
	movs r2, 0xDE
	lsls r2, 1
	adds r1, r4, r2
	ldr r1, [r1]
	ldrb r1, [r1]
	lsrs r1, 4
	lsls r2, r1, 1
	adds r2, r1
	ldr r1, _08146B50 @ =gUnknown_8468038
	adds r2, r1
	str r2, [sp]
	movs r1, 0
	str r1, [sp, 0x4]
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r5
	ldr r2, _08146B54 @ =0x000001f7
	adds r1, r2
	adds r4, r1
	str r4, [sp, 0x8]
	movs r1, 0x3
	movs r2, 0
	bl box_print
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x9
	bls _08146AD0
	ldr r0, [r6]
	movs r3, 0xE4
	lsls r3, 1
	adds r0, r3
	ldrb r0, [r0]
	movs r1, 0x3
	bl CopyWindowToVram
	ldr r0, [r6]
	movs r1, 0xE5
	lsls r1, 1
	adds r0, r1
	ldrb r0, [r0]
	movs r1, 0x3
	bl CopyWindowToVram
	add sp, 0xC
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08146B4C: .4byte gUnknown_203F3CC
_08146B50: .4byte gUnknown_8468038
_08146B54: .4byte 0x000001f7
	thumb_func_end sub_8146A30

	thumb_func_start sub_8146B58
sub_8146B58: @ 8146B58
	push {r4-r6,lr}
	ldr r0, _08146B90 @ =gUnknown_203F3CC
	ldr r1, [r0]
	movs r2, 0xE1
	lsls r2, 1
	adds r0, r1, r2
	ldrb r0, [r0]
	lsrs r4, r0, 1
	lsls r4, 8
	ldr r6, _08146B94 @ =0x000001c3
	adds r0, r1, r6
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08146B98
	movs r0, 0x2
	adds r1, r4, 0
	movs r2, 0x1
	bl ChangeBgY
	movs r0, 0x3
	adds r1, r4, 0
	movs r2, 0x1
	bl ChangeBgY
	b _08146BAC
	.align 2, 0
_08146B90: .4byte gUnknown_203F3CC
_08146B94: .4byte 0x000001c3
_08146B98:
	movs r0, 0x2
	adds r1, r4, 0
	movs r2, 0x2
	bl ChangeBgY
	movs r0, 0x3
	adds r1, r4, 0
	movs r2, 0x2
	bl ChangeBgY
_08146BAC:
	ldr r3, _08146BF0 @ =gUnknown_203F3CC
	ldr r0, [r3]
	ldr r2, _08146BF4 @ =0x000001c3
	adds r5, r0, r2
	ldrb r4, [r5]
	lsrs r1, r4, 1
	movs r6, 0xE1
	lsls r6, 1
	adds r0, r6
	ldrb r0, [r0]
	lsrs r0, 1
	adds r1, r0
	lsls r1, 1
	movs r6, 0x1
	adds r0, r6, 0
	ands r0, r4
	orrs r0, r1
	strb r0, [r5]
	ldr r1, [r3]
	adds r2, r1, r2
	ldrb r2, [r2]
	lsrs r0, r2, 1
	cmp r0, 0xF
	bls _08146C24
	adds r0, r6, 0
	ands r0, r2
	cmp r0, 0
	beq _08146BF8
	movs r0, 0xE3
	lsls r0, 1
	adds r1, r0
	ldrh r0, [r1]
	adds r0, 0x1
	b _08146C02
	.align 2, 0
_08146BF0: .4byte gUnknown_203F3CC
_08146BF4: .4byte 0x000001c3
_08146BF8:
	movs r2, 0xE3
	lsls r2, 1
	adds r1, r2
	ldrh r0, [r1]
	subs r0, 0x1
_08146C02:
	strh r0, [r1]
	ldr r0, [r3]
	movs r6, 0xE1
	lsls r6, 1
	adds r2, r0, r6
	ldrb r1, [r2]
	movs r0, 0x2
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	ldr r0, [r3]
	ldr r1, _08146C2C @ =0x000001c3
	adds r2, r0, r1
	ldrb r1, [r2]
	movs r0, 0x1
	ands r0, r1
	strb r0, [r2]
_08146C24:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08146C2C: .4byte 0x000001c3
	thumb_func_end sub_8146B58

	.align 2, 0 @ Don't pad with nop.
