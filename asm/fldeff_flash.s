	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_80C9B2C
sub_80C9B2C: @ 80C9B2C
	push {lr}
	ldr r0, _080C9B54 @ =gMapHeader
	ldrb r0, [r0, 0x15]
	cmp r0, 0x1
	bne _080C9B6C
	ldr r0, _080C9B58 @ =0x00000806
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	bne _080C9B6C
	ldr r1, _080C9B5C @ =gFieldCallback2
	ldr r0, _080C9B60 @ =FieldCallback_PrepareFadeInFromMenu
	str r0, [r1]
	ldr r1, _080C9B64 @ =gPostMenuFieldCallback
	ldr r0, _080C9B68 @ =sub_80C9B74
	str r0, [r1]
	movs r0, 0x1
	b _080C9B6E
	.align 2, 0
_080C9B54: .4byte gMapHeader
_080C9B58: .4byte 0x00000806
_080C9B5C: .4byte gFieldCallback2
_080C9B60: .4byte FieldCallback_PrepareFadeInFromMenu
_080C9B64: .4byte gPostMenuFieldCallback
_080C9B68: .4byte sub_80C9B74
_080C9B6C:
	movs r0, 0
_080C9B6E:
	pop {r1}
	bx r1
	thumb_func_end sub_80C9B2C

	thumb_func_start sub_80C9B74
sub_80C9B74: @ 80C9B74
	push {r4,lr}
	bl oei_task_add
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl GetCursorSelectionMonId
	ldr r1, _080C9BA4 @ =gFieldEffectArguments
	lsls r0, 24
	lsrs r0, 24
	str r0, [r1]
	ldr r1, _080C9BA8 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r2, _080C9BAC @ =sub_80C9BB0
	lsrs r1, r2, 16
	strh r1, [r0, 0x18]
	strh r2, [r0, 0x1A]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C9BA4: .4byte gFieldEffectArguments
_080C9BA8: .4byte gTasks
_080C9BAC: .4byte sub_80C9BB0
	thumb_func_end sub_80C9B74

	thumb_func_start sub_80C9BB0
sub_80C9BB0: @ 80C9BB0
	push {lr}
	movs r0, 0xC8
	bl PlaySE
	ldr r0, _080C9BC8 @ =0x00000806
	bl FlagSet
	ldr r0, _080C9BCC @ =gUnknown_81BFB5F
	bl ScriptContext1_SetupScript
	pop {r0}
	bx r0
	.align 2, 0
_080C9BC8: .4byte 0x00000806
_080C9BCC: .4byte gUnknown_81BFB5F
	thumb_func_end sub_80C9BB0

	thumb_func_start sub_80C9BD0
sub_80C9BD0: @ 80C9BD0
	push {lr}
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	thumb_func_end sub_80C9BD0

	thumb_func_start sub_80C9BE8
sub_80C9BE8: @ 80C9BE8
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	thumb_func_end sub_80C9BE8

	thumb_func_start sub_80C9BFC
sub_80C9BFC: @ 80C9BFC
	push {lr}
	sub sp, 0x8
	movs r0, 0
	bl SetVBlankCallback
	movs r0, 0
	movs r1, 0
	bl SetGpuReg
	movs r0, 0xC
	movs r1, 0
	bl SetGpuReg
	movs r0, 0xA
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x8
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x18
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x1A
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x14
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x16
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x10
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x12
	movs r1, 0
	bl SetGpuReg
	mov r1, sp
	movs r0, 0
	strh r0, [r1]
	ldr r1, _080C9CC8 @ =0x040000d4
	mov r0, sp
	str r0, [r1]
	movs r0, 0xC0
	lsls r0, 19
	str r0, [r1, 0x4]
	ldr r0, _080C9CCC @ =0x8100c000
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	movs r2, 0
	str r2, [sp, 0x4]
	add r0, sp, 0x4
	str r0, [r1]
	movs r0, 0xE0
	lsls r0, 19
	str r0, [r1, 0x4]
	ldr r0, _080C9CD0 @ =0x85000100
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	mov r0, sp
	strh r2, [r0]
	str r0, [r1]
	ldr r0, _080C9CD4 @ =0x05000002
	str r0, [r1, 0x4]
	ldr r0, _080C9CD8 @ =0x810001ff
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	bl ResetPaletteFade
	bl ResetTasks
	bl ResetSpriteData
	movs r0, 0x1
	bl EnableInterrupts
	ldr r0, _080C9CDC @ =sub_80C9BE8
	bl SetVBlankCallback
	ldr r0, _080C9CE0 @ =sub_80C9BD0
	bl SetMainCallback2
	bl sub_80C9CE8
	lsls r0, 24
	cmp r0, 0
	bne _080C9CC2
	ldr r0, _080C9CE4 @ =gMain
	ldr r0, [r0, 0x8]
	bl SetMainCallback2
_080C9CC2:
	add sp, 0x8
	pop {r0}
	bx r0
	.align 2, 0
_080C9CC8: .4byte 0x040000d4
_080C9CCC: .4byte 0x8100c000
_080C9CD0: .4byte 0x85000100
_080C9CD4: .4byte 0x05000002
_080C9CD8: .4byte 0x810001ff
_080C9CDC: .4byte sub_80C9BE8
_080C9CE0: .4byte sub_80C9BD0
_080C9CE4: .4byte gMain
	thumb_func_end sub_80C9BFC

	thumb_func_start sub_80C9CE8
sub_80C9CE8: @ 80C9CE8
	push {r4-r7,lr}
	bl get_map_light_from_warp0
	lsls r0, 24
	lsrs r7, r0, 24
	bl sav1_map_get_light_level
	lsls r0, 24
	lsrs r6, r0, 24
	movs r4, 0
	bl sub_80561B4
	ldr r5, _080C9D24 @ =gMapHeader
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r5, 0x14]
	cmp r0, r1
	beq _080C9D36
	ldrb r0, [r5, 0x14]
	movs r1, 0
	bl sub_80F8154
	cmp r0, 0x1
	bne _080C9D36
	ldrb r0, [r5, 0x14]
	bl sub_80CA160
	movs r0, 0x1
	b _080C9D70
	.align 2, 0
_080C9D24: .4byte gMapHeader
_080C9D28:
	adds r0, r3, 0x4
	adds r0, r2, r0
	ldr r0, [r0]
	bl _call_via_r0
	movs r0, 0x1
	b _080C9D70
_080C9D36:
	ldr r5, _080C9D78 @ =gUnknown_83F5738
	lsls r1, r4, 1
	adds r0, r1, r4
	lsls r0, 2
	adds r0, r5
	ldrb r0, [r0]
	cmp r0, 0
	beq _080C9D6E
	adds r3, r5, 0
_080C9D48:
	adds r0, r1, r4
	lsls r2, r0, 2
	adds r1, r2, r3
	ldrb r0, [r1]
	cmp r0, r7
	bne _080C9D5A
	ldrb r0, [r1, 0x1]
	cmp r0, r6
	beq _080C9D28
_080C9D5A:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, r4, 1
	adds r0, r1, r4
	lsls r0, 2
	adds r0, r5
	ldrb r0, [r0]
	cmp r0, 0
	bne _080C9D48
_080C9D6E:
	movs r0, 0
_080C9D70:
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080C9D78: .4byte gUnknown_83F5738
	thumb_func_end sub_80C9CE8

	thumb_func_start sub_80C9D7C
sub_80C9D7C: @ 80C9D7C
	push {r4-r6,lr}
	lsls r0, 24
	lsls r1, 24
	lsrs r5, r0, 24
	lsrs r4, r1, 24
	movs r3, 0
	ldr r1, _080C9DAC @ =gUnknown_83F5738
	ldrb r0, [r1]
	cmp r0, 0
	beq _080C9DC4
	adds r6, r1, 0
_080C9D92:
	lsls r0, r3, 1
	adds r0, r3
	lsls r0, 2
	adds r2, r0, r6
	ldrb r0, [r2]
	cmp r0, r5
	bne _080C9DB0
	ldrb r0, [r2, 0x1]
	cmp r0, r4
	bne _080C9DB0
	ldrb r0, [r2, 0x2]
	b _080C9DC6
	.align 2, 0
_080C9DAC: .4byte gUnknown_83F5738
_080C9DB0:
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	lsls r0, r3, 1
	adds r0, r3
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _080C9D92
_080C9DC4:
	movs r0, 0
_080C9DC6:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80C9D7C

	thumb_func_start sub_80C9DCC
sub_80C9DCC: @ 80C9DCC
	push {r4-r6,lr}
	lsls r0, 24
	lsls r1, 24
	lsrs r5, r0, 24
	lsrs r4, r1, 24
	movs r3, 0
	ldr r1, _080C9DFC @ =gUnknown_83F5738
	ldrb r0, [r1]
	cmp r0, 0
	beq _080C9E14
	adds r6, r1, 0
_080C9DE2:
	lsls r0, r3, 1
	adds r0, r3
	lsls r0, 2
	adds r2, r0, r6
	ldrb r0, [r2]
	cmp r0, r5
	bne _080C9E00
	ldrb r0, [r2, 0x1]
	cmp r0, r4
	bne _080C9E00
	ldrb r0, [r2, 0x3]
	b _080C9E16
	.align 2, 0
_080C9DFC: .4byte gUnknown_83F5738
_080C9E00:
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	lsls r0, r3, 1
	adds r0, r3
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _080C9DE2
_080C9E14:
	movs r0, 0
_080C9E16:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80C9DCC

	thumb_func_start sub_80C9E1C
sub_80C9E1C: @ 80C9E1C
	push {lr}
	ldr r0, _080C9E2C @ =sub_80C9E30
	movs r1, 0
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_080C9E2C: .4byte sub_80C9E30
	thumb_func_end sub_80C9E1C

	thumb_func_start sub_80C9E30
sub_80C9E30: @ 80C9E30
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080C9E44 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r0, _080C9E48 @ =sub_80C9E4C
	str r0, [r1]
	bx lr
	.align 2, 0
_080C9E44: .4byte gTasks
_080C9E48: .4byte sub_80C9E4C
	thumb_func_end sub_80C9E30

	thumb_func_start sub_80C9E4C
sub_80C9E4C: @ 80C9E4C
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0
	movs r1, 0
	bl SetGpuReg
	ldr r0, _080C9EC8 @ =gUnknown_83F5A44
	ldr r1, _080C9ECC @ =0x0600c000
	bl LZ77UnCompVram
	ldr r0, _080C9ED0 @ =gUnknown_83F5864
	ldr r1, _080C9ED4 @ =0x0600f800
	bl LZ77UnCompVram
	ldr r0, _080C9ED8 @ =gUnknown_83F5804
	movs r1, 0xE0
	movs r2, 0x20
	bl LoadPalette
	ldr r0, _080C9EDC @ =gUnknown_83F5854
	movs r1, 0xE0
	movs r2, 0x10
	bl LoadPalette
	ldr r1, _080C9EE0 @ =0x00003e41
	movs r0, 0x50
	bl SetGpuReg
	movs r0, 0x52
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x54
	movs r1, 0
	bl SetGpuReg
	ldr r1, _080C9EE4 @ =0x00001f0c
	movs r0, 0x8
	bl SetGpuReg
	movs r1, 0x8A
	lsls r1, 5
	movs r0, 0
	bl SetGpuReg
	ldr r1, _080C9EE8 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _080C9EEC @ =sub_80C9EF0
	str r1, [r0]
	movs r2, 0
	movs r1, 0x10
	strh r1, [r0, 0x8]
	strh r2, [r0, 0xA]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C9EC8: .4byte gUnknown_83F5A44
_080C9ECC: .4byte 0x0600c000
_080C9ED0: .4byte gUnknown_83F5864
_080C9ED4: .4byte 0x0600f800
_080C9ED8: .4byte gUnknown_83F5804
_080C9EDC: .4byte gUnknown_83F5854
_080C9EE0: .4byte 0x00003e41
_080C9EE4: .4byte 0x00001f0c
_080C9EE8: .4byte gTasks
_080C9EEC: .4byte sub_80C9EF0
	thumb_func_end sub_80C9E4C

	thumb_func_start sub_80C9EF0
sub_80C9EF0: @ 80C9EF0
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080C9F20 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r5, r1, r2
	ldrh r4, [r5, 0xA]
	movs r0, 0x80
	lsls r0, 5
	adds r1, r4, r0
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x52
	bl SetGpuReg
	cmp r4, 0x10
	bhi _080C9F24
	ldrh r0, [r5, 0xA]
	adds r0, 0x1
	strh r0, [r5, 0xA]
	b _080C9F2C
	.align 2, 0
_080C9F20: .4byte gTasks
_080C9F24:
	movs r0, 0
	strh r0, [r5, 0xC]
	ldr r0, _080C9F34 @ =sub_80C9F38
	str r0, [r5]
_080C9F2C:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C9F34: .4byte sub_80C9F38
	thumb_func_end sub_80C9EF0

	thumb_func_start sub_80C9F38
sub_80C9F38: @ 80C9F38
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r1, _080C9F74 @ =0x00001010
	movs r0, 0x52
	bl SetGpuReg
	ldr r1, _080C9F78 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r4, r0, r1
	ldrh r1, [r4, 0xC]
	cmp r1, 0x7
	bhi _080C9F80
	adds r0, r1, 0x1
	strh r0, [r4, 0xC]
	lsls r1, 1
	ldr r0, _080C9F7C @ =gUnknown_83F5854
	adds r0, r1, r0
	movs r2, 0x10
	subs r2, r1
	lsls r2, 16
	lsrs r2, 16
	movs r1, 0xE0
	bl LoadPalette
	b _080C9F92
	.align 2, 0
_080C9F74: .4byte 0x00001010
_080C9F78: .4byte gTasks
_080C9F7C: .4byte gUnknown_83F5854
_080C9F80:
	ldr r0, _080C9F98 @ =gUnknown_83F5804
	movs r1, 0
	movs r2, 0x20
	bl LoadPalette
	ldr r0, _080C9F9C @ =sub_80C9FA0
	str r0, [r4]
	movs r0, 0x8
	strh r0, [r4, 0xC]
_080C9F92:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C9F98: .4byte gUnknown_83F5804
_080C9F9C: .4byte sub_80C9FA0
	thumb_func_end sub_80C9F38

	thumb_func_start sub_80C9FA0
sub_80C9FA0: @ 80C9FA0
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080C9FC0 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldrh r2, [r1, 0xC]
	movs r3, 0xC
	ldrsh r0, [r1, r3]
	cmp r0, 0
	beq _080C9FC4
	subs r0, r2, 0x1
	strh r0, [r1, 0xC]
	b _080C9FCC
	.align 2, 0
_080C9FC0: .4byte gTasks
_080C9FC4:
	ldr r0, _080C9FD0 @ =gMain
	ldr r0, [r0, 0x8]
	bl SetMainCallback2
_080C9FCC:
	pop {r0}
	bx r0
	.align 2, 0
_080C9FD0: .4byte gMain
	thumb_func_end sub_80C9FA0

	thumb_func_start sub_80C9FD4
sub_80C9FD4: @ 80C9FD4
	push {lr}
	ldr r0, _080C9FE4 @ =sub_80C9FE8
	movs r1, 0
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_080C9FE4: .4byte sub_80C9FE8
	thumb_func_end sub_80C9FD4

	thumb_func_start sub_80C9FE8
sub_80C9FE8: @ 80C9FE8
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080C9FFC @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r0, _080CA000 @ =sub_80CA004
	str r0, [r1]
	bx lr
	.align 2, 0
_080C9FFC: .4byte gTasks
_080CA000: .4byte sub_80CA004
	thumb_func_end sub_80C9FE8

	thumb_func_start sub_80CA004
sub_80CA004: @ 80CA004
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0
	movs r1, 0
	bl SetGpuReg
	ldr r0, _080CA080 @ =gUnknown_83F5A44
	ldr r1, _080CA084 @ =0x0600c000
	bl LZ77UnCompVram
	ldr r0, _080CA088 @ =gUnknown_83F5864
	ldr r1, _080CA08C @ =0x0600f800
	bl LZ77UnCompVram
	movs r0, 0x50
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x52
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x54
	movs r1, 0
	bl SetGpuReg
	ldr r1, _080CA090 @ =0x00001f0c
	movs r0, 0x8
	bl SetGpuReg
	movs r1, 0x8A
	lsls r1, 5
	movs r0, 0
	bl SetGpuReg
	ldr r0, _080CA094 @ =gUnknown_83F5804
	movs r1, 0xE0
	movs r2, 0x20
	bl LoadPalette
	ldr r0, _080CA098 @ =gUnknown_83F5824
	movs r1, 0
	movs r2, 0x20
	bl LoadPalette
	ldr r1, _080CA09C @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _080CA0A0 @ =sub_80CA0A4
	str r1, [r0]
	movs r2, 0
	movs r1, 0x10
	strh r1, [r0, 0x8]
	strh r2, [r0, 0xA]
	strh r2, [r0, 0xC]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CA080: .4byte gUnknown_83F5A44
_080CA084: .4byte 0x0600c000
_080CA088: .4byte gUnknown_83F5864
_080CA08C: .4byte 0x0600f800
_080CA090: .4byte 0x00001f0c
_080CA094: .4byte gUnknown_83F5804
_080CA098: .4byte gUnknown_83F5824
_080CA09C: .4byte gTasks
_080CA0A0: .4byte sub_80CA0A4
	thumb_func_end sub_80CA004

	thumb_func_start sub_80CA0A4
sub_80CA0A4: @ 80CA0A4
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080CA0D8 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
	ldrh r1, [r4, 0xC]
	cmp r1, 0xF
	bhi _080CA0E0
	adds r2, r1, 0x1
	adds r0, r2, 0x1
	strh r0, [r4, 0xC]
	movs r0, 0xF
	subs r0, r1
	lsls r0, 1
	ldr r1, _080CA0DC @ =gUnknown_83F5844
	adds r0, r1
	lsls r2, 17
	lsrs r2, 16
	movs r1, 0xE0
	bl LoadPalette
	b _080CA0F4
	.align 2, 0
_080CA0D8: .4byte gTasks
_080CA0DC: .4byte gUnknown_83F5844
_080CA0E0:
	ldr r1, _080CA0FC @ =0x00001010
	movs r0, 0x52
	bl SetGpuReg
	ldr r1, _080CA100 @ =0x00003e41
	movs r0, 0x50
	bl SetGpuReg
	ldr r0, _080CA104 @ =sub_80CA108
	str r0, [r4]
_080CA0F4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CA0FC: .4byte 0x00001010
_080CA100: .4byte 0x00003e41
_080CA104: .4byte sub_80CA108
	thumb_func_end sub_80CA0A4

	thumb_func_start sub_80CA108
sub_80CA108: @ 80CA108
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080CA13C @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r5, r1, r2
	ldrh r0, [r5, 0xA]
	movs r1, 0x10
	subs r1, r0
	lsls r1, 16
	lsrs r4, r1, 16
	movs r0, 0x80
	lsls r0, 21
	adds r1, r0
	lsrs r1, 16
	movs r0, 0x52
	bl SetGpuReg
	cmp r4, 0
	beq _080CA140
	ldrh r0, [r5, 0xA]
	adds r0, 0x1
	strh r0, [r5, 0xA]
	b _080CA152
	.align 2, 0
_080CA13C: .4byte gTasks
_080CA140:
	ldr r0, _080CA158 @ =gUnknown_83F5824
	movs r1, 0
	movs r2, 0x20
	bl LoadPalette
	ldr r0, _080CA15C @ =gMain
	ldr r0, [r0, 0x8]
	bl SetMainCallback2
_080CA152:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CA158: .4byte gUnknown_83F5824
_080CA15C: .4byte gMain
	thumb_func_end sub_80CA108

	thumb_func_start sub_80CA160
sub_80CA160: @ 80CA160
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _080CA188 @ =sub_80CA190
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080CA18C @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r4, [r1, 0xE]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CA188: .4byte sub_80CA190
_080CA18C: .4byte gTasks
	thumb_func_end sub_80CA160

	thumb_func_start sub_80CA190
sub_80CA190: @ 80CA190
	push {r4-r6,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _080CA1B8 @ =gTasks+0x8
	adds r4, r0, r1
	movs r1, 0
	ldrsh r0, [r4, r1]
	cmp r0, 0x5
	bls _080CA1AC
	b _080CA2D2
_080CA1AC:
	lsls r0, 2
	ldr r1, _080CA1BC @ =_080CA1C0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080CA1B8: .4byte gTasks+0x8
_080CA1BC: .4byte _080CA1C0
	.align 2, 0
_080CA1C0:
	.4byte _080CA1D8
	.4byte _080CA208
	.4byte _080CA224
	.4byte _080CA24E
	.4byte _080CA262
	.4byte _080CA2A4
_080CA1D8:
	ldr r0, _080CA204 @ =gMain
	ldr r2, [r0, 0xC]
	adds r0, r5, 0
	movs r1, 0x5
	bl SetWordTaskArg
	movs r0, 0
	bl SetVBlankCallback
	bl sub_80F8180
	ldrb r0, [r4, 0x6]
	bl sub_80F819C
	movs r0, 0x1
	negs r0, r0
	movs r1, 0x10
	movs r2, 0
	bl BlendPalettes
	b _080CA294
	.align 2, 0
_080CA204: .4byte gMain
_080CA208:
	bl sub_80F8258
	cmp r0, 0
	bne _080CA2D2
	ldrb r0, [r4, 0x6]
	bl sub_80F8318
	strh r0, [r4, 0x8]
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x3
	bl CopyWindowToVram
	b _080CA294
_080CA224:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	bne _080CA2D2
	movs r1, 0x1
	negs r1, r1
	str r0, [sp]
	adds r0, r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	adds r0, r5, 0
	movs r1, 0x5
	bl GetWordTaskArg
	bl SetVBlankCallback
	b _080CA294
_080CA24E:
	bl UpdatePaletteFade
	lsls r0, 24
	cmp r0, 0
	bne _080CA2D2
	ldrb r0, [r4, 0x6]
	bl sub_80F856C
	strh r0, [r4, 0x4]
	b _080CA294
_080CA262:
	ldrh r0, [r4, 0x2]
	adds r0, 0x1
	strh r0, [r4, 0x2]
	lsls r0, 16
	asrs r0, 16
	movs r2, 0x4
	ldrsh r1, [r4, r2]
	cmp r0, r1
	bgt _080CA280
	ldr r0, _080CA29C @ =gMain
	ldrh r1, [r0, 0x2C]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080CA2D2
_080CA280:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0x2
	negs r1, r1
	ldr r2, _080CA2A0 @ =0x00007fff
	str r2, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
_080CA294:
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	b _080CA2D2
	.align 2, 0
_080CA29C: .4byte gMain
_080CA2A0: .4byte 0x00007fff
_080CA2A4:
	bl UpdatePaletteFade
	lsls r0, 24
	cmp r0, 0
	bne _080CA2D2
	lsls r6, r5, 2
	movs r1, 0
	adds r0, r4, 0
	adds r0, 0x1E
_080CA2B6:
	strh r1, [r0]
	subs r0, 0x2
	cmp r0, r4
	bge _080CA2B6
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	bl sub_80F8234
	ldr r1, _080CA2DC @ =gTasks
	adds r0, r6, r5
	lsls r0, 3
	adds r0, r1
	ldr r1, _080CA2E0 @ =sub_80CA004
	str r1, [r0]
_080CA2D2:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080CA2DC: .4byte gTasks
_080CA2E0: .4byte sub_80CA004
	thumb_func_end sub_80CA190

	.align 2, 0 @ Don't pad with nop.
