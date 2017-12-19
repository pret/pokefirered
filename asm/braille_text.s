	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start Font6Func
Font6Func: @ 814F884
	push {r4-r6,lr}
	adds r6, r0, 0
	adds r4, r6, 0
	adds r4, 0x14
	ldrb r0, [r6, 0x1C]
	cmp r0, 0x6
	bls _0814F894
	b _0814FC94
_0814F894:
	lsls r0, 2
	ldr r1, _0814F8A0 @ =_0814F8A4
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0814F8A0: .4byte _0814F8A4
	.align 2, 0
_0814F8A4:
	.4byte _0814F8C0
	.4byte _0814FB88
	.4byte _0814FB9A
	.4byte _0814FBC4
	.4byte _0814FBFC
	.4byte _0814FC70
	.4byte _0814FC82
_0814F8C0:
	ldr r2, _0814F914 @ =gMain
	ldrh r1, [r2, 0x2C]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0
	beq _0814F8DA
	ldrb r1, [r4]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _0814F8DA
	movs r0, 0
	strb r0, [r6, 0x1E]
_0814F8DA:
	ldrb r1, [r6, 0x1E]
	cmp r1, 0
	beq _0814F91C
	ldrb r0, [r6, 0x1D]
	cmp r0, 0
	beq _0814F91C
	subs r0, r1, 0x1
	strb r0, [r6, 0x1E]
	ldr r0, _0814F918 @ =gTextFlags
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _0814F8F8
	b _0814FB42
_0814F8F8:
	ldrh r1, [r2, 0x2E]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0
	bne _0814F904
	b _0814FB42
_0814F904:
	ldrb r0, [r4]
	movs r1, 0x10
	orrs r0, r1
	strb r0, [r4]
	movs r0, 0
	strb r0, [r6, 0x1E]
	b _0814FB42
	.align 2, 0
_0814F914: .4byte gMain
_0814F918: .4byte gTextFlags
_0814F91C:
	ldr r2, _0814F92C @ =gTextFlags
	ldrb r1, [r2]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _0814F930
	movs r0, 0x1
	b _0814F932
	.align 2, 0
_0814F92C: .4byte gTextFlags
_0814F930:
	ldrb r0, [r6, 0x1D]
_0814F932:
	strb r0, [r6, 0x1E]
	ldr r0, [r6]
	ldrb r3, [r0]
	adds r0, 0x1
	str r0, [r6]
	adds r0, r3, 0
	subs r0, 0xF8
	cmp r0, 0x7
	bls _0814F946
	b _0814FB62
_0814F946:
	lsls r0, 2
	ldr r1, _0814F950 @ =_0814F954
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0814F950: .4byte _0814F954
	.align 2, 0
_0814F954:
	.4byte _0814FB58
	.4byte _0814FB46
	.4byte _0814FB38
	.4byte _0814FB34
	.4byte _0814F9A2
	.4byte _0814F99C
	.4byte _0814F974
	.4byte _0814FC94
_0814F974:
	ldrb r0, [r6, 0x6]
	strb r0, [r6, 0x8]
	ldrb r1, [r6, 0x5]
	ldr r0, _0814F998 @ =gFonts
	ldr r2, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r6, 0xB]
	ldrb r0, [r0, 0x5]
	adds r1, r0
	ldrb r0, [r6, 0x9]
	adds r0, r1
	strb r0, [r6, 0x9]
_0814F992:
	movs r0, 0x2
	b _0814FC96
	.align 2, 0
_0814F998: .4byte gFonts
_0814F99C:
	ldr r0, [r6]
	adds r0, 0x1
	b _0814FAF8
_0814F9A2:
	ldr r0, [r6]
	ldrb r3, [r0]
	adds r0, 0x1
	str r0, [r6]
	subs r0, r3, 0x1
	cmp r0, 0xF
	bls _0814F9B2
	b _0814FB62
_0814F9B2:
	lsls r0, 2
	ldr r1, _0814F9BC @ =_0814F9C0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0814F9BC: .4byte _0814F9C0
	.align 2, 0
_0814F9C0:
	.4byte _0814FA00
	.4byte _0814FA22
	.4byte _0814FA46
	.4byte _0814FA60
	.4byte _0814FAAC
	.4byte _0814FAB2
	.4byte _0814F992
	.4byte _0814FACC
	.4byte _0814FADC
	.4byte _0814FAF0
	.4byte _0814FAF4
	.4byte _0814FAFC
	.4byte _0814FB06
	.4byte _0814FB12
	.4byte _0814FB22
	.4byte _0814FAF4
_0814FA00:
	ldr r2, [r6]
	ldrb r1, [r2]
	lsls r1, 4
	ldrb r3, [r6, 0xC]
	movs r0, 0xF
	ands r0, r3
	orrs r0, r1
	strb r0, [r6, 0xC]
	adds r2, 0x1
	str r2, [r6]
	lsls r0, 24
	lsrs r0, 28
	ldrb r2, [r6, 0xD]
	lsls r1, r2, 28
	lsrs r1, 28
	lsrs r2, 4
	b _0814FAA6
_0814FA22:
	ldr r1, [r6]
	ldrb r2, [r1]
	movs r0, 0xF
	ands r0, r2
	ldrb r3, [r6, 0xD]
	movs r2, 0x10
	negs r2, r2
	ands r2, r3
	orrs r2, r0
	strb r2, [r6, 0xD]
	adds r1, 0x1
	str r1, [r6]
	ldrb r0, [r6, 0xC]
	lsrs r0, 4
	lsls r1, r2, 28
	lsrs r1, 28
	lsrs r2, 4
	b _0814FAA6
_0814FA46:
	ldr r1, [r6]
	ldrb r0, [r1]
	lsls r0, 4
	ldrb r3, [r6, 0xD]
	movs r2, 0xF
	ands r2, r3
	orrs r2, r0
	strb r2, [r6, 0xD]
	adds r1, 0x1
	str r1, [r6]
	ldrb r0, [r6, 0xC]
	lsrs r0, 4
	b _0814FA9E
_0814FA60:
	ldr r3, [r6]
	ldrb r1, [r3]
	lsls r1, 4
	ldrb r4, [r6, 0xC]
	movs r2, 0xF
	adds r0, r2, 0
	ands r0, r4
	orrs r0, r1
	strb r0, [r6, 0xC]
	adds r5, r3, 0x1
	str r5, [r6]
	ldrb r3, [r3, 0x1]
	adds r1, r2, 0
	ands r1, r3
	ldrb r4, [r6, 0xD]
	movs r3, 0x10
	negs r3, r3
	ands r3, r4
	orrs r3, r1
	strb r3, [r6, 0xD]
	adds r4, r5, 0x1
	str r4, [r6]
	ldrb r1, [r5, 0x1]
	lsls r1, 4
	ands r2, r3
	orrs r2, r1
	strb r2, [r6, 0xD]
	adds r4, 0x1
	str r4, [r6]
	lsls r0, 24
	lsrs r0, 28
_0814FA9E:
	lsls r1, r2, 28
	lsrs r1, 28
	lsls r2, 24
	lsrs r2, 28
_0814FAA6:
	bl GenerateFontHalfRowLookupTable
	b _0814F992
_0814FAAC:
	ldr r0, [r6]
	adds r0, 0x1
	b _0814FAF8
_0814FAB2:
	ldr r0, [r6]
	ldrb r0, [r0]
	movs r1, 0xF
	ands r1, r0
	ldrb r2, [r4]
	movs r0, 0x10
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4]
	ldr r0, [r6]
	adds r0, 0x1
	b _0814FAF8
_0814FACC:
	ldr r0, [r6]
	ldrb r1, [r0]
	strb r1, [r6, 0x1E]
	adds r0, 0x1
	str r0, [r6]
	movs r0, 0x6
	strb r0, [r6, 0x1C]
	b _0814F992
_0814FADC:
	movs r0, 0x1
	strb r0, [r6, 0x1C]
	ldrb r1, [r2]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _0814FB42
	movs r0, 0
	strb r0, [r4, 0x2]
	b _0814FB42
_0814FAF0:
	movs r0, 0x5
	b _0814FC7E
_0814FAF4:
	ldr r0, [r6]
	adds r0, 0x2
_0814FAF8:
	str r0, [r6]
	b _0814F992
_0814FAFC:
	ldr r1, [r6]
	adds r0, r1, 0x1
	str r0, [r6]
	ldrb r3, [r1, 0x1]
	b _0814FB62
_0814FB06:
	ldr r1, [r6]
	ldrb r0, [r1]
	ldrb r2, [r6, 0x6]
	adds r0, r2
	strb r0, [r6, 0x8]
	b _0814FB1C
_0814FB12:
	ldr r1, [r6]
	ldrb r0, [r1]
	ldrb r2, [r6, 0x7]
	adds r0, r2
	strb r0, [r6, 0x9]
_0814FB1C:
	adds r1, 0x1
	str r1, [r6]
	b _0814F992
_0814FB22:
	ldrb r0, [r6, 0x4]
	ldrb r2, [r6, 0xD]
	lsls r2, 28
	lsrs r1, r2, 4
	orrs r1, r2
	lsrs r1, 24
	bl FillWindowPixelBuffer
	b _0814F992
_0814FB34:
	movs r0, 0x2
	b _0814FB3A
_0814FB38:
	movs r0, 0x3
_0814FB3A:
	strb r0, [r6, 0x1C]
	adds r0, r6, 0
	bl TextPrinterInitDownArrowCounters
_0814FB42:
	movs r0, 0x3
	b _0814FC96
_0814FB46:
	ldr r0, [r6]
	ldrb r3, [r0]
	movs r2, 0x80
	lsls r2, 1
	adds r1, r2, 0
	orrs r3, r1
	adds r0, 0x1
	str r0, [r6]
	b _0814FB62
_0814FB58:
	ldr r0, [r6]
	adds r0, 0x1
	str r0, [r6]
	movs r0, 0
	b _0814FC96
_0814FB62:
	adds r0, r3, 0
	bl DecompressGlyphFont6
	adds r0, r6, 0
	bl CopyGlyphToWindow
	ldr r0, _0814FB84 @ =gGlyphInfo
	adds r0, 0x80
	ldrb r1, [r6, 0xA]
	ldrb r0, [r0]
	adds r1, r0
	ldrb r0, [r6, 0x8]
	adds r0, r1
	strb r0, [r6, 0x8]
	movs r0, 0
	b _0814FC96
	.align 2, 0
_0814FB84: .4byte gGlyphInfo
_0814FB88:
	adds r0, r6, 0
	bl TextPrinterWait
	lsls r0, 16
	cmp r0, 0
	beq _0814FB42
	movs r0, 0
	strb r0, [r6, 0x1C]
	b _0814FB42
_0814FB9A:
	adds r0, r6, 0
	bl TextPrinterWaitWithDownArrow
	lsls r0, 16
	cmp r0, 0
	beq _0814FB42
	ldrb r0, [r6, 0x4]
	ldrb r2, [r6, 0xD]
	lsls r2, 28
	lsrs r1, r2, 4
	orrs r1, r2
	lsrs r1, 24
	bl FillWindowPixelBuffer
	ldrb r0, [r6, 0x6]
	movs r1, 0
	strb r0, [r6, 0x8]
	ldrb r0, [r6, 0x7]
	strb r0, [r6, 0x9]
	strb r1, [r6, 0x1C]
	b _0814FB42
_0814FBC4:
	adds r0, r6, 0
	bl TextPrinterWaitWithDownArrow
	lsls r0, 16
	cmp r0, 0
	beq _0814FB42
	adds r0, r6, 0
	bl TextPrinterClearDownArrow
	ldrb r1, [r6, 0x5]
	ldr r0, _0814FBF8 @ =gFonts
	ldr r2, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r6, 0xB]
	ldrb r0, [r0, 0x5]
	adds r1, r0
	strb r1, [r6, 0x1F]
	ldrb r0, [r6, 0x6]
	strb r0, [r6, 0x8]
	movs r0, 0x4
	strb r0, [r6, 0x1C]
	b _0814FB42
	.align 2, 0
_0814FBF8: .4byte gFonts
_0814FBFC:
	ldrb r2, [r6, 0x1F]
	cmp r2, 0
	beq _0814FC6C
	ldr r4, _0814FC30 @ =gUnknown_846FB08
	ldr r5, _0814FC34 @ =gSaveBlock2Ptr
	ldr r0, [r5]
	ldrb r0, [r0, 0x14]
	lsls r1, r0, 29
	lsrs r0, r1, 29
	adds r0, r4
	ldrb r0, [r0]
	cmp r2, r0
	bcs _0814FC38
	ldrb r0, [r6, 0x4]
	ldrb r1, [r6, 0xD]
	lsls r1, 28
	lsrs r3, r1, 4
	orrs r3, r1
	lsrs r3, 24
	movs r1, 0
	bl ScrollWindow
	movs r0, 0
	strb r0, [r6, 0x1F]
	b _0814FC62
	.align 2, 0
_0814FC30: .4byte gUnknown_846FB08
_0814FC34: .4byte gSaveBlock2Ptr
_0814FC38:
	ldrb r0, [r6, 0x4]
	lsrs r1, 29
	adds r1, r4
	ldrb r2, [r1]
	ldrb r1, [r6, 0xD]
	lsls r1, 28
	lsrs r3, r1, 4
	orrs r3, r1
	lsrs r3, 24
	movs r1, 0
	bl ScrollWindow
	ldr r0, [r5]
	ldrb r0, [r0, 0x14]
	lsls r0, 29
	lsrs r0, 29
	adds r0, r4
	ldrb r1, [r6, 0x1F]
	ldrb r0, [r0]
	subs r1, r0
	strb r1, [r6, 0x1F]
_0814FC62:
	ldrb r0, [r6, 0x4]
	movs r1, 0x2
	bl CopyWindowToVram
	b _0814FB42
_0814FC6C:
	strb r2, [r6, 0x1C]
	b _0814FB42
_0814FC70:
	bl IsSEPlaying
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _0814FC7E
	b _0814FB42
_0814FC7E:
	strb r0, [r6, 0x1C]
	b _0814FB42
_0814FC82:
	ldrb r0, [r6, 0x1E]
	adds r1, r0, 0
	cmp r1, 0
	beq _0814FC90
	subs r0, 0x1
	strb r0, [r6, 0x1E]
	b _0814FB42
_0814FC90:
	strb r1, [r6, 0x1C]
	b _0814FB42
_0814FC94:
	movs r0, 0x1
_0814FC96:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end Font6Func

	thumb_func_start DecompressGlyphFont6
DecompressGlyphFont6: @ 814FC9C
	push {r4,r5,lr}
	lsls r0, 16
	lsrs r2, r0, 19
	lsls r2, 9
	movs r1, 0xE0
	lsls r1, 11
	ands r1, r0
	lsrs r1, 11
	ldr r0, _0814FCF8 @ =gUnknown_846FB0C
	adds r1, r0
	adds r5, r2, r1
	ldr r4, _0814FCFC @ =gGlyphInfo
	adds r0, r5, 0
	adds r1, r4, 0
	bl DecompressGlyphTile
	adds r0, r5, 0
	adds r0, 0x10
	adds r1, r4, 0
	adds r1, 0x20
	bl DecompressGlyphTile
	movs r1, 0x80
	lsls r1, 1
	adds r0, r5, r1
	adds r1, r4, 0
	adds r1, 0x40
	bl DecompressGlyphTile
	movs r1, 0x88
	lsls r1, 1
	adds r0, r5, r1
	adds r1, r4, 0
	adds r1, 0x60
	bl DecompressGlyphTile
	adds r0, r4, 0
	adds r0, 0x80
	movs r1, 0x10
	strb r1, [r0]
	adds r0, 0x1
	strb r1, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0814FCF8: .4byte gUnknown_846FB0C
_0814FCFC: .4byte gGlyphInfo
	thumb_func_end DecompressGlyphFont6

	thumb_func_start GetGlyphWidthFont6
GetGlyphWidthFont6: @ 814FD00
	movs r0, 0x10
	bx lr
	thumb_func_end GetGlyphWidthFont6

	.align 2, 0 @ Don't pad with nop.
