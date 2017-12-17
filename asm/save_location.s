	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start IsCurMapInLocationList
IsCurMapInLocationList: @ 810B6F4
	push {r4,lr}
	adds r2, r0, 0
	ldr r0, _0810B724 @ =gSaveBlock1Ptr
	ldr r0, [r0]
	movs r1, 0x4
	ldrsb r1, [r0, r1]
	lsls r1, 8
	ldrb r0, [r0, 0x5]
	lsls r0, 24
	asrs r0, 24
	adds r0, r1
	lsls r0, 16
	lsrs r3, r0, 16
	ldrh r0, [r2]
	ldr r1, _0810B728 @ =0x0000ffff
	cmp r0, r1
	beq _0810B734
	adds r4, r1, 0
	adds r1, r2, 0
_0810B71A:
	ldrh r0, [r1]
	cmp r0, r3
	bne _0810B72C
	movs r0, 0x1
	b _0810B736
	.align 2, 0
_0810B724: .4byte gSaveBlock1Ptr
_0810B728: .4byte 0x0000ffff
_0810B72C:
	adds r1, 0x2
	ldrh r0, [r1]
	cmp r0, r4
	bne _0810B71A
_0810B734:
	movs r0, 0
_0810B736:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end IsCurMapInLocationList

	thumb_func_start IsCurMapPokeCenter
IsCurMapPokeCenter: @ 810B73C
	push {lr}
	ldr r0, _0810B748 @ =gUnknown_845303C
	bl IsCurMapInLocationList
	pop {r1}
	bx r1
	.align 2, 0
_0810B748: .4byte gUnknown_845303C
	thumb_func_end IsCurMapPokeCenter

	thumb_func_start IsCurMapReloadLocation
IsCurMapReloadLocation: @ 810B74C
	push {lr}
	ldr r0, _0810B758 @ =gUnknown_8453092
	bl IsCurMapInLocationList
	pop {r1}
	bx r1
	.align 2, 0
_0810B758: .4byte gUnknown_8453092
	thumb_func_end IsCurMapReloadLocation

	thumb_func_start sub_810B75C
sub_810B75C: @ 810B75C
	push {lr}
	ldr r0, _0810B768 @ =gUnknown_8453094
	bl IsCurMapInLocationList
	pop {r1}
	bx r1
	.align 2, 0
_0810B768: .4byte gUnknown_8453094
	thumb_func_end sub_810B75C

	thumb_func_start TrySetPokeCenterWarpStatus
TrySetPokeCenterWarpStatus: @ 810B76C
	push {lr}
	bl IsCurMapPokeCenter
	cmp r0, 0
	bne _0810B788
	ldr r0, _0810B784 @ =gSaveBlock2Ptr
	ldr r2, [r0]
	ldrb r1, [r2, 0x9]
	movs r0, 0xFD
	ands r0, r1
	b _0810B792
	.align 2, 0
_0810B784: .4byte gSaveBlock2Ptr
_0810B788:
	ldr r0, _0810B798 @ =gSaveBlock2Ptr
	ldr r2, [r0]
	ldrb r1, [r2, 0x9]
	movs r0, 0x2
	orrs r0, r1
_0810B792:
	strb r0, [r2, 0x9]
	pop {r0}
	bx r0
	.align 2, 0
_0810B798: .4byte gSaveBlock2Ptr
	thumb_func_end TrySetPokeCenterWarpStatus

	thumb_func_start TrySetReloadWarpStatus
TrySetReloadWarpStatus: @ 810B79C
	push {lr}
	bl IsCurMapReloadLocation
	cmp r0, 0
	bne _0810B7B8
	ldr r0, _0810B7B4 @ =gSaveBlock2Ptr
	ldr r2, [r0]
	ldrb r1, [r2, 0x9]
	movs r0, 0xFB
	ands r0, r1
	b _0810B7C2
	.align 2, 0
_0810B7B4: .4byte gSaveBlock2Ptr
_0810B7B8:
	ldr r0, _0810B7C8 @ =gSaveBlock2Ptr
	ldr r2, [r0]
	ldrb r1, [r2, 0x9]
	movs r0, 0x4
	orrs r0, r1
_0810B7C2:
	strb r0, [r2, 0x9]
	pop {r0}
	bx r0
	.align 2, 0
_0810B7C8: .4byte gSaveBlock2Ptr
	thumb_func_end TrySetReloadWarpStatus

	thumb_func_start sub_810B7CC
sub_810B7CC: @ 810B7CC
	push {lr}
	bl sub_810B75C
	cmp r0, 0
	bne _0810B7E8
	ldr r0, _0810B7E4 @ =gSaveBlock2Ptr
	ldr r2, [r0]
	ldrb r1, [r2, 0x9]
	movs r0, 0xF7
	ands r0, r1
	b _0810B7F2
	.align 2, 0
_0810B7E4: .4byte gSaveBlock2Ptr
_0810B7E8:
	ldr r0, _0810B7F8 @ =gSaveBlock2Ptr
	ldr r2, [r0]
	ldrb r1, [r2, 0x9]
	movs r0, 0x8
	orrs r0, r1
_0810B7F2:
	strb r0, [r2, 0x9]
	pop {r0}
	bx r0
	.align 2, 0
_0810B7F8: .4byte gSaveBlock2Ptr
	thumb_func_end sub_810B7CC

	thumb_func_start TrySetMapSaveWarpStatus
TrySetMapSaveWarpStatus: @ 810B7FC
	push {lr}
	bl TrySetPokeCenterWarpStatus
	bl TrySetReloadWarpStatus
	bl sub_810B7CC
	pop {r0}
	bx r0
	thumb_func_end TrySetMapSaveWarpStatus

	thumb_func_start sub_810B810
sub_810B810: @ 810B810
	ldr r0, _0810B828 @ =gSaveBlock2Ptr
	ldr r2, [r0]
	adds r2, 0xA8
	ldr r0, [r2]
	movs r1, 0x1
	orrs r0, r1
	movs r1, 0x10
	orrs r0, r1
	movs r1, 0x20
	orrs r0, r1
	str r0, [r2]
	bx lr
	.align 2, 0
_0810B828: .4byte gSaveBlock2Ptr
	thumb_func_end sub_810B810

	thumb_func_start sub_810B82C
sub_810B82C: @ 810B82C
	ldr r3, _0810B854 @ =gSaveBlock2Ptr
	ldr r2, [r3]
	ldrb r1, [r2, 0x9]
	movs r0, 0x80
	orrs r0, r1
	strb r0, [r2, 0x9]
	ldr r2, [r3]
	adds r2, 0xA8
	ldr r0, [r2]
	movs r1, 0x2
	orrs r0, r1
	movs r1, 0x4
	orrs r0, r1
	movs r1, 0x8
	orrs r0, r1
	movs r1, 0x80
	lsls r1, 8
	orrs r0, r1
	str r0, [r2]
	bx lr
	.align 2, 0
_0810B854: .4byte gSaveBlock2Ptr
	thumb_func_end sub_810B82C

	.align 2, 0 @ Don't pad with nop.
