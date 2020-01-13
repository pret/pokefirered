	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_814B6F0
sub_814B6F0: @ 814B6F0
	ldr r0, _0814B6F8 @ =gUnknown_203F3DC
	ldr r0, [r0]
	bx lr
	.align 2, 0
_0814B6F8: .4byte gUnknown_203F3DC
	thumb_func_end sub_814B6F0

	thumb_func_start sub_814B6FC
sub_814B6FC: @ 814B6FC
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r5, _0814B70C @ =gUnknown_203F3DC
	ldr r0, [r5]
	cmp r0, 0
	bne _0814B710
	movs r0, 0x2
	b _0814B740
	.align 2, 0
_0814B70C: .4byte gUnknown_203F3DC
_0814B710:
	cmp r4, 0
	bne _0814B716
	ldr r4, [r0]
_0814B716:
	ldrb r0, [r0, 0xA]
	bl DestroyTask
	ldr r0, [r5]
	bl Free
	movs r0, 0
	str r0, [r5]
	adds r0, r4, 0
	bl SetMainCallback2
	ldr r0, _0814B748 @ =CB2_ReturnToField
	cmp r4, r0
	bne _0814B73E
	ldr r0, _0814B74C @ =0x0000012f
	bl PlayNewMapMusic
	ldr r0, _0814B750 @ =sub_8056534
	bl sub_80565E0
_0814B73E:
	movs r0, 0
_0814B740:
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0814B748: .4byte CB2_ReturnToField
_0814B74C: .4byte 0x0000012f
_0814B750: .4byte sub_8056534
	thumb_func_end sub_814B6FC

	thumb_func_start sub_814B754
sub_814B754: @ 814B754
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0xC
	adds r4, r0, 0
	movs r0, 0
	mov r8, r0
	ldr r0, _0814B784 @ =gReceivedRemoteLinkPlayers
	ldrb r0, [r0]
	cmp r0, 0
	beq _0814B772
	ldr r0, _0814B788 @ =gWirelessCommType
	ldrb r0, [r0]
	cmp r0, 0
	bne _0814B790
_0814B772:
	adds r0, r4, 0
	bl SetMainCallback2
	ldr r0, _0814B78C @ =Rfu
	mov r1, r8
	strh r1, [r0, 0x10]
	strh r1, [r0, 0x12]
	b _0814B7DC
	.align 2, 0
_0814B784: .4byte gReceivedRemoteLinkPlayers
_0814B788: .4byte gWirelessCommType
_0814B78C: .4byte Rfu
_0814B790:
	bl GetLinkPlayerCount
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	bl GetMultiplayerId
	lsls r0, 24
	lsrs r7, r0, 24
	mov r0, r8
	cmp r0, 0x1
	bls _0814B7AC
	cmp r7, r8
	bcc _0814B7C0
_0814B7AC:
	adds r0, r4, 0
	bl SetMainCallback2
	ldr r0, _0814B7BC @ =Rfu
	movs r1, 0
	strh r1, [r0, 0x10]
	strh r1, [r0, 0x12]
	b _0814B7DC
	.align 2, 0
_0814B7BC: .4byte Rfu
_0814B7C0:
	ldr r6, _0814B7E8 @ =gUnknown_203F3DC
	ldr r0, _0814B7EC @ =0x000041c0
	bl AllocZeroed
	adds r5, r0, 0
	str r5, [r6]
	cmp r5, 0
	bne _0814B7F4
	adds r0, r4, 0
	bl SetMainCallback2
	ldr r0, _0814B7F0 @ =Rfu
	strh r5, [r0, 0x10]
	strh r5, [r0, 0x12]
_0814B7DC:
	adds r0, 0xEE
	ldrb r1, [r0]
	movs r1, 0x1
	strb r1, [r0]
	b _0814B84C
	.align 2, 0
_0814B7E8: .4byte gUnknown_203F3DC
_0814B7EC: .4byte 0x000041c0
_0814B7F0: .4byte Rfu
_0814B7F4:
	str r4, [r5]
	movs r4, 0
	strb r7, [r5, 0x8]
	ldr r0, [r6]
	mov r1, r8
	strb r1, [r0, 0x9]
	ldr r0, [r6]
	bl sub_814BABC
	ldr r1, [r6]
	movs r2, 0x1
	movs r0, 0x1
	strh r0, [r1, 0x12]
	strb r2, [r1, 0xE]
	ldr r1, [r6]
	movs r0, 0x6
	strb r0, [r1, 0xF]
	ldr r0, [r6]
	adds r0, 0x36
	movs r2, 0x1
	negs r2, r2
	movs r1, 0x10
	str r1, [sp]
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	movs r1, 0x1
	movs r3, 0
	bl sub_814D564
	ldr r2, [r6]
	adds r2, 0x36
	movs r0, 0x4
	movs r1, 0x1
	bl sub_814BB4C
	ldr r0, _0814B858 @ =sub_814BA80
	bl SetMainCallback2
	ldr r0, _0814B85C @ =sub_814BA98
	movs r1, 0x8
	bl CreateTask
	ldr r1, [r6]
	strb r0, [r1, 0xA]
_0814B84C:
	add sp, 0xC
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0814B858: .4byte sub_814BA80
_0814B85C: .4byte sub_814BA98
	thumb_func_end sub_814B754

	thumb_func_start sub_814B860
sub_814B860: @ 814B860
	push {r4,lr}
	sub sp, 0xC
	ldr r1, _0814B878 @ =gSpecialVar_ItemId
	ldrh r0, [r1]
	subs r0, 0x85
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x2B
	bls _0814B87C
	movs r0, 0x85
	strh r0, [r1]
	b _0814B884
	.align 2, 0
_0814B878: .4byte gSpecialVar_ItemId
_0814B87C:
	ldrh r0, [r1]
	movs r1, 0x1
	bl RemoveBagItem
_0814B884:
	ldr r4, _0814B8E0 @ =gUnknown_203F3DC
	ldr r2, [r4]
	ldrb r0, [r2, 0x8]
	lsls r0, 5
	adds r0, r2, r0
	ldr r1, _0814B8E4 @ =gSpecialVar_ItemId
	ldrh r1, [r1]
	subs r1, 0x85
	adds r0, 0xA4
	movs r3, 0
	strh r1, [r0]
	movs r0, 0x1
	strb r0, [r2, 0xE]
	ldr r1, [r4]
	movs r0, 0x9
	strb r0, [r1, 0xF]
	ldr r0, [r4]
	adds r0, 0x36
	movs r2, 0x1
	negs r2, r2
	movs r1, 0x10
	str r1, [sp]
	str r3, [sp, 0x4]
	str r3, [sp, 0x8]
	movs r1, 0
	bl sub_814D564
	ldr r2, [r4]
	adds r2, 0x36
	movs r0, 0x4
	movs r1, 0x1
	bl sub_814BB4C
	ldr r0, _0814B8E8 @ =sub_814BA98
	movs r1, 0x8
	bl CreateTask
	ldr r1, [r4]
	strb r0, [r1, 0xA]
	ldr r0, _0814B8EC @ =sub_814BA80
	bl SetMainCallback2
	add sp, 0xC
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0814B8E0: .4byte gUnknown_203F3DC
_0814B8E4: .4byte gSpecialVar_ItemId
_0814B8E8: .4byte sub_814BA98
_0814B8EC: .4byte sub_814BA80
	thumb_func_end sub_814B860

	thumb_func_start sub_814B8F0
sub_814B8F0: @ 814B8F0
	push {lr}
	ldr r0, _0814B90C @ =gUnknown_203F3DC
	ldr r0, [r0]
	ldrb r0, [r0, 0xA]
	bl DestroyTask
	ldr r1, _0814B910 @ =sub_814B860
	movs r0, 0x5
	movs r2, 0
	bl InitBerryPouch
	pop {r0}
	bx r0
	.align 2, 0
_0814B90C: .4byte gUnknown_203F3DC
_0814B910: .4byte sub_814B860
	thumb_func_end sub_814B8F0

	thumb_func_start sub_814B914
sub_814B914: @ 814B914
	push {lr}
	ldr r0, _0814B920 @ =sub_814BA6C
	bl SetVBlankCallback
	pop {r0}
	bx r0
	.align 2, 0
_0814B920: .4byte sub_814BA6C
	thumb_func_end sub_814B914

	thumb_func_start sub_814B924
sub_814B924: @ 814B924
	push {lr}
	movs r0, 0
	bl SetVBlankCallback
	pop {r0}
	bx r0
	thumb_func_end sub_814B924

	thumb_func_start sub_814B930
sub_814B930: @ 814B930
	push {r4,r5,lr}
	ldr r4, _0814B974 @ =gUnknown_203F3DC
	ldr r0, [r4]
	adds r0, 0x6C
	ldrh r2, [r0]
	lsls r2, 8
	movs r1, 0xF0
	lsls r1, 6
	adds r0, r2, 0
	bl sub_80D8B68
	adds r2, r0, 0
	ldr r0, [r4]
	adds r0, 0x72
	ldrh r3, [r0]
	lsls r3, 8
	adds r0, r3, 0
	adds r1, r2, 0
	bl sub_80D8B68
	adds r3, r0, 0
	ldr r0, _0814B978 @ =0x0000ffff
	ands r3, r0
	ldr r2, [r4]
	strh r3, [r2, 0x16]
	ldrb r0, [r2, 0x9]
	cmp r0, 0x3
	beq _0814B9B4
	cmp r0, 0x3
	bgt _0814B97C
	cmp r0, 0x2
	beq _0814B986
	b _0814BA3C
	.align 2, 0
_0814B974: .4byte gUnknown_203F3DC
_0814B978: .4byte 0x0000ffff
_0814B97C:
	cmp r0, 0x4
	beq _0814B9E4
	cmp r0, 0x5
	beq _0814BA14
	b _0814BA3C
_0814B986:
	ldr r5, _0814B9B0 @ =gSaveBlock2Ptr
	ldr r1, [r5]
	movs r0, 0xAF
	lsls r0, 4
	adds r1, r0
	lsls r0, r3, 16
	lsrs r0, 16
	ldrh r1, [r1]
	cmp r0, r1
	bls _0814BA3C
	adds r2, 0x25
	ldrb r0, [r2]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r2]
	ldr r0, [r5]
	ldr r1, [r4]
	ldrh r1, [r1, 0x16]
	movs r2, 0xAF
	lsls r2, 4
	b _0814BA38
	.align 2, 0
_0814B9B0: .4byte gSaveBlock2Ptr
_0814B9B4:
	ldr r5, _0814B9DC @ =gSaveBlock2Ptr
	ldr r1, [r5]
	ldr r0, _0814B9E0 @ =0x00000af2
	adds r1, r0
	lsls r0, r3, 16
	lsrs r0, 16
	ldrh r1, [r1]
	cmp r0, r1
	bls _0814BA3C
	adds r2, 0x25
	ldrb r0, [r2]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r2]
	ldr r0, [r5]
	ldr r1, [r4]
	ldrh r1, [r1, 0x16]
	ldr r2, _0814B9E0 @ =0x00000af2
	b _0814BA38
	.align 2, 0
_0814B9DC: .4byte gSaveBlock2Ptr
_0814B9E0: .4byte 0x00000af2
_0814B9E4:
	ldr r5, _0814BA0C @ =gSaveBlock2Ptr
	ldr r1, [r5]
	ldr r0, _0814BA10 @ =0x00000af4
	adds r1, r0
	lsls r0, r3, 16
	lsrs r0, 16
	ldrh r1, [r1]
	cmp r0, r1
	bls _0814BA3C
	adds r2, 0x25
	ldrb r0, [r2]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r2]
	ldr r0, [r5]
	ldr r1, [r4]
	ldrh r1, [r1, 0x16]
	ldr r2, _0814BA10 @ =0x00000af4
	b _0814BA38
	.align 2, 0
_0814BA0C: .4byte gSaveBlock2Ptr
_0814BA10: .4byte 0x00000af4
_0814BA14:
	ldr r5, _0814BA60 @ =gSaveBlock2Ptr
	ldr r1, [r5]
	ldr r0, _0814BA64 @ =0x00000af6
	adds r1, r0
	lsls r0, r3, 16
	lsrs r0, 16
	ldrh r1, [r1]
	cmp r0, r1
	bls _0814BA3C
	adds r2, 0x25
	ldrb r0, [r2]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r2]
	ldr r0, [r5]
	ldr r1, [r4]
	ldrh r1, [r1, 0x16]
	ldr r2, _0814BA64 @ =0x00000af6
_0814BA38:
	adds r0, r2
	strh r1, [r0]
_0814BA3C:
	ldr r4, _0814BA68 @ =gUnknown_203F3DC
	ldr r1, [r4]
	ldr r0, [r1, 0x68]
	str r0, [r1, 0x1C]
	bl sub_815EEE0
	lsls r0, 24
	cmp r0, 0
	bne _0814BA5A
	ldr r0, [r4]
	adds r0, 0x25
	ldrb r1, [r0]
	movs r2, 0x1
	orrs r1, r2
	strb r1, [r0]
_0814BA5A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0814BA60: .4byte gSaveBlock2Ptr
_0814BA64: .4byte 0x00000af6
_0814BA68: .4byte gUnknown_203F3DC
	thumb_func_end sub_814B930

	thumb_func_start sub_814BA6C
sub_814BA6C: @ 814BA6C
	push {lr}
	bl TransferPlttBuffer
	bl LoadOam
	bl ProcessSpriteCopyRequests
	pop {r0}
	bx r0
	thumb_func_end sub_814BA6C

	thumb_func_start sub_814BA80
sub_814BA80: @ 814BA80
	push {lr}
	bl RunTasks
	bl RunTextPrinters
	bl AnimateSprites
	bl BuildOamBuffer
	pop {r0}
	bx r0
	thumb_func_end sub_814BA80

	thumb_func_start sub_814BA98
sub_814BA98: @ 814BA98
	push {r4,lr}
	ldr r4, _0814BAB8 @ =gUnknown_203F3DC
	ldr r0, [r4]
	ldr r2, [r0, 0x4]
	cmp r2, 0
	beq _0814BAAC
	adds r1, r0, 0
	adds r1, 0x36
	bl _call_via_r2
_0814BAAC:
	ldr r0, [r4]
	bl sub_814D9CC
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0814BAB8: .4byte gUnknown_203F3DC
	thumb_func_end sub_814BA98

	thumb_func_start sub_814BABC
sub_814BABC: @ 814BABC
	push {r4-r6,lr}
	adds r6, r0, 0
	movs r5, 0
	b _0814BAE8
_0814BAC4:
	lsls r4, r5, 5
	adds r0, r4, 0
	adds r0, 0x98
	adds r0, r6, r0
	lsls r1, r5, 3
	subs r1, r5
	lsls r1, 2
	ldr r2, _0814BB2C @ =gLinkPlayers + 8
	adds r1, r2
	bl StringCopy
	adds r4, r6, r4
	adds r4, 0x9F
	movs r0, 0xFF
	strb r0, [r4]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
_0814BAE8:
	ldrb r0, [r6, 0x9]
	cmp r5, r0
	bcc _0814BAC4
	cmp r5, 0x4
	bhi _0814BB14
_0814BAF2:
	lsls r4, r5, 5
	adds r0, r4, 0
	adds r0, 0x98
	adds r0, r6, r0
	movs r1, 0x1
	movs r2, 0x7
	bl memset
	adds r4, r6, r4
	adds r4, 0x9F
	movs r0, 0xFF
	strb r0, [r4]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x4
	bls _0814BAF2
_0814BB14:
	ldr r0, _0814BB30 @ =gSaveBlock2Ptr
	ldr r0, [r0]
	ldrb r0, [r0, 0x14]
	lsls r0, 29
	lsrs r0, 29
	cmp r0, 0x1
	beq _0814BB3E
	cmp r0, 0x1
	bgt _0814BB34
	cmp r0, 0
	beq _0814BB3A
	b _0814BB46
	.align 2, 0
_0814BB2C: .4byte gLinkPlayers + 8
_0814BB30: .4byte gSaveBlock2Ptr
_0814BB34:
	cmp r0, 0x2
	beq _0814BB42
	b _0814BB46
_0814BB3A:
	movs r0, 0x8
	b _0814BB44
_0814BB3E:
	movs r0, 0x4
	b _0814BB44
_0814BB42:
	movs r0, 0x1
_0814BB44:
	strb r0, [r6, 0xB]
_0814BB46:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_814BABC

	.align 2, 0 @ Don't pad with nop.
