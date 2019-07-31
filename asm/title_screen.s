	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_80792C8
sub_80792C8: @ 80792C8
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _080792EC @ =gTasks+0x8
	adds r4, r0, r1
	movs r1, 0
	ldrsh r0, [r4, r1]
	cmp r0, 0x5
	bls _080792E2
	b _08079414
_080792E2:
	lsls r0, 2
	ldr r1, _080792F0 @ =_080792F4
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080792EC: .4byte gTasks+0x8
_080792F0: .4byte _080792F4
	.align 2, 0
_080792F4:
	.4byte _0807930C
	.4byte _08079344
	.4byte _08079368
	.4byte _0807937C
	.4byte _080793BC
	.4byte _08079404
_0807930C:
	movs r1, 0x80
	lsls r1, 6
	movs r0, 0
	bl SetGpuRegBits
	movs r0, 0x48
	movs r1, 0x3F
	bl SetGpuReg
	movs r0, 0x4A
	movs r1, 0x37
	bl SetGpuReg
	movs r0, 0x44
	movs r1, 0xA0
	bl SetGpuReg
	movs r0, 0x40
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x80
	lsls r0, 7
	movs r1, 0
	movs r2, 0
	bl BlendPalettes
	b _080793AA
_08079344:
	movs r1, 0xC0
	lsls r1, 1
	adds r0, r1, 0
	ldrh r1, [r4, 0x2]
	adds r0, r1
	strh r0, [r4, 0x2]
	lsls r0, 16
	asrs r0, 20
	strh r0, [r4, 0x4]
	cmp r0, 0xEF
	ble _08079364
	movs r0, 0xF0
	strh r0, [r4, 0x4]
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
_08079364:
	ldrh r1, [r4, 0x4]
	b _080793F6
_08079368:
	ldrh r0, [r4, 0x6]
	adds r0, 0x1
	strh r0, [r4, 0x6]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x9
	ble _08079414
	movs r0, 0
	strh r0, [r4, 0x6]
	b _080793AA
_0807937C:
	movs r0, 0x4A
	movs r1, 0x3B
	bl SetGpuReg
	ldr r1, _080793B4 @ =0x0000f0f0
	movs r0, 0x40
	bl SetGpuReg
	ldr r1, _080793B8 @ =0xffff1000
	movs r0, 0x2
	movs r2, 0
	bl ChangeBgX
	movs r0, 0x80
	lsls r0, 8
	movs r1, 0
	movs r2, 0
	bl BlendPalettes
	movs r1, 0xF0
	lsls r1, 4
	adds r0, r1, 0
	strh r0, [r4, 0x2]
_080793AA:
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	b _08079414
	.align 2, 0
_080793B4: .4byte 0x0000f0f0
_080793B8: .4byte 0xffff1000
_080793BC:
	ldr r1, _08079400 @ =0xfffffe80
	adds r0, r1, 0
	ldrh r1, [r4, 0x2]
	adds r0, r1
	strh r0, [r4, 0x2]
	lsls r0, 16
	asrs r0, 20
	strh r0, [r4, 0x4]
	cmp r0, 0
	bgt _080793DA
	movs r0, 0
	strh r0, [r4, 0x4]
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
_080793DA:
	movs r0, 0x4
	ldrsh r1, [r4, r0]
	negs r1, r1
	lsls r1, 8
	movs r0, 0x2
	movs r2, 0
	bl ChangeBgX
	ldrh r1, [r4, 0x4]
	lsls r1, 8
	movs r0, 0xF0
	orrs r1, r0
	lsls r1, 16
	lsrs r1, 16
_080793F6:
	movs r0, 0x40
	bl SetGpuReg
	b _08079414
	.align 2, 0
_08079400: .4byte 0xfffffe80
_08079404:
	movs r1, 0x80
	lsls r1, 6
	movs r0, 0
	bl ClearGpuRegBits
	adds r0, r5, 0
	bl DestroyTask
_08079414:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80792C8

	thumb_func_start sub_807941C
sub_807941C: @ 807941C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r1, _08079460 @ =gTasks+0x8
	adds r5, r0, r1
	movs r1, 0x1E
	ldrsh r0, [r5, r1]
	cmp r0, 0
	beq _08079444
	ldr r0, _08079464 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08079444
	movs r0, 0x1
	strh r0, [r5, 0x1C]
_08079444:
	movs r3, 0x1C
	ldrsh r0, [r5, r3]
	cmp r0, 0
	beq _08079468
	ldr r0, _08079464 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08079468
	adds r0, r2, 0
	bl DestroyTask
	b _08079510
	.align 2, 0
_08079460: .4byte gTasks+0x8
_08079464: .4byte gPaletteFade
_08079468:
	movs r1, 0x2
	ldrsh r0, [r5, r1]
	ldrh r2, [r5, 0x2]
	cmp r0, 0
	bne _08079476
	movs r0, 0x3C
	b _08079478
_08079476:
	movs r0, 0x1E
_08079478:
	strh r0, [r5, 0x4]
	ldrh r0, [r5]
	adds r0, 0x1
	strh r0, [r5]
	lsls r0, 16
	asrs r0, 16
	movs r3, 0x4
	ldrsh r1, [r5, r3]
	cmp r0, r1
	blt _08079510
	movs r0, 0
	strh r0, [r5]
	movs r0, 0x1
	eors r0, r2
	strh r0, [r5, 0x2]
	lsls r0, 16
	cmp r0, 0
	beq _080794CC
	ldr r2, _080794C0 @ =gPlttBufferUnfaded
	ldr r4, _080794C4 @ =gUnknown_8EAE094
	ldr r1, _080794C8 @ =gPlttBufferFaded
	movs r0, 0xF1
	lsls r0, 1
	adds r1, r0
	adds r2, r0
	movs r3, 0x4
_080794AC:
	ldrh r0, [r4, 0xC]
	strh r0, [r2]
	ldrh r0, [r4, 0xC]
	strh r0, [r1]
	adds r1, 0x2
	adds r2, 0x2
	subs r3, 0x1
	cmp r3, 0
	bge _080794AC
	b _080794F2
	.align 2, 0
_080794C0: .4byte gPlttBufferUnfaded
_080794C4: .4byte gUnknown_8EAE094
_080794C8: .4byte gPlttBufferFaded
_080794CC:
	movs r3, 0
	ldr r2, _08079518 @ =gPlttBufferUnfaded
	ldr r0, _0807951C @ =gUnknown_8EAE094
	ldr r1, _08079520 @ =gPlttBufferFaded
	adds r4, r0, 0x2
	movs r0, 0xF1
	lsls r0, 1
	adds r1, r0
	adds r2, r0
_080794DE:
	ldrh r0, [r4]
	strh r0, [r2]
	ldrh r0, [r4]
	strh r0, [r1]
	adds r4, 0x2
	adds r1, 0x2
	adds r2, 0x2
	adds r3, 0x1
	cmp r3, 0x4
	ble _080794DE
_080794F2:
	movs r1, 0x1C
	ldrsh r0, [r5, r1]
	cmp r0, 0
	beq _08079510
	movs r0, 0x80
	lsls r0, 8
	ldr r2, _08079524 @ =gPaletteFade
	ldrh r1, [r2, 0x4]
	lsls r1, 21
	lsrs r1, 27
	ldrh r2, [r2, 0x6]
	lsls r2, 17
	lsrs r2, 17
	bl BlendPalettes
_08079510:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08079518: .4byte gPlttBufferUnfaded
_0807951C: .4byte gUnknown_8EAE094
_08079520: .4byte gPlttBufferFaded
_08079524: .4byte gPaletteFade
	thumb_func_end sub_807941C

	thumb_func_start sub_8079528
sub_8079528: @ 8079528
	push {lr}
	ldr r0, _08079548 @ =sub_807941C
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0807954C @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r0, 0x1
	strh r0, [r1, 0x26]
	pop {r0}
	bx r0
	.align 2, 0
_08079548: .4byte sub_807941C
_0807954C: .4byte gTasks
	thumb_func_end sub_8079528

	thumb_func_start sub_8079550
sub_8079550: @ 8079550
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r5, r0, 16
	asrs r4, r5, 16
	cmp r4, 0
	blt _08079574
	ldr r3, _08079618 @ =gScanlineEffectRegBuffers
	lsls r2, r4, 1
	ldr r0, _0807961C @ =gScanlineEffect
	ldrb r1, [r0, 0x14]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 7
	adds r2, r0
	adds r2, r3
	movs r0, 0x10
	strh r0, [r2]
_08079574:
	movs r3, 0
	mov r8, r5
	adds r6, r4, 0
	ldr r0, _08079618 @ =gScanlineEffectRegBuffers
	mov r12, r0
	ldr r7, _0807961C @ =gScanlineEffect
	movs r5, 0xF
	lsls r2, r6, 1
	adds r4, r2, 0
_08079586:
	adds r0, r6, r3
	cmp r0, 0
	blt _0807959A
	ldrb r1, [r7, 0x14]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 7
	adds r0, r4, r0
	add r0, r12
	strh r5, [r0]
_0807959A:
	subs r0, r6, r3
	cmp r0, 0
	blt _080795AE
	ldrb r1, [r7, 0x14]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 7
	adds r0, r2, r0
	add r0, r12
	strh r5, [r0]
_080795AE:
	subs r5, 0x1
	subs r2, 0x2
	adds r4, 0x2
	adds r3, 0x1
	cmp r3, 0xF
	ble _08079586
	mov r1, r8
	asrs r0, r1, 16
	adds r3, r0, 0
	adds r3, 0x10
	cmp r3, 0x9F
	bgt _080795E6
	ldr r6, _08079618 @ =gScanlineEffectRegBuffers
	ldr r5, _0807961C @ =gScanlineEffect
	movs r4, 0
_080795CC:
	cmp r3, 0
	blt _080795E0
	lsls r2, r3, 1
	ldrb r1, [r5, 0x14]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 7
	adds r2, r0
	adds r2, r6
	strh r4, [r2]
_080795E0:
	adds r3, 0x1
	cmp r3, 0x9F
	ble _080795CC
_080795E6:
	mov r1, r8
	asrs r0, r1, 16
	adds r3, r0, 0
	subs r3, 0x10
	cmp r3, 0
	blt _0807960E
	ldr r6, _08079618 @ =gScanlineEffectRegBuffers
	ldr r5, _0807961C @ =gScanlineEffect
	movs r4, 0
_080795F8:
	lsls r2, r3, 1
	ldrb r1, [r5, 0x14]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 7
	adds r2, r0
	adds r2, r6
	strh r4, [r2]
	subs r3, 0x1
	cmp r3, 0
	bge _080795F8
_0807960E:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08079618: .4byte gScanlineEffectRegBuffers
_0807961C: .4byte gScanlineEffect
	thumb_func_end sub_8079550

	thumb_func_start sub_8079620
sub_8079620: @ 8079620
	push {lr}
	ldr r1, _08079644 @ =gScanlineEffect
	ldrb r0, [r1, 0x15]
	cmp r0, 0
	beq _0807962E
	movs r0, 0x3
	strb r0, [r1, 0x15]
_0807962E:
	movs r0, 0x50
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x54
	movs r1, 0
	bl SetGpuReg
	pop {r0}
	bx r0
	.align 2, 0
_08079644: .4byte gScanlineEffect
	thumb_func_end sub_8079620

	thumb_func_start sub_8079648
sub_8079648: @ 8079648
	push {r4,lr}
	ldr r0, _080796BC @ =sub_80792C8
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	beq _0807965C
	bl DestroyTask
_0807965C:
	bl sub_8071898
	bl ResetPaletteFadeControl
	ldr r0, _080796C0 @ =gUnknown_8EAB6C4
	movs r2, 0xD0
	lsls r2, 1
	movs r1, 0
	bl LoadPalette
	ldr r0, _080796C4 @ =gUnknown_8EAD5E8
	movs r1, 0xD0
	movs r2, 0x20
	bl LoadPalette
	ldr r4, _080796C8 @ =gUnknown_8EAE094
	adds r0, r4, 0
	movs r1, 0xF0
	movs r2, 0x20
	bl LoadPalette
	adds r0, r4, 0
	movs r1, 0xE0
	movs r2, 0x20
	bl LoadPalette
	bl ResetBgPositions
	movs r1, 0xE0
	lsls r1, 8
	movs r0, 0
	bl ClearGpuRegBits
	movs r0, 0x1
	bl ShowBg
	movs r0, 0x2
	bl ShowBg
	movs r0, 0
	bl ShowBg
	movs r0, 0x3
	bl ShowBg
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080796BC: .4byte sub_80792C8
_080796C0: .4byte gUnknown_8EAB6C4
_080796C4: .4byte gUnknown_8EAD5E8
_080796C8: .4byte gUnknown_8EAE094
	thumb_func_end sub_8079648

	thumb_func_start sub_80796CC
sub_80796CC: @ 80796CC
	push {lr}
	bl UpdatePaletteFade
	lsls r0, 24
	cmp r0, 0
	bne _080796DE
	ldr r0, _080796E4 @ =sub_80F55A0
	bl SetMainCallback2
_080796DE:
	pop {r0}
	bx r0
	.align 2, 0
_080796E4: .4byte sub_80F55A0
	thumb_func_end sub_80796CC

	thumb_func_start sub_80796E8
sub_80796E8: @ 80796E8
	push {lr}
	bl UpdatePaletteFade
	lsls r0, 24
	cmp r0, 0
	bne _080796FE
	bl m4aMPlayAllStop
	ldr r0, _08079704 @ =mb_berry_fix_serve
	bl SetMainCallback2
_080796FE:
	pop {r0}
	bx r0
	.align 2, 0
_08079704: .4byte mb_berry_fix_serve
	thumb_func_end sub_80796E8

	thumb_func_start sub_8079708
sub_8079708: @ 8079708
	push {r4,r5,lr}
	movs r5, 0
	ldr r4, _08079728 @ =gUnknown_83BFB9C
_0807970E:
	adds r0, r4, 0
	bl LoadCompressedSpriteSheet
	adds r4, 0x8
	adds r5, 0x1
	cmp r5, 0x3
	bls _0807970E
	ldr r0, _0807972C @ =gUnknown_83BFBBC
	bl LoadSpritePalettes
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08079728: .4byte gUnknown_83BFB9C
_0807972C: .4byte gUnknown_83BFBBC
	thumb_func_end sub_8079708

	thumb_func_start sub_8079730
sub_8079730: @ 8079730
	push {r4,lr}
	adds r4, r0, 0
	adds r2, r4, 0
	adds r2, 0x2E
	ldrh r0, [r4, 0x2E]
	ldrh r1, [r2, 0x2]
	subs r0, r1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 20
	strh r0, [r4, 0x20]
	movs r1, 0x8
	negs r1, r1
	cmp r0, r1
	blt _08079774
	ldrh r0, [r2, 0x6]
	ldrh r1, [r2, 0x4]
	adds r0, r1
	strh r0, [r2, 0x4]
	lsls r0, 16
	asrs r0, 20
	strh r0, [r4, 0x22]
	subs r0, 0x10
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0xB8
	bhi _08079774
	adds r0, r4, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _0807977C
_08079774:
	adds r0, r4, 0
	bl DestroySprite
	b _080797A6
_0807977C:
	ldrh r1, [r2, 0xE]
	movs r3, 0xE
	ldrsh r0, [r2, r3]
	cmp r0, 0
	beq _080797A6
	subs r0, r1, 0x1
	strh r0, [r2, 0xE]
	lsls r0, 16
	cmp r0, 0
	bne _080797A6
	adds r0, r4, 0
	movs r1, 0
	bl StartSpriteAnim
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
_080797A6:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8079730

	thumb_func_start sub_80797AC
sub_80797AC: @ 80797AC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r4, r0, 0
	adds r5, r1, 0
	mov r8, r2
	adds r7, r3, 0
	ldr r0, [sp, 0x18]
	cmp r0, 0
	beq _080797C8
	ldr r0, _080797C4 @ =gUnknown_83BFB04
	b _080797CA
	.align 2, 0
_080797C4: .4byte gUnknown_83BFB04
_080797C8:
	ldr r0, _08079828 @ =gUnknown_83BFB1C
_080797CA:
	lsls r1, r4, 16
	asrs r1, 16
	lsls r2, r5, 16
	asrs r2, 16
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x40
	beq _08079834
	ldr r0, _0807982C @ =gSprites
	mov r12, r0
	lsls r0, r1, 4
	adds r0, r1
	lsls r6, r0, 2
	mov r1, r12
	adds r2, r6, r1
	lsls r0, r4, 4
	movs r1, 0
	strh r0, [r2, 0x2E]
	mov r0, r8
	strh r0, [r2, 0x30]
	lsls r0, r5, 4
	strh r0, [r2, 0x32]
	strh r7, [r2, 0x34]
	strh r1, [r2, 0x36]
	mov r3, r8
	muls r3, r7
	adds r0, r3, 0
	cmp r3, 0
	bge _0807980C
	adds r0, 0xF
_0807980C:
	asrs r0, 4
	lsls r0, 4
	subs r0, r3, r0
	strh r0, [r2, 0x38]
	mov r1, sp
	ldrh r1, [r1, 0x18]
	strh r1, [r2, 0x3A]
	mov r0, r12
	adds r0, 0x1C
	adds r0, r6, r0
	ldr r1, _08079830 @ =sub_8079730
	str r1, [r0]
	movs r0, 0x1
	b _08079836
	.align 2, 0
_08079828: .4byte gUnknown_83BFB1C
_0807982C: .4byte gSprites
_08079830: .4byte sub_8079730
_08079834:
	movs r0, 0
_08079836:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80797AC

	thumb_func_start sub_8079840
sub_8079840: @ 8079840
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _08079868 @ =gTasks+0x8
	adds r6, r0, r1
	movs r1, 0
	ldrsh r0, [r6, r1]
	cmp r0, 0
	beq _0807986C
	cmp r0, 0x1
	beq _08079884
	b _0807998A
	.align 2, 0
_08079868: .4byte gTasks+0x8
_0807986C:
	ldr r2, _08079880 @ =0x00007878
	adds r0, r5, 0
	movs r1, 0x3
	bl sub_807999C
	ldrh r0, [r6]
	adds r0, 0x1
	strh r0, [r6]
	b _0807998A
	.align 2, 0
_08079880: .4byte 0x00007878
_08079884:
	ldrh r0, [r6, 0x2]
	adds r0, 0x1
	strh r0, [r6, 0x2]
	lsls r0, 16
	asrs r0, 16
	movs r2, 0x4
	ldrsh r1, [r6, r2]
	cmp r0, r1
	blt _0807998A
	movs r0, 0
	strh r0, [r6, 0x2]
	adds r0, r5, 0
	movs r1, 0x3
	bl sub_80799B4
	movs r0, 0x12
	strh r0, [r6, 0x4]
	adds r0, r5, 0
	movs r1, 0x3
	bl sub_80799B4
	lsls r0, 16
	movs r1, 0xC0
	lsls r1, 10
	ands r1, r0
	lsrs r1, 16
	subs r1, 0x2
	mov r8, r1
	adds r0, r5, 0
	movs r1, 0x3
	bl sub_80799B4
	lsls r0, 16
	movs r1, 0xE0
	lsls r1, 11
	ands r1, r0
	lsrs r1, 16
	adds r7, r1, 0
	subs r7, 0x10
	adds r0, r5, 0
	movs r1, 0x3
	bl sub_80799B4
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x3
	bl __umodsi3
	lsls r0, 16
	lsrs r0, 16
	adds r0, 0x74
	mov r9, r0
	adds r0, r5, 0
	movs r1, 0x3
	bl sub_80799B4
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0xF0
	bl __umodsi3
	lsls r0, 16
	lsrs r4, r0, 16
	adds r0, r5, 0
	movs r1, 0x3
	bl sub_80799B4
	movs r2, 0
	lsls r0, 16
	movs r1, 0xF0
	lsls r1, 12
	ands r1, r0
	lsrs r1, 16
	cmp r1, 0x7
	bls _0807991C
	movs r2, 0x1
_0807991C:
	str r2, [sp]
	adds r0, r4, 0
	mov r1, r9
	mov r2, r8
	adds r3, r7, 0
	bl sub_80797AC
	movs r4, 0
_0807992C:
	ldr r1, _08079998 @ =gUnknown_83BFBD4
	adds r1, r4, r1
	movs r2, 0xA
	ldrsh r0, [r6, r2]
	ldrb r1, [r1]
	adds r0, r1
	movs r1, 0x1
	str r1, [sp]
	mov r1, r9
	mov r2, r8
	adds r3, r7, 0
	bl sub_80797AC
	adds r0, r5, 0
	movs r1, 0x3
	bl sub_80799B4
	lsls r0, 16
	movs r1, 0xC0
	lsls r1, 10
	ands r1, r0
	lsrs r1, 16
	subs r1, 0x2
	mov r8, r1
	adds r0, r5, 0
	movs r1, 0x3
	bl sub_80799B4
	lsls r0, 16
	movs r1, 0xE0
	lsls r1, 11
	ands r1, r0
	lsrs r1, 16
	adds r7, r1, 0
	subs r7, 0x10
	adds r4, 0x1
	cmp r4, 0xE
	ble _0807992C
	ldrh r0, [r6, 0xA]
	adds r0, 0x1
	strh r0, [r6, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3
	ble _0807998A
	movs r0, 0
	strh r0, [r6, 0xA]
_0807998A:
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08079998: .4byte gUnknown_83BFBD4
	thumb_func_end sub_8079840

	thumb_func_start sub_807999C
sub_807999C: @ 807999C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 16
	lsrs r2, 16
	bl SetWordTaskArg
	pop {r0}
	bx r0
	thumb_func_end sub_807999C

	thumb_func_start sub_80799B4
sub_80799B4: @ 80799B4
	push {r4-r6,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	lsrs r5, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl GetWordTaskArg
	adds r6, r0, 0
	ldr r0, _080799E8 @ =0x41c64e6d
	muls r0, r6
	ldr r1, _080799EC @ =0x00006073
	adds r6, r0, r1
	adds r0, r4, 0
	adds r1, r5, 0
	adds r2, r6, 0
	bl SetWordTaskArg
	lsrs r0, r6, 16
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_080799E8: .4byte 0x41c64e6d
_080799EC: .4byte 0x00006073
	thumb_func_end sub_80799B4

	thumb_func_start sub_80799F0
sub_80799F0: @ 80799F0
	push {lr}
	ldr r0, _08079A0C @ =gUnknown_83BFB3C
	movs r1, 0x18
	movs r2, 0x90
	movs r3, 0
	bl CreateSprite
	movs r0, 0x2
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_08079A0C: .4byte gUnknown_83BFB3C
	thumb_func_end sub_80799F0

	thumb_func_start sub_8079A10
sub_8079A10: @ 8079A10
	push {lr}
	cmp r0, 0
	beq _08079A38
	movs r0, 0x2
	bl IndexOfSpritePaletteTag
	adds r1, r0, 0
	lsls r1, 24
	ldr r0, _08079A34 @ =gUnknown_8EAE488
	lsrs r1, 4
	movs r2, 0x80
	lsls r2, 17
	adds r1, r2
	lsrs r1, 16
	movs r2, 0x20
	bl LoadPalette
	b _08079A3C
	.align 2, 0
_08079A34: .4byte gUnknown_8EAE488
_08079A38:
	bl sub_80799F0
_08079A3C:
	pop {r0}
	bx r0
	thumb_func_end sub_8079A10

	thumb_func_start sub_8079A40
sub_8079A40: @ 8079A40
	push {r4,lr}
	ldr r0, _08079A7C @ =gUnknown_83BFB5C
	movs r1, 0x20
	negs r1, r1
	movs r2, 0x1B
	movs r3, 0x1
	bl CreateSprite
	lsls r0, 24
	lsrs r1, r0, 24
	adds r4, r1, 0
	cmp r1, 0x40
	beq _08079A74
	ldr r3, _08079A80 @ =gSprites
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r3, 0
	adds r1, 0x1C
	adds r1, r0, r1
	ldr r2, _08079A84 @ =sub_8079AD8
	str r2, [r1]
	adds r0, r3
	movs r1, 0x87
	lsls r1, 2
	strh r1, [r0, 0x30]
_08079A74:
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08079A7C: .4byte gUnknown_83BFB5C
_08079A80: .4byte gSprites
_08079A84: .4byte sub_8079AD8
	thumb_func_end sub_8079A40

	thumb_func_start sub_8079A88
sub_8079A88: @ 8079A88
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x40
	beq _08079AA0
	ldr r0, _08079AA4 @ =gSprites
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r0
	movs r0, 0x1
	strh r0, [r1, 0x32]
_08079AA0:
	pop {r0}
	bx r0
	.align 2, 0
_08079AA4: .4byte gSprites
	thumb_func_end sub_8079A88

	thumb_func_start sub_8079AA8
sub_8079AA8: @ 8079AA8
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x40
	bne _08079AB6
	movs r0, 0
	b _08079ACE
_08079AB6:
	ldr r1, _08079AD4 @ =gSprites
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r1
	movs r2, 0x2E
	ldrsh r1, [r0, r2]
	movs r0, 0x2
	eors r1, r0
	negs r0, r1
	orrs r0, r1
	lsrs r0, 31
_08079ACE:
	pop {r1}
	bx r1
	.align 2, 0
_08079AD4: .4byte gSprites
	thumb_func_end sub_8079AA8

	thumb_func_start sub_8079AD8
sub_8079AD8: @ 8079AD8
	push {lr}
	adds r2, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r2, r1]
	cmp r0, 0x1
	beq _08079B24
	cmp r0, 0x1
	bgt _08079B74
	cmp r0, 0
	bne _08079B74
	movs r1, 0x32
	ldrsh r0, [r2, r1]
	cmp r0, 0
	beq _08079B04
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r0, [r3]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r3]
	movs r0, 0x2
	strh r0, [r2, 0x2E]
_08079B04:
	ldrh r0, [r2, 0x30]
	subs r0, 0x1
	strh r0, [r2, 0x30]
	lsls r0, 16
	cmp r0, 0
	bne _08079B74
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r0, [r3]
	movs r1, 0x5
	negs r1, r1
	ands r1, r0
	strb r1, [r3]
	movs r0, 0x1
	strh r0, [r2, 0x2E]
	b _08079B74
_08079B24:
	ldrh r0, [r2, 0x20]
	adds r0, 0x9
	strh r0, [r2, 0x20]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x43
	bne _08079B38
	ldrh r0, [r2, 0x22]
	subs r0, 0x7
	strh r0, [r2, 0x22]
_08079B38:
	movs r0, 0x20
	ldrsh r1, [r2, r0]
	cmp r1, 0x94
	bne _08079B46
	ldrh r0, [r2, 0x22]
	adds r0, 0x7
	strh r0, [r2, 0x22]
_08079B46:
	movs r0, 0x88
	lsls r0, 1
	cmp r1, r0
	ble _08079B74
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r0, [r3]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r3]
	movs r0, 0x32
	ldrsh r1, [r2, r0]
	cmp r1, 0
	beq _08079B68
	movs r0, 0x2
	strh r0, [r2, 0x2E]
	b _08079B74
_08079B68:
	ldr r0, _08079B78 @ =0x0000ffe0
	strh r0, [r2, 0x20]
	movs r0, 0x87
	lsls r0, 2
	strh r0, [r2, 0x30]
	strh r1, [r2, 0x2E]
_08079B74:
	pop {r0}
	bx r0
	.align 2, 0
_08079B78: .4byte 0x0000ffe0
	thumb_func_end sub_8079AD8

	.align 2, 0 @ Don't pad with nop.
