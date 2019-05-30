	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_811EA44
sub_811EA44: @ 811EA44
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	ldr r4, [sp, 0x24]
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	lsls r1, 24
	lsrs r1, 24
	mov r10, r1
	lsls r2, 24
	lsrs r2, 24
	mov r8, r2
	lsls r3, 24
	lsrs r3, 24
	str r3, [sp]
	lsls r4, 24
	lsrs r7, r4, 24
	bl reset_brm
	ldr r6, _0811EA8C @ =gUnknown_203B09C
	movs r0, 0x8E
	lsls r0, 2
	bl Alloc
	adds r5, r0, 0
	str r5, [r6]
	cmp r5, 0
	bne _0811EA90
	ldr r0, [sp, 0x2C]
	bl SetMainCallback2
	b _0811EB80
	.align 2, 0
_0811EA8C: .4byte gUnknown_203B09C
_0811EA90:
	ldr r3, _0811EAE0 @ =gUnknown_203B0A0
	movs r1, 0xF
	mov r0, r9
	ands r1, r0
	ldrb r2, [r3, 0x8]
	movs r0, 0x10
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, 0x8]
	ldr r1, [sp, 0x2C]
	str r1, [r3]
	movs r4, 0
	mov r0, r8
	strb r0, [r3, 0xB]
	lsls r2, r7, 2
	ldrh r1, [r5, 0xA]
	movs r0, 0x3
	ands r0, r1
	orrs r0, r2
	strh r0, [r5, 0xA]
	ldr r0, [sp, 0x28]
	str r0, [r5]
	str r4, [r5, 0x4]
	ldrb r1, [r5, 0x8]
	movs r0, 0xF
	negs r0, r0
	ands r0, r1
	strb r0, [r5, 0x8]
	adds r7, r3, 0
	mov r1, r9
	cmp r1, 0x4
	bne _0811EAE4
	ldr r0, [r6]
	ldrb r1, [r0, 0x8]
	movs r2, 0x1
	orrs r1, r2
	strb r1, [r0, 0x8]
	b _0811EAF0
	.align 2, 0
_0811EAE0: .4byte gUnknown_203B0A0
_0811EAE4:
	ldr r2, [r6]
	ldrb r1, [r2, 0x8]
	movs r0, 0x2
	negs r0, r0
	ands r0, r1
	strb r0, [r2, 0x8]
_0811EAF0:
	mov r5, r10
	cmp r5, 0xFF
	beq _0811EB08
	movs r0, 0x3
	ands r0, r5
	lsls r0, 4
	ldrb r2, [r7, 0x8]
	movs r1, 0x31
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r7, 0x8]
_0811EB08:
	movs r2, 0
	ldr r5, _0811EB90 @ =gUnknown_203B09C
	movs r4, 0x86
	lsls r4, 2
	movs r3, 0
_0811EB12:
	ldr r0, [r5]
	lsls r1, r2, 1
	adds r0, r4
	adds r0, r1
	strh r3, [r0]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0xF
	bls _0811EB12
	movs r2, 0
	ldr r4, _0811EB90 @ =gUnknown_203B09C
	movs r3, 0xFF
_0811EB2C:
	ldr r0, [r4]
	adds r0, 0xC
	adds r0, r2
	ldrb r1, [r0]
	orrs r1, r3
	strb r1, [r0]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0x2
	bls _0811EB2C
	ldr r0, [sp]
	cmp r0, 0
	beq _0811EB68
	adds r1, r7, 0
	movs r0, 0x9
	ldrsb r0, [r1, r0]
	cmp r0, 0x5
	bgt _0811EB66
	adds r1, r0, 0
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0811EB94 @ =gPlayerParty
	adds r0, r1
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	bne _0811EB6A
_0811EB66:
	movs r0, 0
_0811EB68:
	strb r0, [r7, 0x9]
_0811EB6A:
	ldr r2, _0811EB98 @ =gTextFlags
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	bl CalculatePlayerPartyCount
	ldr r0, _0811EB9C @ =sub_811EBD0
	bl SetMainCallback2
_0811EB80:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0811EB90: .4byte gUnknown_203B09C
_0811EB94: .4byte gPlayerParty
_0811EB98: .4byte gTextFlags
_0811EB9C: .4byte sub_811EBD0
	thumb_func_end sub_811EA44

	thumb_func_start sub_811EBA0
sub_811EBA0: @ 811EBA0
	push {lr}
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl do_scheduled_bg_tilemap_copies_to_vram
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	thumb_func_end sub_811EBA0

	thumb_func_start sub_811EBBC
sub_811EBBC: @ 811EBBC
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	thumb_func_end sub_811EBBC

	thumb_func_start sub_811EBD0
sub_811EBD0: @ 811EBD0
	push {lr}
_0811EBD2:
	bl sub_80BF748
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0811EBF6
	bl sub_811EBFC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0811EBF6
	bl sub_80BF708
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0811EBD2
_0811EBF6:
	pop {r0}
	bx r0
	thumb_func_end sub_811EBD0

	thumb_func_start sub_811EBFC
sub_811EBFC: @ 811EBFC
	push {r4,lr}
	sub sp, 0x4
	ldr r0, _0811EC1C @ =gMain
	movs r1, 0x87
	lsls r1, 3
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x16
	bls _0811EC10
	b _0811EE14
_0811EC10:
	lsls r0, 2
	ldr r1, _0811EC20 @ =_0811EC24
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0811EC1C: .4byte gMain
_0811EC20: .4byte _0811EC24
	.align 2, 0
_0811EC24:
	.4byte _0811EC80
	.4byte _0811EC8E
	.4byte _0811EC94
	.4byte _0811ECA8
	.4byte _0811ECAE
	.4byte _0811ECB4
	.4byte _0811ECC6
	.4byte _0811ECCC
	.4byte _0811ECF4
	.4byte _0811ED02
	.4byte _0811ED14
	.4byte _0811ED38
	.4byte _0811ED3E
	.4byte _0811ED44
	.4byte _0811ED4A
	.4byte _0811ED50
	.4byte _0811ED70
	.4byte _0811ED90
	.4byte _0811ED96
	.4byte _0811EDAC
	.4byte _0811EDB4
	.4byte _0811EDD0
	.4byte _0811EDDE
_0811EC80:
	bl sub_80BF768
	bl sub_80BF77C
	bl clear_scheduled_bg_copies_to_vram
	b _0811EDFC
_0811EC8E:
	bl ScanlineEffect_Stop
	b _0811EDFC
_0811EC94:
	bl ResetPaletteFade
	ldr r2, _0811ECA4 @ =gPaletteFade
	ldrb r0, [r2, 0x8]
	movs r1, 0x80
	orrs r0, r1
	b _0811EDFA
	.align 2, 0
_0811ECA4: .4byte gPaletteFade
_0811ECA8:
	bl ResetSpriteData
	b _0811EDFC
_0811ECAE:
	bl FreeAllSpritePalettes
	b _0811EDFC
_0811ECB4:
	bl sub_80BF708
	lsls r0, 24
	cmp r0, 0
	beq _0811ECC0
	b _0811EDFC
_0811ECC0:
	bl ResetTasks
	b _0811EDFC
_0811ECC6:
	bl sub_81208E4
	b _0811EDFC
_0811ECCC:
	bl sub_811EECC
	lsls r0, 24
	cmp r0, 0
	bne _0811ECDE
	bl sub_811EE38
	movs r0, 0x1
	b _0811EE2E
_0811ECDE:
	ldr r0, _0811ECF0 @ =gUnknown_203B09C
	ldr r0, [r0]
	movs r1, 0x86
	lsls r1, 2
	adds r0, r1
	movs r1, 0
	strh r1, [r0]
	b _0811EDFC
	.align 2, 0
_0811ECF0: .4byte gUnknown_203B09C
_0811ECF4:
	bl sub_811EF44
	lsls r0, 24
	cmp r0, 0
	bne _0811ED00
	b _0811EE2C
_0811ED00:
	b _0811EDFC
_0811ED02:
	ldr r0, _0811ED10 @ =gUnknown_203B0A0
	ldrb r0, [r0, 0x8]
	lsls r0, 26
	lsrs r0, 30
	bl sub_8121060
	b _0811EDFC
	.align 2, 0
_0811ED10: .4byte gUnknown_203B0A0
_0811ED14:
	ldr r0, _0811ED30 @ =gUnknown_203B0A0
	ldrb r0, [r0, 0x8]
	lsls r0, 26
	lsrs r0, 30
	bl sub_811F0BC
	ldr r0, _0811ED34 @ =gUnknown_203B09C
	ldr r0, [r0]
	movs r1, 0x86
	lsls r1, 2
	adds r0, r1
	movs r1, 0
	strh r1, [r0]
	b _0811EDFC
	.align 2, 0
_0811ED30: .4byte gUnknown_203B0A0
_0811ED34: .4byte gUnknown_203B09C
_0811ED38:
	bl sub_8122550
	b _0811EDFC
_0811ED3E:
	bl sub_8122860
	b _0811EDFC
_0811ED44:
	bl sub_8122980
	b _0811EDFC
_0811ED4A:
	bl sub_809707C
	b _0811EDFC
_0811ED50:
	bl party_menu_add_per_mon_objects
	lsls r0, 24
	cmp r0, 0
	beq _0811EE2C
	ldr r0, _0811ED6C @ =gUnknown_203B09C
	ldr r0, [r0]
	movs r1, 0x86
	lsls r1, 2
	adds r0, r1
	movs r1, 0
	strh r1, [r0]
	b _0811EDFC
	.align 2, 0
_0811ED6C: .4byte gUnknown_203B09C
_0811ED70:
	bl sub_811F5EC
	lsls r0, 24
	cmp r0, 0
	beq _0811EE2C
	ldr r0, _0811ED8C @ =gUnknown_203B09C
	ldr r0, [r0]
	movs r1, 0x86
	lsls r1, 2
	adds r0, r1
	movs r1, 0
	strh r1, [r0]
	b _0811EDFC
	.align 2, 0
_0811ED8C: .4byte gUnknown_203B09C
_0811ED90:
	bl sub_811F774
	b _0811EDFC
_0811ED96:
	ldr r0, _0811EDA8 @ =gUnknown_203B09C
	ldr r0, [r0]
	ldrb r0, [r0, 0x8]
	lsls r0, 31
	lsrs r0, 31
	bl sub_81210F8
	b _0811EDFC
	.align 2, 0
_0811EDA8: .4byte gUnknown_203B09C
_0811EDAC:
	movs r0, 0x5
	bl HelpSystem_SetSomeVariable2
	b _0811EDFC
_0811EDB4:
	ldr r4, _0811EDCC @ =gUnknown_203B09C
	ldr r0, [r4]
	ldr r0, [r0]
	movs r1, 0
	bl CreateTask
	ldr r0, [r4]
	ldrh r0, [r0, 0xA]
	lsrs r0, 2
	bl sub_8121D0C
	b _0811EDFC
	.align 2, 0
_0811EDCC: .4byte gUnknown_203B09C
_0811EDD0:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0x10
	movs r2, 0
	bl BlendPalettes
	b _0811EDFC
_0811EDDE:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0x2
	negs r1, r1
	movs r2, 0
	str r2, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r2, _0811EE0C @ =gPaletteFade
	ldrb r1, [r2, 0x8]
	movs r0, 0x7F
	ands r0, r1
_0811EDFA:
	strb r0, [r2, 0x8]
_0811EDFC:
	ldr r1, _0811EE10 @ =gMain
	movs r0, 0x87
	lsls r0, 3
	adds r1, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _0811EE2C
	.align 2, 0
_0811EE0C: .4byte gPaletteFade
_0811EE10: .4byte gMain
_0811EE14:
	ldr r0, _0811EE24 @ =sub_811EBBC
	bl SetVBlankCallback
	ldr r0, _0811EE28 @ =sub_811EBA0
	bl SetMainCallback2
	movs r0, 0x1
	b _0811EE2E
	.align 2, 0
_0811EE24: .4byte sub_811EBBC
_0811EE28: .4byte sub_811EBA0
_0811EE2C:
	movs r0, 0
_0811EE2E:
	add sp, 0x4
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_811EBFC

	thumb_func_start sub_811EE38
sub_811EE38: @ 811EE38
	push {lr}
	sub sp, 0x4
	movs r0, 0x1
	negs r0, r0
	movs r1, 0x2
	negs r1, r1
	movs r2, 0
	str r2, [sp]
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, _0811EE68 @ =sub_811EE74
	movs r1, 0
	bl CreateTask
	ldr r0, _0811EE6C @ =sub_811EBBC
	bl SetVBlankCallback
	ldr r0, _0811EE70 @ =sub_811EBA0
	bl SetMainCallback2
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_0811EE68: .4byte sub_811EE74
_0811EE6C: .4byte sub_811EBBC
_0811EE70: .4byte sub_811EBA0
	thumb_func_end sub_811EE38

	thumb_func_start sub_811EE74
sub_811EE74: @ 811EE74
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0811EEA0 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0811EE98
	ldr r0, _0811EEA4 @ =gUnknown_203B0A0
	ldr r0, [r0]
	bl SetMainCallback2
	bl sub_811F070
	adds r0, r4, 0
	bl DestroyTask
_0811EE98:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0811EEA0: .4byte gPaletteFade
_0811EEA4: .4byte gUnknown_203B0A0
	thumb_func_end sub_811EE74

	thumb_func_start reset_brm
reset_brm: @ 811EEA8
	ldr r0, _0811EEBC @ =gUnknown_203B09C
	movs r1, 0
	str r1, [r0]
	ldr r0, _0811EEC0 @ =gUnknown_203B0BC
	str r1, [r0]
	ldr r0, _0811EEC4 @ =gUnknown_203B0B4
	str r1, [r0]
	ldr r0, _0811EEC8 @ =gUnknown_203B0B8
	str r1, [r0]
	bx lr
	.align 2, 0
_0811EEBC: .4byte gUnknown_203B09C
_0811EEC0: .4byte gUnknown_203B0BC
_0811EEC4: .4byte gUnknown_203B0B4
_0811EEC8: .4byte gUnknown_203B0B8
	thumb_func_end reset_brm

	thumb_func_start sub_811EECC
sub_811EECC: @ 811EECC
	push {r4,r5,lr}
	bl sub_80BF7C8
	ldr r5, _0811EF34 @ =gUnknown_203B0BC
	movs r4, 0x80
	lsls r4, 4
	adds r0, r4, 0
	bl Alloc
	str r0, [r5]
	cmp r0, 0
	beq _0811EF3C
	movs r1, 0
	adds r2, r4, 0
	bl memset
	movs r0, 0
	bl ResetBgsAndClearDma3BusyFlags
	ldr r1, _0811EF38 @ =gUnknown_8459EB8
	movs r0, 0
	movs r2, 0x3
	bl InitBgsFromTemplates
	ldr r1, [r5]
	movs r0, 0x1
	bl SetBgTilemapBuffer
	movs r0, 0x1
	bl schedule_bg_copy_tilemap_to_vram
	movs r1, 0x82
	lsls r1, 5
	movs r0, 0
	bl SetGpuReg
	movs r0, 0x50
	movs r1, 0
	bl SetGpuReg
	movs r0, 0
	bl ShowBg
	movs r0, 0x1
	bl ShowBg
	movs r0, 0x2
	bl ShowBg
	movs r0, 0x1
	b _0811EF3E
	.align 2, 0
_0811EF34: .4byte gUnknown_203B0BC
_0811EF38: .4byte gUnknown_8459EB8
_0811EF3C:
	movs r0, 0
_0811EF3E:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_811EECC

	thumb_func_start sub_811EF44
sub_811EF44: @ 811EF44
	push {r4,lr}
	sub sp, 0x4
	ldr r0, _0811EF64 @ =gUnknown_203B09C
	ldr r0, [r0]
	movs r1, 0x86
	lsls r1, 2
	adds r0, r1
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0x7
	bhi _0811F02C
	lsls r0, 2
	ldr r1, _0811EF68 @ =_0811EF6C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0811EF64: .4byte gUnknown_203B09C
_0811EF68: .4byte _0811EF6C
	.align 2, 0
_0811EF6C:
	.4byte _0811EF8C
	.4byte _0811EFB4
	.4byte _0811EFD4
	.4byte _0811F000
	.4byte _0811F004
	.4byte _0811F008
	.4byte _0811F00C
	.4byte _0811F010
_0811EF8C:
	ldr r4, _0811EFAC @ =gUnknown_203B0B8
	ldr r0, _0811EFB0 @ =gFile_graphics_interface_party_menu_misc_sheet
	mov r1, sp
	bl malloc_and_decompress
	adds r1, r0, 0
	str r1, [r4]
	ldr r2, [sp]
	lsls r2, 16
	lsrs r2, 16
	movs r0, 0x1
	movs r3, 0
	bl LoadBgTiles
	b _0811F016
	.align 2, 0
_0811EFAC: .4byte gUnknown_203B0B8
_0811EFB0: .4byte gFile_graphics_interface_party_menu_misc_sheet
_0811EFB4:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _0811F030
	ldr r0, _0811EFCC @ =gFile_graphics_interface_party_menu_misc_tilemap
	ldr r1, _0811EFD0 @ =gUnknown_203B0BC
	ldr r1, [r1]
	bl LZDecompressWram
	b _0811F016
	.align 2, 0
_0811EFCC: .4byte gFile_graphics_interface_party_menu_misc_tilemap
_0811EFD0: .4byte gUnknown_203B0BC
_0811EFD4:
	ldr r0, _0811EFF4 @ =gUnknown_8E829C8
	movs r2, 0xB0
	lsls r2, 1
	movs r1, 0
	bl LoadCompressedPalette
	ldr r0, _0811EFF8 @ =gPlttBufferUnfaded
	ldr r4, _0811EFFC @ =gUnknown_203B09C
	ldr r1, [r4]
	adds r1, 0x18
	movs r2, 0xB0
	bl CpuSet
	ldr r1, [r4]
	b _0811F01A
	.align 2, 0
_0811EFF4: .4byte gUnknown_8E829C8
_0811EFF8: .4byte gPlttBufferUnfaded
_0811EFFC: .4byte gUnknown_203B09C
_0811F000:
	movs r0, 0x4
	b _0811F012
_0811F004:
	movs r0, 0x5
	b _0811F012
_0811F008:
	movs r0, 0x6
	b _0811F012
_0811F00C:
	movs r0, 0x7
	b _0811F012
_0811F010:
	movs r0, 0x8
_0811F012:
	bl sub_811F03C
_0811F016:
	ldr r0, _0811F028 @ =gUnknown_203B09C
	ldr r1, [r0]
_0811F01A:
	movs r0, 0x86
	lsls r0, 2
	adds r1, r0
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	b _0811F030
	.align 2, 0
_0811F028: .4byte gUnknown_203B09C
_0811F02C:
	movs r0, 0x1
	b _0811F032
_0811F030:
	movs r0, 0
_0811F032:
	add sp, 0x4
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_811EF44

	thumb_func_start sub_811F03C
sub_811F03C: @ 811F03C
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r4, 28
	ldr r5, _0811F068 @ =gPlttBufferUnfaded + 0x60
	lsrs r4, 23
	adds r1, r5, 0
	subs r1, 0x60
	adds r1, r4, r1
	adds r0, r5, 0
	movs r2, 0x10
	bl CpuSet
	ldr r0, _0811F06C @ =gPlttBufferFaded
	adds r4, r0
	adds r0, r5, 0
	adds r1, r4, 0
	movs r2, 0x10
	bl CpuSet
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0811F068: .4byte gPlttBufferUnfaded + 0x60
_0811F06C: .4byte gPlttBufferFaded
	thumb_func_end sub_811F03C

	thumb_func_start sub_811F070
sub_811F070: @ 811F070
	push {lr}
	ldr r0, _0811F0AC @ =gUnknown_203B09C
	ldr r0, [r0]
	cmp r0, 0
	beq _0811F07E
	bl Free
_0811F07E:
	ldr r0, _0811F0B0 @ =gUnknown_203B0BC
	ldr r0, [r0]
	cmp r0, 0
	beq _0811F08A
	bl Free
_0811F08A:
	ldr r0, _0811F0B4 @ =gUnknown_203B0B8
	ldr r0, [r0]
	cmp r0, 0
	beq _0811F096
	bl Free
_0811F096:
	ldr r0, _0811F0B8 @ =gUnknown_203B0B4
	ldr r0, [r0]
	cmp r0, 0
	beq _0811F0A2
	bl Free
_0811F0A2:
	bl FreeAllWindowBuffers
	pop {r0}
	bx r0
	.align 2, 0
_0811F0AC: .4byte gUnknown_203B09C
_0811F0B0: .4byte gUnknown_203B0BC
_0811F0B4: .4byte gUnknown_203B0B8
_0811F0B8: .4byte gUnknown_203B0B4
	thumb_func_end sub_811F070

	thumb_func_start sub_811F0BC
sub_811F0BC: @ 811F0BC
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r4, _0811F108 @ =gUnknown_203B0B4
	movs r0, 0x60
	bl Alloc
	str r0, [r4]
	movs r2, 0
	ldr r7, _0811F10C @ =gUnknown_8459EE4
	lsls r0, r5, 1
	adds r0, r5
	lsls r3, r0, 4
	mov r12, r4
	ldr r6, _0811F110 @ =gUnknown_8459F04
_0811F0DA:
	ldr r0, [r4]
	lsls r1, r2, 4
	adds r1, r0
	str r7, [r1]
	lsls r0, r2, 3
	adds r0, r6
	adds r0, r3, r0
	str r0, [r1, 0x4]
	strb r2, [r1, 0x8]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x5
	bls _0811F0DA
	mov r1, r12
	ldr r0, [r1]
	ldr r1, _0811F114 @ =gUnknown_8459EC4
	str r1, [r0]
	cmp r5, 0x3
	bne _0811F118
	str r1, [r0, 0x30]
	b _0811F11E
	.align 2, 0
_0811F108: .4byte gUnknown_203B0B4
_0811F10C: .4byte gUnknown_8459EE4
_0811F110: .4byte gUnknown_8459F04
_0811F114: .4byte gUnknown_8459EC4
_0811F118:
	cmp r5, 0
	beq _0811F11E
	str r1, [r0, 0x10]
_0811F11E:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_811F0BC

	thumb_func_start sub_811F124
sub_811F124: @ 811F124
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0811F16C @ =gUnknown_203B0A0
	ldrb r1, [r0, 0x8]
	movs r0, 0xF
	ands r0, r1
	cmp r0, 0x5
	bne _0811F174
	cmp r4, 0x2
	bls _0811F174
	adds r0, r4, 0
	bl sub_811F528
	ldr r5, _0811F170 @ =gUnknown_203B0B4
	lsls r4, 4
	ldr r0, [r5]
	adds r0, r4
	movs r1, 0x8
	bl sub_812142C
	ldr r0, [r5]
	adds r0, r4, r0
	ldrb r0, [r0, 0x8]
	movs r1, 0x2
	bl CopyWindowToVram
	ldr r0, [r5]
	adds r4, r0
	ldrb r0, [r4, 0x8]
	bl PutWindowTilemap
	movs r0, 0x2
	bl schedule_bg_copy_tilemap_to_vram
	b _0811F22A
	.align 2, 0
_0811F16C: .4byte gUnknown_203B0A0
_0811F170: .4byte gUnknown_203B0B4
_0811F174:
	movs r0, 0x64
	muls r0, r4
	ldr r1, _0811F1A4 @ =gPlayerParty
	adds r0, r1
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	bne _0811F1AC
	ldr r5, _0811F1A8 @ =gUnknown_203B0B4
	ldr r0, [r5]
	lsls r4, 4
	adds r0, r4, r0
	ldrb r0, [r0, 0x8]
	bl sub_8121404
	ldr r0, [r5]
	adds r0, r4, r0
	ldrb r0, [r0, 0x8]
	movs r1, 0x2
	bl CopyWindowToVram
	b _0811F218
	.align 2, 0
_0811F1A4: .4byte gPlayerParty
_0811F1A8: .4byte gUnknown_203B0B4
_0811F1AC:
	ldr r0, _0811F1C0 @ =gUnknown_203B0A0
	ldrb r0, [r0, 0x8]
	movs r1, 0xF
	ands r1, r0
	cmp r1, 0x4
	bne _0811F1C4
	adds r0, r4, 0
	bl sub_811F388
	b _0811F1E2
	.align 2, 0
_0811F1C0: .4byte gUnknown_203B0A0
_0811F1C4:
	cmp r1, 0xB
	bne _0811F1D0
	adds r0, r4, 0
	bl sub_811F404
	b _0811F1E2
_0811F1D0:
	adds r0, r4, 0
	bl sub_811F430
	lsls r0, 24
	cmp r0, 0
	bne _0811F1E2
	adds r0, r4, 0
	bl sub_811F234
_0811F1E2:
	ldr r2, _0811F1F8 @ =gUnknown_203B0A0
	ldrb r1, [r2, 0x8]
	movs r0, 0xF
	ands r0, r1
	cmp r0, 0x5
	bne _0811F1FC
	adds r0, r4, 0
	movs r1, 0
	bl sub_811F818
	b _0811F216
	.align 2, 0
_0811F1F8: .4byte gUnknown_203B0A0
_0811F1FC:
	movs r0, 0x9
	ldrsb r0, [r2, r0]
	cmp r0, r4
	bne _0811F20E
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_811F818
	b _0811F216
_0811F20E:
	adds r0, r4, 0
	movs r1, 0
	bl sub_811F818
_0811F216:
	lsls r4, 4
_0811F218:
	ldr r0, _0811F230 @ =gUnknown_203B0B4
	ldr r0, [r0]
	adds r0, r4, r0
	ldrb r0, [r0, 0x8]
	bl PutWindowTilemap
	movs r0, 0
	bl schedule_bg_copy_tilemap_to_vram
_0811F22A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0811F230: .4byte gUnknown_203B0B4
	thumb_func_end sub_811F124

	thumb_func_start sub_811F234
sub_811F234: @ 811F234
	push {r4-r7,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	movs r0, 0x64
	adds r1, r4, 0
	muls r1, r0
	ldr r0, _0811F284 @ =gPlayerParty
	adds r7, r1, r0
	adds r0, r7, 0
	movs r1, 0x2D
	bl GetMonData
	adds r2, r0, 0
	cmp r2, 0
	beq _0811F28C
	ldr r6, _0811F288 @ =gUnknown_203B0B4
	ldr r0, [r6]
	lsls r5, r4, 4
	adds r0, r5, r0
	ldr r2, [r0]
	ldrb r0, [r0, 0x8]
	movs r1, 0
	str r1, [sp]
	movs r1, 0x1
	str r1, [sp, 0x4]
	ldr r4, [r2]
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl _call_via_r4
	ldr r1, [r6]
	adds r1, r5
	adds r0, r7, 0
	movs r2, 0
	bl sub_8121738
	b _0811F2EE
	.align 2, 0
_0811F284: .4byte gPlayerParty
_0811F288: .4byte gUnknown_203B0B4
_0811F28C:
	ldr r5, _0811F2F8 @ =gUnknown_203B0B4
	ldr r0, [r5]
	lsls r4, 4
	adds r0, r4, r0
	ldr r1, [r0]
	ldrb r0, [r0, 0x8]
	str r2, [sp]
	str r2, [sp, 0x4]
	ldr r6, [r1]
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl _call_via_r6
	ldr r1, [r5]
	adds r1, r4
	adds r0, r7, 0
	movs r2, 0
	bl sub_8121738
	ldr r1, [r5]
	adds r1, r4
	adds r0, r7, 0
	movs r2, 0
	bl sub_8121790
	ldr r1, [r5]
	adds r1, r4
	adds r0, r7, 0
	movs r2, 0
	bl sub_8121854
	ldr r1, [r5]
	adds r1, r4
	adds r0, r7, 0
	movs r2, 0
	bl sub_812199C
	ldr r1, [r5]
	adds r1, r4
	adds r0, r7, 0
	movs r2, 0
	bl sub_8121A3C
	ldr r1, [r5]
	adds r1, r4
	adds r0, r7, 0
	bl sub_8121AF0
_0811F2EE:
	add sp, 0x8
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0811F2F8: .4byte gUnknown_203B0B4
	thumb_func_end sub_811F234

	thumb_func_start sub_811F2FC
sub_811F2FC: @ 811F2FC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x8
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	mov r8, r1
	movs r1, 0x64
	adds r2, r0, 0
	muls r2, r1
	ldr r1, _0811F380 @ =gPlayerParty
	adds r6, r2, r1
	ldr r7, _0811F384 @ =gUnknown_203B0B4
	ldr r1, [r7]
	lsls r5, r0, 4
	adds r1, r5, r1
	ldr r2, [r1]
	ldrb r0, [r1, 0x8]
	movs r1, 0
	str r1, [sp]
	movs r1, 0x1
	str r1, [sp, 0x4]
	ldr r4, [r2]
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl _call_via_r4
	ldr r1, [r7]
	adds r1, r5
	adds r0, r6, 0
	movs r2, 0
	bl sub_8121738
	adds r0, r6, 0
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0
	bne _0811F368
	ldr r1, [r7]
	adds r1, r5
	adds r0, r6, 0
	movs r2, 0
	bl sub_8121790
	ldr r1, [r7]
	adds r1, r5
	adds r0, r6, 0
	movs r2, 0
	bl sub_8121854
_0811F368:
	ldr r1, [r7]
	adds r1, r5
	mov r0, r8
	movs r2, 0
	bl sub_8121C70
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0811F380: .4byte gPlayerParty
_0811F384: .4byte gUnknown_203B0B4
	thumb_func_end sub_811F2FC

	thumb_func_start sub_811F388
sub_811F388: @ 811F388
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	movs r0, 0x64
	muls r0, r4
	ldr r1, _0811F3AC @ =gPlayerParty
	adds r0, r1
	ldr r5, _0811F3B0 @ =gUnknown_203B0D4
	bl sub_8127550
	lsls r0, 24
	cmp r0, 0
	bne _0811F3C2
	adds r0, r4, 0
	movs r1, 0x6
	bl sub_811F2FC
	b _0811F3F8
	.align 2, 0
_0811F3AC: .4byte gPlayerParty
_0811F3B0: .4byte gUnknown_203B0D4
_0811F3B4:
	adds r1, 0x2
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_811F2FC
	b _0811F3F8
_0811F3C2:
	ldr r0, _0811F400 @ =gUnknown_203B0A0
	ldrb r1, [r0, 0x8]
	movs r0, 0xC0
	ands r0, r1
	movs r3, 0x3
	cmp r0, 0x80
	bne _0811F3D2
	movs r3, 0x2
_0811F3D2:
	movs r1, 0
	cmp r1, r3
	bcs _0811F3F0
_0811F3D8:
	adds r2, r5, r1
	ldrb r0, [r2]
	cmp r0, 0
	beq _0811F3E6
	subs r0, 0x1
	cmp r0, r4
	beq _0811F3B4
_0811F3E6:
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, r3
	bcc _0811F3D8
_0811F3F0:
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_811F2FC
_0811F3F8:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0811F400: .4byte gUnknown_203B0A0
	thumb_func_end sub_811F388

	thumb_func_start sub_811F404
sub_811F404: @ 811F404
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl sub_81209D4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0811F422
	adds r0, r4, 0
	movs r1, 0x5
	bl sub_811F2FC
	b _0811F42A
_0811F422:
	adds r0, r4, 0
	movs r1, 0x6
	bl sub_811F2FC
_0811F42A:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_811F404

	thumb_func_start sub_811F430
sub_811F430: @ 811F430
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	movs r0, 0x64
	adds r1, r5, 0
	muls r1, r0
	ldr r0, _0811F468 @ =gPlayerParty
	adds r6, r1, r0
	ldr r0, _0811F46C @ =gSpecialVar_ItemId
	ldrh r4, [r0]
	ldr r0, _0811F470 @ =gUnknown_203B0A0
	ldrb r0, [r0, 0xB]
	cmp r0, 0xC
	bne _0811F47C
	ldr r0, _0811F474 @ =gSpecialVar_Result
	movs r1, 0
	strh r1, [r0]
	ldr r0, _0811F478 @ =gSpecialVar_0x8005
	ldrh r0, [r0]
	cmp r0, 0xE
	bhi _0811F492
	lsls r2, r0, 24
	lsrs r2, 24
	adds r0, r5, 0
	movs r1, 0
	bl sub_811F4D0
	b _0811F4C6
	.align 2, 0
_0811F468: .4byte gPlayerParty
_0811F46C: .4byte gSpecialVar_ItemId
_0811F470: .4byte gUnknown_203B0A0
_0811F474: .4byte gSpecialVar_Result
_0811F478: .4byte gSpecialVar_0x8005
_0811F47C:
	cmp r0, 0x3
	bne _0811F492
	adds r0, r4, 0
	bl sub_80A1150
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0811F496
	cmp r0, 0x2
	beq _0811F4A2
_0811F492:
	movs r0, 0
	b _0811F4C8
_0811F496:
	adds r0, r5, 0
	adds r1, r4, 0
	movs r2, 0
	bl sub_811F4D0
	b _0811F4C6
_0811F4A2:
	adds r0, r6, 0
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0
	bne _0811F4BE
	adds r0, r6, 0
	movs r1, 0x3
	adds r2, r4, 0
	bl GetEvolutionTargetSpecies
	lsls r0, 16
	cmp r0, 0
	bne _0811F492
_0811F4BE:
	adds r0, r5, 0
	movs r1, 0
	bl sub_811F2FC
_0811F4C6:
	movs r0, 0x1
_0811F4C8:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_811F430

	thumb_func_start sub_811F4D0
sub_811F4D0: @ 811F4D0
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 16
	lsrs r1, 16
	lsls r2, 24
	lsrs r2, 24
	movs r0, 0x64
	muls r0, r4
	ldr r3, _0811F4FC @ =gPlayerParty
	adds r0, r3
	bl sub_8120B20
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	beq _0811F50E
	cmp r0, 0x2
	bgt _0811F500
	cmp r0, 0x1
	beq _0811F504
	b _0811F518
	.align 2, 0
_0811F4FC: .4byte gPlayerParty
_0811F500:
	cmp r0, 0x3
	bne _0811F518
_0811F504:
	adds r0, r4, 0
	movs r1, 0x8
	bl sub_811F2FC
	b _0811F520
_0811F50E:
	adds r0, r4, 0
	movs r1, 0x9
	bl sub_811F2FC
	b _0811F520
_0811F518:
	adds r0, r4, 0
	movs r1, 0x7
	bl sub_811F2FC
_0811F520:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_811F4D0

	thumb_func_start sub_811F528
sub_811F528: @ 811F528
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x8
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0811F558 @ =gUnknown_203B0B4
	lsls r2, r0, 4
	ldr r1, [r1]
	adds r5, r1, r2
	subs r0, 0x3
	lsls r0, 24
	ldr r1, _0811F55C @ =gUnknown_2022B58
	mov r8, r1
	lsrs r7, r0, 19
	adds r6, r7, r1
	ldrh r0, [r6]
	cmp r0, 0
	bne _0811F560
	ldrb r0, [r5, 0x8]
	bl sub_8121404
	b _0811F5DC
	.align 2, 0
_0811F558: .4byte gUnknown_203B0B4
_0811F55C: .4byte gUnknown_2022B58
_0811F560:
	ldr r2, [r5]
	ldrb r0, [r5, 0x8]
	movs r1, 0
	str r1, [sp]
	str r1, [sp, 0x4]
	ldr r4, [r2]
	movs r2, 0
	movs r3, 0
	bl _call_via_r4
	ldr r4, _0811F5E8 @ =gStringVar1
	mov r0, r8
	adds r0, 0x4
	adds r7, r0
	adds r0, r4, 0
	adds r1, r7, 0
	bl StringCopy
	adds r0, r4, 0
	bl StringGetEnd10
	adds r0, r4, 0
	bl StringLength
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x5
	bhi _0811F5A0
	adds r0, r4, 0
	movs r1, 0x1
	bl ConvertInternationalString
_0811F5A0:
	ldrb r0, [r5, 0x8]
	ldr r3, [r5]
	adds r3, 0x4
	adds r1, r4, 0
	movs r2, 0
	bl sub_8121704
	ldrb r0, [r6, 0xF]
	adds r1, r5, 0
	bl sub_8121808
	ldrb r0, [r6, 0x1C]
	ldrh r1, [r6]
	adds r2, r7, 0
	adds r3, r5, 0
	bl sub_81218BC
	ldrh r0, [r6, 0x10]
	adds r1, r5, 0
	bl sub_8121A04
	ldrh r0, [r6, 0x12]
	adds r1, r5, 0
	bl sub_8121AA4
	ldrh r0, [r6, 0x10]
	ldrh r1, [r6, 0x12]
	adds r2, r5, 0
	bl sub_8121B2C
_0811F5DC:
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0811F5E8: .4byte gStringVar1
	thumb_func_end sub_811F528

	thumb_func_start sub_811F5EC
sub_811F5EC: @ 811F5EC
	push {r4,r5,lr}
	ldr r5, _0811F614 @ =gUnknown_203B09C
	ldr r0, [r5]
	movs r4, 0x86
	lsls r4, 2
	adds r0, r4
	ldrb r0, [r0]
	bl sub_811F124
	ldr r1, [r5]
	adds r1, r4
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x6
	beq _0811F618
	movs r0, 0
	b _0811F61A
	.align 2, 0
_0811F614: .4byte gUnknown_203B09C
_0811F618:
	movs r0, 0x1
_0811F61A:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_811F5EC

	thumb_func_start sub_811F620
sub_811F620: @ 811F620
	lsls r0, 16
	ldr r1, _0811F630 @ =gUnknown_203B0B8
	lsrs r0, 11
	ldr r1, [r1]
	adds r1, r0
	adds r0, r1, 0
	bx lr
	.align 2, 0
_0811F630: .4byte gUnknown_203B0B8
	thumb_func_end sub_811F620

	thumb_func_start party_menu_add_per_mon_objects_internal
party_menu_add_per_mon_objects_internal: @ 811F634
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r0, _0811F6A8 @ =gUnknown_203B0A0
	ldrb r1, [r0, 0x8]
	movs r0, 0xF
	ands r0, r1
	cmp r0, 0x5
	bne _0811F6E4
	cmp r7, 0x2
	bls _0811F6E4
	subs r0, r7, 0x3
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	ldr r0, _0811F6AC @ =gUnknown_2022B58
	mov r9, r0
	mov r2, r10
	lsls r2, 5
	mov r8, r2
	mov r6, r8
	add r6, r9
	ldrh r0, [r6]
	cmp r0, 0
	beq _0811F728
	mov r1, r9
	adds r1, 0x18
	add r1, r8
	ldr r1, [r1]
	ldr r4, _0811F6B0 @ =gUnknown_203B0B4
	lsls r5, r7, 4
	ldr r2, [r4]
	adds r2, r5
	movs r3, 0
	str r3, [sp]
	bl party_menu_link_mon_icon_anim
	ldrh r0, [r6]
	ldrh r1, [r6, 0x2]
	ldr r2, [r4]
	adds r2, r5
	bl party_menu_link_mon_held_item_object
	ldrh r0, [r6]
	ldr r1, [r4]
	adds r1, r5
	bl party_menu_link_mon_pokeball_object
	ldrh r0, [r6, 0x10]
	cmp r0, 0
	bne _0811F6B4
	movs r3, 0x7
	b _0811F6C4
	.align 2, 0
_0811F6A8: .4byte gUnknown_203B0A0
_0811F6AC: .4byte gUnknown_2022B58
_0811F6B0: .4byte gUnknown_203B0B4
_0811F6B4:
	mov r0, r9
	adds r0, 0x14
	add r0, r8
	ldr r0, [r0]
	bl pokemon_ailments_get_primary
	lsls r0, 24
	lsrs r3, r0, 24
_0811F6C4:
	ldr r1, _0811F6DC @ =gUnknown_2022B58
	mov r2, r10
	lsls r0, r2, 5
	adds r0, r1
	ldrh r0, [r0]
	ldr r1, _0811F6E0 @ =gUnknown_203B0B4
	ldr r2, [r1]
	adds r2, r5
	adds r1, r3, 0
	bl party_menu_link_mon_status_condition_object
	b _0811F728
	.align 2, 0
_0811F6DC: .4byte gUnknown_2022B58
_0811F6E0: .4byte gUnknown_203B0B4
_0811F6E4:
	movs r0, 0x64
	adds r1, r7, 0
	muls r1, r0
	ldr r0, _0811F738 @ =gPlayerParty
	adds r6, r1, r0
	adds r0, r6, 0
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _0811F728
	ldr r4, _0811F73C @ =gUnknown_203B0B4
	lsls r5, r7, 4
	ldr r1, [r4]
	adds r1, r5
	adds r0, r6, 0
	adds r2, r7, 0
	bl party_menu_icon_anim
	ldr r1, [r4]
	adds r1, r5
	adds r0, r6, 0
	bl party_menu_held_item_object
	ldr r1, [r4]
	adds r1, r5
	adds r0, r6, 0
	bl party_menu_pokeball_object
	ldr r1, [r4]
	adds r1, r5
	adds r0, r6, 0
	bl party_menu_status_condition_object
_0811F728:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0811F738: .4byte gPlayerParty
_0811F73C: .4byte gUnknown_203B0B4
	thumb_func_end party_menu_add_per_mon_objects_internal

	thumb_func_start party_menu_add_per_mon_objects
party_menu_add_per_mon_objects: @ 811F740
	push {r4,r5,lr}
	ldr r5, _0811F768 @ =gUnknown_203B09C
	ldr r0, [r5]
	movs r4, 0x86
	lsls r4, 2
	adds r0, r4
	ldrb r0, [r0]
	bl party_menu_add_per_mon_objects_internal
	ldr r1, [r5]
	adds r1, r4
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x6
	beq _0811F76C
	movs r0, 0
	b _0811F76E
	.align 2, 0
_0811F768: .4byte gUnknown_203B09C
_0811F76C:
	movs r0, 0x1
_0811F76E:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end party_menu_add_per_mon_objects

	thumb_func_start sub_811F774
sub_811F774: @ 811F774
	push {r4,lr}
	sub sp, 0xC
	ldr r0, _0811F79C @ =gUnknown_203B0A0
	ldrb r1, [r0, 0x8]
	movs r0, 0xF
	ands r0, r1
	cmp r0, 0x5
	bne _0811F7A0
	movs r0, 0x7
	str r0, [sp]
	movs r0, 0x2
	str r0, [sp, 0x4]
	movs r0, 0x1
	str r0, [sp, 0x8]
	movs r1, 0xE
	movs r2, 0x17
	movs r3, 0x11
	bl FillBgTilemapBufferRect
	b _0811F808
	.align 2, 0
_0811F79C: .4byte gUnknown_203B0A0
_0811F7A0:
	ldr r4, _0811F7D8 @ =gUnknown_203B09C
	ldr r0, [r4]
	ldrb r0, [r0, 0x8]
	lsls r0, 31
	cmp r0, 0
	beq _0811F7E0
	movs r0, 0xBF
	movs r1, 0x88
	bl sub_8122794
	ldr r3, [r4]
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x7F
	ands r0, r1
	lsls r0, 4
	ldrh r2, [r3, 0x8]
	ldr r1, _0811F7DC @ =0xfffff80f
	ands r1, r2
	orrs r1, r0
	strh r1, [r3, 0x8]
	bl sub_811F9DC
	movs r0, 0xBF
	movs r1, 0x98
	bl sub_8122794
	b _0811F7E8
	.align 2, 0
_0811F7D8: .4byte gUnknown_203B09C
_0811F7DC: .4byte 0xfffff80f
_0811F7E0:
	movs r0, 0xC6
	movs r1, 0x94
	bl sub_8122754
_0811F7E8:
	ldr r3, [r4]
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x7F
	ands r0, r1
	lsls r0, 11
	ldr r1, [r3, 0x8]
	ldr r2, _0811F810 @ =0xfffc07ff
	ands r1, r2
	orrs r1, r0
	str r1, [r3, 0x8]
	ldr r0, _0811F814 @ =gUnknown_203B0A0
	ldrb r0, [r0, 0x9]
	movs r1, 0x1
	bl sub_811F818
_0811F808:
	add sp, 0xC
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0811F810: .4byte 0xfffc07ff
_0811F814: .4byte gUnknown_203B0A0
	thumb_func_end sub_811F774

	thumb_func_start sub_811F818
sub_811F818: @ 811F818
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x8
	lsls r0, 24
	lsrs r7, r0, 24
	lsls r1, 24
	lsrs r1, 24
	mov r8, r1
	cmp r7, 0x6
	beq _0811F884
	cmp r7, 0x7
	beq _0811F8C0
	movs r0, 0x64
	muls r0, r7
	ldr r1, _0811F87C @ =gPlayerParty
	adds r0, r1
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _0811F934
	ldr r6, _0811F880 @ =gUnknown_203B0B4
	lsls r5, r7, 4
	ldr r4, [r6]
	adds r4, r5
	adds r0, r7, 0
	mov r1, r8
	bl sub_811F944
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_812142C
	ldr r0, [r6]
	adds r0, r5, r0
	ldrb r0, [r0, 0x9]
	mov r1, r8
	bl sub_812238C
	ldr r0, [r6]
	adds r5, r0
	ldrb r0, [r5, 0xB]
	mov r1, r8
	bl sub_81227B8
	b _0811F934
	.align 2, 0
_0811F87C: .4byte gPlayerParty
_0811F880: .4byte gUnknown_203B0B4
_0811F884:
	mov r0, r8
	cmp r0, 0
	bne _0811F89E
	movs r0, 0x2
	str r0, [sp]
	movs r0, 0x1
	str r0, [sp, 0x4]
	movs r1, 0x17
	movs r2, 0x10
	movs r3, 0x7
	bl sub_80F6B08
	b _0811F8B0
_0811F89E:
	movs r0, 0x2
	str r0, [sp]
	str r0, [sp, 0x4]
	movs r0, 0x1
	movs r1, 0x17
	movs r2, 0x10
	movs r3, 0x7
	bl sub_80F6B08
_0811F8B0:
	ldr r0, _0811F8BC @ =gUnknown_203B09C
	ldr r0, [r0]
	ldrh r0, [r0, 0x8]
	lsls r0, 21
	b _0811F926
	.align 2, 0
_0811F8BC: .4byte gUnknown_203B09C
_0811F8C0:
	ldr r0, _0811F8E0 @ =gUnknown_203B09C
	ldr r0, [r0]
	ldrb r0, [r0, 0x8]
	lsls r0, 31
	cmp r0, 0
	bne _0811F8F2
	mov r0, r8
	cmp r0, 0
	bne _0811F8E4
	movs r0, 0x2
	str r0, [sp]
	movs r0, 0x1
	str r0, [sp, 0x4]
	movs r1, 0x17
	movs r2, 0x11
	b _0811F904
	.align 2, 0
_0811F8E0: .4byte gUnknown_203B09C
_0811F8E4:
	movs r0, 0x2
	str r0, [sp]
	str r0, [sp, 0x4]
	movs r0, 0x1
	movs r1, 0x17
	movs r2, 0x11
	b _0811F904
_0811F8F2:
	mov r0, r8
	cmp r0, 0
	bne _0811F90C
	movs r0, 0x2
	str r0, [sp]
	movs r0, 0x1
	str r0, [sp, 0x4]
	movs r1, 0x17
	movs r2, 0x12
_0811F904:
	movs r3, 0x7
	bl sub_80F6B08
	b _0811F91E
_0811F90C:
	movs r0, 0x2
	str r0, [sp]
	str r0, [sp, 0x4]
	movs r0, 0x1
	movs r1, 0x17
	movs r2, 0x12
	movs r3, 0x7
	bl sub_80F6B08
_0811F91E:
	ldr r0, _0811F940 @ =gUnknown_203B09C
	ldr r0, [r0]
	ldr r0, [r0, 0x8]
	lsls r0, 14
_0811F926:
	lsrs r0, 25
	mov r1, r8
	bl sub_81227B8
	movs r0, 0x1
	bl schedule_bg_copy_tilemap_to_vram
_0811F934:
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0811F940: .4byte gUnknown_203B09C
	thumb_func_end sub_811F818

	thumb_func_start sub_811F944
sub_811F944: @ 811F944
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r1, 24
	lsrs r1, 24
	movs r4, 0
	cmp r1, 0x1
	bne _0811F956
	movs r4, 0x1
_0811F956:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811F9D4 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x39
	bl GetMonData
	cmp r0, 0
	bne _0811F96C
	movs r0, 0x2
	orrs r4, r0
_0811F96C:
	ldr r2, _0811F9D8 @ =gUnknown_203B0A0
	ldrb r1, [r2, 0x8]
	movs r0, 0x30
	ands r0, r1
	cmp r0, 0x20
	bne _0811F98C
	cmp r5, 0x1
	beq _0811F984
	cmp r5, 0x4
	beq _0811F984
	cmp r5, 0x5
	bne _0811F98C
_0811F984:
	movs r0, 0x8
	orrs r4, r0
	lsls r0, r4, 24
	lsrs r4, r0, 24
_0811F98C:
	ldrb r1, [r2, 0xB]
	cmp r1, 0x9
	bne _0811F99A
	movs r0, 0x10
	orrs r4, r0
	lsls r0, r4, 24
	lsrs r4, r0, 24
_0811F99A:
	cmp r1, 0x8
	bne _0811F9B6
	movs r0, 0x9
	ldrsb r0, [r2, r0]
	cmp r5, r0
	beq _0811F9AE
	movs r0, 0xA
	ldrsb r0, [r2, r0]
	cmp r5, r0
	bne _0811F9B6
_0811F9AE:
	movs r0, 0x4
	orrs r4, r0
	lsls r0, r4, 24
	lsrs r4, r0, 24
_0811F9B6:
	ldrb r0, [r2, 0xB]
	cmp r0, 0xA
	bne _0811F9CC
	movs r0, 0x9
	ldrsb r0, [r2, r0]
	cmp r5, r0
	bne _0811F9CC
	movs r0, 0x20
	orrs r4, r0
	lsls r0, r4, 24
	lsrs r4, r0, 24
_0811F9CC:
	adds r0, r4, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0811F9D4: .4byte gPlayerParty
_0811F9D8: .4byte gUnknown_203B0A0
	thumb_func_end sub_811F944

	thumb_func_start sub_811F9DC
sub_811F9DC: @ 811F9DC
	push {r4-r6,lr}
	sub sp, 0xC
	ldr r1, _0811FA18 @ =gUnknown_8459FC4
	movs r6, 0x7
	str r6, [sp]
	movs r5, 0x2
	str r5, [sp, 0x4]
	movs r4, 0x11
	str r4, [sp, 0x8]
	movs r0, 0x1
	movs r2, 0x17
	movs r3, 0x10
	bl CopyToBgTilemapBufferRect_ChangePalette
	ldr r1, _0811FA1C @ =gUnknown_8459FE0
	str r6, [sp]
	str r5, [sp, 0x4]
	str r4, [sp, 0x8]
	movs r0, 0x1
	movs r2, 0x17
	movs r3, 0x12
	bl CopyToBgTilemapBufferRect_ChangePalette
	movs r0, 0x1
	bl schedule_bg_copy_tilemap_to_vram
	add sp, 0xC
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0811FA18: .4byte gUnknown_8459FC4
_0811FA1C: .4byte gUnknown_8459FE0
	thumb_func_end sub_811F9DC

	thumb_func_start sub_811FA20
sub_811FA20: @ 811FA20
	push {lr}
	ldr r0, _0811FA34 @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x4B
	ands r0, r1
	cmp r0, 0x4B
	beq _0811FA38
	movs r0, 0
	b _0811FA3A
	.align 2, 0
_0811FA34: .4byte gBattleTypeFlags
_0811FA38:
	movs r0, 0x1
_0811FA3A:
	pop {r1}
	bx r1
	thumb_func_end sub_811FA20

	thumb_func_start sub_811FA40
sub_811FA40: @ 811FA40
	push {r4-r6,lr}
	adds r4, r0, 0
	adds r6, r1, 0
	movs r0, 0x64
	bl Alloc
	adds r5, r0, 0
	adds r1, r4, 0
	movs r2, 0x64
	bl memcpy
	adds r0, r4, 0
	adds r1, r6, 0
	movs r2, 0x64
	bl memcpy
	adds r0, r6, 0
	adds r1, r5, 0
	movs r2, 0x64
	bl memcpy
	adds r0, r5, 0
	bl Free
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_811FA40

	thumb_func_start sub_811FA78
sub_811FA78: @ 811FA78
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x1
	negs r0, r0
	movs r1, 0x2
	negs r1, r1
	movs r2, 0
	str r2, [sp]
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, _0811FAAC @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0811FAB0 @ =sub_811FAB4
	str r1, [r0]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0811FAAC: .4byte gTasks
_0811FAB0: .4byte sub_811FAB4
	thumb_func_end sub_811FA78

	thumb_func_start sub_811FAB4
sub_811FAB4: @ 811FAB4
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _0811FAE8 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0811FB04
	ldr r4, _0811FAEC @ =gUnknown_203B0A0
	ldrb r1, [r4, 0x8]
	movs r0, 0xF
	ands r0, r1
	cmp r0, 0x1
	bne _0811FAD6
	bl sub_81280C4
_0811FAD6:
	ldr r0, _0811FAF0 @ =gUnknown_203B09C
	ldr r0, [r0]
	ldr r0, [r0, 0x4]
	cmp r0, 0
	beq _0811FAF4
	bl SetMainCallback2
	b _0811FAFA
	.align 2, 0
_0811FAE8: .4byte gPaletteFade
_0811FAEC: .4byte gUnknown_203B0A0
_0811FAF0: .4byte gUnknown_203B09C
_0811FAF4:
	ldr r0, [r4]
	bl SetMainCallback2
_0811FAFA:
	bl sub_811F070
	adds r0, r5, 0
	bl DestroyTask
_0811FB04:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_811FAB4

	thumb_func_start GetCursorSelectionMonId
GetCursorSelectionMonId: @ 811FB0C
	ldr r0, _0811FB14 @ =gUnknown_203B0A0
	ldrb r0, [r0, 0x9]
	bx lr
	.align 2, 0
_0811FB14: .4byte gUnknown_203B0A0
	thumb_func_end GetCursorSelectionMonId

	thumb_func_start sub_811FB18
sub_811FB18: @ 811FB18
	ldr r0, _0811FB24 @ =gUnknown_203B0A0
	ldrb r0, [r0, 0x8]
	lsls r0, 28
	lsrs r0, 28
	bx lr
	.align 2, 0
_0811FB24: .4byte gUnknown_203B0A0
	thumb_func_end sub_811FB18

	thumb_func_start sub_811FB28
sub_811FB28: @ 811FB28
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	adds r6, r5, 0
	ldr r0, _0811FB64 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0811FB98
	bl sub_80BF748
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0811FB98
	bl sub_811FBA4
	adds r4, r0, 0
	bl sub_811FEFC
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x2
	beq _0811FB78
	cmp r0, 0x2
	bgt _0811FB68
	cmp r0, 0x1
	beq _0811FB6E
	b _0811FB98
	.align 2, 0
_0811FB64: .4byte gPaletteFade
_0811FB68:
	cmp r0, 0x8
	beq _0811FB82
	b _0811FB98
_0811FB6E:
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_811FBC4
	b _0811FB98
_0811FB78:
	adds r0, r6, 0
	adds r1, r4, 0
	bl sub_811FD88
	b _0811FB98
_0811FB82:
	ldr r0, _0811FBA0 @ =gUnknown_203B09C
	ldr r0, [r0]
	ldrb r0, [r0, 0x8]
	lsls r0, 31
	cmp r0, 0
	beq _0811FB98
	movs r0, 0x5
	bl PlaySE
	bl sub_8124258
_0811FB98:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0811FBA0: .4byte gUnknown_203B09C
	thumb_func_end sub_811FB28

	thumb_func_start sub_811FBA4
sub_811FBA4: @ 811FBA4
	push {lr}
	ldr r0, _0811FBB8 @ =gUnknown_203B0A0
	ldrb r1, [r0, 0xB]
	cmp r1, 0x8
	beq _0811FBB2
	cmp r1, 0xA
	bne _0811FBBC
_0811FBB2:
	adds r0, 0xA
	b _0811FBBE
	.align 2, 0
_0811FBB8: .4byte gUnknown_203B0A0
_0811FBBC:
	adds r0, 0x9
_0811FBBE:
	pop {r1}
	bx r1
	thumb_func_end sub_811FBA4

	thumb_func_start sub_811FBC4
sub_811FBC4: @ 811FBC4
	push {r4-r6,lr}
	adds r5, r1, 0
	lsls r0, 24
	lsrs r6, r0, 24
	movs r0, 0
	ldrsb r0, [r5, r0]
	cmp r0, 0x6
	bne _0811FBE4
	ldr r0, _0811FBE0 @ =gUnknown_203B0A0
	ldr r1, [r0, 0x4]
	adds r0, r6, 0
	bl _call_via_r1
	b _0811FD56
	.align 2, 0
_0811FBE0: .4byte gUnknown_203B0A0
_0811FBE4:
	ldr r0, _0811FBFC @ =gUnknown_203B0A0
	ldrb r0, [r0, 0xB]
	subs r0, 0x3
	cmp r0, 0xA
	bls _0811FBF0
	b _0811FD4A
_0811FBF0:
	lsls r0, 2
	ldr r1, _0811FC00 @ =_0811FC04
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0811FBFC: .4byte gUnknown_203B0A0
_0811FC00: .4byte _0811FC04
	.align 2, 0
_0811FC04:
	.4byte _0811FC46
	.4byte _0811FD4A
	.4byte _0811FCC0
	.4byte _0811FCC0
	.4byte _0811FCA6
	.4byte _0811FCDA
	.4byte _0811FD4A
	.4byte _0811FC30
	.4byte _0811FCE8
	.4byte _0811FC8C
	.4byte _0811FD34
_0811FC30:
	adds r0, r5, 0
	bl sub_811FD5C
	lsls r0, 24
	cmp r0, 0
	bne _0811FC3E
	b _0811FD56
_0811FC3E:
	adds r0, r6, 0
	bl sub_80E5724
	b _0811FD56
_0811FC46:
	adds r0, r5, 0
	bl sub_811FD5C
	lsls r0, 24
	cmp r0, 0
	bne _0811FC54
	b _0811FD56
_0811FC54:
	ldr r0, _0811FC78 @ =gUnknown_203B0A0
	ldrb r1, [r0, 0x8]
	movs r0, 0xF
	ands r0, r1
	cmp r0, 0x1
	bne _0811FC68
	ldr r0, _0811FC7C @ =gUnknown_203B09C
	ldr r1, [r0]
	ldr r0, _0811FC80 @ =sub_8128184
	str r0, [r1, 0x4]
_0811FC68:
	ldr r0, _0811FC84 @ =gUnknown_3005E98
	ldr r1, _0811FC88 @ =sub_81255BC
	ldr r2, [r0]
	adds r0, r6, 0
	bl _call_via_r2
	b _0811FD56
	.align 2, 0
_0811FC78: .4byte gUnknown_203B0A0
_0811FC7C: .4byte gUnknown_203B09C
_0811FC80: .4byte sub_8128184
_0811FC84: .4byte gUnknown_3005E98
_0811FC88: .4byte sub_81255BC
_0811FC8C:
	adds r0, r5, 0
	bl sub_811FD5C
	lsls r0, 24
	cmp r0, 0
	beq _0811FD56
	movs r0, 0x5
	bl PlaySE
	adds r0, r6, 0
	bl sub_8126DC8
	b _0811FD56
_0811FCA6:
	adds r0, r5, 0
	bl sub_811FD5C
	lsls r0, 24
	cmp r0, 0
	beq _0811FD56
	movs r0, 0x5
	bl PlaySE
	adds r0, r6, 0
	bl sub_8127404
	b _0811FD56
_0811FCC0:
	adds r0, r5, 0
	bl sub_811FD5C
	lsls r0, 24
	cmp r0, 0
	beq _0811FD56
	movs r0, 0x5
	bl PlaySE
	adds r0, r6, 0
	bl sub_8126F40
	b _0811FD56
_0811FCDA:
	movs r0, 0x5
	bl PlaySE
	adds r0, r6, 0
	bl sub_8122E5C
	b _0811FD56
_0811FCE8:
	movs r0, 0x5
	bl PlaySE
	ldr r1, _0811FD24 @ =gSpecialVar_0x8004
	movs r0, 0
	ldrsb r0, [r5, r0]
	strh r0, [r1]
	ldr r0, _0811FD28 @ =gUnknown_203B0A0
	ldrb r1, [r0, 0x8]
	movs r0, 0xF
	ands r0, r1
	cmp r0, 0x7
	bne _0811FD1A
	ldr r4, _0811FD2C @ =gSpecialVar_0x8005
	movs r1, 0
	ldrsb r1, [r5, r1]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0811FD30 @ =gPlayerParty
	adds r0, r1
	bl GetNumberOfRelearnableMoves
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4]
_0811FD1A:
	adds r0, r6, 0
	bl sub_811FA78
	b _0811FD56
	.align 2, 0
_0811FD24: .4byte gSpecialVar_0x8004
_0811FD28: .4byte gUnknown_203B0A0
_0811FD2C: .4byte gSpecialVar_0x8005
_0811FD30: .4byte gPlayerParty
_0811FD34:
	adds r0, r5, 0
	bl sub_811FD5C
	lsls r0, 24
	cmp r0, 0
	beq _0811FD56
	ldrb r1, [r5]
	adds r0, r6, 0
	bl sub_81209F4
	b _0811FD56
_0811FD4A:
	movs r0, 0x5
	bl PlaySE
	adds r0, r6, 0
	bl sub_8122C30
_0811FD56:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_811FBC4

	thumb_func_start sub_811FD5C
sub_811FD5C: @ 811FD5C
	push {lr}
	ldrb r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0811FD78 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0x1
	beq _0811FD7C
	movs r0, 0x1
	b _0811FD84
	.align 2, 0
_0811FD78: .4byte gPlayerParty
_0811FD7C:
	movs r0, 0x1A
	bl PlaySE
	movs r0, 0
_0811FD84:
	pop {r1}
	bx r1
	thumb_func_end sub_811FD5C

	thumb_func_start sub_811FD88
sub_811FD88: @ 811FD88
	push {r4,r5,lr}
	adds r5, r1, 0
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0811FDA4 @ =gUnknown_203B0A0
	ldrb r0, [r0, 0xB]
	cmp r0, 0x8
	beq _0811FDBA
	cmp r0, 0x8
	bgt _0811FDA8
	cmp r0, 0x1
	beq _0811FDB2
	b _0811FDD6
	.align 2, 0
_0811FDA4: .4byte gUnknown_203B0A0
_0811FDA8:
	cmp r0, 0xA
	beq _0811FDBA
	cmp r0, 0xD
	beq _0811FDC8
	b _0811FDD6
_0811FDB2:
	movs r0, 0x1A
	bl PlaySE
	b _0811FE14
_0811FDBA:
	movs r0, 0x5
	bl PlaySE
	adds r0, r4, 0
	bl sub_81235E8
	b _0811FE14
_0811FDC8:
	movs r0, 0x5
	bl PlaySE
	adds r0, r4, 0
	bl sub_8120A58
	b _0811FE14
_0811FDD6:
	movs r0, 0x5
	bl PlaySE
	ldr r0, _0811FDF0 @ =gUnknown_203B0A0
	ldrb r1, [r0, 0x8]
	movs r0, 0xF
	ands r0, r1
	cmp r0, 0x4
	bne _0811FDF4
	adds r0, r4, 0
	bl sub_811FE24
	b _0811FE14
	.align 2, 0
_0811FDF0: .4byte gUnknown_203B0A0
_0811FDF4:
	bl sub_80BF708
	lsls r0, 24
	cmp r0, 0
	bne _0811FE04
	ldr r1, _0811FE1C @ =gSpecialVar_0x8004
	movs r0, 0x7
	strh r0, [r1]
_0811FE04:
	ldr r0, _0811FE20 @ =gUnknown_203B0C0
	movs r1, 0
	strb r1, [r0]
	movs r0, 0x7
	strb r0, [r5]
	adds r0, r4, 0
	bl sub_811FA78
_0811FE14:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0811FE1C: .4byte gSpecialVar_0x8004
_0811FE20: .4byte gUnknown_203B0C0
	thumb_func_end sub_811FD88

	thumb_func_start sub_811FE24
sub_811FE24: @ 811FE24
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _0811FE5C @ =gUnknown_203B09C
	ldr r0, [r0]
	adds r0, 0xD
	bl sub_8121CE4
	ldr r5, _0811FE60 @ =gStringVar4
	ldr r1, _0811FE64 @ =gUnknown_84176CF
	adds r0, r5, 0
	bl StringExpandPlaceholders
	adds r0, r5, 0
	movs r1, 0x1
	bl sub_81202F8
	ldr r1, _0811FE68 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0811FE6C @ =sub_811FE70
	str r1, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0811FE5C: .4byte gUnknown_203B09C
_0811FE60: .4byte gStringVar4
_0811FE64: .4byte gUnknown_84176CF
_0811FE68: .4byte gTasks
_0811FE6C: .4byte sub_811FE70
	thumb_func_end sub_811FE24

	thumb_func_start sub_811FE70
sub_811FE70: @ 811FE70
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_8120370
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0811FE94
	bl sub_812200C
	ldr r0, _0811FE9C @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _0811FEA0 @ =sub_811FEA4
	str r0, [r1]
_0811FE94:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0811FE9C: .4byte gTasks
_0811FEA0: .4byte sub_811FEA4
	thumb_func_end sub_811FE70

	thumb_func_start sub_811FEA4
sub_811FEA4: @ 811FEA4
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl Menu_ProcessInputNoWrapClearOnChoose
	lsls r0, 24
	asrs r1, r0, 24
	cmp r1, 0
	beq _0811FECA
	cmp r1, 0
	bgt _0811FEC4
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _0811FEE8
	b _0811FEF4
_0811FEC4:
	cmp r1, 0x1
	beq _0811FEEE
	b _0811FEF4
_0811FECA:
	ldr r0, _0811FEE0 @ =gUnknown_203B0C0
	strb r1, [r0]
	ldr r1, _0811FEE4 @ =gUnknown_203B0A0
	movs r0, 0x7
	strb r0, [r1, 0x9]
	bl sub_81274FC
	adds r0, r4, 0
	bl sub_811FA78
	b _0811FEF4
	.align 2, 0
_0811FEE0: .4byte gUnknown_203B0C0
_0811FEE4: .4byte gUnknown_203B0A0
_0811FEE8:
	movs r0, 0x5
	bl PlaySE
_0811FEEE:
	adds r0, r4, 0
	bl sub_81203B8
_0811FEF4:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_811FEA4

	thumb_func_start sub_811FEFC
sub_811FEFC: @ 811FEFC
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _0811FF14 @ =gMain
	ldrh r1, [r0, 0x30]
	adds r3, r0, 0
	cmp r1, 0x20
	beq _0811FF2A
	cmp r1, 0x20
	bgt _0811FF18
	cmp r1, 0x10
	beq _0811FF2E
	b _0811FF32
	.align 2, 0
_0811FF14: .4byte gMain
_0811FF18:
	cmp r1, 0x40
	beq _0811FF22
	cmp r1, 0x80
	beq _0811FF26
	b _0811FF32
_0811FF22:
	movs r1, 0xFF
	b _0811FF4E
_0811FF26:
	movs r1, 0x1
	b _0811FF4E
_0811FF2A:
	movs r1, 0xFE
	b _0811FF4E
_0811FF2E:
	movs r1, 0x2
	b _0811FF4E
_0811FF32:
	bl sub_80BF66C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0811FF46
	cmp r0, 0x2
	beq _0811FF4A
	movs r1, 0
	b _0811FF4C
_0811FF46:
	movs r1, 0xFF
	b _0811FF4C
_0811FF4A:
	movs r1, 0x1
_0811FF4C:
	ldr r3, _0811FF5C @ =gMain
_0811FF4E:
	ldrh r2, [r3, 0x2E]
	movs r0, 0x8
	ands r0, r2
	cmp r0, 0
	beq _0811FF60
	movs r0, 0x8
	b _0811FF8C
	.align 2, 0
_0811FF5C: .4byte gMain
_0811FF60:
	lsls r0, r1, 24
	asrs r1, r0, 24
	cmp r1, 0
	beq _0811FF72
	adds r0, r4, 0
	bl sub_811FF94
	movs r0, 0
	b _0811FF8C
_0811FF72:
	movs r0, 0x1
	ands r0, r2
	cmp r0, 0
	beq _0811FF86
	movs r0, 0
	ldrsb r0, [r4, r0]
	cmp r0, 0x7
	bne _0811FF86
	movs r0, 0x2
	b _0811FF8C
_0811FF86:
	ldrh r1, [r3, 0x2E]
	movs r0, 0x3
	ands r0, r1
_0811FF8C:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_811FEFC

	thumb_func_start sub_811FF94
sub_811FF94: @ 811FF94
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldrb r4, [r5]
	ldr r0, _0811FFB8 @ =gUnknown_203B0A0
	ldrb r0, [r0, 0x8]
	lsls r0, 26
	lsrs r0, 30
	cmp r0, 0
	bne _0811FFBC
	lsls r1, 24
	asrs r1, 24
	adds r0, r5, 0
	bl sub_811FFF0
	b _0811FFC6
	.align 2, 0
_0811FFB8: .4byte gUnknown_203B0A0
_0811FFBC:
	lsls r1, 24
	asrs r1, 24
	adds r0, r5, 0
	bl sub_81200F8
_0811FFC6:
	movs r1, 0
	ldrsb r1, [r5, r1]
	lsls r4, 24
	asrs r0, r4, 24
	cmp r1, r0
	beq _0811FFE8
	movs r0, 0x5
	bl PlaySE
	lsrs r0, r4, 24
	movs r1, 0
	bl sub_811F818
	ldrb r0, [r5]
	movs r1, 0x1
	bl sub_811F818
_0811FFE8:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_811FF94

	thumb_func_start sub_811FFF0
sub_811FFF0: @ 811FFF0
	push {r4,lr}
	adds r4, r0, 0
	lsls r1, 24
	asrs r1, 24
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _08120016
	cmp r1, r0
	bgt _0812000C
	subs r0, 0x1
	cmp r1, r0
	beq _081200C0
	b _081200EE
_0812000C:
	cmp r1, 0x1
	beq _0812005C
	cmp r1, 0x2
	beq _08120094
	b _081200EE
_08120016:
	ldrb r0, [r4]
	movs r1, 0
	ldrsb r1, [r4, r1]
	cmp r1, 0
	bne _08120024
	movs r0, 0x7
	b _081200EC
_08120024:
	cmp r1, 0x6
	bne _08120034
	ldr r0, _08120030 @ =gPlayerPartyCount
	ldrb r0, [r0]
	subs r0, 0x1
	b _081200EC
	.align 2, 0
_08120030: .4byte gPlayerPartyCount
_08120034:
	cmp r1, 0x7
	bne _08120058
	ldr r0, _08120048 @ =gUnknown_203B09C
	ldr r0, [r0]
	ldrb r0, [r0, 0x8]
	lsls r0, 31
	cmp r0, 0
	beq _0812004C
	movs r0, 0x6
	b _081200EC
	.align 2, 0
_08120048: .4byte gUnknown_203B09C
_0812004C:
	ldr r0, _08120054 @ =gPlayerPartyCount
	ldrb r0, [r0]
	subs r0, 0x1
	b _081200EC
	.align 2, 0
_08120054: .4byte gPlayerPartyCount
_08120058:
	subs r0, 0x1
	b _081200EC
_0812005C:
	ldrb r2, [r4]
	movs r0, 0
	ldrsb r0, [r4, r0]
	cmp r0, 0x7
	beq _081200EA
	movs r1, 0
	ldrsb r1, [r4, r1]
	ldr r0, _08120084 @ =gPlayerPartyCount
	ldrb r0, [r0]
	subs r0, 0x1
	cmp r1, r0
	bne _08120090
	ldr r0, _08120088 @ =gUnknown_203B09C
	ldr r0, [r0]
	ldrb r0, [r0, 0x8]
	lsls r0, 31
	cmp r0, 0
	beq _0812008C
	movs r0, 0x6
	b _081200EC
	.align 2, 0
_08120084: .4byte gPlayerPartyCount
_08120088: .4byte gUnknown_203B09C
_0812008C:
	movs r0, 0x7
	b _081200EC
_08120090:
	adds r0, r2, 0x1
	b _081200EC
_08120094:
	ldr r0, _081200B8 @ =gPlayerPartyCount
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _081200EE
	movs r0, 0
	ldrsb r0, [r4, r0]
	cmp r0, 0
	bne _081200EE
	ldr r0, _081200BC @ =gUnknown_203B09C
	ldr r0, [r0]
	ldrb r0, [r0, 0x8]
	lsls r0, 28
	lsrs r0, 29
	cmp r0, 0
	bne _081200EC
	movs r0, 0x1
	b _081200EC
	.align 2, 0
_081200B8: .4byte gPlayerPartyCount
_081200BC: .4byte gUnknown_203B09C
_081200C0:
	movs r0, 0
	ldrsb r0, [r4, r0]
	cmp r0, 0
	beq _081200EE
	cmp r0, 0x6
	beq _081200EE
	cmp r0, 0x7
	beq _081200EE
	ldr r0, _081200F4 @ =gUnknown_203B09C
	ldr r3, [r0]
	movs r1, 0
	ldrsb r1, [r4, r1]
	movs r0, 0x7
	ands r1, r0
	lsls r1, 1
	ldrb r2, [r3, 0x8]
	movs r0, 0xF
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, 0x8]
_081200EA:
	movs r0, 0
_081200EC:
	strb r0, [r4]
_081200EE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081200F4: .4byte gUnknown_203B09C
	thumb_func_end sub_811FFF0

	thumb_func_start sub_81200F8
sub_81200F8: @ 81200F8
	push {r4-r6,lr}
	adds r4, r0, 0
	lsls r1, 24
	lsrs r2, r1, 24
	asrs r5, r1, 24
	movs r6, 0x1
	negs r6, r6
	cmp r5, r6
	beq _08120124
	cmp r5, r6
	bgt _0812011A
	movs r0, 0x2
	negs r0, r0
	cmp r5, r0
	bne _08120118
	b _08120238
_08120118:
	b _08120290
_0812011A:
	cmp r5, 0x1
	beq _08120180
	cmp r5, 0x2
	beq _081201C0
	b _08120290
_08120124:
	ldrb r1, [r4]
	movs r0, 0
	ldrsb r0, [r4, r0]
	cmp r0, 0
	bne _08120132
	movs r0, 0x7
	b _0812028E
_08120132:
	cmp r0, 0x6
	bne _08120144
	ldr r0, _08120140 @ =gPlayerPartyCount
	ldrb r0, [r0]
	subs r0, 0x1
	b _0812028E
	.align 2, 0
_08120140: .4byte gPlayerPartyCount
_08120144:
	cmp r0, 0x7
	bne _08120160
	ldr r0, _08120158 @ =gUnknown_203B09C
	ldr r0, [r0]
	ldrb r0, [r0, 0x8]
	lsls r0, 31
	cmp r0, 0
	beq _0812015C
	movs r0, 0x6
	b _0812028E
	.align 2, 0
_08120158: .4byte gUnknown_203B09C
_0812015C:
	subs r0, r1, 0x1
	strb r0, [r4]
_08120160:
	movs r0, 0
	ldrsb r0, [r4, r0]
	lsls r1, r2, 24
	asrs r1, 24
	bl sub_812029C
	lsls r0, 24
	lsrs r2, r0, 24
	asrs r0, 24
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	bne _0812017C
	b _08120290
_0812017C:
	strb r2, [r4]
	b _08120290
_08120180:
	movs r0, 0
	ldrsb r0, [r4, r0]
	cmp r0, 0x6
	bne _0812018C
	movs r0, 0x7
	b _0812028E
_0812018C:
	cmp r0, 0x7
	bne _08120194
	movs r0, 0
	b _0812028E
_08120194:
	movs r0, 0
	ldrsb r0, [r4, r0]
	movs r1, 0x1
	bl sub_812029C
	lsls r0, 24
	lsrs r2, r0, 24
	asrs r0, 24
	cmp r0, r6
	bne _0812017C
	ldr r0, _081201B8 @ =gUnknown_203B09C
	ldr r0, [r0]
	ldrb r0, [r0, 0x8]
	lsls r0, 31
	cmp r0, 0
	beq _081201BC
	movs r0, 0x6
	b _0812028E
	.align 2, 0
_081201B8: .4byte gUnknown_203B09C
_081201BC:
	movs r0, 0x7
	b _0812028E
_081201C0:
	movs r0, 0
	ldrsb r0, [r4, r0]
	cmp r0, 0
	bne _081201F8
	ldr r0, _081201E8 @ =gUnknown_203B09C
	ldr r0, [r0]
	ldrb r0, [r0, 0x8]
	lsls r0, 28
	lsrs r6, r0, 29
	cmp r6, 0x3
	bne _081201F0
	ldr r0, _081201EC @ =gUnknown_20243B0
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _08120290
	strb r6, [r4]
	b _08120290
	.align 2, 0
_081201E8: .4byte gUnknown_203B09C
_081201EC: .4byte gUnknown_20243B0
_081201F0:
	ldr r0, _081201F4 @ =gUnknown_202434C
	b _0812020C
	.align 2, 0
_081201F4: .4byte gUnknown_202434C
_081201F8:
	cmp r0, 0x1
	bne _08120290
	ldr r0, _0812021C @ =gUnknown_203B09C
	ldr r0, [r0]
	ldrb r0, [r0, 0x8]
	lsls r0, 28
	lsrs r5, r0, 29
	cmp r5, 0x5
	bne _08120224
	ldr r0, _08120220 @ =gUnknown_2024478
_0812020C:
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _08120290
	strb r5, [r4]
	b _08120290
	.align 2, 0
_0812021C: .4byte gUnknown_203B09C
_08120220: .4byte gUnknown_2024478
_08120224:
	ldr r0, _08120234 @ =gUnknown_2024414
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _08120290
	movs r0, 0x4
	b _0812028E
	.align 2, 0
_08120234: .4byte gUnknown_2024414
_08120238:
	ldrb r1, [r4]
	subs r0, r1, 0x2
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bhi _08120268
	ldr r0, _08120264 @ =gUnknown_203B09C
	ldr r3, [r0]
	movs r1, 0
	ldrsb r1, [r4, r1]
	movs r0, 0x7
	ands r1, r0
	lsls r1, 1
	ldrb r2, [r3, 0x8]
	movs r0, 0xF
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, 0x8]
	movs r0, 0
	b _0812028E
	.align 2, 0
_08120264: .4byte gUnknown_203B09C
_08120268:
	subs r0, r1, 0x4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bhi _08120290
	ldr r0, _08120298 @ =gUnknown_203B09C
	ldr r3, [r0]
	movs r1, 0
	ldrsb r1, [r4, r1]
	movs r0, 0x7
	ands r1, r0
	lsls r1, 1
	ldrb r2, [r3, 0x8]
	movs r0, 0xF
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, 0x8]
	movs r0, 0x1
_0812028E:
	strb r0, [r4]
_08120290:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08120298: .4byte gUnknown_203B09C
	thumb_func_end sub_81200F8

	thumb_func_start sub_812029C
sub_812029C: @ 812029C
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r1, 24
	asrs r6, r1, 24
_081202A6:
	lsls r0, r5, 24
	asrs r0, 24
	adds r0, r6
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r1, r5, 24
	lsrs r0, r1, 24
	cmp r0, 0x5
	bhi _081202D4
	asrs r4, r1, 24
	movs r0, 0x64
	muls r0, r4
	ldr r1, _081202D0 @ =gPlayerParty
	adds r0, r1
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _081202A6
	adds r0, r4, 0
	b _081202D8
	.align 2, 0
_081202D0: .4byte gPlayerParty
_081202D4:
	movs r0, 0x1
	negs r0, r0
_081202D8:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_812029C

	thumb_func_start GetMonNickname
GetMonNickname: @ 81202E0
	push {r4,lr}
	adds r4, r1, 0
	movs r1, 0x2
	adds r2, r4, 0
	bl GetMonData
	adds r0, r4, 0
	bl StringGetEnd10
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end GetMonNickname

	thumb_func_start sub_81202F8
sub_81202F8: @ 81202F8
	push {r4,lr}
	lsls r4, r1, 24
	lsrs r4, 24
	bl sub_8121FC0
	ldr r0, _08120320 @ =sub_8120328
	movs r1, 0x1
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08120324 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r4, [r1, 0x8]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08120320: .4byte sub_8120328
_08120324: .4byte gTasks
	thumb_func_end sub_81202F8

	thumb_func_start sub_8120328
sub_8120328: @ 8120328
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r5, r4, 0
	movs r0, 0x6
	bl sub_80BF518
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	beq _08120364
	ldr r0, _0812036C @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	movs r2, 0x8
	ldrsh r0, [r1, r2]
	cmp r0, 0
	bne _0812035E
	movs r0, 0x6
	movs r1, 0
	bl sub_810F4D8
	movs r0, 0x6
	bl ClearWindowTilemap
_0812035E:
	adds r0, r5, 0
	bl DestroyTask
_08120364:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0812036C: .4byte gTasks
	thumb_func_end sub_8120328

	thumb_func_start sub_8120370
sub_8120370: @ 8120370
	push {lr}
	ldr r0, _08120380 @ =sub_8120328
	bl FuncIsActiveTask
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_08120380: .4byte sub_8120328
	thumb_func_end sub_8120370

	thumb_func_start sub_8120384
sub_8120384: @ 8120384
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_80BF748
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _081203AA
	movs r0, 0
	bl sub_8121D0C
	ldr r0, _081203B0 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _081203B4 @ =sub_811FB28
	str r0, [r1]
_081203AA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081203B0: .4byte gTasks
_081203B4: .4byte sub_811FB28
	thumb_func_end sub_8120384

	thumb_func_start sub_81203B8
sub_81203B8: @ 81203B8
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r5, r4, 0
	bl sub_8120370
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08120410
	movs r0, 0x6
	movs r1, 0
	bl sub_810F4D8
	movs r0, 0x6
	bl ClearWindowTilemap
	bl sub_80BF708
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _081203FC
	ldr r0, _081203F4 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _081203F8 @ =sub_8120384
	b _0812040E
	.align 2, 0
_081203F4: .4byte gTasks
_081203F8: .4byte sub_8120384
_081203FC:
	movs r0, 0
	bl sub_8121D0C
	ldr r0, _08120418 @ =gTasks
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	ldr r0, _0812041C @ =sub_811FB28
_0812040E:
	str r0, [r1]
_08120410:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08120418: .4byte gTasks
_0812041C: .4byte sub_811FB28
	thumb_func_end sub_81203B8

	thumb_func_start sub_8120420
sub_8120420: @ 8120420
	push {r4-r6,lr}
	adds r5, r0, 0
	lsls r1, 16
	lsrs r4, r1, 16
	lsls r2, 24
	lsrs r6, r2, 24
	lsls r3, 24
	cmp r3, 0
	bne _0812043C
	ldr r3, _08120438 @ =0x0000ffff
	movs r0, 0x5
	b _08120448
	.align 2, 0
_08120438: .4byte 0x0000ffff
_0812043C:
	ldr r0, _08120454 @ =gUnknown_203B0A0
	ldrb r0, [r0, 0xB]
	cmp r0, 0x6
	bne _0812045C
	ldr r3, _08120458 @ =0x0000ffff
	movs r0, 0x7
_08120448:
	adds r1, r5, 0
	adds r2, r4, 0
	bl sub_80A2294
	b _08120468
	.align 2, 0
_08120454: .4byte gUnknown_203B0A0
_08120458: .4byte 0x0000ffff
_0812045C:
	ldr r3, _08120498 @ =0x0000ffff
	movs r0, 0x6
	adds r1, r5, 0
	adds r2, r4, 0
	bl sub_80A2294
_08120468:
	ldr r1, _0812049C @ =gStringVar1
	adds r0, r5, 0
	bl GetMonNickname
	ldr r1, _081204A0 @ =gStringVar2
	adds r0, r4, 0
	bl CopyItemName
	ldr r4, _081204A4 @ =gStringVar4
	ldr r1, _081204A8 @ =gUnknown_8416C2A
	adds r0, r4, 0
	bl StringExpandPlaceholders
	adds r0, r4, 0
	adds r1, r6, 0
	bl sub_81202F8
	movs r0, 0x2
	bl schedule_bg_copy_tilemap_to_vram
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08120498: .4byte 0x0000ffff
_0812049C: .4byte gStringVar1
_081204A0: .4byte gStringVar2
_081204A4: .4byte gStringVar4
_081204A8: .4byte gUnknown_8416C2A
	thumb_func_end sub_8120420

	thumb_func_start sub_81204AC
sub_81204AC: @ 81204AC
	push {r4-r6,lr}
	adds r6, r0, 0
	adds r4, r1, 0
	adds r5, r2, 0
	lsls r4, 16
	lsrs r4, 16
	lsls r5, 24
	lsrs r5, 24
	ldr r3, _081204F8 @ =0x0000ffff
	movs r0, 0x8
	adds r1, r6, 0
	adds r2, r4, 0
	bl sub_80A2294
	ldr r1, _081204FC @ =gStringVar1
	adds r0, r6, 0
	bl GetMonNickname
	ldr r1, _08120500 @ =gStringVar2
	adds r0, r4, 0
	bl CopyItemName
	ldr r4, _08120504 @ =gStringVar4
	ldr r1, _08120508 @ =gUnknown_8416CAC
	adds r0, r4, 0
	bl StringExpandPlaceholders
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_81202F8
	movs r0, 0x2
	bl schedule_bg_copy_tilemap_to_vram
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081204F8: .4byte 0x0000ffff
_081204FC: .4byte gStringVar1
_08120500: .4byte gStringVar2
_08120504: .4byte gStringVar4
_08120508: .4byte gUnknown_8416CAC
	thumb_func_end sub_81204AC

	thumb_func_start sub_812050C
sub_812050C: @ 812050C
	push {r4,r5,lr}
	adds r4, r1, 0
	adds r5, r2, 0
	lsls r4, 16
	lsrs r4, 16
	lsls r5, 24
	lsrs r5, 24
	ldr r1, _08120548 @ =gStringVar1
	bl GetMonNickname
	ldr r1, _0812054C @ =gStringVar2
	adds r0, r4, 0
	bl CopyItemName
	ldr r4, _08120550 @ =gStringVar4
	ldr r1, _08120554 @ =gUnknown_8416C49
	adds r0, r4, 0
	bl StringExpandPlaceholders
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_81202F8
	movs r0, 0x2
	bl schedule_bg_copy_tilemap_to_vram
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08120548: .4byte gStringVar1
_0812054C: .4byte gStringVar2
_08120550: .4byte gStringVar4
_08120554: .4byte gUnknown_8416C49
	thumb_func_end sub_812050C

	thumb_func_start sub_8120558
sub_8120558: @ 8120558
	push {r4-r6,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r6, r2, 0
	lsls r4, 16
	lsrs r4, 16
	lsls r5, 16
	lsrs r5, 16
	lsls r6, 24
	lsrs r6, 24
	ldr r0, _081205B0 @ =gUnknown_203B0A0
	movs r1, 0x9
	ldrsb r1, [r0, r1]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _081205B4 @ =gPlayerParty
	adds r0, r1
	adds r1, r5, 0
	adds r2, r4, 0
	bl sub_8124B60
	ldr r1, _081205B8 @ =gStringVar1
	adds r0, r4, 0
	bl CopyItemName
	ldr r1, _081205BC @ =gStringVar2
	adds r0, r5, 0
	bl CopyItemName
	ldr r4, _081205C0 @ =gStringVar4
	ldr r1, _081205C4 @ =gUnknown_8416CEA
	adds r0, r4, 0
	bl StringExpandPlaceholders
	adds r0, r4, 0
	adds r1, r6, 0
	bl sub_81202F8
	movs r0, 0x2
	bl schedule_bg_copy_tilemap_to_vram
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081205B0: .4byte gUnknown_203B0A0
_081205B4: .4byte gPlayerParty
_081205B8: .4byte gStringVar1
_081205BC: .4byte gStringVar2
_081205C0: .4byte gStringVar4
_081205C4: .4byte gUnknown_8416CEA
	thumb_func_end sub_8120558

	thumb_func_start sub_81205C8
sub_81205C8: @ 81205C8
	push {r4-r7,lr}
	sub sp, 0x4
	adds r6, r0, 0
	lsls r5, r1, 16
	lsrs r4, r5, 16
	adds r7, r4, 0
	adds r0, r4, 0
	bl itemid_is_mail
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _081205F2
	adds r0, r6, 0
	adds r1, r4, 0
	bl sub_8097D38
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	beq _08120606
_081205F2:
	mov r0, sp
	strb r7, [r0]
	mov r1, sp
	lsrs r0, r5, 24
	strb r0, [r1, 0x1]
	adds r0, r6, 0
	movs r1, 0xC
	mov r2, sp
	bl SetMonData
_08120606:
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_81205C8

	thumb_func_start sub_8120610
sub_8120610: @ 8120610
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	movs r1, 0xC
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	mov r1, sp
	strh r0, [r1]
	cmp r0, 0
	bne _0812062C
	movs r0, 0
	b _0812064E
_0812062C:
	movs r1, 0x1
	bl AddBagItem
	lsls r0, 24
	cmp r0, 0
	beq _0812064C
	movs r1, 0
	mov r0, sp
	strh r1, [r0]
	adds r0, r4, 0
	movs r1, 0xC
	mov r2, sp
	bl SetMonData
	movs r0, 0x2
	b _0812064E
_0812064C:
	movs r0, 0x1
_0812064E:
	add sp, 0x4
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8120610

	thumb_func_start sub_8120658
sub_8120658: @ 8120658
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	bl ItemId_GetPocket
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	beq _08120678
	cmp r0, 0x5
	beq _0812067E
	ldr r1, _08120674 @ =gUnknown_8416285
	b _08120686
	.align 2, 0
_08120674: .4byte gUnknown_8416285
_08120678:
	movs r0, 0xB6
	lsls r0, 1
	b _08120680
_0812067E:
	ldr r0, _08120698 @ =0x0000016d
_08120680:
	bl ItemId_GetItem
	adds r1, r0, 0
_08120686:
	ldr r0, _0812069C @ =gStringVar1
	bl StringCopy
	ldr r0, _081206A0 @ =gStringVar4
	ldr r1, _081206A4 @ =gUnknown_8416D78
	bl StringExpandPlaceholders
	pop {r0}
	bx r0
	.align 2, 0
_08120698: .4byte 0x0000016d
_0812069C: .4byte gStringVar1
_081206A0: .4byte gStringVar4
_081206A4: .4byte gUnknown_8416D78
	thumb_func_end sub_8120658

	thumb_func_start sub_81206A8
sub_81206A8: @ 81206A8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r0, 2
	add r0, r8
	lsls r0, 3
	ldr r1, _08120750 @ =gTasks+0x8
	adds r7, r0, r1
	ldrh r0, [r7, 0x4]
	ldrh r1, [r7]
	adds r0, r1
	strh r0, [r7]
	ldrh r0, [r7, 0x6]
	subs r0, 0x1
	strh r0, [r7, 0x6]
	movs r2, 0x8
	ldrsh r0, [r7, r2]
	movs r5, 0x64
	muls r0, r5
	ldr r4, _08120754 @ =gPlayerParty
	adds r0, r4
	movs r1, 0x39
	adds r2, r7, 0
	bl SetMonData
	movs r3, 0x8
	ldrsh r2, [r7, r3]
	adds r0, r2, 0
	muls r0, r5
	adds r0, r4
	ldr r6, _08120758 @ =gUnknown_203B0B4
	lsls r2, 4
	ldr r1, [r6]
	adds r1, r2
	movs r2, 0x1
	bl sub_812199C
	movs r0, 0x8
	ldrsh r2, [r7, r0]
	adds r0, r2, 0
	muls r0, r5
	adds r0, r4
	lsls r2, 4
	ldr r1, [r6]
	adds r1, r2
	bl sub_8121AF0
	movs r1, 0x6
	ldrsh r0, [r7, r1]
	cmp r0, 0
	beq _08120724
	movs r2, 0
	ldrsh r1, [r7, r2]
	cmp r1, 0
	beq _08120724
	movs r3, 0x2
	ldrsh r0, [r7, r3]
	cmp r1, r0
	bne _08120746
_08120724:
	movs r0, 0
	ldrsh r1, [r7, r0]
	movs r2, 0xA
	ldrsh r0, [r7, r2]
	cmp r1, r0
	ble _08120740
	ldr r0, _0812075C @ =gStringVar2
	movs r3, 0xA
	ldrsh r2, [r7, r3]
	subs r1, r2
	movs r2, 0
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
_08120740:
	mov r0, r8
	bl SwitchTaskToFollowupFunc
_08120746:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08120750: .4byte gTasks+0x8
_08120754: .4byte gPlayerParty
_08120758: .4byte gUnknown_203B0B4
_0812075C: .4byte gStringVar2
	thumb_func_end sub_81206A8

	thumb_func_start sub_8120760
sub_8120760: @ 8120760
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	mov r8, r0
	mov r9, r1
	adds r5, r2, 0
	mov r10, r3
	ldr r7, [sp, 0x20]
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	mov r0, r9
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	lsls r5, 24
	lsrs r5, 24
	mov r0, r10
	lsls r0, 16
	lsrs r0, 16
	mov r10, r0
	movs r0, 0x64
	mov r6, r9
	muls r6, r0
	ldr r0, _081207E4 @ =gPlayerParty
	adds r6, r0
	mov r0, r8
	lsls r4, r0, 2
	add r4, r8
	lsls r4, 3
	ldr r0, _081207E8 @ =gTasks+0x8
	adds r4, r0
	adds r0, r6, 0
	movs r1, 0x39
	bl GetMonData
	strh r0, [r4]
	adds r0, r6, 0
	movs r1, 0x3A
	bl GetMonData
	strh r0, [r4, 0x2]
	lsls r5, 24
	asrs r5, 24
	strh r5, [r4, 0x4]
	mov r0, r10
	strh r0, [r4, 0x6]
	mov r0, r9
	strh r0, [r4, 0x8]
	ldrh r0, [r4]
	strh r0, [r4, 0xA]
	ldr r1, _081207EC @ =sub_81206A8
	mov r0, r8
	adds r2, r7, 0
	bl SetTaskFuncWithFollowupFunc
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081207E4: .4byte gPlayerParty
_081207E8: .4byte gTasks+0x8
_081207EC: .4byte sub_81206A8
	thumb_func_end sub_8120760

	thumb_func_start sub_81207F0
sub_81207F0: @ 81207F0
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 24
	lsrs r5, r1, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _08120814 @ =gTasks+0x8
	adds r3, r0, r1
	cmp r5, 0x5
	bhi _08120852
	lsls r0, r5, 2
	ldr r1, _08120818 @ =_0812081C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08120814: .4byte gTasks+0x8
_08120818: .4byte _0812081C
	.align 2, 0
_0812081C:
	.4byte _08120834
	.4byte _0812083A
	.4byte _0812083E
	.4byte _08120842
	.4byte _08120846
	.4byte _0812084A
_08120834:
	strh r2, [r3]
	strh r2, [r3, 0xA]
	b _08120852
_0812083A:
	strh r2, [r3, 0x2]
	b _08120852
_0812083E:
	strh r2, [r3, 0x4]
	b _08120852
_08120842:
	strh r2, [r3, 0x6]
	b _08120852
_08120846:
	strh r2, [r3, 0x8]
	b _08120852
_0812084A:
	ldr r1, _08120858 @ =sub_81206A8
	adds r0, r4, 0
	bl SetTaskFuncWithFollowupFunc
_08120852:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08120858: .4byte sub_81206A8
	thumb_func_end sub_81207F0

	thumb_func_start pokemon_ailments_get_primary
pokemon_ailments_get_primary: @ 812085C
	push {lr}
	adds r1, r0, 0
	movs r0, 0x88
	ands r0, r1
	cmp r0, 0
	beq _0812086C
	movs r0, 0x1
	b _0812089E
_0812086C:
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08120878
	movs r0, 0x2
	b _0812089E
_08120878:
	movs r0, 0x7
	ands r0, r1
	cmp r0, 0
	beq _08120884
	movs r0, 0x3
	b _0812089E
_08120884:
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _08120890
	movs r0, 0x4
	b _0812089E
_08120890:
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	bne _0812089C
	movs r0, 0
	b _0812089E
_0812089C:
	movs r0, 0x5
_0812089E:
	pop {r1}
	bx r1
	thumb_func_end pokemon_ailments_get_primary

	thumb_func_start sub_81208A4
sub_81208A4: @ 81208A4
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x39
	bl GetMonData
	cmp r0, 0
	bne _081208B6
	movs r0, 0x7
	b _081208DE
_081208B6:
	adds r0, r4, 0
	movs r1, 0x37
	bl GetMonData
	bl pokemon_ailments_get_primary
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	bne _081208DE
	adds r0, r4, 0
	movs r1, 0
	bl CheckPartyPokerus
	lsls r0, 24
	cmp r0, 0
	bne _081208DC
	movs r0, 0
	b _081208DE
_081208DC:
	movs r0, 0x6
_081208DE:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_81208A4

	thumb_func_start sub_81208E4
sub_81208E4: @ 81208E4
	push {r4,r5,lr}
	ldr r2, _08120934 @ =gUnknown_203B0A0
	ldrb r1, [r2, 0x8]
	movs r0, 0xF
	ands r0, r1
	cmp r0, 0xB
	bne _0812096E
	adds r5, r2, 0
	adds r5, 0xE
	movs r0, 0
	strh r0, [r2, 0xE]
	ldr r0, _08120938 @ =gSpecialVar_0x8005
	ldrh r0, [r0]
	cmp r0, 0
	bne _08120944
	movs r4, 0
	ldr r0, _0812093C @ =gPlayerPartyCount
	ldrb r0, [r0]
	cmp r4, r0
	bcs _0812096E
_0812090C:
	movs r0, 0x64
	muls r0, r4
	ldr r1, _08120940 @ =gPlayerParty
	adds r0, r1
	bl sub_812097C
	lsls r0, 16
	lsrs r0, 16
	lsls r0, r4
	ldrh r1, [r5]
	adds r0, r1
	strh r0, [r5]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0812093C @ =gPlayerPartyCount
	ldrb r0, [r0]
	cmp r4, r0
	bcc _0812090C
	b _0812096E
	.align 2, 0
_08120934: .4byte gUnknown_203B0A0
_08120938: .4byte gSpecialVar_0x8005
_0812093C: .4byte gPlayerPartyCount
_08120940: .4byte gPlayerParty
_08120944:
	movs r4, 0
	b _08120966
_08120948:
	movs r0, 0x64
	muls r0, r4
	ldr r1, _08120974 @ =gPlayerParty
	adds r0, r1
	bl sub_81209AC
	lsls r0, 16
	lsrs r0, 16
	lsls r0, r4
	ldrh r1, [r5]
	adds r0, r1
	strh r0, [r5]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
_08120966:
	ldr r0, _08120978 @ =gPlayerPartyCount
	ldrb r0, [r0]
	cmp r4, r0
	bcc _08120948
_0812096E:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08120974: .4byte gPlayerParty
_08120978: .4byte gPlayerPartyCount
	thumb_func_end sub_81208E4

	thumb_func_start sub_812097C
sub_812097C: @ 812097C
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0x1
	beq _081209A2
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	bl sub_8149A00
	cmp r0, 0
	beq _081209A2
	movs r0, 0x1
	b _081209A4
_081209A2:
	movs r0, 0
_081209A4:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_812097C

	thumb_func_start sub_81209AC
sub_81209AC: @ 81209AC
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0x1
	beq _081209CA
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0x55
	bne _081209CA
	movs r0, 0x1
	b _081209CC
_081209CA:
	movs r0, 0
_081209CC:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_81209AC

	thumb_func_start sub_81209D4
sub_81209D4: @ 81209D4
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _081209F0 @ =gUnknown_203B0A0
	movs r2, 0xE
	ldrsh r1, [r1, r2]
	asrs r1, r0
	movs r0, 0x1
	ands r1, r0
	cmp r1, 0
	bne _081209EC
	movs r0, 0
_081209EC:
	pop {r1}
	bx r1
	.align 2, 0
_081209F0: .4byte gUnknown_203B0A0
	thumb_func_end sub_81209D4

	thumb_func_start sub_81209F4
sub_81209F4: @ 81209F4
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 24
	lsrs r5, r1, 24
	adds r0, r5, 0
	bl sub_81209D4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08120A24
	movs r0, 0x5
	bl PlaySE
	ldr r0, _08120A20 @ =gSpecialVar_0x8004
	strh r5, [r0]
	adds r0, r4, 0
	bl sub_811FA78
	b _08120A46
	.align 2, 0
_08120A20: .4byte gSpecialVar_0x8004
_08120A24:
	movs r0, 0x1A
	bl PlaySE
	ldr r0, _08120A4C @ =gUnknown_8417696
	movs r1, 0
	bl sub_81202F8
	movs r0, 0x2
	bl schedule_bg_copy_tilemap_to_vram
	ldr r1, _08120A50 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _08120A54 @ =sub_81203B8
	str r1, [r0]
_08120A46:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08120A4C: .4byte gUnknown_8417696
_08120A50: .4byte gTasks
_08120A54: .4byte sub_81203B8
	thumb_func_end sub_81209F4

	thumb_func_start sub_8120A58
sub_8120A58: @ 8120A58
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _08120A84 @ =gUnknown_84176B8
	movs r1, 0x1
	bl sub_81202F8
	movs r0, 0x2
	bl schedule_bg_copy_tilemap_to_vram
	ldr r1, _08120A88 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _08120A8C @ =sub_8120A90
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08120A84: .4byte gUnknown_84176B8
_08120A88: .4byte gTasks
_08120A8C: .4byte sub_8120A90
	thumb_func_end sub_8120A58

	thumb_func_start sub_8120A90
sub_8120A90: @ 8120A90
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_8120370
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08120AB4
	bl sub_812200C
	ldr r0, _08120ABC @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _08120AC0 @ =sub_8120AC4
	str r0, [r1]
_08120AB4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08120ABC: .4byte gTasks
_08120AC0: .4byte sub_8120AC4
	thumb_func_end sub_8120A90

	thumb_func_start sub_8120AC4
sub_8120AC4: @ 8120AC4
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl Menu_ProcessInputNoWrapClearOnChoose
	lsls r0, 24
	asrs r1, r0, 24
	cmp r1, 0
	beq _08120AEA
	cmp r1, 0
	bgt _08120AE4
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _08120AFC
	b _08120B10
_08120AE4:
	cmp r1, 0x1
	beq _08120B02
	b _08120B10
_08120AEA:
	ldr r1, _08120AF8 @ =gSpecialVar_0x8004
	movs r0, 0x7
	strh r0, [r1]
	adds r0, r4, 0
	bl sub_811FA78
	b _08120B10
	.align 2, 0
_08120AF8: .4byte gSpecialVar_0x8004
_08120AFC:
	movs r0, 0x5
	bl PlaySE
_08120B02:
	ldr r0, _08120B18 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _08120B1C @ =sub_81203B8
	str r0, [r1]
_08120B10:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08120B18: .4byte gTasks
_08120B1C: .4byte sub_81203B8
	thumb_func_end sub_8120AC4

	thumb_func_start sub_8120B20
sub_8120B20: @ 8120B20
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r5, r0, 0
	lsls r1, 16
	lsrs r4, r1, 16
	adds r7, r4, 0
	lsls r2, 24
	lsrs r6, r2, 24
	mov r8, r6
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0
	beq _08120B42
	movs r0, 0x3
	b _08120B9E
_08120B42:
	movs r0, 0x90
	lsls r0, 1
	cmp r4, r0
	bls _08120B64
	adds r1, r4, 0
	subs r1, 0x21
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl CanMonLearnTMHM
	cmp r0, 0
	beq _08120B7C
	adds r0, r7, 0
	bl ItemIdToBattleMoveId
	b _08120B86
_08120B64:
	adds r0, r5, 0
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	adds r1, r6, 0
	bl sub_8120BE8
	lsls r0, 24
	cmp r0, 0
	bne _08120B80
_08120B7C:
	movs r0, 0x1
	b _08120B9E
_08120B80:
	mov r0, r8
	bl sub_8120BA8
_08120B86:
	lsls r0, 16
	lsrs r1, r0, 16
	adds r0, r5, 0
	bl MonKnowsMove
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08120B9C
	movs r0, 0
	b _08120B9E
_08120B9C:
	movs r0, 0x2
_08120B9E:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8120B20

	thumb_func_start sub_8120BA8
sub_8120BA8: @ 8120BA8
	push {lr}
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x10
	beq _08120BC8
	cmp r1, 0x10
	bgt _08120BBC
	cmp r1, 0xF
	beq _08120BC2
	b _08120BD6
_08120BBC:
	cmp r1, 0x11
	beq _08120BD0
	b _08120BD6
_08120BC2:
	movs r0, 0xA9
	lsls r0, 1
	b _08120BDE
_08120BC8:
	ldr r0, _08120BCC @ =0x00000133
	b _08120BDE
	.align 2, 0
_08120BCC: .4byte 0x00000133
_08120BD0:
	movs r0, 0x9A
	lsls r0, 1
	b _08120BDE
_08120BD6:
	ldr r0, _08120BE4 @ =gUnknown_8459B60
	lsls r1, 1
	adds r1, r0
	ldrh r0, [r1]
_08120BDE:
	pop {r1}
	bx r1
	.align 2, 0
_08120BE4: .4byte gUnknown_8459B60
	thumb_func_end sub_8120BA8

	thumb_func_start sub_8120BE8
sub_8120BE8: @ 8120BE8
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	lsls r1, 24
	lsrs r2, r1, 24
	cmp r2, 0x10
	beq _08120C0C
	cmp r2, 0x10
	bgt _08120C00
	cmp r2, 0xF
	beq _08120C06
	b _08120C18
_08120C00:
	cmp r2, 0x11
	beq _08120C12
	b _08120C18
_08120C06:
	cmp r0, 0x3
	beq _08120C34
	b _08120C2A
_08120C0C:
	cmp r0, 0x6
	beq _08120C34
	b _08120C2A
_08120C12:
	cmp r0, 0x9
	beq _08120C34
	b _08120C2A
_08120C18:
	ldr r1, _08120C30 @ =gUnknown_8459B7E
	lsls r0, 1
	adds r0, r1
	ldrh r0, [r0]
	asrs r0, r2
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	bne _08120C34
_08120C2A:
	movs r0, 0
	b _08120C36
	.align 2, 0
_08120C30: .4byte gUnknown_8459B7E
_08120C34:
	movs r0, 0x1
_08120C36:
	pop {r1}
	bx r1
	thumb_func_end sub_8120BE8

	thumb_func_start sub_8120C3C
sub_8120C3C: @ 8120C3C
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _08120C60 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08120C5C
	ldr r0, _08120C64 @ =gTasks
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 3
	adds r1, r0
	ldr r0, _08120C68 @ =sub_8120C6C
	str r0, [r1]
_08120C5C:
	pop {r0}
	bx r0
	.align 2, 0
_08120C60: .4byte gPaletteFade
_08120C64: .4byte gTasks
_08120C68: .4byte sub_8120C6C
	thumb_func_end sub_8120C3C

	thumb_func_start sub_8120C6C
sub_8120C6C: @ 8120C6C
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _08120C9C @ =0xffff1fff
	movs r1, 0
	str r1, [sp]
	movs r1, 0x4
	movs r2, 0
	movs r3, 0x6
	bl BeginNormalPaletteFade
	ldr r1, _08120CA0 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _08120CA4 @ =sub_8120CA8
	str r1, [r0]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08120C9C: .4byte 0xffff1fff
_08120CA0: .4byte gTasks
_08120CA4: .4byte sub_8120CA8
	thumb_func_end sub_8120C6C

	thumb_func_start sub_8120CA8
sub_8120CA8: @ 8120CA8
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _08120CCC @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08120CC8
	ldr r0, _08120CD0 @ =gTasks
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 3
	adds r1, r0
	ldr r0, _08120CD4 @ =sub_8120CD8
	str r0, [r1]
_08120CC8:
	pop {r0}
	bx r0
	.align 2, 0
_08120CCC: .4byte gPaletteFade
_08120CD0: .4byte gTasks
_08120CD4: .4byte sub_8120CD8
	thumb_func_end sub_8120CA8

	thumb_func_start sub_8120CD8
sub_8120CD8: @ 8120CD8
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_81220D4
	ldr r2, _08120D00 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r2
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r1, 0x8]
	ldr r0, _08120D04 @ =sub_8120D08
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08120D00: .4byte gTasks
_08120D04: .4byte sub_8120D08
	thumb_func_end sub_8120CD8

	thumb_func_start sub_8120D08
sub_8120D08: @ 8120D08
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r4, r1, 3
	ldr r5, _08120D38 @ =gTasks+0x8
	adds r0, r4, r5
	ldrb r0, [r0]
	bl sub_80BF518
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	beq _08120D30
	adds r0, r5, 0
	subs r0, 0x8
	adds r0, r4, r0
	ldr r1, _08120D3C @ =sub_8120D40
	str r1, [r0]
_08120D30:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08120D38: .4byte gTasks+0x8
_08120D3C: .4byte sub_8120D40
	thumb_func_end sub_8120D08

	thumb_func_start sub_8120D40
sub_8120D40: @ 8120D40
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _08120D70 @ =0xffff0008
	movs r1, 0
	str r1, [sp]
	movs r1, 0x4
	movs r2, 0x6
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r1, _08120D74 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _08120D78 @ =sub_8120D7C
	str r1, [r0]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08120D70: .4byte 0xffff0008
_08120D74: .4byte gTasks
_08120D78: .4byte sub_8120D7C
	thumb_func_end sub_8120D40

	thumb_func_start sub_8120D7C
sub_8120D7C: @ 8120D7C
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _08120DA0 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08120D9C
	ldr r0, _08120DA4 @ =gTasks
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 3
	adds r1, r0
	ldr r0, _08120DA8 @ =sub_8120DAC
	str r0, [r1]
_08120D9C:
	pop {r0}
	bx r0
	.align 2, 0
_08120DA0: .4byte gPaletteFade
_08120DA4: .4byte gTasks
_08120DA8: .4byte sub_8120DAC
	thumb_func_end sub_8120D7C

	thumb_func_start sub_8120DAC
sub_8120DAC: @ 8120DAC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	ldr r5, _08120DD4 @ =gTasks+0x8
	adds r0, r4, r5
	ldrb r0, [r0]
	ldr r1, _08120DD8 @ =gUnknown_8417494
	bl sub_8122084
	subs r5, 0x8
	adds r4, r5
	ldr r0, _08120DDC @ =sub_8120DE0
	str r0, [r4]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08120DD4: .4byte gTasks+0x8
_08120DD8: .4byte gUnknown_8417494
_08120DDC: .4byte sub_8120DE0
	thumb_func_end sub_8120DAC

	thumb_func_start sub_8120DE0
sub_8120DE0: @ 8120DE0
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r5, r1, 3
	ldr r6, _08120E14 @ =gTasks+0x8
	adds r4, r5, r6
	ldrb r0, [r4]
	bl sub_80BF518
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	beq _08120E0E
	ldrb r0, [r4]
	bl sub_8122110
	adds r0, r6, 0
	subs r0, 0x8
	adds r0, r5, r0
	ldr r1, _08120E18 @ =sub_8120E1C
	str r1, [r0]
_08120E0E:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08120E14: .4byte gTasks+0x8
_08120E18: .4byte sub_8120E1C
	thumb_func_end sub_8120DE0

	thumb_func_start sub_8120E1C
sub_8120E1C: @ 8120E1C
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _08120E4C @ =0x0000fff7
	movs r1, 0
	str r1, [sp]
	movs r1, 0x4
	movs r2, 0x6
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r1, _08120E50 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _08120E54 @ =sub_8120E58
	str r1, [r0]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08120E4C: .4byte 0x0000fff7
_08120E50: .4byte gTasks
_08120E54: .4byte sub_8120E58
	thumb_func_end sub_8120E1C

	thumb_func_start sub_8120E58
sub_8120E58: @ 8120E58
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _08120E90 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08120EAC
	movs r0, 0
	movs r1, 0x4F
	movs r2, 0xD0
	bl sub_815001C
	movs r0, 0
	movs r1, 0x58
	movs r2, 0xF0
	bl sub_814FF2C
	ldr r0, _08120E94 @ =gUnknown_203B0A0
	ldrb r0, [r0, 0xB]
	cmp r0, 0x3
	bne _08120E98
	movs r0, 0x5
	bl sub_8121D0C
	b _08120E9E
	.align 2, 0
_08120E90: .4byte gPaletteFade
_08120E94: .4byte gUnknown_203B0A0
_08120E98:
	movs r0, 0
	bl sub_8121D0C
_08120E9E:
	ldr r0, _08120EB4 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _08120EB8 @ =sub_811FB28
	str r0, [r1]
_08120EAC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08120EB4: .4byte gTasks
_08120EB8: .4byte sub_811FB28
	thumb_func_end sub_8120E58

	thumb_func_start sub_8120EBC
sub_8120EBC: @ 8120EBC
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _08120ED8 @ =gTasks+0x8
	adds r3, r1, r0
	movs r2, 0
	strh r2, [r3]
	subs r0, 0x8
	adds r1, r0
	ldr r0, _08120EDC @ =sub_8120EE0
	str r0, [r1]
	bx lr
	.align 2, 0
_08120ED8: .4byte gTasks+0x8
_08120EDC: .4byte sub_8120EE0
	thumb_func_end sub_8120EBC

	thumb_func_start sub_8120EE0
sub_8120EE0: @ 8120EE0
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _08120F1C @ =gTasks+0x8
	adds r6, r0, r1
	ldr r0, _08120F20 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08120F68
	adds r0, r5, 0
	bl sub_8120F78
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08120F68
	movs r1, 0
	ldrsh r0, [r6, r1]
	cmp r0, 0xA0
	beq _08120F38
	cmp r0, 0xA0
	bgt _08120F24
	cmp r0, 0x50
	beq _08120F2A
	b _08120F62
	.align 2, 0
_08120F1C: .4byte gTasks+0x8
_08120F20: .4byte gPaletteFade
_08120F24:
	cmp r0, 0xF0
	beq _08120F44
	b _08120F62
_08120F2A:
	ldr r0, _08120F34 @ =gUnknown_203B0A9
	movs r1, 0x2
	bl sub_811FF94
	b _08120F62
	.align 2, 0
_08120F34: .4byte gUnknown_203B0A9
_08120F38:
	movs r0, 0x5
	bl PlaySE
	bl sub_8122BD4
	b _08120F62
_08120F44:
	ldr r4, _08120F70 @ =gUnknown_203B09C
	ldr r0, [r4]
	adds r0, 0xE
	bl sub_8121CE4
	ldr r1, _08120F74 @ =gUnknown_845A618
	ldr r0, [r4]
	ldrb r0, [r0, 0xF]
	lsls r0, 3
	adds r1, 0x4
	adds r0, r1
	ldr r1, [r0]
	adds r0, r5, 0
	bl _call_via_r1
_08120F62:
	ldrh r0, [r6]
	adds r0, 0x1
	strh r0, [r6]
_08120F68:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08120F70: .4byte gUnknown_203B09C
_08120F74: .4byte gUnknown_845A618
	thumb_func_end sub_8120EE0

	thumb_func_start sub_8120F78
sub_8120F78: @ 8120F78
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _08120F90 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	bne _08120F94
	movs r0, 0
	b _08120FA4
	.align 2, 0
_08120F90: .4byte gMain
_08120F94:
	ldr r0, _08120FA8 @ =gUnknown_203B09C
	ldr r1, [r0]
	ldr r0, _08120FAC @ =sub_8120FB0
	str r0, [r1, 0x4]
	adds r0, r2, 0
	bl sub_811FA78
	movs r0, 0x1
_08120FA4:
	pop {r1}
	bx r1
	.align 2, 0
_08120FA8: .4byte gUnknown_203B09C
_08120FAC: .4byte sub_8120FB0
	thumb_func_end sub_8120F78

	thumb_func_start sub_8120FB0
sub_8120FB0: @ 8120FB0
	push {lr}
	bl FreeRestoreBattleData
	bl LoadPlayerParty
	bl sub_815AC20
	ldr r0, _08120FC8 @ =CB2_ReturnToTeachyTV
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_08120FC8: .4byte CB2_ReturnToTeachyTV
	thumb_func_end sub_8120FB0

	thumb_func_start sub_8120FCC
sub_8120FCC: @ 8120FCC
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _08120FE8 @ =gTasks+0x8
	adds r3, r1, r0
	movs r2, 0
	strh r2, [r3]
	subs r0, 0x8
	adds r1, r0
	ldr r0, _08120FEC @ =sub_8120FF0
	str r0, [r1]
	bx lr
	.align 2, 0
_08120FE8: .4byte gTasks+0x8
_08120FEC: .4byte sub_8120FF0
	thumb_func_end sub_8120FCC

	thumb_func_start sub_8120FF0
sub_8120FF0: @ 8120FF0
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	adds r5, r2, 0
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r1, _0812102C @ =gTasks+0x8
	adds r4, r0, r1
	ldr r0, _08121030 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08121048
	adds r0, r2, 0
	bl sub_8120F78
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08121048
	ldrh r1, [r4]
	movs r2, 0
	ldrsh r0, [r4, r2]
	cmp r0, 0x50
	beq _08121034
	adds r0, r1, 0x1
	strh r0, [r4]
	b _08121048
	.align 2, 0
_0812102C: .4byte gTasks+0x8
_08121030: .4byte gPaletteFade
_08121034:
	ldr r0, _08121050 @ =gUnknown_203B09C
	ldr r1, [r0]
	ldr r0, _08121054 @ =sub_8128184
	str r0, [r1, 0x4]
	ldr r0, _08121058 @ =gUnknown_3005E98
	ldr r1, _0812105C @ =sub_81255BC
	ldr r2, [r0]
	adds r0, r5, 0
	bl _call_via_r2
_08121048:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08121050: .4byte gUnknown_203B09C
_08121054: .4byte sub_8128184
_08121058: .4byte gUnknown_3005E98
_0812105C: .4byte sub_81255BC
	thumb_func_end sub_8120FF0

	thumb_func_start sub_8121060
sub_8121060: @ 8121060
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r1, r0, 0
	cmp r0, 0x1
	beq _08121088
	cmp r0, 0x1
	bgt _08121076
	cmp r0, 0
	beq _0812107C
	b _081210A0
_08121076:
	cmp r1, 0x2
	beq _08121094
	b _081210A0
_0812107C:
	ldr r0, _08121084 @ =gUnknown_845A010
	bl InitWindows
	b _081210A6
	.align 2, 0
_08121084: .4byte gUnknown_845A010
_08121088:
	ldr r0, _08121090 @ =gUnknown_845A050
	bl InitWindows
	b _081210A6
	.align 2, 0
_08121090: .4byte gUnknown_845A050
_08121094:
	ldr r0, _0812109C @ =gUnknown_845A090
	bl InitWindows
	b _081210A6
	.align 2, 0
_0812109C: .4byte gUnknown_845A090
_081210A0:
	ldr r0, _081210F4 @ =gUnknown_845A0D0
	bl InitWindows
_081210A6:
	bl DeactivateAllTextPrinters
	movs r4, 0
_081210AC:
	adds r0, r4, 0
	movs r1, 0
	bl FillWindowPixelBuffer
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x5
	bls _081210AC
	movs r0, 0
	movs r1, 0x4F
	movs r2, 0xD0
	bl sub_815001C
	movs r0, 0
	movs r1, 0x58
	movs r2, 0xF0
	bl sub_814FF2C
	movs r0, 0x2
	bl stdpal_get
	movs r1, 0xC0
	movs r2, 0x20
	bl LoadPalette
	movs r0, 0
	bl stdpal_get
	movs r1, 0xE0
	movs r2, 0x20
	bl LoadPalette
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081210F4: .4byte gUnknown_845A0D0
	thumb_func_end sub_8121060

	thumb_func_start sub_81210F8
sub_81210F8: @ 81210F8
	push {r4-r6,lr}
	sub sp, 0x14
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _08121174 @ =gUnknown_203B0A0
	ldrb r1, [r0, 0x8]
	movs r0, 0xF
	ands r0, r1
	cmp r0, 0x5
	bne _0812110E
	b _08121238
_0812110E:
	cmp r2, 0x1
	bne _08121188
	ldr r0, _08121178 @ =gUnknown_845A118
	bl AddWindow
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	movs r1, 0
	bl FillWindowPixelBuffer
	ldr r5, _0812117C @ =gUnknown_84169D5
	movs r0, 0
	adds r1, r5, 0
	movs r2, 0
	bl GetStringWidth
	movs r2, 0x30
	subs r2, r0
	lsrs r2, 1
	lsls r2, 24
	lsrs r2, 24
	movs r0, 0
	str r0, [sp]
	str r0, [sp, 0x4]
	ldr r0, _08121180 @ =gUnknown_8459FFC
	str r0, [sp, 0x8]
	movs r0, 0x1
	negs r0, r0
	str r0, [sp, 0xC]
	str r5, [sp, 0x10]
	adds r0, r4, 0
	movs r1, 0
	movs r3, 0x1
	bl AddTextPrinterParameterized2
	adds r0, r4, 0
	bl PutWindowTilemap
	adds r0, r4, 0
	movs r1, 0x2
	bl CopyWindowToVram
	ldr r0, _08121184 @ =gUnknown_845A110
	bl AddWindow
	lsls r0, 24
	lsrs r6, r0, 24
	movs r5, 0
	b _08121194
	.align 2, 0
_08121174: .4byte gUnknown_203B0A0
_08121178: .4byte gUnknown_845A118
_0812117C: .4byte gUnknown_84169D5
_08121180: .4byte gUnknown_8459FFC
_08121184: .4byte gUnknown_845A110
_08121188:
	ldr r0, _081211E0 @ =gUnknown_845A108
	bl AddWindow
	lsls r0, 24
	lsrs r6, r0, 24
	movs r5, 0x3
_08121194:
	adds r0, r6, 0
	movs r1, 0
	bl FillWindowPixelBuffer
	ldr r0, _081211E4 @ =gUnknown_203B0A0
	ldrb r1, [r0, 0x8]
	movs r0, 0xF
	ands r0, r1
	cmp r0, 0xA
	beq _081211F0
	ldr r4, _081211E8 @ =gFameCheckerText_Cancel
	movs r0, 0
	adds r1, r4, 0
	movs r2, 0
	bl GetStringWidth
	movs r1, 0x30
	subs r1, r0
	lsrs r0, r1, 31
	adds r1, r0
	asrs r1, 1
	adds r1, r5, r1
	lsls r1, 24
	lsrs r5, r1, 24
	ldr r0, _081211EC @ =gUnknown_8459FFC
	str r0, [sp]
	movs r0, 0x1
	negs r0, r0
	str r0, [sp, 0x4]
	str r4, [sp, 0x8]
	adds r0, r6, 0
	movs r1, 0
	adds r2, r5, 0
	movs r3, 0x1
	bl box_print
	b _08121224
	.align 2, 0
_081211E0: .4byte gUnknown_845A108
_081211E4: .4byte gUnknown_203B0A0
_081211E8: .4byte gFameCheckerText_Cancel
_081211EC: .4byte gUnknown_8459FFC
_081211F0:
	ldr r4, _08121240 @ =gOtherText_Exit
	movs r0, 0
	adds r1, r4, 0
	movs r2, 0
	bl GetStringWidth
	movs r1, 0x30
	subs r1, r0
	lsrs r0, r1, 31
	adds r1, r0
	asrs r1, 1
	adds r1, r5, r1
	lsls r1, 24
	lsrs r5, r1, 24
	ldr r0, _08121244 @ =gUnknown_8459FFC
	str r0, [sp]
	movs r0, 0x1
	negs r0, r0
	str r0, [sp, 0x4]
	str r4, [sp, 0x8]
	adds r0, r6, 0
	movs r1, 0
	adds r2, r5, 0
	movs r3, 0x1
	bl box_print
_08121224:
	adds r0, r6, 0
	bl PutWindowTilemap
	adds r0, r6, 0
	movs r1, 0x2
	bl CopyWindowToVram
	movs r0, 0
	bl schedule_bg_copy_tilemap_to_vram
_08121238:
	add sp, 0x14
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08121240: .4byte gOtherText_Exit
_08121244: .4byte gUnknown_8459FFC
	thumb_func_end sub_81210F8

	thumb_func_start sub_8121248
sub_8121248: @ 8121248
	lsls r0, 24
	ldr r1, _08121258 @ =gUnknown_203B09C
	lsrs r0, 23
	adds r0, 0x18
	ldr r1, [r1]
	adds r1, r0
	adds r0, r1, 0
	bx lr
	.align 2, 0
_08121258: .4byte gUnknown_203B09C
	thumb_func_end sub_8121248

	thumb_func_start sub_812125C
sub_812125C: @ 812125C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x2C
	str r1, [sp, 0xC]
	ldr r1, [sp, 0x4C]
	ldr r4, [sp, 0x50]
	ldr r5, [sp, 0x54]
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x8]
	lsls r2, 24
	lsrs r2, 24
	str r2, [sp, 0x10]
	lsls r3, 24
	lsrs r3, 24
	str r3, [sp, 0x14]
	lsls r1, 24
	lsrs r1, 24
	str r1, [sp, 0x18]
	lsls r4, 24
	lsrs r6, r4, 24
	lsls r5, 24
	lsrs r5, 24
	mov r10, r5
	mov r0, r10
	muls r0, r6
	lsls r0, 5
	bl AllocZeroed
	mov r9, r0
	cmp r0, 0
	beq _0812132A
	movs r5, 0
	ldr r0, [sp, 0x14]
	lsls r0, 19
	str r0, [sp, 0x1C]
	ldr r1, [sp, 0x18]
	lsls r1, 19
	str r1, [sp, 0x20]
	lsls r2, r6, 19
	str r2, [sp, 0x24]
	mov r0, r10
	lsls r0, 19
	str r0, [sp, 0x28]
	cmp r5, r10
	bcs _08121308
_081212BE:
	movs r4, 0
	adds r1, r5, 0x1
	mov r8, r1
	cmp r4, r6
	bcs _081212FE
	ldr r2, [sp, 0x18]
	adds r0, r2, r5
	ldr r2, [sp, 0x10]
	adds r1, r0, 0
	muls r1, r2
	adds r7, r1, 0
_081212D4:
	ldr r1, [sp, 0x14]
	adds r0, r1, r4
	adds r0, r7
	ldr r2, [sp, 0xC]
	adds r0, r2, r0
	ldrb r0, [r0]
	bl sub_811F620
	adds r1, r5, 0
	muls r1, r6
	adds r1, r4
	lsls r1, 5
	add r1, r9
	movs r2, 0x10
	bl CpuSet
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, r6
	bcc _081212D4
_081212FE:
	mov r1, r8
	lsls r0, r1, 24
	lsrs r5, r0, 24
	cmp r5, r10
	bcc _081212BE
_08121308:
	ldr r0, [sp, 0x1C]
	lsrs r2, r0, 16
	ldr r1, [sp, 0x20]
	lsrs r3, r1, 16
	ldr r1, [sp, 0x24]
	lsrs r0, r1, 16
	str r0, [sp]
	ldr r1, [sp, 0x28]
	lsrs r0, r1, 16
	str r0, [sp, 0x4]
	ldr r0, [sp, 0x8]
	mov r1, r9
	bl BlitBitmapToWindow
	mov r0, r9
	bl Free
_0812132A:
	add sp, 0x2C
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_812125C

	thumb_func_start sub_812133C
sub_812133C: @ 812133C
	push {r4-r6,lr}
	sub sp, 0xC
	ldr r4, [sp, 0x1C]
	ldr r5, [sp, 0x20]
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r6, r1, 24
	lsls r2, 24
	lsrs r2, 24
	lsls r3, 24
	lsrs r3, 24
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	lsrs r5, 24
	cmp r3, 0
	bne _08121368
	cmp r4, 0
	bne _08121368
	movs r3, 0xA
	movs r4, 0x7
_08121368:
	cmp r5, 0
	bne _08121384
	ldr r1, _08121380 @ =gUnknown_845A180
	str r2, [sp]
	str r3, [sp, 0x4]
	str r4, [sp, 0x8]
	movs r2, 0xA
	adds r3, r6, 0
	bl sub_812125C
	b _08121394
	.align 2, 0
_08121380: .4byte gUnknown_845A180
_08121384:
	ldr r1, _0812139C @ =gUnknown_845A1C6
	str r2, [sp]
	str r3, [sp, 0x4]
	str r4, [sp, 0x8]
	movs r2, 0xA
	adds r3, r6, 0
	bl sub_812125C
_08121394:
	add sp, 0xC
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0812139C: .4byte gUnknown_845A1C6
	thumb_func_end sub_812133C

	thumb_func_start sub_81213A0
sub_81213A0: @ 81213A0
	push {r4-r6,lr}
	sub sp, 0xC
	ldr r4, [sp, 0x1C]
	ldr r5, [sp, 0x20]
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r6, r1, 24
	lsls r2, 24
	lsrs r2, 24
	lsls r3, 24
	lsrs r3, 24
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	lsrs r5, 24
	cmp r3, 0
	bne _081213CC
	cmp r4, 0
	bne _081213CC
	movs r3, 0x12
	movs r4, 0x3
_081213CC:
	cmp r5, 0
	bne _081213E8
	ldr r1, _081213E4 @ =gUnknown_845A20C
	str r2, [sp]
	str r3, [sp, 0x4]
	str r4, [sp, 0x8]
	movs r2, 0x12
	adds r3, r6, 0
	bl sub_812125C
	b _081213F8
	.align 2, 0
_081213E4: .4byte gUnknown_845A20C
_081213E8:
	ldr r1, _08121400 @ =gUnknown_845A242
	str r2, [sp]
	str r3, [sp, 0x4]
	str r4, [sp, 0x8]
	movs r2, 0x12
	adds r3, r6, 0
	bl sub_812125C
_081213F8:
	add sp, 0xC
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08121400: .4byte gUnknown_845A242
	thumb_func_end sub_81213A0

	thumb_func_start sub_8121404
sub_8121404: @ 8121404
	push {lr}
	sub sp, 0xC
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08121428 @ =gUnknown_845A278
	movs r2, 0
	str r2, [sp]
	movs r2, 0x12
	str r2, [sp, 0x4]
	movs r2, 0x3
	str r2, [sp, 0x8]
	movs r2, 0x12
	movs r3, 0
	bl sub_812125C
	add sp, 0xC
	pop {r0}
	bx r0
	.align 2, 0
_08121428: .4byte gUnknown_845A278
	thumb_func_end sub_8121404

	thumb_func_start sub_812142C
sub_812142C: @ 812142C
	push {r4-r7,lr}
	lsls r1, 24
	lsrs r4, r1, 24
	adds r5, r4, 0
	ldrb r0, [r0, 0x8]
	movs r1, 0x5
	bl GetWindowAttribute
	lsls r0, 28
	lsrs r6, r0, 24
	adds r7, r6, 0
	movs r0, 0x20
	ands r0, r4
	cmp r0, 0
	beq _081214A0
	movs r0, 0x1
	ands r0, r4
	cmp r0, 0
	beq _0812145C
	ldr r5, _08121458 @ =gUnknown_845A2D4
	b _0812160A
	.align 2, 0
_08121458: .4byte gUnknown_845A2D4
_0812145C:
	ldr r5, _08121494 @ =gUnknown_845A2D4
	ldrb r0, [r5]
	bl sub_8121248
	ldr r4, _08121498 @ =gUnknown_845A2B2
	ldrb r1, [r4]
	adds r1, r6
	movs r2, 0x2
	bl LoadPalette
	ldrb r0, [r5, 0x1]
	bl sub_8121248
	ldrb r1, [r4, 0x1]
	adds r1, r6
	movs r2, 0x2
	bl LoadPalette
	ldrb r0, [r5, 0x2]
	bl sub_8121248
	ldrb r1, [r4, 0x2]
	adds r1, r6
	movs r2, 0x2
	bl LoadPalette
	ldr r5, _0812149C @ =gUnknown_845A2E3
	b _0812163E
	.align 2, 0
_08121494: .4byte gUnknown_845A2D4
_08121498: .4byte gUnknown_845A2B2
_0812149C: .4byte gUnknown_845A2E3
_081214A0:
	movs r0, 0x10
	ands r0, r4
	cmp r0, 0
	beq _081214EC
	ldr r5, _081214E0 @ =gUnknown_845A2D4
	ldrb r0, [r5]
	bl sub_8121248
	ldr r4, _081214E4 @ =gUnknown_845A2B2
	ldrb r1, [r4]
	adds r1, r6
	movs r2, 0x2
	bl LoadPalette
	ldrb r0, [r5, 0x1]
	bl sub_8121248
	ldrb r1, [r4, 0x1]
	adds r1, r6
	movs r2, 0x2
	bl LoadPalette
	ldrb r0, [r5, 0x2]
	bl sub_8121248
	ldrb r1, [r4, 0x2]
	adds r1, r6
	movs r2, 0x2
	bl LoadPalette
	ldr r5, _081214E8 @ =gUnknown_845A2E3
	b _0812163E
	.align 2, 0
_081214E0: .4byte gUnknown_845A2D4
_081214E4: .4byte gUnknown_845A2B2
_081214E8: .4byte gUnknown_845A2E3
_081214EC:
	movs r0, 0x4
	ands r0, r4
	cmp r0, 0
	beq _08121548
	movs r0, 0x1
	ands r0, r4
	cmp r0, 0
	beq _08121504
	ldr r5, _08121500 @ =gUnknown_845A2D4
	b _0812160A
	.align 2, 0
_08121500: .4byte gUnknown_845A2D4
_08121504:
	ldr r5, _0812153C @ =gUnknown_845A2D4
	ldrb r0, [r5]
	bl sub_8121248
	ldr r4, _08121540 @ =gUnknown_845A2B2
	ldrb r1, [r4]
	adds r1, r6
	movs r2, 0x2
	bl LoadPalette
	ldrb r0, [r5, 0x1]
	bl sub_8121248
	ldrb r1, [r4, 0x1]
	adds r1, r6
	movs r2, 0x2
	bl LoadPalette
	ldrb r0, [r5, 0x2]
	bl sub_8121248
	ldrb r1, [r4, 0x2]
	adds r1, r6
	movs r2, 0x2
	bl LoadPalette
	ldr r5, _08121544 @ =gUnknown_845A2E3
	b _0812163E
	.align 2, 0
_0812153C: .4byte gUnknown_845A2D4
_08121540: .4byte gUnknown_845A2B2
_08121544: .4byte gUnknown_845A2E3
_08121548:
	movs r0, 0x2
	ands r0, r4
	cmp r0, 0
	beq _081215A4
	movs r0, 0x1
	ands r0, r4
	cmp r0, 0
	beq _08121560
	ldr r5, _0812155C @ =gUnknown_845A2D1
	b _0812160A
	.align 2, 0
_0812155C: .4byte gUnknown_845A2D1
_08121560:
	ldr r5, _08121598 @ =gUnknown_845A2C8
	ldrb r0, [r5]
	bl sub_8121248
	ldr r4, _0812159C @ =gUnknown_845A2B2
	ldrb r1, [r4]
	adds r1, r6
	movs r2, 0x2
	bl LoadPalette
	ldrb r0, [r5, 0x1]
	bl sub_8121248
	ldrb r1, [r4, 0x1]
	adds r1, r6
	movs r2, 0x2
	bl LoadPalette
	ldrb r0, [r5, 0x2]
	bl sub_8121248
	ldrb r1, [r4, 0x2]
	adds r1, r6
	movs r2, 0x2
	bl LoadPalette
	ldr r5, _081215A0 @ =gUnknown_845A2DD
	b _0812163E
	.align 2, 0
_08121598: .4byte gUnknown_845A2C8
_0812159C: .4byte gUnknown_845A2B2
_081215A0: .4byte gUnknown_845A2DD
_081215A4:
	movs r0, 0x8
	ands r0, r4
	cmp r0, 0
	beq _08121600
	movs r0, 0x1
	ands r0, r4
	cmp r0, 0
	beq _081215BC
	ldr r5, _081215B8 @ =gUnknown_845A2CE
	b _0812160A
	.align 2, 0
_081215B8: .4byte gUnknown_845A2CE
_081215BC:
	ldr r5, _081215F4 @ =gUnknown_845A2C5
	ldrb r0, [r5]
	bl sub_8121248
	ldr r4, _081215F8 @ =gUnknown_845A2B2
	ldrb r1, [r4]
	adds r1, r6
	movs r2, 0x2
	bl LoadPalette
	ldrb r0, [r5, 0x1]
	bl sub_8121248
	ldrb r1, [r4, 0x1]
	adds r1, r6
	movs r2, 0x2
	bl LoadPalette
	ldrb r0, [r5, 0x2]
	bl sub_8121248
	ldrb r1, [r4, 0x2]
	adds r1, r6
	movs r2, 0x2
	bl LoadPalette
	ldr r5, _081215FC @ =gUnknown_845A2DA
	b _0812163E
	.align 2, 0
_081215F4: .4byte gUnknown_845A2C5
_081215F8: .4byte gUnknown_845A2B2
_081215FC: .4byte gUnknown_845A2DA
_08121600:
	movs r0, 0x1
	ands r5, r0
	cmp r5, 0
	beq _08121684
	ldr r5, _08121674 @ =gUnknown_845A2CB
_0812160A:
	ldrb r0, [r5]
	bl sub_8121248
	ldr r4, _08121678 @ =gUnknown_845A2B2
	ldrb r1, [r4]
	adds r1, r6
	movs r2, 0x2
	bl LoadPalette
	ldrb r0, [r5, 0x1]
	bl sub_8121248
	ldrb r1, [r4, 0x1]
	adds r1, r6
	movs r2, 0x2
	bl LoadPalette
	ldrb r0, [r5, 0x2]
	bl sub_8121248
	ldrb r1, [r4, 0x2]
	adds r1, r6
	movs r2, 0x2
	bl LoadPalette
	ldr r5, _0812167C @ =gUnknown_845A2E0
_0812163E:
	ldrb r0, [r5]
	bl sub_8121248
	ldr r4, _08121680 @ =gUnknown_845A2B5
	ldrb r1, [r4]
	adds r1, r6
	movs r2, 0x2
	bl LoadPalette
	ldrb r0, [r5, 0x1]
	bl sub_8121248
	ldrb r1, [r4, 0x1]
	adds r1, r6
	movs r2, 0x2
	bl LoadPalette
	ldrb r0, [r5, 0x2]
	bl sub_8121248
	ldrb r1, [r4, 0x2]
	adds r1, r6
	movs r2, 0x2
	bl LoadPalette
	b _081216EC
	.align 2, 0
_08121674: .4byte gUnknown_845A2CB
_08121678: .4byte gUnknown_845A2B2
_0812167C: .4byte gUnknown_845A2E0
_08121680: .4byte gUnknown_845A2B5
_08121684:
	ldr r5, _081216F4 @ =gUnknown_845A2C2
	ldrb r0, [r5]
	bl sub_8121248
	ldr r4, _081216F8 @ =gUnknown_845A2B2
	ldrb r1, [r4]
	adds r1, r7
	movs r2, 0x2
	bl LoadPalette
	ldrb r0, [r5, 0x1]
	bl sub_8121248
	ldrb r1, [r4, 0x1]
	adds r1, r7
	movs r2, 0x2
	bl LoadPalette
	ldrb r0, [r5, 0x2]
	bl sub_8121248
	ldrb r1, [r4, 0x2]
	adds r1, r7
	movs r2, 0x2
	bl LoadPalette
	ldr r5, _081216FC @ =gUnknown_845A2D7
	ldrb r0, [r5]
	bl sub_8121248
	ldr r4, _08121700 @ =gUnknown_845A2B5
	ldrb r1, [r4]
	adds r1, r7
	movs r2, 0x2
	bl LoadPalette
	ldrb r0, [r5, 0x1]
	bl sub_8121248
	ldrb r1, [r4, 0x1]
	adds r1, r7
	movs r2, 0x2
	bl LoadPalette
	ldrb r0, [r5, 0x2]
	bl sub_8121248
	ldrb r1, [r4, 0x2]
	adds r1, r7
	movs r2, 0x2
	bl LoadPalette
_081216EC:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081216F4: .4byte gUnknown_845A2C2
_081216F8: .4byte gUnknown_845A2B2
_081216FC: .4byte gUnknown_845A2D7
_08121700: .4byte gUnknown_845A2B5
	thumb_func_end sub_812142C

	thumb_func_start sub_8121704
sub_8121704: @ 8121704
	push {r4,r5,lr}
	sub sp, 0xC
	lsls r0, 24
	lsrs r0, 24
	lsls r2, 24
	lsrs r2, 24
	ldrb r5, [r3]
	ldrb r3, [r3, 0x1]
	lsls r4, r2, 1
	adds r4, r2
	ldr r2, _08121734 @ =gUnknown_8459FFC
	adds r4, r2
	str r4, [sp]
	movs r2, 0
	str r2, [sp, 0x4]
	str r1, [sp, 0x8]
	movs r1, 0
	adds r2, r5, 0
	bl box_print
	add sp, 0xC
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08121734: .4byte gUnknown_8459FFC
	thumb_func_end sub_8121704

	thumb_func_start sub_8121738
sub_8121738: @ 8121738
	push {r4-r7,lr}
	sub sp, 0x14
	adds r7, r0, 0
	adds r6, r1, 0
	lsls r2, 24
	lsrs r4, r2, 24
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _08121788
	cmp r4, 0x1
	bne _08121772
	ldr r5, [r6]
	ldrb r0, [r6, 0x8]
	ldrb r1, [r5, 0x4]
	lsrs r1, 3
	ldrb r2, [r5, 0x5]
	lsrs r2, 3
	ldrb r3, [r5, 0x6]
	lsrs r3, 3
	ldrb r4, [r5, 0x7]
	lsrs r4, 3
	str r4, [sp]
	movs r4, 0
	str r4, [sp, 0x4]
	ldr r4, [r5]
	bl _call_via_r4
_08121772:
	adds r0, r7, 0
	add r1, sp, 0x8
	bl GetMonNickname
	ldrb r0, [r6, 0x8]
	ldr r3, [r6]
	adds r3, 0x4
	add r1, sp, 0x8
	movs r2, 0
	bl sub_8121704
_08121788:
	add sp, 0x14
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8121738

	thumb_func_start sub_8121790
sub_8121790: @ 8121790
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x8
	adds r6, r0, 0
	adds r7, r1, 0
	lsls r2, 24
	lsrs r4, r2, 24
	mov r8, r4
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _081217FC
	adds r0, r6, 0
	bl sub_81208A4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _081217BE
	cmp r0, 0x6
	bne _081217FC
_081217BE:
	cmp r4, 0
	beq _081217E4
	ldr r5, [r7]
	ldrb r0, [r7, 0x8]
	ldrb r1, [r5, 0x8]
	lsrs r1, 3
	ldrb r2, [r5, 0x9]
	lsrs r2, 3
	adds r2, 0x1
	ldrb r3, [r5, 0xA]
	lsrs r3, 3
	ldrb r4, [r5, 0xB]
	lsrs r4, 3
	str r4, [sp]
	movs r4, 0
	str r4, [sp, 0x4]
	ldr r4, [r5]
	bl _call_via_r4
_081217E4:
	mov r0, r8
	cmp r0, 0x2
	beq _081217FC
	adds r0, r6, 0
	movs r1, 0x38
	bl GetMonData
	lsls r0, 24
	lsrs r0, 24
	adds r1, r7, 0
	bl sub_8121808
_081217FC:
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8121790

	thumb_func_start sub_8121808
sub_8121808: @ 8121808
	push {r4-r6,lr}
	adds r2, r0, 0
	adds r6, r1, 0
	lsls r2, 24
	lsrs r2, 24
	ldr r5, _08121848 @ =gStringVar2
	adds r0, r5, 0
	adds r1, r2, 0
	movs r2, 0
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	ldr r4, _0812184C @ =gStringVar1
	ldr r1, _08121850 @ =gText_Lv
	adds r0, r4, 0
	bl StringCopy
	adds r0, r4, 0
	adds r1, r5, 0
	bl StringAppend
	ldrb r0, [r6, 0x8]
	ldr r3, [r6]
	adds r3, 0x8
	adds r1, r4, 0
	movs r2, 0
	bl sub_8121704
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08121848: .4byte gStringVar2
_0812184C: .4byte gStringVar1
_08121850: .4byte gText_Lv
	thumb_func_end sub_8121808

	thumb_func_start sub_8121854
sub_8121854: @ 8121854
	push {r4-r7,lr}
	sub sp, 0x14
	adds r6, r0, 0
	adds r7, r1, 0
	lsls r2, 24
	lsrs r2, 24
	cmp r2, 0x1
	bne _08121886
	ldr r5, [r7]
	ldrb r0, [r7, 0x8]
	ldrb r1, [r5, 0xC]
	lsrs r1, 3
	ldrb r2, [r5, 0xD]
	lsrs r2, 3
	adds r2, 0x1
	ldrb r3, [r5, 0xE]
	lsrs r3, 3
	ldrb r4, [r5, 0xF]
	lsrs r4, 3
	str r4, [sp]
	movs r4, 0
	str r4, [sp, 0x4]
	ldr r4, [r5]
	bl _call_via_r4
_08121886:
	adds r0, r6, 0
	add r1, sp, 0x8
	bl GetMonNickname
	adds r0, r6, 0
	bl GetMonGender
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r6, 0
	movs r1, 0xB
	bl GetMonData
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	adds r0, r4, 0
	add r2, sp, 0x8
	adds r3, r7, 0
	bl sub_81218BC
	add sp, 0x14
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8121854

	thumb_func_start sub_81218BC
sub_81218BC: @ 81218BC
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	mov r9, r2
	adds r7, r3, 0
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r1, 16
	lsrs r4, r1, 16
	adds r5, r4, 0
	ldrb r0, [r7, 0x8]
	movs r1, 0x5
	bl GetWindowAttribute
	lsls r0, 28
	lsrs r6, r0, 24
	cmp r4, 0
	beq _08121982
	cmp r4, 0x20
	beq _081218EC
	cmp r4, 0x1D
	bne _08121900
_081218EC:
	movs r0, 0xB
	adds r1, r5, 0
	muls r1, r0
	ldr r0, _0812190C @ =gSpeciesNames
	adds r1, r0
	mov r0, r9
	bl StringCompare
	cmp r0, 0
	beq _08121982
_08121900:
	mov r0, r8
	cmp r0, 0
	beq _08121910
	cmp r0, 0xFE
	beq _08121950
	b _08121982
	.align 2, 0
_0812190C: .4byte gSpeciesNames
_08121910:
	ldr r5, _08121944 @ =gUnknown_845A2B8
	ldrb r0, [r5]
	bl sub_8121248
	ldr r4, _08121948 @ =gUnknown_845A2AE
	ldrb r1, [r4]
	adds r1, r6
	movs r2, 0x2
	bl LoadPalette
	ldrb r0, [r5, 0x1]
	bl sub_8121248
	ldrb r1, [r4, 0x1]
	adds r1, r6
	movs r2, 0x2
	bl LoadPalette
	ldrb r0, [r7, 0x8]
	ldr r1, _0812194C @ =gUnknown_841621F
	ldr r3, [r7]
	adds r3, 0xC
	movs r2, 0x2
	bl sub_8121704
	b _08121982
	.align 2, 0
_08121944: .4byte gUnknown_845A2B8
_08121948: .4byte gUnknown_845A2AE
_0812194C: .4byte gUnknown_841621F
_08121950:
	ldr r5, _08121990 @ =gUnknown_845A2BA
	ldrb r0, [r5]
	bl sub_8121248
	ldr r4, _08121994 @ =gUnknown_845A2AE
	ldrb r1, [r4]
	adds r1, r6
	movs r2, 0x2
	bl LoadPalette
	ldrb r0, [r5, 0x1]
	bl sub_8121248
	ldrb r1, [r4, 0x1]
	adds r1, r6
	movs r2, 0x2
	bl LoadPalette
	ldrb r0, [r7, 0x8]
	ldr r1, _08121998 @ =gUnknown_8416221
	ldr r3, [r7]
	adds r3, 0xC
	movs r2, 0x2
	bl sub_8121704
_08121982:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08121990: .4byte gUnknown_845A2BA
_08121994: .4byte gUnknown_845A2AE
_08121998: .4byte gUnknown_8416221
	thumb_func_end sub_81218BC

	thumb_func_start sub_812199C
sub_812199C: @ 812199C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x8
	adds r7, r0, 0
	adds r6, r1, 0
	lsls r2, 24
	lsrs r4, r2, 24
	mov r8, r4
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _081219F6
	cmp r4, 0
	beq _081219DE
	ldr r5, [r6]
	ldrb r0, [r6, 0x8]
	ldrb r1, [r5, 0x10]
	lsrs r1, 3
	ldrb r2, [r5, 0x11]
	lsrs r2, 3
	adds r2, 0x1
	ldrb r3, [r5, 0x12]
	lsrs r3, 3
	ldrb r4, [r5, 0x13]
	lsrs r4, 3
	str r4, [sp]
	movs r4, 0
	str r4, [sp, 0x4]
	ldr r4, [r5]
	bl _call_via_r4
_081219DE:
	mov r0, r8
	cmp r0, 0x2
	beq _081219F6
	adds r0, r7, 0
	movs r1, 0x39
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	adds r1, r6, 0
	bl sub_8121A04
_081219F6:
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_812199C

	thumb_func_start sub_8121A04
sub_8121A04: @ 8121A04
	push {r4,r5,lr}
	adds r2, r0, 0
	adds r4, r1, 0
	lsls r2, 16
	lsrs r2, 16
	ldr r5, _08121A38 @ =gStringVar1
	adds r0, r5, 0
	adds r1, r2, 0
	movs r2, 0x1
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	movs r1, 0xBA
	strb r1, [r0]
	movs r1, 0xFF
	strb r1, [r0, 0x1]
	ldrb r0, [r4, 0x8]
	ldr r3, [r4]
	adds r3, 0x10
	adds r1, r5, 0
	movs r2, 0
	bl sub_8121704
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08121A38: .4byte gStringVar1
	thumb_func_end sub_8121A04

	thumb_func_start sub_8121A3C
sub_8121A3C: @ 8121A3C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x8
	adds r7, r0, 0
	adds r6, r1, 0
	lsls r2, 24
	lsrs r4, r2, 24
	mov r8, r4
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _08121A98
	cmp r4, 0
	beq _08121A80
	ldr r5, [r6]
	ldrb r0, [r6, 0x8]
	ldrb r1, [r5, 0x14]
	lsrs r1, 3
	adds r1, 0x1
	ldrb r2, [r5, 0x15]
	lsrs r2, 3
	adds r2, 0x1
	ldrb r3, [r5, 0x16]
	lsrs r3, 3
	ldrb r4, [r5, 0x17]
	lsrs r4, 3
	str r4, [sp]
	movs r4, 0
	str r4, [sp, 0x4]
	ldr r4, [r5]
	bl _call_via_r4
_08121A80:
	mov r0, r8
	cmp r0, 0x2
	beq _08121A98
	adds r0, r7, 0
	movs r1, 0x3A
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	adds r1, r6, 0
	bl sub_8121AA4
_08121A98:
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8121A3C

	thumb_func_start sub_8121AA4
sub_8121AA4: @ 8121AA4
	push {r4-r6,lr}
	adds r2, r0, 0
	adds r6, r1, 0
	lsls r2, 16
	lsrs r2, 16
	ldr r5, _08121AE4 @ =gStringVar2
	adds r0, r5, 0
	adds r1, r2, 0
	movs r2, 0x1
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	ldr r4, _08121AE8 @ =gStringVar1
	ldr r1, _08121AEC @ =gUnknown_841620C
	adds r0, r4, 0
	bl StringCopy
	adds r0, r4, 0
	adds r1, r5, 0
	bl StringAppend
	ldrb r0, [r6, 0x8]
	ldr r3, [r6]
	adds r3, 0x14
	adds r1, r4, 0
	movs r2, 0
	bl sub_8121704
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08121AE4: .4byte gStringVar2
_08121AE8: .4byte gStringVar1
_08121AEC: .4byte gUnknown_841620C
	thumb_func_end sub_8121AA4

	thumb_func_start sub_8121AF0
sub_8121AF0: @ 8121AF0
	push {r4-r6,lr}
	adds r5, r0, 0
	adds r6, r1, 0
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _08121B24
	adds r0, r5, 0
	movs r1, 0x39
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	movs r1, 0x3A
	bl GetMonData
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	adds r0, r4, 0
	adds r2, r6, 0
	bl sub_8121B2C
_08121B24:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8121AF0

	thumb_func_start sub_8121B2C
sub_8121B2C: @ 8121B2C
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x8
	adds r6, r2, 0
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	lsls r1, 16
	lsrs r1, 16
	mov r9, r1
	ldrb r0, [r6, 0x8]
	movs r1, 0x5
	bl GetWindowAttribute
	lsls r0, 28
	lsrs r7, r0, 24
	mov r1, r8
	lsls r0, r1, 16
	asrs r0, 16
	mov r2, r9
	lsls r1, r2, 16
	asrs r1, 16
	bl GetHPBarLevel
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	beq _08121B78
	cmp r0, 0x2
	blt _08121BA8
	cmp r0, 0x4
	bgt _08121BA8
	ldr r5, _08121B74 @ =gUnknown_845A2BC
	b _08121B7A
	.align 2, 0
_08121B74: .4byte gUnknown_845A2BC
_08121B78:
	ldr r5, _08121BA0 @ =gUnknown_845A2BE
_08121B7A:
	ldrb r0, [r5]
	bl sub_8121248
	ldr r4, _08121BA4 @ =gUnknown_845A2B0
	ldrb r1, [r4]
	adds r1, r7
	movs r2, 0x2
	bl LoadPalette
	ldrb r0, [r5, 0x1]
	bl sub_8121248
	ldrb r1, [r4, 0x1]
	adds r1, r7
	movs r2, 0x2
	bl LoadPalette
	b _08121BCC
	.align 2, 0
_08121BA0: .4byte gUnknown_845A2BE
_08121BA4: .4byte gUnknown_845A2B0
_08121BA8:
	ldr r5, _08121C68 @ =gUnknown_845A2C0
	ldrb r0, [r5]
	bl sub_8121248
	ldr r4, _08121C6C @ =gUnknown_845A2B0
	ldrb r1, [r4]
	adds r1, r7
	movs r2, 0x2
	bl LoadPalette
	ldrb r0, [r5, 0x1]
	bl sub_8121248
	ldrb r1, [r4, 0x1]
	adds r1, r7
	movs r2, 0x2
	bl LoadPalette
_08121BCC:
	mov r1, r8
	lsls r0, r1, 16
	asrs r0, 16
	mov r2, r9
	lsls r1, r2, 16
	asrs r1, 16
	ldr r2, [r6]
	ldrb r2, [r2, 0x1A]
	bl GetScaledHPFraction
	lsls r0, 24
	lsrs r5, r0, 24
	ldrb r0, [r6, 0x8]
	ldr r4, _08121C6C @ =gUnknown_845A2B0
	ldrb r1, [r4, 0x1]
	ldr r3, [r6]
	ldrb r2, [r3, 0x18]
	ldrb r3, [r3, 0x19]
	str r5, [sp]
	movs r7, 0x1
	str r7, [sp, 0x4]
	bl FillWindowPixelRect
	ldrb r0, [r6, 0x8]
	ldrb r1, [r4]
	ldr r3, [r6]
	ldrb r2, [r3, 0x18]
	ldrb r3, [r3, 0x19]
	adds r3, 0x1
	str r5, [sp]
	movs r4, 0x2
	str r4, [sp, 0x4]
	bl FillWindowPixelRect
	ldr r1, [r6]
	ldrb r0, [r1, 0x1A]
	cmp r5, r0
	beq _08121C50
	ldrb r0, [r6, 0x8]
	ldrb r2, [r1, 0x18]
	adds r2, r5
	ldrb r3, [r1, 0x19]
	ldrb r1, [r1, 0x1A]
	subs r1, r5
	lsls r1, 16
	lsrs r1, 16
	str r1, [sp]
	str r7, [sp, 0x4]
	movs r1, 0xD
	bl FillWindowPixelRect
	ldrb r0, [r6, 0x8]
	ldr r1, [r6]
	ldrb r2, [r1, 0x18]
	adds r2, r5
	ldrb r3, [r1, 0x19]
	adds r3, 0x1
	ldrb r1, [r1, 0x1A]
	subs r1, r5
	lsls r1, 16
	lsrs r1, 16
	str r1, [sp]
	str r4, [sp, 0x4]
	movs r1, 0x2
	bl FillWindowPixelRect
_08121C50:
	ldrb r0, [r6, 0x8]
	movs r1, 0x2
	bl CopyWindowToVram
	add sp, 0x8
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08121C68: .4byte gUnknown_845A2C0
_08121C6C: .4byte gUnknown_845A2B0
	thumb_func_end sub_8121B2C

	thumb_func_start sub_8121C70
sub_8121C70: @ 8121C70
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0xC
	adds r6, r1, 0
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r2, 24
	lsrs r2, 24
	adds r7, r2, 0
	cmp r7, 0
	beq _08121CAA
	ldr r5, [r6]
	ldrb r0, [r6, 0x8]
	ldrb r1, [r5, 0x1C]
	lsrs r1, 3
	ldrb r2, [r5, 0x1D]
	lsrs r2, 3
	ldrb r3, [r5, 0x1E]
	lsrs r3, 3
	ldrb r4, [r5, 0x1F]
	lsrs r4, 3
	str r4, [sp]
	movs r4, 0x1
	str r4, [sp, 0x4]
	ldr r4, [r5]
	bl _call_via_r4
_08121CAA:
	cmp r7, 0x2
	beq _08121CD0
	ldrb r0, [r6, 0x8]
	ldr r1, [r6]
	ldrb r2, [r1, 0x1C]
	ldrb r3, [r1, 0x1D]
	ldr r1, _08121CDC @ =gUnknown_8459FFC
	str r1, [sp]
	movs r1, 0
	str r1, [sp, 0x4]
	ldr r4, _08121CE0 @ =gUnknown_845A354
	mov r5, r8
	lsls r1, r5, 2
	adds r1, r4
	ldr r1, [r1]
	str r1, [sp, 0x8]
	movs r1, 0x1
	bl box_print
_08121CD0:
	add sp, 0xC
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08121CDC: .4byte gUnknown_8459FFC
_08121CE0: .4byte gUnknown_845A354
	thumb_func_end sub_8121C70

	thumb_func_start sub_8121CE4
sub_8121CE4: @ 8121CE4
	push {r4,lr}
	adds r4, r0, 0
	ldrb r0, [r4]
	cmp r0, 0xFF
	beq _08121D04
	movs r1, 0
	bl sub_810F4D8
	ldrb r0, [r4]
	bl RemoveWindow
	movs r0, 0xFF
	strb r0, [r4]
	movs r0, 0x2
	bl schedule_bg_copy_tilemap_to_vram
_08121D04:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8121CE4

	thumb_func_start sub_8121D0C
sub_8121D0C: @ 8121D0C
	push {r4-r6,lr}
	sub sp, 0xC
	adds r6, r0, 0
	ldr r0, _08121D3C @ =gUnknown_203B09C
	ldr r4, [r0]
	adds r5, r4, 0
	adds r5, 0xD
	ldrb r0, [r4, 0xD]
	cmp r0, 0xFF
	beq _08121D26
	adds r0, r5, 0
	bl sub_8121CE4
_08121D26:
	cmp r6, 0x7F
	beq _08121DE8
	adds r0, r6, 0
	subs r0, 0x16
	cmp r0, 0x4
	bhi _08121D80
	lsls r0, 2
	ldr r1, _08121D40 @ =_08121D44
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08121D3C: .4byte gUnknown_203B09C
_08121D40: .4byte _08121D44
	.align 2, 0
_08121D44:
	.4byte _08121D58
	.4byte _08121D70
	.4byte _08121D70
	.4byte _08121D60
	.4byte _08121D68
_08121D58:
	ldr r0, _08121D5C @ =gUnknown_845A128
	b _08121D72
	.align 2, 0
_08121D5C: .4byte gUnknown_845A128
_08121D60:
	ldr r0, _08121D64 @ =gUnknown_845A130
	b _08121D72
	.align 2, 0
_08121D64: .4byte gUnknown_845A130
_08121D68:
	ldr r0, _08121D6C @ =gUnknown_845A138
	b _08121D72
	.align 2, 0
_08121D6C: .4byte gUnknown_845A138
_08121D70:
	ldr r0, _08121D7C @ =gUnknown_845A140
_08121D72:
	bl AddWindow
	strb r0, [r5]
	b _08121D88
	.align 2, 0
_08121D7C: .4byte gUnknown_845A140
_08121D80:
	ldr r0, _08121D9C @ =gUnknown_845A120
	bl AddWindow
	strb r0, [r4, 0xD]
_08121D88:
	cmp r6, 0
	bne _08121DB0
	ldr r0, _08121DA0 @ =gUnknown_203B09C
	ldr r0, [r0]
	ldrb r0, [r0, 0x8]
	lsls r0, 31
	cmp r0, 0
	beq _08121DA4
	movs r6, 0x2
	b _08121DB0
	.align 2, 0
_08121D9C: .4byte gUnknown_845A120
_08121DA0: .4byte gUnknown_203B09C
_08121DA4:
	bl sub_8121DF8
	lsls r0, 24
	cmp r0, 0
	bne _08121DB0
	movs r6, 0x1
_08121DB0:
	ldrb r0, [r5]
	movs r1, 0
	movs r2, 0x58
	movs r3, 0xF
	bl SetWindowBorderStyle
	ldr r4, _08121DF0 @ =gStringVar4
	ldr r1, _08121DF4 @ =gUnknown_845A2E8
	lsls r0, r6, 2
	adds r0, r1
	ldr r1, [r0]
	adds r0, r4, 0
	bl StringExpandPlaceholders
	ldrb r0, [r5]
	movs r1, 0x2
	str r1, [sp]
	movs r1, 0
	str r1, [sp, 0x4]
	str r1, [sp, 0x8]
	movs r1, 0x2
	adds r2, r4, 0
	movs r3, 0
	bl AddTextPrinterParameterized
	movs r0, 0x2
	bl schedule_bg_copy_tilemap_to_vram
_08121DE8:
	add sp, 0xC
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08121DF0: .4byte gStringVar4
_08121DF4: .4byte gUnknown_845A2E8
	thumb_func_end sub_8121D0C

	thumb_func_start sub_8121DF8
sub_8121DF8: @ 8121DF8
	push {r4-r7,lr}
	ldr r7, _08121E0C @ =gPlayerParty
	movs r6, 0
	ldr r0, _08121E10 @ =gUnknown_203B0A0
	ldrb r0, [r0, 0xB]
	cmp r0, 0x1
	bne _08121E14
_08121E06:
	movs r0, 0x1
	b _08121E56
	.align 2, 0
_08121E0C: .4byte gPlayerParty
_08121E10: .4byte gUnknown_203B0A0
_08121E14:
	movs r5, 0
_08121E16:
	movs r0, 0x64
	muls r0, r5
	adds r4, r7, r0
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _08121E46
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	cmp r0, 0
	bne _08121E40
	adds r0, r4, 0
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0
	beq _08121E46
_08121E40:
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
_08121E46:
	cmp r6, 0x1
	bhi _08121E06
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x5
	bls _08121E16
	movs r0, 0
_08121E56:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8121DF8

	thumb_func_start sub_8121E5C
sub_8121E5C: @ 8121E5C
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x24
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x1
	beq _08121EBC
	cmp r4, 0x1
	bgt _08121E78
	cmp r4, 0
	beq _08121E7E
	b _08121ECC
_08121E78:
	cmp r4, 0x2
	beq _08121EC4
	b _08121ECC
_08121E7E:
	ldr r0, _08121EB4 @ =gUnknown_203B09C
	ldr r1, [r0]
	ldrb r0, [r1, 0x17]
	lsls r0, 1
	movs r3, 0x13
	subs r3, r0
	lsls r3, 24
	lsrs r3, 24
	movs r0, 0xA
	str r0, [sp]
	ldrb r0, [r1, 0x17]
	lsls r0, 25
	lsrs r0, 24
	str r0, [sp, 0x4]
	movs r0, 0xE
	str r0, [sp, 0x8]
	ldr r0, _08121EB8 @ =0x000002bf
	str r0, [sp, 0xC]
	add r0, sp, 0x14
	movs r1, 0x2
	movs r2, 0x13
	bl SetWindowTemplateFields
	ldr r0, [sp, 0x14]
	ldr r1, [sp, 0x18]
	b _08121ED2
	.align 2, 0
_08121EB4: .4byte gUnknown_203B09C
_08121EB8: .4byte 0x000002bf
_08121EBC:
	ldr r0, _08121EC0 @ =gUnknown_845A148
	b _08121ECE
	.align 2, 0
_08121EC0: .4byte gUnknown_845A148
_08121EC4:
	ldr r0, _08121EC8 @ =gUnknown_845A150
	b _08121ECE
	.align 2, 0
_08121EC8: .4byte gUnknown_845A150
_08121ECC:
	ldr r0, _08121EF8 @ =gUnknown_845A158
_08121ECE:
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
_08121ED2:
	str r0, [sp, 0x1C]
	str r1, [sp, 0x20]
	add r0, sp, 0x1C
	bl AddWindow
	ldr r6, _08121EFC @ =gUnknown_203B09C
	ldr r1, [r6]
	strb r0, [r1, 0xC]
	ldr r0, [r6]
	ldrb r0, [r0, 0xC]
	movs r1, 0
	movs r2, 0x4F
	movs r3, 0xD
	bl SetWindowBorderStyle
	cmp r4, 0x3
	bne _08121F00
	ldr r0, [r6]
	b _08121FA2
	.align 2, 0
_08121EF8: .4byte gUnknown_845A158
_08121EFC: .4byte gUnknown_203B09C
_08121F00:
	movs r0, 0x2
	movs r1, 0
	bl GetMenuCursorDimensionByFont
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	movs r0, 0x2
	movs r1, 0x2
	bl GetFontAttribute
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	movs r5, 0
	ldr r0, [r6]
	ldrb r0, [r0, 0x17]
	cmp r5, r0
	bcs _08121F7A
	adds r7, r6, 0
	movs r6, 0
_08121F2A:
	ldr r1, [r7]
	adds r0, r1, 0
	adds r0, 0xF
	adds r4, r0, r5
	ldrb r0, [r4]
	movs r2, 0x3
	cmp r0, 0x11
	bls _08121F3C
	movs r2, 0x4
_08121F3C:
	ldrb r0, [r1, 0xC]
	lsls r3, r5, 4
	adds r3, 0x2
	lsls r3, 24
	lsrs r3, 24
	mov r1, r8
	str r1, [sp]
	str r6, [sp, 0x4]
	lsls r1, r2, 1
	adds r1, r2
	ldr r2, _08121FB4 @ =gUnknown_8459FFC
	adds r1, r2
	str r1, [sp, 0x8]
	str r6, [sp, 0xC]
	ldr r2, _08121FB8 @ =gUnknown_845A618
	ldrb r1, [r4]
	lsls r1, 3
	adds r1, r2
	ldr r1, [r1]
	str r1, [sp, 0x10]
	movs r1, 0x2
	mov r2, r9
	bl AddTextPrinterParameterized2
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, [r7]
	ldrb r0, [r0, 0x17]
	cmp r5, r0
	bcc _08121F2A
_08121F7A:
	ldr r4, _08121FBC @ =gUnknown_203B09C
	ldr r2, [r4]
	ldrb r0, [r2, 0xC]
	movs r1, 0x10
	str r1, [sp]
	ldrb r1, [r2, 0x17]
	str r1, [sp, 0x4]
	movs r1, 0
	str r1, [sp, 0x8]
	movs r1, 0x1
	str r1, [sp, 0xC]
	movs r1, 0x2
	movs r2, 0
	movs r3, 0x2
	bl sub_810F774
	movs r0, 0x2
	bl schedule_bg_copy_tilemap_to_vram
	ldr r0, [r4]
_08121FA2:
	ldrb r0, [r0, 0xC]
	add sp, 0x24
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08121FB4: .4byte gUnknown_8459FFC
_08121FB8: .4byte gUnknown_845A618
_08121FBC: .4byte gUnknown_203B09C
	thumb_func_end sub_8121E5C

	thumb_func_start sub_8121FC0
sub_8121FC0: @ 8121FC0
	push {r4,lr}
	sub sp, 0x10
	adds r4, r0, 0
	movs r0, 0x6
	movs r1, 0
	movs r2, 0x4F
	movs r3, 0xD
	bl SetWindowBorderStyle
	ldr r2, _08122008 @ =gTextFlags
	ldrb r0, [r2]
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2]
	bl GetTextSpeedSetting
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	movs r0, 0
	str r0, [sp]
	movs r0, 0x2
	str r0, [sp, 0x4]
	movs r0, 0x1
	str r0, [sp, 0x8]
	movs r0, 0x3
	str r0, [sp, 0xC]
	movs r0, 0x6
	movs r1, 0x2
	adds r2, r4, 0
	bl AddTextPrinterParameterized3
	add sp, 0x10
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08122008: .4byte gTextFlags
	thumb_func_end sub_8121FC0

	thumb_func_start sub_812200C
sub_812200C: @ 812200C
	push {lr}
	sub sp, 0xC
	ldr r0, _08122030 @ =gUnknown_845A160
	movs r1, 0x4F
	str r1, [sp]
	movs r1, 0xD
	str r1, [sp, 0x4]
	movs r1, 0
	str r1, [sp, 0x8]
	movs r1, 0x2
	movs r2, 0
	movs r3, 0x2
	bl CreateYesNoMenu
	add sp, 0xC
	pop {r0}
	bx r0
	.align 2, 0
_08122030: .4byte gUnknown_845A160
	thumb_func_end sub_812200C

	thumb_func_start sub_8122034
sub_8122034: @ 8122034
	push {r4,lr}
	ldr r0, _0812205C @ =gUnknown_845A168
	bl AddWindow
	ldr r4, _08122060 @ =gUnknown_203B09C
	ldr r1, [r4]
	strb r0, [r1, 0xC]
	ldr r0, [r4]
	ldrb r0, [r0, 0xC]
	movs r1, 0
	movs r2, 0x4F
	movs r3, 0xD
	bl SetWindowBorderStyle
	ldr r0, [r4]
	ldrb r0, [r0, 0xC]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0812205C: .4byte gUnknown_845A168
_08122060: .4byte gUnknown_203B09C
	thumb_func_end sub_8122034

	thumb_func_start sub_8122064
sub_8122064: @ 8122064
	push {r4,lr}
	ldr r4, _08122080 @ =gUnknown_203B09C
	ldr r0, [r4]
	ldrb r0, [r0, 0xC]
	bl ClearWindowTilemap
	ldr r0, [r4]
	adds r0, 0xC
	bl sub_8121CE4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08122080: .4byte gUnknown_203B09C
	thumb_func_end sub_8122064

	thumb_func_start sub_8122084
sub_8122084: @ 8122084
	push {r4,r5,lr}
	sub sp, 0x10
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r5, _081220CC @ =gStringVar4
	adds r0, r5, 0
	bl StringExpandPlaceholders
	ldr r2, _081220D0 @ =gTextFlags
	ldrb r0, [r2]
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2]
	bl GetTextSpeedSetting
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	movs r0, 0
	str r0, [sp]
	movs r0, 0x2
	str r0, [sp, 0x4]
	movs r0, 0x1
	str r0, [sp, 0x8]
	movs r0, 0x3
	str r0, [sp, 0xC]
	adds r0, r4, 0
	movs r1, 0x4
	adds r2, r5, 0
	bl AddTextPrinterParameterized3
	add sp, 0x10
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_081220CC: .4byte gStringVar4
_081220D0: .4byte gTextFlags
	thumb_func_end sub_8122084

	thumb_func_start sub_81220D4
sub_81220D4: @ 81220D4
	push {r4,lr}
	ldr r0, _08122108 @ =gUnknown_845A170
	bl AddWindow
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	movs r1, 0x4F
	movs r2, 0xE0
	bl sub_814FEAC
	adds r0, r4, 0
	movs r1, 0x1
	movs r2, 0x4F
	movs r3, 0xE
	bl sub_810EDC4
	ldr r1, _0812210C @ =gUnknown_8417457
	adds r0, r4, 0
	bl sub_8122084
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08122108: .4byte gUnknown_845A170
_0812210C: .4byte gUnknown_8417457
	thumb_func_end sub_81220D4

	thumb_func_start sub_8122110
sub_8122110: @ 8122110
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	bl ClearWindowTilemap
	adds r0, r4, 0
	movs r1, 0
	bl sub_810F260
	adds r0, r4, 0
	bl RemoveWindow
	movs r0, 0x2
	bl schedule_bg_copy_tilemap_to_vram
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8122110

	thumb_func_start sub_8122138
sub_8122138: @ 8122138
	push {r4,r5,lr}
	sub sp, 0x14
	lsls r0, 24
	lsrs r0, 24
	adds r5, r0, 0
	ldr r0, _08122168 @ =gUnknown_203B09C
	ldr r4, [r0]
	cmp r5, 0x11
	bhi _0812216C
	ldrb r0, [r4, 0xE]
	cmp r0, 0xFF
	beq _081221C0
	bl ClearWindowTilemap
	ldrb r0, [r4, 0xE]
	bl RemoveWindow
	movs r0, 0xFF
	strb r0, [r4, 0xE]
	movs r0, 0x2
	bl schedule_bg_copy_tilemap_to_vram
	b _081221C0
	.align 2, 0
_08122168: .4byte gUnknown_203B09C
_0812216C:
	ldrb r0, [r4, 0xE]
	cmp r0, 0xFF
	bne _0812217A
	ldr r0, _081221C8 @ =gUnknown_845A178
	bl AddWindow
	strb r0, [r4, 0xE]
_0812217A:
	ldrb r0, [r4, 0xE]
	bl sub_8112F18
	movs r0, 0x2
	movs r1, 0x2
	bl GetFontAttribute
	lsls r0, 24
	lsrs r0, 24
	ldrb r2, [r4, 0xE]
	str r0, [sp]
	movs r1, 0
	str r1, [sp, 0x4]
	ldr r0, _081221CC @ =gUnknown_845A00B
	str r0, [sp, 0x8]
	str r1, [sp, 0xC]
	ldr r1, _081221D0 @ =gUnknown_845A37C
	adds r0, r5, 0
	subs r0, 0x12
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	str r0, [sp, 0x10]
	adds r0, r2, 0
	movs r1, 0x2
	movs r2, 0x3
	movs r3, 0x6
	bl AddTextPrinterParameterized2
	ldrb r0, [r4, 0xE]
	bl PutWindowTilemap
	movs r0, 0x2
	bl schedule_bg_copy_tilemap_to_vram
_081221C0:
	add sp, 0x14
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_081221C8: .4byte gUnknown_845A178
_081221CC: .4byte gUnknown_845A00B
_081221D0: .4byte gUnknown_845A37C
	thumb_func_end sub_8122138

	thumb_func_start party_menu_icon_anim
party_menu_icon_anim: @ 81221D4
	push {r4-r7,lr}
	sub sp, 0x4
	adds r5, r0, 0
	adds r7, r1, 0
	adds r4, r2, 0
	movs r6, 0x1
	bl sub_811FA20
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0812220A
	ldr r0, _08122240 @ =gMain
	ldr r1, _08122244 @ =0x00000439
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0812220A
	ldr r0, _08122248 @ =gUnknown_845A59C
	adds r0, r4, r0
	ldrb r1, [r0]
	eors r1, r6
	negs r0, r1
	orrs r0, r1
	lsrs r6, r0, 31
_0812220A:
	adds r0, r5, 0
	movs r1, 0x41
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	movs r1, 0
	bl GetMonData
	adds r1, r0, 0
	str r6, [sp]
	adds r0, r4, 0
	adds r2, r7, 0
	movs r3, 0x1
	bl party_menu_link_mon_icon_anim
	ldrb r0, [r7, 0x9]
	adds r1, r5, 0
	bl sub_8122358
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08122240: .4byte gMain
_08122244: .4byte 0x00000439
_08122248: .4byte gUnknown_845A59C
	thumb_func_end party_menu_icon_anim

	thumb_func_start party_menu_link_mon_icon_anim
party_menu_link_mon_icon_anim: @ 812224C
	push {r4-r7,lr}
	sub sp, 0xC
	adds r6, r1, 0
	adds r4, r2, 0
	lsls r0, 16
	lsrs r5, r0, 16
	lsls r3, 24
	lsrs r7, r3, 24
	cmp r5, 0
	beq _0812229A
	ldr r1, _081222A4 @ =sub_809718C
	ldr r0, [r4, 0x4]
	ldrb r2, [r0]
	ldrb r3, [r0, 0x1]
	movs r0, 0x4
	str r0, [sp]
	str r6, [sp, 0x4]
	ldr r0, [sp, 0x20]
	str r0, [sp, 0x8]
	adds r0, r5, 0
	bl sub_8096E18
	strb r0, [r4, 0x9]
	ldr r2, _081222A8 @ =gSprites
	ldrb r0, [r4, 0x9]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	movs r0, 0x3
	adds r2, r7, 0
	ands r2, r0
	lsls r2, 2
	ldrb r3, [r1, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r3
	orrs r0, r2
	strb r0, [r1, 0x5]
_0812229A:
	add sp, 0xC
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081222A4: .4byte sub_809718C
_081222A8: .4byte gSprites
	thumb_func_end party_menu_link_mon_icon_anim

	thumb_func_start sub_81222AC
sub_81222AC: @ 81222AC
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 16
	asrs r1, 16
	lsls r2, 16
	asrs r2, 16
	adds r0, r1, 0
	adds r1, r2, 0
	bl GetHPBarLevel
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	beq _0812230C
	cmp r0, 0x2
	bgt _081222D4
	cmp r0, 0x1
	beq _08122324
	b _0812233C
_081222D4:
	cmp r0, 0x3
	beq _081222F4
	cmp r0, 0x4
	bne _0812233C
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	ldr r1, _081222F0 @ =gSprites
	adds r0, r1
	movs r1, 0
	bl sub_8097414
	b _0812234C
	.align 2, 0
_081222F0: .4byte gSprites
_081222F4:
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	ldr r1, _08122308 @ =gSprites
	adds r0, r1
	movs r1, 0x1
	bl sub_8097414
	b _0812234C
	.align 2, 0
_08122308: .4byte gSprites
_0812230C:
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	ldr r1, _08122320 @ =gSprites
	adds r0, r1
	movs r1, 0x2
	bl sub_8097414
	b _0812234C
	.align 2, 0
_08122320: .4byte gSprites
_08122324:
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	ldr r1, _08122338 @ =gSprites
	adds r0, r1
	movs r1, 0x3
	bl sub_8097414
	b _0812234C
	.align 2, 0
_08122338: .4byte gSprites
_0812233C:
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	ldr r1, _08122354 @ =gSprites
	adds r0, r1
	movs r1, 0x4
	bl sub_8097414
_0812234C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08122354: .4byte gSprites
	thumb_func_end sub_81222AC

	thumb_func_start sub_8122358
sub_8122358: @ 8122358
	push {r4-r6,lr}
	adds r5, r0, 0
	adds r6, r1, 0
	lsls r5, 24
	lsrs r5, 24
	adds r0, r6, 0
	movs r1, 0x39
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r6, 0
	movs r1, 0x3A
	bl GetMonData
	adds r2, r0, 0
	lsls r2, 16
	lsrs r2, 16
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_81222AC
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8122358

	thumb_func_start sub_812238C
sub_812238C: @ 812238C
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 24
	ldr r5, _081223BC @ =gSprites
	lsls r0, r4, 4
	adds r0, r4
	lsls r6, r0, 2
	adds r2, r6, r5
	movs r7, 0
	movs r3, 0
	strh r3, [r2, 0x2E]
	mov r12, r5
	cmp r1, 0
	bne _081223E4
	movs r1, 0x20
	ldrsh r0, [r2, r1]
	cmp r0, 0x10
	bne _081223C4
	strh r3, [r2, 0x24]
	ldr r0, _081223C0 @ =0x0000fffc
	strh r0, [r2, 0x26]
	b _081223CA
	.align 2, 0
_081223BC: .4byte gSprites
_081223C0: .4byte 0x0000fffc
_081223C4:
	ldr r0, _081223DC @ =0x0000fffc
	strh r0, [r2, 0x24]
	strh r3, [r2, 0x26]
_081223CA:
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	mov r1, r12
	adds r1, 0x1C
	adds r0, r1
	ldr r1, _081223E0 @ =sub_8122428
	b _081223F0
	.align 2, 0
_081223DC: .4byte 0x0000fffc
_081223E0: .4byte sub_8122428
_081223E4:
	strh r3, [r2, 0x24]
	strh r3, [r2, 0x26]
	adds r0, r5, 0
	adds r0, 0x1C
	adds r0, r6, r0
	ldr r1, _081223F8 @ =sub_81223FC
_081223F0:
	str r1, [r0]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081223F8: .4byte sub_81223FC
	thumb_func_end sub_812238C

	thumb_func_start sub_81223FC
sub_81223FC: @ 81223FC
	push {r4,lr}
	adds r4, r0, 0
	bl UpdateMonIconFrame
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _08122422
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08122420
	ldr r0, _0812241C @ =0x0000fffd
	strh r0, [r4, 0x26]
	b _08122422
	.align 2, 0
_0812241C: .4byte 0x0000fffd
_08122420:
	strh r1, [r4, 0x26]
_08122422:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_81223FC

	thumb_func_start sub_8122428
sub_8122428: @ 8122428
	push {lr}
	bl UpdateMonIconFrame
	pop {r0}
	bx r0
	thumb_func_end sub_8122428

	thumb_func_start party_menu_held_item_object
party_menu_held_item_object: @ 8122434
	push {r4,r5,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _0812245C
	ldr r0, _08122464 @ =gUnknown_845A43C
	ldr r2, [r4, 0x4]
	ldrb r1, [r2, 0x2]
	ldrb r2, [r2, 0x3]
	movs r3, 0
	bl CreateSprite
	strb r0, [r4, 0xA]
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_81224B4
_0812245C:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08122464: .4byte gUnknown_845A43C
	thumb_func_end party_menu_held_item_object

	thumb_func_start party_menu_link_mon_held_item_object
party_menu_link_mon_held_item_object: @ 8122468
	push {r4,r5,lr}
	adds r4, r2, 0
	lsls r0, 16
	lsls r1, 16
	lsrs r5, r1, 16
	cmp r0, 0
	beq _081224A4
	ldr r0, _081224AC @ =gUnknown_845A43C
	ldr r2, [r4, 0x4]
	ldrb r1, [r2, 0x2]
	ldrb r2, [r2, 0x3]
	movs r3, 0
	bl CreateSprite
	strb r0, [r4, 0xA]
	ldr r2, _081224B0 @ =gSprites
	ldrb r0, [r4, 0xA]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrb r2, [r1, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	strb r0, [r1, 0x5]
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_81224D0
_081224A4:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_081224AC: .4byte gUnknown_845A43C
_081224B0: .4byte gSprites
	thumb_func_end party_menu_link_mon_held_item_object

	thumb_func_start sub_81224B4
sub_81224B4: @ 81224B4
	push {r4,lr}
	adds r4, r1, 0
	movs r1, 0xC
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	adds r1, r4, 0
	bl sub_81224D0
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_81224B4

	thumb_func_start sub_81224D0
sub_81224D0: @ 81224D0
	push {r4,lr}
	adds r4, r1, 0
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0
	bne _081224F8
	ldr r2, _081224F4 @ =gSprites
	ldrb r1, [r4, 0xA]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	b _08122544
	.align 2, 0
_081224F4: .4byte gSprites
_081224F8:
	bl itemid_is_mail
	lsls r0, 24
	cmp r0, 0
	beq _0812251C
	ldrb r1, [r4, 0xA]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08122518 @ =gSprites
	adds r0, r1
	movs r1, 0x1
	bl StartSpriteAnim
	b _0812252E
	.align 2, 0
_08122518: .4byte gSprites
_0812251C:
	ldrb r1, [r4, 0xA]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0812254C @ =gSprites
	adds r0, r1
	movs r1, 0
	bl StartSpriteAnim
_0812252E:
	ldr r2, _0812254C @ =gSprites
	ldrb r1, [r4, 0xA]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x3E
	ldrb r2, [r0]
	movs r1, 0x5
	negs r1, r1
	ands r1, r2
_08122544:
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812254C: .4byte gSprites
	thumb_func_end sub_81224D0

	thumb_func_start sub_8122550
sub_8122550: @ 8122550
	push {lr}
	ldr r0, _08122564 @ =gUnknown_845A42C
	bl LoadSpriteSheet
	ldr r0, _08122568 @ =gUnknown_845A434
	bl LoadSpritePalette
	pop {r0}
	bx r0
	.align 2, 0
_08122564: .4byte gUnknown_845A42C
_08122568: .4byte gUnknown_845A434
	thumb_func_end sub_8122550

	thumb_func_start sub_812256C
sub_812256C: @ 812256C
	push {r4-r7,lr}
	adds r6, r0, 0
	adds r7, r1, 0
	lsls r2, 24
	lsrs r2, 24
	cmp r2, 0
	beq _08122580
	cmp r2, 0x1
	beq _081225C8
	b _08122604
_08122580:
	movs r5, 0
	ldrb r0, [r6]
	cmp r5, r0
	bcs _08122604
_08122588:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _081225C4 @ =gPlayerParty
	adds r0, r1
	movs r1, 0xC
	bl GetMonData
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0
	beq _081225B4
	adds r0, r7, r5
	ldrb r4, [r0]
	adds r0, r1, 0
	bl itemid_is_mail
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_8122610
_081225B4:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	ldrb r0, [r6]
	cmp r5, r0
	bcc _08122588
	b _08122604
	.align 2, 0
_081225C4: .4byte gPlayerParty
_081225C8:
	movs r5, 0
	b _081225FE
_081225CC:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0812260C @ =gEnemyParty
	adds r0, r1
	movs r1, 0xC
	bl GetMonData
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0
	beq _081225F8
	adds r0, r5, r7
	ldrb r4, [r0, 0x6]
	adds r0, r1, 0
	bl itemid_is_mail
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_8122610
_081225F8:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
_081225FE:
	ldrb r0, [r6, 0x1]
	cmp r5, r0
	bcc _081225CC
_08122604:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0812260C: .4byte gEnemyParty
	thumb_func_end sub_812256C

	thumb_func_start sub_8122610
sub_8122610: @ 8122610
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	adds r6, r0, 0
	mov r9, r1
	lsls r6, 24
	lsrs r6, 24
	mov r0, r9
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	ldr r0, _08122688 @ =gSprites
	mov r8, r0
	lsls r0, r6, 4
	adds r0, r6
	lsls r0, 2
	add r0, r8
	adds r0, 0x43
	ldrb r3, [r0]
	ldr r0, _0812268C @ =gUnknown_845A43C
	subs r3, 0x1
	lsls r3, 24
	lsrs r3, 24
	movs r1, 0xFA
	movs r2, 0xAA
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	mov r0, r8
	adds r5, r4, r0
	movs r0, 0x4
	strh r0, [r5, 0x24]
	movs r0, 0xA
	strh r0, [r5, 0x26]
	movs r0, 0x1C
	add r8, r0
	add r4, r8
	ldr r0, _08122690 @ =sub_8122694
	str r0, [r4]
	strh r6, [r5, 0x3C]
	adds r0, r5, 0
	mov r1, r9
	bl StartSpriteAnim
	ldr r1, [r4]
	adds r0, r5, 0
	bl _call_via_r1
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08122688: .4byte gSprites
_0812268C: .4byte gUnknown_845A43C
_08122690: .4byte sub_8122694
	thumb_func_end sub_8122610

	thumb_func_start sub_8122694
sub_8122694: @ 8122694
	push {r4,lr}
	adds r4, r0, 0
	ldrh r1, [r4, 0x3C]
	lsls r1, 24
	lsrs r1, 24
	ldr r2, _081226C4 @ =gSprites
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, r0, r2
	adds r0, r2, 0
	adds r0, 0x3E
	ldrb r0, [r0]
	lsls r0, 29
	cmp r0, 0
	bge _081226C8
	adds r0, r4, 0
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	b _081226E6
	.align 2, 0
_081226C4: .4byte gSprites
_081226C8:
	adds r3, r4, 0
	adds r3, 0x3E
	ldrb r1, [r3]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r3]
	ldrh r0, [r2, 0x24]
	ldrh r1, [r2, 0x20]
	adds r0, r1
	strh r0, [r4, 0x20]
	ldrh r0, [r2, 0x26]
	ldrh r2, [r2, 0x22]
	adds r0, r2
	strh r0, [r4, 0x22]
_081226E6:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8122694

	thumb_func_start party_menu_pokeball_object
party_menu_pokeball_object: @ 81226EC
	push {r4,lr}
	adds r4, r1, 0
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _0812270A
	ldr r0, _08122710 @ =gUnknown_845A484
	ldr r2, [r4, 0x4]
	ldrb r1, [r2, 0x6]
	ldrb r2, [r2, 0x7]
	movs r3, 0x8
	bl CreateSprite
	strb r0, [r4, 0xB]
_0812270A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08122710: .4byte gUnknown_845A484
	thumb_func_end party_menu_pokeball_object

	thumb_func_start party_menu_link_mon_pokeball_object
party_menu_link_mon_pokeball_object: @ 8122714
	push {r4,lr}
	adds r4, r1, 0
	lsls r0, 16
	cmp r0, 0
	beq _08122744
	ldr r0, _0812274C @ =gUnknown_845A484
	ldr r2, [r4, 0x4]
	ldrb r1, [r2, 0x6]
	ldrb r2, [r2, 0x7]
	movs r3, 0x8
	bl CreateSprite
	strb r0, [r4, 0xB]
	ldr r2, _08122750 @ =gSprites
	ldrb r0, [r4, 0xB]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrb r2, [r1, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	strb r0, [r1, 0x5]
_08122744:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812274C: .4byte gUnknown_845A484
_08122750: .4byte gSprites
	thumb_func_end party_menu_link_mon_pokeball_object

	thumb_func_start sub_8122754
sub_8122754: @ 8122754
	push {lr}
	adds r3, r0, 0
	adds r2, r1, 0
	lsls r3, 24
	lsrs r3, 24
	lsls r2, 24
	lsrs r2, 24
	ldr r0, _0812278C @ =gUnknown_845A484
	adds r1, r3, 0
	movs r3, 0x8
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08122790 @ =gSprites
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrb r3, [r1, 0x5]
	movs r2, 0xD
	negs r2, r2
	ands r2, r3
	movs r3, 0x8
	orrs r2, r3
	strb r2, [r1, 0x5]
	pop {r1}
	bx r1
	.align 2, 0
_0812278C: .4byte gUnknown_845A484
_08122790: .4byte gSprites
	thumb_func_end sub_8122754

	thumb_func_start sub_8122794
sub_8122794: @ 8122794
	push {lr}
	adds r3, r0, 0
	adds r2, r1, 0
	lsls r3, 24
	lsrs r3, 24
	lsls r2, 24
	lsrs r2, 24
	ldr r0, _081227B4 @ =gUnknown_845A4F4
	adds r1, r3, 0
	movs r3, 0x8
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_081227B4: .4byte gUnknown_845A4F4
	thumb_func_end sub_8122794

	thumb_func_start sub_81227B8
sub_81227B8: @ 81227B8
	push {lr}
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	ldr r2, _081227D8 @ =gSprites
	adds r0, r2
	bl StartSpriteAnim
	pop {r0}
	bx r0
	.align 2, 0
_081227D8: .4byte gSprites
	thumb_func_end sub_81227B8

	thumb_func_start sub_81227DC
sub_81227DC: @ 81227DC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r7, r1, 24
	lsls r2, 24
	lsrs r6, r2, 24
	cmp r6, 0
	bne _08122820
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r0, _0812281C @ =gSprites
	mov r8, r0
	add r4, r8
	adds r0, r4, 0
	movs r1, 0x2
	bl StartSpriteAnim
	lsls r5, r7, 4
	adds r5, r7
	lsls r5, 2
	add r5, r8
	adds r0, r5, 0
	movs r1, 0x4
	bl StartSpriteAnim
	strh r6, [r4, 0x26]
	strh r6, [r5, 0x26]
	b _0812284C
	.align 2, 0
_0812281C: .4byte gSprites
_08122820:
	lsls r5, r0, 4
	adds r5, r0
	lsls r5, 2
	ldr r0, _08122858 @ =gSprites
	mov r8, r0
	add r5, r8
	adds r0, r5, 0
	movs r1, 0x3
	bl StartSpriteAnim
	lsls r4, r7, 4
	adds r4, r7
	lsls r4, 2
	add r4, r8
	adds r0, r4, 0
	movs r1, 0x5
	bl StartSpriteAnim
	ldr r0, _0812285C @ =0x0000fffc
	strh r0, [r5, 0x26]
	movs r0, 0x4
	strh r0, [r4, 0x26]
_0812284C:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08122858: .4byte gSprites
_0812285C: .4byte 0x0000fffc
	thumb_func_end sub_81227DC

	thumb_func_start sub_8122860
sub_8122860: @ 8122860
	push {lr}
	ldr r0, _08122878 @ =gUnknown_845A474
	bl LoadCompressedObjectPic
	ldr r0, _0812287C @ =gUnknown_845A4EC
	bl LoadCompressedObjectPic
	ldr r0, _08122880 @ =gUnknown_845A47C
	bl LoadCompressedObjectPalette
	pop {r0}
	bx r0
	.align 2, 0
_08122878: .4byte gUnknown_845A474
_0812287C: .4byte gUnknown_845A4EC
_08122880: .4byte gUnknown_845A47C
	thumb_func_end sub_8122860

	thumb_func_start party_menu_status_condition_object
party_menu_status_condition_object: @ 8122884
	push {r4,r5,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _081228AC
	ldr r0, _081228B4 @ =gUnknown_845A584
	ldr r2, [r4, 0x4]
	ldrb r1, [r2, 0x4]
	ldrb r2, [r2, 0x5]
	movs r3, 0
	bl CreateSprite
	strb r0, [r4, 0xC]
	adds r0, r5, 0
	adds r1, r4, 0
	bl party_menu_get_status_condition_and_update_object
_081228AC:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_081228B4: .4byte gUnknown_845A584
	thumb_func_end party_menu_status_condition_object

	thumb_func_start party_menu_link_mon_status_condition_object
party_menu_link_mon_status_condition_object: @ 81228B8
	push {r4,r5,lr}
	adds r4, r2, 0
	lsls r0, 16
	lsls r1, 24
	lsrs r5, r1, 24
	cmp r0, 0
	beq _081228F4
	ldr r0, _081228FC @ =gUnknown_845A584
	ldr r2, [r4, 0x4]
	ldrb r1, [r2, 0x4]
	ldrb r2, [r2, 0x5]
	movs r3, 0
	bl CreateSprite
	strb r0, [r4, 0xC]
	adds r0, r5, 0
	adds r1, r4, 0
	bl party_menu_update_status_condition_object
	ldr r2, _08122900 @ =gSprites
	ldrb r0, [r4, 0xC]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrb r2, [r1, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	strb r0, [r1, 0x5]
_081228F4:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_081228FC: .4byte gUnknown_845A584
_08122900: .4byte gSprites
	thumb_func_end party_menu_link_mon_status_condition_object

	thumb_func_start party_menu_get_status_condition_and_update_object
party_menu_get_status_condition_and_update_object: @ 8122904
	push {r4,lr}
	adds r4, r1, 0
	bl sub_81208A4
	lsls r0, 24
	lsrs r0, 24
	adds r1, r4, 0
	bl party_menu_update_status_condition_object
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end party_menu_get_status_condition_and_update_object

	thumb_func_start party_menu_update_status_condition_object
party_menu_update_status_condition_object: @ 812291C
	push {r4,r5,lr}
	adds r5, r1, 0
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0
	beq _0812292C
	cmp r2, 0x6
	bne _08122948
_0812292C:
	ldr r2, _08122944 @ =gSprites
	ldrb r1, [r5, 0xC]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	b _08122972
	.align 2, 0
_08122944: .4byte gSprites
_08122948:
	ldrb r1, [r5, 0xC]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r4, _0812297C @ =gSprites
	adds r0, r4
	subs r1, r2, 0x1
	lsls r1, 24
	lsrs r1, 24
	bl StartSpriteAnim
	ldrb r1, [r5, 0xC]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	adds r0, 0x3E
	ldrb r2, [r0]
	movs r1, 0x5
	negs r1, r1
	ands r1, r2
_08122972:
	strb r1, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0812297C: .4byte gSprites
	thumb_func_end party_menu_update_status_condition_object

	thumb_func_start sub_8122980
sub_8122980: @ 8122980
	push {lr}
	ldr r0, _08122994 @ =gUnknown_845A574
	bl LoadCompressedObjectPic
	ldr r0, _08122998 @ =gUnknown_845A57C
	bl LoadCompressedObjectPalette
	pop {r0}
	bx r0
	.align 2, 0
_08122994: .4byte gUnknown_845A574
_08122998: .4byte gUnknown_845A57C
	thumb_func_end sub_8122980

	thumb_func_start sub_812299C
sub_812299C: @ 812299C
	push {r4,lr}
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r2, 24
	cmp r2, 0
	bne _081229B0
	bl sub_81229FC
	b _081229E8
_081229B0:
	ldr r4, _081229F0 @ =gUnknown_203B09C
	ldr r1, [r4]
	ldr r0, _081229F4 @ =gUnknown_845A760
	adds r0, r2, r0
	ldrb r0, [r0]
	strb r0, [r1, 0x17]
	movs r3, 0
	ldr r0, [r4]
	ldrb r0, [r0, 0x17]
	cmp r3, r0
	bcs _081229E8
	ldr r1, _081229F8 @ =gUnknown_845A72C
	lsls r0, r2, 2
	adds r2, r0, r1
_081229CC:
	ldr r1, [r4]
	adds r1, 0xF
	adds r1, r3
	ldr r0, [r2]
	adds r0, r3
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r0, [r4]
	ldrb r0, [r0, 0x17]
	cmp r3, r0
	bcc _081229CC
_081229E8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081229F0: .4byte gUnknown_203B09C
_081229F4: .4byte gUnknown_845A760
_081229F8: .4byte gUnknown_845A72C
	thumb_func_end sub_812299C

	thumb_func_start sub_81229FC
sub_81229FC: @ 81229FC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	mov r9, r0
	lsls r1, 24
	lsrs r1, 24
	mov r10, r1
	ldr r2, _08122A78 @ =gUnknown_203B09C
	ldr r1, [r2]
	movs r0, 0
	strb r0, [r1, 0x17]
	ldr r1, [r2]
	adds r0, r1, 0
	adds r0, 0xF
	adds r1, 0x17
	movs r2, 0
	bl AppendToList
	movs r7, 0
	ldr r0, _08122A7C @ =gUnknown_845A76E
	ldrh r0, [r0]
	str r0, [sp]
	mov r0, r9
	adds r0, 0x64
	str r0, [sp, 0x4]
_08122A34:
	movs r4, 0
	adds r1, r7, 0x1
	mov r8, r1
	ldr r0, [sp]
	cmp r0, 0xC
	beq _08122A90
	movs r0, 0x64
	mov r6, r10
	muls r6, r0
	ldr r5, _08122A7C @ =gUnknown_845A76E
_08122A48:
	mov r1, r9
	adds r0, r1, r6
	adds r1, r7, 0
	adds r1, 0xD
	bl GetMonData
	lsls r1, r4, 1
	adds r1, r5
	ldrh r1, [r1]
	cmp r0, r1
	bne _08122A80
	ldr r0, _08122A78 @ =gUnknown_203B09C
	ldr r1, [r0]
	adds r0, r1, 0
	adds r0, 0xF
	adds r1, 0x17
	adds r2, r4, 0
	adds r2, 0x12
	lsls r2, 24
	lsrs r2, 24
	bl AppendToList
	b _08122A90
	.align 2, 0
_08122A78: .4byte gUnknown_203B09C
_08122A7C: .4byte gUnknown_845A76E
_08122A80:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 1
	adds r0, r5
	ldrh r0, [r0]
	cmp r0, 0xC
	bne _08122A48
_08122A90:
	mov r1, r8
	lsls r0, r1, 24
	lsrs r7, r0, 24
	cmp r7, 0x3
	bls _08122A34
	ldr r0, [sp, 0x4]
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _08122AB6
	ldr r0, _08122AE8 @ =gUnknown_203B09C
	ldr r1, [r0]
	adds r0, r1, 0
	adds r0, 0xF
	adds r1, 0x17
	movs r2, 0x1
	bl AppendToList
_08122AB6:
	movs r0, 0x64
	mov r1, r10
	muls r1, r0
	adds r0, r1, 0
	add r0, r9
	movs r1, 0xC
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	bl itemid_is_mail
	lsls r0, 24
	cmp r0, 0
	beq _08122AEC
	ldr r0, _08122AE8 @ =gUnknown_203B09C
	ldr r1, [r0]
	adds r0, r1, 0
	adds r0, 0xF
	adds r1, 0x17
	movs r2, 0x6
	bl AppendToList
	b _08122AFC
	.align 2, 0
_08122AE8: .4byte gUnknown_203B09C
_08122AEC:
	ldr r0, _08122B1C @ =gUnknown_203B09C
	ldr r1, [r0]
	adds r0, r1, 0
	adds r0, 0xF
	adds r1, 0x17
	movs r2, 0x3
	bl AppendToList
_08122AFC:
	ldr r0, _08122B1C @ =gUnknown_203B09C
	ldr r1, [r0]
	adds r0, r1, 0
	adds r0, 0xF
	adds r1, 0x17
	movs r2, 0x2
	bl AppendToList
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08122B1C: .4byte gUnknown_203B09C
	thumb_func_end sub_81229FC

	thumb_func_start sub_8122B20
sub_8122B20: @ 8122B20
	push {lr}
	adds r2, r0, 0
	ldr r1, _08122B3C @ =gUnknown_203B0A0
	ldrb r0, [r1, 0x8]
	lsls r0, 28
	lsrs r0, 28
	adds r3, r1, 0
	cmp r0, 0xA
	bhi _08122BCA
	lsls r0, 2
	ldr r1, _08122B40 @ =_08122B44
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08122B3C: .4byte gUnknown_203B0A0
_08122B40: .4byte _08122B44
	.align 2, 0
_08122B44:
	.4byte _08122B70
	.4byte _08122B80
	.4byte _08122BCA
	.4byte _08122BCA
	.4byte _08122B8C
	.4byte _08122BCA
	.4byte _08122BAC
	.4byte _08122BCA
	.4byte _08122BBE
	.4byte _08122BC2
	.4byte _08122BC6
_08122B70:
	adds r0, r2, 0
	movs r1, 0x2D
	bl GetMonData
	negs r1, r0
	orrs r1, r0
	lsrs r1, 31
	b _08122BCC
_08122B80:
	adds r0, r2, 0
	bl sub_8127A84
	lsls r0, 24
	lsrs r1, r0, 24
	b _08122BCC
_08122B8C:
	movs r0, 0x9
	ldrsb r0, [r3, r0]
	bl sub_8127510
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _08122BA4
	cmp r0, 0x1
	beq _08122BA8
	movs r1, 0x7
	b _08122BCC
_08122BA4:
	movs r1, 0x4
	b _08122BCC
_08122BA8:
	movs r1, 0x5
	b _08122BCC
_08122BAC:
	adds r0, r2, 0
	movs r1, 0x2D
	bl GetMonData
	movs r1, 0x6
	cmp r0, 0
	beq _08122BCC
	movs r1, 0x7
	b _08122BCC
_08122BBE:
	movs r1, 0xA
	b _08122BCC
_08122BC2:
	movs r1, 0xB
	b _08122BCC
_08122BC6:
	movs r1, 0xC
	b _08122BCC
_08122BCA:
	movs r1, 0
_08122BCC:
	adds r0, r1, 0
	pop {r1}
	bx r1
	thumb_func_end sub_8122B20

	thumb_func_start sub_8122BD4
sub_8122BD4: @ 8122BD4
	push {r4-r6,lr}
	ldr r5, _08122C20 @ =gUnknown_203B0A0
	movs r1, 0x9
	ldrsb r1, [r5, r1]
	movs r0, 0x64
	adds r4, r1, 0
	muls r4, r0
	ldr r6, _08122C24 @ =gPlayerParty
	adds r4, r6
	ldr r1, _08122C28 @ =gStringVar1
	adds r0, r4, 0
	bl GetMonNickname
	ldr r0, _08122C2C @ =gUnknown_203B09C
	ldr r0, [r0]
	adds r0, 0xD
	bl sub_8121CE4
	ldrb r5, [r5, 0x9]
	adds r0, r4, 0
	bl sub_8122B20
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r6, 0
	adds r1, r5, 0
	bl sub_812299C
	movs r0, 0
	bl sub_8121E5C
	movs r0, 0x16
	bl sub_8121D0C
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08122C20: .4byte gUnknown_203B0A0
_08122C24: .4byte gPlayerParty
_08122C28: .4byte gStringVar1
_08122C2C: .4byte gUnknown_203B09C
	thumb_func_end sub_8122BD4

	thumb_func_start sub_8122C30
sub_8122C30: @ 8122C30
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_8122BD4
	ldr r1, _08122C54 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	movs r1, 0xFF
	strh r1, [r0, 0x8]
	ldr r1, _08122C58 @ =sub_8122C5C
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08122C54: .4byte gTasks
_08122C58: .4byte sub_8122C5C
	thumb_func_end sub_8122C30

	thumb_func_start sub_8122C5C
sub_8122C5C: @ 8122C5C
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r0, _08122C94 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08122D3E
	bl sub_80BF748
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08122D3E
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	ldr r1, _08122C98 @ =gTasks+0x8
	adds r7, r0, r1
	ldr r0, _08122C9C @ =gUnknown_203B09C
	ldr r0, [r0]
	ldrb r0, [r0, 0x17]
	cmp r0, 0x3
	bhi _08122CA0
	bl ProcessMenuInputNoWrapAround_other
	b _08122CA4
	.align 2, 0
_08122C94: .4byte gPaletteFade
_08122C98: .4byte gTasks+0x8
_08122C9C: .4byte gUnknown_203B09C
_08122CA0:
	bl ProcessMenuInput_other
_08122CA4:
	lsls r0, 24
	lsrs r5, r0, 24
	movs r0, 0
	ldrsh r4, [r7, r0]
	bl GetMenuCursorPos
	lsls r0, 24
	lsrs r0, 24
	cmp r4, r0
	beq _08122CCE
	ldr r0, _08122D14 @ =gUnknown_203B09C
	ldr r4, [r0]
	bl GetMenuCursorPos
	lsls r0, 24
	lsrs r0, 24
	adds r4, 0xF
	adds r4, r0
	ldrb r0, [r4]
	bl sub_8122138
_08122CCE:
	bl GetMenuCursorPos
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r7]
	lsls r0, r5, 24
	asrs r5, r0, 24
	movs r0, 0x2
	negs r0, r0
	cmp r5, r0
	beq _08122D3E
	adds r0, 0x1
	cmp r5, r0
	bne _08122D1C
	movs r0, 0x5
	bl PlaySE
	ldr r4, _08122D14 @ =gUnknown_203B09C
	ldr r0, [r4]
	adds r0, 0xE
	bl sub_8121CE4
	ldr r2, _08122D18 @ =gUnknown_845A618
	ldr r0, [r4]
	ldrb r1, [r0, 0x17]
	adds r0, r1
	ldrb r0, [r0, 0xE]
	lsls r0, 3
	adds r2, 0x4
	adds r0, r2
	ldr r1, [r0]
	adds r0, r6, 0
	bl _call_via_r1
	b _08122D3E
	.align 2, 0
_08122D14: .4byte gUnknown_203B09C
_08122D18: .4byte gUnknown_845A618
_08122D1C:
	ldr r4, _08122D44 @ =gUnknown_203B09C
	ldr r0, [r4]
	adds r0, 0xE
	bl sub_8121CE4
	ldr r1, _08122D48 @ =gUnknown_845A618
	ldr r0, [r4]
	adds r0, 0xF
	adds r0, r5
	ldrb r0, [r0]
	lsls r0, 3
	adds r1, 0x4
	adds r0, r1
	ldr r1, [r0]
	adds r0, r6, 0
	bl _call_via_r1
_08122D3E:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08122D44: .4byte gUnknown_203B09C
_08122D48: .4byte gUnknown_845A618
	thumb_func_end sub_8122C5C

	thumb_func_start sub_8122D4C
sub_8122D4C: @ 8122D4C
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x5
	bl PlaySE
	ldr r0, _08122D70 @ =gUnknown_203B09C
	ldr r1, [r0]
	ldr r0, _08122D74 @ =sub_8122D78
	str r0, [r1, 0x4]
	adds r0, r4, 0
	bl sub_811FA78
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08122D70: .4byte gUnknown_203B09C
_08122D74: .4byte sub_8122D78
	thumb_func_end sub_8122D4C

	thumb_func_start sub_8122D78
sub_8122D78: @ 8122D78
	push {r4,lr}
	sub sp, 0x4
	ldr r4, _08122DAC @ =gUnknown_203B0A0
	ldrb r1, [r4, 0x8]
	movs r0, 0xF
	ands r0, r1
	cmp r0, 0x1
	bne _08122D8C
	bl pokemon_change_order
_08122D8C:
	ldr r0, _08122DB0 @ =gPlayerParty
	ldrb r1, [r4, 0x9]
	ldr r2, _08122DB4 @ =gPlayerPartyCount
	ldrb r2, [r2]
	subs r2, 0x1
	lsls r2, 24
	lsrs r2, 24
	ldr r3, _08122DB8 @ =sub_8122DBC
	movs r4, 0
	str r4, [sp]
	bl sub_81344F8
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08122DAC: .4byte gUnknown_203B0A0
_08122DB0: .4byte gPlayerParty
_08122DB4: .4byte gPlayerPartyCount
_08122DB8: .4byte sub_8122DBC
	thumb_func_end sub_8122D78

	thumb_func_start sub_8122DBC
sub_8122DBC: @ 8122DBC
	push {lr}
	sub sp, 0xC
	ldr r2, _08122DF4 @ =gPaletteFade
	ldrb r0, [r2, 0x8]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2, 0x8]
	bl sub_8138B20
	ldr r3, _08122DF8 @ =gUnknown_203B0A0
	strb r0, [r3, 0x9]
	ldrb r0, [r3, 0x8]
	lsls r0, 28
	lsrs r0, 28
	ldrb r2, [r3, 0xB]
	movs r1, 0x16
	str r1, [sp]
	ldr r1, _08122DFC @ =sub_8122C30
	str r1, [sp, 0x4]
	ldr r1, [r3]
	str r1, [sp, 0x8]
	movs r1, 0xFF
	movs r3, 0x1
	bl sub_811EA44
	add sp, 0xC
	pop {r0}
	bx r0
	.align 2, 0
_08122DF4: .4byte gPaletteFade
_08122DF8: .4byte gUnknown_203B0A0
_08122DFC: .4byte sub_8122C30
	thumb_func_end sub_8122DBC

	thumb_func_start brm_switch
brm_switch: @ 8122E00
	push {r4-r6,lr}
	adds r6, r0, 0
	lsls r6, 24
	lsrs r6, 24
	movs r0, 0x5
	bl PlaySE
	ldr r5, _08122E4C @ =gUnknown_203B0A0
	movs r0, 0x8
	strb r0, [r5, 0xB]
	ldr r4, _08122E50 @ =gUnknown_203B09C
	ldr r0, [r4]
	adds r0, 0xD
	bl sub_8121CE4
	ldr r0, [r4]
	adds r0, 0xC
	bl sub_8121CE4
	movs r0, 0x3
	bl sub_8121D0C
	ldrb r0, [r5, 0x9]
	movs r1, 0x1
	bl sub_811F818
	ldrb r0, [r5, 0x9]
	strb r0, [r5, 0xA]
	ldr r1, _08122E54 @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r0, r1
	ldr r1, _08122E58 @ =sub_811FB28
	str r1, [r0]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08122E4C: .4byte gUnknown_203B0A0
_08122E50: .4byte gUnknown_203B09C
_08122E54: .4byte gTasks
_08122E58: .4byte sub_811FB28
	thumb_func_end brm_switch

	thumb_func_start sub_8122E5C
sub_8122E5C: @ 8122E5C
	push {r4-r7,lr}
	sub sp, 0xC
	lsls r0, 24
	lsrs r7, r0, 24
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	ldr r1, _08122E84 @ =gTasks+0x8
	adds r6, r0, r1
	ldr r4, _08122E88 @ =gUnknown_203B0A0
	movs r1, 0xA
	ldrsb r1, [r4, r1]
	movs r0, 0x9
	ldrsb r0, [r4, r0]
	cmp r1, r0
	bne _08122E8C
	adds r0, r7, 0
	bl sub_81235E8
	b _08122FE2
	.align 2, 0
_08122E84: .4byte gTasks+0x8
_08122E88: .4byte gUnknown_203B0A0
_08122E8C:
	bl sub_812358C
	add r2, sp, 0x8
	movs r0, 0x9
	ldrsb r0, [r4, r0]
	ldr r1, _08122EE8 @ =gUnknown_203B0B4
	ldr r1, [r1]
	lsls r0, 4
	adds r0, r1
	ldrb r0, [r0, 0x8]
	movs r4, 0
	strb r0, [r2]
	adds r0, r2, 0
	ldrb r0, [r0]
	movs r1, 0x1
	bl GetWindowAttribute
	strh r0, [r6]
	add r0, sp, 0x8
	ldrb r0, [r0]
	movs r1, 0x2
	bl GetWindowAttribute
	strh r0, [r6, 0x2]
	add r0, sp, 0x8
	ldrb r0, [r0]
	movs r1, 0x3
	bl GetWindowAttribute
	strh r0, [r6, 0x4]
	add r0, sp, 0x8
	ldrb r0, [r0]
	movs r1, 0x4
	bl GetWindowAttribute
	strh r0, [r6, 0x6]
	strh r4, [r6, 0x10]
	movs r1, 0x4
	ldrsh r0, [r6, r1]
	cmp r0, 0xA
	bne _08122EEC
	movs r2, 0x1
	negs r2, r2
	adds r0, r2, 0
	b _08122EEE
	.align 2, 0
_08122EE8: .4byte gUnknown_203B0B4
_08122EEC:
	movs r0, 0x1
_08122EEE:
	strh r0, [r6, 0x14]
	add r2, sp, 0x8
	ldr r0, _08122F4C @ =gUnknown_203B0A0
	ldrb r0, [r0, 0xA]
	lsls r0, 24
	asrs r0, 24
	ldr r1, _08122F50 @ =gUnknown_203B0B4
	ldr r1, [r1]
	lsls r0, 4
	adds r0, r1
	ldrb r0, [r0, 0x8]
	movs r4, 0
	strb r0, [r2, 0x1]
	adds r0, r2, 0
	ldrb r0, [r0, 0x1]
	movs r1, 0x1
	bl GetWindowAttribute
	strh r0, [r6, 0x8]
	add r0, sp, 0x8
	ldrb r0, [r0, 0x1]
	movs r1, 0x2
	bl GetWindowAttribute
	strh r0, [r6, 0xA]
	add r0, sp, 0x8
	ldrb r0, [r0, 0x1]
	movs r1, 0x3
	bl GetWindowAttribute
	strh r0, [r6, 0xC]
	add r0, sp, 0x8
	ldrb r0, [r0, 0x1]
	movs r1, 0x4
	bl GetWindowAttribute
	strh r0, [r6, 0xE]
	strh r4, [r6, 0x12]
	movs r1, 0xC
	ldrsh r0, [r6, r1]
	cmp r0, 0xA
	bne _08122F54
	movs r2, 0x1
	negs r2, r2
	adds r0, r2, 0
	b _08122F56
	.align 2, 0
_08122F4C: .4byte gUnknown_203B0A0
_08122F50: .4byte gUnknown_203B0B4
_08122F54:
	movs r0, 0x1
_08122F56:
	strh r0, [r6, 0x16]
	ldr r4, _08122FEC @ =gUnknown_203B0C8
	movs r0, 0x4
	ldrsh r1, [r6, r0]
	movs r2, 0x6
	ldrsh r0, [r6, r2]
	lsls r0, 1
	muls r0, r1
	bl Alloc
	str r0, [r4]
	ldr r5, _08122FF0 @ =gUnknown_203B0CC
	movs r0, 0xC
	ldrsh r1, [r6, r0]
	movs r2, 0xE
	ldrsh r0, [r6, r2]
	lsls r0, 1
	muls r0, r1
	bl Alloc
	str r0, [r5]
	ldr r1, [r4]
	ldrb r2, [r6]
	ldrb r3, [r6, 0x2]
	ldrb r0, [r6, 0x4]
	str r0, [sp]
	ldrb r0, [r6, 0x6]
	str r0, [sp, 0x4]
	movs r0, 0
	bl sub_80F6B94
	ldr r1, [r5]
	ldrb r2, [r6, 0x8]
	ldrb r3, [r6, 0xA]
	ldrb r0, [r6, 0xC]
	str r0, [sp]
	ldrb r0, [r6, 0xE]
	str r0, [sp, 0x4]
	movs r0, 0
	bl sub_80F6B94
	add r0, sp, 0x8
	ldrb r0, [r0]
	bl ClearWindowTilemap
	add r0, sp, 0x8
	ldrb r0, [r0, 0x1]
	bl ClearWindowTilemap
	ldr r4, _08122FF4 @ =gUnknown_203B0A0
	movs r0, 0x9
	strb r0, [r4, 0xB]
	ldrb r0, [r4, 0x9]
	movs r1, 0x1
	bl sub_811F818
	ldrb r0, [r4, 0xA]
	movs r1, 0x1
	bl sub_811F818
	adds r0, r7, 0
	bl sub_81231E8
	ldr r1, _08122FF8 @ =gTasks
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r1
	ldr r1, _08122FFC @ =sub_8123270
	str r1, [r0]
_08122FE2:
	add sp, 0xC
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08122FEC: .4byte gUnknown_203B0C8
_08122FF0: .4byte gUnknown_203B0CC
_08122FF4: .4byte gUnknown_203B0A0
_08122FF8: .4byte gTasks
_08122FFC: .4byte sub_8123270
	thumb_func_end sub_8122E5C

	thumb_func_start sub_8123000
sub_8123000: @ 8123000
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r6, r2, 0
	mov r12, r3
	ldr r7, [sp, 0x18]
	lsls r0, 16
	lsrs r3, r0, 16
	adds r5, r3, 0
	lsls r1, 16
	lsrs r2, r1, 16
	mov r8, r2
	lsls r0, r3, 16
	asrs r1, r0, 16
	lsls r0, r2, 16
	asrs r0, 16
	adds r4, r1, r0
	cmp r4, 0
	blt _0812302A
	cmp r1, 0x1F
	ble _0812302E
_0812302A:
	movs r0, 0
	b _0812305C
_0812302E:
	cmp r1, 0
	bge _08123042
	negs r0, r1
	strb r0, [r6]
	movs r0, 0
	mov r1, r12
	strb r0, [r1]
	adds r0, r2, r3
	strb r0, [r7]
	b _0812305A
_08123042:
	movs r0, 0
	strb r0, [r6]
	mov r0, r12
	strb r5, [r0]
	cmp r4, 0x1F
	ble _08123056
	movs r0, 0x20
	subs r0, r5
	strb r0, [r7]
	b _0812305A
_08123056:
	mov r1, r8
	strb r1, [r7]
_0812305A:
	movs r0, 0x1
_0812305C:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8123000

	thumb_func_start sub_8123068
sub_8123068: @ 8123068
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x34
	str r0, [sp, 0x28]
	ldr r0, [sp, 0x54]
	ldr r4, [sp, 0x58]
	lsls r2, 16
	lsrs r2, 16
	mov r9, r2
	lsls r3, 16
	lsls r0, 16
	lsrs r0, 16
	mov r10, r0
	lsls r4, 16
	lsrs r4, 16
	str r4, [sp, 0x30]
	lsls r1, 16
	asrs r7, r1, 16
	lsrs r0, r3, 16
	str r0, [sp, 0x2C]
	asrs r3, 16
	mov r8, r3
	mov r5, sp
	adds r5, 0x25
	mov r6, sp
	adds r6, 0x26
	str r6, [sp]
	adds r0, r7, 0
	mov r1, r8
	add r2, sp, 0x24
	adds r3, r5, 0
	bl sub_8123000
	lsls r0, 24
	cmp r0, 0
	beq _08123122
	ldrb r2, [r5]
	mov r1, r9
	lsls r0, r1, 24
	lsrs r0, 24
	mov r9, r0
	ldrb r0, [r6]
	str r0, [sp]
	mov r1, r10
	lsls r0, r1, 24
	lsrs r4, r0, 24
	str r4, [sp, 0x4]
	movs r0, 0
	movs r1, 0
	mov r3, r9
	bl FillBgTilemapBufferRect_Palette0
	ldr r1, [sp, 0x30]
	lsls r0, r1, 16
	asrs r0, 16
	adds r0, r7, r0
	lsls r0, 16
	asrs r0, 16
	str r6, [sp]
	mov r1, r8
	add r2, sp, 0x24
	adds r3, r5, 0
	bl sub_8123000
	lsls r0, 24
	cmp r0, 0
	beq _08123122
	add r0, sp, 0x24
	ldrb r2, [r0]
	ldr r1, [sp, 0x2C]
	lsls r0, r1, 24
	lsrs r0, 24
	str r0, [sp]
	str r4, [sp, 0x4]
	ldrb r0, [r5]
	str r0, [sp, 0x8]
	mov r0, r9
	str r0, [sp, 0xC]
	ldrb r0, [r6]
	str r0, [sp, 0x10]
	str r4, [sp, 0x14]
	movs r0, 0x11
	str r0, [sp, 0x18]
	movs r0, 0
	str r0, [sp, 0x1C]
	str r0, [sp, 0x20]
	ldr r1, [sp, 0x28]
	movs r3, 0
	bl CopyRectToBgTilemapBufferRect
_08123122:
	add sp, 0x34
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8123068

	thumb_func_start sub_8123134
sub_8123134: @ 8123134
	push {r4,lr}
	ldr r4, _08123184 @ =gSprites
	ldrb r2, [r0, 0xB]
	lsls r3, r2, 4
	adds r3, r2
	lsls r3, 2
	adds r3, r4
	lsls r1, 16
	asrs r1, 13
	ldrh r2, [r3, 0x24]
	adds r2, r1
	strh r2, [r3, 0x24]
	ldrb r3, [r0, 0xA]
	lsls r2, r3, 4
	adds r2, r3
	lsls r2, 2
	adds r2, r4
	ldrh r3, [r2, 0x24]
	adds r3, r1
	strh r3, [r2, 0x24]
	ldrb r3, [r0, 0x9]
	lsls r2, r3, 4
	adds r2, r3
	lsls r2, 2
	adds r2, r4
	ldrh r3, [r2, 0x24]
	adds r3, r1
	strh r3, [r2, 0x24]
	ldrb r2, [r0, 0xC]
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r4
	ldrh r2, [r0, 0x24]
	adds r2, r1
	strh r2, [r0, 0x24]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08123184: .4byte gSprites
	thumb_func_end sub_8123134

	thumb_func_start sub_8123188
sub_8123188: @ 8123188
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _081231DC @ =gTasks+0x8
	adds r4, r1, r0
	movs r1, 0x14
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _081231B6
	ldr r2, _081231E0 @ =gUnknown_203B0B4
	ldr r0, _081231E4 @ =gUnknown_203B0A0
	movs r1, 0x9
	ldrsb r1, [r0, r1]
	lsls r1, 4
	ldr r0, [r2]
	adds r0, r1
	movs r2, 0x14
	ldrsh r1, [r4, r2]
	bl sub_8123134
_081231B6:
	movs r1, 0x16
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _081231D4
	ldr r2, _081231E0 @ =gUnknown_203B0B4
	ldr r0, _081231E4 @ =gUnknown_203B0A0
	movs r1, 0xA
	ldrsb r1, [r0, r1]
	lsls r1, 4
	ldr r0, [r2]
	adds r0, r1
	movs r2, 0x16
	ldrsh r1, [r4, r2]
	bl sub_8123134
_081231D4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081231DC: .4byte gTasks+0x8
_081231E0: .4byte gUnknown_203B0B4
_081231E4: .4byte gUnknown_203B0A0
	thumb_func_end sub_8123188

	thumb_func_start sub_81231E8
sub_81231E8: @ 81231E8
	push {r4-r6,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _08123264 @ =gTasks+0x8
	adds r5, r1, r0
	movs r1, 0x14
	ldrsh r0, [r5, r1]
	cmp r0, 0
	beq _08123228
	ldr r0, _08123268 @ =gUnknown_203B0C8
	ldr r0, [r0]
	ldrh r1, [r5, 0x10]
	ldrh r2, [r5]
	adds r1, r2
	lsls r1, 16
	asrs r1, 16
	movs r3, 0x2
	ldrsh r2, [r5, r3]
	movs r4, 0x4
	ldrsh r3, [r5, r4]
	movs r6, 0x6
	ldrsh r4, [r5, r6]
	str r4, [sp]
	movs r6, 0x14
	ldrsh r4, [r5, r6]
	str r4, [sp, 0x4]
	bl sub_8123068
_08123228:
	movs r1, 0x16
	ldrsh r0, [r5, r1]
	cmp r0, 0
	beq _08123256
	ldr r0, _0812326C @ =gUnknown_203B0CC
	ldr r0, [r0]
	ldrh r1, [r5, 0x12]
	ldrh r2, [r5, 0x8]
	adds r1, r2
	lsls r1, 16
	asrs r1, 16
	movs r3, 0xA
	ldrsh r2, [r5, r3]
	movs r4, 0xC
	ldrsh r3, [r5, r4]
	movs r6, 0xE
	ldrsh r4, [r5, r6]
	str r4, [sp]
	movs r6, 0x16
	ldrsh r4, [r5, r6]
	str r4, [sp, 0x4]
	bl sub_8123068
_08123256:
	movs r0, 0
	bl schedule_bg_copy_tilemap_to_vram
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08123264: .4byte gTasks+0x8
_08123268: .4byte gUnknown_203B0C8
_0812326C: .4byte gUnknown_203B0CC
	thumb_func_end sub_81231E8

	thumb_func_start sub_8123270
sub_8123270: @ 8123270
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0xC
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r7, r0, 3
	ldr r0, _08123370 @ =gTasks+0x8
	mov r8, r0
	adds r6, r7, r0
	adds r0, r4, 0
	bl sub_81231E8
	adds r0, r4, 0
	bl sub_8123188
	ldrh r1, [r6, 0x14]
	ldrh r2, [r6, 0x10]
	adds r1, r2
	strh r1, [r6, 0x10]
	ldrh r0, [r6, 0x16]
	ldrh r3, [r6, 0x12]
	adds r0, r3
	strh r0, [r6, 0x12]
	add r2, sp, 0x8
	ldrh r0, [r6]
	adds r0, r1
	strh r0, [r2]
	adds r1, r2, 0
	ldrh r0, [r6, 0x12]
	ldrh r3, [r6, 0x8]
	adds r2, r0, r3
	strh r2, [r1, 0x2]
	adds r0, r1, 0
	ldrh r0, [r0]
	cmp r0, 0x21
	bls _08123362
	lsls r0, r2, 16
	lsrs r0, 16
	cmp r0, 0x21
	bls _08123362
	movs r1, 0x14
	ldrsh r0, [r6, r1]
	negs r0, r0
	strh r0, [r6, 0x14]
	movs r2, 0x16
	ldrsh r0, [r6, r2]
	negs r0, r0
	strh r0, [r6, 0x16]
	bl swap_pokemon_and_oams
	ldr r4, _08123374 @ =gUnknown_203B0A0
	ldrb r0, [r4, 0x9]
	bl sub_811F234
	ldrb r0, [r4, 0xA]
	bl sub_811F234
	movs r0, 0x9
	ldrsb r0, [r4, r0]
	ldr r5, _08123378 @ =gUnknown_203B0B4
	ldr r1, [r5]
	lsls r0, 4
	adds r0, r1
	ldrb r0, [r0, 0x8]
	bl PutWindowTilemap
	movs r0, 0xA
	ldrsb r0, [r4, r0]
	ldr r1, [r5]
	lsls r0, 4
	adds r0, r1
	ldrb r0, [r0, 0x8]
	bl PutWindowTilemap
	ldr r0, _0812337C @ =gUnknown_203B0C8
	ldr r1, [r0]
	ldrb r2, [r6]
	ldrb r3, [r6, 0x2]
	ldrb r0, [r6, 0x4]
	str r0, [sp]
	ldrb r0, [r6, 0x6]
	str r0, [sp, 0x4]
	movs r0, 0
	bl sub_80F6B94
	ldr r0, _08123380 @ =gUnknown_203B0CC
	ldr r1, [r0]
	ldrb r2, [r6, 0x8]
	ldrb r3, [r6, 0xA]
	ldrb r0, [r6, 0xC]
	str r0, [sp]
	ldrb r0, [r6, 0xE]
	str r0, [sp, 0x4]
	movs r0, 0
	bl sub_80F6B94
	movs r0, 0x9
	ldrsb r0, [r4, r0]
	ldr r1, [r5]
	lsls r0, 4
	adds r0, r1
	ldrb r0, [r0, 0x8]
	bl ClearWindowTilemap
	movs r0, 0xA
	ldrsb r0, [r4, r0]
	ldr r1, [r5]
	lsls r0, 4
	adds r0, r1
	ldrb r0, [r0, 0x8]
	bl ClearWindowTilemap
	mov r0, r8
	subs r0, 0x8
	adds r0, r7, r0
	ldr r1, _08123384 @ =sub_8123388
	str r1, [r0]
_08123362:
	add sp, 0xC
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08123370: .4byte gTasks+0x8
_08123374: .4byte gUnknown_203B0A0
_08123378: .4byte gUnknown_203B0B4
_0812337C: .4byte gUnknown_203B0C8
_08123380: .4byte gUnknown_203B0CC
_08123384: .4byte sub_8123388
	thumb_func_end sub_8123270

	thumb_func_start sub_8123388
sub_8123388: @ 8123388
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	ldr r1, _081233E8 @ =gTasks+0x8
	adds r4, r0, r1
	adds r0, r6, 0
	bl sub_81231E8
	adds r0, r6, 0
	bl sub_8123188
	movs r1, 0x14
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _081233F4
	movs r2, 0x16
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bne _081233F4
	ldr r5, _081233EC @ =gUnknown_203B0A0
	movs r0, 0x9
	ldrsb r0, [r5, r0]
	ldr r4, _081233F0 @ =gUnknown_203B0B4
	ldr r1, [r4]
	lsls r0, 4
	adds r0, r1
	ldrb r0, [r0, 0x8]
	bl PutWindowTilemap
	movs r0, 0xA
	ldrsb r0, [r5, r0]
	ldr r1, [r4]
	lsls r0, 4
	adds r0, r1
	ldrb r0, [r0, 0x8]
	bl PutWindowTilemap
	movs r0, 0
	bl schedule_bg_copy_tilemap_to_vram
	adds r0, r6, 0
	bl sub_81235E8
	b _08123418
	.align 2, 0
_081233E8: .4byte gTasks+0x8
_081233EC: .4byte gUnknown_203B0A0
_081233F0: .4byte gUnknown_203B0B4
_081233F4:
	ldrh r1, [r4, 0x14]
	ldrh r0, [r4, 0x10]
	adds r1, r0
	strh r1, [r4, 0x10]
	ldrh r0, [r4, 0x16]
	ldrh r2, [r4, 0x12]
	adds r0, r2
	strh r0, [r4, 0x12]
	lsls r1, 16
	asrs r1, 16
	cmp r1, 0
	bne _0812340E
	strh r1, [r4, 0x14]
_0812340E:
	movs r1, 0x12
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _08123418
	strh r0, [r4, 0x16]
_08123418:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8123388

	thumb_func_start oamt_swap_pos
oamt_swap_pos: @ 8123420
	push {r4-r6,lr}
	mov r6, r10
	mov r5, r9
	mov r4, r8
	push {r4-r6}
	ldrb r3, [r0]
	ldrb r2, [r1]
	strb r2, [r0]
	strb r3, [r1]
	ldr r5, _081234E8 @ =gSprites
	ldrb r2, [r0]
	lsls r3, r2, 4
	adds r3, r2
	lsls r3, 2
	adds r3, r5
	ldrh r6, [r3, 0x20]
	ldrh r2, [r3, 0x22]
	mov r8, r2
	ldrh r2, [r3, 0x24]
	mov r9, r2
	ldrh r2, [r3, 0x26]
	mov r10, r2
	ldrb r4, [r1]
	lsls r2, r4, 4
	adds r2, r4
	lsls r2, 2
	adds r2, r5
	ldrh r2, [r2, 0x20]
	strh r2, [r3, 0x20]
	ldrb r2, [r0]
	lsls r3, r2, 4
	adds r3, r2
	lsls r3, 2
	adds r3, r5
	ldrb r4, [r1]
	lsls r2, r4, 4
	adds r2, r4
	lsls r2, 2
	adds r2, r5
	ldrh r2, [r2, 0x22]
	strh r2, [r3, 0x22]
	ldrb r2, [r0]
	lsls r3, r2, 4
	adds r3, r2
	lsls r3, 2
	adds r3, r5
	ldrb r4, [r1]
	lsls r2, r4, 4
	adds r2, r4
	lsls r2, 2
	adds r2, r5
	ldrh r2, [r2, 0x24]
	strh r2, [r3, 0x24]
	ldrb r0, [r0]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r5
	ldrb r3, [r1]
	lsls r0, r3, 4
	adds r0, r3
	lsls r0, 2
	adds r0, r5
	ldrh r0, [r0, 0x26]
	strh r0, [r2, 0x26]
	ldrb r2, [r1]
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r5
	strh r6, [r0, 0x20]
	ldrb r2, [r1]
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r5
	mov r2, r8
	strh r2, [r0, 0x22]
	ldrb r2, [r1]
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r5
	mov r2, r9
	strh r2, [r0, 0x24]
	ldrb r1, [r1]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	mov r1, r10
	strh r1, [r0, 0x26]
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081234E8: .4byte gSprites
	thumb_func_end oamt_swap_pos

	thumb_func_start swap_pokemon_and_oams
swap_pokemon_and_oams: @ 81234EC
	push {r4-r6,lr}
	sub sp, 0x8
	ldr r1, _08123580 @ =gUnknown_203B0B4
	ldr r2, _08123584 @ =gUnknown_203B0A0
	movs r3, 0x9
	ldrsb r3, [r2, r3]
	lsls r0, r3, 4
	ldr r1, [r1]
	adds r0, r1, r0
	str r0, [sp]
	ldrb r2, [r2, 0xA]
	lsls r2, 24
	asrs r2, 24
	lsls r0, r2, 4
	adds r0, r1, r0
	str r0, [sp, 0x4]
	movs r1, 0x64
	adds r4, r3, 0
	muls r4, r1
	ldr r0, _08123588 @ =gPlayerParty
	adds r4, r0
	adds r5, r2, 0
	muls r5, r1
	adds r5, r0
	movs r0, 0x64
	bl Alloc
	adds r6, r0, 0
	adds r1, r4, 0
	movs r2, 0x64
	bl memcpy
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x64
	bl memcpy
	adds r0, r5, 0
	adds r1, r6, 0
	movs r2, 0x64
	bl memcpy
	adds r0, r6, 0
	bl Free
	ldr r0, [sp]
	adds r0, 0xB
	ldr r1, [sp, 0x4]
	adds r1, 0xB
	bl oamt_swap_pos
	ldr r0, [sp]
	adds r0, 0xA
	ldr r1, [sp, 0x4]
	adds r1, 0xA
	bl oamt_swap_pos
	ldr r0, [sp]
	adds r0, 0x9
	ldr r1, [sp, 0x4]
	adds r1, 0x9
	bl oamt_swap_pos
	ldr r0, [sp]
	adds r0, 0xC
	ldr r1, [sp, 0x4]
	adds r1, 0xC
	bl oamt_swap_pos
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08123580: .4byte gUnknown_203B0B4
_08123584: .4byte gUnknown_203B0A0
_08123588: .4byte gPlayerParty
	thumb_func_end swap_pokemon_and_oams

	thumb_func_start sub_812358C
sub_812358C: @ 812358C
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	movs r0, 0x4
	bl Alloc
	adds r4, r0, 0
	ldr r0, _081235E0 @ =gUnknown_203B0A0
	mov r8, r0
	ldrb r0, [r0, 0x9]
	lsls r0, 24
	asrs r0, 24
	movs r6, 0x64
	muls r0, r6
	ldr r5, _081235E4 @ =gPlayerParty
	adds r0, r5
	movs r1, 0x41
	bl GetMonData
	strh r0, [r4]
	mov r1, r8
	movs r0, 0xA
	ldrsb r0, [r1, r0]
	muls r0, r6
	adds r0, r5
	movs r1, 0x41
	bl GetMonData
	strh r0, [r4, 0x2]
	movs r0, 0x3
	adds r1, r4, 0
	bl sub_8113550
	adds r0, r4, 0
	bl Free
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081235E0: .4byte gUnknown_203B0A0
_081235E4: .4byte gPlayerParty
	thumb_func_end sub_812358C

	thumb_func_start sub_81235E8
sub_81235E8: @ 81235E8
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldr r0, _08123630 @ =gUnknown_203B09C
	ldr r0, [r0]
	adds r0, 0xD
	bl sub_8121CE4
	ldr r4, _08123634 @ =gUnknown_203B0A0
	movs r0, 0
	strb r0, [r4, 0xB]
	ldrb r0, [r4, 0x9]
	movs r1, 0
	bl sub_811F818
	ldrb r0, [r4, 0xA]
	strb r0, [r4, 0x9]
	ldrb r0, [r4, 0xA]
	movs r1, 0x1
	bl sub_811F818
	movs r0, 0
	bl sub_8121D0C
	ldr r1, _08123638 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldr r1, _0812363C @ =sub_811FB28
	str r1, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08123630: .4byte gUnknown_203B09C
_08123634: .4byte gUnknown_203B0A0
_08123638: .4byte gTasks
_0812363C: .4byte sub_811FB28
	thumb_func_end sub_81235E8

	thumb_func_start brm_cancel_1
brm_cancel_1: @ 8123640
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	movs r0, 0x5
	bl PlaySE
	ldr r4, _08123674 @ =gUnknown_203B09C
	ldr r0, [r4]
	adds r0, 0xC
	bl sub_8121CE4
	ldr r0, [r4]
	adds r0, 0xD
	bl sub_8121CE4
	ldr r0, _08123678 @ =gUnknown_203B0A0
	ldrb r1, [r0, 0x8]
	movs r0, 0xF
	ands r0, r1
	cmp r0, 0x6
	bne _0812367C
	movs r0, 0xF
	bl sub_8121D0C
	b _08123682
	.align 2, 0
_08123674: .4byte gUnknown_203B09C
_08123678: .4byte gUnknown_203B0A0
_0812367C:
	movs r0, 0
	bl sub_8121D0C
_08123682:
	ldr r0, _08123698 @ =gTasks
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	ldr r0, _0812369C @ =sub_811FB28
	str r0, [r1]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08123698: .4byte gTasks
_0812369C: .4byte sub_811FB28
	thumb_func_end brm_cancel_1

	thumb_func_start sub_81236A0
sub_81236A0: @ 81236A0
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	movs r0, 0x5
	bl PlaySE
	ldr r4, _081236F0 @ =gUnknown_203B09C
	ldr r0, [r4]
	adds r0, 0xC
	bl sub_8121CE4
	ldr r0, [r4]
	adds r0, 0xD
	bl sub_8121CE4
	ldr r0, _081236F4 @ =gPlayerParty
	ldr r1, _081236F8 @ =gUnknown_203B0A0
	ldrb r1, [r1, 0x9]
	movs r2, 0x8
	bl sub_812299C
	movs r0, 0x1
	bl sub_8121E5C
	movs r0, 0x19
	bl sub_8121D0C
	ldr r1, _081236FC @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	movs r1, 0xFF
	strh r1, [r0, 0x8]
	ldr r1, _08123700 @ =sub_8122C5C
	str r1, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_081236F0: .4byte gUnknown_203B09C
_081236F4: .4byte gPlayerParty
_081236F8: .4byte gUnknown_203B0A0
_081236FC: .4byte gTasks
_08123700: .4byte sub_8122C5C
	thumb_func_end sub_81236A0

	thumb_func_start sub_8123704
sub_8123704: @ 8123704
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x5
	bl PlaySE
	ldr r0, _08123728 @ =gUnknown_203B09C
	ldr r1, [r0]
	ldr r0, _0812372C @ =sub_8123730
	str r0, [r1, 0x4]
	adds r0, r4, 0
	bl sub_811FA78
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08123728: .4byte gUnknown_203B09C
_0812372C: .4byte sub_8123730
	thumb_func_end sub_8123704

	thumb_func_start sub_8123730
sub_8123730: @ 8123730
	push {lr}
	ldr r2, _08123740 @ =c2_8123744
	movs r0, 0x1
	movs r1, 0x3
	bl sub_8107DB4
	pop {r0}
	bx r0
	.align 2, 0
_08123740: .4byte c2_8123744
	thumb_func_end sub_8123730

	thumb_func_start c2_8123744
c2_8123744: @ 8123744
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0xC
	ldr r6, _0812376C @ =gSpecialVar_ItemId
	ldrh r0, [r6]
	cmp r0, 0
	bne _08123778
	ldr r3, _08123770 @ =gUnknown_203B0A0
	ldrb r0, [r3, 0x8]
	lsls r0, 28
	lsrs r0, 28
	ldrb r2, [r3, 0xB]
	movs r1, 0x7F
	str r1, [sp]
	ldr r1, _08123774 @ =sub_8122C30
	str r1, [sp, 0x4]
	ldr r1, [r3]
	b _081237AE
	.align 2, 0
_0812376C: .4byte gSpecialVar_ItemId
_08123770: .4byte gUnknown_203B0A0
_08123774: .4byte sub_8122C30
_08123778:
	ldr r4, _081237BC @ =gUnknown_203B0D8
	ldr r5, _081237C0 @ =gUnknown_203B0A0
	movs r0, 0x9
	ldrsb r0, [r5, r0]
	movs r1, 0x64
	mov r8, r1
	mov r1, r8
	muls r1, r0
	adds r0, r1, 0
	ldr r7, _081237C4 @ =gPlayerParty
	adds r0, r7
	movs r1, 0xC
	bl GetMonData
	strh r0, [r4]
	lsls r0, 16
	cmp r0, 0
	beq _081237CC
	ldrb r0, [r5, 0x8]
	lsls r0, 28
	lsrs r0, 28
	ldrb r2, [r5, 0xB]
	movs r1, 0x7F
	str r1, [sp]
	ldr r1, _081237C8 @ =sub_81238A4
	str r1, [sp, 0x4]
	ldr r1, [r5]
_081237AE:
	str r1, [sp, 0x8]
	movs r1, 0xFF
	movs r3, 0x1
	bl sub_811EA44
	b _08123814
	.align 2, 0
_081237BC: .4byte gUnknown_203B0D8
_081237C0: .4byte gUnknown_203B0A0
_081237C4: .4byte gPlayerParty
_081237C8: .4byte sub_81238A4
_081237CC:
	ldrh r0, [r6]
	bl itemid_is_mail
	lsls r0, 24
	cmp r0, 0
	beq _081237F8
	ldrh r0, [r6]
	movs r1, 0x1
	bl RemoveBagItem
	movs r0, 0x9
	ldrsb r0, [r5, r0]
	mov r1, r8
	muls r1, r0
	adds r0, r1, 0
	adds r0, r7
	ldrh r1, [r6]
	bl sub_81205C8
	bl sub_8123A80
	b _08123814
_081237F8:
	ldrb r0, [r5, 0x8]
	lsls r0, 28
	lsrs r0, 28
	ldrb r2, [r5, 0xB]
	movs r1, 0x7F
	str r1, [sp]
	ldr r1, _08123820 @ =sub_8123824
	str r1, [sp, 0x4]
	ldr r1, [r5]
	str r1, [sp, 0x8]
	movs r1, 0xFF
	movs r3, 0x1
	bl sub_811EA44
_08123814:
	add sp, 0xC
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08123820: .4byte sub_8123824
	thumb_func_end c2_8123744

	thumb_func_start sub_8123824
sub_8123824: @ 8123824
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r0, _0812388C @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08123880
	ldr r0, _08123890 @ =gSpecialVar_ItemId
	ldrh r4, [r0]
	ldr r0, _08123894 @ =gUnknown_203B0A0
	mov r8, r0
	ldrb r0, [r0, 0x9]
	lsls r0, 24
	asrs r0, 24
	movs r6, 0x64
	muls r0, r6
	ldr r5, _08123898 @ =gPlayerParty
	adds r0, r5
	adds r1, r4, 0
	movs r2, 0
	movs r3, 0
	bl sub_8120420
	mov r1, r8
	movs r0, 0x9
	ldrsb r0, [r1, r0]
	muls r0, r6
	adds r0, r5
	adds r1, r4, 0
	bl sub_81205C8
	adds r0, r4, 0
	movs r1, 0x1
	bl RemoveBagItem
	ldr r1, _0812389C @ =gTasks
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r1
	ldr r1, _081238A0 @ =sub_8123BF0
	str r1, [r0]
_08123880:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0812388C: .4byte gPaletteFade
_08123890: .4byte gSpecialVar_ItemId
_08123894: .4byte gUnknown_203B0A0
_08123898: .4byte gPlayerParty
_0812389C: .4byte gTasks
_081238A0: .4byte sub_8123BF0
	thumb_func_end sub_8123824

	thumb_func_start sub_81238A4
sub_81238A4: @ 81238A4
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _081238E4 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _081238DC
	ldr r0, _081238E8 @ =gUnknown_203B0A0
	movs r1, 0x9
	ldrsb r1, [r0, r1]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _081238EC @ =gPlayerParty
	adds r0, r1
	ldr r1, _081238F0 @ =gUnknown_203B0D8
	ldrh r1, [r1]
	movs r2, 0x1
	bl sub_812050C
	ldr r1, _081238F4 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _081238F8 @ =sub_81238FC
	str r1, [r0]
_081238DC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081238E4: .4byte gPaletteFade
_081238E8: .4byte gUnknown_203B0A0
_081238EC: .4byte gPlayerParty
_081238F0: .4byte gUnknown_203B0D8
_081238F4: .4byte gTasks
_081238F8: .4byte sub_81238FC
	thumb_func_end sub_81238A4

	thumb_func_start sub_81238FC
sub_81238FC: @ 81238FC
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_8120370
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08123920
	bl sub_812200C
	ldr r0, _08123928 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _0812392C @ =sub_8123930
	str r0, [r1]
_08123920:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08123928: .4byte gTasks
_0812392C: .4byte sub_8123930
	thumb_func_end sub_81238FC

	thumb_func_start sub_8123930
sub_8123930: @ 8123930
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl Menu_ProcessInputNoWrapClearOnChoose
	lsls r0, 24
	asrs r1, r0, 24
	cmp r1, 0
	beq _08123956
	cmp r1, 0
	bgt _08123950
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _08123A2C
	b _08123A40
_08123950:
	cmp r1, 0x1
	beq _08123A32
	b _08123A40
_08123956:
	ldr r5, _08123998 @ =gSpecialVar_ItemId
	ldrh r0, [r5]
	movs r1, 0x1
	bl RemoveBagItem
	ldr r6, _0812399C @ =gUnknown_203B0D8
	ldrh r0, [r6]
	movs r1, 0x1
	bl AddBagItem
	lsls r0, 24
	cmp r0, 0
	bne _081239AC
	ldrh r0, [r5]
	movs r1, 0x1
	bl AddBagItem
	ldrh r0, [r6]
	bl sub_8120658
	ldr r0, _081239A0 @ =gStringVar4
	movs r1, 0
	bl sub_81202F8
	ldr r1, _081239A4 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _081239A8 @ =sub_81203B8
	str r1, [r0]
	b _08123A40
	.align 2, 0
_08123998: .4byte gSpecialVar_ItemId
_0812399C: .4byte gUnknown_203B0D8
_081239A0: .4byte gStringVar4
_081239A4: .4byte gTasks
_081239A8: .4byte sub_81203B8
_081239AC:
	ldrh r0, [r5]
	bl itemid_is_mail
	lsls r0, 24
	cmp r0, 0
	beq _081239EC
	ldr r0, _081239DC @ =gUnknown_203B0A0
	movs r1, 0x9
	ldrsb r1, [r0, r1]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _081239E0 @ =gPlayerParty
	adds r0, r1
	ldrh r1, [r5]
	bl sub_81205C8
	ldr r1, _081239E4 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _081239E8 @ =sub_8123A50
	str r1, [r0]
	b _08123A40
	.align 2, 0
_081239DC: .4byte gUnknown_203B0A0
_081239E0: .4byte gPlayerParty
_081239E4: .4byte gTasks
_081239E8: .4byte sub_8123A50
_081239EC:
	ldr r0, _08123A1C @ =gUnknown_203B0A0
	movs r1, 0x9
	ldrsb r1, [r0, r1]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08123A20 @ =gPlayerParty
	adds r0, r1
	ldrh r1, [r5]
	bl sub_81205C8
	ldrh r0, [r5]
	ldrh r1, [r6]
	movs r2, 0x1
	bl sub_8120558
	ldr r1, _08123A24 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _08123A28 @ =sub_8123BF0
	str r1, [r0]
	b _08123A40
	.align 2, 0
_08123A1C: .4byte gUnknown_203B0A0
_08123A20: .4byte gPlayerParty
_08123A24: .4byte gTasks
_08123A28: .4byte sub_8123BF0
_08123A2C:
	movs r0, 0x5
	bl PlaySE
_08123A32:
	ldr r0, _08123A48 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _08123A4C @ =sub_81203B8
	str r0, [r1]
_08123A40:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08123A48: .4byte gTasks
_08123A4C: .4byte sub_81203B8
	thumb_func_end sub_8123930

	thumb_func_start sub_8123A50
sub_8123A50: @ 8123A50
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_8120370
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08123A70
	ldr r0, _08123A78 @ =gUnknown_203B09C
	ldr r1, [r0]
	ldr r0, _08123A7C @ =sub_8123A80
	str r0, [r1, 0x4]
	adds r0, r4, 0
	bl sub_811FA78
_08123A70:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08123A78: .4byte gUnknown_203B09C
_08123A7C: .4byte sub_8123A80
	thumb_func_end sub_8123A50

	thumb_func_start sub_8123A80
sub_8123A80: @ 8123A80
	push {lr}
	ldr r0, _08123AB8 @ =gUnknown_203B0A0
	movs r1, 0x9
	ldrsb r1, [r0, r1]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08123ABC @ =gPlayerParty
	adds r0, r1
	movs r1, 0x40
	bl GetMonData
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08123AC0 @ =gSaveBlock1Ptr
	lsls r2, r0, 3
	adds r2, r0
	lsls r2, 2
	ldr r0, _08123AC4 @ =0x00002cd0
	adds r2, r0
	ldr r1, [r1]
	adds r1, r2
	ldr r2, _08123AC8 @ =sub_8123ACC
	movs r0, 0x4
	bl sub_80FEBAC
	pop {r0}
	bx r0
	.align 2, 0
_08123AB8: .4byte gUnknown_203B0A0
_08123ABC: .4byte gPlayerParty
_08123AC0: .4byte gSaveBlock1Ptr
_08123AC4: .4byte 0x00002cd0
_08123AC8: .4byte sub_8123ACC
	thumb_func_end sub_8123A80

	thumb_func_start sub_8123ACC
sub_8123ACC: @ 8123ACC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0xC
	ldr r6, _08123B38 @ =gUnknown_203B0A0
	movs r1, 0x9
	ldrsb r1, [r6, r1]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _08123B3C @ =gPlayerParty
	adds r5, r1, r0
	adds r0, r5, 0
	movs r1, 0xC
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	ldr r0, _08123B40 @ =gSpecialVar_Result
	ldrh r7, [r0]
	cmp r7, 0
	bne _08123B4C
	adds r0, r5, 0
	bl TakeMailFromMon
	ldr r4, _08123B44 @ =gUnknown_203B0D8
	adds r0, r5, 0
	movs r1, 0xC
	adds r2, r4, 0
	bl SetMonData
	ldrh r0, [r4]
	movs r1, 0x1
	bl RemoveBagItem
	mov r0, r8
	movs r1, 0x1
	bl AddBagItem
	ldrb r0, [r6, 0x8]
	lsls r0, 28
	lsrs r0, 28
	ldrb r2, [r6, 0xB]
	str r7, [sp]
	ldr r1, _08123B48 @ =sub_8122C30
	str r1, [sp, 0x4]
	ldr r1, [r6]
	str r1, [sp, 0x8]
	movs r1, 0xFF
	movs r3, 0x1
	bl sub_811EA44
	b _08123B68
	.align 2, 0
_08123B38: .4byte gUnknown_203B0A0
_08123B3C: .4byte gPlayerParty
_08123B40: .4byte gSpecialVar_Result
_08123B44: .4byte gUnknown_203B0D8
_08123B48: .4byte sub_8122C30
_08123B4C:
	ldrb r0, [r6, 0x8]
	lsls r0, 28
	lsrs r0, 28
	ldrb r2, [r6, 0xB]
	movs r1, 0
	str r1, [sp]
	ldr r1, _08123B74 @ =sub_8123B78
	str r1, [sp, 0x4]
	ldr r1, [r6]
	str r1, [sp, 0x8]
	movs r1, 0xFF
	movs r3, 0x1
	bl sub_811EA44
_08123B68:
	add sp, 0xC
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08123B74: .4byte sub_8123B78
	thumb_func_end sub_8123ACC

	thumb_func_start sub_8123B78
sub_8123B78: @ 8123B78
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _08123BB0 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08123BDE
	ldr r1, _08123BB4 @ =gUnknown_203B0D8
	ldrh r0, [r1]
	cmp r0, 0
	bne _08123BC4
	ldr r0, _08123BB8 @ =gUnknown_203B0A0
	movs r1, 0x9
	ldrsb r1, [r0, r1]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08123BBC @ =gPlayerParty
	adds r0, r1
	ldr r1, _08123BC0 @ =gSpecialVar_ItemId
	ldrh r1, [r1]
	movs r2, 0
	movs r3, 0
	bl sub_8120420
	b _08123BD0
	.align 2, 0
_08123BB0: .4byte gPaletteFade
_08123BB4: .4byte gUnknown_203B0D8
_08123BB8: .4byte gUnknown_203B0A0
_08123BBC: .4byte gPlayerParty
_08123BC0: .4byte gSpecialVar_ItemId
_08123BC4:
	ldr r0, _08123BE4 @ =gSpecialVar_ItemId
	ldrh r0, [r0]
	ldrh r1, [r1]
	movs r2, 0
	bl sub_8120558
_08123BD0:
	ldr r0, _08123BE8 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _08123BEC @ =sub_8123BF0
	str r0, [r1]
_08123BDE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08123BE4: .4byte gSpecialVar_ItemId
_08123BE8: .4byte gTasks
_08123BEC: .4byte sub_8123BF0
	thumb_func_end sub_8123B78

	thumb_func_start sub_8123BF0
sub_8123BF0: @ 8123BF0
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _08123C2C @ =gUnknown_203B0A0
	ldrb r4, [r0, 0x9]
	bl sub_8120370
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08123C24
	lsls r2, r4, 24
	asrs r2, 24
	movs r0, 0x64
	muls r0, r2
	ldr r1, _08123C30 @ =gPlayerParty
	adds r0, r1
	ldr r1, _08123C34 @ =gUnknown_203B0B4
	lsls r2, 4
	ldr r1, [r1]
	adds r1, r2
	bl sub_81224B4
	adds r0, r5, 0
	bl sub_81203B8
_08123C24:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08123C2C: .4byte gUnknown_203B0A0
_08123C30: .4byte gPlayerParty
_08123C34: .4byte gUnknown_203B0B4
	thumb_func_end sub_8123BF0

	thumb_func_start sub_8123C38
sub_8123C38: @ 8123C38
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r0, _08123C90 @ =gUnknown_203B0A0
	movs r1, 0x9
	ldrsb r1, [r0, r1]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _08123C94 @ =gPlayerParty
	adds r5, r1, r0
	adds r0, r5, 0
	movs r1, 0xC
	bl GetMonData
	lsls r0, 16
	lsrs r6, r0, 16
	movs r0, 0x5
	bl PlaySE
	ldr r4, _08123C98 @ =gUnknown_203B09C
	ldr r0, [r4]
	adds r0, 0xC
	bl sub_8121CE4
	ldr r0, [r4]
	adds r0, 0xD
	bl sub_8121CE4
	adds r0, r5, 0
	bl sub_8120610
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _08123C9C
	cmp r0, 0x1
	beq _08123CC0
	adds r0, r5, 0
	adds r1, r6, 0
	movs r2, 0x1
	bl sub_81204AC
	b _08123CCE
	.align 2, 0
_08123C90: .4byte gUnknown_203B0A0
_08123C94: .4byte gPlayerParty
_08123C98: .4byte gUnknown_203B09C
_08123C9C:
	ldr r1, _08123CB4 @ =gStringVar1
	adds r0, r5, 0
	bl GetMonNickname
	ldr r4, _08123CB8 @ =gStringVar4
	ldr r1, _08123CBC @ =gUnknown_8416C8F
	adds r0, r4, 0
	bl StringExpandPlaceholders
	adds r0, r4, 0
	b _08123CC8
	.align 2, 0
_08123CB4: .4byte gStringVar1
_08123CB8: .4byte gStringVar4
_08123CBC: .4byte gUnknown_8416C8F
_08123CC0:
	adds r0, r6, 0
	bl sub_8120658
	ldr r0, _08123CE8 @ =gStringVar4
_08123CC8:
	movs r1, 0x1
	bl sub_81202F8
_08123CCE:
	movs r0, 0x2
	bl schedule_bg_copy_tilemap_to_vram
	ldr r0, _08123CEC @ =gTasks
	lsls r1, r7, 2
	adds r1, r7
	lsls r1, 3
	adds r1, r0
	ldr r0, _08123CF0 @ =sub_8123BF0
	str r0, [r1]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08123CE8: .4byte gStringVar4
_08123CEC: .4byte gTasks
_08123CF0: .4byte sub_8123BF0
	thumb_func_end sub_8123C38

	thumb_func_start sub_8123CF4
sub_8123CF4: @ 8123CF4
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	movs r0, 0x5
	bl PlaySE
	ldr r4, _08123D44 @ =gUnknown_203B09C
	ldr r0, [r4]
	adds r0, 0xC
	bl sub_8121CE4
	ldr r0, [r4]
	adds r0, 0xD
	bl sub_8121CE4
	ldr r0, _08123D48 @ =gPlayerParty
	ldr r1, _08123D4C @ =gUnknown_203B0A0
	ldrb r1, [r1, 0x9]
	movs r2, 0x9
	bl sub_812299C
	movs r0, 0x2
	bl sub_8121E5C
	movs r0, 0x1A
	bl sub_8121D0C
	ldr r1, _08123D50 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	movs r1, 0xFF
	strh r1, [r0, 0x8]
	ldr r1, _08123D54 @ =sub_8122C5C
	str r1, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08123D44: .4byte gUnknown_203B09C
_08123D48: .4byte gPlayerParty
_08123D4C: .4byte gUnknown_203B0A0
_08123D50: .4byte gTasks
_08123D54: .4byte sub_8122C5C
	thumb_func_end sub_8123CF4

	thumb_func_start sub_8123D58
sub_8123D58: @ 8123D58
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x5
	bl PlaySE
	ldr r0, _08123D7C @ =gUnknown_203B09C
	ldr r1, [r0]
	ldr r0, _08123D80 @ =sub_8123D84
	str r0, [r1, 0x4]
	adds r0, r4, 0
	bl sub_811FA78
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08123D7C: .4byte gUnknown_203B09C
_08123D80: .4byte sub_8123D84
	thumb_func_end sub_8123D58

	thumb_func_start sub_8123D84
sub_8123D84: @ 8123D84
	push {lr}
	ldr r0, _08123DB8 @ =gUnknown_203B0A0
	movs r1, 0x9
	ldrsb r1, [r0, r1]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08123DBC @ =gPlayerParty
	adds r0, r1
	movs r1, 0x40
	bl GetMonData
	ldr r2, _08123DC0 @ =gSaveBlock1Ptr
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	ldr r0, _08123DC4 @ =0x00002cd0
	adds r1, r0
	ldr r0, [r2]
	adds r0, r1
	ldr r1, _08123DC8 @ =sub_8123DCC
	movs r2, 0x1
	bl sub_80BEBEC
	pop {r0}
	bx r0
	.align 2, 0
_08123DB8: .4byte gUnknown_203B0A0
_08123DBC: .4byte gPlayerParty
_08123DC0: .4byte gSaveBlock1Ptr
_08123DC4: .4byte 0x00002cd0
_08123DC8: .4byte sub_8123DCC
	thumb_func_end sub_8123D84

	thumb_func_start sub_8123DCC
sub_8123DCC: @ 8123DCC
	push {lr}
	sub sp, 0xC
	ldr r2, _08123E00 @ =gPaletteFade
	ldrb r0, [r2, 0x8]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2, 0x8]
	ldr r3, _08123E04 @ =gUnknown_203B0A0
	ldrb r0, [r3, 0x8]
	lsls r0, 28
	lsrs r0, 28
	ldrb r2, [r3, 0xB]
	movs r1, 0x16
	str r1, [sp]
	ldr r1, _08123E08 @ =sub_8122C30
	str r1, [sp, 0x4]
	ldr r1, [r3]
	str r1, [sp, 0x8]
	movs r1, 0xFF
	movs r3, 0x1
	bl sub_811EA44
	add sp, 0xC
	pop {r0}
	bx r0
	.align 2, 0
_08123E00: .4byte gPaletteFade
_08123E04: .4byte gUnknown_203B0A0
_08123E08: .4byte sub_8122C30
	thumb_func_end sub_8123DCC

	thumb_func_start brm_take_2
brm_take_2: @ 8123E0C
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x5
	bl PlaySE
	ldr r5, _08123E48 @ =gUnknown_203B09C
	ldr r0, [r5]
	adds r0, 0xD
	bl sub_8121CE4
	ldr r0, [r5]
	adds r0, 0xC
	bl sub_8121CE4
	ldr r0, _08123E4C @ =gUnknown_8416B64
	movs r1, 0x1
	bl sub_81202F8
	ldr r1, _08123E50 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _08123E54 @ =sub_8123E58
	str r1, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08123E48: .4byte gUnknown_203B09C
_08123E4C: .4byte gUnknown_8416B64
_08123E50: .4byte gTasks
_08123E54: .4byte sub_8123E58
	thumb_func_end brm_take_2

	thumb_func_start sub_8123E58
sub_8123E58: @ 8123E58
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_8120370
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08123E7C
	bl sub_812200C
	ldr r0, _08123E84 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _08123E88 @ =sub_8123E8C
	str r0, [r1]
_08123E7C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08123E84: .4byte gTasks
_08123E88: .4byte sub_8123E8C
	thumb_func_end sub_8123E58

	thumb_func_start sub_8123E8C
sub_8123E8C: @ 8123E8C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl Menu_ProcessInputNoWrapClearOnChoose
	lsls r0, 24
	asrs r1, r0, 24
	cmp r1, 0
	beq _08123EB2
	cmp r1, 0
	bgt _08123EAC
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _08123F1C
	b _08123F38
_08123EAC:
	cmp r1, 0x1
	beq _08123F22
	b _08123F38
_08123EB2:
	ldr r0, _08123EE4 @ =gUnknown_203B0A0
	movs r1, 0x9
	ldrsb r1, [r0, r1]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08123EE8 @ =gPlayerParty
	adds r0, r1
	bl sub_809803C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	beq _08123EF8
	ldr r0, _08123EEC @ =gUnknown_8416B86
	movs r1, 0
	bl sub_81202F8
	ldr r1, _08123EF0 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _08123EF4 @ =sub_8123BF0
	b _08123F36
	.align 2, 0
_08123EE4: .4byte gUnknown_203B0A0
_08123EE8: .4byte gPlayerParty
_08123EEC: .4byte gUnknown_8416B86
_08123EF0: .4byte gTasks
_08123EF4: .4byte sub_8123BF0
_08123EF8:
	ldr r0, _08123F10 @ =gUnknown_8416BA6
	movs r1, 0
	bl sub_81202F8
	ldr r1, _08123F14 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _08123F18 @ =sub_81203B8
	b _08123F36
	.align 2, 0
_08123F10: .4byte gUnknown_8416BA6
_08123F14: .4byte gTasks
_08123F18: .4byte sub_81203B8
_08123F1C:
	movs r0, 0x5
	bl PlaySE
_08123F22:
	ldr r0, _08123F40 @ =gUnknown_8416BC3
	movs r1, 0x1
	bl sub_81202F8
	ldr r1, _08123F44 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _08123F48 @ =sub_8123F4C
_08123F36:
	str r1, [r0]
_08123F38:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08123F40: .4byte gUnknown_8416BC3
_08123F44: .4byte gTasks
_08123F48: .4byte sub_8123F4C
	thumb_func_end sub_8123E8C

	thumb_func_start sub_8123F4C
sub_8123F4C: @ 8123F4C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_8120370
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08123F70
	bl sub_812200C
	ldr r0, _08123F78 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _08123F7C @ =sub_8123F80
	str r0, [r1]
_08123F70:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08123F78: .4byte gTasks
_08123F7C: .4byte sub_8123F80
	thumb_func_end sub_8123F4C

	thumb_func_start sub_8123F80
sub_8123F80: @ 8123F80
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r5, r0, 24
	bl Menu_ProcessInputNoWrapClearOnChoose
	lsls r0, 24
	asrs r1, r0, 24
	cmp r1, 0
	beq _08123FAA
	cmp r1, 0
	bgt _08123FA4
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _0812403C
	b _08124050
_08123FA4:
	cmp r1, 0x1
	beq _08124042
	b _08124050
_08123FAA:
	ldr r0, _08123FFC @ =gUnknown_203B0A0
	mov r8, r0
	ldrb r0, [r0, 0x9]
	lsls r0, 24
	asrs r0, 24
	movs r7, 0x64
	muls r0, r7
	ldr r6, _08124000 @ =gPlayerParty
	adds r0, r6
	movs r1, 0xC
	bl GetMonData
	lsls r0, 16
	lsrs r4, r0, 16
	adds r0, r4, 0
	movs r1, 0x1
	bl AddBagItem
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08124010
	mov r1, r8
	movs r0, 0x9
	ldrsb r0, [r1, r0]
	muls r0, r7
	adds r0, r6
	bl TakeMailFromMon
	ldr r0, _08124004 @ =gUnknown_8416CC7
	movs r1, 0
	bl sub_81202F8
	ldr r1, _08124008 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldr r1, _0812400C @ =sub_8123BF0
	str r1, [r0]
	b _08124050
	.align 2, 0
_08123FFC: .4byte gUnknown_203B0A0
_08124000: .4byte gPlayerParty
_08124004: .4byte gUnknown_8416CC7
_08124008: .4byte gTasks
_0812400C: .4byte sub_8123BF0
_08124010:
	adds r0, r4, 0
	bl sub_8120658
	ldr r0, _08124030 @ =gStringVar4
	movs r1, 0
	bl sub_81202F8
	ldr r1, _08124034 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldr r1, _08124038 @ =sub_81203B8
	str r1, [r0]
	b _08124050
	.align 2, 0
_08124030: .4byte gStringVar4
_08124034: .4byte gTasks
_08124038: .4byte sub_81203B8
_0812403C:
	movs r0, 0x5
	bl PlaySE
_08124042:
	ldr r0, _0812405C @ =gTasks
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	ldr r0, _08124060 @ =sub_81203B8
	str r0, [r1]
_08124050:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0812405C: .4byte gTasks
_08124060: .4byte sub_81203B8
	thumb_func_end sub_8123F80

	thumb_func_start sub_8124064
sub_8124064: @ 8124064
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	adds r6, r0, 0
	lsls r6, 24
	lsrs r6, 24
	ldr r0, _081240E0 @ =gUnknown_203B0A0
	mov r8, r0
	movs r1, 0x9
	ldrsb r1, [r0, r1]
	movs r0, 0x64
	adds r5, r1, 0
	muls r5, r0
	ldr r0, _081240E4 @ =gPlayerParty
	mov r9, r0
	add r5, r9
	movs r0, 0x5
	bl PlaySE
	ldr r4, _081240E8 @ =gUnknown_203B09C
	ldr r0, [r4]
	adds r0, 0xC
	bl sub_8121CE4
	ldr r0, [r4]
	adds r0, 0xD
	bl sub_8121CE4
	mov r0, r8
	ldrb r4, [r0, 0x9]
	adds r0, r5, 0
	bl sub_8122B20
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	mov r0, r9
	adds r1, r4, 0
	bl sub_812299C
	movs r0, 0
	bl sub_8121E5C
	movs r0, 0x16
	bl sub_8121D0C
	ldr r1, _081240EC @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r0, r1
	movs r1, 0xFF
	strh r1, [r0, 0x8]
	ldr r1, _081240F0 @ =sub_8122C5C
	str r1, [r0]
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081240E0: .4byte gUnknown_203B0A0
_081240E4: .4byte gPlayerParty
_081240E8: .4byte gUnknown_203B09C
_081240EC: .4byte gTasks
_081240F0: .4byte sub_8122C5C
	thumb_func_end sub_8124064

	thumb_func_start sub_81240F4
sub_81240F4: @ 81240F4
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	movs r0, 0x5
	bl PlaySE
	ldr r5, _08124120 @ =gUnknown_203B09C
	ldr r0, [r5]
	adds r0, 0xC
	bl sub_8121CE4
	bl sub_8127AC0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08124124
	adds r0, r4, 0
	bl sub_811FA78
	b _08124142
	.align 2, 0
_08124120: .4byte gUnknown_203B09C
_08124124:
	ldr r0, [r5]
	adds r0, 0xD
	bl sub_8121CE4
	ldr r0, _08124148 @ =gStringVar4
	movs r1, 0x1
	bl sub_81202F8
	ldr r1, _0812414C @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _08124150 @ =sub_81203B8
	str r1, [r0]
_08124142:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08124148: .4byte gStringVar4
_0812414C: .4byte gTasks
_08124150: .4byte sub_81203B8
	thumb_func_end sub_81240F4

	thumb_func_start sub_8124154
sub_8124154: @ 8124154
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r0, _0812417C @ =gUnknown_203B0A0
	ldrb r1, [r0, 0x8]
	movs r0, 0xC0
	ands r0, r1
	cmp r0, 0x80
	bne _08124184
	movs r0, 0x2
	mov r8, r0
	ldr r1, _08124180 @ =gUnknown_8416B3E
	str r1, [sp]
	b _0812418C
	.align 2, 0
_0812417C: .4byte gUnknown_203B0A0
_08124180: .4byte gUnknown_8416B3E
_08124184:
	movs r2, 0x3
	mov r8, r2
	ldr r0, _081241FC @ =gUnknown_8416B16
	str r0, [sp]
_0812418C:
	ldr r4, _08124200 @ =gUnknown_203B09C
	ldr r0, [r4]
	adds r0, 0xC
	bl sub_8121CE4
	ldr r0, [r4]
	adds r0, 0xD
	bl sub_8121CE4
	movs r5, 0
	lsls r1, r7, 2
	mov r9, r1
	cmp r5, r8
	bcs _08124222
	ldr r6, _08124204 @ =gUnknown_203B0A0
	ldr r1, _08124208 @ =gTasks
	mov r2, r9
	adds r0, r2, r7
	lsls r0, 3
	adds r0, r1
	mov r10, r0
_081241B6:
	ldr r0, _0812420C @ =gUnknown_203B0D4
	adds r4, r5, r0
	ldrb r0, [r4]
	cmp r0, 0
	bne _08124218
	movs r0, 0x5
	bl PlaySE
	ldrb r0, [r6, 0x9]
	adds r0, 0x1
	strb r0, [r4]
	adds r0, r5, 0x2
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08124210 @ =gUnknown_203B0B4
	movs r2, 0x9
	ldrsb r2, [r6, r2]
	lsls r2, 4
	ldr r1, [r1]
	adds r1, r2
	movs r2, 0x1
	bl sub_8121C70
	mov r0, r8
	subs r0, 0x1
	cmp r5, r0
	bne _081241F0
	bl sub_8124258
_081241F0:
	movs r0, 0
	bl sub_8121D0C
	ldr r0, _08124214 @ =sub_811FB28
	mov r1, r10
	b _0812423C
	.align 2, 0
_081241FC: .4byte gUnknown_8416B16
_08124200: .4byte gUnknown_203B09C
_08124204: .4byte gUnknown_203B0A0
_08124208: .4byte gTasks
_0812420C: .4byte gUnknown_203B0D4
_08124210: .4byte gUnknown_203B0B4
_08124214: .4byte sub_811FB28
_08124218:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, r8
	bcc _081241B6
_08124222:
	movs r0, 0x1A
	bl PlaySE
	ldr r0, [sp]
	movs r1, 0x1
	bl sub_81202F8
	ldr r0, _08124250 @ =gTasks
	mov r2, r9
	adds r1, r2, r7
	lsls r1, 3
	adds r1, r0
	ldr r0, _08124254 @ =sub_81203B8
_0812423C:
	str r0, [r1]
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08124250: .4byte gTasks
_08124254: .4byte sub_81203B8
	thumb_func_end sub_8124154

	thumb_func_start sub_8124258
sub_8124258: @ 8124258
	push {r4,lr}
	ldr r4, _08124274 @ =gUnknown_203B0A0
	ldrb r0, [r4, 0x9]
	movs r1, 0
	bl sub_811F818
	movs r0, 0x6
	strb r0, [r4, 0x9]
	movs r1, 0x1
	bl sub_811F818
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08124274: .4byte gUnknown_203B0A0
	thumb_func_end sub_8124258

	thumb_func_start sub_8124278
sub_8124278: @ 8124278
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r7, r0, 24
	movs r0, 0x5
	bl PlaySE
	ldr r4, _081242BC @ =gUnknown_203B09C
	ldr r0, [r4]
	adds r0, 0xC
	bl sub_8121CE4
	ldr r0, [r4]
	adds r0, 0xD
	bl sub_8121CE4
	movs r4, 0
	ldr r3, _081242C0 @ =gUnknown_203B0D4
	ldr r6, _081242C4 @ =gUnknown_203B0A0
	adds r5, r6, 0
_0812429E:
	adds r2, r4, r3
	ldrb r1, [r2]
	movs r0, 0x9
	ldrsb r0, [r5, r0]
	adds r0, 0x1
	cmp r1, r0
	bne _081242DC
	movs r1, 0
	strb r1, [r2]
	cmp r4, 0
	beq _081242C8
	cmp r4, 0x1
	beq _081242D4
	b _081242E6
	.align 2, 0
_081242BC: .4byte gUnknown_203B09C
_081242C0: .4byte gUnknown_203B0D4
_081242C4: .4byte gUnknown_203B0A0
_081242C8:
	ldrb r0, [r3, 0x1]
	strb r0, [r3]
	ldrb r0, [r3, 0x2]
	strb r0, [r3, 0x1]
	strb r4, [r3, 0x2]
	b _081242E6
_081242D4:
	ldrb r0, [r3, 0x2]
	strb r0, [r3, 0x1]
	strb r1, [r3, 0x2]
	b _081242E6
_081242DC:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x2
	bls _0812429E
_081242E6:
	ldr r5, _08124344 @ =gUnknown_203B0B4
	movs r0, 0x9
	ldrsb r0, [r6, r0]
	lsls r0, 4
	ldr r1, [r5]
	adds r1, r0
	movs r0, 0x1
	movs r2, 0x1
	bl sub_8121C70
	ldr r4, _08124348 @ =gUnknown_203B0D4
	ldrb r0, [r4]
	cmp r0, 0
	beq _08124312
	lsls r0, 4
	subs r0, 0x10
	ldr r1, [r5]
	adds r1, r0
	movs r0, 0x2
	movs r2, 0x1
	bl sub_8121C70
_08124312:
	ldrb r0, [r4, 0x1]
	cmp r0, 0
	beq _08124328
	lsls r0, 4
	subs r0, 0x10
	ldr r1, [r5]
	adds r1, r0
	movs r0, 0x3
	movs r2, 0x1
	bl sub_8121C70
_08124328:
	movs r0, 0
	bl sub_8121D0C
	ldr r0, _0812434C @ =gTasks
	lsls r1, r7, 2
	adds r1, r7
	lsls r1, 3
	adds r1, r0
	ldr r0, _08124350 @ =sub_811FB28
	str r0, [r1]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08124344: .4byte gUnknown_203B0B4
_08124348: .4byte gUnknown_203B0D4
_0812434C: .4byte gTasks
_08124350: .4byte sub_811FB28
	thumb_func_end sub_8124278

	thumb_func_start sub_8124354
sub_8124354: @ 8124354
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x5
	bl PlaySE
	ldr r1, _0812437C @ =gSpecialVar_0x8004
	ldr r0, _08124380 @ =gUnknown_203B0A0
	ldrb r0, [r0, 0x9]
	lsls r0, 24
	asrs r0, 24
	strh r0, [r1]
	adds r0, r4, 0
	bl sub_811FA78
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812437C: .4byte gSpecialVar_0x8004
_08124380: .4byte gUnknown_203B0A0
	thumb_func_end sub_8124354

	thumb_func_start sub_8124384
sub_8124384: @ 8124384
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r0, _08124410 @ =gUnknown_203B0A0
	mov r9, r0
	ldrb r0, [r0, 0x9]
	lsls r0, 24
	asrs r0, 24
	movs r1, 0x64
	mov r8, r1
	mov r1, r8
	muls r1, r0
	adds r0, r1, 0
	ldr r4, _08124414 @ =gPlayerParty
	adds r0, r4
	movs r1, 0x41
	bl GetMonData
	adds r6, r0, 0
	lsls r6, 16
	lsrs r6, 16
	mov r1, r9
	movs r0, 0x9
	ldrsb r0, [r1, r0]
	mov r1, r8
	muls r1, r0
	adds r0, r1, 0
	adds r0, r4
	movs r1, 0xB
	bl GetMonData
	adds r5, r0, 0
	lsls r5, 16
	lsrs r5, 16
	mov r1, r9
	movs r0, 0x9
	ldrsb r0, [r1, r0]
	mov r1, r8
	muls r1, r0
	adds r0, r1, 0
	adds r0, r4
	movs r1, 0x50
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_80F9800
	ldr r0, [r0]
	adds r1, r6, 0
	adds r2, r5, 0
	adds r3, r4, 0
	bl sub_804FCE0
	cmp r0, 0x1
	beq _08124418
	cmp r0, 0x2
	beq _0812442C
	movs r0, 0x5
	bl PlaySE
	adds r0, r7, 0
	bl sub_811FA78
	b _0812446C
	.align 2, 0
_08124410: .4byte gUnknown_203B0A0
_08124414: .4byte gPlayerParty
_08124418:
	ldr r0, _08124424 @ =gStringVar4
	ldr r1, _08124428 @ =gUnknown_84170BC
	bl StringExpandPlaceholders
	b _08124434
	.align 2, 0
_08124424: .4byte gStringVar4
_08124428: .4byte gUnknown_84170BC
_0812442C:
	ldr r0, _08124478 @ =gStringVar4
	ldr r1, _0812447C @ =gUnknown_84170E0
	bl StringExpandPlaceholders
_08124434:
	movs r0, 0x1A
	bl PlaySE
	ldr r4, _08124480 @ =gUnknown_203B09C
	ldr r0, [r4]
	adds r0, 0xC
	bl sub_8121CE4
	ldr r0, [r4]
	adds r0, 0xD
	bl sub_8121CE4
	ldr r4, _08124478 @ =gStringVar4
	ldr r1, _08124484 @ =gUnknown_84169D9
	adds r0, r4, 0
	bl StringAppend
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_81202F8
	ldr r1, _08124488 @ =gTasks
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r1
	ldr r1, _0812448C @ =sub_81203B8
	str r1, [r0]
_0812446C:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08124478: .4byte gStringVar4
_0812447C: .4byte gUnknown_84170E0
_08124480: .4byte gUnknown_203B09C
_08124484: .4byte gUnknown_84169D9
_08124488: .4byte gTasks
_0812448C: .4byte sub_81203B8
	thumb_func_end sub_8124384

	thumb_func_start brm_trade_1
brm_trade_1: @ 8124490
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0xC
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r0, _08124558 @ =gUnknown_203B0A0
	mov r8, r0
	ldrb r0, [r0, 0x9]
	lsls r0, 24
	asrs r0, 24
	movs r6, 0x64
	muls r0, r6
	ldr r4, _0812455C @ =gPlayerParty
	adds r0, r4
	movs r1, 0x41
	bl GetMonData
	mov r9, r0
	mov r1, r9
	lsls r1, 16
	lsrs r1, 16
	mov r9, r1
	mov r1, r8
	movs r0, 0x9
	ldrsb r0, [r1, r0]
	muls r0, r6
	adds r0, r4
	movs r1, 0xB
	bl GetMonData
	adds r5, r0, 0
	lsls r5, 16
	lsrs r5, 16
	mov r1, r8
	movs r0, 0x9
	ldrsb r0, [r1, r0]
	muls r0, r6
	adds r0, r4
	movs r1, 0x50
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_80F9800
	ldr r0, [r0]
	ldr r1, _08124560 @ =gUnknown_203B064
	ldr r1, [r1]
	ldr r2, _08124564 @ =gUnknown_203B068
	ldrh r3, [r2]
	ldr r2, _08124568 @ =gUnknown_203B06A
	ldrb r2, [r2]
	str r2, [sp]
	str r5, [sp, 0x4]
	str r4, [sp, 0x8]
	mov r2, r9
	bl sub_804FBEC
	cmp r0, 0
	beq _08124584
	ldr r5, _0812456C @ =gStringVar4
	ldr r1, _08124570 @ =gUnknown_845A7E8
	subs r0, 0x1
	lsls r0, 2
	adds r0, r1
	ldr r1, [r0]
	adds r0, r5, 0
	bl StringExpandPlaceholders
	movs r0, 0x1A
	bl PlaySE
	ldr r4, _08124574 @ =gUnknown_203B09C
	ldr r0, [r4]
	adds r0, 0xC
	bl sub_8121CE4
	ldr r0, [r4]
	adds r0, 0xD
	bl sub_8121CE4
	ldr r1, _08124578 @ =gUnknown_84169D9
	adds r0, r5, 0
	bl StringAppend
	adds r0, r5, 0
	movs r1, 0x1
	bl sub_81202F8
	ldr r1, _0812457C @ =gTasks
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r1
	ldr r1, _08124580 @ =sub_81203B8
	str r1, [r0]
	b _08124590
	.align 2, 0
_08124558: .4byte gUnknown_203B0A0
_0812455C: .4byte gPlayerParty
_08124560: .4byte gUnknown_203B064
_08124564: .4byte gUnknown_203B068
_08124568: .4byte gUnknown_203B06A
_0812456C: .4byte gStringVar4
_08124570: .4byte gUnknown_845A7E8
_08124574: .4byte gUnknown_203B09C
_08124578: .4byte gUnknown_84169D9
_0812457C: .4byte gTasks
_08124580: .4byte sub_81203B8
_08124584:
	movs r0, 0x5
	bl PlaySE
	adds r0, r7, 0
	bl sub_811FA78
_08124590:
	add sp, 0xC
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end brm_trade_1

	thumb_func_start nullsub_93
nullsub_93: @ 81245A0
	bx lr
	thumb_func_end nullsub_93

	thumb_func_start sub_81245A4
sub_81245A4: @ 81245A4
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	bl GetMenuCursorPos
	ldr r5, _08124610 @ =gUnknown_203B09C
	ldr r1, [r5]
	lsls r0, 24
	lsrs r0, 24
	adds r1, 0xF
	adds r1, r0
	ldrb r0, [r1]
	subs r0, 0x12
	lsls r0, 24
	lsrs r4, r0, 24
	movs r0, 0x5
	bl PlaySE
	ldr r1, _08124614 @ =gUnknown_845A788
	lsls r0, r4, 3
	adds r7, r0, r1
	ldr r0, [r7]
	cmp r0, 0
	bne _081245D6
	b _081247B4
_081245D6:
	ldr r0, [r5]
	adds r0, 0xC
	bl sub_8121CE4
	ldr r0, [r5]
	adds r0, 0xD
	bl sub_8121CE4
	bl sub_80BF708
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _081245FA
	bl InUnionRoom
	cmp r0, 0x1
	bne _0812461C
_081245FA:
	adds r0, r4, 0
	subs r0, 0x9
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bhi _08124618
	movs r0, 0xD
	bl sub_8121D0C
	b _081247A6
	.align 2, 0
_08124610: .4byte gUnknown_203B09C
_08124614: .4byte gUnknown_845A788
_08124618:
	ldrb r0, [r7, 0x4]
	b _081247A2
_0812461C:
	cmp r4, 0x6
	bhi _08124658
	movs r1, 0x82
	lsls r1, 4
	adds r0, r4, r1
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08124658
	ldr r0, _0812464C @ =gUnknown_8416AE2
	movs r1, 0x1
	bl sub_81202F8
	ldr r1, _08124650 @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r0, r1
	ldr r1, _08124654 @ =sub_81203B8
	str r1, [r0]
	b _081247B4
	.align 2, 0
_0812464C: .4byte gUnknown_8416AE2
_08124650: .4byte gTasks
_08124654: .4byte sub_81203B8
_08124658:
	ldr r1, _08124680 @ =gUnknown_845A788
	lsls r0, r4, 3
	adds r5, r0, r1
	ldr r0, [r5]
	bl _call_via_r0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0812466E
	b _0812478C
_0812466E:
	subs r0, r4, 0x2
	cmp r0, 0x8
	bhi _0812475C
	lsls r0, 2
	ldr r1, _08124684 @ =_08124688
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08124680: .4byte gUnknown_845A788
_08124684: .4byte _08124688
	.align 2, 0
_08124688:
	.4byte _0812474C
	.4byte _0812475C
	.4byte _0812475C
	.4byte _0812475C
	.4byte _0812475C
	.4byte _081246B4
	.4byte _081246F0
	.4byte _081246AC
	.4byte _081246AC
_081246AC:
	adds r0, r6, 0
	bl sub_80E56DC
	b _081247B4
_081246B4:
	ldr r0, _081246E0 @ =gSaveBlock1Ptr
	ldr r1, [r0]
	movs r0, 0x1C
	ldrsb r0, [r1, r0]
	lsls r0, 16
	lsrs r0, 16
	ldrb r1, [r1, 0x1D]
	lsls r1, 24
	asrs r1, 24
	lsls r1, 16
	lsrs r1, 16
	bl get_mapheader_by_bank_and_number
	adds r1, r0, 0
	ldr r0, _081246E4 @ =gStringVar1
	ldrb r1, [r1, 0x14]
	bl sub_80C4DF8
	ldr r0, _081246E8 @ =gStringVar4
	ldr r1, _081246EC @ =gUnknown_8417640
	b _08124720
	.align 2, 0
_081246E0: .4byte gSaveBlock1Ptr
_081246E4: .4byte gStringVar1
_081246E8: .4byte gStringVar4
_081246EC: .4byte gUnknown_8417640
_081246F0:
	ldr r0, _08124738 @ =gSaveBlock1Ptr
	ldr r1, [r0]
	adds r0, r1, 0
	adds r0, 0x24
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	lsls r0, 16
	lsrs r0, 16
	adds r1, 0x25
	ldrb r1, [r1]
	lsls r1, 24
	asrs r1, 24
	lsls r1, 16
	lsrs r1, 16
	bl get_mapheader_by_bank_and_number
	adds r1, r0, 0
	ldr r0, _0812473C @ =gStringVar1
	ldrb r1, [r1, 0x14]
	bl sub_80C4DF8
	ldr r0, _08124740 @ =gStringVar4
	ldr r1, _08124744 @ =gUnknown_8417615
_08124720:
	bl StringExpandPlaceholders
	adds r0, r6, 0
	bl sub_81247C4
	ldr r0, _08124748 @ =gUnknown_203B09C
	ldr r0, [r0]
	movs r1, 0x86
	lsls r1, 2
	adds r0, r1
	strh r4, [r0]
	b _081247B4
	.align 2, 0
_08124738: .4byte gSaveBlock1Ptr
_0812473C: .4byte gStringVar1
_08124740: .4byte gStringVar4
_08124744: .4byte gUnknown_8417615
_08124748: .4byte gUnknown_203B09C
_0812474C:
	ldr r1, _08124754 @ =gUnknown_203B0A0
	ldr r0, _08124758 @ =sub_80C4EF8
	str r0, [r1]
	b _08124778
	.align 2, 0
_08124754: .4byte gUnknown_203B0A0
_08124758: .4byte sub_80C4EF8
_0812475C:
	ldr r1, _08124780 @ =gUnknown_203B0A0
	ldr r0, _08124784 @ =CB2_ReturnToField
	str r0, [r1]
	bl GetCursorSelectionMonId
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x64
	muls r0, r1
	ldr r1, _08124788 @ =gPlayerParty
	adds r0, r1
	adds r1, r4, 0
	bl sub_8124BB0
_08124778:
	adds r0, r6, 0
	bl sub_811FA78
	b _081247B4
	.align 2, 0
_08124780: .4byte gUnknown_203B0A0
_08124784: .4byte CB2_ReturnToField
_08124788: .4byte gPlayerParty
_0812478C:
	cmp r4, 0
	beq _0812479A
	cmp r4, 0x4
	bne _081247A0
	bl sub_8124A0C
	b _081247A6
_0812479A:
	bl sub_8124954
	b _081247A6
_081247A0:
	ldrb r0, [r5, 0x4]
_081247A2:
	bl sub_8121D0C
_081247A6:
	ldr r0, _081247BC @ =gTasks
	lsls r1, r6, 2
	adds r1, r6
	lsls r1, 3
	adds r1, r0
	ldr r0, _081247C0 @ =task_brm_cancel_1_on_keypad_a_or_b
	str r0, [r1]
_081247B4:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081247BC: .4byte gTasks
_081247C0: .4byte task_brm_cancel_1_on_keypad_a_or_b
	thumb_func_end sub_81245A4

	thumb_func_start sub_81247C4
sub_81247C4: @ 81247C4
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _081247E8 @ =gStringVar4
	movs r1, 0x1
	bl sub_81202F8
	ldr r1, _081247EC @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _081247F0 @ =sub_81247F4
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081247E8: .4byte gStringVar4
_081247EC: .4byte gTasks
_081247F0: .4byte sub_81247F4
	thumb_func_end sub_81247C4

	thumb_func_start sub_81247F4
sub_81247F4: @ 81247F4
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_8120370
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08124818
	bl sub_812200C
	ldr r0, _08124820 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _08124824 @ =sub_8124828
	str r0, [r1]
_08124818:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08124820: .4byte gTasks
_08124824: .4byte sub_8124828
	thumb_func_end sub_81247F4

	thumb_func_start sub_8124828
sub_8124828: @ 8124828
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl Menu_ProcessInputNoWrapClearOnChoose
	lsls r0, 24
	asrs r1, r0, 24
	cmp r1, 0
	beq _0812484E
	cmp r1, 0
	bgt _08124848
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _0812488C
	b _081248A2
_08124848:
	cmp r1, 0x1
	beq _08124892
	b _081248A2
_0812484E:
	ldr r1, _0812487C @ =gUnknown_203B0A0
	ldr r0, _08124880 @ =CB2_ReturnToField
	str r0, [r1]
	bl GetCursorSelectionMonId
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x64
	muls r0, r1
	ldr r1, _08124884 @ =gPlayerParty
	adds r0, r1
	ldr r1, _08124888 @ =gUnknown_203B09C
	ldr r1, [r1]
	movs r2, 0x86
	lsls r2, 2
	adds r1, r2
	ldrb r1, [r1]
	bl sub_8124BB0
	adds r0, r4, 0
	bl sub_811FA78
	b _081248A2
	.align 2, 0
_0812487C: .4byte gUnknown_203B0A0
_08124880: .4byte CB2_ReturnToField
_08124884: .4byte gPlayerParty
_08124888: .4byte gUnknown_203B09C
_0812488C:
	movs r0, 0x5
	bl PlaySE
_08124892:
	ldr r0, _081248A8 @ =gFieldCallback2
	movs r1, 0
	str r1, [r0]
	ldr r0, _081248AC @ =gPostMenuFieldCallback
	str r1, [r0]
	adds r0, r4, 0
	bl sub_81203B8
_081248A2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081248A8: .4byte gFieldCallback2
_081248AC: .4byte gPostMenuFieldCallback
	thumb_func_end sub_8124828

	thumb_func_start FieldCallback_PrepareFadeInFromMenu
FieldCallback_PrepareFadeInFromMenu: @ 81248B0
	push {lr}
	bl sub_807DC00
	ldr r0, _081248C4 @ =task_launch_hm_phase_2
	movs r1, 0x8
	bl CreateTask
	movs r0, 0x1
	pop {r1}
	bx r1
	.align 2, 0
_081248C4: .4byte task_launch_hm_phase_2
	thumb_func_end FieldCallback_PrepareFadeInFromMenu

	thumb_func_start task_launch_hm_phase_2
task_launch_hm_phase_2: @ 81248C8
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_807AA70
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _081248F4
	bl brm_get_selected_species
	ldr r1, _081248FC @ =gFieldEffectArguments
	lsls r0, 16
	lsrs r0, 16
	str r0, [r1]
	ldr r0, _08124900 @ =gPostMenuFieldCallback
	ldr r0, [r0]
	bl _call_via_r0
	adds r0, r4, 0
	bl DestroyTask
_081248F4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081248FC: .4byte gFieldEffectArguments
_08124900: .4byte gPostMenuFieldCallback
	thumb_func_end task_launch_hm_phase_2

	thumb_func_start brm_get_selected_species
brm_get_selected_species: @ 8124904
	push {lr}
	ldr r0, _08124924 @ =gUnknown_203B0A0
	movs r1, 0x9
	ldrsb r1, [r0, r1]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08124928 @ =gPlayerParty
	adds r0, r1
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	pop {r1}
	bx r1
	.align 2, 0
_08124924: .4byte gUnknown_203B0A0
_08124928: .4byte gPlayerParty
	thumb_func_end brm_get_selected_species

	thumb_func_start task_brm_cancel_1_on_keypad_a_or_b
task_brm_cancel_1_on_keypad_a_or_b: @ 812492C
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _08124950 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _08124946
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0812494C
_08124946:
	adds r0, r2, 0
	bl brm_cancel_1
_0812494C:
	pop {r0}
	bx r0
	.align 2, 0
_08124950: .4byte gMain
	thumb_func_end task_brm_cancel_1_on_keypad_a_or_b

	thumb_func_start sub_8124954
sub_8124954: @ 8124954
	push {lr}
	ldr r0, _0812496C @ =0x00000806
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08124970
	movs r0, 0xC
	bl sub_8121D0C
	b _08124976
	.align 2, 0
_0812496C: .4byte 0x00000806
_08124970:
	movs r0, 0xD
	bl sub_8121D0C
_08124976:
	pop {r0}
	bx r0
	thumb_func_end sub_8124954

	thumb_func_start hm_surf_run_dp02scr
hm_surf_run_dp02scr: @ 812497C
	push {lr}
	bl GetCursorSelectionMonId
	ldr r1, _08124994 @ =gFieldEffectArguments
	lsls r0, 24
	lsrs r0, 24
	str r0, [r1]
	movs r0, 0x9
	bl FieldEffectStart
	pop {r0}
	bx r0
	.align 2, 0
_08124994: .4byte gFieldEffectArguments
	thumb_func_end hm_surf_run_dp02scr

	thumb_func_start sub_8124998
sub_8124998: @ 8124998
	push {r4,lr}
	sub sp, 0x4
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl GetXYCoordsOneStepInFrontOfPlayer
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r4, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	bl MetatileBehavior_IsSemiDeepWater
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08124A00
	bl PartyHasMonWithSurf
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08124A00
	bl IsPlayerFacingSurfableFishableWater
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08124A00
	ldr r1, _081249F0 @ =gFieldCallback2
	ldr r0, _081249F4 @ =FieldCallback_PrepareFadeInFromMenu
	str r0, [r1]
	ldr r1, _081249F8 @ =gPostMenuFieldCallback
	ldr r0, _081249FC @ =hm_surf_run_dp02scr
	str r0, [r1]
	movs r0, 0x1
	b _08124A02
	.align 2, 0
_081249F0: .4byte gFieldCallback2
_081249F4: .4byte FieldCallback_PrepareFadeInFromMenu
_081249F8: .4byte gPostMenuFieldCallback
_081249FC: .4byte hm_surf_run_dp02scr
_08124A00:
	movs r0, 0
_08124A02:
	add sp, 0x4
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8124998

	thumb_func_start sub_8124A0C
sub_8124A0C: @ 8124A0C
	push {r4,lr}
	sub sp, 0x4
	movs r0, 0x8
	bl TestPlayerAvatarFlags
	lsls r0, 24
	cmp r0, 0
	beq _08124A24
	movs r0, 0x9
	bl sub_8121D0C
	b _08124A82
_08124A24:
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl GetXYCoordsOneStepInFrontOfPlayer
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r4, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	bl MetatileBehavior_IsSemiDeepWater
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08124A56
	movs r0, 0xA
	bl sub_8121D0C
	b _08124A82
_08124A56:
	ldr r0, _08124A78 @ =gSaveBlock1Ptr
	ldr r1, [r0]
	movs r0, 0x4
	ldrsb r0, [r1, r0]
	cmp r0, 0x3
	bne _08124A7C
	ldrb r0, [r1, 0x5]
	subs r0, 0x23
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bhi _08124A7C
	movs r0, 0xB
	bl sub_8121D0C
	b _08124A82
	.align 2, 0
_08124A78: .4byte gSaveBlock1Ptr
_08124A7C:
	movs r0, 0x8
	bl sub_8121D0C
_08124A82:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8124A0C

	thumb_func_start sub_8124A8C
sub_8124A8C: @ 8124A8C
	push {lr}
	ldr r0, _08124AA4 @ =gMapHeader
	ldrb r0, [r0, 0x17]
	bl Overworld_MapTypeAllowsTeleportAndFly
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08124AA8
	movs r0, 0
	b _08124AAA
	.align 2, 0
_08124AA4: .4byte gMapHeader
_08124AA8:
	movs r0, 0x1
_08124AAA:
	pop {r1}
	bx r1
	thumb_func_end sub_8124A8C

	thumb_func_start sub_8124AB0
sub_8124AB0: @ 8124AB0
	push {lr}
	sub sp, 0xC
	movs r0, 0
	str r0, [sp]
	ldr r0, _08124AD4 @ =sub_811FB28
	str r0, [sp, 0x4]
	ldr r0, _08124AD8 @ =sub_80568A8
	str r0, [sp, 0x8]
	movs r0, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0x1
	bl sub_811EA44
	add sp, 0xC
	pop {r0}
	bx r0
	.align 2, 0
_08124AD4: .4byte sub_811FB28
_08124AD8: .4byte sub_80568A8
	thumb_func_end sub_8124AB0

	thumb_func_start hm2_waterfall
hm2_waterfall: @ 8124ADC
	push {lr}
	bl GetCursorSelectionMonId
	ldr r1, _08124AF4 @ =gFieldEffectArguments
	lsls r0, 24
	lsrs r0, 24
	str r0, [r1]
	movs r0, 0x2B
	bl FieldEffectStart
	pop {r0}
	bx r0
	.align 2, 0
_08124AF4: .4byte gFieldEffectArguments
	thumb_func_end hm2_waterfall

	thumb_func_start hm_prepare_waterfall
hm_prepare_waterfall: @ 8124AF8
	push {r4,lr}
	sub sp, 0x4
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl GetXYCoordsOneStepInFrontOfPlayer
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r4, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	bl MetatileBehavior_IsWaterfall
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08124B54
	bl IsPlayerSurfingNorth
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08124B54
	ldr r1, _08124B44 @ =gFieldCallback2
	ldr r0, _08124B48 @ =FieldCallback_PrepareFadeInFromMenu
	str r0, [r1]
	ldr r1, _08124B4C @ =gPostMenuFieldCallback
	ldr r0, _08124B50 @ =hm2_waterfall
	str r0, [r1]
	movs r0, 0x1
	b _08124B56
	.align 2, 0
_08124B44: .4byte gFieldCallback2
_08124B48: .4byte FieldCallback_PrepareFadeInFromMenu
_08124B4C: .4byte gPostMenuFieldCallback
_08124B50: .4byte hm2_waterfall
_08124B54:
	movs r0, 0
_08124B56:
	add sp, 0x4
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end hm_prepare_waterfall

	thumb_func_start sub_8124B60
sub_8124B60: @ 8124B60
	push {r4-r7,lr}
	adds r6, r0, 0
	adds r4, r1, 0
	adds r5, r2, 0
	lsls r4, 16
	lsrs r4, 16
	lsls r5, 16
	lsrs r5, 16
	movs r0, 0x8
	bl Alloc
	adds r7, r0, 0
	adds r0, r6, 0
	movs r1, 0x41
	bl GetMonData
	strh r0, [r7, 0x4]
	strh r4, [r7]
	strh r5, [r7, 0x2]
	ldr r0, _08124B98 @ =gUnknown_203B0A0
	ldrb r0, [r0, 0xB]
	cmp r0, 0x6
	bne _08124B9C
	movs r0, 0xA
	adds r1, r7, 0
	bl sub_8113550
	b _08124BA4
	.align 2, 0
_08124B98: .4byte gUnknown_203B0A0
_08124B9C:
	movs r0, 0x9
	adds r1, r7, 0
	bl sub_8113550
_08124BA4:
	adds r0, r7, 0
	bl Free
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8124B60

	thumb_func_start sub_8124BB0
sub_8124BB0: @ 8124BB0
	push {r4-r6,lr}
	adds r5, r0, 0
	lsls r4, r1, 24
	lsrs r4, 24
	movs r0, 0x4
	bl Alloc
	adds r6, r0, 0
	adds r0, r5, 0
	movs r1, 0x41
	bl GetMonData
	strh r0, [r6]
	strb r4, [r6, 0x2]
	ldrb r0, [r6, 0x2]
	cmp r0, 0x7
	beq _08124BDA
	cmp r0, 0x8
	beq _08124BFC
	movs r0, 0xFF
	b _08124C00
_08124BDA:
	ldr r0, _08124BF8 @ =gSaveBlock1Ptr
	ldr r1, [r0]
	movs r0, 0x1C
	ldrsb r0, [r1, r0]
	lsls r0, 16
	lsrs r0, 16
	ldrb r1, [r1, 0x1D]
	lsls r1, 24
	asrs r1, 24
	lsls r1, 16
	lsrs r1, 16
	bl get_mapheader_by_bank_and_number
	b _08124BFE
	.align 2, 0
_08124BF8: .4byte gSaveBlock1Ptr
_08124BFC:
	ldr r0, _08124C18 @ =gMapHeader
_08124BFE:
	ldrb r0, [r0, 0x14]
_08124C00:
	strb r0, [r6, 0x3]
	movs r0, 0x24
	adds r1, r6, 0
	bl sub_8113550
	adds r0, r6, 0
	bl Free
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08124C18: .4byte gMapHeader
	thumb_func_end sub_8124BB0

	thumb_func_start sub_8124C1C
sub_8124C1C: @ 8124C1C
	push {r4,r5,lr}
	adds r5, r0, 0
	movs r0, 0x8
	bl Alloc
	adds r4, r0, 0
	ldrb r0, [r5]
	strb r0, [r4]
	ldrb r0, [r5, 0x1]
	strb r0, [r4, 0x1]
	movs r0, 0
	ldrsb r0, [r4, r0]
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x1
	ldrsb r1, [r4, r1]
	lsls r1, 16
	lsrs r1, 16
	bl get_mapheader_by_bank_and_number
	adds r5, r0, 0
	adds r0, r4, 0
	bl Free
	movs r0, 0x4
	bl Alloc
	adds r4, r0, 0
	bl GetCursorSelectionMonId
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x64
	muls r0, r1
	ldr r1, _08124C88 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x41
	bl GetMonData
	strh r0, [r4]
	movs r0, 0x2
	strb r0, [r4, 0x2]
	ldrb r0, [r5, 0x14]
	strb r0, [r4, 0x3]
	movs r0, 0x24
	adds r1, r4, 0
	bl sub_8113550
	adds r0, r4, 0
	bl Free
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08124C88: .4byte gPlayerParty
	thumb_func_end sub_8124C1C

	thumb_func_start sub_8124C8C
sub_8124C8C: @ 8124C8C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0xC
	ldr r6, _08124CB4 @ =sub_8124D90
	ldr r0, _08124CB8 @ =gMain
	ldr r1, _08124CBC @ =0x00000439
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08124CCC
	movs r0, 0x1
	mov r8, r0
	bl sub_81278B4
	lsls r0, 24
	lsrs r7, r0, 24
	b _08124CD2
	.align 2, 0
_08124CB4: .4byte sub_8124D90
_08124CB8: .4byte gMain
_08124CBC: .4byte 0x00000439
_08124CC0:
	ldr r0, _08124CC8 @ =gUnknown_203B0A0
	strb r5, [r0, 0x9]
	b _08124D16
	.align 2, 0
_08124CC8: .4byte gUnknown_203B0A0
_08124CCC:
	movs r1, 0
	mov r8, r1
	movs r7, 0
_08124CD2:
	ldr r4, _08124D30 @ =gSpecialVar_ItemId
	ldrh r0, [r4]
	bl GetItemEffectType
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xA
	bne _08124D44
	ldr r1, _08124D34 @ =gUnknown_203B0A0
	movs r0, 0
	strb r0, [r1, 0x9]
	movs r5, 0
_08124CEA:
	movs r0, 0x64
	adds r1, r5, 0
	muls r1, r0
	ldr r0, _08124D38 @ =gPlayerParty
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _08124D0C
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	cmp r0, 0
	beq _08124CC0
_08124D0C:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x5
	bls _08124CEA
_08124D16:
	ldr r0, _08124D30 @ =gSpecialVar_ItemId
	ldrh r0, [r0]
	bl GetPocketByItemId
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x5
	bne _08124D28
	ldr r6, _08124D3C @ =sub_8124DB0
_08124D28:
	ldr r1, _08124D40 @ =sub_8124FC8
	movs r0, 0x7F
	b _08124D6A
	.align 2, 0
_08124D30: .4byte gSpecialVar_ItemId
_08124D34: .4byte gUnknown_203B0A0
_08124D38: .4byte gPlayerParty
_08124D3C: .4byte sub_8124DB0
_08124D40: .4byte sub_8124FC8
_08124D44:
	ldrh r0, [r4]
	bl GetPocketByItemId
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	beq _08124D5A
	cmp r0, 0x5
	beq _08124D64
	movs r0, 0x5
	b _08124D68
_08124D5A:
	movs r0, 0x4
	ldr r6, _08124D60 @ =sub_8124DA0
	b _08124D68
	.align 2, 0
_08124D60: .4byte sub_8124DA0
_08124D64:
	movs r0, 0x5
	ldr r6, _08124D88 @ =sub_8124DB0
_08124D68:
	ldr r1, _08124D8C @ =sub_811FB28
_08124D6A:
	str r0, [sp]
	str r1, [sp, 0x4]
	str r6, [sp, 0x8]
	mov r0, r8
	adds r1, r7, 0
	movs r2, 0x3
	movs r3, 0x1
	bl sub_811EA44
	add sp, 0xC
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08124D88: .4byte sub_8124DB0
_08124D8C: .4byte sub_811FB28
	thumb_func_end sub_8124C8C

	thumb_func_start sub_8124D90
sub_8124D90: @ 8124D90
	push {lr}
	movs r0, 0xB
	movs r1, 0x3
	movs r2, 0
	bl sub_8107DB4
	pop {r0}
	bx r0
	thumb_func_end sub_8124D90

	thumb_func_start sub_8124DA0
sub_8124DA0: @ 8124DA0
	push {lr}
	movs r0, 0x5
	movs r1, 0
	movs r2, 0xFF
	bl InitTMCase
	pop {r0}
	bx r0
	thumb_func_end sub_8124DA0

	thumb_func_start sub_8124DB0
sub_8124DB0: @ 8124DB0
	push {lr}
	movs r0, 0x6
	movs r1, 0
	movs r2, 0xFF
	bl sub_813CD50
	pop {r0}
	bx r0
	thumb_func_end sub_8124DB0

	thumb_func_start sub_8124DC0
sub_8124DC0: @ 8124DC0
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08124DD8 @ =gUnknown_203B09C
	ldr r2, [r1]
	ldr r1, _08124DDC @ =sub_8124DE0
	str r1, [r2, 0x4]
	bl sub_811FA78
	pop {r0}
	bx r0
	.align 2, 0
_08124DD8: .4byte gUnknown_203B09C
_08124DDC: .4byte sub_8124DE0
	thumb_func_end sub_8124DC0

	thumb_func_start sub_8124DE0
sub_8124DE0: @ 8124DE0
	push {r4,lr}
	ldr r4, _08124E0C @ =gSpecialVar_ItemId
	ldrh r0, [r4]
	bl sub_80A1150
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bne _08124E2C
	bl sub_8126C24
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08124E18
	ldr r0, _08124E10 @ =gUnknown_203B0A0
	ldrb r0, [r0, 0x9]
	ldrh r1, [r4]
	ldr r2, _08124E14 @ =sub_8126BD4
	bl sub_811C540
	b _08124E38
	.align 2, 0
_08124E0C: .4byte gSpecialVar_ItemId
_08124E10: .4byte gUnknown_203B0A0
_08124E14: .4byte sub_8126BD4
_08124E18:
	ldr r2, _08124E28 @ =gUnknown_203B0A0
	ldrb r0, [r2, 0x9]
	ldrh r1, [r4]
	ldr r2, [r2]
	bl sub_811C5AC
	b _08124E38
	.align 2, 0
_08124E28: .4byte gUnknown_203B0A0
_08124E2C:
	ldr r0, _08124E40 @ =gUnknown_203B0A0
	ldrb r0, [r0, 0x9]
	ldrh r1, [r4]
	ldr r2, _08124E44 @ =sub_8124E48
	bl sub_811C540
_08124E38:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08124E40: .4byte gUnknown_203B0A0
_08124E44: .4byte sub_8124E48
	thumb_func_end sub_8124DE0

	thumb_func_start sub_8124E48
sub_8124E48: @ 8124E48
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0xC
	ldr r7, _08124EBC @ =gSpecialVar_ItemId
	ldrh r0, [r7]
	bl ItemId_GetPocket
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bne _08124EC8
	bl sub_811D178
	cmp r0, 0x1
	bne _08124EC8
	ldr r0, _08124EC0 @ =gUnknown_203B0A0
	mov r8, r0
	ldrb r0, [r0, 0x9]
	lsls r0, 24
	asrs r0, 24
	movs r6, 0x64
	adds r4, r0, 0
	muls r4, r6
	ldr r5, _08124EC4 @ =gPlayerParty
	adds r4, r5
	ldrh r0, [r7]
	bl ItemIdToBattleMoveId
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	adds r0, r4, 0
	bl GiveMoveToMon
	mov r1, r8
	movs r0, 0x9
	ldrsb r0, [r1, r0]
	muls r0, r6
	adds r0, r5
	movs r1, 0x4
	bl AdjustFriendship
	ldrh r1, [r7]
	movs r0, 0xA9
	lsls r0, 1
	cmp r1, r0
	bhi _08124EB0
	adds r0, r1, 0
	movs r1, 0x1
	bl RemoveBagItem
_08124EB0:
	mov r1, r8
	ldr r0, [r1]
	bl SetMainCallback2
	b _08124EE6
	.align 2, 0
_08124EBC: .4byte gSpecialVar_ItemId
_08124EC0: .4byte gUnknown_203B0A0
_08124EC4: .4byte gPlayerParty
_08124EC8:
	ldr r2, _08124EF4 @ =gUnknown_203B0A0
	ldrb r0, [r2, 0x8]
	lsls r0, 28
	lsrs r0, 28
	ldrb r3, [r2, 0x9]
	movs r1, 0x7F
	str r1, [sp]
	ldr r1, _08124EF8 @ =sub_8124FC8
	str r1, [sp, 0x4]
	ldr r1, [r2]
	str r1, [sp, 0x8]
	movs r1, 0xFF
	movs r2, 0
	bl sub_811EA44
_08124EE6:
	add sp, 0xC
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08124EF4: .4byte gUnknown_203B0A0
_08124EF8: .4byte sub_8124FC8
	thumb_func_end sub_8124E48

	thumb_func_start sub_8124EFC
sub_8124EFC: @ 8124EFC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0xC
	bl sub_811D178
	cmp r0, 0x1
	bne _08124F94
	ldr r0, _08124F88 @ =gUnknown_203B0A0
	mov r8, r0
	movs r1, 0x9
	ldrsb r1, [r0, r1]
	movs r0, 0x64
	adds r5, r1, 0
	muls r5, r0
	ldr r0, _08124F8C @ =gPlayerParty
	adds r5, r0
	bl sub_8138B2C
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r1, r4, 0
	adds r1, 0xD
	adds r0, r5, 0
	bl GetMonData
	adds r6, r0, 0
	lsls r6, 16
	lsrs r6, 16
	adds r0, r5, 0
	adds r1, r4, 0
	bl RemoveMonPPBonus
	ldr r7, _08124F90 @ =gSpecialVar_ItemId
	ldrh r0, [r7]
	bl ItemIdToBattleMoveId
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	adds r0, r5, 0
	adds r2, r4, 0
	bl SetMonMoveSlot
	adds r0, r5, 0
	movs r1, 0x4
	bl AdjustFriendship
	ldrh r2, [r7]
	movs r0, 0x4
	adds r1, r5, 0
	adds r3, r6, 0
	bl sub_80A2294
	ldrh r1, [r7]
	movs r0, 0xA9
	lsls r0, 1
	cmp r1, r0
	bhi _08124F7C
	adds r0, r1, 0
	movs r1, 0x1
	bl RemoveBagItem
_08124F7C:
	mov r1, r8
	ldr r0, [r1]
	bl SetMainCallback2
	b _08124FB2
	.align 2, 0
_08124F88: .4byte gUnknown_203B0A0
_08124F8C: .4byte gPlayerParty
_08124F90: .4byte gSpecialVar_ItemId
_08124F94:
	ldr r4, _08124FC0 @ =gUnknown_203B0A0
	ldrb r0, [r4, 0x8]
	lsls r0, 28
	lsrs r0, 28
	ldrb r2, [r4, 0xB]
	ldrb r3, [r4, 0x9]
	movs r1, 0x7F
	str r1, [sp]
	ldr r1, _08124FC4 @ =sub_8124FC8
	str r1, [sp, 0x4]
	ldr r1, [r4]
	str r1, [sp, 0x8]
	movs r1, 0xFF
	bl sub_811EA44
_08124FB2:
	add sp, 0xC
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08124FC0: .4byte gUnknown_203B0A0
_08124FC4: .4byte sub_8124FC8
	thumb_func_end sub_8124EFC

	thumb_func_start sub_8124FC8
sub_8124FC8: @ 8124FC8
	push {lr}
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r0, _08125000 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08124FFA
	ldr r0, _08125004 @ =gUnknown_203B0A0
	ldrb r1, [r0, 0x8]
	movs r0, 0xF
	ands r0, r1
	cmp r0, 0x1
	bne _08124FEE
	ldr r0, _08125008 @ =gUnknown_203B09C
	ldr r1, [r0]
	ldr r0, _0812500C @ =sub_8128184
	str r0, [r1, 0x4]
_08124FEE:
	ldr r0, _08125010 @ =gUnknown_3005E98
	ldr r1, _08125014 @ =sub_81255BC
	ldr r2, [r0]
	adds r0, r3, 0
	bl _call_via_r2
_08124FFA:
	pop {r0}
	bx r0
	.align 2, 0
_08125000: .4byte gPaletteFade
_08125004: .4byte gUnknown_203B0A0
_08125008: .4byte gUnknown_203B09C
_0812500C: .4byte sub_8128184
_08125010: .4byte gUnknown_3005E98
_08125014: .4byte sub_81255BC
	thumb_func_end sub_8124FC8

	thumb_func_start IsHPRecoveryItem
IsHPRecoveryItem: @ 8125018
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0xAF
	bne _08125034
	ldr r0, _0812502C @ =gSaveBlock1Ptr
	ldr r0, [r0]
	ldr r1, _08125030 @ =0x00003108
	adds r0, r1
	b _0812503E
	.align 2, 0
_0812502C: .4byte gSaveBlock1Ptr
_08125030: .4byte 0x00003108
_08125034:
	ldr r1, _0812504C @ =gItemEffectTable
	subs r0, 0xD
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
_0812503E:
	ldrb r1, [r0, 0x4]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	bne _08125050
	movs r0, 0
	b _08125052
	.align 2, 0
_0812504C: .4byte gItemEffectTable
_08125050:
	movs r0, 0x1
_08125052:
	pop {r1}
	bx r1
	thumb_func_end IsHPRecoveryItem

	thumb_func_start GetMedicineItemEffectMessage
GetMedicineItemEffectMessage: @ 8125058
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	bl GetItemEffectType
	lsls r0, 24
	lsrs r0, 24
	subs r0, 0x3
	cmp r0, 0x12
	bls _0812506E
	b _08125204
_0812506E:
	lsls r0, 2
	ldr r1, _08125078 @ =_0812507C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08125078: .4byte _0812507C
	.align 2, 0
_0812507C:
	.4byte _081250C8
	.4byte _081250DC
	.4byte _081250F0
	.4byte _08125104
	.4byte _08125118
	.4byte _0812512C
	.4byte _08125140
	.4byte _08125204
	.4byte _08125154
	.4byte _08125178
	.4byte _08125168
	.4byte _081251A8
	.4byte _081251B8
	.4byte _08125198
	.4byte _08125188
	.4byte _08125204
	.4byte _081251DC
	.4byte _081251DC
	.4byte _081251F0
_081250C8:
	ldr r0, _081250D4 @ =gStringVar4
	ldr r1, _081250D8 @ =gUnknown_8416F4E
	bl StringExpandPlaceholders
	b _0812520C
	.align 2, 0
_081250D4: .4byte gStringVar4
_081250D8: .4byte gUnknown_8416F4E
_081250DC:
	ldr r0, _081250E8 @ =gStringVar4
	ldr r1, _081250EC @ =gUnknown_8416F8C
	bl StringExpandPlaceholders
	b _0812520C
	.align 2, 0
_081250E8: .4byte gStringVar4
_081250EC: .4byte gUnknown_8416F8C
_081250F0:
	ldr r0, _081250FC @ =gStringVar4
	ldr r1, _08125100 @ =gUnknown_8416F9A
	bl StringExpandPlaceholders
	b _0812520C
	.align 2, 0
_081250FC: .4byte gStringVar4
_08125100: .4byte gUnknown_8416F9A
_08125104:
	ldr r0, _08125110 @ =gStringVar4
	ldr r1, _08125114 @ =gUnknown_8416FB2
	bl StringExpandPlaceholders
	b _0812520C
	.align 2, 0
_08125110: .4byte gStringVar4
_08125114: .4byte gUnknown_8416FB2
_08125118:
	ldr r0, _08125124 @ =gStringVar4
	ldr r1, _08125128 @ =gUnknown_8416F6F
	bl StringExpandPlaceholders
	b _0812520C
	.align 2, 0
_08125124: .4byte gStringVar4
_08125128: .4byte gUnknown_8416F6F
_0812512C:
	ldr r0, _08125138 @ =gStringVar4
	ldr r1, _0812513C @ =gUnknown_8417052
	bl StringExpandPlaceholders
	b _0812520C
	.align 2, 0
_08125138: .4byte gStringVar4
_0812513C: .4byte gUnknown_8417052
_08125140:
	ldr r0, _0812514C @ =gStringVar4
	ldr r1, _08125150 @ =gUnknown_8417075
	bl StringExpandPlaceholders
	b _0812520C
	.align 2, 0
_0812514C: .4byte gStringVar4
_08125150: .4byte gUnknown_8417075
_08125154:
	ldr r0, _08125160 @ =gStringVar4
	ldr r1, _08125164 @ =gUnknown_8416FED
	bl StringExpandPlaceholders
	b _0812520C
	.align 2, 0
_08125160: .4byte gStringVar4
_08125164: .4byte gUnknown_8416FED
_08125168:
	ldr r0, _08125170 @ =gStringVar2
	ldr r1, _08125174 @ =gUnknown_84169C2
	b _081251BC
	.align 2, 0
_08125170: .4byte gStringVar2
_08125174: .4byte gUnknown_84169C2
_08125178:
	ldr r0, _08125180 @ =gStringVar2
	ldr r1, _08125184 @ =gUnknown_8417674
	b _081251BC
	.align 2, 0
_08125180: .4byte gStringVar2
_08125184: .4byte gUnknown_8417674
_08125188:
	ldr r0, _08125190 @ =gStringVar2
	ldr r1, _08125194 @ =gUnknown_841767B
	b _081251BC
	.align 2, 0
_08125190: .4byte gStringVar2
_08125194: .4byte gUnknown_841767B
_08125198:
	ldr r0, _081251A0 @ =gStringVar2
	ldr r1, _081251A4 @ =gUnknown_841768D
	b _081251BC
	.align 2, 0
_081251A0: .4byte gStringVar2
_081251A4: .4byte gUnknown_841768D
_081251A8:
	ldr r0, _081251B0 @ =gStringVar2
	ldr r1, _081251B4 @ =gUnknown_84169C5
	b _081251BC
	.align 2, 0
_081251B0: .4byte gStringVar2
_081251B4: .4byte gUnknown_84169C5
_081251B8:
	ldr r0, _081251CC @ =gStringVar2
	ldr r1, _081251D0 @ =gUnknown_84169CD
_081251BC:
	bl StringCopy
	ldr r0, _081251D4 @ =gStringVar4
	ldr r1, _081251D8 @ =gUnknown_8417032
	bl StringExpandPlaceholders
	b _0812520C
	.align 2, 0
_081251CC: .4byte gStringVar2
_081251D0: .4byte gUnknown_84169CD
_081251D4: .4byte gStringVar4
_081251D8: .4byte gUnknown_8417032
_081251DC:
	ldr r0, _081251E8 @ =gStringVar4
	ldr r1, _081251EC @ =gUnknown_8417002
	bl StringExpandPlaceholders
	b _0812520C
	.align 2, 0
_081251E8: .4byte gStringVar4
_081251EC: .4byte gUnknown_8417002
_081251F0:
	ldr r0, _081251FC @ =gStringVar4
	ldr r1, _08125200 @ =gUnknown_8416FC7
	bl StringExpandPlaceholders
	b _0812520C
	.align 2, 0
_081251FC: .4byte gStringVar4
_08125200: .4byte gUnknown_8416FC7
_08125204:
	ldr r0, _08125210 @ =gStringVar4
	ldr r1, _08125214 @ =gUnknown_84169DC
	bl StringExpandPlaceholders
_0812520C:
	pop {r0}
	bx r0
	.align 2, 0
_08125210: .4byte gStringVar4
_08125214: .4byte gUnknown_84169DC
	thumb_func_end GetMedicineItemEffectMessage

	thumb_func_start UsingHPEVItemOnShedinja
UsingHPEVItemOnShedinja: @ 8125218
	push {r4,lr}
	adds r4, r0, 0
	lsls r0, r1, 16
	lsrs r0, 16
	bl GetItemEffectType
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xD
	bne _08125244
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	ldr r1, _08125240 @ =0x0000012f
	cmp r0, r1
	bne _08125244
	movs r0, 0
	b _08125246
	.align 2, 0
_08125240: .4byte 0x0000012f
_08125244:
	movs r0, 0x1
_08125246:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end UsingHPEVItemOnShedinja

	thumb_func_start IsBlueYellowRedFlute
IsBlueYellowRedFlute: @ 812524C
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x27
	beq _0812525E
	cmp r0, 0x29
	beq _0812525E
	cmp r0, 0x28
	bne _08125262
_0812525E:
	movs r0, 0x1
	b _08125264
_08125262:
	movs r0, 0
_08125264:
	pop {r1}
	bx r1
	thumb_func_end IsBlueYellowRedFlute

	thumb_func_start ExecuteTableBasedItemEffect__
ExecuteTableBasedItemEffect__: @ 8125268
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	lsls r1, 16
	lsrs r5, r1, 16
	lsls r2, 24
	lsrs r6, r2, 24
	ldr r0, _08125294 @ =gMain
	ldr r1, _08125298 @ =0x00000439
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	bne _081252A0
	movs r0, 0x64
	muls r0, r3
	ldr r1, _0812529C @ =gPlayerParty
	adds r0, r1
	adds r1, r5, 0
	adds r2, r3, 0
	b _081252BA
	.align 2, 0
_08125294: .4byte gMain
_08125298: .4byte 0x00000439
_0812529C: .4byte gPlayerParty
_081252A0:
	movs r0, 0x64
	adds r4, r3, 0
	muls r4, r0
	ldr r0, _081252CC @ =gPlayerParty
	adds r4, r0
	adds r0, r3, 0
	bl sub_8127F7C
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r5, 0
_081252BA:
	adds r3, r6, 0
	bl ExecuteTableBasedItemEffect
	lsls r0, 24
	lsrs r0, 24
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_081252CC: .4byte gPlayerParty
	thumb_func_end ExecuteTableBasedItemEffect__

	thumb_func_start sub_81252D0
sub_81252D0: @ 81252D0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	mov r8, r1
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r0, _08125300 @ =gUnknown_203B0A0
	movs r1, 0x9
	ldrsb r1, [r0, r1]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _08125304 @ =gPlayerParty
	adds r5, r1, r0
	ldr r0, _08125308 @ =gSpecialVar_ItemId
	ldrh r6, [r0]
	adds r0, r5, 0
	adds r1, r6, 0
	bl UsingHPEVItemOnShedinja
	lsls r0, 24
	cmp r0, 0
	bne _0812530C
	movs r4, 0x1
	b _08125342
	.align 2, 0
_08125300: .4byte gUnknown_203B0A0
_08125304: .4byte gPlayerParty
_08125308: .4byte gSpecialVar_ItemId
_0812530C:
	adds r0, r6, 0
	bl IsHPRecoveryItem
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08125330
	adds r0, r5, 0
	movs r1, 0x39
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	movs r1, 0x3A
	bl GetMonData
_08125330:
	ldr r0, _08125370 @ =gUnknown_203B0A0
	ldrb r2, [r0, 0x9]
	adds r0, r5, 0
	adds r1, r6, 0
	movs r3, 0
	bl PokemonUseItemEffects2
	lsls r0, 24
	lsrs r4, r0, 24
_08125342:
	movs r0, 0x5
	bl PlaySE
	cmp r4, 0
	beq _08125380
	ldr r1, _08125374 @ =gUnknown_203B0C0
	movs r0, 0
	strb r0, [r1]
	ldr r0, _08125378 @ =gUnknown_84169DC
	movs r1, 0x1
	bl sub_81202F8
	movs r0, 0x2
	bl schedule_bg_copy_tilemap_to_vram
	ldr r1, _0812537C @ =gTasks
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r1
	mov r1, r8
	str r1, [r0]
	b _08125398
	.align 2, 0
_08125370: .4byte gUnknown_203B0A0
_08125374: .4byte gUnknown_203B0C0
_08125378: .4byte gUnknown_84169DC
_0812537C: .4byte gTasks
_08125380:
	ldr r3, _081253A4 @ =0x0000ffff
	movs r0, 0x4
	adds r1, r5, 0
	adds r2, r6, 0
	bl sub_80A2294
	adds r0, r7, 0
	bl sub_8124DC0
	ldr r1, _081253A8 @ =gUnknown_3005E98
	ldr r0, _081253AC @ =ItemUseCB_Medicine
	str r0, [r1]
_08125398:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081253A4: .4byte 0x0000ffff
_081253A8: .4byte gUnknown_3005E98
_081253AC: .4byte ItemUseCB_Medicine
	thumb_func_end sub_81252D0

	thumb_func_start ItemUseCB_Medicine
ItemUseCB_Medicine: @ 81253B0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	str r1, [sp, 0x4]
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	movs r0, 0
	mov r10, r0
	ldr r0, _08125438 @ =gUnknown_203B0A0
	movs r1, 0x9
	ldrsb r1, [r0, r1]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _0812543C @ =gPlayerParty
	adds r5, r1, r0
	ldr r0, _08125440 @ =gSpecialVar_ItemId
	ldrh r6, [r0]
	adds r0, r5, 0
	adds r1, r6, 0
	bl UsingHPEVItemOnShedinja
	lsls r0, 24
	cmp r0, 0
	beq _08125428
	adds r0, r6, 0
	bl IsHPRecoveryItem
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	cmp r0, 0x1
	bne _08125416
	adds r0, r5, 0
	movs r1, 0x39
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	mov r10, r0
	adds r0, r5, 0
	movs r1, 0x3A
	bl GetMonData
	cmp r10, r0
	bne _08125416
	movs r1, 0
	mov r8, r1
_08125416:
	ldr r4, _08125438 @ =gUnknown_203B0A0
	ldrb r0, [r4, 0x9]
	adds r1, r6, 0
	movs r2, 0
	bl ExecuteTableBasedItemEffect__
	lsls r0, 24
	cmp r0, 0
	beq _0812544C
_08125428:
	ldr r1, _08125444 @ =gUnknown_203B0C0
	movs r0, 0
	strb r0, [r1]
	movs r0, 0x5
	bl PlaySE
	ldr r0, _08125448 @ =gUnknown_84169DC
	b _0812551C
	.align 2, 0
_08125438: .4byte gUnknown_203B0A0
_0812543C: .4byte gPlayerParty
_08125440: .4byte gSpecialVar_ItemId
_08125444: .4byte gUnknown_203B0C0
_08125448: .4byte gUnknown_84169DC
_0812544C:
	ldr r1, _08125474 @ =gUnknown_203B0C0
	movs r0, 0x1
	strb r0, [r1]
	adds r0, r6, 0
	bl IsBlueYellowRedFlute
	lsls r0, 24
	cmp r0, 0
	bne _08125478
	movs r0, 0x1
	bl PlaySE
	ldrb r0, [r4, 0xB]
	cmp r0, 0xE
	beq _0812547E
	adds r0, r6, 0
	movs r1, 0x1
	bl RemoveBagItem
	b _0812547E
	.align 2, 0
_08125474: .4byte gUnknown_203B0C0
_08125478:
	movs r0, 0x6E
	bl PlaySE
_0812547E:
	ldr r4, _081254FC @ =gUnknown_203B0B4
	ldr r7, _08125500 @ =gUnknown_203B0A0
	movs r0, 0x9
	ldrsb r0, [r7, r0]
	lsls r0, 4
	ldr r1, [r4]
	adds r1, r0
	adds r0, r5, 0
	bl party_menu_get_status_condition_and_update_object
	ldr r2, _08125504 @ =gSprites
	movs r0, 0x9
	ldrsb r0, [r7, r0]
	ldr r1, [r4]
	lsls r0, 4
	adds r3, r0, r1
	ldrb r1, [r3, 0xC]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x3E
	ldrb r0, [r0]
	lsls r0, 29
	cmp r0, 0
	bge _081254BC
	adds r0, r5, 0
	adds r1, r3, 0
	movs r2, 0x1
	bl sub_8121790
_081254BC:
	mov r2, r8
	cmp r2, 0x1
	bne _0812550C
	mov r0, r10
	cmp r0, 0
	bne _081254D0
	ldrb r0, [r7, 0x9]
	movs r1, 0x1
	bl sub_811F818
_081254D0:
	adds r0, r5, 0
	movs r1, 0x39
	bl GetMonData
	adds r3, r0, 0
	mov r1, r10
	subs r3, r1
	lsls r3, 16
	asrs r3, 16
	ldrb r1, [r7, 0x9]
	ldr r0, _08125508 @ =sub_8125554
	str r0, [sp]
	mov r0, r9
	movs r2, 0x1
	bl sub_8120760
	mov r0, r9
	movs r1, 0
	mov r2, r10
	bl sub_81207F0
	b _08125538
	.align 2, 0
_081254FC: .4byte gUnknown_203B0B4
_08125500: .4byte gUnknown_203B0A0
_08125504: .4byte gSprites
_08125508: .4byte sub_8125554
_0812550C:
	ldr r1, _08125548 @ =gStringVar1
	adds r0, r5, 0
	bl GetMonNickname
	adds r0, r6, 0
	bl GetMedicineItemEffectMessage
	ldr r0, _0812554C @ =gStringVar4
_0812551C:
	movs r1, 0x1
	bl sub_81202F8
	movs r0, 0x2
	bl schedule_bg_copy_tilemap_to_vram
	ldr r1, _08125550 @ =gTasks
	mov r2, r9
	lsls r0, r2, 2
	add r0, r9
	lsls r0, 3
	adds r0, r1
	ldr r1, [sp, 0x4]
	str r1, [r0]
_08125538:
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08125548: .4byte gStringVar1
_0812554C: .4byte gStringVar4
_08125550: .4byte gTasks
	thumb_func_end ItemUseCB_Medicine

	thumb_func_start sub_8125554
sub_8125554: @ 8125554
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldr r0, _081255A0 @ =gUnknown_203B0A0
	movs r1, 0x9
	ldrsb r1, [r0, r1]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _081255A4 @ =gPlayerParty
	adds r0, r1
	ldr r1, _081255A8 @ =gStringVar1
	bl GetMonNickname
	ldr r4, _081255AC @ =gStringVar4
	ldr r1, _081255B0 @ =gUnknown_8416F27
	adds r0, r4, 0
	bl StringExpandPlaceholders
	adds r0, r4, 0
	movs r1, 0
	bl sub_81202F8
	movs r0, 0x2
	bl schedule_bg_copy_tilemap_to_vram
	bl sub_803539C
	ldr r1, _081255B4 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldr r1, _081255B8 @ =sub_81255BC
	str r1, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_081255A0: .4byte gUnknown_203B0A0
_081255A4: .4byte gPlayerParty
_081255A8: .4byte gStringVar1
_081255AC: .4byte gStringVar4
_081255B0: .4byte gUnknown_8416F27
_081255B4: .4byte gTasks
_081255B8: .4byte sub_81255BC
	thumb_func_end sub_8125554

	thumb_func_start sub_81255BC
sub_81255BC: @ 81255BC
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_8120370
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _081255E2
	ldr r0, _081255E8 @ =gUnknown_203B0C0
	ldrb r1, [r0]
	cmp r1, 0
	bne _081255DC
	ldr r0, _081255EC @ =gUnknown_203B09C
	ldr r0, [r0]
	str r1, [r0, 0x4]
_081255DC:
	adds r0, r4, 0
	bl sub_811FA78
_081255E2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081255E8: .4byte gUnknown_203B0C0
_081255EC: .4byte gUnknown_203B09C
	thumb_func_end sub_81255BC

	thumb_func_start sub_81255F0
sub_81255F0: @ 81255F0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x10
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0
	mov r10, r0
	movs r1, 0x2
	mov r8, r1
	movs r0, 0x3
	bl sub_8121E5C
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	movs r6, 0
	movs r0, 0x64
	adds r2, r4, 0
	muls r2, r0
	str r2, [sp, 0xC]
_08125620:
	ldr r0, _081256B8 @ =gPlayerParty
	adds r1, r6, 0
	adds r1, 0xD
	ldr r2, [sp, 0xC]
	adds r0, r2, r0
	bl GetMonData
	adds r5, r0, 0
	lsls r5, 16
	lsrs r5, 16
	mov r0, r8
	movs r1, 0
	bl GetFontAttribute
	adds r4, r0, 0
	mov r0, r8
	movs r1, 0x2
	bl GetFontAttribute
	adds r4, r0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0xD
	adds r2, r5, 0
	muls r2, r0
	ldr r0, _081256BC @ =gMoveNames
	adds r2, r0
	lsls r0, r6, 4
	adds r0, 0x2
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp]
	movs r0, 0xFF
	str r0, [sp, 0x4]
	movs r7, 0
	str r7, [sp, 0x8]
	mov r0, r9
	mov r1, r8
	adds r3, r4, 0
	bl AddTextPrinterParameterized
	cmp r5, 0
	beq _08125680
	mov r0, r10
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
_08125680:
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x3
	bls _08125620
	movs r0, 0x10
	str r0, [sp]
	mov r0, r10
	str r0, [sp, 0x4]
	str r7, [sp, 0x8]
	mov r0, r9
	mov r1, r8
	movs r2, 0
	movs r3, 0x2
	bl ProgramAndPlaceMenuCursorOnWindow
	movs r0, 0x2
	bl schedule_bg_copy_tilemap_to_vram
	add sp, 0x10
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081256B8: .4byte gPlayerParty
_081256BC: .4byte gMoveNames
	thumb_func_end sub_81255F0

	thumb_func_start sub_81256C0
sub_81256C0: @ 81256C0
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r5, r4, 0
	bl ProcessMenuInput
	lsls r0, 24
	asrs r1, r0, 24
	movs r0, 0x2
	negs r0, r0
	cmp r1, r0
	beq _081256F2
	adds r0, 0x1
	cmp r1, r0
	bne _081256EC
	movs r0, 0x5
	bl PlaySE
	adds r0, r4, 0
	bl sub_81257D4
	b _081256F2
_081256EC:
	adds r0, r5, 0
	bl sub_8125790
_081256F2:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_81256C0

	thumb_func_start sub_81256F8
sub_81256F8: @ 81256F8
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _08125710 @ =gSpecialVar_ItemId
	ldrh r0, [r0]
	cmp r0, 0xAF
	bne _0812571C
	ldr r0, _08125714 @ =gSaveBlock1Ptr
	ldr r0, [r0]
	ldr r1, _08125718 @ =0x00003108
	adds r0, r1
	b _08125726
	.align 2, 0
_08125710: .4byte gSpecialVar_ItemId
_08125714: .4byte gSaveBlock1Ptr
_08125718: .4byte 0x00003108
_0812571C:
	ldr r1, _0812574C @ =gItemEffectTable
	subs r0, 0xD
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
_08125726:
	ldrb r1, [r0, 0x4]
	movs r0, 0x10
	ands r0, r1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	bne _0812575C
	ldr r0, _08125750 @ =gUnknown_203B0A0
	strh r1, [r0, 0xE]
	ldrb r1, [r0, 0x8]
	movs r0, 0xF
	ands r0, r1
	cmp r0, 0x1
	bne _08125754
	adds r0, r4, 0
	bl sub_8125958
	b _0812577E
	.align 2, 0
_0812574C: .4byte gItemEffectTable
_08125750: .4byte gUnknown_203B0A0
_08125754:
	adds r0, r4, 0
	bl sub_812580C
	b _0812577E
_0812575C:
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x17
	bl sub_8121D0C
	ldr r0, _08125784 @ =gUnknown_203B0A0
	ldrb r0, [r0, 0x9]
	bl sub_81255F0
	ldr r1, _08125788 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0812578C @ =sub_81256C0
	str r1, [r0]
_0812577E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08125784: .4byte gUnknown_203B0A0
_08125788: .4byte gTasks
_0812578C: .4byte sub_81256C0
	thumb_func_end sub_81256F8

	thumb_func_start sub_8125790
sub_8125790: @ 8125790
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _081257C0 @ =gUnknown_203B09C
	ldr r0, [r0]
	adds r0, 0xC
	bl sub_8121CE4
	bl GetMenuCursorPos
	ldr r1, _081257C4 @ =gUnknown_203B0A0
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r1, 0xE]
	ldrb r1, [r1, 0x8]
	movs r0, 0xF
	ands r0, r1
	cmp r0, 0x1
	bne _081257C8
	adds r0, r4, 0
	bl sub_8125958
	b _081257CE
	.align 2, 0
_081257C0: .4byte gUnknown_203B09C
_081257C4: .4byte gUnknown_203B0A0
_081257C8:
	adds r0, r4, 0
	bl sub_812580C
_081257CE:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8125790

	thumb_func_start sub_81257D4
sub_81257D4: @ 81257D4
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08125800 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r0, _08125804 @ =sub_811FB28
	str r0, [r1]
	ldr r0, _08125808 @ =gUnknown_203B09C
	ldr r0, [r0]
	movs r1, 0
	str r1, [r0, 0x4]
	adds r0, 0xC
	bl sub_8121CE4
	movs r0, 0x5
	bl sub_8121D0C
	pop {r0}
	bx r0
	.align 2, 0
_08125800: .4byte gTasks
_08125804: .4byte sub_811FB28
_08125808: .4byte gUnknown_203B09C
	thumb_func_end sub_81257D4

	thumb_func_start sub_812580C
sub_812580C: @ 812580C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r3, _08125860 @ =gUnknown_203B0A0
	movs r1, 0x9
	ldrsb r1, [r3, r1]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08125864 @ =gPlayerParty
	adds r0, r1
	ldr r1, _08125868 @ =gSpecialVar_ItemId
	ldrh r1, [r1]
	ldrb r2, [r3, 0x9]
	ldrb r3, [r3, 0xE]
	bl PokemonUseItemEffects2
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x5
	bl PlaySE
	cmp r4, 0
	beq _0812587C
	ldr r1, _0812586C @ =gUnknown_203B0C0
	movs r0, 0
	strb r0, [r1]
	ldr r0, _08125870 @ =gUnknown_84169DC
	movs r1, 0x1
	bl sub_81202F8
	movs r0, 0x2
	bl schedule_bg_copy_tilemap_to_vram
	ldr r1, _08125874 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldr r1, _08125878 @ =sub_81255BC
	str r1, [r0]
	b _08125888
	.align 2, 0
_08125860: .4byte gUnknown_203B0A0
_08125864: .4byte gPlayerParty
_08125868: .4byte gSpecialVar_ItemId
_0812586C: .4byte gUnknown_203B0C0
_08125870: .4byte gUnknown_84169DC
_08125874: .4byte gTasks
_08125878: .4byte sub_81255BC
_0812587C:
	adds r0, r5, 0
	bl sub_8124DC0
	ldr r1, _08125890 @ =gUnknown_3005E98
	ldr r0, _08125894 @ =sub_8125898
	str r0, [r1]
_08125888:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08125890: .4byte gUnknown_3005E98
_08125894: .4byte sub_8125898
	thumb_func_end sub_812580C

	thumb_func_start sub_8125898
sub_8125898: @ 8125898
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	mov r8, r0
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r5, _08125930 @ =gUnknown_203B0A0
	movs r1, 0x9
	ldrsb r1, [r5, r1]
	movs r0, 0x64
	adds r4, r1, 0
	muls r4, r0
	ldr r0, _08125934 @ =gPlayerParty
	adds r4, r0
	ldrb r0, [r5, 0x9]
	ldr r6, _08125938 @ =gSpecialVar_ItemId
	ldrh r1, [r6]
	ldrb r2, [r5, 0xE]
	bl ExecuteTableBasedItemEffect__
	ldr r1, _0812593C @ =gUnknown_203B0C0
	movs r0, 0x1
	strb r0, [r1]
	ldrh r2, [r6]
	ldr r3, _08125940 @ =0x0000ffff
	movs r0, 0x4
	adds r1, r4, 0
	bl sub_80A2294
	movs r0, 0x1
	bl PlaySE
	ldrh r0, [r6]
	movs r1, 0x1
	bl RemoveBagItem
	movs r2, 0xE
	ldrsh r1, [r5, r2]
	adds r1, 0xD
	adds r0, r4, 0
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	ldr r2, _08125944 @ =gStringVar1
	movs r1, 0xD
	muls r1, r0
	ldr r0, _08125948 @ =gMoveNames
	adds r1, r0
	adds r0, r2, 0
	bl StringCopy
	ldrh r0, [r6]
	bl GetMedicineItemEffectMessage
	ldr r0, _0812594C @ =gStringVar4
	movs r1, 0x1
	bl sub_81202F8
	movs r0, 0x2
	bl schedule_bg_copy_tilemap_to_vram
	ldr r1, _08125950 @ =gTasks
	mov r2, r8
	lsls r0, r2, 2
	add r0, r8
	lsls r0, 3
	adds r0, r1
	ldr r1, _08125954 @ =sub_81255BC
	str r1, [r0]
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08125930: .4byte gUnknown_203B0A0
_08125934: .4byte gPlayerParty
_08125938: .4byte gSpecialVar_ItemId
_0812593C: .4byte gUnknown_203B0C0
_08125940: .4byte 0x0000ffff
_08125944: .4byte gStringVar1
_08125948: .4byte gMoveNames
_0812594C: .4byte gStringVar4
_08125950: .4byte gTasks
_08125954: .4byte sub_81255BC
	thumb_func_end sub_8125898

	thumb_func_start sub_8125958
sub_8125958: @ 8125958
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r6, r0, 24
	movs r4, 0
	ldr r7, _08125990 @ =gUnknown_203B0AE
	ldr r0, _08125994 @ =gSpecialVar_ItemId
	ldrh r5, [r0]
	movs r0, 0xE
	negs r0, r0
	adds r0, r7
	mov r8, r0
	ldrb r0, [r0, 0x9]
	ldrb r2, [r7]
	adds r1, r5, 0
	bl ExecuteTableBasedItemEffect__
	lsls r0, 24
	cmp r0, 0
	beq _081259A0
	ldr r0, _08125998 @ =gUnknown_203B0C0
	strb r4, [r0]
	movs r0, 0x5
	bl PlaySE
	ldr r0, _0812599C @ =gUnknown_84169DC
	b _081259F6
	.align 2, 0
_08125990: .4byte gUnknown_203B0AE
_08125994: .4byte gSpecialVar_ItemId
_08125998: .4byte gUnknown_203B0C0
_0812599C: .4byte gUnknown_84169DC
_081259A0:
	ldr r1, _08125A1C @ =gUnknown_203B0C0
	movs r0, 0x1
	strb r0, [r1]
	mov r0, r8
	movs r1, 0x9
	ldrsb r1, [r0, r1]
	movs r0, 0x64
	adds r4, r1, 0
	muls r4, r0
	ldr r0, _08125A20 @ =gPlayerParty
	adds r4, r0
	ldr r3, _08125A24 @ =0x0000ffff
	movs r0, 0x4
	adds r1, r4, 0
	adds r2, r5, 0
	bl sub_80A2294
	movs r0, 0x1
	bl PlaySE
	adds r0, r5, 0
	movs r1, 0x1
	bl RemoveBagItem
	movs r0, 0
	ldrsh r1, [r7, r0]
	adds r1, 0xD
	adds r0, r4, 0
	bl GetMonData
	lsls r0, 16
	lsrs r4, r0, 16
	ldr r0, _08125A28 @ =gStringVar1
	movs r1, 0xD
	muls r1, r4
	ldr r2, _08125A2C @ =gMoveNames
	adds r1, r2
	bl StringCopy
	adds r0, r5, 0
	bl GetMedicineItemEffectMessage
	ldr r0, _08125A30 @ =gStringVar4
_081259F6:
	movs r1, 0x1
	bl sub_81202F8
	movs r0, 0x2
	bl schedule_bg_copy_tilemap_to_vram
	ldr r1, _08125A34 @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r0, r1
	ldr r1, _08125A38 @ =sub_81255BC
	str r1, [r0]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08125A1C: .4byte gUnknown_203B0C0
_08125A20: .4byte gPlayerParty
_08125A24: .4byte 0x0000ffff
_08125A28: .4byte gStringVar1
_08125A2C: .4byte gMoveNames
_08125A30: .4byte gStringVar4
_08125A34: .4byte gTasks
_08125A38: .4byte sub_81255BC
	thumb_func_end sub_8125958

	thumb_func_start dp05_pp_up
dp05_pp_up: @ 8125A3C
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x18
	bl sub_8121D0C
	ldr r0, _08125A6C @ =gUnknown_203B0A0
	ldrb r0, [r0, 0x9]
	bl sub_81255F0
	ldr r1, _08125A70 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _08125A74 @ =sub_81256C0
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08125A6C: .4byte gUnknown_203B0A0
_08125A70: .4byte gTasks
_08125A74: .4byte sub_81256C0
	thumb_func_end dp05_pp_up

	thumb_func_start ItemIdToBattleMoveId
ItemIdToBattleMoveId: @ 8125A78
	lsls r0, 16
	ldr r1, _08125A88 @ =0xfedf0000
	adds r0, r1
	ldr r1, _08125A8C @ =gUnknown_845A80C
	lsrs r0, 15
	adds r0, r1
	ldrh r0, [r0]
	bx lr
	.align 2, 0
_08125A88: .4byte 0xfedf0000
_08125A8C: .4byte gUnknown_845A80C
	thumb_func_end ItemIdToBattleMoveId

	thumb_func_start sub_8125A90
sub_8125A90: @ 8125A90
	push {lr}
	lsls r0, 16
	lsrs r2, r0, 16
	movs r1, 0
	ldr r3, _08125AAC @ =gUnknown_845A80C
_08125A9A:
	adds r0, r1, 0
	adds r0, 0x32
	lsls r0, 1
	adds r0, r3
	ldrh r0, [r0]
	cmp r0, r2
	bne _08125AB0
	movs r0, 0x1
	b _08125ABC
	.align 2, 0
_08125AAC: .4byte gUnknown_845A80C
_08125AB0:
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x6
	bls _08125A9A
	movs r0, 0
_08125ABC:
	pop {r1}
	bx r1
	thumb_func_end sub_8125A90

	thumb_func_start MonKnowsMove
MonKnowsMove: @ 8125AC0
	push {r4-r6,lr}
	adds r6, r0, 0
	lsls r1, 16
	lsrs r5, r1, 16
	movs r4, 0
_08125ACA:
	adds r1, r4, 0
	adds r1, 0xD
	adds r0, r6, 0
	bl GetMonData
	cmp r0, r5
	bne _08125ADC
	movs r0, 0x1
	b _08125AE8
_08125ADC:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x3
	bls _08125ACA
	movs r0, 0
_08125AE8:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end MonKnowsMove

	thumb_func_start sub_8125AF0
sub_8125AF0: @ 8125AF0
	push {r4,lr}
	adds r1, r0, 0
	ldr r4, _08125B10 @ =gStringVar4
	adds r0, r4, 0
	bl StringExpandPlaceholders
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_81202F8
	movs r0, 0x2
	bl schedule_bg_copy_tilemap_to_vram
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08125B10: .4byte gStringVar4
	thumb_func_end sub_8125AF0

	thumb_func_start sub_8125B14
sub_8125B14: @ 8125B14
	push {r4,lr}
	adds r4, r0, 0
	adds r0, r1, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_8125AF0
	ldr r1, _08125B38 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _08125B3C @ =sub_81255BC
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08125B38: .4byte gTasks
_08125B3C: .4byte sub_81255BC
	thumb_func_end sub_8125B14

	thumb_func_start sub_8125B40
sub_8125B40: @ 8125B40
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r6, r0, 24
	movs r0, 0x5
	bl PlaySE
	ldr r7, _08125BD0 @ =gUnknown_203B0A0
	movs r1, 0x9
	ldrsb r1, [r7, r1]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _08125BD4 @ =gPlayerParty
	adds r4, r1, r0
	movs r0, 0xE
	adds r0, r7
	mov r8, r0
	ldr r0, _08125BD8 @ =gSpecialVar_ItemId
	ldrh r5, [r0]
	ldr r1, _08125BDC @ =gStringVar1
	adds r0, r4, 0
	bl GetMonNickname
	adds r0, r5, 0
	bl ItemIdToBattleMoveId
	strh r0, [r7, 0xE]
	ldr r0, _08125BE0 @ =gStringVar2
	movs r1, 0xE
	ldrsh r2, [r7, r1]
	movs r1, 0xD
	muls r1, r2
	ldr r2, _08125BE4 @ =gMoveNames
	adds r1, r2
	bl StringCopy
	movs r0, 0
	mov r1, r8
	strh r0, [r1, 0x2]
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0
	bl sub_8120B20
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08125BF4
	cmp r0, 0x2
	beq _08125BFC
	ldrh r1, [r7, 0xE]
	adds r0, r4, 0
	bl GiveMoveToMon
	lsls r0, 16
	lsrs r0, 16
	ldr r3, _08125BE8 @ =0x0000ffff
	cmp r0, r3
	beq _08125C0C
	movs r0, 0x4
	adds r1, r4, 0
	adds r2, r5, 0
	bl sub_80A2294
	adds r0, r6, 0
	bl sub_8124DC0
	ldr r1, _08125BEC @ =gUnknown_3005E98
	ldr r0, _08125BF0 @ =sub_8125C38
	str r0, [r1]
	b _08125C20
	.align 2, 0
_08125BD0: .4byte gUnknown_203B0A0
_08125BD4: .4byte gPlayerParty
_08125BD8: .4byte gSpecialVar_ItemId
_08125BDC: .4byte gStringVar1
_08125BE0: .4byte gStringVar2
_08125BE4: .4byte gMoveNames
_08125BE8: .4byte 0x0000ffff
_08125BEC: .4byte gUnknown_3005E98
_08125BF0: .4byte sub_8125C38
_08125BF4:
	ldr r1, _08125BF8 @ =gUnknown_8416DC2
	b _08125BFE
	.align 2, 0
_08125BF8: .4byte gUnknown_8416DC2
_08125BFC:
	ldr r1, _08125C08 @ =gUnknown_8416F10
_08125BFE:
	adds r0, r6, 0
	bl sub_8125B14
	b _08125C20
	.align 2, 0
_08125C08: .4byte gUnknown_8416F10
_08125C0C:
	ldr r0, _08125C2C @ =gUnknown_8416DF7
	bl sub_8125AF0
	ldr r1, _08125C30 @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r0, r1
	ldr r1, _08125C34 @ =sub_8125D88
	str r1, [r0]
_08125C20:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08125C2C: .4byte gUnknown_8416DF7
_08125C30: .4byte gTasks
_08125C34: .4byte sub_8125D88
	thumb_func_end sub_8125B40

	thumb_func_start sub_8125C38
sub_8125C38: @ 8125C38
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl sub_8125C48
	pop {r0}
	bx r0
	thumb_func_end sub_8125C38

	thumb_func_start sub_8125C48
sub_8125C48: @ 8125C48
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r2, _08125CCC @ =gUnknown_203B0A0
	movs r1, 0x9
	ldrsb r1, [r2, r1]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _08125CD0 @ =gPlayerParty
	adds r5, r1, r0
	adds r6, r2, 0
	adds r6, 0xE
	ldr r0, _08125CD4 @ =gSpecialVar_ItemId
	ldrh r4, [r0]
	movs r1, 0x2
	ldrsh r0, [r6, r1]
	cmp r0, 0
	bne _08125C84
	adds r0, r5, 0
	movs r1, 0x4
	bl AdjustFriendship
	movs r0, 0xA9
	lsls r0, 1
	cmp r4, r0
	bhi _08125C84
	adds r0, r4, 0
	movs r1, 0x1
	bl RemoveBagItem
_08125C84:
	ldr r1, _08125CD8 @ =gStringVar1
	adds r0, r5, 0
	bl GetMonNickname
	ldr r0, _08125CDC @ =gStringVar2
	movs r1, 0
	ldrsh r2, [r6, r1]
	movs r1, 0xD
	muls r1, r2
	ldr r2, _08125CE0 @ =gMoveNames
	adds r1, r2
	bl StringCopy
	ldr r4, _08125CE4 @ =gStringVar4
	ldr r1, _08125CE8 @ =gUnknown_8416DB3
	adds r0, r4, 0
	bl StringExpandPlaceholders
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_81202F8
	movs r0, 0x2
	bl schedule_bg_copy_tilemap_to_vram
	ldr r1, _08125CEC @ =gTasks
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r1
	ldr r1, _08125CF0 @ =sub_8125CF4
	str r1, [r0]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08125CCC: .4byte gUnknown_203B0A0
_08125CD0: .4byte gPlayerParty
_08125CD4: .4byte gSpecialVar_ItemId
_08125CD8: .4byte gStringVar1
_08125CDC: .4byte gStringVar2
_08125CE0: .4byte gMoveNames
_08125CE4: .4byte gStringVar4
_08125CE8: .4byte gUnknown_8416DB3
_08125CEC: .4byte gTasks
_08125CF0: .4byte sub_8125CF4
	thumb_func_end sub_8125C48

	thumb_func_start sub_8125CF4
sub_8125CF4: @ 8125CF4
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_8120370
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08125D1A
	ldr r0, _08125D20 @ =0x00000101
	bl PlayFanfare
	ldr r1, _08125D24 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _08125D28 @ =sub_8125D2C
	str r1, [r0]
_08125D1A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08125D20: .4byte 0x00000101
_08125D24: .4byte gTasks
_08125D28: .4byte sub_8125D2C
	thumb_func_end sub_8125CF4

	thumb_func_start sub_8125D2C
sub_8125D2C: @ 8125D2C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r5, r4, 0
	bl IsFanfareTaskInactive
	lsls r0, 24
	cmp r0, 0
	beq _08125D7E
	ldr r0, _08125D68 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r2, 0x1
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0
	bne _08125D54
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08125D7E
_08125D54:
	ldr r0, _08125D6C @ =gUnknown_203B0A0
	movs r1, 0x10
	ldrsh r0, [r0, r1]
	cmp r0, 0x1
	bne _08125D70
	adds r0, r4, 0
	bl sub_81266A0
	b _08125D7E
	.align 2, 0
_08125D68: .4byte gMain
_08125D6C: .4byte gUnknown_203B0A0
_08125D70:
	cmp r0, 0x2
	bne _08125D78
	ldr r0, _08125D84 @ =gSpecialVar_Result
	strh r2, [r0]
_08125D78:
	adds r0, r5, 0
	bl sub_811FA78
_08125D7E:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08125D84: .4byte gSpecialVar_Result
	thumb_func_end sub_8125D2C

	thumb_func_start sub_8125D88
sub_8125D88: @ 8125D88
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_8120370
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08125DAC
	bl sub_812200C
	ldr r0, _08125DB4 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _08125DB8 @ =sub_8125DBC
	str r0, [r1]
_08125DAC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08125DB4: .4byte gTasks
_08125DB8: .4byte sub_8125DBC
	thumb_func_end sub_8125D88

	thumb_func_start sub_8125DBC
sub_8125DBC: @ 8125DBC
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl Menu_ProcessInputNoWrapClearOnChoose
	lsls r0, 24
	asrs r1, r0, 24
	cmp r1, 0
	beq _08125DE2
	cmp r1, 0
	bgt _08125DDC
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _08125E08
	b _08125E14
_08125DDC:
	cmp r1, 0x1
	beq _08125E0E
	b _08125E14
_08125DE2:
	ldr r0, _08125DFC @ =gUnknown_8416EA4
	movs r1, 0x1
	bl sub_81202F8
	ldr r1, _08125E00 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _08125E04 @ =sub_8125E1C
	str r1, [r0]
	b _08125E14
	.align 2, 0
_08125DFC: .4byte gUnknown_8416EA4
_08125E00: .4byte gTasks
_08125E04: .4byte sub_8125E1C
_08125E08:
	movs r0, 0x5
	bl PlaySE
_08125E0E:
	adds r0, r4, 0
	bl sub_81260D8
_08125E14:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8125DBC

	thumb_func_start sub_8125E1C
sub_8125E1C: @ 8125E1C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_8120370
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08125E3C
	ldr r0, _08125E44 @ =gUnknown_203B09C
	ldr r1, [r0]
	ldr r0, _08125E48 @ =sub_8125E4C
	str r0, [r1, 0x4]
	adds r0, r4, 0
	bl sub_811FA78
_08125E3C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08125E44: .4byte gUnknown_203B09C
_08125E48: .4byte sub_8125E4C
	thumb_func_end sub_8125E1C

	thumb_func_start sub_8125E4C
sub_8125E4C: @ 8125E4C
	push {r4,lr}
	sub sp, 0x4
	ldr r0, _08125E74 @ =gPlayerParty
	ldr r4, _08125E78 @ =gUnknown_203B0A0
	ldrb r1, [r4, 0x9]
	ldr r2, _08125E7C @ =gPlayerPartyCount
	ldrb r2, [r2]
	subs r2, 0x1
	lsls r2, 24
	lsrs r2, 24
	ldr r3, _08125E80 @ =sub_8125E84
	ldrh r4, [r4, 0xE]
	str r4, [sp]
	bl sub_8134738
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08125E74: .4byte gPlayerParty
_08125E78: .4byte gUnknown_203B0A0
_08125E7C: .4byte gPlayerPartyCount
_08125E80: .4byte sub_8125E84
	thumb_func_end sub_8125E4C

	thumb_func_start sub_8125E84
sub_8125E84: @ 8125E84
	push {r4,r5,lr}
	sub sp, 0xC
	bl sub_8138B2C
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r4, _08125ED0 @ =gUnknown_203B0A0
	movs r0, 0x10
	ldrsh r5, [r4, r0]
	cmp r5, 0
	bne _08125EE8
	cmp r2, 0x4
	beq _08125EE8
	movs r1, 0x9
	ldrsb r1, [r4, r1]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08125ED4 @ =gPlayerParty
	adds r0, r1
	adds r1, r2, 0
	adds r1, 0xD
	bl GetMonData
	adds r2, r0, 0
	lsls r2, 16
	lsrs r2, 16
	ldrb r0, [r4, 0x9]
	ldr r1, _08125ED8 @ =gSpecialVar_ItemId
	ldrh r1, [r1]
	ldr r3, _08125EDC @ =sub_8124EFC
	bl sub_811C568
	ldr r1, _08125EE0 @ =gUnknown_3005E98
	ldr r0, _08125EE4 @ =sub_8125F4C
	str r0, [r1]
	strb r5, [r4, 0xB]
	b _08125F02
	.align 2, 0
_08125ED0: .4byte gUnknown_203B0A0
_08125ED4: .4byte gPlayerParty
_08125ED8: .4byte gSpecialVar_ItemId
_08125EDC: .4byte sub_8124EFC
_08125EE0: .4byte gUnknown_3005E98
_08125EE4: .4byte sub_8125F4C
_08125EE8:
	movs r0, 0x7F
	str r0, [sp]
	ldr r0, _08125F0C @ =sub_8125F14
	str r0, [sp, 0x4]
	ldr r0, _08125F10 @ =gUnknown_203B0A0
	ldr r0, [r0]
	str r0, [sp, 0x8]
	movs r0, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0x1
	bl sub_811EA44
_08125F02:
	add sp, 0xC
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08125F0C: .4byte sub_8125F14
_08125F10: .4byte gUnknown_203B0A0
	thumb_func_end sub_8125E84

	thumb_func_start sub_8125F14
sub_8125F14: @ 8125F14
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r5, r4, 0
	ldr r0, _08125F3C @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08125F46
	bl sub_8138B2C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	beq _08125F40
	adds r0, r4, 0
	bl sub_8125FFC
	b _08125F46
	.align 2, 0
_08125F3C: .4byte gPaletteFade
_08125F40:
	adds r0, r5, 0
	bl sub_81260D8
_08125F46:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8125F14

	thumb_func_start sub_8125F4C
sub_8125F4C: @ 8125F4C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl sub_8125F5C
	pop {r0}
	bx r0
	thumb_func_end sub_8125F4C

	thumb_func_start sub_8125F5C
sub_8125F5C: @ 8125F5C
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	mov r8, r0
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r0, _08125FE4 @ =gUnknown_203B0A0
	mov r9, r0
	movs r1, 0x9
	ldrsb r1, [r0, r1]
	movs r0, 0x64
	adds r6, r1, 0
	muls r6, r0
	ldr r0, _08125FE8 @ =gPlayerParty
	adds r6, r0
	bl sub_8138B2C
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	adds r1, r5, 0
	adds r1, 0xD
	adds r0, r6, 0
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	ldr r0, _08125FEC @ =gSpecialVar_ItemId
	ldrh r2, [r0]
	movs r0, 0x4
	adds r1, r6, 0
	adds r3, r4, 0
	bl sub_80A2294
	ldr r1, _08125FF0 @ =gStringVar1
	adds r0, r6, 0
	bl GetMonNickname
	ldr r0, _08125FF4 @ =gStringVar2
	movs r1, 0xD
	muls r1, r4
	ldr r2, _08125FF8 @ =gMoveNames
	adds r1, r2
	bl StringCopy
	adds r0, r6, 0
	adds r1, r5, 0
	bl RemoveMonPPBonus
	mov r0, r9
	ldrh r1, [r0, 0xE]
	adds r0, r6, 0
	adds r2, r5, 0
	bl SetMonMoveSlot
	mov r0, r8
	bl sub_8125C48
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08125FE4: .4byte gUnknown_203B0A0
_08125FE8: .4byte gPlayerParty
_08125FEC: .4byte gSpecialVar_ItemId
_08125FF0: .4byte gStringVar1
_08125FF4: .4byte gStringVar2
_08125FF8: .4byte gMoveNames
	thumb_func_end sub_8125F5C

	thumb_func_start sub_8125FFC
sub_8125FFC: @ 8125FFC
	push {r4-r6,lr}
	adds r6, r0, 0
	lsls r6, 24
	lsrs r6, 24
	ldr r0, _0812605C @ =gUnknown_203B0A0
	movs r1, 0x9
	ldrsb r1, [r0, r1]
	movs r0, 0x64
	adds r5, r1, 0
	muls r5, r0
	ldr r0, _08126060 @ =gPlayerParty
	adds r5, r0
	bl sub_8138B2C
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r1, 0xD
	adds r0, r5, 0
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	ldr r1, _08126064 @ =gStringVar1
	adds r0, r5, 0
	bl GetMonNickname
	ldr r0, _08126068 @ =gStringVar2
	movs r1, 0xD
	muls r1, r4
	ldr r2, _0812606C @ =gMoveNames
	adds r1, r2
	bl StringCopy
	ldr r0, _08126070 @ =gUnknown_8416EC6
	bl sub_8125AF0
	ldr r1, _08126074 @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r0, r1
	ldr r1, _08126078 @ =sub_812607C
	str r1, [r0]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0812605C: .4byte gUnknown_203B0A0
_08126060: .4byte gPlayerParty
_08126064: .4byte gStringVar1
_08126068: .4byte gStringVar2
_0812606C: .4byte gMoveNames
_08126070: .4byte gUnknown_8416EC6
_08126074: .4byte gTasks
_08126078: .4byte sub_812607C
	thumb_func_end sub_8125FFC

	thumb_func_start sub_812607C
sub_812607C: @ 812607C
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	bl sub_8120370
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _081260C8
	ldr r5, _081260D0 @ =gUnknown_203B0A0
	movs r1, 0x9
	ldrsb r1, [r5, r1]
	movs r0, 0x64
	adds r4, r1, 0
	muls r4, r0
	ldr r0, _081260D4 @ =gPlayerParty
	adds r4, r0
	bl sub_8138B2C
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl RemoveMonPPBonus
	ldrh r5, [r5, 0xE]
	bl sub_8138B2C
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl SetMonMoveSlot
	adds r0, r6, 0
	bl sub_8125C48
_081260C8:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081260D0: .4byte gUnknown_203B0A0
_081260D4: .4byte gPlayerParty
	thumb_func_end sub_812607C

	thumb_func_start sub_81260D8
sub_81260D8: @ 81260D8
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldr r0, _08126120 @ =gStringVar2
	ldr r1, _08126124 @ =gUnknown_203B0A0
	movs r3, 0xE
	ldrsh r2, [r1, r3]
	movs r1, 0xD
	muls r1, r2
	ldr r2, _08126128 @ =gMoveNames
	adds r1, r2
	bl StringCopy
	ldr r4, _0812612C @ =gStringVar4
	ldr r1, _08126130 @ =gUnknown_8416E6B
	adds r0, r4, 0
	bl StringExpandPlaceholders
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_81202F8
	movs r0, 0x2
	bl schedule_bg_copy_tilemap_to_vram
	ldr r1, _08126134 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldr r1, _08126138 @ =sub_812613C
	str r1, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08126120: .4byte gStringVar2
_08126124: .4byte gUnknown_203B0A0
_08126128: .4byte gMoveNames
_0812612C: .4byte gStringVar4
_08126130: .4byte gUnknown_8416E6B
_08126134: .4byte gTasks
_08126138: .4byte sub_812613C
	thumb_func_end sub_81260D8

	thumb_func_start sub_812613C
sub_812613C: @ 812613C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_8120370
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08126160
	bl sub_812200C
	ldr r0, _08126168 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _0812616C @ =sub_8126170
	str r0, [r1]
_08126160:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08126168: .4byte gTasks
_0812616C: .4byte sub_8126170
	thumb_func_end sub_812613C

	thumb_func_start sub_8126170
sub_8126170: @ 8126170
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r7, _081261A0 @ =gUnknown_203B0A0
	movs r1, 0x9
	ldrsb r1, [r7, r1]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _081261A4 @ =gPlayerParty
	adds r4, r1, r0
	bl Menu_ProcessInputNoWrapClearOnChoose
	lsls r0, 24
	asrs r5, r0, 24
	cmp r5, 0
	beq _081261AE
	cmp r5, 0
	bgt _081261A8
	movs r0, 0x1
	negs r0, r0
	cmp r5, r0
	beq _08126234
	b _0812626A
	.align 2, 0
_081261A0: .4byte gUnknown_203B0A0
_081261A4: .4byte gPlayerParty
_081261A8:
	cmp r5, 0x1
	beq _0812623A
	b _0812626A
_081261AE:
	ldr r1, _081261F4 @ =gStringVar1
	adds r0, r4, 0
	bl GetMonNickname
	ldr r0, _081261F8 @ =gStringVar2
	movs r1, 0xE
	ldrsh r2, [r7, r1]
	movs r1, 0xD
	muls r1, r2
	ldr r2, _081261FC @ =gMoveNames
	adds r1, r2
	bl StringCopy
	ldr r4, _08126200 @ =gStringVar4
	ldr r1, _08126204 @ =gUnknown_8416E84
	adds r0, r4, 0
	bl StringExpandPlaceholders
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_81202F8
	movs r3, 0x10
	ldrsh r0, [r7, r3]
	cmp r0, 0x1
	bne _08126210
	ldr r0, _08126208 @ =gTasks
	lsls r1, r6, 2
	adds r1, r6
	lsls r1, 3
	adds r1, r0
	ldr r0, _0812620C @ =sub_812628C
	str r0, [r1]
	b _0812626A
	.align 2, 0
_081261F4: .4byte gStringVar1
_081261F8: .4byte gStringVar2
_081261FC: .4byte gMoveNames
_08126200: .4byte gStringVar4
_08126204: .4byte gUnknown_8416E84
_08126208: .4byte gTasks
_0812620C: .4byte sub_812628C
_08126210:
	cmp r0, 0x2
	bne _08126218
	ldr r0, _08126228 @ =gSpecialVar_Result
	strh r5, [r0]
_08126218:
	ldr r0, _0812622C @ =gTasks
	lsls r1, r6, 2
	adds r1, r6
	lsls r1, 3
	adds r1, r0
	ldr r0, _08126230 @ =sub_81255BC
	str r0, [r1]
	b _0812626A
	.align 2, 0
_08126228: .4byte gSpecialVar_Result
_0812622C: .4byte gTasks
_08126230: .4byte sub_81255BC
_08126234:
	movs r0, 0x5
	bl PlaySE
_0812623A:
	ldr r1, _08126270 @ =gStringVar1
	adds r0, r4, 0
	bl GetMonNickname
	ldr r0, _08126274 @ =gStringVar2
	ldr r1, _08126278 @ =gUnknown_203B0A0
	movs r3, 0xE
	ldrsh r2, [r1, r3]
	movs r1, 0xD
	muls r1, r2
	ldr r2, _0812627C @ =gMoveNames
	adds r1, r2
	bl StringCopy
	ldr r0, _08126280 @ =gUnknown_8416DF7
	bl sub_8125AF0
	ldr r1, _08126284 @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r0, r1
	ldr r1, _08126288 @ =sub_8125D88
	str r1, [r0]
_0812626A:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08126270: .4byte gStringVar1
_08126274: .4byte gStringVar2
_08126278: .4byte gUnknown_203B0A0
_0812627C: .4byte gMoveNames
_08126280: .4byte gUnknown_8416DF7
_08126284: .4byte gTasks
_08126288: .4byte sub_8125D88
	thumb_func_end sub_8126170

	thumb_func_start sub_812628C
sub_812628C: @ 812628C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_8120370
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _081262A4
	adds r0, r4, 0
	bl sub_81266A0
_081262A4:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_812628C

	thumb_func_start dp05_rare_candy
dp05_rare_candy: @ 81262AC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	mov r8, r1
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r7, _081262E8 @ =gUnknown_203B0A0
	movs r1, 0x9
	ldrsb r1, [r7, r1]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _081262EC @ =gPlayerParty
	adds r4, r1, r0
	ldr r0, _081262F0 @ =gSpecialVar_ItemId
	ldrh r5, [r0]
	adds r0, r4, 0
	movs r1, 0x38
	bl GetMonData
	cmp r0, 0x64
	beq _081262F4
	ldrb r2, [r7, 0x9]
	adds r0, r4, 0
	adds r1, r5, 0
	movs r3, 0
	bl PokemonUseItemEffects2
	lsls r0, 24
	lsrs r4, r0, 24
	b _081262F6
	.align 2, 0
_081262E8: .4byte gUnknown_203B0A0
_081262EC: .4byte gPlayerParty
_081262F0: .4byte gSpecialVar_ItemId
_081262F4:
	movs r4, 0x1
_081262F6:
	movs r0, 0x5
	bl PlaySE
	cmp r4, 0
	beq _08126330
	ldr r1, _08126324 @ =gUnknown_203B0C0
	movs r0, 0
	strb r0, [r1]
	ldr r0, _08126328 @ =gUnknown_84169DC
	movs r1, 0x1
	bl sub_81202F8
	movs r0, 0x2
	bl schedule_bg_copy_tilemap_to_vram
	ldr r1, _0812632C @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r0, r1
	mov r1, r8
	str r1, [r0]
	b _0812633C
	.align 2, 0
_08126324: .4byte gUnknown_203B0C0
_08126328: .4byte gUnknown_84169DC
_0812632C: .4byte gTasks
_08126330:
	adds r0, r6, 0
	bl sub_8124DC0
	ldr r1, _08126348 @ =gUnknown_3005E98
	ldr r0, _0812634C @ =sub_8126350
	str r0, [r1]
_0812633C:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08126348: .4byte gUnknown_3005E98
_0812634C: .4byte sub_8126350
	thumb_func_end dp05_rare_candy

	thumb_func_start sub_8126350
sub_8126350: @ 8126350
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r6, _08126410 @ =gUnknown_203B0A0
	movs r1, 0x9
	ldrsb r1, [r6, r1]
	movs r0, 0x64
	adds r4, r1, 0
	muls r4, r0
	ldr r0, _08126414 @ =gPlayerParty
	adds r4, r0
	ldr r0, _08126418 @ =gUnknown_203B09C
	ldr r7, [r0]
	movs r2, 0x86
	lsls r2, 2
	adds r1, r7, r2
	adds r0, r4, 0
	bl sub_811D130
	ldrb r0, [r6, 0x9]
	ldr r5, _0812641C @ =gSpecialVar_ItemId
	ldrh r1, [r5]
	movs r2, 0
	bl ExecuteTableBasedItemEffect__
	movs r0, 0x89
	lsls r0, 2
	adds r1, r7, r0
	adds r0, r4, 0
	bl sub_811D130
	ldr r1, _08126420 @ =gUnknown_203B0C0
	movs r0, 0x1
	strb r0, [r1]
	ldrh r2, [r5]
	ldr r3, _08126424 @ =0x0000ffff
	movs r0, 0x4
	adds r1, r4, 0
	bl sub_80A2294
	movs r0, 0
	bl PlayFanfareByFanfareNum
	ldrb r0, [r6, 0x9]
	adds r1, r4, 0
	bl sub_8126440
	ldrh r0, [r5]
	movs r1, 0x1
	bl RemoveBagItem
	ldr r1, _08126428 @ =gStringVar1
	adds r0, r4, 0
	bl GetMonNickname
	adds r0, r4, 0
	movs r1, 0x38
	bl GetMonData
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r0, _0812642C @ =gStringVar2
	movs r2, 0
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	ldr r4, _08126430 @ =gStringVar4
	ldr r1, _08126434 @ =gUnknown_8417017
	adds r0, r4, 0
	bl StringExpandPlaceholders
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_81202F8
	movs r0, 0x2
	bl schedule_bg_copy_tilemap_to_vram
	ldr r1, _08126438 @ =gTasks
	mov r2, r8
	lsls r0, r2, 2
	add r0, r8
	lsls r0, 3
	adds r0, r1
	ldr r1, _0812643C @ =sub_81264C8
	str r1, [r0]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08126410: .4byte gUnknown_203B0A0
_08126414: .4byte gPlayerParty
_08126418: .4byte gUnknown_203B09C
_0812641C: .4byte gSpecialVar_ItemId
_08126420: .4byte gUnknown_203B0C0
_08126424: .4byte 0x0000ffff
_08126428: .4byte gStringVar1
_0812642C: .4byte gStringVar2
_08126430: .4byte gStringVar4
_08126434: .4byte gUnknown_8417017
_08126438: .4byte gTasks
_0812643C: .4byte sub_81264C8
	thumb_func_end sub_8126350

	thumb_func_start sub_8126440
sub_8126440: @ 8126440
	push {r4-r7,lr}
	adds r5, r1, 0
	lsls r0, 24
	lsrs r0, 24
	adds r7, r0, 0
	ldr r6, _081264C0 @ =gUnknown_203B0B4
	lsls r4, r7, 4
	ldr r1, [r6]
	adds r1, r4
	adds r0, r5, 0
	bl party_menu_get_status_condition_and_update_object
	ldr r2, _081264C4 @ =gSprites
	ldr r0, [r6]
	adds r3, r4, r0
	ldrb r1, [r3, 0xC]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x3E
	ldrb r0, [r0]
	lsls r0, 29
	cmp r0, 0
	bge _0812647C
	adds r0, r5, 0
	adds r1, r3, 0
	movs r2, 0x1
	bl sub_8121790
_0812647C:
	ldr r1, [r6]
	adds r1, r4
	adds r0, r5, 0
	movs r2, 0x1
	bl sub_812199C
	ldr r1, [r6]
	adds r1, r4
	adds r0, r5, 0
	movs r2, 0x1
	bl sub_8121A3C
	ldr r1, [r6]
	adds r1, r4
	adds r0, r5, 0
	bl sub_8121AF0
	ldr r0, [r6]
	adds r0, r4, r0
	ldrb r0, [r0, 0x9]
	adds r1, r5, 0
	bl sub_8122358
	adds r0, r7, 0
	movs r1, 0x1
	bl sub_811F818
	movs r0, 0
	bl schedule_bg_copy_tilemap_to_vram
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081264C0: .4byte gUnknown_203B0B4
_081264C4: .4byte gSprites
	thumb_func_end sub_8126440

	thumb_func_start sub_81264C8
sub_81264C8: @ 81264C8
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	movs r0, 0
	bl WaitFanfare
	lsls r0, 24
	cmp r0, 0
	beq _08126514
	bl sub_8120370
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08126514
	ldr r0, _0812651C @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _081264FA
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08126514
_081264FA:
	movs r0, 0x5
	bl PlaySE
	adds r0, r4, 0
	bl sub_8126570
	ldr r0, _08126520 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _08126524 @ =sub_8126528
	str r0, [r1]
_08126514:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812651C: .4byte gMain
_08126520: .4byte gTasks
_08126524: .4byte sub_8126528
	thumb_func_end sub_81264C8

	thumb_func_start sub_8126528
sub_8126528: @ 8126528
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _08126564 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _08126542
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0812655C
_08126542:
	movs r0, 0x5
	bl PlaySE
	adds r0, r4, 0
	bl sub_81265BC
	ldr r0, _08126568 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _0812656C @ =sub_81265F8
	str r0, [r1]
_0812655C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08126564: .4byte gMain
_08126568: .4byte gTasks
_0812656C: .4byte sub_81265F8
	thumb_func_end sub_8126528

	thumb_func_start sub_8126570
sub_8126570: @ 8126570
	push {r4,r5,lr}
	sub sp, 0x8
	ldr r0, _081265B8 @ =gUnknown_203B09C
	ldr r5, [r0]
	movs r0, 0x86
	lsls r0, 2
	adds r4, r5, r0
	bl sub_8122034
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x18]
	ldrh r0, [r4, 0x18]
	movs r1, 0x89
	lsls r1, 2
	adds r2, r5, r1
	movs r1, 0x2
	str r1, [sp]
	movs r1, 0x3
	str r1, [sp, 0x4]
	adds r1, r4, 0
	movs r3, 0x1
	bl sub_811E7F0
	ldrb r0, [r4, 0x18]
	movs r1, 0x2
	bl CopyWindowToVram
	movs r0, 0x2
	bl schedule_bg_copy_tilemap_to_vram
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_081265B8: .4byte gUnknown_203B09C
	thumb_func_end sub_8126570

	thumb_func_start sub_81265BC
sub_81265BC: @ 81265BC
	push {r4,lr}
	sub sp, 0x4
	ldr r0, _081265F4 @ =gUnknown_203B09C
	ldr r1, [r0]
	movs r0, 0x86
	lsls r0, 2
	adds r4, r1, r0
	ldrh r0, [r4, 0x18]
	movs r2, 0x89
	lsls r2, 2
	adds r1, r2
	movs r2, 0x3
	str r2, [sp]
	movs r2, 0x1
	movs r3, 0x2
	bl sub_811E93C
	ldrb r0, [r4, 0x18]
	movs r1, 0x2
	bl CopyWindowToVram
	movs r0, 0x2
	bl schedule_bg_copy_tilemap_to_vram
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081265F4: .4byte gUnknown_203B09C
	thumb_func_end sub_81265BC

	thumb_func_start sub_81265F8
sub_81265F8: @ 81265F8
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	movs r0, 0
	bl WaitFanfare
	lsls r0, 24
	cmp r0, 0
	beq _0812669A
	ldr r0, _08126650 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r6, 0x1
	adds r0, r6, 0
	ands r0, r1
	cmp r0, 0
	bne _08126620
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0812669A
_08126620:
	bl sub_8122064
	ldr r4, _08126654 @ =gUnknown_203B0A0
	movs r1, 0x9
	ldrsb r1, [r4, r1]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08126658 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x1
	bl MonTryLearningNewMove
	lsls r0, 16
	lsrs r1, r0, 16
	strh r6, [r4, 0x10]
	ldr r0, _0812665C @ =0x0000fffe
	cmp r1, r0
	beq _0812667C
	cmp r1, r0
	bgt _08126660
	cmp r1, 0
	beq _0812666C
	b _08126694
	.align 2, 0
_08126650: .4byte gMain
_08126654: .4byte gUnknown_203B0A0
_08126658: .4byte gPlayerParty
_0812665C: .4byte 0x0000fffe
_08126660:
	ldr r0, _08126668 @ =0x0000ffff
	cmp r1, r0
	beq _08126674
	b _08126694
	.align 2, 0
_08126668: .4byte 0x0000ffff
_0812666C:
	adds r0, r5, 0
	bl sub_8126704
	b _0812669A
_08126674:
	adds r0, r5, 0
	bl sub_8126770
	b _0812669A
_0812667C:
	ldr r0, _0812668C @ =gTasks
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	ldr r0, _08126690 @ =sub_81266A0
	str r0, [r1]
	b _0812669A
	.align 2, 0
_0812668C: .4byte gTasks
_08126690: .4byte sub_81266A0
_08126694:
	adds r0, r5, 0
	bl sub_8126804
_0812669A:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_81265F8

	thumb_func_start sub_81266A0
sub_81266A0: @ 81266A0
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _081266D0 @ =gUnknown_203B0A0
	movs r1, 0x9
	ldrsb r1, [r0, r1]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _081266D4 @ =gPlayerParty
	adds r0, r1
	movs r1, 0
	bl MonTryLearningNewMove
	lsls r0, 16
	lsrs r1, r0, 16
	ldr r0, _081266D8 @ =0x0000fffe
	cmp r1, r0
	beq _081266FE
	cmp r1, r0
	bgt _081266DC
	cmp r1, 0
	beq _081266E8
	b _081266F8
	.align 2, 0
_081266D0: .4byte gUnknown_203B0A0
_081266D4: .4byte gPlayerParty
_081266D8: .4byte 0x0000fffe
_081266DC:
	ldr r0, _081266E4 @ =0x0000ffff
	cmp r1, r0
	beq _081266F0
	b _081266F8
	.align 2, 0
_081266E4: .4byte 0x0000ffff
_081266E8:
	adds r0, r4, 0
	bl sub_8126704
	b _081266FE
_081266F0:
	adds r0, r4, 0
	bl sub_8126770
	b _081266FE
_081266F8:
	adds r0, r4, 0
	bl sub_8126804
_081266FE:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_81266A0

	thumb_func_start sub_8126704
sub_8126704: @ 8126704
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r6, _08126748 @ =gUnknown_203B0A0
	movs r1, 0x9
	ldrsb r1, [r6, r1]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _0812674C @ =gPlayerParty
	adds r7, r1, r0
	adds r0, r7, 0
	movs r1, 0
	movs r2, 0
	bl GetEvolutionTargetSpecies
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0
	beq _08126754
	bl sub_811F070
	ldr r0, _08126750 @ =gUnknown_300537C
	ldr r1, [r6]
	str r1, [r0]
	ldrb r3, [r6, 0x9]
	adds r0, r7, 0
	adds r1, r4, 0
	movs r2, 0x1
	bl BeginEvolutionScene
	adds r0, r5, 0
	bl DestroyTask
	b _08126762
	.align 2, 0
_08126748: .4byte gUnknown_203B0A0
_0812674C: .4byte gPlayerParty
_08126750: .4byte gUnknown_300537C
_08126754:
	ldr r0, _08126768 @ =gTasks
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	ldr r0, _0812676C @ =sub_81255BC
	str r0, [r1]
_08126762:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08126768: .4byte gTasks
_0812676C: .4byte sub_81255BC
	thumb_func_end sub_8126704

	thumb_func_start sub_8126770
sub_8126770: @ 8126770
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldr r0, _081267DC @ =gUnknown_203B0A0
	mov r8, r0
	movs r1, 0x9
	ldrsb r1, [r0, r1]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _081267E0 @ =gPlayerParty
	adds r0, r1
	ldr r1, _081267E4 @ =gStringVar1
	bl GetMonNickname
	ldr r0, _081267E8 @ =gStringVar2
	ldr r6, _081267EC @ =gMoveToLearn
	ldrh r2, [r6]
	movs r1, 0xD
	muls r1, r2
	ldr r2, _081267F0 @ =gMoveNames
	adds r1, r2
	bl StringCopy
	ldr r4, _081267F4 @ =gStringVar4
	ldr r1, _081267F8 @ =gUnknown_8416DF7
	adds r0, r4, 0
	bl StringExpandPlaceholders
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_81202F8
	movs r0, 0x2
	bl schedule_bg_copy_tilemap_to_vram
	ldrh r0, [r6]
	mov r1, r8
	strh r0, [r1, 0xE]
	ldr r1, _081267FC @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldr r1, _08126800 @ =sub_8125D88
	str r1, [r0]
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081267DC: .4byte gUnknown_203B0A0
_081267E0: .4byte gPlayerParty
_081267E4: .4byte gStringVar1
_081267E8: .4byte gStringVar2
_081267EC: .4byte gMoveToLearn
_081267F0: .4byte gMoveNames
_081267F4: .4byte gStringVar4
_081267F8: .4byte gUnknown_8416DF7
_081267FC: .4byte gTasks
_08126800: .4byte sub_8125D88
	thumb_func_end sub_8126770

	thumb_func_start sub_8126804
sub_8126804: @ 8126804
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	adds r6, r0, 0
	adds r5, r1, 0
	lsls r6, 24
	lsrs r6, 24
	lsls r5, 16
	lsrs r5, 16
	ldr r0, _08126870 @ =gUnknown_203B0A0
	mov r8, r0
	movs r1, 0x9
	ldrsb r1, [r0, r1]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08126874 @ =gPlayerParty
	adds r0, r1
	ldr r1, _08126878 @ =gStringVar1
	bl GetMonNickname
	ldr r0, _0812687C @ =gStringVar2
	movs r1, 0xD
	muls r1, r5
	ldr r2, _08126880 @ =gMoveNames
	adds r1, r2
	bl StringCopy
	ldr r4, _08126884 @ =gStringVar4
	ldr r1, _08126888 @ =gUnknown_8416DB3
	adds r0, r4, 0
	bl StringExpandPlaceholders
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_81202F8
	movs r0, 0x2
	bl schedule_bg_copy_tilemap_to_vram
	mov r0, r8
	strh r5, [r0, 0xE]
	ldr r1, _0812688C @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r0, r1
	ldr r1, _08126890 @ =sub_8125CF4
	str r1, [r0]
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08126870: .4byte gUnknown_203B0A0
_08126874: .4byte gPlayerParty
_08126878: .4byte gStringVar1
_0812687C: .4byte gStringVar2
_08126880: .4byte gMoveNames
_08126884: .4byte gStringVar4
_08126888: .4byte gUnknown_8416DB3
_0812688C: .4byte gTasks
_08126890: .4byte sub_8125CF4
	thumb_func_end sub_8126804

	thumb_func_start sub_8126894
sub_8126894: @ 8126894
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _081268C8 @ =gUnknown_203B09C
	ldr r2, [r1]
	movs r3, 0x86
	lsls r3, 2
	adds r1, r2, r3
	movs r3, 0
	strh r3, [r1]
	ldr r4, _081268CC @ =0x0000021a
	adds r1, r2, r4
	strh r3, [r1]
	ldr r1, _081268D0 @ =gUnknown_203B0A0
	ldrb r1, [r1, 0x9]
	lsls r1, 24
	asrs r1, 24
	movs r3, 0x87
	lsls r3, 2
	adds r2, r3
	strh r1, [r2]
	bl sub_81268D4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081268C8: .4byte gUnknown_203B09C
_081268CC: .4byte 0x0000021a
_081268D0: .4byte gUnknown_203B0A0
	thumb_func_end sub_8126894

	thumb_func_start sub_81268D4
sub_81268D4: @ 81268D4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
	mov r9, r4
	ldr r6, _08126930 @ =gUnknown_203B0A0
	movs r1, 0x9
	ldrsb r1, [r6, r1]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _08126934 @ =gPlayerParty
	adds r5, r1, r0
	adds r0, r5, 0
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _08126920
	adds r0, r5, 0
	movs r1, 0x39
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	ldrb r0, [r6, 0x9]
	ldr r1, _08126938 @ =gSpecialVar_ItemId
	ldrh r1, [r1]
	movs r2, 0
	bl ExecuteTableBasedItemEffect__
	lsls r0, 24
	cmp r0, 0
	beq _08126944
_08126920:
	ldr r0, _0812693C @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _08126940 @ =sub_8126A18
	str r0, [r1]
	b _081269EE
	.align 2, 0
_08126930: .4byte gUnknown_203B0A0
_08126934: .4byte gPlayerParty
_08126938: .4byte gSpecialVar_ItemId
_0812693C: .4byte gTasks
_08126940: .4byte sub_8126A18
_08126944:
	movs r0, 0x1
	bl PlaySE
	ldr r7, _08126A00 @ =gUnknown_203B09C
	ldr r0, [r7]
	ldr r1, _08126A04 @ =0x0000021a
	mov r10, r1
	add r0, r10
	movs r2, 0
	ldrsh r0, [r0, r2]
	cmp r0, 0
	bne _08126960
	ldr r0, _08126A08 @ =gUnknown_203B0D0
	str r5, [r0]
_08126960:
	ldr r4, _08126A0C @ =gUnknown_203B0B4
	movs r0, 0x9
	ldrsb r0, [r6, r0]
	lsls r0, 4
	ldr r1, [r4]
	adds r1, r0
	adds r0, r5, 0
	bl party_menu_get_status_condition_and_update_object
	ldr r2, _08126A10 @ =gSprites
	movs r0, 0x9
	ldrsb r0, [r6, r0]
	ldr r1, [r4]
	lsls r0, 4
	adds r3, r0, r1
	ldrb r1, [r3, 0xC]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x3E
	ldrb r0, [r0]
	lsls r0, 29
	cmp r0, 0
	bge _0812699C
	adds r0, r5, 0
	adds r1, r3, 0
	movs r2, 0x1
	bl sub_8121790
_0812699C:
	ldr r0, [r7]
	movs r1, 0x87
	lsls r1, 2
	adds r0, r1
	ldrb r0, [r0]
	movs r1, 0
	bl sub_811F818
	ldrb r0, [r6, 0x9]
	movs r1, 0x1
	bl sub_811F818
	adds r0, r5, 0
	movs r1, 0x39
	bl GetMonData
	adds r3, r0, 0
	mov r2, r8
	subs r3, r2
	lsls r3, 16
	asrs r3, 16
	ldrb r1, [r6, 0x9]
	ldr r0, _08126A14 @ =sub_8126AFC
	str r0, [sp]
	mov r0, r9
	movs r2, 0x1
	bl sub_8120760
	mov r0, r9
	movs r1, 0
	mov r2, r8
	bl sub_81207F0
	ldr r0, [r7]
	movs r2, 0x86
	lsls r2, 2
	adds r1, r0, r2
	movs r2, 0x1
	strh r2, [r1]
	add r0, r10
	strh r2, [r0]
_081269EE:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08126A00: .4byte gUnknown_203B09C
_08126A04: .4byte 0x0000021a
_08126A08: .4byte gUnknown_203B0D0
_08126A0C: .4byte gUnknown_203B0B4
_08126A10: .4byte gSprites
_08126A14: .4byte sub_8126AFC
	thumb_func_end sub_81268D4

	thumb_func_start sub_8126A18
sub_8126A18: @ 8126A18
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_8120370
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08126AF6
	ldr r5, _08126A80 @ =gUnknown_203B09C
	ldr r2, [r5]
	movs r0, 0x86
	lsls r0, 2
	adds r1, r2, r0
	movs r3, 0
	ldrsh r0, [r1, r3]
	ldr r3, _08126A84 @ =gUnknown_203B0A0
	cmp r0, 0x1
	bne _08126A4E
	movs r0, 0
	strh r0, [r1]
	movs r1, 0x9
	ldrsb r1, [r3, r1]
	movs r6, 0x87
	lsls r6, 2
	adds r0, r2, r6
	strh r1, [r0]
_08126A4E:
	adds r1, r3, 0
	ldrb r0, [r1, 0x9]
	adds r0, 0x1
	strb r0, [r1, 0x9]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0x6
	bne _08126AF0
	ldr r0, [r5]
	ldr r1, _08126A88 @ =0x0000021a
	adds r0, r1
	movs r2, 0
	ldrsh r1, [r0, r2]
	cmp r1, 0
	bne _08126A94
	ldr r0, _08126A8C @ =gUnknown_203B0C0
	strb r1, [r0]
	ldr r0, _08126A90 @ =gUnknown_84169DC
	movs r1, 0x1
	bl sub_81202F8
	movs r0, 0x2
	bl schedule_bg_copy_tilemap_to_vram
	b _08126ABE
	.align 2, 0
_08126A80: .4byte gUnknown_203B09C
_08126A84: .4byte gUnknown_203B0A0
_08126A88: .4byte 0x0000021a
_08126A8C: .4byte gUnknown_203B0C0
_08126A90: .4byte gUnknown_84169DC
_08126A94:
	ldr r1, _08126AD4 @ =gUnknown_203B0C0
	movs r0, 0x1
	strb r0, [r1]
	ldrb r1, [r3, 0x8]
	movs r0, 0xF
	ands r0, r1
	cmp r0, 0x1
	beq _08126AB4
	ldr r0, _08126AD8 @ =gUnknown_203B0D0
	ldr r1, [r0]
	ldr r0, _08126ADC @ =gSpecialVar_ItemId
	ldrh r2, [r0]
	ldr r3, _08126AE0 @ =0x0000ffff
	movs r0, 0x4
	bl sub_80A2294
_08126AB4:
	ldr r0, _08126ADC @ =gSpecialVar_ItemId
	ldrh r0, [r0]
	movs r1, 0x1
	bl RemoveBagItem
_08126ABE:
	ldr r1, _08126AE4 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _08126AE8 @ =sub_81255BC
	str r1, [r0]
	ldr r1, _08126AEC @ =gUnknown_203B0A0
	movs r0, 0
	strb r0, [r1, 0x9]
	b _08126AF6
	.align 2, 0
_08126AD4: .4byte gUnknown_203B0C0
_08126AD8: .4byte gUnknown_203B0D0
_08126ADC: .4byte gSpecialVar_ItemId
_08126AE0: .4byte 0x0000ffff
_08126AE4: .4byte gTasks
_08126AE8: .4byte sub_81255BC
_08126AEC: .4byte gUnknown_203B0A0
_08126AF0:
	adds r0, r4, 0
	bl sub_81268D4
_08126AF6:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8126A18

	thumb_func_start sub_8126AFC
sub_8126AFC: @ 8126AFC
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldr r0, _08126B44 @ =gUnknown_203B0A0
	movs r1, 0x9
	ldrsb r1, [r0, r1]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08126B48 @ =gPlayerParty
	adds r0, r1
	ldr r1, _08126B4C @ =gStringVar1
	bl GetMonNickname
	ldr r4, _08126B50 @ =gStringVar4
	ldr r1, _08126B54 @ =gUnknown_8416F27
	adds r0, r4, 0
	bl StringExpandPlaceholders
	adds r0, r4, 0
	movs r1, 0
	bl sub_81202F8
	movs r0, 0x2
	bl schedule_bg_copy_tilemap_to_vram
	ldr r1, _08126B58 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldr r1, _08126B5C @ =sub_8126A18
	str r1, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08126B44: .4byte gUnknown_203B0A0
_08126B48: .4byte gPlayerParty
_08126B4C: .4byte gStringVar1
_08126B50: .4byte gStringVar4
_08126B54: .4byte gUnknown_8416F27
_08126B58: .4byte gTasks
_08126B5C: .4byte sub_8126A18
	thumb_func_end sub_8126AFC

	thumb_func_start sub_8126B60
sub_8126B60: @ 8126B60
	push {r4,r5,lr}
	adds r5, r1, 0
	lsls r0, 24
	lsrs r4, r0, 24
	movs r0, 0x5
	bl PlaySE
	ldr r2, _08126BB0 @ =gUnknown_203B0A0
	movs r1, 0x9
	ldrsb r1, [r2, r1]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08126BB4 @ =gPlayerParty
	adds r0, r1
	ldr r1, _08126BB8 @ =gSpecialVar_ItemId
	ldrh r1, [r1]
	ldrb r2, [r2, 0x9]
	movs r3, 0
	bl PokemonUseItemEffects2
	lsls r0, 24
	cmp r0, 0
	beq _08126BC8
	ldr r1, _08126BBC @ =gUnknown_203B0C0
	movs r0, 0
	strb r0, [r1]
	ldr r0, _08126BC0 @ =gUnknown_84169DC
	movs r1, 0x1
	bl sub_81202F8
	movs r0, 0x2
	bl schedule_bg_copy_tilemap_to_vram
	ldr r1, _08126BC4 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	str r5, [r0]
	b _08126BCE
	.align 2, 0
_08126BB0: .4byte gUnknown_203B0A0
_08126BB4: .4byte gPlayerParty
_08126BB8: .4byte gSpecialVar_ItemId
_08126BBC: .4byte gUnknown_203B0C0
_08126BC0: .4byte gUnknown_84169DC
_08126BC4: .4byte gTasks
_08126BC8:
	adds r0, r4, 0
	bl sub_8124DC0
_08126BCE:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8126B60

	thumb_func_start sub_8126BD4
sub_8126BD4: @ 8126BD4
	push {r4,r5,lr}
	ldr r1, _08126C10 @ =gUnknown_300537C
	ldr r4, _08126C14 @ =gUnknown_203B0A0
	ldr r0, [r4]
	str r0, [r1]
	ldrb r0, [r4, 0x9]
	ldr r5, _08126C18 @ =gSpecialVar_ItemId
	ldrh r1, [r5]
	movs r2, 0
	bl ExecuteTableBasedItemEffect__
	movs r1, 0x9
	ldrsb r1, [r4, r1]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _08126C1C @ =gPlayerParty
	adds r1, r0
	ldrh r2, [r5]
	ldr r3, _08126C20 @ =0x0000ffff
	movs r0, 0x4
	bl sub_80A2294
	ldrh r0, [r5]
	movs r1, 0x1
	bl RemoveBagItem
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08126C10: .4byte gUnknown_300537C
_08126C14: .4byte gUnknown_203B0A0
_08126C18: .4byte gSpecialVar_ItemId
_08126C1C: .4byte gPlayerParty
_08126C20: .4byte 0x0000ffff
	thumb_func_end sub_8126BD4

	thumb_func_start sub_8126C24
sub_8126C24: @ 8126C24
	push {lr}
	bl sub_806E25C
	cmp r0, 0
	bne _08126C60
	ldr r0, _08126C54 @ =gUnknown_203B0A0
	movs r1, 0x9
	ldrsb r1, [r0, r1]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08126C58 @ =gPlayerParty
	adds r0, r1
	ldr r1, _08126C5C @ =gSpecialVar_ItemId
	ldrh r2, [r1]
	movs r1, 0x2
	bl GetEvolutionTargetSpecies
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x97
	bls _08126C60
	movs r0, 0
	b _08126C62
	.align 2, 0
_08126C54: .4byte gUnknown_203B0A0
_08126C58: .4byte gPlayerParty
_08126C5C: .4byte gSpecialVar_ItemId
_08126C60:
	movs r0, 0x1
_08126C62:
	pop {r1}
	bx r1
	thumb_func_end sub_8126C24

	thumb_func_start GetItemEffectType
GetItemEffectType: @ 8126C68
	push {r4,r5,lr}
	lsls r0, 16
	lsrs r1, r0, 16
	adds r2, r1, 0
	subs r2, 0xD
	lsls r0, r2, 16
	lsrs r0, 16
	cmp r0, 0xA5
	bls _08126C7C
	b _08126DBC
_08126C7C:
	cmp r1, 0xAF
	bne _08126C94
	ldr r0, _08126C8C @ =gSaveBlock1Ptr
	ldr r0, [r0]
	ldr r1, _08126C90 @ =0x00003108
	adds r4, r0, r1
	b _08126C9C
	.align 2, 0
_08126C8C: .4byte gSaveBlock1Ptr
_08126C90: .4byte 0x00003108
_08126C94:
	ldr r1, _08126CC4 @ =gItemEffectTable
	lsls r0, r2, 2
	adds r0, r1
	ldr r4, [r0]
_08126C9C:
	ldrb r1, [r4]
	movs r5, 0x3F
	adds r0, r5, 0
	ands r0, r1
	cmp r0, 0
	bne _08126CBE
	ldrb r0, [r4, 0x1]
	cmp r0, 0
	bne _08126CBE
	ldrb r0, [r4, 0x2]
	cmp r0, 0
	bne _08126CBE
	ldrb r3, [r4, 0x3]
	movs r0, 0x80
	ands r0, r3
	cmp r0, 0
	beq _08126CC8
_08126CBE:
	movs r0, 0
	b _08126DC2
	.align 2, 0
_08126CC4: .4byte gItemEffectTable
_08126CC8:
	movs r2, 0x40
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0
	beq _08126CD6
	movs r0, 0xA
	b _08126DC2
_08126CD6:
	adds r0, r2, 0
	ands r0, r3
	cmp r0, 0
	beq _08126CE2
	movs r0, 0x1
	b _08126DC2
_08126CE2:
	adds r2, r5, 0
	ands r2, r3
	cmp r2, 0
	bne _08126CF0
	lsrs r0, r1, 7
	cmp r0, 0
	beq _08126D32
_08126CF0:
	cmp r2, 0x20
	bne _08126CF8
	movs r0, 0x4
	b _08126DC2
_08126CF8:
	cmp r2, 0x10
	bne _08126D00
	movs r0, 0x3
	b _08126DC2
_08126D00:
	cmp r2, 0x8
	bne _08126D08
	movs r0, 0x5
	b _08126DC2
_08126D08:
	cmp r2, 0x4
	bne _08126D10
	movs r0, 0x6
	b _08126DC2
_08126D10:
	cmp r2, 0x2
	bne _08126D18
	movs r0, 0x7
	b _08126DC2
_08126D18:
	cmp r2, 0x1
	bne _08126D20
	movs r0, 0x8
	b _08126DC2
_08126D20:
	lsrs r0, r1, 7
	cmp r0, 0
	beq _08126D2E
	cmp r2, 0
	bne _08126D2E
	movs r0, 0x9
	b _08126DC2
_08126D2E:
	movs r0, 0xB
	b _08126DC2
_08126D32:
	ldrb r1, [r4, 0x4]
	movs r0, 0x44
	ands r0, r1
	adds r2, r1, 0
	cmp r0, 0
	beq _08126D42
	movs r0, 0x2
	b _08126DC2
_08126D42:
	movs r5, 0x2
	adds r0, r5, 0
	ands r0, r2
	cmp r0, 0
	beq _08126D50
	movs r0, 0xC
	b _08126DC2
_08126D50:
	movs r3, 0x1
	adds r0, r3, 0
	ands r0, r2
	cmp r0, 0
	beq _08126D5E
	movs r0, 0xD
	b _08126DC2
_08126D5E:
	ldrb r1, [r4, 0x5]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _08126D6C
	movs r0, 0xE
	b _08126DC2
_08126D6C:
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _08126D78
	movs r0, 0xF
	b _08126DC2
_08126D78:
	adds r0, r5, 0
	ands r0, r1
	cmp r0, 0
	beq _08126D84
	movs r0, 0x10
	b _08126DC2
_08126D84:
	adds r0, r3, 0
	ands r0, r1
	cmp r0, 0
	beq _08126D90
	movs r0, 0x11
	b _08126DC2
_08126D90:
	movs r0, 0x80
	ands r0, r2
	cmp r0, 0
	beq _08126D9C
	movs r0, 0x12
	b _08126DC2
_08126D9C:
	movs r0, 0x20
	ands r0, r2
	cmp r0, 0
	beq _08126DA8
	movs r0, 0x13
	b _08126DC2
_08126DA8:
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _08126DB4
	movs r0, 0x14
	b _08126DC2
_08126DB4:
	movs r0, 0x18
	ands r0, r2
	cmp r0, 0
	bne _08126DC0
_08126DBC:
	movs r0, 0x16
	b _08126DC2
_08126DC0:
	movs r0, 0x15
_08126DC2:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end GetItemEffectType

	thumb_func_start sub_8126DC8
sub_8126DC8: @ 8126DC8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r0, _08126E4C @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08126E98
	ldr r7, _08126E50 @ =gUnknown_203B0A0
	movs r1, 0x9
	ldrsb r1, [r7, r1]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _08126E54 @ =gPlayerParty
	adds r5, r1, r0
	movs r0, 0xE
	adds r0, r7
	mov r8, r0
	ldr r1, _08126E58 @ =gStringVar1
	adds r0, r5, 0
	bl GetMonNickname
	ldr r4, _08126E5C @ =gSpecialVar_0x8005
	ldrb r0, [r4]
	bl sub_8120BA8
	strh r0, [r7, 0xE]
	ldr r0, _08126E60 @ =gStringVar2
	movs r1, 0xE
	ldrsh r2, [r7, r1]
	movs r1, 0xD
	muls r1, r2
	ldr r2, _08126E64 @ =gMoveNames
	adds r1, r2
	bl StringCopy
	movs r0, 0x2
	mov r1, r8
	strh r0, [r1, 0x2]
	ldrb r2, [r4]
	adds r0, r5, 0
	movs r1, 0
	bl sub_8120B20
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08126E6C
	cmp r0, 0x2
	beq _08126E74
	ldrh r1, [r7, 0xE]
	adds r0, r5, 0
	bl GiveMoveToMon
	lsls r0, 16
	ldr r1, _08126E68 @ =0xffff0000
	cmp r0, r1
	beq _08126E84
	adds r0, r6, 0
	bl sub_8125C48
	b _08126E98
	.align 2, 0
_08126E4C: .4byte gPaletteFade
_08126E50: .4byte gUnknown_203B0A0
_08126E54: .4byte gPlayerParty
_08126E58: .4byte gStringVar1
_08126E5C: .4byte gSpecialVar_0x8005
_08126E60: .4byte gStringVar2
_08126E64: .4byte gMoveNames
_08126E68: .4byte 0xffff0000
_08126E6C:
	ldr r1, _08126E70 @ =gUnknown_8416DC2
	b _08126E76
	.align 2, 0
_08126E70: .4byte gUnknown_8416DC2
_08126E74:
	ldr r1, _08126E80 @ =gUnknown_8416F10
_08126E76:
	adds r0, r6, 0
	bl sub_8125B14
	b _08126E98
	.align 2, 0
_08126E80: .4byte gUnknown_8416F10
_08126E84:
	ldr r0, _08126EA4 @ =gUnknown_8416DF7
	bl sub_8125AF0
	ldr r1, _08126EA8 @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r0, r1
	ldr r1, _08126EAC @ =sub_8125D88
	str r1, [r0]
_08126E98:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08126EA4: .4byte gUnknown_8416DF7
_08126EA8: .4byte gTasks
_08126EAC: .4byte sub_8125D88
	thumb_func_end sub_8126DC8

	thumb_func_start CB2_PartyMenuFromStartMenu
CB2_PartyMenuFromStartMenu: @ 8126EB0
	push {lr}
	sub sp, 0xC
	movs r0, 0
	str r0, [sp]
	ldr r0, _08126ED4 @ =sub_811FB28
	str r0, [sp, 0x4]
	ldr r0, _08126ED8 @ =sub_80568A8
	str r0, [sp, 0x8]
	movs r0, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl sub_811EA44
	add sp, 0xC
	pop {r0}
	bx r0
	.align 2, 0
_08126ED4: .4byte sub_811FB28
_08126ED8: .4byte sub_80568A8
	thumb_func_end CB2_PartyMenuFromStartMenu

	thumb_func_start sub_8126EDC
sub_8126EDC: @ 8126EDC
	push {lr}
	sub sp, 0xC
	ldr r0, _08126EF8 @ =gSpecialVar_ItemId
	ldrh r0, [r0]
	bl GetPocketByItemId
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	beq _08126F00
	cmp r0, 0x5
	beq _08126F08
	ldr r1, _08126EFC @ =sub_8124D90
	b _08126F0A
	.align 2, 0
_08126EF8: .4byte gSpecialVar_ItemId
_08126EFC: .4byte sub_8124D90
_08126F00:
	ldr r1, _08126F04 @ =sub_8124DA0
	b _08126F0A
	.align 2, 0
_08126F04: .4byte sub_8124DA0
_08126F08:
	ldr r1, _08126F30 @ =sub_8124DB0
_08126F0A:
	movs r0, 0x6
	str r0, [sp]
	ldr r0, _08126F34 @ =sub_811FB28
	str r0, [sp, 0x4]
	str r1, [sp, 0x8]
	movs r0, 0
	movs r1, 0
	movs r2, 0x5
	movs r3, 0
	bl sub_811EA44
	ldr r1, _08126F38 @ =gUnknown_203B0A0
	ldr r0, _08126F3C @ =gSpecialVar_ItemId
	ldrh r0, [r0]
	strh r0, [r1, 0xC]
	add sp, 0xC
	pop {r0}
	bx r0
	.align 2, 0
_08126F30: .4byte sub_8124DB0
_08126F34: .4byte sub_811FB28
_08126F38: .4byte gUnknown_203B0A0
_08126F3C: .4byte gSpecialVar_ItemId
	thumb_func_end sub_8126EDC

	thumb_func_start sub_8126F40
sub_8126F40: @ 8126F40
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r6, r4, 0
	ldr r5, _08126F80 @ =gUnknown_203B0D8
	ldr r0, _08126F84 @ =gUnknown_203B0A0
	mov r9, r0
	ldrb r0, [r0, 0x9]
	lsls r0, 24
	asrs r0, 24
	movs r1, 0x64
	mov r8, r1
	mov r1, r8
	muls r1, r0
	adds r0, r1, 0
	ldr r7, _08126F88 @ =gPlayerParty
	adds r0, r7
	movs r1, 0xC
	bl GetMonData
	strh r0, [r5]
	lsls r0, 16
	cmp r0, 0
	bne _08126F8C
	adds r0, r4, 0
	bl sub_8126FD8
	b _08126FC4
	.align 2, 0
_08126F80: .4byte gUnknown_203B0D8
_08126F84: .4byte gUnknown_203B0A0
_08126F88: .4byte gPlayerParty
_08126F8C:
	ldrh r0, [r5]
	bl itemid_is_mail
	lsls r0, 24
	cmp r0, 0
	beq _08126FA0
	adds r0, r4, 0
	bl sub_812734C
	b _08126FC4
_08126FA0:
	mov r1, r9
	movs r0, 0x9
	ldrsb r0, [r1, r0]
	mov r1, r8
	muls r1, r0
	adds r0, r1, 0
	adds r0, r7
	ldrh r1, [r5]
	movs r2, 0x1
	bl sub_812050C
	ldr r1, _08126FD0 @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r0, r1
	ldr r1, _08126FD4 @ =sub_8127234
	str r1, [r0]
_08126FC4:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08126FD0: .4byte gTasks
_08126FD4: .4byte sub_8127234
	thumb_func_end sub_8126F40

	thumb_func_start sub_8126FD8
sub_8126FD8: @ 8126FD8
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r5, _08127004 @ =gUnknown_203B0A0
	ldrh r0, [r5, 0xC]
	bl itemid_is_mail
	lsls r0, 24
	cmp r0, 0
	beq _08127010
	ldrh r0, [r5, 0xC]
	bl sub_8127384
	ldr r0, _08127008 @ =gUnknown_203B09C
	ldr r1, [r0]
	ldr r0, _0812700C @ =sub_81270E0
	str r0, [r1, 0x4]
	adds r0, r4, 0
	bl sub_811FA78
	b _08127016
	.align 2, 0
_08127004: .4byte gUnknown_203B0A0
_08127008: .4byte gUnknown_203B09C
_0812700C: .4byte sub_81270E0
_08127010:
	adds r0, r4, 0
	bl sub_812701C
_08127016:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8126FD8

	thumb_func_start sub_812701C
sub_812701C: @ 812701C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r0, _08127084 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08127078
	ldr r4, _08127088 @ =gUnknown_203B0A0
	ldrh r5, [r4, 0xC]
	movs r0, 0x9
	ldrsb r0, [r4, r0]
	movs r1, 0x64
	mov r8, r1
	mov r1, r8
	muls r1, r0
	adds r0, r1, 0
	ldr r6, _0812708C @ =gPlayerParty
	adds r0, r6
	adds r1, r5, 0
	movs r2, 0
	movs r3, 0x1
	bl sub_8120420
	movs r0, 0x9
	ldrsb r0, [r4, r0]
	mov r1, r8
	muls r1, r0
	adds r0, r1, 0
	adds r0, r6
	adds r1, r5, 0
	bl sub_81205C8
	adds r0, r5, 0
	bl sub_8127384
	ldr r1, _08127090 @ =gTasks
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r1
	ldr r1, _08127094 @ =sub_8127098
	str r1, [r0]
_08127078:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08127084: .4byte gPaletteFade
_08127088: .4byte gUnknown_203B0A0
_0812708C: .4byte gPlayerParty
_08127090: .4byte gTasks
_08127094: .4byte sub_8127098
	thumb_func_end sub_812701C

	thumb_func_start sub_8127098
sub_8127098: @ 8127098
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _081270D4 @ =gUnknown_203B0A0
	ldrb r4, [r0, 0x9]
	bl sub_8120370
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _081270CC
	lsls r2, r4, 24
	asrs r2, 24
	movs r0, 0x64
	muls r0, r2
	ldr r1, _081270D8 @ =gPlayerParty
	adds r0, r1
	ldr r1, _081270DC @ =gUnknown_203B0B4
	lsls r2, 4
	ldr r1, [r1]
	adds r1, r2
	bl sub_81224B4
	adds r0, r5, 0
	bl sub_811FA78
_081270CC:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_081270D4: .4byte gUnknown_203B0A0
_081270D8: .4byte gPlayerParty
_081270DC: .4byte gUnknown_203B0B4
	thumb_func_end sub_8127098

	thumb_func_start sub_81270E0
sub_81270E0: @ 81270E0
	push {r4-r6,lr}
	ldr r4, _08127128 @ =gUnknown_203B0A0
	movs r0, 0x9
	ldrsb r0, [r4, r0]
	movs r6, 0x64
	muls r0, r6
	ldr r5, _0812712C @ =gPlayerParty
	adds r0, r5
	ldrh r1, [r4, 0xC]
	bl sub_81205C8
	movs r0, 0x9
	ldrsb r0, [r4, r0]
	muls r0, r6
	adds r0, r5
	movs r1, 0x40
	bl GetMonData
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08127130 @ =gSaveBlock1Ptr
	lsls r2, r0, 3
	adds r2, r0
	lsls r2, 2
	ldr r0, _08127134 @ =0x00002cd0
	adds r2, r0
	ldr r1, [r1]
	adds r1, r2
	ldr r2, _08127138 @ =sub_812713C
	movs r0, 0x4
	bl sub_80FEBAC
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08127128: .4byte gUnknown_203B0A0
_0812712C: .4byte gPlayerParty
_08127130: .4byte gSaveBlock1Ptr
_08127134: .4byte 0x00002cd0
_08127138: .4byte sub_812713C
	thumb_func_end sub_81270E0

	thumb_func_start sub_812713C
sub_812713C: @ 812713C
	push {r4-r7,lr}
	sub sp, 0xC
	ldr r6, _0812718C @ =gUnknown_203B0A0
	movs r1, 0x9
	ldrsb r1, [r6, r1]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _08127190 @ =gPlayerParty
	adds r5, r1, r0
	adds r0, r5, 0
	movs r1, 0xC
	bl GetMonData
	lsls r0, 16
	lsrs r7, r0, 16
	ldr r0, _08127194 @ =gSpecialVar_Result
	ldrh r0, [r0]
	cmp r0, 0
	bne _0812719C
	adds r0, r5, 0
	bl TakeMailFromMon
	ldr r4, _08127198 @ =gUnknown_203B0D8
	adds r0, r5, 0
	movs r1, 0xC
	adds r2, r4, 0
	bl SetMonData
	ldrh r0, [r4]
	movs r1, 0x1
	bl RemoveBagItem
	adds r0, r7, 0
	bl sub_81273AC
	ldr r0, [r6]
	bl SetMainCallback2
	b _081271B8
	.align 2, 0
_0812718C: .4byte gUnknown_203B0A0
_08127190: .4byte gPlayerParty
_08127194: .4byte gSpecialVar_Result
_08127198: .4byte gUnknown_203B0D8
_0812719C:
	ldrb r0, [r6, 0x8]
	lsls r0, 28
	lsrs r0, 28
	ldrb r2, [r6, 0xB]
	movs r1, 0x7F
	str r1, [sp]
	ldr r1, _081271C0 @ =sub_81271C4
	str r1, [sp, 0x4]
	ldr r1, [r6]
	str r1, [sp, 0x8]
	movs r1, 0xFF
	movs r3, 0x1
	bl sub_811EA44
_081271B8:
	add sp, 0xC
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081271C0: .4byte sub_81271C4
	thumb_func_end sub_812713C

	thumb_func_start sub_81271C4
sub_81271C4: @ 81271C4
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _081271EC @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0812721E
	ldr r1, _081271F0 @ =gUnknown_203B0D8
	ldrh r0, [r1]
	cmp r0, 0
	beq _081271F8
	ldr r0, _081271F4 @ =gUnknown_203B0A0
	ldrh r0, [r0, 0xC]
	ldrh r1, [r1]
	movs r2, 0
	bl sub_8120558
	b _08127210
	.align 2, 0
_081271EC: .4byte gPaletteFade
_081271F0: .4byte gUnknown_203B0D8
_081271F4: .4byte gUnknown_203B0A0
_081271F8:
	ldr r2, _08127224 @ =gUnknown_203B0A0
	movs r1, 0x9
	ldrsb r1, [r2, r1]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08127228 @ =gPlayerParty
	adds r0, r1
	ldrh r1, [r2, 0xC]
	movs r2, 0
	movs r3, 0x1
	bl sub_8120420
_08127210:
	ldr r0, _0812722C @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _08127230 @ =sub_8127098
	str r0, [r1]
_0812721E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08127224: .4byte gUnknown_203B0A0
_08127228: .4byte gPlayerParty
_0812722C: .4byte gTasks
_08127230: .4byte sub_8127098
	thumb_func_end sub_81271C4

	thumb_func_start sub_8127234
sub_8127234: @ 8127234
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_8120370
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08127258
	bl sub_812200C
	ldr r0, _08127260 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _08127264 @ =sub_8127268
	str r0, [r1]
_08127258:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08127260: .4byte gTasks
_08127264: .4byte sub_8127268
	thumb_func_end sub_8127234

	thumb_func_start sub_8127268
sub_8127268: @ 8127268
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	bl Menu_ProcessInputNoWrapClearOnChoose
	lsls r0, 24
	asrs r1, r0, 24
	cmp r1, 0
	beq _0812728E
	cmp r1, 0
	bgt _08127288
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _08127328
	b _0812733C
_08127288:
	cmp r1, 0x1
	beq _0812732E
	b _0812733C
_0812728E:
	ldr r7, _081272C0 @ =gUnknown_203B0A0
	ldrh r4, [r7, 0xC]
	adds r0, r4, 0
	bl sub_8127384
	ldr r6, _081272C4 @ =gUnknown_203B0D8
	ldrh r0, [r6]
	movs r1, 0x1
	bl AddBagItem
	lsls r0, 24
	cmp r0, 0
	bne _081272CC
	adds r0, r4, 0
	bl sub_81273AC
	ldrh r0, [r6]
	bl sub_8120658
	ldr r0, _081272C8 @ =gStringVar4
	movs r1, 0
	bl sub_81202F8
	b _0812730C
	.align 2, 0
_081272C0: .4byte gUnknown_203B0A0
_081272C4: .4byte gUnknown_203B0D8
_081272C8: .4byte gStringVar4
_081272CC:
	adds r0, r4, 0
	bl itemid_is_mail
	lsls r0, 24
	cmp r0, 0
	beq _081272F0
	ldr r0, _081272E8 @ =gUnknown_203B09C
	ldr r1, [r0]
	ldr r0, _081272EC @ =sub_81270E0
	str r0, [r1, 0x4]
	adds r0, r5, 0
	bl sub_811FA78
	b _0812733C
	.align 2, 0
_081272E8: .4byte gUnknown_203B09C
_081272EC: .4byte sub_81270E0
_081272F0:
	movs r1, 0x9
	ldrsb r1, [r7, r1]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0812731C @ =gPlayerParty
	adds r0, r1
	adds r1, r4, 0
	bl sub_81205C8
	ldrh r1, [r6]
	adds r0, r4, 0
	movs r2, 0x1
	bl sub_8120558
_0812730C:
	ldr r1, _08127320 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldr r1, _08127324 @ =sub_8127098
	str r1, [r0]
	b _0812733C
	.align 2, 0
_0812731C: .4byte gPlayerParty
_08127320: .4byte gTasks
_08127324: .4byte sub_8127098
_08127328:
	movs r0, 0x5
	bl PlaySE
_0812732E:
	ldr r0, _08127344 @ =gTasks
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	ldr r0, _08127348 @ =sub_8127098
	str r0, [r1]
_0812733C:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08127344: .4byte gTasks
_08127348: .4byte sub_8127098
	thumb_func_end sub_8127268

	thumb_func_start sub_812734C
sub_812734C: @ 812734C
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _08127378 @ =gUnknown_8416BFB
	movs r1, 0x1
	bl sub_81202F8
	movs r0, 0x2
	bl schedule_bg_copy_tilemap_to_vram
	ldr r1, _0812737C @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _08127380 @ =sub_8127098
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08127378: .4byte gUnknown_8416BFB
_0812737C: .4byte gTasks
_08127380: .4byte sub_8127098
	thumb_func_end sub_812734C

	thumb_func_start sub_8127384
sub_8127384: @ 8127384
	push {lr}
	lsls r0, 16
	lsrs r1, r0, 16
	ldr r0, _0812739C @ =gUnknown_203B0A0
	ldrb r0, [r0, 0xB]
	cmp r0, 0x6
	bne _081273A0
	adds r0, r1, 0
	movs r1, 0x1
	bl sub_809A460
	b _081273A8
	.align 2, 0
_0812739C: .4byte gUnknown_203B0A0
_081273A0:
	adds r0, r1, 0
	movs r1, 0x1
	bl RemoveBagItem
_081273A8:
	pop {r0}
	bx r0
	thumb_func_end sub_8127384

	thumb_func_start sub_81273AC
sub_81273AC: @ 81273AC
	push {lr}
	lsls r0, 16
	lsrs r1, r0, 16
	ldr r0, _081273C4 @ =gUnknown_203B0A0
	ldrb r0, [r0, 0xB]
	cmp r0, 0x5
	beq _081273C8
	adds r0, r1, 0
	movs r1, 0x1
	bl AddPCItem
	b _081273D0
	.align 2, 0
_081273C4: .4byte gUnknown_203B0A0
_081273C8:
	adds r0, r1, 0
	movs r1, 0x1
	bl AddBagItem
_081273D0:
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end sub_81273AC

	thumb_func_start sub_81273D8
sub_81273D8: @ 81273D8
	push {lr}
	sub sp, 0xC
	movs r0, 0x6
	str r0, [sp]
	ldr r0, _081273FC @ =sub_811FB28
	str r0, [sp, 0x4]
	ldr r0, _08127400 @ =sub_80EC500
	str r0, [sp, 0x8]
	movs r0, 0
	movs r1, 0
	movs r2, 0x7
	movs r3, 0
	bl sub_811EA44
	add sp, 0xC
	pop {r0}
	bx r0
	.align 2, 0
_081273FC: .4byte sub_811FB28
_08127400: .4byte sub_80EC500
	thumb_func_end sub_81273D8

	thumb_func_start sub_8127404
sub_8127404: @ 8127404
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r0, _08127450 @ =gUnknown_203B0A0
	movs r1, 0x9
	ldrsb r1, [r0, r1]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _08127454 @ =gPlayerParty
	adds r5, r1, r0
	ldr r1, _08127458 @ =gUnknown_203B0C0
	movs r0, 0
	strb r0, [r1]
	ldr r2, _0812745C @ =gSaveBlock1Ptr
	ldr r0, _08127460 @ =gUnknown_203AAC4
	ldrh r1, [r0]
	adds r1, 0x6
	ldrh r0, [r0, 0x2]
	adds r1, r0
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08127464 @ =0x00002cd0
	adds r0, r1
	ldr r1, [r2]
	adds r4, r1, r0
	adds r0, r5, 0
	movs r1, 0xC
	bl GetMonData
	cmp r0, 0
	beq _0812746C
	ldr r0, _08127468 @ =gUnknown_8416D17
	movs r1, 0x1
	bl sub_81202F8
	b _08127482
	.align 2, 0
_08127450: .4byte gUnknown_203B0A0
_08127454: .4byte gPlayerParty
_08127458: .4byte gUnknown_203B0C0
_0812745C: .4byte gSaveBlock1Ptr
_08127460: .4byte gUnknown_203AAC4
_08127464: .4byte 0x00002cd0
_08127468: .4byte gUnknown_8416D17
_0812746C:
	adds r0, r5, 0
	adds r1, r4, 0
	bl GiveMailToMon2
	adds r0, r4, 0
	bl ClearMailStruct
	ldr r0, _0812749C @ =gUnknown_8416D4F
	movs r1, 0x1
	bl sub_81202F8
_08127482:
	movs r0, 0x2
	bl schedule_bg_copy_tilemap_to_vram
	ldr r0, _081274A0 @ =gTasks
	lsls r1, r6, 2
	adds r1, r6
	lsls r1, 3
	adds r1, r0
	ldr r0, _081274A4 @ =sub_8127098
	str r0, [r1]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0812749C: .4byte gUnknown_8416D4F
_081274A0: .4byte gTasks
_081274A4: .4byte sub_8127098
	thumb_func_end sub_8127404

	thumb_func_start sub_81274A8
sub_81274A8: @ 81274A8
	push {r4,lr}
	sub sp, 0xC
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_81274FC
	movs r0, 0
	str r0, [sp]
	ldr r0, _081274EC @ =sub_811FB28
	str r0, [sp, 0x4]
	ldr r0, _081274F0 @ =gMain
	ldr r0, [r0, 0x8]
	str r0, [sp, 0x8]
	movs r0, 0x4
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl sub_811EA44
	ldr r1, _081274F4 @ =gUnknown_203B0A0
	lsls r4, 6
	ldrb r2, [r1, 0x8]
	movs r0, 0x3F
	ands r0, r2
	orrs r0, r4
	strb r0, [r1, 0x8]
	ldr r0, _081274F8 @ =sub_812773C
	str r0, [r1, 0x4]
	add sp, 0xC
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081274EC: .4byte sub_811FB28
_081274F0: .4byte gMain
_081274F4: .4byte gUnknown_203B0A0
_081274F8: .4byte sub_812773C
	thumb_func_end sub_81274A8

	thumb_func_start sub_81274FC
sub_81274FC: @ 81274FC
	push {lr}
	ldr r0, _0812750C @ =gUnknown_203B0D4
	movs r1, 0
	movs r2, 0x3
	bl memset
	pop {r0}
	bx r0
	.align 2, 0
_0812750C: .4byte gUnknown_203B0D4
	thumb_func_end sub_81274FC

	thumb_func_start sub_8127510
sub_8127510: @ 8127510
	push {r4,lr}
	lsls r0, 24
	asrs r4, r0, 24
	movs r0, 0x64
	muls r0, r4
	ldr r1, _0812752C @ =gPlayerParty
	adds r0, r1
	bl sub_8127550
	lsls r0, 24
	cmp r0, 0
	bne _08127530
	movs r0, 0x2
	b _08127548
	.align 2, 0
_0812752C: .4byte gPlayerParty
_08127530:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r0, 24
	bl sub_8127710
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08127546
	movs r0, 0
	b _08127548
_08127546:
	movs r0, 0x1
_08127548:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8127510

	thumb_func_start sub_8127550
sub_8127550: @ 8127550
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r5, 0
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0
	bne _0812757A
	ldr r0, _08127580 @ =gUnknown_203B0A0
	ldrb r0, [r0, 0x8]
	lsrs r1, r0, 6
	cmp r1, 0
	beq _08127584
	cmp r1, 0x1
	beq _08127592
	adds r0, r4, 0
	movs r1, 0x38
	bl GetMonData
	cmp r0, 0x1E
	bls _081275E0
_0812757A:
	movs r0, 0
	b _081275E2
	.align 2, 0
_08127580: .4byte gUnknown_203B0A0
_08127584:
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	cmp r0, 0
	bne _081275E0
	b _0812757A
_08127592:
	ldr r0, _081275E8 @ =gSaveBlock2Ptr
	ldr r0, [r0]
	ldr r2, _081275EC @ =0x0000055c
	adds r0, r2
	ldrb r0, [r0]
	ands r1, r0
	cmp r1, 0
	bne _081275AE
	adds r0, r4, 0
	movs r1, 0x38
	bl GetMonData
	cmp r0, 0x32
	bhi _0812757A
_081275AE:
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r4, r0, 16
	ldr r3, _081275F0 @ =gUnknown_84020C4
	lsls r1, r5, 1
	adds r0, r1, r3
	ldrh r0, [r0]
	ldr r2, _081275F4 @ =0x0000ffff
	cmp r0, r2
	beq _081275E0
_081275C8:
	adds r0, r1, r3
	ldrh r0, [r0]
	cmp r0, r4
	beq _0812757A
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	lsls r1, r5, 1
	adds r0, r1, r3
	ldrh r0, [r0]
	cmp r0, r2
	bne _081275C8
_081275E0:
	movs r0, 0x1
_081275E2:
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_081275E8: .4byte gSaveBlock2Ptr
_081275EC: .4byte 0x0000055c
_081275F0: .4byte gUnknown_84020C4
_081275F4: .4byte 0x0000ffff
	thumb_func_end sub_8127550

	thumb_func_start sub_81275F8
sub_81275F8: @ 81275F8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	ldr r0, _08127618 @ =gPlayerParty
	mov r10, r0
	ldr r0, _0812761C @ =gUnknown_203B0A0
	ldrb r0, [r0, 0x8]
	lsrs r0, 6
	cmp r0, 0x1
	beq _08127620
	cmp r0, 0x2
	beq _081276E8
	b _08127700
	.align 2, 0
_08127618: .4byte gPlayerParty
_0812761C: .4byte gUnknown_203B0A0
_08127620:
	ldr r1, _0812762C @ =gUnknown_203B0D4
	ldrb r0, [r1, 0x2]
	cmp r0, 0
	bne _08127630
	movs r0, 0x11
	b _08127702
	.align 2, 0
_0812762C: .4byte gUnknown_203B0D4
_08127630:
	movs r5, 0
_08127632:
	ldr r2, _081276DC @ =gUnknown_203B0D4
	adds r4, r2, r5
	ldrb r0, [r4]
	movs r1, 0x64
	muls r0, r1
	subs r0, 0x64
	add r0, r10
	movs r1, 0xB
	bl GetMonData
	ldr r2, _081276E0 @ =gUnknown_203B09C
	ldr r1, [r2]
	ldr r2, _081276E4 @ =0x00000236
	adds r1, r2
	strh r0, [r1]
	ldrb r0, [r4]
	movs r1, 0x64
	muls r0, r1
	subs r0, 0x64
	add r0, r10
	movs r1, 0xC
	bl GetMonData
	ldr r2, _081276E0 @ =gUnknown_203B09C
	ldr r1, [r2]
	movs r2, 0x8D
	lsls r2, 2
	adds r1, r2
	strh r0, [r1]
	adds r1, r5, 0x1
	lsls r0, r1, 24
	lsrs r5, r0, 24
	mov r9, r1
	cmp r5, 0x2
	bhi _081276D0
	ldr r0, _081276E0 @ =gUnknown_203B09C
	mov r8, r0
	movs r7, 0x64
_0812767E:
	mov r1, r8
	ldr r0, [r1]
	ldr r2, _081276E4 @ =0x00000236
	adds r0, r2
	movs r1, 0
	ldrsh r4, [r0, r1]
	ldr r2, _081276DC @ =gUnknown_203B0D4
	adds r6, r2, r5
	ldrb r0, [r6]
	muls r0, r7
	subs r0, 0x64
	add r0, r10
	movs r1, 0xB
	bl GetMonData
	cmp r4, r0
	beq _081276F8
	mov r1, r8
	ldr r0, [r1]
	movs r2, 0x8D
	lsls r2, 2
	adds r1, r0, r2
	movs r2, 0
	ldrsh r0, [r1, r2]
	cmp r0, 0
	beq _081276C6
	adds r4, r0, 0
	ldrb r0, [r6]
	muls r0, r7
	subs r0, 0x64
	add r0, r10
	movs r1, 0xC
	bl GetMonData
	cmp r4, r0
	beq _081276FC
_081276C6:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x2
	bls _0812767E
_081276D0:
	mov r1, r9
	lsls r0, r1, 24
	lsrs r5, r0, 24
	cmp r5, 0x1
	bls _08127632
	b _08127700
	.align 2, 0
_081276DC: .4byte gUnknown_203B0D4
_081276E0: .4byte gUnknown_203B09C
_081276E4: .4byte 0x00000236
_081276E8:
	ldr r2, _081276F4 @ =gUnknown_203B0D4
	ldrb r0, [r2, 0x1]
	cmp r0, 0
	bne _08127700
	movs r0, 0x12
	b _08127702
	.align 2, 0
_081276F4: .4byte gUnknown_203B0D4
_081276F8:
	movs r0, 0x13
	b _08127702
_081276FC:
	movs r0, 0x14
	b _08127702
_08127700:
	movs r0, 0xFF
_08127702:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_81275F8

	thumb_func_start sub_8127710
sub_8127710: @ 8127710
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	movs r1, 0
	ldr r3, _08127728 @ =gUnknown_203B0D4
_0812771A:
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, r2
	bne _0812772C
	movs r0, 0x1
	b _08127738
	.align 2, 0
_08127728: .4byte gUnknown_203B0D4
_0812772C:
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x2
	bls _0812771A
	movs r0, 0
_08127738:
	pop {r1}
	bx r1
	thumb_func_end sub_8127710

	thumb_func_start sub_812773C
sub_812773C: @ 812773C
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	adds r6, r5, 0
	bl sub_81275F8
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0xFF
	beq _08127768
	movs r0, 0x1A
	bl PlaySE
	adds r0, r4, 0
	bl sub_8121D0C
	ldr r0, _08127764 @ =gTasks
	lsls r1, r5, 2
	adds r1, r5
	b _08127796
	.align 2, 0
_08127764: .4byte gTasks
_08127768:
	ldr r0, _08127780 @ =gUnknown_203B0D4
	ldrb r0, [r0]
	cmp r0, 0
	beq _08127784
	movs r0, 0x5
	bl PlaySE
	adds r0, r5, 0
	bl sub_811FA78
	b _0812779E
	.align 2, 0
_08127780: .4byte gUnknown_203B0D4
_08127784:
	movs r0, 0x1A
	bl PlaySE
	movs r0, 0xE
	bl sub_8121D0C
	ldr r0, _081277A4 @ =gTasks
	lsls r1, r6, 2
	adds r1, r6
_08127796:
	lsls r1, 3
	adds r1, r0
	ldr r0, _081277A8 @ =sub_81277AC
	str r0, [r1]
_0812779E:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081277A4: .4byte gTasks
_081277A8: .4byte sub_81277AC
	thumb_func_end sub_812773C

	thumb_func_start sub_81277AC
sub_81277AC: @ 81277AC
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _081277E8 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _081277C6
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _081277E0
_081277C6:
	movs r0, 0x5
	bl PlaySE
	movs r0, 0
	bl sub_8121D0C
	ldr r0, _081277EC @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _081277F0 @ =sub_811FB28
	str r0, [r1]
_081277E0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081277E8: .4byte gMain
_081277EC: .4byte gTasks
_081277F0: .4byte sub_811FB28
	thumb_func_end sub_81277AC

	thumb_func_start sub_81277F4
sub_81277F4: @ 81277F4
	push {lr}
	sub sp, 0xC
	lsls r0, 24
	lsrs r0, 24
	movs r2, 0
	str r2, [sp]
	ldr r2, _08127818 @ =sub_811FB28
	str r2, [sp, 0x4]
	str r1, [sp, 0x8]
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl sub_811EA44
	add sp, 0xC
	pop {r0}
	bx r0
	.align 2, 0
_08127818: .4byte sub_811FB28
	thumb_func_end sub_81277F4

	thumb_func_start sub_812781C
sub_812781C: @ 812781C
	push {lr}
	sub sp, 0xC
	ldr r0, _08127844 @ =gSpecialVar_0x8005
	ldrh r0, [r0]
	cmp r0, 0xE
	bhi _08127850
	movs r0, 0x4
	str r0, [sp]
	ldr r0, _08127848 @ =sub_811FB28
	str r0, [sp, 0x4]
	ldr r0, _0812784C @ =c2_exit_to_overworld_1_continue_scripts_restart_music
	str r0, [sp, 0x8]
	movs r0, 0
	movs r1, 0
	movs r2, 0xC
	movs r3, 0
	bl sub_811EA44
	b _08127870
	.align 2, 0
_08127844: .4byte gSpecialVar_0x8005
_08127848: .4byte sub_811FB28
_0812784C: .4byte c2_exit_to_overworld_1_continue_scripts_restart_music
_08127850:
	movs r0, 0x7F
	str r0, [sp]
	ldr r0, _08127878 @ =sub_8126DC8
	str r0, [sp, 0x4]
	ldr r0, _0812787C @ =c2_exit_to_overworld_1_continue_scripts_restart_music
	str r0, [sp, 0x8]
	movs r0, 0
	movs r1, 0
	movs r2, 0xC
	movs r3, 0
	bl sub_811EA44
	ldr r1, _08127880 @ =gUnknown_203B0A0
	ldr r0, _08127884 @ =gSpecialVar_0x8007
	ldrh r0, [r0]
	strb r0, [r1, 0x9]
_08127870:
	add sp, 0xC
	pop {r0}
	bx r0
	.align 2, 0
_08127878: .4byte sub_8126DC8
_0812787C: .4byte c2_exit_to_overworld_1_continue_scripts_restart_music
_08127880: .4byte gUnknown_203B0A0
_08127884: .4byte gSpecialVar_0x8007
	thumb_func_end sub_812781C

	thumb_func_start sub_8127888
sub_8127888: @ 8127888
	push {lr}
	sub sp, 0xC
	movs r0, 0x1
	str r0, [sp]
	ldr r0, _081278AC @ =sub_811FB28
	str r0, [sp, 0x4]
	ldr r0, _081278B0 @ =c2_exit_to_overworld_1_continue_scripts_restart_music
	str r0, [sp, 0x8]
	movs r0, 0xB
	movs r1, 0
	movs r2, 0xD
	movs r3, 0
	bl sub_811EA44
	add sp, 0xC
	pop {r0}
	bx r0
	.align 2, 0
_081278AC: .4byte sub_811FB28
_081278B0: .4byte c2_exit_to_overworld_1_continue_scripts_restart_music
	thumb_func_end sub_8127888

	thumb_func_start sub_81278B4
sub_81278B4: @ 81278B4
	push {lr}
	bl sub_8075290
	lsls r0, 24
	cmp r0, 0
	bne _081278C4
	movs r0, 0
	b _081278D6
_081278C4:
	bl sub_811FA20
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _081278D4
	movs r0, 0x1
	b _081278D6
_081278D4:
	movs r0, 0x2
_081278D6:
	pop {r1}
	bx r1
	thumb_func_end sub_81278B4

	thumb_func_start sub_81278DC
sub_81278DC: @ 81278DC
	push {r4,lr}
	sub sp, 0xC
	lsls r0, 24
	lsrs r4, r0, 24
	movs r0, 0x8
	bl sub_80EB2E0
	lsls r0, 24
	cmp r0, 0
	bne _08127930
	ldr r0, _08127924 @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x10
	ands r0, r1
	cmp r0, 0
	beq _08127930
	bl sub_81278B4
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0x7F
	str r0, [sp]
	ldr r0, _08127928 @ =sub_8120C3C
	str r0, [sp, 0x4]
	ldr r0, _0812792C @ =sub_8030ADC
	str r0, [sp, 0x8]
	movs r0, 0x1
	adds r2, r4, 0
	movs r3, 0
	bl sub_811EA44
	movs r0, 0x8
	bl sub_80EB2F4
	b _08127950
	.align 2, 0
_08127924: .4byte gBattleTypeFlags
_08127928: .4byte sub_8120C3C
_0812792C: .4byte sub_8030ADC
_08127930:
	bl sub_81278B4
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0
	str r0, [sp]
	ldr r0, _08127960 @ =sub_811FB28
	str r0, [sp, 0x4]
	ldr r0, _08127964 @ =sub_8030ADC
	str r0, [sp, 0x8]
	movs r0, 0x1
	adds r2, r4, 0
	movs r3, 0
	bl sub_811EA44
_08127950:
	bl nullsub_44
	bl pokemon_change_order
	add sp, 0xC
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08127960: .4byte sub_811FB28
_08127964: .4byte sub_8030ADC
	thumb_func_end sub_81278DC

	thumb_func_start sub_8127968
sub_8127968: @ 8127968
	push {lr}
	sub sp, 0xC
	bl sub_81278B4
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0
	str r0, [sp]
	ldr r0, _0812799C @ =sub_8120EBC
	str r0, [sp, 0x4]
	ldr r0, _081279A0 @ =sub_8030ADC
	str r0, [sp, 0x8]
	movs r0, 0x1
	movs r2, 0
	movs r3, 0
	bl sub_811EA44
	bl nullsub_44
	bl pokemon_change_order
	add sp, 0xC
	pop {r0}
	bx r0
	.align 2, 0
_0812799C: .4byte sub_8120EBC
_081279A0: .4byte sub_8030ADC
	thumb_func_end sub_8127968

	thumb_func_start sub_81279A4
sub_81279A4: @ 81279A4
	push {lr}
	sub sp, 0xC
	bl sub_81278B4
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0x5
	str r0, [sp]
	ldr r0, _081279D8 @ =sub_8120FCC
	str r0, [sp, 0x4]
	ldr r0, _081279DC @ =sub_8107ECC
	str r0, [sp, 0x8]
	movs r0, 0x1
	movs r2, 0xE
	movs r3, 0
	bl sub_811EA44
	bl nullsub_44
	bl pokemon_change_order
	add sp, 0xC
	pop {r0}
	bx r0
	.align 2, 0
_081279D8: .4byte sub_8120FCC
_081279DC: .4byte sub_8107ECC
	thumb_func_end sub_81279A4

	thumb_func_start sub_81279E0
sub_81279E0: @ 81279E0
	push {r4,lr}
	sub sp, 0xC
	movs r0, 0x8
	bl sub_80EB2E0
	lsls r0, 24
	cmp r0, 0
	bne _08127A30
	ldr r0, _08127A24 @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x10
	ands r0, r1
	cmp r0, 0
	beq _08127A30
	bl sub_81278B4
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0x7F
	str r0, [sp]
	ldr r0, _08127A28 @ =sub_8120C3C
	str r0, [sp, 0x4]
	ldr r0, _08127A2C @ =sub_8107ECC
	str r0, [sp, 0x8]
	movs r0, 0x1
	movs r2, 0x3
	movs r3, 0
	bl sub_811EA44
	movs r0, 0x8
	bl sub_80EB2F4
	b _08127A62
	.align 2, 0
_08127A24: .4byte gBattleTypeFlags
_08127A28: .4byte sub_8120C3C
_08127A2C: .4byte sub_8107ECC
_08127A30:
	ldr r0, _08127A74 @ =gSpecialVar_ItemId
	ldrh r0, [r0]
	bl GetPocketByItemId
	lsls r0, 24
	lsrs r0, 24
	ldr r4, _08127A78 @ =sub_8107ECC
	cmp r0, 0x5
	bne _08127A44
	ldr r4, _08127A7C @ =sub_8124DB0
_08127A44:
	bl sub_81278B4
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0x5
	str r0, [sp]
	ldr r0, _08127A80 @ =sub_811FB28
	str r0, [sp, 0x4]
	str r4, [sp, 0x8]
	movs r0, 0x1
	movs r2, 0x3
	movs r3, 0
	bl sub_811EA44
_08127A62:
	bl nullsub_44
	bl pokemon_change_order
	add sp, 0xC
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08127A74: .4byte gSpecialVar_ItemId
_08127A78: .4byte sub_8107ECC
_08127A7C: .4byte sub_8124DB0
_08127A80: .4byte sub_811FB28
	thumb_func_end sub_81279E0

	thumb_func_start sub_8127A84
sub_8127A84: @ 8127A84
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _08127AA4 @ =gUnknown_20242E8
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _08127AA0
	adds r0, r4, 0
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0
	beq _08127AA8
_08127AA0:
	movs r0, 0x7
	b _08127ABA
	.align 2, 0
_08127AA4: .4byte gUnknown_20242E8
_08127AA8:
	ldr r0, _08127AB4 @ =gUnknown_203B0A0
	ldrb r0, [r0, 0xB]
	cmp r0, 0x1
	beq _08127AB8
	movs r0, 0x2
	b _08127ABA
	.align 2, 0
_08127AB4: .4byte gUnknown_203B0A0
_08127AB8:
	movs r0, 0x3
_08127ABA:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8127A84

	thumb_func_start sub_8127AC0
sub_8127AC0: @ 8127AC0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	bl GetCursorSelectionMonId
	lsls r0, 24
	lsrs r5, r0, 24
	bl sub_811FA20
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08127B08
	cmp r5, 0x1
	beq _08127AE6
	cmp r5, 0x4
	beq _08127AE6
	cmp r5, 0x5
	bne _08127B08
_08127AE6:
	ldr r4, _08127AFC @ =gStringVar1
	bl sub_80444C4
	adds r1, r0, 0
	adds r0, r4, 0
	bl StringCopy
	ldr r0, _08127B00 @ =gStringVar4
	ldr r1, _08127B04 @ =gUnknown_8416A98
	b _08127C86
	.align 2, 0
_08127AFC: .4byte gStringVar1
_08127B00: .4byte gStringVar4
_08127B04: .4byte gUnknown_8416A98
_08127B08:
	movs r0, 0x64
	adds r1, r5, 0
	muls r1, r0
	ldr r0, _08127B2C @ =gPlayerParty
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	cmp r0, 0
	bne _08127B3C
	ldr r1, _08127B30 @ =gStringVar1
	adds r0, r4, 0
	bl GetMonNickname
	ldr r0, _08127B34 @ =gStringVar4
	ldr r1, _08127B38 @ =gUnknown_8416A75
	b _08127C86
	.align 2, 0
_08127B2C: .4byte gPlayerParty
_08127B30: .4byte gStringVar1
_08127B34: .4byte gStringVar4
_08127B38: .4byte gUnknown_8416A75
_08127B3C:
	movs r4, 0
	b _08127B68
_08127B40:
	adds r0, r4, 0
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _08127B62
	adds r0, r5, 0
	bl sub_8127F7C
	lsls r0, 24
	ldr r2, _08127B90 @ =gBattlerPartyIndexes
	lsls r1, r4, 1
	adds r1, r2
	lsrs r0, 24
	ldrh r1, [r1]
	cmp r0, r1
	beq _08127C40
_08127B62:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
_08127B68:
	ldr r0, _08127B94 @ =gBattlersCount
	ldrb r0, [r0]
	cmp r4, r0
	bcc _08127B40
	movs r7, 0x64
	adds r0, r5, 0
	muls r0, r7
	ldr r1, _08127B98 @ =gPlayerParty
	mov r8, r1
	adds r6, r0, r1
	adds r0, r6, 0
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0
	beq _08127BA4
	ldr r0, _08127B9C @ =gStringVar4
	ldr r1, _08127BA0 @ =gUnknown_8416ACB
	b _08127C86
	.align 2, 0
_08127B90: .4byte gBattlerPartyIndexes
_08127B94: .4byte gBattlersCount
_08127B98: .4byte gPlayerParty
_08127B9C: .4byte gStringVar4
_08127BA0: .4byte gUnknown_8416ACB
_08127BA4:
	adds r0, r5, 0
	bl sub_8127F7C
	ldr r1, _08127BC8 @ =gBattleStruct
	ldr r1, [r1]
	adds r1, 0x8B
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r1]
	cmp r0, r1
	bne _08127BD8
	ldr r1, _08127BCC @ =gStringVar1
	adds r0, r6, 0
	bl GetMonNickname
	ldr r0, _08127BD0 @ =gStringVar4
	ldr r1, _08127BD4 @ =gUnknown_8416A55
	b _08127C86
	.align 2, 0
_08127BC8: .4byte gBattleStruct
_08127BCC: .4byte gStringVar1
_08127BD0: .4byte gStringVar4
_08127BD4: .4byte gUnknown_8416A55
_08127BD8:
	ldr r0, _08127BE8 @ =gUnknown_203B0A0
	ldrb r0, [r0, 0xB]
	cmp r0, 0x4
	bne _08127BEC
	bl sub_8044348
	b _08127C8A
	.align 2, 0
_08127BE8: .4byte gUnknown_203B0A0
_08127BEC:
	cmp r0, 0x2
	beq _08127C64
	adds r0, r5, 0
	bl sub_8127F7C
	ldr r1, _08127C30 @ =gUnknown_203B0C1
	strb r0, [r1]
	ldr r1, _08127C34 @ =gUnknown_203B0C0
	movs r0, 0x1
	strb r0, [r1]
	ldr r1, _08127C38 @ =gBattlerPartyIndexes
	ldr r0, _08127C3C @ =gBattlerInMenuId
	ldrb r0, [r0]
	lsls r0, 1
	adds r0, r1
	ldrb r0, [r0]
	bl pokemon_order_func
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8127FF4
	adds r0, r4, 0
	muls r0, r7
	add r0, r8
	adds r1, r6, 0
	bl sub_811FA40
	movs r0, 0x1
	b _08127C8C
	.align 2, 0
_08127C30: .4byte gUnknown_203B0C1
_08127C34: .4byte gUnknown_203B0C0
_08127C38: .4byte gBattlerPartyIndexes
_08127C3C: .4byte gBattlerInMenuId
_08127C40:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08127C54 @ =gPlayerParty
	adds r0, r1
	ldr r1, _08127C58 @ =gStringVar1
	bl GetMonNickname
	ldr r0, _08127C5C @ =gStringVar4
	ldr r1, _08127C60 @ =gUnknown_8416A3A
	b _08127C86
	.align 2, 0
_08127C54: .4byte gPlayerParty
_08127C58: .4byte gStringVar1
_08127C5C: .4byte gStringVar4
_08127C60: .4byte gUnknown_8416A3A
_08127C64:
	ldr r0, _08127C98 @ =gBattlerInMenuId
	ldrb r0, [r0]
	ldr r1, _08127C9C @ =gBattlerPartyIndexes
	lsls r0, 1
	adds r0, r1
	ldrb r0, [r0]
	bl pokemon_order_func
	lsls r0, 24
	lsrs r0, 24
	muls r0, r7
	add r0, r8
	ldr r1, _08127CA0 @ =gStringVar1
	bl GetMonNickname
	ldr r0, _08127CA4 @ =gStringVar4
	ldr r1, _08127CA8 @ =gUnknown_8416A1E
_08127C86:
	bl StringExpandPlaceholders
_08127C8A:
	movs r0, 0
_08127C8C:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08127C98: .4byte gBattlerInMenuId
_08127C9C: .4byte gBattlerPartyIndexes
_08127CA0: .4byte gStringVar1
_08127CA4: .4byte gStringVar4
_08127CA8: .4byte gUnknown_8416A1E
	thumb_func_end sub_8127AC0

	thumb_func_start sub_8127CAC
sub_8127CAC: @ 8127CAC
	push {r4,lr}
	ldr r4, _08127CC8 @ =gUnknown_203B0DC
	bl sub_80435E0
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_8127CCC
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08127CC8: .4byte gUnknown_203B0DC
	thumb_func_end sub_8127CAC

	thumb_func_start sub_8127CCC
sub_8127CCC: @ 8127CCC
	push {r4-r6,lr}
	sub sp, 0x8
	adds r6, r0, 0
	lsls r1, 24
	lsrs r4, r1, 24
	bl sub_811FA20
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08127D02
	cmp r4, 0
	beq _08127CF4
	movs r0, 0x30
	strb r0, [r6]
	movs r0, 0x45
	strb r0, [r6, 0x1]
	movs r0, 0x12
	strb r0, [r6, 0x2]
	b _08127D9C
_08127CF4:
	movs r0, 0x3
	strb r0, [r6]
	movs r0, 0x12
	strb r0, [r6, 0x1]
	movs r0, 0x45
	strb r0, [r6, 0x2]
	b _08127D9C
_08127D02:
	bl sub_8075290
	lsls r0, 24
	cmp r0, 0
	bne _08127D40
	movs r5, 0x1
	movs r0, 0
	bl GetBattlerAtPosition
	mov r2, sp
	ldr r1, _08127D3C @ =gBattlerPartyIndexes
	lsls r0, 24
	lsrs r0, 23
	adds r0, r1
	ldrh r0, [r0]
	strb r0, [r2]
	movs r4, 0
	mov r1, sp
_08127D26:
	ldrb r0, [r1]
	cmp r4, r0
	beq _08127D34
	mov r2, sp
	adds r0, r2, r5
	strb r4, [r0]
	adds r5, 0x1
_08127D34:
	adds r4, 0x1
	cmp r4, 0x5
	ble _08127D26
	b _08127D84
	.align 2, 0
_08127D3C: .4byte gBattlerPartyIndexes
_08127D40:
	movs r5, 0x2
	movs r0, 0
	bl GetBattlerAtPosition
	mov r1, sp
	ldr r4, _08127DA4 @ =gBattlerPartyIndexes
	lsls r0, 24
	lsrs r0, 23
	adds r0, r4
	ldrh r0, [r0]
	strb r0, [r1]
	movs r0, 0x2
	bl GetBattlerAtPosition
	mov r1, sp
	lsls r0, 24
	lsrs r0, 23
	adds r0, r4
	ldrh r0, [r0]
	strb r0, [r1, 0x1]
	movs r4, 0
_08127D6A:
	ldrb r0, [r1]
	cmp r4, r0
	beq _08127D7E
	ldrb r0, [r1, 0x1]
	cmp r4, r0
	beq _08127D7E
	mov r2, sp
	adds r0, r2, r5
	strb r4, [r0]
	adds r5, 0x1
_08127D7E:
	adds r4, 0x1
	cmp r4, 0x5
	ble _08127D6A
_08127D84:
	movs r4, 0
	mov r3, sp
_08127D88:
	adds r0, r6, r4
	ldrb r1, [r3]
	lsls r1, 4
	ldrb r2, [r3, 0x1]
	orrs r1, r2
	strb r1, [r0]
	adds r3, 0x2
	adds r4, 0x1
	cmp r4, 0x2
	ble _08127D88
_08127D9C:
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08127DA4: .4byte gBattlerPartyIndexes
	thumb_func_end sub_8127CCC

	thumb_func_start sub_8127DA8
sub_8127DA8: @ 8127DA8
	push {lr}
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	lsls r1, 24
	lsrs r1, 24
	ldr r0, _08127DC8 @ =gBattleStruct
	lsls r3, r2, 1
	adds r3, r2
	adds r3, 0x60
	ldr r0, [r0]
	adds r0, r3
	bl sub_8127DCC
	pop {r0}
	bx r0
	.align 2, 0
_08127DC8: .4byte gBattleStruct
	thumb_func_end sub_8127DA8

	thumb_func_start sub_8127DCC
sub_8127DCC: @ 8127DCC
	push {r4-r7,lr}
	sub sp, 0x8
	adds r5, r0, 0
	adds r0, r2, 0
	lsls r1, 24
	lsrs r7, r1, 24
	lsls r0, 24
	lsrs r0, 24
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _08127DF4
	movs r0, 0
	bl GetBattlerAtPosition
	lsls r0, 24
	lsrs r4, r0, 24
	movs r0, 0x2
	b _08127E00
_08127DF4:
	movs r0, 0x1
	bl GetBattlerAtPosition
	lsls r0, 24
	lsrs r4, r0, 24
	movs r0, 0x3
_08127E00:
	bl GetBattlerAtPosition
	lsls r0, 24
	lsrs r6, r0, 24
	bl sub_811FA20
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08127E34
	cmp r7, 0
	beq _08127E26
	movs r0, 0x30
	strb r0, [r5]
	movs r0, 0x45
	strb r0, [r5, 0x1]
	movs r0, 0x12
	strb r0, [r5, 0x2]
	b _08127EB6
_08127E26:
	movs r0, 0x3
	strb r0, [r5]
	movs r0, 0x12
	strb r0, [r5, 0x1]
	movs r0, 0x45
	strb r0, [r5, 0x2]
	b _08127EB6
_08127E34:
	bl sub_8075290
	lsls r0, 24
	cmp r0, 0
	bne _08127E6C
	movs r3, 0x1
	mov r2, sp
	ldr r1, _08127E68 @ =gBattlerPartyIndexes
	lsls r0, r4, 1
	adds r0, r1
	ldrh r0, [r0]
	strb r0, [r2]
	movs r4, 0
	mov r1, sp
_08127E50:
	ldrb r0, [r1]
	cmp r4, r0
	beq _08127E5E
	mov r2, sp
	adds r0, r2, r3
	strb r4, [r0]
	adds r3, 0x1
_08127E5E:
	adds r4, 0x1
	cmp r4, 0x5
	ble _08127E50
	b _08127E9E
	.align 2, 0
_08127E68: .4byte gBattlerPartyIndexes
_08127E6C:
	movs r3, 0x2
	mov r1, sp
	ldr r2, _08127EC0 @ =gBattlerPartyIndexes
	lsls r0, r4, 1
	adds r0, r2
	ldrh r0, [r0]
	strb r0, [r1]
	lsls r0, r6, 1
	adds r0, r2
	ldrh r0, [r0]
	strb r0, [r1, 0x1]
	movs r4, 0
_08127E84:
	ldrb r0, [r1]
	cmp r4, r0
	beq _08127E98
	ldrb r0, [r1, 0x1]
	cmp r4, r0
	beq _08127E98
	mov r2, sp
	adds r0, r2, r3
	strb r4, [r0]
	adds r3, 0x1
_08127E98:
	adds r4, 0x1
	cmp r4, 0x5
	ble _08127E84
_08127E9E:
	movs r4, 0
	mov r3, sp
_08127EA2:
	adds r0, r5, r4
	ldrb r1, [r3]
	lsls r1, 4
	ldrb r2, [r3, 0x1]
	orrs r1, r2
	strb r1, [r0]
	adds r3, 0x2
	adds r4, 0x1
	cmp r4, 0x2
	ble _08127EA2
_08127EB6:
	add sp, 0x8
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08127EC0: .4byte gBattlerPartyIndexes
	thumb_func_end sub_8127DCC

	thumb_func_start sub_8127EC4
sub_8127EC4: @ 8127EC4
	push {r4-r7,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 24
	lsrs r5, r1, 24
	lsls r2, 24
	lsrs r6, r2, 24
	movs r7, 0
	bl sub_811FA20
	lsls r0, 24
	cmp r0, 0
	beq _08127F72
	ldr r0, _08127F28 @ =gBattleStruct
	lsls r1, r4, 1
	adds r1, r4
	adds r1, 0x60
	ldr r0, [r0]
	adds r4, r0, r1
	movs r2, 0
	add r6, sp
	mov r12, r6
	movs r6, 0xF
	mov r3, sp
_08127EF6:
	adds r1, r4, r2
	ldrb r0, [r1]
	lsrs r0, 4
	strb r0, [r3]
	adds r3, 0x1
	ldrb r1, [r1]
	adds r0, r6, 0
	ands r0, r1
	strb r0, [r3]
	adds r3, 0x1
	adds r2, 0x1
	cmp r2, 0x2
	ble _08127EF6
	mov r0, r12
	ldrb r3, [r0]
	movs r2, 0
	mov r0, sp
	ldrb r0, [r0]
	cmp r0, r5
	bne _08127F2C
	mov r0, sp
	ldrb r7, [r0]
	strb r3, [r0]
	b _08127F40
	.align 2, 0
_08127F28: .4byte gBattleStruct
_08127F2C:
	adds r2, 0x1
	cmp r2, 0x5
	bgt _08127F40
	mov r0, sp
	adds r1, r0, r2
	ldrb r0, [r1]
	cmp r0, r5
	bne _08127F2C
	adds r7, r0, 0
	strb r3, [r1]
_08127F40:
	cmp r2, 0x6
	beq _08127F72
	mov r0, r12
	strb r7, [r0]
	mov r0, sp
	ldrb r0, [r0]
	lsls r0, 4
	mov r1, sp
	ldrb r1, [r1, 0x1]
	orrs r0, r1
	strb r0, [r4]
	mov r0, sp
	ldrb r0, [r0, 0x2]
	lsls r0, 4
	mov r1, sp
	ldrb r1, [r1, 0x3]
	orrs r0, r1
	strb r0, [r4, 0x1]
	mov r0, sp
	ldrb r0, [r0, 0x4]
	lsls r0, 4
	mov r1, sp
	ldrb r1, [r1, 0x5]
	orrs r0, r1
	strb r0, [r4, 0x2]
_08127F72:
	add sp, 0x8
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8127EC4

	thumb_func_start sub_8127F7C
sub_8127F7C: @ 8127F7C
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	movs r1, 0x1
	ands r1, r2
	lsrs r2, r0, 25
	cmp r1, 0
	beq _08127F9C
	ldr r0, _08127F98 @ =gUnknown_203B0DC
	adds r0, r2, r0
	ldrb r0, [r0]
	movs r1, 0xF
	ands r1, r0
	b _08127FA4
	.align 2, 0
_08127F98: .4byte gUnknown_203B0DC
_08127F9C:
	ldr r0, _08127FAC @ =gUnknown_203B0DC
	adds r0, r2, r0
	ldrb r0, [r0]
	lsrs r1, r0, 4
_08127FA4:
	adds r0, r1, 0
	pop {r1}
	bx r1
	.align 2, 0
_08127FAC: .4byte gUnknown_203B0DC
	thumb_func_end sub_8127F7C

	thumb_func_start sub_8127FB0
sub_8127FB0: @ 8127FB0
	push {r4,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	lsls r1, 24
	lsrs r4, r1, 24
	movs r1, 0x1
	ands r1, r3
	lsrs r3, r0, 25
	cmp r1, 0
	beq _08127FD8
	ldr r0, _08127FD4 @ =gUnknown_203B0DC
	adds r0, r3, r0
	ldrb r2, [r0]
	movs r1, 0xF0
	ands r1, r2
	orrs r1, r4
	strb r1, [r0]
	b _08127FE8
	.align 2, 0
_08127FD4: .4byte gUnknown_203B0DC
_08127FD8:
	ldr r2, _08127FF0 @ =gUnknown_203B0DC
	adds r2, r3, r2
	ldrb r1, [r2]
	movs r0, 0xF
	ands r0, r1
	lsls r1, r4, 4
	orrs r0, r1
	strb r0, [r2]
_08127FE8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08127FF0: .4byte gUnknown_203B0DC
	thumb_func_end sub_8127FB0

	thumb_func_start sub_8127FF4
sub_8127FF4: @ 8127FF4
	push {r4-r6,lr}
	adds r5, r0, 0
	adds r6, r1, 0
	lsls r5, 24
	lsrs r5, 24
	lsls r6, 24
	lsrs r6, 24
	adds r0, r5, 0
	bl sub_8127F7C
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r6, 0
	bl sub_8127F7C
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl sub_8127FB0
	adds r0, r6, 0
	adds r1, r4, 0
	bl sub_8127FB0
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8127FF4

	thumb_func_start pokemon_order_func
pokemon_order_func: @ 8128030
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	movs r3, 0
	movs r2, 0
	ldr r5, _08128058 @ =gUnknown_203B0DC
_0812803C:
	adds r0, r3, r5
	ldrb r1, [r0]
	lsrs r0, r1, 4
	cmp r0, r4
	beq _08128054
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	movs r0, 0xF
	ands r0, r1
	cmp r0, r4
	bne _0812805C
_08128054:
	adds r0, r2, 0
	b _0812806E
	.align 2, 0
_08128058: .4byte gUnknown_203B0DC
_0812805C:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x2
	bls _0812803C
	movs r0, 0
_0812806E:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end pokemon_order_func

	thumb_func_start pokemon_change_order
pokemon_change_order: @ 8128074
	push {r4-r6,lr}
	movs r4, 0x96
	lsls r4, 2
	adds r0, r4, 0
	bl Alloc
	adds r5, r0, 0
	ldr r1, _081280C0 @ =gPlayerParty
	adds r2, r4, 0
	bl memcpy
	movs r4, 0
	movs r6, 0x64
_0812808E:
	adds r0, r4, 0
	bl pokemon_order_func
	lsls r0, 24
	lsrs r0, 24
	muls r0, r6
	ldr r1, _081280C0 @ =gPlayerParty
	adds r0, r1
	adds r1, r4, 0
	muls r1, r6
	adds r1, r5
	movs r2, 0x64
	bl memcpy
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x5
	bls _0812808E
	adds r0, r5, 0
	bl Free
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081280C0: .4byte gPlayerParty
	thumb_func_end pokemon_change_order

	thumb_func_start sub_81280C4
sub_81280C4: @ 81280C4
	push {r4-r6,lr}
	movs r4, 0x96
	lsls r4, 2
	adds r0, r4, 0
	bl Alloc
	adds r5, r0, 0
	ldr r1, _08128110 @ =gPlayerParty
	adds r2, r4, 0
	bl memcpy
	movs r4, 0
	movs r6, 0x64
_081280DE:
	adds r0, r4, 0
	bl sub_8127F7C
	lsls r0, 24
	lsrs r0, 24
	muls r0, r6
	ldr r1, _08128110 @ =gPlayerParty
	adds r0, r1
	adds r1, r4, 0
	muls r1, r6
	adds r1, r5
	movs r2, 0x64
	bl memcpy
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x5
	bls _081280DE
	adds r0, r5, 0
	bl Free
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08128110: .4byte gPlayerParty
	thumb_func_end sub_81280C4

	thumb_func_start sub_8128114
sub_8128114: @ 8128114
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	movs r6, 0x1
	movs r7, 0x64
	ldr r0, _0812816C @ =gPlayerParty
	mov r8, r0
_08128122:
	adds r0, r6, 0
	bl sub_8127F7C
	lsls r0, 24
	lsrs r0, 24
	muls r0, r7
	mov r1, r8
	adds r5, r0, r1
	adds r0, r5, 0
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _08128170
	adds r0, r5, 0
	movs r1, 0x39
	bl GetMonData
	cmp r0, 0
	beq _08128170
	movs r0, 0
	bl sub_8127F7C
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0
	adds r1, r6, 0
	bl sub_8127FF4
	adds r0, r4, 0
	muls r0, r7
	add r0, r8
	adds r1, r5, 0
	bl sub_811FA40
	b _0812817A
	.align 2, 0
_0812816C: .4byte gPlayerParty
_08128170:
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x5
	bls _08128122
_0812817A:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8128114

	thumb_func_start sub_8128184
sub_8128184: @ 8128184
	push {lr}
	bl sub_8108CF0
	ldr r0, _08128194 @ =sub_8030ADC
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_08128194: .4byte sub_8030ADC
	thumb_func_end sub_8128184

	thumb_func_start sub_8128198
sub_8128198: @ 8128198
	push {lr}
	sub sp, 0xC
	movs r0, 0x7F
	str r0, [sp]
	ldr r0, _081281BC @ =sub_81281C4
	str r0, [sp, 0x4]
	ldr r0, _081281C0 @ =gMain
	ldr r0, [r0, 0x8]
	str r0, [sp, 0x8]
	movs r0, 0x5
	movs r1, 0x3
	movs r2, 0
	movs r3, 0
	bl sub_811EA44
	add sp, 0xC
	pop {r0}
	bx r0
	.align 2, 0
_081281BC: .4byte sub_81281C4
_081281C0: .4byte gMain
	thumb_func_end sub_8128198

	thumb_func_start sub_81281C4
sub_81281C4: @ 81281C4
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _081281F4 @ =gTasks
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	adds r4, r1
	movs r1, 0x80
	lsls r1, 1
	strh r1, [r4, 0x8]
	bl sub_81282DC
	movs r1, 0x80
	lsls r1, 9
	movs r0, 0x2
	movs r2, 0
	bl ChangeBgX
	ldr r0, _081281F8 @ =sub_81281FC
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081281F4: .4byte gTasks
_081281F8: .4byte sub_81281FC
	thumb_func_end sub_81281C4

	thumb_func_start sub_81281FC
sub_81281FC: @ 81281FC
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r6, r5, 2
	adds r0, r6, r5
	lsls r0, 3
	ldr r1, _08128270 @ =gTasks+0x8
	adds r4, r0, r1
	ldr r0, _08128274 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08128268
	ldrh r0, [r4]
	subs r0, 0x8
	strh r0, [r4]
	adds r0, r5, 0
	bl sub_81282DC
	movs r1, 0
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _08128268
	movs r4, 0x3
	ldr r7, _08128278 @ =gUnknown_2022B58
_08128230:
	subs r0, r4, 0x3
	lsls r0, 5
	adds r0, r7
	ldrh r0, [r0]
	cmp r0, 0
	beq _0812824C
	ldr r0, _0812827C @ =gUnknown_203B0B4
	ldr r1, [r0]
	lsls r0, r4, 4
	adds r0, r1
	ldrb r0, [r0, 0x9]
	movs r1, 0
	bl sub_812238C
_0812824C:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x5
	bls _08128230
	movs r0, 0x71
	bl PlaySE
	ldr r0, _08128280 @ =gTasks
	adds r1, r6, r5
	lsls r1, 3
	adds r1, r0
	ldr r0, _08128284 @ =sub_8128288
	str r0, [r1]
_08128268:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08128270: .4byte gTasks+0x8
_08128274: .4byte gPaletteFade
_08128278: .4byte gUnknown_2022B58
_0812827C: .4byte gUnknown_203B0B4
_08128280: .4byte gTasks
_08128284: .4byte sub_8128288
	thumb_func_end sub_81281FC

	thumb_func_start sub_8128288
sub_8128288: @ 8128288
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r1, _081282B4 @ =gTasks+0x8
	adds r0, r1
	ldrh r1, [r0]
	adds r1, 0x1
	strh r1, [r0]
	lsls r1, 16
	movs r0, 0x80
	lsls r0, 17
	cmp r1, r0
	bne _081282AE
	adds r0, r2, 0
	bl sub_811FA78
_081282AE:
	pop {r0}
	bx r0
	.align 2, 0
_081282B4: .4byte gTasks+0x8
	thumb_func_end sub_8128288

	thumb_func_start sub_81282B8
sub_81282B8: @ 81282B8
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r1, 16
	lsrs r3, r1, 16
	cmp r1, 0
	blt _081282D2
	ldr r1, _081282D8 @ =gSprites
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r1
	strh r3, [r0, 0x24]
_081282D2:
	pop {r0}
	bx r0
	.align 2, 0
_081282D8: .4byte gSprites
	thumb_func_end sub_81282B8

	thumb_func_start sub_81282DC
sub_81282DC: @ 81282DC
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _08128364 @ =gTasks+0x8
	adds r5, r1, r0
	movs r6, 0x3
	ldr r7, _08128368 @ =gUnknown_203B0B4
_081282F0:
	ldr r0, _0812836C @ =gUnknown_2022B58
	subs r1, r6, 0x3
	lsls r1, 5
	adds r1, r0
	ldrh r0, [r1]
	cmp r0, 0
	beq _08128348
	ldr r0, [r7]
	lsls r4, r6, 4
	adds r0, r4, r0
	ldrb r0, [r0, 0x9]
	ldrh r1, [r5]
	subs r1, 0x8
	lsls r1, 16
	asrs r1, 16
	bl sub_81282B8
	ldr r0, [r7]
	adds r0, r4, r0
	ldrb r0, [r0, 0xA]
	ldrh r1, [r5]
	subs r1, 0x8
	lsls r1, 16
	asrs r1, 16
	bl sub_81282B8
	ldr r0, [r7]
	adds r0, r4, r0
	ldrb r0, [r0, 0xB]
	ldrh r1, [r5]
	subs r1, 0x8
	lsls r1, 16
	asrs r1, 16
	bl sub_81282B8
	ldr r0, [r7]
	adds r4, r0
	ldrb r0, [r4, 0xC]
	ldrh r1, [r5]
	subs r1, 0x8
	lsls r1, 16
	asrs r1, 16
	bl sub_81282B8
_08128348:
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x5
	bls _081282F0
	movs r1, 0x80
	lsls r1, 4
	movs r0, 0x2
	movs r2, 0x1
	bl ChangeBgX
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08128364: .4byte gTasks+0x8
_08128368: .4byte gUnknown_203B0B4
_0812836C: .4byte gUnknown_2022B58
	thumb_func_end sub_81282DC

	thumb_func_start sub_8128370
sub_8128370: @ 8128370
	push {lr}
	sub sp, 0xC
	ldr r1, _08128398 @ =gFieldCallback2
	ldr r0, _0812839C @ =hm_add_c3_without_phase_2
	str r0, [r1]
	movs r0, 0xF
	str r0, [sp]
	ldr r0, _081283A0 @ =sub_811FB28
	str r0, [sp, 0x4]
	ldr r0, _081283A4 @ =CB2_ReturnToField
	str r0, [sp, 0x8]
	movs r0, 0x6
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl sub_811EA44
	add sp, 0xC
	pop {r0}
	bx r0
	.align 2, 0
_08128398: .4byte gFieldCallback2
_0812839C: .4byte hm_add_c3_without_phase_2
_081283A0: .4byte sub_811FB28
_081283A4: .4byte CB2_ReturnToField
	thumb_func_end sub_8128370

	thumb_func_start sub_81283A8
sub_81283A8: @ 81283A8
	push {lr}
	sub sp, 0xC
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _081283D4 @ =gFieldCallback2
	ldr r1, _081283D8 @ =hm_add_c3_without_phase_2
	str r1, [r2]
	movs r1, 0
	str r1, [sp]
	ldr r1, _081283DC @ =sub_811FB28
	str r1, [sp, 0x4]
	ldr r1, _081283E0 @ =CB2_ReturnToField
	str r1, [sp, 0x8]
	movs r1, 0
	movs r2, 0xB
	movs r3, 0
	bl sub_811EA44
	add sp, 0xC
	pop {r0}
	bx r0
	.align 2, 0
_081283D4: .4byte gFieldCallback2
_081283D8: .4byte hm_add_c3_without_phase_2
_081283DC: .4byte sub_811FB28
_081283E0: .4byte CB2_ReturnToField
	thumb_func_end sub_81283A8

	thumb_func_start hm_add_c3_without_phase_2
hm_add_c3_without_phase_2: @ 81283E4
	push {lr}
	bl sub_807DC00
	ldr r0, _081283F8 @ =task_hm_without_phase_2
	movs r1, 0xA
	bl CreateTask
	movs r0, 0x1
	pop {r1}
	bx r1
	.align 2, 0
_081283F8: .4byte task_hm_without_phase_2
	thumb_func_end hm_add_c3_without_phase_2

	thumb_func_start task_hm_without_phase_2
task_hm_without_phase_2: @ 81283FC
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_807AA70
	lsls r0, 24
	cmp r0, 0
	beq _0812841A
	adds r0, r4, 0
	bl DestroyTask
	bl ScriptContext2_Disable
	bl EnableBothScriptContexts
_0812841A:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end task_hm_without_phase_2

	.align 2, 0 @ Don't pad with nop.
