	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start task50_overworld_poison_effect
task50_overworld_poison_effect: @ 80A0DD8
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r1, _080A0DFC @ =gUnknown_3005098
	adds r1, r0, r1
	movs r3, 0
	ldrsh r0, [r1, r3]
	cmp r0, 0x1
	beq _080A0E16
	cmp r0, 0x1
	bgt _080A0E00
	cmp r0, 0
	beq _080A0E06
	b _080A0E32
	.align 2, 0
_080A0DFC: .4byte gUnknown_3005098
_080A0E00:
	cmp r0, 0x2
	beq _080A0E2A
	b _080A0E32
_080A0E06:
	ldrh r0, [r1, 0x2]
	adds r0, 0x1
	strh r0, [r1, 0x2]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	ble _080A0E32
	b _080A0E22
_080A0E16:
	ldrh r0, [r1, 0x2]
	subs r0, 0x1
	strh r0, [r1, 0x2]
	lsls r0, 16
	cmp r0, 0
	bne _080A0E32
_080A0E22:
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	b _080A0E32
_080A0E2A:
	adds r0, r2, 0
	bl DestroyTask
	b _080A0E42
_080A0E32:
	ldrb r1, [r1, 0x2]
	lsls r0, r1, 4
	orrs r0, r1
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	bl Unused_AdjustBgMosaic
_080A0E42:
	pop {r0}
	bx r0
	thumb_func_end task50_overworld_poison_effect

	thumb_func_start overworld_poison_effect
overworld_poison_effect: @ 80A0E48
	push {lr}
	movs r0, 0x48
	bl sub_80722CC
	ldr r0, _080A0E5C @ =task50_overworld_poison_effect
	movs r1, 0x50
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_080A0E5C: .4byte task50_overworld_poison_effect
	thumb_func_end overworld_poison_effect

	thumb_func_start c3_80A0DD8_is_running
c3_80A0DD8_is_running: @ 80A0E60
	push {lr}
	ldr r0, _080A0E70 @ =task50_overworld_poison_effect
	bl FuncIsActiveTask
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_080A0E70: .4byte task50_overworld_poison_effect
	thumb_func_end c3_80A0DD8_is_running

	.align 2, 0 @ Don't pad with nop.
