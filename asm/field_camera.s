	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start move_tilemap_camera_to_upper_left_corner_
move_tilemap_camera_to_upper_left_corner_: @ 805A5A8
	movs r1, 0
	strb r1, [r0, 0x2]
	strb r1, [r0, 0x3]
	strb r1, [r0]
	strb r1, [r0, 0x1]
	movs r1, 0x1
	strb r1, [r0, 0x4]
	bx lr
	thumb_func_end move_tilemap_camera_to_upper_left_corner_

	thumb_func_start tilemap_move_something
tilemap_move_something: @ 805A5B8
	ldrb r3, [r0, 0x2]
	adds r3, r1
	strb r3, [r0, 0x2]
	ldrb r1, [r0, 0x2]
	movs r3, 0x1F
	ands r1, r3
	strb r1, [r0, 0x2]
	ldrb r1, [r0, 0x3]
	adds r1, r2
	strb r1, [r0, 0x3]
	ldrb r1, [r0, 0x3]
	ands r1, r3
	strb r1, [r0, 0x3]
	bx lr
	thumb_func_end tilemap_move_something

	thumb_func_start coords8_add
coords8_add: @ 805A5D4
	ldrb r3, [r0]
	adds r3, r1
	strb r3, [r0]
	ldrb r1, [r0, 0x1]
	adds r1, r2
	strb r1, [r0, 0x1]
	bx lr
	thumb_func_end coords8_add

	thumb_func_start move_tilemap_camera_to_upper_left_corner
move_tilemap_camera_to_upper_left_corner: @ 805A5E4
	push {lr}
	ldr r0, _0805A5F0 @ =gUnknown_3000E90
	bl move_tilemap_camera_to_upper_left_corner_
	pop {r0}
	bx r0
	.align 2, 0
_0805A5F0: .4byte gUnknown_3000E90
	thumb_func_end move_tilemap_camera_to_upper_left_corner

	thumb_func_start FieldUpdateBgTilemapScroll
FieldUpdateBgTilemapScroll: @ 805A5F4
	push {r4,r5,lr}
	ldr r1, _0805A64C @ =gUnknown_3000E90
	ldr r0, _0805A650 @ =gUnknown_3000E98
	movs r2, 0
	ldrsh r5, [r0, r2]
	ldrb r0, [r1]
	adds r5, r0
	ldr r0, _0805A654 @ =gUnknown_3000E9A
	movs r2, 0
	ldrsh r4, [r0, r2]
	ldrb r1, [r1, 0x1]
	adds r4, r1
	adds r4, 0x8
	lsls r5, 16
	lsrs r5, 16
	movs r0, 0x14
	adds r1, r5, 0
	bl SetGpuReg
	lsls r4, 16
	lsrs r4, 16
	movs r0, 0x16
	adds r1, r4, 0
	bl SetGpuReg
	movs r0, 0x18
	adds r1, r5, 0
	bl SetGpuReg
	movs r0, 0x1A
	adds r1, r4, 0
	bl SetGpuReg
	movs r0, 0x1C
	adds r1, r5, 0
	bl SetGpuReg
	movs r0, 0x1E
	adds r1, r4, 0
	bl SetGpuReg
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805A64C: .4byte gUnknown_3000E90
_0805A650: .4byte gUnknown_3000E98
_0805A654: .4byte gUnknown_3000E9A
	thumb_func_end FieldUpdateBgTilemapScroll

	thumb_func_start sub_805A658
sub_805A658: @ 805A658
	push {r4,lr}
	ldr r3, _0805A678 @ =gUnknown_3000E90
	ldr r2, _0805A67C @ =gUnknown_3000E98
	ldrh r2, [r2]
	ldrb r4, [r3]
	adds r2, r4
	strh r2, [r0]
	ldr r0, _0805A680 @ =gUnknown_3000E9A
	ldrh r0, [r0]
	ldrb r3, [r3, 0x1]
	adds r0, r3
	adds r0, 0x8
	strh r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805A678: .4byte gUnknown_3000E90
_0805A67C: .4byte gUnknown_3000E98
_0805A680: .4byte gUnknown_3000E9A
	thumb_func_end sub_805A658

	thumb_func_start DrawWholeMapView
DrawWholeMapView: @ 805A684
	push {lr}
	ldr r0, _0805A6A0 @ =gUnknown_3005008
	ldr r1, [r0]
	movs r2, 0
	ldrsh r0, [r1, r2]
	movs r2, 0x2
	ldrsh r1, [r1, r2]
	ldr r2, _0805A6A4 @ =gUnknown_2036DFC
	ldr r2, [r2]
	bl DrawWholeMapViewInternal
	pop {r0}
	bx r0
	.align 2, 0
_0805A6A0: .4byte gUnknown_3005008
_0805A6A4: .4byte gUnknown_2036DFC
	thumb_func_end DrawWholeMapView

	thumb_func_start DrawWholeMapViewInternal
DrawWholeMapViewInternal: @ 805A6A8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	mov r10, r0
	mov r9, r1
	mov r8, r2
	movs r1, 0
_0805A6BC:
	ldr r2, _0805A728 @ =gUnknown_3000E90
	ldrb r0, [r2, 0x3]
	adds r0, r1, r0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1F
	bls _0805A6D0
	subs r0, 0x20
	lsls r0, 24
	lsrs r0, 24
_0805A6D0:
	lsls r6, r0, 5
	movs r4, 0
	adds r7, r1, 0x2
	str r7, [sp]
	lsrs r5, r1, 1
_0805A6DA:
	ldr r1, _0805A728 @ =gUnknown_3000E90
	ldrb r0, [r1, 0x2]
	adds r0, r4, r0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1F
	bls _0805A6EE
	subs r0, 0x20
	lsls r0, 24
	lsrs r0, 24
_0805A6EE:
	adds r1, r6, r0
	lsls r1, 16
	lsrs r1, 16
	lsrs r2, r4, 1
	add r2, r10
	mov r0, r8
	mov r7, r9
	adds r3, r7, r5
	bl sub_805A948
	adds r0, r4, 0x2
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x1F
	bls _0805A6DA
	ldr r1, [sp]
	lsls r0, r1, 24
	lsrs r1, r0, 24
	cmp r1, 0x1F
	bls _0805A6BC
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805A728: .4byte gUnknown_3000E90
	thumb_func_end DrawWholeMapViewInternal

	thumb_func_start RedrawMapSlicesForCameraUpdate
RedrawMapSlicesForCameraUpdate: @ 805A72C
	push {r4-r7,lr}
	adds r5, r0, 0
	adds r6, r1, 0
	adds r7, r2, 0
	ldr r0, _0805A774 @ =gUnknown_2036DFC
	ldr r4, [r0]
	cmp r6, 0
	ble _0805A744
	adds r0, r5, 0
	adds r1, r4, 0
	bl RedrawMapSliceWest
_0805A744:
	cmp r6, 0
	bge _0805A750
	adds r0, r5, 0
	adds r1, r4, 0
	bl RedrawMapSliceEast
_0805A750:
	cmp r7, 0
	ble _0805A75C
	adds r0, r5, 0
	adds r1, r4, 0
	bl RedrawMapSliceNorth
_0805A75C:
	cmp r7, 0
	bge _0805A768
	adds r0, r5, 0
	adds r1, r4, 0
	bl RedrawMapSliceSouth
_0805A768:
	movs r0, 0x1
	strb r0, [r5, 0x4]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805A774: .4byte gUnknown_2036DFC
	thumb_func_end RedrawMapSlicesForCameraUpdate

	thumb_func_start RedrawMapSliceNorth
RedrawMapSliceNorth: @ 805A778
	push {r4-r7,lr}
	adds r5, r0, 0
	adds r7, r1, 0
	ldrb r0, [r5, 0x3]
	adds r0, 0x1C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1F
	bls _0805A790
	subs r0, 0x20
	lsls r0, 24
	lsrs r0, 24
_0805A790:
	lsls r6, r0, 5
	movs r4, 0
_0805A794:
	ldrb r0, [r5, 0x2]
	adds r0, r4, r0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1F
	bls _0805A7A6
	subs r0, 0x20
	lsls r0, 24
	lsrs r0, 24
_0805A7A6:
	adds r1, r6, r0
	lsls r1, 16
	lsrs r1, 16
	ldr r0, _0805A7D4 @ =gUnknown_3005008
	ldr r3, [r0]
	movs r0, 0
	ldrsh r2, [r3, r0]
	lsrs r0, r4, 1
	adds r2, r0
	movs r0, 0x2
	ldrsh r3, [r3, r0]
	adds r3, 0xE
	adds r0, r7, 0
	bl sub_805A948
	adds r0, r4, 0x2
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x1F
	bls _0805A794
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805A7D4: .4byte gUnknown_3005008
	thumb_func_end RedrawMapSliceNorth

	thumb_func_start RedrawMapSliceSouth
RedrawMapSliceSouth: @ 805A7D8
	push {r4-r7,lr}
	adds r5, r0, 0
	adds r7, r1, 0
	ldrb r0, [r5, 0x3]
	lsls r6, r0, 5
	movs r4, 0
_0805A7E4:
	ldrb r0, [r5, 0x2]
	adds r0, r4, r0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1F
	bls _0805A7F6
	subs r0, 0x20
	lsls r0, 24
	lsrs r0, 24
_0805A7F6:
	adds r1, r6, r0
	ldr r0, _0805A820 @ =gUnknown_3005008
	ldr r3, [r0]
	movs r0, 0
	ldrsh r2, [r3, r0]
	lsrs r0, r4, 1
	adds r2, r0
	movs r0, 0x2
	ldrsh r3, [r3, r0]
	adds r0, r7, 0
	bl sub_805A948
	adds r0, r4, 0x2
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x1F
	bls _0805A7E4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805A820: .4byte gUnknown_3005008
	thumb_func_end RedrawMapSliceSouth

	thumb_func_start RedrawMapSliceEast
RedrawMapSliceEast: @ 805A824
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r5, r0, 0
	mov r8, r1
	ldrb r6, [r5, 0x2]
	movs r4, 0
_0805A832:
	ldrb r0, [r5, 0x3]
	adds r0, r4, r0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1F
	bls _0805A844
	subs r0, 0x20
	lsls r0, 24
	lsrs r0, 24
_0805A844:
	lsls r1, r0, 5
	adds r1, r6
	lsls r1, 16
	lsrs r1, 16
	ldr r0, _0805A878 @ =gUnknown_3005008
	ldr r0, [r0]
	movs r3, 0
	ldrsh r2, [r0, r3]
	movs r7, 0x2
	ldrsh r3, [r0, r7]
	lsrs r0, r4, 1
	adds r3, r0
	mov r0, r8
	bl sub_805A948
	adds r0, r4, 0x2
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x1F
	bls _0805A832
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805A878: .4byte gUnknown_3005008
	thumb_func_end RedrawMapSliceEast

	thumb_func_start RedrawMapSliceWest
RedrawMapSliceWest: @ 805A87C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r6, r0, 0
	mov r8, r1
	ldrb r0, [r6, 0x2]
	adds r0, 0x1C
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x1F
	bls _0805A89A
	adds r0, r5, 0
	subs r0, 0x20
	lsls r0, 24
	lsrs r5, r0, 24
_0805A89A:
	movs r4, 0
_0805A89C:
	ldrb r0, [r6, 0x3]
	adds r0, r4, r0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1F
	bls _0805A8AE
	subs r0, 0x20
	lsls r0, 24
	lsrs r0, 24
_0805A8AE:
	lsls r1, r0, 5
	adds r1, r5
	lsls r1, 16
	lsrs r1, 16
	ldr r0, _0805A8E4 @ =gUnknown_3005008
	ldr r0, [r0]
	movs r3, 0
	ldrsh r2, [r0, r3]
	adds r2, 0xE
	movs r7, 0x2
	ldrsh r3, [r0, r7]
	lsrs r0, r4, 1
	adds r3, r0
	mov r0, r8
	bl sub_805A948
	adds r0, r4, 0x2
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x1F
	bls _0805A89C
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805A8E4: .4byte gUnknown_3005008
	thumb_func_end RedrawMapSliceWest

	thumb_func_start CurrentMapDrawMetatileAt
CurrentMapDrawMetatileAt: @ 805A8E8
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r0, _0805A914 @ =gUnknown_3000E90
	adds r1, r4, 0
	adds r2, r5, 0
	bl MapPosToBgTilemapOffset
	adds r1, r0, 0
	cmp r1, 0
	blt _0805A90E
	ldr r0, _0805A918 @ =gUnknown_2036DFC
	ldr r0, [r0]
	lsls r1, 16
	lsrs r1, 16
	adds r2, r4, 0
	adds r3, r5, 0
	bl sub_805A948
_0805A90E:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805A914: .4byte gUnknown_3000E90
_0805A918: .4byte gUnknown_2036DFC
	thumb_func_end CurrentMapDrawMetatileAt

	thumb_func_start sub_805A91C
sub_805A91C: @ 805A91C
	push {r4,r5,lr}
	adds r3, r0, 0
	adds r4, r1, 0
	adds r5, r2, 0
	ldr r0, _0805A944 @ =gUnknown_3000E90
	adds r1, r3, 0
	adds r2, r4, 0
	bl MapPosToBgTilemapOffset
	cmp r0, 0
	blt _0805A93E
	lsls r2, r0, 16
	lsrs r2, 16
	movs r0, 0x1
	adds r1, r5, 0
	bl DrawMetatile
_0805A93E:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805A944: .4byte gUnknown_3000E90
	thumb_func_end sub_805A91C

	thumb_func_start sub_805A948
sub_805A948: @ 805A948
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r5, r0, 0
	adds r6, r2, 0
	adds r7, r3, 0
	lsls r1, 16
	lsrs r1, 16
	mov r8, r1
	adds r0, r6, 0
	adds r1, r7, 0
	bl sub_8058E48
	lsls r0, 16
	lsrs r4, r0, 16
	movs r0, 0x80
	lsls r0, 3
	cmp r4, r0
	bls _0805A970
	movs r4, 0
_0805A970:
	ldr r0, _0805A97C @ =0x0000027f
	cmp r4, r0
	bhi _0805A980
	ldr r0, [r5, 0x10]
	ldr r5, [r0, 0xC]
	b _0805A98C
	.align 2, 0
_0805A97C: .4byte 0x0000027f
_0805A980:
	ldr r0, [r5, 0x14]
	ldr r5, [r0, 0xC]
	ldr r1, _0805A9B0 @ =0xfffffd80
	adds r0, r4, r1
	lsls r0, 16
	lsrs r4, r0, 16
_0805A98C:
	lsls r0, r6, 16
	asrs r0, 16
	lsls r1, r7, 16
	asrs r1, 16
	bl sub_8058F8C
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r4, 4
	adds r1, r5, r1
	mov r2, r8
	bl DrawMetatile
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805A9B0: .4byte 0xfffffd80
	thumb_func_end sub_805A948

	thumb_func_start DrawMetatile
DrawMetatile: @ 805A9B4
	push {r4,lr}
	adds r4, r1, 0
	lsls r2, 16
	lsrs r2, 16
	cmp r0, 0x1
	beq _0805AA0C
	cmp r0, 0x1
	bgt _0805A9CA
	cmp r0, 0
	beq _0805AA6C
	b _0805AABE
_0805A9CA:
	cmp r0, 0x2
	bne _0805AABE
	ldr r0, _0805AA04 @ =gUnknown_300501C
	ldr r0, [r0]
	lsls r3, r2, 1
	adds r0, r3, r0
	ldrh r1, [r4]
	strh r1, [r0]
	ldrh r1, [r4, 0x2]
	strh r1, [r0, 0x2]
	adds r2, r0, 0
	adds r2, 0x40
	ldrh r1, [r4, 0x4]
	strh r1, [r2]
	adds r0, 0x42
	ldrh r1, [r4, 0x6]
	strh r1, [r0]
	ldr r0, _0805AA08 @ =gUnknown_3005014
	ldr r0, [r0]
	adds r0, r3, r0
	movs r2, 0
	strh r2, [r0]
	strh r2, [r0, 0x2]
	adds r1, r0, 0
	adds r1, 0x40
	strh r2, [r1]
	adds r0, 0x42
	strh r2, [r0]
	b _0805AAA2
	.align 2, 0
_0805AA04: .4byte gUnknown_300501C
_0805AA08: .4byte gUnknown_3005014
_0805AA0C:
	ldr r0, _0805AA60 @ =gUnknown_300501C
	ldr r0, [r0]
	lsls r3, r2, 1
	adds r0, r3, r0
	ldrh r1, [r4]
	strh r1, [r0]
	ldrh r1, [r4, 0x2]
	strh r1, [r0, 0x2]
	adds r2, r0, 0
	adds r2, 0x40
	ldrh r1, [r4, 0x4]
	strh r1, [r2]
	adds r0, 0x42
	ldrh r1, [r4, 0x6]
	strh r1, [r0]
	ldr r0, _0805AA64 @ =gUnknown_3005014
	ldr r0, [r0]
	adds r0, r3, r0
	ldrh r1, [r4, 0x8]
	strh r1, [r0]
	ldrh r1, [r4, 0xA]
	strh r1, [r0, 0x2]
	adds r2, r0, 0
	adds r2, 0x40
	ldrh r1, [r4, 0xC]
	strh r1, [r2]
	adds r0, 0x42
	ldrh r1, [r4, 0xE]
	strh r1, [r0]
	ldr r0, _0805AA68 @ =gUnknown_3005018
	ldr r0, [r0]
	adds r3, r0
	movs r1, 0
	strh r1, [r3]
	strh r1, [r3, 0x2]
	adds r0, r3, 0
	adds r0, 0x40
	strh r1, [r0]
	adds r3, 0x42
	strh r1, [r3]
	b _0805AABE
	.align 2, 0
_0805AA60: .4byte gUnknown_300501C
_0805AA64: .4byte gUnknown_3005014
_0805AA68: .4byte gUnknown_3005018
_0805AA6C:
	ldr r0, _0805AAD8 @ =gUnknown_300501C
	ldr r0, [r0]
	lsls r3, r2, 1
	adds r0, r3, r0
	ldr r1, _0805AADC @ =0x00003014
	adds r2, r1, 0
	strh r2, [r0]
	strh r2, [r0, 0x2]
	adds r1, r0, 0
	adds r1, 0x40
	strh r2, [r1]
	adds r0, 0x42
	strh r2, [r0]
	ldr r0, _0805AAE0 @ =gUnknown_3005014
	ldr r0, [r0]
	adds r0, r3, r0
	ldrh r1, [r4]
	strh r1, [r0]
	ldrh r1, [r4, 0x2]
	strh r1, [r0, 0x2]
	adds r2, r0, 0
	adds r2, 0x40
	ldrh r1, [r4, 0x4]
	strh r1, [r2]
	adds r0, 0x42
	ldrh r1, [r4, 0x6]
	strh r1, [r0]
_0805AAA2:
	ldr r0, _0805AAE4 @ =gUnknown_3005018
	ldr r0, [r0]
	adds r3, r0
	ldrh r0, [r4, 0x8]
	strh r0, [r3]
	ldrh r0, [r4, 0xA]
	strh r0, [r3, 0x2]
	adds r1, r3, 0
	adds r1, 0x40
	ldrh r0, [r4, 0xC]
	strh r0, [r1]
	adds r3, 0x42
	ldrh r0, [r4, 0xE]
	strh r0, [r3]
_0805AABE:
	movs r0, 0x1
	bl schedule_bg_copy_tilemap_to_vram
	movs r0, 0x2
	bl schedule_bg_copy_tilemap_to_vram
	movs r0, 0x3
	bl schedule_bg_copy_tilemap_to_vram
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805AAD8: .4byte gUnknown_300501C
_0805AADC: .4byte 0x00003014
_0805AAE0: .4byte gUnknown_3005014
_0805AAE4: .4byte gUnknown_3005018
	thumb_func_end DrawMetatile

	thumb_func_start MapPosToBgTilemapOffset
MapPosToBgTilemapOffset: @ 805AAE8
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r0, _0805AB18 @ =gUnknown_3005008
	ldr r3, [r0]
	movs r5, 0
	ldrsh r0, [r3, r5]
	subs r1, r0
	lsls r1, 1
	cmp r1, 0x1F
	bhi _0805AB12
	ldrb r0, [r4, 0x2]
	adds r1, r0
	cmp r1, 0x1F
	ble _0805AB06
	subs r1, 0x20
_0805AB06:
	movs r5, 0x2
	ldrsh r0, [r3, r5]
	subs r0, r2, r0
	lsls r2, r0, 1
	cmp r2, 0x1F
	bls _0805AB1C
_0805AB12:
	movs r0, 0x1
	negs r0, r0
	b _0805AB2A
	.align 2, 0
_0805AB18: .4byte gUnknown_3005008
_0805AB1C:
	ldrb r0, [r4, 0x3]
	adds r2, r0
	cmp r2, 0x1F
	ble _0805AB26
	subs r2, 0x20
_0805AB26:
	lsls r0, r2, 5
	adds r0, r1
_0805AB2A:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end MapPosToBgTilemapOffset

	thumb_func_start CameraUpdateCallback
CameraUpdateCallback: @ 805AB30
	push {lr}
	adds r3, r0, 0
	ldr r2, [r3, 0x4]
	cmp r2, 0
	beq _0805AB50
	ldr r1, _0805AB54 @ =gUnknown_202063C
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r1
	movs r2, 0x32
	ldrsh r1, [r0, r2]
	str r1, [r3, 0x8]
	movs r1, 0x34
	ldrsh r0, [r0, r1]
	str r0, [r3, 0xC]
_0805AB50:
	pop {r0}
	bx r0
	.align 2, 0
_0805AB54: .4byte gUnknown_202063C
	thumb_func_end CameraUpdateCallback

	thumb_func_start ResetCameraUpdateInfo
ResetCameraUpdateInfo: @ 805AB58
	ldr r1, _0805AB6C @ =gUnknown_3005050
	movs r0, 0
	str r0, [r1, 0x8]
	str r0, [r1, 0xC]
	str r0, [r1, 0x10]
	str r0, [r1, 0x14]
	str r0, [r1, 0x4]
	str r0, [r1]
	bx lr
	.align 2, 0
_0805AB6C: .4byte gUnknown_3005050
	thumb_func_end ResetCameraUpdateInfo

	thumb_func_start InitCameraUpdateCallback
InitCameraUpdateCallback: @ 805AB70
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r4, _0805ABA4 @ =gUnknown_3005050
	ldr r1, [r4, 0x4]
	cmp r1, 0
	beq _0805AB8C
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0805ABA8 @ =gUnknown_202063C
	adds r0, r1
	bl DestroySprite
_0805AB8C:
	adds r0, r5, 0
	bl AddCameraObject
	lsls r0, 24
	lsrs r0, 24
	str r0, [r4, 0x4]
	ldr r0, _0805ABAC @ =CameraUpdateCallback
	str r0, [r4]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805ABA4: .4byte gUnknown_3005050
_0805ABA8: .4byte gUnknown_202063C
_0805ABAC: .4byte CameraUpdateCallback
	thumb_func_end InitCameraUpdateCallback

	thumb_func_start CameraUpdate
CameraUpdate: @ 805ABB0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r6, _0805ACA4 @ =gUnknown_3005050
	ldr r1, [r6]
	cmp r1, 0
	beq _0805ABC4
	adds r0, r6, 0
	bl _call_via_r1
_0805ABC4:
	ldr r7, [r6, 0x8]
	ldr r0, [r6, 0xC]
	mov r8, r0
	movs r4, 0
	movs r5, 0
	ldr r1, [r6, 0x10]
	ldr r0, [r6, 0x14]
	cmp r1, 0
	bne _0805ABE2
	cmp r7, 0
	beq _0805ABE2
	subs r4, 0x1
	cmp r7, 0
	ble _0805ABE2
	movs r4, 0x1
_0805ABE2:
	cmp r0, 0
	bne _0805ABF6
	mov r2, r8
	cmp r2, 0
	beq _0805ABF6
	movs r5, 0x1
	negs r5, r5
	cmp r2, 0
	ble _0805ABF6
	movs r5, 0x1
_0805ABF6:
	cmp r1, 0
	beq _0805AC08
	cmn r1, r7
	bne _0805AC08
	movs r4, 0x1
	negs r4, r4
	cmp r7, 0
	ble _0805AC08
	movs r4, 0x1
_0805AC08:
	cmp r0, 0
	beq _0805AC1C
	mov r3, r8
	cmn r0, r3
	bne _0805AC1C
	movs r4, 0x1
	negs r4, r4
	cmp r3, 0
	ble _0805AC1C
	movs r4, 0x1
_0805AC1C:
	ldr r2, _0805ACA4 @ =gUnknown_3005050
	ldr r0, [r2, 0x10]
	adds r1, r0, r7
	str r1, [r2, 0x10]
	adds r0, r1, 0
	cmp r1, 0
	bge _0805AC2C
	adds r0, 0xF
_0805AC2C:
	asrs r0, 4
	lsls r0, 4
	subs r0, r1, r0
	str r0, [r2, 0x10]
	ldr r0, [r2, 0x14]
	mov r3, r8
	adds r1, r0, r3
	str r1, [r2, 0x14]
	adds r0, r1, 0
	cmp r1, 0
	bge _0805AC44
	adds r0, 0xF
_0805AC44:
	asrs r0, 4
	lsls r0, 4
	subs r0, r1, r0
	str r0, [r2, 0x14]
	cmp r4, 0
	bne _0805AC54
	cmp r5, 0
	beq _0805AC7E
_0805AC54:
	adds r0, r4, 0
	adds r1, r5, 0
	bl CameraMove
	adds r0, r4, 0
	adds r1, r5, 0
	bl UpdateFieldObjectsForCameraUpdate
	ldr r6, _0805ACA8 @ =gUnknown_3000E90
	lsls r4, 1
	lsls r5, 1
	adds r0, r6, 0
	adds r1, r4, 0
	adds r2, r5, 0
	bl tilemap_move_something
	adds r0, r6, 0
	adds r1, r4, 0
	adds r2, r5, 0
	bl RedrawMapSlicesForCameraUpdate
_0805AC7E:
	ldr r0, _0805ACA8 @ =gUnknown_3000E90
	adds r1, r7, 0
	mov r2, r8
	bl coords8_add
	ldr r1, _0805ACAC @ =gUnknown_300506C
	ldrh r0, [r1]
	subs r0, r7
	strh r0, [r1]
	ldr r1, _0805ACB0 @ =gUnknown_3005068
	ldrh r0, [r1]
	mov r2, r8
	subs r0, r2
	strh r0, [r1]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805ACA4: .4byte gUnknown_3005050
_0805ACA8: .4byte gUnknown_3000E90
_0805ACAC: .4byte gUnknown_300506C
_0805ACB0: .4byte gUnknown_3005068
	thumb_func_end CameraUpdate

	thumb_func_start sub_805ACB4
sub_805ACB4: @ 805ACB4
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl CameraMove
	lsls r0, r4, 16
	asrs r0, 16
	lsls r1, r5, 16
	asrs r1, 16
	bl UpdateFieldObjectsForCameraUpdate
	bl DrawWholeMapView
	ldr r1, _0805ACE8 @ =gUnknown_300506C
	lsls r4, 4
	ldrh r0, [r1]
	subs r0, r4
	strh r0, [r1]
	ldr r1, _0805ACEC @ =gUnknown_3005068
	lsls r5, 4
	ldrh r0, [r1]
	subs r0, r5
	strh r0, [r1]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805ACE8: .4byte gUnknown_300506C
_0805ACEC: .4byte gUnknown_3005068
	thumb_func_end sub_805ACB4

	thumb_func_start sub_805ACF0
sub_805ACF0: @ 805ACF0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r4, _0805ADCC @ =gUnknown_3005050
	ldr r1, [r4]
	cmp r1, 0
	beq _0805AD04
	adds r0, r4, 0
	bl _call_via_r1
_0805AD04:
	ldr r7, [r4, 0x8]
	ldr r0, [r4, 0xC]
	mov r8, r0
	movs r5, 0
	movs r6, 0
	ldr r1, [r4, 0x10]
	ldr r0, [r4, 0x14]
	cmp r1, 0
	bne _0805AD22
	cmp r7, 0
	beq _0805AD22
	subs r5, 0x1
	cmp r7, 0
	ble _0805AD22
	movs r5, 0x1
_0805AD22:
	cmp r0, 0
	bne _0805AD36
	mov r2, r8
	cmp r2, 0
	beq _0805AD36
	movs r6, 0x1
	negs r6, r6
	cmp r2, 0
	ble _0805AD36
	movs r6, 0x1
_0805AD36:
	cmp r1, 0
	beq _0805AD48
	cmn r1, r7
	bne _0805AD48
	movs r5, 0x1
	negs r5, r5
	cmp r7, 0
	ble _0805AD48
	movs r5, 0x1
_0805AD48:
	cmp r0, 0
	beq _0805AD5C
	mov r3, r8
	cmn r0, r3
	bne _0805AD5C
	movs r5, 0x1
	negs r5, r5
	cmp r3, 0
	ble _0805AD5C
	movs r5, 0x1
_0805AD5C:
	ldr r2, _0805ADCC @ =gUnknown_3005050
	ldr r0, [r2, 0x10]
	adds r1, r0, r7
	str r1, [r2, 0x10]
	adds r0, r1, 0
	cmp r1, 0
	bge _0805AD6C
	adds r0, 0xF
_0805AD6C:
	asrs r0, 4
	lsls r0, 4
	subs r0, r1, r0
	str r0, [r2, 0x10]
	ldr r0, [r2, 0x14]
	mov r3, r8
	adds r1, r0, r3
	str r1, [r2, 0x14]
	adds r0, r1, 0
	cmp r1, 0
	bge _0805AD84
	adds r0, 0xF
_0805AD84:
	asrs r0, 4
	lsls r0, 4
	subs r0, r1, r0
	str r0, [r2, 0x14]
	cmp r5, 0
	bne _0805AD94
	cmp r6, 0
	beq _0805ADB6
_0805AD94:
	adds r0, r5, 0
	adds r1, r6, 0
	bl CameraMove
	ldr r4, _0805ADD0 @ =gUnknown_3000E90
	lsls r5, 1
	lsls r6, 1
	adds r0, r4, 0
	adds r1, r5, 0
	adds r2, r6, 0
	bl tilemap_move_something
	adds r0, r4, 0
	adds r1, r5, 0
	adds r2, r6, 0
	bl RedrawMapSlicesForCameraUpdate
_0805ADB6:
	ldr r0, _0805ADD0 @ =gUnknown_3000E90
	adds r1, r7, 0
	mov r2, r8
	bl coords8_add
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805ADCC: .4byte gUnknown_3005050
_0805ADD0: .4byte gUnknown_3000E90
	thumb_func_end sub_805ACF0

	thumb_func_start SetCameraPanningCallback
SetCameraPanningCallback: @ 805ADD4
	ldr r1, _0805ADDC @ =gUnknown_3000EA0
	str r0, [r1]
	bx lr
	.align 2, 0
_0805ADDC: .4byte gUnknown_3000EA0
	thumb_func_end SetCameraPanningCallback

	thumb_func_start SetCameraPanning
SetCameraPanning: @ 805ADE0
	ldr r2, _0805ADF0 @ =gUnknown_3000E98
	strh r0, [r2]
	ldr r0, _0805ADF4 @ =gUnknown_3000E9A
	lsls r1, 16
	asrs r1, 16
	adds r1, 0x20
	strh r1, [r0]
	bx lr
	.align 2, 0
_0805ADF0: .4byte gUnknown_3000E98
_0805ADF4: .4byte gUnknown_3000E9A
	thumb_func_end SetCameraPanning

	thumb_func_start InstallCameraPanAheadCallback
InstallCameraPanAheadCallback: @ 805ADF8
	ldr r1, _0805AE14 @ =gUnknown_3000EA0
	ldr r0, _0805AE18 @ =CameraPanningCB_PanAhead
	str r0, [r1]
	ldr r1, _0805AE1C @ =gUnknown_3000E9C
	movs r0, 0
	strb r0, [r1]
	ldr r1, _0805AE20 @ =gUnknown_3000E98
	movs r0, 0
	strh r0, [r1]
	ldr r1, _0805AE24 @ =gUnknown_3000E9A
	movs r0, 0x20
	strh r0, [r1]
	bx lr
	.align 2, 0
_0805AE14: .4byte gUnknown_3000EA0
_0805AE18: .4byte CameraPanningCB_PanAhead
_0805AE1C: .4byte gUnknown_3000E9C
_0805AE20: .4byte gUnknown_3000E98
_0805AE24: .4byte gUnknown_3000E9A
	thumb_func_end InstallCameraPanAheadCallback

	thumb_func_start UpdateCameraPanning
UpdateCameraPanning: @ 805AE28
	push {lr}
	ldr r0, _0805AE58 @ =gUnknown_3000EA0
	ldr r0, [r0]
	cmp r0, 0
	beq _0805AE36
	bl _call_via_r0
_0805AE36:
	ldr r2, _0805AE5C @ =gUnknown_2021BC8
	ldr r0, _0805AE60 @ =gUnknown_300506C
	ldr r1, _0805AE64 @ =gUnknown_3000E98
	ldrh r0, [r0]
	ldrh r1, [r1]
	subs r0, r1
	strh r0, [r2]
	ldr r2, _0805AE68 @ =gUnknown_2021BCA
	ldr r0, _0805AE6C @ =gUnknown_3005068
	ldr r1, _0805AE70 @ =gUnknown_3000E9A
	ldrh r0, [r0]
	ldrh r1, [r1]
	subs r0, r1
	subs r0, 0x8
	strh r0, [r2]
	pop {r0}
	bx r0
	.align 2, 0
_0805AE58: .4byte gUnknown_3000EA0
_0805AE5C: .4byte gUnknown_2021BC8
_0805AE60: .4byte gUnknown_300506C
_0805AE64: .4byte gUnknown_3000E98
_0805AE68: .4byte gUnknown_2021BCA
_0805AE6C: .4byte gUnknown_3005068
_0805AE70: .4byte gUnknown_3000E9A
	thumb_func_end UpdateCameraPanning

	thumb_func_start CameraPanningCB_PanAhead
CameraPanningCB_PanAhead: @ 805AE74
	push {lr}
	ldr r0, _0805AE84 @ =gUnknown_2036E2C
	ldrb r0, [r0]
	cmp r0, 0
	bne _0805AE88
	bl InstallCameraPanAheadCallback
	b _0805AF10
	.align 2, 0
_0805AE84: .4byte gUnknown_2036E2C
_0805AE88:
	ldr r0, _0805AEA0 @ =gUnknown_2037078
	ldrb r0, [r0, 0x3]
	cmp r0, 0x1
	bne _0805AEA8
	ldr r0, _0805AEA4 @ =gUnknown_3000E9C
	ldrb r1, [r0]
	movs r2, 0x1
	eors r1, r2
	strb r1, [r0]
	cmp r1, 0
	beq _0805AF10
	b _0805AEAE
	.align 2, 0
_0805AEA0: .4byte gUnknown_2037078
_0805AEA4: .4byte gUnknown_3000E9C
_0805AEA8:
	ldr r1, _0805AED0 @ =gUnknown_3000E9C
	movs r0, 0
	strb r0, [r1]
_0805AEAE:
	bl player_get_direction_upper_nybble
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bne _0805AED8
	ldr r2, _0805AED4 @ =gUnknown_3000E9A
	ldrh r3, [r2]
	movs r0, 0
	ldrsh r1, [r2, r0]
	movs r0, 0x8
	negs r0, r0
	cmp r1, r0
	ble _0805AF10
	subs r0, r3, 0x2
	b _0805AF0E
	.align 2, 0
_0805AED0: .4byte gUnknown_3000E9C
_0805AED4: .4byte gUnknown_3000E9A
_0805AED8:
	cmp r0, 0x1
	bne _0805AEF4
	ldr r1, _0805AEF0 @ =gUnknown_3000E9A
	ldrh r2, [r1]
	movs r3, 0
	ldrsh r0, [r1, r3]
	cmp r0, 0x47
	bgt _0805AF10
	adds r0, r2, 0x2
	strh r0, [r1]
	b _0805AF10
	.align 2, 0
_0805AEF0: .4byte gUnknown_3000E9A
_0805AEF4:
	ldr r2, _0805AF04 @ =gUnknown_3000E9A
	ldrh r0, [r2]
	movs r3, 0
	ldrsh r1, [r2, r3]
	cmp r1, 0x1F
	bgt _0805AF08
	adds r0, 0x2
	b _0805AF0E
	.align 2, 0
_0805AF04: .4byte gUnknown_3000E9A
_0805AF08:
	cmp r1, 0x20
	ble _0805AF10
	subs r0, 0x2
_0805AF0E:
	strh r0, [r2]
_0805AF10:
	pop {r0}
	bx r0
	thumb_func_end CameraPanningCB_PanAhead

	.align 2, 0 @ Don't pad with nop.
