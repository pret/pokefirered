	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start walkrun_is_standing_still
walkrun_is_standing_still: @ 8069554
	push {lr}
	ldr r0, _08069564 @ =gUnknown_2037078
	ldrb r0, [r0, 0x3]
	cmp r0, 0x1
	beq _08069568
	movs r0, 0x1
	b _0806956A
	.align 2, 0
_08069564: .4byte gUnknown_2037078
_08069568:
	movs r0, 0
_0806956A:
	pop {r1}
	bx r1
	thumb_func_end walkrun_is_standing_still

	thumb_func_start sub_8069570
sub_8069570: @ 8069570
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl walkrun_is_standing_still
	lsls r0, 24
	cmp r0, 0
	beq _0806958A
	bl sub_805C270
	adds r0, r4, 0
	bl DestroyTask
_0806958A:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8069570

	thumb_func_start sub_8069590
sub_8069590: @ 8069590
	push {lr}
	ldr r0, _080695A8 @ =sub_8069570
	bl FuncIsActiveTask
	lsls r0, 24
	cmp r0, 0
	bne _080695AC
	bl sub_805C780
	movs r0, 0x1
	b _080695AE
	.align 2, 0
_080695A8: .4byte sub_8069570
_080695AC:
	movs r0, 0
_080695AE:
	pop {r1}
	bx r1
	thumb_func_end sub_8069590

	thumb_func_start ScriptFreezeMapObjects
ScriptFreezeMapObjects: @ 80695B4
	push {lr}
	bl player_bitmagic
	ldr r0, _080695C8 @ =sub_8069570
	movs r1, 0x50
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_080695C8: .4byte sub_8069570
	thumb_func_end ScriptFreezeMapObjects

	thumb_func_start sub_80695CC
sub_80695CC: @ 80695CC
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	ldr r1, _0806963C @ =gTasks
	adds r5, r0, r1
	movs r1, 0x8
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _080695F6
	bl walkrun_is_standing_still
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x1
	bne _080695F6
	bl sub_805C270
	strh r4, [r5, 0x8]
_080695F6:
	movs r1, 0xA
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _0806961E
	ldr r2, _08069640 @ =gMapObjects
	ldr r0, _08069644 @ =gUnknown_3005074
	ldrb r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r1, r0, r2
	ldrb r0, [r1]
	lsls r0, 30
	cmp r0, 0
	blt _0806961E
	adds r0, r1, 0
	bl FreezeMapObject
	movs r0, 0x1
	strh r0, [r5, 0xA]
_0806961E:
	movs r1, 0x8
	ldrsh r0, [r5, r1]
	cmp r0, 0
	beq _08069634
	movs r1, 0xA
	ldrsh r0, [r5, r1]
	cmp r0, 0
	beq _08069634
	adds r0, r6, 0
	bl DestroyTask
_08069634:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806963C: .4byte gTasks
_08069640: .4byte gMapObjects
_08069644: .4byte gUnknown_3005074
	thumb_func_end sub_80695CC

	thumb_func_start sub_8069648
sub_8069648: @ 8069648
	push {lr}
	ldr r0, _08069660 @ =sub_80695CC
	bl FuncIsActiveTask
	lsls r0, 24
	cmp r0, 0
	bne _08069664
	bl sub_805C780
	movs r0, 0x1
	b _08069666
	.align 2, 0
_08069660: .4byte sub_80695CC
_08069664:
	movs r0, 0
_08069666:
	pop {r1}
	bx r1
	thumb_func_end sub_8069648

	thumb_func_start LockSelectedMapObject
LockSelectedMapObject: @ 806966C
	push {r4,r5,lr}
	ldr r4, _080696B0 @ =gUnknown_3005074
	ldrb r0, [r4]
	bl FreezeMapObjectsExceptOne
	ldr r0, _080696B4 @ =sub_80695CC
	movs r1, 0x50
	bl CreateTask
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r2, _080696B8 @ =gMapObjects
	ldrb r1, [r4]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r1, r0, r2
	ldrb r0, [r1]
	lsls r0, 30
	cmp r0, 0
	blt _080696AA
	adds r0, r1, 0
	bl FreezeMapObject
	ldr r0, _080696BC @ =gTasks
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	movs r0, 0x1
	strh r0, [r1, 0xA]
_080696AA:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080696B0: .4byte gUnknown_3005074
_080696B4: .4byte sub_80695CC
_080696B8: .4byte gMapObjects
_080696BC: .4byte gTasks
	thumb_func_end LockSelectedMapObject

	thumb_func_start sub_80696C0
sub_80696C0: @ 80696C0
	push {lr}
	movs r0, 0xFF
	movs r1, 0
	movs r2, 0
	bl GetFieldObjectIdByLocalIdAndMap
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080696EC @ =gMapObjects
	adds r0, r1
	bl FieldObjectClearAnimIfSpecialAnimFinished
	bl sub_80974D8
	bl UnfreezeMapObjects
	pop {r0}
	bx r0
	.align 2, 0
_080696EC: .4byte gMapObjects
	thumb_func_end sub_80696C0

	thumb_func_start sub_80696F0
sub_80696F0: @ 80696F0
	push {r4,lr}
	ldr r4, _08069738 @ =gMapObjects
	ldr r0, _0806973C @ =gUnknown_3005074
	ldrb r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r1, r0, r4
	ldrb r0, [r1]
	lsls r0, 31
	cmp r0, 0
	beq _0806970E
	adds r0, r1, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
_0806970E:
	movs r0, 0xFF
	movs r1, 0
	movs r2, 0
	bl GetFieldObjectIdByLocalIdAndMap
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl FieldObjectClearAnimIfSpecialAnimFinished
	bl sub_80974D8
	bl UnfreezeMapObjects
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08069738: .4byte gMapObjects
_0806973C: .4byte gUnknown_3005074
	thumb_func_end sub_80696F0

	thumb_func_start sub_8069740
sub_8069740: @ 8069740
	push {lr}
	ldr r0, _0806975C @ =gUnknown_3005074
	ldrb r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08069760 @ =gMapObjects
	adds r0, r1
	ldr r1, _08069764 @ =gUnknown_20370D4
	ldrb r1, [r1]
	bl FieldObjectFaceOppositeDirection
	pop {r0}
	bx r0
	.align 2, 0
_0806975C: .4byte gUnknown_3005074
_08069760: .4byte gMapObjects
_08069764: .4byte gUnknown_20370D4
	thumb_func_end sub_8069740

	thumb_func_start sub_8069768
sub_8069768: @ 8069768
	push {lr}
	ldr r0, _08069780 @ =gUnknown_3005074
	ldrb r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08069784 @ =gMapObjects
	adds r0, r1
	bl FieldObjectClearAnimIfSpecialAnimActive
	pop {r0}
	bx r0
	.align 2, 0
_08069780: .4byte gUnknown_3005074
_08069784: .4byte gMapObjects
	thumb_func_end sub_8069768

	.align 2, 0 @ Don't pad with nop.
