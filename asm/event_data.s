	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_806E0D0
sub_806E0D0: @ 806E0D0
	push {r4,lr}
	ldr r4, _0806E108 @ =gSaveBlock1Ptr
	ldr r0, [r4]
	movs r1, 0xEE
	lsls r1, 4
	adds r0, r1
	movs r2, 0x90
	lsls r2, 1
	movs r1, 0
	bl memset
	ldr r0, [r4]
	movs r1, 0x80
	lsls r1, 5
	adds r0, r1
	movs r2, 0x80
	lsls r2, 2
	movs r1, 0
	bl memset
	ldr r0, _0806E10C @ =gUnknown_20370E0
	movs r1, 0
	movs r2, 0x10
	bl memset
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806E108: .4byte gSaveBlock1Ptr
_0806E10C: .4byte gUnknown_20370E0
	thumb_func_end sub_806E0D0

	thumb_func_start sub_806E110
sub_806E110: @ 806E110
	push {lr}
	ldr r0, _0806E150 @ =gSaveBlock1Ptr
	ldr r0, [r0]
	movs r1, 0xEE
	lsls r1, 4
	adds r2, r0, r1
	movs r1, 0
	str r1, [r2]
	movs r1, 0x80
	lsls r1, 5
	adds r0, r1
	movs r1, 0
	movs r2, 0x20
	bl memset
	ldr r0, _0806E154 @ =0x00000803
	bl FlagClear
	ldr r0, _0806E158 @ =0x00000804
	bl FlagClear
	ldr r0, _0806E15C @ =0x00000805
	bl FlagClear
	ldr r0, _0806E160 @ =0x00000807
	bl FlagClear
	ldr r0, _0806E164 @ =0x00000842
	bl FlagClear
	pop {r0}
	bx r0
	.align 2, 0
_0806E150: .4byte gSaveBlock1Ptr
_0806E154: .4byte 0x00000803
_0806E158: .4byte 0x00000804
_0806E15C: .4byte 0x00000805
_0806E160: .4byte 0x00000807
_0806E164: .4byte 0x00000842
	thumb_func_end sub_806E110

	thumb_func_start sub_806E168
sub_806E168: @ 806E168
	push {lr}
	ldr r0, _0806E184 @ =0x0000403c
	bl sub_806E454
	ldr r1, _0806E188 @ =gSaveBlock2Ptr
	ldr r2, [r1]
	movs r1, 0
	strb r1, [r2, 0x1A]
	strh r1, [r0]
	ldr r0, _0806E18C @ =0x00000838
	bl FlagClear
	pop {r0}
	bx r0
	.align 2, 0
_0806E184: .4byte 0x0000403c
_0806E188: .4byte gSaveBlock2Ptr
_0806E18C: .4byte 0x00000838
	thumb_func_end sub_806E168

	thumb_func_start sub_806E190
sub_806E190: @ 806E190
	push {lr}
	ldr r0, _0806E1B0 @ =0x0000403c
	bl sub_806E454
	ldr r1, _0806E1B4 @ =gSaveBlock2Ptr
	ldr r2, [r1]
	movs r1, 0xDA
	strb r1, [r2, 0x1A]
	ldr r2, _0806E1B8 @ =0x00000302
	adds r1, r2, 0
	strh r1, [r0]
	ldr r0, _0806E1BC @ =0x00000838
	bl FlagSet
	pop {r0}
	bx r0
	.align 2, 0
_0806E1B0: .4byte 0x0000403c
_0806E1B4: .4byte gSaveBlock2Ptr
_0806E1B8: .4byte 0x00000302
_0806E1BC: .4byte 0x00000838
	thumb_func_end sub_806E190

	thumb_func_start sub_806E1C0
sub_806E1C0: @ 806E1C0
	push {lr}
	ldr r0, _0806E1EC @ =gSaveBlock2Ptr
	ldr r0, [r0]
	ldrb r0, [r0, 0x1A]
	cmp r0, 0xDA
	bne _0806E1FC
	ldr r0, _0806E1F0 @ =0x0000403c
	bl VarGet
	lsls r0, 16
	ldr r1, _0806E1F4 @ =0x03020000
	cmp r0, r1
	bne _0806E1FC
	ldr r0, _0806E1F8 @ =0x00000838
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _0806E1FC
	movs r0, 0x1
	b _0806E1FE
	.align 2, 0
_0806E1EC: .4byte gSaveBlock2Ptr
_0806E1F0: .4byte 0x0000403c
_0806E1F4: .4byte 0x03020000
_0806E1F8: .4byte 0x00000838
_0806E1FC:
	movs r0, 0
_0806E1FE:
	pop {r1}
	bx r1
	thumb_func_end sub_806E1C0

	thumb_func_start sub_806E204
sub_806E204: @ 806E204
	push {lr}
	ldr r0, _0806E224 @ =0x0000404e
	bl sub_806E454
	ldr r1, _0806E228 @ =gSaveBlock2Ptr
	ldr r2, [r1]
	movs r1, 0
	strb r1, [r2, 0x1B]
	strh r1, [r0]
	movs r0, 0x84
	lsls r0, 4
	bl FlagClear
	pop {r0}
	bx r0
	.align 2, 0
_0806E224: .4byte 0x0000404e
_0806E228: .4byte gSaveBlock2Ptr
	thumb_func_end sub_806E204

	thumb_func_start sub_806E22C
sub_806E22C: @ 806E22C
	push {lr}
	ldr r0, _0806E250 @ =0x0000404e
	bl sub_806E454
	ldr r1, _0806E254 @ =gSaveBlock2Ptr
	ldr r2, [r1]
	movs r1, 0xB9
	strb r1, [r2, 0x1B]
	ldr r2, _0806E258 @ =0x00006258
	adds r1, r2, 0
	strh r1, [r0]
	movs r0, 0x84
	lsls r0, 4
	bl FlagSet
	pop {r0}
	bx r0
	.align 2, 0
_0806E250: .4byte 0x0000404e
_0806E254: .4byte gSaveBlock2Ptr
_0806E258: .4byte 0x00006258
	thumb_func_end sub_806E22C

	thumb_func_start sub_806E25C
sub_806E25C: @ 806E25C
	push {lr}
	ldr r0, _0806E288 @ =gSaveBlock2Ptr
	ldr r0, [r0]
	ldrb r0, [r0, 0x1B]
	cmp r0, 0xB9
	bne _0806E294
	ldr r0, _0806E28C @ =0x0000404e
	bl VarGet
	lsls r0, 16
	ldr r1, _0806E290 @ =0x62580000
	cmp r0, r1
	bne _0806E294
	movs r0, 0x84
	lsls r0, 4
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _0806E294
	movs r0, 0x1
	b _0806E296
	.align 2, 0
_0806E288: .4byte gSaveBlock2Ptr
_0806E28C: .4byte 0x0000404e
_0806E290: .4byte 0x62580000
_0806E294:
	movs r0, 0
_0806E296:
	pop {r1}
	bx r1
	thumb_func_end sub_806E25C

	thumb_func_start sub_806E29C
sub_806E29C: @ 806E29C
	push {lr}
	ldr r0, _0806E2A8 @ =0x00000839
	bl FlagClear
	pop {r0}
	bx r0
	.align 2, 0
_0806E2A8: .4byte 0x00000839
	thumb_func_end sub_806E29C

	thumb_func_start sub_806E2AC
sub_806E2AC: @ 806E2AC
	push {lr}
	ldr r0, _0806E2B8 @ =0x00000839
	bl FlagSet
	pop {r0}
	bx r0
	.align 2, 0
_0806E2B8: .4byte 0x00000839
	thumb_func_end sub_806E2AC

	thumb_func_start sub_806E2BC
sub_806E2BC: @ 806E2BC
	push {lr}
	ldr r0, _0806E2CC @ =0x00000839
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_0806E2CC: .4byte 0x00000839
	thumb_func_end sub_806E2BC

	thumb_func_start sub_806E2D0
sub_806E2D0: @ 806E2D0
	push {lr}
	movs r0, 0xF6
	lsls r0, 2
	bl FlagClear
	ldr r0, _0806E340 @ =0x000003d9
	bl FlagClear
	ldr r0, _0806E344 @ =0x000003da
	bl FlagClear
	ldr r0, _0806E348 @ =0x000003db
	bl FlagClear
	movs r0, 0xF7
	lsls r0, 2
	bl FlagClear
	ldr r0, _0806E34C @ =0x000003dd
	bl FlagClear
	ldr r0, _0806E350 @ =0x000003de
	bl FlagClear
	ldr r0, _0806E354 @ =0x000003df
	bl FlagClear
	movs r0, 0xF8
	lsls r0, 2
	bl FlagClear
	ldr r0, _0806E358 @ =0x000003e1
	bl FlagClear
	ldr r0, _0806E35C @ =0x000003e2
	bl FlagClear
	ldr r0, _0806E360 @ =0x000003e3
	bl FlagClear
	movs r0, 0xF9
	lsls r0, 2
	bl FlagClear
	ldr r0, _0806E364 @ =0x000003e5
	bl FlagClear
	ldr r0, _0806E368 @ =0x000003e6
	bl FlagClear
	ldr r0, _0806E36C @ =0x000003e7
	bl FlagClear
	pop {r0}
	bx r0
	.align 2, 0
_0806E340: .4byte 0x000003d9
_0806E344: .4byte 0x000003da
_0806E348: .4byte 0x000003db
_0806E34C: .4byte 0x000003dd
_0806E350: .4byte 0x000003de
_0806E354: .4byte 0x000003df
_0806E358: .4byte 0x000003e1
_0806E35C: .4byte 0x000003e2
_0806E360: .4byte 0x000003e3
_0806E364: .4byte 0x000003e5
_0806E368: .4byte 0x000003e6
_0806E36C: .4byte 0x000003e7
	thumb_func_end sub_806E2D0

	thumb_func_start sub_806E370
sub_806E370: @ 806E370
	push {lr}
	ldr r0, _0806E3C0 @ =0x000040b5
	movs r1, 0
	bl VarSet
	ldr r0, _0806E3C4 @ =0x000040b6
	movs r1, 0
	bl VarSet
	ldr r0, _0806E3C8 @ =0x000040b7
	movs r1, 0
	bl VarSet
	ldr r0, _0806E3CC @ =0x000040b8
	movs r1, 0
	bl VarSet
	ldr r0, _0806E3D0 @ =0x000040b9
	movs r1, 0
	bl VarSet
	ldr r0, _0806E3D4 @ =0x000040ba
	movs r1, 0
	bl VarSet
	ldr r0, _0806E3D8 @ =0x000040bb
	movs r1, 0
	bl VarSet
	ldr r0, _0806E3DC @ =0x000040bc
	movs r1, 0
	bl VarSet
	ldr r0, _0806E3E0 @ =0x00004024
	movs r1, 0
	bl VarSet
	pop {r0}
	bx r0
	.align 2, 0
_0806E3C0: .4byte 0x000040b5
_0806E3C4: .4byte 0x000040b6
_0806E3C8: .4byte 0x000040b7
_0806E3CC: .4byte 0x000040b8
_0806E3D0: .4byte 0x000040b9
_0806E3D4: .4byte 0x000040ba
_0806E3D8: .4byte 0x000040bb
_0806E3DC: .4byte 0x000040bc
_0806E3E0: .4byte 0x00004024
	thumb_func_end sub_806E370

	thumb_func_start DisableResetRTC
DisableResetRTC: @ 806E3E4
	push {lr}
	ldr r0, _0806E3F8 @ =0x00004032
	movs r1, 0
	bl VarSet
	ldr r0, _0806E3FC @ =0x00000837
	bl FlagClear
	pop {r0}
	bx r0
	.align 2, 0
_0806E3F8: .4byte 0x00004032
_0806E3FC: .4byte 0x00000837
	thumb_func_end DisableResetRTC

	thumb_func_start EnableResetRTC
EnableResetRTC: @ 806E400
	push {lr}
	ldr r0, _0806E418 @ =0x00004032
	movs r1, 0x92
	lsls r1, 4
	bl VarSet
	ldr r0, _0806E41C @ =0x00000837
	bl FlagSet
	pop {r0}
	bx r0
	.align 2, 0
_0806E418: .4byte 0x00004032
_0806E41C: .4byte 0x00000837
	thumb_func_end EnableResetRTC

	thumb_func_start CanResetRTC
CanResetRTC: @ 806E420
	push {lr}
	ldr r0, _0806E444 @ =0x00000837
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _0806E44C
	ldr r0, _0806E448 @ =0x00004032
	bl VarGet
	lsls r0, 16
	movs r1, 0x92
	lsls r1, 20
	cmp r0, r1
	bne _0806E44C
	movs r0, 0x1
	b _0806E44E
	.align 2, 0
_0806E444: .4byte 0x00000837
_0806E448: .4byte 0x00004032
_0806E44C:
	movs r0, 0
_0806E44E:
	pop {r1}
	bx r1
	thumb_func_end CanResetRTC

	thumb_func_start sub_806E454
sub_806E454: @ 806E454
	push {r4-r6,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	adds r6, r4, 0
	ldr r0, _0806E468 @ =0x00003fff
	cmp r4, r0
	bhi _0806E46C
	movs r0, 0
	b _0806E518
	.align 2, 0
_0806E468: .4byte 0x00003fff
_0806E46C:
	lsls r0, r4, 16
	cmp r0, 0
	blt _0806E50C
	ldr r0, _0806E484 @ =gUnknown_3005E88
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _0806E488
	cmp r0, 0x1
	ble _0806E4EE
	cmp r0, 0x2
	beq _0806E4B8
	b _0806E4EE
	.align 2, 0
_0806E484: .4byte gUnknown_3005E88
_0806E488:
	movs r0, 0
	adds r1, r4, 0
	bl sub_8112D40
	adds r2, r0, 0
	cmp r2, 0
	beq _0806E4EE
	ldr r0, _0806E4B0 @ =gSaveBlock1Ptr
	ldr r1, [r0]
	ldr r3, _0806E4B4 @ =0xffffc000
	adds r0, r4, r3
	lsls r0, 1
	movs r3, 0x80
	lsls r3, 5
	adds r1, r3
	adds r1, r0
	ldrh r0, [r2]
	strh r0, [r1]
	b _0806E4EE
	.align 2, 0
_0806E4B0: .4byte gSaveBlock1Ptr
_0806E4B4: .4byte 0xffffc000
_0806E4B8:
	ldr r0, _0806E4FC @ =0xffffc000
	adds r5, r4, r0
	lsls r0, r5, 16
	lsrs r0, 16
	movs r1, 0x1
	bl sub_806E528
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806E4EE
	ldr r0, _0806E500 @ =gUnknown_300507C
	strh r5, [r0]
	ldr r0, _0806E504 @ =gSaveBlock1Ptr
	ldr r1, [r0]
	ldr r2, _0806E4FC @ =0xffffc000
	adds r0, r4, r2
	lsls r0, 1
	movs r3, 0x80
	lsls r3, 5
	adds r1, r3
	adds r1, r0
	ldrh r2, [r1]
	movs r0, 0
	adds r1, r4, 0
	bl sub_8112DB0
_0806E4EE:
	ldr r0, _0806E504 @ =gSaveBlock1Ptr
	lsls r1, r6, 1
	ldr r2, _0806E508 @ =0xffff9000
	adds r1, r2
	ldr r0, [r0]
	adds r0, r1
	b _0806E518
	.align 2, 0
_0806E4FC: .4byte 0xffffc000
_0806E500: .4byte gUnknown_300507C
_0806E504: .4byte gSaveBlock1Ptr
_0806E508: .4byte 0xffff9000
_0806E50C:
	ldr r0, _0806E520 @ =gUnknown_815FD0C
	ldr r3, _0806E524 @ =0xffff8000
	adds r1, r6, r3
	lsls r1, 2
	adds r1, r0
	ldr r0, [r1]
_0806E518:
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0806E520: .4byte gUnknown_815FD0C
_0806E524: .4byte 0xffff8000
	thumb_func_end sub_806E454

	thumb_func_start sub_806E528
sub_806E528: @ 806E528
	push {lr}
	lsls r0, 16
	lsrs r2, r0, 16
	adds r0, r2, 0
	lsls r1, 24
	cmp r1, 0
	bne _0806E554
	ldr r0, _0806E54C @ =0x0000022f
	cmp r2, r0
	bls _0806E548
	ldr r1, _0806E550 @ =0xfffff800
	adds r0, r2, r1
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1F
	bhi _0806E562
_0806E548:
	movs r0, 0
	b _0806E564
	.align 2, 0
_0806E54C: .4byte 0x0000022f
_0806E550: .4byte 0xfffff800
_0806E554:
	cmp r2, 0x2F
	bls _0806E548
	subs r0, 0x50
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x63
	bls _0806E548
_0806E562:
	movs r0, 0x1
_0806E564:
	pop {r1}
	bx r1
	thumb_func_end sub_806E528

	thumb_func_start VarGet
VarGet: @ 806E568
	push {r4,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	adds r0, r4, 0
	bl sub_806E454
	cmp r0, 0
	beq _0806E57C
	ldrh r0, [r0]
	b _0806E57E
_0806E57C:
	adds r0, r4, 0
_0806E57E:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end VarGet

	thumb_func_start VarSet
VarSet: @ 806E584
	push {r4,lr}
	lsls r0, 16
	lsrs r0, 16
	lsls r1, 16
	lsrs r4, r1, 16
	bl sub_806E454
	cmp r0, 0
	beq _0806E59C
	strh r4, [r0]
	movs r0, 0x1
	b _0806E59E
_0806E59C:
	movs r0, 0
_0806E59E:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end VarSet

	thumb_func_start VarGetFieldObjectGraphicsId
VarGetFieldObjectGraphicsId: @ 806E5A4
	push {lr}
	lsls r0, 24
	lsrs r0, 8
	ldr r1, _0806E5BC @ =0x40100000
	adds r0, r1
	lsrs r0, 16
	bl VarGet
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_0806E5BC: .4byte 0x40100000
	thumb_func_end VarGetFieldObjectGraphicsId

	thumb_func_start sub_806E5C0
sub_806E5C0: @ 806E5C0
	push {r4-r6,lr}
	lsls r5, r0, 16
	lsrs r4, r5, 16
	adds r6, r4, 0
	cmp r4, 0
	bne _0806E5D0
	movs r0, 0
	b _0806E66E
_0806E5D0:
	ldr r0, _0806E5E8 @ =0x00003fff
	cmp r4, r0
	bhi _0806E65C
	ldr r0, _0806E5EC @ =gUnknown_3005E88
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _0806E5F0
	cmp r0, 0x1
	ble _0806E644
	cmp r0, 0x2
	beq _0806E618
	b _0806E644
	.align 2, 0
_0806E5E8: .4byte 0x00003fff
_0806E5EC: .4byte gUnknown_3005E88
_0806E5F0:
	movs r0, 0x1
	adds r1, r4, 0
	bl sub_8112D40
	adds r2, r0, 0
	cmp r2, 0
	beq _0806E644
	ldr r0, _0806E614 @ =gSaveBlock1Ptr
	ldr r0, [r0]
	lsrs r1, r5, 19
	movs r3, 0xEE
	lsls r3, 4
	adds r0, r3
	adds r0, r1
	ldrb r1, [r2]
	strb r1, [r0]
	b _0806E644
	.align 2, 0
_0806E614: .4byte gSaveBlock1Ptr
_0806E618:
	adds r0, r4, 0
	movs r1, 0
	bl sub_806E528
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806E644
	ldr r0, _0806E654 @ =gUnknown_300507C
	strh r4, [r0]
	ldr r0, _0806E658 @ =gSaveBlock1Ptr
	ldr r0, [r0]
	lsrs r1, r5, 19
	movs r2, 0xEE
	lsls r2, 4
	adds r0, r2
	adds r0, r1
	ldrb r2, [r0]
	movs r0, 0x1
	adds r1, r4, 0
	bl sub_8112DB0
_0806E644:
	ldr r0, _0806E658 @ =gSaveBlock1Ptr
	lsrs r1, r6, 3
	movs r3, 0xEE
	lsls r3, 4
	adds r1, r3
	ldr r0, [r0]
	b _0806E66C
	.align 2, 0
_0806E654: .4byte gUnknown_300507C
_0806E658: .4byte gSaveBlock1Ptr
_0806E65C:
	ldr r1, _0806E674 @ =0xffffc000
	adds r0, r6, r1
	cmp r0, 0
	bge _0806E668
	ldr r2, _0806E678 @ =0xffffc007
	adds r0, r6, r2
_0806E668:
	asrs r0, 3
	ldr r1, _0806E67C @ =gUnknown_20370E0
_0806E66C:
	adds r0, r1
_0806E66E:
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0806E674: .4byte 0xffffc000
_0806E678: .4byte 0xffffc007
_0806E67C: .4byte gUnknown_20370E0
	thumb_func_end sub_806E5C0

	thumb_func_start FlagSet
FlagSet: @ 806E680
	push {r4,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	adds r0, r4, 0
	bl sub_806E5C0
	adds r2, r0, 0
	cmp r2, 0
	beq _0806E6A0
	movs r0, 0x7
	ands r0, r4
	movs r1, 0x1
	lsls r1, r0
	ldrb r0, [r2]
	orrs r1, r0
	strb r1, [r2]
_0806E6A0:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end FlagSet

	thumb_func_start FlagClear
FlagClear: @ 806E6A8
	push {r4,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	adds r0, r4, 0
	bl sub_806E5C0
	adds r2, r0, 0
	cmp r2, 0
	beq _0806E6C8
	movs r0, 0x7
	ands r0, r4
	movs r1, 0x1
	lsls r1, r0
	ldrb r0, [r2]
	bics r0, r1
	strb r0, [r2]
_0806E6C8:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end FlagClear

	thumb_func_start FlagGet
FlagGet: @ 806E6D0
	push {r4,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	adds r0, r4, 0
	bl sub_806E5C0
	cmp r0, 0
	beq _0806E6F4
	ldrb r0, [r0]
	movs r1, 0x7
	ands r1, r4
	asrs r0, r1
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0806E6F4
	movs r0, 0x1
	b _0806E6F6
_0806E6F4:
	movs r0, 0
_0806E6F6:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end FlagGet

	thumb_func_start sub_806E6FC
sub_806E6FC: @ 806E6FC
	ldr r1, _0806E754 @ =gUnknown_20370B8
	movs r0, 0
	strh r0, [r1]
	ldr r1, _0806E758 @ =gUnknown_20370BA
	strh r0, [r1]
	ldr r1, _0806E75C @ =gUnknown_20370BC
	strh r0, [r1]
	ldr r1, _0806E760 @ =gUnknown_20370BE
	strh r0, [r1]
	ldr r1, _0806E764 @ =gUnknown_20370C0
	strh r0, [r1]
	ldr r1, _0806E768 @ =gUnknown_20370C2
	strh r0, [r1]
	ldr r1, _0806E76C @ =gUnknown_20370C4
	strh r0, [r1]
	ldr r1, _0806E770 @ =gUnknown_20370C6
	strh r0, [r1]
	ldr r1, _0806E774 @ =gUnknown_20370C8
	strh r0, [r1]
	ldr r1, _0806E778 @ =gUnknown_20370CA
	strh r0, [r1]
	ldr r1, _0806E77C @ =gUnknown_20370CC
	strh r0, [r1]
	ldr r1, _0806E780 @ =gUnknown_20370CE
	strh r0, [r1]
	ldr r1, _0806E784 @ =gUnknown_20370D4
	strh r0, [r1]
	ldr r1, _0806E788 @ =gUnknown_20370D0
	strh r0, [r1]
	ldr r1, _0806E78C @ =gUnknown_203AD30
	strh r0, [r1]
	ldr r1, _0806E790 @ =gUnknown_20370D2
	strh r0, [r1]
	ldr r1, _0806E794 @ =gSpecialVar_MonBoxId
	strh r0, [r1]
	ldr r1, _0806E798 @ =gSpecialVar_MonBoxPos
	strh r0, [r1]
	ldr r1, _0806E79C @ =gUnknown_20370DA
	strh r0, [r1]
	ldr r1, _0806E7A0 @ =gUnknown_20370DC
	strh r0, [r1]
	ldr r1, _0806E7A4 @ =gUnknown_20370DE
	strh r0, [r1]
	bx lr
	.align 2, 0
_0806E754: .4byte gUnknown_20370B8
_0806E758: .4byte gUnknown_20370BA
_0806E75C: .4byte gUnknown_20370BC
_0806E760: .4byte gUnknown_20370BE
_0806E764: .4byte gUnknown_20370C0
_0806E768: .4byte gUnknown_20370C2
_0806E76C: .4byte gUnknown_20370C4
_0806E770: .4byte gUnknown_20370C6
_0806E774: .4byte gUnknown_20370C8
_0806E778: .4byte gUnknown_20370CA
_0806E77C: .4byte gUnknown_20370CC
_0806E780: .4byte gUnknown_20370CE
_0806E784: .4byte gUnknown_20370D4
_0806E788: .4byte gUnknown_20370D0
_0806E78C: .4byte gUnknown_203AD30
_0806E790: .4byte gUnknown_20370D2
_0806E794: .4byte gSpecialVar_MonBoxId
_0806E798: .4byte gSpecialVar_MonBoxPos
_0806E79C: .4byte gUnknown_20370DA
_0806E7A0: .4byte gUnknown_20370DC
_0806E7A4: .4byte gUnknown_20370DE
	thumb_func_end sub_806E6FC

	.align 2, 0 @ Don't pad with nop.
