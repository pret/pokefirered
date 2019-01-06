	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_805AF14
sub_805AF14: @ 805AF14
	push {r4-r7,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r6, r2, 0
	adds r7, r3, 0
	ldrh r1, [r5, 0x2]
	ldr r0, _0805AF34 @ =0x0000ffff
	cmp r1, r0
	bne _0805AF38
	adds r0, r4, 0
	adds r1, r6, 0
	adds r2, r7, 0
	bl sub_805AF54
	b _0805AF4E
	.align 2, 0
_0805AF34: .4byte 0x0000ffff
_0805AF38:
	ldrh r1, [r5, 0x2]
	ldr r0, [r4, 0x4]
	adds r0, r1
	bl sub_805AF80
	ldr r3, [r4, 0x8]
	adds r0, r4, 0
	adds r1, r6, 0
	adds r2, r7, 0
	bl sub_805AF94
_0805AF4E:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_805AF14

	thumb_func_start sub_805AF54
sub_805AF54: @ 805AF54
	push {r4,r5,lr}
	adds r5, r1, 0
	adds r4, r2, 0
	ldrb r0, [r0, 0x3]
	cmp r0, 0
	bne _0805AF6A
	adds r0, r5, 0
	adds r1, r4, 0
	bl CurrentMapDrawMetatileAt
	b _0805AF7A
_0805AF6A:
	adds r0, r5, 0
	adds r1, r4, 0
	bl CurrentMapDrawMetatileAt
	subs r1, r4, 0x1
	adds r0, r5, 0
	bl CurrentMapDrawMetatileAt
_0805AF7A:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_805AF54

	thumb_func_start sub_805AF80
sub_805AF80: @ 805AF80
	push {lr}
	ldr r1, _0805AF90 @ =0x06007f00
	movs r2, 0x40
	bl CpuFastSet
	pop {r0}
	bx r0
	.align 2, 0
_0805AF90: .4byte 0x06007f00
	thumb_func_end sub_805AF80

	thumb_func_start sub_805AF94
sub_805AF94: @ 805AF94
	push {r4-r6,lr}
	sub sp, 0x10
	adds r5, r1, 0
	adds r6, r2, 0
	adds r4, r3, 0
	ldrb r0, [r0, 0x3]
	cmp r0, 0
	bne _0805AFB2
	movs r1, 0xFE
	lsls r1, 2
	mov r0, sp
	adds r2, r4, 0
	bl sub_805AFE8
	b _0805AFD4
_0805AFB2:
	movs r1, 0xFE
	lsls r1, 2
	mov r0, sp
	adds r2, r4, 0
	bl sub_805AFE8
	subs r1, r6, 0x1
	adds r0, r5, 0
	mov r2, sp
	bl sub_805A91C
	movs r1, 0xFF
	lsls r1, 2
	adds r2, r4, 0x4
	mov r0, sp
	bl sub_805AFE8
_0805AFD4:
	adds r0, r5, 0
	adds r1, r6, 0
	mov r2, sp
	bl sub_805A91C
	add sp, 0x10
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_805AF94

	thumb_func_start sub_805AFE8
sub_805AFE8: @ 805AFE8
	push {r4-r6,lr}
	adds r6, r0, 0
	lsls r1, 16
	lsrs r5, r1, 16
	movs r4, 0
	adds r1, r6, 0
_0805AFF4:
	ldrb r0, [r2]
	lsls r0, 28
	lsrs r3, r0, 16
	adds r2, 0x1
	adds r0, r5, r4
	orrs r3, r0
	strh r3, [r1]
	adds r1, 0x2
	adds r4, 0x1
	cmp r4, 0x3
	ble _0805AFF4
	cmp r4, 0x7
	bgt _0805B022
	lsls r0, r4, 1
	adds r1, r0, r6
_0805B012:
	ldrb r0, [r2]
	lsls r3, r0, 12
	adds r2, 0x1
	strh r3, [r1]
	adds r1, 0x2
	adds r4, 0x1
	cmp r4, 0x7
	ble _0805B012
_0805B022:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_805AFE8

	thumb_func_start sub_805B028
sub_805B028: @ 805B028
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r2, r4, 2
	adds r2, r4
	lsls r2, 3
	ldr r0, _0805B05C @ =gTasks+0x8
	adds r2, r0
	ldrh r1, [r2]
	lsls r1, 16
	ldrh r0, [r2, 0x2]
	orrs r1, r0
	ldrh r0, [r2, 0x4]
	lsls r0, 16
	ldrh r3, [r2, 0x6]
	orrs r0, r3
	bl sub_805B060
	cmp r0, 0
	bne _0805B056
	adds r0, r4, 0
	bl DestroyTask
_0805B056:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805B05C: .4byte gTasks+0x8
	thumb_func_end sub_805B028

	thumb_func_start sub_805B060
sub_805B060: @ 805B060
	push {r4-r6,lr}
	adds r6, r0, 0
	adds r5, r1, 0
	adds r4, r2, 0
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _0805B086
	movs r2, 0x8
	ldrsh r1, [r4, r2]
	lsls r1, 2
	adds r1, r5, r1
	movs r0, 0xC
	ldrsh r2, [r4, r0]
	movs r0, 0xE
	ldrsh r3, [r4, r0]
	adds r0, r6, 0
	bl sub_805AF14
_0805B086:
	movs r2, 0xA
	ldrsh r1, [r4, r2]
	movs r2, 0x8
	ldrsh r0, [r4, r2]
	lsls r0, 2
	adds r0, r5
	ldrb r0, [r0]
	cmp r1, r0
	bne _0805B0B4
	movs r0, 0
	strh r0, [r4, 0xA]
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	lsls r0, 2
	adds r0, r5
	ldrb r0, [r0]
	cmp r0, 0
	bne _0805B0BA
	movs r0, 0
	b _0805B0BC
_0805B0B4:
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
_0805B0BA:
	movs r0, 0x1
_0805B0BC:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_805B060

	thumb_func_start door_find
door_find: @ 805B0C4
	push {lr}
	adds r2, r0, 0
	lsls r1, 16
	lsrs r1, 16
	b _0805B0DA
_0805B0CE:
	ldrh r0, [r2]
	cmp r0, r1
	bne _0805B0D8
	adds r0, r2, 0
	b _0805B0E2
_0805B0D8:
	adds r2, 0xC
_0805B0DA:
	ldr r0, [r2, 0x4]
	cmp r0, 0
	bne _0805B0CE
	movs r0, 0
_0805B0E2:
	pop {r1}
	bx r1
	thumb_func_end door_find

	thumb_func_start task_overworld_door_add_if_inactive
task_overworld_door_add_if_inactive: @ 805B0E8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r6, r0, 0
	adds r5, r1, 0
	adds r7, r2, 0
	mov r8, r3
	ldr r4, _0805B134 @ =sub_805B028
	adds r0, r4, 0
	bl FuncIsActiveTask
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0805B13C
	adds r0, r4, 0
	movs r1, 0x50
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r2, _0805B138 @ =gTasks+0x8
	adds r1, r2
	strh r7, [r1, 0xC]
	mov r2, r8
	strh r2, [r1, 0xE]
	strh r5, [r1, 0x2]
	lsrs r2, r5, 16
	strh r2, [r1]
	strh r6, [r1, 0x6]
	lsrs r2, r6, 16
	strh r2, [r1, 0x4]
	lsls r0, 24
	asrs r0, 24
	b _0805B140
	.align 2, 0
_0805B134: .4byte sub_805B028
_0805B138: .4byte gTasks+0x8
_0805B13C:
	movs r0, 0x1
	negs r0, r0
_0805B140:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end task_overworld_door_add_if_inactive

	thumb_func_start DrawClosedDoor
DrawClosedDoor: @ 805B14C
	push {lr}
	bl sub_805AF54
	pop {r0}
	bx r0
	thumb_func_end DrawClosedDoor

	thumb_func_start sub_805B158
sub_805B158: @ 805B158
	push {r4-r6,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r6, r2, 0
	adds r0, r5, 0
	adds r1, r6, 0
	bl sub_8058E48
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	adds r0, r4, 0
	bl door_find
	adds r4, r0, 0
	cmp r0, 0
	beq _0805B196
	ldrb r0, [r0, 0x3]
	ldr r1, _0805B19C @ =gUnknown_835B49C
	cmp r0, 0
	bne _0805B184
	ldr r1, _0805B1A0 @ =gUnknown_835B488
_0805B184:
	adds r0, r1, 0
	bl sub_805B1A4
	adds r1, r0, 0
	adds r0, r4, 0
	adds r2, r5, 0
	adds r3, r6, 0
	bl sub_805AF14
_0805B196:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805B19C: .4byte gUnknown_835B49C
_0805B1A0: .4byte gUnknown_835B488
	thumb_func_end sub_805B158

	thumb_func_start sub_805B1A4
sub_805B1A4: @ 805B1A4
	push {lr}
	adds r1, r0, 0
	b _0805B1AC
_0805B1AA:
	adds r1, 0x4
_0805B1AC:
	ldrb r0, [r1]
	cmp r0, 0
	bne _0805B1AA
	subs r0, r1, 0x4
	pop {r1}
	bx r1
	thumb_func_end sub_805B1A4

	thumb_func_start sub_805B1B8
sub_805B1B8: @ 805B1B8
	push {r4-r6,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r6, r2, 0
	adds r0, r5, 0
	adds r1, r6, 0
	bl sub_8058E48
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	adds r0, r4, 0
	bl door_find
	adds r2, r0, 0
	adds r4, r2, 0
	cmp r2, 0
	bne _0805B1E2
	movs r0, 0x1
	negs r0, r0
	b _0805B204
_0805B1E2:
	ldrb r0, [r2, 0x3]
	cmp r0, 0
	beq _0805B1F4
	ldr r1, _0805B1F0 @ =gUnknown_835B49C
	adds r0, r2, 0
	b _0805B1F8
	.align 2, 0
_0805B1F0: .4byte gUnknown_835B49C
_0805B1F4:
	ldr r1, _0805B20C @ =gUnknown_835B488
	adds r0, r4, 0
_0805B1F8:
	adds r2, r5, 0
	adds r3, r6, 0
	bl task_overworld_door_add_if_inactive
	lsls r0, 24
	asrs r0, 24
_0805B204:
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0805B20C: .4byte gUnknown_835B488
	thumb_func_end sub_805B1B8

	thumb_func_start sub_805B210
sub_805B210: @ 805B210
	push {r4-r6,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r6, r2, 0
	adds r0, r5, 0
	adds r1, r6, 0
	bl sub_8058E48
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	adds r0, r4, 0
	bl door_find
	adds r2, r0, 0
	adds r4, r2, 0
	cmp r2, 0
	bne _0805B23A
	movs r0, 0x1
	negs r0, r0
	b _0805B25C
_0805B23A:
	ldrb r0, [r2, 0x3]
	cmp r0, 0
	beq _0805B24C
	ldr r1, _0805B248 @ =gUnknown_835B4C4
	adds r0, r2, 0
	b _0805B250
	.align 2, 0
_0805B248: .4byte gUnknown_835B4C4
_0805B24C:
	ldr r1, _0805B264 @ =gUnknown_835B4B0
	adds r0, r4, 0
_0805B250:
	adds r2, r5, 0
	adds r3, r6, 0
	bl task_overworld_door_add_if_inactive
	lsls r0, 24
	asrs r0, 24
_0805B25C:
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0805B264: .4byte gUnknown_835B4B0
	thumb_func_end sub_805B210

	thumb_func_start FieldSetDoorOpened
FieldSetDoorOpened: @ 805B268
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r0, r4, 16
	asrs r0, 16
	lsls r1, r5, 16
	asrs r1, 16
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	bl MetatileBehavior_IsWarpDoor_2
	lsls r0, 24
	cmp r0, 0
	beq _0805B292
	ldr r0, _0805B298 @ =gUnknown_835B5D8
	adds r1, r4, 0
	adds r2, r5, 0
	bl sub_805B158
_0805B292:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805B298: .4byte gUnknown_835B5D8
	thumb_func_end FieldSetDoorOpened

	thumb_func_start FieldSetDoorClosed
FieldSetDoorClosed: @ 805B29C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r0, r4, 16
	asrs r0, 16
	lsls r1, r5, 16
	asrs r1, 16
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	bl MetatileBehavior_IsWarpDoor_2
	lsls r0, 24
	cmp r0, 0
	beq _0805B2C6
	ldr r0, _0805B2CC @ =gUnknown_835B5D8
	adds r1, r4, 0
	adds r2, r5, 0
	bl DrawClosedDoor
_0805B2C6:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805B2CC: .4byte gUnknown_835B5D8
	thumb_func_end FieldSetDoorClosed

	thumb_func_start FieldAnimateDoorClose
FieldAnimateDoorClose: @ 805B2D0
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r0, r4, 16
	asrs r0, 16
	lsls r1, r5, 16
	asrs r1, 16
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	bl MetatileBehavior_IsWarpDoor_2
	lsls r0, 24
	cmp r0, 0
	beq _0805B304
	ldr r0, _0805B300 @ =gUnknown_835B5D8
	adds r1, r4, 0
	adds r2, r5, 0
	bl sub_805B210
	lsls r0, 24
	asrs r0, 24
	b _0805B308
	.align 2, 0
_0805B300: .4byte gUnknown_835B5D8
_0805B304:
	movs r0, 0x1
	negs r0, r0
_0805B308:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end FieldAnimateDoorClose

	thumb_func_start FieldAnimateDoorOpen
FieldAnimateDoorOpen: @ 805B310
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r0, r4, 16
	asrs r0, 16
	lsls r1, r5, 16
	asrs r1, 16
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	bl MetatileBehavior_IsWarpDoor_2
	lsls r0, 24
	cmp r0, 0
	beq _0805B344
	ldr r0, _0805B340 @ =gUnknown_835B5D8
	adds r1, r4, 0
	adds r2, r5, 0
	bl sub_805B1B8
	lsls r0, 24
	asrs r0, 24
	b _0805B348
	.align 2, 0
_0805B340: .4byte gUnknown_835B5D8
_0805B344:
	movs r0, 0x1
	negs r0, r0
_0805B348:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end FieldAnimateDoorOpen

	thumb_func_start FieldIsDoorAnimationRunning
FieldIsDoorAnimationRunning: @ 805B350
	push {lr}
	ldr r0, _0805B360 @ =sub_805B028
	bl FuncIsActiveTask
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_0805B360: .4byte sub_805B028
	thumb_func_end FieldIsDoorAnimationRunning

	thumb_func_start GetDoorSoundEffect
GetDoorSoundEffect: @ 805B364
	push {lr}
	adds r3, r0, 0
	adds r2, r1, 0
	ldr r0, _0805B37C @ =gUnknown_835B5D8
	adds r1, r3, 0
	bl sub_805B388
	lsls r0, 24
	cmp r0, 0
	beq _0805B380
	movs r0, 0x12
	b _0805B382
	.align 2, 0
_0805B37C: .4byte gUnknown_835B5D8
_0805B380:
	movs r0, 0xF1
_0805B382:
	pop {r1}
	bx r1
	thumb_func_end GetDoorSoundEffect

	thumb_func_start sub_805B388
sub_805B388: @ 805B388
	push {r4,lr}
	adds r4, r0, 0
	adds r0, r1, 0
	adds r1, r2, 0
	bl sub_8058E48
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	adds r0, r4, 0
	bl door_find
	cmp r0, 0
	beq _0805B3AC
	ldrb r0, [r0, 0x2]
	lsls r0, 24
	asrs r0, 24
	b _0805B3B0
_0805B3AC:
	movs r0, 0x1
	negs r0, r0
_0805B3B0:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_805B388

	.align 2, 0 @ Don't pad with nop.
