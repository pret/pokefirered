	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_81317F8
sub_81317F8: @ 81317F8
	push {r4-r7,lr}
	adds r7, r1, 0
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r2, 24
	lsrs r6, r2, 24
	bl sub_8131A8C
	ldr r4, _08131854 @ =gUnknown_203B118
	movs r0, 0x1C
	bl Alloc
	str r0, [r4]
	movs r1, 0
	str r1, [r0]
	movs r1, 0xFF
	strb r1, [r0, 0x8]
	ldr r1, [r4]
	movs r0, 0x1
	negs r0, r0
	strb r0, [r1, 0x7]
	cmp r5, 0x5
	beq _0813182A
	ldr r0, _08131858 @ =gUnknown_203B10C
	strb r5, [r0, 0x4]
_0813182A:
	cmp r7, 0
	beq _08131832
	ldr r0, _08131858 @ =gUnknown_203B10C
	str r7, [r0]
_08131832:
	cmp r6, 0xFF
	beq _0813183A
	ldr r0, _08131858 @ =gUnknown_203B10C
	strb r6, [r0, 0x5]
_0813183A:
	ldr r2, _0813185C @ =gUnknown_3003E50
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	ldr r0, _08131860 @ =sub_8131894
	bl SetMainCallback2
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08131854: .4byte gUnknown_203B118
_08131858: .4byte gUnknown_203B10C
_0813185C: .4byte gUnknown_3003E50
_08131860: .4byte sub_8131894
	thumb_func_end sub_81317F8

	thumb_func_start sub_8131864
sub_8131864: @ 8131864
	push {lr}
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl do_scheduled_bg_tilemap_copies_to_vram
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	thumb_func_end sub_8131864

	thumb_func_start sub_8131880
sub_8131880: @ 8131880
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	thumb_func_end sub_8131880

	thumb_func_start sub_8131894
sub_8131894: @ 8131894
	push {lr}
_08131896:
	bl sub_80BF72C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _081318BA
	bl sub_81318C0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _081318BA
	bl sub_80BF708
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08131896
_081318BA:
	pop {r0}
	bx r0
	thumb_func_end sub_8131894

	thumb_func_start sub_81318C0
sub_81318C0: @ 81318C0
	push {r4,lr}
	sub sp, 0x4
	ldr r0, _081318E0 @ =gUnknown_30030F0
	movs r1, 0x87
	lsls r1, 3
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x12
	bls _081318D4
	b _08131A68
_081318D4:
	lsls r0, 2
	ldr r1, _081318E4 @ =_081318E8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081318E0: .4byte gUnknown_30030F0
_081318E4: .4byte _081318E8
	.align 2, 0
_081318E8:
	.4byte _08131934
	.4byte _0813193E
	.4byte _08131944
	.4byte _0813194A
	.4byte _08131950
	.4byte _08131956
	.4byte _0813195C
	.4byte _08131970
	.4byte _08131976
	.4byte _08131984
	.4byte _08131990
	.4byte _0813199E
	.4byte _081319A4
	.4byte _081319AE
	.4byte _081319B4
	.4byte _08131A04
	.4byte _08131A0A
	.4byte _08131A34
	.4byte _08131A42
_08131934:
	bl sub_80BF768
	bl clear_scheduled_bg_copies_to_vram
	b _08131A52
_0813193E:
	bl remove_some_task
	b _08131A52
_08131944:
	bl FreeAllSpritePalettes
	b _08131A52
_0813194A:
	bl ResetPaletteFade
	b _08131A52
_08131950:
	bl ResetSpriteData
	b _08131A52
_08131956:
	bl ResetTasks
	b _08131A52
_0813195C:
	bl sub_8131AB8
	ldr r0, _0813196C @ =gUnknown_203B118
	ldr r1, [r0]
	movs r0, 0
	strh r0, [r1, 0x12]
	b _08131A52
	.align 2, 0
_0813196C: .4byte gUnknown_203B118
_08131970:
	bl sub_8133244
	b _08131A52
_08131976:
	bl sub_8131B20
	lsls r0, 24
	cmp r0, 0
	bne _08131982
	b _08131A80
_08131982:
	b _08131A52
_08131984:
	ldr r0, _0813198C @ =gUnknown_20398A4
	bl sub_809A5E4
	b _08131A52
	.align 2, 0
_0813198C: .4byte gUnknown_20398A4
_08131990:
	bl sub_81320BC
	bl sub_8132120
	bl sub_8132170
	b _08131A52
_0813199E:
	bl sub_8133404
	b _08131A52
_081319A4:
	bl sub_8131C10
	bl sub_8131C50
	b _08131A52
_081319AE:
	bl sub_81333C4
	b _08131A52
_081319B4:
	ldr r0, _081319C0 @ =gUnknown_203B10C
	ldrb r0, [r0, 0x4]
	cmp r0, 0x4
	bne _081319C8
	ldr r0, _081319C4 @ =sub_8132F20
	b _081319CA
	.align 2, 0
_081319C0: .4byte gUnknown_203B10C
_081319C4: .4byte sub_8132F20
_081319C8:
	ldr r0, _081319F4 @ =sub_81322D4
_081319CA:
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _081319F8 @ =gUnknown_3005E70
	ldr r2, _081319FC @ =gUnknown_203B10C
	ldrh r1, [r2, 0xA]
	ldrh r2, [r2, 0x8]
	bl ListMenuInit
	ldr r2, _08131A00 @ =gUnknown_3005090
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r2
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r1, 0x8]
	b _08131A52
	.align 2, 0
_081319F4: .4byte sub_81322D4
_081319F8: .4byte gUnknown_3005E70
_081319FC: .4byte gUnknown_203B10C
_08131A00: .4byte gUnknown_3005090
_08131A04:
	bl sub_8132018
	b _08131A52
_08131A0A:
	ldr r0, _08131A2C @ =gUnknown_203B10C
	ldrh r1, [r0, 0x8]
	ldrh r0, [r0, 0xA]
	adds r1, r0
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x4
	bl sub_809A798
	lsls r0, 16
	lsrs r0, 16
	bl sub_813368C
	ldr r1, _08131A30 @ =gUnknown_203B118
	ldr r1, [r1]
	strb r0, [r1, 0x4]
	b _08131A52
	.align 2, 0
_08131A2C: .4byte gUnknown_203B10C
_08131A30: .4byte gUnknown_203B118
_08131A34:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0x10
	movs r2, 0
	bl BlendPalettes
	b _08131A52
_08131A42:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
_08131A52:
	ldr r1, _08131A64 @ =gUnknown_30030F0
	movs r0, 0x87
	lsls r0, 3
	adds r1, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _08131A80
	.align 2, 0
_08131A64: .4byte gUnknown_30030F0
_08131A68:
	ldr r0, _08131A78 @ =sub_8131880
	bl SetVBlankCallback
	ldr r0, _08131A7C @ =sub_8131864
	bl SetMainCallback2
	movs r0, 0x1
	b _08131A82
	.align 2, 0
_08131A78: .4byte sub_8131880
_08131A7C: .4byte sub_8131864
_08131A80:
	movs r0, 0
_08131A82:
	add sp, 0x4
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_81318C0

	thumb_func_start sub_8131A8C
sub_8131A8C: @ 8131A8C
	ldr r0, _08131AA4 @ =gUnknown_203B118
	movs r1, 0
	str r1, [r0]
	ldr r0, _08131AA8 @ =gUnknown_203B120
	str r1, [r0]
	ldr r0, _08131AAC @ =gUnknown_203B124
	str r1, [r0]
	ldr r0, _08131AB0 @ =gUnknown_203B128
	str r1, [r0]
	ldr r0, _08131AB4 @ =gUnknown_203B12C
	str r1, [r0]
	bx lr
	.align 2, 0
_08131AA4: .4byte gUnknown_203B118
_08131AA8: .4byte gUnknown_203B120
_08131AAC: .4byte gUnknown_203B124
_08131AB0: .4byte gUnknown_203B128
_08131AB4: .4byte gUnknown_203B12C
	thumb_func_end sub_8131A8C

	thumb_func_start sub_8131AB8
sub_8131AB8: @ 8131AB8
	push {r4,lr}
	bl sub_80BF7C8
	ldr r4, _08131B18 @ =gUnknown_203B120
	movs r0, 0x80
	lsls r0, 4
	bl AllocZeroed
	str r0, [r4]
	movs r0, 0
	bl sub_8001618
	ldr r1, _08131B1C @ =gUnknown_8463134
	movs r0, 0
	movs r2, 0x3
	bl sub_8001658
	ldr r1, [r4]
	movs r0, 0x2
	bl SetBgTilemapBuffer
	movs r0, 0x1
	bl schedule_bg_copy_tilemap_to_vram
	movs r0, 0x2
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
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08131B18: .4byte gUnknown_203B120
_08131B1C: .4byte gUnknown_8463134
	thumb_func_end sub_8131AB8

	thumb_func_start sub_8131B20
sub_8131B20: @ 8131B20
	push {r4,lr}
	sub sp, 0x4
	ldr r4, _08131B3C @ =gUnknown_203B118
	ldr r0, [r4]
	movs r1, 0x12
	ldrsh r0, [r0, r1]
	cmp r0, 0x4
	bhi _08131BF8
	lsls r0, 2
	ldr r1, _08131B40 @ =_08131B44
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08131B3C: .4byte gUnknown_203B118
_08131B40: .4byte _08131B44
	.align 2, 0
_08131B44:
	.4byte _08131B58
	.4byte _08131B74
	.4byte _08131B94
	.4byte _08131BAC
	.4byte _08131BDC
_08131B58:
	bl reset_temp_tile_data_buffers
	ldr r1, _08131B70 @ =gUnknown_8E845D8
	movs r0, 0
	str r0, [sp]
	movs r0, 0x1
	movs r2, 0
	movs r3, 0
	bl decompress_and_copy_tile_data_to_vram
	b _08131BE2
	.align 2, 0
_08131B70: .4byte gUnknown_8E845D8
_08131B74:
	bl free_temp_tile_data_buffers_if_possible
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08131C06
	ldr r0, _08131B8C @ =gUnknown_8E84A24
	ldr r1, _08131B90 @ =gUnknown_203B120
	ldr r1, [r1]
	bl LZDecompressWram
	b _08131BE2
	.align 2, 0
_08131B8C: .4byte gUnknown_8E84A24
_08131B90: .4byte gUnknown_203B120
_08131B94:
	ldr r4, _08131BA8 @ =gUnknown_8E84B70
	movs r0, 0x1
	bl GetBgTilemapBuffer
	adds r1, r0, 0
	adds r0, r4, 0
	bl LZDecompressWram
	b _08131BE2
	.align 2, 0
_08131BA8: .4byte gUnknown_8E84B70
_08131BAC:
	ldr r0, _08131BC4 @ =gUnknown_300500C
	ldr r0, [r0]
	ldrb r0, [r0, 0x8]
	cmp r0, 0
	bne _08131BCC
	ldr r0, _08131BC8 @ =gUnknown_8E84CB0
	movs r1, 0
	movs r2, 0x80
	bl LoadCompressedPalette
	b _08131BE2
	.align 2, 0
_08131BC4: .4byte gUnknown_300500C
_08131BC8: .4byte gUnknown_8E84CB0
_08131BCC:
	ldr r0, _08131BD8 @ =gUnknown_8E84D20
	movs r1, 0
	movs r2, 0x80
	bl LoadCompressedPalette
	b _08131BE2
	.align 2, 0
_08131BD8: .4byte gUnknown_8E84D20
_08131BDC:
	ldr r0, _08131BF0 @ =gUnknown_8463218
	bl LoadCompressedObjectPic
_08131BE2:
	ldr r0, _08131BF4 @ =gUnknown_203B118
	ldr r1, [r0]
	ldrh r0, [r1, 0x12]
	adds r0, 0x1
	strh r0, [r1, 0x12]
	b _08131C06
	.align 2, 0
_08131BF0: .4byte gUnknown_8463218
_08131BF4: .4byte gUnknown_203B118
_08131BF8:
	bl sub_81338A8
	ldr r1, [r4]
	movs r0, 0
	strh r0, [r1, 0x12]
	movs r0, 0x1
	b _08131C08
_08131C06:
	movs r0, 0
_08131C08:
	add sp, 0x4
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8131B20

	thumb_func_start sub_8131C10
sub_8131C10: @ 8131C10
	push {r4,lr}
	ldr r0, _08131C40 @ =gUnknown_20398A4
	ldr r4, _08131C44 @ =gUnknown_203B124
	ldrb r0, [r0, 0x4]
	adds r0, 0x1
	lsls r0, 3
	bl Alloc
	str r0, [r4]
	ldr r4, _08131C48 @ =gUnknown_203B128
	ldr r0, _08131C4C @ =gUnknown_203B118
	ldr r0, [r0]
	ldrb r1, [r0, 0x6]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r1
	bl Alloc
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08131C40: .4byte gUnknown_20398A4
_08131C44: .4byte gUnknown_203B124
_08131C48: .4byte gUnknown_203B128
_08131C4C: .4byte gUnknown_203B118
	thumb_func_end sub_8131C10

	thumb_func_start sub_8131C50
sub_8131C50: @ 8131C50
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r0, _08131D28 @ =gUnknown_20398A4
	mov r8, r0
	movs r6, 0
	ldr r0, _08131D2C @ =gUnknown_203B118
	ldr r0, [r0]
	ldrb r0, [r0, 0x6]
	cmp r6, r0
	bcs _08131CA0
	ldr r7, _08131D30 @ =gUnknown_203B128
_08131C68:
	lsls r5, r6, 3
	subs r4, r5, r6
	lsls r4, 2
	adds r4, r6
	ldr r0, [r7]
	adds r0, r4
	mov r1, r8
	ldr r2, [r1]
	lsls r1, r6, 2
	adds r1, r2
	ldrh r1, [r1]
	bl sub_8131D48
	ldr r0, _08131D34 @ =gUnknown_203B124
	ldr r0, [r0]
	adds r5, r0
	ldr r0, [r7]
	adds r0, r4
	str r0, [r5]
	str r6, [r5, 0x4]
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	ldr r0, _08131D2C @ =gUnknown_203B118
	ldr r0, [r0]
	ldrb r0, [r0, 0x6]
	cmp r6, r0
	bcc _08131C68
_08131CA0:
	ldr r0, _08131D34 @ =gUnknown_203B124
	ldr r3, [r0]
	lsls r0, r6, 3
	adds r0, r3
	ldr r1, _08131D38 @ =gUnknown_84166DB
	str r1, [r0]
	movs r1, 0x2
	negs r1, r1
	str r1, [r0, 0x4]
	ldr r2, _08131D3C @ =gUnknown_3005E70
	str r3, [r2]
	ldr r0, _08131D2C @ =gUnknown_203B118
	ldr r3, [r0]
	ldrb r0, [r3, 0x6]
	adds r0, 0x1
	movs r1, 0
	strh r0, [r2, 0xC]
	strb r1, [r2, 0x10]
	strb r1, [r2, 0x11]
	movs r0, 0x8
	strb r0, [r2, 0x12]
	strb r1, [r2, 0x13]
	ldrb r0, [r2, 0x16]
	movs r4, 0x8
	negs r4, r4
	ands r4, r0
	movs r0, 0x39
	negs r0, r0
	ands r4, r0
	movs r0, 0x10
	orrs r4, r0
	strb r4, [r2, 0x16]
	ldrb r1, [r2, 0x14]
	movs r0, 0x10
	negs r0, r0
	ands r0, r1
	movs r5, 0x2
	orrs r0, r5
	strb r0, [r2, 0x14]
	ldrb r1, [r3, 0x5]
	strh r1, [r2, 0xE]
	ldrb r1, [r2, 0x17]
	movs r3, 0x40
	negs r3, r3
	ands r3, r1
	orrs r3, r5
	movs r1, 0xF
	ands r0, r1
	movs r1, 0x20
	orrs r0, r1
	strb r0, [r2, 0x14]
	movs r0, 0x30
	strb r0, [r2, 0x15]
	ldr r0, _08131D40 @ =sub_8131E18
	str r0, [r2, 0x4]
	ldr r0, _08131D44 @ =sub_8131E68
	str r0, [r2, 0x8]
	movs r0, 0x3F
	ands r3, r0
	strb r3, [r2, 0x17]
	ands r4, r0
	strb r4, [r2, 0x16]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08131D28: .4byte gUnknown_20398A4
_08131D2C: .4byte gUnknown_203B118
_08131D30: .4byte gUnknown_203B128
_08131D34: .4byte gUnknown_203B124
_08131D38: .4byte gUnknown_84166DB
_08131D3C: .4byte gUnknown_3005E70
_08131D40: .4byte sub_8131E18
_08131D44: .4byte sub_8131E68
	thumb_func_end sub_8131C50

	thumb_func_start sub_8131D48
sub_8131D48: @ 8131D48
	push {r4-r7,lr}
	adds r7, r0, 0
	lsls r1, 16
	lsrs r6, r1, 16
	ldr r5, _08131D8C @ =gUnknown_2021D18
	ldr r1, _08131D90 @ =gUnknown_84166FF
	adds r0, r5, 0
	bl StringCopy
	movs r0, 0xA9
	lsls r0, 1
	cmp r6, r0
	bls _08131DA4
	ldr r1, _08131D94 @ =gUnknown_8463178
	adds r0, r5, 0
	bl StringAppend
	ldr r1, _08131D98 @ =gUnknown_8416226
	adds r0, r5, 0
	bl StringAppend
	ldr r4, _08131D9C @ =gUnknown_2021CD0
	ldr r0, _08131DA0 @ =0xfffffeae
	adds r1, r6, r0
	adds r0, r4, 0
	movs r2, 0x2
	movs r3, 0x1
	bl sub_8008E78
	adds r0, r5, 0
	adds r1, r4, 0
	bl StringAppend
	b _08131DC4
	.align 2, 0
_08131D8C: .4byte gUnknown_2021D18
_08131D90: .4byte gUnknown_84166FF
_08131D94: .4byte gUnknown_8463178
_08131D98: .4byte gUnknown_8416226
_08131D9C: .4byte gUnknown_2021CD0
_08131DA0: .4byte 0xfffffeae
_08131DA4:
	ldr r1, _08131DFC @ =gUnknown_8416226
	adds r0, r5, 0
	bl StringAppend
	ldr r4, _08131E00 @ =gUnknown_2021CD0
	ldr r0, _08131E04 @ =0xfffffee0
	adds r1, r6, r0
	adds r0, r4, 0
	movs r2, 0x2
	movs r3, 0x2
	bl sub_8008E78
	adds r0, r5, 0
	adds r1, r4, 0
	bl StringAppend
_08131DC4:
	ldr r4, _08131E08 @ =gUnknown_2021D18
	ldr r1, _08131E0C @ =gUnknown_846317C
	adds r0, r4, 0
	bl StringAppend
	ldr r1, _08131E10 @ =gUnknown_8416703
	adds r0, r4, 0
	bl StringAppend
	adds r0, r6, 0
	bl ItemIdToBattleMoveId
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0xD
	muls r1, r0
	ldr r0, _08131E14 @ =gUnknown_8247094
	adds r1, r0
	adds r0, r4, 0
	bl StringAppend
	adds r0, r7, 0
	adds r1, r4, 0
	bl StringCopy
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08131DFC: .4byte gUnknown_8416226
_08131E00: .4byte gUnknown_2021CD0
_08131E04: .4byte 0xfffffee0
_08131E08: .4byte gUnknown_2021D18
_08131E0C: .4byte gUnknown_846317C
_08131E10: .4byte gUnknown_8416703
_08131E14: .4byte gUnknown_8247094
	thumb_func_end sub_8131D48

	thumb_func_start sub_8131E18
sub_8131E18: @ 8131E18
	push {r4-r6,lr}
	adds r4, r0, 0
	lsls r1, 24
	lsrs r6, r1, 24
	movs r0, 0x2
	negs r0, r0
	cmp r4, r0
	bne _08131E2C
	movs r5, 0
	b _08131E3A
_08131E2C:
	lsls r1, r4, 16
	lsrs r1, 16
	movs r0, 0x4
	bl sub_809A798
	lsls r0, 16
	lsrs r5, r0, 16
_08131E3A:
	cmp r6, 0x1
	beq _08131E50
	movs r0, 0x5
	bl sub_80722CC
	ldr r0, _08131E64 @ =gUnknown_203B118
	ldr r0, [r0]
	ldrb r0, [r0, 0x4]
	adds r1, r5, 0
	bl sub_81337E4
_08131E50:
	adds r0, r4, 0
	bl sub_8131F0C
	adds r0, r5, 0
	bl sub_8133444
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08131E64: .4byte gUnknown_203B118
	thumb_func_end sub_8131E18

	thumb_func_start sub_8131E68
sub_8131E68: @ 8131E68
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x14
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	mov r7, r9
	lsls r2, 24
	lsrs r2, 24
	mov r8, r2
	mov r4, r8
	movs r0, 0x2
	negs r0, r0
	cmp r1, r0
	beq _08131EFE
	lsls r0, r1, 16
	lsrs r6, r0, 16
	movs r0, 0x4
	adds r1, r6, 0
	bl sub_809A798
	lsls r0, 16
	lsrs r0, 16
	bl itemid_is_unique
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0
	bne _08131EF4
	ldr r4, _08131EE8 @ =gUnknown_2021CD0
	movs r0, 0x4
	adds r1, r6, 0
	bl sub_809A7B4
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	adds r0, r4, 0
	movs r2, 0x1
	movs r3, 0x3
	bl sub_8008E78
	ldr r4, _08131EEC @ =gUnknown_2021D18
	ldr r1, _08131EF0 @ =gUnknown_84162B9
	adds r0, r4, 0
	bl sub_8008FCC
	mov r0, r8
	str r0, [sp]
	str r5, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r0, 0xFF
	str r0, [sp, 0xC]
	movs r0, 0x1
	str r0, [sp, 0x10]
	mov r0, r9
	movs r1, 0
	adds r2, r4, 0
	movs r3, 0x7E
	bl sub_81332EC
	b _08131EFE
	.align 2, 0
_08131EE8: .4byte gUnknown_2021CD0
_08131EEC: .4byte gUnknown_2021D18
_08131EF0: .4byte gUnknown_84162B9
_08131EF4:
	adds r0, r7, 0
	movs r1, 0x8
	adds r2, r4, 0
	bl sub_81335B0
_08131EFE:
	add sp, 0x14
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8131E68

	thumb_func_start sub_8131F0C
sub_8131F0C: @ 8131F0C
	push {r4,lr}
	sub sp, 0x14
	adds r1, r0, 0
	movs r0, 0x2
	negs r0, r0
	cmp r1, r0
	beq _08131F30
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x4
	bl sub_809A798
	lsls r0, 16
	lsrs r0, 16
	bl ItemId_GetDescription
	adds r4, r0, 0
	b _08131F32
_08131F30:
	ldr r4, _08131F60 @ =gUnknown_84166E1
_08131F32:
	movs r0, 0x1
	movs r1, 0
	bl FillWindowPixelBuffer
	movs r0, 0x3
	str r0, [sp]
	movs r0, 0x1
	str r0, [sp, 0x4]
	movs r0, 0
	str r0, [sp, 0x8]
	str r0, [sp, 0xC]
	str r0, [sp, 0x10]
	movs r0, 0x1
	movs r1, 0x2
	adds r2, r4, 0
	movs r3, 0x2
	bl sub_81332EC
	add sp, 0x14
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08131F60: .4byte gUnknown_84166E1
	thumb_func_end sub_8131F0C

	thumb_func_start sub_8131F64
sub_8131F64: @ 8131F64
	push {lr}
	sub sp, 0x8
	movs r1, 0x8
	str r1, [sp]
	lsls r0, 1
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x4]
	movs r0, 0x2
	movs r1, 0
	movs r2, 0xC
	movs r3, 0x1E
	bl sub_80F6B08
	movs r0, 0x2
	bl schedule_bg_copy_tilemap_to_vram
	add sp, 0x8
	pop {r0}
	bx r0
	thumb_func_end sub_8131F64

	thumb_func_start sub_8131F90
sub_8131F90: @ 8131F90
	push {r4,lr}
	adds r4, r1, 0
	lsls r0, 24
	lsrs r0, 24
	lsls r4, 24
	lsrs r4, 24
	bl ListMenuGetYCoordForPrintingArrowCursor
	lsls r0, 24
	lsrs r0, 24
	adds r1, r4, 0
	bl sub_8131FB0
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8131F90

	thumb_func_start sub_8131FB0
sub_8131FB0: @ 8131FB0
	push {r4,r5,lr}
	sub sp, 0x14
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r1, 24
	lsrs r1, 24
	cmp r1, 0xFF
	bne _08131FF4
	movs r0, 0x2
	movs r1, 0
	bl sub_80F79D8
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x2
	movs r1, 0x1
	bl sub_80F79D8
	lsls r0, 24
	lsrs r0, 24
	str r4, [sp]
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0
	movs r2, 0
	adds r3, r5, 0
	bl FillWindowPixelRect
	movs r0, 0
	movs r1, 0x2
	bl sub_8003F20
	b _0813200A
_08131FF4:
	ldr r2, _08132014 @ =gUnknown_841623B
	str r5, [sp]
	movs r0, 0
	str r0, [sp, 0x4]
	str r0, [sp, 0x8]
	str r0, [sp, 0xC]
	str r1, [sp, 0x10]
	movs r1, 0x2
	movs r3, 0
	bl sub_81332EC
_0813200A:
	add sp, 0x14
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08132014: .4byte gUnknown_841623B
	thumb_func_end sub_8131FB0

	thumb_func_start sub_8132018
sub_8132018: @ 8132018
	push {r4,lr}
	sub sp, 0x10
	ldr r4, _0813204C @ =gUnknown_203B118
	ldr r1, [r4]
	ldrb r0, [r1, 0x6]
	ldrb r1, [r1, 0x5]
	subs r0, r1
	adds r0, 0x1
	str r0, [sp]
	movs r0, 0x6E
	str r0, [sp, 0x4]
	str r0, [sp, 0x8]
	ldr r0, _08132050 @ =gUnknown_203B116
	str r0, [sp, 0xC]
	movs r0, 0x2
	movs r1, 0xA0
	movs r2, 0x8
	movs r3, 0x58
	bl AddScrollIndicatorArrowPairParametrized
	ldr r1, [r4]
	strb r0, [r1, 0x8]
	add sp, 0x10
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813204C: .4byte gUnknown_203B118
_08132050: .4byte gUnknown_203B116
	thumb_func_end sub_8132018

	thumb_func_start sub_8132054
sub_8132054: @ 8132054
	push {r4,lr}
	sub sp, 0x10
	ldr r4, _08132088 @ =gUnknown_203B118
	ldr r1, [r4]
	movs r0, 0x1
	strh r0, [r1, 0xA]
	movs r0, 0x2
	str r0, [sp]
	movs r0, 0x6E
	str r0, [sp, 0x4]
	str r0, [sp, 0x8]
	adds r1, 0xA
	str r1, [sp, 0xC]
	movs r0, 0x2
	movs r1, 0x98
	movs r2, 0x48
	movs r3, 0x68
	bl AddScrollIndicatorArrowPairParametrized
	ldr r1, [r4]
	strb r0, [r1, 0x8]
	add sp, 0x10
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08132088: .4byte gUnknown_203B118
	thumb_func_end sub_8132054

	thumb_func_start sub_813208C
sub_813208C: @ 813208C
	push {r4,lr}
	ldr r4, _081320A8 @ =gUnknown_203B118
	ldr r1, [r4]
	ldrb r0, [r1, 0x8]
	cmp r0, 0xFF
	beq _081320A2
	bl RemoveScrollIndicatorArrowPair
	ldr r1, [r4]
	movs r0, 0xFF
	strb r0, [r1, 0x8]
_081320A2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081320A8: .4byte gUnknown_203B118
	thumb_func_end sub_813208C

	thumb_func_start sub_81320AC
sub_81320AC: @ 81320AC
	ldr r1, _081320B8 @ =gUnknown_203B10C
	movs r0, 0
	strh r0, [r1, 0x8]
	strh r0, [r1, 0xA]
	bx lr
	.align 2, 0
_081320B8: .4byte gUnknown_203B10C
	thumb_func_end sub_81320AC

	thumb_func_start sub_81320BC
sub_81320BC: @ 81320BC
	push {r4,lr}
	ldr r4, _08132118 @ =gUnknown_20398A4
	ldr r0, [r4]
	ldrb r1, [r4, 0x4]
	bl sub_809A584
	ldr r3, _0813211C @ =gUnknown_203B118
	ldr r1, [r3]
	movs r0, 0
	strb r0, [r1, 0x6]
	movs r2, 0
	ldrb r0, [r4, 0x4]
	cmp r2, r0
	bcs _08132100
	ldr r0, [r4]
	ldrh r0, [r0]
	cmp r0, 0
	beq _08132100
_081320E0:
	ldr r0, [r3]
	ldrb r1, [r0, 0x6]
	adds r1, 0x1
	strb r1, [r0, 0x6]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	ldrb r0, [r4, 0x4]
	cmp r2, r0
	bcs _08132100
	ldr r0, [r4]
	lsls r1, r2, 2
	adds r1, r0
	ldrh r0, [r1]
	cmp r0, 0
	bne _081320E0
_08132100:
	ldr r0, _0813211C @ =gUnknown_203B118
	ldr r1, [r0]
	ldrb r0, [r1, 0x6]
	adds r0, 0x1
	cmp r0, 0x5
	ble _0813210E
	movs r0, 0x5
_0813210E:
	strb r0, [r1, 0x5]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08132118: .4byte gUnknown_20398A4
_0813211C: .4byte gUnknown_203B118
	thumb_func_end sub_81320BC

	thumb_func_start sub_8132120
sub_8132120: @ 8132120
	push {r4,r5,lr}
	ldr r0, _08132160 @ =gUnknown_203B10C
	ldrh r1, [r0, 0xA]
	adds r4, r0, 0
	ldr r5, _08132164 @ =gUnknown_203B118
	cmp r1, 0
	beq _08132144
	ldrh r0, [r4, 0xA]
	ldr r1, [r5]
	ldrb r3, [r1, 0x5]
	adds r0, r3
	ldrb r2, [r1, 0x6]
	adds r1, r2, 0x1
	cmp r0, r1
	ble _08132144
	subs r0, r3, 0x1
	subs r0, r2, r0
	strh r0, [r4, 0xA]
_08132144:
	adds r3, r4, 0
	ldrh r0, [r3, 0xA]
	ldrh r1, [r3, 0x8]
	adds r0, r1
	ldr r1, [r5]
	ldrb r1, [r1, 0x6]
	adds r2, r1, 0x1
	cmp r0, r2
	blt _0813216A
	cmp r2, 0x1
	bgt _08132168
	movs r0, 0
	strh r0, [r3, 0x8]
	b _0813216A
	.align 2, 0
_08132160: .4byte gUnknown_203B10C
_08132164: .4byte gUnknown_203B118
_08132168:
	strh r1, [r4, 0x8]
_0813216A:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8132120

	thumb_func_start sub_8132170
sub_8132170: @ 8132170
	push {r4-r6,lr}
	ldr r0, _081321CC @ =gUnknown_203B10C
	ldrh r1, [r0, 0x8]
	adds r6, r0, 0
	cmp r1, 0x3
	bls _081321C4
	movs r4, 0
	ldrh r0, [r6, 0x8]
	subs r0, 0x3
	cmp r4, r0
	bgt _081321C4
	ldrh r1, [r6, 0xA]
	ldr r5, _081321D0 @ =gUnknown_203B118
	ldr r2, [r5]
	ldrb r0, [r2, 0x5]
	adds r1, r0
	ldrb r0, [r2, 0x6]
	adds r0, 0x1
	cmp r1, r0
	beq _081321C4
	adds r3, r6, 0
_0813219A:
	ldrh r0, [r3, 0x8]
	subs r0, 0x1
	strh r0, [r3, 0x8]
	ldrh r0, [r3, 0xA]
	adds r0, 0x1
	strh r0, [r3, 0xA]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	ldrh r0, [r3, 0x8]
	subs r0, 0x3
	cmp r4, r0
	bgt _081321C4
	ldrh r1, [r6, 0xA]
	ldr r2, [r5]
	ldrb r0, [r2, 0x5]
	adds r1, r0
	ldrb r0, [r2, 0x6]
	adds r0, 0x1
	cmp r1, r0
	bne _0813219A
_081321C4:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081321CC: .4byte gUnknown_203B10C
_081321D0: .4byte gUnknown_203B118
	thumb_func_end sub_8132170

	thumb_func_start sub_81321D4
sub_81321D4: @ 81321D4
	push {lr}
	ldr r0, _0813221C @ =gUnknown_203B118
	ldr r0, [r0]
	cmp r0, 0
	beq _081321E2
	bl Free
_081321E2:
	ldr r0, _08132220 @ =gUnknown_203B120
	ldr r0, [r0]
	cmp r0, 0
	beq _081321EE
	bl Free
_081321EE:
	ldr r0, _08132224 @ =gUnknown_203B124
	ldr r0, [r0]
	cmp r0, 0
	beq _081321FA
	bl Free
_081321FA:
	ldr r0, _08132228 @ =gUnknown_203B128
	ldr r0, [r0]
	cmp r0, 0
	beq _08132206
	bl Free
_08132206:
	ldr r0, _0813222C @ =gUnknown_203B12C
	ldr r0, [r0]
	cmp r0, 0
	beq _08132212
	bl Free
_08132212:
	bl sub_8003ECC
	pop {r0}
	bx r0
	.align 2, 0
_0813221C: .4byte gUnknown_203B118
_08132220: .4byte gUnknown_203B120
_08132224: .4byte gUnknown_203B124
_08132228: .4byte gUnknown_203B128
_0813222C: .4byte gUnknown_203B12C
	thumb_func_end sub_81321D4

	thumb_func_start sub_8132230
sub_8132230: @ 8132230
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
	ldr r1, _08132264 @ =gUnknown_3005090
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _08132268 @ =sub_813226C
	str r1, [r0]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08132264: .4byte gUnknown_3005090
_08132268: .4byte sub_813226C
	thumb_func_end sub_8132230

	thumb_func_start sub_813226C
sub_813226C: @ 813226C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _081322A4 @ =gUnknown_3005098
	adds r2, r0, r1
	ldr r0, _081322A8 @ =gUnknown_2037AB8
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _081322CC
	ldrb r0, [r2]
	ldr r4, _081322AC @ =gUnknown_203B116
	subs r2, r4, 0x2
	adds r1, r4, 0
	bl sub_810713C
	ldr r0, _081322B0 @ =gUnknown_203B118
	ldr r0, [r0]
	ldr r0, [r0]
	cmp r0, 0
	beq _081322B4
	bl SetMainCallback2
	b _081322BE
	.align 2, 0
_081322A4: .4byte gUnknown_3005098
_081322A8: .4byte gUnknown_2037AB8
_081322AC: .4byte gUnknown_203B116
_081322B0: .4byte gUnknown_203B118
_081322B4:
	adds r0, r4, 0
	subs r0, 0xA
	ldr r0, [r0]
	bl SetMainCallback2
_081322BE:
	bl sub_813208C
	bl sub_81321D4
	adds r0, r5, 0
	bl DestroyTask
_081322CC:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_813226C

	thumb_func_start sub_81322D4
sub_81322D4: @ 81322D4
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r7, r0, 24
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	ldr r1, _08132340 @ =gUnknown_3005098
	adds r6, r0, r1
	ldr r0, _08132344 @ =gUnknown_2037AB8
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	cmp r0, 0
	bne _081323C8
	bl sub_80BF72C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _081323C8
	ldrb r0, [r6]
	bl ListMenuHandleInput
	adds r5, r0, 0
	ldrb r0, [r6]
	ldr r4, _08132348 @ =gUnknown_203B116
	subs r2, r4, 0x2
	adds r1, r4, 0
	bl get_coro_args_x18_x1A
	ldr r0, _0813234C @ =gUnknown_30030F0
	ldrh r1, [r0, 0x2E]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _08132354
	adds r0, r4, 0
	subs r0, 0xA
	ldrb r0, [r0, 0x5]
	cmp r0, 0x1
	bne _08132354
	movs r0, 0x5
	bl sub_80722CC
	ldr r0, _08132350 @ =gUnknown_203AD30
	mov r1, r8
	strh r1, [r0]
	b _08132370
	.align 2, 0
_08132340: .4byte gUnknown_3005098
_08132344: .4byte gUnknown_2037AB8
_08132348: .4byte gUnknown_203B116
_0813234C: .4byte gUnknown_30030F0
_08132350: .4byte gUnknown_203AD30
_08132354:
	movs r0, 0x2
	negs r0, r0
	cmp r5, r0
	beq _08132364
	adds r0, 0x1
	cmp r5, r0
	bne _0813237C
	b _081323C8
_08132364:
	movs r0, 0x5
	bl sub_80722CC
	ldr r1, _08132378 @ =gUnknown_203AD30
	movs r0, 0
	strh r0, [r1]
_08132370:
	adds r0, r7, 0
	bl sub_8132230
	b _081323C8
	.align 2, 0
_08132378: .4byte gUnknown_203AD30
_0813237C:
	movs r0, 0x5
	bl sub_80722CC
	movs r0, 0x1
	bl sub_8131F64
	bl sub_813208C
	ldrb r0, [r6]
	movs r1, 0x2
	bl sub_8131F90
	strh r5, [r6, 0x2]
	lsls r4, r5, 16
	lsrs r4, 16
	movs r0, 0x4
	adds r1, r4, 0
	bl sub_809A7B4
	strh r0, [r6, 0x4]
	movs r0, 0x4
	adds r1, r4, 0
	bl sub_809A798
	ldr r1, _081323D4 @ =gUnknown_203AD30
	strh r0, [r1]
	ldr r0, _081323D8 @ =gUnknown_3005090
	lsls r1, r7, 2
	adds r1, r7
	lsls r1, 3
	adds r1, r0
	ldr r2, _081323DC @ =gUnknown_8463140
	ldr r0, _081323E0 @ =gUnknown_203B10C
	ldrb r0, [r0, 0x4]
	lsls r0, 2
	adds r0, r2
	ldr r0, [r0]
	str r0, [r1]
_081323C8:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081323D4: .4byte gUnknown_203AD30
_081323D8: .4byte gUnknown_3005090
_081323DC: .4byte gUnknown_8463140
_081323E0: .4byte gUnknown_203B10C
	thumb_func_end sub_81322D4

	thumb_func_start sub_81323E4
sub_81323E4: @ 81323E4
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0
	bl sub_8131F64
	bl sub_8132018
	ldr r1, _0813240C @ =gUnknown_3005090
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _08132410 @ =sub_81322D4
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813240C: .4byte gUnknown_3005090
_08132410: .4byte sub_81322D4
	thumb_func_end sub_81323E4

	thumb_func_start sub_8132414
sub_8132414: @ 8132414
	push {r4-r7,lr}
	sub sp, 0x14
	lsls r0, 24
	lsrs r7, r0, 24
	movs r0, 0x2
	bl sub_8133368
	bl sub_80BF708
	lsls r0, 24
	cmp r0, 0
	bne _08132454
	bl sub_811B0D0
	cmp r0, 0x1
	beq _08132454
	ldr r4, _0813244C @ =gUnknown_203B118
	ldr r0, [r4]
	adds r0, 0x7
	movs r1, 0
	bl sub_8133630
	ldr r1, [r4]
	ldr r0, _08132450 @ =gUnknown_8463168
	str r0, [r1, 0xC]
	movs r0, 0x3
	b _08132468
	.align 2, 0
_0813244C: .4byte gUnknown_203B118
_08132450: .4byte gUnknown_8463168
_08132454:
	ldr r4, _0813254C @ =gUnknown_203B118
	ldr r0, [r4]
	adds r0, 0x7
	movs r1, 0x1
	bl sub_8133630
	ldr r1, [r4]
	ldr r0, _08132550 @ =gUnknown_846316B
	str r0, [r1, 0xC]
	movs r0, 0x2
_08132468:
	strb r0, [r1, 0x10]
	movs r0, 0x2
	movs r1, 0
	bl sub_80F7AC0
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x2
	movs r1, 0x1
	bl sub_80F79D8
	adds r0, 0x2
	lsls r0, 24
	lsrs r0, 24
	ldr r6, _0813254C @ =gUnknown_203B118
	ldr r1, [r6]
	ldrb r2, [r1, 0x7]
	movs r5, 0
	str r5, [sp]
	str r0, [sp, 0x4]
	ldrb r0, [r1, 0x10]
	str r0, [sp, 0x8]
	ldr r0, _08132554 @ =gUnknown_8463150
	str r0, [sp, 0xC]
	ldr r0, [r1, 0xC]
	str r0, [sp, 0x10]
	adds r0, r2, 0
	movs r1, 0x2
	adds r2, r4, 0
	movs r3, 0x2
	bl sub_810FCD0
	movs r0, 0x2
	movs r1, 0x1
	bl sub_80F79D8
	adds r0, 0x2
	lsls r0, 24
	lsrs r0, 24
	ldr r1, [r6]
	ldrb r2, [r1, 0x7]
	str r0, [sp]
	ldrb r0, [r1, 0x10]
	str r0, [sp, 0x4]
	str r5, [sp, 0x8]
	adds r0, r2, 0
	movs r1, 0x2
	movs r2, 0
	movs r3, 0x2
	bl sub_810F7D8
	movs r0, 0x80
	lsls r0, 1
	bl Alloc
	adds r4, r0, 0
	ldr r6, _08132558 @ =gUnknown_203AD30
	ldrh r1, [r6]
	bl sub_8131D48
	ldr r1, _0813255C @ =gUnknown_8416301
	adds r0, r4, 0
	bl StringAppend
	movs r0, 0x2
	str r0, [sp]
	movs r0, 0x1
	str r0, [sp, 0x4]
	str r5, [sp, 0x8]
	str r5, [sp, 0xC]
	str r0, [sp, 0x10]
	movs r0, 0x2
	movs r1, 0x2
	adds r2, r4, 0
	movs r3, 0
	bl sub_81332EC
	adds r0, r4, 0
	bl Free
	ldrh r0, [r6]
	bl itemid_is_unique
	lsls r0, 24
	cmp r0, 0
	beq _08132528
	movs r0, 0x2
	movs r1, 0
	movs r2, 0x2
	bl sub_81335B0
	movs r0, 0x2
	movs r1, 0x2
	bl sub_8003F20
_08132528:
	movs r0, 0
	bl schedule_bg_copy_tilemap_to_vram
	movs r0, 0x1
	bl schedule_bg_copy_tilemap_to_vram
	ldr r0, _08132560 @ =gUnknown_3005090
	lsls r1, r7, 2
	adds r1, r7
	lsls r1, 3
	adds r1, r0
	ldr r0, _08132564 @ =sub_8132568
	str r0, [r1]
	add sp, 0x14
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0813254C: .4byte gUnknown_203B118
_08132550: .4byte gUnknown_846316B
_08132554: .4byte gUnknown_8463150
_08132558: .4byte gUnknown_203AD30
_0813255C: .4byte gUnknown_8416301
_08132560: .4byte gUnknown_3005090
_08132564: .4byte sub_8132568
	thumb_func_end sub_8132414

	thumb_func_start sub_8132568
sub_8132568: @ 8132568
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	adds r6, r5, 0
	bl sub_80BF72C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _081325E0
	bl ProcessMenuInputNoWrapAround
	lsls r0, 24
	asrs r4, r0, 24
	movs r0, 0x2
	negs r0, r0
	cmp r4, r0
	beq _081325E0
	adds r0, 0x1
	cmp r4, r0
	bne _081325C0
	movs r0, 0x5
	bl sub_80722CC
	ldr r2, _081325B8 @ =gUnknown_8463150
	ldr r0, _081325BC @ =gUnknown_203B118
	ldr r1, [r0]
	ldrb r0, [r1, 0x10]
	ldr r1, [r1, 0xC]
	adds r0, r1
	subs r0, 0x1
	ldrb r0, [r0]
	lsls r0, 3
	adds r2, 0x4
	adds r0, r2
	ldr r1, [r0]
	adds r0, r5, 0
	bl _call_via_r1
	b _081325E0
	.align 2, 0
_081325B8: .4byte gUnknown_8463150
_081325BC: .4byte gUnknown_203B118
_081325C0:
	movs r0, 0x5
	bl sub_80722CC
	ldr r1, _081325E8 @ =gUnknown_8463150
	ldr r0, _081325EC @ =gUnknown_203B118
	ldr r0, [r0]
	ldr r0, [r0, 0xC]
	adds r0, r4
	ldrb r0, [r0]
	lsls r0, 3
	adds r1, 0x4
	adds r0, r1
	ldr r1, [r0]
	adds r0, r6, 0
	bl _call_via_r1
_081325E0:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081325E8: .4byte gUnknown_8463150
_081325EC: .4byte gUnknown_203B118
	thumb_func_end sub_8132568

	thumb_func_start sub_81325F0
sub_81325F0: @ 81325F0
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r5, _08132634 @ =gUnknown_203B118
	ldr r0, [r5]
	adds r0, 0x7
	bl sub_8133664
	movs r0, 0x2
	movs r1, 0
	bl sub_810F4D8
	movs r0, 0x2
	bl ClearWindowTilemap
	movs r0, 0
	bl PutWindowTilemap
	movs r0, 0
	bl schedule_bg_copy_tilemap_to_vram
	movs r0, 0x1
	bl schedule_bg_copy_tilemap_to_vram
	bl CalculatePlayerPartyCount
	lsls r0, 24
	cmp r0, 0
	bne _08132638
	adds r0, r4, 0
	bl sub_81326F8
	b _0813264A
	.align 2, 0
_08132634: .4byte gUnknown_203B118
_08132638:
	ldr r1, _08132650 @ =gUnknown_3005E98
	ldr r0, _08132654 @ =sub_8125B40
	str r0, [r1]
	ldr r1, [r5]
	ldr r0, _08132658 @ =sub_8124C8C
	str r0, [r1]
	adds r0, r4, 0
	bl sub_8132230
_0813264A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08132650: .4byte gUnknown_3005E98
_08132654: .4byte sub_8125B40
_08132658: .4byte sub_8124C8C
	thumb_func_end sub_81325F0

	thumb_func_start sub_813265C
sub_813265C: @ 813265C
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _081326D0 @ =gUnknown_3005098
	adds r0, r1
	ldrh r1, [r0, 0x2]
	movs r0, 0x4
	bl sub_809A798
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	ldr r6, _081326D4 @ =gUnknown_203B118
	ldr r0, [r6]
	adds r0, 0x7
	bl sub_8133664
	movs r0, 0x2
	movs r1, 0
	bl sub_810F4D8
	movs r0, 0x2
	bl ClearWindowTilemap
	movs r0, 0x1
	bl PutWindowTilemap
	movs r0, 0x4
	bl PutWindowTilemap
	movs r0, 0x5
	bl PutWindowTilemap
	movs r0, 0
	bl schedule_bg_copy_tilemap_to_vram
	movs r0, 0x1
	bl schedule_bg_copy_tilemap_to_vram
	adds r0, r4, 0
	bl itemid_is_unique
	lsls r0, 24
	cmp r0, 0
	bne _081326EC
	bl CalculatePlayerPartyCount
	lsls r0, 24
	cmp r0, 0
	bne _081326D8
	adds r0, r5, 0
	bl sub_81326F8
	b _081326F2
	.align 2, 0
_081326D0: .4byte gUnknown_3005098
_081326D4: .4byte gUnknown_203B118
_081326D8:
	ldr r1, [r6]
	ldr r0, _081326E8 @ =sub_8126EDC
	str r0, [r1]
	adds r0, r5, 0
	bl sub_8132230
	b _081326F2
	.align 2, 0
_081326E8: .4byte sub_8126EDC
_081326EC:
	adds r0, r5, 0
	bl sub_8132714
_081326F2:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_813265C

	thumb_func_start sub_81326F8
sub_81326F8: @ 81326F8
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0813270C @ =gUnknown_841632A
	ldr r3, _08132710 @ =sub_8132758
	movs r1, 0x2
	bl sub_813337C
	pop {r0}
	bx r0
	.align 2, 0
_0813270C: .4byte gUnknown_841632A
_08132710: .4byte sub_8132758
	thumb_func_end sub_81326F8

	thumb_func_start sub_8132714
sub_8132714: @ 8132714
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _08132744 @ =gUnknown_203AD30
	ldrh r0, [r0]
	ldr r1, _08132748 @ =gUnknown_2021CD0
	bl sub_8099E90
	ldr r5, _0813274C @ =gUnknown_2021D18
	ldr r1, _08132750 @ =gUnknown_841635E
	adds r0, r5, 0
	bl sub_8008FCC
	ldr r3, _08132754 @ =sub_8132758
	adds r0, r4, 0
	movs r1, 0x2
	adds r2, r5, 0
	bl sub_813337C
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08132744: .4byte gUnknown_203AD30
_08132748: .4byte gUnknown_2021CD0
_0813274C: .4byte gUnknown_2021D18
_08132750: .4byte gUnknown_841635E
_08132754: .4byte sub_8132758
	thumb_func_end sub_8132714

	thumb_func_start sub_8132758
sub_8132758: @ 8132758
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0813277C @ =gUnknown_30030F0
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08132776
	movs r0, 0x5
	bl sub_80722CC
	adds r0, r4, 0
	bl sub_8132780
_08132776:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813277C: .4byte gUnknown_30030F0
	thumb_func_end sub_8132758

	thumb_func_start sub_8132780
sub_8132780: @ 8132780
	push {r4-r6,lr}
	adds r6, r0, 0
	lsls r6, 24
	lsrs r6, 24
	lsls r5, r6, 2
	adds r5, r6
	lsls r5, 3
	ldr r0, _081327F0 @ =gUnknown_3005098
	adds r5, r0
	ldrb r0, [r5]
	ldr r4, _081327F4 @ =gUnknown_203B116
	subs r2, r4, 0x2
	adds r1, r4, 0
	bl sub_810713C
	ldr r0, _081327F8 @ =gUnknown_3005E70
	subs r4, 0xA
	ldrh r1, [r4, 0xA]
	ldrh r2, [r4, 0x8]
	bl ListMenuInit
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5]
	movs r1, 0x1
	bl sub_8131F90
	movs r0, 0x6
	movs r1, 0
	bl sub_810F260
	movs r0, 0x6
	bl ClearWindowTilemap
	movs r0, 0x1
	bl PutWindowTilemap
	movs r0, 0x4
	bl PutWindowTilemap
	movs r0, 0x5
	bl PutWindowTilemap
	movs r0, 0
	bl schedule_bg_copy_tilemap_to_vram
	movs r0, 0x1
	bl schedule_bg_copy_tilemap_to_vram
	adds r0, r6, 0
	bl sub_81323E4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081327F0: .4byte gUnknown_3005098
_081327F4: .4byte gUnknown_203B116
_081327F8: .4byte gUnknown_3005E70
	thumb_func_end sub_8132780

	thumb_func_start sub_81327FC
sub_81327FC: @ 81327FC
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	lsls r4, r5, 2
	adds r4, r5
	lsls r4, 3
	ldr r0, _08132860 @ =gUnknown_3005098
	adds r4, r0
	ldr r0, _08132864 @ =gUnknown_203B118
	ldr r0, [r0]
	adds r0, 0x7
	bl sub_8133664
	movs r0, 0x2
	movs r1, 0
	bl sub_810F4D8
	movs r0, 0x2
	bl ClearWindowTilemap
	movs r0, 0
	bl PutWindowTilemap
	ldrb r0, [r4]
	movs r1, 0x1
	bl sub_8131F90
	movs r0, 0x1
	bl PutWindowTilemap
	movs r0, 0x4
	bl PutWindowTilemap
	movs r0, 0x5
	bl PutWindowTilemap
	movs r0, 0
	bl schedule_bg_copy_tilemap_to_vram
	movs r0, 0x1
	bl schedule_bg_copy_tilemap_to_vram
	adds r0, r5, 0
	bl sub_81323E4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08132860: .4byte gUnknown_3005098
_08132864: .4byte gUnknown_203B118
	thumb_func_end sub_81327FC

	thumb_func_start sub_8132868
sub_8132868: @ 8132868
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _081328A0 @ =gUnknown_3005098
	adds r0, r1
	ldrh r1, [r0, 0x2]
	movs r0, 0x4
	bl sub_809A798
	lsls r0, 16
	lsrs r0, 16
	bl itemid_is_unique
	lsls r0, 24
	cmp r0, 0
	bne _081328AC
	ldr r0, _081328A4 @ =gUnknown_203B118
	ldr r1, [r0]
	ldr r0, _081328A8 @ =c2_8123744
	str r0, [r1]
	adds r0, r4, 0
	bl sub_8132230
	b _081328B2
	.align 2, 0
_081328A0: .4byte gUnknown_3005098
_081328A4: .4byte gUnknown_203B118
_081328A8: .4byte c2_8123744
_081328AC:
	adds r0, r4, 0
	bl sub_8132714
_081328B2:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8132868

	thumb_func_start sub_81328B8
sub_81328B8: @ 81328B8
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _081328F0 @ =gUnknown_3005098
	adds r0, r1
	ldrh r1, [r0, 0x2]
	movs r0, 0x4
	bl sub_809A798
	lsls r0, 16
	lsrs r0, 16
	bl itemid_is_unique
	lsls r0, 24
	cmp r0, 0
	bne _081328FC
	ldr r0, _081328F4 @ =gUnknown_203B118
	ldr r1, [r0]
	ldr r0, _081328F8 @ =sub_808CE60
	str r0, [r1]
	adds r0, r4, 0
	bl sub_8132230
	b _08132902
	.align 2, 0
_081328F0: .4byte gUnknown_3005098
_081328F4: .4byte gUnknown_203B118
_081328F8: .4byte sub_808CE60
_081328FC:
	adds r0, r4, 0
	bl sub_8132714
_08132902:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_81328B8

	thumb_func_start sub_8132908
sub_8132908: @ 8132908
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	adds r7, r5, 0
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _08132950 @ =gUnknown_3005098
	adds r4, r0, r1
	ldr r6, _08132954 @ =gUnknown_203AD30
	ldrh r0, [r6]
	bl itemid_get_market_price
	lsls r0, 16
	cmp r0, 0
	bne _08132968
	ldrh r0, [r6]
	ldr r1, _08132958 @ =gUnknown_2021CD0
	bl sub_8099E90
	ldr r4, _0813295C @ =gUnknown_2021D18
	ldr r1, _08132960 @ =gUnknown_84168F1
	adds r0, r4, 0
	bl sub_8008FCC
	bl sub_80BF8E4
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r3, _08132964 @ =sub_8132780
	adds r0, r5, 0
	adds r2, r4, 0
	bl sub_813337C
	b _081329AE
	.align 2, 0
_08132950: .4byte gUnknown_3005098
_08132954: .4byte gUnknown_203AD30
_08132958: .4byte gUnknown_2021CD0
_0813295C: .4byte gUnknown_2021D18
_08132960: .4byte gUnknown_84168F1
_08132964: .4byte sub_8132780
_08132968:
	movs r0, 0x1
	strh r0, [r4, 0x10]
	movs r1, 0x4
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	bne _08132980
	bl sub_81335E0
	adds r0, r5, 0
	bl sub_81329C4
	b _081329AE
_08132980:
	cmp r0, 0x63
	ble _08132988
	movs r0, 0x63
	strh r0, [r4, 0x4]
_08132988:
	ldrh r0, [r6]
	ldr r1, _081329B4 @ =gUnknown_2021CD0
	bl sub_8099E90
	ldr r4, _081329B8 @ =gUnknown_2021D18
	ldr r1, _081329BC @ =gUnknown_8416911
	adds r0, r4, 0
	bl sub_8008FCC
	bl sub_80BF8E4
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r3, _081329C0 @ =sub_8132AAC
	adds r0, r7, 0
	adds r2, r4, 0
	bl sub_813337C
_081329AE:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081329B4: .4byte gUnknown_2021CD0
_081329B8: .4byte gUnknown_2021D18
_081329BC: .4byte gUnknown_8416911
_081329C0: .4byte sub_8132AAC
	thumb_func_end sub_8132908

	thumb_func_start sub_81329C4
sub_81329C4: @ 81329C4
	push {r4-r6,lr}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	lsls r4, r5, 2
	adds r4, r5
	lsls r4, 3
	ldr r0, _08132A20 @ =gUnknown_3005098
	adds r4, r0
	ldr r6, _08132A24 @ =gUnknown_2021D04
	ldrh r1, [r4, 0x2]
	movs r0, 0x4
	bl sub_809A798
	lsls r0, 16
	lsrs r0, 16
	bl itemid_get_market_price
	lsls r0, 16
	lsrs r0, 17
	movs r2, 0x10
	ldrsh r1, [r4, r2]
	muls r1, r0
	adds r0, r6, 0
	movs r2, 0
	movs r3, 0x6
	bl sub_8008E78
	ldr r4, _08132A28 @ =gUnknown_2021D18
	ldr r1, _08132A2C @ =gUnknown_8416936
	adds r0, r4, 0
	bl sub_8008FCC
	bl sub_80BF8E4
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r3, _08132A30 @ =sub_8132A34
	adds r0, r5, 0
	adds r2, r4, 0
	bl sub_813337C
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08132A20: .4byte gUnknown_3005098
_08132A24: .4byte gUnknown_2021D04
_08132A28: .4byte gUnknown_2021D18
_08132A2C: .4byte gUnknown_8416936
_08132A30: .4byte sub_8132A34
	thumb_func_end sub_81329C4

	thumb_func_start sub_8132A34
sub_8132A34: @ 8132A34
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08132A44 @ =gUnknown_8463170
	bl sub_8133604
	pop {r0}
	bx r0
	.align 2, 0
_08132A44: .4byte gUnknown_8463170
	thumb_func_end sub_8132A34

	thumb_func_start sub_8132A48
sub_8132A48: @ 8132A48
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	lsls r4, r5, 2
	adds r4, r5
	lsls r4, 3
	ldr r0, _08132AA8 @ =gUnknown_3005098
	adds r4, r0
	movs r0, 0x8
	movs r1, 0
	bl sub_810F4D8
	movs r0, 0x6
	movs r1, 0
	bl sub_810F260
	movs r0, 0
	bl PutWindowTilemap
	movs r0, 0x1
	bl PutWindowTilemap
	movs r0, 0x3
	bl PutWindowTilemap
	movs r0, 0x4
	bl PutWindowTilemap
	movs r0, 0x5
	bl PutWindowTilemap
	movs r0, 0
	bl schedule_bg_copy_tilemap_to_vram
	movs r0, 0x1
	bl schedule_bg_copy_tilemap_to_vram
	ldrb r0, [r4]
	movs r1, 0x1
	bl sub_8131F90
	adds r0, r5, 0
	bl sub_81323E4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08132AA8: .4byte gUnknown_3005098
	thumb_func_end sub_8132A48

	thumb_func_start sub_8132AAC
sub_8132AAC: @ 8132AAC
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0x14
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	ldr r6, _08132B48 @ =gUnknown_3005098
	adds r0, r4, r6
	mov r8, r0
	movs r0, 0x7
	bl sub_8133354
	ldr r0, _08132B4C @ =gUnknown_2021CD0
	movs r1, 0x1
	movs r2, 0x2
	movs r3, 0x2
	bl sub_8008E78
	ldr r5, _08132B50 @ =gUnknown_2021D18
	ldr r1, _08132B54 @ =gUnknown_84162B9
	adds r0, r5, 0
	bl sub_8008FCC
	movs r0, 0xA
	str r0, [sp]
	movs r1, 0x1
	str r1, [sp, 0x4]
	movs r0, 0
	str r0, [sp, 0x8]
	str r0, [sp, 0xC]
	str r1, [sp, 0x10]
	movs r0, 0x7
	movs r1, 0
	adds r2, r5, 0
	movs r3, 0x4
	bl sub_81332EC
	mov r2, r8
	ldrh r1, [r2, 0x2]
	movs r0, 0x4
	bl sub_809A798
	lsls r0, 16
	lsrs r0, 16
	bl itemid_get_market_price
	lsls r0, 16
	lsrs r0, 17
	mov r3, r8
	movs r2, 0x10
	ldrsh r1, [r3, r2]
	muls r1, r0
	movs r0, 0x1
	bl sub_8132B5C
	bl sub_81335E0
	bl sub_8132054
	movs r0, 0
	bl schedule_bg_copy_tilemap_to_vram
	movs r0, 0x1
	bl schedule_bg_copy_tilemap_to_vram
	subs r6, 0x8
	adds r4, r6
	ldr r0, _08132B58 @ =sub_8132BC8
	str r0, [r4]
	add sp, 0x14
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08132B48: .4byte gUnknown_3005098
_08132B4C: .4byte gUnknown_2021CD0
_08132B50: .4byte gUnknown_2021D18
_08132B54: .4byte gUnknown_84162B9
_08132B58: .4byte sub_8132BC8
	thumb_func_end sub_8132AAC

	thumb_func_start sub_8132B5C
sub_8132B5C: @ 8132B5C
	push {r4-r6,lr}
	sub sp, 0x14
	adds r4, r0, 0
	adds r6, r1, 0
	lsls r4, 16
	lsrs r4, 16
	movs r0, 0x7
	movs r1, 0x11
	bl FillWindowPixelBuffer
	ldr r0, _08132BBC @ =gUnknown_2021CD0
	lsls r4, 16
	asrs r4, 16
	adds r1, r4, 0
	movs r2, 0x2
	movs r3, 0x2
	bl sub_8008E78
	ldr r5, _08132BC0 @ =gUnknown_2021D18
	ldr r1, _08132BC4 @ =gUnknown_84162B9
	adds r0, r5, 0
	bl sub_8008FCC
	movs r0, 0xA
	str r0, [sp]
	movs r0, 0x1
	str r0, [sp, 0x4]
	movs r4, 0
	str r4, [sp, 0x8]
	str r4, [sp, 0xC]
	str r0, [sp, 0x10]
	movs r0, 0x7
	movs r1, 0
	adds r2, r5, 0
	movs r3, 0x4
	bl sub_81332EC
	str r4, [sp]
	movs r0, 0x7
	movs r1, 0x38
	movs r2, 0xA
	adds r3, r6, 0
	bl sub_809FEC4
	add sp, 0x14
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08132BBC: .4byte gUnknown_2021CD0
_08132BC0: .4byte gUnknown_2021D18
_08132BC4: .4byte gUnknown_84162B9
	thumb_func_end sub_8132B5C

	thumb_func_start sub_8132BC8
sub_8132BC8: @ 8132BC8
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r6, r4, 0
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _08132C14 @ =gUnknown_3005098
	adds r5, r0, r1
	adds r0, r5, 0
	adds r0, 0x10
	ldrh r1, [r5, 0x4]
	bl sub_80BF848
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08132C18
	movs r0, 0x10
	ldrsh r4, [r5, r0]
	ldrh r1, [r5, 0x2]
	movs r0, 0x4
	bl sub_809A798
	lsls r0, 16
	lsrs r0, 16
	bl itemid_get_market_price
	lsls r0, 16
	lsrs r0, 17
	movs r2, 0x10
	ldrsh r1, [r5, r2]
	muls r1, r0
	adds r0, r4, 0
	bl sub_8132B5C
	b _08132CA6
	.align 2, 0
_08132C14: .4byte gUnknown_3005098
_08132C18:
	ldr r0, _08132C4C @ =gUnknown_30030F0
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08132C50
	movs r0, 0x5
	bl sub_80722CC
	movs r0, 0x7
	movs r1, 0
	bl sub_810F4D8
	movs r0, 0
	bl schedule_bg_copy_tilemap_to_vram
	movs r0, 0x1
	bl schedule_bg_copy_tilemap_to_vram
	bl sub_813208C
	adds r0, r4, 0
	bl sub_81329C4
	b _08132CA6
	.align 2, 0
_08132C4C: .4byte gUnknown_30030F0
_08132C50:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08132CA6
	movs r0, 0x5
	bl sub_80722CC
	movs r0, 0x7
	movs r1, 0
	bl sub_810F4D8
	movs r0, 0x8
	movs r1, 0
	bl sub_810F4D8
	movs r0, 0x6
	movs r1, 0
	bl sub_810F260
	movs r0, 0x3
	bl PutWindowTilemap
	movs r0, 0
	bl PutWindowTilemap
	movs r0, 0x1
	bl PutWindowTilemap
	movs r0, 0
	bl schedule_bg_copy_tilemap_to_vram
	movs r0, 0x1
	bl schedule_bg_copy_tilemap_to_vram
	bl sub_813208C
	ldrb r0, [r5]
	movs r1, 0x1
	bl sub_8131F90
	adds r0, r6, 0
	bl sub_81323E4
_08132CA6:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8132BC8

	thumb_func_start sub_8132CAC
sub_8132CAC: @ 8132CAC
	push {r4-r6,lr}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	lsls r4, r5, 2
	adds r4, r5
	lsls r4, 3
	ldr r0, _08132D18 @ =gUnknown_3005098
	adds r4, r0
	movs r0, 0
	bl PutWindowTilemap
	movs r0, 0
	bl schedule_bg_copy_tilemap_to_vram
	ldr r0, _08132D1C @ =gUnknown_203AD30
	ldrh r0, [r0]
	ldr r1, _08132D20 @ =gUnknown_2021CD0
	bl sub_8099E90
	ldr r6, _08132D24 @ =gUnknown_2021D04
	ldrh r1, [r4, 0x2]
	movs r0, 0x4
	bl sub_809A798
	lsls r0, 16
	lsrs r0, 16
	bl itemid_get_market_price
	lsls r0, 16
	lsrs r0, 17
	movs r2, 0x10
	ldrsh r1, [r4, r2]
	muls r1, r0
	adds r0, r6, 0
	movs r2, 0
	movs r3, 0x6
	bl sub_8008E78
	ldr r4, _08132D28 @ =gUnknown_2021D18
	ldr r1, _08132D2C @ =gUnknown_8416959
	adds r0, r4, 0
	bl sub_8008FCC
	ldr r3, _08132D30 @ =sub_8132D34
	adds r0, r5, 0
	movs r1, 0x2
	adds r2, r4, 0
	bl sub_813337C
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08132D18: .4byte gUnknown_3005098
_08132D1C: .4byte gUnknown_203AD30
_08132D20: .4byte gUnknown_2021CD0
_08132D24: .4byte gUnknown_2021D04
_08132D28: .4byte gUnknown_2021D18
_08132D2C: .4byte gUnknown_8416959
_08132D30: .4byte sub_8132D34
	thumb_func_end sub_8132CAC

	thumb_func_start sub_8132D34
sub_8132D34: @ 8132D34
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsrs r0, 24
	lsls r6, r0, 2
	adds r6, r0
	lsls r6, 3
	ldr r0, _08132DF4 @ =gUnknown_3005098
	mov r9, r0
	adds r1, r6, 0
	add r1, r9
	mov r8, r1
	movs r0, 0xF8
	bl sub_80722CC
	ldr r5, _08132DF8 @ =gUnknown_203AD30
	ldrh r0, [r5]
	mov r2, r8
	ldrh r1, [r2, 0x10]
	bl sub_809A1D8
	ldr r7, _08132DFC @ =gUnknown_3005008
	ldr r4, [r7]
	movs r3, 0xA4
	lsls r3, 2
	mov r10, r3
	add r4, r10
	ldrh r0, [r5]
	bl itemid_get_market_price
	lsls r0, 16
	lsrs r0, 17
	mov r2, r8
	movs r3, 0x10
	ldrsh r1, [r2, r3]
	muls r1, r0
	adds r0, r4, 0
	bl AddMoney
	ldrh r0, [r5]
	mov r2, r8
	ldrh r1, [r2, 0x10]
	movs r2, 0x2
	bl sub_809C09C
	mov r3, r8
	ldrb r0, [r3]
	ldr r4, _08132E00 @ =gUnknown_203B116
	subs r2, r4, 0x2
	adds r1, r4, 0
	bl sub_810713C
	bl sub_81320BC
	bl sub_8132120
	bl sub_8131C50
	ldr r0, _08132E04 @ =gUnknown_3005E70
	subs r4, 0xA
	ldrh r1, [r4, 0xA]
	ldrh r2, [r4, 0x8]
	bl ListMenuInit
	lsls r0, 24
	lsrs r0, 24
	mov r1, r8
	strh r0, [r1]
	movs r1, 0x2
	bl sub_8131F90
	ldr r0, [r7]
	add r0, r10
	bl sub_809FD58
	adds r1, r0, 0
	movs r0, 0x8
	movs r2, 0
	bl sub_809FE40
	movs r2, 0x8
	negs r2, r2
	add r9, r2
	add r6, r9
	ldr r0, _08132E08 @ =sub_8132E0C
	str r0, [r6]
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08132DF4: .4byte gUnknown_3005098
_08132DF8: .4byte gUnknown_203AD30
_08132DFC: .4byte gUnknown_3005008
_08132E00: .4byte gUnknown_203B116
_08132E04: .4byte gUnknown_3005E70
_08132E08: .4byte sub_8132E0C
	thumb_func_end sub_8132D34

	thumb_func_start sub_8132E0C
sub_8132E0C: @ 8132E0C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _08132E60 @ =gUnknown_30030F0
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _08132E26
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08132E5A
_08132E26:
	movs r0, 0x5
	bl sub_80722CC
	movs r0, 0x8
	movs r1, 0
	bl sub_810F4D8
	movs r0, 0x6
	movs r1, 0
	bl sub_810F260
	movs r0, 0x1
	bl PutWindowTilemap
	movs r0, 0x3
	bl PutWindowTilemap
	movs r0, 0x4
	bl PutWindowTilemap
	movs r0, 0x5
	bl PutWindowTilemap
	adds r0, r4, 0
	bl sub_8132780
_08132E5A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08132E60: .4byte gUnknown_30030F0
	thumb_func_end sub_8132E0C

	thumb_func_start sub_8132E64
sub_8132E64: @ 8132E64
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	ldr r4, _08132EFC @ =gUnknown_203B11C
	movs r0, 0xB2
	lsls r0, 1
	bl AllocZeroed
	str r0, [r4]
	ldr r5, _08132F00 @ =gUnknown_3005008
	ldr r1, [r5]
	ldr r2, _08132F04 @ =0x00000464
	mov r8, r2
	add r1, r8
	movs r2, 0xE8
	bl memcpy
	ldr r0, [r4]
	adds r0, 0xE8
	ldr r1, [r5]
	movs r6, 0xEE
	lsls r6, 2
	adds r1, r6
	movs r2, 0x78
	bl memcpy
	ldr r3, [r4]
	ldr r2, _08132F08 @ =gUnknown_203B10C
	ldrh r1, [r2, 0x8]
	movs r4, 0xB0
	lsls r4, 1
	adds r0, r3, r4
	strh r1, [r0]
	ldrh r0, [r2, 0xA]
	movs r2, 0xB1
	lsls r2, 1
	adds r1, r3, r2
	strh r0, [r1]
	ldr r0, [r5]
	add r0, r8
	movs r1, 0x3A
	bl sub_809A274
	ldr r0, [r5]
	adds r0, r6
	movs r1, 0x1E
	bl sub_809A274
	bl sub_81320AC
	ldr r0, _08132F0C @ =0x00000121
	movs r1, 0x1
	bl sub_809A084
	ldr r0, _08132F10 @ =0x00000123
	movs r1, 0x1
	bl sub_809A084
	ldr r0, _08132F14 @ =0x00000129
	movs r1, 0x1
	bl sub_809A084
	ldr r0, _08132F18 @ =0x00000143
	movs r1, 0x1
	bl sub_809A084
	ldr r1, _08132F1C @ =sub_815ABFC
	movs r0, 0x4
	movs r2, 0
	bl sub_81317F8
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08132EFC: .4byte gUnknown_203B11C
_08132F00: .4byte gUnknown_3005008
_08132F04: .4byte 0x00000464
_08132F08: .4byte gUnknown_203B10C
_08132F0C: .4byte 0x00000121
_08132F10: .4byte 0x00000123
_08132F14: .4byte 0x00000129
_08132F18: .4byte 0x00000143
_08132F1C: .4byte sub_815ABFC
	thumb_func_end sub_8132E64

	thumb_func_start sub_8132F20
sub_8132F20: @ 8132F20
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r3, r1, 3
	ldr r4, _08132F54 @ =gUnknown_3005098
	adds r2, r3, r4
	ldr r0, _08132F58 @ =gUnknown_2037AB8
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	bne _08132F4E
	strh r0, [r2, 0x10]
	strh r0, [r2, 0x12]
	adds r0, r4, 0
	subs r0, 0x8
	adds r0, r3, r0
	ldr r1, _08132F5C @ =sub_8132F60
	str r1, [r0]
_08132F4E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08132F54: .4byte gUnknown_3005098
_08132F58: .4byte gUnknown_2037AB8
_08132F5C: .4byte sub_8132F60
	thumb_func_end sub_8132F20

	thumb_func_start sub_8132F60
sub_8132F60: @ 8132F60
	push {r4-r7,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _08132FA4 @ =gUnknown_3005098
	adds r6, r0, r1
	ldr r0, _08132FA8 @ =gUnknown_30030F0
	ldrh r1, [r0, 0x2E]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08132F8E
	movs r1, 0x10
	ldrsh r0, [r6, r1]
	cmp r0, 0x14
	bgt _08132F8E
	movs r0, 0x15
	strh r0, [r6, 0x10]
	bl sub_815AC20
_08132F8E:
	movs r3, 0x10
	ldrsh r0, [r6, r3]
	cmp r0, 0x15
	bls _08132F98
	b _08133210
_08132F98:
	lsls r0, 2
	ldr r1, _08132FAC @ =_08132FB0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08132FA4: .4byte gUnknown_3005098
_08132FA8: .4byte gUnknown_30030F0
_08132FAC: .4byte _08132FB0
	.align 2, 0
_08132FB0:
	.4byte _08133008
	.4byte _08133024
	.4byte _08133050
	.4byte _08133050
	.4byte _08133050
	.4byte _08133080
	.4byte _08133080
	.4byte _08133080
	.4byte _081330B0
	.4byte _081330E0
	.4byte _081330F4
	.4byte _08133024
	.4byte _08133050
	.4byte _08133050
	.4byte _08133050
	.4byte _08133080
	.4byte _08133080
	.4byte _08133080
	.4byte _0813312C
	.4byte _081330E0
	.4byte _0813315C
	.4byte _08133170
_08133008:
	ldr r0, _08133020 @ =0xffff8405
	movs r1, 0
	str r1, [sp]
	movs r1, 0x4
	movs r2, 0
	movs r3, 0x6
	bl BeginNormalPaletteFade
	movs r0, 0x1
	bl sub_8131F64
	b _081331EA
	.align 2, 0
_08133020: .4byte 0xffff8405
_08133024:
	ldr r0, _0813304C @ =gUnknown_2037AB8
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	beq _08133036
	b _08133232
_08133036:
	ldrh r0, [r6, 0x12]
	adds r0, 0x1
	strh r0, [r6, 0x12]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x65
	bgt _08133046
	b _08133232
_08133046:
	strh r1, [r6, 0x12]
	b _081331EA
	.align 2, 0
_0813304C: .4byte gUnknown_2037AB8
_08133050:
	movs r0, 0x12
	ldrsh r1, [r6, r0]
	cmp r1, 0
	bne _08133066
	ldr r0, _0813307C @ =gUnknown_30030F0
	strh r1, [r0, 0x2E]
	movs r1, 0x80
	strh r1, [r0, 0x30]
	ldrb r0, [r6]
	bl ListMenuHandleInput
_08133066:
	ldrh r0, [r6, 0x12]
	adds r0, 0x1
	strh r0, [r6, 0x12]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x65
	bgt _08133076
	b _08133232
_08133076:
	movs r0, 0
	strh r0, [r6, 0x12]
	b _081331EA
	.align 2, 0
_0813307C: .4byte gUnknown_30030F0
_08133080:
	movs r3, 0x12
	ldrsh r1, [r6, r3]
	cmp r1, 0
	bne _08133096
	ldr r0, _081330AC @ =gUnknown_30030F0
	strh r1, [r0, 0x2E]
	movs r1, 0x40
	strh r1, [r0, 0x30]
	ldrb r0, [r6]
	bl ListMenuHandleInput
_08133096:
	ldrh r0, [r6, 0x12]
	adds r0, 0x1
	strh r0, [r6, 0x12]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x65
	bgt _081330A6
	b _08133232
_081330A6:
	movs r0, 0
	strh r0, [r6, 0x12]
	b _081331EA
	.align 2, 0
_081330AC: .4byte gUnknown_30030F0
_081330B0:
	movs r0, 0x1
	bl sub_8131F64
	ldr r2, _081330D4 @ =gUnknown_841C587
	adds r0, r4, 0
	movs r1, 0x4
	movs r3, 0
	bl sub_813337C
	ldr r1, _081330D8 @ =gUnknown_3005090
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _081330DC @ =sub_8132F60
	str r1, [r0]
	b _081331EA
	.align 2, 0
_081330D4: .4byte gUnknown_841C587
_081330D8: .4byte gUnknown_3005090
_081330DC: .4byte sub_8132F60
_081330E0:
	bl sub_8002DE8
	movs r0, 0x6
	bl sub_8002E64
	lsls r0, 16
	cmp r0, 0
	beq _081330F2
	b _08133232
_081330F2:
	b _081331EA
_081330F4:
	ldr r0, _08133128 @ =gUnknown_30030F0
	ldrh r1, [r0, 0x2E]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0
	bne _08133102
	b _08133232
_08133102:
	movs r0, 0
	bl sub_8131F64
	movs r0, 0x80
	lsls r0, 3
	movs r1, 0
	str r1, [sp]
	movs r2, 0x6
	movs r3, 0
	bl BeginNormalPaletteFade
	movs r0, 0x6
	movs r1, 0
	bl sub_810F260
	movs r0, 0x1
	bl schedule_bg_copy_tilemap_to_vram
	b _081331EA
	.align 2, 0
_08133128: .4byte gUnknown_30030F0
_0813312C:
	movs r0, 0x1
	bl sub_8131F64
	ldr r2, _08133150 @ =gUnknown_841C693
	adds r0, r4, 0
	movs r1, 0x4
	movs r3, 0
	bl sub_813337C
	ldr r1, _08133154 @ =gUnknown_3005090
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _08133158 @ =sub_8132F60
	str r1, [r0]
	b _081331EA
	.align 2, 0
_08133150: .4byte gUnknown_841C693
_08133154: .4byte gUnknown_3005090
_08133158: .4byte sub_8132F60
_0813315C:
	ldr r0, _0813316C @ =gUnknown_30030F0
	ldrh r1, [r0, 0x2E]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0
	beq _08133232
	b _081331EA
	.align 2, 0
_0813316C: .4byte gUnknown_30030F0
_08133170:
	ldr r0, _081331F4 @ =gUnknown_2037AB8
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r7, r0, 24
	cmp r7, 0
	bne _08133232
	ldr r5, _081331F8 @ =gUnknown_3005008
	ldr r0, [r5]
	ldr r1, _081331FC @ =0x00000464
	adds r0, r1
	ldr r4, _08133200 @ =gUnknown_203B11C
	ldr r1, [r4]
	movs r2, 0xE8
	bl memcpy
	ldr r0, [r5]
	movs r3, 0xEE
	lsls r3, 2
	adds r0, r3
	ldr r1, [r4]
	adds r1, 0xE8
	movs r2, 0x78
	bl memcpy
	ldrb r0, [r6]
	movs r1, 0
	movs r2, 0
	bl sub_810713C
	ldr r2, _08133204 @ =gUnknown_203B10C
	ldr r0, [r4]
	movs r3, 0xB0
	lsls r3, 1
	adds r1, r0, r3
	ldrh r1, [r1]
	strh r1, [r2, 0x8]
	adds r3, 0x2
	adds r1, r0, r3
	ldrh r1, [r1]
	strh r1, [r2, 0xA]
	bl Free
	ldr r0, _08133208 @ =gUnknown_20375F8
	ldr r1, _0813320C @ =gUnknown_20371F8
	movs r2, 0x80
	lsls r2, 1
	bl CpuFastSet
	bl sub_8108CF0
	movs r0, 0x1
	negs r0, r0
	movs r1, 0x2
	negs r1, r1
	str r7, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
_081331EA:
	ldrh r0, [r6, 0x10]
	adds r0, 0x1
	strh r0, [r6, 0x10]
	b _08133232
	.align 2, 0
_081331F4: .4byte gUnknown_2037AB8
_081331F8: .4byte gUnknown_3005008
_081331FC: .4byte 0x00000464
_08133200: .4byte gUnknown_203B11C
_08133204: .4byte gUnknown_203B10C
_08133208: .4byte gUnknown_20375F8
_0813320C: .4byte gUnknown_20371F8
_08133210:
	ldr r0, _0813323C @ =gUnknown_2037AB8
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08133232
	ldr r0, _08133240 @ =gUnknown_203B10C
	ldr r0, [r0]
	bl SetMainCallback2
	bl sub_813208C
	bl sub_81321D4
	adds r0, r4, 0
	bl DestroyTask
_08133232:
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0813323C: .4byte gUnknown_2037AB8
_08133240: .4byte gUnknown_203B10C
	thumb_func_end sub_8132F60

	thumb_func_start sub_8133244
sub_8133244: @ 8133244
	push {r4,lr}
	ldr r0, _081332E0 @ =gUnknown_8463190
	bl sub_8003B24
	bl sub_8002C28
	movs r0, 0
	movs r1, 0x5B
	movs r2, 0xE0
	bl sub_815001C
	movs r0, 0
	movs r1, 0x64
	movs r2, 0xB0
	bl sub_814FEAC
	movs r0, 0
	movs r1, 0x78
	movs r2, 0xD0
	bl sub_814FF2C
	ldr r4, _081332E4 @ =gUnknown_841F408
	adds r0, r4, 0
	movs r1, 0xF0
	movs r2, 0x20
	bl LoadPalette
	adds r0, r4, 0
	movs r1, 0xA0
	movs r2, 0x20
	bl LoadPalette
	ldr r4, _081332E8 @ =gUnknown_8463180
	adds r0, r4, 0
	movs r1, 0xF6
	movs r2, 0x4
	bl LoadPalette
	adds r0, r4, 0
	movs r1, 0xD6
	movs r2, 0x4
	bl LoadPalette
	movs r0, 0xC0
	movs r1, 0x1
	bl sub_8107D38
	movs r4, 0
_081332A4:
	adds r0, r4, 0
	movs r1, 0
	bl FillWindowPixelBuffer
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x8
	bls _081332A4
	movs r0, 0
	bl PutWindowTilemap
	movs r0, 0x1
	bl PutWindowTilemap
	movs r0, 0x3
	bl PutWindowTilemap
	movs r0, 0x4
	bl PutWindowTilemap
	movs r0, 0x5
	bl PutWindowTilemap
	movs r0, 0
	bl schedule_bg_copy_tilemap_to_vram
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081332E0: .4byte gUnknown_8463190
_081332E4: .4byte gUnknown_841F408
_081332E8: .4byte gUnknown_8463180
	thumb_func_end sub_8133244

	thumb_func_start sub_81332EC
sub_81332EC: @ 81332EC
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x14
	mov r9, r3
	ldr r3, [sp, 0x30]
	ldr r4, [sp, 0x34]
	ldr r6, [sp, 0x38]
	ldr r5, [sp, 0x3C]
	mov r8, r5
	ldr r5, [sp, 0x40]
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	mov r7, r9
	lsls r7, 24
	lsrs r7, 24
	mov r9, r7
	lsls r3, 24
	lsrs r3, 24
	lsls r4, 24
	lsrs r4, 24
	lsls r6, 24
	lsrs r6, 24
	lsls r5, 24
	lsrs r5, 24
	str r4, [sp]
	str r6, [sp, 0x4]
	lsls r4, r5, 1
	adds r4, r5
	ldr r5, _08133350 @ =gUnknown_8463184
	adds r4, r5
	str r4, [sp, 0x8]
	mov r4, r8
	lsls r4, 24
	asrs r4, 24
	str r4, [sp, 0xC]
	str r2, [sp, 0x10]
	mov r2, r9
	bl sub_812E5A4
	add sp, 0x14
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08133350: .4byte gUnknown_8463184
	thumb_func_end sub_81332EC

	thumb_func_start sub_8133354
sub_8133354: @ 8133354
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	movs r2, 0x5B
	movs r3, 0xE
	bl SetWindowBorderStyle
	pop {r0}
	bx r0
	thumb_func_end sub_8133354

	thumb_func_start sub_8133368
sub_8133368: @ 8133368
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	movs r2, 0x78
	movs r3, 0xD
	bl SetWindowBorderStyle
	pop {r0}
	bx r0
	thumb_func_end sub_8133368

	thumb_func_start sub_813337C
sub_813337C: @ 813337C
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0x10
	adds r5, r0, 0
	adds r4, r1, 0
	adds r6, r2, 0
	mov r8, r3
	lsls r5, 24
	lsrs r5, 24
	lsls r4, 24
	lsrs r4, 24
	bl sub_80F78A8
	lsls r0, 24
	lsrs r0, 24
	str r4, [sp]
	str r0, [sp, 0x4]
	str r6, [sp, 0x8]
	mov r0, r8
	str r0, [sp, 0xC]
	adds r0, r5, 0
	movs r1, 0x6
	movs r2, 0x64
	movs r3, 0xB
	bl sub_80BF474
	movs r0, 0x1
	bl schedule_bg_copy_tilemap_to_vram
	add sp, 0x10
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_813337C

	thumb_func_start sub_81333C4
sub_81333C4: @ 81333C4
	push {r4,lr}
	sub sp, 0xC
	ldr r4, _081333FC @ =gUnknown_84166D3
	movs r0, 0x1
	adds r1, r4, 0
	movs r2, 0
	bl sub_8005ED4
	movs r2, 0x48
	subs r2, r0
	lsrs r2, 1
	lsls r2, 24
	lsrs r2, 24
	ldr r0, _08133400 @ =gUnknown_8463184
	str r0, [sp]
	movs r0, 0
	str r0, [sp, 0x4]
	str r4, [sp, 0x8]
	movs r0, 0x3
	movs r1, 0x1
	movs r3, 0x1
	bl sub_812E51C
	add sp, 0xC
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081333FC: .4byte gUnknown_84166D3
_08133400: .4byte gUnknown_8463184
	thumb_func_end sub_81333C4

	thumb_func_start sub_8133404
sub_8133404: @ 8133404
	push {lr}
	movs r0, 0x4
	movs r1, 0x13
	movs r2, 0
	movs r3, 0
	bl sub_8107D68
	movs r0, 0x4
	movs r1, 0x14
	movs r2, 0
	movs r3, 0xC
	bl sub_8107D68
	movs r0, 0x4
	movs r1, 0x15
	movs r2, 0
	movs r3, 0x18
	bl sub_8107D68
	movs r0, 0x4
	movs r1, 0x16
	movs r2, 0
	movs r3, 0x24
	bl sub_8107D68
	movs r0, 0x4
	movs r1, 0x2
	bl sub_8003F20
	pop {r0}
	bx r0
	thumb_func_end sub_8133404

	thumb_func_start sub_8133444
sub_8133444: @ 8133444
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x14
	lsls r0, 16
	lsrs r4, r0, 16
	movs r0, 0x28
	str r0, [sp]
	movs r0, 0x30
	str r0, [sp, 0x4]
	movs r0, 0x5
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillWindowPixelRect
	cmp r4, 0
	bne _081334A8
	movs r4, 0
	movs r5, 0
_0813346E:
	lsls r0, r4, 1
	adds r0, r4
	lsls r0, 26
	lsrs r0, 24
	str r0, [sp]
	str r5, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r0, 0xFF
	str r0, [sp, 0xC]
	movs r0, 0x3
	str r0, [sp, 0x10]
	movs r0, 0x5
	movs r1, 0x3
	ldr r2, _081334A4 @ =gUnknown_8416213
	movs r3, 0x7
	bl sub_81332EC
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x3
	bls _0813346E
	movs r0, 0x5
	movs r1, 0x2
	bl sub_8003F20
	b _0813359A
	.align 2, 0
_081334A4: .4byte gUnknown_8416213
_081334A8:
	adds r0, r4, 0
	bl ItemIdToBattleMoveId
	lsls r0, 16
	lsrs r7, r0, 16
	ldr r1, _081334D8 @ =gUnknown_8250C04
	lsls r0, r7, 1
	adds r0, r7
	lsls r0, 2
	adds r5, r0, r1
	ldrb r1, [r5, 0x2]
	adds r1, 0x1
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0x5
	movs r2, 0
	movs r3, 0
	bl sub_8107D68
	ldrb r0, [r5, 0x1]
	cmp r0, 0x1
	bhi _081334E0
	ldr r2, _081334DC @ =gUnknown_8416213
	b _081334F0
	.align 2, 0
_081334D8: .4byte gUnknown_8250C04
_081334DC: .4byte gUnknown_8416213
_081334E0:
	ldr r4, _08133524 @ =gUnknown_2021CD0
	ldrb r1, [r5, 0x1]
	adds r0, r4, 0
	movs r2, 0x1
	movs r3, 0x3
	bl sub_8008E78
	adds r2, r4, 0
_081334F0:
	movs r0, 0xC
	str r0, [sp]
	movs r0, 0
	str r0, [sp, 0x4]
	str r0, [sp, 0x8]
	movs r0, 0xFF
	str r0, [sp, 0xC]
	movs r0, 0x3
	str r0, [sp, 0x10]
	movs r0, 0x5
	movs r1, 0x3
	movs r3, 0x7
	bl sub_81332EC
	ldr r2, _08133528 @ =gUnknown_8250C04
	lsls r1, r7, 1
	adds r0, r1, r7
	lsls r0, 2
	adds r2, r0, r2
	ldrb r0, [r2, 0x3]
	adds r6, r1, 0
	cmp r0, 0
	bne _08133530
	ldr r2, _0813352C @ =gUnknown_8416213
	b _08133540
	.align 2, 0
_08133524: .4byte gUnknown_2021CD0
_08133528: .4byte gUnknown_8250C04
_0813352C: .4byte gUnknown_8416213
_08133530:
	ldr r4, _081335A8 @ =gUnknown_2021CD0
	ldrb r1, [r2, 0x3]
	adds r0, r4, 0
	movs r2, 0x1
	movs r3, 0x3
	bl sub_8008E78
	adds r2, r4, 0
_08133540:
	movs r0, 0x18
	str r0, [sp]
	movs r4, 0
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	movs r0, 0xFF
	mov r8, r0
	str r0, [sp, 0xC]
	movs r0, 0x3
	mov r9, r0
	str r0, [sp, 0x10]
	movs r0, 0x5
	movs r1, 0x3
	movs r3, 0x7
	bl sub_81332EC
	ldr r5, _081335A8 @ =gUnknown_2021CD0
	ldr r1, _081335AC @ =gUnknown_8250C04
	adds r0, r6, r7
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0, 0x4]
	adds r0, r5, 0
	movs r2, 0x1
	movs r3, 0x3
	bl sub_8008E78
	movs r0, 0x24
	str r0, [sp]
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	mov r0, r8
	str r0, [sp, 0xC]
	mov r0, r9
	str r0, [sp, 0x10]
	movs r0, 0x5
	movs r1, 0x3
	adds r2, r5, 0
	movs r3, 0x7
	bl sub_81332EC
	movs r0, 0x5
	movs r1, 0x2
	bl sub_8003F20
_0813359A:
	add sp, 0x14
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081335A8: .4byte gUnknown_2021CD0
_081335AC: .4byte gUnknown_8250C04
	thumb_func_end sub_8133444

	thumb_func_start sub_81335B0
sub_81335B0: @ 81335B0
	push {r4,lr}
	sub sp, 0x8
	adds r4, r1, 0
	adds r3, r2, 0
	lsls r0, 24
	lsrs r0, 24
	lsls r4, 24
	lsrs r4, 24
	lsls r3, 24
	lsrs r3, 24
	ldr r1, _081335DC @ =gUnknown_8E99118
	movs r2, 0x10
	str r2, [sp]
	movs r2, 0xC
	str r2, [sp, 0x4]
	adds r2, r4, 0
	bl BlitBitmapToWindow
	add sp, 0x8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081335DC: .4byte gUnknown_8E99118
	thumb_func_end sub_81335B0

	thumb_func_start sub_81335E0
sub_81335E0: @ 81335E0
	push {lr}
	ldr r0, _08133600 @ =gUnknown_3005008
	ldr r0, [r0]
	movs r1, 0xA4
	lsls r1, 2
	adds r0, r1
	bl sub_809FD58
	adds r3, r0, 0
	movs r0, 0x8
	movs r1, 0x78
	movs r2, 0xD
	bl sub_809FF48
	pop {r0}
	bx r0
	.align 2, 0
_08133600: .4byte gUnknown_3005008
	thumb_func_end sub_81335E0

	thumb_func_start sub_8133604
sub_8133604: @ 8133604
	push {lr}
	sub sp, 0x10
	adds r3, r1, 0
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0813362C @ =gUnknown_84631E0
	movs r2, 0x2
	str r2, [sp]
	movs r2, 0x5B
	str r2, [sp, 0x4]
	movs r2, 0xE
	str r2, [sp, 0x8]
	str r3, [sp, 0xC]
	movs r2, 0x2
	movs r3, 0
	bl sub_80BF5D0
	add sp, 0x10
	pop {r0}
	bx r0
	.align 2, 0
_0813362C: .4byte gUnknown_84631E0
	thumb_func_end sub_8133604

	thumb_func_start sub_8133630
sub_8133630: @ 8133630
	push {r4,lr}
	adds r4, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldrb r0, [r4]
	cmp r0, 0xFF
	bne _08133656
	lsls r0, r1, 3
	ldr r1, _08133660 @ =gUnknown_84631E8
	adds r0, r1
	bl sub_8003CE4
	strb r0, [r4]
	ldrb r0, [r4]
	bl sub_8133354
	movs r0, 0
	bl schedule_bg_copy_tilemap_to_vram
_08133656:
	ldrb r0, [r4]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08133660: .4byte gUnknown_84631E8
	thumb_func_end sub_8133630

	thumb_func_start sub_8133664
sub_8133664: @ 8133664
	push {r4,lr}
	adds r4, r0, 0
	ldrb r0, [r4]
	movs r1, 0
	bl sub_810F4D8
	ldrb r0, [r4]
	bl ClearWindowTilemap
	ldrb r0, [r4]
	bl sub_8003E3C
	movs r0, 0
	bl schedule_bg_copy_tilemap_to_vram
	movs r0, 0xFF
	strb r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8133664

	thumb_func_start sub_813368C
sub_813368C: @ 813368C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 16
	lsrs r6, r0, 16
	ldr r0, _081336E8 @ =gUnknown_8463220
	movs r1, 0x29
	movs r2, 0x2E
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r7, r0, 24
	cmp r6, 0
	beq _081336F4
	adds r5, r6, 0
	subs r5, 0x21
	lsls r5, 24
	lsrs r5, 24
	lsls r4, r7, 4
	adds r4, r7
	lsls r4, 2
	ldr r0, _081336EC @ =gUnknown_202063C
	adds r4, r0
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8133714
	ldr r0, _081336F0 @ =gUnknown_8250C04
	mov r8, r0
	adds r0, r6, 0
	bl ItemIdToBattleMoveId
	lsls r0, 16
	lsrs r0, 16
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	add r1, r8
	ldrb r0, [r1, 0x2]
	bl sub_8133730
	adds r0, r4, 0
	adds r1, r5, 0
	b _08133700
	.align 2, 0
_081336E8: .4byte gUnknown_8463220
_081336EC: .4byte gUnknown_202063C
_081336F0: .4byte gUnknown_8250C04
_081336F4:
	lsls r0, r7, 4
	adds r0, r7
	lsls r0, 2
	ldr r1, _08133710 @ =gUnknown_202063C
	adds r0, r1
	movs r1, 0xFF
_08133700:
	bl sub_8133790
	adds r0, r7, 0
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08133710: .4byte gUnknown_202063C
	thumb_func_end sub_813368C

	thumb_func_start sub_8133714
sub_8133714: @ 8133714
	push {lr}
	lsls r1, 24
	lsrs r1, 24
	cmp r1, 0x31
	bls _08133726
	movs r1, 0x1
	bl StartSpriteAnim
	b _0813372C
_08133726:
	movs r1, 0
	bl StartSpriteAnim
_0813372C:
	pop {r0}
	bx r0
	thumb_func_end sub_8133714

	thumb_func_start sub_8133730
sub_8133730: @ 8133730
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0xC8
	lsls r0, 1
	bl IndexOfSpritePaletteTag
	lsls r0, 28
	lsrs r5, r0, 24
	ldr r2, _08133784 @ =gUnknown_203B12C
	ldr r0, _08133788 @ =gUnknown_8463238
	lsls r4, 1
	adds r4, r0
	ldrh r1, [r4]
	lsls r1, 1
	ldr r0, [r2]
	adds r0, r1
	movs r1, 0x80
	lsls r1, 1
	adds r2, r1, 0
	adds r1, r5, 0
	orrs r1, r2
	movs r2, 0x20
	bl LoadPalette
	ldr r0, _0813378C @ =gUnknown_203B10C
	ldrb r0, [r0, 0x4]
	cmp r0, 0x4
	bne _0813377C
	adds r1, r5, 0
	adds r1, 0x10
	movs r0, 0x1
	lsls r0, r1
	movs r1, 0x4
	movs r2, 0
	bl BlendPalettes
_0813377C:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08133784: .4byte gUnknown_203B12C
_08133788: .4byte gUnknown_8463238
_0813378C: .4byte gUnknown_203B10C
	thumb_func_end sub_8133730

	thumb_func_start sub_8133790
sub_8133790: @ 8133790
	push {r4-r6,lr}
	adds r5, r0, 0
	lsls r1, 24
	lsrs r4, r1, 24
	cmp r4, 0xFF
	bne _081337A6
	movs r6, 0x1B
	movs r1, 0x36
	movs r0, 0x14
	strh r0, [r5, 0x26]
	b _081337D8
_081337A6:
	cmp r4, 0x31
	bls _081337B0
	adds r0, r4, 0
	subs r0, 0x32
	b _081337B4
_081337B0:
	adds r0, r4, 0
	adds r0, 0x8
_081337B4:
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 3
	subs r0, r4
	lsls r0, 9
	movs r1, 0x3A
	bl __divsi3
	asrs r0, 8
	movs r1, 0x29
	subs r6, r1, r0
	lsls r0, r4, 11
	movs r1, 0x3A
	bl __divsi3
	asrs r0, 8
	adds r1, r0, 0
	adds r1, 0x2E
_081337D8:
	strh r6, [r5, 0x20]
	strh r1, [r5, 0x22]
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8133790

	thumb_func_start sub_81337E4
sub_81337E4: @ 81337E4
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _08133808 @ =gUnknown_202063C
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r0, r2, r3
	movs r4, 0
	strh r1, [r0, 0x2E]
	strh r4, [r0, 0x30]
	adds r3, 0x1C
	adds r2, r3
	ldr r0, _0813380C @ =sub_8133810
	str r0, [r2]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08133808: .4byte gUnknown_202063C
_0813380C: .4byte sub_8133810
	thumb_func_end sub_81337E4

	thumb_func_start sub_8133810
sub_8133810: @ 8133810
	push {r4,r5,lr}
	adds r5, r0, 0
	movs r1, 0x30
	ldrsh r0, [r5, r1]
	cmp r0, 0
	beq _08133822
	cmp r0, 0x1
	beq _08133886
	b _081338A2
_08133822:
	ldrh r1, [r5, 0x26]
	movs r2, 0x26
	ldrsh r0, [r5, r2]
	cmp r0, 0x13
	ble _08133880
	movs r1, 0x2E
	ldrsh r0, [r5, r1]
	cmp r0, 0
	beq _08133890
	ldrh r0, [r5, 0x30]
	adds r0, 0x1
	strh r0, [r5, 0x30]
	ldr r4, _08133878 @ =gUnknown_8250C04
	ldrh r0, [r5, 0x2E]
	bl ItemIdToBattleMoveId
	lsls r0, 16
	lsrs r0, 16
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	ldrb r0, [r1, 0x2]
	bl sub_8133730
	ldr r2, _0813387C @ =0xfffffedf
	adds r1, r2, 0
	ldrh r0, [r5, 0x2E]
	adds r1, r0
	strh r1, [r5, 0x2E]
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl sub_8133714
	ldrh r1, [r5, 0x2E]
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl sub_8133790
	b _081338A2
	.align 2, 0
_08133878: .4byte gUnknown_8250C04
_0813387C: .4byte 0xfffffedf
_08133880:
	adds r0, r1, 0
	adds r0, 0xA
	b _081338A0
_08133886:
	ldrh r1, [r5, 0x26]
	movs r2, 0x26
	ldrsh r0, [r5, r2]
	cmp r0, 0
	bgt _0813389C
_08133890:
	ldr r0, _08133898 @ =nullsub_8
	str r0, [r5, 0x1C]
	b _081338A2
	.align 2, 0
_08133898: .4byte nullsub_8
_0813389C:
	adds r0, r1, 0
	subs r0, 0xA
_081338A0:
	strh r0, [r5, 0x26]
_081338A2:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8133810

	thumb_func_start sub_81338A8
sub_81338A8: @ 81338A8
	push {r4,r5,lr}
	sub sp, 0x8
	ldr r4, _081338F4 @ =gUnknown_203B12C
	movs r5, 0x88
	lsls r5, 2
	adds r0, r5, 0
	bl Alloc
	adds r1, r0, 0
	str r1, [r4]
	ldr r0, _081338F8 @ =gUnknown_8E84F20
	bl LZDecompressWram
	ldr r0, _081338FC @ =gUnknown_8E85068
	ldr r1, [r4]
	movs r2, 0x80
	lsls r2, 2
	adds r1, r2
	bl LZDecompressWram
	ldr r0, [r4]
	adds r0, r5
	str r0, [sp]
	ldr r1, _08133900 @ =0xffff0000
	ldr r0, [sp, 0x4]
	ands r0, r1
	movs r1, 0xC8
	lsls r1, 1
	orrs r0, r1
	str r0, [sp, 0x4]
	mov r0, sp
	bl LoadSpritePalette
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_081338F4: .4byte gUnknown_203B12C
_081338F8: .4byte gUnknown_8E84F20
_081338FC: .4byte gUnknown_8E85068
_08133900: .4byte 0xffff0000
	thumb_func_end sub_81338A8

	.align 2, 0 @ Don't pad with nop.
