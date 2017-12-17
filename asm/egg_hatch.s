	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_8046BFC
sub_8046BFC: @ 8046BFC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x50
	adds r6, r0, 0
	adds r5, r1, 0
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp, 0x3C]
	movs r4, 0
	add r7, sp, 0x18
	movs r0, 0x31
	add r0, sp
	mov r10, r0
	mov r1, sp
	adds r1, 0x32
	str r1, [sp, 0x40]
	mov r0, sp
	adds r0, 0x34
	str r0, [sp, 0x48]
	add r1, sp, 0x30
	mov r9, r1
	subs r0, 0x1
	str r0, [sp, 0x44]
	mov r1, sp
	adds r1, 0x38
	str r1, [sp, 0x4C]
_08046C3C:
	adds r1, r4, 0
	adds r1, 0xD
	adds r0, r6, 0
	bl GetMonData
	lsls r1, r4, 1
	add r1, sp
	adds r1, 0x10
	strh r0, [r1]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x3
	bls _08046C3C
	adds r0, r6, 0
	movs r1, 0
	bl GetMonData
	mov r8, r0
	movs r4, 0
_08046C64:
	adds r1, r4, 0
	adds r1, 0x27
	adds r0, r6, 0
	bl GetMonData
	lsls r1, r4, 2
	adds r1, r7, r1
	str r0, [r1]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x5
	bls _08046C64
	adds r0, r6, 0
	movs r1, 0x25
	bl GetMonData
	mov r1, r10
	strb r0, [r1]
	adds r0, r6, 0
	movs r1, 0x8
	bl GetMonData
	ldr r1, [sp, 0x40]
	strb r0, [r1]
	adds r0, r6, 0
	movs r1, 0x22
	bl GetMonData
	str r0, [sp, 0x38]
	adds r0, r6, 0
	movs r1, 0x50
	bl GetMonData
	ldr r1, [sp, 0x48]
	strb r0, [r1]
	movs r0, 0x1
	str r0, [sp]
	mov r0, r8
	str r0, [sp, 0x4]
	movs r0, 0
	str r0, [sp, 0x8]
	str r0, [sp, 0xC]
	adds r0, r5, 0
	ldr r1, [sp, 0x3C]
	movs r2, 0x5
	movs r3, 0x20
	bl CreateMon
	movs r4, 0
_08046CC8:
	adds r1, r4, 0
	adds r1, 0xD
	lsls r0, r4, 1
	mov r2, sp
	adds r2, r0
	adds r2, 0x10
	adds r0, r5, 0
	bl sub_804037C
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x3
	bls _08046CC8
	movs r4, 0
_08046CE6:
	adds r1, r4, 0
	adds r1, 0x27
	lsls r2, r4, 2
	adds r2, r7, r2
	adds r0, r5, 0
	bl sub_804037C
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x5
	bls _08046CE6
	movs r0, 0x2
	mov r1, r9
	strb r0, [r1]
	adds r0, r5, 0
	movs r1, 0x3
	mov r2, r9
	bl sub_804037C
	adds r0, r5, 0
	movs r1, 0x25
	mov r2, r10
	bl sub_804037C
	adds r0, r5, 0
	movs r1, 0x8
	ldr r2, [sp, 0x40]
	bl sub_804037C
	movs r0, 0x78
	ldr r1, [sp, 0x44]
	strb r0, [r1]
	adds r0, r5, 0
	movs r1, 0x20
	ldr r2, [sp, 0x44]
	bl sub_804037C
	adds r0, r5, 0
	movs r1, 0x22
	ldr r2, [sp, 0x4C]
	bl sub_804037C
	adds r0, r5, 0
	movs r1, 0x50
	ldr r2, [sp, 0x48]
	bl sub_804037C
	adds r0, r6, 0
	adds r1, r5, 0
	movs r2, 0x64
	bl memcpy
	add sp, 0x50
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8046BFC

	thumb_func_start sub_8046D60
sub_8046D60: @ 8046D60
	push {r4,r5,lr}
	sub sp, 0x14
	lsls r0, 24
	lsrs r0, 24
	add r4, sp, 0xC
	movs r1, 0x46
	strb r1, [r4]
	movs r1, 0x64
	adds r5, r0, 0
	muls r5, r1
	ldr r0, _08046E14 @ =gUnknown_2024284
	adds r5, r0
	ldr r1, _08046E18 @ =gUnknown_202402C
	adds r0, r5, 0
	bl sub_8046BFC
	adds r0, r5, 0
	movs r1, 0x2D
	adds r2, r4, 0
	bl sub_804037C
	adds r0, r5, 0
	movs r1, 0xB
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	mov r0, sp
	adds r1, r4, 0
	bl GetSpeciesName
	adds r0, r5, 0
	movs r1, 0x2
	mov r2, sp
	bl sub_804037C
	adds r0, r4, 0
	bl SpeciesToNationalPokedexNum
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r4, 0
	movs r1, 0x2
	bl sub_8088E74
	adds r0, r4, 0
	movs r1, 0x3
	bl sub_8088E74
	ldr r1, _08046E1C @ =gUnknown_2021CD0
	adds r0, r5, 0
	bl GetMonNick
	mov r2, sp
	adds r2, 0xE
	movs r0, 0x4
	strh r0, [r2]
	adds r0, r5, 0
	movs r1, 0x26
	bl sub_804037C
	add r2, sp, 0x10
	movs r0, 0
	strh r0, [r2]
	adds r0, r5, 0
	movs r1, 0x24
	bl sub_804037C
	bl sav1_map_get_name
	mov r2, sp
	adds r2, 0x12
	strb r0, [r2]
	adds r0, r5, 0
	movs r1, 0x23
	bl sub_804037C
	adds r0, r5, 0
	bl MonRestorePP
	adds r0, r5, 0
	bl CalculateMonStats
	add sp, 0x14
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08046E14: .4byte gUnknown_2024284
_08046E18: .4byte gUnknown_202402C
_08046E1C: .4byte gUnknown_2021CD0
	thumb_func_end sub_8046D60

	thumb_func_start sub_8046E20
sub_8046E20: @ 8046E20
	push {lr}
	ldr r0, _08046E30 @ =gUnknown_20370C0
	ldrb r0, [r0]
	bl sub_8046D60
	pop {r0}
	bx r0
	.align 2, 0
_08046E30: .4byte gUnknown_20370C0
	thumb_func_end sub_8046E20

	thumb_func_start sub_8046E34
sub_8046E34: @ 8046E34
	push {r4,r5,lr}
	sub sp, 0x20
	lsls r1, 24
	lsrs r1, 24
	movs r2, 0x8C
	muls r1, r2
	adds r4, r0, r1
	adds r0, r4, 0
	mov r1, sp
	bl GetBoxMonNick
	adds r0, r4, 0
	adds r0, 0x70
	ldrh r0, [r0]
	cmp r0, 0
	beq _08046EA0
	adds r5, r4, 0
	adds r5, 0x7C
	mov r0, sp
	adds r1, r5, 0
	bl StringCompare
	adds r4, 0x74
	cmp r0, 0
	bne _08046E74
	ldr r0, _08046E90 @ =gUnknown_300500C
	ldr r0, [r0]
	adds r1, r4, 0
	bl StringCompare
	cmp r0, 0
	beq _08046EA0
_08046E74:
	ldr r0, _08046E94 @ =gUnknown_2021CD0
	mov r1, sp
	bl StringCopy
	ldr r0, _08046E98 @ =gUnknown_2021CF0
	adds r1, r4, 0
	bl StringCopy
	ldr r0, _08046E9C @ =gUnknown_2021D04
	adds r1, r5, 0
	bl StringCopy
	movs r0, 0x1
	b _08046EA2
	.align 2, 0
_08046E90: .4byte gUnknown_300500C
_08046E94: .4byte gUnknown_2021CD0
_08046E98: .4byte gUnknown_2021CF0
_08046E9C: .4byte gUnknown_2021D04
_08046EA0:
	movs r0, 0
_08046EA2:
	add sp, 0x20
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8046E34

	thumb_func_start sub_8046EAC
sub_8046EAC: @ 8046EAC
	push {lr}
	ldr r0, _08046EC8 @ =gUnknown_3005008
	ldr r0, [r0]
	movs r1, 0xBE
	lsls r1, 6
	adds r0, r1
	ldr r1, _08046ECC @ =gUnknown_20370C0
	ldrb r1, [r1]
	bl sub_8046E34
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_08046EC8: .4byte gUnknown_3005008
_08046ECC: .4byte gUnknown_20370C0
	thumb_func_end sub_8046EAC

	thumb_func_start sub_8046ED0
sub_8046ED0: @ 8046ED0
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	mov r9, r3
	lsls r0, 24
	lsrs r3, r0, 24
	mov r8, r3
	lsls r1, 24
	lsrs r6, r1, 24
	lsls r2, 24
	lsrs r1, r2, 24
	adds r2, r1, 0
	movs r4, 0
	movs r7, 0
	movs r5, 0
	cmp r3, 0
	bne _08046EFE
	movs r0, 0x64
	muls r1, r0
	ldr r0, _08046F18 @ =gUnknown_2024284
	adds r5, r1, r0
	movs r4, 0x1
_08046EFE:
	cmp r3, 0x1
	bne _08046F0E
	movs r0, 0x64
	adds r1, r2, 0
	muls r1, r0
	ldr r0, _08046F18 @ =gUnknown_2024284
	adds r5, r1, r0
	movs r4, 0x3
_08046F0E:
	cmp r6, 0
	beq _08046F1C
	cmp r6, 0x1
	beq _08046F6C
	b _08046FA6
	.align 2, 0
_08046F18: .4byte gUnknown_2024284
_08046F1C:
	adds r0, r5, 0
	movs r1, 0xB
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	movs r1, 0
	bl GetMonData
	adds r3, r0, 0
	lsls r0, r4, 3
	ldr r1, _08046F64 @ =gUnknown_82350AC
	adds r0, r1
	ldr r1, _08046F68 @ =gUnknown_202401C
	ldr r2, [r1]
	mov r6, r8
	lsls r1, r6, 1
	adds r1, 0x1
	lsls r1, 2
	adds r2, 0x4
	adds r2, r1
	ldr r1, [r2]
	adds r2, r4, 0
	bl sub_800ECC4
	adds r0, r5, 0
	bl sub_8044148
	bl LoadCompressedObjectPalette
	mov r0, r9
	strh r4, [r0]
	b _08046FA6
	.align 2, 0
_08046F64: .4byte gUnknown_82350AC
_08046F68: .4byte gUnknown_202401C
_08046F6C:
	adds r0, r5, 0
	bl sub_8044148
	ldrh r0, [r0, 0x4]
	adds r1, r4, 0
	bl sub_803F7D4
	ldr r0, _08046FB4 @ =gUnknown_20244DC
	movs r1, 0x78
	movs r2, 0x46
	movs r3, 0x6
	bl CreateSprite
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r4, _08046FB8 @ =gUnknown_202063C
	lsls r1, r7, 4
	adds r1, r7
	lsls r1, 2
	adds r2, r1, r4
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r3, 0x4
	orrs r0, r3
	strb r0, [r2]
	adds r4, 0x1C
	adds r1, r4
	ldr r0, _08046FBC @ =nullsub_8
	str r0, [r1]
_08046FA6:
	adds r0, r7, 0
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08046FB4: .4byte gUnknown_20244DC
_08046FB8: .4byte gUnknown_202063C
_08046FBC: .4byte nullsub_8
	thumb_func_end sub_8046ED0

	thumb_func_start sub_8046FC0
sub_8046FC0: @ 8046FC0
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	thumb_func_end sub_8046FC0

	thumb_func_start sub_8046FD4
sub_8046FD4: @ 8046FD4
	push {lr}
	sub sp, 0x4
	bl ScriptContext2_Enable
	ldr r0, _08047000 @ =sub_8047004
	movs r1, 0xA
	bl CreateTask
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	bl sub_812B478
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_08047000: .4byte sub_8047004
	thumb_func_end sub_8046FD4

	thumb_func_start sub_8047004
sub_8047004: @ 8047004
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _08047034 @ =gUnknown_2037AB8
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0804702C
	bl sub_80563F0
	ldr r0, _08047038 @ =sub_8047044
	bl SetMainCallback2
	ldr r1, _0804703C @ =gUnknown_3005020
	ldr r0, _08047040 @ =sub_807DD24
	str r0, [r1]
	adds r0, r4, 0
	bl DestroyTask
_0804702C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08047034: .4byte gUnknown_2037AB8
_08047038: .4byte sub_8047044
_0804703C: .4byte gUnknown_3005020
_08047040: .4byte sub_807DD24
	thumb_func_end sub_8047004

	thumb_func_start sub_8047044
sub_8047044: @ 8047044
	push {r4,lr}
	sub sp, 0x4
	ldr r0, _08047064 @ =gUnknown_30030F0
	movs r1, 0x87
	lsls r1, 3
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x8
	bls _08047058
	b _0804727A
_08047058:
	lsls r0, 2
	ldr r1, _08047068 @ =_0804706C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08047064: .4byte gUnknown_30030F0
_08047068: .4byte _0804706C
	.align 2, 0
_0804706C:
	.4byte _08047090
	.4byte _0804715C
	.4byte _08047174
	.4byte _080471A8
	.4byte _080471C8
	.4byte _080471E0
	.4byte _080471F8
	.4byte _08047214
	.4byte _0804726C
_08047090:
	movs r0, 0
	movs r1, 0
	bl SetGpuReg
	ldr r4, _08047148 @ =gUnknown_3000E74
	movs r0, 0x14
	bl Alloc
	str r0, [r4]
	bl AllocateMonSpritesGfx
	ldr r2, [r4]
	ldr r0, _0804714C @ =gUnknown_20370C0
	ldrh r0, [r0]
	movs r1, 0
	strb r0, [r2, 0x4]
	ldr r0, [r4]
	strb r1, [r0, 0x7]
	ldr r0, _08047150 @ =sub_8046FC0
	bl SetVBlankCallback
	bl GetCurrentMapMusic
	ldr r1, _08047154 @ =gUnknown_20370C2
	strh r0, [r1]
	bl reset_temp_tile_data_buffers
	movs r0, 0
	bl sub_8001618
	ldr r1, _08047158 @ =gUnknown_826019C
	movs r0, 0
	movs r2, 0x2
	bl sub_8001658
	movs r0, 0x1
	movs r1, 0
	movs r2, 0
	bl ChangeBgX
	movs r0, 0x1
	movs r1, 0
	movs r2, 0
	bl ChangeBgY
	movs r0, 0
	movs r1, 0
	movs r2, 0
	bl ChangeBgX
	movs r0, 0
	movs r1, 0
	movs r2, 0
	bl ChangeBgY
	movs r0, 0x1
	movs r1, 0x7
	movs r2, 0x2
	bl SetBgAttribute
	movs r0, 0x80
	lsls r0, 5
	bl Alloc
	adds r1, r0, 0
	movs r0, 0x1
	bl SetBgTilemapBuffer
	movs r0, 0x80
	lsls r0, 6
	bl Alloc
	adds r1, r0, 0
	movs r0, 0
	bl SetBgTilemapBuffer
	bl sub_8002C28
	bl ResetPaletteFade
	bl FreeAllSpritePalettes
	bl ResetSpriteData
	bl ResetTasks
	bl remove_some_task
	bl m4aSoundVSyncOn
	b _0804724A
	.align 2, 0
_08047148: .4byte gUnknown_3000E74
_0804714C: .4byte gUnknown_20370C0
_08047150: .4byte sub_8046FC0
_08047154: .4byte gUnknown_20370C2
_08047158: .4byte gUnknown_826019C
_0804715C:
	ldr r0, _0804716C @ =gUnknown_82601A4
	bl sub_8003B24
	ldr r0, _08047170 @ =gUnknown_3000E74
	ldr r1, [r0]
	movs r0, 0
	strb r0, [r1, 0x8]
	b _0804724A
	.align 2, 0
_0804716C: .4byte gUnknown_82601A4
_08047170: .4byte gUnknown_3000E74
_08047174:
	ldr r1, _0804719C @ =gUnknown_8D00000
	movs r0, 0
	str r0, [sp]
	movs r2, 0
	movs r3, 0
	bl sub_80F696C
	ldr r1, _080471A0 @ =gUnknown_8D0051C
	movs r0, 0
	movs r2, 0
	movs r3, 0
	bl CopyToBgTilemapBuffer
	ldr r0, _080471A4 @ =gUnknown_8D004D8
	movs r1, 0
	movs r2, 0x20
	bl LoadCompressedPalette
	b _0804724A
	.align 2, 0
_0804719C: .4byte gUnknown_8D00000
_080471A0: .4byte gUnknown_8D0051C
_080471A4: .4byte gUnknown_8D004D8
_080471A8:
	ldr r0, _080471BC @ =gUnknown_826011C
	bl LoadSpriteSheet
	ldr r0, _080471C0 @ =gUnknown_8260124
	bl LoadSpriteSheet
	ldr r0, _080471C4 @ =gUnknown_826012C
	bl LoadSpritePalette
	b _0804724A
	.align 2, 0
_080471BC: .4byte gUnknown_826011C
_080471C0: .4byte gUnknown_8260124
_080471C4: .4byte gUnknown_826012C
_080471C8:
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	ldr r0, _080471DC @ =gUnknown_3000E74
	ldr r0, [r0]
	ldrb r0, [r0, 0x4]
	bl sub_8046D60
	b _0804724A
	.align 2, 0
_080471DC: .4byte gUnknown_3000E74
_080471E0:
	ldr r0, _080471F4 @ =gUnknown_3000E74
	ldr r3, [r0]
	ldrb r2, [r3, 0x4]
	adds r3, 0xC
	movs r0, 0
	movs r1, 0
	bl sub_8046ED0
	b _0804724A
	.align 2, 0
_080471F4: .4byte gUnknown_3000E74
_080471F8:
	ldr r4, _08047210 @ =gUnknown_3000E74
	ldr r3, [r4]
	ldrb r2, [r3, 0x4]
	adds r3, 0xC
	movs r0, 0
	movs r1, 0x1
	bl sub_8046ED0
	ldr r1, [r4]
	strb r0, [r1, 0x1]
	b _0804724A
	.align 2, 0
_08047210: .4byte gUnknown_3000E74
_08047214:
	movs r1, 0x82
	lsls r1, 5
	movs r0, 0
	bl SetGpuReg
	ldr r0, _0804725C @ =gUnknown_8EAEA20
	movs r1, 0x10
	movs r2, 0xA0
	bl LoadPalette
	ldr r1, _08047260 @ =gUnknown_8EAEA80
	movs r2, 0xA1
	lsls r2, 5
	movs r0, 0x1
	movs r3, 0
	bl LoadBgTiles
	ldr r1, _08047264 @ =gUnknown_826601C
	movs r2, 0x80
	lsls r2, 5
	movs r0, 0x1
	movs r3, 0
	bl CopyToBgTilemapBuffer
	movs r0, 0x1
	bl CopyBgTilemapBufferToVram
_0804724A:
	ldr r1, _08047268 @ =gUnknown_30030F0
	movs r0, 0x87
	lsls r0, 3
	adds r1, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _0804727A
	.align 2, 0
_0804725C: .4byte gUnknown_8EAEA20
_08047260: .4byte gUnknown_8EAEA80
_08047264: .4byte gUnknown_826601C
_08047268: .4byte gUnknown_30030F0
_0804726C:
	ldr r0, _08047298 @ =sub_8047338
	bl SetMainCallback2
	ldr r0, _0804729C @ =gUnknown_3000E74
	ldr r1, [r0]
	movs r0, 0
	strb r0, [r1, 0x2]
_0804727A:
	bl RunTasks
	bl sub_8002DE8
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08047298: .4byte sub_8047338
_0804729C: .4byte gUnknown_3000E74
	thumb_func_end sub_8047044

	thumb_func_start sub_80472A0
sub_80472A0: @ 80472A0
	push {lr}
	ldr r0, _080472D0 @ =gUnknown_20370C0
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080472D4 @ =gUnknown_2024284
	adds r0, r1
	ldr r2, _080472D8 @ =gUnknown_2021D04
	movs r1, 0x2
	bl sub_804037C
	bl FreeMonSpritesGfx
	ldr r0, _080472DC @ =gUnknown_3000E74
	ldr r0, [r0]
	bl Free
	bl sub_812B484
	ldr r0, _080472E0 @ =c2_exit_to_overworld_2_switch
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_080472D0: .4byte gUnknown_20370C0
_080472D4: .4byte gUnknown_2024284
_080472D8: .4byte gUnknown_2021D04
_080472DC: .4byte gUnknown_3000E74
_080472E0: .4byte c2_exit_to_overworld_2_switch
	thumb_func_end sub_80472A0

	thumb_func_start sub_80472E4
sub_80472E4: @ 80472E4
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _08047330 @ =gUnknown_3005090
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _08047300
	bl StopMapMusic
_08047300:
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	bne _0804730E
	ldr r0, _08047334 @ =0x00000107
	bl PlayBGM
_0804730E:
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x3C
	ble _08047324
	movs r0, 0x84
	lsls r0, 1
	bl PlayBGM
	adds r0, r5, 0
	bl DestroyTask
_08047324:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08047330: .4byte gUnknown_3005090
_08047334: .4byte 0x00000107
	thumb_func_end sub_80472E4

	thumb_func_start sub_8047338
sub_8047338: @ 8047338
	push {r4-r6,lr}
	mov r6, r10
	mov r5, r9
	mov r4, r8
	push {r4-r6}
	sub sp, 0xC
	ldr r1, _0804735C @ =gUnknown_3000E74
	ldr r0, [r1]
	ldrb r0, [r0, 0x2]
	adds r5, r1, 0
	cmp r0, 0xC
	bls _08047352
	b _08047684
_08047352:
	lsls r0, 2
	ldr r1, _08047360 @ =_08047364
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0804735C: .4byte gUnknown_3000E74
_08047360: .4byte _08047364
	.align 2, 0
_08047364:
	.4byte _08047398
	.4byte _080473E4
	.4byte _0804740C
	.4byte _08047444
	.4byte _08047474
	.4byte _08047482
	.4byte _080474E8
	.4byte _080474F6
	.4byte _08047504
	.4byte _08047548
	.4byte _08047588
	.4byte _08047634
	.4byte _08047654
_08047398:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r0, _080473D8 @ =gUnknown_8260134
	movs r1, 0x78
	movs r2, 0x4B
	movs r3, 0x5
	bl CreateSprite
	ldr r4, _080473DC @ =gUnknown_3000E74
	ldr r1, [r4]
	strb r0, [r1]
	movs r0, 0
	bl ShowBg
	movs r0, 0x1
	bl ShowBg
	ldr r1, [r4]
	ldrb r0, [r1, 0x2]
	adds r0, 0x1
	strb r0, [r1, 0x2]
	ldr r0, _080473E0 @ =sub_80472E4
	movs r1, 0x5
	bl CreateTask
	b _08047684
	.align 2, 0
_080473D8: .4byte gUnknown_8260134
_080473DC: .4byte gUnknown_3000E74
_080473E0: .4byte sub_80472E4
_080473E4:
	ldr r0, _08047408 @ =gUnknown_2037AB8
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	beq _080473F6
	b _08047684
_080473F6:
	ldr r0, [r5]
	ldrb r0, [r0, 0x8]
	movs r1, 0
	bl FillWindowPixelBuffer
	ldr r0, [r5]
	strb r4, [r0, 0x3]
	ldr r1, [r5]
	b _08047648
	.align 2, 0
_08047408: .4byte gUnknown_2037AB8
_0804740C:
	ldr r1, [r5]
	ldrb r0, [r1, 0x3]
	adds r0, 0x1
	strb r0, [r1, 0x3]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1E
	bhi _0804741E
	b _08047684
_0804741E:
	ldr r1, [r5]
	ldrb r0, [r1, 0x2]
	adds r0, 0x1
	strb r0, [r1, 0x2]
	ldr r2, _0804743C @ =gUnknown_202063C
	ldr r0, [r5]
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, _08047440 @ =sub_80476B0
	str r1, [r0]
	b _08047684
	.align 2, 0
_0804743C: .4byte gUnknown_202063C
_08047440: .4byte sub_80476B0
_08047444:
	ldr r2, _0804746C @ =gUnknown_202063C
	ldr r3, [r5]
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, [r0]
	ldr r0, _08047470 @ =nullsub_8
	cmp r1, r0
	beq _0804745E
	b _08047684
_0804745E:
	ldrh r0, [r3, 0xC]
	movs r1, 0
	bl PlayCry1
	ldr r1, [r5]
	b _08047648
	.align 2, 0
_0804746C: .4byte gUnknown_202063C
_08047470: .4byte nullsub_8
_08047474:
	bl IsCryFinished
	lsls r0, 24
	cmp r0, 0
	bne _08047480
	b _08047684
_08047480:
	b _08047644
_08047482:
	ldr r0, [r5]
	ldrb r1, [r0, 0x4]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080474D4 @ =gUnknown_2024284
	adds r0, r1
	ldr r1, _080474D8 @ =gUnknown_2021CD0
	bl GetMonNick
	ldr r4, _080474DC @ =gUnknown_2021D18
	ldr r1, _080474E0 @ =gUnknown_841B6FD
	adds r0, r4, 0
	bl sub_8008FCC
	ldr r0, [r5]
	ldrb r0, [r0, 0x8]
	movs r1, 0xFF
	str r1, [sp]
	adds r1, r4, 0
	movs r2, 0
	movs r3, 0x3
	bl sub_8047A9C
	ldr r0, _080474E4 @ =0x00000103
	bl PlayFanfare
	ldr r1, [r5]
	ldrb r0, [r1, 0x2]
	adds r0, 0x1
	strb r0, [r1, 0x2]
	ldr r0, [r5]
	ldrb r0, [r0, 0x8]
	bl PutWindowTilemap
	ldr r0, [r5]
	ldrb r0, [r0, 0x8]
	movs r1, 0x3
	bl sub_8003F20
	b _08047684
	.align 2, 0
_080474D4: .4byte gUnknown_2024284
_080474D8: .4byte gUnknown_2021CD0
_080474DC: .4byte gUnknown_2021D18
_080474E0: .4byte gUnknown_841B6FD
_080474E4: .4byte 0x00000103
_080474E8:
	bl IsFanfareTaskInactive
	lsls r0, 24
	cmp r0, 0
	bne _080474F4
	b _08047684
_080474F4:
	b _08047644
_080474F6:
	bl IsFanfareTaskInactive
	lsls r0, 24
	cmp r0, 0
	bne _08047502
	b _08047684
_08047502:
	b _08047644
_08047504:
	ldr r0, [r5]
	ldrb r1, [r0, 0x4]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08047538 @ =gUnknown_2024284
	adds r0, r1
	ldr r1, _0804753C @ =gUnknown_2021CD0
	bl GetMonNick
	ldr r4, _08047540 @ =gUnknown_2021D18
	ldr r1, _08047544 @ =gUnknown_841B716
	adds r0, r4, 0
	bl sub_8008FCC
	ldr r0, [r5]
	ldrb r0, [r0, 0x8]
	movs r1, 0x1
	str r1, [sp]
	adds r1, r4, 0
	movs r2, 0
	movs r3, 0x2
	bl sub_8047A9C
	ldr r1, [r5]
	b _08047648
	.align 2, 0
_08047538: .4byte gUnknown_2024284
_0804753C: .4byte gUnknown_2021CD0
_08047540: .4byte gUnknown_2021D18
_08047544: .4byte gUnknown_841B716
_08047548:
	ldr r0, [r5]
	ldrb r0, [r0, 0x8]
	bl sub_8002E64
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r6, 0
	beq _0804755A
	b _08047684
_0804755A:
	ldr r0, [r5]
	ldrb r0, [r0, 0x8]
	movs r4, 0xA0
	lsls r4, 1
	adds r1, r4, 0
	movs r2, 0xE0
	bl sub_814FE40
	ldr r0, _08047584 @ =gUnknown_82601B4
	str r4, [sp]
	movs r1, 0xE
	str r1, [sp, 0x4]
	str r6, [sp, 0x8]
	movs r1, 0x3
	movs r2, 0
	movs r3, 0x2
	bl sub_810FF60
	ldr r1, [r5]
	b _08047648
	.align 2, 0
_08047584: .4byte gUnknown_82601B4
_08047588:
	bl sub_81100C8
	lsls r0, 24
	asrs r1, r0, 24
	cmp r1, 0
	beq _080475A8
	cmp r1, 0
	bgt _080475A2
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _08047644
	b _08047684
_080475A2:
	cmp r1, 0x1
	beq _08047644
	b _08047684
_080475A8:
	ldr r0, _08047624 @ =gUnknown_3000E74
	mov r9, r0
	ldr r0, [r0]
	ldrb r0, [r0, 0x4]
	movs r1, 0x64
	mov r8, r1
	mov r1, r8
	muls r1, r0
	adds r0, r1, 0
	ldr r6, _08047628 @ =gUnknown_2024284
	adds r0, r6
	ldr r1, _0804762C @ =gUnknown_2021D04
	mov r10, r1
	bl GetMonNick
	mov r1, r9
	ldr r0, [r1]
	ldrb r0, [r0, 0x4]
	mov r1, r8
	muls r1, r0
	adds r0, r1, 0
	adds r0, r6
	movs r1, 0xB
	bl GetMonData
	adds r5, r0, 0
	lsls r5, 16
	lsrs r5, 16
	mov r1, r9
	ldr r0, [r1]
	ldrb r0, [r0, 0x4]
	mov r1, r8
	muls r1, r0
	adds r0, r1, 0
	adds r0, r6
	bl GetMonGender
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	mov r1, r9
	ldr r0, [r1]
	ldrb r0, [r0, 0x4]
	mov r1, r8
	muls r1, r0
	adds r0, r1, 0
	adds r0, r6
	movs r1, 0
	movs r2, 0
	bl GetMonData
	str r0, [sp]
	ldr r0, _08047630 @ =sub_80472A0
	str r0, [sp, 0x4]
	movs r0, 0x3
	mov r1, r10
	adds r2, r5, 0
	adds r3, r4, 0
	bl sub_809D954
	b _08047684
	.align 2, 0
_08047624: .4byte gUnknown_3000E74
_08047628: .4byte gUnknown_2024284
_0804762C: .4byte gUnknown_2021D04
_08047630: .4byte sub_80472A0
_08047634:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
_08047644:
	ldr r0, _08047650 @ =gUnknown_3000E74
	ldr r1, [r0]
_08047648:
	ldrb r0, [r1, 0x2]
	adds r0, 0x1
	strb r0, [r1, 0x2]
	b _08047684
	.align 2, 0
_08047650: .4byte gUnknown_3000E74
_08047654:
	ldr r0, _080476A8 @ =gUnknown_2037AB8
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08047684
	ldr r0, [r5]
	ldrb r0, [r0, 0x8]
	bl sub_8003E3C
	movs r0, 0
	bl UnsetBgTilemapBuffer
	movs r0, 0x1
	bl UnsetBgTilemapBuffer
	ldr r0, [r5]
	bl Free
	ldr r0, _080476AC @ =c2_exit_to_overworld_2_switch
	bl SetMainCallback2
	bl sub_812B484
_08047684:
	bl RunTasks
	bl sub_8002DE8
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	add sp, 0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080476A8: .4byte gUnknown_2037AB8
_080476AC: .4byte c2_exit_to_overworld_2_switch
	thumb_func_end sub_8047338

	thumb_func_start sub_80476B0
sub_80476B0: @ 80476B0
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x14
	ble _080476D0
	ldr r0, _080476CC @ =sub_8047708
	str r0, [r4, 0x1C]
	movs r0, 0
	strh r0, [r4, 0x2E]
	b _08047700
	.align 2, 0
_080476CC: .4byte sub_8047708
_080476D0:
	ldrh r0, [r4, 0x30]
	adds r0, 0x14
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x30]
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	movs r1, 0x1
	bl Sin
	strh r0, [r4, 0x24]
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0xF
	bne _08047700
	movs r0, 0x17
	bl sub_80722CC
	adds r0, r4, 0
	movs r1, 0x1
	bl StartSpriteAnim
	bl CreateRandomEggShardSprite
_08047700:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80476B0

	thumb_func_start sub_8047708
sub_8047708: @ 8047708
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x32]
	adds r0, 0x1
	movs r1, 0
	strh r0, [r4, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1E
	ble _08047764
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x14
	ble _08047738
	ldr r0, _08047734 @ =sub_804776C
	str r0, [r4, 0x1C]
	strh r1, [r4, 0x2E]
	strh r1, [r4, 0x32]
	b _08047764
	.align 2, 0
_08047734: .4byte sub_804776C
_08047738:
	ldrh r0, [r4, 0x30]
	adds r0, 0x14
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x30]
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	movs r1, 0x2
	bl Sin
	strh r0, [r4, 0x24]
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0xF
	bne _08047764
	movs r0, 0x17
	bl sub_80722CC
	adds r0, r4, 0
	movs r1, 0x2
	bl StartSpriteAnim
_08047764:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8047708

	thumb_func_start sub_804776C
sub_804776C: @ 804776C
	push {r4-r6,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x32]
	adds r0, 0x1
	movs r6, 0
	strh r0, [r4, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1E
	ble _08047826
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x26
	ble _080477E4
	ldr r0, _080477D0 @ =SpriteCB_Egg_3
	str r0, [r4, 0x1C]
	strh r6, [r4, 0x2E]
	ldr r5, _080477D4 @ =gUnknown_3000E74
	ldr r0, [r5]
	ldrb r1, [r0, 0x4]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080477D8 @ =gUnknown_2024284
	adds r0, r1
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	ldr r4, _080477DC @ =gUnknown_202063C
	ldr r3, [r5]
	ldrb r2, [r3, 0x1]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r4
	strh r6, [r1, 0x24]
	ldrb r2, [r3, 0x1]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r4
	ldr r2, _080477E0 @ =gUnknown_82349CC
	lsrs r0, 14
	adds r0, r2
	ldrb r0, [r0, 0x1]
	strh r0, [r1, 0x26]
	b _08047826
	.align 2, 0
_080477D0: .4byte SpriteCB_Egg_3
_080477D4: .4byte gUnknown_3000E74
_080477D8: .4byte gUnknown_2024284
_080477DC: .4byte gUnknown_202063C
_080477E0: .4byte gUnknown_82349CC
_080477E4:
	ldrh r0, [r4, 0x30]
	adds r0, 0x14
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x30]
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	movs r1, 0x2
	bl Sin
	strh r0, [r4, 0x24]
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0xF
	bne _08047818
	movs r0, 0x17
	bl sub_80722CC
	adds r0, r4, 0
	movs r1, 0x2
	bl StartSpriteAnim
	bl CreateRandomEggShardSprite
	bl CreateRandomEggShardSprite
_08047818:
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0x1E
	bne _08047826
	movs r0, 0x17
	bl sub_80722CC
_08047826:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_804776C

	thumb_func_start SpriteCB_Egg_3
SpriteCB_Egg_3: @ 804782C
	push {lr}
	adds r1, r0, 0
	ldrh r0, [r1, 0x2E]
	adds r0, 0x1
	strh r0, [r1, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x32
	ble _08047846
	ldr r0, _0804784C @ =SpriteCB_Egg_4
	str r0, [r1, 0x1C]
	movs r0, 0
	strh r0, [r1, 0x2E]
_08047846:
	pop {r0}
	bx r0
	.align 2, 0
_0804784C: .4byte SpriteCB_Egg_4
	thumb_func_end SpriteCB_Egg_3

	thumb_func_start SpriteCB_Egg_4
SpriteCB_Egg_4: @ 8047850
	push {r4,r5,lr}
	sub sp, 0x4
	adds r5, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _08047870
	movs r1, 0x1
	negs r1, r1
	ldr r0, _080478C4 @ =0x0000ffff
	str r0, [sp]
	adds r0, r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
_08047870:
	ldrh r0, [r5, 0x2E]
	cmp r0, 0x3
	bhi _0804788C
	movs r4, 0
_08047878:
	bl CreateRandomEggShardSprite
	lsls r0, r4, 16
	movs r1, 0x80
	lsls r1, 9
	adds r0, r1
	lsrs r4, r0, 16
	asrs r0, 16
	cmp r0, 0x3
	ble _08047878
_0804788C:
	ldrh r0, [r5, 0x2E]
	adds r0, 0x1
	strh r0, [r5, 0x2E]
	ldr r0, _080478C8 @ =gUnknown_2037AB8
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _080478BA
	movs r0, 0x6A
	bl sub_80722CC
	adds r2, r5, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _080478CC @ =SpriteCB_Egg_5
	str r0, [r5, 0x1C]
	strh r4, [r5, 0x2E]
_080478BA:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080478C4: .4byte 0x0000ffff
_080478C8: .4byte gUnknown_2037AB8
_080478CC: .4byte SpriteCB_Egg_5
	thumb_func_end SpriteCB_Egg_4

	thumb_func_start SpriteCB_Egg_5
SpriteCB_Egg_5: @ 80478D0
	push {r4,r5,lr}
	sub sp, 0x4
	adds r5, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _0804790C
	ldr r4, _08047960 @ =gUnknown_202063C
	ldr r3, _08047964 @ =gUnknown_3000E74
	ldr r0, [r3]
	ldrb r1, [r0, 0x1]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	adds r0, 0x3E
	ldrb r2, [r0]
	movs r1, 0x5
	negs r1, r1
	ands r1, r2
	strb r1, [r0]
	ldr r0, [r3]
	ldrb r1, [r0, 0x1]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0x1
	bl StartSpriteAffineAnim
_0804790C:
	movs r2, 0x2E
	ldrsh r0, [r5, r2]
	cmp r0, 0x8
	bne _08047926
	movs r1, 0x1
	negs r1, r1
	ldr r0, _08047968 @ =0x0000ffff
	str r0, [sp]
	adds r0, r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
_08047926:
	movs r1, 0x2E
	ldrsh r0, [r5, r1]
	cmp r0, 0x9
	bgt _08047944
	ldr r2, _08047960 @ =gUnknown_202063C
	ldr r0, _08047964 @ =gUnknown_3000E74
	ldr r0, [r0]
	ldrb r1, [r0, 0x1]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r0, 0x22]
	subs r1, 0x1
	strh r1, [r0, 0x22]
_08047944:
	ldrh r1, [r5, 0x2E]
	movs r2, 0x2E
	ldrsh r0, [r5, r2]
	cmp r0, 0x28
	ble _08047952
	ldr r0, _0804796C @ =nullsub_8
	str r0, [r5, 0x1C]
_08047952:
	adds r0, r1, 0x1
	strh r0, [r5, 0x2E]
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08047960: .4byte gUnknown_202063C
_08047964: .4byte gUnknown_3000E74
_08047968: .4byte 0x0000ffff
_0804796C: .4byte nullsub_8
	thumb_func_end SpriteCB_Egg_5

	thumb_func_start SpriteCB_EggShard
SpriteCB_EggShard: @ 8047970
	push {r4,lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x30]
	ldrh r1, [r2, 0x36]
	adds r0, r1
	strh r0, [r2, 0x36]
	ldrh r1, [r2, 0x32]
	ldrh r3, [r2, 0x38]
	adds r0, r1, r3
	strh r0, [r2, 0x38]
	movs r4, 0x36
	ldrsh r0, [r2, r4]
	cmp r0, 0
	bge _0804798E
	adds r0, 0xFF
_0804798E:
	asrs r0, 8
	strh r0, [r2, 0x24]
	movs r3, 0x38
	ldrsh r0, [r2, r3]
	cmp r0, 0
	bge _0804799C
	adds r0, 0xFF
_0804799C:
	asrs r0, 8
	strh r0, [r2, 0x26]
	ldrh r0, [r2, 0x34]
	adds r3, r1, r0
	strh r3, [r2, 0x32]
	movs r4, 0x22
	ldrsh r1, [r2, r4]
	movs r4, 0x26
	ldrsh r0, [r2, r4]
	adds r0, r1, r0
	adds r1, 0x14
	cmp r0, r1
	ble _080479C2
	lsls r0, r3, 16
	cmp r0, 0
	ble _080479C2
	adds r0, r2, 0
	bl DestroySprite
_080479C2:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end SpriteCB_EggShard

	thumb_func_start CreateRandomEggShardSprite
CreateRandomEggShardSprite: @ 80479C8
	push {r4-r6,lr}
	sub sp, 0x8
	ldr r2, _08047A14 @ =gUnknown_82601BC
	ldr r0, _08047A18 @ =gUnknown_3000E74
	ldr r6, [r0]
	ldrb r3, [r6, 0x7]
	lsls r0, r3, 2
	adds r1, r0, r2
	ldrh r5, [r1]
	adds r2, 0x2
	adds r0, r2
	ldrh r4, [r0]
	adds r3, 0x1
	strb r3, [r6, 0x7]
	bl Random
	lsls r0, 16
	movs r1, 0xC0
	lsls r1, 10
	ands r1, r0
	lsls r5, 16
	asrs r5, 16
	lsls r4, 16
	asrs r4, 16
	movs r0, 0x64
	str r0, [sp]
	lsrs r1, 16
	str r1, [sp, 0x4]
	movs r0, 0x78
	movs r1, 0x3C
	adds r2, r5, 0
	adds r3, r4, 0
	bl CreateEggShardSprite
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08047A14: .4byte gUnknown_82601BC
_08047A18: .4byte gUnknown_3000E74
	thumb_func_end CreateRandomEggShardSprite

	thumb_func_start CreateEggShardSprite
CreateEggShardSprite: @ 8047A1C
	push {r4-r6,lr}
	mov r6, r10
	mov r5, r9
	mov r4, r8
	push {r4-r6}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r6, r2, 0
	mov r8, r3
	ldr r0, [sp, 0x1C]
	mov r9, r0
	ldr r1, [sp, 0x20]
	mov r10, r1
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	lsrs r5, 24
	lsls r6, 16
	lsrs r6, 16
	mov r0, r8
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	mov r1, r9
	lsls r1, 16
	lsrs r1, 16
	mov r9, r1
	mov r0, r10
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	ldr r0, _08047A94 @ =gUnknown_8260184
	adds r1, r4, 0
	adds r2, r5, 0
	movs r3, 0x4
	bl CreateSprite
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r2, _08047A98 @ =gUnknown_202063C
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	strh r6, [r0, 0x30]
	mov r1, r8
	strh r1, [r0, 0x32]
	mov r1, r9
	strh r1, [r0, 0x34]
	mov r1, r10
	bl StartSpriteAnim
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08047A94: .4byte gUnknown_8260184
_08047A98: .4byte gUnknown_202063C
	thumb_func_end CreateEggShardSprite

	thumb_func_start sub_8047A9C
sub_8047A9C: @ 8047A9C
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0x18
	adds r5, r0, 0
	mov r8, r1
	adds r6, r2, 0
	ldr r4, [sp, 0x2C]
	lsls r5, 24
	lsrs r5, 24
	lsls r6, 24
	lsrs r6, 24
	lsls r3, 24
	lsrs r3, 24
	lsls r4, 24
	lsrs r4, 24
	adds r0, r5, 0
	movs r1, 0xFF
	str r3, [sp, 0x14]
	bl FillWindowPixelBuffer
	ldr r2, _08047B08 @ =gUnknown_3000E74
	ldr r1, [r2]
	movs r0, 0
	strb r0, [r1, 0xE]
	ldr r1, [r2]
	movs r0, 0x5
	strb r0, [r1, 0xF]
	ldr r1, [r2]
	movs r0, 0x6
	strb r0, [r1, 0x10]
	movs r0, 0x1
	str r0, [sp]
	str r0, [sp, 0x4]
	ldr r0, [r2]
	adds r0, 0xE
	str r0, [sp, 0x8]
	lsls r4, 24
	asrs r4, 24
	str r4, [sp, 0xC]
	mov r0, r8
	str r0, [sp, 0x10]
	adds r0, r5, 0
	movs r1, 0x3
	adds r2, r6, 0
	ldr r3, [sp, 0x14]
	bl sub_812E5A4
	add sp, 0x18
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08047B08: .4byte gUnknown_3000E74
	thumb_func_end sub_8047A9C

	.align 2, 0 @ Don't pad with nop.
