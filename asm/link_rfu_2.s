	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_80FA0F8
sub_80FA0F8: @ 80FA0F8
	push {lr}
	ldr r1, _080FA110 @ =Rfu
	adds r1, 0x5A
	strb r0, [r1]
	movs r0, 0xA1
	lsls r0, 8
	bl sub_80F9D04
	movs r0, 0x1
	pop {r1}
	bx r1
	.align 2, 0
_080FA110: .4byte Rfu
	thumb_func_end sub_80FA0F8

	thumb_func_start sub_80FA114
sub_80FA114: @ 80FA114
	push {lr}
	bl rfu_clearAllSlot
	bl sub_80FD52C
	ldr r1, _080FA138 @ =gReceivedRemoteLinkPlayers
	movs r0, 0
	strb r0, [r1]
	ldr r2, _080FA13C @ =Rfu
	adds r3, r2, 0
	adds r3, 0xEF
	movs r1, 0
	movs r0, 0x1
	strb r0, [r3]
	str r1, [r2]
	pop {r0}
	bx r0
	.align 2, 0
_080FA138: .4byte gReceivedRemoteLinkPlayers
_080FA13C: .4byte Rfu
	thumb_func_end sub_80FA114

	thumb_func_start sub_80FA140
sub_80FA140: @ 80FA140
	push {lr}
	ldr r0, _080FA15C @ =gRfuLinkStatus
	ldr r0, [r0]
	ldrb r1, [r0, 0x2]
	ldrb r0, [r0, 0x3]
	orrs r0, r1
	bl rfu_REQ_disconnect
	bl rfu_waitREQComplete
	bl sub_80FA114
	pop {r0}
	bx r0
	.align 2, 0
_080FA15C: .4byte gRfuLinkStatus
	thumb_func_end sub_80FA140

	thumb_func_start sub_80FA160
sub_80FA160: @ 80FA160
	push {r4,lr}
	ldr r4, _080FA178 @ =Rfu
	ldrb r0, [r4, 0xC]
	cmp r0, 0
	bne _080FA180
	bl sub_80FEB14
	ldr r0, _080FA17C @ =0x0000099c
	adds r1, r4, r0
	movs r0, 0x2
	strb r0, [r1]
	b _080FA184
	.align 2, 0
_080FA178: .4byte Rfu
_080FA17C: .4byte 0x0000099c
_080FA180:
	ldr r0, _080FA18C @ =sub_80FA140
	str r0, [r4]
_080FA184:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080FA18C: .4byte sub_80FA140
	thumb_func_end sub_80FA160

	thumb_func_start sub_80FA190
sub_80FA190: @ 80FA190
	push {lr}
	bl sub_80FEB14
	ldr r2, _080FA1B4 @ =Rfu
	ldr r0, _080FA1B8 @ =0x0000099c
	adds r1, r2, r0
	movs r0, 0x1
	strb r0, [r1]
	ldr r0, _080FA1BC @ =gRfuLinkStatus
	ldr r1, [r0]
	ldrb r0, [r1, 0x2]
	ldrb r1, [r1, 0x3]
	orrs r0, r1
	ldr r1, _080FA1C0 @ =0x0000099b
	adds r2, r1
	strb r0, [r2]
	pop {r0}
	bx r0
	.align 2, 0
_080FA1B4: .4byte Rfu
_080FA1B8: .4byte 0x0000099c
_080FA1BC: .4byte gRfuLinkStatus
_080FA1C0: .4byte 0x0000099b
	thumb_func_end sub_80FA190

	thumb_func_start sub_80FA1C4
sub_80FA1C4: @ 80FA1C4
	push {r4,r5,lr}
	ldr r0, _080FA208 @ =Rfu
	ldrb r5, [r0, 0xD]
	movs r2, 0
	movs r1, 0
	adds r3, r0, 0
	adds r4, r3, 0
	adds r4, 0xE4
_080FA1D4:
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r0, 0
	beq _080FA1DE
	adds r2, 0x1
_080FA1DE:
	adds r1, 0x1
	cmp r1, 0x4
	ble _080FA1D4
	cmp r2, r5
	bne _080FA218
	ldr r2, _080FA20C @ =gBattleTypeFlags
	ldr r0, [r2]
	ldr r1, _080FA210 @ =0x0000ffdf
	ands r0, r1
	str r0, [r2]
	ldrb r0, [r3, 0xC]
	cmp r0, 0
	bne _080FA214
	adds r0, r3, 0
	adds r0, 0xEE
	ldrb r1, [r0]
	movs r1, 0x3
	strb r1, [r0]
	bl sub_80FA160
	b _080FA218
	.align 2, 0
_080FA208: .4byte Rfu
_080FA20C: .4byte gBattleTypeFlags
_080FA210: .4byte 0x0000ffdf
_080FA214:
	ldr r0, _080FA220 @ =sub_80FA160
	str r0, [r3]
_080FA218:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080FA220: .4byte sub_80FA160
	thumb_func_end sub_80FA1C4

	thumb_func_start sub_80FA224
sub_80FA224: @ 80FA224
	push {r4,lr}
	ldr r0, _080FA250 @ =gSendCmd
	ldrh r0, [r0]
	cmp r0, 0
	bne _080FA248
	ldr r4, _080FA254 @ =Rfu
	movs r1, 0x9A
	lsls r1, 4
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _080FA248
	movs r0, 0xBE
	lsls r0, 7
	bl sub_80F9D04
	ldr r0, _080FA258 @ =sub_80FA1C4
	str r0, [r4]
_080FA248:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080FA250: .4byte gSendCmd
_080FA254: .4byte Rfu
_080FA258: .4byte sub_80FA1C4
	thumb_func_end sub_80FA224

	thumb_func_start sub_80FA25C
sub_80FA25C: @ 80FA25C
	push {lr}
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r2, _080FA280 @ =Rfu
	ldr r0, [r2]
	cmp r0, 0
	bne _080FA27C
	ldr r1, _080FA284 @ =0x00000991
	adds r0, r2, r1
	movs r1, 0x1
	strb r1, [r0]
	ldr r0, _080FA288 @ =sub_80FA224
	str r0, [r2]
	adds r0, r3, 0
	bl DestroyTask
_080FA27C:
	pop {r0}
	bx r0
	.align 2, 0
_080FA280: .4byte Rfu
_080FA284: .4byte 0x00000991
_080FA288: .4byte sub_80FA224
	thumb_func_end sub_80FA25C

	thumb_func_start task_add_05_task_del_08FA224_when_no_RfuFunc
task_add_05_task_del_08FA224_when_no_RfuFunc: @ 80FA28C
	push {r4,lr}
	ldr r4, _080FA2AC @ =sub_80FA25C
	adds r0, r4, 0
	bl FuncIsActiveTask
	lsls r0, 24
	cmp r0, 0
	bne _080FA2A4
	adds r0, r4, 0
	movs r1, 0x5
	bl CreateTask
_080FA2A4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080FA2AC: .4byte sub_80FA25C
	thumb_func_end task_add_05_task_del_08FA224_when_no_RfuFunc

	thumb_func_start sub_80FA2B0
sub_80FA2B0: @ 80FA2B0
	push {r4,r5,lr}
	bl GetMultiplayerId
	lsls r0, 24
	cmp r0, 0
	beq _080FA2DE
	ldr r1, _080FA348 @ =Rfu
	ldr r2, _080FA34C @ =0x0000069e
	adds r0, r1, r2
	ldrb r0, [r0]
	adds r4, r0, 0
	cmp r4, 0
	bne _080FA2DE
	adds r5, r1, 0
	adds r5, 0xFE
	ldrh r0, [r5]
	cmp r0, 0x3C
	bls _080FA2DE
	movs r0, 0xCC
	lsls r0, 7
	bl sub_80F9D04
	strh r4, [r5]
_080FA2DE:
	bl GetLinkPlayerCount
	lsls r0, 24
	lsrs r2, r0, 24
	movs r1, 0
	cmp r1, r2
	bcs _080FA30A
	ldr r0, _080FA348 @ =Rfu
	adds r3, r0, 0
	adds r3, 0xE9
	ldrb r0, [r3]
	cmp r0, 0
	beq _080FA30A
_080FA2F8:
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, r2
	bcs _080FA30A
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, 0
	bne _080FA2F8
_080FA30A:
	ldr r4, _080FA348 @ =Rfu
	cmp r1, r2
	bne _080FA336
	movs r1, 0
	adds r3, r4, 0
	adds r3, 0xE9
	movs r2, 0
_080FA318:
	adds r0, r1, r3
	strb r2, [r0]
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x4
	bls _080FA318
	movs r1, 0x80
	lsls r1, 1
	adds r0, r4, r1
	ldrh r1, [r0]
	adds r1, 0x1
	movs r2, 0
	strh r1, [r0]
	str r2, [r4]
_080FA336:
	adds r1, r4, 0
	adds r1, 0xFE
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080FA348: .4byte Rfu
_080FA34C: .4byte 0x0000069e
	thumb_func_end sub_80FA2B0

	thumb_func_start sub_80FA350
sub_80FA350: @ 80FA350
	push {r4,lr}
	ldr r4, _080FA378 @ =Rfu
	ldr r1, _080FA37C @ =0x0000069e
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _080FA372
	ldr r0, _080FA380 @ =gSendCmd
	ldrh r0, [r0]
	cmp r0, 0
	bne _080FA372
	movs r0, 0xCC
	lsls r0, 7
	bl sub_80F9D04
	ldr r0, _080FA384 @ =sub_80FA2B0
	str r0, [r4]
_080FA372:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080FA378: .4byte Rfu
_080FA37C: .4byte 0x0000069e
_080FA380: .4byte gSendCmd
_080FA384: .4byte sub_80FA2B0
	thumb_func_end sub_80FA350

	thumb_func_start sub_80FA388
sub_80FA388: @ 80FA388
	push {r4,lr}
	bl GetMultiplayerId
	lsls r0, 24
	cmp r0, 0
	beq _080FA3C4
	ldr r4, _080FA3B4 @ =Rfu
	ldr r1, _080FA3B8 @ =0x0000069e
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _080FA416
	ldr r0, _080FA3BC @ =gSendCmd
	ldrh r0, [r0]
	cmp r0, 0
	bne _080FA416
	movs r0, 0xCC
	lsls r0, 7
	bl sub_80F9D04
	ldr r0, _080FA3C0 @ =sub_80FA2B0
	b _080FA414
	.align 2, 0
_080FA3B4: .4byte Rfu
_080FA3B8: .4byte 0x0000069e
_080FA3BC: .4byte gSendCmd
_080FA3C0: .4byte sub_80FA2B0
_080FA3C4:
	bl GetLinkPlayerCount
	lsls r0, 24
	lsrs r2, r0, 24
	movs r1, 0x1
	cmp r1, r2
	bcs _080FA3F2
	ldr r3, _080FA41C @ =Rfu
	adds r0, r3, 0
	adds r0, 0xEA
	ldrb r0, [r0]
	cmp r0, 0
	beq _080FA3F2
	adds r3, 0xE9
_080FA3E0:
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, r2
	bcs _080FA3F2
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, 0
	bne _080FA3E0
_080FA3F2:
	cmp r1, r2
	bne _080FA416
	ldr r4, _080FA41C @ =Rfu
	ldr r1, _080FA420 @ =0x0000069e
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _080FA416
	ldr r0, _080FA424 @ =gSendCmd
	ldrh r0, [r0]
	cmp r0, 0
	bne _080FA416
	movs r0, 0xCC
	lsls r0, 7
	bl sub_80F9D04
	ldr r0, _080FA428 @ =sub_80FA350
_080FA414:
	str r0, [r4]
_080FA416:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080FA41C: .4byte Rfu
_080FA420: .4byte 0x0000069e
_080FA424: .4byte gSendCmd
_080FA428: .4byte sub_80FA350
	thumb_func_end sub_80FA388

	thumb_func_start sub_80FA42C
sub_80FA42C: @ 80FA42C
	push {lr}
	ldr r1, _080FA444 @ =Rfu
	ldr r2, [r1]
	cmp r2, 0
	bne _080FA440
	ldr r0, _080FA448 @ =sub_80FA388
	str r0, [r1]
	adds r0, r1, 0
	adds r0, 0xFE
	strh r2, [r0]
_080FA440:
	pop {r0}
	bx r0
	.align 2, 0
_080FA444: .4byte Rfu
_080FA448: .4byte sub_80FA388
	thumb_func_end sub_80FA42C

	thumb_func_start sub_80FA44C
sub_80FA44C: @ 80FA44C
	push {r4,lr}
	adds r3, r0, 0
	ldr r1, _080FA468 @ =gUnknown_843EC8C
	ldrh r0, [r1]
	cmp r0, r3
	beq _080FA47A
	ldr r4, _080FA46C @ =0x0000ffff
	adds r2, r1, 0
_080FA45C:
	ldrh r0, [r2]
	cmp r0, r4
	bne _080FA470
	movs r0, 0
	b _080FA47C
	.align 2, 0
_080FA468: .4byte gUnknown_843EC8C
_080FA46C: .4byte 0x0000ffff
_080FA470:
	adds r1, 0x2
	adds r2, 0x2
	ldrh r0, [r1]
	cmp r0, r3
	bne _080FA45C
_080FA47A:
	movs r0, 0x1
_080FA47C:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80FA44C

	thumb_func_start sub_80FA484
sub_80FA484: @ 80FA484
	push {lr}
	cmp r0, 0
	beq _080FA498
	movs r1, 0x96
	lsls r1, 2
	movs r0, 0x1
	bl sub_80FEA34
	movs r0, 0
	b _080FA4A4
_080FA498:
	movs r0, 0
	movs r1, 0
	bl sub_80FEA34
	lsls r0, 24
	lsrs r0, 24
_080FA4A4:
	pop {r1}
	bx r1
	thumb_func_end sub_80FA484

	thumb_func_start sub_80FA4A8
sub_80FA4A8: @ 80FA4A8
	push {lr}
	ldr r0, _080FA4C0 @ =Rfu
	ldr r1, _080FA4C4 @ =0x00000991
	adds r0, r1
	movs r1, 0x1
	strb r1, [r0]
	movs r0, 0
	bl sub_80FD760
	pop {r0}
	bx r0
	.align 2, 0
_080FA4C0: .4byte Rfu
_080FA4C4: .4byte 0x00000991
	thumb_func_end sub_80FA4A8

	thumb_func_start rfu_get_multiplayer_id
rfu_get_multiplayer_id: @ 80FA4C8
	push {lr}
	ldr r1, _080FA4DC @ =Rfu
	ldrb r0, [r1, 0xC]
	cmp r0, 0x1
	beq _080FA4E4
	ldr r2, _080FA4E0 @ =0x00000986
	adds r0, r1, r2
	ldrb r0, [r0]
	b _080FA4E6
	.align 2, 0
_080FA4DC: .4byte Rfu
_080FA4E0: .4byte 0x00000986
_080FA4E4:
	movs r0, 0
_080FA4E6:
	pop {r1}
	bx r1
	thumb_func_end rfu_get_multiplayer_id

	thumb_func_start GetRfuPlayerCount
GetRfuPlayerCount: @ 80FA4EC
	ldr r0, _080FA4F4 @ =Rfu
	ldrb r0, [r0, 0xD]
	bx lr
	.align 2, 0
_080FA4F4: .4byte Rfu
	thumb_func_end GetRfuPlayerCount

	thumb_func_start IsLinkRfuTaskFinished
IsLinkRfuTaskFinished: @ 80FA4F8
	push {lr}
	movs r1, 0
	ldr r0, _080FA50C @ =Rfu
	ldr r0, [r0]
	cmp r0, 0
	bne _080FA506
	movs r1, 0x1
_080FA506:
	adds r0, r1, 0
	pop {r1}
	bx r1
	.align 2, 0
_080FA50C: .4byte Rfu
	thumb_func_end IsLinkRfuTaskFinished

	thumb_func_start sub_80FA510
sub_80FA510: @ 80FA510
	push {lr}
	ldr r0, _080FA524 @ =Rfu
	ldr r0, [r0]
	cmp r0, 0
	beq _080FA51E
	bl _call_via_r0
_080FA51E:
	pop {r0}
	bx r0
	.align 2, 0
_080FA524: .4byte Rfu
	thumb_func_end sub_80FA510

	thumb_func_start sub_80FA528
sub_80FA528: @ 80FA528
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	movs r7, 0
	movs r5, 0
	ldr r6, _080FA594 @ =Rfu
	ldr r0, _080FA598 @ =0x000008f6
	adds r0, r6
	mov r8, r0
_080FA53A:
	ldr r1, _080FA59C @ =0x00000989
	adds r0, r6, r1
	adds r4, r5, r0
	ldrb r0, [r4]
	subs r0, 0x5
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bls _080FA5C2
	ldr r1, _080FA5A0 @ =gRfuSlotStatusNI
	lsls r0, r5, 2
	adds r0, r1
	ldr r0, [r0]
	ldrh r0, [r0, 0x34]
	cmp r0, 0x46
	beq _080FA55E
	cmp r0, 0x48
	bne _080FA5A8
_080FA55E:
	ldr r2, _080FA5A4 @ =0x0000098d
	adds r0, r6, r2
	adds r1, r5, r0
	ldrb r0, [r1]
	cmp r0, 0x8
	bne _080FA5C2
	movs r0, 0x9
	strb r0, [r4]
	movs r0, 0xA
	strb r0, [r1]
	lsls r1, r5, 24
	lsrs r1, 24
	movs r0, 0x8
	bl rfu_clearSlot
	movs r0, 0x80
	lsls r0, 17
	lsls r0, r5
	lsrs r0, 24
	movs r1, 0x8
	adds r2, r4, 0
	movs r3, 0x1
	bl rfu_NI_setSendData
	movs r7, 0x1
	b _080FA5C2
	.align 2, 0
_080FA594: .4byte Rfu
_080FA598: .4byte 0x000008f6
_080FA59C: .4byte 0x00000989
_080FA5A0: .4byte gRfuSlotStatusNI
_080FA5A4: .4byte 0x0000098d
_080FA5A8:
	mov r2, r8
	ldrb r0, [r2]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	ldrh r0, [r0, 0x34]
	cmp r0, 0x47
	bne _080FA5C2
	lsls r1, r5, 24
	lsrs r1, 24
	movs r0, 0x8
	bl rfu_clearSlot
_080FA5C2:
	adds r5, 0x1
	cmp r5, 0x3
	ble _080FA53A
	adds r0, r7, 0
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80FA528

	thumb_func_start sub_80FA5D4
sub_80FA5D4: @ 80FA5D4
	push {r4-r6,lr}
	movs r3, 0
	movs r1, 0
	ldr r5, _080FA620 @ =Rfu+0x98d
	movs r6, 0x1
	movs r4, 0
_080FA5E0:
	adds r2, r1, r5
	ldrb r0, [r2]
	cmp r0, 0xB
	bne _080FA5F4
	adds r0, r6, 0
	lsls r0, r1
	orrs r3, r0
	lsls r0, r3, 24
	lsrs r3, r0, 24
	strb r4, [r2]
_080FA5F4:
	adds r1, 0x1
	cmp r1, 0x3
	ble _080FA5E0
	cmp r3, 0
	beq _080FA608
	adds r0, r3, 0
	bl rfu_REQ_disconnect
	bl rfu_waitREQComplete
_080FA608:
	movs r1, 0
	ldr r2, _080FA620 @ =Rfu+0x98d
_080FA60C:
	adds r0, r1, r2
	ldrb r0, [r0]
	subs r0, 0xA
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bhi _080FA624
	movs r0, 0x1
	b _080FA62C
	.align 2, 0
_080FA620: .4byte Rfu+0x98d
_080FA624:
	adds r1, 0x1
	cmp r1, 0x3
	ble _080FA60C
	movs r0, 0
_080FA62C:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80FA5D4

	thumb_func_start sub_80FA634
sub_80FA634: @ 80FA634
	push {lr}
	adds r2, r0, 0
	adds r0, r1, 0
	lsls r2, 16
	lsrs r2, 16
	adds r1, r2, 0
	bl sub_80FBC70
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0xFF
	beq _080FA668
	ldr r0, _080FA660 @ =Rfu
	ldr r2, _080FA664 @ =0x00000989
	adds r0, r2
	adds r0, r1, r0
	ldrb r0, [r0]
	cmp r0, 0x9
	beq _080FA668
	movs r0, 0
	b _080FA66A
	.align 2, 0
_080FA660: .4byte Rfu
_080FA664: .4byte 0x00000989
_080FA668:
	movs r0, 0x1
_080FA66A:
	pop {r1}
	bx r1
	thumb_func_end sub_80FA634

	thumb_func_start sub_80FA670
sub_80FA670: @ 80FA670
	push {r4-r6,lr}
	adds r6, r0, 0
	adds r0, r2, 0
	lsls r6, 24
	lsrs r6, 24
	lsls r1, 16
	lsrs r1, 16
	bl sub_80FBC70
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r5, _080FA6B4 @ =Rfu
	ldr r0, _080FA6B8 @ =0x00000989
	adds r5, r0
	adds r5, r4, r5
	strb r6, [r5]
	movs r0, 0x4
	adds r1, r4, 0
	bl rfu_clearSlot
	movs r0, 0x80
	lsls r0, 17
	lsls r0, r4
	lsrs r0, 24
	movs r1, 0x8
	adds r2, r5, 0
	movs r3, 0x1
	bl rfu_NI_setSendData
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080FA6B4: .4byte Rfu
_080FA6B8: .4byte 0x00000989
	thumb_func_end sub_80FA670

	thumb_func_start sub_80FA6BC
sub_80FA6BC: @ 80FA6BC
	push {r4,r5,lr}
	ldr r4, _080FA6F0 @ =Rfu
	ldr r0, _080FA6F4 @ =0x0000093d
	adds r5, r4, r0
	movs r0, 0x8
	strb r0, [r5]
	ldr r0, _080FA6F8 @ =0x000008f6
	adds r4, r0
	ldrb r1, [r4]
	movs r0, 0x4
	bl rfu_clearSlot
	ldrb r1, [r4]
	movs r0, 0x80
	lsls r0, 17
	lsls r0, r1
	lsrs r0, 24
	movs r1, 0x8
	adds r2, r5, 0
	movs r3, 0x1
	bl rfu_NI_setSendData
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080FA6F0: .4byte Rfu
_080FA6F4: .4byte 0x0000093d
_080FA6F8: .4byte 0x000008f6
	thumb_func_end sub_80FA6BC

	thumb_func_start sub_80FA6FC
sub_80FA6FC: @ 80FA6FC
	push {lr}
	adds r2, r0, 0
	adds r0, r1, 0
	lsls r2, 16
	lsrs r2, 16
	adds r1, r2, 0
	bl sub_80FBC70
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	bne _080FA718
	movs r0, 0x2
	b _080FA732
_080FA718:
	ldr r1, _080FA72C @ =gRfuSlotStatusNI
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	ldrh r0, [r0]
	cmp r0, 0
	beq _080FA730
	movs r0, 0
	b _080FA732
	.align 2, 0
_080FA72C: .4byte gRfuSlotStatusNI
_080FA730:
	movs r0, 0x1
_080FA732:
	pop {r1}
	bx r1
	thumb_func_end sub_80FA6FC

	thumb_func_start sub_80FA738
sub_80FA738: @ 80FA738
	push {r4,r5,lr}
	bl sub_80FA528
	movs r4, 0
	ldr r0, _080FA77C @ =Rfu
	ldr r1, _080FA780 @ =0x0000098d
	adds r5, r0, r1
_080FA746:
	ldr r1, _080FA784 @ =gRfuSlotStatusNI
	lsls r0, r4, 2
	adds r0, r1
	ldr r0, [r0]
	ldrh r0, [r0]
	subs r0, 0x26
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	bhi _080FA770
	adds r1, r4, r5
	ldrb r0, [r1]
	cmp r0, 0xA
	bne _080FA766
	movs r0, 0xB
	strb r0, [r1]
_080FA766:
	lsls r1, r4, 24
	lsrs r1, 24
	movs r0, 0x4
	bl rfu_clearSlot
_080FA770:
	adds r4, 0x1
	cmp r4, 0x3
	ble _080FA746
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080FA77C: .4byte Rfu
_080FA780: .4byte 0x0000098d
_080FA784: .4byte gRfuSlotStatusNI
	thumb_func_end sub_80FA738

	thumb_func_start sub_80FA788
sub_80FA788: @ 80FA788
	push {r4,r5,lr}
	movs r4, 0
	ldr r1, _080FA800 @ =Rfu
	ldr r2, _080FA804 @ =0x0000093d
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0x8
	bne _080FA7C2
	ldr r2, _080FA808 @ =gRfuSlotStatusNI
	ldr r0, _080FA80C @ =0x000008f6
	adds r1, r0
	ldrb r0, [r1]
	lsls r0, 2
	adds r0, r2
	ldr r0, [r0]
	ldrh r0, [r0]
	cmp r0, 0x26
	beq _080FA7BA
	ldrb r0, [r1]
	lsls r0, 2
	adds r0, r2
	ldr r0, [r0]
	ldrh r0, [r0]
	cmp r0, 0x27
	bne _080FA7C2
_080FA7BA:
	ldrb r1, [r1]
	movs r0, 0x4
	bl rfu_clearSlot
_080FA7C2:
	ldr r2, _080FA808 @ =gRfuSlotStatusNI
	ldr r5, _080FA800 @ =Rfu
	ldr r0, _080FA80C @ =0x000008f6
	adds r1, r5, r0
	ldrb r0, [r1]
	lsls r0, 2
	adds r0, r2
	ldr r0, [r0]
	ldrh r0, [r0, 0x34]
	cmp r0, 0x46
	beq _080FA7E6
	ldrb r0, [r1]
	lsls r0, 2
	adds r0, r2
	ldr r0, [r0]
	ldrh r0, [r0, 0x34]
	cmp r0, 0x48
	bne _080FA814
_080FA7E6:
	ldrb r1, [r1]
	movs r0, 0x8
	bl rfu_clearSlot
	ldr r2, _080FA810 @ =0x0000093e
	adds r4, r5, r2
	ldrb r0, [r4]
	movs r1, 0
	bl sub_80FB9E4
	ldrb r4, [r4]
	b _080FA82C
	.align 2, 0
_080FA800: .4byte Rfu
_080FA804: .4byte 0x0000093d
_080FA808: .4byte gRfuSlotStatusNI
_080FA80C: .4byte 0x000008f6
_080FA810: .4byte 0x0000093e
_080FA814:
	ldrb r0, [r1]
	lsls r0, 2
	adds r0, r2
	ldr r0, [r0]
	ldrh r0, [r0, 0x34]
	cmp r0, 0x47
	bne _080FA82C
	ldrb r1, [r1]
	movs r0, 0x8
	bl rfu_clearSlot
	movs r4, 0x6
_080FA82C:
	adds r0, r4, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80FA788

	thumb_func_start sub_80FA834
sub_80FA834: @ 80FA834
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r5, _080FA884 @ =Rfu
	adds r0, r5, 0
	adds r0, 0xF1
	ldrb r0, [r0]
	subs r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bhi _080FA85C
	movs r0, 0x9A
	lsls r0, 4
	adds r1, r5, r0
	movs r0, 0
	strb r0, [r1]
	adds r0, r6, 0
	bl DestroyTask
_080FA85C:
	ldr r2, _080FA888 @ =gTasks
	lsls r1, r6, 2
	adds r0, r1, r6
	lsls r0, 3
	adds r4, r0, r2
	movs r2, 0x8
	ldrsh r0, [r4, r2]
	adds r7, r1, 0
	cmp r0, 0x3
	beq _080FA904
	cmp r0, 0x3
	bgt _080FA88C
	cmp r0, 0x1
	beq _080FA8B4
	cmp r0, 0x1
	bgt _080FA900
	cmp r0, 0
	beq _080FA89E
	b _080FA9BC
	.align 2, 0
_080FA884: .4byte Rfu
_080FA888: .4byte gTasks
_080FA88C:
	cmp r0, 0x5
	beq _080FA938
	cmp r0, 0x5
	blt _080FA926
	cmp r0, 0x6
	beq _080FA96C
	cmp r0, 0x65
	beq _080FA8EC
	b _080FA9BC
_080FA89E:
	bl sub_80F9C50
	lsls r0, 24
	cmp r0, 0
	bne _080FA8AA
	b _080FA9BC
_080FA8AA:
	bl ResetBlockReceivedFlags
	bl sub_800B0B4
	b _080FA930
_080FA8B4:
	ldrb r0, [r5, 0xC]
	cmp r0, 0x1
	bne _080FA8F4
	ldr r0, _080FA8CC @ =gReceivedRemoteLinkPlayers
	ldrb r0, [r0]
	cmp r0, 0
	beq _080FA8D0
	movs r0, 0xF0
	lsls r0, 7
	bl sub_80F9D04
	b _080FA8D8
	.align 2, 0
_080FA8CC: .4byte gReceivedRemoteLinkPlayers
_080FA8D0:
	movs r0, 0xEE
	lsls r0, 7
	bl sub_80F9D04
_080FA8D8:
	ldr r0, _080FA8E8 @ =gTasks
	adds r1, r7, r6
	lsls r1, 3
	adds r1, r0
	movs r0, 0x65
	strh r0, [r1, 0x8]
	b _080FA9BC
	.align 2, 0
_080FA8E8: .4byte gTasks
_080FA8EC:
	ldr r0, _080FA8FC @ =gSendCmd
	ldrh r0, [r0]
	cmp r0, 0
	bne _080FA9BC
_080FA8F4:
	movs r0, 0x2
	strh r0, [r4, 0x8]
	b _080FA9BC
	.align 2, 0
_080FA8FC: .4byte gSendCmd
_080FA900:
	ldrb r0, [r5, 0xD]
	b _080FA92C
_080FA904:
	ldrb r0, [r5, 0xC]
	cmp r0, 0x1
	bne _080FA930
	bl sub_80F9C50
	lsls r0, 24
	cmp r0, 0
	beq _080FA9BC
	adds r1, r5, 0
	adds r1, 0x5A
	movs r0, 0
	strb r0, [r1]
	movs r0, 0xA1
	lsls r0, 8
	bl sub_80F9D04
	b _080FA930
_080FA926:
	bl sub_80F9C78
	lsls r0, 24
_080FA92C:
	cmp r0, 0
	beq _080FA9BC
_080FA930:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080FA9BC
_080FA938:
	movs r4, 0
	ldrb r0, [r5, 0xD]
	cmp r4, r0
	bge _080FA956
_080FA940:
	adds r0, r4, 0
	bl sub_800B110
	lsls r0, r4, 24
	lsrs r0, 24
	bl Rfu_ResetBlockReceivedFlag
	adds r4, 0x1
	ldrb r2, [r5, 0xD]
	cmp r4, r2
	blt _080FA940
_080FA956:
	ldr r0, _080FA968 @ =gTasks
	adds r1, r7, r6
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	b _080FA9BC
	.align 2, 0
_080FA968: .4byte gTasks
_080FA96C:
	adds r0, r6, 0
	bl DestroyTask
	ldr r1, _080FA9C4 @ =gReceivedRemoteLinkPlayers
	movs r0, 0x1
	strb r0, [r1]
	movs r0, 0x9A
	lsls r0, 4
	adds r1, r5, r0
	movs r0, 0
	strb r0, [r1]
	movs r1, 0x96
	lsls r1, 2
	movs r0, 0x1
	bl sub_80FEA34
	ldr r2, _080FA9C8 @ =0x0000099e
	adds r1, r5, r2
	ldrb r0, [r1]
	cmp r0, 0
	beq _080FA9BC
	movs r4, 0
	adds r2, r1, 0
	movs r3, 0x1
	ldr r0, _080FA9CC @ =0x0000099d
	adds r5, r0
_080FA9A0:
	ldrb r0, [r2]
	asrs r0, r4
	ands r0, r3
	cmp r0, 0
	beq _080FA9B6
	adds r0, r3, 0
	lsls r0, r4
	strb r0, [r5]
	ldrb r1, [r2]
	eors r0, r1
	strb r0, [r2]
_080FA9B6:
	adds r4, 0x1
	cmp r4, 0x3
	ble _080FA9A0
_080FA9BC:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080FA9C4: .4byte gReceivedRemoteLinkPlayers
_080FA9C8: .4byte 0x0000099e
_080FA9CC: .4byte 0x0000099d
	thumb_func_end sub_80FA834

	thumb_func_start sub_80FA9D0
sub_80FA9D0: @ 80FA9D0
	push {r4,r5,lr}
	lsls r0, 16
	lsrs r2, r0, 16
	movs r1, 0
	movs r5, 0x1
	ldr r4, _080FA9F8 @ =Rfu+0x996
	movs r3, 0
_080FA9DE:
	adds r0, r2, 0
	asrs r0, r1
	ands r0, r5
	cmp r0, 0
	beq _080FA9EC
	adds r0, r1, r4
	strb r3, [r0]
_080FA9EC:
	adds r1, 0x1
	cmp r1, 0x3
	ble _080FA9DE
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080FA9F8: .4byte Rfu+0x996
	thumb_func_end sub_80FA9D0

	thumb_func_start sub_80FA9FC
sub_80FA9FC: @ 80FA9FC
	push {r4-r7,lr}
	adds r2, r0, 0
	ldr r1, _080FAA4C @ =Rfu
	ldrb r0, [r2, 0xF]
	strb r0, [r1, 0xD]
	movs r4, 0
	ldr r0, _080FAA50 @ =0x00000996
	adds r5, r1, r0
	adds r3, r2, 0
	adds r3, 0x10
_080FAA10:
	adds r0, r4, r5
	adds r1, r3, r4
	ldrb r1, [r1]
	strb r1, [r0]
	adds r4, 0x1
	cmp r4, 0x3
	ble _080FAA10
	adds r6, r2, 0
	ldr r5, _080FAA54 @ =gLinkPlayers
	movs r4, 0x4
_080FAA24:
	adds r0, r5, 0
	adds r1, r6, 0
	adds r1, 0x14
	ldm r1!, {r2,r3,r7}
	stm r0!, {r2,r3,r7}
	ldm r1!, {r2,r3,r7}
	stm r0!, {r2,r3,r7}
	ldr r1, [r1]
	str r1, [r0]
	adds r0, r5, 0
	bl sub_800B284
	adds r6, 0x1C
	adds r5, 0x1C
	subs r4, 0x1
	cmp r4, 0
	bge _080FAA24
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080FAA4C: .4byte Rfu
_080FAA50: .4byte 0x00000996
_080FAA54: .4byte gLinkPlayers
	thumb_func_end sub_80FA9FC

	thumb_func_start sub_80FAA58
sub_80FAA58: @ 80FAA58
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	ldr r0, _080FAA8C @ =gUnknown_843EDE4	"PokemonSioInfo"
	adds r1, r4, 0
	bl strcmp
	adds r5, r0, 0
	cmp r5, 0
	bne _080FAA84
	adds r0, r4, 0
	bl sub_80FA9FC
	mov r0, sp
	strh r5, [r0]
	ldr r2, _080FAA90 @ =0x0100007e
	adds r1, r4, 0
	bl CpuSet
	movs r0, 0
	bl ResetBlockReceivedFlag
_080FAA84:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080FAA8C: .4byte gUnknown_843EDE4
_080FAA90: .4byte 0x0100007e
	thumb_func_end sub_80FAA58

	thumb_func_start sub_80FAA94
sub_80FAA94: @ 80FAA94
	push {r4-r7,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r3, _080FAAF4 @ =Rfu
	ldr r2, _080FAAF8 @ =gUnknown_843EC38
	ldr r1, _080FAAFC @ =0x000009a1
	adds r0, r3, r1
	ldrb r1, [r0]
	adds r1, r2
	ldr r2, _080FAB00 @ =0x00000996
	adds r0, r3, r2
	ldrb r1, [r1]
	adds r0, r1
	ldrb r4, [r0]
	adds r0, r3, 0
	adds r0, 0xF1
	ldrb r0, [r0]
	subs r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bhi _080FAAD2
	movs r5, 0x9A
	lsls r5, 4
	adds r1, r3, r5
	movs r0, 0
	strb r0, [r1]
	adds r0, r6, 0
	bl DestroyTask
_080FAAD2:
	ldr r0, _080FAB04 @ =gTasks
	lsls r2, r6, 2
	adds r1, r2, r6
	lsls r1, 3
	adds r1, r0
	movs r3, 0x8
	ldrsh r1, [r1, r3]
	adds r3, r0, 0
	adds r7, r2, 0
	cmp r1, 0x5
	bls _080FAAEA
	b _080FACD6
_080FAAEA:
	lsls r0, r1, 2
	ldr r1, _080FAB08 @ =_080FAB0C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080FAAF4: .4byte Rfu
_080FAAF8: .4byte gUnknown_843EC38
_080FAAFC: .4byte 0x000009a1
_080FAB00: .4byte 0x00000996
_080FAB04: .4byte gTasks
_080FAB08: .4byte _080FAB0C
	.align 2, 0
_080FAB0C:
	.4byte _080FAB24
	.4byte _080FAB44
	.4byte _080FAB5C
	.4byte _080FABA4
	.4byte _080FABEE
	.4byte _080FAC78
_080FAB24:
	ldr r0, _080FAB40 @ =gSendCmd
	ldrh r0, [r0]
	cmp r0, 0
	beq _080FAB2E
	b _080FACD6
_080FAB2E:
	adds r0, r4, 0
	bl ResetBlockReceivedFlag
	movs r0, 0xF0
	lsls r0, 7
	bl sub_80F9D04
	b _080FAC2E
	.align 2, 0
_080FAB40: .4byte gSendCmd
_080FAB44:
	ldr r0, _080FAB58 @ =gSendCmd
	ldrh r0, [r0]
	cmp r0, 0
	beq _080FAB4E
	b _080FACD6
_080FAB4E:
	adds r1, r7, r6
	lsls r1, 3
	adds r1, r3
	b _080FAC36
	.align 2, 0
_080FAB58: .4byte gSendCmd
_080FAB5C:
	bl GetBlockReceivedStatus
	lsls r0, 24
	lsrs r0, 24
	asrs r0, r4
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	bne _080FAB70
	b _080FACD6
_080FAB70:
	adds r0, r4, 0
	bl ResetBlockReceivedFlag
	lsls r2, r4, 8
	ldr r0, _080FAB9C @ =gBlockRecvBuffer
	adds r2, r0
	ldr r1, _080FABA0 @ =gLinkPlayers
	lsls r0, r4, 3
	subs r0, r4
	lsls r0, 2
	adds r0, r1
	adds r1, r0, 0
	adds r2, 0x10
	ldm r2!, {r3-r5}
	stm r1!, {r3-r5}
	ldm r2!, {r3-r5}
	stm r1!, {r3-r5}
	ldr r2, [r2]
	str r2, [r1]
	bl sub_800B284
	b _080FAC2E
	.align 2, 0
_080FAB9C: .4byte gBlockRecvBuffer
_080FABA0: .4byte gLinkPlayers
_080FABA4:
	ldr r5, _080FAC40 @ =gBlockSendBuffer
	adds r1, r5, 0
	ldr r0, _080FAC44 @ =gUnknown_843EDE4	"PokemonSioInfo"
	ldm r0!, {r2-r4}
	stm r1!, {r2-r4}
	ldrh r2, [r0]
	strh r2, [r1]
	ldrb r0, [r0, 0x2]
	strb r0, [r1, 0x2]
	ldr r1, _080FAC48 @ =Rfu
	ldrb r0, [r1, 0xD]
	strb r0, [r5, 0xF]
	movs r2, 0
	adds r4, r5, 0
	adds r4, 0x10
	ldr r0, _080FAC4C @ =0x00000996
	adds r3, r1, r0
_080FABC6:
	adds r0, r4, r2
	adds r1, r2, r3
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, 0x1
	cmp r2, 0x3
	ble _080FABC6
	ldr r1, _080FAC50 @ =gLinkPlayers
	adds r0, r5, 0
	adds r0, 0x14
	movs r2, 0x8C
	bl memcpy
	ldr r0, _080FAC54 @ =gTasks
	adds r1, r7, r6
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
_080FABEE:
	ldr r5, _080FAC40 @ =gBlockSendBuffer
	ldr r1, _080FAC48 @ =Rfu
	ldrb r0, [r1, 0xD]
	strb r0, [r5, 0xF]
	movs r2, 0
	ldr r3, _080FAC50 @ =gLinkPlayers
	mov r12, r3
	adds r4, r5, 0
	adds r4, 0x10
	ldr r0, _080FAC4C @ =0x00000996
	adds r3, r1, r0
_080FAC04:
	adds r0, r4, r2
	adds r1, r2, r3
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, 0x1
	cmp r2, 0x3
	ble _080FAC04
	adds r0, r5, 0
	adds r0, 0x14
	mov r1, r12
	movs r2, 0x8C
	bl memcpy
	ldr r1, _080FAC40 @ =gBlockSendBuffer
	movs r0, 0
	movs r2, 0xA0
	bl SendBlock
	lsls r0, 24
	cmp r0, 0
	beq _080FACD6
_080FAC2E:
	ldr r0, _080FAC54 @ =gTasks
	adds r1, r7, r6
	lsls r1, 3
	adds r1, r0
_080FAC36:
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	b _080FACD6
	.align 2, 0
_080FAC40: .4byte gBlockSendBuffer
_080FAC44: .4byte gUnknown_843EDE4
_080FAC48: .4byte Rfu
_080FAC4C: .4byte 0x00000996
_080FAC50: .4byte gLinkPlayers
_080FAC54: .4byte gTasks
_080FAC58:
	adds r0, r3, 0
	lsls r0, r2
	ldr r2, _080FAC74 @ =0x0000099d
	adds r1, r5, r2
	strb r0, [r1]
	ldrb r1, [r4]
	eors r0, r1
	strb r0, [r4]
	movs r4, 0x9A
	lsls r4, 4
	adds r0, r5, r4
	strb r3, [r0]
	b _080FACD0
	.align 2, 0
_080FAC74: .4byte 0x0000099d
_080FAC78:
	bl IsLinkTaskFinished
	lsls r0, 24
	cmp r0, 0
	beq _080FACD6
	bl GetBlockReceivedStatus
	movs r1, 0x1
	ands r1, r0
	cmp r1, 0
	beq _080FACD6
	mov r0, sp
	movs r4, 0
	strh r4, [r0]
	ldr r1, _080FACE0 @ =gBlockRecvBuffer
	ldr r2, _080FACE4 @ =0x0100007e
	bl CpuSet
	movs r0, 0
	bl ResetBlockReceivedFlag
	ldr r1, _080FACE8 @ =Rfu
	movs r5, 0x9A
	lsls r5, 4
	adds r0, r1, r5
	strb r4, [r0]
	ldr r0, _080FACEC @ =0x0000099e
	adds r3, r1, r0
	ldrb r0, [r3]
	cmp r0, 0
	beq _080FACD0
	movs r2, 0
	adds r5, r1, 0
	adds r4, r3, 0
	ldrb r1, [r4]
	movs r3, 0x1
_080FACC0:
	adds r0, r1, 0
	asrs r0, r2
	ands r0, r3
	cmp r0, 0
	bne _080FAC58
	adds r2, 0x1
	cmp r2, 0x3
	ble _080FACC0
_080FACD0:
	adds r0, r6, 0
	bl DestroyTask
_080FACD6:
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080FACE0: .4byte gBlockRecvBuffer
_080FACE4: .4byte 0x0100007e
_080FACE8: .4byte Rfu
_080FACEC: .4byte 0x0000099e
	thumb_func_end sub_80FAA94

	thumb_func_start sub_80FACF0
sub_80FACF0: @ 80FACF0
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r6, _080FAD2C @ =Rfu
	adds r0, r6, 0
	adds r0, 0xF1
	ldrb r0, [r0]
	subs r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bhi _080FAD0E
	adds r0, r5, 0
	bl DestroyTask
_080FAD0E:
	ldr r1, _080FAD30 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _080FAD54
	cmp r0, 0x1
	bgt _080FAD34
	cmp r0, 0
	beq _080FAD3A
	b _080FAD8A
	.align 2, 0
_080FAD2C: .4byte Rfu
_080FAD30: .4byte gTasks
_080FAD34:
	cmp r0, 0x2
	beq _080FAD66
	b _080FAD8A
_080FAD3A:
	ldrb r0, [r6, 0xD]
	cmp r0, 0
	beq _080FAD8A
	bl sub_800B0B4
	ldr r1, _080FAD50 @ =gBlockSendBuffer
	movs r0, 0
	movs r2, 0x3C
	bl SendBlock
	b _080FAD5E
	.align 2, 0
_080FAD50: .4byte gBlockSendBuffer
_080FAD54:
	bl IsLinkTaskFinished
	lsls r0, 24
	cmp r0, 0
	beq _080FAD8A
_080FAD5E:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080FAD8A
_080FAD66:
	bl GetBlockReceivedStatus
	movs r4, 0x1
	adds r1, r4, 0
	ands r1, r0
	cmp r1, 0
	beq _080FAD8A
	ldr r0, _080FAD90 @ =gBlockRecvBuffer
	bl sub_80FA9FC
	movs r0, 0
	bl ResetBlockReceivedFlag
	ldr r0, _080FAD94 @ =gReceivedRemoteLinkPlayers
	strb r4, [r0]
	adds r0, r5, 0
	bl DestroyTask
_080FAD8A:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080FAD90: .4byte gBlockRecvBuffer
_080FAD94: .4byte gReceivedRemoteLinkPlayers
	thumb_func_end sub_80FACF0

	thumb_func_start sub_80FAD98
sub_80FAD98: @ 80FAD98
	push {r4-r7,lr}
	ldr r0, _080FAE10 @ =Rfu
	adds r7, r0, 0
	adds r7, 0xEE
	ldrb r1, [r7]
	adds r5, r0, 0
	cmp r1, 0x1
	bne _080FAE30
	ldr r0, _080FAE14 @ =gUnknown_3005E10
	ldrb r0, [r0, 0x2]
	cmp r0, 0
	bne _080FAE30
	ldr r6, _080FAE18 @ =gMain
	ldr r1, [r6, 0x4]
	ldr r0, _080FAE1C @ =c2_mystery_gift_e_reader_run
	cmp r1, r0
	bne _080FADC0
	ldr r1, _080FAE20 @ =gWirelessCommType
	movs r0, 0x2
	strb r0, [r1]
_080FADC0:
	ldr r4, _080FAE24 @ =CB2_LinkError
	adds r0, r4, 0
	bl SetMainCallback2
	str r4, [r6, 0x8]
	ldrh r0, [r5, 0xA]
	lsls r4, r0, 16
	ldrh r0, [r5, 0x10]
	lsls r0, 8
	orrs r4, r0
	ldrh r0, [r5, 0x12]
	orrs r4, r0
	ldr r1, _080FAE28 @ =0x0000069e
	adds r0, r5, r1
	ldrb r0, [r0]
	adds r6, r0, 0
	ldr r1, _080FAE2C @ =0x000008d2
	adds r0, r5, r1
	ldrb r0, [r0]
	adds r5, r0, 0
	bl sub_80FB9F4
	movs r3, 0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bne _080FADF8
	movs r3, 0x1
_080FADF8:
	adds r0, r4, 0
	adds r1, r6, 0
	adds r2, r5, 0
	bl sub_800ACBC
	ldrb r0, [r7]
	movs r0, 0x2
	strb r0, [r7]
	bl CloseLink
	b _080FAE62
	.align 2, 0
_080FAE10: .4byte Rfu
_080FAE14: .4byte gUnknown_3005E10
_080FAE18: .4byte gMain
_080FAE1C: .4byte c2_mystery_gift_e_reader_run
_080FAE20: .4byte gWirelessCommType
_080FAE24: .4byte CB2_LinkError
_080FAE28: .4byte 0x0000069e
_080FAE2C: .4byte 0x000008d2
_080FAE30:
	ldr r1, _080FAE68 @ =0x000008d3
	adds r0, r5, r1
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _080FAE44
	ldr r1, _080FAE6C @ =0x0000069f
	adds r0, r5, r1
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _080FAE62
_080FAE44:
	ldr r0, _080FAE70 @ =gUnknown_3005E10
	ldrb r0, [r0, 0x2]
	cmp r0, 0
	beq _080FAE50
	bl sub_80FEB14
_080FAE50:
	movs r4, 0xE0
	lsls r4, 7
	movs r0, 0x1
	adds r1, r4, 0
	bl sub_80FB9E4
	adds r0, r4, 0
	bl sub_80FB0E8
_080FAE62:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080FAE68: .4byte 0x000008d3
_080FAE6C: .4byte 0x0000069f
_080FAE70: .4byte gUnknown_3005E10
	thumb_func_end sub_80FAD98

	thumb_func_start rfu_REQ_recvData_then_sendData
rfu_REQ_recvData_then_sendData: @ 80FAE74
	push {lr}
	ldr r0, _080FAE90 @ =gUnknown_3005E10
	ldrb r0, [r0, 0x6]
	cmp r0, 0x1
	bne _080FAE8C
	bl rfu_REQ_recvData
	bl rfu_waitREQComplete
	movs r0, 0
	bl LinkRfu_REQ_SendData_HandleParentRelationship
_080FAE8C:
	pop {r0}
	bx r0
	.align 2, 0
_080FAE90: .4byte gUnknown_3005E10
	thumb_func_end rfu_REQ_recvData_then_sendData

	thumb_func_start sub_80FAE94
sub_80FAE94: @ 80FAE94
	push {r4,r5,lr}
	movs r5, 0
	ldr r4, _080FAEC8 @ =Rfu
	ldr r1, _080FAECC @ =0x00000985
	adds r0, r4, r1
	strb r5, [r0]
	bl Random
	lsls r0, 16
	lsrs r0, 16
	bl sub_80FDA30
	adds r0, r4, 0
	adds r0, 0xEF
	ldrb r0, [r0]
	cmp r0, 0
	bne _080FAEE8
	ldrb r0, [r4, 0xC]
	cmp r0, 0x1
	beq _080FAED6
	cmp r0, 0x1
	bgt _080FAED0
	cmp r0, 0
	beq _080FAEDC
	b _080FAEE8
	.align 2, 0
_080FAEC8: .4byte Rfu
_080FAECC: .4byte 0x00000985
_080FAED0:
	cmp r0, 0x2
	beq _080FAEE4
	b _080FAEE8
_080FAED6:
	bl sub_80F911C
	b _080FAEE8
_080FAEDC:
	bl sub_80F9514
	adds r5, r0, 0
	b _080FAEE8
_080FAEE4:
	bl rfu_REQ_recvData_then_sendData
_080FAEE8:
	adds r0, r5, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80FAE94

	thumb_func_start sub_80FAEF0
sub_80FAEF0: @ 80FAEF0
	push {r4,lr}
	movs r4, 0
	ldr r1, _080FAF18 @ =Rfu
	adds r0, r1, 0
	adds r0, 0xEF
	ldrb r0, [r0]
	cmp r0, 0
	bne _080FAF10
	ldrb r0, [r1, 0xC]
	cmp r0, 0x1
	bne _080FAF0C
	bl sub_80F9204
	adds r4, r0, 0
_080FAF0C:
	bl sub_80FAD98
_080FAF10:
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080FAF18: .4byte Rfu
	thumb_func_end sub_80FAEF0

	thumb_func_start sub_80FAF1C
sub_80FAF1C: @ 80FAF1C
	push {lr}
	ldr r0, _080FAF2C @ =gUnknown_3005E00
	ldr r1, _080FAF30 @ =gSaveBlock2Ptr
	ldr r1, [r1]
	bl StringCopy
	pop {r0}
	bx r0
	.align 2, 0
_080FAF2C: .4byte gUnknown_3005E00
_080FAF30: .4byte gSaveBlock2Ptr
	thumb_func_end sub_80FAF1C

	thumb_func_start sub_80FAF34
sub_80FAF34: @ 80FAF34
	push {r4,lr}
	ldr r4, _080FAF54 @ =gUnknown_3005440
	adds r0, r4, 0
	movs r1, 0
	movs r2, 0xD
	bl memset
	adds r0, r4, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl sub_80FCB54
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080FAF54: .4byte gUnknown_3005440
	thumb_func_end sub_80FAF34

	thumb_func_start sub_80FAF58
sub_80FAF58: @ 80FAF58
	push {r4,lr}
	adds r4, r0, 0
	adds r3, r1, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _080FAF70 @ =gUnknown_3005440
	adds r1, r4, 0
	bl sub_80FCB54
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080FAF70: .4byte gUnknown_3005440
	thumb_func_end sub_80FAF58

	thumb_func_start sub_80FAF74
sub_80FAF74: @ 80FAF74
	push {r4,r5,lr}
	ldr r5, _080FAF9C @ =gUnknown_3005440
	movs r4, 0x1
	ands r0, r4
	lsls r0, 4
	ldrb r3, [r5]
	movs r2, 0x11
	negs r2, r2
	ands r2, r3
	orrs r2, r0
	ands r1, r4
	lsls r1, 5
	movs r0, 0x21
	negs r0, r0
	ands r2, r0
	orrs r2, r1
	strb r2, [r5]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080FAF9C: .4byte gUnknown_3005440
	thumb_func_end sub_80FAF74

	thumb_func_start sub_80FAFA0
sub_80FAFA0: @ 80FAFA0
	push {r4,r5,lr}
	ldr r5, _080FAFD4 @ =gUnknown_3005440
	lsls r0, 2
	ldrb r4, [r5, 0x9]
	movs r3, 0x3
	ands r3, r4
	orrs r3, r0
	strb r3, [r5, 0x9]
	ldr r3, _080FAFD8 @ =0x000003ff
	adds r0, r3, 0
	ands r1, r0
	ldrh r3, [r5, 0x8]
	ldr r0, _080FAFDC @ =0xfffffc00
	ands r0, r3
	orrs r0, r1
	strh r0, [r5, 0x8]
	lsls r2, 1
	ldrb r1, [r5, 0xB]
	movs r0, 0x1
	ands r0, r1
	orrs r0, r2
	strb r0, [r5, 0xB]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080FAFD4: .4byte gUnknown_3005440
_080FAFD8: .4byte 0x000003ff
_080FAFDC: .4byte 0xfffffc00
	thumb_func_end sub_80FAFA0

	thumb_func_start sub_80FAFE0
sub_80FAFE0: @ 80FAFE0
	push {lr}
	lsls r0, 24
	ldr r2, _080FB000 @ =gUnknown_3005440
	lsrs r0, 17
	ldrb r3, [r2, 0xA]
	movs r1, 0x7F
	ands r1, r3
	orrs r1, r0
	strb r1, [r2, 0xA]
	ldr r3, _080FB004 @ =gUnknown_3005E00
	movs r0, 0
	movs r1, 0x2
	bl rfu_REQ_configGameData
	pop {r0}
	bx r0
	.align 2, 0
_080FB000: .4byte gUnknown_3005440
_080FB004: .4byte gUnknown_3005E00
	thumb_func_end sub_80FAFE0

	thumb_func_start sub_80FB008
sub_80FB008: @ 80FB008
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _080FB016
	bl sub_80FAF58
_080FB016:
	ldr r2, _080FB028 @ =gUnknown_3005440
	ldr r3, _080FB02C @ =gUnknown_3005E00
	movs r0, 0
	movs r1, 0x2
	bl rfu_REQ_configGameData
	pop {r0}
	bx r0
	.align 2, 0
_080FB028: .4byte gUnknown_3005440
_080FB02C: .4byte gUnknown_3005E00
	thumb_func_end sub_80FB008

	thumb_func_start sub_80FB030
sub_80FB030: @ 80FB030
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	mov r9, r0
	bl sub_80F9800
	ldrb r1, [r0, 0xA]
	movs r0, 0x7F
	ands r0, r1
	cmp r0, 0x45
	bne _080FB0C4
	movs r5, 0
	movs r7, 0
	ldr r3, _080FB0D4 @ =Rfu
	ldr r1, _080FB0D8 @ =0x0000099a
	adds r0, r3, r1
	ldr r2, _080FB0DC @ =0x0000099b
	adds r1, r3, r2
	ldrb r2, [r0]
	ldrb r0, [r1]
	adds r1, r0, 0
	eors r1, r2
	mov r8, r1
	movs r4, 0
	movs r6, 0x1
	ldr r2, _080FB0E0 @ =gLinkPlayers
	mov r12, r2
	ldr r0, _080FB0E4 @ =0x00000996
	adds r0, r3
	mov r10, r0
	mov r3, r12
	adds r3, 0x4
_080FB074:
	mov r0, r8
	asrs r0, r4
	ands r0, r6
	cmp r0, 0
	beq _080FB0B4
	mov r1, r10
	adds r0, r4, r1
	ldrb r1, [r0]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	mov r2, r12
	adds r1, r0, r2
	ldrb r1, [r1, 0x13]
	adds r2, r6, 0
	ands r2, r1
	lsls r2, 3
	adds r0, r3
	ldr r1, [r0]
	movs r0, 0x7
	ands r1, r0
	movs r0, 0x80
	orrs r1, r0
	orrs r2, r1
	lsls r0, r5, 3
	lsls r2, r0
	orrs r7, r2
	adds r5, 0x1
	mov r0, r9
	subs r0, 0x1
	cmp r5, r0
	beq _080FB0BA
_080FB0B4:
	adds r4, 0x1
	cmp r4, 0x3
	ble _080FB074
_080FB0BA:
	movs r0, 0x45
	adds r1, r7, 0
	movs r2, 0
	bl sub_80FB008
_080FB0C4:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080FB0D4: .4byte Rfu
_080FB0D8: .4byte 0x0000099a
_080FB0DC: .4byte 0x0000099b
_080FB0E0: .4byte gLinkPlayers
_080FB0E4: .4byte 0x00000996
	thumb_func_end sub_80FB030

	thumb_func_start sub_80FB0E8
sub_80FB0E8: @ 80FB0E8
	push {r4,lr}
	adds r4, r0, 0
	ldr r2, _080FB110 @ =Rfu
	adds r3, r2, 0
	adds r3, 0xEE
	ldrb r0, [r3]
	cmp r0, 0
	bne _080FB10A
	ldr r1, _080FB114 @ =gUnknown_3005E10
	ldrh r0, [r1, 0x14]
	strh r0, [r2, 0x10]
	ldrh r0, [r1, 0x16]
	strh r0, [r2, 0x12]
	strh r4, [r2, 0xA]
	ldrb r0, [r3]
	movs r0, 0x1
	strb r0, [r3]
_080FB10A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080FB110: .4byte Rfu
_080FB114: .4byte gUnknown_3005E10
	thumb_func_end sub_80FB0E8

	thumb_func_start sub_80FB118
sub_80FB118: @ 80FB118
	ldr r0, _080FB124 @ =Rfu
	adds r0, 0xEE
	ldrb r1, [r0]
	movs r1, 0
	strb r1, [r0]
	bx lr
	.align 2, 0
_080FB124: .4byte Rfu
	thumb_func_end sub_80FB118

	thumb_func_start sub_80FB128
sub_80FB128: @ 80FB128
	push {lr}
	adds r2, r0, 0
	cmp r2, 0
	bne _080FB140
	ldr r0, _080FB13C @ =Rfu
	adds r0, 0xEE
	ldrb r1, [r0]
	strb r2, [r0]
	b _080FB14A
	.align 2, 0
_080FB13C: .4byte Rfu
_080FB140:
	ldr r0, _080FB150 @ =Rfu
	adds r0, 0xEE
	ldrb r1, [r0]
	movs r1, 0x4
	strb r1, [r0]
_080FB14A:
	pop {r0}
	bx r0
	.align 2, 0
_080FB150: .4byte Rfu
	thumb_func_end sub_80FB128

	thumb_func_start sub_80FB154
sub_80FB154: @ 80FB154
	push {lr}
	ldr r0, _080FB16C @ =gUnknown_3005E10
	ldrb r0, [r0]
	movs r1, 0x1
	bl sub_80FBE20
	ldr r1, _080FB170 @ =Rfu
	movs r0, 0
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080FB16C: .4byte gUnknown_3005E10
_080FB170: .4byte Rfu
	thumb_func_end sub_80FB154

	thumb_func_start sub_80FB174
sub_80FB174: @ 80FB174
	ldr r1, _080FB17C @ =Rfu
	ldr r0, _080FB180 @ =sub_80FB154
	str r0, [r1]
	bx lr
	.align 2, 0
_080FB17C: .4byte Rfu
_080FB180: .4byte sub_80FB154
	thumb_func_end sub_80FB174

	thumb_func_start sub_80FB184
sub_80FB184: @ 80FB184
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsrs r4, r0, 24
	movs r6, 0
	cmp r4, 0x32
	bne _080FB19A
	b _080FB2D8
_080FB19A:
	cmp r4, 0x32
	bgt _080FB1CA
	cmp r4, 0x13
	bgt _080FB1B8
	cmp r4, 0x12
	blt _080FB1A8
	b _080FB366
_080FB1A8:
	cmp r4, 0x10
	bne _080FB1AE
	b _080FB366
_080FB1AE:
	cmp r4, 0x10
	bgt _080FB204
	cmp r4, 0
	beq _080FB1F6
	b _080FB366
_080FB1B8:
	cmp r4, 0x30
	bne _080FB1BE
	b _080FB2E4
_080FB1BE:
	cmp r4, 0x30
	ble _080FB1C4
	b _080FB2CC
_080FB1C4:
	cmp r4, 0x14
	beq _080FB2A0
	b _080FB366
_080FB1CA:
	cmp r4, 0x44
	bgt _080FB1DC
	cmp r4, 0x42
	blt _080FB1D4
	b _080FB366
_080FB1D4:
	cmp r4, 0x33
	bne _080FB1DA
	b _080FB2E4
_080FB1DA:
	b _080FB366
_080FB1DC:
	cmp r4, 0xF3
	bne _080FB1E2
	b _080FB332
_080FB1E2:
	cmp r4, 0xF3
	bgt _080FB1EE
	cmp r4, 0xF0
	bge _080FB1EC
	b _080FB366
_080FB1EC:
	b _080FB34C
_080FB1EE:
	cmp r4, 0xFF
	bne _080FB1F4
	b _080FB34C
_080FB1F4:
	b _080FB366
_080FB1F6:
	ldr r1, _080FB200 @ =Rfu
	movs r0, 0x2
	strh r0, [r1, 0x4]
	b _080FB366
	.align 2, 0
_080FB200: .4byte Rfu
_080FB204:
	ldr r0, _080FB268 @ =gUnknown_3005E10
	ldrh r0, [r0, 0x14]
	bl sub_80FB564
	movs r5, 0
	movs r0, 0x1
	mov r8, r0
	ldr r1, _080FB26C @ =Rfu
	mov r9, r1
	ldr r3, _080FB270 @ =0x0000098d
	add r3, r9
	mov r10, r3
	movs r7, 0x7F
_080FB21E:
	ldr r0, _080FB268 @ =gUnknown_3005E10
	ldrh r0, [r0, 0x14]
	asrs r0, r5
	mov r1, r8
	ands r0, r1
	cmp r0, 0
	beq _080FB286
	ldr r0, _080FB274 @ =gRfuLinkStatus
	lsls r1, r5, 5
	adds r1, 0x14
	ldr r0, [r0]
	adds r0, r1
	ldrb r0, [r0, 0x10]
	adds r4, r7, 0
	ands r4, r0
	bl sub_80F9800
	ldrb r1, [r0, 0xA]
	adds r0, r7, 0
	ands r0, r1
	cmp r4, r0
	bne _080FB27C
	ldr r0, _080FB278 @ =0x00000989
	add r0, r9
	adds r0, r5, r0
	movs r1, 0
	strb r1, [r0]
	mov r3, r10
	adds r2, r5, r3
	strb r1, [r2]
	movs r0, 0x20
	adds r1, r5, 0
	movs r3, 0x1
	bl rfu_setRecvBuffer
	b _080FB286
	.align 2, 0
_080FB268: .4byte gUnknown_3005E10
_080FB26C: .4byte Rfu
_080FB270: .4byte 0x0000098d
_080FB274: .4byte gRfuLinkStatus
_080FB278: .4byte 0x00000989
_080FB27C:
	mov r0, r8
	lsls r0, r5
	orrs r6, r0
	lsls r0, r6, 24
	lsrs r6, r0, 24
_080FB286:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x3
	bls _080FB21E
	cmp r6, 0
	beq _080FB366
	adds r0, r6, 0
	bl rfu_REQ_disconnect
	bl rfu_waitREQComplete
	b _080FB366
_080FB2A0:
	ldr r4, _080FB2C0 @ =Rfu
	ldr r1, _080FB2C4 @ =0x0000099f
	adds r0, r4, r1
	ldr r1, _080FB2C8 @ =gUnknown_3005E10
	ldrb r2, [r0]
	ldrb r0, [r1]
	cmp r2, r0
	beq _080FB2BA
	eors r0, r2
	bl rfu_REQ_disconnect
	bl rfu_waitREQComplete
_080FB2BA:
	movs r0, 0x11
	strh r0, [r4, 0x4]
	b _080FB366
	.align 2, 0
_080FB2C0: .4byte Rfu
_080FB2C4: .4byte 0x0000099f
_080FB2C8: .4byte gUnknown_3005E10
_080FB2CC:
	ldr r0, _080FB2D4 @ =Rfu
	adds r0, 0xF0
	b _080FB362
	.align 2, 0
_080FB2D4: .4byte Rfu
_080FB2D8:
	ldr r0, _080FB2E0 @ =Rfu
	adds r0, 0xF0
	movs r1, 0x3
	b _080FB364
	.align 2, 0
_080FB2E0: .4byte Rfu
_080FB2E4:
	ldr r1, _080FB314 @ =Rfu
	adds r2, r1, 0
	adds r2, 0xF0
	movs r0, 0x4
	strb r0, [r2]
	ldr r3, _080FB318 @ =0x0000099a
	adds r1, r3
	ldr r0, _080FB31C @ =gUnknown_3005E10
	ldrb r2, [r0, 0x14]
	ldrb r0, [r1]
	adds r3, r0, 0
	bics r3, r2
	adds r2, r3, 0
	strb r2, [r1]
	ldr r0, _080FB320 @ =gReceivedRemoteLinkPlayers
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _080FB328
	cmp r2, 0
	bne _080FB324
	adds r0, r4, 0
	bl sub_80FB0E8
	b _080FB328
	.align 2, 0
_080FB314: .4byte Rfu
_080FB318: .4byte 0x0000099a
_080FB31C: .4byte gUnknown_3005E10
_080FB320: .4byte gReceivedRemoteLinkPlayers
_080FB324:
	bl sub_80FB174
_080FB328:
	movs r0, 0x2
	adds r1, r4, 0
	bl sub_80FB9E4
	b _080FB366
_080FB332:
	movs r0, 0x1
	movs r1, 0xF3
	bl sub_80FB9E4
	movs r0, 0xF3
	bl sub_80FB0E8
	ldr r0, _080FB348 @ =Rfu
	adds r0, 0xEF
	b _080FB362
	.align 2, 0
_080FB348: .4byte Rfu
_080FB34C:
	adds r0, r4, 0
	bl sub_80FB0E8
	movs r0, 0x1
	adds r1, r4, 0
	bl sub_80FB9E4
	ldr r0, _080FB374 @ =Rfu
	ldr r1, _080FB378 @ =0x00000993
	adds r0, r1
	ldrb r1, [r0]
_080FB362:
	movs r1, 0x1
_080FB364:
	strb r1, [r0]
_080FB366:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080FB374: .4byte Rfu
_080FB378: .4byte 0x00000993
	thumb_func_end sub_80FB184

	thumb_func_start sub_80FB37C
sub_80FB37C: @ 80FB37C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x31
	bne _080FB388
	b _080FB4E8
_080FB388:
	cmp r4, 0x31
	bgt _080FB3B6
	cmp r4, 0x22
	beq _080FB40C
	cmp r4, 0x22
	bgt _080FB3A4
	cmp r4, 0x20
	beq _080FB3F4
	cmp r4, 0x20
	ble _080FB39E
	b _080FB556
_080FB39E:
	cmp r4, 0
	beq _080FB3E6
	b _080FB556
_080FB3A4:
	cmp r4, 0x24
	beq _080FB432
	cmp r4, 0x24
	blt _080FB428
	cmp r4, 0x25
	beq _080FB47C
	cmp r4, 0x30
	beq _080FB486
	b _080FB556
_080FB3B6:
	cmp r4, 0x44
	bgt _080FB3CC
	cmp r4, 0x42
	blt _080FB3C0
	b _080FB556
_080FB3C0:
	cmp r4, 0x33
	beq _080FB49A
	cmp r4, 0x33
	bge _080FB3CA
	b _080FB504
_080FB3CA:
	b _080FB556
_080FB3CC:
	cmp r4, 0xF3
	bne _080FB3D2
	b _080FB524
_080FB3D2:
	cmp r4, 0xF3
	bgt _080FB3DE
	cmp r4, 0xF0
	bge _080FB3DC
	b _080FB556
_080FB3DC:
	b _080FB53C
_080FB3DE:
	cmp r4, 0xFF
	bne _080FB3E4
	b _080FB53C
_080FB3E4:
	b _080FB556
_080FB3E6:
	ldr r1, _080FB3F0 @ =Rfu
	movs r0, 0x6
	strh r0, [r1, 0x4]
	b _080FB556
	.align 2, 0
_080FB3F0: .4byte Rfu
_080FB3F4:
	ldr r0, _080FB400 @ =Rfu
	ldr r1, _080FB404 @ =gUnknown_3005E10
	ldrh r1, [r1, 0x14]
	ldr r2, _080FB408 @ =0x00000985
	adds r0, r2
	b _080FB554
	.align 2, 0
_080FB400: .4byte Rfu
_080FB404: .4byte gUnknown_3005E10
_080FB408: .4byte 0x00000985
_080FB40C:
	ldr r0, _080FB41C @ =Rfu
	ldr r1, _080FB420 @ =gUnknown_3005E10
	ldrh r1, [r1, 0x14]
	ldr r2, _080FB424 @ =0x000008f6
	adds r0, r2
	ldrb r2, [r0]
	b _080FB554
	.align 2, 0
_080FB41C: .4byte Rfu
_080FB420: .4byte gUnknown_3005E10
_080FB424: .4byte 0x000008f6
_080FB428:
	movs r0, 0x2
	adds r1, r4, 0
	bl sub_80FB9E4
	b _080FB556
_080FB432:
	ldr r4, _080FB468 @ =Rfu
	movs r1, 0
	movs r0, 0xB
	strh r0, [r4, 0x4]
	ldr r2, _080FB46C @ =0x0000093d
	adds r0, r4, r2
	strb r1, [r0]
	ldr r0, _080FB470 @ =0x0000093e
	adds r2, r4, r0
	strb r1, [r2]
	ldr r1, _080FB474 @ =0x000008f6
	adds r5, r4, r1
	ldrb r1, [r5]
	movs r0, 0x20
	movs r3, 0x1
	bl rfu_setRecvBuffer
	ldrb r1, [r5]
	ldr r2, _080FB478 @ =0x000008f7
	adds r4, r2
	movs r0, 0x10
	adds r2, r4, 0
	movs r3, 0x46
	bl rfu_setRecvBuffer
	b _080FB556
	.align 2, 0
_080FB468: .4byte Rfu
_080FB46C: .4byte 0x0000093d
_080FB470: .4byte 0x0000093e
_080FB474: .4byte 0x000008f6
_080FB478: .4byte 0x000008f7
_080FB47C:
	movs r0, 0x2
	movs r1, 0x25
	bl sub_80FB9E4
	b _080FB556
_080FB486:
	ldr r0, _080FB4D8 @ =Rfu
	adds r2, r0, 0
	adds r2, 0xF0
	movs r1, 0x2
	strb r1, [r2]
	ldr r1, _080FB4DC @ =0x0000093e
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x6
	beq _080FB556
_080FB49A:
	ldr r2, _080FB4D8 @ =Rfu
	adds r1, r2, 0
	adds r1, 0xF0
	ldrb r0, [r1]
	cmp r0, 0x2
	beq _080FB4AA
	movs r0, 0x4
	strb r0, [r1]
_080FB4AA:
	ldr r1, _080FB4DC @ =0x0000093e
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, 0x9
	beq _080FB4BC
	movs r0, 0x2
	adds r1, r4, 0
	bl sub_80FB9E4
_080FB4BC:
	ldr r0, _080FB4E0 @ =gUnknown_843EDF8	"LINK LOSS DISCONNECT!"
	movs r1, 0x5
	movs r2, 0x5
	bl nullsub_87
	ldr r0, _080FB4E4 @ =gReceivedRemoteLinkPlayers
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _080FB556
	adds r0, r4, 0
	bl sub_80FB0E8
	b _080FB556
	.align 2, 0
_080FB4D8: .4byte Rfu
_080FB4DC: .4byte 0x0000093e
_080FB4E0: .4byte gUnknown_843EDF8
_080FB4E4: .4byte gReceivedRemoteLinkPlayers
_080FB4E8:
	ldr r0, _080FB4FC @ =Rfu
	adds r0, 0xF0
	movs r1, 0x1
	strb r1, [r0]
	ldr r0, _080FB500 @ =gUnknown_843EE10	"LINK LOSS RECOVERY NOW"
	movs r1, 0x5
	movs r2, 0x5
	bl nullsub_87
	b _080FB556
	.align 2, 0
_080FB4FC: .4byte Rfu
_080FB500: .4byte gUnknown_843EE10
_080FB504:
	ldr r1, _080FB51C @ =Rfu
	adds r2, r1, 0
	adds r2, 0xF0
	movs r0, 0x3
	strb r0, [r2]
	ldr r2, _080FB520 @ =0x000008f4
	adds r1, r2
	ldrb r0, [r1]
	movs r0, 0x1
	strb r0, [r1]
	b _080FB556
	.align 2, 0
_080FB51C: .4byte Rfu
_080FB520: .4byte 0x000008f4
_080FB524:
	movs r0, 0x1
	movs r1, 0xF3
	bl sub_80FB9E4
	movs r0, 0xF3
	bl sub_80FB0E8
	ldr r0, _080FB538 @ =Rfu
	adds r0, 0xEF
	b _080FB552
	.align 2, 0
_080FB538: .4byte Rfu
_080FB53C:
	movs r0, 0x1
	adds r1, r4, 0
	bl sub_80FB9E4
	adds r0, r4, 0
	bl sub_80FB0E8
	ldr r0, _080FB55C @ =Rfu
	ldr r1, _080FB560 @ =0x00000993
	adds r0, r1
	ldrb r1, [r0]
_080FB552:
	movs r1, 0x1
_080FB554:
	strb r1, [r0]
_080FB556:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080FB55C: .4byte Rfu
_080FB560: .4byte 0x00000993
	thumb_func_end sub_80FB37C

	thumb_func_start sub_80FB564
sub_80FB564: @ 80FB564
	push {r4-r6,lr}
	adds r3, r0, 0
	movs r2, 0
	movs r6, 0x1
	ldr r0, _080FB598 @ =Rfu
	ldr r4, _080FB59C @ =0x000009a2
	adds r1, r0, r4
	movs r5, 0
	movs r4, 0xFF
_080FB576:
	adds r0, r3, 0
	asrs r0, r2
	ands r0, r6
	cmp r0, 0
	beq _080FB588
	strb r5, [r1]
	ldrb r0, [r1, 0x4]
	orrs r0, r4
	strb r0, [r1, 0x4]
_080FB588:
	adds r1, 0x1
	adds r2, 0x1
	cmp r2, 0x3
	ble _080FB576
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080FB598: .4byte Rfu
_080FB59C: .4byte 0x000009a2
	thumb_func_end sub_80FB564

	thumb_func_start sub_80FB5A0
sub_80FB5A0: @ 80FB5A0
	push {r4-r7,lr}
	adds r5, r0, 0
	movs r3, 0
	movs r2, 0
	movs r4, 0x1
	ldr r6, _080FB5E8 @ =gRfuLinkStatus
	movs r7, 0x7F
_080FB5AE:
	adds r0, r5, 0
	asrs r0, r2
	ands r0, r4
	cmp r0, 0
	beq _080FB5D4
	lsls r1, r2, 5
	adds r1, 0x14
	ldr r0, [r6]
	adds r0, r1
	ldrb r1, [r0, 0x10]
	adds r0, r7, 0
	ands r0, r1
	cmp r0, 0x45
	bne _080FB5D4
	adds r0, r4, 0
	lsls r0, r2
	orrs r3, r0
	lsls r0, r3, 24
	lsrs r3, r0, 24
_080FB5D4:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x3
	bls _080FB5AE
	adds r0, r3, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080FB5E8: .4byte gRfuLinkStatus
	thumb_func_end sub_80FB5A0

	thumb_func_start sub_80FB5EC
sub_80FB5EC: @ 80FB5EC
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x25
	bne _080FB5F8
	b _080FB86C
_080FB5F8:
	cmp r4, 0x25
	bgt _080FB63A
	cmp r4, 0x14
	bne _080FB602
	b _080FB780
_080FB602:
	cmp r4, 0x14
	bgt _080FB61A
	cmp r4, 0x11
	beq _080FB69A
	cmp r4, 0x11
	ble _080FB610
	b _080FB9C2
_080FB610:
	cmp r4, 0
	beq _080FB684
	cmp r4, 0x10
	beq _080FB690
	b _080FB9C2
_080FB61A:
	cmp r4, 0x22
	bne _080FB620
	b _080FB7E8
_080FB620:
	cmp r4, 0x22
	bgt _080FB62C
	cmp r4, 0x20
	bne _080FB62A
	b _080FB7D0
_080FB62A:
	b _080FB9C2
_080FB62C:
	cmp r4, 0x23
	bne _080FB632
	b _080FB804
_080FB632:
	cmp r4, 0x24
	bne _080FB638
	b _080FB83A
_080FB638:
	b _080FB9C2
_080FB63A:
	cmp r4, 0x44
	bgt _080FB66A
	cmp r4, 0x42
	blt _080FB644
	b _080FB9C2
_080FB644:
	cmp r4, 0x32
	bne _080FB64A
	b _080FB894
_080FB64A:
	cmp r4, 0x32
	bgt _080FB65C
	cmp r4, 0x30
	bne _080FB654
	b _080FB8C0
_080FB654:
	cmp r4, 0x31
	bne _080FB65A
	b _080FB876
_080FB65A:
	b _080FB9C2
_080FB65C:
	cmp r4, 0x33
	bne _080FB662
	b _080FB8C8
_080FB662:
	cmp r4, 0x40
	bne _080FB668
	b _080FB97C
_080FB668:
	b _080FB9C2
_080FB66A:
	cmp r4, 0xF3
	bne _080FB670
	b _080FB98C
_080FB670:
	cmp r4, 0xF3
	bgt _080FB67C
	cmp r4, 0xF0
	bge _080FB67A
	b _080FB9C2
_080FB67A:
	b _080FB9A8
_080FB67C:
	cmp r4, 0xFF
	bne _080FB682
	b _080FB9A8
_080FB682:
	b _080FB9C2
_080FB684:
	ldr r1, _080FB68C @ =Rfu
	movs r0, 0x11
	strh r0, [r1, 0x4]
	b _080FB9C2
	.align 2, 0
_080FB68C: .4byte Rfu
_080FB690:
	movs r0, 0x4
	movs r1, 0
	bl sub_80FB9E4
	b _080FB9C2
_080FB69A:
	bl sub_80F9800
	ldrb r1, [r0, 0xA]
	movs r0, 0x7F
	ands r0, r1
	cmp r0, 0x45
	bne _080FB758
	ldr r5, _080FB704 @ =Rfu
	ldr r1, _080FB708 @ =0x00000991
	adds r0, r5, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _080FB758
	ldr r0, _080FB70C @ =gUnknown_3005E10
	ldrh r0, [r0, 0x14]
	bl sub_80FB5A0
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	beq _080FB722
	adds r0, r4, 0
	bl sub_80F886C
	lsls r0, 24
	lsrs r0, 24
	movs r2, 0x1
	mov r12, r2
	mov r1, r12
	lsls r1, r0
	lsls r1, 24
	lsrs r1, 24
	ldr r7, _080FB710 @ =0x0000099e
	adds r6, r5, r7
	ldrb r2, [r6]
	cmp r2, 0
	bne _080FB714
	movs r0, 0x9A
	lsls r0, 4
	adds r3, r5, r0
	ldrb r0, [r3]
	cmp r0, 0
	bne _080FB714
	subs r7, 0x1
	adds r0, r5, r7
	strb r1, [r0]
	eors r1, r4
	orrs r1, r2
	strb r1, [r6]
	mov r0, r12
	strb r0, [r3]
	b _080FB722
	.align 2, 0
_080FB704: .4byte Rfu
_080FB708: .4byte 0x00000991
_080FB70C: .4byte gUnknown_3005E10
_080FB710: .4byte 0x0000099e
_080FB714:
	ldr r0, _080FB744 @ =Rfu
	ldr r1, _080FB748 @ =0x0000099e
	adds r0, r1
	ldrb r2, [r0]
	adds r1, r4, 0
	orrs r1, r2
	strb r1, [r0]
_080FB722:
	ldr r0, _080FB74C @ =gUnknown_3005E10
	ldrh r1, [r0, 0x14]
	cmp r4, r1
	beq _080FB772
	ldr r2, _080FB744 @ =Rfu
	ldr r7, _080FB750 @ =0x0000099b
	adds r3, r2, r7
	adds r0, r4, 0
	eors r0, r1
	ldrb r1, [r3]
	orrs r0, r1
	strb r0, [r3]
	ldr r0, _080FB754 @ =0x0000099c
	adds r2, r0
	movs r0, 0x2
	strb r0, [r2]
	b _080FB772
	.align 2, 0
_080FB744: .4byte Rfu
_080FB748: .4byte 0x0000099e
_080FB74C: .4byte gUnknown_3005E10
_080FB750: .4byte 0x0000099b
_080FB754: .4byte 0x0000099c
_080FB758:
	bl sub_80F9800
	ldrb r1, [r0, 0xA]
	movs r0, 0x7F
	ands r0, r1
	cmp r0, 0x54
	bne _080FB772
	ldr r0, _080FB77C @ =gUnknown_3005E10
	ldrb r0, [r0]
	bl rfu_REQ_disconnect
	bl rfu_waitREQComplete
_080FB772:
	ldr r0, _080FB77C @ =gUnknown_3005E10
	ldrh r0, [r0, 0x14]
	bl sub_80FB564
	b _080FB9C2
	.align 2, 0
_080FB77C: .4byte gUnknown_3005E10
_080FB780:
	bl sub_80F9800
	ldrb r1, [r0, 0xA]
	movs r0, 0x7F
	ands r0, r1
	cmp r0, 0x45
	beq _080FB7B6
	ldr r4, _080FB7C8 @ =gUnknown_3005E10
	ldrb r0, [r4, 0x1]
	cmp r0, 0x1
	bls _080FB7B6
	ldrb r0, [r4, 0x14]
	bl sub_80F886C
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x80
	lsls r1, 17
	lsls r1, r0
	lsrs r1, 24
	ldrb r0, [r4]
	eors r1, r0
	adds r0, r1, 0
	bl rfu_REQ_disconnect
	bl rfu_waitREQComplete
_080FB7B6:
	ldr r1, _080FB7CC @ =Rfu
	ldrh r0, [r1, 0x4]
	cmp r0, 0xF
	beq _080FB7C0
	b _080FB9C2
_080FB7C0:
	movs r0, 0x10
	strh r0, [r1, 0x4]
	b _080FB9C2
	.align 2, 0
_080FB7C8: .4byte gUnknown_3005E10
_080FB7CC: .4byte Rfu
_080FB7D0:
	ldr r0, _080FB7DC @ =Rfu
	ldr r1, _080FB7E0 @ =gUnknown_3005E10
	ldrh r1, [r1, 0x14]
	ldr r2, _080FB7E4 @ =0x00000985
	adds r0, r2
	b _080FB9C0
	.align 2, 0
_080FB7DC: .4byte Rfu
_080FB7E0: .4byte gUnknown_3005E10
_080FB7E4: .4byte 0x00000985
_080FB7E8:
	ldr r0, _080FB7F8 @ =Rfu
	ldr r1, _080FB7FC @ =gUnknown_3005E10
	ldrh r1, [r1, 0x14]
	ldr r7, _080FB800 @ =0x000008f6
	adds r0, r7
	ldrb r2, [r0]
	b _080FB9C0
	.align 2, 0
_080FB7F8: .4byte Rfu
_080FB7FC: .4byte gUnknown_3005E10
_080FB800: .4byte 0x000008f6
_080FB804:
	ldr r1, _080FB824 @ =Rfu
	movs r0, 0x12
	strh r0, [r1, 0x4]
	ldr r0, _080FB828 @ =0x00000987
	adds r1, r0
	ldrb r0, [r1]
	cmp r0, 0x1
	bhi _080FB830
	adds r0, 0x1
	strb r0, [r1]
	ldr r0, _080FB82C @ =sub_80FC028
	movs r1, 0x2
	bl CreateTask
	b _080FB9C2
	.align 2, 0
_080FB824: .4byte Rfu
_080FB828: .4byte 0x00000987
_080FB82C: .4byte sub_80FC028
_080FB830:
	movs r0, 0x2
	movs r1, 0x23
	bl sub_80FB9E4
	b _080FB9C2
_080FB83A:
	ldr r4, _080FB860 @ =Rfu
	movs r0, 0xD
	strh r0, [r4, 0x4]
	movs r0, 0x3
	movs r1, 0
	bl sub_80FB9E4
	ldr r1, _080FB864 @ =0x000008f6
	adds r0, r4, r1
	ldrb r1, [r0]
	ldr r2, _080FB868 @ =0x000008f7
	adds r4, r2
	movs r0, 0x10
	adds r2, r4, 0
	movs r3, 0x46
	bl rfu_setRecvBuffer
	b _080FB9C2
	.align 2, 0
_080FB860: .4byte Rfu
_080FB864: .4byte 0x000008f6
_080FB868: .4byte 0x000008f7
_080FB86C:
	movs r0, 0x2
	movs r1, 0x25
	bl sub_80FB9E4
	b _080FB9C2
_080FB876:
	ldr r0, _080FB88C @ =gUnknown_3005E10
	ldrb r1, [r0]
	ldrh r0, [r0, 0x14]
	ands r1, r0
	cmp r1, 0
	bne _080FB884
	b _080FB9C2
_080FB884:
	ldr r0, _080FB890 @ =Rfu
	adds r0, 0xF0
	movs r1, 0x1
	b _080FB9C0
	.align 2, 0
_080FB88C: .4byte gUnknown_3005E10
_080FB890: .4byte Rfu
_080FB894:
	ldr r2, _080FB8B4 @ =Rfu
	adds r1, r2, 0
	adds r1, 0xF0
	movs r0, 0x3
	strb r0, [r1]
	ldr r0, _080FB8B8 @ =gRfuLinkStatus
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, 0
	beq _080FB8AA
	b _080FB9C2
_080FB8AA:
	ldr r7, _080FB8BC @ =0x000008f4
	adds r0, r2, r7
	ldrb r1, [r0]
	movs r1, 0x1
	b _080FB9C0
	.align 2, 0
_080FB8B4: .4byte Rfu
_080FB8B8: .4byte gRfuLinkStatus
_080FB8BC: .4byte 0x000008f4
_080FB8C0:
	ldr r0, _080FB900 @ =Rfu
	adds r0, 0xF0
	movs r1, 0x2
	strb r1, [r0]
_080FB8C8:
	ldr r2, _080FB900 @ =Rfu
	adds r1, r2, 0
	adds r1, 0xF0
	ldrb r0, [r1]
	cmp r0, 0x2
	beq _080FB8D8
	movs r0, 0x4
	strb r0, [r1]
_080FB8D8:
	ldrb r0, [r2, 0xC]
	cmp r0, 0x1
	bne _080FB916
	ldr r0, _080FB904 @ =gReceivedRemoteLinkPlayers
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _080FB934
	ldr r0, _080FB908 @ =0x0000099a
	adds r2, r0
	ldr r0, _080FB90C @ =gUnknown_3005E10
	ldrb r1, [r0, 0x14]
	ldrb r0, [r2]
	bics r0, r1
	strb r0, [r2]
	cmp r0, 0
	bne _080FB910
	adds r0, r4, 0
	bl sub_80FB0E8
	b _080FB934
	.align 2, 0
_080FB900: .4byte Rfu
_080FB904: .4byte gReceivedRemoteLinkPlayers
_080FB908: .4byte 0x0000099a
_080FB90C: .4byte gUnknown_3005E10
_080FB910:
	bl sub_80FB174
	b _080FB934
_080FB916:
	ldr r1, _080FB964 @ =0x0000099c
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, 0x2
	beq _080FB934
	ldr r0, _080FB968 @ =gReceivedRemoteLinkPlayers
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _080FB934
	adds r0, r4, 0
	bl sub_80FB0E8
	movs r0, 0
	bl sub_80FD760
_080FB934:
	ldr r0, _080FB96C @ =gRfuLinkStatus
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, 0xFF
	bne _080FB95A
	ldr r0, _080FB970 @ =gUnknown_3005E10
	ldrb r0, [r0, 0x7]
	cmp r0, 0
	bne _080FB95A
	ldr r0, _080FB974 @ =sub_80F8B34
	bl FuncIsActiveTask
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080FB95A
	ldr r1, _080FB978 @ =Rfu
	movs r0, 0x11
	strh r0, [r1, 0x4]
_080FB95A:
	movs r0, 0x2
	adds r1, r4, 0
	bl sub_80FB9E4
	b _080FB9C2
	.align 2, 0
_080FB964: .4byte 0x0000099c
_080FB968: .4byte gReceivedRemoteLinkPlayers
_080FB96C: .4byte gRfuLinkStatus
_080FB970: .4byte gUnknown_3005E10
_080FB974: .4byte sub_80F8B34
_080FB978: .4byte Rfu
_080FB97C:
	ldr r0, _080FB984 @ =Rfu
	ldr r2, _080FB988 @ =0x0000099b
	adds r0, r2
	b _080FB9BE
	.align 2, 0
_080FB984: .4byte Rfu
_080FB988: .4byte 0x0000099b
_080FB98C:
	movs r0, 0x1
	movs r1, 0xF3
	bl sub_80FB9E4
	movs r0, 0xF3
	bl sub_80FB0E8
	ldr r0, _080FB9A4 @ =Rfu
	adds r0, 0xEF
	movs r1, 0x1
	b _080FB9C0
	.align 2, 0
_080FB9A4: .4byte Rfu
_080FB9A8:
	adds r0, r4, 0
	bl sub_80FB0E8
	movs r0, 0x1
	adds r1, r4, 0
	bl sub_80FB9E4
	ldr r0, _080FB9C8 @ =Rfu
	ldr r7, _080FB9CC @ =0x00000993
	adds r0, r7
	ldrb r1, [r0]
_080FB9BE:
	movs r1, 0
_080FB9C0:
	strb r1, [r0]
_080FB9C2:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080FB9C8: .4byte Rfu
_080FB9CC: .4byte 0x00000993
	thumb_func_end sub_80FB5EC

	thumb_func_start sub_80FB9D0
sub_80FB9D0: @ 80FB9D0
	ldr r0, _080FB9DC @ =Rfu
	ldr r1, _080FB9E0 @ =0x0000099c
	adds r0, r1
	movs r1, 0x2
	strb r1, [r0]
	bx lr
	.align 2, 0
_080FB9DC: .4byte Rfu
_080FB9E0: .4byte 0x0000099c
	thumb_func_end sub_80FB9D0

	thumb_func_start sub_80FB9E4
sub_80FB9E4: @ 80FB9E4
	ldr r2, _080FB9F0 @ =Rfu
	adds r3, r2, 0
	adds r3, 0xF1
	strb r0, [r3]
	strh r1, [r2, 0xA]
	bx lr
	.align 2, 0
_080FB9F0: .4byte Rfu
	thumb_func_end sub_80FB9E4

	thumb_func_start sub_80FB9F4
sub_80FB9F4: @ 80FB9F4
	ldr r0, _080FB9FC @ =Rfu
	adds r0, 0xF1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_080FB9FC: .4byte Rfu
	thumb_func_end sub_80FB9F4

	thumb_func_start sub_80FBA00
sub_80FBA00: @ 80FBA00
	push {lr}
	bl sub_80FB9F4
	lsls r0, 24
	lsrs r0, 24
	subs r0, 0x1
	cmp r0, 0x1
	bls _080FBA14
	movs r0, 0
	b _080FBA16
_080FBA14:
	movs r0, 0x1
_080FBA16:
	pop {r1}
	bx r1
	thumb_func_end sub_80FBA00

	thumb_func_start sub_80FBA1C
sub_80FBA1C: @ 80FBA1C
	ldr r0, _080FBA28 @ =Rfu
	movs r1, 0x9A
	lsls r1, 4
	adds r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_080FBA28: .4byte Rfu
	thumb_func_end sub_80FBA1C

	thumb_func_start Rfu_IsMaster
Rfu_IsMaster: @ 80FBA2C
	ldr r0, _080FBA34 @ =Rfu
	ldrb r0, [r0, 0xC]
	bx lr
	.align 2, 0
_080FBA34: .4byte Rfu
	thumb_func_end Rfu_IsMaster

	thumb_func_start RFUVSync
RFUVSync: @ 80FBA38
	push {lr}
	bl rfu_syncVBlank_
	pop {r0}
	bx r0
	thumb_func_end RFUVSync

	thumb_func_start sub_80FBA44
sub_80FBA44: @ 80FBA44
	push {lr}
	sub sp, 0x4
	movs r0, 0
	str r0, [sp]
	ldr r1, _080FBA5C @ =gRecvCmds
	ldr r2, _080FBA60 @ =0x05000014
	mov r0, sp
	bl CpuSet
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_080FBA5C: .4byte gRecvCmds
_080FBA60: .4byte 0x05000014
	thumb_func_end sub_80FBA44

	thumb_func_start sub_80FBA64
sub_80FBA64: @ 80FBA64
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	thumb_func_end sub_80FBA64

	thumb_func_start sub_80FBA78
sub_80FBA78: @ 80FBA78
	push {r4,lr}
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	bl ResetTasks
	bl ResetPaletteFade
	ldr r0, _080FBAF4 @ =sub_80FBA64
	bl SetVBlankCallback
	bl IsWirelessAdapterConnected
	lsls r0, 24
	cmp r0, 0
	beq _080FBAEC
	ldr r1, _080FBAF8 @ =gLinkType
	ldr r2, _080FBAFC @ =0x00001111
	adds r0, r2, 0
	strh r0, [r1]
	bl sub_800B1F4
	bl OpenLink
	ldr r0, _080FBB00 @ =gMain
	ldrh r0, [r0, 0x24]
	bl SeedRng
	movs r4, 0
_080FBAB4:
	bl Random
	ldr r1, _080FBB04 @ =gSaveBlock2Ptr
	ldr r1, [r1]
	adds r1, 0xA
	adds r1, r4
	strb r0, [r1]
	adds r4, 0x1
	cmp r4, 0x3
	ble _080FBAB4
	movs r1, 0xAA
	lsls r1, 5
	movs r0, 0
	bl SetGpuReg
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	bl sub_80FBB20
	ldr r0, _080FBB08 @ =sub_80FBB74
	bl SetMainCallback2
_080FBAEC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080FBAF4: .4byte sub_80FBA64
_080FBAF8: .4byte gLinkType
_080FBAFC: .4byte 0x00001111
_080FBB00: .4byte gMain
_080FBB04: .4byte gSaveBlock2Ptr
_080FBB08: .4byte sub_80FBB74
	thumb_func_end sub_80FBA78

	thumb_func_start sub_80FBB0C
sub_80FBB0C: @ 80FBB0C
	push {lr}
	ldr r0, _080FBB1C @ =sub_80F8B34
	bl FuncIsActiveTask
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_080FBB1C: .4byte sub_80F8B34
	thumb_func_end sub_80FBB0C

	thumb_func_start sub_80FBB20
sub_80FBB20: @ 80FBB20
	push {r4,lr}
	ldr r4, _080FBB44 @ =nullsub_89
	adds r0, r4, 0
	bl FuncIsActiveTask
	lsls r0, 24
	cmp r0, 0
	bne _080FBB3E
	adds r0, r4, 0
	movs r1, 0
	bl CreateTask
	ldr r1, _080FBB48 @ =Rfu
	adds r1, 0x66
	strb r0, [r1]
_080FBB3E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080FBB44: .4byte nullsub_89
_080FBB48: .4byte Rfu
	thumb_func_end sub_80FBB20

	thumb_func_start sub_80FBB4C
sub_80FBB4C: @ 80FBB4C
	push {lr}
	ldr r0, _080FBB6C @ =nullsub_89
	bl FuncIsActiveTask
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080FBB66
	ldr r0, _080FBB70 @ =Rfu
	adds r0, 0x66
	ldrb r0, [r0]
	bl DestroyTask
_080FBB66:
	pop {r0}
	bx r0
	.align 2, 0
_080FBB6C: .4byte nullsub_89
_080FBB70: .4byte Rfu
	thumb_func_end sub_80FBB4C

	thumb_func_start sub_80FBB74
sub_80FBB74: @ 80FBB74
	push {lr}
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	thumb_func_end sub_80FBB74

	thumb_func_start sub_80FBB8C
sub_80FBB8C: @ 80FBB8C
	push {r4-r6,lr}
	adds r4, r0, 0
	ldr r1, _080FBBC4 @ =Rfu
	movs r0, 0x1
	strb r0, [r1, 0xC]
	bl sub_80FAF1C
	ldr r0, _080FBBC8 @ =sub_80FB184
	movs r1, 0
	bl sub_80FD430
	ldr r2, _080FBBCC @ =gUnknown_203ABF0
	adds r1, r2, 0
	ldr r0, _080FBBD0 @ =gUnknown_843EBB4
	ldm r0!, {r3,r5,r6}
	stm r1!, {r3,r5,r6}
	ldm r0!, {r3,r5,r6}
	stm r1!, {r3,r5,r6}
	ldr r0, _080FBBD4 @ =gUnknown_843EBCC
	subs r4, 0x1
	adds r4, r0
	ldrb r0, [r4]
	strh r0, [r2, 0x2]
	bl sub_80F8E74
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080FBBC4: .4byte Rfu
_080FBBC8: .4byte sub_80FB184
_080FBBCC: .4byte gUnknown_203ABF0
_080FBBD0: .4byte gUnknown_843EBB4
_080FBBD4: .4byte gUnknown_843EBCC
	thumb_func_end sub_80FBB8C

	thumb_func_start sub_80FBBD8
sub_80FBBD8: @ 80FBBD8
	push {lr}
	ldr r1, _080FBBF4 @ =Rfu
	movs r0, 0
	strb r0, [r1, 0xC]
	bl sub_80FAF1C
	ldr r0, _080FBBF8 @ =sub_80FB37C
	ldr r1, _080FBBFC @ =sub_80F8D20
	bl sub_80FD430
	bl sub_80F8F10
	pop {r0}
	bx r0
	.align 2, 0
_080FBBF4: .4byte Rfu
_080FBBF8: .4byte sub_80FB37C
_080FBBFC: .4byte sub_80F8D20
	thumb_func_end sub_80FBBD8

	thumb_func_start sub_80FBC00
sub_80FBC00: @ 80FBC00
	push {r4-r7,lr}
	ldr r0, _080FBC4C @ =gUnknown_203ADFA
	ldrb r0, [r0]
	subs r0, 0x2
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bls _080FBC46
	ldr r4, _080FBC50 @ =Rfu
	movs r5, 0
	movs r0, 0x2
	strb r0, [r4, 0xC]
	bl sub_80FAF1C
	ldr r0, _080FBC54 @ =sub_80FB5EC
	movs r1, 0
	bl sub_80FD430
	ldr r2, _080FBC58 @ =gUnknown_203ABF0
	adds r1, r2, 0
	ldr r0, _080FBC5C @ =gUnknown_843EBB4
	ldm r0!, {r3,r6,r7}
	stm r1!, {r3,r6,r7}
	ldm r0!, {r3,r6,r7}
	stm r1!, {r3,r6,r7}
	strb r5, [r2, 0x11]
	movs r0, 0x96
	lsls r0, 2
	strh r0, [r2, 0x12]
	ldr r0, _080FBC60 @ =sub_80F8B34
	movs r1, 0x1
	bl CreateTask
	adds r4, 0x67
	strb r0, [r4]
_080FBC46:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080FBC4C: .4byte gUnknown_203ADFA
_080FBC50: .4byte Rfu
_080FBC54: .4byte sub_80FB5EC
_080FBC58: .4byte gUnknown_203ABF0
_080FBC5C: .4byte gUnknown_843EBB4
_080FBC60: .4byte sub_80F8B34
	thumb_func_end sub_80FBC00

	thumb_func_start sub_80FBC64
sub_80FBC64: @ 80FBC64
	ldrb r1, [r0, 0x1]
	lsls r1, 8
	ldrb r0, [r0]
	orrs r0, r1
	bx lr
	thumb_func_end sub_80FBC64

	thumb_func_start sub_80FBC70
sub_80FBC70: @ 80FBC70
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	str r0, [sp]
	lsls r1, 16
	lsrs r1, 16
	mov r10, r1
	movs r0, 0xFF
	mov r9, r0
	movs r7, 0
	ldr r1, _080FBCF4 @ =gRfuLinkStatus
	mov r8, r1
_080FBC8E:
	lsls r4, r7, 5
	adds r5, r4, 0
	adds r5, 0x14
	mov r1, r8
	ldr r0, [r1]
	adds r0, r5
	adds r0, 0x8
	bl sub_80FBC64
	lsls r0, 16
	lsrs r6, r0, 16
	mov r1, r8
	ldr r0, [r1]
	adds r0, r4
	ldrh r0, [r0, 0x18]
	bl sub_80FA44C
	cmp r0, 0
	beq _080FBCD8
	mov r0, r8
	ldr r1, [r0]
	adds r1, r5
	adds r1, 0x15
	ldr r0, [sp]
	bl StringCompare
	cmp r0, 0
	bne _080FBCD8
	cmp r10, r6
	bne _080FBCD8
	mov r9, r7
	mov r1, r8
	ldr r0, [r1]
	adds r0, r4
	ldrb r0, [r0, 0x16]
	cmp r0, 0xFF
	bne _080FBCE2
_080FBCD8:
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	cmp r7, 0x3
	bls _080FBC8E
_080FBCE2:
	mov r0, r9
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080FBCF4: .4byte gRfuLinkStatus
	thumb_func_end sub_80FBC70

	thumb_func_start sub_80FBCF8
sub_80FBCF8: @ 80FBCF8
	push {r4-r6,lr}
	adds r6, r0, 0
	lsls r0, r6, 24
	lsrs r0, 24
	bl rfu_REQ_disconnect
	bl rfu_waitREQComplete
	ldr r4, _080FBD3C @ =Rfu
	ldr r0, _080FBD40 @ =0x0000099a
	adds r5, r4, r0
	ldrb r0, [r5]
	bics r0, r6
	strb r0, [r5]
	ldr r1, _080FBD44 @ =0x00000992
	adds r6, r4, r1
	ldrb r1, [r6]
	movs r0, 0x1
	bl rfu_clearSlot
	ldrb r0, [r5]
	ldr r1, _080FBD48 @ =0x0000093f
	adds r4, r1
	adds r1, r4, 0
	movs r2, 0x46
	bl rfu_UNI_setSendData
	ldrb r0, [r5]
	bl sub_80F886C
	strb r0, [r6]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080FBD3C: .4byte Rfu
_080FBD40: .4byte 0x0000099a
_080FBD44: .4byte 0x00000992
_080FBD48: .4byte 0x0000093f
	thumb_func_end sub_80FBCF8

	thumb_func_start sub_80FBD4C
sub_80FBD4C: @ 80FBD4C
	push {lr}
	lsls r1, 16
	lsrs r1, 16
	bl sub_80FBC70
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0xFF
	beq _080FBD66
	movs r0, 0x1
	lsls r0, r1
	bl sub_80FBCF8
_080FBD66:
	pop {r0}
	bx r0
	thumb_func_end sub_80FBD4C

	thumb_func_start sub_80FBD6C
sub_80FBD6C: @ 80FBD6C
	push {r4-r6,lr}
	adds r4, r0, 0
	cmp r4, 0
	beq _080FBDAC
	movs r3, 0
	movs r2, 0
	ldr r5, _080FBDB4 @ =Rfu+0x996
	adds r6, r5, 0x4
_080FBD7C:
	adds r0, r2, r5
	ldrb r0, [r0]
	cmp r0, r4
	bne _080FBD9A
	ldrb r0, [r6]
	asrs r0, r2
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080FBD9A
	adds r0, r1, 0
	lsls r0, r2
	orrs r3, r0
	lsls r0, r3, 24
	lsrs r3, r0, 24
_080FBD9A:
	adds r2, 0x1
	cmp r2, 0x3
	ble _080FBD7C
	cmp r3, 0
	beq _080FBDAC
	adds r0, r3, 0
	movs r1, 0x2
	bl sub_80FBE20
_080FBDAC:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080FBDB4: .4byte Rfu+0x996
	thumb_func_end sub_80FBD6C

	thumb_func_start sub_80FBDB8
sub_80FBDB8: @ 80FBDB8
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r6, _080FBE10 @ =gSendCmd
	ldrh r0, [r6]
	cmp r0, 0
	bne _080FBE08
	ldr r5, _080FBE14 @ =Rfu
	movs r1, 0x9A
	lsls r1, 4
	adds r0, r5, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _080FBE08
	movs r0, 0xED
	lsls r0, 8
	bl sub_80F9D04
	ldr r1, _080FBE18 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldrh r1, [r0, 0x8]
	strh r1, [r6, 0x2]
	ldrh r1, [r0, 0xA]
	strh r1, [r6, 0x4]
	ldr r1, _080FBE1C @ =gUnknown_843EC41
	movs r2, 0x8
	ldrsh r0, [r0, r2]
	adds r0, r1
	ldrb r1, [r5, 0xD]
	ldrb r0, [r0]
	subs r1, r0
	strb r1, [r5, 0xD]
	ldrb r0, [r5, 0xD]
	strh r0, [r6, 0x6]
	adds r0, r4, 0
	bl DestroyTask
_080FBE08:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080FBE10: .4byte gSendCmd
_080FBE14: .4byte Rfu
_080FBE18: .4byte gTasks
_080FBE1C: .4byte gUnknown_843EC41
	thumb_func_end sub_80FBDB8

	thumb_func_start sub_80FBE20
sub_80FBE20: @ 80FBE20
	push {r4-r6,lr}
	adds r4, r0, 0
	adds r6, r1, 0
	ldr r5, _080FBE50 @ =sub_80FBDB8
	adds r0, r5, 0
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0xFF
	bne _080FBE58
	adds r0, r5, 0
	movs r1, 0x5
	bl CreateTask
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r1, _080FBE54 @ =gTasks
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r0, r1
	strh r4, [r0, 0x8]
	b _080FBE68
	.align 2, 0
_080FBE50: .4byte sub_80FBDB8
_080FBE54: .4byte gTasks
_080FBE58:
	ldr r0, _080FBE7C @ =gTasks
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x8]
	orrs r4, r0
	strh r4, [r1, 0x8]
_080FBE68:
	ldr r1, _080FBE7C @ =gTasks
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r0, r1
	strh r6, [r0, 0xA]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080FBE7C: .4byte gTasks
	thumb_func_end sub_80FBE20

	thumb_func_start sub_80FBE80
sub_80FBE80: @ 80FBE80
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	ldr r1, _080FBED8 @ =gTasks+0x8
	adds r4, r0, r1
	bl sub_80F8EA4
	lsls r0, 24
	cmp r0, 0
	beq _080FBF30
	adds r0, r4, 0
	adds r0, 0x10
	bl sub_80FBC64
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	adds r0, r4, 0
	bl sub_80FBC70
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0xFF
	beq _080FBF18
	ldr r0, _080FBEDC @ =gRfuLinkStatus
	ldr r0, [r0]
	lsls r1, r2, 5
	adds r0, r1
	ldrb r0, [r0, 0x16]
	cmp r0, 0xFF
	beq _080FBEE8
	ldr r0, _080FBEE0 @ =Rfu
	ldr r1, _080FBEE4 @ =0x000008f5
	adds r0, r1
	strb r2, [r0]
	bl sub_80F8ECC
	cmp r0, 0
	beq _080FBF36
	b _080FBF10
	.align 2, 0
_080FBED8: .4byte gTasks+0x8
_080FBEDC: .4byte gRfuLinkStatus
_080FBEE0: .4byte Rfu
_080FBEE4: .4byte 0x000008f5
_080FBEE8:
	bl sub_80F9800
	ldrb r1, [r0, 0xA]
	movs r5, 0x7F
	adds r0, r5, 0
	ands r0, r1
	cmp r0, 0x15
	beq _080FBF30
	bl sub_80F9800
	ldrb r1, [r0, 0xA]
	adds r0, r5, 0
	ands r0, r1
	cmp r0, 0x16
	beq _080FBF30
	movs r1, 0xE0
	lsls r1, 7
	movs r0, 0x2
	bl sub_80FB9E4
_080FBF10:
	adds r0, r6, 0
	bl DestroyTask
	b _080FBF36
_080FBF18:
	ldrh r0, [r4, 0x1E]
	adds r0, 0x1
	strh r0, [r4, 0x1E]
	ldr r0, _080FBF28 @ =Rfu
	ldr r1, _080FBF2C @ =0x000008f5
	adds r0, r1
	strb r2, [r0]
	b _080FBF36
	.align 2, 0
_080FBF28: .4byte Rfu
_080FBF2C: .4byte 0x000008f5
_080FBF30:
	ldrh r0, [r4, 0x1E]
	adds r0, 0x1
	strh r0, [r4, 0x1E]
_080FBF36:
	movs r1, 0x1E
	ldrsh r0, [r4, r1]
	cmp r0, 0xF0
	ble _080FBF4E
	movs r1, 0xE0
	lsls r1, 7
	movs r0, 0x2
	bl sub_80FB9E4
	adds r0, r6, 0
	bl DestroyTask
_080FBF4E:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80FBE80

	thumb_func_start sub_80FBF54
sub_80FBF54: @ 80FBF54
	push {r4-r6,lr}
	adds r6, r0, 0
	lsls r5, r1, 16
	lsrs r5, 16
	ldr r0, _080FBF8C @ =Rfu
	adds r0, 0xF1
	movs r1, 0
	strb r1, [r0]
	ldr r0, _080FBF90 @ =sub_80FBE80
	movs r1, 0x3
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	ldr r0, _080FBF94 @ =gTasks+0x8
	adds r4, r0
	adds r0, r4, 0
	adds r1, r6, 0
	bl StringCopy
	strh r5, [r4, 0x10]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080FBF8C: .4byte Rfu
_080FBF90: .4byte sub_80FBE80
_080FBF94: .4byte gTasks+0x8
	thumb_func_end sub_80FBF54

	thumb_func_start sub_80FBF98
sub_80FBF98: @ 80FBF98
	push {r4,r5,lr}
	adds r4, r1, 0
	lsls r0, 16
	lsrs r5, r0, 16
	bl sub_80F9800
	ldrb r1, [r0, 0xA]
	movs r2, 0x7F
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0x45
	bne _080FBFBE
	ldrb r1, [r4, 0xA]
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0x45
	beq _080FC01E
_080FBFBA:
	movs r0, 0x1
	b _080FC020
_080FBFBE:
	ldrb r1, [r4, 0xA]
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0x40
	bne _080FBFBA
	cmp r5, 0x44
	bne _080FC01E
	ldr r5, _080FBFEC @ =Rfu+0x10a
	ldrh r0, [r5, 0x8]
	ldr r3, _080FBFF0 @ =0x000003ff
	adds r2, r3, 0
	ands r2, r0
	movs r0, 0xCE
	lsls r0, 1
	cmp r2, r0
	bne _080FBFF4
	ldrh r1, [r4, 0x8]
	adds r0, r3, 0
	ands r0, r1
	cmp r0, r2
	beq _080FC01E
	b _080FBFBA
	.align 2, 0
_080FBFEC: .4byte Rfu+0x10a
_080FBFF0: .4byte 0x000003ff
_080FBFF4:
	ldrh r1, [r4, 0x8]
	adds r0, r3, 0
	ands r0, r1
	cmp r0, r2
	bne _080FBFBA
	ldrb r2, [r4, 0xB]
	movs r0, 0xFE
	ldrb r3, [r5, 0xB]
	adds r1, r0, 0
	ands r1, r2
	ands r0, r3
	cmp r1, r0
	bne _080FBFBA
	ldrb r2, [r4, 0x9]
	movs r0, 0xFC
	ldrb r3, [r5, 0x9]
	adds r1, r0, 0
	ands r1, r2
	ands r0, r3
	cmp r1, r0
	bne _080FBFBA
_080FC01E:
	movs r0, 0
_080FC020:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80FBF98

	thumb_func_start sub_80FC028
sub_80FC028: @ 80FC028
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r5, r0, 24
	mov r8, r5
	ldr r6, _080FC0E0 @ =Rfu
	adds r0, r6, 0
	adds r0, 0xF1
	ldrb r0, [r0]
	cmp r0, 0x4
	bne _080FC046
	adds r0, r5, 0
	bl DestroyTask
_080FC046:
	ldr r1, _080FC0E4 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	lsls r0, 16
	movs r1, 0x96
	lsls r1, 17
	cmp r0, r1
	ble _080FC070
	movs r1, 0xE0
	lsls r1, 7
	movs r0, 0x2
	bl sub_80FB9E4
	adds r0, r5, 0
	bl DestroyTask
_080FC070:
	ldr r1, _080FC0E8 @ =0x00000985
	adds r0, r6, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _080FC108
	ldr r0, _080FC0EC @ =gUnknown_3005E10
	ldrb r0, [r0, 0x6]
	cmp r0, 0
	bne _080FC108
	movs r2, 0x86
	lsls r2, 1
	adds r0, r6, r2
	bl sub_80FBC64
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	ldr r2, _080FC0F0 @ =0x00000119
	adds r0, r6, r2
	bl sub_80FBC70
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0xFF
	beq _080FC108
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	ldr r7, _080FC0F4 @ =gRfuLinkStatus
	lsls r4, r2, 5
	adds r2, r4, 0
	adds r2, 0x14
	ldr r1, [r7]
	adds r1, r2
	adds r1, 0x6
	bl sub_80FBF98
	cmp r0, 0
	bne _080FC0F8
	ldr r0, [r7]
	adds r1, r0, r4
	ldrb r0, [r1, 0x16]
	cmp r0, 0xFF
	beq _080FC108
	ldrh r0, [r1, 0x14]
	movs r1, 0x5A
	bl sub_80FD610
	lsls r0, 24
	cmp r0, 0
	bne _080FC108
	movs r0, 0xA
	strh r0, [r6, 0x4]
	adds r0, r5, 0
	bl DestroyTask
	b _080FC108
	.align 2, 0
_080FC0E0: .4byte Rfu
_080FC0E4: .4byte gTasks
_080FC0E8: .4byte 0x00000985
_080FC0EC: .4byte gUnknown_3005E10
_080FC0F0: .4byte 0x00000119
_080FC0F4: .4byte gRfuLinkStatus
_080FC0F8:
	movs r1, 0xE0
	lsls r1, 7
	movs r0, 0x2
	bl sub_80FB9E4
	mov r0, r8
	bl DestroyTask
_080FC108:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80FC028

	thumb_func_start sub_80FC114
sub_80FC114: @ 80FC114
	push {r4-r7,lr}
	adds r3, r0, 0
	adds r5, r1, 0
	lsls r4, r2, 24
	lsrs r4, 24
	ldr r6, _080FC184 @ =Rfu
	ldr r1, _080FC188 @ =0x00000987
	adds r0, r6, r1
	movs r7, 0
	strb r7, [r0]
	adds r0, r6, 0
	adds r0, 0xF1
	strb r7, [r0]
	ldr r1, _080FC18C @ =0x00000119
	adds r0, r6, r1
	adds r1, r3, 0
	bl StringCopy
	movs r1, 0x85
	lsls r1, 1
	adds r0, r6, r1
	adds r1, r5, 0
	movs r2, 0xD
	bl memcpy
	bl sub_80FEB3C
	ldr r0, _080FC190 @ =sub_80FC028
	movs r1, 0x2
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _080FC194 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r5
	strh r4, [r1, 0xA]
	ldr r0, _080FC198 @ =sub_80F8B34
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r1, r0, 24
	adds r2, r1, 0
	cmp r4, 0x45
	bne _080FC19C
	cmp r1, 0xFF
	beq _080FC1AA
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r5
	movs r1, 0x1
	strh r1, [r0, 0x16]
	b _080FC1AA
	.align 2, 0
_080FC184: .4byte Rfu
_080FC188: .4byte 0x00000987
_080FC18C: .4byte 0x00000119
_080FC190: .4byte sub_80FC028
_080FC194: .4byte gTasks
_080FC198: .4byte sub_80F8B34
_080FC19C:
	cmp r2, 0xFF
	beq _080FC1AA
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r0, r5
	strh r7, [r0, 0x16]
_080FC1AA:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80FC114

	thumb_func_start sub_80FC1B0
sub_80FC1B0: @ 80FC1B0
	push {lr}
	ldr r0, _080FC1C0 @ =Rfu
	adds r0, 0xF0
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _080FC1C4
	movs r0, 0
	b _080FC1C6
	.align 2, 0
_080FC1C0: .4byte Rfu
_080FC1C4:
	movs r0, 0x1
_080FC1C6:
	pop {r1}
	bx r1
	thumb_func_end sub_80FC1B0

	thumb_func_start sub_80FC1CC
sub_80FC1CC: @ 80FC1CC
	push {r4,lr}
	movs r1, 0
	ldr r0, _080FC1F0 @ =gUnknown_3005E10
	ldrb r2, [r0]
	ldr r4, _080FC1F4 @ =Rfu+0x989
	movs r3, 0x1
_080FC1D8:
	adds r0, r2, 0
	asrs r0, r1
	ands r0, r3
	cmp r0, 0
	beq _080FC1F8
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r0, 0
	bne _080FC1F8
	movs r0, 0
	b _080FC200
	.align 2, 0
_080FC1F0: .4byte gUnknown_3005E10
_080FC1F4: .4byte Rfu+0x989
_080FC1F8:
	adds r1, 0x1
	cmp r1, 0x3
	ble _080FC1D8
	movs r0, 0x1
_080FC200:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80FC1CC

	thumb_func_start sub_80FC208
sub_80FC208: @ 80FC208
	push {r4,lr}
	movs r4, 0
_080FC20C:
	lsls r2, r4, 24
	lsrs r2, 24
	ldr r0, _080FC224 @ =gUnknown_843EE28
	movs r1, 0
	bl nullsub_87
	adds r4, 0x1
	cmp r4, 0x13
	ble _080FC20C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080FC224: .4byte gUnknown_843EE28
	thumb_func_end sub_80FC208

	thumb_func_start sub_80FC228
sub_80FC228: @ 80FC228
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	bl GetBlockReceivedStatus
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x1C
	movs r2, 0x13
	movs r3, 0x2
	bl nullsub_88
	ldr r4, _080FC2F8 @ =gRfuLinkStatus
	ldr r0, [r4]
	ldrb r0, [r0, 0x2]
	movs r1, 0x14
	movs r2, 0x1
	movs r3, 0x1
	bl nullsub_88
	ldr r0, [r4]
	ldrb r0, [r0, 0x3]
	movs r1, 0x17
	movs r2, 0x1
	movs r3, 0x1
	bl nullsub_88
	ldr r0, _080FC2FC @ =Rfu
	ldrb r0, [r0, 0xC]
	cmp r0, 0x1
	bne _080FC304
	movs r6, 0
	adds r7, r4, 0
	movs r5, 0x14
_080FC26C:
	ldr r2, [r7]
	ldrb r0, [r2, 0x7]
	asrs r0, r6
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080FC2AA
	lsls r0, r6, 5
	adds r0, r2, r0
	ldrh r0, [r0, 0x18]
	adds r4, r6, 0x3
	lsls r4, 24
	lsrs r4, 24
	adds r2, r4, 0
	movs r3, 0x4
	bl nullsub_88
	ldr r0, [r7]
	adds r0, r5
	adds r0, 0x6
	movs r1, 0x6
	adds r2, r4, 0
	bl nullsub_87
	ldr r0, [r7]
	adds r0, r5
	adds r0, 0x15
	movs r1, 0x16
	adds r2, r4, 0
	bl nullsub_87
_080FC2AA:
	adds r5, 0x20
	adds r6, 0x1
	cmp r6, 0x3
	ble _080FC26C
	movs r6, 0
	ldr r0, _080FC2FC @ =Rfu
	mov r8, r0
_080FC2B8:
	movs r5, 0
	adds r7, r6, 0x1
	lsls r0, r6, 3
	adds r2, r6, 0
	adds r2, 0xB
	subs r0, r6
	lsls r0, 1
	mov r1, r8
	adds r1, 0x14
	adds r4, r0, r1
	lsls r6, r2, 24
_080FC2CE:
	ldrb r0, [r4]
	lsls r1, r5, 25
	lsrs r1, 24
	lsrs r2, r6, 24
	movs r3, 0x2
	bl nullsub_88
	adds r4, 0x1
	adds r5, 0x1
	cmp r5, 0xD
	ble _080FC2CE
	adds r6, r7, 0
	cmp r6, 0x3
	ble _080FC2B8
	ldr r0, _080FC300 @ =gUnknown_843EE64	"NOWSLOT"
	movs r1, 0x1
	movs r2, 0xF
	bl nullsub_87
	b _080FC436
	.align 2, 0
_080FC2F8: .4byte gRfuLinkStatus
_080FC2FC: .4byte Rfu
_080FC300: .4byte gUnknown_843EE64
_080FC304:
	ldr r1, [r4]
	ldrb r0, [r1, 0x2]
	cmp r0, 0
	beq _080FC3A0
	ldrb r0, [r1, 0x7]
	cmp r0, 0
	beq _080FC3A0
	movs r6, 0
	movs r5, 0xC0
	lsls r5, 18
_080FC318:
	lsrs r4, r5, 24
	movs r0, 0
	movs r1, 0x1
	adds r2, r4, 0
	movs r3, 0x4
	bl nullsub_88
	ldr r0, _080FC38C @ =gUnknown_843EE47
	movs r1, 0x6
	adds r2, r4, 0
	bl nullsub_87
	ldr r0, _080FC390 @ =gUnknown_843EE57
	movs r1, 0x16
	adds r2, r4, 0
	bl nullsub_87
	movs r1, 0x80
	lsls r1, 17
	adds r5, r1
	adds r6, 0x1
	cmp r6, 0x3
	ble _080FC318
	ldr r5, _080FC394 @ =gRfuLinkStatus
	ldr r1, [r5]
	ldr r4, _080FC398 @ =Rfu
	ldr r0, _080FC39C @ =0x000008f6
	adds r4, r0
	ldrb r0, [r4]
	lsls r0, 5
	adds r1, r0
	ldrh r0, [r1, 0x18]
	movs r1, 0x1
	movs r2, 0x3
	movs r3, 0x4
	bl nullsub_88
	ldrb r1, [r4]
	lsls r1, 5
	adds r1, 0x14
	ldr r0, [r5]
	adds r0, r1
	adds r0, 0x6
	movs r1, 0x6
	movs r2, 0x3
	bl nullsub_87
	ldrb r1, [r4]
	lsls r1, 5
	adds r1, 0x14
	ldr r0, [r5]
	adds r0, r1
	adds r0, 0x15
	movs r1, 0x16
	movs r2, 0x3
	bl nullsub_87
	b _080FC436
	.align 2, 0
_080FC38C: .4byte gUnknown_843EE47
_080FC390: .4byte gUnknown_843EE57
_080FC394: .4byte gRfuLinkStatus
_080FC398: .4byte Rfu
_080FC39C: .4byte 0x000008f6
_080FC3A0:
	movs r6, 0
	ldr r1, _080FC440 @ =gRfuLinkStatus
	ldr r0, [r1]
	ldrb r0, [r0, 0x8]
	cmp r6, r0
	bge _080FC3FC
	adds r7, r1, 0
	movs r1, 0x14
	mov r8, r1
_080FC3B2:
	ldr r0, [r7]
	lsls r5, r6, 5
	adds r1, r0, r5
	ldrb r0, [r1, 0x16]
	cmp r0, 0xFF
	beq _080FC3EE
	ldrh r0, [r1, 0x18]
	adds r4, r6, 0x3
	lsls r4, 24
	lsrs r4, 24
	movs r1, 0x1
	adds r2, r4, 0
	movs r3, 0x4
	bl nullsub_88
	ldr r0, [r7]
	adds r0, r5
	ldrh r0, [r0, 0x14]
	movs r1, 0x6
	adds r2, r4, 0
	movs r3, 0x4
	bl nullsub_88
	ldr r0, [r7]
	add r0, r8
	adds r0, 0x15
	movs r1, 0x16
	adds r2, r4, 0
	bl nullsub_87
_080FC3EE:
	movs r0, 0x20
	add r8, r0
	adds r6, 0x1
	ldr r0, [r7]
	ldrb r0, [r0, 0x8]
	cmp r6, r0
	blt _080FC3B2
_080FC3FC:
	cmp r6, 0x3
	bgt _080FC436
	lsls r0, r6, 24
	movs r1, 0xC0
	lsls r1, 18
	adds r5, r0, r1
_080FC408:
	lsrs r4, r5, 24
	movs r0, 0
	movs r1, 0x1
	adds r2, r4, 0
	movs r3, 0x4
	bl nullsub_88
	ldr r0, _080FC444 @ =gUnknown_843EE47
	movs r1, 0x6
	adds r2, r4, 0
	bl nullsub_87
	ldr r0, _080FC448 @ =gUnknown_843EE57
	movs r1, 0x16
	adds r2, r4, 0
	bl nullsub_87
	movs r0, 0x80
	lsls r0, 17
	adds r5, r0
	adds r6, 0x1
	cmp r6, 0x3
	ble _080FC408
_080FC436:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080FC440: .4byte gRfuLinkStatus
_080FC444: .4byte gUnknown_843EE47
_080FC448: .4byte gUnknown_843EE57
	thumb_func_end sub_80FC228

	thumb_func_start sub_80FC44C
sub_80FC44C: @ 80FC44C
	ldr r0, _080FC458 @ =Rfu
	ldr r1, _080FC45C @ =0x000008d2
	adds r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_080FC458: .4byte Rfu
_080FC45C: .4byte 0x000008d2
	thumb_func_end sub_80FC44C

	thumb_func_start GetRfuRecvQueueLength
GetRfuRecvQueueLength: @ 80FC460
	ldr r0, _080FC46C @ =Rfu
	ldr r1, _080FC470 @ =0x0000069e
	adds r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_080FC46C: .4byte Rfu
_080FC470: .4byte 0x0000069e
	thumb_func_end GetRfuRecvQueueLength

	thumb_func_start nullsub_89
nullsub_89: @ 80FC474
	bx lr
	thumb_func_end nullsub_89

	.align 2, 0 @ Don't pad with nop.
