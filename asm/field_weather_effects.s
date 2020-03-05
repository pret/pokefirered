	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start Clouds_InitVars
Clouds_InitVars: @ 807B2DC
	push {lr}
	ldr r0, _0807B314 @ =gUnknown_83C2BBC
	ldr r0, [r0]
	ldr r2, _0807B318 @ =0x000006c1
	adds r1, r0, r2
	movs r2, 0
	strb r2, [r1]
	ldr r1, _0807B31C @ =0x000006c2
	adds r3, r0, r1
	movs r1, 0x14
	strb r1, [r3]
	ldr r3, _0807B320 @ =0x000006d2
	adds r1, r0, r3
	strb r2, [r1]
	subs r3, 0x6
	adds r1, r0, r3
	strh r2, [r1]
	ldr r1, _0807B324 @ =0x000006de
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _0807B310
	movs r0, 0
	movs r1, 0x10
	bl Weather_SetBlendCoeffs
_0807B310:
	pop {r0}
	bx r0
	.align 2, 0
_0807B314: .4byte gUnknown_83C2BBC
_0807B318: .4byte 0x000006c1
_0807B31C: .4byte 0x000006c2
_0807B320: .4byte 0x000006d2
_0807B324: .4byte 0x000006de
	thumb_func_end Clouds_InitVars

	thumb_func_start Clouds_InitAll
Clouds_InitAll: @ 807B328
	push {r4,lr}
	bl Clouds_InitVars
	ldr r0, _0807B350 @ =gUnknown_83C2BBC
	ldr r1, [r0]
	ldr r2, _0807B354 @ =0x000006d2
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	bne _0807B348
	adds r4, r1, r2
_0807B33E:
	bl Clouds_Main
	ldrb r0, [r4]
	cmp r0, 0
	beq _0807B33E
_0807B348:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807B350: .4byte gUnknown_83C2BBC
_0807B354: .4byte 0x000006d2
	thumb_func_end Clouds_InitAll

	thumb_func_start Clouds_Main
Clouds_Main: @ 807B358
	push {r4,r5,lr}
	ldr r0, _0807B374 @ =gUnknown_83C2BBC
	ldr r5, [r0]
	ldr r0, _0807B378 @ =0x000006cc
	adds r4, r5, r0
	ldrh r0, [r4]
	cmp r0, 0x1
	beq _0807B388
	cmp r0, 0x1
	bgt _0807B37C
	cmp r0, 0
	beq _0807B382
	b _0807B3AC
	.align 2, 0
_0807B374: .4byte gUnknown_83C2BBC
_0807B378: .4byte 0x000006cc
_0807B37C:
	cmp r0, 0x2
	beq _0807B394
	b _0807B3AC
_0807B382:
	bl CreateCloudSprites
	b _0807B3A6
_0807B388:
	movs r0, 0xC
	movs r1, 0x8
	movs r2, 0x1
	bl Weather_SetTargetBlendCoeffs
	b _0807B3A6
_0807B394:
	bl Weather_UpdateBlend
	lsls r0, 24
	cmp r0, 0
	beq _0807B3AC
	ldr r0, _0807B3B4 @ =0x000006d2
	adds r1, r5, r0
	movs r0, 0x1
	strb r0, [r1]
_0807B3A6:
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
_0807B3AC:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807B3B4: .4byte 0x000006d2
	thumb_func_end Clouds_Main

	thumb_func_start Clouds_Finish
Clouds_Finish: @ 807B3B8
	push {r4,lr}
	ldr r0, _0807B3D0 @ =gUnknown_83C2BBC
	ldr r0, [r0]
	ldr r1, _0807B3D4 @ =0x000006ce
	adds r4, r0, r1
	ldrh r0, [r4]
	cmp r0, 0
	beq _0807B3D8
	cmp r0, 0x1
	beq _0807B3E4
	movs r0, 0
	b _0807B3FA
	.align 2, 0
_0807B3D0: .4byte gUnknown_83C2BBC
_0807B3D4: .4byte 0x000006ce
_0807B3D8:
	movs r0, 0
	movs r1, 0x10
	movs r2, 0x1
	bl Weather_SetTargetBlendCoeffs
	b _0807B3F2
_0807B3E4:
	bl Weather_UpdateBlend
	lsls r0, 24
	cmp r0, 0
	beq _0807B3F8
	bl sub_807B504
_0807B3F2:
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
_0807B3F8:
	movs r0, 0x1
_0807B3FA:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end Clouds_Finish

	thumb_func_start Weather2_InitVars
Weather2_InitVars: @ 807B400
	ldr r0, _0807B418 @ =gUnknown_83C2BBC
	ldr r1, [r0]
	ldr r0, _0807B41C @ =0x000006c1
	adds r2, r1, r0
	movs r0, 0
	strb r0, [r2]
	ldr r0, _0807B420 @ =0x000006c2
	adds r1, r0
	movs r0, 0x14
	strb r0, [r1]
	bx lr
	.align 2, 0
_0807B418: .4byte gUnknown_83C2BBC
_0807B41C: .4byte 0x000006c1
_0807B420: .4byte 0x000006c2
	thumb_func_end Weather2_InitVars

	thumb_func_start Weather2_InitAll
Weather2_InitAll: @ 807B424
	push {lr}
	bl Weather2_InitVars
	pop {r0}
	bx r0
	thumb_func_end Weather2_InitAll

	thumb_func_start nullsub_48
nullsub_48: @ 807B430
	bx lr
	thumb_func_end nullsub_48

	thumb_func_start sub_807B434
sub_807B434: @ 807B434
	movs r0, 0
	bx lr
	thumb_func_end sub_807B434

	thumb_func_start CreateCloudSprites
CreateCloudSprites: @ 807B438
	push {r4,r5,lr}
	ldr r0, _0807B4B0 @ =gUnknown_83C2BBC
	ldr r0, [r0]
	ldr r1, _0807B4B4 @ =0x000006de
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _0807B4F4
	ldr r0, _0807B4B8 @ =gUnknown_83C65D4
	bl LoadSpriteSheet
	ldr r0, _0807B4BC @ =gUnknown_83C2D00
	bl sub_807ABC0
	movs r5, 0
_0807B456:
	ldr r0, _0807B4C0 @ =gUnknown_83C65F0
	movs r1, 0
	movs r2, 0
	movs r3, 0xFF
	bl CreateSprite
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x40
	beq _0807B4CC
	ldr r0, _0807B4B0 @ =gUnknown_83C2BBC
	ldr r1, [r0]
	lsls r2, r5, 2
	movs r0, 0xFA
	lsls r0, 1
	adds r1, r0
	adds r1, r2
	lsls r4, r3, 4
	adds r4, r3
	lsls r4, 2
	ldr r0, _0807B4C4 @ =gSprites
	adds r4, r0
	str r4, [r1]
	ldr r0, _0807B4C8 @ =gUnknown_83C65C8
	adds r2, r0
	ldrh r0, [r2]
	adds r0, 0x7
	lsls r0, 16
	asrs r0, 16
	ldrh r1, [r2, 0x2]
	adds r1, 0x7
	lsls r1, 16
	asrs r1, 16
	adds r2, r4, 0
	adds r2, 0x20
	adds r3, r4, 0
	adds r3, 0x22
	bl SetSpritePosToMapCoords
	adds r4, 0x3E
	ldrb r0, [r4]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r4]
	b _0807B4DE
	.align 2, 0
_0807B4B0: .4byte gUnknown_83C2BBC
_0807B4B4: .4byte 0x000006de
_0807B4B8: .4byte gUnknown_83C65D4
_0807B4BC: .4byte gUnknown_83C2D00
_0807B4C0: .4byte gUnknown_83C65F0
_0807B4C4: .4byte gSprites
_0807B4C8: .4byte gUnknown_83C65C8
_0807B4CC:
	ldr r0, _0807B4FC @ =gUnknown_83C2BBC
	ldr r1, [r0]
	lsls r0, r5, 2
	movs r2, 0xFA
	lsls r2, 1
	adds r1, r2
	adds r1, r0
	movs r0, 0
	str r0, [r1]
_0807B4DE:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x2
	bls _0807B456
	ldr r0, _0807B4FC @ =gUnknown_83C2BBC
	ldr r0, [r0]
	ldr r1, _0807B500 @ =0x000006de
	adds r0, r1
	movs r1, 0x1
	strb r1, [r0]
_0807B4F4:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807B4FC: .4byte gUnknown_83C2BBC
_0807B500: .4byte 0x000006de
	thumb_func_end CreateCloudSprites

	thumb_func_start sub_807B504
sub_807B504: @ 807B504
	push {r4,r5,lr}
	ldr r0, _0807B550 @ =gUnknown_83C2BBC
	ldr r1, [r0]
	ldr r2, _0807B554 @ =0x000006de
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	beq _0807B548
	movs r4, 0
	movs r0, 0xFA
	lsls r0, 1
	adds r5, r1, r0
_0807B51C:
	lsls r0, r4, 2
	adds r0, r5, r0
	ldr r0, [r0]
	cmp r0, 0
	beq _0807B52A
	bl DestroySprite
_0807B52A:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x2
	bls _0807B51C
	movs r0, 0x90
	lsls r0, 5
	bl FreeSpriteTilesByTag
	ldr r0, _0807B550 @ =gUnknown_83C2BBC
	ldr r0, [r0]
	ldr r1, _0807B554 @ =0x000006de
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
_0807B548:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807B550: .4byte gUnknown_83C2BBC
_0807B554: .4byte 0x000006de
	thumb_func_end sub_807B504

	thumb_func_start sub_807B558
sub_807B558: @ 807B558
	push {lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x2E]
	adds r0, 0x1
	movs r1, 0x1
	ands r0, r1
	strh r0, [r2, 0x2E]
	cmp r0, 0
	beq _0807B570
	ldrh r0, [r2, 0x20]
	subs r0, 0x1
	strh r0, [r2, 0x20]
_0807B570:
	pop {r0}
	bx r0
	thumb_func_end sub_807B558

	thumb_func_start Drought_InitVars
Drought_InitVars: @ 807B574
	ldr r0, _0807B598 @ =gUnknown_83C2BBC
	ldr r1, [r0]
	ldr r0, _0807B59C @ =0x000006cc
	adds r3, r1, r0
	movs r2, 0
	movs r0, 0
	strh r0, [r3]
	ldr r3, _0807B5A0 @ =0x000006d2
	adds r0, r1, r3
	strb r2, [r0]
	subs r3, 0x11
	adds r0, r1, r3
	strb r2, [r0]
	ldr r0, _0807B5A4 @ =0x000006c2
	adds r1, r0
	strb r2, [r1]
	bx lr
	.align 2, 0
_0807B598: .4byte gUnknown_83C2BBC
_0807B59C: .4byte 0x000006cc
_0807B5A0: .4byte 0x000006d2
_0807B5A4: .4byte 0x000006c2
	thumb_func_end Drought_InitVars

	thumb_func_start Drought_InitAll
Drought_InitAll: @ 807B5A8
	push {r4,lr}
	bl Drought_InitVars
	ldr r0, _0807B5D0 @ =gUnknown_83C2BBC
	ldr r1, [r0]
	ldr r2, _0807B5D4 @ =0x000006d2
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	bne _0807B5C8
	adds r4, r1, r2
_0807B5BE:
	bl Drought_Main
	ldrb r0, [r4]
	cmp r0, 0
	beq _0807B5BE
_0807B5C8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807B5D0: .4byte gUnknown_83C2BBC
_0807B5D4: .4byte 0x000006d2
	thumb_func_end Drought_InitAll

	thumb_func_start Drought_Main
Drought_Main: @ 807B5D8
	push {lr}
	ldr r1, _0807B5F4 @ =gUnknown_83C2BBC
	ldr r0, [r1]
	ldr r2, _0807B5F8 @ =0x000006cc
	adds r0, r2
	ldrh r0, [r0]
	adds r2, r1, 0
	cmp r0, 0x4
	bhi _0807B6B4
	lsls r0, 2
	ldr r1, _0807B5FC @ =_0807B600
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0807B5F4: .4byte gUnknown_83C2BBC
_0807B5F8: .4byte 0x000006cc
_0807B5FC: .4byte _0807B600
	.align 2, 0
_0807B600:
	.4byte _0807B614
	.4byte _0807B630
	.4byte _0807B648
	.4byte _0807B664
	.4byte _0807B67C
_0807B614:
	ldr r1, [r2]
	ldr r2, _0807B628 @ =0x000006c6
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	beq _0807B6B8
	ldr r0, _0807B62C @ =0x000006cc
	adds r1, r0
	b _0807B69C
	.align 2, 0
_0807B628: .4byte 0x000006c6
_0807B62C: .4byte 0x000006cc
_0807B630:
	bl sub_807ABF4
	ldr r0, _0807B640 @ =gUnknown_83C2BBC
	ldr r1, [r0]
	ldr r2, _0807B644 @ =0x000006cc
	adds r1, r2
	b _0807B69C
	.align 2, 0
_0807B640: .4byte gUnknown_83C2BBC
_0807B644: .4byte 0x000006cc
_0807B648:
	bl sub_807AC14
	lsls r0, 24
	cmp r0, 0
	bne _0807B6B8
	ldr r0, _0807B65C @ =gUnknown_83C2BBC
	ldr r1, [r0]
	ldr r0, _0807B660 @ =0x000006cc
	adds r1, r0
	b _0807B69C
	.align 2, 0
_0807B65C: .4byte gUnknown_83C2BBC
_0807B660: .4byte 0x000006cc
_0807B664:
	bl sub_807AC60
	ldr r0, _0807B674 @ =gUnknown_83C2BBC
	ldr r1, [r0]
	ldr r2, _0807B678 @ =0x000006cc
	adds r1, r2
	b _0807B69C
	.align 2, 0
_0807B674: .4byte gUnknown_83C2BBC
_0807B678: .4byte 0x000006cc
_0807B67C:
	bl sub_807AC98
	ldr r0, _0807B6A4 @ =gUnknown_83C2BBC
	ldr r2, [r0]
	ldr r1, _0807B6A8 @ =0x0000073c
	adds r0, r2, r1
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0x6
	bne _0807B6B8
	ldr r0, _0807B6AC @ =0x000006d2
	adds r1, r2, r0
	movs r0, 0x1
	strb r0, [r1]
	ldr r0, _0807B6B0 @ =0x000006cc
	adds r1, r2, r0
_0807B69C:
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	b _0807B6B8
	.align 2, 0
_0807B6A4: .4byte gUnknown_83C2BBC
_0807B6A8: .4byte 0x0000073c
_0807B6AC: .4byte 0x000006d2
_0807B6B0: .4byte 0x000006cc
_0807B6B4:
	bl sub_807AC98
_0807B6B8:
	pop {r0}
	bx r0
	thumb_func_end Drought_Main

	thumb_func_start sub_807B6BC
sub_807B6BC: @ 807B6BC
	movs r0, 0
	bx lr
	thumb_func_end sub_807B6BC

	thumb_func_start StartDroughtWeatherBlend
StartDroughtWeatherBlend: @ 807B6C0
	push {lr}
	ldr r0, _0807B6D0 @ =task50_0807B6D4
	movs r1, 0x50
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_0807B6D0: .4byte task50_0807B6D4
	thumb_func_end StartDroughtWeatherBlend

	thumb_func_start task50_0807B6D4
task50_0807B6D4: @ 807B6D4
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _0807B6F8 @ =gTasks
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x4
	bhi _0807B7C2
	lsls r0, 2
	ldr r1, _0807B6FC @ =_0807B700
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0807B6F8: .4byte gTasks
_0807B6FC: .4byte _0807B700
	.align 2, 0
_0807B700:
	.4byte _0807B714
	.4byte _0807B740
	.4byte _0807B768
	.4byte _0807B798
	.4byte _0807B7B8
_0807B714:
	movs r0, 0
	strh r0, [r4, 0xA]
	strh r0, [r4, 0xC]
	movs r0, 0x48
	bl GetGpuReg
	strh r0, [r4, 0xE]
	ldr r1, _0807B764 @ =0x00003f3f
	movs r0, 0x48
	bl SetGpuReg
	movs r0, 0x50
	movs r1, 0x9E
	bl SetGpuReg
	movs r0, 0x54
	movs r1, 0
	bl SetGpuReg
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_0807B740:
	ldrh r0, [r4, 0xA]
	adds r0, 0x3
	strh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x10
	ble _0807B752
	movs r0, 0x10
	strh r0, [r4, 0xA]
_0807B752:
	ldrh r1, [r4, 0xA]
	movs r0, 0x54
	bl SetGpuReg
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	cmp r0, 0xF
	ble _0807B7C2
	b _0807B7B0
	.align 2, 0
_0807B764: .4byte 0x00003f3f
_0807B768:
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	movs r1, 0
	strh r0, [r4, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x9
	ble _0807B7C2
	strh r1, [r4, 0xC]
	ldrh r0, [r4, 0xA]
	subs r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	cmp r0, 0
	bgt _0807B78E
	strh r1, [r4, 0xA]
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_0807B78E:
	ldrh r1, [r4, 0xA]
	movs r0, 0x54
	bl SetGpuReg
	b _0807B7C2
_0807B798:
	movs r0, 0x50
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x54
	movs r1, 0
	bl SetGpuReg
	ldrh r1, [r4, 0xE]
	movs r0, 0x48
	bl SetGpuReg
_0807B7B0:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _0807B7C2
_0807B7B8:
	bl EnableBothScriptContexts
	adds r0, r5, 0
	bl DestroyTask
_0807B7C2:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end task50_0807B6D4

	thumb_func_start LightRain_InitVars
LightRain_InitVars: @ 807B7C8
	push {r4,lr}
	ldr r0, _0807B818 @ =gUnknown_83C2BBC
	ldr r1, [r0]
	ldr r2, _0807B81C @ =0x000006cc
	adds r0, r1, r2
	movs r3, 0
	movs r2, 0
	strh r2, [r0]
	ldr r4, _0807B820 @ =0x000006d2
	adds r0, r1, r4
	strb r3, [r0]
	adds r4, 0x4
	adds r0, r1, r4
	strh r2, [r0]
	ldr r0, _0807B824 @ =0x000006db
	adds r2, r1, r0
	movs r0, 0x8
	strb r0, [r2]
	ldr r2, _0807B828 @ =0x000006dc
	adds r0, r1, r2
	strb r3, [r0]
	adds r4, 0x3
	adds r2, r1, r4
	movs r0, 0xA
	strb r0, [r2]
	ldr r0, _0807B82C @ =0x000006c1
	adds r2, r1, r0
	movs r0, 0x3
	strb r0, [r2]
	ldr r2, _0807B830 @ =0x000006c2
	adds r1, r2
	movs r0, 0x14
	strb r0, [r1]
	movs r0, 0x4E
	bl SetRainStrengthFromSoundEffect
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807B818: .4byte gUnknown_83C2BBC
_0807B81C: .4byte 0x000006cc
_0807B820: .4byte 0x000006d2
_0807B824: .4byte 0x000006db
_0807B828: .4byte 0x000006dc
_0807B82C: .4byte 0x000006c1
_0807B830: .4byte 0x000006c2
	thumb_func_end LightRain_InitVars

	thumb_func_start LightRain_InitAll
LightRain_InitAll: @ 807B834
	push {r4,lr}
	bl LightRain_InitVars
	ldr r0, _0807B85C @ =gUnknown_83C2BBC
	ldr r1, [r0]
	ldr r2, _0807B860 @ =0x000006d2
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	bne _0807B854
	adds r4, r1, r2
_0807B84A:
	bl LightRain_Main
	ldrb r0, [r4]
	cmp r0, 0
	beq _0807B84A
_0807B854:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807B85C: .4byte gUnknown_83C2BBC
_0807B860: .4byte 0x000006d2
	thumb_func_end LightRain_InitAll

	thumb_func_start LightRain_Main
LightRain_Main: @ 807B864
	push {r4,r5,lr}
	ldr r0, _0807B880 @ =gUnknown_83C2BBC
	ldr r5, [r0]
	ldr r0, _0807B884 @ =0x000006cc
	adds r4, r5, r0
	ldrh r0, [r4]
	cmp r0, 0x1
	beq _0807B894
	cmp r0, 0x1
	bgt _0807B888
	cmp r0, 0
	beq _0807B88E
	b _0807B8B8
	.align 2, 0
_0807B880: .4byte gUnknown_83C2BBC
_0807B884: .4byte 0x000006cc
_0807B888:
	cmp r0, 0x2
	beq _0807B8A0
	b _0807B8B8
_0807B88E:
	bl LoadRainSpriteSheet
	b _0807B8B2
_0807B894:
	bl CreateRainSprite
	lsls r0, 24
	cmp r0, 0
	bne _0807B8B8
	b _0807B8B2
_0807B8A0:
	bl sub_807BD4C
	lsls r0, 24
	cmp r0, 0
	bne _0807B8B8
	ldr r0, _0807B8C0 @ =0x000006d2
	adds r1, r5, r0
	movs r0, 0x1
	strb r0, [r1]
_0807B8B2:
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
_0807B8B8:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807B8C0: .4byte 0x000006d2
	thumb_func_end LightRain_Main

	thumb_func_start LightRain_Finish
LightRain_Finish: @ 807B8C4
	push {r4,r5,lr}
	ldr r0, _0807B8E0 @ =gUnknown_83C2BBC
	ldr r2, [r0]
	ldr r1, _0807B8E4 @ =0x000006ce
	adds r3, r2, r1
	ldrh r1, [r3]
	adds r4, r0, 0
	cmp r1, 0
	beq _0807B8E8
	cmp r1, 0x1
	beq _0807B91C
	movs r0, 0
	b _0807B94A
	.align 2, 0
_0807B8E0: .4byte gUnknown_83C2BBC
_0807B8E4: .4byte 0x000006ce
_0807B8E8:
	ldr r5, _0807B908 @ =0x000006d1
	adds r0, r2, r5
	ldrb r0, [r0]
	cmp r0, 0x3
	beq _0807B8FA
	cmp r0, 0x5
	beq _0807B8FA
	cmp r0, 0xD
	bne _0807B910
_0807B8FA:
	ldr r0, [r4]
	ldr r1, _0807B90C @ =0x000006ce
	adds r0, r1
	movs r1, 0xFF
	strh r1, [r0]
	movs r0, 0
	b _0807B94A
	.align 2, 0
_0807B908: .4byte 0x000006d1
_0807B90C: .4byte 0x000006ce
_0807B910:
	ldr r4, _0807B93C @ =0x000006d9
	adds r0, r2, r4
	strb r1, [r0]
	ldrh r0, [r3]
	adds r0, 0x1
	strh r0, [r3]
_0807B91C:
	bl sub_807BD4C
	lsls r0, 24
	cmp r0, 0
	bne _0807B948
	bl DestroyRainSprites
	ldr r0, _0807B940 @ =gUnknown_83C2BBC
	ldr r1, [r0]
	ldr r5, _0807B944 @ =0x000006ce
	adds r1, r5
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	movs r0, 0
	b _0807B94A
	.align 2, 0
_0807B93C: .4byte 0x000006d9
_0807B940: .4byte gUnknown_83C2BBC
_0807B944: .4byte 0x000006ce
_0807B948:
	movs r0, 0x1
_0807B94A:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end LightRain_Finish

	thumb_func_start sub_807B950
sub_807B950: @ 807B950
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r7, r0, 0
	movs r1, 0x30
	ldrsh r0, [r7, r1]
	cmp r0, 0
	bne _0807B964
	ldr r0, _0807BA08 @ =0x00000169
	strh r0, [r7, 0x30]
_0807B964:
	movs r2, 0x30
	ldrsh r1, [r7, r2]
	ldr r0, _0807BA0C @ =0x41c64e6d
	muls r0, r1
	ldr r3, _0807BA10 @ =0x00003039
	adds r0, r3
	lsls r0, 1
	lsrs r0, 17
	movs r1, 0x96
	lsls r1, 2
	bl __umodsi3
	movs r1, 0
	mov r8, r1
	strh r0, [r7, 0x30]
	ldr r1, _0807BA14 @ =gUnknown_83C66C4
	ldr r0, _0807BA18 @ =gUnknown_83C2BBC
	ldr r5, [r0]
	ldr r2, _0807BA1C @ =0x000006dc
	adds r5, r2
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldrh r6, [r0]
	movs r3, 0x30
	ldrsh r0, [r7, r3]
	movs r1, 0x1E
	bl __modsi3
	adds r4, r0, 0
	lsls r4, 16
	asrs r4, 16
	lsls r0, r4, 3
	strh r0, [r7, 0x32]
	movs r1, 0x30
	ldrsh r0, [r7, r1]
	movs r1, 0x1E
	bl __divsi3
	lsls r0, 16
	lsls r4, 7
	strh r4, [r7, 0x32]
	asrs r0, 9
	strh r0, [r7, 0x34]
	ldr r2, _0807BA20 @ =gUnknown_83C66BC
	ldrb r1, [r5]
	lsls r1, 2
	adds r1, r2
	movs r3, 0
	ldrsh r1, [r1, r3]
	muls r1, r6
	subs r4, r1
	strh r4, [r7, 0x32]
	ldrb r1, [r5]
	lsls r1, 2
	adds r2, 0x2
	adds r1, r2
	movs r2, 0
	ldrsh r1, [r1, r2]
	muls r1, r6
	subs r0, r1
	strh r0, [r7, 0x34]
	adds r0, r7, 0
	movs r1, 0
	bl StartSpriteAnim
	mov r3, r8
	strh r3, [r7, 0x36]
	adds r2, r7, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x3
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	strh r6, [r7, 0x2E]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807BA08: .4byte 0x00000169
_0807BA0C: .4byte 0x41c64e6d
_0807BA10: .4byte 0x00003039
_0807BA14: .4byte gUnknown_83C66C4
_0807BA18: .4byte gUnknown_83C2BBC
_0807BA1C: .4byte 0x000006dc
_0807BA20: .4byte gUnknown_83C66BC
	thumb_func_end sub_807B950

	thumb_func_start sub_807BA24
sub_807BA24: @ 807BA24
	push {r4,r5,lr}
	adds r5, r0, 0
	movs r1, 0x36
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _0807BB00
	ldr r3, _0807BA98 @ =gUnknown_83C66BC
	ldr r4, _0807BA9C @ =gUnknown_83C2BBC
	ldr r2, [r4]
	ldr r0, _0807BAA0 @ =0x000006dc
	adds r2, r0
	ldrb r0, [r2]
	lsls r0, 2
	adds r0, r3
	ldrh r1, [r0]
	ldrh r0, [r5, 0x32]
	adds r1, r0
	strh r1, [r5, 0x32]
	ldrb r0, [r2]
	lsls r0, 2
	adds r3, 0x2
	adds r0, r3
	ldrh r0, [r0]
	ldrh r2, [r5, 0x34]
	adds r0, r2
	strh r0, [r5, 0x34]
	lsls r1, 16
	asrs r1, 20
	strh r1, [r5, 0x20]
	lsls r0, 16
	asrs r2, r0, 20
	strh r2, [r5, 0x22]
	movs r3, 0x38
	ldrsh r0, [r5, r3]
	adds r3, r4, 0
	cmp r0, 0
	beq _0807BAA4
	adds r0, r1, 0
	adds r0, 0x8
	lsls r0, 16
	movs r1, 0x80
	lsls r1, 17
	cmp r0, r1
	bhi _0807BAA4
	adds r1, r2, 0
	movs r0, 0x10
	negs r0, r0
	cmp r1, r0
	blt _0807BAA4
	cmp r1, 0xB0
	bgt _0807BAA4
	adds r0, r5, 0
	adds r0, 0x3E
	ldrb r2, [r0]
	movs r1, 0x5
	negs r1, r1
	ands r1, r2
	b _0807BAAE
	.align 2, 0
_0807BA98: .4byte gUnknown_83C66BC
_0807BA9C: .4byte gUnknown_83C2BBC
_0807BAA0: .4byte 0x000006dc
_0807BAA4:
	adds r0, r5, 0
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
_0807BAAE:
	strb r1, [r0]
	adds r4, r0, 0
	ldrh r0, [r5, 0x2E]
	subs r0, 0x1
	strh r0, [r5, 0x2E]
	lsls r0, 16
	cmp r0, 0
	bne _0807BB20
	ldr r0, [r3]
	ldr r1, _0807BAF4 @ =0x000006dc
	adds r0, r1
	ldrb r1, [r0]
	adds r1, 0x1
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl StartSpriteAnim
	movs r0, 0x1
	strh r0, [r5, 0x36]
	ldr r1, _0807BAF8 @ =gSpriteCoordOffsetX
	ldrh r0, [r5, 0x20]
	ldrh r1, [r1]
	subs r0, r1
	strh r0, [r5, 0x20]
	ldr r1, _0807BAFC @ =gSpriteCoordOffsetY
	ldrh r0, [r5, 0x22]
	ldrh r1, [r1]
	subs r0, r1
	strh r0, [r5, 0x22]
	ldrb r0, [r4]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r4]
	b _0807BB20
	.align 2, 0
_0807BAF4: .4byte 0x000006dc
_0807BAF8: .4byte gSpriteCoordOffsetX
_0807BAFC: .4byte gSpriteCoordOffsetY
_0807BB00:
	adds r0, r5, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _0807BB20
	adds r2, r5, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	adds r0, r5, 0
	bl sub_807B950
_0807BB20:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_807BA24

	thumb_func_start sub_807BB28
sub_807BB28: @ 807BB28
	push {r4,lr}
	adds r4, r0, 0
	ldrh r1, [r4, 0x2E]
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bne _0807BB48
	adds r0, r4, 0
	bl sub_807B950
	ldr r0, _0807BB44 @ =sub_807BA24
	str r0, [r4, 0x1C]
	b _0807BB4C
	.align 2, 0
_0807BB44: .4byte sub_807BA24
_0807BB48:
	subs r0, r1, 0x1
	strh r0, [r4, 0x2E]
_0807BB4C:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_807BB28

	thumb_func_start sub_807BB54
sub_807BB54: @ 807BB54
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r7, r0, 0
	lsls r5, r1, 16
	lsrs r5, 16
	ldr r2, _0807BBD8 @ =gUnknown_83C66C4
	ldr r0, _0807BBDC @ =gUnknown_83C2BBC
	ldr r0, [r0]
	ldr r1, _0807BBE0 @ =0x000006dc
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 2
	adds r1, r0, r2
	ldrh r1, [r1]
	mov r8, r1
	adds r2, 0x2
	adds r0, r2
	ldrh r4, [r0]
	add r4, r8
	adds r0, r5, 0
	adds r1, r4, 0
	bl __divsi3
	lsls r0, 16
	lsrs r6, r0, 16
	adds r0, r5, 0
	adds r1, r4, 0
	bl __modsi3
	lsls r0, 16
	lsrs r4, r0, 16
	subs r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	ldr r0, _0807BBE4 @ =0x0000ffff
	cmp r6, r0
	beq _0807BBB2
	adds r5, r0, 0
_0807BBA2:
	adds r0, r7, 0
	bl sub_807B950
	subs r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r6, r5
	bne _0807BBA2
_0807BBB2:
	cmp r4, r8
	bcs _0807BBE8
	subs r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	ldr r0, _0807BBE4 @ =0x0000ffff
	cmp r4, r0
	beq _0807BBD4
	adds r5, r0, 0
_0807BBC4:
	adds r0, r7, 0
	bl sub_807BA24
	subs r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, r5
	bne _0807BBC4
_0807BBD4:
	movs r0, 0
	b _0807BBFC
	.align 2, 0
_0807BBD8: .4byte gUnknown_83C66C4
_0807BBDC: .4byte gUnknown_83C2BBC
_0807BBE0: .4byte 0x000006dc
_0807BBE4: .4byte 0x0000ffff
_0807BBE8:
	mov r1, r8
	subs r0, r4, r1
	strh r0, [r7, 0x2E]
	adds r2, r7, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	movs r0, 0x1
_0807BBFC:
	strh r0, [r7, 0x3A]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_807BB54

	thumb_func_start LoadRainSpriteSheet
LoadRainSpriteSheet: @ 807BC08
	push {lr}
	ldr r0, _0807BC14 @ =gUnknown_83C66CC
	bl LoadSpriteSheet
	pop {r0}
	bx r0
	.align 2, 0
_0807BC14: .4byte gUnknown_83C66CC
	thumb_func_end LoadRainSpriteSheet

	thumb_func_start CreateRainSprite
CreateRainSprite: @ 807BC18
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	ldr r0, _0807BCC4 @ =gUnknown_83C2BBC
	ldr r4, [r0]
	ldr r0, _0807BCC8 @ =0x000006da
	adds r2, r4, r0
	ldrb r0, [r2]
	cmp r0, 0x18
	bne _0807BC32
	b _0807BD38
_0807BC32:
	ldrb r7, [r2]
	ldr r0, _0807BCCC @ =gUnknown_83C66A4
	ldr r2, _0807BCD0 @ =gUnknown_83C6608
	lsls r6, r7, 2
	adds r2, r6, r2
	movs r3, 0
	ldrsh r1, [r2, r3]
	movs r3, 0x2
	ldrsh r2, [r2, r3]
	movs r3, 0x4E
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x40
	beq _0807BCE0
	ldr r3, _0807BCD4 @ =gSprites
	lsls r4, r5, 4
	adds r1, r4, r5
	lsls r1, 2
	adds r1, r3
	movs r0, 0
	strh r0, [r1, 0x38]
	lsls r2, r7, 3
	adds r0, r2, r7
	lsls r0, 4
	adds r0, r7
	strh r0, [r1, 0x30]
	lsls r0, 16
	asrs r0, 16
	ldr r1, _0807BCD8 @ =0x00000257
	mov r10, r6
	mov r9, r3
	mov r12, r4
	mov r8, r2
	cmp r0, r1
	ble _0807BC96
	adds r2, r1, 0
_0807BC7E:
	adds r0, r4, r5
	lsls r0, 2
	ldr r6, _0807BCD4 @ =gSprites
	adds r0, r6
	ldr r3, _0807BCDC @ =0xfffffda8
	ldrh r6, [r0, 0x30]
	adds r1, r3, r6
	strh r1, [r0, 0x30]
	lsls r1, 16
	asrs r1, 16
	cmp r1, r2
	bgt _0807BC7E
_0807BC96:
	mov r0, r12
	adds r4, r0, r5
	lsls r4, 2
	add r4, r9
	adds r0, r4, 0
	bl sub_807B950
	mov r3, r8
	adds r1, r3, r7
	adds r0, r4, 0
	bl sub_807BB54
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _0807BCC4 @ =gUnknown_83C2BBC
	ldr r0, [r0]
	add r0, r10
	str r4, [r0]
	b _0807BCE6
	.align 2, 0
_0807BCC4: .4byte gUnknown_83C2BBC
_0807BCC8: .4byte 0x000006da
_0807BCCC: .4byte gUnknown_83C66A4
_0807BCD0: .4byte gUnknown_83C6608
_0807BCD4: .4byte gSprites
_0807BCD8: .4byte 0x00000257
_0807BCDC: .4byte 0xfffffda8
_0807BCE0:
	adds r1, r4, r6
	movs r0, 0
	str r0, [r1]
_0807BCE6:
	ldr r0, _0807BD1C @ =gUnknown_83C2BBC
	ldr r2, [r0]
	ldr r6, _0807BD20 @ =0x000006da
	adds r1, r2, r6
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x18
	bne _0807BD3C
	movs r3, 0
	adds r1, r2, 0
	ldr r5, _0807BD24 @ =sub_807BA24
	ldr r4, _0807BD28 @ =sub_807BB28
_0807BD04:
	lsls r0, r3, 2
	adds r0, r1, r0
	ldr r2, [r0]
	cmp r2, 0
	beq _0807BD2E
	movs r6, 0x3A
	ldrsh r0, [r2, r6]
	cmp r0, 0
	bne _0807BD2C
	str r5, [r2, 0x1C]
	b _0807BD2E
	.align 2, 0
_0807BD1C: .4byte gUnknown_83C2BBC
_0807BD20: .4byte 0x000006da
_0807BD24: .4byte sub_807BA24
_0807BD28: .4byte sub_807BB28
_0807BD2C:
	str r4, [r2, 0x1C]
_0807BD2E:
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0x17
	bls _0807BD04
_0807BD38:
	movs r0, 0
	b _0807BD3E
_0807BD3C:
	movs r0, 0x1
_0807BD3E:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end CreateRainSprite

	thumb_func_start sub_807BD4C
sub_807BD4C: @ 807BD4C
	push {r4-r7,lr}
	ldr r0, _0807BD68 @ =gUnknown_83C2BBC
	ldr r3, [r0]
	movs r0, 0xDB
	lsls r0, 3
	adds r4, r3, r0
	ldr r1, _0807BD6C @ =0x000006d9
	adds r5, r3, r1
	ldrb r0, [r4]
	ldrb r7, [r5]
	cmp r0, r7
	bne _0807BD70
	movs r0, 0
	b _0807BDD2
	.align 2, 0
_0807BD68: .4byte gUnknown_83C2BBC
_0807BD6C: .4byte 0x000006d9
_0807BD70:
	ldr r0, _0807BDA8 @ =0x000006d6
	adds r2, r3, r0
	ldrh r0, [r2]
	adds r0, 0x1
	movs r6, 0
	strh r0, [r2]
	ldr r7, _0807BDAC @ =0x000006db
	adds r1, r3, r7
	lsls r0, 16
	lsrs r0, 16
	ldrb r1, [r1]
	cmp r0, r1
	bls _0807BDD0
	strh r6, [r2]
	ldrb r0, [r4]
	adds r1, r0, 0
	ldrb r5, [r5]
	cmp r1, r5
	bcs _0807BDB0
	adds r0, 0x1
	strb r0, [r4]
	lsls r0, r1, 2
	adds r0, r3, r0
	ldr r1, [r0]
	movs r0, 0x1
	strh r0, [r1, 0x38]
	b _0807BDD0
	.align 2, 0
_0807BDA8: .4byte 0x000006d6
_0807BDAC: .4byte 0x000006db
_0807BDB0:
	subs r0, 0x1
	strb r0, [r4]
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r3, r0
	ldr r0, [r0]
	strh r6, [r0, 0x38]
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r3, r0
	ldr r1, [r0]
	adds r1, 0x3E
	ldrb r0, [r1]
	movs r2, 0x4
	orrs r0, r2
	strb r0, [r1]
_0807BDD0:
	movs r0, 0x1
_0807BDD2:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_807BD4C

	thumb_func_start DestroyRainSprites
DestroyRainSprites: @ 807BDD8
	push {r4-r7,lr}
	movs r4, 0
	ldr r0, _0807BE20 @ =gUnknown_83C2BBC
	ldr r2, [r0]
	ldr r3, _0807BE24 @ =0x000006da
	adds r1, r2, r3
	adds r7, r0, 0
	ldrb r1, [r1]
	cmp r4, r1
	bcs _0807BE0A
	adds r5, r2, 0
	adds r6, r5, r3
_0807BDF0:
	lsls r0, r4, 2
	adds r0, r5, r0
	ldr r0, [r0]
	cmp r0, 0
	beq _0807BDFE
	bl DestroySprite
_0807BDFE:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	ldrb r0, [r6]
	cmp r4, r0
	bcc _0807BDF0
_0807BE0A:
	ldr r0, [r7]
	ldr r1, _0807BE24 @ =0x000006da
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
	ldr r0, _0807BE28 @ =0x00001206
	bl FreeSpriteTilesByTag
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807BE20: .4byte gUnknown_83C2BBC
_0807BE24: .4byte 0x000006da
_0807BE28: .4byte 0x00001206
	thumb_func_end DestroyRainSprites

	thumb_func_start Snow_InitVars
Snow_InitVars: @ 807BE2C
	push {r4,lr}
	ldr r0, _0807BE68 @ =gUnknown_83C2BBC
	ldr r1, [r0]
	ldr r2, _0807BE6C @ =0x000006cc
	adds r0, r1, r2
	movs r2, 0
	movs r3, 0
	strh r3, [r0]
	ldr r4, _0807BE70 @ =0x000006d2
	adds r0, r1, r4
	strb r2, [r0]
	ldr r0, _0807BE74 @ =0x000006c1
	adds r2, r1, r0
	movs r0, 0x3
	strb r0, [r2]
	subs r4, 0x10
	adds r2, r1, r4
	movs r0, 0x14
	strb r0, [r2]
	ldr r0, _0807BE78 @ =0x000006e5
	adds r2, r1, r0
	movs r0, 0x10
	strb r0, [r2]
	movs r2, 0xDC
	lsls r2, 3
	adds r1, r2
	strh r3, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807BE68: .4byte gUnknown_83C2BBC
_0807BE6C: .4byte 0x000006cc
_0807BE70: .4byte 0x000006d2
_0807BE74: .4byte 0x000006c1
_0807BE78: .4byte 0x000006e5
	thumb_func_end Snow_InitVars

	thumb_func_start Snow_InitAll
Snow_InitAll: @ 807BE7C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	bl Snow_InitVars
	ldr r2, _0807BEDC @ =gUnknown_83C2BBC
	ldr r1, [r2]
	ldr r3, _0807BEE0 @ =0x000006d2
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, 0
	bne _0807BED2
	mov r8, r2
	adds r7, r1, r3
_0807BE98:
	bl snowflakes_progress2
	movs r4, 0
	mov r1, r8
	ldr r0, [r1]
	ldr r3, _0807BEE4 @ =0x000006e4
	adds r0, r3
	ldrb r0, [r0]
	cmp r4, r0
	bcs _0807BECC
	ldr r0, _0807BEDC @ =gUnknown_83C2BBC
	ldr r5, [r0]
	adds r6, r5, r3
_0807BEB2:
	lsls r1, r4, 2
	adds r0, r5, 0
	adds r0, 0x60
	adds r0, r1
	ldr r0, [r0]
	bl sub_807C1AC
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	ldrb r0, [r6]
	cmp r4, r0
	bcc _0807BEB2
_0807BECC:
	ldrb r0, [r7]
	cmp r0, 0
	beq _0807BE98
_0807BED2:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807BEDC: .4byte gUnknown_83C2BBC
_0807BEE0: .4byte 0x000006d2
_0807BEE4: .4byte 0x000006e4
	thumb_func_end Snow_InitAll

	thumb_func_start snowflakes_progress2
snowflakes_progress2: @ 807BEE8
	push {r4,r5,lr}
	ldr r0, _0807BF18 @ =gUnknown_83C2BBC
	ldr r5, [r0]
	ldr r0, _0807BF1C @ =0x000006cc
	adds r4, r5, r0
	ldrh r0, [r4]
	cmp r0, 0
	bne _0807BF10
	bl snowflakes_progress
	lsls r0, 24
	cmp r0, 0
	bne _0807BF10
	ldr r0, _0807BF20 @ =0x000006d2
	adds r1, r5, r0
	movs r0, 0x1
	strb r0, [r1]
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
_0807BF10:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807BF18: .4byte gUnknown_83C2BBC
_0807BF1C: .4byte 0x000006cc
_0807BF20: .4byte 0x000006d2
	thumb_func_end snowflakes_progress2

	thumb_func_start Snow_Finish
Snow_Finish: @ 807BF24
	push {r4,lr}
	ldr r0, _0807BF3C @ =gUnknown_83C2BBC
	ldr r2, [r0]
	ldr r0, _0807BF40 @ =0x000006ce
	adds r3, r2, r0
	ldrh r1, [r3]
	cmp r1, 0
	beq _0807BF44
	cmp r1, 0x1
	beq _0807BF56
	movs r0, 0
	b _0807BF82
	.align 2, 0
_0807BF3C: .4byte gUnknown_83C2BBC
_0807BF40: .4byte 0x000006ce
_0807BF44:
	ldr r4, _0807BF74 @ =0x000006e5
	adds r0, r2, r4
	strb r1, [r0]
	subs r4, 0x5
	adds r0, r2, r4
	strh r1, [r0]
	ldrh r0, [r3]
	adds r0, 0x1
	strh r0, [r3]
_0807BF56:
	bl snowflakes_progress
	lsls r0, 24
	cmp r0, 0
	bne _0807BF80
	ldr r0, _0807BF78 @ =gUnknown_83C2BBC
	ldr r1, [r0]
	ldr r0, _0807BF7C @ =0x000006ce
	adds r1, r0
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	movs r0, 0
	b _0807BF82
	.align 2, 0
_0807BF74: .4byte 0x000006e5
_0807BF78: .4byte gUnknown_83C2BBC
_0807BF7C: .4byte 0x000006ce
_0807BF80:
	movs r0, 0x1
_0807BF82:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end Snow_Finish

	thumb_func_start snowflakes_progress
snowflakes_progress: @ 807BF88
	push {r4,lr}
	ldr r0, _0807BFA4 @ =gUnknown_83C2BBC
	ldr r1, [r0]
	ldr r0, _0807BFA8 @ =0x000006e4
	adds r3, r1, r0
	ldr r4, _0807BFAC @ =0x000006e5
	adds r2, r1, r4
	ldrb r0, [r3]
	ldrb r4, [r2]
	cmp r0, r4
	bne _0807BFB0
	movs r0, 0
	b _0807BFF2
	.align 2, 0
_0807BFA4: .4byte gUnknown_83C2BBC
_0807BFA8: .4byte 0x000006e4
_0807BFAC: .4byte 0x000006e5
_0807BFB0:
	movs r0, 0xDC
	lsls r0, 3
	adds r1, r0
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x24
	bls _0807BFDA
	movs r0, 0
	strh r0, [r1]
	ldrb r0, [r3]
	ldrb r2, [r2]
	cmp r0, r2
	bcs _0807BFD6
	bl snowflake_add
	b _0807BFDA
_0807BFD6:
	bl snowflake_remove
_0807BFDA:
	ldr r0, _0807BFF8 @ =gUnknown_83C2BBC
	ldr r0, [r0]
	ldr r2, _0807BFFC @ =0x000006e4
	adds r1, r0, r2
	ldr r4, _0807C000 @ =0x000006e5
	adds r0, r4
	ldrb r1, [r1]
	ldrb r0, [r0]
	eors r1, r0
	negs r0, r1
	orrs r0, r1
	lsrs r0, 31
_0807BFF2:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0807BFF8: .4byte gUnknown_83C2BBC
_0807BFFC: .4byte 0x000006e4
_0807C000: .4byte 0x000006e5
	thumb_func_end snowflakes_progress

	thumb_func_start snowflake_add
snowflake_add: @ 807C004
	push {r4-r6,lr}
	ldr r0, _0807C058 @ =gUnknown_83C6704
	movs r1, 0
	movs r2, 0
	movs r3, 0x4E
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x40
	beq _0807C068
	ldr r0, _0807C05C @ =gSprites
	lsls r4, r1, 4
	adds r4, r1
	lsls r4, 2
	adds r4, r0
	ldr r0, _0807C060 @ =gUnknown_83C2BBC
	ldr r5, [r0]
	ldr r0, _0807C064 @ =0x000006e4
	adds r6, r5, r0
	ldrb r0, [r6]
	strh r0, [r4, 0x36]
	adds r0, r4, 0
	bl sub_807C0A4
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r2]
	ldrb r0, [r6]
	adds r1, r0, 0x1
	strb r1, [r6]
	lsls r0, 24
	lsrs r0, 22
	adds r5, 0x60
	adds r5, r0
	str r4, [r5]
	movs r0, 0x1
	b _0807C06A
	.align 2, 0
_0807C058: .4byte gUnknown_83C6704
_0807C05C: .4byte gSprites
_0807C060: .4byte gUnknown_83C2BBC
_0807C064: .4byte 0x000006e4
_0807C068:
	movs r0, 0
_0807C06A:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end snowflake_add

	thumb_func_start snowflake_remove
snowflake_remove: @ 807C070
	push {lr}
	ldr r0, _0807C084 @ =gUnknown_83C2BBC
	ldr r1, [r0]
	ldr r0, _0807C088 @ =0x000006e4
	adds r2, r1, r0
	ldrb r0, [r2]
	cmp r0, 0
	bne _0807C08C
	movs r0, 0
	b _0807C0A0
	.align 2, 0
_0807C084: .4byte gUnknown_83C2BBC
_0807C088: .4byte 0x000006e4
_0807C08C:
	subs r0, 0x1
	strb r0, [r2]
	lsls r0, 24
	lsrs r0, 22
	adds r1, 0x60
	adds r1, r0
	ldr r0, [r1]
	bl DestroySprite
	movs r0, 0x1
_0807C0A0:
	pop {r1}
	bx r1
	thumb_func_end snowflake_remove

	thumb_func_start sub_807C0A4
sub_807C0A4: @ 807C0A4
	push {r4-r7,lr}
	adds r5, r0, 0
	bl Random
	movs r1, 0x36
	ldrsh r2, [r5, r1]
	lsls r1, r2, 2
	adds r1, r2
	movs r2, 0x7
	ands r1, r2
	lsls r4, r1, 4
	subs r4, r1
	lsls r4, 1
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x1E
	bl __umodsi3
	adds r4, r0
	lsls r4, 16
	lsrs r4, 16
	ldr r1, _0807C148 @ =gSpriteCoordOffsetY
	adds r0, r5, 0
	adds r0, 0x29
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	ldrh r1, [r1]
	adds r0, r1
	movs r2, 0x3
	negs r2, r2
	adds r1, r2, 0
	subs r1, r0
	movs r7, 0
	strh r1, [r5, 0x22]
	ldr r1, _0807C14C @ =gSpriteCoordOffsetX
	adds r0, r5, 0
	adds r0, 0x28
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	ldrh r1, [r1]
	adds r0, r1
	subs r4, r0
	strh r4, [r5, 0x20]
	movs r1, 0x22
	ldrsh r0, [r5, r1]
	lsls r0, 7
	strh r0, [r5, 0x2E]
	strh r7, [r5, 0x24]
	bl Random
	lsls r0, 16
	lsrs r0, 16
	adds r6, r0, 0
	movs r4, 0x3
	ands r4, r6
	lsls r0, r4, 2
	adds r0, r4
	adds r0, 0x40
	strh r0, [r5, 0x30]
	strh r0, [r5, 0x3C]
	movs r1, 0x1
	bics r1, r6
	adds r0, r5, 0
	bl StartSpriteAnim
	strh r7, [r5, 0x34]
	movs r0, 0x1
	cmp r4, 0
	bne _0807C134
	movs r0, 0x2
_0807C134:
	strh r0, [r5, 0x32]
	movs r0, 0x1F
	ands r0, r6
	adds r0, 0xD2
	strh r0, [r5, 0x3A]
	strh r7, [r5, 0x38]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807C148: .4byte gSpriteCoordOffsetY
_0807C14C: .4byte gSpriteCoordOffsetX
	thumb_func_end sub_807C0A4

	thumb_func_start sub_807C150
sub_807C150: @ 807C150
	push {r4,lr}
	adds r3, r0, 0
	ldr r0, _0807C19C @ =gUnknown_83C2BBC
	ldr r0, [r0]
	ldr r1, _0807C1A0 @ =0x000006e2
	adds r4, r0, r1
	ldrh r0, [r4]
	cmp r0, 0x12
	bls _0807C196
	adds r2, r3, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	ldr r0, _0807C1A4 @ =sub_807C1AC
	str r0, [r3, 0x1C]
	ldr r1, _0807C1A8 @ =gSpriteCoordOffsetY
	adds r0, r3, 0
	adds r0, 0x29
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	ldrh r1, [r1]
	adds r0, r1
	movs r1, 0xFA
	subs r1, r0
	movs r2, 0
	strh r1, [r3, 0x22]
	movs r1, 0x22
	ldrsh r0, [r3, r1]
	lsls r0, 7
	strh r0, [r3, 0x2E]
	strh r2, [r4]
_0807C196:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807C19C: .4byte gUnknown_83C2BBC
_0807C1A0: .4byte 0x000006e2
_0807C1A4: .4byte sub_807C1AC
_0807C1A8: .4byte gSpriteCoordOffsetY
	thumb_func_end sub_807C150

	thumb_func_start sub_807C1AC
sub_807C1AC: @ 807C1AC
	push {r4,r5,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x30]
	ldrh r1, [r4, 0x2E]
	adds r0, r1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 23
	strh r0, [r4, 0x22]
	ldrh r0, [r4, 0x32]
	ldrh r2, [r4, 0x34]
	adds r0, r2
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x34]
	ldr r1, _0807C224 @ =gSineTable
	movs r3, 0x34
	ldrsh r0, [r4, r3]
	lsls r0, 1
	adds r0, r1
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bge _0807C1DE
	adds r0, 0x3F
_0807C1DE:
	asrs r0, 6
	strh r0, [r4, 0x24]
	adds r0, r4, 0
	adds r0, 0x28
	movs r5, 0
	ldrsb r5, [r0, r5]
	ldrh r0, [r4, 0x20]
	adds r0, r5
	ldr r1, _0807C228 @ =gSpriteCoordOffsetX
	ldrh r1, [r1]
	adds r3, r1, r0
	ldr r2, _0807C22C @ =0x000001ff
	adds r0, r2, 0
	ands r3, r0
	adds r2, r3, 0
	movs r0, 0x80
	lsls r0, 1
	ands r0, r2
	cmp r0, 0
	beq _0807C210
	ldr r3, _0807C230 @ =0xffffff00
	adds r0, r3, 0
	orrs r2, r0
	lsls r0, r2, 16
	lsrs r3, r0, 16
_0807C210:
	lsls r0, r3, 16
	asrs r0, 16
	movs r2, 0x3
	negs r2, r2
	cmp r0, r2
	bge _0807C234
	adds r1, r5
	movs r0, 0xF2
	subs r0, r1
	b _0807C23C
	.align 2, 0
_0807C224: .4byte gSineTable
_0807C228: .4byte gSpriteCoordOffsetX
_0807C22C: .4byte 0x000001ff
_0807C230: .4byte 0xffffff00
_0807C234:
	cmp r0, 0xF2
	ble _0807C23E
	adds r0, r1, r5
	subs r0, r2, r0
_0807C23C:
	strh r0, [r4, 0x20]
_0807C23E:
	adds r0, r4, 0
	adds r0, 0x29
	movs r3, 0
	ldrsb r3, [r0, r3]
	ldrh r0, [r4, 0x22]
	adds r0, r3
	ldr r1, _0807C27C @ =gSpriteCoordOffsetY
	ldrh r1, [r1]
	adds r2, r1, r0
	movs r0, 0xFF
	ands r2, r0
	adds r0, r2, 0
	subs r0, 0xA4
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x6
	bhi _0807C280
	adds r1, r3
	movs r0, 0xFA
	subs r0, r1
	movs r1, 0
	strh r0, [r4, 0x22]
	movs r2, 0x22
	ldrsh r0, [r4, r2]
	lsls r0, 7
	strh r0, [r4, 0x2E]
	strh r1, [r4, 0x38]
	movs r0, 0xDC
	strh r0, [r4, 0x3A]
	b _0807C2AC
	.align 2, 0
_0807C27C: .4byte gSpriteCoordOffsetY
_0807C280:
	adds r0, r2, 0
	subs r0, 0xF3
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x6
	bhi _0807C2AC
	movs r1, 0
	movs r0, 0xA3
	strh r0, [r4, 0x22]
	lsls r0, 7
	strh r0, [r4, 0x2E]
	strh r1, [r4, 0x38]
	movs r0, 0xDC
	strh r0, [r4, 0x3A]
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _0807C2E0 @ =sub_807C150
	str r0, [r4, 0x1C]
_0807C2AC:
	ldrh r0, [r4, 0x38]
	adds r0, 0x1
	strh r0, [r4, 0x38]
	lsls r0, 16
	asrs r0, 16
	movs r3, 0x3A
	ldrsh r1, [r4, r3]
	cmp r0, r1
	bne _0807C2D8
	adds r0, r4, 0
	bl sub_807C0A4
	movs r0, 0xFA
	strh r0, [r4, 0x22]
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _0807C2E0 @ =sub_807C150
	str r0, [r4, 0x1C]
_0807C2D8:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807C2E0: .4byte sub_807C150
	thumb_func_end sub_807C1AC

	thumb_func_start sub_807C2E4
sub_807C2E4: @ 807C2E4
	push {r4,r5,lr}
	ldr r0, _0807C33C @ =gUnknown_83C2BBC
	ldr r1, [r0]
	ldr r2, _0807C340 @ =0x000006cc
	adds r0, r1, r2
	movs r3, 0
	movs r2, 0
	strh r2, [r0]
	ldr r5, _0807C344 @ =0x000006d2
	adds r4, r1, r5
	strb r3, [r4]
	adds r5, 0x4
	adds r0, r1, r5
	strh r2, [r0]
	ldr r0, _0807C348 @ =0x000006db
	adds r2, r1, r0
	movs r0, 0x4
	strb r0, [r2]
	ldr r2, _0807C34C @ =0x000006dc
	adds r0, r1, r2
	strb r3, [r0]
	adds r5, 0x3
	adds r2, r1, r5
	movs r0, 0x10
	strb r0, [r2]
	ldr r0, _0807C350 @ =0x000006c1
	adds r2, r1, r0
	movs r0, 0x3
	strb r0, [r2]
	subs r5, 0x17
	adds r2, r1, r5
	movs r0, 0x14
	strb r0, [r2]
	strb r3, [r4]
	ldr r0, _0807C354 @ =0x000006ed
	adds r1, r0
	strb r3, [r1]
	movs r0, 0x4A
	bl SetRainStrengthFromSoundEffect
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807C33C: .4byte gUnknown_83C2BBC
_0807C340: .4byte 0x000006cc
_0807C344: .4byte 0x000006d2
_0807C348: .4byte 0x000006db
_0807C34C: .4byte 0x000006dc
_0807C350: .4byte 0x000006c1
_0807C354: .4byte 0x000006ed
	thumb_func_end sub_807C2E4

	thumb_func_start sub_807C358
sub_807C358: @ 807C358
	push {r4,lr}
	bl sub_807C2E4
	ldr r0, _0807C380 @ =gUnknown_83C2BBC
	ldr r1, [r0]
	ldr r2, _0807C384 @ =0x000006d2
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	bne _0807C378
	adds r4, r1, r2
_0807C36E:
	bl Rain_Main
	ldrb r0, [r4]
	cmp r0, 0
	beq _0807C36E
_0807C378:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807C380: .4byte gUnknown_83C2BBC
_0807C384: .4byte 0x000006d2
	thumb_func_end sub_807C358

	thumb_func_start sub_807C388
sub_807C388: @ 807C388
	push {r4,r5,lr}
	ldr r0, _0807C3DC @ =gUnknown_83C2BBC
	ldr r1, [r0]
	ldr r2, _0807C3E0 @ =0x000006cc
	adds r0, r1, r2
	movs r4, 0
	movs r2, 0
	strh r2, [r0]
	ldr r5, _0807C3E4 @ =0x000006d2
	adds r3, r1, r5
	strb r4, [r3]
	adds r5, 0x4
	adds r0, r1, r5
	strh r2, [r0]
	ldr r0, _0807C3E8 @ =0x000006db
	adds r2, r1, r0
	movs r0, 0x4
	strb r0, [r2]
	adds r5, 0x6
	adds r2, r1, r5
	movs r0, 0x1
	strb r0, [r2]
	ldr r0, _0807C3EC @ =0x000006d9
	adds r2, r1, r0
	movs r0, 0x18
	strb r0, [r2]
	subs r5, 0x1B
	adds r2, r1, r5
	movs r0, 0x3
	strb r0, [r2]
	ldr r0, _0807C3F0 @ =0x000006c2
	adds r1, r0
	movs r0, 0x14
	strb r0, [r1]
	strb r4, [r3]
	movs r0, 0x4C
	bl SetRainStrengthFromSoundEffect
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807C3DC: .4byte gUnknown_83C2BBC
_0807C3E0: .4byte 0x000006cc
_0807C3E4: .4byte 0x000006d2
_0807C3E8: .4byte 0x000006db
_0807C3EC: .4byte 0x000006d9
_0807C3F0: .4byte 0x000006c2
	thumb_func_end sub_807C388

	thumb_func_start sub_807C3F4
sub_807C3F4: @ 807C3F4
	push {r4,lr}
	bl sub_807C388
	ldr r0, _0807C41C @ =gUnknown_83C2BBC
	ldr r1, [r0]
	ldr r2, _0807C420 @ =0x000006d2
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	bne _0807C414
	adds r4, r1, r2
_0807C40A:
	bl Rain_Main
	ldrb r0, [r4]
	cmp r0, 0
	beq _0807C40A
_0807C414:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807C41C: .4byte gUnknown_83C2BBC
_0807C420: .4byte 0x000006d2
	thumb_func_end sub_807C3F4

	thumb_func_start Rain_Main
Rain_Main: @ 807C424
	push {r4,r5,lr}
	bl UpdateThunderSound
	ldr r0, _0807C444 @ =gUnknown_83C2BBC
	ldr r0, [r0]
	ldr r1, _0807C448 @ =0x000006cc
	adds r0, r1
	ldrh r0, [r0]
	cmp r0, 0xE
	bls _0807C43A
	b _0807C79A
_0807C43A:
	lsls r0, 2
	ldr r1, _0807C44C @ =_0807C450
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0807C444: .4byte gUnknown_83C2BBC
_0807C448: .4byte 0x000006cc
_0807C44C: .4byte _0807C450
	.align 2, 0
_0807C450:
	.4byte _0807C48C
	.4byte _0807C4A8
	.4byte _0807C4CC
	.4byte _0807C4FC
	.4byte _0807C520
	.4byte _0807C550
	.4byte _0807C580
	.4byte _0807C5AC
	.4byte _0807C5CA
	.4byte _0807C628
	.4byte _0807C6AC
	.4byte _0807C6D4
	.4byte _0807C704
	.4byte _0807C748
	.4byte _0807C77C
_0807C48C:
	bl LoadRainSpriteSheet
	ldr r0, _0807C4A0 @ =gUnknown_83C2BBC
	ldr r1, [r0]
	ldr r2, _0807C4A4 @ =0x000006cc
	adds r1, r2
	ldrh r0, [r1]
	adds r0, 0x1
	b _0807C798
	.align 2, 0
_0807C4A0: .4byte gUnknown_83C2BBC
_0807C4A4: .4byte 0x000006cc
_0807C4A8:
	bl CreateRainSprite
	lsls r0, 24
	cmp r0, 0
	beq _0807C4B4
	b _0807C79A
_0807C4B4:
	ldr r0, _0807C4C4 @ =gUnknown_83C2BBC
	ldr r1, [r0]
	ldr r3, _0807C4C8 @ =0x000006cc
	adds r1, r3
	ldrh r0, [r1]
	adds r0, 0x1
	b _0807C798
	.align 2, 0
_0807C4C4: .4byte gUnknown_83C2BBC
_0807C4C8: .4byte 0x000006cc
_0807C4CC:
	bl sub_807BD4C
	lsls r0, 24
	cmp r0, 0
	beq _0807C4D8
	b _0807C79A
_0807C4D8:
	ldr r0, _0807C4F0 @ =gUnknown_83C2BBC
	ldr r1, [r0]
	ldr r0, _0807C4F4 @ =0x000006d2
	adds r2, r1, r0
	movs r0, 0x1
	strb r0, [r2]
	ldr r2, _0807C4F8 @ =0x000006cc
	adds r1, r2
	ldrh r0, [r1]
	adds r0, 0x1
	b _0807C798
	.align 2, 0
_0807C4F0: .4byte gUnknown_83C2BBC
_0807C4F4: .4byte 0x000006d2
_0807C4F8: .4byte 0x000006cc
_0807C4FC:
	ldr r0, _0807C514 @ =gUnknown_83C2BBC
	ldr r1, [r0]
	ldr r3, _0807C518 @ =0x000006c6
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, 0
	bne _0807C50C
	b _0807C79A
_0807C50C:
	ldr r0, _0807C51C @ =0x000006cc
	adds r1, r0
	movs r0, 0x6
	b _0807C798
	.align 2, 0
_0807C514: .4byte gUnknown_83C2BBC
_0807C518: .4byte 0x000006c6
_0807C51C: .4byte 0x000006cc
_0807C520:
	ldr r0, _0807C570 @ =gUnknown_83C2BBC
	ldr r4, [r0]
	ldr r2, _0807C574 @ =0x000006ea
	adds r1, r4, r2
	movs r0, 0x1
	strb r0, [r1]
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r5, 0xB4
	lsls r5, 1
	adds r1, r5, 0
	bl __umodsi3
	adds r0, r5
	ldr r3, _0807C578 @ =0x000006e6
	adds r1, r4, r3
	strh r0, [r1]
	ldr r0, _0807C57C @ =0x000006cc
	adds r4, r0
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
_0807C550:
	ldr r0, _0807C570 @ =gUnknown_83C2BBC
	ldr r2, [r0]
	ldr r3, _0807C578 @ =0x000006e6
	adds r1, r2, r3
	ldrh r0, [r1]
	subs r0, 0x1
	strh r0, [r1]
	lsls r0, 16
	cmp r0, 0
	beq _0807C566
	b _0807C79A
_0807C566:
	ldr r0, _0807C57C @ =0x000006cc
	adds r1, r2, r0
	ldrh r0, [r1]
	adds r0, 0x1
	b _0807C798
	.align 2, 0
_0807C570: .4byte gUnknown_83C2BBC
_0807C574: .4byte 0x000006ea
_0807C578: .4byte 0x000006e6
_0807C57C: .4byte 0x000006cc
_0807C580:
	ldr r0, _0807C5A0 @ =gUnknown_83C2BBC
	ldr r4, [r0]
	ldr r1, _0807C5A4 @ =0x000006ea
	adds r0, r4, r1
	movs r5, 0x1
	strb r5, [r0]
	bl Random
	lsls r0, 16
	lsrs r0, 16
	ands r0, r5
	ldr r2, _0807C5A8 @ =0x000006eb
	adds r1, r4, r2
	strb r0, [r1]
	b _0807C608
	.align 2, 0
_0807C5A0: .4byte gUnknown_83C2BBC
_0807C5A4: .4byte 0x000006ea
_0807C5A8: .4byte 0x000006eb
_0807C5AC:
	bl Random
	ldr r1, _0807C614 @ =gUnknown_83C2BBC
	ldr r2, [r1]
	movs r1, 0x1
	ands r1, r0
	adds r1, 0x1
	ldr r3, _0807C618 @ =0x000006ec
	adds r0, r2, r3
	strb r1, [r0]
	ldr r0, _0807C61C @ =0x000006cc
	adds r2, r0
	ldrh r0, [r2]
	adds r0, 0x1
	strh r0, [r2]
_0807C5CA:
	movs r0, 0x13
	bl sub_807A790
	ldr r0, _0807C614 @ =gUnknown_83C2BBC
	ldr r1, [r0]
	ldr r2, _0807C620 @ =0x000006eb
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	bne _0807C5EE
	ldr r3, _0807C618 @ =0x000006ec
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _0807C5EE
	movs r0, 0x14
	bl SetThunderCounter
_0807C5EE:
	bl Random
	ldr r1, _0807C614 @ =gUnknown_83C2BBC
	ldr r4, [r1]
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x3
	bl __umodsi3
	adds r0, 0x6
	ldr r2, _0807C624 @ =0x000006e6
	adds r1, r4, r2
	strh r0, [r1]
_0807C608:
	ldr r3, _0807C61C @ =0x000006cc
	adds r4, r3
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	b _0807C79A
	.align 2, 0
_0807C614: .4byte gUnknown_83C2BBC
_0807C618: .4byte 0x000006ec
_0807C61C: .4byte 0x000006cc
_0807C620: .4byte 0x000006eb
_0807C624: .4byte 0x000006e6
_0807C628:
	ldr r0, _0807C674 @ =gUnknown_83C2BBC
	ldr r4, [r0]
	ldr r0, _0807C678 @ =0x000006e6
	adds r5, r4, r0
	ldrh r0, [r5]
	subs r0, 0x1
	strh r0, [r5]
	lsls r0, 16
	cmp r0, 0
	beq _0807C63E
	b _0807C79A
_0807C63E:
	movs r0, 0x3
	bl sub_807A790
	ldr r2, _0807C67C @ =0x000006ea
	adds r1, r4, r2
	movs r0, 0x1
	strb r0, [r1]
	ldr r3, _0807C680 @ =0x000006ec
	adds r1, r4, r3
	ldrb r0, [r1]
	subs r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	cmp r0, 0
	beq _0807C688
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0xF
	ands r0, r1
	adds r0, 0x3C
	strh r0, [r5]
	ldr r0, _0807C684 @ =0x000006cc
	adds r1, r4, r0
	movs r0, 0xA
	b _0807C798
	.align 2, 0
_0807C674: .4byte gUnknown_83C2BBC
_0807C678: .4byte 0x000006e6
_0807C67C: .4byte 0x000006ea
_0807C680: .4byte 0x000006ec
_0807C684: .4byte 0x000006cc
_0807C688:
	ldr r1, _0807C698 @ =0x000006eb
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _0807C6A0
	ldr r2, _0807C69C @ =0x000006cc
	adds r1, r4, r2
	b _0807C796
	.align 2, 0
_0807C698: .4byte 0x000006eb
_0807C69C: .4byte 0x000006cc
_0807C6A0:
	ldr r3, _0807C6A8 @ =0x000006cc
	adds r1, r4, r3
	movs r0, 0xB
	b _0807C798
	.align 2, 0
_0807C6A8: .4byte 0x000006cc
_0807C6AC:
	ldr r0, _0807C6C8 @ =gUnknown_83C2BBC
	ldr r2, [r0]
	ldr r0, _0807C6CC @ =0x000006e6
	adds r1, r2, r0
	ldrh r0, [r1]
	subs r0, 0x1
	strh r0, [r1]
	lsls r0, 16
	cmp r0, 0
	bne _0807C79A
	ldr r3, _0807C6D0 @ =0x000006cc
	adds r1, r2, r3
	movs r0, 0x8
	b _0807C798
	.align 2, 0
_0807C6C8: .4byte gUnknown_83C2BBC
_0807C6CC: .4byte 0x000006e6
_0807C6D0: .4byte 0x000006cc
_0807C6D4:
	bl Random
	ldr r1, _0807C6F8 @ =gUnknown_83C2BBC
	ldr r2, [r1]
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0xF
	ands r0, r1
	adds r0, 0x3C
	ldr r3, _0807C6FC @ =0x000006e6
	adds r1, r2, r3
	strh r0, [r1]
	ldr r0, _0807C700 @ =0x000006cc
	adds r2, r0
	ldrh r0, [r2]
	adds r0, 0x1
	strh r0, [r2]
	b _0807C79A
	.align 2, 0
_0807C6F8: .4byte gUnknown_83C2BBC
_0807C6FC: .4byte 0x000006e6
_0807C700: .4byte 0x000006cc
_0807C704:
	ldr r0, _0807C73C @ =gUnknown_83C2BBC
	ldr r5, [r0]
	ldr r1, _0807C740 @ =0x000006e6
	adds r4, r5, r1
	ldrh r0, [r4]
	subs r0, 0x1
	strh r0, [r4]
	lsls r0, 16
	cmp r0, 0
	bne _0807C79A
	movs r0, 0x64
	bl SetThunderCounter
	movs r0, 0x13
	bl sub_807A790
	bl Random
	movs r1, 0xF
	ands r1, r0
	adds r1, 0x1E
	strh r1, [r4]
	ldr r2, _0807C744 @ =0x000006cc
	adds r1, r5, r2
	ldrh r0, [r1]
	adds r0, 0x1
	b _0807C798
	.align 2, 0
_0807C73C: .4byte gUnknown_83C2BBC
_0807C740: .4byte 0x000006e6
_0807C744: .4byte 0x000006cc
_0807C748:
	ldr r0, _0807C770 @ =gUnknown_83C2BBC
	ldr r4, [r0]
	ldr r3, _0807C774 @ =0x000006e6
	adds r1, r4, r3
	ldrh r0, [r1]
	subs r0, 0x1
	strh r0, [r1]
	lsls r0, 16
	cmp r0, 0
	bne _0807C79A
	movs r0, 0x13
	movs r1, 0x3
	movs r2, 0x5
	bl sub_807A7C4
	ldr r0, _0807C778 @ =0x000006cc
	adds r1, r4, r0
	ldrh r0, [r1]
	adds r0, 0x1
	b _0807C798
	.align 2, 0
_0807C770: .4byte gUnknown_83C2BBC
_0807C774: .4byte 0x000006e6
_0807C778: .4byte 0x000006cc
_0807C77C:
	ldr r0, _0807C7A0 @ =gUnknown_83C2BBC
	ldr r2, [r0]
	ldr r1, _0807C7A4 @ =0x000006c6
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, 0x3
	bne _0807C79A
	ldr r3, _0807C7A8 @ =0x000006ea
	adds r1, r2, r3
	movs r0, 0x1
	strb r0, [r1]
	ldr r0, _0807C7AC @ =0x000006cc
	adds r1, r2, r0
_0807C796:
	movs r0, 0x4
_0807C798:
	strh r0, [r1]
_0807C79A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807C7A0: .4byte gUnknown_83C2BBC
_0807C7A4: .4byte 0x000006c6
_0807C7A8: .4byte 0x000006ea
_0807C7AC: .4byte 0x000006cc
	thumb_func_end Rain_Main

	thumb_func_start Rain_Finish
Rain_Finish: @ 807C7B0
	push {r4-r6,lr}
	ldr r0, _0807C7CC @ =gUnknown_83C2BBC
	ldr r6, [r0]
	ldr r0, _0807C7D0 @ =0x000006ce
	adds r5, r6, r0
	ldrh r1, [r5]
	cmp r1, 0x1
	beq _0807C7E6
	cmp r1, 0x1
	bgt _0807C7D4
	cmp r1, 0
	beq _0807C7DA
	b _0807C84C
	.align 2, 0
_0807C7CC: .4byte gUnknown_83C2BBC
_0807C7D0: .4byte 0x000006ce
_0807C7D4:
	cmp r1, 0x2
	beq _0807C830
	b _0807C84C
_0807C7DA:
	ldr r2, _0807C820 @ =0x000006ea
	adds r0, r6, r2
	strb r1, [r0]
	ldrh r0, [r5]
	adds r0, 0x1
	strh r0, [r5]
_0807C7E6:
	bl Rain_Main
	ldr r0, _0807C824 @ =gUnknown_83C2BBC
	ldr r2, [r0]
	ldr r1, _0807C820 @ =0x000006ea
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _0807C854
	subs r1, 0x19
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, 0x3
	beq _0807C84C
	cmp r0, 0x5
	beq _0807C84C
	cmp r0, 0xD
	beq _0807C84C
	ldr r0, _0807C828 @ =0x000006d9
	adds r1, r2, r0
	movs r0, 0
	strb r0, [r1]
	ldr r0, _0807C82C @ =0x000006ce
	adds r1, r2, r0
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	b _0807C854
	.align 2, 0
_0807C820: .4byte 0x000006ea
_0807C824: .4byte gUnknown_83C2BBC
_0807C828: .4byte 0x000006d9
_0807C82C: .4byte 0x000006ce
_0807C830:
	bl sub_807BD4C
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _0807C854
	bl DestroyRainSprites
	ldr r1, _0807C850 @ =0x000006ed
	adds r0, r6, r1
	strb r4, [r0]
	ldrh r0, [r5]
	adds r0, 0x1
	strh r0, [r5]
_0807C84C:
	movs r0, 0
	b _0807C856
	.align 2, 0
_0807C850: .4byte 0x000006ed
_0807C854:
	movs r0, 0x1
_0807C856:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end Rain_Finish

	thumb_func_start SetThunderCounter
SetThunderCounter: @ 807C85C
	push {r4-r6,lr}
	lsls r0, 16
	lsrs r6, r0, 16
	ldr r0, _0807C890 @ =gUnknown_83C2BBC
	ldr r4, [r0]
	ldr r0, _0807C894 @ =0x000006ed
	adds r5, r4, r0
	ldrb r0, [r5]
	cmp r0, 0
	bne _0807C88A
	bl Random
	lsls r0, 16
	lsrs r0, 16
	adds r1, r6, 0
	bl __umodsi3
	movs r2, 0xDD
	lsls r2, 3
	adds r1, r4, r2
	strh r0, [r1]
	movs r0, 0x1
	strb r0, [r5]
_0807C88A:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807C890: .4byte gUnknown_83C2BBC
_0807C894: .4byte 0x000006ed
	thumb_func_end SetThunderCounter

	thumb_func_start UpdateThunderSound
UpdateThunderSound: @ 807C898
	push {r4,lr}
	ldr r0, _0807C8D0 @ =gUnknown_83C2BBC
	ldr r1, [r0]
	ldr r2, _0807C8D4 @ =0x000006ed
	adds r0, r1, r2
	ldrb r4, [r0]
	cmp r4, 0x1
	bne _0807C8F8
	movs r0, 0xDD
	lsls r0, 3
	adds r1, r0
	ldrh r0, [r1]
	cmp r0, 0
	bne _0807C8F4
	bl IsSEPlaying
	lsls r0, 24
	cmp r0, 0
	bne _0807C8F8
	bl Random
	ands r4, r0
	cmp r4, 0
	beq _0807C8D8
	movs r0, 0x50
	bl PlaySE
	b _0807C8DE
	.align 2, 0
_0807C8D0: .4byte gUnknown_83C2BBC
_0807C8D4: .4byte 0x000006ed
_0807C8D8:
	movs r0, 0x51
	bl PlaySE
_0807C8DE:
	ldr r0, _0807C8EC @ =gUnknown_83C2BBC
	ldr r0, [r0]
	ldr r1, _0807C8F0 @ =0x000006ed
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
	b _0807C8F8
	.align 2, 0
_0807C8EC: .4byte gUnknown_83C2BBC
_0807C8F0: .4byte 0x000006ed
_0807C8F4:
	subs r0, 0x1
	strh r0, [r1]
_0807C8F8:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end UpdateThunderSound

	thumb_func_start Fog1_InitVars
Fog1_InitVars: @ 807C900
	push {lr}
	ldr r0, _0807C94C @ =gUnknown_83C2BBC
	ldr r3, [r0]
	ldr r0, _0807C950 @ =0x000006cc
	adds r1, r3, r0
	movs r2, 0
	movs r0, 0
	strh r0, [r1]
	ldr r1, _0807C954 @ =0x000006d2
	adds r0, r3, r1
	strb r2, [r0]
	subs r1, 0x11
	adds r0, r3, r1
	strb r2, [r0]
	ldr r2, _0807C958 @ =0x000006c2
	adds r1, r3, r2
	movs r0, 0x14
	strb r0, [r1]
	ldr r1, _0807C95C @ =0x000006fb
	adds r0, r3, r1
	ldrb r1, [r0]
	cmp r1, 0
	bne _0807C948
	adds r2, 0x2E
	adds r0, r3, r2
	strh r1, [r0]
	adds r2, 0x2
	adds r0, r3, r2
	strh r1, [r0]
	subs r2, 0x4
	adds r0, r3, r2
	strh r1, [r0]
	movs r0, 0
	movs r1, 0x10
	bl Weather_SetBlendCoeffs
_0807C948:
	pop {r0}
	bx r0
	.align 2, 0
_0807C94C: .4byte gUnknown_83C2BBC
_0807C950: .4byte 0x000006cc
_0807C954: .4byte 0x000006d2
_0807C958: .4byte 0x000006c2
_0807C95C: .4byte 0x000006fb
	thumb_func_end Fog1_InitVars

	thumb_func_start Fog1_InitAll
Fog1_InitAll: @ 807C960
	push {r4,lr}
	bl Fog1_InitVars
	ldr r0, _0807C988 @ =gUnknown_83C2BBC
	ldr r1, [r0]
	ldr r2, _0807C98C @ =0x000006d2
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	bne _0807C980
	adds r4, r1, r2
_0807C976:
	bl Fog1_Main
	ldrb r0, [r4]
	cmp r0, 0
	beq _0807C976
_0807C980:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807C988: .4byte gUnknown_83C2BBC
_0807C98C: .4byte 0x000006d2
	thumb_func_end Fog1_InitAll

	thumb_func_start Fog1_Main
Fog1_Main: @ 807C990
	push {r4-r6,lr}
	ldr r0, _0807C9DC @ =gUnknown_83C2BBC
	ldr r6, [r0]
	ldr r0, _0807C9E0 @ =gSpriteCoordOffsetX
	ldr r1, _0807C9E4 @ =0x000006f2
	adds r2, r6, r1
	ldrh r0, [r0]
	ldrh r1, [r2]
	subs r0, r1
	movs r1, 0xFF
	ands r0, r1
	ldr r3, _0807C9E8 @ =0x000006ee
	adds r1, r6, r3
	strh r0, [r1]
	movs r0, 0xDE
	lsls r0, 3
	adds r1, r6, r0
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x3
	bls _0807C9CA
	movs r0, 0
	strh r0, [r1]
	ldrh r0, [r2]
	adds r0, 0x1
	strh r0, [r2]
_0807C9CA:
	ldr r1, _0807C9EC @ =0x000006cc
	adds r5, r6, r1
	ldrh r4, [r5]
	cmp r4, 0
	beq _0807C9F0
	cmp r4, 0x1
	beq _0807CA30
	b _0807CA46
	.align 2, 0
_0807C9DC: .4byte gUnknown_83C2BBC
_0807C9E0: .4byte gSpriteCoordOffsetX
_0807C9E4: .4byte 0x000006f2
_0807C9E8: .4byte 0x000006ee
_0807C9EC: .4byte 0x000006cc
_0807C9F0:
	bl CreateFog1Sprites
	movs r3, 0xDA
	lsls r3, 3
	adds r0, r6, r3
	ldrb r0, [r0]
	cmp r0, 0x6
	bne _0807CA0C
	movs r0, 0xC
	movs r1, 0x8
	movs r2, 0x3
	bl Weather_SetTargetBlendCoeffs
	b _0807CA16
_0807CA0C:
	movs r0, 0x4
	movs r1, 0x10
	movs r2, 0
	bl Weather_SetTargetBlendCoeffs
_0807CA16:
	ldr r0, _0807CA28 @ =gUnknown_83C2BBC
	ldr r1, [r0]
	ldr r0, _0807CA2C @ =0x000006cc
	adds r1, r0
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	b _0807CA46
	.align 2, 0
_0807CA28: .4byte gUnknown_83C2BBC
_0807CA2C: .4byte 0x000006cc
_0807CA30:
	bl Weather_UpdateBlend
	lsls r0, 24
	cmp r0, 0
	beq _0807CA46
	ldr r1, _0807CA4C @ =0x000006d2
	adds r0, r6, r1
	strb r4, [r0]
	ldrh r0, [r5]
	adds r0, 0x1
	strh r0, [r5]
_0807CA46:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807CA4C: .4byte 0x000006d2
	thumb_func_end Fog1_Main

	thumb_func_start Fog1_Finish
Fog1_Finish: @ 807CA50
	push {r4,lr}
	ldr r0, _0807CAA0 @ =gUnknown_83C2BBC
	ldr r2, [r0]
	ldr r0, _0807CAA4 @ =gSpriteCoordOffsetX
	ldr r1, _0807CAA8 @ =0x000006f2
	adds r3, r2, r1
	ldrh r0, [r0]
	ldrh r1, [r3]
	subs r0, r1
	movs r1, 0xFF
	ands r0, r1
	ldr r4, _0807CAAC @ =0x000006ee
	adds r1, r2, r4
	strh r0, [r1]
	movs r0, 0xDE
	lsls r0, 3
	adds r1, r2, r0
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x3
	bls _0807CA8A
	movs r0, 0
	strh r0, [r1]
	ldrh r0, [r3]
	adds r0, 0x1
	strh r0, [r3]
_0807CA8A:
	ldr r1, _0807CAB0 @ =0x000006ce
	adds r4, r2, r1
	ldrh r0, [r4]
	cmp r0, 0x1
	beq _0807CAC6
	cmp r0, 0x1
	bgt _0807CAB4
	cmp r0, 0
	beq _0807CABA
	b _0807CADE
	.align 2, 0
_0807CAA0: .4byte gUnknown_83C2BBC
_0807CAA4: .4byte gSpriteCoordOffsetX
_0807CAA8: .4byte 0x000006f2
_0807CAAC: .4byte 0x000006ee
_0807CAB0: .4byte 0x000006ce
_0807CAB4:
	cmp r0, 0x2
	beq _0807CAD2
	b _0807CADE
_0807CABA:
	movs r0, 0
	movs r1, 0x10
	movs r2, 0x3
	bl Weather_SetTargetBlendCoeffs
	b _0807CAD6
_0807CAC6:
	bl Weather_UpdateBlend
	lsls r0, 24
	cmp r0, 0
	beq _0807CAE2
	b _0807CAD6
_0807CAD2:
	bl DestroyFog1Sprites
_0807CAD6:
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	b _0807CAE2
_0807CADE:
	movs r0, 0
	b _0807CAE4
_0807CAE2:
	movs r0, 0x1
_0807CAE4:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end Fog1_Finish

	thumb_func_start Fog1SpriteCallback
Fog1SpriteCallback: @ 807CAEC
	push {r4,lr}
	adds r3, r0, 0
	ldr r0, _0807CB38 @ =gSpriteCoordOffsetY
	ldrb r0, [r0]
	strh r0, [r3, 0x26]
	ldr r0, _0807CB3C @ =gUnknown_83C2BBC
	ldr r0, [r0]
	ldr r1, _0807CB40 @ =0x000006ee
	adds r2, r0, r1
	ldrh r1, [r2]
	adds r1, 0x20
	movs r4, 0x2E
	ldrsh r0, [r3, r4]
	lsls r0, 6
	adds r1, r0
	strh r1, [r3, 0x20]
	lsls r1, 16
	ldr r0, _0807CB44 @ =0x010f0000
	cmp r1, r0
	ble _0807CB30
	movs r0, 0xF0
	lsls r0, 1
	adds r1, r0, 0
	ldrh r2, [r2]
	adds r1, r2
	movs r4, 0x2E
	ldrsh r2, [r3, r4]
	movs r0, 0x4
	subs r0, r2
	lsls r0, 6
	subs r1, r0
	ldr r0, _0807CB48 @ =0x000001ff
	ands r1, r0
	strh r1, [r3, 0x20]
_0807CB30:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807CB38: .4byte gSpriteCoordOffsetY
_0807CB3C: .4byte gUnknown_83C2BBC
_0807CB40: .4byte 0x000006ee
_0807CB44: .4byte 0x010f0000
_0807CB48: .4byte 0x000001ff
	thumb_func_end Fog1SpriteCallback

	thumb_func_start CreateFog1Sprites
CreateFog1Sprites: @ 807CB4C
	push {r4,r5,lr}
	sub sp, 0x8
	ldr r0, _0807CBC0 @ =gUnknown_83C2BBC
	ldr r0, [r0]
	ldr r1, _0807CBC4 @ =0x000006fb
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _0807CBF6
	ldr r0, _0807CBC8 @ =gUnknown_83C67A8
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [sp]
	str r1, [sp, 0x4]
	mov r0, sp
	bl LoadSpriteSheet
	movs r5, 0
_0807CB70:
	ldr r0, _0807CBCC @ =gUnknown_83C6790
	movs r1, 0
	movs r2, 0
	movs r3, 0xFF
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _0807CBD4
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r0, _0807CBD0 @ =gSprites
	adds r4, r0
	adds r0, r5, 0
	movs r1, 0x5
	bl __umodsi3
	strh r0, [r4, 0x2E]
	lsls r0, 16
	lsrs r0, 10
	adds r0, 0x20
	strh r0, [r4, 0x20]
	adds r0, r5, 0
	movs r1, 0x5
	bl __udivsi3
	lsls r0, 16
	lsrs r0, 10
	adds r0, 0x20
	strh r0, [r4, 0x22]
	ldr r2, _0807CBC0 @ =gUnknown_83C2BBC
	ldr r0, [r2]
	lsls r1, r5, 2
	adds r0, 0xA0
	adds r0, r1
	str r4, [r0]
	b _0807CBE2
	.align 2, 0
_0807CBC0: .4byte gUnknown_83C2BBC
_0807CBC4: .4byte 0x000006fb
_0807CBC8: .4byte gUnknown_83C67A8
_0807CBCC: .4byte gUnknown_83C6790
_0807CBD0: .4byte gSprites
_0807CBD4:
	ldr r2, _0807CC00 @ =gUnknown_83C2BBC
	ldr r1, [r2]
	lsls r0, r5, 2
	adds r1, 0xA0
	adds r1, r0
	movs r0, 0
	str r0, [r1]
_0807CBE2:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x13
	bls _0807CB70
	ldr r0, [r2]
	ldr r1, _0807CC04 @ =0x000006fb
	adds r0, r1
	movs r1, 0x1
	strb r1, [r0]
_0807CBF6:
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807CC00: .4byte gUnknown_83C2BBC
_0807CC04: .4byte 0x000006fb
	thumb_func_end CreateFog1Sprites

	thumb_func_start DestroyFog1Sprites
DestroyFog1Sprites: @ 807CC08
	push {r4,r5,lr}
	ldr r0, _0807CC50 @ =gUnknown_83C2BBC
	ldr r1, [r0]
	ldr r2, _0807CC54 @ =0x000006fb
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	beq _0807CC48
	movs r4, 0
	adds r5, r1, 0
	adds r5, 0xA0
_0807CC1E:
	lsls r0, r4, 2
	adds r0, r5, r0
	ldr r0, [r0]
	cmp r0, 0
	beq _0807CC2C
	bl DestroySprite
_0807CC2C:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x13
	bls _0807CC1E
	ldr r0, _0807CC58 @ =0x00001201
	bl FreeSpriteTilesByTag
	ldr r0, _0807CC50 @ =gUnknown_83C2BBC
	ldr r0, [r0]
	ldr r1, _0807CC54 @ =0x000006fb
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
_0807CC48:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807CC50: .4byte gUnknown_83C2BBC
_0807CC54: .4byte 0x000006fb
_0807CC58: .4byte 0x00001201
	thumb_func_end DestroyFog1Sprites

	thumb_func_start Ash_InitVars
Ash_InitVars: @ 807CC5C
	push {lr}
	ldr r0, _0807CCA8 @ =gUnknown_83C2BBC
	ldr r1, [r0]
	ldr r0, _0807CCAC @ =0x000006cc
	adds r2, r1, r0
	movs r3, 0
	movs r0, 0
	strh r0, [r2]
	ldr r2, _0807CCB0 @ =0x000006d2
	adds r0, r1, r2
	strb r3, [r0]
	subs r2, 0x11
	adds r0, r1, r2
	strb r3, [r0]
	ldr r3, _0807CCB4 @ =0x000006c2
	adds r0, r1, r3
	movs r2, 0x14
	strb r2, [r0]
	adds r3, 0x3C
	adds r0, r1, r3
	strh r2, [r0]
	movs r0, 0xE0
	lsls r0, 3
	adds r1, r0
	ldrb r0, [r1]
	cmp r0, 0
	bne _0807CCA4
	movs r0, 0
	movs r1, 0x10
	bl Weather_SetBlendCoeffs
	movs r1, 0xFD
	lsls r1, 6
	movs r0, 0x52
	bl SetGpuReg
_0807CCA4:
	pop {r0}
	bx r0
	.align 2, 0
_0807CCA8: .4byte gUnknown_83C2BBC
_0807CCAC: .4byte 0x000006cc
_0807CCB0: .4byte 0x000006d2
_0807CCB4: .4byte 0x000006c2
	thumb_func_end Ash_InitVars

	thumb_func_start Ash_InitAll
Ash_InitAll: @ 807CCB8
	push {r4,lr}
	bl Ash_InitVars
	ldr r0, _0807CCE0 @ =gUnknown_83C2BBC
	ldr r1, [r0]
	ldr r2, _0807CCE4 @ =0x000006d2
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	bne _0807CCD8
	adds r4, r1, r2
_0807CCCE:
	bl Ash_Main
	ldrb r0, [r4]
	cmp r0, 0
	beq _0807CCCE
_0807CCD8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807CCE0: .4byte gUnknown_83C2BBC
_0807CCE4: .4byte 0x000006d2
	thumb_func_end Ash_InitAll

	thumb_func_start Ash_Main
Ash_Main: @ 807CCE8
	push {r4,r5,lr}
	ldr r2, _0807CD2C @ =gUnknown_83C2BBC
	ldr r1, [r2]
	ldr r0, _0807CD30 @ =gSpriteCoordOffsetX
	ldrh r0, [r0]
	ldr r3, _0807CD34 @ =0x000001ff
	ands r3, r0
	ldr r0, _0807CD38 @ =0x000006fc
	adds r1, r0
	strh r3, [r1]
	cmp r3, 0xEF
	bls _0807CD14
	adds r4, r1, 0
	adds r1, r3, 0
_0807CD04:
	adds r3, r1, 0
	subs r3, 0xF0
	adds r1, r3, 0
	lsls r0, r3, 16
	lsrs r0, 16
	cmp r0, 0xEF
	bhi _0807CD04
	strh r3, [r4]
_0807CD14:
	ldr r5, [r2]
	ldr r1, _0807CD3C @ =0x000006cc
	adds r4, r5, r1
	ldrh r0, [r4]
	cmp r0, 0x1
	beq _0807CD4C
	cmp r0, 0x1
	bgt _0807CD40
	cmp r0, 0
	beq _0807CD46
	b _0807CD88
	.align 2, 0
_0807CD2C: .4byte gUnknown_83C2BBC
_0807CD30: .4byte gSpriteCoordOffsetX
_0807CD34: .4byte 0x000001ff
_0807CD38: .4byte 0x000006fc
_0807CD3C: .4byte 0x000006cc
_0807CD40:
	cmp r0, 0x2
	beq _0807CD68
	b _0807CD88
_0807CD46:
	bl LoadAshSpriteSheet
	b _0807CD7A
_0807CD4C:
	movs r1, 0xE0
	lsls r1, 3
	adds r0, r5, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _0807CD5C
	bl CreateAshSprites
_0807CD5C:
	movs r0, 0x10
	movs r1, 0
	movs r2, 0x1
	bl Weather_SetTargetBlendCoeffs
	b _0807CD7A
_0807CD68:
	bl Weather_UpdateBlend
	lsls r0, 24
	cmp r0, 0
	beq _0807CD8C
	ldr r0, _0807CD84 @ =0x000006d2
	adds r1, r5, r0
	movs r0, 0x1
	strb r0, [r1]
_0807CD7A:
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	b _0807CD8C
	.align 2, 0
_0807CD84: .4byte 0x000006d2
_0807CD88:
	bl Weather_UpdateBlend
_0807CD8C:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end Ash_Main

	thumb_func_start Ash_Finish
Ash_Finish: @ 807CD94
	push {r4,lr}
	ldr r0, _0807CDB0 @ =gUnknown_83C2BBC
	ldr r0, [r0]
	ldr r1, _0807CDB4 @ =0x000006ce
	adds r4, r0, r1
	ldrh r0, [r4]
	cmp r0, 0x1
	beq _0807CDCA
	cmp r0, 0x1
	bgt _0807CDB8
	cmp r0, 0
	beq _0807CDBE
	b _0807CDEE
	.align 2, 0
_0807CDB0: .4byte gUnknown_83C2BBC
_0807CDB4: .4byte 0x000006ce
_0807CDB8:
	cmp r0, 0x2
	beq _0807CDE0
	b _0807CDEE
_0807CDBE:
	movs r0, 0
	movs r1, 0x10
	movs r2, 0x1
	bl Weather_SetTargetBlendCoeffs
	b _0807CDD8
_0807CDCA:
	bl Weather_UpdateBlend
	lsls r0, 24
	cmp r0, 0
	beq _0807CDF2
	bl DestroyAshSprites
_0807CDD8:
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	b _0807CDF2
_0807CDE0:
	movs r0, 0x52
	movs r1, 0
	bl SetGpuReg
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
_0807CDEE:
	movs r0, 0
	b _0807CDF4
_0807CDF2:
	movs r0, 0x1
_0807CDF4:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end Ash_Finish

	thumb_func_start LoadAshSpriteSheet
LoadAshSpriteSheet: @ 807CDFC
	push {lr}
	ldr r0, _0807CE08 @ =gUnknown_83C67B0
	bl LoadSpriteSheet
	pop {r0}
	bx r0
	.align 2, 0
_0807CE08: .4byte gUnknown_83C67B0
	thumb_func_end LoadAshSpriteSheet

	thumb_func_start CreateAshSprites
CreateAshSprites: @ 807CE0C
	push {r4,r5,lr}
	ldr r0, _0807CE78 @ =gUnknown_83C2BBC
	ldr r0, [r0]
	movs r1, 0xE0
	lsls r1, 3
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _0807CEA8
	movs r5, 0
_0807CE20:
	ldr r0, _0807CE7C @ =gUnknown_83C67D0
	movs r1, 0
	movs r2, 0
	movs r3, 0x4E
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _0807CE84
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r0, _0807CE80 @ =gSprites
	adds r4, r0
	movs r0, 0
	strh r0, [r4, 0x30]
	adds r0, r5, 0
	movs r1, 0x5
	bl __umodsi3
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x32]
	adds r0, r5, 0
	movs r1, 0x5
	bl __udivsi3
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x34]
	movs r1, 0x34
	ldrsh r0, [r4, r1]
	lsls r0, 6
	adds r0, 0x20
	strh r0, [r4, 0x2E]
	ldr r2, _0807CE78 @ =gUnknown_83C2BBC
	ldr r0, [r2]
	lsls r1, r5, 2
	adds r0, 0xF0
	adds r0, r1
	str r4, [r0]
	b _0807CE92
	.align 2, 0
_0807CE78: .4byte gUnknown_83C2BBC
_0807CE7C: .4byte gUnknown_83C67D0
_0807CE80: .4byte gSprites
_0807CE84:
	ldr r2, _0807CEB0 @ =gUnknown_83C2BBC
	ldr r1, [r2]
	lsls r0, r5, 2
	adds r1, 0xF0
	adds r1, r0
	movs r0, 0
	str r0, [r1]
_0807CE92:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x13
	bls _0807CE20
	ldr r0, [r2]
	movs r1, 0xE0
	lsls r1, 3
	adds r0, r1
	movs r1, 0x1
	strb r1, [r0]
_0807CEA8:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807CEB0: .4byte gUnknown_83C2BBC
	thumb_func_end CreateAshSprites

	thumb_func_start DestroyAshSprites
DestroyAshSprites: @ 807CEB4
	push {r4,r5,lr}
	ldr r0, _0807CF00 @ =gUnknown_83C2BBC
	ldr r1, [r0]
	movs r2, 0xE0
	lsls r2, 3
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	beq _0807CEF8
	movs r4, 0
	adds r5, r1, 0
	adds r5, 0xF0
_0807CECC:
	lsls r0, r4, 2
	adds r0, r5, r0
	ldr r0, [r0]
	cmp r0, 0
	beq _0807CEDA
	bl DestroySprite
_0807CEDA:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x13
	bls _0807CECC
	ldr r0, _0807CF04 @ =0x00001202
	bl FreeSpriteTilesByTag
	ldr r0, _0807CF00 @ =gUnknown_83C2BBC
	ldr r0, [r0]
	movs r1, 0xE0
	lsls r1, 3
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
_0807CEF8:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807CF00: .4byte gUnknown_83C2BBC
_0807CF04: .4byte 0x00001202
	thumb_func_end DestroyAshSprites

	thumb_func_start sub_807CF08
sub_807CF08: @ 807CF08
	push {r4,lr}
	adds r3, r0, 0
	ldrh r0, [r3, 0x30]
	adds r0, 0x1
	strh r0, [r3, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x5
	ble _0807CF24
	movs r0, 0
	strh r0, [r3, 0x30]
	ldrh r0, [r3, 0x2E]
	adds r0, 0x1
	strh r0, [r3, 0x2E]
_0807CF24:
	ldr r1, _0807CF70 @ =gSpriteCoordOffsetY
	ldrh r0, [r3, 0x2E]
	ldrh r1, [r1]
	adds r0, r1
	strh r0, [r3, 0x22]
	ldr r0, _0807CF74 @ =gUnknown_83C2BBC
	ldr r0, [r0]
	ldr r1, _0807CF78 @ =0x000006fc
	adds r2, r0, r1
	ldrh r1, [r2]
	adds r1, 0x20
	movs r4, 0x32
	ldrsh r0, [r3, r4]
	lsls r0, 6
	adds r1, r0
	strh r1, [r3, 0x20]
	lsls r1, 16
	ldr r0, _0807CF7C @ =0x010f0000
	cmp r1, r0
	ble _0807CF68
	movs r0, 0xF0
	lsls r0, 1
	adds r1, r0, 0
	ldrh r2, [r2]
	adds r1, r2
	movs r4, 0x32
	ldrsh r2, [r3, r4]
	movs r0, 0x4
	subs r0, r2
	lsls r0, 6
	subs r1, r0
	ldr r0, _0807CF80 @ =0x000001ff
	ands r1, r0
	strh r1, [r3, 0x20]
_0807CF68:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807CF70: .4byte gSpriteCoordOffsetY
_0807CF74: .4byte gUnknown_83C2BBC
_0807CF78: .4byte 0x000006fc
_0807CF7C: .4byte 0x010f0000
_0807CF80: .4byte 0x000001ff
	thumb_func_end sub_807CF08

	thumb_func_start Fog2_InitVars
Fog2_InitVars: @ 807CF84
	push {r4,lr}
	ldr r0, _0807CFF4 @ =gUnknown_83C2BBC
	ldr r3, [r0]
	ldr r1, _0807CFF8 @ =0x000006cc
	adds r0, r3, r1
	movs r1, 0
	movs r2, 0
	strh r2, [r0]
	ldr r4, _0807CFFC @ =0x000006d2
	adds r0, r3, r4
	strb r1, [r0]
	subs r4, 0x11
	adds r0, r3, r4
	strb r1, [r0]
	ldr r0, _0807D000 @ =0x000006c2
	adds r1, r3, r0
	movs r0, 0x14
	strb r0, [r1]
	movs r1, 0xDE
	lsls r1, 3
	adds r0, r3, r1
	strh r2, [r0]
	adds r4, 0x31
	adds r1, r3, r4
	movs r0, 0x1
	strh r0, [r1]
	ldr r1, _0807D004 @ =0x00000724
	adds r0, r3, r1
	ldrb r2, [r0]
	cmp r2, 0
	bne _0807CFEE
	adds r4, 0x2A
	adds r0, r3, r4
	strh r2, [r0]
	subs r1, 0x6
	adds r0, r3, r1
	strh r2, [r0]
	adds r4, 0x4
	adds r0, r3, r4
	strh r2, [r0]
	adds r1, 0x4
	adds r0, r3, r1
	strh r2, [r0]
	subs r4, 0x8
	adds r0, r3, r4
	strh r2, [r0]
	subs r1, 0x8
	adds r0, r3, r1
	strh r2, [r0]
	movs r0, 0
	movs r1, 0x10
	bl Weather_SetBlendCoeffs
_0807CFEE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807CFF4: .4byte gUnknown_83C2BBC
_0807CFF8: .4byte 0x000006cc
_0807CFFC: .4byte 0x000006d2
_0807D000: .4byte 0x000006c2
_0807D004: .4byte 0x00000724
	thumb_func_end Fog2_InitVars

	thumb_func_start Fog2_InitAll
Fog2_InitAll: @ 807D008
	push {r4,lr}
	bl Fog2_InitVars
	ldr r0, _0807D030 @ =gUnknown_83C2BBC
	ldr r1, [r0]
	ldr r2, _0807D034 @ =0x000006d2
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	bne _0807D028
	adds r4, r1, r2
_0807D01E:
	bl Fog2_Main
	ldrb r0, [r4]
	cmp r0, 0
	beq _0807D01E
_0807D028:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807D030: .4byte gUnknown_83C2BBC
_0807D034: .4byte 0x000006d2
	thumb_func_end Fog2_InitAll

	thumb_func_start Fog2_Main
Fog2_Main: @ 807D038
	push {r4,r5,lr}
	bl sub_807D0FC
	ldr r0, _0807D058 @ =gUnknown_83C2BBC
	ldr r5, [r0]
	ldr r0, _0807D05C @ =0x000006cc
	adds r4, r5, r0
	ldrh r0, [r4]
	cmp r0, 0x1
	beq _0807D06C
	cmp r0, 0x1
	bgt _0807D060
	cmp r0, 0
	beq _0807D066
	b _0807D090
	.align 2, 0
_0807D058: .4byte gUnknown_83C2BBC
_0807D05C: .4byte 0x000006cc
_0807D060:
	cmp r0, 0x2
	beq _0807D078
	b _0807D090
_0807D066:
	bl CreateFog2Sprites
	b _0807D08A
_0807D06C:
	movs r0, 0xC
	movs r1, 0x8
	movs r2, 0x8
	bl Weather_SetTargetBlendCoeffs
	b _0807D08A
_0807D078:
	bl Weather_UpdateBlend
	lsls r0, 24
	cmp r0, 0
	beq _0807D090
	ldr r0, _0807D098 @ =0x000006d2
	adds r1, r5, r0
	movs r0, 0x1
	strb r0, [r1]
_0807D08A:
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
_0807D090:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807D098: .4byte 0x000006d2
	thumb_func_end Fog2_Main

	thumb_func_start Fog2_Finish
Fog2_Finish: @ 807D09C
	push {r4,lr}
	bl sub_807D0FC
	ldr r0, _0807D0BC @ =gUnknown_83C2BBC
	ldr r0, [r0]
	ldr r1, _0807D0C0 @ =0x000006ce
	adds r4, r0, r1
	ldrh r0, [r4]
	cmp r0, 0x1
	beq _0807D0D6
	cmp r0, 0x1
	bgt _0807D0C4
	cmp r0, 0
	beq _0807D0CA
	b _0807D0EE
	.align 2, 0
_0807D0BC: .4byte gUnknown_83C2BBC
_0807D0C0: .4byte 0x000006ce
_0807D0C4:
	cmp r0, 0x2
	beq _0807D0E2
	b _0807D0EE
_0807D0CA:
	movs r0, 0
	movs r1, 0x10
	movs r2, 0x1
	bl Weather_SetTargetBlendCoeffs
	b _0807D0E6
_0807D0D6:
	bl Weather_UpdateBlend
	lsls r0, 24
	cmp r0, 0
	beq _0807D0F2
	b _0807D0E6
_0807D0E2:
	bl DestroyFog2Sprites
_0807D0E6:
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	b _0807D0F2
_0807D0EE:
	movs r0, 0
	b _0807D0F4
_0807D0F2:
	movs r0, 0x1
_0807D0F4:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end Fog2_Finish

	thumb_func_start sub_807D0FC
sub_807D0FC: @ 807D0FC
	push {r4,r5,lr}
	ldr r0, _0807D174 @ =gUnknown_83C2BBC
	ldr r3, [r0]
	ldr r0, _0807D178 @ =0x0000071c
	adds r2, r3, r0
	ldrh r0, [r2]
	adds r0, 0x1
	movs r5, 0
	strh r0, [r2]
	ldr r1, _0807D17C @ =0x0000ffff
	adds r4, r1, 0
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x2
	bls _0807D128
	movs r0, 0xE4
	lsls r0, 3
	adds r1, r3, r0
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	strh r5, [r2]
_0807D128:
	ldr r1, _0807D180 @ =0x0000071e
	adds r2, r3, r1
	ldrh r0, [r2]
	adds r0, 0x1
	strh r0, [r2]
	ands r0, r4
	cmp r0, 0x4
	bls _0807D144
	ldr r0, _0807D184 @ =0x00000722
	adds r1, r3, r0
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	strh r5, [r2]
_0807D144:
	ldr r0, _0807D188 @ =gSpriteCoordOffsetX
	movs r2, 0xE4
	lsls r2, 3
	adds r1, r3, r2
	ldrh r0, [r0]
	ldrh r1, [r1]
	subs r0, r1
	movs r1, 0xFF
	ands r0, r1
	subs r2, 0x8
	adds r1, r3, r2
	strh r0, [r1]
	ldr r1, _0807D18C @ =gSpriteCoordOffsetY
	adds r2, 0xA
	adds r0, r3, r2
	ldrh r0, [r0]
	ldrh r1, [r1]
	adds r0, r1
	subs r2, 0x8
	adds r1, r3, r2
	strh r0, [r1]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807D174: .4byte gUnknown_83C2BBC
_0807D178: .4byte 0x0000071c
_0807D17C: .4byte 0x0000ffff
_0807D180: .4byte 0x0000071e
_0807D184: .4byte 0x00000722
_0807D188: .4byte gSpriteCoordOffsetX
_0807D18C: .4byte gSpriteCoordOffsetY
	thumb_func_end sub_807D0FC

	thumb_func_start CreateFog2Sprites
CreateFog2Sprites: @ 807D190
	push {r4-r6,lr}
	sub sp, 0x8
	ldr r0, _0807D1FC @ =gUnknown_83C2BBC
	ldr r0, [r0]
	ldr r1, _0807D200 @ =0x00000724
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _0807D236
	ldr r0, _0807D204 @ =gUnknown_83C67E8
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [sp]
	str r1, [sp, 0x4]
	mov r0, sp
	bl LoadSpriteSheet
	movs r6, 0
_0807D1B4:
	adds r0, r6, 0
	movs r1, 0x5
	bl __udivsi3
	adds r5, r0, 0
	lsls r2, r5, 22
	asrs r2, 16
	ldr r0, _0807D208 @ =gUnknown_83C6804
	movs r1, 0
	movs r3, 0xFF
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _0807D210
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r0, _0807D20C @ =gSprites
	adds r4, r0
	adds r0, r6, 0
	movs r1, 0x5
	bl __umodsi3
	strh r0, [r4, 0x2E]
	strh r5, [r4, 0x30]
	ldr r2, _0807D1FC @ =gUnknown_83C2BBC
	ldr r0, [r2]
	lsls r1, r6, 2
	movs r3, 0xA0
	lsls r3, 1
	adds r0, r3
	adds r0, r1
	str r4, [r0]
	b _0807D222
	.align 2, 0
_0807D1FC: .4byte gUnknown_83C2BBC
_0807D200: .4byte 0x00000724
_0807D204: .4byte gUnknown_83C67E8
_0807D208: .4byte gUnknown_83C6804
_0807D20C: .4byte gSprites
_0807D210:
	ldr r2, _0807D240 @ =gUnknown_83C2BBC
	ldr r1, [r2]
	lsls r0, r6, 2
	movs r3, 0xA0
	lsls r3, 1
	adds r1, r3
	adds r1, r0
	movs r0, 0
	str r0, [r1]
_0807D222:
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r6, 0x13
	bls _0807D1B4
	ldr r0, [r2]
	ldr r1, _0807D244 @ =0x00000724
	adds r0, r1
	movs r1, 0x1
	strb r1, [r0]
_0807D236:
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807D240: .4byte gUnknown_83C2BBC
_0807D244: .4byte 0x00000724
	thumb_func_end CreateFog2Sprites

	thumb_func_start DestroyFog2Sprites
DestroyFog2Sprites: @ 807D248
	push {r4,r5,lr}
	ldr r0, _0807D290 @ =gUnknown_83C2BBC
	ldr r1, [r0]
	ldr r2, _0807D294 @ =0x00000724
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	beq _0807D28A
	movs r4, 0
	movs r0, 0xA0
	lsls r0, 1
	adds r5, r1, r0
_0807D260:
	lsls r0, r4, 2
	adds r0, r5, r0
	ldr r0, [r0]
	cmp r0, 0
	beq _0807D26E
	bl DestroySprite
_0807D26E:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x13
	bls _0807D260
	ldr r0, _0807D298 @ =0x00001203
	bl FreeSpriteTilesByTag
	ldr r0, _0807D290 @ =gUnknown_83C2BBC
	ldr r0, [r0]
	ldr r1, _0807D294 @ =0x00000724
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
_0807D28A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807D290: .4byte gUnknown_83C2BBC
_0807D294: .4byte 0x00000724
_0807D298: .4byte 0x00001203
	thumb_func_end DestroyFog2Sprites

	thumb_func_start Fog2SpriteCallback
Fog2SpriteCallback: @ 807D29C
	push {r4,lr}
	adds r3, r0, 0
	ldr r0, _0807D2EC @ =gUnknown_83C2BBC
	ldr r1, [r0]
	ldr r2, _0807D2F0 @ =0x0000071a
	adds r0, r1, r2
	ldrh r0, [r0]
	strh r0, [r3, 0x26]
	movs r4, 0xE3
	lsls r4, 3
	adds r2, r1, r4
	ldrh r1, [r2]
	adds r1, 0x20
	movs r4, 0x2E
	ldrsh r0, [r3, r4]
	lsls r0, 6
	adds r1, r0
	strh r1, [r3, 0x20]
	lsls r1, 16
	ldr r0, _0807D2F4 @ =0x010f0000
	cmp r1, r0
	ble _0807D2E4
	movs r0, 0xF0
	lsls r0, 1
	adds r1, r0, 0
	ldrh r2, [r2]
	adds r1, r2
	movs r4, 0x2E
	ldrsh r2, [r3, r4]
	movs r0, 0x4
	subs r0, r2
	lsls r0, 6
	subs r1, r0
	ldr r0, _0807D2F8 @ =0x000001ff
	ands r1, r0
	strh r1, [r3, 0x20]
_0807D2E4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807D2EC: .4byte gUnknown_83C2BBC
_0807D2F0: .4byte 0x0000071a
_0807D2F4: .4byte 0x010f0000
_0807D2F8: .4byte 0x000001ff
	thumb_func_end Fog2SpriteCallback

	thumb_func_start Sandstorm_InitVars
Sandstorm_InitVars: @ 807D2FC
	push {r4,lr}
	ldr r0, _0807D360 @ =gUnknown_83C2BBC
	ldr r3, [r0]
	ldr r0, _0807D364 @ =0x000006cc
	adds r1, r3, r0
	movs r2, 0
	movs r0, 0
	strh r0, [r1]
	ldr r1, _0807D368 @ =0x000006d2
	adds r0, r3, r1
	strb r2, [r0]
	ldr r4, _0807D36C @ =0x000006c1
	adds r0, r3, r4
	strb r2, [r0]
	ldr r0, _0807D370 @ =0x000006c2
	adds r1, r3, r0
	movs r0, 0x14
	strb r0, [r1]
	ldr r1, _0807D374 @ =0x00000716
	adds r0, r3, r1
	ldrb r2, [r0]
	cmp r2, 0
	bne _0807D358
	adds r4, 0x43
	adds r1, r3, r4
	adds r4, 0x4
	adds r0, r3, r4
	str r2, [r0]
	str r2, [r1]
	ldr r0, _0807D378 @ =0x00000712
	adds r1, r3, r0
	movs r0, 0x8
	strh r0, [r1]
	adds r4, 0xC
	adds r0, r3, r4
	strh r2, [r0]
	ldrh r2, [r1]
	cmp r2, 0x5F
	bls _0807D350
	movs r0, 0x80
	subs r0, r2
	strh r0, [r1]
_0807D350:
	movs r0, 0
	movs r1, 0x10
	bl Weather_SetBlendCoeffs
_0807D358:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807D360: .4byte gUnknown_83C2BBC
_0807D364: .4byte 0x000006cc
_0807D368: .4byte 0x000006d2
_0807D36C: .4byte 0x000006c1
_0807D370: .4byte 0x000006c2
_0807D374: .4byte 0x00000716
_0807D378: .4byte 0x00000712
	thumb_func_end Sandstorm_InitVars

	thumb_func_start Sandstorm_InitAll
Sandstorm_InitAll: @ 807D37C
	push {r4,lr}
	bl Sandstorm_InitVars
	ldr r0, _0807D3A4 @ =gUnknown_83C2BBC
	ldr r1, [r0]
	ldr r2, _0807D3A8 @ =0x000006d2
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	bne _0807D39C
	adds r4, r1, r2
_0807D392:
	bl Sandstorm_Main
	ldrb r0, [r4]
	cmp r0, 0
	beq _0807D392
_0807D39C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807D3A4: .4byte gUnknown_83C2BBC
_0807D3A8: .4byte 0x000006d2
	thumb_func_end Sandstorm_InitAll

	thumb_func_start Sandstorm_Main
Sandstorm_Main: @ 807D3AC
	push {r4,r5,lr}
	bl sub_807D4C4
	bl sub_807D48C
	ldr r0, _0807D3DC @ =gUnknown_83C2BBC
	ldr r5, [r0]
	ldr r0, _0807D3E0 @ =0x00000712
	adds r1, r5, r0
	ldrh r0, [r1]
	cmp r0, 0x5F
	bls _0807D3C8
	movs r0, 0x20
	strh r0, [r1]
_0807D3C8:
	ldr r0, _0807D3E4 @ =0x000006cc
	adds r4, r5, r0
	ldrh r0, [r4]
	cmp r0, 0x1
	beq _0807D3F8
	cmp r0, 0x1
	bgt _0807D3E8
	cmp r0, 0
	beq _0807D3EE
	b _0807D41C
	.align 2, 0
_0807D3DC: .4byte gUnknown_83C2BBC
_0807D3E0: .4byte 0x00000712
_0807D3E4: .4byte 0x000006cc
_0807D3E8:
	cmp r0, 0x2
	beq _0807D404
	b _0807D41C
_0807D3EE:
	bl CreateSandstormSprites_1
	bl CreateSandstormSprites_2
	b _0807D416
_0807D3F8:
	movs r0, 0x10
	movs r1, 0
	movs r2, 0
	bl Weather_SetTargetBlendCoeffs
	b _0807D416
_0807D404:
	bl Weather_UpdateBlend
	lsls r0, 24
	cmp r0, 0
	beq _0807D41C
	ldr r0, _0807D424 @ =0x000006d2
	adds r1, r5, r0
	movs r0, 0x1
	strb r0, [r1]
_0807D416:
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
_0807D41C:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807D424: .4byte 0x000006d2
	thumb_func_end Sandstorm_Main

	thumb_func_start Sandstorm_Finish
Sandstorm_Finish: @ 807D428
	push {r4,lr}
	bl sub_807D4C4
	bl sub_807D48C
	ldr r0, _0807D44C @ =gUnknown_83C2BBC
	ldr r0, [r0]
	ldr r1, _0807D450 @ =0x000006ce
	adds r4, r0, r1
	ldrh r0, [r4]
	cmp r0, 0x1
	beq _0807D466
	cmp r0, 0x1
	bgt _0807D454
	cmp r0, 0
	beq _0807D45A
	b _0807D47E
	.align 2, 0
_0807D44C: .4byte gUnknown_83C2BBC
_0807D450: .4byte 0x000006ce
_0807D454:
	cmp r0, 0x2
	beq _0807D472
	b _0807D47E
_0807D45A:
	movs r0, 0
	movs r1, 0x10
	movs r2, 0
	bl Weather_SetTargetBlendCoeffs
	b _0807D476
_0807D466:
	bl Weather_UpdateBlend
	lsls r0, 24
	cmp r0, 0
	beq _0807D482
	b _0807D476
_0807D472:
	bl sub_807D544
_0807D476:
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	b _0807D482
_0807D47E:
	movs r0, 0
	b _0807D484
_0807D482:
	movs r0, 0x1
_0807D484:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end Sandstorm_Finish

	thumb_func_start sub_807D48C
sub_807D48C: @ 807D48C
	push {lr}
	ldr r0, _0807D4B8 @ =gUnknown_83C2BBC
	ldr r2, [r0]
	ldr r0, _0807D4BC @ =0x00000714
	adds r3, r2, r0
	ldrh r0, [r3]
	adds r1, r0, 0x1
	strh r1, [r3]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x4
	bls _0807D4B2
	ldr r1, _0807D4C0 @ =0x00000712
	adds r0, r2, r1
	ldrh r1, [r0]
	adds r1, 0x1
	movs r2, 0
	strh r1, [r0]
	strh r2, [r3]
_0807D4B2:
	pop {r0}
	bx r0
	.align 2, 0
_0807D4B8: .4byte gUnknown_83C2BBC
_0807D4BC: .4byte 0x00000714
_0807D4C0: .4byte 0x00000712
	thumb_func_end sub_807D48C

	thumb_func_start sub_807D4C4
sub_807D4C4: @ 807D4C4
	push {r4-r6,lr}
	ldr r0, _0807D528 @ =gUnknown_83C2BBC
	ldr r2, [r0]
	ldr r0, _0807D52C @ =0x00000704
	adds r4, r2, r0
	ldr r6, _0807D530 @ =gSineTable
	ldr r1, _0807D534 @ =0x00000712
	adds r5, r2, r1
	ldrh r0, [r5]
	lsls r0, 1
	adds r0, r6
	movs r3, 0
	ldrsh r1, [r0, r3]
	lsls r1, 2
	ldr r0, [r4]
	subs r0, r1
	str r0, [r4]
	movs r0, 0xE1
	lsls r0, 3
	adds r3, r2, r0
	ldrh r0, [r5]
	lsls r0, 1
	adds r0, r6
	movs r5, 0
	ldrsh r1, [r0, r5]
	ldr r0, [r3]
	subs r0, r1
	str r0, [r3]
	ldr r1, _0807D538 @ =gSpriteCoordOffsetX
	ldr r0, [r4]
	lsrs r0, 8
	ldrh r1, [r1]
	adds r0, r1
	movs r1, 0xFF
	ands r0, r1
	ldr r4, _0807D53C @ =0x0000070e
	adds r1, r2, r4
	strh r0, [r1]
	ldr r1, _0807D540 @ =gSpriteCoordOffsetY
	ldr r0, [r3]
	lsrs r0, 8
	ldrh r1, [r1]
	adds r0, r1
	movs r5, 0xE2
	lsls r5, 3
	adds r2, r5
	strh r0, [r2]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807D528: .4byte gUnknown_83C2BBC
_0807D52C: .4byte 0x00000704
_0807D530: .4byte gSineTable
_0807D534: .4byte 0x00000712
_0807D538: .4byte gSpriteCoordOffsetX
_0807D53C: .4byte 0x0000070e
_0807D540: .4byte gSpriteCoordOffsetY
	thumb_func_end sub_807D4C4

	thumb_func_start sub_807D544
sub_807D544: @ 807D544
	push {r4,r5,lr}
	ldr r0, _0807D5C8 @ =gUnknown_83C2BBC
	ldr r1, [r0]
	ldr r2, _0807D5CC @ =0x00000716
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	beq _0807D586
	movs r4, 0
	movs r0, 0xC8
	lsls r0, 1
	adds r5, r1, r0
_0807D55C:
	lsls r0, r4, 2
	adds r0, r5, r0
	ldr r0, [r0]
	cmp r0, 0
	beq _0807D56A
	bl DestroySprite
_0807D56A:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x13
	bls _0807D55C
	ldr r0, _0807D5C8 @ =gUnknown_83C2BBC
	ldr r0, [r0]
	ldr r1, _0807D5CC @ =0x00000716
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
	ldr r0, _0807D5D0 @ =0x00001204
	bl FreeSpriteTilesByTag
_0807D586:
	ldr r0, _0807D5C8 @ =gUnknown_83C2BBC
	ldr r1, [r0]
	ldr r2, _0807D5D4 @ =0x00000717
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	beq _0807D5C0
	movs r4, 0
	movs r0, 0xF0
	lsls r0, 1
	adds r5, r1, r0
_0807D59C:
	lsls r0, r4, 2
	adds r0, r5, r0
	ldr r0, [r0]
	cmp r0, 0
	beq _0807D5AA
	bl DestroySprite
_0807D5AA:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x4
	bls _0807D59C
	ldr r0, _0807D5C8 @ =gUnknown_83C2BBC
	ldr r0, [r0]
	ldr r1, _0807D5D4 @ =0x00000717
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
_0807D5C0:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807D5C8: .4byte gUnknown_83C2BBC
_0807D5CC: .4byte 0x00000716
_0807D5D0: .4byte 0x00001204
_0807D5D4: .4byte 0x00000717
	thumb_func_end sub_807D544

	thumb_func_start CreateSandstormSprites_1
CreateSandstormSprites_1: @ 807D5D8
	push {r4-r7,lr}
	sub sp, 0x4
	ldr r0, _0807D648 @ =gUnknown_83C2BBC
	ldr r0, [r0]
	ldr r1, _0807D64C @ =0x00000716
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _0807D686
	ldr r0, _0807D650 @ =gUnknown_83C6854
	bl LoadSpriteSheet
	ldr r0, _0807D654 @ =gUnknown_83C2D20
	bl sub_807ABC0
	movs r7, 0
_0807D5F8:
	adds r0, r7, 0
	movs r1, 0x5
	bl __udivsi3
	adds r6, r0, 0
	lsls r2, r6, 22
	asrs r2, 16
	ldr r0, _0807D658 @ =gUnknown_83C683C
	movs r1, 0
	movs r3, 0x1
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x40
	beq _0807D660
	ldr r2, _0807D648 @ =gUnknown_83C2BBC
	ldr r5, [r2]
	lsls r0, r7, 2
	movs r3, 0xC8
	lsls r3, 1
	adds r5, r3
	adds r5, r0
	lsls r4, r1, 4
	adds r4, r1
	lsls r4, 2
	ldr r0, _0807D65C @ =gSprites
	adds r4, r0
	str r4, [r5]
	adds r0, r7, 0
	movs r1, 0x5
	str r2, [sp]
	bl __umodsi3
	strh r0, [r4, 0x2E]
	ldr r0, [r5]
	strh r6, [r0, 0x30]
	ldr r2, [sp]
	b _0807D672
	.align 2, 0
_0807D648: .4byte gUnknown_83C2BBC
_0807D64C: .4byte 0x00000716
_0807D650: .4byte gUnknown_83C6854
_0807D654: .4byte gUnknown_83C2D20
_0807D658: .4byte gUnknown_83C683C
_0807D65C: .4byte gSprites
_0807D660:
	ldr r2, _0807D690 @ =gUnknown_83C2BBC
	ldr r1, [r2]
	lsls r0, r7, 2
	movs r3, 0xC8
	lsls r3, 1
	adds r1, r3
	adds r1, r0
	movs r0, 0
	str r0, [r1]
_0807D672:
	adds r0, r7, 0x1
	lsls r0, 16
	lsrs r7, r0, 16
	cmp r7, 0x13
	bls _0807D5F8
	ldr r0, [r2]
	ldr r1, _0807D694 @ =0x00000716
	adds r0, r1
	movs r1, 0x1
	strb r1, [r0]
_0807D686:
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807D690: .4byte gUnknown_83C2BBC
_0807D694: .4byte 0x00000716
	thumb_func_end CreateSandstormSprites_1

	thumb_func_start CreateSandstormSprites_2
CreateSandstormSprites_2: @ 807D698
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	ldr r4, _0807D740 @ =gUnknown_83C2BBC
	ldr r0, [r4]
	ldr r1, _0807D744 @ =0x00000717
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _0807D784
	movs r7, 0
	mov r9, r4
	movs r2, 0
	mov r10, r2
_0807D6B8:
	lsls r0, r7, 1
	mov r8, r0
	adds r6, r0, r7
	lsls r5, r6, 4
	adds r1, r5, 0
	adds r1, 0x18
	lsls r1, 16
	asrs r1, 16
	ldr r0, _0807D748 @ =gUnknown_83C683C
	movs r2, 0xD0
	movs r3, 0x1
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x40
	beq _0807D75C
	mov r2, r9
	ldr r4, [r2]
	lsls r0, r7, 2
	movs r2, 0xF0
	lsls r2, 1
	adds r4, r2
	adds r4, r0
	lsls r2, r1, 4
	adds r2, r1
	lsls r2, 2
	ldr r0, _0807D74C @ =gSprites
	adds r2, r0
	str r2, [r4]
	ldrb r1, [r2, 0x3]
	movs r0, 0x3F
	ands r0, r1
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2, 0x3]
	ldr r1, [r4]
	adds r0, r6, r5
	strh r0, [r1, 0x30]
	ldr r1, [r4]
	movs r0, 0x8
	strh r0, [r1, 0x2E]
	ldr r0, [r4]
	mov r1, r10
	strh r1, [r0, 0x32]
	ldr r1, [r4]
	ldr r0, _0807D750 @ =0x00006730
	strh r0, [r1, 0x36]
	ldr r1, [r4]
	ldr r0, _0807D754 @ =gUnknown_83C685C
	add r0, r8
	ldrh r0, [r0]
	strh r0, [r1, 0x34]
	ldr r0, [r4]
	movs r1, 0x1
	bl StartSpriteAnim
	ldr r0, [r4]
	movs r1, 0
	movs r2, 0x2
	movs r3, 0
	bl CalcCenterToCornerVec
	ldr r1, [r4]
	ldr r0, _0807D758 @ =SandstormSpriteCallback2
	str r0, [r1, 0x1C]
	b _0807D76E
	.align 2, 0
_0807D740: .4byte gUnknown_83C2BBC
_0807D744: .4byte 0x00000717
_0807D748: .4byte gUnknown_83C683C
_0807D74C: .4byte gSprites
_0807D750: .4byte 0x00006730
_0807D754: .4byte gUnknown_83C685C
_0807D758: .4byte SandstormSpriteCallback2
_0807D75C:
	mov r2, r9
	ldr r0, [r2]
	lsls r1, r7, 2
	movs r2, 0xF0
	lsls r2, 1
	adds r0, r2
	adds r0, r1
	mov r1, r10
	str r1, [r0]
_0807D76E:
	mov r2, r9
	ldr r0, [r2]
	ldr r1, _0807D794 @ =0x00000717
	adds r0, r1
	movs r1, 0x1
	strb r1, [r0]
	adds r0, r7, 0x1
	lsls r0, 16
	lsrs r7, r0, 16
	cmp r7, 0x4
	bls _0807D6B8
_0807D784:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807D794: .4byte 0x00000717
	thumb_func_end CreateSandstormSprites_2

	thumb_func_start SandstormSpriteCallback1
SandstormSpriteCallback1: @ 807D798
	push {r4,lr}
	adds r3, r0, 0
	ldr r0, _0807D7E8 @ =gUnknown_83C2BBC
	ldr r1, [r0]
	movs r2, 0xE2
	lsls r2, 3
	adds r0, r1, r2
	ldrh r0, [r0]
	strh r0, [r3, 0x26]
	ldr r4, _0807D7EC @ =0x0000070e
	adds r2, r1, r4
	ldrh r1, [r2]
	adds r1, 0x20
	movs r4, 0x2E
	ldrsh r0, [r3, r4]
	lsls r0, 6
	adds r1, r0
	strh r1, [r3, 0x20]
	lsls r1, 16
	ldr r0, _0807D7F0 @ =0x010f0000
	cmp r1, r0
	ble _0807D7E0
	movs r0, 0xF0
	lsls r0, 1
	adds r1, r0, 0
	ldrh r2, [r2]
	adds r1, r2
	movs r4, 0x2E
	ldrsh r2, [r3, r4]
	movs r0, 0x4
	subs r0, r2
	lsls r0, 6
	subs r1, r0
	ldr r0, _0807D7F4 @ =0x000001ff
	ands r1, r0
	strh r1, [r3, 0x20]
_0807D7E0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807D7E8: .4byte gUnknown_83C2BBC
_0807D7EC: .4byte 0x0000070e
_0807D7F0: .4byte 0x010f0000
_0807D7F4: .4byte 0x000001ff
	thumb_func_end SandstormSpriteCallback1

	thumb_func_start SandstormSpriteCallback2
SandstormSpriteCallback2: @ 807D7F8
	push {lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x34]
	subs r0, 0x1
	strh r0, [r2, 0x34]
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	bne _0807D812
	ldr r0, _0807D818 @ =SandstormSpriteCallback3
	str r0, [r2, 0x1C]
_0807D812:
	pop {r0}
	bx r0
	.align 2, 0
_0807D818: .4byte SandstormSpriteCallback3
	thumb_func_end SandstormSpriteCallback2

	thumb_func_start SandstormSpriteCallback3
SandstormSpriteCallback3: @ 807D81C
	push {r4,r5,lr}
	adds r5, r0, 0
	ldrh r0, [r5, 0x22]
	subs r0, 0x1
	strh r0, [r5, 0x22]
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x30
	negs r1, r1
	cmp r0, r1
	bge _0807D83A
	movs r0, 0xD0
	strh r0, [r5, 0x22]
	movs r0, 0x4
	strh r0, [r5, 0x2E]
_0807D83A:
	movs r0, 0x2E
	ldrsh r4, [r5, r0]
	ldr r3, _0807D88C @ =gSineTable
	movs r2, 0x30
	ldrsh r1, [r5, r2]
	lsls r0, r1, 1
	adds r0, r3
	movs r2, 0
	ldrsh r0, [r0, r2]
	adds r2, r4, 0
	muls r2, r0
	adds r1, 0x40
	lsls r1, 1
	adds r1, r3
	movs r3, 0
	ldrsh r0, [r1, r3]
	muls r0, r4
	lsrs r2, 8
	strh r2, [r5, 0x24]
	lsrs r0, 8
	strh r0, [r5, 0x26]
	ldrh r0, [r5, 0x30]
	adds r0, 0xA
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r5, 0x30]
	ldrh r0, [r5, 0x32]
	adds r0, 0x1
	strh r0, [r5, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x8
	ble _0807D886
	movs r0, 0
	strh r0, [r5, 0x32]
	ldrh r0, [r5, 0x2E]
	adds r0, 0x1
	strh r0, [r5, 0x2E]
_0807D886:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807D88C: .4byte gSineTable
	thumb_func_end SandstormSpriteCallback3

	thumb_func_start Weather11_InitVars
Weather11_InitVars: @ 807D890
	ldr r0, _0807D8B0 @ =gUnknown_83C2BBC
	ldr r1, [r0]
	ldr r0, _0807D8B4 @ =0x000006cc
	adds r2, r1, r0
	movs r0, 0
	strh r0, [r2]
	ldr r0, _0807D8B8 @ =0x000006c1
	adds r2, r1, r0
	movs r0, 0x3
	strb r0, [r2]
	ldr r0, _0807D8BC @ =0x000006c2
	adds r1, r0
	movs r0, 0x14
	strb r0, [r1]
	bx lr
	.align 2, 0
_0807D8B0: .4byte gUnknown_83C2BBC
_0807D8B4: .4byte 0x000006cc
_0807D8B8: .4byte 0x000006c1
_0807D8BC: .4byte 0x000006c2
	thumb_func_end Weather11_InitVars

	thumb_func_start Weather11_InitAll
Weather11_InitAll: @ 807D8C0
	push {lr}
	bl Weather11_InitVars
	pop {r0}
	bx r0
	thumb_func_end Weather11_InitAll

	thumb_func_start nullsub_49
nullsub_49: @ 807D8CC
	bx lr
	thumb_func_end nullsub_49

	thumb_func_start sub_807D8D0
sub_807D8D0: @ 807D8D0
	movs r0, 0
	bx lr
	thumb_func_end sub_807D8D0

	thumb_func_start Bubbles_InitVars
Bubbles_InitVars: @ 807D8D4
	push {r4,r5,lr}
	bl Fog1_InitVars
	ldr r0, _0807D914 @ =gUnknown_83C2BBC
	ldr r4, [r0]
	ldr r1, _0807D918 @ =0x0000072e
	adds r0, r4, r1
	ldrb r5, [r0]
	cmp r5, 0
	bne _0807D90C
	ldr r0, _0807D91C @ =gUnknown_83C6870
	bl LoadSpriteSheet
	movs r2, 0xE5
	lsls r2, 3
	adds r0, r4, r2
	strh r5, [r0]
	ldr r0, _0807D920 @ =gUnknown_83C6868
	ldrb r1, [r0]
	subs r2, 0x2
	adds r0, r4, r2
	strh r1, [r0]
	ldr r1, _0807D924 @ =0x0000072a
	adds r0, r4, r1
	strh r5, [r0]
	adds r2, 0x6
	adds r0, r4, r2
	strh r5, [r0]
_0807D90C:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807D914: .4byte gUnknown_83C2BBC
_0807D918: .4byte 0x0000072e
_0807D91C: .4byte gUnknown_83C6870
_0807D920: .4byte gUnknown_83C6868
_0807D924: .4byte 0x0000072a
	thumb_func_end Bubbles_InitVars

	thumb_func_start Bubbles_InitAll
Bubbles_InitAll: @ 807D928
	push {r4,lr}
	bl Bubbles_InitVars
	ldr r0, _0807D950 @ =gUnknown_83C2BBC
	ldr r1, [r0]
	ldr r2, _0807D954 @ =0x000006d2
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	bne _0807D948
	adds r4, r1, r2
_0807D93E:
	bl Bubbles_Main
	ldrb r0, [r4]
	cmp r0, 0
	beq _0807D93E
_0807D948:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807D950: .4byte gUnknown_83C2BBC
_0807D954: .4byte 0x000006d2
	thumb_func_end Bubbles_InitAll

	thumb_func_start Bubbles_Main
Bubbles_Main: @ 807D958
	push {r4-r7,lr}
	bl Fog1_Main
	ldr r0, _0807D9B8 @ =gUnknown_83C2BBC
	ldr r5, [r0]
	ldr r0, _0807D9BC @ =0x00000726
	adds r4, r5, r0
	ldrh r0, [r4]
	adds r0, 0x1
	movs r6, 0
	strh r0, [r4]
	ldr r1, _0807D9C0 @ =0x0000ffff
	adds r7, r1, 0
	ldr r2, _0807D9C4 @ =gUnknown_83C6868
	movs r1, 0xE5
	lsls r1, 3
	adds r3, r5, r1
	ldrh r1, [r3]
	adds r1, r2
	lsls r0, 16
	lsrs r0, 16
	ldrb r1, [r1]
	cmp r0, r1
	bls _0807D9B0
	strh r6, [r4]
	ldrh r0, [r3]
	adds r0, 0x1
	strh r0, [r3]
	ands r0, r7
	cmp r0, 0x7
	bls _0807D998
	strh r6, [r3]
_0807D998:
	ldr r0, _0807D9C8 @ =0x0000072a
	adds r4, r5, r0
	ldrh r0, [r4]
	bl sub_807D9E8
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	ands r0, r7
	cmp r0, 0xC
	bls _0807D9B0
	strh r6, [r4]
_0807D9B0:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807D9B8: .4byte gUnknown_83C2BBC
_0807D9BC: .4byte 0x00000726
_0807D9C0: .4byte 0x0000ffff
_0807D9C4: .4byte gUnknown_83C6868
_0807D9C8: .4byte 0x0000072a
	thumb_func_end Bubbles_Main

	thumb_func_start Bubbles_Finish
Bubbles_Finish: @ 807D9CC
	push {lr}
	bl Fog1_Finish
	lsls r0, 24
	cmp r0, 0
	beq _0807D9DC
	movs r0, 0x1
	b _0807D9E2
_0807D9DC:
	bl sub_807DA70
	movs r0, 0
_0807D9E2:
	pop {r1}
	bx r1
	thumb_func_end Bubbles_Finish

	thumb_func_start sub_807D9E8
sub_807D9E8: @ 807D9E8
	push {r4,lr}
	lsls r0, 16
	ldr r1, _0807DA58 @ =gUnknown_83C6878
	lsrs r0, 14
	adds r3, r0, r1
	adds r1, 0x2
	adds r0, r1
	ldr r1, _0807DA5C @ =gSpriteCoordOffsetY
	ldrh r2, [r0]
	ldrh r0, [r1]
	subs r2, r0
	ldr r0, _0807DA60 @ =gUnknown_83C68BC
	movs r4, 0
	ldrsh r1, [r3, r4]
	lsls r2, 16
	asrs r2, 16
	movs r3, 0
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x40
	beq _0807DA50
	ldr r0, _0807DA64 @ =gSprites
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r0
	ldrb r2, [r1, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	movs r2, 0x4
	orrs r0, r2
	strb r0, [r1, 0x5]
	adds r3, r1, 0
	adds r3, 0x3E
	ldrb r0, [r3]
	movs r2, 0x2
	orrs r0, r2
	strb r0, [r3]
	movs r0, 0
	strh r0, [r1, 0x2E]
	strh r0, [r1, 0x30]
	strh r0, [r1, 0x32]
	ldr r0, _0807DA68 @ =gUnknown_83C2BBC
	ldr r1, [r0]
	ldr r0, _0807DA6C @ =0x0000072c
	adds r1, r0
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_0807DA50:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807DA58: .4byte gUnknown_83C6878
_0807DA5C: .4byte gSpriteCoordOffsetY
_0807DA60: .4byte gUnknown_83C68BC
_0807DA64: .4byte gSprites
_0807DA68: .4byte gUnknown_83C2BBC
_0807DA6C: .4byte 0x0000072c
	thumb_func_end sub_807D9E8

	thumb_func_start sub_807DA70
sub_807DA70: @ 807DA70
	push {r4,r5,lr}
	movs r4, 0
	ldr r5, _0807DAA8 @ =gSprites
_0807DA76:
	lsls r0, r4, 4
	adds r0, r4
	lsls r2, r0, 2
	adds r0, r5, 0
	adds r0, 0x14
	adds r0, r2, r0
	ldr r1, [r0]
	ldr r0, _0807DAAC @ =gUnknown_83C68BC
	cmp r1, r0
	bne _0807DA90
	adds r0, r2, r5
	bl DestroySprite
_0807DA90:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x3F
	bls _0807DA76
	ldr r0, _0807DAB0 @ =0x00001205
	bl FreeSpriteTilesByTag
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807DAA8: .4byte gSprites
_0807DAAC: .4byte gUnknown_83C68BC
_0807DAB0: .4byte 0x00001205
	thumb_func_end sub_807DA70

	thumb_func_start unc_0807DAB4
unc_0807DAB4: @ 807DAB4
	push {lr}
	adds r1, r0, 0
	ldrh r0, [r1, 0x2E]
	movs r2, 0
	adds r0, 0x2
	strh r0, [r1, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x8
	ble _0807DAF4
	strh r2, [r1, 0x2E]
	movs r3, 0x30
	ldrsh r0, [r1, r3]
	cmp r0, 0
	bne _0807DAE6
	ldrh r0, [r1, 0x24]
	adds r0, 0x1
	strh r0, [r1, 0x24]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	ble _0807DAF4
	movs r0, 0x1
	strh r0, [r1, 0x30]
	b _0807DAF4
_0807DAE6:
	ldrh r0, [r1, 0x24]
	subs r0, 0x1
	strh r0, [r1, 0x24]
	lsls r0, 16
	cmp r0, 0
	bgt _0807DAF4
	strh r2, [r1, 0x30]
_0807DAF4:
	ldrh r0, [r1, 0x22]
	subs r0, 0x3
	strh r0, [r1, 0x22]
	ldrh r0, [r1, 0x32]
	adds r0, 0x1
	strh r0, [r1, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x77
	ble _0807DB0E
	adds r0, r1, 0
	bl DestroySprite
_0807DB0E:
	pop {r0}
	bx r0
	thumb_func_end unc_0807DAB4

	.align 2, 0 @ Don't pad with nop.
